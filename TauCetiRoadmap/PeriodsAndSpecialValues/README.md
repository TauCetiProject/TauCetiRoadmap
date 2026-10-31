# Roadmap: periods, motivic L-values and special-value conjectures

**Summary.** Build the period invariants of motives and the special-value statements made with them, from the de Rham–Betti comparison to the Birch–Swinnerton-Dyer, Bloch–Kato and equivariant Tamagawa formulations, and carry the conventions through two complete case studies. The roadmap fixes the direction of the comparison isomorphism, its determinant line, the infinity involution, period classes modulo a coefficient field, and Deligne's plus and minus periods; it transports the shared Euler products of compatible systems to motivic realizations, extends archimedean factors to general Hodge multiplicities, builds critical integers and Deligne's normalized-value predicate, and proves the Dirichlet and modular adapters; it compares the imported marked evaluation of formal periods with the inverse-comparison convention; it assembles the rational and integral fundamental lines with their regulator trivializations and local corrections, the equivariant Tamagawa obstruction, the Bloch–Kato Tamagawa measure and Sha, and the elliptic, rank-zero/one and Rankin–Selberg comparisons; and it proves period-integral error inequalities and covariance under normalization changes. The case studies are the arithmetic mirror symmetry of the Dwork quartic (marked K3 periods, Picard–Fuchs equation, integral monodromy and integrality of the mirror map) with Shapiro's boundary Frobenius for the Dwork quintic, and Brown's theorem that the Hoffman elements form a basis of the motivic multiple zeta values, with numerical spanning as a consequence. The general conjectures — Deligne's, Beilinson's, Bloch–Kato's, the equivariant Tamagawa number conjecture, Serre's and Hasse–Weil functional equations, the Beilinson–Bloch–Kato rank prediction, higher-rank BSD and the period conjecture — are stated as predicates with their hypotheses; theorems enter only in proved cases, each with its exact scope.

## Scope and ownership

This roadmap owns:

- the comparison determinant line, the geometric infinity involution and its eigenspaces, period classes modulo the coefficient field, Deligne's periods c^± and δ, and the Tate and elliptic normalizations (Layer PS.0);
- the motivic realization adapters for shared Euler products, archimedean factors for general Hodge multiplicities in Deligne's and BCGP's conventions, critical integers, Deligne's normalized-value predicate, the Dirichlet/Tate and modular period adapters, Serre's functional-equation predicate and the Hasse–Weil predicates for abelian varieties (Layer PS.1);
- the comparison of the imported marked evaluation with the inverse-comparison convention, and its rank-one Tate specialization (Layer PS.2);
- the Burns–Flach orientation of the imported rational Fukaya–Kato line, the real period–regulator trivialization, leading terms and their rationality (Layer PS.3);
- integral fundamental lattices, the finite lattice correction, local Euler and Tamagawa corrections, and the real dyadic restriction (Layer PS.4);
- the equivariant Tamagawa obstruction with the extended boundary, the ETNC predicate, the orientation of the Fukaya–Kato zeta isomorphism, and the transport of proved cases (Layer PS.5);
- Bloch–Kato motivic pairs, points, Tamagawa measure and Sha, the Bloch–Kato predicate, the elliptic fundamental-line adapter, conditional transport of rank-zero and rank-one BSD witnesses, and the Rankin–Selberg Beilinson–Bloch–Kato prediction and coefficient-extension transport (Layer PS.6);
- period-integral transformations and error inequalities, stability of normalized quotients, covariance of normalized values, and the period conjecture (Layer PS.7);
- the Dwork quartic and quintic case studies, including the general equivariant semistable model of the reciprocal Dwork family (Layer PS.8);
- multiple zeta values: indices, the two-letter shuffle specialization and stuffle product, iterated integrals, regularizations, Zagier's evaluation, mixed Tate motives over ℤ and their Galois group, the motivic path torsor of ℙ¹ ∖ {0, 1, ∞}, Brown's motivic multiple zeta values and coaction, the Hoffman basis and numerical spanning (Layer PS.9).

### Prerequisites and boundaries

The following are imported from their named owners and sections:

- **TauCetiRoadmap EllipticCurves** Layers 1, 2, 4, 6 and 7: the invariant differential, Tate modules and the Weil pairing, reduction types and local Tamagawa numbers, Mordell–Weil, canonical heights and the regulator, Selmer groups, Sha and the conditional BSD quotient over ℚ with its all-components real period. Complex uniformization is not supplied there and is not used here.
- **SmallRamificationAndAbelianVarietyBaseCases** §5.0d: the positive-rank raw compatible-system carrier and its coefficient fields, local realization fields and operations; **AutomorphicGaloisRepresentationsPartII** AG2.P, ‘Arbitrary-rank compatible data and operations’: Weak and all-place Strict; **PotentialModularityAndCompatibleSystems** §§1.6, 1.7 and 1.15: away-coefficient strictness, the rank-zero family extension, partial/full finite Euler products, convergence and regular-system completion. PS.1 owns their motivic adapters, including the zero-motive adapter, all-place conductor assembly and the general Hodge-multiplicity and Gamma-normalization extension; its regular-completion comparison has the real-place parity restriction of PS.1.2.
- **EllipticIntegrals** Milestones 1 and 3: canonical modulus-based K and E, their algebraic integral forms and endpoint integrability, and Legendre's relation. PS.7.1 owns the parameter adapter λ=k², rational substitution, midpoint error bound and marked-cycle comparison.
- **ColemanIntegration** L1.12: the generic shuffle word algebra; **AnabelianGeometryAndNonabelianChabauty** §2.0 ‘Word algebra and shuffle coordinates’ and §2.4: its coordinate coalgebra and completed-dual comparison. PS.9 owns the two-letter/index specialization, admissible subalgebras, stuffle and motivic mixed Tate applications.
- **TauCetiRoadmap ModularForms**: the L-function of a newform with its Euler product and continuation, and (Layer 8) modular symbols and the Eichler–Shimura period map.
- **BorelRegulators** §§2.1–2.3 and 6.0a–6.3: the Chern-normalized Borel regulator on K_(2j−1)(O_F) for every number field F and j ≥ 2, its real isomorphism, its comparison r_Bo = −2·r_Be with the shared Beilinson regulator into real Deligne cohomology, and the rational Adams weight. **ArithmeticKTheory** §§3.3–3.4: rational localization from O_F to F, the stable arithmetic comparison and Borel's ranks. PS.3.2a only places these supplied maps in the fundamental line of h⁰(Spec F)(j); the degree-one boundary is the Dirichlet regulator. No elliptic L(E, 2) regulator formula is used.
- **[NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md)**: the Dirichlet regulator and the class number formula at s = 1, which is the degree-one case of the Borel regulator; this roadmap starts at degree j ≥ 2.
- **TauCetiRoadmap PadicMeasuresIwasawaAlgebras** Layer 5: determinant lines of perfect complexes over commutative rings, their acyclic trivialization and specialization.
- **TauCetiRoadmap ClassicalArithmeticCompletion** §7.10 and §7.60: reduced norms of semisimple number-field algebras and the description of their images (Hasse–Schilling–Maass).
- **[IntegralLattices](../../Completed/IntegralLattices/README.md)** Layers 1–5: rational-ambient integral lattices, discriminant forms and gluing. The active IntegralLattices roadmap, Layer 5 milestones 5G–5H and Layer 6 milestone 6A, supplies primitive embeddings and indefinite unimodular classification.
- **TauCetiRoadmap SchemeAndStackFoundations** §§1.17, 1.23 and 4.11: quotients by finite groups, coarse spaces, modifications and strict transforms; general blow-ups are supplied by **TauCetiRoadmap StableReduction** Layer 4.
- **IntegralHeckeAndGaloisDeterminants** Layer 0, §0.6: the Azumaya reduced-norm determinant law, with duals and projective modules.

Other roadmaps supply the following, as specified in Exact supplier contracts: MotivesAndAlgebraicCycles (Layer 1 projectors, MC.2 realizations and Layers 3–6: Tannakian categories, geometric motives, Nori diagrams and the marked period torsor); ComplexComparisonPartII C5 (de Rham–Betti comparison, Gauss–Manin connection); AlgebraicTopology Stage 6; ArithmeticGaloisRepresentations §§2.4–2.6, §3.3; AutomorphicLFunctionsAndLocalFactors AL.1, AL.3, AL.4, AL.5; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6; NeronModelsAndSemistableAbelianVarieties Layer 6 (§6.10); WeilConjectures WC.1–WC.2; EtaleDualityAndPerverseSheaves Layer 0, §§0.5–0.6; DirichletPadicLFunctions L0; ArithmeticGaloisDuality D7; SelmerIwasawaCohomology L2–L4; GeneralAlgebraicKTheory Layer 4; NoncommutativeAndEquivariantIwasawa NE.7; IntegralIwasawaTheory Layer 11; K3SurfacesAndSymplecticBoundedness §§3.1, 4.2; CrystallineCohomology CR.5–CR.7; PadicDifferentialEquationsAndRigidCohomology RD.1, RD.3–RD.5 and RD.7; ModularCurvesPartII §3.6; PolylogarithmFunctions; AnabelianGeometryAndNonabelianChabauty NC.2; ArithmeticKTheory §§3.3–3.4; BorelRegulators §§2.1–2.3, 6.0a–6.3.

PS.1.6 constructs the newform motive from geometric projectors, PS.3.0 compares the motivic and Adams-weight carriers, and PS.9.15 constructs the configuration-pair framings needed for motivic stuffle. IntegralLattices 5G–5H and 6A own the abstract lattice theorems, K3Surfaces K2 owns the geometric K3 cup lattice, and MotivicEtaleKTheory §§2.2–2.4 owns the higher Chern comparison. These supplied theorems are not targets here. The arbitrary-pair comparison and marked period evaluation are MotivesAndAlgebraicCycles §§5.7, 6.7–6.9. The noncommutative determinant functor is NoncommutativeAndEquivariantIwasawa §2.7. PS.3 defines the Burns–Flach orientation of the imported rational fundamental object, and PS.4 constructs its integral pullback under an explicit rational comparison hypothesis. PS.6.4 and PS.6.7 transport explicitly given arithmetic witnesses; neither asserts a theorem supplied by an unnamed arithmetic continuation.

The unit arctangent integral is the Mathlib identity `integral_one_div_one_add_sq` specialized using `Real.arctan_one`; PS.7.1 adds its signed finite-sum remainder bound. The finite-prime lattice patching and its local-projectivity criterion belong to PS.5.1; they are not supplied by the completed NumberFieldArithmetic roadmap. The newform motive of PS.1.6 differs from a supplied rank-two cohomological realization by constructing its homological eigenprojector and marked Betti–de Rham comparison. The framed comparison of PS.9.15 differs from a supplied relative motive by preserving both its differential-form frame and its oriented Betti cell.

### Theorems and predicates

The following are predicates, used only as named hypotheses: DeligneAlgebraic (PS.1.4), SerreSystem (PS.1.7), SerreC9 and HasseWeilConjecture (PS.1.8), LeadingTermRational and the Beilinson leading-term assertion (PS.3.3), ETNC (PS.5.2), BlochKatoTamagawa (PS.6.5), BBKRankZeroOne (PS.6.6), higher-rank BSD (PS.6.3), PeriodConjecture (PS.7.4), QuinticBoundaryLatticeIntegral (PS.8.17), numerical independence of Hoffman values and exact numerical dimensions (PS.9.23). Everything else in the layers is a definition, construction or theorem to be proved. Numerical agreement witnesses no predicate; an analytic inequality retains its stated hypotheses and bounds.

## Conventions

**Comparison direction.** Integration is β : H_dR ⊗ ℂ → H_B ⊗ ℂ. Deligne's comparison is I = β⁻¹, whose determinant lies in Hom(det H_B, det H_dR) ⊗ ℂ. With column coordinates, basis changes A on the Betti side and C on the de Rham side transform the comparison matrix to C⁻¹PA. Period coordinates modulo a coefficient field E use one E^×-unit simultaneously at all embeddings; one embedding gives only a component class.

**Tate objects.** On ℚ(−1) = H¹(𝔾_m), integration of dz/z over the counterclockwise loop is 2πi; the scalar of I on ℚ(n) is (2πi)^n, F∞ acts by (−1)^n, and the Hodge type is (−n, −n). The infinity involution F∞ is E-linear and geometric; it is distinct from the semilinear conjugation of a complexified lattice. Deligne's plus/minus comparison must itself be an isomorphism, and a zero-dimensional sign part has period 1.

**Euler factors and Gamma factors.** Local factors are inverse characteristic polynomials: L_v(s) = `P_v(q_v^{−s})⁻¹` with P_v(T) = det(1 − T·Fr_v | (ker `N_v)^{I_v}),` Fr_v geometric. Γ_ℝ(s) = `π^{−s/2}Γ(s/2)` is Mathlib `Complex.Gammaℝ`; Deligne's `Γ_{ℂ,D}(s)` = `2(2π)^{−s}Γ(s)` is Mathlib `Complex.Gammaℂ`; BCGP's `Γ_{ℂ,B}(s)` = `(2π)^{−s}Γ(s).` Finite L-values may be zero; unit statements carry a nonvanishing hypothesis. The leading coefficient at an order-r germ is L* = lim `s^{−r}L(s),` equal to `L^{(r)}(0)/r!` when r ≥ 0.

**Determinants.** Determinant lines follow TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1: det C = ⊗_i `det(C^i)^{(−1)^i},` with Koszul signs; under the acyclic trivialization [A --a--> A] in degrees 0, 1 has image aA and in degrees −1, 0 has image a⁻¹A. The Burns–Flach fundamental line is Ξ, the Fukaya–Kato line is Δ = Ξ⁻¹; θ_∞ : Ξ_ℝ → 1 and the ETNC integrality is δ̂(L*) + RΩ = 0. Global fundamental-line determinants use ordinary-real compact support RΓ_c,ord from NoncommutativeAndEquivariantIwasawa §F.3: ordinary cochains at real places and zero complex-place terms. ArithmeticGaloisDuality D7 uses Tate-modified support RΓ_c,Tate for duality. At odd p their comparison is RΓ_c,ord → RΓ_c,Tate → V⁺[0], with V⁺ = ⊕_(v real) V^(c_v=1); hence d(RΓ_c,ord) = d(RΓ_c,Tate) ⊗ d(V⁺)⁻¹ and Δ has the opposite exponent. Integral statements are made for p odd, or without real places, unless a bounded perfect model of the corrected ordinary-real complex at 2 is supplied (PS.4.4).

**The quartic.** z = (4t)⁻⁴ is the Frobenius-series variable and t⁻⁴ = 256z the unscaled hypergeometric variable. Raw residue periods are t⁻¹ times the hypergeometric solutions, so the normalized form is tΩ. The marked basis is (h, e, f) with Gram matrix [[4, 0, 0], [0, 0, 1], [0, 1, 0]], and the period line is [p, −1, 2p²]. The local ratio at a real parameter s near 1 is pulled back by t = i·s to the marked chart at t = i; the chart at t = 1 has the translated reflection in p − 1; the two based loops keep their distinct markings.

**The quintic.** `π^{p−1}` = −p; the normalized Frobenius is F = p⁻²F_raw; the basis is e_i = δ^iω and matrices are in the column-input convention.

**Multiple zeta values.** Indices are descending, n₁ > ⋯ > n_r > 0, admissible when k₁ ≥ 2, with ζ([]) = 1; translation from the ascending notation of Brown and Zagier reverses the whole word. Indices are encoded as 0/1 words by k ↦ `0^{k₁−1}1⋯0^{k_r−1}1.` In the Hoffman cut matrix, source words index rows and target pairs index columns. Brown's ζ₁^m(2^n) is the leading-zero shuffle-regularized integral I^m(0; 0(10)^n; 1). Brown's algebra H is nonnegatively graded and keeps ζ^m(2) ≠ 0; arbitrary Tate twists live in the localized period algebra of PS.2.

**Normalization checks.**

- I on ℚ(1) is 2πi, on ℚ(−1) is (2πi)⁻¹, on ℚ(0) is 1; F∞ = −1 on ℚ(1).
- ζ(2)/(2πi)² = −1/24 and ζ(−1) = −1/12; 0 and 1 are not critical for ℚ(0), while 2 and −1 are.
- `Γ_{ℂ,D}(1)` = 1/π and `Γ_{ℂ,B}(1)` = 1/(2π); Γ_ℝ has poles exactly at 0, −2, −4, ….
- [O --π³--> O] in degrees 0, 1 has determinant lattice π³O, and in degrees −1, 0 the lattice π⁻³O.
- For the unit motive, P_p(T) = 1 − T and L_p(s) = (1 − `p^{−s})⁻¹.` Over ℚ at odd p with S = {p,∞}, χ(RΓ_c,Tate) = 0 − (−1) = 1, dim V⁺ = 1 and χ(RΓ_c,ord) = 0; Ξ and Δ both have degree 0.
- A₁ = 24 and the mirror coordinate begins q = z + 104z² + ⋯.
- encode([2, 1]) = 011 and ζ(2, 1) = ζ(3) in descending notation.
- The weight-five Hoffman cut matrix [[3, −11/2], [−2, 9/2]] has determinant 5/2.

## Exact supplier contracts

Each entry names the supplier and the precise input consumed. The local constructions that connect these inputs are targets in the layers below.

### From Mathlib at the pin

Linear algebra: `Matrix.det`, `Matrix.det_mul`, `Matrix.det_fin_zero`, `Matrix.det_smul`, `Matrix.det_nonsing_inv`, `Matrix.det_of_isUpperTriangular`, `LinearIndependent`, Submodule.span, `Finsupp.single`, `Ideal.Quotient.mk`, `Ideal.quotientInfRingEquivPiQuotient`. Localization: `IsLocalization.Away`, `IsLocalization.Away.lift`, IsLocalization.Away.mul_invSelf, `LaurentPolynomial.eval₂` with `LaurentPolynomial.eval₂_T`. Special functions: `Complex.Gamma` (total, with value 0 at its poles, `Complex.Gamma_eq_zero_iff`), `Complex.Gammaℝ`, `Complex.Gammaℂ` (Deligne's normalization), `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`, `ordinaryHypergeometric` (the ₂F₁ series; no ₃F₂ or continuation). Zeta and L-functions: riemannZeta, `riemannZeta_two`, `riemannZeta_four`, `riemannZeta_neg_nat_eq_bernoulli`, `zeta_nat_eq_tsum_of_gt_one`, `riemannZeta_eulerProduct`, completedRiemannZeta_one_sub, hurwitzZeta_neg_nat, DirichletCharacter.completedLFunction, DirichletCharacter.IsPrimitive.completedLFunction_one_sub, DirichletCharacter.rootNumber, meromorphicOrderAt. Analysis and measure: `intervalIntegral`, `intervalIntegral.norm_integral_le_of_norm_le`, `intervalIntegral.integral_comp_mul_deriv'`, MeasureTheory.tendsto_integral_of_dominated_convergence, MeasureTheory.integral_tsum, MeasureTheory.Measure.haarMeasure, MeasureTheory.Measure.infinitePi (probability measures only), PhragmenLindelof.horizontal_strip, `integral_one_div_one_add_sq`, `Real.arctan_one`. Harmonic numbers: `harmonic` (Mathlib/NumberTheory/Harmonic/Defs.lean, `H_n = 1 + 1/2 + ⋯ + 1/n` in ℚ, with `H_0 = 0`). Power series and p-adics: PowerSeries.mk, PowerSeries.derivative, PowerSeries.exp, PowerSeries.subst, PowerSeries.substInv, `Padic`, padicValRat, `sub_one_mul_padicValNat_factorial`, HasSum.

### From Tau Ceti at the pin

`TauCeti.Hodge.tate` and `TauCeti.Hodge.tate_F` (`TauCeti/Geometry/Hodge/Tate/Basic.lean`): the Tate Hodge structure ℤ(m) of weight −2m and type (−m, −m), whose lattice map is the inclusion ℤ → ℂ — not a geometric 2πi comparison; the geometric scalar is PS.0.5. `TauCeti.TensorWords.of` and `TauCeti.TensorWords.deconcatenation` (`TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean`): tensor words including degree zero, with deconcatenation over all cuts including the two outer ones; this is not the shuffle product. In Tau Ceti at the pin, `TauCeti.IntegralLattice.form_ofGramMatrix_basisFun_apply` (TauCeti/LinearAlgebra/IntegralLattice/StandardCoordinates.lean, line 53) gives the Gram-matrix coordinates used for the quartic lattice.

### TauCetiRoadmap EllipticCurves, Layers 1, 2, 4, 6, 7

Layer 1: the invariant differential, its pullback and the equation-level normalization (PS.0.5). Layer 2: the Tate module and the Weil pairing for the realization h¹(E)(1) (PS.6.3). Layer 4: the reduction map, component groups and local Tamagawa numbers for the minimal model and differential (PS.4.3). Layer 6: the canonical height pairing, its nondegeneracy and the Mordell–Weil regulator with basis independence (PS.6.3). Layer 7: Selmer and Sha carriers and, as a stretch milestone of that layer, the BSD quotient over ℚ defined under finiteness of Sha, with the real period of the global minimal equation counting both real components (PS.6.3). No complex uniformization and no number-field extension of Layer 7 is assumed.

### TauCetiRoadmap PadicMeasuresIwasawaAlgebras, Layer 5

§5.1: projectiveDeterminant, `detLine` with detLine_quasiIso, detLine_shortExact, detLine_baseChange, `detLine_dual`, detLine_shift, `detLine_acyclic`, the cone presentation, and the rational trivialization with its characteristic divisor, over commutative rings. Used here over fields, discrete valuation rings and commutative orders (PS.0.1, PS.0.4, PS.3.1, PS.4.1, PS.4.2). For noncommutative orders the relative class of a perfect complex with a real trivialization is built in PS.5.1 from GeneralAlgebraicKTheory.

### TauCetiRoadmap ClassicalArithmeticCompletion, §7.10 and §7.60

The reduced norm of a semisimple number-field algebra with its splitting, multiplicativity and base change (§7.10), and the local and global reduced-norm images: positive elements at the real places where a component ramifies, everything at finite places (§7.60). Used for the extended boundary of PS.5.1.

### From TauCetiRoadmap.IntegralLattices, Layers 5–6

The completed foundational Layers 1–5 supply rational-ambient integral lattices, duals, discriminant forms and overlattice gluing. The active roadmap's Layer 5 milestones 5G–5H supply existence and uniqueness of primitive embeddings into even unimodular lattices; Layer 6 milestone 6A classifies indefinite unimodular lattices by parity and signature. PS.8.4 uses the sufficient uniqueness range with both signature differences positive and complement rank at least the discriminant-group length plus two. The half-norm discriminant convention is transported with the supplied gluing maps.

### From TauCetiRoadmap.K3Surfaces, K1–K2

K1 supplies Hodge numbers and the first-Chern/exponential-sequence comparison; K2 supplies torsion-freeness of the actual integral Betti H² of a complex K3 surface and its even unimodular cup form of signature (3,19), with pullback and complex orientation. PS.8.4 consumes this geometric statement before applying IntegralLattices 5G–5H and 6A.

### From TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness, §§3.1, 4.2

Section 3.1 supplies the integral geometric étale ranks (1,0,22,0,1), the perfect cup-trace pairing and the comparison with integral singular cohomology over ℂ. Section 4.2 supplies the Picard lattice realization. K3Surfaces K1–K2 supplies the singular cup lattice, Hodge numbers and the first-Chern identification with integral (1,1)-classes; its saturated image also follows from the exponential sequence because H²(O) is torsion-free as an abelian group. These are the geometric inputs of PS.8.4.

### TauCetiRoadmap SchemeAndStackFoundations, §§1.17, 1.23, 4.11

Categorical and geometric quotients, coarse spaces of finite group quotients (`finite_quotient_coarse`), and modifications with strict transforms. For blow-ups §4.11 imports TauCetiRoadmap StableReduction Layer 4 (Rees algebra, relative Proj, affine charts and flat base change). Used for the quotient and resolution of PS.8.1; the resolution of the six A₃ sections is explicit and belongs to PS.8.1.

### MotivesAndAlgebraicCycles Layer 1, MC.2 and Layers 3–6

MC.2 supplies tensor-compatible geometric realization functors for motives with rational coefficients, including the finite-group actions and cycle maps for PS.8; a ℚ-algebra map E → End(M) makes the realizations E-modules (PS.0.1). Layer 1 supplies Chow motives with their projectors and §6.10 the equivalence of Artin motives with rational Galois representations; PS.1.5 builds the character motive A_χ from them with Deligne's construction M ⊗_ℚ E. Layers 3–4 supply Tannakian categories and Tate-stabilized geometric motives. §5.7 supplies the relative de Rham comparison for arbitrary finite-type pairs, with hypercover independence, excision, triple boundaries and products. §§6.7–6.9 supply P = P_eff[L⁻¹], its tensor-isomorphism torsor and the marked evaluation per : P → ℂ with per(L) = 2πi. PS.2 compares this β-point with PS.0's I = β⁻¹; it does not construct a second evaluation.

### From TauCetiRoadmap.MotivicEtaleKTheory, §§2.2–2.4

For smooth quasi-projective schemes over a field and nonnegative K-degree and weight, §§2.2–2.3 identify the rational simultaneous Adams-weight summand of Quillen K-theory with higher Chow motivic cohomology. Section 2.4 supplies products and degree-zero normalization; §2.3 transports localization boundaries. PS.3.0 composes these maps with MotivesAndAlgebraicCycles §§4.17–4.19 to obtain the number-field Tate-Hom comparison. Negative weights use the latter's Tate-Hom vanishing, not a negative-degree application of the higher Chern character.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero, §§6.1–6.2

Projective closure and smooth projective SNC compactification for smooth quasi-projective varieties over every characteristic-zero field, preserving the given open variety. PS.1.6 uses these inputs for its Kuga–Sato construction; no chosen compactification is called canonical.

### ComplexComparisonPartII C5

C5.1 (the ordinary comparison, proper smooth de Rham–Betti comparison and the multiplicative period interface), C5.2 (families and the Gauss–Manin connection), C5.6 (regular singular comparison), C5.7 (curves and residue localization). PS.0.5 constructs its particular second-kind class using the curve residue sequence, then computes the homology basis and pairing; it requests no elliptic uniformization theorem.

### ArithmeticKTheory §§3.3–3.4

§3.3 rationalSIntegerEquiv: for every number field F, finite S and n ≥ 2, the rationalization of the actual inclusion K_n(O_F) → K_n(O_(F,S)) is an equivalence, with the identity at S = ∅ and the comparison toField with rationalized field K-theory. §3.4 borel_rank_order and the rank function ρ: for n ≥ 2 the rank of K_n(O_F) is r₁ + r₂ for n ≡ 1 mod 4, r₂ for n ≡ 3 mod 4 and zero in even degrees, and K_(2i)(F) is torsion for i ≥ 1. That section owns the stable comparison of arithmetic cohomology with relative Lie algebra cohomology and the primitive-homology identification behind these ranks. Used by PS.3.2a, PS.9.8 and PS.9.9.

### BorelRegulators §§2.1–2.3, 6.0a–6.3

For every number field F and n ≥ 2 (here written j), §§2.1–2.2 construct the Chern-normalized Borel regulator r_Bo : K_(2n−1)(O_F) → V_n(F), into the conjugation-fixed space of functions on the complex embeddings with values in (2πi)^(n−1)ℝ, together with its rational extension to K_(2n−1)(F) ⊗ ℚ through the localization inverse; §2.3 proves that its real scalar extension is an isomorphism, that its integral kernel is the torsion and that it commutes with restriction and transfer. §6.1 identifies V_n(F) with H¹_D(Spec(F) ×_ℚ ℝ, ℝ(n)) by P_(n−1)(z) = (z + (−1)^(n−1) z̄)/2; §§6.0a–6.2 prove r_Bo = −2·r_Be for the shared universal Beilinson regulator r_Be with that roadmap's point coordinate, so that the ordered determinants differ by (−2)^(d_n), d_n = r₁ + r₂ for odd n and r₂ for even n, while Burgos's own evaluation is the negative of the shared coordinate and gives the factor +2 (Burgos, Theorem 10.9, printed pp. 95–97). §6.3: ψ^a acts on K_(2n−1)(F) ⊗ ℚ by a^n for every integer a ≥ 1. Used by PS.3.2a and PS.9.9.

### ArithmeticGaloisRepresentations §§2.4–2.6, §3.3

The arithmetic Weil–Deligne adapter (2.4), local factors (2.5), monodromy filtration and purity (2.6), and Conductor.globalConductor and Conductor.primeToPConductor (3.3) supply the local data and the conductor away from the coefficient prime. Frobenius semisimplification is the parameter operation of SmoothRepresentationsOfLocalGroups SR.5.2. PS.1.1 assembles the all-place conductor from strict compatibility and adds the discriminant factor. When a compatible automorphic realization is given, its local-parameter comparison is AutomorphicLFunctionsAndLocalFactors AL.4; it is not a Layer 3 theorem of ArithmeticGaloisRepresentations.

### SmallRamificationAndAbelianVarietyBaseCases §5.0d and AutomorphicGaloisRepresentationsPartII AG2.P

SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies `AutomorphicSystemData` for rank n ≥ 1 over every number field, including the finite realization fields L_λ/E_λ without descent to E_λ, geometric Frobenius and HT(χ_cyc)=−1. AutomorphicGaloisRepresentationsPartII AG2.P, ‘Arbitrary-rank compatible data and operations’, supplies `Weak` and `Strict` on this carrier: Strict includes the common Frobenius-semisimple WD parameter with N at all finite places, including coefficient-prime comparison via D_pst. Purity is separate. PS.1 uses these predicates; it introduces no alternative system carrier.

### PotentialModularityAndCompatibleSystems §§1.6–1.7, 1.15

Section 1.6's away-coefficient strictness compares WD parameters only for v∤ℓ; all-place Strict above implies it. Section 1.7 supplies `rankZeroSystem`, its operations and coefficient/restriction transport, with zero members, empty Hodge multisets and L-factors 1. Section 1.15 supplies `partialLFunction`, `lFunction`, `partialLFunction_converges`, `partialLFunction_eq_of_lambda` and `completedLFunction` on its regular pure scope. PS.1.1 uses the first two as the underlying finite functions and proves their equality with motivic determinant factors; it identifies the zero-motive realization with §1.7's extension. PS.1.2 identifies the regular completion only when its real-place multiplicities agree with the geometric Hodge blocks: at real places the rank is even or congruent to 1 modulo 4; with no real places there is no rank restriction. The shared completion remains owned by §1.15. PS.1.2 constructs the motivic factors for every Hodge multiplicity and both Gamma normalizations, with their trace-based real-place comparison.

### AutomorphicLFunctionsAndLocalFactors AL.1, AL.3, AL.4, AL.5

AL.1: local normal forms and archimedean theory, canonical archimedean factors, local epsilon factors and Gauss sums, global completed Hecke L-functions and their functional equation (PS.1). AL.3: the Rankin–Selberg L-function of GL_n × GL_m with its duality, epsilon factor and functional equation, specialized in PS.6.6 to the conjugate self-dual GL_even × GL_odd pairs with central point 1/2; the motivic twist is specified in PS.6.6. AL.4: Weil–Deligne normalization and local parameter comparison (PS.1.1). AL.5: imprimitive functions, finite Euler corrections and leading terms, and the critical-value and sign interfaces (PS.1.5, PS.1.6, PS.4.3, PS.7.2).

### EllipticIntegrals Milestones 1 and 3

Milestone 1 supplies `TauCeti.Real.legendreK` and `TauCeti.Real.legendreEc` with modulus k, their algebraic forms and integrability at the algebraic endpoint for k²<1. Milestone 3 supplies Legendre's relation for 0<k<1 with complementary modulus √(1−k²). PS.7.1's local `legendreK` is only the parameter-form signature adapter K_λ; on 0≤λ<1 prove K_λ = Tau Ceti's modulus function at √λ. No comparison with that total function is asserted at λ<0 or λ≥1. PS.1.6 and PS.0.5 use the same modulus 1/√2 for the first and second kind integrals.

### ModularSymbolsPadicLFunctions §§1.1–1.2

The signed rational period lines and saturated integral periods of §1.1, and the twisted Mellin formula of §1.2, give critical-value algebraicity for forms of weight κ+2 and 0 ≤ j ≤ κ (κ is that roadmap's k). With its sign ε_(j,χ) = (−1)^(κ−j)χ(−1), the algebraic value is τ(χ)·j!·L(f,χ̄,j+1)/((−2πi)^j Ω_f^ε), and its period symbol includes the factor 2πi of f dq/q. PS.1.6 uses the untwisted case and matches Ω_f^ε, with j = m − 1, against (2πi)·c^((−1)^m)(M_f), not against c^ε(M_f); L/Ω alone is not asserted algebraic.

### NeronModelsAndSemistableAbelianVarieties Layer 6, §6.10

§6.10 StrictCompatibleSystemExport states BCGP Proposition 2.8.1 for every H^i(A), 0 ≤ i ≤ 2g: the representations form a strictly compatible system defined over ℚ, pure of weight i, at every place including those above the coefficient prime, with the coefficient-prime trace comparison and Saito's base-change argument built in that section (PS.1.8). Hodge and infinity realizations are the geometric realizations of MC.2.

### WeilConjectures WC.1, WC.2

WC.1: the cohomological determinant comparison for point counts (PS.1.8). WC.2: the finite-field signed functional equation, with its pairing imported from EtaleDualityAndPerverseSheaves. Number-field geometric duality is consumed directly from the latter owner.

### EtaleDualityAndPerverseSheaves Layer 0, §§0.5–0.6

The targets adicAndRationalPoincareDuality and `galoisFrobeniusEquivariance` supply the perfect pairing H^i(A_F̄) × `H^{2g−i}(A_F̄)(g)` → ℚ_ℓ and its Galois equivariance. MotivesAndAlgebraicCycles MC.2 transports the geometric duality through its realization functors and comparisons to the de Rham, Betti and infinity realizations (PS.1.8). The pairing is on geometric cohomology; absolute Galois cohomology over F is not substituted for it.

### DirichletPadicLFunctions L0

Layer 0 (0.4 generalized Bernoulli comparison and conductors): normalized complex special values in a complex embedding, with its endpoint convention (PS.1.5, PS.7.2).

### NoncommutativeAndEquivariantIwasawa §§2.7, F.3, 7.9

§2.7 supplies noncommutativeDeterminant, Deligne's virtual-object Picard groupoid V(R) for finite projective R-modules and its universal determinant functor on perfect complexes: quasi-isomorphism invariance, exact-sequence additivity, acyclic trivializations, shift inversion, perfect-cohomology formulas and base change. Over commutative R there is a determinant-line functor to PadicMeasuresIwasawaAlgebras §5.1; this is not an equivalence for arbitrary R. §F.3 supplies ordinary-real compact support, its comparison triangle with the Tate-modified duality complex, and the real-invariant determinant factor at odd p. Section 7.9 supplies the rational Fukaya–Kato fundamental object and its period-regulator data for this ordinary-real complex. PS.3 uses its inverse Burns–Flach orientation and PS.4 constructs the integral pullback only when its stated comparisons and perfectness hypotheses hold.

### ArithmeticGaloisDuality D7

D7.1 (derived tensor and Tor), D7.3 (cohomological finiteness and perfect amplitude), D7.5 (Tate-modified compact-support cochains for duality, with finite S containing the places above p and the archimedean places, and the real complete Tate cochains at 2). The ordinary-real determinant model is imported separately from NoncommutativeAndEquivariantIwasawa §F.3 (PS.4).

### SelmerIwasawaCohomology L2–L4

L2: compact and rational Galois Selmer groups (2.9), Selmer complexes as mapping fibres (2.21), condition-change triangles (2.23) and lattice changes (2.24). L3: the determinant line of a Selmer complex and its characteristic divisor (3.14), in the inverse-line orientation. L4: small-weight crystalline realization and extension exactness (4.7), the Bloch–Kato local condition (4.9), global finite Selmer reductions and conjugation (4.24), and uniform local annihilation away from p (4.25). §§4.24–4.25 supply the conjugate finite-condition and uniform local torsion controls used in the LTXZZ annihilator argument; they do not prove its arithmetic level-raising theorems.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P3, R07.P5

The fundamental period sequences with continuous sections (R07.P3) and the crystalline and de Rham realization data (R07.P5) are the period-module inputs of PS.6.1, PS.6.2 and PS.6.5. SelmerIwasawaCohomology §§4.7, 4.9 provides their small-weight realization and finite local condition, with its stated weight and coefficient hypotheses. The rational exponential has target H¹_f(ℚ_p,V_p); its lift into integral local points is used only on a sufficiently small open neighborhood of zero, with Haar measure defined by restriction and translation.

### AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6

AG2.5's relevant conjugate-self-dual specialization (LTXZZ Proposition 3.2.4), and AG2.6 ‘Strong coefficient field’, ‘Uniform strong realization of polarized systems’, and coefficient base change. These supply the normalized Galois systems and a single finite strong field at all coefficient places. Taking a common finite extension for the two systems gives the E of PS.6.6. The different embeddings inducing one place use their respective completed scalar maps; their representations are semilinear conjugates, not automatically linearly identical. No canonical bases, minimal strong field, or admissibility at every λ is inferred.

### GeneralAlgebraicKTheory, Layer 4

§4.15 relative triples for an additive functor, §4.16 the stable automorphism boundary, §4.17 the five-term sequence, and §6.19 gilletWaldhausen_general for bounded perfect-complex comparison, and §12.11 for vanishing of negative K-groups of regular noetherian rings of finite global dimension. These supply the relative groups and their maps, not a determinant Picard category.

### IntegralHeckeAndGaloisDeterminants, §0.6

The Azumaya reduced-norm determinant law, the unique degree-d determinant law that becomes `Matrix.det` under every faithfully flat matrix splitting, with duals and projective modules (PS.5.1).

### NoncommutativeAndEquivariantIwasawa NE.7

NE.7.9 the Fukaya–Kato global zeta isomorphism for ordinary-real support (as a predicate), NE.7.13 the interpolation formula for the Tate motive (BV Theorem 5.5), NE.7.14 its version for ℚ-valued characters under Leopoldt, NE.7.15 the local epsilon isomorphism. The nodes fukaya-kato-zeta-isomorphism, `tate-motive-interpolation` and `tate-motive-interpolation-rational` include the shifted complex C′ = RΓ_c,ord[1] with d(C′) ≅ d(RΓ_c,ord)⁻¹, the transported map a = ζ : 1 → d(C′), its Bockstein trivialization, order −m, relative boundary +[RΓ_c,ord] and normalization `c_γ^{−m},` and the normalized BV Theorem 5.5 and Corollary 5.7 (ℚ-valued characters) with all arithmetic hypotheses and the nonvanishing-regulator premise (PS.5.3, PS.5.4).

### IntegralIwasawaTheory Layer 11

§11.7 integralDeterminantMainConjecture: for every prime p, every totally real field k, every finite totally real abelian extension F/k, and every finite S containing S_∞ ∪ S_p ∪ S_ram, the inverse determinant of the Iwasawa complex of F_∞ over S is generated by the equivariant p-adic L-function, as invertible fractional lattices with the canonical acyclic trivialization; §11.1 transports the CM minus part to the totally real order. This is the Iwasawa-theoretic input of the abelian Tate case abelianTate_ETNC of PS.5.4. The descent from it to the finite-level equivariant Tamagawa number conjecture is not stated there and is part of PS.5.4.

### CrystallineCohomology CR.3, CR.5–CR.7

CR.3: crystalline cup products; CR.7: crystalline cohomology of proper smooth schemes with coefficients and horizontal Frobenius; CR.5: logarithmic structures and log-crystalline realization; CR.6: Hyodo–Kato complexes and the semistable comparison. CR.6.3 states **Proper one-parameter logarithmic comparison**, with the finite-level PD Poincaré map, the signed dlog-parameter triangle and the proper-cohomology inverse limit. Use it for the special fibre of the model in PS.8.17; the relative log extension and its punctured restriction are separate targets there. It does not assert torsion-freeness of the family’s integral cohomology. CR.7's finite-projectivity and base-change hypotheses must be proved for the chosen family, not inferred just from smoothness.

### PadicDifferentialEquationsAndRigidCohomology RD.1, RD.3–RD.5 and RD.7

RD.1.46 the Dwork exponential connection and its Frobenius structure, RD.1.63 Artin–Hasse integrality (PS.8.14, PS.8.15); RD.3 overconvergent F-isocrystals and frames (PS.8.17). RD.4.24 is the affine Monsky–Washnitzer comparison, RD.4.29 the smooth liftable Gysin comparison, RD.4.36–RD.4.38 the tube-to-completed-PD-envelope map and rational smooth-proper rigid–crystalline comparison, and RD.7.1 its Frobenius compatibility. RD.5.115 supplies the proper smooth relative overconvergent direct image only for a proper smooth formal lift with compatible compactifications, including fibrewise base change and Frobenius. RD.5.107–RD.5.109 supply relative log convergent sites, log-crystalline perfectness and derived base change for proper log smooth integral morphisms, and the relative convergent–crystalline comparison. PS.8.17 verifies these geometric hypotheses and constructs the quintic-specific relative log extension and its identification with that direct image. RD.7.10 distinguishes a comparison of de Rham vector spaces from the identification of a chosen Frobenius: PS.8.17 identifies Dwork's normalized operator of PS.8.14 with the geometric Frobenius through the uniqueness of Frobenius structures on the irreducible Picard–Fuchs module.

### ModularCurvesPartII §3.6

§3.6 supplies the Tate cusp with j(q) = q⁻¹ + 744 + ⋯. TauCetiRoadmap ModularForms Layer 0 supplies the analytic invariant j = E₄³/Δ and its q-expansion. PS.8.10 owns the Schwarzian identity and the comparison used in its modular relation; no Schwarzian theorem is attributed to the formal-cusp construction.

### PolylogarithmFunctions

The principal classical polylogarithm Li_n, equal to its series on the open unit disc (PS.9.3).

### ColemanIntegration L1.12 and AnabelianGeometryAndNonabelianChabauty NC.2

ColemanIntegration L1.12 supplies `WordAlgebra`, its word basis, shuffle multiplication with multiplicities, associativity, commutativity, length filtration and coefficient base change. For the pure two-letter algebra use A=ℚ, Ω=0 and zero forms and derivation; for iterated integrals use the given differential forms. AnabelianGeometryAndNonabelianChabauty §2.0 ‘Word algebra and shuffle coordinates’ supplies `wordShuffleDuality`, its all-cut deconcatenation and finite-word/augmentation-quotient pairing; §2.4 uses precisely the finite coefficient subcoalgebras. Layer NC.2 supplies the generic unipotent de Rham and étale groupoid (PS.9.10). PS.9.2 transports the two-letter basis through Bool≃Fin 2 and constructs only the index-specific subalgebras and stuffle structure.

## How to read the build

Layers follow proof order. PS.0 fixes periods; PS.1 the L-function side and critical values; PS.2 the evaluation of formal periods. PS.3–PS.6 run the arithmetic route from rational fundamental lines through integral lattices and equivariant statements to Bloch–Kato and BSD. PS.7 proves analytic error bounds and normalization laws and isolates the conjectural predicates. PS.8 and PS.9 are the two case studies; PS.8 uses the comparison direction of PS.0, and PS.9 uses the evaluation of PS.2 for numerical spanning. Within a layer, subsections are in proof order. README.md specifies every target. Suggested.lean states the statable headline theorems and only their necessary simple definitions; its `sorry` proofs specify goals and certify nothing.

## Layer PS.0: comparison spaces and period lines

This layer fixes what a period is. It takes the Betti and de Rham realizations of a motive and their comparison from their owners, and produces the basis-free determinant of the comparison, the eigenspaces of the geometric infinity involution, the period class modulo the coefficient field, and Deligne's plus and minus periods. It ends with the two examples that pin every convention: the Tate motive and an explicit elliptic curve.

### PS.0.1 The comparison determinant line

Let M be a motive over ℚ with coefficients in a number field E in Deligne's sense: a motive of MotivesAndAlgebraicCycles, which has rational coefficients, together with a ℚ-algebra map E → End(M) (Deligne, §2.1(A), p. 9). Its Betti realization B and de Rham realization D, supplied by MotivesAndAlgebraicCycles MC.2 together with the comparison of ComplexComparisonPartII C5, are E-modules by functoriality; they are finite free because E is a field, and of the same rank d because the comparison gives dim_ℚ B = dim_ℚ D. Integration of de Rham classes over cycles is an isomorphism β : D ⊗ ℂ → B ⊗ ℂ; Deligne's comparison is its inverse I = β⁻¹. Define comparisonPeriod M to be det I, a nonzero element of the complex line Hom(det B, det D) ⊗ ℂ. In ordered bases (b_j) of B and (d_i) of D write comparisonMatrix for the column-coordinate matrix P of I. Replacing the Betti basis b by bA and the de Rham basis d by dC changes the matrix to P′ = C⁻¹ P A, so det P′ = det(C)⁻¹ · det P · det A (Deligne, §0.4, p. 4, and §5.1, pp. 15–16, of the English translation).

The comparison is the geometric one. Nothing here produces realizations from an arbitrary pair of vector spaces of equal dimension; extension to an admitted motive or projector is part of the realization comparison that MC.2 supplies. When all coefficient embeddings are recorded at once, use E ⊗_ℚ ℂ in place of ℂ; a coordinate matrix always refers to one embedding σ : E → ℂ.

To prove the transformation law, invert β (never call integration itself I), apply the determinant line of a finite free module (TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1, which over a field is the top exterior power) to I, and compute coordinates with Mathlib `Matrix.det` and `Matrix.det_mul`. Base change along σ is checked against the comparison functors; a chosen coordinate is not a canonical integral generator.

The interface includes the following facts.

- The matrix of I in given ordered bases.
- The basis-free element of Hom(det B, det D) ⊗ ℂ.
- Basis change gives P′ = C⁻¹PA and det P′ = det(C)⁻¹ det P det A.
- Scalar extension along σ gives the σ-component of the E ⊗ ℂ comparison.
- A block sum goes to the tensor product of determinants, with the grading and ordering of the determinant functor.

**Checks.**

- Rank zero: the comparison period is 1, not 0 (the determinant of the empty matrix is 1, Mathlib `Matrix.det_fin_zero`).
- Rank one with I(z) = αz: the coordinate is α; replacing the Betti basis b by 2b multiplies the coordinate by 2, and replacing the de Rham basis d by 2d divides it by 2. A definition that used P′ = A⁻¹ P C reverses both factors and fails.
- For H¹(𝔾_m) with integration matrix [2πi], the matrix of I is [(2πi)⁻¹]; a definition that takes the integration matrix itself gives the inverse and fails.

*Needs:* MotivesAndAlgebraicCycles MC.2 (realization equivalence); ComplexComparisonPartII C5 (proper smooth de Rham–Betti comparison and the multiplicative period interface); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; Mathlib `Matrix.det`, `Matrix.det_mul`, `Matrix.det_fin_zero`.

### PS.0.2 The real comparison and the infinity involution

For a motive over ℚ (more generally, over a field with a real embedding, at that embedding) the geometric infinity involution F∞ : B → B is E-linear, satisfies F∞² = 1 and sends `H^{p,q}` to `H^{q,p}.` After scalar extension, I intertwines F∞ ⊗ (complex conjugation) on B ⊗ ℂ with the real structure of D ⊗ ℂ coming from D (Deligne, §0.2.5, p. 3, and Proposition 1.4, p. 7). Since 2 is invertible in E, B = B⁺ ⊕ B⁻ with projections (1 ± F∞)/2; write d^± = dim_E B^±.

The canonical semilinear conjugation of the lattice of a Hodge structure (Tau Ceti `TauCeti.Hodge.latticeConj` on the Tate structures) is a different operator from F∞ and is never substituted for it.

To prove this, import naturality of the comparison under the real embedding from MC.2 and C5, apply Deligne Proposition 1.4 to I, and diagonalize the involution.

The interface includes the following facts.

- F∞ as an E-linear involution of B.
- The geometric infinity involution squares to the identity.
- The eigenspaces, as images of (1 ± F∞)/2.
- The direct-sum decomposition.
- F∞ exchanges `H^{p,q}` and `H^{q,p}.`

**Checks.**

- On ℚ(1), F∞ = −1, although the lattice real structure of the Tate Hodge structure fixes the integers; a definition that used the lattice conjugation gives +1 and fails.
- A swapped pair `H^{p,q}` ⊕ `H^{q,p}` with p ≠ q contributes exactly one dimension to B⁺ and one to B⁻.
- On ℚ(0), F∞ = 1, so d⁺ = 1 and d⁻ = 0.

*Needs:* Layer PS.0.1; MotivesAndAlgebraicCycles MC.2 (classical Weil cohomology realizations); ComplexComparisonPartII C5.

### PS.0.3 The period class modulo the coefficient field

For the comparison line of M with coefficient field E, define the period class of M as the class of the comparison coordinate in (E ⊗_ℚ ℂ)^× / E^×, where u ∈ E^× acts through all embeddings simultaneously, diagonally. Its image in a selected component is a class in ℂ^× / σ(E^×). Equality of two period classes says that one element of E^× relates the two nonzero periods; it is not an equality of complex numbers and not an equality of integral generators (Deligne, §2.6, p. 11, and Conjecture 2.8, p. 12).

The input is a trivialization of each E-determinant line together with the comparison of PS.0.1. The class is basis-independent because changing E-bases multiplies the coordinate by det(A)/det(C) ∈ E^× (PS.0.1). Transport along coefficient embeddings uses one element of E, never independently chosen algebraic factors at different embeddings.

The interface includes the following facts.

- A nonzero coordinate tuple determines a class.
- Two tuples have the same class if and only if their ratio is the diagonal image of one u ∈ E^×.
- A simultaneous coefficient-field basis change preserves the period class.
- Tensoring comparison lines multiplies classes.
- Evaluation at σ descends to ℂ^× / σ(E^×).
- The class of the constant tuple 1 is the identity.
- Dualizing inverts the period class. On one embedding, equivalence is ∃u∈E^×, α=σ(u)β.

**Checks.**

- For E = ℚ and α ≠ 0, the periods 2α and α have the same class but are different numbers.
- Zero is not a representative: the class is defined on nonzero coordinates only.
- For E = ℚ(√2) with its two real embeddings, the tuples (√2, −√2) and (1, 1) have the same class (u = √2), while (√2, √2) and (1, 1) do not: no single u ∈ E^× has σ₁(u) = σ₂(u) = √2. A definition with independent factors at each embedding identifies them and fails.
- In one embedding, i and 1 are not ℚ-equivalent (no rational unit maps 1 to i), while 2 and 1 are.

*Needs:* Layer PS.0.1.

### PS.0.4 Deligne's plus and minus periods

Let M be pure of weight w and suppose that, if the middle Hodge summand `H^{w/2,w/2}` is nonzero, F∞ acts on it by a scalar. Deligne's §1.7 then provides filtration steps F⁺ and F⁻ of the Hodge filtration on D with dim D/F^∓ = d^±. Put D^± = D/F^∓. Define the plus and minus periods c^±(M) = det(I^±), where I^± : B^± ⊗ ℂ → D^± ⊗ ℂ is the composite of I with the inclusion of B^± and the projection to D^±, whenever I^± is an isomorphism; c^±(M) is a nonzero element of Hom(det B^±, det D^±) ⊗ ℂ, and hence a period class as in PS.0.3. Record δ(M) = det I separately. A sign part of dimension zero has period 1 (Deligne, §§1.5–1.7, p. 8; §2.6, p. 11; (5.1.8), p. 16).

Two hypotheses are part of the definition: the filtration cuts exist with the stated dimensions, and the induced maps I^± are isomorphisms. Equality of dimensions alone does not suffice. The definition here uses these explicit hypotheses. PS.1.3 proves their existence for critical twists from Deligne's Hodge criterion.

To prove this, form the E-linear eigenspaces with PS.0.2, apply the explicitly given filtration quotient isomorphisms, then take determinants with the conventions of PS.0.1 and PS.0.3.

The interface includes the following facts.

- The determinants of I^±, with their source and target lines.
- The specified isomorphism I^± on each sign part.
- The full determinant period is δ(M)=det I.
- For every integer n, c^±(M) = `(2πi)^{−n·d^±(M)}` · `c^{±(−1)^n}(M(n))` as period classes.
- Each sign period changes by the determinant factors of its own E-bases.

**Checks.**

- For ℚ(0): c⁺ = 1, and the zero-dimensional c⁻ = 1.
- A twist by one exchanges the plus and minus dimensions, d^±(M(1)) = d^∓(M); a formula that ignores the sign swap fails already for ℚ(0) → ℚ(1).
- A noninvertible linear map between spaces of equal dimension is rejected as I^±; there is no period in that case.

*Needs:* Layers PS.0.2 and PS.0.3; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 (determinant lines).

### PS.0.5 The Tate and elliptic normalizations

Choose the counterclockwise loop on 𝔾_m and the form dz/z. Integration on ℚ(−1) = H¹(𝔾_m) is 2πi, so Deligne's comparison has δ(ℚ(n)) = (2πi)^n, F∞ acts on ℚ(n) by (−1)^n, and ℚ(n) has Hodge type (−n, −n) (Deligne, §3.1, pp. 13–14). The value (2πi)^n is the scalar of I on ℚ(n) in the chosen bases; the Tau Ceti Hodge structure `TauCeti.Hodge.tate` has the right type and filtration but its lattice map is the ordinary inclusion ℤ → ℂ, so the geometric scalar is supplied separately, here.

For an elliptic curve over ℝ with an oriented integral homology basis γ₁, γ₂ and an algebraic de Rham basis ω, η, write the integration matrix with rows indexed by cycles and columns by forms, B = `(∫_{γ_i}` ω_j). Use the Betti cohomology basis dual to γ₁, γ₂. Evaluating β(ω_j) on γ_i gives B_ij, so in column coordinates β = B and I = B⁻¹. The all-components real Néron period is the number of real components times the positive integral over the identity component (Deligne, §4.1, p. 14); relating it to a primitive cycle in B⁺ requires the integral index at 2, not only a rational eigenspace.

Worked case: the curve y² = x(1−x)(1−x/2), with ω = dx/(2y) and η = xω. Let γ_a run over [0,1] with y > 0 and return on the other sheet, and let γ_b run over [1,2] with y = −i√(x(x−1)(1−x/2)) and return on the other sheet. Use EllipticIntegrals Milestone 1 at modulus k=1/√2: K = TauCeti.Real.legendreK(k) = ∫₀¹ dt/√((1−t²)(1−t²/2)). Put J = ∫₀¹ t² dt/√((1−t²)(1−t²/2)) and H = ∫₁² x dx/(2√(x(x−1)(1−x/2))). Then B = [[2K, 2J], [2iK, 2iH]], using the positive-imaginary orientation of γ_b and the complementary-modulus identity at λ = 1/2; with a = 2K, b = 2J, c = 2iK, d = 2iH, the comparison is I = (ad − bc)⁻¹ [[d, −b], [−c, a]]. This equality is exact; no numerical approximation enters.

The algebraic elliptic curve and its invariant differential are TauCetiRoadmap EllipticCurves Layer 1. Construct ellipticSecondKindClass in proper H¹_dR as follows. On the affine complement of infinity η is regular. At infinity the uniformizer s=x/y gives x=2s⁻²+3+O(s²), ω=−(1+O(s²))ds, and η=−2s⁻²ds+O(1)ds. Thus η has no residue and has local polar primitive 2/s. The C5.7 residue exact sequence makes its affine class the image of a unique proper class. Equivalently use the Čech de Rham representative with that local primitive; η is not a global regular one-form on the proper curve. This is the second-kind construction of HMS-book Theorem 14.5.3, Corollary 14.5.4 and Theorem 14.5.6, pp.277–279; Examples 14.5.7, p.279, identify x dx/y as the elliptic example. The factor 1/2 in our differential is retained throughout.

Construct ellipticOvalBasis from the double cover of the x-sphere branched at 0,1,2,∞. Cut along [0,1] and [2,∞] and glue two slit spheres crosswise. The result is a torus. The lifts of the adjacent intervals [0,1] and [1,2] are closed cycles; perturb their meeting at the branch point 1 in its square-root chart. They meet transversely once, with sign fixed by the stated sheet orientations. A unimodular alternating intersection matrix on a rank-two torus lattice proves that these two cycles form an integral basis, rather than a sublattice of unknown index. The covering-cell calculation is the proof of this particular basis; no complex uniformization theorem is imported.

For ellipticIntegrationPairing, apply C5.1 proper smooth comparison and evaluate on these cycles, which avoid the only pole of η. The zero residue makes integration independent of the representative and of moving a cycle across a punctured neighborhood of infinity. The substitutions below give the displayed B. They also prove nonsingularity directly: after x=1/(1−u²/2),

```text
H = ∫₀¹ du / ((1−u²/2)√((1−u²)(1−u²/2))),
0 < J < K < H,
det B = 4i K(H−J) ≠ 0.
```

All endpoint singularities are of integrable square-root type. The strict inequalities follow on the open interval by comparing the positive integrands. The two proper classes [ω],[η] are therefore independent under comparison; the same torus calculation gives dim H¹_dR=2, so they are a basis. This establishes the second-kind class, both bases and the nondegenerate integration pairing before B is inverted.

To prove this, evaluate dz/z on the loop and invert; use the existing Tate Hodge type for (−n, −n); form the elliptic matrix with cycles as rows and forms as columns and invert using the Betti basis dual to the cycles; for the displayed curve substitute x = t² on γ_a and x = 1/(1 − u²/2) on half of γ_b, which turns the second integral into K, and evaluate η on the same paths to get J and H.

The interface includes the following facts.

- The scalar (2πi)^n.
- Tensoring ℚ(m) and ℚ(n) multiplies their scalars: (2πi)^(m+n)=(2πi)^m(2πi)^n.
- F∞ = (−1)^n on ℚ(n).
- The unique proper lift of [xω], compatible with the residue sequence and represented using the polar primitive.
- The two oriented integral cycles and their unimodular intersection pairing.
- The actual integrations and the resulting de Rham basis.
- The light scalar expression [[2K,2J],[2iK,2iH]] over ℂ.
- The determinant of the elliptic integration matrix is 4iK(H−J).
- B ↦ B⁻¹ on complex 2 × 2 matrices, used as a comparison only when det B ≠ 0.
- I = B⁻¹ for the row-cycle integration matrix in the dual Betti cohomology basis.
- All-components period = number of components × identity-component integral.

**Checks.**

- The infinity signs of ℚ(0), ℚ(1), ℚ(2) are respectively +1, −1, +1, so neither a constant sign nor parity shifted by one gives the right operator.
- ℚ(1) has I-period 2πi, ℚ(−1) has (2πi)⁻¹ and ℚ(0) has 1; the Tau Ceti filtration of `TauCeti.Hodge.tate 1` is the whole line in degree −1 and zero in degree 0.
- For B = [[1, 2], [0, 1]], B⁻¹ is [[1, −2], [0, 1]]; its (0, 1) entry is −2. Inverting Bᵀ instead gives entry 0 and fails evaluation on the dual cycle basis.
- For B = identity the comparison is identity; replacing B by diag(2, 1) gives diag(1/2, 1). A scalar matrix with a zero diagonal entry is excluded by det B ≠ 0.
- Two real components multiply the identity-component period by 2; replacing the cycles by an oriented sublattice of index 2 multiplies det B by 2 and divides det I by 2, because the Betti cohomology basis is dual to the cycles.
- The polar term of η is d(2/s), with zero residue; ds/s has residue 1 and cannot be lifted to proper H¹_dR by this construction. The zero affine class lifts to zero, and changing the polar primitive by a constant leaves the class unchanged.
- For the scalar matrix expression, K=1,J=0,H=2 gives determinant 8i, while K=1,J=H=1 gives determinant zero. The latter is permitted as scalar input but cannot represent the geometric bases. K=0 likewise fails nonsingularity; the geometric inequalities exclude both cases.
- Reversing either oval changes the corresponding row sign and intersection sign; it leaves invertibility intact. Doubling an oval gives intersection magnitude 2 and fails the integral-basis test.

*Needs:* Layer PS.0.4; EllipticIntegrals Milestone 1 (canonical K and its algebraic integral form); Tau Ceti `TauCeti.Hodge.tate`, `TauCeti.Hodge.tate_F`; TauCetiRoadmap EllipticCurves Layer 1; ComplexComparisonPartII C5 (proper de Rham–Betti comparison and curve residue localization); AlgebraicTopology Stage 6 (surface homology, intersection pairing and integral duality). The explicit slit-cover calculation and scalar integrations belong to this example.

### Examples

- The Tate scalars at n=0,1,−1 are 1,2πi,(2πi)⁻¹; tensor products multiply these scalars.
- For E = ℚ, the selected-component class of 2 equals that of 1, while that of πi does not.
- For ℚ(1): d⁺ = 0, d⁻ = 1, c⁻(ℚ(1)) = 2πi and δ(ℚ(1)) = 2πi; for ℚ(2): d⁺ = 1, c⁺(ℚ(2)) = (2πi)².

### Dependencies

MotivesAndAlgebraicCycles MC.2; ComplexComparisonPartII C5; AlgebraicTopology Stage 6; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; TauCetiRoadmap EllipticCurves Layer 1; EllipticIntegrals Milestone 1; Tau Ceti `TauCeti.Hodge.tate`; Mathlib `Matrix.det`.
## Layer PS.1: critical values and algebraicity statements

This layer identifies the shared finite Euler products with motivic local factors and extends the archimedean factors to general Hodge multiplicities in both conventions in use; it builds the critical integers and Deligne's normalized-value predicate. It proves the two adapters that turn imported analytic formulas into statements about Deligne periods (Dirichlet characters with Tate twists, and modular forms), and states the functional-equation predicates of Serre and of Hasse–Weil type that the modularity roadmaps consume.

### PS.1.1 The motivic Euler product of a compatible system

For positive rank use the supplied `AutomorphicSystemData` of SmallRamificationAndAbelianVarietyBaseCases §5.0d and the predicates `Weak` and all-place `Strict` of AutomorphicGaloisRepresentationsPartII AG2.P, ‘Arbitrary-rank compatible data and operations’. Retain the member's finite local realization field L_λ/E_λ and coefficient embedding: no descent to E_λ follows from E-valued good polynomials. Purity of weight w is an additional condition on the WD data. A geometric motive supplies its marked Hodge and infinity realizations as additional data (BCGP, §2.8, pp. 35–37). Identify the realization of a zero-rank motive with `rankZeroSystem` of PotentialModularityAndCompatibleSystems §1.7, preserving its coefficient and restriction transport: its representations are zero, its Hodge multisets empty, and every local polynomial and finite function is 1. This is the zero-motive adapter to the shared rank-zero extension.

Use PotentialModularityAndCompatibleSystems §1.15's partial and full finite functions as L_fin^S and L_fin on their common scope. Prove the equality adapter from its monic good polynomial Q_v(X) of degree d to the motivic polynomial P_v(T) = T^d Q_v(T⁻¹), interpreted as a polynomial identity (P_v(0)=1). Thus for q_v>1 and complex s,

```text
P_v(q_v^(−s))⁻¹ = q_v^(ds)/Q_v(q_v^s).
```

Here q_v^s = exp(s log q_v) is nonzero. On Re s > 1+w/2 purity makes the denominators nonzero. At every bad place use the same Frobenius-semisimple WD data, with P_v(T) = det(1−T Fr_v | (ker N_v)^(I_v)), Fr_v geometric, and retain its Euler factor. Prove equality of the full functions and compatibility under coefficient extension and embedding, first on that half-plane and then for agreeing meromorphic continuations. The supplier's away-coefficient strictness compares only v∤ℓ: use an auxiliary coefficient place away from v to define its factor. All-place Strict also compares that factor with D_pst at v|ℓ; away-coefficient strictness alone asserts no such equality.

For the all-place WD data define f(R) = ∏_v 𝔭_v^(a(WD_v(R))) and N(R) = |Disc(F)|^d Norm_(F/ℚ)(f(R)) ∈ ℤ_(>0). Compute each exponent with an auxiliary coefficient place away from v; all-place Strict identifies the coefficient-prime parameter as well. Unramified exponents vanish, so the ideal product is finite. This assembles all places and adds the discriminant to ArithmeticGaloisRepresentations §3.3's prime-to-ℓ conductor (Serre, §4.1, (26), printed p. 19-12). Continuation remains the separate analytic datum of PS.1.7 (Deligne, §§1.1–1.2, p. 6).

To prove the adapters, apply the reciprocal-polynomial identity and the identical WD factor at each bad place, then the supplied coefficient comparison and convergence theorem of PotentialModularityAndCompatibleSystems §1.15. No regularity hypothesis is used for finite-product convergence: the purity bound on ker N and comparison with the Dedekind zeta function give the same half-plane for repeated Hodge weights.

The interface includes the following facts.

- P_v with the stated Frobenius, inertia and monodromy conventions.
- Changing λ or the embedding gives the image of the same E-polynomial.
- Equality with the shared partial and full finite functions on the convergence half-plane, with the rank-zero value 1.
- L_fin^S = L_fin · `∏_{v ∈ S}` `P_v(q_v^{−s})` wherever both sides are defined.
- The positive global conductor, with its local and discriminant normalization.
- Comparison with the unramified local parameters of AutomorphicLFunctionsAndLocalFactors AL.4, only through a proved local Satake–Galois compatibility.

**Checks.**

- The unit motive over ℚ has P_p(T) = 1 − T for every p and finite L-function ζ(s) for Re s > 1 (Mathlib `riemannZeta_eulerProduct`).
- On a nontrivial two-dimensional Steinberg block, only the one-dimensional space (ker N)^I contributes, so P_v has degree one; a definition using the inertia invariants of the Weil–Deligne representation before imposing the monodromy kernel gives the wrong degree for a nonsplit extension.
- For Q_v(X)=X−1, P_v(T)=1−T; at q_v=2 and s=2 both local expressions are 4/3. For Q_v(X)=(X−1)² they are both 16/9, including the nonregular repeated-weight case. For d=0, Q_v=P_v=1 and both expressions are 1.
- Away-coefficient comparison at a fixed v gives the same P_v using any two auxiliary primes different from v; it supplies zero comparisons at v|ℓ. The all-place predicate adds precisely those coefficient-prime comparisons.
- Removing one good factor multiplies the finite L-function by `P_v(q_v^{−s});` it does not divide by it.
- The rank-one unit system over F = ℚ(i) has f = (1) and N = 4, whereas the unit system over ℚ has N = 1. Omitting the discriminant gives the wrong first value; the zero-rank system has N = 1 over either field.

*Needs:* SmallRamificationAndAbelianVarietyBaseCases §5.0d (raw carrier and operations); AutomorphicGaloisRepresentationsPartII AG2.P, ‘Arbitrary-rank compatible data and operations’ (Weak and all-place Strict); PotentialModularityAndCompatibleSystems §§1.6–1.7, 1.15 (away-coefficient strictness, the shared rank-zero extension and the common finite functions, coefficient comparison and convergence); ArithmeticGaloisRepresentations §§2.4–2.6, §3.3 (Weil–Deligne adapters, local factors, purity and conductors); SmoothRepresentationsOfLocalGroups SR.5.2 (Frobenius semisimplification); AutomorphicLFunctionsAndLocalFactors AL.1 (completed Hecke L-function) and AL.4 (local parameter comparison); Mathlib `Matrix.det`, `riemannZeta_eulerProduct`.

### PS.1.2 Archimedean factors and the completed L-function

For a pure Hodge realization over ℚ, use Γ_ℝ(s) = `π^{−s/2}` Γ(s/2) (Mathlib `Complex.Gammaℝ`). A conjugate pair of Hodge types (p, q), (q, p) with p < q contributes Γ_ℂ(s − `p)^{h^{p,q}}.` A middle block of type (p, p) on which F∞ acts by `(−1)^{p+ε},` ε ∈ {0, 1}, contributes Γ_ℝ(s + ε − p) raised to its dimension. Two normalizations of Γ_ℂ are in use and both are kept: Deligne's `Γ_{ℂ,D}(s)` = `2(2π)^{−s}` Γ(s), which is Mathlib `Complex.Gammaℂ`, and BCGP's `Γ_{ℂ,B}(s)` = `(2π)^{−s}` Γ(s). At a complex place v of a base field, choose one embedding above v and use `∏_{p,q}` Γ_ℂ(s − min(p, `q))^{h_v^{p,q}},` each ordered Hodge type at that embedding counted once and the conjugate embedding not counted again. Define Λ = L_fin · L_∞, with no conductor power absorbed. If b is the total number of complex Gamma blocks with multiplicity, then Λ_D = 2^b Λ_B; this bridge is applied before any value or epsilon factor is transported between conventions (Deligne, §§5.2–5.3, pp. 17–18; BCGP, (2.8.4), p. 37; Serre, §§3.1–3.3, printed pp. 19-10–19-11).

The Hodge data and infinity action are those of PS.0.2. Poles of Gamma factors are poles of the analytic functions; Mathlib's total Gamma takes the value 0 there, and no statement below uses that value as the value of a factor.

For regular pure geometric realizations compare these blocks with PotentialModularityAndCompatibleSystems §1.15 meromorphically, using Γ_ℂ(s)=Γ_ℝ(s)Γ_ℝ(s+1) before evaluation. At a real place an even rank has only exchanged Hodge pairs. For odd rank n=2r+1 the weight w is even, the r exchanged pairs have determinant (−1)^r and trace zero, and the middle line has eigenvalue a=tr(F∞)=(−1)^r det(F∞). Thus the geometric quotient presentation has multiplicities d_±=(n±(−1)^(w/2)tr(F∞))/2. Section 1.15's determinant-based multiplicities agree with these when r is even; when r is odd they are interchanged. Prove equality with that shared completion for even rank and for odd rank congruent to 1 modulo 4 at every real place, and in all ranks over fields without real places. For odd rank congruent to 3 modulo 4 retain the geometric Hodge-block formula and the explicit comparison of multiplicities, without asserting equality with the determinant-based completion. All comparisons extend across removable singularities after cancellation. The geometric product above applies to arbitrary Hodge multiplicities with no distinct-weight or rank restriction (Deligne, §5.3, p. 18).

To prove the bridge, compare the two Γ_ℂ normalizations one block at a time; multiplication with the finite Euler product happens on its half-plane of convergence, and continuation stays a separate predicate.

The interface includes the following facts.

- The list of Gamma blocks with their shifts and multiplicities.
- Λ = L_fin · L_∞ in a stated normalization.
- The regular geometric quotient uses d_±=(n±(−1)^(w/2)tr(F∞))/2 in odd rank; its equality with the shared completion has the real-place rank restriction above. For every admitted Hodge realization Λ_D = 2^b Λ_B.
- L_fin = Λ/L_∞ where L_∞ is finite and nonzero.
- Twisting gives L_∞(M(n),s)=L_∞(M,s+n). The BCGP complex block is (2π)^(−s)Γ(s), half of Deligne’s block.

**Checks.**

- For ℚ(0), L_∞(s) = Γ_ℝ(s), which has a pole at s = 0; the shared completion has this same factor.
- For regular elliptic H¹ the shared meromorphic quotient cancels to Γ_ℂ(s). At s=1/2 its uncancelled total-Gamma expression is 0, while the cancelled value is Γ_ℂ(1/2)=√2. The equality adapter uses the latter.
- For Sym²H¹(E) over ℚ, the Hodge types are (0,2),(1,1),(2,0) and the infinity eigenvalues are +1,+1,−1. Thus n=3,w=2,tr(F∞)=1,det(F∞)=−1 and the middle line has eigenvalue +1: the geometric factor is Γ_ℂ(s)Γ_ℝ(s), while the determinant-based quotient is Γ_ℂ(s)Γ_ℝ(s−1). At s=3 they are 1/(4π⁴) and 1/(2π⁴), respectively; the finite Euler product is nonzero there since 3>1+w/2=2. Neither a Gamma cancellation nor the Deligne/BCGP bridge identifies the two completions.
- For Sym⁴H¹(E), n=5,w=4 and the infinity eigenvalues are +1,+1,+1,−1,−1, giving trace=det=1. Both multiplicity formulas give (d_+,d_−)=(3,2), and cancellation gives Γ_ℂ(s)Γ_ℂ(s−1)Γ_ℝ(s−2). This detects the dependence on the number of exchanged pairs rather than on odd rank alone.
- The zero realization has b=0 and Λ_D=Λ_B=1. Two copies of elliptic H¹ have repeated Hodge weights and factor Γ_ℂ(s)², so their Deligne/BCGP ratio is 4 even though the regular-only formula is outside its scope.
- For H¹ of an abelian surface over a totally real field F, BCGP's factor is `Γ_{ℂ,B}(s)²` at each real place and Λ_D/Λ_B = `2^{2[F:ℚ]}.`
- A (0, 0) block with F∞ = −1 has factor Γ_ℝ(s + 1), not Γ_ℝ(s).
- At one complex place, types (0, 1) and (1, 0), each of multiplicity one, contribute Γ_ℂ(s)²; treating them as a single real conjugate pair loses a factor.
- `Γ_{ℂ,D}(1)` = 1/π and `Γ_{ℂ,B}(1)` = 1/(2π). Also `Γ_{ℂ,B}(2)` = 1/(4π²) and `Γ_{ℂ,B}(3)` = 1/(4π³); these check the exponent of 2π and the Γ(s) factor separately.

*Needs:* Layers PS.1.1 and PS.0.2; PotentialModularityAndCompatibleSystems §1.15 (regular completion and meromorphic Gamma quotients); AutomorphicLFunctionsAndLocalFactors AL.1 (canonical archimedean factor and archimedean local theory); Mathlib `Complex.Gammaℝ`, `Complex.Gammaℂ`.

### PS.1.3 Critical integers

An integer m is critical for M when both meromorphic functions L_∞(M, s) and L_∞(M^∨, 1 − s) are regular at s = m (Deligne, Definition 1.3, p. 6). In Hodge terms: a real off-diagonal pair p < q allows exactly p < m ≤ q; a diagonal block (p, p, ε) requires both m + ε − p and 1 − m + ε + p to lie outside {0, −2, −4, …}; criticality is the conjunction over all nonzero Hodge blocks (Deligne, §1.3, p. 7, and §§5.2–5.3, pp. 17–18). The definition concerns only the infinity factors and says nothing about zeros or poles of L_fin.

The inputs are a pure geometric Hodge realization, its dual, and the pole set of Γ from AutomorphicLFunctionsAndLocalFactors AL.1 (or Mathlib `Complex.Gamma_eq_zero_iff` with its total-value convention). The test on the dual is applied even when the first factor is regular.

To prove the Hodge description, substitute the Gamma shifts of PS.1.2 and their dual shifts and use the pole set of Γ together with purity.

The interface includes the following facts.

- Regularity of both germs.
- For a single pair p < q, the critical integers are p < m ≤ q.
- The two shifted exclusions.
- The integer m is critical for M if and only if 0 is critical for M(m).
- Coefficient embeddings transport criticality. For the unit motive its critical integers are positive even and negative odd.

**Checks.**

- For ℚ(0) the critical integers are exactly the positive even integers and the negative odd integers; 0 is not critical.
- A Hodge pair (0, k−1), (k−1, 0) with k ≥ 2 has critical integers 1, …, k−1.
- For ℚ(0), m = 1 passes the first test (Γ_ℝ(1) is regular) but fails the dual test (Γ_ℝ(0) has a pole), so 1 is not critical; a definition with one test only accepts it.
- For ℚ(0), m = −1 is critical: Γ_ℝ(−1) and Γ_ℝ(2) are both regular.

For a critical twist, prove that the filtration cuts and sign comparison maps required in PS.0.4 exist and are isomorphisms (Deligne §1.7). Criticality itself uses only the infinity factors.

*Needs:* Layer PS.1.2 for criticality; PS.0.4 only for the sign-period corollary; AutomorphicLFunctionsAndLocalFactors AL.1 (canonical archimedean factor, archimedean local theory); Mathlib `Complex.Gammaℝ`, `Complex.Gamma_eq_zero_iff`.

### PS.1.4 Deligne's normalized-value predicate

Let m be critical for M, suppose a meromorphic continuation of L_fin(M, s) regular at m is supplied, and let L_fin(M, m) ∈ E ⊗ ℂ be the tuple of its values at all coefficient embeddings; values may be zero. Define DeligneAlgebraic M m to mean that L_fin(M, m)/c⁺(M(m)) lies in the diagonal image of E, and its unit refinement to mean that it lies in E^×. The finite value, the plus period of the twisted motive M(m) and its induced sign are used; the completed value Λ(M, m) is not. The predicate requires one element of E to give every embedding component, and it is invariant under changes of E-bases (Deligne, Conjecture 1.8, p. 8; §2.6 and Conjecture 2.8, pp. 11–12; (5.1.8), p. 16). Deligne's conjecture is the assertion of DeligneAlgebraic M m for every critical m; it, and every nonvanishing assertion, is a predicate, used only as a named hypothesis.

All realizations and periods are those of PS.0; continuation and regularity at m are supplied or assumed; periods are nonzero, and a chosen representative is recorded whenever a scalar formula is stated.

To prove the invariance statements, use the basis-change and embedding formulas of PS.0.1 and PS.0.3.

The interface includes the following facts.

- The normalized finite value for chosen period bases.
- Algebraicity is the existence of one a ∈ E giving all components.
- The unit predicate is algebraicity plus a nonzero value in every component.
- Replacing c by uc with u ∈ E^× replaces a by a/u.
- Reindexing coefficient embeddings conjugates the same coefficient a. At one embedding fixed-period algebraicity means c≠0 and L∈E·c.
- The unit refinement requires the coefficient in E^×.

**Checks.**

- A zero normalized value satisfies membership in E but not the unit predicate.
- With the ℚ(2) period (2πi)², ζ(2)/(2πi)² = −1/24 (Mathlib `riemannZeta_two`).
- Replacing the finite value by the completed value Γ_ℝ(2)ζ(2) = ζ(2)/π changes the ratio to −1/(24π), which is not rational; the completed value is rejected as the input.
- A zero period is excluded: the fixed-period predicate rejects c=0.
- The unit predicate over ℚ at (L,c)=(2,1) holds with coefficient 2, whereas the unit predicate over ℚ at (L,c)=(i,1) fails; nonvanishing alone does not give coefficient-field membership.

*Needs:* Layers PS.1.3, PS.0.3 and PS.0.4; Mathlib `riemannZeta_two`.

### PS.1.5 The Dirichlet and Tate adapter

For a primitive Dirichlet character χ of conductor f with values in a number field E and a fixed complex embedding, let K_χ ⊂ ℚ(ζ_f) be the field cut out by χ, with (ℤ/f)^× → Gal(K_χ/ℚ) sending a to the automorphism induced by ζ_f ↦ ζ_f^a, so that arithmetic Frobenius at p ∤ f maps to p. Define A_χ as the summand of h⁰(Spec K_χ) ⊗_ℚ E on whose Betti realization, an E-line, the Galois group acts through χ⁻¹; this is Deligne's [χ⁻¹] (Deligne, §2.1, p. 9, for M ⊗_ℚ E; §§6.1–6.4, pp. 20–21). It is a motive with coefficients in E in the sense of PS.0.1, built from the Chow motive h⁰(Spec K_χ) with its projectors (MotivesAndAlgebraicCycles Layer 1), the equivalence of Artin motives with rational Galois representations (MotivesAndAlgebraicCycles §6.10) and the realizations of MC.2. Geometric Frobenius at p ∤ f acts on its étale realization by χ(p), so its finite L-function is L(χ, s). Transport the Bernoulli and Gauss-sum identities to the Deligne normalization of A_χ(m). At s = 1 − n with n ≥ 1 the finite value is the complex image of `−B_{n,χ}/n` in the character convention of DirichletPadicLFunctions L0 (with Mathlib's Hurwitz values hurwitzZeta_neg_nat and `riemannZeta_neg_nat_eq_bernoulli`). A positive critical value uses Mathlib's functional equation for primitive characters, DirichletCharacter.IsPrimitive.completedLFunction_one_sub, with the dual character χ⁻¹, the root number DirichletCharacter.rootNumber and the parity of χ. The period identification δ(A_χ) ~ τ(χ) = Σ_u χ(u)e^(2πiu/f) in (E ⊗ ℂ)^×/E^× is part of this target: Deligne's δ([ε]) ~ Σ ε⁻¹(u) ⊗ exp(−2πiu/f) at ε = χ⁻¹ is χ(−1)τ(χ), proved from the comparison of MC.2 on H⁰_dR(Spec K_χ) = K_χ following Deligne §§6.3–6.5, and δ(A_χ(m)) = (2πi)^m δ(A_χ) by PS.0.5. For an imprimitive (induced) character each omitted Euler polynomial is kept; if one vanishes at the point, the leading-term correction of AutomorphicLFunctionsAndLocalFactors AL.5 is used, never division (Deligne, §§3.1–3.2, pp. 13–14; §§6.3–6.7, pp. 20–22).

The Artin realization and its period comparison are actual constructions; no one-dimensional representation is asserted motivic otherwise. The endpoint convention of DirichletPadicLFunctions L0 for the principal character of conductor one is B₁ = +1/2 in its convention; Mathlib's `bernoulli 1 = −1/2` is compared explicitly (ζ(0) = −1/2 in both).

To prove this, match Euler polynomials and the character/inverse convention first; for nonpositive critical arguments use the Bernoulli identity; for positive ones use the functional equation and the dual Gauss sum; apply the Tate scaling of PS.0.5 and the Artin period identification; transport finite corrections with AL.5.

The interface includes the following facts.

- The finite L-function of A_χ is L(χ, s); geometric Frobenius at p ∤ f acts by χ(p).
- δ(A_χ(m)) ~ (2πi)^m τ(χ) in (E ⊗ ℂ)^×/E^×; at a critical m ≥ 1 F∞ acts on A_χ(m) by +1 and c⁺(A_χ(m)) = δ(A_χ(m)), while at a critical m ≤ 0 it acts by −1 and c⁺(A_χ(m)) = 1.
- The critical values are algebraic in Deligne's sense, with the explicit coefficient.
- The induced-character version with its Euler polynomials.

**Checks.**

- ζ(−1) = −1/12 (Mathlib `riemannZeta_neg_nat_eq_bernoulli` with k = 1) and ζ(2)/(2πi)² = −1/24 are two different critical examples, of opposite sign behaviour.
- ζ(0) = −1/2, but 0 is not a critical integer for ℚ(0); it is not a Deligne value.
- Passing from the primitive conductor to an induced modulus multiplies by the missing factors (1 − `χ(p)p^{−s});` if one of them vanishes at the point, no normalized quotient is formed.
- For the character χ mod 5 with χ(2) = i (odd, E = ℚ(i)), geometric Frobenius at 2 acts on A_χ by i and P₂(T) = 1 − iT, the Euler factor of L(χ, s); Deligne's [χ] gives 1 + iT, the factor of L(χ̄, s). Its critical integers are the positive odd and the nonpositive even integers, and c⁺(A_χ(1)) ~ 2πi·τ(χ).

*Needs:* Layer PS.1.4; Layer PS.0.5; DirichletPadicLFunctions L0 (normalized values in a complex embedding); MotivesAndAlgebraicCycles Layer 1 (projectors), §6.10 (Artin motives and Galois representations) and MC.2 (realizations and comparison); AutomorphicLFunctionsAndLocalFactors AL.1 (local epsilon and gamma factors) and AL.5 (Euler correction and leading term); Mathlib DirichletCharacter.IsPrimitive.completedLFunction_one_sub, DirichletCharacter.rootNumber, hurwitzZeta_neg_nat, `riemannZeta_neg_nat_eq_bernoulli`.

### PS.1.6 The modular period adapter

Let f be a normalized cuspidal eigenform over ℚ of weight k ≥ 2 in the GL₂ scope of AutomorphicLFunctionsAndLocalFactors AL.5, with coefficient field E containing its eigenvalues and character values, and let M_f be its rank-two motive with coefficients in E, constructed below with its eigenprojector and comparison and normalized so that L(M_f, s) = L(f, s). M_f has Hodge types (0, k−1) and (k−1, 0), so d⁺ = d⁻ = 1 and its critical integers are 1 ≤ m ≤ k−1 (PS.1.3); by the twisting rule of PS.0.4, Deligne's normalizer at m is c⁺(M_f(m)) = (2πi)^m · c^((−1)^m)(M_f) (Deligne, (7.8.3), p. 25). Import the signed modular-symbol periods Ω_f^± at the supplier's fixed embedding σ : E → ℂ and its critical-value algebraicity theorem from ModularSymbolsPadicLFunctions §§1.1–1.2: with j = m − 1 in that roadmap's weight k = κ + 2, (m−1)! · L(f, m)/((−2πi)^(m−1) Ω_f^ε) ∈ σ(E) with ε = (−1)^(k−m−1), the period symbol carrying the factor 2πi of the algebraic differential f dq/q = 2πi f(z) dz. Prove that the rational structure given by modular symbols matches the Betti rational structure of M_f, in the form

```text
(2πi) · c^((−1)^m)(M_f) ~ Ω_f^((−1)^(k−m−1))   in ℂ^×/σ(E^×), for 1 ≤ m ≤ k−1.
```

For even k this says (2πi)·c^±(M_f) ~ Ω_f^∓: the modular-symbol period of one sign is matched with 2πi times the Deligne period of the other sign, never with c^±(M_f) itself. Carry this comparison through all coefficient embeddings using the same E-rational eigenprojector and modular-symbol rational structure; the algebraic coefficients must be embeddings of one element of E. Only after this coherent comparison transport the algebraicity theorem to DeligneAlgebraic M_f m (PS.1.4). A scalar identity needs specified integral cycles, an invariant differential and the comparison coefficient; equality of period classes proves no scalar identity. The conductor, the ramified factors and the leading terms at imprimitive zero factors are retained (Deligne, §§7.6–7.8, pp. 24–26; (5.1.8), p. 16).

Construct M_f using smooth projective Kuga–Sato compactifications over a fine auxiliary modular level, Scholl's finite-group projector and the f-Hecke summand in the category of homological motives with E-action. This choice does not assert a lift of the individual eigenprojector to a Chow idempotent. Prove that its Betti and de Rham realizations are the parabolic rank-two f-summands and that the comparison is the restriction of the geometric comparison; prove independence of auxiliary fine level by the degeneracy correspondences. At weight two use the f-isotypic factor of the modular Jacobian. The parabolic coefficient realization is ModularCurvesPartII §§14.1–14.4a; the motive and its marked comparison are the construction here (Scholl, Theorems 1.2.1 and 1.2.4, p.2, and §1.3, pp.2–3; Deligne, §§7.6–7.8, pp.24–26).

The motive has the following API.

- Coefficient extension carries the f-eigenprojector and each marked realization to its scalar extension.
- The eigenprojector squares to itself and its image realizes the parabolic rank-two f-summand.
- Degeneracy correspondences identify the motives at auxiliary fine levels and commute with the marked comparison.
- The tensor and Tate comparisons are restrictions of the supplied geometric comparisons.

**Checks.**

- Weight two gives h¹ of the modular abelian factor, with types (0,1),(1,0) and sole critical integer 1.
- Weight four gives types (0,3),(3,0) and critical interval 1,2,3; a weight-two-only construction cannot give this realization.
- Idempotents 0 and 1 select the zero summand and entire parabolic space. When the latter has dimension greater than two, neither is the specified f-summand. An arbitrary rank-two representation has no specified geometric projector or marked comparison and is rejected.

This target makes no assertion about twisted values, Rankin–Selberg products or other base fields beyond AL.5's scope.

To prove this, compare the modular-symbol Betti structure and the algebraic de Rham eigenclass f dq/q through the geometric comparison of the eigenprojector motive (Deligne §7.6 expresses these periods through the Eichler integrals of f(q) dq/q); use the Hodge pair to read the critical interval and the twist sign; then transport the imported formula and the finite Euler corrections.

The interface includes the following facts.

- (2πi)·c^((−1)^m)(M_f) ~ Ω_f^((−1)^(k−m−1)) in ℂ^×/σ(E^×) for 1 ≤ m ≤ k−1.
- Deligne algebraicity of L(f, m) for 1 ≤ m ≤ k−1, with this sign selection.
- Replacing Ω by uΩ changes the coefficient by u⁻¹.

**Checks.**

- For k = 2 only m = 1 is critical; (−1)^1 selects c⁻(M_f), and ε = (−1)^0 selects Ω_f⁺, so L(f, 1)/Ω_f⁺ ∈ σ(E). For k = 4 the pairs at m = 1, 2, 3 are (c⁻, Ω⁺), (c⁺, Ω⁻), (c⁻, Ω⁺); a rule pairing equal signs fails at every m.
- Weight-two witness: for the curve y² = x(1−x)(1−x/2) of PS.0.5, M_f = h¹(E) and f dq/q pulls back to a nonzero rational multiple of ω. The canonical integrals and Legendre relation of EllipticIntegrals Milestones 1 and 3, transported by λ=k² at k=1/√2, with K = Tau Ceti's modulus integral and E = its second-kind integral, H = 2E(1/√2) and J = 2(K − E(1/√2)), gives K(H − J) = π, so det B = 4πi. Hence c⁻(h¹(E)) = 2K/det B = K/(2πi) and c⁺(h¹(E)) = −2iK/det B = −K/(2π). With Ω⁺ = 2K and Ω⁻ = 2iK the periods of ω over γ_a and γ_b, 2πi·c⁻ = Ω⁺/2 and 2πi·c⁺ = −Ω⁻/2, whereas c⁻/Ω⁻ = −1/(4π) is irrational: the same-sign identification fails.
- Replacing Ω by uΩ with u ∈ E^× changes the exact coefficient by u⁻¹ and preserves the E^×-class.
- A vanishing local correction factor is handled at the correct derivative order through AL.5, not by division.

*Needs:* Layer PS.1.4; Layer PS.0.5 (for the weight-two witness); EllipticIntegrals Milestones 1 and 3 (canonical first/second kind integrals and Legendre relation); ModularSymbolsPadicLFunctions §§1.1–1.2 (signed periods and critical-value algebraicity); AutomorphicLFunctionsAndLocalFactors AL.5 (finite Euler corrections and leading terms); MotivesAndAlgebraicCycles Layers 1–2 (Chow projectors and realizations); ModularCurvesPartII §§14.1–14.4a (parabolic coefficient realization); ResolutionOfSingularitiesCharacteristicZero §§6.1–6.2 (smooth projective compactifications); TauCetiRoadmap ModularForms Layer 8.

### PS.1.7 Serre's functional-equation predicate

For the BCGP-normalized completion of an admitted strictly compatible system R, define SerreSystem R to assert: the completions Λ(R, s) and Λ(R^∨, s) of PS.1.2 extend meromorphically to ℂ, agreeing with their Euler products on a right half-plane and not identically zero; and Λ(R, s) = ε(R) `N(R)^{−s}` Λ(R^∨, 1 − s), with N(R) a positive integer equal to the conductor of R and of R^∨, and ε(R) in the chosen local epsilon and measure normalization. Applying the equation twice gives ε(R)ε(R^∨) = N(R). The conductor is not multiplied into Λ. SerreSystem is a predicate; potentially automorphic cases supply a witness from their owners (BCGP, (2.8.4)–(2.8.5), p. 37; Tate, *Number theoretic background*, (3.4.3)–(3.4.7), printed p. 15, for the dependence of local constants on the measure and additive character and the contragredient identity).

Both completions and conductors use the normalization of PS.1.2. Epsilon constants need geometric or local normalization data in addition to strict compatibility.

To prove the consequences, write continuation as an extension of the existing Euler-product function (not as an arbitrary entire function), state both dual equations, and cancel a nonzero germ to get the product constraint. Check compatibility with the local epsilon conventions of AutomorphicLFunctionsAndLocalFactors AL.1 using the dual Haar measure and the opposite additive character.

The interface includes the following facts.

- The agreeing meromorphic extensions of R and R^∨.
- The equation with the explicit `N^{−s}.`
- ε(R)ε(R^∨) = N(R).
- With Λ̂ = `N^{s/2}` Λ the constant is ε/√N, and for self-dual data its square is 1.
- Changing the Gamma blocks by constants rescales both sides and the epsilon constants coherently.

**Checks.**

- For a self-dual system, ε² = N; ε itself need not be a sign in this normalization.
- Two identically zero functions satisfy any functional equation and are rejected as a continuation of the Euler product.
- Inserting `N^{s/2}` into Λ without changing the displayed equation fails the half-conductor test.
- For the unit motive over ℚ, N = 1 and ε = 1, and the equation is Mathlib completedRiemannZeta_one_sub (with Γ_ℝ, which agrees in both conventions since no complex block occurs).

*Needs:* Layer PS.1.2; ArithmeticGaloisRepresentations §3.3 (local conductor exponents); AutomorphicLFunctionsAndLocalFactors AL.1 (Hecke functional equation, local epsilon and gamma factors); Mathlib completedRiemannZeta_one_sub.

### PS.1.8 Hasse–Weil completions of abelian varieties

For an abelian variety A over a number field F of dimension g, import strict compatibility and purity of H^i(A) for every 0 ≤ i ≤ 2g (NeronModelsAndSemistableAbelianVarieties §6.10, BCGP Proposition 2.8.1), define Λ_i(A, s) = Λ(H^i(A), s) and Λ(A, s) = ∏_i Λ_i(A, `s)^{(−1)^i}.` At good reduction the corrected local product, with exponent (−1)^i, equals `exp(Σ_{m ≥ 1}` `#A(k_v^{(m)})` `q_v^{−ms}/m).` Define SerreC9 A i as meromorphic continuation of Λ_i together with Λ_i(A, s) = w_i `N_i^{(i+1)/2 − s}` Λ_i(A, i + 1 − s), w_i ∈ {±1}, N_i ∈ `ℤ_{>0}.` Poincaré duality together with all SerreC9 A i implies Λ(A, s) = ε `N^{−s}` Λ(A, 1 + g − s) with ε real and N a positive rational (BCGP, Corollary 2.8.7). Separately define the predicate of BCGP Conjecture 1.1.1 for a smooth projective X/F of dimension d: its partial Hasse–Weil zeta function continues meromorphically, and there are A₀ > 0, nonzero rational bad-place functions P_v ∈ ℚ(T) and the specified Gamma product such that ξ(s) = ζ_X(s) `A₀^{s/2}` ∏ Γ_v(s) ∏ `P_v(q_v^{−s})` satisfies ξ(s) = w ξ(d + 1 − s), w = ±1. These are predicates, not theorems (BCGP, §2.8, pp. 36–38, Conjecture 2.8.6 and Corollary 2.8.7; Conjecture 1.1.1, pp. 3–4; Serre, §4.1, (26)–(29), (5)–(7) and Conjecture C9, printed pp. 19-12–19-13).

The finite-field point counts are WeilConjectures WC.1 and the Galois-equivariant Poincaré pairing on H^i(A_F̄) with `H^{2g−i}(A_F̄)(g)` is EtaleDualityAndPerverseSheaves Layer 0, §§0.5–0.6, transported to all realizations by MC.2. The partial zeta predicate uses the chosen integral model and its omitted bad set; unspecified bad factors are never treated as proved local definitions.

To prove the total equation, form the finite alternating products, apply the trace/point-count identity with the cohomological exponent, and combine Poincaré duality with the individual equations.

The interface includes the following facts.

- Λ_i from the imported pure system H^i(A).
- The alternating product, with the cohomological sign.
- The point-count exponential, in its convergence region or as a formal series.
- The individual cohomological functional equation is recorded as a predicate with its specified continuation.
- The total equation from duality and all SerreC9.
- The corrected-zeta predicate of Conjecture 1.1.1 for smooth projective X.

**Checks.**

- For A = Spec F (dimension zero), the product has only H⁰ and gives the completed Dedekind zeta function of F; its finite factor is ζ_F.
- For g = 1, the H¹ factor occurs inversely in the local zeta product, with an exponent independent of s; a sign exponent depending on s (as printed in the source display, see Corrections) fails at every s.
- For an abelian surface over a totally real field, H¹ has `Γ_{ℂ,B}(s)²` at each real place, and the full product still involves H⁰ through H⁴.

*Needs:* Layer PS.1.7; NeronModelsAndSemistableAbelianVarieties §6.10; WeilConjectures WC.1 (cohomological formula from the trace formula); EtaleDualityAndPerverseSheaves Layer 0, §§0.5–0.6 (geometric Poincaré duality and Galois equivariance); MotivesAndAlgebraicCycles MC.2 (realization compatibility).

### Examples

- the real Gamma regularity condition holds at 1, −1 and 2 and fails at 0 and −2; the unit-motive criticality condition holds at 2 and −1 and fails at 0 and 1.
- the off-diagonal criticality condition 0 1 m ↔ m = 1: an elliptic curve has the single critical integer 1.
- ζ(2)/(2πi)² = −1/24, so the fixed-period predicate over ℚ for L=ζ(2) and c=(2πi)² holds; the fixed-period predicate at (L,c)=(0,1) holds while its unit refinement at (L,c)=(0,1) fails.
- `Complex.Gammaℂ 1 = 1/π` and Γ_(ℂ,B) 1 = 1/(2π).

### Dependencies

Layer PS.0; ArithmeticGaloisRepresentations §§2.4–2.6, §3.3; AutomorphicLFunctionsAndLocalFactors AL.1, AL.3, AL.4, AL.5; DirichletPadicLFunctions L0; MotivesAndAlgebraicCycles Layer 1, MC.2 and §6.10; ModularCurvesPartII §§14.1–14.4a; ResolutionOfSingularitiesCharacteristicZero §§6.1–6.2; NeronModelsAndSemistableAbelianVarieties §6.10; WeilConjectures WC.1–WC.2; EtaleDualityAndPerverseSheaves Layer 0, §§0.5–0.6; TauCetiRoadmap ModularForms Layer 8; Mathlib `Complex.Gammaℝ`, `Complex.Gammaℂ`, riemannZeta, DirichletCharacter.completedLFunction; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AutomorphicGaloisRepresentationsPartII AG2.P, ‘Arbitrary-rank compatible data and operations’; PotentialModularityAndCompatibleSystems §§1.6–1.7, 1.15; EllipticIntegrals Milestones 1 and 3.

## Layer PS.2: formal periods and the evaluation comparison

MotivesAndAlgebraicCycles Layer 6 owns the algebra of formal periods, its relations, its localization at the Tate period, and the theorem of Huber and Müller-Stach that its spectrum is the torsor of tensor isomorphisms between the de Rham and Betti fibre functors on Nori motives. This layer uses the marked evaluation and comparison point supplied by MotivesAndAlgebraicCycles §§5.7, 6.7–6.9, and compares its β-convention with the inverse I of PS.0. It ends with the rank-one Tate case, where everything is explicit.

### PS.2.1 Properties of the imported marked evaluation

Import P_eff, the Tate symbol L, P = P_eff[L⁻¹], and the marked algebra map per : P → ℂ from MotivesAndAlgebraicCycles §§5.7, 6.7–6.9. Use its properties: on [X,Y,ω,γ] the value is the relative integral; ∫_γ δα = ∫_(∂γ) α fixes the boundary sign; products pair the de Rham exterior product with the singular cross product; per(L) = 2πi and per(L⁻¹) = (2πi)⁻¹. These are properties of the supplied map, with no second descent or localization construction (HMS, Definition 2.8, Theorem 2.10 and Corollary 2.11, pp. 10–11).

The arbitrary-pair de Rham inputs are the long exact sequence, Künneth and base change of HMS-book Propositions 3.2.9 and 3.2.13 and Lemma 3.2.14, pp. 78–80, and comparison in Definition 5.4.1 and Lemma 5.4.2, pp. 103–104. Both degree signs occur when factors are interchanged: one in forms and one in homology. Their pairing has sign (−1)^(2ab) = 1, so the period product is commutative.

Prove the PS.0 normalization comparison by reading β from the supplied marked point and taking its inverse I. The evaluation properties used in subsequent layers are the symbol, boundary, product and Tate properties above.

The interface includes the following facts.

- Evaluation is the imported integral pairing on every finite-type pair and every degree.
- The Stokes relation uses the oriented boundary sign, with no properness restriction.
- Products use both graded comparisons, and the Tate inverse evaluates to (2πi)⁻¹.

**Checks.**

- In P, L·L⁻¹ = 1 and its image is exactly 1.
- The point symbol of the constant function 1 evaluates to 1, and the zero form evaluates to 0.
- For X = 𝔸¹, Y = {0, 1}, ω = dx and γ = [0, 1], the value is 1, which equals the boundary evaluation of the function x (x(1) − x(0)); a sign error in the Stokes relation gives −1.
- For Y=∅ the relative comparison is the absolute one; for Y=X its cohomology and homology groups vanish and every such positive-degree symbol evaluates to zero. Neither case requires X proper or nonsingular.
- Reversing [0,1] gives −1. The product of two oriented interval classes integrates dx∧dy to 1, while interchanging only the form gives −1. Interchanging both the degree-one forms and cycles gives (−1)(−1)=1, as required for the commutative period product.

*Needs:* MotivesAndAlgebraicCycles §§5.7, 6.7–6.9 (the arbitrary-pair comparison, evaluated period algebra and marked point); ComplexComparisonPartII C5; Layer PS.0.5; Mathlib `IsLocalization.Away`, `IsLocalization.Away.lift`, IsLocalization.Away.mul_invSelf.

### PS.2.2 The marked point and the inverse comparison

Use the tensor torsor and marked point of MotivesAndAlgebraicCycles §§6.7–6.9, with β:H_dR,ℂ→H_B,ℂ. Prove the compatibility with PS.0: the tensor inverse I=β⁻¹ gives its comparison point in the opposite isomorphism torsor, and in the same ordered bases its matrix is B⁻¹ when β has matrix B. Thus the period determinant used in PS.0 is (det B)⁻¹, while the imported evaluation remains γ(βω). This compares two conventions on the same marked realizations (HMS, Theorem 2.10, p. 11, and §3, pp. 12–13; Deligne §5.1, pp. 15–16).

The full Tate-localized algebra, its marked evaluation and the torsor theorem are supplier inputs. No second period algebra, point or descent of integration is constructed here. For a geometric symbol the supplied pairing fixes β, and taking the inverse fixes I; an unmarked isomorphism of equal-rank vector spaces does not determine either point.

To prove the compatibility, evaluate the supplied β on each paired de Rham class and Betti cycle, identify the resulting integration matrix, and apply inversion on the actual finite-dimensional realization. Tensor duality makes these inverse comparisons compatible with tensor products and all integer twists.

The interface includes the following facts.

- The marked numerical evaluation is γ(βω), while PS.0 uses I=β⁻¹ with the same realizations and bases.
- The comparison matrix and determinant are B⁻¹ and (det B)⁻¹; the full Tate coordinate is invertible.

**Checks.**

- On the full torsor the image of L is a unit, not merely a nonzero effective coordinate.
- On a rank-two comparison torsor the heap is (P, Q, R) ↦ PQ⁻¹R. For P = [[1, 1], [0, 1]], Q = diag(2, 1), R = [[1, 0], [1, 1]], it gives [[3/2, 1], [1, 1]], whereas RQ⁻¹P = [[1/2, 1/2], [1/2, 3/2]]. Reversing the actions changes the result.
- The evaluation ℚ[t, t⁻¹] → ℚ at t = 1 is a torsor point but has t − 1 in its kernel. Thus the torsor property alone does not prove injectivity of the numerical comparison point.

*Needs:* Layers PS.2.1 and PS.0.1; MotivesAndAlgebraicCycles §§6.7–6.9 (full evaluated period algebra and marked tensor torsor).

### PS.2.3 The rank-one Tate torsor

For the tensor category generated by the Tate object with all integral twists, specialize the Layer 6 torsor theorem: the distinct Hodge weights make its tensor automorphism group 𝔾_m and its coordinate algebra the Laurent polynomial ring ℚ[t, t⁻¹], with t the β-period L of ℚ(−1). Under periodEvaluation, t ↦ 2πi and t⁻¹ ↦ (2πi)⁻¹; under I the coordinate is inverted. The effective polynomial algebra ℚ[t] is not the full torsor algebra. For the finite étale scheme Spec ℚ[x]/(x² − 2), the de Rham class x paired with the complex point √2 evaluates to √2; zero-dimensional periods are the algebraic numbers, and products of pairs agree with multiplication (HMS, Remark 2.9, p. 11; Lemmas 3.1–3.2, p. 12).

The rank-one category, its torsor and comparison are imported from Layer 6; this target is the explicit integration normalization.

To prove this, restrict the full comparison to the Tate-generated category, identify its tensor automorphisms with 𝔾_m by the distinct weights, identify the distinguished coordinate and its inverse, and use PS.2.1 product compatibility for all positive and negative powers. This specialization is the Laurent-polynomial evaluation at the unit 2πi.

The interface includes the following facts.

- The ℚ-algebra map ℚ[t, t⁻¹] → ℂ, t ↦ 2πi.
- t^n ↦ (2πi)^n for every integer n.

**Checks.**

- t·t⁻¹ = 1 evaluates to 1.
- t⁻² evaluates to (2πi)⁻².
- Replacing ℚ[t, t⁻¹] by ℚ[t] fails the negative-twist test: no polynomial p has p·t = 1.
- The zero-dimensional symbol (Spec ℚ[x]/(x² − 2), x, point √2) evaluates to √2, and moving the point to −√2 changes the value to −√2.

*Needs:* Layer PS.2.2; MotivesAndAlgebraicCycles Layer 6 (formal periods); Mathlib `LaurentPolynomial.eval₂`, `LaurentPolynomial.eval₂_T`.

### Examples

- the rank-one Tate evaluation (T (−2)) = (2πi)⁻² and the rank-one Tate evaluation (T 1 * T (−1)) = 1.
- The evaluation of the interval symbol (𝔸¹, {0, 1}, dx, [0, 1]) is 1.

### Dependencies

Layer PS.0; MotivesAndAlgebraicCycles Layers 5–6, including §5.7's arbitrary-pair comparison; ComplexComparisonPartII C5; Mathlib `IsLocalization.Away`, `LaurentPolynomial`.
## Layer PS.3: regulator determinants and leading terms

This layer assembles the rational fundamental line of a motive, its real trivialization by periods and regulators, and the rationality statement for leading terms. It uses the rational Fukaya–Kato object of NoncommutativeAndEquivariantIwasawa §7.9, in inverse Burns–Flach orientation, under explicit finiteness and exactness hypotheses.

### PS.3.0 Number-field Tate-Hom and Adams comparison

For a number field F and integers i,n, use geometric motives over ℚ and the finite-étale adjunction for Spec F → Spec ℚ to identify the field-base Tate Hom with Hom_DM(1,M(Spec F)(n)[i]). Construct the natural comparison from this group to the simultaneous weight-n part of K_(2n−i)(F) ⊗ ℚ, with negative K-groups interpreted as zero. For n≥0 and 2n−i≥0 compose MotivesAndAlgebraicCycles §§4.17–4.19's Tate-Hom/higher-Chow comparison with the inverse of the rational Chern character of MotivicEtaleKTheory §§2.2–2.3. For n<0 use the Tate-Hom vanishing of MotivesAndAlgebraicCycles §4.19 and the absence of negative Adams weights in that comparison; for 2n−i<0 use the negative chain-degree vanishing of the higher-Chow complex and GeneralAlgebraicKTheory §12.11 (a field is noetherian of global dimension zero). Retain products and localization boundaries from the same supplied maps (MotivicEtaleKTheory §§2.2–2.4; MotivesAndAlgebraicCycles §§4.17–4.19).

The interface includes the following facts.

- The comparison is an isomorphism with these exact degrees, natural in field embeddings.
- The degree-zero unit maps to the rank-one class, and products agree with addition of Tate weights and K-degrees.
- Localization boundaries commute with the comparison and its supplied sign convention.
- Negative weights and negative K-degrees contribute zero, with no use of a total natural-number subtraction.

**Checks.**

- At (i,n)=(0,0), both sides are ℚ and the unit maps to 1; a comparison discarding K₀ fails.
- At (i,n)=(1,1), both sides are Fˣ ⊗ ℚ. The class of 2 over ℚ has ψ²-value twice that class, fixing weight one.
- At (i,n)=(0,−1), the left side is zero by negative-weight vanishing and the right K_−2 is zero; truncating 2n−i to a natural number would incorrectly introduce K₀.
- At (i,n)=(1,j), j≥2, the K-degree is 2j−1; for j=2 it is 3 and for j=3 it is 5, matching PS.3.2a's ranks.

*Needs:* MotivesAndAlgebraicCycles §§4.17–4.19; MotivicEtaleKTheory §§2.2–2.4; GeneralAlgebraicKTheory §12.11 (negative K-theory vanishing for regular noetherian rings of finite global dimension).

### PS.3.1 The rational fundamental line

Let M be a motive over ℚ with an action of a finite-dimensional semisimple ℚ-algebra A, and assume finite-dimensional projective A-modules H_f⁰(M), H_f¹(M), H_f¹(M^∨(1)), H_f⁰(M^∨(1)) (motivic cohomology and its dual) together with the realizations of PS.0. Write t_M = H_dR(M)/F⁰ for the tangent space. In the determinant category (TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 for commutative A, a Picard category of virtual objects with a determinant functor for general A), define the Burns–Flach fundamental line

```text
Ξ_A(M) = d(H_f⁰(M)) · d(H_f¹(M))⁻¹ · d(H_f¹(M^∨(1))^*) · d(H_f⁰(M^∨(1))^*)⁻¹ · ∏_{v|∞} d(H_v(M)^{G_v})⁻¹ · d(t_M),
```

where for M over ℚ with commutative E-coefficients the archimedean term is d(B⁺)⁻¹. Use the rational Fukaya–Kato line supplied by NoncommutativeAndEquivariantIwasawa §7.9, and prove Δ_E(M)=Ξ_E(M)⁻¹ with the reversed tensor identifications in this convention. The inverse of the rational fundamental object of NoncommutativeAndEquivariantIwasawa §7.9 is identified with this formula factor by factor. These are rational objects; no torsion is erased from the integral problem of Layer PS.4 (Burns–Flach (BF), §3.4, (29), p. 526; Burns–Venjakob (BV), §4.3, published p. 187, definition of Δ and (17)).

Finite dimensionality and projectivity of the motivic cohomology spaces are explicit hypotheses. For general A the determinant category is the virtual-object category and determinant functor of NoncommutativeAndEquivariantIwasawa §2.7. The commutative case uses PadicMeasuresIwasawaAlgebras §5.1.

The virtual-object category, its quasi-isomorphism maps, exact-sequence coherences, shift inversion and scalar extension are imported from NoncommutativeAndEquivariantIwasawa §2.7. Cohomology-factor formulas require perfect cohomology modules. True short-exact-sequence triangles carry the coherence; arbitrary distinguished-triangle coherence is excluded by BF §2.4 Remark 1, p. 508.

To prove the orientation comparison, invert the imported rational Δ, match every dual and tensor exponent with the BF formula, and then take scalar extension. This consumer comparison does not reconstruct the determinant category.

The interface includes the following facts.

- The ordered BF object.
- The FK line and its comparison with Ξ⁻¹.
- Scalar extension carries each factor and dual to the corresponding determinant.
- In chosen bases, the product of the listed determinants with exactly these exponents.
- A zero cohomology factor contributes the unit object, not a zero scalar.

**Checks.**

- Δ ⊗ Ξ is canonically the unit in the fixed order.
- The factor d(H_f¹(M^∨(1))^*) has exponent +1 in Ξ. For M = h⁰(Spec F) with F real quadratic, this space is (O_F^× ⊗ ℚ)^*, a line, and θ_∞ pairs it with the logarithm of a fundamental unit, so the leading term at s = 0 involves the regulator R itself, as in ζ_F^*(0) = −hR/w; with exponent −1 the same assembly would produce R⁻¹.
- A finite integral module becomes zero after ⊗ℚ, so it has no trace in Ξ; its integral correction must still appear in Layer PS.4.
- The zero perfect complex has the unit determinant; shift inverts a determinant, including its grading. Swapping two rank-one commutative factors induces −1 on their determinant: the permutation matrix [[0,1],[1,0]] has determinant −1. An ungraded symmetry would fail this test, even though its K₀ class is unchanged.

*Needs:* Layer PS.0.1; NoncommutativeAndEquivariantIwasawa §§2.7, 7.9; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; GeneralAlgebraicKTheory §§4.15–4.17 and §6.19; NoncommutativeAndEquivariantIwasawa §2.7 (virtual determinant functor).

### PS.3.2 The real period–regulator trivialization

Assume the Burns–Flach real exactness hypothesis: with α : B⁺ ⊗ ℝ → t_M ⊗ ℝ induced by I, specified motivic cycle-class, regulator and height maps give the following exact sequence as a hypothesis

```text
0 → H_f⁰(M)_ℝ → ker α → H_f¹(M^∨(1))_ℝ^* → H_f¹(M)_ℝ → coker α → H_f⁰(M^∨(1))_ℝ^* → 0.
```

The ordered determinant identifications along this sequence and along 0 → ker α → B⁺_ℝ → `t_{M,ℝ}` → coker α → 0 give realTrivialization θ_∞ : Ξ_A(M)_ℝ → 1. When the regulator is an isomorphism its coordinate is a signed determinant of the regulator matrix times the comparison factors (BF, §3.2, Conjecture 1, p. 519; §3.4, pp. 526–529). Exactness and nondegeneracy, including the height pairing in weight −1, are explicit hypotheses; an arbitrary nonzero matrix is not a motivic regulator.

A-equivariance and projectivity are as in BF §3.1; the real comparison is PS.0.2.

To prove this, take the actual motivic maps and the displayed exactness as hypotheses, apply multiplicativity of determinants along both sequences, and translate to bases only after the coordinate-free map exists, keeping grading signs and real orientations.

The interface includes the following facts.

- θ_∞, built from an exact-sequence witness.
- In chosen bases, the signed period–regulator determinant.
- Changing motivic bases changes the coordinate inversely on the two sides.
- The height pairing in weight −1 and its nondegeneracy hypothesis.
- Passing from Ξ to Δ inverts the trivialization and the leading-term coordinate.

**Checks.**

- An empty regulator block has determinant 1.
- Multiplying a rank-r regulator matrix by 2 multiplies its determinant by 2^r (Mathlib `Matrix.det_smul`).
- A singular height or regulator pairing does not give an exact sequence of the required form and so gives no θ_∞.

*Needs:* Layers PS.3.1 and PS.0.4; Mathlib `Matrix.det_smul`.

### PS.3.2a Number-field regulators in the fundamental line

For every number field F of degree N = r₁ + 2r₂ and every integer j ≥ 2, let M = h⁰(Spec F)(j) and d_j = r₁ + r₂ for odd j, d_j = r₂ for even j. Prove that the real exactness hypothesis of PS.3.2 holds for M with the supplied number-field regulator, and compute θ_∞ in bases. The arithmetic inputs are imported, not reconstructed: rational localization from O_F to F and Borel's ranks (d_j is the rank of K_(2j−1)(O_F)) from ArithmeticKTheory §§3.3–3.4; the Chern-normalized regulator r_Bo, its real isomorphism and its functoriality from BorelRegulators §§2.1–2.3; the point Deligne identification and r_Bo = −2·r_Be from BorelRegulators §§6.0a–6.2; and the Adams weight from BorelRegulators §6.3.

The statement has three parts. First, H_f¹(M) = H¹_M(Spec F, ℚ(j)) is K_(2j−1)(F)^(j) ⊗ ℚ by PS.3.0, which is all of K_(2j−1)(F) ⊗ ℚ because ψ^a acts on it by a^j, and is K_(2j−1)(O_F) ⊗ ℚ by rational localization; H_f⁰(M) = 0 because K_(2j)(F) ⊗ ℚ = 0 (ArithmeticKTheory §3.4), and both motivic cohomology modules of M^∨(1) = h⁰(Spec F)(1 − j) vanish because the same comparison makes them K-groups of F in the negative degrees 2 − 2j and 1 − 2j. Second, on the real side H_dR(M) = F has Hodge type (−j, −j), so F⁰ = 0 and t_M = F; the map α : B⁺_ℝ → t_(M,ℝ) is injective, dim B⁺ = N − d_j, and coker α is (∏_σ ℂ/ℝ(j))^conj, the point Deligne cohomology H¹_D(Spec(F) ×_ℚ ℝ, ℝ(j)) that BorelRegulators §6.1 identifies with V_j(F). Third, the regulator H_f¹(M)_ℝ → coker α of PS.3.2 is r_Be ⊗ ℝ under these identifications; it is an isomorphism because r_Bo is one and r_Be = −r_Bo/2. Hence the exact sequence of PS.3.2 reduces to 0 → H_f¹(M)_ℝ → coker α → 0 with ker α = 0, θ_∞ exists, and in one ordered ℚ-basis of K_(2j−1)(O_F) ⊗ ℚ and BorelRegulators' selected embedding coordinates det r_Bo = (−2)^(d_j) · det r_Be, including the empty determinant 1 when d_j = 0 (Deligne, §3.1, pp. 13–14, for the Tate realizations; Burgos, Theorem 10.9, printed pp. 95–97, for the factor in Burgos's evaluation convention).

Rationality and integrality of the leading term for these positive twists j≥2 are the predicates of PS.3.3 and PS.5.2. PS.5.4 proves the abelian Tate case only for twists r≤0 over ℤ[1/2][G]; its coefficient, restriction and Morita transports preserve r, so that theorem supplies no positive-twist case here.

To prove this, compute the realizations of h⁰(Spec F)(j) from MotivesAndAlgebraicCycles MC.2 with the Tate scalar of PS.0.5, identify coker α with the point quotient of BorelRegulators §6.1 by taking simultaneous-conjugation invariants (2 is invertible), transport H_f¹(M) to K-theory through PS.3.0, the Adams weight and rational localization, and take determinants with the sign of BorelRegulators §6.2.

The interface includes the following facts.

- H_f¹(h⁰(Spec F)(j)) ≅ K_(2j−1)(O_F) ⊗ ℚ has dimension d_j, and the other three motivic cohomology modules of PS.3.1 are zero.
- ker α = 0, dim B⁺ + d_j = N, and coker α ≅ H¹_D(Spec(F) ×_ℚ ℝ, ℝ(j)) ≅ V_j(F).
- The regulator of PS.3.2 for M is the supplied Beilinson regulator and is a real isomorphism; hence θ_∞ exists for every F and every j ≥ 2.
- In the same ordered bases, det r_Bo = (−2)^(d_j) · det r_Be.

**Checks.**

- F = ℚ, j = 2: d₂ = 0, K₃(ℤ) ⊗ ℚ = 0, B⁺ = ℚ·(2πi)² is a line and α is an isomorphism onto t_M; the determinant ratio is the empty value 1. A rank function with r₁ + r₂ in even weight would give d₂ = 1 and contradict K₃(ℤ) ⊗ ℚ = 0.
- F = ℚ, j = 3: d₃ = 1 and B⁺ = 0. If r_Bo(x) = t on a generator x, then r_Be(x) = −t/2 and the signed ratio is −2; Burgos's evaluation of the same class is +t/2, so the factor +2 belongs to his convention, not to the shared coordinate used here.
- An imaginary quadratic F has r₁ = 0 and r₂ = 1: d₂ = d₃ = 1, dim B⁺ = 1 in both weights, and both signed ratios are −2.
- A real quadratic F has d₂ = 0 and d₃ = 2, with signed ratios 1 and (−2)² = 4; ψ² acts on its rank-two K₅ ⊗ ℚ by 8 with determinant 64, and on the zero space at j = 2 with determinant 1. Its degree-one unit rank 1 belongs to the Dirichlet regulator, outside j ≥ 2.
- Over ℚ, P₂(1) = 1 and P₂(i) = 0, so V₃(ℚ) is a line, while P₁(1) = 0 and V₂(ℚ) = 0. Projecting onto the other Tate axis exchanges these dimensions and contradicts d₂ = 0, d₃ = 1.

*Needs:* Layers PS.3.2, PS.0.2 and PS.0.5; ArithmeticKTheory §§3.3–3.4; BorelRegulators §§2.1–2.3 and 6.0a–6.3; MotivesAndAlgebraicCycles MC.2; Layer PS.3.0; [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md) (embeddings and the degree-one boundary).

### PS.3.3 Leading terms and their rationality

First define the predicted order as rr_A(H_f¹(M^∨(1))^*) − rr_A(H_f⁰(M^∨(1))^*), using the two finite projective motivic cohomology modules of PS.3.1. This definition uses no relative obstruction or ETNC predicate.

For the finite L-function with a supplied nonzero meromorphic germ at s = 0 (componentwise in the centre of A), define its order r (negative at a pole) and its leading coefficient L* = `lim_{s→0}` `s^{−r}` L_fin(M, s); for a holomorphic germ of order r ≥ 0, L* = `L^{(r)}(0)/r!.` In the commutative E case with θ_∞, define LeadingTermRational M to mean that the nonzero element θ_∞⁻¹((L*)⁻¹) of Ξ_E(M)_ℝ lies in the rational line Ξ_E(M), for the selected embedding and orientation. The Beilinson leading-term assertion is the conjunction of the predicted order just defined, this rationality and the regulator exactness of PS.3.2; it is a predicate. Rational membership says nothing about any integral lattice (BF, §4.3, Conjecture 4(i)–(iii), pp. 535–536).

The finite-value normalization is PS.1; θ_∞ is PS.3.2; the order and leading term require an actual continuation. For noncommutative coefficients use the reduced-rank, centre-valued version of PS.5.

To prove the structural statements, factor each germ as s^r times a unit, transport (L*)⁻¹ into Ξ by θ_∞ (equivalently L* into Δ), and keep rationality separate from the lattice statements of PS.4–PS.5.

The interface includes the following facts.

- The order of the nonzero meromorphic germ, Mathlib meromorphicOrderAt.
- The nonzero coefficient of s^r.
- Membership of θ_∞⁻¹((L*)⁻¹) in Ξ is membership of L* in Δ for the dual trivialization.
- Multiplying by an Euler germ of order e adds e to the order and multiplies leading coefficients.
- The predicate.

**Checks.**

- For L(s) = 3s² + O(s³): r = 2 and L* = 3, while L″(0) = 6; a definition without 1/r! fails.
- For L(s) = 2/s + O(1): r = −1 and L* = 2.
- The lattices ℤ and 2ℤ span the same rational line but give different generator statements; rationality cannot distinguish them.

*Needs:* Layers PS.1.1 and PS.3.2; Mathlib meromorphicOrderAt, iteratedDeriv.

### Examples

- `Matrix.det (2 • A) = 2^r · Matrix.det A` for an r × r real matrix A: the scaling law used by every regulator comparison.
- For ℚ(1) over ℚ: H_f¹(ℚ(1)) = ℤ^× ⊗ ℚ = 0 and H_f⁰ = 0, while H_f⁰(M^∨(1)) = ℚ has its canonical generator 1. Retaining its inverse determinant factor and trivializing it by 1 leaves the archimedean and tangent coordinates.

### Dependencies

Layers PS.0–PS.1; MotivesAndAlgebraicCycles §§4.17–4.19; MotivicEtaleKTheory §§2.2–2.4; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1; GeneralAlgebraicKTheory §§4.15–4.17, §12.11; NoncommutativeAndEquivariantIwasawa §§2.7, F.3, 7.9; ArithmeticKTheory §§3.3–3.4; BorelRegulators §§2.1–2.3, 6.0a–6.3; Layer PS.3.0; [NumberFieldArithmetic](../../Completed/NumberFieldArithmetic/README.md) (boundary).
## Layer PS.4: integral fundamental lines and local corrections

This layer puts integral structures into the rational line of Layer PS.3: the λ-adic lattice from compactly supported cohomology of a Galois-stable lattice, the exact formula for the correction a finite complex contributes, the local Euler and Tamagawa terms, and the restriction at the prime 2 forced by real places. Determinants follow TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 5: det C = ⊗_i `det(C^i)^{(−1)^i},` and an acyclic complex has a canonical trivialization under which [A --a--> A] in degrees 0, 1 has image aA and in degrees −1, 0 has image a⁻¹A.

### PS.4.1 The integral lattice in the fundamental line

Let O_λ be a coefficient discrete valuation ring of residue characteristic p with fraction field E_λ and T ⊂ V_λ(M) a Galois-stable finite free lattice. Let S contain the archimedean places, the places above p and all ramified places. Use C_ord(T) = RΓ_c,ord(O_(F,S),T) of NoncommutativeAndEquivariantIwasawa §F.3. At odd p its triangle with C_Tate(T) = RΓ_c,Tate(O_(F,S),T) of ArithmeticGaloisDuality D7 has third term T⁺[0], where T⁺ = ⊕_(v real) T^(c_v=1). The idempotents (1+c_v)/2 make T⁺ projective, so perfectness and derived base change pass through the triangle. Thus

```text
d C_ord(T) ≃ d C_Tate(T) ⊗ d(T⁺)⁻¹,
Δ_λ(T) = d C_ord(T)⁻¹ ≃ d C_Tate(T)⁻¹ ⊗ d(T⁺).
```

Assume the rational comparison θ_λ : Ξ_E(M) ⊗ E_λ ≃ d_(E_λ) C_ord(V), with its Betti-plus comparison B⁺ ⊗ E_λ ≃ V⁺. Define integralLattice I_λ(M,T,S) to be the pullback by θ_λ of d_(O_λ) C_ord(T); it is the inverse of Δ_λ(T) transported into Ξ. The real comparison is θ_∞ of PS.3.2. For a general order O ⊂ A use projective O-structures and their determinant objects; assembling Ξ_O(M) requires the coherence hypothesis of BF §3.3 or an explicit substitute (BF, §§3.2–3.4, pp. 520–529, especially §3.3 and Lemmas 5–6; BV, §4.3, (14), Conjecture 4.1).

Bounded perfectness of C_ord(T), its coefficient-base-change comparisons and the rational θ_λ are hypotheses: at odd p they use the supplied triangle; without real places C_ord = C_Tate. At p = 2 with real places require a bounded perfect model of C_ord and its comparison to the full real correction cone Cone(RΓ(F_v,T) → RΓ̂(F_v,T))[−1], retaining every two-primary term as in PS.4.4. The odd-prime expression T⁺[0] cannot replace this cone at 2. The cycle and Chern maps, p-adic de Rham comparison and integral finite conditions remain the stated supplier hypotheses (SelmerIwasawaCohomology L2).

To prove this, apply the imported determinant functor to the supplied perfect compact-support complex, then pull back along the explicit comparison θ_λ; use its quasi-isomorphism and base-change API. Use coherence only when assembling all λ into one order object.

The interface includes the following facts.

- I_λ inside the rational line, with the factor d(T⁺)⁻¹ in Ξ orientation and d(T⁺) in Δ orientation at odd p.
- A quasi-isomorphism of perfect integral models gives the same lattice, through detLine_quasiIso.
- θ_λ and θ_∞ with their different coefficient fields and orientations.
- Flat coefficient extension transports the lattice with the derived complex.
- Gluing over a global order needs the coherence hypothesis, not only all local rational spaces.

**Checks.**

- The zero complex and zero real-invariant space contribute the unit lattice O_λ, of degree 0.
- For M = ℚ(0), F = ℚ, odd p and S = {p,∞}, Ξ = d(ℚ) ⊗ d(ℚ)⁻¹ has degree 0. The global and p-local Euler characteristics are 0 and −1, so C_Tate has degree 1; subtracting the rank-one T⁺ gives deg d C_ord = 0. Its inverse also has degree 0. An uncorrected comparison would equate degrees 0 and 1.
- For the sign representation at a real place and odd p, T⁺ = 0, so both determinant correction factors are 1; with no real places the same calculation is an empty sum.
- Over a DVR, [O --π^a--> O] in degrees 0, 1 is perfect and acyclic after inverting π, and its determinant lattice is π^a·O.
- The residue field 𝔽₂ over R=ℤ₂[C₂] has infinite projective dimension: R has Krull dimension 1 while its maximal ideal (2,g−1) has cotangent dimension 2, so R is not regular (Stacks, Tag 00OC, regular-local-ring criterion). Its self-Ext¹ has dimension 2, whereas H¹(C₂,𝔽₂) has dimension 1; these are different Ext groups. Thus this finite module is not perfect and has no perfect-complex determinant.

*Needs:* Layers PS.3.1–PS.3.2; ArithmeticGaloisDuality D7 (Tate-modified cochains, finiteness and perfectness); NoncommutativeAndEquivariantIwasawa §F.3 (ordinary-real comparison and determinant correction); SelmerIwasawaCohomology L2 (Selmer groups and complexes, condition-change triangles, lattice-change cones); TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1.

### PS.4.2 The finite lattice correction

For a bounded perfect complex C over a DVR O with finite-length cohomology (so C ⊗ Frac(O) is acyclic), the determinant lattice of C under the canonical acyclic trivialization is

```text
π^{−Σ_i (−1)^i · length_O H^i(C)} · O.
```

For [O --a--> O] in degrees 0, 1 with a ≠ 0 this is aO, which equals the Fitting ideal of H¹ = O/a; shifting the complex by one inverts the lattice. A change of Galois lattice T′ ⊂ T is computed from the perfect cone RΓ_c,ord(T/T′) and its comparison triangles. Individual finite quotient corrections need not vanish; only the complete local-global balance gives the independence of the choice of lattice in BF Lemma 5 (BF, §3.4, Lemma 5 and its proof, pp. 526–528; §3.2, (24), pp. 521–522).

Bounded perfectness and finite-length cohomology are hypotheses, and the valuation formula is for a DVR. For a noncommutative order the scalar Fitting statement is replaced by the relative determinant class of PS.5; no scalar formula is asserted there.

Unlike the supplied characteristic-divisor statement over an Iwasawa algebra, the target here is its finite-length DVR specialization together with the arithmetic Galois-lattice change. To prove this, specialize the PadicMeasuresIwasawaAlgebras §5.1 rational trivialization and characteristic-divisor statement to a DVR (the characteristic ideal of a finite-length module is `π^{length}),` reduce to two-term multiplication complexes, and use the specified cone of the quotient complex for lattice changes. All determinant maps use these cone presentations or termwise exact sequences, with their coherence; arbitrary naturality for all triangulated-category morphisms is not asserted (BF Remark 1, p. 508). The determinant of SelmerIwasawaCohomology L3 (Selmer determinant) uses the inverse line; its exponent is inverted before comparison.

The interface includes the following facts.

- The integer −Σ_i (−1)^i length H^i(C).
- The displayed formula.
- [O --a--> O] in degrees 0, 1 gives aO, equal to the Fitting ideal of H¹.
- Shift inverts the lattice.
- The cone formula for T′ ⊂ T.

**Checks.**

- [O --π³--> O] in degrees 0, 1 gives π³O, and its shift (degrees −1, 0) gives π⁻³O.
- A finite H¹ = O/π contributes +1 to the exponent of the lattice, not −1.
- A unit differential gives O; a zero differential is excluded, since the complex is then not acyclic after inverting π.

*Needs:* Layer PS.4.1; TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 (rational trivialization and characteristic divisor); ArithmeticGaloisDuality D7 (derived tensor and Tor); SelmerIwasawaCohomology L3 (Selmer determinant).

### PS.4.3 Local Euler and Tamagawa corrections

For a place v ∤ p, the finite local complex RΓ_f(F_v,V), with its triangle RΓ_f → RΓ → RΓ_/f, is quasi-isomorphic to `[V^{I_v}` --(1 − Fr_v)--> `V^{I_v}]` in degrees 0, 1. When 1 − Fr_v is invertible, its acyclic determinant factor is P_v(1) while the local L-value is P_v(1)⁻¹. For v | p use the crystalline finite complex, the tangent quotient t_v and the 1 − φ comparison triangle of BF (22)–(23), not the formula for v ∤ p. Integral kernel and cokernel indices are transported through the local finite-condition complex; for elliptic curves the resulting component-group factor is the Néron Tamagawa number c_v of TauCetiRoadmap EllipticCurves Layer 4, for the chosen minimal model and differential. A vanishing local Euler factor keeps its cohomology and its leading-order correction (AutomorphicLFunctionsAndLocalFactors AL.5) instead of being cancelled (BF, §3.2, (19)–(24), pp. 520–522).

Integral finite-condition compatibility (SelmerIwasawaCohomology L4, the Bloch–Kato condition) and the relevant p-adic comparison are hypotheses for the selected representation.

To prove this, use the local finite/singular triangles and their determinant maps; compare the acyclic trivialization with termwise cancellation, which differ by det(1 − Fr) or det(1 − φ); identify arithmetic local factors through integral cone lengths and the component-group comparison.

The interface includes the following facts.

- For RΓ_f at v ∤ p, when acyclic, the factor is P_v(1).
- The v | p version with t_v.
- Identification with c_v.
- The vanishing-factor case keeps the cohomology.

**Checks.**

- For an unramified rank-one eigenvalue α ≠ 1, the determinant contribution is 1 − α, the inverse of the local L-value (1 − α)⁻¹.
- For α = 1 the two-term finite complex has nonzero cohomology and the acyclic formula is unavailable.
- For v=ℓ≠p and V=ℚ_p(1), geometric Frobenius has eigenvalue ℓ⁻¹, so RΓ_f is acyclic because 1−ℓ⁻¹≠0. Full local cohomology has dim H¹=dim H²=1 by Kummer theory and local duality; replacing RΓ by this finite complex loses both groups.
- At v | p, omitting the tangent quotient breaks the Bloch–Kato comparison triangle: for V = ℚ_p(1) over ℚ_p, dim H¹_f = 1 = dim H⁰ + dim t_V with H⁰ = 0 and t_V one-dimensional, whereas the triangle without t_V predicts 0.

*Needs:* Layers PS.4.2 and PS.1.1; SelmerIwasawaCohomology L2 and L4 (Bloch–Kato condition); AutomorphicLFunctionsAndLocalFactors AL.5; TauCetiRoadmap EllipticCurves Layer 4.

### PS.4.4 The real dyadic restriction

At a real place and p = 2, the duality complex C_Tate involves the complete Tate cochains of C₂ = Gal(ℂ/ℝ) (ArithmeticGaloisDuality D7, compact support with the real places and the places above p in S). For a torsion-free O₂-lattice with trivial action, the Tate cohomology is `Ĥ^{2k}(C₂,` O₂) = O₂/2O₂ and `Ĥ^{2k+1}` = 0; for the sign action the parities are exchanged. This complete complex is unbounded and is not assigned a perfect determinant by deleting its tails. The ordinary-real model C_ord instead uses ordinary real cochains, related to C_Tate by the full correction cone of NoncommutativeAndEquivariantIwasawa §F.3. Ordinary cochains on the trivial dyadic lattice have H⁰ = O₂, positive even cohomology O₂/2O₂ and odd cohomology zero. Thus the cone is not just T⁺[0] at 2. Integral statements in Layers PS.4–PS.6 require bounded perfect C_ord, for p odd or without real places, or a supplied bounded perfect model with a proved comparison retaining the full two-primary correction. Inverting 2 recovers the bounded comparison and proves no integral statement at 2 (BF, §3.2, pp. 522–523; §3.3, pp. 524–525).

ArithmeticGaloisDuality supplies the unbounded real complex and its duality. No bounded perfect real dyadic replacement is assumed for arbitrary coefficients.

To prove the computation, write the complete two-periodic complex with alternating norm and difference maps and compute its cohomology; its nonzero recurring groups exclude bounded perfectness.

The interface includes the following facts.

- Even degrees O₂/2, odd degrees 0.
- The parities exchanged.
- The complete complex has nonzero cohomology in infinitely many degrees.

**Checks.**

- Trivial ℤ₂: even Tate groups ℤ/2, odd Tate groups 0.
- The sign lattice exchanges the parity.
- Tensoring the complete Tate complex with ℚ₂ kills its cohomology, while ordinary real cochains retain H⁰ = ℚ₂. Thus the rational comparison still has the plus line; vanishing of rational Tate groups does not remove it.
- For trivial ℤ₂, the correction cone has H⁰ = 2ℤ₂ and H^(−1) = H^(−3) = ⋯ = ℤ/2; its map to H⁰(ℝ,ℤ₂) is the index-two inclusion. Replacing it by an unmarked copy of ℤ₂ loses length 1, even though both rationalizations are ℚ₂.

*Needs:* ArithmeticGaloisDuality D7 (complete real Tate cochains and duality); NoncommutativeAndEquivariantIwasawa §F.3 (ordinary-real cochains and the full comparison cone).

### Examples

- [ℤ_p --p²--> ℤ_p] in degrees 0, 1: H¹ = ℤ/p², lattice p²ℤ_p; in degrees −1, 0: lattice p⁻²ℤ_p.
- For E/ℚ with split multiplicative reduction of type I_n at ℓ ≠ p, the local Tamagawa contribution is c_ℓ = n (EllipticCurves Layer 4); nonsplit gives gcd(2, n).

### Dependencies

Layers PS.1, PS.3; ArithmeticGaloisDuality D7; NoncommutativeAndEquivariantIwasawa §F.3; SelmerIwasawaCohomology L2–L4; AutomorphicLFunctionsAndLocalFactors AL.5; TauCetiRoadmap PadicMeasuresIwasawaAlgebras Layer 5; TauCetiRoadmap EllipticCurves Layer 4.
## Layer PS.5: equivariant Tamagawa-number statements

This layer states the equivariant Tamagawa number conjecture of Burns and Flach in the relative K-group where it lives, with its extended boundary map and sign, compares it with the Fukaya–Kato zeta-isomorphism orientation, and transports proved cases. Coefficient algebras are finite-dimensional semisimple ℚ-algebras A with orders O; reduced norms of A are those of TauCetiRoadmap ClassicalArithmeticCompletion §7.10, built from the Azumaya reduced norms of IntegralHeckeAndGaloisDeterminants §0.6, and relative K-groups are those of GeneralAlgebraicKTheory §§4.15–4.17.

### PS.5.1 The equivariant Tamagawa obstruction

Let A be a finite-dimensional semisimple ℚ-algebra with centre ζ(A), O ⊂ A an order, and M a motive with a projective O-structure. Under the finiteness, real exactness (PS.3.2) and coherence (PS.4.1) hypotheses, form cohomologicalObstruction RΩ(M, O) = [Ξ_O(M), θ_∞], the class in the relative group K₀(O, ℝ) of the integral fundamental object with its real trivialization; it lies in the locally free class subgroup Cl(O, ℝ). Define the extended boundary extendedBoundary δ̂ : ζ(A_ℝ)^× → K₀(O, ℝ) of BF Lemma 9: it extends ∂ ∘ Nrd⁻¹ from the reduced norms Nrd(K₁(A_ℝ)), with ∂ : K₁(A_ℝ) → K₀(O, ℝ) the boundary of GeneralAlgebraicKTheory §§4.16–4.17. For x ∈ ζ(A_ℝ)^× one chooses a rational central multiplier λ ∈ ζ(A)^× such that λx is a reduced norm — possible because the reduced-norm image is described by positivity at the real places where a component ramifies (the Hasse–Schilling–Maass theorem, TauCetiRoadmap ClassicalArithmeticCompletion §7.60) — and sets δ̂(x) = ∂_ℝ(Nrd_ℝ⁻¹(λx)) − Σ_p ι_p ∂_p(Nrd_p⁻¹(λ)). Here ∂_p is viewed in its image, canonically K₁(A_p)/im K₁(O_p), and ι_p is the inclusion of this summand through Cl(O, ℚ) into Cl(O, ℝ) in BF §2.9, (14)–(15). For an arbitrary noncommutative order, no map on the whole group K₀(O_p, A_p) is asserted. The identification with that whole group requires additional hypotheses, as in BF §2.9. Reduced norm is surjective at finite primes, so the finite-prime terms exist even when λ is not a global or real reduced norm; almost all are zero because λ and its inverse are integral units there. The global rational norm comparison in BF diagram (14) proves independence of λ. This construction requires the finite-prime gluing maps, in addition to the ordinary relative boundary. With L* ∈ ζ(A_ℝ)^× the leading term of PS.3.3, define tamagawaObstruction TΩ(M, O) = δ̂(L*) + RΩ(M, O) (BF, §4.2, Lemma 9, pp. 534–535; Conjecture 4, pp. 535–536; §3.4 for Ξ_O).

The hypotheses are: projective O-structures and global coherence for the chosen order, or an explicitly substituted local formulation (BF Conjectures 5 and 6); L* has nonzero components and the reality needed to lie in ζ(A_ℝ)^×; and, for the actual A, the reduced norm on K₁(A) and K₁(A_ℝ) with the real quaternionic positivity constraint. Scalar units alone do not define the equivariant class, and the ordinary noncommutative K₁, reduced-norm and SK₁ data are imported.

Construct the finite-prime adapter finiteBoundaryGluing for an arbitrary ℤ-order O in A; no hereditary or maximal-order hypothesis is imposed. Use right modules for the matrix construction below; the left-module convention is transported by opposite rings. Put O_p=ℤ_p⊗O, A_p=ℚ_p⊗A, and

```text
Cl(O,K) = ker(K₀(O,A_K) → ∏_p K₀(O_p)),       K=ℚ or ℝ.
```

The map to each local K₀ is the source-minus-target projective-module class. The relative fibre-product description in BF §2.8, Proposition 2.5, pp.514–515, identifies a virtual determinant with a scalar trivialization with the ordinary relative triple class. This is the categorical bridge needed for [Ξ_O,θ_∞], with Ξ_O in the virtual-object category of PS.3.1. A Picard object is not itself a projective complex to which the triple presentation may simply be applied.

For the arithmetic gluing, a finitely supported family represented by g_p∈GL_m(A_p), after stabilization to a common m, patches to

```text
P = {v∈A^m : v belongs to g_p O_p^m for every p}.
```

Outside the support take g_p=1. Bound the finitely many denominator lattices above and below by rational multiples of O^m. The Chinese remainder theorem identifies the p-completion of this intersection with g_p O_p^m. Thus P is a full finite O-lattice and is locally free at every p; the local projectivity criterion over the finite ℤ-algebra O makes it projective. Prove as part of this construction that for every ℤ-order O in a semisimple ℚ-algebra and every finite O-lattice P, projectivity follows when every completion P⊗ℤ_p is projective over O⊗ℤ_p. Finite presentation follows from O being finite over the noetherian ring ℤ; localize at each central prime and use faithful flatness of ℤ_(p)→ℤ_p to descend flatness, then use finite presentation to recover projectivity. This gives the needed general local criterion, including nonmaximal orders. The triple [P,id,O^m] has local boundary ∂_p(g_p), using g_p to identify its source lattice with O_p^m. Changing g_p by an integral invertible matrix or stabilizing does not change that class. Direct sums realize addition. For the Whitehead relation, approximate the finitely many coefficients of local elementary matrices by coefficients in A integral outside the finite support. Chinese remainder approximation makes the remaining local factors integral invertible; a global elementary automorphism has zero boundary. This proves descent through the elementary relations, not merely through a choice of matrix representatives. Conversely a locally free relative triple can, after adding a common projective complement to make its target free, be locally trivialized in this form; the same intersection construction recovers it. The same elementary approximation applied to a locally zero triple proves injectivity. This gives

```text
Cl(O,ℚ) ≅ ⊕_p K₁(A_p)/im K₁(O_p),
ι_p : K₁(A_p)/im K₁(O_p) → Cl(O,ℚ) → Cl(O,ℝ).
```

These are BF §2.9 (12)–(15), pp.516–517. The inclusion into the real relative group uses the rational-to-real map in (12); its injectivity is part of that cited comparison. Keep the ordinary local relative groups and their maps separate: no identification of all K₀(O_p,A_p) with this boundary quotient is used. The construction is natural under extending scalars and compatible with the diagonal image of K₁(A). In particular, the real boundary of a rational automorphism equals the sum of the glued finite boundaries.

To prove multiplier independence in δ̂, two choices λ,μ have ratio μ/λ positive at the ramified real components, hence in the global reduced-norm image by ClassicalArithmeticCompletion §7.60. Apply the preceding diagonal compatibility to a K₁(A) preimage of μ/λ. The changes in the real term and the finite sum are equal and cancel. This proves independence without falsely requiring either λ or μ individually to be a global norm. Multiplicativity follows by choosing the product multiplier. Finally use the BF §2.8 fibre-product bridge to form RΩ from Ξ_O and θ_∞, then add δ̂(L*) with the plus sign. The gluing construction is independent of, and does not replace, the virtual-object category used for Ξ_O in PS.3.1.

The interface includes the following facts.

- The direct-sum isomorphism above.
- Completion recovers the specified boundary class.
- The real boundary of a global rational automorphism equals the sum of its finite corrections.
- Extension of scalars transports the patched relative class.
- RΩ = [Ξ_O, θ_∞] in Cl(O, ℝ).
- The extended boundary δ̂ on ζ(A_ℝ)^× is independent of its rational multiplier.
- TΩ = δ̂(L*) + RΩ.
- Change of order or coefficient algebra transports the whole class, not only its characters.
- For commutative O, vanishing is the statement that θ_∞ carries Ξ_O to (L*)⁻¹O.

**Checks.**

- In the scalar relative group K₀(ℤ, ℝ), the boundary of 2 has 2-adic valuation 1. A regulator class with valuation −1 cancels it in δ̂(L*) + RΩ; subtracting that class instead gives valuation 2 and does not vanish.
- In a Hamilton-quaternion component a negative real scalar is not a reduced norm (Nrd(ℍ^×) = `ℝ_{>0});` δ̂ still applies to it through the rational sign correction λ = −1.
- In the same scalar example, the unit −1 has zero boundary while 2 has nonzero boundary. Declaring every rational central scalar to have zero relative class would erase the finite-prime correction and fail this test.
- Empty support patches P=O^m and gives zero relative class; m=0 gives the same unit case. For O=ℤ and g₂=2, g_p=1 otherwise, the intersection is 2ℤ and [2ℤ,id,ℤ] has 2-adic valuation +1. Replacing 2 by 1/2 gives −1. This tests the source/target direction of gluing.
- For scalar x=3, multiplier 1 gives ∂ℝ(3). Multiplier 2 gives ∂ℝ(6)−ι₂∂₂(2); its valuation at 2 is 1−1=0 and at 3 is 1. Omitting the finite correction, or adding it, gives respectively 1 or 2 at 2 and fails multiplier independence.
- A representative g_p∈GL_m(O_p) contributes zero. This tests descent through im K₁(O_p), while allowing nonmaximal orders and retaining the kernel defining Cl.

*Needs:* Layers PS.4.1, PS.3.1 and PS.3.3; GeneralAlgebraicKTheory §§4.15–4.17 (relative triples, stable automorphism boundary, five-term sequence), with the virtual objects of PS.3.1; IntegralHeckeAndGaloisDeterminants §0.6 (Azumaya reduced-norm determinant); TauCetiRoadmap ClassicalArithmeticCompletion §7.10 and §7.60 (reduced norms and their images); Mathlib `Ideal.quotientInfRingEquivPiQuotient`; the integral-lattice completion and local-projectivity constructions in this subsection.

### PS.5.2 The equivariant Tamagawa number conjecture as a predicate

With the data of PS.5.1, define the predicate ETNC(M, O) as the conjunction of four separate propositions: (i) continuation of L_A(M, s) to s = 0; (ii) the componentwise order ord_(s=0) L_A(M, s) equals the predicted order of PS.3.3, namely rr_A(H_f¹(M^∨(1))^*) − rr_A(H_f⁰(M^∨(1))^*), with rr_A the reduced rank; (iii) rationality, TΩ(M, O) ∈ Cl(O, ℚ) ⊂ Cl(O, ℝ); (iv) integrality, TΩ(M, O) = 0. Localized variants specify O[1/S] or O_λ and the induced relative class. The four parts are stored separately, so that a proof of the order or of rationality is never read as integrality. A theorem carries its exact motive, order and primes (BF, Conjecture 4(i)–(iv), pp. 535–536; Conjectures 5–6, pp. 536–537).

The coherence, projective structure and real regulator hypotheses of BF Conjecture 4 are part of the data; all centre components and reduced ranks are retained.

To prove the structural statements, use the centre-valued order and leading coefficient, the two target subgroups of the imported relative K-theory, and the localization maps; converses are not asserted.

The interface includes the following facts.

- Continuation and the predicted order.
- Rationality places the obstruction in Cl(O,ℚ).
- Integrality is vanishing of the full obstruction.
- The global equality implies each localized equality.
- For one commutative component, θ_∞(Ξ_O) = (L*)⁻¹O, equivalently a Fukaya–Kato generator ζ with value L*.

**Checks.**

- A nonzero rational relative class satisfies (iii) and fails (iv).
- An equality over ℤ[1/2][G] says nothing about the ℤ₂[G] component.
- Both H_f¹(M^∨(1))^* and H_f⁰(M^∨(1))^* enter the predicted order. For M = ℚ(1), so that L(M, s) = ζ(s + 1), M^∨(1) = ℚ(0) has H_f¹ = 0 and H_f⁰ = ℚ, and the predicted order is −1, the simple pole of ζ at 1; deleting the second term predicts 0.

*Needs:* Layer PS.5.1.

### PS.5.3 The zeta-isomorphism orientation

Import the Fukaya–Kato zeta isomorphism from NoncommutativeAndEquivariantIwasawa NE.7, not a second definition: ζ_Λ(T) : 1_Λ → d_Λ RΓ_c,ord(U, T)⁻¹, with T = Λ `⊗_{ℤ_p}` T_p and g(x ⊗ y) = x ḡ⁻¹ ⊗ g(y). Under specialization at a motivic representation ρ, use the dual twist M(ρ^*) and the generalized base change of NE.7. With Δ = Ξ⁻¹, ζ_E : 1 → Δ satisfies `θ_{∞,FK}(ζ_E)` = L*, while the dual of θ_λ identifies Δ ⊗ E_λ with d RΓ_c,ord(V)⁻¹ = d RΓ_c,Tate(V)⁻¹ ⊗ d(V⁺) at odd p. This last factor is identified with d(B⁺) by the Betti-plus comparison; the integral target Δ_λ(T) uses the same ordinary-real complex. Prove that these identifications give the BF vanishing TΩ = 0 of PS.5.2 with its sign. Local epsilon isomorphisms and duality are additional imported data. This finite-level comparison does not by itself define the normalized Iwasawa leading term of Burns–Venjakob: their pair [C, a] needs a : 1 → d(C), whereas ζ has target d(C)⁻¹. NE.7 supplies C′ = RΓ_c,ord[1], with d(C′) ≅ d RΓ_c,ord⁻¹, the transported map a = ζ : 1 → d(C′), its Bockstein trivialization, order −m, boundary +[RΓ_c,ord] and normalization `c_γ^{−m};` the BV interpolation identities are used only through that contract, and simply inverting ζ is not a substitute (BV, §4.3, Conjecture 4.1, published pp. 187–188, (17)–(18); Definition 2.5, pp. 170–171; Definition 3.7, p. 177; Remark 5.6, pp. 194–195).

The prime p is odd in the BV and NE.7 formulation, and all NE.7 perfectness and base-change hypotheses are assumed.

To prove this, match each factor of Δ with the inverse BF object, then the real and p-adic trivializations; check the diagonal Galois action and the appearance of ρ^* rather than ρ.

The interface includes the following facts.

- The target is d RΓ_c,ord⁻¹, retaining d(T⁺) in its odd-prime Tate-modified presentation.
- Specialization lands in M(ρ^*).
- In the commutative finite-level case, existence of ζ with θ_∞(ζ) = L* is TΩ = 0 in BF orientation.

**Checks.**

- For C = [ℤ₃ --3--> ℤ₃] in degrees 0, 1, the acyclic trivialization gives d(C) the lattice 3ℤ₃ and d(C)⁻¹ the lattice 3⁻¹ℤ₃, which is also the lattice of d(C[1]); a target d(C) instead of d(C)⁻¹ changes the 3-adic valuation of a generator from −1 to +1.
- For G = C₃ = ⟨g⟩ and ρ = χ with χ(g) = ω a primitive cube root of unity, ρ^*(g) = ω² ≠ ω, so specialization at M(ρ^*) and at M(ρ) see different characters; the diagonal action multiplies the Iwasawa factor by ḡ⁻¹, which ρ sends to ω² as well.
- If ζ generates Δ_ℤ with θ_(∞,FK)(ζ) = 3, then Ξ_ℤ = Δ_ℤ⁻¹ has θ_∞(Ξ_ℤ) = 3⁻¹ℤ, so RΩ has 3-adic valuation −1 and δ̂(3) has +1, and TΩ has valuation 0; reading ζ as a generator of Ξ_ℤ instead gives the lattice 3ℤ and valuation 2.
- For ℚ(0) over ℚ at odd p, deg d RΓ_c,Tate⁻¹ = −1 and deg d(T⁺) = 1; their product, d RΓ_c,ord⁻¹, has degree 0, as required for an arrow from 1. Shifting C_ord gives degree 0 again, whereas the uncorrected inverse has degree −1.
- The unshifted pair [RΓ_c,ord, ζ] is rejected when ζ has inverse-determinant target; no untyped composition supplies a normalized leading term.

*Needs:* Layers PS.5.2 and PS.3.1; NoncommutativeAndEquivariantIwasawa NE.7 (Fukaya–Kato zeta isomorphism, local epsilon isomorphism, and the shifted determinant comparison).

### PS.5.4 Transport of proved cases

For any supplied proved case of ETNC, transport the full relative class through BF Theorems 3.1 and 4.1 (change of coefficient algebra, restriction, and the matrix Morita case over a commutative coefficient algebra), recording the motive, order, localization and reduced-norm ambiguity. State abelianTate_ETNC: for L/ℚ finite abelian with G = Gal(L/ℚ) and every integer r ≤ 0, ETNC(iv) holds for the pair (h⁰(Spec L)(r), ℤ[1/2][G]) (Burns–Greither (BG), as recorded in BF Remark 10, p. 537); for K ⊂ L the pair with ℤ[1/2][Gal(L/K)] follows by restriction, since ℤ[1/2][G] is free over ℤ[1/2][Gal(L/K)] (BF Theorem 3.1(b), p. 531, extended to TΩ by Theorem 4.1, p. 539). The proof descends, at each odd p, the integral determinant main conjecture of IntegralIwasawaTheory §11.7 for the maximal totally real subfield, and the §11.1 twist for the CM part, to finite level by derived base change, with the leading-term and trivial-zero analysis of BG, and identifies the result with the λ-adic lattice of PS.4.1, the leading term of PS.3.3 and the relative class of PS.5.1. It is never inferred from Dirichlet algebraicity, and the dyadic component is not claimed. BV Theorem 5.5 (Tate motive interpolation) is a conditional comparison under the NE.7 contract: p odd, a totally real p-adic Lie extension, the finite Galois field E/ℚ, the global and local cyclotomic-disjointness conditions, the p-adic Stark assumption, the existence of ζ, and the shifted determinant comparison of PS.5.3. For BV Corollary 5.7 keep the restriction to ℚ-valued characters of the published version, Leopoldt's conjecture and the exponent n_ρ; permutation characters have n_ρ = 1. No Artin, dyadic or noncommutative ETNC beyond these is deduced (BF, Theorem 3.1, p. 531, and Theorem 4.1, p. 539, with proofs pp. 531–533 and 539–541; Remark 10, p. 537; BV, published Theorem 5.5, p. 193, Remark 5.6, pp. 194–196, and Corollary 5.7, p. 196).

An annihilator or Fitting-ideal theorem does not give a relative determinant equality without the integral Iwasawa comparison. Restriction requires projectivity over the smaller algebra or order; the cited Morita case is A commutative and B = M_n(A), with the matrix idempotent and projective lattices; an arbitrary Morita equivalence is not inferred from BF Theorem 3.1(c). A p-adic regulator is an isomorphism only under its nonvanishing (Leopoldt) hypothesis.

To prove this, import each arithmetic theorem with its exact statement, compare determinant orientation, order and localization, transport the class with BF functoriality keeping any kernel, and apply the BV identity only with its full hypotheses and the PS.5.3 contract.

The interface includes the following facts.

- BF functoriality.
- The Burns–Greither case over ℤ[1/2][G], descended from IntegralIwasawaTheory §11.7.
- BV Theorem 5.5 under its hypotheses.

**Checks.**

- For r = 0 in the abelian Tate family the order is ℤ[1/2][G]; nothing is claimed for the dyadic component.
- For a permutation character the exponent n_ρ is 1; a general ℚ-valued character may give only an n_ρ-th power identity.
- An SK₁ ambiguity is not removed by comparing scalar Artin values.
- The sign character of C₂ is the regular permutation character minus the trivial one, but is not itself a permutation character (its value at the generator is −1, while fixed-point counts are nonnegative); n_ρ = 1 for an integral combination does not characterize permutation characters.

*Needs:* Layers PS.5.3, PS.4.1 and PS.3.3; IntegralIwasawaTheory §11.1 and §11.7 (integral determinant main conjecture); NoncommutativeAndEquivariantIwasawa NE.7 (Tate motive interpolation and its rational version).

### Examples

- For commutative A = E and O = O_E, TΩ(M, O) = 0 is the statement θ_∞(Ξ_O(M)) = (L*)⁻¹·O: one lattice generator, not a class in a relative K-group.
- For A the rational Hamilton quaternions, x = −1 ∈ ζ(A_ℝ)^× = ℝ^× is not a reduced norm (Nrd(ℍ^×) = `ℝ_{>0}),` while λ = −1 ∈ ℚ^× makes λx = 1 a reduced norm; δ̂(−1) is computed through this rational correction.

### Dependencies

Layers PS.3–PS.4; GeneralAlgebraicKTheory Layer 4; IntegralHeckeAndGaloisDeterminants §0.6; TauCetiRoadmap ClassicalArithmeticCompletion §§7.10, 7.60; NoncommutativeAndEquivariantIwasawa NE.7; IntegralIwasawaTheory Layer 11.
## Layer PS.6: Bloch–Kato and Birch–Swinnerton-Dyer assembly

This layer states the Tamagawa number conjecture in Bloch and Kato's original form, with every object built (motivic pairs, local and global points, the Tamagawa measure, Sha), identifies the fundamental-line statement of Layer PS.4 with the Birch–Swinnerton-Dyer formula for elliptic curves over ℚ, transports rank-zero and rank-one arithmetic witnesses with all their prime hypotheses, and states the Beilinson–Bloch–Kato rank prediction for Rankin–Selberg motives with conditional transport of arithmetic witnesses.

### PS.6.1 Bloch–Kato motivic pairs

A Bloch–Kato motivic pair over ℚ consists of finite-dimensional ℚ-vector spaces V and D, a continuous action of the absolute Galois group on V ⊗ 𝔸_f preserving V under the selected real conjugation, a decreasing exhaustive separated filtration (D^i) on D, and filtered comparisons D ⊗ ℚ_p ≃ D_dR(V_p) and D ⊗ ℝ ≃ (V ⊗ ℂ)^+ for the diagonal real action, subject to the four axioms of BK Definition 5.5: (P1) outside finitely many p, every V_ℓ with ℓ ≠ p is unramified at p and V_p is crystalline; (P2) for all rational lattices T ⊂ V and L ⊂ D, outside a finite set of p depending on T and L, the filtered crystalline module has integers i ≤ 0 < j with D^i = D, D^j = 0 and j − i < p, L ⊗ ℤ_p is strongly divisible, and its Fontaine–Laffaille realization is T ⊗ ℤ_p; (P3) for every p, all local polynomials P_p(V_ℓ, u), including the crystalline one at ℓ = p, have coefficients in ℚ and coincide; (P4) at every p there is a stable adelic lattice whose unramified H⁰ with ℓ-primary divisible coefficients is divisible for almost all ℓ. The pair has weight ≤ w when all local reciprocal roots have absolute value ≤ `p^{w/2}` and D_∞^i ∩ V_∞^+ = 0 for i > w/2. For a pair of weight ≤ −3, a motivic triple adds a finite-dimensional ℚ-space Φ with isomorphisms R_∞ : Φ ⊗ ℝ ≃ D_∞/(D_∞⁰ + V_∞^+) and R_Gal : Φ ⊗ 𝔸_f ≃ `H¹_{f,Spec ℤ}(ℚ,` V ⊗ 𝔸_f) (BK, p. 374). In pure weight −1 the two dimension counts are incompatible with a nonzero finite Selmer space: D_∞⁰ ∩ V_∞^+ = 0 and dim D_∞⁰ + dim V_∞^+ = dim D_∞, so R_∞ forces Φ = 0 and R_Gal then forces H¹_f = 0. Being induced by a geometric motive is the additional identification of these data with realizations and regulators of an actual motive (MotivesAndAlgebraicCycles MC.2, with the actual regulator identifications as explicit data), never a consequence of the axioms (Bloch–Kato (BK), Definition 5.5 and 5.5.1, pp. 371–372; triple comparisons, p. 374; Theorem 4.1(iii), p. 362).

The Galois representations, period modules and small-weight crystalline realization are imported (FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P3, R07.P5 for period sequences and realizations; SelmerIwasawaCohomology §4.7 for the small-weight comparison). The Bloch–Kato finite Selmer cohomology is the condition finite at every finite place (SelmerIwasawaCohomology L2, L4). No geometric P3 or P4 and no regulator bijectivity is inserted silently.

To prove the structural statements, assemble the comparisons and the four axioms on actual supplied objects, import the small-weight realization for P2 (the finite exceptional set depends on both lattices), and keep geometric origin separate.

The interface includes the following facts.

- The structure, exposing V, D, the filtration, all coefficient actions and the comparison maps.
- The four axioms separately, with P2 quantified over lattices and P3 over all primes.
- The weight bound is the local-root and real-filtration condition stated above.
- Adding Φ, R_∞ and R_Gal.
- The identification with an actual motive.

**Checks.**

- In a rank-one Tate comparison, replacing the de Rham lattice L by qL while fixing the Betti lattice T forces q into the P2 exceptional set; one finite set cannot serve all lattice changes.
- Agreement of P_p(V_ℓ) only for ℓ ≠ p fails P3 unless the crystalline factor at p also matches.
- The unit pair ℚ(0) has V_∞^+ ≠ 0 and D_∞⁰ = D_∞, so it fails weight ≤ −3 at i = 0.
- For E : y² = x³ − 2, P = (3, 5) has 2P with x-coordinate 129/100, which is not integral, so P has infinite order (Nagell–Lutz). For h¹(E)(1), of weight −1, D_∞ has dimension 2 and D_∞⁰ and V_∞^+ are complementary lines, so D_∞/(D_∞⁰ + V_∞^+) = 0, while the Kummer map puts E(ℚ) ⊗ ℚ_p ≠ 0 into H¹_f(ℚ, V_p) (BK Proposition 5.4). No triple exists for this pair.

*Needs:* MotivesAndAlgebraicCycles MC.2 (realization equivalence); the explicit regulator comparisons of the triple; SelmerIwasawaCohomology L2 (Galois Selmer groups) and §§4.7, 4.9 (small-weight comparison and finite condition); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P3, R07.P5 (period sequences and realizations).

### PS.6.2 Bloch–Kato points, the Tamagawa measure and Sha

For a motivic pair of weight ≤ −1 and a stable lattice T, define local points A_T(ℚ_p) = H¹_f(ℚ_p, T ⊗ ℤ̂) for finite p and A_T(ℝ) = ((D_∞ ⊗ ℂ)/(D_∞⁰ ⊗ ℂ + T))^+ for the diagonal real action. For a triple of weight ≤ −3 (PS.6.1) define global points A_T(ℚ) as the inverse image of R_Gal(Φ) in `H¹_{f,Spec ℤ}(ℚ,` T ⊗ ℤ̂); its rationalization is Φ and its profinite completion is the integral finite Selmer group, under the given triple comparisons. The rational Bloch–Kato exponential has domain D_p/D_p⁰ and target H¹_f(ℚ_p,V_p). Choose an open neighborhood U of zero on which it lifts to the integral local points A_T(ℚ_p); the lift is an isomorphism onto an open subgroup. Transport the measure defined by a rational nonzero top form ω ∈ det(D/D⁰)^* on this neighborhood and extend by translation. Restricting to a common smaller neighborhood proves independence of U; at all sufficiently good p the total mass is P_p(V, 1). For weight ≤ −3 the product of these masses converges; define the Tamagawa measure μ as the product of the finitely many bad and real measures with the probability product over good primes, rescaled by ∏ P_p(V, 1). Since `μ_{p,aω}` = |a|_p `μ_{p,ω},` the product formula makes μ independent of ω. A lift of the real regulator A_T(ℚ) → A_T(ℝ)/A_T(ℝ)_cpt defines the diagonal arithmetic subgroup, whose real image is discrete and cocompact; set Tam(T) to the induced volume of `∏_{p ≤ ∞}` A_T(ℚ_p)/A_T(ℚ), independent of the lift. Finally

```text
Sha(T) = ker[ H¹(ℚ, T ⊗ ℚ/ℤ)/(A_T(ℚ) ⊗ ℚ/ℤ) → ⊕_{p ≤ ∞} H¹(ℚ_p, T ⊗ ℚ/ℤ)/(A_T(ℚ_p) ⊗ ℚ/ℤ) ],
```

Bloch and Kato's arithmetic kernel, not an arbitrary finite group (BK, (5.6)–(5.8), pp. 372–373; Definition 5.9 and the global points, pp. 373–374; Lemma 5.10, (5.11)–(5.13) and Proposition 5.14, pp. 375–376).

For weight ≤ −1 assume in addition that the Euler-product L_S(V,s) has a meromorphic continuation to Re(s)>−ε, for some ε>0, required in BK (5.9.1), and a nonzero meromorphic germ at zero. Put r=ord₀ L_S and C_S=|lim_(s→0) s^r L_S(V,s)⁻¹|. Define the regularized measure

```text
μ = C_S · (⊗_(v∈S) μ_(v,ω)) ⊗ (⊗_(p∉S) P_p(V,1)⁻¹ μ_(p,ω)),
```

where S contains infinity and every exceptional prime of the good-mass formula. Every factor outside S is a probability measure; weight ≤ −1 makes P_p(V,1)>0 since every real reciprocal root is <1 and nonreal roots pair by conjugation. Prove agreement with the absolutely convergent measure in weight ≤ −3 and independence of S, of ω and of the local exponential neighborhood (BK (5.9.1), p. 374). The global quotient and Tam(T) are formed only for triples, hence in weight ≤ −3; in weight −1 the regularized local measures supply the local normalizations of the determinant formulation of PS.6.3, which keeps the Mordell–Weil space and its height pairing instead of a discrete quotient by a global point group. Enlarging S by p replaces C_S by C_S/P_p(V,1), while the newly unnormalized p-factor replaces its probability measure by P_p(V,1) times it; the two changes cancel.

The cohomology groups, local exponential maps and their topologies are the suppliers' (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 for period fundamental sequences and SelmerIwasawaCohomology §§2.9, 4.9 for the finite condition). Every Haar measure uses its Borel structure and local compactness (Mathlib MeasureTheory.Measure.haarMeasure); the good factors are normalized to probability measures before Mathlib MeasureTheory.Measure.infinitePi is applied, since that product is defined only for probability measures.

To prove this, construct local points from the imported finite cohomology and the real quotient, using BK Theorem 4.1 and P1–P4 for the exponential and the good masses; construct global points by the inverse image, proving finite generation, rationalization and completion from the adelic comparison; normalize good factors, take the infinite product and restore the mass product; prove top-form independence by the product formula; use the real regulator for the arithmetic quotient and lift independence; construct the quotient–localization map and its kernel, applying BK Lemma 5.10 and Proposition 5.14 with their hypotheses. Total finiteness is never replaced by primary finiteness.

The interface includes the following facts.

- The local point groups are the specified finite cohomology and real quotient groups; the integral exponential is defined locally near zero.
- With its rationalization and completion maps.
- Outside a proved finite set the ω-normalized mass is P_p(V, 1).
- The convergent or regularized measure with independence of S, top form and local neighborhood.
- For triples of weight ≤ −3, Tam(T), with discreteness, cocompactness and lift-independence.
- The displayed kernel.

**Checks.**

- In a one-dimensional good factor with P_p(1) = 1 − a_p and |a_p| ≤ `p^{−3/2},` the mass is 1 − a_p, not (1 − a_p)⁻¹.
- Passing unnormalized good Haar factors to `infinitePi` is invalid: a factor of mass different from 1 must first be normalized and its mass restored.
- Scaling ω by 2 multiplies the real measure by 2 and the 2-adic measure by 1/2, and leaves the global measure unchanged.
- For ℚ(1), P_p(1)=1−1/p and L_S(s)=ζ(s+1)∏_(p∈S_f)(1−p^(−s−1)). The infinite product of good masses is not a positive convergent mass, but r=−1 and C_S=∏_(p∈S_f)(1−1/p)⁻¹. Adding p=2 doubles C_S and replaces its probability factor by a factor of mass 1/2, preserving μ.
- On ℚ_p(1), the rational exponential has one-dimensional target; its restriction to a sufficiently small p-adic ball lifts to integral points. No nonzero ℚ_p-linear isomorphism has the whole ℚ_p as a compact image.
- The global torsion is H⁰(ℚ, T ⊗ ℚ/ℤ) (BK Lemma 5.10); the numerator in the conjecture is the dual torsion H⁰(ℚ, T^* ⊗ ℚ/ℤ(1)), a different group.
- For V = D = Φ = 0 and T = 0, every point group and Sha are zero, the quotient has total mass 1, and Tam(T) = 1.

*Needs:* Layer PS.6.1; SelmerIwasawaCohomology L2 and L4; Mathlib MeasureTheory.Measure.haarMeasure, MeasureTheory.Measure.infinitePi.

### PS.6.3 The elliptic fundamental-line adapter

For E/ℚ with a fixed global minimal Néron differential ω, identify the motive h¹(E)(1) of weight −1, its Kummer and finite Selmer cohomology, its real regulator exact sequence and its integral local terms. Assume ord_(s=1) L(E,s) = r = rank E(ℚ), as well as the finiteness and comparison hypotheses below. Prove that the commutative fundamental-line statement TΩ = 0 of PS.5.2 for h¹(E)(1) at the odd primes (and at 2 under PS.4.4) is equivalent to the corresponding prime parts of the Birch–Swinnerton-Dyer formula of TauCetiRoadmap EllipticCurves Layer 7,

```text
L^{(r)}(E, 1)/r! = Ω_E · Reg_E · #Sha(E/ℚ) · ∏_p c_p / #E(ℚ)_tors²,
```

with r = rank E(ℚ), Ω_E the integral of |ω| over all components of E(ℝ), Reg_E the determinant of the Néron–Tate pairing on a basis of E(ℚ)/tors (empty determinant 1), and c_p the Néron component-group orders. A basis of a subgroup of index m multiplies Reg_E by m². This equivalence is conditional on the regulator, Kummer and Tamagawa identifications; it is not a proof of BSD (BK, Proposition 5.4, pp. 370–371, and §5, pp. 374–377; BF, §3.1, pp. 517–519, and Conjecture 4, pp. 535–536).

Mordell–Weil finite generation, the canonical height pairing and regulator, local reduction and Tamagawa numbers, and the Selmer and Sha carriers are TauCetiRoadmap EllipticCurves Layers 2, 4, 6 and 7. Finiteness of Sha, the nonzero analytic germ and the analytic-rank equality are explicit hypotheses unless a separate theorem supplies them. With this equality, the actual leading term of PS.3.3 is L^(r)(E,1)/r!; without it the determinant calculation only concerns L*. Equivalently, under the remaining hypotheses, ETNC parts (ii) and (iv) together correspond to the order-and-leading-coefficient BSD statement. The real dyadic restriction PS.4.4 applies.

To prove this, import the weight −1 motive and the Kummer comparison, use BK Proposition 5.4 to separate Selmer information from finiteness of Sha, identify each determinant factor with its Mordell–Weil, height, torsion and local counterpart, check the all-components period and the exact minimal differential, and translate the Ξ/Δ orientation into the scalar formula.

The interface includes the following facts.

- Under analytic-rank equality, the leading-coefficient equivalence prime by prime; including the order identifies ETNC (ii) and (iv) with the full order-and-leading-coefficient statement.
- Index-m sublattice multiplies Reg by m².
- Ω_E with the number of real components.

**Checks.**

- At r = 0, Reg = 1 and analytic-rank equality says L(E,1) ≠ 0; the actual leading term is L(E,1).
- For formal germs 3(s−1) and 3(s−1)² the nonzero leading coefficient is 3 in both cases, but their first derivatives at 1 are 3 and 0. With algebraic rank 1, only the first germ satisfies the required order equality. This checks the logical premise without asserting an elliptic-curve counterexample.
- If E(ℝ) has two components, Ω_E is twice the identity-component integral.
- Replacing a Mordell–Weil basis by a basis of an index-3 subgroup multiplies Reg by 9 and requires the corresponding index correction.
- A rational cohomology identification alone does not account for the squared torsion denominator.

*Needs:* Layers PS.4.3, PS.4.4 and PS.0.5; TauCetiRoadmap EllipticCurves Layers 2, 6 and 7. The arithmetic scalar identity is an explicit input to PS.6.4.

### PS.6.4 Transport of rank-zero and rank-one arithmetic witnesses

Let E/ℚ have analytic rank 0 or 1, with the rank equality, finiteness of Sha and the positive leading-term identity supplied as an explicit arithmetic witness. For each prime p at which the comparisons of PS.6.3 hold, transport the p-part of that identity to the corresponding integral fundamental line. A full integral conclusion requires a witness at every prime, including bad, reducible and dyadic primes; the dyadic comparison is the one specified in PS.4.4. For an explicitly localized witness the conclusion has exactly that localization. No theorem proving the missing arithmetic identity or supplying a list of good primes is asserted (BF, Conjectures 4 and 6, pp. 535–537, for the statement being compared).

To prove the transport, compare the supplied differential and all-components period with PS.6.3, retain its exact Selmer and local-factor identifications, and apply that equivalence at each stated prime. An arithmetic rank equality alone does not supply a leading coefficient.

The interface includes the following facts.

- A rank-zero or rank-one scalar BSD witness, including finite Sha and every local comparison, gives the corresponding fundamental-line witness.
- A localized witness gives precisely the localized determinant equality.
- If all prime components are supplied and the global coherence hypothesis holds, their generator equalities assemble into the global fundamental-line equality.

**Checks.**

- Equality away from 2 permits a quotient 2; its 2-adic valuation is 1, so it gives no equality at 2.
- At rank zero the regulator is 1, but the leading term still contains Sha, local factors and torsion.
- With all local valuations of a positive rational quotient equal to zero, that quotient is 1. With only odd valuations zero, it can be 2.

*Needs:* Layer PS.6.3, the exact arithmetic scalar witness, and PS.4.1 coherence for a global statement.

### PS.6.5 The Bloch–Kato Tamagawa number conjecture as a predicate

For a motivic triple (V, D, Φ) of weight ≤ −3 (PS.6.1), with its real and adelic regulator identifications, and a ℤ-lattice T ⊂ V whose adelic extension is Galois stable, use the points, measure and Sha of PS.6.2 to define BlochKatoTamagawa V D Φ T as: Sha(T) is finite and

```text
Tam(T) = #H⁰(ℚ, T^* ⊗ ℚ/ℤ(1)) / #Sha(T),     T^* = Hom_ℤ(T, ℤ).
```

Both finiteness and the equality are conjectural in general. The fixed-ℓ formulation of BK Remark 5.15.2 is a separate localized statement under weaker ℓ-adic and regulator hypotheses and does not imply finiteness at all primes. The weight ≤ −3 hypothesis is Bloch and Kato's for global triples; for h¹(E)(1), of weight −1, no triple exists once E(ℚ) is infinite (PS.6.1), and the elliptic statement is the determinant formulation of PS.6.3 with its Mordell–Weil space and nondegenerate height pairing, the regularized local measures of PS.6.2 giving its local normalizations (BK, Definition 5.5, pp. 371–372; Definition 5.9 and (5.11)–(5.13), pp. 373–375; Proposition 5.14 and Conjecture 5.15 with Remark 5.15.2, pp. 375–377; pure weight −1 with the height discriminant, pp. 382–383).

The triple comes from an actual motive and satisfies the axioms of PS.6.1, with its global regulator identifications supplied.

To prove the structural statements, use the top-form and lift independence of PS.6.2 and the product formula, define the conjunction of finiteness and the identity, and use BK Proposition 5.14 for change of lattice under its hypotheses.

The interface includes the following facts.

- Total finiteness of Sha(T), not each primary part.
- The Tamagawa number equals dual torsion divided by the total Sha order, with the stated finiteness premise.
- Rescaling the top form changes local measures with product 1.
- BK Proposition 5.14 between stable lattices in the same realization.
- The global identity implies its fixed-ℓ version, with no converse to total finiteness.

**Checks.**

- ℚ(2), of weight −4, falls under the weight ≤ −3 statement and uses the convergent product. The weight −1 pair h¹(E)(1) for y² = x³ − 2 has no triple (PS.6.1), so the predicate does not apply to it; its Kummer line and height determinant are kept by PS.6.3.
- For the zero triple, L_S=1, r=0 and C_S=1, so regularization agrees with Tam=1.
- ⊕_p ℤ/p has finite p-primary parts but is infinite, so primary finiteness does not witness the predicate.
- Scaling the top form by a nonzero rational a changes the product measure by ∏_v |a|_v = 1.

*Needs:* Layers PS.6.1–PS.6.2 and PS.4.1; SelmerIwasawaCohomology L2 and L4.

### PS.6.6 The Rankin–Selberg Beilinson–Bloch–Kato prediction

Let F/F⁺ be a CM extension, n ≥ 2, and n₀, n₁ the even and odd members of {n, n + 1}. Let Π_α be relevant representations of `GL_{n_α}(𝔸_F):` cuspidal, conjugate self-dual, with archimedean components the principal series with characters `arg^{1−n_α},` `arg^{3−n_α},` …, `arg^{n_α−1}.` For a common strong coefficient field E and the Galois systems supplied with them, put V_λ = `ρ_{Π₀,λ}` ⊗ `ρ_{Π₁,λ}(n),` of weight −1. Define BBKRankZeroOne Π₀ Π₁ to assert, for every coefficient place λ: L(1/2, Π₀ × Π₁) ≠ 0 implies H¹_f(F, V_λ) = 0; and global root number −1 with L′(1/2, Π₀ × Π₁) ≠ 0 implies `dim_{E_λ}` H¹_f(F, V_λ) = 1. This predicts ranks, not an integral leading term or finiteness of Sha. The diagonal Abel–Jacobi class Δ_λ lies in a finite direct sum of copies of this Selmer group; its nonvanishing and the nonvanishing of L′ are separate propositions (Liu–Tian–Xiao–Zhang–Zhu (LTXZZ), §1.1, Definition 1.1.3 and Theorems 1.1.5 and 1.1.9, published pp. 110–113).

The local Bloch–Kato conditions are SelmerIwasawaCohomology L4, the Rankin–Selberg analytic normalization is AutomorphicLFunctionsAndLocalFactors AL.3, and the relevant Galois systems and a common strong coefficient field are AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6. Use its completed scalar map for each embedding inducing λ, and its finite coefficient-extension comparison to form the common field; the field of rationality alone is insufficient. The centre 1/2 and the twist n move together; no automorphic tensor product is assumed. Construction of the diagonal class is the separate arithmetic-continuation contract below (LTXZZ Proposition 3.2.4 and Definition 3.2.5, pp.144–145; §8.3, pp.315–316).

To prove the structural statements, import Π_α and the normalized tensor product, then the finite-condition Selmer group, and form the two implications with their quantifier over all λ.

The interface includes the following facts.

- At every coefficient place, a nonzero central value implies a zero finite Selmer group.
- With root number −1, a nonzero central derivative implies finite Selmer dimension one at every coefficient place.
- Changing the motivic normalization moves the centre and the twist together.
- A Selmer base-change isomorphism preserves dimension.
- A nonzero Δ_λ is a separate statement from L′ ≠ 0; the route from L′ ≠ 0 to a usable nonzero class needs LTXZZ Conjecture 8.3.1, an Abel–Jacobi injectivity statement and the geometric level conditions, and no converse is asserted.

**Checks.**

- A rank statement at one admissible λ does not witness the prediction, which quantifies over all λ.
- The derivative implication requires root number −1; deleting it changes the predicate.
- A nonzero vector in H¹_f ⊕ ⋯ ⊕ H¹_f shows the Selmer group is nonzero but does not show it has dimension one.
- For n=2 the even and odd dimensions are (2,3), the tensor has dimension 6 and twist 2; for n=3 they are (4,3), tensor dimension 12 and twist 3. Swapping the labels while retaining the parity-dependent polarizations fails.
- Extending E to a finite strong field preserves a fixed Selmer dimension after scalar extension; it does not make a prime admissible. The zero tensor representation is outside the relevant cuspidal data.

*Needs:* Layer PS.1.7; SelmerIwasawaCohomology L2 and L4; AutomorphicLFunctionsAndLocalFactors AL.3; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6.

### PS.6.7 Transport of a Beilinson–Bloch–Kato witness

For the pair of PS.6.6, take a witness of its Beilinson–Bloch–Kato rank-zero/one predicate. Prove that extending the strong coefficient field through the supplied finite Selmer base-change isomorphisms transports this witness: zero Selmer groups stay zero, and one-dimensional Selmer groups stay one-dimensional, for every place of the extended field. The analytic central value and derivative use the same fixed complex embeddings and root-number normalization. This is a comparison theorem conditional on an arithmetic witness, rather than an assertion of LTXZZ's rank theorems without their hypotheses (LTXZZ §1.1, Definition 1.1.3, pp. 110–113).

In an application at one place, the premise supplies the rank implication at that place. If it is obtained by arithmetic level raising, it must include all of that theorem's hypotheses, including any uniform realized-Frobenius span and definite-period or nonzero Abel–Jacobi witness. A definite period identity alone gives no such arithmetic witness. Those constructions are not inputs to the present comparison theorem.

To prove the transport, use the actual scalar-extension equivalence of finite Selmer groups and invariance of dimension under finite coefficient extension; apply the two implications of the supplied witness separately, with their quantifier over all coefficient places.

The interface includes the following facts.

- The theorem bbk_transport_of_witness carries a supplied rank-zero/one witness through finite strong coefficient extension and its finite Selmer base-change isomorphisms.
- A nonzero diagonal class, if separately supplied in a finite direct sum of Selmer groups, gives the lower bound only; a rank-one upper bound is a separate arithmetic premise.
- A derivative implication retains root number −1 and every premise converting the derivative into a usable arithmetic witness.

**Checks.**

- A rank-one E_λ-space extends to a rank-one E′_(λ′)-space, while the zero space stays zero.
- A nonzero vector in E_λ² supplies a lower bound 1, not the equality 1; the theorem requires the rank witness.
- A conclusion at one coefficient place does not give the all-place predicate; the transported witness retains its original universal quantifier.

*Needs:* Layer PS.6.6; AutomorphicGaloisRepresentationsPartII AG2.6 (finite strong coefficient extension); SelmerIwasawaCohomology §§2.9, 4.9 (finite Selmer groups and their scalar-extension comparisons); the explicitly supplied arithmetic witness.

### Examples

- For 11a1 (rank 0, #Sha = 1, c_11 = 5, #E(ℚ)_tors = 5), the BSD formula reads L(E, 1) = Ω_E · 5/25 = Ω_E/5; its fundamental-line interpretation is conditional on this scalar identity and the comparisons of PS.6.3.
- For the zero triple (V = D = Φ = 0, T = 0): Sha(T) = 0, Tam(T) = 1 and H⁰(ℚ, T^* ⊗ ℚ/ℤ(1)) = 0, so both sides of the identity equal 1 and BlochKatoTamagawa holds: the degenerate case.

### Dependencies

Layers PS.4–PS.5; MotivesAndAlgebraicCycles MC.2; SelmerIwasawaCohomology L2–L4; AutomorphicLFunctionsAndLocalFactors AL.3, AL.5; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6; TauCetiRoadmap EllipticCurves Layers 2, 4, 6, 7; Mathlib MeasureTheory.Measure.haarMeasure, MeasureTheory.Measure.infinitePi.
## Layer PS.7: period integrals and normalization

This layer proves period-integral transformations, convergence and explicit error inequalities, stability of a normalized quotient when its denominator stays away from zero, and exact normalization covariance. It keeps the period conjecture as a separate injectivity predicate. Small exact values distinguish signs and branches; numerical agreement supplies no arithmetic conjecture.

### PS.7.1 Period integrals and error bounds

Work with the supplied Legendre integrals and the finite midpoint sums below. Prove the parameter transport, substitutions and error inequalities, with the stated real-parameter ranges.

Use Mathlib `integral_one_div_one_add_sq` and `Real.arctan_one` to identify ∫₀¹ dx/(1 + x²) with π/4. For the partial sums S N = `Σ_{k=0}^{N}` (−1)^k/(2k + 1), the remainder π/4 − S_N has sign `(−1)^{N+1}` and absolute value at most 1/(2N + 3), giving rational endpoints.

Second, use the canonical modulus integral of EllipticIntegrals Milestone 1 with k=√λ. For 0≤λ<1 prove the parameter identity K_λ = TauCeti.Real.legendreK(√λ), where `legendreK λ` in Suggested.lean is only the signature adapter ∫₀¹ dt/√((1−t²)(1−λt²)). The supplier's algebraic integral representation and endpoint integrability apply because k²=λ<1; no second canonical first-kind integral is constructed. For the new substitution and error theorem assume 0<λ<1. The substitution t = 2u/(1 + u²) gives K_λ = ∫₀¹ f_λ(u) du with f_λ(u) = 2/√D_λ(u) and D_λ(u) = (1 + u²)² − 4λu². On [0, 1], D_λ(u) = (1 − u²)² + 4(1 − λ)u² ≥ (1 − λ)(1 + u²)² ≥ 1 − λ, and |f_λ′| ≤ 8/(1 − `λ)^{3/2},` so N ≥ 1 equal midpoint panels have error at most 2/(N(1 − `λ)^{3/2}).` For y² = x(1 − x)(1 − λx) and ω = dx/(2y), the oriented real oval over [0, 1] has period 2K_λ; this is the period of a specified cycle, and the all-components Néron period needs PS.0.5 and PS.6.3.

The parameter is real with 0 < λ < 1; positivity fixes the branch. The integral inequalities hold over the whole real parameter interval, including every rational example.

To prove this, integrate the finite geometric identity for the arctangent and bound the signed remainder; for the elliptic integral prove the substitution on truncated intervals (Mathlib `intervalIntegral.integral_comp_mul_deriv'`) and pass to the endpoint limit by dominated convergence (Mathlib MeasureTheory.tendsto_integral_of_dominated_convergence); use D_λ ≥ (1 − λ)(1 + u²)² for positivity and the derivative bound; integrate the Lipschitz midpoint error L/(4N) per unit interval (Mathlib `intervalIntegral.norm_integral_le_of_norm_le`); apply the cycle substitution to get 2K_λ with the oval's orientation.

The interface includes the following facts.

- S_N is the partial sum through k=N of (−1)^k/(2k+1).
- The signed remainder bound.
- `legendreRadicand` and `legendreIntegrand` give D_λ and f_λ on the positive branch.
- `legendreK` is the parameter-form signature adapter, equal to the supplied canonical modulus integral at √λ for 0≤λ<1; endpoint integrability is consumed through this identity.
- `legendreMidpoint` is the equal-panel midpoint sum, with the error theorem restricted to N>0.
- (1 − λ)(1 + u²)² ≤ D_λ(u).
- `legendre_substitution` (K_λ = ∫₀¹ f_λ).
- `legendre_midpoint_error` (|K_λ − midpoint sum| ≤ 2/(N(1 − `λ)^{3/2})` for N > 0).
- The oriented oval period of dx/(2y) is 2K_λ.

**Checks.**

- The partial sums are S₀ = 1, S₁ = 2/3 and S₂ = 13/15; thus N = 0 gives 2/3 ≤ π/4 ≤ 1, and N = 1 gives 2/3 ≤ π/4 ≤ 13/15.
- At λ = 0, D₀ = (1 + u²)², f₀(u) = 2/(1 + u²), K₀ = π/2 and the one-panel midpoint sum is 8/5. This endpoint is a check of the definitions; the stated error theorem retains 0 < λ < 1.
- At λ = 1/2, f(0) = 2, f(1) = √2 and the one-panel midpoint sum is 8/√17; the two-panel sum is (f(1/4) + f(3/4))/2. At N = 0 the total `legendreMidpoint` is 0 and is excluded from the error theorem.
- For λ = 1/2, D_λ(u) = 1 + u⁴ ≥ 1: no singularity remains after the substitution.
- The negative square-root branch reverses the sign of the period and is excluded by the positive-branch definition.
- At λ=1/4 the canonical modulus is 1/2: the algebraic radicand is (1−t²)(1−t²/4). Passing λ itself as modulus would give (1−t²)(1−t²/16); at t=1/2 these are 45/64 and 189/256, so the two integrands differ.
- At λ<0, √λ=0 in Mathlib's total real square root, so the proposed unrestricted adapter would incorrectly replace the parameter integral by K₀. The comparison is restricted to 0≤λ<1.
- λ = 1 is excluded: the improper integral at λ=1 diverges and the bound's denominator vanishes (D_1(1) = 0).

*Needs:* Layer PS.0.5; EllipticIntegrals Milestone 1 (canonical K, algebraic representation and endpoint integrability); ComplexComparisonPartII C5 (proper de Rham–Betti comparison); Mathlib `intervalIntegral`, `intervalIntegral.norm_integral_le_of_norm_le`, `intervalIntegral.integral_comp_mul_deriv'`, MeasureTheory.tendsto_integral_of_dominated_convergence, Real.pi.

### PS.7.2 Stability of normalized values

For complex finite values L,L₀ and nonzero periods c,c₀, let δ>0, ε≥0 and η≥0 satisfy |c|≥δ, |c₀|≥δ, |L−L₀|≤ε and |c−c₀|≤η. Prove

```text
|L/c − L₀/c₀| ≤ ε/δ + |L₀|η/δ².
```

This follows from (L−L₀)/c + L₀(c₀−c)/(cc₀), the triangle inequality and multiplicativity of the norm. Exact algebraic and Euler correction factors are evaluated at the fixed embedding before applying the inequality. A vanishing Euler correction uses matching leading coefficients and derivative orders from AL.5 (Deligne §5.1, pp. 15–16, for the period normalization; AL.5 for the correction germ).

The interface includes the following facts.

- The quotient varies by the displayed inequality on the domain with a positive denominator lower bound.
- Multiplication by a fixed complex correction a multiplies the bound by |a|.
- For nonzero meromorphic germs, multiplying by an Euler germ adds its order and multiplies the leading coefficient; no quotient by its zero value is used.

**Checks.**

- L=2, L₀=1, c=c₀=1, δ=1 gives 1≤1.
- L=L₀=1, c=1, c₀=2, δ=1 and η=1 gives 1/2≤1. Taking c=0 violates the lower-bound hypothesis.
- With L=s and correction E=s², ord(EL)=3 and leading coefficient 1; evaluating E(0)=0 and dividing would lose this value.
- The normalized ζ(2) target is −1/24. A small error inequality around +1/24 cannot correct a wrong Tate sign.

*Needs:* Layers PS.1.5–PS.1.6 and PS.7.1 for applications; Mathlib complex norm and triangle inequality; AutomorphicLFunctionsAndLocalFactors AL.5 for Euler leading terms.

### PS.7.3 Covariance of normalized values

For every proved scalar comparison, carry an explicit record of the coefficient embedding, the Betti and de Rham bases, the regulator normalization, the lattice index, the differential, the Haar measure and the finite Euler set. If the comparison matrix changes to C⁻¹PA its determinant changes by det(A)/det(C); a rank-r regulator scaled by a changes by a^r; a Mordell–Weil basis of a subgroup of index m changes the height determinant by m²; `Γ_{ℂ,D}` versus `Γ_{ℂ,B}` changes the completion by 2^b; and scaling a local Haar measure by c changes a local epsilon factor by `c^{dim V}.` Transport numerator and denominator through these identities before comparing their values, and prove the covariance of each example's normalized value; no claim is made that a numerical ratio is invariant under independent convention changes (Deligne, §5.1, pp. 15–16; Tate, *Number theoretic background*, (3.4.3)–(3.4.4), printed p. 15).

Each transformation is a supplied comparison or a proved formula and the maps compose in the example; measures are scaled by positive reals; orientations and coefficient units are kept distinct from absolute values.

To prove this, apply the PS.0.1 basis formula, the PS.3.2 determinant scaling and the PS.6.3 lattice formula; then the PS.1.2 Gamma bridge and the local-measure identity; then compose the exact changes and apply PS.7.2 to quantitative estimates.

The interface includes the following facts.

- The record of conventions of a scalar comparison.
- The transformation law of a normalized value under each recorded change.

**Checks.**

- A rank-2 regulator multiplied by 2 changes its determinant by 4.
- A Mordell–Weil sublattice of index 2 changes the height determinant by 4, independently of the components factor in Ω.
- For a rank-4 local representation, scaling the Haar measure by 2 changes the epsilon factor by 16.

*Needs:* Layers PS.0.1, PS.1.2, PS.3.2, PS.6.3 and PS.7.2.

### PS.7.4 The period conjecture and the special-value predicates

For the full localized formal-period algebra P and the evaluation periodEvaluation : P → ℂ of PS.2.1, define PeriodConjecture as injectivity of periodEvaluation: an equality of numerical values implies the corresponding formal relation. It is not implied by the torsor theorem of PS.2.2. Keep it separate from DeligneAlgebraic (PS.1.4), LeadingTermRational (PS.3.3), ETNC (PS.5.2), BlochKatoTamagawa (PS.6.5), BBKRankZeroOne (PS.6.6) and higher-rank BSD (PS.6.3 with unrestricted rank); every exported theorem names exactly the members of this list it assumes. An analytic inequality is a theorem with its stated bounds, and numerical agreement witnesses none of these predicates (Kontsevich–Zagier (KZ), §1.2, Conjecture 1, and §4.1, where it is stated for the effective algebra, whose injectivity passes to the localization since every element of P is x/Lⁿ with x ∈ P_eff and evaluates to per(x)/(2πi)ⁿ; HMS, Theorem 0.2, p. 2; Definition 2.8 and Theorem 2.10, pp. 10–11; BF, Conjecture 4, pp. 535–536).

P and periodEvaluation are the full localized constructions, not the effective algebra.

To prove the structural statements, define injectivity on the imported period map and use the already proved relation-respecting direction.

The interface includes the following facts.

- ∀ x y ∈ P, periodEvaluation x = periodEvaluation y → x = y.
- Equivalently the kernel is zero.
- Formal equality gives numerical equality, unconditionally.
- The converse, under PeriodConjecture.

**Checks.**

- The relation L·L⁻¹ = 1 is already formal and needs no injectivity hypothesis.
- A torsor with a chosen complex point does not force evaluation at that point to be injective: the ring map ℚ[x, x⁻¹] → ℂ, x ↦ 1, comes from a complex point and is not injective.
- Overlapping error bars do not establish a formal equality or an exact leading coefficient.

*Needs:* Layers PS.2.2, PS.1.4, PS.3.3, PS.5.2, PS.6.3–PS.6.6 and PS.7.2.

### Examples

- S 0 = 1 and S 1 = 2/3, with 2/3 ≤ π/4 ≤ 13/15.
- legendreRadicand (1/2) u = 1 + u⁴ and legendreRadicand 1 1 = 0.
- Under a change of the Betti basis by A = diag(2, 1) for a rank-two motive, the comparison determinant is multiplied by 2 and the normalized value by 1/2.

### Dependencies

Layers PS.0–PS.6; DirichletPadicLFunctions L0; AutomorphicLFunctionsAndLocalFactors AL.1, AL.5; Mathlib `intervalIntegral`, MeasureTheory.tendsto_integral_of_dominated_convergence; EllipticIntegrals Milestone 1.

## Layer PS.8: arithmetic mirror symmetry and period differential equations

Two one-parameter families put Layers PS.0–PS.2 to work. For the Dwork quartic pencil of K3 surfaces the layer constructs the resolved family, its normalized residue form, its Picard–Fuchs equation, the marked rank-three orthogonal complement with integral monodromy, the Frobenius solution basis, the hypergeometric symmetric-square identity, the local reflection at the conifold point, the normalized mirror coordinate, the modular relation with 1/j, and the integrality of the mirror map. For the Dwork quintic pencil of Calabi–Yau threefolds it constructs the invariant formal cohomology with its Gauss–Manin connection, Dwork's normalized Frobenius, the convergent Dwork sums, Shapiro's boundary Frobenius matrix, and its comparison with crystalline cohomology. A differential equation shared by two expressions is never a period comparison without matching initial and monodromy data; mirror-map integrality, enumerative identities and Frobenius congruences are distinct theorems, and only those stated here are claimed.

### PS.8.1 The resolved Dwork quartic family

For t ∈ B = 𝔸¹_ℂ ∖ {t : t⁴ = 1}, let F_t ⊂ ℙ³ be the quartic Σ_i X_i⁴ − 4t X₀X₁X₂X₃ = 0. Let G = {(a_i) ∈ μ₄⁴ : ∏ a_i = 1}/μ₄ (diagonal), a group of order 16 acting by scaling coordinates. Define the quartic family X → B as the simultaneous minimal resolution of F/G: the quotient F/G has six curves of A₃ singularities along sections over B, and resolving them gives a proper smooth family of K3 surfaces. Keep the quotient map and the exceptional divisors. The fibre at t = 0 is the smooth Fermat quartic quotient; t = ∞ is a degeneration. The coordinate z = (4t)⁻⁴ is used only for t ≠ 0 (Hartmann (H), §4.1, Propositions 4.1–4.4, PDF pp. 10–11).

The quotient of the family by the finite group is SchemeAndStackFoundations §1.17 and §1.23 (finite quotients and their coarse spaces); the relative resolution of the six A₃ sections is constructed here by explicit blow-ups along them (SchemeAndStackFoundations §4.11, modifications and strict transforms), and checked fibrewise; the cohomological realization of X/B is MotivesAndAlgebraicCycles MC.2.

To prove this, check the Jacobian criterion for F_t away from t⁴ = 1; write the invariant quotient explicitly as Y₀ + Y₁ + Y₂ + Y₃ − 4tY₄ = 0, Y₀Y₁Y₂Y₃ = Y₄⁴ in ℙ⁴; locate the six A₃ loci and resolve them relatively by the iterated blow-ups of the A₃ chain.

The interface includes the following facts.

- Σ X_i⁴ − 4t ∏ X_i.
- The product-one subgroup of μ₄⁴ modulo the diagonal, of order 16.
- X → F/G, an isomorphism away from the six A₃ sections.
- X → B is proper and smooth with K3 fibres.

**Checks.**

- At t = 0 the equation is Σ X_i⁴; at the zero vector the polynomial is 0, while at (1, 1, 1, 1) it is 4 − 4t. Scaling every coordinate by c scales the polynomial by c⁴.
- At t = 1 the point [1 : 1 : 1 : 1] is singular (every partial derivative 4X_i³ − `4∏_{j≠i}X_j` vanishes there), so t = 1 is excluded from B.
- t = 0 belongs to B although z = (4t)⁻⁴ has a pole there: a singular point of the differential equation in a quotient coordinate need not be a singular fibre.
- The order of G is 4⁴/4/4 = 16; a definition without the product-one condition has order 64.

*Needs:* MotivesAndAlgebraicCycles MC.2; SchemeAndStackFoundations §§1.17, 1.23 and 4.11; TauCetiRoadmap StableReduction Layer 4.

### PS.8.2 The normalized quartic residue form

Let Ξ_t = (Σ_i (−1)^i X_i dX₀ ∧ ⋯ ∧ dX̂_i ∧ ⋯ ∧ dX₃)/F_t. Use Hartmann's tube-normalized residue, which contains a factor 2πi. The G-invariant residue descends to F/G and extends across the crepant minimal resolution to a nowhere-vanishing relative two-form Ω on X/B. In the affine chart X₀ = 1, with coordinates z₁, z₂, z₃, on the open set where the z₃-derivative 4z₃³ − 4tz₁z₂ is nonzero, Ω = 2πi dz₁ ∧ dz₂/(4z₃³ − 4tz₁z₂) (H, §4.2, Propositions 4.6–4.7 and formula (5), PDF pp. 12–13).

To prove this, compute the residue on the charts where the indicated partial derivative is nonzero and glue; use G-invariance and crepancy of the minimal resolution to descend and extend. The tube convention is kept in the Betti comparison of PS.0.1.

The interface includes the following facts.

- Ω.
- The displayed local expression.
- Its pullback to F_t is the G-invariant residue of Ξ_t.
- Integration of the residue over a two-cycle equals the tube integral with the same normalization; the chart coefficient has the displayed nonzero denominator.

**Checks.**

- At t = 0 the local denominator is 4z₃³ and the numerator still contains 2πi. The coefficient function at z₃ = 1 is πi/2, at z₃ = 2 is πi/16, and at z₃ = 0 the chart domain condition fails. Omitting either the factor 2πi or the cubic power fails these values.
- A product-one diagonal μ₄ substitution leaves the descended form unchanged.
- The chart formula holds only where 4z₃³ − 4tz₁z₂ ≠ 0; vanishing of that denominator does not make Ω singular on X_t, since another chart covers the point.

*Needs:* Layer PS.8.1; Layer PS.0.1; ComplexComparisonPartII C5 (Gauss–Manin connection, C5.2).

### PS.8.3 The quartic Picard–Fuchs equation

On B the Gauss–Manin class of Ω satisfies D_t Ω = 0 with D_t = ∂_t³ − (6t³∂_t² + 7t²∂_t + t)/(1 − t⁴), so D_t ∫_γ Ω = 0 for every locally horizontal two-cycle γ. With z = (4t)⁻⁴ and y = t ∫_γ Ω, this becomes L_z y = 0 with L_z = θ³ − 4z(4θ + 1)(4θ + 2)(4θ + 3), θ = z d/dz, whose singular points are z = 0, 1/256, ∞. The pullback identity is L_z = (1 − t⁴)/64 · D_t ∘ (multiplication by 1/t), not D_t ∘ (multiplication by t) (H, Proposition 4.14, pp. 16–17; Proposition 4.26, p. 21, corrected as recorded in Corrections to the sources).

To prove this, reduce the third parameter derivative of the rational residue form modulo exact forms using the Jacobian relations (Griffiths reduction), pair with horizontal cycles, and substitute θ = −(t/4) d/dt; expand both operators and compare coefficients.

The interface includes the following facts.

- D_t.
- L_z.
- The identity with the factor (1 − t⁴)/64 and multiplication by 1/t.
- D_t annihilates ∫_γΩ. The pulled-back L_z = (1 − t⁴)/64 · D_t ∘ (1/t) annihilates t·∫_γΩ and, as an operator in t, has ascending coefficients −3/(32t⁴), (6/t³−t)/64, −3(t⁴+1)/(64t²), (1−t⁴)/(64t).

**Checks.**

- L_z(1) = −24z, which after pullback is −3/(32t⁴), the order-zero coefficient above; with multiplication by t instead of 1/t the value is −t²/8.
- Raw periods behave like t⁻¹·w₀((4t)⁻⁴) at t = ∞, not t·w₀.
- Applied to the raw leading term t⁻¹, the pulled-back L_z gives t⁻¹/64 − (3/8)t⁻⁵ ≠ 0, so it does not annihilate the raw period. On t·(raw period) = 1 + 24z + ⋯ the degree-one terms cancel: L_z(1) = −24z and L_z(24z) = 24z − 20160z².
- The order-three coefficient of the pulled-back operator is (1 − t⁴)/(64t); at t = 1 it vanishes, as it must at the conifold point.

*Needs:* Layer PS.8.2; ComplexComparisonPartII C5 (C5.2).

### PS.8.4 The marked orthogonal complement

Let T₀ = ⟨4⟩ ⊕ U with ordered basis (h, e, f) and Gram matrix G₀ = [[4, 0, 0], [0, 0, 1], [0, 1, 0]]. The rank-19 primitive sublattice M₂ ⊂ H²(X_t, ℤ) spanned by the quotient and resolution cycles and the polarization has orthogonal complement the constant marked rank-three lattice T₀ on the universal cover of B. M₂ ⊕ T₀ is a rational splitting, not an integral direct sum. This fixed complement is the actual transcendental lattice when NS(X_t) = M₂ (the general fibre in H Theorem 4.8(i)); at a Picard-rank jump it must not be identified with NS(X_t)^⊥. The period line is [p·h − e + 2p²·f] for p in the upper half-plane (H, Theorem 4.8, Theorems 4.10–4.12 and Corollary 4.13, PDF pp. 13–16; Proposition 4.24, p. 20).

Import the geometric theorem from K3Surfaces K2 and K3SurfacesAndSymplecticBoundedness §3.1, applied to the smooth projective K3 produced by PS.8.1. Its Betti statement concerns actual integral cohomology, not cohomology modulo torsion. Huybrechts Chapter 1, §3, pp.15–17, gives the proof route: the exponential sequence embeds Pic into H² with quotient contained in the torsion-free complex vector space H²(O); Picard torsion-freeness therefore kills integral H² torsion. Integral Poincaré duality then makes its cup lattice unimodular. The K3 Chern/Hodge calculation gives rank 22; trivial canonical class makes w₂=c₁ mod 2 zero, so the four-manifold Wu formula makes the form even. The signature computation in Proposition 3.5 gives (3,19). K3Surfaces K2 supplies these geometric statements; the abstract lattice classification is used only afterward.

Apply IntegralLattices Layer 5 milestones 5G–5H and Layer 6 milestone 6A to the primitive embedding into this even unimodular ambient lattice, then its classification statement for the abstract identification. Here T₀ has signature (2,1), discriminant group of length 1 and complement signature (1,18) of rank 19: both signature differences are positive and 22−3≥1+2. The general uniqueness statement printed in H Theorem 4.12 lacks the unimodularity hypothesis and is false as printed (Corrections to the sources); this geometric K3 application meets the corrected hypotheses. For the Gram form, Tau Ceti at the pin has the coordinate API `TauCeti.IntegralLattice.form_ofGramMatrix_basisFun_apply`.

To prove this, construct M₂ from the quotient and resolution cycles and the polarization, compute its primitive complement, apply IntegralLattices 5G–5H and 6A, keep the discriminant gluing (rational splitting only), and transport the marking to the universal cover.

The interface includes the following facts.

- G₀, with determinant −4.
- The quartic period line (p ↦ (p, −1, 2p²)) and isotropy of the quartic period line.
- Marked cycles transport along based paths, compatibly with concatenation and the pairing.

**Checks.**

- h² = 4, e² = f² = 0 and e·f = 1.
- For v = (p, −1, 2p²), vᵀG₀v = 4p² − 4p² = 0. The period-line representatives at p = 0, 1, i are (0, −1, 0), (1, −1, 2), (i, −1, −2); positivity vᵀG₀v̄ = 8(Im p)² excludes real p from the period domain.
- det G₀ = −4, so T₀ is not the unimodular lattice ⟨1⟩ ⊕ U (determinant −1), and its discriminant group is ℤ/4.
- The ambient K3 lattice has rank 22 and determinant −1, whereas T₀ has rank 3 and determinant −4. For primitive orthogonal M₂,T₀ in a unimodular lattice, their discriminant groups have the same order 4 and opposite discriminant forms; [H²:M₂⊕T₀]=4. Thus the direct-sum determinant is −16, not −1, and an integral direct-sum claim fails.
- At a Picard-rank-20 specialization the actual transcendental rank is 2, while the marked M₂-orthogonal local system still has rank 3. The period line can specialize inside the latter, without identifying the two lattices.

*Needs:* Layers PS.8.1 and PS.0.1; K3Surfaces K2 and K3SurfacesAndSymplecticBoundedness §3.1; IntegralLattices Layer 5 milestones 5G–5H and Layer 6 milestone 6A.

### PS.8.5 Integral monodromy and period normalization

At the base point t₀ = i/√2, use Hartmann's based loops γ₁, γ₂, γ₃, γ₄ around i, −1, −i, 1 and γ_∞. In the convention PT_γ(h, e, f) = (h, e, f)·M_γ the monodromy matrices are

```text
M₁ = [[1,0,0],[0,0,1],[0,1,0]]        M₂ = [[5,1,−3],[−12,−2,9],[4,1,−2]]
M₃ = [[17,6,−6],[−24,−8,9],[24,9,−8]]  M₄ = [[5,3,−1],[−4,−2,1],[12,9,−2]]
M_∞ = [[1,4,0],[0,1,0],[−16,−32,1]],
```

with M_γᵀ G₀ M_γ = G₀ for each γ and M_∞M₄M₃M₂M₁ = 1. For Ω = a·h + b·e + c·f the row vector (a, b, c) continues to (a, b, c)·G₀M_γG₀⁻¹, multiplication on the right, and the coordinate p = −a/b transforms by p ↦ p + 4 around ∞ and by p ↦ −1/(2p) around γ₁ (H, Theorem 4.8, pp. 13–16; Propositions 4.21–4.25, pp. 18–20).

To prove this, compute the Picard–Lefschetz reflections in the marked vanishing cycles and multiply in the source's based-loop order; pass to the dual action on period coordinates and read the Möbius maps from the period line.

The interface includes the following facts.

- The five matrices.
- Each preserves G₀.
- M_∞M₄M₃M₂M₁ = 1.
- (M_∞ − 1)³ = 0 ≠ (M_∞ − 1)².
- The actions p ↦ p + 4 and p ↦ −1/(2p).

**Checks.**

- (M_∞ − 1)³ = 0 but (M_∞ − 1)² ≠ 0: maximal unipotent monodromy at ∞.
- At p = i, the period row (i, −1, −2) acted on by G₀M₁G₀⁻¹ becomes (i, −2, −1), hence p′ = i/2 = −1/(2i). Acting by M₁ happens to agree because M₁ swaps e and f; it is insufficient as a dual-action test.
- At p = i, the ∞ action gives p′ = 4 + i from the dual row, whereas acting by M_∞ directly gives p′ = −(32 + i)/(63 + 4i), which differs. The two-term normalization thus pins both the translation and reflection.

*Needs:* Layers PS.8.4 and PS.8.3.

### PS.8.6 The Frobenius solution basis

Put A_n = (4n)!/(n!)⁴, `H_n^{(r)}` = `Σ_{j=1}^{n}` `j^{−r},` H_n = `H_n^{(1)},` g_n = `4A_n(H_{4n}` − H_n), and h_n = `A_n(16(H_{4n}` − H_n)² − `16H_{4n}^{(2)}` + `4H_n^{(2)}).` Let w₀ = Σ A_n zⁿ, g = Σ g_n zⁿ, h = Σ h_n zⁿ. On a chosen branch of log z, f₀ = w₀, f₁ = w₀ log z + g, f₂ = w₀ (log z)²/2 + g log z + h/2 form a basis of solutions of L_z on 0 < |z| < 1/256. These are periods of tΩ after the geometric normalization, not of Ω itself (H, §4.7, pp. 21–23, formulas before Theorem 4.29).

To prove this, put A_n(ρ) = `∏_{k=1}^{4n}(4ρ` + `k)/∏_{k=1}^{n}(ρ` + k)⁴ and differentiate z^ρ Σ A_n(ρ) zⁿ up to order two at ρ = 0; the recurrence n³A_n = 4(4n − 3)(4n − 2)(4n − `1)A_{n−1}` shows the ρ-family solves L_z up to ρ³z^ρ, which vanishes in these derivatives; the ratio test gives the radius 1/256 and the logarithmic orders give independence.

The interface includes the following facts.

- `quarticA` and `quarticG` are A_n and g_n; g_n uses Mathlib `harmonic`, which is H_n = H_n^(1). The second correction h_n also uses the second-order sums H_n^(2), as displayed.
- The three Frobenius series (w₀,g,h) have the displayed rational coefficients.
- The third-order recurrence for n ≥ 1.
- f₀, f₁, f₂ solve L_z on the punctured disc.
- A₀ = 1 and g₀ = h₀ = 0.

**Checks.**

- A₁ = 24, A₂ = 2520 and A₃ = 369600.
- g₁ = 104 and g₂ = 12276.
- `H₀^{(r)}` = 0, `H₂^{(1)}` = 3/2 and `H₂^{(2)}` = 5/4; the exponent r cannot be omitted.
- h₀ = h₁ = 0, h₂ = 10816 and h₃ = 2293824. Thus the second logarithmic correction is not the zero series. The constant coefficients of (w₀, g, h) are (1, 0, 0), and their degree-two coefficients are (2520, 12276, 10816).

*Needs:* Layer PS.8.3; Mathlib PowerSeries.mk, PowerSeries.derivative, `Nat.factorial`, `harmonic`.

### PS.8.7 The hypergeometric symmetric square

For |256z| < 1, w₀(z) = ₂F₁(1/8, 3/8; 1; 256z)² = ₃F₂(1/4, 1/2, 3/4; 1, 1; 256z). Only the ₂F₁ is Mathlib's `ordinaryHypergeometric`; the rank-three operator is the symmetric square of the corresponding rank-two operator (H, §4.8, p. 25, Step 2 of the proof of Theorem 4.37, and Proposition 4.38, pp. 25–26; the symmetric-square differential-equation calculation also underlies Lian–Yau, *Mirror maps, modular relations and hypergeometric series I* (LYH), Proposition 3.1 and its proof, printed pp. 3–4, with λ = 256 and ν = 1/4).

This is an identity of analytic functions; it is not a Betti period comparison by itself.

To prove this, apply the specialized second-order equation, derive its symmetric-square operator, and match the normalized solutions at 0 by their coefficient recurrences.

The interface includes the following facts.

- `quarticW0` (the analytic function Σ A_n zⁿ).
- `quartic_symmetric_square` (the ₂F₁² identity).
- The ₃F₂ form.

**Checks.**

- The coefficient of z is 24 on all three sides: 2·(1/8)(3/8)·256 = 24 and (1/4)(1/2)(3/4)·256 = 24.
- The constant term is 1 on all sides.
- ₂F₁(1/8, 3/8; 1; 256z) alone (not squared) has coefficient 12 at z, so omitting the square fails.

*Needs:* Layer PS.8.6; Mathlib `ordinaryHypergeometric`.

### PS.8.8 Local continuation and reflection at the conifold

Near s = 1 on a slit neighbourhood define U₁(s) = Γ(1/8)²/Γ(1/2) · ₂F₁(1/8, 1/8; 1/2; 1 − s⁴) and U₂(s) = Γ(5/8)²/Γ(3/2) · (s⁴ − `1)^{1/2}` ₂F₁(5/8, 5/8; 3/2; 1 − s⁴). On the branch continued from real s > 1, the local ratio is P_loc = (i/√2)·(U₁ + cot(π/8)U₂)/(U₁ − cot(π/8)U₂). For the marked geometric normalization based on the ray t = i·s, pull back by s = −it to a slit neighbourhood of t = i; there p(t) = P_loc(−it), and the sign change of the square root sends p to −1/(2p), the γ₁ action. The upper hypergeometric parameters are the equal pairs (1/8, 1/8) and (5/8, 5/8). In the distinct based chart at t = 1, γ₄ acts by p ↦ 1 − 1/(2(p − 1)) = (3 − 2p)/(2 − 2p), whose centred coordinate is p − 1; the two based loops and their unshifted local coordinates are not identified (Nagura–Sugiyama (NS), §3.3, formula (26), printed p. 9; §5.2, formula (39), printed p. 14; H, Propositions 4.24–4.25, pp. 20–21, and Theorems 4.28–4.29, pp. 22–23, corrected as recorded in Corrections to the sources).

To prove this, continue the rank-two solutions from s⁻⁴ to 1 − s⁴ by the Euler integral and the beta–Gamma identity (Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`); inversion gives the equal upper pairs; differentiate in the Frobenius parameter for the logarithmic companion, using the real logarithm for s > 1. Pull back by t = i·s (since (−it)⁴ = t⁴ the series and the logarithm branch agree), so that the large-parameter ray is t = i√2 and the slit neighbourhood is at t = i; the square-root sign change gives the γ₁ reflection, which with the translation at ∞ fixes the additive constant (H Proposition 4.25). Keep the γ₄ chart separate: with R(p) = −1/(2p) and T(p) = p + 1, T R T⁻¹(p) = 1 − 1/(2(p − 1)), the γ₄ action computed from M₄.

The interface includes the following facts.

- P_loc.
- The square-root sign change sends P_loc to −1/(2P_loc).
- p(t) = P_loc(−it) near t = i.
- The γ₄ action is T R T⁻¹.

**Checks.**

- The first regular solution has linear coefficient 1/32 at u = 1 − s⁴ = 0 ((1/8)(1/8)/(1/2) = 1/32); the unequal pair (1/8, 3/8) gives 3/32 and fails.
- At U₂ = 0 the γ₁ fixed point is p = i/√2; the γ₄ fixed points are p=1±i/√2, equivalently p−1=±i/√2.
- (3 − 2p)/(2 − 2p) = 1 − 1/(2(p − 1)) for p ≠ 1, an identity of Möbius maps; identifying it with −1/(2p) fails at p = i/√2.

*Needs:* Layers PS.8.7 and PS.8.6; Mathlib `Complex.Gamma_mul_Gamma_eq_betaIntegral`, `Complex.Gamma_mul_Gamma_one_sub`.

### PS.8.9 The normalized mirror coordinate

In ℚ⟦z⟧ put q(z) = z·exp(g(z)/w₀(z)), defined because g/w₀ has zero constant term and w₀ is a unit; define Z(q) as its compositional inverse, which exists since q has constant term 0 and linear coefficient 1 (Mathlib PowerSeries.substInv). The analytic period coordinate is p = (2πi)⁻¹ f₁/f₀ on the chosen branch, so exp(2πip) = q(z). This p is matched with the geometric marked p of PS.8.4 by the monodromy normalization (the translation at ∞ and the γ₁ reflection of PS.8.8), not merely by L_z. The logarithm is real on the ray t = i√2 and continued analytically from there (H, Theorem 4.29 and Proposition 4.30, pp. 22–23, normalization proof corrected as recorded in Corrections to the sources).

To prove this, form the exponential and reuse Mathlib's compositional inverse; use PS.8.8 after the pullback s = −it to the γ₁ chart, the maximal unipotent translation and H Proposition 4.25 to match the ratio to the integral marking; the common rescaling by t cancels in the ratio.

The interface includes the following facts.

- `quarticMirrorCoordinate` (q ∈ ℚ⟦z⟧).
- Constant term 0, linear coefficient 1.
- The coefficients 1, 104, 15188.
- Z, with q∘Z = Z∘q = X.
- q = exp(2πip) for the marked geometric p on the stated branch.

**Checks.**

- q = z + 104z² + 15188z³ + 2585184z⁴ + O(z⁵).
- Z = q − 104q² + 6444q³ − 311744q⁴ + O(q⁵).
- Replacing z by t⁻⁴ = 256z rescales the parameter and changes every coefficient; the stated coefficients are those in z.

*Needs:* Layers PS.8.6, PS.8.5 and PS.8.8; Mathlib PowerSeries.exp, PowerSeries.subst, PowerSeries.substInv.

### PS.8.10 The modular relation with 1/j

Let x = 1/j(q) = q + O(q²), with j normalized by j = q⁻¹ + 744 + ⋯, and y = Z(q). Then P(x, y) = 0 for

```text
P = −x² + xy − 432x²y − 207xy² − 62208x²y² − y³ + 3456xy³ − 2985984x²y³.
```

Consume the integral Tate q-expansion from ModularCurvesPartII §3.6 and the analytic j = E₄³/Δ from TauCetiRoadmap ModularForms Layer 0. Prove here modularInvariant_schwarzian: with J = j/1728, one has {J, τ} + 2Q(J)(dJ/dτ)² = 0, where Q(u) = (32 − 41u + 36u²)/(144u²(u − 1)²), on any open set where J avoids 0 and 1 and dJ/dτ ≠ 0; {f, τ} = f‴/f′ − (3/2)(f″/f′)². This follows from the second-order equation for the Weierstrass periods and the ratio-of-solutions calculation, not from a formal cusp alone (Lian–Yau, *Arithmetic properties of mirror map and quantum coupling* (LYA), §5.1, (5.3)–(5.4), printed p. 16; §4.1, (4.3), printed p. 8). Keep x = 1/(1728J); the quartic relation is LYA §5.5, (5.18)–(5.19), printed p. 21.

To prove this, substitute the algebraic relation into the Schwarzian equation and verify the equality of rational differential expressions; select the branch by matching the normalized series at the cusp.

The interface includes the following facts.

- The analytic identity on the specified nonramified open set.
- The modular relation is the stated polynomial P∈ℤ[x,y].
- P(1/j(q), Z(q)) = 0.

**Checks.**

- The lowest homogeneous part of P is −x² + xy, of degree two, and ∂_y of it at (1, 1) is 1.
- With x = 1/j = q − 744q² + O(q³) and y = q + y₂q² + O(q³), the coefficient of q³ in P(x, y) is (y₂ + 744) − 432 − 207 − 1, so y₂ = −104, the coefficient Z₂ of PS.8.9.
- 1/J = 1728/j = 1728q + O(q²) does not have linear coefficient 1; with J in place of j the normalization x ∈ q + q²ℤ⟦q⟧ used in PS.8.11 fails.

*Needs:* Layer PS.8.9; ModularCurvesPartII §3.6; TauCetiRoadmap ModularForms Layer 0.

### PS.8.11 Integrality of the quartic mirror map

Every coefficient of Z(q) and of q(z) is an integer. More precisely, let P ∈ ℤ[x, y] have least nonzero homogeneous part P_ℓ with P_ℓ(1, 1) = 0 and m = ∂_yP_ℓ(1, 1) ≠ 0; if x(q) ∈ q + q²ℤ⟦q⟧ and y(q) ∈ q + q²ℚ⟦q⟧ is the normalized branch with P(x, y) = 0, then coefficient induction gives y ∈ ℤ[1/m]⟦q⟧. For the quartic relation ℓ = 2 and m = 1. No prime is inverted; geometric and crystalline good-prime restrictions are separate matters (LYA, §6, (6.1)–(6.4), printed p. 22; the quartic application, printed p. 23).

To prove this, note that at each coefficient the new coefficient of y first appears with multiplier m and the rest is integral over ℤ[1/m] by induction (this uses x = q + O(q²)); apply it with x = 1/j, which has integral expansion, and m = 1; formal inversion of a series with linear coefficient 1 preserves integrality, giving q(z). Lian–Yau's prime-degree theorem does not apply to degree four and is not used.

The interface includes the following facts.

- The general coefficient-induction lemma over ℤ[1/m].
- `quarticMirror_integral` (Z and q have integer coefficients).

**Checks.**

- Z₂ = −104 and Z₃ = 6444 are integers.
- The multiplier m matters: P = 2y − 2x − x² has P₁ = 2y − 2x, m = 2, and with x = q its branch y = q + q²/2 lies in ℤ[1/2]⟦q⟧ but not in ℤ⟦q⟧.
- Compositional inversion gives q(z) = z + 104z² + 15188z³ + ⋯ from Z(q) = q − 104q² + 6444q³ + ⋯: the cubic coefficient is 2·104² − 6444 = 15188. Reversing the inverse's quadratic sign fails already in degree two.

*Needs:* Layer PS.8.10; Mathlib PowerSeries.substInv.

### PS.8.12 The invariant Dwork quintic family

For p an odd prime different from 5 and ℂ_p a completed algebraic closure of ℚ_p, let V_λ ⊂ ℙ⁴ be `λΣ_{i=1}^{5}` x_i⁵ + ∏ x_i = 0. In characteristic zero the family is smooth exactly when λ ≠ 0 and 1 + 5⁵λ⁵ ≠ 0. Let G be the group of product-one diagonal fifth roots of unity modulo scalars, of order 125. Select H³(V_λ)^G, of rank four, from the full rank-204 cohomology. This summand is stable under S₅; no S₅ averaging is used. For the natural pullback action, `Ω=ι_{Σx_i∂_{x_i}}(dx₁∧⋯∧dx₅)` transforms by the sign of the permutation. Thus the holomorphic class Res(Ω/φ_λ), and its first three logarithmic derivatives, have the sign action of S₅. Reading SH's combined invariance literally requires twisting the permutation action by this character. The point λ = 0 is a degeneration (a union of coordinate hyperplanes), and its limiting extension is not H³ of a smooth fibre (Shapiro (SH), §§3.1–3.3, pp. 3–5, and §4.1).

The realizations and cup pairing of the smooth fibres are MotivesAndAlgebraicCycles MC.2.

To prove this, compute the partial derivatives and the critical-parameter equation; construct the invariant projector over ℚ_p, using p ≠ 5; use the homogeneous twisted de Rham description of the invariant part; no resolved mirror quotient is used.

The interface includes the following facts.

- The quintic polynomial is λΣx_i⁵+∏x_i.
- 125⁻¹ `Σ_{g∈G}` g on H³, compatible with S₅.
- Smoothness exactly for λ ≠ 0 and 1 + 5⁵λ⁵ ≠ 0.

**Checks.**

- At λ = 0 the equation is ∏ x_i = 0, a union of coordinate hyperplanes; at (1, 1, 1, 1, 1) the polynomial is 5λ + 1, and multiplying all coordinates by c multiplies it by c⁵.
- The invariant space has dimension 4, whereas H³ has dimension 204.
- The group has order 125, so the averaging projector is not integral at p = 5; λ = −1/5 satisfies 1 + 5⁵λ⁵ = 0 and is a singular parameter.
- At p=3, 125 is a unit but |S₅|=120 is not. A transposition sends the nonzero holomorphic residue to its negative; averaging the natural S₅ action would kill it even over ℚ₃. This distinguishes the G-invariant summand from an incorrectly selected S₅-invariant summand.

*Needs:* MotivesAndAlgebraicCycles MC.2.

### PS.8.13 The formal quintic cohomology and its connection

Choose π with `π^{p−1}` = −p. Use the charge-zero part of top cohomology H⁶(Ω†,d+πd(tφ_λ)) in (x₁,…,x₅,t), with deg x_i=deg dx_i=1 and deg t=deg dt=−5, and then take G-invariants. Here ω=[dx₁∧⋯∧dx₅∧dt]. No Euler-contraction kernel is imposed on these top forms: contraction by `E_c=Σx_i∂_{x_i}−5t∂_t` is nonzero on ω, and on top forms its kernel over the coefficient domain is zero. Euler contraction enters on the ordinary complement complex after the comparison in PS.8.17. Let H be the invariant formal extension, with ℂ_p⟦λ⟧-basis e_i = δ^i ω, 0 ≤ i ≤ 3, where δ = λ∂_λ + πtλ Σ x_i⁵. The relation is δ⁴ω = −g·(24ω + 50δω + 35δ²ω + 10δ³ω), g = 5⁵λ⁵/(1 + 5⁵λ⁵). The basis is over ℂ_p⟦λ⟧; nothing asserts that it spans an integral lattice (SH, Definition 4.2, p. 5; Lemma 4.12, pp. 8–9; Schwarz–Shapiro (SS), §2, pp. 11–12).

For s=0,…,3 put u_s=π^s[(t∏x_i)^s dx₁∧⋯∧dx₅∧dt]. SH Lemma 4.8, pp.6–7, gives `δu_s=−(s+1)u_s−u_{s+1}.` Consequently (e₀,…,e₃)=(u₀,…,u₃)D, where

```text
D = [[1,-1,1,-1], [0,-1,3,-7], [0,0,1,-6], [0,0,0,-1]],   det D = 1.
```

This integral change between two rationally defined bases is unimodular; whether either basis spans geometric integral cohomology is the predicate QuinticBoundaryLatticeIntegral of PS.8.17.

To prove this, use the affine twisted hypersurface complex, keep the homogeneous projective component and the group invariants (SH §§3.2–3.3), and reduce monomial classes (SH Lemma 4.8 and Corollary 4.10). The logarithmic connection matrix in the column-input convention has first three columns e₁, e₂, e₃ and last column −g·(24, 50, 35, 10). The comparison of this formal model with the cohomology of the smooth fibres is PS.8.17.

The interface includes the following facts.

- The companion matrix.
- At λ=0, N sends e₀↦e₁↦e₂↦e₃↦0, so N⁴=0 and N³≠0.
- The alternating matrix at λ = 0.
- The flat alternating cup pairing with (e₀, e₃) = Y₀/(1 + 5⁵λ⁵), Y₀ ≠ 0, and (e₁, e₂) = −Y₀ at λ = 0.

The interface also contains the matrix D, in the column-input convention, and the monomial basis determinant det D = 1. The u_s are classes in the preceding complex, rather than a new abstract cohomology carrier.

**Checks.**

- N⁴ = 0 and N³e₀ = e₃ ≠ 0.
- At λ = 1/5, g = 1/2 and the last connection column is (−12, −25, −35/2, −5). At λ = −1/5 its denominator vanishes, so this parameter is excluded even though a total field expression can be evaluated there.
- At λ = 0 the pairing matrix has J₀₃ = Y₀, J₁₂ = −Y₀, J₂₁ = Y₀, J₃₀ = −Y₀. Its determinant is Y₀⁴; Y₀ = 0 gives the zero matrix and is excluded from a nondegenerate cup pairing.
- The rational connection has a pole where 1 + 5⁵λ⁵ = 0; the formal extension at λ = 0 does not remove it.
- 24, 50, 35, 10 are the coefficients of (θ + 1)(θ + 2)(θ + 3)(θ + 4) = θ⁴ + 10θ³ + 35θ² + 50θ + 24.
- The first D column gives e₀=u₀; its last gives e₃=−u₀−7u₁−6u₂−u₃. These distinguish the column convention from its transpose.
- D has determinant 1, hence remains invertible modulo both 3 and 7. This tests the derivative-to-monomial change, separately from the factorials in the residue comparison.
- The top generator has charge 5−5=0 but `ι_{E_c}ω` has nonzero dx₁∧⋯∧dx₅ coefficient 5t. Requiring that contraction to vanish would discard the generator instead of projectivizing it.

*Needs:* Layer PS.8.12; ComplexComparisonPartII C5 (C5.2, Gauss–Manin connection).

### PS.8.14 The normalized Dwork Frobenius

On the overconvergent twisted complex, the raw Frobenius pulls back (x, t, λ) to (x^p, t^p, λ^p) and multiplies by `exp(π(t^pφ_{λ^p}(x^p)` − tφ_λ(x))). Define F = p⁻²F_raw on the selected H³ model. It is semilinear for λ ↦ λ^p, satisfies δF = pFδ, and multiplies the alternating pairing by p³: (Fx, Fy) = p³σ((x, y)). The factor p⁻² matches the usual cohomological Frobenius convention (SH, §3.3, pp. 4–5; §4.3, pp. 9–10). PS.8.17 derives its fixed-good-fibre version from Park Proposition 5.2 and the geometric residue twist, and identifies F with the geometric Frobenius on the family and at the boundary.

The overconvergence of the exponential factor is the Dwork splitting-function estimate (PadicDifferentialEquationsAndRigidCohomology RD.1.46 and RD.1.63). The comparison with crystalline Frobenius is PS.8.17.

To prove this, check that the exponential factor intertwines the two twisted differentials (with the pullback factors of the differentials), restrict to the degree-zero invariant component, normalize by p⁻², and differentiate in the parameter.

The interface includes the following facts.

- The raw operator is the coordinate p-power pullback multiplied by the specified exponential factor.
- F = p⁻²F_raw.
- Horizontality is δF=pFδ.
- F(λv) = λ^pF(v).
- (Fx, Fy) = p³σ((x, y)).

**Checks.**

- At p = 3 the boundary value F(e₃) = e₃ becomes F_raw(e₃) = 9e₃. Omitting p⁻² gives the wrong last diagonal entry.
- For p = 3, F(λe₃) = λ³F(e₃), whereas λF(e₃) would incorrectly make the map linear in the parameter.
- If (e₀, e₃) = Y₀ ≠ 0 at the boundary, then (F(e₀), F(e₃)) = 27Y₀ at p = 3. An isometry would give Y₀.

*Needs:* Layer PS.8.13; PadicDifferentialEquationsAndRigidCohomology RD.1.46 and RD.1.63; CrystallineCohomology CR.7.

### PS.8.15 The Dwork sums and their convergence

Let exp(z + z^p/p) = `Σ_{n≥0}` B_n zⁿ in ℚ⟦z⟧. Define

```text
σ₀ = Σ_{n≥1} B_n (n − 1)!,   σ₂ = Σ_{n≥3} B_n (n − 1)! Σ_{1≤j<i≤n−1} 1/(ij),   Δ₃ = σ₂ − σ₀³/6,
```

as sums in ℚ_p, and the boundary coefficient C = p³·24Δ₃/25. Prove that both series converge in ℚ_p for every prime p: write exp(z + z^p/p) = `E_p(z)·∏_{k≥2}` `exp(−z^{p^k}/p^k),` with the product interpreted degree by degree (only finitely many k contribute to a fixed coefficient), and E_p the Artin–Hasse series, which has p-integral coefficients (PadicDifferentialEquationsAndRigidCohomology RD.1.63). The factor `exp(−z^{p^k}/p^k)` has coefficient of `z^{m p^k}` of valuation −km − v_p(m!) ≥ −m p^k (k + 1/(p − 1))/p^k, and (k + 1/(p − 1))/p^k decreases in k ≥ 2, so v_p(B_n) ≥ −n(2p − 1)/((p − 1)p²) for nonzero coefficients, with v_p(0)=+∞ in this estimate. With v_p((n − 1)!) ≥ (n − 1)/(p − 1) − log_p n − 1 (Legendre, Mathlib `sub_one_mul_padicValNat_factorial`) this gives v_p(B_n (n − 1)!) ≥ n(p − 1)/p² − log_p n − 2 → ∞, and the harmonic weights lower the valuation by at most 2 log_p n. Shapiro asserts the convergence and refers the estimate elsewhere; the Artin–Hasse argument above gives a proof route with explicit inputs (SH, Definition 6.1 and Lemma 6.2, pp. 14–15; Lemma 6.3 and §§6.1–6.4, pp. 16–19).

The sums are defined through Mathlib's HasSum in ℚ_p, never through a total sum that is 0 for nonsummable families.

For the monomial reduction in PS.8.16 also define `D_{αβ}` = [x^α] `∏_{i=1}^{β}(x` + i), `P_{α,i}` = `5^{−α−1}D_{α,i−1}` for i > 0 with `P_{α,0}` = `δ_{α0},` and `Q_{α,s}` = (−1)^α `D_{αs};` SH Theorem 5.13 expresses each normalized pairing `c_{α,I}` as the degree 3 − #I − α convolution of Q with five P factors, with the empty convolution 0 in negative degree.

The interface includes the following facts.

- `dworkSeries`, `dworkCoeff` and `dworkPairWeight` give the series, its coefficients B_n and the strict harmonic-pair weights.
- B₂ = 1/2 for p ≥ 3.
- B₀ = 1 and nB_n = `B_{n−1}` + `B_{n−p},` with B_k = 0 for k < 0.
- `dworkSigma0_summable` and `dworkSigma2_summable` assert convergence in ℚ_p for every prime p.
- Δ₃ and C.
- SH Theorem 5.13, with `c_{3,0}` = 1, `c_{0,0}` = `c_{1,0}` = `c_{2,0}` = 0 and `c_{α,I}` = 0 when α + #I > 3.

**Checks.**

- B₀ = B₁ = 1 and B₂ = 1/2 for every odd p, while B₂=1 at p=2. The two convergence theorems include p=2.
- At p=2 the bound is v₂(B_n(n−1)!) ≥ n/4−log₂(n)−2 for n≥1, with v₂(0)=+∞. At n=1,2 the actual valuations are 0,0 and the lower bounds are −7/4,−5/2. The harmonic loss is at most 2log₂(n), leaving positive linear slope 1/4.
- B_n = 1/n! for 0 ≤ n < p.
- The harmonic pair weights at n = 0, 1, 2 are zero (no pair j < i); at n = 3, 4, 5 they are 1/2, 1, 35/24. Including diagonal pairs or counting both orders changes these values; reversing the strict inequality alone leaves this symmetric sum unchanged.
- B_p = 1/p! + 1/p; replacing z^p/p by z^p in the exponent loses the second term.
- The valuation bound: for p = 3, v₃(B_n) ≥ −5n/18, and v₃(B_n (n − 1)!) → ∞; the bare series Σ (n − 1)!/n! = Σ 1/n diverges in ℚ_p, so the Artin–Hasse factorization is what makes the sums converge.

*Needs:* PadicDifferentialEquationsAndRigidCohomology RD.1.63; Mathlib PowerSeries.exp, HasSum, `Padic`, `sub_one_mul_padicValNat_factorial`.

### PS.8.16 Shapiro's boundary Frobenius matrix

In the column-input basis e_i = δ^iω at λ = 0, the normalized Frobenius has matrix

```text
[[p³, 0, 0, 0], [0, p², 0, 0], [0, 0, p, 0], [p³·24Δ₃/25, 0, 0, 1]].
```

Its only possibly nonzero off-diagonal entry is in row 3, column 0. With the residue N of PS.8.13 it satisfies NF = pFN, and FᵀJF = p³J for the boundary alternating matrix J of PS.8.13. Shapiro's numerical evidence relating Δ₃ to a p-adic L-value is not a theorem here (SH, §§6.1–6.4, pp. 16–19; Definition 6.1 and Lemma 6.2, pp. 14–15; Theorem 5.13, pp. 13–14; this version has no Theorem 6.1).

The statement is about the formal limiting module over ℂ_p; integrality is PS.8.17.

To prove this, compute F(e₀) by the monomial reduction and the Dwork sums of PS.8.15 and simplify the pairings to Δ₃; obtain the remaining columns from δF = pFδ; verify the residue and pairing identities in the same basis.

The interface includes the following facts.

- The matrix, with δ standing for Δ₃.
- NF = pFN.
- FᵀJF = p³J.
- The normalized Frobenius at λ = 0 has this matrix with δ = Δ₃.

**Checks.**

- F(e₀) = p³e₀ + Ce₃ and F(e₃) = e₃; the transposed matrix fails NF = pFN whenever C ≠ 0.
- With p = 3 and δ = 0 the diagonal is (27, 9, 3, 1), and NF(e₀) = 27e₁ = 3FN(e₀). Reversing the powers gives 1 = 9 on this coefficient.
- FᵀJF = p³J holds for every value of C: the off-diagonal entry is invisible to the pairing test and is pinned only by the Dwork sums.

*Needs:* Layers PS.8.15 and PS.8.14.

### PS.8.16a Equivariant semistable models of reciprocal Dwork families

For every integer N>1 and perfect field k of characteristic p with p∤N, put W=W(k) and B=Spec W[T,U,U⁻¹,(1−(TU)^N)⁻¹]. Define the reciprocal Dwork family Y→B by UT∑X_i^N=N∏X_i in ℙ^(N−1)_B. Its symmetry group scheme is the finite étale quotient H₀=ker(μ_N^N→μ_N)/μ_N, where the map is multiplication and the denominator is the diagonal subgroup; it acts by coordinate scaling and becomes the usual diagonal symmetry group after a splitting extension. Construct a projective H₀-equivariant modification X→Y which is an isomorphism over T≠0 and has H₀-equivariant étale charts over B with equation TU=Z₁⋯Z_r, with the remaining chart coordinates invertible. Equip X with the divisorial log structure of T=0 and B with its corresponding log structure; prove that X→B is integral and log smooth with reduced normal-crossings boundary (Qian, Lemma 2.1 and Remark 2.2, pp. 4–8).

The construction starts with D={∑X_i^N=0} and D_i={X_i=0} in Y. Blow up the scheme-theoretic intersection D∩D_N and then the intersections of the strict transforms of D and D_j in descending order j=N−1,…,1. The centres are H₀-stable, which lifts the action. Follow Qian's chart calculation to prove the local equations and their character actions; on T≠0 the centres are Cartier and the blowdown is an isomorphism. Projectivity follows from the finite composition of projective blowups. Flat base change commutes with these blowups and strict transforms. For a unit specialization U=u, base change the resulting projective morphism and étale charts: these retain equivariance, the isomorphism over T≠0 and the chart equation uT=Z₁⋯Z_r. This specialization need not be flat and does not assert that every blowup centre commutes with arbitrary base change. Absorbing u into Z₁ identifies the log chart with T=Z′₁Z₂⋯Z_r. For a mixed-characteristic complete DVR O receiving W, with T sent to a uniformizer and U to a unit, these charts give a proper strictly semistable O-model of the generic fibre (Qian, proof of Lemma 2.1 and paragraph after Remark 2.2, pp. 4–8).

The interface includes the following facts.

- The projective reciprocal family Y→B with its H₀-action, and the projective equivariant modification X→Y.
- The blowdown is an isomorphism on T≠0 and identifies the generic fibre with the original family.
- The equivariant chart equations, with each chart coordinate acted on by a character; the boundary is reduced and has normal crossings.
- The divisorial log morphism is integral and log smooth, with characteristic-monoid map ℕ→ℕ^r sending 1 to (1,…,1).
- Flat coefficient base change preserves the blowup construction; unit specialization preserves the projective modification, charts, action and smooth-locus isomorphism.
- Sending T to a uniformizer and U to a unit gives a proper strictly semistable model over the stated DVR.

**Checks.**

- For N=2 in characteristic 3, 2 is a unit and the boundary X₁X₂=0 in ℙ¹ consists of two reduced points; for N=3 in characteristic 3 the equation at T=0 is 0=0, so the claimed coordinate-hyperplane boundary fails and that characteristic is excluded. Neither N=1 nor p∣N is in the domain.
- An r=1 chart has Z₁=TU and is smooth over B; an r=2 chart has Z₁Z₂=TU and at T=0 gives Z₁Z₂=0, with two transverse reduced components. Replacing T by a square in this local equation would give a different total space and is excluded by the specified chart.
- The blowup of 𝔸²_k at its origin has fibre ℙ¹_k over that origin, whereas the blowup of Spec k in the pulled-back zero ideal is empty. This excludes an arbitrary-base-change law for the blowup construction; unit specialization here base changes the constructed morphism and charts.
- For N=5 at T=0, (0,0,1,−1,0) lies on Y and both the defining equation and all its first derivatives, including ∂/∂T, vanish. The total space needs modification there; the unchanged family cannot serve as X.
- Diagonal ζ∈μ_N fixes projective coordinates, while the product-one condition preserves ∏X_i; for N=3 a tuple (ζ,1,1) with ζ≠1 preserves ∑X_i³ but multiplies the product by ζ and is excluded. This distinguishes H₀ from the full coordinate-scaling group.
- At N=5,U=−5,T=λ the equation is −5(λ∑X_i⁵+∏X_i)=0, the chart is −5λ=Z₁⋯Z_r, and 1−(TU)^5=1+5⁵λ⁵. At λ=−1/5 the last expression is 0; at λ=1/5 it is 2. For p=3 the unit −5 is invertible and Z′₁=−Z₁/5 gives λ=Z′₁Z₂⋯Z_r; for p=5 this unit specialization is unavailable.

*Needs:* SchemeAndStackFoundations §§1.17, 1.23, 4.11 (finite-group quotients, modifications and strict transforms); TauCetiRoadmap StableReduction Layer 4 (blowups, their projectivity and flat base change); CrystallineCohomology Layer CR.5:log-algebra (integral charts, log smoothness and divisorial log structures).

### PS.8.17 The crystalline comparison of the boundary Frobenius

For odd p ≠ 5 take the smooth family over ℤ_p[λ,λ⁻¹,(1+5⁵λ⁵)⁻¹], with the splitting coefficient extension for μ₅ when required by PS.8.12. The coefficient extension is unramified at p≠5; take the invariant projector only after 125 is a unit. Prove quinticDworkComparison: the normalized Dwork Frobenius F = p⁻²F_raw of PS.8.14 is the geometric Frobenius of the order-125-invariant H³. Precisely, under the residue isomorphism of differential modules in step 3, F agrees on the punctured formal disc at λ=0 with the Frobenius structure of the relative rigid cohomology of the family, with no scalar ambiguity, and its holomorphic extension across λ=0 in the basis e_i, whose matrix is that of PS.8.16, is the Frobenius of the logarithmic crystalline realization of the special fibre of the semistable model, with N the monodromy operator. This is a rational statement; whether the e_i span the integral lattice is the predicate of step 6 (Kedlaya (K), Lemma 2.3.6, p. 4, Lemma 2.3.8, pp. 4–5, Proposition 3.1.11, pp. 9–10, and Remark 4.1.3, p. 17; Park, Proposition 5.2, p. 449; K Example 4.4.1, pp. 20–21, treats the same hypergeometric parameters at λ=0).

1. quinticSemistableParameter: specialize PS.8.16a's equivariant reciprocal-Dwork model at N=5,T=λ,U=−5, using its unit-specialization theorem and flat unramified coefficient base change. The equation becomes −5(λ∑X_i⁵+∏X_i)=0, hence defines our family since −5 is a unit. The boundary charts become −5λ=Z₁⋯Z_r; absorbing the unit in one coordinate gives the semistable log structure and identifies the H₀-action with the order-125 group G of PS.8.12 and the smooth-locus blowdown with this family (Qian, Lemma 2.1 and Remark 2.2, pp.4–8).
2. quinticCrystalline: use the equation φ = λ∑X_i⁵ + ∏X_i over S_W = Spec W[λ,λ⁻¹,(1+5⁵λ⁵)⁻¹], where W is the unramified splitting extension. This is a projective smooth lift over the smooth base S_W: if all X_i are nonzero, the simultaneous equations φ = ∂φ/∂X_i = 0 force 1+5⁵λ⁵ = 0; if a coordinate is zero, the partial derivatives exclude a singular point for λ ≠ 0 and p ≠ 5. For compatible compactifications take the closure a∑X_i⁵+b∏X_i=0 in ℙ⁴_W × ℙ¹_W, with λ=a/b, and its projection to ℙ¹_W. Its inverse image over S_W is exactly the given family; the projection is projective, and p-adic completion gives the compatible proper frames. Verify the compactification diagrams and formal lifting hypotheses of RD.5.115 on these frames, using the semistable modification of step 1 near λ=0, which is unchanged over S_W. Apply RD.5.115 to the unit coefficient to obtain the relative overconvergent F-isocrystal with fibre H³_rig; the order-125 projector is defined over W and commutes with connection, base change and Frobenius, so take its rank-four summand. Apply CR.7 separately, proving finite projectivity and base change for the invariant integral crystalline cohomology, and compare its rationalization with this direct image. RD.4.36–RD.4.38 and RD.7.1 supply the rational comparison of geometric rigid and crystalline cohomology, including their Frobenius. The proper de Rham/completed-PD calculation is also available via Schwarz–Shapiro (SG), Lemma 4.11, pp.21–22, Lemmas 4.14–4.15, p.26, and Theorems 4.16/4.18, pp.27–28. Its local divided-power homotopy and proper formal-functions argument explain which completion is used; ordinary polynomial primitives cannot replace divided-power primitives.
3. quinticProjectiveResidue: the ℚ(π)(λ)-linear map Res∘T of the fixed-fibre paragraphs below, applied over the function field of the parameter line, sends u_s to (−1)^s s! r_s and intertwines δ (SH Lemma 4.8 on the u_s; differentiation of the r_s, see the Checks). It identifies H ⊗ ℂ_p((λ)) with the invariant H³_dR of the generic fibre as differential modules; both are the pullback along z=−5⁵λ⁵ of the hypergeometric module with parameters (1/5, 2/5, 3/5, 4/5; 1, 1, 1, 1), by the relation of PS.8.13. SS §3, pp.12–13, leaves the crystalline identification of its twisted computation open; this step and step 4 supply it.
4. Uniqueness of the Frobenius structure. Both F and the geometric Frobenius Φ of step 2 are Frobenius structures for λ↦λ^p on this connection, over regions of the λ-line whose complements are closed discs inside the residue discs of Z={0,∞}∪{λ : 1+5⁵λ⁵=0}. The hypotheses of K Lemma 2.3.6 hold. (a) The connection is trivial on the open residue disc of a point of good reduction, because the Gauss–Manin connection of the smooth proper family is a crystal there (CR.7). (b) For p≠5 the points of Z are pairwise incongruent modulo p: the conifold parameters −ζ/5, ζ⁵=1, are p-adic units and x⁵−1 is separable modulo p. (c) The connection is regular at Z with exponents in ℤ: 0 at λ=0, 0, 1, 1, 2 at the conifold points, and 1, 2, 3, 4 at ∞. (d) It is irreducible over ℚ_p(λ): the hypergeometric module is irreducible over ℚ_p(z) because α_i−β_j∉ℤ (K Proposition 3.1.11(b) and Remark 4.1.3), and the pullback along the cyclic cover z=−5⁵λ⁵ of degree 5 stays irreducible, since by Clifford's theorem a restriction to a normal subgroup of prime index 5 that became reducible would split into five conjugate summands, impossible in rank four. Hence Φ=cF for a constant c. At one smooth Teichmüller fibre the fixed-fibre comparison below gives (Res T)F_raw=q²Fr_V(Res T), so c=1.
5. quinticLogComparison: construct the invariant rational relative logarithmic H³ of the proper semistable model of step 1 over the formal λ-disc. Its semistable charts have the integral monoid map ℕ → ℕ^r, 1 ↦ (1,…,1); thus the morphism is proper, integral and log smooth, and the base is regular. Apply RD.5.107–RD.5.109 to the unit isocrystal and the invariant projector. Prove that the resulting cohomology module is locally free of rank four, with logarithmic Gauss–Manin connection and nilpotent residue; identify its fibre at 0 with the invariant log-crystalline/Hyodo–Kato H³ of the special fibre. Construct its punctured-disc comparison with step 2's relative rigid H³, preserving the connection and Frobenius: on the smooth locus the log structures are trivial, so use the same relative de Rham complex of the formal lift in RD.5.109 and RD.5.115, then the relative rigid–crystalline comparison. This identifies both extensions inside the differential module of step 3. Rank and nilpotent residue are proved using that identification with PS.8.13 and proper log base change; perfectness alone is not local freeness. For the fibre comparison apply CR.6.3 in every cohomological degree and then in invariant H³. Its finite-level PD Poincaré maps commute with the signed dlog λ triangle, identifying the residue with N in the convention of PS.8.13. The inverse-limit step uses proper finite W-cohomology: in `0→H^i/p^a→H^i_a→H^{i+1}[p^a]→0` the last transition is multiplication by p. This kills the inverse limit of the torsion terms; it does not prove H^i torsion-free (Qian, Theorem 1.6, p.4, Theorem 3.2 and proof, pp.14–18). The rationalized log-crystalline realization restricts on the punctured disc to the F-isocrystal of step 2, and its residue is the nilpotent monodromy operator. By K Lemma 2.3.8(b)–(c), with all exponents at λ=0 equal to 0, F and Φ extend holomorphically across λ=0 in any basis on which δ has nilpotent residue, such as e_i. Two such extensions of one module coincide. Each has a ℂ_p⟦λ⟧-basis f, g on which δ acts by a constant nilpotent matrix N₁, N₂ (the Frobenius method applies because every exponent at λ=0 is 0; compare K Lemma 2.3.8(b)). Writing g=fA with A=Σ a_nλⁿ∈GL₄(ℂ_p((λ))), one gets λA′=AN₂−N₁A, so n·a_n=a_nN₂−N₁a_n; the right side is a nilpotent operator applied to a_n, hence a_n=0 for n≠0, A is constant and the two lattices are equal. Therefore the matrix of PS.8.16 is the matrix of the log-crystalline Frobenius at λ=0 in the basis e_i.
6. QuinticBoundaryLatticeIntegral p, a predicate: the images of e₀,…,e₃ form a W-basis of the torsion-free quotient of the invariant integral log-crystalline H³ of the special fibre, W the Witt vectors of the residue field of the coefficient extension; equivalently, for a W-basis b of that quotient, the matrix C with (b₀,…,b₃)=(e₀,…,e₃)C lies in GL₄(W). Under this predicate prove quinticBoundary_integral_of_lattice: the matrix of PS.8.16 has entries in W, so p³·24Δ₃/25∈W: v_p(Δ₃)≥−3 for p≥7, while v₃(24)=1 gives only v₃(Δ₃)≥−4 at p=3. The predicate is used only as a named hypothesis. Prime-to-p étale torsion-freeness does not establish p-primary crystalline torsion-freeness; SG Lemma 5.6, p.30, has p>dim(V) and so excludes p=3 for this threefold, and mirror-map integrality proves neither assertion.

**Fixed-fibre projective map.** Let φ be the coefficientwise Teichmüller lift of a smooth quintic over 𝔽_q, S=tφ and U=ℙ⁴\V. Take a finite coefficient extension containing π and a scalar ℏ of positive valuation. Park uses `D_{ℏ,πS}=ℏ(d+πdS)` and the completion C(ℏ)=K{x,ℏt}. Its charge-zero forms obey |u|+|α|=5(s+|β|) on x^u t^s dx^α∧dt^β. This degree bound converts positive linear valuation growth in s into positive linear growth in total degree. Thus the charge-zero part of C(ℏ) lies in the usual dagger complex, and every charge-zero dagger form lies in one such C(ℏ) after a finite coefficient extension with sufficiently small positive v_p(ℏ). Use the chain isomorphism `D→D_{ℏ,πS}` that multiplies degree-j forms by ℏ^j. Then the maps ρ̃_S^j=ℏ^jρ_S^j have formulas independent of ℏ, so commute with inclusions between radii. Park Corollary 4.12, p.445, makes the polynomial inclusion a quasi-isomorphism for the smooth complete-intersection fibre at every radius. Exact filtered colimits give the dagger comparison; finite coefficient base change and descent use RD.4.31. The raw Frobenius is handled between radii using the splitting-function estimates of PS.8.14 and Park Proposition 5.2, rather than assuming a chosen closed radius contains every series. Park Definition 4.8/Remark 4.9 and Theorem 4.11, pp.442–445, supply the radius spaces and convergent comparison maps.

On top polynomial forms Park Definition 3.1, p.433, gives the following specialization of the comparison map, with the displayed differential convention:

```text
ρ_S(x^u t^s dx₁∧⋯∧dx₅∧dt)
  = (−1)^s s! x^u /(ℏ⁶ π^{s+1} t φ^{s+1}) dx₁∧⋯∧dx₅∧dt.
```

Its target is ordinary de Rham cohomology of the localized affine space S≠0. Let `θ_w=ι_{t∂_t},` `θ_c=ι_{Σx_i∂_{x_i}−5t∂_t}` and `Ω=ι_{Σx_i∂_{x_i}}(dx₁∧⋯∧dx₅).` The map T=−πℏ⁶ θ_cθ_wρ_S sends top cohomology to H⁴_rig(U), with T(ω)=Ω/φ. The two contractions are taken here, after ρ_S, on charge- and weight-zero ordinary forms (Park Lemmas 2.2–2.3 and Proposition 2.4, pp.430–432). The decomposition in Theorem 1.2 at i=6 is H⁵_rig(U)⊕H⁴_rig(U); the first summand vanishes because RD.4.24 computes this smooth affine fourfold by a dagger de Rham complex of length four. Park §1.1, (1.1), p.423, identifies complement cohomology with primitive hypersurface cohomology as vector spaces. For Frobenius retain the residue isomorphism `H⁴_rig(U)≅H³_{prim,rig}(V)(−1),` using the shift and twist in RD.4.20–RD.4.22 and RD.4.29. It is a geometric rational comparison, not an integral residue-basis theorem.

For the coordinate q-power lift, each Euler contraction satisfies θ Fr=q Fr θ. Park Proposition 5.2, p.449, gives ρ_S(qF_raw)=Frρ_S, including the factor q. Therefore T F_raw=q Fr_U T. The geometric residue satisfies Res Fr_U=q Fr_V Res because of the (−1) twist. It follows that (Res T)F_raw=q² Fr_V(Res T). This derives the normalization q⁻²F_raw on the good fibre and fixes the constant c=1 in step 4. For q=p^a it concerns the a-fold p-Frobenius and the induced coefficient action; it does not turn the parameter-semilinear formal operator into a linear one.

**Residue coordinates and the small prime.** Put r_s=Res((∏x_i)^s `Ω/φ^{s+1}),` s=0,…,3. The normalized map above sends u_s to (−1)^s s!r_s, so the columns of the derivative classes in these rational residue coordinates are

```text
R = diag(1,−1,2,−6) D
  = [[1,−1,1,−1], [0,1,−3,7], [0,0,2,−12], [0,0,0,6]],   det R=12.
```

This is R; its determinant is the residue basis determinant. It records the factorials in the explicit rational comparison. It is not the integral matrix C of step 6. In particular v₃(det R)=1, whereas v_p(det R)=0 for every allowed prime p≥7. If the r_s were a basis of the geometric W-lattice over an unramified Witt coefficient ring, the quotient by the derivative span would have W-length one at p=3 (index 3 only when W=ℤ₃). The r_s might themselves have denominators or span a different lattice: neither det D=1 nor an invertible rational R identifies the geometric lattice, and no integral index is asserted outside the predicate of step 6.

The interface includes the following facts.

- The unit and parameter adapter from PS.8.16a's general semistable model to the quintic, with its equivariant charts and unramified base change.
- The invariant H³ F-crystal and its rationalization as the RD.5.115 direct image, after verification of the formal lift and compactification hypotheses.
- The rank-four relative logarithmic module, its fibre at 0 and its punctured comparison with the relative rigid module, preserving connection, Frobenius and residue N.
- Res∘T on the fixed-fibre complexes with the compatible-radius construction, and over the function field of the parameter line.
- (Res T)F_raw=q²Fr_V(Res T).
- F is the geometric Frobenius on the punctured disc, with constant 1.
- The boundary matrix of PS.8.16 is the log-crystalline Frobenius at λ=0 in the basis e_i.
- R, a light integer matrix.
- Det R=12.
- The integral boundary-basis predicate is the condition in step 6; under it the matrix entries lie in W, with the stated prime-dependent valuation bound.

**Checks.**

- The integrality predicate is stated over W together with the good-prime restrictions (p odd, p ≠ 5) and the change-of-basis matrix C; no congruence is drawn from PS.8.16 without it.
- Mirror-map integrality (PS.8.11) is independent of this target; neither an enumerative equality nor a p-adic L-value identity follows from it.
- In the smooth lift, at X_i=1 the equations φ=0 and ∂φ/∂X_i=0 both give 5λ+1=0; this point is removed by 1+5⁵λ⁵. At λ=0 the point (0,0,1,1,1) has φ and every partial derivative zero, so the smooth direct-image theorem is unavailable there and the log adapter is essential.
- For the relative log module at λ=0, N e₀=e₁, N²e₀=e₂, N³e₀=e₃ and N⁴e₀=0: the fibre has rank four, not four independent constant classes. For p=3, NF(e₀)=27e₁=3FN(e₀), retaining the signed residue convention through both comparisons.
- For two nilpotent-residue extensions in the same differential module, the coefficient equation at λ¹ is a₁=a₁N₂−N₁a₁ and forces a₁=0; at λ⁰ it is a₀N₂=N₁a₀. Rescaling one rank-one lattice by λ would instead change its residue from 0 to 1 and is excluded. This tests the shared-module and nilpotent-residue hypotheses of the uniqueness argument.
- In the general semistable charts, r=1 gives Z₁=TU and a smooth relative affine chart; r=2 gives Z₁Z₂=TU and at T=0 the two coordinate components meet transversely. These computations test PS.8.16a's general chart theorem and its N=5 parameter transport.
- For N=2 in residue characteristic 3 the coefficient N is a unit, so the general theorem applies; N=3 in characteristic 3 is excluded. The hypotheses concern N and the residue characteristic, rather than only the quintic prime set.
- At p = 5 the projector of PS.8.12 is not integral and the conifold parameters −ζ/5 are not 5-adic integers, so neither the construction nor hypothesis (b) of step 4 applies.
- At λ=0 the quintic polynomial is ∏X_i, its coordinate-hyperplane boundary; multiplying by −5 gives the general model's equation. At X_i=1 its value is 5λ+1, so λ=−1/5 gives zero, while λ=1/5 gives 2. This pins the parameter sign and the need to remove the discriminant.
- At p=3 the projector 1/125 is integral and the semistable adapter applies; the inequality p>3 in SG Lemma 5.6 does not. A proof valid only for p>3 would leave an allowed prime untreated.
- The consequence of the integrality predicate depends on p through 24/25: at p=3 the test value Δ₃=25/648, of 3-adic valuation −4, gives the integral entry 1, whereas a uniform bound v_p(Δ₃)≥−3 would wrongly exclude it.
- Uniqueness needs the whole λ-line: over the formal disc at λ=0 the module is unipotent, its horizontal endomorphisms are the polynomials in N, a four-dimensional algebra, and Frobenius structures there are not unique up to a scalar.
- The pairing alone does not fix the constant: −F also multiplies the alternating pairing by p³. The fixed-fibre normalization (Res T)F_raw=q²Fr_V(Res T) excludes c=−1.
- In the hypergeometric variable z=−5⁵λ⁵ the exponents at ∞ are 1/5, 2/5, 3/5, 4/5, and pulling back along the degree-five map multiplies them by 5 to 1, 2, 3, 4; both lie in ℤ_(p) for p≠5.
- The normalized projective map sends u₀ to r₀, u₁ to −r₁, u₂ to 2r₂ and u₃ to −6r₃. Forgetting the factorial changes the third and fourth columns and incorrectly removes the obstruction at 3.
- Differentiating the rational residue representatives gives `δr_s=−(s+1)r_s+(s+1)r_{s+1}.` Thus δr₀=−r₀+r₁ and δ²r₀=r₀−3r₁+2r₂, agreeing with the second and third columns of R; with `δu_s=−(s+1)u_s−u_{s+1}` this shows that u_s↦(−1)^s s!r_s intertwines δ.
- R has first column (1,0,0,0), last column (−1,7,−12,6), determinant 12 and rank 3 modulo 3. Modulo 7 its determinant is 5 and it has rank 4. These test the column convention, signs and prime dependence independently.
- Multiplying ρ_S alone by q instead of using Park's identity ρ_S(qF_raw)=Frρ_S gives the wrong normalization after the two Euler contractions and the residue twist. On a q=3 weight-three class, raw eigenvalues must be 9 times geometric eigenvalues, rather than 3 times them.
- If a rational basis b of a free rank-one W-module is replaced by e=b/p, then e is not integral even though the vector space is unchanged. In rank four the columns of C, not the names e_i, specify the lattice; with C=diag(p,1,1,1) a (3,0) Frobenius entry is multiplied by p under C⁻¹Fσ(C). At p=3, Δ₃=25/648 gives entry 1 in the e-basis and entry 3 in the b-basis.
- Replacing the raw Frobenius by p⁻¹ times it rather than p⁻² multiplies every normalized eigenvalue by p: at p=3 the boundary diagonal becomes (81,27,9,3) instead of (27,9,3,1). The pairing multiplier becomes p⁵ rather than p³.

*Needs:* Layers PS.8.12–PS.8.16a; CrystallineCohomology CR.5, CR.6.3 and CR.7; PadicDifferentialEquationsAndRigidCohomology RD.3, RD.4.20–RD.4.24, RD.4.29, RD.4.31, RD.4.36–RD.4.38, RD.5.107–RD.5.109, RD.5.115 and RD.7.1.

### Examples

- The Gram matrix G₀ has determinant −4, and the period line (p, −1, 2p²) is isotropic.
- The five monodromy matrices preserve G₀ and multiply to 1 in the order M_∞M₄M₃M₂M₁.
- `quarticA 1 = 24`, `quarticA 2 = 2520`, `quarticG 1 = 104`, and the mirror coordinate begins z + 104z² + 15188z³.
- The quintic connection matrix at λ = 0 is nilpotent of order exactly 4; λ = −1/5 is a singular parameter.
- For p = 3, B₃ = 1/6 + 1/3 = 1/2.

### Dependencies

Layers PS.0–PS.2; MotivesAndAlgebraicCycles MC.2; ComplexComparisonPartII C5; SchemeAndStackFoundations §§1.17, 1.23, 4.11; TauCetiRoadmap StableReduction Layer 4; K3Surfaces K2; K3SurfacesAndSymplecticBoundedness §§3.1, 4.2; IntegralLattices Layer 5 milestones 5G–5H and Layer 6 milestone 6A; ModularCurvesPartII §3.6; CrystallineCohomology CR.5–CR.7; PadicDifferentialEquationsAndRigidCohomology RD.1.46, RD.1.63, RD.3, RD.4.20–RD.4.24, RD.4.29, RD.4.31, RD.4.36–RD.4.38, RD.5.107–RD.5.109, RD.5.115, RD.7.1; Mathlib PowerSeries, `ordinaryHypergeometric`, `Complex.Gamma`.
## Layer PS.9: multiple zeta values and mixed Tate periods

This layer develops multiple zeta values from their series through Brown's theorem. The numerical part (indices, the supplied two-letter shuffle product and the index-specific stuffle product, iterated integrals, the two regularizations and the comparison operator of Ihara–Kaneko–Zagier, and Zagier's evaluation of ζ(2, …, 2, 3, 2, …, 2)) uses only analysis. The motivic part constructs the category of mixed Tate motives over ℤ, its Galois group, the motivic torsor of paths on ℙ¹ ∖ {0, 1, ∞}, Brown's algebra of motivic multiple zeta values with its coaction, and proves that the Hoffman elements (indices made of 2s and 3s) form a basis; numerical spanning follows by applying the period map of Layer PS.2. Numerical linear independence, exact numerical dimensions, completeness of the double shuffle relations and injectivity of the period map remain predicates; no theorem depends on them.

Conventions: indices are descending, ζ(k₁, …, k_r) = `Σ_{n₁ > ⋯ > n_r > 0}` ∏ `n_i^{−k_i};` admissible means empty or k₁ ≥ 2; Brown and Zagier write indices ascending, and translation reverses the whole word.

### PS.9.1 Indices and convergent multiple zeta values

An index is a finite list k of positive integers, with weight Σ k_i and depth its length; it is admissible when it is empty or k₁ ≥ 2. Define `multipleZeta k` = `Σ_{n₁ > ⋯ > n_r > 0}` ∏_i `n_i^{−k_i},` as a sum of nonnegative reals indexed by strictly decreasing positive tuples; ζ([]) = 1. Brown and Zagier use increasing summation indices with the last entry at least 2, so ζ_desc(k) = ζ_asc(reverse k). No convergent value is assigned to ζ([1]) (Ihara–Kaneko–Zagier (IKZ), §1, pp. 307–308; Brown (B), Introduction, p. 1).

To prove convergence, bound the inner nested harmonic sums by powers of 1 + log n₁ and sum `n₁^{−2}` times that bound; conversely if k₁ = 1 the sum dominates a harmonic series. The depth-one case is Mathlib `zeta_nat_eq_tsum_of_gt_one` after reconciling the zero summand.

The interface includes the following facts.

- `PositiveIndex`, `Admissible`, `DescendingTuple`, `mzvTerm` and `multipleZeta` specify positive descending indices and their total sum.
- Weight is the sum of the entries and depth is their number.
- `mzv_summable_iff` (for a positive index, summability holds exactly when it is admissible).
- ζ([n]) is the real part of Mathlib's riemannZeta n for n ≥ 2.
- The empty-index value one, Euler’s depth-one value at two, divergence at the index [1].
- The ascending dictionary.

**Checks.**

- ζ([]) = 1, with weight and depth 0. `PositiveIndex []` and `PositiveIndex [1, 2]` hold, whereas `[0]` fails positivity; `[2, 1]` and the empty index are admissible but `[1, 2]` is not.
- For a length-two index the tuple (2, 1) is descending; (1, 2), (1, 1) and (1, 0) fail. For k = [2, 1] the term at (2, 1) is 1/4; the depth-one term for [3] at 2 is 1/8, and the empty product is 1.
- ζ([2]) = π²/6 (Mathlib `riemannZeta_two`).
- [1] is not admissible and its series is the divergent harmonic series.
- ζ([2, 1]) and ζ_asc([2, 1]) = ζ([1, 2]) differ: the second is divergent.

*Needs:* Mathlib riemannZeta, `zeta_nat_eq_tsum_of_gt_one`, `riemannZeta_two`, `tsum`, Summable.

### PS.9.2 Shuffle and stuffle word algebras

Take W to be ColemanIntegration L1.12's shuffle word algebra over ℚ on two letters, using Bool≃Fin 2 with false↦0 and true↦1. The finitely supported module (List Bool) →₀ ℚ is a coordinate presentation, not another generic algebra. Construct its basis-preserving algebra equivalence to the supplied word algebra and the compatible coalgebra equivalence of AnabelianGeometryAndNonabelianChabauty §2.0 ‘Word algebra and shuffle coordinates’. Its underlying linear equivalence with Tau Ceti `TauCeti.TensorWords ℚ (Bool →₀ ℚ)` preserves all-cut deconcatenation; TensorWords' concatenation is distinct from the supplied shuffle multiplication. Let H¹ = ℚ + W·1 (empty word and words ending in 1) and H⁰ = ℚ + 0·W·1 (empty word and words beginning with 0 and ending in 1). Encode an index k by `0^{k₁−1}1` ⋯ `0^{k_r−1}1.` The imported shuffle law counts interleavings with multiplicity, with empty word as unit; `shuffles` is only its two-letter list presentation for the numerical headline; the stuffle product on positive index words interleaves and adds the merge term, (a::u) * (b::v) = a::(u * (b::v)) + b::((a::u) * v) + (a + b)::(u * v). The supplied shuffle algebra restricts to H¹. Extending stuffle ℚ-bilinearly gives a separate commutative algebra on H¹ through the encoding bijection. Put the two structures on separate type synonyms of H¹; H⁰ is a subalgebra for each. No stuffle product on words ending in 0 is specified (IKZ, §1, pp. 307–309).

For shuffle, transport the supplied algebra and coalgebra laws through the word-basis equivalences, preserving multiplicities, empty word, length filtration and coefficient base change. Prove closure of H¹ and H⁰ by their endpoint conditions. For stuffle, use ordered merges to prove the separate algebra laws and closure through the positive-index encoding. TensorWords supplies only the underlying module and concatenation/deconcatenation presentation.

The interface includes the following facts.

- `shuffles` and `stuffles` retain all interleavings or merges with multiplicity.
- `mzvEncode` and `mzvDecode` are inverse between positive indices and the empty word together with words ending in 1.
- Shuffle is an algebra on W and restricts to H¹; stuffle is an algebra on H¹, on a separate type synonym.
- The basis-preserving algebra equivalence to the Coleman word algebra and coalgebra equivalence to the NC coordinate presentation, preserving unit, multiplicities, length and coefficient extension.
- The underlying linear equivalence with TensorWords, preserving grading and deconcatenation; the paired completed algebra has concatenation.

**Checks.**

- 01 ⧢ 01 = 4·0011 + 2·0101 in both the local list presentation and the Coleman basis; identifying repeated words as a set would give 0011+0101 and fails.
- The product of the one-letter coordinate 0 with itself is 2·00. Under coefficient extension ℚ→ℚ₃ the coefficient is still 2, while the paired path-algebra product of the two generators is the single concatenation 00.
- [2] * [2] = 2·[2, 2] + [4].
- encode([]) = [], encode([1]) = 1 and encode([2, 1]) = 011; decoding gives those same indices. The word 001101 decodes to [3, 1, 2] and encodes back to 001101; the index [2, 1] is admissible although its last entry is 1.
- The empty word is the unit for both products; concatenation (01·01 = 0101) is not the shuffle product. The word 0 lies in W but not H¹, and so is outside the stuffle carrier.

*Needs:* Layer PS.9.1; ColemanIntegration L1.12 (generic word algebra); AnabelianGeometryAndNonabelianChabauty §2.0 ‘Word algebra and shuffle coordinates’ and §2.4 (coordinate coalgebra and duality); Tau Ceti `TauCeti.TensorWords.of`, `TauCeti.TensorWords.deconcatenation`; Mathlib `Finsupp.single`.

`mzvDecodeAux c w` counts c pending zeros before scanning w and discards trailing zeros. The encoding/decoding bijection is restricted to positive indices and words ending in 1 (and each nonempty admissible word also starts in 0). Outside that carrier, decoding 0 gives the empty index, while decoding 01 gives [2] and encoding [0] collides with encoding [1]; no unrestricted bijection is asserted.

### PS.9.3 Iterated integrals, endpoint limits and tangential regularization

For 0 < a ≤ b < 1 and a word w = c::u define `I_{a,b}([])` = 1 and `I_{a,b}(c::u)` = ∫_a^b κ_c(t) `I_{a,t}(u)` dt with κ₀(t) = 1/t and κ₁(t) = 1/(1 − t), using Mathlib's `intervalIntegral`; the head letter carries the largest integration time, and Brown's increasing-time word is the reverse. For admissible words the joint endpoint limit a → 0⁺, b → 1⁻ exists and equals ζ_desc. For all words, use the polynomial asymptotic regularization with the tangent vector +1 at 0 and −1 at 1; its constant term sets the singleton integrals of 0 and of 1 to zero (IKZ, §1, pp. 308–309; Deligne–Goncharov (DG), §§3.11–3.13, printed pp. 42–45).

To prove this, use compact-interval integrability to define the recursion; prove the shuffle identity by partitioning products of simplices with multiplicities; expand the kernels 1/(1 − t) in nonnegative geometric series and apply monotone convergence to get the nested sum; extract the regularized constants from the logarithmic asymptotics.

The interface includes the following facts.

- The compact-interval iterated integral has the recursive definition above.
- The recursion.
- For admissible k the endpoint limit of `I_{a,b}(encode` k) is ζ_desc(k).
- For n ≥ 1 and 0 < b < 1 the a → 0⁺ limit of `I_{a,b}(0^{n−1}1)` is Li_n(b), with Li₁(b) = −log(1 − b), PolylogarithmFunctions.
- Iterated integrals multiply by the shuffle product with multiplicities.

**Checks.**

- `I_{a,b}([])` = 1, also when a = b.
- The endpoint value of 001 is ζ([3]) and of 011 is ζ([2, 1]).
- `I_{0,b}(1)` = −log(1 − b) has no finite limit at b = 1, and its regularized constant is 0.

*Needs:* Layer PS.9.2; PolylogarithmFunctions (the classical polylogarithm); Mathlib `intervalIntegral`, MeasureTheory.integral_tsum.

### PS.9.4 Convergent double shuffle

The evaluation Z : H⁰ → ℝ, encode(k) ↦ ζ(k), is an algebra homomorphism for both the shuffle and the stuffle products. In particular ζ(2)² = 4ζ(3, 1) + 2ζ(2, 2) = 2ζ(2, 2) + ζ(4), so 4ζ(3, 1) = ζ(4); with ζ(2)² = (5/2)ζ(4), ζ(2, 2) = (3/4)ζ(4) (IKZ, §1, pp. 307–309; §2, pp. 310–311).

To prove this, partition products of absolutely convergent nested sums by the order and coincidences of the summation variables (stuffle), and products of integration simplices (shuffle); for the low-weight identities use Mathlib `riemannZeta_two` and `riemannZeta_four`. The identity ζ(2, 1) = ζ(3) belongs to PS.9.7.

The interface includes the following facts.

- `mzv_stuffle` (ζ(k)ζ(l) = `Σ_{w ∈ stuffles k l}` ζ(w) for admissible k, l).
- `mzv_shuffle` gives shuffle multiplicativity on the encoded admissible indices.
- The weight-four identities.

**Checks.**

- The coefficient 4 of ζ(3, 1) records the shuffle multiplicity; dropping multiplicities gives 2 and fails.
- ζ(3, 1) = ζ(4)/4 = π⁴/360.
- ζ(2, 2) = (3/4)ζ(4) = π⁴/120.

*Needs:* Layers PS.9.1–PS.9.3; Mathlib `riemannZeta_two`, `riemannZeta_four`.

### PS.9.5 The shuffle and stuffle regularizations

The shuffle and stuffle algebras H¹ are polynomial algebras in y = 1 over their admissible subalgebras H⁰ (H¹_⧢ ≅ H⁰_⧢[y], H¹_* ≅ H⁰_*[y]), so Z extends uniquely to algebra maps Z_⧢, Z_* : H¹ → ℝ[T] with y ↦ T. The tangential integral regularization of PS.9.3 gives Z_⧢. T is a formal divergence parameter, not a value of ζ(1) (IKZ, Proposition 1, p. 309; §3, pp. 312–314).

To prove this, remove leading letters y triangularly in each product to get the polynomial decomposition; extend multiplicatively with y ↦ T; uniqueness follows from the decomposition; compare the shuffle extension with the logarithmic endpoint polynomial.

The interface includes the following facts.

- Z_⧢ and Z_*.
- Both restrict to the constant polynomial ζ(k) on admissible k.
- Both send y to T and the empty word to 1.
- Each regularization is uniquely determined by its admissible values and value T on the one-letter word.

**Checks.**

- Both maps send the empty word to 1.
- Z_*([1, 1]) = (T² − ζ(2))/2 and Z_⧢([1, 1]) = T²/2.
- Z_*([1, 2]) = ζ(2)T − ζ(2, 1) − ζ(3) and Z_⧢([1, 2]) = ζ(2)T − 2ζ(2, 1).

*Needs:* Layers PS.9.3–PS.9.4; Mathlib `Polynomial`.

### PS.9.6 The comparison operator ρ

Let A(u) = `exp(Σ_{n≥2}` (−1)^n ζ(n) uⁿ/n) = Σ_k a_k u^k in ℝ⟦u⟧. Define the ℝ-linear map ρ : ℝ[T] → ℝ[T] by ρ(T^m) = `Σ_{k=0}^{m}` (m!/(m − k)!) a_k `T^{m−k},` equivalently `ρ(e^{Tu})` = `A(u)e^{Tu}` coefficientwise. It is triangular with diagonal 1, hence bijective, and it is not a ring homomorphism (IKZ, §2, (2.1)–(2.2), pp. 309–310).

To prove this, build A with Mathlib's formal exponential (PowerSeries.exp and substitution of a series with zero constant term), define ρ on the monomial basis, and invert it with the coefficients of A(u)⁻¹.

The interface includes the following facts.

- A(u).
- The linear map.
- On T^m the comparison operator has the finite coefficient formula stated above.
- `ρ(e^{Tu})` = `A(u)e^{Tu}.`
- The triangular comparison operator is a linear bijection.

**Checks.**

- ρ(1) = 1 and ρ(T) = T (a₀ = 1, a₁ = 0).
- ρ(T²) = T² + ζ(2) (a₂ = ζ(2)/2).
- ρ(T³) = T³ + 3ζ(2)T − 2ζ(3) (a₃ = −ζ(3)/3); ρ(T)² = T² ≠ ρ(T²), so ρ is not multiplicative.

*Needs:* Layer PS.9.1; Mathlib PowerSeries.exp, PowerSeries.subst, `Polynomial`.

### PS.9.7 Regularized double shuffle

For every w ∈ H¹, Z_⧢(w) = ρ(Z_*(w)). Consequently the constant term of Z_⧢(w₁ ⧢ w₀ − w₁ * w₀) vanishes for w₁ ∈ H¹ and w₀ ∈ H⁰. On [1, 2] the comparison gives ζ(2, 1) = ζ(3); on [1, 1] it gives ρ((T² − ζ(2))/2) = T²/2. No completeness of the resulting relations is asserted (IKZ, Theorem 1 and its proof, pp. 310–312; Theorem 2 and Conjecture 1, pp. 314–315).

To prove this, compare the asymptotic polynomial of the truncated nested sums (in log M + γ) with that of the multiple polylogarithm near 1 by Abelian asymptotics, the Gamma-factor expansion being exactly A(u); extend to H¹ by the polynomial decomposition of PS.9.5.

The interface includes the following facts.

- Z_⧢ = ρ ∘ Z_*.
- The constant-term relation.
- Euler’s relation ζ(2, 1) = ζ(3).

**Checks.**

- Both divergent-index computations agree without assigning a value to ζ(1).
- ζ(2, 1) = ζ(3) (Euler).
- For w₁ = 1 and w₀ = 01: 1 ⧢ 01 = 101 + 2·011 and 1 * 01 = 101 + 011 + 001, so the difference is the admissible 011 − 001 and the relation reads ζ(2, 1) − ζ(3) = 0.

*Needs:* Layers PS.9.5–PS.9.6.

### PS.9.8 Mixed Tate motives over ℤ

Inside the Tate-generated triangulated subcategory DMT(ℚ) of MotivesAndAlgebraicCycles Layer 4, take the heart MT(ℚ) of the motivic t-structure, which exists for number fields by the Beilinson–Soulé vanishing: through PS.3.0 it follows from the vanishing of K_(2i)(F) ⊗ ℚ for i ≥ 1 (ArithmeticKTheory §3.4) and the pure Adams weight n of K_(2n−1)(F) ⊗ ℚ (BorelRegulators §6.3). MT(ℤ) is its full tensor subcategory of objects unramified at every prime: the extensions between adjacent weight-graded pieces have Kummer classes in ℤ^× ⊗ ℚ = 0. Objects have a finite weight filtration with `gr^W_{−2n}` a sum of copies of ℚ(n). The fibre functor ω(M) = ⊕_n Hom(ℚ(n), `gr^W_{−2n}M)` is exact, faithful, ℚ-linear and tensor, so MT(ℤ) is neutral Tannakian (DG, §§1.1–1.9, printed pp. 3–17; §§2.1–2.3, printed pp. 18–20).

To prove this, import geometric motives with the Tate object inverted (Layer 4), restrict to the thick Tate-generated subcategory, use the motivic cohomology/K-theory comparison of PS.3.0 and the Beilinson–Soulé vanishing for the t-structure, apply the adjacent-weight unramifiedness criterion, and define the graded fibre functor (MotivesAndAlgebraicCycles Layer 3 for Tannakian categories).

The interface includes the following facts.

- MT(ℤ) is the unramified mixed Tate heart with the stated weight filtration.
- ℚ(n) ∈ MT(ℤ) for every n, ℚ(n) ⊗ ℚ(m) = ℚ(n + m).
- The grade-n fibre Hom(ℚ(n), `gr^W_{−2n}M).`
- Membership is the vanishing of the adjacent Kummer classes at every prime.

**Checks.**

- The fibre of ℚ(0) is ℚ in grade 0.
- The fibre of ℚ(1) is ℚ in grade 1; its Hodge weight is −2.
- The Kummer extension attached to 2 lies in MT(ℚ) but not in MT(ℤ): it is ramified at 2.

*Needs:* MotivesAndAlgebraicCycles Layer 3 (Tannakian categories), Layer 4 (Tate-stabilized geometric motives); Layer PS.3.0; ArithmeticKTheory §3.4 (rational K-groups of number fields); BorelRegulators §6.3 (Adams weight).

### PS.9.9 Extensions and the motivic Galois group

`Ext¹_{MT(ℤ)}(ℚ(0),` ℚ(n)) is ℚ for odd n ≥ 3 and zero otherwise, and Ext² between Tate objects vanishes. For ω as above, G_MT = Aut^⊗(ω) is 𝔾_m ⋉ U_MT with Lie U_MT free pronilpotent on one generator in each degree −3, −5, −7, …; the generators are not canonical. The regulator (Hodge realization) is injective on Ext¹, which gives the full faithfulness used to lift path structures (DG, Proposition 1.9, printed pp. 16–17; Propositions 2.2–2.3, pp. 18–20; Proposition 2.14, p. 25; B, §2.5, pp. 6–7).

To prove this, use the rational K-groups of ℤ (ArithmeticKTheory §3.4: `K_{4m+1}(ℤ)` ⊗ ℚ = ℚ for m ≥ 1 and the others zero in positive degree), their Adams weights (BorelRegulators §6.3) and PS.3.0 to compute Ext¹, and the injectivity of the Borel regulator (BorelRegulators §2.3) for the Hodge realization; Ext² = 0 makes the graded Lie algebra free; apply neutral Tannaka reconstruction (MotivesAndAlgebraicCycles Layer 6). Full faithfulness uses the regulator injection on Ext¹, not injectivity of any numerical period map.

The interface includes the following facts.

- Ext¹(ℚ(0), ℚ(n)) for each n.
- Ext² = 0.
- G_MT = 𝔾_m ⋉ U_MT with free graded Lie algebra.

**Checks.**

- There is no generator in degree −1 over ℤ, while over ℚ the Kummer extensions give Ext¹(ℚ(0), ℚ(1)) = ℚ^× ⊗ ℚ ≠ 0.
- Ext¹(ℚ(0), ℚ(2)) = 0 (even degree), consistent with ζ(2) being a power of 2πi up to a rational.
- The first generators are in degrees −3, −5, −7, matching ζ(3), ζ(5), ζ(7).

*Needs:* Layer PS.9.8; MotivesAndAlgebraicCycles Layer 6 (neutral Tannaka reconstruction); Layer PS.3.0; ArithmeticKTheory §3.4; BorelRegulators §§2.3, 6.3.

### PS.9.10 The motivic torsor of paths on the three-punctured line

For X = ℙ¹_ℚ ∖ {0, 1, ∞}, construct the unipotent motivic fundamental groupoid and the torsor ₀Π₁ of paths from the tangent vector +1 at 0 to the tangent vector −1 at 1, as a represented pro-unipotent affine torsor in the mixed Tate setting. Its coordinate algebra O(₀Π₁) is a commutative ind-algebra in MT(ℤ), the increasing union of the finite bar-coordinate objects C_≤n. In the de Rham word realization, C_≤n is spanned by words of length at most n; all-cut deconcatenation makes it a subcoalgebra, while shuffle multiplication sends C_≤m⊗C_≤n into C_≤(m+n), rather than into a fixed finite piece. The duals C_≤n^∨ form the pro-object whose de Rham limit is the completed concatenation path algebra, with finite quotients by augmentation powers; the Betti realization is the corresponding unipotent completion of paths, and the comparison evaluates iterated integrals along the straight path dch (B, §2.1, p. 3, (2.1)–(2.3); DG, Proposition 3.10 and §§3.11–3.13, printed pp. 40–45; Theorem 4.4, pp. 47–50; §§4.13–4.18 and §5.3, pp. 53–57).

The generic unipotent de Rham and étale groupoid is AnabelianGeometryAndNonabelianChabauty NC.2 (Layer 2); the finite Betti and de Rham truncations, the bar comparison, tangential base points and their composition laws for this curve are part of this target.

To prove this, use the normalized cosimplicial motive and its finite truncations (DG Proposition 3.10 compares homotopy and simplicial constructions); identify the logarithmic de Rham complex with the tensor-word model and the Betti comparison with iterated integration; extend to the tangential base points and prove unramifiedness over ℤ and the groupoid laws.

The interface includes the following facts.

- The affine path torsor has the indicated tangential endpoints; O(₀Π₁) is an ind-algebra with finite coordinate pieces C_≤n in MT(ℤ).
- The inverse system C_≤n^∨ is the completed pro-dual; its de Rham multiplication is concatenation modulo augmentation powers. A finite coordinate piece is a subcoalgebra, not a shuffle subalgebra.
- The de Rham coordinate algebra is the shuffle algebra with the length filtration.
- Pullback under path composition Π_(a,b)×Π_(b,c)→Π_(a,c) is all-cut deconcatenation on coordinate words, with the indicated endpoint algebras and empty outer factors.
- The straight path evaluates word coordinates by the regularized iterated integrals of PS.9.3, with the reversal convention.

**Checks.**

- The empty word evaluates to 1 on the straight path.
- C_≤0 has dimension 1 and C_≤1 has dimension 3, with basis ∅,0,1. In C_≤1, the shuffle 0⧢0=2·00 leaves the piece; declaring it a subalgebra loses this product. Its dual augmentation quotient has 0·0=0, while C_≤2^∨ retains 00.
- The deconcatenation of 01 is ∅ ⊗ 01 + 0 ⊗ 1 + 01 ⊗ ∅, with ∅ the empty word (the unit); omitting the two outer cuts breaks the counit law.
- 0 and 1 are not points of X; the ordinary point-based torsor cannot replace the tangential one.

*Needs:* Layers PS.9.8, PS.9.9, PS.9.2 and PS.9.3; AnabelianGeometryAndNonabelianChabauty NC.2; MotivesAndAlgebraicCycles Layer 6 (tensor isomorphism torsors).

### PS.9.11 Brown's motivic multiple zeta values

Let S be the de Rham realization of the coordinate ind-algebra O(₀Π₁), the direct union of its finite coordinate pieces, and dch : S → ℝ the evaluation on the straight path. Let J_MT be the largest graded ideal of S that is stable under the coaction of U_MT and contained in ker(dch), and put H = S/J_MT; this is not the quotient by the whole numerical kernel. For a descending admissible k put ζ^m_desc(k) = I^m(0; reverse(encode k); 1). The induced period map per : H → ℝ is a ℚ-algebra homomorphism with per(ζ^m_desc(k)) = ζ_desc(k). ζ^m(2) is kept in H and is nonzero (B, §§2.1–2.4, pp. 3–6; Theorem 2.4 and properties I0–I3).

To prove this, form the sum of all graded stable ideals contained in the kernel and check it is again stable and contained in the kernel; descend the evaluation and the motivic iterated-integral relations to H. Neither stability of the kernel itself nor injectivity of per is assumed.

The interface includes the following facts.

- H.
- The descending motivic zeta values are the stated matrix coefficients.
- The period map carries each motivic zeta value to its numerical value.
- Shuffle, reflection and tangential vanishing: the empty word gives 1, nonempty words with equal endpoints give 0.
- J_MT is the largest such ideal.

**Checks.**

- ζ^m([]) = 1 and per(1) = 1.
- ζ^m(2) ≠ 0, since its period π²/6 is nonzero.
- ζ^m_desc(2, 1) = I^m(0; 1, 1, 0; 1) with period ζ_desc(2, 1) = ζ(3); the word 0, 1, 1 is the other convention.

*Needs:* Layers PS.9.10 and PS.9.2; Mathlib `Ideal.Quotient.mk`.

### PS.9.12 The motivic coaction

Let U′ be the quotient of U_MT acting faithfully on the path torsor, A = O(U′), and π : H → A the quotient map, which kills ζ^m(2). Define Δ : H → A ⊗ H on iterated integrals by

```text
Δ I^m(a₀; a₁, …, a_n; a_{n+1}) = Σ π( ∏_{p=0}^{k} I^m(a_{i_p}; a_{i_p+1}, …, a_{i_{p+1}−1}; a_{i_{p+1}}) ) ⊗ I^m(a₀; a_{i₁}, …, a_{i_k}; a_{n+1}),
```

the sum over 0 = i₀ < i₁ < ⋯ < i_k < `i_{k+1}` = n + 1 with 0 ≤ k ≤ n, empty segments contributing 1, and A in the first factor. This makes H a graded A-comodule algebra (B, Theorem 2.4, pp. 4–6; §3.1, p. 7).

To prove this, express the motivic path action on coordinate iterated integrals (the subsequence sum describes insertions of paths into the retained letters), descend through the stable ideal, project the cut segments to A, and verify coassociativity, the counit and multiplicativity on word coordinates.

The interface includes the following facts.

- Δ.
- The displayed formula.
- A unital algebra map satisfying the comodule laws.
- π(ζ^m(2)) = 0 and Δζ^m(2) = 1 ⊗ ζ^m(2).

**Checks.**

- Δ1 = 1 ⊗ 1.
- Δζ^m(2) = 1 ⊗ ζ^m(2).
- Δζ^m(3) = 1 ⊗ ζ^m(3) + ζ^a(3) ⊗ 1, with ζ^a = π∘ζ^m.

*Needs:* Layers PS.9.11 and PS.9.9; MotivesAndAlgebraicCycles Layer 6.

### PS.9.13 The f-alphabet and the dimension bound

After a choice of graded free generators, O(U_MT) is the shuffle algebra on letters f₃, f₅, …; adjoining a central polynomial generator f₂ gives H_MT^+ = O(U_MT) ⊗ ℚ[f₂], with deg f_i = i and the deconcatenation coaction on odd words. H embeds in H_MT^+ as a graded comodule, with ζ^m(2) mapping to a nonzero multiple of f₂. The Hilbert series of H_MT^+ is 1/(1 − t² − t³), so dim H_N ≤ d_N with d₀ = 1, d₁ = 0, d₂ = 1 and d_N = `d_{N−2}` + `d_{N−3}` for N ≥ 3 (B, §2.5 and Lemma 2.5, pp. 6–7; §3.1, p. 7).

To prove this, apply the supplied finite-alphabet wordShuffleDuality of AnabelianGeometryAndNonabelianChabauty §2.0 to the odd generators of bounded weight and the ColemanIntegration L1.12 word algebra, then take their degreewise union; only finitely many generators and words occur in each weight because every odd generator has weight at least 3. Split off the even Tate parameter by a rational point and compute the graded generating function; this gives an upper bound, which becomes equality after PS.9.22.

The interface includes the following facts.

- H_MT^+.
- H → H_MT^+.
- `hoffmanDim N` is d_N, the coefficient of 1/(1−t²−t³).
- Dim H_N ≤ d_N.

**Checks.**

- d₃ = 1, d₄ = 1, d₅ = 2, d₆ = 2, d₇ = 3, d₈ = 4.
- No letter f₁ occurs, so d₁ = 0.
- The generating function satisfies (1 − t² − t³)·Σ d_N t^N = 1.

*Needs:* Layers PS.9.9, PS.9.11 and PS.9.12; Layer PS.9.2; ColemanIntegration L1.12; AnabelianGeometryAndNonabelianChabauty §2.0 ‘Word algebra and shuffle coordinates’.

### PS.9.14 The coaction derivations and their kernel

For odd r ≥ 3 let D_r = (projection of A_r to the indecomposables L_r) ⊗ id applied to Δ − 1 ⊗ id, a derivation H_N → L_r ⊗ `H_{N−r}.` On words it removes each contiguous segment of length r, projects it to L_r, and keeps the complementary motivic word. For N ≥ 2 the joint kernel in H_N of the D_r with odd 3 ≤ r < N is ℚζ^m(N); for even N, ζ^m(N) is a nonzero rational multiple of `ζ^m(2)^{N/2}` (B, §3.2 and Theorem 3.3, pp. 7–9).

To prove this, project the cut coaction to indecomposables (products of two or more nonempty cut pieces vanish), and read the primitive kernel in the f-alphabet with the central f₂, keeping the weight and the strict inequality r < N.

The interface includes the following facts.

- D_r.
- The contiguous-cut formula.
- The joint kernel is ℚζ^m(N).

**Checks.**

- At N = 3 no r satisfies 3 ≤ r < 3, and H₃ = ℚζ^m(3).
- The kernel statement says the kernel is the line through ζ^m(N), not zero: ζ^m(5) is killed by D₃.
- D₃ζ^m_desc(2, 3) = −2·ζ^L(3) ⊗ ζ^m(2) ≠ 0, with ζ^L(3) the image in L₃ (from PS.9.18: ζ^m(2) and ζ^m(5) are killed by D₃).

*Needs:* Layers PS.9.12 and PS.9.13.

### PS.9.15 Convergent motivic double shuffle and the shifted all-two integrals

In H the admissible motivic values satisfy the shuffle and the convergent stuffle relations. For n ≥ 1 the shuffle-regularized integral ζ₁^m(2^n) = I^m(0; 0(10)^n; 1) satisfies

```text
ζ₁^m(2^n) = −2 Σ_{i=0}^{n−1} ζ^m_desc(2^{n−1−i}, 3, 2^i) = 2 Σ_{i=1}^{n} (−1)^i ζ^m(2i + 1) ζ^m(2^{n−i}),
```

so its indecomposable coefficient is 2(−1)^n. Brown's ζ₁ denotes a leading-zero integral, not a divergent index. The shuffle relations come from the path integrals; the convergent stuffle relations in H are proved here by transporting Soudères's convergent framed-motive stuffle to Brown's path-period generators, preserving both the de Rham and the Betti frames and the tensor and product structures (Soudères (SO), Definition 3.7 and Proposition 3.8, §3.2, pp. 10–12; Proposition 4.24 and its proof, §4.4, pp. 23–26; B, (3.8), p. 9, and Lemma 3.8 with its proof, pp. 10–11).

For each pair of admissible indices construct Soudères's compactified configuration pairs and their relative-cohomology motives using MotivesAndAlgebraicCycles §§4.13, 4.19 and 5.7. Equip them with the actual logarithmic de Rham form and oriented Betti cell as Tate frames. The product, boundary and pullback maps must preserve these frames and identify their matrix coefficients with Brown's word generators; this framed comparison is part of this target, rather than an assertion about unmarked relative motives. Its API includes change of compactification, product and boundary compatibility and the induced equality in H (SO, Definition 3.7, Proposition 3.8 and Proposition 4.24).

To prove this, use Soudères's pullback, product and compactification maps to compare relative cohomology frames, and identify the framed objects with Brown's generators in H; Brown's (3.8) follows from shuffle regularization and gives the first sum; apply convergent stuffle to ζ^m(2j + `1)ζ^m(2^{n−j})` and cancel the intermediate insertions in the alternating sum to get Lemma 3.8, keeping the term i = n (ζ^m(2⁰) = 1). Pass to indecomposables only after the identity holds in H; equality after applying per would not suffice.

The interface includes the following facts.

- Convergent stuffle in H.
- Convergent motivic values obey shuffle multiplication.
- The leading-zero shuffle-regularized all-two value is the integral specified above.
- The two displayed expressions.
- Coefficient 2(−1)^n.

**Checks.**

- ζ^m(2)² = 2ζ^m(2, 2) + ζ^m(4) = 4ζ^m(3, 1) + 2ζ^m(2, 2).
- At n = 1, ζ₁^m(2) = −2ζ^m(3); at n = 2, ζ₁^m(2, 2) = −2ζ^m(3)ζ^m(2) + 2ζ^m(5).
- These are identities in H; they do not use injectivity of the period map.

- In the frame comparison the empty product has motive 1 with both frames 1 and period 1; replacing the de Rham frame by zero gives period 0 and cannot represent it.
- For two degree-one factors, interchanging the form factors alone gives sign −1, while interchanging the oriented cell factors too gives the product sign (−1)² = 1. An unmarked comparison cannot detect this distinction.
- For the product of two weight-two values the framed shuffle and stuffle give respectively 4·ζ^m(3,1)+2·ζ^m(2,2) and 2·ζ^m(2,2)+ζ^m(4). Their periods agree with π⁴/36; the equality in H requires the frame-preserving maps.

*Needs:* Layers PS.9.11 and PS.9.10; MotivesAndAlgebraicCycles §§4.13, 4.19 and 5.7.

### PS.9.16 Zagier's coefficients

For a, b ≥ 0 and 1 ≤ r ≤ a + b + 1 put c(a, b, r) = 2(−1)^r [binom(2r, 2b + 2) − (1 − `2^{−2r})` binom(2r, 2a + 1)] ∈ ℚ, with binomials above the top index equal to 0. This is Zagier's ascending coefficient with a and b exchanged. Strings of twos may be empty, ζ({2}⁰) = 1. The denominator of c(a, b, r) is a power of two, the arithmetic input of PS.9.21 (Zagier (Z), Theorem 1, p. 981; B, Theorem 4.3 and Corollary 4.4, pp. 12–13).

The interface includes the following facts.

- `zagierCoeff` (in Suggested.lean).
- c_desc(a, b, r) = c_asc(b, a, r).
- The denominator is a power of 2.

**Checks.**

- c(0, 0, 1) = 1.
- c(1, 0, 1) = −2 and c(1, 0, 2) = 9/2, the coefficients of ζ_desc(2, 3).
- c(0, 1, 1) = 3 and c(0, 1, 2) = −11/2, the coefficients of ζ_desc(3, 2); reversing the index changes both.

*Needs:* Layer PS.9.1; Mathlib Nat.choose.

### PS.9.17 Zagier's evaluation

For a, b ≥ 0 and n = a + b + 1,

```text
ζ_desc({2}^a, 3, {2}^b) = Σ_{r=1}^{n} c(a, b, r) ζ(2r + 1) ζ({2}^{n−r}),
```

and ζ({2}^m) = `π^{2m}/(2m` + 1)!, including m = 0. These are numerical identities; their motivic lift is PS.9.18 (Z, Theorem 1, p. 981; (5)–(6), p. 979; §§2–4, pp. 982–990, in particular Lemma 2, p. 989).

To prove this, compute the generating function F(x, y) of the one–three values from the sine-product formula for all-two values and the candidate F̂(x, y) from the binomial expression (Z Propositions 1–3, pp. 982–985, with the directional growth estimates (18) and (21)); compare F and F̂ at integer points and on the diagonal (Z Propositions 4–6, pp. 985–989). For fixed x, f(y) = F(x, y) − F̂(x, y) vanishes at every integer, has finite order and is O(exp(π|Im y|)); divide by sin(πy), apply Mathlib PhragmenLindelof.horizontal_strip (finite-order growth is dominated by exp(B·exp(c|Re y|)) with c < π divided by the strip width) and Liouville to see the quotient is constant; vanishing at y = x for nonintegral x makes it zero; extend to integral x by analyticity and extract coefficients.

The interface includes the following facts.

- `oneThree a b` is the descending index {2}^a,3,{2}^b.
- `zagier_evaluation`.
- `mzv_allTwo` states ζ({2}^m)=π^(2m)/(2m+1)! for every m≥0, including m=0 (B, equation (3.7), p. 9).

**Checks.**

- The indices oneThree 0 0, oneThree 1 0, oneThree 0 1 are [3], [2, 3], [3, 2], respectively. The empty strings of twos do not remove the central 3.
- ζ_desc(2, 3) = −2ζ(3)ζ(2) + (9/2)ζ(5).
- ζ_desc(3, 2) = 3ζ(3)ζ(2) − (11/2)ζ(5); the two sum to ζ(2)ζ(3) − ζ(5), agreeing with the stuffle relation ζ(2)ζ(3) = ζ(2, 3) + ζ(3, 2) + ζ(5) of PS.9.4.
- ζ({2}¹) = π²/6 and ζ({2}⁰) = 1.

*Needs:* Layers PS.9.16, PS.9.3 and PS.9.1; Mathlib PhragmenLindelof.horizontal_strip.

### PS.9.18 Brown's motivic lift of Zagier's evaluation

With the same coefficients, ζ^m_desc({2}^a, 3, {2}^b) = `Σ_{r=1}^{a+b+1}` c(a, b, r) ζ^m(2r + 1) `ζ^m({2}^{a+b+1−r})` in H. The proof uses coaction induction and the numerical evaluation, not injectivity of the period map (B, Theorem 4.3 and its proof, pp. 12–13).

To prove this, apply each D_r with r < 2a + 2b + 3 to the difference of the two sides, using the contiguous cuts, the shifted all-two identity (PS.9.15) and induction on weight; all these vanish, so by PS.9.14 the difference is αζ^m(2a + 2b + 3); apply per and PS.9.17 to get αζ(2a + 2b + 3) = 0, and positivity of this single value gives α = 0.

The interface includes the following facts.

- The displayed Zagier evaluation holds in Brown’s motivic algebra.

**Checks.**

- a = b = 0 gives ζ^m(3) = ζ^m(3).
- The weight-five motivic coefficients are those of PS.9.17.
- The step α·ζ(N) = 0 ⇒ α = 0 uses ζ(N) > 0 only, for one odd N.

*Needs:* Layers PS.9.17, PS.9.14, PS.9.15 and PS.9.16.

### PS.9.19 The Hoffman level filtration

Let `B_{N,l}` be the set of descending words in {2, 3} of weight N with exactly l threes, `H_N^{2,3}` ⊂ H_N the ℚ-span of their motivic values, and `F_lH_N^{2,3}` the span of those with at most l threes. Let `W_{N,l}` = `ℚ[B_{N,l}]` be the free space on these words, before any independence is proved. For N = 2m + 3l, `#B_{N,l}` = binom(m + l, l), and `B_{N,l}` is empty when m is not a nonnegative integer; the empty word is the element of `B_{0,0}.` For l ≥ 1 and odd 3 ≤ r ≤ N, D_r maps `F_lH_N^{2,3}` into L_r ⊗ `F_{l−1}H_{N−r}^{2,3},` by Brown's parity argument on the 0/1 encoding: every term of D_r with r odd removes a segment that lowers the number of threes (B, §5, pp. 13–14, Lemma 5.5; §6, pp. 14–17).

To prove this, enumerate the words of given weight and level, form the free space and its span map into H, filter by the number of threes, count by choosing the positions of the l threes among m + l entries, and apply the contiguous-cut formula with the parity argument.

The interface includes the following facts.

- `B_{N,l}.`
- Binom(m + l, l).
- F_l, a Submodule.span, increasing in l.
- Derivations lower the Hoffman level. `IsHoffman` defines {2,3}-words and their number at weight N is d_N.

**Checks.**

- `B_{0,0}` is the empty word and F₀H₀ = ℚ·1. `IsHoffman []` and `IsHoffman [2, 3]` hold, whereas [1] and [4] fail; weight alone does not make an index a Hoffman word.
- `B_{5,1}` = {[2, 3], [3, 2]}.
- `B_{6,0}` = {[2, 2, 2]}, `B_{6,2}` = {[3, 3]}, and `B_{6,1}` is empty (2m + 3 = 6 has no integral solution).
- The total number of {2, 3}-words of weight N is d_N: 1, 0, 1, 1, 1, 2, 2 for N = 0, …, 6.

*Needs:* Layers PS.9.11, PS.9.12 and PS.9.2; Mathlib Submodule.span, `LinearIndependent`.

### PS.9.20 The Hoffman cut matrix

For N ≥ 3 and l ≥ 1, the odd cuts 3 ≤ r ≤ N give coefficients from `W_{N,l}` to ⊕_r `W_{N−r,l−1}.` Brown's matrix `M_{N,l}` has source words as rows and target pairs (r, u) as columns (Definition 5.9), the transpose of the column-input matrix of the linear map. Removed one–three segments are evaluated with the motivic Zagier coefficients (PS.9.18) and the shifted all-two formula (PS.9.15). Order both sets by Brown's reverse lexicographic order with 3 < 2 on ascending words, transported to descending words by reversal. Reindex columns by the bijection (r = 2k + 3, u) ↦ 2^k3u, where u has weight N − r and level l − 1 (in ascending notation, append 3·2^k); this makes the matrix square without any independence assumption. The case r = N with the empty target word is included when l = 1. Invertibility is PS.9.21 (B, Lemma 5.5, pp. 13–14; Definitions 5.8–5.9, p. 15; Theorem 6.1 and Corollary 6.2, pp. 16–17).

To prove this, apply the contiguous-cut formula to each formal {2, 3}-word, keep the cuts with exactly one 3 in level l − 1, evaluate the removed segments, combine contributions with the same odd weight and target word; delete the descending prefix 2^k3 to obtain the target pair and prepend it for the inverse.

The interface includes the following facts.

- The entries indexed by source word w and target pair (r, u).
- (2k + 3, u) ↦ 2^k3u is a bijection from the disjoint union of targets onto `B_{N,l},` inverse deleting the prefix up to the first 3.
- After Brown's column rescaling, upper triangular modulo 2 with odd diagonal, for the stated row and column orders; the minimal coefficient in a column comes from the descending block 2^k3.

**Checks.**

- At N = 3, l = 1 the matrix is the 1 × 1 matrix (1), targeting r = 3 with the empty word.
- At N = 5, l = 1, source rows [3, 2], [2, 3] and target columns (3, [2]), (5, []) give [[3, −11/2], [−2, 9/2]] of determinant 5/2; doubling the second column gives [[3, −11], [−2, 9]], upper triangular modulo 2 with odd diagonal.
- The bijection prepends the descending prefix 2^k3; a suffix-deletion convention pairs different columns and breaks the triangular shape.

*Needs:* Layers PS.9.19, PS.9.14, PS.9.18 and PS.9.15; Mathlib `Matrix.det`.

### PS.9.21 Brown's prime-adic determinant argument

Every nonempty Hoffman cut matrix `M_{N,l}` is invertible over ℚ. The general criterion: for every prime p and every square rational matrix, assume each diagonal entry is nonzero with p-adic valuation at most 0, its valuation is at most that of every nonzero entry in its column, and each entry below the diagonal is either zero or has valuation at least 1. Then the determinant is nonzero. Equivalently one may use the extended valuation v_p(0) = +∞. Mathlib's total padicValRat p 0 = 0 requires the explicit zero alternatives and nonzero diagonal hypotheses above. Rescale each column by a power of p to make its minimum 0; reduced modulo p the matrix is upper triangular with nonzero diagonal. Specialize to p=2 for the Hoffman cut matrices. Brown's coefficient estimates and leading-cut computation verify the hypotheses (B, Corollary 4.4, pp. 12–13; Lemma 7.1 and Theorem 7.3, pp. 17–18).

To prove this, use the dyadic symmetry and minimal-column valuation of the Zagier coefficients (with the index reversal applied), rescale, reduce modulo 2, apply the triangular determinant formula, and undo the rescaling.

The interface includes the following facts.

- The valuation criterion for every prime p, including zero-size matrices.
- Its specialization at p=2 proves invertibility of the Hoffman cut matrices.

**Checks.**

- The criterion gives det ≠ 0, not that the determinant is an integer or a 2-adic unit: the weight-five determinant is 5/2.
- A matrix with an even entry on the diagonal whose column has an odd entry below it violates the hypothesis. The singular matrix [[0, 1], [0, 1]] also fails, because its first diagonal entry is zero; using the total valuation without a nonzero-diagonal condition could incorrectly accept it.
- [[1, 1], [2, 1]] satisfies the p=2 hypotheses (determinant −1); [[1, 1], [1, 1]] does not (below-diagonal entry odd) and has determinant 0.
- For p=3, [[1,1],[3,1]] has determinant −2, a 3-adic unit. At n=0 the determinant is 1 and every hypothesis is empty. A two-adic-only statement would miss the first example.

*Needs:* Layers PS.9.20 and PS.9.16; Mathlib padicValRat, `Matrix.det_of_isUpperTriangular`.

### PS.9.22 The motivic Hoffman basis

For every N ≥ 0, the elements ζ^m_desc(k) for k a {2, 3}-word of weight N form a ℚ-basis of H_N; the empty word is the basis in weight 0 and weight 1 has empty basis. Their number is d_N, matching the bound of PS.9.13, so H = H_MT^+ and every motivic multiple zeta value is a rational combination of Hoffman elements (B, Theorem 1.1, p. 1; Theorem 7.4, pp. 18–19).

To prove this, induct on weight and level: a relation in the highest level is sent by the D_r to lower-weight relations, and invertibility of `M_{N,l}` forces its top-level coefficients to vanish; descend through the levels; the level-zero all-two value is nonzero by its period; compare the number of independent words with dim H_N ≤ d_N.

The interface includes the following facts.

- A Basis of H_N indexed by {2, 3}-words of weight N.
- H = H_MT^+.
- U′ = U_MT: the quotient map U_MT → U′ of PS.9.12 is an isomorphism, hence so is G_MT → G_MT′, the quotient of G_MT acting faithfully on O(₀Π₁); equivalently MT(ℤ) is generated as a Tannakian category by the motivic torsor of paths of PS.9.10. To prove this, note that the image of π : H → A is all of A, while H = H_MT^+ makes the induced map H/ζ^m(2)H → O(U_MT) an isomorphism, so the inclusion A = O(U′) ⊆ O(U_MT) is an equality (B, Conjecture 1, p. 1; end of §7.2, p. 19).

**Checks.**

- H₂ = ℚζ^m(2), H₃ = ℚζ^m(3), and H₅ has basis ζ^m(2, 3), ζ^m(3, 2).
- H₁ = 0, matching d₁ = 0.
- The independence is in H, not in the numerical image.
- In weight 3, H₃ = ℚζ^m(3) and the weight-3 part of H_MT^+ is ℚf₃, so ζ^m(3) maps to c·f₃ with c ≠ 0 (its period ζ(3) is nonzero); hence ζ^a(3) = π(ζ^m(3)) is a nonzero element of A₃ and A₃ = O(U_MT)₃ = ℚf₃. The trivial quotient U′ = 1 has A₃ = 0 and would force Δζ^m(3) = 1 ⊗ ζ^m(3), contradicting PS.9.12's Check.

*Needs:* Layers PS.9.21, PS.9.19, PS.9.14, PS.9.13 and PS.9.12.

### PS.9.23 Numerical spanning and periods of mixed Tate motives over ℤ

Every convergent multiple zeta value of weight N is a rational combination of descending Hoffman values ζ(k), k a {2, 3}-word of weight N; hence dim_ℚ span{ζ(k) : weight k = N} ≤ d_N. Every period of MT(ℤ) lies in the ℚ[(2πi)⁻¹]-span of multiple zeta values, through the localized period algebra and evaluation of Layer PS.2 and the comparison torsor of MotivesAndAlgebraicCycles Layer 6. Numerical independence of the Hoffman values, exact numerical dimensions, completeness of double shuffle and injectivity of the period map are predicates, and no theorem depends on them (B, Corollary 1.2, p. 1; Corollary 7.5, p. 19).

To prove this, apply the ℚ-linear algebra map per to the basis expansion of PS.9.22 (a surjective image preserves spanning and gives only an upper bound); use H = H_MT^+ and invert the Tate period for arbitrary twists with PS.2.1, requiring the evaluation to factor through the Layer 6 identification with the comparison algebra of the full Nori fibres and to be evaluation at the same complex comparison point (PS.2.2); restrict to the mixed Tate objects. Brown's nonnegatively graded H and its coaction are not replaced by the localized Nori period algebra.

The interface includes the following facts.

- `numerical_spanning` (in Suggested.lean).
- `mzv_span_finrank_le` (finite dimensionality together with the dimension bound by d_N).
- Periods of MT(ℤ) in the ℚ[(2πi)⁻¹]-span of MZVs.

**Checks.**

- Weight five is spanned numerically by ζ(2, 3) and ζ(3, 2); nothing asserts that they are numerically independent.
- The inverse Tate period evaluates to (2πi)⁻¹ through the localization of PS.2.1, not through an effective algebra lacking the inverse.
- ζ^m(2) is not inverted in H; only the period algebra of PS.2 contains (2πi)⁻¹.

*Needs:* Layers PS.9.22, PS.9.11, PS.2.1 and PS.2.2; MotivesAndAlgebraicCycles Layer 6 (tensor isomorphism torsor, formal periods equal the comparison algebra, the comparison point).

### Examples

- `multipleZeta [] = 1` and `multipleZeta [2] = π²/6`; [1] is not admissible.
- ζ(2)² = 4ζ(3, 1) + 2ζ(2, 2) = 2ζ(2, 2) + ζ(4).
- The weight-five Zagier coefficient matrix [[c(0,1,1), c(0,1,2)], [c(1,0,1), c(1,0,2)]] = [[3, −11/2], [−2, 9/2]] has determinant 5/2.
- hoffmanDim takes the values 1, 0, 1, 1, 1, 2, 2, 3, 4 for N = 0, …, 8.

### Dependencies

Layer PS.2; MotivesAndAlgebraicCycles Layers 3, 4 and 6; Layer PS.3.0; ArithmeticKTheory §3.4; BorelRegulators §§2.3, 6.3; ColemanIntegration L1.12; AnabelianGeometryAndNonabelianChabauty NC.2, especially §2.0 ‘Word algebra and shuffle coordinates’ and §2.4; PolylogarithmFunctions; Tau Ceti `TauCeti.TensorWords`; Mathlib riemannZeta, `intervalIntegral`, PowerSeries, PhragmenLindelof.horizontal_strip, padicValRat, `Matrix.det`, Submodule.span.
## Corrections to the sources

The targets above already incorporate the following corrections; each is stated for the version cited in References.

- **BCGP, §2.8, display after (2.8.5), p. 37.** The alternating local product of the cohomological zeta function is printed with sign exponent (−1)^s in the complex variable. The exponent is (−1)^i, the cohomological degree: for an elliptic curve the H¹ factor must occur inversely and H⁰, H² directly at every s of the convergence region (PS.1.8).
- **Deligne, Proposition–Definition 2.3(ii), English translation p. 10.** The second infinity factor is evaluated as L∞(M^∨(1), s) at s = n; it should be L∞(M^∨(1), −s), equivalently L∞(M^∨, 1 − s), in agreement with Definition 1.3. For ℚ(0) the printed version evaluates Γ_ℝ(0) at n = −1 and wrongly excludes the critical integer −1 (PS.1.3). The correction refers to the translation.
- **BF, Remark 7, p. 534.** The local factor is printed as P_v(M, `(Nv)^{−s})` without the reciprocal; with §3.2 and the Euler product it is P_v(M, `(Nv)^{−s})⁻¹` (for the unit motive (1 − `(Nv)^{−s})⁻¹)` (PS.1.1).
- **BV, Corollary 5.7 (author's final version, internal p. 27).** The induction argument is extended to ℚ_p-valued characters; it holds for ℚ-valued characters, as in the published version, p. 196. For C₃ and p = 7 a nontrivial character is ℚ₇-valued, but no positive multiple of it is an integral combination of permutation characters (PS.5.4).
- **BV, Definition 2.5, Definition 3.7, Conjecture 4.1 and Remark 5.6 (published pp. 170–171, 177, 188, 194–195).** The global zeta element ζ : 1 → d(RΓ_c,ord)⁻¹ is paired with the unshifted complex RΓ_c,ord, whereas a leading-term pair [C, a] needs a : 1 → d(C). The shift C′ = RΓ_c,ord[1], with its determinant identification and Bockstein map, order −m, boundary +[RΓ_c,ord] and normalization `c_γ^{−m},` is needed before the interpolation identity applies; this is the NE.7 contract of PS.5.3. It is a gap in the argument, not a counterexample to the identity.
- **BV, proof of Corollary 5.7 (published p. 196).** Permutation characters are characterized as integral combinations of permutation characters with multiplier 1; integral combinations may have negative coefficients (the sign character of C₂ is the regular minus the trivial character, with value −1). Only the implication for permutation characters is used (PS.5.4).
- **BV, §5.2, map after (23) (published p. 193).** The map μ_p induced by the p-adic logarithmic regulator is used as an isomorphism before the nonvanishing of the regulator (Leopoldt in the permutation cases) is assumed; the nonvanishing is a hypothesis wherever μ_p is inverted (PS.5.4).
- **Hartmann, Proposition 4.26 and Example 4.27 (arXiv v1, p. 21).** The period form is rescaled by t⁻¹ and the pulled-back operator is written with multiplication by t. The form should be rescaled by t, and the operator is (1 − t⁴)/64 · D_t ∘ (multiplication by 1/t); applied to 1, the printed version gives −t²/8 instead of −3/(32t⁴) (PS.8.3).
- **Hartmann, Theorem 4.28 (p. 22).** U₁ is printed with the upper hypergeometric parameters (1/8, 3/8) in the variable 1 − t⁴; the inversion to that variable gives the equal pair (1/8, 1/8), as in Nagura–Sugiyama (26); U₂ keeps (5/8, 5/8). The linear coefficient of the regular local solution is 1/32, not 3/32 (PS.8.8).
- **Hartmann, Theorem 4.12 (p. 15).** Uniqueness of primitive embeddings is stated for an even nondegenerate ambient lattice without unimodularity. It is false in that generality: in L = U ⊕ U ⊕ ⟨−6⟩ (signature (2, 3)), the vectors e₁ + f₁ and 2e₁ + 2f₁ + g both have norm 2 but divisibility 1 and 2, so the two embeddings of ⟨2⟩ are inequivalent although the printed inequalities hold. The K3 application has an even unimodular ambient lattice and uses IntegralLattices Layer 5 milestones 5G–5H and Layer 6 milestone 6A (PS.8.4).
- **Hartmann, proof of Theorem 4.29 (p. 23).** The reflection known near t = 1 for γ₄ is transferred to γ₁ by identifying the images of the two based loops. The monodromies differ, β₄ = Tβ₁T⁻¹ with T(p) = p + 1, with fixed points 1 ± i/√2 versus ±i/√2. The pullback of the local ratio by t = i·s to the chart at t = i gives the γ₁ reflection directly; the normalized series is unaffected (PS.8.8–PS.8.9).
- **Brown, proof of Lemma 3.8 (v1), p. 11.** In the intermediate alternating-sum display, the coefficient before the sum is −1, rather than −2: at n = 1 the identity is ζ^m(3) = ζ^m(3). Combining it with (3.8) gives the stated factor 2 in Lemma 3.8 and PS.9.15. The lemma itself is used with that factor 2.
- **Shapiro, §§3.1–3.2 (v2), pp.3–4.** For the natural permutation pullback, the top differential and the residue generator transform by the sign character. The rank-four sector in PS.8.12 is G-invariant and S₅-stable; interpreting it as invariant under the combined group requires the determinant-character twist. In particular no S₅ average is used at p=3.
- **Shapiro, §6 (v2).** The convergence of the two weighted Dwork sums is asserted with the estimate referred elsewhere; PS.8.15 proves it by the Artin–Hasse factorization. There is no Theorem 6.1 in this version.

## Worked examples

- **The Tate motive.** ℚ(n) has I-period (2πi)^n, F∞ = (−1)^n and type (−n, −n); for ℚ(0) the critical integers are the positive even and the negative odd integers, ζ(2)/(2πi)² = −1/24, ζ(−1) = −1/12, and the Deligne ratio at every critical integer is rational. In the period algebra, L ↦ 2πi and L⁻¹ ↦ (2πi)⁻¹.
- **The Legendre curve y² = x(1 − x)(1 − x/2).** The integration matrix [[2K, 2J], [2iK, 2iH]] and its inverse in the dual Betti cohomology basis are exact; approximating `2K_{1/2}` by twice the midpoint sum doubles the PS.7.1 analytic error to at most `4/(N(1/2)^{3/2})` = 8√2/N, with the positive-branch integral and no rounding construction.
- **11a1.** Rank 0, torsion 5, c₁₁ = 5, Sha trivial: L(E, 1) = Ω_E/5; its fundamental-line consequence uses the explicit scalar identity and the comparisons of PS.6.3.
- **The quartic mirror map.** q = z + 104z² + 15188z³ + 2585184z⁴ + ⋯ and Z = q − 104q² + 6444q³ − 311744q⁴ + ⋯, integral, with P(1/j, Z) = 0.
- **Weight five.** ζ(2, 3) = −2ζ(3)ζ(2) + (9/2)ζ(5), ζ(3, 2) = 3ζ(3)ζ(2) − (11/2)ζ(5); the cut matrix [[3, −11/2], [−2, 9/2]] has determinant 5/2; ζ^m(2, 3), ζ^m(3, 2) form a basis of H₅, and d₅ = 2.

## Downstream consumers

The outputs are interfaces for motivic completions and Hasse–Weil functional-equation statements (PS.1), p-adic interpolation with explicitly matched periods (PS.0–PS.1), leading-term and equivariant determinant comparisons (PS.3–PS.6), and mixed Tate period calculations and numerical multiple-zeta spanning (PS.9). These applications consume the supplied local factors, realizations, marked evaluation and path-groupoid constructions in the direction fixed by Exact supplier contracts.

## References

- **BCGP** — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, arXiv:1812.09269v3 (2021). [arXiv](https://arxiv.org/pdf/1812.09269v3)
- **B** — Francis Brown, *Mixed Tate motives over ℤ*, arXiv:1102.1312v1 (2011); locators refer to this version, not the Annals pagination. [arXiv](https://arxiv.org/pdf/1102.1312v1)
- **BF** — David Burns and Matthias Flach, *Tamagawa numbers for motives with (non-commutative) coefficients*, Documenta Mathematica 6 (2001), 501–570. [EMS Press](https://ems.press/content/serial-article-files/25892?nt=1)
- **BG** — David Burns and Cornelius Greither, *On the equivariant Tamagawa number conjecture for Tate motives*, Inventiones Math. 153 (2003), 303–359; cited for the abelian Tate case as recorded in BF Remark 10.
- **BK** — Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*, The Grothendieck Festschrift I (1990), 333–400. [PDF](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf)
- **BV-final** — David Burns and Otmar Venjakob, *On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory*, Documenta Mathematica, Extra Volume Coates (2006), 165–209; page locators are to the published version. [EMIS](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/burns_venjakob.pdf), [author's final version](https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/bock-final.pdf)
- **Deligne** — Pierre Deligne, *Valeurs de fonctions L et périodes d'intégrales*, Proc. Sympos. Pure Math. 33, Part 2 (1979), 313–346; locators refer to the English translation by E. Ghate and J. Beineke (revised 2018). [translation](https://mathweb.tifr.res.in/~eghate/Deligne.pdf)
- **DG** — Pierre Deligne and Alexander Goncharov, *Groupes fondamentaux motiviques de Tate mixte*, Ann. Sci. ÉNS 38 (2005); locators refer to the printed pages of the IAS preprint. [preprint](https://www.math.ias.edu/files/deligne/Tate.pdf)
- **H** — Heinrich Hartmann, *Period- and mirror-maps for the quartic K3*, arXiv:1101.4601v1; published in Manuscripta Mathematica 141 (2013), 391–422. Locators and corrections refer to the arXiv version. [arXiv](https://arxiv.org/pdf/1101.4601v1)
- **HMS** — Annette Huber and Stefan Müller-Stach, *On the relation between Nori motives and Kontsevich periods*, arXiv:1105.0865v5 (2014). [arXiv](https://arxiv.org/pdf/1105.0865v5)
- **HMS-book** — Annette Huber and Stefan Müller-Stach, with contributions by Benjamin Friedrich and Jonas von Wangenheim, *Periods and Nori Motives*, freely available author draft dated 13 May 2016. Locators refer to the draft's printed pages, not the later book. [author draft](https://home.mathematik.uni-freiburg.de/arithgeom/preprints/buch-alt/buch-v2.pdf)
- **Huybrechts** — Daniel Huybrechts, *Lectures on K3 Surfaces*, free author draft. Locators refer to Chapter 1 and the draft's printed pages. [author draft](https://www.math.uni-bonn.de/people/huybrech/K3Global.pdf)
- **IKZ** — Kentaro Ihara, Masanobu Kaneko and Don Zagier, *Derivation and double shuffle relations for multiple zeta values*, Compositio Math. 142 (2006), 307–338. [PDF](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1112/S0010437X0500182X/fulltext.pdf)
- **IL** — Tau Ceti contributors, *Integral lattices, discriminant forms and primitive embeddings*, TauCetiRoadmap IntegralLattices. [README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/Completed/IntegralLattices/README.md)
- **K** — Kiran S. Kedlaya, *Frobenius structures on hypergeometric equations*, arXiv:1912.13073v3 (2021). Locators refer to this version. [arXiv](https://arxiv.org/pdf/1912.13073v3)
- **KZ** — Maxim Kontsevich and Don Zagier, *Periods*, in Mathematics Unlimited — 2001 and Beyond, Springer (2001), 771–808, DOI 10.1007/978-3-642-56478-9_39; locators are sections of the IHÉS preprint IHES/M/01/22. [author copy](https://www.ihes.fr/~maxim/TEXTS/Periods.pdf)
- **LTXZZ** — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Invent. Math. 228 (2022), 107–375. [NSF PAR copy](https://par.nsf.gov/servlets/purl/10323568)
- **LYA** — Bong H. Lian and Shing-Tung Yau, *Arithmetic properties of mirror map and quantum coupling*, arXiv:hep-th/9411234v3 (1994). [arXiv](https://arxiv.org/pdf/hep-th/9411234v3)
- **LYH** — Bong H. Lian and Shing-Tung Yau, *Mirror maps, modular relations and hypergeometric series I*, arXiv:hep-th/9507151 (1995). [arXiv](https://arxiv.org/pdf/hep-th/9507151)
- **NS** — Masaru Nagura and Katsuyuki Sugiyama, *Mirror symmetry of K3 and torus*, arXiv:hep-th/9312159 (1993); locators refer to printed pages. [arXiv](https://arxiv.org/pdf/hep-th/9312159)
- **Park** — Junyeong Park, *On a comparison between Dwork and rigid cohomologies of projective complements*, Nagoya Math. J. 254 (2024), 420–461, DOI 10.1017/nmj.2023.32. Locators refer to the published pagination. [open-access PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E76A045EC6FA83669757B9F24B2F4FA2/S0027763023000326a.pdf/on_a_comparison_between_dwork_and_rigid_cohomologies_of_projective_complements.pdf)
- **Serre** — Jean-Pierre Serre, *Facteurs locaux des fonctions zêta des variétés algébriques (définitions et conjectures)*, Séminaire Delange–Pisot–Poitou 11 (1969–70), exp. 19. [Numdam](https://numdam.org/article/SDPP_1969-1970__11_2_A4_0.pdf)
- **Qian** — Lie Qian, *Ordinarity of local Galois representation arising from Dwork motives*, arXiv:2103.00106v1 (2021). [arXiv](https://arxiv.org/pdf/2103.00106v1)
- **SG** — Albert Schwarz and Ilya Shapiro, *p-adic superspaces and Frobenius*, arXiv:math/0605310v5 (2012). Locators refer to this version's printed pages. [arXiv](https://arxiv.org/pdf/math/0605310v5)
- **SH** — Ilya Shapiro, *Frobenius map for quintic threefolds*, arXiv:0809.3742v2 (2008). [arXiv](https://arxiv.org/pdf/0809.3742v2)
- **SO** — Ismaël Soudères, *Motivic double shuffle*, arXiv:0808.0248v3 (2008). [arXiv](https://arxiv.org/pdf/0808.0248v3)
- **SS** — Albert Schwarz and Ilya Shapiro, *Twisted de Rham cohomology, homological definition of the integral and "Physics over a ring"*, arXiv:0809.0086 (2008). [arXiv](https://arxiv.org/pdf/0809.0086)
- **Tate-legal** — John Tate, *Number theoretic background*, Proc. Sympos. Pure Math. 33, Part 2 (1979), 3–26; (3.4.3)–(3.4.7), p.15, cited for the conventions on local constants.
- **Z** — Don Zagier, *Evaluation of the multiple zeta values ζ(2, …, 2, 3, 2, …, 2)*, Annals of Math. 175 (2012), 977–1000. [PDF](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf)

- **Burgos** — José Ignacio Burgos Gil, *The regulators of Beilinson and Borel*, CRM Monograph Series 15 (2002); cited for Theorem 10.9, printed pp. 95–97. [author copy](https://www.icmat.es/miembros/burgos/files/brbr.pdf)
- **Stacks** — The Stacks Project Authors, *The Stacks Project*, Tag 00OC, regular local rings and finite global dimension. [Tag 00OC](https://stacks.math.columbia.edu/tag/00OC)

- **Burgos** — José Ignacio Burgos Gil, *The regulators of Beilinson and Borel*, CRM Monograph Series 15 (2002), Theorem 10.9, pp.95–97. [author copy](https://www.icmat.es/miembros/burgos/files/brbr.pdf)
- **Z** — Don Zagier, *Evaluation of the multiple zeta values ζ(2,…,2,3,2,…,2)*, Annals of Mathematics 175 (2012), 977–1000. [author copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.4007/annals.2012.175.2.11/fulltext.pdf)
- **Stacks** — The Stacks Project, Tag 00OC, regular local rings. [Tag 00OC](https://stacks.math.columbia.edu/tag/00OC)
- **Scholl** — A. J. Scholl, *Motives for modular forms*, Inventiones Mathematicae 100 (1990), 419–430; locators use the author's copy. [author copy](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf)
