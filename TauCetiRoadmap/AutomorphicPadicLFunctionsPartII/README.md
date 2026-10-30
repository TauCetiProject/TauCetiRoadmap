# Roadmap: automorphic p-adic L-functions, part II — critical Hecke values

**Summary.** This roadmap combines the Hecke and ray-class theory of GlobalNumberFields Layers 2, 7 and 9–10, the CM geometry of ComplexMultiplicationAndExplicitReciprocity §1.3 and the measure theory of PadicMeasuresIwasawaAlgebras §§0–3 to construct critical algebraic Hecke values over a totally imaginary field containing a CM subfield. It builds integral equivariant coherent Eisenstein–Kronecker classes from completed Poincaré bundles, identifies them through meromorphic Kronecker series and oriented unit-torus integration, and constructs ordinary theta measures. Its end theorems are regularized critical-value integrality in both conductor cases, generalized Shimura algebraicity, the weak Deligne period relation, and bounded ordinary ray-class interpolation with all local factors. The three compatibility results needed for these conclusions—residue-to-moment signs, integral unit-index descent, and bounded division of auxiliary factors—are mathematical targets of the build.

## Scope and ownership

This Part II owns the critical coefficient specialization, trace-zero residue classes, critical cap and conductor refinement, the de Rham cohomology of the completed logarithm coefficient over characteristic-zero fields with the residue-characterized de Rham polylogarithm class, the 2πi-normalized Betti duality of complex abelian schemes with their duals, the trace-dual structure and the dual period relation of CM abelian schemes, the CM Borel current, its unit-orbit evaluation, critical-value applications and the ordinary theta-to-ray-class construction. No roadmap titled automorphic p-adic L-functions precedes this part: its base is formed by the three suppliers of the next sentence, which records where each of them stops, and nothing outside the suppliers named below is consumed. GlobalNumberFields Layers 2, 7 and 9–10 supply the character and ray-class objects, ComplexMultiplicationAndExplicitReciprocity §1.3 supplies the CM geometry, and PadicMeasuresIwasawaAlgebras §§0–3 supplies bounded measure theory without constructing an arithmetic p-adic L-function. The extension here constructs the critical Eisenstein classes and their arithmetic measures, permits L to be a non-CM extension of its maximal CM subfield K, and includes every admissible critical type and every tame integral conductor prime to p.

The general objects have the following owners:

- Mathlib owns `NumberField.IsCMField`, `IsZLattice`, the logarithmic unit lattice, `AbstractMeasure`, Dirac measures, pushforward and convolution, Mellin and Gamma integrals, Gaussian Fourier transforms and one-dimensional Schwartz Poisson summation. **ThetaSeries**, Layer 1 and §§2A, 2C, owns lattice Poisson summation, its dual and covolume laws. Tau Ceti owns the split comodule weight decomposition and its scalar point action. The continuation here is a lattice-parameter and polynomial-moment application of these analytic results.
- **GlobalNumberFields**, Layers 2, 7 and 9–10, owns Hecke characters, ideal-side characters, ray classes, algebraic infinity types, unit compatibility and purity. **ClassFieldTheory**, Layers 7 and 11–13, owns local and global arithmetic reciprocity. The critical admissibility and p-adic-avatar interfaces required in the exact contracts are extensions of these owners.
- **AbelianSchemesAndArithmeticModuliPartII**, P0.1–P0.6, P1.1, P2.1–P2.8, P3.2–P3.4 and P4.1–P4.3, owns invariant tensors, shuffle products, universal extensions, completed Poincaré sheaves, their moments, splittings, connections and ordinary trivializations. Its P3.3 ends with the horizontal rigidified isomorphism Log≃P̂♮, and its P2.8 computes coherent cohomology of the ordinary completed sheaf only; the de Rham cohomology of P̂♮ and the polylogarithm class built on it are §§2.6–2.7 here. **ComplexMultiplicationAndExplicitReciprocity**, §§1.3 and 2.1, owns lifted CM types, Serre tensors, eigenspaces, ideal-kernel degrees, the period pairing, the conjugate de Rham pairing and CM-compatible polarizations; the integral Betti duality with the dual abelian scheme and its 2πi normalization are §5.1 here. **AbelianSchemesAndArithmeticModuli**, A2.2, A4.3, A5.1 and A5.3, owns the dual abelian scheme, de Rham duality, lattice uniformization and the Appell–Humbert description of line bundles. This roadmap only chooses the based data and applies those maps to the residue class.
- **SchemeAndStackFoundations**, §§2.6–2.7, 2.19–2.20 and 2.23, owns supports, coherent duality and derived equivariance. **AlgebraicTopology**, Stages 5–6 and Stage 8 items 5, 7 and 8, owns finite covers, torus homology, local-coefficient caps, fundamental classes and classifying models. **DifferentialGeometry**, Layers 0–1 and 5, owns generic forms and integration. **Hyperfunctions**, HF2.AnalyticPreparation.CurrentResolution, owns compact bundle-current regularization and its Dolbeault homotopies. **ComplexComparisonPartII**, C1.1 and C5.1/C5.4, owns the analytic/coherent comparisons; its current-resolution and trace compatibility extensions are named in the contracts.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.1.7, R07.1.9 and R07.1.13, owns Cartier duality and connected–étale/formal group theory. **PadicMeasuresIwasawaAlgebras**, §§0.1, 1.2, 1.7, 2.1–2.2 and 3.1, owns the measure algebra, weighting, bounded Amice theory and pseudomeasures. The integral multivariate and bounded-divisibility extensions remain with that owner.
- **AutomorphicLFunctionsAndLocalFactors**, AL.1 “Local epsilon factors and Gauss sums” and “Rank-one specialisation and Hecke comparison”, owns the analytic Hecke and local-factor interfaces. **PeriodsAndSpecialValues**, PS.0–PS.1, owns motives and determinant-period interfaces, specified below as supplier requirements.

The independent inert-prime CM central-value direction is outside this roadmap; nothing here is supplied by it. An inert imaginary-quadratic prime does not satisfy the ordinary predicate here (BKO-2021, Introduction, pp.943–944, BKO-2021 line 73). No nonordinary unit decomposition or main conjecture is an input to this build.

## Conventions

Fix embeddings of algebraic numbers into ℂ and ℂ_p. Let L be totally imaginary, [L:ℚ]=2d with d≥1, and K its specified maximal CM subfield. An ordered CM type Σ_K lifts to Σ on L; barΣ is the complementary set of embeddings, without requiring an involution of L. An admissible type is a norm pullback from K with parallel conjugate sum and is trivial on the specified finite-index unit subgroup Γ. Critical value indices are α≥1 on Σ and β≥0 on barΣ; derivative indices are a=α−1. All factorials and powers of indexed periods are coordinatewise products (KS-v4, §1.1, pp.6–8, KS-v4 line 279).

Use the covariant module H=(H¹_dR(A/R))∨ and its splitting H(barΣ)⊕H(Σ), with H(barΣ)≃ω_A∨ and H(Σ)≃Lie A. The Γ-action on ω_A is inverse to the Lie action; on ω_A∨ it is the complementary positive embedding action. A bar on a scalar means complex conjugation; a dual period Ω∨ is independent of the scalar conjugate barΩ. TSym is the invariant divided symmetric tensor, with shuffle multiplication. The rank-one determinant shift is the tensor identification, not shuffle multiplication (KS-v4, Corollaries 1.12–1.14, p.11, KS-v4 line 482; Definitions 2.26–2.28, pp.22–23, KS-v4 line 938).

R is a noetherian arithmetic subring of ℂ and an O_(L^gal)[1/d_L]-algebra. Bases of invertible eigensheaves are chosen after a permitted localization or base extension. The p-adic objects are the indicated completed base changes; O_(ℂ_p) is not required noetherian. Define R[1/a] inside Frac(R) as the intersection of R_m over maximal ideals m whose contraction to O_L does not divide a; for R=O_L these are the a-integers (KS-v4, Notation 1.18, p.12, KS-v4 line 542). All number-field extensions are separable. Zero rings, equal-characteristic coefficient fields and nonreduced arithmetic bases are outside this embedded arithmetic datum; finite-flat theory in the supplier contracts retains its own broader bases.

All conductor, auxiliary and fractional ideals are nonzero; the unit ideal is permitted wherever stated and the zero ideal is excluded. Thus every ideal norm used as a denominator is positive. Write h for a residue function and f for a conductor ideal. Mathematical symbols EK(h), θ(h) and μ(h) always carry their datum and group. Hecke values use χ((λ))=λ^(β−α) for principal ray generators. The idelic infinity exponent is the opposite of this ideal exponent. Arithmetic Artin maps a prime ideal to arithmetic Frobenius. The local-unit inclusion in the ray tower is ideal-theoretic: modulo fp^n a local unit u maps to the ray class of (λ), where λ≡1 mod f and λ≡u mod p^n. It is inverse to the idelic map u↦Art(u_p); §8.3 uses this inclusion. Ramified ideal values, including the notation χ(v⁻¹), are set to zero only inside the specified Euler-factor extension; zero is never inverted. At an unramified prime, χ(v⁻¹)=χ(v)⁻¹. For conjugate-sum weight w the ideal-unitary shift is L(χ,s)=L(χᵘ,s−w/2), with χᵘ(a)=χ(a)Na^(−w/2) (KS-v4, §4.1, pp.46–47, KS-v4 line 2158; §5.6, pp.72–73, KS-v4 lines 3336–3350).

The Hermitian form is linear in the first variable: H(z,w)=Σh_i z_i barw_i, h_i>0; ⟨z,w⟩=Im H(z,w). Its alternating dual fixes both lattice characters and covolumes. Currents pair by η↦∫η∧ω. The unit torus is oriented by dr₁/r₁∧⋯∧dr_(d−1)/r_(d−1). Every use of a cap is integral for torsion-free Γ; the normalized extension through finite torsion first inverts its order. Division by a nonunit group index uses §5.4 for critical coordinates and §8.3 for weighted ray-quotient measures. Theta functions and Eisenstein measures before that pushforward use torsion-free groups Γ and are classes in Γ-coinvariants; only Γ-invariant functionals of them are used. The class sign ε(d,a,β) of §4.3 is retained in the critical moments and interpolation. These normalizations are tested in the layers that use them (KS-v4, §§2.4, 3.2–3.4, pp.22–23,33–39, KS-v4 lines 961, 1444, 1486, 1506).

## Exact supplier contracts

### From Mathlib

Use `NumberField.IsCMField` in `Mathlib/NumberTheory/NumberField/CMField.lean:69`: it requires total complexity and quadraticity over the maximal real subfield. Use `NumberField.Units.instZLattice_unitLattice` and `NumberField.Units.logEmbeddingEquiv` in `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:373` and `:415` for the full logarithmic lattice and units modulo torsion. Use `ZLattice.summable_norm_sub_rpow` in `Mathlib/Algebra/Module/ZLattice/Summable.lean:236` for translated norm-power summability below the negative lattice rank; the complex polynomial numerator estimate is the specialization in §3.3. Use `IsZLattice` in `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` together with its separate `DiscreteTopology` hypothesis; spanning alone is not discreteness. Use `FractionalIdeal.dual`, `FractionalIdeal.dual_eq_mul_inv` and `coeIdeal_differentIdeal` in `Mathlib/RingTheory/DedekindDomain/Different.lean:229`, `:356` and `:532` for the trace dual of a nonzero fractional ideal, dual(a)=dual(1)·a⁻¹ with dual(1) the inverse different; §5.1 uses them for the trace-dual Betti structure.

Use `AbstractMeasure`, `AbstractMeasure.dirac` and `AbstractMeasure.map` in `Mathlib/NumberTheory/Padics/Measure/Basic.lean:40`, `:97` and `:105`. The carrier is a continuous linear functional on continuous maps; its definition imposes neither total mass one nor an operator bound of one. Use convolution and `AbstractMeasure.diracHom` from `Mathlib/NumberTheory/Padics/Measure/Monoid.lean`. `AbstractMeasure.amiceTransformEquiv` in `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean:157` has domain measures on ℤ_p with ℤ_p coefficients; the coefficient-complete multivariate extension consumed here is the supplier gap below.

Use `fourier_gaussian_innerProductSpace` in `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:352` for a finite-dimensional real inner-product space and Re(b)>0, `mellin` in `Mathlib/Analysis/MellinTransform.lean:90`, and `Complex.Gamma_eq_integral` in `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:319` only for Re(s)>0. `MeromorphicOn`, `AnalyticAt` and `HasSum` express its acceptance theorems. Use `ZLattice.covolume` in `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` with the product Lebesgue measure on Fin d → ℂ; §3.3 multiplies this by ∏h_i to obtain the metric volume. `ZLattice.covolume_pos` in the same file, line 98, supplies positivity for a full discrete lattice. `Complex.Gamma_neg_nat_eq_zero` in `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:344` explains the excluded Gamma poles in §3.4.

### From TauCetiRoadmap.ThetaSeries

Consume Layer 1, items 1A, 1E and 1F, for lattice Poisson summation, separate summability and Gaussian Schwartz functions, and Layer 2, items 2A and 2C, for dual biduality and inverse covolumes. Apply them in the Euclidean model of (ℂ^d, Re H) given by x↦(√h_i·x_i). If Λ^∨ is the Re H-dual, the alternating dual in §3.3 is Λ*=i·Λ^∨: Im H(iu,m)=Re H(u,m). Metric covolumes therefore satisfy vol_H(Λ*)=vol_H(Λ)⁻¹.

### From Tau Ceti

Use `TauCeti.Comodule.isInternal_weightSpace` and `TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace` in `TauCeti/Algebra/Coalgebra/Comodule/MonoidAlgebra/Basic.lean:416` and `:568`. Over a commutative semiring the former gives an internal direct sum for a monoid-algebra comodule; the latter evaluates the scalar action at algebra-map points. Neither theorem asserts that invariants of a unit subgroup discard nontrivial weights on torsion coefficient modules.

Use `TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic` in `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Algebraic.lean:60`, together with the Hecke-character and algebraic infinity-type carriers of that directory. Algebraicity is agreement on the identity component. `TauCeti.GlobalNumberFields.HeckeCharacter.unitaryPart` in `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Shift.lean:273` and its purity interface fix the unitary comparison; the integer ideal exponent in this README has the opposite sign to the idelic infinity exponent. These carriers do not by themselves specify the CM period datum of §5.1.

### From TauCetiRoadmap.GlobalNumberFields and TauCetiRoadmap.ClassFieldTheory

GlobalNumberFields Layers 2, 7 and 9–10 supply ray classes, the ideal/idelic character comparison, continuous and algebraic infinity types, finite-order twists, unit compatibility, purity and norm base change. ClassFieldTheory Layers 7 and 11–13 supply normalized local/global Artin reciprocity, the finite ray extensions and the inverse-limit identification for the modulus fp∞. The kernel over a fixed tame ray class is the local unit group modulo the closure of units congruent to one modulo f. At f=O_L this becomes the full unit closure. Arithmetic Frobenius, inversion and the norm shift must agree with §§5.3 and 8.3. The kernel identification with local units is ideal-theoretic, inverse to the local idelic Artin map; its avatar formula is χ(q_f(u))=χ_fin(u)u^(β−α), with q_f followed by that inclusion.

What ClassFieldTheory must provide (gap:ray-tower-tame-unit-kernel): Supply the inverse-limit fp∞ ray-class Galois comparison and exact kernel over Cl_f equal to the local p-unit group modulo the closure of O_f×, with arithmetic Artin on ideals, the ideal-theoretic local-unit inclusion inverse to local idelic Artin, and finite-level transition compatibility.

What GlobalNumberFields must provide (gap:unit-type-classification): Classify integer embedding types trivial on a finite-index unit subgroup as norm pullbacks from the maximal CM subfield with parallel conjugate sum, or parallel norm powers when no CM subfield exists.

What GlobalNumberFields must provide (gap:hecke-padic-avatar): Supply the arithmetic p-adic avatar of an algebraic ideal Hecke character on the fp∞ ray tower, with its local algebraic monomial, finite unit character and the ideal-to-idelic inverse convention.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

Consume P0.1–P0.6 for invariant tensors, multigrading, shuffle multiplication and divided powers; P1.1 for the universal extension of A∨ and the covariant Hodge module; P2.1 for moments; P2.2–P2.3/P2.8 for completed coefficients and their top coherent cohomology; P2.4–P2.7 for isogeny maps, rigidified torsion splitting, Γ-linearization and comultiplication. P3.2/P3.4 supply the smooth connection and Dolbeault realization, and P3.3 supplies the characteristic-zero field-base logarithm-sheaf comparison: a horizontal isomorphism Log^(1)≃P♮^(1) respecting the unit splittings, hence Log≃P̂♮. Neither the de Rham cohomology of P̂♮ nor any polylogarithm class is part of that contract; P2.8 is the coherent statement for P̂ alone. P4.1–P4.3 supply ordinary completed base change, the infinitesimal trivialization and torsion translations. These are the precise models used by every EK, moment and theta map below. In elliptic dimension the ordinary and connection completions have conormal ranks 1 and 2; their degree-two coefficient sheaves have ranks 3 and 6, respectively.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

Consume §1.3, including `cmHodgeEigenspaces`, for the lifted embedding partition, CM Serre tensors, CM Lie/Hodge eigenspaces, ideal-kernel degrees and both period pairings. The generic tensor is O_L⊗_(O_K)A₀, its dimension is [L:K]dim A₀, and the cotangent eigenspaces are trivialized only after the permitted base change. The ideal [c]-kernel has finite-flat rank Nc, including its inseparable part. The two pairings are the period pairing ω_A×H₁(A(ℂ),ℤ)→ℂ^Σ and the de Rham pairing conj(ω_A)×ω_A∨→ℂ^barΣ, conjugate in its first argument, with their naturality in O_L-linear homomorphisms and the ideal-twist lattice aΛ of A(a). The same §1.3 controls the complex periods, without an ordinary-prime hypothesis. It does not identify H₁(A∨(ℂ),ℤ) with the trace dual a⁻¹d_L⁻¹ or compare the de Rham pairing with integral Betti duality; both are §5.1 targets here. Consume §2.1, the polarized classification of CM abelian varieties, for an O_K-linear polarization whose Rosati involution is complex conjugation, used in §5.8 to compare dual and conjugate periods.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume A2.2 for the dual abelian scheme A∨ with its doubly rigidified Poincaré bundle and the dual of a homomorphism, A4.3 for the perfect de Rham duality between H¹_dR(A/S) and H¹_dR(A∨/S), A5.1 for the uniformization V/Λ≃A(ℂ) with Λ=H₁(A(ℂ),ℤ), and A5.3 for the classification of holomorphic line bundles on V/Λ, in which the topologically trivial ones are given by unitary characters of Λ. Together with proper GAGA these identify H₁(A∨(ℂ),ℤ) with Hom(Λ,ℤ). The 2πi-normalized comparison of that integral duality with the A4.3 pairing is the §5.1 target.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §2.6's affine quasi-coherent acyclicity, §2.7's support localization triangle, §§2.19–2.20's regular-immersion/coherent duality and §2.23's derived equivariant sheaf cohomology and its spectral sequences. Γ acts on A over the fixed base; it need not act trivially on A. At a point the comparison is native discrete group cohomology, and in general equivariant cohomology is not defined by taking invariants after cohomology.

What SchemeAndStackFoundations must provide (gap:equivariant-poincare-limit): Supply the inverse-limit and vanishing R¹lim comparison for finite-level equivariant completed Poincaré complexes and the discrete-unit Borel smooth/coherent comparison.

### From TauCetiRoadmap.ComplexComparisonPartII

C1.1 supplies the local bundle-valued Dolbeault comparison; C5.1 supplies the ordinary algebraic/analytic de Rham comparison and hypercohomology of bounded-below complexes of sheaves of vector spaces; C5.2 supplies, over a field of characteristic zero, the de Rham complex of a coherent module with integrable connection and its analytification, used for P♮^(n) in §§2.6–2.8 and §3.6; and C5.4 supplies the generic current calculus, its test topology and regularization, real/complex comparison, integration and residue normalizations. Its form-first pairing converts to the test-first pairing here by (−1)^(k(N−k)) in real dimension N and form degree k; at N=2, k=1 this factor is −1. DifferentialGeometry Layers 0–1 and 5 supply the generic forms and integration on which those comparisons operate. The bundle-valued Borel current model uses the following extensions.

What ComplexComparisonPartII must provide (gap:borel-bundle-currents): Extend C5.4’s supplied bundle-test/current calculus to the mixed relative bidegrees on a complex manifold times a real contractible unit cover, with the local form/current resolution natural in finite Poincaré levels and flat connections.

What ComplexComparisonPartII must provide (gap:current-residue-trace): Supply top unit-torus integration and Stokes for that current resolution, with local analytic residue and trace identified with the rigidified algebraic coherent trace.

### From TauCetiRoadmap.Hyperfunctions

Consume HF2.AnalyticPreparation.CurrentResolution for finite-rank bundle-valued compact currents, the smooth-test dual topology, local Dolbeault regularization and properly supported homotopy maps. The p-holomorphic-degree homotopy has the transport sign (−1)^p, whereas its regularization has no extra sign; at p=1 the homotopy changes by −1 and the regularization by +1. Its dual local identities, combined with ComplexComparisonPartII C5.4’s current topology, supply the local input to the mixed relative resolution in §3.2. This does not identify compact currents (dual to global tests) with unrestricted currents (dual to compactly supported tests).

### From TauCetiRoadmap.AlgebraicTopology

Consume Stage 5 items 3–4 for finite-cover transfer and torus exterior-power homology, Stage 6 for singular local coefficients, cap products and oriented fundamental classes, and Stage 8 items 5, 7 and 8 for Whitehead equivalence, finite CW type of the compact torus and the discrete-group classifying-space/bar comparison. The contract concerns a finite-rank free abelian unit group acting on its contractible logarithmic cover and its actual coefficient representation. It includes finite-index naturality and the top-degree identification with the coefficient line. No surjective transfer through a finite torsion group is part of the contract.

What AlgebraicTopology must provide (gap:torus-cap-projection): Supply the compatibility of the native group-cohomology comparison with the oriented local-coefficient torus cap into H₀(Γ;M)=M_Γ for an arbitrary coefficient module M, its top-degree coefficient-line identification and finite-cover projection formula.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume R07.1.7 for Cartier duality, R07.1.9 for the connected–étale sequence over the indicated henselian bases, and R07.1.13 for the formal Lie group comparison. Their CM idempotent and paired-isogeny compatibilities are the following exact requirement, after base change from the noetherian arithmetic model.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:ordinary-cm-pairings): Supply the ordinary CM-idempotent connected–étale decomposition and perfect Cartier/Weil pairings over the required bases, with compatibility of paired isogenies and all levels.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Consume §§0.1, 1.2 and 1.7 for clopen restriction, convolution and the completed-group-algebra comparison; §§2.1–2.2 for continuous weighting, its pushforward projection formula, invariant derivatives and bounded Amice calculus; and §3.1 for localization and admissible evaluation of pseudomeasures. Integral means preservation of the coefficient unit ball, uniformly over all finite quotients. A characterwise integral pseudomeasure does not satisfy this contract merely by its values.

What PadicMeasuresIwasawaAlgebras must provide (gap:integral-multivariate-amice): Supply basis-independent integral Amice for finite-free ℤ_p-modules of arbitrary rank with O_(ℂ_p) coefficients, including products, completed coefficient extension, translations and invariant differential moments.

What PadicMeasuresIwasawaAlgebras must provide (gap:bounded-fraction-criterion): Supply localization of the commutative integral measure algebra on profinite abelian ray groups and a uniform Kummer-congruence or integral-divisibility criterion for bounded fractions, including torsion components and common zeros.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.0 “Local Schwartz–Bruhat spaces and finite Fourier levels” for finite pairing orthogonality, inversion and refinement. Consume AL.1 “Local epsilon factors and Gauss sums” for normalized trace-character Gauss sums and their primitive nonvanishing, “Global distributions and completed Euler products” for the analytic factors, and “Rank-one specialisation and Hecke comparison” for continuation and its rank-one normalization. Convert χ of ideal weight w to its unitary character χᵘ before applying the latter, translating s to s−w/2 and transporting all gamma factors. No new global Hecke functional equation is a target here.

### From TauCetiRoadmap.PeriodsAndSpecialValues

The Hecke-motive realization and period-line contracts consumed by §5.9 are the following requirements; the criticality assumption and the possible vanishing of the special value remain separate.

