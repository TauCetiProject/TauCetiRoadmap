# Roadmap: elliptic curves, Part II — Legendre models, descent and character interfaces

**Summary.** Build the equation interfaces between split two-torsion, Legendre parameters, native two-descent, good reduction and primitive quadratic characters. EllipticCurves supplies the general theory through local reduction and quadratic twists; this extension begins with its Weierstrass equations and point groups and proves the parameter, squareclass and torsion results specific to split cubics. Its end theorems are normalization over every field of characteristic different from two with full rational two-torsion, unit parameters at good odd primes, odd character-conductor divisibility, the Legendre halving criterion, two-primary point-group results, the symmetric-cubic trace formula and the quadratic-twist trace formula for every normal-form equation over an odd finite field. The explicit order-four point on the twist by two supports the descent interfaces. No progression hypothesis enters these constructions.

## Scope and ownership

This roadmap owns coefficient-level Legendre specializations, ordered-root normalization, root evaluations of the native descent map and their arithmetic consequences. It extends EllipticCurves, whose Layer 4 stops at general local reduction and whose Layer 5 owns quadratic twists. It does not replace their curve, isogeny, local-model or twist carriers. The generic Frey equation y²=x(x−A)(x+B) over every commutative ring, with its discriminant, c₄ and ellipticity criterion, is EllipticCurves' worked Frey–Hellegouarch example; L(λ) and L(d,λ) are its specializations at (A,B)=(1,−λ) and (A,B)=(d,−dλ), and the invariant statements of Layer 0 are specializations of those identities, which are not restated here.

The five-coefficient model, nonsingular affine point group, invariants, normal forms, admissible coordinate changes and minimal-equation reduction classes are already in the library: Mathlib's elliptic-curve modules supply them. Tau Ceti supplies the cubic algebra, its unit squareclasses, the descent homomorphism and kernel theorem, root-count formula for two-torsion, point counts and quadratic twists. These general constructions are imports, not targets. Layer 2 adds their three ordered root readings; its coordinate product theorem differs from the generic norm condition by identifying the three individual factors. Layer 0's enumeration differs from the native root-count theorem by giving the actual labelled points and the equality of sets.

ModularCurves §4C owns the universal Legendre curve; §0.1 is its coefficient-level form over every commutative ring. ModularCurves §9E owns the Legendre line, its S₃ action and invariant-ring description. Layer 0 keeps the six labelled rational expressions and their coefficient-model comparisons. Section 0.9 uses cardinality four of the native doubling kernel as full K-rational two-torsion; EllipticCurveModularityPartII §5.1 packages its rational specialization as a predicate. ClassicalArithmeticCompletion §§1.7, 1.8, 1.51 owns primitive squareclass characters and their identification by prime values. NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g owns the actual elliptic conductor and its reduction comparison, using ArithmeticGaloisRepresentations Layer 3 for Artin conductors. No discriminant, reduction-symbol formula or Ogg-exponent surrogate is substituted for that conductor.

Layer 5 owns the character-sum point count and the quadratic-twist trace comparison for normal-form equations over every odd finite field, including singular equations. ComputationalNumberTheory §3.17 is a consumer of this identity and owns only its finite-enumeration form of the count and its computational applications. General local factors, rational bad-prime factors, global L-functions and BSD remain in EllipticCurves and the corresponding analytic roadmaps. ErdosProgressionPowers Layer 2 owns all progression-specific uses and character nontriviality, and its Layers 2–3 own the character-sum inequalities; the square-scaling change of the scaled model, the general-field normalization with the scalar of each root ordering, and the odd-finite-field two-by-four subgroup theorem belong to §§0.2, 0.8–0.9 and 3.1. ArithmeticDynamics §§6.35, 6.111–6.112 owns Legendre Lattès maps and their common torsion-image bounds; no such construction is repeated here. Sections 0.1 and 0.4 own the Legendre coefficient model over every commutative ring, its discriminant and its j-invariant; MordellLawrenceVenkatesh §6.4, ArithmeticDynamics §§6.35, 6.111 and ErdosProgressionPowers §2.1 consume them, and the cyclic family, Gauss–Manin theory and dynamical constructions remain there.

## Conventions

Rings are unital and may be the zero ring in coefficient identities. A field K is nontrivial, with arbitrary universe; geometric statements below assume 2≠0, and under this assumption L(d,λ) is elliptic precisely when d≠0 and λ∉{0,1}. Set L(λ)=(0,−(1+λ),0,λ,0) and L(d,λ)=(0,−d(1+λ),0,d²λ,0); the source’s F′_λ means L(2,λ). In the Frey normalization y²=x(x−A)(x+B), with coefficients (0,B−A,0,−AB,0), these are the pairs (A,B)=(1,−λ) and (A,B)=(d,−dλ), with A+B equal to 1−λ and d(1−λ) respectively. Polynomial identities are over every commutative ring; divisions and ellipticity assertions carry the stated field and nonzero hypotheses. The characteristic-three cases are included. Completing the square over a ring requires invertible 2, rather than merely nonzero 2.

All points mean Mathlib's nonsingular affine points together with the origin O at infinity, with its native addition; `(0,0)` is an affine two-torsion point, never O. Use decidable equality when the native point-group instance requires it. The ordered roots are always (0,d,dλ). A squareclass [a] means the class of a nonzero a in Kˣ/(Kˣ)²; zero is a field square but never a unit squareclass. The split target is K×(K×K) and its corresponding triple of squareclasses, in this order. The six parameter labels retain repetitions.

Admissible changes send new coordinates to old coordinates by x_old=u²x_new+r and y_old=u³y_new+u²sx_new+t; hence C•W is the new equation. At roots (3,5,9), r=3 gives new roots (0,2,6). The scalar d corresponds to native twist parameters (0,−d/4), whose twisting discriminant is d; at d=2 the second parameter is −1/2. Neither equality of j nor a full rational two-torsion hypothesis asserts a rational isomorphism to the unscaled L(λ).

Write v_p for the integer-valued rational p-adic valuation, normalized by v_p(p)=1. Mathlib's total value at zero is 0, so every multiplicative valuation calculation explicitly excludes zero. Good reduction of a rational curve means `WeierstrassCurve.HasGoodReduction` on a minimal equation after base change to ℚ_p; it is not that predicate on an arbitrary displayed equation. Section 1.3 proves that unit parameters make L(λ) itself minimal and good. A primitive character may have conductor 1; its odd conductor is its largest odd divisor. Semistable away from 2 means good or multiplicative reduction at every odd prime. Unit parameters and odd support actually hold without that extra condition; the semistable case is the source's conductor application.

Over a finite field the native count includes O and every singular affine solution; equality with the cardinality of the native point group requires ellipticity. For a finite field F with q elements, the trace is the integer q+1−#E(F), and the good Euler polynomial is 1−a_q T+qT². For λ=3 over 𝔽₅, the count 4 gives trace 2 and polynomial 1−2T+5T²; scaling by 2 gives count 8, trace −2 and polynomial 1+2T+5T². These witnesses fix both the trace and twist signs. No Hasse bound, analytic continuation or distribution theorem is needed for the polynomial-symmetry argument.

## Exact supplier contracts

### From Mathlib

Use `WeierstrassCurve` in Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean, with `WeierstrassCurve.c₄`, `WeierstrassCurve.Δ`, `WeierstrassCurve.IsElliptic` and `WeierstrassCurve.j`. The model is just five coefficients; ellipticity is the separate assertion that Δ is a unit. The native j requires ellipticity. Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Basic.lean supplies `WeierstrassCurve.Affine.Equation` and `WeierstrassCurve.Affine.equation_iff`; Affine/Point.lean supplies `WeierstrassCurve.Affine.Point`, the algebra-homomorphism point map `WeierstrassCurve.Affine.Point.map` and `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`, whose tangent branch needs a nonsingular point unequal to its negative.

Use `WeierstrassCurve.map_j` in Weierstrass.lean, and `WeierstrassCurve.VariableChange` and `WeierstrassCurve.variableChange_j` in Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean. `WeierstrassCurve.IsCharNeTwoNF` in NormalForms.lean means exactly a₁=a₃=0; `WeierstrassCurve.toCharNeTwoNF` assumes invertible 2. Reduction.lean supplies `WeierstrassCurve.IsIntegral`, `WeierstrassCurve.integralModel_c₄_eq`, `WeierstrassCurve.integralModel_Δ_eq`, `WeierstrassCurve.IsMinimal`, `WeierstrassCurve.minimal`, `WeierstrassCurve.HasGoodReduction` and `WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction`; the last comparison assumes a minimal equation over the fraction field of a DVR. The good-reduction class extends minimality and asserts multiplicative discriminant valuation 1, which corresponds to additive valuation 0.

Use `Padic.valuation_ratCast` in Mathlib/NumberTheory/Padics/PadicNumbers.lean to compare rational and p-adic additive valuations; nonzero valuation-zero elements are p-adic units. The rational valuation inputs are `padicValRat`, `padicValRat.mul`, `padicValRat.div` and `padicValRat.add_eq_min` in Mathlib/NumberTheory/Padics/PadicVal/Basic.lean. Multiplication and division require nonzero operands; the unequal-valuation sum lemma also requires nonzero summands and sum. Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean supplies `quadraticChar` and `quadraticChar_card_sqrts` over finite fields, the latter with characteristic different from two. For the finite-field arguments use `quadraticChar_one_iff_isSquare`, `quadraticChar_neg_one_iff_not_isSquare`, `quadraticChar_neg_one`, `FiniteField.isSquare_neg_one_iff` and `quadraticChar_eq_pow_of_char_ne_two` in QuadraticChar/Basic.lean, and `quadraticChar_two` in QuadraticChar/GaussSum.lean, with multiplicativity and the two squareclasses of nonzero elements of an odd finite field. The special values at −1 and 2 depend on the field cardinality, with no prime-field restriction.

For the split algebra use `Ideal.quotientMulEquivQuotientProd` in Mathlib/RingTheory/Ideal/Quotient/Operations.lean with coprime ideals, `Polynomial.quotientSpanXSubCAlgEquiv` in Mathlib/RingTheory/Polynomial/Quotient.lean, and `QuotientGroup.map`, `QuotientGroup.eq_one_iff` in Mathlib/GroupTheory/QuotientGroup/Defs.lean. Use `AddCommGroup.equiv_directSum_zmod_of_finite` in Mathlib/GroupTheory/FiniteAbelian/Basic.lean only for finite abelian groups. The finite group argument never applies it to an arbitrary nonabelian group. `DirichletCharacter` and `DirichletCharacter.IsPrimitive` in Mathlib/NumberTheory/DirichletCharacter/Basic.lean, and `legendreSym` in Mathlib/NumberTheory/LegendreSymbol/Basic.lean, give native carriers for the character-support target. Primitivity means that the conductor equals the modulus; §1.4 assumes a positive modulus, excluding the native modulus-zero boundary.

