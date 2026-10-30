# Roadmap: modularity of elliptic curves over ℚ, part II: effective residual comparisons

**Summary.** Modularity attaches a weight-two newform to every elliptic curve over ℚ. This continuation develops effective residual comparisons: removed-prime bounds, sharp rationality thresholds, exact-conductor comparison curves with rational two-torsion, and uniform irreducibility and rational-isogeny surjectivity. It builds the arithmetic comparisons on the general modular-form, elliptic-curve and modular-curve libraries.

## Scope and ownership

EllipticCurveModularity ends at rational elliptic modularity; this Part II owns the six comparison layers below. The parent theorem supplies modularity independently of the uniform image conclusions here. This direction is retained throughout.

The elliptic isogeny, duality, torsion, Weil pairing, local reduction, Tate-curve and twist theories belong to EllipticCurves Layers 1–5; global minimal equations belong to its Layer 4.5b. ModularForms Layers 3, 4, 6, 8, 8G and 10 own old/new spaces, the all-Hecke newform and bad-prime coefficient theorems, normalized exact-divisor Atkin–Lehner operators, coefficient fields, integral coefficients, Galois conjugate newforms and their orbit sizes, and the characteristic-zero Sturm and dimension infrastructure. ComputationalNumberTheory §3.4 owns the level-one rational-coefficient prime-modulus Sturm specialization; the arbitrary-level, character and ideal extension is built here. ModularCurves Layers 1A and 1D own the projective elliptic scheme and group law; StableReduction Layer 5 owns minimal regular proper models. JacobianChallenge Layers D–F own general Jacobians, abelian varieties and Abel–Jacobi maps. These constructions are consumed here rather than reconstructed.

General arithmetic representations, optimized modular lifts and modular Jacobians belong to the earlier suppliers in the exact contracts below. Layer 5 owns the prime and composite rational cyclic-isogeny classifications, extending the fixed-vector torsion exclusion of EisensteinIdealAndRationalTorsion §§7.8 and 8.9 to stable lines. Layer 6 owns the arithmetic continuation of ModularCurvesPartII: Chen’s comparison on the supplied curves, rational-point theorems, normalized coordinates, winding quotients and their integral comparison. ModularSymbolsPadicLFunctions §§0.6–0.8 and 1.1 supply symbol duality and rational periods; the geometric cuspidal-divisor theorem and the saturated winding lattice are proved here. The unconditional modular abelian rank-zero application and its weight-two finite-level arithmetic classes and reciprocity are owned by §6.0e; EulerSystemsAndKolyvaginSystems supplies conditional descent. Section 6.0e owns the common geometric theta/Siegel units and ordered symbols, their weight-two moment and reciprocity, and the CM induced-character/elliptic-unit adapter used for rank zero. PadicFamilies §§4.0.1–4.0.3, a consumer of this roadmap, is to import these objects under the export contract stated under Downstream consumers rather than construct them again, and extends them through higher-weight moments, family interpolation and broader cyclotomic bounds; its identification of the k=2, r=r′=1 moment with the classes here uses the weight-two normalization dictionary of §6.0e. Section 6.0f owns the explicit elliptic isogeny-degree bound needed for its rational-point theorem; ArakelovGeometryAndAbelianHeights §§4.4 and 5.9 supply the height comparisons along a given isogeny and with j. The five-level nonvanishing, formal immersion and j-integrality arguments then use these targets. The sharp square-root thresholds here are denoted F♯, G♯, H♯ (sharpF, sharpG, sharpH); they differ from the numerical majorants without square roots. Each threshold has one definition in §§1.5–1.7. The modular coordinates are constructed in §6.0a; §6.15 proves their integral-value characterization. The progression applications listed under Downstream consumers use Layers 1–6; their specialized arithmetic is outside this roadmap.

ImaginaryQuadraticClassNumber §H3.6 owns the nine-field and thirteen-order class-number-one classifications used in §5.0a; ComplexMultiplicationAndExplicitReciprocity Layer 3 supplies their CM interpretation and singular values.

WeightsInEtaleCohomology R34.6 supplies the all-embedding Hecke bound; its geometric realization includes the normalization that a generic purity statement alone does not supply. The pinned torsion action, representation scalar extension, coefficient fields, ramification groups and finite locally free commutative affine group schemes are used directly through the declarations below. No second carriers for these objects are constructed here.

## Conventions

Fix the algebraic closure ℚ̄ of ℚ. Elliptic curves are over ℚ unless another field is specified. The notation E[ℓ] means the actual geometric torsion representation. The newform representation ρ̄_f,λ means the semisimplification of a stable-lattice reduction over its residue field κ_λ; comparisons use a common residue-field extension. For rational f, κ_λ=𝔽_ℓ, and the general quotient comparison is C[ℓ]^ss≅ρ̄_f,ℓ. An irreducible E[ℓ]≅C[ℓ]^ss makes C[ℓ] irreducible and gives C[ℓ]≅E[ℓ]. Arithmetic Frobenius at q has characteristic polynomial T²−a_q T+q; thus det(1−Frob_q T)=1−a_q T+qT². For y²=x³−x over 𝔽₅ there are 8 points, so a₅=−2 and the latter polynomial is 1+2T+5T².

- M and Δ denote the arithmetic conductor and minimal discriminant of E. The integer ord_q(Δ) is the valuation exponent; q ∥ M means exponent one.
- For N>0, μ(N)=[SL₂(ℤ):Γ₀(N)] and `μ(N)=N∏_{q|N}(1+1/q)`. The number g⁺(N) is the complex dimension of the trivial-character weight-two newspace on Γ₀(N), the trivial-character part of the Γ₁(N) newspace.
- N(E[ℓ]) is the Artin conductor away from ℓ, hence prime to ℓ. Serre weight is the weight of the optimized residual modular lift. The deletion level M₀ is M divided by the product of all q ∥ M with ℓ dividing ord_q(Δ), possibly including q=ℓ. It can differ from N(E[ℓ]); Layer 4 states the comparison hypotheses.
- A rational cyclic n-isogeny has Galois-stable geometric cyclic kernel of order n; no rational generator is required. Full rational two-torsion means all four geometric two-torsion points are rational. Non-CM means every geometric endomorphism is an integer scalar.
- A nonsplit Cartan is the multiplication group of the quadratic finite-field extension, in an arbitrary base-field basis; its normalizer contains it with index two. Containment is taken up to conjugacy.
- The split plus subgroup Nsp is the monomial subgroup, as in ModularCurvesPartII §9.5: it is the split Cartan normalizer for odd p and the order-2 stabilizer of a line pair at p=2. At p=2 the literal normalizer of the trivial split Cartan is GL₂(𝔽₂) and is a different subgroup. For the explicit correspondence at odd p, choose a nonsquare δ∈𝔽ₚˣ and put Nsp=Stab{0,∞}, Nns=Stab{√δ,−√δ} in the same projective coordinate; their intersection has order 4(p−1). Transport this pair by simultaneous conjugation. This joint choice belongs to the correspondence, while image containment remains an up-to-conjugacy predicate. At p=2 take Nns=GL₂(𝔽₂) and the stated order-2 Nsp (Chen, Theorem 2, pp. 1–2; de Smit–Edixhoven, Remark 3, p. 4).
- Mixed modular curves are smooth projective normalizations of the indicated fibre products. For r>0, p prime and gcd(r,p)=1, write `X₀⁺(rp²)=X₀(rp²)/w_{p²}`. Here p² is an exact divisor, and the involution retains the r-level.
- F♯, G♯, H♯ are real-valued at positive levels; division by 6 is real, square roots precede powers and comparisons with ℓ are strict. G♯ uses lcm(N,4).
- The modular differential is ω_f=2πi f(z)dz, and the winding path runs from 0 to i∞. At a cusp of width w with t=exp(2πiz/w), it is w·f(t)dt/t; for a cusp form with expansion Σ a_n tⁿ its cotangent value is w·a₁ dt. If W(f)=i∫₀∞f(it)dt, its normalized period is 2πi W(f). This convention is used for every winding quotient and cotangent comparison below.

## Exact supplier contracts

### From Mathlib

Consume `Algebra.norm_eq_prod_embeddings` and `AlgHom.card` (RingTheory/Norm/Transitivity and FieldTheory/PrimitiveElement), with finite separable field-extension hypotheses; `RingOfIntegers` and ideal contraction express the prime-above-ℓ condition. Consume `Representation.IsIrreducible` (RepresentationTheory/Irreducible), which requires a nonzero representation space as well as absence of proper nonzero invariant subspaces. `AddMonoidHom.toZModLinearMap` (Algebra/Module/ZMod) reads an additive map of ZMod modules as a linear map. `AddSubgroup.torsionBy` and its ZMod module (Algebra/Module/Torsion/Basic) are the torsion carriers, and `CongruenceSubgroup.Gamma0` supplies the index. The norm statement uses number fields, never arbitrary inseparable extensions. Consume `WeierstrassCurve.j` (AlgebraicGeometry/EllipticCurve/Weierstrass) for nonsingular curves and `Matrix.SL2.commutator_eq_top` (LinearAlgebra/Matrix/SpecialLinearGroup) with a≠0 and a²≠1 for perfectness.

### From Tau Ceti

Consume `WeierstrassCurve.torsionGaloisAction` and `WeierstrassCurve.torsionGaloisAction_apply_coe` (AlgebraicGeometry/EllipticCurve/Affine/Point/Galois): the action takes values in additive automorphisms and applies Galois to coordinates. Consume `Representation.baseChange` (RepresentationTheory/BaseChange) for absolute irreducibility. Consume `TauCeti.Isogeny`, its degree, kernel and base change, and `TauCeti.Isogeny.Hom` with its additive group and identity (AlgebraicGeometry/EllipticCurve/Isogeny/Basic, Degree, Kernel, BaseChange/Basic, Hom/Basic and Hom/Add).

Consume `TauCeti.cuspFormsNew` (NumberTheory/ModularForms/Newforms/Basic) and `cuspFormCharSpace` (NumberTheory/ModularForms/DiamondOperators) for `newDimension`. Consume `HeckeRing.GL2.Newform` (NumberTheory/ModularForms/Newforms/Newform), its native cusp form and nebentypus, and `modFormCharSpace` (DiamondOperators) with `UpperHalfPlane.qExpansion` (Mathlib NumberTheory/ModularForms/QExpansion) for the rationality and ideal-congruence headlines. Consume `TauCeti.ModularForm.eq_of_sturm_bound` (NumberTheory/ModularForms/SturmBound), for equal-weight forms on a subgroup of finite relative index with discrete strict periods, using the actual cusp width and including coefficient zero. This is characteristic-zero equality, separate from the ideal-congruence extension in Layer 4. The coefficient-field construction and number-field theorem are `TauCeti.CoefficientField` (Newforms/Fields) and `TauCeti.numberField_CoefficientField` (Newforms/NumberField), for weight at least two. Local conductors use `Ideal.ramificationGroup` (RingTheory/Ideal/RamificationGroup), and finite-flat weight comparisons use `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` (AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree); neither supplies an elliptic conductor or Serre-weight theorem by itself.

### From TauCetiRoadmap.EllipticCurves

Consume Layers 1–2's isogenies, quotient kernels, prime-to-degree torsion equivalence, two-dimensional geometric prime torsion and Weil pairing; Layer 4's reduction and Tate-curve descriptions; Layer 4.5b's global minimal equation over ℚ; Layer 5's quadratic twist action. Rational isogenies preserve the arithmetic conductor via the rational Tate-module comparison and the conductor contract.

### From TauCetiRoadmap.ModularForms

Consume Layer 3's old/new decomposition, Layer 4's all-Hecke primitive-form and bad-prime coefficient theorems, Layer 6's normalized Atkin–Lehner operators at exact divisors, Layer 8's integral Hecke algebra and coefficients, Layer 8G's Galois stability and conjugate newforms, and Layer 10's congruence index, dimension and characteristic-zero Sturm comparison. Layer 8G supplies aₙ(f^σ)=σ(aₙ(f)), character transport and the coefficient-field orbit-size theorem; integral coefficients alone do not construct conjugate forms. The general integral ideal-congruence Sturm theorem of this roadmap’s Layer 4 extends the level-one specialization owned by ComputationalNumberTheory §3.4.

### From TauCetiRoadmap.ModularCurves, TauCetiRoadmap.StableReduction and TauCetiRoadmap.JacobianChallenge

Consume ModularCurves Layers 1A and 1D's projective elliptic scheme and group law, StableReduction Layer 5's minimal regular proper models, and JacobianChallenge Layers D–F's general Jacobian and Abel–Jacobi universal property. The modular Hecke and integral-model specializations are required by the contracts below.

### From TauCetiRoadmap.Chebotarev and TauCetiRoadmap.ComputationalNumberTheory

Consume Chebotarev Layer 10, Dirichlet-density Chebotarev, for the finite Galois extension generated by C[4]. ComputationalNumberTheory §3.4 supplies the level-one rational-coefficient prime-modulus congruence Sturm theorem, the specialization of the general ideal theorem here.

### From TauCetiRoadmap.ModularSymbolsPadicLFunctions

Consume §§0.6–0.8 and 1.1: the homological/cohomological symbol pairing, Eichler–Shimura comparison, rational Drinfeld–Manin projector and integral period lattices. The rational projector supplies no integral splitting; §6.0d constructs the winding quotient and proves its saturated cotangent comparison.

### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

Consume Layer 2’s Euler-family and reciprocity-compatible derivative interfaces and Layer 4’s conditional descent, especially §§4.3, 4.17(c) and 4.20 for the hypotheses, singular-local comparison and dual Selmer bound. The bottom class is finite at every finite place away from the rational coefficient prime p, with the local condition relaxed at p. Its singular localization lies in H¹(ℚ_p,T)/H¹_f(ℚ_p,T), with the finite condition on the lattice pulled back from its rational representation. Higher conductor classes satisfy the norm, congruence and prescribed conductor-prime local laws of Layer 2. Nonvanishing and the representation hypotheses are additional inputs; finiteness at p would kill the required singular localization. Section 6.0e proves the modular arithmetic application and verifies those hypotheses.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

Consume §H3.6: an imaginary quadratic maximal order has class number one exactly for fundamental discriminants −3,−4,−7,−8,−11,−19,−43,−67,−163; an imaginary quadratic order has proper-invertible Picard number one exactly for discriminants −3,−4,−7,−8,−11,−12,−16,−19,−27,−28,−43,−67,−163. Section 5.0a uses these exhaustion theorems together with the CM interpretation of ComplexMultiplicationAndExplicitReciprocity Layer 3.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights and TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume ArakelovGeometryAndAbelianHeights §§1.1–1.6 for Hermitian degrees and norms, §2.7 for h_st,Del(A)=h_F(A)+(dim A/2)log π, §§3.4–3.5 for stable height, base change and products, §4.4 for |h_F(E)−h_F(E′)|≤½log deg φ along an isogeny φ, and §5.9 for h_F(E)≤h(j(E))/12+3. Here h_F is the stable height in Faltings' normalization. Consume AbelianSchemesAndArithmeticModuli Layers A2, A5 and A6 for polarizations, complex period lattices, their algebraic Hom comparison, degree and Poincaré reducibility. The upper bound on the least isogeny degree is the additional theorem of §6.0f.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights and TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2 for the étale/de Rham coefficient realizations and eigenform projection, and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 for the continuous period-sequence boundaries and their Bloch–Kato exponential comparison. Section 6.0e builds the modular-unit reciprocity comparison, including its differential calculation over completed modular function fields with residue field of finite p-basis; the local-field exponential alone does not give that comparison. AutomorphicGaloisRepresentations §7.5 supplies the non-CM classical large-image theorem used to choose auxiliary coefficient primes, retaining its inner-twist coefficient field.

### From TauCetiRoadmap.SchemeKTheoryOperations, TauCetiRoadmap.K2SymbolsBrauer and TauCetiRoadmap.K2SymbolsBrauerPartII

Consume SchemeKTheoryOperations §§2.2–2.4, 3.6 and 6.1 for pullback, finite locally free transfer, projection formulas, unit classes and products; K2SymbolsBrauer §§6.4, 6.7–6.9 and 8.1–8.3 for ordered unit symbols and their product-normalized classical-to-Quillen comparison. K2SymbolsBrauerPartII §§1.1 and 5.5 identify the ordered Kummer cup and the finite Chern map: on the reduction of an integral product, c₂,₂ is the negative of that cup. Section 6.0e uses the cup-normalized modular regulator and this existing sign comparison, not a second generic Chern theory.

### From TauCetiRoadmap.EisensteinIdealAndRationalTorsion

Consume §§7.8–7.9 and 8.9: the prime-torsion exclusion, the general-level formal immersion into nonzero new optimal quotients away from residue characteristic two, and the distinction between fixed vectors and stable lines. Sections 5.0a–5.0b prove the extra rational-isogeny classification; §6.0f uses the formal-immersion method with its own modular-unit and height arguments.

### Theorem-level inputs and owned arithmetic targets

The contracts below fix the exact inputs and their supply direction. Section locators identify supplying developments. The additional local, isogeny and modular-curve arithmetic is assigned to explicit targets below, with no implicit extension of a supplier’s statements.

From EllipticCurveModularity Layers R29.3–R29.4 and R29.6 (elliptic-modularity): Every elliptic curve E/ℚ is attached to a normalized weight-two trivial-character newform of exact arithmetic conductor, with equal traces at all good primes.

From SerreWeightAndLevelOptimisation Layers 2–4, especially §4.8 (optimized-weight-two-lift): For prime ℓ≥5 and irreducible E[ℓ], with modularity supplied by elliptic-modularity, of Serre weight 2 and prime-to-ℓ Artin conductor N, supply a primitive weight-two trivial-character newform of exact level N and a prime λ above ℓ whose semisimple residual representation is isomorphic to E[ℓ] after the specified residue-field extension.

From SerreWeightAndLevelOptimisation §§6.1–6.3 (deletion-level-lowering): For prime ℓ≥3 and irreducible E[ℓ], with a weight-two modularity witness for E supplied by elliptic-modularity, supply the weight-two trivial-character lift at the deletion level M₀ of Bennett–Siksek §2, equation (3), with good-prime and removed-multiplicative-prime trace congruences of Lemma 2.1.