What PeriodsAndSpecialValues must provide (gap:hecke-motive-periods): Supply rank-one Hecke motives, realizations, period lines and tensor, norm-pullback, restriction-of-scalars, finite-order and Tate-twist comparisons in the ideal infinity-type convention β−α.

What PeriodsAndSpecialValues must provide (gap:critical-cm-deligne-period): Supply criticality of the restricted Hecke motive and the CM expression for its nonzero Deligne c⁺ period modulo Qbar×, separately from algebraicity of the possibly zero L-value.

## How to read the build

Layers 0–2 select the critical coefficient lines, construct the residue class and evaluate it integrally, with conductor refinement separated from unit-index normalization; over a characteristic-zero field they compute the de Rham cohomology of the completed logarithm coefficient and identify the residue class with the de Rham polylogarithm. Layers 3–4 construct the analytic representative and identify its unit-orbit series. Layer 5 converts this evaluation into period-normalized critical values, proves integral full-unit descent of critical coordinates and deduces algebraicity and the weak period relation. Layers 6–7 use ordinary levels and torsion-free unit groups to turn the same class into theta functions and bounded Eisenstein measures. Layer 8 proves integral unit-index descent on the weighted ray quotient, translates the conductor-one family by its second auxiliary Artin atom, and proves signed interpolation and uniform bounded desmoothing. Each *Needs:* line separates statement inputs from the suggested proof route. `Suggested.lean` is the acceptance test for the headline continuation and functional-equation theorems that are statable on native carriers; the other headline statements require the geometric and arithmetic interfaces specified here.

## Layer 0: Critical types and CM coefficient lines

### 0.1 Lifted CM types and critical coefficient indices

Let L be totally imaginary of degree 2d and contain its maximal CM subfield K. A CM type Σ_K of K determines Σ={σ:L→ℂ | σ|K∈Σ_K}; its complement is denoted barΣ, without assuming a conjugation automorphism of L. Write I_L=ℤ[Hom(L,ℂ)]. A Hecke type μ is a norm pullback from K of μ₀ with μ₀(τ)+μ₀(barτ)=w independent of τ. For finite-index Γ⊂O_L×, HCI_L(Γ) consists of these types trivial on Γ. Write CI_L(Γ) for its subset critical for the chosen Σ. A type is critical for Σ when μ=β−α with α:Σ→ℕ strictly positive and β:barΣ→ℕ; equivalently μ=β−a−1 with a≥0. The negative embeddings must be exactly the lifted type. Prove that these are precisely the algebraic Hecke types whose Γ-invariant coefficient lines occur below. Fields with no CM subfield contribute no such critical type.

Assume d≥1; specified embeddings into ℂ and a specified maximal CM subfield K when a critical type is present.

(KS-v4, Theorem 1.1, p.7, KS-v4 line 289, for weight decomposition; the classification discussion, p.7, KS-v4 lines 296–322; Definition 1.2, pp.7–8, KS-v4 line 324; Notation 1.3 and Proposition 1.5, p.8, KS-v4 lines 342, 357.)

The construction has the following API.

- Criticality for fixed Σ is equivalent to the unique pair (a,β) with μ=β−a−1, a,β≥0 and μ admissible.
- Pullback of a critical type on K has the same positive indices on every embedding above a fixed embedding of K.
- Passing to Γ′⊂Γ preserves the critical type and its coefficient indices; admissible types may enlarge.

One proof route is to import the infinity-type and unit-character classification from GlobalNumberFields Layers 9–10; restrict its admissibility condition along L/K. Use the imported diagonalizable-group weight decomposition, then the unit theorem: a weight trivial on a finite-index subgroup is a Hecke type. Separate the value exponent α from the derivative exponent a=α−1.

**Checks.**

- For K=L=ℚ(i), μ(i↦i)=−2 and μ(i↦−i)=1 gives a=1, β=1, after taking Γ in the kernel of the finite unit character.
- The type with μ|Σ=0 is not critical; a=0 corresponds to μ|Σ=−1.
- For L=ℚ(i,√(1+i)), the assignment α=(1,2), β=(0,0) fails norm-pullback admissibility although both α entries are positive.
- A nonconstant assignment on embeddings above the same embedding of K is rejected even when its signs fit Σ.
- No assertion that arbitrary totally imaginary fields are CM is used.

*Needs:* GlobalNumberFields Layer 10 (gap:unit-type-classification); ComplexMultiplicationAndExplicitReciprocity §1.3; Mathlib `NumberField.IsCMField`; `TauCeti.Comodule.isInternal_weightSpace`; `TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace`.

### 0.2 CM abelian data with bases and torsion

A standard datum consists of a noetherian affine R⊂ℂ that is an O_(L^gal)[1/d_L]-algebra; an abelian scheme A/R of dimension d with O_L-action and Lie(A) of lifted type Σ; ordered bases ω_A=(ω_A,σ) of the rank-one cotangent eigensheaves and ω_A∨=(ω_A∨,barσ) of its dual's cotangent eigensheaves; and an f-torsion section x fixed by Γ. Bases are chosen after a localization or extension where the eigensheaves become free, not postulated for every base. The covariant H=(H¹_dR(A/R))∨ has H=H(barΣ)⊕H(Σ), H(barΣ)≃ω_A∨, and H(Σ)≃Lie A. The action on ω_A,σ is σ(γ)⁻¹, while that on ω_A∨,barσ is barσ(γ). The bases identify A(ℂ) with ℂ^Σ/Λ. The ideal-localization notation is the intersection over maximal ideals whose O_L-contraction does not divide a, as fixed in Conventions.

Assume critical lifted type from §0.1. Nf is a unit only for the unrefined torsion evaluation; §2.4 has its own weaker assumption.

(KS-v4, Definition 1.15, Remark 1.16, equations (1.3.2)–(1.3.4), Notation 1.18, p.12; §1.2, pp.9–11, KS-v4 line 522.)

The construction has the following API.

- Transport the datum along an injective permitted base extension, carrying the bases and torsion section.
- Identify the two cotangent actions with inverse Σ-weights and positive barΣ-weights.
- A CM datum for K and finite projective O_K-module O_L produce the lifted Lie type; freeness of chosen bases is an additional local condition.

One proof route is to apply the imported Serre tensor construction O_L⊗_(O_K)A₀ and its CM eigenspace theorem. Trivialize the weight lines only after the permitted change of base and retain the isomorphisms under transport.

**Checks.**

- For a CM elliptic curve the cotangent weights on A and A∨ have the stated opposite embedding conventions.
- A nontrivial invertible eigensheaf supplies a datum without a global basis until the indicated localization; the based constructor cannot accept it directly.
- O_L⊗_(ℤ[i])A₀ for L=ℚ(i,√(1+i)) has dimension two and the lifted Σ even though L has no CM involution.
- Every use names the base, bases, lattice and Γ-action.
- At the zero Serre module the relative dimension is zero, so the positive-dimensional standard datum rejects it.
- For the split torus point with selected coordinate 2, the Lie action is 2 and its cotangent action is 1/2; replacing the cotangent by the pullback action gives 2. At γ=i in ℚ(i), both selected inverse and complementary positive weights are −i.

*Needs:* §0.1; ComplexMultiplicationAndExplicitReciprocity §1.3.

### 0.3 Critical coefficient invariants

For a,β≥0 put C_(a,β)=TSym^a(ω_A)⊗TSym^β(ω_A∨)⊗det(ω_A), with multigraded divided symmetric powers imported from AbelianSchemesAndArithmeticModuliPartII P0. Its Γ-action has weight β−a−1. Over R contained in a number field, C_(a,β)^Γ=C_(a,β) when that weight belongs to CI_L(Γ), and is zero otherwise. More generally, for an R-torsion-free algebraic torus module M, its Γ-invariants are the direct sum of the weights trivial on Γ, identified with HCI_L(Γ) by the imported Hecke-type classification. The coefficient lines above are finite locally free, so they satisfy the torsion-free hypothesis. The extra torsion-free hypothesis concerns invariants under the unit subgroup, independently of the comodule decomposition.

Assume standard datum; finite-index Γ⊂O_L×; R embeds in a number field for the invariant-versus-zero assertion. For the general assertion on M, require M to be R-torsion-free (finite locally free suffices). R being a domain alone does not imply this.

(KS-v4, Proposition 1.5, p.8; Corollary 1.14, p.11; Proposition 1.5 restricted to R-torsion-free modules, KS-v4 line 357.)

The coefficient lines have the following API.

- Each multigraded coefficient line is invertible, with its tensor and base-change identifications induced by the cotangent eigensheaves.
- On its (a,β) component the unit γ acts by the product of the complementary β-weights and the inverse selected (a+1)-weights.
- Over the specified arithmetic domain its Γ-invariants are the whole line for a critical admissible weight and zero otherwise; the general weight-module assertion retains R-torsion-freeness.

One proof route is to compute weights using the Hodge decomposition and determinant. Apply the native comodule weight decomposition and point-action formula. On a nontrivial unit weight choose γ with μ(γ)−1≠0; R-torsion-freeness forces its invariant vectors to vanish. The torsion-free hypothesis is essential in this application.

**Checks.**

- For L=ℚ(i), R=ℤ[i,1/2], Γ=μ₄, a=3 and β=0, the generator i acts on C_(3,0) by i⁻³·i⁻¹=i⁻⁴=1, so the invariants are all of C_(3,0); a model that forgot the determinant would give i⁻³=i and invariants 0.
- For the same L, R and Γ with a=β=0, only the determinant contributes and i acts by i⁻¹=−i; since −i−1=−(1+i) is a unit of R the invariants are 0, in agreement with the type −σ not being trivial on μ₄, whereas a model with trivial coefficient action would give all of C_(0,0).
- For L=ℚ(ζ₃), R=ℤ[ζ₃,1/3], Γ=μ₆ and the weight 3σ, M=R/(2) has nonzero Γ-invariants although the weight is nontrivial over R: a primitive sixth root has weight −1, which becomes 1 modulo 2. The unrestricted-module version must be rejected.

*Needs:* §0.1; §0.2; AbelianSchemesAndArithmeticModuliPartII P0.6; AbelianSchemesAndArithmeticModuliPartII P0.3/P0.5; `TauCeti.Comodule.isInternal_weightSpace`; `TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace`.

### Examples

For ℚ(i), the weight (−2,1) has a=1, β=1; the unequal lifted pair (−1,−2) over ℚ(i,√(1+i)) is inadmissible despite its negative signs. At γ=i, the A-cotangent weight is −i and the complementary cotangent weight is −i, whereas the Lie weight is i.

### Dependencies

GlobalNumberFields Layer 10 (gap:unit-type-classification); ComplexMultiplicationAndExplicitReciprocity §1.3; Mathlib `NumberField.IsCMField`; `TauCeti.Comodule.isInternal_weightSpace`; `TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace`; ComplexMultiplicationAndExplicitReciprocity §1.3; AbelianSchemesAndArithmeticModuliPartII P0.6; AbelianSchemesAndArithmeticModuliPartII P0.3/P0.5. The individual statement and proof-route inputs are specified above.

## Layer 1: Residues and equivariant Eisenstein–Kronecker classes

### 1.1 Trace-zero functions on étale torsion

For an isogeny δ:A→A′ such that δ and δ∨ are étale and commute with Γ, take D=ker δ or ker δ minus the identity section, provided Γ-stable. Let U=A\D and R[D]=H⁰(D,O_D); R[D]⁰=ker(Tr_(D/R)) and R[D]^(0,Γ) its Γ-invariants. Trace is the finite-étale algebra trace, so the construction makes sense before D splits into rational points. For c-regularization use D=A[c] and h_c=Nc·1_e−1_(A[c]). If x=e choose a second coprime c′ and D=A[cc′] minus e: under the Chinese-remainder identification extend by zero the pullback of h_c from (A[c′] minus e)×A[c]. This function has trace (Nc′−1)Tr(h_c)=0; restricting h_c itself to A[c] minus e would not have trace zero.

Assume R affine; finite étale D/R; x∈U for every evaluation. For D=A[c], Nc∈R× and c prime to the relevant torsion conductor; the two-auxiliary construction also requires Nc′∈R×.

(KS-v4, Definition 2.18, Notation 2.19, pp.19–20; Definition 2.26, p.22, KS-v4 line 836; two-auxiliary construction in the proof of Theorem 4.10, p.53, KS-v4 line 2490.)

The construction has the following API.

- Finite étale base change carries R[D]⁰ into the corresponding kernel and commutes with Γ-invariants when justified, not as a blanket exactness assertion.
- The CM regularizer h_c has trace zero, since rank_R R[A[c]]=Nc.
- Over a splitting base, trace agrees with the sum of function values at all geometric torsion points.

One proof route is to use the imported finite-étale algebra and trace and restrict the induced Γ-action. Check the equality deg[c]=Nc by the CM ideal action, then compute the trace of h_c.

**Checks.**

- On a split kernel with three points h_c has values (2,−1,−1), hence trace zero.
- On a nonempty split kernel in characteristic zero the constant function 1 is not trace zero.
- With f=O_L and x=e the unmodified D=A[c] fails x∈U; a second auxiliary ideal is required.
- Tr(h_c)=0 because A[c] has degree Nc, with no extra square on Nc.
- D and x are disjoint in every downstream application.
- For the identity isogeny, D=ker(id) minus e is empty, R[D]=0 and the trace-zero datum is 0. For c=O_L the full-kernel regularizer has value 1−1=0.

*Needs:* §0.2; AbelianSchemesAndArithmeticModuliPartII P2.5; SchemeAndStackFoundations §2.7.

### 1.2 Equivariant residue and inverse-limit comparison

Put F_n=P^(n)⊗Ω_A^d and F=P_hat⊗Ω_A^d. The imported completed Poincaré trace gives H^i(A,Γ,F)=0 for i<d and H^d(A,Γ,F)≃R. For I the ideal of D, local complete-intersection duality gives Ext^q(I^k/I^(k+1),F_n)=0 for q<d and H^(q−d)(D,Hom(I^k/I^(k+1),i*P^(n))) for q≥d. Consequently support cohomology vanishes below d and contains R[D]^Γ canonically in degree d; its map to H^d(A,Γ,F) is Tr_(D/R). Prove H^(d−1)(U,Γ,F)≃lim_n H^(d−1)(U,Γ,F_n), including the vanishing inverse-limit obstruction used in Corollary 2.35. Do not infer vanishing of higher equivariant cohomology from the underlying coherent calculation.

Assume trace-zero datum, δ and δ∨ étale; finite symmetric levels and their compatible transition maps. Γ acts by automorphisms of A over the fixed base S; it acts trivially on S.

(KS-v4, Corollary 2.17, p.19; §2.6, Proposition 2.32 and Corollaries 2.33–2.35, pp.26–27, KS-v4 line 1106.)

One proof route is to import the top coherent Poincaré calculation and the equivariant spectral sequence. Filter O_A/I^(k+1) by I^j/I^(j+1), use regular immersion duality and support localization. Prove the required exactness/Milnor comparison for these particular pro-systems, using the SchemeAndStackFoundations §2.23 request rather than commuting cohomology and inverse limits formally.

**Checks.**

- The injection and trace square commute before passing to the trace-zero submodule.
- The assertion is compatible with a nontrivial Γ-action on A over the fixed base S and is not H^i(A,F)^Γ by definition.

*Needs:* §1.1; AbelianSchemesAndArithmeticModuliPartII P2.3/P2.8; AbelianSchemesAndArithmeticModuliPartII P2.8; SchemeAndStackFoundations §§2.19–2.20; SchemeAndStackFoundations §2.7; SchemeAndStackFoundations §2.23; SchemeAndStackFoundations §2.23 (gap:equivariant-poincare-limit).

### 1.3 Equivariant coherent Eisenstein–Kronecker class

Define EK_(Γ,A):R[D]^(0,Γ)→H^(d−1)(U,Γ,P_hat⊗Ω_A^d) as the unique preimage of the canonical degree-d support class of h under localization. This is an injective R-linear map with residue h and is compatible with its images at every finite Poincaré level. The definition uses derived equivariant sections in the category of Γ-linearized sheaves, not invariants taken after cohomology. Its naturality includes permitted flat base change, pullback through compatible isogeny/residue diagrams, and restriction of Γ.

Assume trace-zero datum and the residue calculation.

(KS-v4, Theorem 2.20 and Definition 2.21, p.20, KS-v4 line 870; proof in §2.6, pp.26–28, KS-v4 lines 1105–1184, with the trace identification and the final injection at KS-v4 lines 1177–1184, p.28.)

The construction has the following API.

- The localization boundary of EK(h) equals the canonical support class of h.
- EK is R-linear and injective.
- A commuting support/trace/base-change diagram carries EK(h) to the class of the transported h, by uniqueness; scalar extension requires flatness or an explicit base-change theorem.

One proof route uses trace zero to place the support class of h in the localization kernel. Vanishing below d makes the preimage unique; retain the full trace square to prove injectivity and naturality.

**Checks.**

- Take d=1, Γ=1 and the norm-three ideal (1+√−2) in ℤ[√−2], over a permitted base inverting 3 and splitting its kernel as {e,P,−P}. For h=(2,−1,−1), the three residues of EK(h) are (2,−1,−1), so EK(h) is nonzero; the zero construction fails.
- On the same kernel k=(0,1,−1) has trace 0, and EK(k) has residue +1 at P and −1 at −P. Its residue at e is 0 rather than 2, so EK(k)≠EK(h); identifying all nonzero inputs or reversing the residue signs fails.
- The constant function (1,1,1) has trace 3≠0 and is rejected. Inverting 3 makes the isogeny and its dual étale; it does not make that trace zero.

*Needs:* §1.2; AbelianSchemesAndArithmeticModuliPartII P2.6; SchemeAndStackFoundations §2.23; SchemeAndStackFoundations §2.7.

### 1.4 Flat derivatives of the coherent class

Let EK♮(h) be the image of EK(h) under P_hat→P_hat♮. Its a-th total derivative is ∇^a EK♮(h) in H^(d−1)(U,Γ,TSym^a Ω_A¹⊗P_hat♮⊗Ω_A^d). Iterate the integrable Poincaré connection with its symmetric tensor convention, so that subsequent projection to a multi-index a produces the factorial a! in the analytic evaluation. The construction is made at finite levels and assembled as a compatible pro-class.

Assume standard residue data; the imported universal vector extension, Poincaré connection and divided symmetric power convention.

(KS-v4, Definitions 2.21 and 2.23, pp.20–21, KS-v4 line 901.)

The construction has the following API.

- ∇⁰EK♮(h)=EK♮(h).
- The derivative commutes with the Γ-action and the permitted pullbacks.
- Projection to the a-index component agrees with iterated coordinate derivatives with the AbelianSchemesAndArithmeticModuliPartII P0 factorial convention; no division by a! over a general integral R is made.

One proof route is to apply the imported flat connection at each symmetric level and symmetrize by the AbelianSchemesAndArithmeticModuliPartII P0 comparison convention. Use integrability for the symmetric target and Γ-equivariance to descend to equivariant cohomology.

**Checks.**

- At a=0 the image is the original pro-class, without an extra factorial.
- For a coordinate monomial z² the second ordinary derivative is 2; the divided-power basis conversion must account for this factor.
- For two commuting coordinate directions the (1,1) derivative of z₁z₂ is 1, not 2.
- For the two-coordinate flat model g=z₂, the derivative in the direction ∂/∂z₁ is 0 and in the direction ∂/∂z₂ is 1; a convention exchanging the two cotangent directions gives 1 and 0.

*Needs:* §1.3; AbelianSchemesAndArithmeticModuliPartII P1.1; AbelianSchemesAndArithmeticModuliPartII P0.4–P0.5; AbelianSchemesAndArithmeticModuliPartII P2.2.

### Examples

On a three-point kernel the regularizer has values (2,−1,−1) and trace 0. With a second five-point kernel, its extension away from the identity has trace 4·0=0; restricting the first function off the identity gives −2 and fails.

### Dependencies

Earlier layers 0; AbelianSchemesAndArithmeticModuliPartII P2.5; SchemeAndStackFoundations §2.7; AbelianSchemesAndArithmeticModuliPartII P2.3/P2.8; AbelianSchemesAndArithmeticModuliPartII P2.8; SchemeAndStackFoundations §§2.19–2.20; SchemeAndStackFoundations §2.23; SchemeAndStackFoundations §2.23 (gap:equivariant-poincare-limit); AbelianSchemesAndArithmeticModuliPartII P2.6; AbelianSchemesAndArithmeticModuliPartII P1.1; AbelianSchemesAndArithmeticModuliPartII P0.4–P0.5; AbelianSchemesAndArithmeticModuliPartII P2.2. The individual statement and proof-route inputs are specified above.

## Layer 2: Critical evaluation and integral refinement

### 2.1 Torsion specialization and group-cohomology moments

Let x∈U(R) be fixed by Γ and killed by φ:A→B with φ∨ étale (equivalently the required lifted universal-extension map is étale). Pull ∇^a EK♮(h) back to x, apply the imported torsion splitting and the b-th moment, and use affine equivariant/coherent comparison. This defines Eis^(b,a)_Γ(h,x)∈H^(d−1)(Γ,TSym^a ω_A⊗TSym^b H⊗det ω_A). Here a,b are total nonnegative degrees; in multi-index notation a,β denote multi-indices with these total degrees. The splitting is the one normalized by the Poincaré rigidification, not an arbitrary trivialization at x.

Assume affine standard datum; x avoids D; φ∨ étale; h trace zero and Γ-invariant.

(KS-v4, Definition 2.24 and equations (2.3.3)–(2.3.4), p.21; Remark 2.25, p.22, KS-v4 line 918.)

The construction has the following API.

- Compatible isogenies, torsion sections and pullbacks commute with specialization and moment maps.
- For b=0 the moment is the rigidified augmentation.
- For fixed (x,b,a), the class depends R-linearly on h.

One proof route is to evaluate the finite-level derivative on x, then take mom_b using AbelianSchemesAndArithmeticModuliPartII P2.5 and P2.1. Combine the equivariant spectral sequence of SchemeAndStackFoundations §2.23 with affine quasi-coherent acyclicity from §2.6 to identify equivariant coherent cohomology on Spec R with group cohomology.

**Checks.**

- An arbitrary non-torsion x has no canonical torsion splitting and cannot enter this constructor.
- At residue characteristic p a p-torsion point whose killing dual is not étale only gives the generic-fiber construction.
- For d=1, Γ=1 and a=b=0 this is the scalar value of the augmented Kronecker section at x.
- The target contains H, not H¹_dR with the contravariant action.
- The zero moment is the augmentation of the torsion splitting.

*Needs:* §1.4; AbelianSchemesAndArithmeticModuliPartII P2.5; AbelianSchemesAndArithmeticModuliPartII P2.1; SchemeAndStackFoundations §§2.6 and 2.23.

### 2.2 Orientation-normalized critical Eisenstein classes

First take Γ torsion-free of rank d−1. Project Eis^(b,a) through H→ω_A∨, then to the critical (a,β) component C_(a,β). Cap with the fundamental class of BΓ=Γ\EΓ, EΓ={(r_i)>0:∏r_i=1}, using the orientation ∧_(i<d)dr_i/r_i. An ordering of Σ also identifies det ω_A with the multidegree-one tensor line; the two permutation signs cancel. Use the rank-one divided-tensor identification u^[a]⊗u↦u^[a+1] on each weight line, rather than shuffle multiplication. This gives EK^(β,a)_Γ(h,x)∈TSym^(a+1)ω_A⊗TSym^βω_A∨. Its coordinate in the chosen divided-power bases is denoted e_(β,a). For Γ with finite torsion T, define the normalized version only after |T| is a unit: choose a free complement Γ₀, evaluate there, and divide by |T|. Prove independence of the complement after this localization. No integral map on arbitrary H^(d−1)(Γ,−) for all torsion Γ is asserted.

Assume critical β−a−1∈CI_L(Γ); Nf∈R× for this evaluation; torsion-free Γ for the integral version. For the torsion-normalized extension, |Γ_tors|∈R× is an explicit extra hypothesis.

(KS-v4, Definitions 2.26 and 2.28, pp.22–23; Proposition 2.27 and diagram (2.4.2), pp.22–23 with torsion-free or localized cap, KS-v4 line 961.)

The construction has the following API.