### From Tau Ceti

TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean supplies the monic coefficient cubic `WeierstrassCurve.Affine.f`, `WeierstrassCurve.Affine.A` as the AdjoinRoot cubic algebra, `WeierstrassCurve.Affine.M` as its unit group modulo squares, `WeierstrassCurve.Affine.equivProdA'` and `WeierstrassCurve.Affine.equivProdA'_apply`. Under the normal-form and ellipticity hypotheses use `WeierstrassCurve.Affine.separable_f`, `WeierstrassCurve.Affine.μ`, `WeierstrassCurve.Affine.μ_apply`, `WeierstrassCurve.Affine.μ₀_some`, `WeierstrassCurve.Affine.μ₀_zero`, `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`, `WeierstrassCurve.Affine.μX_of_eval_f_eq_zero`, `WeierstrassCurve.Affine.ker_μ_eq` and `WeierstrassCurve.Affine.normM_μ₀_eq_one`. The homomorphism's source is the multiplicative copy of the native additive point group. Its root representative is x−θ plus the cubic cofactor, rather than the nonunit x−θ.

TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/TwoTorsion.lean supplies `WeierstrassCurve.Affine.card_ker_nsmul_two`; it counts roots, and does not export the labelled set equality. Affine/Point/VariableChange.lean supplies `WeierstrassCurve.Affine.Point.addEquivVariableChange` from points on C•W to points on W. `WeierstrassCurve.Affine.Point.equivVariableChange` is its underlying bijection, not itself the additive equivalence. NormalForms.lean supplies the root-point test `WeierstrassCurve.y_eq_zero_of_order_two`.

TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean supplies `WeierstrassCurve.pointCount`, `WeierstrassCurve.pointCount_eq_card_point`, `WeierstrassCurve.frobeniusTrace` and `WeierstrassCurve.frobeniusTrace_def`. The count is the cardinality of all affine solutions plus one, so the comparison with nonsingular points requires ellipticity and finite affine solution set. SingularPointCount.lean supplies `WeierstrassCurve.frobeniusTrace_eq_zero_of_c₄_eq_zero`: over a finite field, a model with Δ=0 and c₄=0 has trace 0. Affine/FinitePoint.lean supplies `WeierstrassCurve.Affine.finite_point` over finite coefficients. QuadraticTwist/Basic.lean supplies `WeierstrassCurve.quadraticTwistOf`, `WeierstrassCurve.Δ_quadraticTwistOf`, `WeierstrassCurve.c₄_quadraticTwistOf`, `WeierstrassCurve.j_quadraticTwistOf` and `WeierstrassCurve.isElliptic_quadraticTwistOf_iff`, including the unit twisting-discriminant condition over rings.

### From TauCetiRoadmap.EllipticCurves

Layer 4, “elliptic curves over local fields — reduction, Tate's algorithm, the Tate curve”, supplies general local minimal-model and potential-good-reduction theory. Its integral-j criterion is used only in its good-reduction consequence. Layer 5's quadratic twists are consumed through the native coefficient construction above. The worked example “The Frey–Hellegouarch curve” (section “Worked examples”) supplies `freyCurve A B`, the equation y²=x(x−A)(x+B) over every commutative ring with a₂=B−A, a₄=−AB and a₁=a₃=a₆=0, together with Δ=16A²B²(A+B)², c₄=16(A²+AB+B²) and, over a field with 2≠0, ellipticity iff A, B and A+B are all nonzero. Layer 0 specializes these identities at (A,B)=(1,−λ) and (d,−dλ); it assumes nothing of the example's Fermat normalization or conductor statements.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.7, “The Kronecker character of a fundamental discriminant”, supplies the primitive integral-valued character through Tau Ceti's fundamental-discriminant character; §1.8, “Primitive characters agreeing at almost all primes are equal”, supplies uniqueness from prime values. Section 1.51, “The primitive quadratic character of a rational square class”, supplies `squareclassDiscr`, `squareclassCharacter`, `squareclassCharacter_isPrimitive`, `squareclassCharacter_apply_prime`, `squareclassDiscr_one` and `odd_prime_dvd_squareclassDiscr_iff`, together with squarefree odd conductor: for a nonzero rational a there is a unique primitive quadratic character, allowing conductor 1, whose value at each odd prime where a is a unit is the Legendre symbol of its residue; an odd p divides its conductor iff v_p(a) is odd, and the odd conductor is squarefree. Thus a=1 has conductor 1, a=−1 has conductor 4, and a=3 has conductor 12. The Legendre symbol of a rational unit can be read as the symbol of numerator times denominator.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§5.3a, “The elliptic conductor exponent”, supplies the Artin-conductor definition of the actual elliptic conductor, independently of the auxiliary prime. §5.3g, “Elliptic conductor values and bounds”, supplies for E/ℚ the equivalence p∣N_E iff bad reduction at p and exponent one iff multiplicative reduction. At good primes the exponent is zero. In particular semistability away from 2 gives squarefree odd conductor. These are comparisons of minimal local models with the genuine Tate-module conductor. ArithmeticGaloisRepresentations Layer 3 supplies this owner's general Artin and Swan theory; it is not an additional conductor construction here.

## How to read the build

Layer 0 fixes the equations, the six root orders and the labelled two-torsion points. Layer 1 uses the invariant computation and the local suppliers to pass from good reduction to parameter units and character conductors. Layer 2 splits the native cubic algebra and reads the existing descent map, ending in the halving criterion. Layer 3 combines this with finite abelian groups and quadratic characters to control two-primary torsion. Layer 4 constructs and doubles the explicit conic witness on the twist by two. Layer 5 uses finite-field character sums for the symmetric cubic and the normal-form twist trace. Each target lists the inputs to its statement and to its indicated proof; the route does not constrain alternative proofs.

## Layer 0: Legendre equations and root orderings

### 0.1 The Legendre equation

Define `legendre` by the following coefficient specialization. For any commutative ring R and λ∈R, L(λ) is the existing WeierstrassCurve with coefficients a₁=a₃=a₆=0, a₂=−(1+λ), a₄=λ. Its equation is y²=x(x−1)(x−λ). This defines a model even at λ=0,1; these boundary models have discriminant zero.

(Bennett–Siksek, §6, equation (17), p.367; BS20 line 513.)

The supporting API states:

- The native affine equation of L(λ) is equivalent to y²=x(x−1)(x−λ).
- (L(λ)).map f=L(f(λ)) for every ring homomorphism f.
- L(λ)=L(μ) iff λ=μ, over every commutative ring (compare a₄).
- L(λ) is in native normal form a₁=a₃=0.
- L(λ) is the Frey equation y²=x(x−A)(x+B) at (A,B)=(1,−λ): the Frey coefficients B−A and −AB are −(1+λ) and λ.

Specify the five coefficients in WeierstrassCurve; the factored equation follows by ring algebra from Affine.equation_iff, and the Frey comparison by comparing a₂ and a₄.

**Checks.**

- Over ℚ, (L(2)).a₂=−3, and (2,0) satisfies the equation while (−2,0) does not: its cubic value is −24. The opposite sign of a₂ reverses these two root tests.
- Over ℚ, (L(−1)).a₂=0 and a₄=−1, giving y²=x³−x. This checks the specialization at the exceptional parameter.
- Over ℚ, Δ(L(2))=64 and Δ(L(1/2))=1. These test the discriminant factor, but do not distinguish the sign of a₂.
- Over ℚ, L(0) has Δ=0 and is singular. This tests that defining an equation does not assert ellipticity.
- Over 𝔽₃, λ=2 gives Δ=1 and c₄=0, hence j=0. This excludes an unintended j≠0 condition.
- Over the zero ring all coefficients and Δ are 0=1, so Δ is a unit. This prevents using a field's nonzero criterion over an arbitrary ring.
- In 𝔽₅[ε]/(ε²), λ=2+ε gives Δ=4+2ε, whose inverse is 4+3ε. This tests the coefficient identities on a nonreduced ring.

*Needs:* Mathlib `WeierstrassCurve`; Mathlib `WeierstrassCurve.Affine.Equation`; TauCetiRoadmap.EllipticCurves Worked examples (the Frey–Hellegouarch curve) for the Frey comparison.

### 0.2 The scaled Legendre equation

Define `scaledLegendre` by the following coefficient specialization. For a commutative ring R and d,λ∈R, L(d,λ) has coefficients (0,−d(1+λ),0,d²λ,0), hence equation y²=x(x−d)(x−dλ). For fields with 2≠0 it is the native quadratic twist (L(λ)) with parameters (0,−d/4): its twisting discriminant is d, not 4d.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371; BS20 line 703.)

The supporting API states:

- The affine equation is equivalent to y²=x(x−d)(x−dλ).
- L(1,λ)=L(λ).
- Mapping coefficients along f gives L(f(d),f(λ)).
- Over a field with 2≠0, L(d,λ) equals the native quadratic twist of L(λ) with parameters (0,−d/4); its twisting discriminant is d, so it is elliptic iff d≠0 and L(λ) is elliptic.
- L(d,λ) is the Frey equation y²=x(x−A)(x+B) at (A,B)=(d,−dλ), over every commutative ring; here A+B=d(1−λ).
- For a unit u of R, the admissible change with scaling u⁻¹ and r=s=t=0 carries L(d,λ) to L(u²d,λ), over every commutative ring; over a field the induced map of native points sends (x,y) on L(d,λ) to (u²x,u³y) on L(u²d,λ).

Specify the coefficients and factor the cubic. At 2≠0 compare all five coefficients with native quadratic twist at t=0,n=−d/4. For the Frey comparison, B−A=−dλ−d and −AB=d²λ. The scaling change multiplies a₂ by u² and a₄ by u⁴, and −u²d(1+λ), (u²d)²λ are the coefficients of L(u²d,λ).

**Checks.**