From ArithmeticGaloisRepresentations Layer 3 and §§6.1–6.3; NeronModelsAndSemistableAbelianVarieties §§5.3a and 5.3h for the elliptic conductors; SerreWeightAndLevelOptimisation Layer 3 for the local weight recipe (elliptic-conductor-and-weight): For E/ℚ and an odd prime ℓ, supply the arithmetic conductor M of E, the prime-to-ℓ Artin conductor N(E[ℓ]) and the Serre weight of E[ℓ].

From NeronModelsAndSemistableAbelianVarieties §5.3h (residual-conductor-away-from-ell): For E/ℚ, a prime ℓ≥5 and a prime q≠ℓ, the exponent of q in N(E[ℓ]) equals v_q(M), except at multiplicative q with ℓ dividing ord_q(Δ), where it is zero.

Target §4.7a (weight-two-reduction-alternative), using the local representations of ArithmeticGaloisRepresentations §§6.1–6.3 and the weight recipe of SerreWeightAndLevelOptimisation Layer 3: For E/ℚ and a prime ℓ≥11 with E[ℓ] irreducible of Serre weight two, E has good reduction at ℓ or multiplicative reduction at ℓ with ℓ dividing ord_ℓ(Δ).

From ArithmeticGaloisRepresentations §§4.1 and 6.2 (complex-conjugation-on-torsion): For E/ℚ and an odd prime ℓ, complex conjugation on E[ℓ] has determinant −1 and eigenvalues 1 and −1.

From ArithmeticGaloisRepresentations §4.1, “Absolute irreducibility from oddness” (odd-irreducible-absolutely-irreducible): For an odd prime ℓ, an irreducible two-dimensional 𝔽_ℓ-representation of the absolute Galois group of ℚ on which complex conjugation has eigenvalues 1 and −1 is absolutely irreducible.

From ArithmeticGaloisRepresentations §§4.4–4.5 (dickson-classification): For an odd prime p and H≤GL₂(𝔽ₚ) not containing SL₂(𝔽ₚ), H lies in a Borel subgroup or a split or nonsplit Cartan normalizer, or its projective image is isomorphic to A₄, S₄ or A₅.

Target §6.0g (serre-inertia-exceptional-bound), using ArithmeticGaloisRepresentations §§2.3 and 4.4–4.5: For E/ℚ and a prime p>17, the projective image on E[p] is not isomorphic to A₄, S₄ or A₅.

From AutomorphicGaloisRepresentations §6.2 (newform-residual-representation): For a primitive weight-two trivial-character newform f of level N and a coefficient-field prime λ above ℓ, supply its two-dimensional semisimple residual representation over κ_λ, obtained by reducing a stable lattice and semisimplifying, with arithmetic-Frobenius polynomial T²−c_q T+q at every prime q∤Nℓ.

From AutomorphicGaloisRepresentations §§6.1 and 6.4, with ModularCurvesPartII §§16.2–16.6 for the actual quotient and its dimension (modular-abelian-conductor): For a primitive weight-two trivial-character newform f of level N with coefficient-field degree d, its associated modular abelian variety A_f has arithmetic conductor Nᵈ, in particular N when d=1.

From WeightsInEtaleCohomology R34.5–R34.6, “Eigenform purity and the Ramanujan bound” (coefficient-bound): For a normalized weight-two newform of level N and prime q∤N, every complex embedding of c_q has absolute value at most 2√q.

From ModularCurvesPartII §§3.8–3.12, 5.2, 5.10–5.11 and 9.6, specialized to the coprime mixed level (mixed-modular-curves): For r>0 and p prime with gcd(r,p)=1, supply the smooth projective normalizations over ℚ of `X₀(r)×_{X(1)}X_H(p)`, for H a Borel, split Cartan normalizer or nonsplit Cartan normalizer, with their j maps, cusps and smooth integral models at primes q∤6rp.

From ModularCurvesPartII §§9.1, 13.1–13.3 and 14.15, specialized to the mixed level (mixed-modular-jacobians): For r>0 and p prime with gcd(r,p)=1, supply the Jacobians over ℚ of the mixed Borel and Cartan-normalizer curves, with pull-push Hecke correspondences T_n for n prime to p.

From ModularCurvesPartII §§16.2–16.6 and AutomorphicGaloisRepresentations §6.2 (newform-quotient): For a primitive rational weight-two trivial-character newform f of level N, supply the elliptic quotient C of J₀(N) attached to f and the comparison C[ℓ]^ss≅ρ̄_f,ℓ for every prime ℓ. No prime-to-ℓ hypothesis on the isogeny between quotient models is needed for this semisimplified comparison.

Target §6.0a (five-level-j-coordinates), on the curves of ModularCurvesPartII §§8.2 and 9.6: For r∈{2,3,5,7,13}, supply a ℚ-isomorphism X₀(r)≃ℙ¹ with cusps t=0,∞ and j=f_r(t)/t, where f₂=(t+16)³, f₃=(t+27)(t+3)³, f₅=(t²+10t+5)³, f₇=(t²+5t+1)³(t²+13t+49), and f₁₃=(t⁴+7t³+20t²+19t+1)³(t²+5t+13).

Target §6.0b (rational-isogeny-j-tables), on the curves of ModularCurvesPartII §5.2: The j-images of Y₀(11)(ℚ), Y₀(17)(ℚ) and Y₀(37)(ℚ) are respectively {−11·131³,−2¹⁵,−11²}, {−17²·101³/2,−17·373³/2¹⁷}, and {−7·137³·2083³,−7·11³}.

Target §6.0f (split-cartan-rational-points), using the split-normalizer identification of ModularCurvesPartII §9.5: For every prime p≥11 with p≠13 and integer m>1, every rational point of X₀⁺(pᵐ) is cuspidal or CM.

Target §6.0f (quantitative-elliptic-isogeny): For every number field K of degree d≥1 and every pair of geometrically isogenous elliptic curves E,E′ over K, there is a geometric isogeny E→E′ of degree at most 10⁷d²(max{h_F(E),985}+4log d)², with h_F the stable Faltings-normalized height. For E non-CM the same bound holds for the degree of every cyclic isogeny from E over K.

Target §6.4 (chen-isogeny), using ModularCurvesPartII §§9.4–9.6 and 13.1–13.3 and the jointly placed normalizers of Conventions: For r>0, p prime and gcd(r,p)=1, construct the prime-to-p Hecke-equivariant correspondence between the split and nonsplit mixed Jacobians, its induced isogeny between p-new quotients, and the identification of the split curve with X₀(rp²)/w at the exact divisor p².

Target §6.0d (integral-winding-comparison), using ModularSymbolsPadicLFunctions §§0.6–0.8 and 1.1, ModularCurvesPartII §§7.2 and 16.2 and optimal-quotient-cotangents: For a congruence modular Jacobian J, its full-new quotient J_new and oriented winding class e in its rational homology, form the integral Hecke annihilator I_e and optimal quotient π:J_new→A_e, and compose with J→J_new. At a mixed-characteristic place with e_K<q−1 where J is semistable, identify the pulled-back quotient cotangent lattice with the intersection of Cot₀(J) and the rational winding-annihilator subspace pulled back from J_new. The Picard/dualizing comparison identifies this as a saturated weight-two differential lattice; the period pairing integrates ω_f=2πi f(z)dz from 0 to i∞.

Target §6.0c (cuspidal-divisor-torsion), using the rational splitting of ModularSymbolsPadicLFunctions §0.8: On a smooth projective congruence modular curve over a number field, every degree-zero divisor supported on geometric cusps has torsion class in its geometric Jacobian.

Target §6.0e (modular-rank-zero), using its weight-two modular classes and reciprocity and EulerSystemsAndKolyvaginSystems Layer 4: For a primitive weight-two trivial-character newform f with L(f,1)≠0, the associated modular abelian variety A_f over ℚ has A_f(ℚ) finite, in every coefficient-field degree.

Target §5.0b (cyclic-isogeny-degrees), extending the fixed-vector exclusion of EisensteinIdealAndRationalTorsion §§7.8 and 8.9: A rational cyclic isogeny on E/ℚ has degree in {1,…,19,21,25,27,37,43,67,163}.

Target §5.0a (noncm-prime-isogeny-degrees): For a non-CM elliptic curve over ℚ, the prime degrees of rational cyclic isogenies belong to {2,3,5,7,11,13,17,37}.

Target §6.0h (neron-torsion-specialization), using NeronModelsAndSemistableAbelianVarieties §§1.5 and 3.5: For the Néron model of an abelian variety over a complete mixed-characteristic DVR of residue characteristic q and absolute ramification index e<q−1, reduction is injective on the full torsion subgroup of rational points. HeightsRationalPointsAndObstructions §1.18 supplies the good-reduction specialization consumed in Layer 6, where q∤rp and e=1.

From NeronModelsAndSemistableAbelianVarieties §6.4d (optimal-quotient-cotangents): For a finite extension K/ℚ_q with absolute ramification index e<q−1 and an exact sequence 0→B→J→A→0 of abelian varieties over K with J semistable, the identity components of their Néron models give an exact sequence of free O_K-modules 0→Cot₀(A)→Cot₀(J)→Cot₀(B)→0.