- Permuting the ordered embeddings changes the fundamental orientation and determinant identification by the same sign, leaving EK unchanged.
- The selected bases identify the critical tensor line with R and define e_(β,a).
- When |T| is invertible, normalized evaluation is |T|⁻¹ times evaluation on a free complement and satisfies full-index change of group.
- For an invertible weight line, the canonical identification TSym^a(M)⊗M≃TSym^(a+1)(M) sends u^[a]⊗u to u^[a+1]. It is independent of the local generator and is distinct from shuffle multiplication, which gives (a+1)u^[a+1].

One proof route is to use coefficient-invariants. The native logarithmic unit lattice and units-modulo-torsion equivalence identify Γ\EΓ with an oriented compact torus. The classifying map from Γ\EΓ to the bar model of Γ induces the identity on π₁=Γ; both spaces have contractible universal cover and CW type, so AlgebraicTopology Stage 8 items 5 and 7 make it a homotopy equivalence. Item 8 identifies its local-system cohomology with native group cohomology, naturally under finite-index inclusions. Apply the imported cap product from Stage 6. Glue the rank-one shift from local generators; its degree a+1 homogeneity makes it basis-independent. Check ordering independence by simultaneous orientation and determinant changes. Use transfer only in its valid form: in degree zero transfer across a finite-index subgroup multiplies by the index. The unrestricted surjectivity assertion in Proposition 2.27 is not used.

**Checks.**

- For d=1, Γ=1 and C=R, cap is the identity R→R.
- For d=2, Γ=ℤ and trivial coefficients M, both the logarithmic circle and Bℤ have H¹=Hom(ℤ,M)=M; an index-m inclusion induces multiplication by m on H¹. With monodromy −1 on M=ℤ, both give H⁰=0 and H¹=ℤ/2, so replacing local coefficients by constant coefficients fails.
- For d=2 a transposition reverses the BΓ orientation and the determinant basis, leaving the final tensor unchanged.
- For d=1 and Γ=μ₂ over a ring with 2 noninvertible, no extension of cap on all H⁰ with the claimed index rule can be integral: it would send 1 to 1/2.
- For a free rank-one line Ru and a=1, the determinant shift sends u⊗u to u^[2], whereas shuffle multiplication gives 2u^[2]. The shift remains an isomorphism when 2 is a nonunit.
- For d=1 and Γ=1 the cap product is ordinary degree-zero evaluation.
- For Γ=μ₂ and Γ₀=1, normalized evaluation requires 1/2; it is not an arbitrary integral R-linear operation.

*Needs:* §2.1; §0.3; SchemeAndStackFoundations §2.23 (gap:equivariant-poincare-limit); Mathlib `NumberField.Units.logEmbeddingEquiv`; Mathlib `NumberField.Units.instZLattice_unitLattice`; AbelianSchemesAndArithmeticModuliPartII P0.4–P0.5; AlgebraicTopology Stage 5 items 3–4 and Stage 8 items 5, 7 and 8; AlgebraicTopology Stage 6 (gap:torus-cap-projection).

### 2.3 Change of unit subgroup with its normalization

For torsion-free Γ′⊂Γ of finite index m, restriction of the equivariant class followed by the critical cap construction satisfies EK^(β,a)_(Γ′)(h,x)=m·EK^(β,a)_Γ(h,x). The same formula holds for the torsion-normalized extensions when both torsion orders are units. For integral classes with torsion orders nonunits retain the torsion-free value and its multiplicity; do not cancel m without a divisibility theorem for that particular class.

Assume both groups fix h and x; β−a−1 is trivial on Γ.

(KS-v4, Corollary 2.29, p.24, restricted or localized as explained for Proposition 2.27, KS-v4 line 1016.)

One proof route is to use the finite covering BΓ′→BΓ, cap-product projection formula and orientation conventions. For the localized extension reduce to free complements and compare their indices.

**Checks.**

- A covering of oriented circles of degree m scales the integral by m.
- The case μ₂⊃1 is not passed off as an integral surjective transfer.

*Needs:* §2.2; AlgebraicTopology Stage 5 items 3–4 and Stage 8 items 5, 7 and 8; AlgebraicTopology Stage 6 (gap:torus-cap-projection).

### 2.4 Refined evaluation without inverting the conductor norm

Let x be f-torsion, c≠O_L coprime to f, Nc∈R×, D=A[c], and B=A(f⁻¹). Without assuming Nf∈R×, map EK♮_A(h) to the pullback of P_hat♮_B via [f]_# and transport the determinant by [f]∨*. Differentiate using the connection on B, evaluate at x (whose image in B is zero), take the moment at e_B, project and cap for a torsion-free Γ. This gives _[f]EK^(β,a)_(Γ,B)(h,x)∈TSym^(a+1)ω_B⊗TSym^βω_B∨ over R. The residue function is h and the conductor ideal is f.

Assume standard based data for A and B; x∈U and fixed by torsion-free Γ; critical indices. [f] itself and its dual may fail to be étale. The unit conductor is excluded: f=O_L forces x=e, which lies in D=A[c], so x∉U.

(KS-v4, Theorem 2.30 and its construction, pp.24–25, with the torsion-free cap convention, KS-v4 line 1032.)

The construction has the following API.

- Chosen B-bases identify the refined tensor with a scalar in R, without inverting Nf.
- Composition of compatible ideal isogenies agrees with iterated pushforward, connection pullback and identity moments.

One proof route is to push the Poincaré coefficient before differentiating so specialization takes place at the identity of B. Use the identity splitting at e_B instead of an unavailable integral splitting at x on A. Apply the same critical projection and torsion-free orientation as above.

**Checks.**

- At a prime dividing Nf the constructor still has an R-valued target, provided Nc is invertible.
- If Nc is a nonunit, this theorem does not assert a residue-class construction from an étale c-kernel.
- For an ordinary Gaussian elliptic datum at 5 with i acting on Lie by 3, take f=(2−i), c=(3) and, after a finite base extension, a nonidentity section x of the étale kernel of [2−i]. The differential of [f] is 2−3≡4 and that of its dual [2+i] is 2+3≡0 modulo 5; [f] has degree 5 and sends x to e_B, Nc=9 is a unit, and x has order 5, so it avoids A[3] also on the special fibre. This instance has Nf=5 a nonunit; the identity isogeny gives no instance, since f=O_L forces x=e∈A[c].
- The result lies over R, with no 1/Nf introduced in the constructor.
- Nc is still a unit; the refinement removes only the evaluation conductor denominator.
- Removing Nf from the denominators does not remove the separate unit-group torsion normalization; keep the hypotheses of §2.2 and the integral unit-index descent of §5.4.

*Needs:* §1.4; §2.2; AbelianSchemesAndArithmeticModuliPartII P2.4; AbelianSchemesAndArithmeticModuliPartII P2.7; ComplexMultiplicationAndExplicitReciprocity §1.3.

### 2.5 Comparison of refined and unrefined evaluations