- Over ℚ, d=4 and λ=3 give a₂=−16 and a₄=48. The admissible change with u=1/4 (x_old=x_new/16, y_old=y_new/64, so a point (x,y) of L(3) goes to (16x,64y)) instead gives a₂=−64 and a₄=768, that is L(16,3); the change with u=4 gives a₂=−1/4 and a₄=3/256. These fix the weights d and d² of root scaling against the weights u⁻² and u⁻⁴ of an admissible change; root scaling by the square 4 is the change with u=1/2.
- L(2,1/2) over ℚ has a₂=−3,a₄=2,Δ=64. Both roots 1 and 1/2 are scaled by 2, giving roots 2 and 1.
- For d=0 all five coefficients vanish, and Δ=0, for every λ. This tests that the scaled model is total at d=0 and is not elliptic over a field there.
- d=2 gives native twist parameters (0,−1/2), with twisting discriminant 2; parameters (0,−2) instead give twisting discriminant 8. This fixes the scalar normalization.
- At d=2,λ=3 the Frey pair (A,B)=(2,−6) gives coefficients (0,−8,0,12,0), which are those of L(2,3), and A+B=−4=d(1−λ). The sign-reversed pair (2,6) gives (0,4,0,−12,0), the equation y²=x(x−2)(x+6) with roots 0,2,−6 instead of the ordered roots 0,2,6. This fixes the sign of B in the Frey comparison.

*Needs:* §0.1; Tau Ceti `WeierstrassCurve.quadraticTwistOf`; TauCetiRoadmap.EllipticCurves Worked examples (the Frey–Hellegouarch curve) for the Frey comparison; Mathlib `WeierstrassCurve.VariableChange` and Tau Ceti `WeierstrassCurve.Affine.Point.addEquivVariableChange` for the square-scaling change.

### 0.3 Six labelled Legendre parameters

For a field K, the labelled parameter tuple at λ is the Fin 6-indexed tuple (λ,1/λ,1−λ,1/(1−λ),λ/(λ−1),(λ−1)/λ). Labelled entries are retained, including repetitions. Mathematical parameter assertions require λ≠0,1; the tuple is a total rational-expression construction but its degenerate values are not valid parameters.

(Bennett–Siksek, §6, proof of Lemma 6.2, p.368; BS20 line 544.)

The supporting API states:

- The six evaluations, in the declared order, are exactly the displayed rational expressions.
- If λ≠0,1 then every labelled entry is different from 0 and 1.
- Labels (0,1), (2,3), and (4,5) have product 1 when λ≠0,1.
- An injective field homomorphism maps every labelled entry to the corresponding entry at f λ.

Evaluate the six rational expressions at their labels. Retain every label: exceptional parameters have coincident entries.

**Checks.**

- At −1 over ℚ the tuple is (−1,−1,2,1/2,1/2,2). This distinguishes the labelled tuple from a set of six distinct values.
- At 2 over ℚ the tuple is (2,1/2,−1,−1,2,1/2). Labels 2 and 3 coincide at −1; they are not discarded.
- At 1/2 over ℚ the tuple is (1/2,2,1/2,2,−1,−1). Labels 0 and 2 coincide, while labels 0 and 1 have product 1.
- At 3 over ℚ the tuple is (3,1/3,−2,−1/2,3/2,2/3), with six distinct values. This tests the generic case and all three reciprocal pairs.
- At λ=0 the total tuple is (0,0,1,1,0,0), and at λ=1 it is (1,1,0,0,0,0); these are not six nonsingular parameters. This tests the junk values of the total tuple.

*Needs:* Mathlib fields, Fin 6-indexed tuples and field homomorphisms.

### 0.4 Legendre discriminant and ellipticity

For every commutative ring, Δ(L(λ))=16λ²(1−λ)² and c₄(L(λ))=16(λ²−λ+1). Over a field with 2≠0, L(λ) is elliptic iff λ≠0 and λ≠1; for these parameters its native j-invariant equals 256(λ²−λ+1)³/(λ²(1−λ)²). The identities form one simultaneous coefficient calculation.

(Silverman, S09 §III.1, Weierstrass invariant formulas; substitute the coefficients of §0.1.)

Specialize the Frey identities Δ=16A²B²(A+B)² and c₄=16(A²+AB+B²) at (A,B)=(1,−λ), where A²B²(A+B)²=λ²(1−λ)² and A²+AB+B²=λ²−λ+1; alternatively substitute the five coefficients into native b₂,b₄,b₆,b₈,c₄,Δ. Over a field apply ellipticity iff Δ is a unit, or the Frey criterion that A=1, B=−λ and A+B=1−λ are nonzero. Divide c₄³ by Δ only on an elliptic model. No hypothesis j≠0 or j≠1728 is imposed.

**Checks.**

- Over ℚ, λ=2 and λ=1/2 give (Δ,c₄,j)=(64,48,1728) and (1,12,1728). Different invariants can yield the same j.
- At λ=−1 over ℚ, (Δ,c₄,j)=(64,48,1728). This tests the sign and factors in the native invariant formulas.
- In characteristic 2, Δ=0 for every λ; over 𝔽₃, λ=2 has Δ=1 and j=0. These test that the ellipticity criterion needs 2≠0 and that characteristic three is not excluded.

*Needs:* §0.1; Mathlib `WeierstrassCurve.Δ`; Mathlib `WeierstrassCurve.c₄`; Mathlib `WeierstrassCurve.j`; Mathlib `WeierstrassCurve.IsElliptic`; TauCetiRoadmap.EllipticCurves Worked examples (the Frey–Hellegouarch curve) for the Frey route.

### 0.5 Scaled Legendre discriminant

Δ(L(d,λ))=16d⁶λ²(1−λ)² and c₄(L(d,λ))=16d²(λ²−λ+1). For a field with 2≠0 and d≠0, L(d,λ) is elliptic iff λ≠0,1; on elliptic models j(L(d,λ))=j(L(λ)).

(Silverman, S09 §III.1; specialize the native discriminant, c₄ and j twist identities at (0,−d/4).)

Compute the coefficients, or specialize the Frey identities at (A,B)=(d,−dλ), where A²B²(A+B)²=d⁶λ²(1−λ)² and A²+AB+B²=d²(λ²−λ+1), or specialize the native discriminant and c₄ twist identities with twisting discriminant d. Over a field with 2≠0 the Frey criterion reads d≠0, dλ≠0 and d(1−λ)≠0. Apply native j-invariance under twisting. The d≠0 assumption is indispensable; over a ring nonzero must be replaced by IsUnit where ellipticity is claimed.

**Checks.**

- At d=2,λ=1/2 over ℚ, (Δ,c₄,j)=(64,48,1728). This tests the powers d² and d⁶ in c₄ and Δ.
- At d=0 over ℚ, Δ=c₄=0 and the equation is singular for every λ, so no native j is formed.
- For d=2,λ=3, Δ=36864=2⁶·576 and c₄=448=2²·112, where 576 and 112 are Δ and c₄ of L(3). Scaling a₂ by d² and a₄ by d⁴, which is the change with u=1/d and gives L(d²,λ), would instead give Δ=2¹²·576=2359296 and c₄=2⁴·112=1792.
- For d=2,λ=3 the Frey formulas at (A,B)=(2,−6) give Δ=16·4·36·16=36864 and c₄=16·(4−12+36)=448, the same values as the twist route. The sign-reversed pair (2,6) has A+B=8 and gives Δ=16·4·36·64=147456 and c₄=16·(4+12+36)=832 instead.

*Needs:* §0.2; §0.4; Tau Ceti `WeierstrassCurve.Δ_quadraticTwistOf`; Tau Ceti `WeierstrassCurve.c₄_quadraticTwistOf`; Tau Ceti `WeierstrassCurve.j_quadraticTwistOf`; TauCetiRoadmap.EllipticCurves Worked examples (the Frey–Hellegouarch curve) for the Frey route.

### 0.6 Root-ordering cross-ratios

Let e₀,e₁,e₂ be pairwise distinct in a field, and λ=(e₂−e₀)/(e₁−e₀). The cross-ratios obtained from root orders (012),(021),(102),(120),(210),(201) equal, respectively, the six entries of the labelled parameter tuple at λ. Each lies outside {0,1}. Repetitions in values do not collapse the six root orderings.

(Bennett–Siksek, §6, six ratios in proof of Lemma 6.2, p.368; BS20 line 544.)

Write every quotient in terms of d=e₁−e₀ and λ using e₂−e₀=dλ. Cancel only the nonzero differences; compute each numerator and denominator. The conclusion concerns ordered equations and does not classify all curves with that j-invariant.

**Checks.**

- Roots (0,1,−1) produce exactly the labelled exceptional tuple; roots (0,1,3) produce the generic tuple. This tests the order of the numerator and denominator in the root ratio.
- Roots (3,5,9) give ratios (3,1/3,−2,−1/2,3/2,2/3). This tests the order of the numerator and denominator in the root ratio.
- Coincident roots (0,0,1) give a zero denominator in the first ratio; total division yields 0 rather than a legitimate parameter. This tests the junk value of total division, which the distinctness hypothesis excludes.

*Needs:* §0.3.

### 0.8 Legendre normalization of a split cubic

Let W over a field K with 2≠0 be in native normal form a₁=a₃=0, with cubic f=(X−e₀)(X−e₁)(X−e₂) and pairwise distinct roots. Set d=e₁−e₀, λ=(e₂−e₀)/d. Translation x_old=x_new+e₀,y_old=y_new gives a native admissible coordinate change C with C•W=L(d,λ). Hence C•W is the native quadratic twist of L(λ) with parameters (0,−d/4), so W is K-isomorphic to a quadratic twist of L(λ); here d≠0 and λ≠0,1. Reordering roots yields exactly the six parameters: for the root orders (012),(021),(102),(120),(210),(201) of §0.6, whose parameters are the six labelled entries at λ, translation by the first root of the order gives L(d′,λ′) with scalars d′=d, dλ, −d, d(λ−1), d(1−λ), −dλ respectively, each nonzero.

(Bennett–Siksek, §6, Legendre discussion p.367 and proof of Lemma 6.2 p.368; BS20 line 544.)

Expand the split monic cubic and translate by e₀ using the native admissible coordinate change action. The translated roots are 0,d,dλ; compare the five coefficients with L(d,λ). For the order (abc) the scalar is e_b−e_a, which on the translated roots 0,d,dλ takes the six displayed values. Apply §0.6 to every ordering and the scaled/native-twist coefficient identity. Translation is a K-isomorphism; passage to L(λ) itself is a twist, not generally a K-isomorphism.

