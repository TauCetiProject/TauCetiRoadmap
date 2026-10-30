# Roadmap: modularity of abelian surfaces

**Summary.** Develop the arithmetic of the 2–3 switch for abelian surfaces: the finite symplectic image conditions, ordinary local geometry at both small primes, residual A₅ automorphy and approximation in marked genus-two moduli. Combine these with ordinary nonregular modularity lifting to prove modularity for the fifteen permitted mod-3 images, Theorems A and B of BCGP25, and the bad-reduction-at-2 theorem. The conclusions include equality of all finite Euler factors with a cuspidal GL₄ transfer, entire continuation and the weight-one functional equation. The complements give a coefficient-box lower density of 5551/46656, modularity outside the two exceptional endomorphism types, and ordinary residual modularity modulo 2. The automorphic conclusions retain the classification premises and proof gates of the lifting and transfer suppliers (BCGP25 §1.6, pp. 7–8, line 343; Theorems A and B, pp. 2–4, lines 100 and 150).

## Scope and ownership

This roadmap owns the endpoint arithmetic of BCGP25 §6.4 and §§8–10, including every Frobenius class in the ordinary local realization table. It treats abelian surfaces with bad as well as good reduction at 2, product special fibres as well as Jacobians, and ordinary integral mod-2 models as well as their generic Galois representations. The isobaric notion of modularity is over any number field; the unconditional-in-image modularity endpoints specified in Layer 7 are over ℚ. All references to conditional automorphy include the exact premises below.

The even-subset realization of Jacobian 2-torsion, its Weil pairing and S₆ ≅ Sp₄(𝔽₂) are stated by AbelianSchemesAndArithmeticModuli A3.12. Section 2.1 here fixes an explicit basis and compares matrices and the two S₅ embeddings; it does not reconstruct that realization. Semistable ordinary reduction, the isotropic filtration and the rational 2-torsion consequence belong to NeronModelsAndSemistableAbelianVarieties §§6.11–6.13, including the Siegel-parabolic intersection comparison in §6.13. General moduli of polarized abelian schemes, torsion pairings, principal quotients, Serre–Tate deformation and finite-level lifting belong to AbelianSchemesAndArithmeticModuli A2–A4 and A6.32–A6.34. Honda–Tate belongs to AbelianSchemesAndArithmeticModuliPartII F3.2 and finite-field isogeny comparison to EndoscopicTransferAndUnitaryTraceComparison §8.3. CurvesOverFiniteFields §§4.1, 4.6 and 4.11 own the Weil-polynomial predicate, polynomial ordinarity and polynomial point counts; AbelianVarietiesOverFiniteFields §§1.2, 6.1–6.3 and 10.3 own their geometric comparisons and the polarized surface trichotomy. The ordinary Weil-quartic predicate here specializes those notions in dimension two for the explicit local classification. S₅(b) uses Mathlib’s stabilizer subgroup and A₅(b) its intersection with the native alternating group. The finite 2-group fixed-vector theorem is supplied by Tau Ceti and consumed through NeronModelsAndSemistableAbelianVarieties §6.13.

General similitude groups, adequacy, Zariski images, projective lifting, potentially abelian decomposition and tidy/vast image conditions belong to ArithmeticGaloisRepresentations §§5.12, 6.3 and 7.3–7.11. PotentialAutomorphyInfrastructurePartII PL.4, Adequacy relaxed to the vanishing of H¹(H, ad), supplies relaxed adequacy and the adequate implication; ArithmeticGaloisRepresentations §7.9 supplies the trace/spanning comparison identifying its characteristic-two specialization with BCGP25 near adequacy. Only the reasonableness and integral-enormity extensions are requested from ArithmeticGaloisRepresentations. The surface open-image consequence of the Tate centralizer theorem is requested from FaltingsFinitenessAndIsogenyTheorems R28.4, after the generic Galois and similitude inputs. FaltingsFinitenessAndIsogenyTheorems R28.4 owns semisimplicity and the isogeny criterion, including the requested residual-image endomorphism adapters. General thin sets, Hilbert irreducibility, their integral counts and Hilbert points with simultaneous local conditions belong to InverseGaloisAndArithmeticFundamentalGroups IG.2.4–IG.2.7. This roadmap applies IG.2.7 to smooth rational genus-two parameter spaces.

GSp4NonregularModularityLifting NR2.5–NR2.6 and NR11.2–NR11.6 supply weight-two attachment, pure monodromy comparison and nonregular lifting. This roadmap does not plan higher Coleman theory, regular ordinary R=T or patching. EndoscopicTransferAndUnitaryTraceComparison §11.1 and ModularityAndLanglandsExtensions §3.26 own the classification, packets and spin transfer; AutomorphicLFunctionsAndLocalFactors AL.2–AL.4 owns the analytic continuation, isobaric uniqueness and exterior transfers. The finite-image Artin and functoriality inputs retain ModularityAndLanglandsExtensions §§1.9, 1.11, 1.13 and GL2AutomorphicRepresentationsAndTransfer R17.5 as owners; finite-image projective lifting to GL₂(ℂ) is R17.5.4. Modularity of odd irreducible regular rank-two compatible systems over ℚ is ClassicalSerreModularity R27.6. Cuspidal quadratic induction of an algebraic Hecke character is EndoscopicTransferAndUnitaryTraceComparison §13.3, with its all-place comparison in ModularityAndLanglandsExtensions, Automorphic induction and its cuspidality criterion. Rank-one de Rham algebraicity is AutomorphicGaloisRepresentations §3.13, and the constraint on infinity types is AutomorphicGaloisRepresentationsPartII AG2.0. Section 8.2 combines these rank-one and induction inputs; in rank four the rank-two dichotomy of BCGP25 Lemma 10.2.4 occurs only in its finite-up-to-twist branch, which ArithmeticGaloisRepresentations §§5.12 and 7.6 supply.

Integral curve models and pointed specialization belong to RelativeJacobiansAndIntegralCurveModels §§0.1–0.3, 2.2 and 2.4; AlgebraicCurves Layers 5, 10 and 11 own the function-field theory, gap sequences and Weierstrass points. For unpointed local models use the unramified section-acquiring extension and descent specified below. Polarized algebraization belongs to ShimuraCompactifications C4.4–C4.6. Fine curve moduli, the universal curve and geometric Torelli belong to AbelianSchemesAndArithmeticModuliPartII B4.1, used here at genus 2 and level 3. Section 4.8 adds the framing twist, the genus-two open-complement identification, its local density and the odd-theta variant to that supplied quasi-finite Torelli map. HyperellipticCurves §§0.2 and 0.3 own the weighted-projective model and smoothness criterion; §4.4 here gives its genus-two gcd form and finite enumerations. The twisted odd-theta space and its marked and unmarked Torelli loci (§4.8), the explicit local seeds at 3 (§§5.3 and 8.7), and the compatible-system dictionary of the Galois types (§8.3) are targets here. SatoTateGroups §8.7 owns the Galois endomorphism type and §§9.7–9.8 its classification and realizability. Their generic moduli, deformation and automorphic inputs have the separate owners just named.

## Conventions

All Galois representations are continuous. Number fields and coefficient fields carry specified embeddings into separable or algebraic closures, and isomorphisms preserve the indicated Galois action. Work in a fixed universe for the finite-dimensional modules; changing universe does not change finite-field cardinalities. Coefficients of residual representations are explicitly 𝔽₂, 𝔽₃ or their specified finite extensions, and rational ℓ-adic representations have coefficients in a finite extension of ℚ_ℓ before extension to ℚ̄_ℓ.

Write ρ_(A,ℓ) for H¹ étale, with geometric Frobenius and multiplier ε⁻¹; ε has Hodge–Tate weight −1. The Tate module and A[ℓ] carry the dual representation. Thus the arithmetic Frobenius polynomial on a good special fibre's Tate module is the geometric Frobenius polynomial on H¹. Write Q(X)=det(X−F) and L_v(T)=det(1−FT) on inertia invariants, with T=q_v^(−s); the Euler factor is L_v(T)⁻¹. Each inverse local denominator is first a formal power series, valid because its constant coefficient is 1. The analytic Euler product is initially taken in Re(s)>3/2; its continuations use the analytic theorems rather than total inversion at a zero of a local denominator. Local reciprocity sends a uniformizer to geometric Frobenius. The ordered ordinary diagonal is χ₁,χ₂,ε⁻¹χ₂⁻¹,ε⁻¹χ₁⁻¹. Weight two for GSp₄ means the nondegenerate limit-of-discrete-series weight (1,1;2), with central character |·|². H¹ of a surface has Hodge–Tate multiset {0,0,1,1}, and purity weight one (BCGP25 §§1.8.3, 1.8.10, 1.8.12, 1.8.23, pp. 8–16, lines 376, 511, 568 and 728).

Use column vectors and the form J=(0,S;−S,0), with S the 2×2 antidiagonal identity. It is conjugate, with the appropriate sign, to the form of Mathlib's `Matrix.J`. A GSp element has a specified unit multiplier; an Sp element has multiplier one. The projective quotient over 𝔽₃ identifies only the central scalars ±1. The symbols 2C through 12C in Layer 1 denote projective conjugacy classes, with characteristic polynomials of lifts taken up to X↦−X. The identification with S₆ is the one normalized in §2.1. S₅(b) fixes a letter, S₅(a) is its outer twist, and A₅(b)=S₅(b)∩A₆ (BCGP25 §§1.8.7, 8.1 and 9.1, pp. 10, 180–181 and 187–188, lines 440, 8274 and 8646).

The compatible-system equality in modularity includes every finite place, with the constituent twist |det|^((1−n)/2) on GL_n. For a cuspidal GL₄ witness Π the twist is |det|^(−3/2). The completed motivic function is Λ(s)=N^(s/2)Γ_ℂ(s)²L(s,H¹(A)), where Γ_ℂ(s)=2(2π)^(−s)Γ(s); its equation is Λ(s)=wΛ(2−s), w∈{−1,1}. No archimedean comparison is built into the definition of modularity alone (BCGP25 Definition 1.8.25, p.16, line 750; BCGP21 Remark 9.1.7, p.251, line 12056).

**Checks.**

- For an elliptic special fibre over 𝔽₃ of trace 1, Q(X)=X²−X+3 and L_v(T)=1−T+3T². Replacing geometric H¹ Frobenius by its inverse gives constant term 1/3 in Q, so it fails this convention. A product of two such factors gives (1−T+3T²)².
- At 2 modulo 3, ε(F)=2⁻¹=−1 and ε⁻¹(F)=−1. Scalars ±I have multiplier 1, so neither is an outer Frobenius lift. Twisting a lift by −1 sends X⁴+aX³+bX²+2aX+4 to X⁴−aX³+bX²−2aX+4.
- In the basis of §2.1, the pairings of e₁ with e₄ and of e₂ with e₃ are 1 in 𝔽₂, while that of e₁ with e₂ is 0. Over ℤ the 2×2 alternating block squares to −I, not I; this records the sign lost in characteristic 2.
- Dualizing weights {0,0,1,1} gives {0,0,−1,−1}; twisting by ε⁻³ gives {3,3,2,2}. A scalar twist shifts all weights equally, so it cannot turn H¹ into a finite-image system. The functional-equation involution sends s=0 to 2 and fixes s=1.

## Exact supplier contracts

### From Mathlib

Use `Matrix.J` and `Matrix.symplecticGroup` in `Mathlib/LinearAlgebra/SymplecticGroup.lean` (lines 58 and 101): the latter is the matrix submonoid defined by AJAᵀ=J, rather than a group carrying an arbitrary multiplier. Use `Matrix.charpoly` in `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` (line 132), `Matrix.IsSymm` in `Mathlib/LinearAlgebra/Matrix/Symmetric.lean` (line 33), `Equiv.Perm`, `alternatingGroup` in `Mathlib/GroupTheory/SpecificGroups/Alternating.lean` (line 72), and `MulAction.stabilizer` in `Mathlib/GroupTheory/GroupAction/Defs.lean` (line 515). The stabilizer is a subgroup of the specified action, and the alternating group is the sign kernel. Use `Representation` in `Mathlib/RepresentationTheory/Basic.lean` (line 48), `groupCohomology.H1` in `Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean` (line 965), and `Polynomial.aroots` in `Mathlib/Algebra/Polynomial/Roots.lean` (line 479). A representation alone includes neither topological continuity nor finite dimension; these are explicit arithmetic hypotheses. Roots are counted with multiplicity, and no root statement is applied to the zero polynomial.

Use `card_alternatingGroup` in `Mathlib/GroupTheory/SpecificGroups/Alternating.lean` (line 136), with a nontrivial finite type, and `alternatingGroup.isSimpleGroup` in `Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean` (line 203), with at least five letters. The applications have 5!/2=60 and 6!/2=360 elements. Simplicity and these cardinalities are inputs to the A₅ image arguments.

### From Tau Ceti