After the injective scalar extension R→R[1/Nf], the two classes satisfy TSym^(a+1)([f]*) (_[f]EK_(Γ,B)^(β,a))=TSym^β([f]_#)(EK_(Γ,A)^(β,a)), with coefficient lines transported as in equation (2.5.1). Thus the right-hand transported ordinary class has its coordinate in R in the mixed bases of A and B∨. The statement first uses torsion-free Γ; a torsion-normalized version carries its separate index/divisibility condition.

Assume the hypotheses of §2.4; R⊂ℂ so the indicated scalar extension is injective.

(KS-v4, Equation (2.5.1) and Proposition 2.31, p.25, KS-v4 line 1071.)

One proof route is to compare the two torsion splittings after [f] and its dual become étale. Use connection/isogeny compatibility and the moment comultiplication square; descend equality along the injective base extension.

**Checks.**

- The comparison map on ω_A and the map on ω_A∨ are not interchanged.
- An equality after localization is used only with the stated injective coefficient map.

*Needs:* §2.4; §2.1; AbelianSchemesAndArithmeticModuliPartII P2.4.

### 2.6 De Rham cohomology of the completed logarithm coefficient

Let k be a field of characteristic zero, A/k an abelian variety of dimension d≥1, and P♮^(n) the finite Poincaré levels of AbelianSchemesAndArithmeticModuliPartII P2.2 with their integrable connections, identified with the logarithm sheaves Log^(n) by P3.3. Write DR(P♮^(n)) for the de Rham complex P♮^(n)→P♮^(n)⊗Ω¹_A→⋯→P♮^(n)⊗Ω^d_A of ComplexComparisonPartII C5.2, H^i_dR(A,P♮^(n)) for its hypercohomology, and RΓ_dR(A,P̂♮)=R lim_n RΓ(A,DR(P♮^(n))) for the completed coefficient. Normalize the de Rham trace H^(2d)_dR(A/k)→k as the coherent trace H^d(A,Ω^d_A)→k of SchemeAndStackFoundations §2.20 composed with the inverse of the Hodge edge isomorphism H^d(A,Ω^d_A)≃H^(2d)_dR(A/k).

Prove the following four statements.

- For i<2d and n≥1 the transition map H^i_dR(A,P♮^(n))→H^i_dR(A,P♮^(n−1)) is zero. For i=2d the projection P♮^(n)→P♮^(0)=O_A followed by the de Rham trace is an isomorphism H^(2d)_dR(A,P♮^(n))≃k, and the transition maps are the identity under these isomorphisms.
- Consequently RΓ_dR(A,P̂♮)≃k[−2d]: every limit and every first derived limit of the finite-level groups vanishes except lim_n H^(2d)_dR(A,P♮^(n))=k.
- Let a group Γ act on A by automorphisms of abelian varieties over k, and give P̂♮ the Γ-linearization of P2.6. Define RΓ_dR(A,Γ;P̂♮) as the derived limit over n of the Γ-equivariant hypercohomology of DR(P♮^(n)), computed in Γ-equivariant sheaves of k-vector spaces on A by SchemeAndStackFoundations §2.23. Then H^i_dR(A,Γ;P̂♮)≃H^(i−2d)(Γ,k) with trivial action on k. In particular it vanishes for i≤2d−1 and equals k for i=2d.
- Let D⊂A be a finite étale Γ-stable closed subscheme of torsion points with complement U. De Rham support cohomology H^q_(D,dR)(A,P♮^(n)) vanishes for q<2d. In degree 2d it is identified with H⁰(D,ι_D*P♮^(n)) by the local complete-intersection duality of §1.2, applied to P♮^(n)⊗Ω^d_A, followed by the Hodge edge map on supports; prove that this composite is an isomorphism. Under the torsion splitting and moments of P2.5, H⁰(D,ι_D*P̂♮)≃k[D]⊗∏_(j≥0)TSym^j(H) contains k[D] as its TSym⁰-component, onto which the augmentation induced by P̂♮→P♮^(0)=O_A projects. The localization sequence gives an exact sequence
  0→H^(2d−1)_dR(U,Γ;P̂♮)→H^(2d)_(D,dR)(A,Γ;P̂♮)→k,
  whose second map is augmentation onto the TSym⁰-component followed by Tr_(D/k).

The relative theorem over a smooth base concerns the relative logarithm sheaf (Sch-2014, Theorem 1.2.1). This target is its field case, the generality in which P3.3 identifies P̂♮ with the logarithm sheaf. The trace normalization is algebraic; the factor (2πi)^d enters only through the analytic convention of §3.2.

Assume k a field of characteristic zero; A an abelian variety over k; Γ acting by automorphisms fixing the identity; D finite étale over k, consisting of torsion points and Γ-stable.

(KS-v4, Remark 2.16, p.18, KS-v4 line 800, for the vanishing for P̂♮ over a characteristic-zero base; Sch-2014, Theorem 1.2.1, pp.52–53, Sch-2014 line 1894, and Lemma 1.2.3, Definition 1.2.4 and Theorem 1.2.9, pp.54–56, Sch-2014 lines 1954–2069, for the logarithm sheaves and the residue sequence at the identity section; HK-2018, Theorem 3.3.1, p.11, HK-2018 line 456, and Proposition 5.3.1, p.19, HK-2018 line 855, for the sheaf-theoretic vanishing and the residue sequence along a torsion subscheme; HK-2018, Proposition 7.1.2 and Corollary 7.1.3, pp.29–30, HK-2018 lines 1329 and 1389, for the truncated Koszul endpoint groups and the vanishing of the transition maps in the sheaf-theoretic setting.)

One proof route filters P♮^(n) by its truncation kernels π*Sym^k(H) of P2.2. On each graded piece the de Rham cohomology is H^•_dR(A/k)⊗Sym^k(H). The connecting maps are cup product with the first extension class, which P3.3 identifies with id_H. Hence each row of the first page of the hypercohomology spectral sequence is the Koszul complex of H truncated at symmetric degree n. Its second page is k in total degree 2d, from the symmetric-degree-zero piece H^(2d)_dR(A/k); below total degree 2d it consists of the cokernels of the last truncated Koszul differential, which lie in the endpoint pieces H^i_dR(A/k)⊗Sym^n(H). These endpoint groups are nonzero, so no finite level is acyclic below degree 2d. For i<2d it follows that H^i_dR(A,π*Sym^n(H))→H^i_dR(A,P♮^(n)) is surjective. Its composite with the projection to P♮^(n−1) is zero, because π*Sym^n(H) is the kernel of that projection; hence the transition map vanishes in degree i. In degree 2d the edge map to the symmetric-degree-zero quotient O_A, followed by the trace, identifies every level with k, and the transitions become the identity. Pro-zero systems have vanishing lim and lim¹, which gives the completed statement. For the equivariant statement use the spectral sequence H^p(Γ,H^q_dR(A,P̂♮))⇒H^(p+q)_dR(A,Γ;P̂♮) of SchemeAndStackFoundations §2.23. Group cohomology commutes with derived limits. An automorphism of A acts on H^(2d)_dR(A/k) by its degree, which is one. For supports, use local cohomology of the locally free sheaves P♮^(n)⊗Ω^p, concentrated in degree d at the points of D, and SchemeAndStackFoundations §2.7.

**Checks.**

- For d=1 and every n, H⁰_dR(A,P♮^(n)), H¹_dR(A,P♮^(n)) and H²_dR(A,P♮^(n)) have dimensions n+1, n+2 and 1. Their alternating sum is 0, the rank (n+1)(n+2)/2 times the topological Euler characteristic 0 of A(ℂ). Each finite level has nonzero H⁰ and H¹, so the vanishing is a statement about the pro-system: an assertion that H¹_dR(A,P♮^(n)) is eventually zero is false.
- At n=1 the constant section 1 of P♮^(0)=O_A does not lift to a horizontal section of P♮^(1). The connecting map sends it to the extension class id_H≠0 in H¹_dR(A,π*H)=Hom(H,H) when d≥1. Hence H⁰_dR(A,P♮^(1))→H⁰_dR(A,O_A)=k is zero; for the split connection O_A⊕π*H it would be surjective.
- For d=1, [−1] acts by −1 on H¹_dR(A/k) and by +1 on H²_dR(A/k). For Γ=μ₂ acting by [−1], the equivariant group in degree 2 is H⁰(μ₂,k)=k and the groups above it vanish in characteristic zero; an action through the sign on the top line would give 0.
- For L=ℚ(i,√2), d=2 and Γ=⟨1+√2⟩≅ℤ acting on a Serre tensor of type Σ, H⁵_dR(A,Γ;P̂♮)=H¹(ℤ,k)=k. The Γ-invariants of H⁵_dR(A,P̂♮) are 0, since a two-dimensional variety has no de Rham cohomology above degree 4. Equivariant cohomology is not invariants of cohomology.
- Over ℂ the algebraic residue of dz/z at 0 is 1, whereas its integral over a positively oriented small circle is 2πi. The trace here is the algebraic one; a normalization by integration would rescale every residue by 2πi.

*Needs:* AbelianSchemesAndArithmeticModuliPartII P2.2, P2.5, P2.6 and P3.3; ComplexComparisonPartII C5.1 and C5.2; SchemeAndStackFoundations §2.7, §§2.19–2.20 and §2.23.

### 2.7 The de Rham polylogarithm class with residue h

In the situation of §2.6, for h∈k[D]^(0,Γ) define pol_Γ(h)∈H^(2d−1)_dR(U,Γ;P̂♮) as the unique class whose residue in H^(2d)_(D,dR)(A,Γ;P̂♮) is h placed in the TSym⁰-component of the torsion splitting. Existence and uniqueness are the exact sequence of §2.6, since h has trace zero. Its images pol_Γ^(n)(h) at the finite levels form the compatible system determined by the limit; at a single finite level the residue alone does not determine a class. No identification with a realization of the motivic polylogarithm is asserted: the de Rham class is defined by its residue on the coefficient P̂♮≃Log.

Assume the hypotheses of §2.6 and h trace zero and Γ-invariant.

(KS-v4, Remark 2.37, p.29, KS-v4 line 1266; HK-2018, Definition 5.2.2 and Theorem 5.2.3, pp.18–19, HK-2018 lines 792–823, for the sheaf-theoretic class characterized by its residue along a torsion subscheme; Sch-2014, §1.5.2, p.81, Sch-2014 line 3174, for the de Rham class of an elliptic curve.)

The construction has the following API.

- pol_Γ is k-linear and injective in h.
- For a subgroup Γ′⊂Γ, restriction sends pol_Γ(h) to pol_(Γ′)(h).
- For a field extension k⊂k′, base change sends pol_Γ(h) to the class of the transported h.

One proof route defines the class through the exact sequence of §2.6 and obtains the API by uniqueness: each map in the list commutes with residues and preserves the top-degree vanishing.

**Checks.**

- For d=1, Γ=1 and D={e,P,−P}, H¹_dR(A/k)→H¹_dR(U/k) is injective with two-dimensional image, so at level zero the residues determine a class only up to that image: adding the class of the invariant differential leaves the residues unchanged. The uniqueness of pol_Γ(h) uses the vanishing of H¹_dR(A,P̂♮), not the level-zero sequence.
- On the same D the level-zero image of pol(2,−1,−1) is the class of a differential regular on U with simple poles of residues 2, −1 and −1 at e, P and −P. The vector (1,1,1) has trace 3 and is not a residue vector, by the residue theorem on the proper curve A.
- pol_Γ(h)=0 forces h=0, since the residue map is injective on H^(2d−1)_dR(U,Γ;P̂♮). On the same D, pol(2,−1,−1) and pol(0,1,−1) have residues 2 and 0 at e, so a construction identifying all nonzero inputs fails.

*Needs:* §2.6; AbelianSchemesAndArithmeticModuliPartII P2.5.

### 2.8 Comparison with the de Rham polylogarithm

For k a field of characteristic zero, the Hodge-to-de Rham edge map sends EK♮_Γ(h) to pol_Γ(h). The edge map is induced by the inclusion of complexes (P♮^(n)⊗Ω^d_A)[−d]→DR(P♮^(n)), which is Γ-equivariant and compatible with the transition maps. It gives H^(d−1)(U,Γ;P̂♮⊗Ω^d_A)→H^(2d−1)_dR(U,Γ;P̂♮), from the coherent degree d−1 to the de Rham degree 2d−1.

Assume the hypotheses of §1.3 over S=Spec k, with k a field of characteristic zero, and the hypotheses of §2.6. No comparison over arbitrary characteristic-zero bases is claimed.

(KS-v4, Remark 2.37, p.29, KS-v4 line 1266; Remark 3.21, p.41.)

One proof route observes that the edge map is a morphism of the localization triangles for D⊂A, so it commutes with the localization boundaries. On supports it carries the coherent support class of h to its de Rham support class, by the normalization of §2.6. Hence the image of EK♮_Γ(h) has residue h, and §2.7 identifies it with pol_Γ(h).

**Checks.**

- The de Rham degree is 2d−1, distinct from the coherent degree d−1.
- For d=1, Γ=1 and level zero, EK^(0)(h) is a differential on the affine curve U with residues h, and the edge map sends it to its de Rham class, with the same residues.
- Residue compatibility is checked rather than inferred from an isomorphism of unrigidified bundles.
- Do not use this field-base comparison as a theorem giving an absolute logarithm-sheaf connection over an arbitrary arithmetic model.

*Needs:* §1.3; §1.4; §2.6; §2.7; ComplexComparisonPartII C5.2; SchemeAndStackFoundations §2.7.

### Examples

For d=1 the free-group cap is R→R, r↦r. Extending it to Γ=μ₂ with the full-index rule would require 1↦1/2; in ℤ₂ this is not an integral map. The refinement at a nonunit conductor uses the identity splitting of B instead. On an elliptic curve over a characteristic-zero field the de Rham groups of P♮^(n) have dimensions n+1, n+2 and 1 in degrees 0, 1 and 2, with zero transition maps below degree 2, so only the completed coefficient has vanishing cohomology in degree 1; the level-zero residue sequence leaves a two-dimensional ambiguity that the completed one removes.

### Dependencies

Earlier layers 0, 1; SchemeAndStackFoundations §2.6; AbelianSchemesAndArithmeticModuliPartII P2.5; AbelianSchemesAndArithmeticModuliPartII P2.1; SchemeAndStackFoundations §2.23 (gap:equivariant-poincare-limit); Mathlib `NumberField.Units.logEmbeddingEquiv`; Mathlib `NumberField.Units.instZLattice_unitLattice`; AbelianSchemesAndArithmeticModuliPartII P0.4–P0.5; AlgebraicTopology Stage 5 items 3–4 and Stage 8 items 5, 7 and 8; AlgebraicTopology Stage 6 (gap:torus-cap-projection); AbelianSchemesAndArithmeticModuliPartII P2.4; AbelianSchemesAndArithmeticModuliPartII P2.7; ComplexMultiplicationAndExplicitReciprocity §1.3; AbelianSchemesAndArithmeticModuliPartII P2.2, P2.6 and P3.3; ComplexComparisonPartII C5.1 and C5.2; SchemeAndStackFoundations §§2.19–2.20. The individual statement and proof-route inputs are specified above.

## Layer 3: Analytic representatives and current normalization

### 3.1 Unit Borel model and relative Dolbeault complex

For torsion-free Γ of rank d−1 set EΓ={(r_i)>0:∏r_i=1} with γ·r=(|σ_iγ|²r_i), and BΓ=Γ\EΓ. On A(ℂ) let γ·z=(σ_iγ⁻¹z_i). The product action gives the Borel model. Define relative bidegrees by E^(1,0)=pr_A*E_A^(1,0) and E^(0,1)=pr_A*E_A^(0,1)⊕pr_E*E_E¹. The real dimension is 3d−1 and the maximum bidegree is (d,2d−1). With the imported smooth Poincaré connection, the complex of Γ-invariant (d,•)-forms with its ∇″ differential computes the equivariant coherent class at each finite level; assemble the pro-model using the verified inverse-limit comparison.

Assume standard complex datum; torsion-free Γ; compact torus BΓ from the unit theorem.

(KS-v4, §3.2, equation (3.2.1), Definition 3.7 and Lemma 3.8, pp.33–34, KS-v4 line 1456.)

The construction has the following API.

- H_(γr)(γz,γw)=H_r(z,w) for H_r(z,w)=Σr_i z_i barw_i.
- The Γ-invariant relative Dolbeault complex calculates the stated equivariant coherent cohomology.
- The ordered coordinates r₁,…,r_(d−1) give the orientation used by critical cap evaluation.

One proof route is to use the generic Borel comparison requested from SchemeAndStackFoundations §2.23. Combine the relative real de Rham resolution on EΓ with AbelianSchemesAndArithmeticModuliPartII P3.4 Dolbeault resolution on A. Verify the product action preserves the r-dependent Hermitian metric and the bidegree.

**Checks.**

- For d=1 the constraint r₁=1 leaves EΓ a point.
- Multiplying z_i by σ_iγ⁻¹ and r_i by |σ_iγ|² leaves r_i|z_i|² fixed; using γ instead breaks this test.
- At d=2 the model has real dimension five and currents have complementary second degree 3−q, not 2−q.
- For d=1, EΓ is a point and the model reduces to the ordinary Dolbeault complex on A.
- The group action on z is inverse to that on units, while r scales by absolute squares.

*Needs:* §0.2; §1.2; AbelianSchemesAndArithmeticModuliPartII P3.2/P3.4; SchemeAndStackFoundations §2.23 (gap:equivariant-poincare-limit); Mathlib `NumberField.Units.logEmbeddingEquiv`; Mathlib `NumberField.Units.instZLattice_unitLattice`.

### 3.2 Relative currents and residue-normalized integration

For 0≤p≤d and 0≤q≤2d−1, on A(ℂ)×EΓ define D^(p,q) as the continuous dual of compactly supported smooth test forms of bidegree (d−p,2d−1−q), with their usual inductive-limit smooth topology; outside these ranges the current spaces are zero. For a smooth form ω its current is η↦∫η∧ω; extend the differential by (∇″T)(η)=(−1)^(3d−1−p−q)T(∇″η) for a (p,q)-current and dual connection on the tests. This sign follows from Stokes with the order η∧ω; on the (d,q) complex it is (−1)^(2d−1−q). Construct the Γ-equivariant bundle-valued finite-level current complex and prove the inclusion from forms is a quasi-isomorphism. Fix its local Thom/residue normalization to match the algebraic support trace used in Layer 1; in particular the current δ_t·vol has residue the rigidified unit at t. Here δ_t is the Dirac distribution relative to Haar probability on A(ℂ): δ_t·vol=(2πi)^d[t], where [t] is the integration current of the point in the A-direction, extended constantly along EΓ. These are the relative bigraded complexes specific to the unit Borel model; the generic test topology and regularization are the C5.4 current calculus, and the mixed-bidegree connection resolution uses the specified extension contract.

Assume the Borel model; smooth Poincaré coefficients at finite levels; compact supports for tests.

(KS-v4, Definition 3.9 and Corollary 3.10, p.34; Corollary 3.22, p.41, KS-v4 line 1486; Definition 3.19 and equation (3.5.1), p.39, KS-v4 lines 1789–1797, with the Dirac normalization specified here.)

The construction has the following API.

- A smooth (p,q)-form defines a continuous functional on compact test forms by η↦∫η∧ω.
- The dual differential agrees with the smooth differential on embedded forms, with the graded sign from Stokes.
- The finite-level form/current inclusion is a Γ-compatible quasi-isomorphism and preserves the local residue trace.

One proof route is to use C1 local regularization and its homotopy to compare smooth forms and currents, then glue by fine resolutions. Apply the comparison equivariantly at finite levels and retain pro-compatibility. Compute the local oriented-disc residue of δ_t·vol to fix the trace convention, not just its absolute scalar.

**Checks.**

- For d=1 a (1,0)-current tests (0,1)-forms, so their wedge is top real degree two.
- The point integration current [t] pairs to 1 against a test function equal to 1 near t; δ_t·vol pairs to (2πi)^d, and division by this residue factor gives 1.
- A discontinuous algebraic functional on the smooth test-form space is excluded, even if it has the correct linear type.
- Continuity of the linear functional is required; the algebraic dual alone is too large.
- For d=1 and Λ=2ℤ+iℤ, covol_Leb=2, C=−π/2 and vol=πi·dx∧dy. A Lebesgue Dirac would give πi at a test function equal to 1 near t, whereas δ_t relative to Haar probability is twice that Dirac and gives 2πi. The current derivative has value 2πi·h(t) on a test supported near t, so the Lebesgue reading fails when h(t)=1.
- In real dimension two at (p,q)=(1,0), Stokes gives ∫η∧dω=−∫dη∧ω; the differential sign is −1. Reversing the order of the two one-forms reverses their wedge sign.

*Needs:* §3.1; Hyperfunctions HF2.AnalyticPreparation.CurrentResolution; AbelianSchemesAndArithmeticModuliPartII P3.2/P3.4; ComplexComparisonPartII C1.1 (gap:borel-bundle-currents); ComplexComparisonPartII C5.4 (gap:current-residue-trace).

### 3.3 Generalized Eisenstein–Kronecker series

For a full lattice Λ⊂ℂ^d, H(z,w)=Σh_i z_i barw_i with h_i>0 and alternating pairing ⟨z,w⟩=Im H(z,w), define K^ν(H,z,w,s,Λ)=Σ_(λ∈Λ,λ≠−z) overline(z+λ)^ν · exp(2πi⟨λ,w⟩)/‖z+λ‖_H^(2s). The numerator is antiholomorphic. The positive real power is defined through its real logarithm before analytic continuation. Define Λ*={ℓ:⟨ℓ,Λ⟩⊂ℤ} and the completed Mellin function M^ν(s)=π^(−s)Γ(s)K^ν(s). In Re(s)>d+|ν|/2 the series converges absolutely and normally on compact sets with a uniform distance from nonomitted lattice singularities. Define vol_HΛ=(∏h_i)·covol_Leb(Λ), where covol_Leb is `ZLattice.covolume` for product Lebesgue measure on ℂ^d; this is the volume for Re H, since x↦(√h_i·x_i) has real determinant ∏h_i. It is positive. The simple native formulas are `hermitianPairing` and `kroneckerTerm`: the squared norm denominator is exp(s log H(z+λ,z+λ)), and the term λ=−z is zero by an explicit branch. A lattice is a `Submodule` of Fin d → ℂ with `DiscreteTopology` and `IsZLattice` over ℝ.

Assume ν∈ℕ^d; full real rank 2d lattice; positive diagonal Hermitian form.

(KS-v4, Definition 3.11 and Remark 3.12, p.35, KS-v4 line 1506.)

The construction has the following API.

- The Hermitian form is complex-linear in its first variable and conjugate-linear in its second, and H(w,z)=bar(H(z,w)); its imaginary part is alternating.
- For positive h, H(z,z)=Σh_i|z_i|² is real and nonnegative, with equality exactly at z=0.
- The summand is zero at λ=−z; otherwise its numerator and exponential denominator are the displayed products, with nonzero denominator because the squared norm is positive.
- For a∈Λ, translation gives K(H,z+a,w,s,Λ)=exp(−2πi⟨a,w⟩)K(H,z,w,s,Λ); for b∈Λ*, translating w by b leaves K unchanged.
- Absolute convergence holds in Re(s)>d+|ν|/2, locally uniformly away from moving lattice singularities.
- In the convergence region M^ν=π^(−s)Γ(s)K^ν; continuation respects this identity.

One proof route bounds the numerator by a constant times ‖z+λ‖^|ν| and applies Mathlib `ZLattice.summable_norm_sub_rpow` with exponent |ν|−2Re(s)<−2d after equivalence of positive Hermitian and ambient norms. Construct the holomorphic-in-s sum in the convergence half-plane and its translation/multiplicative characters; reserve the continued object for the next target.

**Checks.**

- For d=1, h=2, z=1 and w=i, H(z,w)=−2i and H(w,z)=2i; the alternating pairing is −2 in the first order.
- For d=2, h=(2,3) and z=(1,i), H(z,z)=5, while H(0,0)=0; replacing the second argument by an unconjugated copy gives −1 instead of 5.
- In dimension zero the empty Hermitian sum is 0; the headline theorems require d>0. At h=0 in dimension one, H(1,1)=0 violates positive definiteness.
- For d=1, ν=0, H standard and z=w=0, K is Σ_(m,n)≠(0,0)(m²+n²)^(−s).
- For ν=1 and z+λ=i the numerator is −i, rather than i.
- For z∈Λ the λ=−z term is excluded and never evaluated as 0 divided by 0.
- A term with λ=−z is omitted before applying logarithms.
- K and M are separate names; their residues are not interchangeable.
- For the square lattice the continued K(0)=−1, whereas the total sum at s=0 of the divergent unit terms is 0; the continuation cannot be defined by that total sum.
- With H standard, z=1/2 and w=i/2, the translation multiplier for a=1 is exp(πi)=−1. For zero Hermitian coefficients the squared norm of 1 is 0 and the total real logarithm would give log(0)=0, hence the spurious exponential denominator 1; positivity excludes this model.
- In d=2 at z+λ=(1,0), ν=(0,0) gives numerator 1 while ν=(0,1) gives 0. The vector is retained in the sum; only the entire zero vector is omitted.

*Needs:* Mathlib `IsZLattice`; `ZLattice.summable_norm_sub_rpow`; `Complex.Gamma_eq_integral`.

### 3.4 Poisson continuation with completed residues

K^ν extends meromorphically, and its completion satisfies M^ν(H,z,w,s,Λ)=exp(2πi⟨w,z⟩)/vol_HΛ · M^ν(H,w,z,d+|ν|−s,Λ*). The possible simple residues of M are −δ_(ν=0,z∈Λ) exp(2πi⟨−z,w⟩) at s=0 and δ_(ν=0,w∈Λ*)/vol_HΛ at s=d. Hence K is regular at zero and, when ν=0 and w∈Λ*, has residue π^d/(Γ(d)vol_HΛ) at d. These are corrected normalization statements, not the uncompleted residues attributed in Proposition 3.13. The headline `kronecker_meromorphic_continuation` states existence of a meromorphic F agreeing by `HasSum` with this series for Re(s)>d+|ν|/2, analytic at every s≠d and also at d for ν≠0. At d, (s−d)F(s) has an analytic extension. The headline `kronecker_functional_equation` states the equation for continuations of the primal and alternating-dual series, the displayed residue of K at d, and regularity there when w∉Λ*. Its pointwise completed identity excludes s and d+|ν|−s in −ℕ and excludes either uncompleted pole at d; the meromorphic identity has the displayed completed residues. It does not assign the total sum at divergent s to the continuation.

Assume kronecker-series hypotheses; the dual and volume use the same alternating pairing.

(KS-v4, Proposition 3.13 and its theta transformation proof, pp.35–36, KS-v4 line 1521.)

One proof route applies ThetaSeries Layer 1, items 1A, 1E and 1F, to x↦barx^ν·exp(−πt‖x‖²_H)·exp(2πi⟨x,w⟩), evaluated on z+Λ with the compensating factor exp(−2πi⟨z,w⟩). Use the Euclidean model and Λ*=i·Λ^∨ of the supplier contract. Transform the Gaussian using native fourier_gaussian_innerProductSpace and differentiate to obtain the antiholomorphic moments, retaining the metric covolume. Schwartz decay justifies differentiation. Retain the phase exp(2πi⟨w,z⟩), split the Mellin integral at t=1 and isolate the zero-frequency terms. Multiply by π^s/Γ(s) only after calculating residues of M.

**Checks.**

- Applying the functional equation twice gives identity using vol(Λ*)=vol(Λ)⁻¹ and ⟨z,w⟩=−⟨w,z⟩.
- For Λ=ℤ[i] and h=1, K⁰(s) has residue π at 1 and no pole at zero; K⁰(0)=−1, so M has residue −1 at zero and 1 at one.
- For d=1, h=2 and Λ=ℤ[i], Λ^∨=Λ*=½ℤ[i]. The Lebesgue covolumes are 1 and 1/4, while the metric covolumes are 2 and 1/2, with product 1. K(s)=2^(−s)K_(h=1)(s) has residue π/2 at one, agreeing with π/vol_HΛ.
- For h=1 and Λ=2ℤ+iℤ, Λ^∨=½ℤ+iℤ while Λ*=ℤ+(i/2)ℤ. The vector 1/2 is in the real dual but pairs with i to −1/2, so it is not in the alternating dual. Both metric covolumes of the duals are 1/2, inverse to vol_HΛ=2.
- For ν=0, z=w=0 and d=1, at s=0 the total Gamma value is 0 and the reflected K has a pole at one; the pointwise product would give 0, whereas M has residue −1 at zero and 1 at one. Gamma poles must be excluded from the pointwise identity.
- For H standard, z=1/2 and w=i/2, ⟨w,z⟩=1/4 gives phase i; the reversed order gives −i. Applying the functional equation again multiplies the phases to 1.

*Needs:* §3.3; ThetaSeries Layer 1 (1A, 1E, 1F), 2A and 2C; Mathlib `fourier_gaussian_innerProductSpace`; Mathlib `mellin`; Mathlib `Complex.Gamma_eq_integral`.

### 3.5 Residue-normalized Eisenstein–Kronecker current

Let vol(A)=∫_A ∧_i(dz_i∧dbarz_i)=(-2i)^d times the positive real covolume of Λ, so vol(A)≠0. Put C=(2πi)^d/vol(A)=(−π)^d/covol_Leb(Λ), vol=C·∧_i(dz_i∧dbarz_i), χ_ℓ(z)=exp(2πi⟨ℓ,z⟩), and v_ℓ=Σ_i(barℓ_i/r_i)∂/∂barz_i for ℓ in the standard alternating dual lattice. For b,j≥0 set Φ_s^(b,j)=(-1)^(j+b)Γ(s)/j! · Σ_t h(t) Σ_(ℓ≠0) v_ℓ^[b] χ_ℓ(z−t) (π‖ℓ/√r‖²)^(−s) ι_(v_ℓ)(dι_(v_ℓ))^j vol. Define Φ^(n)=Σ_(b≤n,0≤j<d) Φ_(b+j+1)^(b,j), by meromorphic regularization in the current topology. Terms with j≥d vanish. The factor (-1)^b corrects the inverse-power binomial expansion in the d+ν convention. With u_i=dr_i/r_i and E=−Σr_i∂_(r_i), contraction has coefficient (-1)^(j+1)j! C in the epsilon expansion of Lemma 3.16; at j=d−1 it is (-1)^(d(d+1)/2)d! C·(barℓ/r)^1·(∧_(i<d)u_i)∧(∧_i dz_i). Away from D these currents are smooth and have the corresponding K-series expressions.

Assume split torsion residue data after a permitted scalar extension; Σ_t h(t)=0; finite symmetric level n. The normalization of currents is the one in §3.2: vol=(2πi)^d times Haar probability and δ_t·vol=(2πi)^d[t].

(KS-v4, Definitions 3.15 and 3.18, pp.37–39; Lemma 3.16, p.37; Proposition 3.17, p.38; binomial expansion in proof of Theorem 3.20, p.41, corrected for the contraction and binomial signs, KS-v4 line 1598.)

The construction has the following API.

- Truncating symmetric degree from n+1 to n carries Φ^(n+1) to Φ^(n).
- The epsilon and top contraction coefficients are the corrected ones stated above; all j≥d terms vanish.
- On U the current is the smooth regularized Kronecker expression with factor (-1)^(b+1) relative to the displayed expression of Proposition 3.17.

One proof route is to use polynomial-growth Fourier coefficients to define distributions, then apply the Mellin continuation to regularize and identify the smooth expression away from the support. Compute ι_v dz_i∧dbarz_i=−(barℓ_i/r_i)dz_i and d(barℓ_i/r_i)=−(barℓ_i/r_i)u_i; the exterior algebra expansion gives the stated coefficient. Expand (A+v)^(-j−1) with coefficient (-1)^b binomial(j+b,b), retaining divided-power conversion.

**Checks.**

- For d=1, ι_v(dz∧dbarz)=−v·dz.
- For d=2 and u₂=−u₁ the top contraction is −2C v₁v₂ u₁∧dz₁∧dz₂.
- (A+v)⁻¹=A⁻¹−vA⁻² modulo v²; using a positive linear term fails the flat-connection differential equation.
- In d=1,b=0 the contraction is −C·barℓ/r·dz; changing it to +C reverses the residue. For the square lattice vol(A)=−2i and C=−π, giving +π·barℓ/r·dz.
- The b=1 coefficient has the opposite sign to b=0, as required for cancellation in d+ν.
- The j=d−1 top coefficient at d=2 is −2C, and at d=3 is +6C.

*Needs:* §3.2; §3.4; AbelianSchemesAndArithmeticModuliPartII P3.2/P3.4; AbelianSchemesAndArithmeticModuliPartII P0.3/P0.5.

### 3.6 The current realizes the coherent class

The corrected compatible current Φ satisfies ∇″Φ=δ_h·vol and is ∇″-closed on U. Under the trace-normalized current/coherent comparison it represents EK_Γ(h). Its flat universal-extension image, a ∇-closed current with ∇Φ=δ_h·vol, represents under the analytic de Rham comparison the class pol_Γ(h) of §2.7, base changed along the chosen embedding into ℂ. The zero Fourier term disappears because Tr(h)=0; no unregularized pointwise convergence at a torsion pole is asserted.

Assume corrected current, residue convention, torsion-free Borel model and finite-level comparison.

(KS-v4, Definition 3.19, Theorem 3.20 and Corollary 3.22, pp.39–41, with the contraction and binomial signs, KS-v4 line 1795.)

One proof route starts at large Re(s), differentiates termwise in the current topology and telescopes in symmetric degree. Continue the identity and use trace zero to remove the constant mode. Verify the supported residue is precisely h in the algebraic normalization; uniqueness in localization then identifies the class. For the de Rham statement apply §2.8 after base change to ℂ, and compare algebraic and analytic coefficient de Rham cohomology by analytifying the complexes of ComplexComparisonPartII C5.2 on A and on the supports at D, then the five lemma on U.

**Checks.**

- At d=1, b=0 and Λ=2ℤ+iℤ, the local residue h(t) gives (∇″Φ)(η)=2πi·h(t) for η equal to 1 near t and supported away from the other residue points. With h=(1,−1), the two local values are +2πi and −2πi; their sum is 0, as required by trace zero. Haar-normalized δ_h·vol gives these same values, whereas a Lebesgue Dirac gives +πi and −πi.
- Residue equality includes the orientation sign, not only an unspecified nonzero scalar.

*Needs:* §3.5; §1.3; §2.7; §2.8; ComplexComparisonPartII C5.1 and C5.2.

### Examples

For the square lattice, ν=z=w=0, the uncompleted series has residue π at 1 and is regular at 0. The completed residues are 1 at 1 and −1 at 0. For d=2 the top contraction is −2C v₁v₂ u₁∧dz₁∧dz₂; in dimension three its coefficient is +6C.

### Dependencies

Earlier layers 0, 1, 2; Hyperfunctions HF2.AnalyticPreparation.CurrentResolution; AbelianSchemesAndArithmeticModuliPartII P3.2/P3.4; SchemeAndStackFoundations §2.23 (gap:equivariant-poincare-limit); Mathlib `NumberField.Units.logEmbeddingEquiv`; Mathlib `NumberField.Units.instZLattice_unitLattice`; ComplexComparisonPartII C1.1 (gap:borel-bundle-currents); ComplexComparisonPartII C5.4 (gap:current-residue-trace); ComplexComparisonPartII C5.1 and C5.2; Mathlib `Complex.Gamma_eq_integral`; ThetaSeries Layer 1 (1A, 1E, 1F), 2A and 2C; Mathlib `fourier_gaussian_innerProductSpace`; Mathlib `mellin`; AbelianSchemesAndArithmeticModuliPartII P0.3/P0.5. The individual statement and proof-route inputs are specified above.

## Layer 4: Orbit sums and explicit critical classes

### 4.1 Eisenstein series over unit orbits

For an O_L-fractional lattice Λ⊂ℂ^Σ, a torsion class t∈(ℚ⊗Λ)/Λ, and Γ preserving Λ, define E^(β,α)(t,s;Λ,Γ)=Σ′_(λ∈Γ∖(Λ+Γt)) barλ^β/(λ^α N(λ)^s), where N(λ)=∏_σ|λ_σ|² and zero is omitted. Require β−α∈CI_L(Γ), so the summand is well-defined on orbits. Admissibility gives β_barσ−α_σ=w for every σ∈Σ, with barσ the complex-conjugate embedding and w the parallel conjugate sum, so the summand has absolute value N(λ)^(w/2−Re s). Initially take Re(s)>1+(|β|−|α|)/(2d)=1+w/2, where the series converges absolutely, and then its meromorphic continuation supplied by fibre integration. The value depends on the Γ-orbit of t. For subgroup changes the orbit multiplicities, including any finite torsion, are explicit.

Assume α strictly positive on Σ; β≥0 on barΣ; lattice and unit actions compatible.

(KS-v4, Definition 3.24 and Lemma 3.25, p.43; Lemma 3.25, KS-v4 line 2021; the initial half-plane of Definition 3.24, KS-v4 line 2008, is replaced by the one stated here.)

The construction has the following API.

- Changing a representative t within its Γ-orbit modulo Λ leaves E unchanged.
- If Γ fixes t modulo Λ then E(t,s;Λ,Γ′)=[Γ:Γ′]E(t,s;Λ,Γ). In general let t_i represent Γ′-orbits in Γt; then Σ_i E(t_i,s;Λ,Γ′)=[Γ:Γ′]E(t,s;Λ,Γ).
- For c∈L×, homothety gives E^(β,α)(ct,s;cΛ,Γ)=barc^β c^(−α)N(c)^(−s)E^(β,α)(t,s;Λ,Γ).

One proof route is to check the Γ-invariance of the summand using the critical weight and |Norm γ|=1. Use the convergence estimate for a unit fundamental domain; obtain continuation from the next target rather than assuming a value at s=0.

**Checks.**

- For L=ℚ(i), Γ=μ₄ and α=4, β=0, one Γ-orbit contributes once, whereas the full lattice sum contributes four times.
- For Γ=μ₄ the weight α=1, β=0 is not invariant and cannot define an orbit sum with that Γ.
- At t=0 the zero vector is excluded even when the continuation at s=0 exists.
- For L=ℚ(i), Γ=μ₄, Γ′=1 and t=1/3 mod ℤ[i], the four translates are distinct. With α=4, β=0 each single-coset Γ′ series equals the Γ series, not four times it; summing the four Γ′ torsion orbits supplies the factor four.
- The λ=0 orbit is always omitted.
- Replacing the orbit sum by the lattice sum over Λ+Γt changes each nonzero orbit by its size: for Γ=1 the two sums coincide, for Γ=μ₄ with invariant weight the lattice sum has multiplicity 4, and for an infinite finite-index unit subgroup (d>1) every nonzero orbit is infinite, so the lattice sum is not a replacement.
- For L=ℚ(i,√2), d=2, Λ=O_L, t=0, Γ=⟨1+√2⟩, α=(6,6) and β=0, the type is trivial on Γ because N_(L/ℚ(i))(1+√2)=−1, and w=−6. At s=−3 the bound d+(|β|−|α|)/2=−4 would admit s, but distinct positive integers n lie in distinct Γ-orbits and each contributes n⁻¹²/(n⁴)⁻³=1, so the series diverges; the bound 1+w/2=−2 excludes s=−3, and at s=−1 the same terms are n⁻⁸.

*Needs:* §0.1; §3.3.

### 4.2 Fibre integration of Kronecker series

Let Γ be torsion-free and let T_Γ(t′) be the finite orbit of the torsion class t′ in (ℚ⊗Λ)/Λ. For critical β−α with α≥1, Γ(α+s)E^(β,α)(t′,s;Λ,Γ) equals d·Σ_(t∈T_Γ(t′))∫_(BΓ) Γ(|α|+ds)·K^(β+α)(H_r,t,0,|α|+ds,Λ)·∏_i(πr_i)^(α_i+s)/π^(|α|+ds) ·∧_(i<d)dr_i/r_i. Here Γ(α+s)=∏_iΓ(α_i+s). The leading d is the Jacobian of (r,u)↦(ur_i) on the product-one r-torus. Establish the equality in the half-plane Re(s)>1+(|β|−|α|)/(2d) of §4.1, which is exactly the region Re(|α|+ds)>d+(|α|+|β|)/2 where the Kronecker series K^(β+α) converges, and its meromorphic continuation to the regular critical evaluation. The sum is over every torsion point in the orbit, not over one orbit representative.

Assume orbit-series hypotheses; convergence half-plane for initial unfolding; torsion-free Γ.

(KS-v4, Lemma 3.26, p.44, KS-v4 line 2029.)

One proof route is to unfold BΓ and the unit orbit simultaneously; use absolute convergence for Tonelli/Fubini initially. Substitute positive coordinates to evaluate the product gamma integral. Continue the identity meromorphically and evaluate at the regular critical point.

**Checks.**

- The product gamma factor at s=0, α=a+1, equals a!.
- For d=1 there is no r-integral and the identity reduces to the gamma factor times the lattice orbit sum.
- The Jacobian factor is d: at d=2, dlog(ur₁)∧dlog(ur₂) has absolute coefficient 2 in dlog u∧dlog r₁.

*Needs:* §4.1; §3.4; §3.1; Mathlib `Complex.Gamma_eq_integral`; Mathlib `mellin`.

### 4.3 Explicit critical class in analytic and algebraic bases

For torsion-free Γ the corrected conventions give EK^(β,a)_Γ(h,x)=ε(d,a,β)·a!·Σ_(t∈Γ\D) h(−t)E^(β,a+1)(t+x,0;Λ,Γ) dz^[a+1]⊗ubar^[β], where ε(d,a,β)=(-1)^(d(d+1)/2+|a|+|β|+1); in terms of the value index α=a+1 this is (-1)^(d(d−1)/2+|α|+|β|+1). The top-degree BΓ representative is the top contraction of the corrected current, projected to (a,β), differentiated by a, and evaluated at x; it carries ε(d,a,β) in place of the sign (-1)^(d(d−1)/2) of Proposition 3.23, and the fibre integral of §4.2 and the oriented cap add no further sign. In the algebraic bases replace ubar^[β] by q^(−β)ω_A∨^[β], q=⟨barω_A,ω_A∨⟩_dR, the conjugate de Rham pairing of ComplexMultiplicationAndExplicitReciprocity §1.3; the conjugation in q survives the comparison, and §5.1 later converts q into the dual period Ω∨. For torsion Γ use only the localized normalization of Layer 2. The formula includes the residue-to-current and orientation compatibility. The moment map of §7.1 identifies its moments with these coordinates, and the linear combinations of §7.4 and weighted pushforward of §8.3 retain ε(d,a,β).

Assume standard datum, x outside D; β−a−1 critical; torsion-free Γ for the integral cap. The analytic trace convention of §3.2 is used.

(KS-v4, Proposition 3.23, p.42; Theorem 3.27 and Corollary 3.28, pp.44–45; the contraction and binomial signs and the residue/orientation comparison, KS-v4 line 2094.)

One proof route is to extract the top (d−1)-form in r from Φ. Relative to the printed formula, the corrected epsilon coefficient of Lemma 3.16(2) contributes −1, the binomial sign contributes (-1)^|β|, the volume constant C=(−π)^d/covol_Leb(Λ) of §3.5 contributes (-1)^d, and holomorphic differentiation ∂_z^a χ_ℓ=(−π barℓ)^a χ_ℓ contributes (-1)^|a|; together (-1)^(d+|a|+|β|+1). Apply the fibre integral and compare the divided-power versus ordinary monomial bases. Use the CM period pairing to pass to algebraic bases. Verify the local coherent trace comparison of §3.2 and the oriented cap before identifying the coefficient.

**Checks.**

- At d=1, Γ=1 and a=β=0 on ℂ/ℤ[i] (C=−π), the level-zero current is Φ^(0)=Σ_t h(t)G(z−t)dz with G(u)=Σ_(ℓ≠0) barℓχ_ℓ(u)/|ℓ|². Since ∂_ū χ_ℓ=πℓχ_ℓ, Poisson summation gives ∂_ū G=π(Σ_λ δ_λ−1)=∂_ū E^(0,1)(u,0), with δ_λ the Haar-normalized Dirac of §3.2 (equal to the Lebesgue Dirac for this lattice); the difference G−E^(0,1)(u,0) is holomorphic, periodic and odd, hence 0. So Φ^(0) has residue +h(t) at t and its derivative pairs locally to 2πi·h(t), in agreement with δ_h·vol. For Λ=2ℤ+iℤ the same local value is 2πi·h(t), because the Fourier coefficient 1/covol_Leb and the Haar Dirac factor covol_Leb cancel. The coefficient is ε(1,0,0)=+1; a coefficient −1 here would contradict the residue normalization of §3.2.
- At d=1 the coefficient is (−1)^(a+β)a!, because ∂_z(z+λ)⁻¹=−(z+λ)⁻². For a=1, β=0 it is −1!=−1, and for a=2, β=0 it is +2!=+2; a sign independent of a cannot give both coefficients.
- For Λ=ℤ[i], Γ=1, c=(2), h=h_c (value 3 at e and −1 at the other three 2-torsion points), x=1/3, a=2 and β=0, the class is +2!·(4E^(0,3)(1/3,0)−8E^(0,3)(2/3,0))=+24E^(0,3)(1/3,0), using oddness at 2/3≡−1/3. The absolutely convergent value E^(0,3)(1/3,0) is about 23.47, so the class is about +563.3; omitting the volume factor (−1)^d of C gives about −563.3.
- Admissibility gives β_barσ−α_σ=w for every σ, hence |a|+|β|≡d(w+1) modulo 2 and ε(d,a,β)=(−1)^(d(d+1)/2+d(w+1)+1): at d=1 this is (−1)^(w+1), and at d=2 it is +1 for every admissible critical type, for instance a=(1,1), β=0, whose coefficient is +1!·1!=+1; the printed sign (−1)^(d(d−1)/2) of Theorem 3.27 is −1 there.
- The pairing uses barω_A; writing ω_A without conjugation changes q.

*Needs:* §3.6; §2.2; §4.2; ComplexMultiplicationAndExplicitReciprocity §1.3; AbelianSchemesAndArithmeticModuliPartII P0.4–P0.5.

### Examples

With Γ=μ₄, Γ′=1, t=1/3 modulo ℤ[i], α=4 and β=0, the four translated torsion classes are distinct. Each individual Γ′-coset series equals the Γ-orbit series; their sum has multiplicity 4. For d=2 the logarithmic Jacobian has absolute value 2.

### Dependencies

Earlier layers 0, 1, 2, 3; Mathlib `Complex.Gamma_eq_integral`; Mathlib `mellin`; ComplexMultiplicationAndExplicitReciprocity §1.3; AbelianSchemesAndArithmeticModuliPartII P0.4–P0.5. The individual statement and proof-route inputs are specified above.

## Layer 5: Periods and integral critical Hecke values

### 5.1 Ideal structures and compatible complex periods

An a-structure is an O_L-linear isomorphism ξ_a:a≃H₁(A(ℂ),ℤ), extended L-linearly on rational homology; it is not a generator of the possibly nonprincipal ideal a. For an abelian scheme A over R⊂ℂ with dual A∨, prove that the de Rham duality between H_A and H_A∨ induced by AbelianSchemesAndArithmeticModuli A4.3, normalized as cup product with the de Rham first Chern class of the Poincaré bundle of A2.2, extended to ℂ and restricted along the de Rham–Betti comparison, takes H₁(A(ℂ),ℤ)×H₁(A∨(ℂ),ℤ) into 2πiℤ, and that the resulting Betti pairing ⟨·,·⟩_top is perfect onto 2πiℤ. When O_L acts on A, and on A∨ through the dual action, prove ⟨xγ,γ′⟩_top=⟨γ,xγ′⟩_top for x∈O_L. Define the trace-dual structure ξ_a∨:a⁻¹d_L⁻¹→H₁(A∨(ℂ),ℤ) by ⟨ξ_a(x),ξ_a∨(y)⟩_top=2πi·Tr_(L/ℚ)(xy) for x∈a. Prove that it is an O_L-linear isomorphism: perfectness identifies H₁(A∨(ℂ),ℤ) with Hom_ℤ(a,ℤ), and the trace form identifies Hom_ℤ(a,ℤ) with the trace dual of a, which is a⁻¹d_L⁻¹ by Mathlib `FractionalIdeal.dual_eq_mul_inv` and `coeIdeal_differentIdeal`.

For an O_L-structure set Ω=⟨ω_A,ξ_(O_L)(1)⟩ and Ω∨=⟨ω_A∨,ξ_(O_L)∨(1)⟩, where 1∈d_L⁻¹. Prove Ω∨=2πi q/barΩ componentwise, for the conjugate de Rham pairing q=⟨barω_A,ω_A∨⟩ of ComplexMultiplicationAndExplicitReciprocity §1.3. On A(a)=a⊗_(O_L)A the induced periods remain Ω and the lattice becomes aΩ. For a=f b⁻¹ transport bases by [f]*([b]*)⁻¹ when these maps are étale. The point Ω mod fΩ on A(f), after making it R-rational, transports under [b] to Ω mod f b⁻¹Ω. Serre construction from K repeats the K-periods on the embeddings above each embedding of K.

Assume standard datum for the periods and their transport. The Betti duality holds for every abelian scheme over R⊂ℂ, and the trace-dual structure for every a-structure. The dual ideal includes the inverse different; isogeny base changes retain all chosen bases and rationality of x_Ω.

(KS-v4, Definitions 4.3 and 4.5, Proposition 4.6, pp.47–48, KS-v4 lines 2231–2278, with the Betti/de Rham compatibility at KS-v4 lines 2239–2248; Proposition 4.7, pp.48–49; Definition 4.8, p.50; §4.5, pp.53–54.)

The construction has the following API.

- ⟨·,·⟩_top is perfect onto 2πiℤ and O_L-balanced.
- ξ_a∨ is an O_L-linear isomorphism a⁻¹d_L⁻¹≃H₁(A∨(ℂ),ℤ).
- A(a)(ℂ)≃ℂ^Σ/(aΩ) with the transported differential bases.
- Ω∨=2πi q/barΩ componentwise, for the trace-dual Betti structure.
- Transport along [f] and [b] agrees with the Serre tensor identification when their cotangent maps are isomorphisms.

One proof route identifies H₁(A∨(ℂ),ℤ) with Hom(H₁(A(ℂ),ℤ),ℤ) through AbelianSchemesAndArithmeticModuli A2.2, A5.1 and A5.3 and proper GAGA: A∨(ℂ) is the torus of topologically trivial line bundles, which are given by the unitary characters of the lattice. Compare 2πi times the resulting evaluation pairing with the A4.3 pairing through the de Rham–Betti comparison of ComplexComparisonPartII C5.1. The trace form then gives the dual lattice. For the period relation expand ξ_(O_L)(1) and the class pairing with every ξ_(O_L)(x) to 2πi·Tr(x) in the bases dual to ω_A and barω_A, using that ω_A and ω_A∨ are orthogonal under A4.3. Tensor the integral Betti lattice and Lie comparison with a, rather than choosing a principal generator.

**Checks.**

- An a-structure for a nonprincipal ideal still exists in the formulation; replacing it by a single integral generator is disallowed.
- Replacing ω_A by uω_A multiplies Ω by u and changes q by baru, with the dual period relation still valid.
- For an imaginary quadratic lattice O_KΩ, its trace-dual lattice is d_K⁻¹ rather than O_K unless the different is trivial.
- A nonprincipal ideal is permitted and does not require ξ_a(1) to be integral; use its rational extension for that notation.
- The same Ω is used for all ray-class representatives.
- For K=ℚ(i), the different is (2i), so the trace-dual lattice of ℤ[i] is (1/(2i))ℤ[i]. Its basis pairings satisfy Tr(1·1/2)=1 and Tr(i·(−i/2))=1.
- For L=ℚ(i) and an O_L-structure, ⟨ξ(1),ξ∨(1)⟩_top=2πi·Tr(1)=4πi. Restricting the defining formula of ξ∨ to y∈ℤ[i] gives a sublattice of index N(d_L)=4 in H₁(A∨(ℂ),ℤ), so the trace dual and not O_L is the domain of ξ∨.
- For d=1 the class pairing with each ξ(x) to 2πi·Tr(x) is 2πi(ω_A/Ω+barω_A/barΩ), in the basis dual to the periods Ω and barΩ of ξ(1). Its pairing with ω_A∨ is 2πi q/barΩ, because ⟨ω_A,ω_A∨⟩=0. A version without the conjugation, pairing ω_A in place of barω_A, would give 0.

*Needs:* §0.2; ComplexMultiplicationAndExplicitReciprocity §1.3; AbelianSchemesAndArithmeticModuli A2.2, A4.3, A5.1 and A5.3; ComplexComparisonPartII C5.1; AbelianSchemesAndArithmeticModuliPartII P2.4; Mathlib `FractionalIdeal.dual_eq_mul_inv` and `coeIdeal_differentIdeal`.

### 5.2 Critical-value normalization

For α:Σ→ℕ with α≥1 and β:barΣ→ℕ set 𝒩_(α,β)(v)=(∏_σ(α_σ−1)!)·(2πi)^(Σβ)·v/(Ω^α(Ω∨)^β), with all period coordinates nonzero, since they compare the chosen Betti and differential bases. Here Ω^α and (Ω∨)^β are products over their respective embedding sets and no factorial of a total degree is substituted for the product. This normalization is ℂ-linear in v. It is defined for any complex value; algebraicity and integrality of particular L-values are theorem targets, not fields of this definition.

Assume nonzero complex periods with specified bases; positive α; β≥0.

(KS-v4, Theorem 4.9, p.50; Theorem 4.10, p.51; Theorem 5.27, p.74, KS-v4 line 2353.)

The construction has the following API.

- 𝒩_(α,β)(u+v)=𝒩(u)+𝒩(v) and 𝒩(cv)=c𝒩(v).
- For coordinatewise nonzero scaling factors u and v, replacing Ω by uΩ and Ω∨ by vΩ∨ multiplies the result by u^(−α)v^(−β).
- For α=1, β=0 the normalizer is division by ∏Ω_σ.

One proof route is to use finite products and ordinary complex powers on these carriers. Derive the scaling rules directly, keeping Σ and barΣ separate.

**Checks.**

- In d=1, α=3 and β=0 the normalizer is 2v/Ω³.
- In d=1, α=2 and β=1 it is (2πi)v/(Ω²Ω∨).
- 𝒩_(α,β)(0)=0 even when all periods are nonzero; this prevents an erroneous target in algebraic units.
- A zero special value stays zero; the normalization has no nonvanishing axiom.
- Changing α from 2 to 3 in one coordinate introduces the required 2! factor.

*Needs:* §5.1; §0.1.

### 5.3 Partial Hecke L-functions as unit-orbit series

Use the ideal-theoretic convention χ((λ))=λ^(β−α) for λ≡1 mod f. For a ray class [b] prime to f, L_f(χ,s,[b])=χ(b)Nb^(−s) E^(β,α)(1,s;f b⁻¹,O_f×). The L-function is the AutomorphicLFunctionsAndLocalFactors AL.1 Hecke L-function with the following explicit normalization: if μ(σ)+μ(barσ)=w, set χᵘ(a)=χ(a)Na^(−w/2), so L_f(χ,s)=L_f(χᵘ,s−w/2). At finite uniformizers the idelic unitary avatar takes value χᵘ(v); its archimedean component is fixed by triviality on L×. Apply AutomorphicLFunctionsAndLocalFactors AL.1 in that convention, transporting its gamma factors through the same shift. At s=0 the identity supplies its critical value, and finite sums over the ray classes give L_f(χ,0). For f=O_L omit the zero vector in the lattice sum.

Assume χ algebraic critical of conductor f; b integral prime to f; ideal/Artin convention fixed.

(KS-v4, Lemma 4.2 and equations (4.1.2)–(4.1.3), p.47, KS-v4 line 2213.)

One proof route identifies the ideals in a fixed ray class with generators in 1+f b⁻¹ modulo O_f×. Check χ and norm factors on a principal ideal, then continue the equality from its absolute convergence domain.

**Checks.**

- At b=O_L the coefficient is χ(b)Nb^(−s)=1; for a general b its factor is χ(b), so replacing it by its inverse reverses the principal-generator relation.
- The unitary norm shift is s−w/2; for χ(a)=Na^m it reduces to ζ_L(s−m), since w=2m.
- For the norm character χ(a)=Na and w=2, χᵘ=1 and the shifted function is ζ_L(s−1); using s+1 gives the wrong Euler denominator 1−Nv^(−s−1).

*Needs:* §4.1; GlobalNumberFields Layers 9–10 (gap:hecke-padic-avatar); AutomorphicLFunctionsAndLocalFactors AL.1, “Rank-one specialisation and Hecke comparison”.

### 5.4 Integrality of normalized Eisenstein sums

Let f,b,c be pairwise coprime integral ideals, a=f b⁻¹, and use the O_L-structured based abelian scheme and the R-rational x_Ω from §5.1. For a trace-zero O_f×-invariant torsion function h, prove 𝒩_(α,β)(Σ_(t∈O_f×∖(c⁻¹a/a)) h(−t)E^(β,α)(t+1,0;a,O_f×))∈R[1/(f N(bc))]. Begin with the torsion-free-group formula, where the refined evaluation is integral, then justify the passage to the normalized full unit-orbit sum. When a torsion index is a unit its division is valid; when it is not, prove the specific divisibility statement for these residue classes. More precisely, for every finite-index torsion-free Γ₀⊂O_f× fixing the data, prove that the oriented critical class EK^(β,a)_(Γ₀)(h,x) lies in [O_f×:Γ₀] times the integral critical tensor line over R[1/(f N(bc))]. This is a statement about the selected critical coordinates. The integral descent of weighted ray-quotient measures is the separate theorem of §8.3.

Assume α≥1, β≥0 with β−α∈CI_L(O_f×); h∈R[1/Nc][D]^(0,O_f×); x avoids D. The common period data and all cotangent transports are fixed.

(KS-v4, Theorem 4.9 and equation (4.3.1), pp.50–51, KS-v4 line 2353.)

One proof route is to apply §2.5 to A(a)→A(b⁻¹) with the bases [f]*([b]*)⁻¹ω_A and [b]_#ω_A∨. Use §4.3 and Ω∨=2πi q/barΩ; the remaining sign is a unit and does not affect integrality. Track the stated ideal and norm localizations and complete the full-unit divisibility argument.

**Checks.**

- The theorem does not assume Nf is globally invertible in the initial datum.
- A proof that only gives |tors(O_f×)| times the claimed value integral is insufficient when that integer is a nonunit.
- For d=1, O_f×=μ₂ and Γ₀=1, the target is EK_1∈2C over the stated localization, equivalently EK_1/2∈C inside Frac(R)⊗C. At h=0 both values are 0; an arbitrary cohomology coordinate 1 over ℤ₂ gives 1/2∉ℤ₂, so the target must use the special residue class. At index one it reduces to EK_Γ₀∈C.
- On the ordinary dyadic datum in §6.3, α=2 and β=0 are μ₂-compatible and this theorem concerns only that critical coordinate; the odd residue −1 excludes divisibility of the entire theta function by 2.

*Needs:* §2.5; §4.3; §5.1; §5.2; §2.3.

### 5.5 Torsion distribution and the smoothing identity

For a=f b⁻¹ and c prime to fb, summing E^(β,α)(t+1,0;a,O_f×) over unit orbits t∈c⁻¹a/a gives E^(β,α)(1,0;c⁻¹a,O_f×). Thus the trace-zero function h_c=Nc·1_e−1 gives Nc E(1,0;a)−E(1,0;c⁻¹a). This identity uses a disjoint decomposition of the actual unit-orbit sets, not a sum over every point followed by division by the unit-group size.

Assume critical indices; pairwise coprime integral f,b,c; evaluation class 1 modulo a.

(KS-v4, Equation (4.4.1) and Proposition 4.12, p.52, KS-v4 line 2442.)

One proof route is to decompose c⁻¹a+1 into the Γ-translates of a+t+1 and pass to orbit sets. Prove equality in the convergence region and continue to zero.

**Checks.**

- The first coefficient is Nc, the degree of the ideal isogeny.
- The lattice on the second term is c⁻¹a, not ca.

*Needs:* §4.1; §1.1.

### 5.6 Integral differences of partial critical values

For f≠O_L and the based period datum, 𝒩_(α,β)(χ(c)Nc L_f(χ,0,[b])−L_f(χ,0,[bc]))∈O_E R[1/(f N(bc))], where O_E R is the subring of ℂ generated by R and the integers of the character value field E. χ(b) may have denominators at Nb, so its integrality is proved in O_E[1/Nb] rather than asserted unconditionally.

Assume χ critical of conductor f with values in E; b,c prime to f and each other.

(KS-v4, Corollary 4.13, p.52, KS-v4 line 2463.)

One proof route is to insert h_c into §5.4 and apply the distribution relation. Use §5.3 and prove the denominator statement for χ(b) by raising b to a principal ray-class power.

**Checks.**

- The smoothing difference pairs [b] with [bc] and has χ(c)Nc on the first term.
- The full-unit normalization uses the integral unit-index descent of §5.4.

*Needs:* §5.4; §5.5; §5.3.

### 5.7 Regularized integrality and algebraicity

For χ critical of conductor f and values in E, with the O_L-structure, differential bases and R-rational x_Ω, prove for f≠O_L and c prime to f: 𝒩_(α,β)((χ(c)Nc−1)L_f(χ,0))∈O_E R[1/(f Nc)]. For f=O_L and pairwise coprime c,c′, prove 𝒩_(α,β)((1−χ(c′))(χ(c)Nc−1)L_(O_L)(χ,0))∈O_E R[1/N(cc′)]. These regularized integrality statements hold over the general standard ring R. For the algebraicity conclusion require additionally that A, its CM action, the chosen differential bases and torsion data descend to a fixed number field k containing E, and that R is a permitted localization in k. Such algebraically based data can be chosen after a finite extension and localization. Vary the auxiliary ideals and show the smoothing factors can be chosen nonzero; for these data 𝒩_(α,β)(L_f(χ,0))∈k. Zero L-values are allowed; this clause does not cover arbitrary transcendental changes of differential basis.

Assume standard global period data; f integral; c,c′ nonzero integral ideals with the specified coprimality. Good reduction and bases are obtained by an explicitly finite localization/extension, not assumed over every O_k.

(KS-v4, Theorem 4.10 and its proof in §4.4, pp.51–53, KS-v4 line 2413.)

One proof route is to sum §5.6 over ray classes and choose representatives away from each prime at which integrality is tested. For f=O_L introduce c′ and the support excluding the identity. Its four-term distribution gives the raw factor (χ(c′)⁻¹−1)(Nc−χ(c)⁻¹); multiplying by χ(c)χ(c′) gives (1−χ(c′))(χ(c)Nc−1). These character values are units after the stated localization at N(cc′), so this multiplication preserves integrality. On measures the χ(c′) multiplication is the Artin translation of §8.3. Control changes of model and exhibit nonvanishing smoothing factors to deduce algebraicity.

**Checks.**

- State both conductor cases; omitting (1−χ(c′)) in conductor one is incorrect.
- For E:y²=x³−x over ℚ(i), ω₀=dx/(2y) and χ((λ))=λ⁻⁴, write its period lattice Ω₀ℤ[i]. Then g₂=4 gives Σ_(λ∈Ω₀ℤ[i],λ≠0)λ⁻⁴=1/15, and four generators per ideal give 3!L(χ,0)/Ω₀⁴=(6/4)(1/15)=1/10. Rescaling ω₀ by 2 gives 1/160∈ℚ. Over R=ℤ[i,1/210,t,t⁻¹] with transcendental t, the allowed basis tω₀ gives 1/(10t⁴), which is transcendental. General-R regularized integrality remains meaningful there, but the algebraicity clause does not apply.
- For χ((λ))=λ⁻⁴ on ℚ(i), c=(7) and c′=(3), the raw distribution factor is 80·(49−2401)=−188160. Multiplying by χ(c)χ(c′)=1/(2401·81) gives (80/81)(49/2401−1)=−1280/1323. These scalars lie in the localization at N(cc′)=441; neither requires division by a smoothing factor that could vanish.

*Needs:* §5.6; §5.1; GlobalNumberFields Layers 2, 7 and 9; ClassFieldTheory Layers 11–13 (gap:ray-tower-tame-unit-kernel).

### 5.8 Katz–Shimura algebraicity for totally imaginary extensions

Let μ=β−α=N*_(L/K)(β₀−α₀), with K the maximal CM subfield and Ω₀ the compatible CM periods from a Serre construction. Then [ (2πi)^|β₀| / Ω₀^(α₀+barβ₀) ]^[L:K] ·L_f(χ,0)∈Qbar. Here barβ₀ is the conjugate-index transfer to Σ_K, not an unlabelled complex conjugate of the scalar L-value. The power [L:K] reflects repetition of every K-period among the lifted embeddings.

Assume critical χ and compatible K/L period structures from CM abelian varieties with CM action, differential bases and torsion data defined over a number field as in §5.7; α₀≥1, β₀≥0.

(KS-v4, §4.5 and equation (4.5.1), p.53; Corollary 4.14, p.54, KS-v4 line 2534.)

One proof route is to construct the L-datum by the imported Serre tensor construction. Use an O_K-linear polarization of A₀ whose Rosati involution is complex conjugation, from ComplexMultiplicationAndExplicitReciprocity §2.1, only to identify dual and conjugate periods modulo nonzero algebraic factors. Apply §5.7 for algebraicity and count the repeated periods.

**Checks.**

- At L=K the exponent [L:K] is one and the formula matches the CM-field normalization.
- At L=ℚ(i,√(1+i)) the K-period exponent doubles without assuming L is CM.
- The complex algebraicity statement has no p-ordinarity hypothesis; obtain its periods from ComplexMultiplicationAndExplicitReciprocity §1.3 and §5.1, rather than ordinary p-adic period data.

*Needs:* §5.7; §5.1; ComplexMultiplicationAndExplicitReciprocity §§1.3 and 2.1.

### 5.9 Deligne period comparison modulo algebraic units

For the Hecke motive M(χ) over L with coefficient field E, assume Res_(L/ℚ)M(χ) is critical in the realization-theoretic sense, and let τ:E→ℂ be the restriction of the fixed embedding of algebraic numbers into ℂ, the embedding through which χ, its infinity type β−α, the CM type Σ and the periods Ω₀ are realized. Its nonzero period satisfies c⁺_τ(Res M(χ))∼[(2πi)^(−|β₀|)Ω₀^(α₀+barβ₀)]^[L:K], where ∼ means equality modulo Qbar×. Consequently L_f(χ,0)/c⁺_τ∈Qbar. The ratio is in Qbar× only if L_f(χ,0)≠0. No assertion of the sharper E-rationality is made here; this is the weaker period statement in Corollary 4.15 allowing a zero special value. τ is not an independent parameter: another embedding E→ℂ replaces χ by a Galois-conjugate character, whose infinity type, CM type and periods are the transported ones.

Assume the Hecke motive, restriction of scalars, realizations and determinant periods of the PeriodsAndSpecialValues requirements PS.0 (gap:hecke-motive-periods) and PS.1 (gap:critical-cm-deligne-period). The CM periods use the number-field differential bases of §§5.7–5.8. The criticality of the restricted motive is an explicit assumption.

(KS-v4, Corollary 4.15 and Remarks 4.16–4.17, pp.54–55, KS-v4 line 2551.)

One proof route is to import the motivic norm-pullback and finite-order/Tate comparison needed to compute its determinant period. Compare the resulting period with the Serre CM periods modulo Qbar×. Apply §5.8; keep the nonvanishing of the period separate from the possible vanishing of the L-value.

**Checks.**

- If L_f(χ,0)=0 the conclusion is the algebraic scalar zero.
- This does not identify an E×-ambiguity from a Qbar×-ambiguity.
- For L=K=ℚ(i) and χ((λ))=λ⁻⁴, with E=ℚ(i), the fixed embedding gives infinity type −4σ, critical for Σ={σ} with α=4 and β=0. The conjugate embedding of E gives the character (λ)↦barλ⁻⁴ of type −4barσ, which has α=0 on Σ and is not critical for Σ; a statement letting τ vary with Σ and Ω₀ fixed would be ill-posed there.

*Needs:* §5.8; PeriodsAndSpecialValues PS.0 (gap:hecke-motive-periods); PeriodsAndSpecialValues PS.1 (gap:critical-cm-deligne-period).

### Examples

At α=(3,2), β=0 the derivative factorial is 2!·1!=2, whereas the factorial of the total derivative degree is 3!=6. For the period conversion formula at nonzero test coordinates Ω=2, q=1 and d=1, the resulting dual coordinate is πi; rescaling Ω by i changes q to −i and leaves Ω∨=πi. The non-CM quartic over ℚ(i) repeats every base CM period twice.

### Dependencies

Earlier layers 0, 1, 2, 3, 4; ComplexMultiplicationAndExplicitReciprocity §§1.3 and 2.1; AbelianSchemesAndArithmeticModuli A2.2, A4.3, A5.1 and A5.3; ComplexComparisonPartII C5.1; Mathlib `FractionalIdeal.dual_eq_mul_inv` and `coeIdeal_differentIdeal`; AbelianSchemesAndArithmeticModuliPartII P2.4; GlobalNumberFields Layers 9–10 (gap:hecke-padic-avatar); AutomorphicLFunctionsAndLocalFactors AL.1, “Rank-one specialisation and Hecke comparison”; GlobalNumberFields Layers 2, 7 and 9; ClassFieldTheory Layers 11–13 (gap:ray-tower-tame-unit-kernel); PeriodsAndSpecialValues PS.0 (gap:hecke-motive-periods); PeriodsAndSpecialValues PS.1 (gap:critical-cm-deligne-period). The individual statement and proof-route inputs are specified above.

## Layer 6: Ordinary levels and p-adic theta coordinates

### 6.1 Ordinary lifted types and CM level structures

Fix a prime p∤d_L, p noninvertible on the arithmetic model, embeddings of algebraic numbers into ℂ and ℂ_p, and a lifted type Σ. It is p-ordinary when the sets of p-adic places induced by Σ and barΣ are disjoint and together cover all places over p; this definition applies to L containing K, without requiring L itself CM. Write O_L⊗ℤ_p=O_L(Σ_p)⊕O_L(barΣ_p). A Γ₀₀(p∞)-structure consists of O_L-equivariant compatible identifications μ_(p∞)⊗O_L(Σ_p)≃A[p∞]^connected and μ_(p∞)⊗O_L(barΣ_p)≃A∨[p∞]^connected. A Γ_arith-structure includes the compatible full connected and étale trivializations. Set p_Σ=∏_(v∈Σ_p)v and A_(n)=A(barp_Σ^n); q_n=[barp_Σ^n]:A_(n)→A is étale, with kernel A_(n)[barp_Σ^n], while its dual is connected. Via Weil pairings these data are equivalent to the specified trivializations of the complementary étale kernels. A prime-to-p ideal Betti structure induces them using the chosen compatible roots exp(2πi/p^n). In particular formal A≃Gm_hat⊗O_L(Σ_p), formal A∨≃Gm_hat⊗O_L(barΣ_p), with character modules the corresponding dual Tate modules. The paired isogeny [p_Σ^n]:A→A_(n) composes with q_n to [p^n]. The primes 2 and 3 are included whenever the stated unramified and ordinary hypotheses hold.

Assume ordinary standard datum over a permitted number-field model R as in §5.7, integral at p, followed by its chosen map to O_(ℂ_p); f prime to p. Ordinary finite-flat and Weil pairing theory is imported, not developed here.

(KS-v4, Notation 5.1, Definitions 5.2–5.3 and Propositions 5.4–5.6, pp.56–58, KS-v4 line 2633.)

The construction has the following API.

- The p-ordinary lifted type is equivalent to separation of the two place sets, and agrees with the K-condition at unramified p.
- Multiplicative connected levels and complementary étale-kernel levels determine each other through the rigidified Weil pairings.
- The levels identify the Cartier-dual Tate modules of formal A and formal A∨ with O_L(Σ_p) and O_L(barΣ_p).

One proof route is to specialize the generic connected/étale and Cartier-dual theory to the CM idempotent decomposition. Prove equivalence of multiplicative and complementary étale level structures using the two Weil pairings. Transport a prime-to-p Betti ideal structure into the compatible étale levels and identify the formal character modules.

**Checks.**

- For K=ℚ(i) and p=5 the two CM embeddings induce distinct p-places, so the ordinary construction applies.
- For K=ℚ(i) and p=3 both embeddings induce the same inert place, so the ordinary constructor rejects it.
- For L=ℚ(i,√(1+i)) and p=5, the lifted type separates the primes by their restrictions to K and gives a valid ordinary dimension-two datum.
- The bar on barp_Σ in A_(n) is essential: q_n has étale kernel.
- For L=K the predicate specializes to the CM-field place-separation condition.
- On an ordinary Gaussian elliptic reduction at 5 with i acting on Lie by 3, 2+i has differential 0 and connected kernel, while 2−i has differential 4 and étale kernel. The latter is the complementary ideal direction of q_n.

*Needs:* §0.2; §5.1; ComplexMultiplicationAndExplicitReciprocity §1.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.7/R07.1.9/R07.1.13 (gap:ordinary-cm-pairings); AbelianSchemesAndArithmeticModuliPartII P4.1.

### 6.2 Canonical differentials and p-adic periods

The ordinary level structures induce canonical bases ω_can(A), ω_can(A∨) on the cotangent weight lines of the two formal tori. Define unit-valued periods Ω_p and Ω_p∨ by ω_A=Ω_p·ω_can(A) and ω_A∨=Ω_p∨·ω_can(A∨). These are componentwise units because both sides are bases. Prime-to-p O_L-isogenies transport the canonical bases and periods by Lemma 5.8. All algebraic objects are first built over the noetherian model and then base changed to O_(ℂ_p); no noetherianity assertion about O_(ℂ_p) is made.

Assume ordinary based datum, chosen Γ₀₀-levels and compatible embeddings; algebraic bases integral at p.

(KS-v4, Definition 5.7 and Lemma 5.8, p.59, KS-v4 line 2743.)

The construction has the following API.

- Scaling the algebraic basis by a unit u scales Ω_p by u and leaves the canonical basis fixed.
- Transport through a prime-to-p isogeny agrees with the induced level structure and cotangent pullback.
- The periods lie in the unit groups of the corresponding coefficient lines because they compare bases.

One proof route is to pull back invariant dlog differentials from the formal multiplicative groups. Compare the two bases to obtain invertible coordinate ratios; verify isogeny transport on character modules.

**Checks.**

- When the algebraic basis is the canonical one, each p-adic period equals 1.
- Multiplying ω_A by a unit u multiplies Ω_p by u, rather than by u⁻¹.
- Multiplication by p does not produce an integral basis and cannot be used to infer a unit period pΩ_p.
- p-adic periods are not identified with the complex periods; each compares the same algebraic bases with a different canonical basis.
- If an algebraic differential is multiplied by a nonunit, it ceases to be a basis and the unit-period assertion no longer applies.

*Needs:* §6.1; §5.1; AbelianSchemesAndArithmeticModuliPartII P4.2.

### 6.3 The p-adic theta function of a residue class

For a torsion section y∈U killed by an isogeny with étale dual, restrict EK_Γ(h) to the formal neighborhood of y, translate to the identity, and use the imported ordinary Poincaré trivialization on formal A×formal A∨. Put M=H⁰(formal A×formal A∨,O)⊗det ω_A, with Γ acting through the Γ-linearization of the Poincaré trivialization and the inverse Σ-weight on det ω_A; under the level identifications of §6.1, Γ acts on O_L⊗ℤ_p by multiplication by units, freely on (O_L⊗ℤ_p)×. The restricted class lies in H^(d−1)(Γ,M). Cap it with the same torsion-free oriented fundamental cycle: the local-coefficient cap lands in H₀(Γ,M)=M_Γ, the Γ-coinvariants. Identify det ω_A using ω_can(A). This defines θ_Γ(h,y)∈M_Γ, integral over O_(ℂ_p). It is not an element of M^Γ, and no retraction M_Γ→M^Γ is used: for d≥2 the group Γ is infinite, the closure of Γ in (O_L⊗ℤ_p)× contains a copy of ℤ_p acting freely on the units, and a bounded measure invariant under it vanishes there, so a bounded Γ-invariant formal function has Amice measure zero on (O_L⊗ℤ_p)×. For critical (a,β) the moment coordinate M→TSym^(a+1)ω_A⊗TSym^βω_A∨ is Γ-invariant, so it factors through M_Γ; every later use of θ is such a Γ-invariant functional or a pushforward along a Γ-invariant map. For arbitrary torsion y the same procedure gives a generic-fiber class; integrality then requires an extra argument. For a finite-index torsion-free Γ′⊂Γ, the projection M_(Γ′)→M_Γ sends θ_(Γ′) to [Γ:Γ′]θ_Γ by the finite-cover projection formula.

Assume torsion-free Γ fixes y and h; ordinary level structures; h trace zero. The integral version requires the killing dual étale. Carry these torsion-free theta classes through Layer 7; normalization by a nonunit full-unit index takes place only on the weighted ray quotient in §8.3.

(KS-v4, Lemma 5.15, p.63; Definition 5.16 and Lemma 5.17, p.64, KS-v4 line 2941; the target of the cap in Lemma 5.15, KS-v4 lines 2926–2940, is replaced by the Γ-coinvariants.)

The construction has the following API.

- θ_Γ(h,y) is linear in the trace-zero residue function h.
- For torsion-free Γ′⊂Γ of finite index, the projection M_(Γ′)→M_Γ sends θ_(Γ′) to [Γ:Γ′]θ_Γ with the same bases; on critical moment coordinates this is multiplication by the index.
- The integral theta class maps to its generic-fiber counterpart whenever the killing dual is étale.
- When β=a=0 is critical for Γ, evaluation at the identity is a Γ-invariant functional on M, and on θ_Γ(h,y) it gives Ω_p^1 e_(0,0), with the same algebraic-to-canonical determinant conversion as in the Eisenstein moment formula of §7.1. This follows by applying the augmentation before capping.

One proof route is to apply AbelianSchemesAndArithmeticModuliPartII P4.2–P4.3 and their compatibility with the rigidification. Cap into H₀(Γ,M) with the canonical determinant differential, and obtain the critical moments from naturality of the cap in the coefficient map M→TSym^(a+1)ω_A⊗TSym^βω_A∨. Naturality of restriction, trivialization and cap under coefficient extension maps the integral theta class to the generic-fiber class. The induced map on coinvariants is not asserted injective; equality after extending to ℂ_p alone does not imply equality of integral classes.

**Checks.**

- θ_Γ(0,y)=0 as a coinvariant class.
- For Γ=ℤ acting on M=ℤ₅ by multiplication by 6, H¹(Γ,M)=M_Γ=ℤ₅/5 while M^Γ=0; the cap lands in the coinvariants and cannot be read as an invariant element.
- On the ambient ℤ_p let Γ=⟨1+p⟩ act by multiplication. For odd p, on any unit coset a(1+p^kℤ_p), k≥1, the subgroup generated by (1+p)^(p^(k−1)) permutes its p^(n−k) subcosets modulo p^n transitively for every n≥k. For p=2, use 9=3²: on a(1+2^kℤ₂), k≥3, the subgroup generated by 9^(2^(k−3)) permutes its 2^(n−k) subcosets modulo 2^n transitively for every n≥k. Thus a bounded invariant O_(ℂ_p)-valued measure assigns each fixed coset a mass in every p^rO_(ℂ_p), hence mass 0, and vanishes on the units. Modulo 8 multiplication by 3 has the two orbits {1,3} and {5,7}; modulo 16 multiplication by 9 interchanges 1 and 9. The ambient atom δ₀ remains invariant with mass 1.
- For L=ℚ(√5,√−7), p=2 and Γ=⟨(1+√5)/2⟩, the selected determinant weight is −1. The determinant-twisted constant line O_(ℂ₂) splits equivariantly from M by constants and evaluation at the identity. Its coinvariants O_(ℂ₂)/2 contain [1]≠0, whereas the corresponding ℂ₂-coinvariants are 0. Thus the coefficient inclusion is injective and its coinvariant map is not. Here disc(L)=5·(−7)·(−35)=1225 and 2 splits in ℚ(√−7), so a Serre tensor of an ordinary elliptic datum realizes the stated unramified ordinary context.
- A prime-to-p torsion y has an étale killing dual and gives an integral theta class.
- For y in ker q_n on A_(n), q_n∨ is connected, so this argument gives its theta value only over the generic fiber.
- For torsion-free Γ′⊂Γ of index 2, fixed h,y and unchanged canonical bases, the image of θ_(Γ′)(h,y) in M_Γ is 2θ_Γ(h,y), including when p=2; no division by the index is part of this restriction.
- For d=1, Γ=1 and β=a=0, θ(h,y)(0,0)=Ω_p e_(0,0)(h,y). Thus a value with e_(0,0)≠0 cannot be replaced by the zero formal function.
- Do not declare every summand in the translation formula integral.
- The cap convention is identical to §2.2, including the determinant factor responsible for α=a+1.
- For L=ℚ(√−7), p=2, Γ₀=1 and full units μ₂, use E:y²+xy=x³−x²−2x−1, with Δ=−343, j=−3375 and #E(𝔽₂)=2, hence a₂=1. The polynomial X²−X+2 reduces to X(X−1), so 2 is unramified and ordinary. After a finite extension splitting the prime-to-2 torsion, take c=(3), c′=(5), D=E[15] minus e and y=e. The §1.1 function is 8 at 24 points, −1 at 192 points and 0 at 8 points, with trace 24·8−192=0. It is μ₂-invariant, and α=2, β=0 is critical for μ₂. Yet θ_1(h,e) is not in 2O_(ℂ₂)[[T,S]]: its rigidified augmentation at S=0 is the formal expansion of a meromorphic differential with residue −1 at a point of D. Divisibility by 2 would make that expansion vanish after reduction in characteristic 2. Injectivity into the completion on the smooth integral elliptic special fibre would then make the reduced rational differential zero, contradicting its residue 1. No inversion of 2 is permitted in this example (KS-v4, Definition 2.18 and Theorem 2.20, pp.19–20, KS-v4 lines 836, 870; Definition 5.16, p.64, KS-v4 line 2941).

*Needs:* §1.3; §2.2; §6.2; AbelianSchemesAndArithmeticModuliPartII P4.3; AbelianSchemesAndArithmeticModuliPartII P4.2; AlgebraicTopology Stage 6 (gap:torus-cap-projection).

### 6.4 Canonical formal derivatives and embedding monomials

For a≥0 on Σ and β≥0 on barΣ let ∂_A^a∂_(A∨)^β g be the coefficient of the invariant differentiated formal function in the canonical divided-power differential bases, evaluated at the identity. Under the level identification O_L⊗ℤ_p=O_L(Σ_p)⊕O_L(barΣ_p), define t^a s^β(t,s)=∏_(σ∈Σ)σ(t)^a_σ∏_(barσ∈barΣ)barσ(s)^β_barσ through the chosen embeddings into O_(ℂ_p). The generic Amice moment formula identifies these canonical derivatives with monomial integrals. This target specializes that formula to the CM bases and the Hodge moment maps; it does not re-own multivariate Amice theory.

Assume ordinary levels and canonical bases; nonnegative indices; formal functions over O_(ℂ_p).

(KS-v4, Definitions 5.18–5.19 and equation (5.4.1), pp.64–65; Proposition 5.20, p.65, KS-v4 line 2963.)

The construction has the following API.

- For g=(1+T)^m the k-th invariant derivative at zero is m^k.
- Products of the monomials add their multi-indices, t^a s^β·t^c s^δ=t^(a+c)s^(β+δ).
- The moment map in canonical TSym bases agrees with ∂_A^a∂_(A∨)^β, with the stated factorial convention.

One proof route is to identify invariant differentiation on each formal multiplicative coordinate with (1+T)∂/∂T. Apply the imported moment and divided-power conventions, then the character-module embedding map.

**Checks.**

- For g=(1+T)^2 the second invariant derivative at zero is 4; the second ordinary derivative would give 2.
- The (0,0) monomial is 1 everywhere, including at zero.
- In two coordinates, the (1,1) derivative of (1+T₁)^2(1+T₂)^3 at zero equals 6.
- The invariant derivative is not the ordinary ∂/∂T for higher moments.
- The determinant contributes the extra Ω_p factor only when relating theta to EK, not inside the definition of t^a.

*Needs:* §6.1; §6.2; AbelianSchemesAndArithmeticModuliPartII P2.1; PadicMeasuresIwasawaAlgebras §§2.1–2.2 (gap:integral-multivariate-amice).

### Examples

For ℚ(i), p=5 splits into (2+i)(2−i), while p=3 is inert and is rejected by the ordinary constructor. On the formal multiplicative coordinate, the second invariant derivative of (1+T)² is 4, and the mixed (1,1) derivative of (1+T₁)²(1+T₂)³ is 6.

### Dependencies

Earlier layers 0, 1, 2, 3, 4, 5; ComplexMultiplicationAndExplicitReciprocity §1.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.7/R07.1.9/R07.1.13 (gap:ordinary-cm-pairings); AbelianSchemesAndArithmeticModuliPartII P4.1; AbelianSchemesAndArithmeticModuliPartII P4.2; AbelianSchemesAndArithmeticModuliPartII P4.3; AlgebraicTopology Stage 6 (gap:torus-cap-projection); AbelianSchemesAndArithmeticModuliPartII P2.1; PadicMeasuresIwasawaAlgebras §§2.1–2.2 (gap:integral-multivariate-amice). The individual statement and proof-route inputs are specified above.

## Layer 7: Eisenstein measures and partial Fourier moments

### 7.1 The CM Eisenstein measure and its moments

Let μ_Eis,Γ(h,x) be the class in the Γ-coinvariants Meas(O_L⊗ℤ_p,O_(ℂ_p))_Γ of bounded O_(ℂ_p)-valued measures on the additive finite free ℤ_p-module O_L⊗ℤ_p, for the Γ-action of §6.3 including the determinant weight, corresponding to θ_Γ(h,x) under the Γ-equivariant, basis-independent multivariate Amice isomorphism. Use Mathlib AbstractMeasure for the continuous linear functionals representing it. For critical β−a−1 the monomial integral against t^a s^β is a Γ-invariant functional, and its moments satisfy (Ω_p^(a+1)(Ω_p∨)^β)⁻¹∫t^a s^β dμ_Eis=e_(β,a), the coordinate of EK in the algebraic divided-power bases, including the factor ε(d,a,β) of §4.3. Noncritical monomial integrals are not Γ-invariant and are not attached to the class. Dependence on h is linear; for a finite-index torsion-free Γ′⊂Γ the projection to Γ-coinvariants sends μ_Eis,Γ′ to [Γ:Γ′]μ_Eis,Γ.

Assume integral theta data for torsion-free Γ; coefficient ring O_(ℂ_p); finite free rank 2d module. The multivariate, coefficient-complete, equivariant Amice contract in the integral multivariate Amice contract is needed; a one-variable field statement alone is insufficient.

(KS-v4, Definition 5.21 and Theorem 5.22, pp.65–66; Proposition 5.20 imported from the general Amice owner, KS-v4 line 3004.)

The construction has the following API.

- All critical monomial integrals satisfy the displayed Ω_p^(a+1)(Ω_p∨)^β formula.
- The construction is linear in h and takes zero residue data to the zero class.
- The Amice transform of μ_Eis is exactly θ_Γ as Γ-coinvariant classes, independently of a ℤ_p-basis.

One proof route is to apply the inverse Amice equivalence to θ, which has integral bounded coefficients. Compare invariant derivatives, Poincaré moments and the canonical cap with EK. Rescale ω_A and ω_A∨ by their p-adic periods; the exponent on Ω_p is a+1.

**Checks.**

- For the generic Amice test g=(1+T)^m, the measure is δ_m and its k-th moment is m^k; the CM specialization uses that same convention.
- Before taking coinvariants, a constant formal function c corresponds to cδ₀, with mass c and positive-degree moments 0; this computes the generic Amice convention. A mass on the quotient requires the criticality condition below.
- For critical indices with a=0 the algebraic-to-canonical moment conversion still contributes one Ω_p in each Σ coordinate.
- When a=β=0 is critical for Γ, total mass descends to the class and equals Ω_p^1e_(0,0). For L=ℚ(i,√2), p=5 and Γ=⟨1+√2⟩, the selected determinant weight is −1 and this index is not critical: γδ₀=−δ₀ has mass −1 while δ₀ has mass 1. Since 2 is a unit, [δ₀]=0 in the coinvariants; total mass cannot descend. For Γ=1 it is ordinary augmentation.
- Transport under an integral basis change of O_L⊗ℤ_p gives the same measure.
- At d=1, β=0 and a=3 the normalized fourth-critical-value coordinate has ε(1,3,0)=−1; the Amice moment equals that signed coordinate. With the same a and β=1 the sign is ε(1,3,1)=+1, and at a=2, β=0 it is ε(1,2,0)=+1. Moment formation introduces no further minus sign.
- On the dyadic datum of §6.3, μ_Eis,1 is not in 2Meas(O_L⊗ℤ₂,O_(ℂ₂)): integral Amice is linear, so such divisibility would put θ_1 in 2O_(ℂ₂)[[T,S]], contradicting the residue 1 after reduction. The selected critical-coordinate descent does not imply divisibility of this entire measure.

*Needs:* §6.3; §6.4; PadicMeasuresIwasawaAlgebras §§2.1–2.2 (gap:integral-multivariate-amice); Mathlib `AbstractMeasure`.

### 7.2 p-power translation with Weil-pairing weights

Let q_n:A_(n)=A(barp_Σ^n)→A be as in §6.1; pull back D and h to D′ and h′. For Γ-invariant s∈A[p_Σ^n], t∈A∨[barp_Σ^n], let s′ be the unique p_Σ^n-torsion lift of s and x′ the unique f-torsion lift of x. At this finite level choose a finite-index torsion-free Γ_n⊂Γ fixing x′, s′, every point of ker q_n, and all finite-level translation data. Such a subgroup exists as the kernel of the action on those finite sets. Then
(T_s×T_t)*θ_(Γ_n,A)(h,x)=Σ_(u∈ker q_n)⟨u,t⟩_(q_n)·q_(n),# θ_(Γ_n,A_(n))(h′,x′+s′+u).
This is an equality in Γ_n-coinvariants through the formal isogeny identifications in the generic fiber. Its left side is integral; individual right-hand classes need not be integral because q_n∨ is not étale. Each evaluation point is fixed by Γ_n, as its constructor requires.

For the original Γ, put m_n=[Γ:Γ_n]. Projecting the displayed identity to Γ-coinvariants gives m_n·(T_s×T_t)*θ_(Γ,A)(h,x) equal to the sum of the projected right-hand terms. This follows from the finite-cover projection formula, and retains the index even when p divides it. An individual θ_Γ(h′,x′+s′+u) is used only if Γ fixes that evaluation point. No subgroup is required to fix every p-power level simultaneously.

Assume ordinary theta data, p∤f, torsion-free Γ fixing x,h,s,t, and the finite-level subgroup just specified.

(KS-v4, Theorem 5.23 and equations (5.5.1)–(5.5.8), pp.66–70, KS-v4 lines 3058–3066, with the evaluation-point stabilizers and subgroup indices retained; integrality remark p.67, KS-v4 lines 3072–3083.)

One proof route is to compare the supported residue functions under the Poincaré isogeny and translation diagrams for Γ_n. Identify the multiplier by the rigidified Weil pairing, with the same order of its arguments. Use uniqueness of the localized EK class and the compatibility of formal cap and trivialization, then project using §6.3's finite-cover formula.

**Checks.**

- For L=ℚ(i,√2), p=5, f=(3), Γ=⟨(1+√2)⁸⟩, s=t=0 and n=1, the generator is 577+408√2, congruent to 1 mod 3 but to 2+3√2≠1 in the complementary residue field 𝔽₂₅. A nonzero f-torsion x and h_(7) are fixed, and so is x′; nevertheless x′+u is not fixed for u≠0 in ker q₁. In 𝔽₂₅, (2+3√2)²=2+2√2 and (2+3√2)³=1. Thus Γ₁=Γ³ fixes all summands, and projection back gives 3 times the original translated theta class, not an unindexed identity.
- At n=0 the kernel has one point, the pairing is 1 and q₀ is the identity. Take Γ₀=Γ, so m₀=1 and the formula is θ_Γ=θ_Γ.
- The Weil-pairing multiplier is positive: a value ζ₃ remains ζ₃ in the translation sum, while the corresponding Fourier coefficient in §7.3 uses ζ₃⁻¹; these differ.
- Integrality of the sum is deduced from the left side for Γ_n, never termwise. Projection to Γ multiplies that left side by m_n and does not justify integral division by m_n.

*Needs:* §6.3; §6.1; §2.3; AlgebraicTopology Stage 6 (gap:torus-cap-projection); AbelianSchemesAndArithmeticModuliPartII P4.3; AbelianSchemesAndArithmeticModuliPartII P2.4.

### 7.3 Normalized partial Fourier transform

At level p^n let x∈A_(n)∨[p_Σ^n], y∈A_(n)[p_Σ^n], and z∈A_(n)[barp_Σ^n]. With q_n=[barp_Σ^n]:A_(n)→A, the perfect pairing for [p_Σ^n]:A→A_(n) pairs q_n(y) with x. For a function ρ on the two étale coordinate modules define P_Aρ(y,z)=p^(−dn)Σ_x⟨q_n(y),x⟩_[p_Σ^n]⁻¹ρ(x,z). Fourier transformation acts only in the Σ-direction; the other variable is retained. The generic-fiber denominator p^(dn) is mandatory. Under the complex ideal uniformization this becomes the normalized finite trace-exponential sum exp(−2πi Tr_(L/ℚ)(xy)) in equation (5.5.11), with the ideal-coordinate denominators specified there.

Assume chosen compatible Γ₀₀-levels and primitive p^n-th roots; functions at a finite level; generic coefficient field containing the roots.

(KS-v4, Definition 5.24, p.70; equations (5.5.9)–(5.5.11), pp.71–72, KS-v4 line 3228.)

The construction has the following API.

- A character x↦⟨y₀,x⟩ transforms to the indicator of y=y₀, with the other coordinate retained.
- Summing against the positive pairing in the transformed variable recovers ρ.
- For an inflation ρ_m=ρ_n∘π along the level surjection π:X_m→X_n, the normalized transform is zero at characters nontrivial on ker π. At a character descended from X_n it equals the level-n transform there. In a cyclic coordinate X_n=ℤ/p^n, at m≥n this means zero unless p^(m−n) divides the frequency, and then F_mρ_m(k)=F_nρ_n(k/p^(m−n)); the retained coordinate is simply inflated.

One proof route specializes AutomorphicLFunctionsAndLocalFactors AL.0 finite Fourier orthogonality and inversion to the Weil pairing on the finite group of order p^(dn), then identifies its trace-pairing coordinates. The new statement fixes the CM variables, denominator, retained variable and level maps.

**Checks.**

- The constant function 1 in the transformed variable maps to the delta function at zero.
- The indicator of x=0 maps to the constant p^(−dn), not to 1.
- The positive character ⟨y₀,x⟩ transforms to δ_(y₀), whereas the negative character transforms to δ_(−y₀).
- For the reduction ℤ/4→ℤ/2, inflate the zero-point indicator to the indicator of {0,2}. With ζ₄=i the normalized transform is 1/2 at frequencies 0 and 2, and zero at frequencies 1 and 3. It is supported on the kernel annihilator, rather than a constant inflation in the frequency variable.
- The denominator is the order of one direction, not p^(2dn).
- Fourier coefficients can have p-denominators even when ρ is integral.
- At n=0 both finite groups have order 1, the normalization is 1 and the transform is the identity; no out-of-range frequency is evaluated.

*Needs:* §6.1; §7.2; AutomorphicLFunctionsAndLocalFactors AL.0, “Local Schwartz–Bruhat spaces and finite Fourier levels”.

### 7.4 Locally constant twists of Eisenstein moments

For ρ:O_L/p^nO_L→Qbar and critical β−a−1, (Ω_p^(a+1)(Ω_p∨)^β)⁻¹∫t^a s^βρ(t,s)dμ_Eis(h,x)=Σ_(u∈A_(n)[p^n]) (P_Aρ)(u)·e_(β,a),A_(n)(h′,x′+u). The differential bases on A_(n) and its dual are uniquely transported by the two paired isogenies so that the p-adic periods on the left remain the common periods. Every right-hand term is initially interpreted generically.

Assume finite-level ρ; translation theorem and compatible bases. In the displayed pointwise formula use a torsion-free Γ fixing x,h,ρ and every p^n-torsion point and lift that appears, as in §7.2. Starting with a larger torsion-free group, choose such a finite-index subgroup Γ_n; its moment formula projects with the factor [Γ:Γ_n]. A twisted moment for the larger group is used only when its test function is Γ-invariant; no unindexed equality is inferred by integral cancellation.

(KS-v4, Corollary 5.25, pp.71–72, KS-v4 line 3244.)

One proof route is to expand ρ in the finite character basis. Apply theta translation and the Amice invariant-derivative identity to each character. Use partial Fourier orthogonality and transport the bases to obtain the displayed formula.

**Checks.**

- For ρ=1 the identity recovers the original moment formula after the correct distribution sum. In the quartic level-one example of §7.2 it is first the Γ³ formula; projection gives 3 times the Γ moment on the left and the projected sum on the right.
- A level increase does not multiply the integral by the size of the inflated group.
- Every summand has the same critical indices and hence the same factor ε(d,a,β). For d=1, a=3, β=0, a two-term combination with Fourier coefficients A,B and unsigned EK values v,w is −Av−Bw=−(Av+Bw). At A=2, B=3, v=5, w=7 both sides are −31; dropping the common sign gives +31, and for a=2, β=0 the common sign is ε(1,2,0)=+1, so the combination is +31.

*Needs:* §7.1; §7.2; §7.3; §6.2.

### Examples

For ℤ/4→ℤ/2, inflating the zero-point indicator gives values (1,0,1,0); the normalized Fourier transform is (1/2,0,1/2,0). Before taking coinvariants a constant formal function c corresponds to cδ₀, whose mass is c and whose positive monomial moments vanish; after taking coinvariants only critical moment functionals descend, as in §7.1.

### Dependencies

Earlier layers 0, 1, 2, 3, 4, 5, 6; AutomorphicLFunctionsAndLocalFactors AL.0, “Local Schwartz–Bruhat spaces and finite Fourier levels”; PadicMeasuresIwasawaAlgebras §§2.1–2.2 (gap:integral-multivariate-amice); Mathlib `AbstractMeasure`; AbelianSchemesAndArithmeticModuliPartII P4.3; AbelianSchemesAndArithmeticModuliPartII P2.4. The individual statement and proof-route inputs are specified above.

## Layer 8: Ray-class interpolation and bounded desmoothing

### 8.1 Katz’s local factor for a lifted ordinary type

Let χ have infinity type β−α and conductor dividing p∞f. Define χ_fin on (O_L⊗ℤ_p)× by χ((λ))=χ_fin(λ)·λ^(β−α) for λ prime to pf and congruent to 1 modulo f, with μ evaluated at the embedding σ in the exponent. Put Ftilde(x,y)=χ_fin(x⁻¹,y). For each v|p extend its v-component to O_(L,v) by the constant function 1 when v∈Σ_p and that unit-character component is trivial, and by zero off the units otherwise. Let F be the product. Choose ∏_(v∈Σ_p)v^(a_v)=(c)b with c≡1 mod f and b prime to p. Then Local(χ,Σ)=c^(α−β)·(PF)(c⁻¹)/χ(b), where c^(α−β) means (N_(L/K)c)^α₀/(overline(N_(L/K)c))^β₀ in the chosen embedding indices. Prove this scalar is nonzero, independent of the conductor decomposition, and compatible with the AutomorphicLFunctionsAndLocalFactors AL.1 trace-character Gauss-sum convention. Distinguish F from the zero extension of Ftilde; their difference at an unramified Σ-place produces an Euler factor.

Assume ordinary lifted type; embeddings and additive trace character fixed; PF is exactly §7.3. χ_fin uses the ideal-character convention of §5.3. With the ideal-theoretic local-unit inclusion of §8.3 the arithmetic avatar satisfies χ(q_f(u))=χ_fin(u)u^(β−α).

(KS-v4, §5.6, equation (5.6.1) and Definition 5.26, pp.72–73, KS-v4 line 3373.)

The construction has the following API.

- Two permitted factorizations (c)b of the Σ-conductor give the same scalar.
- At a ramified Σ-place the factor is the normalized trace-character Gauss sum with the inverse finite character and the specified power of the uniformizer.
- For trivial p-local finite character, the constant extension in the Σ-direction gives Local=1 with c=b=1.

One proof route is to choose c by approximation in the required ray congruence class. Factor the finite Fourier transform locally; use primitive-character Gauss-sum nonvanishing and the constant-function orthogonality at trivial Σ-components. Change c by a principal ray element and check the monomial, finite-character and ideal factors cancel.

**Checks.**

- A trivial Σ-component is extended by 1 on the entire local integer ring, including its nonunits.
- For a primitive nontrivial character of a finite local unit quotient, the normalized Fourier coefficient at its conductor frequency is nonzero and includes the factor 1/N(v)^a_v.
- Replacing c by cλ and b by b(λ)⁻¹ for λ≡1 mod f changes the individual factors but leaves Local unchanged.
- For all p-local components unramified take c=b=1; the local factor is 1.
- Replacing the constant extension by zero extension at a trivial Σ-place changes the expression and is rejected.
- At a residue field of order 3, the quadratic unit character has values (1,−1) on (1,2). With inverse additive kernel its conductor-frequency sum is (ζ₃⁻¹−ζ₃⁻²)/3=−i/√3, which is nonzero; replacing the inverse kernel changes its sign.

*Needs:* §7.3; §5.3; AutomorphicLFunctionsAndLocalFactors AL.1, “Local epsilon factors and Gauss sums”.

### 8.2 Auxiliary-ideal smoothing measures

On G_f=Gal(L(p∞f)/L), with arithmetic Artin convention fixed by ClassFieldTheory Layers 11–13, define δ_c=Nc·δ_1−δ_(Art(c)⁻¹). Its value at a continuous character χ is Nc−χ(c)⁻¹. In conductor one also define δ′_(c′)=δ_1−δ_(Art(c′)), with value 1−χ(c′). The products of these atoms with a measure mean convolution in the imported Iwasawa/measure algebra. In particular δ_c is different from the scalar factor χ(c)Nc−1 in the complex integrality theorem; they differ by the unit χ(c).

Assume c prime to pf; c′ prime to pc when used; norm embedded into the coefficient ring.

(KS-v4, Proof of Theorem 5.27, Step 2, p.77; Step 4, p.79, KS-v4 line 3636.)

The construction has the following API.

- Integration of χ against δ_c equals Nc−χ(c)⁻¹.
- Convolution with δ_c multiplies any character moment by Nc−χ(c)⁻¹.
- δ_c has mass Nc−1 and δ′_(c′) has mass zero.

One proof route is to use Mathlib Dirac measures, addition and scalar multiplication; import convolution rather than define a private group algebra. Evaluate a Dirac measure at χ, then apply χ(c⁻¹)=χ(c)⁻¹.

**Checks.**

- For a test character value χ(c)=2 and Nc=7, δ_c evaluates to 13/2, while χ(c)Nc−1 is 13.
- At χ=1, δ_c has value Nc−1; for Nc≡1 mod p it is not a p-adic unit.
- δ′_(c′) vanishes at the trivial character, so dividing by it requires cancellation rather than evaluating an inverse there.
- The Artin inverse belongs in the support of δ_c.
- For the trivial character its value is Nc−1, so this atom is not automatically invertible in every coefficient algebra.
- For c=O_L, Nc=1 and Art(c)=1, so δ_c=0. It cannot be used as a denominator; auxiliary-independent cancellation uses the entire compatible family.
- On fifth roots of unity arithmetic Frobenius at 2 sends ζ₅ to ζ₅², and its inverse sends ζ₅ to ζ₅³. The inverse support in δ_c is therefore a distinct reciprocity choice.

*Needs:* Mathlib `AbstractMeasure.dirac` and `AbstractMeasure.diracHom`; Mathlib `AbstractMeasure.dirac`; PadicMeasuresIwasawaAlgebras §1.2.

### 8.3 Smoothed ray-class measures from the CM Eisenstein measure

Set U_f=O_f× (global units congruent to 1 mod f) and G⁰_f=(O_L⊗ℤ_p)×/closure(U_f), and use the exact sequence 1→G⁰_f→G_f→Cl_f→1. Let q_f:(O_L⊗ℤ_p)×→G⁰_f be the quotient map. The inclusion G⁰_f→G_f is ideal-theoretic: at level fp^n the class of u maps to the class of (λ), where λ≡1 mod f and λ≡u mod p^n. In idelic terms it is Art(u_p)⁻¹. Hence the arithmetic avatar satisfies χ(q_f(u))=χ_fin(u)u^(β−α), with q_f followed by this inclusion. For f≠O_L choose ray-class representatives a_i, the Serre tensors A_i=(a_i⁻¹f)⊗A and their compatible periods, and x_i=Ω mod a_i⁻¹fΩ. Choose a finite-index torsion-free Γ₀⊂U_f fixing the residue data. Restrict μ_Eis,Γ₀(h_c,x_i) to (O_L⊗ℤ_p)×, multiply by ∏_(σ∈Σ)σ(t)⁻¹ and push forward by (t,s)↦Art(a_i)q_f(t⁻¹,s) into G_f. Denote the sum over cosets by ν_(f,c,Γ₀). Its source is the Γ₀-coinvariant class of §7.1 restricted to the local unit group and its target is Meas(G_f,O_(ℂ_p)). This construction uses the closure of U_f. Prove that it is well defined on Γ₀-coinvariants: restriction to the Γ₀-stable unit locus is equivariant, and for every critical algebraic character χ of G_f the function χ(Art(a_i)q_f(t⁻¹,s))∏_(σ∈Σ)σ(t)⁻¹ is a critical monomial times a locally constant function and is invariant for the determinant-twisted Γ₀-action, because Γ₀⊂U_f and q_f kills closure(U_f); the finite-order twists of one such χ span a dense subspace of C(G_f,ℂ_p).

Prove integral unit-index descent on this weighted pushforward: for every such Γ₀, with m=[U_f:Γ₀], ν_(f,c,Γ₀) belongs to m·Meas(G_f,O_(ℂ_p)), where integral measures have operator norm at most one. Equivalently, for every finite continuous quotient π:G_f→Q and q∈Q, prove ν_(f,c,Γ₀)(π⁻¹{q})∈mO_(ℂ_p). For Γ₁⊂Γ₀ prove ν_(f,c,Γ₁)=[Γ₀:Γ₁]ν_(f,c,Γ₀). Only after this theorem define μ_(f,c)=ν_(f,c,Γ₀)/m; it is integral and independent of Γ₀ by passage to intersections. This arithmetic theorem concerns the actual weighted ray-quotient measure; §5.4's integrality of individual critical coordinates is not its proof.

Its smoothed interpolation is
(Ω_p^α(Ω_p∨)^β)⁻¹∫χ dμ_(f,c)=ε(d,α−1,β)·(Nc−χ(c)⁻¹)·𝒩_(α,β)(Local(χ,Σ)·∏_(v∈Σ_p)(1−χ(v⁻¹)/Nv)·∏_(v∈barΣ_p)(1−χ(v))·L_f(χ,0)).
Here ε(d,α−1,β)=(-1)^(d(d−1)/2+|α|+|β|+1). Prove the formula for an arbitrary critical χ, finite-order twist included, by carrying the locally constant test function through every step. On the i-th coset the weighted integrand is t^a s^β F̃_i(t,s), with a=α−1 and F̃_i(t,s)=χ(Art(a_i))χ_fin(t⁻¹,s) locally constant, so §7.4 applies with ρ=F̃_i. Every translated coordinate e_(β,a),A_(n)(h′,x′_i+u) there has the same index (a,β) and hence the same class sign ε(d,a,β), and §7.4 evaluates P_Aρ itself, not P_A(ρ∘[−1]), at the translated points. Thus ε depends only on the infinity type and is common to χ and all its finite-order twists; the Fourier evaluation of §§7.3 and 8.1 then gives the remaining displayed factors. No reflection or translation moves this sign. The reflection (t,s)↦(−t,−s) multiplies t^a s^β by (−1)^(|a|+|β|) but also replaces ρ by ρ∘[−1], and on G_f it is translation by q_f(−1). An Artin translation by g multiplies each moment by the full value χ(g), finite twist included.

For f=O_L use two coprime auxiliaries and the function pulled back from h_c on (A[c′] minus e)×A[c], extended by zero as in §1.1. With x_i=e form the corresponding ν_(O_L,c,c′,Γ₀) and prove the same integral divisibility and subgroup law before defining μ^raw_(O_L,c,c′)=ν_(O_L,c,c′,Γ₀)/[O_L×:Γ₀]. Its normalized χ-moment has the extra factor χ(c′)⁻¹−1 multiplying the signed smoothed expression. Define μ_(O_L,c,c′)=δ_(Art(c′))*μ^raw_(O_L,c,c′). This translation is an integral bounded automorphism, and it changes that factor to χ(c′)(χ(c′)⁻¹−1)=1−χ(c′), exactly δ′_(c′)(χ) from §8.2, including for finite-order twists.

Assume ordinary based datum with the number-field CM action, differential bases and torsion data of §5.7, tame f prime to p, compatible ideal structures and roots of unity; integral auxiliaries c prime to pf, and c′ prime to pc when f=O_L. Use the §1.1 residue functions and torsion-free theta data of §§6.3–7.4. A subgroup used to fix a finite p-power level carries its index; no subgroup is required to fix every level simultaneously. The unit-index divisibility theorem above is required before normalized integral descent.

(KS-v4, Theorem 5.27, proof Steps 1 and 3, equations (5.7.1)–(5.7.4), pp.74–78, KS-v4 lines 3417, 3468, 3507, 3681; retain the class sign at KS-v4 line 3514 and apply the Artin translation to the four-term distribution at KS-v4 lines 2491–2498. Integral unit-index descent on the weighted quotient is a theorem target here, rather than an assertion of divisibility of the theta function.)

The construction has the following API.

- Critical character moments are the signed expression of §8.5 multiplied by Nc−χ(c)⁻¹, and by 1−χ(c′) in tame conductor one after the Artin translation.
- For every finite quotient, each mass of ν_(f,c,Γ₀) is divisible by [U_f:Γ₀] in O_(ℂ_p), with the same assertion for the raw conductor-one family. The normalized measures have norm at most one and are compatible with subgroup change.
- For b,c prime to pf, δ_b*μ_(f,c)=δ_c*μ_(f,b); establish equality using density of the linear span of the finite-order twists of a fixed critical character.
- In conductor one the translated family satisfies δ_b*μ_(O_L,c,c′)=δ_c*μ_(O_L,b,c′) and δ′_(b′)*μ_(O_L,c,c′)=δ′_(c′)*μ_(O_L,c,b′) whenever the auxiliary pairs are permitted. Artin translation commutes with convolution and preserves subgroup relations and the norm bound; its inverse is translation by Art(c′)⁻¹.
- Changing coset representatives transports the same weighted measure; the exact sequence uses the tame-congruence unit closure.

One proof route uses the native pushforward and PadicMeasuresIwasawaAlgebras §2.1 weighting and projection formula. Restrict to the clopen unit locus, then apply continuous inversion and the determinant weight. Prove the finite-quotient mass divisibilities for these residue measures and their compatibility under refinement, using the torsion-free cap and residue distribution; critical moment integrality alone is insufficient. Divide on the ray quotient only after that step. Insert §7.4, compute ramified local factors from PF and unramified corrections from the difference between F and zero extension, and retain the sign in §4.3. In conductor one compute the four-term distribution first and then translate by Art(c′). Use the resulting moments and boundedness to prove the auxiliary-family relations by density.

**Checks.**

- For L=ℚ(i), p=5, f=(3) and χ((λ))=λ⁻⁴, the local unit 7 maps ideal-theoretically to (7), giving 7⁻⁴=1/2401. The idelic image Art(7_p) gives 7⁴=2401 instead. On a selected coordinate, inversion followed by the determinant weight gives t⁴t⁻¹=t³ with the specified inclusion, whereas the idelic inclusion would give t⁻⁴t⁻¹=t⁻⁵.
- For a global unit ε not congruent to 1 mod f, its p-component is not killed merely by calling it a global unit; only the actual image of U_f is quotiented out.
- At f=O_L and x=e a single h_c is invalid on U; the c′ support excluding e makes the residue evaluation admissible.
- On a character monomial the inversion and extra t⁻¹ give derivative exponent a=α−1; missing the weight shifts the critical value.
- At nontrivial f, replacing closure(U_f) by closure(O_L×) can change the kernel and the available character moments.
- The unramified barΣ-depletion is the full product over barΣ_p, not a single prime.
- For α=2, β=1, evaluating the algebraic character at (t⁻¹,s) gives t²s; the determinant weight t⁻¹ gives ts. At t=2, s=3 the result is 6, whereas omission of the determinant weight gives 12.
- For L=ℚ(i), p=5, f=(3), χ((λ))=λ⁻⁴ and c=(7), the conductor-one character is allowed at the tame modulus (3), and U_f=1. Let U be the unsigned right side of §8.5. Then α=4, β=0 and ε(1,3,0)=−1, χ(c)=7⁻⁴, Nc=49 and δ_c(χ)=−2352. Thus the smoothed normalized moment is εδ_c(χ)U=+2352U. Here U≠0: the L-series at zero converges absolutely with |χ(a)|=Na⁻² and has nonzero Euler product; its omitted factor at (3) is 80/81, Local=1, and the two p-factors at (2+i) and (2−i) are (12−24i)/5 and (632−24i)/625. All periods are nonzero. This computes the sign of one smoothed moment from ε; a check at a single type cannot distinguish ε from its omission, which is the cross-type check of §8.5.
- For the same character at tame conductor one and c′=(3), the raw second factor is χ(c′)⁻¹−1=80, whereas δ′_(c′)(χ)=80/81. Relative to the unsigned conductor-one expression, the raw signed multiplier is 188160. Translation multiplies it by χ(c′)=1/81 and gives 62720/27=2352·80/81. For a finite-order twist ψ, translation multiplies the raw moment by (χψ)(c′), giving 1−(χψ)(c′); at ψ(c′)=−1 the raw factor is −82 and translation gives (−1/81)(−82)=82/81. No inverse smoothing factor is used.
- On ℤ₂× the measure δ_1−δ_(−1) has Amice transform 2T−T²+T³−⋯; half of it has power moments 0,1,0,1,… but takes the indicator of 1+4ℤ₂ to 1/2. Weighting by t⁻¹ gives δ_1+δ_(−1), whose pushforward to the ±1 quotient is 2δ_[1]. Division there gives the integral δ_[1], with mass 1. This is the quotient counterpart to the theta obstruction of §6.3.
- At subgroup index one ν=μ; for zero residue data both are zero at every finite quotient. In a chain with [U_f:Γ₀]=2 and [Γ₀:Γ₁]=3, ν_(Γ₀)=2η and ν_(Γ₁)=6η give the same normalized η. Thus the subgroup rule and divisibility must hold together, including when p=2 or 3.

*Needs:* §7.1; §7.4; §8.1; §8.2; §5.7; §2.3; §1.1 and §5.5 for the residue distribution; §4.3 for the class sign; GlobalNumberFields Layers 2, 7 and 9; ClassFieldTheory Layers 11–13 (gap:ray-tower-tame-unit-kernel); GlobalNumberFields Layers 9–10 (gap:hecke-padic-avatar); ComplexMultiplicationAndExplicitReciprocity §1.3; PadicMeasuresIwasawaAlgebras §§1.2 and 2.1 for bounded Artin translation, convolution and pushforward.

### 8.4 Bounded removal of auxiliary ideals

Establish a bounded O_(ℂ_p)-valued measure μ_f independent of c such that δ_c*μ_f=μ_(f,c) when f≠O_L, and δ_c*δ′_(c′)*μ_(O_L)=μ_(O_L,c,c′) for the translated conductor-one family of §8.3. The required output is a continuous O_(ℂ_p)-linear functional on C(G_f,O_(ℂ_p)) with norm at most one. Prove it by an integral measure-algebra divisibility argument or by Kummer congruences: for every m≥0, every finite family χ₁,…,χ_r of finite-order twists of a fixed critical avatar and every coefficient family a₁,…,a_r∈ℂ_p, if Σa_iχ_i(g) lies in p^m O_(ℂ_p) for every g∈G_f, then Σa_iM(χ_i) lies in p^m O_(ℂ_p). Here the proposed full character moment is M(χ)=Ω_p^α(Ω_p∨)^β·ε(d,α−1,β)·𝒩_(α,β)(Local(χ,Σ)·∏_(v∈Σ_p)(1−χ(v⁻¹)/Nv)·∏_(v∈barΣ_p)(1−χ(v))·L_f(χ,0)), with the algebraic normalized value transported to ℂ_p as in §8.5. The implication is uniform in r, the common finite level and m. The case m=0 gives the operator bound of one; scaling gives continuity on the dense span. Treat torsion components of G_f, shared zeros of the smoothing factors and conductor one explicitly. Merely knowing that each individual character value is integral, or that the family has greatest common divisor one in an unspecified ring, does not prove this statement. The uniform congruence argument is part of this theorem.

Assume compatible smoothed measures and their cross-relations; the generic pseudomeasure localization and boundedness criterion are imported from PadicMeasuresIwasawaAlgebras §3.1. All density arguments are made for continuous linear functionals with an established bound.

(KS-v4, Theorem 5.27, proof Step 2, p.77, and Step 4, p.79, KS-v4 line 3624.)

The resulting measure has the following API.

- Its convolution with every permitted auxiliary atom equals the corresponding smoothed measure, with both atoms in conductor one.
- It sends the coefficient unit ball of continuous functions into O_(ℂ_p), uniformly at every finite quotient.
- The full moments determine it uniquely among bounded measures, and the auxiliary-family relations make its definition independent of the chosen auxiliaries.

One proof route is to use finite-order twists of one fixed critical algebraic character: their linear span is the locally constant functions times an invertible continuous function, hence is dense. Two distinct finite-order characters are at uniform distance at least p^(−1/(p−1)), because a root of unity ζ≠1 in ℂ_p has |ζ−1|≥p^(−1/(p−1)); so the density is used through finite linear combinations, never through a sequence of single twists. Prove the uniform congruences/divisibility before extending the candidate functional by continuity. The congruences test only twists of the fixed avatar χ₀, on which ε is constant, so by themselves they give the values of the extension at no other type. Those values come from the single measure μ_(f,c): δ_c*μ_f and μ_(f,c) agree on the twists of χ₀ by construction, hence everywhere, since both are bounded. For a critical χ of another type choose c with δ_c(χ)≠0 and divide the all-type formula of §8.3 by δ_c(χ). In conductor one, choose c and c′ with δ_c(χ)δ′_(c′)(χ)≠0. Independence of the auxiliaries follows from the cross-relations of §8.3 in the same way.

**Checks.**

- On a finite cyclic group C_p, p⁻¹Σ_gδ_g has integral character values 1 or 0 but takes the indicator of the identity to 1/p; the proposed proof must rule out this failure.
- Do not assume every δ_c is a unit or equate a height-one gcd statement with a unit-ideal statement.
- For χ((λ))=λ⁻⁴ in the nonzero example of §8.3, M(χ)=−Ω_p⁴U, so δ_(7)(χ)M(χ)=2352Ω_p⁴U, which is the smoothed moment of §8.3 at that character. In conductor one the translated second factor gives 2352·(80/81) times the corresponding unsigned full moment, agreeing with the defining family relations.
- A twist-family congruence cannot detect a sign that depends only on the type: if M satisfies the displayed congruences on the twists of χ₀, so does −M. Reading the extension at another type through δ_c*μ_f=μ_(f,c), as above, is what carries ε across types.

*Needs:* §8.3; §8.2; §5.7; PadicMeasuresIwasawaAlgebras §3.1 (gap:bounded-fraction-criterion); Mathlib `AbstractMeasure`.

### 8.5 Critical Hecke-value interpolation over totally imaginary fields

For a p-ordinary lifted type Σ of L and a tame integral ideal f prime to p, construct a bounded O_(ℂ_p)-valued measure μ_f on G_f=Gal(L(p∞f)/L) such that for every critical algebraic χ of conductor dividing p∞f and infinity type β−α,
(Ω_p^α(Ω_p∨)^β)⁻¹∫_(G_f)χ(g)dμ_f(g)=ε(d,α−1,β)·𝒩_(α,β)(Local(χ,Σ)·∏_(v∈Σ_p)(1−χ(v⁻¹)/Nv)·∏_(v∈barΣ_p)(1−χ(v))·L_f(χ,0)).
Here ε(d,α−1,β)=(-1)^(d(d−1)/2+|α|+|β|+1), the class sign of §4.3 at derivative index a=α−1. The printed formula of KS-v4 Theorem 5.27 has no ε. Its proof applies KS-v4 Theorem 3.27 (KS-v4 line 3514), whose class formula omits the derivative and binomial signs of §4.3: in the proof of Proposition 3.23 (KS-v4 line 1977) the a-fold derivative of exp(2πi⟨λ,z−t⟩) is recorded as (πr)^a times the shifted series, whereas each ∂_z contributes −π r barλ. For even d, admissibility makes |α|+|β| even, so ε=(−1)^(d(d−1)/2+1) is constant and the two formulas differ by that constant. Where both values of ε occur among the critical characters of G_f, as in the d=1 example below, the finite-order twists of one critical character span a dense subspace of C(G_f,ℂ_p), so the two formulas cannot both be satisfied by bounded measures with the same unsigned moments (Checks below). That exclusion does not choose between them. The target is the formula with ε because the construction's moments carry it. At characters unramified at p no Fourier kernel or Gauss sum enters, and the dependence of the sign on the type is the derivative sign of §4.3. At d=1, BK-2010 obtains the same parity from the Laurent expansion of the Kronecker theta function, independently of KS-v4 §3 (Checks below). For this algebraically based datum the complex normalization on the right is algebraic by §§5.7–5.8 and is transported to ℂ_p by the chosen embeddings of the common algebraic coefficient field; no map from all of ℂ to ℂ_p is used. At a prime ramified in χ set the corresponding ideal-character value to zero so the omitted Euler factor is one; χ(v⁻¹)=0 in that convention is not the inverse of zero. Primitive versus f-imprimitive L-functions are related by exactly the displayed depletion factors. Prove uniqueness from the density of the span of the finite-order twists after boundedness has been established. The construction retains the class-to-moment sign, uses the conductor-one Artin translation, and proves integral descent on the weighted ray quotient and bounded auxiliary division in §§8.3–8.4.

Assume ordinary standard datum with A, its CM action, differential bases and torsion data defined over a number field as in §5.7, O_L Betti structure, complex and p-adic periods fixed; all characters read through the chosen embeddings. The proof uses the signed moments, translated conductor-one family and integral ray-quotient descent of §8.3, and the uniform bounded division of §8.4.

(KS-v4, Theorem 5.27, p.74 and proof pp.74–79, KS-v4 line 3392, with ε(d,α−1,β) retained from the class formula at KS-v4 lines 3507–3514 and with the conductor-one Artin translation specified in §8.3; KS-v4, proof of Proposition 3.23, p.43, KS-v4 line 1977, for the derivative step; HT-1993, Theorem II, p.193, HT-1993 line 181, for the parity factor in Katz's measure for CM fields; BK-2010, Theorem 1.17, p.17, Proposition 3.3, p.36, and Theorem 3.11, p.44, BK-2010 lines 769, 1625 and 1996, for the same parity at d=1.)

One proof route is to combine the corrected smoothed interpolation with §8.4. At ramified and unramified Σ-places compute the separate Fourier contributions; collect the complete barΣ-depletion. Use density for uniqueness after boundedness.

**Checks.**

- For ℚ(i) at p=5, d=1 and α=2, β=1, the moment has period divisor Ω_p²Ω_p∨. For a degree-four CM field the divisor has two selected coordinates; the non-CM quartic of the worked example has the same coordinate count without a CM involution.
- An inert prime for an imaginary quadratic K is outside this theorem; it belongs to the independent nonordinary direction.
- For an algebraic unit u rescaling one selected algebraic differential, Ω and Ω_p both acquire u. Both normalized sides acquire u^(−α_σ), so the equality persists; for α_σ=2 and u=2 at p=5 this multiplier is 1/4.
- A transcendental differential rescaling as in §5.7 gives no algebraic normalized value to transport through the chosen embeddings into ℂ_p; the interpolation datum requires algebraic bases even though the general-R residue and integrality constructions allow that rescaling.
- At L=K=ℚ(i), f=O_K and p=5, the types −kΣ−d(σ)(σ−barσ), k≥1 and d(σ)≥0, have α=k+d(σ)≥1 and β=d(σ)≥0 and are included whenever the finite unit character is compatible. In particular k=2, d(σ)=1 gives (α,β)=(3,1), whose unit weight is trivial on μ₄ and whose class sign is ε(1,2,1)=−1. The target also includes arbitrary admissible critical types and tame f prime to p.
- For the nonzero χ((λ))=λ⁻⁴ example in §8.3, ε(1,3,0)=−1, so the unsmoothed normalized moment is −U. Multiplication by δ_(7)(χ)=−2352 gives +2352U, the smoothed moment of §8.3, so δ_c*μ_f=μ_(f,c) holds at this character. For d=1 the sign is +1 at (α,β)=(3,0) and (2,1) and −1 at (4,0) and (3,1); at d=2 it is +1 for every admissible type, for instance α=(1,1), β=0; a single global sign cannot replace ε(d,α−1,β) across all critical types.
- Cross-type test. For L=ℚ(i), p=5 and f=(1+i)³, the map μ₄→(ℤ[i]/f)× is bijective, so U_f=1, Cl_f=1 and G_f=(O_L⊗ℤ₅)×; write g=q_f(u,v) with u the Σ-coordinate and v the barΣ-coordinate in ℤ₅×. The generator λ≡1 mod f of an ideal prime to 2 gives a critical character ψ(a)=λ⁻¹ of type (α,β)=(1,0), unramified at 5, with ψ(q_f(u,v))=u⁻¹. Put χ₃=ψ³ and χ₄=ψ⁴, with ε(1,2,0)=+1 and ε(1,3,0)=−1. No finite-order character η is uniformly close to ψ: at g=q_f(6,1), ψ(g)=1/6 and |1/6−1|₅=1/5, whereas every root of unity ζ≠1 in ℂ₅ has |ζ−1|₅≥5^(−1/4), so |η(g)−ψ(g)|₅≥1/5. Approximate ψ by finite linear combinations instead. Choose integers r(x) representing the classes x∈(ℤ/5^n)× with r(−x)=−r(x), and put φ_n(q_f(u,v))=r(u mod 5^n)⁻¹. Then |φ_n−ψ|≤5^(−n) on G_f, and φ_n=Σ_η c_(n,η)η, where η runs over the characters of (ℤ/5^n)× read in the u-coordinate. Since φ_n is odd in u, c_(n,η)≠0 forces η(q_f(−1,1))=−1. So every η in the sum is ramified at the Σ-place above 5, unramified at the barΣ-place, and takes the value −1 at q_f(−1). As |χ₃|=1, χ₃φ_n→χ₄ uniformly, and boundedness of μ_f gives Σ_η c_(n,η)∫χ₃η dμ_f→∫χ₄ dμ_f. Let U=εM be the unsigned full moment, with M as in §8.4. The signed formula then forces Σ_η c_(n,η)U(χ₃η)→−U(χ₄), and the printed unsigned formula forces the limit +U(χ₄). Here U(χ₄)≠0: |χ₄(a)|=Na⁻², Local(χ₄,Σ)=1, both p-Euler factors are nonzero because |χ₄(v)|=1/25, and all periods are nonzero. So the two formulas exclude each other. This is a necessary condition only. The sums Σ_η c_(n,η)U(χ₃η) are determined by L-values and Gauss sums, and the test shows that at most one formula holds, not which. For the measure built here the limit is fixed by three inputs: its moments at the unramified endpoints χ₃ and χ₄ (computed below), the independence of the sign from the finite-order twist within one type (§8.3), and the kernel of §7.3 (next Check).
- The same test pins the Fourier kernel. Replacing the inverse kernel of §7.3 by the positive one multiplies Local(χ,Σ) by the Σ-component of χ_fin(−1). This factor is −1 for every χ₃η in the sums above and 1 for χ₄, so it reverses the predicted limit. More generally (−1)^(|α|+|β|)=χ(q_f(−1))χ_fin(−1), so ε=(−1)^(d(d−1)/2+1)χ(q_f(−1))χ_fin(−1). The sign therefore amounts to a translation by q_f(−1) combined with reversed pairing signs in both directions of §§7.2–7.3, which multiply the moments by the Σ- and barΣ-components of χ_fin(−1); where ε varies with the type it is not a constant.
- The endpoint values of the cross-type test are computed from the construction, not from the target. For χ unramified at p, Local(χ,Σ)=1 and no Fourier kernel or Gauss sum enters. At d=1 and β=0 the χ-moment comes through §7.1 from the coordinate of §4.3 at a=α−1. Its dependence on the type is the sign of ∂_z^a(z+λ)⁻¹=(−1)^a·a!·(z+λ)^(−a−1); the remaining signs of §4.3 are the same for all types. After division by δ_c(χ), the moments at χ₃ (a=2) and χ₄ (a=3) are therefore +U(χ₃) and −U(χ₄). Here U(χ₃)≠0 as for χ₄, since |χ₃(a)|=Na^(−3/2) and |χ₃(v)|=5^(−3/2)≠1. So the measure built here satisfies no formula of this shape whose sign is independent of the type. BK-2010 derives the same parity without KS-v4 §3. The coefficient of z^(b−1)w^a in the Laurent expansion of the Kronecker theta function at a torsion point is (−1)^(a+b−1)e*_(a,b)/(a!A^a) (Theorem 1.17). Here A>0 is the covolume divided by π, and the Eisenstein–Kronecker number e*_(a,b) at a torsion point t with trivial second argument is the series E^(a,b)(t,0) of §4.1 for the trivial unit group. The p-adic measure of that expansion has moments with the same sign (Proposition 3.3). The Katz-measure interpolation for a Hecke character of infinity type (k,−l), k>l≥0, carries the factor (−1)^(k+l−1)(k−1)!, with Gauss sum 1 when the character is unramified at p (Theorem 3.11). For χ the inverse of that character, (k,l)=(α,β), and the factor is ε(1,α−1,β) times the factorial (α−1)! of 𝒩_(α,β): it is +2 at χ₃ and −6 at χ₄.
- In Hida–Tilouine's statement of Katz's measure for a CM field M with maximal totally real subfield F and CM type Σ (HT-1993, Theorem II, p.193), the interpolation factor contains (−1)^(m₀Σ) for idelic infinity type m₀Σ+d(1−c). The ideal type is β−α with α_σ=m₀+d_σ and β_σ=d_σ, so (−1)^(m₀Σ)=(−1)^(m₀[F:ℚ])=(−1)^(|α|+|β|). A sign depending on the parity of the type thus occurs in a single all-type interpolation for a bounded measure; whether it appears depends on the Gauss-sum kernel, the level structure and the evaluation point.

*Needs:* §8.4; §8.1; §6.2; §5.2; AutomorphicLFunctionsAndLocalFactors AL.1, “Local epsilon factors and Gauss sums”.

### Examples

For Nc=7 and χ(c)=2, the smoothing atom evaluates to 13/2 and χ(c)Nc−1=13. On C_p the field-valued functional p⁻¹Σδ_g has all finite-character values 0 or 1 but gives the identity indicator the nonintegral value 1/p. This detects the missing uniform congruence, including p=2 and p=3.

### Dependencies

Earlier layers 0, 1, 2, 3, 4, 5, 6, 7; AutomorphicLFunctionsAndLocalFactors AL.1, “Local epsilon factors and Gauss sums”; Mathlib `AbstractMeasure.dirac` and `AbstractMeasure.diracHom`; Mathlib `AbstractMeasure.dirac`; PadicMeasuresIwasawaAlgebras §1.2; GlobalNumberFields Layers 2, 7 and 9; ClassFieldTheory Layers 11–13 (gap:ray-tower-tame-unit-kernel); GlobalNumberFields Layers 9–10 (gap:hecke-padic-avatar); ComplexMultiplicationAndExplicitReciprocity §1.3; PadicMeasuresIwasawaAlgebras §2.1; PadicMeasuresIwasawaAlgebras §3.1 (gap:bounded-fraction-criterion); Mathlib `AbstractMeasure`. The individual statement and proof-route inputs are specified above.

## Downstream consumers

The outputs support arithmetic applications of ordinary critical Hecke values and their integral comparisons: regularized values, CM period ratios and bounded ray-class measures. The analytic series and residue comparison are also independent inputs for polylogarithmic and regulator calculations. NonordinaryCMSpecialValues uses the shared CM/Hecke conventions but not the ordinary constructor at its inert prime. No Selmer characteristic-ideal identity or main conjecture is proved here.

## Worked examples

For L=ℚ(i), Γ in the kernel of the unit weight, α=2 and β=1, the derivative index is a=1. The complex multiplier is (2πi)/(Ω²Ω∨), and the p-adic moment divisor is Ω_p²Ω_p∨. Here ε(1,1,1)=+1. The extra Σ-period is the determinant contribution, so replacing a+1 by a changes the result even at a=0. At p=5 the two place sets are disjoint. At p=3 the two embeddings have the same place, so no measure from this ordinary datum is asserted (KS-v4, Definitions 5.2–5.7 and Theorem 5.22, pp.56–59,65–66, KS-v4 lines 2625, 3009).

For L=ℚ(i,√(1+i)) over K=ℚ(i), the polynomial over ℚ is X⁴−2X²+2. The chosen square root has complex norm-square √2. Its complex conjugate is not in L: that would put √2 in L, but writing an element of K(√(1+i)) as a+b√(1+i) and squaring shows √2 would require 1−i to be a square in K; its norm 2 is not a square in ℚ. The lifted type has two embeddings over the selected embedding of K. Hence α=(1,2) cannot descend from K, while α=(2,2), β=(1,1) does and has parallel conjugate sum −1. Its Serre construction has dimension 2 and repeats both K-period exponents twice. At p=5 restriction to K still separates the two ordinary place sets (KS-v4, §1.1, Theorem 1.1 and Remark 1.10, pp.7–10, KS-v4 line 279; Corollary 4.14, p.54, KS-v4 line 2534).

For a cyclic Fourier coordinate of order 3, let ζ=exp(2πi/3). The function (1,ζ,ζ²) transforms with the inverse kernel to (0,1,0), since 1+ζ+ζ²=0. The zero-point indicator transforms to (1/3,1/3,1/3). Thus the pairing in theta translation is positive, the Fourier kernel is inverse, and the inverse transform sums with the positive pairing without a second factor 1/3 (KS-v4, Definition 5.24 and Corollary 5.25, pp.70–72, KS-v4 line 3238).

For a trivial p-local finite character the Σ-extension is the constant 1 on all local integers. Its normalized transform at the zero conductor frequency is 1, so Local=1. If two unramified complementary primes have ideal values 2 and 3, their depletion product is (1−2)(1−3)=2; keeping either single prime gives −1 or −2. At a ramified prime its Euler factor is 1 by zero extension, without evaluating 0⁻¹ (KS-v4, Definition 5.26 and Theorem 5.27, pp.73–74, KS-v4 lines 3373, 3392).

## References

All Kings–Sprang locators use the 85-page arXiv v4 numbering; supplementary KS-v4 line numbers refer to the line-numbered layout extraction of that version. The journal has different pagination. Statements, normalizations and local computations above are expressed independently.

- **KS-v4.** Guido Kings and Johannes Sprang, *Eisenstein–Kronecker classes, integrality of critical values of Hecke L-functions and p-adic interpolation*, arXiv:1912.03657v4 (2024), §§1–5 and Appendices A–B. [Open preprint](https://arxiv.org/abs/1912.03657v4). The construction follows §§2–3, the critical-value applications §4, and ordinary interpolation §5; the additional sign, unit-index and bounded-divisibility targets specify the comparisons required by these normalizations.
- **BKO-2021.** Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, *Rubin’s conjecture on local units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966, Introduction and §§3,6. [Institutional copy](https://authors.library.caltech.edu/records/8svwt-jn031). This records the boundary with the independent nonordinary direction.
- **HK-2018.** Annette Huber and Guido Kings, *Polylogarithm for families of commutative group schemes*, Journal of Algebraic Geometry 27 (2018), 449–495; all locators use the arXiv:1505.04574v1 numbering, Theorem 3.3.1, Definition 5.2.2, Theorem 5.2.3, Proposition 5.3.1, Proposition 7.1.2 and Corollary 7.1.3. [Open preprint](https://arxiv.org/abs/1505.04574v1). Sheaf-theoretic vanishing of the cohomology of the logarithm sheaf and the residue characterization of the polylogarithm, of which §§2.6–2.7 state the de Rham analogues.
- **HT-1993.** Haruzo Hida and Jacques Tilouine, *Anti-cyclotomic Katz p-adic L-functions and congruence modules*, Annales scientifiques de l’École Normale Supérieure (4) 26 (1993), 189–259, Theorem II, p.193. [Numdam](http://www.numdam.org/item/ASENS_1993_4_26_2_189_0/). Katz's measure for a CM field over all critical types, whose interpolation factor contains a sign depending on the parity of the infinity type; cited in §8.5 for that parity factor only, its Gauss sums and periods having their own normalizations.
- **BK-2010.** Kenichi Bannai and Shinichi Kobayashi, *Algebraic theta functions and the p-adic interpolation of Eisenstein–Kronecker numbers*, Duke Mathematical Journal 153 (2010), 229–295; all locators use the arXiv:math/0610163v4 numbering, Theorem 1.17, Proposition 3.3 and Theorem 3.11. [Open preprint](https://arxiv.org/abs/math/0610163v4). The Laurent expansion of the Kronecker theta function, the two-variable p-adic measure built from it and Katz's interpolation formula over an imaginary quadratic field; cited in §8.5 as an independent derivation, at d=1, of the parity sign of the moments.
- **Sch-2014.** René Scheider, *The de Rham realization of the elliptic polylogarithm in families*, dissertation, Universität Regensburg, arXiv:1408.3819v1 (2014), Theorem 1.2.1, Lemma 1.2.3, Definition 1.2.4, Theorem 1.2.9 and §1.5.2. [Open preprint](https://arxiv.org/abs/1408.3819v1). De Rham cohomology of the logarithm sheaves of an abelian scheme and the de Rham residue sequence.