**Checks.**

- For roots (3,5,9), d=2,λ=3; the original coefficients (−17,87,−135) become (−8,12,0) under translation by +3, giving y²=x(x−2)(x−6). This fixes the direction of the coordinate translation.
- Over ℚ the ordering (3,5,9) gives the nonsquare d=2, and L(2,3) is not ℚ-isomorphic to L(3): an admissible change multiplies Δ by u⁻¹², while Δ(L(2,3))/Δ(L(3))=2⁶ is not the twelfth power of a rational. The ordering (5,9,3) gives d=4 and λ=−1/2, and the change with u=2,r=5 sends y²=(x−3)(x−5)(x−9) to L(−1/2). This distinguishes K-isomorphism to L(d,λ) from K-isomorphism to an unscaled Legendre model, which depends on the ordering.
- For roots (3,5,9) the six orders give (d′,λ′)=(2,3),(6,1/3),(−2,−2),(4,−1/2),(−4,3/2),(−6,2/3), and translation by the first root of each order gives the root triples (0,2,6),(0,6,2),(0,−2,4),(0,4,−2),(0,−4,−6),(0,−6,−4), each equal to (0,d′,d′λ′). Keeping d′=2 for the second order would give L(2,1/3), with roots 0,2,2/3, which are not a translate of 3,5,9. This fixes the scalar attached to each ordering.

*Needs:* §0.2; §0.5; §0.6; Mathlib `WeierstrassCurve.VariableChange`; Tau Ceti `WeierstrassCurve.Affine.f`.

### 0.9 Normalization from full K-rational two-torsion

For every field K with decidable equality and 2≠0, if E/K is an elliptic Weierstrass curve whose native K-point group has exactly four points killed by 2, there exist a native K-admissible coordinate change C, d∈K× and λ∈K\{0,1} such that C•E=L(d,λ). All associated parameters are precisely the labelled six root-ordering parameters, allowing coincidences. The headline is `exists_scaledLegendre_of_full_two_torsion`.

(Silverman, S09 §§III.1–III.2; the native normal-form and two-torsion root-count declarations give the general-field statement. BS20 lines 513–516 use its rational specialization.)

Use native toCharNeTwoNF to complete the square. Transport the native point group by the variable change. Apply native card_ker_nsmul_two: the normalized cubic has exactly three K-rational roots. Ellipticity makes it separable, so they are distinct; degree three and monicity give the split factorization. Apply §0.8. The normalization does not use an automorphism classification and works at j=0 and j=1728 as well.

**Checks.**

- Over ℚ, E:y²=x³−x is normalized by d=1,λ=−1 and has doubling kernel {O,(0,0),(1,0),(−1,0)}. This tests the rational specialization.
- Over 𝔽₃ the same model has four points killed by 2 and d=1,λ=2,Δ=1; characteristic three and j=0 are included.
- Over ℚ, y²=x³−2x has only O and (0,0) killed by 2, so the full-two-torsion hypothesis fails; a single rational root is insufficient.

*Needs:* §0.8; Mathlib `WeierstrassCurve.toCharNeTwoNF`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`; Tau Ceti `WeierstrassCurve.Affine.Point.addEquivVariableChange`; Tau Ceti `WeierstrassCurve.Affine.separable_f`.

### 0.10 The three labelled two-torsion points

For a field K with 2≠0,d≠0,λ≠0,1, the labelled root-point tuple for d,λ is the Fin 3-indexed tuple of native points (0,0),(d,0),(dλ,0) of L(d,λ), each supplied with its native nonsingularity proof. Their y-coordinate is zero; the point at infinity is not an entry.

(Silverman, S09 §III.2, negation on a Weierstrass equation; specialize to the three roots. BS20 lines 666–667 use these points over a prime field.)

The supporting API states:

- The three labelled points have exactly the root coordinates displayed in the definition.
- 2•T_j=O for every label j.
- The Fin 3 tuple is injective and all its entries are nonzero points.
- A native point P satisfies 2•P=O iff P=O or P is one of the three labelled points; the doubling kernel therefore has cardinality 4.

Use §0.5 for ellipticity and the factored equation to prove each displayed point nonsingular. Use native negation and addition to show doubling is zero; distinct roots distinguish the three points. Their sum is O by the horizontal line y=0. Conversely native y_eq_zero_of_order_two forces an affine point killed by 2 to have y=0, and the factored equation then forces x to be one of the three roots.

**Checks.**

- For d=1,λ=−1 over ℚ the labelled coordinates are (0,0),(1,0),(−1,0). This distinguishes affine root points from O.
- For d=2,λ=1/2 over ℚ the coordinates are (0,0),(2,0),(1,0); the third x-coordinate is smaller than the second. This tests the label order (0,d,dλ) rather than increasing size.
- For d=1,λ=3 over ℚ the sum of the three labelled native points is O, and each is killed by doubling. This tests the horizontal-line relation T₀+T_d+T_dλ=O; a tuple with O in place of one root point would sum to the omitted root point instead.
- For L(−1)/𝔽₃ the four points are O,(0,0),(1,0),(2,0); all are killed by 2. This tests both inclusions and the count even at j=0.

*Needs:* §0.2; §0.5; Mathlib `WeierstrassCurve.Affine.Point`; Tau Ceti `WeierstrassCurve.y_eq_zero_of_order_two`; Tau Ceti `WeierstrassCurve.Affine.card_ker_nsmul_two`.

### Examples

For L(−1)/ℚ, the rational two-torsion points are (0,0),(1,0),(−1,0), the discriminant is 64 and j=1728. The labelled tuple is (−1,−1,2,1/2,1/2,2). For roots (3,5,9), translation by +3 gives d=2,λ=3; its six values are (3,1/3,−2,−1/2,3/2,2/3).

### Dependencies

Mathlib equation, invariant, normal-form and point-group APIs; Tau Ceti point transport, quadratic twists and two-torsion root count; EllipticCurves' worked Frey–Hellegouarch identities for the Frey comparison of §§0.1–0.2 and the Frey route of §§0.4–0.5. Within the layer: equations precede invariants, ordered roots precede normalization, and distinct roots precede labelled point enumeration.

## Layer 1: Good reduction and character conductors

### 1.1 Nonintegral Legendre parameters force nonintegral j

Let p be an odd rational prime and λ∈ℚ\{0,1}. Write a=v_p(λ), b=v_p(1−λ). If a<0 then b=a and v_p(j(L(λ)))=2a<0. If a>0 then b=0 and v_p(j(L(λ)))=−2a<0. If b>0 then a=0 and v_p(j(L(λ)))=−2b<0. Consequently v_p(j(L(λ)))≥0 implies a=b=0.

(Silverman, S09 §III.1, j-invariant formula; the valuations are derived below. BS20 lines 526–546 give the good-prime application under semistability.)

Apply native padicValRat.add_eq_min to λ+(1−λ)=1; the three bad cases above exhaust failure of a=b=0. When λ or 1−λ has positive valuation, λ²−λ+1 is a unit; when a<0 its λ² term uniquely has the least valuation 2a. Use j=256(λ²−λ+1)³/(λ²(1−λ)²). The factor 256 is a p-adic unit even at p=3. Over ℚ the numerator factor λ²−λ+1=(λ−1/2)²+3/4 is positive, so j and every factor entering the valuation formula are nonzero. There is no assumption that j itself is a unit.

**Checks.**

- At λ=2,p=2, v₂(j)=6 but v₂(λ)=1, so integral j does not force unit parameters at p=2. This exposes the excluded dyadic case, where the factor 256 of j is not a unit.
- At λ=3,p=3, (v₃(λ),v₃(1−λ),v₃(j))=(1,0,−2); at λ=1/3 the triple is (−1,−1,−2); at λ=−2 it is (0,1,−2). These test the three alternatives a>0, a<0 and b>0 with their values −2a, 2a and −2b.
- At λ=−1,p=3, the triple is (0,0,3). This distinguishes integral j, which is all the conclusion a=b=0 needs, from unit j.

*Needs:* §0.4; Mathlib `padicValRat`; Mathlib `padicValRat.mul`; Mathlib `padicValRat.div`; Mathlib `padicValRat.add_eq_min`.

### 1.2 Parameters at good odd primes

Let F/ℚ be elliptic and suppose an admissible rational change C identifies C•F with L(d,λ). Ellipticity then forces d≠0 and λ∉{0,1}; these are consequences, not additional hypotheses. For an odd prime p, assume the minimal equation of the base change of F to ℚ_p has good reduction. Then v_p(λ)=v_p(1−λ)=0. This holds for every associated root ordering. The theorem does not require semistability; in particular it applies to the semistable-away-from-2 curves of Lemma 6.2(i). Its native statement is `legendre_units_of_good_reduction`.

(Bennett–Siksek, §6, Lemma 6.2(i), pp.367–368; BS20 line 526.)

At a good minimal local model, c₄ is integral and Δ is a unit, so j is integral. Use the native integralModel c₄ and Δ comparisons to prove v_p(j(F))≥0, transport j by map_j, and compare valuations with Padic.valuation_ratCast; EllipticCurves Layer 4 supplies the general potential-good-reduction criterion. Native j invariance under admissible coordinate change and native quadratic twist identifies j(F) with j(L(λ)). Apply §1.1. For every root ordering the same argument applies; never infer good reduction of a ramified quadratic twist merely from equal j.

**Checks.**

- For F:y²=x³−x at p=5, the parameters −1,2,1/2 have complements 2,−1,1/2; all six valuations are 0. This tests the root-ordering independence at a good prime.
- For F=L(−1), p=3 gives v₃(−1)=v₃(2)=0 while v₃(j)=3; the proof cannot demand unit j.
- Over ℚ₃, the admissible change with u=1/3 (x_old=x_new/9, y_old=y_new/27, so a point (x,y) of L(−1) goes to (9x,27y)) gives y²=x³−81x, with Δ=64·3¹² and v₃(Δ)=12; the change with u=3 would give a₄=−1/81 instead. The curve still has good reduction, witnessed by L(−1), whose discriminant has valuation 0. This tests curve-level good reduction rather than the displayed discriminant.

*Needs:* §1.1; §0.9; §0.5; TauCetiRoadmap.EllipticCurves Layer 4; Mathlib `WeierstrassCurve.map_j`; Mathlib `WeierstrassCurve.integralModel_c₄_eq`; Mathlib `WeierstrassCurve.integralModel_Δ_eq`; Mathlib `Padic.valuation_ratCast`; Mathlib `WeierstrassCurve.variableChange_j`; Mathlib `WeierstrassCurve.minimal`.

### 1.3 Nonsingular reduction of the unit Legendre model

For λ∈ℚ\{0,1} and an odd prime p with v_p(λ)=v_p(1−λ)=0, the coefficient model L(λ) is integral over ℤ_p with unit discriminant. Its reduction is an elliptic Legendre model over 𝔽_p with parameter λ̄≠0,1; the curve has good reduction at p. This statement is about L(λ) itself, not an arbitrary d-twist.

(Bennett–Siksek, §6, proof of Lemma 6.4, p.368; BS20 lines 568–569; the minimality statement follows from the native reduction predicates and the unit discriminant.)

The coefficients −(1+λ),λ are integral; Δ=16λ²(1−λ)² is a unit. For an integral equation the multiplicative discriminant valuation is at most 1; the unit discriminant attains 1, hence is maximal and gives native minimality. The native good-reduction comparison then gives nonsingular reduction. Reduction of both nonzero units excludes the two singular parameters.

**Checks.**

- At λ=3,p=5, Δ=576≡1 and λ̄=3,1−λ̄=3 are nonzero; at p=3, v₃(Δ)=2 and λ̄=0. This tests minimal good reduction of the unscaled equation.
- At p=2 two parameter units cannot occur: in 𝔽₂, λ̄=1 forces 1−λ̄=0. The unit hypotheses are therefore unsatisfiable at p=2, so the statement is vacuous there; the factor 16 of Δ is in any case a 2-adic nonunit.

*Needs:* §0.4; §0.1; Mathlib `Padic.valuation_ratCast`; Mathlib `WeierstrassCurve.IsIntegral`; Mathlib `WeierstrassCurve.IsMinimal`; Mathlib `WeierstrassCurve.HasGoodReduction`; Mathlib `WeierstrassCurve.hasGoodReduction_iff_isElliptic_reduction`.

### 1.4 Odd support of the attached primitive character

Let F/ℚ, C,d,λ be as in §1.2 and let ω∈{1,−1,2,−2}. Let N>0 and let χ be an integral-valued primitive Dirichlet character modulo N satisfying χ(q)=(ωλ/q) at every odd prime q with v_q(ωλ)=0. Then every odd prime dividing N is a bad prime of F. Equivalently, the odd prime support of N is contained in the bad odd prime set of F. The prime-value hypothesis identifies an actual native character, supplied by ClassicalArithmeticCompletion §1.51. As in §1.2, semistability is unnecessary for the support assertion.

(Bennett–Siksek, §6, Lemma 6.2(ii), pp.367–368; BS20 line 526.)

Use ClassicalArithmeticCompletion §§1.8, 1.51 to identify χ and to read an odd conductor prime by the parity of v_p(ωλ). For odd p each allowed ω has valuation zero. If F had good reduction, §1.2 would give v_p(λ)=0, contradicting odd parity. This argument uses native primitive characters specified by prime values and never assumes the desired support containment.

**Checks.**

- For λ=2 and λ=1/2, the radicands at ω=1,−1,2,−2 have conductors 8,8,1,4, respectively; each odd part is 1. This tests invariance under rational squares.
- For λ=3, the four radicands 3,−3,6,−6 have conductors 12,3,24,24, all with odd part 3. This tests the odd prime 3, where v₃(ωλ)=1 is odd and v₃(j)=−2 makes 3 bad, and the conductor 3 rather than 12 of −3.
- For λ=−1 the radicands −1,1,−2,2 have conductors 4,1,8,8; their odd parts are all 1. This tests the primitive conductor, including conductor 1.

*Needs:* §1.2; TauCetiRoadmap.ClassicalArithmeticCompletion §§1.8, 1.51; Mathlib `padicValRat.mul`.

### 1.5 Odd character conductor divides the elliptic conductor

Let F/ℚ have full rational two-torsion and be semistable away from 2, choose any of its associated parameters λ, and let ω∈{1,−1,2,−2}. If N is the primitive conductor of the character of ωλ and M is the actual elliptic conductor of F, then the odd part of N divides M, hence divides the squarefree odd part of M. The theorem includes N=1. The source does not supply nontriviality of the odd conductor under these hypotheses alone.

(Bennett–Siksek, §6, Lemma 6.2(ii), pp.367–368; BS20 line 526.)

The supplier gives squarefree odd character conductor. The support theorem puts each of its prime factors in the bad-prime set of F. NeronModelsAndSemistableAbelianVarieties §5.3g puts each such prime in M and identifies exponent one under multiplicative reduction. Prime factorization gives divisibility. The same support argument also proves divisibility without semistability, while the squarefree-odd-M wording uses semistability.

**Checks.**

- F:y²=x³−x has conductor 32; all four ω at λ=−1 give characters with odd conductor 1, so the result is valid without a nontrivial-character hypothesis. This distinguishes conductor divisibility from conductor nontriviality.
- For λ=3, ω=1, the character has N=12 and odd part 3. At p=3 the integral equation L(3) has v₃(Δ)=2<12, so it is minimal, and v₃(c₄)=v₃(112)=0, so reduction is multiplicative and 3 divides M exactly once although 3² divides Δ=576. This distinguishes the elliptic conductor from the displayed discriminant.

*Needs:* §1.4; TauCetiRoadmap.ClassicalArithmeticCompletion §§1.8, 1.51; TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g; TauCetiRoadmap.EllipticCurves Layer 4.

### Examples

For λ=3, j=21952/9 and v₃(j)=−2. For λ=1/3 the same j has v₃(j)=−2. For λ=−1 the value 1728 has v₃=3 while both parameter factors are units. The character of 3 has conductor 12 and odd part 3; the character of 1 has conductor 1.

### Dependencies

Layer 0 equations, invariant formulas and rational normalization; EllipticCurves Layer 4; ClassicalArithmeticCompletion §§1.8, 1.51; NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g. Character conductors require no descent or finite-field torsion result.

## Layer 2: Split-cubic readings of the native descent map

Throughout this layer K is a field with 2≠0, d≠0 and λ∉{0,1}; native point-group assertions use decidable equality on K. All three coordinates use the fixed root order (0,d,dλ). The target is a reading of the native descent map, not a second descent construction.

### 2.1 The Legendre split-cubic CRT

For L(d,λ) under the standing hypotheses, define the ordered root-evaluation equivalence to be the canonical root-evaluation ring equivalence A=K[X]/(X(X−d)(X−dλ)) ≃ K×K×K, in root order (0,d,dλ). It is an adapter for the native Affine.A étale algebra, not a replacement algebra.

(Bennett–Siksek, §6, two-descent display, p.370; BS20 line 658 gives the split squareclass target over a prime field; Silverman, S09 §X.1, Proposition 1.4 gives split two-descent over a general field. The ordered algebra equivalence follows from native polynomial CRT: Mathlib `Ideal.quotientMulEquivQuotientProd` and `Polynomial.quotientSpanXSubCAlgEquiv`; Tau Ceti `WeierstrassCurve.Affine.equivProdA'_apply`. These constructions yield the displayed ordered evaluations.)