The conductor and optimized-lift contracts use Kraus §3.1, Theorems 3–4, pp. 1144–1146 and BS §2, Theorem 3 and Lemma 2.1, p. 359. The modular-Jacobian and Chen contracts use Lemos §3, Lemma 3.2 and Theorem 3.3, p. 9. The integral winding and arbitrary-dimensional rank-zero contracts use DarmonMerel Propositions 7.1–7.2, pp. 18–21, including the normalized differential on p. 19. The cuspidal-divisor contract is the Manin–Drinfeld input in Lemma 8.3, p. 23. The cotangent contract is Mazur Corollary 1.1, p. 137; its restriction e<q−1 is essential, as the characteristic-two example on p. 138 shows. The explicit coordinate and rational-j contracts use Lemos §2, pp. 5–7. The split-Cartan rational-point contract is BPR Theorem 1.1, p. 2, with the split-normalizer identification at p² supplied by ModularCurvesPartII §9.5. The exceptional projective-image exclusion holds already for p>17 (Mazur, proof of Theorem 3, p. 130). The cyclic-degree contract uses Mazur Theorem 1, pp. 129–130 for prime degrees and Kenku pp. 199–201 for composite degrees. The Néron specialization contract is the torsion-injection input of [DarmonMerel](#references), §8, pp. 22–23. The local reduction, cyclic-degree, winding, rank-zero, rational-point and specialization assertions in this list are targets of the indicated layers.

## How to read the build

Layer 1 fixes dimensions and thresholds. Layer 2 bounds a residual characteristic at a deleted prime. Layer 3 forces rational coefficients and realizes them at the exact conductor. Layer 4 adds full rational two-torsion, with separate local level/weight comparisons. Layer 5 develops the rational cyclic-degree classification and derives uniform irreducibility. Layer 6 first builds the modular-curve arithmetic, winding and rank-zero comparisons, then proves rational-isogeny surjectivity using Cartan geometry and finite j-value image bounds. All target dependencies are stated within these layers or in the exact supplier contracts.

## Layer 1: Thresholds and sharp newspace dimensions

Kraus's comparison theorems are effective because their thresholds are explicit functions of a level. Two numbers attached to a positive integer N enter: the index μ(N) of Γ₀(N) in SL₂(ℤ), which is N times the product of 1 + 1/q over the primes q dividing N, and the dimension g⁺(N) of the space of weight-two newforms on Γ₀(N) with trivial character. The threshold F controls rationality of a newform, G controls a congruence modulo 4, and H is their maximum. All three are real numbers and are used in strict inequalities ℓ > F♯(N), ℓ > G♯(N), ℓ > H♯(N). The division by 6 is a real division and the square root is taken before the power; the level in G is lcm(N, 4).

Martin's theorem bounds g⁺(N) by (N + 1)/12 and says exactly when equality holds. It is what turns a bound in terms of the degree of a coefficient field into a bound in terms of the level alone.


### 1.1 Martin’s prime-power correction table

Define localTerms(p,e) in ℚ⁵, ordered (s,v∞,v2,v3,m), with e=0 giving (1,1,1,1,1). For a prime p and e≥1: s is 1−1/p for e=1, 1−1/p−1/p² for e=2, and (1−1/p)(1−1/p²) for e≥3. v∞ is 0 for odd e, p−2 for e=2, and p^(e/2−2)(p−1)² for even e≥4. For v2, at p=2 the values for e=1,2,3 are −1,−1,1 and thereafter 0; at odd p≡1 mod4 they are 0,−1 and thereafter 0; at odd p≡3 mod4 they are −2,1 and thereafter 0. For v3, at p=3 the values for e=1,2,3 are −1,−1,1 and thereafter 0; at p≡1 mod3 they are 0,−1 and thereafter 0; at p≡2 mod3 they are −2,1 and thereafter 0. m=−1 for e=1 and 0 for e≥2. For nonprime p and e>0 set the whole vector to zero. These are one finite table, not new factorization or modular-form carriers. ([Martin](#references), Definitions 1A–1D and the Möbius term of Theorem 1, p.2).

The API supplies the following facts.

- For every p, localTerms(p,0)=(1,1,1,1,1).
- For p not prime and e>0, localTerms(p,e) is the zero vector.
- For p prime and e>0 every coordinate is the corresponding entry of the displayed prime-power table.

**Checks.**

- localTerms(0,0)=(1,1,1,1,1); exponent zero takes priority over the nonprime-base convention.
- localTerms(2,2)=(1/4,0,−1,1,0); treating 2 as an ordinary odd prime changes the elliptic correction.
- localTerms(3,2)=(5/9,1,1,−1,0); the exceptional correction at 3 is distinct from that at 2.
- localTerms(2,3)=(3/8,0,1,0,0); the odd-exponent cusp term vanishes while the order-two correction is positive.

### 1.2 The weight-two arithmetic dimension expression

For N>0 let (S,I,A,B,M) be the coordinatewise product of localTerms(p,N.factorization(p)) over p in N.primeFactors. Define martinValue(N)=N S/12−I/2−A/4−B/3+M in ℚ. Set martinValue(0)=0 only as a total-function convention. The equality with an actual modular-form dimension is a separate comparison theorem. In particular this definition does not use a freely supplied dimension or an assumed newspace. ([Martin](#references), Theorem 1 at k=2 and Definitions 1A–1F, p.2).

The API supplies the following facts.

- martinValue(0)=0, a junk-level convention only.
- martinValue(1)=0; all five products are empty products equal to one, giving 1/12−1/2−1/4−1/3+1=0.
- For N>0, martinValue is the displayed five-product expression with the native factorization of N.

**Checks.**

- martinValue(1)=0; all five products are empty products equal to one, giving 1/12−1/2−1/4−1/3+1=0.
- martinValue(11)=1; reversing either elliptic correction sign changes this value.
- martinValue(35)=3; multiplying local dimensions instead of the five local factors gives a different value.
- martinValue(30)=1; the three distinct prime factors test the product and Möbius signs together.

### 1.3 Native dimension comparison

The definitions `localTerms`, `martinValue` and `newDimension` give the arithmetic table, its five-product expression and the actual trivial-character newspace. Prove `dimension_comparison` identifying the latter two (Martin, Theorem 1, p. 2). The API supplies the following facts.

- The underlying space is the intersection of the native Γ₁(N) newspace and the trivial-character eigenspace.
- Its value is the basis-independent complex finrank of that intersection, rather than the full Γ₁(N) dimension.
- For N>0, `dimension_comparison` identifies this dimension with martinValue(N).

The prime factors in martinValue are actual primes; at N=1 all products are empty products equal to one, so the value is 0.

**Checks.**

- newDimension(1)=0 and newDimension(11)=1; the level-one space is zero and the level-11 space is spanned by its rational newform.
- newDimension(13)=0, whereas the full weight-two Γ₁(13) newspace has dimension 2; taking the trivial-character intersection is essential.
- newDimension(35)=3 and newDimension(30)=1; the corresponding values of 12g⁺ are 36 and 12.

### 1.4 Martin's sharp weight-two newspace bound

State `martin_bound`: for every N ≥ 1, 12·g⁺(N) ≤ N + 1, with equality exactly when N = 35 or N is a prime congruent to 11 modulo 12. ([Martin](#references), Theorem 2, p. 3; §4, Lemmas 16–22 and its proof, pp. 14–16 (v1)).

*Needs:* the preceding arithmetic expression and native dimension comparison; ModularForms Layers 3 and 10.

Identify the arithmetic dimension expression with the native trivial-character newspace before applying its bound. The proof uses the prime-power local factors, the old/new decomposition and convolution inversion, then Martin’s separate estimates and finite exceptional checks. Numerical verification of the formula alone does not identify the modular space.

### 1.5 Kraus’s coefficient-rationality threshold F♯

For N>0 put I(N)=[SL₂(ℤ):Γ₀(N)] using the native subgroup index, and g(N)=finrank over ℂ of (cuspFormsNew(N,2)∩cuspFormCharSpace(2,1)). Define sharpF(N)=(√(I(N)/6)+1)^(2g(N)). ([Kraus](#references), §3.1, equation (7), p.1143).

*Needs:* the native Γ₀ index and trivial-character newspace; §1.3. Evaluate the square root in ℝ before the power; the exponent is twice the actual dimension, including dimension zero.

The API supplies the following facts.

- sharpF is the displayed expression in the native index and newspace dimension.
- For positive N, 1≤sharpF(N).
- If the actual g(N)=0 then sharpF(N)=1.

**Checks.**

- sharpF(1)=1; exponent zero is retained even though μ(1)/6<1.
- sharpF(11)=3+2√2; taking the square root after the power would not give this value.
- sharpF(35)=(1+√8)^6; the exponent is six, not the dimension three.

### 1.6 Kraus’s two-torsion threshold G♯

For N>0 define sharpG(N)=(√(I(lcm(N,4))/6)+1)^2, where I is the native Γ₀ index. The lcm is essential and is not replaced by 4N. ([Kraus](#references), §3.1, equation (8), p.1144).

*Needs:* the native Γ₀ index and least common multiples. Form L=lcm(N,4) first; levels 1, 2 and 4 all give L=4.

The API supplies the following facts.

- sharpG is the displayed least-common-multiple expression.
- For positive N, 1≤sharpG(N).
- If 4 divides N, sharpG(N)=(√(I(N)/6)+1)^2.

**Checks.**

- sharpG(1)=4; using level 1 itself instead of lcm(1,4) would change the answer.
- sharpG(4)=4, whereas replacing lcm(4,4) by 16 would give 9.
- sharpG(11)=13+4√3; the congruence index is μ(44)=72.

### 1.7 Kraus’s full-two-torsion comparison threshold H♯

For N>0 define sharpH(N)=max(sharpF(N),sharpG(N)). ([Kraus](#references), §3.1, equation (9), p.1144).

*Needs:* §§1.5–1.6. The maximum combines the independent rationality and two-torsion requirements; at N=11 its second argument is larger.

The API supplies the following facts.

- For N>0, sharpH(N)=max(sharpF(N),sharpG(N)).
- sharpF(N)≤sharpH(N).
- sharpG(N)≤sharpH(N).
- For real ell, sharpH(N)<ell iff sharpF(N)<ell and sharpG(N)<ell.

**Checks.**

- sharpH(1)=4=max(1,4); the maximum cannot be replaced by the minimum.
- sharpH(4)=4=max(1,4); the dimension-zero rationality threshold does not remove the second requirement.
- sharpH(11)=13+4√3>3+2√2; retaining F♯ alone loses the larger requirement.

### 1.8 Sharp thresholds and numerical majorants

Prove F♯(N)≤F_K(N), G♯(N)≤G_K(N), hence H♯(N)≤H_K(N), for N>0, where F_K=(μ(N)/6+1)^(2g⁺(N)), G_K=(μ(lcm(N,4))/6+1)² and H_K=max(F_K,G_K). For μ(N)≥6 this follows from √x≤x at x≥1. The remaining levels N=1,2,3 have g⁺=0; also μ(lcm(N,4))≥6 for every positive N. The sharp realization targets remain stronger than realization under the majorants (Kraus, equations (7)–(9), pp. 1143–1144).

**Checks.**

- At N=11, μ=12, g⁺=1, F♯=3+2√2, G♯=H♯=13+4√3, whereas F_K=9 and G_K=H_K=169; thus H♯<169.
- At N=1, μ/6=1/6<1 but g⁺=0, so both F values are 1; blindly applying √x≤x would reverse the comparison.
- At N=4, μ(lcm(4,4))=6 and G♯=4; replacing the lcm by 4N gives μ(16)=24 and the wrong value 9.

### Examples

At N=11 and 35, 12g⁺ is respectively 12 and 36, equal to N+1. At N=30, 12g⁺=12<31. At N=1 the dimension is zero and equality fails. These distinguish the sharp equality criterion from the upper bound alone.

### Dependencies

Mathlib congruence index; Tau Ceti newspaces and trivial character; ModularForms Layers 3, 8 and 10. No realized elliptic comparison is used to define a threshold.

## Layer 2: Removed-prime exponent bounds

Let E[ℓ] be irreducible. When ℓ divides the exponent of a prime p ∥ M, p ≠ ℓ, in the minimal discriminant, p leaves the level: the residual representation E[ℓ] comes from a newform f of level M₀ prime to p, and the Frobenius comparison at p reads p + 1 ≡ ±c_p modulo a prime λ above ℓ. The algebraic integer p + 1 ∓ c_p is nonzero, because every conjugate of c_p has absolute value at most 2√p < p + 1, and it lies in λ, so ℓ divides its norm. The norm is at most (√p + 1)^(2d) with d the degree of the coefficient field of f, and d ≤ g⁺(M₀) ≤ (M₀ + 1)/12. This gives the bound of the layer. The level M₀ is the deletion level: M divided by the primes q ∥ M with ℓ | ord_q(Δ), where ord_q is the exponent of q. A factor ℓ can remain in M₀: it does when E has additive reduction at ℓ, and when ℓ ∥ M with ℓ ∤ ord_ℓ(Δ). So M₀ is in general not the prime-to-ℓ conductor of E[ℓ].


### 2.1 The norm bound behind a congruence

Let K be a number field of degree d, λ a prime of its ring of integers above the rational prime ℓ, and x a nonzero element of λ whose image under every embedding K → ℂ has absolute value at most B. Then ℓ ≤ |Norm(K/ℚ)(x)| ≤ B^d. ([BS](#references), §2, proof of Lemma 2.2, p. 359; general consequence of the cited Mathlib product formula).

*Needs:* Mathlib norm product and embedding count; ring-of-integers ideal norm divisibility.

Read x as an algebraic integer in the prime λ of O_K. Divisibility of its nonzero integral norm gives the lower bound. For the upper bound, multiply the absolute-value estimates over all d embeddings into ℂ. `Algebra.norm_eq_prod_embeddings` provides the product, and `AlgHom.card` provides exactly d factors for a finite separable extension. Since x≠0, its image under every embedding is nonzero; thus B>0 suffices, with no B≥1 assumption.

### 2.2 The removed-prime exponent bound

Let E/ℚ have conductor M and minimal discriminant Δ, let ℓ ≥ 3 be a prime with E[ℓ] irreducible, and let M₀ be M divided by the primes q with q ∥ M and ℓ | ord_q(Δ). If p ≠ ℓ is a prime with p ∥ M and ℓ | ord_p(Δ), then ℓ ≤ (√p + 1)^((M₀+1)/6). ([BS](#references), §2, Lemmas 2.1–2.2 and proof, p. 359).

*Needs:* Layer 1; the norm target; deletion-level-lowering, elliptic-modularity and coefficient-bound contracts; ModularForms Layer 8G for the coefficient-field orbit bound.

Level lowering at p yields p+1≡±c_p modulo λ. All conjugates satisfy |c_p|≤2√p, so p+1∓c_p is nonzero and its norm has absolute value at most (√p+1)^(2d). Bound d by g⁺(M₀), apply Layer 1, and compare positive real powers. The deleted-prime condition and p≠ℓ are needed before the unramified Frobenius comparison.


The native headline is `norm_bound`. Its prime ideal I is nonzero and prime, contracts to (ℓ) in ℤ, and contains a nonzero algebraic integer x. The bound quantifies over every complex embedding of its number field, with no B≥1 requirement beyond what these hypotheses force.

**Checks.**

- For K=ℚ, ℓ=5, I=(5), x=5 and B=5, both inequalities read 5≤5≤5.
- At a removed prime p=2, the positive gap is 3−2√2; it is about 0.1716, so the norm element cannot vanish even at the smallest prime.
- For x=0 the lower bound would say ℓ≤0; for the unit ideal the prime-above-ℓ condition fails. Both exclusions matter.

### Examples

At deletion level 11, the exponent is (11+1)/6=2. For p=2 the bound is ℓ≤3+2√2≈5.828, excluding primes ℓ≥7 under its hypotheses. A coefficient-prime factor can remain in M₀ at additive reduction, whereas N(E[ℓ]) is always prime to ℓ.

### Dependencies

Layer 1; norm divisibility and the all-embedding eigenvalue bound; the deletion-level-lowering contract; ModularForms Layer 8G orbit size. The removed-prime Frobenius comparison always assumes p≠ℓ.

## Layer 3: Rationality and exact-conductor realization

Kraus's first theorem starts from E[ℓ], irreducible, of Serre weight 2 and of prime-to-ℓ Artin conductor N, with ℓ ≥ 5. Modularity, with the optimisation of level and weight, gives a newform f of weight two and level exactly N with trivial character whose residual representation at a prime λ above ℓ is E[ℓ]. If some coefficient c_q with q ≤ μ(N)/6 and q ∤ N were not an integer, then c_q minus the integer it is congruent to modulo λ (the trace of Frobenius of E at q, or ±(q + 1) if E has multiplicative reduction at q) would be a nonzero element of λ of norm at most (√q + 1)^(2d) ≤ F♯(N), against ℓ > F♯(N). So the coefficients at the primes up to μ(N)/6 are integers; the recurrences for the coefficients and the Sturm bound in characteristic zero then make f equal to all its conjugates, and f is rational. A rational newform of level N gives an elliptic curve C of conductor exactly N with C[ℓ]^ss≅ρ̄_f,ℓ. Irreducibility of E[ℓ] upgrades the comparison to actual torsion.


### 3.1 Rationality from finitely many prime coefficients

State `rationality_of_small_prime_coefficients`: for N>0, if a normalized newform f of weight two, level N and trivial character has c_q ∈ ℤ for every prime q ≤ μ(N)/6, then every Fourier coefficient of f is in ℤ. ([Kraus](#references), §3.2, Lemma 1 and proof, pp. 1144–1145).

*Needs:* ModularForms Layers 3, 4, 8, 8G and 10.

Here c_n is exactly the n-th coefficient of UpperHalfPlane.qExpansion 1 f.toCuspForm. A proof route applies ModularForms Layer 8G's Galois conjugation at the same primitive level and trivial character. The Hecke recurrences extend equality at the tested primes to equality of the coefficients through the Sturm bound. The characteristic-zero Sturm theorem then identifies f with every conjugate. All coefficients are algebraic integers, so rationality makes them integers.

### 3.2 Integrality of the small prime coefficients above F♯(N)

Let ℓ ≥ 5 be prime, E/ℚ with E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, and f a normalized newform of weight two, level N and trivial character whose residual representation at a prime above ℓ is E[ℓ]. If ℓ > F♯(N), then c_q ∈ ℤ for every prime q ≤ μ(N)/6. ([Kraus](#references), §3.2, proof of Theorem 3, p. 1145).

*Needs:* Layer 1; Layer 2 norm target; optimized-weight-two-lift, residual-conductor-away-from-ell and coefficient-bound contracts; ModularForms Layers 4 and 8G for bad-prime coefficients, conjugates and orbit size.

At a prime q dividing N, primitive weight-two trivial-character coefficients are 0 or ±1 by ModularForms Layer 4, hence integral. Choose a nonintegral prime coefficient below the bound if f is not rational; it therefore has q∤N. The nonzero form forces g⁺(N)≥1, so F♯(N)>μ(N)/6 and q≤μ(N)/6<ℓ; thus q≠ℓ before any Frobenius comparison. At a good prime its congruent integer is the trace of E; at a removed multiplicative prime it is ±(q+1). The coefficient difference is a nonzero element of λ. Its conjugate norm is bounded by F♯(N), contradicting ℓ>F♯(N). Keep the coefficient prime, exact primitive level and weight-two lift in this argument; abstract residual modularity does not specify them.

### 3.3 Kraus's rational comparison theorem

For E/ℚ and a prime ℓ ≥ 5 with E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, if ℓ > F♯(N) there is an elliptic curve F/ℚ of conductor exactly N with F[ℓ] ≅ E[ℓ]. ([Kraus](#references), §3.1, Theorem 3, p. 1144).

*Needs:* the preceding rationality targets; newform-quotient, newform-residual-representation and modular-abelian-conductor contracts; elliptic-modularity contract.

Combine the optimized weight-two lift, the preceding rationality argument and the elliptic realization of a rational newform. The quotient comparison gives C[ℓ]^ss≅ρ̄_f,ℓ≅E[ℓ]. Since E[ℓ] is irreducible, C[ℓ] has a single simple composition factor and is itself irreducible, so C[ℓ]≅E[ℓ]. Modularity of E is the parent input. The conclusion is an isomorphism of residual representations, rather than just a congruence at a chosen finite list of primes.


**Checks.**

- On C:y²+xy+y=x³+4x−6, the two-division polynomial is (x−1)(4x²+5x+23), with quadratic discriminant −343. Exactly two geometric two-points are rational, so dim C[2]^G=1; its semisimplification is trivial of dimension 2, with fixed-space dimension 2. Actual torsion cannot replace semisimplification without the irreducibility hypothesis.
- At N=1 there are no weight-two cusp forms; the lift hypotheses are inconsistent, so realization makes no assertion about a nonexistent form.
- For level 11 the rational normalized newform has first coefficients 1,−2,−1,2; integral prime coefficients and the recurrences agree, whereas rationality alone without algebraic integrality would not imply integrality.
- At a good prime q, use the integer a_q(E); at a removed multiplicative prime use ±(q+1). The latter need not lie in the Hasse interval for a good-reduction trace.

### Examples

For level 11 the rationality threshold is 3+2√2≈5.828. The conclusion applies at a prime ℓ≥7 satisfying irreducibility, weight two and exact residual conductor 11; it does not require ℓ to exceed the larger majorant 9.

### Dependencies

Layers 1–2; modularity and optimized weight-two lifts; ModularForms Layers 8 and 8G for integrality, conjugation and orbit size, and Layer 10 for Sturm comparison; newform-quotient, newform-residual-representation and modular-abelian-conductor contracts for realization and exact conductor. None of these inputs is inferred from the realization conclusion.

## Layer 4: Full rational two-torsion realization

If E has full rational two-torsion, the comparison curve C of the preceding layer need not have it, but its point counts show a trace of it. For ℓ > G♯(N) and a prime q ∤ 2N with q ≤ μ(lcm(N, 4))/6, the traces of E and of C at q are congruent modulo ℓ and differ by less than ℓ, so they are equal, and #C(𝔽_q) = #E(𝔽_q) is divisible by 4 (bad reduction of E at such a prime is excluded by the same inequality). A congruence criterion of Sturm type modulo 4, at level lcm(N, 4), extends the divisibility from these finitely many primes to every prime q ∤ 2N. By Chebotarev's theorem the condition constrains the action of Galois on C[4], and it follows that C, or the quotient of C by its rational point of order two, has full rational two-torsion. The isogeny has degree 1 or 2, so it changes neither the conductor nor the representation on ℓ-torsion.

The theorems of this layer and the preceding one are stated at the residual conductor N(E[ℓ]). The removed-prime bound is stated at the deletion level M₀. The two levels agree under a condition on the reduction of E at ℓ, and an application that uses both must check it.


### 4.1 Kraus’s local coefficient filters

For a commutative ring R, p,e∈ℕ and a∈R, define the pair krausLocalFilters(p,e,a)=(V,V′) in R[X]². For p=2,e=0 use (1−aX+2X²,1); for p=2,e=1 use (1−aX,1); for p=2,e≥2 use (1,1). For p≠2,e=0 use (1,1); for p≠2,e=1 use (1,1−(p+1−a)X); for p≠2,e≥2 use (1,1−(p+1)X+pX²). At prime p with e=v_p(N), X acts as R_p:h(z)↦h(pz), so X² acts as R_(p²). ([Kraus](#references), Appendix II, §8.1, p.1160).

The API supplies the following facts.

- The three p=2 rows are the displayed e=0, e=1 and e≥2 pairs.
- For p≠2 the e=0, e=1 and e≥2 rows are the displayed pairs.
- Both filters have constant coefficient one.
- Mapping coefficients along a commutative-ring homomorphism sends the filters of a to the filters of its image.

**Checks.**

- Over ℤ, krausLocalFilters(2,0,3)=(1−3X+2X²,1); the quadratic term acts through R₄, rather than a second copy of R₂.
- Over ℤ, krausLocalFilters(2,2,0)=(1,1); using the good-prime branch at this bad exponent would add an incorrect 2X² term.
- Over ℤ, krausLocalFilters(3,1,−1)=(1,1−5X); changing p+1−a to p+1+a would give coefficient −3.
- Over ℤ, krausLocalFilters(3,2,0)=(1,1−4X+3X²); exponent two uses the quadratic filter independently of a.

### 4.2 Integral congruences at arbitrary weight and ideal

State `integral_sturm_congruence`: for N>0, k≥0, a number field K with fixed complex embedding σ, a character χ modulo N and an arbitrary ideal J of O_K, a weight-k form f of character χ whose full q-expansion is σ(a_n), a_n∈O_K, has a_n∈J for every n whenever this holds for every 0≤n≤kμ(N)/12. Equivalently, two forms with the same weight, level and character and integral coefficients are congruent modulo J at every coefficient if they agree through that bound; apply the one-form statement to their difference. Coefficient zero is included (Kraus, Appendix II, Proposition 1, p. 1158).

*Needs:* the native modFormCharSpace, number fields, integer rings, ideals and q-expansion; ModularForms Layer 10's Sturm infrastructure. The level-one rational-coefficient prime-modulus specialization is supplied by ComputationalNumberTheory §3.4.

Apply the general theorem with k=2 and J=Pᵐ to the local-filter images, after identifying their common level, character and integral coefficient lattice. In particular J=(2)² gives the modulus four needed for point counts.

**Checks.**

- At k=0,N=1 the bound is zero: the constant forms 1 and 0 differ modulo (2) at coefficient zero, so omitting that coefficient would give a false congruence.
- At k=12,N=1, Δ and 0 agree at coefficient zero but differ at coefficient one, where a₁(Δ)=1 and 12·1≤12.
- J=(6) is allowed although it is not a prime-power ideal; J=(1) makes every congruence true, while J=(0) gives equality. At weight two, J=(2)² tests divisibility by 4 rather than by 2.

### 4.3 Finite recognition of point counts modulo four

For a (modular) elliptic curve C/ℚ of conductor N, 4 divides #C(𝔽_q) for every prime q ∤ 2N as soon as it does so for every such prime q ≤ μ(lcm(N, 4))/6. ([Kraus](#references), Appendix II (§8), Proposition 2 and Corollary, pp. 1158–1159).

*Needs:* the integral ideal-congruence Sturm target and local filters; ModularForms Layer 8.

The equivalent contrapositive gives a witness below μ(lcm(N,4))/6 whenever divisibility fails. Apply the integral ideal-congruence Sturm theorem at weight two modulo (2)² to filtered coefficients of the newform and the odd Eisenstein series. A Sturm equality theorem over ℂ is insufficient for this congruence modulo four.

For the filtered-form version, let f be a normalized weight-two trivial-character newform of level N with O_K coefficients, P a nonzero prime ideal and m≥1, and L=lcm(N,4). Assume a_q≡q+1 mod Pᵐ at all primes q∤2N through μ(L)/6, and (q+1)(a_q−1)∈Pᵐ at every prime q≤μ(L)/6 dividing 2N with q²∤4N. Then the first congruence holds at every prime q∤2N (Kraus, Appendix II, Proposition 2, pp. 1158–1159). For the elliptic modulus-four corollary, the bad-prime condition is automatic: such q are odd and a_q=±1, so (q+1)(a_q−1) is divisible by 4.


### 4.4 Transfer of the point counts to the comparison curve

Let ℓ ≥ 5 be prime, E/ℚ with full rational 2-torsion and E[ℓ] irreducible of Serre weight 2 and prime-to-ℓ conductor N, and C/ℚ of conductor exactly N with C[ℓ] ≅ E[ℓ]. If ℓ > G♯(N), then 4 divides #C(𝔽_q) for the primes q ∤ 2N. ([Kraus](#references), §3.3, equations (10)–(11) and trace comparison, p. 1146).

*Needs:* Layer 3 rational comparison; the preceding finite-recognition target; Layer 1 G♯.

Argue from a small witness supplied by the preceding criterion. If E has bad reduction there, the removed-prime congruence and the Hasse estimate contradict ℓ>G♯(N). Otherwise both curves have good reduction: their congruent integer traces differ by less than ℓ and hence are equal. Full two-torsion then forces the point count to be divisible by four. This argument proves the all-primes divisibility conclusion; good reduction and trace equality are intermediate facts at the tested primes.

**Checks.**

- At N=11, G♯=13+4√3≈19.928 and μ(44)/6=12. The largest eligible prime is 7, so the good-trace gap is at most 4√7≈10.583<G♯.


### 4.5 Matrix selection for the two-isogeny repair

Prove the finite matrix selection used in the two-isogeny repair: for a subgroup of GL₂(ℤ/4), if every element has det(1−g)=0, fixes 2e₁, and some element has odd upper-right entry, all lower-left entries vanish. Chebotarev on C[4] first gives a rational point of order two; the matrix conclusion identifies the two-torsion of its quotient. The repair uses this selection, prime-to-degree torsion equivalence and conductor invariance. Its inputs do not include the full-two realization that it is used to prove (Kraus §3.3, p. 1146).

*Needs:* Chebotarev Layer 10 applied to the C[4] extension; EllipticCurves Layers 1–2.

**Checks.**

- The identity matrix modulo 4 has det(1−g)=0 and zero off-diagonal entries. The subgroup generated by [[1,1],[0,1]] also satisfies the determinant condition and fixes 2e₁; every lower-left entry is zero, although an upper-right entry is odd.
- The individual matrices [[1,1],[0,1]] and [[1,0],[2,1]] each satisfy det(1−g)=0 and fix 2e₁, but their product has det(1−g)=2 modulo 4; closure of the subgroup is essential.
- In an S₃ torsion extension the transposition and 3-cycle classes have densities 3/6 and 2/6, both positive; Chebotarev tests each conjugacy class.

### 4.6 Repair of rational two-torsion by a two-isogeny

If C/ℚ has 4 | #C(𝔽_q) at every odd prime of good reduction, there is an isogeny C → F over ℚ of degree 1 or 2 onto a curve with full rational 2-torsion; it preserves the conductor and, for odd ℓ, the representation on ℓ-torsion. ([Kraus](#references), §3.3, final two-isogeny paragraph, p. 1146).

*Needs:* Chebotarev Layer 10 on C[4]; the rational-two-point and matrix/quotient selection; EllipticCurves Layers 1–2; elliptic-conductor-and-weight contract.

A proof route uses Chebotarev on C[4]. It first supplies a rational point P of order two. If C already has full two-torsion, use the identity. Otherwise the quotient C/⟨P⟩ has full rational two-torsion. The degree is two, so prime-to-degree torsion equivalence transports every odd-ℓ representation; rational isogenies preserve the conductor.

**Checks.**

- The identity isogeny has degree 1 and preserves all torsion. A degree-2 isogeny preserves ℓ-torsion for odd ℓ, with no claim of invariance at ℓ=2.


### 4.7 Kraus's full two-torsion realization

If E/ℚ has full rational 2-torsion, ℓ ≥ 5 is prime, E[ℓ] is irreducible of Serre weight 2 and prime-to-ℓ conductor N, and ℓ > H♯(N), then there is an elliptic curve F/ℚ of conductor exactly N with full rational 2-torsion and F[ℓ] ≅ E[ℓ]. ([Kraus](#references), §3.1, Theorem 4, p. 1144; §3.3, pp. 1145–1146).

*Needs:* Layer 3; trace transfer and two-isogeny repair; Layer 1 H♯.

First use ℓ>F♯(N) to obtain C of conductor N. Then use ℓ>G♯(N) to transfer the mod-four point-count condition and apply the isogeny repair. The maximum H supplies both strict inequalities. Full two-torsion is a condition on E as well as on the chosen F.

### 4.7a Weight two and reduction at the coefficient prime

Prove weight-two-reduction-alternative: for E/ℚ, prime ℓ≥11 and irreducible E[ℓ] of Serre weight two, E has good reduction at ℓ or multiplicative reduction with ℓ dividing ord_ℓ(Δ). Use the local elliptic representation and the finite-flat weight recipe to exclude additive types and the multiplicative nondivisible exponent (Kraus, §3.1, p. 1143, interpretation of condition (c)). This local theorem is proved before the adapter of §4.8; it uses no realization theorem.

*Needs:* EllipticCurves Layer 4; ArithmeticGaloisRepresentations §§6.1–6.3; SerreWeightAndLevelOptimisation Layer 3.

**Checks.**

- At good reduction the exponent is 0, divisible by every ℓ; at multiplicative exponent ℓ it is also 0 modulo ℓ.
- At multiplicative exponent 1, the residue is 1 modulo ℓ, so this branch fails.
- Additive reduction at ℓ contributes a positive ℓ-exponent to M₀, whereas N(E[ℓ]) has exponent 0; the adapter cannot silently identify them.

### 4.8 From the deletion level to the residual conductor

Kraus's theorems are stated at the prime-to-ℓ conductor N(E[ℓ]) and Serre weight 2; an application at the deletion level M₀ needs N(E[ℓ]) = M₀ and weight 2 as separate facts. ([BS](#references), §2, Theorems 3–4, pp. 359–360; application adapter with separate local-conductor and weight hypotheses).

*Needs:* elliptic-conductor-and-weight, residual-conductor-away-from-ell, weight-two-reduction-alternative and optimized-weight-two-lift contracts; EllipticCurves Layer 4.

A proof route uses the away-from-ℓ conductor formula first. For ℓ≥5, the adapter gives M₀=N(E[ℓ]) if E has good reduction at ℓ, or multiplicative reduction there with ℓ|ord_ℓ(Δ). For ℓ≥11 and the irreducible representation in Kraus's comparison, the weight-two-reduction-alternative contract supplies this reduction alternative. For ℓ=5 or 7, retain it as an explicit hypothesis. An additive prime ℓ can remain in M₀ even though N(E[ℓ]) is prime to ℓ.

**Checks.**

- Good reduction at ℓ leaves no coefficient-prime factor. Multiplicative reduction with ℓ∣ord_ℓ(Δ) deletes its exponent-one factor. Additive reduction retains a positive exponent in M₀, so it cannot equal the prime-to-ℓ conductor.


### Examples

For a curve already having full rational two-torsion the repair selects the identity. Otherwise it selects the quotient by its rational two-point. Combining F♯ and G♯ uses their maximum, and at level 11 H♯ is G♯ rather than F♯.

### Dependencies

Layers 1–3; the integral congruence theorem, the six-branch local filters, Chebotarev Layer 10 on C[4], EllipticCurves Layers 1–2, and the elliptic-conductor-and-weight contract. The full-two realization follows the repair in the supply direction.

## Layer 5: Uniform two-torsion irreducibility

A reducible E[ℓ] has an invariant line, which is a Galois-stable cyclic subgroup of order ℓ; its points need not be rational. With a rational point of order two, the sum of the two subgroups is a stable cyclic subgroup of order 2ℓ. With full rational two-torsion, a stable cyclic subgroup of order 4 exists on the quotient of E by one of the points of order two (the kernel of the composite E/T → E → E/T′ for two distinct rational subgroups T, T′ of order 2), and with the transported line it gives a cyclic subgroup of order 4ℓ. The degrees of rational cyclic isogenies of elliptic curves over ℚ are known: they are the integers from 1 to 19 and 21, 25, 27, 37, 43, 67, 163. No 2ℓ with ℓ ≥ 11 and no 4ℓ with ℓ ≥ 5 is among them, which gives the two irreducibility statements. They hold for every curve with the stated two-torsion, with or without complex multiplication. A curve with a cyclic 14-isogeny shows that ℓ ≥ 11 cannot be lowered to ℓ ≥ 7 in the statement with one point of order two.


### 5.0a Prime rational isogenies and their non-CM refinement

The native predicate `NonCM` says every member of TauCeti.Isogeny.Hom over ℚ̄ is an integer scalar. Its API compares geometric endomorphisms with the usual CM condition, preserves rational isomorphism, and distinguishes endomorphisms over ℚ from those over ℚ̄ (Mazur, introduction and §7; Lemos Theorem 1.1).

**Checks.**

- For j=1728, the automorphism (x,y)↦(−x,iy) over ℚ̄ is not an integer scalar; NonCM fails even though this automorphism is not over ℚ.
- For j=0 the order-three automorphism using a primitive cube root also makes NonCM fail.
- The curve y²+y=x³−x²−10x−20 has j=−2¹²·31³/11⁵, which is nonintegral; CM j-values are algebraic integers, so NonCM holds. The identity and all integer multiples remain allowed endomorphisms.

Define `HasCyclicIsogeny` using an actual rational isogeny with specified degree and cyclic kernel after base change to ℚ̄. Its API is invariant under rational isomorphism, identifies the stable cyclic-kernel description and passes from any nontrivial cyclic degree to a prime divisor (EllipticCurves Layers 1–2; Lemos Theorem 1.1).

**Checks.**

- The identity has degree 1 and trivial cyclic kernel; HasCyclicIsogeny at 1 holds, but the surjectivity theorem excludes it by n>1.
- Quotient by a rational subgroup of order 2 gives degree 2 and cyclic kernel of cardinality 2, whether or not other two-points are rational.
- Multiplication by 2 has degree 4 and geometric kernel (ℤ/2)², so that isogeny fails the cyclic-kernel condition. Degree alone would admit it for every E.

State `prime_isogeny_degrees`: the prime degree of any rational cyclic isogeny lies in {2,3,5,7,11,13,17,19,37,43,67,163}. Prove separately that degrees 19,43,67,163 force geometric CM, giving `noncm_prime_isogeny_degrees` with list {2,3,5,7,11,13,17,37} (Mazur, Theorem 1 and introduction table, pp. 129–130; §7, pp. 153–155). A proof route extends the Eisenstein formal-immersion argument from fixed vectors to stable lines, proves the resulting isogeny-character restriction, and combines it with the class-number-one CM cases and the exact prime-level rational points. The rational j-tables at 11,17,37 are independent targets of §6.0b.

*Needs:* EisensteinIdealAndRationalTorsion §§7.8–7.9 and 8.9; EllipticCurves Layers 1–2 and 4; ModularCurvesPartII §§5.2, 13.1–13.3 and 16.2; ComplexMultiplicationAndExplicitReciprocity Layer 3 for CM elliptic curves and singular values; ImaginaryQuadraticClassNumber §H3.6 for exhaustion of the class-number-one fields and orders (Mazur, p. 133, Step 4).

**Checks.**

- The fundamental discriminants −3,−4,−163 each have one primitive reduced form, whereas −20 has two, (1,0,5) and (2,2,3); the class-number-one input excludes ℚ(√−5).
- Discriminant −16 has one primitive reduced form (1,0,4) and belongs to the conductor-two order in ℚ(i); it contributes an order, not a tenth field. The thirteen-order list adds −12,−16,−27,−28 to the nine maximal-order discriminants.
- Degree 19 is allowed for a CM curve but excluded for a non-CM curve; degree 37 remains in both lists.
- Degree 41 appears in neither list, although it is prime.
- An invariant line with character χ≠1 has no fixed nonzero vector; excluding rational points of order 19 does not exclude rational 19-isogenies.

### 5.0b Composite rational cyclic degrees

State `cyclic_isogeny_degrees`: for every elliptic curve E/ℚ, every rational cyclic isogeny has degree in {1,…,19,21,25,27,37,43,67,163} (Kenku, pp. 199–201; the prime cases are §5.0a). Develop the divisor and composite-kernel restrictions on rational points of X₀(n), determine the rational cyclic extensions of the permitted kernels, and prove exclusion of every divisor-minimal forbidden composite degree. The target concerns stable cyclic kernels with arbitrary character, including CM curves. Kenku’s composite classification is cited by its published locator.

*Needs:* §5.0a; EllipticCurves Layers 1–2; ModularCurvesPartII §§5.2, 9.1 and 13.1–13.3 for degeneracy maps and Jacobians. This target supplies §5.2 independently of the later uniform image theorem.

**Checks.**

- 14=2·7 and 12=4·3 are permitted, so the later exclusions need ℓ≥11 and ℓ≥5 respectively.
- 22=2·11 and 20=4·5 are absent; a prime-degree list alone excludes neither.
- The identity has degree 1 and cyclic kernel of order 1. Multiplication by 2 has degree 4 but kernel (ℤ/2)², so it does not witness a cyclic degree-4 isogeny.

### 5.1 Native torsion and rationality predicates

Use `GeometricTorsion` for the subgroup killed by n on E(ℚ̄), with `torsionModule` its natural ZMod n module. The definition `torsionRepresentation` reads the pinned additive Galois action as a linear map via AddMonoidHom.toZModLinearMap; its value at σ and P is exactly the pinned action at σ and P. The API supplies the following facts.

- GeometricTorsion consists exactly of points killed by the indicated integer.
- torsionModule reads integer multiplication modulo n; reducing two integer scalars to the same ZMod n value gives the same action on killed-by-n points.
- torsionRepresentation preserves identity and composition and agrees with the coordinate Galois action, without choosing a basis.

Scalar extension is Representation.baseChange, and irreducibility is Representation.IsIrreducible.

**Checks.**

- At n=1 the geometric torsion is the zero group; at n=2 in characteristic zero it has four elements, distinguishing it from the rational subgroup.
- At n=0 the killed-by-zero subgroup is all geometric points; no rank-two or finite-torsion theorem is asserted there.
- The identity fixes P. For E:y²=x³−2, choose α³=2 and a primitive cube root ζ, and put P_i=(ζⁱα,0). With σ(α)=ζα, σ(ζ)=ζ, τ(α)=α and τ(ζ)=ζ², one has σP₀=P₁≠P₀ and τP₁=P₂≠P₁. Thus the action is nontrivial.
- On these same points, (στ)P₀=P₁ whereas (τσ)P₀=P₂, since multiplication acts by σ after τ. Reversing composition interchanges the two distinct answers.
- On geometric two-torsion, (3 : ZMod 2) • P_i=P_i and (0 : ZMod 2) • P_i=0, with 2P_i=0; on one-torsion the module is zero. This tests the integer action modulo n.

Define `FullRationalTwo` by cardinality four of the rational killed-by-two subgroup, and `RationalTwo` by a nonzero rational point killed by two. Their API identifies the first with rationality of all geometric two-torsion, implies the second, and transports both under rational isomorphism (EllipticCurves Layer 2; BS Lemmas 3.3 and 3.5, pp. 361–363).

**Checks.**

- On y²=x³−x, the three rational nonzero two-points are (−1,0),(0,0),(1,0); the rational two-torsion cardinality is 4, so both predicates hold.
- On y²=x³−2x, only (0,0) is a nonzero rational two-point; the cardinality is 2, so RationalTwo holds and FullRationalTwo fails.
- On y²=x³+x+1 the cubic has no rational root (neither 1 nor −1 is a root); the cardinality is 1, so both predicates fail. Counting the identity as the required nonzero point would give a false positive.

### 5.2 No cyclic isogenies of degree 2ℓ or 4ℓ

No elliptic curve over ℚ has a rational cyclic isogeny of degree 2ℓ for a prime ℓ ≥ 11, or of degree 4ℓ for a prime ℓ ≥ 5. ([BS](#references), §3, irreducibility applications in Lemmas 3.3 and 3.5, pp. 361–363; the composite-degree exclusions use §5.0b).

*Needs:* cyclic-isogeny-degrees contract.

A proof route uses the full Mazur–Kenku degree classification {1,…,19,21,25,27,37,43,67,163}. No degree 2ℓ for ℓ≥11 or 4ℓ for ℓ≥5 occurs. The prime-degree theorem by itself does not exclude these composite degrees; §5.0b is required.

### 5.3 From two-torsion and an invariant line to a cyclic isogeny

Let ℓ be an odd prime and E/ℚ have a Galois-stable subgroup of order ℓ. If E has a rational point of order 2, it has a rational cyclic isogeny of degree 2ℓ; if E has full rational 2-torsion, a curve isogenous to E over ℚ has a rational cyclic isogeny of degree 4ℓ. ([BS](#references), §3, Lemmas 3.3 and 3.5, pp. 361–363; derived coprime-kernel and dual-isogeny argument, not a separately stated source lemma).

*Needs:* EllipticCurves Layers 1–2; coprime cyclic kernels and dual isogenies.

For one rational two-torsion point, take the sum of its kernel and the odd-ℓ stable line: coprime cyclic kernels give a cyclic kernel of order 2ℓ. For full two-torsion, use distinct rational subgroups T,T′ of order two. The composite E/T→E→E/T′ has cyclic kernel of order four; transport the stable ℓ-line and combine the coprime kernels. This second curve is isogenous to E, rather than necessarily E itself.

### 5.4 Irreducibility with full rational two-torsion

State `full_two_irreducible`: if E/ℚ has full rational 2-torsion and ℓ ≥ 5 is prime, then E[ℓ] is irreducible, and absolutely irreducible. ([BS](#references), §3, Lemma 3.3 proof, p. 362; absolute irreducibility uses the separately imported oddness lemma).

*Needs:* the preceding two targets; complex-conjugation-on-torsion and odd-irreducible-absolutely-irreducible contracts.

A reducible E[ℓ] would give the stable line used in the preceding construction, hence a forbidden 4ℓ-isogeny on an isogenous curve. Irreducibility is uniform in E. For the absolute upgrade use oddness of the elliptic representation and the complex-conjugation-on-torsion and odd-irreducible-absolutely-irreducible contracts; irreducibility of an arbitrary finite-field representation would not suffice.

### 5.5 Irreducibility with a rational point of order two

State `rational_two_irreducible`: if E/ℚ has a rational point of order 2 and ℓ ≥ 11 is prime, then E[ℓ] is irreducible, and absolutely irreducible. ([BS](#references), §3, Lemma 3.5 proof, p. 363; absolute irreducibility uses the separately imported oddness lemma).

*Needs:* the cyclic 2ℓ exclusion and kernel construction; complex-conjugation-on-torsion and odd-irreducible-absolutely-irreducible contracts.

A reducible E[ℓ] gives a forbidden 2ℓ-isogeny on E. Upgrade to absolute irreducibility by the same oddness lemma. The lower bound cannot be replaced by ℓ≥7: a rational cyclic 14-isogeny supplies a counterexample with a rational point of order two.

### Examples

For ℓ=5, 4ℓ=20 is excluded by the cyclic-degree list; for ℓ=7, 4ℓ=28 is also excluded. For ℓ=3, 4ℓ=12 is allowed, so the exclusion proof does not extend to all odd primes. For one rational two-point, 2·7=14 is allowed and gives the sharp negative control; 2·11=22 is excluded.

### Dependencies

EllipticCurves Layers 1–2; ModularCurvesPartII §§5.2, 9.1, 13.1–13.3 and 16.2; EisensteinIdealAndRationalTorsion §§7.8–7.9 and 8.9; ComplexMultiplicationAndExplicitReciprocity Layer 3; ImaginaryQuadraticClassNumber §H3.6; the cyclic-degree targets; complex-conjugation-on-torsion and odd-irreducible-absolutely-irreducible contracts. The line must be Galois-stable, not pointwise fixed, and the cyclic degree-4 construction lives on an isogenous curve.

## Layer 6: Rational-isogeny uniformity

Lemos's theorem is Serre's uniformity statement for the curves that have a rational cyclic isogeny. Let E have no complex multiplication and a rational cyclic isogeny of prime degree r, and let p > 37. If the representation on E[p] is not surjective, its image lies in the normalizer of a nonsplit Cartan subgroup: the Borel case is excluded by Mazur's theorem, the exceptional images by Serre's bound on inertia, and the split Cartan case by the theorem of Bilu, Parent and Rebolledo. For r in {11, 17, 37} the curve has one of six explicit j-invariants. For r in {2, 3, 5, 7, 13} the curve gives a rational point on the curve X₀(r) ×ₓ₍₁₎ Xₙₛ⁺(p); a quotient of its Jacobian with finitely many rational points and a formal immersion at the cusps show that j(E) has no prime other than p in its denominator, and the local behaviour at p of a nonsplit Cartan image shows that p is not in the denominator either. So j(E) is an integer, and on the genus-zero curve X₀(r) the integral values of j are finitely many, explicit numbers. Surjectivity for p > 37 at each of the finitely many j-invariants, which depends only on j because quadratic twisting preserves it, completes the proof.

The curve X₀⁺(rp²) of the argument is the quotient of X₀(rp²) by the Atkin–Lehner involution at the exact divisor p², which keeps the level structure at r; it is not the quotient by the full-level involution.


### 6.0a Normalized coordinates on the five rational modular curves

Construct the five-level-j-coordinates of the contract: for r∈{2,3,5,7,13}, a rational coordinate t:X₀(r)≃ℙ¹ carrying the cusps to 0 and ∞ and satisfying j=f_r(t)/t with exactly the five displayed polynomials. The j-map has pole orders 1 at t=0 and r at t=∞. A proof route constructs modular functions with these cusp divisors, fixes their scalar by the q-expansion at a cusp, and identifies j by the q-expansion principle (Lemos, §2, numerator table, p. 6). The API identifies the two cusp poles, the degree r+1 and the displayed rational function, and determines the coordinate uniquely by this normalization.

*Needs:* ModularCurvesPartII §§4.8, 7.2, 8.2 and 9.6; ModularForms Layer 10 for cusp orders and q-expansions. Section 6.12 records the polynomials; its arithmetic definition needs no modular-curve theorem.

**Checks.**

- At r=2, t=8 gives j=1728 and t=−16 gives j=0.
- At r=13, t=−1 gives j=576; the pole orders at 0,∞ are 1,13, totaling degree 14.
- Rescaling to u=2t gives u=16 at the first point, but the unaltered formula gives 2048; the normalization excludes this coordinate.

### 6.0b Rational points at the three remaining prime levels

Prove rational-isogeny-j-tables with the exact sets in the contract, including the CM value −2¹⁵ at level 11 (Lemos, §2, pp. 5–6). Identify the modular models and j maps, determine the whole rational-point set and take its noncuspidal j-image. At 11 and 17 use their genus-one group laws, Mordell–Weil groups and cusp embeddings; at 37 prove the genus-two rational-point theorem, without assuming its Jacobian has rank zero. The output is an exhaustive rational-point theorem on these actual curves.

*Needs:* ModularCurvesPartII §§5.2, 8.2, 13.1–13.3 and 16.2–16.6; EllipticCurves Layer 6; HeightsRationalPointsAndObstructions §1.7 for Mordell–Weil.

**Checks.**

- The level-11 j-set has cardinality 3; omitting −32768 would give only 2 and lose a CM point.
- At level 17, −17²·101³/2 and −17·373³/2¹⁷ have denominators 2 and 131072; requiring integral j would lose both.
- The elliptic curve y²+y=x³−x has #E(𝔽₂)=5 and #E(𝔽₃)=7, so its rational torsion has order dividing gcd(5,7)=1. Its nonzero rational point (0,0) is therefore nontorsion; a finite modular j-table alone cannot establish rank zero of a Jacobian.

### 6.0c Geometric cuspidal-divisor torsion

Prove cuspidal-divisor-torsion: on every smooth projective congruence modular curve over a number field, every degree-zero divisor supported on geometric cusps has torsion class in the geometric Jacobian. This includes nonsquarefree levels and Cartan quotients. A proof route applies the supplied rational Drinfeld–Manin splitting and Abel–Jacobi period comparison at full level, then descends along finite modular maps by pullback and norm (DarmonMerel, Lemma 8.3, p. 23, Manin–Drinfeld input). The divisor is integral; the asserted torsion is geometric, and does not assert a rational generator or a uniform order.

*Needs:* ModularSymbolsPadicLFunctions §§0.6–0.8; ModularCurvesPartII §§13.1–13.3 and 14.11–14.12 for Jacobian functoriality and the geometric period comparison.

**Checks.**

- On X₀(1)=ℙ¹ every degree-zero divisor class is 0, with order 1.
- On X₀(11) the cusp difference has order 5; it is torsion but not zero.
- If cusp differences are killed by m=5 and A(ℚ) has order h=7, then the rational-point image over the cusp field is killed by hm=35; finiteness of A over that larger field is not asserted.

### 6.0d Winding annihilators and the integral quotient lattice

For a congruence modular Jacobian J, its full-new quotient J_new and the oriented winding class e in H₁(J_new(ℂ),ℚ), define the integral ideal I_e as the annihilator of e in the image of the integral Hecke algebra. Take the connected-kernel quotient π:J_new→A_e by the subvariety generated by I_e J_new, using the supplied quotient-for-an-ideal construction. Compose with J→J_new when a quotient of J is needed. Prove that its rational differential space is exactly the I_e-annihilated subspace; at a semistable place over q with e_K<q−1 prove that pullback identifies Cot₀(A_e) with the intersection of that rational subspace and Cot₀(J_new). Under the integral Picard/dualizing comparison this is the saturated lattice of regular weight-two differentials. If J is semistable, the same connected-kernel cotangent theorem applies to the composite J→A_e and gives the intersection of Cot₀(J) with the pulled-back rational subspace. No integral splitting of the rational Drinfeld–Manin projector is asserted (DarmonMerel, Proposition 7.1, pp. 18–20; Mazur, Corollary 1.1 and §2(d–e), pp. 137, 140–141).

The API gives the annihilator ideal, the optimal quotient with its universal property inherited from the supplied quotient, Hecke stability of its kernel and the saturated pullback lattice. The pairing is integration of ω_f=2πi f(z)dz along 0→i∞; it identifies the surviving eigenspaces with those having nonzero winding period. The quotient can be zero; its nonvanishing at the five mixed levels is §6.5.

*Needs:* ModularSymbolsPadicLFunctions §§0.6–0.8 and 1.1; ModularCurvesPartII §§7.2, 13.7–13.9, 14.11–14.12 and 16.2’s modularQuotientForIdeal; ModularForms Layers 3 and 8; optimal-quotient-cotangents. The free cokernel from that last contract supplies saturation after identifying rational differentials.

**Checks.**

- If J_new=0, e=0, I_e is the unit ideal of the zero Hecke ring and A_e=0. A nonzero quotient is not automatic.
- For the identity quotient, the pullback lattice is the whole lattice. For multiplication by q on an elliptic curve, the pullback is qO inside O with quotient O/qO, so saturation fails; its finite kernel is not connected as an abelian subvariety.
- At q=23,e_K=1 the bound is 1<22. At q=2,e_K=1 the strict bound 1<1 fails.
- For f=exp(2πiz)+2exp(4πiz), W(f)=i/π and the normalized period is −2; reversing the path gives +2. The corresponding width-p expansion t+2t² gives ω_f=(p+2pt)dt and cusp value p dt, agreeing with §6.7.

### 6.0e Unconditional rank zero for modular abelian factors

Prove modular-rank-zero: for every primitive weight-two trivial-character newform f of any positive level, with coefficient field K_f of arbitrary degree d and L(f,1)≠0, the associated A_f(ℚ) is finite (DarmonMerel, Proposition 7.1 proof, p. 20, Kolyvagin–Logachev input). First prove that nonvanishing is preserved by every coefficient embedding, using the algebraic modular-symbol value divided by its nonzero period. The conclusion covers CM and non-CM factors and makes no assumption on a preselected residual prime.

Construct the weight-two finite-level modular classes from normalized theta units, their torsion evaluations (Siegel units), ordered pairs of these units and the cup-normalized étale regulator of their Beilinson symbols. On {u,v} this regulator is κ(u)∪κ(v) in H² with Tate twist two; its relation to the finite Chern map on the product-normalized Quillen class is the sign in the supplier contract. On an elliptic curve where c is invertible, the theta unit for c prime to 6 has divisor c²[0]−[c]⁎[0] and its leading Tate coefficient fixes its scalar. Over the two-index modular curves take M,N≥1 with M+N≥5 and smoothing integers c,d>1 prime to 6pM and 6pN respectively. Use the p-power level tower and its trace-compatible cyclotomic Tate untwisting, taking the weight-two moment parameters (r,r′)=(1,1) at k=2, to obtain the critical twist-one system. Project to the actual rank-two eigenform summands, retaining the cohomological dual and this Tate twist, then descend to arithmetic Galois cohomology by the Hochschild–Serre edge map. Prove their transfer, norm, Hecke, coefficient-change and smoothing laws in the interfaces of EulerSystemsAndKolyvaginSystems Layer 2; all auxiliary factors remain present before rationalization (Kato, §§1–2, pp. 121–133; §§8.1–8.9, pp. 180–185). These are the shared weight-two constructions; higher weights and family interpolation use the same normalization. The API supplies the following facts.

- The theta divisor, leading Tate coefficient and isogeny distribution laws determine the normalized unit and commute with base change.
- The regulator preserves coefficient change and transfer, and sends an ordered pair to its ordered Kummer cup; swapping the pair negates the rational class.
- Eigenform projection preserves the trace, norm and Hecke relations, retaining the explicit smoothing factors until their invertibility or nonvanishing is verified.

Fix the weight-two normalization dictionary on the same ordered symbol s={u,v}. At its function field F and every positive modulus m invertible in F, the cup regulator is R_m(s)=κ_m(u)∪κ_m(v)=−c₂,₂(red_m(θ₂♮s)), where θ₂♮s=[u]·[v] is the product-normalized integral Quillen class. This is the positive Chern-character map used by Kato §8.4, pp. 182–183; the ordinary finite Chern operation has the opposite sign on this integral-reduction image (K2SymbolsBrauerPartII §5.5). Prove that the moment, transfer, Hochschild–Serre and eigenform maps carry this dictionary to arithmetic classes: the cup-normalized class equals the negative of the class obtained by applying the ordinary Chern operation to the same products. An extension using Kato's positive Chern-character map instead has the identical weight-two class, with no extra minus sign. This comparison does not identify arbitrary finite-coefficient K₂ classes with integral reductions.

In this dictionary fix a coefficient prime λ|p of K_f and let W_f be the rank-two K_f,λ-eigenform quotient of geometric H¹_et of the modular curve, after extending coefficients from ℚ_p to K_f,λ. The weight-two moment has coefficients W_f(1), identified with the chosen Tate-module summand V of A_f; retain this identification and its Poincaré duality pairing, rather than replacing W_f(1) by W_f or W_f(2). Identify the de Rham and Betti period lines by the modular-symbol comparison with ω_f=2πi f(z)dz and the path 0→i∞. Both sides use the identical smoothing integers c,d, their Hecke/diamond factors and the same norm maps before any factor is inverted (Kato, §8.4, (8.4.1)–(8.4.3), pp. 182–183; §§8.9–8.11, pp. 185–186; §9.4, pp. 188–189). These are equality and naturality targets for the weight-two adapter, not an identification up to an unspecified scalar.

Prove weight-two modular explicit reciprocity first on the raw two-index curves: take k=2, r=r′=1, the levels and smoothing conditions above, and assume that every prime divisor of M divides N. Localization maps the arithmetic class to H¹(ℚ_p,W_(M,N)(1)), where W_(M,N)=H¹_et(Y(M,N)_ℚ̄,ℚ_p); its dual exponential lands in Fil⁰ D_dR(W_(M,N)(1)), identified with the weight-two modular-form space. When p∤M put A_p=T′(p)⟨1/p,1⟩⁎; when p∤MN also put B_p=⟨1/p,1/p⟩⁎. The image is the normalized smoothed Eisenstein product multiplied by 1 if p|M, by 1−A_p/p if p∤M and p|N, and by 1−A_p/p+B_p/p if p∤MN. The raw support condition is part of this formula (Kato, Theorem 9.5, p. 188).

Construct separately the pushforward from two-index classes to H¹(ℚ(μ_m),W_N(1)), with W_N=H¹_et(Y₁(N)_ℚ̄,ℚ_p), and, after extension to K_f,λ, the eigenform projection to H¹(ℚ(μ_m),W_f(1)). Here N,m≥1, S is a finite set of primes containing p, c,d>1 satisfy gcd(cd,6)=gcd(d,N)=1 and no prime of cd lies in S; the pushforward label ξ is either a(A) with a∈ℤ, A≥1 and every prime divisor of mA in S, or ξ∈SL₂(ℤ) with every prime divisor of mN in S (Kato, §5.1, p. 152; §8.1, p. 180). The auxiliary-level construction makes the pushforward independent of the chosen two-index lift; its reciprocity formula and the projected formula have the domains of Kato Theorems 9.6–9.7, without imposing the raw support condition on the final level and conductor (Kato, §§8.9–8.11, pp. 185–186; Theorems 9.6–9.7, pp. 188–189). For m=1, the dual exponential of the projected localization, paired with the fixed Betti/de Rham period comparison, gives the central L-value with its Euler and smoothing factors (Kato, Theorem 12.5(1), pp. 221–222). The proof includes the modular-function-field differential comparison for residue fields of finite p-basis and its ordered-cup compatibility with the dual exponential (§10, (10.9.5) and Proposition 10.12, pp. 195–198; §11, pp. 202–218). The API requires localization, coefficient-change, transfer and smoothing compatibility for each map; the eigenform target is its filtered de Rham line.

For the descent application choose p away from the level, a coefficient prime λ|p and a stable coefficient lattice T in the Tate-module summand V of A_f. Identify the projected class's representation with T, including its dual and twist, before descent. The bottom class is in H¹(ℚ,T), finite at every finite v≠p and unrestricted at p; the singular quotient is H¹_s(ℚ_p,T)=H¹(ℚ_p,T)/H¹_f(ℚ_p,T). Prove that this quotient is free of rank one at the chosen λ and that reciprocity gives a nonzero image spanning a sublattice of finite index. A class finite also at p has zero singular image; a global nonzero class alone bounds only the strict Selmer group. Prove that auxiliary primes exist satisfying the representation, local and nonzero Euler/smoothing-factor hypotheses of descent. For non-CM f use the classical large-image theorem with its inner-twist field and exclude its finite exceptional set; for CM f construct the associated elliptic-unit systems by evaluating the normalized theta units on the CM curves, use induced characters, and prove their norm, reciprocity and descent comparisons without requiring a non-CM unipotent image (Kato, §§15.12–15.17, pp. 263–265). Apply EulerSystemsAndKolyvaginSystems §4.17(c), with its finite singular-local index, to the Bloch–Kato finite Selmer condition on the dual representation, identifying it with the required A_f summand by the stated duality. Kummer theory and Mordell–Weil then give rank_ℤ A_f(ℚ)=0 and finiteness, in every coefficient degree (Kato, Theorem 14.2(2), p. 235). These arithmetic verifications belong here; generic descent remains with its owner.

*Needs:* SchemeKTheoryOperations §§2.2–2.4, 3.6 and 6.1 for symbols and transfers; K2SymbolsBrauer §§6.4, 6.7–6.9 and 8.1–8.3; K2SymbolsBrauerPartII §§1.1 and 5.5 for the cup/Chern sign; EulerSystemsAndKolyvaginSystems Layers 2 and 4, especially §§4.3, 4.17(c) and 4.20; AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2 for coefficient realizations and projection; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 for period-sequence boundaries; ModularCurvesPartII §§3.1–3.5 and 5.17 for the open curves and their universal elliptic curves; AutomorphicGaloisRepresentations §§6.1–6.2 and 7.5 for coefficient summands and non-CM large image; ComplexMultiplicationAndExplicitReciprocity Layers 1–3 for the CM curves, ideal action and class fields; ModularSymbolsPadicLFunctions §§0.6–0.7 and 1.1 for algebraic periods; ModularCurvesPartII §§16.2–16.6; HeightsRationalPointsAndObstructions §1.7 and SelmerIwasawaCohomology §2.12a for abelian Kummer theory. No input from a later Heegner application is used by generic descent.

**Checks.**

- For c=5 and p=7 the theta divisor has order 25−1=24 at zero and −1 at each of the other 24 five-torsion points; the constant unit 1 fails these orders. Extending to c=1 gives the unit 1 and zero symbol, outside the nontrivial smoothing choice.
- Multiplying the normalized theta unit by 2 leaves every divisor order unchanged but multiplies its prescribed leading coefficient by 2; the Tate normalization excludes this wrong unit.
- Over ℚ₇ at m=3, the ordered symbol {3,7} has contracted cup invariant 1/3 and product-normalized Chern invariant −1/3; their coordinates are 1 and 2 modulo 3 (K2SymbolsBrauerPartII §5.5). The positive Chern-character moment retains 1, whereas the ordinary Chern moment requires multiplication by −1 to give −2=1 modulo 3. With either input the unit 1, both coordinates are 0. Modulo 2 the two signs both give 1 and cannot distinguish these maps.
- At k=2, (r,r′)=(1,1) gives twist k−r=1 and symmetric-power degree k−2=0, so there is no factorial denominator. At p=7, c=5,d=11, M=1,N=5 satisfies the raw support condition; M=2,N=5 fails it since 2∤5, even though the smoothing conditions and finite-level symbol remain valid. With p=7, A_p acting by 2 and B_p by 1, the three raw Euler operators act by 1, 5/7 and 6/7 respectively; dropping the quadratic term changes 6/7 to 5/7. These scalar values test the operator formula, without asserting such an eigenform exists.
- For finite transfers of degrees 2 and 3, corestriction after restriction sends a class of value 1 to 2 and then 6; the composite degree is 6. Replacing transfer by inverse restriction would give 1.
- In ℤ₅² with H¹_f=ℤ₅×{0}, the class (1,0) has singular image 0, whereas (0,5) has image 5 and index [ℤ₅:5ℤ₅]=5. The zero image has infinite index. Finiteness at p cannot be imposed on the class used for reciprocity.
- Interchanging the ordered units changes the cup product's sign; on the normalized de Rham line, a reciprocity value 2 becomes −2, while the zero class gives 0. Rescaling a period from Ω to 2Ω changes L/Ω from 2 to 1 in this example, so the period adapter must change with it.
- For f=exp(2πiz)+2exp(4πiz), the 0→i∞ period of ω_f is −2, as in §6.0d; using the reverse path gives +2. This fixes the period orientation in the reciprocity adapter. For E:y²=x³−x at q=5, with coefficient prime p=7, arithmetic Frobenius on H¹_et has trace −2/5 and determinant 1/5; twisting once gives trace −2 and determinant 5 on the Tate-module realization, whereas twisting twice gives −10 and 125. Thus the twist-two K₂ regulator must pass through the stated cyclotomic untwisting before the critical twist-one specialization.
- If d=2, zero Selmer rank over each coefficient completion gives rational Mordell–Weil rank 0, not merely the exclusion of an elliptic factor.
- A product of finite groups of orders 5 and 7 has order 35; finiteness passes across a rational isogeny by finite kernel and cokernel.
- A finitely generated rank-zero abelian group such as ℤ/5 is finite of order 5; the rank-zero group ℚ/ℤ is infinite, so Mordell–Weil is essential.

### 6.0f The split-Cartan rational-point theorem

Prove quantitative-elliptic-isogeny in the contract for all number fields of degree d≥1, including quadratic fields, for both CM and non-CM curves. Its isogeny is geometric: it need not descend to K. Use the stable height h_F in Faltings' normalization, and write B(d,H)=10⁷d²(max{H,985}+4log d)². The target asserts that a geometric isogeny E→E′ exists with degree at most B(d,h_F(E)); it does not bound every isogeny (Gaudron–Rémond, Theorem 1.4, p. 4, arXiv v1; BPR, Theorem 3.1, p. 9).

A proof route develops the quantitative period estimates used by Gaudron–Rémond §§3, 6 and 7: prove the auxiliary-section evaluation and jet-norm bounds, the multiplicity/zero estimate and their slope inequality, including Proposition 6.9 for polarized abelian surfaces with line-bundle intersection degree deg_L A=c₁(L)²[A]≥10¹⁰. This is the unnormalized top intersection, not the degree of A→A∨ or half of the top intersection. For geometrically isogenous non-CM E,E′, prove that the smallest abelian subvariety of E²×E′² whose tangent contains a vector formed from full period bases is a surface isomorphic to E×E′ over an extension of degree at most two; its intersection with {0}²×E′² has cardinality the least geometric isogeny degree Δ (Theorem 7.5, pp. 27–28). Use the surface period estimate with its weighted product polarization and conormal slope estimate, then the explicit logarithm absorption of §7.3, pp. 28–30, to obtain the displayed constant, field-degree exponent and height cutoff. For a non-CM field with a real place include the separate matrix-lemma estimate of §7.5, pp. 31–32, which implies the same coarse bound. For CM curves use the period graph in E×E′ and the field extension of degree at most twelve of §7.4, pp. 30–31, with its shortest-period estimate. These quantitative estimates and their proofs are targets of this subsection, not consequences of qualitative finiteness. The Hermitian norms, period lattices, polarizations and stable-height comparisons are imported through the contracts above.

Prove the cyclic-isogeny corollary: if E/K is geometrically non-CM and φ:E→E′ is cyclic of degree δ over K, then δ≤B(d,h_F(E)). Compare φ to a geometric isogeny ψ of bounded degree, and use ψ∨φ=[n]. Cyclicity gives δ dividing n, while n²=δ deg ψ, hence δ≤deg ψ (BPR, Proposition 3.3, p. 9). The cyclic corollary needs non-CM; the existence theorem does not. The API supplies the following facts.

- For every d≥1 the bound is positive, uses the stable height of the source E and applies to a geometric isogeny E→E′.
- Stable height and the geometric isogeny degree are invariant under extension of K, while d changes to the degree of the extended field; retain the field of definition in the numerical bound.
- For a cyclic isogeny from a geometrically non-CM source the same numerical bound holds for that isogeny, rather than only for a least-degree representative.

*Needs:* for quantitative-elliptic-isogeny and its cyclic corollary, ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.7, 3.4–3.5 and 4.4; AbelianSchemesAndArithmeticModuli Layers A2, A5 and A6; EllipticCurves Layers 1–2 for duals and cyclic kernels. The period estimates in the route are proved within this subsection.

Prove split-cartan-rational-points: for every prime p≥11, p≠13 and integer m>1, every rational point of X₀⁺(pᵐ) is cuspidal or CM (BPR, Theorem 1.1, pp. 1–2). Prove modular-unit integrality and the modular-unit height estimates for m=2,3 (BPR, Theorems 2.1–2.2, pp. 4–8). Combine them with quantitative-elliptic-isogeny and its cyclic corollary over quadratic fields, importing the height change and j-height comparisons, to exclude p>14,000,000 for m=2 and p>170,000,000,000 for m=3 (BPR, Theorem 3.2, pp. 9–10). Prove the Gross-vector nonvanishing criterion and its rational-point exclusion for 11≤p<10¹⁴, p≠13 (BPR, Proposition 4.8, p. 13). Since 170,000,000,000<10¹⁴, these ranges overlap and cover every permitted prime; equality at either large-range cutoff lies in the finite range, and p≥10¹⁴ lies in both large ranges. Descend all m>1 by the degeneracy maps decreasing m by two. The finite-range result is a mathematical theorem, without a point-search procedure. Curve identifications, Jacobian correspondences and this rational-point theorem are distinct targets.

*Needs:* for split-cartan-rational-points, quantitative-elliptic-isogeny and its cyclic corollary; ArakelovGeometryAndAbelianHeights §§4.4 and 5.9; ModularCurvesPartII §§9.4–9.6, 13.1–13.3 and 16.2; EisensteinIdealAndRationalTorsion §7.9’s formal-immersion method; ModularForms Layers 8 and 10. The modular-unit height inequalities and Gross-vector exclusion with their full numerical ranges are owned parts of this subsection.

**Checks.**

- For the product principal line bundle L₁⊠L₂ on E×E′, c₁(L₁⊠L₂)²=2 while the polarization map has degree 1. Replacing L₁ by L₁ⁿ changes the intersection to 2n; pulling back by the degree-Δ period-graph isogeny gives 2nΔ. The two degree notions cannot be interchanged in the surface period estimate.
- B(1,0)=B(1,−1)=10⁷·985²=9,702,250,000,000, since log 1=0; negative Faltings heights must not make the bound vanish. The identity has degree 1, whereas multiplication by arbitrarily large n has degree n² and is not bounded by this existence theorem.
- At d=2 and h_F(E)≤985 the bound is 4·10⁷(985+4log 2)², strictly between 39·10¹² and 40·10¹². Dropping d² or the logarithmic term changes the quadratic-field contract.
- On E:y²=x³−x over ℚ(i), the endomorphism [10⁷+i] has a cyclic geometric kernel of order 10¹⁴+1, exceeding B(2,h_F(E))<4·10¹³. Its lattice matrix has entries [[10⁷,−1],[1,10⁷]] and Smith invariants 1,10¹⁴+1; the CM case cannot satisfy the cyclic corollary. The identity still witnesses the existence bound for E=E′.
- The finite range reaches 10¹⁴, above both 14,000,000 and 170,000,000,000. The latter two boundary values are covered by the finite inequality, and at 10¹⁴ the strict large-range inequalities both hold; there is no uncovered endpoint.
- At p=41,m=2 the theorem rules out every noncuspidal non-CM rational point; m=1 is outside its range.
- p=13 is excluded although it is ≥11; the argument does not replace that condition by a large-level slogan.
- X₀⁺(7²) has genus 0 and infinitely many rational points; p≥11 cannot be dropped.

### 6.0g Exceptional projective images

Prove serre-inertia-exceptional-bound: for E/ℚ and prime p>17, the projective image on E[p] is none of A₄,S₄,A₅. Use the elliptic local inertia possibilities at p, with the potentially good and potentially multiplicative cases separated, and their restrictions on element orders in the three finite groups (Mazur, proof of Theorem 3, p. 130).

*Needs:* ArithmeticGaloisRepresentations §§2.3 and 4.4–4.5; EllipticCurves Layer 4; the local torsion and finite-flat comparison underlying the weight recipe. This precedes §6.10 and uses no uniform image conclusion.

**Checks.**

- The largest element orders of A₄,S₄,A₅ are 3,4,5; the respective group orders are 12,24,60.
- p=19 satisfies p>17; p=17 does not.
- Complex conjugation has projective order 2, which occurs in all three groups; oddness alone supplies no exclusion.

### 6.0h Torsion specialization for the Néron model

Prove neron-torsion-specialization for every abelian variety over a complete mixed-characteristic DVR of residue characteristic q and absolute ramification index e<q−1: reduction into its Néron special fibre is injective on the full rational torsion subgroup. Identify the reduction kernel with points of the formal identity chart and prove it torsion-free by the valuation estimate for multiplication by q. This includes the q-primary torsion, not only prime-to-q torsion ([DarmonMerel](#references), §8, pp. 22–23, torsion-injection input; Mazur, §1, pp. 135–138).

*Needs:* NeronModelsAndSemistableAbelianVarieties §§1.5 and 3.5; EllipticCurves Layer 1’s formal-group valuation method, extended here to the formal group of an abelian variety. HeightsRationalPointsAndObstructions §1.18 supplies the good-reduction case.

**Checks.**

- At q=23,e=1 the strict bound holds, so even rational 23-primary torsion cannot lie in the reduction kernel.
- At q=2,e=1 the bound fails: E:y²+xy=x³+4x²+x has discriminant 225, so good reduction, but P=(−1/4,1/8) has order 2 and reduces to O. Its integral projective coordinates [−2:1:8] reduce to [0:1:0]. Thus full torsion injection fails at e=q−1 even for an abelian scheme.
- For the formal multiplicative group over ℚ₂, −1=1−2 has order 2 and reduces to 1. At q=2,e=1, injectivity in a general smooth formal group would be false.

### 6.1 Native nonsplit-Cartan predicate

Define `ImageInNonsplitCartanNormalizer` by a subring C of `End_{𝔽ₚ}(E[p])` that is a field with p² elements, normalized by conjugation under every actual torsion Galois operator. The inverse Galois operator makes this inclusion an equality. Its unit group is a nonsplit Cartan (Lemos §2, equation (2.1), pp. 4–5).

The API supplies the following facts.

- The rank-two torsion theorem identifies C with `𝔽_{p²}` acting by multiplication in a basis; containment is invariant under changing the basis.
- This is equivalent to normalizing a cyclic subgroup of additive automorphisms of order p²−1. A generator of that order cannot have a reducible degree-two minimal polynomial: a split semisimple element has order dividing p−1, and a nonsemisimple one has order dividing p(p−1). Its generated algebra is therefore the required quadratic field.
- Normalizing C is equivalent to normalizing Cˣ: each nonzero element of a field is a unit, and zero is fixed.

*Needs:* EllipticCurves Layer 2's two-dimensional geometric prime torsion and finite-field multiplication; the native torsion action.

**Checks.**

- At p=11, multiplication by 𝔽₁₂₁ gives a field subring with 121 elements, 120 units and normalizer of order 240; its normalizer satisfies the definition.
- GL₂(𝔽₁₁) has order (121−1)(121−11)=13200>240, so the full image cannot normalize such a field. The scalar subring of order 11 fails the required cardinality.
- At p=11 the split diagonal algebra has 121 elements but zero divisors, e.g. diag(1,0)diag(0,1)=0. Its normalizer has order 200, which does not divide 240, so it cannot normalize a quadratic field instead.

### 6.2 Potential good reduction under a nonsplit Cartan image

If p ≥ 5 is prime and the image of the Galois representation on E[p] lies in the normalizer of a nonsplit Cartan subgroup, then E has potentially good reduction at p and at every prime q ≢ ±1 mod p. ([Lemos](#references), §2, Proposition 2.2 and proof, pp. 4–5 (v2)).

*Needs:* EllipticCurves Layers 2 and 4 for rank-two torsion, cyclotomic character and Tate-curve action.

A proof route uses the quadratic-twist Tate description at a potentially multiplicative prime. Squaring elements of the normalizer places them in the nonsplit Cartan. Its eigenvalue structure forces the square of the local cyclotomic character to be trivial. At q=p this contradicts p≥5; at q≠p it forces q≡±1 modulo p. This uses local torsion at residue characteristic possibly different from p.

### 6.3 Exact-divisor differential comparison

For r>0 and p prime with gcd(r,p)=1, p² is an exact divisor of rp². Consume ModularForms Layer 6's normalized Atkin–Lehner operator at that divisor, specialized to weight two and trivial character. Prove its comparison with pullback of differentials on the arithmetic quotient `X₀(rp²)/w_{p²}` supplied by ModularCurvesPartII §9.5, and prove that the invariant regular differentials descend to that quotient (Lemos §3, p. 9; DarmonMerel, Proposition 7.1, pp. 18–19).

*Needs:* ModularForms Layer 6; mixed-modular-curves contract; ModularCurvesPartII §9.5 for the split-normalizer identification.

**Checks.**

- At r=5,p=11, the level is 605, the exact divisor is 121, gcd(121,5)=1 and the weight-two normalization factor (√121)⁰ is 1.
- At r=p=5, gcd(25,5)=5, so 25 is not an exact divisor of 125; the labelled involution is excluded.
- At r=11,p=17 the old source contains J₀(11) of dimension 1. At r=1 its dimension is 0; only the genus-zero case permits old-image vanishing in the full nonsplit target.

### 6.4 The Cartan correspondence and Chen's isogeny

For every r>0 and prime p with gcd(r,p)=1, use the jointly placed pair Nsp,Nns of Conventions and construct the correspondence through X₀(r) ×ₓ₍₁₎ X(p)/(Nsp ∩ Nns) and its pull-push map from the Jacobian of `X₀(rp²)/w_{p²}` to the Jacobian of X₀(r) ×ₓ₍₁₎ Xₙₛ⁺(p). Prove prime-to-p Hecke equivariance and passage of p-old divisors to p-old divisors. Separately prove Chen’s theorem that the induced map between p-new quotients is an isogeny, using the rational permutation-module identity ℚ[G/Nsp]⊕ℚ[G/G]≃ℚ[G/Nns]⊕ℚ[G/B] for G=GL₂(𝔽ₚ), together with the nonzero action of the pull-push correspondence on every p-new constituent. For odd p the nonsplit Cartan is the group of matrices [[a,δb],[b,a]] with (a,b)≠(0,0), and Nns adjoins diag(1,−1); together with monomial Nsp this fixes the relative position. Prove invariance under simultaneous conjugation, rather than arbitrary independent conjugations. At p=2 use the order-2 monomial subgroup and Nns=GL₂(𝔽₂), and perform the constituent calculation with these S₃ subgroups. Here B is a Borel subgroup; the base-level and Borel terms account for the old summands. For r∈{1,2,3,5,7,13}, genus zero of X₀(r) makes the p-old part of the target zero. ([Lemos](#references), §3, correspondence and Lemma 3.2, p. 9; Theorem 3.3, p. 9 (v2), for the separate isogeny input; Chen, Theorem 2, pp. 1–2, for the explicit map; de Smit–Edixhoven, Remark 3, p. 4, for its relative-position condition).

*Needs:* mixed-modular-curves and mixed-modular-jacobians contracts; ModularCurvesPartII §9.5 for the split-normalizer identification and §§13.1–13.3 for pull-push maps; rational representations of GL₂(𝔽ₚ); the genus-zero computation for X₀(r) only for old-image vanishing into the full target.

Use the pull-push map through the normalized correspondence and the supplied identification of the split quotient with `X₀(rp²)/w_{p²}`. The equality Nns B⁺=Nns B⁻=GL₂(𝔽ₚ) sends old divisors to old divisors, and, for r∈{1,2,3,5,7,13}, X₀(r) has genus zero. The isogeny theorem requires the rational correspondence identity on the p-new summands; it is a separate target here. The old-part calculation and prime-to-p Hecke commutation are necessary but do not prove it.

For general positive coprime r,p the Chen correspondence sends p-old to p-old, so its factorization is between p-new quotients; vanishing into the full nonsplit Jacobian additionally uses genus zero of X₀(r). The genus-zero factorization includes r=1 as well as r∈{2,3,5,7,13} (Lemos Lemma 3.2 and Theorem 3.3, p. 9). The general coprime-level version uses the same GL₂(𝔽ₚ) correspondence identity on each auxiliary level-r Hecke summand.

**Checks.**

- At p=2, G≃S₃ has order 6, Nsp has order 2 and Nns=G; the permutation identity reads 3+1=1+3=4. Using the literal split normalizer would instead give the false equality 1+1=1+3.
- At p=5,δ=2, Nsp and Nns have orders 32 and 48, and their intersection has order 16=4(p−1). With J=diag(1,−1) and S=[[0,2],[1,0]], the intersection is the disjoint union of the four scalar cosets represented by 1,J,S,SJ. Conjugating Nns alone by [[0,1],[1,1]] gives intersection order 8, so independent placement is excluded. At p=3,δ=2 the corresponding intersection has order 8; at p=2 it has order 2, not 4(p−1).
- At p=5 the permutation identity has dimensions 15+1=10+6=16. At r=1, dim J₀(1)=0, so the p-old image is zero. At r=11, dim J₀(11)=1; old-image vanishing cannot be inferred from the general old-to-old theorem.
- At r=5,p=11, rp²=605 and the exact divisor is 121, with gcd(121,5)=1; w₆₀₅ is a different involution.
- The zero map of two positive-dimensional isogenous Jacobians commutes with every Hecke operator but has infinite kernel. Hecke equivariance does not imply Chen’s isogeny conclusion.

### 6.5 Winding class and five-level nonvanishing

For r∈{2,3,5,7,13} and a prime p outside that set, define the winding class in rational homology by the functional integrating holomorphic differentials along the path from 0 to i∞; cuspidal-divisor torsion makes this functional a rational homology class. Keep the endpoint divisor in the Jacobian distinct from the zero boundary of an absolute homology class. Prove that its full-new projection is nonzero for all five levels and p outside the five-prime set, and that the integral Hecke annihilator yields the nonzero optimal quotient of the mixed Jacobian. With α the supplied correspondence, set D=α_*((0)−(∞)); the upward path has endpoint divisor (∞)−(0), whose image is −D. Include this transferred cuspidal divisor of exact order p and the Hecke/cotangent comparison transferring from the full-new quotient; an arbitrary rank-zero quotient does not have this property (Lemos Theorem 3.4 and proof, p. 10; DarmonMerel Propositions 7.1–7.2, pp. 18–21). The API supplies the following facts.

- The winding annihilator is the ideal of integral Hecke operators killing the specified class.
- The associated optimal quotient map has the mixed Jacobian as source and its connected-kernel Hecke quotient as target, with its induced prime-to-p Hecke action.
- Pullback identifies the quotient cotangent lattice with the saturated annihilator sublattice, under the integral comparison and its ramification hypotheses.

**Checks.**

- On one q-expansion term f(z)=exp(2πiz), W(f)=i/(2π) and integration of 2πi f(z)dz from 0 to i∞ is −1. Reversing the path gives +1; omitting 2πi gives i/(2π). The term tests normalization, without being called a cusp form of weight two.
- For the two-term function f(z)=exp(2πiz)+2exp(4πiz), W(f)=i/π and the normalized period is −2. A coefficient-weighted integral must divide the second term by its frequency.
- For f(z)=exp(2πiz)−2exp(4πiz), W(f)=0 and the normalized period is 0 despite f being nonzero. Nonvanishing of a winding component needs a theorem, not pointwise nonvanishing of its test function.

- For r=2,p=11, the upward path’s endpoint class is −D=10D in the cyclic subgroup generated by D, of order 11; the absolute homology class has boundary zero. Reversing the path gives D. Identifying a torsion divisor with the boundary of an absolute homology class would confuse these two groups.
- At r=2,p=11, the transferred cuspidal divisor D has exact order 11. At p=3 its class is zero, of order 1, and PSL₂(𝔽₃)≃A₄ has a quotient of order 3; this excluded prime shows why the nonzero cuspidal-divisor argument needs its prime range (DarmonMerel Corollary 6.4 and Proposition 6.5, p. 17).

Prove the normalized period comparison ⟨f,e⟩=2πi W(f), where W(f)=i∫₀∞ f(it)dt and the pairing integrates ω_f=2πi f(z)dz. This determines the scalar in every winding comparison and its integral-lattice use ([DarmonMerel](#references), §7, pp. 19–20, differential and pairing).

*Needs:* integral-winding-comparison for the specified pairing and modular differential; integration on the oriented path.

*Needs:* the preceding Cartan correspondence and differential comparison; integral-winding-comparison and cuspidal-divisor-torsion contracts for rational homology, the cuspidal divisor and integral Hecke action; ModularForms Layers 3 and 8; Mathlib Matrix.SL2.commutator_eq_top for the absence of a cyclic quotient of PSL₂(𝔽ₚ).

### 6.6 The winding quotient of rank zero

For r ∈ {2, 3, 5, 7, 13} and a prime p outside that set, the Jacobian of X₀(r) ×ₓ₍₁₎ Xₙₛ⁺(p) has a nonzero optimal quotient A over ℚ with A(ℚ) finite, whose kernel is stable under T_n for n prime to p. ([Lemos](#references), §3, Theorem 3.4 and proof sketch, p. 10 (v2)).

*Needs:* the preceding correspondence; integral-winding-comparison and modular-rank-zero contracts; five-level winding nonvanishing.

A proof route uses Chen’s prime-to-p Hecke-equivariant isogeny to transfer the winding construction to the mixed Jacobian. Project the winding class to the full-new part, quotient by its integral Hecke annihilator, prove the quotient nonzero, and apply rank-zero results to every surviving modular abelian factor. The modular rank-zero contract applies in arbitrary dimension; an elliptic rank-zero theorem alone does not supply it. For r=5,7,13 require the winding boundary/nonvanishing argument in addition to the Darmon–Merel r=2,3 cases.

### 6.7 Coefficient support and integral cotangent comparison

Prove the characteristic-q coefficient-support statement: for r∈{2,3,5,7,13}, p outside this set, q prime with q≡±1 mod p, and f a weight-two differential on the smooth mixed special fibre over 𝔽_q in the integral cotangent comparison, if its q-expansion coefficients a_n(f) vanish for every n prime to p, then f=0. The proof descends a differential supported on multiples of p to level r, whose weight-two space is zero. The integral model, cusp coordinate and coefficient convention are those of the winding comparison (DarmonMerel Lemma 8.2, pp. 22–23; Lemos §3, p. 10). *Needs:* mixed-modular-curves, mixed-modular-jacobians and integral-winding-comparison contracts; old/new degeneracy; genus zero of X₀(r).

Before reduction use optimal-quotient-cotangents on 0→B→J→A→0 for the specified optimal quotient. At q≡±1 mod p the local field is unramified, so e=1<q−1; the cokernel Cot₀(B) is free, hence Cot₀(A)→Cot₀(J) remains injective after reduction. Identify Cot₀(J) with regular weight-two differentials using integral-winding-comparison. Fix the formal cusp parameter t=exp(2πiz/p). If the corresponding analytic cusp form has expansion Σ a_n tⁿ, then ω_f=p·Σ a_n tⁿ⁻¹dt, so evaluation at the cusp is p·a₁dt. The coefficient p is a unit at q≠p; equivalently scale the coefficient sequence by p to make the cotangent evaluation its first coefficient. Use this same scaling in a₁(T_n f)=a_n(f) for n prime to p (DarmonMerel, Lemma 8.2, pp. 22–23; ModularCurvesPartII §§4.8 and 7.2). Deduce the exact cotangent statement for the same r,p,q: put K=ℚ(ζₚ)⁺ and let R be the localization of the integers of K at a prime above q, k its residue field, C the specified smooth integral curve, s its cusp section, and u:C→𝒜 the extension of P↦[(P)−(∞)] into the Néron model of the specified winding quotient. Pullback from the cotangent space of 𝒜ₖ at zero to that of Cₖ at sₖ is surjective. Equivalently the induced map of completed local rings is surjective. If the cotangent image were zero, prime-to-p Hecke stability would force all a_n with (n,p)=1 to vanish, contradicting the coefficient-support statement for a nonzero cotangent vector.

*Needs:* the preceding winding quotient and coefficient-support statement; mixed-modular-curves, integral-winding-comparison and optimal-quotient-cotangents contracts; JacobianChallenge Layer F for the Abel–Jacobi map.

**Checks.**

- At p=11, the first prime q≡±1 mod p is 23; q≥21>13. At p=17 it is 67; q≥33>13. Thus q∤rp for all five r.
- For p outside the five-prime set, p≥11; the excluded values p=2,3,5,7,13 are not silently covered by the argument q>13.
- The zero quotient has zero cotangent map and cannot surject onto the one-dimensional cusp cotangent. A nonzero rank-zero quotient also needs the specified Hecke-lattice comparison; rank zero alone supplies no differential.
- For p=11 and the two-term cusp expansion f=t+2t², ω_f=(11+22t)dt; at q=23 its cusp value is 11dt, which is nonzero. Using df instead would give (1+4t)dt and omitting the cusp-width factor would give (1+2t)dt. The latter is a unit rescaling here but does not equal the fixed modular differential.
- At q=23 and e=1, 1<22 permits reduction of the free exact cotangent sequence. At q=2 and e=1, 1<1 fails; Mazur's characteristic-two example has a zero reduced cotangent injection and is excluded.

### 6.8 Formal immersion at a cusp, and the torsion image of a rational point

For r ∈ {2, 3, 5, 7, 13}, prime p outside {2, 3, 5, 7, 13} and prime q ≡ ±1 mod p, let A be the specified optimal winding quotient of §6.6, K = ℚ(ζₚ)⁺, and ∞ a cusp defined over K. The Abel–Jacobi map P ↦ [(P) − (∞)], followed by projection to A, extends from the smooth locus of the canonical integral model of the normalized mixed curve X₀(r) ×ₓ₍₁₎ Xₙₛ⁺(p) over the localization of the integers of K at a prime above q to the Néron model of A, and is a formal immersion at ∞ in characteristic q. For the same r and A and any prime p outside {2, 3, 5, 7, 13}, the image in A(K) of each ℚ-rational point of the mixed curve is torsion. ([DarmonMerel](#references), §8, Lemmas 8.2–8.3, pp. 22–23 (author copy); Lemos §3 conclusion, p. 10 (v2), for the extended range).

*Needs:* the specified winding quotient; integral-winding-comparison, optimal-quotient-cotangents and cuspidal-divisor-torsion contracts; the preceding characteristic-q coefficient support and cotangent comparison.

The quotient A is the winding quotient with its integral Hecke and cotangent properties, not an arbitrary rank-zero quotient. Work at a prime of the integers of K above q, on the smooth integral locus, and compare completed local rings at the cusp. The needed coefficient-support/degeneracy lemma is in characteristic q with q∤rp and q>3. For the point-torsion assertion, the cuspidal-divisor-torsion contract makes a common multiple m of the Galois cusp differences zero. Then mσ(P−∞)=m(P−∞), so m·u(P) descends to A(ℚ). If #A(ℚ)=h, then hm·u(P)=0. Both statements use p outside {2,3,5,7,13}; p≥11 and q≥2p−1>13 imply q∤rp and q>3.

### 6.9 Integrality of j away from p

For r ∈ {2, 3, 5, 7, 13}, a prime p outside {2,3,5,7,13}, and E/ℚ with a rational cyclic r-isogeny whose mod-p image lies in the normalizer of a nonsplit Cartan subgroup, j(E) ∈ ℤ[1/p]. ([Lemos](#references), Theorem 1.4, p. 3; §3 conclusion, p. 10 (v2)).

*Needs:* the preceding formal immersion and torsion targets; mixed-modular-curves contract for the j-map and cusps; neron-torsion-specialization contract.

A denominator prime q≠p makes the noncuspidal point meet a cusp. Its residue field forces q≡±1 modulo p. The point image is torsion and specializes to zero; full torsion injection over the unramified local field, with e=1<q−1, kills it. Formal immersion then identifies the point section with the cusp section, a contradiction. Use the smooth integral model, the specified winding quotient and the neron-torsion-specialization contract.

### 6.10 A proper image for p > 37 is of nonsplit Cartan type

State `nonsplit_of_not_surjective`: for E/ℚ without complex multiplication and a prime p > 37, if the representation on E[p] is not surjective onto GL₂(𝔽ₚ), its image lies in the normalizer of a nonsplit Cartan subgroup. ([Lemos](#references), §2, Theorem 2.3, p. 6 (v2)).

*Needs:* noncm-prime-isogeny-degrees, dickson-classification, serre-inertia-exceptional-bound and split-cartan-rational-points contracts; chen-isogeny contract for the split-normalizer identification; EllipticCurves Layer 2 for the cyclotomic determinant.

Exclude the Borel case by the non-CM prime-isogeny list, the exceptional projective cases by Serre’s quantitative inertia argument, and the split Cartan case by Bilu–Parent–Rebolledo. The Weil pairing makes the determinant cyclotomic and surjective. Thus an image containing SL₂ is the whole GL₂; apply the dickson-classification contract to a proper image. The split Cartan input includes the quantitative large-prime estimates and the finite-prime rational-point exclusions.

**Checks.**

- At p=41,m=2 the split-normalizer curve is X₀⁺(41²); the split-cartan-rational-points contract excludes a rational noncuspidal non-CM point. At p=13 this exclusion does not apply.
- The non-CM prime-isogeny list ends at 37; 41 is absent. The exceptional-projective bound applies at 19>17; at 17 its strict hypothesis fails.
- An image containing SL₂ with cyclotomic determinant has order |SL₂(𝔽₄₁)|·40=41·40²·42=2755200, exactly |GL₂(𝔽₄₁)|. Thus a proper image cannot satisfy that alternative.

### 6.11 Integrality of j

State `lemos_integral_j`: for r ∈ {2, 3, 5, 7, 13}, a prime p outside that set, and E/ℚ with a rational cyclic r-isogeny and mod-p image contained in a nonsplit Cartan normalizer, j(E) is an integer. For a non-CM E and p>37, a proper image supplies the containment by the preceding subgroup-classification target. ([Lemos](#references), §2, Proposition 2.1, p. 4; Theorem 2.3, p. 6 (v2)).

*Needs:* denominator exclusion and potential good reduction; subgroup classification only for the proper-image corollary.

The preceding denominator target removes every prime except p; potential good reduction at p removes the last one. Containment suffices without a non-CM hypothesis. The non-CM proper-image corollary additionally uses p>37 and the subgroup-classification target.

**Checks.**

- The curve y²=x³−x has a rational 2-isogeny and j=1728. At p=11, inert in ℚ(i), its CM image lies in a nonsplit normalizer; the conclusion includes this CM curve.
- The curve y²+y=x³−x²−10x−20 has j=−122023936/161051=−2¹²·31³/11⁵, so the conclusion fails and nonsplit containment cannot hold together with the specified small-degree isogeny.
- p=11 and p=17 are allowed by the containment theorem; p=13 is excluded. Only the proper-image corollary requires p>37 and non-CM.


### 6.12 The five genus-zero j-numerators

Define lemosNumerator(r) in ℤ[X] by the five formulas: r=2:(X+16)³; r=3:(X+27)(X+3)³; r=5:(X²+10X+5)³; r=7:(X²+5X+1)³(X²+13X+49); r=13:(X⁴+7X³+20X²+19X+1)³(X²+5X+13). At every other r set it to zero. ([Lemos](#references), §2, j-map table, p.6).

The API supplies the following facts.

- For the five levels the polynomial is exactly the displayed formula.
- For r∈{2,3,5,7,13}, lemosNumerator(r) is monic of degree r+1.
- The five constant terms are 4096,729,125,49,13 respectively.
- Outside {2,3,5,7,13}, lemosNumerator(r)=0.

**Checks.**

- lemosNumerator(2)(0)=4096; replacing (X+16)³ by (X+2)³ would give 8.
- lemosNumerator(7) has degree 8 and constant term 49; cubing the second factor instead keeps degree 8 but changes the constant term to 49³.
- lemosNumerator(13) has degree 14 and constant term 13; the degree-four factor, rather than the degree-two factor, is cubed.
- lemosNumerator(11)=0: the genus-one level does not use a genus-zero formula.

### 6.13 Integral modular parameters

For each monic f∈ℤ[T] of degree at least two and nonzero t∈ℚ, prove that f(t)/t∈ℤ implies t∈ℤ and t divides f(0). Apply this to the five modular numerators and the actual modular coordinate to obtain the finite integral-j characterization in both directions (Lemos §2, pp. 6–7).

**Checks.**

- For f=(T+16)³ and t=−16, f(t)/t=0 and −16 divides 4096. For t=8 the quotient is 1728.
- For f=T+1 and t=1/2, f(t)/t=3 is integral but t is not; degree at least two is necessary. For t=0 the expression has no modular interpretation, regardless of total division conventions.
- At r=13 the positive divisor t=1 gives 4096·27·19; t=−1 gives 576. Both signs are required for the full finite set.

### 6.14 The finite integral j-candidate sets

Define lemosIntegralJ(r) as the finite set of integers lemosNumerator(r)(t)/t for all signed nonzero divisors t of the polynomial’s constant term; use the exact integer quotient, and the empty set outside the five levels. ([Lemos](#references), §2, five finite sets, p.7).

The API supplies the following facts.

- j belongs iff r∈{2,3,5,7,13} and there is a nonzero signed divisor t of the constant term with j equal to the exact quotient f(t)/t.
- For r outside {2,3,5,7,13}, lemosIntegralJ(r) is empty.
- The cardinalities at 2,3,5,7,13 are 25,13,8,6,4.

**Checks.**

- lemosIntegralJ(2) has 25 elements and contains 0 and 1728; t=8 and t=−64 both give 1728, so the 26 signed divisors do not give 26 distinct values.
- lemosIntegralJ(5) has 8 elements and contains 64; keeping only positive divisors would leave four candidates.
- lemosIntegralJ(13)={−64·9·4079³,576,4096·27·19,4096·27·19·991³}.
- lemosIntegralJ(11) is empty; its separate finite j-table is used instead.

### 6.15 Integral j-values at the five genus-zero levels

For r ∈ {2, 3, 5, 7, 13}, use the coordinate t on X₀(r) constructed in §6.0a with j = f_r(t)/t, where f₂ = (t+16)³, f₃ = (t+27)(t+3)³, f₅ = (t²+10t+5)³, f₇ = (t²+5t+1)³(t²+13t+49), f₁₃ = (t⁴+7t³+20t²+19t+1)³(t²+5t+13); prove that a noncuspidal rational point has j ∈ ℤ if and only if t is a nonzero integer dividing f_r(0). ([Lemos](#references), §2, numerator table and integral-parameter proof, pp. 6–7 (v2)).

*Needs:* five-level-j-coordinates contract; the numerator and finite-set definitions; the integral-parameter theorem.

A proof route uses the modular j-map in the specified coordinate; a generic genus-zero parametrization does not determine these polynomials. If t=a/b in lowest terms and f_r(t)/t is integral, monicity forces b=1, and then t divides f_r(0). Evaluate both positive and negative divisors and identify equal j-values. Section 6.0a fixes the coordinate and its j-map; arithmetic evaluation alone does not prove that every value is modular.

**Checks.**

- At r=2, t=8 gives (8+16)³/8=1728 and t=−16 gives 0.
- Replacing t by u=2t sends the same point t=8 to u=16: the actual value is still 1728, whereas (u+16)³/u=2048. A genus-zero coordinate without its j formula does not suffice.
- The level-11 rational table has three entries, including the CM value −2¹⁵=−32768; its non-CM subtable has two. The level-17 and level-37 tables each have two entries.


### 6.16 Surjectivity is a property of the j-invariant

For a prime p ≥ 5, two elliptic curves over ℚ that are quadratic twists of one another have surjective mod-p representations simultaneously. ([Lemos](#references), §2, proof of Theorem 1.1, p. 5 (v2); universal quadratic-twist statement is the derived group argument).

*Needs:* EllipticCurves Layer 5; Mathlib `Matrix.SL2.commutator_eq_top` for perfectness of SL₂(𝔽ₚ) at p≥5.

Write the twist representation as χ⊗ρ for a quadratic character χ. For p≥5 use the group structure of GL₂(𝔽ₚ), including its SL₂ subgroup, to show that multiplication by these scalar signs preserves surjectivity in both directions. Curves with the same non-CM j-invariant are quadratic twists. Neither the CM j-values 0,1728 nor the unused p=3 case is needed for the final theorem.

**Checks.**

- At p=5 take a=2: a≠0 and a²=4≠1, so Matrix.SL2.commutator_eq_top applies. At p=3 both nonzero elements square to 1, so this input does not cover that prime.
- For a surjective ρ and quadratic χ, let H be the image of (ρ,χ) in GL₂(𝔽ₚ)×{±1}. Its projection to GL₂ is onto, so the commutator projects onto SL₂ and lies in ker χ. The twisted image therefore contains SL₂; its determinant remains det ρ because χ²=1, so its determinant image still has p−1 elements and its total order is p(p−1)²(p+1). At p=5 this is 480, the full group order.
- Twisting twice multiplies the representation by χ²=1, so the reverse implication uses the same argument. No claim that arbitrary scalar rescaling preserves determinants is needed.

### 6.17 Surjectivity at the finitely many rational j-values

For every non-CM j in the union of {−11·131³, −11², −17²·101³/2, −17·373³/2¹⁷, −7·137³·2083³, −7·11³} and the five genus-zero integral j-sets, prove that every E/ℚ with j(E)=j has surjective mod-p representation for every prime p>37 (Lemos, §2, proof of Theorem 1.1 and finite j-lists, pp. 5–7). The following exceptional-prime divisibility theorem supplies a route covering all primes; its finite trace identities are separate mathematical targets.

For each j≠0,1728 fix k=j/(1728−j) and the rational model E_j:y²=x³+3kx+2k. Its discriminant is −1728k²(k+1), nonzero since j≠0,1728, and its j-invariant is 1728k/(k+1)=j. Write k=a/b in lowest terms with b>0 and set u=b; scale to get the integral model y²=x³+3ku⁴x+2ku⁶; the isomorphism from the rational model to this integral model is (x,y)↦(u²x,u³y), and its discriminant is multiplied by u¹². Let S be a finite set containing 2 and all primes dividing this integral model’s discriminant. Let D_S be the nontrivial square classes represented by signed squarefree products of primes in S. These are all quadratic characters unramified outside S, including the imaginary characters and the wild possibilities at 2.

Prove the normalizer-character ramification theorem: if p>37, p∉S and E_j[p] lies in a nonsplit Cartan normalizer, the quotient character ε:G_ℚ→{±1} is nontrivial and unramified outside S. At a prime q∉S∪{p}, unramifiedness follows from good reduction; at p, good supersingular inertia lies in the Cartan, while good ordinary inertia is incompatible with this normalizer for p>3. Complex conjugation is nonscalar of eigenvalues 1,−1 and hence lies outside the nonsplit Cartan, proving ε is nontrivial. This uses the local torsion description of EllipticCurves Layers 2 and 4 and the normalizer multiplication law, independently of the final surjectivity theorem.

Prove exceptional-prime-divisibility: for any non-CM integral model E_j above, for each d∈D_S let Q_d be a nonempty finite set of primes q∉S with χ_d(q)=−1 and a_q(E_j)≠0. Set g_d to the gcd of the positive integers |q·a_q(E_j)| for q∈Q_d and define B_j as the product of the primes in S multiplied by all the g_d. Every exceptional prime p>37 divides the positive integer B_j. Indeed §6.10 puts its image in a nonsplit normalizer, the ramification theorem identifies ε with one of these χ_d, and every element outside a nonsplit Cartan has trace zero. Thus p divides a_q when q≠p; the factor q handles q=p. If p∈S it already divides the first product. Taking gcds retains all these divisibilities. This is a derived finite-group/Frobenius argument; Lemos’s tables identify the finite collection to which it is applied.

For every non-CM j in the stated union, prove the finite trace identities supplying S and Q_d and factor the resulting positive B_j. For each prime p>37 dividing B_j, prove a further good-prime trace identity at some q≠p with a_q≠0 modulo p and a_q²−4q a nonzero square modulo p. Such a Frobenius has two distinct base-field eigenvalues and nonzero trace: it lies neither in a nonsplit Cartan nor in its other normalizer coset, excluding the only proper-image alternative of §6.10. The data consist of the displayed rational model and its integral scaling, the discriminant factorization, every square class d, the good primes in Q_d, their quadratic-character values and exact traces q+1−#E_j(𝔽_q), the gcd factorizations, and a nonzero square root of a_q²−4q for each remaining p. Prove each finite identity on its curve. This includes primes dividing the chosen model’s discriminant, which may exceed 37. The divisibility theorem and these final exclusions cover every p>37; the size of the sampled q’s is irrelevant to completeness. Transport to every curve with the same j by §6.16. No image procedure or database lookup is part of the target.

*Needs:* §§6.0b and 6.12–6.16 for the complete finite j-sets and twisting; §6.10 for proper-image classification; EllipticCurves Layers 2 and 4 for inertia and good-prime traces; finite-field arithmetic and quadratic square classes. The ramification, divisibility and finite trace identities are owned targets of this subsection.

**Checks.**

- j=1728 occurs in the level-2 set, but its CM curve y²=x³−x has nonsplit-normalizer image at p=43≡3 mod 4; non-CM is essential. The chosen model excludes both 0 and 1728 before dividing.
- At j=576, k=1/2 and u=2 give y²=x³+24x+64, with discriminant −2654208=−2¹⁵·3⁴ and j=576. For j=0 the displayed discriminant would be 0, so that value cannot use this model.
- In 𝔽₅²=𝔽₂₅, write a+b√2 and conjugation z↦z⁵. The matrix of z↦(a+b√2)z⁵ is [[a,−2b],[b,−a]], with trace 0 and determinant 2b²−a²; for a=b=1 it is [[1,3],[1,4]] with trace 0 and determinant 1. Multiplication alone has trace 2a, so being outside the Cartan is needed.
- On the j=576 model, use d=−1,2,−2,3,−3,6,−6 and respectively Q_d={7,11,19},{5,11,13},{5,7,13},{5,7,17},{5,11,17},{7,11,13},{13,17,19}. Every character value is −1; the traces at 5,7,11,13,17,19 are −2,−4,−3,−2,5,−1. The seven gcds are 1,1,2,1,1,1,1, giving B_j=6·2=12 and no exceptional p>37. Using a zero trace alone would give gcd(0)=0 and no bound.

### 6.18 Lemos's theorem

If E/ℚ has no complex multiplication over an algebraic closure and has a rational cyclic isogeny of degree greater than 1, then the representation of the absolute Galois group of ℚ on E[p] is surjective onto GL₂(𝔽ₚ) for every prime p > 37. ([Lemos](#references), Theorem 1.1, p. 2; §2 proof, pp. 5–7 (v2)).

*Needs:* proper-image classification, integral-j and finite-j image theorems; cyclic-isogeny-degrees and noncm-prime-isogeny-degrees contracts.

A nontrivial cyclic isogeny yields a rational prime-degree isogeny. The non-CM degree list reduces r to {2,3,5,7,11,13,17,37}. For r=11,17,37 use the finite rational j-table. For r=2,3,5,7,13 a proper image forces integral j, reducing to the finite signed-divisor table. The uniform image bounds and quadratic-twist invariance then contradict the assumed failure for any p>37.

State `lemos_surjectivity` on the pinned torsion Galois action. Its target is the full additive automorphism group of geometric p-torsion, canonically the full linear automorphism group since additive maps of exponent-p groups are 𝔽ₚ-linear. The rank-two torsion theorem identifies this group with GL₂(𝔽ₚ) in any basis; no basis is part of the headline signature.

### Examples

The integral-j target includes p=11 and p=17 without any non-CM hypothesis under nonsplit containment. The proper-image-to-containment implication and the final surjectivity target retain p>37 and geometric non-CM. The final theorem excludes degree 1, CM j-values, and prime p=37: none is covered by a generalization of its displayed inequalities.

### Dependencies

Layer 5; EllipticCurves Layers 2, 4 and 5; ModularForms Layers 3, 6 and 8; ModularSymbolsPadicLFunctions §§0.6–0.8 and 1.1; EulerSystemsAndKolyvaginSystems §§4.3, 4.17(c) and 4.20; SchemeKTheoryOperations §§2.2–2.4, 3.6 and 6.1; K2SymbolsBrauer §§6.4, 6.7–6.9 and 8.1–8.3; K2SymbolsBrauerPartII §§1.1 and 5.5; AlgebraicModularFormsAndSerreWeights §§R15.5A.1–R15.5A.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3; AutomorphicGaloisRepresentations §7.5; ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.7, 3.4–3.5, 4.4 and 5.9; AbelianSchemesAndArithmeticModuli Layers A2, A5 and A6; EisensteinIdealAndRationalTorsion §7.9; HeightsRationalPointsAndObstructions §§1.7 and 1.18; SelmerIwasawaCohomology §2.12a; Mathlib Matrix.SL2.commutator_eq_top; mixed-modular-curves, mixed-modular-jacobians, chen-isogeny, integral-winding-comparison, modular-rank-zero, cuspidal-divisor-torsion, optimal-quotient-cotangents, noncm-prime-isogeny-degrees, dickson-classification, serre-inertia-exceptional-bound, quantitative-elliptic-isogeny, split-cartan-rational-points, five-level-j-coordinates, rational-isogeny-j-tables and neron-torsion-specialization contracts. The split-Cartan exclusion is the mathematical rational-point theorem of BPR Theorem 1.1, not a procedure for computing points. The final finite-j step requires a bound on every exceptional prime, as a theorem for each non-CM j in the lists; finite samples of Frobenius traces do not supply it.

## Downstream consumers

ErdosProgressionPowers, “Required effective modular comparisons” EC.0–EC.5 and Layer 1, uses removed-prime bounds, exact-conductor realization with full rational two-torsion and uniform irreducibility. Its generic comparison contract is named EllipticModularityEffectiveComparisons; Layers 1–6 provide those comparisons, including the stronger square-root thresholds. Rational-isogeny applications use the surjectivity theorem for every prime above 37. The sharp thresholds strengthen the numerical-majorant versions: at level 11 the full-two threshold is 13+4√3 instead of 169.

Section 6.0e supplies the common normalized theta/Siegel units, the ordered symbols with their transfer and ordered-cup sign conventions, the weight-two finite-level classes with their raw and pushforward reciprocity, and the CM induced-character/elliptic-unit adapter. The export contract to PadicFamilies §§4.0.1–4.0.3 is that that roadmap imports these objects instead of constructing them again, and proves a comparison theorem identifying its k=2, r=r′=1 moment with the class here under the same levels, smoothing integers, units, transfers, norm maps and period choices, with coefficients W_(M,N)(1), and W_f(1) after eigenform projection, retaining the cohomological dual; by the dictionary of §6.0e, Kato's positive Chern-character map gives this identification with no extra sign. Higher-weight moments, family interpolation and broader cyclotomic bounds are extensions in PadicFamilies; they do not supply an input here, and the unconditional modular abelian rank-zero application stays in §6.0e. ModularIwasawaMainConjectures uses the geometric classes and their reciprocity through PadicFamilies §4.0, so under this contract at weight two these are the classes constructed in §6.0e.

## References

Page numbers below refer to the displayed editions. The theorem, section and page locators at each target specify the portion supplying its statement or argument.

- **BS:** Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), *Annals of Mathematics* 191 (2020), 355–392. The effective comparison inputs are in §2, pp. 358–360; the two-torsion applications are in §3, pp. 361–364.
- **Kraus:** Alain Kraus, [Majorations effectives pour l'équation de Fermat généralisée](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FEF2CCCEC964C8D0AAD3EE8F40875A4D/S0008414X00034258a.pdf/majorations-effectives-pour-l-equation-de-fermat-generalisee.pdf), *Canadian Journal of Mathematics* 49 (1997), 1139–1161. Use §3.1–3.3, pp. 1142–1146, and Appendix II, §8, pp. 1158–1160.
- **Martin:** Greg Martin, [Dimensions of the spaces of cusp forms and newforms on Γ₀(N) and Γ₁(N)](https://arxiv.org/pdf/math/0306128v1), arXiv math/0306128v1 (6 June 2003). Use Theorems 1–2 and Definitions 1A–1F, pp. 2–3, and §4, pp. 14–16. The journal version is *Journal of Number Theory* 112 (2005), 298–331; the locators here use the preprint pagination.
- **Mazur:** Barry Mazur, with an appendix by Dorian Goldfeld, [Rational isogenies of prime degree](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), *Inventiones mathematicae* 44 (1978), 129–162. Use Theorem 1 and the introduction table, pp. 129–130, and §7, pp. 153–155. The composite-degree classification is the separate Mazur–Kenku import identified in Layer 5.
- **Lemos:** Pedro Lemos, [Serre's uniformity conjecture for elliptic curves with rational cyclic isogenies](https://arxiv.org/pdf/1702.01985v2), arXiv:1702.01985v2 (8 March 2017). The locators use this version's pp. 1–11: Theorems 1.1–1.4, §2 and §3. The journal version is *Transactions of the American Mathematical Society* 371 (2019), 137–146.
- **DarmonMerel:** Henri Darmon and Loïc Merel, [Winding quotients and some variants of Fermat's Last Theorem](https://perso.imj-prg.fr/loic-merel/wp-content/uploads/merel-pub/winding.pdf), author copy dated 5 January 2001. Use §§6–8, especially Propositions 7.1–7.2, pp. 18–21, and Lemmas 8.2–8.3, pp. 22–23. The journal version is *Journal für die reine und angewandte Mathematik* 490 (1997), 81–100; the locators here use the author-copy pagination. The original r=2,3 argument is combined with the explicit five-level extension in Lemos §3.

- **Kenku:** M. A. Kenku, *On the number of Q-isomorphism classes of elliptic curves in each Q-isogeny class*, Journal of Number Theory 15 (1982), 199–202, [DOI](https://doi.org/10.1016/0022-314X(82)90025-7). Use pp. 199–201 for composite cyclic degrees. The composite-degree statement is cited by its published locator.
- **BPR:** Yuri Bilu, Pierre Parent and Marusia Rebolledo, [Rational points on X₀⁺(pʳ)](https://arxiv.org/abs/1104.4641), Theorem 1.1, pp. 1–2, preprint numbering: all rational points are cusps or CM for p≥11, p≠13, r>1.

- **Kato:** Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0/), *Astérisque* 295 (2004), 117–290. Use §§1–2, 8–12, Theorem 14.2(2), and §§15.12–15.17, with the printed pagination.
- **Gaudron–Rémond:** Éric Gaudron and Gaël Rémond, [Théorème des périodes et degrés minimaux d’isogénies](https://arxiv.org/abs/1105.1230v1), arXiv:1105.1230v1 (6 May 2011). Use Theorem 1.4, p. 4; §§3 and 6, especially Proposition 6.9, pp. 24–25; §§7.1–7.5, pp. 26–32. The journal version is *Commentarii Mathematici Helvetici* 89 (2014), 343–403; the locators here use the preprint.
- **Chen:** Imin Chen, [On relations between Jacobians of certain modular curves](https://arxiv.org/abs/math/9809209v1), arXiv:math/9809209v1 (3 September 1998), Theorem 2 and subgroup conventions, pp. 1–2.
- **de Smit–Edixhoven:** Bart de Smit and Bas Edixhoven, [Sur un résultat d’Imin Chen](https://pub.math.leidenuniv.nl/~smitbde/papers/2000-de_Smit_Edixhoven.pdf), author copy dated 9 February 2000, Remark 3, p. 4.
