# Roadmap: complex multiplication and explicit reciprocity, part ii

**Summary.** Extend ComplexMultiplicationAndExplicitReciprocity from polarized CM types, lattices and reciprocity to arithmetic heights. Construct the total reflex determinant and orthogonal arithmetic intersection route to the averaged Colmez formula, and a second route through different-torsion graph isogenies and quaternionic adjunction. Use their common average to bound individual CM heights, prove primitive and arbitrary-center-order Galois orbit bounds, and obtain polynomial heights of CM lifts and finiteness at bounded moduli degree. The individual Colmez conjecture is defined, without being assumed or asserted as an endpoint.

## Scope and ownership

ComplexMultiplicationAndExplicitReciprocity stops at reflex pairs and orders (§§0.1–0.2), polarized CM lattices and marked reciprocity (§§2.1–2.3), and CM characters and reduction (Layers 4–5). This Part II owns CM height linearity, total reflex integral realizations, the CM-specific determinant and conductor comparisons, both averaged-height proofs, their quantitative CM consequences, and the center order attached to a polarized CM point. Its relative class-number estimate covers arbitrary CM fields; the abelian character-product results of CyclotomicClassGroupsAndStickelberger §3.4 have a different hypothesis and conclusion.

The native CM field and conjugation, class number, regulator ratio, Minkowski representatives and coarse ideal count are already in the library, as are complex abelian varieties, their endomorphism rings, isogenies and the rank of a finite flat morphism. Their exact declarations are in the supplier contracts. The field-order index-square discriminant identity and the squared-norm successive minima with simultaneous attainment are also in the library; GlobalNumberFields Layer 11 owns the finite étale order extension, and IntegralLattices milestone 2F owns the Minkowski product estimate. The class-group norm cokernel bound is stated by IntegralIwasawaTheory §3.4, in the case n=0. The varying-base quadratic Hecke estimates and near-linear ideal count are stated by AnalyticNumberTheoryPartI §§2.31f, 2.44–2.46 and 3.27. The general ramified component determinant comparison belongs to ArakelovGeometryAndAbelianHeights §4.7. These are consumed here; the CM decomposition, different-graph application and exponent argument are the kept specializations.

ArakelovGeometryAndAbelianHeights §§1.11, 2.7, 3.4–3.5, 4.6–4.8 and 6.5 own weighted degrees, metric adapters, stable heights, component lines and the uniform lower bound. FaltingsFinitenessAndIsogenyTheoremsPartII QI.5 owns geometric isogeny estimates. AbelianSchemesAndArithmeticModuli owns abelian schemes, polarizations, Tate and de Rham realizations and the CM isotypic decomposition. ShimuraVarieties owns canonical CM stacks and reciprocity; HilbertModularVarietiesAndShimuraCurves owns quaternionic integral models and its saturated integral Kodaira–Spencer line. Only the comparison to the actual CM Hodge determinants is built here. Generic admissible intersections and analytic/arithmetic kernels belong to GrossZagierAndArithmeticHeights, quantitative hermitian/Siegel reduction to GeometryOfNumbersAndQuadraticArithmetic, successive minima and the basis from the minima to SuccessiveMinima Layer 1, IntegralLattices milestone 2F and HeightsAndUnits §2.1, and the absolute scalar height, minimal-polynomial comparison and bounded-degree Northcott theorem to DiophantineApproximationAndTranscendence §§0.2–0.3. IntegralLattices and OrthogonalSpinGroups own lattice duality and orthogonal group algebra. The orthogonal special-divisor intersection and support theorems in §§4.2–4.2c, 4.3 and 4.5 are included here: the underlying lattice and group theory are supplied by IntegralLattices and OrthogonalSpinGroups.

The arithmetic adjunction identity i₀(P,P)/e=−h_L(P_U) is stated by GrossZagierAndArithmeticHeights §7.78. Its §0a.4 supplies the quaternionic CM point and its Artin action; §7.2 here defines only its normalized Hodge height. Its §§6.56, 7.15, 7.65–7.66 and 7.77 supply the analytic derivative, nonvanishing theta input, full height-series decomposition and local comparison with the noncuspidal terms retained. PELModuli §§M6.1, M6.8 and M6.10 supply bounded polarized descent with marked 3-torsion and finite level-forgetting; §11.1 applies that field to the chosen ideal quotient and its transported polarization. ShimuraVarieties §4.2 supplies the AGHMP quotient reflex norm; §1.1 develops its character lattice and scalar-kernel distinction.

The endpoints concern distinct polarized coarse CM points. André–Oort, o-minimal counting, functional transcendence and Jacobian isogeny counts are outside this scope. No good-prime restriction is placed on a global theorem.

## Conventions

Fix a CM field E/F with maximal order O_E, maximal real subfield F and [E:ℚ]=2g, g≥1. Write d=g in the total reflex layers. Use Mathlib's CM involution. D_E and D_F are positive absolute discriminants; d_E/F is the absolute norm of the relative different, so D_E=D_F²d_E/F. A CM algebra can be a nonempty product of fields; the empty direct-sum height is the scalar 0 convention, and is not treated as a CM field. All 2^g CM types occur with multiplicity one, including imprimitive types. The overlap functions are locally constant on the absolute Galois group; all character sums factor through finite Galois quotients.

Write ℓ(s)=L_f′(s,χ_E/F)/L_f(s,χ_E/F) for the finite primitive quadratic Hecke function. Values divided by L_f are used only after regularity and nonvanishing at 0 or 1. Arithmetic Artin sends a uniformizer to arithmetic Frobenius; the Lubin–Tate unit action is inverse. ShimuraVarieties §4.1 uses the geometric map art_F(s)=rec_F(s)⁻¹; convert every supplied geometric reciprocity formula by s↦s⁻¹ before use, as in GrossZagierAndArithmeticHeights §0a.4. Complex conjugation on E is not a single local decomposition-group element that exchanges all p-adic embedding pairs. Characteristic zero, separability, full integral lattices and positive field degrees are standing hypotheses; residue characteristics 2 and 3 are included. Linear and representation spaces use characteristic-zero rational or complex coefficients, as specified, in a fixed universe; field/embedding constructions transport through isomorphisms and universe changes.

The symbol h_Falt means the unscaled squared volume metric, with squared norm |∫α∧ᾱ|. The supplier's h_Fal has squared norm 2^(−g)|∫α∧ᾱ|. Thus h_Falt=h_Fal−(g/2)log 2 and h_YZ=h_Falt+(g/2)log(2π)=h_Fal+(g/2)log π. Component heights use h_YZ. These are logarithmic heights. The target formula is

`mean_Phi h_Falt(E,Phi) = -ell(0)/2 - log(D_E/D_F)/4 - g*log(2*pi)/2`.

For a CM stack Y over O_E (the total reflex stack Y₀ of Layer 3 and the CM cycle Y of Layer 4), deg_C Y=Σ_(y∈Y(ℂ))1/|Aut(y)| is the weighted count of complex points of Y viewed as an E-stack through the fixed embedding of E, so that Y×_ℤℂ has 2d·deg_C Y weighted points ([A], §6.3, pp. 472–473; A lines 3403–3414). The arithmetic degree deĝ is taken over Spec O_E with stabilizer weights: finite places of E, and an archimedean term summed over all weighted complex points of Y×_ℤℂ, that is over all 2d embeddings of E. Every normalized degree deĝ(·)/deg_C Y uses this pair. Component heights divide by [K:ℚ]; quaternionic heights divide by [F(P):F]. All finite level or field changes act on numerator and denominator together. The constant lower bound b_g is a real number and can be negative. Trace-one top de Rham periods, rather than arbitrary integral generators, fix the determinant metric.

For x∈A_g, the center order R_x is Z(End(A_x)), with one CM field per distinct simple isogeny factor and one copy for each repeated isotypic block. Nonisogenous factors with abstractly isomorphic CM fields remain separate. Put D_x=|disc R_x| and J_x=[O_x:R_x]. Absolute polarized coarse orbits, marked relative orbits and fields defining objects are distinct. H_abs is absolute multiplicative Weil height; h₀(Z)=max(max|z_ij|,1/det Im Z) is a separate analytic quantity.

**Checks.**

- On the square elliptic torus ℂ/(ℤ+iℤ), |∫dz∧d z̄|=2. The three squared metrics are 2, 1 and 1/π; their height shifts are −log 2/2 and log(2π)/2 as above. Applying the latter twice gives an erroneous extra log(2π)/2.
- For arithmetic Artin over ℚ₅, the unit 2 acts on Lubin–Tate 5-torsion by 2⁻¹=3 modulo 5, whereas the supplied geometric Artin action gives 2. Substituting 2⁻¹=3 into the geometric formula recovers the arithmetic action by 3. A uniformizer acts trivially on that torsion field.
- A degree-two base change takes normalized degree a/d to 2a/(2d)=a/d; with [F:ℚ]=2, replacing [F(P):F] by [F(P):ℚ] changes a/d to a/(2d).
- For d=1 and E=ℚ(i), the total reflex stack Y₀ has one complex point as an E-stack, with automorphism group O_E×=μ₄, so deg_C Y₀=1/4, while Y₀×_ℤℂ has weighted count 2·(1/4)=1/2. A CM elliptic curve over O_E of Faltings height h has unweighted arithmetic degree [E:ℚ]h=2h over Spec O_E, so the weighted degree is deĝ(Ω♯)=2h/4 and deĝ(Ω♯)/deg_C Y₀=2h=Σ_Φ h_Falt(E,Φ), as §3.8 states; dividing instead by the weighted count of Y₀×_ℤℂ gives h, half the stated value.
- For E=ℚ(i), D_E=4, D_F=1, d_E/F=4. For an elliptic order of conductor 2 the center-order discriminant is 16, while its maximal-field discriminant stays 4.

## Exact supplier contracts

### From Mathlib

Use `NumberField.IsCMField` in `Mathlib/NumberTheory/NumberField/CMField.lean` (line 69): it asserts total complexity and quadraticity over `NumberField.maximalRealSubfield`, with a field and characteristic zero. It does not assert finite degree; carry `NumberField` as well. Its `NumberField.IsCMField.complexConj` (line 141) additionally uses integrality over ℚ; number fields supply it. `NumberField.IsCMField.complexConj_apply_apply` (line 163) fixes the involution. `NumberField.IsCMField.indexRealUnits_eq_one_or_two` (line 372) and `NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` (line 438) give R_E/R_F=2^(g−1)/Q_E, Q_E∈{1,2}. In degree six the ratio is 2 or 4, not 1.

Use `NumberField.classNumber`, `NumberField.classNumber_pos` and `NumberField.exists_ideal_in_class_of_norm_le` in `Mathlib/NumberTheory/NumberField/ClassNumber.lean` (lines 64, 69 and 77); the class number is that of the maximal order and the representative ideal is nonzero. `NumberField.discr` supplies its integral field discriminant. These are the native objects in `relative_class_number_growth`.

Use `AlgebraicGeometry.Scheme.Hom.finrank` in `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` (line 88), the rank of a morphism at a point of its target, computed on an affine neighbourhood as the local rank of the algebra the morphism defines. For a finite flat morphism it is at least 1 everywhere exactly when the morphism is surjective (`AlgebraicGeometry.Scheme.Hom.one_le_finrank_iff_surjective`, line 201), and it is locally constant when the morphism is also locally of finite presentation (`AlgebraicGeometry.Scheme.Hom.isLocallyConstant_finrank`, line 231). It is the degree of an isogeny in `distant_cm_isogenies`; the library does not prove that isogenies are flat, and the theorem only evaluates it on isogenies. `NumberField.RingOfIntegers` supplies the maximal order O_E.

### From Tau Ceti

`NumberField.card_ideal_absNorm_le`, `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean`, line 399, gives a finite count bounded by X²2^[E:ℚ] for X≥1. `NumberField.abs_discr_le_of_basis_isIntegral`, `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean`, line 61, bounds the field discriminant by the trace discriminant of an integral rational basis. The near-linear count comes from the analytic contract below.

`TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`, line 95) is a proper geometrically integral group scheme over a field; `TauCeti.AlgebraicGeometry.AbelianVariety.dim` (line 118) is the Krull dimension of the underlying scheme and `TauCeti.AlgebraicGeometry.AbelianVariety.zeroPoint` (line 171) is the identity point. `TauCeti.AlgebraicGeometry.AbelianVariety.End` (`TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean`, line 83) is the endomorphism ring, with `TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom` (line 92) recovering the endomorphism. `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` (`TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean`, line 61) says that the underlying scheme morphism `TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom` (`TauCeti/AlgebraicGeometry/AbelianVariety/Hom/Basic.lean`, line 133) is finite and surjective; it does not record a degree. These are the native carriers of `distant_cm_isogenies`.

Use `TauCeti.GlobalNumberFields.NumberFieldOrder.index`, `TauCeti.GlobalNumberFields.NumberFieldOrder.discr` and `TauCeti.GlobalNumberFields.NumberFieldOrder.discr_eq_index_sq_mul` in `TauCeti/NumberTheory/NumberField/Global/Orders/Discriminant.lean` (lines 68, 77 and 107). For a full order O in a number field K, these give disc O=[O_K:O]² disc K. The finite-product extension below must also handle orders that couple the factors.

Use `TauCeti.IntegralLattice.successiveMinimum`, `TauCeti.IntegralLattice.successiveMinimum_le_iff`, `TauCeti.IntegralLattice.IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum` and `TauCeti.IntegralLattice.IsPosDef.successiveMinimum_pos` in `TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean` (lines 45, 82, 143 and 212). Their carrier is the full integral symmetric bilinear lattice `TauCeti.IntegralLattice`; positive semidefiniteness is required for simultaneous equality with the squared norms, and positive definiteness for positivity. The attaining vectors are independent, without a basis assertion. The real-minimum comparison, Minkowski product estimate and bounded basis are the separate supplier contracts below.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

Consume §§0.1–0.2 for inverse-coset reflex pairs, integral reflex orders and trace fields, and §§2.1–2.3 for arbitrary-dimensional polarized classification, ideal actions, class maps, unit obstructions and relative marked moduli orbits. Use its integral-versus-rational distinction, not an assumption that every isogeny preserves a chosen principal polarization. ShimuraVarieties §5.1 supplies the underlying embedding partitions and primitive induction.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume §§A4.1, A4.3, A4.CR.7.2, A5.1–A5.7, A6.22, A6.25 and A6.37–A6.38 for Tate/de Rham/crystalline realizations, integral Riemann forms, polarized equivalence, finite isogeny kernels, relative Hom extension over locally noetherian normal bases, simple-factor centers and the Hodge line. Consume §A6.1 for the degree of a homomorphism, defined there as the same Mathlib rank at the zero point that `distant_cm_isogenies` uses, and §§A6.4–A6.5 and A6.8 for simplicity, Poincaré reducibility and semisimplicity of End⁰. Covariant Tate lattices are dual to H¹. An integral polarization need not be principal. Extension of homomorphisms is §A6.25, separate from realizing the family.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

Consume §§1.3, 1.11, 1.13–1.14, 2.1, 2.7, 2.10, 3.4–3.5, 4.6–4.8 and 6.5. Sections 1.13–1.14 compare metrized projective heights with absolute sup heights and retain bounded absolute degree in Northcott. Their component line takes torsion-free quotients before determinants; §4.7's raw embedding-quotient formula assumes local freeness. The unscaled-to-Yuan–Zhang shift is +(g/2)log(2π); this adapter is applied exactly once. The polynomial Hodge comparison in §4.8 is used factorwise after unramified decomposition, with rank-one freeness established by the CM realization, rather than global monogenicity.

What ArakelovGeometryAndAbelianHeights must provide (gap:ramified-component-determinants): Extend §4.7 to relative/image component determinants over every mixed-characteristic DVR with ramified coefficient field, proving Cartier-dual length cancellation for a self-dual kernel with conjugation-invariant action and identifying its metrized height with §4.6.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

Consume §§2.31d–2.31f, 2.32, 2.44–2.46 and 3.27: uniform fixed-degree residue bounds and Brauer–Siegel, primitive odd functional equations, regularized Hecke logarithmic derivatives and the degree-only ideal estimate. In particular |ℓ(1)|≤C_g,ε D_E^ε for every ε>0, uniformly as F varies; C_g,ε can be ineffective. Its conductor is D_E/D_F. The ideal count is at most C_n,ε X^(1+ε) for X≥1. These inputs include ramified Euler factors. General Artin holomorphy is no hypothesis.

### From TauCetiRoadmap.Chebotarev

Consume Layer 9, abelian Chebotarev: for the nonidentity element of Gal(E/F)≅C₂, unramified inert primes have Dirichlet density 1/2. Removing any finite set preserves that density and leaves infinitely many primes, supplying the auxiliary inert set in §7.1.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume Layer AL.1, “CM quadratic completion and orbital comparisons”, for the precise quadratic finite/completed gamma adapter. Finite-image Artin local factors and induction use AdelicAlgebraicGroups §AA.2.4 through AnalyticNumberTheoryPartI §2.2 and its supplier contract. Odd-character regularity/nonvanishing at zero follows from that completed equation and the regularized endpoint interface. The trivial character uses ζ(0)=−1/2 and ζ′(0)/ζ(0)=log(2π), not an odd-character formula.

### From TauCetiRoadmap.AutomorphicBundles

Consume §§B1.1–B1.3, Layer B2 and §B4.10 for defining tensors, absolute Hodge tensor realizations with their Betti–de Rham and Betti–étale comparisons and descent to the reflex field, associated filtered bundles and the classical Hodge weight. These sections make no crystalline or B_dR assertion (§B2.7 excludes them explicitly); the p-adic comparison of the tensors is the contract below. The integral CM torsor on the locus with reductive unramified torus model is §2.3 here. Rational tensor descent does not imply an integral torsor at an arbitrary ramified prime.

What AutomorphicBundles must provide (gap:absolute-hodge-padic-comparison): For an abelian variety A over a number field K, every finite place v of K and every rational absolute Hodge tensor on A in a tensor construction of H¹, its dual and Tate twists whose de Rham and p-adic étale realizations are defined over K, prove that the B_dR comparison of A over K_v carries the étale realization to the algebraic de Rham realization, compatibly with tensor operations, Tate twists and finite base extension, and, where A has good reduction at v, with the B_cris comparison.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume §§R07.2.15–R07.2.16, R07.2.20 and Layer R07.4 for slope classification, Cartier duality, covariant/cohomological conversion and the all-prime integral Breuil–Kisin functor. Frobenius-pullback specializations are φ*M/u and φ*M/E_y(u). Geometric fibers use W(k̄_y). The CM multipliers and their equality modulo the relative different are proved in §6.2 here.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

Consume LT.2, “Lubin–Tate character” and “Comparison with local reciprocity”, for the actual rank-one character χ_π(Art(π^r u))=u⁻¹ and its finite torsion restrictions. The ℚ₅ witness gives 3 on 5-torsion for u=2. No CM-field conjugation is identified with a nonexistent simultaneous local embedding permutation.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

Consume §§5.1–5.2 for Néron–Ogg–Shafarevich, good reduction and isogeny compatibility, and §1.5 for extension and uniqueness of homomorphisms. Inertia triviality is proved on the CM model before applying this criterion.

### From TauCetiRoadmap.ReductiveGroups and TauCetiRoadmap.ReductiveGroupsPartII

Consume ReductiveGroups Layer 4 for tori, character lattices, quotient tori and exactness, and ReductiveGroupsPartII §RG2.0a.2 for Weil restriction and norm maps. The CM character annihilator and scalar μ_g kernel are §1.1 here; the distinguished cocharacter and its quotient reflex norm are consumed from ShimuraVarieties §4.2.

### From TauCetiRoadmap.ShimuraData and TauCetiRoadmap.ShimuraVarieties

Consume ShimuraData Layers 1 and 3 for polarized rational Hodge data, Mumford–Tate groups and their Hodge cocharacters. Consume ShimuraVarieties §§4.1–4.6, 5.1–5.11, 6.1–6.2 and 8.1–8.6 for reciprocity in its geometric normalization, converted by s↦s⁻¹, finite étale generic CM stacks, actual CM varieties, potential good reduction, Hodge-type canonical models and the canonical Hecke tower.