The supporting API states:

- The class of h(X) maps to (h(0),h(d),h(dλ)).
- Two native A classes agree iff their three root evaluations agree.
- The native AdjoinRoot root maps to (0,d,dλ).
- A class is a unit iff every root evaluation is nonzero.

The three linear factors are pairwise coprime because d, dλ, d(1−λ) are nonzero. Apply the native CRT decomposition at root 0 (equivProdA′), then the polynomial CRT on its cofactor and quotientSpanXSubC at d and dλ. The inverse sends (a₀,a₁,a₂) to the class of Σ_j a_j ∏ₖ≠ⱼ(X−e_k)/(e_j−e_k), where (e₀,e₁,e₂)=(0,d,dλ). Every denominator is nonzero by distinctness of the roots.

**Checks.**

- At d=1,λ=−1 over ℚ, the root maps to (0,1,−1). This tests the fixed root order (0,d,dλ).
- At d=2,λ=1/2 over ℚ, the root maps to (0,2,1), whose third entry is smaller than the second. This tests that the order is (0,d,dλ) rather than increasing size.
- The class of X is not a unit, since its first coordinate is zero; its squareclass is not formed. This tests the fixed root order and unit domain of the equivalence.
- At d=2,λ=3, the class of X+1 maps to (1,3,7), the class of X² maps to (0,4,36), and constant 1 maps to (1,1,1). These computations distinguish the root order.

*Needs:* §0.2; §0.5; Tau Ceti `WeierstrassCurve.Affine.A`; Tau Ceti `WeierstrassCurve.Affine.equivProdA'`; Tau Ceti `WeierstrassCurve.Affine.equivProdA'_apply`; Mathlib `Ideal.quotientMulEquivQuotientProd`; Mathlib `Polynomial.quotientSpanXSubCAlgEquiv`.

### 2.3 Root readings of native squareclasses

Define the split squareclass equivalence to be the induced multiplicative equivalence from native M=Aˣ/(Aˣ)² to (Kˣ/(Kˣ)²)³, obtained from the ordered root-evaluation equivalence. It transports μ values; it defines neither a new generic descent homomorphism nor a new kernel theorem.

(Native unit and quotient transport: Mathlib `QuotientGroup.map` applied to the equivalence of §2.1. BS20 lines 657–662 use the split squareclass target over a prime field.)

The supporting API states:

- For a native A unit u, its image is the triple of squareclasses of the three CRT unit evaluations.
- The trivial native squareclass maps to (1,1,1).
- A native squareclass is 1 iff all three coordinate squareclasses are 1.
- The reading preserves multiplication; it is an equivalence, not merely a map.

Map units through the root-evaluation ring equivalence. This carries the square subgroup bijectively onto the product of the three square subgroups; descend it and its inverse through the native quotient construction. Use the equivalence to read the native μ and its norm condition.

**Checks.**

- Over ℚ with d=2,λ=3, the unit represented by X+1 has ordered reading (1,[3],[7]); interchanging the last two roots gives the distinct reading (1,[7],[3]).
- Over the same model, X+2 has evaluations (2,4,8) and reading ([2],1,[2]); the middle coordinate is trivial and the outer coordinates are not.
- Over the same model, X−1 has evaluations (−1,1,5) and reading ([−1],1,[5]); the first and third classes are nontrivial and distinct.
- Constant 0 has evaluations (0,0,0) and is excluded from the unit group. This prevents forming a squareclass of a nonunit.

