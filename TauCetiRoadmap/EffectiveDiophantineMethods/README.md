# Roadmap: effective Diophantine methods and exact rational points

**Summary.** Build exact data that turn effective bounds, descent, local integration and
finite sieves into complete lists of Diophantine solutions. The route runs from rational enclosures
of exact algebraic and p-adic values through exact logarithmic reduction and Mordell–Weil data
to Chabauty–Coleman, the Mordell–Weil sieve and explicit quadratic Chabauty. The endpoint is a
finite list with exact membership proofs and a completeness theorem carrying every arithmetic or
analytic assumption used to obtain it.

## Scope and ownership

This roadmap owns the scalar datum interfaces, quantitative logarithm errors, lattice
exclusion and finite enumeration witnesses, finite local-image checks, saturation and index
data, geometric Chabauty comparisons, and finite sieve and residue-disc soundness theorems.
Its modular and Chabauty examples (§§3.24–3.29, 4.23–4.25, 5.29 and 6.18–6.35) are conditional
applications to explicitly supplied exact data; checking those data must establish the claimed
bounds and complete lists rather than assume them. The four classical solved equations of
§§6.36–6.39 are unconditional theorems: the unit-group, class-number and prime-decomposition
facts about their three explicit number fields are targets of Layer 6, and every reduction
inequality is a step of their proofs.

Mathlib owns quotients, finite sets, number fields, heights, valuations, Hensel lifting, power
series, quadratic forms and Gram–Schmidt. Tau Ceti owns the existing elliptic descent map, the
abstract 2-Selmer group and rank bound, canonical heights, Néron–Tate pairings and regulators. These
are inputs to the finite data below. In particular, the existing rank bound is not a new
target.

`TauCetiRoadmap.RealAlgebraicGeometry`, Layer 1, owns Sturm–Tarski root counts, Thom encodings and
comparison of real algebraic roots. The selected-root data and quantitative refinement below
add a rational-width guarantee and a labelled embedding to that theory. They do not introduce a
second field of real algebraic numbers. `TauCetiRoadmap.IntegralLattices`, Layer 2, owns bounded-norm
finiteness, Hermite bounds and successive minima. The affine finite-set description here adds closed-boundary membership and exact distance
comparisons.
GeometryOfNumbersAndQuadraticArithmetic §5.1 supplies LLL reducedness, orthogonal-length
estimates and the short-vector factor. A reduced basis and integral inverse change-of-basis
matrices are explicit hypotheses of each application here. DiophantineApproximationAndTranscendence §§3.6–3.7 and `4.1–4.5`,
supplies the transcendence bounds and effective Diophantine finiteness theorems; this roadmap checks
their constants and numerical applications.

Tau Ceti supplies the principal-unit logarithm, its convergence and its deep-unit isometry:
`TauCeti.hasSum_log_of_mem_unitFiltration_one` and `TauCeti.valuation_log_sub_log` in
`TauCeti/NumberTheory/LocalField/Logarithm.lean`. Its restricted-series API supplies the last
Gauss-norm maximum through `TauCeti.PowerSeries.exists_isDistinguished` in
`TauCeti/RingTheory/PowerSeries/GaussNorm.lean`. Weierstrass preparation and uniqueness are
`TauCeti.PowerSeries.IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq` and
`TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq` in
`TauCeti/RingTheory/PowerSeries/Weierstrass/Preparation.lean`. These are suppliers for the
zero-count and root-perturbation comparisons.
ColemanIntegration, L0–L1, owns analytic primitives and Frobenius continuation;
AnabelianGeometryAndNonabelianChabauty §§2.0–2.7 and `6.1–6.8`, owns the universal unipotent connection,
quadratic Chabauty pairs and the determinant criterion. The geometric identification of abelian
integrals with regular Coleman integrals, the global abelian logarithm and its pairing come from
AnabelianGeometryAndNonabelianChabauty §5.8; their effective numerical applications and the explicit
finite data belong here. Jacobians and Abel–Jacobi come from
`TauCetiRoadmap.JacobianChallenge`, Layers D–F. The smooth relative Jacobian, its base change and its
reduction square needed here are constructed in §§4.1 and `5.11`, from the Picard and Néron-model
contracts below.

There is no general class-group, unit, ideal-factorisation, finite-group, model, Hecke, Frobenius,
Coleman-evaluation or L-value table algorithm in scope. The unit groups, class numbers and prime
decompositions of the three explicit fields of §§6.36–6.39 are theorems of Layer 6 about those
fields; every other application supplies such exact data with mathematical identifications and
error bounds. General number-field p-adic input uses its actual
completion and valuation; a rational-centred `Q_p` ball is only the degree-one case. The modular
rank-over-Q implication, CM dictionaries, Baran isomorphism, Bilu–Parent–Rebolledo uniformity input
and any unproved rank upper bound are explicit application hypotheses, stated where used. Thus a
conditional worked theorem does not assert that its numerical identities or these external
hypotheses have been formalised.

## Conventions

All integer and rational entries of a datum are exact. Real intervals and complex boxes are
closed and outward-rounded. Overlap alone does not in general prove equality of their contents; singleton
real intervals and complex boxes with both widths zero determine their enclosed value. An exact
algebraic value lives in an existing algebraic closure with a selected embedding; a datum adds
a nonzero squarefree polynomial and an isolating interval, box or disc for that value. The principal
complex argument lies in (`-π,π`]; numerical branch boxes avoid the closed negative real axis, and the
fixed logarithm of -1 is `iπ` when it appears separately in a linear form.

Write `ord_π(0)=+∞, ord_π(π)=1` and `e=ord_π(p)` in a finite extension of `Q_p`. Normalised `ord_p` is
`ord_π/e`. A ball `B(c,N)` means `ord_π(x-c)≥N`; in `Q_p` it is `‖x-c‖≤p^(-N)`. Mathlib's totalised
`padicValRat p 0 = 0` is never used as the mathematical valuation of zero. Every zero test precedes
a valuation or division test. Multiplication by p gains e digits in `ord_π` precision; division by a
nonzero scalar of valuation k loses k digits. For `p=3, B(3,4)·B(9,5)` is contained in `B(27,6)`,
whereas `B(0,4)` contains values of many valuations. For `e=2` the same multiplication by p gains two
`ord_π` digits.

For the Cartan examples, `X_s(ℓ)` and `X_ns(ℓ)` follow BDMTV's plus-level notation:
they are ModularCurvesPartII §9.6's `X_s⁺(ℓ)` and `X_ns⁺(ℓ)`. At odd primes
`C_s⁺(ℓ)` is the normalizer of the split Cartan. At `ℓ = 2` the supplier uses the
order-two stabilizer of the unordered coordinate lines, contained in the full normalizer
`GL₂(𝔽₂)` of the trivial diagonal subgroup. The modular quotient isomorphism uses this
line-pair stabilizer; the existence conclusion about normalizer images includes `ℓ = 2`.

The elliptic height `ĥ(P) = lim h_x(2ⁿP)/4ⁿ` is the full limiting logarithmic
x-height, as in `CanonicalHeight.Basic`. Thus `⟨P,Q⟩=(ĥ(P+Q)-ĥ(P)-ĥ(Q))/2` and `⟨P,P⟩=ĥ(P)`. Over a number field of degree d, pinned
heights are relative, and division by d gives the absolute full x-height. Cremona's full
x-height convention agrees with this native height. Silverman's (O)-height is half the
native height; both its point height and its error bounds are multiplied by two when used here. Archimedean
sums use weights `n_v/d`. At `O` the height is zero and no x-coordinate is read.

Lattice basis vectors are columns, coordinate maps multiply column vectors, and distances use
squared Euclidean norms until a positive square root is explicitly taken. Unit-log matrices have
embeddings as rows and fundamental units as columns. The p-adic lattice in §1.5 uses weighted b plus
the recorded target y, fixing the affine sign. Effective divisors are multisets; 2P is a point of
the symmetric square and is never discarded as a duplicate.

The named data below are mathematical objects with equations, inequalities and geometric
identifications. Validity means those conditions hold. The targets are existence, comparison,
finiteness, root-count and complete-solution-set theorems. Concrete class-group, finite-group,
model, Hecke, Frobenius, integral and L-value data are hypotheses with their exact identifications.
The exact scalar and logarithm-error results of Layers 0 and 2 establish the precision facts
used by the enumeration theorems. Conditional completeness carries its hypothesis `H` explicitly;
membership of every listed solution is unconditional.

## Build order

Build Layers 0–2 in numerical order. In Layer 3 use §§3.1–3.14, §3.20,
§§3.15–3.19, §3.23, §§3.21–3.22, then §§3.24–3.29. In Layer 4 use
§§4.1–4.10, §4.26, §4.11, §§4.13–4.14, §4.12, then §§4.15–4.25.
Build Layer 5 in numerical order. In Layer 6 use §§6.1–6.2, §§6.5–6.16,
§§6.3–6.4, §§6.17–6.21, §6.23a, §6.22, §6.23, then §§6.24–6.39.
Within §6.30 prove the small-level genera and
Fricke fixed-point count before the rational-point application. Section numbers
identify topics; this order specifies which results are available to each target.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 for the Lean statements in `Suggested.lean`. The mathematical
interfaces below also reuse the pinned library results described under scope. Additive quotients
use QuotientAddGroup, the additive versions of `QuotientGroup.mk'`, map, `map_mk', eq_iff_div_mem`, surjectivity and composition; no private quotient implementation is needed. Finite
enumerations use `Finset.filter`, image, `biUnion`, and the corresponding membership and
cardinality theorems. Subgroup index, map, comap and index-power membership have their native
meanings; the natural index is zero for infinite index, so finiteness hypotheses are essential
whenever index is used quantitatively.

For algebraic input use `PowerBasis.lift, PowerBasis.liftEquiv', NumberField.Embeddings.range_eval_eq_rootSet_minpoly`, minpoly, `Matrix.charpoly, Algebra.leftMulMatrix, Polynomial.primPart` and Mahler measure. The arbitrary-element
characteristic-polynomial tower identity in §0.10 is an additional target; the identity for a
power-basis generator alone does not supply it. Number-field height and denominator interfaces are
`NumberField.mulHeight₁_eq, natDenominator_le_mulHeight₁, Algebra.discr_mul_isIntegral_mem_adjoin` and `Algebra.isIntegral_natDenominator_smul`.
`NumberField.finite_setOfPred_mulHeight₁_le` gives finiteness; §0.11 supplies an explicit finite
coordinate cover. `hensels_lemma, PadicInt.appr, appr_spec, appr_lt, Padic.norm_eq_zpow_neg_valuation` and Dedekind height-one-prime valuations supply the existing
analytic and valuation carriers. `Real.exists_rat_eq_convergent` supplies Legendre's implication for
the exhaustive continued-fraction search.

For a nonsingular characteristic-not-two normal-form Weierstrass curve, use the actual
`WeierstrassCurve.Affine.μ, M, normM, localRes, localCondition, selmerGroupA` and
`selmerGroup₂`; in particular `ker_μ_eq, range_μ_le_selmerGroupA, range_μ_le_ker_normM, range_μ_le_selmerGroup₂, mem_selmerGroup₂_iff, card_range_μ, pow_rank_le_card_of_range_μ_le, card_ker_nsmul_two` and `fg_point_of_numberField`. Their hypotheses and exceptional points are
retained by every adapter. The finite good-place reverse inclusion is the extra theorem in §3.5. For
heights use `WeierstrassCurve.Affine.Point.canonicalHeight, naiveHeight, canonicalHeight_nsmul, naiveHeight_eq_logHeight₁, abs_canonicalHeight_sub_naiveHeight_le, neronTatePairing, neronTateGramMatrix`, PointModTorsion and `regulator_eq_abs_det_neronTateGramMatrix`. The
existential bounded-height difference is input infrastructure; §3.12 supplies explicit constants and
§3.13 finite error intervals.

The elliptic height module is `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight.Basic`:
`canonicalHeight` is the full x-height limit, `canonicalHeight_nsmul` is quadraticity, and
`neronTatePairing_apply` is half its polarization. The regulator is supplied by
`TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator` with the same pairing.
The principal-unit series and preparation declarations named under scope are used with their
complete ultrametric field and positive-radius hypotheses. No second logarithm, Gauss-norm
maximum or preparation construction is requested.

From GeometryOfNumbersAndQuadraticArithmetic §5.1 use `lllCoefficient`, IsLLLReduced,
its size and Lovász inequalities, §5.1.3's Gram–Schmidt growth and `lll_short_vector_factor (§5.1.4)`. Supply integer matrices U,V with `UV = VU = I` whenever a basis is changed;
reducedness of AU is a hypothesis. No reduction routine or termination theorem is consumed.

From HeightsRationalPointsAndObstructions §§1.17–1.19 use the local doubling index,
torsion specialization and two-isogeny Kummer coordinates, including the exceptional point
`(0,0)`, the quartic torsor and the kernel/image comparison. Elliptic rank bounds consume
Tau Ceti `pow_rank_le_card_of_range_μ_le` and `card_ker_nsmul_two`; §3.7 below owns only
the comparison of the explicitly described subgroup with those native inputs.

### From the geometric and arithmetic roadmaps

Each following contract is consumed with its stated domain, rather than by replacing its objects
with arbitrary types having similarly named fields.

From HeightsRationalPointsAndObstructions Layer 1: For the Jacobian `J` of a smooth proper
geometrically connected curve `C` over `ℚ` with `C(ℚ) ≠ ∅ (J(ℚ) = Pic⁰` points as in JacobianChallenge
Layer `D`): (a) `J(ℚ)` is a finitely generated abelian group; (b) for a prime q at which `C` has a smooth
proper model, a reduction homomorphism `J(ℚ) → J̃(𝔽_q)` compatible with reduction of points and
divisors, injective on torsion of order prime to q and on all torsion when `q ≥ 3`; (c) for an abelian
variety A of dimension g over `ℚ_p, A(ℚ_p)` has an open subgroup of finite index isomorphic to `ℤ_p^g`,
so `#A(ℚ_p)/2A(ℚ_p) = |2|_p^{-g}·#A(ℚ_p)[2]`.

From HeightsRationalPointsAndObstructions Layer 1: For `E : y² = x(x² + cx + d)` over `ℚ` with the
2-isogeny `φ : E → E′ (E′ : y² = x(x² − 2cx + c² − 4d)`) and its dual `φ′`: the Kummer map
`E(ℚ)/φ′(E′(ℚ)) → H¹(ℚ, E′[φ′]) ≅ ℚ^×/ℚ^{×2}` is `(x, y) ↦ x` (and `(0,0) ↦ d`); the `φ′-Selmer` group is
the set of `d₁` for which `v² = d₁u⁴ + cu² + d/d₁` is everywhere locally soluble; and its quotient by
the image of `E(ℚ)` is `Ш(E′/ℚ)[φ′]` (as defined in EllipticCurves Layer 7).

From HeightsRationalPointsAndObstructions Layer 0: Néron local heights on an elliptic curve `E` over a
number field `K`: functions `λ_v` on `E(K_v) ∖ {O}` for each place v, with `λ_v − ½log⁺|x|_v` bounded, and
`ĥ(P) = [K:ℚ]^{-1} Σ_v n_v λ_v(P)` for `P ∈ E(K) ∖ {O}`, where ĥ is Tau Ceti's
`WeierstrassCurve.Affine.Point.canonicalHeight` divided by `2[K:ℚ]`; normalised as in Silverman, Math.
Comp. 55 (1990) §3 `(λ(2P) = 4λ(P) − log|ψ₂(P)|_v + ¼log|Δ|_v)`.

From EllipticCurves Layer 3 (finite fields and Hasse bound): For an elliptic curve over a finite field `𝔽_q`, the group `Ẽ(𝔽_q)` as a finite abelian group with
its order, and Hasse's bound `|#Ẽ(𝔽_q) − q − 1| ≤ 2√q`, used for targets of reduction maps. The
genus-one torsor argument needed for quartic models is given in §3.9.

From EllipticCurves Layer 4 (local reduction and formal groups): Over `ℚ_p`: the point-level reduction map `E(ℚ_p) → Ẽ_ns(𝔽_p)` on a minimal model as a group homomorphism on `E₀(ℚ_p)`, the finite index of `E₀(ℚ_p)`, and
`E₁(ℚ_p) ≅ Ê(pℤ_p)` with the formal logarithm giving `Ê(p^rℤ_p) ≅ ℤ_p` for `r ≥ 2`.

From EllipticCurves Layer 6 (Mordell–Weil): Mordell–Weil over `ℚ (fg_point_of_numberField)`, the Lutz–Nagell integrality of torsion points on integral models, and
injectivity of `E(ℚ)_tors → Ẽ_ns(𝔽_p)` at good odd primes p.

From EllipticCurves Layer 7 (Selmer groups and Sha): The cohomological
2-Selmer group `Sel₂(E/ℚ)` and `Ш(E/ℚ)[2]` with the exact sequence `0 → E(ℚ)/2E(ℚ) → Sel₂ → Ш[2] → 0`, and
its comparison with the explicit étale-algebra group `selmerGroup₂`; for the 2-isogeny `φ′` the same for
`Sel^{(φ′)}` and `Ш[φ′]`.

From JacobianChallenge Layer `D` (relative Picard and Jacobian):
For a smooth proper geometrically connected curve `C` over `ℚ` with a rational point, `J(K) = Pic⁰_{C}(K)`
for fields `K ⊇ ℚ` as an abelian group of degree-zero divisor classes, functorial in `K`, so that `J(ℚ) → J(ℚ_p)` and divisor-class arithmetic are available.

From SchemeAndStackFoundations §§3.3, `3.8`: For a smooth projective geometrically integral curve `X` of
genus g over a field k with a rational point `O` and its Jacobian `J` (JacobianChallenge layers D–F):
(i) the pullback `ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹)` along `P ↦ [P − O]` is an isomorphism and does not
depend on `O`; (ii) Riemann–Roch consequences: a nonzero regular differential has a divisor of degree
2g − 2, so `Σ_{x ∈ X(k)} ord_x ω ≤ 2g − 2`; and every degree-zero class `D` satisfies `D + g·O ∼ E` with `E`
effective of degree g.

From JacobianChallenge Layer `C` use relative effective Cartier divisors, symmetric powers
Symᵈ `X`, their geometric points as degree-d effective divisors with multiplicities, and
cohomology/base change and upper semicontinuity for a proper flat family and a flat coherent
sheaf. From its Layer `D` use the relative Picard functor and Abel maps; its Layer `F` supplies
the Abel–Jacobi embedding. Specialization of a horizontal divisor is its schematic closure
restricted to the special fibre, with degree and line-bundle compatibility proved in §§4.1, `5.11`.
The symmetric-square application in §4.20 uses this geometric construction, including 2P.
From SchemeAndStackFoundations §2.20 use the relative dualizing module, its smooth-locus
identification, flat base change and `curve_dualizing_comparison`; StableReduction Layers 2
and 5 supply the Gorenstein curve dualizing sheaf and regular models. These are the canonical
sheaf contracts in §4.14 (Liu, Definition `6.4.7` and Theorem `6.4.9`).

From HeightsRationalPointsAndObstructions Layer 1: The Mordell–Weil theorem for abelian varieties
over number fields: for an abelian variety A over a number field `K` (in `ED.4`, the Jacobian of a
smooth projective curve over `ℚ), A(K`) is a finitely generated abelian group.

From DeligneWeightsAndPurity §§1.1–1.4: For an abelian variety A over `F_q`, construct its degree-2
`dim(A)` integral Frobenius characteristic polynomial `P` and the faithful Tate-realization comparison
proving `P(pi_A)=0` in `End(A)`. Prove the Weil estimate that every complex embedding of each Frobenius
eigenvalue has absolute value `sqrt(q)`, with explicit Tate-module versus dual `H^1` and
arithmetic/geometric Frobenius conventions. DeligneWeightsAndPurity Layer `DWP.1` supplies the polarized Rosati argument and these
realization comparisons.

From JacobianChallenge Layer `D` (relative Picard and Jacobian):
`Pic⁰` of a smooth proper geometrically connected curve over a field `(ℚ, ℚ_p, 𝔽_p)` as its Jacobian,
with points the degree-zero divisor classes when the curve has a rational divisor of degree one; the
Abel maps `Sym^d X → Pic^d` on symmetric powers.

From JacobianChallenge Layer `E` (abelian varieties): The Jacobian over `𝔽_p` and over
`ℚ_p` as an abelian variety; `J(𝔽_p)` is a finite group.

From AbelianSchemesAndArithmeticModuli A3.9 (`Polarization.rosati`), A6.14
(`rosatiPositivity`) and A6.15 (`rationalNSAmpleCone`): over an algebraically closed
field and with a polarization, `NS(A)⊗Q` identifies with the Rosati-fixed part of
`End⁰(A)`. Use these over `Qbar` with JacobianChallenge Layer E's principal theta
polarization. Rosati positivity forces its action on a totally real endomorphism
field to be the identity, as used in §6.19.

From JacobianChallenge Layer `F` (Abel–Jacobi): For a curve
of genus at least one with a rational point `x₀`, the Abel–Jacobi morphism is a closed immersion (the
Layer `F` closed-immersion theorem); in particular `x ↦ [x − x₀]` is injective on k-points, used over `𝔽_p`.

From StableReduction Layer 5 (regular and minimal models): Regular proper models and
smooth proper models of curves over `ℤ_(p)` or `ℤ_p`, with the reduction of rational points through
sections, and the regularity notion of the hypothesis of Bruin–Stoll Corollary `5.15`.

From EllipticCurves Layer 4 (local reduction and formal groups): The reduction map on points `E(ℚ_p) → Ẽ(𝔽_p)` for a
minimal Weierstrass equation with good reduction, as a group homomorphism with kernel `E₁(ℚ_p)`.

From AlgebraicCurves Layer 10 (hyperelliptic and plane models):
Hyperelliptic models `y² = f(x)` with f squarefree of degree 2g + 1 or 2g + 2, the genus formula, and
the places at infinity (one for odd degree; two, or a conjugate pair, for even degree).

From NeronModelsAndSemistableAbelianVarieties §3.8: For a smooth proper curve 𝒞 over a discrete
valuation ring `R` with geometrically connected fibres (in particular `R = ℤ_(p)): Pic⁰` of 𝒞/R is an
abelian scheme over `R` whose generic fibre is the Jacobian of `𝒞_K` and whose special fibre is the
Jacobian of `𝒞_k`; and for a horizontal relative divisor 𝒟 of degree zero on 𝒞 the class of `𝒪(𝒟)` in
`Pic⁰(R)` restricts to `[𝒟_K]` and `[𝒟_k]`. This is the smooth case of §3.8's degree-zero Picard of a
semistable curve, over a general DVR rather than a strictly henselian one.

From HeightsRationalPointsAndObstructions Layer 0: The Néron–Tate canonical height ĥ on `A(K)` for an
abelian variety A over a number field `K` with a symmetric ample class (for Jacobians, the theta
class): ĥ is a quadratic map over `ℤ (ĥ(nx) = n²ĥ(x)` and the parallelogram law), ĥ `≥ 0, ĥ(x) = 0` iff
x is torsion, and ĥ − h is bounded for the naive height of a symmetric projective embedding.

From HeightsRationalPointsAndObstructions §§1.15a–1.17: consume integral commutative formal
groups, formal identity charts for smooth groups over complete DVRs, the unique formal logarithm
and its isomorphism on ideals of depth greater than e/(p−1), and local doubling indices.
Section 3.1 specializes the index theorem through the pinned descent-kernel comparison.

From AnabelianGeometryAndNonabelianChabauty §5.8, paragraph *Local abelian logarithm*, use the
global logarithm `log_A : A(K) → Lie(A)(K)` of an arbitrary abelian variety over a finite extension
`K/ℚ_p`: it is additive, its differential at zero is the identity, its kernel on `A(K)` is the
finite torsion subgroup, it respects homomorphisms of abelian varieties and finite extensions, it
restricts to the normalised formal logarithm of HeightsRationalPointsAndObstructions §§1.15a–1.16
on a deep congruence subgroup, it extends to a locally analytic homomorphism on all of `A(ℂ_p)`,
it pairs with invariant differentials, and it is determined by its restriction to any open
subgroup. Section 4.2 compares its formal-coordinate presentation with this supplied logarithm.
For smooth proper geometrically connected curves with good reduction, use the same section's
paragraph *Coleman and abelian logarithm comparison*: the Coleman integral of a regular one-form
from the base point equals the pairing of the corresponding invariant differential with the
logarithm of the Abel–Jacobi image, with its base-point change law and its finite-extension and
`ℂ_p` evaluation laws. Section 4.6 specializes that equality to the numerical data here.

From AnabelianGeometryAndNonabelianChabauty §§6.1–6.8: consume the following geometric interfaces: (a) quadratic Chabauty pairs and
the determinant criterion (BDMTV §1.4 (5), Lemma `1.5`), with the K-equivariant variant replacing `E` by
`H⁰(Ω¹)^* ⊗_{K⊗Q_p} H⁰(Ω¹)^*` when the splitting of the Hodge filtration is K-equivariant (Remark `1.6`,
§1.7, Remark `3.9); (b`) Lemma `3.7` and Corollary `3.8`: for `r = g` with log : `J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^*` and a nice class `Z, θ = h_p(A_Z(b, ·))` and `Υ = {−Σ_{v∈T_0} h_v(A_Z(b, x_v)) : x_v∈X(Q_v)}` form a quadratic
Chabauty pair with endomorphism induced by `Z`, constant `[IA_Z(b)]` and pairing the global height,
using only `κ(J(Q)) ⊗ Q_p` (using the full tensor product); `Υ = {0}` under potentially good reduction everywhere (Lemma
`3.2`); the zero set is independent of the splitting and of the idèle class character (Remarks `3.10, 3.12); (c`) the filtered F-isocrystal `A_Z` (pushout of `A_2^dR` along `Z, (25)`), the comparison
`D_cris(A_Z(b, x)) ≅ x^*A_Z` of filtered `φ-modules` (Lemma `5.4`) and Nekovář's local height formula
(17); (d) Theorem `2.3: r < g + ρ − 1` implies `X(Q_p)_2` finite, with `X(Q) ⊆ X(Q_p)_2 ⊆ X(Q_p)_{U_Z}`;
(e) the class of a nice correspondence satisfies (a)–(d) (forward direction of Lemma `4.7` only),
and on a genus-g modular curve with absolutely simple Jacobian the correspondence
`(2g)T_q−tr_H¹(T_q)Id` is nice provided it is nonzero and self-adjoint and the
supplier’s remaining hypotheses hold. Its H¹-trace is zero. In genus three the coefficient
is 6; the matrices in §6.22 verify nonzeroness for q=7,11.
Here `θ−B=−Σ_{v≠p}h_v`. For the convention `ρ=h−h_p` use instead
the positive away-place sum set `−Υ`; transfer constants by negation. Both sets are `{0}`
in the potentially-good-reduction applications.
The prime-level local-height factorization used in §6.35 is a separate application
hypothesis specified below (BDMTV 2021 Theorem 3.2).

From AnabelianGeometryAndNonabelianChabauty §§2.0–2.7: consume the following connection and path interfaces: Kim's universal pointed unipotent connection `A_n^dR(Y) = ⊕_{i≤n} V_dR(Y)^{⊗i} ⊗ O_Y` with `∇` as in (21) and its universal property for pointed objects with v
in the fibre at b (Theorem `4.2` with the distinguished vector in the fibre at b); Corollary `4.4 (A_n^dR(X)|_Y` is the maximal
quotient extending holomorphically to `X`); path composition (Lemma `4.3`); Hadian's characterisation of
the Hodge filtration (Theorem `4.5`); the Frobenius structure on `A_n^rig(b)`, unique with `1 ↦ 1` (Lemma
`5.2`), and Chiarellotto–Le Stum (Theorem `5.3`); Besser's identification of `v ↦ I(x_0, x)·v·I(b, b_0)`
with the unique unipotent Frobenius-equivariant isomorphism between path spaces (41); and
for a smooth projective curve X/Q the description of `H¹_dR(X/Q)` by differentials of the second kind
modulo exact ones on an affine open, with `Fil¹ = H⁰(X, Ω¹)` and `H¹_dR(X)/Fil¹ ≅ H¹(X, O_X)` realised
by the principal parts of local primitives (Mittag-Leffler; Tau Ceti AlgebraicCurves Layer 4
repartitions are the natural input).

From PadicDifferentialEquationsAndRigidCohomology §RD.7.18: Mathematical comparison for a supplied
plane-curve Frobenius lift `𝔽_p` on the weak completion of a model satisfying Tuitman's corrected Assumption 1, the Frobenius matrix `F` and primitives `f_i` with `𝔽_p^*ω_i = Σ_j F_ij ω_j + df_i`, and the identification of `F` with the rigid Frobenius on `H¹_rig` in the basis `ω`. Include functorial basis change, cup
compatibility and the identification needed by the local-height formulas. Concrete
Frobenius/coefficient/integral tables and their numerical generation are explicit ED consumer
hypotheses; the numerical tables are explicit hypotheses.

From ModularCurvesPartII §9.5 use `X_s(ℓ) ≅ X_0(ℓ²)/w_{ℓ²}` over `Q` and its
rational cusp. Section 9.6 supplies the Cartan and exceptional carriers; §9.7 supplies the
rational-point/Galois-image criterion for `j∉{0,1728}`, and the rational CM fibres of
`X_s(13)` over 0 and 1728. Section 9.8 supplies `gammaZeroPlus` and
`gammaZeroPlus.quotientMap` for `X₀⁺(N)`. The four small-level genera and the fixed-point
count of `w₄₉` are targets of §6.30 below.

From ModularCurvesPartII §11.8 use potential good reduction of `X_s(13)` at 13 and
good reduction away from 13, including at 2 for the first Baran model (Corollary 6.7).
For each prime-level application of §6.35 assume a regular proper semistable model over
`Z_N`, with its generic fibre identified with the smooth projective quotient `X₀⁺(N)`
and geometrically irreducible special fibre. Also supply the factorization of the
normalized local height `h_N` through the component reduction map: its value on
the component of the base point is zero. These are explicit application inputs,
not a consequence of the split-Cartan prime-square model. BDMTV 2021 Lemma 5.2,
pp.27–28, proves this prime-level fact using Xue's quotient of the Deligne–Rapoport
model; its Theorem 3.2, p.8, supplies the source for the height comparison.
The one-component reduction map and the normalized factorization give `h_N=0`.

From ModularCurvesPartII §§13.1–13.4 and `16.1–16.7` consume the actual weight-two
Jacobian quotients, their Hecke action, dimension and differential comparison. The decomposition
of `Jac(X₀⁺(N))` into the specified `w_N = +1` newform factors is an explicit application
hypothesis with its isogeny maps. The no-CM/no-inner-twist endomorphism comparison is the
mathematical target of §6.19 here. No general-weight modular quotient is used.

From ModularCurvesPartII §17.2: Construct the special-fibre Eichler-Shimura correspondence
identity, with actual Hecke correspondences, Frobenius/dual conventions, smooth or semistable model
and the comparison with the Jacobian/de Rham or crystalline realization used here. Supply the
bad-prime patching and cusp/Abel-Jacobi compatibilities under the stated level hypotheses. The quadratic Chabauty
comparison and its T7/T11 Tate classes require the actual identity and comparison, not merely a
matrix that satisfies a linear relation.

From ModularCurvesPartII §§9.6 and 9.8: Construct the actual algebraic coarse modular curves and finite
quotient morphisms for `X_0(N)/<w_N>, N` in `{97,109,113,127,139,149,151,179,239}`, and for the
exceptional subgroup whose projective mod-13 image is S4. Use the ModularCurvesPartII §§9.6 and 9.8 coarse-space
program on the genuine modular stack presentations, with finite inertia, properness/normality and
required base-change hypotheses. Supply smooth projective Q-curves with the quotient maps and their
defining moduli problems. `ED.6` combines this algebraic object with the supplied exact
q-expansion/model comparison identities to certify the particular printed plane quartics.

From ModularCurvesPartII §§9.7–9.8: For the ModularCurvesPartII §§9.6 and 9.8 Cartan, exceptional `S4(13)`, and `X_0(N)/<w_N>`
coarse curves, supply the generic-fibre/moduli/correspondence comparison, components and determinant
data, cusp fields and the geometric identification of the listed cusp and CM fibres. In the
`X_0(N)/<w_N>` case the interpretation is an unordered N-isogenous pair; the function j on `X_0(N)` does
not generally descend to one j-map on the quotient. For `S4(13)` certify the actual modular j-map and
its three non-CM projective-S4 fibres together with the CM fibre. Use the true coarse moduli fibres
also at `j=0` and1728. The comparison includes these explicit fibres.

From ColemanIntegration §§L0.10, `L0.13, L0.17`: Provide the compatibility identification of the existing
principal-unit p-adic logarithm with `Σ(k≥1)(−1)^(k+1)(z−1)^k/k` on each finite `Q_p` extension, and its
power/additivity identities. The pinned `TauCeti.NumberTheory.LocalField.Logarithm` supplies principal-unit convergence. `ED.2` owns only the explicit finite-tail and
precision-loss bounds, not logarithm foundations.

### Explicit application inputs

A finite arithmetic presentation comes with an isomorphism to the actual number field, ideal class
group, unit group, Mordell–Weil subgroup or residue group it describes. Unit generators must
generate the full required unit group, with torsion and rank stated; a list of independent units is
insufficient. Quotient and Smith-form tables must enumerate every class. Model maps come with
inverse identities, smoothness and reduction comparisons. Frobenius and Hecke tables are identified
with the actual cohomological operators; a matrix identity alone does not make a matrix a geometric
Frobenius. L-derivative intervals come with error bounds and analytic
continuation/functional-equation hypotheses. A positive-width box containing zero alone
need not establish exact vanishing. A complex box with both widths zero at zero does establish it.

The modular rank-one input used in §6.21 states precisely: for the indicated weight-two newform f
with trivial character, quotient `A_f` of dimension `[K_f:Q]`, and every conjugate `f^σ` having a simple
zero at 1, the supplied admissible rank-one theorem gives `rank A_f(Q)=[K_f:Q]` and finite Sha. Its
admissibility includes a suitable imaginary quadratic field, the non-torsion Heegner trace, the
required endomorphism-order/isogeny comparison, and descent of the rank conclusion from that field
to `Q`. These hypotheses are not inferred from a theorem giving rank only over the quadratic field.
The conditional rank-over-Q application is a separate theorem here; no Gross–Zagier or Euler-system
roadmap is a prerequisite of this build.

The CM inputs shared by §§6.29–6.33 are explicit application hypotheses. Every CM j-invariant is
an algebraic integer. For an imaginary quadratic order `O` of class number one, its CM invariant is
rational and is realised by an elliptic curve over `Q` with geometric endomorphism ring `O`. At a prime
ℓ unramified in `O`, its residual image is contained in a split Cartan normaliser when ℓ splits in `O`,
and in a non-split Cartan normaliser when ℓ is inert in `O`.
For `ℓ=13` the seven distinct j-values displayed in §6.32 correspond to exactly the seven indicated
orders, under the actual modular j-map; this identification is independent of Baran's coordinate
isomorphism. Conversely, the identified CM fibres in §6.29 have precisely their displayed geometric
endomorphism orders. Small class numbers and their order/discriminant identifications are exact
supplied arithmetic data. These are assumptions of the conditional applications, rather than
prerequisites from a CM roadmap outside this build (BDMTV 2019, Corollary `1.3` and Remark `1.4, p.888`).

For genus-two height searches supply a positive-definite free Mordell–Weil height lattice, finite
torsion representatives, its Gram matrix and comparison constants. Semidefiniteness on an arbitrary
abelian group does not imply finite enumeration. For Kummer calculations supply the actual
Cassels–Flynn model, duplication and duality identities: `J⊂P^15`, its Kummer quartic,
`κ([P₁+P₂−D₂])=(1:x₁+x₂:x₁x₂:β₀)`, and the dual `Pic¹` Kummer pairing and addition forms. The reduction,
membership and deep-congruence theorems below are conditional on these geometric identifications. No
weaker numerical assertion replaces these geometric hypotheses.

In the concrete applications of §§3.24–3.29, `4.23–4.25, 5.29` and `6.18–6.39`, every printed
finite-field point list, class-group or unit presentation, divisor/reduction table, modular model,
Hecke or Frobenius matrix, integral value and L-derivative interval is an explicit hypothesis.
Each hypothesis identifies its entries with the actual arithmetic or geometric objects and states
the full membership, generation, coverage or error equality it asserts. The application theorems
prove the resulting rank, obstruction or complete global solution set from those inputs. The
scalar error bounds of §§0.1–0.10 and `2.1–2.7`, the reduction inequalities and finite-set
coverage theorems are proved mathematical targets and do not assume completeness of the answer.

The exact-algebraic interface follows the design of
[Hex's algebraic numbers](https://kim-em.github.io/blog/2026-9-8-exact-algebraic-numbers-and-number-fields-in-lean/):
an exact algebraic value and a selected root, with theorem-level comparison to its polynomial
and isolating region. Use the native algebraic closure at the pins. GeometryOfNumbersAndQuadraticArithmetic
§5.1 follows [hex-lll's correctness interface](https://github.com/leanprover/hex-lll-mathlib/blob/072ba84e7b8925e9283af64618fb5e8803cfc2a0/HexLLLMathlib/Reduction.lean)
for reduced bases; every reducedness and integral basis-change identity needed here is stated
as a mathematical hypothesis. No external executable representation is imported.

## How to read the build

Layer 0 fixes exact scalar meaning and precision. Layer 1 turns finite arithmetic into lattice
distance and enumeration data. Layer 2 combines those with explicit transcendence bounds for
Thue, Thue–Mahler and S-unit equations. Layer 3 certifies local descent, ranks, heights and
Mordell–Weil subgroup indices. Layer 4 constructs the geometric integration comparisons and
residue-disc bounds. Layer 5 combines compatible reductions in a finite sieve. Layer 6 verifies
quadratic Chabauty formulas and complete example lists under their displayed input hypotheses. `Suggested.lean`
states headline results on the pinned carriers. Other named interfaces below specify library targets; the README gives their full mathematical specification.

### Headline Lean statements

`Suggested.lean` states the following headline theorems. Its definitions supply
only the scalar constants, generated subgroup, convergent-series evaluation, S-unit
solution set `ED6.sUnitSolutions2to13` and Thue–Mahler solution list
`ED6.thueMahlerSolutionList` needed to express these results on native Mathlib and
Tau Ceti carriers.

| Target | Statement in `Suggested.lean` |
| --- | --- |
| Exact logarithmic lower bound (§2.3) | `ED2.matveev_lower_bound` |
| Normalized p-adic valuation upper bound (§2.5) | `ED2.yu_valuation_upper_bound` |
| Rational height difference bound (§3.12) | `ED3.canonicalHeight_sub_naiveHeight_cremona` |
| Weighted number-field height difference bound (§3.12) | `ED3.canonicalHeight_sub_naiveHeight_silverman` |
| Full Mordell–Weil basis and regulator (§3.22) | `ED3.mordellWeil_basis_of_height_and_saturation` |
| Quantitative geometric root matching with multiplicities (§6.16) | `ED6.roots_determined_of_truncation` |
| Tzanakis–de Weger's quartic Thue equations (§6.36) | `ED6.thue_quartic_i`, `ED6.thue_quartic_ii` |
| Integral points of `y² = x³ − 4x + 1` and Mohanty's problem (§6.37) | `ED6.integralPoints_cubic_minus_four_x_plus_one`, `ED6.triangular_eq_three_consecutive` |
| de Weger's `x + y = z` in `{2, …, 13}`-units (§6.38) | `ED6.sUnit_two_to_thirteen` |
| Tzanakis–de Weger's Thue–Mahler equation (§6.39) | `ED6.thueMahler_cubic` |

The general exact Thue, Thue–Mahler and S-unit list implications of §§2.20, 2.28 and
2.33 use the complete arithmetic data and validity constructions of Layer 2 and are not
stated; the four classical solved equations of §§6.36–6.39 are stated unconditionally on
`ℤ` and `ℕ`. The geometric Chabauty
and sieve endpoints use actual Jacobians, Abel–Jacobi maps, logarithms, models
and reduction comparisons. Quadratic Chabauty also uses the filtered Frobenius
connection and geometric heights. These constructions are absent at the pins;
the module docstring identifies the affected headline results. The conditional
worked applications retain all their arithmetic and geometric input hypotheses
in the mathematical targets below.

## Layer 0: Exact algebraic values and scalar precision

Every approximate value is tied to an exact scalar. Construct rational witnesses for the indicated
error and embedding facts; no numerical coincidence is an equality test.

### 0.1 Exact enclosures and the precision contract

Closed interval containment means `l ≤ x ≤ u`; complex-box containment applies
this to the real and imaginary parts; a rational-centred p-adic ball means
`‖x − c‖ ≤ p^(−N)`. Zero widths determine the enclosed real or complex value.
A zero ball centre is allowed. The Checks test positive-width overlap, exclusion
and absolute p-adic precision.

Three enclosure types carry every approximate value of this roadmap. (i) For `t ∈ ℝ`, a RealEnclosure
t is a closed nonempty rational interval `I = [l, u]` (Mathlib's NonemptyInterval `ℚ`) with `l ≤ t ≤ u` in
`ℝ`. Its rational error bound is `width(I) = u − l`, and it has absolute precision `n ∈` ℕ when `u − l ≤ 2^(−n)`. (ii) For `z ∈ ℂ`, a ComplexEnclosure z is a pair `(R, I)` of closed nonempty rational intervals
with `Re z ∈ R` and `Im z ∈ I`. Its error bound is `max(width R, width I`) and absolute precision n means
width `R ≤ 2^(−n)` and width `I ≤ 2^(−n)`. (iii) For a prime p and `x ∈ ℚ_p`, a PadicEnclosure x is a
rational centre c and an integer `N` with `‖x − c‖_p ≤ p^(−N); N` is its absolute precision, and its
canonical record is the `ED.0` normalized p-adic ball data `(N, v, s)` with `(v, s) = (N, 0)` when `c = 0`;
otherwise `v = min(v_p(c), N), s = 0` when `v = N`, and when `v < N s` the residue of `c·p^(−v)` in [`1, p^(N−v)`) prime to p; that record denotes the same ball and so contains x. Every check on an
enclosure (width, precision, membership of a rational, exclusion of zero) is a finite comparison of
rationals or of p-adic valuations of rationals. Overlap of enclosures does not in general certify equality: distinct numbers can
have overlapping or identical positive-width enclosures. A singleton real interval
`[q,q]` certifies its enclosed value is q; a complex box with both widths zero
likewise certifies its value.

Work under the following conditions. p is a prime in (iii); `n ∈` ℕ and `N ∈ ℤ`. Endpoints and centres
are exact rationals; no floating-point value enters a check.

The interface includes these statements.

- A rational interval [l, u] together with proofs `l ≤ t` and `t ≤ u` in `ℝ`.
- The rational error bound u − l; it is nonnegative.
- For every rational q with `l ≤ q ≤ u, |t − q| ≤` width.
- For `q ∈ ℚ` the degenerate interval [q, q] encloses (q : `ℝ`) with width 0, hence every precision.
- An interval containing a RealEnclosure's interval is again a RealEnclosure of the same number.
- A pair of rational intervals `(R, I)` with `Re z ∈ R` and `Im z ∈ I`.
- Z belongs to the box `{w : Re w ∈ R, Im w ∈ I}`.
- `|z|² ≤ max(l_R², u_R²) + max(l_I², u_I²)`, a rational upper bound for `|z|²`.
- When `I = [0, 0], R` is a RealEnclosure of Re z.
- A rational centre c and an integer `N` with `‖x − c‖ ≤ p^(−N)`.
- For `q ∈ ℚ` and every `N, (q, N)` encloses (q : `ℚ_[p]`).
- The canonical `ED.0` normalized p-adic ball data record of `(c, N)` denotes the closed ball of radius `p^(−N)` about c, which contains x.
- The exact value lies in the rational-centred closed ball of radius `p^(-N)`.

For the proof, Represent real intervals by Mathlib's NonemptyInterval `ℚ` and read membership after
casting the endpoints to `ℝ`. Represent complex boxes by pairs of such intervals; membership is
membership of the real and imaginary parts. Represent p-adic balls by `(c, N)`; the ultrametric
inequality shows that the ball of `(c, N)` equals the ball of the canonical `ED.0` PadicEnclosure record
described above (the residue `s ≡ c·p^(−v)` modulo `p^(N−v)` changes the centre by an element of `norm ≤ p^(−N)`). Width, precision and membership are decidable rational comparisons, which is what de
Weger's two-sided rounding `(§2.5)` achieves by hand.

For e : PadicEnclosure p x, return a : `ED.0` normalized p-adic ball data p with `a.N=e.precision` and `a.denotation={z : Q_p | ||z-e.centre||≤p^(-N)}`; hence `x∈a.denotation`. At `c=0` take (N,N,0); otherwise `v=min(v_p(c),N)`, and if `v<N` choose the nonzero residue s prime to p. The `(5,1)` at `p=3` test must return `(1,0,2)`, not merely a ball-membership proof. The zero-centre Check must return `(2,2,0)` at `p=3,N=2`; ball-membership examples alone do not test either record constructor.

**Checks.**

- The zero-width box `[0,0] × [1,1]` contains `i`; `[1,1] × [0,0]` does not, detecting swapped real and imaginary coordinates. The origin is excluded from the first box.
- [141/100, 142/100] is a RealEnclosure of `√2` with width 1/100; since 1/100 `≤ 2^(−6)` it has absolute precision 6 but not 7.
- `RealEnclosure.ofRat q` has width 0 for every rational q.
- ([0, 0], [1, 1]) is a ComplexEnclosure of `Complex.I`.
- At `p = 3`, the zero-centred ball `(0, 2)` encloses 9 although `9 ≠ 0`: a zero-centred enclosure does not certify vanishing.
- [1, 2] is a RealEnclosure of both 1 and 2, so a common enclosure does not prove equality.
- At `p = 3` the enclosure `(5, 1)` has canonical `ED.0` exact algebraic/ball data record `(N, v, s) = (1, 0, 2)`: the balls of radius 1/3 about 5 and about 2 coincide.
- At `p = 3`, centre `c = 0` and precision `N = 2`, the canonical `ED.0` exact algebraic/ball data record is `(N, v, s) = (2, 2, 0)`. The pinned totalized `padicValRat 3 0 = 0` must not select `v = 0`: a `v < N` record requires a nonzero residue prime to p.
- Every enclosure check is a comparison of rationals: [141/100, 142/100] ∋ `√2` is verified by `141² < 2·100² < 142²`.
- An enclosure containing two distinct numbers exists `(realEnclosure_overlap)`, so
  overlap alone does not imply equality. The singleton interval `[0,0]` contains
  only `0`, and a complex box with both widths zero determines its value.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp. 33–34; [J. R. Doyle, D.
Krumm](https://arxiv.org/abs/1111.4963), §4, before §4.1 (arXiv v4 p. 9).)

*Needs:* Mathlib NonemptyInterval; Mathlib `Padic.norm_eq_zpow_neg_valuation`; Mathlib `padicValRat`.

### 0.2 Exact algebraic values with isolating intervals and discs

An exact algebraic value is an element z of the existing algebraic closure of `Q`, together with a
chosen embedding into `C`; its datum consists of a nonzero squarefree f in `Q[X]` vanishing at z
and either a rational closed interval [a,b] when z is real, or a rational closed disc `|w-c|≤r` with c
in `Q(i), r>0`, or a rational rectangular complex box R+iI, containing exactly the one distinct root z
of f. A rational point can also use the degenerate interval [a,a]. The proof of unique containment
is part of the mathematical datum, not an assertion that a numerical root is exact. Every
algebraic z has such data of arbitrarily small diameter, with no root on a nondegenerate
boundary, and any finite set of distinct values has pairwise disjoint data. Existing field
operations determine z+w, zw and `z⁻¹ (z≠0)`; the targets certify their polynomial equations and
arbitrarily small isolations, and prove independence of the chosen polynomial/presentation. Equality
is exact equality in the algebraic closure: refine isolations and use a common polynomial/gcd to
compare shared roots, never infer equality from overlapping approximate boxes. This is a datum
interface and existence/soundness mathematics, with no root-finding, representation algorithm or
cost model.

Work under the following conditions. All polynomials used to isolate roots are nonzero; squarefree
means distinct roots are being isolated. A complex disc or box is interpreted in the fixed
embedding; no claim that arbitrary algebraic values are real.

The interface includes these statements.

- An algebraic value with nonzero squarefree rational annihilator, the fixed embedding and a unique-root rational interval, disc or rectangular complex box.
- Within the exact region every root of the displayed polynomial equals the selected value.
- For every rational `ε>0` there is a datum containing the value with `diameter<ε`.
- A rational q is represented by X-q and [q,q].
- The exact sum, product and nonzero inverse denote exactly the existing field operations; any chosen datum of the result is interchangeable.
- Equality agrees with the exact common-root/gcd criterion, after refining the isolations; intersecting boxes alone do not imply equality.

For the proof, use separability in characteristic zero and finiteness of the roots of f. The minimum
positive distance to the other roots provides a separating neighbourhood; rational density gives
smaller rational intervals, discs or rectangular complex boxes with boundary avoiding all roots. For
real order/root-sign infrastructure reuse RealAlgebraicGeometry Layer 1 (Sturm–Tarski/Thom
encoding), rather than planning a second real algebraic field or CAD. Complex isolation here only
records a root and a separating rational neighbourhood. For field operations use the existing
algebraic closure and minpoly of the result; algebraicity and finite root separation give its
isolation. Polynomial identities/resultants may verify a proposed result; extraneous resultant roots
do not identify the selected root. For equality, use the gcd of the two rational polynomials and the
unique-root witnesses in refined common neighbourhoods. Distinct roots eventually have disjoint
discs.

Finite-root separation supplies a rational box of every positive requested width for each selected complex root.

**Checks.**

- `X²-2` with [1,3/2] isolates `+√2` and excludes `-√2`.
- `X²+1` with centre i and radius1/2 isolates i; the conjugate disc isolates -i.
- X-3 with [3,3] certifies3 with diameter0.
- The intervals [1,2] for `√2` and [1,2] for `√3` overlap but their algebraic values are unequal.
- The inverse of the positive `√2` has `polynomial2X²-1` and positive isolation; zero has no inverse datum.

(Standard: separability in characteristic zero and finiteness of the roots of a nonzero polynomial, Mathlib `Polynomial.roots`; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp.32–34, is background on numerical root approximation only.)

*Needs:* Mathlib `NumberField.Embeddings.range_eval_eq_rootSet_minpoly`; Mathlib `Polynomial.roots`.

### 0.3 Arbitrarily fine data of the same algebraic root

For a nonzero `g ∈ Q[X]`, an isolating closed rational interval `I` selects exactly one real root r. For
each `n ∈ N` there exists a rational subinterval `J⊆I` selecting the same root and with
`width(J)≤2^(−n)width(I)`. A singleton rational root stays a singleton. `RealRootIsolation.refine`
denotes a chosen witness of this mathematical existence theorem; no bisection algorithm or cost
model is exported. The real and imaginary parts of a complex algebraic value are algebraic, since
`Re(z)=(z+conj` z)/2 and `Im(z)=(z−conj` z)/(2i). Applying the same existence theorem to their exact
`ED.0` data gives nested rational boxes of arbitrarily small width for the original value.

Work under the following conditions. `g≠0`, rational endpoints `l≤u`, and exactly one real root in
[l,u]. The selected root is kept fixed; overlapping enclosures alone do not identify roots.

The interface includes these statements.

- A nonzero rational polynomial g and a rational interval containing exactly one real root of g; the record stores `polynomial_ne_zero : g ≠ 0`.
- The isolated real root.
- `g(I.root) = 0` and `I.root` lies in `I.interval`.
- Any real root u of g lying in `I.interval` equals `I.root`.
- For `n∈N`, a chosen rational subinterval `J⊆I` containing the same unique root, with `width(J)≤2^(−n)width(I)`. The conclusion is mathematical existence.
- (refine `I` n).root `= I.root`.
- The width of refine `I n` is at most `2^(−n)` times the width of `I`.
- An isolation is a RealEnclosure of its root.
- The rational real interval in an `ED.0` exact algebraic box datum whose value is real isolates that same real root.

For the proof, The finite root set of a nonzero polynomial separates the selected root from every
other root. Rational density gives subintervals of any prescribed positive width containing that
root and lying inside the old interval; if the root is an endpoint, use a one-sided interval. If
`width(I)=0`, keep `I`. Nonemptiness of the witness set gives refine by mathematical choice; prove
preservation, inclusion and width from its specification. No general real-closed-field or
root-finding development is requested: TauCetiRoadmap RealAlgebraicGeometry Layer1 owns its
stronger general interface. Conjugation and field arithmetic are operations of existing algebraic
carriers. Certify Re and Im using §0.2 and use coordinate refinements to bound a complex value.

**Checks.**

- For `X²−2` and [1,2], [11/8,3/2] satisfies the precision3 refinement specification; [1,3/2] fails its width bound.
- For `X − q` and [q, q], refine n is [q, q] for every n.
- For X−1/2 and [0,1], the singleton [1/2,1/2] satisfies every refinement precision, while [0,1] fails precision1.
- [−2, 2] is not an isolating interval for `X² − 2`: it contains `±√2`.
- (refine `I` n).toEnclosure is a RealEnclosure of `I.root` of width at most `2^(−n)·width(I)`.
- RealRootIsolation (0 : `ℚ[X]`) is empty, including for a singleton interval: the polynomial must be nonzero.
- For `X²−2` on [1,2], [11/8,3/2] is an admissible precision3 refinement; no claim of a canonical algorithm result is made.
- For X−1/2 on [0,1], the singleton [1/2,1/2] is an admissible refinement at every precision.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed p. 34; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp. 32–33.)

*Needs:* §0.1; Mathlib `intermediate_value_Icc`; Mathlib `Polynomial.continuous`; Mathlib `EuclideanDomain.gcd`; Mathlib `Polynomial.derivative`; Mathlib NonemptyInterval; §0.2.

### 0.4 Archimedean embeddings pinned by isolating boxes

Let `K` be a number field with a power basis pb over `ℚ`, generator `θ` and minimal polynomial `f =` minpoly
`ℚ θ` of degree d. An archimedean embedding datum for pb is a `ED.0` ExactAlgebraicData `(f, R, I)`: closed rational intervals `R, I` such that exactly one complex root z of f satisfies `Re z ∈ R`
and `Im z ∈ I`. Its embedding `σ_c : K →+* ℂ` is `PowerBasis.lift pb z`, the unique ring homomorphism with
`σ_c(θ) = z`, and `σ_c` is the only embedding `K →+* ℂ` sending `θ` into the box. Every embedding of `K` into
`ℂ` has a datum. For `α ∈ K` with power-basis coordinates `(a_0, …, a_{d−1}) ∈ ℚ^d` and a
datum whose box has rational centre `w = w_1 + i·w_2` and half-widths at most r, put `M = |w_1| + |w_2| + 2r`; then `σ_c(α) = Σ_j a_j z^j` and `|σ_c(α) − Σ_j a_j w^j| ≤ ρ := 2r · Σ_j j·|a_j|·M^(j−1)`, so
the box with centre `Σ_j a_j w^j ∈ ℚ(i)` and half-widths `ρ` is a ComplexEnclosure of `σ_c(α)`. Refining
the box of z (same root, smaller box; §0.3 applied to Re z and Im z) until `ρ ≤ 2^(−n−1)` yields
enclosures of absolute precision n. A list of d data with pairwise disjoint boxes is
complete: it contains every embedding `K →+* ℂ`. If `I =` [−b, b] is symmetric about 0 then `σ_c` is real
`(ComplexEmbedding.IsReal)`, and `R` is a RealEnclosure of `σ_c(θ)`. The infinite place of `σ_c` is
`InfinitePlace.mk σ_c`; two data define the same place exactly when their roots are equal or
complex conjugate.

Work under the following conditions. `K` is a number field and pb : PowerBasis `ℚ K; f =` minpoly `ℚ pb.gen`. `(f, R, I)` is a §0.2 for the polynomial f itself. Coordinates of `α` are `pb.basis.repr α`; all
arithmetic on centres and radii is exact rational arithmetic.

The interface includes these statements.

- The data `(R, I)` and a proof that exactly one complex root of minpoly `ℚ pb.gen` lies in the box.
- The unique root z in the box.
- `σ_c = PowerBasis.lift pb z` as a ring homomorphism `K →+* ℂ`.
- `σ_c(pb.gen) = z`.
- If `σ : K →+* ℂ` sends `pb.gen` into the box then `σ = σ_c`.
- Every `σ : K →+* ℂ` is `σ_c` for some datum c.
- If `I =` [−b, b] then `ComplexEmbedding.IsReal σ_c`.
- `InfinitePlace.mk σ_c α = ‖σ_c α‖`.
- `|σ_c(α) − Σ_j a_j w^j| ≤ 2r·Σ_j j|a_j|M^(j−1)` for the box centre w and `M = |w_1| + |w_2| + 2r`.
- A datum with box widths at most `2^(−n)` and the same root, from §0.3.
- A family of [`K : ℚ`] data with pairwise disjoint boxes contains every embedding `K →+* ℂ`.
- A ComplexEnclosure of `σ_c(α)` of absolute precision n, computed from a refined datum.
- Both widths of `evalEnclosure α n` are at most `2^(−n)`.

For the proof, The decoded value z of the datum is a root of f lying in the box (`ED.0`
exact-algebraic-datum root specification), so `PowerBasis.lift pb z` is defined and sends `θ` to `z (PowerBasis.lift_gen)`; two embeddings that agree on `θ` agree on `K (PowerBasis.liftEquiv'` is
injective). If `σ(θ)` lies in the box then `σ(θ)` is a root of f in the box, hence equals z by `ED.0`
exact-algebraic-datum root uniqueness, hence `σ = σ_c`. Every embedding `σ` sends `θ` to a root of `f (NumberField.Embeddings.range_eval_eq_rootSet_minpoly)`; f has finitely many roots, so a box around
`σ(θ)` excluding the others exists. Since f is separable of degree `d, K` has exactly d embeddings
`(PowerBasis.liftEquiv')`, so d data with pairwise disjoint boxes exhaust them. `σ_c(α) = Σ_j a_j z^j` because `σ_c` is a ring homomorphism and `α = Σ_j a_j θ^j`; with `|z − w| ≤ 2r` and `|z|, |w| ≤ M`
the identity `z^j − w^j = (z − w)Σ_k z^k w^(j−1−k)` gives `|z^j − w^j| ≤ 2r·j·M^(j−1)`. Refinement: §0.3
gives real isolating intervals of Re z and Im z of any width; their product is a smaller box
containing z, hence again a datum with the same root, and by step 2 the same embedding. f has
rational coefficients, so the complex conjugate of z is a root of f; if `I` is symmetric it lies in
the box, hence equals z, so conjugate `σ_c = σ_c (ComplexEmbedding.isReal_iff)`. The statement about
places is `InfinitePlace.mk_eq_iff`.

**Checks.**

- For minpoly `ℚ θ = X² − 2` and the box `[1, 2] × [0, 0], σ_c(θ) = √2` and `σ_c(1 + θ) = 1 + √2`.
- The box `[1, 2] × [0, 0]` is symmetric about the real axis, so `σ_c` is a real embedding.
- For minpoly `ℚ θ = X − 1` the box `[1, 1] × [0, 0]` is a datum and `σ_c(α) = α` for `α ∈ ℚ`.
- For `X² − 2` the box `[−2, 2] × [0, 0]` contains two roots, so it is not a datum.
- For minpoly `X² + 1` the boxes `[0, 0] × [1, 1]` and `[0, 0] × [−1, −1]` give conjugate embeddings with the same `InfinitePlace.mk`.
- For `ℚ(√2)` the two data `[1, 2] × [0, 0]` and `[−2, −1] × [0, 0]` are the two real embeddings, and the enclosure of `σ_c(3363 − 2378θ)` at precision 14 excludes 0.
- For `ℚ(i)` the data `[0, 0] ×` [1/2, 2] and [`0, 0] × [−2`, −1/2] give the two complex embeddings, which define one infinite place.

([J. R. Doyle, D. Krumm](https://arxiv.org/abs/1111.4963), §4.1 (arXiv v4 p. 10); [de Weger
(1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp. 32–33; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, printed pp. 102–103.)

*Needs:* §0.1; §0.3; Mathlib `PowerBasis.lift`; Mathlib `PowerBasis.liftEquiv'`; Mathlib `NumberField.Embeddings.range_eval_eq_rootSet_minpoly`; Mathlib `NumberField.InfinitePlace.mk`; Mathlib `NumberField.InfinitePlace.mk_eq_iff`; Mathlib `NumberField.InfinitePlace.apply`; Mathlib `NumberField.ComplexEmbedding.IsReal`; Mathlib `NumberField.ComplexEmbedding.conjugate`; §0.2.

### 0.5 Hensel's lemma with the exact distance to the root

Let p be prime, `R` a commutative semiring with an algebra map to `ℤ_p, F ∈ R[X]` and a `∈ ℤ_p` with
`‖F(a)‖ < ‖F′(a)‖²`. Let `z ∈ ℤ_p` be the root given by Mathlib's `hensels_lemma: F(z) = 0, ‖z − a‖ < ‖F′(a)‖, ‖F′(z)‖ = ‖F′(a)‖`, and z is the only root within distance `‖F′(a)‖` of a. Then, for every `b ∈ ℤ_p` with `‖b − a‖ < ‖F′(a)‖: ‖F′(b)‖ = ‖F′(a)‖` and `‖z − b‖ = ‖F(b)‖ / ‖F′(a)‖`. In particular b
satisfies the Hensel hypothesis with the same root, and for integers b and `N` with `v_p(F(b)) ≥ N + v_p(F′(a))` one has `z ≡ b (mod p^N`).

Work under the following conditions. p prime; `F ∈ R[X]` with [Algebra `R ℤ_[p]`], evaluated by aeval;
a, `b ∈ ℤ_p`. `‖F(a)‖ < ‖F′(a)‖²` and `‖b − a‖ < ‖F′(a)‖`.

For the proof, Taylor expansion `(Polynomial.binomExpansion)` at z gives `F(b) = F(z) + F′(z)(b − z) + (b − z)²G` with `‖G‖ ≤ 1`, and F′(b) `=` F′(z) + (b − z)H with `‖H‖ ≤ 1`. `‖b − z‖ ≤ max(‖b − a‖, ‖a − z‖) < ‖F′(a)‖ = ‖F′(z)‖` by the ultrametric inequality `(PadicInt.nonarchimedean)` and `hensels_lemma`. Hence
`‖(b − z)²G‖ < ‖F′(z)‖·‖b − z‖` when `b ≠ z`, so `‖F(b)‖ = ‖F′(z)‖·‖b − z‖` by the strict ultrametric
inequality; the case `b = z` is trivial. Similarly `‖F′(b)‖ = ‖F′(z)‖`. This is the public form of the
private Mathlib lemma `soln_dist_to_a` in `Mathlib/NumberTheory/Padics/Hensel.lean`, extended from a to
every b in the Hensel disc.

**Checks.**

- `p = 7, F = X² − 2`, a `= 3: F(3) = 7` and F′(3) `= 6`, so `‖F(3)‖ = 1/7 < 1 = ‖F′(3)‖²`; for `b = 10, F(10) = 98 = 2·7²`, so the root `z = √2 ∈ ℤ_7` with `z ≡ 3` (mod 7) satisfies `‖z − 10‖ = 1/49, i.e`. `z ≡ 10` (mod 49) and z ≢ 10 (mod 343).
- If `F(a) = 0` the formula gives `‖z − a‖ = 0, i.e`. `z =` a.
- At `p = 3`, take `F = X² − 1`, `a = z = 1` and `b = −1`. Then `‖b − a‖ = ‖F′(a)‖ = 1`, while `F(b) = 0` and `‖z − b‖ = 1`; the strict disc hypothesis is necessary.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp. 32–33; [N. Tzanakis, B. M. M. de
Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §15E, printed p. 263.)

*Needs:* Mathlib `hensels_lemma`; Mathlib `Polynomial.binomExpansion`; Mathlib `PadicInt.nonarchimedean`; Mathlib `Padic.norm_eq_zpow_neg_valuation`.

### 0.6 p-adic embeddings pinned by Hensel data

Let `K` be a number field with a power basis pb over `ℚ` whose generator `θ` is integral over `ℤ`, so that `f =` minpoly `ℚ θ` has integer coefficients and is monic, and let p be prime. A p-adic embedding
datum is an integer a with f′(a) `≠ 0` and either `f(a) = 0` or `v_p(f(a)) > 2·v_p(f′(a))`, an exact
check on two integers. By `hensels_lemma` there is a unique `z ∈ ℤ_p` with `f(z) = 0` and `‖z − a‖ < ‖f′(a)‖`; the embedding `σ_a : K →+* ℚ_p` is `PowerBasis.lift pb z`, the unique embedding with `σ_a(θ) = z`, and `σ_a` is the only embedding sending `θ` into the open disc of radius `‖f′(a)‖` about a.
Approximation contract (a mathematical existence theorem, not a Newton implementation): given `N`,
there exists an integer b with `‖b − a‖ < ‖f′(a)‖` and either `f(b) = 0` or `v_p(f(b)) ≥ N + v_p(f′(a))`,
and then `z ≡ b (mod p^N) (§0.5`). For `α ∈ K` with power-basis coordinates `(a_0, …, a_{d−1}) ∈ ℚ^d` put
`e = max(0, −min_j v_p(a_j))`; then `(Σ_j a_j b^j, N − e)` is a PadicEnclosure of `σ_a(α)`, so `N = n + e`
gives absolute precision n. Two data a, a′ define different embeddings when `‖a − a′‖ ≥ max(‖f′(a)‖, ‖f′(a′)‖)`. The embeddings `K →+* ℚ_p` correspond exactly to the roots of f in `ℚ_p (PowerBasis.liftEquiv')`; a simple root of f modulo p gives a datum with `v_p(f′(a)) = 0`. Here
`v_p` is Mathlib `padicValRat`, whose value at zero is 0; exact zero residuals are therefore handled by
the explicit disjunction, rather than by treating that value as `+∞`.

Work under the following conditions. `K` a number field, pb : PowerBasis `ℚ K` with IsIntegral `ℤ pb.gen`;
`f =` minpoly `ℚ pb.gen` viewed in `ℤ[X]`. p prime; a `∈ ℤ` with f′(a) `≠ 0` and either `f(a) = 0` or `v_p(f(a)) > 2·v_p(f′(a)); α` given by its rational coordinates `pb.basis.repr α`.

The interface includes these statements.

- An integer a with f′(a) `≠ 0` and either `f(a) = 0` or `v_p(f(a)) > 2·v_p(f′(a))` for `f =` minpoly `ℚ pb.gen`.
- The Hensel root `z ∈ ℤ_p` of f with `‖z − a‖ < ‖f′(a)‖`.
- `σ_a = PowerBasis.lift pb z : K →+* ℚ_p`.
- `σ_a(pb.gen) = z`.
- If `σ : K →+* ℚ_p` satisfies `‖σ(pb.gen) − a‖ < ‖f′(a)‖` then `σ = σ_a`.
- For an integer b with `‖b − a‖ < ‖f′(a)‖` and either `f(b) = 0` or `v_p(f(b)) ≥ N + v_p(f′(a)), ‖z − b‖ ≤ p^(−N)`.
- The PadicEnclosure `(Σ_j a_j b^j, n)` of `σ_a(α)` of absolute precision n.
- `‖a − a′‖ ≥ max(‖f′(a)‖, ‖f′(a′)‖)` implies `σ_a ≠ σ_a′`.
- `σ_a` restricted to `ℚ` is the canonical map `ℚ → ℚ_p`.

For the proof, The integer check f′(a) `≠ 0` and (`f(a) = 0` or `v_p(f(a)) > 2·v_p(f′(a))`) is `‖f(a)‖ < ‖f′(a)‖²` in `ℤ_p (Padic.norm_eq_zpow_neg_valuation)`, so `hensels_lemma` gives the root z and its
uniqueness in the disc. `PowerBasis.lift pb z` is a ring homomorphism `K → ℚ_p` with `θ ↦ z`; any `σ` with
`‖σ(θ) − a‖ < ‖f′(a)‖` sends `θ` to a root in the disc, hence to z, hence equals `σ_a (PowerBasis.liftEquiv')`. Choose an integer b sufficiently close to the Hensel root z by density of `Z`
in `Z_p`. Continuity of f and f′, with f′(z) having the same nonzero norm as f′(a), gives the required
Hensel-disc and residual inequalities. The root-distance theorem gives `‖z−b‖≤p^(−N)`. `z, b ∈ ℤ_p` and
`z ≡ b (mod p^N`) give `z^j ≡ b^j (mod p^N`); multiplying by `a_j` with `v_p(a_j) ≥` −e gives `‖σ_a(α) − Σ_j a_j b^j‖ ≤ p^(e−N)`. If `‖a − a′‖ ≥ max(‖f′(a)‖, ‖f′(a′)‖)` then the two roots z, z′ satisfy `‖z − z′‖ = ‖a − a′‖ > 0` by the strict ultrametric inequality. The canonical record of the enclosure is the `ED.0`
PadicEnclosure record of `(Σ_j a_j b^j, N − e) (§0.1)`.

Rational centres exist at every integer absolute precision in `Q_p`; the chosen algebraic embedding also requires the Hensel and power-basis data above.

**Checks.**

- For minpoly `ℚ θ = X² − 2, p = 7` and a `= 3` the check `v_7(7) = 1 > 0 = 2·v_7(6)` holds, and `σ_a(θ) ≡ 10` (mod 49).
- For `X² − 2` at `p = 7` the data a `= 3` and a `= 4` define the two different embeddings `ℚ(√2) → ℚ_7`.
- For minpoly `ℚ θ = X − 1`, a `= 1` is a datum `(f(1) = 0)` and `σ_a(α) = α` for `α ∈ ℚ`.
- For `X² − 2` at `p = 5` no integer a is a datum: `v_5(a² − 2) = 0` for every a since 2 is not a square modulo 5.
- `σ_a(algebraMap ℚ K q) = (q : ℚ_[p]`) for every datum a and `q ∈ ℚ`.
- Tzanakis–de Weger 1992, §3E–§4E: at `p = 5` their polynomial has three roots in `ℚ_5`, each pinned by a datum of this form.
- For `X² − 2` at `p = 7`, a `= 3: σ_a(θ) ≡ 10` (mod 49) and `≡ 108` (mod 343), since `108² − 2 = 11662 = 34·343`.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §3, printed p.
226; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.13, printed p. 66.)

*Needs:* Mathlib `hensels_lemma`; §0.5; Mathlib `PowerBasis.lift`; Mathlib `PowerBasis.liftEquiv'`; Mathlib `Padic.norm_eq_zpow_neg_valuation`; Mathlib `padicValRat`; Mathlib PadicInt; §0.1.

### 0.7 Exact nonvanishing and the exact zero test

Let `K` be a number field with power basis pb and `α ∈ K` with power-basis coordinates `(a_j) ∈ ℚ^d`. (a)
`α = 0` if and only if every `a_j = 0`; this coordinate test establishes `α = 0` (or `α = β`,
applied to `α − β`). For algebraic values given with isolations, the comparison uses exact equality in the
algebraic closure and the common-root comparison of §0.2. (b) If c is an archimedean embedding datum and `(R, I)` a ComplexEnclosure of
`σ_c(α)` whose box excludes `0 (R.fst > 0, R.snd < 0, I.fst > 0` or `I.snd < 0`), then `α ≠ 0`, and
therefore `τ(α) ≠ 0` for every ring homomorphism `τ` from `K` to a field. (c) If a is a p-adic embedding
datum and `(c, N)` a PadicEnclosure of `σ_a(α)` with `c ≠ 0` and `v_p(c) < N`, then `α ≠ 0`. (d) The
exclusion test is complete: if `α ≠ 0`, every ComplexEnclosure of `σ_c(α)` of absolute precision n with
`2·4^(−n) < |σ_c(α)|²` excludes 0, and every PadicEnclosure `(c, N)` of `σ_a(α)` with `N > v_p(σ_a(α))` has
`c ≠ 0` and `v_p(c) = v_p(σ_a(α)) < N`; so every sufficiently fine enclosure excludes zero. (e) A positive-width enclosure
containing 0 alone need not prove `α = 0`; a singleton real interval `[0,0]` or
a zero-width complex box at zero does prove vanishing. For every n the rational `α = 2^(−n−1)` has the precision-n enclosure `[0, 2^(−n)]` containing 0.

Work under the following conditions. `K` a number field, pb : PowerBasis `ℚ K; σ_c` from §0.4 and `σ_a`
from §0.6. Enclosures are those of §0.1.

For the proof, (a) `pb.basis` is a basis, so `α = Σ_j a_j θ^j` vanishes exactly when its coordinates `do (Basis.repr` is injective). (b) If 0 is not in the box then `σ_c(α) ≠ 0`, so `α ≠ 0` since `σ_c(0) = 0`;
ring homomorphisms out of a field are injective `(RingHom.injective)`. (c) The strict ultrametric
inequality gives `‖σ_a(α)‖ = ‖c‖ = p^(−v_p(c)) > 0` when `‖σ_a(α) − c‖ ≤ p^(−N) < p^(−v_p(c))`. (d) If 0
and `σ_c(α)` lie in a box of widths `≤ 2^(−n)`, then `|Re σ_c(α)| ≤ 2^(−n)` and `|Im σ_c(α)| ≤ 2^(−n)`, so
`|σ_c(α)|² ≤ 2·4^(−n)`; the p-adic statement is the converse direction of (c). (e) is a direct
computation; numerical agreement alone proves no identity.

Over `Q_p`, strict error smaller than the norm of a nonzero centre gives nonvanishing and equality of norms.

**Checks.**

- The singleton real enclosure `[0,0]` implies `α=0`; the positive-width enclosure
  `[0,2^(−n)]` also contains the nonzero rational `2^(−n−1)`.
- Pell unit test: in `K = ℚ(√2)` with the datum `[1, 2] × [0, 0], α = 3363 − 2378·θ` has `σ_c(α) = (1 − √2)^10 = 1.4867…·10^(−4)`. The exact test (a) gives `α ≠ 0` from the coordinates `(3363, −2378)`. An enclosure of precision 10 (width `2^(−10) ≈ 9.8·10^(−4)`) can contain 0, while every enclosure of precision 14 excludes 0 by (d), since `2·4^(−14) ≈ 7.5·10^(−9) < 2.2·10^(−8) ≈ |σ_c(α)|²`.
- At `p = 7` with the datum a `= 3` for `X² − 2`, the enclosure `(7, 2)` of `σ_a(θ − 3)` certifies `θ − 3 ≠ 0` and `v_7(σ_a(θ − 3)) = 1`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp. 32–33; [J. R. Doyle, D.
Krumm](https://arxiv.org/abs/1111.4963), §4, opening paragraph (arXiv v4 p. 9).)

*Needs:* §0.4; §0.6; §0.1; Mathlib `RingHom.injective`; Mathlib `Padic.norm_eq_zpow_neg_valuation`; §0.2.

### 0.8 Exact valuations from p-adic enclosures

Let a be a p-adic embedding datum for `(K, pb, p)` with embedding `σ_a : K →+* ℚ_p`, and `α ∈ K^×`.
A valuation datum for `α` is a PadicEnclosure `(c, N)` of `σ_a(α)` with `c ≠ 0` and `v_p(c) < N`
(precision exceeding the valuation); it certifies `Padic.valuation(σ_a(α)) = v_p(c) = padicValRat p c`. Every `α ≠ 0` has one: choose any integer `N > v_p(σ_a(α))` and apply the enclosure-existence
theorem; its centre has the same valuation by the strict ultrametric inequality. Prime ideals: `𝔭_a := {x ∈ 𝓞_K : ‖σ_a(x)‖ < 1}` is a height-one prime of `𝓞_K` above p with completion `ℚ_p`, so
ramification index and residue degree are 1, and for `α ∈ K^×` the `𝔭_a-adic` valuation is `v_{𝔭_a}(α) = v_p(σ_a(α))`; in Mathlib's normalisation `HeightOneSpectrum.valuation K α = WithZero.exp(−v_p(σ_a(α)))`. Data multiply: valuation data `(c, N)` of `α` and (c′, N′)
of `β`, with `v = v_p(c)` and `v′ = v_p(c′)`, give the datum (cc′, `min(v + N′, N + v′)`) of `αβ` with
valuation v + v′.

Work under the following conditions. a is an §0.6; `α ≠ 0`. Only primes 𝔭 arising from embeddings `K → ℚ_p` (local degree one, `e = f = 1`) are covered; residue degree one alone is insufficient at a ramified prime. Their valuations are read from `σ_a`.

The interface includes these statements.

- A PadicEnclosure `(c, N)` of `σ_a(α)` with `c ≠ 0` and `padicValRat p c < N`.
- `Padic.valuation (σ_a α) = padicValRat p c`.
- A valuation datum exists only for `α ≠ 0`.
- Every `α ≠ 0` has a valuation datum at every precision `N > v_p(σ_a(α))`.
- The height-one prime `𝔭_a = {x ∈ 𝓞_K : ‖σ_a(x)‖ < 1}`.
- `HeightOneSpectrum.valuation K α` at `𝔭_a` equals `WithZero.exp(−v_p(σ_a(α)))`.
- Data for `α` and `β` give a datum for `αβ` with valuation `v_p(c) + v_p(c′)`.

For the proof, If `‖σ_a(α) − c‖ ≤ p^(−N) < p^(−v_p(c)) = ‖c‖`, then `‖σ_a(α)‖ = ‖c‖` (ultrametric), so
the valuations agree `(Padic.norm_eq_zpow_neg_valuation)`. Existence: the enclosures of absolute
precision n converge to `σ_a(α) ≠ 0`; once `n > v_p(σ_a(α))` the centre has the same valuation `(§0.7 (d))`. `σ_a` extends by continuity to the completion of `K` at `𝔭_a`, whose image is closed and contains `ℚ`,
hence is `ℚ_p`; thus `e(𝔭_a/p) = f(𝔭_a/p) = 1` and the normalised valuation of `K` at `𝔭_a` is `v_p` ∘ `σ_a`. In
Mathlib terms the comparison is with `IsDedekindDomain.HeightOneSpectrum.valuation`, whose value at a
uniformiser is `WithZero.exp(−1)`. Product rule: `σ(αβ) −` cc′ `= σ(α)(σ(β) − c′) + c′(σ(α) − c)`, so
`‖σ(αβ) − cc′‖ ≤ max(p^(−v−N′), p^(−v′−N))` by the ultrametric inequality, and `v + v′ < min(v + N′, N + v′)`.

**Checks.**

- In `Q(√3)`, the prime above 3 has residue degree 1 and ramification index 2. It admits no embedding into `Q_3`, since an element squaring to 3 would have valuation 1/2. A residue-degree-one test alone cannot supply this datum.


- For `K = ℚ` (minpoly `X − 1`, a `= 1), p = 3` and `α = 18`, the enclosure `(18, 3)` certifies valuation `2 = padicValRat 3 18`.
- For `X² − 2` at `p = 7` with a `= 3`, the enclosure `(7, 2)` of `σ_a(θ − 3)` certifies `v_7(σ_a(θ − 3)) = 1`.
- The enclosure `(1, 1)` of `σ_a(1)` certifies valuation 0.
- At `p = 7` the enclosure `(0, 2)` of 49 is not a valuation datum although `49 ≠ 0`: its centre is 0.
- For `X² − 2` at `p = 7`, a `= 3: v_7(σ_a(θ − 3)) = 1` and `v_7(σ_a(θ − 10)) = 2`, from the enclosures `(7, 2)` and `(98, 3)` of `σ_a(θ − 3)` and `σ_a(θ − 10)`.
- For `K = ℚ` the datum reproduces `padicValRat`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.13, Lemma 3.17(i), printed p. 67; [N. Tzanakis,
B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §4, printed p. 227.)

*Needs:* §0.6; §0.7; §0.1; Mathlib `Padic.valuation`; Mathlib `Padic.norm_eq_zpow_neg_valuation`; Mathlib `padicValRat`; Mathlib `IsDedekindDomain.HeightOneSpectrum.valuation`.

### 0.9 Scalar p-adic precision under field operations

Let `L=K_v` be a completed number field, with its dense embedding `ι:K→L`, a uniformizer `π` and additive
valuation ord with `ord(π)=1, ord(0)=+∞` and `e=ord(p)`. A ball datum `B(c,N)` for x consists of an
exact `c∈K` and integer `N` with `ord(x-ι(c))≥N`. The `Q_p` specialization uses `c∈Q` and `ord(p)=1`. Given
`x∈B(c,N), y∈B(d,M)`, and exact integer lower bounds `a≤ord(x),ord(c), b≤ord(y),ord(d)`, prove:
`x+y∈B(c+d,min(N,M)); xy∈B(cd,min(N+b,M+a))`; if `c≠0` and `s=ord(c)<N`, then `x≠0, ord(x)=s` and
`x⁻¹∈B(c⁻¹,N-2s)`. One may take `a=min(ord(c),N)` for `c≠0` and `a=N` for `c=0`, with the analogous convention
for b. For exact coefficients `u_j`, the error of `Σu_j x_j` is at least `min_j(N_j+ord(u_j))`; zero
coefficients are omitted and the empty sum is exact zero. Polynomial evaluation follows by these
finite field identities, with a stated rational/integer precision budget. If nonzero pivot `ℓ_k` has
valuation s and every `ℓ_j` has `valuation≥s`, enclosures of all `ℓ_j` and `ℓ_k` at `precision≥m+s` give
enclosures of `-ℓ_j/ℓ_k` at `precision≥m`, provided the pivot precision exceeds s. Thus residues needed
by `ED.1` are exact, including precision lost at division. Dense range gives ball data at
every `N`; it is not a new completion construction or a numerical procedure.

Work under the following conditions. The completion, embedding, valuation and normalization
comparisons come from the local-field/number-field owners; in a ramified completion e may exceed1.
Absolute precisions are integers and may be negative. Exact zero has infinite valuation, never
Mathlib's totalized integer valuation0. All inverse and quotient rules require the displayed nonzero
and strict precision hypotheses.

The interface includes these statements.

- A centre c in `K`, integer absolute precision `N` and containment `ord(x-ιc)≥N` in the actual completion `K_v`.
- Addition has centre c+d and precision `min(N,M)`.
- Multiplication has centre cd and precision `min(N+b,M+a)` for the displayed lower valuation bounds.
- For `c≠0` and `s=ord(c)<N`, inverse precision is N-2s.
- A finite exact linear combination has precision at least `min(N_j+ord(u_j))`, with zero coefficients omitted.
- Input `log precision≥m+s` and an exact minimal nonzero pivot valuation s imply quotient `precision≥m`, sufficient for the `ED.1` congruence lattice.
- The dense exact subfield supplies a ball datum for every `x∈K_v` and every integer precision.

For the proof, apply the ultrametric inequality to addition. Write `xy-cd=x(y-d)+d(x-c)`, so the two
error terms have lower valuations a+M and b+N. If `ord(c)<N≤ord(x-c)`, ultrametric strictness gives
`ord(x)=ord(c)`. The inverse identity `x⁻¹-c⁻¹=(c-x)/(xc)` gives N-2s. Induct on the finite sum/product
expression using exact coefficients. A zero coefficient contributes no error term. For the pivot
quotient, inverse precision `N_k-2s` multiplied by a numerator of `valuation≥s` and numerator error
divided by the pivot both have `precision≥m`. DenseRange `ι` and the valuation topology supply all
requested input balls.

Over `Q_p`, the norm formulation gives the corresponding addition, multiplication, inversion and pivot-division error bounds.

**Checks.**

- At `p=3`, balls `B(3,4),B(9,5)` have valuations1,2; their product has centre27 and precision6.
- At `p=3, B(9,5)` has inverse centre1/9 and guaranteed precision1, not5.
  The element `x=9+3⁵=252` lies in this input ball; `x⁻¹` lies in `B(1/9,1)`
  and outside `B(1/9,2)`, so the precision loss is attained.
- `B(0,4)` times `B(9,5)` has centre0 and precision6; `ord(0)=0` would incorrectly lose this guaranteed precision.
- At `p=3, B(1,4)+B(-1,4)` has guaranteed precision4; cancellation of centres does not certify exact zero.
- If `e=2` and `ord(π)=1`, multiplication by p gains2 digits and division by p loses2; using `ord(p)=1` is incorrect.
- Logs of `valuation≥2` known to precision9, with a pivot exact of valuation2, give normalized coefficient precision7.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp.33–34; §3.13 Lemma3.17, p.67.)

*Needs:* §0.1; §0.8; Mathlib `Padic.norm_eq_zpow_neg_valuation`.

### 0.10 Exact enclosures of the height of a number-field element

Let `K` be a number field of degree d with power basis pb and a complete list of archimedean embedding
data (d data with pairwise disjoint boxes, so their embeddings `σ_1, …, σ_d` are all
embeddings `K →+* ℂ`). For `x ∈ K` let `χ_x ∈ ℚ[X]` be the characteristic polynomial of multiplication by
`x (Matrix.charpoly` of `Algebra.leftMulMatrix pb.basis x`) and `P_x ∈ ℤ[X]` its primitive integral
multiple with positive leading coefficient `a_x`. Then Mathlib's relative height is `Height.mulHeight₁ x = a_x · ∏_{i=1}^{d} max(1, |σ_i(x)|)`: the archimedean factors come from the data and the
whole non-archimedean part of the height is the integer `a_x`. The construction `heightEnclosure x n`
returns a RealEnclosure of `mulHeight₁ x` of absolute precision n: compute `a_x` exactly (rational
linear algebra and a gcd of numerators), take ComplexEnclosures of the `σ_i(x) (§0.4)`, bound each
`|σ_i(x)|²` in a rational interval: its upper bound is attained at a box corner, while its lower bound is the sum of the squared distances of the two coordinate intervals from zero (zero for an interval containing zero). Apply `max(1, ·)`, multiply the nonnegative
intervals endpoint by endpoint, multiply by `a_x²`, and take rational square-root brackets of the
endpoints; the precision of the `σ_i(x)-enclosures` is increased until the final width is at most
`2^(−n)`.

Work under the following conditions. `K` a number field, pb : PowerBasis `ℚ K`, and `d = [K : ℚ`]
archimedean embedding data with pairwise disjoint boxes. `x ∈ K` arbitrary (`x = 0` has height
1). No analytic function is evaluated; only `|·|²` of algebraic numbers is enclosed.

The interface includes these statements.

- A RealEnclosure of `Height.mulHeight₁ x` of absolute precision n.
- The width of `heightEnclosure x n` is at most `2^(−n)`.
- `mulHeight₁ x` equals the Mahler measure of the primitive part of the characteristic polynomial of x, mapped to `ℂ[X]`.
- `mulHeight₁ x = a_x · ∏_σ max(1, ‖σ x‖)` over all embeddings `σ : K →+* ℂ`.
- For `K = ℚ` the enclosure contains `max(|num x|, den x)` (Mathlib's `Rat.mulHeight₁_eq_max`).
- For any `x∈K` and any Q-basis b of `K, charpoly(leftMulMatrix b x)=minpoly Q x ^` ([K:Q]/natDegree(minpoly `Q x`)). Identify `Q(x)` with the simple intermediate field, use a basis of `K` over `Q(x)`, restriction of scalars and basis invariance; x need not generate `K`.
- For two Q-bases b and b′ of `K` and any x, the left-multiplication characteristic polynomials agree by similarity.

For the proof, For arbitrary x, first prove `charpoly_leftMul_arbitrary` using the tower `Q⊆Q(x)⊆K` and
basis invariance. The pinned `charpoly_leftMulMatrix` theorem covers only a power-basis generator; it
is one input, not this bridge. Over `ℂ, χ_x = ∏_{i}(X − σ_i(x)): χ_x =` (minpoly `ℚ x)^k` with `k = [K` :
`ℚ(x)`], and each conjugate of x is `σ_i(x)` for exactly k of the d embeddings
(`NumberField.Embeddings.range_eval_eq_rootSet_minpoly; charpoly_leftMulMatrix` for the power basis of
`ℚ(x)` and the tower formula). By Gauss's lemma `P_x = F_x^k` for the primitive minimal polynomial `F_x`,
so `a_x = lead(F_x)^k`. DiophantineApproximationAndTranscendence §0.3 (height size estimates) gives `M(F_x) = absMulHeight₁(x)^(deg x)` and DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights)
gives `absMulHeight₁(x) = mulHeight₁(x)^(1/d)`; with `d = k·deg x` this gives `mulHeight₁ x = M(F_x)^k = M(P_x) (Polynomial.mahlerMeasure_mul)`. `M(P_x) = a_x·∏_i max(1, |σ_i(x)|)` by
`Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, since the complex roots of `P_x` with
multiplicity are the `σ_i(x)`. From a ComplexEnclosure with real interval `[l_1, u_1]` and imaginary
interval `[l_2, u_2], |σ_i(x)|²` lies between the rational numbers `dist²` of the box to 0 and `max(l_1², u_1²) + max(l_2², u_2²); max(1, ·)` and products of nonnegative intervals are monotone, so the
endpoint products enclose `mulHeight₁(x)²`, and the widths tend to 0 as the precision of the
`σ_i(x)-enclosures` grows.

**Checks.**

- For `x = 1/2 ∈ ℚ, P_x = 2X − 1` and `mulHeight₁ x = 2`.
- For `θ = √2` in `ℚ(√2), P = X² − 2` and `mulHeight₁ θ = 2` (both archimedean factors equal `√2`).
- `mulHeight₁ 0 = 1` and every enclosure of it contains 1.
- For the golden ratio `φ` in `ℚ(√5), P = X² − X − 1` and `mulHeight₁ φ = φ = (1 + √5)/2`.
- For the box `[−1,1] × [−1,1]`, the squared norm lies in [0,2]; all four corners have squared norm 2, so taking the smallest corner value as a lower bound is invalid.
- For `√2 ∈ ℚ(√2)` the relative height is 2 while `absMulHeight₁ √2 = √2`: the enclosure is of the relative height.
- For `K = ℚ` every enclosure contains `max(|num x|, den x)` (Mathlib's `Rat.mulHeight₁_eq_max`).
- For the golden ratio `φ ∈ ℚ(√5)` the enclosure at precision 10 is contained in `[1.617, 1.620]`.

([J. R. Doyle, D. Krumm](https://arxiv.org/abs/1111.4963), §2 (arXiv v4 p. 2); [J. R. Doyle, D.
Krumm](https://arxiv.org/abs/1111.4963), §4.1, Lemma 4.1 (arXiv v4 p. 9).)

*Needs:* DiophantineApproximationAndTranscendence §0.3 (height size estimates); DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights); DiophantineApproximationAndTranscendence §0.1 (primitive minimal polynomial); Mathlib `Height.mulHeight₁`; Mathlib `NumberField.mulHeight₁_eq`; Mathlib `Polynomial.mahlerMeasure`; Mathlib `Polynomial.mahlerMeasure_mul`; Mathlib `Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`; Mathlib `Matrix.charpoly`; Mathlib `Algebra.leftMulMatrix`; Mathlib `charpoly_leftMulMatrix`; Mathlib `Polynomial.primPart`; Mathlib `NumberField.Embeddings.range_eval_eq_rootSet_minpoly`; §0.4; §0.1.

### 0.11 Finite coordinate covers for bounded-height points

Let `L` be a number field of degree d with a power basis pb whose generator `θ` is integral, together
with a complete list of archimedean embedding data (d data with pairwise disjoint
boxes, one for each root of `f =` minpoly `ℚ θ`), and let `D ≥ 1` and `τ ∈ (0, 1`] be rationals.
`boundedHeightPoints L pb D τ` is a pair of finite sets `(S_<, S_≈)` of elements of `L` such that:
(completeness) every `x ∈ L` with `Height.mulHeight₁ x ≤ D` lies in `S_< ∪ S_≈`; (soundness) every `x ∈ S_<`
has `mulHeight₁ x < D` and every `x ∈ S_≈` has `|mulHeight₁ x − D| < τ`. On `ℙ¹(L)` (Mathlib's
Projectivization `L` (Fin `2 → L`)) the set `T = {[x : 1] : x ∈ S_< ∪ S_≈} ∪ {[1 : 0]}` contains every
point `P` with `Height.logHeight P.rep ≤ log D`, and every point of `T` has `logHeight < log(D + τ)`.
The finite coordinate-cover theorem states: (1) every x with `mulHeight₁ x ≤ D` has `c := natDenominator x ≤ D` and `y := c·x` integral;
(2) every embedding `σ` satisfies `|σ(x)| ≤ D`, so `|σ(y)| ≤ D²`; (3) with `Δ = disc(pb.basis) ∈ ℤ∖{0}, Δ·y ∈ ℤ[θ]`, so `y = Σ_j b_j θ^j` with `Δ·b_j ∈ ℤ`, and `b = V^(−1)(σ_i(y))_i` for the Vandermonde matrix `V = (σ_i(θ)^j)`, giving `|b_j| ≤ Ω·D²` with `Ω` a rational upper bound for the row sums of `|V^(−1)|` computed
from the root boxes; (4) the finite candidate set is `{(Σ_j b_j θ^j)/c : 1 ≤ c ≤ ⌊D⌋, Δ·b ∈ ℤ^d, |b_j| ≤ ΩD²} ∪ {0}`; (5) for each candidate an enclosure [l, u] of `mulHeight₁` of width `< τ (§0.10)`
puts it in `S_<` if `u < D`, in `S_≈` if `l ≤ D ≤ u`, and discards it if `D < l`.

Work under the following conditions. `L` a number field, pb : PowerBasis `ℚ L` with IsIntegral `ℤ pb.gen`;
d archimedean embedding data with pairwise disjoint boxes `(§0.4, complete_of_disjoint)`. `D, τ ∈ ℚ` with `D ≥ 1` and `0 < τ ≤ 1`. For a real bound `B` on logarithmic height take any rational `D ≥ exp(B)`.

The interface includes these statements.

- The pair `(S_<, S_≈)` of finite subsets of `L`.
- `mulHeight₁ x ≤ D` implies `x ∈ S_< ∪ S_≈`.
- `x ∈ S_<` implies `mulHeight₁ x < D`.
- `x ∈ S_≈` implies `|mulHeight₁ x − D| < τ`.
- The finite set `T ⊆ ℙ¹(L)` of [x : 1] for `x ∈ S_< ∪ S_≈` together with [1 : 0].
- `Height.logHeight P.rep ≤ log D` implies `P ∈ T`, for every `P ∈ ℙ¹(L)`.
- The `toFinset` of `NumberField.finite_setOfPred_mulHeight₁_le L D` is contained in `S_< ∪ S_≈`.

For the proof, Step (1) is `NumberField.natDenominator_le_mulHeight₁` and
`Algebra.isIntegral_natDenominator_smul`. Step (2): in `NumberField.mulHeight₁_eq` every factor `max(w x, 1)^(mult w)` and `max(v x, 1)` is at least 1, so `w(x) ≤ mulHeight₁ x ≤ D` for every infinite place w;
hence `|σ(y)| = c·|σ(x)| ≤ D²`. Step (3) is `Algebra.discr_mul_isIntegral_mem_adjoin`; the Vandermonde
inverse is given by Lagrange interpolation, `(V^(−1))_(j,i) =` coefficient of `X^j` in `f(X)/((X − z_i) f′(z_i))`, whose enclosures come from the data of §0.4. Completeness follows from (1)–(4):
each x of height `≤ D` equals `(Σ_j b_j θ^j)/c` for a candidate (c, b); its enclosure has `l ≤ mulHeight₁ x ≤ D`, so it is not discarded. Soundness: `u < D` gives `mulHeight₁ x < D; l ≤ D ≤ u` and `u − l < τ` give
`|mulHeight₁ x − D| < τ`. `ℙ¹`: every `P ∈ ℙ¹(L)` is [1 : `0] (logHeight 0)` or [x : 1] (rescale the
representative, `Height.mulHeight_smul_eq_mulHeight`), and `Height.logHeight ![x, 1] = logHeight₁ x (Height.logHeight₁_eq_logHeight)`.

**Checks.**

- For `L = ℚ, D = 2` and `τ = 1/2: S_< = {0, 1, −1}` and `S_≈ = {2, −2, 1/2, −1/2}; T` has 8 points of `ℙ¹(ℚ)`.
- For `L = ℚ(i), D = 1: S_< = ∅` and `S_≈ = {0, 1, −1, i, −i}`, the elements of height exactly 1.
- Restricting step (4) to `c = 1` misses `x =` 1/2 for `L = ℚ` and `D = 2`, so the denominators `c ≤ D` are needed.
- [1 : `0] ∈ T` for every `D ≥ 1`, since `Height.logHeight ![1, 0] = 0`.
- For `L = ℚ` and `D = 3` the union `S_< ∪ S_≈` contains `{x : ℚ | mulHeight₁ x ≤ 3}`, which has 15 elements (7 integers, 4 with denominator 2, 4 with denominator 3).
- For `L = ℚ` and `D = 2` the output covers exactly the seven elements `0, ±1, ±2, ±1/2` and `T` has eight points of `ℙ¹(ℚ)`.
- For `L = ℚ(i)` and `D = 1` the result is `{0, ±1, ±i}` (Kronecker: height 1 means 0 or a root of unity).

([J. R. Doyle, D. Krumm](https://arxiv.org/abs/1111.4963), Abstract (arXiv v4 p. 1); [J. R. Doyle,
D. Krumm](https://arxiv.org/abs/1111.4963), §5, Theorem 5.1 (Pethő–Schmitt) (arXiv v4 p. 15); [J. R.
Doyle, D. Krumm](https://arxiv.org/abs/1111.4963), §4.3, Algorithm 4 output (arXiv v4 p. 11).)

*Needs:* Mathlib `NumberField.natDenominator_le_mulHeight₁`; Mathlib `Algebra.isIntegral_natDenominator_smul`; Mathlib `NumberField.mulHeight₁_eq`; Mathlib `Algebra.discr_mul_isIntegral_mem_adjoin`; Mathlib `NumberField.finite_setOfPred_mulHeight₁_le`; Mathlib `Height.logHeight`; Mathlib `Height.logHeight₁_eq_logHeight`; Mathlib `Height.mulHeight_smul_eq_mulHeight`; Mathlib Projectivization; Mathlib `Projectivization.rep`; §0.4; §0.10; §0.1.

### Examples

At `p=3` the centres 5 with `N=1` and 0 with `N=2` normalise to `(1,0,2)` and `(2,2,0)`. The first keeps a
unit residue; the second records an entire zero-centred ball. Over `Q, height≤2` gives seven affine
rational values and eight projective points after infinity is included.

### Dependencies

Mathlib number fields, polynomial roots, heights, valuations and Hensel lifting;
`TauCetiRoadmap.RealAlgebraicGeometry` Layer 1; DiophantineApproximationAndTranscendence §§0.1–0.3 for
height conventions.

## Layer 1: Lattice exclusion and finite short-vector searches

Build finite witnesses for the inequalities actually used to cut exponent boxes. General LLL is
supplied by GeometryOfNumbersAndQuadraticArithmetic §5.1; the targets here connect it to each logarithmic problem and verify the final
bounded search.

### 1.1 The approximation lattice of a real linear form

Data: `n ≥ 2`; real numbers `θ_1, …, θ_n` (and `β` for an inhomogeneous form); a positive rational scaling
constant `C`; positive integer weights `W_1, …, W_{n−1}`; integers `φ_1, …, φ_n` with `|φ_i − Cθ_i| ≤ 1` and
`φ_n ≠ 0` (and an integer `ψ` with `|ψ − Cβ| ≤ 1`). Write `Λ(x) = Σ_i x_iθ_i` and `Λ̃(x) = Σ_i x_iφ_i` for `x ∈ ℤ^n`. The approximation lattice `Γ ⊂ ℤ^n` is the image of `ℤ^n` under the integer matrix A whose first n
− 1 rows are `diag(W_1, …, W_{n−1})` padded by a zero last column and whose last row is `(φ_1, …, φ_n)`;
thus `Ax = (W_1x_1, …, W_{n−1}x_{n−1}, Λ̃(x))` and the columns of A form a `ℤ-basis` of `Γ`, with `det A = W_1⋯W_{n−1}·φ_n ≠ 0`. The inhomogeneous target is `y = (0, …, 0, −ψ)`. The basic identities are `‖Ax‖² = Σ_{i<n} W_i²x_i² + Λ̃(x)², |Λ̃(x) − CΛ(x)| ≤ Σ_i |x_i|, ‖Ax − y‖² = Σ_{i<n} W_i²x_i² + (Λ̃(x) + ψ)²`
and `|Λ̃(x) + ψ − C(β + Λ(x))| ≤ 1 + Σ_i |x_i|`. Rounding contract: from a RealEnclosure `[l_i, u_i]` of
`θ_i` with `C(u_i − l_i) ≤ 1, φ_i := round(C(l_i + u_i)/2)` satisfies `|φ_i − Cθ_i| ≤ 1/2 + C(u_i − l_i)/2 ≤ 1`. The columns of A, as vectors of Euclidean `ℝ^n`, have integer Gram matrix `AᵀA`, which is
the input of GeometryOfNumbersAndQuadraticArithmetic §5.1's exact LLL; a reduced basis `AU (U` unimodular) gives exact rational coordinates `s = (AU)^(−1)y`. de Weger takes `W_i = γ` for all i; Tzanakis–de Weger 1989 take `W_i = 1` and `C = c_0`;
Tzanakis–de Weger 1992 §16 take general weights.

Work under the following conditions. `n ≥ 2, C ∈ ℚ` with `C > 0, W_i ∈ ℤ` with `W_i ≥ 1, φ_n ≠ 0`. The
rounding errors satisfy `|φ_i − Cθ_i| ≤ 1` and `|ψ − Cβ| ≤ 1`; these are checked from §0.1 enclosures.

The interface includes these statements.

- The `n × n` integer matrix A built from `W` and `φ`.
- `A x = (W_1x_1, …, W_{n−1}x_{n−1}, Σ_i x_iφ_i)`.
- `det A = (∏_{i<n} W_i)·φ_n`.
- `Γ = {A x : x ∈ ℤ^n} ⊆ ℤ^n`.
- `v ∈ Γ` iff `W_i ∣ v_i` for `i < n` and `φ_n ∣ v_n − Σ_{i<n}(v_i/W_i)φ_i`.
- `x ↦` A x is injective when `φ_n ≠ 0`, so the columns are a basis of `Γ`.
- `‖A x‖² = Σ_{i<n} W_i²x_i² + Λ̃(x)²`.
- `|Λ̃(x) − CΛ(x)| ≤ Σ_i |x_i|` when `|φ_i − Cθ_i| ≤ 1`.
- `y = (0, …, 0, −ψ)` and `‖A x − y‖² = Σ_{i<n} W_i²x_i² + (Λ̃(x) + ψ)²`.
- From a RealEnclosure of `θ_i` with `C·width ≤ 1, round(C·midpoint)` satisfies `|φ_i − Cθ_i| ≤ 1`.
- The Gram matrix of the columns in Euclidean `ℝ^n` is `AᵀA ∈ ℤ^(n×n)`, the Gram matrix used by the reduced-basis inequalities of GeometryOfNumbersAndQuadraticArithmetic §5.1.

For the proof, `Ax` is computed coordinatewise from the definition of A `(Matrix.mulVec)`; `det A` is the
product of the diagonal of the lower-triangular-by-blocks matrix `(Matrix.det)`. `‖Ax‖²` and `‖Ax − y‖²`
are sums of squares of the coordinates. `Λ̃(x) − CΛ(x) = Σ_i x_i(φ_i − Cθ_i)`, so the triangle
inequality gives the rounding bounds; adding `ψ − Cβ` gives the inhomogeneous bound. Rounding:
`|round(q) − q| ≤` 1/2 for rational q (Mathlib's round), and `|Cm_i − Cθ_i| ≤ C(u_i − l_i)/2` for the
midpoint `m_i`. The Gram matrix `AᵀA` is integral, so
GeometryOfNumbersAndQuadraticArithmetic §5.1 applies when a reduced basis AU and
integral inverse matrices U,V with `UV = VU = I` are supplied.

**Checks.**

- `n = 2, W_1 = 1, φ = (3, 7): A = [[1, 0], [3, 7]], det A = 7, (1, 3) ∈ Γ` and `(0, 1) ∉ Γ`.
- All `W_i = 1` and `φ_n = 1` give `Γ = ℤ^n`.
- `θ = (log 2, log 3), C = 10^8`: from enclosures of width `10^(−9)` the rounding gives `φ = (69314718, 109861229)`.
- `φ_n = 0` gives `det A = 0`; the columns are not a basis and the construction is rejected.
- For `W_1 = 1, φ = (3, 7): v ∈ Γ` iff `7 ∣ v_2 − 3v_1`.
- Tzanakis–de Weger 1989, §III.2: `n = 3, W_i = 1, C = c_0 = 10^140, φ_i = [c_0μ_i]` for `μ_i = log|ε_i^(4)/ε_i^(3)|` (or `log|ε_i^(2)/ε_i^(1)|), ψ = [c_0δ]`.
- `θ = (log 2, log 3), C = 10^8: A = [[1, 0], [69314718, 109861229]]`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.7, printed p. 53; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3(i), printed p. 112; [N.
Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §16, printed p. 264.)

*Needs:* §0.1; Mathlib round; Mathlib `Matrix.mulVec`; Mathlib `Matrix.det`; Mathlib `Submodule.span`; GeometryOfNumbersAndQuadraticArithmetic §5.1.

### 1.2 Lower bounds for lattice distances from a reduced basis

Let `E` be a real inner product space and `c_0, …, c_{n−1} ∈ E` linearly independent (`n ≥ 1`, zero-based
indices as in GeometryOfNumbersAndQuadraticArithmetic §5.1) with Gram–Schmidt vectors `c*_i` (Mathlib's `gramSchmidt`), and suppose `‖c*_i‖² ≥ 2^(−(n−1))‖c_0‖²` for all i; this holds for every LLL-reduced family at `δ =` 3/4
(GeometryOfNumbersAndQuadraticArithmetic §5.1 with `j = 0`) and is de Weger's `(3.12)`. Let `Γ` be the `ℤ-span` of the `c_i`
and `‖s‖` the distance from `s ∈ ℝ` to the nearest integer. (a) Every nonzero `v ∈ Γ` satisfies `‖v‖² ≥ 2^(−(n−1))‖c_0‖² (de` Weger Lemma `3.4`, LLL Proposition `1.11). (b`) Let `y = Σ_i s_i c_i` with `s_i ∈ ℝ`
not all integers and `i_0` the largest index with `s_{i_0} ∉ ℤ`. Then every `v ∈ Γ` satisfies `‖v − y‖² ≥ 2^(−(n−1))·‖s_{i_0}‖²·‖c_0‖² (de` Weger Lemma `3.5). (c`) Let instead `i_0` be any index (not necessarily
the largest non-integral one) and `δ_1 ≥ 0, δ_2 > 0` with `‖s_i‖ ≤ δ_1` for all `i > i_0` and `‖s_{i_0}‖ ≥ δ_2`; then every `v ∈ Γ` satisfies `‖v − y‖ ≥ 2^(−(n−1)/2)·δ_2·‖c_0‖ − (n − 1 − i_0)·δ_1·max({‖c_i‖ :`
`i>i_0} ∪ {0}) (de` Weger Lemma `3.6`, zero-based).

Work under the following conditions. `E` a real inner product space; c : Fin `n → E` linearly
independent; ∀ `i, ‖c*_i‖² ≥ 2^(−(n−1))‖c_0‖²`. In (b), (c): s : Fin `n → ℝ` and `y = Σ s_i c_i`; in `(b) i_0` is the largest index with `s_{i_0} ∉ ℤ`, in `(c) i_0` is any index satisfying the bounds stated
there.

For the proof, Write `v = Σ r_i c_i` with `r_i ∈ ℤ`. Gram–Schmidt is triangular: `c_i ∈ c*_i + span(c*_j`
: `j < i`), so the `c*_k-coordinate` of `Σ_i (r_i − s_i) c_i` equals `r_k − s_k` for the largest k with `r_k ≠ s_k`. By orthogonality `(InnerProductSpace.gramSchmidt_orthogonal), ‖v − y‖² ≥ (r_k − s_k)²‖c*_k‖² ≥ (r_k − s_k)²·2^(−(n−1))‖c_0‖²`. Since `s_{i_0} ∉ ℤ` and `r_{i_0} ∈ ℤ` we have `k ≥ i_0`; if `k = i_0` then
`|r_k − s_k| ≥ ‖s_{i_0}‖`, and if `k > i_0` then `s_k ∈ ℤ, r_k ≠ s_k`, so `|r_k − s_k| ≥ 1 ≥ ‖s_{i_0}‖`.
This proves (b); (a) is the same argument with `s = 0` and `v ≠ 0`. (c): let `t_i` be the nearest integer
to `s_i` for `i > i_0` and `t_i = s_i` for `i ≤ i_0, z = Σ t_i c_i`; then `‖z − y‖ ≤ (n − 1 − i_0)δ_1 max({‖c_i‖ : i>i_0} ∪ {0}`), and the argument of (b) applied to z (whose largest non-integral
coordinate is `i_0`, with `‖t_{i_0}‖ ≥ δ_2`, and `|r_k − t_k| ≥ 1 > δ_2` for `k > i_0`) gives `‖v − z‖ ≥ 2^(−(n−1)/2)δ_2‖c_0‖`; conclude by the triangle inequality.

**Checks.**

- `Γ = ℤ²` with `c = (e_1, e_2)` (LLL-reduced) and `y = (1/2, 0): i_0 = 0` and (b) gives `‖v − y‖² ≥ 2^(−1)·(1/4)·1 =` 1/8, while the true minimum is 1/4.
- Tzanakis–de Weger 1989, §III.2: for the lattices `Γ_1, Γ_2` with `c_0 = 10^12, |b_1| > 1.092·10^4` and `‖s_3‖ > 0.143` give `l(Γ, y) > 2^(−1)·0.143·1.092·10^4 > 780` (here `i_0` is the last index).

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.4, Lemma 3.5, printed p. 43; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), §3.4, Lemma 3.6, printed p. 44; [N. Tzanakis, B. M. M. de
Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §15, (35), printed p. 261.)

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §5.1; Mathlib `InnerProductSpace.gramSchmidt`; Mathlib `InnerProductSpace.gramSchmidt_orthogonal`; Mathlib `Submodule.span`; Mathlib `Int.fract`.

### 1.3 Reduction of a homogeneous real linear form

Let `Γ` be the approximation lattice of §1.1 for the homogeneous form `Λ(x) = Σ_i x_iθ_i (|φ_i − Cθ_i| ≤ 1, φ_n ≠ 0)`. Let `X_1, …, X_n ≥ 0, μ > 0` and `L ≥ 0` be reals with `L² ≥ Σ_{i<n} W_i²X_i² + (Σ_{i=1}^n X_i + μ)²`, and suppose every nonzero `v ∈ Γ` satisfies `‖v‖ ≥ L`. Then every `x ∈ ℤ^n` with `x ≠ 0` and
`|x_i| ≤ X_i` for all i satisfies `C·|Λ(x)| ≥ μ`. Consequently, if `c, δ > 0` and x is such a vector with
`|Λ(x)| < c·exp(−δ·max_i|x_i|)`, then `max_i|x_i| < (1/δ)·log(cC/μ)`. With `W_i = γ, X_i = X_1` and `μ = X_1` the hypothesis is de Weger's `ℓ(Γ) ≥ √((n+1)² + (n−1)γ²)·X_1` (Lemma `3.7`); with `W_i = 1, X_i = K_3, L = 2^(−(q−1)/2)|b_1|` and the largest admissible margin `μ = √(L² − (q−1)K_3²) − qK_3` (positive
exactly when `|b_1| > √((q² + q − 1)·2^(q−1))·K_3`) it is Tzanakis–de Weger's Proposition `3.1`.

Work under the following conditions. Setting of §1.1 with `β = 0`. `L` is any exact lower bound for
the nonzero vectors of `Γ, e.g`. `2^(−(n−1)/2)‖c_0‖` for an LLL-reduced basis
(GeometryOfNumbersAndQuadraticArithmetic §5.1) or one read from a Fincke–Pohst enumeration `(§1.8)`.

For the proof, `x ≠ 0` and `det A ≠ 0` give `A x ≠ 0`, so `‖Ax‖² ≥ L²`. `‖Ax‖² = Σ_{i<n} W_i²x_i² + Λ̃(x)² ≤ Σ_{i<n} W_i²X_i² + Λ̃(x)²`, hence `|Λ̃(x)| ≥ Σ_i X_i + μ`. `C|Λ(x)| ≥ |Λ̃(x)| − |Λ̃(x) − CΛ(x)| ≥ Σ_i X_i + μ − Σ_i |x_i| ≥ μ`. If `|Λ(x)| < c·exp(−δX)` with `X = max|x_i|`, then `μ ≤ C|Λ(x)| < cC·exp(−δX), i.e`. `X < (1/δ)log(cC/μ)`.

**Checks.**

- Computed instance: `θ = (log 2, log 3), C = 10^8, W_1 = 1, φ = (69314718, 109861229)`. The Gauss–LLL reduced basis of `Γ` has `c_0 = (−1054, 4513)` with `‖c_0‖² = 21478085`, so `L² = 21478085/2 ≥ 1000² + (2000 + 1000)² = 10^7`. Hence `|x_1 log 2 + x_2 log 3| ≥ 10^(−5)` for all `(x_1, x_2) ≠ 0` with `|x_i| ≤ 1000` (the true minimum there is `|306 log 3 − 485 log 2| ≈ 1.02·10^(−3)`).
- de Weger, Lemma `3.7`, is the case `W_i = γ, X_i = μ = X_1`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.7, Lemma 3.7, printed p. 54; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3, Proposition 3.1, printed
p. 114.)

*Needs:* §1.1.

### 1.4 Reduction of an inhomogeneous real linear form

Let `Γ`, A and `y = (0, …, 0, −ψ)` be as in §1.1 for the form `β + Λ(x) (|φ_i − Cθ_i| ≤ 1, |ψ − Cβ| ≤ 1, φ_n ≠ 0)`. Let `X_1, …, X_n ≥ 0, μ > 0` and `L ≥ 0` be reals with `L² ≥ Σ_{i<n} W_i²X_i² + (1 + Σ_{i=1}^n X_i + μ)²`, and suppose every `v ∈ Γ` satisfies `‖v − y‖ ≥ L`. Then every `x ∈ ℤ^n` with `|x_i| ≤ X_i` for
all i satisfies `C·|β + Λ(x)| ≥ μ`; consequently, if `|β + Λ(x)| < c·exp(−δ·max_i|x_i|)` for such x,
then `max_i|x_i| < (1/δ)·log(cC/μ)`. With `W_i = γ, X_i = X_1 ≥ 1` and `μ = X_1` the hypothesis follows
from de Weger's `ℓ(Γ, y) ≥ √((n+2)² + (n−1)γ²)·X_1` (Lemma `3.10`). With `W_i = 1, X_i = K_3 ≥ 2, μ = qK_3` and `L = 2^(−(q−1)/2)‖s_{i*}‖|b_1|` it is Tzanakis–de Weger's Proposition `3.2`, whose constant
`√(4q² + 3q − 3/4)·K_3` dominates the required one exactly when `K_3 ≥ 2`.

Work under the following conditions. Setting of §1.1 with target y. `L` is an exact lower bound for
the distance from y to `Γ, e.g`. from §1.2 (b) or (c), or from a Fincke–Pohst enumeration.

For the proof, For x in the box, A `x ∈ Γ`, so `L² ≤ ‖Ax − y‖² = Σ_{i<n} W_i²x_i² + (Λ̃(x) + ψ)²`, hence
`|Λ̃(x) + ψ| ≥ 1 + Σ_i X_i + μ`. `C|β + Λ(x)| ≥ |Λ̃(x) + ψ| − |Λ̃(x) + ψ − C(β + Λ(x))| ≥ 1 + Σ_i X_i + μ − (1 + Σ_i |x_i|) ≥ μ`. The exponential consequence is as in §1.3. Comparison with Proposition `3.2: (q − 1)K_3² + (1 + 2qK_3)² ≤ (4q² + 3q − 3/4)K_3² = (q − 1)K_3² + (2q + 1/2)²K_3²` iff `K_3 ≥ 2`.

**Checks.**

- Tzanakis–de Weger 1989, §III.2, second step: `q = n = 3, W_i = 1, C = c_0 = 10^12, X_i = K_3 = 72, μ = qK_3 = 216, L > 780` from `|b_1| > 1.092·10^4` and `‖s_3‖ > 0.143`. Required: `L² ≥ 2·72² + (1 + 216 + 216)² = 197857, i.e`. `L ≥ √197857 = 444.81…`; it holds. With `K_1 = 6.38771·10^4` and `K_2 = 3.303` this gives A `< (1/3.303)·log(10^12·6.38771·10^4/216) < 10.1`, so A `≤ 10`.
- Tzanakis–de Weger 1989, §III.2, first step: `c_0 = 10^140, K_3 = 3.26·10^40, ‖s_3‖ > 0.029` and `|b_1| > 3.247·10^46` give A `< 72.4`, so A `≤ 72`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.8, Lemma 3.10, printed p. 58; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3, Proposition 3.2, printed
p. 114; [Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3,
proof of Proposition 3.2, printed p. 115.)

*Needs:* §1.1.

### 1.5 The approximation lattice of a p-adic linear form

Data: a prime `p, m ∈ ℕ, n ≥ 1`, p-adic integers `β_0, β_1, …, β_{n−1} ∈ ℤ_p` and positive integer
weights `W_1, …, W_n`. The normalised p-adic linear form is `Λ′(b) = b_n − β_0 − Σ_{j<n} b_jβ_j` for `b ∈ ℤ^n` (homogeneous when `β_0 = 0`). For `x ∈ ℤ_p` let `x^(m) ∈ [0, p^m − 1]` be the integer with `x ≡ x^(m)`
(mod `p^m`) (Mathlib's `PadicInt.appr x m`). The lattice `Γ_m ⊂ ℤ^n` is generated by the columns of the
integer matrix `A_m` whose first n − 1 rows are `diag(W_1, …, W_{n−1})` padded by a zero last column and
whose last row is `W_n·(β_1^(m), …, β_{n−1}^(m), p^m)`; the target is `y_m = (0, …, 0, −W_nβ_0^(m))`.
Characterisation (Tzanakis–de Weger 1992, Lemma 14; de Weger, Lemmas `3.13` and `3.15` with the sign of
y corrected): for `b ∈ ℤ^n, p^m` divides `Λ′(b)` in `ℤ_p (i.e`. `ord_p Λ′(b) ≥ m`) if and only if `(W_1b_1, …, W_nb_n) + y_m ∈ Γ_m`. In that case `‖(W_jb_j)_j‖ = ‖v − y_m‖` for the lattice vector `v = (W_jb_j)_j + y_m`. `det A_m = p^m·W_1⋯W_n`. The integers `β_j^(m)` are read from PadicEnclosures of `β_j` of absolute
precision at least m whose centres are p-integral.

Work under the following conditions. p prime, `m ∈ ℕ, n ≥ 1, β_j ∈ ℤ_p, W_j ∈ ℤ` with `W_j ≥ 1`. The `β_j`
are given by §0.1 p-adic enclosures of absolute precision `≥ m`.

The interface includes these statements.

- The integer matrix `A_m` built from `p, m, W` and the `β_j^(m)`.
- `y_m = (0, …, 0, −W_nβ_0^(m))`.
- `Λ′(b) = b_n − β_0 − Σ_{j<n} b_jβ_j ∈ ℤ_p`.
- `p^m ∣ Λ′(b)` iff `(W_jb_j)_j + y_m ∈ Γ_m`.
- `det A_m = p^m·∏_j W_j`.
- With fixed data, `Γ_{m+1} ⊆ Γ_m`.
- From a PadicEnclosure `(c, N)` of `β` with `N ≥ m` and `v_p(c) ≥ 0`, the residue of c in `[0, p^m − 1]` equals `PadicInt.appr β m`.

For the proof, For `z = (b_1, …, b_{n−1}, λ) ∈ ℤ^n, A_m z = (W_1b_1, …, W_{n−1}b_{n−1}, W_n(Σ_{j<n} b_jβ_j^(m) + p^mλ))`. Given b, set `λ = (b_n − β_0^(m) − Σ_{j<n} b_jβ_j^(m))/p^m`; then `A_m(b_1, …, b_{n−1}, λ) = (W_jb_j)_j + y_m`, and this vector is in `Γ_m` iff `λ ∈ ℤ` (the columns are a basis since
`det A_m ≠ 0`). `λ ∈ ℤ` iff `p^m` divides `b_n − β_0^(m) − Σ b_jβ_j^(m)` in `ℤ`, iff `p^m` divides `Λ′(b)` in `ℤ_p`,
because `β_j − β_j^(m) ∈ p^mℤ_p (PadicInt.appr_spec)`. From a PadicEnclosure `(c, N)` of `β_j` with `N ≥ m`
and c p-integral, `β_j^(m)` is the residue of c modulo `p^m` in `[0, p^m − 1]`.

**Checks.**

- `p = 3, m = 1, n = 2, W = (1, 1), β_1 = 0, β_0 = 1: Γ_1 = ℤ × 3ℤ, y_1 = (0, −1)`, and `b = (0, 1)` has `Λ′(b) = 0` and `(b_1, b_2) + y_1 = (0, 0) ∈ Γ_1`.
- In the same data, the translate with `y = (0, +1)` (the printed sign of de Weger's Lemma `3.15`) characterises `b_2 ≡ 2` (mod 3), not `3 ∣ Λ′(b)` ⇔ `b_2 ≡ 1` (mod 3).
- `m = 0: A_0 = diag(W_1, …, W_n)` up to the last row `W_n(0, …, 0, 1), Γ_0 = ⊕_j W_jℤ`, and every b satisfies `p^0 ∣ Λ′(b)`.
- `n = 1: Γ_m = W_1p^mℤ` and the characterisation says `b_1 ≡ β_0 (mod p^m`), i.e. `b_1 ≡ PadicInt.appr β_0 m`.
- Tzanakis–de Weger 1992, §15E: for `p_1 = 2, m = 1152` and `W_j = 1` the six-dimensional lattice `Γ_m` has `det = 2^1152`.
- `p = 3, m = 1, β_1 = 0, β_0 = 1: Γ_1 = ℤ × 3ℤ` and `y_1 = (0, −1)`.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §15, printed p.
260; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.11, Lemma 3.13, printed p. 64; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), §3.12, printed p. 65.)

*Needs:* §0.1; Mathlib `PadicInt.appr`; Mathlib `PadicInt.appr_spec`; Mathlib PadicInt; Mathlib `Matrix.mulVec`; Mathlib `Matrix.det`.

### 1.6 Reduction of a p-adic linear form

In the setting of §1.5, let `X_1, …, X_n ≥ 0` and `L ≥ 0` be reals with `L² > Σ_j W_j²X_j²`. (a)
Inhomogeneous: if `‖v − y_m‖ ≥ L` for every `v ∈ Γ_m`, then every `b ∈ ℤ^n` with `|b_j| ≤ X_j` for all j
satisfies `ord_p Λ′(b) ≤ m − 1, i.e`. `p^m ∤ Λ′(b)`. (b) Zero target (`y_m = 0`, which holds when `β_0 = 0`
and more generally when `β_0^(m) = 0`): if `‖v‖ ≥ L` for every nonzero `v ∈ Γ_m`, the same holds for every
nonzero b in the box. Consequently, if `Λ = ξ·Λ′` with `ord_p ξ = κ` known and a solution satisfies
`ord_p Λ(b) ≥ c_1 + c_2·b_k` with `c_2 > 0`, then `b_k ≤ (m − 1 + κ − c_1)/c_2`. This is Tzanakis–de Weger
1992, Proposition 15 (weights `W_j, X_j` the a priori bounds, `Q = Σ W_j²X_j²`), and de Weger, Lemmas
`3.14` and `3.16` (unit weights, `X_j = X_1`, condition `ℓ(Γ_μ) > √n·X_1`).

Work under the following conditions. Setting of §1.5. `L` is an exact lower bound, `e.g`. from §1.2
applied to an LLL-reduced basis of `Γ_m`.

For the proof, Suppose `p^m ∣ Λ′(b)`. By the characterisation, `v := (W_jb_j)_j + y_m ∈ Γ_m` and `‖v − y_m‖² = Σ_j W_j²b_j² ≤ Σ_j W_j²X_j² < L²`, contradicting `‖v − y_m‖ ≥ L`. In the homogeneous case `b ≠ 0`
gives `v = (W_jb_j)_j ≠ 0`, and the same contradiction arises. `ord_p Λ(b) = κ + ord_p Λ′(b) ≤ κ + m − 1`, combined with `ord_p Λ(b) ≥ c_1 + c_2b_k`, bounds `b_k`.

**Checks.**

- Tzanakis–de Weger 1992, §15E: `p_1 = 2, m = 1152`, six unknowns with `W_j = 1` and `X_j = K_0 = 9.844·10^49`, so `Σ_j W_j²X_j² = 6K_0²` and `√6·K_0 = 2.41127…·10^50`; the exact bound `l(Γ_m, y) > 3.98541·10^56` (case `I`) exceeds it, so `ord_2 Λ′ ≤ 1151` and `n_1 ≤ 1153`. The uncorrected1992 Appendix A3 constants do not establish this initial bound: use the1993 Baker–Wüstholz route, or start `at1.511×10^50` with the corrected BGMMS factor and its `H≤4919` bridge (1993 correction, pp. 241–242).
- One-dimensional check: `p = 3, m = 2, β_0 = 5` (so `β_0^(2) = 5), W_1 = 1: Γ_2 = 9ℤ, y = −5`, distance 4; with `X_1 = 3 (9 < 16)` no b with `|b| ≤ 3` has `9 ∣ b − 5`.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §15, Proposition
15, printed p. 262; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.11, Lemma 3.14, printed p.
64; [N. Tzanakis and B. M. M. de Weger](https://numdam.org/item/CM_1993__89_2_241_0.pdf),
pp.241–242, corrected initial bound and both repaired reduction routes.)

*Needs:* §1.5.

### 1.7 The finite set of lattice points in an ellipsoid

For `n ≥ 1`, a positive-definite symmetric rational matrix `G`, a rational centre t and
`R ∈ ℚ`, the set of integer vectors x with (x − t)ᵀG(x `− t) ≤ R` is finite: this is the affine
bounded-norm consequence of IntegralLattices Layer 2. Write the rational LDL decomposition
xᵀGx `= Σ_i q_ii(x_i + Σ_{j>i}q_ij x_j)²`; its pivots `q_ii` are all positive exactly when `G` is
positive definite. The level-set description of Fincke–Pohst says that the same set consists of
the integer vectors for which every tail remainder is nonnegative: `T_n = R, U_k = Σ_{j>k}q_kj(x_j − t_j)`
and `T_{k−1} = T_k − q_kk(x_k − t_k + U_k)² ≥ 0` for `k = n, …, 1`. This is an equality of finite
sets, including their boundary, both signs and zero. For a matrix that is not positive definite
nothing is asserted: the theorems about lattice points require positive definiteness.

Prove: the completed-square identity whenever the leading pivots are nonzero; positivity of all
pivots if and only if `G` is positive definite; symmetry of the set under `x ↦ −x` when `t = 0`;
emptiness when `R < 0`; and monotonicity in `R`.

For the proof, the LDL identity expresses the norm as a sum of positive squares. Its partial
sums are at most `R` exactly when all the tail remainder inequalities hold. With `y =` At,
these are precisely the vectors Ax of `Aℤⁿ` at squared distance at most `R` from y.

**Checks.**

- `G = I_2, t = 0, R = 1`: the set is `{0, ±e_1, ±e_2}` (five vectors).
- `G = [[2, 1], [1, 2]], t = 0, R = 2`: the set is `{0, ±(1, 0), ±(0, 1), ±(1, −1)}` (seven vectors); `(1, 1)` has value 6 and is excluded.
- `n = 1, G = (1), t = 1/2, R =` 1/4: the set is `{0, 1}`; both boundary points are retained.
- `R = −1` gives the empty set for every `G` and t.
- For `G = [[2, 1], [1, 2]]` and `R = 2` the box `|x_i| ≤ 1` contains `(1, 1)`, which is not in the set: bounding each coordinate separately overcounts.
- For the lattice of `θ = (1, √2), C = 100, φ = (100, 141)` (the matrix with rows `(1, 0)` and `(100, 141)`), the set for `R = 73` is `{0}` and the set for `R = 74` contains `±(−7, 5)`, since `A(−7, 5) = (−7, 5)` has squared length 74 and every other nonzero vector `(a, 100a + 141b)` with `|a| ≤ 8` has `|100a + 141b| > 8`.

([U. Fincke, M. Pohst](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/),
(2.8), printed p. 465; [U. Fincke, M.
Pohst](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/), §2, printed p.
464; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.6, printed p. 51; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), §3.6, printed pp.51–53, Figure 2 and its affine-target
extension.)

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §5.1; Mathlib `Matrix.mulVec`; Mathlib `Matrix.PosDef`.

### 1.8 Lattice points at bounded distance from a target

Let `G ∈ ℚ^(n×n)` be positive definite symmetric, `t ∈ ℚ^n` and `R ∈ ℚ`. Lattice form: if A `∈ ℤ^(n×n)`
is nonsingular with `G = AᵀA, Γ = Aℤ^n` and `y ∈ ℚ^n` with `t = A^(−1)y`, then
`{v ∈ Γ : ‖v − y‖² ≤ R} = {A x : x ∈ ℤ^n, (x − t)ᵀG(x − t) ≤ R}`, a finite set by §1.7.
Distance consequences: if this set is empty then `‖v − y‖² > R` for every `v ∈ Γ`; if `t = 0` and
the set is `{0}` then `‖v‖² > R` for every nonzero `v ∈ Γ`; in general every `v ∈ Γ` satisfies
`‖v − y‖² ≥ min({R} ∪ {(x − t)ᵀG(x − t) : x in the set})`.

Work under the following conditions. `G` positive definite symmetric `(§1.7); t ∈ ℚ^n; R ∈ ℚ`. In the
lattice form A is a nonsingular integer matrix.

For the proof, `‖Ax − y‖² = (x − t)ᵀAᵀA(x − t)`, and `x ↦ A x` is a bijection `ℤ^n → Γ`, so the two
sets correspond; finiteness is §1.7. The distance consequences follow because every lattice
vector outside the set has squared distance `> R`, and every vector inside has squared distance
equal to its value of the quadratic form.

**Checks.**

- `G = [[2, 1], [1, 2]], t = 0, R = 2`: exactly the seven vectors `{0, ±(1, 0), ±(0, 1), ±(1, −1)}` satisfy xᵀGx `≤ 2`.
- `Γ = ℤ(1, 0) + ℤ(0, 10), y = (0, −1), R =` 1/2: the set is empty, so `‖v − y‖² >` 1/2 for all `v ∈ Γ` (the true distance is 1).
- For `G = (1)`, `t = 1/2` and `R = 1/4`, both integral vectors 0 and 1 lie on the boundary and must be retained.
- For `Γ = ℤ²`, `y = (1/2, 0)` and `R = 1`: the set is `{(0, 0), (1, 0)}` with both values `1/4`, so the general bound gives `‖v − y‖² ≥ 1/4` for every `v ∈ Γ`, which is sharp; a bound reading `≥ R` would be false.

([U. Fincke, M. Pohst](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/),
§2, (2.6)–(2.7), printed p. 465; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.6, printed p.
51; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.6, printed pp.51–53, Figure 2 and its
affine-target extension.)

*Needs:* §1.7.

### 1.9 Residual enumeration for a real linear form

Let `Γ`, A, y (or `y = 0`) be as in §1.1 for the form `β + Λ (β = 0` and `ε = 0` in the homogeneous case, `ε = 1` otherwise), let `X_1, …, X_n ≥ 0` and `K_0 ≥ ε + Σ_i X_i` be rationals, `R = Σ_{i<n} W_i²X_i² + K_0²`,
and `E` the finite set of §1.8 of `x ∈ ℤ^n` with `‖Ax − y‖² ≤ R`. Then every `x ∈ ℤ^n` with `|x_i| ≤ X_i` for all i satisfies `x ∈ E` or `C·|β + Λ(x)| > K_0 − ε − Σ_i|x_i| ≥ 0`. Consequently, when `K_0 > ε + Σ_i X_i`, all solutions in
the box of `|β + Λ(x)| < c·exp(−δ max_i|x_i|)` are among the finitely many `x ∈ E` checked individually,
together with those satisfying `max_i|x_i| < (1/δ)·log(cC/(K_0 − ε − Σ_i|x_i|)) (de` Weger, Lemma `3.8`
and the procedure after it).

Work under the following conditions. Setting of §1.1; `X_i, K_0` rational with `K_0 ≥ ε + Σ X_i`.

For the proof, If `x ∉ E` then `‖Ax − y‖² > R` by §1.8, and `Σ_{i<n} W_i²x_i² ≤ Σ_{i<n} W_i²X_i²`, so
`|Λ̃(x) + ψ| > K_0 (ψ = 0` when homogeneous). `C|β + Λ(x)| ≥ |Λ̃(x) + ψ| − ε − Σ_i|x_i| > K_0 − ε − Σ_i|x_i|` (the rounding bound of the lattice construction). With `|β + Λ(x)| < c·exp(−δX)` this gives
the stated bound for `X = max|x_i|`; this is de Weger's `(3.25)`.

**Checks.**

- For `θ = (1, √2), C = 100, φ = (100, 141), W_1 = 1, X_1 = X_2 = 3` and `K_0 = 6: R = 9 + 36 = 45`, and every x with `|x_i| ≤ 3` is either an enumerated short vector or satisfies `100|x_1 + x_2√2| > 6 − Σ|x_i| ≥ 0`; the shortest nonzero vector of `Γ` is `A(−7, 5) = (−7, 5)` with squared length `74 > 45`, so `E = {0}`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.7, Lemma 3.8 and following paragraph, printed p.
55.)

*Needs:* §1.1; §1.8.

### 1.10 Lattice exclusion data for linear forms

For a nonsingular integer matrix A and rational target `y, ED1.DistanceWitness`
means a rational lower bound `L² ≥ 0` for `‖Ax − y‖²` for every integer x, excluding
`x = 0` when `y = 0`. Its bound is `L²` and sound is this inequality.
One source is §1.2: take integral inverse matrices U,V with `UV = VU = I`, assume
AU is LLL-reduced at `δ =` 3/4, and put `s = (AU)⁻¹y`.
If `y = 0, L² = 2^(−(n−1))‖c₀‖²` works. If `y ∉ Aℤⁿ`, let `i₀` be the last
nonintegral coordinate of s; then
`L² = 2^(−(n−1)) dist(s_i₀,ℤ)²‖c₀‖²` works. A nonzero target in `Aℤⁿ`
has distance zero and gives no positive bound by this formula.
An alternative is the minimum of `R` and the finitely many squared distances in §1.8,
excluding zero in the homogeneous case.

A bounded-comparison theorem supplies the arithmetic core without a verification procedure.
Assume AAinv `=` AinvA `= I, B > 0, 0 ≤ L² ≤ B²`, and an integer `D ≥ 0`
with `Σ_j |Ainv_ij|(|y_j| + B) ≤ D` for every row. If every eligible
`x ∈` [−D,D]ⁿ satisfies `L² ≤ ‖Ax − y‖²`, the same inequality holds for every
eligible integer vector: a vector at distance less than `B` lies in this cube, and all others
satisfy the bound from `L² ≤ B²`. State this bounded comparison with these exact hypotheses, together with invariance under an integral inverse basis change.

A real exclusion datum is the conjunction of the §1.1 rounding inequalities,
nonnegative rational coordinate bounds `X_i`, a positive margin `μ`, this distance bound,
and `L² ≥ Σ_{i<n}W_i²X_i² + (ε + Σ_i X_i + μ)²`, with `ε = 0` in the homogeneous
case and `ε = 1` otherwise. A p-adic exclusion datum uses the §1.5 matrix,
canonical coefficient residues, positive integral weights, the same distance inequality,
and the strict separation `L² > Σ_j W_j²X_j²`. Both are mathematical hypothesis bundles;
their conclusion is §1.11. In the p-adic form the matrix has last row
`W_n(r₁,…,r_(n−1),p^m)` and target `y = (0,…,0,−W_n r₀)`.
Require the actual coefficient identities `appr(β_j,m) = r_j, appr(β₀,m) = r₀`
and `0 ≤ r_j < p^m`; determinant equality alone does not identify this lattice.
A solution to the congruence gives `Wb + y = Aa`, contradicting strict separation.
The conclusion excludes the exact-zero linear form as well as nonzero forms of high valuation.
The real logarithm interval and normalized p-adic residue hypotheses are supplied by the proved
precision results of §§0.9, `2.1` and `2.6`, rather than by a proposed solution list.

The API includes `DistanceWitness.ofLLL` as the two conditional lower-bound formulas above,
`RealExclusionData.sound, PadicExclusionData.not_congruent` and
`PadicExclusionData.matrix_target_eq`. These are implications between the stated
mathematical conditions. The real reduction assumes `n ≥ 2`, the p-adic reduction `n ≥ 1`;
the bounded rational comparison also applies in dimension one.

**Checks.**

- For A `= [2], y = 2`, the basis is reduced and `s = 1`. The affine distance is zero and the positive affine lower-bound hypothesis fails; `A.det ≠ 0` alone must not produce an LLL witness. With `y = 0` the homogeneous witness is available, and with `y = 1` the nonintegral-pivot branch is available.

- `θ = (log 2, log 3), C = 10^8, φ = (69314718, 109861229), U` with `AU = [c_0 c_1], c_0 = (−1054, 4513), y = 0, X = (1000, 1000), μ = 1000: L² = 21478085/2 ≥ 10^7`, so the data form a homogeneous real datum.
- `X_i = 0` for all i: the homogeneous region is empty and any witness with `L² ≥ μ²` certifies it.
- If `s = (AU)^(−1)y ∈ ℤ^n` then `y ∈ Γ`, the LLL witness is rejected, and no positive lower bound for the distance exists.
- `p = 3, m = 2, n = 1, W_1 = 1, β_0^(2) = 5`, enumeration witness `R = 15` with `E = ∅ (Γ_2 = 9ℤ, y = −5`, distances `≥ 4² = 16 > 15), X_1 = 3: L² = 15 > 9 = X_1²`, a p-adic datum.
- `A=1,y=0,Ainv=1,B=L²=D=1` in dimension one passes: every nonzero integer has square at least one.
- Replacing Ainv by zero in that data fails the inverse check.
- `A=1,y=1,Ainv=1,B=L²=1,D=2` fails: `x=1` gives distance zero.
- `C=W=1, φ=θ=10, β=ψ=0, X=margin=1, A=10, inverse=1/10, B=2, lower=4,D=1` passes the complete homogeneous finite check.
- Changing the upper `θ` endpoint from10 to12 rejects the rounding condition.
- Replacing the distance inverse1/10 by0 rejects the full check.
- `p=3,m=2,W=1,r₀=5,X=3,A=9,y=−5,Ainv=1/9,B=4,L²=15,D=1` passes. The complete checked cube is `{−1,0,1}`, with squared distances16,25,196.
- Changing only the target to+5 rejects the matrix/target matching, despite the same positive distance to9Z.
- Changing the inverse1/9 to0 rejects the full check.
- `p=9,m=1` with otherwise identical modulus9 data are rejected by primality.
- `X=4,L²=16` is rejected: separation is strict, and `b=−4` actually satisfies `b≡5` modulo9.
- `p=3,m=1,r₀=0,W=1,X=0,A=3,y=0,Ainv=1/3,B=L²=D=1` passes for the empty eligible homogeneous region; it never excludes `b=0` without the nonzero hypothesis.
- Tzanakis–de Weger 1989, §III.2 supplies two real inhomogeneous data (`c_0 = 10^140` and `10^12`).
- Tzanakis–de Weger 1992, §15E supplies twelve p-adic data (cases `I`, III and `V` for each of `p = 2, 3, 5, 7`, with `m = 1152, 672, 480, 384`).

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.7, summary after Lemma 3.8, printed p. 55;
[Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §III.2,
printed p. 125.)

*Needs:* §1.1; §1.5; §1.7; GeometryOfNumbersAndQuadraticArithmetic §5.1; §0.1; Mathlib `Int.fract`; Mathlib `PadicInt.appr`; Mathlib `PadicInt.appr_spec`; Mathlib `PadicInt.appr_lt`; Mathlib `PadicInt.pow_p_dvd_int_iff`.

### 1.11 Soundness of lattice exclusion data

Assume the lattice exclusion hypotheses of §1.10. Real kind: every `x ∈ ℤ^n` with `|x_i| ≤ X_i` for all
i (and `x ≠ 0` whenever the target `y = (0, …, 0, −ψ)` is 0, in particular in the homogeneous case)
satisfies `C·|β + Λ(x)| ≥ μ`; hence for `c, δ > 0` no such x satisfies `|β + Λ(x)| < c·exp(−δ·max_i|x_i|)`
with `max_i|x_i| ≥ (1/δ)·log(cC/μ)`. p-adic kind: every `b ∈ ℤ^n` with `|b_j| ≤ X_j` (and `b ≠ 0` whenever
`y_m = 0, i.e`. `β_0^(m) = 0`, in particular when `β_0 = 0`) satisfies `ord_p Λ′(b) ≤ m − 1`. A lattice basis, exact reduction and proved lower bound therefore exclude every
integer vector of the specified region.

Work under the following conditions. All inequalities and coefficient identities of §1.10 hold. `θ_i, β, β_j` are the
numbers enclosed by the datum's enclosures.

For the proof, The distance witness is sound: an LLL witness by §1.2 (a)/(b), using
GeometryOfNumbersAndQuadraticArithmetic §5.1 for the hypothesis on `‖c*_i‖` and the supplied integral inverse basis change for
`AUℤ^n = Aℤ^n`; an enumeration witness by §1.8. Real kind: apply §1.3 or §1.4 with `L` from the witness
and the checked inequality (iv). p-adic kind: apply §1.6. The p-adic form uses
`PadicExclusionData.not_congruent` and sound; the only external semantics are the
exact coefficient residues. The integer nondivisibility conclusion is stronger and safer than
applying an integer-valued valuation to the exact-zero branch.

The strict lattice-distance bound gives the final rounded-sum exclusion implication for integer vectors and real coefficients.

**Checks.**

- Tzanakis–de Weger 1989, §III.2: the real inhomogeneous data with `(C, X_i, μ) = (10^140, 3.26·10^40, 3·3.26·10^40)` and `(10^12, 72, 216)`, with LLL witnesses `|b_1| > 3.247·10^46` (resp. `1.092·10^4`) and `‖s_3‖ > 0.029` (resp. `0.143`), exclude every `(a_1, a_2, a_3)` with `73 ≤ A < 3.26·10^40` (first step) and with `11 ≤ A ≤ 72` (second step) from `|Λ| < 6.38771·10^4·exp(−3.303·A)`.
- Tzanakis–de Weger 1992, §15E: the p-adic datum at `p = 2, m = 1152, W_j = 1, X_j = 9.844·10^49, L > 3.98541·10^56` excludes `ord_2 Λ′ ≥ 1152` throughout the box. The uncorrected1992 Appendix A3 constants do not establish this initial bound: use the1993 Baker–Wüstholz route, or start `at1.511×10^50` with the corrected BGMMS factor and its `H≤4919` bridge (1993 correction, pp. 241–242).
- Computed: the homogeneous datum `exclusion_log23` gives `|x_1 log 2 + x_2 log 3| ≥ 10^(−5)` for all `(x_1, x_2) ≠ 0` with `|x_i| ≤ 1000`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.8, summary after Lemma 3.10, printed p. 59;
[Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §III.2,
printed p. 126; [N. Tzanakis and B. M. M. de
Weger](https://numdam.org/item/CM_1993__89_2_241_0.pdf), pp.241–242, corrected initial bound and
both repaired reduction routes.)

*Needs:* §1.10; §1.2; §1.8; §1.3; §1.4; §1.6; GeometryOfNumbersAndQuadraticArithmetic §5.1; Mathlib `PadicInt.appr`; Mathlib `PadicInt.appr_spec`; Mathlib `PadicInt.appr_lt`; Mathlib `PadicInt.pow_p_dvd_int_iff`.

### Examples

The unit quadratic form at squared radius 1 has five vectors in `Z²` including zero; [[2,1],[1,2]] at
squared radius 2 has seven. With affine centre 1/2 and squared radius 1/4 the one-dimensional answer
is `{0,1}`. These test weak boundaries, both signs and the affine branch.

### Dependencies

Layer 0; GeometryOfNumbersAndQuadraticArithmetic §5.1; native matrices and Gram–Schmidt;
`TauCetiRoadmap.IntegralLattices` Layer 2 for the underlying quadratic lattice facts.

## Layer 2: Effective logarithms and Diophantine reduction

Use the explicit DiophantineApproximationAndTranscendence §§3.6–3.7 lower bounds with independently checked constants, then apply each finite
bound reduction. Separate derivation of a global bound from enumeration within it.

### 2.1 Exact enclosures of logarithms and arguments of embedded algebraic numbers

`ED.2` proves the following rational error bounds. For `x∈Q, x>0`, let
`u=(x−1)/(x+1), r=|u|<1` and `L_N(x)=2 Σ(k<N) u^(2k+1)/(2k+1)`. Then
`|log x−L_N(x)|≤E_N=2r^(2N+1)/((2N+1)(1−r²)); E_N→0`, and `x=1` gives exact0. For `|t|≤1` put
`A_N(t)=Σ(k<N)(−1)^k t^(2k+1)/(2k+1)`; `|arctan t−A_N(t)|≤|t|^(2N+1)/(2N+1)`, also tending to0 at `|t|=1`.
Oddness and `arctan t=sign(t)π/2−arctan(1/t)` for `|t|>1` reduce other rational arguments; `π=4arctan1`
(or Machin’s identity). Choose `N` satisfying the displayed rational error budget. Rational intervals
`[partial−error,partial+error]`, with outward dyadic rounding on mesh `2^(−P−1)`, prove arbitrarily
small endpoint errors without any oracle for an analytic value. These scalar data supply the
following box/log contract. Let `K` be a number field, `σ : K →+* ℂ` a complex embedding, `α ∈ K` with `α ≠ 0`, and let `B = (R, I)` be a closed rational box (`ED.0` rational box containment) with `σ(α) ∈ B`,
delivered by an `ED.0` archimedean embedding datum `(§0.4)`. Let m and `M` be the exact rational
minimum and maximum of `x² + y²` over `(x, y) ∈ R × I (m > 0` exactly when `0 ∉ B`). For a precision `P ∈`
ℕ, `logAbsEnclosure(B, P)` is the closed rational interval obtained by outward dyadic rounding with
mesh `2^(−P−1) (ED.2` outward rational endpoint bounds) of [l/2, u/2], where l is the lower end of the
scalar series enclosure of `Real.log m` and u the upper end of the scalar series enclosure of `Real.log M`, both at precision `P (Real.log ‖z‖ = Real.log(x² + y²)/2)`; it returns none when `0 ∈ B`. When `B` is
contained in the complement of the closed half-line (`−∞, 0`] (that is, `min R > 0`, or `min I > 0`, or
`max I < 0), argEnclosure(B, P`) is the closed rational interval obtained from the scalar arctangent
enclosures at precision `P` of the corner values (at a corner `(x, y): arctan(y/x)` when `x > 0`, and
`sign(y)·π/2 − arctan(x/y)` when `y ≠ 0`, with `π/2` enclosed as `2·arctanEnclosure(1, P + 2)` by
`Real.arctan_one`) rounded outward with mesh `2^(−P−1)`; otherwise it returns none. Conventions pinned:
log is Mathlib's principal logarithm `Complex.log z = Real.log ‖z‖ + i·Complex.arg z` with `Complex.arg z ∈ (−π, π`]; logarithms of real positive numbers are `Real.log`. Soundness: `Real.log ‖σ(α)‖ ∈ logAbsEnclosure(B, P)` and `Complex.arg σ(α) ∈ argEnclosure(B, P)` whenever these are defined; the
outputs are RealEnclosures in the sense of §0.1. Precision budget: if `B` has diameter w and `0 < ρ⁻ ≤ ‖z‖` for all `z ∈ B`, then the width of `logAbsEnclosure(B, P)` is less than `w/ρ⁻ + 3·2^{−P} (2^{−P}` from
the halved `ED.2` rational logarithm/error bounds endpoint enclosures, less than `2·2^{−P}` from outward
rounding) and that of `argEnclosure(B, P)` is less than (`π/2)·w/ρ⁻ + 5·2^{−P} (3·2^{−P}` from the
corner and `π/2` enclosures), so a requested absolute error `ε` is met by refining the box to diameter
at most `ρ⁻ε/4` and taking `2^{−P} ≤ ε/16`.

Work under the following conditions. `σ(α)` lies in the box `B` (the `ED.0` datum's soundness
statement); the enclosure claims nothing about points outside `B` Failure (`0 ∈ B`, or a box meeting the
branch cut for the argument) is returned as data and never as an enclosure The endpoint series
precision is chosen so each scalar interval has `width≤2^(−P)`; the finer rounding mesh adds `<2^(−P)`
total. For combined argument formulas allocate separate budgets to each `arctangent/π` term. The
displayed 3 and5 error constants are safe upper budgets, not sharpness claims.

The interface includes these statements.

- For a rational box `B` and a precision `P, logAbsEnclosure B P` : Option (NonemptyInterval `ℚ`), equal to none exactly when `0 ∈ B`.
- For a rational box `B` and a precision `P, argEnclosure B P` : Option (NonemptyInterval `ℚ`), equal to none exactly when `B` meets the closed half-line (`−∞, 0`].
- If `z ∈ complexBoxSet B` and `logAbsEnclosure B P =` some `J` then `Real.log ‖z‖ ∈ J` (as real numbers).
- If `z ∈ complexBoxSet B` and `argEnclosure B P =` some `J` then `Complex.arg z ∈ J`.
- If `B` has diameter `w, 0 < ρ⁻ ≤ ‖z‖` on `B` and `logAbsEnclosure B P =` some `J`, then the width of `J` is at most `w/ρ⁻ + 3·2^{−P}`.
- For a rational `q > 0` and the degenerate box `[q, q] × [0, 0], logAbsEnclosure` contains `Real.log q` and has width at most `2^{1−P}`.
- For positive rational x and `N∈N`, the rational `L_N(x)=2Σ(k<N)((x−1)/(x+1))^(2k+1)/(2k+1)`.
- For `x>0, r=|(x−1)/(x+1)|, |Real.log x−L_N(x)|≤2r^(2N+1)/((2N+1)(1−r²))`.
- `A_N(t)=Σ(k<N)(−1)^k t^(2k+1)/(2k+1)∈Q`.
- For rational `|t|≤1, |Real.arctan t−A_N(t)|≤|t|^(2N+1)/(2N+1)`, including `t=±1`.
- For `x∈Q, x>0, ε∈Q, ε>0`, there exists `N` with `2E_N≤ε`; its rational error interval contains log x. At `x=1` use [0,0].

For the proof, Integrate the finite geometric identity for `2/(1−u²)` from0 to u. Bound the remaining
integral by `2|u|^(2N+1)/((2N+1)(1−|u|²))`; this proves the log error formula. Integrate the finite
geometric identity for `1/(1+t²)` to prove the arctangent remainder bound, including endpoints `±1`.
Rational inequalities and geometric convergence give a suitable `N` for every positive error budget.
Reuse existing complex logarithm/Taylor bounds rather than rebuilding logarithm convergence; the
special rational odd-series bound supplies the rational endpoint datum. For z in `B, m ≤ ‖z‖² ≤ M, Real.log ‖z‖ = Real.log ‖z‖²/2` and `Real.log` is monotone on `(0, ∞)`, so `Real.log ‖z‖ ∈ [Real.log`
m/2, `Real.log` M/2]; the `ED.2` rational logarithm/error bounds log enclosures of the two rationals `m, M` and outward rounding give rational endpoints enclosing that interval. On the complement of (`−∞, 0`]
the function `Complex.arg` is continuous, and on a box avoiding the closed negative half-axis its
extreme values are attained at corners; at a corner `(x, y)` the value is `arctan(y/x)` for `x > 0` and
`sign(y)·π/2 − arctan(x/y)` for `y ≠ 0` (this covers `x ≤ 0`, where `y ≠ 0` on such a box); enclose each
with the `ED.2` rational logarithm/error bounds arctangent enclosure, and `π/2` as `2·arctan 1` (Mathlib's
`Real.arctan_one`) with the `ED.2` rational logarithm/error bounds arctangent enclosure of 1 at
precision `P + 2`; the six-digit bounds `Real.pi_gt_d6` and `Real.pi_lt_d6 do` not reach precision `2^{−P}`
for `P ≥ 20`. Width: `|Real.log ‖z‖ − Real.log ‖z′‖| ≤ ‖z − z′‖/ρ⁻` and `|arg z − arg z′| ≤ (π/2)‖z − z′‖/ρ⁻` on the box (mean value theorem along the segment and the arc), the `ED.2` rational
logarithm/error bounds enclosures add at most `2^{−P}` (logarithm, after halving) and `3·2^{−P}`
(argument: corner arctangents and `π/2`), and outward rounding adds less than `2·2^{−P} (ED.2` endpoint
error inequality).

**Checks.**

- For the degenerate box `[2, 2] × [0, 0]` and `P = 30` the enclosure is some `J` with `J ⊆ [0.6931471, 0.6931472] (Real.log 2 = 0.69314718…)`.
- For the degenerate box `[1, 1] × [0, 0]` the enclosure contains 0 and has width at most `2^{1−P}`.
- For the degenerate box `[−1, −1] × [0, 0]` (the point −1, on the branch cut) `argEnclosure` returns none, although `Complex.arg (−1) = π` is defined; a wrong definition returning an interval around `π` would be unsound for nearby points below the axis, whose arguments are near `−π`.
- For the box `[−1, 1] × [−1, 1]`, which contains `0, logAbsEnclosure` returns none.
- For the degenerate box `[0, 0] × [1, 1]` the argument enclosure contains `Complex.arg I = π/2`, agreeing with Mathlib's `Complex.arg_I`.
- At `x=2,N=1, u=1/3, L_1=2/3` and `E_1=1/36`. Thus `log2∈[23/36,25/36]`; omitting the factor2 gives an interval below log2.
- At `t=1,N=1, A_1=1` and `error≤1/3`; at `t=−1` the partial sum is−1. A remainder formula requiring `|t|<1` would fail to provide `π` precision here.
- `A_N(0)=0` for every `N`, and `A_0(t)=0` for every rational t. At `t=1,N=2` the sum is 2/3; reversing the alternating sign would instead give 4/3.
- `x=0` is rejected: `u=−1` makes `1−r²=0`, and `Real.log0=0` by totalization is not a sound positive-log datum.
- For the box of the real root ∛2 of `X³ − 2` refined to width `10^{−12}, logAbsEnclosure` at `P = 40` has width below `10^{−11}` and contains `Real.log` 2/3.
- No enclosure is returned for a box containing 0, so a nonvanishing claim never rests on an interval around 0.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1,
(1.3)–(1.4), p. 107, and the definition of Λ, p. 105; [E. M.
Matveev](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng),
§2, (2.1), p. 1219; [de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.5, printed pp.32–34 (real
logarithm, arctangent and p-adic series).)

*Needs:* §0.4; §0.1; Mathlib `Complex.log`; Mathlib `Complex.arg`; Mathlib `Real.arctan_one`; §0.2.

### 2.2 Exact evaluation of Matveev's constant

Fix integers `n ≥ 1` (the number of logarithms) and `D ≥ 1` (a degree bound). Put `e⁺ := 27182818286/10¹⁰`
(so `exp 1 < e⁺` by `Real.exp_one_lt_d9`). A MatveevConstantData for `(n, D)` consists of rationals
`A_1, …, A_n` with `A_j ≥` 16/100, a rational `s⁺ ≥ 0` with `(s⁺)² ≥ n` (so `s⁺ ≥ √n`), a rational ℓ⁺ `≥ Real.log D` (the upper end of the `ED.2` rational logarithm/error bounds enclosure of `Real.log D; ℓ⁺ = 0` is allowed for `D = 1`), and a rational c satisfying the exact rational inequality `c ≥ Ĉ(n)·D²·(1 + ℓ⁺)·A_1⋯A_n`, where `Ĉ(n) := max(min(e⁺n/2·30^{n+3}·n³·s⁺, 2^{6n+20}), min((1/2)(e⁺n/2)²·30^{n+3}·n³·s⁺, 2^{6n+20}))` is a rational number with `Ĉ(n) ≥ C_1(n, κ)` for `κ = 1`
and `κ = 2, C_1(n, κ) = min{κ^{−1}(en/2)^κ·30^{n+3}·n^{3.5}, 2^{6n+20}}` being the constant of
Matveev's Corollary `2.3`
(DiophantineApproximationAndTranscendence §3.6 (matveev)). The datum
is admissible for a number field `K ⊆ ℂ` (given with `σ : K →+* ℂ`) with [`K : ℚ] ≤ D`, elements `α_1, …, α_n ∈ K^×` and nonzero complex numbers `λ_1, …, λ_n` with `exp λ_j = σ(α_j)`, when `A_j ≥ D·h_j⁺` and `A_j ≥ |λ_j|⁺` for every j, where `h_j⁺ ≥ NumberField.absLogHeight₁ α_j` is obtained from §0.10, converted by
`h = Real.log(mulHeight₁)/[K : ℚ`]
(DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights)) and the upper end of §2.1 and
`|λ_j|⁺ ≥ |λ_j|` is read off from §2.1 (for `λ_j = Complex.log σ(α_j) + 2πik_j, |λ_j| ≤ |Real.log ‖σα_j‖| + |Complex.arg σα_j + 2πk_j|`). The value used downstream is c: for every `b ∈ ℤ^n` with `Λ := Σ b_jλ_j ≠ 0, Real.log |Λ| > −c·(1 + Real.log B*), B* := max_j |b_j| (§2.3)`. Every comparison in the
datum is an exact comparison of rationals; the name of Matveev's theorem supplies no number,
and every number is computed here. The real/complex distinction `κ` of Matveev is not needed by the
datum because `Ĉ(n)` dominates both values; a logarithm `λ_j` with `σ(α_j) = 1` and `λ_j = 0` is never
part of the family (such a term is removed from the linear form before the datum is formed).

Work under the following conditions. `n ≥ 1, D ≥ 1; A_j ≥ 0.16` is part of the datum and is
essential: Corollary `2.3` is stated under `(2.4) [K : ℚ] ≤ D` is enough: the bound is increasing in `D`
and the admissibility conditions are monotone in `D λ_j ≠ 0` for every j; terms with `λ_j = 0` are
deleted beforehand, and their coefficients do not enter B*

The interface includes these statements.

- MatveevConstantData: Data `n, D`, A : Fin `n → ℚ, s⁺`, ℓ⁺, c with the rational inequalities of the statement as fields: 16/100 `≤ A j, n ≤ s⁺², Real.log D ≤ ℓ⁺, Ĉ(n)·D²·(1 + ℓ⁺)·∏ A j ≤ c`.
- The rational c, used as `C_7` in Tzanakis–de Weger's Lemma `2.3` with `C_8 = 1`.
- For `K, σ`, D-bounded degree, `α` : Fin `n →` Kˣ and `λ` : Fin `n → ℂ` with `λ j ≠ 0` and `Complex.exp (λ j) = σ (α j): D·absLogHeight₁ (α j) ≤` A j and `‖λ j‖ ≤` A j for all j.
- For `κ ∈ {1, 2}: min{κ⁻¹(exp 1·n/2)^κ·30^{n+3}·n^{3.5}, 2^{6n+20}} ≤ Ĉ(n)`.
- Admissibility for a degree bound `D` implies admissibility for every `D′ ≥ D` after replacing `A_j` by `D′A_j/D` and c accordingly.
- From height data `h_j⁺`, logarithm enclosures `|λ_j|⁺` and a precision, the datum with `A_j := max(D·h_j⁺, |λ_j|⁺`, 16/100) and the least dyadic c at the requested precision satisfying the inequality.

For the proof, `Ĉ(n) ≥ C_1(n, κ): Real.exp_one_lt_d9` gives `e < e⁺, (s⁺)² ≥ n` gives `n^{3.5} = n³√n ≤ n³s⁺`, and each argument of the minimum is monotone in e and in `n^{3.5}`; the maximum over `κ ∈ {1, 2}`
covers both fields `K ⊆ ℝ` and `K` ⊄ `ℝ`. Degree monotonicity: if [`K : ℚ] = D′ ≤ D` then `A_j ≥ D·h(α_j) ≥ D′·h(α_j)`, so the `A_j` satisfy Matveev's `(2.4)` for D′, and `C_1·D′²·log(eD′) ≤ Ĉ(n)·D²·(1 +` ℓ⁺)
because `log(eD′) = 1 + Real.log D′ ≤ 1 +` ℓ⁺. Admissibility uses `NumberField.absLogHeight₁ α_j ≤ h_j⁺ (§0.10` with DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights)) and `|λ_j| ≤ |λ_j|⁺ (§2.1)`.

**Checks.**

- For `n = 2, D = 1, ℓ⁺ = 0, s⁺ = 1415/1000, A = (7/10, 11/10)` (admissible for `α = (2, 3)` and real logarithms, since `Real.log 2 < 0.7` and `Real.log 3 < 1.1): c = 8·10⁸` is accepted and `c = 7·10⁸` is rejected (the least admissible c is ≈ `7.83·10⁸`).
- For `n = 1, D = 1, ℓ⁺ = 0, s⁺ = 1: Ĉ(1) = e⁺/2·30⁴ ≈ 1.1009·10⁶` (the `κ = 1` value dominates).
- A family with `A_1 =` 1/10 (below Matveev's `floor 0.16`) is not a datum. For the root of unity `α_1 = exp(2πi/100)` with `λ_1 = 2πi/100` one has `D·h(α_1) = 0` and `|λ_1| <` 1/10, so a definition omitting the floor 16/100 `≤ A_j` would accept `A_1 =` 1/10, where Corollary `2.3` does not apply.
- For `n ≥ 2, (1/2)(en/2)² ≥` en/2, so `Ĉ(n)` equals the `κ = 2` value: the datum never undercuts Matveev's constant for non-real fields.
- The datum with `n = 2, D = 1, A = (7/10, 11/10), c = 8·10⁸` is accepted; with `c = 7·10⁸` it is rejected.
- Citing Matveev's name supplies no number: every admissible datum carries its rational c and the checks that bound `C_1(n, κ)·D²·log(eD)·∏A_j` by it.

([E. M.
Matveev](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng),
§2, Corollary2.3, bound/constant(2.6) and admissibility(2.4), p.1219; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.2, Lemma 2.3 and Appendix II,
p. 110.)

*Needs:* DiophantineApproximationAndTranscendence §3.6 (matveev); DiophantineApproximationAndTranscendence §3.6 (chosen algebraic logarithms); §0.10; DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights); §2.1; Mathlib `Real.exp_one_lt_d9`.

### 2.3 Exact lower bound for a linear form in logarithms

The headline statement is `ED2.matveev_lower_bound` in `Suggested.lean`.
Its rational constant is `ED2.matveevConstantUpper`, with the square-root and
logarithm upper bounds of §2.2 explicit in the hypotheses.

Let c be the value of a MatveevConstantData for `(n, D) (§2.2)` admissible for a number field `K`
with `σ : K →+* ℂ` and [`K : ℚ] ≤ D, α_1, …, α_n ∈ K^×` and nonzero logarithms `λ_1, …, λ_n (exp λ_j = σ(α_j))`. Then for every `b ∈ ℤ^n` with `Λ := b_1λ_1 + ⋯ + b_nλ_n ≠ 0: Real.log |Λ| > −c·(1 + Real.log`
B*), B* `:= max_j |b_j| ≥ 1`; equivalently `|Λ| > exp(−c(1 + Real.log` B*)). In Tzanakis–de Weger's
notation (Lemma `2.3): |Λ| > exp(−C_7(log A + C_8)`) with `C_7 := c, C_8 := 1, A :=` B*.

Work under the following conditions. `Λ ≠ 0` (nothing is claimed for `Λ = 0`; nonvanishing is proved
separately in each application, never inferred from a numerical enclosure near 0) Admissibility of
the datum for `(K, σ, α, λ)`

For the proof, Let `D′ := [K : ℚ] ≤ D`. By admissibility and the monotonicity step of §2.2, `A_j ≥ max{D′h(α_j), |λ_j|, 0.16}`. Apply
DiophantineApproximationAndTranscendence §3.6 (matveev) to `σ(K) ⊆ ℂ, σ(α_j), λ_j` and b, with B* in place of `B: Real.log |Λ| > −C_1(n, κ)·D′²·A_1⋯A_n·log(eD′)·log(eB*)`.
Bound `C_1(n, κ)·D′²·log(eD′)·∏A_j ≤ c` by the datum inequality and `log(eB*) = 1 + Real.log` B*.

**Checks.**

- For `α = (2, 3)` with real logarithms, `n = 2, D = 1` and `c = 8·10⁸`: every `(b_1, b_2) ≠ (0, 0)` satisfies `|b_1 log 2 + b_2 log 3| > exp(−8·10⁸(1 + log max(|b_1|, |b_2|))) (Λ ≠ 0` because `2^{b_1}3^{b_2} ≠ 1` by unique factorisation).

([E. M.
Matveev](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng),
§2, Corollary 2.3, p. 1219.)

*Needs:* §2.2; DiophantineApproximationAndTranscendence §3.6 (matveev).

### 2.4 Exact evaluation of Yu's p-adic constant

Fix `n ≥ 2`, a degree bound `d ≥ 1` and a prime p. A YuConstantData for (n, d, p) consists of
rationals `h_1, …, h_n`, a rational `λ_p⁻` with `0 < λ_p⁻ ≤ Real.log p` and `λ_p⁻ ≤ h_j` for all `j (ED.2`
rational logarithm/error bounds enclosure of `Real.log p`), a rational `L⁺ ≥ Real.log(10·n·d·h′)` with
`h′ := max(h_1, …, h_n, 1)`, and a rational `Φ⁺` satisfying the exact rational inequality `Φ⁺ ≥ 22000·(9.5(n + 1)d)^{2(n+1)}·(λ_p⁻)^{−(n+1)}·(p^d − 1)·h_1⋯h_n·L⁺`, which dominates Yu's `Φ = 22000·(9.5(n+1)d/√(log p))^{2(n+1)}·(p^{f_𝔭} − 1)·h_1⋯h_n·log(10ndh′)` for every prime 𝔭 above `p (f_𝔭 ≤ d)`. It is admissible for nonzero algebraic numbers `α_1, …, α_n` generating a number field of degree
at most d when `h_j ≥ h_j⁺ ≥ NumberField.absLogHeight₁ α_j (§0.10`, converted by `h = Real.log(mulHeight₁)/[K : ℚ`] (DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights))
and the upper end of §2.1), `h_j ≥ |log α_j|⁺/10 (§2.1`, principal logarithm; the factor 1/(10d) of Yu
is replaced by 1/10, which is admissible for every `d ≥ 1`) and `h_j ≥ λ_p⁻` is replaced by the
requirement `h_j ≥ ℓ_p⁺` for the upper end `ℓ_p⁺` of the enclosure of `Real.log p`. The value used
downstream is `Φ⁺`: for `b ∈ ℤ^n ∖ {0}` with `α^b ≠ 1`, the p-adic valuation `v_p` (normalised by `v_p(p) = 1`) of `α^b − 1` under any embedding into a finite extension of `ℚ_p` satisfies `v_p(α^b − 1) < Φ⁺·Real.log(d·max(|b_1|, …, |b_n|, 3)) (§2.5)`. For `α_j ∈ ℚ` this specialises to `d = 1, f_𝔭 = 1, h_j ≥ max(log H(α_j), |log α_j|/10, log p`), the form of
DiophantineApproximationAndTranscendence §3.7 `(yu_rat)`.

Work under the following conditions. `n ≥ 2` (Yu's statement; a single p-adic unit is handled by
DiophantineApproximationAndTranscendence §3.7 `(yuOneFactorBound)` or by adjoining a second
term with zero coefficient) The `α_j` are nonzero and `α_1^{b_1}⋯α_n^{b_n} ≠ 1` in the application; the
constant itself is pure rational arithmetic

The interface includes these statements.

- YuConstantData: Data n, d, p, h : Fin `n → ℚ, λ_p⁻, L⁺, Φ⁺` with the rational inequalities of the statement as fields.
- The rational `Φ⁺`.
- For `α` : Fin `n → K` with [`K : ℚ] ≤ d: absLogHeight₁ (α j) ≤ h j, ‖Complex.log (σ (α j))‖ ≤ 10·h j` and `Real.log p ≤ h j`.
- Yu's `Φ` for any prime 𝔭 of `ℚ(α)` above p, computed with the true degree, is at most `Φ⁺`.
- From height data, logarithm enclosures and a precision, the datum with `h_j := max(h_j⁺, |log α_j|⁺/10, ℓ_p⁺`) and the least dyadic `Φ⁺` at that precision.

For the proof, Monotonicity in the residue degree: `p^{f_𝔭} − 1 ≤ p^d − 1` since `f_𝔭 ≤ [ℚ(α) : ℚ] ≤ d (Yu` remarks the same on p. 242). `(√(log p))^{2(n+1)} = (log p)^{n+1} ≥ (λ_p⁻)^{n+1}; d ↦ (9.5(n+1)d)^{2(n+1)}` and `d ↦ log(10ndh′)` are increasing, so the datum dominates `Φ` computed
with the true degree. The hypotheses `h_j ≥ max(h(α_j), |log α_j|/(10d_0), log p`) of
DiophantineApproximationAndTranscendence §3.7 (yu and `yuValuationAdapter`) for the true degree `d_0 ≤ d`
follow from `h_j ≥ h_j⁺, h_j ≥ |log α_j|⁺/10` and `h_j ≥ ℓ_p⁺`.

**Checks.**

- For `n = 2, d = 1, p = 5, α = (2, 3)` and `h = (ℓ₅⁺, ℓ₅⁺)` with `ℓ₅⁺ ≥ Real.log 5` (both heights log 2, log 3 are below log 5): `Φ⁺ ≥ 22000·(28.5)^6·(log 5)^{−3}·4·(log 5)²·log(20·log 5) ≈ 1.017·10^{14}`, and the datum is rejected for `Φ⁺ = 10^{14}`.
- For `d = 1` the residue factor is `p − 1 (f_𝔭 = 1)`, so the datum for rationals uses p − 1 and not `p² − 1`.
- The datum is not admissible with `h_j = 7/10 (≥ Real.log 2)` at `p = 5` for `α_j = 2`: the condition `h_j ≥ log p` fails, and a definition omitting it would undercut Yu's hypothesis.
- For rationals the exact `Φ⁺` yields a constant `C = 2Φ⁺ log p` with `|α^b − 1|_p ≥ (eB)^{−C}`, the form of DiophantineApproximationAndTranscendence §3.7 `(yu_rat)`.
- For `p = 5, n = 2, d = 1, α = (2, 3)`: the least admissible `Φ⁺` at precision `2^{−20}` exceeds `10^{14}`, and the datum records it as an exact rational.
- The p-adic source (Yu 1994) is registered separately from the archimedean one (Matveev 2000).

([Kunrui Yu](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf), §0.1, p. 242 (bound read on
the page image; the text layer drops the displayed formulas); [Kunrui
Yu](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf), §0.1, p. 242.)

*Needs:* DiophantineApproximationAndTranscendence §3.7 (yu and `yuValuationAdapter`); DiophantineApproximationAndTranscendence §3.7 `(yu_rat)`; §0.10; DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights); §2.1.

### 2.5 Exact upper bound for the p-adic valuation of a multiplicative form

The headline statement is `ED2.yu_valuation_upper_bound` in `Suggested.lean`,
using `ED2.yuConstantUpper`. It expresses normalized valuation as
`−log ‖α^b − 1‖ / log p` in an arbitrary finite normed extension of `Q_p`.

Let `Φ⁺` be the value of a YuConstantData for `(n, d, p) (§2.4)` admissible for nonzero algebraic
numbers `α_1, …, α_n` of a number field `K, [K : ℚ] ≤ d`, and let `ι : K → L` be a field embedding into a
finite extension `L` of `ℚ_p`, with `v_p` the valuation of `L` normalised by `v_p(p) = 1`. Then for every `b ∈ ℤ^n ∖ {0}` with `α_1^{b_1}⋯α_n^{b_n} ≠ 1: v_p(ι(α_1^{b_1}⋯α_n^{b_n}) − 1) < Φ⁺·Real.log(d·max(|b_1|, …, |b_n|, 3))`. For `α_j ∈ ℚ` the valuation is `padicValRat p`.

Work under the following conditions. `b ≠ 0` and `α^b ≠ 1` (nonvanishing of `α^b − 1` is part of the
hypothesis; it is proved structurally in each application) Admissibility of the datum

For the proof, The prime 𝔭 of `ℚ(α_1, …, α_n)` induced by `ι` lies above p; `v_p(ι(x)) = ord_𝔭(x)/e_𝔭 ≤ ord_𝔭(x)` for `x ≠ 0` with `ord_𝔭(x) ≥ 0`, and the claim is trivial when `v_p(ι(α^b) − 1) ≤ 0`.
DiophantineApproximationAndTranscendence §3.7 (yu and `yuValuationAdapter`) gives `ord_𝔭(α^b − 1) < Φ·log(d_0B)` with the true degree `d_0 ≤ d; Φ ≤ Φ⁺` by the datum and `log(d_0B) ≤ log(dB)`.

**Checks.**

- For `p = 7` and `α = (2, 3) ∈ ℚ²`, with a datum admissible for `(n, d) = (2, 1)`: for every `(b_1, b_2) ≠ 0, padicValRat 7 (2^{b_1}3^{b_2} − 1) < Φ⁺·log max(|b_1|, |b_2|, 3); e.g`. `(b_1, b_2) = (1, 2)` gives `padicValRat 7 (17) = 0` and `(3, −1)` gives `padicValRat 7 (8/3 − 1) = 0`, while `2³ − 1 = 7` gives valuation 1, all below the bound.

([Kunrui Yu](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf), §0.1, pp. 241–242 (the
displayed bound is on p. 242).)

*Needs:* §2.4; DiophantineApproximationAndTranscendence §3.7 (yu and `yuValuationAdapter`); Mathlib `padicValRat`.

### 2.6 Exact p-adic logarithm values with explicit tails

Use the existing principal-unit logarithm on `L=K_v` and a fixed branch value `log(π)`; do not
reconstruct local-field logarithm theory. Write `ord(π)=1` and `e=ord(p)`. For a deep unit z with
`d≤ord(z-1)`, where d is a positive rational satisfying `d>e/(p-1)`, let
`S_N(z)=Σ_{1≤k≤N}(-1)^(k+1)(z-1)^k/k`. Then `ord(log(z)-S_N(z))≥ceil(d+N(d-e/(p-1)))`. If `z=1` the sum
and logarithm are exactly0. A finite datum records a power `M≥1`, an exact unit u and `z=u^M` with
exact depth d, and finite scalar enclosures for the partial sum. Since `log(u)=log(z)/M`, dividing
the final enclosure loses `ord(M)=e·v_p(M)` digits. For arbitrary `x=π^a u`, add `a·log(π)` with the
branch enclosure and `ED.0` precision laws. For `Q_p` use `M=p-1` at odd p and `M=2` at `p=2` for any unit;
for a finite extension with residue cardinality q use `M=(q-1)p^h` with a supplied proof of deep
containment. Such an h exists by continuity/powering on principal units (torsion that becomes1 uses
the exact-zero branch). The tail bound grows without limit; dense exact centres and `ED.0`
finite-expression precision therefore give rational/algebraic ball data of any requested
precision. For minimum nonzero pivot-log valuation s, evaluate to precision m+s and apply §0.9 to
obtain all normalized coefficients modulo `π^m`. The theorem proves existence and soundness of
adequate evaluations; a pre-existing oracle for log values or an assumption that an S-unit solution
list is exhaustive is not a hypothesis.

Work under the following conditions. p is prime; the local field, exact dense embedding and
normalized valuation are fixed. For the displayed uniform tail choose `d>e/(p-1); ord(z-1)>0` alone
does not justify this linear bound. The normalized-log lattice is used only after the pivot log is
proved nonzero and all basis/valuation comparison data for its coordinates are supplied. A chosen
branch `log(π)` is fixed for `ED.4/ED.6`. `ED.2` units and ratios use only the principal-unit logarithm
and have no branch ambiguity.

The interface includes these statements.

- PadicLogEvaluationData: The actual local field/branch, unit, deep power, partial-sum centres, scalar error precisions and exact tail/power-division budget.
- The finite sum `Σ_{1≤k≤N}(-1)^(k+1)(z-1)^k/k`.
- The normalized uniformizer valuation of the tail `is≥ceil(d+N(d-e/(p-1)))` under `d>e/(p-1)`.
- The true logarithm lies in the displayed ball, including the `ord(M)` division loss.
- Every unit has a logarithm ball at every integer absolute precision, using a deep power and the explicit tail bound.
- For `z=u^M` divide its logarithm enclosure by `M` and lose `e·v_p(M)` uniformizer digits.
- At a nonzero minimal pivot of valuation s, log precision m+s gives normalized lattice coefficient precision m.
- A unit killed by the chosen power has logarithm0, with an exact zero datum.

For the proof, Import principal-unit series convergence, multiplicativity and continuity from the
local-field logarithm owner. The pinned `TauCeti.NumberTheory.LocalField.Logarithm` supplies the
HasSum and deep-unit isometry; use these results for convergence and isometry. For `k≥1, v_p(k)≤(k-1)/(p-1)`. Thus `ord((z-1)^k/k)≥kd-e(k-1)/(p-1)`. For `k>N`, this `is≥d+N(d-e/(p-1))`;
ultrametric closedness gives the same bound for the whole tail. Use §0.9 on the N-term expression,
subtract the exact error, and divide by `M` with the explicit loss `ord(M)`. Handle `z=1` separately.
Power `u^(q-1)` is a principal unit. Repeated p-powers reach a deep unit or become1; use the binomial
valuation bound `min(pd,d+e)`, including equality/cancellation as a lower bound, and continuity. No
operation count is asserted. For every requested m choose `N` so `ceil(d+N(d-e/(p-1)))-ord(M)≥m`, choose
finite expression `precision≥m+ord(M)`, and refine the input balls sufficiently. Apply the pivot
quotient theorem before constructing `ED.1` residues.

The positive tail slope supplies a truncation meeting every requested integer precision.

**Checks.**

- In `Q_3, z=4, d=1,N=4: S_4=3-9/2+27/3-81/4=-51/4` and the tail has `valuation≥ceil(1+4/2)=3`.
- `S_0(z)=0` for every `z, S_N(1)=0` for every `N`, and `S_1(4)=3` in `Q_3`. These distinguish the empty sum, exact unit and first-term indexing before any convergence assertion.
- In `Q_2, z=5,d=2,N=4`: the tail valuation `is≥6`. For `u=-5` use `M=2,z=25,d=3` and subtract1 digit after division by2.
- `log_3(-1)=0` via `M=2`, and `log_2(-1)=0` via `M=2`; the exact power1 branch has zero tail.
- At `p=2,e=1,z=3` one has depth1; `d=1` fails the strict deep-unit hypothesis, so the displayed linear tail budget cannot be used directly. Squaring gives9 of depth3.
- At `e=2,p=3,d=2,N=5` the tail bound is7; division by a power `M` divisible by3 loses2 digits per factor3.
- For desired normalized precision7 and pivot valuation2, provide log enclosures at absolute precision9; precision7 before division is insufficient.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), §2.3 pp.28–29; §2.5 pp.33–34; §3.13 Lemma3.17
p.67.)

*Needs:* §0.9; §0.8; §0.6; ColemanIntegration §§L0.10, `L0.13, L0.17`.

### 2.7 Discrete-logarithm data for p-adic multiplicative forms

Let p be a prime and `𝒪` either `ℤ_p` or the ring of integers of a finite extension `L` of `ℚ_p`, with
maximal ideal 𝔓 and a fixed exact presentation of the finite rings `𝒪/𝔓^t` (for `L` given by a defining
polynomial over `ℚ_p`, using §0.6 in the degree-one case and the actual completion/valuation data of §0.9 in general).
Let `γ_0, γ_1, …, γ_n ∈ 𝒪^×` be units, known modulo `𝔓^t`. A discrete-logarithm datum at level t
consists of an exponent `e ≥ 1`, an element `g ∈ 𝒪` with `g ≡ 1` (mod 𝔓), an integer `M ≥ 0`, and integers
`ℓ_0, …, ℓ_n ∈ [0, p^M`), such that the following exact congruences hold in `𝒪/𝔓^t: g^{p^M} ≡ 1, g^{p^{M−1}}` ≢ 1 when `M ≥ 1`, and `γ_i^e ≡ g^{ℓ_i}` for `i = 0, …, n`. Its congruence lattice is `Γ := {b ∈ ℤ^n :`
`Σ_{i≥1} b_iℓ_i ≡ 0 (mod p^M)}` and its target coset is `Γ_0 := {b ∈ ℤ^n : ℓ_0 + Σ_{i≥1} b_iℓ_i ≡ 0`
`(mod p^M)}`; both are presented by §1.5 after normalisation: let `κ := min_{i≥1, ℓ_i ≠ 0} v_p(ℓ_i) < M`, attained at a nonzero `ℓ_k`; if `ℓ_0 ≠ 0` and `v_p(ℓ_0) < κ` then `Γ_0 = ∅`; otherwise `b ∈ Γ_0` exactly
when `p^{M−κ}` divides `Λ′(b) := b_k − β_0 − Σ_{i≠k} b_iβ_i` with the p-adic integers `β_0 := −ℓ_0/ℓ_k`
and `β_i := −ℓ_i/ℓ_k`, which is `ED.1's` normalised form at level `m = M − κ (de` Weger's `μ_0` is this `κ`).
If every `ℓ_i (i ≥ 1)` is zero (equivalently divisible by `p^M` under the exponent ranges), then `Γ = ℤ^n; Γ_0` is all of `ℤ^n` if `ℓ_0 = 0`, and empty otherwise. This also handles `n = 0` without taking an
empty pivot minimum. Soundness: for `b ∈ ℤ^n` and `ζ ∈ 𝒪^×` with `ζ^e = 1` (for instance `ζ = ±1` when e is
even), if `ζγ_0∏_{i≥1}γ_i^{b_i} ≡ 1 (mod 𝔓^t`), equivalently `ord_𝔓(ζγ_0∏γ_i^{b_i} − 1) ≥ t`, then `b ∈ Γ_0`. Standard data over `ℚ_p`: for odd `p, g = 1 + p, t = M + 1, e = p − 1`; for `p = 2, g = 5, t = M + 2, e = 2`; the order conditions then hold by lifting the exponent, and `ℓ_i` exists for every rational
p-adic unit `γ_i`. The trivial generated subgroup uses `M = 0, g = 1` and all `ℓ_i = 0`; its order check is just `g = 1` and has no predecessor exponent. In a finite extension the datum exists whenever the `γ_i^e` generate a cyclic
subgroup of `(𝒪/𝔓^t)^×` of p-power order. In the quadratic Thue–Mahler case the
conjugation gives norm-one units; any cyclicity needed for a chosen datum remains a hypothesis. No p-adic logarithm and no approximation enters: every check is
modular exponentiation in a finite ring. Zero coefficients are omitted when choosing `κ`, and `ℓ_0 = 0`
always satisfies `p^κ ∣ ℓ_0`; this is essential because Mathlib `padicValRat p 0 = 0`. The prime
hypothesis is stored in the datum, as are `0 ≤ ℓ_i < p^M`.

Work under the following conditions. `γ_i` are 𝔓-adic units; the datum is a finite list of
integers checked by exact arithmetic modulo `𝔓^t` Only the implication 'congruence `⇒` lattice
membership' is claimed; the lattice may be larger than the set of exponent vectors with the
congruence, which keeps every reduction based on it sound

The interface includes these statements.

- PadicDiscreteLogData: Data `p, t, e, g, M`, ℓ : Fin (n+1) `→ ℤ` with the exact congruences of the statement as fields (in ZMod `(p^t)` for `𝒪 = ℤ_p`). The prime hypothesis `p.Prime` and the ranges `0 ≤ ℓ_i < p^M` are fields.
- The congruence lattice `Γ = {b : Σ b_iℓ_i ≡ 0 (mod p^M)}` as an AddSubgroup of `ℤ^n`.
- If `ζ^e = 1` and `ζγ_0∏γ_i^{b_i} ≡ 1 (mod 𝔓^t`) then `ℓ_0 + Σ b_iℓ_i ≡ 0 (mod p^M`).
- For nonzero rational p-adic units `γ_i` and a sign `ζ ∈ {−1,1}` satisfying `ζ^e = 1`, put `z = ζγ_0∏γ_i^{b_i} − 1`. If `z = 0` or `t ≤ padicValRat p z`, then `ℓ_0 + Σ b_iℓ_i ≡ 0 (mod p^M`). An even e permits both signs; an arbitrary e does not. The exact-zero branch precedes Mathlib’s totalized valuation.
- For odd p, rational p-adic units `γ_i` and `M ≥ 1`: the datum with `g = 1 + p, t = M + 1, e = p − 1` and `ℓ_i` the discrete logarithms; for `p = 2` the analogue with `g = 5, t = M + 2, e = 2`.
- For odd p: `orderOf ((1 + p` : ZMod `(p^(M+1)))) = p^M`; for `p = 2: orderOf ((5` : ZMod `(2^(M+2)))) = 2^M`.

For the proof, Since `g ≡ 1` (mod 𝔓), the image of g in the finite group `(𝒪/𝔓^t)^×` lies in the p-group
(1 + 𝔓)/(1 `+ 𝔓^t`); its order is a power of p, and for `M ≥ 1` the two congruences make it exactly `p^M`. For `M = 0` the first congruence gives `g = 1`, all allowed `ℓ_i` are zero, and the coset is all of `ℤ^n`. If `x := ζγ_0∏γ_i^{b_i} ≡ 1` then `x^e ≡ 1`, and `x^e = ζ^e·γ_0^e∏(γ_i^e)^{b_i} ≡ g^{ℓ_0 + Σ b_iℓ_i}`; hence `p^M`
divides `ℓ_0 + Σ b_iℓ_i`. Standard data:
DiophantineApproximationAndTranscendence §3.7 (multiplicative power-law adapter) gives `v_p((1 + p)^k − 1) = 1 + v_p(k)` for odd p and `v_2(5^k − 1) = 2 + v_2(k)`, so 1 + p has order exactly `p^M`
modulo `p^{M+1}` and 5 has order exactly `2^M` modulo `2^{M+2}`; the groups `(1 + pℤ_p)/(1 + p^{M+1}ℤ_p)`
and `(1 + 4ℤ_2)/(1 + 2^{M+2}ℤ_2)` have orders `p^M` and `2^M`, hence are generated by them, and `γ^{p−1} ≡ 1` (mod p) (Fermat) resp. `γ² ≡ 1` (mod 8) puts `γ^e` in them. Comparison with the sources: for `𝒪 = ℤ_p, p` odd, `ℓ_i ≡ log_p(γ_i^{p−1})/log_p(1 + p) (mod p^M`), so `Γ_0` is de Weger's lattice `Γ_μ` of the p-adic
linear form in logarithms; the datum replaces the approximation of p-adic logarithms by exact
discrete logarithms.

**Checks.**

- `p = 5, M = 2, t = 3, e = 4, g = 6`: modulo `125, 2⁴ = 16 ≡ 6^ℓ` with ℓ `∈ [0, 25`); the datum stores this ℓ and `6^{25} ≡ 1, 6^5` ≢ 1 (mod 125).
- With `p = 5` and `γ_0 = −1 (ℓ_0 = 0` since `(−1)⁴ = 1`): the vector b is in the coset `Γ_0` for every solution of `−∏γ_i^{b_i} ≡ 1` (mod 125), so the sign never needs a separate lattice.
- `g = 1 + 5² = 26` modulo 125 has order 5, not 25: a datum claiming `M = 2` with `g = 26` fails the check `g^{5}` ≢ 1, so lattices built from a non-generator are rejected.
- If every `γ_i ≡ 1 (mod p^t`) then all `ℓ_i ≡ 0` and `Γ = ℤ^n`: the datum gives no information, and a reduction step based on it cannot lower a bound.
- `p = 2, M = 3, t = 5`: 5 has order 8 modulo `32 (5⁴ = 625 ≡ 17, 5⁸ ≡ 1)`, agreeing with Mathlib's `orderOf` in ZMod 32.
- At the composite modulus parameter `p = 6, g = 19 ≡ 1` mod 6 has order 2 modulo 36, so `g^6 = 1` and `g ≠ 1 do` not imply order 6. No PadicDiscreteLogData with `p = 6` exists: p must be prime.
- At `t = 1` over `ℤ_p`, the trivial powered subgroup has the datum `M = 0, g = 1`, all `ℓ_i = 0`. Requiring `M ≥ 1` would falsely promise a nontrivial principal-unit generator modulo p.
- At `p = 2, t = 2, e = 1, g = 3, M = 1` and `γ_0 = 3`, the valid exponent is `ℓ_0 = 1`. The negative sign gives `−γ_0−1 = −4` of valuation 2, yet `ℓ_0` is not zero modulo 2. The sign adapter rejects `ζ = −1` because `ζ^e ≠ 1`.
- In the standard `p = 5` datum with `γ_0 = 1` and `b = 0, z = 0` satisfies the congruence branch even though `padicValRat 5 0 = 0 < t`.
- At `p = 5` and `M = 2, ℓ = (0, 5, 0): κ = 1` with pivot `ℓ_1 = 5` and the coset is `{b : 5 ∣ b_1}`, including `b = 0`. The zero coefficient is not a pivot and the zero constant does not make the coset empty.
- For `p = 5, M = 2`: the datum for `γ = (2, 3)` has `(ℓ_2, ℓ_3)` with `6^{ℓ_2} ≡ 16` and `6^{ℓ_3} ≡ 81` (mod 125), and its lattice `{b : b_2ℓ_2 + b_3ℓ_3 ≡ 0 (mod 25)}` contains every b with `2^{b_2}3^{b_3} ≡ ±1` (mod 125).

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.3, p. 119 (text layer lines
8008–8048); [de Weger (1989)](https://ir.cwi.nl/pub/13190), §3.13, Lemma 3.17, p. 67 (text layer
lines 4585–4671); [N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/),
§12, Lemma 12, p. 249, and §14, (33), p. 258.)

*Needs:* §0.6; §1.5; DiophantineApproximationAndTranscendence §3.7 (multiplicative power-law adapter); Mathlib `ZMod.pow_totient`; Mathlib `padicValRat`.

### 2.8 Exponent reduction chains

For any finite exponent index Fin q (including `q=0`) and `S⊆Z^q`, a componentwise reduction chain
consists of k steps, nonnegative `X_j∈Q^q`, each coordinate antitone in j, finite exceptional sets `E_j`
and the implication `a∈S ∧ (∀i,|a_i|≤X_{j,i}) ⇒ (∀i,|a_i|≤X_{j+1,i}) ∨ a∈E_j`. Each implication is
supplied by a real, p-adic or complete-enumeration reduction. Finite induction gives the final box
or an exception. A weighted scalar convenience chain is separately named
WeightedExponentReductionChain and means `X_{j,i}=w_i X_j`, with every `w_i≥1` for the conversion.
S-unit data use the vector chain directly, so a step may lower `f(p)` without lowering `f(q)`
for `q≠p`.

Work under the following conditions. Each step carries its own datum; a chain with a step
lacking one is not a chain Bounds may be different per coordinate through the weights w (TdW 1992
§15 use weights `W_j` to balance the bounds on the `n_i` and `a_i`)

The interface includes these statements.

- ExponentReductionChain: Bounds `X` : Fin (k+1) `→` (Fin `q → ℚ`) (componentwise antitone; the scalar weighted case is `X_j·w`), exceptions `E` : Fin `k →` Finset (Fin `q → ℤ`) and, for each step, the implication of the statement as a field.
- The last componentwise bound `X_k` : Fin `q → Q`.
- Every `a∈S` in the initial componentwise box belongs to the final componentwise box or one `E_j`.
- The chain with `k = 0` (no step), whose final bound is `X_0`.
- Adding a step exact by an `ED.1` reduction or enumeration datum whose input bound is the pinned final bound.
- InExponentBox: ∀i, `|(a_i:Q)|≤X_i`.
- WeightedExponentReductionChain: Weighted scalar helper with decreasing rational `X_j` and the corresponding `weightedHeight` implications. Conversion requires positive weights; it does not represent independent per-prime updates.
- The last scalar bound `X_k∈Q`; the associated coordinate box has bounds `w_i X_k`.
- For every `a∈S` with `weightedHeight w a≤X_0`, either `weightedHeight w a≤X_k` or a belongs to the union of the k finite exceptional sets. The weighted height of the unique vector at `q=0` is0.
- For any nonnegative initial scalar bound `X_0`, the zero-step chain has final `X_0` and empty exceptional union; its soundness implication is the identity.
- Given a chain ending at `X_k` and an exact implication `H_w(a)≤X_k ⇒ H_w(a)≤Y` or `a∈E` for `a∈S`, with `0≤Y≤X_k`, append that step. The new final bound is `Y` and its exceptional union is the old `union∪E`.

For the proof, Generate the scalar log enclosures mathematically from §2.1 and §2.6, then apply
§0.9. For pivot log valuation s, certify precision at least m+s and strict pivot `precision>s` before
forming normalized ratios modulo `π^m`. Existence of adequate `N` is proved by the positive-slope tail
estimate. A congruence conditions does not assume completeness of the final solution list.
Induction on j: the base case is the hypothesis `H_w(a) ≤ X_0`; the step is the implication of step j.
For step type (a), the `ED.1` real reduction theorem states exactly that no a in the box `H_w(a) ≤ X_{j−1}` satisfies `|Λ(a)| < K_1 exp(−K_2 H_w(a))` with `H_w(a) > X_j`; for (b) the `ED.1` p-adic theorem
states that no a in the box lies in the lattice or coset outside the region `H_w(a) ≤ X_j`; for (c)
the completeness theorem of the enumeration places every such a in `E_j`.

**Checks.**

- For `k = 0` soundness is the hypothesis itself: final `= X_0` and the exception set is empty.
- A chain `10⁴⁰ ≥ 600 ≥ 70` with two real steps and no exceptions gives: every a `∈` 𝒮 with `H(a) ≤ 10⁴⁰` has `H(a) ≤ 70`.
- A type (c) step with `w = (1, 1), X_{j−1} = 10, X_j = 5` and `E_j = {(7, −9)}` forces every a `∈` 𝒮 with `H(a) = 9` to equal `(7, −9)`; any other vector of 𝒮 of height 9 contradicts the step.
- A sequence of decreasing bounds without step implications is not a chain: 𝒮 `= {(100)}` with `X_0 = 1000, X_1 = 10` satisfies no step implication, and a definition that drops the step field would make soundness false.
- The vector chain without steps has `final=X₀`.
- Starting at `(100,10)`, final `(2,10)` preserves the vector `(2,9)`.
- Starting at `(100,10)`, final `(2,5)` cannot cover `S={(2,9)}` with no exceptional vector.
- For scalar unit weights `weightedHeight` equals `expHeight`.
- The chain of TdW §III.2 (initial bound of size `10^{40}`, reduced in several steps to two-digit bounds) is an instance with real steps only.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3,
Proposition 3.1 and the remark after it, p. 114; [de Weger (1989)](https://ir.cwi.nl/pub/13190),
Chapter 6, §6.5, pp. 124–125 (text layer lines 8440–8442); [U. Fincke, M.
Pohst](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/), §2, after
Algorithm (2.12), p. 466.)

*Needs:* §1.3; §1.4; §1.6; §1.7; §1.8; §2.6; §0.9.

### 2.9 Thue equations and their solution sets

A Thue equation is given by `g ∈ ℤ[X]` with `n := g.natDegree ≥ 3, g` irreducible over `ℚ` (its image in
`ℚ[X]` is irreducible), and `m ∈ ℤ` with `m ≠ 0`. Its form is `F := Polynomial.homogenize g n`, evaluated at
`(x, y) ∈ ℤ²` by `MvPolynomial.eval ![x, y]`, and its solution set is `thueSolutions g m := {(x, y) ∈ ℤ × ℤ : F(x, y) = m}`. Conventions pinned for the Thue part: `g = Σ_{k=0}^{n} g_k X^k ∈ ℤ[X]` with `n = g.natDegree, f_0 := g_n ≠ 0` its leading coefficient; the binary form is `F := Polynomial.homogenize g n ∈ ℤ[X_0, X_1]`, so `F(x, y) = Σ_k g_k x^k y^{n−k}` and `F(x, 1) = g(x)` (Tzanakis–de Weger write `F = Σ f_i X^{n−i}Y^i`, so `f_i = g_{n−i}); ξ^{(1)}, …, ξ^{(s)}` are the real roots of g and `ξ^{(s+1)}, …, ξ^{(s+2t)}` the non-real ones with `ξ^{(s+t+i)} = conj ξ^{(s+i)}, s + 2t = n`, listed in the order of
the exact root boxes; for `α ∈ K := ℚ[X]/(g)` (power-basis coordinates), `α^{(i)} := σ_i(α)` where
`σ_i : K →+* ℂ` sends the class of `X` to `ξ^{(i)}; β := X − Yξ ∈ K` for a solution `(X, Y)`. The solution
set is finite (DiophantineApproximationAndTranscendence §4.3 (effective Thue bound), whose
hypothesis 'at least three distinct complex zeros' follows from irreducibility and `n ≥ 3`); this
stage proves equality of the solution set with an explicit finite set from a datum `(§2.20)`.
Reducible forms, forms of degree `≤ 2` and `m = 0` are not Thue equations in this sense.

Work under the following conditions. `n ≥ 3` and irreducibility over `ℚ; m ≠ 0` Solutions are all pairs
of integers, with no coprimality condition and no sign normalisation

The interface includes these statements.

- `thueForm g x y := MvPolynomial.eval ![x, y] (Polynomial.homogenize g g.natDegree) ∈ ℤ`.
- `thueSolutions g m := {p : ℤ × ℤ | thueForm g p.1 p.2 = m}`.
- `thueForm g x 1 = g.eval x`.
- `thueForm g x 0 = g.leadingCoeff · x^{g.natDegree}`.
- `thueForm g (t·x) (t·y) = t^{g.natDegree} · thueForm g x y`.
- ThueEquation: Bundled data g, m with `3 ≤ g.natDegree`, irreducibility over `ℚ` and `m ≠ 0`.
- `thueSolutions g m` is finite (from DiophantineApproximationAndTranscendence §4.3 (effective Thue bound)).

For the proof, `F(x, y) = y^n g(x/y)` for `y ≠ 0` and `F(x, 0) = f_0 x^n`, by the definition of
`Polynomial.homogenize`. `F(tx, ty) = t^n F(x, y)`, since `F` is homogeneous of degree `n (Polynomial.homogenize` is a homogeneous polynomial of degree n).

**Checks.**

- For `g = X³ − 2: thueForm g x y = x³ − 2y³`, so `(1, 0)` and `(−1, −1)` lie in `thueSolutions g 1`.
- For `g = X³ − 2` and `m = 8: (2, 0) ∈ thueSolutions g 8` since `F(2, 0) = 8`, illustrating that solutions need not be primitive.
- `g = X² − 2` (degree 2) is not a Thue equation: `x² − 2y² = 1` has infinitely many integer solutions `(3, 2), (17, 12)`, ….
- `g = (X − 1)³` is excluded (reducible): `(x − y)³ = 1` has the infinitely many solutions (t + 1, t).
- `thueForm g x y` agrees with `Σ_{k ≤ n} g.coeff k · x^k · y^{n−k}`, Mathlib's `Polynomial.homogenize` evaluated at `(x, y)`.
- `thueSolutions (X³ − 2) 1 ⊇ {(1, 0), (−1, −1)}`; the exact equality is the conclusion of §2.20.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, (1.1),
p. 102; [Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1,
p. 102.)

*Needs:* Mathlib `Polynomial.homogenize`; Mathlib `MvPolynomial.eval`; DiophantineApproximationAndTranscendence §4.3 (effective Thue bound); DiophantineApproximationAndTranscendence §4.3 (monic Thue reduction).

### 2.10 Factor coverings: units and representatives for `X − ξY`

Conditional on the explicit arithmetic-input hypotheses listed below, let (g, m) be a Thue equation
with `s ≥ 1` real roots, `K := ℚ[X]/(g), ξ` the class of `X, r := s + t − 1`. A factor covering for (g, m)
consists of units `ε_1, …, ε_r` of the ring of integers `𝓞_K` and a finite list `M ⊆ K^×` (all given in
power-basis coordinates) such that: `(U)` every unit of `𝓞_K` is of the form `±ε_1^{a_1}⋯ε_r^{a_r}` with a
`∈ ℤ^r` (the torsion of `K` is `{±1}` because `K` has a real embedding); `(M)` for every `(X, Y) ∈ thueSolutions g m` there are `μ ∈ M` and a unit `η` of `𝓞_K` with `f_0·(X − Yξ) = f_0·μ·η`. Consequently
every solution satisfies `X − Yξ = ±μ·ε_1^{a_1}⋯ε_r^{a_r}` for some `μ ∈ M` and a `∈ ℤ^r`, which is the
representation `β = μ ε_1^{a_1}⋯ε_r^{a_r}` of Tzanakis–de Weger (with `±` absorbed into `M`). The two
conditions are input hypotheses of the Thue datum. `(U)` is discharged by the explicit
full-unit-generation hypothesis (a family of `rank(K)` units with linearly independent logarithmic
images and `regOfFamily < 2·regulator` generates the units with the torsion). `(M)` holds for `M := {δ/f_0 : δ ∈ D_u(f_0^{n−1}m), |N_{K/ℚ}(δ)| = |f_0^{n−1}m|}`, with `D_u` the bounded divisor
representatives of DiophantineApproximationAndTranscendence §4.1 `(boundedDivisors)` for
any maximal-rank family u: `γ := f_0(X − Yξ)` is an algebraic integer (`f_0ξ` is integral,
DiophantineApproximationAndTranscendence §4.3 (monic Thue reduction)) of `norm f_0^{n−1}m`, it divides its norm in `𝓞_K`, and
DiophantineApproximationAndTranscendence §4.1 `(exists_mem_boundedDivisors_of_dvd)` writes it as a unit times an element `δ` of `D_u(f_0^{n−1}m)`, with `|N(δ)| = |N(γ)|` because units have `norm ±1`. A list `M` obtained from prime-ideal factorisations (the supplied
exact prime-ideal-factorization identities and principal generators) satisfies `(M)` by the same
argument. In the Lean Finset `K` representation, every `μ∈M` must be nonzero, equivalent to
representatives in Kˣ. `ofDivisorRepresentatives` requires irreducibility over `Q, degree≥3, m≠0, g(ξ)=0` and `[K:Q]=deg g`, a complete generating unit family, and nonzero representatives `D⊂O_K` for all
nonzero divisors of `f₀^(n−1)m` up to association. Prove integrality of `f₀(x−yξ)`, its `norm f₀^(n−1)m`
and hence divisibility of that constant; set `M={δ/f₀ | δ∈D}`. No covering-of-solutions hypothesis is
passed to this comparison. The datum pins `r = NumberField.Units.rank K`. Full generation by
exactly `rank(K)` units implies maximal rank of their logarithmic images; redundant generators are
excluded, since they would allow unbounded exponent vectors for a fixed element and invalidate
§2.14.

Work under the following conditions. `s ≥ 1` (when `s = 0` no covering is needed: every solution has `|Y|`
`≤ Y_0`, §2.12) Condition `(U)` is a statement about the full unit group; displayed units of finite
index are not enough `r = NumberField.Units.rank K`; full generation alone with an arbitrary number of
generators is insufficient for exponent bounds. A supplied full `rank(K)` unit family generates `O_K^×`
together with torsion. Any supplied divisor/principal-ideal representative list is complete with its
exact polynomial/ideal identities; alternatively use DiophantineApproximationAndTranscendence §§4.1–4.5 bounded-divisor representatives. These
hypotheses concern the input arithmetic objects, not the solutions of the Thue equation.

The interface includes these statements.

- ThueFactorCovering: Data: units `ε` : Fin `r → (𝓞` K)ˣ, a Finset `M` of `K`; fields: `units_generate` (every unit is `±∏ ε_i^{a_i}`) and covers (every solution's `f_0(X − Yξ)` is `f_0μ` times a unit, `μ ∈ M`). The field `rank_eq : r = NumberField.Units.rank K` fixes the number of generators.
- For `(X, Y) ∈ thueSolutions g m`: ∃ `μ ∈ M`, ∃ a : Fin `r → ℤ`, ∃ `s ∈ {±1}, X − Yξ = s·μ·∏ ε_i^{a_i}`.
- Construct the covering from the explicit irreducible degree/root/field-degree/nonzero-m hypotheses, complete divisor representatives and unit generation specified in the statement; derive the norm and divisibility bridge. The input unit family has exactly `rank(K)` generators.
- Condition `(U)` from explicit supplied class/unit/factorization data's regulator datum for `ε`.
- Enlarge `M` only to a finite M′ all of whose representatives remain nonzero.
- After reindexing `ε` using `rank_eq`, its logarithmic images are linearly independent over `ℝ`; derive from full generation and the pinned finite-index criterion.
- For a complete covering cov with `cov.M = ∅, thueSolutions g m = ∅`. No representative minimum or maximum is formed.

For the proof, With `n=deg g` and `K=Q(ξ), z=f₀(x−yξ)` is integral, `Norm(z)=f₀^(n−1)m≠0`, and z divides
its integer norm. Apply D-completeness, divide by nonzero `f₀` and use the unit family. This is the
comparison, independent of the desired covers field. `N_{K/ℚ}(X − Yξ) = ∏_i (X − Yξ^{(i)}) = F(X, Y)/f_0 = m/f_0`, hence `N(f_0(X − Yξ)) = f_0^{n−1}m`. An algebraic integer `γ ≠ 0` of `K` divides `N(γ)` in `𝓞_K` (the
cofactor is the product of the other conjugates, an algebraic integer lying in `K`). Apply
DiophantineApproximationAndTranscendence §4.1 `(exists_mem_boundedDivisors_of_dvd)` to `γ | f_0^{n−1}m` and keep the representatives `δ` with `|N(δ)| = |f_0^{n−1}m|` (a unit has `norm ±1`, so the sign of `N(δ)` is not determined); combine with `(U)` to write
the unit as `±∏ε_i^{a_i}`. The subgroup generated by `ε` has index at most two by `(U)`. With `r = rank K, NumberField.Units.isMaxRank_iff_closure_finiteIndex` gives independent logarithmic images and hence
invertible logarithmic coordinate minors. If `M` is empty, its covers field contradicts the existence
of any solution. Return the empty solution set before constructing covering-dependent constants.

**Checks.**

- For `g = X³ − 2, m = 1 (f_0 = 1, K = ℚ(∛2), r = 1`, fundamental unit `ε =` ∛2 − 1): `M = {1}` is a covering, since `X −` Y∛2 has norm 1 and is a unit.
- For `g = X³ − 2` and `m = 2`, the list `M = {1}` is not a covering: the solution `(0, −1)` gives `X − Yξ =` ∛2, of norm 2, which is not a unit.
- With `ε =` (∛2 `− 1)²` (index 2 in the unit group modulo `±1`) condition `(U)` fails: ∛2 − 1 is not `±ε^a`.
- If `m = ±1` and `f_0 = ±1` then `M = {1}` (or `{±1}`) is a covering whenever `(U)` holds.
- For `ε := NumberField.Units.fundSystem K`, condition `(U)` is Mathlib's `NumberField.Units.exist_unique_eq_mul_prod` with torsion `K = {±1}`.
- No ThueFactorCovering admits `0∈M`.
- If `Units.rank K = 1`, no covering can have `r = 2`, including a family `(ε,ε)`. Such a redundant family admits arbitrary cancelling exponent pairs and cannot support the claimed exponent bound.
- A complete covering with `M = ∅` forces `thueSolutions g m = ∅` by its covers field; the solution set is empty before taking any extrema over `M`.
- For `g = X³ − 2` and `m = 1` the covering (`{∛2 − 1}, {1}`) satisfies `(U)` and `(M)`.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, p.
106.)

*Needs:* §2.9; DiophantineApproximationAndTranscendence §4.1 `(boundedDivisors)`; DiophantineApproximationAndTranscendence §4.1 `(exists_mem_boundedDivisors_of_dvd)`; DiophantineApproximationAndTranscendence §4.3 (monic Thue reduction); Mathlib `NumberField.Units.exist_unique_eq_mul_prod`; Mathlib `NumberField.Units.fundSystem`; Mathlib `NumberField.Units.isMaxRank_iff_closure_finiteIndex`.

### 2.11 Exact constants of the Tzanakis–de Weger method

Branch first: with `s=0` use root isolation and `Y₀` only; with `s>0` and a complete factor covering with
`M=∅` return the empty solution set by `ThueFactorCovering.solutions_eq_empty`. The following
covering-dependent extrema and constants are formed only in the `s>0, M.Nonempty` branch. Let (g, m)
be a Thue equation `(§2.9)` with roots `ξ^{(i)}` isolated in rational boxes `B_1, …, B_n` by §0.2 (real
roots in degenerate-imaginary boxes, the boxes of a conjugate pair mirror images). Tzanakis–de
Weger's constants are `C_1 := 2^{n−1}|m|/min_{i≤s}|g′(ξ^{(i)})|, C_2 := ½·min_{i<j}|ξ^{(i)} − ξ^{(j)}|, C_3 := max` over pairwise distinct `i_1, i_2, i_3` of `|ξ^{(i_1)} − ξ^{(i_2)}|/|ξ^{(i_1)} − ξ^{(i_3)}|, Y_0 := ⌈(2^{n−1}|m|/(min_{i≤t}|g′(ξ^{(s+i)})|·min_{i≤t}|Im ξ^{(s+i)}|))^{1/n}⌉` if `t ≥ 1`
and `Y_0 := 1` if `t = 0, Y_1 := max(Y_0, ⌈(4C_1)^{1/(n−2)}⌉), Y_1* := max(Y_1, ⌈(2C_1C_3/C_2)^{1/n}⌉)`;
given a factor covering `(ε, M) (§2.10): μ_− := min_{i, μ∈M}|μ^{(i)}|, μ_+ := max_{i, μ∈M}|μ^{(i)}|, C_4 := (½ + max_{i<j}|ξ^{(i)} − ξ^{(j)}|)/μ_−`, for an r-subset `I = {h_1, …, h_r}` of `{1, …, n}` the
matrix `U_I` with entry `log|ε_i^{(h_l)}|` in row l and column i (rows indexed by the embeddings,
columns by the units), `N[U_I^{−1}]` the maximal absolute row sum
of `U_I^{−1}, C_5 := min((n − 1)·min_I N[U_I^{−1}], max_{i_0≤s} N[U_{I(i_0)}^{−1}])` over the
invertible `U_I` and a choice of invertible `I(i_0)` ∌ `i_0, C_6 := 1.39·C_1C_3C_4^n/C_2` and `Y_2′ := max(Y_1*, 2|m|^{1/n}, μ_+/C_2)`. A ThueConstants datum consists of rationals `ĉ_1 ≥ C_1, 0 < ĉ_2 ≤ C_2, ĉ_3 ≥ C_3, 0 < μ̂_− ≤ μ_−, μ̂_+ ≥ μ_+, ĉ_4 ≥ C_4, ĉ_5 ≥ C_5, ĉ_6 ≥ 1.39·ĉ_1ĉ_3ĉ_4^n/ĉ_2` and
integers `Ŷ_0 ≥ Y_0, Ŷ_1 ≥ max(Ŷ_0, (4ĉ_1)^{1/(n−2)}), Ŷ_1* ≥ max(Ŷ_1, (2ĉ_1ĉ_3/ĉ_2)^{1/n}), Ŷ_2′ ≥ max(Ŷ_1*, 2|m|^{1/n}, μ̂_+/ĉ_2)`, each inequality verified exactly from the boxes: `|g′|, |ξ^{(i)} − ξ^{(j)}|, |Im ξ|` and `|μ^{(i)}|` by rational interval evaluation over the boxes (`ED.0` rational
interval product, §0.4), n-th roots by comparing integer powers `(Ŷ^n ≥ q)`, logarithms by §2.1, and
`N[U_I^{−1}]` by an approximate inverse: for a rational matrix `V` with `‖1 − V·U‖_∞ ≤ ρ < 1` for every `U`
in the interval matrix enclosing `U_I, U_I` is invertible and `N[U_I^{−1}] ≤ ‖V‖_∞/(1 − ρ)`. Every
constant is thereby an exact rational bound in the direction in which the lemmas use it; no
unrounded real number is stored. The constants have separate no-real-root, empty-covering and
nonempty-real-root alternatives. ThueBoundParameters is only the supporting partial mathematical record
used by the scalar lemmas; it does not certify c4,c5 or `μ±` without the explicit covering
inequalities. The hypotheses include all unit, representative, root and logarithm enclosures, not
merely g,m and a precision.

Work under the following conditions. The boxes isolate the n distinct roots of g (irreducible, hence
separable); the covering data are exact elements of `K` Only the direction of each inequality matters:
the lemmas of §2.12, thue-linear-form and thue-exponent-bound remain true with `C_1, C_3, C_4, C_5, C_6, Y_•` replaced by larger and `C_2, μ_−` by smaller positive values The real-root constants branch
requires `M.Nonempty` and invertible unit matrices. The empty-covering branch proves the solution set
empty before any representative extrema; the `s=0` branch contains only Y0 and never forms C1 or C5.

The interface includes these statements.

- ThueConstants: The rational and integer fields of the statement with the exact inequalities as fields (for instance `c₁_ge : C₁ g m ≤ ĉ₁`).
- The real scalar C1 from real roots; used only in the nonempty-real-root branch. The other scalar functions are separate named entries below.
- Under the complete root, unit and covering hypotheses,
  rational constants satisfying the displayed inequalities exist. In the nonempty-real-root
  case choose root and logarithm enclosure widths small enough to give positive separation
  and modulus lower bounds and rational inverse bounds `‖I−VU_I‖∞≤ρ<1` for the selected
  invertible minors. Only this case forms `μ±` and the unit-dependent constants.
- If `‖1 − V U‖_∞ ≤ ρ < 1` then `U` is invertible and `‖U⁻¹‖_∞ ≤ ‖V‖_∞/(1 − ρ)`.
- Replacing `ĉ_1, ĉ_3, ĉ_4, ĉ_5, ĉ_6, μ̂_+` and the Ŷ's by larger and `ĉ_2, μ̂_−` by smaller positive rationals yields a datum whenever the coupled inequalities `ĉ_6 ≥ 1.39·ĉ_1ĉ_3ĉ_4^n/ĉ_2, Ŷ_1 ≥ max(Ŷ_0, (4ĉ_1)^{1/(n−2)}), Ŷ_1* ≥ max(Ŷ_1, (2ĉ_1ĉ_3/ĉ_2)^{1/n})` and `Ŷ_2′ ≥ max(Ŷ_1*, 2|m|^{1/n}, μ̂_+/ĉ_2)` hold for the new values.
- Half the minimum distance of distinct roots.
- The maximum ratio of differences of three distinct roots.
- The real-root exclusion threshold from nonreal roots, with value1 when every root is real.
- The root-separation bound divided by the minimum embedded representative modulus for the specified covering.
- The inverse unit-log-matrix bound for the specified covering, with `rows=embeddings` and `columns=units`.
- `ThueConstants.μPlus`: The maximum modulus over every embedding of every covering representative.
- ThueBoundParameters: Supporting root/threshold inequalities and scalar parameters, with c4,c5 and `μp` supplied to downstream covering bounds as explicit hypotheses. This is not the full ThueConstants carrier.
- Weaken c1 alone in ThueBoundParameters, supplying the affected Y1,Y1* and c6 inequalities. It makes no claim to the full coupled monotonicity interface.
- The supporting real expression `||V||∞/(1−ρ)`.

For the proof, Dispatch the no-real-root and empty-covering branches before forming C1,C5 or `μ±`. In
the remaining branch `M` is finite nonempty and every embedded representative is nonzero, so `μ−` exists
and is positive. Interval evaluation: `g′(ξ^{(i)})` and the differences of roots lie in the rational
boxes obtained by evaluating g′ and z − w on the boxes; lower bounds of moduli come from the box
nearest to 0, upper bounds from the farthest corner. Approximate inverse: in the normed ring of `r×r`
real matrices with the `∞-operator norm (Matrix.linftyOpNormedRing, Matrix.linfty_opNorm_def`: the
norm is the maximal absolute row sum), `‖1 − VU‖ ≤ ρ < 1` makes `VU = 1 − (1 − VU)` a unit with inverse
`Σ(1 − VU)^k (Units.oneSub)` of `norm ≤ (1 − ρ)^{−1} (tsum_geometric_le_of_norm_lt_one)`, so `U^{−1} = (VU)^{−1}V` has `norm ≤ ‖V‖/(1 − ρ); ‖1 − VU‖` is bounded over the interval matrix by interval
arithmetic. Separability, nonzero representatives and invertible selected minors give strict
positive margins. Arbitrarily narrow root and logarithm enclosures preserve these margins;
rational density supplies an approximate inverse V with residual norm less than one.
Choose rational upper bounds and positive lower bounds in the indicated directions, then
choose the integer thresholds to satisfy all coupled inequalities. These choices establish
existence at sufficiently small enclosure widths.

The following arithmetic-input conventions apply to every solution datum of §§2.19–2.33. Assume an actual number field `K = ℚ(ξ)` with `[K:ℚ] =` deg g, labelled embeddings, its integral-basis identities, and a complete unit family of exactly `Units.rank K` elements. Any class-group, ideal-factorization, principal-generator and residue data are explicit hypotheses with their exact algebraic identifications. The factor covering is deduced from these identities and the norm/divisibility theorem of §2.10 (or the removing lemma of §2.22); it is not an assumption that the final solution list is complete. All logarithms carry the enclosures and nonvanishing required by §§2.1–2.7. Every reduction uses the displayed real or p-adic inequality and an actual integral change of basis. The implication for all solutions follows from these bounds and §2.8. Only the exact-number and logarithm-error existence results are numerical targets. For `s = 0` retain only the root isolations and `Y₀`. For `s > 0` and empty covering, the solution set is empty. In the remaining case `M ≠ ∅`, use its nonzero representatives, complete rank-sized units, the root/derivative separation bounds and logarithm intervals. For every selected minor require a rational `V` and `‖I − VU_I‖∞ ≤ ρ < 1`. These imply the correctly oriented bounds on `c₁,…,c₆, μ₋, μ₊, Y₀,Y₁,Y₁*,Y₂′`, including `c₄ ≥ C₄, c₅ ≥ C₅` and all coupled threshold inequalities. The monotonicity theorem retains those coupled hypotheses, and the partial ThueBoundParameters has only the scalar inequalities actually stated for it.

**Checks.**

- For `g = X³ − 2, m = 1 (s = 1, t = 1)`: g′(∛2) `= 3·2^{2/3} ≈ 4.762`, so `C_1 = 4/4.762 ≈ 0.840` and `Ŷ_1 ≥ ⌈4C_1⌉ = 4`; the root separation gives `C_2 = ½·min|ξ^{(i)} − ξ^{(j)}| = ½·√3·2^{1/3} ≈ 1.091`.
- For `s = 0` (no real root, `e.g`. `g = X⁴ + X + 1) C_1` and `C_5` are not formed; the datum consists of `Ŷ_0` only and every solution has `|Y| ≤ Ŷ_0`.
- With `U_I = ((2, 1), (0, 1))` (rows `=` embeddings), the row-sum norm of `U_I^{−1} = ((1/2, −1/2), (0, 1)`) is 1, while that of `(U_I^T)^{−1}` is 3/2: the transposed convention gives a different `C_5`, and the datum fixes rows `=` embeddings as forced by `(2.1)`.
- For `U =` the `1×1` matrix (2) and its exact inverse `V = (1/2): ρ = 0` and the bound `‖V‖/(1 − ρ) =` 1/2 equals `‖U^{−1}‖`, agreeing with Mathlib's `Matrix.linfty_opNorm_def`.
- Supporting mathematical bound: a ThueBoundParameters record for `X⁴+X+1` gives `|y|≤Y0` for every solution. This does not construct the `s=0` datum.
- For `g = X³ − 2, m = 1` the datum has `Ŷ_0 = 1` and `Ŷ_1 = 4 (C_1 ≈ 0.840, ⌈4C_1⌉ = 4`).

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, Lemma
1.1, p. 103; Lemma 1.2, p. 105; §II.2, Lemmas 2.1–2.2, pp. 107–110; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.2, proof of Lemma 2.1, p.
109.)

*Needs:* §2.9; §2.10; §2.1; §0.4; Mathlib `Matrix.linftyOpNormedRing`; Mathlib `Matrix.linfty_opNorm_def`; Mathlib `Units.oneSub`; Mathlib `tsum_geometric_le_of_norm_lt_one`; §0.2; §0.1.

### 2.12 Lemma 1.1: solutions with large `|Y|` approximate a real root

Let (g, m) be a Thue equation with exact constants `ĉ_1 ≥ C_1, 0 < ĉ_2 ≤ C_2, Ŷ_0 ≥ Y_0, Ŷ_1 ≥ max(Ŷ_0, (4ĉ_1)^{1/(n−2)}) (§2.11)`, and let `(X, Y) ∈ thueSolutions g m, β^{(i)} := X − Yξ^{(i)}`. (i)
If `|Y| > Ŷ_0` then `s ≥ 1` and there is `i_0 ∈ {1, …, s}` (a real root) with `|β^{(i_0)}| ≤ ĉ_1·|Y|^{−(n−1)}` and `|β^{(i)}| ≥ ĉ_2·|Y|` for all `i ≠ i_0`. In particular, if `s = 0` then every
solution has `|Y| ≤ Ŷ_0`. (ii) If `|Y| > Ŷ_1` then `|X/Y − ξ^{(i_0)}| ≤ ĉ_1|Y|^{−n} ≤ ¼·|Y|^{−2} < 1/(2·den(X/Y)²)`, hence `X/Y = Real.convergent ξ^{(i_0)} k` for some k (Legendre's theorem, Mathlib's
`Real.exists_rat_eq_convergent`).

Work under the following conditions. `(X, Y)` is a solution; no coprimality is assumed (`den(X/Y) ≤ |Y|`
is all that is used) The constants are any exact bounds in the directions stated

For the proof, Choose `i_0` with `|β^{(i_0)}|` minimal. From `|f_0|∏|β^{(i)}| = |m|` and `|Y||ξ^{(i)} − ξ^{(i_0)}| = |β^{(i)} − β^{(i_0)}| ≤ 2|β^{(i)}|` one gets `|β^{(i)}| ≥ C_2|Y|` for `i ≠ i_0` and
`|β^{(i_0)}| ≤ 2^{n−1}|m|/(|g′(ξ^{(i_0)})||Y|^{n−1})`, using `g′(ξ^{(i_0)}) = f_0∏_{i≠i_0}(ξ^{(i_0)} − ξ^{(i)})`. If `ξ^{(i_0)}` were non-real then `|X/Y − ξ^{(i_0)}| ≥ |Im ξ^{(i_0)}| (X/Y` is real)
contradicts `|X/Y − ξ^{(i_0)}| ≤ (Y_0/|Y|)^n·min|Im ξ|` for `|Y| > Y_0` (Tzanakis–de Weger, p. 104).
(ii): `ĉ_1|Y|^{−n} ≤ ¼Ŷ_1^{n−2}|Y|^{−n} < ¼|Y|^{−2} ≤ ¼den(X/Y)^{−2}; Real.exists_rat_eq_convergent`
applies to the rational `q = X/Y`. (Tzanakis–de Weger cite Hardy–Wright Theorem 184; Mathlib's version
is stated for q in lowest terms, which is why `den(X/Y) ≤ |Y|` is used.)

**Checks.**

- For `g = X³ − 2, m = 1` and the solution `(−1, −1): |Y| = 1 ≤ Ŷ_1`, so the lemma makes no claim; for every solution with `|Y| > Ŷ_1, X/Y` is a convergent of ∛2 `= [1`; 3, 1, 5, 1, 1, 4, …].
- For a totally complex `g (s = 0)` the lemma bounds every solution by `|Y| ≤ Ŷ_0`, which is the whole proof of finiteness in that case.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, Lemma
1.1 and its proof, pp. 103–104; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, p. 103.)

*Needs:* §2.11; §2.9; Mathlib `Real.exists_rat_eq_convergent`; Mathlib `Real.convergent`.

### 2.13 Lemma 1.2: the unit equation and a small nonzero linear form in logarithms

Let (g, m) be a Thue equation with `s ≥ 1`, a factor covering `(ε, M) (§2.10)` and exact constants
`(§2.11)`. Let `(X, Y)` be a solution with `|Y| > Ŷ_1*, i_0` the real index of §2.12, and write `X − Yξ = ±μ∏_{i≤r}ε_i^{a_i}` with `μ ∈ M`, a `∈ ℤ^r`. Choose j, k with `i_0, j, k` pairwise distinct and either `j, k ≤ s` (real case) or `ξ^{(k)} = conj ξ^{(j)}` (complex case); such j, k exist because `n ≥ 3`. Put `δ_μ := ((ξ^{(i_0)} − ξ^{(j)})/(ξ^{(i_0)} − ξ^{(k)}))·(μ^{(k)}/μ^{(j)})`. Siegel's identity
(DiophantineApproximationAndTranscendence §4.3 (Siegel identity)) gives the unit equation
`δ_μ∏_i(ε_i^{(k)}/ε_i^{(j)})^{a_i} − 1 = −((ξ^{(k)} − ξ^{(j)})/(ξ^{(k)} − ξ^{(i_0)}))·β^{(i_0)}/β^{(j)}` (TdW `(1.2)`). Define, in the real case, `Λ := Real.log|δ_μ| + Σ_i a_i·Real.log|ε_i^{(k)}/ε_i^{(j)}|` (TdW `(1.3)`), and in the complex case `Λ := Complex.arg δ_μ + Σ_i a_i·Complex.arg(ε_i^{(k)}/ε_i^{(j)}) + 2πa_0` for the unique `a_0 ∈ ℤ` making `Λ = −i·Complex.log(δ_μ∏(ε_i^{(k)}/ε_i^{(j)})^{a_i})` (TdW `(1.4)`). Then: (a) `Λ ≠ 0; (b) |Λ| < 1.39·ĉ_1ĉ_3/ĉ_2·|Y|^{−n}; (c)` in the complex case `|a_0| ≤ 1 + rA/2` with A `:= max_i |a_i|`; (d) as a
linear form in logarithms, `Λ` (real case) resp. `iΛ` (complex case) is `Σ_{l} b_lλ_l` with integer
coefficients `b = (1, a_1, …, a_r)` resp. `(1, a_1, …, a_r, 2a_0)`, and nonzero logarithms `λ_l` of the
algebraic numbers `|δ_μ|, |ε_i^{(k)}/ε_i^{(j)}|` (real case) resp. `δ_μ, ε_i^{(k)}/ε_i^{(j)}, −1` with `λ = Complex.log` (complex case), terms with `λ_l = 0` being deleted; all these numbers lie in the number
field `ℚ(ξ^{(i_0)}, ξ^{(j)}, ξ^{(k)}) ⊆ ℂ` of degree at most `n(n −` 1)(n − 2), and B* `:= max|b_l| ≤ (r + 2)·max(1`, A).

Work under the following conditions. `|Y| > Ŷ_1*` (so `|Y| > Ŷ_1 ≥ Ŷ_0` and the right side of `(1.2)` has
modulus `<` ½) The sign `±` of the covering cancels in the quotients `β^{(k)}/β^{(j)}` Nonvanishing (a) is
structural (`β^{(i_0)} ≠ 0` because `m ≠ 0`), never read off a numerical enclosure

For the proof, Siegel's identity with `(X, Y)` eliminated from `β^{(i)} = X − Yξ^{(i)}, i ∈ {i_0, j, k}`, gives `(1.2)`; substitute `β = ±μ∏ε^a`. By §2.12 and the definition of `C_3`, the right side of `(1.2)`
has modulus `≤ ĉ_1ĉ_3/(ĉ_2|Y|^n) <` ½ for `|Y| > Ŷ_1*`. Real case: the left side plus one is positive,
so it equals `e^Λ − 1`, and `|e^Λ − 1| <` ½ implies `|Λ| ≤ 2 log 2·|e^Λ − 1| ≤ 1.39|e^Λ − 1|`. Complex
case: the left side plus one has modulus 1 and equals `e^{iΛ}; |e^{iΛ} − 1| = 2|sin(Λ/2)| <` ½ and `|Λ| ≤ π` give `|Λ/2| < arcsin(1/4)`, and `x/sin x` is increasing on (`0, π/2`], so `|Λ| ≤ 4·arcsin(1/4)·|e^{iΛ} − 1| ≤ 1.02|e^{iΛ} − 1| (4·arcsin(1/4) ≈ 1.0107`; TdW p. 106 write the factor `(1/4)`/sin`(1/4)` ≈
`1.0105`, which needs `|Λ/2| ≤` 1/4). (a): `β^{(i_0)} ≠ 0` since `F(X, Y) = m ≠ 0`, and `ξ^{(k)} ≠ ξ^{(j)}`;
so the right side of `(1.2)` is nonzero and `Λ ≠ 0` (TdW, proof of Lemma `2.4). (c): |Λ| ≤ π, |Complex.arg| ≤ π`, so `2π|a_0| ≤ π + π + rAπ`. (d): in the real case `|α| = ±α` for real `α, Real.log|α|`
is the principal logarithm of the positive algebraic number `|α|`; in the complex case `Complex.log(−1) = πi`, so `2πa_0 = −i·2a_0·Complex.log(−1)`. The field degree bound is the degree of the compositum of
three conjugate fields of degree n.

**Checks.**

- For `g = X³ − 2 (s = 1, t = 1, r = 1): i_0 = 1` is forced and `(j, k) = (2, 3)` is the complex case; `Λ =` Arg `δ_μ + a_1 Arg(ε^{(3)}/ε^{(2)}) + 2πa_0` with `ε =` ∛2 − 1, and `|a_0| ≤ 1 + |a_1|/2`.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, (1.2)
and Lemma 1.2, pp. 105–106; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, (1.3)–(1.4), p. 107;
[Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.2, proof
of Lemma 2.4, p. 110.)

*Needs:* §2.12; §2.10; §2.11; DiophantineApproximationAndTranscendence §4.3 (Siegel identity); Mathlib `Complex.log`; Mathlib `Complex.arg`.

### 2.14 Lemmas 2.1–2.2: the exponents are logarithmic in `|Y|` and `Λ` decays exponentially

In the setting of §2.13, let A `:= max_{i≤r}|a_i|` and let `ĉ_4, ĉ_5, ĉ_6, Ŷ_2′` be exact constants
`(§2.11)`. (Lemma `2.1`) If `|Y| > max(Ŷ_1, 2|m|^{1/n}, μ̂_+/ĉ_2)` then `ĉ_4|Y| > 1` and A `< ĉ_5·Real.log(ĉ_4|Y|)`. (Lemma `2.2`) If `|Y| > Ŷ_2′` then `|Λ| < ĉ_6·exp(−(n/ĉ_5)·A)`.

Work under the following conditions. `U_I` is the matrix with entry `log|ε_i^{(h_l)}|` in row l
(embedding `h_l`) and column i (unit `ε_i`), so that `(log|β^{(h_l)}/μ^{(h_l)}|)_l = U_I·(a_i)_i; N[·]` is
the maximal absolute row sum The index sets `I` used in `ĉ_5` index invertible matrices; for the bound
with the maximum, `I(i_0)` avoids the real index `i_0` of the solution

For the proof, For every h: `|β^{(h)}| ≤ |β^{(i_0)}| + |Y||ξ^{(i_0)} − ξ^{(h)}| < (½ + max|ξ^{(i_1)} − ξ^{(i_2)}|)|Y|`, so `|β^{(h)}/μ^{(h)}| < C_4|Y|`; and `min_i |μ^{(i)}| ≤ |m|^{1/n}` with `|Y| > 2|m|^{1/n}` gives `C_4|Y| > 1` (TdW `(2.2)`). Since `∏_h|β^{(h)}/μ^{(h)}| = 1` (equal norms up to sign),
each `|log|β^{(i)}/μ^{(i)}|| < (n − 1)·log(C_4|Y|)` (TdW `(2.3)`); a `= U_I^{−1}(log|β^{(h_l)}/μ^{(h_l)}|)_l` gives A `≤ N[U_I^{−1}]·max_l|log|β^{(h_l)}/μ^{(h_l)}||`, hence A
`< (n − 1)N[U_I^{−1}]log(C_4|Y|)` for every `I`. If `i_0 ∉ I` then `|β^{(h)}/μ^{(h)}| > C_2|Y|/μ_+ > 1` for
`h ∈ I (§2.12 (i))`, so `0 < log|β^{(h)}/μ^{(h)}| < log(C_4|Y|)` and A `< N[U_I^{−1}]log(C_4|Y|)`;
together A `< C_5 log(C_4|Y|) ≤ ĉ_5 log(ĉ_4|Y|)`. Lemma `2.2: |Y| > exp(A/ĉ_5)/ĉ_4` by Lemma `2.1`, and
§2.13 (b) gives `|Λ| < 1.39ĉ_1ĉ_3/ĉ_2·|Y|^{−n} < ĉ_6 exp(−nA/ĉ_5)`.

**Checks.**

- For `g = X³ − 2 (r = 1`, units `ε =` ∛2 − 1): `U_I` is the `1×1` matrix `(log|ε^{(h)}|)` for one embedding h; with h the real embedding, `|log(∛2 − 1)| ≈ 1.347` and `N[U_I^{−1}] ≈ 0.742`, so A `< 2·0.742·log(C_4|Y|)` for every solution with `|Y| > max(Ŷ_1, 2, μ_+/C_2)`.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.2, Lemmas
2.1–2.2 and proof, pp. 107–110.)

*Needs:* §2.13; §2.12; §2.11.

### 2.15 Lemmas 2.3–2.4 with Matveev's bound: the initial exponent bound

In the setting of §2.13 and §2.14, fix the real index `i_0 ≤ s`, the representative `μ ∈ M` and the
indices j, k, and let c be the value of a MatveevConstantData `(§2.2)` for the family of
nonzero logarithms of §2.13 (d) (at most r + 1 logarithms in the real case, at most r + 2 in the
complex case) with degree bound `D := n(n −` 1)(n − 2), admissible through height bounds `h(δ_μ) ≤ 4h(ξ) + 2 log 2 + 2h(μ), h(ε_i^{(k)}/ε_i^{(j)}) ≤ 2h(ε_i), h(−1) = 0` (heights of elements of `K` from
§0.10) and the logarithm enclosures of §2.1. Put `C_7 := c, Ĉ_8 ≥ 1 + Real.log(r + 2)` (rational), a
`:= (ĉ_5/n)(ℓ⁺(ĉ_6) + C_7Ĉ_8), b := ĉ_5C_7/n`, and let `K_3` be a rational with `K_3 ≥ max(1, 2a + 2b(ℓ⁺(2b) − 1))`, ℓ⁺ denoting upper ends of `ED.2` rational logarithm/error bounds logarithm
enclosures. Then every solution `(X, Y)` with `|Y| > Ŷ_2′`, real index `i_0` and representative `μ`
satisfies A `≤ K_3` (and `|a_0| ≤ 1 + rK_3/2` in the complex case).

Work under the following conditions. `Λ ≠ 0` by §2.13 (a); this is the nonvanishing hypothesis of the
imported lower bound The Matveev datum is admissible for the actual family; heights of
conjugate quotients are bounded through the height of the field elements, never by numerical
evaluation alone

For the proof, §2.3 with B* `≤ (r +` 2)max(1, A): for A `≥ 1, |Λ| > exp(−C_7(1 + Real.log(r + 2) + Real.log A)) ≥ exp(−C_7(Ĉ_8 + log A)`) (TdW Lemma `2.3` with `C_8′ = Ĉ_8`). Combined with §2.14 (Lemma
`2.2): (n/ĉ_5)A < log ĉ_6 + C_7Ĉ_8 + C_7 log A, i.e`. A `<` a + b log A.
DiophantineApproximationAndTranscendence §4.3 (unit-equation exponent bound) gives A `≤ 2a + 2b(log(2b) − 1) ≤ K_3` (TdW instead cite Pethő–de Weger, Lemma `2.3`, with `C_9 = (2C_5/n)(log C_6 + C_7C_8′ + C_7 log(C_5C_7/n))`); for A `< 1` the bound `K_3 ≥ 1` holds trivially. Heights: `Height.logHeight₁_sub_le, Height.logHeight₁_mul_le` and `Height.logHeight₁_inv`, divided by the field degree
(`NumberField.totalWeight_eq_finrank: totalWeight K = [K : ℚ`]), give `h(x − y) ≤ log 2 + h(x) + h(y), h(xy) ≤ h(x) + h(y), h(x^{−1}) = h(x)`; conjugates have the same absolute height
(DiophantineApproximationAndTranscendence §0.2 (absolute scalar heights)). Degree bound: for
the three distinct conjugate roots `ξ_i, ξ_j, ξ_k` of the separable degree-n polynomial, successively
adjoin `ξ_i`, then a root of `g/(X−ξ_i)`, then a root of `g/((X−ξ_i)(X−ξ_j))`. The extension degrees are
at most n, n−1, n−2, respectively. Thus the compositum containing the logarithm arguments has degree
`≤ n(n−1)(n−2)`; three independent degree-n adjunction bounds would give only `n³`.

**Checks.**

- For a quartic totally real field as in TdW §III `(r = 3)`, with Matveev's constant for `r + 1 = 4` logarithms and `D ≤ 24, K_3` is of the order `10^{20}–10^{30}`; TdW's Waldschmidt-based bound was of size `10^{40} (p`. 111).

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.2, Lemmas
2.3–2.4, p. 110; [E. M.
Matveev](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng),
§2, Corollary 2.3, p. 1219.)

*Needs:* §2.14; §2.13; §2.3; §2.2; §0.10; DiophantineApproximationAndTranscendence §0.2 (absolute and relative scalar heights); DiophantineApproximationAndTranscendence §4.3 (unit-equation exponent bound); DiophantineApproximationAndTranscendence §0.2 (absolute scalar heights); Mathlib `Height.logHeight₁_sub_le`; Mathlib `Height.logHeight₁_mul_le`; Mathlib `Height.logHeight₁_inv`; Mathlib `NumberField.totalWeight_eq_finrank`.

### 2.16 Reduction of the initial bound and the bound for `|Y|`

Let (g, m) be a Thue equation with `s ≥ 1`, factor covering and exact constants. For each real
index `i_0 ≤ s` and `μ ∈ M`, with (j, k) fixed for `i_0`, let `𝒮_{i_0,μ} ⊆ ℤ^q (q = r` in the real case, `q = r + 1` with the extra coordinate `a_0` in the complex case) be the set of exponent vectors of solutions
with `|Y| > Ŷ_2′`, real index `i_0` and representative `μ`, with unit weights and `H(a) := max_i|a_i|` over
all q coordinates. Since A `≥ 1` (if `a_1 = ⋯ = a_r = 0` then `|β^{(h)}| = |μ^{(h)}| ≤ μ̂_+ < ĉ_2|Y| ≤ |β^{(h)}|` for `h ≠ i_0`, because `|Y| > Ŷ_2′ ≥ μ̂_+/ĉ_2`) and `|a_0| ≤ 1 + rA/2 ≤ (r +` 2)A/2, every a `∈ 𝒮_{i_0,μ}` satisfies `H(a) ≤ (r + 2)K_3/2` and `|Λ| < ĉ_6·exp(−δ·H(a))` with `δ := n/ĉ_5` (real case) resp.
`δ := 2n/((r + 2)ĉ_5`) (complex case). Let `R_{i_0,μ}` be an exponent reduction chain `(§2.8)` for
`𝒮_{i_0,μ}` starting at `X_0 := K_3` resp. `(r + 2)K_3/2 (§2.15)`, whose real steps are `ED.1` reductions
for this inequality with `Λ = δ′ + Σ a_iθ_i (δ′ = log|δ_μ|, θ_i = log|ε_i^{(k)}/ε_i^{(j)}|` in the
real case; `δ′ =` Arg `δ_μ, θ_i = Arg(ε_i^{(k)}/ε_i^{(j)}), θ_{r+1} = 2π` in the complex case), the
lattice data being integers `φ_i, ψ` with `|φ_i − c_0θ_i| ≤ 1` and `|ψ − c_0δ′| ≤ 1` for the scaling
constant `c_0` of the step (the `C` of §1.1; rounding the midpoint of an enclosure of width at most
`1/c_0`, from §2.1, meets this precision budget). Let `A_red` be the maximum of the final bounds (a
bound for `H`, hence for A) and `E` the union of the exceptional sets. For every index l let `E_l := ∏_i |ε_i^{(l)}|^{v_{il}}` with `v_{il} = ±1` chosen so that `|ε_i^{(l)}|^{v_{il}} ≥ 1`, with rational upper
bounds `Ê_l`. Then every solution `(X, Y)` satisfies `|Y| ≤ C := max(Ŷ_2′, Ŷ_red)` with an integer `Ŷ_red ≥ μ̂_+(Ê_{l_1}^{A_red} + Ê_{l_2}^{A_red})/|ξ^{(l_1)} − ξ^{(l_2)}|` for any fixed `l_1 ≠ l_2`, unless its
exponent vector lies in `E`; for a `∈ E` the element `±μ∏ε_i^{a_i}` is computed exactly in power-basis
coordinates and yields the candidate `(X, Y)` when it equals `X − Yξ` with `X, Y ∈ ℤ`.

Work under the following conditions. The real steps of the chains use §1.4 `(δ′ ≠ 0)` or §1.3 (`δ′ = 0`
exactly, decided by `ED.0` exact algebraic/ball data/algebraic-equality-check on `|δ_μ| = 1`
resp. `δ_μ = 1`) The theorem is a statement about all solutions; the chain data are finite
data checked by exact arithmetic

For the proof, Every solution with `|Y| > Ŷ_2′` has, for its `i_0` and `μ`, an exponent vector in
`𝒮_{i_0,μ}` with `H ≤ K_3` (real case) resp. `H ≤ (r + 2)K_3/2` (complex case) (`§2.15` with §2.13 (c))
satisfying the inequality of §2.14; soundness of the chain gives A `≤ A_red` or a `∈ E`. Pethő's
argument (TdW p. 118): `|β^{(l)}| = |μ^{(l)}|∏|ε_i^{(l)}|^{a_i} ≤ μ_+E_l^A`, and `Y = (β^{(l_1)} − β^{(l_2)})/(ξ^{(l_2)} − ξ^{(l_1)})`, so `|Y| ≤ μ_+(E_{l_1}^A + E_{l_2}^A)/|ξ^{(l_1)} − ξ^{(l_2)}|`;
with A `≤ A_red` this is at most `Ŷ_red`. Hence a solution not coming from `E` has `|Y| ≤ Ŷ_2′` or `|Y| ≤ Ŷ_red`.

**Checks.**

- In TdW §III.2 (pp. 124–126) the initial bound A `< 3.26·10^{40}` is reduced to A `≤ 72` by one step `(c_0 = 10^{140})` and to A `≤ 10` by a second step `(c_0 = 10^{12})`, after which the remaining exponent vectors are enumerated; the theorem turns such a bound into an explicit `C` for the continued-fraction search.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3, (3.1),
p. 111; [Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3,
p. 118.)

*Needs:* §2.15; §2.14; §2.8; §2.1; §1.1; §1.4; §1.3; §0.2.

### 2.17 The continued-fraction search for solutions of moderate size

Let (g, m) be a Thue equation with exact `Ŷ_1 (§2.11)` and let `C ≥ Ŷ_1` be an integer. For each
real root `ξ^{(i)} (i ≤ s)` let `ξ̃_i ∈ ℚ` with `|ξ̃_i − ξ^{(i)}| < 1/(6C²)` (exact by a refined root
box of width `< 1/(6C²)`). Then every solution `(X, Y)` with `Ŷ_1 < |Y| ≤ C` is of the form `(X, Y) = (Z·p, Z·q)` where `p/q = Real.convergent ξ̃_i k` for some `i ≤ s` and `k ∈` ℕ, written in lowest terms with `q ≥ 1`
and `q ≤ C`, and `Z ∈ ℤ ∖ {0}` with `Z^n ∣ m` (so `|Z| ≤ |m|^{1/n}`). Since `ξ̃_i` is rational,
`Real.convergent ξ̃_i k = ξ̃_i` for all k beyond the length of its finite continued fraction
(`GenContFract.terminates_iff_rat` for (`ξ̃_i : ℝ), GenContFract.convs_stable_of_terminated` and
`Real.convs_eq_convergent`), so the candidate set `{(Zp, Zq)}` is finite and is tested exactly against
`F(X, Y) = m`.

Work under the following conditions. `s ≥ 1` (for `s = 0` there are no solutions with `|Y| > Ŷ_0`, and the
search is empty) The test of TdW `(3.8)` on the partial quotients is not used: it is stated for the
partial quotients of `ξ^{(i_0)}`, while the search computes those of `ξ̃_i`; testing every convergent with `q ≤ C` is exhaustive and cheap

For the proof, By §2.12, `|X/Y − ξ^{(i_0)}| ≤ ĉ_1|Y|^{−n} ≤ ¼|Y|^{−2}` for `|Y| > Ŷ_1`, with `i_0 ≤ s`.
Then `|ξ̃_{i_0} − X/Y| < 1/(6C²) + 1/(4Y²) ≤ (1/6 + 1/4)/den(X/Y)² < 1/(2 den(X/Y)²`), since `den(X/Y) ≤ |Y| ≤ C`; Mathlib's `Real.exists_rat_eq_convergent` (Legendre) gives `X/Y = Real.convergent ξ̃_{i_0} k`
for some k. Write `X/Y = p/q` in lowest terms, `q ≥ 1`; then `(X, Y) = (Zp, Zq)` with `Z := Y/q ∈ ℤ ∖ {0}`,
and `m = F(Zp, Zq) = Z^nF(p, q)`, so `Z^n ∣ m; q ≤ |Y| ≤ C`. Finiteness: `GenContFract.of (ξ̃_i : ℝ`)
terminates `(GenContFract.terminates_iff_rat)`, its convergents are constant from the termination
index on `(GenContFract.convs_stable_of_terminated)`, and they are the `Real.convergent ξ̃_i k (Real.convs_eq_convergent)`; so `Real.convergent ξ̃_i` takes finitely many values.

**Checks.**

- For `g = X³ − 2, m = 1, ξ̃ = 126/100 (|ξ̃ − ∛2| ≈ 0.0001 < 1/(6·12²)` for `C = 12`): the convergents of 63/50 `= [1`; 3, 1, 5, 2] are 1, 4/3, 5/4, 29/23, 63/50; those with denominator `≤ 12` are 1, 4/3, 5/4, and with `Z^3 ∣ 1` they give `|Y| ≤ 4 = Ŷ_1`, so there is no solution with `Ŷ_1 < |Y| ≤ 12`.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3,
(3.7)–(3.8), pp. 117–118; [Tzanakis–de Weger
(1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3, p. 118.)

*Needs:* §2.12; §2.11; Mathlib `Real.exists_rat_eq_convergent`; Mathlib `Real.convergent`; Mathlib `GenContFract.terminates_iff_rat`; Mathlib `GenContFract.convs_stable_of_terminated`; Mathlib `Real.convs_eq_convergent`.

### 2.18 Exhaustive enumeration of the solutions with small `|Y|`

For a Thue equation (g, m) and a natural number `Y_1, thueSmallSolutions g m Y_1` is the finite set of
`(x, y) ∈ ℤ²` with `|y| ≤ Y_1` and `F(x, y) = m`, defined by this membership condition. For each y with `|y| ≤ Y_1`, the
polynomial `P_y(X) := F(X, y) − m ∈ ℤ[X]` has degree n and leading coefficient `f_0 ≠ 0`, so it is
nonzero and every integer root x satisfies `|x| < cauchyBound(P_y) = max_{i<n}|coeff_i(P_y)|/|f_0| + 1 (Polynomial.cauchyBound, Polynomial.IsRoot.norm_lt_cauchyBound` over `ℚ`); all possible integer roots lie in that finite range. Equivalently, `thueSmallSolutions g m Y_1 = thueSolutions g m ∩ {|y| ≤ Y_1}`, and the construction is the explicit finite enumeration that proves this equality.

Work under the following conditions. `n ≥ 1` and `f_0 ≠ 0` make every `P_y` a nonzero polynomial of degree
n, so the Cauchy bound applies for every y, including `y = 0` (where `P_0 = f_0X^n − m`)

The interface includes these statements.

- `thueSmallSolutions g m Y₁` : Finset `(ℤ × ℤ)`, the finite set specified by the displayed equation and bound.
- `p ∈ thueSmallSolutions g m Y₁ ↔ p ∈ thueSolutions g m ∧ |p.2| ≤ Y₁`.
- `Y₁ ≤ Y₁′` implies `thueSmallSolutions g m Y₁ ⊆ thueSmallSolutions g m Y₁′`.
- If `F(x, y) = m` then `|x| < cauchyBound(P_y)`.

For the proof, Membership: `(x, y)` is a solution with `|y| ≤ Y_1` iff x is an integer root of `P_y`.
Completeness: by `Polynomial.IsRoot.norm_lt_cauchyBound` (applied to `P_y` mapped to `ℚ`), every root
satisfies `|x| < cauchyBound P_y`; the enumerated range contains every integer root. Exactness: each
tested pair is accepted iff `F(x, y) = m`, an exact integer identity.

**Checks.**

- For `g = X³ − 2, m = 1, Y_1 = 1: thueSmallSolutions = {(1, 0), (−1, −1)} (y = 0: x³ = 1; y = 1: x³ = 3` has no integer root; `y = −1: x³ = −1`).
- For `Y_1 = 0` the set is `{(x, 0) : f_0x^n = m}`; for `g = X³ − 2, m = 8` it is `{(2, 0)}`.
- Bounding `|x|` by `|m|` instead of the Cauchy bound is wrong: for `g = X³ − 2` and `m = −3` the pair `(5, 4)` is a solution with `|x| = 5 > |m|`, while `|5| < cauchyBound(X³ − 125) = 126`.
- For every y with `|y| ≤ Y₁`, the fibre `{x | (x, y) ∈ thueSmallSolutions g m Y₁}` equals `(P_y).roots.toFinset` for Mathlib's `Polynomial.roots` of `P_y ∈ ℤ[X] (Polynomial.mem_roots, P_y ≠ 0)`; for `g = X³ − 2, m = 1, y = −1` both are `{−1} (P_{−1} = X³ + 1)`.
- `thueSmallSolutions (X³ − 2) 1 4 = {(1, 0), (−1, −1)}`.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.1, p.
103.)

*Needs:* §2.9; Mathlib `Polynomial.cauchyBound`; Mathlib `Polynomial.IsRoot.norm_lt_cauchyBound`.

### 2.19 Thue solution data

A ThueData for a Thue equation `(g, m) (§2.9)` is the following finite data, each item with its
exact check: (1) root boxes and a ThueConstants datum `(§2.11)` with `Ŷ_0, Ŷ_1`; (2) if `s = 0`:
nothing more; (3) if `s ≥ 1`: a factor covering (`ε, M) (§2.10`, whose conditions `(U), (M)` are
hypotheses of the soundness theorem, not checks); for every real index `i_0 ≤ s` and `μ ∈ M` a choice of
(j, k), a MatveevConstantData admissible for the logarithms of §2.13 (d), a rational `K_3` as
in §2.15 and an exponent reduction chain from `K_3` (real case) resp. `(r + 2)K_3/2` (complex case)
`(§2.8)` with its exceptional sets; rational bounds `Ê_l`, an integer `Ŷ_red` and the integer `C := max(Ŷ_2′, Ŷ_red)` of §2.16; for every real root a rational `ξ̃_i` with `|ξ̃_i − ξ^{(i)}| < 1/(6C²)`; (4)
the claimed list `L ⊆ ℤ²`, required to be the set of pairs that pass the exact test `F(x, y) = m` among:
the small solutions `thueSmallSolutions g m Ŷ_1 (§2.18)` (with `Ŷ_0` in place of `Ŷ_1` when `s = 0`), the
candidates (Zp, Zq) of §2.17 for all real roots, convergents `p/q` of `ξ̃_i` with `q ≤ C` and `Z^n ∣ m`, and
the candidates obtained from the exceptional exponent vectors. The predicate `ThueData.Valid`
is the conjunction of all checks; each condition is a statement about integers and rationals
(polynomial evaluations, comparisons, exact arithmetic in `K` and in ZMod), with precision budgets
fixed by the data: the root boxes have the widths needed for the constants and for `|ξ̃_i − ξ^{(i)}| < 1/(6C²)`, and the lattice entries of every real reduction step are integers within the exact
error of `c_0·θ_i` required by §1.1 (`c_0` the scaling constant of that step, distinct from the search
bound `C`). The four classes of Tzanakis–de Weger are: `(I) |Y| ≤ Ŷ_1`, enumerated; `(II) Ŷ_1 < |Y| ≤ C`,
continued fractions; (III) `C < |Y|` with A `≤ K_3`, excluded by the reduction chains; (IV) A `> K_3`,
excluded by the imported Matveev bound.

Work under the following conditions. All data are finite; a datum that fails a check proves
nothing The covering conditions `(U), (M)` are input hypotheses discharged by the explicit
class/unit/factorization input hypotheses or by
DiophantineApproximationAndTranscendence §4.1 `(exists_mem_boundedDivisors_of_dvd) (§2.10)`

The interface includes these statements.

- ThueData: The data (1)–(4) of the statement, with the claimed solutions as a Finset `(ℤ × ℤ)`.
- The conjunction of all exact checks of the statement (a mathematical proposition).
- The claimed list `L`.
- The integer `C` bounding `|Y|` for every solution that does not come from an exceptional exponent vector.
- Valid implies `L ⊆ thueSolutions g m` (every listed pair passed the exact test).

For the proof, combine the initial-bound theorem, componentwise reduction and the exact
finite-set membership equivalences. Each retained exponent yields an actual field element;
only integral coordinates satisfying the original equation belong to the resulting finite set.


**Checks.**

- For `g = X³ − 2, m = 1`, a valid datum has `L ⊇ {(1, 0), (−1, −1)}`, since these pass the small-solution enumeration.
- For `s = 0 (g = X⁴ + X + 1, m = 1)` the datum is `(Ŷ_0, thueSmallSolutions g 1 Ŷ_0)`: no units, no linear forms.
- A datum whose `ξ̃_i` misses the bound `|ξ̃_i − ξ^{(i)}| < 1/(6C²)` is not valid, even if `L` happens to be correct; validity is about the checks, not the answer.
- A datum listing `(2, 1)` for `g = X³ − 2, m = 1` is not valid: `F(2, 1) = 6 ≠ 1` fails the exact test.
- `solutions_subset` together with §2.20 gives the equality of Finset coerced to Set with the Set of solutions `thueSolutions g m (§2.9)`.
- A valid mathematical record for `x³−2y³=1` contains `(1,0),(−1,−1)`.
- A real root outside all required approximation intervals contradicts mathematical validity.
- Listing `(2,1)` for `x³−2y³=1` contradicts mathematical validity.
- A valid mathematical record with the correct field/root has membership equivalent to `F(x,y)=m`.
- The finite set is defined by exact equation membership; §2.20 proves that the initial bound and all reduction implications make it exhaustive.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.3, pp.
117–118; [Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf),
§II.1, p. 103.)

*Needs:* §2.11; §2.10; §2.18; §2.17; §2.16; §2.15; §2.2; §2.8.

### 2.20 Exact solution sets of Thue equations

Let (g, m) be a Thue equation (`n =` deg `g ≥ 3, g` irreducible over `ℚ, m ≠ 0`) and let c be a
ThueData for (g, m) with `c.Valid (§2.19)`. If `s ≥ 1` assume moreover the covering hypotheses
`(U)` and `(M)` of its factor covering `(§2.10)`. Then `thueSolutions g m = c.solutions` (as subsets of `ℤ × ℤ`). In particular every solution either lies in the enumerated box `|Y| ≤ C (C = c.searchBound)` or is
one of the tested candidates obtained from the exceptional exponent vectors, and every solution
satisfies `|X| < cauchyBound` of `F(·, Y) − m`; there are no other solutions. The proof uses Matveev's
lower bound only through §2.3, whose constant is computed in the datum; the name of the
theorem supplies no number.

Work under the following conditions. Thue equation hypotheses; `c.Valid`; covering hypotheses `(U), (M)`
when `s ≥ 1`. Nothing is assumed about the size of the solutions; nonvanishing of every linear form is proved, not checked numerically. This is the general soundness theorem of the method, quantified over every Thue equation and every datum, so validity is its hypothesis. In an application to one equation (§§6.36–6.37) the datum is explicit, its validity is a proof step by exact computation, and the resulting solution-set theorem is unconditional.

The interface includes these statements.

- The existing mathematical validity predicate, with the actual equation and stated field/root hypotheses, implies equality with the solution set. It is a supporting conditional theorem, not conditions soundness.

For the proof, derive the covering and initial exponent bounds from the identified arithmetic input,
then apply each proved reduction implication and the finite-set membership equivalence. `⊇`: every element of `c.solutions` passed
the exact test `F(x, y) = m`. `⊆, s = 0`: by §2.12 (i) every solution has `|Y| ≤ Ŷ_0`, and the
small-solution enumeration up to `Ŷ_0` is complete `(§2.18). ⊆, s ≥ 1`: let `(X, Y)` be a solution. If `|Y|`
`≤ Ŷ_1` it is in the small-solution list. If `|Y| > Ŷ_2′ (≥ Ŷ_1*)`, §2.12 gives the real index `i_0`, the
covering gives `μ` and a, §2.13 gives `Λ ≠ 0` with the bounds of Lemma `1.2`, §2.15 gives A `≤ K_3` and
§2.16 gives `|Y| ≤ C` or an exceptional exponent vector (then `(X, Y)` is among the tested exceptional
candidates). If `|Y| ≤ C`, §2.17 puts `(X, Y)` among the tested convergent candidates. In each case `(X, Y) ∈ c.solutions`.


**Checks.**

- A theorem row proves that every solution lies in the enumerated box or among the tested exceptional candidates: `thueSolutions g m ⊆ {(x, y) : |y| ≤ C} ∪ E_cand`, with `E_cand` the candidates obtained from the exceptional exponent vectors, and `thueSolutions g m` equals the listed set.
- Small instance: for `g = X³ − 2` and `m = 1` a valid datum must have `c.solutions = {(1, 0), (−1, −1)}` (the classical result for `x³ − 2y³ = 1`); a complete worked datum is a Layer 6 target.
- The Baker/Matveev source (Matveev, Izv. Math. 64 (2000), Corollary `2.3`) is registered separately from Tzanakis–de Weger, and its constant enters only through §2.2.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), Abstract, p.
99; [Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), §II.2,
Remark after Lemma 2.4, p. 111.)

*Needs:* §2.19; §2.12; §2.13; §2.15; §2.16; §2.17; §2.18; §2.3; DiophantineApproximationAndTranscendence §4.3 (effective Thue bound).

### 2.21 Thue–Mahler equations and their normalised solution sets

A Thue–Mahler equation is given by `g ∈ ℤ[X]` with `n := g.natDegree ≥ 3`, irreducible over `ℚ`, leading
coefficient `f_0`, an integer `c ≠ 0` and distinct primes `p_1, …, p_v (v ≥ 0`; Tzanakis–de Weger take `v ≥ 1`, and `v = 0` is the Thue equation `F(X, Y) = c` with normalised solutions) with `gcd(c, p_1⋯p_v) = 1`;
with `F := Polynomial.homogenize g n` its normalised solution set is `thueMahlerSolutions g c p := {(X, Y, z) ∈ ℤ × ℤ × ℕ^v : gcd(X, Y) = 1, gcd(Y, f_0) = 1, F(X, Y) = c·p_1^{z_1}⋯p_v^{z_v}}`. The
conditions `gcd(X, Y) = 1` (essential: otherwise `(kX, kY)` with k a product of the `p_i` gives infinitely
many solutions) and `gcd(Y, f_0) = 1` are part of the definition; the second is automatic when `f_0 = ±1`. The equation with right side `−c·∏p_i^{z_i}` is the instance (g, −c, p). With `x := f_0X, y := Y, θ := f_0ξ (ξ` the class of `X` in `K := ℚ[X]/(g)`), the equation becomes `N_{K/ℚ}(x − yθ) = f_0^{n−1}c·∏p_i^{z_i}` with `gcd(x, y) = 1`, and `θ` is a root of the monic `G := integralNormalization g`
(DiophantineApproximationAndTranscendence §4.3 (monic Thue reduction)). The set is finite
(DiophantineApproximationAndTranscendence §4.5 (effective Thue–Mahler finiteness)); this stage
certifies it exactly `(§2.28)`.

Work under the following conditions. `n ≥ 3`, irreducibility, `c ≠ 0`, the `p_i` distinct primes not
dividing c Solutions are triples with coprime `(X, Y)` and `gcd(Y, f_0) = 1`; the exponents `z_i` are
natural numbers

The interface includes these statements.

- `thueMahlerSolutions g c p` : Set (`ℤ × ℤ ×` (Fin `v →` ℕ)) as in the statement.
- `(X, Y, z) ∈ thueMahlerSolutions g c p ↔` IsCoprime `X Y ∧` IsCoprime `Y f_0 ∧ thueForm g X Y = c·∏ p_i^{z_i}`.
- `(X, Y, z)` is a solution iff `(x, y) = (f_0X, Y)` is coprime with `N(x − yθ) = f_0^{n−1}c∏p_i^{z_i}` and `f_0 ∣ x`.
- ThueMahlerEquation: Bundled g, c, p with the hypotheses of the statement.
- The set is finite (DiophantineApproximationAndTranscendence §4.5 (effective Thue–Mahler finiteness)).

For the proof, `F(x, y) = c∏p_i^{z_i} ⟺ f_0·N(X − Yξ) = c∏p_i^{z_i}`, since `f_0∏_i(X − Yξ^{(i)}) = F(X, Y)`. `N(f_0X − Yθ) = f_0^n N(X − Yξ) = f_0^{n−1}·F(X, Y); gcd(f_0X, Y)` divides `gcd(f_0, Y)·gcd(X, Y) = 1` under the two coprimality conditions, and conversely `gcd(f_0X, Y) = 1` gives both conditions.

**Checks.**

- For `g = X³ − 2, c = 1, p = (5): (X, Y, z) = (1, 0, 0)` and `(−1, −1, 0)` are solutions, and `(3, 1, 2)` is one since `27 − 2 = 25 = 5²`.
- `(5, 0, ·)` is not a solution for `g = X³ − 2, c = 1, p = (5)` although `5³ = 5³: gcd(5, 0) = 5 ≠ 1`; dropping coprimality makes the set infinite `((5^k, 0, 3k))`.
- The triples with `z = 0` are exactly the coprime solutions (with `gcd(Y, f_0) = 1`) of the Thue equation `F(X, Y) = c (§2.9)`.
- For `c = −1` the instance (g, −1, p) is a different equation; for `g = X³ − 2` it contains `(1, 1, 0)` since `1 − 2 = −1`.
- `(2,0)` solves `X³−2Y³=8` but is excluded by coprimality in the zero-primes normalized equation.
- `(3, 1, 2) ∈ thueMahlerSolutions (X³ − 2) 1 (5)`, since `3³ − 2 = 5²`.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §1, (1)–(2), p.
223; [N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §2, pp.
225–226.)

*Needs:* §2.9; DiophantineApproximationAndTranscendence §4.5 (effective Thue–Mahler finiteness); DiophantineApproximationAndTranscendence §4.3 (monic Thue reduction); Mathlib `Polynomial.homogenize`; Mathlib `Polynomial.integralNormalization`.

### 2.22 The Prime Ideal Removing Lemma

Conditional on the explicit arithmetic-input hypotheses listed below, let `θ` be an algebraic integer
of degree n with minimal polynomial `G ∈ ℤ[t]` and discriminant `D_θ, K = ℚ(θ), p` a prime, `G = G_1⋯G_m`
the factorisation into monic irreducibles over `ℚ_p, 𝔭_i` the prime of `K` above p corresponding to `G_i`,
with ramification index `e_i` and residue degree `d_i (e_id_i =` deg `G_i), θ_i^{(1)}, …, θ_i^{(n_i)}` the
roots of `G_i` in `ℂ_p, ord_p` the valuation of `ℂ_p` with `ord_p(p) = 1, e := max_i e_i`. Let `x, y ∈ ℤ` with
`gcd(x, y) = 1`. (i) For every pair `i ≠ j` there is at most one 𝔭 `∈ {𝔭_i, 𝔭_j}` with `ord_𝔭(x − yθ) > max(e_i, e_j)·ord_p(θ_i^{(k)} − θ_j^{(l)})` (any k, l). (ii) If `d_i > 1` or `e_i > 1`, then `ord_{𝔭_i}(x − yθ) ≤ e_i·ord_p(θ_i^{(k)} − θ_i^{(l)})` for any `k ≠ l`. Corollary: there is at most one `𝔭_i` above p
with `ord_{𝔭_i}(x − yθ) > ½e·ord_p(D_θ)`, and it has `d_i = e_i = 1`; if `p ∤ D_θ`, at most one `𝔭_i` above
p divides `x − yθ`, and it has `d_i = e_i = 1`. Consequently the ideal `(x − yθ)` factors as
`𝔞·𝔟·𝔭_1^{u_1}⋯𝔭_v^{u_v}` with `𝔭_i` a prime of degree one above `p_i`, 𝔞 of absolute ideal `norm |f_0^{n−1}c|`, 𝔟 supported on the other primes above the `p_i` with exponents bounded by (i) (at the
other degree-one primes) and (ii) (at the primes with `d_i > 1` or `e_i > 1`), and `u_i + ord_{p_i}(N𝔟) = z_i`, for finitely many explicit choices (TdW (9)).

Work under the following conditions. `gcd(x, y) = 1` is essential (it gives `ord_p(x − yθ_i^{(k)}) = 0`
when `p ∣ y`) Orders of `ℂ_p-elements` are rational; the bounds are computed from finitely many p-adic
root approximations `(§0.6)` and are exact rationals The prime ideals above each listed rational
prime, their e/f values, and factorizations of the finitely many coefficient/difference ideals are
supplied with exact ideal equalities and valuation comparisons in the actual completions. No
prime-ideal factorization procedure is a target.

The interface includes these statements.

- Supporting third-corollary uniqueness only: for a primitive integral `θ` whose minimal polynomial is squarefree mod p and coprime x,y, the nonzero prime ideals above p containing `x−yθ` form a subsingleton.

For the proof, (i): if `(x − yθ) = 𝔭_i^{v_i}𝔭_j^{v_j}𝔞` then `ord_p(x − yθ_i^{(k)}) = v_i/e_i` through
the embedding `K → K_{𝔭_i} → ℂ_p`, similarly for j; hence `ord_p(y(θ_i^{(k)} − θ_j^{(l)})) ≥ min(v_i, v_j)/max(e_i, e_j)`, and `ord_p(y) = 0` (if `p ∣ y` then `p ∤ x` and both orders vanish) (TdW pp. 231–232).
(ii): if deg `G_i > 1` take two roots `k ≠ l` of `G_i`; both `x − yθ_i^{(k)}` and `x − yθ_i^{(l)}` have order
`v/e_i` and the same argument applies. Corollaries: `ord_p(D_θ) ≥ 2·ord_p(θ^{(h)} − θ^{(l)})` for all `h ≠ l`, so (8) implies the hypothesis of the first corollary; part (i) of the first corollary gives
uniqueness and part (ii) gives `d_i = e_i = 1` (TdW pp. 232–233). The finite ideal enumeration uses absolute ideal norms, so the fixed
norm is `|f0^(n−1)c|` for either sign of c. Its prime/exponent labels and principal-element
reconstruction are distinct obligations; the unramified uniqueness helper does not supply the
ramified bounds nor the finite factorization consequence.

For a primitive integral `θ` of degree `n≥2` with `K=Q(θ)`, a prime p, the complete monic irreducible factorization `G=∏G_i` over `Q_p`, corresponding prime ideals `P_i⊂O_K`, their `e_i,f_i` with `deg(G_i)=e_i f_i`, and the roots `θ_i,k` in an actual common finite extension of `Q_p`, normalize `v_p(p)=1` and certify `ord_{P_i}(x−yθ)=e_i v_p(x−yθ_i,k)`. For coprime x,y prove (i) for `i≠j` at most one `v_i,v_j` exceeds `max(e_i,e_j)v_p(θ_i,k−θ_j,l)`; (ii) if `e_i f_i>1, v_i≤e_i v_p(θ_i,k−θ_i,l)` for all distinct k,l. Then with `e=max e_i`, at most one `v_i>(e/2)v_p(disc G)`, and any such factor has `e_i=f_i=1`; if p does not divide disc `G`, any factor dividing `x−yθ` is the unique such degree-one unramified factor. For a normalized Thue–Mahler equation apply this to each `p_i` and the exact fixed-norm ideal factorization to enumerate finitely many `(a,b,P_i)` with `(x−yθ)=a b∏P_i^u_i`, absolute `norm(a)=|f0^(n−1)c|, b` supported above the `p_i` with every nonfree valuation bounded by the explicit pairwise/within-factor bounds, each free `P_i` of degree one, and `u_i+v_{p_i}(norm b)=z_i` after separating the fixed norm. Where no degree-one factor exists there is no free exponent. The output has completeness for every normalized solution, obtained from the valuation theorem, not supplied as a generic predicate. The uniqueness conclusion alone gives only uniqueness in its squarefree-mod-p branch and does not stand for these conclusions.

**Checks.**

- TdW `5^Ex`: for `G` of the example and `p = 5, ord_5(D_θ) = 2` and three degree-one primes above 5; the lemma leaves the five forms `𝔭_{21}^{n_1}𝔭_{31}^{n_2}𝔭_{5j}^{n_3}𝔭_{71}^{n_4}·(bounded)` listed on p. 233.
- If `p ∤ D_θ` then at most one prime above p divides `x − yθ`: for `G = t³ − 2` and `p = 5 (5 ∤ D = −108), x −` y∛2 is divisible by at most one prime above 5.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §5, Lemma 1 and
its corollaries, pp. 230–233; [N. Tzanakis, B. M. M. de
Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §6, (9), p. 233.)

*Needs:* §0.6; §0.8; Mathlib `padicValRat`; Mathlib `Polynomial.integralNormalization`.

### 2.23 Thue–Mahler S-unit coverings

Conditional on the explicit arithmetic-input hypotheses listed below, let (g, c, p) be a Thue–Mahler
equation `(§2.21), θ = f_0ξ, 𝒪` an order of `K` containing `θ, r := s + t − 1`. A Thue–Mahler S-unit
covering consists of units `ε_1, …, ε_r` of `𝒪` and a finite list of cases, each case being `(α, π_1, …, π_v, h, s′, t′)` with `α ∈ 𝒪 ∖ {0}, π_i ∈ 𝒪` generating `𝔭_i^{h_i}` for a prime `𝔭_i` of degree one above
`p_i` (or `π_i := 1, h_i := 0` and `s′_i := 0` when there is none, and then the representation is
normalized to `n_i = 0` in `(C)`), for active primes integers `h_i ≥ 1, 0 ≤ s′_i < h_i` and `t′_i ≥ 0`, such
that: `(U)` every unit of `𝒪` is `ζ∏ε_i^{a_i}` with `ζ` a root of unity of `K (ζ = ±1` when `s ≥ 1); (C)` for
every `(X, Y, z) ∈ thueMahlerSolutions g c p`, with `x = f_0X, y = Y`, there are a case, a `∈ ℤ^r` and `n ∈ ℕ^v` with `x − yθ = ±α·ε_1^{a_1}⋯ε_r^{a_r}·π_1^{n_1}⋯π_v^{n_v}` (TdW (11)) and `z_i = n_ih_i + s′_i + t′_i` (TdW (10)); roots of unity other than `±1` are absorbed into the finitely many `α`. The conditions
are input hypotheses of the datum; for `𝒪 = 𝓞_K` they are discharged by the Prime Ideal Removing
Lemma `(§2.22)` and the ideal factorisations of `f_0^{n−1}c` and of the `p_i` (the supplied exact
prime-ideal-factorization identities), principal generators of `𝔞𝔟𝔭_1^{s′_1}⋯𝔭_v^{s′_v}` and of
`𝔭_i^{h_i}`, and the unit datum the explicit full-unit-generation hypothesis;
DiophantineApproximationAndTranscendence §4.1 (S-integral divisor representatives) shows that a finite
list of cases always exists. The datum fixes `r = Units.rank K`, excludes zero `α` and `π` in every
case, and records either `h_i=0,π_i=1,s′_i=0` or `h_i>0,s′_i<h_i`. Inactive exponents are normalized to
zero by the representation theorem.

Work under the following conditions. The class number is not needed: any `h_i` with `𝔭_i^{h_i}`
principal works (TdW p. `226) (C`) is a statement about all normalised solutions; it is not checked by
computation inside the datum Exactly `rank(K)` unit generators; every case has nonzero `α` and
`π_i`, with positive active class orders and bounded remainders. A supplied complete unit family,
complete finite divisor/principal-ideal representative data and exact factorization/valuation
equalities supply the S-unit covering. Prove the covering from these identities and the equation; do
not assume the final solution list complete.

The interface includes these statements.

- ThueMahlerCovering: Units, the finite list of cases, and the fields `units_generate` and covers of the statement. Also `rank_eq, α_ne_zero, π_ne_zero` and `case_wellformed` enforce the stated rank and case conventions.
- Every normalised solution has a case and exponents (a, n) with `x − yθ = ±α∏ε^a∏π^n` and `z_i = n_ih_i + s′_i + t′_i`.
- From prime-ideal factorisation data, principal generators and a unit datum, the covering of the statement.
- For `v = 0` (no primes) a covering is a factor covering of the Thue equation `F(X, Y) = c` restricted to coprime solutions.

For the proof, From (9): `(x − yθ) = 𝔞𝔟𝔭_1^{u_1}⋯𝔭_v^{u_v}`; write `u_i = h_in_i + s′_i` with `0 ≤ s′_i < h_i` and `t′_i := ord_{p_i}(N𝔟)`; then `(α) := 𝔞𝔟𝔭_1^{s′_1}⋯𝔭_v^{s′_v}` is principal and `x − yθ = unit·α·∏π_i^{n_i}`. The unit is `±∏ε_i^{a_i}` by `(U)`; finitely many `α` arise because 𝔞 and 𝔟 range over
finitely many ideals.

For `θ` root of `integralNormalization g, [K:Q]=deg g`, normalized ThueMahlerEquation, verified primes above each `p_i`, complete valuations/divisor representatives, principal ideal generators, ideal class orders `h_i` and complete units, return the finite cases `α,π,h,s,t` with `α` and each active `π` nonzero, and covers. Class orders and degree-one factors determine when `n_i` is free; when no degree-one factor occurs use `h_i=0,π_i=1,n_i=0`. The unit-only specialization requires the same covering identities.

For the same explicitly ordered five cases as `tmCovering_example_cases`, with `c=−1` and `point(399,302)`, verify `F(399,302)=−3^13·5^3` and its principal ideal has 5-part `P52²P53` using the actual ideal generators and exact factorization. Delete exactly CaseIII, whose `α=π53,π5=π52,t3=1,n3=2`; prove the remaining four cases cannot represent that point, including either unit sign and every unit exponent. Thus the finite case-coverage conditions rejects the shortened input before the solution-list comparison. A hypothesis already saying a solution has no representation, or merely a nonempty-list theorem, is not this test.

**Checks.**

- For `G=X³−23X²+5X+24, θ` a root in the degree-three field, ordered `primes(2,3,5,7)` and `c=±1`, set `ω=(2+θ−θ²)/5; π21=22+25θ+6ω, π31=31−41θ+47ω, π51=133+150θ+36ω, π52=89+100θ+24ω, π53=111−90θ−16ω, π71=1−θ`. The covering case list is exactly `I:(α=1,π5=π51,t3=0), II:(1,π52,0), III:(π53,π52,1), IV:(1,π53,0), V:(π52,π53,1)`; all `h_i=1,s_i=0`, and the other `π_i` are `π21,π31,π71` with other `t_i=0`. Equality of the five records, not merely list length, is asserted. These are exact input data for the covering theorem.
- When no degree-one prime is active, `π_i=1` and `h_i=0`: the complete covering representation can be chosen with `n_i=0`, and `z_i=s_i+t_i`. The test asserts zero, not merely an unspecified exponent identity.
- Dropping Case III `(α = π_{53}, π_5 = π_{52})` from TdW's five cases loses the solution `(x, y) = (399, 302), F(399, 302) = −3^{13}·5³`, listed in Case III with `n_3 = 2` (TdW 17Ex): `𝔭_{52}² 𝔭_{53}` exactly divides its 5-part, and no other case has this shape (Cases `I, II, IV` omit `𝔭_{53}` or `𝔭_{52}`, Case `V` has `𝔭_{52}` to the first power); the remaining list is not a covering.
- For `𝒪 = 𝓞_K` and `ε = NumberField.Units.fundSystem K` condition `(U)` is Mathlib's `NumberField.Units.exist_unique_eq_mul_prod`.
- For `Units.rank K=1`, no covering has `r=2`; redundant unit generators cannot yield bounded exponent coordinates.
- A mathematical covering with an actual normalized solution has a nonempty case list. This does not prove the named missing-Case-III arithmetic Check.
- TdW's five cases of `6^Ex (p`. 234) form a covering of their example once `(U)` and `(C)` are exact.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §6, (10)–(11),
p. 234.)

*Needs:* §2.21; §2.22; DiophantineApproximationAndTranscendence §4.1 (S-integral divisor representatives); Mathlib `NumberField.Units.exist_unique_eq_mul_prod`; Mathlib `NumberField.Units.isMaxRank_iff_closure_finiteIndex`.

### 2.24 Initial bounds for the Thue–Mahler exponents from Yu's and Matveev's bounds

Fix a case of a Thue–Mahler S-unit covering `(§2.23)` and put `N := max({n_i}∪{0}), A := max({|a_i|}∪{0}), H := max(N`, A). (a) p-adic step (TdW §7–8): for each l with `π_l ≠ 1` let `θ^{(i_0)} ∈ ℚ_{p_l}` be the root
corresponding to `𝔭_l` and j, k two further indices (roots of two other linear factors of `G` over
`ℚ_{p_l}`, or the two roots of one factor of degree `≥ 2`); with `δ_1 := ((θ^{(i_0)} − θ^{(j)})/(θ^{(i_0)} − θ^{(k)}))·α^{(k)}/α^{(j)}, δ_2 := ((θ^{(j)} − θ^{(k)})/(θ^{(k)} − θ^{(i_0)}))·α^{(i_0)}/α^{(j)}` and `λ := δ_1∏_i(π_i^{(k)}/π_i^{(j)})^{n_i}∏_i(ε_i^{(k)}/ε_i^{(j)})^{a_i} − 1 = δ_2∏_i(π_i^{(i_0)}/π_i^{(j)})^{n_i}∏_i(ε_i^{(i_0)}/ε_i^{(j)})^{a_i}` (TdW (12), from
DiophantineApproximationAndTranscendence §4.3 (Siegel identity)), all factors of the first product are
`p_l-adic` units and `ord_{p_l}(λ) = ord_{p_l}(δ_2) + n_lh_l` (TdW (13), Lemmas 2–4); `λ ≠ 0` because `x − yθ^{(i_0)} ≠ 0`. A YuConstantData `(§2.4)` for (`1 + v + r, n(n − 1)(n − 2), p_l`), admissible for
`(δ_1, π^{(k)}/π^{(j)}, ε^{(k)}/ε^{(j)})` in `ℚ(θ^{(i_0)}, θ^{(j)}, θ^{(k)})` with exponent vector `b = (1, n`, a) `≠ 0` and `α^b = 1 + λ ≠ 1`, gives, through §2.5, `n_lh_l + ord(δ_2) < Φ⁺_l·log(n(n−1)(n−2)·max(H, 3))`, hence `N ≤ c_13(log H + c_14)` with explicit rationals `c_13, c_14`.
(b) Archimedean step (TdW §§9–10): with Lemma 6 (A `≤ N[U_{I_0}^{−1}]·|log|ε^{(k)}||` for a suitable
`k), c_15 := 1/N[U_{I_0}^{−1}]` and `0 < c_16 < c_15/(n − 1)`: if `min_i|β^{(i)}| > e^{−c_16A}` then A `< c_18 + c_17N` (Proposition 7), where `c_17, c_18` are formed as in TdW from `c′_17 := Σ_i max(0, max_j log(p_i^{h_i}/|π_i^{(j)}|)), c′′_17 := Σ_i max(0, log house(π_i))` and `c′_18, c′′_18` (with each outer
sum over the prime generators `π_i` and each inner maximum over embeddings); otherwise (Case `3, s ≥ 1`) the real
or complex linear form `Λ_0 := log(1 + λ_0)` built at an index `i_0 ≤ s` with `|β^{(i_0)}| ≤ e^{−c_16A}`
satisfies `0 < |Λ_0| < c_27·e^{−c_16A} (c_27 = 1.39c_21` resp. `1.02c_21`), and a
MatveevConstantData for its nonzero logarithms (terms with zero logarithm deleted, degree
bound `n(n −` 1)(n − 2)) gives through §2.3 `H ≤ c_23 + c_24 log H` (resp. the complex analogue with
`|a_0| ≤ ½(1 + vN + rA)`); for `s = 0` Proposition 9 bounds A directly. (c) Combining (a), (b) and
DiophantineApproximationAndTranscendence §4.3 (unit-equation exponent bound) gives a rational `K_0` with
`H ≤ K_0` and `N ≤ N_0` for every solution in the case (TdW Theorem 10). All constants are exact
rationals computed from the root boxes, the p-adic approximations and §2.1, and every nonvanishing
`(λ ≠ 0, Λ_0 ≠ 0)` is proved from `x − yθ^{(i)} ≠ 0`.

Work under the following conditions. One case of the covering; the theorem is applied to every case
TdW use Yu (Compositio 1990) and Blass–Glass–Manski–Meronk–Steiner; here the imported bounds are Yu
1994 and Matveev 2000 through the exact constants, and the BGMMS threshold restriction does not
arise

For the proof, (a): the factors `π_i^{(k)}/π_i^{(j)} (i ≠ l` and `i = l` by TdW Lemma `3(i)`) and
`ε_i^{(k)}/ε_i^{(j)}` are `p_l-adic` units (Lemma 2: an algebraic integer whose norm is prime to p has
unit conjugates); `ord(π_l^{(i_0)}/π_l^{(j)}) = h_l` (Lemma `3(ii)`) gives (13); Yu's bound for the
first expression of `λ` bounds `ord(λ)`, hence `n_l`. (b): Cases 1 and 2 of TdW §9 bound `|ε^{(k)}|` through
`|β^{(k)}|` and the conjugates of `α` and `π_i`; the product `∏_i(p_i^{h_i}/|π_i^{(k)}|)^{n_i}` is at most
`exp(N·Σ_i max(0, log(p_i^{h_i}/min_j|π_i^{(j)}|)))` and `∏_i|π_i^{(k)}|^{n_i} ≤ exp(N·Σ_i max(0, log house(π_i)))`, which is where the printed `c′_17, c′′_17` must be replaced. Case 3 follows §2.13 with
`π-factors` added: Siegel's identity at `(i_0, j, k), |e^{Λ_0} − 1| <` ½ and the `1.39` resp. `1.02`
factors; `Λ_0 ≠ 0` because `β^{(i_0)} ≠ 0`. (c): `H < c_19 + c_20 log H` (Proposition 8) and its Case 3
analogues; DiophantineApproximationAndTranscendence §4.3 (unit-equation exponent bound) turns each into an explicit bound.

**Checks.**

- For TdW's example (using the Baker–Wüstholz constants of the1993 published correction, `p.242`) the initial bound is `H < c_real < 9.844 × 10^{49}` (TdW 11Ex); the reduction of §2.25 brings it to `n_1 ≤ 19, n_2 ≤ 11, n_3 ≤ 8, n_4 ≤ 6, A ≤ 86` outside six exceptional solutions (TdW 17Ex). The uncorrected1992 Appendix A3 constants do not establish this initial bound: use the1993 Baker–Wüstholz route, or start `at1.511×10^50` with the corrected BGMMS factor and its `H≤4919` bridge (1993 correction, pp. 241–242).

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §8, Theorem 5,
pp. 237–238; [N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §9,
Lemma 6, Cases 1–2 and Proposition 7, pp. 238–241; [N. Tzanakis, B. M. M. de
Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §11, Theorem 10, p. 247; [N. Tzanakis and
B. M. M. de Weger](https://numdam.org/item/CM_1993__89_2_241_0.pdf), pp.241–242, corrected initial
bound and both repaired reduction routes.)

*Needs:* §2.23; §2.5; §2.4; §2.3; §2.2; §0.10; §2.1; DiophantineApproximationAndTranscendence §4.3 (Siegel identity); DiophantineApproximationAndTranscendence §4.3 (unit-equation exponent bound); §0.6.

### 2.25 p-adic and real reduction of the Thue–Mahler exponent bounds

Fix a case of a Thue–Mahler S-unit covering with initial bounds `H ≤ K_0, N ≤ N_0 (§2.24)` and let 𝒮 `⊆ ℤ^{v+r}` be the set of exponent vectors (n, a) of the normalised solutions in that case, with weights
`W ∈ ℕ^{v+r}_{>0}`. (a) p-adic step at `p_l` (TdW §§12–15): let `𝒪_L` be `ℤ_{p_l}` when `θ^{(i_0)}, θ^{(j)}, θ^{(k)} ∈ ℚ_{p_l}` (first special case; the images of K-elements are given by §0.6), or the ring of
integers of the quadratic extension of `ℚ_{p_l}` generated by the two conjugate roots
`θ^{(j)}, θ^{(k)}` of a quadratic local factor (second special case, with an
exact model of `𝒪_L/𝔓^t`), with maximal ideal 𝔓 and ramification `e_L`; for a
PadicDiscreteLogData `(§2.7)` at level t for `γ_0 := δ_1` and the units `γ := (π_i^{(k)}/π_i^{(j)})_i, (ε_i^{(k)}/ε_i^{(j)})_i`, every (n, a) `∈` 𝒮 with `e_L·(n_lh_l + ord_{p_l}(δ_2)) ≥ t` lies in the target coset `Γ_0`, since then `δ_1∏γ^{(n,a)} ≡ 1 (mod 𝔓^t`). An `ED.1`
p-adic reduction datum `(§1.6)` showing that `Γ_0` has no point of weighted height `≤ X` then gives
`n_l < (t/e_L − ord_{p_l}(δ_2))/h_l` for every (n, a) `∈` 𝒮 with `H_W ≤ X` (TdW Lemma 14, Proposition 15).
(b) Real step (TdW §16): with `Λ_0 = ρ_0 + Σn_iλ_{0i} + Σa_iμ_{0i} (+ 2πa_0)` from Case 3 and the
inequality `|Λ_0| < c_27 e^{−c_16A}`, an `ED.1` real reduction datum (`§1.4`, lattice from §1.1 with
the enclosures of §2.1) gives A `≤ A_1` for every (n, a) `∈` 𝒮 in Case 3 with `H_W ≤ X` (Proposition 16);
Cases 1–2 give A `< c_18 + c_17N` directly. (c) Iterating (a) for all l and (b) for all real `i_0` is an
exponent reduction chain `(§2.8)`, possibly with enumeration steps (TdW §17, Fincke–Pohst); its
soundness gives final bounds `n_i ≤ N_i, |a_i| ≤ A_fin` for every (n, a) `∈` 𝒮 outside the finite
exceptional sets.

Work under the following conditions. The p-adic discrete logarithm exists when the `γ^e` generate a
cyclic subgroup of `(𝒪_L/𝔓^t)^×` of p-power order; in the first special case the
standard powers of §2.7 supply such a subgroup `(𝒪_L = ℤ_{p_l})`; in the second special case the `γ` are norm-one elements for the conjugation exchanging
`θ^{(j)}` and `θ^{(k)}` (TdW (33)). The existence of the specified cyclic powered
subgroup is an explicit hypothesis in this case. For higher-degree local factors the same
reduction implication holds only with supplied PadicDiscreteLogData over the extension;
no exchanging involution or cyclicity follows from the factor degree. Only the implication 'large `n_l ⇒` lattice point' of TdW's Lemma 14 is
used

For the proof, Generate the scalar log enclosures mathematically from §2.1 and §2.6, then apply
§0.9. For pivot log valuation s, certify precision at least m+s and strict pivot `precision>s` before
forming normalized ratios modulo `π^m`. Existence of adequate `N` is proved by the positive-slope tail
estimate. A congruence conditions does not assume completeness of the final solution list. (a):
`ord_{p_l}(λ) = ord(δ_2) + n_lh_l` (TdW (13)) and `λ = δ_1∏γ^{(n,a)} − 1`, so `ord_𝔓(δ_1∏γ^{(n,a)} − 1) = e_L·ord_{p_l}(λ) ≥ t`; the datum's soundness gives the coset membership; the `ED.1` datum
excludes the coset from the box. (b): the lattice argument of TdW Proposition 16 is the `ED.1`
inhomogeneous reduction; the precision budget is the error of the integers `[C·λ_{0i}], [C·μ_{0i}], [C·ρ_0]` exact by the logarithm enclosures. (c): §2.8 soundness by induction over the steps.

**Checks.**

- At 7, `X⁴−X−1=(X−3)(X³+3X²+2X+5)` modulo 7, and the cubic has no
  root in `𝔽_7`. Its unramified cubic extension has cyclic Galois group of order three,
  so no involution exchanges two roots. The quadratic special case does not apply.
- For a quadratic factor and nonzero α, conjugation sends `α^(k)/α^(j)` to its inverse,
  giving norm one; the conditional lattice implication still requires the discrete-log datum.
- TdW 15Ex–17Ex: alternating p-adic reductions at `p = 2, 3, 5, 7` and real reductions bring the bounds to `N_i` of size at most a few dozen and A `≤ 86` in every case.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §15, Lemma 14
and Proposition 15, pp. 260–262; [N. Tzanakis, B. M. M. de
Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §16, Proposition 16, p. 265; [N. Tzanakis,
B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §17, pp. 267–271.)

*Needs:* §2.24; §2.7; §2.8; §2.1; §1.6; §1.5; §1.4; §1.1; §2.6; §0.9.

### 2.26 Sieving exponent tuples with auxiliary primes

Fix a case of a Thue–Mahler S-unit covering. Let q be a prime and `𝔮_1, 𝔮_2, 𝔮_3` three distinct
primes of `K` of degree one above q not dividing `f_0·c·∏p_i·disc(θ)` and not dividing `α, π_i, ε_i`; let
`m_i, A_i, P_{ij}, E_{ij} ∈ 𝔽_q` be the residues of `θ, α, π_j, ε_j` modulo `𝔮_i`. Eliminating x and y
from `x − ym_i ≡ ±A_i∏_jP_{ij}^{n_j}∏_jE_{ij}^{a_j} (i = 1, 2, 3)` gives the congruence
`C_1∏_jP_{1j}^{n_j}∏_jE_{1j}^{a_j} + C_2∏_jP_{2j}^{n_j}∏_jE_{2j}^{a_j} ≡ C_3∏_jP_{3j}^{n_j}∏_jE_{3j}^{a_j}` (mod q) with `C_1 := (m_2 − m_3)A_1, C_2 := (m_3 − m_1)A_2, C_3 := (m_2 − m_1)A_3` (TdW (38)). Every exponent tuple (n, a) of a solution in the case satisfies this
congruence for every such q. Hence a tuple violating it for one admissible q is not the tuple of a
solution, and the residual box `{n_i ≤ N_i, |a_i| ≤ A_fin}` can be reduced to the survivors of
finitely many such congruences before the exact test; the congruence depends only on (n, a) modulo
the orders of the residues, so it is evaluated on residue classes.

Work under the following conditions. The sieve is a necessary condition only; survivors are tested
exactly against (11) and `F(X, Y) = c∏p_i^{z_i}` The three primes are of degree one so that the
residues lie in `𝔽_q`

For the proof, Reduce `x − yθ = ±α∏ε^a∏π^n` modulo `𝔮_i` (each element involved is `𝔮_i-integral` and the
`𝔮_i` are distinct of degree one). Siegel's identity in `𝔽_q: (m_2 − m_3)(x − ym_1) + (m_3 − m_1)(x − ym_2) + (m_1 − m_2)(x − ym_3) = 0`, which is the stated congruence after substitution (the common
sign cancels) (DiophantineApproximationAndTranscendence §4.3 (Siegel identity), in every commutative
ring).

**Checks.**

- A tuple failing (38) for one admissible q is eliminated without any exact test; TdW's final box of `(N_1 + 1)⋯(N_v + 1)(2A_0 + 1)^r` tuples per case is reduced by sieving before testing (TdW 18Ex).

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §18, (38), pp.
275–276.)

*Needs:* §2.23; DiophantineApproximationAndTranscendence §4.3 (Siegel identity); Mathlib `ZMod.pow_totient`.

### 2.27 Thue–Mahler solution data

A ThueMahlerData for a Thue–Mahler equation `(g, c, p) (§2.21)` consists of: an S-unit covering
(`§2.23`; its conditions `(U), (C)` are hypotheses of the soundness theorem); root boxes and `p_l-adic`
root approximations of `G (§0.4`, §0.6); for every case: the exact constants and the initial
bounds `K_0, N_0` of §2.24 (with their Yu and Matveev constant data), an exponent reduction
chain with p-adic steps given by discrete-logarithm data and `ED.1` data and real
steps given by `ED.1` data `(§2.25)`, the final bounds `N_i, A_fin`, the exceptional tuples, and a
list of auxiliary primes with their residue data `(§2.26)`; finally the claimed list `L` of solutions.
`ThueMahlerData.Valid` is the conjunction of: every constant inequality, discrete-logarithm
congruence and `ED.1` check; every tuple of the residual box of each case either violates a listed
sieve congruence or is tested exactly: the element `±α∏ε^a∏π^n` is computed in power-basis
coordinates, it is accepted when it equals `x − yθ` with `x, y ∈ ℤ, f_0 ∣ x, gcd(x/f_0, y) = gcd(y, f_0) = 1`, and `(X, Y, z) := (x/f_0, y, (n_ih_i + s′_i + t′_i)_i)` satisfies `F(X, Y) = c∏p_i^{z_i}`; the
exceptional tuples are tested the same way; `L` is exactly the set of accepted triples. All conditions are exact identities and inequalities over the actual integers, rationals and residue rings.

Work under the following conditions. Finite data; a failed check proves nothing. The residual box of
each case is finite: `(N_1 + 1)⋯(N_v + 1)·(2A_fin + 1)^r` tuples

The interface includes these statements.

- ThueMahlerData: The data of the statement with the claimed solutions as a Finset (`ℤ × ℤ ×` (Fin `v →` ℕ)).
- The conjunction of all exact checks.
- The claimed list `L`.
- Valid implies `L ⊆ thueMahlerSolutions g c p`.
- For each case, the finite box of exponent tuples left after the reduction.

For the proof, combine the initial-bound theorem, componentwise reduction and the exact
finite-set membership equivalences. Each retained exponent yields an actual field element;
only integral coordinates satisfying the original equation belong to the resulting finite set.


**Checks.**

- For `g = X³ − 2, c = 1, p = (5)`, a valid datum lists `(3, 1, 2)`, since `F(3, 1) = 25` passes the exact test.
- A datum listing `(3, 1, 1)` is invalid: `F(3, 1) = 25 ≠ 5`.
- A datum whose residual box contains a tuple neither eliminated by a listed congruence nor tested is invalid, even if that tuple is not a solution.
- For `v = 0` the datum has no p-adic steps and reduces to a Thue datum for coprime solutions of `F(X, Y) = c`.
- `solutions_subset` with §2.28 gives equality of the Finset coerced to Set with `thueMahlerSolutions g c p`.
- A valid mathematical record for `x³−2y³=5^z` contains `(3,1,2)`.
- Listing `(3,1,1)` for `x³−2y³=5^z` contradicts mathematical validity.
- A true solution absent from the claimed list contradicts mathematical validity; this does not test an omitted nonsolution row.
- Every listed triple has `F=c` when `v=0`; this does not construct a no-p-adic-step identities.
- The mathematical list equals the actual normalized solution set under field/root hypotheses.
- All residual exponent choices occur in the finite-set definition, including those that fail the equation.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §17, p. 271.)

*Needs:* §2.23; §2.24; §2.25; §2.26; §2.8; §2.7; §0.4; §0.6; §2.6; §0.9.

### 2.28 Exact solution sets of Thue–Mahler equations

Let (g, c, p) be a Thue–Mahler equation and `C` a ThueMahlerData with `C.Valid` whose S-unit
covering satisfies `(U)` and `(C)`. Then `thueMahlerSolutions g c p = C.solutions`. In particular every
normalised solution has, in its case of the covering, exponents in the residual box `n_i ≤ N_i, |a_i| ≤ A_fin` or among the explicitly tested exceptional tuples. In the nonexceptional branch
`z_i ≤ N_ih_i + s′_i + t′_i`. A bound for all solutions takes the maximum of this quantity and the
listed exceptional `z_i` (with maximum 0 for an empty exception set). There are no solutions
outside this finite union. Yu's and Matveev's bounds enter only through §2.5 and §2.3 with
constants computed in the datum.

Work under the following conditions. Thue–Mahler hypotheses (`n ≥ 3`, irreducible `g, c ≠ 0, gcd(c, ∏p_i) = 1); C.Valid; (U), (C)`. As in §2.20, validity is the hypothesis of the general theorem; in the application §6.39 it is proved by exact computation and the solution-set theorem is unconditional.

The interface includes these statements.

- The existing mathematical validity predicate, with the actual equation and stated field/root hypotheses, implies equality with the solution set. It is a supporting conditional theorem, not conditions soundness.

For the proof, derive the covering and initial exponent bounds from the identified arithmetic input,
then apply each proved reduction implication and the finite-set membership equivalence. `⊇`: every listed triple passed the
exact test. `⊆`: a solution has a case and exponents (n, a) by `(C)`; §2.24 gives `H ≤ K_0`; §2.25 puts
(n, a) in the residual box or in an exceptional set; by §2.26 it is not eliminated by any listed
congruence, so it was tested exactly and accepted, hence it is in `C.solutions`.


**Checks.**

- A theorem row proves that every solution lies in the enumerated box: `thueMahlerSolutions g c p` equals the listed set and its exponent tuples lie in the residual boxes.
- Small instance: for `g = X³ − 2, c = 1, p = (5)` a valid datum's list contains `(1, 0, 0), (−1, −1, 0)` and `(3, 1, 2)`; complete worked data are Layer 6 targets.
- The p-adic source (Yu, Compositio Math. 91 (1994)) and the archimedean source (Matveev 2000) are registered separately from Tzanakis–de Weger 1992.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §17, p. 269;
[Kunrui Yu](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf), §0.1, p. 242.)

*Needs:* §2.27; §2.24; §2.25; §2.26; §2.5; §2.3; DiophantineApproximationAndTranscendence §4.5 (effective Thue–Mahler finiteness).

### 2.29 The S-unit equation `x + y = 1` over `ℚ` and its solution set

For a finite set `S` of primes let `U_S` be the group of rational S-units
(DiophantineApproximationAndTranscendence §4.1 `(sUnits_rat_mulEquiv): x ∈ ℚ^×` with `padicValRat q x = 0` for every prime `q ∉ S`). The S-unit equation is `x + y = 1` with `x, y ∈ U_S`, and `sUnitSolutions S := {(x, y) ∈ ℚ × ℚ : x ∈ U_S, y ∈ U_S, x + y = 1}`. The exponent height of a solution is `m(x, y) := max_{p∈S} max(|padicValRat p x|, |padicValRat p y|`). Equivalent normalisations: `(x, y) ↦ (u, v, w)`
with `u + v = w`, pairwise coprime integers composed of primes of `S, w > 0`
(DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction)) — de Weger's
equation `x + y = z` in S-integers with gcd 1 (Chapter `6, (6.1)`) is the subset with `u, v > 0`; the six
maps `(x, y) ↦ (y, x), (1/x, −y/x), (−x/y, 1/y)` and their composites permute `sUnitSolutions S` and
preserve m. Scoped exponential equations are instances: for a, `b, c ∈ U_S` the solutions of ax′ + by′
`= c` with `x′, y′ ∈ U_S` correspond to the solutions (ax′/c, by′/c), and equations such as `2^α + 3^β = 5^γ` are the subsets of de Weger's triples with prescribed prime supports.

Work under the following conditions. `S` finite, consisting of primes x, y range over `U_S`, signs
included

The interface includes these statements.

- `sUnitSolutions S` : Set `(ℚ × ℚ)` as in the statement.
- `(x, y) ∈ sUnitSolutions S ↔ x ≠ 0 ∧ y ≠ 0 ∧` (∀ `q, q.Prime → q ∉ S → padicValRat q x = 0 ∧ padicValRat q y = 0) ∧ x + y = 1`.
- `(x, y) ∈ sUnitSolutions S → (y, x) ∈ sUnitSolutions S`, and similarly for `(1/x, −y/x)`.
- `m(x, y) = max` over `p ∈ S` of `|padicValRat p x|` and `|padicValRat p y|`.
- `sUnitSolutions S` is finite (DiophantineApproximationAndTranscendence §4.5 (effective S-unit finiteness)).

For the proof, `U_S` is a subgroup of `ℚ^×` (DiophantineApproximationAndTranscendence §4.1 `(sUnits_rat_mulEquiv)`); the six maps send solutions to
solutions because `1 − x = y, 1/x + (−y/x) = 1` and `(−x/y) + 1/y = 1`. The coprime normal form is
DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction); `padicValRat` of `x =` u/w and `y =` v/w are read off from u, v,
w, each prime of `S` dividing at most one of them.

**Checks.**

- For `S = {2, 3}: (3, −2), (−2, 3), (1/2, 1/2), (2, −1), (4/3, −1/3)` and `(−1/3, 4/3)` are in `sUnitSolutions S (3 − 2 = 1, 1/2 + 1/2 = 1, 2 − 1 = 1, 4/3 − 1/3 = 1`).
- `sUnitSolutions ∅ = ∅: x, y ∈ {±1}` and `x + y ∈ {0, ±2}`.
- `(5, −4)` is not in `sUnitSolutions {2, 3}` since `padicValRat 5 5 = 1 ≠ 0`, although `5 − 4 = 1`.
- For `S = {2, 3}` the solution `(9/8, −1/8)` corresponds under DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction) to `(u, v, w) = (9, −1, 8)`.
- `(1/2, 1/2), (2, −1), (−1, 2) ∈ sUnitSolutions {2}`, and these are all of its elements.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.1, (6.1), p. 115; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.1, p. 115.)

*Needs:* DiophantineApproximationAndTranscendence §4.1 `(sUnits_rat_mulEquiv)`; DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction); DiophantineApproximationAndTranscendence §4.5 (effective S-unit finiteness); Mathlib `padicValRat`.

In the positive integral formulation, every prime divisor of each entry of
`(u,v,w)` lies in `S`, with `u+v=w`, `gcd(u,v)=1` and `u≤v`.
The integer 1 is supported on every `S`; positivity excludes 0.
The rational solution set above retains its signed sixfold symmetry.

**Checks for the positive integral formulation.**

- Every prime divisor of 12 lies in `{2,3}`, whereas 5 has a prime divisor outside that set.
- The integer 1 has no prime divisors. For every finite `S`, the integer 0 has a prime divisor outside `S`; positivity excludes it from a solution triple.
- The triple `(1,2,3)` is a positive coprime ordered triple supported on `{2,3}`; `(2,2,4)` fails coprimality.
- `(2,1,3)` fails the ordering condition, and `(0,1,1)` fails positivity even though the additive equation holds.
- `sUnitExponentHeight ∅ (x,y)=0`; for `S={2,3}`, the solutions (3,-2), `(1/2,1/2)` and (9/8,-1/8) have heights 1, 1 and 3 respectively. In the last case the 2-adic valuations are -3 and -3 and the 3-adic valuations are 2 and 0.

### 2.30 Initial exponent bound for the S-unit equation from exact Yu constants

Let `S` be a finite set of primes with `|S| ≥ 2`. For each `p ∈ S` let `Φ⁺_p` be the value of a
YuConstantData `(§2.4)` for `n = |S|, d = 1`, admissible for the rationals (`−1, (q)_{q∈S∖{p}}) (h_{−1} ≥ log p ≥ π/10` and `h_q ≥ max(log q, log p)` suffice), and `ℓ⁺_p ≥ Real.log p`. Put `C_p := (11/10)·Φ⁺_p·ℓ⁺_p, C := max_{p∈S} C_p` and let `X_0` be a rational with `X_0 ≥ max(1, (2C/λ⁻)·L⁺)` where
`0 < λ⁻ ≤ Real.log 2` and `L⁺ ≥ Real.log(2C/λ⁻)`. Then every `(x, y) ∈ sUnitSolutions S` satisfies
`|padicValRat p x|, |padicValRat p y| ≤ X_0` for all p. For `|S| ≤ 1` every solution has all
`|padicValRat p x|, |padicValRat p y| ≤ 1`.

Work under the following conditions. `S` consists of primes; `|S| ≥ 2` for the Yu step (Yu's statement
needs at least two numbers; the sign −1 is one of them) The sign −1 is included in the family, as
DiophantineApproximationAndTranscendence §4.5 (S-unit exponent bound) requires

For the proof, For `p ∈ S, ε ∈ {±1}` and `b ∈ ℤ^{S∖{p}}` with `ε∏q^{b_q} ≠ 1`: §2.5 (with exponent vector
`(b_{−1}, b), b_{−1} ∈ {0, 1}, B ≤ max(max|b_q|, 3)`) gives `padicValRat p (ε∏q^{b_q} − 1) < Φ⁺_p·log max(B, 3)`; since `log max(B, 3) ≤ (11/10)(1 + log max(1, B)), |ε∏q^{b_q} − 1|_p ≥ (e·max(1, max|b_q|))^{−C_p}`. This is the hypothesis of DiophantineApproximationAndTranscendence §4.5 (S-unit exponent bound) with the constant
`C`, which gives `|v_p(x)|, |v_p(y)| ≤ max(1, (2C/log 2)·log(2C/log 2)) ≤ X_0`. `|S| ≤ 1`: in the coprime
form `u + v = w` at most one of u, v, w is divisible by the prime of `S`, the other two are `±1`, so the
third lies in `{0, ±2}`; hence `S = {2}` and every exponent is at most 1 in absolute value.

**Checks.**

- For `S = {2, 3, 5, 7}`: four data (one per `p, n = 4, d = 1`) give `X_0 ≈ 9.8·10^{24} (Yu` constants with `h_{−1} = log p, h_q = max(log q, log p)`; the largest `C_p` is at `p = 2, C_2 ≈ 6.4·10^{22}); de` Weger's bound for `{2, 3, 5, 7, 11, 13}` with older constants is `C_8 < 5.60·10^{27} (p`. 118).

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.2, p. 116; [Kunrui
Yu](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf), §0.1, p. 242.)

*Needs:* §2.29; §2.5; §2.4; DiophantineApproximationAndTranscendence §4.5 (S-unit exponent bound); DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction); §2.1.

### 2.31 p-adic reduction for the S-unit equation

Let `S` be a finite set of primes, `p ∈ S, M ≥ 1`, and let ℓ be a PadicDiscreteLogData `(§2.7)` at
level `t = M + 1 (p` odd: `g = 1 + p, e = p − 1; p = 2: g = 5, e = 2, t = M + 2`) for the rationals
`(q)_{q∈S∖{p}}` with `γ_0 := 1`, and `Γ := {b ∈ ℤ^{S∖{p}} : Σ_q b_qℓ_q ≡ 0 (mod p^M)}` its lattice. Let
`(x, y) ∈ sUnitSolutions S` with coprime form `u + v = w` (DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction)) and
suppose `p ∤ uv`. Then `b := (padicValRat q u − padicValRat q v)_{q∈S∖{p}}` satisfies: if `padicValRat p w ≥ t` then `b ∈ Γ`. Consequently, if an `ED.1` datum `(§1.6)` shows that `Γ` contains no nonzero
vector with `max_q|b_q| ≤ 2X` (or an `ED.1` enumeration lists them all, §1.8), then every solution with
exponent height `m(x, y) ≤ X` and `p ∤ uv` has `padicValRat p w ≤ t − 1`, or `b = 0` (then `(u, v, w) = (1, 1, 2)`), or b is a listed vector. The same holds with per-prime bounds: if `|padicValRat q x|`,
`|padicValRat q y| ≤ X_q` for all `q ∈ S` and the `ED.1` datum excludes (or the enumeration lists)
the nonzero vectors of `Γ` with `|b_q| ≤ X_q` for all `q ∈ S ∖ {p}` (de Weger's box of radius `√(Σ_i f(p_i)²), p`. 125), the same conclusion holds for these solutions. By the symmetries of §2.29 the
same bound holds for the unique one of u, v, w divisible by p, so `f(p) := t − 1` bounds `padicValRat p`
(uvw) for all solutions of height `≤ X` outside the images under the six symmetries of the solutions
whose vector b is listed; iterating over `p ∈ S` is an exponent reduction chain `(§2.8)`.

Work under the following conditions. The rationals `q ∈ S ∖ {p}` are p-adic units, so the discrete
logarithms exist `|b_q| ≤ X`, since `b_q = v_q(u) − v_q(v)` with `0 ≤ v_q(u), v_q(v) ≤ X` and at most one
of them nonzero; the box radius 2X of the statement is a safe over-estimate

For the proof, Generate the scalar log enclosures mathematically from §2.1 and §2.6, then apply
§0.9. For pivot log valuation s, certify precision at least m+s and strict pivot `precision>s` before
forming normalized ratios modulo `π^m`. Existence of adequate `N` is proved by the positive-slope tail
estimate. A congruence conditions does not assume completeness of the final solution list. −u/v `− 1 =` −w/v, so `padicValRat p (−u/v − 1) = padicValRat p w ≥ t (p ∤ v), i.e`. −u/v `≡ 1 (mod p^t`); and −u/v
`= ±∏_q q^{b_q}`. The datum's soundness (the sign is absorbed since e is even) gives `b ∈ Γ`. If `b = 0` then u/v `= ±1` with `gcd(u, v) = 1`, so `u, v ∈ {±1}`; since `w = u + v > 0, (u, v, w) = (1, 1, 2)` and
`padicValRat p w ≤ 1 ≤ t − 1`. The `ED.1` datum excludes nonzero points of `Γ` in the box;
enumerated points are listed and tested exactly (de Weger §6.5).

**Checks.**

- For `S = {2, 3, 5, 7}` and `p = 7, M = 2 (t = 3, g = 8, e = 6)`: the solution `(u, v, w) = (1, 48, 49)` has `padicValRat 7 w = 2 < 3` and is not forced into `Γ`, while every solution with `7³ ∣ w` gives `b ∈ Γ`.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.3, (6.5)–(6.6), p. 119; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.5, p. 124.)

*Needs:* §2.29; §2.7; §2.8; DiophantineApproximationAndTranscendence §4.5 (coprime S-unit reduction); §1.6; §1.8; §1.5; §2.6; §0.9.

### 2.32 S-unit solution data

An SUnitData for a finite set `S` of primes consists of: for each `p ∈ S` a YuConstantData
and the initial bound `X_0` of §2.30 (or the bound 1 when `|S| ≤ 1`); per-prime bounds `f_0(p) := X_0` and
an exponent reduction chain `(§2.8)` whose steps are p-adic reductions of §2.31 (a prime p, a level `M`,
a PadicDiscreteLogData and an `ED.1` lattice datum or complete enumeration, lowering `f(p)`
to `t − 1 (= M` for odd `p, M + 1` for `p = 2`, where `t = M + 2`) given the pinned bounds `f(q)` for all q),
ending with bounds `f(p)` for all `p ∈ S` and a finite list `E` of exceptional solutions found by
enumeration; and the claimed list `L ⊆ ℚ × ℚ`. `SUnitData.Valid` is the conjunction of: every
datum check; `L` equals the set of pairs `(x, 1 − x)` with `x = ±∏_{p∈S}p^{a_p}, |a_p| ≤ f(p)`, such
that `1 − x ∈ U_S` (exact factorisation over `S` of the numerator and denominator of 1 − x), together
with the members of `E` that pass the same test. The residual box has `2∏_{p∈S}(2f(p) + 1)` elements and
is enumerated exhaustively.

Work under the following conditions. Finite bounds and exact equation identities are supplied. The bounds `f(p)` apply to
`|padicValRat p x|` and `|padicValRat p y|` for every solution outside `E`

The interface includes these statements.

- SUnitData: The data of the statement with the claimed solutions as a Finset `(ℚ × ℚ)`.
- The conjunction of all exact checks.
- The claimed list `L`.
- The final per-prime bounds f : `S →` ℕ.
- Valid implies `L ⊆ sUnitSolutions S`.

For the proof, combine the initial-bound theorem, componentwise reduction and the exact
finite-set membership equivalences. Each retained exponent yields an actual field element;
only integral coordinates satisfying the original equation belong to the resulting finite set.


**Checks.**

- For `S = {2} (|S| = 1, f(2) = 1`) the residual box is `{±1/2, ±1, ±2}` and the valid list is `{(2, −1), (−1, 2), (1/2, 1/2)}`.
- For `S = ∅` the box is `{±1}` and the valid list is empty.
- For `S = {2, 3}`, final bounds `f(2) = 3, f(3) = 1` are not the end of any valid chain whose exceptional list `E` omits `(9/8, −1/8): (9/8, −1/8) ∈ sUnitSolutions S` has `padicValRat 3 (9/8) = 2 > 1`, so a step lowering `f(3)` to 1 without listing it contradicts soundness (at `p = 3, M = 1` the lattice is `3ℤ` and the vector `b = ±3` of this solution is enumerated); a notion of validity that did not check the chain steps would accept a list missing `(9/8, −1/8)`.
- `solutions_subset` with §2.33 gives equality with `sUnitSolutions S`, a finite set in agreement with DiophantineApproximationAndTranscendence §4.5 (effective S-unit finiteness).
- Existence of a mathematical datum for `S={2}` with `f(2)=1` and the three listed pairs; no evaluation is asserted.
- A valid mathematical datum for `S=∅` lists no pairs.
- A mathematical final `f(3)=1` for `S={2,3}` requires `(9/8,−1/8)` among exceptions.
-  equality yields finiteness of `sUnitSolutions S`.
- For `S = {2}` the datum with `f(2) = 1` and list `{(2, −1), (−1, 2), (1/2, 1/2)}` is valid.

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.5, p. 125; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), Chapter 6, §6.5, pp. 124–125.)

*Needs:* §2.29; §2.30; §2.31; §2.8; §2.7; §2.6; §0.9.

### 2.33 Exact solution sets of S-unit equations over `ℚ`

Let `S` be a finite set of primes and `C` an SUnitData for `S` with `C.Valid`. Then `sUnitSolutions S = C.solutions`. In particular every solution `(x, y)` satisfies `|padicValRat p x|, |padicValRat p y| ≤ f(p)` for all `p ∈ S` or lies in the exceptional list: no solution lies outside the enumerated box.
Consequently, for a, `b, c ∈ U_S`, the solutions `(x′, y′) ∈ U_S²` of ax′ + by′ `= c` are exactly the
pairs (cx/a, cy/b) with `(x, y) ∈ C.solutions`, and the solutions of exponential equations `±p_1^{α_1}⋯ ± q_1^{β_1}⋯ = r_1^{γ_1}⋯` in primes of `S` are read off from `C.solutions`. Yu's bound enters only
through §2.5 with constants computed in the datum.

Work under the following conditions. `S` consists of primes; `C.Valid`. As in §2.20, validity is the hypothesis of the general theorem; in the application §6.38 it is proved by exact computation and the count theorem is unconditional.
The interface includes these statements.

- The existing mathematical validity predicate, with the actual equation and stated field/root hypotheses, implies equality with the solution set. It is a supporting conditional theorem, not conditions soundness.

For the proof, derive the covering and initial exponent bounds from the identified arithmetic input,
then apply each proved reduction implication and the finite-set membership equivalence. `⊇`: every listed pair passed the exact
membership test. `⊆`: by §2.30 every solution has height `≤ X_0`; by soundness of the reduction chain
(`§2.31`, §2.8) every solution outside `E` satisfies the final bounds `f(p)`, so `x = ±∏p^{a_p}` with `|a_p| ≤ f(p)` lies in the enumerated box and passed the test. The scoped exponential equations are the
image of `sUnitSolutions S` under `(x, y) ↦` (cx/a, cy/b), a bijection onto the solutions of ax′ + by′ `= c`.


**Checks.**

- A theorem row proves that every solution lies in the enumerated box: `sUnitSolutions S` equals the listed set, and every solution has `|padicValRat p x| ≤ f(p)` for all `p ∈ S` or lies in the exceptional list `E`.
- Small instance: for `S = {2, 3}` a valid datum's list consists of the solutions generated by `1 + 1 = 2, 1 + 2 = 3, 1 + 3 = 4, 1 + 8 = 9` under the six symmetries (these four coprime triples a `+ b = c`, a `≤ b`, are all of them).

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Chapter 6, Theorem 6.3, p. 123; [de Weger
(1989)](https://ir.cwi.nl/pub/13190), Chapter 7, proof of Lemma 7.3, p. 138.)

*Needs:* §2.32; §2.30; §2.31; §2.8; §2.5; DiophantineApproximationAndTranscendence §4.5 (effective S-unit finiteness).

### Examples

For `x=2` the `N=1` rational logarithm interval is [23/36,25/36]. For the 3-adic logarithm of 4 the `N=4`
partial sum is -51/4. The complete quartic, S-unit and Thue–Mahler applications appear in
§§6.36–6.39, under their explicit arithmetic and reduction-inequality hypotheses.

### Dependencies

Layers 0–1; DiophantineApproximationAndTranscendence §§3.6–3.7 and `4.1–4.5`; ColemanIntegration §§L0.10–L0.18 for the chosen
logarithm compatibility; native Dirichlet unit and S-unit groups. Complete class/unit/ideal data are
explicit inputs.

## Layer 3: Descent, heights and Mordell–Weil data

Certify finite local images and relate them to the existing global descent. Combine exact points,
rank upper bounds, height intervals and saturation to justify the subgroup used by integration and
sieving.

### 3.1 Size of `E(ℚ_v)/2E(ℚ_v)` at a finite or real place

Let p be a prime and `W` an elliptic Weierstrass curve over `ℚ_p`. Then `2E(ℚ_p)` has finite index in
`E(ℚ_p)` and [`E(ℚ_p) : 2E(ℚ_p)] = #E(ℚ_p)[2] · |2|_p^{-1}`, with `|·|_p` normalised by `|p|_p = p^{-1}`;
that is, the index equals `#E(ℚ_p)[2]` for odd p and `2·#E(ℚ_p)[2]` for `p = 2`. For an elliptic
Weierstrass curve `W` over `ℝ, 2·[E(ℝ) : 2E(ℝ)] = #E(ℝ)[2`]. In the normal form `y² = f(x)`, `#E(K)[2] = 1 +` #`{x ∈ K : f(x) = 0}` for `K = ℚ_p` or `ℝ`. Because ker `μ_K = 2E(K)` (Tau Ceti `ker_μ_eq` over the field
`K`), the same numbers are the orders of the local descent images `μ_K(E(K))`.

Work under the following conditions. `W` : WeierstrassCurve `K` with `W.IsElliptic, K = ℚ_p (p` prime) or
`K = ℝ`; for the descent-image reading also `W.IsCharNeTwoNF`. Index means `AddSubgroup.index` of the
range of `nsmulAddMonoidHom 2` on `W.toAffine.Point`; `#E(K)[2]` means `Nat.card` of its kernel.

The interface includes these statements.

- For p prime and the actual `W:WeierstrassCurve.Affine Q_p` in elliptic `characteristic-≠2` normal form, `#range(W.μ)=(if p=2` then 2 else `1)·#ker([2]:W.Point→W.Point`), using the pinned `W.A, W.M` and corrected `W.μ`.
- For the actual elliptic `W` over `R` in `characteristic-≠2` normal form, `2·#range(W.μ)=#ker([2]:W.Point→W.Point)`.

For the proof, apply HeightsRationalPointsAndObstructions §1.17 in dimension one, with
`K=ℚ_p` and its normalized absolute value, or with `K=ℝ`. The first isomorphism theorem and
Tau Ceti `ker_μ_eq` identify the descent image with the quotient by doubling. For the normal
form, Tau Ceti `card_ker_nsmul_two` identifies the kernel size with one plus the number of
roots of f. The local quotient theorem supplies finiteness as well as the cardinality.

**Checks.**

- `y² = x³ − x` over `ℚ_3`: f has the three roots `0, ±1` in `ℚ_3`, so [`E(ℚ_3) : 2E(ℚ_3)] = 4`.
- `y² = x³ − x` over `ℚ_2: #E(ℚ_2)[2] = 4`, so [`E(ℚ_2) : 2E(ℚ_2)] = 8`.
- `y² = x³ + 1` over `ℝ`: one real root, `[E(ℝ):2E(ℝ)] = 1; y² = x³ − x` over `ℝ: [E(ℝ):2E(ℝ)] = 2`.

([Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §7, proof of Lemma 3, p. 16
(arXiv v1); [Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.3,
p. 69.)

*Needs:* HeightsRationalPointsAndObstructions §§1.15a–1.17; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`; Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `Subgroup.index`; Tau Ceti `WeierstrassCurve.formalPointHomAdicCompletion`; Tau Ceti `WeierstrassCurve.range_formalPointHomAdicCompletion`.

### 3.2 Exact local image of the 2-descent map

Conditional on the explicit arithmetic-input hypotheses listed below, fix `W` as in the hypotheses and
a place v of `ℚ`, with `K_v = ℚ_p (v = p)` or `ℝ (v = ∞)`, and write `M_v` for the square classes `(W⁄K_v).M`
of the local étale algebra `A_v = K_v[X]/(f)`. A exact local image at v (LocalImageData `W v`)
consists of: (i) a factorisation `f = ∏_j f_j` into monic irreducibles over `K_v` — linear factors
pinned by Hensel data (`ED.0` p-adic embedding data), the others exact irreducible by the
Newton-polygon criterion (explicit supplied class/unit/factorization data Ore residual
irreducibility, with the prime-ideal factorisation of p in the global factor fields), real roots
isolated at `∞ (ED.0` archimedean data) — so that `A_v ≅ ∏_j L_j` with `L_j = K_v[X]/(f_j)`; (ii)
square-class coordinates: an explicit group isomorphism `κ_v : M_v ≅ (ℤ/2)^{n_v}` built from the
valuation parity and finitely many residual quadratic characters on each `L_j^×/L_j^{×2}` (for odd p:
the valuation mod 2 and the Legendre character of the unit part; for `p = 2` the unit part in
`O_{L_j}^×/(O_{L_j}^×)²`, computed using the complete finite unit quotient modulo `π_j^(2e_j+1)`, where
`e_j=ord_{π_j}(2)`; for `ℝ` the signs at the real factors); (iii) finitely many `x₁,…,x_k ∈ ℚ` with `f(x_i)`
a nonzero square in `K_v`, checked by exact rational arithmetic (for odd p: `v_p(f(x_i))` even and the
unit part a square mod p; for `p = 2`: even valuation and unit part `≡ 1` mod 8; for `ℝ: f(x_i) > 0`), so
that each `x_i` is the x-coordinate of some `P_i ∈ E(K_v)`; (iv) the coordinate vectors `c_i = κ_v(class`
of `x_i − T) ∈ (ℤ/2)^{n_v}`, computed exactly from `x_i`. The result is the subgroup `H_v = κ_v^{-1}(span_{𝔽₂}{c_1,…,c_k})` of `M_v`. The datum is complete when `#H_v` equals the number of
local-quotient-cardinality, that is `|2|_v^{-1}·#E(K_v)[2]` at a finite place and `#E(ℝ)[2]/2` at `∞`.

Work under the following conditions. `W` : WeierstrassCurve `ℚ` with `W.IsElliptic, W.IsCharNeTwoNF` and
`a₂, a₄, a₆ ∈ ℤ`; v a prime of `ℤ` or the real place. `μ_v(P_i)` is the class of `x_i − T` because `f(x_i) ≠ 0` (Tau Ceti `μX_of_eval_f_ne_zero`); the y-coordinate of `P_i` is never needed. The finite local algebra
decomposition, irreducible factors, e/f data and coefficient embedding/valuation comparisons are
supplied with exact factorization/isomorphism proofs. No Ore-factorization routine or table is a
target.

The interface includes these statements.

- The subgroup `H_v ≤ M_v` generated by the classes of `x_i − T`.
- The exact isomorphism `κ_v : M_v ≅ (ℤ/2)^{n_v}`.
- `H_v ≤ μ_v(E(K_v))` for every datum, complete or not.
- If `#H_v = #(μ_v(E(K_v)))` then `H_v = μ_v(E(K_v))`; see local-image-completeness.
- `#H_v = 2^{rank_{𝔽₂}(c_1,…,c_k)}`.
- For complete data, Tau Ceti's `W.localCondition K_v` equals the preimage of `H_v` under `W.localRes K_v`.
- For the genuine affine curve `W` over `Q_p` in characteristic-ne-two normal form, use `W.μ` and `W.M` imported from Tau Ceti. Given the local square-class coordinate isomorphism and actual `W.Point` list, bundle their images.
- The bundled span equals closure of `W.μ` applied to the actual listed local points; its local condition is comap along Tau Ceti `W.localRes`.

For the proof, Store the factorisation, the coordinate map `κ_v` and the rational abscissae; check
(iii) exactly on the rational number `f(x_i)`. Compute `c_i` from the valuations and residues of `x_i − θ_j` in the factors `L_j (θ_j` a root of `f_j): ord_{π_j}(x_i−θ_j)=v_p(f_j(x_i))/f_j^{res}`, where
`f_j^{res}` is the residue degree. Use the supplied norm/valuation comparison for this identity. For
odd p the unit square character is read in the residue field. For `p=2` use the complete unit quotient
modulo `π_j^(2e_j+1)`: an element of `1+π_j^(2e_j+1)O_{L_j}` is a square by Hensel. The simple
congruence `u≡1` mod8 is used only for `Q_2`, not for a general dyadic extension. `H_v ≤ μ_v(E(K_v))`
because each class is `μ_v` of an actual point; points with `x ∈ ℚ` suffice for completeness because `μ_v`
is locally constant on `E(K_v) ∖ E[2]` and such points are dense, so complete data exists for
every v.

For `W=y²=x³−x` over `R` or `Q_p`, derive the decomposition of `W.A`, valuation parity and residue-unit square coordinates, construct `W.M≃(Z/2)^n`, lift each exact rational abscissa to a `W.Point` using real sign or p-adic Hensel data, evaluate actual `W.μ`, and prove the expected image cardinality using `W.μ` kernel and local quotient count. The abstract tests with hidx/hcard are only cardinality algebra.

**Checks.**

- For `y² = x³ − x` at `∞` with `x₁ = −1/2, x₂ = 2, #H_∞ = 2` and `H_∞ = μ_ℝ(E(ℝ))`.
- With `k = 0` points, `H_v =` ⊥ (the trivial subgroup); it is complete only when `|2|_v^{-1}#E(K_v)[2] = 1, e.g`. at `∞` for `y² = x³ + 1`.
- For `y² = x³ − x` at `p = 5` (good, odd), a complete `H_5` equals the unramified classes of norm a square, of order `#E(ℚ_5)[2] = 4`.
- In the unramified quadratic extension of `Q_2`, a nontrivial cube root `ζ` of 1 is the square of `ζ²`, but `ζ` is not 1 modulo 8. A criterion requiring `u≡1` mod8 in every factor would reject this genuine square.
- For `y² = x³ − x` at `p = 2` the single abscissa `x = 1/4 (f(1/4) =` −15/64, of even 2-adic valuation with `−15 ≡ 1` mod 8, so a nonzero square in `ℚ_2`) gives `#H_2 ≤ 2 < 8 = [E(ℚ_2):2E(ℚ_2)]`, so the datum is not complete and does not determine the local condition.
- At `∞` for `y² = x³ − x` the abscissae `x =` −1/2 and `x = 2` give the coordinate vectors `(+,−,−)` and `(+,+,+); H_∞` has 2 elements, the number required, so the datum is complete.
- At `p = 3` for `y² = x³ − x (f = X(X−1)(X+1), A_3 ≅ ℚ_3³, n_3 = 6)` the datum is complete exactly when its vectors span a subgroup of order 4.

([Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §5, diagram (6) and the
sentence after it, p. 12 (arXiv v1); [Flynn–Poonen–Schaefer (arXiv
v1)](https://arxiv.org/abs/math/9508211), §7, Lemma 4 and proof, p. 17 (arXiv v1).)

*Needs:* §0.6; §0.4; §0.8; Tau Ceti `WeierstrassCurve.Affine.localRes`; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`; Tau Ceti `WeierstrassCurve.Affine.M`; §0.2.

### 3.3 The size check completes a local image

Let `C` be an exact local image for `W` at a place v (local-descent-image). Then `H_v ≤ μ_v(E(K_v))`,
and if `#H_v = |2|_v^{-1}·#E(K_v)[2]` for v finite, respectively `#H_v = #E(ℝ)[2]/2` for `v = ∞`, then `H_v = μ_v(E(K_v))`; consequently Tau Ceti's local condition `W.localCondition K_v` equals `{m ∈ M :`
`localRes_v(m) ∈ H_v}`. If `#H_v` is smaller, `H_v ≠ μ_v(E(K_v))`: the size check is necessary and
sufficient. `#E(K_v)[2] = 1 +` #`{roots of f in K_v}` is read off the exact factorisation in `C`.

Work under the following conditions. `C` : LocalImageData `W v` for `W` over `ℚ` as in
local-descent-image.

For the proof, Each generator of `H_v` is `μ_v` of an actual point, so `H_v ≤` range `μ_v`. ker `μ_v = 2E(K_v)` (Tau Ceti `ker_μ_eq` over `K_v`), hence #range `μ_v = [E(K_v):2E(K_v)]`, which is the stated
number by local-quotient-cardinality. A subgroup of a finite group of the same order is the whole
group `(Subgroup.eq_of_le_of_card_ge)`. Tau Ceti `mem_localCondition_iff: m ∈ W.localCondition K_v ↔ localRes(m) ∈` range `μ_v`; substitute `H_v`.

**Checks.**

- For `y² = x³ − x` at `p = 3`, four classes exact from rational abscissae give the full local image.
- Flynn–Poonen–Schaefer Table 4 and Lemma 4 (genus two): `#J(ℚ_2)/ker(x − T) = 2` is generated by one point, the analogue of the check.

([Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §7, proof of Lemma 4, p. 17
(arXiv v1); [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §7, proof of
Lemma 3, p. 16 (arXiv v1).)

*Needs:* §3.2; §3.1; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; Tau Ceti `WeierstrassCurve.Affine.mem_localCondition_iff`; Mathlib `Subgroup.eq_of_le_of_card_ge`.

### 3.4 Local images at good odd places are the unramified classes

For p prime, `p≠2` and an actual `W:WeierstrassCurve.Affine ℚ_p` with IsElliptic and IsCharNeTwoNF,
assume `W.badPrimes ℤ_p=∅ (2` and `Δ` are units and the coefficients are integral). Then `W.μ.range = W.selmerGroupA ℤ_p` ⊓ `W.normM.ker` as subgroups of the actual unit square-class group `W.M` of
`W.A=ℚ_p[X]/(W.f)`. Here `selmerGroupA` is the pinned factorwise even-valuation subgroup over the
integral closures of `ℤ_p` in the factors of `W.f`; at odd p these are the unramified square classes.
For a global normal-form curve over `ℚ` and a set `S` containing its bad primes, base-change
compatibility implies that the local conditions outside `S` are automatic on `A(S,2)∩ker N`.

Work under the following conditions. p prime and `p≠2; W:WeierstrassCurve.Affine ℚ_p; W.IsElliptic`
and `W.IsCharNeTwoNF`; DecidableEq `ℚ_p` for the pinned point/descent API. `W.badPrimes ℤ_p=∅`, using the
standard `ℤ_p` algebra and fraction-field structures. No asserted image size, unramified size or
arbitrary candidate subgroup is a hypothesis. For the global consequence only: integral normal-form
global model, `S` containing `badPrimes`, and the pinned restriction/norm compatibility.

For the proof, Inclusion `⊆`: Tau Ceti `range_μ_le_selmerGroupA` applied to `W` over `ℚ_p` with `R = ℤ_p`
(whose bad primes are empty) and `range_μ_le_ker_normM`. Count: f has distinct roots mod p, so each
`L_j` is unramified over `ℚ_p`; the unramified classes of `L_j^×/L_j^{×2}` are the unit classes, two per
factor, and the norm map on unit classes is onto `ℤ_p^×/ℤ_p^{×2}`, so the unramified norm-square
classes number `2^{(#factors) − 1} = 1 +` #`{roots of f in ℚ_p} = #E(ℚ_p)[2]`.
local-quotient-cardinality gives `#μ_p(E(ℚ_p)) = #E(ℚ_p)[2]` for odd p, so the inclusion is an
equality. Global consequence: Tau Ceti `localRes_mem_selmerGroupA` sends `A(S,2)` into the local
unramified classes at every good p, and the global norm condition implies the local one.

**Checks.**

- For `y² = x³ − x` and `p = 5`: the local condition at 5 is implied by `A(S,2) ∩` ker `N` with `S = {2}`.
- Cremona Ch. III p. 80: a quartic `H` with p odd and `p ∤ disc(g)` has points mod p that lift, the same statement for the quartic model of a class.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, Checking
local solubility, p. 80; [W. Aitken, F. Lemmermeyer](https://arxiv.org/abs/1108.6310), Appendix B,
Theorem 5, p. 17 (arXiv v1).)

*Needs:* §3.1; Tau Ceti `WeierstrassCurve.Affine.range_μ_le_selmerGroupA`; Tau Ceti `WeierstrassCurve.Affine.range_μ_le_ker_normM`; Tau Ceti `WeierstrassCurve.Affine.localRes_mem_selmerGroupA`; Tau Ceti `WeierstrassCurve.Affine.badPrimes`; Tau Ceti `WeierstrassCurve.Affine.selmerGroupA`.

### 3.5 Exact 2-Selmer group of an elliptic curve over `ℚ`

Conditional on the explicit arithmetic-input hypotheses listed below, an exact 2-Selmer
computation for `W` (TwoSelmerData `W`) consists of: (i) a finite set `S` of primes containing 2
and every prime of `W.badPrimes`; (ii) for each monic irreducible factor `f_j` of f over `ℚ`, with field
`L_j = ℚ[X]/(f_j)` and the primes of `L_j` above `S`, an exact finite generating set of the group
`L_j(S,2)` of classes in `L_j^×/L_j^{×2}` with even valuation outside `S` (Mathlib's
`IsDedekindDomain.selmerGroup` for the ring of integers of `L_j`): S-unit generators modulo squares and
lifts of generators of the 2-torsion of the S-class group, exact complete by the supplied
complete class-and-unit presentation and Tau Ceti's exact sequence S-units `→ L_j(S,2) → Cl_S[2]`;
together these give an `𝔽₂-basis` of `A(S,2)`, the classes of `M` unramified outside `S (A(S,2)` contains
Tau Ceti's `W.selmerGroupA (𝓞 ℚ)`, which is the group for the fixed set `W.badPrimes (𝓞 ℚ)`, and equals
it exactly when `S = W.badPrimes (𝓞 ℚ)`); (iii) the norm map `N : A(S,2) → ℚ^×/ℚ^{×2}` on that basis,
whose kernel `K_S` is computed by `𝔽₂-linear` algebra; (iv) a complete exact local image `C_v`
(local-descent-image, local-image-completeness) for every `v ∈ S ∪ {∞}`, with the `𝔽₂-linear` maps `κ_v` ∘
`localRes_v` on the basis of `K_S`. Its Selmer group is `Sel(C) = {m ∈ K_S : κ_v(localRes_v(m)) ∈ span(C_v) for every v ∈ S ∪ {∞}}`, an explicit `𝔽₂-subspace` with a computed basis; its order is
`2^{s(C)}`.

Work under the following conditions. `W` : WeierstrassCurve `ℚ` with `W.IsElliptic, W.IsCharNeTwoNF` and
`a₂, a₄, a₆ ∈ ℤ`. Only the places of `S ∪ {∞}` carry computed local data; good-place-local-image shows
no other place changes the group. A supplied ideal/class/unit presentation has explicit defining
relations, integral-basis identities and a proof of full class/unit generation. All local
factorization identities used are hypotheses; they do not assert the Selmer or Mordell–Weil answer.

The interface includes these statements.

- The subgroup `Sel(C) ≤ W.M` cut out by the computed conditions.
- An explicit `𝔽₂-basis` of `Sel(C)` as classes of units of A.
- #Sel(C) `= 2^{s(C)}` with `s(C)` the length of the basis.
- `m ∈ Sel(C) ↔ m ∈ A(S,2), N(m) = 1` and `localRes_v(m) ∈ H_v` for every `v ∈ S ∪ {∞}`.
- `im μ ≤ Sel(C)`; see §3.6.
- `Sel(C) =` Tau Ceti `W.selmerGroup₂` with `R = 𝓞 ℚ` and the auxiliary family consisting of `ℝ` alone; see §3.6.
- Under `A(S,2)≤A(S′,2)` in the actual global square-class carrier and compatibility of all new local conditions, `Sel(C)≤Sel(D)`. With complete sound local data both equal the true Selmer group. The abstract helper records inclusion, not the actual ambient or local comparison.

For the proof, Field factors: take the supplied complete irreducible factorization of f over `ℚ`, with
its polynomial identity, irreducibility and pairwise-coprimality proofs; `ED.0` does not produce this
factorization; A `≅ ∏ L_j` by Tau Ceti `AdjoinRoot.equivPiFactors` and `M ≅ ∏ L_j^×/L_j^{×2}` by
`AdjoinRoot.modPowEquivPiFactors`, as in Tau Ceti `selmerGroupA`. Generators of `L_j(S,2)`: Tau Ceti
`IsDedekindDomain.selmerGroup.ker_toClassGroup` and `range_toClassGroup` give `0 → O_{L_j,S}^×/squares → L_j(S,2) → Cl_S(L_j)[2] → 0`; explicit supplied class/unit/factorization
data/exact-class-unit-completeness certifies the class group and a unit basis, and explicit
supplied class/unit/factorization data/prime-ideal-factor-datum the primes above `S`. The norm
map and all local maps are computed on the explicit basis; `Sel(C)` is the kernel of an explicit
`𝔽₂-matrix`.

For the actual curve `W:y²=x³−x` over `Q`, take as explicit inputs its split étale cubic `Q³`, finite square-class presentations at2 and infinity, actual norm/local restriction matrices and complete local-image tables, with the mathematical identifications specified here. Apply the pinned `μ` including its exceptional points and verify the finite matrix identities and row-reduction identities. Deduce the two-dimensional Selmer kernel and four-dimensional unconditioned norm kernel; neither cardinality is assumed as a basis-length hypothesis. Producing the supplied tables is outside this roadmap. For the compatibility regression, identify every abstract carrier and map in the datum with the actual pinned `W.A, W.M, normM`, local `μ` and `localRes` for the given rational Weierstrass curve `W` in characteristic-not-two normal form, with `W.IsElliptic, W.IsCharNeTwoNF` and `S` containing the actual bad primes. Prove `C.selmer` equals the actual `W.selmerGroup₂` for the ring of integers of `Q` and the one-member real archimedean family: this is the subgroup of `W.M` cut out by `normM.ker`, every finite-completion `localCondition` and the real `localCondition`. Use exact complete local images at `S` and infinity, the actual outside-S good-place theorem and the local-to-global unramified comparison. A freely supplied subgroup sel together with its defining membership equivalence is only the supporting intersection lemma. The `x³−x` test must additionally identify the four classes with the image of the actual rational two-torsion points O,`(0,0),(1,0),(−1,0)`. Transport any concrete `Q_p` coordinates through the isomorphism with the corresponding finite adic completion before comparing the local maps.

For Cremona 571a1 `W₀=[0,−1,1,−929,−10595]`, transport rational points by `(x,y)↦(4x,8y+4)` to `W:y²=x³−4x²−14864x−678064`. On this actual normal-form curve construct the cubic square classes, norm and local restriction matrices, complete local images and finite Selmer datum; certify `#W.μ.range=1` and `#Sel₂(W)=4`, hence `W.μ.range≠Sel₂(W)`, without input image cardinality, basis length or non-equality. The original model is Cremona ecdata row571a1; the `n₁=1,n₂=4` claim is Cremona III §3.6 `p.91`.

**Checks.**

- For `y² = x³ − x` with `S = {2}`: #Sel(C) `= 4` and `Sel(C)` is the image of `E(ℚ)[2] = {O, (0,0), (1,0), (−1,0)}`.
- Without the local conditions the group would be `A(S,2) ∩` ker `N`; for `y² = x³ − x (A ≅ ℚ³`, each factor contributing `ℚ({2},2) = ⟨−1, 2⟩`) this group has order `4³/4 = 2⁴`, larger than `Sel(C)`.
- `Sel(C) = W.selmerGroup₂` (with `R = 𝓞 ℚ` and the auxiliary family consisting of `ℝ` alone) for every datum with `S ⊇ badPrimes`.
- For the actual Cremona 571a1 model [0,−1,1,−929,−10595], transported to `characteristic-≠2` normal form by `(x,y)↦(4x,8y+4)`, certify #range `μ=1` and `#Sel₂=4` and conclude non-equality. Construct its concrete descent and local-image data; assumed dimensions alone do not verify this check.
- For the abstract datum and a supplied basis of length two, the Selmer summary has cardinality four. This does not construct the `x³−x` arithmetic comparison.
- For every abstract datum, its Selmer summary is contained in the supplied unconditioned norm kernel. This proves no numerical order of an actual cubic square-class group.
- Given the explicit outside-place, unramified and membership hypotheses for an arbitrary subgroup sel, the abstract datum summary equals sel. This does not identify sel with the actual pinned rational-curve Selmer group.
- Given abstract image order one and datum Selmer order four, the image differs from the datum summary. The 571a1 check additionally requires its actual arithmetic data.
- For `y² = x³ − x (f = X(X−1)(X+1), S = {2})` the computation gives #Sel(C) `= 4 = #E(ℚ)[2]`, the order of the image of the 2-torsion.
- Flynn–Poonen–Schaefer Lemmas 1–5 carry out the same steps for a genus-two Jacobian (`G, H, H′` there).

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, Method 2,
p. 90; [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §5, Proposition 3, p.
11 (arXiv v1); [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §7, Lemma 1
and proof, pp. 15–16 (arXiv v1); [John
Cremona](https://raw.githubusercontent.com/JohnCremona/ecdata/master/allcurves/allcurves.00000-09999),
allcurves/allcurves.00000-09999, line2591, row571 a1.)

*Needs:* §3.3; §3.4; Tau Ceti `WeierstrassCurve.Affine.selmerGroupA`; Tau Ceti `WeierstrassCurve.Affine.normM`; Tau Ceti `IsDedekindDomain.selmerGroup.ker_toClassGroup`; Tau Ceti `IsDedekindDomain.selmerGroup.range_toClassGroup`; Mathlib `IsDedekindDomain.selmerGroup`.

### 3.6 Soundness of the exact 2-Selmer group

For every two-selmer-datum `C` of `W`: (a) `Sel(C) =` Tau Ceti's `W.selmerGroup₂` with `R = 𝓞 ℚ` and the
auxiliary family consisting of `ℝ` alone, the classical 2-Selmer group of `E/ℚ; (b) im μ ≤ Sel(C); (c) Sel(C)` is finite of order `2^{s(C)}`.

Work under the following conditions. `C` : TwoSelmerData `W` with `S ⊇ badPrimes` and complete
local images at `S ∪ {∞}`.

For the proof, (b) Tau Ceti `range_μ_le_selmerGroupA, range_μ_le_ker_normM` and
`range_μ_le_localCondition` give `im μ ≤ A(S,2) ∩` ker `N ∩ ⋂_v localCondition`; local-image-completeness
identifies each local condition with the computed `H_v`. (a) `⊆`: an element of `Sel(C)` lies in `A(S,2) ∩`
ker `N` and satisfies the conditions at `S ∪ {∞}`; at every other prime good-place-local-image gives the
local condition (Tau Ceti's `localRes_mem_selmerGroupA` is stated only for `m ∈ W.selmerGroupA (𝓞 ℚ)`,
the group for `S = badPrimes`; when `S` ⊋ `badPrimes` the same global-to-local comparison for `A(S,2)` at
primes outside `S` is proved here by the same argument); so it is in `selmerGroup₂ (mem_selmerGroup₂_iff)`. (a) `⊇`: an element of `selmerGroup₂` satisfies the local condition at every
good p, hence (local image `⊆` unramified there) localizes to unramified classes at all good p and
lies in `A(S,2)` by Tau Ceti `mem_selmerGroupA_of_forall_localRes`; the remaining conditions are those
of `Sel(C)`. (c) The datum's basis is a basis by explicit supplied class/unit/factorization data
completeness, so #Sel(C) `= 2^{s(C)}`; in particular `selmerGroup₂` is finite.

**Checks.**

- For `y² = x³ − x, Sel(C) = selmerGroup₂` has order 4.
- Finiteness of `selmerGroup₂`, which Tau Ceti leaves to a separate theorem, follows for every curve with a datum.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 91.)

*Needs:* §3.5; §3.3; §3.4; Tau Ceti `WeierstrassCurve.Affine.selmerGroup₂`; Tau Ceti `WeierstrassCurve.Affine.mem_selmerGroup₂_iff`; Tau Ceti `WeierstrassCurve.Affine.range_μ_le_selmerGroup₂`; Tau Ceti `WeierstrassCurve.Affine.range_μ_le_selmerGroupA`; Tau Ceti `WeierstrassCurve.Affine.range_μ_le_localCondition`; Tau Ceti `WeierstrassCurve.Affine.mem_selmerGroupA_of_forall_localRes`; EllipticCurves Layer 7 (Selmer groups and Sha).

### 3.7 Exact 2-descent rank upper bound

For an elliptic integral characteristic-not-two normal-form curve over `ℚ`, let the subgroup
constructed in §§3.5–3.6 be identified with native `W.selmerGroup₂`. The target is this
identification and its use as the finite subgroup argument of the supplied
`WeierstrassCurve.Affine.pow_rank_le_card_of_range_μ_le`; its inclusion hypothesis is §3.6.
The torsion term is supplied by `card_ker_nsmul_two`, and finite generation by
`fg_point_of_numberField`. If the described subgroup has order `2^s` and rational two-torsion
has order `2^t`, the supplier yields the application inequality `rank E(ℚ) ≤ s − t`.
No second rank-bound theorem or rank invariant is constructed.

**Checks.**

- `y² = x³ − x: s = 2, t = 2`, so `rank E(ℚ) = 0`.
- Curves with rational 2-torsion admit the separate two-isogeny computation; compare the two exact upper bounds.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 79.)

*Needs:* §3.6; Tau Ceti `WeierstrassCurve.Affine.pow_rank_le_card_of_range_μ_le`; Tau Ceti `WeierstrassCurve.Affine.card_range_μ`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; EllipticCurves Layer 6 (Mordell–Weil).

### 3.8 Exact local solubility test for `y² = g(x)`

For a squarefree degree-four polynomial `g = ax⁴ + bx³ + cx² + dx + e ∈ ℤ[x]`
and a prime place or the real place v, say that `g` is locally soluble at v when
the smooth projective curve `y² = g(x)` has a `ℚ_v`-point. Over `ℝ` this means
`a > 0` or that g has a real root. Over `ℚ_p` the points are covered by the two charts
`g(x)` for `x ∈ ℤ_p` and g*(u) `= u⁴g(1/u)` for `u ∈ pℤ_p`, the second including the points
at infinity; the reversal keeps all five coefficient positions even if `e = 0`.

For `x ≡ x_k (mod p^k`), put ℓ `= ord_p g(x_k)` and `m = ord_p g′(x_k)`, with
zero values treated as squares before a finite valuation is read. The Hensel alternatives of
Birch–Swinnerton-Dyer, Lemmas 6–7, as stated by Cremona, are the following. At odd p,
a square value or ℓ `≥ m + k` with `k > m` gives a point. A class not settled this way
can contain a point only if ℓ `≥ 2k` and `m ≥ k`.
At `p = 2`, a square value gives a point; so does `k > m` and one of
ℓ `≥ m + k, ℓ = m + k − 1` with even ℓ, or ℓ `= m + k − 2` with even ℓ
and odd part congruent to 1 mod 4. The remaining possible classes satisfy `m ≥ k`
and either ℓ `≥ 2k` or ℓ `= 2k − 2` with odd part 1 mod 4.
The subclasses of a class are the finite disjoint partition `x_k + t p^k, 0 ≤ t < p`.

Depth lemma: if `x₀ ∈ ℤ_p` and `k ≥ 1` satisfy `ord_p g(x₀) ≥ 2k` and `ord_p g′(x₀) ≥ k`, then
`k ≤ ord_p(disc g)`. Consequently a class left undecided by the alternatives at depth k has
`k ≤ ord_p(disc g)` at odd p and `k ≤ ord_2(disc g) + 1` at `p = 2`, so local solubility at p is
decided by the alternatives at depths up to this bound. For the proof, translate `x₀` to 0; then
`ord_p d ≥ k` and `ord_p e ≥ 2k`. The discriminant is isobaric of degree 6 and weight 12 in the
coefficients, so a monomial free of d and e would be `c⁶`, whose coefficient is zero because
`x²(x² + c)` has discriminant zero; hence every monomial of disc g has `i_d + 2i_e ≥ 1` and
valuation at least k, and `disc g ≠ 0`.

Prove: local solubility is equivalent to a `ℚ_v`-point on the smooth projective model; it equals
local solubility of the reversed quartic when `e ≠ 0`; it is invariant under multiplying g by a
nonzero rational square; it holds at every odd `p ∤` disc g; and the depth lemma.
For the proof, apply Hensel's lemma on each class and on the two charts. The degree and
nonzero discriminant hypotheses are essential throughout. Exact solubility or nonsolubility
values in a concrete application are proved by these alternatives, not assumed.

**Checks.**

- `2x⁴ − 34` is locally soluble at 2, at 17 and at `∞` (the Lind–Reichardt quartic).
- For `g = −x⁴ − 1`, the real place fails and every odd `p ∤` disc g succeeds.
- If a is a nonzero square then g is locally soluble at every v (points at infinity).
- Solubility modulo p alone is not the test: `y² ≡ 3x⁴ + 3` (mod 3) has the solutions `y = 0`, yet `3x⁴ + 3` is not 3-adically soluble, since `3x⁴ + 3` has odd 3-adic valuation for every `x ∈ ℚ_3` and the leading coefficient 3 is not a square.
- The fixed quartic reversal of `X⁴+X` is `X³+1` and its fixed reversal returns `X⁴+X`. `Polynomial.reverse` applied to `X³+1` would return `X³+1` instead.
- Depth lemma witness: `g = x⁴ + p²` at `x₀ = 0` and odd p has `ord_p g(0) = 2` and `g′(0) = 0`, so `k = 1` is allowed, and indeed `ord_p(disc g) = ord_p(2⁸p⁶) = 6 ≥ 1`. Negative control: `g = x⁴ − 1` at `p = 3` has `ord_3(disc g) = ord_3(−256) = 0`, so no class has `ℓ ≥ 2` and `m ≥ 1` together; the classes `x ≡ ±1` have `m = 0 < k = 1` and ℓ `≥ 1 = m + k`, hence a point.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, Checking
local solubility, pp. 80–82; [Cremona
(1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, footnote 6, p. 80.)

*Needs:* §0.8; §0.4; Mathlib `Polynomial.discr`; §0.2.

### 3.9 Correctness of the quartic local solubility test

For `g ∈ ℤ[x]` squarefree of degree 4 and a place v of `ℚ`, g is locally soluble at v (§3.8) if and only
if the smooth projective curve `y² = g(x)` has a `ℚ_v-point`. For odd `p ∤` disc g the answer is true; for
the even quartics `g = d₁u⁴ + cu² + d₂` of descent via 2-isogeny, disc `g = 16·d₁d₂(c² − 4d₁d₂)²`, so
this covers every odd `p ∤ d₁d₂(c² − 4d₁d₂)`. Hence everywhere local solubility is decided by the
finitely many places `p | 2·disc g` and `∞`.

Work under the following conditions. g of degree 4 with disc `g ≠ 0`; v a prime or `∞`.

For the proof, The two charts and the Hensel alternatives of §3.8 are necessary and sufficient for a point,
by Birch–Swinnerton-Dyer Lemmas 6–7 as stated by Cremona. Good odd p: a smooth genus-one curve over `𝔽_p` has an `𝔽_p-point`
(Aitken–Lemmermeyer Lemma 13 for the 2-isogeny quartics, elementary; for a general smooth
genus-one curve `C`, choose a geometric point to identify `C` with its Jacobian `E` over an algebraic
closure. Frobenius acts as `F_E` followed by a translation. The endomorphism `F_E−1` is nonzero
(deg `F_E=p` differs from `deg1=1`), hence is a surjective isogeny; solving its translation equation
gives a Frobenius-fixed point of `C`. This argument uses the isogeny and Frobenius theory of
EllipticCurves Layers2–3 and is the additional torsor adapter here), and a nonsingular point lifts by Hensel's lemma
(Aitken–Lemmermeyer Lemma 14). The real test is immediate from the intermediate value theorem.

**Checks.**

- Local solubility holds for `2x⁴ − 34` at 2, 17 and `∞`, in agreement with Aitken–Lemmermeyer Theorem 4.
- For Fermigier's rank-13 curve the test, run over the primes dividing 2dd′, returns `n₂ = 256` and `n₂′ = 128`, the values Cremona reports.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 80; [W.
Aitken, F. Lemmermeyer](https://arxiv.org/abs/1108.6310), Appendix B, Lemma 14, p. 17 (arXiv v1).)

*Needs:* §3.8; EllipticCurves Layer 3 (finite fields and Hasse bound); Mathlib `Polynomial.discr`.

### 3.10 The descent map for a rational 2-isogeny

Use the two-isogeny maps and Kummer coordinates of HeightsRationalPointsAndObstructions §1.19.
For integral c,d with `d(c² − 4d) ≠ 0`, the models are
`E: y² = x(x² + cx + d)` and E′: `y² = x(x² − 2cx + c² − 4d)`.
The integral-model target identifies the supplier's torsor for a signed squarefree divisor
`d₁ ∣ d` with the projective quartic `v² = d₁u⁴ + cu² + d/d₁`.
Construct this integral quartic model, its coordinate comparison with the Kummer fibre,
its compatibility with local base change, and the implication from a rational point to the
supplier Selmer condition. The supplier already owns the descent map, exceptional value at
`(0,0)`, kernel, two isogenies and their composition with doubling.

For the proof, on nonzero coordinates substitute `x = d₁u², y = d₁uv` and use the
supplier's exceptional-point formulas at infinity and `u = 0`. The comparison respects both
signs of `d₁` and every prime and real completion, so §3.9 applies to exactly these torsors.

**Checks.**

- For `c = −1, d = 1 (E24 : y² = x³ − x² + x): n₂ = 1` and `n₂′ = 4` with `S^{(φ)} = {±1, ±3}`.
- `α(O) = 1` and `α(P) = 1` for every `P ∈ φ′(E′(ℚ))`; for d a square, `α(0,0) = 1`.
- For `P = (x, y)` with `x ≠ 0, α(P) = 1` iff x is a rational square.
- `α(0,0)` is the class of d, not of `x(0,0) = 0`: the naive rule `x ↦ x` is undefined there; for `y² = x³ − 68x, α(0,0) = −17 ≠ 1`.
- For `E : y² = x³ − x² + x (c = −1, d = 1): α(E(ℚ)) = {1}, n₁ = 1`.
- For `y² = x³ − 68x: α((0,0)) = −68 ≡ −17`.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, Method 1,
p. 84; [Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p.
85.)

*Needs:* Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.Affine.Point.add_some`; §3.8.

### 3.11 Rank bounds from descent via 2-isogeny

With the notation of two-isogeny-descent-map write `n_i = 2^{e_i}, n_i′ = 2^{e_i′}`. Then `rank E(ℚ) = rank E′(ℚ) = e₁ + e₁′ − 2`. Consequently, with `ñ₁ = 2^{ẽ₁} ≤ n₁` the order of the subgroup generated
by classes `d₁` for which an explicit rational point on `H(d₁, c, d/d₁)` is exhibited (and the same with
primes), `ẽ₁ + ẽ₁′ − 2 ≤ rank E(ℚ) ≤ e₂ + e₂′ − 2`, where `n₂` and `n₂′` are computed by
quartic-local-solubility at the places dividing 2dd′ and `∞` (all other places are automatic). The
lower bound is used only together with an upper bound datum; `rank = e₂ + e₂′ − 2` is exact
when `ñ₁ = n₂` and `ñ₁′ = n₂′`.

Work under the following conditions. `E, E′, α, α′` as in two-isogeny-descent-map.

For the proof, `φ′` ∘ `φ = [2]` gives the exact sequence `0 → E′(ℚ)[φ′]/φ(E(ℚ)[2]) → E′(ℚ)/φ(E(ℚ)) → E(ℚ)/2E(ℚ) → E(ℚ)/φ′(E′(ℚ)) → 0`, so `#E(ℚ)/2E(ℚ) = n₁n₁′/2` if d′ is not a square and `n₁n₁′` if d′ is a
square (Cremona p. 86). `#E(ℚ)/2E(ℚ) = 2^{rank} · #E(ℚ)[2]` (Tau Ceti
`AddSubgroup.index_range_nsmul_of_fg` with `E(ℚ)` finitely generated) and `#E(ℚ)[2] = 2` or 4 according as
d′ is a non-square or a square; so `2^{rank} = n₁n₁′/4`. `α(E(ℚ)) ⊆ S^{(φ′)}` gives `n₁ ≤ n₂`; exhibited
points give subgroups of `α(E(ℚ))`. Local solubility outside 2dd′ `∞` is automatic
(quartic-local-solubility-correct; Aitken–Lemmermeyer Theorem 5).

**Checks.**

- Cremona, Fermigier's curve `c = 36861504658225, d = 1807580157674409809510400: n₁ = n₂ = 256` and `n₁′ = n₂′ = 128`, so the rank is 13 (fermigier-rank-thirteen).
- For the five curves of rank-zero-curves, `n₂n₂′ = 4`, so the rank is 0.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 84;
[Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 85.)

*Needs:* §3.10; §3.9; Tau Ceti `AddSubgroup.index_range_nsmul_of_fg`; Tau Ceti `WeierstrassCurve.Affine.fg_point_of_numberField`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`.

### 3.12 Cremona's rational height difference bound

`Suggested.lean` states the rational estimate as
`ED3.canonicalHeight_sub_naiveHeight_cremona`, with `ED3.cremonaMu`, and the
number-field estimate as `ED3.canonicalHeight_sub_naiveHeight_silverman`, with
`ED3.silvermanMu`. The definition `ED3.archimedeanLogHeight` records the weighted
archimedean contribution divided by the field degree.

For a nonsingular integral standard Weierstrass equation `W` over `Q` with discriminant `Δ`, j-invariant j
and `b₂`, let `2*=1` if `b₂=0` and 2 otherwise. Put `μ_C=((log|Δ| + log⁺j)/6 + log⁺(b₂/12) + log(2*)`),
where `log⁺t=log max(1,|t|)`, exactly as Cremona III Proposition `3.5.1 p.77`. For every rational point
`P`, in the pinned Tau Ceti normalization, `−h(j)/12−μ_C−961/500 ≤ P.canonicalHeight−P.naiveHeight ≤ μ_C+107/50`. Cremona's constants are `1.922` and `2.14`, in this same full-height convention. `Δ≠0` follows from IsElliptic; `P=O` has both heights zero. The number-field extension
uses Silverman Theorem `1.1, p`. 725, with the absolute height and archimedean weights specified
below.

Work under the following conditions. `W` a nonsingular integral standard Weierstrass equation over `Q`,
with all `a_i` integral and `Δ≠0; P` in `W.toAffine.Point`, including `O`. Pinned Tau Ceti ĥ agrees with
Cremona’s displayed height; the normalization is established by the actual limit definitions and
Cremona footnote3. For general `K` use the separately stated weighted-height interface below.

The interface includes these statements.

- `ED3.cremonaMu: μ_C=((log|Δ|+log⁺j)/6+log⁺(b₂/12)+log(2*))`, with `log⁺t=log max(1,|t|)`, for an integral standard equation over `Q`.

For the proof, Use the integral standard-equation over `Q` hypotheses of Proposition `3.5.1`. Use
`log⁺t=log max(1,|t|)`, with `(log|Δ|+log⁺j)/6` and `log⁺(b₂/12)` outside that quotient; distinguish log⁺j
from the logarithmic height `h(j)`. Apply the proposition to `P.canonicalHeight` and `P.naiveHeight`. Use the pinned `canonicalHeight` rather than a fresh limiting function. Choose an
outward rational enclosure of `μ_C+h(j)/12+961/500` and `μ_C+107/50` using `ED.2` rational
logarithm/error bounds; propagate through doubling enclosures. No rational result is generalized to
a number field without its own source.

The number-field estimate `ED3.canonicalHeight_sub_naiveHeight_silverman` and its constant `ED3.silvermanMu` are stated as follows. Let `d=[K:Q]` and `h∞(t)=d⁻¹ Σ(v` archimedean) `n_v log max(1,|t|_v)`, with `n_v=[K_v:R]`. For an integral nonsingular standard Weierstrass equation W/K put `μ_S=h_abs(Δ)/6+h∞(j)/6+h∞(b₂/12)+log(2*)`, where `2*=1` if `b₂=0` and 2 otherwise. Define `silvermanMu` on this `W` and prove, for `P` in `W.toAffine.Point` including `O, −h_abs(j)/12−μ_S−973/500 ≤ P.canonicalHeight/d−P.naiveHeight/d ≤ μ_S+107/50`. Both pinned heights are relative logarithmic heights; d converts them to the absolute heights of Silverman `Theorem1.1`. Unit-test `b₂=0, K=Q` and field-extension compatibility (local weights sum correctly).

**Checks.**

- On `y²=x³+B` for nonzero integral `B`, the constant reduces to `μ_C=log|432B²|/6`, and the lower/upper constants are `μ_C+961/500` and `μ_C+107/50` because `j=b₂=0`.
- The full displayed Cremona inequality gives the pinned bound; `O` satisfies it with both heights zero.
- Refines pinned `Point.abs_canonicalHeight_sub_naiveHeight_le`, whose bound is existential.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Chapter III, Proposition
3.5.1, printed p.77 (PDF chapter page16), footnote3; [Joseph H.
Silverman](https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/), Theorem1.1 and
Remark1.2, printed p.725; §3 local/global normalization, pp.729–730.)

*Needs:* Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight`; Tau Ceti `WeierstrassCurve.Affine.Point.naiveHeight`; Tau Ceti `WeierstrassCurve.Affine.Point.abs_canonicalHeight_sub_naiveHeight_le`; Mathlib `NumberField.absLogHeight₁`; Mathlib `Rat.mulHeight₁_eq_max`; HeightsRationalPointsAndObstructions Layer 0.

### 3.13 Exact enclosure of the canonical height by doubling

For `W` over `ℚ` with integral coefficients, a point `P ∈ E(ℚ)` and `n ∈ ℕ, canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺` takes four explicit rational inputs and is a closed interval [ℓ, u] with rational
endpoints containing `ĥ(P)` (Tau Ceti `canonicalHeight`), computed as follows: form `Q = 2ⁿ·P` exactly in
Mathlib's group law over `ℚ`; if `Q = O` then `ĥ(P) = 0` and the interval is [0,0]; otherwise `H = max(|a|, b)` for `x(Q) =` a/b in lowest terms and `[λ⁻, λ⁺]` ∋ `log H` is an exact rational enclosure; with
nonnegative rational bounds `c⁻ ≥ h(j)/12 + μ_C(W) +` 961/500 and `c⁺ ≥ μ_C(W) +` 107/50
(explicit-height-difference-bound, logs enclosed the same way), ℓ `= (λ⁻ −` c⁻)/4ⁿ and `u = (λ⁺ +`
c⁺)/4ⁿ. The width is at most (`(λ⁺ − λ⁻) + c⁺ +` c⁻)/4ⁿ, with equality when `Q≠O`. To obtain any
requested width choose the `ED.2` rational logarithm/error bounds log enclosure to have uniformly
bounded width (for example `≤1`), choose fixed exact c⁻,c⁺, then increase n. No uniform decay is
claimed for arbitrarily widening input log intervals. Pairings `⟨P, R⟩ = (ĥ(P + R) − ĥ(P) − ĥ(R))/2`
are enclosed by interval arithmetic on three enclosures.

Work under the following conditions. `W` over `ℚ`, integral, elliptic; `P∈W.toAffine.Point; n∈ℕ`. Explicit
rational `λ⁻≤λ⁺, c⁻≥0, c⁺≥0`. Containment requires `λ⁻≤naiveHeight(2ⁿP)≤λ⁺` and
`c⁻≥h(j)/12+μ_C(W)+961/500, c⁺≥μ_C(W)+107/50`. The `Q=O` branch returns [0,0] without a logarithm
evaluation. `ED.2` rational logarithm/error bounds supplies exact logarithm/error endpoints at
requested precision; the interval is defined by these exact rational endpoints.

The interface includes these statements.

- For the explicit `λ⁻,λ⁺,c⁻,c⁺` with exact log/error inequalities and integral elliptic `W, ĥ(P)` lies in `canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺`.
- For explicit `λ⁻≤λ⁺` and `c⁻,c⁺≥0, width(canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺)≤((λ⁺−λ⁻)+c⁺+c⁻)/4ⁿ`, including the zero branch. No existential unspecified constant replaces this formula.
- `canonicalHeightEnclosure W 0 n λ⁻ λ⁺ c⁻ c⁺=[0,0]` for arbitrary rational inputs.
- With the same rational data on both sides, `canonicalHeightEnclosure W (−P) n λ⁻ λ⁺ c⁻ c⁺=canonicalHeightEnclosure W P n λ⁻ λ⁺ c⁻ c⁺`.
- With integral elliptic `W`, the three exact naive-height log intervals at `2ⁿ(P+Q),2ⁿP,2ⁿQ` and the shared exact c⁻,c⁺, `pairingEnclosure` contains `(ĥ(P+Q)−ĥ(P)−ĥ(Q))/2`.
- `pairingEnclosure W P Q n` bounds c⁻ c⁺ uses `bounds:Fin3→Q×Q` in order P+Q,P,Q, and forms `[(I.lower−J.upper−L.upper)/2,(I.upper−J.lower−L.lower)/2]` from their three height intervals with the shared error bounds.

For the proof, `ĥ(2ⁿP) = 4ⁿĥ(P)` (Tau Ceti `Point.canonicalHeight_nsmul`), and
explicit-height-difference-bound applied to `Q =` 2ⁿP gives `h(Q) − c⁻ ≤ ĥ(Q) ≤ h(Q) + c⁺`; divide
by 4ⁿ. `h(Q) = log H` by Mathlib `Rat.mulHeight₁_eq_max` and Tau Ceti `Point.naiveHeight_eq_logHeight₁`;
interval arithmetic by `ED.2` rational logarithm/error bounds rational-interval-product. Only exact
rational arithmetic and the logarithm enclosures enter; no floating-point value is trusted.

The interval implication uses the full native height and the `4^n` denominator.

**Checks.**

- For `y²=x³+1` and `P=(−1,0)` of order2, `canonicalHeightEnclosure` returns [0,0] for every `n≥1` and every supplied rational endpoint/error input.
- At `O` the constructor returns [0,0] for every n and all four rational inputs.
- On `y²=x³+1`, for any point and n, explicitly exact rational log/error inputs give containment of the pinned full-x-height `canonicalHeight`.
- For `P=(2,3)` on `y²=x³+1, ĥ(P)=0` while `naiveHeight(P)=log(2)>0`. At `n=0`, exact rational `λ⁻≤log2≤λ⁺` and c⁻,c⁺ give an interval containing0; the naive value alone fails.
- With log endpoints a,a+1/8 and error bounds2,3 the interval width is at `most41/(8·4ⁿ)`, including the `Q=O` branch. This arithmetic Check distinguishes the full log width and the factor4ⁿ.
- For `y²=x³−2` and `P=(3,5)`, certify at `n=6` a log interval of `width≤1` and nonnegative rational errors with `(λ⁺−λ⁻)+c⁺+c⁻<40`; the exact width is then `<10⁻²`. The displayed inequalities are hypotheses for this numerical Check.
- For a point of order `2^k` the computation reaches `Q = O` for `n ≥ k` and returns [0,0]; for other torsion points the enclosures contain 0 and shrink to `{0}`.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.4, p. 71;
[Joseph H. Silverman](https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/), §7
(examples), and abstract, p. 723.)

*Needs:* §3.12; Tau Ceti `WeierstrassCurve.Affine.Point.canonicalHeight_nsmul`; Tau Ceti `WeierstrassCurve.Affine.Point.naiveHeight_eq_logHeight₁`; Tau Ceti `WeierstrassCurve.Affine.neronTatePairing_apply`; Mathlib `Rat.mulHeight₁_eq_max`; §2.1; §0.1.

### 3.14 Independence and regulator lower bound from exact heights

Let `P₁,…,P_r ∈ E(ℚ)` and let `I_{ij}` be rational intervals with `⟨P_i, P_j⟩ ∈ I_{ij}`
(canonical-height-enclosure; `⟨·,·⟩` Tau Ceti's `neronTatePairing, ⟨P,P⟩ = ĥ(P)`). If the interval
determinant of `(I_{ij})` has positive lower endpoint `δ > 0`, then the images of `P₁,…,P_r` in
`E(ℚ)/E(ℚ)_tors` are `ℤ-linearly` independent, `rank E(ℚ) ≥ r`, and `det(⟨P_i, P_j⟩) ≥ δ`. If moreover
`P₁,…,P_r` is a basis of `E(ℚ)/E(ℚ)_tors` then Tau Ceti's regulator satisfies regulator `≥ δ`.

Work under the following conditions. `W` over `ℚ` elliptic with integral coefficients; enclosures from
canonical-height-enclosure.

For the proof, If `Σ n_j P_j` is torsion with `n ≠ 0`, then `Σ_j ⟨P_i, P_j⟩ n_j = ⟨P_i, Σ_j n_j P_j⟩ = 0`
for all i (bilinearity; Tau Ceti `neronTatePairing_eq_zero_of_isOfFinAddOrder_right`), so the Gram
matrix is singular, contradicting `det ≥ δ > 0`. The interval determinant encloses the true
determinant (`ED.2` rational logarithm/error bounds interval arithmetic soundness), so `det ≥ δ`. For a
basis, `regulator_eq_abs_det_neronTateGramMatrix` identifies the regulator with `|det|`.

**Checks.**

- Applied to Cremona's rank-two curve `y² = x³ − 673` with `P₁ = (29, 154)` and the second generator printed in §3.6, a positive lower endpoint certifies `rank ≥ 2`.
- A single non-torsion point: `r = 1` and `δ =` lower endpoint of the enclosure of `ĥ(P₁)`.
- Repeating the same point in a two-point family gives identical Gram columns and determinant zero, so no positive lower endpoint can certify independence.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.5, p. 76.)

*Needs:* §3.13; Tau Ceti `WeierstrassCurve.Affine.neronTatePairing`; Tau Ceti `WeierstrassCurve.Affine.neronTatePairing_eq_zero_of_isOfFinAddOrder_right`; Tau Ceti `WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`; Tau Ceti `WeierstrassCurve.Affine.neronTateGramMatrix`; Mathlib `Matrix.det`; §0.1.

### 3.15 Lower bound for the canonical height of non-torsion points by an exact search

Let `W` over `ℚ` be integral and elliptic, c⁻ a rational upper bound for `h(j)/12 + μ_C(E) +` 961/500
(`μ_C` is `cremonaMu`, Cremona’s `μ`) (explicit-height-difference-bound), and `B > 0`. Let `L` be the
finite set of `P ∈ E(ℚ)` with `naiveHeight(P) ≤ B`, enumerated completely (`ED.0` bounded-height
enumeration of `x ∈ ℚ` with `h(x) ≤ B`, followed by an exact rational-solubility test for the
Weierstrass quadratic in y at each x, together with `O`). Put `λ = min({B − c⁻} ∪ {ℓ_P : P ∈ L`
`non-torsion}`), where this finite set is nonempty because it contains `B − c⁻`, and `ℓ_P` is the lower
endpoint of a canonical-height-enclosure of `P`. If `L` contains no non-torsion point, `λ=B−c⁻`. If `λ > 0`, then `ĥ(Q) ≥ λ` for every non-torsion `Q ∈ E(ℚ)`.

Work under the following conditions. `W, c⁻` and `B` as stated; torsion of the points of `L` decided
exactly using the torsion datum of §3.20: choose a good odd reduction prime q,
put `M = #E(𝔽_q)`, and test [M]Q `= O`. Injectivity on rational torsion makes this
equivalent to `Q` being torsion; no classification of rational torsion is needed.

The interface includes these statements.

- For an actual group equivalence `e:A≃(Z^r)×T` with finite torsion `T`, enumerate all coordinates in `[-D,D]^r` and every `t∈T`, transporting through `e⁻¹`.
- `P` is enumerated iff every free coordinate of `e(P)` has `|a_i|≤D`; the torsion coordinate is unrestricted.
- Given `λ>0` with `λΣa_i²≤height(P)`, and `B<λ(D+1)²`, every `P` of `height≤B` belongs to the enumerated list. The Jacobian supplier must derive this `λ` from its positive-definite Gram form.

For the proof, If `naiveHeight(Q) > B` then `ĥ(Q) ≥ naiveHeight(Q) − c⁻ > B − c⁻ ≥ λ` by the lower
inequality of explicit-height-difference-bound. Otherwise `Q ∈ L`, and `Q` non-torsion gives `ĥ(Q) ≥ ℓ_Q ≥ λ`.
Take the minimum over the displayed nonempty finite union. The coordinate-enumeration helpers below
are separate supporting interfaces for groups with an already supplied free/torsion decomposition;
they are not an implementation of the elliptic point search or a proof that its height form is
coercive.

**Checks.**

- For `r=0` every point belongs to the sole finite torsion fibre; no positive-dimensional ball-volume theorem is used.
- For `Z×Z/2` with `D=0` the list has two elements, one for each torsion value.
- The zero form on `Z` has an infinite bounded set, so semidefiniteness alone cannot supply bounded enumeration.
- If `L` contains only torsion, the singleton minimum is B−c⁻; no minimum of an empty set is taken. The conclusion is conditional on positivity and remains meaningful at rank zero.
- If `B−c⁻=2` and one non-torsion point has exact lower endpoint−1, `λ=−1`; the positive lower-bound theorem cannot be applied despite every actual non-torsion height being positive.
- Siksek `Example5.1`: on `y²=x³−73705x−7526231` a source search to naive height5, with `h−ĥ_source≤0.8215`, excludes non-torsion `ĥ_source≤4.1`. In `ED.3` normalization the corresponding error `is0.8215` and lower `threshold4.1`. Useing this example requires exact outward bounds and complete points/signs, not treating printed decimals as formal data.
- For a rank-zero curve the bound holds vacuously for every `λ`.

([Siksek (1995 author preprint)](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf),
Author preprint, §5 Example5.1, p.19; §1 Theorem1.2, p.2.)

*Needs:* §3.12; §3.13; §3.20; §0.11.

### 3.16 Index bound from a height lower bound and Minkowski's theorem

Let `P₁,…,P_r ∈ E(ℚ) (r ≥ 1)` be independent modulo torsion, `L` their span in `E(ℚ)/E(ℚ)_tors`, L̄ `= {Q :`
`nQ ∈ L for some n ≥ 1}` its saturation and `n =` [L̄ : `L`]. Let `λ > 0` with `ĥ(Q) ≥ λ` for every
non-torsion `Q ∈ E(ℚ)` (height-lower-bound-by-search), and let `γ_r` be any constant such that every
positive definite real quadratic form in r variables of determinant `D` takes a value `≤ γ_r·D^{1/r}` at
some nonzero integral vector; `γ_r = (4/π)·Γ(r/2 + 1)^{2/r}` is such a constant (Minkowski), and `γ₁ = 1, γ₂ = (4/3)^{1/2}` are the exact Hermite values. Then `n ≤ R^{1/2}·(γ_r/λ)^{r/2}`, where `R = det(⟨P_i, P_j⟩)` in Tau Ceti's normalisation. If `rank E(ℚ) = r` then L̄ `= E(ℚ)/E(ℚ)_tors` and n is the
index of the subgroup generated by the `P_i` and the torsion.

Work under the following conditions. `P_i` independent modulo torsion (`e.g`. by regulator-lower-bound);
`λ` as stated; any of the listed `γ_r`.

For the proof, L̄ is a lattice of rank r with Gram determinant `R(L̄) = R/n²` (index–covolume relation
for the Gram determinant). This is the same Gram-lattice argument as Siksek `equation(27)`, applied to
the saturated rational span; that reduction, and the harmless weakening of `>λ` to `≥λ`, are adaptations
rather than extra generality printed in `Theorem3.1`. Minkowski's convex-body theorem (Mathlib
`exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`) for the ellipsoid `{x : ĥ(Σ x_i Q_i) ≤ t}` in a basis `Q_i` of L̄, with `InnerProductSpace.volume_ball`, gives a nonzero `Q ∈` L̄ with `ĥ(Q) ≤ γ_r R(L̄)^{1/r}`. `Q` is non-torsion, so `λ ≤ ĥ(Q) ≤ γ_r (R/n²)^{1/r}`; solve for n.

**Checks.**

- Rank2 exact numerical Check: `R≤9, λ≥1` and `γ₂²=4/3` give `n²≤12`, hence `n≤3`. The exact inputs therefore bound the index by 3.
- `r = 1: n ≤ (ĥ(P₁)/λ)^{1/2}`.

([Siksek (1995 author preprint)](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf),
Author preprint, §3 equation(27), pp.14–15; Lemmas3.1–3.2, pp.15–16; Theorem3.1, p.16.)

*Needs:* §3.15; Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`; Mathlib `InnerProductSpace.volume_ball`; Tau Ceti `WeierstrassCurve.Affine.neronTatePairingModTorsion_self_eq_zero_iff`; Tau Ceti `WeierstrassCurve.Affine.PointModTorsion`.

### 3.17 p-saturated subgroups

Let A be an abelian group, `G ≤` A a subgroup and p a prime. `G` is p-saturated in A (IsPSaturated `G p`)
if every a `∈` A with `p·a ∈ G` lies in `G; G` is saturated if it is p-saturated for every prime p.
Equivalently: `A[p] ≤ G` and `G ∩ pA = pG`. If [A : `G`] is finite, `G` is p-saturated iff `p ∤ [A : G]; G` is
saturated iff [A : `G] = 1`.

Work under the following conditions. A an additive commutative group (A `= E(ℚ)` or `J(ℚ)` in the
applications); `G` an AddSubgroup; p prime.

The interface includes these statements.

- IsPSaturated `G p` holds iff every a `∈` A with `p·a ∈ G` lies in `G`.
- IsPSaturated `G p ↔ A[p] ≤ G ∧ G` ⊓ (p • ⊤) `= p` • `G`.
- For `G` of finite index and p prime: IsPSaturated `G p ↔` ¬ `p ∣ G.index`.
- ⊤ is p-saturated.
- The intersection of p-saturated subgroups is p-saturated.
- If `G` has finite index `≤ N` and is p-saturated for every prime `p ≤ N`, then `G =` ⊤.
- The saturation Ḡ `= {a : ∃ n ≥ 1, n • a ∈ G}`, the smallest saturated subgroup containing `G`.

For the proof, The equivalence: if `G` is p-saturated then `A[p] ≤ G (p·t = 0 ∈ G)` and `pa ∈ G` forces a
`∈ G`; conversely `pa = g ∈ G ∩ pA = pG` gives `g =` pg′, so a `− g′ ∈ A[p] ≤ G`. Finite index: if `p | [A:G]`, Cauchy's theorem in A/G gives a `∉ G` with `pa ∈ G`; if `p ∤` [A:G] and `pa ∈ G`, the class of a has
order dividing p and [A:G], hence is trivial.

**Checks.**

- isPSaturated_six_int. In `ℤ: (6ℤ)` is 5-saturated, not 2-saturated, not 3-saturated.
- isPSaturated_top_any. ⊤ `≤` A is p-saturated for every p.
- isPSaturated_index_coprime. For `G = (6ℤ) ≤ ℤ` with `AddSubgroup.index = 6`: IsPSaturated `G p ↔` ¬ `p ∣ 6`.
- isPSaturated_torsion_missing. In A `= ℤ × ℤ/2, G = ℤ × 0` has `G ∩ 2A = 2G` but is not 2-saturated, since `A[2]` ⊄ `G`: the injectivity of G/pG `→` A/pA alone is not p-saturation.
- In A `= ℤ, G = 6ℤ` is 5-saturated but neither 2- nor 3-saturated.
- `G = 0` in `ℤ/pℤ` is not p-saturated.

([Siksek (1995 author preprint)](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf),
Author preprint, §4 opening, p.17, equation(39).)

*Needs:* Mathlib `Subgroup.index`; Mathlib `exists_prime_addOrderOf_dvd_card`.

### 3.18 p-saturation from jointly injective reductions

Let A be an abelian group, `G ≤` A a subgroup with G/pG finite, p a prime, and `ψ_i : A → C_i (i =`
1,…,m) homomorphisms into abelian groups with `pC_i = 0`. If (a) the induced map G/pG `→ ∏_i C_i` is
injective and `(b) A[p] ≤ G`, then `G` is p-saturated in A. Standard choices: `ψ_q : A → B_q → B_q/pB_q`
with `B_q = Ẽ(𝔽_q)` (resp. `J̃(𝔽_q)`) the reduction at a prime q of good reduction (EllipticCurves Layer
4; Jacobians by the HeightsRationalPointsAndObstructions Layer 1 contract), useful when `p | #B_q`; for `p = 2` and A `= E(ℚ)`, the descent map `μ`
: `E(ℚ) → M` (kernel `2E(ℚ)`) or its local components. Condition (b) is exact by the torsion
datum (torsion-by-reduction): it holds when `A[p] = 0` or when generators of `A[p]` are among the
generators of `G`.

Work under the following conditions. A abelian; `G ≤` A given by generators `g₁,…,g_s`, so G/pG is
spanned by their classes; p prime; `ψ_i` homomorphisms with p-torsion targets.

For the proof, Each `ψ_i` kills `pA`, hence `G ∩ pA ≤ ker(G → ∏ C_i) = pG` by (a); so `G ∩ pA = pG`. With
(b), p-saturated by the characterisation in p-saturated. Practical form (Siksek §4.1): include free
generators and a basis of the torsion modulo p; the p-divisible relation space `V_p` lies in every
kernel of the finite reduction maps. If their joint kernel is zero, `V_p=0`. General p-primary
reduction groups are handled by `B_q/pB_q`, not by assuming `p²∤#B_q`. For `p = 2` and `μ`: Tau Ceti
`ker_μ_eq` gives ker `μ = 2E(ℚ)`, so injectivity of G/2G `→ M` is decided in the explicit square classes.

**Checks.**

- Flynn–Poonen–Schaefer Lemma 6: `G = ⟨D⟩ ≤ J(ℚ), p = 3, ψ` the reduction `J(ℚ) → J(𝔽₃) ≅ ℤ/9` followed by `J(𝔽₃)/3J(𝔽₃)`; D̃ `∉ 3J(𝔽₃)` and `J(ℚ)[3] = 0`, so `⟨D⟩` is 3-saturated.
- Poonen 1995 Proposition 2: `J(𝔽₃) ≅ ℤ/27` generated by D̃, giving 3-saturation of `⟨[∞⁺ − ∞⁻]⟩`.

([Siksek (1995 author preprint)](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf),
Author preprint, §4.1, pp.17–18, `V_p` and equation(40); [Flynn–Poonen–Schaefer (arXiv
v1)](https://arxiv.org/abs/math/9508211), §8, proof of Lemma 6, p. 19 (arXiv v1).)

*Needs:* §3.17; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; EllipticCurves Layer 4 (local reduction and formal groups); EllipticCurves Layer 3 (finite fields and Hasse bound); HeightsRationalPointsAndObstructions Layer 1.

### 3.19 Rank lower bound from reductions

Let A be a finitely generated abelian group, `G ≤` A, ℓ a prime and `ψ_i : A → C_i` homomorphisms with
`ℓC_i = 0`. If the image of `G` in `∏_i C_i` has `𝔽_ℓ-dimension k`, then `rank G ≥ k − dim_{𝔽_ℓ} A[ℓ]`; in
particular rank A `≥ k` when `A[ℓ] = 0`. If moreover `A_tors = 0` (torsion-by-reduction) and `G` is
generated by m elements satisfying m − k independent explicit relations (so `rank G ≤ k`), then `G ≅ ℤ^k`.

Work under the following conditions. A finitely generated abelian (`E(ℚ)`, or `J(ℚ)` by the HeightsRationalPointsAndObstructions Layer 1
contract); `ψ_i` from reductions as in saturation-datum.

For the proof, `dim_{𝔽_ℓ} G/ℓG = rank G + dim_{𝔽_ℓ} G[ℓ] ≤ rank G + dim A[ℓ]` (structure of finitely
generated abelian groups). G/ℓG surjects onto the image of `G` in `∏ C_i`, so dim G/ℓG `≥ k`.

**Checks.**

- Stoll 2008 Lemma 4: the degree-0 subgroup of `⊕ℤP_i` maps onto `(ℤ/3)³` in `∏_{q∈{3,5,7,11,13}} Pic(C/𝔽_q), J(ℚ)` is torsion-free, so `rank G ≥ 3`; six explicit relations give `rank G ≤ 3`.

([Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3, proof of Lemma 4, p. 8 (arXiv v2).)

*Needs:* §3.17; HeightsRationalPointsAndObstructions Layer 1; Mathlib `Module.finrank`.

### 3.20 Exact torsion subgroups

(a) Let A be an abelian group and, for primes `q₁,…,q_k, ρ_i : A → B_i` homomorphisms into finite
groups that are injective on torsion of order prime to `q_i`. Then for every prime ℓ, `v_ℓ(#A_tors) ≤ min{v_ℓ(#B_i) : q_i ≠ ℓ}`; if an explicit finite subgroup `T₀ ≤ A_tors` attains these bounds for all ℓ,
then `A_tors = T₀`. (b) For `E/ℚ` in the model `y² = x³ + ax² + bx + c` (a `= b₂, b = 8b₄, c = 16b₆`,
integral), every torsion point has `x, y ∈ ℤ` and `y = 0` or `y² | Δ₀ = 27c² + 4a³c + 4b³ − a²b² − 18abc`;
the finite subset of these candidates killed by the good-reduction group order is `E(ℚ)_tors` exactly by Lutz–Nagell and the reduction exponent criterion.
Reduction at good odd q is injective on `E(ℚ)_tors` (EllipticCurves Layer 6); for Jacobians of curves
over `ℚ` with good reduction at q, reduction is injective on torsion of order prime to q, and on all
torsion for `q ≥ 3` (supplied by HeightsRationalPointsAndObstructions Layer 1).

Work under the following conditions. (a) A abelian, `B_i` finite, and for every prime ℓ there is at
least one i with `q_i ≠` ℓ; this makes each displayed minimum nonempty and bounds every primary
torsion subgroup. `(b) W` over `ℚ` elliptic, coefficients integral.

For the proof, (a) The ℓ-primary part of `A_tors` embeds into `B_i` whenever `q_i ≠` ℓ
`(Subgroup.card_dvd_of_injective)`. (b) Lutz–Nagell (Cremona Prop. `3.3.1`) and Prop. `3.3.2`: if `2P = O`
then `y = 0`; otherwise `P` and 2P are integral and the tangent slope is integral, so `y | f′(x)` and `y² | Δ₀` by the displayed identity. Choose a good odd prime q and a complete finite reduction group of
order `M`. Its torsion injectivity shows that every rational torsion point is killed by `M`. A candidate is torsion exactly when [M]P `= O`; its order is the least positive divisor
of `M` killing it. This finite cutoff uses the stated reduction
contract; no rational torsion classification is required.

**Checks.**

- Flynn–Poonen–Schaefer Prop. 6: `#J(𝔽₃) = 9, #J(𝔽₅) = 41`, so `J(ℚ)_tors = 0`.
- Stoll Lemma `4(1): #J(𝔽₇) = 2·7·11·47, #J(𝔽₁₃) = 3·17·23·43`, so `J(ℚ)_tors = 0`.
- E11 : `y² + y = x³ − x²`: the torsion-candidate characterization on `y² = x³ − 4x² + 16` finds exactly four nonzero torsion points, all of order 5, so `E(ℚ)_tors ≅ ℤ/5`.
- For `y²=x³−4x+1`, the good reduction groups at 3 and 5 have orders 7 and 9, so rational torsion is trivial. The integral point `(0,1)` satisfies the candidate divisibility test but is rejected: its reduction modulo 5 has order 9 and [7]`(0,1)=(4,3)` there. Candidate integrality alone cannot certify torsion.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.3,
Propositions 3.3.1–3.3.2, pp. 69–70; [Flynn–Poonen–Schaefer (arXiv
v1)](https://arxiv.org/abs/math/9508211), §7, Proposition 6, p. 15 (arXiv v1); [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §3, proof of Lemma 4, p. 8 (arXiv v2).)

*Needs:* Mathlib `Subgroup.card_dvd_of_injective`; EllipticCurves Layer 6 (Mordell–Weil); HeightsRationalPointsAndObstructions Layer 1.

### 3.21 Exact finite-index subgroup of a Mordell–Weil group

Let A be a finitely generated abelian group (A `= J(ℚ)` for the Jacobian `J` of a smooth proper curve
over `ℚ` with a rational point, finite generation from HeightsRationalPointsAndObstructions Layer 1; or A `= E(ℚ)`) and `Π` a finite set of
primes. A finite-index subgroup datum (FiniteIndexSubgroupData A `Π`) consists of:
generators `g₁,…,g_s ∈` A of `G = ⟨g_i⟩`; a natural number r with a datum of rank A `≤ r` (an
algebraic descent bound: rank-upper-bound, two-isogeny-rank-bound or genus-two-descent-rank-bound)
and a datum of `rank G ≥ r` (regulator-lower-bound or reduction-rank-lower-bound); the torsion
subgroup `A_tors` as an explicit finite list (torsion-by-reduction); and for each `p ∈ Π` a p-saturation
datum for `G` (saturation-datum). Consequences: `rank G = rank A = r, [A : G`] is finite and
coprime to every `p ∈ Π`. A rank upper bound that rests on an unproved hypothesis (for instance the
Birch–Swinnerton-Dyer conjecture) is not a field of the datum: a theorem using it states the
hypothesis rank A `≤ r` explicitly.

Work under the following conditions. A an additive commutative group with `AddGroup.FG A; Π` a finite
set of primes.

The interface includes these statements.

- `G = AddSubgroup.closure` (range g).
- `Module.finrank ℤ A = r`.
- `G.FiniteIndex`.
- For `p ∈ Π, Nat.Coprime G.index p`.
- The listed torsion is exactly the set of a `∈` A of finite order.
- `Nat.Coprime G.index N` for `N` a product of primes of `Π`: the hypothesis of §5.8.
- A Mordell–Weil basis datum gives a datum with `G =` A for every `Π`.

For the proof, Finite index: `rank G = rank` A for a subgroup of a finitely generated abelian group
`(Module.finrank ℤ)` gives A/G finite. Coprimality: p-saturated with finite index ⇔ `p ∤` [A:G]
(p-saturated).

**Checks.**

- For `C₀(5): G = ⟨[∞⁺ − ∞⁻]⟩, r = 1, Π = {3}; coprime_index` gives `3 ∤ [J(ℚ):G]`.
- If `r = 0` and `G = A_tors` then `G =` A and the datum holds for every `Π`.
- If `Π` contains every prime `≤ N` and [A:G] `≤ N` then `G =` A, the Mordell–Weil basis datum.
- Independent points `P₁,…,P_r` without a rank upper bound do not give a datum: for Stoll's `X₀^dyn(6), G ≅ ℤ³` is exact but `rank J(ℚ) ≤ 3` is only conditional, so finite index is not exact.
- Flynn–Poonen–Schaefer: A `= J(ℚ)` for `C₀(5), G = ⟨[∞⁺ − ∞⁻]⟩, r = 1, A_tors = 0, Π = {3}`.
- Rank-zero elliptic curves: `G = E(ℚ)_tors, r = 0`, any finite set `Π` of primes (`G =` A).

([Samir Siksek](https://arxiv.org/abs/1010.2603), §5, p. 10 (arXiv:1010.2603v2); [Samir
Siksek](https://arxiv.org/abs/1010.2603), §5, pp. 10–11 (arXiv:1010.2603v2); [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §1, p. 2 (arXiv v2).)

*Needs:* §3.7; §3.11; §3.23; §3.14; §3.19; §3.20; §3.18; §3.17; HeightsRationalPointsAndObstructions Layer 1; JacobianChallenge Layer `D` (relative Picard and Jacobian).

### 3.22 Exact Mordell–Weil basis

The headline statement is `ED3.mordellWeil_basis_of_height_and_saturation`
in `Suggested.lean`. It uses `ED3.mordellWeilSubgroup` for the subgroup generated
by the complete torsion list and the proposed points. For positive rank it
concludes that this is the full group, that the points give a basis of the native
points modulo torsion, and that their Gram determinant is the native regulator.
The rank-zero case uses the complete torsion list as specified below.

Let `W` over `ℚ` be elliptic (any Weierstrass model: integrality of the coefficients is not needed
here, it enters only through §§3.12 and 3.15 where `λ` and `R⁺` are computed), `T = E(ℚ)_tors` exact (torsion-by-reduction),
and `P₁,…,P_r ∈ E(ℚ)`. Assume: `(i) rank E(ℚ) ≤ r` (rank-upper-bound or two-isogeny-rank-bound); `(ii) det(⟨P_i, P_j⟩) ≥ δ > 0` (regulator-lower-bound); (iii) `λ > 0` with ĥ `≥ λ` on non-torsion points
(height-lower-bound-by-search) and `N = ⌊R⁺^{1/2}(γ_r/λ)^{r/2}⌋` with R⁺ an upper endpoint for
`det(⟨P_i,P_j⟩)` (index-bound); `(iv) G = ⟨T, P₁,…,P_r⟩` is p-saturated in `E(ℚ)` for every prime `p ≤ N`
(saturation-datum). Then `E(ℚ) = G = T ⊕ ℤP₁ ⊕ … ⊕ ℤP_r, rank E(ℚ) = r` and `regulator(E) = det(⟨P_i, P_j⟩)`. The four inputs are each required: the conclusion combines an upper and a lower
bound only when both data exist. For `r=0`, use the algebraic rank bound and complete torsion
directly; the positive-dimensional index formula and `γ_r` are required only for `r≥1`.

Work under the following conditions. As listed; `T` given as an explicit finite set of points.

For the proof, (i) and (ii) give `rank E(ℚ) = r` and finite index of `G`
(finite-index-subgroup-datum). [`E(ℚ) : G] = [E(ℚ)/T : L] ≤ N` by index-bound, since `G ⊇ T`. A
prime p dividing `[E(ℚ):G]` satisfies `p ≤ N` and contradicts p-saturation (p-saturated: finite index
and p-saturated `⇒ p ∤` index); so the index is 1. The regulator is `|det|` on a basis (Tau Ceti
`regulator_eq_abs_det_neronTateGramMatrix`).

**Checks.**

- `y² = x³ − x: r = 0, T = E[2], G = T = E(ℚ)` (index bound vacuous).
- Cremona's rank-one strategy `(§3.5)` is the case `r = 1`: if `λ >` R⁺/4, with `R⁺ ≥ ĥ(P₁)` the upper endpoint used in (iii), then `N = 1` and `P₁` generates `E(ℚ)` modulo torsion.

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.5, p. 75;
[Siksek (1995 author preprint)](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf),
Author preprint, §4 opening, p.17, finite prime/index criterion.)

*Needs:* §3.21; §3.16; §3.18; §3.14; §3.7; §3.20; Tau Ceti `WeierstrassCurve.Affine.regulator_eq_abs_det_neronTateGramMatrix`; Tau Ceti `WeierstrassCurve.Affine.regulator`; §3.11.

### 3.23 Rank bound for genus-two Jacobians by the `x − T` descent

Conditional on the explicit arithmetic-input hypotheses listed below, let `C : y² = f(x)` with `f ∈ ℤ[x]` separable of degree `6, C(ℚ) ≠ ∅, J` its Jacobian, `L = ℚ[T]/(f)` and `L_K = K[T]/(f)` for `K = ℚ` or
`ℚ_v`. (a) The map `x − T` sending the class of a good divisor `Σ n_P P` to `Π (x_P − T)^{n_P}` is a
well-defined homomorphism `J(K) → L_K^×/(L_K^{×2}K^×)` with image in the kernel of the norm to
`K^×/K^{×2}`; (b) for `S ⊇ {2, ∞} ∪ {p | disc f}`, the image of `J(ℚ)` lies in the subgroup `H` of classes
unramified outside `S` with square norm, and in `H′ = {h ∈ H : the image of h in L_p^×/(L_p^{×2}ℚ_p^×)`
`lies in (x − T)(J(ℚ_p)) for all p ∈ S}; (c) [ker(x − T) : 2J(K)] = 1` if f has a root in `K` or the six
roots admit a `Gal(K^sep/K)-stable` partition into two unordered triples, and 2 otherwise; `(d) #J(ℚ_p)/2J(ℚ_p) = |2|_p^{-2}·#J(ℚ_p)[2]`. Hence `rank J(ℚ) ≤ dim_{𝔽₂} H′ + log₂[ker(x − T) : 2J(ℚ)] − dim_{𝔽₂} J(ℚ)[2`].

Work under the following conditions. `C, J` as stated; `J(ℚ)` finitely generated (HeightsRationalPointsAndObstructions Layer 1 contract); local
images `(x − T)(J(ℚ_p))` exact by the method of local-descent-image. Their required image order
is `|2|_p^{-2}·#J(ℚ_p)[2]/c_p`, where `c_p=[ker(x−T):2J(ℚ_p)]` is computed by (c); the count (d)
alone is the order of the larger quotient `J(ℚ_p)/2J(ℚ_p)`. At the real place use the corresponding
real quotient and kernel count, with the same division by `c_∞`. The finite
class/unit presentation used by the descent is supplied with exact basis/ideal relations and a proof
of full generation; the theorem deduces the rank bound from these inputs and local images.

For the proof, (a) Flynn–Poonen–Schaefer Prop. 2 (linear equivalence changes the value by squares
times constants; the norm is a square). (b) Prop. 3 and diagram (6). (c) Prop. 5: `ker(x − T)/2J(K)`
is generated by `[2P − ∞⁺ − ∞⁻]`; it lies in `2J(K)` iff one of its 16 halves is K-rational, which is
the stated Galois condition. (d) multiplication by 2 is n-to-1 on `J(ℚ_p)` and multiplies Haar measure
by `|2|_p^2` (Lemma 3); the Lie-group structure is the HeightsRationalPointsAndObstructions Layer 1 contract. `#J(ℚ)/2J(ℚ) = 2^{rank}·#J(ℚ)[2] ≤ #H′·[ker : 2J(ℚ)`].

**Checks.**

- `C₀(5)` (fps-genus-two-mordell-weil): `H′ = 0` and [ker : `2J(ℚ)] = 2`, so `rank J(ℚ) ≤ 1`.

([Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §5, Proposition 2, p. 10
(arXiv v1); [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §5, Proposition
5, p. 12 (arXiv v1); [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §7,
proof of Lemma 3, p. 16 (arXiv v1).)

*Needs:* §3.2; §3.5; JacobianChallenge Layer `D` (relative Picard and Jacobian); HeightsRationalPointsAndObstructions Layer 1.

### 3.24 The Lind–Reichardt curve: a nontrivial torsor class

Under the explicit arithmetic-data hypotheses below, the genus-one curve `C : 2z² = x⁴ − 17y⁴`
(equivalently `U² − 17W² = 2Z², UW = V²`, or `v² = 2u⁴ − 34` with `v = 2z/y², u =` x/y) has points over `ℝ`
and over every `ℚ_p` but no rational point. In the 2-isogeny descent for `E : y² = x³ − 68x (c = 0, d = −68), C` is the homogeneous space `H(2, 0, −34)`; hence the class `2 ∈ ℚ^×/ℚ^{×2}` lies in the `φ′-Selmer`
group `S^{(φ′)}` but not in `α(E(ℚ))`. The quartic's invariants are `I = 12·2·(−34) = −816` and `J = 0`, so
its Jacobian is `Y² = X³ + 22032X ≅ y² = x³ + 17x (22032 = 6⁴·17)`, the curve E′ : `y² = x³ + 272x` up
to isomorphism; under the HeightsRationalPointsAndObstructions Layer 1 identification of `S^{(φ′)}/α(E(ℚ))` with `Ш(E′/ℚ)[φ′], C` is a nonzero
element of `Ш(E′/ℚ)[2]`.

Work under the following conditions. Places: `∞, 2` and 17 are the only places where local solubility
needs a computation (quartic-local-solubility-correct). Supply the finite local lifting witnesses
`at2,17,∞` and the exact residue fourth-power table mod17 (or invoke the cited conic theorem instead).
Verify them as finite identities. Prove global insolubility by the quartic-residue obstruction, not
by assuming a missing rational point list.

For the proof, Local solubility: `2u⁴ − 34` is locally soluble (§3.8) at `v ∈ {2, 17, ∞}`
(exact run of quartic-local-solubility); Aitken–Lemmermeyer Theorem 4 with `q = 17, d = 2` proves
the same by conics. No global point: Aitken–Lemmermeyer Lemma 6 — a nontrivial solution forces 2 to
be a fourth power modulo 17, but the fourth powers modulo 17 are `{1, 4, 13, 16}`. Descent reading:
`H(d₁, c, d/d₁)` with `d₁ = 2, c = 0, d = −68` is `v² = 2u⁴ − 34` (two-isogeny-descent-map); everywhere
local solubility puts 2 in `S^{(φ′)}`, the absence of rational points keeps it out of `α(E(ℚ))`.
Jacobian: Cremona `(3.6.3), E_{I,J} : Y² = X³ − 27IX − 27J` with `I = 12ae − 3bd + c², J = 72ace + 9bcd − 27ad² − 27eb² − 2c³` for (a,b,c,d,e) `= (2,0,0,0,−34)`.

**Checks.**

- The curve passes the exact local tests at 2, 17 and `∞`, and the `φ′-Selmer` computation for `c = 0, d = −68` returns `n₂ = 8` (all classes `±1, ±2, ±17, ±34`), while `α(E(ℚ))` omits 2.
- The torsor class is labelled as an element of the explicit Selmer group; its Ш reading uses the cohomological identification supplied by HeightsRationalPointsAndObstructions Layer 1, not an assumption.

([W. Aitken, F. Lemmermeyer](https://arxiv.org/abs/1108.6310), §6, Example 3, p. 12 (arXiv v1); [W.
Aitken, F. Lemmermeyer](https://arxiv.org/abs/1108.6310), §7, Lemma 11, p. 14 (arXiv v1); [W.
Aitken, F. Lemmermeyer](https://arxiv.org/abs/1108.6310), Appendix B, pp. 16–17 (arXiv v1); [Cremona
(1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 79.)

*Needs:* §3.10; §3.9; HeightsRationalPointsAndObstructions Layer 1; EllipticCurves Layer 7 (Selmer groups and Sha).

### 3.25 Descent via 2-isogeny on Fermigier's rank-13 curve

Given the explicit local and point data below, for `E : y² = x(x² + cx + d)` with `c = 36861504658225`
and `d = 1807580157674409809510400 = 2¹⁵·3⁴·5²·7²·17·23·29·41·103·113·127·809`, and `d′ = c² − 4d = 1351540205037645734822109025 = 5²·11²·17·23·29·41·113·127·449·1381·5003·21587`: the exact local
tests at the 17 primes dividing 2dd′ and at `∞` give `n₂ = 256` and `n₂′ = 128`, so `rank E(ℚ) ≤ 8 + 7 − 2 = 13` (exact upper bound). Cremona reports explicit rational points on 7 + 6 nontrivial
homogeneous spaces, giving `n₁ = 256, n₁′ = 128` and `rank E(ℚ) = 13`; the lower bound requires those
points.

Work under the following conditions. Upper bound: two-isogeny-rank-bound with
quartic-local-solubility; lower bound: rational points on `H(d₁, c, d/d₁)` for 7 values `d₁` and on
`H(d₁′, c′, d′/d₁′)` for 6 values `d₁′`. Supply the complete signed-squareclass divisor lists and
local-solubility verdict tables at the stated primes `and∞`, with finite p-adic lifting/nonexistence
witnesses and exact F2-subgroup matrix identities. Verify the local witnesses and compute the
subgroup dimensions8 and7; do not assume `rank≤13`. For equality supply the actual7+6 rational
homogeneous-space point coordinates and checked membership/independence data, never a reported rank
or LMFDB label alone.

For the proof, Factorisations of d and d′ (exact; checked by multiplication). Verify the supplied
finite local witnesses on the exhaustive signed-divisor lists and the exact F2-linear algebra;
deduce the counts256 and128 and apply two-isogeny-rank-bound. Cremona's group-structure bookkeeping
(`A₂` generated by found classes) reduces the searches to 7 + 6 spaces.

**Checks.**

- The exact local tests give `n₂ = 256` and `n₂′ = 128`, hence `rank E(ℚ) ≤ 13`.
- The equality `rank = 13` is stated only with the 13 explicit points supplied (with membership and independence data).

([Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 86;
[Cremona (1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, p. 87.)

*Needs:* §3.11; §3.9.

### 3.26 Rank-zero elliptic curves of small conductor, with their rational points

Under the explicit arithmetic-data hypotheses below, each of the following curves has `E(ℚ)` finite,
equal to the listed points: E15 : `y² + xy + y = x³ + x², E(ℚ) = {O, (0,0), (−1,0), (0,−1)} ≅ ℤ/4`;
E17 : `y² + xy + y = x³ − x² − x, {O, (0,0), (1,−1), (0,−1)} ≅ ℤ/4; E24 : y² = x³ − x² + x, {O, (0,0), (1,1), (1,−1)} ≅ ℤ/4; E40 : y² = x³ − 2x + 1, {O, (0,±1), (1,0)} ≅ ℤ/4`; Morton's `Y² = 4X³ − 11X² + 8X, {∞, (0,0), (1,±1), (2,±2)} ≅ ℤ/6`. What is exact and how: rank 0 by
two-isogeny-rank-bound with `n₂n₂′ = 4` — in the shape `y² = x(x² + cx + d)` the data are `(c, d) = (−7, 16), (9, 16), (−1, 1), (3, 1), (−11, 32)` with `(n₂, n₂′) = (1,4), (2,2), (1,4), (2,2), (2,2)` — and
the torsion subgroup by torsion-by-reduction (b), which finds exactly the listed points. For E11 :
`y² + y = x³ − x²` the torsion subgroup `{O, (0,0), (0,−1), (1,0), (1,−1)} ≅ ℤ/5` is exact, but its
rank 0 is not (no rational 2-torsion, so a full 2-descent over the cubic field of `x³ − 4x² + 16` is
needed; its rank-zero statement therefore requires a separate explicit rank datum).

Work under the following conditions. Models: E15, E17 via `s₂ = a₁² + 4a₂, s₄ = 8(a₁a₃ + 2a₄), s₆ = 16(a₃² + 4a₆)` and the integral root `x₀ (−4`, resp. 4) of `x³ + s₂x² + s₄x + s₆` (Cremona's pseudocode);
E24 directly; E40 after `x ↦ x + 1`; Morton's curve via `x = 4X, y = 4Y`. Supply the exact coordinate
changes, full signed-divisor/local-witness tables and F2-image matrices for the five stated
two-isogeny descents, plus the complete finite torsion-candidate and reduction tables. Their local
correctness, exhaustive coverage and geometric compatibility are explicit hypotheses. Verify the
tables and deduce rank0 and point-list completeness; a curve label or reported rank is not a
substitute.

For the proof, For each curve, two-isogeny-rank-bound with the exact local tests at the primes
of 2dd′ (`{2,3,5}, {2,17}, {2,3}, {2,5}, {2,7}`) and `∞` gives `rank ≤ e₂ + e₂′ − 2 = 0`. Torsion:
The finite torsion-candidate characterization on `y² = x³ + b₂x² + 8b₄x + 16b₆` lists the integral points with `y = 0` or `y² | Δ₀`
and their orders; the result has 4, 4, 4, 4, 6 elements, matching the lists. Transport of the lists
back to the given models by the explicit coordinate changes.

**Checks.**

- For the five two-isogeny models the checked tables imply rank zero and exact rational-point lists. E11 requires its separate rank datum; the genus-two applications use §3.27–§3.29.
- Poonen prints `E24(ℚ)` with `(−1, 1)`, which is not on the curve; the corrected list `(1, −1)` is used.

([Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §1, p. 4 (arXiv:math/9512217v1); [Poonen
(arXiv v1)](https://arxiv.org/abs/math/9512217v1), §3, pp. 10–11 (arXiv:math/9512217v1); [Cremona
(1997)](https://johncremona.github.io/book/fulltext/index.html), Ch. III, §3.6, pseudocode
'Algorithm for computing rank: rational 2-torsion case', p. 87.)

*Needs:* §3.11; §3.20; §3.21.

### 3.27 Mordell–Weil group of the Jacobian of `C₀(5)` (Flynn–Poonen–Schaefer)

Under the explicit arithmetic-data hypotheses below, for `C₀(5) : y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` with Jacobian `J: J(ℚ) ≅ ℤ`, and `D = [∞⁺ − ∞⁻]` generates a subgroup of index prime to 3. As a
finite-index-subgroup-datum with `Π = {3}`: generators `{D}; r = 1; J(ℚ)_tors = 0; ⟨D⟩`
3-saturated. Exact ingredients: (i) torsion: `#J(𝔽₃) = 9, #J(𝔽₅) = 41; (ii) rank ≤ 1`:
genus-two-descent-rank-bound with `S = {2, 3701, ∞}, L` of class number 1 with units `u₁, u₂, u₃`
(explicit supplied class/unit/factorization data datum), `H` spanned by `u₁` and `u₃β₁β₂`, local
images at 2 and 3701 generated by `[(2, √881) − ∞⁻]` and `[(−4, √185) − ∞⁻], H′ = 0`, and [`ker(x − T)` :
`2J(ℚ)] = 2` because the Galois group of f is `S₆`; (iii) `rank ≥ 1: D ≠ 0` and `J(ℚ)_tors = 0`; (iv)
3-saturation: `J(𝔽₃) ≅ ℤ/9` is generated by D̃, so D̃ `∉ 3J(𝔽₃)`.

Work under the following conditions. `J(ℚ)` finitely generated (HeightsRationalPointsAndObstructions Layer 1 contract); reduction at 3 and 5
(HeightsRationalPointsAndObstructions Layer 1 contract). Supply the exact finite groups `J(F3),J(F5)`, their full divisor-class tables and
reduction identifications, the6-degree field/integral-basis/class/full-unit and prime-factorization
data with generation/completeness identities, and the local2-descent image tables with lifting
witnesses. Supply the finite Galois identification and D-reduction coordinates. These are inputs to
the descent/torsion/saturation theorems; their numerical production is not targeted.

For the proof, (i) torsion-by-reduction (a) with `q = 3, 5`. (ii) Lemmas 1–5 and Theorem 3 of
Flynn–Poonen–Schaefer, each step an instance of genus-two-descent-rank-bound; `f(2) = 881 ≡ 1` mod 8
and `(185/3701) = 1` certify the local points. (iii)–(iv) saturation-datum with the single map
`J(ℚ) → J(𝔽₃)/3J(𝔽₃)`. The number-field data (class number, units, factorisations of 2 and 3701) were
verified unconditionally per the source; in the datum they are explicit supplied
class/unit/factorization data class-and-unit data.

**Checks.**

- `J(ℚ) ≅ ℤ` and the index of `⟨D⟩` is prime to 3; the 3-adic annihilator is therefore unchanged on replacing `J(ℚ)` by `⟨D⟩`. This conclusion does not assert that `D` is a generator.

([Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §7, Theorem 3 and proof, p.
18 (arXiv v1); [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §8, Lemma 6,
p. 19 (arXiv v1); [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §1, p. 3
(arXiv v1).)

*Needs:* §3.23; §3.20; §3.18; §3.21.

### 3.28 Mordell–Weil data for the Jacobian of `C₁(3₂)` (Poonen)

Under the explicit arithmetic-data hypotheses below, for `C : y² = g(x) = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1` with Jacobian `J: J(ℚ)_tors = 0 (#J(𝔽₃) = 27, #J(𝔽₅) = 43), D = [∞⁺ − ∞⁻]` has infinite order `(rank J(ℚ) ≥ 1)`, and `D ∉ 3J(ℚ)` because `J(𝔽₃) ≅ ℤ/27` is generated by D̃. The rank upper bound `rank J(ℚ) ≤ 1`, which would make `⟨D⟩` a finite-index subgroup of index prime to 3, is not exact: the printed
proof uses a 743-adic point `(2, √33)`, but `g(2) = 73` and the point on `C` is `(−2, √33)`; the author's
erratum states that the 2-adic information is needed and that the result is unchanged, without
printing the corrected computation.

Work under the following conditions. `J(ℚ)` finitely generated and reduction at 3, 5 (HeightsRationalPointsAndObstructions Layer 1 contract).
Supply exact finite `J(F3),J(F5)` groups, their complete divisor/reduction tables and D-reduction
coordinates with geometric compatibility. The corrected2/743-adic descent tables are additional
explicit inputs for any rank-upper-bound conclusion, not supplied by the invalid printed point;
without them retain only the torsion/lower-bound/saturation conclusions.

For the proof, Torsion and `rank ≥ 1`: torsion-by-reduction (a). 3-saturation of `⟨D⟩`:
saturation-datum with `J(ℚ) → J(𝔽₃)/3J(𝔽₃)`. Upper bound: genus-two-descent-rank-bound with `S = {2, 743, ∞}` and the corrected local data at 743 and 2; this computation is an additional explicit
input.

**Checks.**

- `g(2) = 73` and `g(−2) = 33`, and `(73/743) = −1`, so the printed local point is not even a 743-adic point (checked by exact arithmetic).
- The reduction and saturation calculations are unconditional; `rank J(ℚ) ≤ 1` remains an explicit hypothesis for the finite-index conclusion.

([Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §4, proof of Proposition 1, p. 13
(arXiv:math/9512217v1); [Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §4, proof of
Proposition 2, p. 16 (arXiv:math/9512217v1); [Bjorn
Poonen](https://math.mit.edu/~poonen/papers/errata.pdf), §2, first item on the 1995/1998 paper, p.
1.)

*Needs:* §3.23; §3.20; §3.18.

### 3.29 The subgroup of known points on `X₀^dyn(6)`, with the conditional rank input labelled

Under the explicit arithmetic-data hypotheses below, let `C = X₀^dyn(6)` (genus 4, model `G(u,w) = 0` in
`ℙ¹ × ℙ¹`) with Jacobian `J` and ten known rational points `P₀,…,P₉`. Exact (algebraic): `J(ℚ)_tors = 0 (#J(𝔽₇) = 2·7·11·47, #J(𝔽₁₃) = 3·17·23·43)`, and the subgroup `G` generated by the classes of degree-0
divisors supported on `P₀,…,P₉` is `≅ ℤ³` (lower bound: reduction-rank-lower-bound with ℓ `= 3` and `S = {3,5,7,11,13}`; upper bound: six explicit linear equivalences). Conditional (analytic, labelled
separately): if `L(J, s)` extends to an entire function with the standard functional equation, the
weak Birch–Swinnerton-Dyer conjecture holds for `J`, and L‴(J,1) `≠ 0` is exact, then `rank J(ℚ) ≤ 3`.
Stoll reports L‴(C,1) ≈ `0.83601` numerically and L,L′,L″ vanishing to working precision; these
approximations alone are not a proof of the additional nonvanishing hypothesis. Under the hypothesis
`rank J(ℚ) = 3, G` has finite index and `J(ℚ)` is the saturation Ḡ of `G`; Stoll's Chabauty step uses Ḡ
directly, so no p-saturation datum is needed or provided by the source.

Work under the following conditions. Hypothesis for the conditional part, stated explicitly and
never as a datum field: `rank J(ℚ) ≤ 3`. An analytic derivation of `rank≤3` additionally requires
an exact `L‴(J,1)≠0`, hence analytic `order≤3`; numerical vanishing of lower derivatives is not
needed for this upper bound and is not exact here. Supply the exact finite Picard/reduction
groups and point images at3,5,7,11,13, full order tables, the relation matrices and the actual
rational functions proving the six divisor equivalences. An analytic rank bound additionally assumes
an identified third-derivative enclosure excluding0, analytic continuation/functional equation and
weak BSD. Local-group and L-value tables are explicit hypotheses.

For the proof, Torsion: torsion-by-reduction (a) with `q = 7, 13`. `rank G ≥ 3`: the degree-0 part of
`⊕ℤP_i` surjects onto `(ℤ/3)³` in `∏_{q ∈ S} Pic(C/𝔽_q); rank G ≤ 3`: the six relations (`e.g`. `P₀ + P₆ + P₈ ∼ P₁ + P₇ + P₉`), each exact by an explicit rational function. Conditional rank: Stoll §4 and
Theorem 7; the numerical L-value is not an exact enclosure and the hypotheses are open, so this
input never enters a FiniteIndexSubgroupData.

**Checks.**

- The exact subgroup `G` is isomorphic to `ℤ³`; its finite index and `J(ℚ) =` Ḡ require the stated rank-three hypothesis.
- The algebraic subgroup conclusion holds with the supplied exact reduction and relation data; finite index additionally requires `rank J(ℚ)≤3`.

([Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3, Lemma 4, pp. 7–8 (arXiv v2); [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §4, pp. 12–13 (arXiv v2); [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §1, p. 2 (arXiv v2).)

*Needs:* §3.19; §3.20; §3.21; JacobianChallenge Layer `D` (relative Picard and Jacobian).

### Examples

The curve `y²=x³−x` distinguishes the four actual two-torsion images from the larger unconditioned
norm kernel. The curve 571a1 distinguishes the descent image from the 2-Selmer group. The
Lind–Reichardt quartic distinguishes everywhere local solubility from a rational point.

### Dependencies

Layers 0–2; HeightsRationalPointsAndObstructions Layers 0–1; `TauCetiRoadmap.EllipticCurves` Layers
3,4,6,7 and JacobianChallenge Layers D–F. The pinned elliptic height and descent APIs are used with
their exact conventions.

## Layer 4: Chabauty–Coleman and residue discs

Work with actual smooth curves, Jacobians, regular differentials and their p-adic topology. Finite
coefficient and root witnesses become global completeness results only after these geometric
comparisons.

### 4.1 Good-reduction Chabauty datum: curve, base point, smooth model and residue discs

A good-reduction Chabauty datum (`X, O, p`, 𝒳) consists of a smooth projective geometrically integral
curve `X` over `ℚ` of genus `g ≥ 1`, given by explicit equations; a rational point `O ∈ X(ℚ)`; a prime p;
and a smooth projective curve 𝒳 `→ Spec ℤ_p` with geometrically connected fibres together with an
isomorphism `𝒳_{ℚ_p} ≅ X_{ℚ_p}`. Derived data, fixed by the definition: (i) the special fibre X̃ `:= 𝒳_{𝔽_p}`, a smooth projective geometrically integral curve of genus g over `𝔽_p`, and `X̃(𝔽_p)` its
finite set of rational points; (ii) the reduction map red : `X(ℚ_p) = 𝒳(ℤ_p) → X̃(𝔽_p)` (the equality
by the valuative criterion of properness), surjective by Hensel's lemma; (iii) for x̃ `∈ X̃(𝔽_p)` the
residue disc `D(x̃) := red⁻¹(x̃) ⊆ X(ℚ_p)`, and a local parameter `t_x̃`, a function regular on a
Zariski neighbourhood of x̃ in 𝒳 whose restriction to X̃ is a uniformiser at x̃; `t_x̃` maps `D(x̃)`
bijectively onto `pℤ_p` and, for every finite extension `K/ℚ_p`, the points of `𝒳(O_K)` reducing to x̃
bijectively onto the maximal ideal `m_K`, the coordinates of the inverse being power series with
`ℤ_p-coefficients`; (iv) the Jacobian `J` of `X` with the Abel–Jacobi embedding `ι_O : X → J, P ↦ [P − O]`;
(v) the relative Jacobian 𝒥 `:= Pic⁰_{𝒳/ℤ_p}`, an abelian scheme with `𝒥_{ℚ_p} ≅ J_{ℚ_p}` and special
fibre J̃ `= Jac(X̃)`, and the reduction map `red_J : J(ℚ_p) = 𝒥(ℤ_p) → J̃(𝔽_p)` with `red_J` ∘ `ι_O = ι_Õ` ∘
red; its kernel is `J¹(ℚ_p)`; (vi) the good-reduction pair (𝒳, Ō) of ColemanIntegration, Ō the closure
of `O`, a section of 𝒳 `→ Spec ℤ_p` and hence finite étale of degree one. The same definition is made
over the ring of integers `O_v` of a completion `K_v` of a number field `K` at a finite place v, with `𝔽_p`
replaced by the residue field `k_v` and `pℤ_p` by the maximal ideal of `O_v`.

Work under the following conditions. `X` smooth, projective, geometrically integral over `ℚ` (or over a
number field `K`), genus `g ≥ 1; O ∈ X(ℚ)`. 𝒳 smooth and projective over `ℤ_p` (resp. `O_v`) with generic
fibre identified with `X_{ℚ_p}` (resp. `X_{K_v}`); this is the meaning of 'p is a prime of good
reduction' throughout `ED.4`. Points of X̃ are taken over `𝔽_p` unless a finite extension is named;
residue discs of non-rational points of X̃ contain no `ℚ_p-points`.

The interface includes these statements.

- Red : `X(ℚ_p) → X̃(𝔽_p), P ↦` reduction of the unique extension `Spec ℤ_p →` 𝒳 of `P`.
- Red is surjective.
- `D(x̃) := red⁻¹(x̃)`; the residue discs over x̃ `∈ X̃(𝔽_p)` partition `X(ℚ_p)`.
- For a local parameter `t_x̃` the map `P ↦ t_x̃(P)` is a bijection `D(x̃) → pℤ_p`, with inverse given by power series in `ℤ_p[[t]]`.
- `red_J(ι_O(P)) = ι_Õ(red P)` for `P ∈ X(ℚ_p)`; in particular `ι_O(Q') − ι_O(Q) ∈ J¹(ℚ_p)` when red `Q =` red Q'.
- The good-reduction pair (𝒳, Ō) of ColemanIntegration §L1.1, whose residue discs over `𝔽_p-points` meet `X(ℚ_p)` in the `D(x̃)`.
- Reduction maps, compatible set map to `J`, and chosen disc parameters; does not assert smooth curve or geometric Abel–Jacobi properties.
- A residue label and its fibre as a set. This product is not the Coleman good-reduction pair.

For the proof, Reduction: `X` is proper, so `X(ℚ_p) = 𝒳(ℤ_p)` and each point reduces to a point of
`X̃(𝔽_p)`; smoothness of 𝒳 and Hensel's lemma make red surjective (McCallum–Poonen §5.2(1)). Residue
discs: a local parameter `t_x̃` restricts to a formal coordinate of the completed local ring of 𝒳 at
x̃, `ℤ_p[[t]]` after completion, so points of `D(x̃)` correspond to `t ∈ pℤ_p` (Siksek Lemma `3.1(iii)`);
this is the `ℚ_p-point` version of ColemanIntegration §L1.3 for the pair (𝒳,
Ō). Jacobian model: 𝒥 `= Pic⁰_{𝒳/ℤ_p}` is an abelian scheme of relative dimension g (by the smooth-relative-Picard contract of
NeronModelsAndSemistableAbelianVarieties §3.8) whose fibres are the Jacobians of the fibres; the section Ō gives the Abel–Jacobi morphism 𝒳 `→` 𝒥 extending `ι_O`, which
yields `red_J` ∘ `ι_O = ι_Õ` ∘ red. The section Ō is finite étale of degree one over `ℤ_p`, so (𝒳, Ō)
satisfies the hypotheses of ColemanIntegration §L1.1.

For actual X/Q smooth proper geometrically integral, genus `g≥1, O∈X(Q)` and smooth proper model over `Z_p`, construct point reduction, all special-fibre points, full formal disc charts, the geometric Abel–Jacobi morphism, its differential pullback isomorphism and completion at `O`, and return the ColemanIntegration good-reduction pair. Abstract ReductionDiscData and `baseResidueDisc` support set-theoretic disc partitioning only; a pair `Xt×Set X` is not the supplier model. All listed GoodReductionChabautyDatum APIs use this same actual geometric carrier. `ReductionDiscData.red/residueDisc/param` are only supporting set/group data. Its genus-one finite-field test has four special-fibre points; the analytic chart requires the smooth-model construction.

**Checks.**

- For `y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` and `p = 3` the two-chart Weierstrass model is smooth over `ℤ_3` and `X̃(𝔽_3) = {∞⁺, ∞⁻, (0, 1), (0, −1)}`: four residue discs.
- For `y² = x(x − 1)(x − 2)(x − 5)(x − 6)` and `p = 7, X̃(𝔽_7) = {(0,0), (1,0), (2,0), (5,0), (6,0), (3,6), (3,−6), ∞}`, eight residue discs.
- For `y²=x³−x` over `F₃` the genus-one special fibre has four points including infinity. Full disc charts require the geometric construction; infinity is a full formal disc, never an isolated `Option.none`.
- The model `y² = x(x − 1)(x − 2)(x − 5)(x − 6)` over `ℤ_5` is not a datum: its reduction `y² = x²(x − 1)²(x − 2)` is singular at `(0, 0)` and `(1, 0)`.
- `D(x̃)` equals the set of `ℚ_p-points` of the residue disc ]x̃[ of ColemanIntegration §L1.3 for the pair (𝒳, Ō).
- For supporting ReductionDiscData, the chosen param at a residue label is a bijection on its set-theoretic fibre. This does not identify a Coleman analytic tube.
- For `C₀(5)` at `p = 3` the residue discs are the four listed in `datum_C05_three`, and each of the six rational points lies in exactly one of them.
- Genus-zero analogue, outside the stated `g≥1` datum: `ℙ¹_{ℤ_p}` has p+1 discs, each parametrised by x−a or 1/x.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5 opening, author copy
p.5; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.2(1), author
copy p.6; [Samir Siksek](https://arxiv.org/abs/1010.2603), §3.4 Lemma 3.1(iii), p.6.)

*Needs:* ColemanIntegration §L1.1; ColemanIntegration §L1.3; NeronModelsAndSemistableAbelianVarieties §3.8; JacobianChallenge Layer `D` (relative Picard and Jacobian); JacobianChallenge Layer `F` (Abel–Jacobi); SchemeAndStackFoundations §§3.3, `3.8`.

### 4.2 The p-adic abelian logarithm and the integration pairing

Consume the local abelian logarithm of AnabelianGeometryAndNonabelianChabauty §5.8 (paragraph
*Local abelian logarithm*): additivity, identity differential, finite torsion kernel over K,
functoriality, restriction to the normalised formal logarithm on a deep congruence subgroup,
compatibility with finite extensions, the extension to every `ℂ_p`-point, the
invariant-differential pairing, and uniqueness from agreement on an open subgroup.
The statements below compare the formal-coordinate presentation used in the effective applications
with this single supplied logarithm and pairing. HeightsRationalPointsAndObstructions
§§1.15a–1.16 supplies the formal groups, charts and logarithms used by that owner.

Let `K` be a finite extension of `ℚ_p` with ring of integers `O_K`, residue field k and ramification index
e, and A an abelian variety of dimension g over `K`. Write `Lie(A)` for its tangent space at 0 (a
K-vector space of dimension g) and `Ω_A := H⁰(A, Ω¹)` for its space of regular 1-forms, which are the
translation-invariant forms; evaluation at 0 identifies `Ω_A` with the dual `Module.Dual K Lie(A)`. The
abelian logarithm `log_A : A(K) → Lie(A)` is the unique group homomorphism that agrees with the supplied formal
logarithm on an open subgroup. Use HeightsRationalPointsAndObstructions §§1.15a–1.16 as follows. Let 𝒜 be the Néron model of A over `O_K` (an
abelian scheme when A has good reduction), F̂ its formal group, the completion of 𝒜 along the zero
section, a g-dimensional commutative formal Lie group over `O_K` once formal parameters `s = (s₁, …, s_g)` are chosen, and `A¹(K) := ker(𝒜(O_K) → 𝒜(k)) = F̂(m_K)`. Let `log_F̂ ∈ (K[[s]])^g` be the supplied formal
logarithm, the unique homomorphism of formal groups F̂ `→ Ĝ_a^g` over `K` whose linear term is the
identity; its coordinates are the formal primitives of a basis of invariant differentials and
converge on `m_K^g`. Put `N :=` #𝒜(k) `= [A(K) : A¹(K)`]. The supplied logarithm satisfies
`log_A(x) = N⁻¹ log_F̂(s(N x))`, identifying
`K^g` with `Lie(A)` by ds at 0. The integration pairing is `⟨x, ω⟩ := ω(log_A x) ∈ K` for `x ∈ A(K), ω ∈ Ω_A`. Properties: (a) `log_A` is a homomorphism, independent of the choices of formal parameters and of
`N` among multiples of the exponent of `𝒜(k)`; (b) ker `log_A = A(K)_tors`, which is finite; `(c) log_A` is
continuous, its differential at 0 is the identity, and for `n >` e/(p − 1) it maps the subgroup
`F̂(m_K^n)` isomorphically onto the lattice `(m_K^n)^g`; (d) for a homomorphism `φ : A → B` of abelian
varieties over `K, log_B` ∘ `φ = dφ` ∘ `log_A, i.e`. `⟨φ(x), ω⟩ = ⟨x, φ*ω⟩`; for a finite extension K'/K,
`log_{A_{K'}}` restricts to `log_A` on `A(K)`; (e) the pairing `A(K) × Ω_A → K` is `ℤ-bilinear` and K-linear
in `ω`, its kernel in `Ω_A, {ω : ⟨x, ω⟩ = 0 ∀x}`, is 0 and its kernel in `A(K)` is `A(K)_tors`; for each `ω, x ↦ ⟨x, ω⟩` is the unique locally analytic homomorphism `A(K) → K` whose differential at 0 is `ω`. The
compatible logarithms over finite K'/K first define `log_A` on `A(ℚ̄_p)`. Over `ℂ_p` use the analytic
logarithm of the `ℂ_p-Lie` group, extending this map continuously; the union over finite extensions
alone does not define it on all `A(ℂ_p)`; this is the supplied `ℂ_p` extension of the logarithm
(KRZB Definition `3.8` and Proposition `3.16`).

Work under the following conditions. `K` finite over `ℚ_p`; A an abelian variety over `K`. Good reduction
is not assumed; when A has good reduction 𝒜 is the abelian scheme extending A and `𝒜(k)` is the group
of points of its special fibre. Normalisation: `Lie(A) = T₀A` and the pairing is evaluation of an
invariant differential on a tangent vector; no sign or scaling is inserted.

The interface includes these statements.

- The formal-coordinate expression above equals the restriction of the supplied `log_A : A(K) →+ Lie(A)`.
- On `A¹(K) = F̂(m_K), log_A(x) = log_F̂(s(x))` for any choice of formal parameters s.
- `log_A(n • x) = n` • `log_A(x)` for `n ∈ ℤ`.
- `log_A x = 0 ↔ x` has finite order; `A(K)_tors` is finite.
- `log_B(φ x) = dφ(log_A x)` for a homomorphism `φ : A → B; d(id) = id` and `d(ψ` ∘ `φ) = dψ` ∘ `dφ`.
- For K'/K finite, `log_{A_{K'}}(x) = log_A(x) ⊗ 1` for `x ∈ A(K)`.
- The coordinate evaluation `ω(log_A x)` equals the supplied pairing for `x ∈ A(K), ω ∈ Ω_A = Module.Dual K Lie(A)`.
- `⟨x, ω⟩ = 0` for all `ω` iff x is torsion; `⟨x, ω⟩ = 0` for all x iff `ω = 0`.
- A continuous homomorphism `λ : A(K) → Lie(A)` that agrees with `log_F̂` on some open subgroup equals `log_A`.
- Supporting extension `A→+T` of a supplied homomorphism on a finite-index subgroup from FormalLogDatum; no abelian variety or analytic construction is encoded.
- The abstract extension restricts to the supplied subgroup homomorphism.
- The abstract extension commutes with integer scalar multiplication.
- The abstract extension has torsion kernel, using the supplied torsion-kernel hypothesis on the subgroup.
- Two abstract extensions commute with supplied group/linear maps when their restrictions satisfy the explicit compatibility hypothesis.
- Abstract inclusion compatibility under the supplied restricted-map identity; this does not construct geometric scalar extension.
- Evaluate a supplied linear functional on `formalLogExtension`; the dual is not identified with invariant differentials.
- Vanishing against every abstract linear functional is equivalent to finite additive order.
- A supplied homomorphism on a finite-index subgroup has a unique extension to the ambient additive group with values in a vector space over a characteristic-zero field. In the Néron-chart specialization this extension is `formalLogExtension`.

For the comparison, apply the supplied restriction of the logarithm of
AnabelianGeometryAndNonabelianChabauty §5.8 to the normalised formal logarithm on a deep
congruence subgroup, and its uniqueness law, to the displayed coordinate expression. Agreement extends to `A¹(K)` by multiplying into that deep subgroup
and cancelling the nonzero integer in `Lie(A)`. The remaining geometric laws are the supplied torsion-kernel, functoriality, base-change and
pairing statements of that paragraph.
The abstract extension and pairing statements above retain their arbitrary additive-group and vector-space generality. When their datum is the supplied Néron formal chart and logarithm, the uniqueness statement identifies the extension with the restriction of the owner's logarithm; evaluation identifies its pairing with the owner's pairing.

The abelian logarithm `log_A` : `A(K) → Lie(A)` is the unique group homomorphism that agrees with the supplied formal logarithm on an open subgroup. Use HeightsRationalPointsAndObstructions §§1.15a–1.16 for the following inputs. Put `N :=` #𝒜(k) `= [A(K) : A¹(K)`]. The comparison with AnabelianGeometryAndNonabelianChabauty §5.8's supplied logarithm is `log_A(x) = N⁻¹ log_F̂(s(N x))`, identifying `K^g` with `Lie(A)` by ds at 0. Over `ℂ_p` use the analytic logarithm of the `ℂ_p-Lie` group, extending this map continuously; the union over finite extensions alone does not define it on all `A(ℂ_p)`; use the supplied `ℂ_p` extension of the logarithm (KRZB Definition `3.8` and Proposition `3.16`). Hypotheses: `K` finite over `ℚ_p`; A an abelian variety over `K`.

**Checks.**

- For an elliptic curve `E` over `ℚ_p` with good reduction and minimal Weierstrass model, `log_E` on `E¹(ℚ_p)` is the formal-group logarithm of the Weierstrass formal group in the parameter `z =` −x/y (dimension one, the case of Mathlib's FormalGroup).
- `log_A(x) = 0` for every torsion point x; for dim A `= 0` the logarithm is the zero map to the zero space.
- For `E : y² + y = x³ − x²` over `ℚ_5` the point `(0, 0)` has order 5, so `log_E(0, 0) = 0: log_A` is not injective, and a definition requiring an inverse exponential on all of `A(K)` is wrong.
- For the Jacobian of `y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` over `ℚ_3`, D' `= [(0, −1) + (−3, 1) − ∞⁺ − ∞⁻]` lies in `J¹(ℚ_3)` with Flynn's local parameters `(s₁, s₂) = (−9/14, 426/49)`, and its formal logarithm is `≡ (36, 3) (mod 3⁴`) (Flynn–Poonen–Schaefer `p.22`).
- If `ω ∈ Ω_A` satisfies `⟨x, ω⟩ = 0` for all `x ∈ A(K)`, then `ω = 0`.
- For arbitrary FormalLogDatum with rank-one target, the extension agrees with its supplied subgroup homomorphism; this does not identify an elliptic formal group.
- A torsion element of the arbitrary additive group maps to zero.
- A supplied nonzero element killed by5 makes the extension noninjective; the elliptic curve and its torsion point are not constructed.
- A supplied subgroup element whose supplied formal logarithm is congruent `to(36,3) modulo3^4` has the same congruence under the extension; no `C₀(5)` point or formal-group computation is supplied.
- If a linear functional vanishes on the entire abstract extension image, it is zero by the supplied spanning hypothesis (the right kernel in point-first order).
- For the Jacobian of `C₀(5)` over `ℚ_3`, D' `= 9·[∞⁺ − ∞⁻]` lies in `J¹(ℚ_3)` and its logarithm in Flynn's parameters is `≡ (36, 3) (mod 3⁴`) (Flynn–Poonen–Schaefer `p.22`).
- For an elliptic curve with good reduction the construction is the formal logarithm on `E¹(ℚ_p)` extended by division by `#Ẽ(𝔽_p)`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §4.1, author copy p.4;
[Michael Stoll](https://arxiv.org/abs/1307.1773v4), §3, p.6; [Michael
Stoll](https://arxiv.org/abs/1307.1773v4), §3, p.7; [Eric Katz, Joseph Rabinoff and David
Zureick-Brown](https://arxiv.org/abs/1504.00694v2), §3.3 Definition 3.8, p.19; [Eric Katz, Joseph
Rabinoff and David Zureick-Brown](https://arxiv.org/abs/1504.00694v2), §3.3, p.20.)

*Needs:* AnabelianGeometryAndNonabelianChabauty §5.8; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; JacobianChallenge Layer `E` (abelian varieties); NeronModelsAndSemistableAbelianVarieties §1.7; NeronModelsAndSemistableAbelianVarieties §1.8; HeightsRationalPointsAndObstructions §§1.15a–1.16; Mathlib `Module.Dual`; Mathlib IsOfFinOrder.

### 4.3 Abelian integrals of regular differentials on a curve

Let `K` be a finite extension of `ℚ_p, X` a smooth projective geometrically integral curve of genus `g ≥ 1` over `K` and `J` its Jacobian. For any `O ∈ X(K)` the pullback `ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹)` along `ι_O(P) = [P − O]` is an isomorphism of K-vector spaces that does not depend on `O`; for `ω ∈ H⁰(X, Ω¹)` write
`ω_J` for the invariant form with `ι_O*ω_J = ω`. For a degree-zero divisor `D = Σ n_i P_i` on `X_K̄` that is
`Gal(K̄/K)-stable`, define `∫_D ω := ⟨[D], ω_J⟩` (pairing of §4.2 on `J(K)`), and for `Q`, Q' `∈ X(K)` put
`∫_Q^{Q'} ω := ∫_{Q' − Q} ω = ⟨ι_O(Q') − ι_O(Q), ω_J⟩`. The continuous analytic abelian logarithm over
`ℂ_p` defines the same formulas on `X(ℂ_p)`; finite-extension formulas give only its restriction to
algebraic points. Properties: (i) K-linear in `ω` and additive in `D; ∫_Q^{Q'} + ∫_{Q'}^{Q''} = ∫_Q^{Q''}; (ii) ∫_D ω = 0` whenever `[D]` is torsion in `J(K)`, in particular when `D` is principal, and
conversely if `∫_D ω = 0` for all `ω` then `[D]` is torsion; (iii) `η_{ω,O}(P) := ∫_O^P ω = ⟨ι_O(P), ω_J⟩`,
and changing `O` adds a constant; (iv) change of variables: for a nonconstant morphism `ρ : X → Y` of
such curves over `K` and `ω ∈ H⁰(Y, Ω¹), ∫_D ρ*ω = ∫_{ρ_*D} ω`; (v) trace: for `ρ` finite and `E` a
degree-zero divisor on `Y, ∫_{ρ*E} ω = ∫_E Tr_ρ ω`, where `Tr_ρ : H⁰(X, Ω¹) → H⁰(Y, Ω¹)` is the trace;
(vi) base change: `∫` is compatible with finite extensions K'/K.

Work under the following conditions. `K` finite over `ℚ_p; X` smooth projective geometrically integral
of genus `g ≥ 1` over `K`. The definition uses only the abelian logarithm of `J`; no reduction hypothesis
is made. When `X` has good reduction this integral equals the Coleman integral `(§4.6)`.

The interface includes these statements.

- `∫_D ω := ⟨[D], ω_J⟩` for a Galois-stable degree-zero divisor `D` and `ω ∈ H⁰(X, Ω¹)`.
- `ι_O* : H⁰(J, Ω¹) → H⁰(X, Ω¹)` is bijective and independent of `O`.
- `∫_{D+D'} ω = ∫_D ω + ∫_{D'} ω` and `∫_D (aω + bω') = a∫_D ω + b∫_D ω'`.
- `∫_D ω = 0` for all `ω` iff `[D]` is torsion in `J`; in particular `∫_{div f} ω = 0`.
- `∫_D ρ*ω = ∫_{ρ_*D} ω` for a morphism `ρ : X → Y`.
- `∫_{ρ*E} ω = ∫_E Tr_ρ ω` for `ρ` finite and `E` of degree zero on `Y`.
- Compatible with finite extensions K'/K.
- For two actual base points O,O′ of `X`, the pullback maps `H⁰(J,Ω¹)→H⁰(X,Ω¹)` along their geometric Abel–Jacobi morphisms agree.
- Evaluate `formalLogExtension` using a supplied linear equivalence `Ω≃Dual(T)`; this does not construct a curve, divisor class or regular differential.
- Additivity and scalar linearity of the supplied formal-log evaluation.
- Formal-log evaluation vanishes against every element of the supplied `Ω` iff the abstract class is torsion.
- The change-of-variables equality follows from an explicitly supplied pairing identity; no geometric map or pullback is constructed.
- The trace equality follows from an explicitly supplied pairing identity; no geometric divisor pullback or differential trace is constructed.
- The inclusion equality follows from an explicitly supplied pairing identity; no field-base-change construction is encoded.
- Extensionality for two supplied linear equivalences that agree pointwise.

For the proof, The isomorphism `ι_O*` and its independence of `O`: two Abel–Jacobi maps differ by a
translation and invariant forms are translation invariant (McCallum–Poonen §5.1 citing Milne; Siksek
§3.3); supplied by SchemeAndStackFoundations §§3.3, `3.8` together with the Jacobian (JacobianChallenge
layers D–F). (i)–(iii) follow from the corresponding properties of the pairing in §4.2
(homomorphism, torsion kernel, left non-degeneracy). `(iv) ρ` induces `ρ_* : J_X → J_Y` with `ρ_*` ∘ `ι_O = ι_{ρ(O)}` ∘ `ρ`; functoriality of `log (§4.2 (d))` gives `⟨ρ_*x, ω_J⟩ = ⟨x, (ρ_*)*ω_J⟩` and `(ρ_*)*ω_J`
corresponds to `ρ*ω` (Siksek §3.1 change of variables). `(v) ρ* : J_Y → J_X` on Picard groups pulls
invariant forms back to the forms corresponding to traces; apply (d) of §4.2 to `ρ*`. (vi) is §4.2 (d)
for K'/K.

**Checks.**

- On `y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` over `ℚ_3: ∫_{(0,1)}^{(−3,1)}` dx/y `≡ 2·3 + 3⁴ (mod 3⁵`) and `∫_{(0,1)}^{(−3,1)} x` dx/y `≡ 2·3² + 2·3³ (mod 3⁵`).
- `∫_Q^Q ω = 0` and `∫_D 0 = 0`.
- On `y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1` over `ℚ_3` let `W` be the Weierstrass point with `x(W) ≡ 1 (mod 3), S^± = (1, ±3)`; then `2W ∼ S⁺ + S⁻`, so `2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω` for every regular `ω`.
- For `X = E` an elliptic curve and `O` its origin, `ι_O` is the identity of `E = J` and `∫_O^P ω = ⟨P, ω⟩` is the elliptic logarithm paired with `ω`.
- For `E : y² + y = x³ − x²` over `ℚ_5, ∫_O^{(0,0)} ω = 0` for every `ω` although `(0, 0) ≠ O`: the integral sees divisor classes modulo torsion, not points.
- For supplied residue data, the displayed power-series square-root equation and an assumed primitive identity imply the two3-adic congruences; identification with actual `C₀(5)` points and forms is an additional hypothesis.
- Evaluation of the zero abstract class is zero.
- A supplied `relation2w=s` in the abstract additive group gives twice the evaluation atw equal to that ats; no Weierstrass divisor relation is proved.
- The supplied `Ω-to-dual` equivalence identifies `formalLogIntegral` with `formalLogPairing`; no elliptic curve or genus hypothesis is encoded.
- A supplied class killed by5 has zero evaluation; the concrete elliptic point is not constructed.
- McCallum–Poonen Example 3: `∫_{(0,1)}^{(−3,1)}` dx/y `≡ 2·3 + 3⁴` and `∫_{(0,1)}^{(−3,1)} x` dx/y `≡ 2·3² + 2·3³ (mod 3⁵`) on `C₀(5)`.
- Degenerate case: `∫_Q^Q ω = 0`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.1, author copy p.5;
[Samir Siksek](https://arxiv.org/abs/1010.2603), §3.3, p.5; [Samir
Siksek](https://arxiv.org/abs/1010.2603), §3.1, p.4; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.3.1, p.5.)

*Needs:* §4.2; JacobianChallenge Layer `D` (relative Picard and Jacobian); JacobianChallenge Layer `F` (Abel–Jacobi); SchemeAndStackFoundations §§3.3, `3.8`; Mathlib `Module.Dual`.

### 4.4 Tiny integrals: abelian integrals on a residue disc are power-series primitives

Let (`X, O, p`, 𝒳) be a good-reduction Chabauty datum, `K` a finite extension of `ℚ_p`, x̃ `∈ X̃(𝔽_p)` and `t = t_x̃` a local parameter at x̃. Let `ω ∈ H⁰(𝒳, Ω¹_{𝒳/ℤ_p})` be an integral regular differential. Then
(a) in the completed local ring of 𝒳 at x̃, `ω = w(t) dt` with `w ∈ ℤ_p[[t]]`, and the reduction `ω̃ ∈ H⁰(X̃, Ω¹)` has expansion w̃(t) dt at x̃ with w̃ `= w` mod p; (b) for all points `Q`, Q' of `𝒳(O_K)`
reducing to x̃, `∫_Q^{Q'} ω = I(t(Q')) − I(t(Q))` where `I := PowerSeries.primitive w ∈ ℚ_p[[t]]`
(constant term 0), which converges on the open unit disc; (c) for fixed `Q` in the disc, `P ↦ ∫_Q^P ω`
is the unique function on the disc given by a power series in `t − t(Q)` convergent on the open unit
disc, with derivative `w(t)` and value 0 at `Q`; (d) if p is odd and `K/ℚ_p` is unramified and `t(Q) = 0`,
then `∫_Q^P ω = α z + β z²` with `z = t(P), α = w(0) ∈ ℤ_p` and `β ∈ O_K`. For a general `ω ∈ H⁰(X_{ℚ_p}, Ω¹)`, apply (a)–(c) to `p^k ω` for k with `p^k ω` integral.

Work under the following conditions. (`X, O, p`, 𝒳) a good-reduction Chabauty datum; `ω` integral (an
element of `H⁰(𝒳, Ω¹)`, a free `ℤ_p-module` of rank g whose reduction is `H⁰(X̃, Ω¹)`). Points over a
finite extension `K` are allowed; `t(Q), t(Q')` lie in the maximal ideal of `O_K`.

For the proof, `Q` and Q' have the same reduction, so `ι_O(Q') − ι_O(Q)` lies in the kernel of reduction
of 𝒥 `(§4.1)`, where `log_J` is the formal logarithm `(§4.2)`. With `Q` fixed, `P ↦ [P − Q]` is a morphism
from the formal neighbourhood Spf `O_K[[t − t(Q)]]` of the disc to the formal group of 𝒥, so the
formal parameters of `[P − Q]` are power series in `t − t(Q)` with `O_K-coefficients` and no constant
term; composing with `log_F̂` gives a power series convergent on the open disc
(ColemanIntegration §L0.5) whose differential is the pullback of `ω_J` along `P ↦ [P − Q]`, namely `ω`, because `ω_J` is translation invariant. A power series convergent on the open disc
is determined by its derivative and its value at one point
(ColemanIntegration §L0.8, ColemanIntegration §L0.4); comparing with
`primitive(w)` gives (b) and (c). (a) is the definition of integral differentials and their reduction
in local coordinates (McCallum–Poonen §5.2(2)). (d) The coefficient of `z^{j+1}` is `w_j/(j + 1)` and
`ord(z) ≥ 1; ord_p(j + 2) ≤ j` for all `j ≥ 0` when p is odd, so `β = Σ_j w_{j+1} z^j/(j + 2)` is integral
(Siksek Lemma `3.2`).

For a genuine smooth proper curve over `K` with good reduction, integral regular differential `ω` and a formal parameter t on one full residue disc, construct the integral coefficient series `w(t)`, its convergent formal primitive `I`, and derive `∫_Q^Q′ω=I(t(Q′))−I(t(Q))` for points in that disc over finite extensions. Obtain this from the differential pullback of the actual Abel–Jacobi morphism and its completed formal group; do not assume the equality as a field.

**Checks.**

- McCallum–Poonen Example 3 (author copy `p.11`): on the disc of `(0, 1)` of `y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` with `t = x, ∫_{(0,1)}^{(−3,1)}` dx/y `= Σ a_i (−3)^{i+1}/(i + 1)` where `(1 + 6x + …)^{−1/2} = Σ a_i x^i = 1 − 3x + 11x² − 56x³ + ⋯`, giving `≡ 2·3 + 3⁴ (mod 3⁵`).
- Degenerate case: for Q' `= Q` both sides vanish.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.1(ii), author copy
p.6; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.2(3), author
copy p.6; [Michael Stoll](https://arxiv.org/abs/1307.1773v4), §6, p.12; [Samir
Siksek](https://arxiv.org/abs/1010.2603), §3.5 Lemma 3.2, p.6; [Samir
Siksek](https://arxiv.org/abs/1010.2603), §3.5 proof of Lemma 3.2, p.7.)

*Needs:* §4.1; §4.3; §4.2; ColemanIntegration §L0.2; ColemanIntegration §L0.4; ColemanIntegration §L0.5; ColemanIntegration §L0.8; ColemanIntegration §L1.3; Mathlib `PowerSeries.derivative`.

### 4.5 Pairing a point of the kernel of reduction with a differential by tiny integrals

Let (`X, O, p`, 𝒳) be a good-reduction Chabauty datum of genus g, and P' `∈ X(ℚ_p)` whose reduction x̃'
satisfies `dim H⁰(X̃, O(g·x̃')) = 1` (x̃' is not a Weierstrass point of X̃). Then every `D ∈ J¹(ℚ_p) = ker(red_J)` is uniquely represented as `D = [Q₁ + ⋯ + Q_g − g·P']` with `Q₁ + ⋯ + Q_g` an effective
divisor defined over `ℚ_p` (a Galois-stable geometric multiset, allowing repeated points) whose points
`Q_j ∈ X(ℚ̄_p)` all reduce to x̃'. Independently of the Weierstrass hypothesis, whenever `D = [Q₁ + ⋯ + Q_g − g·P']` with all `Q_j` in the residue disc of x̃', and `ω ∈ H⁰(X_{ℚ_p}, Ω¹)` has expansion `w(t) dt`
at x̃' in a parameter t with `t(P') = 0`, and `λ := primitive(w) = Σ_{n ≥ 1} λ_n t^n`, then `⟨D, ω_J⟩ = Σ_j λ(t(Q_j)) = Σ_{n ≥ 1} λ_n s_n`, where `s_n = Σ_j t(Q_j)^n ∈ ℚ_p` are the power sums of the roots of
`∏_j (T − t(Q_j)) ∈ ℚ_p[T]`, computed from its coefficients by Newton's identities. In particular `⟨D, ω_J⟩` has enclosures of any p-adic precision from an effective representative of `D + g·P'`.
Equivalently write `E=Σ_x m_x[x]` over closed points of `X_{ℚ_p}: Σ_x m_x[κ(x):ℚ_p]=g` and the value is
`Σ_x m_x Tr_{κ(x)/ℚ_p}(λ(t(x)))`. The representative is unique as an effective divisor, not as an
ordering of geometric points. The characteristic polynomial and trace include every multiplicity.

Work under the following conditions. Good-reduction datum; x̃' not a Weierstrass point of X̃ (`h⁰(g`
x̃') `= 1`). For `g = 1` every point qualifies and the statement is the formal-group description of `E¹`.

For the proof, Riemann–Roch on `X` gives an effective `E` of degree g with `E ∼ D + g` P'; reduction of
divisors through the smooth model 𝒳 preserves linear equivalence, so Ẽ `∼ g` x̃' on X̃ because `D`
reduces to 0 (supplied by JacobianChallenge Layer `C` and §4.1). `h⁰(X̃, O(g` x̃')) `= 1` forces Ẽ `= g` x̃', so
every point of `E` lies in the residue disc of x̃'; upper semicontinuity of `h⁰` in the family 𝒳 gives
`h⁰(X, O(D +` gP')) `≤ 1`, hence uniqueness of `E`. `⟨D, ω_J⟩ = Σ_j ∫_{P'}^{Q_j} ω` by §4.3 (i) over the
field of definition of the `Q_j`, and each term is `λ(t(Q_j))` by §4.4 (b) applied over that finite
extension. Work in one finite extension containing every support point of `E`, with compatible abelian
logarithms. Finite summation commutes with the convergent primitive series; Galois equivariance
groups conjugate terms into field traces. Newton identities compute the weighted power sums of the
degree-g characteristic polynomial over `ℚ_p` (Stoll2008 Lemma5, `pp.9–10`). Uniqueness is the stated
Riemann–Roch/specialisation argument, not asserted in that source passage.

In particular `⟨D, ω_J⟩` is enclosed to any p-adic precision from an effective representative of `D + g·P'`.

**Checks.**

- Stoll's evaluation on `X₀^dyn(6)` at `p = 5` with P' `= P₁ = (u, w) = (0, −1)` and parameter u: Stoll exhibits effective degree-four `D_j'` supported in the disc of `P₁` with `D_j ∼ D_j' − 4P₁` for the three generators `D₁ = P₇ − P₉, D₂ = P₀ − 6P₁ + 2P₅ + P₇ + P₈ + P₉, D₃ = P₀ − 3P₁ + 2P₂ + P₄ + P₆ − P₇ − P₈` of `G ∩ J(ℚ_5)¹` (Stoll `p.10`).
- If `D = [Q −` P'] with `Q` in the disc of P' (`Q₂ = ⋯ = Q_g =` P'), the formula reduces to the tiny integral `λ(t(Q))`.
- A degree-two closed point contributes `Tr_{L/ℚ_p} λ(t(Q))`, not one `ℚ_p-rational` point; a repeated point of multiplicity2 contributes `2λ(t(Q))`. Reordering geometric conjugates leaves the effective divisor and value unchanged.

([Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3 proof of Lemma 5, p.9; [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §3 proof of Lemma 5, p.10.)

*Needs:* §4.4; §4.3; §4.1; JacobianChallenge Layer `C`.

### 4.6 Coleman integrals of regular differentials are abelian integrals

Consume the paragraph *Coleman and abelian logarithm comparison* of
AnabelianGeometryAndNonabelianChabauty §5.8: the normalised equality for every regular one-form,
its base-point change law, and its finite-extension and `ℂ_p` evaluation laws through the same
`ℂ_p` extension of the logarithm. The target below compares the ColemanIntegration realization and
the §4.3 notation used in the effective applications with this supplied regular equality.

Let `K` be a finite extension of `ℚ_p` with residue field `𝔽_q`, (𝒳, `D`) a good-reduction pair over `O_K`
(ColemanIntegration §L1.1) with generic fibre `X` of genus `g ≥ 1, Y =` 𝒳 `− D`, a `∈ ℂ_p`
a branch of the logarithm and (`φ, ω•, M`, g•) a Frobenius-structured datum on (𝒳, `D`)
(ColemanIntegration §L1.9). For every `ω ∈ H⁰(X, Ω¹) ⊂ Ω⁺(Y)` and all `x, y ∈ ]Y_k[(ℂ_p)`, the
Coleman integral of ColemanIntegration §L1.19 equals the abelian integral: `∫^{Col}_x^y ω = ∫_x^y ω = ⟨[y − x], ω_J⟩ (§4.3` over `ℂ_p`). Consequently the Coleman integral of a regular
differential does not depend on the branch a or on the Frobenius lift, extends to all of `X(ℂ_p)`,
takes values in K' on points of `X(K')` for K' `⊆ ℂ_p` finite over `K`, and vanishes on every degree-zero
divisor whose class is torsion.

Work under the following conditions. (𝒳, `D`) a good-reduction pair over `O_K, K` finite over `ℚ_p; ω` a
regular differential on the proper curve `X` (not merely on `Y`). The Frobenius-structured datum exists
by ColemanIntegration §L1.9; its Frobenius matrix `M` has characteristic
polynomial `P_Y ∈ K[t]` whose roots are Weil q-numbers of weights 1 and 2.

The interface includes these statements.

- Algebraic uniqueness for a candidate function on ReductionDiscData: its difference from `formalLogIntegral` is constant on fibres, satisfies the supplied Frobenius-polynomial relation with `P` coprime to `X^m−1` for every `m≥1`, and vanishes at the base point. No Coleman primitive or cohomological Frobenius relation is constructed.

For the comparison, identify the invariant form by §4.3's Abel–Jacobi pullback and apply
the regular equality of AnabelianGeometryAndNonabelianChabauty §5.8 to the supplied
ColemanIntegration integral. Use its base-point change law to pass from its fixed base point
to arbitrary endpoints x and y. If `X(K)` is empty, choose a finite extension L/K with a point
of `X(L)` and apply the supplied comparison over L; its base-change law identifies the result.
Its finite-extension and `ℂ_p` evaluation laws use the same
`ℂ_p` extension of the logarithm; independence of branch and Frobenius lift, rationality on K'-points and
vanishing on torsion classes then follow from the supplied pairing. The algebraic uniqueness statement above remains a statement for the stated candidate functions and polynomial hypotheses.

This is the specialization of AnabelianGeometryAndNonabelianChabauty §5.8's regular equality to the supplied datum and the §4.3 pairing, with identical base-point normalization.

**Checks.**

- For `y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1` over `ℚ_3` with `D =` closure of `∞⁺`, the Coleman integral `∫^{Col}_{(0,1)}^{(−3,1)}` dx/y equals the tiny integral `≡ 2·3 + 3⁴ (mod 3⁵`) of §4.3.
- Degenerate case `g = 1`: for an elliptic curve with good reduction the Coleman integral of the invariant differential from `O` is the formal-group logarithm extended to `E(ℂ_p)`.
- For a degree-zero divisor with torsion Jacobian class, the sum of its regular Coleman integrals is zero by the supplied torsion-kernel comparison.

([Eric Katz, Joseph Rabinoff and David Zureick-Brown](https://arxiv.org/abs/1504.00694v2), §3.5,
p.24; [Eric Katz, Joseph Rabinoff and David Zureick-Brown](https://arxiv.org/abs/1504.00694v2), §3.4
Corollary 3.18, p.23; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8
Remark 8.3(2), author copy p.12; [Jennifer S. Balakrishnan, Robert W. Bradshaw and Kiran S.
Kedlaya](https://arxiv.org/abs/1004.4936v2), §1, p.2.)

*Needs:* AnabelianGeometryAndNonabelianChabauty §5.8; §4.3; §4.2; ColemanIntegration §L1.19; ColemanIntegration §L1.9.

### 4.7 Constants of integration on residue discs without a known rational point

Let (`X, O, p`, 𝒳) be a good-reduction Chabauty datum, `G ⊆ J(ℚ)` a subgroup, `ω ∈ H⁰(X_{ℚ_p}, Ω¹)` with
`⟨γ, ω_J⟩ = 0` for all `γ ∈ G, η(P) := ∫_O^P ω`, x̃ `∈ X̃(𝔽_p)` and `B ∈ D(x̃)`. Then `η` restricted to `D(x̃)`
is `η(B) + I_B(t)` with `I_B` the tiny integral from `B (§4.4)`, and the constant `η(B)` can be exact by
any of: (a) (Wetherell) if `γ ∈ G` satisfies `red_J(γ) = red_J(ι_O(B))`, then `ι_O(B) − γ ∈ J¹(ℚ_p)` and
`η(B) = ⟨ι_O(B) − γ, ω_J⟩`, computed by §4.5; (b) (torsion) if `T ∈ J(ℚ_p)` is torsion with `red_J(T) = red_J(ι_O(B))` (for instance the unique such `T` of order prime to p when `red_J(ι_O(B))` has order prime
to p), then `η(B) = ⟨ι_O(B) − T, ω_J⟩`, again a kernel-of-reduction value; (c) (Coleman) `η(B) = ∫^{Col}_O^B ω` computed by Frobenius continuation on a good-reduction pair (𝒳, `D`) whose finite étale
divisor `D` meets neither the residue disc of `O` nor `D(x̃) (§4.6)`.

Work under the following conditions. Good-reduction datum; `ω` annihilates `G; B` any `ℚ_p-point` of the
disc (it exists since red is surjective).

For the proof, `η(B) = ⟨ι_O(B), ω_J⟩ (§4.3` (iii)); in (a) subtract `⟨γ, ω_J⟩ = 0`, in `(b) ⟨T, ω_J⟩ = 0`
(torsion kernel); in both cases the difference reduces to 0 by `red_J` ∘ `ι_O = ι_Õ` ∘ red, so lies in
`J¹(ℚ_p)` and its pairing is a sum of tiny integrals `(§4.5)`. Existence of `T` in (b) for classes of
order prime to p: the kernel `J¹(ℚ_p)` is a pro-p group, so the reduction map restricted to prime-to-p
torsion is injective and Hensel's lemma for the étale group scheme `𝒥[n], p ∤ n`, gives surjectivity
onto `J̃(𝔽_p)[n]` (McCallum–Poonen Remark `8.3(1)). (c`) is §4.6 for a good-reduction pair (𝒳, `D`) with
`O, B ∈ ]Y_k[`: take for `D` the lift (Hensel's lemma, over the unramified extension of degree d) of a
closed point of degree d of X̃ outside the residue classes of `O` and `B`. Additivity `η(P) = η(B) + ∫_B^P ω (§4.3 (i))` and the tiny-integral expansion give the form on `D(x̃)`.

**Checks.**

- For `C₀(5)` at `p = 3` every residue disc contains a known rational point, so `B` can be taken rational and `η(B) = 0`; the theorem is needed only for discs without known points.
- Degenerate case: if `B ∈ X(ℚ)` then `γ = ι_O(B) ∈ J(ℚ)` is allowed in (a) when `G ⊇ ι_O(X(ℚ)) − ι_O(O)`, giving `η(B) = 0`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8 Remark 8.3(3),
author copy p.12; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8
Remark 8.3(1), author copy p.12.)

*Needs:* §4.3; §4.5; §4.6; §4.4; §4.1.

### 4.8 The p-adic closure of a Mordell–Weil group: dimension at most the rank

Let A be an abelian variety of dimension g over `ℚ, p` a prime, `Γ ⊆ A(ℚ) ⊆ A(ℚ_p)` a finitely generated
subgroup of rank r and `Γ̄` its closure in `A(ℚ_p)`. Then (a) `log_A(Γ̄) = ℤ_p·log_A(Γ)` inside
`Lie(A_{ℚ_p}) ≅ ℚ_p^g`; (b) the p-adic Lie subgroup `Γ̄` has dimension `r₀ := rank_{ℤ_p} ℤ_p·log_A(Γ) = dim_{ℚ_p} ℚ_p·log_A(Γ)`, and `r₀ ≤ min(r, g)`; (c) if `G ⊆ Γ` has finite index then `ℚ_p·log_A(G) = ℚ_p·log_A(Γ)` and Ḡ has finite index in `Γ̄`; if moreover [`Γ : G`] is prime to `p·#Ã(𝔽_p)` for a prime p
of good reduction, then Ḡ `= Γ̄`. Inequality `r₀ < r` can occur, and `r₀ ≤ g` always.

Work under the following conditions. A abelian variety over `ℚ` (in `ED.4`, the Jacobian `J` of `X); Γ`
finitely generated (Mordell–Weil theorem for `Γ = J(ℚ)`, supplied by
HeightsRationalPointsAndObstructions Layer 1). Closure is taken in the natural p-adic analytic topology
on `A(ℚ_p)`; the logarithm is the continuous geometric abelian logarithm, a local analytic isomorphism
with finite torsion kernel. In the last clause A has good reduction and `#Ã(𝔽_p)` is the actual order
of its reduced point group.

For the proof, `A(ℚ_p)` is compact, so continuity of log gives `log(Γ̄)=closure(log Γ)`. A finite
generating family identifies `ℤ_p log Γ` as the continuous image of a compact finite product `ℤ_p^r` and
hence a closed module; density of `ℤ` in `ℤ_p` gives the reverse inclusion. Finite generation is
essential to this closed-image argument (McCallum–Poonen `Lemma4.2` proof). `log_A` is a local
diffeomorphism `(§4.2 (c))`, so `dim Γ̄ = rank` of the `ℤ_p-module ℤ_p log_A(Γ)`; it is at most `rank_ℤ log_A(Γ) ≤ r` and at most g. For index `n=[Γ:G], nΓ⊆G` and `Γ̄` is covered by finitely many translates of
Ḡ, giving finite index and equal `ℚ_p log` spans. If `gcd(n,p·#Ã(𝔽_p))=1`, multiplication by n is a
topological automorphism on the pro-p reduction kernel and on the finite reduction quotient. Its
inverse preserves each closed subgroup: approximate `n⁻¹` by integers simultaneously in the p-adic
kernel and modulo the finite quotient order. Thus `nΓ̄=Γ̄⊆Ḡ`, and `Ḡ=Γ̄ (Remark6.1)`.

Inequality `r₀ < r` can occur, and `r₀ ≤ g` always.

**Checks.**

- For `C₀(5)` (FPS Theorem `3, J(ℚ) ≅ ℤ) r = r₀ = 1 < g = 2` at every prime.
- Degenerate case: `Γ` finite gives `r₀ = 0` and `Γ̄ = Γ`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §4.2 Lemma 4.2, author
copy p.4; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §4.2 Remark
4.3, author copy p.5; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §6
Remark 6.1, author copy p.8.)

*Needs:* §4.2; Mathlib `Submodule.span`; HeightsRationalPointsAndObstructions Layer 1.

### 4.9 Annihilating (vanishing) differentials of a Mordell–Weil subgroup

Let `X` be a smooth projective geometrically integral curve of genus `g ≥ 1` over `ℚ` with Jacobian `J, p` a
prime, and `Γ ⊆ J(ℚ_p)` a subgroup. The space of differentials annihilating `Γ` is `Ann_p(Γ) := {ω ∈ H⁰(X_{ℚ_p}, Ω¹) : ⟨γ, ω_J⟩ = 0 for all γ ∈ Γ}` (pairing of §4.2, `ω_J` as in §4.3); under `ω ↦ ω_J ∈ Module.Dual ℚ_p Lie(J_{ℚ_p})` it is the dual annihilator of the subspace `ℚ_p·log_J(Γ)`. The
annihilating (vanishing) differentials of `X` at p are `Ann_p(J(ℚ))`. For a good-reduction datum, the
integral annihilator is `V := Ann_p(Γ) ∩ H⁰(𝒳, Ω¹)`, a saturated `ℤ_p-submodule`, and Ṽ `⊆ H⁰(X̃, Ω¹)` is
its reduction mod p. Properties: (a) `dim Ann_p(Γ) = g − r₀(Γ) ≥ g − rank Γ` for `Γ` finitely generated
`(§4.8); (b) Ann_p(G) = Ann_p(Γ)` when `G ⊆ Γ` has finite index, so `Ann_p(J(ℚ))` is computed from
generators `D₁, …, D_r` of any finite-index subgroup `G` of `J(ℚ) (§3.21)` as coefficient columns in the kernel of the transpose of the `g × r`
matrix `(∫_{D_j} ω_i)` for a basis `ω_i` of `H⁰; (c) Ann_p(Γ) = Ann_p(Γ̄) = Ann_p(Γ^sat)`, where `Γ^sat = {x ∈ J(ℚ_p) : n x ∈ Γ for some n ≥ 1}; (d) Ann_p` is inclusion-reversing; `(e) dim_{𝔽_p}` Ṽ `= dim_{ℚ_p} Ann_p(Γ)`.

Work under the following conditions. `X/ℚ` smooth projective geometrically integral of genus g; p
prime; `Γ` a subgroup of `J(ℚ_p)`, in applications the image of a finite-index subgroup of `J(ℚ)`. The
integral lattice `V` and its reduction need a good-reduction datum; `Ann_p` itself does not.

The interface includes these statements.

- `Ann_p(Γ)` as a `ℚ_p-subspace` of `H⁰(X_{ℚ_p}, Ω¹)`.
- `ω ∈ Ann_p(Γ) ↔` ∀ `γ ∈ Γ, ⟨γ, ω_J⟩ = 0`.
- Under `ω ↦ ω_J, Ann_p(Γ) = (span_{ℚ_p} log_J Γ).dualAnnihilator`.
- `G ≤ Γ` of finite index `⇒ Ann_p(G) = Ann_p(Γ)`.
- `Γ ≤ Γ' ⇒ Ann_p(Γ') ≤ Ann_p(Γ)`.
- `dim Ann_p(Γ) = g − dim span log Γ ≥ g − rank Γ`.
- `Ann_p(Γ) = Ann_p(Γ^sat) = Ann_p(closure of Γ)`.
- For generators `D₁, …, D_r` of `Γ` and a basis `ω₁, …, ω_g, Σ c_i ω_i ∈ Ann_p(Γ) ↔ Σ_i c_i ∫_{D_j} ω_i = 0` for all j.
- Ṽ `:=` image of `Ann_p(Γ) ∩ H⁰(𝒳, Ω¹)` in `H⁰(X̃, Ω¹); dim_{𝔽_p}` Ṽ `= dim Ann_p(Γ)`.

The coordinate statements identify the annihilator of the column span of
a `g × r` logarithm matrix with the kernel of its transpose and give dimension
`g − rank M`. Their geometric use requires the logarithm and differential-basis identifications above.

For the proof, `Ann_p(Γ)` is the preimage of `Submodule.dualAnnihilator (span log Γ)` under the
isomorphism `ω ↦ ω_J; finrank_add_finrank_dualAnnihilator` gives (a) with `r₀ = dim span`. (b): `span log G = span log Γ` by §4.8 (c). (c): `⟨·, ω_J⟩` is continuous and `ℚ_p` is torsion-free. (d):
`Submodule.dualAnnihilator_anti`. (e): `V` is saturated in the free `ℤ_p-module H⁰(𝒳, Ω¹)` because
`Ann_p(Γ)` is a `ℚ_p-subspace`, so V/pV injects into `H⁰(X̃, Ω¹)` and has dimension `rank V = dim Ann_p(Γ)`
(Box §2.2.2).

**Checks.**

- For `g=2,r=1,M=(1,0)ᵀ`, the coefficient columns satisfying `Mᵀc=0` are
  exactly `(0,t)ᵀ`; the kernel of M itself is zero. This uses the column convention.
- For `C₀(5): y² = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1, p = 3` and `G = ⟨[(−3,1) − (0,1)]⟩` (finite index in `J(ℚ) ≅ ℤ), Ann_3(G) = ℚ_3·(ε` dx/y + x dx/y) with `ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴`), and Ṽ `= 𝔽_3·x` dx/y.
- For `C₁(3₂): y² = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1, p = 3` and `G = ⟨[S⁺ − S⁻]⟩, S^± = (1, ±3), Ann_3(G) = ℚ_3·(α` dx/y + x dx/y) with `α ≡ 68 (mod 3⁴`), so Ṽ `= 𝔽_3·(x − 1)` dx/y (computed from `∫_{S⁻}^{S⁺}` dx/y `≡ 174` and `∫_{S⁻}^{S⁺} x` dx/y `≡ 75 (mod 3⁵`), tiny integrals with parameter y + 3).
- `Ann_p(0) = Ann_p(J(ℚ_p)_tors) = H⁰(X_{ℚ_p}, Ω¹)`, of dimension g.
- `Ann_p(J(ℚ_p)) = 0`, by left non-degeneracy of the pairing.
- For `C₀(5)` and the subgroup 0 (not of finite index in `J(ℚ) ≅ ℤ`), dx/y `∈ Ann_3(0)` but `∫_{(0,1)}^{(−3,1)}` dx/y ≢ 0 (mod `3²`): differentials annihilating a subgroup of smaller rank need not annihilate `J(ℚ)`.
- `Ann_p(Γ)` corresponds to Mathlib's `Submodule.dualAnnihilator` of `span_{ℚ_p}(log_J Γ)` in `Module.Dual ℚ_p Lie(J)`.
- McCallum–Poonen (4): for `C₀(5)` at `p = 3, Ann_3(J(ℚ)) = ℚ_3(ε dx/y + x dx/y), ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴`).
- Stoll Lemma 5: for `X₀^dyn(6)` at `p = 5` and `G ≅ ℤ³, Ann_5(G)` is one-dimensional with reduction `ω̄₂ = w ω̄₀`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.4, author copy p.7;
[Box (arXiv v3)](https://arxiv.org/abs/1906.05206), §2.2.2, p.4; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.1, p.3; [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §3 proof of Lemma 5, p.9.)

*Needs:* §4.2; §4.3; §4.8; §3.21; Mathlib `Submodule.dualAnnihilator`; Mathlib `Submodule.mem_dualAnnihilator`; Mathlib `Submodule.dualAnnihilator_anti`; Mathlib `Subspace.finrank_add_finrank_dualAnnihilator_eq`.

### 4.10 Exact p-adic precision of annihilating differentials

Let (`X, O, p`, 𝒳) be a good-reduction Chabauty datum, `ω₁, …, ω_g` a `ℤ_p-basis` of `H⁰(𝒳, Ω¹), D₁, …, D_r ∈ J(ℚ)` with `r < g`, and `M ∈ M_{g×r}(ℚ_p)` the matrix `M_{ij} = ∫_{D_j} ω_i`, scaled by a power of p so
that `M` has entries in `ℤ_p`. Suppose M' `∈ M_{g×r}(ℚ)` has `ℤ_(p)-entries` with `M −` M' `∈ p^k M_{g×r}(ℤ_p)`,
and that some `r × r` minor of M' on a row set `R` has valuation `δ` with `2δ < k`. Then (a) `M` has rank r,
the same minor of `M` has valuation `δ`, and `dim Ann_p(⟨D₁, …, D_r⟩) = g − r`; (b) for each `i ∉ R` the
true annihilating differential `ω^{(i)} := ω_i − Σ_{l ∈ R} x_l ω_l`, where `x ∈ ℚ_p^R` solves `Σ_{l∈R} x_l M_{l•} = M_{i•}` (rows of `M`), satisfies `x ∈ p^{−δ}ℤ_p^R` and x − x' `∈ p^{k−2δ}ℤ_p^R` for the
solution x' of the same system with M'; (c) the `ω^{(i)}, i ∉ R`, form a basis of `Ann_p(⟨D₁, …, D_r⟩)`,
and `p^δ ω^{(i)}` is integral and known modulo `p^{k−δ}`. When `⟨D₁, …, D_r⟩` has finite index in `J(ℚ)`
these are annihilating differentials of `X` with exact precision.

Work under the following conditions. Good-reduction datum; the `D_j` generate a subgroup of `rank r < g`
(exact by `ED.3`); entries of `M` are computed by §4.5 or tiny integrals to absolute precision `p^k`.
Valuations are exact by §0.8; p-adic approximations are those of §0.6.

For the proof, The minor of `M` differs from that of M' by an element of valuation `≥ k > δ`, so it has
valuation `δ` and `M` has rank r; (a) follows with §4.9 (a), (b). Cramer's rule: `M_R⁻¹ = adj(M_R)/det M_R` has entries of valuation `≥ −δ`; x' `− x = M_R'⁻¹(m' − m) − M_R'⁻¹ E_R M_R⁻¹ m` with `E =` M' `− M`,
giving valuation `≥ k − 2δ`. The `ω^{(i)}` are linearly independent (each involves `ω_i` with coefficient
1) and annihilate the `D_j` by construction, so they span the (g − r)-dimensional annihilator.

**Checks.**

- McCallum–Poonen Example 3: `g = 2, r = 1, M =` (`∫` dx/y, `∫` x dx/y)ᵀ over [`(−3,1) − (0,1)`] known modulo `3⁵` with minor valuation `δ = 1` on the row of dx/y; the theorem determines `ε =` −(`∫` x dx/y)/(`∫` dx/y) modulo `3^{5−2} = 3³`, consistent with McCallum–Poonen's `ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴`), which they obtain from the same data modulo `3⁵` because `v(∫ x` dx/y) `= 2`.
- Degenerate case `r = 0: M` is empty, `R = ∅` and every `ω_i` is annihilating, with no precision loss.

([Samir Siksek](https://arxiv.org/abs/1010.2603), §4 Remark (iii), p.9; [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §3 proof of Lemma 5, p.10; [McCallum–Poonen
(2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.3, equation (4), author copy p.11.)

*Needs:* §4.9; §4.5; §3.21; §0.8; §0.6.

### 4.11 Zero bounds for integrals on a residue disc, including exceptional discs

Let p be a prime and `f = Σ_{i≥0} a_i t^i ∈ ℚ_p[[t]]` with f' `∈ ℤ_p[[t]]`. Then f converges on `pℤ_p` and
`f(pT) = Σ a_i p^i T^i` has coefficients tending to 0. Use the extended valuation `v(0) = +∞` throughout
this section; in an implementation using `Padic.valuation` (which assigns 0 to zero), restrict minima to
nonzero coefficients. Define the disc Strassmann index `N_p(f) :=` the largest i with `v(a_i) + i = min_j (v(a_j) + j)`, for `f ≠ 0`. (a) If `f ≠ 0, f` has at most `N_p(f)` zeros in `pℤ_p`. (b)
(McCallum–Poonen Lemma `5.1`) If `m := ord_{t=0}(f' mod p) < p − 2`, then `N_p(f) ≤ m + 1`. (c)
(McCallum–Poonen Remark `5.2`) If the coefficient of `t^{p−1}` in f' lies in `pℤ_p` and `m < 2p − 2`, then
`N_p(f) ≤ m + 1`. (d) (exact index) If an index `N` and an integer `μ` satisfy `a_N ≠ 0, v(a_N) + N = μ`, and, for every `i > N`, either `a_i = 0` or `v(a_i) + i > μ`, then f has at most `N` zeros in `pℤ_p`.
Because `v(a_i) ≥ −v_p(i)` for `i ≥ 1`, the inequality for `i > N` holds automatically once `i − v_p(i) > μ`, so only finitely many indices need checking; if each coefficient `a_i` with `i − v_p(i) ≤ μ` is known
modulo `p^{k_i}` with `k_i + i > μ` and the approximations satisfy both conditions, then the true
coefficients satisfy them, and the bound holds for the true series. (e) Exceptional discs, `m ≥ p − 2`
or m unknown, are treated by (a) and (d): the bound is `N_p(f)` for the actual series, not m + 1.
Applied to `f = I_B` on a residue disc (`§4.4`, §4.7), (a)–(e) bound the zeros of `η` on that disc. The norm-form target carries convergence of the coefficients of `f(pT)`,
a nonzero N-th coefficient and strict domination of every later scaled coefficient;
it gives finiteness and at most N distinct zeros on the closed disc. Zeros mean
convergent evaluation equal to zero.

Work under the following conditions. p prime; f' `∈ ℤ_p[[t]]` (scale `ω` so that it is integral with
nonzero reduction); zeros counted as distinct points of `pℤ_p`. In (d), 'known modulo `p^{k_i}'` means a
exact rational approximation `(§0.8)`.

For the proof, (a) Apply Strassmann's theorem (`§4.26`, over `ℚ_p`) to `g(T) = f(pT)`, whose coefficients
`a_i p^i` tend to 0 because `v(a_i) ≥ −v_p(i)`; the largest index of maximal `|a_i p^i|` is `N_p(f)`; zeros
`t ∈ pℤ_p` of f correspond to zeros `T = t/p ∈ ℤ_p` of g. `(b) v(a_{m+1}) = 0` and, for `i > m + 1, v(a_i) ≥ −v_p(i) > m + 1 − i`, because `i − v_p(i) > m + 1` when `m + 1 < p − 1`; so the minimum of `v(a_i) + i`
is attained at an index `≤ m + 1` (McCallum–Poonen Lemma `5.1` proof). (c) The hypothesis excludes `m = p − 1`; for `p ≤ i ≤ 2p − 1` only `i = p` has `v_p(i) = 1`, and there `v(a_p) = v(w_{p−1}) − 1 ≥ 0`; for `i ≥ 2p`
one has `i − v_p(i) > m + 1` (for `p ≥ 3` because `i − v_p(i) ≥ 2p − 1`; for `p = 2` the hypotheses force `m = 0` and `i − v_2(i) ≥ 2`); so again no index beyond m + 1 is dominant. (d) If the largest dominant
index N' exceeded `N`, then `v(a_{N'}) +` N' `≤ v(a_N) + N = μ`, contradicting `v(a_{N'}) +` N' `> μ`; so
`N_p(f) ≤ N` and (a) applies. Perturbations of size `p^{k_i}` with `k_i + i > μ do` not change these
inequalities. (e) restates (a) and (d) for the discs excluded from (b), (c). Zero coefficients have
weight `+∞` and never win the minimum. Regression: `f(t) = t` has `N_p(f) = 1` although its constant
coefficient is zero; do not use `Padic.valuation 0 = 0` as its weight.

**Checks.**

- McCallum–Poonen Example 2: on the disc of `(0, 1)` of `C₀(5)` at `p = 3, m = 1 = p − 2`, the coefficient of `t²` in w vanishes mod 3, so (c) gives at most 2 zeros; the rescaled series has `v(a_i) + i = ∞, 2, 2, 5, 4, …` for `i = 0, 1, 2, 3, 4`, so `N_3 = 2`.
- `C₁(3₂)` at `p = 3` on the disc of the Weierstrass point `(1, 0)` with parameter y + 3: `m = 2 > p − 2`, and `v(a_i) + i = ∞, 2, 3, 2, 6, 6, 7, …` so `N_3 = 3` by (d).
- Stoll's disc of `(∞, −1)` on `X₀^dyn(6)` at `p = 5: m = 1 < p − 2 = 3`, so at most 2 zeros by (b).
- Degenerate case f' `= 0`: f is constant and has no zeros unless `f = 0`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.3 Lemma 5.1, author
copy p.6; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.3 Remark
5.2, author copy p.6; [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §8
Theorem 4, p.21; [Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3 proof of Lemma 5, p.10.)

*Needs:* §4.26; ColemanIntegration §L0.2; Mathlib PowerSeries; Mathlib `PowerSeries.IsRestricted`; Mathlib `padicValNat`; Mathlib `Padic.valuation`; §0.8.

### 4.12 Chabauty's theorem: finiteness when the closure of `J(ℚ)` is small

Let `X` be a smooth projective geometrically integral curve of genus `g ≥ 2` over `ℚ` with a rational
point `O, J` its Jacobian, p a prime and `r₀` the dimension of the p-adic closure of `J(ℚ)` in `J(ℚ_p) (§4.8)`. If `r₀ < g`, in particular if `r := rank J(ℚ) < g`, then `ι_O⁻¹(closure` of `J(ℚ)) ∩ X(ℚ_p`) is
finite; hence `X(ℚ)` is finite. Moreover, for p of good reduction its cardinality is at most `Σ_{x̃ ∈ X̃(𝔽_p)} N_p(I_x̃)` for any nonzero `ω ∈ Ann_p(J(ℚ))` normalised to be integral with nonzero reduction,
where `I_x̃` is the expansion of `η = ∫_O ω` on `D(x̃)`.

Work under the following conditions. `g ≥ 2; O ∈ X(ℚ); J(ℚ)` finitely generated (Mordell–Weil,
supplied by HeightsRationalPointsAndObstructions Layer 1). For p of bad reduction the residue classes are those of the minimal regular model
`(§4.14)`.

For the proof, `Ann_p(J(ℚ))` has dimension `g − r₀ ≥ 1 (§4.9` (a)); choose `ω ≠ 0` in it, scaled to be
integral with nonzero reduction. `η(P) = ⟨ι_O(P), ω_J⟩` is continuous and vanishes on `J(ℚ)`, hence on
its closure, so every point of `ι_O⁻¹(closure) ∩ X(ℚ_p)` is a zero of `η`. For p of good reduction
`X(ℚ_p)` is the union of the finitely many discs `D(x̃) (§4.1)`; on each, `η` is `η(B) + I_B(t)` with `I_B' = w ≠ 0` since `ω ≠ 0 (§4.4`, §4.7), so it has at most `N_p` zeros (`§4.11` (a)). For an arbitrary p use the
residue classes of the smooth locus of the minimal regular model, each parametrised by `pℤ_p`, with
the same argument `(§4.14). X` has good reduction at all but finitely many p, so `X(ℚ) ⊆ ι_O⁻¹(J(ℚ)) ∩ X(ℚ_p)` is finite whenever `r < g`.

**Checks.**

- The rank-one datum for `C₀(5)` gives Chabauty finiteness. For `C₁(3₂)` this route additionally assumes `rank J(ℚ)≤1`; for `X₀^dyn(6)` it assumes `rank J(ℚ)≤3`.
- Sharpness of the hypothesis: when `r₀ = g` the closure of `J(ℚ)` is open in `J(ℚ_p)` and contains a neighbourhood of `ι_O(O)` in `ι_O(X(ℚ_p))`, so the closure set is infinite (McCallum–Poonen §7 (2)).

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §4.3 Theorem 4.4,
author copy p.5; [Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §8
Proposition 8, p.18.)

*Needs:* §4.8; §4.9; §4.4; §4.7; §4.11; §4.1; §4.14; HeightsRationalPointsAndObstructions Layer 1.

### 4.13 Coleman's effective Chabauty bound at a prime of good reduction

Let (`X, O, p`, 𝒳) be a good-reduction Chabauty datum with `g ≥ 2` and `r₀ < g`, and `ω ∈ Ann_p(J(ℚ))`
nonzero, scaled so that `ω ∈ H⁰(𝒳, Ω¹)` with nonzero reduction `ω̃ ∈ H⁰(X̃, Ω¹)`. (a) For x̃ `∈ X̃(𝔽_p)`
with `m := ord_x̃ ω̃`, the number of `P ∈ X(ℚ)` with red `P =` x̃ is at most the number of zeros of `η` on
`D(x̃)`, hence at most `N_p` of the disc expansion, and at most m + 1 if `m < p − 2`. (b) If `p > 2g`, then
`#X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2`.

Work under the following conditions. Good reduction at p; rank condition `r₀ < g` (in particular `r < g); ω` annihilates `J(ℚ)`, which may be exact from any finite-index subgroup `(§4.9 (b))`.

For the proof, (a) If `D(x̃)` contains `Q ∈ X(ℚ)`, every `P ∈ X(ℚ) ∩ D(x̃)` satisfies `∫_Q^P ω = 0` because
`[P − Q] ∈ J(ℚ)`; by §4.4 this is a zero of `I_Q(t(P))` with `I_Q' = w` and w mod p of order m at 0; apply
§4.11 (a), (b). `(b) Σ_{x̃ ∈ X̃(𝔽_p)} ord_x̃ ω̃ ≤` deg `div(ω̃) = 2g − 2` (Riemann–Roch on X̃, supplied
by SchemeAndStackFoundations §§3.3, `3.8`), so each `m ≤ 2g − 2 < p − 2` when `p > 2g`, and summing `(m_x̃ + 1)`
over `X̃(𝔽_p)` gives the bound (McCallum–Poonen Theorem `5.3` proof).

(b) If `p > 2g`, then `#X(ℚ) ≤ #X̃(𝔽_p) + 2g − 2`.

**Checks.**

- McCallum–Poonen Example 1: `y² = x(x − 1)(x − 2)(x − 5)(x − 6)` at `p = 7, rank 1, #X̃(𝔽_7) = 8`, so `#X(ℚ) ≤ 10`, and the ten points `(0,0), (1,0), (2,0), (5,0), (6,0), (3, ±6), (10, ±120), ∞` attain it.
- Flynn–Poonen–Schaefer: for `C₀(5)` the best bound from (b) is `9 (p = 5)`, insufficient; the per-disc analysis at `p = 3 (§4.23)` gives 6.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.5 Theorem 5.3(a),
author copy p.7; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §5.5
Theorem 5.3(b), author copy p.7; [McCallum–Poonen
(2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.1 Example 1, author copy p.9.)

*Needs:* §4.9; §4.4; §4.11; §4.1; SchemeAndStackFoundations §§3.3, `3.8`.

### 4.14 Chabauty–Coleman at a prime of bad reduction via the minimal regular model

Let `X` be a smooth projective geometrically integral curve of genus `g ≥ 2` over `ℚ` with `O ∈ X(ℚ), J` its
Jacobian with `r₀ < g` at the prime p, 𝒳 `→ Spec ℤ_p` the minimal proper regular model of `X_{ℚ_p}`
(StableReduction layer `5), 𝒳_s` its special fibre, `𝒳^sm` the smooth locus of 𝒳 `→ Spec ℤ_p` and `𝒳_s^sm`
its special fibre. Residue classes are the fibres of red : `X(ℚ_p) = 𝒳(ℤ_p) = 𝒳^sm(ℤ_p) → 𝒳_s^sm(𝔽_p)`; each class lies on a single component `C` of multiplicity 1 and is parametrised by `pℤ_p`
through a local parameter. Let `ω ∈ Ann_p(J(ℚ))` be nonzero. (1) For a multiplicity-one component `C`
scale `ω` by a power of p so that its restriction `ω̃_C` to `C^sm := C ∩ 𝒳^sm` is a nonzero 1-form; for Q̃
`∈ C^sm(𝔽_p)` with `m := ord_Q̃ ω̃_C < p − 2`, at most m + 1 points of `X(ℚ)` reduce to Q̃ (and at most
`N_p` of the class expansion in general). (2) If `n_C` denotes the number of zeros of `ω̃_C` on `C^sm(𝔽_p)`
counted with multiplicity, then `Σ_{C of multiplicity 1} n_C ≤ 2g − 2`. (3) If `p > 2g`, then `#X(ℚ) ≤ #𝒳_s^sm(𝔽_p) + 2g − 2`. (4) For every prime p with `r₀ < g` the set `ι_O⁻¹(closure` of `J(ℚ)) ∩ X(ℚ_p`) is
finite.

Work under the following conditions. Separately stated hypotheses: 𝒳 is the minimal proper regular
model over `ℤ_p` (regularity is what makes `X(ℚ_p) = 𝒳^sm(ℤ_p)` and the intersection theory available);
no smoothness of 𝒳 is assumed. The scaling in (1) depends on `C: ω_C = p^{k_C} ω` with `C` absent from
the divisor of `ω_C` as a section of the relative dualising sheaf. The relative canonical sheaf
`ω_{𝒳/ℤ_p}` of the local complete intersection 𝒳 `→ Spec ℤ_p`, with `ω_{𝒳/ℤ_p} ≅ Ω¹` on the smooth locus
and compatibility with base change (Liu Proposition `6.4.9`), is supplied by
SchemeAndStackFoundations §2.20.

For the proof, `Ω¹_{X/ℚ_p} ≅ ω_{𝒳/ℤ_p} ⊗ ℚ_p`, so `ω` is a rational section of `ω_{𝒳/ℤ_p}` with canonical
divisor `K = H + V, H` horizontal effective (`ω` regular on `X`) and `V` vertical (McCallum–Poonen Appendix
A, `p.13`). (1) Q̃ is a smooth point of `𝒳_s`, so the residue-class parametrisation and tiny-integral
expansion of §4.4 hold on its class (same proof, on the smooth locus); apply §4.11. (2) Lemma `A.3`:
`(H.C)_P = ord_P(ω̃_C)` for `P ∈ C^sm`, so `n_C ≤ Σ_P (H.C)_P ≤ H.C`. Lemma `A.4: Σ_C n_C ≤ Σ_D m_D (H.D) = H.𝒳_s = K.𝒳_s = 2g − 2`, using `H.D ≥ 0, V.𝒳_s = 0` and the adjunction formula of StableReduction layer
5. (3) Every rational point reduces into `𝒳_s^sm(𝔽_p)`, on a multiplicity-one component; sum (1) over
classes and use (2) with `m ≤ 2g − 2 < p − 2`. (4) Finitely many classes, each with finitely many
zeros of `η (§4.11` (a)).

Let `ω ∈ Ann_p(J(ℚ))` be nonzero. (3) If `p > 2g`, then `#X(ℚ) ≤ #𝒳_s^sm(𝔽_p) + 2g − 2`.

**Checks.**

- Good reduction is the special case 𝒳 smooth, `𝒳_s =` X̃ irreducible of multiplicity one, recovering §4.13.
- For `X₀^dyn(6)` at `p = 2` the special fibre of the minimal regular model has five components A, `B, C`, C', `D` of multiplicity one (Stoll §2); (3) does not apply since `p = 2 ≤ 2g`, while (1) applies componentwise.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), Appendix A Theorem A.5,
author copy p.15; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf),
Appendix A Lemma A.3, author copy p.14; [McCallum–Poonen
(2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), Appendix A, author copy p.13.)

*Needs:* StableReduction Layer 5 (regular and minimal models); §4.9; §4.4; §4.11; §4.3; SchemeAndStackFoundations §2.20.

### 4.15 Integral differentials and residue-disc parameters for good-reduction hyperelliptic models

Let p be an odd prime and `f ∈ ℤ_p[x]` squarefree of degree 2g + 1 or `2g + 2 (g ≥ 1)` whose leading
coefficient and discriminant are units of `ℤ_p`. Then the two affine charts `y² = f(x)` and `v² = u^{2g+2} f(1/u)`, glued by `x = 1/u, y = v/u^{g+1}`, form a smooth projective model 𝒳 over `ℤ_p` of the
hyperelliptic curve `X : y² = f(x)`, and: (a) `H⁰(𝒳, Ω¹)` is free over `ℤ_p` with basis `x^i` dx/y, `0 ≤ i ≤ g − 1`, reducing to the basis of `H⁰(X̃, Ω¹)` given by the same formulas; (b) local parameters: at an
affine point `(x₀, y₀)` with `ỹ₀ ≠ 0, t = x − x₀` with `y = y₀√(f(x₀ + t)/y₀²) ∈ ℤ_p[[t]]`; at a
Weierstrass point `(x̃₀, 0)` of X̃, `t = y`, with `x ∈ ℤ_p[[t]]` determined by `f(x) = t²` and dx/y `= 2`
dt/f'(x); at a point at infinity (degree `2g + 2), t = u =` 1/x, with `x^i` dx/y `= −u^{g−1−i}` du/v; at
the point at infinity when deg `f = 2g + 1` (the Weierstrass point `u = v = 0), t = v`, with `u ∈ ℤ_p[[t]]` determined by `v² = u^{2g+2} f(1/u)` and the same formula for `x^i` dx/y; (c) consequently
`ord_{∞^±}(x^i` dx/y mod `p) = g − 1 − i` when deg `f = 2g + 2`, and `ord_∞(x^i` dx/y mod `p) = 2(g − 1 − i`)
when deg `f = 2g + 1`, and for `ω̃ = c(x)` dx/y with `c ∈ 𝔽_p[x]` of degree `≤ g − 1` the order of `ω̃` at an
affine non-Weierstrass point `x̃₀` is `ord_{x̃₀}(c)`, and at a Weierstrass point `x̃₀` it is
`2·ord_{x̃₀}(c)`.

Work under the following conditions. p odd; f has unit leading coefficient and unit discriminant
(this gives good reduction of the displayed model); degree 2g + 1 or 2g + 2. Shifted parameters `t − t(Q)` centred at a rational point `Q` of the disc are equally admissible.

The interface includes these statements.

- Supporting local polynomial/power-series identity; the integral differential basis and its orders require the geometric chart comparisons.

For the proof, Smoothness: the Jacobian criterion on both charts reduces to f̃ squarefree of degree
2g + 1 or 2g + 2 over `𝔽_p, p` odd. (a) Over the generic and the special fibre the forms `x^i` dx/y, `i < g`, are a basis of the regular differentials of a hyperelliptic curve (AlgebraicCurves layer 10,
Stichtenoth Proposition `6.2.4`); they are regular on 𝒳 and their reductions are independent, so they
span the saturated lattice `H⁰(𝒳, Ω¹)`. (b) y is a unit on the disc of a non-Weierstrass point, so the
binomial series gives the square root in `ℤ_p[[t]]`; at a Weierstrass point `f'(x̃₀) ≠ 0` by
squarefreeness, so x is a `ℤ_p[[t]]` solution of `f(x) = t²` by Hensel's lemma, and `2y dy =` f'(x) dx; at
infinity substitute `x =` 1/u. (c) Read off orders from (b): `x − x̃₀` has a double zero at a
Weierstrass point in the parameter y.

For a smooth good-reduction hyperelliptic model `y²=f(x), 2` invertible and degree 2g+1 or2g+2, prove dx/y,x `dx/y,…,x^(g−1)dx/y` form the integral basis and compute orders in each affine/infinity chart. State and derive smoothness/discriminant and infinity charts on the actual model.

**Checks.**

- `C₀(5)` at `p = 3: ω̃ = x` dx/y has zeros of order 1 at `(0, ±1)` and order 0 at `∞^±`; dx/y vanishes to order 1 at `∞^±`.
- `C₁(3₂)` at `p = 3: (x − 1)` dx/y has a double zero at the Weierstrass point `(1, 0)` and no other zeros, total `2 = 2g − 2`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.2 proof of
Proposition 8.2, author copy p.10; [Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §4
proof of Proposition 2, p.17; [Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §4 proof of
Proposition 2, p.16.)

*Needs:* AlgebraicCurves Layer 10 (hyperelliptic and plane models); §4.1; Mathlib PowerSeries.

### 4.16 Residue-disc verdicts: exact zero counts accounting for every zero

For a good-reduction geometric Chabauty datum, choose a nonzero differential annihilating a
finite-index subgroup of `J(ℚ)` and put `η(P) = ∫_O^P ω`. Let finitely many pairwise disjoint
parameter balls partition a residue disc. On each ball use the actual restricted pullback
`F(u) = p^s η(φ(p(a + p^k u)))`, with `φ` the inverse formal chart.
Assume finite coefficient congruences modulo `p^M`, a nonzero coefficient of minimum valuation
`m < M`, a last dominant index `N`, and strict tail valuations greater than m after `N`.
Together with convergence these imply the Strassmann bound `N` of §4.26.
One sufficient automatic tail rule is `v_p([u^n]p^s I(pu)) ≥ s + n − v_p(n)` for
`n ≥ 1, s ≥ 0, I′` integral; `K ≥ 2(m+1)` gives valuation at least m+1 for
`n ≥ K`. The constant coefficient is a separate hypothesis.

For each ball suppose `N` distinct exact algebraic zeros are identified in their actual
`ℚ_p` embeddings. Partition them into rational and nonrational points by exact algebraic
conditions. Then every zero in that ball is listed and every rational point lies among its
rational listed zeros. Define ResidueDiscVerdict as this mathematical configuration;
zeros is its exact zero set, Valid is the displayed conjunction, and `rationalPoints_eq`
is equality of `X(ℚ)` in the disc with the union of the rational lists.
Its API includes `ofKnownPoint` (constant zero at a rational base point), empty for
`N = 0, card_le`, and `changeBase` under the actual affine substitution and
constant-change identities. Prove `dominant_of_residue_bounds` from the finite congruences
and independent strict tail bound. A constant upper bound without decay does not establish
restrictedness. A Hensel-isolated analytic root alone establishes neither rationality nor
nonrationality. Repeated descriptions of the same zero count once.

For the proof, apply Strassmann on each full ball, saturate its bound by the listed distinct
zeros, and use the partition. Each rational point is a zero because the annihilator of a
finite-index subgroup equals that of `J(ℚ)`. Without finite index the result applies only
to points whose Abel–Jacobi class lies in the saturation of the subgroup.

**Checks.**

- For `C₀(5), p = 3`, x̃ `= (0, 1): B = (0, 1), t = x, N = 2, Z_rat = {(0, 1), (−3, 1)}, Z_irr = ∅` is valid.
- For `C₁(3₂), p = 3`, x̃ `= (1, 0): B = S⁻ = (1, −3), t = y + 3, N = 3, Z_rat = {S⁻, S⁺}, Z_irr = {W}` with `W` the Weierstrass point over `ℚ_3 (x(W)` a root of `x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1`, which has no rational root; `c_B = 0` and `2(ι_O(W) − ι_O(S⁻)) = [S⁺ − S⁻] ∈ G`) is valid.
- A valid verdict with `N = 0` proves that `D(x̃)` contains no rational point.
- For `C₁(3₂)` at x̃ `= (1, 0)`, the tuple with `N = 3, Z_rat = {S⁻, S⁺}, Z_irr = ∅` is not a verdict (#Z `≠ N`): listing the known rational zeros without accounting for every zero proves nothing.
- If the verdict is valid and `P ∈ X(ℚ)` reduces to x̃, then `P ∈ Z_rat`.
- A coefficient table whose entries are all zero modulo the recorded precision does not certify a nonzero series or last dominant coefficient and is rejected.
- A tail bound permitting a coefficient beyond `N` at the same norm as the claimed dominant coefficient is rejected; a strict tail bound is required.
- For `p=3`, subdividing a ball into only the residue children0 and1 omits child2 and is rejected even if both supplied leaves have valid zero counts.
- Counting the same exact zero twice, even with two different approximate coordinate strings, cannot saturate a bound2 and is rejected unless exact distinctness is exact.
- For `p=3, M=1, m=N=0` and `residues[1,0]`, the coefficient bounds hold; combined with its separate analytic interpretation and strict tail bound, Strassmann gives no zero.
- For `p=3, M=1, m=0, N=1` and `residues[0,1]`, the coefficient bounds hold.
- For `p=3, M=1, m=N=0` and `residues[1,1]`, the coefficient bounds fail because a later coefficient ties the claimed last dominant index.
- For `p=3, M=1, m=N=0` and `residues[1]`, the coefficient bounds fail: the sufficient automatic-tail cutoff requires at least2 coefficients.
- For `p=3, M=1, m=N=0` and `residues[0,0]`, the coefficient bounds fail because no dominant nonzero coefficient is determined.
- The verdicts of §4.23 `(N = 1, 1, 2, 2)` and of §4.24 (six discs with `N = 1`, the Weierstrass disc with `N = 3` and `Z_irr = {W}`).
- Degenerate case: the empty verdict `N = 0`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.2 proof of
Proposition 8.2, author copy p.10; [Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §4
proof of Proposition 2, p.17; [McCallum–Poonen
(2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §7 (5), author copy p.9.)

*Needs:* §4.9; §4.10; §4.7; §4.11; §4.4; §4.1; §0.8; §0.2; §0.9.

### 4.17 Chabauty–Coleman datum

A Chabauty–Coleman datum for a smooth projective geometrically integral curve `X` over `ℚ` of
genus `g ≥ 2`, given by explicit equations, consists of: (1) a rational base point `O ∈ X(ℚ)` and a
finite list `L ⊆ X(ℚ)` of verified rational points; (2) a finite-index subgroup datum `(§3.21)`
for a subgroup `G = ⟨D₁, …, D_r⟩ ⊆ J(ℚ)`, whose rank datum `(§3.7)` gives `rank J(ℚ) = r < g`, or,
in the conditional variant, a labelled hypothesis 'rank `J(ℚ) ≤` r' together with an unconditional
datum that the `D_j` are independent; (3) a prime p and a good-reduction datum (`X, O, p`, 𝒳) with
a datum that 𝒳 is smooth over `ℤ_p`; (4) the complete list of `X̃(𝔽_p)`, with its completeness
proved by enumeration of the finite set of points of the special fibre; (5) annihilating
differentials `ω₁, …, ω_k ∈ Ann_p(G)` with exact precision `(§4.10); (6)` for every x̃ `∈ X̃(𝔽_p)` a
residue-disc verdict `(§4.16)` for one of the `ω_i`, whose `Z_rat` is contained in `L`. It is valid when
every component datum is valid and every listed point of `X̃(𝔽_p)` carries a valid verdict. A
datum whose rank input is the labelled hypothesis is conditional, and every consequence drawn
from it carries the same label.

Work under the following conditions. `X/ℚ` smooth projective geometrically integral of genus `g ≥ 2`
with explicit equations; `r < g`. The prime p may be any prime of good reduction for the chosen model,
including `p ≤ 2g`; exceptional discs are covered by verdicts with exact Strassmann bounds.
Number-field and bad-reduction variants are separate statements with their own hypotheses (`§4.19`,
§4.14); this datum is the good-reduction version over `ℚ`.

The interface includes these statements.

- The list `L` of rational points.
- Validity: (1)–(6) hold.
- The verdict attached to each x̃ `∈ X̃(𝔽_p)`.
- The verdicts are indexed by the complete list `X̃(𝔽_p)`.
- Either the `ED.3 rank` datum or the labelled hypothesis `rank J(ℚ) ≤ r`.
- #L `≤ Σ_{x̃} N_x̃`.
- The conditional datum built from a labelled rank hypothesis.
- Supporting mathematical record with an already established finite-index input. This helper does not derive index from rank, independence or genus.
- For finitely generated A, r independent generators modulo torsion and `rank(A)≤r`, their generated subgroup has finite index. This derives the abstract index rather than assuming it; actual `J(Q)` and the geometric annihilator remain supplier obligations.

For the proof, The data are finite: divisors and coefficient residues, complete chart/point
lists and finite disc trees. The actual group, differential, model and analytic-series
identifications and infinite-tail bounds are explicit mathematical hypotheses of the soundness
theorem, not facts implied by a finite digit list. Given those hypotheses, `ED.0/ED.3/ED.4` soundness
reduces the remaining inequalities to exact finite comparisons. The conditional variant records the
rank hypothesis as an input field rather than a datum, following Stoll's Theorem 6 and Theorem
7.

Given actual `J(Q)` finitely generated, `g≥1, rank J(Q)≤r<g, r` exact independent generators modulo torsion, show their subgroup has full rank and finite index by the FG free quotient. Its p-adic log span has `dimension≤r`, so construct nonzero `ω∈H⁰(X_Qp,Ω¹)` annihilating it; only then construct all analytic disc verdicts. Conditional rank labels must be recorded; `withFiniteIndex` is merely a semantic helper. For C05, the rank/model/differential and four-disc coefficient/error tables are explicit inputs; check every disc verdict and derive completeness rather than receive Valid or a complete point-set assertion.

For `C₀(5)` with `O = ∞⁺, G = ⟨[(−3,1) − (0,1)]⟩, r = 1, p = 3`: four verdicts with `N = 1, 1, 2, 2` at `∞⁺, ∞⁻, (0, 1), (0, −1)`, and `L` of size `6 = Σ N`. Use the actual curve and rank-labelled geometric constructor `ChabautyColemanData.ofRankHypothesis`, together with the required genuine rank, annihilator and complete disc-verdict data. For C05, construct the exact six distinct rational points and the four discs with bounds1,1,2,2; verify the list and equality, not only an upper bound from an assumed sum.

A datum built by `ofRankHypothesis` is conditional and its completeness theorem is stated under the labelled hypothesis. Check that the stored conditional label is precisely the rank hypothesis and that the soundness/completeness result still requires that hypothesis. Equality of the points field under `withFiniteIndex` alone is insufficient.

**Checks.**

- For `C₀(5)` with `O = ∞⁺, G = ⟨[(−3,1) − (0,1)]⟩, r = 1, p = 3`: four verdicts with `N = 1, 1, 2, 2` at `∞⁺, ∞⁻, (0, 1), (0, −1)`, and `L` of size `6 = Σ N`.
- If `J(ℚ)` is finite `(r = 0), G = 0` is of finite index and every `ω ∈ H⁰(𝒳, Ω¹)` is annihilating.
- For `C₁(3₂)` at `p = 3`, verdicts on the six discs other than `(1, 0)` do not form a valid datum, even though each is valid: the list of discs must be all of `X̃(𝔽_3)`.
- No datum exists when `rank J(ℚ) ≥ g` and `r₀ = g`: then `Ann_p(J(ℚ)) = 0` (McCallum–Poonen Example `4, y² = x⁶ + x² + 1` with `r = r₀ = 2`).
- A datum built by `ofRankHypothesis` is conditional and its completeness theorem is stated under the labelled hypothesis.
- Supporting mathematical inequality: `C.Valid` and the supplied total disc bound6 imply `C.points.card≤6`. It does not construct C05 or prove six distinct actual points.
- Supporting equality: `withFiniteIndex` preserves the points field of the supplied mathematical record. It neither constructs a datum from a rank hypothesis nor tests its conditionality label.
- The datum of §4.23 for `C₀(5)` at `p = 3` is valid and unconditional; those of §4.24 and §4.25 are conditional with their labels.
- Degenerate case `r = 0: G = 0` and every differential is annihilating.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.2 Proposition 8.2,
author copy p.10; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §6
Remark 6.1, author copy p.8; [Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3 Theorem 6,
p.10.)

*Needs:* §4.16; §4.1; §4.10; §3.21; §3.7; §3.22.

### 4.18 A valid Chabauty–Coleman datum determines `X(ℚ)`

Let 𝒞 be a valid Chabauty–Coleman datum `(§4.17)` for `X` with list `L`. Then `X(ℚ) = L`. If 𝒞 is
conditional on the labelled hypothesis `rank J(ℚ) ≤ r`, then `X(ℚ) = L` holds under that hypothesis, and
unconditionally every `P ∈ X(ℚ)` with `ι_O(P)` in the saturation of `G` in `J(ℚ_p)` lies in `L`.

Work under the following conditions. 𝒞 valid; in the conditional case the conclusion carries the
rank hypothesis as a label.

For the proof, `L ⊆ X(ℚ)` by verification of the listed points. Let `P ∈ X(ℚ)`. `X` is proper, so `P ∈ X(ℚ_p)` reduces to some x̃ `∈ X̃(𝔽_p)`, which appears in the complete list (4). `ι_O(P) ∈ J(ℚ); G` has
finite index (unconditionally from `ED.3`, or by the labelled hypothesis together with the
independence of the `D_j`), so each `ω_i ∈ Ann_p(G) = Ann_p(J(ℚ)) (§4.9 (b))` and `η(P) = 0`. The verdict
at x̃ is valid, so `P ∈ Z_rat ⊆ L (§4.16)`. Unconditional part: `ω_i` annihilates the saturation of `G (§4.9 (c))`, so the same argument applies to `P` with `ι_O(P)` in it (Stoll Lemma 5).

**Checks.**

- `C₀(5): X(ℚ) = {∞⁺, ∞⁻, (0, ±1), (−3, ±1)} (§4.23)`.
- Degenerate case: a datum in which every disc has `N` equal to the number of known rational points and `Z_irr = ∅` gives `#X(ℚ) = Σ N`.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.2 Proposition 8.2,
author copy p.10; [Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3 Lemma 5, p.9.)

*Needs:* §4.17; §4.16; §4.9; §4.1.

### 4.19 Siksek's criterion: Chabauty in a single unit ball over a number field

Let `K` be a number field of degree `d, C` a smooth projective geometrically integral curve over `K` of
genus `g ≥ 2` with Jacobian `J, D₁, …, D_r` a basis of a free subgroup of finite index in `J(K)`, and p a
rational prime such that (p1) p is odd, (p2) p is unramified in `K`, (p3) every prime `υ | p` of `K` is a
prime of good reduction for `C` (a good-reduction datum over `O_υ`, §4.1). Fix `ℤ_p-bases θ_{υ,1}, …, θ_{υ,d_υ}` of `O_υ` and `O_υ-bases ω_{υ,1}, …, ω_{υ,g}` of `H⁰(𝒞_υ, Ω¹)`. For `ω ∈ H⁰(𝒞_υ, Ω¹)` let `τ_j = ∫_{D_j} ω = Σ_i t_{ij} θ_{υ,i} (t_{ij} ∈ ℚ_p), T_{υ,ω} = (t_{ij}), T_υ` the stack of the
`T_{υ,ω_{υ,l}}` and `T` the stack over `υ | p` (a `gd × r` matrix over `ℚ_p`). For `Q ∈ C(K)`, a well-behaved
uniformiser `t_Q` at `Q` (a local coordinate at Q̃ shifted to vanish at `Q`) and `α = (ω/dt_Q)(Q) ∈ O_υ`,
let `A_{υ,ω}` be the `d_υ × d_υ` matrix of multiplication by `α` in the basis `θ, A_υ` the stack over
`ω_{υ,l}` and A the block-diagonal matrix of the `A_υ (gd × d` over `ℤ_p`). Choose a `≥ 0` with `p^a T`
integral and a unimodular `U` with `U(p^a T)` in Hermite normal form with h zero rows; let `M_p(Q)` be the
last h rows of `U` A. If the reduction `M̃_p(Q) ∈ M_{h×d}(𝔽_p)` has rank d, then `C(K) ∩ B_p(Q) = {Q}`,
where `B_p(Q) = ∏_{υ|p} B_υ(Q)` is the p-unit ball of points reducing to Q̃ at every `υ | p`. The rank
of `M̃_p(Q)` does not depend on `U`; the necessary dimension condition is `h ≥ d`. The familiar `r ≤ d(g − 1)` condition follows when `rank(T)=r`, hence `h=gd−r`; without this full-rank assumption it is a
sufficient dimension heuristic, not a necessary condition.

Work under the following conditions. Separately stated hypotheses of the number-field variant: (p1)
p odd; (p2) p unramified in `K`; (p3) good reduction at every `υ | p; D₁, …, D_r` a basis of a free
finite-index subgroup of `J(K)` (its finite index requires an unconditional rank datum, `ED.3`).
Finite approximations alone generally certify all h kernel rows only in the full-rank case
`h=max(gd−r,0)`, using annihilator-precision. Exact dependencies or another exact kernel
construction may also certify a larger h; `r≤d(g−1)` is not a universal necessity.

For the proof, Integrality (Siksek Lemma `3.2`): for p odd and `K_υ/ℚ_p` unramified, `∫_Q^P ω = α z + β z²` with `z = t_Q(P) ∈ πO_υ, α, β ∈ O_υ (§4.4 (d))`. If `P ∈ C(K) ∩ B_p(Q)`, then `m(P − Q) = Σ n'_j D_j`
with m the index, so `∫_Q^P ω = Σ n_j τ_j` with `n_j = n'_j/m ∈ ℚ (§4.3)`. Write `z = Σ z_{υ,i} θ_{υ,i}`
and `s_υ = min ord_p(z_{υ,i}) ≥ 1`; comparing the linear term `α z` with `Σ n_j τ_j` in the `θ-coordinates`
and eliminating the `n_j` by the kernel of `p^a T` (the rows `u_1, …, u_h`) gives (`u_l A)·(z` coordinates)
`≡ 0` modulo `p^{s+1}` where `s = min s_υ` (Siksek proof of Theorem 2, pp. 9–10). Rank d of `M̃_p(Q)` forces
`s = ∞, i.e`. `z = 0` and `P = Q` by injectivity of `t_Q` on `B_υ(Q)` (Siksek Lemma `3.1`).

**Checks.**

- Siksek §6 applies the criterion with Theorem 3 (sieve combination) to the generalized Fermat equation with signature `(2, 3, 10); ED.4` supplies the single-ball criterion, the sieve combination belongs to `ED.5`.
- `K = ℚ (d = 1): M̃_p(Q)` has rank 1 iff some annihilating `ω ∈ H⁰(𝒳, Ω¹)` has `ω̃(Q̃) ≠ 0` at the reduction, recovering the `m = 0` case of §4.13 (a) for p odd.

([Samir Siksek](https://arxiv.org/abs/1010.2603), §4, p.7; [Samir
Siksek](https://arxiv.org/abs/1010.2603), §4 Theorem 2, p.8; [Samir
Siksek](https://arxiv.org/abs/1010.2603), §4 Remark (iii), p.9.)

*Needs:* §4.4; §4.3; §4.1; §4.10; §3.21.

### 4.20 Symmetric-square Chabauty datum: `X⁽²⁾`, its Abel–Jacobi map and reduced vanishing differentials

Let `X` be a smooth projective non-hyperelliptic curve of genus `g ≥ 3` over `ℚ` with Jacobian `J, ∞` a
rational effective divisor of degree 2 (for example 2O or `O +` O'), and p a prime with a
good-reduction datum 𝒳 (`§4.1`, with the base point replaced by `∞`). The symmetric square `X⁽²⁾`
parametrises effective divisors of degree 2; `X⁽²⁾(ℚ)` consists of the pairs `{P, P^σ}` of a quadratic
point and its conjugate and the pairs `{P, Q}` of rational points, including the doubled divisor 2P.
Braces denote a multiset/effective divisor, never a Finset that loses repeated points. The datum
consists of: `(i) ι⁽²⁾ : X⁽²⁾ → J`, 𝒬 `↦` [𝒬 `− ∞`], injective because `X` is not hyperelliptic; (ii) the
reduction `X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p)` and its residue classes; (iii) the integral vanishing lattice `V = Ann_p(J(ℚ)) ∩ H⁰(𝒳, Ω¹)` and its reduction Ṽ `(§4.9); (iv)` for 𝒬 `= {Q₁, Q₂} ∈ X⁽²⁾(ℚ)`, a prime v of
`ℚ(Q₁)` above p, uniformisers `t_{Q̃_j}` at the reductions and the expansions `ω_i = (a₀(ω_i, t_{Q̃_j}) + a₁(ω_i, t_{Q̃_j}) t + ⋯) dt` for a basis `ω₁, …, ω_k` of Ṽ; (v) the matrix `Ã(𝒬)`: the `k × 2` matrix
`(a₀(ω_i, t_{Q̃₁}), a₀(ω_i, t_{Q̃₂}))` when `Q₁ ≠ Q₂`, and `(a₀(ω_i, t_{Q̃₁}), a₁(ω_i, t_{Q̃₁})/2)` when
`Q₁ = Q₂`; (vi) in the relative case, a degree-two morphism `ρ : X → C` to a curve `C` with good reduction
at p, extending to `ρ` : 𝒳 `→` 𝒞, the trace Tr : `H⁰(X, Ω¹) → H⁰(C, Ω¹), V₀ := V ∩` ker Tr and its
reduction `Ṽ₀`, and the set `ρ*C(ℚ) ⊆ X⁽²⁾(ℚ)` of pullbacks of rational points.

Work under the following conditions. `X` non-hyperelliptic of genus `g ≥ 3` (so `ι⁽²⁾` is an embedding); p
of good reduction for `X`; p odd wherever the diagonal matrix (v) is used (and for `C` in the relative
case, with `ρ` extending to the smooth models). The symmetric square of a curve and its points as
effective divisors are supplied by JacobianChallenge Layer `C`. The reduced matrix has entries in
the residue field generated by the support (or its algebraic closure), not necessarily `𝔽_p`. Its two
columns retain geometric multiplicities; arbitrary injective coordinates or an assumed Abel–Jacobi
injection are not this geometric datum.

The interface includes these statements.

- `ι⁽²⁾(𝒬) =` [𝒬 `− ∞] ∈ J(ℚ)` for 𝒬 `∈ X⁽²⁾(ℚ)`.
- `ι⁽²⁾` is injective on `X⁽²⁾(ℚ̄)` for `X` non-hyperelliptic.
- Reduction `X⁽²⁾(ℚ) → X̃⁽²⁾(𝔽_p)`, compatible with `red_J` ∘ `ι⁽²⁾`.
- `Ã(𝒬) ∈ M_{k×2}(𝔽̄_p)` as in (v).
- `Ṽ₀ =` reduction of `Ann_p(J(ℚ)) ∩` ker `Tr ∩ H⁰(𝒳, Ω¹)`.
- 𝒬 `∈ ρ*C(ℚ)` iff 𝒬 `= ρ*(c)` for some `c ∈ C(ℚ)`.

For the proof, `X⁽²⁾ = X × X / S₂` is a smooth projective surface whose `ℚ-points` are Galois-stable
effective divisors of degree 2 (JacobianChallenge Layer `C); ι⁽²⁾` is injective since two distinct effective divisors of
degree 2 are linearly equivalent only on a hyperelliptic curve. Expansions of differentials on the
reduction with respect to uniformisers at `Q̃_j` coincide with the reductions of expansions on 𝒳 with
respect to lifted uniformisers (Box proof of Theorem `2.1`), so `Ã(𝒬)` depends only on Ṽ.

**Checks.**

- If `P, Q ∈ X(ℚ)` then `{P, Q} ∈ X⁽²⁾(ℚ)` and `ι⁽²⁾({P, Q}) = [P + Q − ∞]`; a rational point `P ∉ ∞` and another rational point `P₀≠P` give two distinct divisors 2P and `P+P₀`. For a degree-two `ρ`, at most one is a pullback from `C`, since there is only one fibre divisor containing `P` (Box Remark `2.3`).
- For 𝒬 `= {Q₁, Q₁}` the second column of Ã is `a₁(ω_i`, t)/2, which requires p odd.
- For `X₀(N), N ∈ {43, 53, 61, 65}, X⁽²⁾(ℚ)` is infinite (a degree-two map to an elliptic curve of positive rank) although `r < g − 1`, so finiteness of `X⁽²⁾(ℚ)` does not follow from two independent vanishing differentials.
- `red_J(ι⁽²⁾(𝒬)) = ι̃⁽²⁾(red` 𝒬) in `J̃(𝔽_p)`, the identity behind `ι_p` in Caraiani–Newton §7.4.
- A genuinely quadratic point `P` together with its conjugate defines one rational effective divisor `P+P^σ` of degree2, although neither point is rational; 2Q at a rational point has degree2 and does not collapse to the singleton divisor `Q`.
- Caraiani–Newton §7.4: `X = X(ns3°`, ns5), `C = X(ns3`, ns5), `p = 43`, with `L` consisting of eight pulled-back degree-two divisors.
- Box §2.3: `X = X₀(N)` with `C = X₀(N)/w_N` for `N ∈ {43, 53, 61, 65, 67, 73}`.

([Box (arXiv v3)](https://arxiv.org/abs/1906.05206), §2.2.1, p.3; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.2.2, p.4; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.3.2, p.5; [Siksek (published,
2009)](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf), §3 pp.216–218, (6)–(9).)

*Needs:* §4.1; §4.9; §4.3; JacobianChallenge Layer `C`.

### 4.21 Symmetric Chabauty: a rational point of `X⁽²⁾` alone in its residue class

In a symmetric-square Chabauty datum `(§4.20)` for `X/ℚ` non-hyperelliptic of genus `g ≥ 3` and a prime p
of good reduction, let 𝒬 `= {Q₁, Q₂} ∈ X⁽²⁾(ℚ)` and `ω₁, …, ω_k` a basis of Ṽ. Suppose `p > 2`, and `p ≠ 3`
when [`𝔽_p(Q̃₁) : 𝔽_p] = 1`. If `rank Ã(𝒬) = 2`, then 𝒬 is the unique point of `X⁽²⁾(ℚ)` in its residue
class modulo p. Two independent vanishing differentials exist when `r < g − 1`; the criterion can fail
even then.

Work under the following conditions. Hypotheses of Box Theorem `2.1: p > 2; p ≠ 3` when `Q̃₁` is
`𝔽_p-rational; X` non-hyperelliptic of genus `≥ 3` with good reduction at p. Ṽ is the reduction of the
integral annihilator of `J(ℚ) (§4.9)`; computing it from a finite-index subgroup suffices.

For the proof, Pass to a common finite extension containing the supports of both rational effective
divisors 𝒫 and 𝒬 and extend the chosen prime compatibly. Order the geometric points with
multiplicity so that they have matching reductions. The fields of the comparison points are not
assumed contained in `ℚ_p(Q₁)`. The divisor 𝒫−𝒬 gives a class in `J(ℚ)`, so the sum of its tiny
integrals against every annihilator differential is zero. Apply the degree-two specialization of
Siksek2009 published `Theorem3.2, pp.217–222`: for each support point of multiplicity `d_j`, use the
first `d_j` primitive coefficients `a₀,a₁/2,…,a_{d_j−1}/d_j` and the corresponding power sums of local
parameters. Its ramification bound `N=e max lcm(e_j,b), 1≤b≤d/f_j`, gives `N≤2` for `d=2` over `ℚ`. With `p>2`
and `p≠3` in the residue-degree-one case, the integral-tail inequality `ord_p(d_j+i+1)≤i/N` and `p>d_j`
hold. This is the source valuation argument, not an arbitrary multivariate coefficient bound. Choose
the block of parameters minimizing `m_j(d_j+1)`. Rank2 of the reduced matrix forces the first `d_j`
power sums to vanish modulo the corresponding power of the common uniformizer. Siksek `Lemmas3.3–3.4`
use Newton identities and `p>d_j` to force every parameter in that block to have larger valuation, a
contradiction unless all vanish. Therefore `𝒫=𝒬` as effective divisors. Box `Theorem2.1 pp.4–5`
identifies the matrix with reduced differential expansions and allows redundant rows to be removed
without changing rank.

Suppose `p > 2`, and `p ≠ 3` when [`𝔽_p(Q̃₁) : 𝔽_p] = 1`. Derive the power-sum valuation contradiction from Siksek2009 `Theorem3.2` and `Lemmas3.3–3.4; do` not assume a generic injectivity or linear-congruence criterion as a geometric comparison.

**Checks.**

- Box §4.4: for `X₀(57)` the symmetric Chabauty method alone determines all quadratic points.
- Degenerate case `k < 2: Ã(𝒬)` has `rank ≤ 1` and the theorem gives nothing.

([Box (arXiv v3)](https://arxiv.org/abs/1906.05206), §2.2.2 Theorem 2.1, p.4; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.2.1, p.4; [Siksek (published,
2009)](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf), §3 Theorem3.2, pp.217–221; Lemmas3.3–3.4
p.222.)

*Needs:* §4.20; §4.4; §4.3; §4.9.

### 4.22 Relative symmetric Chabauty (Siksek, Box) and the good-residue-class criterion

Work in a relative symmetric-square Chabauty datum `(§4.20 (vi)): X/ℚ` non-hyperelliptic of genus `g ≥ 3, ρ : X → C` of degree 2 to a curve `C` over `ℚ, p` a prime of good reduction for `X` and `C` with `ρ`
extending to the smooth models, `ω₁, …, ω_k` a basis of `Ṽ₀` (reduction of `Ann_p(J(ℚ)) ∩` ker Tr). (a)
(Box Theorem `2.4`) Let 𝒬 `= {Q₁, Q₂} ∈ ρ*C(ℚ)` and suppose `p > 2` when [`𝔽_p(Q̃₁) : 𝔽_p] = 1`. If
`(ω_i/dt_{Q̃₁})(Q̃₁) ≠ 0` for some `i, i.e`. the `k × 1` matrix of constant coefficients has rank 1, then
every point of `X⁽²⁾(ℚ)` in the residue class of 𝒬 lies in `ρ*C(ℚ)`. (b) (Caraiani–Newton Proposition
`7.4.1`) Let `p₁, …, p_s` be primes of good reduction for `X` and `C, L ⊆ X⁽²⁾(ℚ)` a finite set, and for
each i let `L_i^good ⊆ L` be the set of `x ∈ L` for which either §4.21 applies at `p_i (x` is alone in its
residue class) or `x ∈ ρ*C(ℚ)` and (a) applies at `p_i`. If `x ∈ X⁽²⁾(ℚ)` satisfies `red_{p_i}(x) ∈ red_{p_i}(L_i^good)` for at least one i, then `x ∈ L ∪ ρ*C(ℚ)`.

Work under the following conditions. Hypotheses of (a): those of Box Theorem `2.4`, including good
reduction of `C` and the extension of `ρ` to the smooth models; `Ṽ₀` computed from `Ann_p(J(ℚ)) ∩` ker Tr,
for which a finite-index subgroup of `J(ℚ)` suffices. Input of (b): finitely many good primes and a
finite list `L` of known points with its partition into pullbacks and non-pullbacks; the sieve over
the set `M_i^bad := ι_{p_i}⁻¹(red_{p_i}(G)) − red_{p_i}(L_i^good)` (Caraiani–Newton Theorem `7.4.2`) is
§5.24.

For the proof, (a) For 𝒫 in the residue class of 𝒬 `= ρ*(c)`, [𝒫 − 𝒬] `∈ J(ℚ)` and `ω ∈` ker Tr
annihilates every `[ρ*(c') − ρ*(c)] (§4.3 (v))`, so the equations `Σ_j ∫_{Q_j}^{P_j} ω = 0` cut out, to
first order in the residue class, the pullback locus `ρ*C`; a nonzero constant coefficient `a₀(ω_i, t_{Q̃₁})` makes the first-order equation transversal to `ρ*C`, forcing 𝒫 `∈ ρ*C(ℚ)` (Box Theorem `2.4`, a
special case of Siksek's Theorem 2 for symmetric powers; expansions on the reduction as in §4.21).
(b) If `red_{p_i}(x) = red_{p_i}(y)` with `y ∈ L_i^good`: when y is alone in its class, `x = y ∈ L`; when
`y ∈ ρ*C(ℚ)` satisfies (a), `x ∈ ρ*C(ℚ)`. This is immediate from the definitions (Caraiani–Newton §7.4).

Use actual `Sym²X`, the degree-two Abel–Jacobi map and relative cover `X→C`, regular differential trace kernel, all divisors and local parameters; derive Box rank/vanishing criterion then membership in the pullback locus. Caraiani–Newton §7.4 is its relative application, not a new general owner.

**Checks.**

- Caraiani–Newton Proposition `7.4.5(1)`: for `X = X(ns3°`, ns5), `C = X(ns3`, ns5) and `p = 43`, the eight pulled-back divisors in `L` satisfy (a), `red₄₃(G)` is cyclic of order 7, and `X⁽²⁾(ℚ) = π*C(ℚ)`.
- Box §4: for `X₀(N), N ∈ {43, 53, 61, 65}, C = X₀(N)/w_N` an elliptic curve of positive rank, (a) handles the infinitely many pullback points.

([Box (arXiv v3)](https://arxiv.org/abs/1906.05206), §2.3.2 Theorem 2.4, p.6; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.3.1, p.5; [Ana Caraiani and James
Newton](https://arxiv.org/abs/2301.10509), §7.4, p.99.)

*Needs:* §4.20; §4.21; §4.3; §4.4; §4.9.

### 4.23 Chabauty–Coleman datum for the 5-cycle curve `C₀(5)` at `p = 3`

Under the explicit arithmetic-data hypotheses below, let `X = C₀(5)` be the smooth projective genus-2
curve `y² = f(x), f = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1`, birational to the curve of quadratic
polynomials with a marked 5-cycle. Then `X(ℚ) = {∞⁺, ∞⁻, (0, 1), (0, −1), (−3, 1), (−3, −1)}`.
Data `(§4.17): O = ∞⁺`; rank input `J(ℚ) ≅ ℤ` (Flynn–Poonen–Schaefer Theorem 3, a 2-descent with
trivial torsion, exact by §3.27); `G = ⟨[(−3, 1) − (0, 1)]⟩`, of finite index since its generator
is nonzero in the torsion-free group `J(ℚ) ≅ ℤ; p = 3` with the two-chart model, smooth since f has
unit leading coefficient and is squarefree mod `3 (§4.15); X̃(𝔽_3) = {∞⁺, ∞⁻, (0, 1), (0, −1)}`;
annihilating differential `ω = ε` dx/y + x dx/y with `ε ≡ 2·3 + 3² + 2·3³ (mod 3⁴`), from
`∫_{(0,1)}^{(−3,1)}` dx/y `≡ 2·3 + 3⁴` and `∫_{(0,1)}^{(−3,1)} x` dx/y `≡ 2·3² + 2·3³ (mod 3⁵`), so `ω̃ = x`
dx/y; verdicts: at `∞^±, m = 0 < p − 2, N = 1, Z_rat = {∞^±}`; at `(0, 1), t = x, m = 1` and the
coefficient of `t²` in w vanishes mod `3, N = 2, Z_rat = {(0, 1), (−3, 1)}`; at `(0, −1)`, by the
hyperelliptic involution, `N = 2, Z_rat = {(0, −1), (−3, −1)}`.

Work under the following conditions. Rank input: `J(ℚ) ≅ ℤ`, an unconditional 2-descent (FPS Theorem
3), supplied by the finite-index and rank datum of §3.27.
Supply the complete F3 residue-point list, finite curve/differential expansions, the stated integral
coefficient enclosures with exact annihilation relation, and strict coefficient/tail and
zero-matching witnesses on all four discs. The general geometric primitive and `ED.0/ED.2` precision
laws prove soundness of these supplied data. The full point list follows from the zero bounds; it is
not assumed.

The interface includes these statements.

- Supporting set/cardinality consequence: for an arbitrary mathematical ChabautyColemanData with Valid and exactly 6 listed points, its recorded rational set equals that list and has cardinality 6. This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses.

For the proof, Model and discs: §4.15 at `p = 3 (f` mod 3 is squarefree of degree 6 with leading
coefficient 1). Annihilator: `Ann_3(G)` is one-dimensional `(g − r = 1)` and is computed from the tiny
integrals between `(0, 1)` and `(−3, 1)` in the disc of `(0, 1) (§4.10`; McCallum–Poonen Example 3 (4)).
Verdicts: §4.11 (b) on the discs at infinity and (c) on the discs `(0, ±1)` (McCallum–Poonen Example
2); the involution `(x, y) ↦ (x, −y)` maps `Ann_3(G)` to itself and exchanges the discs `(0, 1)` and (0,
−1). Completeness: §4.18; total `Σ N = 6 = #X̃(𝔽_3) + 2g − 2`.

Let `X = C₀(5)` be the smooth projective genus-2 curve `y² = f(x), f = x⁶ + 8x⁵ + 22x⁴ + 22x³ + 5x² + 6x + 1`, birational to the curve of quadratic polynomials with a marked 5-cycle. Then `X(ℚ) = {∞⁺, ∞⁻, (0, 1), (0, −1), (−3, 1), (−3, −1)}`. Hypotheses: Rank input: `J(ℚ) ≅ ℤ`, an unconditional 2-descent (FPS Theorem 3), supplied as an `ED.3` finite-index and rank datum of §3.27. Use the actual smooth projective curve and `Hom_Q(Spec Q,X)`, its genuine Jacobian and Abel–Jacobi map, and the exact named rational points. Construct the geometric reduction, annihilator and complete accepted disc-verdict data; do not receive an arbitrary complete mathematical datum or assume its point cardinality. The actual six-point theorem is unconditional once the specified unconditional rank and geometric suppliers are proved.

**Checks.**

- The six points exhaust `C₀(5)(ℚ)`; their dynamical interpretation excludes rational 5-cycles.
- Check: the six rational points reduce onto `X̃(𝔽_3)` with fibres of sizes 1, 1, 2, 2, equal to the verdict bounds.

([McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.2 Proposition 8.2,
author copy p.10; [McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.2
proof of Proposition 8.2, author copy p.10; [McCallum–Poonen
(2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), §8.3, author copy p.11;
[Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §8 Theorem 6, p.23;
[Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §8, p.18.)

*Needs:* §4.18; §4.17; §4.15; §4.10; §4.11; §4.16; §3.27; §3.21.

### 4.24 Chabauty–Coleman datum for Poonen's curve `C₁(3₂)` at `p = 3`

Under the explicit arithmetic-data hypotheses below, let `X = C₁(3₂)` be the smooth projective genus-2
curve `y² = g(x), g = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1`, classifying `z² + c` with a rational point of
preperiodic type `3₂`. Then `X(ℚ) = {(−1, ±1), (0, ±1), (1, ±3), ∞⁺, ∞⁻}`. The datum is
conditional on the rank input `rank J(ℚ) ≤ 1` (Poonen Proposition 1), whose corrected 2-descent §3.28
requires as an explicit input; unconditionally, the eight points are the only rational points `P` with
`ι_O(P)` in the saturation of `G` in `J(ℚ_3)`. Data: `O = ∞⁺`; rank input as just stated, with
`J(ℚ)_tors = 0` and `rank J(ℚ) ≥ 1` exact; `G = ⟨[S⁺ − S⁻]⟩` with `S^± = (1, ±3)`, of finite index; `p = 3` with the two-chart model (g mod 3 squarefree, leading coefficient 1); `X̃(𝔽_3) = {∞⁺, ∞⁻, (0, ±1), (2, ±1), (1, 0)}`, seven points; annihilating differential `ω = α` dx/y + x dx/y with `∫_{S⁻}^{S⁺} ω = 0`, computed in the disc of the Weierstrass point `(1, 0)` with the parameter `t = y + 3`, giving `α ≡ 68`
(mod `3⁴`) and `ω̃ = (x − 1)` dx/y; verdicts: on the six discs other than `(1, 0), ω̃` does not vanish, so
`N = 1` with `Z_rat` the unique known point (`(−1, ±1)` reduce to `(2, ±1)`); on the disc of `(1, 0), m = 2 ≥ p − 2` (exceptional disc), the exact disc Strassmann bound of `∫_{S⁻} ω` is `N = 3, Z_rat = {S⁻, S⁺} (t = 0, 6)` and `Z_irr = {W}`, the Weierstrass point of `X(ℚ_3)` with `x(W) ≡ 1 (mod 3) (t = 3`), which is
not rational because g has no rational root and is a zero because `2[W − S⁻] = [S⁺ − S⁻] ∈ G`.

Work under the following conditions. Conditionality label: 'conditional on `rank J(ℚ) ≤` 1'. Poonen's
printed 2-descent uses the point `(2, √33)`, which is not on `C`; his errata replace it by `(−2, √33)` and
the 2-adic information without printing the corrected computation. The rank upper bound is therefore a separate explicit input in §3.28.
Torsion is trivial since `#J(𝔽_3) = 27` and `#J(𝔽_5) = 43`. The Coleman primitive coefficient data
replace the printed formal-group computation; alpha and the disc Strassmann indices are supplied
with their exact identity/tail hypotheses. The table is supplied with the following identities.
Supply exact divisor relations for the known points relative to `G`, in particular
`27[∞⁺−∞⁻]=[2S⁻−∞⁺−∞⁻]` and `[S⁺−S⁻]=−27[∞⁺−∞⁻]`. They imply
`2[S⁻−∞⁺]=26[∞⁺−∞⁻]`, so `η(S⁻)=0` even for the saturation-only conclusion.
Supply the complete F3 residue-point list and the finite primitive/annihilator expansions giving
`alpha≡68 mod3^4`, with explicit tail bounds and exact differential-annihilation relation, plus
isolation/nonrationality witnesses for `W`. These numerical coefficients are input hypotheses, not
outputs of a table-generation algorithm. The geometric zero bound and point comparison prove
completeness under the separately labelled rank bound.

The interface includes these statements.

- Supporting set/cardinality consequence: for an arbitrary mathematical ChabautyColemanData with Valid and exactly 8 listed points, its recorded rational set equals that list and has cardinality 8. This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses.

For the proof, Model and discs: §4.15; the Weierstrass disc of `(1, 0)` uses `t = y + 3`, with `x = ξ(t) ∈ ℤ_3[[t]], ξ(0) = 1`, and dx/y `= 2 dt/g'(ξ(t))`. Annihilator: `∫_{S⁻}^{S⁺}` dx/y and `∫_{S⁻}^{S⁺} x` dx/y
are tiny integrals evaluated at `t = 6`, both of valuation 1; `α =` −(`∫` x dx/y)/(`∫` dx/y) `≡ 68 (mod 3⁴) (§4.10`). Orders of `ω̃ = (x − 1)` dx/y: a double zero at the Weierstrass point `(1, 0)` and no other
zero (degree `2g − 2 = 2`), so §4.11 (b) gives `N = 1` on six discs. Exceptional disc: the rescaled
coefficients of `∫_{S⁻} ω` have `v(a_i) + i = ∞, 2, 3, 2, 6, 6, 7, …` for `i = 0, 1, 2, …`, so `N_3 = 3` by
§4.11 (d); the zeros `t = 0, 3, 6` are `S⁻, W, S⁺`, where `2W ∼ S⁺ + S⁻` gives `2∫_{S⁻}^{W} ω = ∫_{S⁻}^{S⁺} ω = 0 (§4.3)`. Completeness: §4.18 in its conditional form gives the eight points, in agreement with
Poonen Proposition 2; its unconditional part gives the saturation statement.

Let `X = C₁(3₂)` be the smooth projective genus-2 curve `y² = g(x), g = x⁶ − 2x⁴ + 2x³ + 5x² + 2x + 1`, classifying `z² + c` with a rational point of preperiodic type `3₂`. Then `X(ℚ) = {(−1, ±1), (0, ±1), (1, ±3), ∞⁺, ∞⁻}`. Data: `O = ∞⁺`; rank input as just stated, with `J(ℚ)_tors = 0` and `rank J(ℚ) ≥ 1` exact; `G = ⟨[S⁺ − S⁻]⟩` with `S^± = (1, ±3)`, of finite index; `p = 3` with the two-chart model (g mod 3 squarefree, leading coefficient 1); `X̃(𝔽_3) = {∞⁺, ∞⁻, (0, ±1), (2, ±1), (1, 0)}`, seven points; annihilating differential `ω = α` dx/y + x dx/y with `∫_{S⁻}^{S⁺} ω = 0`, computed in the disc of the Weierstrass point `(1, 0)` with the parameter `t = y + 3`, giving `α ≡ 68 (mod 3⁴`) and `ω̃ = (x − 1)` dx/y; verdicts: on the six discs other than `(1, 0), ω̃` does not vanish, so `N = 1` with `Z_rat` the unique known point (`(−1, ±1)` reduce to `(2, ±1)`); on the disc of `(1, 0), m = 2 ≥ p − 2` (exceptional disc), the exact disc Strassmann bound of `∫_{S⁻} ω` is `N = 3, Z_rat = {S⁻, S⁺} (t = 0, 6)` and `Z_irr = {W}`, the Weierstrass point of `X(ℚ_3)` with `x(W) ≡ 1` (mod `3) (t = 3`), which is not rational because g has no rational root and is a zero because `2[W − S⁻] = [S⁺ − S⁻] ∈ G`. Hypotheses: Conditionality label: 'conditional on `rank J(ℚ) ≤` 1'. Torsion is trivial since `#J(𝔽_3) = 27` and `#J(𝔽_5) = 43`. The Coleman-integral datum replaces Poonen's formal-group computation; its numerical values (`α`, the disc Strassmann indices) are computed in this roadmap from the tiny-integral expansions and are not printed in the source. Preserve the conditional rank label and the separate unconditional saturation statement; an assumed Valid record is not a proof of the rank hypothesis.

**Checks.**

- Under `rank J(ℚ) ≤ 1`, the eight displayed rational points exhaust `C₁(3₂)(ℚ)`. The exceptional disc includes the nonrational zero `W` in its Strassmann count, so that zero is subtracted before counting rational points.
- Check: `Σ N = 6·1 + 3 = 9` zeros, of which `W` is not rational, leaving the eight listed rational points.

([Poonen (arXiv v1)](https://arxiv.org/abs/math/9512217v1), §4 Proposition 2, p.16; [Poonen (arXiv
v1)](https://arxiv.org/abs/math/9512217v1), §4, p.13; [Poonen (arXiv
v1)](https://arxiv.org/abs/math/9512217v1), §4 proof of Proposition 1, p.13; [Poonen (arXiv
v1)](https://arxiv.org/abs/math/9512217v1), §4 proof of Proposition 2, p.17.)

*Needs:* §4.18; §4.17; §4.15; §4.10; §4.11; §4.16; §4.3; §3.28.

### 4.25 Conditional Chabauty–Coleman datum for Stoll's curve `X₀^dyn(6)` at `p = 5`

Under the explicit arithmetic-data hypotheses below, let `X = X₀^dyn(6)` be the genus-4 curve given by
the smooth model `G(u, w) = w²(w + 1)u³ − (5w² + w + 1)u² − w(w² − 2w − 7)u + (w + 1)(w − 3) = 0` of
bidegree `(3, 3)` in `ℙ¹ × ℙ¹`, with the ten rational points `P₀, …, P₉` of Stoll's table.
Unconditionally: `J(ℚ)` has trivial torsion, the subgroup `G` generated by differences of the `P_i` is `≅ ℤ³`, and the `P_i` are the only rational points `P` with `[P − P₁]` in the saturation of `G`. Conditionally
on the labelled hypothesis `rank J(ℚ) ≤ 3` (which follows from analytic continuation and the standard
functional equation of `L(J, s)`, an exact nonvanishing `L'''(J,1)≠0` (Stoll’s value `0.836…` is
numerical, and his reported lower-derivative vanishings are only to working precision), and the weak
Birch and Swinnerton-Dyer conjecture for `J`; Stoll §4 and Theorem `7), X(ℚ) = {P₀, …, P₉}`.
Data: `O = P₁; G` with generators of `G ∩ J(ℚ_5)¹` given by `D₁ = P₇ − P₉, D₂ = P₀ − 6P₁ + 2P₅ + P₇ + P₈ + P₉, D₃ = P₀ − 3P₁ + 2P₂ + P₄ + P₆ − P₇ − P₈; p = 5` (the model has good reduction away from
2 and 8029187); the annihilating differential `ω`, computed by §4.5 at `P₁ = (0, −1)` with parameter u,
has reduction `ω̄ = ω̄₂ = w ω̄₀`; verdicts: at `(∞, −1), m = 1 < p − 2 = 3, N = 2, Z_rat = {P₇, P₉}`; at
`(∞, 0)`, where `ω̄` also vanishes, the explicit expansion `λ = γτ(1 − (2 + O(5))5τ + O(5²))` gives `N = 1, Z_rat = {P₃}`; at every other point of `X̃(𝔽_5), ω̄` does not vanish and `N = 1`, and each such disc
contains one of the `P_i` (the reduction map on `{P₀, …, P₉}` is onto `X̃(𝔽_5)`).

Work under the following conditions. Conditionality label: 'conditional on `rank J(ℚ)≤3'`. An analytic
derivation additionally needs exact analytic `order≤3`, along with analytic
continuation/functional equation and weak BSD; Stoll’s numerical evidence is not that datum.
The unconditional statement concerns the saturation of `G`. §3.29 supplies the unconditional part of
the rank input (`G ≅ ℤ³`, trivial torsion) and labels the analytic rank bound; under `rank J(ℚ) = 3` the
Chabauty step uses the saturation of `G` directly, so no p-saturation datum is needed. Supply
the exact ten point coordinates, full F5 residue-point/chart list, reduction/MW matrices, finite
annihilator/integral series and the strict tails and local witnesses for the displayed5-adic
expansions. Verify the local bounds and deduce the saturation conclusion; the rational-point
conclusion additionally keeps the stated analytic/BSD or rank hypothesis.

The interface includes these statements.

- Supporting set/cardinality consequence: for an arbitrary mathematical ChabautyColemanData with Valid and exactly 10 listed points, its recorded rational set equals that list and has cardinality 10. This does not construct the actual named-curve application or discharge its rank/model/disc hypotheses.

For the proof, Rank: `G ≅ ℤ³` by reduction maps at `S = {3, 5, 7, 11, 13}` and six explicit relations
(Stoll Lemma 4); under the labelled hypothesis `G` has finite index in `J(ℚ)`. Annihilator: `Ann_5(G)` is
one-dimensional `(g − 3 = 1)`; the integrals `⟨D_j, ω_i⟩` are computed by §4.5 from degree-four divisors
supported in the disc of `P₁`, and the kernel of the transpose of the `4 × 3` matrix gives the coefficient column of `ω (§4.10)`. Verdicts: §4.11 (b)
at `(∞, −1)` and on the discs where `ω̄ ≠ 0`; (d) with Stoll's explicit expansion at `(∞, 0)` based at `P₃`.
Conclusion: §4.18 in its conditional form; its unconditional part gives Stoll Lemma 5, since `ω` kills
the saturation of `G`.

Let `X = X₀^dyn(6)` be the genus-4 curve given by the smooth model `G(u, w) = w²(w + 1)u³ − (5w² + w + 1)u² − w(w² − 2w − 7)u + (w + 1)(w − 3) = 0` of bidegree `(3, 3)` in `ℙ¹ × ℙ¹`, with the ten rational points `P₀, …, P₉` of Stoll's table. Hypotheses: Conditionality label: 'conditional on `rank J(ℚ)≤3'`.

**Checks.**

- Under `rank J(ℚ) = 3`, the ten displayed points exhaust `X₀^dyn(6)(ℚ)`, and their dynamical interpretation excludes rational 6-cycles.
- Check: 10 points in 9 residue classes, the only shared class being that of `(∞, −1)` with `N = 2`.

([Stoll (arXiv v2)](https://arxiv.org/abs/0803.2836), §3 Lemma 4, p.8; [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §3 proof of Lemma 5, p.10; [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §3 Theorem 6, p.10; [Stoll (arXiv
v2)](https://arxiv.org/abs/0803.2836), §4 Theorem 7, p.13.)

*Needs:* §4.18; §4.17; §4.5; §4.10; §4.11; §4.16; §3.29.

### 4.26 Strassmann supplier on the closed unit disc

RestrictedPowerSeries §2.4 supplies Strassmann's theorem, including arbitrary radius
and complete isometric extensions. Its radius-one specialization over `Q_p` says
that a nonzero restricted series has at most N distinct closed-unit-disc zeros,
where N is the last index attaining its Gauss norm. Section 4.11 applies this to
`f(pT)`, where `f'∈Z_p[[t]]`, and certifies N from finite coefficient bounds and a
strict infinite-tail bound. The convergence and dominant-coefficient hypotheses
are carried by that application. The general Strassmann theorem is supplied by
RestrictedPowerSeries rather than constructed here.

**Checks.**

- `f=X−X²` has last dominant index 2 and exactly the two closed-disc zeros 0 and 1.
- `f=1+pX` has last dominant index 0; its root `−1/p` lies outside the closed unit disc.
- `1+pX+X²+pX⁵` has last dominant index 2, so the supplier bounds its zeros by 2.
- For a residue-disc integral, `t=pT` identifies its zeros on `pZ_p` with the
  unit-disc zeros to which §4.11 applies the supplier.

([Flynn–Poonen–Schaefer (arXiv v1)](https://arxiv.org/abs/math/9508211), §8,
Theorem 4, p.21; [McCallum–Poonen](https://math.mit.edu/~poonen/papers/chabauty.pdf),
§5.3, proof of Lemma 5.1, author copy p.6.)

*Needs:* RestrictedPowerSeries §2.4 (Strassmann) and §2 (evaluation);
Tau Ceti `TauCeti.PowerSeries.exists_isDistinguished`.

### Examples

The six-point genus-two curve, Poonen’s eight-point curve and Stoll’s ten-point genus-four curve fix
multiplicity, ramification, exceptional-disc and conditional-rank conventions. A model chart of `P¹`
can test smooth lifting and parameters, but is not a `genus≥1` Chabauty datum.

### Dependencies

Layers 0,2,3; ColemanIntegration L0–L1; SchemeAndStackFoundations §§3.3, `3.8`;
NeronModelsAndSemistableAbelianVarieties §§1.7–1.8, `3.8`; FiniteFlatGroupsAndIntegralPadicHodgeTheory
`R07.1`; DeligneWeightsAndPurity Layer `DWP.1; TauCetiRoadmap.JacobianChallenge` D–F and StableReduction Layer
5.

## Layer 5: The Mordell–Weil sieve

Allowed local values are finite sets, not subgroups. Quotient local groups by the images of the
global lattice, and check every lift. All obstruction and completeness conclusions are one-way
soundness statements.

### 5.1 Admissible quotient classes

Write `q_L:Γ→Γ/L` for the native quotient map, `G_{L,i}=Gᵢ/φᵢ(L), q_{L,i}:Gᵢ→G_{L,i}`, and
`φ_{L,i}:Γ/L→G_{L,i}` for the native induced map. Write `A_S(L)` for `admissibleClasses(S,L,φ,X)`. Define
`A_S(L)={a∈Γ/L : φ_{L,i}(a)∈q_{L,i}(Xᵢ) for every i∈S}`. This is the filter of the finite enumeration
of `Γ/L` by these conditions. Xᵢ is a set of allowed local values, not a subgroup. The construction
quotients the local group by the image `φᵢ(L)`, not by `L` itself.

Work under the following conditions. `Γ` is an abelian group; `S` is a finite set of local indices; each
Gᵢ is an abelian group; `φᵢ:Γ→Gᵢ` is an additive homomorphism; Xᵢ is a finite subset of Gᵢ. `L` is an
additive subgroup and `Γ/L` has a specified finite enumeration. Surjectivity of `φᵢ`, finite generation
of `Γ` and finiteness of Gᵢ are not required for these statements; the source application provides
them.

The interface includes these statements.

- The construction equals the finite filter of `Γ/L` by all specified local quotient tests.
- A belongs precisely when every `φ_{L,i}(a)` belongs to `q_{L,i}(Xᵢ)`; see membership.
- `q_L(g)` belongs precisely when for every selected i there is `x∈Xᵢ` with `φᵢ(g)−x∈φᵢ(L)`; see representative-congruences.
- `A_∅(L)` is the entire finite quotient.
- Replacing Xᵢ by an equal set at every selected index leaves `A_S(L)` unchanged; unselected indices do not matter.
- If `S⊆T` then `A_T(L)⊆A_S(L)`. The maps, subgroup and allowed sets are fixed.
- At `L=Γ`, suppose for each `i∈S` there is `x∈Xᵢ∩im(φᵢ)`. Then `A_S(Γ)={0}`. For the source’s surjective maps this is precisely the requirement that every selected Xᵢ be nonempty.
- If `Xᵢ⊆Yᵢ` for each `i∈S`, then `A_S(L;X)⊆A_S(L;Y)`. Consequently emptiness computed using supersets of the true local images remains a sound obstruction.

For the proof, use native subgroup image to form `φᵢ(L); Subgroup.le_comap_map` gives the containment
needed for the native induced quotient map, through its additive companion. Form each allowed image
with `Finset.image`. Filter `Finset.univ` by the finite conjunction of local membership tests. The finite filter is a mathematical finite set on the native quotient carrier.

**Checks.**

- admissibleClasses_empty_index. For arbitrary `L`, maps and local sets, `A_∅(L)=Γ/L`.
- admissibleClasses_empty_local. For the singleton index set and any `φ:Γ→ℤ/4, X=∅` implies `A(L)=∅`.
- admissibleClasses_mod_four. For `Γ=G=ℤ/4, φ=id, L=0` and `X={1,3}, A(L)={q₀(1),q₀(3)}`.
- admissibleClasses_non_surjective. For `Γ=ℤ/2, G=ℤ/4, φ=0, L=Γ` and `X={1}, A(L)=∅` although `X` is nonempty.
- admissibleClasses_top_nonempty. For `Γ=G=ℤ/4, φ=id, L=Γ` and `X={1}, A(L)={0}`.
- Empty `S` retains every quotient class.
- An empty Xᵢ at a selected index rejects all classes.
- The torsion group `ℤ/4` and the allowed set `{1,3}` retain both odd classes.
- With one selected index, membership is exactly that single local test.
- Replacing g by g+ℓ for `ℓ∈L` does not change admissibility.
- For `L=0`, the congruence becomes equality with a value in Xᵢ.
- Adding a vacuous local test leaves the set unchanged; adding an incompatible test can make it empty.
- For the zero map `ℤ/2→ℤ/4` and `X={1}`, the hypothesis fails and the initial candidate set is empty.
- With `S` empty the condition is vacuous and the unique class survives.
- Replacing `{1}` by `{1,3}` for the identity map on `ℤ/4` can add a survivor; it cannot remove one.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), Definition 3.1, published p.277;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3, published p.274; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.278; surjectivity convention
§3.2, p.277; [Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §2, published p.274.)

*Needs:* Mathlib `Subgroup.map`; Mathlib `Subgroup.le_comap_map`; Mathlib `QuotientGroup.map`; Mathlib `QuotientGroup.mk'`; Mathlib `Finset.image`; Mathlib `Finset.filter`; Mathlib `Finset.univ`; Mathlib `Finset.mem_filter`; Mathlib `Finset.mem_univ`; Mathlib `QuotientGroup.map_mk'`; Mathlib `QuotientGroup.eq_iff_div_mem`; Mathlib `Finset.mem_image`; Mathlib `QuotientGroup.subsingleton_iff`; Mathlib `Subgroup.mem_map`.

### 5.2 Global elements survive

With the notation of §5.1, if `g∈Γ` satisfies `φᵢ(g)∈Xᵢ` for every `i∈S`, then `q_L(g)∈A_S(L)`.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

For the proof, apply representative-congruences. At index i choose `x=φᵢ(g)`, which lies in Xᵢ by
hypothesis; the difference is zero, in every subgroup.

**Checks.**

- For an empty index set every g survives.
- A known globally compatible element prevents the candidate set from being empty.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §1, published p.272.)

*Needs:* §5.1.

### 5.3 An empty sieve obstructs global compatibility

With the notation of §5.1, if `A_S(L)=∅`, no `g∈Γ` has `φᵢ(g)∈Xᵢ` at every selected index. Nonemptiness of `A_S(L)` does not assert the existence of such a g.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

For the proof, Assume a globally compatible g exists. Global-soundness puts `q_L(g)` in `A_S(L)`,
contradicting its emptiness.

The necessary local conditions therefore give an obstruction for the global group.

**Checks.**

- The singleton local empty set is an immediate obstruction.
- For `Γ=G=ℤ/2, φ=id, L=Γ` and two selected indices with `X₀={0}, X₁={1}, A_S(L)={0}` but no globally compatible element exists.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.280.)

*Needs:* §5.2.

### 5.4 Projection of surviving classes

With the notation of §5.1, let `K≤L` and let `π:Γ/K→Γ/L` be the native map induced by the identity. If `b∈A_S(K)`, then `π(b)∈A_S(L)`. Both quotients have finite enumerations.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

For the proof, Choose g with `q_K(g)=b` using the native surjectivity of `q_K`.
Representative-congruences supplies, at each index, `x∈Xᵢ` with `φᵢ(g)−x∈φᵢ(K)`. `Subgroup.map_mono` sends
this membership into `φᵢ(L)`. Reassemble representative-congruences at `L` and evaluate
`π(q_K(g))=q_L(g)`.

**Checks.**

- If the coarse sieve is empty then every finer sieve is empty.
- The projection of the fine sieve can be a proper subset of the coarse sieve.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.278.)

*Needs:* §5.1; Mathlib `QuotientGroup.mk'_surjective`; Mathlib `QuotientGroup.map_mk'`; Mathlib `Subgroup.map_mono`.

### 5.5 Finite coset lifting and filtering

With the notation of §5.1, let `K≤L, π:Γ/K→Γ/L` be the canonical projection, `B⊆Γ/L` finite, and `σ:Γ/L→Γ/K` any choice of proposed lifts. Define `refineClasses(S,K,L,σ,B)` as the union, over `a∈B`, of `{σ(a)+z : z∈ker π}`, followed by the local filter defining `A_S(K)`. The kernel is enumerated inside the finite quotient `Γ/K`. Correctness requires `π(σ(a))=a` for `a∈B`; the function is defined even if that check fails.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

The interface includes these statements.

- The result is the finite union of translated kernel enumerations, filtered by the fine local conditions.
- If `σ` lifts every `a∈B` correctly, b belongs exactly when `π(b)∈B` and `b∈A_S(K)`; see lift-membership.
- An empty coarse input produces the empty fine result, without a section assumption.
- Two sections correct on `B` produce the same result; their values outside `B do` not matter.
- Let `K≤L`, fix i and suppose `φᵢ(K)=φᵢ(L)`. For every `b∈Γ/K`, the i-th fine local test at b is equivalent to the i-th coarse test at `π(b)`. No surjectivity of `φᵢ` is needed.
- For any proposed lifts `σ`, the number of classes returned by `refineClasses(S,K,L,σ,B)` is at most `|B|·|ker π|`, with the kernel enumerated in `Γ/K`. This bound requires no section equation.
- Let `D≤L` be subgroups of an abelian group `Γ` and `φ:Γ→A` an additive homomorphism. For the native subgroup `L′=L∩φ⁻¹(φ(D))`, one has `D≤L′`. The containment `L′≤L` is part of the native intersection operation.
- Let `D,L≤Γ` and `φ:Γ→A`. If `φ(L)` is not contained in `φ(D)`, then `L∩φ⁻¹(φ(D))` is a proper subgroup of `L`.

For the proof, build `π` with the existing induced quotient map. Enumerate its kernel by filtering the
finite fine quotient for `π(z)=0`. For each `a∈B`, translate the kernel enumeration by `σ(a)`, using
`Finset.image`; take `Finset.biUnion` over `B`. Filter the resulting set by membership in `A_S(K)`. The resulting finite set is exactly the inverse image of `B` intersected with the fine local conditions.

**Checks.**

- refineClasses_empty_input. For all data, `refineClasses` applied to `B=∅` is `∅`.
- refineClasses_identity. For `K=L` and `σ=id, refineClasses(S,L,L,id,B)=B∩A_S(L)`.
- refineClasses_all_lifts. With no local tests and a section correct on `B`, the result is the whole inverse image `π⁻¹(B)`, enumerated in `Γ/K`.
- refineClasses_wrong_section. Take `Γ=ℤ/4, K=L=0, B={q₀(0)}`, no tests, and constant `σ=q₀(1)`. The result is `{q₀(1)}`, not `B`. This `σ` fails the section condition.
- With `B` empty the result is empty.
- When `K=L` and `σ=id`, the result is `B∩A_S(L)`.
- A wrong section can move a candidate to the wrong fibre, so its verification is essential.
- `K=L` gives identical tests.
- For `Γ=G=ℤ/4, φ=id, K=0, L=2Γ` and `X={0}`, the images differ: the fine class 2 fails while its coarse projection passes.
- The section equation is needed only on `B`.
- Every fine lift is recovered even when `Γ` has torsion.
- For no tests and a correct section on `B`, the translated fibres are disjoint and the bound is attained.
- In a torsion group the kernel cardinality is used as it stands.
- For `Γ=ℤ, A=ℤ/4, φ` reduction, `D=2ℤ` and `L=ℤ`, the corrected step gives `2ℤ` and contains `D`; the original kernel is `4ℤ` and does not.
- In the reduction `ℤ→ℤ/4` with `D=2ℤ` and `L=ℤ`, progress is strict.
- If `φ(L)=φ(D)`, the hypothesis fails and this test supplies no strict step.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.279, Lift;
author implementation LiftInformation, lines 2563–2600; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.278 (relevance) and p.279 (the
sets `I_j`); [Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.278;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.279, PrepareLift;
author LiftInformation, lines 2480–2493.)

*Needs:* §5.1; Mathlib `QuotientGroup.map`; Mathlib `Finset.univ`; Mathlib `Finset.filter`; Mathlib `Finset.image`; Mathlib `Finset.biUnion`; Mathlib `QuotientGroup.mk'_surjective`; Mathlib `QuotientGroup.map_mk'`; Mathlib `QuotientGroup.eq_iff_div_mem`; Mathlib `Finset.mem_image`; Mathlib `Finset.mem_biUnion`; Mathlib `Finset.mem_filter`; Mathlib `Finset.card_image_le`; Mathlib `Finset.card_biUnion_le_card_mul`; Mathlib `Finset.card_filter_le`; Mathlib `Subgroup.map`; Mathlib `Subgroup.comap`; Mathlib `Subgroup.le_comap_map`; Mathlib `Subgroup.mem_map`.

### 5.6 Correctness of a full lifting step

With the notation of §5.1, for `K≤L` and a section `σ` correct on `A_S(L)`, `Sieve.refineClasses_eq_admissibleClasses` gives `refineClasses(S,K,L,σ,A_S(L))=A_S(K)`. Both quotients are finite. Omitting unchanged
tests: if `T⊆S` and `φᵢ(K)=φᵢ(L)` for every `i∈S∖T`, then filtering the lifted classes by the
tests in `T` alone still gives `A_S(K)`, because for an omitted index the coarse test transfers
to every fine class over it (the local image subgroup is unchanged); all tests whose image
subgroups are unchanged can therefore be omitted.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

For the proof, use lift-membership with `B=A_S(L)`. Membership is fine admissibility together with
coarse admissibility of the projection. Quotient-refinement supplies the coarse condition for every
fine survivor. The converse follows directly from the fine filter.

**Checks.**

- Any finite descending chain with checked inclusions and checked sections computes the same endpoint set as the direct finite filter.
- Empty coarse input stays empty at every step.
- For `Γ = ℤ/4`, `K = L = 0` and no local tests, a constant proposed section at zero returns only zero instead of the four fine classes; its section equation fails.
- Omitting tests: taking `T=S` is the full lifting step; taking `T=∅` is valid only when every image subgroup is unchanged; for `Γ = ℤ/4`, `L = 2Γ`, `K = 0` and one local test `φ: Γ → ℤ/4` the identity with `X = {0}`, the image subgroup changes from `2ℤ/4` to `0`, and omitting that test would keep the class of 2, which fails the fine test.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published pp.279–280.)

*Needs:* §5.5; §5.4.

### 5.8 A subgroup covers a coprime sieve quotient

Let `H,L≤Γ` for an abelian group `Γ`, let `N` be a natural number, assume `NΓ⊆L` and `gcd([Γ:H],N)=1`, with
the native natural index. Then `Sieve.quotient_surjective_of_coprime` states that `H→Γ/L, h↦q_L(h)`, is surjective. The usual application has `[Γ:H]`
finite and `N>0`. The statement also includes the harmless `N=1` boundary even if the native index is
zero.

Work under the following conditions. `Γ` is an abelian group; H,L are additive subgroups; `NΓ⊆L`;
`gcd(H.index,N)=1`.

For the proof, Set `d=[Γ:H]`. The additive companion of `Subgroup.pow_index_mem` gives `d·g∈H` for every
g. By `Nat.gcd_eq_gcd_ab` and coprimality choose integers u,v with d u+N `v=1`. Put `h=u·(d·g)`, an
element of `H`. The difference g−h equals `v·(N·g)`, which lies in `L`. Native quotient equality therefore
gives `q_L(h)=q_L(g)`. Surjectivity of `q_L` completes the proof. This establishes coverage of the sieve
quotient only. It does not certify `H=Γ`, its index, saturation, or the image of `H` under a finer local
map.

**Checks.**

- `H=2ℤ` and `L=3ℤ` cover all three residue classes.
- `H=2ℤ` and `L=2ℤ do` not cover `ℤ/2`; the coprimality assumption fails.
- For `N=1` the quotient is trivial.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §1, published p.272.)

*Needs:* Mathlib `Subgroup.pow_index_mem`; Mathlib `Nat.gcd_eq_gcd_ab`; Mathlib `QuotientGroup.eq_iff_div_mem`; Mathlib `QuotientGroup.mk'_surjective`.

### 5.9 Applying the obstruction to commuting maps

With the notation of §5.1, let `P` be an existing type, `j:P→Γ` a map, and `rᵢ:P→Gᵢ` maps with `φᵢ(j(p))=rᵢ(p)` and `rᵢ(p)∈Xᵢ` for every p and every `i∈S`. If `A_S(L)=∅` then `P` is empty. Neither injectivity of j nor surjectivity of `φᵢ` is needed.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

For the proof, Any p gives a global element `j(p)`. Commutativity and local containment show that it
satisfies all local constraints. Apply empty-sieve-obstruction. This argument consumes actual maps
and equalities on their values. For `P = C(ℚ)` the points, the Abel–Jacobi map, the reduction maps,
the local images and the commuting squares are supplied by jacobian-reduction-data; the curve
instance is curve-sieve-soundness.

**Checks.**

- A exact local superset can be used through local-overapproximations.
- An arbitrary type `P` with the displayed maps is a legitimate test case; calling it a curve is not part of the theorem.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §2, published p.274.)

*Needs:* §5.3.

### 5.10 Completeness from unique residue fibres

With the notation of §5.1, let `P` be an existing type with `j:P→Γ` and `W⊆P` finite. Assume every `j(p)` satisfies all local constraints; every `a∈A_S(L)` equals `q_L(j(w))` for some `w∈W`; and `q_L∘j` is injective. Then `Sieve.complete_of_unique_fibres` proves that every `p∈P` belongs to `W`.

Work under the following conditions. The standing hypotheses of §5.1 on `Γ`, `S`, the `Gᵢ`, `φᵢ`, Xᵢ and `L`.

For the proof, Global-soundness puts the residue of `j(p)` in `A_S(L)`. The coverage hypothesis provides
`w∈W` with the same residue. Injectivity of `q_L∘j` identifies p with w. Transfer membership in `W` along
this equality. In geometric applications injectivity requires a Chabauty residue-disc uniqueness
theorem or a height separation bound. A finite sieve by itself supplies no such injectivity, and
many curves do not satisfy it for a given modulus.

**Checks.**

- The conclusion can fail without the uniqueness hypothesis even if all quotient classes are represented by known points.
- A singleton quotient can establish completeness only when the relevant point set has at most one element.
- With `Γ = 0`, a two-element point set mapping to zero and a one-element known list cover the quotient but do not give completeness; the quotient-fibre injectivity hypothesis fails.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §1, published p.273.)

*Needs:* §5.2.

### 5.11 Reduction data for a curve and its Jacobian

Let `C/ℚ` be a smooth projective geometrically integral curve of genus `g ≥ 1` with Jacobian `J = Pic⁰_{C/ℚ}`, and let `D₁` be a `ℚ-rational` divisor of degree one (`D₁ = P₀` for a rational point `P₀`, or `D₁ = D − W` with `D` a rational divisor of degree three and `W` a canonical divisor on a genus-two curve).
Put `ι: C(ℚ) → J(ℚ), ι(P) = [P − D₁]`. Let `S` be a finite set of primes p at which `C` has a smooth
proper model `𝒞_p` over `ℤ_(p)` with geometrically connected fibres; write `C̃_p` for the special fibre
and `J̃_p = Pic⁰` of `C̃_p`. The construction produces for each `p ∈ S`: (a) the reduction of points
`red_p: C(ℚ) → C̃_p(𝔽_p)`, the special point of the unique section of `𝒞_p` extending `P`; (b) the
reduction homomorphism `ρ_p: J(ℚ) → J̃_p(𝔽_p)`, the specialisation map of the Néron model of `J` over
`ℤ_(p)`, which is the abelian scheme `Pic⁰` of `𝒞_p`; (c) the reduced divisor `D̄₁` (closure of `D₁` in `𝒞_p`
restricted to the special fibre) and `ι_p: C̃_p(𝔽_p) → J̃_p(𝔽_p), ι_p(R) = [R − D̄₁]`; (d) the
commuting square `ρ_p(ι(P)) = ι_p(red_p(P))` for all `P ∈ C(ℚ)`, and more generally `ρ_p([E − d·D₁]) =` [Ē
`− d·D̄₁`] for every rational effective divisor `E` of degree d, which gives the same square on the
symmetric power `C^(d)(ℚ)`; (e) the finite local image `X_p = ι_p(C̃_p(𝔽_p)) ⊆ J̃_p(𝔽_p)`. The result is
the record JacobianReductionData (points `P = C(ℚ)` or `C^(d)(ℚ)`, group `Γ = J(ℚ)` or a subgroup
containing the image of `ι`, residue points, local groups, `ι, red_p, ρ_p, ι_p` and the square), which
is exactly the input of admissible-classes and exact-map-obstruction. In genus one with `D₁ = O`
it is the reduction of points on a minimal Weierstrass model, and `ι, ι_p` are the identifications `E ≅ Pic⁰`.

Work under the following conditions. `C/ℚ` smooth, projective, geometrically integral, of genus `g ≥ 1`;
`D₁` a `ℚ-rational` divisor of degree one. Every `p ∈ S` is a prime of good reduction: `C` has a smooth
proper model over `ℤ_(p)` with geometrically connected fibres. The mathematical interface takes the points,
the groups and the maps as inputs together with the square; the geometric construction above
produces them.

The interface includes these statements.

- The finite local image `X_p = ι_p(C̃_p(𝔽_p)) ⊆ J̃_p(𝔽_p)`.
- `x ∈ X_p` if and only if `x = ι_p(R)` for some residue point `R`.
- The commuting square `ρ_p(ι(P)) = ι_p(red_p(P))` for all `P` and p (the structure field).
- `ρ_p(ι(P)) ∈ X_p` for every rational point `P` and every p.
- The Mordell–Weil sieve set `A_S(L)` of the curve for `L ≤ Γ` with `Γ/L` finite.
- `A_S(L) = admissibleClasses(S, L, ρ, X)`.
- Composing `ρ_p` and `ι_p` with homomorphisms `f_p: J̃_p(𝔽_p) → G′_p` keeps the square; with `f_p` the quotient by `N·J̃_p(𝔽_p)` this gives Bruin–Stoll's `β_{N,p}`.
- `(mapLocal f).ρ_p = f_p` ∘ `ρ_p`.

For the proof, Valuative criterion of properness: `C(ℚ) = 𝒞_p(ℤ_(p))`; composing a section with the
closed point gives `red_p`. The smooth model is a regular proper model with smooth special fibre in
the sense of StableReduction Layer 5. `Pic⁰` of `𝒞_p` is an abelian scheme over `ℤ_(p)` with generic fibre
`J` and special fibre `J̃_p` (request to NeronModelsAndSemistableAbelianVarieties §3.8); by
NeronModelsAndSemistableAbelianVarieties §1.8 it is the Néron model of `J`, so `J(ℚ) = 𝒩(ℤ_(p))` and `ρ_p` is the
specialisation `𝒩(ℤ_(p)) → 𝒩(𝔽_p)`, a homomorphism because 𝒩 is a group scheme. A rational divisor on
`C` extends by closure to a horizontal relative divisor on `𝒞_p` of the same degree; in degree zero the
class of its line bundle is a `ℤ_(p)-point` of `Pic⁰` restricting to `[D]` and [D̄]. Applied to `P − D₁`
this is the square (d); applied to `E − d·D₁` it is the symmetric-power square used by
relative-symmetric-sieve. `C̃_p(𝔽_p)` is finite, so `X_p` is a finite subset of the finite group
`J̃_p(𝔽_p) = Pic⁰(C̃_p)` (JacobianChallenge Layers D–E over `𝔽_p`). Genus one: with `D₁ = O, P ↦ [P − O]`
is the group isomorphism of AlgebraicCurves Layer 10 (Riemann–Roch group law), `ρ_p` is the reduction
of points on a minimal Weierstrass equation from EllipticCurves Layer `4, ι_p` is a bijection and `X_p = Ẽ(𝔽_p)`. Executable presentations of `J̃_p(𝔽_p)`, of `ρ_p` on generators and of `X_p` (Mumford
representation, Cantor's algorithm, discrete logarithms) are supplied as exact finite
presentations.

**Checks.**

- One place, residue points `r₀, r₁` with `ι_p(r₀) = 1` and `ι_p(r₁) = 2` in `ℤ/5, Γ = ℤ, ι` constant 1 and `ρ` the reduction `ℤ → ℤ/5: X_p = {1, 2}`.
- With `S = ∅` the sieve set `A_∅(L)` is all of `Γ/L`.
- If `ι_p` is surjective, as for an elliptic curve with `D₁ = O` where `ι_p` is the Mathlib/Tau Ceti class-group identification `Ẽ(𝔽_p) ≅ Pic⁰`, then `X_p` is the whole local group.
- Points `{0, 1}, Γ = ℤ, ι(n) = n, ρ` the reduction to `ℤ/2` and `ι_p = id` on `ℤ/2`: the reductions of the known point 0 form `{0} ≠ X_p = {0, 1}`. A local set built from known points only is not a local image.
- The commuting square holds for every rational point and every place in `S`, and for every rational effective divisor of degree d.
- For an elliptic curve with `D₁ = O` every local image is the whole group, so good places alone never give an obstruction.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §2, published p.274; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §7, published p.299.)

*Needs:* JacobianChallenge Layer `D` (relative Picard and Jacobian); JacobianChallenge Layer `E` (abelian varieties); JacobianChallenge Layer `F` (Abel–Jacobi); StableReduction Layer 5 (regular and minimal models); NeronModelsAndSemistableAbelianVarieties §1.8; NeronModelsAndSemistableAbelianVarieties §3.8; EllipticCurves Layer 4 (local reduction and formal groups); AlgebraicCurves Layer 10 (hyperelliptic and plane models).

### 5.12 Rational points survive the Mordell–Weil sieve

Let `D` be jacobian reduction data for `C/ℚ` with places `S, L ≤ Γ` a subgroup with `Γ/L` finite, and for
each `p ∈ S` let `Y_p ⊆ G_p` be a finite set containing `X_p` (the exact local image or an exact
superset, for instance from bad or deep information). Then for every `P ∈ C(ℚ)` the class `q_L(ι(P))`
lies in `admissibleClasses(S, L, ρ, Y)`. Hence if this set is empty then `C(ℚ) = ∅`. With `L = NΓ` and the
local data composed with `G_p → G_p/NG_p` this says that the image of `C(ℚ)` in `J(ℚ)/NJ(ℚ)` lies in
Bruin–Stoll's `A(S, N)`.

Work under the following conditions. `D` is jacobian reduction data; `S ⊆` the places of `D; Γ/L` is
finite; `X_p ⊆ Y_p` for every `p ∈ S`. `Γ` is an abelian group, `S` a finite set of places, each `G_i` an
abelian group, `φ_i: Γ → G_i` additive and `X_i ⊆ G_i` finite; `L ≤ Γ` has finite quotient `Γ/L`.
Surjectivity of `φ_i` is not assumed.

For the proof, `red_aj_mem_localImage` gives `ρ_p(ι(P)) ∈ X_p ⊆ Y_p` for every `p ∈ S`. global-soundness
applied to `g = ι(P)` gives `q_L(ι(P)) ∈ admissibleClasses(S, L, ρ, Y)`; exact-map-obstruction with
`j = ι` and `r_p = ι_p` ∘ `red_p` gives emptiness of `C(ℚ)` from emptiness of the sieve set.
local-overapproximations justifies working with `Y_p ⊇ X_p`; for `mapLocal` data the local sets are the
images of `X_p` in the quotients.

Replacing each necessary local set by a superset preserves every surviving global element.

**Checks.**

- For an elliptic curve with `D₁ = O` the local images are full, the sieve set is `Γ/L` for every `S`, and the theorem holds without giving an obstruction.
- For `Γ = ℤ/2` with two places and local sets `{0}, {1}, A_S(Γ) = {0}` is nonempty although no element of `Γ` satisfies both conditions: nonemptiness proves nothing.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3, published p.274.)

*Needs:* §5.11; §5.2; §5.9; §5.1.

### 5.13 Local sieve data from finite quotients of `J(ℚ_p)`

Let `ι: C(ℚ) → J(ℚ)` be as in jacobian-reduction-data, p any prime (of good or bad reduction) and `U ≤ J(ℚ_p)` an open subgroup of finite index: `J¹(ℚ_p)` (kernel of reduction for a given model), `J⁰(ℚ_p)`
(points reducing into the identity component) or `Jⁿ(ℚ_p)` (the `pⁿℤ_p-points` of the formal group). Put
`Γ = J(ℚ), K_U = Γ ∩ U, G_U = Γ/K_U` with quotient map `φ_U`, and `X_U = {c ∈ G_U : some g ∈ Γ with class`
`c has (g + U) ∩ ι(C(ℚ_p)) ≠ ∅}`, or any exact finite superset `X′_U ⊇ X_U`. For every `P ∈ C(ℚ), φ_U(ι(P)) ∈ X_U`, so `(G_U, φ_U, X_U)` is a valid local datum for admissible-classes. For `U = J¹(ℚ_p)`
at a prime of good reduction, the reduction isomorphism `J(ℚ_p)/J¹(ℚ_p) ≅ J̃_p(𝔽_p)` identifies `G_U`
with `ρ_p(Γ)` and `X_U` with `X_p ∩ ρ_p(Γ)`: this is the normalisation of Bruin–Stoll §3.1, where `G_p` is
replaced by the image of `φ_p` and `X_p` by its intersection with that image.

Work under the following conditions. `ι: C(ℚ) → J(ℚ)` from a rational degree-one class; `U ≤ J(ℚ_p)`
open of finite index; `X′_U ⊇ X_U` finite. In the mathematical interface `J(ℚ_p)` is an abelian group A with a
homomorphism incl: `Γ → A, U` an additive subgroup of A and `Y ⊆` A the image of the local points;
finiteness of `Γ/(Γ ∩ U)` is an input.

The interface includes these statements.

- The finite set `X_U ⊆ Γ/(Γ ∩ U)` of classes whose U-coset meets the local points `Y`.
- `c ∈ X_U` iff some g with class c and some `y ∈ Y` have `incl(g) − y ∈ U`.
- If `incl(g) ∈ Y` then the class of g lies in `X_U` (soundness for global points).
- `Y ⊆ Y′` implies `X_U(Y) ⊆ X_U(Y′)`.
- For `U′ ≤ U` the projection `Γ/(Γ ∩ U′) → Γ/(Γ ∩ U)` maps `X_{U′}` into `X_U`: deeper information refines shallower information.
- In the setting of admissible-classes suppose `L ≤` ker `φ_i` for every `i ∈ S`. Then for every `g ∈ Γ, q_L(g) ∈ A_S(L)` if and only if `φ_i(g) ∈ X_i` for all `i ∈ S`. Hence `A_S(L)` is the image under `q_L` of the set of globally compatible elements, and `A_S(L) = ∅` if and only if no `g ∈ Γ` satisfies all the local conditions. With `L = ⋂_{i∈S}` ker `φ_i` (of finite index when the `G_i` are finite) the finite set `A_S(L)` is Box's coset intersection `⋂_i φ_i^{-1}(X_i)`, read in `Γ/L` instead of in `ℤⁿ`.

For the proof, Finiteness: `J¹(ℚ_p)` has index `#𝒩(𝔽_p)` in `J(ℚ_p)` and the logarithm maps `Jⁿ(ℚ_p)` onto
`(pⁿℤ_p)^g` for p odd (and for `n ≥ 2` when `p = 2`), so each Jⁿ, and every subgroup `U` containing one of
them, has finite index `(§4.2 (c)); Γ/K_U` injects into `J(ℚ_p)/U`. Soundness: for `P ∈ C(ℚ)` take `g = ι(P)` and the local point `ι(P) ∈ ι(C(ℚ_p))`. Good reduction: `J¹(ℚ_p)` is the kernel of `ρ_p` on `J(ℚ_p)`
and `Jⁿ(ℚ_p)` the `pⁿℤ_p-points` of the formal group `(§4.2); ρ_p` is onto `J̃_p(𝔽_p)` by Hensel's lemma,
and `g + J¹` meets `ι(C(ℚ_p))` iff `ρ_p(g) ∈ ι_p(C̃_p(𝔽_p))`, because every `𝔽_p-point` of the smooth
special fibre lifts to `C(ℚ_p)`. Bad and deep places: genus-two-bad-information and
genus-two-deep-information supply finite supersets `X′_U` and generators of `K_U`
(subgroup-from-membership-test, or the kernel of the logarithm).

**Checks.**

- padicImageClasses_top. With `U` the whole group and `Y` nonempty, `X_U` is the single class.
- padicImageClasses_empty_points. With `Y = ∅, X_U = ∅`.
- padicImageClasses_mod_four. `Γ = A = ℤ`, incl `= id, U = 4ℤ, Y = {1}: X_U = {1 mod 4}`.
- padicImageClasses_coset_not_point. `Γ = A = ℤ, U = 4ℤ, Y = {5}`: the class of 1 lies in `X_U` although `1 ∉ Y`; the test is membership of the coset, not of the point.
- padicImageClasses_good_reduction. With `U =` ker `ρ` for a homomorphism `ρ: A →` J̃, the class of g lies in `X_U` iff `ρ(incl g) ∈ ρ(Y)`: the good-reduction test of jacobian-reduction-data.
- At a good prime with `U = J¹` the datum agrees with the good-reduction datum of jacobian-reduction-data restricted to the image of `Γ`.
- `Γ = G = ℤ/2, φ = id`, two places with `X₀ = {0}, X₁ = {1}`: at `L = 0` (below the kernels) `A_S(0) = ∅`, while at `L = Γ` the sieve set is `{0}`.
- Box's sieve for `X₀(N)`: the intersection of the sets `φ_p^{-1}(ι_p(M_p)) ⊆ ℤⁿ` is empty iff the finite sieve at ⋂ ker `φ_p` is empty.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §5, published p.295; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §5, published pp.286–287; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.4, Remark 2.8, arXiv p.7; [Ana Caraiani and James
Newton](https://arxiv.org/abs/2301.10509), §7.4, proof of Theorem 7.4.2, arXiv p.99.)

*Needs:* §5.11; §4.2; JacobianChallenge Layer `E` (abelian varieties); Mathlib `QuotientGroup.mk'`; Mathlib `Subgroup.comap`; §5.1; Mathlib `MonoidHom.ker`; Mathlib `QuotientGroup.mk'_surjective`.

### 5.14 Computing the sieve on a subgroup of index prime to `N`

Let `Γ` be an abelian group, `H ≤ Γ` and `N ≥ 1` with `gcd([Γ:H], N) = 1` (native index; §3.21 and §3.18
supply `H` by generators with this coprimality for the primes dividing `N`). Then `(i) H ∩ NΓ = NH`; (ii)
the inclusion induces a group isomorphism H/NH `≅ Γ/NΓ`; (iii) for local data `φ_i: Γ → G_i` and finite
`X_i ⊆ G_i (i ∈ S)` put `ψ_i = (G_i → G_i/NG_i)` ∘ `φ_i|_H` and `X̄_i =` the image of `X_i` in `G_i/NG_i`; for
every `γ ∈ Γ` with `φ_i(γ) ∈ X_i` for all `i ∈ S` there is `h ∈ H` with `h − γ ∈ NΓ`, and the class of h in
H/NH lies in `admissibleClasses(S, NH, ψ`, X̄); by (ii) this class is determined by `γ`. Consequently
the sieve computed from the generators of `H` alone, with targets `G_i/NG_i`, contains the class of
every rational point, and its emptiness proves `C(ℚ) = ∅`. No element of `Γ` outside `H` is used.

Work under the following conditions. `Γ` abelian; `H ≤ Γ; N ≥ 1; gcd([Γ:H], N) = 1` with the native
index (an infinite index is represented by 0 and is then coprime only to `N = 1`). `S` finite; `φ_i: Γ → G_i` additive; `X_i ⊆ G_i` finite; H/NH has a finite enumeration.

For the proof, `(i) NH ⊆ H ∩ NΓ`. Conversely let `h = Nγ ∈ H` and `d = [Γ:H]; Subgroup.pow_index_mem`
gives `dγ ∈ H, Nat.gcd_eq_gcd_ab` gives `du + Nv = 1`, so `γ = u(dγ) + vh ∈ H` and `h ∈ NH`. (ii)
Surjectivity is subgroup-covers-quotient with `L = NΓ`; injectivity is (i). (iii) `ψ_i(NH) = 0` in
`G_i/NG_i`, so the test at i is exact there. If `h − γ = Nγ′` then `φ_i(h) − φ_i(γ) ∈ NG_i`, so `ψ_i(h)` is
the image of `φ_i(γ) ∈ X_i`; global-soundness for (`H, ψ`, X̄) gives the claim. Testing modulo `NG_i`
instead of `φ_i(NΓ)` makes the computation independent of the unknown part of `Γ: φ_i(Γ)` cannot be
computed from `H` when `[Γ:H] > 1`.

**Checks.**

- `Γ = ℤ, H = 3ℤ, N = 2: H ∩ 2ℤ = 6ℤ = 2H` and `3ℤ/6ℤ ≅ ℤ/2`; with `G = ℤ/6` and `φ` the reduction, the class of 3 is tested modulo `2G = {0, 2, 4}` exactly as `γ = 1`.
- `H = 2ℤ, N = 2`: the map H/2H `→ Γ/2Γ` is zero and the odd class is lost; the coprimality hypothesis fails.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.4, published p.284; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.4, arXiv pp.6–7, input (ii).)

*Needs:* §5.8; §5.2; §3.21; §3.18; Mathlib `Subgroup.pow_index_mem`; Mathlib `Nat.gcd_eq_gcd_ab`; Mathlib `powMonoidHom`; Mathlib `QuotientGroup.map`.

### 5.15 The sieve along a descending chain of subgroups

Given places `S`, local data `(φ_i, X_i)`, subgroups `L_0 ≥ L_1 ≥ L_2 ≥ …` of `Γ` with finite quotients,
proposed lifts `σ_j: Γ/L_j → Γ/L_{j+1}` and test sets `T_j ⊆ S`, define `siftChain` by `A_0 = admissibleClasses(S, L_0, φ, X)` and `A_{j+1} = refineClasses(T_j, L_{j+1}, L_j, σ_j, A_j)`.
Bruin–Stoll's computation of `A(NΓ)` is the instance `L_0 = Γ` with the chain `N_0Γ ⊇ N_1Γ ⊇ … ⊇ N_mΓ`
refined by PrepareLift into steps `L_{j−1} ⊇ L_j, σ_j` a choice of representatives and `T_j = I_j`. The
value at each level is a finite set; that the chain has reached its intended final level `NΓ` is
recorded in the datum.

Work under the following conditions. `Γ` is an abelian group, `S` a finite set of places, each `G_i` an
abelian group, `φ_i: Γ → G_i` additive and `X_i ⊆ G_i` finite; `L ≤ Γ` has finite quotient `Γ/L`.
Surjectivity of `φ_i` is not assumed. `L_{j+1} ≤ L_j` for all j; every `Γ/L_j` has a finite enumeration;
`σ_j` and `T_j` are arbitrary data, checked only in sieve-chain-correct.

The interface includes these statements.

- The finite set at level j of the iterated sieve.
- Level 0 is `admissibleClasses(S, L_0, φ, X)`.
- Level j + 1 is `refineClasses(T_j, L_{j+1}, L_j, σ_j`, level j).
- `|A_{j+1}| ≤ |A_j|·|ker(Γ/L_{j+1} → Γ/L_j)|` (from lift-cardinality).
- Under the checks of sieve-chain-correct, level j equals `A_S(L_j)` (see sieve-chain-correct).
- Let A be an abelian group of finite exponent e (for instance a finite local group `G_i), q` a prime and `M` a natural number with `v_q(e) ≤ v_q(M)`. Then (qM)A `= MA`. Consequently `φ(qMΓ) = φ(MΓ)` for every homomorphism `φ: Γ →` A, so by unchanged-local-image the place gives the same test on `Γ/qMΓ` as on `Γ/MΓ` and is omitted when lifting from `N_{k−1}Γ` to `N_kΓ = q_kN_{k−1}Γ`: only places with `v_{q_k}(e_i) ≥ v_{q_k}(N_k)` are relevant. Surjectivity of `φ` is not needed.

For the proof, induction on the finite chain length and the coset decomposition of §5.5
give the asserted finite-set identities. The cardinality bound is the fibre-cardinality bound
for the projection of native finite quotients.

**Checks.**

- siftChain_level_zero. Before any lifting the chain is the direct sieve at `L_0`.
- siftChain_no_places. With `S = ∅, T_j = ∅` and correct lifts every class survives at every level.
- siftChain_two_levels. `Γ = ℤ/4, L_0 = Γ, L_1 = 0, φ = id, X = {1}`, lift of the class 0 equal to 1 and `T_0 = S`: level 1 is `{1}`.
- siftChain_omitted_changed_test. Same data with `T_0 = ∅`: level 1 has 4 elements, not the direct sieve `{1}`; the omitted place has `φ(L_1) = 0 ≠ φ(L_0)`.
- Every level is a finite set determined by the displayed membership equivalence.
- A `= ℤ/4, q = 2, M = 4: v₂(4) = 2 ≤ 2` and `8A = 4A = 0`.
- A `= ℤ/4, q = 2, M = 2: v₂(4) = 2 > 1` and `4A = 0 ≠ 2A = {0, 2}`; the place is relevant.
- A `= ℤ` has exponent 0 and is excluded: `2ℤ ≠ ℤ` although `padicValNat 2 0 = 0`.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.2, published p.277;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.279; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.278.)

*Needs:* §5.5; §5.1; Mathlib `Monoid.exponent`; Mathlib `Monoid.exponent_ne_zero_of_finite`; Mathlib `padicValNat`; Mathlib `powMonoidHom`.

### 5.16 Correctness of the iterated sieve

In sieve-chain assume for every j: `σ_j` is a section on `A_S(L_j)` (the projection `Γ/L_{j+1} → Γ/L_j`
sends `σ_j(a)` to a for every a `∈ A_S(L_j)), T_j ⊆ S`, and `φ_i(L_{j+1}) = φ_i(L_j)` for every `i ∈ S∖T_j`.
Then `siftChain` at level j equals `A_S(L_j)` for every j. In particular, if `L_t = NΓ` the computed set
is `A(NΓ)`, and if some level is empty every subsequent level is empty.

Work under the following conditions. `Γ` is an abelian group, `S` a finite set of places, each `G_i` an
abelian group, `φ_i: Γ → G_i` additive and `X_i ⊆ G_i` finite; `L ≤ Γ` has finite quotient `Γ/L`.
Surjectivity of `φ_i` is not assumed. `L_{j+1} ≤ L_j; σ_j` a section on `A_S(L_j); T_j ⊆ S`; unchanged
image subgroups at the omitted places.

For the proof, Induction on j. Level 0 is the definition `(siftChain_zero)`. If level j is `A_S(L_j)`,
§5.6 (omitting the unchanged tests) with `K = L_{j+1}, L = L_j` and `T = T_j` gives `refineClasses(T_j, L_{j+1}, L_j, σ_j, A_S(L_j)) = A_S(L_{j+1})`. quotient-refinement gives the statement about empty levels.

**Checks.**

- PrepareLift and Lift with the corrected prepared subgroups `L_j = L_{j−1} ∩ φ_i^{-1}(N_kG_i)` and the test sets `I_j` compute `A(N_kΓ)`.
- For the `ℤ/4` data of siftChain_omitted_changed_test the hypothesis on `T_0` fails and so does the conclusion.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.279.)

*Needs:* §5.15; §5.6; §5.4.

### 5.17 Triangular generators for a finite-index subgroup

Let an abelian group `Γ` be generated by `b₁,…,b_r` and let `K ≤ Γ` have finite index.
Prove that there are `g₁,…,g_r ∈ K` generating `K`, with triangular expressions
`g_k = j_k b_k + a_k`, where `j_k ≥ 1` is the order of `b_k` modulo
`K + ⟨b₁,…,b_(k−1)⟩` and `a_k ∈ ⟨b₁,…,b_(k−1)⟩`.
The finite coset representatives at stage k are exactly a `+ i b_k` for representatives
a at stage k − 1 and `0 ≤ i < j_k`. Their distinctness is equivalent to the
minimality of `j_k`, which is bounded by `[Γ:K]`.
Request `Sieve.subgroup_triangular_generators`, membership, generation, length r,
and the specialization `j_k = 1, g_k = b_k` for `K = Γ`.
This is a subgroup theorem with torsion allowed. For Jacobians the subgroup
`J(ℚ) ∩ J⁰(ℚ_p)` is specified by the geometric membership criterion of §5.25.
No membership-test procedure is requested.

For the proof, induct on k: if `x = c b_k + y` belongs to `K`, then `j_k ∣ c`, and
`x − (c/j_k)g_k ∈ K ∩ ⟨b₁,…,b_(k−1)⟩`. This proves generation as well as the
coset decomposition. The statement needs only a generating list, rather than freeness.

**Checks.**

- For `K = Γ` the output equals the input list.
- `Γ = ℤ, b = [1], K = 4ℤ`: the result is [4].
- `Γ = ℤ², b = [(1,0), (0,1)], K = {(x, y) : x + y even}`: the result is [`(2,0), (1,1)`].
- The doubled generators `(2,0), (0,2)` generate a proper subgroup of the even-sum subgroup `K`; multiplying each generator into `K` separately is wrong.
- The output generates `K` whenever the input generates `Γ`, with torsion allowed.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §5, published p.294; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §5, published p.295.)

*Needs:* Mathlib `Subgroup.closure`; Mathlib `Subgroup.closure_le`; Mathlib `Subgroup.FiniteIndex`; Mathlib `Subgroup.pow_index_mem`.

### 5.18 Each coset of `NΓ` has at most one point of small height

Let `Γ` be an abelian group and ĥ: `Γ → ℝ` a quadratic map over `ℤ (ĥ(nx) = n²ĥ(x), ĥ(x+y) + ĥ(x−y) = 2ĥ(x) + 2ĥ(y))` with ĥ `≥ 0`. Let m be such that `ĥ(x) ≥ m` for every x of infinite order, let `N ≥ 1` kill
the torsion of `Γ (N·x = 0` for every x of finite order; in Bruin–Stoll the exponent of `J(ℚ)_tors`
divides `N`), and let H′ satisfy `N²m >` 4H′. If `x, y ∈ Γ` satisfy `x − y ∈ NΓ` and `ĥ(x), ĥ(y) ≤ H′`, then `x = y`. For `Γ = J(ℚ)` the Néron–Tate height is such a map and m is the minimal canonical height of a
point of infinite order (exact by a short-vector enumeration).

Work under the following conditions. ĥ a quadratic map `Γ → ℝ` over `ℤ` with ĥ `≥ 0`. `m ≤ ĥ(x)` for all x
of infinite order; `N·x = 0` for all x of finite order; 4H′ `< N²m`.

For the proof, Write `x − y = Nz`. The parallelogram law and `ĥ(x + y) ≥ 0` give `ĥ(x − y) ≤ 2ĥ(x) + 2ĥ(y) ≤` 4H′. If z has infinite order then `ĥ(x − y) = N²ĥ(z) ≥ N²m > 4H′ (QuadraticMap.map_smul)`, a
contradiction. So z has finite order and `x − y = Nz = 0`. For elliptic curves Tau Ceti's canonical
height is a quadratic map with ĥ `≥ 0` vanishing exactly on torsion, so the hypotheses are met with
any exact m; for Jacobians the Néron–Tate height is supplied by HeightsRationalPointsAndObstructions Layer 0.

**Checks.**

- `Γ = ℤ, ĥ(x) = x², m = 1, N = 3, H′ = 2: 9 > 8`, and the coset `1 + 3ℤ` contains only 1 with `x² ≤ 2`.
- `Γ = ℤ/2 × ℤ, ĥ(a, x) = x², m = 1, N = 1, H′ = 0.1: (1, 0)` and `(0, 0)` both have height 0 and differ by an element of `NΓ`; the torsion condition `N·(1, 0) = 0` fails.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.2, published p.281.)

*Needs:* Mathlib QuadraticMap; Mathlib `QuadraticMap.map_smul`; Mathlib IsOfFinOrder; Mathlib `powMonoidHom`.

### 5.19 All points of bounded height from the sieve

Let `D` be jacobian reduction data `(P = C(ℚ), Γ = J(ℚ))`, ĥ a quadratic map on `Γ` as in
height-coset-separation, h a height on `C(ℚ)` with `ĥ(ι(P)) ≤ d·h(P) + δ` for all `P (d ≥ 0), H` a bound
and `H′ = dH + δ`. Let `L ≤ Γ` have finite index, `S` places whose local sets contain the true local
images, and for every a `∈ A_S(L)` let `T_a ⊆ q_L⁻¹({a})` be a finite set containing every `x ∈ Γ` with
`q_L(x) =` a and `ĥ(x) ≤ H′` (exact by a closest-vector enumeration in the lattice (`L`, ĥ) around a
representative, §1.8). Then every `P ∈ C(ℚ)` with `h(P) ≤ H` has `ι(P) ∈ T_a` for some a `∈ A_S(L)`. If
moreover `L ⊆ NΓ` with `N` as in height-coset-separation, each `T_a` contains at most one element of
height at most H′, so the points of height at most `H` inject into `A_S(L)`; a candidate `x ∈ T_a` is
accepted by exhibiting a preimage under `ι`, or rejected by a reduction test (kummer-curve-test in
genus two).

Work under the following conditions. `D` jacobian reduction data with local sets containing the true
images; `L ≤ Γ` of finite index. ĥ quadratic over `ℤ; ĥ(ι(P)) ≤ d·h(P) + δ` for all `P` with `d ≥ 0; T_a`
contains every element of the class a of height at most `dH + δ`.

For the proof, curve-sieve-soundness puts `q_L(ι(P))` in `A_S(L)`. `ĥ(ι(P)) ≤ d·h(P) + δ ≤ dH + δ = H′`
because `d ≥ 0`, so `ι(P) ∈ T_{q_L(ι(P))}`. height-coset-separation bounds the number of elements of
height at most H′ in each class by one when `L ⊆ NΓ`. The constants d and `δ` come from a
height-difference bound `(§3.12)` and the explicit embedding; their certification for genus-two
Jacobians is the explicit height-comparison input, and the canonical height of `J(ℚ)` is supplied by
HeightsRationalPointsAndObstructions Layer 0.

**Checks.**

- If `A_S(L) = ∅` there is no rational point of height at most `H`.
- With `N` divisible by the exponent of `J(ℚ)_tors` and `N² >` 4H′/m, each element of `A(S, N)` corresponds to at most one point of height at most `H` (Bruin–Stoll §4.2).

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.2, published p.281;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.2, published p.282.)

*Needs:* §5.12; §5.18; §1.8; §3.12; §3.15; HeightsRationalPointsAndObstructions Layer 0.

### 5.20 Recognising points of a genus-two curve by reduction

Let `C: y² = F(x, z)` be a genus-two curve over `ℚ` with integral binary sextic `F, P₀ ∈ C(ℚ)` with `x(P₀) =` (a : b) for coprime integers a, b, and `ι(P) = [P − P₀]`. For `Q ∈ J(ℚ)` let (`k₁ : k₂ : k₃ : k₄`) be
its image on the Kummer surface with coprime integer coordinates and `h(Q) = log max|k_j|`; let `γ ≥ h −` ĥ on `J(ℚ)`. Let `p₁, …, p_m` be distinct primes of good reduction with `p₁⋯p_m > 3·e^{H′+γ}·max(|a|, |b|)²`, and, if `P₀ ≠ P̄₀`, such that the product of those `p_j` modulo which `P₀` and its hyperelliptic
conjugate `P̄₀` remain distinct exceeds `e^{H′+γ}` (for instance, every `p_j` separates them). If `Q ∈ J(ℚ)`
has `ĥ(Q) ≤ H′` and the reduction of `Q` modulo every `p_j` lies in `ι_{p_j}(C̃(𝔽_{p_j}))`, then `Q ∈ ι(C(ℚ))`. The factor 3 corrects the printed bound. The arithmetic core: if `|k_j| ≤ B`, every `p_j`
divides `k₁a² − k₂ab + k₃b²`, and `∏ p_j > 3B·max(|a|, |b|)²`, then `k₁a² − k₂ab + k₃b² = 0`.

Work under the following conditions. `C` of genus two with integral sextic model; `P₀` rational with
`x(P₀) =` (a : `b), gcd(a, b) = 1; ι(P) = [P − P₀]`. `γ ≥ h −` ĥ on `J(ℚ)`; distinct good primes with `p₁⋯p_m > 3e^{H′+γ}max(|a|,|b|)²`; if `P₀ ≠ P̄₀`, the `p_j` separating `P₀` and `P̄₀` have product `> e^{H′+γ}`. The
prime condition on the separating primes corrects the insufficient separating-prime hypothesis in
the published proof.

For the proof, The quadratic `k₁X² − k₂XZ + k₃Z²` vanishes at the x-coordinates of the degree-two
divisor representing `Q` (Kummer coordinates (1 : `x₁+x₂ : x₁x₂ : β₀`), the supplied Cassels–Flynn model
identity). If `Q mod p_j = ι_{p_j}(R) = [R − (P₀ mod p_j)] = [R + P₀′ − W`], with `P₀′` the
hyperelliptic conjugate and `W` a canonical divisor, then the degree-two divisor of `Q mod p_j` contains
a point with x-coordinate `x(P₀) mod p_j`, so `p_j` divides `k₁a² − k₂ab + k₃b²` (the printed proof writes
`k₁b² − k₂ab + k₃a²`, the coordinate convention above). `|k_j| ≤ e^{h(Q)} ≤ e^{ĥ(Q)+γ} ≤ e^{H′+γ}`, so
`|k₁a² − k₂ab + k₃b²| ≤ (|k₁| + |k₂| + |k₃|)·max(|a|,|b|)² ≤ 3e^{H′+γ}max(|a|,|b|)²`; the product of
the distinct `p_j` divides this integer, which therefore vanishes `(kummerLineValue_eq_zero)`. Vanishing
means the divisor of `Q` contains a point with x-coordinate `x(P₀)`, so `Q = [P − P₀]` or `Q = [P − P̄₀]`
with `P ∈ C(ℚ)`. In the second case with `P ≠ P̄₀` (so `P₀ ≠ P̄₀` and `Q ≠ 0`): at a prime `p_j` separating `P₀`
and `P̄₀, Q mod p_j =` [P̃ `+ P̃₀ − W`] equals some `ι_{p_j}(R) = [R + P̄̃₀ − W]` only if P̃ `= P̄̃₀`,
because an effective degree-two divisor outside the canonical class is the only effective divisor in
its class; then `Q ≡ 0` modulo `p_j`, so `p_j` divides `k₁, k₂, k₃`, which are not all zero, and the product
of the separating primes is at most `max|k_j| ≤ e^{H′+γ}`, a contradiction. (The printed proof
distinguishes the cases at a single `p_{j₀}`, which fails when `P ≡ P̄₀` modulo `p_{j₀}.) γ` is the
genus-two height-difference bound (height-comparison input; §3.12 covers elliptic curves).

The factor 3 corrects the printed bound. Use the actual genus-two Jacobian, Cassels–Flynn/Kummer carriers and coordinate identities from the stated suppliers. The arithmetic helper alone does not identify the geometric objects or supply these model theorems.

**Checks.**

- Arithmetic core: a `= b = 1, |k_j| ≤ 10`, primes `{2, 3, 5, 7}`: an integer divisible by 210 with absolute value at most 30 is zero.
- The printed estimate fails for `(k₁, k₂, k₃) = (1, −1, 1)` and a `= b = 1`: the value is 3 while `max|k_j|·max(|a|,|b|)² = 1`.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), Lemma 4.1, published p.281;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), Lemma 4.1, proof, published p.281.)

*Needs:* §5.11; §3.12; AlgebraicCurves Layer 10 (hyperelliptic and plane models); Mathlib `Finset.prod`.

### 5.21 Refining the subgroup represented by known points (Siksek's step)

Let j: `P → Γ` be a map (`P = C(ℚ)` or the integral points, `j = ι), W ⊆ Γ` finite and `L ≤ Γ` such that `W`
represents the image of `P` in `Γ/L`: every `j(p)` lies in `W + L`. Let `φ: Γ →` A be a homomorphism with
`φ(j(p)) ∈ Y` for all p (for a good prime q: `φ = ρ_q` and `Y = ι_q(C̃(𝔽_q))), L′ = L ∩` ker `φ`, and `R ⊆ Γ`
a set meeting every nontrivial coset of L′ in `L` (every ℓ `∈` L∖L′ is congruent modulo L′ to some `r ∈ R`). If `φ(w + r) ∉ Y` for all `w ∈ W` and `r ∈ R`, then `W` represents the image of `P` in `Γ/L′`: every `j(p)`
lies in `W + L′`. Only the values `φ(w + r)` are needed, not a discrete logarithm of the local image.

Work under the following conditions. j: `P → Γ; W ⊆ Γ` finite; every `j(p) ∈ W + L`. `φ: Γ →` A with
`φ(j(p)) ∈ Y; R` meets every nontrivial coset of `L ∩` ker `φ` in `L; φ(w + r) ∉ Y` for `w ∈ W, r ∈ R`.

For the proof, Write `j(p) = w +` ℓ with ℓ `∈ L`. If ℓ `∉ L′` choose `r ∈ R` and ℓ′ `∈ L′` with ℓ `= r +` ℓ′;
then `φ(j(p)) = φ(w + r)` since `φ(ℓ′) = 0`, so `φ(w + r) ∈ Y`, contradicting the test. Hence ℓ `∈ L′`.
Iterating over primes q gives a decreasing chain of subgroups with the same invariant; (`L` : L′) is
computed from `ρ_q` on generators.

**Checks.**

- `Γ = ℤ, W = {0}, L = 2ℤ, φ: ℤ → ℤ/4, Y = {0}: L′ = 4ℤ, R = {2}`, and `φ(2) = 2 ∉ Y`, so every `j(p) ∈ 4ℤ`.
- If `φ(w + r) ∈ Y` for some pair the step gives no conclusion.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.3, published p.282;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.3, published p.283.)

*Needs:* §5.11; Mathlib `MonoidHom.ker`.

### 5.22 Integral points on hyperelliptic curves from a sieve lower bound

Let `f ∈ ℤ[x]` be separable of degree `n ≥ 5, C` the smooth projective curve of genus `g =` ⌊(n−1)/2⌋ with
affine model `y² = f(x)` (AlgebraicCurves Layer 10), 𝓘 `= {(x, y) ∈ ℤ² : y² = f(x)} ⊆ C(ℚ)`, and `ι: C(ℚ) → J(ℚ)` from jacobian-reduction-data (for n odd, `D₁ = ∞`, the unique point at infinity). The covering
map is the inclusion of the integral points of the affine Weierstrass model into `C(ℚ)`, followed by
`ι`. Let `W ⊆` 𝓘 be finite and `L ≤ J(ℚ)` such that `(i) ι(P) ∈ ι(W) + L` for all `P ∈` 𝓘 (from
curve-sieve-soundness with known representatives and siksek-lattice-step); `(ii) μ > 0` with `ĥ(ℓ) ≥ μ`
for every nonzero ℓ `∈ L` (a short-vector datum in (`L`, ĥ)); (iii) `ĥ(ι(P)) ≤ d·log max(1, |x(P)|)`
`+ δ` on 𝓘 with `d ≥ 0; (iv) log max(1, |x|) ≤ B` for all `(x, y) ∈` 𝓘, supplied by
DiophantineApproximationAndTranscendence §4.4 (superelliptic bound) with `n = 2` and `b = 1, B = (4N)^{2^{12}N⁴}·e^{50N⁴h(f)}` for `N =` deg
f and `h(f) = log max(1, |coefficients of f|)`, or by any exact sharper bound. Put w* `= max({0}∪{ĥ(ι(w)):w∈W})`, so `w*=0` if `W` is empty. If `√w* < √μ` and `dB + δ < (√μ − √w*)²`, then 𝓘 `= W`.

Work under the following conditions. f separable, deg `f ≥ 5`; 𝓘 the integral points of `y² = f(x); ι`
injective (genus `≥ 1`). (i)–(iv) as stated, each exact: the sieve and Siksek steps for (i), short
vectors for (ii), the height comparison for (iii), the DiophantineApproximationAndTranscendence §§4.1–4.5 bound for (iv).

For the proof, Let `P ∈` 𝓘∖W. By `(i) ι(P) − ι(w) ∈ L` for some `w ∈ W`; it is nonzero because `ι` is
injective, so `ĥ(ι(P) − ι(w)) ≥ μ` by (ii). `√ĥ` is a seminorm: `ĥ(sx + ty) ≥ 0` for all integers s, t,
hence for all reals by homogeneity and continuity, which is the Cauchy–Schwarz inequality for the
polar form. So `√ĥ(ι(P)) ≥ √μ − √ĥ(ι(w)) ≥ √μ − √w* > 0`. Squaring, `ĥ(ι(P)) ≥ (√μ − √w*)² > dB + δ ≥ d·log max(1, |x(P)|) + δ ≥ ĥ(ι(P))`, a contradiction. The upper bound is stated for the equation
itself, so no descent covering is needed; the constants `d, δ` for the Kummer height of `[P − ∞]` are
the explicit height-comparison input.

**Checks.**

- Toy instance: `Γ = ℤ, ĥ(x) = x², L = 10ℤ, μ = 100, w* = 4, d = 1, δ = 0, B = 30: (10 − 2)² = 64 > 30`, so every point is known.
- The bounds must actually cross: Bruin–Stoll report `N` near `10^100` from the sieve and subgroups of index up to `10^1800` from the second stage, against Baker-type bounds near `10^600`; an uncrossed pair of bounds gives no conclusion.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.3, published p.282.)

*Needs:* §5.21; §5.12; §5.11; DiophantineApproximationAndTranscendence §4.4 (superelliptic bound); §1.8; HeightsRationalPointsAndObstructions Layer 0; AlgebraicCurves Layer 10 (hyperelliptic and plane models); Mathlib QuadraticMap; Mathlib `Real.sqrt`.

### 5.23 Combination of Chabauty–Coleman with the Mordell–Weil sieve

Let `D` be jacobian reduction data for a curve `C/ℚ` of genus `g ≥ 2` whose Jacobian has `rank r < g`, and
`p₀ ∈ S` a prime of good reduction with `p₀ ≥ 3` and a nonzero `ω ∈ Ann_{p₀}(J(ℚ)) (§4.9)`, scaled to be
integral with nonzero reduction `ω̄`. Let Ū `⊆ C̃(𝔽_{p₀})` be the residue classes `R` for which §4.11
gives at most one rational point reducing to `R` (for instance those with `ω̄(R) ≠ 0`). Let `L ≤ J(ℚ)`
have finite index with `L ⊆` ker `ρ_{p₀}` (for instance `L ⊆ NJ(ℚ)` with the exponent of `J̃(𝔽_{p₀})`
dividing `N`). Then: (i) if `ι(P) − ι(P′) ∈ L` then `red_{p₀}(P) = red_{p₀}(P′); (ii) P ↦ q_L(ι(P))` is
injective on `{P ∈ C(ℚ) : red_{p₀}(P) ∈ Ū}`; (iii) (residue-class decision) if the sieve with the
local set `ι_{p₀}(C̃(𝔽_{p₀})∖Ū)` at `p₀` and the full local images elsewhere is empty, every rational
point reduces into Ū; the residue classes outside Ū may instead be settled one at a time by valid §4
(residue-disc-verdicts), whose lists `Z_rat` are the rational points of those classes; (iv) if `W ⊆ C(ℚ)` is a finite set of known points containing every rational point that reduces outside Ū (for
instance there is none, by (iii)) and every class of `A_S(L)` equals `q_L(ι(w))` for some `w ∈ W`, then
`C(ℚ) = W`. If some class is unrepresented, the displayed hypotheses do not give a complete-point-set conclusion.

Work under the following conditions. `C/ℚ` of genus `g ≥ 2, rank r < g; D` jacobian reduction data; `p₀ ∈ S` good, `p₀ ≥ 3`, with `ω ∈ Ann_{p₀}(J(ℚ))` integral with nonzero reduction `(§4.9)`. Ū `⊆ C̃(𝔽_{p₀})`
exact by §4.11; `L` of finite index with `L ⊆` ker `ρ_{p₀}`.

For the proof, `(i) ρ_{p₀}(ι(P) − ι(P′)) = 0` since `L ⊆` ker `ρ_{p₀}`; the square gives `ι_{p₀}(red P) = ι_{p₀}(red P′)`, and `ι_{p₀}` is injective because the Abel–Jacobi map of a curve of genus at least one
is a closed immersion (JacobianChallenge Layer `F`). (ii) Two points with the same class share a
residue class in Ū, which contains at most one rational point. (iii) exact-map-obstruction
applied to the points reducing outside Ū, with the smaller local set at `p₀`. (iv) For `P` reducing into
Ū, curve-sieve-soundness puts `q_L(ι(P))` in `A_S(L)`, so `q_L(ι(P)) = q_L(ι(w))` for some `w ∈ W`; by (i) w
reduces to the same class of Ū, and by `(ii) P = w` (known-points-completeness on the points reducing
into Ū). Points reducing outside Ū lie in `W` by hypothesis. If `L ⊆ NJ(ℚ)` and the exponent of
`J̃(𝔽_{p₀})` divides `N` then `ρ_{p₀}(L) ⊆ N·J̃(𝔽_{p₀}) = 0`.

**Checks.**

- Bruin–Stoll §4.4 procedure: a prime `p ≥ 3` with `ω̄_p` non-vanishing on `C(𝔽_p)` gives Ū `= C̃(𝔽_p); S` and `N` with the exponent of `J(𝔽_p)` dividing `N; A(S, N)` computed; every element the class of a known rational point; conclusion `C(ℚ) = W`.
- Without `L ⊆` ker `ρ_{p₀}`, two rational points in different residue classes can share a class modulo a coarse `L`, injectivity fails and the known points need not be all points.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.4, published p.283;
[McCallum–Poonen (2012)](https://math.mit.edu/~poonen/papers/chabauty.pdf), Theorem 5.3(a), author
copy p.7.)

*Needs:* §5.11; §5.12; §5.9; §5.10; §4.9; §4.11; §4.16; JacobianChallenge Layer `F` (Abel–Jacobi).

### 5.24 The relative symmetric Mordell–Weil sieve

Let `X/ℚ` be a smooth projective non-hyperelliptic curve of genus `g ≥ 3` with Jacobian `J` (the setting
of §4.22 and Box §2), possibly with a degree-two map `π: X → C` to a smooth curve `C/ℚ`, and `X^(2)` its
symmetric square. Input: primes `p₁, …, p_r` of good reduction for `X` (and for `C`, with `π` extending to
the models); divisors `D₁, …, D_n` generating a subgroup `G ≤ J(ℚ)` of finite index; an integer `I ≥ 1`
with `I·J(ℚ) ⊆ G`; a finite set `L ⊆ X^(2)(ℚ)` containing a rational degree-two divisor `∞`; and for each
i a subset `L_i^good ⊆ L` of known points to which §4.22 applies at `p_i` (Box Theorem `2.1`: the point is
the only point of `X^(2)(ℚ)` in its residue class; or Box Theorem `2.4` for `x = π*(P)`: every point of
its residue class comes from `C(ℚ)`). Put `ι(x) = I·([x] − ∞) ∈ G` and `ι_p(R) = I·([R] − ∞̃)` on
`X̃^(2)(𝔽_p)`, so that `red_p(ι(x)) = ι_p(red_p(x))` (jacobian-reduction-data for degree-two divisors),
and `M_i^bad = ι_{p_i}^{-1}(red_{p_i}(G)) ∖ red_{p_i}(L_i^good)`. If no `g ∈ G` satisfies `red_{p_i}(g) ∈ ι_{p_i}(M_i^bad)` for every i, then `X^(2)(ℚ) = L ∪ π*C(ℚ) (= L` when there is no `π`). The hypothesis is
decided finitely: for `L₀ = ⋂_i ker(red_{p_i}|_G)`, of finite index, it holds iff `admissibleClasses(S, L₀`, red, `ι(M^bad)) = ∅` (kernel-level-exactness). This is Caraiani–Newton Theorem `7.4.2 =` Box Theorem
`2.6`.

Work under the following conditions. `X` smooth projective non-hyperelliptic of genus `g ≥ 3` over `ℚ; π`:
`X → C` of degree two when present; the `p_i` of good reduction for `X` and `C` with `π` extending. Without `π, L_i^good` is defined by §4.21 alone. `G ≤ J(ℚ)` generated by `D₁, …, D_n` with `I·J(ℚ) ⊆ G; ∞ ∈ L ⊆ X^(2)(ℚ)` finite; `L_i^good` exact by §4.22 at `p_i`.

For the proof, Caraiani–Newton Proposition `7.4.1` (from §4.22): if `red_{p_i}(x) ∈ red_{p_i}(L_i^good)`
for some i then `x ∈ L ∪ π*C(ℚ)`. Let `x ∉ L ∪ π*C(ℚ)`. For every `i, R = red_{p_i}(x) ∉ red_{p_i}(L_i^good)` and `ι_{p_i}(R) = red_{p_i}(ι(x)) ∈ red_{p_i}(G)`, so `R ∈ M_i^bad` and `g = ι(x) ∈ G`
satisfies all conditions, a contradiction (exact-map-obstruction). Finite form:
kernel-level-exactness for `Γ = G, φ_i = red_{p_i}|_G, X_i = ι_{p_i}(M_i^bad); G/L₀` embeds in `∏ J̃(𝔽_{p_i})`. Box intersects cosets in `ℤⁿ` through `φ: ℤⁿ → G`; the formulations agree because `φ` is onto
`G`. `ι` need not be injective (multiplication by `I` kills torsion); only `ι(x) ∈ G` is used. §3.21
supplies `G` and the bound `I`.

**Checks.**

- Caraiani–Newton Proposition `7.4.5(2)`: for `X = X(s3`, ns5) and `C = X(ns3`, ns5) the sieve with `G = ⟨5G₂, Jac_{C₂}(ℚ)[2]⟩` with `G₂ = ⟨π₂*D⟩` (printed `⟨5G₁, …⟩), I = 10` and the primes listed in its proof determines the quadratic points not coming from `C(ℚ)`.
- Box: for `X₀(43)` the primes 5, 7, 11 suffice. This and the Caraiani–Newton case require their full finite local-image and lattice identities as application inputs.
- Shrinking some `M_i^bad` without an `ED.4` justification can lose a point of `X^(2)(ℚ)` outside `L ∪ π*C(ℚ)`.
- Caraiani–Newton's printed `⟨5G₁, Jac_{C₂}(ℚ)[2]⟩` in Proposition `7.4.4(3)` is a subscript misprint; the instance above uses the corrected `⟨5G₂, Jac_{C₂}(ℚ)[2]⟩`.

([Ana Caraiani and James Newton](https://arxiv.org/abs/2301.10509), §7.4, arXiv p.99; [Box (arXiv
v3)](https://arxiv.org/abs/1906.05206), §2.4, arXiv p.6.)

*Needs:* §5.11; §5.13; §5.9; §4.22; §4.21; §3.21; JacobianChallenge Layer `D` (relative Picard and Jacobian).

### 5.25 Reduction at bad primes for genus-two curves

Let `O` be a complete discrete valuation ring with uniformiser `π`, residue field k with char `k ≠ 2` and
fraction field `L, F ∈ O[X, Z]` a squarefree binary sextic, `C_F: Y² = F(X, Z)` in weighted projective
space, `J_F ⊆ ℙ¹⁵` the Cassels–Flynn model of its Jacobian, `J_F¹(L) = {P : P̄ = O}` its kernel of
reduction for this model, and `J_{F̄}^0` the component of the smooth locus of the special fibre
containing the origin. (a) (Theorem `5.11) J_{F̄}^0` is a commutative algebraic group whose law on
Mumford pairs (A, `B`) is Cantor composition and reduction, except when both A vanish at the same
singular point `x = 0`, where `φ(X², λXZ²) + φ(X², μXZ²) = φ(X², ((f₂ + λμ)/(λ + μ))XZ²)` and the sum is
zero if `λ + μ = 0`. (b) (Proposition `5.10) P ∈ J_F` lies in `J_F^0` iff `δ(κ(P)) ≠ 0`. (c) (Corollaries
`5.14–5.15`) If `C_F/O` is regular and F̄ is not a square, then `0 → J_F¹(L) → J_F(L) → J_{F̄}^0(k) → 0`
is exact, the map reducing the Mumford representation. For an odd prime p at which the given model
is regular with one-component special fibre this computes the local datum of
padic-quotient-sieve-datum with `U = J¹(ℚ_p)` as at good primes; at an odd prime where the model is
not regular or the special fibre has several components, `J(ℚ) ∩ J⁰(ℚ_p)` is computed by
subgroup-from-membership-test with the test `v_p(δ(κ(P))) = 4v_p(κ(P))`, and the image of `C(ℚ_p)`
modulo `J¹(ℚ_p)` by the dual Kummer test of genus-two-deep-information with `n = 1`. Remark `5.16` (the
regular model minus singular points is the Néron model) is stated without proof in the source and is
not used.

Work under the following conditions. `O` complete DVR, char `k ≠ 2; F` squarefree of degree six over `O`;
for (c) the model `C_F/O` is regular and F̄ is not a square.

For the proof, Lift F̄ to a squarefree F̃ over `O`; for `P` with P̄ `∈ J^0` and `Q` in the kernel of
reduction the biquadratic forms give `κ(P ± Q) = κ(P̄)`, so `P + Q` reduces to P̄; hence the kernel is a
subgroup acting on the points with smooth origin-component reduction, the quotient is `J_{F̄}^0(k)`,
and the group law is inherited; Cantor's algorithm commutes with reduction outside the special case,
which follows by a limit argument (Theorem `5.11`). Proposition `5.5` describes the singular points
through (A, `B) ∈ D_F`, Lemma `5.7` the components, and Proposition `5.10` identifies `J^0` by `δ(κ(P)) ≠ 0`.
Lemma `5.13` and Corollary `5.14`: under regularity, points outside the kernel reduce to smooth points
of the origin component; surjectivity of reduction is Hensel's lemma (Corollary `5.15`). The explicit
model facts (the 72 quadrics, the Kummer surface, `δ`, the biquadratic forms, `D_F`) are explicit
Cassels–Flynn model hypotheses; regular models are StableReduction Layer 5.

**Checks.**

- For singular `F̄` over `F_q`, q odd, Remark 5.12 and Figure 1 determine
  `#J⁰_{F̄}(F_q)` from factor degrees and multiplicities together with the indicated
  square classes of resultants or leading coefficients and, in genus-one rows, `#E(F_q)`.
  The factorization pattern alone does not determine the order.
- Over `F₅`, `h₁=x⁴+x²+4x+1` and `h₂=x⁴+2x²+2x+1` are irreducible. The smooth
  genus-one curves `y²=h_i` have respectively 8 and 10 points, including their two
  points at infinity. For `F̄=X²h_i`, the resultant `h_i(0)=1` is a square, so
  Figure 1 gives orders `4·8=32` and `4·10=40` for the same factorization pattern.
- `F = H²` a nonzero square: `J_F` has three components, the two not containing the origin are principal homogeneous spaces under `J_F^0`, and the exact sequence (c) is not claimed.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), Theorem 5.11, published p.291;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), Corollary 5.15, published p.294;
Remark 5.12 and Figure 1, published p.292.)

*Needs:* §5.13; §5.17; StableReduction Layer 5 (regular and minimal models); AlgebraicCurves Layer 10 (hyperelliptic and plane models).

### 5.26 Deep information for genus-two curves

Let `C` be a genus-two curve over `ℚ` with a Weierstrass model over `ℤ_p, p` odd, `ι: C → J` from a rational
degree-one class, `Jⁿ(ℚ_p)` the `pⁿℤ_p-points` of the formal group `(n ≥ 1)` and log: `J¹(ℚ_p) → (pℤ_p)²`
the formal logarithm. (a) For `Γ = J(ℚ)` and `K_n = Γ ∩ Jⁿ(ℚ_p), K_n` is the kernel of `K₁ → (pℤ_p/pⁿℤ_p)² ≅ (ℤ/p^{n−1})², P ↦ log P` mod pⁿ; so `Γ/K_n` is finite and described by `K₁` and
logarithms to precision pⁿ. (b) (Lemma `6.2`) If `P₀ ∈ C(ℚ_p), Q ∈ Jⁿ(ℚ_p)` and (`η₁ : η₂ : η₃ : η₄`) are
coordinates of the image of `P₀ + Q ∈ Pic¹` on the dual Kummer surface, normalised to minimal
valuation zero, then `v_p(η₁η₃ − η₂²) ≥ n` and `v_p(η₄) ≥ 2n`. Hence the set `Y_n` of classes `c ∈ Γ/K_n`
whose chosen representative g, translated to `Pic¹` by `g↦g+D₁` and to the dual Kummer surface,
satisfies `v_p(η₄) ≥ 2n` and `v_p(η₁η₃ − η₂²) ≥ n`, contains every class whose coset meets `ι(C(ℚ_p))`; it
is an exact superset for padic-quotient-sieve-datum with `U = Jⁿ(ℚ_p)`. The necessary dual-Kummer
congruences supply a superset only; actual membership in the curve embedded in `Pic¹` must be checked
separately. Translation `Pic⁰→Pic¹` is defined on the whole Jacobian, unlike an inverse of the curve
embedding.

Work under the following conditions. p odd; Weierstrass model of `C` over `ℤ_p; n ≥ 1; ι` from a
rational degree-one class.

For the proof, (a) For p odd the formal logarithm is an isomorphism `J¹(ℚ_p) → (pℤ_p)²` carrying Jⁿ
onto `(pⁿℤ_p)² (§4.2); K_n` is the preimage of `(pⁿℤ_p)²` in `K₁`. (b) After a `ℤ_p-coordinate` change
moving `P₀` to infinity, `P₀ = (1 : 0 : 0 : 0)` on the dual Kummer surface and `Q` has Kummer coordinates
(`αp^{2n} : βp^{2n} : γp^{2n}` : 1); the biquadratic forms A (Lemma `6.1`) give `η₁η₁′ ≡ 1` and `η₄ + η₄′ ≡ 0` modulo `p^{2n}, η₄η₄′ ≡ 0` modulo `p^{4n}` and `η₂, η₃ ≡ 0` modulo pⁿ, whence the valuations. If a class
c meets `ι(C(ℚ_p))` then every representative g has translation `D↦D+D₁(g) = P₀ + Q` with `P₀ ∈ C(ℚ_p)`
and `Q ∈ Jⁿ(ℚ_p)`, so the chosen representative passes the test and `c ∈ Y_n`; local-overapproximations
and curve-sieve-soundness apply. The incremental computation over `n = 2, 3, …` and the linear forms
`ℓ_m` reduce cost only; a verifier re-evaluates the test on the recorded representatives. The Kummer
and dual Kummer surfaces and the forms A, `B` are explicit Cassels–Flynn model hypotheses.

**Checks.**

- Bruin–Stoll §7: information modulo `p^m` is collected in the order `2, 3, 5, 7, 2², 11, 13, 17, 19, 23, 3², …`; §8: deep information for all pⁿ `< 520` shortens the hardest rank-four computation.
- The test is one-sided: a class passing it need not meet the curve, and it is used only as a superset.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), Lemma 6.2, published p.297;
[Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §6, published p.296.)

*Needs:* §5.13; §5.1; §4.2.

### 5.27 Mordell–Weil sieve datum

A Mordell–Weil sieve datum for a curve `C/ℚ` consists of: (1) jacobian reduction data — the
curve, a rational degree-one divisor `D₁`, the places `S` with their local groups `G_p`, the values of the
local maps on generators, and finite local sets exact to contain the true local images (good
data, or bad and deep data from padic-quotient-sieve-datum); (2) the Mordell–Weil input — generators
of a subgroup `H ≤ J(ℚ)` with `ED.3` data of rank and torsion and of index prime to every prime
dividing the modulus `N` (finite-index-subgroup-datum, saturation-datum), or a full
Mordell–Weil basis datum; the rank is labelled conditional when its upper bound rests on an
analytic hypothesis; (3) the modulus `N`, its factorisation and the descending chain `L_0 ⊇ … ⊇ L_t`
with lifts `σ_j` and test sets `T_j`; (4) the exhaustive candidate set, `siftChain` at level t; (5) the
known points `W` and the mode of conclusion: emptiness, Chabauty (a prime `p₀` with an annihilating
differential and exact residue classes Ū as in chabauty-sieve-combination, `L_t ⊆` ker `ρ_{p₀}`, and
every candidate the class of a known point), or height (a bound `H`, separation data and short-vector
data). The datum is checked when every `σ_j` with `j<t` is a section on the sieve set at
level `j, T_j ⊆ S`, and every place outside `T_j` has an unchanged image subgroup. A record whose
candidate set is nonempty and not covered by known points certifies nothing about `C(ℚ)`: it is an
unsettled case, not an empty solution set.

Work under the following conditions. The datum records the reduction data, places, chain,
lifts, test sets and known points over the global group `Γ (J(ℚ)`, or `H` transported by
coprime-index-transfer); the `ED.3` and `ED.4` data and the height data are inputs of the
soundness theorem.

The interface includes these statements.

- The exhaustive candidate set: `siftChain` at the final level.
- Candidates equals `siftChain` applied to the recorded data at level length.
- The verifier's checks: sections on the sieve sets, `T_j ⊆ S`, unchanged image subgroups at omitted places.
- For a checked datum, candidates `= A_S(L_t)` of the reduction data.
- For a checked datum the class of `ι(P)` lies in candidates for every rational point `P`.
- The recorded chain of subgroups `L_j`.

For the proof, Bundle the data; candidates is `siftChain` at the final level. Checked is the
conjunction of the three finite checks of sieve-chain-correct. Presentations of the finite groups
and maps used to evaluate the checks are supplied as exact finite presentations.

**Checks.**

- No places, length `0, L_0 = Γ = ℤ/2`: candidates is the single class.
- One place, identity map on `ℤ/4`, local image `{1}, L_0 = 0`, length 0: candidates `= {1}`.
- `Γ = ℤ/2`, two places with local images `{0}` and `{1}`, no points, `L_0 = Γ`, length 0: candidates is nonempty although there is no point; a nonempty candidate set is an unsettled case, not a point.
- Lifting class1 mod2 to mod4 with no local tests keeps `{1,3}`.
- Keeping only `{1}` fails; the other lift3 is required.
- A false local test at the unique class gives an empty next set.
- The datum carries the index/saturation assumptions, the primes, the local images and the exhaustive candidate set.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §7, published p.299; [Bruin–Stoll
(2010)](https://doi.org/10.1112/S1461157009000187), §3.3, published p.280.)

*Needs:* §5.11; §5.15; §5.16; §5.13; §5.14; §3.21; §3.18; §3.22; §3.7.

### 5.28 Soundness of a Mordell–Weil sieve datum

Let c be a checked sieve datum for `C/ℚ` whose global group is `J(ℚ)`, or a subgroup `H` of index
prime to `N` transported by coprime-index-transfer. (a) If its candidate set is empty, `C(ℚ) = ∅`. (b)
Chabauty mode: if `p₀` carries an annihilating differential `(§4.9)` with every rational point reducing
into its exact residue classes Ū (chabauty-sieve-combination), `L_t ⊆` ker `ρ_{p₀}`, and every
candidate is the class of a known point, then `C(ℚ) = W`. (c) Height mode: every `P ∈ C(ℚ)` with `h(P) ≤ H` is among the candidates of height-bounded-points, at most one per candidate class when `L_t ⊆ NΓ`.
Each conclusion depends on the recorded assumptions — the `ED.3` index and saturation data
(and the rank, conditional when its upper bound rests on an analytic hypothesis), the primes and
local images, and the chain. A datum whose final candidate set is nonempty and not covered
proves nothing about `C(ℚ)`.

Work under the following conditions. c checked; the `ED.3` data for the global group hold; for
(b) the `ED.4` data at `p₀`; for (c) the height data of height-bounded-points.

For the proof, sieve-chain-correct identifies the candidates with `A_S(L_t)`. (a)
curve-sieve-soundness, through coprime-index-transfer when the global group is `H`. (b)
chabauty-sieve-combination (iv). (c) height-bounded-points. Conditionality: the rank enters only
through the datum of `H`; §3.7 distinguishes algebraic from analytic upper bounds, and the
conclusion carries the label.

**Checks.**

- Bruin–Stoll §3.3: `A(N_kΓ) = ∅` for some k proves `C(ℚ) = ∅`.
- Bruin–Stoll §4.4: genus-two curves of rank one with a known rational base point, with the stated emptiness or complete residue-class hypotheses.
- The `ℤ/2` non-example of sieve-datum: a nonempty candidate set with no points gives no conclusion.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §1, published p.273.)

*Needs:* §5.27; §5.16; §5.12; §5.14; §5.23; §5.19; §3.7.

### 5.29 Non-existence of points on the undecided small genus-two curves

Among the genus-two curves `y² = f(x)` with f of degree five or six and coefficients in `{−3, …, 3}`,
the 1492 isomorphism classes left undecided after a search for rational points, a check for local
points and a 2-cover descent have no rational point. For Jacobians of rank at most two the proof
used good information only, for ranks three and four also bad and deep information; for some curves
the rank of `J(ℚ)` is used under the Birch–Swinnerton-Dyer conjecture, and those cases are
conditional. Each of the 1447 curves that needed a sieve computation (§8, `p.301`) is an instance of
sieve-datum-sound (a) with an emptiness datum; the other 45 had rank zero or were ruled
out directly by information from the Birch–Swinnerton-Dyer conjecture, and the latter are
conditional.

Work under the following conditions. The curves, Mordell–Weil generators, ranks and local data of
Bruin–Stoll's experiment; the BSD-conditional cases are labelled. The exact 1492-case list, its
partition into1447 sieve cases and45 other cases, complete MW/reduction presentations, local class
tables and per-case BSD conditions are supplied explicitly with geometric compatibility hypotheses.
The finite sieve equality is assumed as exact input; its comparison theorem proves emptiness; emptiness of the rational point sets
is not a supplied assertion. The list, point counts and Mordell–Weil tables are explicit hypotheses.

For the proof, For each curve: `ED.3` data for generators and rank (conditional where BSD is
used), local data at good, bad and deep places, a chain and an empty candidate set, verified by
sieve-datum-sound. The application requires the complete per-curve identities for all 1492 classes, including all 1447 sieve runs and the remaining 45 cases with their individual conditional labels.

The finite 1492-case input list and all 1447 sieve identities must be supplied and independently checked, together with the remaining45 cases and their individual conditional labels. The application is conditional on checking this complete finite input; no conclusion about all 1492 classes follows from a sample identities.

**Checks.**

- Bruin–Stoll §8: of the 1447 curves that needed a sieve, 521 have rank one (514 decided while collecting local information), 772 rank two, 152 rank three and two rank four.
- The statement is recorded as conditional on BSD for the curves whose rank was not proved.

([Bruin–Stoll (2010)](https://doi.org/10.1112/S1461157009000187), §4.1, published p.280.)

*Needs:* §5.28; §5.25; §5.26; §3.7.

### Examples

For `Γ=Z/4`, identity local map and `X={1}`, the fine sieve retains `{1}`; lifting the odd class mod2
without a new local test must retain both `{1,3}`. With `Γ=Z/2` and incompatible sets `{0},{1}`, the sieve
at `L=Γ` is nonempty, while the kernel-level sieve is empty.

### Dependencies

Layers 1,3,4; the Picard/reduction contracts of SchemeAndStackFoundations §§3.3, `3.8` and
NeronModelsAndSemistableAbelianVarieties §3.8; HeightsRationalPointsAndObstructions Layers 0–1;
DiophantineApproximationAndTranscendence §§4.1–4.5 for integral-point bounds. Finite group and Kummer
data are explicit inputs.

## Layer 6: Quadratic Chabauty and complete solution lists

Keep the geometric height formulas separate from the finite precision and root identities. Each
concrete modular or Diophantine example states the data it consumes and the exact completeness
statement to be derived.

### 6.1 Exact solution sets with completeness labels

Let `α` be a type of candidate solutions (integer tuples, S-unit triples, points with rational
coordinates), `P : α →` Prop the Diophantine condition, and `H` : Prop the conjunction of the unresolved
or conditional inputs of the method (`H =` True for an unconditional datum). A exact
solution set FiniteSolutionSet `H P` consists of a finite set `S` : Finset `α` together with (sound)
every element of `S` satisfies `P`, proved unconditionally by exact evaluation, and (complete) `H` implies
that every x with `P x` lies in `S`. The datum is labelled unconditional when `H` is True and
conditional on `H` otherwise; a conditional datum keeps `H` as an explicit parameter, so that
discharging or weakening `H` is a theorem about the datum and never an edit of it. The exact inputs are `S` and the method-specific data from which soundness and completeness are proved. This mathematical structure records those conclusions; each method has a separate finite arithmetic conditions and a theorem deriving them from its checked identities. A list
of verified solutions without completeness, a CAS output, or a p-adic candidate list that has not
been compared with global points is not a datum.

Work under the following conditions. `α` is a type, `P : α →` Prop and `H` : Prop. Elements of `S` are exact
objects (integers, rationals, points with rational coordinates); no floating-point value is an
element of `S`. Completeness may depend on `H` only; soundness never depends on `H`.

The interface includes these statements.

- If `H` holds then `x ∈ c.solutions ↔ P x`.
- If `H` holds then (`c.solutions` : Set `α) = {x | P x}`; in particular `{x | P x}` is finite.
- Two data `c₁` (under `H₁`) and `c₂` (under `H₂`) for the same `P` have `c₁.solutions = c₂.solutions` whenever `H₁ ∧ H₂` holds.
- From `S`, a soundness proof and an unconditional completeness proof, the datum under `H =` True.
- A datum under `H` is a datum under any H' with H' `→ H`, with the same solutions.
- From a datum under `H` and a proof of `H`, the unconditional datum with the same solutions.
- Along an equivalence e : `α ≃ β` with `P = Q` ∘ e, the image datum for `Q` has solutions `S.map e`; map along the identity is the identity and maps compose.

For the proof, define the structure with three fields: a finite set of solutions, soundness (every
listed element satisfies `P`) and completeness (under `H` every x with `P x` is listed). The completeness
label is read off from `H: H =` True is unconditional; any other `H` is displayed in the theorem that
produces the datum (for example the Generalised Riemann Hypothesis in the descent route of
BDMTV 2019 Remark `6.3`). Method-specific identities specify their input data, arithmetic conventions and finite verification separately. Their soundness theorems construct this structure on the existing exact number or point type.

**Checks.**

- For `α = ℤ, P x := x ^ 2 = 4` and `H =` True, every datum has solutions `= {−2, 2}`.
- For the constantly false predicate `P` and any `H`, a datum under `H` with `H` true has solutions `= ∅`.
- For `P x := x ^ 2 = 4` over `ℤ` there is no unconditional datum with solutions `= {2}`: soundness holds but completeness fails at −2.
- If `H` holds then `(Set.Finite.toFinset h) = c.solutions` for the finiteness proof h of `{x | P x}` given by `coe_eq_setOf` (agreement with Mathlib's `Set.Finite.toFinset`).
- For `H =` False every finite set of verified solutions is a datum, so a conditional datum asserts nothing until `H` is discharged.
- For `x² = 4` over `ℤ` the unconditional datum has solutions `{−2, 2}`.
- The Thue equation `X⁴ − 12X²Y² − 8XY³ + 4Y⁴ = 1` has the unconditional datum with the eight solutions of §6.36.

([BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Algorithm 3.12, p.14 (arXiv v4); [de
Weger (1989)](https://ir.cwi.nl/pub/13190), Theorem 6.3, p.123; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Remark 6.3,
p.927.)

*Needs:* Mathlib Finset; Mathlib `Set.Finite.toFinset`.

### 6.2 Comparison of p-adic candidates with global solutions

Let `X` be a set (the p-adic points `X(Q_p)` of a curve, or `Z_p^k` for an equation in k unknowns), `R ⊆ X`
the set of global solutions (`X(Q)`, or the integral solutions), and `Z ⊆ X` a set with `R ⊆ Z` (the
common zero set of the exact p-adic functions: quadratic Chabauty determinants, annihilating
Coleman integrals, or local residue conditions). Let `B_1, …, B_m ⊆ X` be finitely many sets (balls of
radius `p^(−n)` around candidates computed to absolute precision n through `ED.0` p-adic embeddings)
with `(i) Z ⊆ B_1 ∪ … ∪ B_m` and `(ii) Z ∩ B_i` has at most one element for each i (exact
simple-root isolation). Let `L ⊆ R` be a finite set of verified global solutions. Call `B_i` matched if
it contains an element of `L`, and excluded if `R ∩ B_i = ∅` is exact (by a Mordell–Weil sieve, a
second independent function whose zeros avoid `B_i`, or a local obstruction). If every `B_i` is matched
or excluded then `R = L`, and `L` is an exact solution set. Without such a decision for some ball the
conclusion is only `L ⊆ R ⊆ L ∪ ⋃_{B_i undecided} (Z ∩ B_i)`, and the conditions are insufficient.

Work under the following conditions. `R ⊆ Z ⊆ B_1 ∪ … ∪ B_m`. Each `Z ∩ B_i` is a subsingleton. `L` is
finite and `L ⊆ R` (each element verified exactly). Every `B_i` is matched `(L ∩ B_i ≠ ∅)` or excluded `(R ∩ B_i = ∅)`.

For the proof, Let `x ∈ R`. Then `x ∈ Z`, so `x ∈ B_i` for some i by (i). If `B_i` is excluded, `x ∈ R ∩ B_i = ∅` is impossible. If `B_i` is matched by `P ∈ L`, then `P ∈ R ⊆ Z`, so x and `P` both lie in `Z ∩ B_i`, a
subsingleton by (ii); hence `x = P ∈ L`. Together with `L ⊆ R` this gives `R = L`; package `L` with these
proofs as an unconditional exact-solution-set. Uniqueness (ii) is indispensable: agreement of a
p-adic candidate with a known point to precision n does not prove equality, because numerical
agreement never proves an algebraic identity `(§0.7)`.

**Checks.**

- `X_s(13)` at `p = 17`: twenty residue discs; on each, the balls of xs13-first-chart-points, xs13-second-chart-points and xs13-p0-disc are matched by P0, …, P6 and all other balls are excluded by the second Tate class; the conclusion is xs13-rational-points.
- Necessity of (ii): `Z = {0, p^n} ⊆ Z_p`, one ball `B = p^n Z_p` and `L = {0}; B` is matched, but `Z ∩ B` has two elements and the theorem does not apply.
- At depth one, with `Z` the common zeros of annihilating Coleman integrals, this is the comparison step of §4.18; with exclusion by the Mordell–Weil sieve it is the combination of §5.23.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6,
p.926; [BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), §3.5, p.15 (arXiv v4); [BDMTV
(arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), §3.4, p.12 (arXiv v4).)

*Needs:* §6.1; §0.6; §4.18; §5.23.

The geometric zero counts and exclusions supply the coverage, uniqueness and
matching hypotheses of this comparison.

### 6.3 Residue-disc datum for quadratic Chabauty functions

Fix a prime p and a residue disc of `X(Q_p)` with a parameter t identifying it with `p Z_p (t = p s, s ∈ Z_p)`, supplied by the geometric chart of §4.1. Scalar coordinates and their precision are
represented by §§0.6–0.9; a scalar embedding datum does not construct the chart. A quadratic Chabauty disc datum
QCDiscData `p ι` consists of: finitely many functions `f_i : Z_p → Q_p, i ∈ ι` (the determinants
`det T` of the quadratic Chabauty pairs, written in s as convergent power series whose first
coefficients are known modulo `p^N` and whose tail obeys height-series-valuation-bound); a finite set
`C ⊆ Z_p` of centres; a precision `n ∈` ℕ; and proofs of (covers) every common zero s of the `f_i`
satisfies `‖s − c‖ ≤ p^(−n)` for some `c ∈ C`, and (unique) for each `c ∈ C` the ball `‖s − c‖ ≤ p^(−n)`
contains at most one common zero. The covering and uniqueness conditions follow from §6.16
applied to one `f_i`, the other functions serving to discard centres at which they do not vanish.

Work under the following conditions. p is prime; `ι` is a finite index type; the `f_i` are functions on
`Z_p` given by convergent power series in the disc parameter. The centres are elements of `Z_p` known to
precision n (rational or integral representatives).

The interface includes these statements.

- Every common zero s of the `f_i` has a centre `c ∈ C` with `‖s − c‖ ≤ p^(−n)`.
- Two common zeros within `p^(−n)` of the same centre are equal.
- The set of common zeros is finite and has at most #C elements.
- If `C = ∅` the `f_i` have no common zero on the disc.
- Adding a further function to the family keeps covers and unique, with the same centres; removing a centre c is allowed when some `f_i` is exact nonzero on the ball around c.

For the proof, define the structure with fields fn, centres, prec, covers, unique; covers and unique
are genuine conditions, proved for each disc by the root perturbation theorem of §6.16. Common zeros are `{s |`
`∀ i, f_i s = 0}`; covers and unique imply that this set is finite with at most #C elements.


Prove the finite ball-cover and local-uniqueness conditions for actual restricted determinant
series using §§6.15–6.16. The hypotheses are coefficient congruences with strict tail bounds,
convergence, geometric chart identification and the local root multiplicity bounds. Their
conclusion is covers and unique for the actual common zero set. The covering data do not
contain an assertion that the global rational point set is already complete.

**Checks.**

- For `p = 17, ι =` Unit, `f(s) = s − 1, C = {1}, n = 5`, the structure exists and the common zero set is `{1}`.
- For `f ≡ 1` the empty set of centres gives a datum, and there are no common zeros.
- For `p = 17` and `f(s) = s(s − 17^6)` no datum has `C = {0}` and `n = 5`, since the ball around 0 contains the two zeros 0 and `17^6`.
- If `ι =` Unit and f is the evaluation of a nonzero polynomial `F ∈ Z_p[X]`, the number of common zeros is at most `Multiset.card F.roots ≤ natDegree F` (Mathlib `Polynomial.card_roots'`).
- For `p = 17`, one function `f(s) = s − 1`, centres `{1}` and any precision: a valid datum whose only common zero is `s = 1`.
- A ball containing two zeros 0 and `p^6` at precision 5 violates (unique).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4.1, p.933; [BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Lemma 4.7, p.25 (arXiv
v4).)

*Needs:* Mathlib PadicInt; Mathlib Padic; §0.6.

### 6.4 Soundness of a quadratic Chabauty datum

Let X/Q be a smooth projective geometrically connected curve of genus `g ≥ 2` with `b ∈ X(Q)`, Jacobian
`J` of `rank r = g` with log : `J(Q) ⊗ Q_p ≅ H⁰(X_{Q_p}, Ω¹)^*, ρ(J) ≥ 2`, and p a prime of good
reduction. Let `Z_1, …, Z_k` be nice classes and `(θ_j, Υ_j)` the quadratic Chabauty pairs of AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 with
endomorphism `E_j`, constant `c_j` and pairing `B_j` (BDMTV Lemma `3.7`, with `Υ_j = {0}` under potentially
good reduction everywhere, Corollary `3.8`). Suppose given: (a) a finite set `L ⊆ X(Q)` of verified
rational points containing b and points `P_1, …, P_m` such that `AJ_b(P_i) ⊗ (E_j(AJ_b(P_i)) + c_j) span E` (or `E_K = H⁰(Ω¹)^* ⊗_{K_p} H⁰(Ω¹)^*` when the heights are K-equivariant); (b) for every x̄ `∈ X(F_p)` and every choice `(α_1, …, α_k) ∈ Υ_1 × ⋯ × Υ_k`, a qc-disc-datum on ]x̄[ for the family
`(det T_{j,α_j})_{j ≤ k}` of the determinant criterion, whose power-series coefficients are computed
by local-height-at-p and Coleman integration to the precision exact by
height-series-valuation-bound; (c) for every centre of every disc datum, a matching with an
element of `L` or an exclusion. Then `X(Q) = L`, an exact solution set conditional on all the stated
geometric, rank, Picard and arithmetic-data hypotheses (which are themselves exact inputs).
If (b) or (c) fails for some disc, only `L ⊆ X(Q)` is asserted.

Work under the following conditions. `r = g` and the p-adic closure of `J(Q)` has finite index in `J(Q_p)`
(exact rank: xs13-rank-three in the example). `ρ(J) ≥ 2` and `Z_1, …, Z_k` are nice classes (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8).
p is a prime of good reduction and the residue discs are enumerated from `X(F_p)` exactly. The local
heights away from p are known: `Υ_j={−Σ_{v∈T_0}h_v(A_{Z_j}(b,x_v))}`
(or is `{0}` under potentially good reduction everywhere), for `θ_j=h_p` and `B_j` the global height.
The positive correction set for `ρ_j=h−h_p` is `−Υ_j`.

For the proof, By AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 (BDMTV Lemma `3.7`, Corollary `3.8`, with the corrected use of `κ(J(Q))⊗Q_p` that
only `κ(J(Q)) ⊗ Q_p` is used) every `x ∈ X(Q)` satisfies `θ_j(x) − B_j(AJ_b(x), E_j(AJ_b(x)) + c_j) ∈ Υ_j`. By the determinant criterion (BDMTV Lemma `1.5`, AnabelianGeometryAndNonabelianChabauty §§6.1–6.8) `det T_{j,α}(x) = 0` for `x ∈ X(Q_p)_α`; the
matrices `T` use the points of (a) to eliminate the unknown pairing `B_j`. On each residue disc the
entries of `T` are power series: `θ_j` from local-height-at-p, `AJ_b` from Coleman integrals
(ColemanIntegration L1 via §4.2); their coefficients are exact by height-series-valuation-bound,
and the root perturbation theorem of §6.16 yields the disc data (b). `X(F_p)` is finite, so finitely
many balls cover all common zeros; apply padic-candidate-comparison with the matchings and
exclusions (c).

The rational-point carrier is `Hom_Q(Spec Q,X)` and its injective image in `Hom_Qp(Spec Q_p,X_Qp)`; residue discs are fibres of reduction from the chosen smooth proper `Z_p-model`. Require chart identifications with `Z_p`, actual AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 height/cycle/logarithm semantics for every determinant series, complete choices of away-from-p height values, finite coefficient/tail/tree data whose sound yields covers/uniqueness, and genuine geometric matching/sieve exclusions. If rank or supplier assertions remain conditional, the conclusion retains their conjunction as its label. `QCRun.rational_eq_of_matched` is only the final set-theoretic implication.

**Checks.**

- If the away-place sum set is `{1}`, the correction set for `θ−B` is `{−1}`;
  it is not `{1}`. If every away-place height vanishes, both sign conventions give `{0}`.
- `X_s(13), p = 17, Z_1, Z_2` from `T_7` and `T_11: X(Q) = {P0, …, P6}` (xs13-rational-points).
- Removing the disc ]`(1:1:1)`[ from (b) leaves the computation open: only `{P0, …, P6} ⊆ X(Q)` follows.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§1.5, p.893; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma 1.5,
p.891.)

*Needs:* AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; §6.3; §6.2; §6.13; §6.15; §6.16; ColemanIntegration §L1.19; §4.2.

### 6.5 The explicit set-up: affine chart, basis of differentials and Tate class

An explicit quadratic Chabauty set-up over `Q` consists of: a smooth projective geometrically
connected curve X/Q of genus `g ≥ 2`; an affine open `Y ⊂ X` over `Q`; a base point `b ∈ Y(Q)` integral at
p; the boundary `D := X ∖ Y` with `d :=` #D(Q̄) points, all defined over a number field `L`; differentials
`ω_0, …, ω_{2g+d−2} ∈ H⁰(Y, Ω¹)` such that `ω_0, …, ω_{2g−1}` are of the second kind on `X` and their
classes form a symplectic basis of `H¹_dR(X/Q) (ω_i ∪ ω_{g+i} = 1 = −ω_{g+i} ∪ ω_i` for `i < g`, all
other cup products `0), ω_0, …, ω_{g−1}` are holomorphic on `X` and form a basis of `H⁰(X, Ω¹)` (the
hypothesis BDMTV §4.5 uses), and `ω_{2g}, …, ω_{2g+d−2}` are of the third kind (only simple poles) and
complete a basis of `H¹_dR(Y/Q); V_dR(Y) := H¹_dR(Y/Q)^*` with dual basis `T_0, …, T_{2g+d−2}`; and an
admissible Tate class `Z = Σ Z_ij ω_i ⊗ ω_j, i, j < 2g`, given by its coefficient matrix `(Z_ij) ∈ M_{2g}(Q)`, nonzero, with (a) `Z ∈ (H¹_dR ⊗ H¹_dR)^{φ = p}` over `Q_p, (b) Z ∈ Fil¹`, which in this basis
means `Z_ij = 0` for `i, j ≥ g, (c) Σ Z_ij (ω_i ∪ ω_j) = 0`, which in this basis means `Σ_{i<g} Z_{i,g+i} = 0` once (d) holds, and (d) Zᵀ `=` −Z. Conditions (a)–(d) are AnabelianGeometryAndNonabelianChabauty §§6.1–6.8's; the class of a nice
correspondence satisfies them, and the converse of BDMTV Lemma `4.7` is not used.

Work under the following conditions. `X` smooth projective geometrically connected of genus `g ≥ 2` over
`Q`; p a prime of good reduction; `b ∈ Y(Q)` integral at p. `ω_0, …, ω_{g−1}` holomorphic; `ω_0, …, ω_{2g−1}` of the second kind with symplectic classes; `ω_{2g}, …, ω_{2g+d−2}` of the third kind. `Z`
nonzero with (a)–(d). `D` is nonempty, and `L` may be enlarged to a finite Galois splitting field so the
local-expansion descent is stated over all conjugate boundary points.

The interface includes these statements.

- A combination `Σ_k c_k ω_{2g+k}` of the third-kind differentials with `Res_x = 0` at every `x ∈ D` is zero; equivalently the residue matrix `(Res_x ω_{2g+k})` has rank d − 1 and columns summing to zero.
- The cup product matrix of `ω_0, …, ω_{2g−1}` is `fromBlocks 0 1 (−1) 0` in the block decomposition (holomorphic, non-holomorphic).
- `Zᵀ =` −Z.
- `Z_ij = 0` for i, j in the non-holomorphic block.
- `Σ_{i<g} Z_{i,g+i} = 0`, equivalently `trace(Z · Cᵀ) = 0` for the cup product matrix `C`.
- Matrices satisfying (b)–(d) form a Q-subspace of `M_{2g}(Q)`; admissible classes are its nonzero elements meeting (a).
- The actual function field `Q(X)=Frac Γ(Y,O_Y)`, with its induced boundary expansions into `L((t_x))`; its expansions and maps are those of ExplicitSetup.
- The actual tensor class is identified through crystalline/de Rham comparison and satisfies `FᵀZF=pZ` at the chosen good prime; linear matrix conditions alone do not imply this.

For the proof, Over `Q`, take a smooth projective geometrically connected curve `X` of genus `g≥2`, a
nonempty reduced boundary divisor `D` of degree `d=#D(Qbar)` and affine open `Y=X−D, b∈Y(Q)`, a good prime
p and a smooth `Z_p-model` with integral b. Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Choose a finite Galois
splitting field `L` for `D` and uniformizers `t_x` identifying completed local rings at `x∈D(L)` with
`L[[t_x]]` and their fraction fields with `L((t_x))`; expansions must be the maps induced by `K⊗L`, not
arbitrary Laurent-family maps. Choose `ω_0,…,ω_{2g+d−2}` in `Ω¹(Y/Q)` whose classes form a basis of
`H¹_dR(Y)`, the first2g of the second kind, the firstg a basis of `H⁰(X,Ω¹)`, with cup matrix
`C=[[0,I],[-I,0]]`, and third-kind complement with residue map, after tensoring with L, an L-linear isomorphism onto
`{(r_x)∈L^{D(L)}:Σ_x r_x=0}`. Over Q its image is the Galois-invariant part
of that hyperplane. Put
`V_dR=H¹_dR(X)^*` with dual basis `T_i`. Take nonzero rational tensor `Z` with antisymmetry, lower-right
`g×g` block0 and zero cup contraction; under crystalline/de Rham comparison require Frobenius weight
p, in coordinates `FᵀZF=pZ`. For height applications additionally supply an actual nice correspondence
whose cycle class is `Z`; do not infer a rational algebraic cycle from these linear/Frobenius
conditions. The geometric signature uses this curve, its function field and these induced
expansions. The residue map on `span_Q(ω_{2g}, …, ω_{2g+d−2})⊗_Q L` is
injective with image the L-linear sum-zero hyperplane, because the kernel of
`H¹_dR(Y)⊗_Q L → L^{D(L)}` is `H¹_dR(X)⊗_Q L` (BDMTV proof of Lemma `4.10`);
this is the property explicit-connection uses. Condition (b) reads `Z_ij = 0` for `i, j ≥ g` only
because `ω_0, …, ω_{g−1} span Fil¹`; condition (c) reads `Σ_{i<g} Z_{i,g+i} = 0` only for the symplectic
convention.

Over `Q`, take a smooth projective geometrically connected curve `X` of genus `g≥2`, a nonempty reduced boundary divisor `D` of degree `d=#D(Qbar)` and affine open `Y=X−D, b∈Y(Q)`, a good prime p and a smooth `Z_p-model` with integral b. Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. Outputs are these actual identified geometric data, residue injectivity for the third-kind span and the displayed actual cup pairing; the separate ExplicitSetupLinearData only stores matrices.

**Checks.**

- The `6×6` integer matrix Z1 of BDMTV `p.931` satisfies (b), (c), (d): it is antisymmetric, its lower-right `3×3` block is zero and `Z1(0,3) + Z1(1,4) + Z1(2,5) = 10 + 1 − 11 = 0`.
- The zero matrix satisfies the linear conditions (b)–(d) but is excluded by nonzeroness. This test concerns the matrix carrier, not a construction of the geometric mixed extension.
- The matrix `fromBlocks 0 1 1 0` (symmetric, nonzero) fails (d).
- For `g = 1` the cup product matrix is the `2×2` matrix with rows `(0, 1)` and `(−1, 0)`, the standard symplectic form, `Matrix.fromBlocks 0 1 (−1) 0`.
- A nonzero matrix satisfying `only(b)–(d)`, together with `F=I` and `p=17`, fails `FᵀZF=17Z` and cannot supply an ExplicitSetup Tate class. The Frobenius compatibility must be checked on the actual cohomology.
- For `X:y²=2x⁶+1`, the two infinity points split over `L=Q(√2)`. The
  third-kind complement has Q-dimension one; the full sum-zero hyperplane in `L²`
  has Q-dimension two. Its invariant tuples are `(a√2,−a√2)`, `a∈Q`, and the
  residue map becomes an isomorphism onto the whole hyperplane only after tensoring with L.
- `X_s(13), Y = {Z ≠ 0}, b = P2 = (0,0), g = 3: ω = (1, x, y, …)dx/Q_y` and Z1, Z2 of xs13-tate-classes form a set-up.
- A symmetric nonzero matrix is never admissible, by (d).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§4.1, pp.909–910; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §4.1, p.909;
[BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §4.4,
p.913.)

*Needs:* AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7; Mathlib Matrix; Mathlib `Matrix.fromBlocks`; Mathlib `Matrix.transpose`.

### 6.6 The connection of `A_Z` on the affine chart and the uniqueness of `η`

In an explicit set-up, there is a trivialisation `s_0(b, ·) : (Q ⊕ V_dR ⊕ Q(1)) ⊗ O_Y ≅ A_Z(b)|_Y (26)` in which `∇ = d + Λ` with `Λ = −[[0, 0, 0], [ω, 0, 0], [η, ωᵀZ, 0]] (27)`, in the ordered basis `1, T_0, …, T_{2g−1}, S`, where `ω = (ω_0, …, ω_{2g−1})ᵀ` and `η` is a differential in the span of `ω_{2g}, …, ω_{2g+d−2}`. Moreover `η` is the unique differential in that span for which `d + Λ` extends to a
connection on `X` without singularities (Lemma `4.10`); equivalently, with the gauge data of
gauge-transformation, `Res_x(Ω_xᵀ Z dΩ_x − η) = 0` for every `x ∈ D (30)`. In terms of residues: `η = Σ_k c_k ω_{2g+k}` where `(c_k)` is the unique solution of `Σ_k c_k Res_x(ω_{2g+k}) = Res_x(Ω_xᵀ Z dΩ_x)` for
all `x ∈ D`.

Work under the following conditions. An explicit set-up with admissible Tate class `Z`. `A_Z(b)` is the
filtered connection obtained by pushing out `A_2^dR` along `Z` (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8).

For the proof, Kim's universal property (AnabelianGeometryAndNonabelianChabauty §§2.0–2.7, BDMTV Theorem `4.2`, with the pointed formulation for
objects with v in the fibre at b) gives `A_2^dR(Y) = ⊕_{i≤2} V_dR(Y)^{⊗i} ⊗ O_Y` with `∇(v ⊗ 1) = −Σ (T_i ⊗ v) ⊗ ω_i` (21); Corollary `4.4` identifies `A_2^dR(X)|_Y` with its maximal quotient extending
holomorphically to `X`. Pushing out along `Z` (which factors through `V_dR^{⊗2}/Im ∪^*` by (c)) gives a
connection of the form (27) with `η = Σ_{i ≤ 2g+d−2} α_i ω_i`; the change `T_i ↦ T_i + α_i S` for `i < 2g`
removes the components of `η` along `ω_0, …, ω_{2g−1}` (Remarks `4.8–4.9`). At `x ∈ D` the gauge
transformation `C_x` satisfies `dg_x = Ω_xᵀ Z dΩ_x − η (29)`; a formal primitive `g_x` exists in `L((t_x))`
if and only if the residue (30) vanishes, which is the condition for the connection to extend over
x. By explicit-setup's residue injectivity the residue conditions at the d points determine `η`
uniquely in the span of the third-kind differentials.

Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. Import AnabelianGeometryAndNonabelianChabauty §§2.0–2.7 universal pointed `A²_dR` and AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 its pushout `A_Z` along `V_dR⊗²→Q(1)`, factoring through `coker(cup*)`. Construct `s0:(Q⊕V_dR⊕Q(1))⊗O_Y≅A_Z|Y` and the unique `η` in `span(ω_{2g},…,ω_{2g+d−2})` such that `∇=d−[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]` extends nonsingularly over `X`. For `dΩ_x=−ω`, its actual residue conditions are `Res_x(Ω_xᵀZ dΩ_x−η)=0`. Existence uses the universal quotient extending over `X` and total-residue/cup compatibility; the sum-zero matrix solver alone proves only uniqueness/linear solvability. The result includes the geometric extension, trivialization and `η`, with gauges `C_x` and `g_x` in `L((t_x)), dg_x=Ω_xᵀZ dΩ_x−η`.

**Checks.**

- For `X_s(13)` on `Y = {Z ≠ 0}: η_{Z1} = −(44x² + (148/3)`xy `+ 8y²)dx/Q_y` and `η_{Z2} = (−40x² + 148xy + 36y²)dx/Q_y` (xs13-first-chart-hodge-data).
- The printed step (i) of BDMTV §4.5 uses `dΩ_xᵀZΩ_x − η`, which determines a different `η` unless the residues of `Ω_xᵀZdΩ_x` vanish; the condition here is (30).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
(26)–(27), Remarks 4.8–4.9, pp.914–915; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma 4.10
and (30), pp.915–916.)

*Needs:* §6.5; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7; AnabelianGeometryAndNonabelianChabauty §§6.1–6.8.

### 6.7 Gauge transformations at the points at infinity

In an explicit set-up, for `x ∈ D` with local parameter `t_x` over `L`, a trivialisation `s_x` of `A_Z` over
`L[[t_x]]` with connection d exists because every unipotent connection on a formal disc is trivial,
and the gauge transformation `C_x := s_x^(−1)` ∘ `s_0 ∈ End(Q ⊕ V_dR ⊕ Q(1)) ⊗ L((t_x))` satisfies
`C_x^(−1) dC_x = Λ (28)`. Conversely every unipotent `C_x` with (28) defines such `s_x`. Explicitly `C_x = [[1, 0, 0], [Ω_x, 1, 0], [g_x, Ω_xᵀZ, 1]]` where `Ω_x ∈ L((t_x))^{2g}` and `g_x ∈ L((t_x))` satisfy `dΩ_x = −ω` and `dg_x = Ω_xᵀ Z dΩ_x − η (29)`. For fixed `Ω_x, g_x` is determined up to a constant. Replacing `Ω_x` by `Ω_x+c` requires replacing `g_x` by `g_x+cᵀZΩ_x+e` for a constant e; the Hodge-filtration condition is independent of these compatible choices.

Work under the following conditions. An explicit set-up and the connection matrix `Λ` of
explicit-connection. `t_x` is a uniformiser at `x ∈ D` over `L`, chosen `Gal(L/Q)-equivariantly`.

The interface includes these statements.

- `gaugeMatrix Ω g Z` is the block matrix `[[1,0,0],[Ω,1,0],[g,ΩᵀZ,1]]` indexed by Unit `⊕` Fin `(2g) ⊕` Unit.
- For alternating `Z (Zᵀ =` −Z with zero diagonal; automatic over `Q`), the inverse of `gaugeMatrix Ω g Z` is `[[1,0,0],[−Ω,1,0],[−g, −ΩᵀZ, 1]]`.
- `det (gaugeMatrix Ω g Z) = 1`.
- For a derivation `D` of a commutative ring `R` and alternating `Z` with D-constant entries: `gaugeMatrix⁻¹ · D(gaugeMatrix) = Λ(ω, η, Z)` if and only if `D Ω = −ω` and `D g = Ωᵀ Z (D Ω) − η`.
- `gaugeMatrix (Ω + c) (g + cᵀZΩ + e) Z = unipotent(c, cᵀZ, e) · gaugeMatrix Ω g Z` for constants c, e (the dependence on primitives).
- `connectionMatrix ω η Z = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]`.

For the proof, Expand `C^(−1)dC` for `C = [[1,0,0],[Ω,1,0],[g,ΩᵀZ,1]]: C^(−1) = [[1,0,0],[−Ω,1,0],[ΩᵀZΩ − g, −ΩᵀZ, 1]]` (using `ΩᵀZΩ = 0` because `Z` is alternating) and `C^(−1)dC = [[0,0,0],[dΩ,0,0],[dg − ΩᵀZdΩ, dΩᵀZ, 0]]`. Comparing with `Λ = −[[0,0,0],[ω,0,0],[η,ωᵀZ,0]]` gives `dΩ = −ω, dΩᵀZ = −ωᵀZ` and `dg = ΩᵀZdΩ − η`,
which is (29). `Ω_x` is a vector of formal primitives of `−ω`, which exist in `L((t_x))` because `ω_0, …, ω_{2g−1}` are of the second kind; `g_x` exists exactly when (30) holds (explicit-connection). Changing
`Ω_x` by a constant vector c changes `g_x` by `cᵀZΩ_x` plus a constant; the principal parts used in
hodge-filtration-explicit change by terms involving only Z's columns of holomorphic index and the
holomorphic primitives, which are regular.

**Checks.**

- gaugeMatrix_zero. `gaugeMatrix 0 0 Z = 1` for every `Z`.
- gaugeMatrix_g1_inverse. For `g = 1` (index Unit `⊕` Fin `2 ⊕` Unit), `Z = [[0,1],[−1,0]], Ω =` (a, `b), g = c: gaugeMatrix Ω c Z * [[1,0,0],[−Ω,1,0],[−c,−ΩᵀZ,1]] = 1`.
- gaugeMatrix_sign_convention. With `D Ω = +ω` (the 2021 convention) and `ω ≠ 0, gaugeMatrix⁻¹ · D(gaugeMatrix) ≠ Λ(ω, η, Z)`.
- gaugeMatrix_unipotent. `(gaugeMatrix Ω g Z − 1)^3 = 0`; the nilpotence index may be smaller.
- Over `F₂`, the `2×2` matrix `Z=diag(1,0)` satisfies `Zᵀ=−Z` but is not alternating: `Ω=(1,0), g=0` makes the proposed inverse with lower-left entry −g fail. The zero-diagonal condition is essential for the general-ring helper.
- With `Z=[[0,1],[−1,0]], c=(1,0), Ω=(0,1)`, shifting `Ω` by c shifts g by 1+e, rather than by e alone.
- The 2021 restatement of this step uses `dΩ_{x,i} = ω_i` and defines `g_x` through the integral of `dΩ_xᵀZdΩ_x − η`; both deviate from (29).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
(28)–(29), p.915; [BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), §4.1, p.18 (arXiv
v4).)

*Needs:* §6.5; §6.6; Mathlib LaurentSeries; Mathlib Derivation; Mathlib Matrix.

### 6.8 Explicit Hodge filtration of `A_Z` (BDMTV Theorem 4.11)

In an explicit set-up with gauge data `(Ω_x, g_x)_{x ∈ D}`, let `N = (0_g, 1_g)ᵀ ∈ M_{2g×g}(Q)`, the
matrix of `Fil⁰V_dR` ↪ `V_dR`. (i) There are unique `γ_Fil ∈ O(Y)` and `b_Fil = (b_g, …, b_{2g−1})ᵀ ∈ Q^g`
such that `γ_Fil(b) = 0` and `g_x + γ_Fil − b_Filᵀ Nᵀ Ω_x − Ω_xᵀ Z N Nᵀ Ω_x ∈ L[[t_x]]` for every `x ∈ D (32)`. (ii) A basis of `Fil⁰A_Z|_Y` in the trivialisation (26) is `{1 + γ_Fil S, T_g + b_g S, …, T_{2g−1} + b_{2g−1} S} (33)`; equivalently, with `Q ⊕ V_dR ⊕ Q(1)` filtered by `Fil^(−1) =` everything,
`Fil⁰ = Q ⊕ Fil⁰V_dR, Fil¹ = 0 (31)`, the filtered isomorphism `s^Fil` can be chosen with `s_0^(−1)` ∘
`s^Fil = [[1,0,0],[0,1,0],[γ_Fil, β_Filᵀ, 1]], β_Fil = (0, …, 0, b_g, …, b_{2g−1})ᵀ (36)`.

Work under the following conditions. An explicit set-up (with `ω_0, …, ω_{g−1}` holomorphic) and
the gauge transformations of gauge-transformation. The Hodge filtration of `A_Z` is the one
characterised by Hadian's theorem (AnabelianGeometryAndNonabelianChabauty §§2.0–2.7).

For the proof, Uniqueness in (i): if `(γ, b)` is the difference of two solutions then `γ(b) = 0` and `γ − bᵀNᵀΩ_x` is regular at each `x ∈ D`, so `dγ + Σ_{i≥g} b_i ω_i` is regular on `X`, hence holomorphic. Its
class `Σ_{i≥g} b_i[ω_i]` lies in `Fil¹ = span([ω_0], …, [ω_{g−1}])`, so `b = 0` by linear independence;
then `γ` is a regular function on `X`, constant, and `γ(b) = 0` gives `γ = 0`. With the actual gauges of the
mixed connection, use the principal-parts exact sequence `0→L→Γ(Y_L,O)→⊕_{x∈D(L)} L((t_x))/L[[t_x]]→H¹(X_L,O)→0` and `H¹_dR(X_L)/Fil¹≅H¹(X_L,O)`. The principal parts of the primitives
of `ω_g,…,ω_{2g−1}` map to a basis of the last group. For `N=(0,I)ᵀ` prove existence and uniqueness of
`γ∈Γ(Y,O), b_Fil∈Q^g` with `γ(b)=0` and `g_x+γ−b_FilᵀNᵀΩ_x−Ω_xᵀZNNᵀΩ_x` regular at every boundary point.
Descend from `L` by uniqueness. The conditions in (i) do not depend on the additive constants in `Ω_x`
and `g_x`: the lower right block of `Z` vanishes (condition (b)) and the primitives of `ω_0, …, ω_{g−1}`
are regular. (ii): with `B_x = [[1,0],[NᵀΩ_x,1]], C_x H B_x^(−1)` has entries `Ω_x − NNᵀΩ_x` (regular by
holomorphy), `Ω_xᵀZN` (regular since the lower right block of `Z` is zero) and `g_x + γ_Fil − b_FilᵀNᵀΩ_x − Ω_xᵀZNNᵀΩ_x` (regular by (i)) (35); hence the subbundle `H` spanned by (33) extends over `X`. `H`
satisfies Hadian's three conditions (AnabelianGeometryAndNonabelianChabauty §§2.0–2.7, BDMTV Theorem `4.5`): Griffiths transversality is vacuous
for weights 0 and `−1, H` maps isomorphically onto `Fil⁰` of `A_1` (top right block zero, middle block the
inclusion), and the identity lies in `Fil⁰` since `γ_Fil(b) = 0`; by uniqueness in Hadian's theorem `H = Fil⁰A_Z`.

Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. Descend from `L` by uniqueness. Prove that the subbundle spanned `by1+γS,T_g+b_gS,…,T_{2g−1}+b_{2g−1}S` extends over `X` and satisfies Hadian’s transversality, exact-sequence and pointed-identity conditions; hence it equals `Fil⁰A_Z`. Return the actual filtered isomorphism `sFil` with `βFil=(0,b_Fil)`, not just a solution to a Laurent linear system.

**Checks.**

- `X_s(13), Y = {Z ≠ 0}, b = P2: β_Fil,Z1 = (0,0,0,0,1/2,1/2)ᵀ, γ_Fil,Z1 = 5y/6 + 3x/2; β_Fil,Z2 = (0,0,0,0,−1/2,−5/2)ᵀ, γ_Fil,Z2 =` −5y/6 − 15x/2.
- For `Z = 0: η = 0, b_Fil = 0, γ_Fil = 0`, and `Fil⁰A_Z` is the split filtration.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Theorem 4.11, p.917; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §4.5,
p.916.)

*Needs:* §6.5; §6.7; §6.6; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7; AnabelianGeometryAndNonabelianChabauty §§6.1–6.8.

### 6.9 Finite principal-part characterization of the Hodge filtration data `(η, b_Fil, γ_Fil)`

For the actual affine coordinate ring and boundary expansions of §6.5, characterize
`(η,b_Fil,γ_Fil)` by the residue equations (30) and regularity equations (32).
Suppose sufficient Laurent truncation and pole bounds are supplied: they bound products of
primitives, not only the poles of individual differentials. Then these equations depend on
finitely many Laurent coefficients and on a finite-dimensional Riemann–Roch space containing
`γ_Fil`. Prove that their unique solution is the geometric Hodge data of §§6.6–6.8.
The residue matrix has rank d − 1; the principal parts of the nonholomorphic primitives
map to a basis of `H¹(X,O)`. Thus the finite characterization is both necessary and sufficient.
For `X_s(13)` the relevant space is `H⁰(X,O(2D))`, with basis `1,x,y,x²,xy,y²`.
Exact expansions, residue identities and pole bounds for a concrete model are explicit
hypotheses of its application theorem.

Work under the following conditions. Exact input data over `Q` and `L`; exact sufficient Laurent
truncation orders for the residue and product/principal-part computations are supplied. A
finite-dimensional Riemann–Roch space containing `γ_Fil` is supplied with an exact pole bound for
the expressions in (32); a bound from the individual differential poles alone is not claimed
sufficient.

The interface includes these statements.

- A structure with fields `etaCoeff` : Fin `(d − 1) → L, bFil` : Fin `g → L` (rational in the application) and `gammaFil` in the coordinate ring A of `Y`.
- The predicate: for every `x ∈ D, Σ_k etaCoeff k · Res_x(ω_{2g+k}) = Res_x(Ω_xᵀZdΩ_x), i.e`. the residue matrix times `etaCoeff` equals the target residues.
- The predicate: `γ_Fil(b) = 0` and, for every `x ∈ D, g_x + γ_Fil − b_FilᵀNᵀΩ_x − Ω_xᵀZNNᵀΩ_x` has no terms of negative degree.
- Two data satisfying both conditions are equal (hodge-filtration-explicit (i) and explicit-connection).
- `β_Fil := (0, …, 0, b_g, …, b_{2g−1}) ∈ Q^{2g}`.
- Replacing `Z` by `λZ (λ ∈ Q)` replaces `(η, b_Fil, γ_Fil)` by `(λη, λb_Fil, λγ_Fil)`.

For the proof, the residue equation is a linear system of d equations (one per `x ∈ D`) in the d − 1 unknowns `c_k`;
it has rank d − 1 by explicit-setup's residue injectivity and is consistent because `η` exists
(explicit-connection), so its solution is unique. The zero-residue condition determines the principal part of `g_x`
because the residue of its derivative vanishes by (i). The principal-part equation has a unique solution by
hodge-filtration-explicit (i) once the chosen finite-dimensional function space contains `γ_Fil`. A
sufficient pole bound must be deduced from `g_x, Ω_xᵀZNNᵀΩ_x` and `b_FilᵀNᵀΩ_x`; the maximum pole order
of the individual `ω_i` does not justify this. Supply a Riemann–Roch space with a proved sufficient
pole bound before solving this finite system. The resulting data satisfy (30) and (32) as exact identities over `L`; no p-adic precision enters, so the Hodge data are exact rational data.

Use the actual affine coordinate ring/function field, boundary points and uniformizers, exact Laurent expansions of `ΩᵀZdΩ` and `ΩᵀZNNᵀΩ`. Derive product/primitive pole bounds and the finite function space for `γ`; compute residues and solve finite linear systems, then verify `conditions(30),(32)` and base normalization. For xs13 use `H⁰(O(2D))` with `basis1,x,y,x²,xy,y²` and apply actual principal parts, using the actual residue and principal-part identities. Largest individual differential pole alone is not enough.

**Checks.**

- For `X_s(13), Z1: betaFil = (0,0,0,0,1/2,1/2)` and `gammaFil =` 5y/6 + 3x/2.
- For `Z = 0` the unique data are `η = 0, b_Fil = 0, γ_Fil = 0`.
- Since `Z` is antisymmetric, the printed residue condition `Res_x(dΩ_xᵀZΩ_x − η') = 0` gives `η' = −η`, which differs from `η` and violates ResidueCondition whenever some `Res_x(Ω_xᵀZdΩ_x) ≠ 0`.
- The map `Z ↦ (η, b_Fil, γ_Fil)` is Q-linear: the data for Z1 + Z2 are the sums (agreement with the module structure of admissible matrices).
- `X_s(13), Y = {Z ≠ 0}, b = P2, Z =` Z1: output `η_{Z1} = −(44x² + (148/3)`xy `+ 8y²)dx/Q_y, β_Fil = (0,0,0,0,1/2,1/2), γ_Fil =` 5y/6 + 3x/2.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), end
of §4.5, p.918; [BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), §4.1, p.18 (arXiv
v4).)

*Needs:* §6.6; §6.7; §6.8.

### 6.10 Left and right multiplication matrices and parallel transport

Let `Z` be an antisymmetric `2g × 2g` matrix over a commutative ring `R`. Define the algebra `A_Z(R) = R ⊕ R^{2g} ⊕ R` by the following product. Its identification with the quotient of the truncated tensor algebra
by the kernel of the degree-two pairing requires that pairing to be surjective; this holds over `Q`
when `Z` is nonzero. Without this hypothesis the displayed product still defines the algebra, but
the asserted quotient need not have its final `R` summand. It has
multiplication (a, `b, c)·(a'`, b', c') `=` (aa', ab' + a'b, ac' + a'c + bᵀZb'). In the ordered basis `1, T_0, …, T_{2g−1}, S`, left multiplication by `u =` (a, b, c) has matrix `L(u) =` [[a, `0, 0], [b, a·1, 0], [c`, bᵀZ, a]] and right multiplication has matrix `R(u) =` [[a, `0, 0], [b, a·1, 0], [c`, −bᵀZ, a]] (44).
For points `b, b_0, x, x_0` in residue discs, with `I(x_1, x_2) = 1 + Σ_w ∫_{x_1}^{x_2} w(ω_0, …, ω_{2g+d−2})` the iterated integrals of words of length `≤ 2` (the index range corrected as in the cited
correction) pushed to `A_Z`, the transport `τ_{b,x} : A_Z^dR(b_0, x_0) → A_Z^dR(b, x)` is `v ↦ I(x_0, x) · v · I(b, b_0) (41)`, so its matrix is `L(I(x_0, x)) · R(I(b, b_0))`, with Coleman (Besser) integrals
between different discs and power-series integrals inside a disc. The Frobenius operators satisfy
`φ_Z(b_0, x_0) = x_0^* Φ_Z` and `φ_Z(b, x) = τ_{b,x}` ∘ `φ_Z(b_0, x_0)` ∘ `τ_{b,x}^(−1) (43)`.

Work under the following conditions. `Z` antisymmetric (condition (d)); `R` commutative. Iterated
integrals are Coleman integrals (ColemanIntegration L1), normalised as in (40)–(41) with the
orientation specified by the endpoints in the displayed transport formula.

The interface includes these statements.

- `leftMulMatrix Z` (a, `b, c) = [[a,0,0],[b,a·1,0],[c,bᵀZ,a]]` indexed by Unit `⊕` Fin `n ⊕` Unit.
- `rightMulMatrix Z` (a, `b, c) = [[a,0,0],[b,a·1,0],[c,−bᵀZ,a]]`.
- `leftMulMatrix Z (u * v) = leftMulMatrix Z u * leftMulMatrix Z v`.
- For antisymmetric `Z, rightMulMatrix Z (u * v) = rightMulMatrix Z v * rightMulMatrix Z u`.
- `leftMulMatrix Z u` and `rightMulMatrix Z v` commute (associativity).
- `transportMatrix Z` Ixx Ibb `:= leftMulMatrix Z` Ixx `* rightMulMatrix Z` Ibb, the matrix of `v ↦ I(x_0,x)·v·I(b,b_0)`.
- `leftMulMatrix Z u` acting on the coordinate vector of v is the coordinate vector of u * v.

For the proof, The multiplication is associative with unit `(1, 0, 0)`: for `u =` (a, `b, c), v =` (a',
b', c'), `w =` (a'', b'', c'') both (uv)w and `u(vw)` have S-coordinate aa'c'' + aa''c' + a'a''c +
a''bᵀZb' + a'bᵀZb'' + ab'ᵀZb''. Left multiplication: `u·(a'`, b', c') `=` (aa', ab' + a'b, ac' + a'c +
bᵀZb') gives the columns of `L(u)`. Right multiplication: (a', b', `c')·u =` (a'a, a'b + ab', a'c + ac'
+ b'ᵀZb) and b'ᵀZb `=` −bᵀZb' by antisymmetry, giving `R(u)`. Path composition `I(x_1, x_3) = I(x_2, x_3)·I(x_1, x_2)` (Lemma `4.3`, AnabelianGeometryAndNonabelianChabauty §§2.0–2.7) and Besser's Frobenius-equivariant transport (AnabelianGeometryAndNonabelianChabauty §§2.0–2.7, BDMTV (41))
give `τ_{b,x}`; the orientation is `I(x_0, x)` on the left and `I(b, b_0)` on the right.

**Checks.**

- `leftMulMatrix Z (1, 0, 0) = 1` and `rightMulMatrix Z (1, 0, 0) = 1`.
- For `n = 2, Z = [[0,1],[−1,0]], u = (1, (1,0), 0)` and `v = (1, (0,1), 0): u * v = (1, (1,1), 1)` and `v * u = (1, (1,1), −1)`.
- For the symmetric `Z = 1 (n = 1)` and `u = (1, 1, 0)`, right multiplication by u on `(0, 1, 0)` gives `(0, 1, 1)` while −bᵀZ predicts −1: the formula `R(u)` needs antisymmetry.
- The `(2,1)` block of `transportMatrix Z (1, ∫_{x_0}^x ω, ·) (1, ∫_b^{b_0} ω, ·)` applied to `(1, ∫_{b_0}^{x_0} ω, ·)` is `∫_b^x ω` (path composition).
- For `u = (1, 0, 0)` both matrices are the identity.
- For `Z=0` over `Q`, the displayed product retains a central `Q` summand, whereas the degree-two quotient by ker `Z` has zero degree-two part. The tensor-quotient description therefore requires surjectivity of the pairing.
- `L(u)L(v) = L(uv), R(u)R(v) = R(vu)`, and `L(u)R(v) = R(v)L(u)` by associativity.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§5.3.1, (44), p.922; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §5.2.1,
(41), p.921.)

*Needs:* §6.5; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7; ColemanIntegration §L1.19; ColemanIntegration §L1.14; Mathlib Matrix.

### 6.11 The Frobenius structure of `A_Z` on a chart (BDMTV (45))

In an explicit set-up over `Q_p`, let `φ` be an overconvergent Frobenius lift on a strict neighbourhood
of `]U[` for an open `U ⊆ Y_{F_p}`, write `φ^*ω = Fω + df` with `F ∈ M_{2g}(Q_p)` and f a column vector of
overconvergent functions with `f(b_0) = 0` for a Teichmüller point `b_0` (explicitly supplied
Frobenius/cohomology data, with the `RD.7` comparison), and set `Λ_φ = −[[0,0,0],[φ^*ω,0,0],[φ^*η, φ^*ωᵀZ, 0]]`. Then FᵀZF `= pZ`, and the inverse `G = Φ_Z^(−1)` of the Frobenius structure is the unique
graded-compatible pointed inverse Frobenius of the actual universal quotient, represented by an
invertible (2g+2) `×` (2g+2) matrix of overconvergent functions with `Λ_φ G + dG = GΛ` and `G(b_0)^(−1)`
sending 1 to 1, namely `G = [[1, 0, 0], [f, F, 0], [h`, gᵀ, p]], where g is the column vector with dgᵀ
`=` dfᵀZF (the constant fixed by exactness of the next equation) and h is the function with `dh = ωᵀFᵀZf +` dfᵀZf `− gᵀω + φ^*η − pη` and `h(b_0) = 0`.

Work under the following conditions. An explicit set-up over `Q_p`; p of good reduction; `φ` an
overconvergent Frobenius lift with `b_0` Teichmüller. `Z` satisfies (a): FᵀZF `= pZ` where `F` is the
Frobenius matrix on `H¹_dR` in the basis `ω (Z` is `φ =` p-invariant, the cup product has Frobenius weight
p).

For the proof, The Frobenius structure `Φ_Z : φ^*A_Z^rig ≅ A_Z^rig` is a morphism of connections, so
in the trivialisation `s_0` its inverse `G` satisfies `Λ_φ G + dG = GΛ`. AnabelianGeometryAndNonabelianChabauty §§2.0–2.7 supplies the unique pointed
Frobenius `Φ_Z` and graded-compatible quotient. `G=Φ_Z⁻¹` has `diagonal(1,F,p); Φ_Z` has
`diagonal(1,F⁻¹,p⁻¹)`. Pointed normalization at b0 is `f(b0)=h(b0)=0`; the remaining g constant is fixed
by the cohomological reduction, not by `f(b0)=0` alone. Write the block equations of `Λ_φ G + dG = GΛ`:
the `(2,1)` block gives `df = φ^*ω − Fω`; the `(3,2)` block gives dgᵀ `=` dfᵀZF using FᵀZF `= pZ`; the `(3,1)`
block gives `dh = ωᵀFᵀZf +` dfᵀZf `− gᵀω + φ^*η − pη` (checked entrywise: the connection convention
above). Set `g0=−FᵀZf`. Actual rigid-cohomology reduction of `ξ=(φ*ω)ᵀZf+φ*η−pη−g0ᵀω` gives `ξ=cᵀω+dh`;
put `g=g0+c` and `h(b0)=0`. `BDMTV2021v4(4.5)–(4.7)p19` states this step. Take the overconvergent sections
and coefficient/error bounds as explicit hypotheses; verify the displayed differential identities.
`RD.7` supplies the rigid/de Rham comparison, and AnabelianGeometryAndNonabelianChabauty §§2.0–2.7 identifies the resulting matrix with the
universal Frobenius. The instance-specific tables are hypotheses.

Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. Over `Q_p` take an actual strict neighborhood of the tube `]U[` in `Y^an`, its overconvergent structure sheaf, an overconvergent Frobenius lift `φ` reducing to p-power Frobenius, and a Teichmüller b0 in b’s disc. In the s0 coordinates of `A_Z^rig`, compute `φ*ω=Fω+df` with `f(b0)=0`, and `FᵀZF=pZ`. Define `g0=−FᵀZf, ξ=(φ*ω)ᵀZf+φ*η−pη−g0ᵀω`, and use actual rigid-cohomology reduction `ξ=cᵀω+dh, h(b0)=0`, to put `g=g0+c`. Identify the resulting `G=[[1,0,0],[f,F,0],[h,gᵀ,p]]` with `Φ_Z⁻¹: ΛφG+dG=GΛ`, and `normalization1↦1` at b0. Uniqueness is among the graded-compatible morphisms of the actual pointed universal quotient. For the actual Frobenius `Φ_Z` the graded matrix is `diag(1,F⁻¹,p⁻¹)`, while `G` has graded matrix `diag(1,F,p)`. The actual sections and finite coefficient/error tables are supplied hypotheses satisfying the displayed identities. `RD.7` supplies the geometric comparison, not a numerical-data numerical construction; ED proves the matrix identity and propagates the supplied precision bounds.

**Checks.**

- For `Z = 0` and `g = 1` data with `φ^*ω = Fω, f = 0: G =` [[1,0,0],[0,F,0],[h, 0, p]] with `dh = φ^*η − pη`.
- At `p = 17` on `]U_1[` for `X_s(13)` the matrices `F, f, g, h` are the data of xs13-first-chart-frobenius.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§5.3.2, (45), pp.922–923; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Lemma 5.2,
p.919; [BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), §4.2,(4.5)–(4.7),p19(arXivv4).)

*Needs:* §6.6; §6.5; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7; AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; ColemanIntegration §L1.5; ColemanIntegration §L1.15; ColemanIntegration §L1.6.

### 6.12 The Frobenius-equivariant splitting at Teichmüller and general points

With `G` as in frobenius-structure-matrix and `x_0 ∈ ]U[` a Teichmüller point, the Frobenius-equivariant
splitting `s^φ` satisfies `s_0(b_0, x_0)^(−1)` ∘ `s^φ(b_0, x_0) = [[1, 0, 0], [(I − F)^(−1)f, 1, 0]`,
[(1/(1 − p))(gᵀ(I `− F)^(−1)f + h), gᵀ(F − p)^(−1), 1`]] evaluated at `x_0` (the unique unipotent matrix
`S` satisfying `G(x_0)S=S diag(1,F,p)`, equivalently `G(x_0)^(−1)S=S diag(1,F^(−1),p^(−1))`). For
arbitrary b, x in residue discs of `]U[` with Teichmüller representatives `b_0, x_0, s_0(b, x)^(−1)` ∘
`s^φ(b, x) = L(I(x_0, x)) · R(I(b, b_0)) · s_0(b_0, x_0)^(−1)` ∘ `s^φ(b_0, x_0)`, with `L, R` from
transport-matrices (with the endpoint orientation of §6.10). Writing this matrix as
`[[1,0,0],[α_φ,1,0],[γ_φ,β_φᵀ,1]], α_φ(b, x) = ∫_b^x ω`.

Work under the following conditions. frobenius-structure-matrix; `x_0` Teichmüller `(φ(x_0) = x_0); p > 1` so 1 − p and `F − p, I − F` are invertible (the eigenvalues of `F` are Weil numbers of absolute value
`p^(1/2)`).

For the proof, At a Teichmüller point Frobenius acts on `A_Z^dR(b_0, x_0)` by `G(x_0)^(−1); s^φ` is the
unique unipotent isomorphism from `Q ⊕ V_dR ⊕ Q(1)` with Frobenius `diag(1,F^(−1),p^(−1))`. Solving the
unipotent conjugation block by block: `α = (I − F)^(−1)f(x_0), β = gᵀ(F − p)^(−1), γ = (1/(1 − p))(gᵀα + h(x_0`)); invertibility of `I − F, F − p` and 1 − p follows from the Weil bounds
(ColemanIntegration §L1.8). `(I − F)^(−1)f(x_0) = ∫_{b_0}^{x_0} ω` by
Frobenius-equivariance of Coleman integration (ColemanIntegration
ColemanIntegration §L1.20). General points: `s^φ(b, x) = τ_{b,x}` ∘ `s^φ(b_0, x_0)`, and
`τ_{b,x}(v) = I(x_0, x)·v·I(b, b_0)` by (41); hence the product of left multiplication by `I(x_0, x)`,
right multiplication by `I(b, b_0)`, and the Teichmüller matrix. The `(2,1)` block is `∫_{x_0}^x ω + ∫_{b_0}^{x_0} ω + ∫_b^{b_0} ω = ∫_b^x ω`.

Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. On the actual fibre x0* `A_Z` at a Teichmüller point x0, prove that the unique Frobenius-compatible unipotent splitting `S=s0⁻¹sφ` has `α=(I−F)⁻¹f(x0), βᵀ=g(x0)ᵀ(F−pI)⁻¹, γ=(g(x0)ᵀα+h(x0))/(1−p)`. Its precise intertwining identity is `G(x0)S=S diag(1,F,p)`, equivalently `Φ_Z(x0)S=S diag(1,F⁻¹,p⁻¹)`. Weil weights prove invertibility of I−F,F−pI,1−p. For actual fibres at general b,x, Besser path transport gives `S(b,x)=L(I(x0,x))R(I(b,b0))S(b0,x0)`; hence `α(b,x)=∫_b^xω`. The tuple solver alone does not identify any fibre or Coleman integral.

**Checks.**

- For `b = b_0 = x_0 = x` the matrix is `[[1,0,0],[0,1,0],[(1/(1−p))h(b_0), gᵀ(F−p)^(−1), 1]]` with `h(b_0) = 0`.
- As printed `(p.923)` the transport factors have reversed limits, giving `α_φ(b, x) = α_φ(b_0, x_0) − ∫_{x_0}^x ω − ∫_b^{b_0} ω`, which is not `∫_b^x ω`.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§5.3.2, p.923.)

*Needs:* §6.11; §6.10; ColemanIntegration §L1.20; ColemanIntegration §L1.8; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7.

### 6.13 The local height at `p` of `A_Z(b, x)` (BDMTV Lemma 5.5)

Let s be a splitting of the Hodge filtration of `V_dR` with idempotents `s_1, s_2` onto `s(V_dR/Fil⁰)` and
`Fil⁰`, and `χ_p` the local component of the fixed idèle class character. For `x ∈ X(Q_p) ∩ ]U[`, with
`γ_Fil, β_Fil` from hodge-filtration-explicit and `α_φ, β_φ, γ_φ` from frobenius-equivariant-splitting,
the local height of the mixed extension `A_Z(b, x)` is `h_p(A_Z(b, x)) = χ_p(γ_φ(b, x) − γ_Fil(b, x) − β_φ(b, x)ᵀ · s_1(α_φ(b, x)) − β_Fil(b)ᵀ · s_2(α_φ(b, x))`). As a function of x on each residue disc
it is a convergent power series in the disc parameter whose coefficients are determined by the
data above, and `θ_Z(x) := h_p(A_Z(b, x))` is the function of the quadratic Chabauty pair.

Work under the following conditions. The splitting s and the character `χ` are fixed (independence of
the zero set from both is AnabelianGeometryAndNonabelianChabauty §§6.1–6.8's). x lies in a residue disc of `]U[` where `φ` is defined and no basis
differential has a pole.

For the proof, By AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 (BDMTV Lemma `5.4) D_cris(A_Z(b, x)) ≅ A_Z^dR(b, x)` as filtered `φ-modules`,
with `A_Z^dR(b, x) = x^*A_Z`. The height formula (17) (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8) expresses `h_p` of a mixed extension
through the matrices of `s^φ` and `s^Fil` relative to a vector-space splitting `s_0`. Take `s_0 = s_0(b, x)`
of (26); then `s_0^(−1)` ∘ `s^Fil` is given by hodge-filtration-explicit (36) evaluated at x and
`s_0^(−1)` ∘ `s^φ` by frobenius-equivariant-splitting; substitute into (17). On a residue disc, `γ_Fil` is
a rational function, `α_φ, β_φ, γ_φ` are single and double Coleman integrals in the parameter
(power-series integrals inside the disc), so `θ_Z` is a convergent power series there.

Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. Fix the actual AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 mixed extension `A_Z(b,x)`, idèle class character `χ` with chosen p-adic logarithm branch, its additive factor `χ_p` on `Q_p` after the logarithm, and a splitting s of `V_dR/Fil⁰V_dR` with complementary projectors s1,s2. Use the cycle-compatible filtered `φ-module` comparison `D_cris(A_Z(b,x))≅x* A_Z`. For the actual Hodge and Frobenius splittings prove Nekovář `h_p(A_Z(b,x))=χ_p(γφ−γFil−βφᵀs1(αφ)−βFilᵀs2(αφ))`. Identify this locally analytic function with `θ_Z` in AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 and its actual convergent residue-disc expansion. The expression and quotient-coordinate helper are not a definition of the geometric height.

**Checks.**

- At `x = b = b_0` (Teichmüller): `h_p(A_Z(b, b)) = χ_p((1/(1−p))h(b) − 0 − β_φ(b,b)ᵀ s_1(0) − β_Fil(b)ᵀ s_2(0)) = 0`.
- `X_s(13), p = 17: θ_{Z1}, θ_{Z2}` on the discs of `]U_1[` (xs13-first-chart-frobenius).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Lemma 5.5, p.924.)

*Needs:* §6.8; §6.12; AnabelianGeometryAndNonabelianChabauty §§6.1–6.8.

### 6.14 Changing the base point (BDMTV Lemma 5.7)

Let b' `∈ X(Q_p)` lie in a residue disc where none of the basis differentials has a pole. Then
`β_Fil(b') = β_Fil(b)` and `γ_Fil(b', x) = γ_Fil(b, x) − γ_Fil(b, b')` (48), and `s_0(b', b')^(−1)` ∘
`s^φ(b', b') = [[1, 0, 0], [0, 1, 0], [0, β_φ(b, b)ᵀ + 2∫_b^{b'} ωᵀZ, 1`]]. Consequently the local
heights `h_p(A_Z(b', x))` for x in the disc of b', and in particular in a disc where the Frobenius
lift is not defined, are computed from the single integrals `∫_b^{b'} ω` (Coleman integrals with the
original lift) and power-series integrals inside the disc of b'. The formula changes the individual
scalar height functions; only the naturally identified Chabauty–Kim locus is base-point independent.
For the global rational-point application take rational b′ and transport the AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 height-pair data
as well.

Work under the following conditions. b' in a residue disc with no poles of `ω_0, …, ω_{2g+d−2}`;
Coleman integrals between discs are taken with respect to the original Frobenius lift (BDMTV §5.5).

For the proof, The Hodge data: by hodge-filtration-explicit the conditions (32) for b' differ from
those for b only in the normalisation `γ(b') = 0`, giving (48). The `φ-equivariant` unipotent
isomorphism `A_2^dR(Y)(b, b) → A_2^dR(Y)(b'`, b'), `s_0(b, b)(v) ↦ s_0(b', b')(I(b, b')·v·I(b', b)) (49`), passes to the quotient `A_Z`. With `L, R` of transport-matrices the matrix is `L(I(b`, b')) `· R(I(b, b'))^(−1) · s_0(b,b)^(−1)s^φ(b,b)`, where `I(b', b) = I(b, b')^(−1)`; multiplying out with `Z`
antisymmetric gives zero `(2,1)` block and `(3,2)` block `β_φ(b, b)ᵀ + 2∫_b^{b'}ωᵀZ` (the connection
convention above: the `arXiv` v1 product order `L·M·R^(−1)` gives a wrong `(3,1)` entry). Across residue
discs the integrals are Coleman integrals; the identification of (41) with the Frobenius-equivariant
transport is AnabelianGeometryAndNonabelianChabauty §§2.0–2.7's (BDMTV (2019), §5.2.1 (41)).

Put `A=Γ(Y,O_Y), K=Q(X)=Frac(A)`. Put `V_dR=H¹_dR(X)^*` with dual basis `T_i`. For `b′∈X(Q_p)` in a pole-free residue disc, use the actual AnabelianGeometryAndNonabelianChabauty §§2.0–2.7/Besser path isomorphism `v↦I(b,b′)vI(b′,b)`. On `A_Z` obtain `βFil(b′)=βFil(b), γFil(b′,x)=γFil(b,x)−γFil(b,b′)`, and `S(b′,b′)=[[1,0,0],[0,I,0],[0,βφ(b,b)ᵀ+2∫_b^{b′}ωᵀZ,1]]`. These identities together with Coleman integrals and tiny integrals compute the local height on the b′ disc even when the original Frobenius lift is absent there. Global rational-point/AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 comparisons require rational b′ and transport of the endomorphism, Chow–Heegner constant and away-from-p height data; do not claim equality of the individual scalar height functions for different base points. Assert invariance of the underlying identified Chabauty–Kim locus, supplied by AnabelianGeometryAndNonabelianChabauty §§6.1–6.8, rather than invariance of every auxiliary zero set.

**Checks.**

- For b' `= b` the formula reduces to `s_0(b,b)^(−1)s^φ(b,b) = [[1,0,0],[0,1,0],[0,β_φ(b,b)ᵀ,1]]`.
- `X_s(13)`: b' `= P0 = (1:1:1)` (xs13-p0-disc).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§5.5, Lemma 5.7, p.925; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §5.5,
p.925.)

*Needs:* §6.8; §6.12; §6.10; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7; ColemanIntegration §L1.19.

### 6.15 Valuation bounds for the coefficients of quadratic Chabauty power series

(i) (BDMTV 2019 §6.4.1.) Let `F_1, …, F_m ∈ Z_p[[t]]` and let `G(t) = Σ_n c_n t^n = Σ_{i,j} a_ij ∫F_i(∫F_j) + Σ_i a_i ∫F_i + Σ_i b_i F_i` with `a_ij, a_i, b_i ∈ Q_p`, where `∫` denotes the formal
primitive vanishing at `t = 0`. Then `v_p(c_n) ≥ min_{i,j}{v_p(a_ij), v_p(a_i), v_p(b_i)} − 2⌊log_p` n⌋
for `n ≥ 1`. (ii) For the actual QC function `ρ=h−h_p` on `D⊂X(Q_p)∩]U[`, under BDMTV2021§4 standing
hypotheses (p-integral F,Z and local expansions of `ω,ωᵀZ`; fixed `End(J)-equivariant` Hodge splitting),
choose t at `x1∈D, t(D)⊂pZ_p` and Teichmüller x0. Use `ord_p(0)=∞`; for matrices/vectors use the minimum
of entry valuations, including the diagonal1 of `λφ` so `c1≤0`. Certify `c1=ord_p(λφ(x1))` by Frobenius
evaluation and path-transport precision, `v_spl=min` valuation of the splitting coefficients,
`b=ord_p(βFil), a=ord_p(γFil), c2=min{0,v_spl,b,v_spl+b}`, and `c3=min_j ord_p(d_j)` for the genuine
global-height expansion `h=Σd_jΨ_j`. Let `d_i(η)` be exact lower bounds for the actual degree i−1
coefficient of `η` (all coefficient/coordinate changes included); the source uses a finite
polynomial-coefficient branch and0 after its degree bound, whose sufficiency must be proved for the
actual model. With `ℓ_i=⌊log_p` i⌋ for `i≥1` put `φ(i)=−ℓ_i+min{d_i(η),−ℓ_i}`. The branches are
`φ(i)=d_i(η)−ℓ_i` if `d_i(η)<−ℓ_i`, otherwise `φ(i)=−2ℓ_i`; the `λφ` coefficients have lower bound `φ(i)+c1`.
Explicitly certify `i0≥1` such that for every `i≥i0, −ℓ_i≤d_i(η), 2(−ℓ_i)≤b` and `2(−ℓ_i)≤a−c2` (the
floor-half inequalities on publishedp1136). Then `ord_p(ρ_i)≥−2ℓ_i+c1+min{c2,c3}` for `i≥i0 (Proposition4.6). Coefficients0≤i<i0` require their own finite valuation data; all-zero
`βFil,γFil` or global-height coefficients `use∞` and omit vacuous comparisons instead of assigning
integer0. The actual coordinate/differential estimates and algebraic cancellations proving this
height bound remain obligations; do not derive it solely from arbitrary matrices or assume the final
coefficient inequality. For the elementary single/double-integral estimate of BDMTV2019pp932–933
retain the separate helper `iteratedIntegral_valuation_coeff_ge`. The source notation `φ` in
preprintv4p24 has an extra+c1 corrected in publishedp1136; use `publishedφ` and addc1 once to the
splitting bound. This is `Proposition4.6`, not `Proposition4.1`; the latter evaluates `G(P)`.

Work under the following conditions. `F_i` have p-integral coefficients (after scaling the disc
parameter so that the basis differentials are integral on the disc). The constants `c_1, c_2, c_3` and
`i_0` satisfy the stated bounds in the supplied data (`ED.0` valuation data). Use `Proposition4.6` in
arXivv4p25/publishedp1136; `Proposition4.1` is a different Frobenius-evaluation statement. Source
coefficient estimates are consumed through the coefficient contract below, with
zero/finite-index branches explicit.

For the proof, Integrating `t^(n−1)` divides by n, which costs `v_p(n) ≤ ⌊log_p` n⌋; a double integral
costs at most twice that, and the coefficients a, b contribute their valuation: this is (i). Compute
c1 from the actual Frobenius splitting at the disc centre and derive the local transport branch `φ(i)`
from the actual integral expansions; the underlying coordinate coefficient lower bounds must be
exact. Combine Nekovář’s formula with `βFil,γFil` and the fixed equivariant splitting. The
required coefficient semantics and all constants are specified below. For `i≥i0` use the three
explicit threshold inequalities to select `φ(i)=−2⌊log_p` i⌋. Combine the actual global-height
coefficient bound c3 and local-height bound to obtain `Proposition4.6`. For smaller i use finite
data; zero coefficients have `valuation∞`. Use the published coefficient bound rather than the
earlier preprint branch. The valuations of the input constants are exact by §0.8.

For the actual QC function `ρ=h−h_p` on `D⊂X(Q_p)∩]U[`, under BDMTV2021§4 standing hypotheses (p-integral F,Z and local expansions of `ω,ωᵀZ`; fixed `End(J)-equivariant` Hodge splitting), choose t at `x1∈D, t(D)⊂pZ_p` and Teichmüller x0. Regression contracts: `qcValuation_lowDegree` rejects applying the tail formula to `i<i0; qcValuation_branchBoundary` identifies both formulas at `d_i(η)=−floor(log_p i); qcValuation_zeroCoefficient uses∞` and does not call `Padic.valuation(0)`.

**Checks.**

- For `p = 17` and `n < 17, ⌊log_p` n⌋ `= 0`, so the first 16 coefficients lose no precision to integration; at `n = 17` the loss is 2.
- `X_s(13)`: with enough coefficients the exact remaining slopes are strictly greater than −1 and hence give no zeros in `17Z_17` (BDMTV `p.933`). A slope equal to −1 permits a root of valuation 1, so a non-strict slope bound does not suffice.
- The low-degree `branch0≤i<i0` is exact separately; a tail bound alone never certifies the constant coefficient.
- At equality `d_i(η)=−⌊log_p` i⌋ both branch formulas agree. With `c1≠0`, it enters `λφ` and the final bound once; do not use the preprint’s erroneous `φ(i)=−2⌊log_p` i⌋+c1.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4.1, pp.932–933; [BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Proposition 4.6,
p.25 (arXiv v4); [BDMTV (published,
2023)](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C317E63BB0128EB3F2163621CA63E66E/S0010437X23007170a.pdf/quadratic_chabauty_for_modular_curves_algorithms_and_examples.pdf),
§4.4,pp1135–1136,Proposition4.6 and preceding i0 inequality.)

*Needs:* §0.8; §0.6; §6.13; Mathlib PowerSeries; Mathlib `Padic.valuation`.

### 6.16 Provable determination of roots in a residue disc

`Suggested.lean` states `ED6.roots_determined_of_truncation` in the normalized
form `G(T)=p^(−k)F(pT)`, with positive integer precision `N=n−k`.
The definition `ED6.seriesValue` is the convergent coefficient sum.
For any complete algebraically closed normed extension of `Q_p`, the theorem
matches its geometric zero multiset on the closed unit disc with the actual
polynomial roots of `H` there, within radius `p^(−N/d)`, counting analytic
multiplicities. The coefficient-error hypothesis is supplied by the finite
coefficient and tail bounds below; rescaling gives the claimed balls for `F`.

(BDMTV 2021 Lemma `4.7.`) Let `F(x) = Σ_{i≥0} F_i x^i ∈ Q_p[[x]]` such that `F(pT)` is restricted (its
coefficients tend to zero), and integers k, m, n with `n > k, m ≥ 1, min_i{ord_p(F_i) + i} = k`, using
`ord_p(0)=+∞`, and `ord_p(F_i) + i ≥ n` for every `i ≥ m` (that is, max`{i : ord_p(F_i) + i < n} < m`; the
printed condition max`{i : ord_p(F_i) + i = n} < m` is too weak), and suppose `F` has at most d roots
counted with multiplicity over `ℂ_p` in the closed disc `{ord_p(x) ≥ 1}`, where `d ≥ 1`. Then the roots of
`F` over `ℂ_p` in `{ord_p(x) ≥ 1}`, with multiplicity, are determined to precision (n − k)/d by `F_0, …, F_{m−1}` modulo `p^n`: After setting `G(T)=p^(−k)F(pT)`, choose an actual polynomial `H` over `Q_p` with
Gauss `norm ||G−H||≤p^(−(n−k))`. `G` and `H` have the same nonzero reduction and hence the same
Weierstrass degree `D≤d`. Their roots in the closed unit disc over completed `C_p`, counted with
multiplicity, admit a matching within radius `p^(−(n−k)/d)`. Transport these balls by `x=pT`. A residue
class solving a congruence is not itself a polynomial root and carries no multiplicity or lift
guarantee. With `d = 1` after recentring and rescaling (BDMTV 2021 Remark `4.8`), each simple root is
isolated in a ball containing no other root, which is the (unique) condition of qc-disc-datum;
the bound d must count geometric roots with multiplicity. Obtain it from the Weierstrass degree
of `G` (the last index attaining its Gauss norm), by the NewtonPolygons §4.3 multiplicity count specialized below. The distinct
`Q_p-root` bound of §4.26 alone does not supply this multiplicity bound.

Work under the following conditions. `F` converges on the closed disc `ord_p(x) ≥ 1` (ensured by
height-series-valuation-bound). The hypotheses on k, m, n are checked from exact coefficient
valuations `(ED.0)`.

The interface includes these statements.

- Supplier specialization (NewtonPolygons §4.3): for nonzero restricted `G` over `Q_p`
  with last dominant index D, extend to completed `C_p` and evaluate on the closed unit
  disc. Its geometric zero multiset has cardinality D with analytic multiplicity;
  `D≤d` supplies the bound above. RestrictedPowerSeries §2 supplies evaluation and
  translation; NewtonPolygons §§3.4 and 4.3 supply strict-perturbation multiplicity
  counts on every recentered cluster disc.
- `ED6.roots_determined_of_truncation`: Under the displayed restriction, tail, coefficient-error, `n>k` and geometric multiplicity hypotheses, provide the matching of geometric root multisets and a complete finite ball cover. Isolation additionally requires a local count of one; repeated roots remain clusters.
- Supporting necessary congruence for an existing `Q_p` root, using the supplied tail valuation. No cluster existence, multiplicity or isolation conclusion.

For the proof, normalize to `G(T)=p^(−k)F(pT)`, of Gauss norm one. The tail and coefficient-error hypotheses give `||G−H||≤ε=p^(−(n−k))<1`. Thus `G` and `H` have the same last coefficient of norm one, of index `D≤d`. If `D=0` both are units and have no closed-disc roots. Otherwise use the pinned `TauCeti.PowerSeries.IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq` and its uniqueness theorem to factor each as a unit of norm one times a monic degree-D polynomial whose roots lie in the closed unit disc. The supplier unit criterion and evaluation show that these unit factors have absolute value one throughout that disc. Partition the union of the two finite root multisets into closed balls of radius `ε^(1/d)`. Enlarge a cluster ball slightly to a radius `ε^(1/d)<r<1` that crosses no other root distance. On its boundary every factor in the polynomial for `G` has absolute value at least r, so `|G|≥r^D≥r^d>ε`. The nonarchimedean Rouché/Newton-polygon comparison gives equal numbers of G- and H-roots inside, with multiplicity. Taking the radii down to `ε^(1/d)` gives the matching. Apply NewtonPolygons §§3.4 and 4.3 after translating and rescaling each cluster
disc, using RestrictedPowerSeries §2. The quantitative matching radius and its
finite-data application are the targets here; the multiplicity and strict-perturbation
comparisons are supplied. Translate the matched balls by `x=pT`. A further local count equal to one proves isolation; solving a bare congruence supplies neither existence nor that count.

The Lean statement `ED6.roots_determined_of_truncation` has the following form. For nonzero restricted `F(pT)` over completed Cp, positive multiplicity bound d, finite coefficients modulo `p^N` and exact tail lower bounds, prove the quantitative matching theorem with `n−k>0`: a complete ball cover of every root, with multiplicities and stability; isolation requires a local multiplicity count of one. Exact `Polynomial.roots` over `Q_p` is not a residue-root enumerator or a Cp root constructor. Zero coefficients have `valuation∞`; a zero dominant coefficient is rejected.

**Checks.**

- A simple root `(d = 1)` of `F` in the closed disc `ord_p(x) ≥ 1` is determined to precision n − k from `F_0, …, F_{m−1}` modulo `p^n`, and its ball contains no other root.
- `F(x) = x²` has one distinct `Q_p-root` but multiplicity two; `d = 1` is invalid. For odd `p, F(x) = x² − p³` has no `Q_p-root` but two `C_p-roots` in the disc, so a zero count over `Q_p` cannot replace the geometric multiplicity bound.
- `F(x) = x² − p^(2N) (N ≥ 1)` has the two roots `±p^N` in the disc, so `d = 2` and `k = 2`; the lemma determines them only to precision (n − 2)/2, which illustrates the loss for clustered roots and why simple, separated roots are required for isolation.

([BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Lemma 4.7, p.25 (arXiv v4); [BDMTV
(arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Remark 4.8, p.25 (arXiv v4).)

*Needs:* §4.11; §6.15; §0.8; NewtonPolygons §§3.4 and 4.3; RestrictedPowerSeries §2; Mathlib PowerSeries; Mathlib `Polynomial.roots`; Tau Ceti `TauCeti.PowerSeries.IsDistinguished.exists_isUnit_isMonicOfDegree_mul_eq` and `TauCeti.PowerSeries.IsDistinguished.existsUnique_isUnit_isMonicOfDegree_mul_eq`.

### 6.17 Quadratic Chabauty on an affine cover

Let `X/ℚ` be a smooth projective curve of genus `g ≥ 2` with `rank J(ℚ) = g, ρ(J) > 1`, and an isomorphism `J(ℚ) ⊗ ℚ_p ≃ H⁰(X,Ω¹)*` given by the logarithm.
Assume good reduction at p and finitely many affine patches covering the required residue discs,
with plane equations monic in y and satisfying the corrected Tuitman Assumption 1.
Supply an integral symplectic differential basis, cup matrix, actual Hecke and Frobenius
operators with `T_p = F_p + pF_p⁻¹`, nice cycle classes, an equivariant isotropic Hodge splitting,
and the local height values at every prime lacking potentially good reduction.
For each determinant function supply its actual coefficient enclosures and strict infinite-tail
bounds, as in §§6.15–6.16. These hypotheses concern the arithmetic objects and their errors.

Prove: if finitely many residue balls cover every common determinant
zero on each covered disc, then they cover every rational point on those discs. Prove also: if the patches cover all residue discs, each candidate ball has
at most one common zero, and every ball either contains a known exact rational point or has no
rational point by §5.23, then the known finite set equals `X(ℚ)`.
The height-pairing equations use the actual spanning condition of §6.4.
If the basis, spanning condition, strict coefficient bounds or simple-root condition is absent,
these hypotheses do not hold and no completeness conclusion follows. A multiple root can still
belong to a finite cluster, but requires its full multiplicity bound and a separate isolation
argument. Rank, logarithm, numerical tables and local-height inputs remain explicit hypotheses.

The API is coverage under restriction to covered discs, monotonicity under enlarging the candidate
balls, compatibility under changing valid charts, and the complete-point-set equality above.
For the proof, each rational point satisfies the geometric height identities of §6.4 and hence
all determinant equations. Apply the root matching theorem, then §6.2 and the sieve exclusions.

**Checks.**

- For `X_0^+(97), p = 5`, the result is candidates of ten points matching `(1:0:0), (−2:1:1), (−1:0:1), (0:0:1), (0:1:0), (0:−1:1), (1:0:1), (1:1:1), (−1:1:0), (5:3:2)`.
- A coefficient-error bound equal to the boundary Gauss norm does not satisfy the
  strict perturbation hypothesis; uniqueness and completeness then require separate hypotheses.
- If the patches cover no residue disc, candidates `∅` asserts nothing about `X(Q)` (the covered-disc condition is empty).
- If every candidate not in `X(Q)_known` is excluded by an `ED.5` sieve datum, `toFiniteSolutionSet` returns `X(Q)_known`.
- `X_0^+(97), p = 5`: the output consists of the ten known points (x0plus-genus-three-points).
- `X_S4(13), p = 11` on two patches: output the four known points (xs4-13-rational-points).

([BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Algorithm 3.12, p.14 (arXiv v4);
[BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Remark 3.14, p.14 (arXiv v4); [BDMTV
(arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Assumption 3.10, p.13 (arXiv v4).)

*Needs:* §6.4; §6.9; §6.12; §6.2; §6.1; §5.23; AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; ModularCurvesPartII §17.2.

### 6.18 Plane quartic model of `X_s(13)`, its seven known points and the residue discs at 17

Conditional on the explicit arithmetic-input hypotheses listed below, let `B(X, Y, Z) := (−Y − Z)X³ + (2Y² + YZ)X² + (−Y³ + Y²Z − 2YZ² + Z³)X + (2Y²Z² − 3YZ³`) (Baran's quartic) and `Q(X, Y, Z) := Y⁴ + 5X⁴ − 6X²Y² + 6X³Z + 26X²YZ + 10XY²Z − 10Y³Z − 32X²Z² − 40XYZ² + 24Y²Z² + 32XZ³ − 16YZ³`. `(i) X_s(13) ≅ X_0^+(169)` over `Q`, and the canonical model of `X_0^+(169)` is the smooth plane quartic `B = 0`, cut
out by `B(h₁,h₂,h₃)=0` for a rational basis `h₁,h₂,h₃` of
`S₂(Γ₀(169))^{w₁₆₉=+1}`. These are the Baran coordinates; their products satisfy no
quadratic relation. `(ii) Q(X − Y, X + Y, X + Z) = 16·B(X, Y, Z)`, so (`X : Y : Z) ↦ (X − Y : X + Y : X + Z`) is a Q-isomorphism `{B = 0} → {Q = 0}; Q` is
monic in `Y`. (iii) `B = 0` has good reduction at every prime `≠ 13`, and `Q = 0` at every prime `≠ 2, 13; Q`
is smooth modulo 17 and #`{Q = 0}(F_17) = 20`. (iv) The points P0 `= (1 : 1 : 1), P1 = (1 : 1 : 2)`, P2
`= (0 : 0 : 1), P3 = (−3 : 3 : 2), P4 = (1 : 1 : 0), P5 = (0 : 2 : 1), P6 = (−1 : 1 : 0)` lie on `Q = 0`
and have seven distinct reductions modulo 17. (v) With `U_1 := {Z ≠ 0, `∂Q/∂Y` ≠ 0}` and `U_2 := {X ≠ 0,`
`∂Q/∂Y ≠ 0}` in `X_{F_17}, U_1` contains 17 of the 20 points of `X(F_17)`; the other three are (1 : 1 :
0), `(1 : −1 : 0) ∈ U_2` and `(1 : 1 : 1)`, which lies in neither (the disc of P0). The boundary `D = {Z = 0}` consists of the four points `(1 : ±1 : 0), (1 : ±√5` : 0), since `Q(X, Y, 0) = (Y² − X²)(Y² − 5X²)`.

Work under the following conditions. `X_s(13)` is defined as `X(13)/C_s^+(13)` over `Q` (ModularCurvesPartII §9.6). Assume
the stated plane quartic is isomorphic over `Q` to the actual split-Cartan modular curve, via the
supplied maps with inverse and cusp/CM identifications. The required q-expansion/Sturm comparison
identities and exact coefficient data are hypotheses, not computation targets. Supply this rational basis, its q-expansions, and an explicit matrix `A∈GL₃(K)`
with `(h₁,h₂,h₃)ᵀ=A(f₁,f₂,f₃)ᵀ`, where `K=Q(ζ₇)^+` and the `f_i` are the normalized
conjugates of f. Supply exact coefficient identities through `q^121` proving
`B(h₁,h₂,h₃)=0` by the weight-eight Sturm bound, the exact good-reduction ideal
identities, and the complete F17 projective-point/partial-derivative table with its finite ambient
coverage. These data are hypotheses; polynomial/model transport, point membership, smoothness and
the20/17 counts are deduced by exact verification, without a target to generate a point-count table.

The interface includes these statements.

- The displayed B and Q polynomial evaluations
  over any commutative ring, compatible with ring homomorphisms. Their coordinate
  identity and listed memberships are provided by the next theorem.
- Supporting algebra only: The polynomial identity/point memberships do not identify the modular curve or prove good reduction. The geometric application requires the hypotheses of this section.
- Finite set of all projective special-fibre points at17 using unique normalized representatives `Z=1, Z=0/Y=1`, and `(1:0:0)`.
- Exact enumeration gives20 distinct projective points.
- At each enumerated F17 point one partial derivative is nonzero. This rational-point check alone does not prove geometric smoothness over F17-bar; the good-reduction model is a separate hypothesis.

For the proof, (i) Import `X_s(13) ≅ X_0(169)/w_169` from ModularCurvesPartII §9.5; `S_2(Γ_0(169))^{w_169 = +1}` has
dimension 3, spanned by the conjugates of f (supplied geometric/Hecke data with exact identification
hypotheses). Apply the supplied invertible change of basis to obtain the rational forms `h_i`.
Their q-expansions give the canonical map; independence of their six quadratic products
is certified by an exact coefficient matrix of rank six. Thus the curve is not hyperelliptic
and its canonical image is a plane quartic. `B(h₁,h₂,h₃)` is a weight-eight cusp form for
`Γ₀(169)`, with coefficients through degree 121 zero, hence order at least 122,
which exceeds `8·182/12`,
hence zero by the Sturm bound (supplied geometric/Hecke data with exact identification hypotheses).
(ii) A polynomial identity of ternary quartics over `Z`, checked by expansion (both sides agree on the
grid `{0, …, 4}³`, which determines a polynomial of degree `≤ 4` in each variable). (iii) Good
reduction: an exact datum that the ideal (`B, ∂B/∂X, ∂B/∂Y, ∂B/∂Z) ⊆ Z[X, Y, Z]` contains `13^k`
times a power of the irrelevant ideal (resultant or Gröbner datum); likewise for `Q` with `2^k 13^l`. Smoothness modulo 17 and the count 20 are finite computations over `F_17`. (iv) Exact evaluation
of `Q` at the seven points, and of their reductions. (v) Finite computation over `F_17`: `∂Q/∂Y` vanishes
at `(1 : 1 : 1)`, and the points at `Z = 0` are `(1 : 1 : 0), (1 : 16 : 0); Q(X, Y, 0)` factors as stated
over `Q`.

Return the actual modular identification with `X_s(13)`, smooth projective quartic/good reduction at17, complete20-point special fibre and all chart data from ModularCurvesPartII §§9.5–9.6 and the supplied rational basis, invertible eigenbasis comparison and exact Sturm coefficient identities; the exact quartic identity and seven memberships are supporting.

**Checks.**

- `Q(P_i) = 0` for `i = 0, …, 6` (exact).
- `B(0,1,1)=−1` and `B(2,1,1)=−7`, testing the constant and cubic contributions.
- `B(1,1,1)=−1`: since every normalized conjugate begins with q, substitution of the
  conjugate eigenbasis gives leading term `−q⁴`; that basis cannot be the Baran coordinates.
- `det(A)≠0` and rational q-coefficients of the `h_i` certify the coordinate basis;
  the weight-eight vanishing threshold is 122, not merely the four initial coefficients.
- `#X(F_17) = 20`, so the trace of Frobenius on `H¹` is `17 + 1 − 20 = −2`.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.3, pp.929–930; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.3, p.930;
[BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.3,
p.929.)

*Needs:* ModularCurvesPartII §§9.5–9.6; Mathlib MvPolynomial; Mathlib `MvPolynomial.eval`; Mathlib `MvPolynomial.IsHomogeneous`.

### 6.19 The endomorphism algebra and Picard number of `J_s(13)`

Conditional on the explicit arithmetic-input hypotheses listed below, let `J := Jac(X_s(13))`. The
weight-two cusp forms for `Γ_0^+(169)` (that is, `S_2(Γ_0(169))^{w_169 = +1}`) form one Galois orbit
with coefficient field `K := Q(α) = Q(ζ_7)^+, α³ + 2α² − α − 1 = 0, f = q + αq² + (−α² − 2α)q³ + (α² − 2)q⁴ + (α² + 2α − 2)q⁵ + (−α − 1)q⁶ + ⋯`. `J` is Q-isogenous to the optimal quotient `A_f = J_0(169)/I_f, End(J) ⊗ Q ≅ K, J` is absolutely simple of dimension 3, and `ρ(J) := rk NS(J_Q̄) = 3`.
(Context, not used in the proofs: Chen's isogeny `Jac(X_s(ℓ)) ∼ Jac(X_0^+(ℓ²)) ∼ J_0(ℓ) × Jac(X_ns(ℓ))`, with `J_0(13) = 0`, explains why Mazur's method does not apply at ℓ `= 13.`)

Work under the following conditions. f has neither complex multiplication nor inner twists: a CM
newform of level `N` has CM field of discriminant dividing `N`, and no imaginary quadratic discriminant
divides 169; an inner twist of a trivial-character form is by a quadratic character, here `χ_13`, and
`f ⊗ χ_13 = f^σ` would give `σ(a_3) = a_3 (χ_13(3) = 1)`, hence `σ = id` since `a_3` generates `K`, and then
`a_2 = −a_2 (χ_13(2) = −1)`, contradicting `a_2 = α`. Assume the supplied newform-orbit identification,
Hecke action matrices, characteristic polynomials and de Rham comparison identities hold for the
actual Jacobian. General modular/isogeny theory is imported; generating the matrix table is not a
target.

The interface includes these statements.

- Supporting algebra only: A generated cubic field is not `End(J)⊗Q` or an NS-rank computation. The geometric application requires the hypotheses of this section.

For the proof, The newform orbit and q-expansion are an exact modular-symbols computation
(supplied geometric/Hecke data with exact identification hypotheses). `J ≅ Jac(X_0^+(169))` is
isogenous to the `w_169-invariant` part of `J_0(169)`, which is `A_f` because `S_2(Γ_0(169))^{+}` is spanned
by the conjugates of f (ModularCurvesPartII §16.2, ModularCurvesPartII §16.6,
ModularCurvesPartII §16.4: `dim A_f = [K : Q] = 3`). `End(A_f) ⊗ Q ≅ K` and `End_Q̄(A_f) ⊗ Q ≅ K`
for f without CM and inner twists (Shimura Th. `7.14`, Ribet Cor. `4.2`; the comparison target below), so `J` is
absolutely simple. `NS(J_Q̄) ⊗ Q` is the Rosati-fixed part of `End⁰(J_Q̄) = K`, which is all of `K` since
`K` is totally real and Rosati is positive; hence `ρ = 3`. Indeed, extend to
`K⊗R≅R³`. A nonidentity involution would exchange two real factors; a vector
with coordinates 1 and −1 on that pair gives negative `Tr(x x†)`, contradicting
positivity. Therefore Rosati fixes every factor and is the identity.

Construct the algebra isomorphism `End(J_s(13))⊗Q≃Q(ζ₇)^+`, prove no additional endomorphisms using the newform endomorphism comparison below, and identify Rosati-fixed NS rank3. The cubic field dimension helper alone does not prove this.

**Checks.**

- The cubic `t³+2t²−t−1` has no root modulo17 and hence is irreducible there. This supplies the residue-field inertness check once the actual coefficient field is identified.
- In `K⊗R≅R³`, exchanging two real embeddings makes `Tr(x x†)<0` for
  `x=(1,−1,0)`; such an involution cannot be Rosati.
- `ρ = 3 = r = g`, so `r < g + ρ − 1 = 5` and `X_s(13)(Q_p)_2` is finite (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8, BDMTV Theorem `2.3); g + ρ − 1 − r = 2` independent nice classes are available.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.1, pp.926–927; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.1,
p.887.)

*Needs:* ModularCurvesPartII §§13.1–13.4, `16.1–16.7`; §6.18.

Prove: for a normalized weight-two newform with
trivial character, no CM and no nontrivial inner twist, and its actual modular quotient `A_f, End_ℚ(A_f) ⊗ ℚ ≃ K_f` and `End_ℚ̄(A_f) ⊗ ℚ ≃ K_f`.
Retain the algebraic and geometric endomorphism fields and the Hecke quotient identification;
apply this theorem to the explicit level-169 form above. Its Rosati-fixed part gives the stated
Néron–Severi rank. Source: BDMTV (2019) §6.1, `pp.926–927`, using Shimura Theorem `7.14` and
Ribet Corollary `4.2` as cited there. *Needs:* ModularCurvesPartII §§16.1–16.7;
AbelianSchemesAndArithmeticModuli A3.9 (`Polarization.rosati`), A6.14
(`rosatiPositivity`), A6.15 (`rationalNSAmpleCone`), over `Qbar`;
JacobianChallenge Layer E for the principal theta polarization.

### 6.20 Exact analytic rank one for the conjugates of `f`

Conditional on the explicit arithmetic-input hypotheses listed below, for each of the three real
embeddings `σ` of `K = Q(α)`, the L-function of `f^σ` satisfies `L(f^σ, 1) = 0` and `L'(f^σ, 1) > 0.6`; hence
`ord_{s=1} L(f^σ, s) = 1` for every `σ`. The vanishing comes from the sign of the functional equation (f
is `w_169-invariant`, so the root number of `L(f^σ, s)` is −1); the derivative bound is a supplied
rational interval enclosure of `L'(f^σ, 1)` of width `< 10^(−100)` whose lower endpoint exceeds `0.6`.

Work under the following conditions. The functional equation of `L(f^σ, s)` with conductor 169 and the
Atkin–Lehner eigenvalue +1. For every stated conjugate of each newform, assume the displayed
rational enclosures of `L(f,1)`, L′(f,1), their error bounds, and the exact functional-equation signs.
Any exact vanishing comes from the sign/theory, never from a box containing0; a derivative enclosure
excluding0 proves nonvanishing. Proving a general L-value evaluator or generating the enclosure
table is not a target.

The interface includes these statements.

- For each actual conjugate L-function, an exact lower bound `L′(f^σ,1)>0.6` implies `L′(f^σ,1)≠0`. Together with analytic continuation and exact central vanishing, deduce order exactly1; enclosure production is not asserted.

For the proof, `f ∈ S_2(Γ_0(169))^{w_169 = +1}`; for weight two the root number is minus the
Atkin–Lehner eigenvalue, so `Λ(f^σ, 2 − s) = −Λ(f^σ, s)` and `L(f^σ, 1) = 0`. (BDMTV compute instead the
rational number `c L(f, 1)/Ω` exactly by Agashe–Stein; either route is exact.) Use the supplied
enclosures of the actual three derivatives, each of width `<10^(-100)` with lower endpoint `>0.6`. Their
correctness and identification with the L-functions are hypotheses; no series evaluator, coefficient
table or derivative enclosure is constructed here. The positive lower endpoint proves derivative
nonvanishing; combine exact central vanishing from the sign with analytic continuation to deduce a
simple zero.

Use the correct three conjugate newform L-functions, exact analytic continuation, central vanishing `L(f^σ,1)=0` and nonzero derivative enclosures. Conclude order of vanishing exactly1. Numerical enclosure, central vanishing and newform identity are separate exact inputs.

**Checks.**

- The three enclosures have lower endpoints `> 0.6` (BDMTV `p.927`).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
proof of Proposition 6.2, p.927.)

*Needs:* §6.19.

### 6.21 The Mordell–Weil rank of `J_s(13)` (BDMTV Proposition 6.2)

Under the explicit modular-identification, analytic-derivative and rank-one supplier hypotheses
below, `rk J(Q) = 3` for `J = Jac(X_s(13))`; moreover `Sha(J/Q)` is finite, and for a prime p inert in `K = Q(ζ_7)^+` (so that `K_p = K ⊗ Q_p` is a field) the p-adic logarithm `J(Q) ⊗ Q_p → H⁰(X_{Q_p}, Ω¹)^*` is
an isomorphism as soon as `log(AJ_b(P))` of one rational point `P` is nonzero; `p = 17` is inert (`17 ≡ 3`
mod 7 and 3 has order 3 in `(Z/7Z)^×/{±1}`), and xs13-equivariant-height-matrices verifies the
nonvanishing with P5. A second route, labelled conditional: three independent points `(§3.19)` and a
descent upper bound on the genus-three Jacobian (Bruin–Poonen–Stoll; Layer 3 does not construct descent
beyond genus two) whose supplied class-group input for a degree-28 field of discriminant `2⁴²·13¹²` is
exact only under the Generalised Riemann Hypothesis (Bruin–Poonen–Stoll).

Work under the following conditions. `J ∼ A_f` (xs13-endomorphism-algebra); `ord_{s=1} L(f^σ, s) = 1`
for all `σ` (xs13-analytic-rank-datum).

The interface includes these statements.

- Supporting algebra only: Restriction-of-scalars dimension does not establish Q-rank1 over the RM field. The geometric application requires the hypotheses of this section.

For the proof, apply the explicit modular rank-one hypothesis to each conjugate newform and the
supplied isogeny `J ∼ A_f` to obtain `rank J(Q)=3` and finite Sha. The genuine `K` action then makes
`J(Q)⊗Q` a one-dimensional K-vector space. At an inert prime `K_p` is a field and the target of the
`K_p-linear` logarithm is one-dimensional over `K_p`. An independently exact nonzero logarithm
therefore makes that linear map an isomorphism. The nonzero logarithm check needs only the point,
integration data and a nonzero coefficient enclosure; it does not depend on a height pairing already
constructed using the isomorphism. Finiteness of Sha gives the Selmer comparison in the corrected
AnabelianGeometryAndNonabelianChabauty §§6.1–6.8 version of Lemma `3.7`.

Import exact admissible modular rank-one `overQ` theorem: exhibit imaginary `quadraticK` satisfying Heegner/Kolyvagin hypotheses, twist factorization and nonvanishing, admissible Gross–Zagier trace and passage back `toQ`, so `dim_RM(J(Q)⊗Q)=1`. Combine the genuine cubic RM action and its degree3 to obtain rank3; the analytic datum alone does not supply this rank-over-Q implication.

**Checks.**

- The modular route uses the analytic datum and the explicit admissible rank-one hypothesis. The alternative descent route also carries its GRH hypothesis.
- For the cubic coefficient field K, the line `V = K` has rational dimension 3 by restriction of scalars.
- The plane `V = K²` has rational dimension 6; it fails the one-dimensional K-space hypothesis even though the coefficient field still has degree 3.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Proposition 6.2 and its proof, p.927; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), Remark 6.3,
p.927.)

*Needs:* §6.20; §6.19; the explicit modular rank-one hypotheses stated here; §3.19; §6.1.

### 6.22 The Tate classes `Z1, Z2` from the Hecke operators `T_7` and `T_11`

Conditional on the explicit arithmetic-input hypotheses listed below, in the basis `ω` of
§6.23a, let `A_q ∈ M_6(Q)` be the matrix of the Hecke operator `T_q` on `H¹_dR(X/Q) (q = 7, 11)`, obtained from the Eichler–Shimura relation `ι(a_q) = Fr_q + q Fr_q^(−1) (50)`, and `C` the
cup product matrix. Then `Z_q := (6A_q − tr(A_q) I_6) C^(−1)` are Z1 `(q = 7)` and Z2 `(q = 11)`, the
integer matrices with rows Z1: `(0, −976, −1104, 10, −6, 18), (976, 0, −816, −3, 1, 3)`, (1104, 816,
0, −3, 3, −11), `(−10, 3, 3, 0, 0, 0), (6, −1, −3, 0, 0, 0), (−18, −3, 11, 0, 0, 0)`; Z2: (0, 112,
−656, −6, 6, 6), `(−112, 0, −2576, 15, 9, 27), (656, 2576, 0, 3, 3, −3), (6, −15, −3, 0, 0, 0)`, (−6,
−9, −3, 0, 0, 0), `(−6, −27, 3, 0, 0, 0)`. They are linearly independent admissible Tate classes: (a)
holds because they are cycle classes of the trace-zero correspondences `6T_q − tr(T_q)` (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8), and
(b)–(d) are the exact checks: antisymmetric, zero lower-right `3 × 3` block, and `Z(0,3) + Z(1,4) + Z(2,5) = 0`.

Work under the following conditions. The basis `ω` is symplectic with `ω_0, ω_1, ω_2` holomorphic
(§6.23a). The matrices `A_q` are exact rational matrices (supplied
geometric/Hecke data with exact identification hypotheses). Assume the exact `T_7,T_11` matrices and
their identification with Hecke correspondences on the actual cohomology, including adjointness and
trace relations. Deduce the required Tate classes; do not target production of Hecke tables.

For the proof, use the supplied exact rational Hecke matrices and their actual cohomological
identifications. The imported special-fibre Eichler–Shimura theorem justifies the Frobenius
relation; exact rational reconstruction, Frobenius computation and Hecke-table generation are not
targets. `6T_q − tr(T_q)` is a symmetric trace-zero correspondence (`T_q` is self-adjoint for the cup
product and `J` is absolutely simple), nonzero by the displayed matrices, hence nice (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8, BDMTV Lemma `2.4` and §1.5); its cycle class is
`(6A_q − tr(A_q)I)C^(−1)` in tensor coordinates, so (a)–(d) hold. The checks (b)–(d) on the printed
integer matrices are exact: antisymmetry entrywise, the lower-right block is zero, and `10 + 1 − 11 = 0, −6 + 9 − 3 = 0`. Independence: the `(0,1)` and `(0,2)` entries `(−976, −1104)` and `(112, −656)` are not
proportional.

For the actual Q-curve `X_s(13)` identified with `xs13Quartic=0`, its Jacobian `J`, the actual symplectic de Rham basis of the first chart and actual Hecke correspondences T7,T11 defined `overQ`, certify their exact matrices A7,A11. The trace-zero symmetric `correspondences6T_q−tr(A_q)Id` have zero cup contraction; construct their actual tensor cycle classes `Z_q=(6A_q−tr(A_q)I)C⁻¹` and identify them entrywise with xs13Z1,xs13Z2. Prove these classes are nonzero, independent, in `Fil¹`, antisymmetric and cup-trivial and satisfy `F_pᵀZ_qF_p=pZ_q` after crystalline comparison at every prime of good reduction, in particular `p=17`. Exact Hecke reconstruction requires explicit supplied geometric/Hecke data bounds or q-expansion/duality certification; a finite p-adic approximation and the b–d checks alone do not supply `condition(a)`.

**Checks.**

- Z1 has entry `Z1(0,1)=−976` and Z2 has `Z2(0,1)=112`, so neither trace-zero class is zero.
- In genus one, `T₂=−2 Id` on `H¹(X₀(11))` has trace −4; the coefficient 6
  gives trace −16, while the coefficient `2g=2` gives the zero correspondence, excluded
  by the nonzero hypothesis. A scalar operator in genus three is likewise excluded.
- Z1 and Z2 satisfy (b)–(d) exactly `(admissibleTate_xs13_Z1)`.
- `6A_q − tr(A_q)I` has trace zero.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4, pp.930–931.)

*Needs:* §6.23a; §6.5; AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; ModularCurvesPartII §17.2; §6.19.

### 6.23a First chart of `X_s(13)`: the model and differential basis

Under the explicit arithmetic-data hypotheses below, on `Y = {Z ≠ 0} ⊂ {Q = 0}` with coordinates `x =`
`X/Z`, `y = Y/Z`, base point `b = P2 = (0, 0)` and `Q_y := ∂Q/∂y`, the six differentials `ω = (1, x, y, −160x⁴/3 + 736x³/3 − 16x²y/3 + 436x²/3 −` 440xy/3 `+ 68y²/3, −80x³/3 + 44x² −` 40xy/3 `+ 68y²/3 − 32, −16x²y + 28x² + 72xy − 4y² − 160x/3 + 272/3)·dx/Q_y` are of the second kind, the first three are
holomorphic, and their classes form a symplectic basis of `H¹_dR(X/Q)`; together with third-kind
differentials with quadratic numerators over `Q_y` they supply the differential and residue
parts of explicit-setup. The boundary `D = X ∖ Y`
is the divisor `Z = 0` (four points over `Q(√5)`), and `H⁰(X, O(2D))` has basis `1, x, y, x², xy, y²`.

Work under the following conditions. Use the modular model and smoothness of §6.18.
Supply the exact residues and cup products of the displayed differentials and the boundary
Laurent expansions, identified with the actual curve cohomology. These data are independent
of any Tate class or Hodge filtration of a mixed extension.

The interface includes these statements.

- The six displayed differentials have second-kind classes
  forming a symplectic de Rham basis, with the first three a basis of holomorphic forms;
  the boundary and third-kind complement have the stated residue comparison.
- `Q(x,y,1)` in `Q[x,y]`.
- The actual quotient `Q[x,y]/(Q(x,y,1))`.

For the proof, the plane-curve canonical-divisor formula of AlgebraicCurves Layer 10
makes the forms with linear numerator holomorphic. Use the supplied boundary expansions over `Q(√5)` to prove that the other
three forms have zero residues and that the cup matrix is `[[0,I],[-I,0]]`.
Its nonzero determinant proves independence, hence a basis in dimension six.
The same residue calculation identifies the third-kind complement after scalar extension;
the pole-order calculation gives the stated basis of `H⁰(X,O(2D))`.

**Checks.**

- At `P2=(0,0)`, `Q_y(P2)=−16`, so this point is in the first smooth affine chart.
- At infinity `Q(X,Y,0)=(Y²−X²)(Y²−5X²)` has the four distinct points
  `(1:±1:0),(1:±√5:0)` over `Q(√5)`, rather than four rational points.
- The cup matrix has determinant 1 and zero upper-left block; a zero cup matrix
  cannot establish a symplectic basis.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§4.1, p.909 and §6.4, pp.930–931.)

*Needs:* §6.18; AlgebraicCurves Layers 9–10 (residues and plane-curve canonical divisors);
PadicDifferentialEquationsAndRigidCohomology §RD.7.18; ColemanIntegration §L0.2.

### 6.23 First chart of `X_s(13)`: Hodge filtration data

Use the model, boundary, differential basis and coordinate ring of §6.23a and the
Tate classes Z1,Z2 of §6.22. The Hodge filtration data of `A_{Z1}, A_{Z2}` are `η_{Z1} = −(44x² + (148/3)`xy `+ 8y²)dx/Q_y, η_{Z2} = (−40x² + 148xy + 36y²)dx/Q_y, β_Fil,Z1 = (0, 0, 0, 0, 1/2, 1/2)ᵀ, β_Fil,Z2 = (0, 0, 0, 0`, −1/2,
−5/2)ᵀ, `γ_Fil,Z1 = 5y/6 + 3x/2, γ_Fil,Z2 =` −5y/6 − 15x/2.

Work under the following conditions. The basis and model of §6.23a; Z1, Z2 of
§6.22. Supply finite principal-part/Laurent coefficients at the four boundary points with
sufficient exact truncation, and their geometric identifications. The stated eta/beta/gamma
formulas are checked `against(30),(32)` from these inputs; producing a cohomology or
Laurent-coefficient table is not a target.

The interface includes these statements.

- Supporting algebra only: Base normalization and zero holomorphic part omit Laurent residue/regularity and basis checks. The geometric application requires the hypotheses of this section.
- The two printed gamma expressions mapped to the coordinate-ring quotient.

For the proof, apply the principal-part characterization of §6.9: residues at the four points of `D` give `η` by (30); the principal parts of
`g_x` and of `Ω_xᵀZNNᵀΩ_x` give `b_Fil` and `γ_Fil ∈ H⁰(X, O(2D))` by (32) with `γ_Fil(P2) = 0`. Data:
substitute the printed values into (30) and (32); both are identities of Laurent series over `Q(√5)`
truncated at the pole orders, checked exactly. `η_{Z2}` is the published value `(−40x² + 148xy + 36y²)dx/Q_y; arXiv` v1 printed `−(40x² + 148xy + 36y²)`; the exact check decides.

On the actual quotient `Q[x,y]/(Q(x,y,1))` and its function field, use the differential basis, cup product and boundary of §6.23a to certify the Laurent conditions on `η,β,γ` for Z1,Z2. The quotient relation is nonvacuous; elementary gamma/base checks are supporting only.

**Checks.**

- The affine quartic maps to zero in its own quotient.
- The first gamma class is nonzero in the quotient, so zero Hodge data cannot pass.
- The first gamma class is the image of 5y/6+3x/2 through the quotient map.
- `γ_Fil,Z1(P2) = γ_Fil,Z2(P2) = 0`.
- `β_Fil` has zero first three entries for both classes.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4, p.931; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6.4,
p.930.)

*Needs:* §6.9; §6.8; §6.22; §6.23a.

### 6.24 First chart of `X_s(13)`: Frobenius lift and the functions `θ_{Z_i}`

Given the following explicit Frobenius, cohomology and precision data at `p=17` on `U_1:=Y_F17∩{Q_y≠0}`,
the geometric Frobenius-structure and splitting formulas identify the supplied local series `θ_Z` with
`h_17(A_Z(P2,x))` for `Z=Z1,Z2` on every stated disc. The lift and coefficient tables are hypotheses,
rather than outputs of this construction. The derived height identity and propagated tail/error
bounds are the conclusion.

Work under the following conditions. Tuitman's Assumption 1 holds for the model `Q` at `17 (RD.7)`. The
splitting s of the Hodge filtration is K-equivariant (xs13-equivariant-height-matrices). Supply an
actual overconvergent Frobenius lift `Φ` with `Φ(x)=x^17, Q(x^17,Φ(y))=0` and `Φ(y)≡y^17 mod17; F∈M6(Q17)`
and f satisfying `Φ*ω=Fω+df` and `f(P2)=0`, with the finite coefficient enclosures and exact error/tail
inequalities used in the formulas. Include the cup-product and `Z_i` compatibility identities `FᵀCF=17C`
and `FᵀZ_iF=17Z_i`. Supply the exact finite F17-point list, its completeness check and chart partition
(20 total,17 in U1), so `trF=17+1−20` follows through the trace comparison. Supply the finite
primitive and Teichmüller evaluation data with identification/error hypotheses; no `RD.7`
instance-specific numerical tables are supplied.

The interface includes these statements.

- Input interface for the specified actual dagger lift `Φ`, its congruence and error data; this is a theorem parameter, with no claim to construct a numerical lift table.
- `Φ(y) ≡ y^17` modulo 17, and `Φ(y)` is the unique overconvergent solution of `Q(x^17, ·) = 0` with this congruence.
- `Φ(P2) =` P2.
- `Fᵀ C F = 17 C` for the cup product matrix `C`, and Fᵀ `Z_i F = 17 Z_i` for `i = 1, 2` (condition (a)).
- The height series assembled by the mathematical splitting/local-height formulas from supplied finite coefficients and tail hypotheses; prove their identification with `θ_Z` on each disc.
- `tr F = −2`.

For the proof, apply the imported rigid-cohomology/Frobenius comparison to the supplied data and
exact identities. Use `ED.0` precision propagation to transport the given errors; existence of a
general Tuitman implementation is not a premise. P2 `= (0, 0): Φ(x)(P2) = 0` and `Φ(y)(P2)` is the root
of `Q(0, Y) = Y(Y³ − 10Y² + 24Y − 16)` congruent to 0 modulo 17, which is 0 because `∂Q/∂Y(0, 0) = −16`
is a unit; so `Φ(P2) =` P2. Apply the three block identities `in(45)` to the supplied primitive and
Teichmüller evaluation data; deduce the `G_Z` identity and the splitting from
frobenius-structure-matrix and frobenius-equivariant-splitting. `θ_Z` on each disc: local-height-at-p,
with tiny integrals in the disc parameter; precision from height-series-valuation-bound.

Accept the actual dagger lift `Φ`, the `6×6` Frobenius matrix `F` and exact primitives `f_i` with `Φ*ω_i = Σ_j F_ij ω_j + df_i`, precision/tail inequalities, Teichmüller and cup/Z identities, and complete residue/chart data as explicit supplied-data hypotheses. Prove the geometric height, splitting and precision conclusions of this section. The lift and matrix tables are inputs with the displayed geometric identities.

**Checks.**

- `∂Q/∂Y` at `(0 : 0 : 1)` equals −16, a 17-adic unit, so the disc of P2 lies in `]U_1[`.
- `∂Q/∂Y` at `(1 : 1 : 1)` equals 0, so the disc of P0 is not in `]U_1[` and needs base-point-change.
- `tr F = 17 + 1 − #X(F_17) = −2`, agreeing with the point count of xs13-plane-model (Lefschetz trace formula).
- `Φ(y) = y^17` does not define a lift: at the point P1 `= (1/2, 1/2)` of `Y` one has `Q(t, t) = 16t(2t −` 1)(t − 1), so `Q(x^17, y^17)` evaluated at P1 is `Q(2^(−17), 2^(−17)) ≠ 0`, whereas a lift must satisfy `Q(Φ(x), Φ(y)) = 0`.
- `tr F = 17 + 1 − #X(F_17) = −2`.
- `θ_Z(P2) = 0` for both `Z`.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4, p.931.)

*Needs:* PadicDifferentialEquationsAndRigidCohomology §RD.7.18; §6.11; §6.12; §6.13; §6.15; §6.23; ColemanIntegration §L1.6.

### 6.25 Equivariant heights and the matrices `T_1, T_2` for `X_s(13)`

Conditional on the explicit arithmetic-input hypotheses listed below, let `a_3 := a_3(f) = −α² − 2α`,
a generator of `K`, and `ι(a_3)` the matrix of `T_3` on `H¹_dR(X)` (Eichler–Shimura); let s be a
K-equivariant splitting of the Hodge filtration, so that the global height h is K-equivariant (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8,
BDMTV Remark `3.9`), and `K_p := K ⊗ Q_17, E_K := H⁰(X_{Q_17}, Ω¹)^* ⊗_{K_p} H⁰(X_{Q_17}, Ω¹)^*`
(dimension 3 over `Q_17`). For `z ∈ X(Q_17)` and `Z ∈ {Z1, Z2}` put `E_1(z) := AJ_b(z)` and `E_{2,Z}(z) := E_Z(AJ_b(z)) + c_Z` (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8, BDMTV Lemma `3.7`). Then: `E_1(P5) ≠ 0`, so it generates `H⁰(Ω¹)^*` over the
field `K_p (17` is inert in `K`) and log : `J(Q) ⊗ Q_17 → H⁰(Ω¹)^*` is an isomorphism; the vectors
`E_1(P_k) ⊗_{K_p} E_{2,Z1}(P_k), k = 1, 3, 5`, form a `Q_17-basis` of `E_K` (exact by a nonzero
determinant computed to precision); with `ψ_1, ψ_2, ψ_3` the dual basis of `ι(a_3)^i(E_1(P5) ⊗ E_{2,Z1}(P5)), i = 0, 1, 2`, and `Ψ_j(Z, z) := ψ_j(E_1(z) ⊗_{K_p} E_{2,Z}(z))`, the `4 × 4` matrices
`T_i(x)` with first row `(θ_{Z_i}(x), Ψ_1(Z_i, x), Ψ_2(Z_i, x), Ψ_3(Z_i, x))` and rows `(θ_{Z1}(P_k), Ψ_1(Z1, P_k), Ψ_2(Z1, P_k), Ψ_3(Z1, P_k)), k = 1, 3, 5`, satisfy `det T_i(x) = 0` for every `x ∈ X(Q)`
(indeed on the set cut out by the pair `(θ_{Z_i}, {0})`). The relations `E_1(P_k) ⊗ E_{2,Z1}(P_k) = ι(c_k)(E_1(P5) ⊗ E_1(P5))` with `c_1 = 352 + 818α + 294α², c_3 = 162 + 406α + 150α², c_5 = −36 − 62α − 18α²` are explicit supplied data whose identities and determinant nonvanishing are verified in the
proof; their numerical production is outside this roadmap.

Work under the following conditions. `X_s(13)` has potentially good reduction everywhere, so the pairs
`(θ_Z, {0})` are quadratic Chabauty pairs (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8, BDMTV Corollary `3.8`; ModularCurvesPartII §11.8). `rk J(Q) = 3`
(xs13-rank-three). Assume the exact correspondence/Hecke matrices and identifications with the
actual geometric maps; Frobenius, Hodge and local-height data must satisfy the displayed
matrix/precision identities. Computing their tables is not a target.

For the proof, `E_1(P_k), E_{2,Z}(P_k)` are the extension classes `π_1, π_2` of `A_Z(b, P_k)`, read off
from the Hodge and Frobenius data at `P_k` (local-height-at-p data and (13)); they are computed to
exact precision. A p-adic number known modulo `17^N` with valuation `< N` is nonzero; this certifies
`E_1(P5) ≠ 0` and the nonvanishing of the `3 × 3` determinant of the three vectors in `E_K`.
K-equivariance of h means h is determined by its values on `E_K`, a 3-dimensional space with basis
`ψ_j-dual`; the global height pairing `B = h` is the same for Z1 and Z2, so every row (for any `Z` and any
rational point) satisfies the same linear relation `θ_Z(z) = Σ_j h_j Ψ_j(Z, z)`; hence `det T_i`
vanishes at rational points (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8, BDMTV Lemma `1.5`). The rows of `T_2` use Z1 at P1, P3, P5
deliberately: the pairing is common to both classes.

Certify the actual `E₁(P5)` p-adic log vector, inert cubic coefficient field at17, correspondence action, height pairing and determinant. It is already a log vector; do not reject it because some global class could be torsion.

**Checks.**

- `det T_1` vanishes at P1, P2, P3, P5 by construction (rows repeated or zero first row at the base point); the vanishing of `det T_2` at P1, P3, P5 is a nontrivial consistency check (Remark `6.9`).
- `arXiv` v1 used P4 in place of P5; the published version uses P5 (P4 is not in the first chart).

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4.1, p.932.)

*Needs:* AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; §6.13; §6.24; §6.21; §6.19; ModularCurvesPartII §11.8; §4.2.

### 6.26 Rational points of `X_s(13)` on the first chart `]U_1[`

Under the explicit finite-data hypotheses below, on each of the 17 residue discs of `]U_1[ ⊂ X(Q_17)`,
all zeros of `det T_1` and of `det T_2` are simple, and the only common zeros are P1, P2, P3 and P5.
Hence `X_s(13)(Q) ∩ ]U_1[ = {P1, P2, P3, P5}`.

Work under the following conditions. The matrices `T_1, T_2` of xs13-equivariant-height-matrices with
power-series entries exact on each disc. Supply the finite Taylor coefficient enclosures for
each determinant on every stated disc, strict tail bounds, finite subdivisions, polynomial
root/isolation witnesses, simple-root Hensel inequalities and nonvanishing witnesses for the second
determinant on rejected balls. Supply exact memberships for the named rational points and the
complete local cover. The conditions verifies these finite assertions; neither the global point set
nor completeness of common zeros is an input hypothesis. Mere `O(17^5)` coefficient notation without
tail bounds is insufficient.

For the proof, For each disc, the root perturbation theorem of §6.16 applied to `det T_1` (with the valuation
bounds of height-series-valuation-bound) isolates its zeros in balls containing exactly one zero
each, giving a qc-disc-datum for the pair `(det T_1, det T_2)`. Each ball containing one of P1,
P2, P3, P5 is matched (`det T_1` vanishes there by construction, `det T_2` by the check of Remark `6.9`).
Every other ball is excluded: `det T_2` is exact nonzero on it (its value or leading coefficient
is a 17-adic number of valuation below the working precision), so it contains no common zero, hence
no rational point. Apply qc-datum-sound and padic-candidate-comparison on `]U_1[`.

Given the actual geometric matrices/functions and the finite coefficient, strict-tail, subdivision and root/Hensel/nonvanishing data specified in this section, check every disc and derive the complete common-zero set. Distinguish the affine domain excluding zeros of `Q_y` and its complement. The input is finite data with identified series, never an assertion that the common-zero set or `X(Q)` is already complete; producing the tables is outside this roadmap.

**Checks.**

- The zero tables of `det T_1, det T_2` on `]U_1[` (authors' repository) are the datum data; their finite witnesses are checked with exact precision.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.4.1, p.933.)

*Needs:* §6.25; §6.3; §6.4; §6.16; §6.2.

### 6.27 Rational points of `X_s(13)` on the second chart `]U_2[`

Under the explicit finite-data hypotheses below, on the affine chart `Y' = {X ≠ 0}` with coordinates `u = Z/X, v = Y/X` (the model `Q(1, v, u) = 0` is monic in `v`), base point `b = P6 = (u, v) = (0, −1)`, a
basis of differentials satisfying explicit-setup on `Y'` and cohomologous to `ω` (so `Z1` and `Z2` are
unchanged), and Tuitman's Frobenius lift with `Φ(u) = u^17` on a strict neighbourhood of `]U_2[, U_2 := Y'_{F_17} ∩ {∂Q/∂v ≠ 0}`, with `P6` Teichmüller: on the residue discs of `(1 : 1 : 0)` and `(1 : −1 : 0)`,
all zeros of `det T_1'(u)` and `det T_2'(u)` are simple (`det T_2'(u)`, not the printed `det T_2(u')`)
and the only common zeros are `(u, v) = (0, 1) = P4` and `(0, −1) = P6`, to precision `O(17⁵)`. Hence
`X_s(13)(Q) ∩ (](1:1:0)[ ∪ ](1:−1:0)[) = {P4, P6}`.

Work under the following conditions. The second-chart basis and its cohomology relation with `ω` are
part of the datum (they are given in the authors' repository, not printed). Supply the finite
Taylor coefficient enclosures for each determinant on every stated disc, strict tail bounds, finite
subdivisions, polynomial root/isolation witnesses, simple-root Hensel inequalities and nonvanishing
witnesses for the second determinant on rejected balls. Supply exact memberships for the named
rational points and the complete local cover. The conditions verifies these finite assertions;
neither the global point set nor completeness of common zeros is an input hypothesis. Mere `O(17^5)`
coefficient notation without tail bounds is insufficient. Supply the actual second-chart
differential basis, change-of-basis/cohomology identities, lift `Φ` and its congruence, F/f data,
precision bounds, cup-product/correspondence identities and Teichmüller evaluations. These
instance-specific data are explicit hypotheses.

For the proof, apply the principal-part characterization of §6.9 and frobenius-structure-matrix as mathematical
identities to the supplied second-chart cohomology and Frobenius data; transport the heights by the
given cohomology relation. Do not generate Frobenius tables. On the two discs, certify the zeros
with the root perturbation theorem of §6.16 and match `(0, ±1)` with P4, P6; exclude the other balls by
nonvanishing of the second determinant. Only the discs of `(1 : 1 : 0), (1 : −1 : 0)` and `(1 : 1 : 1)`
are not in `]U_1[` (xs13-plane-model (v)); the first two lie in `]U_2[`.

Given the actual second-chart coordinate change, smoothness/model identifications, Frobenius/height series, coefficient/error bounds and finite disc data specified in this section, verify overlap agreement and every local root/exclusion check to deduce the two-point set. These data are explicit hypotheses; global completeness and a mathematical complete output are not hypotheses. Table production is outside this roadmap.

**Checks.**

- `(1 : 1 : 0)` and `(1 : −1 : 0)` lie in `U_2; (1 : 1 : 1)` lies in neither `U_1` nor `U_2`.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.5, p.933.)

*Needs:* §6.26; §6.9; §6.11; §6.4; §6.16; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; §6.18.

### 6.28 The residue disc of `P0 = (1 : 1 : 1)`

Under the explicit finite-data hypotheses below, on the residue disc ]`(1 : 1 : 1)`[, where neither
Frobenius lift is defined, the local heights of `A_Z(P0, x)` for x in the disc are computed by
base-point-change with b' `=` P0 from the single Coleman integrals `∫_{P2}^{P0} ω` (supplied with their
identification and error bounds; these numerical integrals are explicit hypotheses) and tiny integrals in
the disc. For both Z1 and Z2 the only root of the resulting power series on the disc is P0, and it
is simple. Hence `X_s(13)(Q) ∩ ](1 : 1 : 1)[ = {P0}`.

Work under the following conditions. No basis differential has a pole on ]`(1:1:1)`[ (needed by
base-point-change). Supply the finite Taylor coefficient enclosures for each determinant on every
stated disc, strict tail bounds, finite subdivisions, polynomial root/isolation witnesses,
simple-root Hensel inequalities and nonvanishing witnesses for the second determinant on rejected
balls. Supply exact memberships for the named rational points and the complete local cover. The exact
conditions verifies these finite assertions; neither the global point set nor completeness of common
zeros is an input hypothesis. Mere `O(17^5)` coefficient notation without tail bounds is insufficient.
Supply the actual six Coleman integrals `∫_{P2}^{P0}ω` with rational p-adic coefficient enclosures,
identification with the named integrals, and sufficient precision after any ramification/pivot
losses. Supply the base-point-change matrices and checked identities `at(P0,P0)`. The general Coleman
theory is imported, but this table is an input.

For the proof, `X(Q_p)_U` does not depend on the base point; with base point P0, Lemma `5.7` gives the
Frobenius structure at `(P0, P0)` from `β_φ(P2, P2)` and `∫_{P2}^{P0} ω`, and (48) gives the Hodge data.
Transport the supplied integral enclosures through `Lemma5.7/(48)` using `ED.0` precision propagation
and the imported Coleman identities. Numerical overconvergent evaluation over ramified fields is not
targeted. the root perturbation theorem of §6.16 shows each function has exactly one simple root on the disc,
at P0; this ball is matched by P0.

Given the actual six Coleman integrals at P0 with their identification, ramification-adjusted error bounds, base-point-change identities and finite coefficient/tail/root data specified in this section, propagate precision and check the disc to derive the unique common-zero verdict. Producing the ramified-extension integral table is outside this roadmap; its mathematical identification and sufficient error bounds remain explicit hypotheses.

**Checks.**

- P0 is matched; there is no other candidate on the disc.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
§6.6, p.934.)

*Needs:* §6.14; §6.24; §6.16; §6.4; PadicDifferentialEquationsAndRigidCohomology §RD.7.18; ColemanIntegration §L1.19.

### 6.29 The rational points of `X_s(13)` (BDMTV Theorem 1.1)

Conditional on the explicit arithmetic/datum inputs below, `x_s(13)(Q)` consists of exactly
seven points: in the model `Q = 0` of xs13-plane-model they are P0 `= (1 : 1 : 1), P1 = (1 : 1 : 2)`, P2
`= (0 : 0 : 1), P3 = (−3 : 3 : 2), P4 = (1 : 1 : 0), P5 = (0 : 2 : 1), P6 = (−1 : 1 : 0)`, and
completeness is deduced from the checked disc data. Under the moduli interpretation these
are the rational cusp and six CM points, with CM by the imaginary quadratic orders of class number
one in which 13 splits (discriminants −3, −4, −12, −16, −27, −43; j-invariants 0, 1728, 54000,
287496, −12288000, −884736000).

Work under the following conditions. `rk J(Q) = 3 = g, ρ = 3` (xs13-rank-three,
xs13-endomorphism-algebra). Good reduction away from 13 (xs13-plane-model (iii)) and potentially
good reduction at 13 (ModularCurvesPartII §11.8), so all local heights away from 17 vanish (AnabelianGeometryAndNonabelianChabauty §§6.1–6.8). Assume all concrete
model/modular-identification, Hecke, analytic-continuation/sign/derivative, Frobenius, integral and
local coefficient/error/tail inputs in xs13-plane-model through the three chart-datum nodes.
The finite F17 list and chart cover are supplied with exact correctness/completeness hypotheses. The
finite disc trees are checked here, so completeness of `X(Q)` is a conclusion. CM j-values and
their modular identifications are supplied separately.

For the proof, By xs13-plane-model `(v), X(F_17)` has 20 points: 17 discs in `]U_1[`, the discs of
`(1:1:0)` and `(1:−1:0)` in `]U_2[`, and the disc of `(1:1:1)`. xs13-first-chart-points,
xs13-second-chart-points and xs13-p0-disc give `X(Q) ∩` (each disc) `⊆ {P0, …, P6}` with each `P_i` in its
own disc; the `P_i` are rational (xs13-plane-model (iv)). padic-candidate-comparison (all balls
matched or excluded) gives `X(Q) = {P0, …, P6}` conditional on the stated finite arithmetic inputs.
Moduli identification: `X_s(13)` has a rational cusp (ModularCurvesPartII §9.5); for each of the six discriminants `D`, a
CM curve E/Q with `End(E_Q̄) ≅ O_D` has `ρ_{E,13}(G_Q)` in a split Cartan normaliser (the shared CM
residual-Cartan application hypothesis, 13 split and prime to `D`), giving a rational point above `j(O_D)`
(ModularCurvesPartII §9.7 criterion for `j ≠ 0, 1728`; the fibres above `j = 0, 1728` are supplied by ModularCurvesPartII §9.7); these seven
points have distinct j-values, so they are the seven points of `X(Q)`.

On `X_s(13)(Q)=Hom_Q(Spec Q,X_s(13))`, use ModularCurvesPartII §9.5 and §6.18’s supplied modular-model isomorphism to the smooth projective quartic `xs13Quartic=0` in `P²_Q`. Let `P_i` be the projective classes of `xs13Points(i), i=0,…,6`. Prove `X_s(13)(Q)={P_i}`, with all seven distinct, by the actual seventeen first-chart discs, two second-chart discs and P0 disc at17, using the named geometric comparison results. Through the actual modular j-map the set is one cusp and six CM points of discriminants−3,−4,−12,−16,−27,−43 and j-values0,1728,54000,287496,−12288000,−884736000. Require the `j=0,1728` special-fibre moduli comparisons; no point-by-point matching of `P_i` to discriminants is claimed without the explicit j-map. The roadmap theorem retains the conjunction of its explicit rank/model/path/coefficient/error hypotheses. It proves completeness from the checked disc data; it does not target production of these inputs or assume completeness of the answer. The arbitrary three-set union lemma is only the assembly argument.

**Checks.**

- `#X_s(13)(Q) = 7`.
- Galbraith and Baran found the seven points by a search up to a large height bound; the theorem proves there are no others.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Theorem 1.1, p.888; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.1,
p.888.)

*Needs:* §6.26; §6.27; §6.28; §6.18; §6.21; §6.2; §6.1; ModularCurvesPartII §§9.5–9.6; ModularCurvesPartII §11.8; the shared CM application hypotheses under Exact supplier contracts; ModularCurvesPartII §9.7.

### 6.30 Existence of non-CM split-Cartan images for `ℓ = 2, 3, 5, 7`

Under the stated geometric supplier hypotheses and the explicit arithmetic inputs of every
prerequisite application, for ℓ `∈ {2, 3, 5, 7}` there are infinitely many `j ∈ Q` such that an elliptic
curve E/Q with `j(E) = j` has no CM and `ρ_{E,ℓ}(G_Q)` is contained in the normaliser `C_s^+(ℓ)` of a
split Cartan subgroup of `GL_2(F_ℓ)`.

**Small-level genera.** Prove that the genera of `X₀(4)`,
`X₀(9)`, `X₀(25)`, `X₀(49)` over `Q` are respectively `0,0,0,1`.
Use the actual modular curves, their complex comparison and cusp ramification from
ModularCurvesPartII §§5.11, 6.1–6.2. Compute their finite coset actions and apply
Riemann–Hurwitz to the j-map. For these four levels the data
`(μ,ν₂,ν₃,ν_∞)` are `(6,0,0,3)`, `(12,0,0,4)`, `(30,2,0,6)`, `(56,0,2,8)`;
`g=1+μ/12−ν₂/4−ν₃/3−ν_∞/2`. Here μ is the index of `Γ₀(N)`, ν₂ and ν₃
count its elliptic points, and ν_∞ counts geometric cusps. Establish these data by
enumerating primitive pairs modulo units in `P¹(Z/NZ)`, its order-two and order-three stabilizers and cusp orbits;
use `ν_∞=Σ_{d|N}φ(gcd(d,N/d))`. The orbit calculations and Riemann–Hurwitz
substitution are part of this target.
Source: Diamond–Shurman, *A First Course in Modular Forms*, §3.1, Theorem 3.1.1;
AlgebraicCurves Layer 7 supplies Riemann–Hurwitz.
*Needs:* ModularCurvesPartII §§5.11, 6.1–6.2; AlgebraicCurves Layer 7.

**Checks.**

- At level 4 the index 6 and three cusps give `g=1+6/12−3/2=0`.
- At level 25 the two order-two elliptic points contribute `2/4`, giving genus zero.
- At level 49 the two order-three elliptic points and eight cusps give
  `g=1+56/12−2/3−8/2=1`.

**Fricke fixed points at level 49.** Prove that on the
geometric curve `X₀(49)_Qbar`, the fixed locus of `w₄₉` has four points, each
with ramification index two in the quotient. Use the Fricke map of
ModularCurvesPartII §9.4 and its complex comparison: `τ=i/7` is fixed by
`τ↦−1/(49τ)`. The involution is nonidentity since it exchanges cusps 0 and ∞.
The finite algebraic fixed locus is therefore nonempty over `Qbar`. Choose one
of its points as origin on this genus-one curve. A pointed
curve automorphism is a group automorphism; its endomorphism u satisfies
`(u−1)(u+1)=0`. Nonzero elliptic endomorphisms are isogenies and their composite
is nonzero, so `u=−1`. Its fixed locus is geometric 2-torsion, of cardinality
four in characteristic zero; relative to any other origin these fixed points
form a translate of geometric 2-torsion.
Source: Silverman, *The Arithmetic of Elliptic Curves*, III.4, Theorem 4.8 and
III.6, Corollary 6.4 (pointed morphisms and multiplication degrees).
*Needs:* the small-level genera above; ModularCurvesPartII §§6.1, 9.4;
EllipticCurves Layers 1–2; JacobianChallenge Layer E (multiplication degree and étaleness).

**Checks.**

- `−1/(49·(i/7))=i/7` supplies a fixed geometric point.
- At level 49 the four simple fixed points give `0=2(2g'−2)+4`, so `g'=0`.
- A translation by a nonzero 2-torsion point is a fixed-point-free involution on
  a genus-one curve; the existence of the Fricke fixed point is essential.

Work under the following conditions. `X_s(ℓ) ≅ X_0^+(ℓ²)` over `Q` (ModularCurvesPartII §9.5) and
the rational-point criterion for `X_H` with `−I∈H` (ModularCurvesPartII §9.7).

For the proof, Genus zero: `X_0(4), X_0(9), X_0(25)` have genus 0, so their quotients `X_0^+(ℓ²) do`;
`X_0(49)` has genus `1 (μ = 56, ν_2 = 0, ν_3 = 2, ν_∞ = 8, g = 1 +` 56/12 − 2/3 − 4) and `w_49` has
`4` geometric fixed points, so Riemann–Hurwitz `0 = 2(2g' − 2) + 4` gives g' `= 0`
by the small-level genera and the fixed-point count above. The cusps 0 and `∞` of `X_0(ℓ²)` are rational and swapped by `w_{ℓ²}`, so their common
image is a rational point of `X_s(ℓ)`; a genus-zero curve with a rational point is isomorphic to `P¹_Q`.
The j-map `X_s(ℓ) → X(1)` is a nonconstant morphism over `Q` with a pole at that cusp; for a prime q,
rational points t q-adically close to the cusp satisfy `v_q(j(t)) < 0`, and there are infinitely many
such t with pairwise distinct `j(t)` (the fibres are finite). CM j-invariants are algebraic integers
(the shared CM application hypothesis), so a non-integral rational j is not CM and is `≠ 0, 1728`; the rational-point
criterion (ModularCurvesPartII §9.7) gives E/Q with `j(E) = j(t)` and image in `C_s^+(ℓ)` (no twist is needed since −I `∈ C_s^+(ℓ)`).

**Checks.**

- ℓ `= 7` uses the genus-one curve `X_0(49)` and the four fixed points of `w_49`.
- The argument does not use the classification of class-number-one orders.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Theorem 1.2, p.888; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §6, p.926.)

*Needs:* the small-level genera and the fixed-point count of §6.30; ModularCurvesPartII §§9.5–9.7; the shared CM application hypotheses under Exact supplier contracts.

### 6.31 The split Cartan case of Serre's uniformity question (BDMTV Theorem 1.2)

Under the stated geometric supplier hypotheses and the explicit arithmetic inputs of every
prerequisite application, the set of primes ℓ for which there is an elliptic curve E/Q without CM
with `ρ_{E,ℓ}(G_Q)` contained in the normaliser of a split Cartan subgroup of `GL_2(F_ℓ)` is `{2, 3, 5,`
`7}`. The case ℓ `> 7, ℓ ≠ 13` is the theorem of Bilu–Parent–Rebolledo (`X_s(ℓ)(Q)` consists of cusps and
CM points), an imported input with no owning roadmap (explicit hypothesis); ℓ `= 13` is
xs13-rational-points; ℓ `≤ 7` is small-prime-split-cartan.

Work under the following conditions. Bilu–Parent–Rebolledo [BPR13] for ℓ `> 7, ℓ ≠ 13`.

For the proof, ℓ `∈ {2, 3, 5, 7}`: small-prime-split-cartan. ℓ `= 13`: a non-CM E/Q with image in
`C_s^+(13)` has `j(E) ∉ {0, 1728}` and gives a non-cuspidal point of `X_s(13)(Q)` with non-CM j (ModularCurvesPartII §9.7
criterion); by xs13-rational-points every point of `X_s(13)(Q)` is a cusp or a CM point, a
contradiction. ℓ `= 11` and ℓ `≥ 17`: Bilu–Parent–Rebolledo, BPR13 (Mazur's method applies since `J_0(ℓ) ≠ 0`, with Runge's method); an explicit input hypothesis.

**Checks.**

- The answer set `{2, 3, 5, 7}` is exact: existence below 11, nonexistence above 7.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Theorem 1.2, p.888; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.1,
p.887.)

*Needs:* §6.30; §6.29; ModularCurvesPartII §9.7.

### 6.32 The rational points of `X_ns(13)` (BDMTV Corollary 1.3)

Under the stated geometric supplier hypotheses and the explicit arithmetic inputs of every
prerequisite application, `x_ns(13) ≅ X_s(13)` over `Q` (Baran), so `#X_ns(13)(Q) = 7`, and all seven
points are CM: they are the points above `j(O_D)` for the class-number-one discriminants `D ∈ {−7, −8, −11, −19, −28, −67, −163}`, exactly those in which 13 is inert. No modular interpretation of Baran's
isomorphism is used.

Work under the following conditions. Baran's isomorphism, exact by explicit plane quartic models
of both curves and a matrix `M ∈ GL_3(Q)`, together with `c ∈ Q×` and an exact coefficient check
`Q_ns` ∘ `M = c · Q_s`. The two model identifications and this coordinate change are explicit inputs
to this application.

For the proof, Baran's isomorphism transports xs13-rational-points: `#X_ns(13)(Q) = 7`. For each of
the seven discriminants, 13 is inert in `O_D` and prime to `D`, so a CM curve E/Q with `End(E_Q̄) ≅ O_D`
has `ρ_{E,13}(G_Q)` in a non-split Cartan normaliser (the shared CM residual-Cartan application hypothesis);
`j(O_D) ∉ {0, 1728}`, so the criterion (ModularCurvesPartII §9.7) gives a rational point of `X_ns(13)` above `j(O_D)`. The
seven j-values are distinct, so these seven points are all of `X_ns(13)(Q)`.

For the actual modular Q-curve `X_ns(13)` and its rational-point carrier `Hom_Q(SpecQ,X_ns(13))`, construct Baran’s Q-isomorphism to `X_s(13)` from the exact two quartic models and projective `GL3(Q)` coordinate change. Transport the seven-point theorem to get `#X_ns(13)(Q)=7`. Through its own modular j-map, independently construct the seven CM points above discriminants−7,−8,−11,−19,−28,−67,−163; prove their distinctness and exhaustiveness. These have j-values−3375,8000,−32768,−884736,16581375,−147197952000,−262537412640768000 respectively. Do not give Baran’s isomorphism a modular interpretation or assert it preserves j. The unconstructed `X_ns` quartic/map and CM/moduli comparison remain supplier obligations, not an arbitrary finite-type equivalence hypothesis.

**Checks.**

- The discriminants with 13 split are −3, −4, −12, −16, −27, −43; with 13 inert −7, −8, −11, −19, −28, −67, −163; `6 + 7 = 13` class-number-one orders.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Corollary 1.3, p.888; [BDMTV
(2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf), §1.1, (1),
p.888.)

*Needs:* §6.29; ModularCurvesPartII §§9.6–9.7; the shared CM application hypotheses under Exact supplier contracts.

### 6.33 Class number one from `X_ns(13)` (BDMTV Remark 1.4)

Conditional on the explicit arithmetic-input hypotheses listed below, the imaginary quadratic fields
of class number one are `Q(√−d)` for `d ∈ {1, 2, 3, 7, 11, 19, 43, 67, 163}`; equivalently their
discriminants are −3, −4, −7, −8, −11, −19, −43, −67, −163.

Work under the following conditions. nonsplit-cartan-13; class numbers of imaginary quadratic fields
with `|D| ≤ 52` are exact (explicit supplied class/unit/factorization data). The class-number
values, complete imaginary-quadratic discriminant list and CM identification data used here are
explicit hypotheses, with exact statements for each discriminant. No class-number table computation
is a target.

For the proof, Let `K` have discriminant `D` with `h(K) = 1` and `|D| > 52`. Every rational prime ℓ `< |D|`/4
is inert in `K`: a split or ramified ℓ would give a principal ideal of norm ℓ, generated by (a `+ b√D)/2` with `(a² + |D|b²)/4 =` ℓ, forcing `b = 0` and then `a² =` 4ℓ, impossible. In particular 13 is
inert. `j(O_K) ∈ Q` (class number one) and a CM curve E/Q with `End(E_Q̄) ≅ O_K` has image in a
non-split Cartan normaliser at 13 (the shared CM residual-Cartan application hypothesis), with `j ≠ 0, 1728`; it
gives a rational point of `X_ns(13)` (ModularCurvesPartII §9.7), so by nonsplit-cartan-13, `D ∈ {−7, −8, −11, −19, −28, −67, −163}`; with `|D| > 52` and `D` fundamental this leaves −67 and −163. For `|D| ≤ 52` a finite
exact class-number computation gives −3, −4, −7, −8, −11, −19, −43, and the same computation
certifies `h(−67) = h(−163) = 1` (explicit supplied class/unit/factorization data).

**Checks.**

- The argument recovers `d = 67` and `d = 163` from Corollary `1.3` and the small cases from a finite computation.

([BDMTV (2019)](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf),
Remark 1.4, p.888.)

*Needs:* §6.32; the shared CM application hypotheses under Exact supplier contracts; ModularCurvesPartII §§9.6–9.7.

### 6.34 The rational points of the exceptional curve `X_S4(13)` (BDMTV 2021 Theorem 1.1)

Conditional on the explicit arithmetic/datum inputs below, let `X = X_S4(13)`, with canonical
model `4x³y − 3x²y² + 3xy³ − x³z + 16x²yz − 11xy²z + 5y³z + 3x²z² + 9xyz² + y²z² + xz³ + 2yz³ = 0`
(Banwait–Cremona). Then `X(Q) = {(1 : 3 : −2), (0 : 0 : 1), (0 : 1 : 0), (1 : 0 : 0)}`; the point (0 :
0 : 1) is CM with discriminant −3, and the other three are exceptional (non-CM curves with
projective mod-13 image `S_4`, j-invariants `2⁴·5·13⁴·17³/3¹³, −2¹²·5³·11·13⁴/3¹³` and
`2¹⁸·3³·13⁴·127³·139³·157³·283³·929/(5¹³·61¹³)`). Data: `J(X)` is isogenous to `J_s(13)`, hence
absolutely simple of rank 3 with `ρ = 3; X` has potentially good reduction at 13, so the local heights
away from p vanish; quadratic Chabauty at `p = 11` on the two affine patches printed in BDMTV 2021
§5.1, with Z1, Z2 built from `T_11` and `T_11²`, the height pairing solved from the four known points
with Z1; the common zeros of the two functions are exactly the four points.

Work under the following conditions. The isogeny `J(X_S4(13)) ∼ J_s(13)` and potential good reduction
at 13. `T_11` generates the Hecke algebra (checked on `X_s(13)`). Supply the exact modular-model
identification, Hecke matrices and correspondence/cohomology identities, rank-overQ inputs,
local-height-vanishing geometry, two affine charts with complete residue coverage, Frobenius/Hodge
data and determinant coefficients, strict tails and finite root/Hensel/exclusion witnesses at11.
Supply the j/CM dictionary for the displayed points. The conditions proves the four-point completeness
from these finite inputs; it never takes that completeness as a hypothesis.

For the proof, Rank and endomorphisms transfer along the isogeny from xs13-rank-three and
xs13-endomorphism-algebra. Apply the QC conditions on the two supplied patches at11, verify all
local/root/tail witnesses, and deduce that its accepted points are exactly the four listed points. A
target to generate the arithmetic tables is not introduced. Z2 is not used to solve for the height
pairing, so the vanishing of its function at the four points is an independent check.
padic-candidate-comparison converts the output into the exact solution set.

For the actual modular curve `X_S4(13)`, identified with the smooth projective quartic `xS4_13Quartic=0`, prove its Q-points are exactly the four projective classes `xS4_13Points: (1:3:−2),(0:0:1),(0:1:0),(1:0:0)`. The `point(0:0:1)` is CM of discriminant−3; the other three have projective mod13 `imageS4`, with the three j-values stated in this section. Inputs to the proof are the genuine isogeny to `J_s(13)`, potential-good-reduction result, actual two affine patches from `BDMTVv4§5.1p26, p=11,T11 andT11²` classes, four-point height pairing, and exact complete common-zero/matching tables on every disc. The roadmap theorem retains the conjunction of its explicit model/rank/Frobenius/coefficient/error hypotheses and deduces completeness by checking the exact finite data. Producing those tables is outside this roadmap; the geometric identifications are explicit hypotheses. An arbitrary QCRun whose result is already assumed complete is not the application.

**Checks.**

- `#X_S4(13)(Q) = 4`, the four points satisfy the model equation exactly.

([BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Theorem 1.1, p.2 (arXiv v4); [BDMTV
(arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), §5.1, p.26 (arXiv v4).)

*Needs:* §6.17; §6.4; §6.2; §6.21; §6.1; ModularCurvesPartII §§9.6–9.7.

### 6.35 Rational points on the genus-three curves `X_0^+(N), N` prime (BDMTV 2021 Theorem 5.6)

Conditional on the explicit arithmetic-input hypotheses listed below, for the primes `N` with
`g(X_0^+(N)) = 3`, namely `N ∈ {97, 109, 113, 127, 139, 149, 151, 179, 239}`, the rational points of
`X_0^+(N)` are the cusp and the CM points listed in BDMTV 2021 Examples `5.7–5.15`; in particular there
are no exceptional rational points. For `N = 97`, with the model `zx³ + (−y² + zy)x² + (−y³ − zy² − z³)x + (zy³ + z²y²) = 0, X_0^+(97)(Q) = {(1:0:0), (−2:1:1), (−1:0:1), (0:0:1), (0:1:0), (0:−1:1),`
`(1:0:1), (1:1:1), (−1:1:0), (5:3:2)}` (the cusp and CM points of discriminants −3, −4, −8, −11, −12,
−16, −27, −43, −163). Data per `N`: a prime p (5, 29, 17, 11, 19, 11, 19, 17, 13 respectively),
analytic rank g for the newform orbit (the modular rank-one hypotheses give rank g), absolute
simplicity, trivial local heights at `N` (deduced from the supplied regular proper semistable `Z_N` model
with geometrically irreducible special fibre, the actual generic-fibre identification
and normalized local-height factorization through component reduction), two independent cycles, height pairing from the known points, and common zero set equal to
the known points. Exact model and ordered point/CM data for every listed level: `N=97, p=5`:
`Q_N=zx³+(−y²+zy)x²+(−y³−zy²−z³)x+zy³+z²y²=0`; ordered points
`(1:0:0)`,(-2:1:1),(-1:0:1),`(0:0:1),(0:1:0)`,(0:-1:1),`(1:0:1),(1:1:1)`,(-1:1:0),`(5:3:2)`; first point is
the cusp, remaining CM discriminants in order -3,-4,-8,-11,-12,-16,-27,-43,-163. `N=109, p=29`:
`Q_N=zx³+(zy+z²)x²+(−y³−zy²−z³)x−zy³−3z²y²−2z³y=0`; ordered points
`(1:0:0)`,(-2:1:2),(0:-2:1),(0:-1:1),`(0:1:0),(0:0:1)`,(-1:-1:1),(-2:1:1),(1:-1:1); first point is the
cusp, remaining CM discriminants in order -3,-4,-7,-12,-16,-27,-28,-43. `N=113, p=17`:
`Q_N=zx³+(−y²−z²)x²+(y³+z³)x−2z²y²+z³y=0`; ordered points
`(1:0:0),(2:2:1),(0:1:0),(1:1:1),(1:1:0),(0:0:1),(0:1:2),(5:3:1)`; first point is the cusp, remaining
CM discriminants in order -4,-7,-8,-11,-16,-28,-163. `N=127, p=11`:
`Q_N=zx³+(−y²−3z²)x²+(y³−z²y+4z³)x+2zy³−3z²y²+3z³y−2z⁴=0`; ordered points
`(1:0:0),(5:3:2),(2:1:1),(1:1:0),(1:0:1),(0:1:1),(0:1:0),(4:2:1)`; first point is the cusp, remaining
CM discriminants in order -3,-7,-12,-27,-28,-43,-67. `N=139, p=19`:
`Q_N=zx³+(−y²+zy)x²+(−y³−2zy²−3z²y−z³)x+y⁴+zy³+z²y²+z³y=0`; ordered points
`(1:0:0)`,(4:-3:1),`(0:0:1)`,(0:-1:1),(1:-1:1),`(1:0:1)`,(-1:0:1); first point is the cusp, remaining CM
discriminants in order -3,-8,-12,-19,-27,-43. `N=149, p=11`:
`Q_N=zx³−y²x²+(y³+zy²−2z²y−z³)x−y⁴+zy³+z²y²−z³y=0`; ordered points
`(1:0:0)`,(-1:0:1),`(0:1:1),(1:0:1),(0:0:1)`,(0:-1:1),`(2:2:1)`; first point is the cusp, remaining CM
discriminants in order -4,-7,-16,-19,-28,-67. `N=151, p=19`:
`Q_N=zx³+(−2zy+z²)x²+(−y³+2zy²)x−zy³+3z²y²−z³y−2z⁴=0`; ordered points
`(1:0:0)`,(-2:-2:1),`(0:1:0),(0:2:1),(1:1:1),(2:3:2),(1:0:1),(3:2:1)`; first point is the cusp,
remaining CM discriminants in order -3,-7,-12,-27,-28,-67,-163. `N=179, p=17`:
`Q_N=zx³+(−2zy−z²)x²+(−y³−zy²−2z²y−z³)x−zy³+z³y=0`; ordered points
`(1:0:0)`,(0:-1:1),`(0:1:0),(0:0:1),(0:1:1)`,(-2:2:1); first point is the cusp, remaining CM
discriminants in order -7,-8,-11,-28,-163. `N=239, p=13`:
`Q_N=zx³+(−y²+zy+z²)x²+(−y³−zy²−z²y)x+y⁴+3zy³+2z²y²+z³y=0`; ordered points
`(1:0:0)`,(-1:0:1),`(0:0:1)`,(1:-2:1),(1:-1:1); first point is the cusp, remaining CM discriminants in
order -7,-19,-28,-43.

Work under the following conditions. The genus-three list of prime levels (Ogg) and the models of
`X_0^+(N)` (Galbraith, Elkies). For every conjugate newform assume analytic continuation, the exact
functional-equation sign and supplied derivative enclosures excluding 0; the modular
rank-one implication must meet the separate admissibility hypotheses of §6.21. `ED.2` supplies
scalar logarithms only, not L-value tables. For each of the nine stated levels assume the exact
model, a regular proper semistable `Z_N` model with geometrically irreducible special fibre
and generic-fibre isomorphism to that quotient, the normalized factorization of `h_N`
through its component reduction map (zero at the base component), rational point coordinates,
Hecke/Frobenius/correspondence data, local expansion
coefficients/tail inequalities, and L-value/derivative enclosures with the required
signs/nonvanishing proofs. The conditional theorem deduces completeness of its listed points from
the complete QC/sieve datum; it does not assume that completeness or target production of
these data.

For the proof, use the supplied analytic-continuation/sign/derivative data and the admissible modular
rank-one implication to deduce rank g; use supplied Hecke identifications for real
multiplication, and the explicit regular semistable model hypothesis for trivial `h_N`,
using the supplied normalized factorization through the one-component reduction map
(BDMTV 2021 Theorem 3.2). No L-value, Hecke or model
table is produced here. Apply §6.17 at the stated prime, assuming the supplied coefficient, root and exclusion bounds; its conclusion is exactly the known
points. padic-candidate-comparison gives the exact solution set; the CM discriminants are
identified through the modular interpretation as unordered N-isogenous elliptic pairs and CM data
(ModularCurvesPartII §§9.7–9.8, the shared CM application hypotheses); the j-map on `X0(N)` does not generally descend to X0+(N).

For each `N∈{97,109,113,127,139,149,151,179,239}`, let `X=X0(N)/⟨w_N⟩` be the actual coarse smooth projective Q-curve and identify it with the corresponding explicit plane quartic in BDMTVv4 `Examples5.7–5.15pp31–32`. Prove equality of its `Hom_Q(SpecQ,X)` with exactly the projective classes in the following ordered source lists, with cusp/CM identification through the quotient modular interpretation (not a single descended j-map on X0+(N)). `N=97, p=5`: `Q_N=zx³+(−y²+zy)x²+(−y³−zy²−z³)x+zy³+z²y²=0`; ordered points `(1:0:0)`,(-2:1:1),(-1:0:1),`(0:0:1),(0:1:0)`,(0:-1:1),`(1:0:1),(1:1:1)`,(-1:1:0),`(5:3:2)`; first point is the cusp, remaining CM discriminants in order -3,-4,-8,-11,-12,-16,-27,-43,-163. The source counts are10,9,8,8,7,7,8,6,5 respectively. Require genuine rank/logarithm, endomorphism, model/reduction, local-height and two-cycle coefficient/zero/matching data for each `N`, including the regular proper semistable `Z_N` model with geometrically irreducible special fibre, its generic-fibre isomorphism to `X`, and the normalized factorization of `h_N` through component reduction, zero at the base component. Retain the explicit modular rank-over-Q hypothesis and require the complete finite data; do not generalize the ten-point97 helper to every level.

**Checks.**

- `X_0^+(97)`: ten rational points, all satisfying the model exactly.
- All nine source lists have distinct projective points satisfying their own displayed homogeneous quartic; their sizes are10,9,8,8,7,7,8,6,5. This substitution check does not certify completeness.
- For `N=97` the assumed geometrically irreducible semistable fibre has a one-vertex dual
  graph; the supplied normalized component factorization gives `h_97=0`, even when
  that graph has loops.
- Prime-square level 169 is outside the prime-level model statement; its local-height
  vanishing uses §11.8 of ModularCurvesPartII instead.

([BDMTV (arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Theorem 5.6, p.30 and Lemma 5.2, pp.27–28 (arXiv v4); [BDMTV
(arXiv v4, 2023)](https://arxiv.org/abs/2101.01862v4), Example 5.7, p.31 (arXiv v4); [BDMTV (arXiv
v4, 2023)](https://arxiv.org/abs/2101.01862v4), Examples5.7–5.15,pp31–32(arXivv4).)

*Needs:* §6.17; §6.4; §6.2; the explicit modular rank-one hypotheses of §6.21; the regular semistable model hypothesis of this section;
§6.1; ModularCurvesPartII §9.8; the normalized local-height factorization hypothesis of this section.

### 6.36 Two quartic Thue equations solved by Tzanakis–de Weger

`Suggested.lean` states `ED6.thue_quartic_i` and `ED6.thue_quartic_ii`: (i) the integer solutions of
`X⁴ − 4X³Y − 12X²Y² + 4Y⁴ = 1` are exactly `±(1, 0)`, and (ii) the integer solutions of
`X⁴ − 12X²Y² − 8XY³ + 4Y⁴ = 1` are exactly `±(1, 0), ±(1, −1), ±(1, 3), ±(3, −1)`. Both statements
are unconditional; every arithmetic fact they rest on is a target of this section.

Arithmetic targets about the field. Let `K = ℚ(ϑ)` with `ϑ⁴ − 12ϑ² − 8ϑ + 4 = 0`. Prove: (a) `K` is a
totally real quartic field, the four real roots lying in `(−3, −2.9), (−1.1, −1), (0.3, 0.4)` and
`(3.7, 3.8)`, so its unit rank is 3 (Mathlib `NumberField.Units.rank`); `φ := 2/ϑ = 4 + 6ϑ − ϑ³/2`
satisfies `φ⁴ − 4φ³ − 12φ² + 4 = 0`, so (i) and (ii) read `N_{K/ℚ}(X − Yφ) = 1` and `N_{K/ℚ}(X − Yϑ) = 1`.
(b) `R := ℤ + ℤϑ + ℤ(ϑ²/2) + ℤ(ϑ³/2)` is an order of `K` (`ϑ²/2` is integral, with characteristic
polynomial `T⁴ − 12T³ + 38T² − 20T + 1`, and the basis is closed under multiplication), and
`ε₁ = 1 + ϑ, ε₂ = 3 + ϑ, ε₃ = ϑ²/2` are units of `R` with inverses `−3 + 11ϑ + 2(ϑ²/2) − 2(ϑ³/2)`,
`−1 + 3ϑ + 6(ϑ²/2) − 2(ϑ³/2)` and `14 + 12ϑ − (ϑ²/2) − 2(ϑ³/2)`. (c) `R^× = {±1} × ⟨ε₁, ε₂, ε₃⟩`.
Route for (c): the three units are independent, their regulator being approximately `22.32 ≠ 0`
(computed from the enclosed real embeddings of §0.4); Tzanakis–de Weger prove that a system
`η₁, η₂, η₃` is fundamental by Billevič's criterion for orders of totally real quartic fields and
pass to `ε₁, ε₂, ε₃` by a unimodular exponent matrix (their Appendix I and p. 124); alternatively
bound the index `[O_K^× : ±⟨ε⟩] ≤ Reg(ε₁, ε₂, ε₃)/Reg(O_K)` by a regulator lower bound for totally
real quartic fields and exclude every prime `p` up to that bound by showing that no `±∏ε_i^{v_i}`
with `0 ≤ v_i < p`, not all zero, is a `p`-th power in `R` (a finite check modulo a prime `q ≡ 1 (mod p)`
or against the real embeddings). An element of `R` of norm `±1` is a unit of `R`, because its
inverse is a polynomial in it with integer coefficients.

For the proof of (i) and (ii), a solution gives `X − Yξ ∈ R^×`, `ξ = φ` for (i) and `ξ = ϑ` for (ii),
hence `X − Yξ = ±ε₁^{a₁}ε₂^{a₂}ε₃^{a₃}`. Siegel's identity among three conjugates turns this into
the eight inhomogeneous linear forms `Λ = δ + a₁μ₁ + a₂μ₂ + a₃μ₃` of Tzanakis–de Weger `(2.5)–(2.6)`,
with `|Λ| ≤ C₆ exp(−(4/C₅)A)` for `|Y| > 3`, `C₅ = 1.211`, `C₆ = 6.38771·10⁴` and `A := max|a_i|`
(their Lemma II.2.1 and p. 124). The method of §§2.12–2.18 then runs with these data, each
inequality an exact statement proved by computation, not a hypothesis: §2.15 with Matveev's bound
(§2.3; Tzanakis–de Weger used Waldschmidt's theorem, their Appendix II) gives an initial bound
`K₀` for `A` (their value is `A < 3.26·10⁴⁰`); §1.4 applied to the approximation lattice of §1.1 with
`C = c₀ = 10¹⁴⁰` and `W₁ = W₂ = 1`, spanned by the columns of the matrix with rows
`(1, 0, 0), (0, 1, 0), ([c₀μ₁], [c₀μ₂], [c₀μ₃])` and target `(0, 0, −[c₀δ])`, gives
`A < (1/3.303) log(c₀·6.38771·10⁴/(3K₀))`, so `A ≤ 72` once `|b₁| > 3.247·10⁴⁶` resp. `4.846·10⁴⁶`
and `‖s₃‖ > 0.029` are established for the two lattices `Γ₁, Γ₂`; the same step with `c₀ = 10¹²`
(`|b₁| > 1.293·10⁴` resp. `1.092·10⁴`, `‖s₃‖ > 0.143`) gives `A ≤ 10`; finally every
`(a₁, a₂, a₃)` with `|a_i| ≤ 10` is tested exactly for the shape `X − Yξ`, and `|Y| ≤ 3` is checked
directly. A different initial bound `K₀` only changes the first reduction scale. §2.20 packages
the result as the equality of the solution set with the listed finite set.

**Checks.**

- Exact evaluation for (ii): `(1, 3) ↦ 1 − 108 − 216 + 324 = 1` and `(3, −1) ↦ 81 − 108 + 24 + 4 = 1`; for (i), `(1, 1) ↦ 1 − 4 − 12 + 4 = −11`, so `(1, 1)` is not a solution.
- The lists are complete over the box `|X|, |Y| ≤ 1500` by direct evaluation (a consistency check of the lists, not a completeness proof): (i) gives only `±(1, 0)` and (ii) gives exactly the eight listed pairs.
- `N_{K/ℚ}(ε₃) = N(ϑ)²/16 = 1` and `ε₃⁻¹ = 14 + 12ϑ − ϑ²/2 − ϑ³ ∈ R`; `φ ∈ R` since `4 = −ϑ⁴ + 12ϑ² + 8ϑ` gives `2/ϑ = 4 + 6ϑ − ϑ³/2`.
- The regulator of `ε₁, ε₂, ε₃` is about 22.32; a system of index 2 in `⟨ε₁, ε₂, ε₃⟩` would have regulator about 44.6, so the regulator alone does not decide (c): the index test or Billevič's criterion is needed.
- The first reduction bound 72 and the second bound 10 are distinct steps: the enumeration of `|a_i| ≤ 10` requires the second reduction inequality, not just the first.
- For (ii), `(1, 0)` and `(1, −1)` both give 1; a list consisting only of `±(1, 0)` is incomplete.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), Theorem B,
p. 122; proof of Theorem B, pp. 123–126; Appendix I, pp. 127–129.)

*Needs:* §2.20; §2.15; §2.3; §1.4; §1.1; §0.4; §6.1; Mathlib `NumberField.Units.rank`.

### 6.37 Integral points on `y² = x³ − 4x + 1` (Tzanakis–de Weger Theorem A)

`Suggested.lean` states `ED6.integralPoints_cubic_minus_four_x_plus_one`: the integral points of
`E : y² = x³ − 4x + 1` are exactly the 22 points `(x, ±y)` with
`(x, y) ∈ {(−2, 1), (−1, 2), (0, 1), (2, 1), (3, 4), (4, 7), (10, 31), (12, 41), (20, 89), (114, 1217), (1274, 45473)}`,
and `ED6.triangular_eq_three_consecutive` (Mohanty's problem): the triangular numbers
`T_n = n(n + 1)/2` with `n ≥ 1` that are a product `m(m + 1)(m + 2)` of three consecutive integers
are exactly `T_3, T_15, T_20, T_44, T_608, T_22736`. Both statements are unconditional.

Arithmetic targets about the field. Let `L = ℚ(ψ)` with `ψ³ − 4ψ + 1 = 0`. Prove: (a) `L` is a
totally real cubic field with roots in `(−2.2, −2.1), (0.25, 0.26)` and `(1.86, 1.87)`;
`disc(ψ³ − 4ψ + 1) = 229` is prime, so `O_L = ℤ[ψ]` and `disc L = 229`. (b) `L` has class number one:
the Minkowski bound `(3!/3³)√229 < 3.37` leaves ideals of norm at most 3; modulo 2 the
polynomial factors as `(ψ + 1)(ψ² + ψ + 1)`, the prime of norm 2 is `(ψ − 1)` since
`N_{L/ℚ}(ψ − 1) = −2`, and the prime of norm 4 is `(2)/(ψ − 1)`; modulo 3 the polynomial is
irreducible, so no ideal has norm 3. (c) `ψ` and `2 − ψ` are units (`N(ψ) = −1, N(2 − ψ) = 1`) and
form a system of fundamental units of `O_L`; Tzanakis–de Weger take this from Buchmann's table,
and the route here is the regulator-and-index test of §6.36 (c) in rank 2.

For the proof, the two factors of `x³ − 4x + 1 = (x − ψ)(x² + xψ + ψ² − 4)` are coprime in `ℤ[ψ]`: a
common prime divides `3ψ² − 4`, of norm −229, and lies over 229; its residue forces
`x ≡ 29 (mod 229)`, but `f(29) = 229·106` and `f′(29) = 229·11` for `f(T) = T³ − 4T + 1`, so
`ord_229(f(x)) = 1` for every such integer x, contradicting `y² = f(x)`. For `x ≤ −3` the right-hand
side is negative and `x ∈ {−2, −1, 0, 1}` gives `1, 4, 1, −2`, so only `x ≥ 2` remains. Class number
one and the unit group give `x − ψ = ±ψ^i(2 − ψ)^j α²` with `i, j ∈ {0, 1}`; the real embedding
`ψ^{(1)} = 0.254…` forces the sign `+` and `ψ^{(2)} = −2.114…` forces `i = 0`. Comparing coefficients
in the basis `1, ψ, ψ²` gives Tzanakis–de Weger's equations `(1.4)–(1.7)`; parametrising the resulting
conics leads, for `j = 0`, to two reducible quartic Thue equations (solved by factoring, giving
`x = 20, 12` and `x = 4`) and, for `j = 1`, to the irreducible equations
`m⁴ − 4m³n − 12m²n² + 4n⁴ = 1` and `n⁴ − 12n²m² − 8nm³ + 4m⁴ = 1` of §6.36, whose solutions give
`x = 3` and `x = 2, 10, 1274, 114`. Exact evaluation verifies each listed point on `E`
(`WeierstrassCurve.Affine.Equation`). For Mohanty's problem, `x = 2m + 2, y = 2n + 1` turns
`T_n = m(m + 1)(m + 2)` into `y² = x³ − 4x + 1` with `x ≥ 2` even and `y` odd; the even `x ≥ 2` in
the list are `2, 4, 10, 12, 20, 114, 1274`, with `m = 0, 1, 4, 5, 9, 56, 636` and
`n = 0, 3, 15, 20, 44, 608, 22736`, and `n ≥ 1` excludes `m = 0`.

**Checks.**

- `(1274, 45473): 1274³ − 4·1274 + 1 = 2067793729 = 45473²`.
- `T_608 = 185136 = 56·57·58` and `T_22736 = 258474216 = 636·637·638`; `T_3 = 6 = 1·2·3`.
- The list is complete over `|x| ≤ 10⁶` by direct evaluation (a consistency check, not a completeness proof).
- The possible common-prime residue `x ≡ 29 (mod 229)` has `ord_229(x³ − 4x + 1) = 1`, so it cannot occur at an integral point.
- `x = 1` gives `−2 < 0`, so the point list has no point with `x = 1`; `x = −3` gives `−14`.
- For `n = 1`, `T_1 = 1` is not a product of three consecutive integers; a statement of Mohanty's corollary as an equivalence for a fixed `m` would be false (`T_3 = 6 ≠ 0·1·2`), so the corollary quantifies `m` existentially.

([Tzanakis–de Weger (1989)](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf), Theorem A
and its Corollary, pp. 118–119; §III.1, pp. 119–122.)

*Needs:* §6.36; §6.1; Mathlib `WeierstrassCurve.Affine.Equation`; Mathlib `NumberField.classNumber`.

### 6.38 The S-unit equation `x + y = z` for `S = {2, 3, 5, 7, 11, 13}` (de Weger Theorem 6.3)

`Suggested.lean` defines `ED6.sUnitSolutions2to13`, the set of pairs of positive integers `x ≤ y`
with `gcd(x, y) = 1` such that `x`, `y` and `z = x + y` have all their prime factors in
`{2, 3, 5, 7, 11, 13}`, and states `ED6.sUnit_two_to_thirteen`: this set has exactly 545 elements,
and exactly 514 of them satisfy `ord_2(xyz) ≤ 12, ord_3(xyz) ≤ 7, ord_5(xyz) ≤ 5, ord_7(xyz) ≤ 4,
ord_11(xyz) ≤ 3, ord_13(xyz) ≤ 3`. The other 31 are de Weger's Table II, the largest being
`91 + 1771470 = 1771561` (`7·13 + 2·3¹¹·5 = 11⁶`). The statement is unconditional; the only
arithmetic input is the rational S-unit equation of §2.29.

For the proof, reduce to the coprime S-unit equation `x + y = 1` over `ℚ` and to linear forms in
p-adic logarithms (§2.29, §2.33, §1.5). The following data are exact inequalities proved by
computation, not hypotheses: the initial bound `m(xyz) := max_p ord_p(xyz) < 5.60·10²⁷` from Yu's
bound through §2.30 (de Weger §6.2 used Yu's p-adic and Waldschmidt's archimedean bounds; a weaker
imported bound only enlarges the first lattice level `μ`); the p-adic reductions of §2.31 with the
parameters `(μ₀, μ) = (2, 605), (1, 385), (1, 275), (1, 220), (1, 165), (1, 165)` for
`p = 2, 3, 5, 7, 11, 13`, each justified by a lattice lower bound `ℓ(Γ*_μ) > √5·5.60·10²⁷`, giving
`ord_p(xyz) ≤ 606, 385, 275, 220, 165, 165` and so `m ≤ 606` (if `ℓ(Γ*_μ) > √5·X₁` then
`ord_p(z) ≤ μ + μ₀ − 1` for solutions with `m(xyz) ≤ X₁`, de Weger Lemma 3.14 and §1.6; symmetry in
x, y, z bounds `ord_p(xyz)`); a second reduction with `μ = 66, 42, 30, 24, 18, 18` giving `m ≤ 67`; a
third with `μ = 55, 35, 25, 20, 15, 15` giving `m ≤ 56`; the finite enumeration of §1.8 of the short
vectors of the same lattices down to the final bounds `f(2) = 4, f(p) = 1` for `p ≥ 3`; and the
exhaustive search below those bounds. Every candidate is tested by exact factorisation over `S`;
§2.33 packages the equality of the solution set with the finite list, and the count and the
exponent-bound split are read off that list.

**Checks.**

- `91 + 1771470 = 1771561 = 11⁶`, with `ord_11(xyz) = 6 > 3`, so this solution is one of the 31.
- A direct search over `z ≤ 4·10⁶` finds exactly 545 solutions with largest `z = 1771561`, of which 514 satisfy the exponent bounds (a consistency check of the list, not a completeness proof).
- `1 + 1 = 2` is counted (`x = y = 1` is allowed by `x ≤ y`); with `x < y` the count would be 544.
- For `S = {2, 3}` the same definition has exactly the four solutions `1 + 1 = 2, 1 + 2 = 3, 1 + 3 = 4, 1 + 8 = 9` (§2.33).

([de Weger (1989)](https://ir.cwi.nl/pub/13190), Theorem 6.3, p.123; proof of Theorem 6.3,
pp.123–125; Table II, printed p.130.)

*Needs:* §2.33; §2.30; §2.31; §1.6; §1.5; §1.8; §0.8; §6.1; Mathlib `Nat.primeFactors`; Mathlib `padicValNat`.

### 6.39 The Thue–Mahler equation `x³ − 23x²y + 5xy² + 24y³ = ±2^a3^b5^c7^d` (Tzanakis–de Weger 1992)

`Suggested.lean` defines `ED6.thueMahlerSolutionList`, the 72 tuples `(x, y, a, b, c, d)` below, and
states `ED6.thueMahler_cubic`: for coprime integers `x, y` and `a, b, c, d ≥ 0`,
`F(x, y) := x³ − 23x²y + 5xy² + 24y³ = ±2^a3^b5^c7^d` holds if and only if `(x, y, a, b, c, d)` or
`(−x, −y, a, b, c, d)` is in the list. Since `F` is odd, `−(x, y)` changes the sign of the right-hand
side and keeps the exponents, so the list contains one representative of each pair `±(x, y)`,
normalised by `x > 0` or `(x, y) = (0, −1)`, in the order of Tzanakis–de Weger's table (§18, p. 278):

    x y a b c d: 48632 −3729 18 0 13 0; 264 −1003 5 5 8 1; 267 −209 0 8 4 2; 137 −199 0 0 4 6;
    96 −107 3 5 2 1; 93 −103 0 2 2 1; 88 −101 8 0 3 2; 73 −81 0 0 3 3; 24 −53 6 2 4 1;
    31 −32 0 0 6 1; 28 −31 2 0 3 0; 24 −29 7 3 2 0; 132 −29 2 4 3 3; 24 −23 4 2 4 0;
    3 −16 0 6 3 0; 19 −13 0 0 7 0; 24 −13 11 1 2 0; 48 −13 3 9 1 0; 4 −9 2 0 5 0; 6 −7 1 1 3 0;
    3 −4 0 2 0 2; 4 −3 2 0 2 1; 1 −2 0 0 3 0; 51 −2 0 4 5 0; 0 −1 3 1 0 0; 1 −1 0 0 1 0;
    3 −1 0 2 2 0; 6 −1 1 1 2 1; 8 −1 4 0 3 0; 13 −1 0 0 3 2; 1 0 0 0 0 0; 1 1 0 0 0 1;
    2 1 1 0 2 0; 8 1 7 0 0 1; 12 1 2 1 3 0; 15 1 0 5 0 1; 22 1 1 0 2 1; 24 1 4 2 1 0;
    42 1 1 3 4 0; 3 2 0 3 1 0; 9 2 0 1 3 1; 1 3 0 0 4 0; 10 3 1 0 0 4; 7 6 0 0 2 0; 8 7 4 0 2 0;
    9 7 0 1 4 0; 24 7 5 4 2 0; 159 7 0 3 3 0; 8 9 6 0 3 0; 128 9 3 0 5 2; 12 11 2 2 3 0;
    32 11 3 0 5 1; 87 11 0 1 8 0; 6 13 1 3 3 1; 272 13 3 0 4 3; 296 13 6 0 4 0; 24 17 4 1 2 2;
    744 37 6 3 4 2; 48 41 3 4 0 1; 56 43 5 0 6 0; 59 52 0 0 4 3; 56 55 20 0 0 0;
    2184 97 14 5 2 0; 24 115 10 6 0 2; 152 131 10 0 3 1; 216 139 12 1 4 1; 3388 149 2 0 9 0;
    399 302 0 13 3 0; 534 457 1 1 7 1; 984 827 7 8 4 0; 1112 951 5 0 3 3; 1656 1663 11 1 6 3

The statement is unconditional; the arithmetic facts it rests on are the targets below.

Arithmetic targets about the field. Let `K = ℚ(θ)` with `θ³ − 23θ² + 5θ + 24 = 0`. Prove: (a) `K` is
a totally real cubic field (roots in `(−0.91, −0.90), (1.16, 1.17), (22.7, 22.8)`), not Galois since
`disc(θ³ − 23θ² + 5θ + 24) = 1115525 = 5²·44621` is not a square, with 44621 prime;
`ω := (2 + θ − θ²)/5` is integral (characteristic polynomial `T³ + 98T² − 41T + 2`), `O_K = ℤ + ℤθ + ℤω`
and `disc K = 44621`. (b) `ε₁ = 1 + θ − 6ω` and `ε₂ = 3911 + 4397θ + 1046ω` have norm −1 and form a
system of fundamental units of `O_K` (Tzanakis–de Weger obtained them by Berwick's method; the
route here is the regulator-and-index test of §6.36 (c) in rank 2). (c) Prime decompositions: for
`p = 2, 3, 7` the polynomial is congruent to `t(t² + t + 1), t(t² + t + 2)` and `(t − 1)(t² + 6t + 4)`
with irreducible quadratic factors, so `p = 𝔭_p𝔭′_p` with residue degrees 1 and 2; `5` splits
completely (the polynomial has three roots in `ℚ_5`; `5` divides the index `[O_K : ℤ[θ]] = 5`, so this
is computed on `O_K`, not by Dedekind–Kummer on `θ`). (d) For each `p ∈ {2, 3, 5, 7}` and each prime
`𝔭 | p` of residue degree one, the least `h_𝔭 ≥ 1` with `𝔭^{h_𝔭}` principal, with a generator; the
class number itself is not needed (Tzanakis–de Weger §2).

For the proof, reduce to `N_{K/ℚ}(x − yθ) = ±2^a3^b5^c7^d` and, by the Prime Ideal Removing Lemma
(§2.22), to S-unit equations in `K` (DiophantineApproximationAndTranscendence §4.5 gives the
finiteness); the method of §§2.22–2.28 then runs with these data, each an exact inequality proved
by computation: the initial bound for the exponents from Yu's bound (§2.5) and Matveev's bound
(§2.3) through §2.24. Tzanakis–de Weger's printed archimedean constant rests on a misprinted
theorem of Blass–Glass–Manski–Meronk–Steiner; their 1993 corrigendum multiplies `c₇` by `7¹⁵`,
giving `c₇ = 1.08672·10⁴⁶` and `B < 1.511·10⁵⁰`, and shows that the first reduction steps with the
same lattices still give `N₁ = 1153` and `H ≤ 4919`, below the old bound `9.844·10⁴⁹`, after which
the original reduction applies; alternatively the Baker–Wüstholz bound gives `c₇ = 2.2044·10³⁸`
and `B < 9.844·10⁴⁹` directly. Real and p-adic reduction steps (§1.4, §1.6, §2.25) lower the
exponent bound to 113 and the finite enumeration of §1.8 to 86 (`N₁ = 19, N₂ = 11, N₃ = 8, N₄ = 6`,
`A ≤ 86`); the sieve of §2.26 with the completely split primes `q = 401, 167, 89, 47` leaves 82
exponent tuples; exact evaluation of `F` rejects 3 of them and confirms 79, among which 10
solutions are counted twice (cases III and V with `n₃ = 1`), giving 69 solutions within the
reduced bounds; together with the 3 solutions found outside the reduced bounds during the
reduction this gives the 72 listed solutions. §2.28 packages the equality of the normalised
solution set with the list.

**Checks.**

- `F(48632, −3729) = 320000000000000 = 2¹⁸·5¹³` and `F(56, 55) = 1048576 = 2²⁰`.
- `F(0, −1) = −24 = −2³·3` is the representative with `x = 0`; `F(0, 1) = 24` is its negative and is not listed separately. `F(1, 0) = 1` is the solution with all exponents zero.
- Every listed tuple satisfies `F(x, y) = ±2^a3^b5^c7^d` with `gcd(x, y) = 1` by exact evaluation, and a direct search over `0 ≤ x ≤ 50000, |y| ≤ 4000` finds no other coprime solution (a consistency check of the list, not a completeness proof): 71 with `x > 0` and the one with `x = 0`.
- `F(2, −1) = 86 = 2·43` is not a solution: a list that admitted every `(x, y)` with `F` divisible only by small primes up to a bound would be wrong.
- The count 72 refers to pairs `±(x, y)`; the number of coprime solutions `(x, y, a, b, c, d)` is 144.

([N. Tzanakis, B. M. M. de Weger](http://www.numdam.org/item/CM_1992__84_3_223_0/), §1Ex, p. 225;
§2Ex, p. 226; §18Ex, pp. 277–278; [N. Tzanakis and B. M. M. de
Weger](https://numdam.org/item/CM_1993__89_2_241_0.pdf), Compositio 89 (1993), pp. 241–242.)

*Needs:* §2.28; §2.24; §2.25; §2.26; §2.22; §1.6; §1.4; §1.8; §6.1; DiophantineApproximationAndTranscendence §4.5 (effective Thue–Mahler finiteness).

### Examples

The level-13 chart cover has 17 ordinary first-chart discs, two infinity discs and the exceptional
disc of P0, giving all 20 discs at `p=17`. The nine prime-level genus-three examples have
10,9,8,8,7,7,8,6,5 listed points. Exact substitution proves membership; only checked disc/sieve data
prove completeness.

### Dependencies

Layers 0–5; AnabelianGeometryAndNonabelianChabauty §§2.0–2.7,AnabelianGeometryAndNonabelianChabauty §§6.1–6.8; ColemanIntegration L0–L1;
PadicDifferentialEquationsAndRigidCohomology `RD.7`; ModularCurvesPartII
ModularCurvesPartII §§9.5–9.8,ModularCurvesPartII §9.7,ModularCurvesPartII §11.8,ModularCurvesPartII §§16.1–16.7,ModularCurvesPartII §17.2. The rank-over-Q, CM and external uniformity hypotheses are stated
explicitly; concrete tables are inputs.

## Downstream consumers

Arithmetic applications use the scalar enclosure, valuation and logarithm error contracts. ArithmeticDynamics uses the complete genus-two and genus-four point lists with
their displayed rank hypotheses. The relative symmetric sieve supplies the rational-divisor step
used for modular curves in Caraiani–Newton §7.4. Explicit modularity applications consume the model
and finite-datum implications, with their arithmetic input hypotheses intact.

## References

Each locator above distinguishes an author preprint, an `arXiv` version and a publication. Page
numbers refer to the indicated version. Corrected formulas are stated in the targets themselves; a
source citation is not an endorsement of an uncorrected numerical or sign convention.

- W. Aitken, F. Lemmermeyer. [Counterexamples to the Hasse principle](https://arxiv.org/abs/1108.6310). `arXiv:1108.6310v1 (31` August 2011; the only `arXiv` version); published Amer. Math. Monthly 118 (2011) 610–628.
- Jennifer S. Balakrishnan, Robert W. Bradshaw and Kiran S. Kedlaya. [Explicit Coleman integration for hyperelliptic curves](https://arxiv.org/abs/1004.4936v2). `arXiv:1004.4936v2`; ANTS IX, Lecture Notes in Computer Science 6197 (2010).
- Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf). Annals of Mathematics 189 (2019), 885–944, `doi:10.4007/annals.2019.189.3.6` (published version).
- Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. [Quadratic Chabauty for modular curves: algorithms and examples](https://arxiv.org/abs/2101.01862v4). `arXiv:2101.01862v4 (7` March 2023); published in Compositio Mathematica 159 (2023).
- Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. [Quadratic Chabauty for modular curves: algorithms and examples](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C317E63BB0128EB3F2163621CA63E66E/S0010437X23007170a.pdf/quadratic_chabauty_for_modular_curves_algorithms_and_examples.pdf). Compositio Mathematica 159 (2023), 1111–1152,version of record.
- Josha Box. [Quadratic points on modular curves with infinite Mordell–Weil group](https://arxiv.org/abs/1906.05206). `arXiv:1906.05206`; published Math. Comp. 90 (2021), 321–343.
- Nils Bruin and Michael Stoll. [The Mordell–Weil sieve: proving non-existence of rational points on curves](https://doi.org/10.1112/S1461157009000187). LMS Journal of Computation and Mathematics 13 (2010), 272–306; version of record, `doi:10.1112/S1461157009000187`.
- Ana Caraiani and James Newton. [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/abs/2301.10509). `arXiv:2301.10509; arXiv` v3 (27 March 2025); §7.4 uses its version-specific numbering.
- J. E. Cremona. [Algorithms for modular elliptic curves, Chapter III: Elliptic curve algorithms](https://johncremona.github.io/book/fulltext/index.html). 2nd edition, Cambridge University Press 1997; author's online full text of Chapter III.
- John Cremona. [Cremona elliptic-curve data: 571a1](https://raw.githubusercontent.com/JohnCremona/ecdata/master/allcurves/allcurves.00000-09999). Author-maintained ecdata allcurves table; `allcurves.00000-09999`, row 571 a 1.
- B. M. M. de Weger. [Algorithms for Diophantine equations](https://ir.cwi.nl/pub/13190). CWI Tract 65, Centrum voor Wiskunde en Informatica, Amsterdam, 1989 (scan with OCR layer).
- J. R. Doyle, D. Krumm. [Computing algebraic numbers of bounded height](https://arxiv.org/abs/1111.4963). Math. Comp. 84 (2015) 2867–2891; locators refer to `arXiv:1111.4963v4`.
- U. Fincke, M. Pohst. [Improved methods for calculating vectors of short length in a lattice, including a complexity analysis](https://www.ams.org/journals/mcom/1985-44-170/S0025-5718-1985-0777278-8/). Math. Comp. 44 (1985) 463–471.
- E. V. Flynn, Bjorn Poonen, Edward F. Schaefer. [Cycles of quadratic polynomials and rational points on a genus-2 curve](https://arxiv.org/abs/math/9508211). arXiv:math/9508211v1 (4 August 1995); published Duke Math. J. 90 (1997) 435–463.
- Eric Katz, Joseph Rabinoff and David Zureick-Brown. [Uniform bounds for the number of rational points on curves of small Mordell–Weil rank](https://arxiv.org/abs/1504.00694v2). `arXiv:1504.00694v2`; published Duke Math. J. 165 (2016), 3189–3240.
- E. M. Matveev. [An explicit lower bound for a homogeneous rational linear form in the logarithms of algebraic numbers. II](https://www.mathnet.ru/php/getFT.phtml?jrnid=im&paperid=314&what=fullteng&option_lang=eng). Izvestiya: Mathematics 64:6 (2000) 1217–1269 (English translation, version of record from `mathnet.ru`; the cited corollary is in §2).
- William McCallum and Bjorn Poonen. [The method of Chabauty and Coleman](https://math.mit.edu/~poonen/papers/chabauty.pdf). Author copy dated June 14, 2010 (pp. 1–17); published in Explicit methods in number theory, Panoramas et Synthèses 36 (2012), 99–117. Page numbers cited are those of the author copy.
- Bjorn Poonen. [The complete classification of rational preperiodic points of quadratic polynomials over Q: a refined conjecture](https://arxiv.org/abs/math/9512217v1). arXiv:math/9512217v1 (1995 preprint, 19 pp.); published Math. Z. 228 (1998), 11–29. The [author's errata](https://math.mit.edu/~poonen/papers/errata.pdf), dated 14 August 2025, correct the point used in the descent.
- Bjorn Poonen. [Remarks and errata](https://math.mit.edu/~poonen/papers/errata.pdf). author's page, list dated 14 August 2025.
- Samir Siksek. [Infinite descent on elliptic curves](https://samirsiksek.github.io/siksek.github.io/papers/infart2.pdf). Author preprint dated 5 February 1995; source PDF pagination 1–25 (not published journal pagination).
- Samir Siksek. [Explicit Chabauty over number fields](https://arxiv.org/abs/1010.2603). `arXiv:1010.2603v2`; published Algebra & Number Theory 7 (2013), 765–793.
- Samir Siksek. [Chabauty for symmetric powers of curves](https://msp.org/ant/2009/3-2/ant-v3-n2-p03-s.pdf). Version of record, Algebra & Number Theory `3(2009),209–236; Theorem3.2` is the published numbering (Box cites preprint Theorem 1).
- Joseph H. Silverman. [The difference between the Weil height and the canonical height on elliptic curves](https://www.ams.org/journals/mcom/1990-55-192/S0025-5718-1990-1035944-5/). Math. Comp. 55 (1990), no. 192, 723–743; version of record (AMS PDF).
- Michael Stoll. [Rational 6-cycles under iteration of quadratic polynomials](https://arxiv.org/abs/0803.2836). `arXiv:0803.2836v2 (21` April 2009); published LMS J. Comput. Math. 11 (2008) 367–380.
- Michael Stoll. [Uniform bounds for the number of rational points on hyperelliptic curves of small Mordell–Weil rank](https://arxiv.org/abs/1307.1773v4). `arXiv:1307.1773v4`; published J. Eur. Math. Soc. 21 (2019), 923–956.
- N. Tzanakis, B. M. M. de Weger. [On the practical solution of the Thue equation](https://ris.utwente.nl/ws/files/6560439/Tzanakis89on.pdf). J. Number Theory 31 (1989) 99–132.
- N. Tzanakis, B. M. M. de Weger. [How to explicitly solve a Thue–Mahler equation](http://www.numdam.org/item/CM_1992__84_3_223_0/). Compositio Math. 84 (1992) 223–288.
- N. Tzanakis and B. M. M. de Weger. [Corrections to “How to explicitly solve a Thue–Mahler equation”](https://numdam.org/item/CM_1993__89_2_241_0.pdf). Compositio Mathematica 89 (1993), 241–242; published corrigendum.
- Kunrui Yu. [Linear forms in p-adic logarithms III](http://archive.numdam.org/article/CM_1994__91_3_241_0.pdf). Compositio Math. 91 (1994) 241–276 (version of record, Numdam; the bounds are on `pp.241–242`).