What ShimuraVarieties must provide (gap:quantitative-cm-torus-orbit): For a dimension-g CM Mumford–Tate torus T in GSp, maximal compact T(Ẑ), K=T(A_f)∩GSp(Ẑ), I=[T(Ẑ):K], bad set S={p:p divides [O_x:R_x]} and normal-closure reflex image r_T:Cl(L)→T(ℚ)\T(A_f)/T(Ẑ), prove after a dimension-bounded rigid level change that the absolute polarized orbit is at least c_g B_g^(#S) I |im r_T| with c_g>0 and 0<B_g≤1, compatibly with all primitive-factor projections.

### From TauCetiRoadmap.PELModuli

Consume §§M2.1–M2.3, M3.9, M5, M6.1–M6.2 and M6.8–M6.10 for polarized rigidity, Siegel moduli, stacks, Hodge lines, bounded polarized descent and finite level-forgetting. Only polarized full level removes the positive-rank unit automorphisms of an unpolarized CM variety.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII

Consume QI.5, “Geometric isogeny estimate”: for geometrically isogenous dimension-g A,B over a common number field k, there is a geometric isogeny of degree at most C_g max(1,h_Fal(A),[k:ℚ])^κ_g with C_g,κ_g>0 depending only on g. A dimension-only height shift changes C_g and leaves κ_g available for §11.2. The map need not be k-defined or polarized.

### From TauCetiRoadmap.ClassFieldTheory

Consume Layer 13 for Hilbert and narrow Hilbert class fields and their Artin identifications. The narrow quadratic sign input is required in the following exact form.

What ClassFieldTheory must provide (gap:narrow-cm-norm-different): For quadratic CM E/F, identify Nm Cl(E) in Cl⁺(F) as all of Cl⁺(F) if some finite place ramifies and as ker χ_E/F otherwise, and in the latter case prove g even and χ_E/F(d_F)=(-1)^(g/2).

### From TauCetiRoadmap.IntegralIwasawaTheory

Consume §3.4, `classNorm_cokernel`, at n=0: for every finite number-field extension L/K, the norm cokernel on full ideal class groups is Gal((L∩H(K))/K), so its order is at most [L:K]. For a following homomorphism r, this gives |im(r∘Nm_L/K)|≥|im r|/[L:K].

### From TauCetiRoadmap.GlobalNumberFields

Consume Layer 11 for full orders, multiplier rings and the distinction between proper and invertible ideals; use the pinned field-order discriminant declarations in the Tau Ceti contract for its field case.

What GlobalNumberFields must provide (gap:etale-order-discriminant): Extend the trace-discriminant index-square formula to a full ℤ-order R in a finite product ∏K_i, giving |disc R|=[∏O_Ki:R]²∏|disc K_i| with no assumption that R decomposes as a product.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §1.2 for the comparison 1.2.14 of the real successive minima of a positive definite integral lattice in its real model with its squared-norm minima (λ_i²=successive squared minimum), and §§2.2, 2.7–2.9 for integral quadratic and hermitian lattices and local comparisons. The CM order-sensitive rescaling argument and its algebraic-coordinate conversion are §13.2–§13.4 here.

### From TauCetiRoadmap.SuccessiveMinima, TauCetiRoadmap.IntegralLattices and TauCetiRoadmap.HeightsAndUnits

Consume SuccessiveMinima Layer 1 for the real successive minima of a discrete full lattice with respect to a symmetric convex body and their simultaneous attainment by independent lattice vectors (its 1.5); IntegralLattices milestone 2F for the squared-norm successive minima of a positive definite integral lattice of rank n and Minkowski's second theorem ∏_i λ_i≤γ_n^n det L; and HeightsAndUnits §2.1, minima form, for a ℤ-basis b with b_i∈max(1,(i+1)/2)·λ_i·K. The real-minimum comparison, product estimate and basis bound are roadmap targets. Use the pinned squared-norm minima and simultaneous-attainment declarations in the Tau Ceti contract on `TauCeti.IntegralLattice` (`TauCeti/LinearAlgebra/IntegralLattice/Basic.lean`, line 63). For a full lattice I⊂O_E the form β(x,y)=Tr_E/ℚ(x̄y) is positive definite and integral of determinant D_E[O_E:I]², and every nonzero x∈I has β(x,x)≥2g|Nm x|^(1/g)≥2g. In ordinary Lebesgue measure on ℂ^g the CM ideal covolume is 2^(−g)√D_E[O_E:I], from Mathlib `NumberField.mixedEmbedding.covolume_integerLattice` (`Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`, line 124) and `ZLattice.covolume_div_covolume_eq_relIndex'` (`Mathlib/Algebra/Module/ZLattice/Covolume.lean`, line 170); ℤ[i] gives 1.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:quantitative-siegel-hermitian-reduction): For each fixed g≥1 there are C_g,a_g>0 such that every Z in genus-g Siegel space admits γ∈Sp_(2g)(ℤ) with γZ in the chosen standard fundamental set and every entry of γ bounded in absolute value by C_g max(1,max_ij|z_ij|,1/det Im Z)^a_g.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:quantitative-hermitian-lattice-balancing): For fixed n,r≥1 there are C_n,r,a_n,r>0 such that, for every degree-2n CM field E, conjugation-stable full order R⊂E, full R-stable lattice L⊂E^r, hermitian form h positive definite at every archimedean place, and integer N≥1 for which q=N Tr_E/ℚ h is integral on L, setting D=max(2,|disc R|,N,det Gram_L(q)), there are E-linearly independent v₁,…,v_r∈L for which every |σ(h(v_i,v_j))| and the finite index [L:Σ_i Rv_i] are at most C_n,r D^a_n,r.

The Siegel matrix estimate uses [PT], Lemmas 3.4–3.5, preprint pp. 6–7 (PT lines 213–284). The independent-vector argument for hermitian balancing uses [PT], Lemma 3.7 and its proof, preprint p. 9 (PT lines 362–385); the contract also retains the index of the generated R-lattice.

### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves

Consume Layer R18.1, §§R18.2.12–R18.2.18 and Layer R18.5 for quaternionic curves, the rational Hodge line with ‖dz‖=2 Im z, saturated relative Kodaira–Spencer, pointwise filtered bridge comparisons and bad-place models. At z=i and 1+i both norms are 2. The bridge determinant statements in §§R18.2.17–R18.2.18 assume F_v/ℚ_p unramified, even though §R18.2.14 allows ramification.

What HilbertModularVarietiesAndShimuraCurves must provide (gap:ramified-quaternionic-bridge): Extend the pointwise bridge determinant comparison of §§R18.2.17–R18.2.18 to ramified F_v/ℚ_p on relative/image Hodge lattices with the exact different twist and archimedean isometry, retaining finite-local crystalline descent and proving independence of the pro-level lift.

What HilbertModularVarietiesAndShimuraCurves must provide (gap:embedded-quaternion-orders): Provide the local maximal-order descriptions with an embedded quadratic integer ring in split and division quaternion algebras, including dyadic residue field 𝔽₂, sufficient to identify the different-torsion projection lattices of §6.5.

### From TauCetiRoadmap.GrossZagierAndArithmeticHeights

Consume §§0a.4, 0.1, 0.5, 0.9–0.11, 2.1, 2.9, 2.14, 6.5–6.8, 6.21, 6.25, 6.56, 7.15, 7.28, 7.65–7.67 and 7.77–7.78 for the actual CM point and Artin action, arithmetic pairings, residue lines, analytic derivative and full height-series decomposition, local pseudo-theta comparison, split-place compensation and adjunction. The height normalization divides by [F(P):F]. The parallel-weight-two analytic projection in §6.56 retains the noncuspidal terms needed here; it is not replaced by a cuspidal Gross–Zagier projection.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume Layers 4–7 for the adelic metaplectic cover and finite Weil representation, global theta kernels, Siegel–Weil and see-saw identities, and the half-integral-weight Whittaker framework. The orthogonal proper-intersection special divisors and support-controlled Borcherds inputs are the constructions of §§4.2–4.2a and §4.5 here.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

Consume §§0.11–0.13 and 0.16 for normalized tuple heights, finite-base-change conventions and the real/imaginary coordinate adapters. The absolute scalar foundation and Northcott inputs are supplied by DiophantineApproximationAndTranscendence §§0.2–0.3, and the metrized ample-height version by ArakelovGeometryAndAbelianHeights §§1.13–1.14.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

Consume §§0.2–0.3 for absolute multiplicative scalar and tuple height, its Mahler/primitive-minimal-polynomial comparison and Northcott over an algebraic closure with bounded absolute degree. These inputs include the leading coefficient of the primitive minimal polynomial. For i, the polynomial X²+1 has coefficient height 1 and H_abs(i)=1; for 2i, X²+4 has coefficient height 4 and H_abs(2i)=2. A fixed-number-field Northcott theorem alone does not supply the endpoint.

## How to read the build

Layer 0 fixes CM class functions and the precise domain of height linearity. Layers 1–4 construct the total reflex family, integral realizations, its metrized determinant and the orthogonal intersection proof. Layers 5–8 construct the independent nearby-type and different-torsion comparison and evaluate its quaternionic Hodge height by adjunction. Layer 9 identifies their common averaged formula: either proof route supplies the theorem. Layers 10–11 combine the average with uniform analytic estimates and geometric isogenies. Layer 12 retains arbitrary center orders and all smaller primitive factors; Layer 13 supplies the independent period-coordinate estimate and applies absolute Northcott. Each *Needs* line gives the statement inputs and a proof route's inputs without making that route exclusive.

## Layer 0: CM characters and height linearity

### 0.1 CM class functions and analytic heights

Use the following definition. For the profinite absolute Galois group Γ_Q, CM⁰ consists of rational-valued locally constant conjugation-invariant functions a for which a(σ)+a(cσ) is constant. For a CM algebra E and type Φ, put a_Φ(σ)=#(Φ∩σΦ) and a⁰_Φ equal to its conjugacy average, computed in any finite Galois quotient through which the action factors. Expand a in finite-image irreducible Artin characters and set Z̃(a)=−Σ_η a_η((L_f′/L_f)(0,η)+(log f_η)/2). Define h_Col(E,Φ)=Z̃(a⁰_Φ). Every nontrivial character occurring is totally odd; the trivial term uses ζ(0) and ζ′(0). Define H_CM⊂CM⁰ to be the ℚ-span, over all CM pairs, of a⁰_Φ. It is the domain determined by total Faltings heights. Every generator is invariant under σ↦σ⁻¹ and vanishes at complex conjugation c; consequently H_CM is a proper subspace of CM⁰, since the constant function 1 does not vanish at c. ([A], Definition 9.1.1, (9.1.2), Definition 9.1.3, pp. 508–509; A line 4984.)

One proof route is as follows. Pass to a finite splitting Galois group and take its normalized conjugacy sum; prove independence under refinement. Use the c-parity decomposition to exclude nontrivial even constituents and import regularity and nonvanishing at 0 for the remaining Artin characters. Use conductor-compatible induction and the real structure to show Z̃(a) is real. General Artin holomorphy is not an input.

Its API comprises:

- Evaluate a_Φ on σ by the cardinality of the actual intersection.
- a⁰_Φ is the normalized conjugacy average and is invariant under conjugation and finite-quotient refinement.
- a⁰_Φ(σ)+a⁰_Φ(cσ)=d.
- h_Col is Z̃(a⁰_Φ), with finite conductors and finite L-functions.
- H_CM is the ℚ-span of all overlap characters; every member is inversion-invariant and has value zero at c.
- A rational central function on a finite Galois quotient with central conjugation and constant a(σ)+a(cσ) pulls back to CM⁰; compatible pullbacks along refinements agree.
- Two CM⁰ functions agree iff their evaluations agree; two linear functionals on H_CM agree if they agree on every a⁰_Φ. No such uniqueness is inferred on full CM⁰.
- CM⁰ and H_CM are ℚ-subspaces of locally constant class functions. Z̃ is ℚ-linear and compatible with products of CM pairs and conductor-compatible induction.

The complement identity for a⁰_Φ has constant d, and h_Col is additive on product CM pairs.

**Checks.**

- For an imaginary quadratic field, a⁰ on {1,c} has values (1,0), hence equals (1+χ)/2.
- For E=E₁×E₂ with product type, two quadratic overlaps (1,0) add to (2,0), so the complement constant is 2 rather than 1.
- A nontrivial even character of a finite quotient fails the CM⁰ constant-sum condition; the constant function passes.
- The constant function 1 satisfies the CM⁰ constant-sum condition but is not in H_CM, because every overlap function vanishes at c.
- On C₂×S₃ acting regularly on its twelve embeddings, take the type containing (1,p) for p equal to the identity or (12), and (0,p) for the other four permutations. Its overlaps at (0,(12)), (0,(13)), (0,(23)) are 6,2,2, with conjugacy average 10/3; at their c-translates they are 0,4,4, with average 8/3. The complementary averages sum to 6. This checks nonabelian averaging and excludes the unaveraged function.
- For the cyclic CM Galois quotient C6 with c=r³, the class function with successive values (0,1,1,0,−1,−1) lies in CM⁰ but is not inversion-invariant and cannot lie in H_CM.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27.

### 0.2 CM-height invariance and Colmez linearity

Prove the following. For a maximal-order CM pair (E,Φ), stable unscaled Faltings height depends only on that pair. For product CM algebras extend height additively. There is a unique ℚ-linear map ht_H:H_CM→ℝ with ht_H(a⁰_Φ)=h_Falt(E,Φ). Inducing a field type to a CM overfield Ẽ multiplies a⁰ by [Ẽ:E]. Uniqueness here is only on the overlap span H_CM. Colmez’s period-normalized functional on all CM⁰ requires its component-period values and a sign/conductor/metric adapter; total heights alone do not specify that extension. The individual height conjecture on H_CM remains unproved and unused. ([A], Theorem 9.1.5 and Remark 9.1.2, pp. 509–510; citing Colmez (1993), Theorem 0.3; A line 5035; [C], Component generators, p. 630; Theorem 0.3(i)–(ii), p. 631; C line 227.)

One proof route is as follows. Import potential good reduction and model independence from the CM/height owners. Use Colmez Theorem 0.3 on the component-character generators, whose period values specify the full functional, to establish compatibility of total-height linear relations after the sign/conductor/metric normalization. Restrict to H_CM; its spanning property gives uniqueness there. Prove the component-period sign, conductor and metric adapter before restricting the functional. Prove the induction scaling by counting extensions of embeddings, then extend products by additivity.

Conjugating the CM action preserves the height; no individual equality with h_Col is inferred. Evaluation at c annihilates H_CM and is nonzero on CM⁰. Adding any real multiple of that evaluation to an extension leaves its total-height values unchanged; reject unrestricted uniqueness from total heights alone.

*Needs:* §0.1 cm class functions and analytic heights; ArakelovGeometryAndAbelianHeights §§3.4–3.5; ShimuraVarieties §§5.1–5.11.

### 0.3 Average CM character

Prove the following. For a CM field E/F with [F:ℚ]=d≥1 and χ=χ_E/F, (1/(2d))Σ_(Φ∈CM(E))a⁰_Φ=2^(d−2)(1+(1/d)Ind(χ)), where Ind(χ) denotes induction from Γ_F to Γ_Q. Consequently 2^(−d)Σ_Φ h_Col(E,Φ)=−(L_f′/L_f)(0,χ)/2−log(D_E/D_F)/4−d log(2π)/2. The sums contain all 2^d types with multiplicity one. ([A], Proposition 9.3.1, equation (9.3.1), p. 511; A line 5101.)

One proof route is as follows. Count types containing any specified embedding and pair of embeddings in the finite Galois closure; average conjugates. Apply Z̃ and Artin induction to the quadratic Hecke character. Use ζ′(0)/ζ(0)=log(2π) and conductor(Indχ)=D_F N_F/ℚ(d_E/F)=D_E/D_F.

For d=1 the character identity reads (1+χ)/2; for d=2 it reads 1+(Indχ)/2.

*Needs:* §0.1 cm class functions and analytic heights; AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27.

### 0.4 The individual Colmez conjecture predicate

Use the following definition. On H_CM define IndividualColmez to mean ∀a∈H_CM, ht_H(a)=Z̃(a), equivalently the individual formula h_Falt(E,Φ)=h_Col(E,Φ) for every maximal-order CM pair. This is the total-height form of the conjecture. A formulation on all CM⁰ must instead use the additional component-period normalization of Colmez Theorem 0.3 and its adapter; it is not defined by extending ht_H arbitrarily. Neither formulation is proved or assumed here. Layer 9 proves equality only on each averaged character. ([A], Conjecture 9.1.6, p. 510; A line 5067; [C], Theorem 0.3, p. 631; Conjecture 0.4, p. 632; C line 268.)

One proof route is as follows. Compare the ℚ-linear height and analytic maps on their common domain H_CM; distinguish the full component-period formulation on CM⁰. Specialize their equality to a⁰_Φ. Keep the predicate separate from every averaged-height theorem.

Its API comprises:

- The predicate is equality at every element of H_CM, equivalently at every spanning overlap character.
- The predicate implies the individual height formula for every maximal-order CM pair.
- Equality at a and b implies equality at each rational linear combination of a and b.
- Equality ht_H=Z̃ on H_CM follows from equality on every overlap generator; the predicate on all CM⁰ additionally needs the separately specified component-period functional.
- Generator equalities transport under CM-pair isomorphisms, add under products and scale by the extension degree under induced types. An average equality alone does not establish a generator equality.

No theorem or proof route has IndividualColmez as an assumption.

**Checks.**

- On the C₆ quotient of ℚ(ζ₇), the class function (0,1,1,0,−1,−1) has complementary sums zero and lies in CM⁰, but f(r)=1 differs from f(r⁻¹)=−1, so it is outside H_CM. IndividualColmez imposes no equality there; a predicate on all CM⁰ would require the additional component-period normalization.
- For d=1 the averaged character is already the quadratic type character; the classical case supplies that equality.
- For linear maps f(x,y)=x and g(x,y)=y on Q², equality at (1,1) does not imply equality of the maps; reject an API deriving IndividualColmez from one averaged equality.

*Needs:* §0.1 cm class functions and analytic heights; §0.2 cm-height invariance and colmez linearity.

### Examples

For E=ℚ(i), the two overlap values are (1,0), and the averaged character is (1+χ)/2. On C₆, with c=r³, the values (0,1,1,0,−1,−1) have complementary sum zero but fail inversion invariance: f(r)=1 and f(r⁻¹)=−1. Thus the overlap span is strictly smaller than the full class-function space.

### Dependencies

ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27; ArakelovGeometryAndAbelianHeights §§3.4–3.5; ShimuraVarieties §§5.1–5.11.

## Layer 1: Integral CM and total reflex families

### 1.1 The CM height torus

Construct the following CM object. Given a CM field E/F of degree 2d and an embedding ι₀:E→ℂ, form T=Res_E G_m/ker(N_F/ℚ) and T_so=ker(N_E/F). The map z↦z/z̄ identifies T/(Res_F G_m/ker N_F/ℚ) with T_so. The kernel subtorus is identified with G_m by N_F/ℚ; the diagonal G_m→T instead has kernel μ_d. Character vectors of T have a_ι+a_cι independent of ι. Use the distinguished cocharacter selecting ι₀ and its quotient reflex norm Res_E G_m→T from ShimuraVarieties §4.2. ([A], §3.1, (3.1.1)–(3.1.2), pp. 415–416; A line 998.)

One proof route is as follows. Use the existing quotient-torus and character-lattice equivalence. Compute the annihilator of ker N_F/ℚ and the quotient by Res_F G_m. Relate the supplied cocharacter and quotient reflex norm to this character description.

Its API comprises:

- Characters are exactly the embedding vectors with constant conjugate-pair sum.
- Maps from Res_E G_m annihilating ker N_F/ℚ factor uniquely through T.
- Construct T as the quotient of Res_E/ℚ G_m by ker(Nm_F/ℚ) embedded through Res_F/ℚ G_m, and expose the quotient morphism r and its kernel.
- Two torus morphisms into T agree if their pullbacks on every character agree; the displayed constant-pair-sum lattice determines the CM quotient.
- An isomorphism of CM fields preserving conjugation transports r, the norm-character map, the quotient T→T_so and the reflex cocharacter, with identities and compositions respected.

The torus has dimension d+1 and T_so has dimension d; the scalar-kernel map is distinguished from the diagonal.

**Checks.**

- For d=1, T=Res_E G_m and the diagonal has trivial kernel.
- For d=2, the diagonal factors through squaring on the kernel G_m and has kernel μ₂.
- For any d, the vector supported on one embedding alone is not a T-character when d>1, whereas each CM-type characteristic vector is.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; ShimuraVarieties §§4.1–4.6; ShimuraData Layer 3; ReductiveGroups Layer 4; ReductiveGroupsPartII §RG2.0a.2; `NumberField.IsCMField`; `NumberField.IsCMField.complexConj`; `NumberField.IsCMField.complexConj_apply_apply`.

### 1.2 The compact integral level

Use the following definition. For each p let K_so,p be the image of (O_E⊗ℤ_p)× in (E⊗ℚ_p)×/(F⊗ℚ_p)×=T_so(ℚ_p). Define K₀,p to be the largest compact subgroup of T(ℚ_p) above K_so,p, equivalently ℤ_p×·r((O_E⊗ℤ_p)×), with ℤ_p× in the kernel G_m through the norm identification. Put K₀=∏pK₀,p. This is a compact open subgroup and need not be the maximal compact of T(A_f). ([A], §3.2, (3.2.1) and Proposition 3.2.1, pp. 416–417, with the corrected subgroup; A line 1050.)

One proof route is as follows. Use the kernel G_m valuation to select its unit subgroup in the inverse image. Check the local exact sequence 1→ℤ_p×→K₀,p→K_so,p→1. At unramified p identify K₀,p with integral points of the unramified torus model. Any local cohomology cokernel uses the norm from the product F⊗ℚ_p, not the direct sum of the individual norm quotients.

Its API comprises:

- Membership is compactness in the kernel direction together with image in K_so,p.
- The unit kernel and integral-unit quotient form the stated exact sequence.
- At p unramified in E this level is T(ℤ_p).
- Construct K_so,p as r_so(O_E,p×), then K₀,p=ℤ_p×·r(O_E,p×), with exact sequence 1→ℤ_p×→K₀,p→K_so,p→1; expose its inclusion into T(ℚ_p).
- An equality of these compact subgroups follows from equality of their membership predicates; transport under a CM local-algebra isomorphism preserves both groups.

The definition uses integral unit images, not all compact elements in T_so(ℚ_p).

**Checks.**

- For d=1 recover the unit subgroup (O_E⊗ℤ_p)×.
- For E_p/F_p ramified quadratic, valuation identifies (E_p×/F_p×)/im(O_E,p×) with ℤ/2ℤ. A uniformizer maps to 1 and is excluded from K_so,p. In E_p=ℚ₃(√3), π=√3(1+√3) has valuation 1, but π²=12+6√3∉ℚ₃, so its class in E_p×/ℚ₃× does not have order two. Its square maps to 0 in the valuation quotient.
- For E=ℚ(√−3) at 2 the unramified quadratic factor gives K₀,2=O_E,2×; 1 is included and the element 2, of valuation 1, is excluded. The same unit test agrees with the unramified integral-point subgroup at odd primes.

*Needs:* §1.1 the cm height torus; ShimuraVarieties §§4.1–4.6.

### 1.3 Finite étale CM models

Prove the following. For compact open K⊂T(A_f), import the canonical finite étale CM stack Y_K/E with its Artin reciprocity action, and normalize Spec O_E in it. At every p with K_p=K₀,p this normalization is finite étale over O_E⊗ℤ_p. In particular Y₀=Y_K₀ is finite étale over O_E. For smaller levels no unramifiedness assertion is made. ([A], §3.1 and Proposition 3.2.1, pp. 416–417; A line 1050.)

One proof route is as follows. Convert the supplied geometric reciprocity formula by s↦s⁻¹ and apply the fixed arithmetic Artin map to the distinguished reflex norm. Show local inertia lands in the K₀,p unit image. Descend from a neat finite étale cover to the finite-inertia stack.

A prime where K_p is smaller retains a potentially ramified normalization.

*Needs:* §1.2 the compact integral level; ShimuraVarieties §§4.1–4.6; ShimuraVarieties §§8.1–8.6.

### 1.4 Integral polarized CM families

Prove the following. A faithful rational T-representation H of Hodge types (−1,0),(0,−1), with a polarizing T-equivariant alternating form valued in the norm character and a K-stable full adelic lattice on which that form is integral, gives a polarized abelian scheme A_H over the normalized integral CM model Y_K. Its generic fiber is the supplied canonical-model family and its ℓ-adic Tate module over Y_K[1/ℓ] is the chosen lattice. The alternating polarization form takes the chosen lattice into the integral lattice of its norm-character line; unimodularity is not required. ([A], Proposition 3.4.1, pp. 419–420; A line 1162.)

One proof route is as follows. Apply the existing Siegel moduli comparison on the generic fiber. At each local model inertia acts trivially on the prime-to-p representation after passing to the field defined by Y_K. Use Néron–Ogg–Shafarevich and extension uniqueness, then descend to the stack.

The conclusion is extension over the whole normalized model, not an assertion that every smaller-level model is étale.

*Needs:* §1.1 the cm height torus; §1.3 finite étale cm models; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.CR.7.2; AbelianSchemesAndArithmeticModuli §§A5.1–A5.7; ShimuraVarieties §§5.1–5.11; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38.

### 1.5 The total reflex CM pair

Construct the following CM object. Let E♯ be the finite étale ℚ-algebra whose embedding Γ_Q-set is CM(E). Complementing a type is its CM involution, so E♯ is a product of CM fields of total degree 2^d. For a chosen ι₀, Φ♯ consists of the types containing ι₀ and has size 2^(d−1). Its T-representation H♯=E♯ has character pullback [Φ]↦Σ_(ι∈Φ)[ι]. Choose ξ∈E♯× with ξ̄=−ξ and Im ι_Φ(ξ)>0 for Φ containing ι₀; after multiplying ξ by a positive integer so that ψ(x,y)=Tr(ξxȳ) is integral on O_E♯, this form polarizes H♯, giving an abelian scheme A♯/Y₀ of dimension 2^(d−1). Its maximal-order lattice is O_E♯. ([A], §3.4, Proposition 3.4.2, pp. 420–421; §9.2, p. 510; A line 1199.)

One proof route is as follows. Use finite étale Galois descent on the finite set of CM types. Use complement and the half-set containing ι₀ to define the CM algebra and type. Use the CM-type character vectors to descend the T-action; weak approximation supplies ξ. Clear the denominators of ψ on the maximal-order lattice by a positive integer, preserving all positivity conditions. Apply the polarized-CM family theorem and extend by the good-reduction criterion.

Its API comprises:

- The embedding set is Γ_Q-equivariantly CM(E).
- An embedding lies in Φ♯ exactly when its associated type contains ι₀.
- The total reflex representation pulls back each embedding character to its type sum.
- The trace pairing is alternating, nondegenerate and positive for the specified Hodge type.
- Finite étale descent of the CM-type Galois set constructs E♯ together with its embedding-set equivalence and complement involution. The construction is unique up to the unique compatible algebra isomorphism.
- An isomorphism of pointed CM fields (E,ι₀) transports E♯, its CM type and the character map. A polarization is additional integral positive data and is transported with ξ.

A nontransitive CM-type Γ_Q-set yields a product algebra, with no forced field instance.

**Checks.**

- For an imaginary quadratic E, E♯=E and A♯ is an elliptic CM family.
- For E=ℚ(i,√2), its four CM types split into two Galois orbits, giving E♯≅ℚ(i)×ℚ(√−2), not a quartic field.
- When d=3, verify degree 8 and abelian dimension 4, and reject a pure-imaginary ξ with the wrong sign at one selected embedding.

*Needs:* §1.1 the cm height torus; §1.3 finite étale cm models; §1.4 integral polarized cm families; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; ShimuraVarieties §§5.1–5.11; AbelianSchemesAndArithmeticModuli §§A5.1–A5.7.

### 1.6 Total reflex characters and heights

Prove the following. The total reflex pair decomposes as the product of reflex pairs indexed by Γ_Q-orbits of CM(E). Its class function satisfies a⁰_(E♯,Φ♯)=(1/(2d))Σ_Φ a⁰_(E,Φ), hence h_Falt(E♯,Φ♯)=(1/(2d))Σ_Φ h_Falt(E,Φ). The latter follows from Colmez linearity and product additivity, not the individual Colmez conjecture. ([A], Proposition 9.2.1, Proposition 9.3.2 and Corollary 9.3.3, pp. 510–512; A line 5067.)

One proof route is as follows. Match each Galois orbit with the embeddings of the corresponding reflex field. Lift both members of each reflex pair to a common CM Galois closure and count inverse embeddings. Apply the induction scaling and linear ht, then sum over product factors.

The coefficient is 1/(2d), not 2^(−d); the two coincide only accidentally in small degrees.

*Needs:* §1.5 the total reflex cm pair; §0.2 cm-height invariance and colmez linearity; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; ArakelovGeometryAndAbelianHeights §§3.4–3.5.

### Examples

For E=ℚ(i,√2), the four types form two orbits of size two, so E♯=ℚ(i)×ℚ(√−2), not a quartic field. The total reflex abelian dimension is 2. At a ramified quadratic local factor a uniformizer has odd valuation and cannot represent the image of an integral unit, although E_v×/F_v× is compact. The valuation quotient by the integral-unit image is ℤ/2ℤ; the uniformizer class in E_v×/F_v× itself need not have order two.

### Dependencies

ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; ShimuraVarieties §§4.1–4.6; ShimuraData Layer 3; ReductiveGroups Layer 4; ReductiveGroupsPartII §RG2.0a.2; `NumberField.IsCMField`; `NumberField.IsCMField.complexConj`; `NumberField.IsCMField.complexConj_apply_apply`; ShimuraVarieties §§8.1–8.6; ShimuraVarieties §§5.1–5.11; AbelianSchemesAndArithmeticModuli §§A5.1–A5.7; AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.CR.7.2; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; §0.2 cm-height invariance and colmez linearity; ArakelovGeometryAndAbelianHeights §§3.4–3.5.

## Layer 2: CM integral realizations

### 2.1 Local CM representations are crystalline

Prove the following. At q|p of E and a geometric point y of Y_K, every K_p-stable lattice N_p in an algebraic T_Qp-representation N gives a crystalline ℚ_p-representation of Γ_y. The reciprocity character factors through the image T_q of Res_Eq/ℚ_p G_m, and restricting to K_q=K_p∩T_q(ℚ_p) recovers the same representation functor. The statement and its proof apply equally to T_E=Res_E G_m and its CM curve Ỹ_K̃ of §2.5, whose local image torus at q is Res_(E_q/ℚ_p)G_m; §2.7 uses this case for H₀. ([A], Proposition 3.5.2 and Remark 3.5.3, pp. 422–424; A line 1277.)

One proof route is as follows. Identify the inertia character with the unit character of local reciprocity in the fixed Artin convention. Use the Lubin–Tate character and tensor, dual and direct-summand stability of crystalline representations. Retain the finite-index subgroup Γ_y and the image torus rather than identifying it with Res_Eq G_m.

The representation is N_p,y[1/p]; the undefined symbol Λ in the printed proposition is not a new lattice.

*Needs:* §1.3 finite étale cm models; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, “Comparison with local reciprocity”; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4.

### 2.2 CM Breuil–Kisin comparison

Prove the following. For N_p as above, the integral Breuil–Kisin module M(N_p,y) is tensor-compatible. Use W=W(k̄_y), a uniformizer π_y of the actual completed local ring O_y, and its Eisenstein polynomial E_y(u) over W. Then its crystalline realization is φ*M/uφ*M and its de Rham realization is φ*M/E_y(u)φ*M. These have the B_cris and filtered B_dR comparisons to N_p,y, compatibly with duals, tensors and changing the local CM representation. The cohomological realization of an abelian scheme uses the dual of its Tate module. ([A], Corollary 3.5.4, pp. 424–425; A line 1361.)

One proof route is as follows. Apply the integral classification with its variance fixed. Compute the two specializations of the Frobenius pullback and transfer the Hodge filtration. Use the period comparisons for each tensor operation, including at p=2.

Specializing M itself in place of φ*M must fail the comparison check. At a ramified level, the specialization polynomial belongs to π_y in O_y, rather than to a uniformizer of the smaller CM completion E_q.

*Needs:* §2.1 local cm representations are crystalline; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4.

### 2.3 Integral CM tensor torsor

Prove the following. Let D contain primes ramified in E and primes with K_p≠K₀,p. For a faithful polarized H and integral tensors whose pointwise stabilizer is T, the generic de Rham realizations of the tensors extend to horizontal sections of the tensor constructions of H_dR over all of Y_K. At a geometric point y over q|p the extension at Spec O_y is the de Rham tensor of the CM Breuil–Kisin comparison of §2.2: the B_dR comparison of A_H over Frac(O_y) carries the p-adic étale tensor to the generic de Rham tensor. This equality is the de Rham property of absolute Hodge tensors on abelian varieties (Blasius–Wintenberger), imported through the AutomorphicBundles supplier contract, and not algebraicity of arbitrary Hodge cycles; Betti–de Rham and Betti–étale comparisons and descent of the tensors to the reflex field do not give it. When the tensors have stabilizer T over Z[1/D], the tensor-preserving isomorphisms O⊗H_Z→H_dR form a T-torsor over Y_K[1/D], independent of the chosen faithful realization. ([A], Proof of Proposition 3.5.5, pp. 426–427; A line 1442.)

One proof route is as follows. At each geometric point y compare the Breuil–Kisin de Rham tensors with the generic de Rham tensors through the supplied p-adic comparison; this extends the tensors over Y_K. Apply the integral tensor-stabilizer theorem at unramified maximal-level primes, where T extends to a torus over Z[1/D]. Compare two faithful realizations inside their direct sum to show independence.

For the tensor unit and the identity endomorphism the comparison is the identity; for the polarization the equality holds in the Tate line, so the frame group is the similitude torus T and not its norm-one part.

*Needs:* §1.4 integral polarized cm families; §2.2 cm breuil–kisin comparison; AutomorphicBundles §§B1.1–B1.3; AutomorphicBundles §B1.3 (gap:absolute-hodge-padic-comparison); FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4.

### 2.4 CM bundles and crystals

Prove the following. The generic tensor functor from T-representations to filtered de Rham bundles extends to integral lattices on Y_K. Its completions at y are the de Rham modules of the CM Breuil–Kisin comparison. At q where Y_K is étale over O_E, it also gives a compatible F-crystal with these crystalline fibers. For a polarized weight-one H, the resulting H_dR is the dual of H¹_dR(A_H/Y_K), with its dual Hodge filtration, and the crystals agree with the corresponding Dieudonné realization. At a geometric point y with residue field kbar, the pointwise crystalline realization is over W(kbar), using that geometric PD thickening. ([A], Proposition 3.5.5(1)–(5), pp. 425–427; A line 1400.)

One proof route is as follows. Construct away from bad primes by the tensor-preserving torsor. Glue the local integral lattices using the rational comparison of §2.3 at each geometric point and uniqueness. Identify weight-one realizations with abelian de Rham and crystalline cohomology through the imported comparison.

The global F-crystal assertion is restricted to the étale locus; the filtered integral bundle is global.

*Needs:* §2.2 cm breuil–kisin comparison; §1.4 integral polarized cm families; AutomorphicBundles §§B1.1–B1.3; AutomorphicBundles Layer B2; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; §2.3 integral cm tensor torsor.

### 2.5 Integral Hecke and torus actions

Prove the following. The T-action on A_H is a faithful rational action T→Aut⁰(A_H)=(End(A_H)⊗ℚ)×, and level-changing Hecke isogenies extend over the integral CM models with compatible de Rham and crystalline realization maps. Integral endomorphisms and rational quasi-isogenies are distinguished. For the tautological H₀=E, the torus T_E=Res_E G_m acts by multiplication and the lattice is O_E. For d≥2, H₀ is not a T-representation: ker N_F/ℚ acts on E by multiplication, nontrivially. Its global realizations live on the finite cover Ỹ_K̃→Y_K attached to T_E and a level K̃ whose image in T(A_f) lies in K, and only the conjugate-semilinear V₀⊂End(H₀) of §2.6, on which T_E acts through T_so, descends to Y_K. ([A], Proposition 3.5.6 and its proof, pp. 427–428; A lines 1481 and 1522–1542.)

One proof route is as follows. Descend the generic homomorphisms using the canonical CM family. Extend over the good-reduction models and compare Tate modules. Use the realization comparison to identify the extended actions.

The faithful rational T-action is not promoted to an integral automorphism action for every rational point.

*Needs:* §1.4 integral polarized cm families; §2.4 cm bundles and crystals; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; ShimuraVarieties §§8.1–8.6; AutomorphicBundles Layer B2.

### 2.6 The standard CM quadratic line

Use the following definition. For H₀=E, let V₀={f∈End_Q(E):f(ax)=āf(x)}. Write f_a(x)=a x̄; then f_a∘f_a is multiplication by aā. This gives a rank-one E-module with hermitian form ⟨f_a,f_b⟩=a b̄, rational quadratic form Q₀(f_a)=Tr_F/ℚ(aā), and an integral lattice from O_E. Its filtered realization has Hodge line ω₀=Fil¹V₀,dR on Y₀. Equip this line with ||z||²=|[z,z̄]₀|, where [x,y]₀=Q₀(x+y)−Q₀(x)−Q₀(y) is the associated bilinear form, extended complex-bilinearly. Since Q₀ is positive definite, [z,z̄]₀ is positive for z≠0 and the absolute value is redundant. The printed negative sign would give a negative squared norm. ([A], §3.6, pp. 428–429; §9.4, pp. 513–514 (metric on p. 514), with the positive-metric correction; A line 1520.)

One proof route is as follows. Identify a semilinear endomorphism by its value at 1. Compute composition and polarize the norm to obtain the hermitian and rational forms. Take the selected filtration line and use its nonzero hermitian value to define a positive metric.

Its API comprises:

- Evaluation at 1 identifies V₀ with E, with inverse a↦f_a.
- f_a² is multiplication by aā; Q₀(f_a)=Tr_F/ℚ(aā).
- The ω₀ metric equals the absolute bilinear value and scales by |λ|².
- For a∈E the map x↦a x̄ is in V₀; evaluation at 1 and this construction are inverse E-linear maps.
- Two conjugate-semilinear maps agree iff they agree at 1. Transport along a CM algebra isomorphism preserves composition, conjugation, the norm quadratic form and its positive metric.

The squared norm is positive on every nonzero Hodge vector.

**Checks.**

- For E=ℚ(i), f₁ is conjugation, f₁²=1, Q₀(f₁)=1.
- For E=ℚ(i), f_i²=1, whereas the complex-linear multiplication-by-i map has square −1 and is excluded.
- For E=ℚ(i) with Q₀(a)=|a|² and its associated bilinear form B(a,b)=2 Re(a b̄), take z=(1,i) in the complexified real plane. Then B(z,z̄)=4, so its squared norm is 4; the negative convention gives −4.

*Needs:* §1.3 finite étale cm models; §2.4 cm bundles and crystals; ShimuraData Layer 1.

### 2.7 Tautological CM crystal

Prove the following. At a geometric y over q|p, with W the Witt vectors of its algebraically closed residue field, let H₀,cris,y be the Breuil–Kisin crystalline realization of the Γ_y-representation H₀⊗ℚ_p with lattice O_E⊗ℤ_p, where Γ_y acts through the local Artin map into E_q×⊂T_E(ℚ_p). This is the local construction of §§2.1–2.2 applied to the torus T_E, whose local image torus at q is Res_(E_q/ℚ_p)G_m itself; it is not an output of the global functor of §2.4, since H₀ does not factor through T when d≥2. Then H₀,cris,y decomposes by primes q′|p of E. The q-factor is the Dieudonné crystal of the Lubin–Tate O_Eq-module, with the dual-Tate convention fixed above; every q′≠q factor is W⊗ℤ_p O_Eq′ with Frobenius Fr⊗1. Applying conjugate-semilinear endomorphisms gives the corresponding decomposition of V₀,cris,y by primes of F; since V₀ is a T-representation, this V₀,cris,y is the fibre at y of the crystal of §2.4. ([A], §3.6, pp. 428–429, preceding Proposition 3.6.1; A lines 1520 and 1584–1586.)

One proof route is as follows. Apply the local reciprocity character to the q-factor. Show inertia is trivial on the other factors and identify their unramified Frobenius. Apply the tensor-compatible realization to conjugate-semilinear Hom, and compare with §2.4 through the inclusion V₀⊂End(H₀), which is T_E-equivariant.

The local decomposition includes factors not above q, rather than treating the whole representation as one Lubin–Tate character.

*Needs:* §2.1 local cm representations are crystalline; §2.2 cm breuil–kisin comparison; §2.4 cm bundles and crystals; §2.6 the standard cm quadratic line; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, “Comparison with local reciprocity”; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4.

### 2.8 Nonsplit CM crystals and supersingularity

Prove the following. The Newton cocharacter of a geometric CM fiber factors through T. For the distinguished prime 𝔭 of F under q, the Frobenius invariants in V₀,cris,𝔭 span its rational crystal exactly when 𝔭 is nonsplit in E. The associated polarized weight-one fibers A_H are supersingular exactly in that nonsplit case, with the nonzero faithful realization understood. ([A], Propositions 3.6.1–3.6.2 and Lemma 3.6.3, pp. 430–431; A line 1602.)

One proof route is as follows. Average the CM cocharacter along the decomposition group to compute the Newton cocharacter. Compute invariants in the semilinear q-factor and distinguish split and nonsplit cases. Read the weight-one slopes through the faithful representation; all slopes are 1/2 precisely in the nonsplit case.

A split quadratic local algebra must not satisfy the full-invariant-span or supersingularity conclusion.

*Needs:* §2.7 tautological cm crystal; §2.5 integral hecke and torus actions; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.15–R07.2.16, R07.2.20.

### Examples

For the Gaussian CM elliptic curve at a split prime 5 the weight-one slopes are 0 and 1; at inert 3 they are 1/2 and 1/2. A geometric crystalline fiber uses W(𝔽̄₃), not W(𝔽₃). The étale summands at primes different from the distinguished one have slope 0 before applying the specified representation and duality.

For F=ℚ(√2) and E=ℚ(√2,i), the unit 3+2√2 has norm 9−8=1, so it lies in ker N_F/ℚ, yet it multiplies E by 3+2√2≠1: H₀ is a T_E-representation that is not a T-representation, and §2.7 builds its crystal locally. Its conjugate-semilinear V₀ is a T-representation: t∈T_E acts on f_a by t∘f_a∘t⁻¹=f_(a t/t̄), and t/t̄=1 for t∈F×. For d=1, T=T_E and the distinction is vacuous.

### Dependencies

§1.3 finite étale cm models; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, “Comparison with local reciprocity”; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; §1.4 integral polarized cm families; AutomorphicBundles §§B1.1–B1.3; AutomorphicBundles §B1.3 (gap:absolute-hodge-padic-comparison); AutomorphicBundles Layer B2; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; ShimuraVarieties §§8.1–8.6; ShimuraData Layer 1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.15–R07.2.16, R07.2.20.

## Layer 3: The total reflex determinant

### 3.1 Total reflex determinant section

Construct the following CM object. Put r=2^(d−1) and H=H♯_dR. The conjugate-semilinear action of ω₀ on H gives ω₀⊗gr⁻¹H→Fil⁰H, generically an isomorphism of rank r bundles. Its determinant is a canonical nonzero section Δ of L=ω₀^(−r)⊗det Fil⁰H⊗(det gr⁻¹H)⁻¹. Its zero divisor is effective and measures the integral failure of that map to be an isomorphism. ([A], §9.4, equation (9.4.3), pp. 513–514; A line 5177.)

One proof route is as follows. Construct the action on the total reflex representation by type-character sums. Pass to the Hodge graded pieces and take the determinant. Use the generic character decomposition to prove nonvanishing.

Its API comprises:

- L is the stated tensor product with exponent −r.
- Δ is the determinant of the ω₀ action on the indicated graded pieces.
- Δ and its divisor commute with flat base change and finite étale level pullback.
- The actual map ω₀⊗gr^(−1)H♯→Fil⁰H♯ induces its determinant section Δ in L by the determinant tensor-power isomorphism; no generator of a determinant line is chosen.
- At a geometric point the determinant section vanishes iff the rank-r graded-action map fails to be invertible. Flat base change preserves the section and its effective Cartier divisor where the generic map is invertible.

The determinant exponent is the abelian dimension r, not the rational rank 2r.

**Checks.**

- For d=1 the action is a map of lines and its determinant has exponent 1.
- For d=3 the exponent is 4 rather than 8; a diagonal action with entries (π,1,1,1) has determinant π and cokernel length 1.
- On a square-zero base k[ε]/(ε²), multiplication by ε has nonzero determinant ε but ε²=0, so its zero scheme is not an effective Cartier divisor. This base lies outside the regular CM base hypotheses of the determinant-divisor assertion.
- Over the generic splitting field each type coordinate is nonzero; after swapping the two Hodge pieces the inverse line is detected.

*Needs:* §1.5 the total reflex cm pair; §2.6 the standard cm quadratic line; §2.4 cm bundles and crystals; ArakelovGeometryAndAbelianHeights §§1.3, 1.11.

### 3.2 Partition quotient over a DVR

Use the following definition. Let A be a complete characteristic-zero DVR with perfect residue field, B a finite product of complete DVRs finite flat over A with separable fraction fields, C a complete DVR A-algebra with perfect residue field containing all embeddings Υ_all:B→C, and M an invertible B-module. For Υ⊂Υ_all let K_Υ(M) be the kernel of M⊗A C→∏_(η∈Υ)(M⊗B,η C). Set M(Υ)=(M⊗A C)/(K_Υ(M)+K_Υc(M)). The module has finite C-length. Work factorwise after the maximal unramified decomposition; no global monogenic generator is assumed. The tensor product and all evaluation maps are over A; require an injective local map A→C and a splitting of the entire separable fraction algebra. The value group is normalized by v_C of a uniformizer equal to 1. ([A], §9.4, Lemma 9.4.4, pp. 516–518; A line 5306.)

One proof route is as follows. Define the two evaluation kernels as native submodules. Over the fraction field the partition gives complementary summands, so the quotient is torsion. Use local freeness of M to show finite presentation and finite length.

Its API comprises:

- Membership in K_Υ means vanishing at each η∈Υ.
- M(Υ) and M(Υc) are canonically the same quotient.
- Its length depends on M only through its B-linear isomorphism class; since B is a finite product of local rings, every invertible B-module is isomorphic to B, so it equals the length for M=B.
- The canonical C-linear projection M⊗_A C→M(Υ) has kernel K_Υ(M)+K_Υc(M); maps out of the quotient are exactly maps annihilating both kernels.
- A B-linear isomorphism M≅M′ induces an isomorphism of partition quotients, respecting identities, composition and the complement symmetry. A finite extension C′/C multiplies the length by its ramification index.

Υ=∅ and Υ=Υ_all both give the zero module.

**Checks.**

- For an empty part the quotient is zero.
- For B=A×A and the two singleton parts the quotient is zero.
- For B=A[√π] over a DVR of odd residue characteristic and C containing √π, the singleton partition has length v_C(2√π)>0.

*Needs:* ArakelovGeometryAndAbelianHeights §§1.3, 1.11.

### 3.3 Corrected partition length

Prove the following. For the partition quotient, after decomposing B into local monogenic factors with integral generator π, length_C M(Υ)=Σ_(η∈Υ,η′∉Υ)v_C(ηπ−η′π). Equivalently it is half the full discriminant valuation minus the sums over unordered pairs within Υ and within Υc. Contributions between distinct unramified factors vanish. The formula is nonnegative and is unchanged by an invertible B-module twist. For a general ramified base A the discriminant is the relative discriminant of B/A, extended to C. The sum is computed within each monogenic local factor after unramified splitting; no uniformizer of one factor is subtracted from an element in another. ([A], Lemma 9.4.4, pp. 516–518, corrected final formula; A line 5306.)

One proof route is as follows. Use a local generator of M and the Vandermonde evaluation matrix on each unramified factor. Compute the resultant between the two partition polynomials and identify the quotient length. Split the full discriminant product into its two within-part products and the cross product; correct the signs in the printed display.

A ramified quadratic singleton partition has positive length, while the reversed printed sign gives a negative number.

*Needs:* §3.2 partition quotient over a dvr.

### 3.4 Local conductor functional

Use the following definition. For a finite quotient of Γ_Qp, define μ_p on complex class functions by linear extension of the Artin conductor exponent on irreducible characters. Extend to locally constant functions by normalized conjugacy averaging, compatibly with refining the quotient. For K/ℚ_p finite étale and Υ⊂Hom(K,P), set a_Υ(σ)=#(Υ∩σΥ); also let a_ηη′ be the indicator σ∘η=η′. This is a functional on locally constant functions, with no claim of boundedness on all continuous functions. ([A], §9.4, p. 518, before Proposition 9.4.5; A line 5394.)

One proof route is as follows. Expand in the finite character basis. Use inflation compatibility of conductors to pass between quotients. Average general locally constant functions before evaluating.

Its API comprises:

- μ_p(χ) is the Artin conductor exponent.
- Inflation to a finer finite quotient preserves μ_p.
- a_Υ=Σ_(η,η′∈Υ)a_ηη′.
- On a fixed finite quotient μ_p is the linear functional taking each irreducible character to its Artin conductor exponent. Inflation-compatible character expansions make these functionals agree on common refinements.
- Two linear conductor functionals on a finite quotient agree if they agree on all irreducible characters; this asserts neither boundedness nor a measure on the full space of continuous functions.

The trivial character has conductor exponent zero.

**Checks.**

- A trivial finite representation has conductor zero.
- For a tamely ramified nontrivial quadratic character the exponent is 1, with no logarithm factor.
- The inclusion ℤ_p→ℂ given by an infinite uniformly convergent digit expansion is continuous with infinite image, so it is not locally constant through a finite quotient and lies outside the conductor domain. For instance x=Σa_np^n maps to Σa_n/(2p)^(n+1), and different digits can be distinguished by the geometric tail bound.

*Needs:* AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”.

### 3.5 Conductor values and positive lengths

Prove the following. For K/ℚ_p a local field with maximal unramified K₀, splitting field P and e_P=v_P(p), μ_p(a_ηη)=v_P(η(d_K/ℚ_p))/e_P. If η≠η′ agree on K₀, μ_p(a_ηη′)=−v_P(ηπ−η′π)/e_P; if they disagree on K₀ it is zero. Thus length_C M(Υ)=(e_P/2)(μ_p(a_Υ)+μ_p(a_Υc)), when C=O_P and B=O_K. Extend by unramified-factor additivity. ([A], Proposition 9.4.5 and equation (9.4.7), pp. 518–519; A line 5394.)

One proof route is as follows. Use the ramification-group formula for conductors of the embedding permutation representation. Identify diagonal terms with the different and off-diagonal terms with conjugate-uniformizer distances. Sum over the partition; combine the two diagonal discriminant sums and the corrected resultant formula.

For Q₃(√3) split over itself, the singleton length is 1, not −1; cross-unramified terms and the empty partition give zero.

*Needs:* §3.4 local conductor functional; §3.3 corrected partition length; AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”.

### 3.6 Metrized determinant and trace volume

Prove the following. Use the unscaled squared Hodge metric, the ω₀ absolute-value metric, and the volume metric on det H♯_dR dual to integration on top cohomology. The canonical Δ has norm 1, so in arithmetic Picard groups det H♯_dR=Δ+rω₀−2Ω♯. The trace-one top de Rham class η has |∫η|=(2π)^r; multiplying η by a unit u multiplies that absolute period by |σu|. Consequently deĝ(det H♯_dR)/deg_C Y₀=2^d d log(2π). ([A], Proof of Theorem 9.4.2, pp. 515–516; Lemma 9.4.3 with corrected generator and period; A line 5264.)

One proof route is as follows. Compute the archimedean determinant norm using the corrected positive metric; prove this as an isometry of metrized lines. Use the de Rham trace isomorphism to select η rather than an arbitrary generator. Compare the trace to Betti integration with (2πi)^r; dualize the volume line and sum over all 2d complex embeddings with stack weights.

A generator scaled by a unit of nonunit archimedean absolute value changes the individual period; the normalized arithmetic degree remains the stated positive multiple of log(2π).

*Needs:* §3.1 total reflex determinant section; §2.6 the standard cm quadratic line; ArakelovGeometryAndAbelianHeights §§1.3, 1.11; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10; AutomorphicBundles Layer B2.

### 3.7 Local total reflex comparison

Prove the following. For 𝔭|p in F put d_𝔭=[F_𝔭:ℚ_p], E_𝔭=E⊗F F_𝔭, and form its total reflex algebra from the local CM-type Galois set. Restriction CM(E)→CM(E_𝔭) has fibers 2^(d−d_𝔭). Its local total reflex character equals 2^(d_𝔭−2)(1+d_𝔭⁻¹Ind χ_𝔭), including split χ_𝔭=1. With the integral filtered identification of the total reflex graded pieces, this comparison gives length_q(Δ)=2^(d−2)v_q(d_F/ℚ). ([A], Proof of Proposition 9.4.1, equations (9.4.8)–(9.4.13), pp. 519–522; A line 5443.)

One proof route is as follows. Count choices away from 𝔭 and identify the local embedding Galois set. Apply conductor-discriminant induction to the local averaged character. Identify the integral graded action quotient with the partition quotient before transferring the character calculation; the integral filtered comparison is part of this target.

The split local algebra is retained and gives its appropriate conductor contribution; the ramification normalization uses v_q on the actual integral base.

*Needs:* §1.5 the total reflex cm pair; §0.3 average cm character; §2.4 cm bundles and crystals; §3.5 conductor values and positive lengths.

### 3.8 Total reflex height and the standard line

Prove the following. deĝ(Δ)/deg_C Y₀=2^(d−1)log D_F and deĝ(Ω♯)/deg_C Y₀=Σ_Φ h_Falt(E,Φ). Hence 2^(−d)Σ_Φ h_Falt(E,Φ)=deĝ(ω₀)/(4 deg_C Y₀)+(log D_F)/4−d log(2π)/2. These normalized degrees are unchanged by finite étale change of level. ([A], Proposition 9.4.1, Theorem 9.4.2 and (9.4.4), pp. 515–516; end of the local calculation on p. 522; A line 5264.)

One proof route is as follows. Sum the local divisor lengths over O_E with stack weights. Apply the height definition over all 2d embeddings, together with the total reflex height identity. Solve the metrized determinant relation for deĝ Ω♯ and divide by 2^d.

The factor 2d is present in the height-degree conversion; no extra log(2π) is introduced by a second metric conversion.

*Needs:* §3.7 local total reflex comparison; §3.6 metrized determinant and trace volume; §1.6 total reflex characters and heights; ArakelovGeometryAndAbelianHeights §§1.3, 1.11; ArakelovGeometryAndAbelianHeights §§3.4–3.5.

### Examples

Take A=ℤ₃ and B=C=ℤ₃[π], π²=3. The singleton partition quotient is C/(2π), of length 1. Here v_C(3)=2, and each singleton conductor value is 1/2, giving (2/2)(1/2+1/2)=1. The opposite resultant or conductor sign gives −1. For d=1 the determinant exponent is 1; for d=3 it is 4.

### Dependencies

§1.5 the total reflex cm pair; §2.6 the standard cm quadratic line; §2.4 cm bundles and crystals; ArakelovGeometryAndAbelianHeights §§1.3, 1.11; AutomorphicLFunctionsAndLocalFactors Layer AL.1, “CM quadratic completion and orbital comparisons”; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10; AutomorphicBundles Layer B2; §0.3 average cm character; §1.6 total reflex characters and heights; ArakelovGeometryAndAbelianHeights §§3.4–3.5.

## Layer 4: The orthogonal averaged-height route

### 4.1 Auxiliary CM quadratic data

Use the following definition. An auxiliary pair is a fractional O_E-ideal a and ξ∈F× negative at the distinguished real embedding and positive at all others. It is good at p when ξ·Nm_E/F(a)·d_F/ℚ is the unit ideal after localizing at p. A compatible maximal ℤ-lattice L⊂(E,Tr_F/ℚ(ξx x̄)) is good at p in the integral quadratic sense of Definition 5.3.3. The field trace is Tr_F/ℚ, because its argument lies in F. Explicitly, at each place 𝔭 of F over p unramified in E, L_𝔭 is O_E,𝔭-stable and self-dual. At a ramified place, L_𝔭 is maximal and contains an O_E,𝔭-stable lattice Λ_𝔭 with Λ_𝔭⊂L_𝔭⊊δ_E,𝔭/F,𝔭⁻¹Λ_𝔭. The finite complementary set defines D_bad,L as the product of its rational primes. ([A], Definition 5.3.3, p. 460; §9.5, pp. 522–525; A line 2796.)

One proof route is as follows. Form the norm ideal and its local valuations. Use the existing maximal quadratic-lattice notion, including the dyadic integral convention. Separate goodness of the pair from goodness of a chosen maximal lattice.

Its API comprises:

- Goodness at p is the vanishing of every local valuation of ξ Nm(a) d_F/ℚ over p.
- Replacing a by ua and ξ by ξ/Nm(u) preserves goodness and the quadratic space up to isometry.
- The trace form has signature (2d−2,2).
- A fractional O_E-ideal a and ξ∈F× with the specified real signs give the quadratic lattice (a,Tr_F/ℚ(ξ Nm_E/F)); goodness is a separate local unit/maximal-lattice condition.
- Replacing a by b a and ξ by ξ/(b b̄), b∈E×, gives an isometric quadratic lattice, preserving goodness at every prime and the real signature.

Goodness is a local unit condition and survives multiplying a by a principal ideal with the corresponding inverse norm change in ξ.

**Checks.**

- For d=1 and a=O_E, ξ=−1, the signature is (0,2).
- At a place where ξ Nm(a)d_F has valuation 1, reject goodness.
- A positive ξ at every real place gives a positive definite form and fails the auxiliary signature condition.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; GeometryOfNumbersAndQuadraticArithmetic §§2.2, 2.7–2.9.

### 4.2 GSpin data and special divisors

Construct the orthogonal arithmetic intersection data for every rational quadratic space of signature (n,2), n≥1, with a maximal integral lattice L: its normal flat GSpin integral model, Kuga–Satake abelian realization at suitable finite level, Hodge line ω with squared metric ‖z‖²=−B(z,z̄) on the negative-plane domain, for nonzero isotropic z with B(z,z̄)<0, where B(x,y)=Q(x+y)−Q(x)−Q(y), and special divisors Z(m,μ) for special endomorphisms of positive norm m in the coset μ∈L∨/L. Descent to a stack retains automorphism weights. For a harmonic weak Maass form f of weight 1−n/2 in the lattice Weil representation with integral principal part, form the finite principal-part sum Z(f) and its regularized theta Green function Φ(f). Their pair is an arithmetic divisor. The CM pairing is pullback to the finite CM stack followed by weighted arithmetic degree. ([A], §§4.1–4.7, pp. 431–454; metric §4.6, p. 452; A line 2487; arithmetic divisor (4.7.4); A line 2574.)

Its API comprises:

- The special-divisor moduli condition fixes m and μ; negative m has no complex point in the positive special-endomorphism locus, and zero norm is outside this positive-index divisor family.
- Principal-part sums are additive in f and compatible with level pullback and discriminant-module restriction; their Green functions have the matching logarithmic singularities.
- The CM pairing uses stabilizer weights; its quotient by the positive weighted complex degree is unchanged by finite étale level pullback.

**Checks.**

- On the negative plane Q(x,y)=−x²−y², z=(1,i) gives B(z,z̄)=−4 and squared norm 4. On the positive standard CM plane of §2.6 the bilinear value is +4 and its absolute value again gives 4.
- For f=0 the principal-part sum and Green function are both zero; this does not allow division by its zero constant coefficient in §4.2c or §4.3.
- A point with automorphism group of order 2 contributes 1/2 to the degree; a degree-two finite étale cover doubles both weighted degrees and preserves their quotient.

One proof route constructs the integral model and realization, defines special divisors through special endomorphisms and applies the regularized theta lift with the stated Hodge metric.

*Needs:* ShimuraVarieties §§6.1–6.2 for Hodge-type canonical models; AbelianSchemesAndArithmeticModuli §§A4.3, A6.38 for the abelian realization and Hodge line; MetaplecticAutomorphicForms Layers 4–7 for the Weil representation and theta/Whittaker framework; ArakelovGeometryAndAbelianHeights §§1.3, 1.11 for arithmetic degree.

### 4.2a Borcherds section and vertical support

For the data of §4.2 with n≥3 and a weakly holomorphic f of weight 1−n/2 with integral principal part, prove that, after replacing f by a sufficiently divisible positive integral multiple, there is a rational Borcherds section Ψ(f) of ω^(c_f(0,0)) with Φ(f)=−log‖Ψ(f)‖²+c_f(0,0)log(4π exp γ). Weakly holomorphic means that the nonholomorphic shadow vanishes; γ is Euler's constant. The vertical discrepancy E_error(f)=div Ψ(f)−Z(f) is supported at primes dividing the lattice discriminant. Its odd p component vanishes if p² does not divide that discriminant. For n≥5 only the dyadic component can remain, and it vanishes if L is self-dual at 2. These assertions retain every finite prime. ([A], Theorem 4.8.1, pp. 454–455; A line 2585.)

Its API comprises:

- The section has weight c_f(0,0), the specified quadratic Hodge metric and vertical discrepancy.
- Its Green-function relation includes the constant c_f(0,0)log(4π exp γ).
- The discrepancy satisfies each dimension and local-discriminant support clause above; no blanket self-duality assertion is made in smaller dimension.

**Checks.**

- At a self-dual dyadic lattice of rank at least 7, n≥5 and E_error(f)=0. At n=3 self-duality at 2 alone does not invoke that vanishing clause.
- At an odd prime with discriminant valuation 1, p² does not divide the discriminant and the error component is zero; valuation 2 does not satisfy this clause.
- If c_f(0,0)=2, the section belongs to ω² and the metric relation has constant 2log(4π exp γ); omitting that constant changes the Green function.

One proof route descends the Borcherds product and compares its integral divisor with Z(f), retaining the vertical discrepancies and proving their support by integral q-expansions.

*Needs:* §4.2 gspin data and special divisors; MetaplecticAutomorphicForms Layers 4–7 for the modular and Weil-representation input.

### 4.2b Big-CM arithmetic degree

For d≥2, the auxiliary quadratic space of signature (2d−2,2), its maximal lattice L and CM cycle Y, prove the arithmetic degree formula for every harmonic weak Maass form f of weight 2−d with integral principal part:

`[Z_hat(f):Y]/deg_C(Y) = (-L_shadow'(0,xi(f)) + a(0,0)*c_f^+(0,0))/Lambda(0,chi)`

in ℝ modulo the ℚ-span of log p for primes bad for L. Here ξ(f) is the Bruinier–Funke shadow, a(0,0) is the trivial-coset constant coefficient of the holomorphic q-expansion extracted from the normalized incoherent Eisenstein derivative, and L_shadow(s,ξ(f)) is the generalized L-function obtained by pairing ξ(f) with the diagonal restriction of that Eisenstein series, with the Λ(s+1,χ) factor. Use the normalization of A §§6.1–6.3, pp. 466–473. The denominator is Λ(0,χ)≠0, where Λ(s,χ)=(D_E/D_F)^(s/2)Γ_ℝ(s+1)^dL_f(s,χ) and Γ_ℝ(s)=π^(−s/2)Γ(s/2). ([A], (6.0.1)–(6.0.2), p. 465; A line 3023; §6.3, pp. 472–473; A line 3382; Theorem 6.4.2, p. 474; A line 3467.)

One proof route matches integral special-divisor lengths with local Eisenstein coefficients, including dyadic places, and combines them with the regularized archimedean theta pairing. For Y in this quadratic space the special-endomorphism space at a complex CM point is zero, which gives proper intersection. The local error support is retained as stated, rather than restricting the global construction to good primes.

**Checks.**

- For f=0, the arithmetic divisor, shadow and constant coefficient all vanish, so both sides are zero; Λ(0,χ) remains nonzero.
- For weakly holomorphic f, ξ(f)=0 and L_shadow'(0,ξ(f))=0, leaving a(0,0)c_f(0,0)/Λ(0,χ). A nonzero shadow does not permit that deletion.
- For degree-two finite étale pullback, [Z_hat(f):Y] and deg_C Y both double, while the displayed analytic quotient is unchanged.

*Needs:* §4.2 gspin data and special divisors; §2.4 cm bundles and crystals; §0.3 average cm character; §4.1 auxiliary cm quadratic data; §1.2 the compact integral level; §1.3 finite étale cm models; MetaplecticAutomorphicForms Layers 4–7; ArakelovGeometryAndAbelianHeights §§1.3, 1.11.

### 4.2c Hodge-height identity

For d≥2, an auxiliary maximal lattice L and a maximal lattice L⋄⊃L of signature (n⋄,2), n⋄≥3, whose orthogonal complement Λ=L^⊥⊂L⋄ is positive definite of rank n⋄−2d+2 (any rank, zero included), take a weakly holomorphic f of weight 1−n⋄/2 in its Weil representation with integral principal part and c_f(0,0)≠0. Assume proper intersection: for every μ∈L⋄∨/L⋄, c_f(−m,μ)=0 whenever m>0 is represented by the denominator lattice D_L⋄⁻¹Λ in that complement, as in Hypothesis 8.3.1. Prove

`[omega:Y]/deg_C(Y) = -2*Lambda'(0,chi)/Lambda(0,chi) - d*log(4*pi*exp(gamma)) + [E_error(f):Y]/(c_f(0,0)*deg_C(Y))`

in ℝ modulo the ℚ-span of logarithms of primes bad for L. The Hodge line is restricted from the enlargement; E_error(f) is the Borcherds vertical discrepancy of L⋄, with the support of §4.2a applied to L⋄ and n⋄ (A Theorem 4.8.1, pp. 454–455): its odd p component vanishes when p² does not divide D_L⋄, and for n⋄≥5 it is dyadic and vanishes when L⋄ is self-dual at 2. The paragraph following A (8.3.1) reverses that odd-prime divisibility condition and writes L for L⋄; Theorem 4.8.1 is the operative statement. All denominators are nonzero: the CM degree is positive, the constant coefficient is assumed nonzero and Λ(0,χ)≠0. ([A], Hypothesis 8.3.1 and Proposition 8.3.3, pp. 505–507; A line 4927; Theorem 8.3.4, p. 508; A line 4989.)

One proof route restricts the special divisors along the enlargement using the complement theta series, applies §4.2b and inserts the Borcherds relation of §4.2a. The stronger rational-complement avoidance in §4.5 implies the proper-intersection condition used here.

**Checks.**

- If the denominator complement lattice has a vector of norm 1, any c_f(−1,μ)=1 violates the hypothesis; requiring all coefficients c_f(−1,μ)=0 removes this obstruction.
- If f is replaced by 2f and its section by Ψ(f)², its constant coefficient and vertical error both double, so the error quotient is unchanged.
- When E_error(f)=0, expanding Λ'/Λ=ℓ(0)+(1/2)log(D_E/D_F)−(d/2)log(4π exp γ) makes the analytic side −2ℓ(0)−log(D_E/D_F); the gamma constants cancel.
- A rank-one complement is admitted. For E=ℚ(i,√2), F=ℚ(√2) and ξ=√2, negative at the distinguished embedding, the form Tr_F/ℚ(ξ x x̄) is 8(a₁a₂+b₁b₂) on x=(a₁+a₂√2)+(b₁+b₂√2)i, rationally U⊕U, so L≅U⊕U of signature (2,2). Then L⋄=U⊕U⊕⟨1⟩ is maximal of signature (3,2), its one nontrivial dual coset having norm 1/4, and Λ=⟨1⟩ has rank 1. Here D_L⋄⁻¹Λ=(1/2)ℤ represents k²/4 for k≥1, so c_f(−1/4,1/2)=c_f(−1,0)=0 is required; the error quotient E_error(f)/(c_f(0,0)deg_C Y) is the same as for a rank-two complement.

*Needs:* §4.2 gspin data and special divisors; §4.2a borcherds section and vertical support; §4.2b big-cm arithmetic degree; §4.1 auxiliary cm quadratic data; MetaplecticAutomorphicForms Layers 4–7 for the complement theta series.

### 4.2d Orthogonal Hodge-line degree adapter

Prove the following. For the auxiliary quadratic space V=(E,Tr_F/ℚ(ξ x x̄)) of signature (2d−2,2), its maximal lattice L and CM cycle Y, compare the restricted orthogonal Hodge line ω with ω₀ on the CM model. The required normalized difference deĝ(ω|Y)/deg_C Y−deĝ(ω₀)/deg_C Y₀ is the discriminant correction log D_F, up to the explicitly supported bad-prime logarithms in Proposition 9.5.1. The comparison must use the actual filtered Hodge sublattices, not a false equality of full V-lattices. ([A], Proposition 9.5.1, proof pp. 522–523; the full-lattice scaling assertion is corrected; A line 5607.)

One proof route is as follows. Compare rational CM quadratic representations and the archimedean Hodge metrics. Compute the integral filtered-line indices at each prime and normalize by the same stack degree. Prove the required correction on Hodge lines; use the filtered-line index rather than a scalar equality of full lattices.

A global rescaling by an element of F need not solve all full-lattice norm equations; the required conclusion is the filtered-line degree identity.

*Needs:* §4.1 auxiliary cm quadratic data; §4.2 gspin data and special divisors; §2.6 the standard cm quadratic line; §3.8 total reflex height and the standard line; AutomorphicBundles Layer B2.

### 4.3 Average height error on the CM cycle

For d≥2, auxiliary L, an enlargement L⋄ with positive definite complement of any rank and an admissible f as in §4.2c, prove that the normalized average of h_Falt−h_Col equals [E_error(f):Y]/(4 c_f(0,0) deg_C Y), modulo rational multiples of log p at primes bad for L. This uses the unscaled Faltings height and the actual vertical divisor, with the proper-intersection and nonzero-constant hypotheses retained. ([A], Proposition 9.5.1, pp. 522–523; A line 5642.)

One proof route inserts the total reflex height and analytic character identities into §4.2c, using the filtered Hodge-line adapter of §4.2d. The coefficient is 1/4: the Hodge degree enters the total reflex mean with that coefficient. A form with zero constant coefficient is inadmissible; bad-prime errors remain in the conclusion.

*Needs:* §4.2c hodge-height identity; §4.2d orthogonal hodge-line degree adapter; §3.8 total reflex height and the standard line; §0.3 average cm character.

### 4.4 Good data avoiding any finite prime set

Prove the following. For every finite set S of rational primes, auxiliary (a,ξ) and a compatible maximal L can be chosen good at every p∈S. In particular there are two choices with coprime bad-prime products. The arithmetic input is: Nm Cl(E)→Cl⁺(F) is surjective if E/F ramifies at a finite place, and otherwise has image ker χ_E/F. In the everywhere-finite-unramified case d is even and χ_E/F(d_F)=(-1)^(d/2). ([A], Proposition 9.5.2 and Lemmas 9.5.3–9.5.4, pp. 523–525; A line 5648.)

One proof route is as follows. Apply the narrow-class norm image theorem supplied by class field theory. Use the narrow-class different-character identity in the supplier contract to satisfy the sign obstruction in the unramified case. Choose ideal representatives avoiding S, solve the sign condition and glue the prescribed local lattices to a global maximal lattice.

*Needs:* §4.1 auxiliary cm quadratic data; ClassFieldTheory Layer 13 (gap:narrow-cm-norm-different); GeometryOfNumbersAndQuadraticArithmetic §§2.2, 2.7–2.9.

### 4.5 Eliminate each bad-prime coefficient

Prove the following. For d≥2, the average height discrepancy is zero. First put it in the ℚ-span of log p using two auxiliary choices with coprime bad sets. Then for each p choose p-good data, an embedding L⊂L⋄ with L⋄ self-dual at p and rank-two positive complement Λ, and a form f with nonzero constant term and negative support avoiding numbers represented by Λ_Q. Its vertical error divisor avoids the p-fiber. Unique factorization makes the rational log-prime coefficients independent, so each coefficient vanishes. Prove existence of the support-controlled modular form with integral principal part and c_f(0,0)≠0, together with the ambient maximal lattice self-dual at the prescribed p. Negative coefficients vanish whenever the positive index is represented by the rational complement lattice, including its denominator cosets. Merely choosing two disjoint bad sets does not remove an unrestricted vertical error. ([A], Theorem 9.5.5 and Theorem 9.5.6, pp. 525–526; A line 5723.)

One proof route is as follows. Compare the two supported expressions to get a global rational log-prime expansion. Use classification of quadratic spaces to select the p-self-dual enlargement. Apply prescribed-support Borcherds input and its good-prime divisor formula, then read off the p coefficient.

The proper-intersection and support hypotheses, p-self-duality, and c_f(0,0)≠0 are all necessary inputs; their existence is part of this target.

*Needs:* §4.3 average height error on the cm cycle; §4.4 good data avoiding any finite prime set; MetaplecticAutomorphicForms Layer 7.

### 4.6 The imaginary quadratic average

Prove the following. For d=1, E imaginary quadratic and either CM type, h_Falt(E,Φ)=−(L_f′/L_f)(0,χ_E)/2−log D_E/4−log(2π)/2. This is the classical Chowla–Selberg case in the unscaled metric. It supplies the degree-one branch where the signature and positive-complement argument of Layer 4 is unavailable. Prove the component-period-to-height normalization from [C], Theorem 0.3(ii), p. 631 (C line 297), and the quadratic period identity and height conversion in §0.6, pp. 632–633 (C lines 339–370); this is the degree-one endpoint, rather than an application of the d≥2 GSpin signature argument. ([A], §1.1, p. 392, remark preceding Theorem A; the classical input is cited there; A line 38.)

One proof route proves the classical CM elliptic period formula from the quadratic CM period relation, with its exact normalization. Convert to the stable height using the specified unscaled squared metric. Use conjugation invariance to obtain the same value for both types. Theorem 0.5 of [C] alone leaves an ambiguity in ℚ log 2; §0.6 includes the exact elliptic period calculation, including the dyadic contribution.

**Checks.**

- For E=ℚ(i), put R_Γ=Γ(1/4)/Γ(3/4). Then ℓ(0)=−log 4+2 log R_Γ, and the stated unscaled height is −log R_Γ−(1/2)log π. An undetermined rational multiple of log 2 cannot certify this value.

*Needs:* ArakelovGeometryAndAbelianHeights §§3.4–3.5; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10; §0.1 cm class functions and analytic heights; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27.

### Examples

With F_v=ℚ_p, E_v/F_v unramified quadratic and ξ=−p², the quadratic lattice p⁻¹O_E,v is maximal integral for ξNm and has rescaled norm a unit; ξO_E,v=p²O_E,v is a different lattice. The Hodge-line comparison must therefore use its actual filtered sublattice. For rational numbers a,b, a log 2+b log 3=0 implies 2^m3^n=1 after clearing denominators and hence m=n=0.

### Dependencies

§2.6 the standard cm quadratic line; §3.8 total reflex height and the standard line; AutomorphicBundles Layer B2; §0.3 average cm character; ArakelovGeometryAndAbelianHeights §§1.3, 1.11; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; GeometryOfNumbersAndQuadraticArithmetic §§2.2, 2.7–2.9; ClassFieldTheory Layer 13 (gap:narrow-cm-norm-different); ShimuraVarieties §§6.1–6.2; AbelianSchemesAndArithmeticModuli §§A4.3, A6.38; MetaplecticAutomorphicForms Layers 4–7; §2.4 cm bundles and crystals; §1.2 the compact integral level; §1.3 finite étale cm models; ArakelovGeometryAndAbelianHeights §§3.4–3.5; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10; §0.1 cm class functions and analytic heights; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27.

## Layer 5: Component heights and nearby types

### 5.1 CM component-height invariance

Prove the following. For maximal-order CM abelian varieties A,B with the same field E and type Φ, h(A,τ)=h(B,τ) for each τ∈Φ, using the imported torsion-free determinant line and its Hodge metric. Thus write h(Φ,τ). The assertion includes isogenous integral lattices and conjugation of the type; it does not assert invariance of arbitrary non-CM partial heights. ([Y], Theorem 2.2, pp. 544–546; Y line 464.)

One proof route is as follows. Connect the lattices by O_E-ideal isogenies and use the local rank-one CM p-divisible module. Compute each local component cokernel for the isogeny and its dual. Pair embeddings under complex conjugation in the sum over all p-adic embeddings; do not use a single conjugation element simultaneously at all p-adic places.

The determinant convention is that of ArakelovGeometryAndAbelianHeights §§4.6–4.8; local freeness required by its isogeny formula must be established, not inferred from a nonflat tensor quotient.

*Needs:* ArakelovGeometryAndAbelianHeights §§4.6–4.8; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; §0.2 cm-height invariance and colmez linearity; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4.

### 5.2 CM height decomposition

Prove the following. For a CM type Φ, let E_Φ be its trace reflex field and d_Φ, d_Φc the absolute norms over E_Φ of the relative discriminants of the selected and complementary reflex orders. Then h_YZ(Φ)−Σ_(τ∈Φ)h(Φ,τ)=−log(d_Φ d_Φc)/(4[E_Φ:ℚ]). Taking all 2^g types, their averaged discriminant correction is −log D_F/4. Apply the CM polynomial Hodge sequence only to monogenic local factors after unramified extension, and descend its Vandermonde determinant to the supplied torsion-free component lines; prove their agreement at ramified primes as part of this CM specialization. ([Y], Theorem 2.3, pp. 546–548; proof of Corollary 2.6, pp. 548–549; Y line 549.)

One proof route is as follows. Work over each actual local factor of O_E⊗O_σ and use the filtered rank-one CM module. Compute the determinant of the embedding-evaluation map as a Vandermonde discriminant. Sum local lengths and embeddings with the exact reflex degree; use the conjugate-pair discriminant factorization for the type average.

Local monogenic generators are chosen after the permitted unramified extension on each factor; O_E⊗ℤ_p is not assumed globally monogenic.

*Needs:* §5.1 cm component-height invariance; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; ArakelovGeometryAndAbelianHeights §§4.6–4.8; ArakelovGeometryAndAbelianHeights §§3.4–3.5; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10.

### 5.3 Nearby CM types and their height

Use the following definition. Two types Φ₁,Φ₂ of a degree-2g CM field are nearby when each difference Φ_i∖Φ_(3−i) is a singleton. Let τ_i be its unique member, so τ_i∈Φ_i and τ₂=cτ₁; the labels are attached to their endpoints, not read off the symmetric difference. For the unordered edge {Φ₁,Φ₂} set h_near=(h(Φ₁,τ₁)+h(Φ₂,τ₂))/2, both terms lying in the domain τ∈Φ of §5.1. Every type has g neighbors and the type cube has g·2^(g−1) unordered edges. ([Y], §2.2, p. 548; §1.2, p. 537; Y lines 674–677.)

One proof route is as follows. Identify a type with one choice in each conjugate embedding pair. Define adjacency by flipping precisely one pair. Check swapping endpoints exchanges the two summands and preserves the value.

Its API comprises:

- Nearby endpoints have a unique changed conjugate pair.
- h_near is invariant under swapping endpoints.
- There are g·2^(g−1) unordered edges and degree g at each vertex.
- An unordered pair of CM types differing at exactly one conjugate pair determines the two distinguished embeddings and their mean component height; the definition is independent of the ordering.
- A CM algebra isomorphism transports the type edge and component-height labels. Product additivity uses actual component heights; equality for arbitrary isogenous varieties is not an API rule.

Edges are counted once; nearby does not mean disjoint unless g=1.

**Checks.**

- For g=1 the two complementary types form one edge.
- For g=2 there are four vertices and four unordered edges, not eight.
- For g=2 opposite vertices have symmetric difference of size four and fail adjacency.
- For E=ℚ(i), Φ₁={i↦i} and Φ₂={i↦−i}, the definition forces τ₁=(i↦i) and τ₂=(i↦−i). The swapped labelling τ₁=(i↦−i), τ₂=(i↦i) also lists the symmetric difference and satisfies τ₂=cτ₁, but τ₁∉Φ₁, so h(Φ₁,τ₁) is undefined; a definition by symmetric difference alone does not determine the summands.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; §5.1 cm component-height invariance.

### 5.4 Average over nearby types

Prove the following. For g≥1, 2^(−g)Σ_Φ h_YZ(Φ)=2^(1−g)Σ_(unordered nearby edges)h_near−log D_F/4. Each component h(Φ,τ) occurs once as an endpoint contribution of an edge, and each edge height contains the factor 1/2. ([Y], Corollary 2.6, pp. 548–549; Y line 652.)

One proof route is as follows. Sum endpoint contributions over the type cube. Use the discriminant correction in the height decomposition. Divide by 2^g and check the endpoint factor two.

For g=1 the coefficient on its single edge is 1 and D_F=1.

*Needs:* §5.3 nearby cm types and their height; §5.2 cm height decomposition.

### Examples

The type cube has (vertices, unordered edges) equal to (2,1), (4,4), (8,12) in dimensions 1,2,3. Each component is counted once at an endpoint; multiplying the edge-height sum by 2 and dividing by 2^g gives the coefficient 2^(1−g). In dimension 2 the opposite vertices differ in four embeddings and are not nearby.

### Dependencies

ArakelovGeometryAndAbelianHeights §§4.6–4.8; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; §0.2 cm-height invariance and colmez linearity; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; ArakelovGeometryAndAbelianHeights §§3.4–3.5; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10.

## Layer 6: Corrected different-torsion comparison

### 6.1 Different-torsion graph datum

Use the following definition. For nearby types and a finite Galois number field K/ℚ containing the chosen E, take O_E-abelian varieties A₁,A₂,A with good reduction over O_K, A_i of type Φ_i. A different-graph datum is an O_E-isogeny f:A₁×A₂→A whose kernel is the graph of a specified O_E-isomorphism A₁[δ_E/F]→A₂[δ_E/F]. The different δ_E/F is an ideal, so ideal torsion is used without choosing a global generator. ([YE], Erratum, §1, Theorem 1, pp. 1–2; YE line 4.)

One proof route is as follows. Use the existing finite flat ideal-torsion and isogeny kernels. Record the two injective projections and their images as part of the graph condition. Distinguish the generic graph from its integral closure, whose extension is a theorem below.

Its API comprises:

- Ker f equals the graph of the specified ideal-torsion isomorphism.
- Both kernel projections identify the kernel with the respective different-torsion group.
- The datum pulls back to every finite extension preserving the O_E-actions.
- A specified O_E-linear isomorphism A₁[δ_E/F]≅A₂[δ_E/F] embeds its graph in A₁×A₂ and yields the finite-kernel quotient isogeny. Its graph is not selected from an unspecified existence theorem.
- Two such graph kernels agree iff their torsion isomorphisms agree, after the fixed projection identifications. Simultaneous O_E-isomorphisms of the two factors transport the graph by conjugating its specified map.

The datum is strictly stronger than merely requiring A to be O_E-isogenous to A₁×A₂.

**Checks.**

- If δ_E/F is the unit ideal, both ideal-torsion groups and the graph kernel are zero.
- For E=ℚ(√−3), F=ℚ, the relative different δ=(√−3) has norm 3 and O_E/δ≅𝔽₃. Over a field splitting the torsion, identify both A₁[δ] and A₂[δ] with C₃=ℤ/3. The graph of the identity has three elements, whereas the full product A₁[δ]×A₂[δ] has nine and is not a graph: its first projection is not injective.
- With the same identifications, the graphs of the two O_E-linear isomorphisms 1 and −1 are {(0,0),(1,1),(2,2)} and {(0,0),(1,2),(2,1)}. Each projects bijectively onto C₃ in both factors, yet (1,1) lies only in the first and (1,2) only in the second; projection images alone do not determine the specified graph, which is why the datum records the isomorphism.

*Needs:* §5.3 nearby cm types and their height; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.15–R07.2.16, R07.2.20.

### 6.2 CM torsion comparison modulo the different

Prove the following. For CM types Θ₁,Θ₂, the rank-one CM Breuil–Kisin modules over S⊗O_E have Frobenius multipliers given by the complementary-type Eisenstein products. Modulo δ_E/F these multipliers agree when the type is changed by conjugate-pair flips, since x−x̄ lies in δ_E/F. The resulting different-torsion group schemes are O_E-isomorphic, and every O_E-linear automorphism of their constant generic fiber extends over the valuation ring. This is valid also at p=2. In a residue-embedding decomposition semilinear Frobenius permutes embeddings; the linearized map is written with the correspondingly relabeled source. For the contraction choose n≥max(2,e_v). Once one integral different-torsion isomorphism is established, scalar units of O_E/δ_E/F extend every prescribed generic isomorphism; existence of an unspecified isomorphism would not determine the graph. ([YE], Erratum, §2, Theorem 2 and Propositions 4–5, pp. 3–9; YE line 73.)

One proof route is as follows. Apply the CM Kisin description of Propositions 4 and 5 with its coefficient embeddings and Frobenius variance fixed. Reduce the type factors modulo the different and construct the integral module isomorphism. Lift unit automorphisms of O_E/δ by the integral module action; use the full finite-flat classification including dyadic places.

Existence of one integral isomorphism is insufficient: the specified generic graph requires the automorphism-extension assertion.

*Needs:* §6.1 different-torsion graph datum; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, “Comparison with local reciprocity”.

### 6.3 Integral graph kernel and self-duality

Prove the following. After enlarging K to make the relevant different torsion constant, the finite flat kernel Q of the extended graph isogeny has both projections isomorphic to the integral A_i[δ_E/F] at every finite place. Thus it is the integral graph of the specified generic isomorphism. It is O_E-linearly isomorphic to its Cartier dual; the O_E-action factors through O_E/δ_E/F, where conjugation is trivial. ([YE], Erratum, §3, display (5) and proof, pp. 10–11; YE line 358.)

One proof route is as follows. Extend the generic isomorphism, using extension of its automorphism difference from a chosen integral one. Identify the graph closure with the kernel by finite-flat uniqueness. Apply the CM torsion comparison to A₁ and its dual, with conjugate type, to obtain self-duality.

No exact sequence of arbitrary Néron models is presumed from a generic isogeny.

*Needs:* §6.2 cm torsion comparison modulo the different; §6.1 different-torsion graph datum; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.15–R07.2.16, R07.2.20; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38.

### 6.4 Corrected nearby-height identity

Prove the following. For a different-graph datum, h_near(Φ₁,Φ₂)=(h(A₁,τ₁)+h(A₂,τ₂))/2=h(A,τ)/2, where A is viewed with its O_F-action and τ is the changed place of F. The target uses the integral graph and the proven relative determinant comparison at every finite place. It does not apply to a general O_E-isogenous A. Use the ramified determinant supplier contract on the actual relative/image Hodge lattices, and prove compatibility with the component-height normalization of §5.1. The raw embedding quotient sequence is not asserted exact. ([YE], Erratum, Theorem 1, p. 2; §3 proof, pp. 10–11; YE line 33.)

One proof route is as follows. Use product additivity to identify the component height on A₁×A₂. Use the integral graph’s self-duality and conjugation-trivial action. Apply the relative determinant cancellation, including its ramified comparison.

*Needs:* §6.1 different-torsion graph datum; §6.3 integral graph kernel and self-duality; ArakelovGeometryAndAbelianHeights §4.7 (gap:ramified-component-determinants); §5.3 nearby cm types and their height; ArakelovGeometryAndAbelianHeights §§3.4–3.5.

### 6.5 The actual quaternionic graph kernel

Prove the following. For B=E+Ej, jx=x̄j, a maximal O_B containing O_E and with no finite place ramified in both B and E, set Λ₁=O_E, Λ₂=Ej∩O_B and Λ₀=O_B. The induced isogeny from the two nearby CM complex tori to (V₁⊕V₂)/Λ₀ has kernel Λ₀/(Λ₁+Λ₂), with both projections identifying it with δ_E/F⁻¹Λ_i/Λ_i. At a division prime B, E/F is unramified and the kernel is zero. At a finite place where B splits, the graph is generated by (π−π̄)⁻¹(1−j_p) after a compatible local presentation. ([YE], Erratum, §1, pp. 2–3; YE line 33.)

One proof route is as follows. At split places identify O_B with End_OF(O_E) using the integral order, not just a compact subgroup. Calculate the intersection with E and Ej and the two quotient projections. At division places use unramifiedness of E/F and δ=1 locally; assemble the finite ideal-torsion graph.

The calculation includes split dyadic residue-field-𝔽₂ places and uses the embedded-order supplier contract.

*Needs:* §6.1 different-torsion graph datum; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; HilbertModularVarietiesAndShimuraCurves Layer R18.1 (gap:embedded-quaternion-orders); HilbertModularVarietiesAndShimuraCurves Layer R18.5.

### Examples

For F_v=ℚ_p(√p), p odd, the opposite-eigenvalue quotient of a rank-one lattice is O_L/(2√p), of length 1 when v_L(√p)=1. Its torsion-free quotient is zero. At p=2 use the same valuation computation: for ℚ₂(√2), v(2√2)=3, so the quotient has length 3. Neither generic exactness nor self-duality deletes these torsion lengths without the determinant comparison.

### Dependencies

§5.3 nearby cm types and their height; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.15–R07.2.16, R07.2.20; FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, “Comparison with local reciprocity”; ArakelovGeometryAndAbelianHeights §§3.4–3.5; ArakelovGeometryAndAbelianHeights §4.7 (gap:ramified-component-determinants); HilbertModularVarietiesAndShimuraCurves Layer R18.1 (gap:embedded-quaternion-orders); HilbertModularVarietiesAndShimuraCurves Layer R18.5.

## Layer 7: Quaternionic CM points and Hodge lines

### 7.1 Existence of the auxiliary quaternion datum

Prove the following. For every CM E/F of degree 2g there is a totally definite incoherent quaternion algebra 𝔹/A_F admitting A_E→𝔹, with at least two ramified places, no finite place ramified in both E and 𝔹, and a maximal finite adelic order containing Ô_E. Choose finite inert S with g+|S| odd and ≥3: S=∅ for odd g≥3, |S|=1 for even g, and |S|=2 for g=1. Put U=Ô_𝔹×. For each real τ, switching its invariant gives the coherent curve algebra B(τ). ([Y], §1.1–1.2, pp. 536–537; existence is implicit in the deduction of Theorem 1.1; Y line 120.)

One proof route is as follows. Use Chebotarev Layer 9 for Gal(E/F)≅C₂: its nonidentity Frobenius class has density 1/2, unchanged on removing any prescribed finite set, so choose enough unramified inert primes outside that set. Use the local embedding criterion and odd parity to form the incoherent datum. Embed the integral order locally into maximal orders and take their finite adelic product.

For g=1 two inert finite primes are necessary for this compact setup; containment of Ô_E in the order is stronger than containment of its unit group in a maximal compact.

**Checks.**

- For E=ℚ(i), the primes 3 and 7 are unramified inert, so S={3,7} gives g+|S|=3. Excluding either prime and any further finite set leaves density 1/2 and permits two replacements. For g=2 one inert prime gives 3; for g=3 the empty set already gives 3.

*Needs:* Chebotarev Layer 9; HilbertModularVarietiesAndShimuraCurves Layer R18.1 (gap:embedded-quaternion-orders); HilbertModularVarietiesAndShimuraCurves §§R18.2.12–R18.2.18; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27.

### 7.2 Quaternionic CM point and height

Use the following definition. For this datum let X=lim_U X_U with right 𝔹_f×-action. Use the compatible E×-fixed CM point P and its images P_U∈X_U(E^ab) from GrossZagierAndArithmeticHeights §0a.4, with its reflex-norm Artin action. Restrict the metrized Hodge bundle L̄_U to the Zariski closure P̄_U in the integral curve model and put h_L(P_U)=deĝ(L̄_U|P̄_U)/[F(P_U):F]. The archimedean metric is ||dz||=2 Im z. The value is constant on each Galois reciprocity orbit by functoriality of the metrized degree. Independence across all permitted CM points is a consequence of the quaternionic height formula in Layer 8; it is not assumed in this definition. ([Y], §1.2–1.3, pp. 537–539; Theorem 4.7 for the Hodge line, pp. 566–568; Y line 161.)

One proof route is as follows. Use the integral curve and canonical CM-point orbit from the curve and reciprocity owners. Restrict the actual Hodge line with its Petersson metric. Use field-degree and arithmetic-degree functoriality to show level and Galois compatibilities.

Its API comprises:

- The Galois action on P_U is the fixed Artin action on the actual CM-point orbit.
- The height is the indicated degree divided by [F(P_U):F].
- The analytic Hodge metric is ||dz||=2 Im z and pulls back along the permitted level maps.
- An E×-fixed point of the canonical tower yields its level image and the restricted hermitian ℚ-line on its closure. Define its height only after this point and line have been supplied.
- A finite extension of a definition field scales the arithmetic degree and the relative denominator by the same factor; the resulting height is unchanged. The permitted level pullbacks preserve this normalized value.

The denominator is relative to F; absolute height conventions must be converted explicitly.

**Checks.**

- In a normalization calculation take relative field degree 3 and arithmetic degree 6 log 2, giving height 2 log 2. A degree-two extension gives numerator 12 log 2 and denominator 6, again 2 log 2; leaving the numerator unchanged instead gives log 2. These numbers test the normalization, without specifying a CM point.
- When [F:ℚ]>1, replacing the denominator by [F(P_U):ℚ] changes the value by 1/[F:ℚ] and is rejected.
- For z=i and local section dz the norm is 2, not 1.

*Needs:* §7.1 existence of the auxiliary quaternion datum; GrossZagierAndArithmeticHeights §0a.4; ShimuraVarieties §§4.1–4.6; HilbertModularVarietiesAndShimuraCurves §§R18.2.12–R18.2.18; ArakelovGeometryAndAbelianHeights §§1.3, 1.11; AutomorphicBundles §B4.10.

### 7.3 CM and quaternionic Hodge lines

Prove the following. For the CM abelian variety A₀ over a good-reduction field K represented by the auxiliary PEL CM point, let N̄(A₀,τ) use the relative/image O_F Hodge determinants. Define N̄_U=L̄_U²(−d_𝔹). The target is an isometry N̄(A₀,τ)≅N̄_U|P̄_U⊗O_K. It includes the integral Kodaira–Spencer comparison at every prime and the complex Hodge/Petersson isometry; identifying raw ramified τ-quotients is a separate required theorem. The integral quaternionic Kodaira–Spencer line is supplied at ramified places; identify the CM relative/image determinant with that line using the ramified bridge contract. The O_B-linear tangent Hom has rank one at the varying place; the unconstrained O_E-linear Hom has rank two and does not define the same deformation problem. ([Y], Proposition 5.7, p. 577; Propositions 5.3–5.4 and Corollary 5.5, pp. 574–576; Y line 1807.)

One proof route is as follows. Use the PEL family and integral Kodaira–Spencer map. Identify determinants at unramified places and prove the ramified relative/image comparison at the remaining places. Compare the complex metric on dz and the determinant Hodge metric, tracking the finite discriminant twist.

*Needs:* §7.2 quaternionic cm point and height; ArakelovGeometryAndAbelianHeights §4.7 (gap:ramified-component-determinants); ArakelovGeometryAndAbelianHeights §§4.6–4.8; HilbertModularVarietiesAndShimuraCurves §§R18.2.12–R18.2.18; HilbertModularVarietiesAndShimuraCurves §§R18.2.17–R18.2.18 (gap:ramified-quaternionic-bridge); HilbertModularVarietiesAndShimuraCurves Layer R18.5; AutomorphicBundles §B4.10; PELModuli §§M3.9, M5, M6.9.

### 7.4 Average height from the quaternionic point

Prove the following. For maximal order U containing Ô_E as above, 2^(−g)Σ_Φ h_YZ(Φ)=h_L(P_U)/2−log(d_𝔹 D_F)/4. This uses the corrected nearby theorem only on the actual quaternionic graph kernels and includes the integral relative Hodge-line comparisons. ([Y], Theorem 1.6, p. 537; proof §5.3, pp. 576–577, with Erratum Theorem 1 replacing Theorem 2.7; Y line 161.)

One proof route is as follows. For each nearby edge use its coherent B(τ) and the actual maximal-order graph. Replace its nearby height by half the component height of the PEL family. Use the Hodge-line isometry and sum over the g distinguished real places, then insert the cube-average correction.

An arbitrary isogenous A cannot replace the quaternionic family.

*Needs:* §5.4 average over nearby types; §6.5 the actual quaternionic graph kernel; §6.4 corrected nearby-height identity; §7.3 cm and quaternionic hodge lines.

### Examples

For z=i and z=1+i, the Petersson norm of dz is 2. An extension of a CM point field by degree m takes deĝ L/n to m deĝ L/(mn). If g is odd and at least 3 choose no finite quaternion ramification; for g even choose one inert prime, and for g=1 choose two. The total ramification cardinalities are odd and at least 3, so switching one real place makes them even.

### Dependencies

Chebotarev Layer 9; HilbertModularVarietiesAndShimuraCurves Layer R18.1 (gap:embedded-quaternion-orders); HilbertModularVarietiesAndShimuraCurves §§R18.2.12–R18.2.18; HilbertModularVarietiesAndShimuraCurves §§R18.2.17–R18.2.18 (gap:ramified-quaternionic-bridge); AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27; ShimuraVarieties §§4.1–4.6; GrossZagierAndArithmeticHeights §0a.4; ArakelovGeometryAndAbelianHeights §§1.3, 1.11; AutomorphicBundles §B4.10; ArakelovGeometryAndAbelianHeights §4.7 (gap:ramified-component-determinants); ArakelovGeometryAndAbelianHeights §§4.6–4.8; HilbertModularVarietiesAndShimuraCurves Layer R18.5; PELModuli §§M3.9, M5, M6.9; §5.4 average over nearby types; §6.5 the actual quaternionic graph kernel; §6.4 corrected nearby-height identity.

## Layer 8: Quaternionic self-intersection and adjunction

### 8.1 Modified CM self-intersection

Prove the following. For the compact maximal-order quaternionic datum, e=[O_E×:O_F×] and the modified arithmetic self-intersection i₀ defined by the Gross–Zagier diagonal/Green-function contract, i₀(P,P)/e=(L_f′/L_f)(0,χ_E/F)+(1/2)log(d_E/F/d_𝔹). The modification, Green function, finite local lengths and unit factors use the imported Gross–Zagier normalization; i₀ is not the raw intersection of a horizontal divisor with itself. Use GrossZagierAndArithmeticHeights §§6.56, 7.15, 7.65–7.66 and 7.77, together with its normalization in §§0.1, 0.5 and 0.11. The noncuspidal contributions, including the S₂ compensation, are inputs rather than consequences of a cuspidal Gross–Zagier projection. ([Y], Theorem 9.1, pp. 624–628; §1.3, pp. 539–541 explains the kernel comparison; Y line 4201.)

One proof route is as follows. Import the parallel-weight-two analytic derivative and full geometric height decomposition with their noncuspidal terms, using the two auxiliary split-place test functions of GrossZagierAndArithmeticHeights §6.21. Compare their pseudo-theta expansions and use automorphy to isolate the dimension-zero term. Compute its local Whittaker and intersection terms, retaining e and both discriminants.

*Needs:* §7.2 quaternionic cm point and height; GrossZagierAndArithmeticHeights §§0.1, 0.5, 0.9–0.11; GrossZagierAndArithmeticHeights §§2.1, 2.9, 2.14; GrossZagierAndArithmeticHeights §§6.5–6.8, 6.21, 6.25, 6.56, 7.15, 7.65–7.66, 7.77; GrossZagierAndArithmeticHeights §§2.14, 7.28, 7.78.

### 8.2 Height of the quaternionic CM point

Prove the following. For the constructed compact maximal-order datum, h_L(P_U)=−(L_f′/L_f)(0,χ_E/F)+(1/2)log(d_𝔹/d_E/F). The value is independent of the chosen CM point and compatible with the integral Hodge-line convention above. ([Y], Theorem 1.7, p. 539; Theorems 9.1 and 9.3, pp. 624–635; Y line 241.)

One proof route is as follows. Use adjunction to replace i₀/e by −h_L. Substitute the modified self-intersection identity. Reverse both signs and check the discriminant quotient.

For the height bridge the d_𝔹 terms cancel exactly, regardless of the chosen auxiliary finite inert set.

*Needs:* §8.1 modified cm self-intersection; GrossZagierAndArithmeticHeights §7.78.

### Examples

Writing ℓ=ℓ(0), the two identities give i₀/e=ℓ+(1/2)log(d_E/F/d_𝔹)=−h_L, hence h_L=−ℓ+(1/2)log(d_𝔹/d_E/F). At elliptic ramification e=2 the horizontal pullback has multiplicity 2; an étale fiber would have multiplicity 1 and cannot justify this comparison.

### Dependencies

§7.2 quaternionic cm point and height; GrossZagierAndArithmeticHeights §§0.1, 0.5, 0.9–0.11; GrossZagierAndArithmeticHeights §§2.1, 2.9, 2.14; GrossZagierAndArithmeticHeights §§6.5–6.8, 6.21, 6.25, 6.56, 7.15, 7.65–7.66, 7.77; GrossZagierAndArithmeticHeights §§2.14, 7.28, 7.78; HilbertModularVarietiesAndShimuraCurves Layer R18.5.

## Layer 9: The averaged Colmez formula

### 9.1 The averaged Colmez formula

Prove the following. For every maximal-order CM field E/F with [F:ℚ]=g≥1, averaging over all 2^g types gives 2^(−g)Σ_Φ h_Falt(E,Φ)=−(L_f′/L_f)(0,χ_E/F)/2−log(D_E/D_F)/4−g log(2π)/2. Equivalently in the Yuan–Zhang metric the last term is absent. Imprimitive types are included. The individual Colmez conjecture is neither assumed nor proved. ([A], Theorem A, p. 392; Theorem 9.5.5, pp. 525–526; A line 38; [Y], Theorem 1.1, p. 535; corrected proof with Erratum Theorem 1; Y line 77.)

One proof route is as follows. Route A: for g≥2 use prime-by-prime error elimination and the analytic average; for g=1 use the classical case. Route Y: insert the quaternionic height into its bridge, cancel d_𝔹 and use d_E/F·D_F=D_E/D_F. Convert metrics once by h_YZ=h_Falt+g log(2π)/2. Either route proves the shared target; both constructions are targets, and either supplies the averaged theorem.

All types are counted; the logarithmic term has the unscaled-metric sign and factor.

*Needs:* §0.3 average cm character; §4.5 eliminate each bad-prime coefficient; §4.6 the imaginary quadratic average; §7.4 average height from the quaternionic point; §8.2 height of the quaternionic cm point; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10.

### Examples

Substitute h_L=−ℓ(0)+(1/2)log(d_𝔹/d_E/F) into the quaternionic bridge: h_L/2−log(d_𝔹D_F)/4=−ℓ(0)/2−log(d_E/FD_F)/4. Since d_E/FD_F=D_E/D_F, the auxiliary discriminant cancels. Converting from h_YZ subtracts g log(2π)/2 once.

### Dependencies

§0.3 average cm character; §4.5 eliminate each bad-prime coefficient; §4.6 the imaginary quadratic average; §7.4 average height from the quaternionic point; §8.2 height of the quaternionic cm point; ArakelovGeometryAndAbelianHeights §§2.1, 2.7, 2.10.

## Layer 10: Individual height bounds and distant isogenies

### 10.1 Relative CM class-number growth

The headline theorem `relative_class_number_growth` asserts the following. For every g≥1 and ε>0 there is C_g,ε>0 such that h_E/h_F≥C_g,ε D_E^(1/4−ε) for all degree-2g CM fields E/F. Class numbers are those of maximal orders. The constants may be ineffective. The CM regulator ratio is bounded above and below in terms of g using the unit index 1 or 2; it is not generally 1. ([T], §2.2, p. 382; T line 116.)

One proof route is as follows. Apply the fixed-degree Brauer–Siegel bounds to h_E R_E and h_F R_F. Cancel the regulators using the CM unit-index formula and bounded roots of unity. Use D_E=D_F² N(d_E/F)≥D_F², select smaller error exponents and absorb the bounded range.

The exponent is every value below 1/4, with uniform dimension constants and no GRH.

*Needs:* AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27; `NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`; `NumberField.classNumber_pos`; `NumberField.IsCMField.indexRealUnits_eq_one_or_two`.

### 10.2 Distant CM ideal isogenies

The headline theorem `distant_cm_isogenies` asserts the following. For every g≥1 and ε>0 there is c_g,ε>0 such that, for every CM field E of degree 2g and every complex abelian variety A of dimension g with a ring isomorphism ι:O_E≅End(A), there are a complex abelian variety B with a ring isomorphism κ:O_E≅End(B) and an isogeny A→B intertwining ι and κ, such that every isogeny f:A→B has degree at least c_g,ε D_E^(1/4−ε). The degree of an isogeny is the rank of its underlying finite flat scheme morphism at the identity point of B, Mathlib's `AlgebraicGeometry.Scheme.Hom.finrank`; an isogeny is finite and surjective between smooth varieties of the same dimension, hence flat, and over ℂ this rank is the order of the kernel. The ring identification makes A simple with End⁰(A)=E, so A has primitive CM by the maximal order; the intertwining isogeny gives B the same CM type. Every isogeny A→B is then O_E-linear, since it differs from the intertwining one by an element of End⁰(A)=E; so the bound covers all complex isogenies. Polarizations on B are not fixed in advance. The constant may be ineffective. ([T], §2.2, the ideal-isogeny correspondence and Proposition 2.2, p. 382; T lines 142–151.)

One proof route is as follows. Identify the fixed-type class with the maximal-order ideal-class torsor, the isogeny attached to a nonzero integral ideal I having degree N(I). Count degree≤X isogeny targets by integral ideals, using AnalyticNumberTheoryPartI §3.27’s uniform fixed-degree X^(1+ε) ideal-count bound. Compare with h_E≥h_E/h_F and choose X of the required exponent; adjust the ε budget. Over the finitely many fields of bounded discriminant and degree 2g, reduce c_g,ε so that the bound is at most 1, the degree of every isogeny being at least 1.

The quantifier fixes A first. The baseline coarse X² ideal count alone loses the required 1/4 exponent. The dimension hypothesis is what makes A a CM abelian variety: a very general member of the unitary family of signature (2,1) attached to an imaginary quadratic field K is a simple threefold with End(A)≅O_K and no CM.

**Checks.**

- For E=ℚ(i), A=ℂ/ℤ[i] and the ideal (1+i), the quotient by the kernel (1+i)⁻¹ℤ[i]/ℤ[i] is an O_E-linear isogeny of degree 2=N(1+i); multiplication by 2 has degree 4, not the lattice multiplier 2, and the identity has rank 1 at the identity point.
- For ℚ(i) and ℚ(√−3), h_E=1, so B=A and the identity isogeny gives the minimum degree 1; with ε=1/8 and c=4^(−1/8) the lower bounds are 4^(−1/8)·4^(1/8)=1 and 4^(−1/8)·3^(1/8)≈0.9647, both at most 1.
- For ε≥1/4 the exponent is nonpositive and the statement reduces to degrees being at least a constant at most 1; the content lies in small ε, where h_E/h_F grows at least like a constant times D_E^(1/4−ε).

*Needs:* §10.1 relative cm class-number growth; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; AbelianSchemesAndArithmeticModuli §§A6.1, A6.4–A6.5, A6.8, A6.37; AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27; `NumberField.card_ideal_absNorm_le`; `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti.AlgebraicGeometry.AbelianVariety.End`; `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; `AlgebraicGeometry.Scheme.Hom.finrank`.

### 10.3 Individual CM heights are subpolynomial

Prove the following. For every g≥1 and ε>0 there is C_g,ε>0 such that h_Falt(E,Φ)≤C_g,ε D_E^ε for every maximal-order CM pair (E,Φ) with [E:ℚ]=2g, including imprimitive types. If b_g∈ℝ is the uniform lower bound on dimension-g stable heights, then h_Falt(E,Φ)≤2^g mean_Ψ h_Falt(E,Ψ)−(2^g−1)b_g. No positivity of b_g or absolute-value upper bound on each height is assumed. The imported quadratic functional equation gives mean h_Falt=(log(D_E/D_F))/4+ℓ(1)/2−gγ/2−g log(2π), with Euler’s constant γ. Combine |ℓ(1)|≤C_g,εD_E^ε with log D_E≤C_εD_E^ε and the uniform real lower bound. Positivity of a stable height is not assumed. ([T], Corollary 3.3, pp. 383–384, with its averaging proof and corrected sign convention; T line 157.)

One proof route is as follows. Apply the lower bound to each of the other 2^g−1 heights. Subtract those terms from the total average. Use the quadratic Hecke estimate and absorb the real lower constant.

The proof must pass with a negative lower constant; primitivity is needed in the distant-isogeny argument of §10.2.

*Needs:* Layer 9 averaged Colmez; AnalyticNumberTheoryPartI §§2.31f, 2.44–2.45; ArakelovGeometryAndAbelianHeights §6.5; §0.2 cm-height invariance and colmez linearity.

### Examples

For m=2 and a lower bound b=−1, the heights (−1,3) have mean 1 and the upper inequality gives h₂≤2·1−(2−1)(−1)=3. For a sextic CM field the regulator ratio is 4/Q_E, hence 4 or 2. Quadratic fields ℚ(i) and ℚ(√−3) have relative class number 1 and discriminants 4 and 3.

### Dependencies

AnalyticNumberTheoryPartI §§2.31d–2.32, 2.44–2.46, 3.27; `NumberField.IsCMField.regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv`; `NumberField.classNumber_pos`; `NumberField.IsCMField.indexRealUnits_eq_one_or_two`; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; AbelianSchemesAndArithmeticModuli §§A6.1, A6.4–A6.5, A6.8, A6.37; `NumberField.card_ideal_absNorm_le`; `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti.AlgebraicGeometry.AbelianVariety.End`; `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; `AlgebraicGeometry.Scheme.Hom.finrank`; Layer 9 averaged Colmez; ArakelovGeometryAndAbelianHeights §6.5; §0.2 cm-height invariance and colmez linearity.

## Layer 11: Primitive CM Galois orbits

### 11.1 A common polarized definition field

Prove the following. Given a polarized dimension-g primitive maximal-CM A with polarized coarse moduli field F_A, use the bounded polarized definition field F′_A of PELModuli §M6.8. For B=A/T_I chosen by an ideal kernel over F′_A, choose n killing T_I and g₀:B→A with g₀f=[n]; equip B with g₀*λ_A. Then F_B⊂F′_A, and F′_A F′_B defines both with degree over F_A≤4·3^(8g²). The originally supplied polarization on an unrelated B is not retained. ([T], Lemma 4.1 and proof of Theorem 4.2, pp. 384–385, with polarized-moduli and quotient-polarization corrections; T line 211.)

One proof route is as follows. Apply PELModuli §M6.8, then form the invariant ideal kernel and quotient over its definition field. Factor [n] through the quotient and pull back the polarization on A along g₀. Apply the same rigidification bound to the new polarized B and take the compositum.

An unpolarized moduli field alone is not used as an unconditional fine moduli descent theorem.

**Checks.**

- For g=1 the rigidification bound is 2·3⁴=162 and the displayed common-field bound is 4·3⁸=26244.
- In E=ℚ(i,√2), the unit u=(1+√2)^8=577+408√2 satisfies u≡1 modulo 3 while u≠1 and uū=u²≠1. It gives an unpolarized automorphism invisible on 3-torsion, and fails the polarization-preservation equation.
- For f=[2] on an elliptic curve, the factorization g₀f=[2] can use g₀=identity and leaves λ_A unchanged; an unrelated quotient polarization is extra data.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; PELModuli §§M6.1, M6.8, M6.10; FaltingsFinitenessAndIsogenyTheoremsPartII QI.5, “Geometric isogeny estimate”.

### 11.2 Primitive orbit exponent budget

Prove the following. Let κ_g>0 be the dimension-g geometric isogeny exponent. For every 0<δ<1/(4κ_g), the distant-isogeny lower bounds, individual height bounds and common-field bound imply [F_A:ℚ]≥c_g,δ D_E^δ. Choose δκ_g<a<1/4 and height exponent ε<a/κ_g. For sufficiently large D_E the term D_E^ε cannot account for a lower isogeny degree cD_E^a in the maximum max(1,h_Falt(A),[k:ℚ])^κ_g, forcing its field-degree term. ([T], Proof of Theorem 4.2, p. 385; explicit exponent and bounded-range adapter; T line 250.)

One proof route is as follows. Choose a and ε in the stated order, allowing the constants to depend on them. Apply the geometric isogeny theorem over the common field to the B chosen for the fixed A. For large discriminant eliminate the constant and height terms; use the bounded field-degree ratio. Reduce the positive lower constant to cover the bounded discriminant range using [F_A:ℚ]≥1.

The maximum contains 1; negative small Faltings heights cannot make it invalid.

*Needs:* §10.2 distant cm ideal isogenies; §10.3 individual cm heights are subpolynomial; §11.1 a common polarized definition field; FaltingsFinitenessAndIsogenyTheoremsPartII QI.5, “Geometric isogeny estimate”.

### 11.3 Primitive maximal-CM orbit bound

Prove the following. For every g≥1 there are c_g,δ_g>0 such that a polarized dimension-g A with primitive O_E-CM and End(A_C)=O_E satisfies [F_A:ℚ]≥c_g D_E^δ_g. Here F_A is the field of its polarized coarse moduli point, so in characteristic zero its degree is the cardinality of the absolute Galois orbit of that point. The field need not itself define A. ([T], Theorem 1.2, p. 379 and Theorem 4.2, p. 385, interpreted through polarized coarse moduli; T line 4.)

One proof route is as follows. Take any fixed admissible δ in the exponent budget. Use geometric simplicity and full endomorphisms from the primitive maximal-CM classification. Identify the coarse-point degree with its Galois orbit, retaining the separate bounded definition-field extension.

The theorem makes no equality between moduli fields and fields of definition.

*Needs:* §11.2 primitive orbit exponent budget; PELModuli §§M6.1, M6.8, M6.10.

### Examples

For κ=2 and δ=1/16 choose a=3/16 and ε=1/32. Then δκ=1/8<a<1/4 and εκ=1/16<a. The powers contributed by the height and by a hypothetical field degree ≤D^δ are both below a. In the bounded discriminant range the coarse degree is at least 1, permitting a smaller positive uniform constant.

### Dependencies

ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; PELModuli §§M6.1, M6.8, M6.10; FaltingsFinitenessAndIsogenyTheoremsPartII QI.5, “Geometric isogeny estimate”; §10.2 distant cm ideal isogenies; §10.3 individual cm heights are subpolynomial.

## Layer 12: General CM orders and Galois orbits

### 12.1 The center order of a CM point

Use the following definition. For a principally polarized CM point x∈A_g(ℚ̄), put R_x=Z(End(A_x)). After an isogeny decomposition A_x∼∏_i A_i^n_i into pairwise nonisogenous simple CM factors, R_x is a full order in E_x=∏_i K_i with maximal order O_x=∏_i O_Ki. A repeated isotypic power contributes its field once; nonisogenous factors with isomorphic abstract CM fields retain separate factors. Set D_x=|disc_Z R_x| using the trace form on E_x, and J_x=[O_x:R_x]. Use the full-order discriminant contract to obtain D_x=J_x²∏D_Ki, including an order that couples the product factors. This equality involves J_x, whereas the Mumford–Tate compact index I_x enters only the separate comparison in §12.3. ([T], §5, p. 385; T line 250; [T12], §7.1–7.2, preprint pp. 15–18; T12 line 596.)

One proof route is as follows. Use complete reducibility to identify End⁰ with a product of matrix algebras over CM fields. Take its center and intersect the integral endomorphism order. Use the native trace discriminant of the full ℤ-order, not the discriminant of one selected maximal field.

Its API comprises:

- R_x has full rank in E_x and finite index in O_x.
- D_x is the absolute determinant of the integral trace pairing on any ℤ-basis.
- For a maximal-order simple A, the center of End(A^n) is O_E, with no n-fold field repetition.
- Take the center of the actual integral End ring, embed it in the center of End⁰, and transport it through the isotypic decomposition. Rational identification does not replace this integral order by its integral closure.
- Changing a ℤ-basis or permuting the isotypic factors preserves |disc R_x| and [O_x:R_x]. An isomorphism of polarized abelian varieties induces the compatible order isomorphism.

The invariant is unchanged under geometric isomorphism and Galois conjugation.

**Checks.**

- For a CM elliptic curve of conductor f in E, D_x=f²D_E.
- For A₀^n with A₀ simple CM, Z(End⁰(A₀^n)) is one CM field. The integral center is Z(End(A₀)), an order, and equals O_E only when End(A₀)=O_E; it is never an n-fold product.
- Two nonisogenous simple CM factors with isomorphic underlying fields still give two center factors.

*Needs:* AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; GlobalNumberFields Layer 11 (gap:etale-order-discriminant).

### 12.2 Primitive reciprocity image from the absolute orbit

Prove the following. For a primitive degree-2h CM type, let r:Cl(E*)→Cl(E) be its reflex ideal map and r̃=r∘Nm_L/E* for a normal closure L. There are dimension-only factors comparing |im r| with the absolute polarized moduli orbit of a maximal-CM realization. The relative marked orbit over E* is Cl(E*)/H, with H⊂ker r and [ker r:H]≤2^h. Passing to the absolute unmarked point changes sizes by at most the reflex degree and the finite number of CM markings, both bounded in h. Therefore the primitive absolute orbit bound gives a power lower bound on |im r|. The norm contract gives |im(r∘Nm_L/E*)|≥|im r|/[L:E*]; the normal-closure degree is at most (2h)!, so the positive discriminant power survives. ([T], §5, p. 386, with relative/absolute and marked/unmarked orbit corrections; T line 289.)

One proof route is as follows. Use the actual polarized reciprocity action. For arbitrary polarization data (I,ξ), a principal reflex image (u) fixes the polarized lattice precisely when its positive norm multiplier is uū up to a real unit norm. Thus the stabilizer quotient injects into the group of totally positive units of O_F modulo Nm O_E×, of size at most 2^h. This proves the needed nonprincipal-polarization extension of the principal supplier statement. Bound the forgetful fiber by the embeddings E→End⁰(A)=E, hence by |Aut_Q E|≤2h. Compare relative and absolute point degrees via the compositum with E*, whose degree is bounded by (2h)!. Choose a maximal-CM polarized realization and apply the primitive orbit lower bound.

The source’s direct equality [ℚ(A):ℚ]=|Cl(E*)/H| is not used. A principally polarized maximal-CM realization need not exist for an arbitrary type. Choose a polarization of any type and derive its stabilizer equation from the lattice data before applying the unit bound.

*Needs:* §11.3 primitive maximal-cm orbit bound; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; PELModuli §§M6.1, M6.8, M6.10; IntegralIwasawaTheory §3.4 (`classNorm_cokernel`, n=0).

### 12.3 The CM compact-index comparison

Prove the following. Let T_x be the Mumford–Tate torus in its actual integral GSp representation, K_x=T_x(A_f)∩GSp_2g(Ẑ), and I_x=[T_x(Ẑ):K_x], with T_x(Ẑ) maximal compact. There exist c_g,d_g>0 with J_x≤I_x^c_g(∏_i D_Ki)^d_g. Keep the field-discriminant factor. The proof includes ramified primes and p=2; exponential arguments there start sufficiently deep in the p-adic filtration. ([T12], Tsimerman (2012), Lemmas 7.2–7.5, preprint pp. 18–20; T12 line 728.)

One proof route is as follows. Use inequivalence of the primitive isotypic CM types to show T_x(ℚ) generates the entire product center algebra. Choose a local primitive element from the differential of reciprocity, controlling its index by bounded-degree local discriminants. For a compact-index p-part p^n, take exp(p^Nα) with N≥n+C_g and N≥2 at p=2; its powers lie in the lattice stabilizer. Use the Vandermonde determinant and Nakayama to bound the center-order local index, then multiply over primes.

A p-adic exponential is not assumed convergent on pℤ_p when p=2.

**Checks.**

- For the Gaussian elliptic order R=ℤ+3ℤ[i], J=3 and D_x=3²·4=36. Its Mumford–Tate torus is Res_E G_m; at 3 the compact quotient is O_E,3×/R_3×≅𝔽₉×/𝔽₃×, of size 8/2=4, and at every other prime the index is 1. Thus I=4 and I²D_E=64≠36; the discriminant identity uses J.
- At p=2, the terms of exp(2) with indices n=2,4,8 have valuations n−v₂(n!)=1,1,1 and do not tend to zero. For exp(4), the same valuations are 2n−v₂(n!)=3,5,9, consistent with convergence on 4ℤ₂.

*Needs:* §12.1 the center order of a cm point; ShimuraVarieties §§4.1–4.6; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38.

### 12.4 Reduction of general CM points to primitive fields

Prove the following. Fix g. Suppose every primitive degree-2h type for each 1≤h≤g has |im r̃|≥c_h D_E^δ_h with δ_h>0. Then every principally polarized CM point x∈A_g has |Gal(ℚ̄/ℚ)·x|≥c_g D_x^δ_g for some c_g,δ_g>0. This includes nonmaximal center orders, imprimitive types and repeated simple factors; the smaller-dimensional primitive inputs are all required. Write P=∏D_Ki. The primitive-factor estimates bound |im r_T| below by a positive power of P, using the bounded number of factors. Prove from the local compact-index estimates that B_g^(#S)≥c_g,η(I_xP)^(−η) for every η>0, then choose η below both positive exponents; this absorbs the bad-prime loss. Combine with J_x≤I_x^c P^d and D_x=J_x²P. Treat I_x=P=1 by a positive constant. This absorption is required: a fixed B_g<1 cannot simply be discarded. ([T12], Theorem 7.1 and equations (4)–(5), preprint pp. 17–20; T12 line 689; [T], §5, pp. 385–386; T line 250.)

One proof route is as follows. After a dimension-bounded rigid level change use injectivity of the torus orbit into the Siegel moduli orbit. Project reciprocity to each primitive simple factor and use the bounded norm cokernel. Use the torus orbit estimate with I_x and its B^(number of bad primes) factor; absorb that factor with arbitrarily small power losses. With the supplier’s notation the lower bound is c_g B_g^(#S) I_x |im r_T| with 0<B_g≤1. Combine the field-discriminant lower bound with the compact-index comparison and D_x=J_x²∏D_Ki.

No hypothesis is restricted to primitive types only in dimension exactly g; all h≤g are included.

*Needs:* IntegralIwasawaTheory §3.4 (`classNorm_cokernel`, n=0); §12.3 the cm compact-index comparison; GlobalNumberFields Layer 11 (gap:etale-order-discriminant); ShimuraVarieties §§4.1–4.6 (gap:quantitative-cm-torus-orbit); PELModuli §§M6.1, M6.8, M6.10.

### 12.5 Galois-orbit bound for every CM point

Prove the following. For every g≥1 there are C_g,b_g>0 such that D_x≤C_g |Gal(ℚ̄/ℚ)·x|^b_g for every CM point x∈A_g(ℚ̄). Equivalently the absolute polarized coarse orbit has a uniform positive-power lower bound in the center-order discriminant. This is unconditional in all dimensions; it does not retain the older g≤6 or GRH restriction. ([T], Theorem 5.2, pp. 385–386; T line 250; [PT14], Conjecture 7.1, p. 673; PT14 line 642.)

One proof route is as follows. Apply the primitive orbit theorem in every dimension h≤g. Convert the primitive moduli orbit to the normal-closure reciprocity image. Apply general orbit reduction and invert its positive exponent.

The discriminant is D_x for the full center order, not only D_E for a maximal primitive field.

*Needs:* §11.3 primitive maximal-cm orbit bound; §12.2 primitive reciprocity image from the absolute orbit; IntegralIwasawaTheory §3.4 (`classNorm_cokernel`, n=0); §12.4 reduction of general cm points to primitive fields.

### Examples

For an elliptic order ℤ+2ℤ[i], J=2 and D_x=2²·4=16. For Bⁿ with B simple and End(B)=O_E the center is O_E once; for two nonisogenous simple factors the center algebra is the product of two fields, even when those fields are abstractly isomorphic. The compact index I is used in an inequality for J, never in the discriminant identity.

### Dependencies

AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2; GlobalNumberFields Layer 11 (gap:etale-order-discriminant); IntegralIwasawaTheory §3.4 (`classNorm_cokernel`, n=0); §11.3 primitive maximal-cm orbit bound; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; PELModuli §§M6.1, M6.8, M6.10; ShimuraVarieties §§4.1–4.6 (gap:quantitative-cm-torus-orbit).

## Layer 13: CM lift heights and bounded-degree finiteness

### 13.1 Uniform degree of CM period coordinates

Prove the following. For fixed g, the complex entries of a CM period matrix Z representing a point of A_g lie in a normal closure of the product center algebra, of degree at most (2g)!. The real and imaginary entries lie after adjoining i, so each has degree at most d_g=2·(2g)!. Integral symplectic fractional transformations preserve the complex field; taking real and imaginary parts is accounted for separately. This safe bound suffices, with no claim that each coordinate has degree≤2g. In a rational symplectic basis the CM Hodge plane is defined over the normal closure of the product center algebra; its normalized graph has entries in that field. Integral fractional transformations have nonzero denominator det(CZ+D) on Siegel space. Complex conjugation preserves the normal closure; adjoining i suffices for real and imaginary parts. ([T], §6.2, p. 387, using the corrected splitting-field degree adapter; T line 327; [PT], §3, preprint pp. 3–9; PT line 80; [PT14], Lemma 7.4 and proof, p. 675; PT14 line 719.)

One proof route is as follows. Express the polarized CM torus in rational homology coordinates using the product CM embedding matrices. Take the compositum of the normal closures, whose Galois group acts on at most 2g center embeddings. Compute the period matrix by linear algebra over that splitting field, then adjoin i for its real/imaginary coordinates.

For real/imaginary coordinates the field is enlarged by i; degree and height conventions are shared with the height theorem.

*Needs:* §12.1 the center order of a cm point; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38.

### 13.2 A bounded basis for CM lattices

Prove the following. Fix g. If I⊂O_E is a full ℤ-lattice for a degree-2g CM field, it admits a ℤ-basis whose conjugates are bounded by a polynomial in D_E[O_E:I]. If I has multiplier order R, first scale it by ν∈E× so that νI⊂O_E and [O_E:νI] is polynomially bounded in |disc R|. In the canonical C^g embedding, covolume(I)=2^(−g)√D_E[O_E:I]. Nonmaximal lattices need not be invertible O_E-ideals. For an arbitrary full lattice in E with multiplier order R, put J=O_EI and e_R=[O_E:R]; then e_RJ⊂I⊂J and [J:I]≤e_R^(2g). Scale the ideal J by the Minkowski representative bound before applying successive minima. This keeps the order index throughout, without assuming I invertible over O_E. ([PT], Pila–Tsimerman (2013), Lemmas 3.2–3.3, preprint pp. 3–5; PT line 80.)

One proof route is as follows. Apply the ideal-class bound to J=O_E I and use [O_E:R]J⊂I⊂J for scaling. Use the corrected covolume and the norm lower bound for a nonzero integral vector. On the trace form β(x,y)=Tr_E/ℚ(x̄y) of rank n=2g, the lower bound λ₁≥2g and Minkowski's second theorem give λ_i≤γ_n^n D_E[O_E:I]²/(2g)^(n−1) for every squared minimum; pass to the real minima √λ_i, take the basis from the minima, and bound each conjugate by |σ(b)|²≤β(b,b).

For ℚ(i), O_E has covolume 1: 2⁻¹√4=1; the printed discriminant without its square root gives 4.

*Needs:* ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; SuccessiveMinima Layer 1; IntegralLattices milestone 2F; HeightsAndUnits §2.1; GeometryOfNumbersAndQuadraticArithmetic §1.2; GlobalNumberFields Layer 11; `TauCeti.IntegralLattice.successiveMinimum_le_iff`; `TauCeti.IntegralLattice.IsPosSemidef.exists_linearIndependent_integralNorm_eq_successiveMinimum`; `NumberField.exists_ideal_in_class_of_norm_le`; `NumberField.mixedEmbedding.covolume_integerLattice`; `ZLattice.covolume_div_covolume_eq_relIndex'`.

### 13.3 CM period height under Siegel reduction

Prove the following. Fix g and the chosen standard Siegel fundamental set F_g. Starting with the order-sensitive CM lattice and principal Riemann form, construct a symplectic period matrix whose coordinate heights, real sizes and reciprocal imaginary determinant are polynomial in D_x. A symplectic integral reduction into F_g preserves a polynomial bound on the algebraic coordinate heights. The reduction input uses h₀(Z)=max(max_ij|z_ij|,1/det Im Z); this analytic size is distinct from algebraic Weil height. Retain e_R=[O_x:R_x] in the product-decomposition isogeny and the hermitian balancing of every repeated block. Only the final polynomial in D_x absorbs these indices. A bound depending just on the maximal algebra discriminant does not control this step. ([PT], Pila–Tsimerman (2013), §3, Lemmas 3.4–3.7, preprint pp. 5–9; PT line 160.)

One proof route is as follows. Balance the positive polarization using a bounded totally imaginary element and the unit action, retaining its multiplier order. For repeated simple factors use the quantitative hermitian lattice contract on the full isotypic lattice, retaining the finite index [L:Σ_i Rv_i]; the independent vectors need not give a unimodular R-basis. Glue distinct factors with the center-order index bound. Use the owner’s Siegel reduction matrix estimate polynomial in h₀, together with algebraic height rules for sums, products and inverses.

For the general-lattice index argument use disc R, not the discriminant of the maximal algebra independent of its order. More precisely, the center-order product decomposition gives a sublattice of polynomial index in the original principally polarized lattice. The restrictions ψ to its isotypic blocks are integral alternating forms with positive determinants bounded by that index squared. On a block L⊂E^r with conjugation-stable acting order R, choose an integral totally imaginary ζ with the CM-type signs making h=ζH_ψ positive definite, where ψ=Tr_E/ℚ H_ψ. The bounded-element argument of [PT], preprint p. 9 (PT lines 353–379), bounds every conjugate of ζ by a power of D_x; since ζ is a nonzero algebraic integer, the norm product also bounds every conjugate of ζ⁻¹ by a power of D_x. Take N=[O_E:R], so Nζ∈R and q=N Tr h is integral on L. In rank 2nr over ℤ, det Gram_L(q)=N^(2nr)|Nm_E/ℚ(ζ)|^r det Gram_L(ψ). Thus |disc R|, N and this determinant, and hence the balancing parameter D, are polynomial in D_x. Apply the independent-vector argument of [PT], Lemma 3.7, preprint p. 9 (PT lines 362–385), with its finite index bounded by the quantitative supplier contract.

**Checks.**

- For R=L=ℤ[i], h_m(x,y)=m x̄y and integer m≥1, N=1 gives Gram_L(q)=diag(2m,2m) and determinant 4m². The vector 1 has h_m(1,1)=m and index 1; a rank-only bound fails as m grows.
- For R=ℤ[i], L=2ℤ[i] and h(x,y)=x̄y, N=1 gives Gram_L(q)=diag(8,8), determinant 64, and v₁=2 has hermitian entry 4 and index [L:Rv₁]=1.
- In L=ℤ[i] the independent vector 2 instead spans index 4, so independence does not imply unimodularity. With ψ(x,y)=Im(x̄y), ζ=i and H_ψ(x,y)=−i x̄y/2, h=x̄y/2 and q=Re(x̄y); det Gram(q)=1=|Nm(i)| det Gram(ψ). Changing ζ to −i makes q negative definite and violates the positivity hypothesis.
- In genus one, for an integer M≥1 the matrix ((1,−M),(0,1)) sends Z=M+i to i, with h₀(Z)=√(M²+1) and largest matrix entry M. The matrix ((0,−1),(1,0)) sends Z=i/M to iM, with h₀(Z)=M and largest entry 1. Both have determinant 1; the reduction matrix must account for translations as well as inversion.

*Needs:* §13.2 a bounded basis for cm lattices; §13.1 uniform degree of cm period coordinates; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; GeometryOfNumbersAndQuadraticArithmetic §2.7 (gap:quantitative-siegel-hermitian-reduction; gap:quantitative-hermitian-lattice-balancing); AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38.

### 13.4 Polynomial height of CM lifts

Prove the following. For every g≥1 there are C_g,a_g>0 such that each CM point x∈A_g has a representative Z∈F_g with max(1,max_ij H_abs(Z_ij),max_ij H_abs(Re Z_ij),max_ij H_abs(Im Z_ij))≤C_g D_x^a_g. H_abs is absolute multiplicative Weil height. Together with coordinate degree≤2·(2g)!, this is equivalent up to dimension-only powers to the naive algebraic-coordinate height convention needed for counting. ([PT], Theorem 3.1, preprint pp. 3–9; PT line 80; [T], §6.2, p. 387; T line 327.)

One proof route is as follows. Apply bounded CM period construction and symplectic reduction. Convert the complex-coordinate height to real and imaginary heights using conjugation and adjoining i. Use the uniform degree bound to compare multiplicative Weil height with primitive integral minimal-polynomial coefficient height; absorb the fixed powers.

The same coordinate and height convention is used in the Northcott consumer; analytic h₀ is not substituted for H_abs.

*Needs:* §13.3 cm period height under siegel reduction; §13.1 uniform degree of cm period coordinates; HeightsRationalPointsAndObstructions §§0.11–0.13, 0.16; DiophantineApproximationAndTranscendence §§0.2–0.3.

### 13.5 Finiteness of CM points of bounded moduli degree

Prove the following. For every g≥1 and N≥1, only finitely many CM points x∈A_g(ℚ̄) satisfy [ℚ(x):ℚ]≤N. The field is the polarized coarse moduli field. The general orbit bound bounds D_x by C_g N^b_g, then the lift-height and coordinate-degree bounds put all chosen representatives in a finite Northcott set. Thus any family with uniformly bounded moduli degrees contains only boundedly many distinct CM points, as used by Masser–Zannier; no bound on multiplicities in a parameterization is asserted. ([MZ], §5.4, p. 667; MZ line 1400; [PT14], Lemma 7.4 and proof, p. 675; PT14 line 719; [T], Theorem 5.2, pp. 385–386; T line 250.)

One proof route is as follows. Identify the absolute orbit size with the coarse-point degree. Bound the center-order discriminant and hence each real/imaginary coordinate height of a chosen lift. Apply Northcott to the fixed finite number of coordinates of uniformly bounded degree; map the finite tuple set to A_g.

The conclusion is unconditional for all g using the 2018 orbit theorem; no Jacobian or isogeny-counting theorem is used.

*Needs:* §12.5 galois-orbit bound for every cm point; §13.4 polynomial height of cm lifts; §13.1 uniform degree of cm period coordinates; HeightsRationalPointsAndObstructions §§0.11–0.13, 0.16; DiophantineApproximationAndTranscendence §§0.2–0.3.

### Examples

The safe real-coordinate degree bounds 2(2g)! are 4 for g=1 and 48 for g=2. A signed-permutation sextic CM type can have an orbit of size 8>6, refuting a joint degree bound 2g. For I=ℤ[i]⊂ℂ the covolume is 2⁻¹√4=1. Given moduli degree at most N, the orbit bound first gives D_x≤C_gN^b_g and then H_abs of each bounded-degree coordinate is bounded, so Northcott yields finitely many tuples.

### Dependencies

§12.1 the center order of a cm point; ComplexMultiplicationAndExplicitReciprocity §§2.1–2.3; AbelianSchemesAndArithmeticModuli §§A6.22, A6.25, A6.37–A6.38; SuccessiveMinima Layer 1; IntegralLattices milestone 2F; HeightsAndUnits §2.1; GeometryOfNumbersAndQuadraticArithmetic §1.2; GeometryOfNumbersAndQuadraticArithmetic §2.7 (gap:quantitative-siegel-hermitian-reduction; gap:quantitative-hermitian-lattice-balancing); GlobalNumberFields Layer 11; `NumberField.exists_ideal_in_class_of_norm_le`; `NumberField.mixedEmbedding.covolume_integerLattice`; `ZLattice.covolume_div_covolume_eq_relIndex'`; HeightsRationalPointsAndObstructions §§0.11–0.13, 0.16; §12.5 galois-orbit bound for every cm point.

## Downstream consumers

The individual-height and primitive-orbit statements supply the CM inputs to arithmetic moduli and quantitative isogeny applications. The general center-order orbit bound and polynomial CM lift height supply the bounded-moduli-degree CM finiteness used by Masser–Zannier §5.4. Any application requiring an individual Colmez equality must supply that conjecture independently; the averaged formula only identifies an averaged class function.

## Worked examples

### Total heights determine only the overlap span

For every CM pair, a⁰_Φ(c)=0, whereas the constant class function 1 belongs to CM⁰ and takes value 1 at c. Thus H_CM, the ℚ-span of overlap functions, is proper. If an extension of ht_H to CM⁰ exists, adding t·ev_c for any real t preserves all of its total-height values. Those values cannot establish uniqueness on CM⁰. Colmez (1993), Theorem 0.3, p. 631 specifies component-period values on a larger generating family; these extra data must be retained for the full formulation.

There is another finite check. In Gal(ℚ(ζ₇)/ℚ)=C₆, write c=r³. The class function f with values (0,1,1,0,−1,−1) on 1,r,…,r⁵ satisfies f(s)+f(cs)=0, but f(r)≠f(r⁻¹). Every overlap character is invariant under inversion, including after conjugacy averaging and finite-quotient refinement. This independently distinguishes H_CM from CM⁰. The average and total-reflex arguments use only H_CM.

### A quadratic partition detects both length signs

Take A=Z₃, B=Z₃[π] with π²=3, and C=B. The two embeddings send π to π and −π. For the singleton partition the two evaluation kernels have sum generated by 2π, so the quotient is C/(2π), of C-length one. The different is generated by 2π and v_C(3)=2. Each singleton’s conductor functional is 1/2, so +(e_C/2)(1/2+1/2)=1. Both the reversed resultant sign and the negative conductor prefactor give −1 and fail. This is a local test; it does not by itself identify the total-reflex Hodge quotient with this module.

### The total reflex algebra can be a product

Let E=ℚ(i,√2), a biquadratic CM field. Its four types are choices in its two conjugate pairs. Under the Klein four Galois group they split into two orbits of size two: the two reflex fields are ℚ(i) and ℚ(√−2). Thus E♯≅ℚ(i)×ℚ(√−2), of degree four, and its CM abelian family has dimension two. A definition requiring E♯ to be a field fails this example. For an imaginary quadratic E the two-element type set instead recovers E itself.

### Integral unit image is smaller than maximal compact

For a ramified quadratic local field E_v/F_v, v_E(F_v×)=2Z. The quotient E_v×/F_v× is compact, and its further quotient by the integral-unit image is ℤ/2ℤ via valuation. Every E_v-uniformizer maps to the nonzero class and cannot be represented by a unit, since multiplication by F_v× preserves odd valuation. A uniformizer need not have order two in E_v×/F_v×: for π=√3(1+√3) in ℚ₃(√3), π²=12+6√3∉ℚ₃, although π² lies in ℚ₃×O_E,v×. The CM integral level uses the image of O_E,v×, excluding this class. It therefore cannot be defined as every compact element of the quotient.

### Ramified embedding quotients require a determinant comparison

Let F_p=ℚ_p(√p) with p odd and let O_L contain both embeddings. A free rank-one O_L-module on which √p acts by −√p, tensored along the embedding sending √p to +√p, becomes O_L/(2√p). This is nonzero torsion, not a locally free component of the expected rank. It blocks the inference from a generic tensor sequence to integral determinant cancellation. The relative/image Hodge comparison must prove precisely how this torsion is handled. The same issue reaches the quaternionic Kodaira–Spencer calculation.

At p=2 the degree-four CM field ℚ(√17,√−7) splits completely. Its integral local algebra is Z₂⁴; its reduction F₂⁴ has no single generator over F₂, since any such generator takes at most two distinct values. Factorwise local generators after suitable unramified extension are required in the Vandermonde calculation.

### From an average to an individual height

If m=2^g heights h_i satisfy h_i≥b_g and their mean is μ, then h_i=mμ−Σ_(j≠i)h_j≤mμ−(m−1)b_g. For m=2 and b_g=−1 this reads h_1≤2μ+1. Nothing requires b_g>0. Applying the subpolynomial bound on μ therefore gives the individual CM height bound even for imprimitive types. Primitivity first enters the full-endomorphism ideal-isogeny argument.

### Choose exponents before applying the isogeny estimate

For a geometric isogeny exponent κ=2, δ=1/16 satisfies δ<1/(4κ)=1/8. Choose a=3/16 and ε=1/32. Then δκ=1/8<a<1/4 and εκ=1/16<a. For large D, a lower degree cD^a cannot be accounted for by a height term bounded by D^ε in a maximum raised to κ. The definition-field term must dominate. The bounded range is covered by reducing the positive orbit constant, using the coarse-point degree≥1.

### The full center order changes the orbit invariant

For an elliptic CM order R=Z+fO_E, J=[O_E:R]=f and |disc R|=f²D_E. A discriminant defined using the maximal field alone misses arbitrary growth with f. For A=B^n with B simple, the center of End⁰(A)=M_n(E) is E once; counting it n times gives a different and incorrect invariant. These checks distinguish the full center-order definition from both common shortcuts.

### Coordinate bounds and the Northcott consumer

The embeddings of the product center algebra number at most 2g. Its normal closure therefore has degree≤(2g)!, and adjoining i bounds the degree of each real/imaginary coordinate by 2(2g)!. In dimensions one and two these safe real-coordinate bounds are 4 and 48. They need not be optimal. Given [ℚ(x):ℚ]≤N, the general orbit theorem bounds D_x. Polynomial coordinate height in D_x and these uniform coordinate degrees place each real/imaginary tuple in a finite Northcott set. This counts distinct moduli points, not repeated parameters mapping to the same point.

## References

Square-bracket keys refer to the legally available editions below. Each claim also records an exact printed locator and a line in the source-service extraction. PT and T12 use their cited arXiv pagination; YE uses the 18 December 2022 author revision. No equality of their numbering with another edition is assumed.

- [T] Jacob Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Annals 187 (2018), 379–390. Locators used in the build: §2.2, p. 382; Proposition 2.2 and preceding proof, p. 382; Corollary 3.3 proof, pp. 383–384, repaired via the quadratic average; Corollary 3.3, pp. 383–384, with its averaging proof and corrected sign convention; Lemma 4.1 and proof of Theorem 4.2, pp. 384–385, with polarized-moduli and quotient-polarization corrections; Proof of Theorem 4.2, p. 385; explicit exponent and bounded-range adapter; Theorem 1.2, p. 379 and Theorem 4.2, p. 385, interpreted through polarized coarse moduli; §5, p. 385; §5, p. 386, with relative/absolute and marked/unmarked orbit corrections; §5, p. 386; §5, pp. 385–386; Theorem 5.2, pp. 385–386; §6.2, p. 387, using the corrected splitting-field degree adapter; §6.2, p. 387.
- [A] Fabrizio Andreatta; Eyal Z. Goren; Benjamin Howard; Keerthi Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Annals 187 (2018), 391–531. Locators used in the build: §§4.1–4.7, pp. 431–454; Theorem 4.8.1, pp. 454–455; (6.0.1)–(6.0.2), p. 465; §§6.1–6.3, pp. 466–473; Theorem 6.4.2, p. 474; Hypothesis 8.3.1 and Proposition 8.3.3, pp. 505–507; Definition 9.1.1, (9.1.2), Definition 9.1.3, pp. 508–509; Theorem 9.1.5 and Remark 9.1.2, pp. 509–510; citing Colmez (1993), Theorem 0.3; Proposition 9.3.1, equation (9.3.1), p. 511; §3.1, (3.1.1)–(3.1.2), pp. 415–416; §3.2, (3.2.1) and Proposition 3.2.1, pp. 416–417, with the corrected subgroup; §3.1 and Proposition 3.2.1, pp. 416–417; §3.4, Proposition 3.4.2, pp. 420–421; §9.2, p. 510; Proposition 3.4.1, pp. 419–420; Proposition 9.2.1, Proposition 9.3.2 and Corollary 9.3.3, pp. 510–512; Proposition 3.5.2 and Remark 3.5.3, pp. 422–424; Corollary 3.5.4, pp. 424–425; Proposition 3.5.5(1)–(5), pp. 425–427; Proof of Proposition 3.5.5, pp. 426–427; Proposition 3.5.6, pp. 427–428; §3.6, pp. 428–429; §9.4, pp. 513–514 (metric on p. 514), with the positive-metric correction; §3.6, pp. 428–429, preceding Proposition 3.6.1; Propositions 3.6.1–3.6.2 and Lemma 3.6.3, pp. 430–431; §9.4, equation (9.4.3), pp. 513–514; §9.4, Lemma 9.4.4, pp. 516–518; Lemma 9.4.4, pp. 516–518, corrected final formula; §9.4, p. 518, before Proposition 9.4.5; Proposition 9.4.5 and equation (9.4.7), pp. 518–519; Proof of Theorem 9.4.2, pp. 515–516; Lemma 9.4.3 with corrected generator and period; Proof of Proposition 9.4.1, equations (9.4.8)–(9.4.13), pp. 519–522; Proposition 9.4.1, Theorem 9.4.2 and (9.4.4), pp. 515–516; end of the local calculation on p. 522; Proposition 9.5.1, proof pp. 522–523; the full-lattice scaling assertion is corrected; Theorem 8.3.4, pp. 507–508; Proposition 9.5.1, (9.5.1)–(9.5.3), pp. 521–523; Definition 5.3.3, p. 460; §9.5, pp. 522–525; Proposition 9.5.2 and Lemmas 9.5.3–9.5.4, pp. 523–525; Theorem 9.5.5 and Theorem 9.5.6, pp. 525–526; §1.1, p. 392, remark preceding Theorem A; the classical input is cited there; Theorem A, p. 392; Theorem 9.5.5, pp. 525–526; Conjecture 9.1.6, p. 510.
- [Y] Xinyi Yuan; Shou-Wu Zhang, [On the averaged Colmez conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf), Annals 187 (2018), 533–638. Locators used in the build: Theorem 2.2, pp. 544–546; Theorem 2.3, pp. 546–548; proof of Corollary 2.6, pp. 548–549; §2.2, p. 548; §1.2, p. 537; Corollary 2.6, pp. 548–549; Proposition 5.4, p. 575; §1.1–1.2, pp. 536–537; existence is implicit in the deduction of Theorem 1.1; §1.2–1.3, pp. 537–539; Theorem 4.7 for the Hodge line, pp. 566–568; Proposition 5.7, p. 577; Propositions 5.3–5.4 and Corollary 5.5, pp. 574–576; Theorem 1.6, p. 537; proof §5.3, pp. 576–577, with Erratum Theorem 1 replacing Theorem 2.7; Theorem 9.1, pp. 624–628; §1.3, pp. 539–541 explains the kernel comparison; Theorem 9.3 and §9.2, pp. 629–635; setup pp. 629–631; Theorem 1.7, p. 539; Theorems 9.1 and 9.3, pp. 624–635; Theorem 1.1, p. 535; corrected proof with Erratum Theorem 1; Theorem 1.1, p. 535.
- [YE] Xinyi Yuan; Shou-Wu Zhang, [Erratum to On the Averaged Colmez Conjecture](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf), Author revision dated 18 December 2022, 11 pages; journal erratum Annals 198 (2023), 867–878 not collated. Locators used in the build: Erratum, §1, Theorem 1, pp. 1–2; Erratum, §2, Theorem 2 and Propositions 4–5, pp. 3–9; Erratum, §3, display (5) and proof, pp. 10–11; Author erratum, §3, Proposition 6 and proof, pp. 9–10; Erratum, Theorem 1, p. 2; §3 proof, pp. 10–11; Erratum, §1, pp. 2–3.
- [T12] Jacob Tsimerman, [Brauer–Siegel for arithmetic tori and lower bounds for Galois orbits of special points](https://arxiv.org/pdf/1103.5619v2), arXiv:1103.5619v2, preprint pagination; JAMS 25 (2012), 1091–1117 edition identified but not collated. Locators used in the build: §7.1–7.2, preprint pp. 15–18; §7.2, preprint p. 18, with the order index distinguished from the compact index; Proof of Theorem 7.1, preprint pp. 17–18; Tsimerman (2012), Lemmas 7.2–7.5, preprint pp. 18–20; Theorem 7.1 and equations (4)–(5), preprint pp. 17–20.
- [PT] Jonathan Pila; Jacob Tsimerman, [The André–Oort conjecture for the moduli space of Abelian surfaces](https://arxiv.org/pdf/1106.4023v1), arXiv:1106.4023v1, preprint pagination; Compositio 149 (2013), 204–216 edition identified but not collated. Locators used in the build: Lemma 3.2, preprint p. 4; §3, preprint pp. 3–9; Pila–Tsimerman (2013), Lemmas 3.2–3.3, preprint pp. 3–5; Pila–Tsimerman (2013), §3, Lemmas 3.4–3.7, preprint pp. 5–9; Theorem 3.1, preprint pp. 3–9.
- [PT14] Jonathan Pila; Jacob Tsimerman, [Ax–Lindemann for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p05-p.pdf), Annals 179 (2014), 659–681. Locators used in the build: Conjecture 7.1, p. 673; Lemma 7.4 and proof, p. 675.
- [MZ] David Masser; Umberto Zannier, [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf), Annals 191 (2020), 635–674, public supplemental article PDF. Locators used in the build: §5.4, p. 667.
- [C] Pierre Colmez, [Périodes des variétés abéliennes à multiplication complexe](https://webusers.imj-prg.fr/~pierre.colmez/artin.pdf), Annals 138 (1993), 625–683; author-hosted scan. Locators used in the build: Component generators, p. 630; Theorem 0.3(i)–(ii), p. 631; Theorem 0.3, p. 631; Conjecture 0.4, p. 632; §0.6, pp. 632–633, exact quadratic period identity and height conversion.