*Needs:* §2.1; Tau Ceti `WeierstrassCurve.Affine.M`; Mathlib `QuotientGroup.map`.

### 2.5 Native descent away from the roots

For an affine native point (x,y) on L(d,λ) with x∉{0,d,dλ}, the split reading of μ(P) is ([x],[x−d],[x−dλ]), with all three representatives nonzero. The image of O is (1,1,1).

(Bennett–Siksek, §6, two-descent discussion, p.370; BS20 lines 657–662; the native nonroot formula gives the general-field reading.)

Use native μ_apply followed by μ₀_some to pass from μ of the affine point to μX of its x-coordinate. The factored cubic is nonzero at x, so native μX uses its nonroot representative x−θ. Apply the CRT evaluation and quotient-unit reading. At O use native μ_apply and μ₀_zero.

**Checks.**

- On L(4)/𝔽₇, P=(3,1) has representatives (3,2,6), product 36≡1=y² and squareclass signs (−1,+1,−1). Replacing all differences by root-minus-x gives product −1, a nonsquare.
- On L(−1)/𝔽₅, P=(2,4) has representatives (2,1,3), product 6≡1=y² and squareclass pattern (nonsquare,square,nonsquare). Its nontrivial first class shows, by §2.8, that P is not a double, although 2P=(0,0).
- At a root x=0 the uncorrected first entry would be 0, which is not a unit; that point belongs to the separate root branch. This distinguishes the nonroot representative from the corrected root branch.

*Needs:* §2.3; §2.1; §0.2; Tau Ceti `WeierstrassCurve.Affine.μ`; Tau Ceti `WeierstrassCurve.Affine.μ_apply`; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_ne_zero`; Tau Ceti `WeierstrassCurve.Affine.μ₀_zero`; Tau Ceti `WeierstrassCurve.Affine.μ₀_some`.

### 2.6 Native descent at the three two-torsion points

The split readings at T₀,T_d,T_dλ on L(d,λ) are respectively ([d²λ],[−d],[−dλ]), ([d],[d²(1−λ)],[d(1−λ)]), and ([dλ],[d(λ−1)],[d²λ(λ−1)]). All representatives are nonzero. The entry at a root is the derivative product of the other two differences, not zero.

(Bennett–Siksek, §6, Lemma 6.5 and proof of Lemma 6.6, pp.370–371; BS20 lines 666–667, 710, 715; the native root representative gives the general-field formula.)

Use native μ_apply followed by μ₀_some to pass from μ of the affine point to μX of its x-coordinate. At a root r native μX uses r−θ+fCofactor(r), not r−θ alone. At its own root evaluation fCofactor(r)(r)=f′(r)=∏ₛ≠ᵣ(r−s); at other roots the cofactor vanishes and r−s remains. Compute the displayed three tuples in declared CRT order; units follow from distinct roots.

**Checks.**

- Over 𝔽₅ with d=2,t=v=2,i=3 and λ=2t²=3, the conic relation holds and the three raw root tuples are (2,3,4),(2,2,1),(1,4,4). Their squareclass readings are ([2],[2],1),([2],[2],1),(1,1,1), fixing the scale-two root labels.
- On L(−1)/𝔽₅ the raw tuples at roots 0,1,−1 are (4,4,1),(1,2,2),(4,3,2); their squareclass patterns are (1,1,1),(1,[2],[2]),(1,[2],[2]). This tests the derivative entry in place of an inadmissible zero class.
- For d=2,λ=3 over ℚ the tuples are (12,−2,−6),(2,−8,−4),(6,4,24), whose products are 144,64,576. This tests the derivative entry in place of an inadmissible zero class.

*Needs:* §2.3; §2.1; §0.10; §0.2; Tau Ceti `WeierstrassCurve.Affine.μX_of_eval_f_eq_zero`; Tau Ceti `WeierstrassCurve.Affine.μ_apply`; Tau Ceti `WeierstrassCurve.Affine.μ₀_some`.

### 2.7 Product of the split descent coordinates

For every native point P on L(d,λ), the product of the three split readings of μ(P) is 1. This expresses the native norm condition in the three split coordinates; it holds at O and at the two-torsion roots as well.

(Bennett–Siksek, §6, two-descent discussion p.370; BS20 line 661; the displayed products prove the assertion over K.)

For O, use native μ_apply and μ₀_zero and the multiplicative equivalence, so all three classes are 1. For a point away from the roots, §2.5 gives representatives x,x−d,x−dλ. Their product is y² by the scaled equation, and y≠0, so its unit squareclass is 1. At T₀,T_d,T_dλ, §2.6 gives representative products d⁴λ², d⁴(1−λ)², d⁴λ²(λ−1)² respectively. Each is a nonzero square. The native normM_μ₀_eq_one gives the matching general norm condition; the coordinate proof does not assume an unstated split-norm comparison.

**Checks.**

- At T₀ on L(2,3) over ℚ, the corrected representatives are (12,−2,−6), with product 144=12². The uncorrected first representative 0 gives product 0 and no unit squareclass.
- At O the product is 1·1·1=1; at P=(2,4) over 𝔽₅ it is [2·1·3]=[1]. This tests the product condition at O and at a nonroot point over a finite field.

*Needs:* §2.3; §2.1; Tau Ceti `WeierstrassCurve.Affine.normM_μ₀_eq_one`; Tau Ceti `WeierstrassCurve.Affine.μ_apply`; §2.5; §2.6; Tau Ceti `WeierstrassCurve.Affine.μ₀_zero`; §0.2.

### 2.8 The Legendre halving criterion

For a native affine point P=(x,y) on L(d,λ) over K with 2≠0,d≠0,λ≠0,1, there exists Q∈L(d,λ)(K) with 2Q=P iff x,x−d,x−dλ are all squares in K. Here a field square may be 0, but zero is not passed to a unit squareclass. The criterion also covers the three two-torsion points. The headline is `scaledLegendre_halving_iff_squares`.

(Silverman, S09 §X.1, Proposition 1.4, split two-descent; BS20 line 554 uses the sufficient direction over a prime field and BS20 line 659 states the kernel. The native kernel theorem gives both directions over K.)

The native descent-kernel theorem gives halving iff μ(P)=1. Apply the split squareclass equivalence. Away from the roots, use §2.5. QuotientGroup.eq_one_iff says a unit class is trivial iff its representative lies in the range of squaring; a nonzero field square has a nonzero square root, hence a unit square root. At a root exactly one difference is zero. The other two classes are explicit and the root component is their product, so their being squares is equivalent to all three split classes being trivial. Zero is a square in the field, but it is never a unit representative.

**Checks.**

- For d=1,λ=−1 over ℚ, the three differences at (0,0) are 0,−1,1, so the criterion is false; over 𝔽₅ they are 0,4,1, so it is true. This distinguishes a field square, which may be zero, from a unit squareclass.
- Over 𝔽₅ at (1,0) the differences are 1,0,2, and 2 is nonsquare; the criterion is false even though zero is a field square. This distinguishes a field square, which may be zero, from a unit squareclass.

*Needs:* §2.5; §2.6; §2.3; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`; Mathlib `QuotientGroup.eq_one_iff`.

### Examples

At roots (0,2,6), the root-element evaluations are (0,2,6), and the three root descent tuples have products 144,64,576. These are nonzero squares although none of the first representatives is zero. Over 𝔽₅ the point (2,4) on L(−1) has readings ([2],[1],[3]) with product 1.

### Dependencies

Layer 0 equation, roots and ellipticity; native XSubT algebra and descent, Mathlib polynomial and ideal CRT and quotient groups. Evaluation and quotient-unit readings precede descent formulas; both affine branches precede the product and halving theorems. No new generic norm comparison is an input.

## Layer 3: Two-primary torsion over finite fields

### 3.1 Two-by-four torsion over odd finite fields

Let F be any finite field with decidable equality and 2≠0, and let η∈F satisfy η≠0 and η²≠1. The native point group of L(η²):y²=x(x−1)(x−η²) contains a subgroup additively isomorphic to ZMod 2 × ZMod 4. In particular 8 divides the native projective point count. Its native subgroup statement is `legendre_two_by_four_subgroup`.

(Bennett–Siksek, §6, Lemma 6.3, p.368; BS20 lines 547–557 give the nonsquare-minus-one prime-field case. The square-minus-one branch and the same finite-field character argument give the stated generality.)

The two-torsion enumeration supplies all four points. If −1 is square, then 0,−1,−η² are squares, so (0,0) has a half by §2.8. Otherwise apply the halving criterion at (1,0). If 1−η² is a square, this point is a double. Otherwise the nonzero 1−η² is a nonsquare. Since −1 is a nonsquare in this branch, multiplicativity of the quadratic character makes η²−1 a square. The criterion at (η²,0) now gives a half. A half P of a nonzero point killed by 2 has exact order 4. A different nonzero two-torsion point T is not 2P, hence is independent of ⟨P⟩. The map (a,b)↦aT+bP embeds ZMod 2×ZMod 4; native finite-point and count comparison give 8|projective point count.

**Checks.**

- At η=0 the cubic is x²(x−1), and at η=±1 it is x(x−1)²; both have Δ=0. These excluded inputs do not supply elliptic point groups.
- At p=5,η=2, L(4) has 8 points and P=(2,1) doubles to (0,0); T=(1,0) is independent. This tests the square-minus-one branch.
- Over 𝔽₉=𝔽₃[i] with i²=−1, η=i gives λ=−1 and P=(i,1−i), with 2P=(0,0); the count is 16. This tests a field that is not prime.
- At p=3 no η satisfies η≠0 and η²≠1; the statement has no instance, rather than asserting a singular point group.
- At p=7,η=2, the points P=(3,1) and T=(0,0) have orders 4 and 2, with 2P=(1,0)≠T; their generated subgroup has 8 elements. This tests subgroup independence, beyond the existence of a point killed by four.