Use `TauCeti.AlgebraicGeometry.AbelianVariety` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` (line 95), a proper geometrically integral group scheme over a field; it does not bundle a polarization or a chosen dimension. Use `TauCeti.schurMultiplier` in `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean` (line 148), the coefficient-dependent H²(G,kˣ), not the assertion that the integral Schur multiplier of A₅ is C₂. The latter finite-group fact is a target of §2.5 through BCGP25 Remark 8.2.3.

Use `TauCeti.GlobalNumberFields.HeckeCharacter` in `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean` (line 70), a continuous homomorphism from the idele class group to ℂˣ, its predicate `TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic` in `HeckeCharacter/Algebraic.lean` (line 60), integer exponents on the identity component with real sign parities unconstrained, and its purity theorem `TauCeti.GlobalNumberFields.HeckeCharacter.add_conjugate_eq_add_conjugate` in `HeckeCharacter/Purity.lean` (line 98): the sum of the exponents at an embedding and at its complex conjugate is independent of the embedding. The pin does not show that the exponents factor through the maximal CM or totally real subfield; that constraint is consumed from AutomorphicGaloisRepresentationsPartII AG2.0 in §8.2.

Use `Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one` in `TauCeti/RepresentationTheory/PGroupInvariants.lean` (line 161): a finite group whose operators have p-power order on a nonzero module over a commutative ring of characteristic prime p has a nonzero fixed vector. It requires a nontrivial module and a finite group, and no finite-dimension hypothesis. Here p=2 and the module is 𝔽₂⁴.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume A3.7–A3.8 for perfect alternating Weil pairings and level structures, A3.11 for principal quotients after finite extension, A3.12 for the even-subset realization, A4.8 for effectivity of polarized formal lifts, A4.9–A4.14 for polarized Serre–Tate and finite-level lifting, A5.7 for realization conventions, and A6.32–A6.34 for Weil restriction and quadratic twists. The odd-prime lifting input is height four, order p⁴, with a compatible polarized level-one truncated Barsotti–Tate structure. The dyadic theorem A4.13 takes, over the integers O of a finite extension of ℚ₂ and for a principally polarized ordinary abelian surface A₀ over the residue field, a finite flat group scheme over O of order 16 killed by 2 with a Cartier self-duality λ satisfying λ^∨=−λ and an identification of its special fibre with A₀[2]; it owns the comparison of such ordinary extensions with the symmetric formal-torus quotient, its Frobenius descent and the successive polarized lifting, and identifies underlying torsion without asserting that every chosen self-duality is a polarization. On a group killed by 2 the sign is immaterial, so λ^∨=−λ means λ^∨=λ. The product principal polarization has a reducible theta divisor.


What AbelianSchemesAndArithmeticModuli must provide (gap:dyadic-selfdual-polarized-lift): For the ordinary finite flat group scheme W/ℤ₂ of order 16 killed by 2 in §8.7, prove that existence of a Cartier self-duality implies existence of a skew self-duality to which A4.13 applies, retaining the specified underlying W and distinguishing this from lifting an arbitrarily prescribed self-duality or asserting strong alternation.

What AbelianSchemesAndArithmeticModuli must provide (gap:ordinary-polarized-three-model): For an ordinary finite-flat symplectic mod-3 representation over ℚ₃ with multiplier ε̄, construct the compatible polarized height-four level-one truncated Barsotti–Tate model and identify its special fibre with V extended by its multiplicative dual so that A4.12 applies to each seed.

What AbelianSchemesAndArithmeticModuli must provide (gap:genus-two-level-three-monodromy): Prove geometric Sp₄(𝔽₃) level-3 monodromy for the smooth genus-two coefficient family and the universal ordered-six-branch hyperelliptic family, compatibly with characteristic-zero base change, and the resulting arithmetic GSp₄(𝔽₃) monodromy over ℚ and thin proper-image specialization loci.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

Consume F3.2, Honda–Tate simple isogeny classification, and its ordinary specialization: ordinary Weil quartics classify surface isogeny classes over 𝔽_p, including products and repeated elliptic factors. Endomorphism division-algebra invariants vanish in the ordinary irreducible case. Consume B4.1 at g=2 and ℓ=3 for the fine curve scheme over ℚ(ζ₃), its universal curve, its quasi-finite polarized Torelli map, geometric Torelli and the compatible level-change maps. Section 4.8 descends the supplied family with the prescribed framing using AlgebraicModuliForArithmeticGeometry §§3.5 and 5.2, then proves the additional open-complement and local-density statements.

### From TauCetiRoadmap.CurvesOverFiniteFields

Consume §4.1 for the q-Weil predicate, §4.3 for finiteness and coefficient bounds, §4.6 for polynomial p-rank, slopes and ordinarity, and §4.11 for the polynomial point-count formula. In degree four at q=p, ordinarity is p∤b. Their specialization in §4.1 fixes the coordinates used by the local lists.

### From TauCetiRoadmap.AbelianVarietiesOverFiniteFields

Consume §1.2 for #A(𝔽_q)=P_A(1), §§6.1–6.3 for geometric p-rank and its comparison with Frobenius slopes, and §10.3 for the polarized surface trichotomy over a finite field: a canonically polarized genus-two Jacobian, a product of elliptic curves with product polarization, or a quadratic Weil restriction with its descended product polarization. Section 4.5 computes the residual pairing in the last case; an unpolarized isogeny does not supply that pairing.

### From TauCetiRoadmap.HyperellipticCurves

Consume §0.2 for the weighted-projective model in ℙ(1,g+1,1), §0.3 for its geometric smoothness criterion in every characteristic, and §0.6 for Weierstrass points as fixed points of the involution, their 2g+2 count in characteristic different from 2, and the odd-degree model at a rational Weierstrass point. Section 4.4 specializes the supplied criterion and counts its finite equation loci.

### From TauCetiRoadmap.SatoTateGroups

Consume §8.7, The Galois endomorphism type, for the pair [Gal(L/F), End_L(A)⊗ℝ] up to equivariant isomorphism and its isogeny invariance, and §§9.7–9.8 for the classification and realizability of the 52 types over number fields and 34 over ℚ. Consume §9.10 to discharge their Mumford–Tate and algebraic Sato–Tate hypotheses in dimension two. Section 8.3 here compares these types with the compatible-system decomposition; it does not build their Sato–Tate classification.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§5.12, 6.3, 7.1, 7.3, 7.6, 7.9 and 7.11 for potentially abelian decomposition, Tate curves, symplectic similitudes, projective lifting and roots of characters, adequacy and tidy/vast images. Section 5.12 is Clifford theory over an arbitrary field: it supplies the decomposition ρ|_(G_L) ≅ ⊕χ_i^(⊕a) and the induction from the stabilizer field, but no algebraicity of the χ_i. Section 7.1, Tensor induction, supplies the positive-flip Asai construction for quadratic extensions; its quadratic-character twist is the exterior-square cross-term in §8.2. In the image tests Γ means Γ′∩Sp₄. Section 7.9 also supplies the finite-group equivalence between semisimple spanning and the eigenprojection trace condition, used with PL.4 relaxed adequacy after extending coefficients to contain eigenvalues. Residual and characteristic-zero enormousness are different conditions; no residual regular element alone implies the latter.


What ArithmeticGaloisRepresentations must provide (gap:near-adequacy-reasonableness): Provide Whitmore Definition 3.19 reasonableness with its eventual cyclotomic-image H⁰ vanishing and semisimple-detection conditions, its conditional dual-adjoint H¹ vanishing, and the symplectic-adequacy comparison of Lemma 3.20.

For this contract take a residual representation ρ̄:G_F→G(k) over a finite field k of prime characteristic p, with reductive G in the setting of WHITMORE22 §3.2, and let 𝔤⁰ be the Lie algebra of the derived group and D=(𝔤⁰)∨ with the residual adjoint action. For H_n=ρ̄(G_(F(ζ_(p^n)))), require, for every sufficiently large n, H⁰(H_n,D)=0 and the semisimple detection condition of Definition 3.15(2) on every nonzero simple submodule of D. Also require H¹(H_n,D)=0 if ζ_p belongs to the field cut out by D. Lemma 3.20 applies when H¹(H_1,k)=0: all H_n equal H_1, and G-adequacy of H_1 implies G-reasonableness, in particular for the applicable symplectic group (WHITMORE22 Definition 3.15, p.22, line 936; Definition 3.19 and Lemma 3.20, p.24, lines 1015–1024).

What ArithmeticGaloisRepresentations must provide (gap:integral-enormity): Provide BCGP25 Definition 7.1.1 integral enormousness and Corollary 7.1.4, including its Sp₄ and induced SL₂ × SL₂ alternatives and the residual regular-semisimple and cyclotomic restriction hypotheses.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

Consume R28.4.4–R28.4.7 for semisimplicity, endomorphism centralizers and the isogeny criterion. For arbitrary surfaces in the residual A₅ argument use ZARHIN00 Theorem 4.1 on the five-point module (p.5, line 186) together with the endomorphism-subalgebra argument and Lemma 3.1 (pp.3–4, line 113); its Jacobian-only Theorem 2.1 is insufficient.

What FaltingsFinitenessAndIsogenyTheorems must provide (gap:surface-residual-endomorphisms): Prove that geometric End is ℤ for a characteristic-zero abelian surface with symplectically identified mod-2 image containing A₅(b), by the five-point very-simple module and the Galois-stable endomorphism algebra, and for prime-to-3-polarized surfaces with surjective mod-3 image.

What FaltingsFinitenessAndIsogenyTheorems must provide (gap:surface-open-image): For a polarized abelian surface over a number field with geometric endomorphism ring ℤ, prove that each rational ℓ-adic Zariski closure contains Sp₄, with invariance under finite base change and isogeny, without requiring a principal polarization.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

Consume §§3.5–3.6, 3.11–3.12, 5.0a–5.6 and 6.10–6.13 for saturated toric filtrations, orthogonality, semistability, good reduction, all finite local Euler factors and purity, compatible systems, ordinary isotropic submodules and the rational 2-torsion consequence. The toric submodule of a purely toric surface has rank two; the entire Tate module has rank four. The local-neighbourhood extension below is required independently of these pointwise statements. Consume §3.14 for the period-lattice torsion cone, evaluation pairing and unramified descent, after the algebraization of ShimuraCompactifications C4.5–C4.6. KIS99 Theorem 5.1 is cited by locator alone as uncertified; its integral strengthening is not attributed to that theorem.

What NeronModelsAndSemistableAbelianVarieties must provide (gap:local-neighbourhoods): Prove local persistence in smooth polarized families of prescribed finite-level generic torsion, prime-to-p rational Weil–Deligne data, semistable ordinarity and distinguishedness, and separately openness of the prescribed integral ordinary W/ℤ₂ isomorphism class, without claiming constancy of the full p-adic representation.

### From TauCetiRoadmap.ShimuraCompactifications

Consume C4.4–C4.6 under (C4-a), over ℤ₂ with radical ideal (2): the base is a complete noetherian normal domain and the tori are isotrivial. In §4.7 the abelian part is zero, the character and period lattices are X≅Y≅ℤ² with Frobenius R, the polarization map Y→X is the identity, and the period matrix is ((q,t²),(t²,q)). Its symmetric bilinear periods give the rigidified cubical datum; the valuation form v₂(q)I₂ is positive definite and admits an R-invariant square decomposition. C4.5–C4.6 algebraize this principally polarized datum and compare it with NeronModelsAndSemistableAbelianVarieties §§3.13–3.14 over the DVR.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Consume §§6.27, 6.29 and 6.31–6.35 for ordered ordinary flags and pure weight-two points. Section 6.35 requires p>2, the finite-flat residual twist and compatible stabilizations; it puts the seed on a unique component and the target on that same component. The no-eigenvalue-ratio extension of §2.2 is required separately.

What LocalGaloisDeformationRings must provide (gap:unramified-lift-rigidity): For ℓ ≠ p and unramified residual representations with no Frobenius eigenvalue ratio ℓ, prove every continuous lift to a complete local p-adic coefficient algebra is unramified, including nonreduced coefficient algebras.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume R07.6.10, the good-reduction cyclotomic-image lemma for p≥3. It gives equality of residual images over ℚ(ζ_p) and ℚ(ζ_(p^n)), not an analogous statement without good reduction or at p=2.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

Consume PL.0, Soluble and cyclic CM extensions with prescribed local behaviour, for finite solvable Galois extensions with prescribed completions and linear disjointness, prescribing trivial real completions for a totally real extension and avoiding the residual field to preserve A₅. Consume PL.0, Soluble base change and descent of automorphy, for the corresponding automorphic comparisons. Consume PL.4, Strong residual oddness at a real place, for polarized absolutely irreducible pairs in even rank and characteristic two. Consume PL.4, Adequacy relaxed to the vanishing of H¹(H, ad) (PL.4/relaxed-adequacy), for its finite-image predicate over coefficients containing the eigenvalues and its adequate-implies-relaxed-adequate comparison. Together with ArithmeticGaloisRepresentations §7.9 this is BCGP25 near adequacy in characteristic two; finite coefficient extension gives the comparison over the original field. The alternating/nonalternating symmetric-form dichotomy is included there in general even rank; the translation to the symplectic matrix and its class count are the further contract below.

What PotentialAutomorphyInfrastructurePartII must provide (gap:strong-odd-symplectic-criterion): Translate the general even-rank symmetric-form dichotomy of PL.4 to the matrix ψ(c_v)J of BCGP25 Lemma 5.2.7, prove its nonzero-diagonal test, and count the involution classes as n + 1 + floor(n/2) in symplectic rank n over a finite field of characteristic two.

### From TauCetiRoadmap.GSp4NonregularModularityLifting

Consume NR2.5–NR2.6 for ordinary weight-two attachment and pure general-type monodromy, and NR11.2–NR11.6 for the full dyadic and odd-prime seeds, nonvanishing, rank one and classical lifting. Retain NR10 data, integral enormousness, purity, ordinary p-distinguished semistable weight two, the appropriate five seed conditions, the Zariski alternative and all supplier proof gates in its Proof gates and scope of the conditional conclusions. A seed matches the target residually. In the odd branch it need not have regular weight. In the dyadic branch preserve the equality of images over ℚ and ℚ(i).

What GSp4NonregularModularityLifting must provide (gap:ordinary-spherical-attachment): For a pure general-type weight-two system realized by an abelian surface with good ordinary reduction at finitely many primes, choose a global automorphic representation with its Arthur parameter, spherical and ordinarily stabilized at those primes, preserving the other prescribed local members and the archimedean weight, and identify its ordinary Galois attachment at each chosen prime.

What GSp4NonregularModularityLifting must provide (gap:all-place-surface-comparison): For a weight-two general-type GSp₄ representation attached at p to the pure H¹ of an abelian surface, prove the compatible-system comparison with its GL₄ transfer at every finite place including ramified places above p, and compare conductors and the archimedean factors in the stated motivic normalization.

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

Consume §2.11 Hilbert Hida weight change with fixed residual determinant only in its stated prime and weight range. The dyadic weight-one extension below is a separate requirement for §3.1.

What OrdinaryAutomorphicFormsAndModularityLifting must provide (gap:dyadic-weight-one-change): Extend Hilbert ordinary weight change to a parallel-weight-one form unramified above 2, obtaining after solvable totally real base change an ordinary parallel-weight-two form of trivial central character with the prescribed residual representation.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

Consume IG.2.4–IG.2.7 for thin subsets of varieties, Hilbert irreducibility, the integral-box count O(H^(r−1/2) log H), and Hilbert points with weak approximation in simultaneous local opens outside any proper closed subset. Smooth geometrically integral rational varieties satisfy the weak approximation hypothesis for every finite set of places. The complement of a thin set contains a Hilbert subset outside a proper closed subset, so IG.2.5 and IG.2.7 give the approximation used here. A thin set is contained in a finite union of proper closed loci and images of generically finite covers of degree at least two. Hilbert irreducibility specializes a known monodromy group; it does not prove that monodromy group.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §8.3 for finite-field Tate full faithfulness and isogeny classification, and §11.1 for general-type packets and the unitary-normalized transfer with its GSp₄ classification input record. Twisting back to the algebraic normalization is explicit. The forward singular-weight extension below retains the same local parameters and classification premises. Consume §13.3, Automorphic induction of a quadratic Hecke character: for a quadratic extension K/F and an algebraic Hecke character ψ of K distinct from its conjugate, the induction AI_(K/F)(ψ) is cuspidal on GL₂(𝔸_F), with the induced unramified parameters and a determinant containing the quadratic character of K/F. That section takes the identification of a Galois representation with an induction of ψ_p as its input; §8.2 here supplies it from Clifford theory and rank-one algebraicity.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:forward-singular-spin-transfer): Supply the forward cuspidal spin transfer from a singular weight-two GSp₄ representation with absolutely irreducible attached Galois representation, with every-place parameters and central-character twists, as well as the classification-based exclusion of nongeneral types.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.2 Global Godement–Jacquet theory and Centered entire functions and paired products, AL.3 Strong multiplicity one for isobaric sums, and AL.4 Weil–Deligne normalization and factor operations and Exterior-power factors after an established transfer. Equality outside a finite set determines isobaric cuspidal support but does not supply factors at the omitted places. The completed function in §0.3 uses its stated Γ-factor convention.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:all-place-exterior-transfers): Supply existence and equality of every finite local factor for the established small-rank exterior-power and tensor transfers of normalized H¹ constituents, including GL₂ + GL₂ and character decompositions.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Consume §1.9 odd Artin over totally real fields, §1.11 the GL₂ × GL₂ tensor product, §1.13 symmetric cube, and Automorphic induction and its cuspidality criterion. The latter gives, for a cyclic extension L/F and an essentially unitary cuspidal input on GL_m(𝔸_L), the isobaric induction whose local parameter at every place is the sum, over the places above it, of the induced local parameters; for an extension of prime degree, a cuspidal input not isomorphic to its nontrivial Galois conjugates has cuspidal induction. Section 3.26 gives the classification dependency, retaining the weighted twisted fundamental lemma and the precise trace and Arthur multiplicity premises. Local spherical choices use multiplicity one for every global representation with the specified general-type Arthur parameter; they are not inferred for a parameter outside general type.

### From TauCetiRoadmap.ClassicalSerreModularity

Consume R27.6, Theorem 10.1(i): regular compatible systems: every odd, irreducible, regular compatible system of two-dimensional representations of G_ℚ comes, after a twist, from a newform of weight at least two. The rank-two systems used in §8.4, the constituents of H¹ in the reducible types and the factor s of type E[D_n], are odd, irreducible and regular compatible systems with Hodge–Tate weights {0,1} (§8.3), so the newform f has weight two and, at almost all primes, the system has the Euler factors of π_f ⊗ |det|^(−1/2) in the normalization of §0.1. The equality of local factors at every finite place q is the consumer's step: compare at a coefficient prime not above q, using the Néron compatible-system factors of NeronModelsAndSemistableAbelianVarieties §6.10 for H¹ and AutomorphicGaloisRepresentations §§3.7 and 3.11 for the newform; type E[D_n] adds the tensor-product comparison of ModularityAndLanglandsExtensions §1.11.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Consume R17.5.11 Prime-regular characters and reduction comparison, including modular-character recognition and the projective-cover/Hom comparison, and R17.5.1 and R17.5.4–R17.5.7 for the solvable Artin branch. A₅ is nonsolvable, so its odd Artin input is the distinct totally real theorem above. Consume R17.5.4, Continuous finite-image arithmetic projective lifting, also for the projective A₅ representation of §3.1: over a number field it gives a continuous finite-image lift to GL₂(ℂ) with the prescribed projectivization, any two lifts differ by a finite-order scalar character, and a lift is odd at a real place whose complex conjugation is a nontrivial projective involution. It prescribes neither the determinant nor the residual reduction; §3.1 fixes both with R17.5.11.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

Consume AG2.2 for attachment under twists and solvable base change and AG2.5 for RACSDC Galois systems and local comparison, with regular algebraicity, conjugate self-duality, cuspidality and coefficient embeddings retained. Consume AG2.0, The l-adic character of an algebraic Hecke character, its Hodge–Tate numbers and its weight: for an algebraic Hecke character χ of a number field K with exponents (a_τ), its avatar r_(p,ι)(χ) matches χ_v under geometric reciprocity at every place v not above p, has Hodge–Tate number a_(ι∘τ) at each embedding τ of K into ℚ̄_p, and a_τ+a_τ′ equals the weight whenever τ and τ′ restrict to complex-conjugate embeddings of the maximal subfield K₀ of K that is imaginary CM or totally real (conjugation trivial in the totally real case). Consume AG2.P, Finite-coefficient periods, descent and geometric comparison, for the de Rham property after restriction to a finite extension and on the image of a commuting idempotent.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

Consume §3.13, Geometric characters and algebraic Hecke characters: a continuous character of G_K, K a number field, unramified outside finitely many places and de Rham at every place above p, is after a finite coefficient enlargement the p-adic avatar of an algebraic Hecke character with the same labelled degrees; over a totally real K it is a finite-order character times an integer power of ε. Its finite-ramification hypothesis is checked in §8.2 before it is applied. Consume §§3.7 and 3.11, Carayol's Theorem B and the representation dictionary, for local–global compatibility of a weight-two newform at every finite place away from the coefficient prime, with the L-factor and conductor translations of that dictionary.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §§2.3–2.7 for local induced representations and the archimedean parameter specialization used with the AL.2 archimedean factors; no archimedean normalization is inferred from finite Euler factors alone.

### From TauCetiRoadmap.EllipticCurveModularity

Consume R29.6 modularity of elliptic curves over ℚ. Products use two GL₂ constituents and no cuspidal GL₄ conclusion.

### From TauCetiRoadmap.EllipticCurveModularityPartIIGL2TypeAbelianVarieties

Consume GT.3 modularity of GL₂-type abelian varieties over ℚ with its coefficient-field compatible systems, not a theorem over arbitrary quadratic fields.

### From TauCetiRoadmap.ShimuraVarieties

Consume §5.0 Rational polarized Siegel moduli, its fine integral charts with principal polarization and full level N≥3, universal families, and level-change maps. A level-two moduli problem alone has the automorphism −1 and supplies only the stated coarse quotient. Section 4.8 specializes the fine level-three chart before adding its level-two cover; generic genus-two torsion geometry is not reconstructed here.

What ShimuraVarieties must provide (gap:siegel-prime-to-level-monodromy): For each g ≥ 1 and a connected fixed-pairing fine Siegel chart of level N ≥ 3 in characteristic zero, prove that adjoining symplectic level ℓ with prime ℓ not dividing N gives a geometrically connected cover with group Sp_(2g)(𝔽_ℓ), compatibly with the universal family and level change.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Consume §§3.5 and 5.2 for polarized descent and rigid level functors. These are generic descent and representability tools, rather than a statement of odd-theta rationality; the specialized twist and marked Torelli target is §4.8.

### From TauCetiRoadmap.AlgebraicCurves

Consume Layer 10 for hyperelliptic function fields, their ramification, the uniqueness of the degree-two rational subfield and the characteristic-two function-field description, Layer 5 for the gap sequence at a rational place, and Layer 11 for Weierstrass points. In genus two a rational place is a Weierstrass place exactly when 2 is a pole number there; by the uniqueness of the degree-two rational subfield these are the ramified places of the hyperelliptic double cover, over every field of characteristic different from 2. Layer 11's equality case, exactly 2g+2 Weierstrass points for a hyperelliptic function field, is its algebraically closed characteristic-zero form. Use RelativeJacobiansAndIntegralCurveModels §§0.1–0.3, 2.2 and 2.4 with the section and descent hypotheses below for integral models and the good-reduction Jacobian comparison; the equation-specific two-chart smoothness criterion is §4.4 here.

### From TauCetiRoadmap.RelativeJacobiansAndIntegralCurveModels

Consume §§0.1–0.3 for marked integral models, proper specialization and normalization charts, and §§2.2 and 2.4 for the relative Jacobian and specialization of a pointed smooth proper geometrically connected curve family. For a smooth proper model over the integers of a finite extension of ℚ_p without a section, pass to a finite unramified extension over whose residue field the smooth special fibre has a point, and lift that point by Hensel's lemma. Apply §§2.2 and 2.4 there. Inertia is unchanged by this extension, so descend good Jacobian reduction by NeronModelsAndSemistableAbelianVarieties §5.1, using any prime ℓ different from the residue characteristic. The section-independent Jacobian comparison of §2.2 respects the canonical descent data and identifies the descended special fibre with the Jacobian of the curve fibre. The converse need not hold for a genus-two curve with a product Jacobian special fibre.

### From TauCetiRoadmap.PolynomialGaloisGroups

Consume Layers 0 and 4, intrinsic root permutation actions and resolvents. The degree-40 and degree-27 actions in §1.1 are mathematical permutation representations, not a replacement construction of resolvent theory.

### From TauCetiRoadmap.EllipticCurves

Consume Layers 3 and 4 for the finite-field Hasse bound and the Tate-curve/reduction dictionary. At 3 full rational 2-torsion forces the ordinary elliptic seed to fail: 4 divides #E(𝔽₃), the Hasse interval is [1,7], hence #E(𝔽₃)=4 and trace 0.

## How to read the build

Layer 0 fixes the realization and modularity dictionary. Layers 1–2 establish the exact residual-image and matrix comparisons, and Layer 3 combines them with the supplied lifting theorem at 2. Layers 4–5 build the complete local realization geometry, including the odd-theta moduli in §4.8 and every scalar and nonscalar ordinary seed at 3 in §5.3. Layer 6 assembles these local points by approximation outside thin sets. Layer 7 proves the modularity endpoints and their analytic consequences. Layer 8 applies them to density, endomorphism types and prescribed mod-2 representations; the type dictionary in §8.3 precedes its use in §8.4. Each Needs line separates a statement's carriers from its proposed proof inputs. The missing supplier extensions are named contracts, and all their hypotheses travel into the consuming conclusions. [Suggested.lean](Suggested.lean) records the headline-statement boundary at the library pins.

## Layer 0: Modularity and ordinary realizations

### 0.1 Modular (automorphic) abelian surfaces and genus-two curves

Let F be a number field and A/F an abelian surface. Write H¹(A) for the weakly compatible system (H¹_ét(A_F̄, ℚ̄_ℓ))_ℓ with geometric Frobenius elements, and L(s, H¹(A)) = ∏_v det(1 − Frob_v q_v^(−s) | H¹(A)^(I_v))⁻¹ over the finite places v of F, each factor computed at a prime ℓ ≠ p_v (it does not depend on ℓ). A is modular, equivalently automorphic, if there are integers n_1, …, n_r ≥ 1 with n_1 + … + n_r = 4 and C-algebraic cuspidal automorphic representations π_i of GL_(n_i)(A_F) with L(s, H¹(A)) = ∏_i L(s, π_i ⊗ |det|^((1−n_i)/2)), the equality holding Euler factor by Euler factor at every finite place. A smooth projective genus-two curve X/F is modular if Jac(X) is. The notion depends only on the isogeny class of A and is weaker than BCGP21's notion (a cuspidal GSp₄ representation of parallel weight 2 over a totally real field, §0.1): over ℚ, a product of two non-isogenous elliptic curves is modular here with r = 2, and some products fail the stronger notion. The existence assertion does not exclude cuspidal endoscopic GSp₄ witnesses for other products. (BCGP25 Definition 1.8.25 and Remark 1.8.26, §1.8.24, p. 16, line 750.)

Use the Néron compatible-system local factors, rational isogeny invariance and isobaric strong multiplicity one. Apply the separate all-place small-rank exterior-transfer contract for Hⁱ; equality at unramified places alone does not establish its ramified factors.

The comparison and construction API consists of the following facts.

- The predicate on an abelian surface over a number field defined above.
- If A and B are isogenous over F then A is modular if and only if B is.
- If E_1, E_2 are elliptic curves over F with E_i modular (a cuspidal GL₂ witness), then E_1 × E_2 is modular with r = 2.
- If ρ_(A,p) ≅ ρ_(π,p) for a weight-2 cuspidal π of GSp₄ of general type, then A is modular with r = 1 (node §0.3).
- The normalized isobaric representation ⊞_i (π_i ⊗ |det|^((1−n_i)/2)) of a witness is unique (AutomorphicLFunctionsAndLocalFactors AL.3, Strong multiplicity one for isobaric sums); in particular a cuspidal GL₄ witness excludes witnesses with r ≥ 2.
- X is modular if and only if Jac(X) is modular.
- BCGP21 modularity (§0.1) over ℚ implies modularity in this sense; some products of elliptic curves show that the converse fails.
- If A is modular, then for 0≤i≤4, L(s,Hⁱ(A))=L(s,∧ⁱH¹(A)) is the L-function of an automorphic representation of GL_(binom(4,i)), by the all-place exterior-transfer contract. For i>4, Hⁱ(A)=0 and L(s,Hⁱ(A))=1 (BCGP25 Definition 1.8.25, p.16, line 755).

**Checks.**

- For E_1, E_2 elliptic curves over ℚ, E_1 × E_2 is modular with witness (π_(E₁), π_(E₂)) on GL₂ × GL₂.
- For an F-isogeny A → B the rational H¹ systems and all finite Euler factors agree, so any witness for A is a witness for B. Integral torsion modules need not be isomorphic.
- If A is modular through the GL₄ transfer of a weight-2 GSp₄ form of general type (Theorem A), there is no witness with r = 2.
- For two trace-one elliptic factors at 3 the product denominator is (1−T+3T²)² and its degree is 4; a cuspidal-only definition would discard this modular product.
- An identity isogeny preserves the degree-four local denominator and the witness; a 3-isogeny need not identify integral 3-torsion, so rational realization is essential.
- A cuspidal GL₄ witness has one isobaric constituent, while an elliptic product has two; isobaric uniqueness rules out identifying those supports.
- At i=0,1,2,3,4,5 the exterior ranks are 1,4,6,4,1,0. Degree zero has the trivial GL₁ character; degree five has denominator 1 and no positive-rank automorphic witness is asserted.

If A has a witness with r = 1 on GL₄, every witness has the same normalized isobaric sum ⊞_i (π_i ⊗ |det|^((1−n_i)/2)); the multiset of its cuspidal constituents, including twists, is unique by isobaric strong multiplicity one, so no witness with r ≥ 2 exists. E_1 × E_2 for elliptic curves E_i/Q is modular, with π_i the weight-two forms of E_i. (BCGP25 Definition 1.8.25 and Remark 1.8.26, §1.8.24, p. 16, line 750.)

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10; FaltingsFinitenessAndIsogenyTheorems R28.4; AbelianSchemesAndArithmeticModuli A5.7; EllipticCurveModularity R29.6; AutomorphicLFunctionsAndLocalFactors AL.3, Strong multiplicity one for isobaric sums; AutomorphicLFunctionsAndLocalFactors AL.4, Exterior-power factors after an established transfer; AutomorphicLFunctionsAndLocalFactors AL.4.

### 0.2 p-distinguished ordinary abelian surfaces

Let p be prime and B/ℚ_p an abelian surface whose representation ρ_(B,p) = H¹_ét(B_(ℚ̄_p), ℚ̄_p) : G_(ℚ_p) → GSp₄(ℚ̄_p), of similitude ε⁻¹, is ordinary in the sense of Definition 1.8.10: it is conjugate to an upper triangular representation with diagonal (χ₁, χ₂, ε⁻¹χ₂⁻¹, ε⁻¹χ₁⁻¹). B is p-distinguished if these four characters are pairwise distinct. If B has good ordinary reduction B₀, this holds if and only if the characteristic polynomial Q(x) of Frobenius of B₀ (on T_ℓB₀, ℓ ≠ p) has four distinct roots, equivalently Q(x) is not the square of a quadratic in ℤ[x]. An ordinary abelian surface B₀/𝔽_p is p-distinguished if its Q(x) has distinct roots, and a genus-two curve X/ℚ_p is p-distinguished if Jac(X) is. (BCGP25 Definition 9.1.2, §9.1, p. 187, line 8635; BCGP25 Definition 1.8.10, §1.8.9, p. 11, line 499.)

For good ordinary reduction the two unramified character values are the unit roots α₁,α₂. Their companions p/α₁,p/α₂ have the other slope, so a repeated root forces both pairs to coincide. The resulting monic quadratic square root of Q is rational by uniqueness and integral by monicity. For semistable ordinary reduction use the toric–abelian filtration. A common character twist preserves all pairwise inequalities.

The comparison and construction API consists of the following facts.

- The predicate on an abelian surface over ℚ_p with ordinary ρ_(B,p).
- For good ordinary reduction: p-distinguished if and only if the two unit roots of Q(x) are distinct.
- For good ordinary reduction: p-distinguished if and only if Q(x) is not a square in ℤ[x].
- p-distinguishedness is invariant under unramified quadratic twist.
- Residual p-distinguishedness (Definition 1.8.10) implies p-distinguishedness; the converse fails.
- X is p-distinguished if Jac(X) is.

**Checks.**

- E₋₁ × E_2 over 𝔽₃ is 3-distinguished, since (x² + x + 3)(x² − 2x + 3) has four distinct roots.
- E × E for an ordinary elliptic curve E/𝔽_p is not p-distinguished: Q = Q_E².
- The ordinary curves over 𝔽₃ with Q ≡ x²(x − 1)² mod 3 and Q not a square (Table 9.3.3) are 3-distinguished but not residually 3-distinguished.
- B = Y × Y′ over ℚ₂ (Lemma 9.2.8) is 2-distinguished, with unit roots {α, −α} for α the unit root of x² + x + 2.
- For traces −1 and 2 at 3, the quartic is X⁴−X³+4X²−3X+9 with distinct roots, but modulo 3 it is X²(X+1)²; characteristic-zero distinguishedness does not imply residual distinguishedness.
- For an ordinary E, Q_(E×E)=Q_E² has repeated unit roots and fails distinguishedness.
- For Y×Y′ at 2, Q=X⁴+3X²+4 and the unit roots α and −α are unequal in characteristic zero; reducing their signs modulo 2 would lose the distinction.

E₋₁ × E_2 over 𝔽₃ (traces −1 and 2) is 3-distinguished: Q = (x² + x + 3)(x² − 2x + 3). An unramified quadratic twist preserves p-distinguishedness: it multiplies all four characters by the same character. (BCGP25 Definition 9.1.2, §9.1, p. 187, line 8635; BCGP25 Definition 1.8.10, §1.8.9, p. 11, line 499.)

*Needs:* NeronModelsAndSemistableAbelianVarieties §6.11; NeronModelsAndSemistableAbelianVarieties §6.12; AbelianSchemesAndArithmeticModuli A5.7; AbelianSchemesAndArithmeticModuliPartII F3.2; LocalGaloisDeformationRings §§6.27, 6.29, 6.31–6.35; ArithmeticGaloisRepresentations §7.3.

### 0.3 Weight-two GSp₄ witnesses give modularity and the analytic properties of L(s, H¹(A))

Let A/ℚ be an abelian surface and p a prime with ρ_(A,p) absolutely irreducible. Suppose ρ_(A,p) ≅ ρ_(π,p) for a cuspidal automorphic representation π of GSp₄(𝔸_ℚ) of weight 2 (Definition 1.8.16) with central character |·|², ordinary at p, with ρ_(π,p) as in Theorem 1.8.17. Then π is of general type; let Π be its transfer to GL₄ (§1.8.22). Then (1) the compatible system (ρ_(A,ℓ))_ℓ is automorphic for Π (§0.3); (2) for every finite place v ≠ p, WD(ρ_(A,p)|_(G_(ℚ_v)))^(F-ss) ≅ rec(Π_v ⊗ |det|^(−3/2)), and the local factors at all finite places (p included) and the archimedean factor of Π ⊗ |det|^(−3/2) are those of H¹(A), so L(s, H¹(A)) = L(s, Π ⊗ |det|^(−3/2)) and A is modular (§0.1) with r = 1; (3) L(s, H¹(A)) extends to an entire function and satisfies the expected functional equation, which in standard form reads Λ(s) = ±Λ(2 − s) for Λ(s) = N^(s/2) Γ_C(s)² L(s, H¹(A)), N the conductor of A. (BCGP25 Remark 1.8.26, §1.8.24, p. 16, line 758; BCGP25 Theorem A, §1.1, pp. 2–3, line 100; BCGP25 Remark 1.8.20, §1.8.12, p. 14, line 679; BCGP25 §1.8.22, p. 15, line 704.)

Use NR2.5 attachment, the pure monodromy upgrade NR2.6 and the forward singular spin-transfer contract. Compare all compatible-system factors by the all-place surface-comparison contract, including a ramified attaching prime, and use AL.2 for the analytic conclusion. Since Π⊗|det|⁻¹ is unitary cuspidal, its standard variable is shifted by 1/2 to the motivic variable. The archimedean parameter gives Γ_ℂ(s)² and the polarization gives w²=1.

**Checks.**

- For a GL₄ witness the normalization exponent is (1−4)/2=−3/2; for each elliptic GL₂ constituent it is −1/2.
- The involution s↦2−s sends 0 to 2, and fixes 1; an unshifted standard variable would instead centre at 1/2.
- The elliptic product has a reducible rank-four system and two constituents; the absolute-irreducibility hypothesis excludes a false cuspidal-transfer conclusion.

The root number is ±1 because H¹(A) is self-dual up to the twist ε⁻¹. (BCGP25 Remark 1.8.26, §1.8.24, p. 16, line 758; BCGP25 Theorem A, §1.1, pp. 2–3, line 100; BCGP25 Remark 1.8.20, §1.8.12, p. 14, line 679; BCGP25 §1.8.22, p. 15, line 704.)

*Needs:* GSp4NonregularModularityLifting NR2.5; EndoscopicTransferAndUnitaryTraceComparison §11.1; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10; FaltingsFinitenessAndIsogenyTheorems R28.4; AutomorphicLFunctionsAndLocalFactors AL.2, Global Godement–Jacquet theory; AutomorphicLFunctionsAndLocalFactors AL.2, Centered entire functions and paired products; AutomorphicFormsOnReductiveGroups §§2.3–2.7; GSp4NonregularModularityLifting NR2.5–NR2.6; ModularityAndLanglandsExtensions §3.26; §0.1.

### Examples

An elliptic product has local denominator (1−t₁T+pT²)(1−t₂T+pT²), and a repeated factor fails distinguishedness without failing modularity. The trace-one two-factor witness in Conventions fixes the Frobenius direction in both comparisons.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use the abelian-scheme, Néron compatible-system and local-factor suppliers before the modularity comparison.

## Layer 1: Mod-3 images and Frobenius classes at 2

### 1.1 The ten outer conjugacy classes of PGSp₄(𝔽₃) and how to separate them

PGSp₄(𝔽₃) ∖ PSp₄(𝔽₃) is the union of ten PGSp₄(𝔽₃)-conjugacy classes, with sizes and characteristic polynomials of lifts to GSp₄(𝔽₃) (each up to x ↦ −x): 2C, x⁴ + 2x² + 1, 36; 2D, x⁴ + x² + 1, 540; 4C, x⁴ ± x³ + 2x² ∓ x + 1, 540; 4D, x⁴ + 1, 1620; 6G, x⁴ + 2x² + 1, 1440; 6H, x⁴ + 2x² + 1, 1440; 6I, x⁴ + x² + 1, 4320; 8A, x⁴ ± x³ + x² ∓ x + 1, 6480; 10A, x⁴ ± x³ ∓ x + 1, 5184; 12C, x⁴ ± x³ + 2x² ∓ x + 1, 4320 (the sizes add up to |PSp₄(𝔽₃)| = 25920). There are nine distinct characteristic polynomials. A class is determined by its cycle types in the permutation actions on the 40 points of (𝔽₃⁴ ∖ 0)/{±1} and on the 27 cosets of the maximal subgroup 2⁴:S₅; the 40-point action alone separates all classes except 4C from 4D and 6G from 6H. For a lift g̃ of g: g̃² is independent of the lift; g̃² = −I for 2C and g̃² = I for 2D, and g̃⁸ = 1 exactly for 4C among {4C, 12C}, while dim ker(g̃⁸ − 1) = 2 for 6G, 6H, 6I and 12C. (BCGP25 Lemma 9.1.3 and the table after it, §9.1, pp. 187–188, line 8646; BCGP25 Proof of Lemma 9.1.6, item (2) and its table, pp. 189–190, line 8746.)

Prove the class partition and its permutation-character comparisons inside the finite group GSp₄(𝔽₃). Use the two actions together when the 40-point action agrees. Keep the lift-square and fixed-space statements distinct from characteristic-polynomial equality.

| Projective class | Lift characteristic polynomial over 𝔽₃ | Size |
| --- | --- | --- |
| 2C | X⁴+2X²+1 | 36 |
| 2D | X⁴+X²+1 | 540 |
| 4C | X⁴±X³+2X²∓X+1 | 540 |
| 4D | X⁴+1 | 1620 |
| 6G | X⁴+2X²+1 | 1440 |
| 6H | X⁴+2X²+1 | 1440 |
| 6I | X⁴+X²+1 | 4320 |
| 8A | X⁴±X³+X²∓X+1 | 6480 |
| 10A | X⁴±X³∓X+1 | 5184 |
| 12C | X⁴±X³+2X²∓X+1 | 4320 |

There are nine distinct lift polynomials. For 4C/4D the 40-point cycle type is 4¹⁰; the 27-point types are 1·2³·4⁵ and 1⁵·2·4⁵. For 6G/6H the 40-point type is 2²·6⁶; the 27-point types are 1³·2³·3⁴·6 and 3⁵·6². Exponents denote multiplicities of cycles. These pairs of cycle types determine the classes, including where the quartic does not (BCGP25 Lemma 9.1.3, pp.187–188, lines 8646–8675).

**Checks.**

- The ten projective class sizes add to 25920, half the order 51840 of PGSp₄(𝔽₃).
- A lift of 2C squares to −I and has polynomial (X²+1)²; a lift of 2D squares to I and has polynomial (X²−1)². Reversing the two gives the wrong minimal polynomial.
- For the common class pairs 4C/4D and 6G/6H the 40-point cycle types agree, but the 27-point actions have respectively 1 versus 5, and 3 versus 0, fixed points.

The sizes sum to 25920. x⁴ − x² + 1 ≡ x⁴ + 2x² + 1 and (x² − 1)² ≡ x⁴ + x² + 1 over 𝔽₃. (BCGP25 Lemma 9.1.3 and the table after it, §9.1, pp. 187–188, line 8646; BCGP25 Proof of Lemma 9.1.6, item (2) and its table, pp. 189–190, line 8746.)

*Needs:* Mathlib `Matrix.symplecticGroup`; PolynomialGaloisGroups Layer 4; ArithmeticGaloisRepresentations §7.3.

### 1.2 The projective Frobenius class of an unramified mod-3 representation at 2

Let ρ̄ : G_ℚ₂ → GSp₄(𝔽₃) be unramified with similitude ε̄⁻¹. Then ν(ρ̄(Frob₂)) = −1, so the image g of ρ̄(Frob₂) in PGSp₄(𝔽₃) = GSp₄(𝔽₃)/{±1} lies in the non-trivial coset PGSp₄(𝔽₃) ∖ PSp₄(𝔽₃). The projective Frobenius class of ρ̄ is the PGSp₄(𝔽₃)-conjugacy class ⟨g⟩. It is one of the ten classes 2C, 2D, 4C, 4D, 6G, 6H, 6I, 8A, 10A, 12C (ATLAS names: the number is the order of g) of §1.1, it determines ρ̄ up to isomorphism and unramified quadratic twist, and conversely every such class arises. For an abelian surface B over ℚ₂ with ρ̄_(B,3) unramified it is written ⟨ρ̄_(B,3)(Frob₂)⟩; since ρ̄_(B,3) and the representation on B[3] are dual up to twist, their projective classes agree (Remark 9.1.1). (BCGP25 §9.1 and Lemma 9.1.3, pp. 187–188, line 8625; BCGP25 §9.2, before Lemma 9.2.2, p. 192, line 8872; BCGP25 Remark 9.1.1, p. 187, line 8630.)

The multiplier at geometric Frobenius is −1. Lift projective conjugation to GSp₄(𝔽₃); two lifts differ by the unique nontrivial scalar −1, hence by the unramified quadratic character. Conversely every outer lift defines an unramified representation. Duality uses the symplectic pairing, so it becomes the same projective representation.

The comparison and construction API consists of the following facts.

- The class ⟨ρ̄(Frob₂)⟩ in the set of conjugacy classes of PGSp₄(𝔽₃) ∖ PSp₄(𝔽₃).
- The class of ρ̄ ⊗ χ, χ unramified quadratic, equals the class of ρ̄.
- Two unramified ρ̄ with similitude ε̄⁻¹ have the same class if and only if they are isomorphic up to unramified quadratic twist.
- The characteristic polynomial of a lift, up to x ↦ −x, is the function of the class listed in §1.1.
- The class is 4C or 12C if and only if the characteristic polynomial of ρ̄(Frob₂) is (x² + x + 2)² or (x² − x + 2)².
- The classes of ρ̄ and of its dual (the action on B[3]) coincide.

**Checks.**

- For C₁ : y² + (x³ + 1)y = x² + x the class of ρ̄_(Jac C₁,3)(Frob₂) is 10A.
- The characteristic polynomial x⁴ + 2x² + 1 does not determine the class: it is shared by 2C, 6G and 6H.
- No class is trivial: ρ̄(Frob₂) has similitude −1, while the identity and −1 have similitude 1.
- A lift with characteristic polynomial (x² + x + 2)² = x⁴ + 2x³ + 2x² + x + 1 over 𝔽₃ has class 4C or 12C, and conversely.
- Over 𝔽₃, (X²+X+2)²=X⁴+2X³+2X²+X+1, whereas the opposite twist reverses the odd coefficients.
- The polynomial X⁴+2X²+1 occurs in 2C,6G,6H, so a polynomial-only class definition fails injectivity.
- The identity and −I have multiplier 1, whereas the required multiplier at 2 is −1; neither is an outer class.

The curves C₁, C₂, C₃ of §4.3 have classes 10A, 6I and 6H. ⟨g⟩ ∈ {4C, 12C} exactly when the characteristic polynomial of a lift is (x² ± x + 2)². (BCGP25 §9.1 and Lemma 9.1.3, pp. 187–188, line 8625; BCGP25 §9.2, before Lemma 9.2.2, p. 192, line 8872; BCGP25 Remark 9.1.1, p. 187, line 8630.)

*Needs:* §1.1; Mathlib `Matrix.symplecticGroup`; AbelianSchemesAndArithmeticModuli A5.7; NeronModelsAndSemistableAbelianVarieties §5.0b.

### 1.3 Regular semisimple elements of GSp₄(𝔽₃)

An element g ∈ GSp₄(𝔽₃) is regular semisimple if it has four distinct eigenvalues in F̄₃. Exactly three conjugacy classes of regular semisimple elements have ν(g) = 1: the class of elements of order 5, the class of elements of order 10, and the class of elements of order 8 lying in Sp₄(𝔽₃). Exactly five have ν(g) = −1: the two classes of elements of order 20, and three of the five classes of elements of order 8, namely those whose images in PGSp₄(𝔽₃) lie in 4D or 8A (not 4C). (BCGP25 Lemma 6.4.1, §6.4, p. 149, line 6750.)

Classify separable characteristic polynomials compatible with the multiplier and use the projective class partition. The repeated quadratic in class 4C excludes those order-eight lifts; order alone is insufficient.

**Checks.**

- An order-five symplectic element has polynomial X⁴+X³+X²+X+1, whose derivative has gcd 1 with it over 𝔽₃.
- A lift over 4C has a squared irreducible quadratic, so four distinct eigenvalues fail despite its order eight.
- The multiplier-one list has 3 classes and the multiplier-minus-one list has 5; projectivizing the latter cannot land in PSp₄.

An element of order 5 in Sp₄(𝔽₃) has characteristic polynomial x⁴ + x³ + x² + x + 1, irreducible over 𝔽₃, hence four distinct eigenvalues. (BCGP25 Lemma 6.4.1, §6.4, p. 149, line 6750.)

*Needs:* §1.1; Mathlib `Matrix.symplecticGroup`; Mathlib `Matrix.charpoly`.

### 1.4 The fifteen allowed mod-3 images

Let A/ℚ be an abelian surface with a polarization of degree prime to 3 and good reduction at 3, ρ̄ = ρ̄_(A,3) : G_ℚ → GSp₄(𝔽₃), Γ′ = ρ̄(G_ℚ) and Γ = ρ̄(G_(ℚ(ζ₃))) = Γ′ ∩ Sp₄(𝔽₃). Consider (1) ρ̄ is GSp₄-reasonable (WHITMORE22 Definition 3.19, pp.23–24, line 1011); (2) ρ̄ is tidy (BCGP21 Definition 7.5.11); (3) Γ contains a regular semisimple element; (4) Γ′ ∖ Γ contains a regular semisimple element. Among the 25 conjugacy classes of subgroups Γ′ ⊂ GSp₄(𝔽₃) with ν(Γ′) ≠ 1 and Γ′ ∩ Sp₄(𝔽₃) absolutely irreducible (Table 6.4.4), all four conditions hold exactly for the fifteen with LMFDB labels 3.1620.1, 3.1620.5, 3.1620.10, 3.1296.1, 3.810.2, 3.810.6, 3.540.1, 3.405.1, 3.270.1, 3.216.1, 3.135.1, 3.135.2, 3.45.1, 3.27.1 and 1.1.1. In particular they hold when ρ̄ is surjective (label 1.1.1). The ten others each fail exactly one condition: (1) fails for 3.540.2, 3.540.7, 3.216.2, 3.36.1; (2) fails for 3.810.1, 3.810.5, 3.162.1; (3) fails for 3.1620.2, 3.540.3, 3.540.5. Every group in the table has Γ absolutely irreducible. (BCGP25 Lemma 6.4.3 and Table 6.4.4, §6.4, pp. 149–151, line 6778; BCGP25 Lemma 6.4.2, §6.4, p. 149, line 6764.)

Apply the cyclotomic-image stability theorem at good reduction prime 3, then prove the four image predicates for the embedded subgroup pairs (Γ′,Γ). The classification is by conjugacy in GSp₄, not merely by abstract isomorphism.

**Checks.**

- The full group has order 103680, Γ has order 51840 and index 2; taking Γ=Γ′ would lose the cyclotomic restriction.
- The labels 3.1620.1 and 3.1620.2 both have |Γ′|=64, but their order-32 symplectic subgroups have distinct types and the second lacks a regular element.
- The table has 25 classes, split into 15 permitted and 10 rejected; the rejected counts 4+3+3=10 distinguish reasonableness, tidiness and the symplectic regular-element test.

GSp₄(𝔽₃) itself (label 1.1.1, order 103680) satisfies all four conditions. 3.1620.2 fails (3): it has the same abstract Γ′ as the allowed 3.1620.1 and is told apart by Γ. (BCGP25 Lemma 6.4.3 and Table 6.4.4, §6.4, pp. 149–151, line 6778; BCGP25 Lemma 6.4.2, §6.4, p. 149, line 6764.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6, cyclotomic-image lemma; ArithmeticGaloisRepresentations §7.11; §1.3; ArithmeticGaloisRepresentations §7.9 (reasonableness contract); Mathlib `Matrix.symplecticGroup`.

### 1.5 Sp₄(𝔽₃) is not GL₄-adequate

Let G = Sp₄(𝔽₃) with its natural representation ρ̄ : G ↪ GL₄(𝔽₃). Then G is not adequate in Thorne's sense (ArithmeticGaloisRepresentations §7.9 (adequacy)): H¹(G, ∧²ρ̄) ≠ 0, hence H¹(G, gl₄) ≠ 0. A non-zero class is given by the reduction modulo the ideal (3) = ((1 − ζ₃)²) of either of the two 4-dimensional complex representations V, V^σ of G, which are defined over Z[ζ₃] and Galois conjugate, with V^∨ ≅ V^σ: the reduction modulo 1 − ζ₃ is ρ̄, and the reduction modulo 3 is a deformation to SL₄(𝔽₃[ε]/ε²) that is not symplectic. Symplectic adequacy needs only H¹(G, sp₄) = H¹(G, Sym²ρ̄) = 0, which is why the 3-adic lifting uses GSp₄ rather than U(4). (BCGP25 Remark 6.4.5, §6.4, p. 151, line 6838.)

Use the reduction of the two conjugate complex four-dimensional representations modulo (1−ζ₃)² to obtain a nontrivial deformation over 𝔽₃[ε]/(ε²). It gives a nonzero H¹ class in the exterior-square summand of the adjoint module, rather than the symplectic Lie algebra.

**Checks.**

- The dual-number ring has ε≠0 and ε²=0; the nonzero first-order deformation class disappears after quotienting by ε.
- For rank four in characteristic 3, End has dimension 16 and splits into dimensions 10+6; the obstruction is in the exterior-square dimension-six summand.
- The zero cohomology class represents the constant lift; the constructed class is nonzero in H¹, so absolute irreducibility alone cannot imply adequacy.
- With ζ₃²+ζ₃+1=0, (1−ζ₃)²=−3ζ₃, which is not the element 3. The unit −ζ₃ gives the same principal ideal, so reduction modulo (3) and modulo ((1−ζ₃)²) agree.

*Needs:* ArithmeticGaloisRepresentations §7.9; Mathlib `groupCohomology.H1`; Mathlib `Matrix.symplecticGroup`.

### Examples

The three good dyadic seeds C₁,C₂,C₃ have classes 10A,6I,6H. The two repeated quadratics excluded by Theorem A have opposite odd coefficients after expansion, and a single quartic cannot distinguish 2C from 6G or 6H.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layer 0 and the generic image predicates; this layer does not consume any modularity conclusion.

## Layer 2: The explicit symplectic permutation dictionary and A₅

### 2.1 Explicit basis and the two S₅ embeddings

Write U=𝔽₂⁶, U⁰ for its sum-zero subspace, L for the span of the all-ones vector and W=U⁰/L. Fix the even-subset realization and exceptional isomorphism supplied by AbelianSchemesAndArithmeticModuli A3.12, and normalize it in the ordered basis e₁=r₁−r₂, e₂=r₃−r₄, e₃=r₃−r₅, e₄=r₁−r₆ of U⁰/L. Prove that the images of (12)(34)(56), (12) and (12345) are respectively the matrices (I₂,I₂;0,I₂), I₄+E₁₄ and ((0,0,1,1),(1,1,0,0),(1,1,1,0),(1,0,1,1)). Identify S₅(b) with a point stabilizer, its outer twist S₅(a) with the transitive embedding, and A₅(b) with the even permutations in that stabilizer. Prove the resulting generator, transvection and outer-automorphism comparisons. In the displayed basis the two matrices on BCGP25 p.203 represent the inverse permutations (12)(354) and (164352); their orders and characteristic polynomials agree with those of the labeled permutations. (BCGP25 §8.1, pp. 180–181, line 8274; BCGP25 Lemma 8.1.3 and proof, §8.1, p. 181, line 8322; BCGP25 Proof of Lemma 9.3.7, p. 203, line 9441.)

Transport the supplied even-subset action into the specified basis and compare the form with J. The outer automorphism swaps the two S₅ classes. The existence of the abstract exceptional isomorphism is a supplier input; the target here is its matrix normalization and subgroup dictionary.

The comparison and construction API consists of the following facts.

- The fixed supplier isomorphism in this basis takes the three stated generator values; its source is S₆ and its target is the symplectic group of W.
- The values of ι on (12)(34)(56), (12) and (12345) in the basis e₁, …, e₄.
- ι sends transpositions to transvections (rank(A − 1) = 1), and double and triple transpositions to the two classes of involutions with rank(A − 1) = 2 (§2.3).
- S₅(a) and S₅(b) are not conjugate in S₆; S₅(a) is transitive on the six points.
- The outer automorphism exchanges S₅(a) with S₅(b), transpositions with triple transpositions, and fixes the class of double transpositions.
- The basis agrees with the Siegel-parabolic convention consumed from NeronModelsAndSemistableAbelianVarieties §6.13.

**Checks.**

- The centralizer of a triple transposition has order 48 and is isomorphic to S₄ × S₂; its point-stabilizer intersection has order 8. The centralizer of a transposition also has order 48 but is the Klingen parabolic, so the order alone does not determine the parabolic.
- The three displayed matrices M satisfy MᵀJM = J over 𝔽₂, with orders 2, 2 and 5.
- ι((12)(345)) has order 6 and ι((125346)) satisfies (M² + M + 1)² = 0, so the two classes of elements of order 6 are told apart by their characteristic polynomials.
- The full subgroup S₅(a) acts transitively on {1, …, 6}, so a curve whose Galois image equals a conjugate of S₅(a) has no rational Weierstrass point. Containment in S₅(a) alone does not imply this: the trivial subgroup fixes all six points.
- For X : y² = f(x) with deg f = 5 over a field of characteristic 0, the point at infinity is a rational Weierstrass point and ρ̄_(Jac X,2)(G_K) lies in S₅(b).
- |S₆| = |Sp₄(𝔽₂)| = 720, so the injective homomorphism ι is bijective.
- The three matrices preserve J and have orders 2,2,5. The two involutions have ranks 2 and 1 after subtracting I.
- For (12)(345), the polynomial is (X+1)²(X²+X+1) over 𝔽₂; for a six-cycle it is (X²+X+1)², although both orders are six.
- Full S₅(a) has no fixed letter, while the trivial subgroup has six; containment in the outer S₅ alone is not a nonexistence criterion.

The three displayed matrices satisfy MᵀJM = J over 𝔽₂ and have orders 2, 2 and 5. ι((12)(345)) = [[1,0,0,1],[0,1,1,0],[0,1,0,0],[0,0,0,1]] has order 6, and ι((125346)) = [[0,1,0,1],[1,0,1,0],[0,1,0,0],[1,0,0,0]] satisfies (M² + M + 1)² = 0. The matrices displayed in BCGP25 on p.203 are ι((12)(354)) and ι((164352)), the images of the inverse permutations; the conjugacy classes are the same. (BCGP25 §8.1, pp. 180–181, line 8274; BCGP25 Lemma 8.1.3 and proof, §8.1, p. 181, line 8322; BCGP25 Proof of Lemma 9.3.7, p. 203, line 9441.)

*Needs:* AbelianSchemesAndArithmeticModuli A3.12; Mathlib `Equiv.Perm`; Mathlib `alternatingGroup`; Mathlib `MulAction.stabilizer`; Mathlib `Matrix.symplecticGroup`; AlgebraicCurves Layers 5, 10 and 11; ArithmeticGaloisRepresentations §7.3.

### 2.2 Rational Weierstrass points and the subgroup S₅(b)

Let X be a smooth projective genus-two curve over a field K of characteristic different from 2 and A = Jac(X). Then X has a K-rational Weierstrass point if and only if ρ̄_(A,2)(G_K) ⊂ GSp₄(𝔽₂) is contained in a conjugate of ι(S₅(b)). (BCGP25 §8.1, p. 180, line 8299.)

Apply the supplied equivariant six-point dictionary: a Galois-fixed branch point is exactly containment of the image in a conjugate of the point stabilizer. Full S₅(a) is transitive, whereas a smaller subgroup of S₅(a) need not be.

**Checks.**

- A separable quintic adds the rational point at infinity to its five roots, so the six-point action fixes at least one letter.
- The trivial six-point action has six fixed letters and fifteen rational nonzero 2-torsion points.
- The full transitive S₅(a) action has zero fixed letters, unlike the standard S₅(b) action with one.

y² = f(x) with f quintic has image in S₅(b); y² = f(x) with f an irreducible sextic does not. (BCGP25 §8.1, p. 180, line 8299.)

*Needs:* §2.1; AbelianSchemesAndArithmeticModuli A3.12; AlgebraicCurves Layers 5, 10 and 11; PolynomialGaloisGroups Layer 0.

### 2.3 Strongly residually odd involutions in Sp₄(𝔽₂)

Let k be a finite field of characteristic 2 and A ∈ Sp₄(k) an involution, r = rank(A − 1) ∈ {0, 1, 2}. Then the polarized pair attached to an absolutely irreducible polarized restriction with symplectic extension ψ(c_v)=A as in BCGP25 Corollary 5.1.6 is strongly residually odd at v (PotentialAutomorphyInfrastructurePartII PL.4, Strong residual oddness at a real place) if and only if A·J has a non-zero diagonal entry, if and only if either r = 1, or r = 2 and A is conjugate to [[1,0,0,1],[0,1,1,0],[0,0,1,0],[0,0,0,1]] (conjugate to J). There are four classes of involutions (counting 1): two odd ones, with representatives [[1,0,0,1],[0,1,0,0],[0,0,1,0],[0,0,0,1]] and [[1,0,0,1],[0,1,1,0],[0,0,1,0],[0,0,0,1]], and two non-odd ones, 1 and [[1,1,0,0],[0,1,0,0],[0,0,1,1],[0,0,0,1]]. Under ι these are the images of (12), (12)(34), the identity and (12)(35)(46): transpositions and double transpositions are strongly odd, triple transpositions are not. In particular every non-trivial involution of A₅(b) (cycle type (**)(**)) is strongly odd, and, for an absolutely irreducible ρ̄ : G_(F⁺) → GSp₄(𝔽₂) with image A₅(b) and ρ̄(c_v) ≠ 1, the pair (ρ̄|_(G_F), 1) is strongly residually odd at v (Lemma 8.2.4). (BCGP25 Remark 5.2.8, §5.2.4, p. 119, line 5358; BCGP25 Lemma 5.2.7 and §5.2.4, pp. 118–119, line 5348; BCGP25 Lemma 8.2.4 and proof, pp. 182–183, line 8407.)

Specialize the supplied general-rank symmetric-form criterion to dimension four and evaluate the diagonal of gJ for each involution type, retaining its equivalence with strong residual oddness for the associated polarized pair.

**Checks.**

- For g=I, rank(g−I)=0 and diag(gJ)=(0,0,0,0), so strong oddness fails.
- For g=I+E₁₄, rank(g−I)=1 and diag(gJ)=(1,0,0,0), so the transposition class is strongly odd.
- For g=I+E₁₄+E₂₃ the rank is 2 and diag(gJ)=(1,1,0,0); for the triple-transposition matrix (I,I;0,I) the rank is 2 but all diagonal entries of gJ are zero.

The diagonal of ι((12)(35)(46))·J vanishes; the diagonals of ι((12))·J and ι((12)(34))·J do not. (BCGP25 Remark 5.2.8, §5.2.4, p. 119, line 5358; BCGP25 Lemma 5.2.7 and §5.2.4, pp. 118–119, line 5348; BCGP25 Lemma 8.2.4 and proof, pp. 182–183, line 8407.)

*Needs:* PotentialAutomorphyInfrastructurePartII PL.4, Strong residual oddness at a real place; §2.1; Mathlib `Matrix.symplecticGroup`; Mathlib `Matrix.IsSymm`.

### 2.4 Modular representations of A₅ in characteristic 2

Let k be a field of characteristic 2 containing 𝔽₄. The simple k[A₅]-modules are: the trivial module k; U, the tautological representation for a chosen A₅ ≅ SL₂(𝔽₄); its Frobenius conjugate U^σ; and V = U ⊗ U^σ ≅ Sym³U, of dimension 4, defined over 𝔽₂, the reduction of the unique 4-dimensional irreducible complex representation. All are absolutely irreducible (so every absolutely irreducible representation over 𝔽̄₂ is defined over 𝔽₄). The Brauer characters on the classes (12345), (13524), (123) are: k: 1, 1, 1; U: ζ + ζ⁻¹, ζ² + ζ⁻², −1; U^σ: ζ² + ζ⁻², ζ + ζ⁻¹, −1; V: −1, −1, 1 (ζ a primitive fifth root of unity). There are two blocks, the principal block and a block of defect zero containing only V; V is a projective k[A₅]-module; elements of order 5 act on V with four distinct eigenvalues. For A₅(b) ⊂ S₆ acting on the six-letter even-subset quotient W, W ⊗ 𝔽̄₂ ≅ V (Lemma 8.1.2): the permutation Brauer character 6, 1, 3 minus twice the trivial character is 4, −1, 1. (BCGP25 Lemma 8.2.1 and proof, §8.2, pp. 181–182, line 8356; BCGP25 Lemma 8.1.2 and the Brauer character computation before it, §8.1, pp. 180–181, line 8314; BCGP25 Proof of Lemma 9.3.7, p. 203, line 9441.)

Use the splitting-field Brauer-character comparison and the projective-cover Hom pairing. The four-dimensional constituent is the defect-zero module; its character also identifies the scalar extension of the even-subset representation. The order-three spectrum distinguishes the outer embedding.

**Checks.**

- The simple dimensions are 1,2,2,4; V has dimension 4, the 2-part of 60, whereas the two natural modules have dimension 2.
- On a three-cycle, V has Brauer trace 1+1+ω+ω⁻¹=1, while U⊕U^σ has trace 2ω+2ω⁻¹=−2.
- On a five-cycle, the V trace is −1 and its four eigenvalues are the four nonidentity fifth roots, all distinct; the natural trace satisfies t²+t−1=0 in the lifted character field.

The trace of (12345) on U is ζ + ζ⁻¹, a root of x² + x − 1; on V it is −1. The order-3 elements act on V with eigenvalues 1, 1, ω, ω⁻¹ (Brauer character 1), not ω, ω, ω⁻¹, ω⁻¹ (which would give −2); this is how A₅(b) differs from A₅(a), whose 4-dimensional module is U ⊕ U^σ. (BCGP25 Lemma 8.2.1 and proof, §8.2, pp. 181–182, line 8356; BCGP25 Lemma 8.1.2 and the Brauer character computation before it, §8.1, pp. 180–181, line 8314; BCGP25 Proof of Lemma 9.3.7, p. 203, line 9441.)

*Needs:* Mathlib `alternatingGroup`; GL2AutomorphicRepresentationsAndTransfer R17.5.11; Mathlib `Representation`; §2.1.

### 2.5 Near adequacy of A₅(b) and the failure of adequacy

Let k be any field of characteristic 2 and V the scalar extension to k of the four-dimensional even-subset A₅(b)-module, viewed as A₅ ⊂ GL₄(k). Then (1) the socle of V ⊗ V ≅ End(V) is k ⊕ V; (2) the semisimple elements of A₅ span End(V), i.e. A₅ is weakly adequate (ArithmeticGaloisRepresentations §7.9 (weak adequacy)); (3) H¹(A₅, k) = 0 and H^n(A₅, ad V) = 0 for all n > 0. Hence A₅ ⊂ GL(V) is nearly adequate in the sense of BCGP25 Definition 5.3.3 (weakly adequate, H¹(H, k) = 0, H¹(H, ad) = 0). It is not adequate in Thorne's sense (THORNE17 Definition 2.20, cited by locator alone): H¹(A₅, ad/k) ≅ H²(A₅, k) ≅ k because the Schur multiplier of A₅ is ℤ/2ℤ. (BCGP25 Lemma 8.2.2 and proof, §8.2, p. 182, line 8391; BCGP25 Remark 8.2.3, p. 182, line 8404; BCGP25 Lemmas 8.2.8 and 8.2.9 with proofs, pp. 183–184, line 8463; BCGP25 Definition 5.3.3 and Remark 5.3.4, §5.3, p. 120, line 5426.)

Use the supplied PL.4/relaxed-adequacy predicate: after a finite coefficient extension containing the eigenvalues, its trace condition is equivalent to weak adequacy by ArithmeticGaloisRepresentations §7.9. Finite-group cohomology and the semisimple span commute with coefficient extension, so this identifies relaxed adequacy with BCGP25 near adequacy over the original characteristic-two field. The adequate implication is supplied by PL.4; the remaining work here is the A₅(b) calculation and its failure of the stronger quotient-cohomology condition.

The assertions over any characteristic-two field are scalar extensions of the fixed 𝔽₂ module and its finite cochain complexes. Use the two characteristic-two exact sequences for tensor, exterior and symmetric squares. Projectivity of V makes End(V) projective. The socle is k⊕V; odd-order elements span the endomorphisms. The exact sequence k→ad→ad/k and the integral A₅ Schur multiplier identify the remaining one-dimensional H¹ obstruction.

**Checks.**

- For V, dim End(V)=16 and dim soc End(V)=1+4=5; replacing the socle by the whole module would be false.
- The relevant values are H¹(A₅,k)=0 and H¹(A₅,ad)=0 but dim H¹(A₅,ad/k)=1; near adequacy must not erase the last obstruction.
- For H=1 on k², the semisimple span is k·I of dimension 1, less than dim End(k²)=4; the two H¹ groups vanish but both near and relaxed adequacy fail the span/trace condition.
- Extending the fixed module from 𝔽₂ to 𝔽₁₆ supplies all order-3 and order-5 eigenvalues; the semisimple span still has dimension 16 and the H¹ dimensions for k, ad and ad/k remain 0, 0 and 1. Coefficient extension cannot remove the quotient obstruction.
- The integral Schur multiplier C₂ yields Hom(C₂,k⁺) of dimension 1 in characteristic 2, whereas Hom(C₂,kˣ) is trivial over a characteristic-two algebraically closed field; the two coefficient conventions cannot be interchanged.

*Needs:* §2.4; PotentialAutomorphyInfrastructurePartII PL.4, Adequacy relaxed to the vanishing of H¹(H, ad) (PL.4/relaxed-adequacy); ArithmeticGaloisRepresentations §7.9 (weak adequacy and trace/spanning comparison); Mathlib `groupCohomology.H1`; Tau Ceti `TauCeti.schurMultiplier`.

### 2.6 The residual hypotheses for image A₅(b) after CM base change

Let F⁺ be totally real and ρ̄ : G_(F⁺) → GSp₄(𝔽₂) with image A₅(b), and suppose some real place v has ρ̄(c_v) ≠ 1. Then for every imaginary CM quadratic extension F/F⁺, ρ̄(G_F) = A₅(b), the polarized pair (ρ̄|_(G_F), 1) is nearly adequate and strongly residually odd at v, and ρ̄(G_F) contains a regular semisimple element (of order 5). (BCGP25 Proposition 8.2.5 and proof, §8.2, p. 183, line 8443.)

A₅ has no index-two quotient, so every CM quadratic restriction retains its image. Combine the near-adequacy result, the order-five regular element and the nonidentity complex-conjugation criterion.

**Checks.**

- An index-at-most-two subgroup of A₅ has order at least 30; perfectness excludes an index-two quotient, leaving order 60.
- An order-five element has four distinct eigenvalues on V; an identity element has four equal eigenvalues.
- A nonidentity involution in A₅(b) is a double transposition with nonzero diagonal test; identity complex conjugation gives the zero diagonal and fails.

These are hypotheses (A2)–(A4) of Proposition 7.5.10 for the 2-adic application. (BCGP25 Proposition 8.2.5 and proof, §8.2, p. 183, line 8443.)

*Needs:* §2.4; §2.5; §2.3.

### Examples

The transposition, double-transposition and triple-transposition matrices have ranks 1,2,2 after subtracting I. Their diagonal tests are nonzero, nonzero and zero. The order-three spectrum on the four-dimensional A₅(b) module is 1,1,ω,ω⁻¹ and has lifted trace 1.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layer 0, the even-subset supplier and modular-character theory; the ordinary residual-image consequence is consumed from NeronModelsAndSemistableAbelianVarieties §6.13.

## Layer 3: Ordinary modularity at 2

### 3.1 Residual automorphy of mod-2 representations with image A₅(b) or S₅(b)

Let F⁺ be totally real and ρ̄ : G_(F⁺) → GSp₄(𝔽₂) ≅ S₆ continuous with (1) image S₅(b) or A₅(b), and (2) the image of every complex conjugation of order 2 and in A₅(b). Then there are a solvable extension of totally real fields E⁺/F⁺ and an imaginary CM quadratic extension E/E⁺ such that ρ̄(G_E) = ρ̄(G_(E⁺)) = A₅(b), and an ordinary RACSDC automorphic representation π of GL₄(A_E) with r̄_(π,2) ≅ ρ̄|_(G_E). (BCGP25 Lemma 8.3.1 and proof, §8.3, pp. 184–185, line 8508.)

Pass to the totally real sign-kernel extension E⁺ and further solvable totally real extensions trivializing the dyadic projective local actions. Let ϱ̄ : G_(E⁺) → SL₂(𝔽₄) ≅ A₅ be a residual representation with Sym³ϱ̄ ≅ ρ̄ (§2.4); since Sym³ is injective on SL₂(𝔽₄), ϱ̄ is trivial at every place above 2. Lift the projectivization of ϱ̄, composed with the icosahedral embedding of A₅ in PGL₂(ℂ) whose preimage in SL₂(ℂ) has, on its elements of order 5, the values of the Brauer character of ϱ̄, by GL2AutomorphicRepresentationsAndTransfer R17.5.4. Its reduction modulo a prime above 2 is irreducible, and the Brauer-character choice (R17.5.11) makes its projectivization that of ϱ̄. Two irreducible representations with the same projectivization differ by a character, so the reduction is ϱ̄ ⊗ η̄ for a character η̄ of odd order; twist the lift by the Teichmüller lift of η̄⁻¹, so that it reduces to ϱ̄. At each place v above 2 the twisted lift has trivial projective image, so it is a scalar character χ_v with trivial reduction, of 2-power order. A further solvable totally real extension, linearly disjoint from the field of ϱ̄ and with completions above 2 that kill every χ_v (PotentialAutomorphyInfrastructurePartII PL.0, Soluble and cyclic CM extensions with prescribed local behaviour), makes the lift trivial above 2 and keeps the A₅ image. The lift is totally odd by R17.5.4, so odd Artin modularity gives a parallel-weight-one form unramified above 2. Dyadic weight-one Hida change gives a parallel-weight-two GL₂ seed of trivial central character. CM base change and symmetric cube give the ordinary RACSDC GL₄ seed, with matching residual representation and surviving A₅ image.

**Checks.**

- The sign quotient of S₅ has order 2, while that of A₅ is trivial; both residual images become order 60 on the sign-kernel field.
- For a lifted complex conjugation with eigenvalues 1,−1, determinant is −1; a scalar lift would have trivial projective involution and fails the hypothesis.
- Sym³ of a rank-two weight-{0,1} seed has four weights 0,1,2,3 and dimension 4; the original singular surface has weights 0,0,1,1. The seed only matches residually.
- If the reduction of the lift were ϱ̄ ⊗ η̄ with η̄ of order 5, its symmetric cube would be ρ̄ ⊗ η̄³ with η̄³ of order 5, not ρ̄; the Teichmüller twist removes η̄, while a twist of order 3 would be invisible after Sym³. Twisting by a character ramified at a dyadic place keeps the projectivization and the oddness but makes the local component there the ramified twist of an unramified principal series, so the 2-power scalar χ_v must be killed before the weight-one input.

*Needs:* §2.1; §2.4; GL2AutomorphicRepresentationsAndTransfer R17.5.4 and R17.5.11; ModularityAndLanglandsExtensions §1.9; OrdinaryAutomorphicFormsAndModularityLifting §2.11; AutomorphicGaloisRepresentationsPartII AG2.2; ModularityAndLanglandsExtensions §1.11 and Automorphic induction and its cuspidality criterion; ModularityAndLanglandsExtensions §1.13; AutomorphicGaloisRepresentationsPartII AG2.5; ArithmeticGaloisRepresentations §§7.3, 7.6, 7.9–7.11; PotentialAutomorphyInfrastructurePartII PL.0, Soluble and cyclic CM extensions with prescribed local behaviour and Soluble base change and descent of automorphy.

### 3.2 The 2-adic ordinary modularity theorem

Let A/ℚ be an abelian surface such that (1) A₅(b) ⊆ ρ̄_(A,2)(G_ℚ) ⊆ S₅(b) up to conjugacy; (2) the image of complex conjugation has order 2 and lies in A₅(b); (3) A has good ordinary or semistable reduction at 2, and ρ_(A,2)|_(G_ℚ₂) is ordinary and 2-distinguished (so the reduction is semistable ordinary). Then A is modular: there is a cuspidal automorphic representation π of GSp₄(𝔸_ℚ) of weight 2, ordinary at 2, with central character |·|², such that ρ_(π,2) ≅ ρ_(A,2); the compatible system of A is automorphic for its GL₄ transfer, so ρ_(π,p) ≅ ρ_(A,p) at every prime p at which π is ordinary (the compatible system is compared at every ordinary attaching prime), and A is modular in the sense of §0.1. (BCGP25 Theorem 8.3.2 and proof, §8.3, pp. 185–186, line 8546; BCGP25 §8, introduction, pp. 179–180, line 8213; ZARHIN00 Theorem 4.1, p. 5; §3 and Lemma 3.1, pp. 3–4 (arXiv v2 pagination), line 186.)

The residual image hypothesis includes a symplectic framing of H¹ modulo 2; an arbitrary even-degree polarization does not supply it. All classification and NR11 proof premises remain hypotheses.

Apply the residual-image endomorphism adapter and the surface-open-image contract. A finite-extension principal quotient transports the Zariski identity component if needed. The order-five element and Sp₄ Zariski containment give integral enormousness, and the real sign-kernel field ensures that ℚ(i) does not cut down the residual image. Use the full dyadic seed alternative of NR11.2–NR11.6. At every ordinary attaching prime compare by NR2.5 and compatible-system uniqueness; the all-prime system assertion does not posit an undefined nonordinary attachment.

**Checks.**

- A double transposition has order 2 and sign +1, giving a real sign-kernel field; an odd transposition would give sign −1 and fails the conjugation hypothesis.
- The residual order-five element is regular, while the identity is not; Sp₄ Zariski containment remains an independent characteristic-zero input.
- A polarization of type (1,2) has degree 4 and does not give a perfect pairing on A[2]; an explicit symplectic residual realization is required.

*Needs:* §3.1; §2.6; §0.2; §0.3; GSp4NonregularModularityLifting NR11.2–NR11.6; ArithmeticGaloisRepresentations §7.11 (integral-enormity contract); FaltingsFinitenessAndIsogenyTheorems R28.4; FaltingsFinitenessAndIsogenyTheorems R28.4 (surface-open-image contract); NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10; ModularityAndLanglandsExtensions §3.26; AbelianSchemesAndArithmeticModuli A3.11 and A6.34; GSp4NonregularModularityLifting NR2.5–NR2.6; PotentialAutomorphyInfrastructurePartII PL.0, Soluble and cyclic CM extensions with prescribed local behaviour and Soluble base change and descent of automorphy.

### Examples

A residual S₅(b) image with double-transposition complex conjugation becomes A₅(b) over the real sign-kernel field. Its rank-two symmetric-cube seed is regular in characteristic zero; the surface it lifts has repeated Hodge–Tate values. Residual equality, rather than equality of characteristic-zero systems, links them.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layers 0–2, the residual endomorphism and open-image contracts, Artin and Hida inputs, and NR11.2–NR11.6.

## Layer 4: Local geometry at 2

### 4.1 Ordinary Weil polynomials of weight one

For a prime p define an ordinary weight-one Weil quartic by Q(X)=X⁴+aX³+bX²+paX+p² in ℤ[X], with a,b integers, every complex root of absolute value √p, and p not dividing b. Use its comparison with the supplied ordinary Honda–Tate classification: it is precisely the Frobenius polynomial of an ordinary surface over 𝔽_p, with one isogeny class for each polynomial. If Q is irreducible, the surface is simple and its endomorphism algebra over 𝔽_p is the quartic CM field ℚ[X]/(Q); this does not assert geometric simplicity or geometric commutativity of the endomorphism algebra. (BCGP25 Definition 9.2.4, §9.2, p. 193, line 8933; BCGP25 §9.3, before Lemma 9.3.1, p. 199, line 9250.)

The geometric comparisons are the supplied point-count and slope theorems. Invoke the ordinary Honda–Tate specialization for the isogeny-class comparison; for an irreducible polynomial its p-adic division-algebra invariants vanish.

The specialization API records the following consequences of the supplied Weil-polynomial, point-count, slope and Honda–Tate theorems.

- The predicate on (p, a, b): X⁴ + aX³ + bX² + paX + p² has all complex roots of absolute value √p and p ∤ b.
- The reciprocity identity X⁴Q(p/X)=p²Q(X) is in the Laurent-polynomial ring ℤ[X,X⁻¹], or in ℤ[X] after formal denominator cancellation. On field elements its displayed rational expression is asserted only for X≠0.
- Q(1) is the number of 𝔽_p-points of any abelian surface in the isogeny class.
- Exactly two roots, counted with multiplicity, are p-adic units; they are the eigenvalues of Frobenius on the étale part of the p-divisible group.
- Honda–Tate: ordinary Weil quartics correspond bijectively to 𝔽_p-isogeny classes of ordinary abelian surfaces.
- For ordinary elliptic curves E₁, E₂ over 𝔽_p with traces t₁, t₂, Q_(E₁)Q_(E₂) is an ordinary Weil quartic, with b = t₁t₂ + 2p.
- For fixed p there are finitely many, bounded by |a| ≤ 4√p and |b| ≤ 6p.

**Checks.**

- X⁴ − X² + 4 is an ordinary Weil quartic for p = 2: b = −1 is odd and X² = (1 ± √−15)/2 has absolute value 2.
- (X² + 2)² = X⁴ + 4X² + 4 has all roots of absolute value √2 but b = 4 is even: it is a supersingular, not ordinary, Weil quartic.
- The polynomials x⁴ − x² + 1 of Table 9.2.5's second column are reductions mod 3, not Weil polynomials: their constant term is 1, not p².
- There are exactly 16 ordinary Weil quartics for p = 2.
- (X² + X + 3)(X² − 2X + 3), the product for traces −1 and 2 over 𝔽₃, is an ordinary Weil quartic for p = 3.
- For p=2, X⁴−X²+4 has b=−1 odd; its two squared roots have product 4 and complex absolute value 2, so its roots have absolute value √2.
- The polynomial (X²+2)² has b=4 divisible by 2 and is nonordinary despite the same complex root absolute values.
- The zero polynomial and X⁴−X²+1 fail the required constant term p²=4 at p=2, so neither is an ordinary Weil quartic there.
- For Q=X⁴−X²+4 and p=2, at x=1 the reciprocal identity gives Q(2)=16=4Q(1). At x=0 total field division would give 0 on the displayed rational-expression side and 16 on the other, so this evaluation is excluded; the formally cancelled polynomial has constant term 16 on both sides.

Exactly 16 ordinary Weil quartics for p = 2 (§4.2) and 40 for p = 3 (§5.1). (BCGP25 Definition 9.2.4, §9.2, p. 193, line 8933; BCGP25 §9.3, before Lemma 9.3.1, p. 199, line 9250.)

*Needs:* CurvesOverFiniteFields §§4.1, 4.3, 4.6 and 4.11; AbelianVarietiesOverFiniteFields §§1.2 and 6.1–6.3; AbelianSchemesAndArithmeticModuliPartII F3.2; NeronModelsAndSemistableAbelianVarieties §5.0b; Mathlib `Polynomial.aroots`; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10.

### 4.2 The sixteen ordinary Weil quartics at 2 and their classes mod 3 (Table 9.2.5)

There are exactly 16 ordinary Weil quartics for p = 2. Grouped by reduction modulo 3 (up to x ↦ −x), with the projective classes in PGSp₄(𝔽₃) ∖ PSp₄(𝔽₃) admitting a lift with that characteristic polynomial: x⁴ − x² + 4, x⁴ ∓ 3x³ + 5x² ∓ 6x + 4 ↦ x⁴ − x² + 1 (2C, 6G, 6H); x⁴ + x² + 4 ↦ x⁴ + x² + 1 (2D, 6I); (x² ∓ x + 2)², x⁴ ± x³ − x² ± 2x + 4 ↦ (x² ∓ x + 2)² mod 3 (4C, 12C); x⁴ − 3x² + 4, (x² + x + 2)(x² − x + 2) ↦ x⁴ + 1 (4D); x⁴ ± x³ + x² ± 2x + 4 (8A); x⁴ ∓ 2x³ + 3x² ∓ 4x + 4, x⁴ ± x³ + 3x² ± 2x + 4 (10A). If A/ℚ₂ has good ordinary reduction, its Frobenius polynomial is one of these. (BCGP25 §9.2.4 and Table 9.2.5, pp. 193–194, line 8939.)

Prove the finite coefficient classification under the root and ordinarity conditions, then reduce each integer polynomial modulo 3 and compare its possible lift classes. The class column records possibilities from the characteristic polynomial, not a claim that every listed class occurs geometrically in that isogeny class.

**Checks.**

- The row multiplicities are 3+1+4+2+2+4=16; counting both signs independently in a fixed-sign row would overcount.
- For the nonsquare X⁴+X³−X²+2X+4, reduction modulo 3 is a squared quadratic, but reduction modulo 2 is X²(X²+X+1).
- The quartics X⁴−3X²+4 and X⁴+3X²+4 have the identical reduction X⁴+1 modulo 3, yet distinct integer middle coefficients −3 and 3.

*Needs:* §4.1; §1.1.

### 4.3 Three good ordinary local Jacobians at 2 with a rational Weierstrass point

The genus-two curves over ℚ C₁ : y² + (x³ + 1)y = x² + x, C₂ : y² + (x³ + 1)y = −x⁵ + x³ + 2x² + x − 1 and C₃ : y² + (x² + x)y = x⁵ + 2x⁴ + x³ − 16x² − 8x − 1 (conductors 249, 975, 1947) have good ordinary reduction at 2 and a rational Weierstrass point, are 2-distinguished, have Frobenius polynomials at 2 P₁ = x⁴ + 2x³ + 3x² + 4x + 4, P₂ = x⁴ + x² + 4, P₃ = x⁴ − x² + 4 (each irreducible over ℚ), and the projective classes of ρ̄_(C_i,3)(Frob₂) are 10A, 6I and 6H respectively. (BCGP25 Lemma 9.1.4 and proof, §9.1, p. 188, line 8676.)

Establish smooth ordinary reduction, the rational ramification point and the indicated point counts for each displayed projective curve. Use the two intrinsic 3-torsion permutation actions of §1.1 to separate the classes that the quartic alone does not distinguish.

**Checks.**

- The pairs (#C(𝔽₂),#C(𝔽₄)) for C₁,C₂,C₃ are (5,7),(3,7),(3,3); they yield the displayed coefficients (a,b)=(2,3),(0,1),(0,−1).
- Their Jacobian point counts at 2 are Q(1)=14,6,4, all even; their middle coefficients 3,1,−1 are all odd.
- The reductions of P₂ and P₃ allow respectively two and three projective classes, so assigning 6I or 6H from the polynomial alone would be unjustified.

*Needs:* §0.2; §1.2; §1.1; §4.2; §2.2.

### 4.4 Genus-two curves over 𝔽₂ and their Frobenius classes on 3-torsion

Let X₀/𝔽₂ be an ordinary smooth genus-two curve. (1) The class of Frob₂ on Jac(X₀)[3]/{±1} is 6G, 6H, 6I, 8A or 10A. (2) If X₀ has a smooth lift X/ℤ₂ with a ℚ₂-rational Weierstrass point, the class is 6H, 6I or 10A. (3) If ρ̄ : G_ℚ₂ → GSp₄(𝔽₃) is unramified with similitude ε̄⁻¹ and class 6H, 6I or 10A, there is an ordinary smooth genus-two curve X/ℤ₂ with ρ̄ ≅ ρ̄_(Jac X,3), a ℚ₂-rational Weierstrass point, and X 2-distinguished. The enumeration behind (1): among the 2¹¹ pairs (h, f) with deg h ≤ 3, deg f ≤ 6 over 𝔽₂, 768 give smooth genus-two curves y² + h(x)y = f(x); 384 are ordinary, with classes 6G: 32, 6H: 16, 6I: 48, 8A: 96, 10A: 192; the 384 non-ordinary have 6G: 48, 12C: 144, 4D: 48, 8A: 48, 10A: 96. (BCGP25 Lemma 9.1.6 and proof, §9.1, pp. 188–190, line 8703.)

For any field k and h,f ∈ k[x] with deg h ≤ 3 and deg f ≤ 6, let the projective equation be Y²+H(X,Z)Y=F(X,Z) in ℙ(1,3,1), with H and F the degree-three and degree-six homogenizations. Specialize the smoothness criterion of HyperellipticCurves §0.3 to genus two in the charts x=X/Z, y=Y/Z³ and u=Z/X, v=Y/X³. In characteristic 2 the criterion is gcd(h,h′²f+f′²)=1 and, at infinity, h₃ ≠ 0 or h₂²f₆+f₅² ≠ 0. The gcd condition means the two polynomials generate the unit ideal, so h=0 is included. In characteristic different from 2 put D=h²+4f: its affine roots must be simple and its reversed degree-six polynomial must not have a multiple root at u=0, equivalently deg D is 5 or 6 and gcd(D,D′)=1. In these cases the smooth projective double cover has genus two. The supplied criterion has the following chart form: in characteristic 2 a singular affine point has h=0, y²=f and h′y=f′; at infinity these equations read h₃=0, v²=f₆ and h₂v=f₅. Apply this criterion to the finite equation loci below (BCGP25 proof of Lemma 9.1.6, pp.188–190, line 8715; proof of Lemma 9.3.1, pp.199–200, line 9279).

- The criterion detects geometric smoothness on both charts, including degrees below six and characteristic two.
- Smooth reductions of an integral equation give smooth proper models and good Jacobian reduction. If there is no section, acquire a special-fibre point over a finite unramified extension, lift it by Hensel's lemma, apply RelativeJacobiansAndIntegralCurveModels §§2.2 and 2.4 there, and descend by NeronModelsAndSemistableAbelianVarieties §5.1. The section-independent Jacobian comparison descends with its special fibre.
- In odd characteristic completing the square sends the equation to (2y+h)²=h²+4f and preserves smoothness; it is not used in characteristic 2.

Establish the cardinalities of the smooth and ordinary equation loci and their Frobenius-class fibres. The 2-torsion point from the ordinary S₅(b) condition forces Q(1) even and excludes 6G and 8A in the marked good-curve case. For each admissible projective class use the displayed seed and its unramified quadratic twist by ℚ₂(√5) to realize both scalar lifts.

**Checks.**

- In characteristic 2, h=1,f=x⁵ has affine gcd 1 and infinity value h₂²f₆+f₅²=1, hence is smooth; h=1,f=x⁶ has the same affine gcd but infinity value 0, hence is singular. An affine-only test would conflate them.
- For h=x³+1,f=x²+x over 𝔽₂ the gcd of x³+1 and x⁶+x⁵+1 is 1, and h₃=1, so C₁ is smooth; h=f=0 fails the unit-ideal condition and is nonreduced.
- Over 𝔽₃, h=0,f=x⁵−x has gcd(f,f′)=1 and degree 5, so is smooth; f=x⁴−1 has no repeated affine root but degree 4 gives a double root at infinity and is excluded.
- The two-chart test gives 768 smooth pairs out of 2¹¹ over 𝔽₂ and 1296 smooth polynomials out of 3⁷ over 𝔽₃; retaining only the affine test would count singular projective models.
- The smooth curve y²+(x³+x²+1)y=x⁶+x⁵+1 has 0 points over 𝔽₂ and 6 over 𝔽₄. Its smooth ℤ₂-lifts have no section over ℤ₂ but acquire one over the unramified quadratic extension; their Jacobians still have good reduction over ℤ₂. A pointed-only application would miss them.
- The ordinary fibre counts add to 32+16+48+96+192=384, and the nonordinary counts add to 48+144+48+48+96=384.
- For the excluded marked-good cases Q mod 2=X²(X²+X+1), evaluation at 1 is 1, contradicting the required nonzero rational 2-torsion.
- The unramified quadratic twist sends a to −a and keeps b, ordinarity and the marked branch point; both scalar Frobenius lifts have the same projective class.

*Needs:* HyperellipticCurves §0.3; §1.2; §1.1; §4.3; §2.2; NeronModelsAndSemistableAbelianVarieties §6.13; §0.2; AlgebraicCurves Layers 5, 10 and 11; RelativeJacobiansAndIntegralCurveModels §§0.1–0.3, 2.2 and 2.4; NeronModelsAndSemistableAbelianVarieties §5.1 for unramified descent.

### 4.5 Exclusions for good ordinary reduction at 2 (Lemmas 9.2.6, 9.2.7, 9.2.11, 9.2.12, 9.2.19)

Let A/ℚ₂ be a principally polarized abelian surface. (a) If A has good ordinary reduction and ρ̄_(A,2) lies in a conjugate of S₅(b), then the class of ρ̄_(A,3)(Frob₂) is not 8A, and if moreover A is 2-distinguished it is not 4C or 12C. (b) If A has potentially semistable ordinary reduction, ρ̄_(A,3) is unramified with class 4C or 12C, and ρ̄_(A,2) lies in a conjugate of S₅(b), then A has good reduction and is not 2-distinguished. (c) If A has good ordinary reduction with Q(x) = x⁴ ± 3x³ + 5x² ± 6x + 4, then ρ̄_(A,2) does not lie in a conjugate of S₅(b). (d) If A₀/𝔽₂ is an abelian surface with Q(X)=X⁴−X²+4, Frobenius on A₀[3] is nonsemisimple and its underlying Galois module is isomorphic to Jac(C₃)[3]. For a specified polarization of degree prime to 3, its projective symplectic class can be 6G or 6H; the module assertion does not determine that class. If the specified polarization is principal, its class is 6H. (e) No abelian surface over ℚ₂ with good ordinary reduction has semisimple mod-3 Frobenius with characteristic polynomial (X²−1)², so class 2D is excluded independently of polarization. Consequently, for the principally polarized A, if it has good ordinary reduction, ρ̄_(A,2) ⊂ S₅(b) up to conjugacy and A is 2-distinguished, its class is 4D, 6H, 6I or 10A. (BCGP25 Lemmas 9.2.6 and 9.2.7 with proofs, §9.2, pp. 193–195, line 8943; BCGP25 Lemmas 9.2.11 and 9.2.12 with proofs, p. 196, line 9051; BCGP25 Lemma 9.2.19 and proof, p. 199, line 9226.)

Use the specified principal polarization for all symplectic assertions about A and for the principal clause of (d). The underlying-module clauses of (d) and (e) require no polarization.

Use the ordinary S₅(b) rational-torsion theorem and reduction of Q modulo 2 for the 8A and repeated-quadratic exclusions. No-eigenvalue-ratio rigidity and Néron–Ogg–Shafarevich force good reduction in the potential ordinary case. For the underlying-module assertions use finite-field isogenies and factor through φ²+1 or φ∓1 to reduce their 3-primary degree. This retains the reference torsion module without identifying pairings.

For the principal clause of (d), apply AbelianVarietiesOverFiniteFields §10.3 to (A₀,λ₀). The irreducible quartic Q excludes a split elliptic product. In the Jacobian case §4.4 has exactly 16 equations with this Q, all of class 6H with the canonical polarization. In the remaining case the polarized surface is Res_(𝔽₄/𝔽₂)E with descended product polarization, where E/𝔽₄ has trace 1. Its Frobenius on E[3] has matrix M=((0,2),(1,1)): it cannot be scalar −I, since #E(𝔽₁₆)=(5−1)(5+1)=24 is not divisible by 9. On the restriction, choose bases giving F=((0,M),(I₂,0)) and B=diag(J₂,2J₂), J₂=((0,1),(−1,0)). Then FᵀBF=2B. The 27-point action of §1.1 has no fixed point for this paired matrix, hence its class is 6H. Thus the good-ordinary exclusion of 2C and 6G uses a polarized comparison, independently of the isogeny argument (BCGP25 Table 9.2.5 and Lemma 9.1.6, pp.188–194, lines 8703 and 8939; the trichotomy is the supplied finite-field theorem).

**Checks.**

- Q=X⁴+X³−X²+2X+4 gives Q(1)=7 odd, so its ordinary étale and multiplicative parts have no nonzero rational 2-torsion; this conflicts with S₅(b) ordinarity.
- For a root α of X²+X+2 over 𝔽₃, −α is not a root, so the forbidden ratio −1 does not occur.
- The canonically polarized reference Jacobians with polynomials X⁴−X²+4 and X⁴+X²+4 have Q(1)=4 and 6 and classes 6H and 6I. For the latter isogeny class Frobenius is nonsemisimple, excluding 2D without comparing polarizations.
- For the Weil-restriction matrices above, F has rows (0,0,0,2), (0,0,1,1), (1,0,0,0), (0,1,0,0); rank(F²+I)=2 and (F²+I)²=0. Thus it is nonsemisimple of projective order 6, excluding 2C.
- The 27 cosets can be realized as unordered orthogonal frames of five lines on the primitive exterior square ker(∧²𝔽₃⁴→𝔽₃), the contraction being B. In coordinates e₁₂,e₁₃,e₁₄,e₂₃,e₂₄,e₃₄ the quadratic form is q(z)=z₁₂z₃₄−z₁₃z₂₄+z₁₄z₂₃. For this B there are 45 lines of q-value 1 and 27 such frames; their stabilizer is 2⁴:S₅. The action 2∧²F has cycle type 3⁵·6² and 0 fixed frames, whereas 6G has 3 fixed points. This pins 6H with the descended product pairing.
- For the canonical polarization λ of Jac(C₃), put u=4+π+V, where πV=2. Then (π+V)²=5, u has positive Rosati values 4±√5, and deg(λu)=121. On 3-torsion u reduces to I+F−F⁻¹. In the cyclic basis for F with rows (0,0,0,2), (1,0,0,0), (0,1,0,1), (0,0,1,0), the compatible nonsingular alternating forms have two similitude orbits; multiplication by u exchanges them. The 27-point fixed counts change from 0 to 3, so λu has class 6G with the same underlying module. Degree 121 is prime to 3 but is not 1.

Gives the ✗ entries of the good-ordinary column of Theorem 9.2.3. (BCGP25 Lemmas 9.2.6 and 9.2.7 with proofs, §9.2, pp. 193–195, line 8943; BCGP25 Lemmas 9.2.11 and 9.2.12 with proofs, p. 196, line 9051; BCGP25 Lemma 9.2.19 and proof, p. 199, line 9226.)

*Needs:* §4.2; §4.3; §4.4; AbelianVarietiesOverFiniteFields §10.3; AbelianSchemesAndArithmeticModuli A3.7–A3.9, A6.14 and A6.32–A6.34; NeronModelsAndSemistableAbelianVarieties §6.13; EndoscopicTransferAndUnitaryTraceComparison §8.3; LocalGaloisDeformationRings §2.2; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10; §1.2.

### 4.6 Purely toric reduction in the classes 2C and 6G (Lemma 9.2.13)

Let (A,λ)/ℚ₂ be a principally polarized abelian surface, using λ for both residual symplectic representations, such that (1) ρ̄_(A,3) is unramified; (2) the class of ρ̄_(A,3)(Frob₂) is 2C or 6G; (3) ρ̄_(A,2) lies in a conjugate of S₅(b); and (4) A has bad reduction at 2, or A has semistable ordinary reduction. Then A has semistable reduction with purely toric special fibre (in particular semistable ordinary reduction). BCGP25 Lemma 9.2.13 omits hypothesis (4). Without (4) the conclusion fails: the Jacobian of Y : y² + y = x⁵ − x⁴ + x³ has good non-ordinary reduction at 2 and class 6G. (BCGP25 Lemma 9.2.13 and proof, §9.2, pp. 196–197, line 9083; BCGP25 §9.2.16, p. 198, line 9177.)

The bad-reduction or semistable-ordinary hypothesis rules out the good nonordinary counterexample; in the good ordinary case the polarized conclusion of §4.5 excludes 2C and 6G. Unramified mod-3 action gives semistability. Positive toric rank one would supply an invariant line, whereas (X²+1)² has none over 𝔽₃, so the toric rank is two.

**Checks.**

- For good Y:y²+y=x⁵−x⁴+x³, b=2 is even, Q(1)=7 and the class is 6G; omitting the bad-or-ordinary hypothesis would wrongly force toric rank 2 from a good rank-0 fibre.
- For positive toric rank t=1, a residual invariant line would give an 𝔽₃-root of X²+1; its values at 0,1,2 are 1,2,2, so there is no such root.
- With surface dimension 2, t+a=2 and t>0; excluding t=1 leaves t=2,a=0, exactly purely toric reduction.
- The ordinary canonical lift of Jac(C₃) with the lifted polarization λu of §4.5 has trivial generic 2-torsion, unramified mod-3 class 6G, distinct ordinary unit roots and toric rank 0. It satisfies (1)–(4) but deg(λu)=121, so it fails the principal-polarization hypothesis; that hypothesis is essential.

Y of §9.2.16 (conductor 797) has good reduction at 2, a rational Weierstrass point and class 6G, and is not ordinary (Q₂ = x⁴ + 2x² + 4). (BCGP25 Lemma 9.2.13 and proof, §9.2, pp. 196–197, line 9083; BCGP25 §9.2.16, p. 198, line 9177.)

*Needs:* §4.5; §4.2; NeronModelsAndSemistableAbelianVarieties §3.12; NeronModelsAndSemistableAbelianVarieties §6.11; NeronModelsAndSemistableAbelianVarieties §6.12; NeronModelsAndSemistableAbelianVarieties §3.11.

### 4.7 Products, twists and coupled periods realizing 8A, 4D, 2D and 2C (Lemmas 9.2.8 and 9.2.14)

Over ℚ₂ choose a Tate curve X=E_q with v₂(q)>0 and q a sixth power, and an elliptic curve Y of good ordinary reduction with polynomial X²+X+2 and trivial mod-2 action; the equation y²+xy+y=x³−x²−6x−4 provides Y. Denote their unramified quadratic twists by X′ and Y′. Construct the principally polarized products A=X×Y, B=Y×Y′ and C=X×X′. They have respectively semistable ordinary, good ordinary and semistable ordinary reduction, unramified 3-torsion and projective Frobenius classes 8A,4D,2D. Their mod-2 images lie in S₅(b), and all three are 2-distinguished. (BCGP25 Lemma 9.2.8 and proof, pp.195–196, line 9001.)

For class 2C use a coupled period lattice. Let L/ℚ₂ be the unramified quadratic extension with involution σ, q ∈ 5(ℚ₂ˣ)² a cube with v₂(q)>0, and t ∈ O_Lˣ a cube with N_(L/ℚ₂)(t)=−1. Let T/ℚ₂ be the unramified torus whose arithmetic Frobenius φ on split coordinates is φ(a,b)=((φb)⁻¹,φa), with lattice action R=((0,−1),(1,0)). Embed the period lattice ℤ² into T by λ₁=(q,t²) and λ₂=((σt)⁻²,q)=(t²,q). The identities φλ₁=λ₂ and φλ₂=λ₁⁻¹ make it Galois-stable. The identity from the period lattice to the character lattice gives the symmetric period matrix ((q,t²),(t²,q)), with positive definite valuation matrix v₂(q)I₂. Apply ShimuraCompactifications C4.5–C4.6 to the positive datum of C4.4 over ℤ₂ with ideal (2), with zero abelian part, these isotrivial lattices and their R-invariant square decomposition to construct its principally polarized abelian quotient A_(2C)/ℚ₂. Prove it has purely toric semistable ordinary 2-distinguished reduction, unramified 3-torsion of class 2C and mod-2 image in S₅(b) (BCGP25 Lemma 9.2.14, pp.197–198, line 9102, for the intended local target; FC90 Chapter II Theorem 6.2 and Remark 6.3, Chapter III Theorem 7.1 and Corollaries 7.2–7.4, cited by locator alone as uncertified, for the general degeneration framework).

The product-polarized twist of E_q×E_q with diagonal periods instead has mod-2 Frobenius U⊗R̄, U=((1,1),(0,1)), preserving e⊗I₂, where e=((0,1),(1,0)) over 𝔽₂. Its symplectic centralizer has order 48 and it fixes zero odd theta characteristics; it is a triple transposition. Thus BCGP25 Lemma 9.2.14's assertion of centralizer order 16 for those periods does not establish its S₅(b) condition (BCGP25 lines 9152–9172).

For the coupled periods choose a=√q ∈ L with σa=−a. On A_(2C)[2] use toric points e₁=(−1,1), e₂=(1,−1), and period halves f₁=(a,t), f₂=φf₁=(−t,−a). Frobenius interchanges e₁,e₂ and f₁,f₂, since φ²f₁=f₁⁻¹. The additive Weil pairing has ⟨e_i,f_j⟩=δ_ij, ⟨e₁,e₂⟩=0 and ⟨f₁,f₂⟩=1, the last from t/(−t)=−1 multiplicatively. In this basis its Gram matrix is K=((0,I₂),(I₂,S)), S=((0,1),(1,0)). Exactly two of the six odd quadratic refinements of K are fixed, so this action is a double transposition. For 3-torsion all period cube roots and μ₃ lie in an unramified extension. Choosing their period thirds analogously gives Frobenius diag(−R,R), with multiplier −1 and square −I; the associated H¹ has the same projective class. The unramified ordinary quotient has values i and −i in characteristic zero, giving distinguishedness.

Use the supplied product polarizations and unramified orthogonal descent for the three product seeds, and polarized toric algebraization for the coupled 2C seed. A cubical Tate parameter gives μ₃⊕ℤ/3, while a square parameter gives trivial mod-2 action. Read the four projective classes from the block characteristic polynomials and, in class 2C, the nontrivial scalar square. The ordinary unramified characters have respectively values {1,α}, {α,−α}, {1,−1} and {i,−i}.

The comparison and construction API consists of the following facts.

- A = E_q × Y for a Tate curve E_q and an ordinary curve Y with trivial mod-2 representation.
- Unramified orthogonal twists of products retain their product principal polarization; the 2C marked seed is the coupled-period quotient, with the principal polarization determined by its symmetric period pairing.
- The reduction type: semistable ordinary for factors E_q, good ordinary for Y × Y′.
- The product seeds have the direct sums of the factors' 3-torsion; the coupled seed has the split toric–period 3-torsion cone and Frobenius diag(−R,R). All are unramified at 2.
- The projective Frobenius classes 8A, 4D, 2D, 2C of A, B, C, A_(2C).
- The three product seeds and the coupled 2C seed have mod-2 image in S₅(b); this assertion excludes the diagonal-period order-four twist.
- The four surfaces are 2-distinguished, with explicit unit roots.

**Checks.**

- (x² − 1)(x² + x + 2) ≡ x⁴ + x³ + x² + 2x + 1 mod 3, the 8A row of Table 9.2.5.
- (x² + x + 2)(x² − x + 2) = x⁴ + 3x² + 4.
- R = [[0, −1], [1, 0]] has order 4, R² = −I, and diag(1, −1) ⊗ R has characteristic polynomial (x² + 1)² over 𝔽₃.
- The diagonal-period twist has rank(M−I)=2, symplectic centralizer 48 and 0 fixed odd theta characteristics; the coupled-period seed has rank(M−I)=2, centralizer 16 and 2 fixed odd theta characteristics. Rank alone cannot distinguish the two.
- In the coupled basis the two invariant odd refinements have values (1,1,0,0) and (1,1,1,1) on (e₁,e₂,f₁,f₂); each has 6 zeros on 𝔽₂⁴. Setting ⟨f₁,f₂⟩=0 changes this theta count and loses the marking.
- Take u²−u−1=0 in L, t=u³ and q=8000=20³=5·40². Then N(u)=−1, N(t)=−1, t²=8u+5, σ(t)=−t⁻¹, and the valuation matrix is diag(6,6). On mλ₁+nλ₂ its value is 6(m²+n²)>0 for (m,n)≠(0,0). The identity Y→X commutes with R: λ₁↦λ₂↦−λ₁ and χ₁↦χ₂↦−χ₁. At q=5 the valuation form is zero and positivity fails; at q=8000⁻¹ it is −6I₂ and has the wrong sign.
- B = Y × Y′ with its product polarization is not a Jacobian: a product principal polarization has reducible theta divisor.
- Modulo 3, (X²−1)(X²+X+2)=X⁴+X³+X²+2X+1, which is the 8A polynomial.
- Over ℤ, (X²+X+2)(X²−X+2)=X⁴+3X²+4, and R²=−I; replacing diag(1,−1)⊗R by I⊗R would give the wrong multiplier.
- The ordinary unit-value pairs are {1,α},{α,−α},{1,−1},{i,−i}; Q_Y(1)=4 excludes α=1, and characteristic zero keeps each pair distinct.
- The common product Tate seed can use q=64=2⁶, which is both a cube and a square and has positive valuation 6. The coupled 2C seed instead uses q=8000 with a norm-minus-one cube t; diagonal periods do not give its odd-theta marking.

*Needs:* ArithmeticGaloisRepresentations §6.3; EllipticCurves Layer 4; AbelianSchemesAndArithmeticModuli A3.11 and A6.34; ShimuraCompactifications C4.4–C4.6 under (C4-a); NeronModelsAndSemistableAbelianVarieties §§3.14 and 6.11; §0.2; §2.1; §4.2; §1.2.

### 4.8 Twisted odd-theta moduli and the marked Torelli locus

For a number field or characteristic-zero local field F and continuous ρ̄:G_F→GSp₄(𝔽₃) of multiplier ε̄⁻¹, construct B(ρ̄), the moduli of principally polarized surfaces with symplectic identification A[3]≅ρ̄∨. Let B(2)(ρ̄) be its full-level-two cover, and define P(ρ̄)=B(2)(ρ̄)/S₅(b). It parametrizes that level-three framing together with an odd theta characteristic. Construct M₂ʷ(ρ̄), the moduli of smooth genus-two curves with a marked Weierstrass point and the same Jacobian framing, and its Torelli morphism into P(ρ̄). Prove that P is a smooth rational threefold and this morphism is an open immersion with dense image. Prove geometric connectedness of the full-level-two cover and geometric integrality of each intermediate proper-subgroup cover over P, with degree [S₅(b):G]. This is the marked rationality theorem; it does not claim that every twist B(ρ̄) of the Burkhardt variety is rational (BCGP25 Definition 9.2.1 and following paragraphs, p.192, line 8856; BCGP21 Definition 10.2.2, Proposition 10.2.3 and Lemma 10.2.4, pp.269–271, lines 12966, 12991 and 13038).

Obtain M₂(ρ̄), with the same symplectic level-three framing and no marked Weierstrass point, as the descended framing twist of the fine genus-two level-three family supplied by AbelianSchemesAndArithmeticModuliPartII B4.1. Over a finite Galois extension containing ζ₃ and trivializing ρ̄∨, use that supplied family and its universal curve; descend them with the pairing-compatible semilinear framing cocycle by AlgebraicModuliForArithmeticGeometry §§3.5 and 5.2. For the curve use its relatively ample relative dualizing sheaf with its functorial line-bundle cocycle. The supplied polarized Torelli map descends to M₂(ρ̄)→B(ρ̄), and the marked family is its pullback along P(ρ̄)→B(ρ̄). Prove that its Torelli map to B(ρ̄) identifies it with the dense open complement of the geometric product locus: products of two elliptic curves with their product principal polarization after algebraic closure. This identification descends with the framing and commutes with characteristic-zero field extension. For a characteristic-zero local F, every analytic neighbourhood of an F-point of B(ρ̄) meets this open, since B is smooth of dimension three and the product locus has dimension two (BCGP21 Definition 10.2.2 and the paragraph following it, p.269, line 12976; BCGP25 proof of Corollary 9.3.6, p.202, line 9380, for the local-neighbourhood passage).

Beyond the supplied quasi-finiteness and geometric Torelli, prove the open-complement identification using the genus-two theta divisor of a geometrically indecomposable principally polarized surface and descend the Torelli identification with its framing. The dual Torelli differential is multiplication Sym²H⁰(C,ω_C)→H⁰(C,ω_C²); for a basis s,t of the canonical differentials, s²,st,t² are a basis of the three-dimensional target. This gives the open immersion, and the product locus is its complement. Over a characteristic-zero local field a smooth analytic chart has dimension three, so a closed locus of dimension two cannot contain an analytic neighbourhood.

Use the supplied abelian level moduli, pairings, polarized descent and B4.1 fine curve family and geometric Torelli for these twists. The odd-theta birational map is equivariant for the descended finite symplectic action. Its twist is a projective three-space form; the symplectic Galois lift splits the associated projective obstruction as in BCGP21 Lemma 10.2.4. Connectedness uses the supplied prime-to-level monodromy theorem for the fine level-three chart at ℓ=2. Its subgroup quotients give the stated integral covers over P, independently of rationality.

- A point of P over F is the principally polarized surface with the framing and odd theta characteristic, up to the corresponding marked isomorphism.
- The full-level-two cover has group S₆ and degree 720 over B, and P→B has degree 6; over P its group is S₅(b).
- The marked curve maps to its Jacobian with induced theta marking; base change along every extension F→F′ preserves the framing and the Torelli map.
- The unmarked Torelli map identifies framed smooth genus-two curves with geometrically indecomposable framed principally polarized surfaces; forgetting the marking agrees with P→B on the marked Torelli open.
- A principally polarized surface with the given 3-torsion framing has an F-point over it in P exactly when its mod-2 image fixes a letter in the chosen six-point action.
- For G properly contained in S₅(b), the cover P_G→P is geometrically integral and generically finite of degree greater than one; its rational-point image is thin.

**Checks.**

- Over ℝ, conjugation sends ζ₃ to ζ₃⁻¹, and diag(1,1,−1,−1) has multiplier −1 for J. These actions give the required semilinear compatibility of the μ₃-valued pairing; a fixed-pairing linear action alone would lose it.
- At genus 2, level 3 rigidifies the curve: inversion acts as 2I≠I on 3-torsion, whereas it acts as I on 2-torsion. Level 2 alone does not give the supplied fine universal family.
- The degrees satisfy 720/120=6. Confusing the full-level-two cover with the odd-theta cover would give 720 rather than 6 over B.
- A full S₅(b) image fixes exactly one of six letters, while a transitive S₅(a) image fixes none. An arbitrary unmarked principally polarized surface need not lift to P over F.
- A product of elliptic curves with product polarization lies outside the smooth Torelli locus because its theta divisor is reducible. An ordinary neighbourhood can still meet that dense open.
- The trivial proper subgroup gives degree 120 over P; the full subgroup gives degree 1 and is excluded from the thin-cover collection.
- The smooth curve y²=(x²+1)(x²+2)(x²+3) has 6 distinct branch points and complex conjugation fixes 0 of them. Its framed Jacobian lies in the unmarked Torelli open, but has no rational odd-theta marking. Requiring a point of P would lose this unmarked example.
- A quadratic Weil restriction with its descended product polarization has 2 geometric theta components even when Galois interchanges them. It is outside M₂; requiring a product decomposition over F alone would misidentify the open.
- The geometric product locus has dimension 1+1=2 inside the three-dimensional B. A product point is outside M₂, while each of its analytic neighbourhoods over a characteristic-zero local field meets M₂; density does not put the product point itself in the open.
- For C:y²=x⁵−x in characteristic zero, the products of dx/y and x dx/y are (dx/y)², x(dx/y)² and x²(dx/y)², three independent quadratic differentials. The unmarked Torelli tangent map has rank 3, rather than merely a bijection on geometric points.

*Needs:* §2.1; AbelianSchemesAndArithmeticModuli A3.7–A3.8; ShimuraVarieties §§1.2 and 5.0 and the prime-to-level monodromy contract; AlgebraicModuliForArithmeticGeometry §§3.5 and 5.2; InverseGaloisAndArithmeticFundamentalGroups IG.2.5; ArithmeticGaloisRepresentations §7.6; AbelianSchemesAndArithmeticModuliPartII B4.1 at g=2 and ℓ=3 (fine universal curve and geometric Torelli).

### 4.9 An explicit semistable point of class 6G (§9.2.16 and Lemma 9.2.17)

The curve X:y²+(−x²−x−1)y=x⁵−4x⁴+47x³−43x²−2x+8 has a Jacobian over ℚ₂ with bad purely toric reduction, is 2-distinguished, has unramified 3-torsion of projective class 6G, and has mod-2 image in S₅(b) through its rational Weierstrass point. Its conductor exponent at 2 is two, its Euler polynomial is X²+1, and the ordinary unramified quotient has Frobenius values i and −i. The good reference Y:y²+y=x⁵−x⁴+x³ has polynomial X⁴+2X²+4, class 6G and nonordinary reduction (BCGP25 Lemma 9.2.17 and proof, p.199, lines 9214–9223; §9.2.16, p.198, line 9177).

Establish X's local torsion and conductor assertions directly. The canonical Jacobian polarization supplies the principal polarization of §4.6, and positive conductor supplies its bad-reduction hypothesis, so class 6G forces toric rank two; the eigenvalues i and −i establish distinguishedness. No comparison of global marked representations is used.

**Checks.**

- The good reference polynomial has constant term 4 and middle coefficient 2; X⁴+2X²+1 has constant term 1 and cannot be its Weil polynomial at 2.
- The conductor exponent of X is 2>0, whereas Y has exponent 0 and toric rank 0; a class-6G hypothesis alone cannot imply positive toric rank.
- The unramified values i and −i satisfy i²=−1 and i≠−i in characteristic zero; distinguishedness is lost if one tests equality only after reducing their signs modulo 2.

Realizes the semistable ordinary ✓ of Theorem 9.2.3 for 6G. (BCGP25 §9.2.16, pp. 198–199, line 9177; BCGP25 Lemma 9.2.17 and proof, p. 199, line 9214.)

*Needs:* §4.6; §1.1; §2.2; §0.2; NeronModelsAndSemistableAbelianVarieties §§3.5–3.6 and 5.0a–5.0c; ArithmeticGaloisRepresentations §6.3.

### 4.10 Local realization at 2 in the odd-theta moduli

Let ρ̄ : G_ℚ₂ → GSp₄(𝔽₃) be unramified with similitude ε̄⁻¹ and let P(ρ̄) be the moduli space of principally polarized abelian surfaces A with a symplectic isomorphism A[3] ≅ ρ̄^∨ and a fixed odd theta characteristic (§4.8). There is a point A ∈ P(ρ̄)(ℚ₂) with semistable ordinary reduction that is 2-distinguished if and only if the class of ρ̄(Frob₂) is not 4C or 12C. Such a point can moreover be taken with good (ordinary) reduction if and only if the class is 4D, 6H, 6I or 10A. In table form (good ordinary / semistable ordinary): 2C ✗/✓, 2D ✗/✓, 4C ✗/✗, 4D ✓/✓, 6G ✗/✓, 6H ✓/✓, 6I ✓/✓, 8A ✗/✓, 10A ✓/✓, 12C ✗/✗. (BCGP25 Theorem 9.2.3 and its proof outline, §9.2, pp. 192–193, line 8895; BCGP25 Definition 9.2.1 and the paragraphs after it, p. 192, line 8856.)

Combine all exclusions with the good seeds 6H,6I,10A, the product seed 4D, the coupled-period 2C seed, and the semistable seeds 2D,6G,8A. Every realization is adjusted by an unramified quadratic twist to match the given representation rather than just its projective class. Use the marked moduli characterization of §4.8.

| Class | Good ordinary and 2-distinguished | Semistable ordinary and 2-distinguished |
| --- | --- | --- |
| 2C | no | yes |
| 2D | no | yes |
| 4C | no | no |
| 4D | yes | yes |
| 6G | no | yes |
| 6H | yes | yes |
| 6I | yes | yes |
| 8A | no | yes |
| 10A | yes | yes |
| 12C | no | no |

**Checks.**

- The 2C entry uses the coupled-period seed with 2 fixed odd theta characteristics; the diagonal-period twist fixes 0 and gives no point of P.
- The good distinguished column has exactly 4 classes, while the semistable distinguished column has 8; the excluded pair is 4C,12C.
- Class 4D has a good product seed with Q=X⁴+3X²+4, whereas class 2D has a purely toric product seed and no good ordinary one.
- Good nonordinary class 6G has toric rank 0 and is outside both ordinary columns; the bad 6G seed has toric rank 2 and belongs to the semistable column.

*Needs:* §4.8; §4.4; §4.5; §4.7; §4.9; §4.2; NeronModelsAndSemistableAbelianVarieties §6.11; §0.2; §1.2.

### Examples

The product Y×Y′ has good ordinary 2-distinguished reduction and class 4D but is not a smooth genus-two Jacobian with its product polarization. The coupled-period toric 2C seed has mod-3 Frobenius diag(−R,R) with square −I and exactly two fixed odd theta characteristics modulo 2. The good nonordinary 6G curve demonstrates why bad reduction must enter the toric-rank lemma.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layers 0–2, the polarized moduli and deformation suppliers, finite-field isogeny comparison and Tate curves; use §4.8 for the marked local-realization table in §4.10.

## Layer 5: Local geometry at 3

### 5.1 Ordinary genus-two curves over 𝔽₃ (Lemma 9.3.1, Table 9.3.3)

Over 𝔽₃: there are exactly 40 ordinary Weil quartics (§4.1) for p = 3, i.e. 40 isogeny classes of ordinary abelian surfaces. Among the 3⁷ = 2187 polynomials f of degree ≤ 6, y² = f(x) is a smooth genus-two curve for 1296, of which 864 are ordinary. Table 9.3.3 records, for each of the 40 classes, Q mod 3, whether the class contains the Jacobian of an ordinary curve with an 𝔽₃-rational Weierstrass point, whether it contains the Jacobian of an ordinary curve, and the number of such curves. Exactly 10 ordinary curves are not 3-distinguished (Q a square: (x² − x + 3)² four times, (x² + 2x + 3)² once, (x² − 2x + 3)² once, (x² + x + 3)² four times); they are exactly the ordinary curves with Jac(X)(F̄₃)[3] ≅ χ ⊗ (ℤ/3)² as Galois modules for a character χ with χ² = 1, and none of them has an 𝔽₃-rational Weierstrass point. Hence every ordinary genus-two curve over 𝔽₃ with a rational Weierstrass point is 3-distinguished. The same proportions hold for generalized equations y² + h(x)y = f(x). Four ordinary isogeny classes contain no Jacobian of an ordinary curve: the simple ones x⁴ − 5x² + 9 and x⁴ − 4x² + 9 (the examples of Remark 9.3.2; Howe generalizes them to every odd q) and the product classes (x² − 2x + 3)(x² − x + 3) and (x² + 2x + 3)(x² + x + 3). (BCGP25 Lemma 9.3.1 and proof, §9.3, pp. 199–200, line 9253; BCGP25 Table 9.3.3, p. 201, line 9305; BCGP25 Remark 9.3.2, p. 200, line 9289.)

Prove the finite isogeny and equation classification, including the full scalar-versus-Jordan test on the étale 3-torsion. A repeated reduced unit-root polynomial does not by itself imply scalar action. The nonsquare ordinary classes with repeated reductions have nontrivial Jordan action for their smooth Jacobians.

**Checks.**

- The non-distinguished counts are 4+1+1+4=10; hence 864−10=854 ordinary equations are distinguished.
- Among scalar-+1 congruence classes, the counts 4+24+1+8+48+8+48 sum to 141, but only 4+1=5 have square Q.
- The polynomial X⁴−5X²+9 has b=−5 prime to 3 but no smooth genus-two Jacobian in its 𝔽₃-isogeny class; ordinary surface and ordinary curve loci differ.

The counts of Table 9.3.3 sum to 864; the Weil-polynomial column has 40 rows. (x² + x + 3)(x² − 2x + 3) has its class containing a Weierstrass Jacobian (✓, 24 curves). (BCGP25 Lemma 9.3.1 and proof, §9.3, pp. 199–200, line 9253; BCGP25 Table 9.3.3, p. 201, line 9305; BCGP25 Remark 9.3.2, p. 200, line 9289.)

*Needs:* §4.1; §4.4 (genus-two smoothness specialization); HyperellipticCurves §0.3; AbelianSchemesAndArithmeticModuliPartII F3.2; §0.2; AlgebraicCurves Layers 5, 10 and 11; RelativeJacobiansAndIntegralCurveModels §§0.1–0.3, 2.2 and 2.4; NeronModelsAndSemistableAbelianVarieties §5.1 for unramified descent.

### 5.2 A product special fibre at 3 forces bad reduction of the curve (Remark 9.3.8)

Let A₋ = E₋₁ × E₂ over 𝔽₃ with its product principal polarization (elliptic traces −1 and 2). Its ordinary étale 3-torsion has scalar Frobenius −1, and its quadratic twist A₊ = E₁ × E₋₂ has scalar Frobenius +1. Both are 3-distinguished, and neither is the Jacobian of a smooth genus-two curve over 𝔽₃: Lemma 9.3.1(3) says that an ordinary genus-two Jacobian with scalar étale 3-torsion has square Frobenius polynomial, whereas Q₋ = (x² + x + 3)(x² − 2x + 3) and Q₊ = Q₋(−x) = (x² − x + 3)(x² + 2x + 3) are not squares. Hence a genus-two curve over ℚ₃ whose principally polarized Jacobian has good reduction to either product has bad curve reduction. For the scalar +1 isogeny-class argument of Remark 9.3.8, among the five ordinary 3-distinguished isogeny classes with Q ≡ x² + x³ + x⁴ mod 3, only Q₊ can contain a surface A₀ with A₀[3](𝔽₃) ≅ (ℤ/3)². In the other four, Q(1) ≡ ±3 mod 9 and the reference Jacobian B₀ has only ℤ/3 rational 3-torsion; iterated factorization through 1 − φ rules out an isogeny to such an A₀. (BCGP25 Remark 9.3.8, pp. 203–204, line 9448.)

The traces −1 and 2 reduce to the same value −1 modulo 3; twist to traces 1 and −2 for scalar +1. The distinct characteristic-zero roots give distinguishedness, while the scalar étale action and §5.1 exclude smooth genus-two Jacobians in those scalar torsion classes. Compare rational 3-torsion under isogeny by factoring through 1−φ in the four classes of Q(1) having 3-adic valuation one.

**Checks.**

- For traces −1,2 the quartic is X⁴−X³+4X²−3X+9 and Q(1)=10; both traces reduce to −1 modulo 3.
- For traces 1,−2 the twist polynomial is X⁴+X³+4X²+3X+9 and Q(1)=18, with scalar +1 étale Frobenius.
- Neither product polynomial is a square, although its reduced unit-root polynomial is; the scalar full étale torsion excludes it from the corresponding smooth Jacobian locus.

*Needs:* §5.1; EndoscopicTransferAndUnitaryTraceComparison §8.3; §0.2.

### 5.3 Every ordinary local mod-3 module has a distinguished marked seed

For an ordinary ρ̄:G_(ℚ₃)→GSp₄(𝔽₃) of multiplier ε̄⁻¹ whose dual has a finite flat model, prove existence of a genus-two curve X/ℚ₃ with a rational Weierstrass point, good ordinary 3-distinguished Jacobian J and ρ̄_(J,3)≅ρ̄. The ordinary finite model is a rank-two étale quotient V extended by its multiplicative dual. Realize every Frobenius conjugacy class of V, including scalar and nonsemisimple repeated-root classes; matching its characteristic polynomial alone does not determine V (BCGP25 Corollary 9.3.6 and Lemma 9.3.7, pp.202–203, lines 9362 and 9385).

For the nonscalar cases use the following four special-fibre curves and their unramified quadratic twists. The table lists the étale characteristic polynomial, a quintic equation y²=f(x), and the full Weil quartic.

| q(X) | f(x) over 𝔽₃ | Q(X) |
| --- | --- | --- |
| X²+1 | x⁵+2x+1 | X⁴+3X³+7X²+9X+9 |
| X²−1 | x⁵+x³+x+1 | X⁴+3X³+5X²+9X+9 |
| X²−X−1 | x⁵+x²+x | X⁴−X³+2X²−3X+9 |
| X²+X+1 | x⁵+x⁴+x²+1 | X⁴+X³+X²+3X+9 |

The repeated-root last row has nontrivial Jordan action, by §5.1. For scalar −1 use E_(−1)×E₂, and for scalar +1 use E₁×E_(−2); these have the product principal polarization and the two nonsquare quartics of §5.2. Their mod-2 order-six type is a transposition times a disjoint three-cycle, hence fixes a branch letter in the standard action. Apply the supplied polarized finite-level lifting at p=3, including the compatible truncated Barsotti–Tate model, then the dense Torelli locus and local-neighbourhood contract. This latter passage yields a curve even when the chosen special fibre is a product. The ordinary-polarized-three-model contract supplies the passage from the finite-flat hypothesis to the compatible polarized truncated model.

- The seed realizes the prescribed full ordinary generic module, not just V or its semisimplification.
- The product seed with traces −1,2 has scalar −1, and twisting both factors gives the scalar +1 seed with traces 1,−2.
- All seeds retain a rational marked Weierstrass point, good ordinary Jacobian reduction and distinguishedness on a sufficiently small local open.
- The construction is compatible with unramified quadratic twist and with the symplectic H¹/torsion dual convention.

**Checks.**

- The six monic degree-two polynomials with nonzero constant term occurring here give eight GL₂(𝔽₃) conjugacy classes, because each of the two repeated-root polynomials has a scalar and a Jordan class.
- For q=(X−1)², scalar I has a two-dimensional fixed space, whereas a nontrivial Jordan block has a one-dimensional fixed space; a characteristic-polynomial-only seed would conflate them.
- The product scalar −1 seed has Q(1)=10, and its scalar +1 twist has Q(1)=18. The signs cannot be interchanged without changing the rational 3-torsion count.
- The characteristic polynomials of (12)(345) and a six-cycle are (X+1)²(X²+X+1) and (X²+X+1)² over 𝔽₂, so the standard marked embedding is detected.

*Needs:* §§4.8, 5.1–5.2; AbelianSchemesAndArithmeticModuli A4.12–A4.14; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.0c and the local-neighbourhood contract; LocalGaloisDeformationRings ordinary finite-flat realizations.

### Examples

The scalar −1 and +1 ordinary product seeds have traces (−1,2) and (1,−2), and point counts 10 and 18. A repeated étale characteristic polynomial also has a distinct Jordan possibility; the local seed construction treats it separately.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layers 0, 2 and 4, the ordinary finite-level lifting supplier and the local-neighbourhood contract; §5.3 supplies the local input for Layer 6.

## Layer 6: Approximation and the 2–3 switch

### 6.1 Local conditions at 2 for the switch

Let ρ̄:G_ℚ→GSp₄(𝔽₃) have multiplier ε̄⁻¹, with unramified restriction at 2. Then its projective Frobenius class at 2 avoids 4C and 12C if and only if ρ̄ restricted to G_(ℚ₂) is H¹ modulo 3 of the Jacobian of a genus-two curve over ℚ₂ with a rational Weierstrass point and semistable ordinary 2-distinguished Jacobian reduction. No condition at 3 enters this equivalence. In the switch application also assume the dual restriction at 3 has an ordinary finite flat model. (BCGP25 Lemma 9.4.2(1) and the first part of its proof, §9.4, pp. 204–205, line 9489.)

One direction uses §4.10. In the other direction take the local principally polarized point there, use the local-neighbourhood contract for its semistable ordinary distinguished data, and intersect the resulting ball with the dense Torelli open of §4.8. Products at the initial point need this passage.

**Checks.**

- For projective 4C or 12C the local realization table gives 0 distinguished ordinary points; for 2D it gives a semistable seed but 0 good ordinary seeds.
- The 4D product seed has two elliptic factors and a reducible theta divisor; the dense Torelli ball is required to obtain a smooth curve.
- Removing every local condition at 3 leaves the same two-way local criterion at 2; the proof uses only ℚ₂-points and the dense Torelli open.

The 2D, 4D and 8A cases pass through products of elliptic curves, which are not Jacobians: the move into the Torelli image is essential. (BCGP25 Lemma 9.4.2(1) and the first part of its proof, §9.4, pp. 204–205, line 9489.)

*Needs:* §4.10; §4.8; §2.2; NeronModelsAndSemistableAbelianVarieties §§6.11–6.13 and local-neighbourhood contract; §0.2.

### 6.2 The 2–3 switch

Let ρ̄ : G_ℚ → GSp₄(𝔽₃) have similitude ε̄⁻¹, with ρ̄^∨|_(G_ℚ₃) ordinary and finite flat, ρ̄|_(G_ℚ₂) unramified, and the class of ρ̄(Frob₂) not 4C or 12C. Then there is a genus-two curve X/ℚ with a rational Weierstrass point such that B = Jac(X) satisfies: (a) ρ̄_(B,3) ≅ ρ̄; (b) B has good ordinary or semistable ordinary reduction at 2 and is 2-distinguished; (c) B has good ordinary reduction at 3 (and may be taken 3-distinguished, Remark 9.4.3); (d) ρ̄_(B,2) : G_ℚ → GSp₄(𝔽₂) has image S₅(b), and complex conjugation is a double transposition; moreover End(B_ℚ̄) = ℤ. (BCGP25 Lemma 9.4.2(2) and proof, §9.4, pp. 204–205, line 9489; BCGP25 Remarks 9.4.3 and 9.4.4, p. 206, line 9550.)

Apply InverseGaloisAndArithmeticFundamentalGroups IG.2.7 to the smooth rational marked Torelli locus, with local opens at 2,3 and infinity. Avoid the finitely many proper-subgroup covers of degrees [S₅(b):G]>1; their geometric integrality comes from §4.8. Choose a real quintic with one real root, so complex conjugation swaps two pairs and fixes two branch points. The local-three seed is §5.3 and the endomorphism adapter gives geometric End=ℤ.

**Checks.**

- A real quintic with one real root has conjugation cycle type [1,1,2,2] on its six branch points, of order 2 and sign +1.
- A proper subgroup cover has degree [S₅:G]≥2; the full group gives degree 1 and cannot be included in the thin exceptional set.
- The auxiliary image has order |S₅|=120 and its alternating subgroup order 60, while the prescribed mod-3 image is unchanged. At the real place c²=1 and multiplier −1 give two +1 and two −1 eigenvalues modulo 3, so the real anti-symplectic involution is conjugate to that of the chosen quintic and its level-three framing exists.

Theorem 9.5.2 applies §3.2 to this B. (BCGP25 Lemma 9.4.2(2) and proof, §9.4, pp. 204–205, line 9489; BCGP25 Remarks 9.4.3 and 9.4.4, p. 206, line 9550.)

*Needs:* InverseGaloisAndArithmeticFundamentalGroups IG.2.5 and IG.2.7; §6.1; §4.8; §5.3; §2.1; §2.2; NeronModelsAndSemistableAbelianVarieties §§6.11–6.13 and local-neighbourhood contract; FaltingsFinitenessAndIsogenyTheorems R28.4; §0.2.

### 6.3 Infinitely many curves with given mod-3 representation and good ordinary reduction at 3 (Remark 9.4.4)

For a continuous ρ̄:G_ℚ→GSp₄(𝔽₃) of multiplier ε̄⁻¹ whose dual restriction at 3 has an ordinary finite flat model, there are infinitely many ℚ-isomorphism classes of genus-two curves with a rational Weierstrass point, good ordinary Jacobian reduction at 3 and H¹ modulo 3 isomorphic to ρ̄. There is no condition at 2. The Jacobians can be chosen 3-distinguished using §5.3. (BCGP25 Remark 9.4.4, p. 206, line 9553.)

Use InverseGaloisAndArithmeticFundamentalGroups IG.2.7 with the local-three open and no dyadic condition, avoiding any finite collection of points. Forgetting the marked Weierstrass point and the level-three framing has finite fibres on each curve isomorphism class, so infinitely many marked points give infinitely many classes.

**Checks.**

- For a fixed curve there are at most 6 marked Weierstrass points and finitely many, at most |GSp₄(𝔽₃)|=103680, level framings; infinitely many marked points cannot all represent one curve.
- Avoiding a finite set removes a thin type-I locus in the three-dimensional rational marked moduli.
- The scalar −1 and +1 local cases both have distinguished product seeds, with Q(1)=10 and 18; no dyadic restriction is needed.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups IG.2.5 and IG.2.7; §4.8; §5.3; NeronModelsAndSemistableAbelianVarieties §§6.11–6.13 and local-neighbourhood contract.

### Examples

On the real quintic x(x²+1)(x²+2), the branch action fixes zero and infinity and exchanges two nonreal pairs. Local conditions at 2 and 3 plus this real open give the required conjugation type; the proper-subgroup thin loci enforce full S₅(b).

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layers 0–2, 4 and 5, Hilbert points with weak approximation from InverseGaloisAndArithmeticFundamentalGroups IG.2.7, and local-neighbourhood persistence; no lifting theorem is needed to construct the switch.

## Layer 7: Modularity of abelian surfaces over ℚ

### 7.1 Modularity transfer between ordinary surfaces at p > 2

Let p > 2 and A, B/ℚ abelian surfaces with (1) ρ̄_(A,p) ≅ ρ̄_(B,p); (2) A and B have good ordinary reduction at p and ρ_(A,p)|_(G_(ℚ_p)) is p-distinguished; (3) B is modular: there is a cuspidal π of GSp₄(𝔸_ℚ) of weight 2, level prime to p, ordinary at p, with ρ_(π,p) ≅ ρ_(B,p); (4) the Zariski closure of ρ_(A,p)(G_ℚ) contains Sp₄; (5) ρ̄_(A,p) is GSp₄-reasonable (WHITMORE22 Definition 3.19, pp.23–24, line 1011); (6) ρ̄_(A,p) is tidy (BCGP21 Definition 7.5.11); (7) ρ̄_(A,p)(G_(ℚ(ζ_p))) contains a regular semisimple element; (8) ρ̄_(A,p)(G_ℚ) ∖ Sp₄(𝔽_p) contains a regular semisimple element. Then A is modular: there is a cuspidal π′ of GSp₄(𝔸_ℚ) of weight 2, of general type, whose transfer Π′ to GL₄ satisfies L(s, H¹(A)) = L(s, Π′ ⊗ |det|^(−3/2)). (BCGP25 Theorem 9.5.1 and proof, §9.5, p. 206, line 9564; BCGP25 Proposition 7.5.10 and Theorem 7.5.11, §7.5, pp. 177–179, line 8129.)

Both residual realizations have a specified perfect symplectic lattice, from a prime-to-p polarization or a separate framing; residual equality respects the multiplier and ordinary flags.

Use NR11.2–NR11.6 in its odd-prime alternative. Sp₄ Zariski containment and the residual cyclotomic regular element give integral enormousness. Section 6.35 of LocalGaloisDeformationRings gives compatible ordinary flags with a unique seed component and target membership in it. Good ordinary reduction gives crystalline finite-flat weight two; the seed is allowed to be singular. Conclude with §0.3.

**Checks.**

- At p=3 the constituent twist is −3/2 and both surface H¹ multisets are {0,0,1,1}; a regular-weight seed is unnecessary.
- Two compatible pure finite-flat ordinary weight-two lifts lie on the one component of relative dimension 16 specified by the supplier; the nodal ring xy=0 illustrates why a unique-component assertion is stronger than mere common-component incidence.
- The zero-dimensional identity Galois image has no residual regular rank-four element and no Sp₄ Zariski closure, so matching residual matrices alone cannot meet the theorem.

Theorem 9.5.2 applies it with p = 3 and B the switch surface. (BCGP25 Theorem 9.5.1 and proof, §9.5, p. 206, line 9564; BCGP25 Proposition 7.5.10 and Theorem 7.5.11, §7.5, pp. 177–179, line 8129.)

*Needs:* GSp4NonregularModularityLifting NR11.2–NR11.6; ArithmeticGaloisRepresentations §7.11 (integral-enormity contract); ArithmeticGaloisRepresentations §7.9 (reasonableness contract); ArithmeticGaloisRepresentations §7.11; LocalGaloisDeformationRings §6.35; §0.3; §0.2; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10; AbelianSchemesAndArithmeticModuli A5.7; ModularityAndLanglandsExtensions §3.26.

### 7.2 Modularity of abelian surfaces over Q with allowed mod-3 image

Let A/ℚ be an abelian surface with a polarization of degree prime to 3. Suppose (1) ρ̄_(A,3)(G_ℚ) is one of the fifteen subgroups of §1.4 and End(A_ℚ̄) = ℤ; (2) ρ̄_(A,3)|_(G_ℚ₂) is unramified and the class of ρ̄_(A,3)(Frob₂) is not 4C or 12C, equivalently its characteristic polynomial is not (x² ± x + 2)²; (3) A has good ordinary reduction at 3 and is 3-distinguished. Then A is modular: there is a cuspidal automorphic representation of GL₄(𝔸_ℚ), the transfer of a weight-2 cuspidal representation of GSp₄(𝔸_ℚ) of general type, whose L-function (twisted by |det|^(−3/2)) is L(s, H¹(A)). (BCGP25 Theorem 9.5.2 and proof, §9.5, p. 207, line 9596.)

Retain the classification and lifting premises of the exact supplier contracts in this automorphic conclusion.

Use §6.2 to construct B, then §3.2 to make B modular at 2. Apply the ordinary spherical-attachment contract at 3 to obtain the level-prime-to-3 ordinary seed before invoking §7.1. The target surface has Sp₄ Zariski closure by its geometric endomorphism hypothesis; the finite image tests are §1.4. Nonprincipal polarizations pass through the finite-extension principal quotient.

**Checks.**

- The full image has label 1.1.1 and is one of the 15 permitted groups; 3.1620.2 is excluded even though an abstract order-64 group occurs in the permitted list.
- For good ordinary 3-reduction with Q a square, the distinguished test gives false; residual image membership does not repair it.
- A product of elliptic curves has at least two geometric endomorphism idempotents and does not meet End=ℤ, so the theorem does not imply a cuspidal GL₄ witness for that product.

*Needs:* §6.2; §3.2; §7.1; §1.4; FaltingsFinitenessAndIsogenyTheorems R28.4 (surface-open-image contract); §1.2; §0.2; ModularityAndLanglandsExtensions §3.26; AbelianSchemesAndArithmeticModuli A3.11 and A6.34; GSp4NonregularModularityLifting NR2.5–NR2.6.

### 7.3 Theorem A: modularity of abelian surfaces over Q

Let A/ℚ be an abelian surface with a polarization of degree prime to 3 such that (1) ρ̄_(A,3) : G_ℚ → GSp₄(𝔽₃) is surjective; (2) ρ̄_(A,3)|_(G_ℚ₂) is unramified and the characteristic polynomial of ρ̄_(A,3)(Frob₂) is not (x² ± x + 2)²; (3) A has good ordinary reduction at 3 and the characteristic polynomial of Frobenius at 3 has no repeated roots. Then A is modular: there is a cuspidal automorphic representation Π of GL₄(𝔸_ℚ), the transfer of a weight-2 cuspidal representation of GSp₄(𝔸_ℚ), with L(s, H¹(A)) = L(s, Π ⊗ |det|^(−3/2)). Consequently L(s, H¹(A)) has an entire continuation and the expected functional equation (in standard form Λ(s) = ±Λ(2 − s) with Λ(s) = N^(s/2)Γ_C(s)²L(s, H¹(A)); see §0.3). (BCGP25 Theorem A, §1.1, pp. 2–3, line 100; BCGP25 §9.5, opening paragraph, p. 206, line 9559.)

Retain the classification and lifting premises of the exact supplier contracts in this automorphic conclusion.

Surjectivity is the full-group case of §1.4 and gives geometric End=ℤ through the residual-image endomorphism contract. The two forbidden characteristic polynomials are exactly the forbidden projective classes. The good ordinary nonsquare criterion supplies distinguishedness, so apply §7.2 and then §0.3.

**Checks.**

- The forbidden polynomial (X²+X+2)² reduces to coefficients (1,2,2,1,1) from highest to lowest degree; changing both odd signs identifies its quadratic twist.
- For E×E at 3, Q=Q_E² has repeated roots, so hypothesis three fails and no cuspidal conclusion is forced.
- The full residual image has order 103680 and index 1; its symplectic kernel has index 2, not 1.

*Needs:* §7.2; §0.3; §1.4; §1.2; §0.2; FaltingsFinitenessAndIsogenyTheorems R28.4; ModularityAndLanglandsExtensions §3.26.

### 7.4 Modularity of genus-two curves with good ordinary reduction at 2 and 3

Let X/ℚ be a smooth genus-two curve with (1) ρ̄_(Jac X,3)(G_ℚ) one of the fifteen allowed subgroups and End(Jac(X)_ℚ̄) = ℤ; (2) good ordinary reduction at 2; (3) good ordinary reduction at 3; (4) Jac(X) 3-distinguished. Then X is modular. (BCGP25 Theorem 9.5.3 and proof, §9.5, p. 208, line 9642.)

The good ordinary genus-two reduction at 2 has class 6G,6H,6I,8A or 10A by §4.4, and prime-to-2 torsion is unramified. Apply §7.2 to the principally polarized Jacobian.

**Checks.**

- The allowed good-ordinary-at-2 curve classes are 6G,6H,6I,8A,10A, five classes disjoint from the forbidden pair.
- There are 10 ordinary curves in the 𝔽₃ equation count with square Q; ordinary reduction at 3 alone does not satisfy distinguishedness.
- A good-reduction product is a surface with reducible theta divisor; it is outside the smooth genus-two input even when both elliptic factors are ordinary.

Theorem B is the special case with a rational Weierstrass point. (BCGP25 Theorem 9.5.3 and proof, §9.5, p. 208, line 9642.)

*Needs:* §7.2; §4.4; §0.1.

### 7.5 Theorem B: modularity of quintic genus-two curves

Let X : y² = f(x), deg f = 5, be a smooth genus-two curve over ℚ with (1) ρ̄_(Jac X,3)(G_ℚ) one of the fifteen allowed subgroups and End(Jac(X)_ℚ̄) = ℤ (both hold when ρ̄_(Jac X,3) is surjective, the hypothesis of BCGP25 Theorem B (BCGP25 §1.1, p. 3, line 150)); (2) good ordinary reduction at 2; (3) good ordinary reduction at 3. Then X is modular. Here 3-distinguishedness is automatic. (BCGP25 Theorem B, §1.1, pp. 3–4, line 150; BCGP25 Theorem 9.5.4 and proof, §9.5, p. 208, line 9656.)

Retain the classification and lifting premises of the exact supplier contracts in this automorphic conclusion.

The point at infinity of the quintic is rational and ramified. At good reduction prime 3, ramification specializes to distinct branch points because 2 is invertible. Section 5.1 supplies 3-distinguishedness, so §7.4 applies.

**Checks.**

- A squarefree degree-five model has 5 finite branch points and 1 at infinity, giving 6 in total and a rational marked point.
- A repeated root in a quintic makes its discriminant zero and violates smoothness; degree five alone is insufficient.
- The 10 non-distinguished ordinary equations at 3 have 0 rational Weierstrass points, so they cannot be the good reduction of a marked ordinary quintic.

*Needs:* §7.4; §5.1; §0.2; §7.3.

### 7.6 Modularity with bad reduction at 2

Let A/ℚ be an abelian surface with a polarization of degree prime to 3 such that (1) ρ̄_(A,3)(G_ℚ) is one of the fifteen allowed subgroups and End(A_ℚ̄) = ℤ; (2) ρ̄_(A,3)|_(G_ℚ₂) is unramified; (3) A has good ordinary reduction at 3 and is 3-distinguished; (4) A has bad reduction at 2. Then A is modular. The point is that bad reduction with unramified 3-torsion automatically excludes the classes 4C and 12C. (BCGP25 Theorem 9.5.5 and proof, §9.5, pp. 208–209, line 9671; BCGP25 Remark 9.5.6, p. 209, line 9700.)

Retain the classification and lifting premises of the exact supplier contracts in this automorphic conclusion.

Unramified residual 3-torsion gives semistability. Rank-one toric reduction would yield a residual line; rank-two toric reduction has character-lattice Frobenius of order 1,2,3,4 or 6, and its cyclotomic twist cannot give an eigenvalue of order eight modulo 3. Both exclude (X²±X+2)². The independent no-eigenvalue-ratio route reaches the same conclusion through Néron–Ogg–Shafarevich.

**Checks.**

- The irreducible quadratics X²±X+2 have roots of order 8 over 𝔽₉; none lies in 𝔽₃, where their values are nonzero.
- The finite orders in GL₂(ℤ) are 1,2,3,4,6; multiplying their eigenvalues by the order-two cyclotomic value still cannot give order 8 modulo 3.
- The conductor-1982 curve has positive dyadic conductor, whereas its mod-3 representation is unramified (BCGP25 §10.1, p. 210, line 9773); unramified residual torsion is weaker than good surface reduction.

*Needs:* §7.2; NeronModelsAndSemistableAbelianVarieties §3.12; NeronModelsAndSemistableAbelianVarieties §6.12; LocalGaloisDeformationRings §2.2; NeronModelsAndSemistableAbelianVarieties §§5.0a–5.6 and 6.10; §1.2.

### Examples

The quintic specialization supplies a rational ramification point and eliminates the separate 3-distinguished hypothesis in Theorem B. The conductor-1982 curve y²+(x+1)y=−x⁵+x⁴−x³+x² illustrates the bad-at-2 theorem and does not assert good reduction from unramified residual 3-torsion (BCGP25 §10.1, p. 210, line 9773).

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layers 0–6, the image and component suppliers, and the singular-weight lifting and ordinary spherical-attachment contracts.

## Layer 8: Density, endomorphism types and residual modularity

### 8.1 A positive proportion of genus-two curves satisfy Theorem 9.5.2 (§10.1)

Count smooth genus-two equations X : y² + h(x)y = f(x), h, f ∈ ℤ[x], deg h ≤ 3 and deg f ≤ 6, in expanding coefficient boxes. The local conditions (1) smooth genus-two reduction of the given model at 2, (2) good ordinary reduction at 3, (3) mod-3 Frobenius at 2 not projectively 4C or 12C (its polynomial is not x⁴ ± x³ + 2x² ∓ x + 1, with opposite signs), and (4) distinct roots of Q₃, have density ((768 − 144)/2¹¹)·((864 − 10)/3⁷) = 5551/46656. The same local density holds for any counting jointly equidistributed modulo 6. In coefficient boxes, additionally remove the thin exceptional set where the mod-3 image is not GSp₄(𝔽₃), using generic full mod-3 monodromy and Hilbert irreducibility. Surjectivity then gives geometric End = ℤ by the separate endomorphism theorem of §7.3. Thus Theorem A, and hence Theorem 9.5.2, applies on a subset of lower density at least 5551/46656 in these boxes. (BCGP25 §10.1, pp. 209–210, line 9714.)

Use the equation counts at 2 and 3 and joint equidistribution modulo 6. Generic full level-three monodromy, supplied for the entire smooth coefficient family, makes the proper-image locus thin. Its integral-box count is density zero. The residual endomorphism adapter then supplies geometric End=ℤ without identifying the whole extra-endomorphism locus with a thin set.

**Checks.**

- The dyadic proportion is 624/2048=39/128 and the triadic proportion is 854/2187, so their product is 5551/46656.
- The conditional allowed proportion at 2 is 624/768=13/16, not 624/2048; the latter includes nonsmooth equations in its denominator.
- There are 11 integral coefficients; the thin exceptional bound H^(11−1/2)log H divided by the box count of order H¹¹ tends to 0. Separate local marginals without joint mod-6 equidistribution would not justify multiplication.

*Needs:* HyperellipticCurves §0.3; §4.4; §5.1; RelativeJacobiansAndIntegralCurveModels §§0.1–0.3, 2.2 and 2.4; NeronModelsAndSemistableAbelianVarieties §5.1 for unramified descent; §7.2; InverseGaloisAndArithmeticFundamentalGroups IG.2.5; InverseGaloisAndArithmeticFundamentalGroups IG.2.4–IG.2.6; §7.3; AbelianSchemesAndArithmeticModuli A4.9–A4.14.

### 8.2 Automorphy of odd potentially abelian GSp₄ representations (Lemma 10.2.5)

Let ρ:G_ℚ→GSp₄(ℚ̄_p) be continuous and irreducible, de Rham at p, and with abelian image after restriction to a finite Galois extension. Assume ν(ρ(c))=−1 for complex conjugation, and that no character twist of ρ has finite image. Then ρ is automorphic for GL₄, through automorphic induction and tensor products of algebraic Hecke characters and odd Artin representations. Finite up to twist means precisely that there exists a continuous character whose inverse twist has finite image; it is not the condition of having finite determinant. (BCGP25 Lemma 10.2.5 and proof, §10.2, pp. 213–214, line 9896; BCGP25 Lemmas 10.2.3 and 10.2.4, pp. 212–213, line 9839; BCGP25 Remark 10.2.6, pp. 214–215, line 9959.)

Apply ArithmeticGaloisRepresentations §5.12: ρ|_(G_L) ≅ ⊕_(i=1)^b χ_i^(⊕a) with ab=4, the χ_i forming one Gal(L/ℚ)-orbit because ρ is irreducible, and ρ is induced from the stabilizer field of χ₁. If b=1 the projective image is finite and projective lifting (ArithmeticGaloisRepresentations §7.6) makes ρ finite up to twist, which is excluded. If b=2 then a=2, and G_L acts on the two-dimensional χ₁-isotypic part V₁ by the scalar χ₁. So V₁ has finite projective image and is finite up to twist by §7.6. BCGP25 applies its rank-two Lemma 10.2.4 to V₁ here; only its finite-up-to-twist branch occurs, and no rank-two induction input is needed. For the quadratic stabilizer field K/ℚ, write η for its quadratic character and use the positive-flip Asai construction As⁺ of ArithmeticGaloisRepresentations §7.1. The exterior-square decomposition is ∧²Ind_(G_K)^(G_ℚ)V₁ ≅ Ind_(G_K)^(G_ℚ)(det V₁) ⊕ (As⁺(V₁)⊗η). Apply the symplectic character line to these summands, then use roots of characters, projective lifting and odd Artin tensor products (BCGP25 proof of Lemma 10.2.5, pp.213–214, lines 9911–9949).

If b=4 then a=1 and ρ ≅ Ind_(G_K)^(G_ℚ) ψ_p for the quartic stabilizer field K of χ₁ and a character ψ_p of G_K restricting to χ₁. As a direct summand of ρ|_(G_K), ψ_p is de Rham above p (AutomorphicGaloisRepresentationsPartII AG2.P). Before applying AutomorphicGaloisRepresentations §3.13, check that ψ_p is unramified outside a finite set. By class field theory ψ_p is a continuous character of the idele class group of K with values in O_E^× for a finite extension E/ℚ_p. The preimage of a torsion-free open pro-p subgroup of O_E^× contains the unit group O_(K_w)^× for all but finitely many places w. For w not above p that unit group is a finite group times a pro-ℓ group with ℓ≠p, so its continuous image in a torsion-free pro-p group is trivial. Section 3.13 then gives ψ_p=r_(p,ι)(ψ) for an algebraic Hecke character ψ of K, algebraic in the sense of `TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic`, with exponents (a_τ).

Let K₀ be the maximal subfield of K that is imaginary CM or totally real. If K₀ is totally real, AutomorphicGaloisRepresentationsPartII AG2.0 gives 2a_τ=wt(ψ) for every τ, with wt(ψ) even. Then ψ is a finite-order character times an integer power of the norm, and ρ is finite up to twist, which is excluded. Hence K₀ is imaginary CM: either K₀=K is a quartic CM field and E=K⁺, or K₀=E is an imaginary quadratic subfield. In both cases K/E is quadratic; let σ be its nontrivial automorphism. Since ρ ≅ Ind_(G_E)^(G_ℚ)Ind_(G_K)^(G_E)ψ_p is irreducible, the inner induction is irreducible, so ψ≠ψ∘σ and AI_(K/E)(ψ) is cuspidal on GL₂(𝔸_E) (EndoscopicTransferAndUnitaryTraceComparison §13.3). Irreducibility of ρ also makes that representation non-isomorphic to its conjugate under Gal(E/ℚ), so its induction to GL₄(𝔸_ℚ) is cuspidal. Both inductions have all-place local parameters (ModularityAndLanglandsExtensions, Automorphic induction and its cuspidality criterion), and AG2.0 matches r_(p,ι)(ψ) with ψ_w at places w not above p. Hence at every prime ℓ≠p the local parameter of the GL₄ representation is, via ι and geometric reciprocity, the Frobenius-semisimple Weil–Deligne representation of ρ|_(G_(ℚ_ℓ)).

**Checks.**

- With ab=4, the possibilities b=1,2,4 give multiplicities 4,2,1; b=1 is excluded by the non-finite-up-to-twist hypothesis.
- For the quotient C₂ and trivial rank-two V₁, Ind V₁=1²⊕η² and ∧²Ind V₁=1²⊕η⁴ has trace −2 at the nonidentity coset. The determinant induction has trace 0; positive-flip As⁺ has trace 2, so its η-twist contributes −2. Omitting η would give the wrong sign.
- A finite Artin representation has all Hodge–Tate weights zero; a scalar twist changes them to one repeated weight and remains outside the unequal-weight surface case.
- Dropping ν(c)=−1 admits a tensor with even projective-A₅ Artin factor; dropping non-finiteness admits the projective-S₆ Artin case. Neither is a claimed automorphy conclusion.
- The reducible ρ=1⊕1⊕ε⁻¹⊕ε⁻¹, symplectic for the form pairing the two copies of 1 with the two copies of ε⁻¹, has multiplier ε⁻¹ with ν(c)=−1, is abelian and de Rham, and is not finite up to twist. Its characters 1 and ε⁻¹ are each fixed by Gal(L/ℚ), so they form two orbits and the decomposition of §5.12 fails; irreducibility is what makes the χ_i one orbit.
- For ρ=V⊗Ind_(G_F)^(G_ℚ)χ with V an odd Artin representation, F imaginary quadratic and χ of exponents 1 and 0 at the two embeddings, b=2 and a=2. The isotypic part V|_(G_F)⊗χ is finite up to twist although ρ is not, as the b=2 argument requires.
- If ψ=ψ₀∘N_(K/E) for a Hecke character ψ₀ of E, then ψ=ψ∘σ. The induction Ind_(G_K)^(G_E) r_(p,ι)(ψ) is r_(p,ι)(ψ₀)⊕r_(p,ι)(ψ₀)η_(K/E), and AI_(K/E)(ψ) is an isobaric sum, not cuspidal; irreducibility of ρ excludes this.
- For a totally real quartic inducing field, AG2.0 gives 2a_τ=wt at all four embeddings, so the exponents are parallel and the induction is finite up to twist. For a quartic CM field, exponents 0 and 1 at each pair of complex-conjugate embeddings give weight 1 and survive the nonparallel test.

Remark 10.2.6: dropping oddness would include V ⊗ Ind χ with V even of projective image A₅; dropping (3) would include odd Artin representations with projective image S₆ ⊂ PGSp₄(C), outside the conclusion of this theorem. (BCGP25 Lemma 10.2.5 and proof, §10.2, pp. 213–214, line 9896; BCGP25 Lemmas 10.2.3 and 10.2.4, pp. 212–213, line 9839; BCGP25 Remark 10.2.6, pp. 214–215, line 9959.)

*Needs:* ArithmeticGaloisRepresentations §5.12; ArithmeticGaloisRepresentations §7.1, Tensor induction; ArithmeticGaloisRepresentations §7.6; AutomorphicGaloisRepresentations §3.13; AutomorphicGaloisRepresentationsPartII AG2.0, The l-adic character of an algebraic Hecke character; AutomorphicGaloisRepresentationsPartII AG2.P, Finite-coefficient periods, descent and geometric comparison; Tau Ceti `TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic`; EndoscopicTransferAndUnitaryTraceComparison §13.3; ModularityAndLanglandsExtensions §1.9; ModularityAndLanglandsExtensions §1.11 and Automorphic induction and its cuspidality criterion; GL2AutomorphicRepresentationsAndTransfer R17.5.1 and R17.5.4–R17.5.7.

### 8.3 Endomorphism types and their compatible-system dictionary

For an abelian surface A/F over a number field F let L/F be the minimal finite Galois extension over which all geometric endomorphisms are defined. Its Galois type is the Galois endomorphism type of SatoTateGroups §8.7 (FKRS12 Definition 1.3); its 52-type number-field and 34-type rational-field classifications are SatoTateGroups §§9.7–9.8, with their dimension-two hypotheses discharged by §9.10. Specialize to F=ℚ for the rational classification. Here prove the comparison of that type with the ℓ-independent decomposition of H¹. The four alternatives are strong irreducibility (type A), a sum of two irreducible rank-two systems, irreducible potentially abelian systems, and induction from a quadratic field without potential abelianity. The last alternative divides into twists of the same rank-two system, E[D_n], and inequivalent inducing constituents, B[C₂] (BCGP25 §10.2, pp.211–212, lines 9785–9834; BCGP21 §9.2, pp.253–254, line 12166; FKRS12 Definition 1.3 and Theorems 1.4–1.5, pp.4–5, lines 167–194; Theorem 4.3, p.22, line 1002).

Finite generation and full-level descent of endomorphisms supply a finite field L. Compare the action on endomorphisms with the commutant of the restricted Tate module and its two-dimensional summands, retaining coefficient-field conjugates and the fields where idempotents are defined. The possible real geometric algebras are ℝ, ℝ×ℝ, ℝ×ℂ, ℂ×ℂ, M₂(ℝ) and M₂(ℂ); read their polarized finite-group actions and rational-field restrictions through the supplied classification (FKRS12 §4.1 and Theorem 4.3, pp.21–22, lines 987–1032). Type A is geometric End=ℤ. Type B[C₂] has rational End=ℤ but acquires ℚ×ℚ or real quadratic endomorphisms over a quadratic extension. This dictionary supplies the structural classification used in §8.4; no automorphy conclusion enters its definition.

- Base extension restricts the Galois action and can enlarge the fixed endomorphism algebra; geometric End remains fixed.
- Products with two nonisogenous elliptic factors defined over ℚ have two rational idempotents and reducible rank-four systems.
- In E[D_n] the compatible system is s⊗Ind(ψ⁻¹), with a fixed finite-order character ψ and an odd regular rank-two system s over ℚ.
- The potentially abelian classes have unequal Hodge–Tate values and no character twist with finite image; type B[C₂] is not absorbed into them.

**Checks.**

- For two nonisogenous non-CM elliptic curves over ℚ, End⁰=ℚ×ℚ, the two idempotents already descend, and the representation decomposes 2+2.
- For a quadratic Weil restriction of E not isogenous to its conjugate, Gal(L/ℚ) interchanges the two idempotents; the fixed algebra is the diagonal ℚ although the geometric algebra is ℚ×ℚ.
- The Jacobian of y²+(x³+1)y=x⁶+2x³−x has the cited B[C₂] real-quadratic example over ℚ(√5); this differs from the product algebra ℚ×ℚ, though both have dimension two over ℚ.
- An unmarked algebra ℝ×ℝ admits trivial and factor-swapping C₂-actions, whose fixed real dimensions are 2 and 1; forgetting the action loses the Galois type.

*Needs:* SatoTateGroups §§8.7, 9.7–9.8 and 9.10; ArithmeticGaloisRepresentations §§5.12, 6.4 and 7.6; AbelianSchemesAndArithmeticModuli A6.5, A6.7–A6.8, A6.12 and A6.20; FaltingsFinitenessAndIsogenyTheorems R28.4.

### 8.4 Automorphy for 32 of the 34 Galois types (Theorem 10.2.1)

Let A/ℚ be an abelian surface whose Galois type in the sense of Fité–Kedlaya–Rotger–Sutherland (§8.3) is neither A (End(A_ℚ̄) = ℤ) nor B[C₂] (End(A) = ℤ but End(A_K) ⊗ ℚ is ℚ × ℚ or a real quadratic field for some quadratic K/ℚ). Then A is modular in the sense of §0.1. The excluded type B[C₂] contains Res_(K/ℚ)E for non-CM E/K not isogenous to its conjugate, and simple surfaces of GL₂-type over K such as the Jacobian of y² + (x³ + 1)y = x⁶ + 2x³ − x (LMFDB 12500.a.12500.1, K = ℚ(√5)). (BCGP25 Theorem 10.2.1 and proof, §10.2, pp. 211–212, line 9790; BCGP25 Remark 10.2.2, p. 211, line 9792.)

The geometric and rational endomorphism rings are distinct data. The four compatible-system categories are §8.3; the 34-type classification is SatoTateGroups §§9.7–9.8.

Use §8.3 to separate reducible, potentially abelian and twisted-induced cases. Rank-two constituents of weights {0,1}, and the factor s of type E[D_n], are odd, irreducible and regular compatible systems, so they are modular by ClassicalSerreModularity R27.6, Theorem 10.1(i), with weight-two newforms; elliptic and GL₂-type factors over ℚ are also covered by the elliptic/GL₂-type suppliers. Compare their local factors at every finite place q at a coefficient prime not above q, by NeronModelsAndSemistableAbelianVarieties §6.10 for H¹ and AutomorphicGaloisRepresentations §§3.7 and 3.11 for the newform. In E[D_n] use the tensor-product and automorphic-induction theorems. In the irreducible potentially abelian cases H¹ has weights {0,0,1,1}; their unequal values, rather than four distinct weights, exclude finite image up to twist, so §8.2 applies at two distinct coefficient primes p and p′. The decomposition in §8.3 makes irreducibility and potential abelianity independent of the coefficient prime. The two GL₄ representations have the Euler factors of H¹(A) at almost every place, hence agree by AutomorphicLFunctionsAndLocalFactors AL.3, Strong multiplicity one for isobaric sums. At any finite place q use the comparison from §8.2 with coefficient prime different from q; in particular p is compared using p′.

**Checks.**

- For E₁×E₂, End⁰ has the two projection idempotents (1,0),(0,1), the rank-four system splits 2+2, and its modular witness has two constituents.
- The Hodge–Tate multiset {0,0,1,1} has two distinct values, whereas any character twist of a finite representation has one; this suffices for the potentially abelian application.
- Taking coefficient primes 5 and 7, the first comparison covers q=7 and the second q=5; both cover q=2 and 3, including ramified factors. Their common almost-everywhere factors identify a single automorphic witness.
- The exceptional type count is 34−2=32. For the Weil restriction of a non-CM elliptic curve not isogenous to its conjugate, geometric End⁰=ℚ×ℚ but rational End=ℤ, so it falls in B[C₂], not type A.
- A rank-two constituent cut out by an endomorphism idempotent is a weight-one Hodge structure with h^(1,0)=h^(0,1)=1. Its Hodge–Tate weights are {0,1}, regular, giving newform weight 1+1=2, and complex conjugation swaps the two Hodge lines, so its determinant at c is −1. A splitting into weights {0,0} and {1,1}, irregular and outside R27.6, cannot occur.

*Needs:* SatoTateGroups §§8.7, 9.7–9.8 and 9.10; AutomorphicLFunctionsAndLocalFactors AL.3, Strong multiplicity one for isobaric sums; §8.3; §8.2; ClassicalSerreModularity R27.6, Theorem 10.1(i): regular compatible systems; AutomorphicGaloisRepresentations §§3.7 and 3.11; NeronModelsAndSemistableAbelianVarieties §6.10; EllipticCurveModularity R29.6; EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.3; FaltingsFinitenessAndIsogenyTheorems R28.4; ModularityAndLanglandsExtensions §1.9; ModularityAndLanglandsExtensions §1.11 and Automorphic induction and its cuspidality criterion; §0.1.

### 8.5 The rational parameter space of genus-two curves with fixed 2-torsion (§10.3.5)

Let F be a field of characteristic 0 (a number field or a local field) and ρ̄ : G_F → GSp₄(𝔽₂) continuous. Through ι (§2.1), ρ̄ corresponds to a degree-6 étale F-algebra K = F[x]/f(x) (f separable of degree 6, the curve y² = f(x) having 2-torsion ρ̄). Fix the F-basis 1, x, …, x⁵ of K and identify K with the affine space A⁶_F. For θ ∈ K let χ_θ(T) be the characteristic polynomial of multiplication by θ, with roots σ_θ (the images of θ under the six geometric points of Spec K). Let Z(ρ̄) ⊂ A⁶_F be the complement of the hyperplanes σ_i(θ) = σ_j(θ), i ≠ j (defined over the splitting field; their union is defined over F). For θ ∈ Z(ρ̄)(F), X_θ : y² = χ_θ(x) is a smooth genus-two curve with Jac(X_θ)[2] ≅ ρ̄. Z(ρ̄) is a smooth rational variety, and the construction is compatible with field extensions and completions. For approximation use the enlarged family Z⁺(ρ̄) = Z(ρ̄) × G_m with X_(θ,c) : y² = c χ_θ(x). It is also smooth and rational and has the same 2-torsion, since a quadratic twist fixes the six branch points and acts trivially on 2-torsion. Every genus-two curve over an infinite characteristic-zero field with this marked six-point Galois set occurs in this family after a change of coordinate on its hyperelliptic quotient P¹: choose a rational nonbranch point for infinity, identify its finite branch algebra with K, and retain the nonzero leading coefficient c. The monic subfamily alone need not represent that local quadratic twist. (BCGP25 §10.3.5, p. 219, line 10159.)

The characteristic-zero field is infinite, and c is nonzero; every base change is along a field embedding. The field case and the product-algebra case are both included.

Use the canonical hyperelliptic map of a genus-two curve to ℙ¹. Over an infinite characteristic-zero field choose a rational nonbranch point for infinity. The resulting sextic is c times a monic characteristic polynomial of a primitive element of the branch algebra. Keeping c∈Fˣ realizes every quadratic twist, and base change preserves the distinct-conjugate open.

The comparison and construction API consists of the following facts.

- The degree-6 étale algebra K attached to ρ̄ through ι.
- The open subscheme Z(ρ̄) ⊂ A(K) ≅ A⁶ of elements with six distinct conjugates.
- For θ ∈ Z(ρ̄)(F), the curve X_θ : y² = χ_θ(x).
- Jac(X_θ)[2] ≅ ρ̄ as G_F-modules.
- Z(ρ̄) is smooth and rational over F.
- Z(ρ̄|_(G_F′)) ≅ Z(ρ̄) ×_F F′ for F → F′ an extension or completion.
- For F a local field and ρ̄ unramified, the factorization type of K ⊗ F is the cycle type of ρ̄(Frob).
- Z⁺(ρ̄) = Z(ρ̄) × G_m is smooth and rational; (θ,c) gives y² = cχ_θ(x), recovering X_θ at c = 1.
- Over an infinite characteristic-zero field every genus-two curve with a chosen identification of its six-point Galois set with Spec K is isomorphic to X_(θ,c) for some (θ,c) ∈ Z⁺(ρ̄)(F), after a coordinate change on P¹.
- Changing c to dc gives the quadratic twist by d without changing the identified Jac[2]. Z⁺ and its curve family commute with extension of scalars.

**Checks.**

- If ρ̄ is trivial, K = F⁶ and Z(ρ̄) is the complement of the 15 hyperplanes θ_i = θ_j in A⁶; X_θ : y² = ∏(x − θ_i).
- If K is a field, θ ∈ Z(ρ̄)(F) exactly when θ generates K, and χ_θ is its minimal polynomial.
- θ = 0 ∉ Z(ρ̄): all conjugates coincide, so χ_θ = T⁶ gives no curve.
- If K = F × K′ with K′ of degree 5, X_θ has a rational Weierstrass point and ρ̄ lands in S₅(b) (§2.2).
- For separable χ_θ and d ∈ F×, the models y² = χ_θ(x) and y² = dχ_θ(x) have the identical six-point Galois set and identified Jac[2]; for nonsquare d the two points at infinity need not be rational. The family must allow c = d as well as c = 1.
- For K=ℚ⁶, θ=(0,1,2,3,4,5) has 15 nonzero pairwise differences; (θ,2) belongs to Z×G_m and gives y²=2∏_(i=0)^5(x−i). The product has dimension 6+1=7; c=0 is excluded, while c=1 recovers the monic family.
- For θ=0 the characteristic polynomial is T⁶, all 6 conjugates coincide and the discriminant is zero, so θ is excluded.
- For a nonsquare d, replacing c=1 by c=d leaves the six branch points and 2-torsion unchanged but the two infinities need not be rational; a monic-only family misses that twist.

The family uses InverseGaloisAndArithmeticFundamentalGroups IG.2.7 in the realization of §8.7. (BCGP25 §10.3.5, p. 219, line 10159.)

*Needs:* §2.1; AbelianSchemesAndArithmeticModuli A3.12; PolynomialGaloisGroups Layer 0; AlgebraicCurves Layers 5, 10 and 11.

### 8.6 Trivial Frobenius at 3 obstructs the local seed (Remark 10.3.8)

If ρ̄ : G_ℚ → GSp₄(𝔽₂) is unramified at 3 with ρ̄(Frob₃) = 1, there is no genus-two curve X with good reduction at 3 and Jac(X)[2] ≅ ρ̄ as G_ℚ₃-modules, and no product E₁ × E₂ of elliptic curves with good ordinary reduction at 3 and trivial 2-torsion action of Frob₃. (BCGP25 Remark 10.3.8, p. 221, line 10292.)

Good curve reduction at 3 and trivial 2-torsion Frobenius would give six distinct rational branch points on ℙ¹(𝔽₃), which has only four points. For an ordinary elliptic product, full rational 2-torsion gives 4∣#E(𝔽₃); the Hasse interval forces #E=4, trace zero and supersingularity.

**Checks.**

- The branch-point demand is 6, but #ℙ¹(𝔽₃)=3+1=4, leaving a deficit of 2.
- The Hasse interval for #E(𝔽₃) contains integers 1 through 7; its only positive multiple of 4 is 4, giving trace 3+1−4=0.
- A nonidentity Frobenius partition [2,2,2] has 0 rational branch points and escapes the six-point obstruction; this does not require good curve reduction for the constructed local Jacobian.

This is why Lemma 10.3.6 and Theorem 10.3.9 assume ρ̄(Frob₃) ≠ 1. (BCGP25 Remark 10.3.8, p. 221, line 10292.)

*Needs:* §2.2; §8.5; EllipticCurves Layer 3.

### 8.7 Realizing an ordinary mod-2 representation by a good surface

Let ρ̄:G_ℚ→GSp₄(𝔽₂) be continuous, unramified at 3 with nonidentity Frobenius. Prescribe an ordinary finite flat model W over ℤ₂ of order 16, killed by 2, whose generic fibre is the symplectically identified residual module and which admits a Cartier self-duality. Subject to the dyadic skew-self-duality and integral-neighbourhood contracts, prove that there is an abelian surface A/ℚ with good ordinary reduction at both 2 and 3, 3-distinguished reduction at 3, surjective mod-3 representation, residual H¹ modulo 2 isomorphic to ρ̄, and an isomorphism A[2]/ℤ₂≅W of underlying finite flat group schemes. Its polynomial at 2 satisfies Q(X)≢(X²±X+2)² modulo 3. The conclusion preserves the specified W, not every chosen self-duality on W. (BCGP25 Lemma 10.3.6 and proof, §10.3, pp. 219–221, line 10182; BCGP25 Lemma 10.3.1, Remark 10.3.2 and the proofs, pp. 215–218, line 9981; BCGP25 Remark 10.3.10, pp. 221–222, line 10313.)

Apply approximation on Z⁺ with the separate integral W-neighbourhood contract, the generic level-three monodromy contract, and the local seeds below. The [2,2,2] curve of BCGP25 p.220 has repeated polynomial (X²+2X+3)² and is not 3-distinguished. For this partition use the Weil restriction with polynomial X⁴−2X²+9; its deformation to a nearby Jacobian is the Weil-restriction seed target below. At 2 the three possible rank-two étale Frobenius actions have orders 1,2,3. The dyadic skew-self-duality contract turns the Cartier self-duality of W into one with λ^∨=−λ; then AbelianSchemesAndArithmeticModuli A4.13 lifts the matching special fibre to a principally polarized abelian scheme over ℤ₂ with 2-torsion the specified underlying W. This argument is conditional on those local statements; Cartier self-duality alone is not substituted for their proofs.

Prove the Weil-restriction seed at 3. Let E/𝔽₉ be y²=x(x−1)(x−t), t²=−1. The surface A₀=Res_(𝔽₉/𝔽₃)E is ordinary and principally polarized: over 𝔽₉ its polarization is the product of the canonical elliptic polarizations and descends under factor interchange. Its Weil polynomial is X⁴−2X²+9. Lift A₀ with its polarization to ℤ₃ by the ordinary canonical lift of AbelianSchemesAndArithmeticModuli A4.10, with effectivity from A4.8. Choose the corresponding level-three twist B(ρ̄). The polarized Serre–Tate deformation space of A₀ has dimension three; its sufficiently small ℚ₃-valued deformations algebraize and retain the identified special fibre A₀. Apply the unmarked Torelli open of §4.8 in this neighbourhood, and the local-neighbourhood contract for the finite torsion, to obtain a smooth genus-two curve X/ℚ₃ whose principally polarized Jacobian has good ordinary 3-distinguished reduction to A₀ and unramified mod-2 type [2,2,2]. No good curve reduction or rational Weierstrass point is asserted. This supplies the local seed required by BCGP25 Lemma 10.3.6 (pp.219–220, lines 10182–10220), using the Torelli passage of BCGP21 p.269, line 12976.

- The principal polarization on A₀ descends from the product polarization, and the lift and deformation preserve it.
- The nearby Jacobian retains A₀ as its polarized special fibre, so its quartic remains X⁴−2X²+9, with ordinary middle coefficient −2 and no repeated root.
- Its finite étale 2-torsion is unramified with the same symplectic Frobenius as A₀[2]; the six odd theta characteristics have three orbits of length two.
- The seed is unmarked. Its type has no fixed odd theta characteristic, so the construction uses B and its unmarked Torelli open rather than P.

At 3 the nine other nonidentity partitions use the following local curve models; their good ordinary and distinguished assertions are the finite local targets of BCGP25 Lemma 10.3.6, p.220, line 10213. For [2,2,2] use the Weil-restriction seed target instead.

| Partition | f(x) in y²=f(x) |
| --- | --- |
| [1,1,1,1,2] | 4x⁵+32x⁴+64x³+x²+4x |
| [1,1,1,3] | 4x⁵−7x²+4x |
| [1,1,2,2] | 4x⁵−11x⁴+6x³+3x²−2x+1 |
| [1,1,4] | x⁶+4x⁵−6x⁴−32x³+x²+64x+28 |
| [1,2,3] | x⁶+2x⁵+5x⁴+4x³−4x−8 |
| [1,5] | x⁶+2x⁵+3x⁴−x²+2x+1 |
| [2,4] | x⁶+2x⁴+2x³+5x²+2x+1 |
| [3,3] | x⁶+2x⁵+5x⁴−10x³+10x²−4x+1 |
| [6] | x⁶+4x⁵−6x⁴+2x³+x²−2x+1 |

At 2 the three reference curves, their special-fibre Weil polynomials and the action on the two-dimensional étale quotient are as follows (BCGP25 p.221, lines 10273–10290).

| f(x) in y²=f(x) | Q(X) at 2 | Étale Frobenius |
| --- | --- | --- |
| −4x⁵+x⁴+6x³−3x²−4x | X⁴−X²+4 | identity |
| x⁶−12x⁴+2x³+16x²+8x+1 | X⁴+2X³+3X²+4X+4 | order-two Jordan block |
| x⁶−4x⁵+2x⁴+2x³+x²−2x+1 | X⁴+3X³+5X²+6X+4 | order three |

The middle curve has smooth generalized model y²+(x³+1)y=−3x⁴+4x²+2x and Jacobian point group ℤ/14 at 2. The special-fibre étale quotient is thereby distinguished from the identity case, although its characteristic polynomial modulo 2 is the same. The prescribed integral extension W is additional data, not determined by that quotient.

**Checks.**

- For E/𝔽₉:y²=x(x−1)(x−t), t²=−1, #E(𝔽₉)=8 and trace 2, so its Weil restriction has Q=X⁴−2X²+9 and Q(1)=8=#E(𝔽₉), with b=−2 prime to 3 and four distinct roots.
- All four points of E[2] are rational over 𝔽₉. On the product after base change Frobenius at 3 interchanges the two symplectic rank-two summands. An odd quadratic refinement has parities (odd,even) or (even,odd), giving 1·3+3·1=6 refinements and 0 fixed ones: partition [2,2,2].
- For Q=X⁴−2X²+9, Q′=4X(X²−1), and Q(0)=9, Q(1)=Q(−1)=8, so gcd(Q,Q′)=1 in characteristic zero. Reducing modulo 3 gives X²(X²+1), which must not be used as the characteristic-zero repeated-root test.
- The Serre–Tate parameter equal to 1 gives the decomposable canonical lift, outside the Torelli open; parameters sufficiently close to 1 in that open retain the same decomposable special fibre. Good Jacobian reduction therefore does not imply good curve reduction.
- The dyadic three étale orders 1,2,3 have reference quartics X⁴−X²+4, X⁴+2X³+3X²+4X+4, X⁴+3X³+5X²+6X+4; none reduces to a forbidden squared quadratic modulo 3.
- The order-two étale seed has Q(1)=14, so its group of rational points cannot contain (ℤ/2)²; the étale action is the nontrivial Jordan block. Conjugate generic modules can still have distinct integral W.
- An unramified order-five action has minimal polynomial X⁴+X³+X²+X+1 over 𝔽₂: 2,4,3,1 are the successive powers of 2 modulo 5. It has no invariant rank-two quotient, whereas an ordinary model requires one.
- For the split model W=(ℤ/2)²⊕μ₂², the hyperbolic pairing of the étale part with the multiplicative part satisfies λ^∨=λ=−λ and pairs every point with itself to 1, so A4.13 applies without the skew-self-duality contract. A nonsplit ordinary extension needs that contract to produce such a pairing from an arbitrary Cartier self-duality.

For ρ̄|_(G_ℚ₂) unramified of order 5, ρ̄ is finite flat with an étale model, but has no ordinary filtration and no finite flat W with this generic fibre is Cartier self-dual, so no abelian surface over ℤ₂ has A[2] ≅ ρ̄. (BCGP25 Lemma 10.3.6 and proof, §10.3, pp. 219–221, line 10182; BCGP25 Lemma 10.3.1, Remark 10.3.2 and the proofs, pp. 215–218, line 9981; BCGP25 Remark 10.3.10, pp. 221–222, line 10313.)

*Needs:* §8.5; InverseGaloisAndArithmeticFundamentalGroups IG.2.5 and IG.2.7; AbelianSchemesAndArithmeticModuli A4.8, A4.10, A4.12–A4.13 and A6.32–A6.33; §4.8 (unmarked Torelli open); §4.2; §4.1; §5.1; NeronModelsAndSemistableAbelianVarieties §§6.11–6.13 and local-neighbourhood contract; §8.6; §0.2.

### 8.8 Ordinary residual modularity modulo 2

Under the hypotheses and the dyadic skew-self-duality and integral-neighbourhood supplier contracts of §8.7, ρ̄ is ordinarily modular of weight two and level prime to 6: there is a cuspidal GSp₄ representation of weight (1,1;2) and central character |·|², spherical at 2 and 3, ordinarily stabilized at 2, whose residual ordinary attachment at 2 is ρ̄. Retain the nonregular-lifting and classification premises used in Theorem A and the spherical-attachment contract. This includes residual images A₆ and S₆ with these local hypotheses. (BCGP25 Theorem 10.3.9 and proof, §10.3, p. 221, line 10302; BCGP25 §10, introduction, and §1.5, pp. 7 and 209, line 293.)

Retain the classification and lifting premises of the exact supplier contracts in this automorphic conclusion.

Apply §8.7 and Theorem A to its surjective-mod-3 surface. Select a global representation with the prescribed general-type Arthur parameter, spherical at both 2 and 3, using the ordinary spherical-attachment contract, and compare its ordinary 2-adic attachment with H¹(A) before reducing. The initial attachment at 3 alone does not imply the conclusion at 2.

**Checks.**

- The chosen local level is prime to 6, meaning spherical at both 2 and 3; ordinarity at 2 concerns a stabilization of that spherical member.
- The full symmetric and alternating images have orders 720 and 360; neither image alone supplies the integral W or the nonidentity triadic Frobenius hypothesis.
- An unramified dyadic residual image of order 5 is finite flat as an étale group of order 16. Since ord₅(2)=4, its four-dimensional action is irreducible and has no rank-two ordinary quotient. Its finite flat models are étale or multiplicative, hence none is Cartier self-dual; generic finite flatness does not suffice.

The residual images A₆ and S₆ are the cases advertised in §1.5 and §10. (BCGP25 Theorem 10.3.9 and proof, §10.3, p. 221, line 10302; BCGP25 §10, introduction, and §1.5, pp. 7 and 209, line 293.)

*Needs:* §8.7; §7.3; §7.2; §1.2; §0.3; GSp4NonregularModularityLifting NR2.5–NR2.6.

### Examples

The local density is (39/128)(854/2187)=5551/46656. The Weil-restriction [2,2,2] seed at 3 has polynomial X⁴−2X²+9. A quadratic Weil restriction can have rational End=ℤ while its geometric algebra is ℚ×ℚ, so the endomorphism-action dictionary cannot be replaced by the rational ring alone.

### Dependencies

The statement carriers and proof inputs are the section-specific Needs lists above. Use Layers 0–7 and the endomorphism-type dictionary §8.3. The mod-2 branch additionally uses integral W-openness, Weil-restriction [2,2,2] local realization and universal level-three monodromy.

## Downstream consumers

The abelian-surface endpoints supply the cuspidal and isobaric modularity inputs for arithmetic L-functions, special values and modularity comparisons. The fixed-mod-3 infinity theorem and the fixed-mod-2 realization family are reusable in potential modularity and prescribed-torsion problems. The mod-2 residual theorem supplies ordinary weight-two seeds for residual images A₆ and S₆ with its integral and triadic hypotheses. Consumers inherit the exact classification and lifting premises, the specified local factors, and the distinction between the chosen integral model and its generic representation.

## Worked examples

The local examples of Layers 4 and 5 give a complete switch chain. Start with any prime-to-3-polarized surface satisfying §7.2. Its mod-3 representation fixes the twisted marked family P. The dyadic table supplies one of eight ordinary semistable distinguished classes, with class 2C supplied by the coupled-period seed fixing two odd theta characteristics; §5.3 supplies its triadic finite-flat module, including both scalar signs. The real polynomial x(x²+1)(x²+2) fixes the double-transposition open. Approximation away from all proper S₅ subgroup covers produces a Jacobian B with the same mod-3 representation and mod-2 image S₅(b). Modularity at 2 for B followed by the ordinary spherical attachment at 3 and odd-prime transfer proves modularity of the original surface. Every local datum in this example is a hypothesis or a named result above, including the negative controls for the two forbidden classes (BCGP25 proof of Theorem 9.5.2, p.207, line 9609).

For the residual-mod-2 endpoint, the triadic Weil restriction has #E(𝔽₉)=8, so its quartic is X⁴−2X²+9. It is ordinary since 3 does not divide −2. Its four roots are distinct because its quadratic in X² has discriminant −32, neither zero nor a zero-root case. Its mod-2 action swaps the two rank-two summands and has partition [2,2,2]. The Weil-restriction seed target of §8.7 gives a Jacobian point of Z⁺ at 3, while the dyadic skew-self-duality contract, A4.13 and the neighbourhood contract supply the point at 2, after which approximation outside the mod-3 proper-image locus and Theorem A give §8.8. The repeated polynomial (X²+2X+3)² of the conductor-7165 curve would fail this example's distinguishedness test (BCGP25 pp.219–221, lines 10182 and 10220; Weil-restriction seed of §8.7).

## References

All source statements are paraphrased. Line locators use the numbered legal extractions for the source identifiers below; theorem, section and printed-page locators refer to the specified editions. The three works marked uncertified are cited by locator alone.

- **BCGP25.** G. Boxer, F. Calegari, T. Gee, V. Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), arXiv v1 (2025). Definitions 1.8.10, 1.8.25; §6.4; §§8–10, pp.149–151, 179–222. The endpoint locators and formulas are attached to their statements above.
- **BCGP21.** The same authors, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/abs/1812.09269v3), arXiv v3 (2021). Remark 9.1.7 and Definition 9.1.8, p.251, lines 12056–12072; §9.2, pp.253–254; Definition 10.2.2, Proposition 10.2.3 and Lemma 10.2.4, pp.269–271, lines 12966, 12991 and 13038. These locators use the preprint: rationality of the twist is Lemma 10.2.4, rather than an assertion named Theorem 10.2.3.
- **ZARHIN00.** Y. G. Zarhin, [Hyperelliptic jacobians without complex multiplication](https://arxiv.org/abs/math/9909052v2), arXiv v2 (1999), published 2000. §3 and Lemma 3.1, pp.3–4, line 113; Theorem 4.1, p.5, line 186. The general-surface application is the separate endomorphism adapter.
- **FKRS12.** F. Fité, K. S. Kedlaya, V. Rotger, A. V. Sutherland, [Sato-Tate distributions and Galois endomorphism modules in genus 2](https://arxiv.org/abs/1110.6638v2), arXiv v2 (2012). Definition 1.3, Theorems 1.4–1.5, pp.4–5, lines 167–194; Theorem 4.3 and Tables 8,11.
- **KIS99.** M. Kisin, [Local constancy in p-adic families of Galois representations](https://doi.org/10.1007/PL00004706), Math. Z. 230 (1999), 569–593, Theorem 5.1. Uncertified: cited by its locator alone. The exact local-neighbourhood contract, including integral W-openness, is a supplier requirement rather than an attributed consequence beyond that locator.

- **WHITMORE22.** D. Whitmore, [The Taylor–Wiles method for reductive groups](https://arxiv.org/abs/2205.05062v4), arXiv v4 (2026). Definition 3.15, p.22, line 936; Definition 3.19 and Lemma 3.20, pp.23–24, lines 1011–1024; §4.3, pp.38–39, lines 1648–1688. Reasonableness is a condition on a Galois representation at every sufficiently deep cyclotomic level, rather than only on its full image.
- **THORNE17.** J. A. Thorne, [A 2-adic automorphy lifting theorem for unitary groups over CM fields](https://doi.org/10.1007/s00209-016-1681-2), Math. Z. 285 (2017), Definition 2.20. Uncertified: cited by its locator alone; the near-adequacy comparison used here is also stated in BCGP25 Remark 8.2.3, p.182, line 8404.

- **FC90.** G. Faltings, C.-L. Chai, [Degeneration of Abelian Varieties](https://doi.org/10.1007/978-3-662-02632-8), Springer (1990), Chapter II Theorem 6.2 and Remark 6.3, pp.51–52; Chapter III Theorem 7.1 and Corollaries 7.2–7.4, pp.76–77. Uncertified: cited by locator alone; polarized toric algebraization is consumed from ShimuraCompactifications C4.4–C4.6, and its torsion and pairing comparison from NeronModelsAndSemistableAbelianVarieties §3.14.