*Needs:* §2.8; §0.10; §0.4; Mathlib `quadraticChar_one_iff_isSquare`; Mathlib `quadraticChar_neg_one_iff_not_isSquare`; Tau Ceti `WeierstrassCurve.Affine.finite_point`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`.

### 3.2 A half of the zero root on the minus-one model

For every field K with 2≠0 and a specified i with i²=−1, construct the native point P=(i,1−i) on L(−1). Prove that 2P=(0,0) and that P has exact additive order 4; include native nonsingularity in the construction. Over every finite field with q≡5 mod8 elements a choice of i exists. Its choice is retained under field extension.

(Bennett–Siksek, §6, proof of Lemma 6.5, p.370; BS20 lines 668–671. Membership and doubling over a general field follow by the displayed identities.)

The supporting API states:

- The coordinates are (i,1−i).
- Twice this point is the native point (0,0) on L(−1).
- This point has exact additive order 4.
- The first split coordinate of native μ at this point is the squareclass [i].
- For a field homomorphism K→L, the native point map L(−1)(K)→L(−1)(L) sends this chosen half to the half specified by f(i).

Membership is (1−i)²=−2i=i(i−1)(i+1). The native tangent/doubling formula gives x(2P)=0,y(2P)=0; characteristic 2 is excluded and the tangent denominator is nonzero. The double is a nonzero two-torsion point, so order is 4. The first descent class is [i] by §2.5, since i is none of 0,1,−1.

**Checks.**

- At p=5,i=2, P=(2,4) has double (0,0), so 2P≠O and 4P=O. This distinguishes exact order four from two-torsion.
- At p=5,i=2, y²=1=x³−x and 2y=3; at i=3, P=(3,3) has y²=4=x³−x and 2y=1. Both tangent denominators are nonzero.
- At p=5 the two choices i=2,3 are nonsquares, giving first descent character −1; at p=17,i=4 is square, giving +1. Nonsquareness needs p≡5 mod8.

*Needs:* §0.1; §0.4; §0.10; Mathlib `FiniteField.isSquare_neg_one_iff`; Mathlib `WeierstrassCurve.Affine.Point`; Mathlib `WeierstrassCurve.Affine.Point.map`; §2.5 for the descent-coordinate API; Mathlib `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`.

### 3.6 No order-eight point on the minus-one model

For every finite field F with q≡5 mod8 elements, L(−1)(F) has no point of exact order 8. Only (0,0) among the three nonzero two-torsion points is divisible by 2; each of its four halves has nonsquare first descent coordinate.

(Bennett–Siksek, §6, proof of Lemma 6.5, p.370; BS20 lines 666–672 give the prime-field argument. The finite-field supplementary laws and the same descent argument give the stated generality.)

The finite-field supplementary laws give quadraticChar(F)(2)=−1 and quadraticChar(F)(−1)=1 from q≡5 mod8; hence 2 is a nonsquare and −1 is a square. These are the cardinality laws quadraticChar_two and quadraticChar_neg_one, valid over F itself. In §2.6 the tuples at (0,0),(1,0),(−1,0) are (1,1,1),(1,[2],[2]),(1,[2],[2]). Every point of order 4 must double to (0,0). The four halves of (0,0) are the translates of the minus-one half by the doubling kernel (enumerated in §0.10). Their first descent class is [i], since every root tuple has first class 1. An i with i²=−1 is a nonsquare: otherwise a square root of i would have order 8 in F×, contrary to q−1≡4 mod8 (equivalently the finite-field Euler criterion gives i^((q−1)/2)=−1). The native descent-kernel theorem rules out halving any point of order 4, hence rules out order 8.

**Checks.**

- At p=5 the point group has 8 elements but exponent 4; thus 8|#E does not imply an order-eight element. This separates group order from the existence of an order-eight element.
- At p=13, the point count is 8 and every point has order 1,2 or 4, so the point group is ℤ/2×ℤ/4 itself. This tests a second prime q≡5 mod8.
- At p=41, P=(6,13) has order 8 and the full count is 32; p≡1 mod4 alone is insufficient. This tests that the congruence q≡5 mod8 is the hypothesis that excludes order eight.

*Needs:* §3.2; §2.6; §0.10; §2.8; Mathlib `quadraticChar_two`; Mathlib `quadraticChar_neg_one`; Mathlib `quadraticChar_eq_pow_of_char_ne_two`; Tau Ceti `WeierstrassCurve.Affine.ker_μ_eq`.

### 3.7 Exact two-adic order of the minus-one point count

For every finite field F with q≡5 mod8 elements, v₂(projective point count(L(−1)/F))=3, equivalently 8 divides this positive integer and 16 does not divide it. The count is the full projective elliptic count, including O. The headline is `legendre_minus_one_point_count_v_two`.

(Bennett–Siksek, §6, Lemma 6.5, p.370; BS20 line 663 states the prime-field case. The argument below uses only the cardinality congruence and the general-field inputs of §§3.2, 3.6.)

The native point group is finite and its doubling kernel has cardinality 4. The explicit order-four half with an independent two-torsion point gives a subgroup of order 8. Use the existing finite-abelian-group structure theorem. Since there is no point of order 8, each two-primary cyclic factor has order at most 4. Exactly two factors contribute to the doubling kernel, so the 2-part is at most 16. If it were 16, both factors would have order 4 and every two-torsion point would be divisible by 2, contradicting §3.6, which identifies only one nonzero divisible point. Thus the two-primary group is Z/2×Z/4, of order 8. Compare native projective point count and the cardinality of Point.

**Checks.**

- At p=5,13,29 the counts are 8,8,40 and their odd quotients by 8 are 1,1,5; 16 divides none. This distinguishes exact two-part eight from a divisibility-by-eight assertion.
- Over 𝔽₁₂₅ the count is 104=8·13, so v₂=3; this tests a field that is not prime.
- An abstract group ℤ/4×ℤ/4 has four points killed by 2 and no order-eight point, but has order 16; the unique divisible nonzero two-torsion point is essential. This distinguishes exact two-part eight from a divisibility-by-eight assertion.

*Needs:* §3.2; §3.6; §0.10; Mathlib `AddCommGroup.equiv_directSum_zmod_of_finite`; Tau Ceti `WeierstrassCurve.Affine.finite_point`; Tau Ceti `WeierstrassCurve.pointCount_eq_card_point`.

### Examples

At p=7,η=2, L(4) has 8 points. At p=5, the two points (2,4),(3,3) on L(−1) double to (0,0). The group has 8 elements and exponent 4. At p=29 the count 40 has two-part 8, so the theorem concerns the two-primary subgroup rather than the order of the full group.

### Dependencies

Layers 0 and 2; finite native points and point-count comparison; Mathlib quadratic characters, supplementary laws and finite abelian groups. The explicit half and its first descent class precede the no-order-eight theorem; that theorem and the precise divisible-root information precede exact two-adic count.

## Layer 4: Explicit order-four points in the twist by two

Throughout this layer K is a field with 2≠0, t,v are nonzero, i²=−1 and 2t²+2v²=1; put λ=2t². Native point-group assertions use decidable equality on K. Write r=2t and s=2iv. Then r²=2λ, s²=2λ−2, r²−s²=2 and rs=4itv. These identities fix the signs of the coordinates and of the doubling computation.

### 4.1 The corrected order-four witness

For every field K with 2≠0, nonzero t,v and i satisfying i²=−1 and 2t²+2v²=1, put λ=2t². Construct the native point P=(2λ+4itv,8itv(t+iv)) on L(2,λ). These hypotheses imply λ≠0,1 and y(P)≠0. Prove native membership, doubling and exact order as supporting targets. This construction requires no progression hypothesis.

(Bennett–Siksek, §6, proof of Lemma 6.6, p.371, with the y-coordinate corrected as proved below; BS20 line 718.)

The supporting API states:

- Coordinates are exactly (4t²+4itv,8itv(t+iv)).
- Twice this point is the native two-torsion point (2λ,0).
- This point has exact additive order 4.
- The third split reading of native μ(P) is [4itv].
- For a field homomorphism K→L, the native point map L(2,λ)(K)→L(2,f(λ))(L) sends P to the witness with parameters f(t),f(v),f(i).

Set r=2t,s=2iv: r²=2λ,s²=2λ−2,rs=4itv. Then x=r²+rs and y=rs(r+s). The three factors x,x−2,x−2λ equal r(r+s),s(r+s),rs, so the product is y². Distinct cubic roots and the scaled-invariant criterion give nonsingularity. If r+s=0 then r²=s² would force 2=0, so y is nonzero. The tangent numerator is 2rs(r+s)² and its nonzero denominator is 2rs(r+s), so the slope is r+s. Native doubling gives x(2P)=(r+s)²−a₂−2(r²+rs)=r² and y(2P)=−rs(r+s)+(r+s)rs=0. Thus 2P=(2λ,0)≠O and 4P=O. Since x(P)−2λ=rs=4itv≠0, §2.5 gives the third descent class [4itv]. The corrected y-coordinate satisfies the equation; the printed expression is excluded by the example below.

**Checks.**

- Over 𝔽₅ with t=v=2,i=3, λ=3 and the corrected point is (4,3), with y²=4 equal to the cubic value; the printed pair (4,4) has y²=1 and fails membership.
- With t=v=2,i=2 over 𝔽₅, the chosen point is (3,4). The printed pair (3,1) is its negative and also lies on the curve: membership alone does not fix the chosen sign.
- For i=3, r=4,s=2 give r²−s²=2, r+s=1 and 2P=(1,0)≠O; for i=2 the slope is 2 and the double is again (1,0). Thus both witnesses have exact order 4.
- For i=3 the three descent representatives are (4,2,3), product 4; for i=2 they are (3,1,2), product 1. The third representatives 3 and 2 are nonsquares, so their classes need not be trivial.
- Over 𝔽₉=𝔽₃[i] with i²=−1, t=v=1 gives λ=2, P=(1+i,1−i), y²=i and cubic value i; its double is (1,0). This tests characteristic three and a field extension.

*Needs:* §0.2; §0.5; §0.10; Mathlib `WeierstrassCurve.Affine.Point.map`; §2.5 for the descent-coordinate API; Mathlib `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`.

### Examples

Over 𝔽₅, t=v=2 gives λ=3. For i=3 the corrected point is (4,3) with double (1,0); for i=2 it is (3,4), again with double (1,0). The printed y expression in BS20 line 718 gives (4,4) in the first case: y²=1 while the cubic value is 4. The corrected y=8itv(t+iv) gives 3, whose square is 4. The examples test the local identity and assert no progression hypotheses.

### Dependencies

Layer 0 scaled equation, invariants and root points; Layer 2 nonroot descent; Mathlib native tangent addition. Membership precedes doubling, doubling precedes exact order, and the third descent reading needs only membership with nonzero y and the nonroot formula. No progression or trace theorem is a prerequisite.

## Layer 5: Trace and downstream interfaces

### 5.1 Character-sum point counts and symmetric cubics

For every finite field F of odd characteristic, with q elements, and every native Weierstrass equation W with a₁=a₃=0, put f(x)=x³+a₂x²+a₄x+a₆. Prove (W.pointCount:ℤ)=q+1+Σ_x quadraticChar(F)(f(x)), and W.frobeniusTrace=−Σ_x quadraticChar(F)(f(x)). These assertions include singular equations and their singular solutions. For each x, the number of square roots of f(x) is 1+quadraticChar(F)(f(x)); sum this pinned square-root identity and add O. (Silverman, S09 §V.1, counting points over finite fields; the formula is derived from Mathlib `quadraticChar_card_sqrts`.)

Call y²=x³+a·x, the native equation (0,0,0,a,0), a symmetric cubic: its cubic f(x)=x³+a·x satisfies f(−x)=−f(x). For every finite field F with q≡3 mod4 elements and every a∈F, the symmetric cubic has projective point count q+1 and Frobenius trace 0. It is elliptic when a≠0; at a=0 its singular solution is included. The headline is `symmetric_cubic_trace_zero`. The Legendre equation L(u,−1): y²=x(x−u)(x+u) is the case a=−u², by §0.2, so it has count q+1 and trace 0 for every u∈F; since −1 is a nonsquare, these cases are exactly the a with −a a square, and the Legendre form alone omits the other half of the nonzero a. (Koblitz, K84 p.41, cited by locator without the text; BS20 line 464 points to this page for the prime-field elliptic Legendre case. The character cancellation below proves the stated finite-field generality.)

The congruence q≡3 mod4 makes q odd, so the count formula above applies, and makes −1 a nonsquare in F. Since f(−x)=−f(x), the character values at x and −x cancel, including zeros. The integer sum is zero and the native trace definition gives the result, also for a=0, where the equation is the cusp y²=x³ and Tau Ceti `WeierstrassCurve.frobeniusTrace_eq_zero_of_c₄_eq_zero` gives the trace directly.

**Checks.**

- At p=3,u=1, that is a=−1, the square-root counts at x=0,1,2 are 1,1,1; the count is 4 and trace 0. This includes characteristic three and O.
- At p=7,u=2, that is a=−4=3, the character values in x-order are (0,1,0,1,−1,0,−1), sum 0; the count is 8 and trace 0. This fixes the cancellation and trace signs.
- At p=7,a=1 the square-root counts at x=0,…,6 are (1,2,0,2,0,2,0); the count is 8 and trace 0. Since −1 is a nonsquare in 𝔽₇, a=1 is not −u² for any u, so a statement about L(u,−1) alone would omit this equation.
- At p=3,a=0 the affine counts are 1,2,0, so the singular cubic still has projective count 4 and trace 0. This tests the count's domain.
- At p=5,u=1 the count is 8 and trace −2, and at p=5,a=1 the count is 4 and trace 2. This detects omission of the congruence hypothesis.
- Over 𝔽₂₇, every a∈𝔽₂₇ gives count 28 and trace 0. Over 𝔽₉, u=1 gives count 16 and trace −6, so odd characteristic alone does not suffice; the cardinality congruence matters.
- Over 𝔽₂, y²=x³+1 has count 3, whereas 2+1+Σ_x quadraticChar(𝔽₂)(x³+1)=4. The character-sum formula needs odd characteristic.

*Needs:* §0.2 for the Legendre specialization; Mathlib `WeierstrassCurve.IsCharNeTwoNF`; Mathlib `quadraticChar`; Mathlib `quadraticChar_card_sqrts`; Mathlib `quadraticChar_neg_one`; Tau Ceti `WeierstrassCurve.pointCount`; Tau Ceti `WeierstrassCurve.frobeniusTrace_def`; Tau Ceti `WeierstrassCurve.frobeniusTrace_eq_zero_of_c₄_eq_zero` for the cusp.

### 5.2 Quadratic-twist trace over odd finite fields

For every finite field F with decidable equality and odd characteristic, every native Weierstrass equation W with a₁=a₃=0, and every d∈F, prove `quadraticTwistOf_frobeniusTrace`: (W.quadraticTwistOf 0 (−d/4)).frobeniusTrace=quadraticChar(F)(d)·W.frobeniusTrace. No ellipticity or d≠0 hypothesis is needed for these projective counts. (Silverman, S09 §V.1, point counting; the normal-form twist coefficients are Tau Ceti `WeierstrassCurve.quadraticTwistOf`; BS20 lines 703–705 give the Legendre d=2 consequence.)

For d≠0, write the twisted cubic as f_d(x)=x³+da₂x²+d²a₄x+d³a₆. Substitution x=dz permutes F and gives f_d(dz)=d³f(z). Apply §5.1 and multiplicativity, with quadraticChar(d³)=quadraticChar(d). At d=0 the twisted equation is y²=x³, whose character sum is Σ_x quadraticChar(x³)=Σ_x quadraticChar(x)=0, so both sides are zero. For the last equality, multiplication by a nonsquare permutes F and negates the sum; an odd finite field has a nonsquare.

The Legendre consequence is a_q(L(d,λ))=quadraticChar(F)(d)·a_q(L(λ)), by §0.2. If d≠0 and λ≠0,1, the good Euler polynomial is 1−quadraticChar(F)(d)a_q(L(λ))T+qT². At q≡5 mod8 and d=2 the trace changes sign. This equation comparison is independent of rational local-factor assembly and analytic continuation.

**Checks.**

- At p=5,λ=3,d=2 the unscaled and scaled counts are 4 and 8, with traces 2 and −2 and quadraticChar(2)=−1. This fixes the twist and trace signs.
- At p=5,λ=3,d=4 both counts are 4 and both traces are 2, since quadraticChar(4)=1. Square twist scalars are included.
- At p=5,d=2,λ=0 the singular unscaled and scaled models have counts 5 and 7, hence traces 1 and −1. This tests the formula without ellipticity.
- At d=0 over 𝔽₅ the twisted equation is y²=x³ with count 6 and trace 0; quadraticChar(0)=0. The trace identity holds, but no good Euler polynomial is asserted.
- Over 𝔽₉=𝔽₃[i], W:y²=x³+x+1 has count 16 and trace −6; d=1+i is a nonsquare, and the twist has count 4 and trace 6. This tests a normal-form equation outside the Legendre specialization over a field that is not prime.

*Needs:* the character-sum formula of §5.1; Tau Ceti `WeierstrassCurve.quadraticTwistOf`; Tau Ceti `WeierstrassCurve.frobeniusTrace`; Mathlib `quadraticChar`; Mathlib `quadraticChar_exists_neg_one`; §0.2 for the Legendre consequence; Mathlib `quadraticChar_two` for its d=2 sign.

### Examples

For λ=3 over 𝔽₅ the character sum is −2 before scaling and 2 after scaling by 2. Thus the counts are 4 and 8, traces 2 and −2, and Euler polynomials 1−2T+5T² and 1+2T+5T². For u=2 over 𝔽₇, the symmetric cubic L(2,−1), with a=−4, has character sum 0, count 8 and trace 0; so has a=1, which is not of Legendre form over 𝔽₇.

### Dependencies

Layer 0 equations and scaled/native-twist identity for the Legendre consequences; native normal-form equations, twists, point count and integer trace; Mathlib quadratic-character multiplicativity, square-root counts and supplementary laws. Symmetric cancellation and twist comparison are independent of Layers 1–4 and of any global analytic theory.

## Downstream consumers

ErdosProgressionPowers §2.1 consumes the coefficient models of §§0.1–0.2 with the square-scaling change of §0.2, the labelled parameters of §0.3, the ordering scalars of §0.8 and the general-field normalization of §0.9, the good-prime units and conductor divisibility of §§1.2 and 1.5, the descent readings and halving criterion of Layer 2, the odd-finite-field subgroup theorem of §3.1, the exact two-part of §3.7, the order-four witness of §4.1 and the trace identities of Layer 5. Its Layer 2 keeps the progression-specific arguments, the progression hypotheses and the nontriviality of the odd character conductor. EllipticCurveModularityPartII §5.1 packages full rational two-torsion as a predicate; §0.9 supplies normalization under that condition. MordellLawrenceVenkatesh §6.4 consumes the coefficient model of §0.1 and its discriminant and j-invariant from §0.4, and keeps the cyclic variant, its abelian-by-finite structure and its good-model statements. ArithmeticDynamics §§6.35, 6.111 consume the same model and invariants for Lattès maps and projected torsion sets; §6.112 extends the torsion-image result. ComputationalNumberTheory §3.17 consumes the normal-form character-sum identity of §5.1 and keeps its finite-enumeration form of the count.

The exports include all four characters at ω=±1,±2, all six root labels with possible repetitions, every odd prime of good curve-level reduction, and the square as well as nonsquare twist scalar. Bad-prime local factors and characteristic-two elliptic normalizations have their general owners in EllipticCurves and NeronModelsAndSemistableAbelianVarieties; the polynomial identities here still describe the singular characteristic-two Legendre equations.

## References

- Michael A. Bennett and Samir Siksek, *A conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191 (2020), 355–392, DOI 10.4007/annals.2020.191.2.2. Publisher version: https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf. BS20 lines 462–464 are the symmetric Legendre cubic and its trace, line 513 is equation (17), lines 526–546 are Lemma 6.2, lines 547–557 are Lemma 6.3, lines 655–672 are the descent display and Lemma 6.5, and lines 703–727 are the local part of Lemma 6.6. The order-four witness uses the corrected y-coordinate proved in Layer 4; line 718 is the printed expression tested there.
- The Mathlib and Tau Ceti modules named in the exact supplier contracts fix the formal conventions. The cross-roadmap contracts refer to EllipticCurves Layer 4, Layer 5 and its worked Frey–Hellegouarch example, ModularCurves §§4C, 9E, ClassicalArithmeticCompletion §§1.7, 1.8, 1.51 and NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3g.

- Joseph H. Silverman, *The Arithmetic of Elliptic Curves*, second edition, 2009, S09 §§III.1–III.2 (invariants and two-torsion), §V.1 (finite-field point counting), §X.1, Proposition 1.4 (split two-descent), DOI 10.1007/978-0-387-09494-6. Uncertified: cited by locator without the text.
- Neal Koblitz, *Introduction to Elliptic Curves and Modular Forms*, first edition, 1984, K84 p.41, DOI 10.1007/978-1-4684-0255-1. Uncertified: cited by locator without the text; the page is identified by BS20 line 464.
