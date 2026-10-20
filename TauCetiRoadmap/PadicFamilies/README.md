# Roadmap: Hida and Coleman families, period modules, and family L-functions

**Summary.** Build integral ordinary families of modular forms, their period modules and two-variable measures, and finite-slope families through the modular-symbol eigencurve. The central comparisons are ordinary control, rank-one freeness under residual multiplicity-one hypotheses, the eigenvariety's finite-slope charts, and Bellaïche's one-dimensional critical eigensymbol theorem at decent refinements. The final layers construct the compatible Galois representations and reciprocity maps, and extend the ordinary construction to totally real fields. Integral lattices, coefficient radii, and the two independent weight variables remain visible throughout these comparisons.

## Scope and ownership

This roadmap owns the passage from single forms and single-weight symbols to families. It uses the shared rational ordinary towers and control of `IntegralIwasawaTheory`, §9.0, and constructs their Katz and weight-coordinate comparisons, the odd-prime cuspidal extension, integral homology period modules, branch congruence modules, distribution coefficients varying over weight space, the global family eigenmodule sheaf, and its additional Eisenstein critical L-functions. The cuspidal local critical suite, including its local families and secondary functions, belongs to `ModularSymbolsPadicLFunctions`, §3.0; its identification with the global model is §2.7a here. It also owns the ordinary and Coleman-family Galois and regulator applications needed here. A period is a trivialisation of a module; its existence and its comparison with a different integral period convention are separate theorems.

Classical eigenforms, newforms, their conductors and full bad-prime eigenproperties belong to `ModularForms`, Layer 4, and the semisimple Hecke algebra of the newspace to its Layer 8G. Integral modular curves, their Jacobians, degeneracy correspondences and ordinary special-fibre geometry belong to `ModularCurvesPartII`, §§3–5, 7, 13–17. The single-weight symbol, refinement, integral eigensymbol lattice, one-variable interpolation theorem and cuspidal local critical suite belong to `ModularSymbolsPadicLFunctions`, Layers 0–2 and §3.0. That roadmap and this one share the symbol conventions below. Measures and completed group algebras belong to `PadicMeasuresIwasawaAlgebras`, whose §5.2 also supplies topological Nakayama. The canonical Kubota–Leopoldt object and its arithmetic normalization come from `IntegralIwasawaTheory`, §§5.0 and 6.3. The arithmetic Eisenstein measures, localized constants and character interpolation come from its full-character adapters in `DirichletPadicLFunctions`, §§1.6 and 5.4–5.9; §0.12 here adapts them to the angular weight coordinate and identifies their common ordinary family with `IntegralIwasawaTheory`, §9.0.

Two further algebraic constructions come from existing roadmaps. `IntegralHeckeAndGaloisDeterminants`, §2.3, supplies the factorial idempotent in a finite commutative algebra and the Artinian derived telescope comparison. Its §0.6, using `PadicMeasuresIwasawaAlgebras` §5.1, supplies the determinant of a finite projective module. Their noncommutative-action and projective characteristic-polynomial extensions are specified in the supplier contracts below. The extension to complete local perfect complexes, the locally finite action on modules of infinite rank, and the derived ordinary direct factor under a perfectness hypothesis are additional results of this roadmap. Mathlib supplies the algebraic Fitting decomposition itself; the explicit factorial projection and its compatibility with that decomposition are the additional finite-set statements here.

The Banach and Fredholm operations used below are those of `LocallyAnalyticDistributions`, Layer 4. This roadmap constructs their spectral spaces and finite Hecke charts and proves that the actual family coefficient systems satisfy the required analytic hypotheses. General rigid geometry remains in `RigidAnalyticGeometry`, §§1.1–1.5, 6.1–6.3 and 7.1–8.3, `AdicSpacesPartII`, R0–R1, and `AdicSpacesPartIII`, F0, R2 and R3. General Galois cohomology, derived control and determinant constructions remain in `SelmerIwasawaCohomology`, §§2.21–2.24 and 3.8–3.14, and `ArithmeticGaloisDuality`, D7; this roadmap must verify their hypotheses for its representations and local conditions. The definite automorphic spaces and Jacquet–Langlands comparisons remain in `HilbertModularVarietiesAndShimuraCurves`, R18.3, and `GL2AutomorphicRepresentationsAndTransfer`, R16.6. The unquotiented carrier and its finiteness come from `QuaternionicModularForms`, §0.3; Layer 5 relates this carrier to the central quotient and proves compatibility along the family tower.

## Conventions

Write `p` for a rational prime, `E/ℚ_p` for a finite extension, `𝒪` for its valuation ring and `ϖ` for a uniformiser. An assertion for `ℤ_p` does not silently assert the same formula with `p` as a uniformiser of a ramified coefficient ring. The ordinary projector arguments allow complete noetherian local coefficient rings with finite residue field, including equal-characteristic ones. The classical Hida construction in Layer 0 assumes `p ≥ 5`; the bounded-weight argument includes the endpoint `p = 5`, as specified in §0.9. Sign decompositions assume `p ≠ 2`. The finite-set algebra in Layer 0a has no prime restriction.

For odd `p`, put `Γ_w = 1 + pℤ_p` and `Λ_w = 𝒪[[Γ_w]]`. Choosing `γ_w = 1 + p` identifies `[γ_w]` with `1 + X`. In Hida's modular-form convention the weight-`k` ideal is `P_k = (1 + X − (1 + p)^k)`; in distribution-valued symbols the polynomial degree is `k` and the corresponding modular-form weight is `k + 2`. Each occurrence of `k` specifies which convention is in force. The finite character `ω^a` of `μ_{p−1}` is retained: specialisation in one component produces the character `ω^{a−k}`, and erasing it changes the classical form.

The cyclotomic variable is independent of the weight variable. Write `[z]_cyc` for the group element in `𝒪[[ℤ_p^×]]` and `D_ℓ` for the Hecke diamond in a family coefficient algebra. These are different elements even when both are denoted by angle brackets in a source. With right coefficient actions, transposed differentiation has its determinant twist, and an application of `Θ^{k+1}` shifts the `U_p`-slope by `k + 1`. A fixed-radius Banach dual, its completed scalar extension and the full continuous dual over the scalar-extended function algebra are distinguished.

The homology tower uses trace maps. A family period is a coordinate map `θ^± : M^± ≅ 𝕋`; its inverse at 1 is the chosen basis. Thus `θ′ = uθ` multiplies the scalar measure by `u`, while its inverse basis is multiplied by `u⁻¹`. The saturated cohomological eigensymbol line is dual to a homology eigenquotient only after an integral pairing and control theorem, with the coefficient lattice specified. Rational Eichler–Shimura alone gives no assertion about an integral unit ratio.

A refinement `f_β` has **critical slope** when `v_p(β) = k + 1` for weight `k + 2`. Criticality concerns failure of the classical specialisation on its eigenspace, and `θ`-criticality concerns the image of `Θ^{k+1}`. They are distinct definitions. Local assertions at a decent point refer to the local Hecke algebra and its actual ramification index, not to an arbitrary rank-one sheaf generator. In Galois applications, the EPW Hecke normalisation and Ochiai's cohomological normalisation are related only by the explicit dual, Tate, Teichmüller and universal-character comparison in Layer 4. Frobenius conventions are pinned there before Euler factors or local ordinary characters are compared.

## Exact supplier contracts

### From Mathlib and Tau Ceti

At Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, use `Module.End`, `Module.End.pow_apply`, `IsIdempotentElem`, `Commute`, `IsCompl`, and the projection API of `LinearMap`. In `Mathlib.RingTheory.Artinian.Module`, `LinearMap.isCompl_iSup_ker_pow_iInf_range_pow` supplies the Fitting decomposition of an Artinian noetherian module, with `eventually_isCompl_ker_pow_range_pow`, `eventually_iInf_range_pow_eq`, and `eventually_iSup_ker_pow_eq` giving its stabilisation. These assertions require both chain conditions; a finite underlying set supplies them, whereas an arbitrary finite-dimensional vector space over an infinite field does not supply finite-set factorial convergence.

Use `Nat.dvd_factorial`, `Nat.self_le_factorial`, `Nat.factorial_dvd_factorial`, `Function.iterate_add` and `Function.iterate_mul` for the finite orbit argument. `IsLocalRing.finite_quotient_iff` and `Ideal.finite_quotient_pow` supply the finite quotients of a complete local ring with finite residue field. `IsAdicComplete`, `IsLocalRing.maximalIdeal`, `Module.Finite`, `Module.Free` and `Module.Projective` retain their library meanings. `Submodule.torsionBySet`, `Submodule.mkQ`, `Submodule.mapQ` and `Ideal.map` implement annihilated submodules and raw congruence quotients. `HomologicalComplex`, `CochainComplex`, `HomotopyCategory` and `DerivedCategory` supply categories and homology, not the complete-flat minimal-model comparison used below. `LocalizedModule` and `Module.AEval'` give the module localisation at the polynomial operator. Finite cofiltered inverse systems use `nonempty_sections_of_finite_cofiltered_system`; the inverse-system specialization is `nonempty_sections_of_finite_inverse_system`. The former applies to any small cofiltered category, without countability: a system of nonempty finite fibres has a section. Thus a natural family of short exact module sequences with finite kernels remains exact on inverse limits, even when the middle and quotient modules are infinite. Use the finite fibres of a prescribed quotient section; no compact topology on an infinite middle module is assumed. This is the library compactness input used in §0a.15 (source: [KT](#ref-kt), proof of Lemma 2.13, p. 11).

Tau Ceti's `HeckeRing.GL2.Newform` (`TauCeti.NumberTheory.ModularForms.Newforms.Newform`) and `HeckeRing.GL2.heckeUNat` (`TauCeti.NumberTheory.ModularForms.HeckeSlash.BadPrime.Basic`) provide existing classical carriers and operators. The good-index equations bundled in `Newform` must be supplemented by `ModularForms`, Layer 4, when full bad-prime eigenproperties are needed, and by its Layer 8G when semisimplicity is needed. Neither this carrier nor Mathlib's free-module `LinearMap.charpoly` asserts that arbitrary family modules are free.

### From IntegralHeckeAndGaloisDeterminants and PadicMeasuresIwasawaAlgebras

*Uses.* `IntegralHeckeAndGaloisDeterminants`, §2.3 (*Factorial powers*): for a complete noetherian local ring `R` with finite residue field, a finite commutative `R`-algebra `B` and `t ∈ B`, there is an idempotent `e_t ∈ B` such that for every `k`, `t^{n!} − e_t ∈ (𝔪B)^k` for all large `n`; modulo each maximal ideal of `B`, `e_t` is 0 when `t` lies in that ideal and 1 otherwise. Its §2.2 supplies the finite local factors of `B` (`HeckeImage.finite_local_factors`) and the splitting of an idempotent endomorphism of a complex in `D(A)` (*Specified idempotent summands*); §2.3 (*Comparison with an idempotent* and *Ordinary finiteness*) supplies the telescope comparison for bounded complexes with finite cohomology over an artinian local ring.

*Required in addition, proved here.* Write `ordinaryIdempotent` `e_t` for the idempotent attached to `t` in a finite, possibly noncommutative, `R`-algebra `A`: apply §2.3 to the commutative subalgebra `R[t] ⊆ A`, which is a finite `R`-module and closed in `A` by Artin–Rees, so `ordinaryIdempotent_mem_adjoin` `(e_t ∈ R[t])` holds by construction and `isIdempotentElem_ordinaryIdempotent` is the supplier's idempotence. Prove `tendsto_pow_factorial_ordinaryIdempotent` with an explicit threshold: `e_t − t^{n!} ∈ 𝔪^kA` for `n ≥ |A/𝔪^kA|`, by §0a.1 applied to left multiplication by `t` on the finite set `A/𝔪^kA`. Prove `ordinaryIdempotent_smul`: on every finite `R`-module carrying the algebra action, `e_t` acts as that module's factorial projector (§0a.14), since both are limits of the same powers of `t`. Prove `map_ordinaryIdempotent`: a homomorphism of finite `R`-algebras carrying `t` to `t′` carries `e_t` to `e_{t′}`, because it is continuous and commutes with the factorial powers. This is the interface used below, including when `A` is an endomorphism algebra.

**Checks.**

- In `ℤ_p × ℤ_p`, the operator `(1, p)` has projector `(1, 0)`.
- A unit gives 1 and a topologically nilpotent element gives 0; `p^{n!}` is never zero in `ℤ_p`, despite having limit zero.
- In the matrix algebra on `ℤ_p²`, `t = (1 1; 0 p)` has projector `(1 (1 − p)⁻¹; 0 0)`. Indeed the upper-right entry of `t^m` is `(1 − p^m)/(1 − p)`, and `1 − p` is a unit. The result belongs to `ℤ_p[t]` but is not central in the matrix algebra.
- A nilpotent element has projector zero: once `n!` exceeds its nilpotence exponent, its factorial power is exactly zero.
- A finite module over the discrete field `ℂ`, with `t = 2`, has no convergent factorial-power projector: the finite-residue hypothesis cannot be replaced by module finiteness alone.

*Uses.* `IntegralHeckeAndGaloisDeterminants`, §0.6 (*Determinant of a finite projective representation*): for `P` finite projective of constant rank `d` over a commutative ring `A` and an `A`-algebra map `ρ : B → End_A(P)`, the degree-`d` multiplicative law `D_ρ`, which acts on `∧^d P` as multiplication by a scalar, equals det for a basis and commutes with scalar extension. It rests on the determinants of finite projective modules of constant rank and their base change in `PadicMeasuresIwasawaAlgebras`, §5.1.

*Required in addition, proved here.* Define `projCharpoly` `f := Q_f(X) = D(1 − Xf) ∈ A[X]`, the law of §0.6 for `f` after scalar extension to `A[X]`, rather than the monic characteristic polynomial. Prove `projCharpoly_constantCoeff` `Q_f(0) = 1`, `projCharpoly_natDegree_le` `deg Q_f ≤ d`, `projCharpoly_baseChange` for every scalar extension, `projCharpoly_eq_charpoly_reverse` `X^dQ_f(X⁻¹) = D(X − f)`, and `projCharpoly_cayleyHamilton`: that degree-`d` reversal annihilates `f`. Each identity may be checked after localising at the primes of `A`, where `P` is free and it is Mathlib's `LinearMap.charpoly` with `LinearMap.aeval_self_charpoly`. The reversal uses the rank `d`, even if `deg Q_f < d`. On a disconnected base use the locally constant rank componentwise.

**Checks.**

- For a free rank-one module with `T = a`, the two polynomials are `X − a` and `1 − aX`.
- On the zero module both determinants are 1, so its spectral support is empty.
- On `A²`, `T = (a b; c d)` gives `Q_T = 1 − (a + d)X + (ad − bc)X²`; the negative off-diagonal sign is retained. In particular a diagonal operator has `Q_T = (1 − aX)(1 − dX)`.
- The invertible nonprincipal ideal `P = (2, 1 + √−5)` in `A = ℤ[√−5]`, with scalar operator `a`, gives `Q_f = 1 − aX`. No global basis is chosen. For `f = 0` on any rank-`d` module, `Q_f = 1`, whose degree-`d` reversal is `X^d`.

### From the analytic and geometric roadmaps

*Uses.* `LocallyAnalyticDistributions`, Layer 4: orthonormalisable Banach modules and the property-`(Pr)` summand formulation, completed scalar extension, compactness and the compact-matrix criterion, Fredholm determinants, the cyclic determinant identity, entire resultants and the unit-resultant criterion, the Riesz decomposition (for `F = QS` with `Q(0) = 1`, `Q` of unit leading coefficient and `Q`, `S` coprime, a finite projective selected block whose Fredholm polynomial is `Q`), commuting stability and uniqueness of finite-slope summands, uniform radii for the universal weights, bounded cochain models, compact homotopy representatives, finite-slope perfect complexes, intrinsic algebraic slope parts of cohomology and homotopy invariance for strictly equivariant cochain homotopy equivalences. *Required in addition.* The primitive links between Banach modules of different radii and their companions are constructed here (§2a.11, §2.2). The closed-submodule potential-orthonormalisability criterion for family symbol kernels on nice charts and its descent to an admissible chart cover of weight space are constructed here as `familySymb_pr` and `familySymb_chartDescent` in §2.2. Neither compactness on a closed kernel nor projectivity after an arbitrary nonflat base change is inferred formally. These are application hypotheses to verify.

*Uses.* `RigidAnalyticGeometry`, §§1.1–1.5: affinoid presentations, dimension, completed field extension, affinoid fractions and strictness at radii in `√|K×|`; §§6.1–6.3: rigid spaces and admissible coverings; §§7.1–7.4: coherent modules, the identity principle and Kiehl's theorems; §8.3: the rigid–adic comparison. `AdicSpacesPartII`, R0–R1, supplies completed Banach tensors and the adic morphism classes. `AdicSpacesPartIII`, §F0.1, supplies finite modules as complete adic inverse systems; §§R2.4, R2.6–R2.7 supply rig-points, formal-model separatedness, flattening and quasi-finite models; §§R3.1–R3.3 supply coherent sheaves and finite coherent algebras with glueing. The finite-chart argument in §2a.3 uses the finite-neighbourhood criterion of Conrad, Appendix A.1, Theorem A.1.2, pp. 37–40. The weighted Weierstrass and global rigid-component statements needed beyond those suppliers are explicit targets in §§2a.2 and 2a.14 here.

The shared complex algebra used in §0a.0 has the following suppliers.

| Supplier | Contract |
| --- | --- |
| `DerivedModuleAlgebra`, §§0.2, 1.T.1, 1.1 and 1.E.0–1.E.1 | Native derived tensor and its `K`-flat comparison; `lim`, `lim¹`, Milnor sequences and cofinal-limit comparisons; compatible based finite-free models and generic perfect-system effectivity. |
| `DeformationAndDerivedPatchingAlgebra`, §§7.3, 7.5 and 7.8 | Native `IsMinimal` and `CompleteFlatComplex`, finite-free and complete-flat minimal retracts, restricted completed free modules and their basis and matrix comparisons, and `finiteDerivedHomCompletion` preserving identities, composition and coefficient projections. The open-ideal form uses its shared cofinal-limit adapter. |

`ArithmeticGaloisDuality`, §R02.1.1, uses the same tower algebra. The application names in §§0a.0.1–0a.0.2 are aliases or specializations of the supplied predicates and comparisons. Section 0a.0.3 retains the chosen minimal coefficient-tower comparisons; ordinary projectors and operator-equivariant comparisons remain targets here.

### From modular and Galois roadmaps

*Uses.* `ModularCurvesPartII`: §§3.1–3.5 and 5.17 (integral moduli of elliptic curves with level structure, agreeing with the Katz–Mazur level functors on the elliptic locus), §§3.6–3.7 and 4.1–4.4 (Tate curves and twisted Tate charts at the cusps), §§7.1–7.6 (the Hodge line, weight-`k` sections, the Hecke operators and the first-coefficient Hecke pairing), §13.5 (Tate modules with commuting Galois and Hecke actions), §§14.1–14.4a, 14.9 and 14.12 (the boundary exact sequence and, for constant weight-two coefficients, its vanishing after localisation at a non-Eisenstein maximal ideal; geometric weight coefficient systems and the comparison of modular symbols with the geometric lattice), §15.1 (the degeneracy pullbacks on cohomology) and §17.2 (special-fibre Eichler–Shimura). *Constructed here:* the moduli of trivialised elliptic curves over `p`-adic rings, that is, the ordinary Igusa tower used by Katz's `p`-adic modular functions (§0.1); the integral relative homology `H₁(X₁(M), cusps; ℤ_p)` with the path classes `{∞, a}`, the corestrictions in the level and the coefficients `L_{k−2}` (§§1.1, 1.5); mod-`p` multiplicity one at ordinary level, `J₁(Np)(ℚ̄)[𝔪]^ord` free of rank two over `T/𝔪` for a non-Eisenstein `p`-distinguished `𝔪` (Wiles, Ann. of Math. 141 (1995), Theorem 2.1, as used in [EPW](#ref-epw), Proposition 4.1.1) (§1.3); and the ordinary part of the `p`-divisible group of `J₁(Np^t)` over the local ring at `p`, with its connected–étale filtration compatibly in `t` (Mazur–Wiles); §4.2 builds on it the identification of the unramified quotient, with `Frob_p` acting by `U_p`, and the passage to the family lattice. The `ℓ ≠ p` semistable Tate filtration of ModularCurvesPartII §17.7 does not supply this item. Existence of the degeneracy maps alone does not supply the ordinary residual injectivity needed in Layer 1; that is proved in §1.12. The ordinary elliptic Igusa comparison used here (Katz's theorem, §0.2) is a narrow construction over these moduli in Layer 0, independent of the general higher-dimensional canonical-subgroup theory.

*Uses.* `ModularSymbolsPadicLFunctions`, Layer 0: `Hom_Γ(Δ₀, V)`, coset descriptions, Hecke actions, signs, Eichler–Shimura and the symbol–cohomology comparison. Layer 1: saturated integral eigensymbol lattices and period lines, with the coefficient dual made explicit. Layer 2: single-weight distributions, specialisation, refinements, small-slope control, the integral ordinary measure and interpolation. The family quotient-period comparison in Layer 1 below is an additional theorem, with its integral corrections stated explicitly. Section 3.0 supplies the cuspidal Banach-complex local charts, theta sequence, Galois/crystalline-period and refined-tangent adapters, `IsDecentRefinement`, critical eigensymbol multiplicity, local rank one, `secondaryPadicL`, `secondaryPadicL_flag`, `secondaryPadicL_interpolation` and `localFamilyPadicL`. Sections 2.2–2.10 here construct the all-weight global Banach-symbol model and compare it with those local charts in §2.7a. Sections 3.1–3.14 consume the cuspidal suite and extend it to the stated Eisenstein cases. The ordinary Eisenstein comparison is §0.12 here, using the arithmetic exports of `DirichletPadicLFunctions`, §§1.6 and 5.4–5.9, and classical Eisenstein series from `ModularForms`, Layer 0.

*Uses.* `IntegralHeckeAndGaloisDeterminants`, Layer 4: interpolation of continuous determinants from compatible congruence witnesses at classical specialisations. `GlobalGaloisDeformations`, §3.6, supplies the residual fixed-determinant tangent comparison over a finite residue field. The cuspidal characteristic-zero refined deformation, its finite-slope periods, tangent adapter and decent-point smoothness are supplied by `ModularSymbolsPadicLFunctions`, §3.0. Sections 2.7a and 3.4a transport them to the global charts; §3.4 identifies its `H¹_g` decency condition with the finite condition used in the tangent calculation. The Eisenstein preferred representation and smoothness extension remain targets here. `SelmerIwasawaCohomology`, Layers 2–3: Greenberg conditions, Selmer groups and complexes, semilocal and Iwasawa cohomology, the condition-change and lattice-change cones, derived control with the local correction complex, and determinants under normality, perfectness and torsion hypotheses. The modular zeta classes, their moment and norm identities, explicit reciprocity and the cyclotomic Euler-system bound are constructed in §4.0 here. The finite-local-field exponential and its Tate-dual boundary use `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.P3, and the actual Bloch–Kato local conditions use `SelmerIwasawaCohomology`, §§4.9–4.12. None of these inputs identifies an integral family regulator with a differently normalised regulator without the bridge proved in Layer 4.

*Uses.* `SerreWeightAndLevelOptimisation`, §2.13, supplies full odd-characteristic tame-conductor descent for already modular residual representations; §§3.1, 3.5–3.7 and Layer 4 supply the ordinary local form, companion/weight operations and removal of coefficient-prime level. Section 1.8a here supplies the additional preservation of the chosen ordinary stabilization.

*Uses.* `QuaternionicModularForms`, §0.3, supplies `classSet U`, `finite_classSet`, representatives and level-refinement maps for the unquotiented definite class set. Section 5.2 specializes this carrier and compares its central fibres with the quotient of `HilbertModularVarietiesAndShimuraCurves`.

*Uses.* `HilbertModularVarietiesAndShimuraCurves`, R18.3: the centre-quotiented definite class set, integral pairings, neatness and base change, the split Hecke normalisation and definite Jacquet–Langlands. `GL2AutomorphicRepresentationsAndTransfer`, §§R16.6.3 and R16.6.5: algebraic weight representations and representation-theoretic newvector/multiplicity exports. `HilbertModularVarietiesAndShimuraCurves`, §§H1.1–H1.10, H2.2–H2.9, H3.6–H3.8, H4.8 and H5.3–H5.4, supplies the Hilbert moduli, subgroup levels, Hodge bundles and algebraic weight descent with its polarization, level and scalar-stabilizer hypotheses. The classical Hilbert expansion and integral coefficient dictionary are constructed in §5.9a here. The nearly ordinary towers, the finite central-fibre comparison, all torsion-character factors, parallel-weight Hilbert families and their period modules are the additional constructions in Layer 5.

*Uses.* `ModularForms`, Layer 4 (eigenforms, newforms and the bad-prime eigenvalues of newforms), Layer 8 (modular-symbol path classes and their matrix actions) and Layer 8G (the semisimple Hecke algebra of the newspace). The pinned Tau Ceti `Newform` carries eigenproperties only at good indices.

### Classical realizations and local periods

`WeightsInEtaleCohomology`, R34.6 (Eigenform purity), supplies the pure good-prime Hecke polynomial of a cuspidal newform. Section 3.4 uses an auxiliary coefficient prime different from `p` to obtain its complex root norms; the crystalline identification at `p` itself remains the supplied local-chart adapter of `ModularSymbolsPadicLFunctions`, §3.0.

`AlgebraicModularFormsAndSerreWeights`, §§R15.5A.1–R15.5A.2, supplies the logarithmic de Rham/parabolic comparison, primitive rank-two coefficient realization and classical higher-weight Galois attachment. `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.P3, supplies continuous sections of the fundamental period sequences and their boundary maps; §§R07.P2 and R07.P5 supply finite-local-field period structures and their realization comparisons. The modular dual exponential and its geometric reciprocity formula are additional targets in §4.0.2. `SelmerIwasawaCohomology`, §3.15, supplies the degree-one restricted-ramification comparison for Kato's open-curve convention, retaining higher inertia terms.

`PadicMeasuresIwasawaAlgebras`, §5.2, supplies exactness for compact towers indexed by `ℕ` or a directed set with a countable cofinal subset, and topological Nakayama: a compact Hausdorff module over a compact local coefficient ring with finite residue field is generated by lifts of a finite spanning set of its residual quotient, and a map of such modules is surjective if its residual map is surjective. Section 0.16 here additionally identifies the compact module with its adic inverse limit before finite generation is known. Its §§1, 3.1–3.3 and 3a.1 supply the completed weight algebra, pseudomeasures with cleared evaluation and character space, used directly in §§0.7 and 0.12.

### From IntegralIwasawaTheory

*Uses.* `IntegralIwasawaTheory`, §9.0, `rationalOrdinaryControl`: for `p ≥ 5`, tame level prime to `p` and the valuation ring `𝒪`, the shared full and cuspidal ordinary towers, their finite weight algebras, and the relative and absolute integral homology limits, with finite generation, homology freeness and weight-and-level control. Transport its Hecke, boundary, trace, coefficient-extension and specialization maps to the saturated Katz lattices of §§0.2–0.6. The comparison preserves `U_p`, hence the ordinary projector. Sections 0.7–0.13 and 1.1–1.2 use these same towers and maps. The independent weight-two rank calculation `ordinary_weightTwo_rank` of §0.11, the extension to `p = 3` in §0.17 and the residual period-line results of Layer 1 are targets here. Full-form `a₁`-duality and the Eisenstein-local trace-limit comparisons of the supplier's §§9.1–9.2 are its additional interfaces; the quotient-by-constants duality of §0.6 and the irreducible-residual period theorem do not assert them.

The coordinate comparison retains both the weight shift and inverse diamonds. Put `u = 1 + p`. In the supplier's weight-two-normalized forward diamond coordinate a weight-`k` character is `ε(z)z^(k−2)`; in its inverse coordinate it is `ε(z)⁻¹z^(2−k)`. Our weight action is `ε(z)z^k`. Thus the map from the inverse coordinate algebra to `Λ_w` is `[z]_inv ↦ z²[z]_w⁻¹` for `z ∈ Γ_w`, or `1 + Y ↦ u²(1 + X)⁻¹` on the chosen generator. Its inverse sends `1 + X` to `u²(1 + Y)⁻¹`. The finite inverse-diamond component is `ω^(2−a)` for our component `ω^a`. These equations specify the scalar transport in `ordinaryHecke_lambdaAlgebra` and the tower comparisons; the cyclotomic measure variable is independent. (Sources: [Hida](#ref-hida), §3, p. 250; [SharifiAWS](#ref-sharifi-aws), Definition 4.2.1, Remark 4.2.11 and Remark 4.3.2, pp. 45, 47, 50.)

*Uses.* `IntegralIwasawaTheory`, §5.0, `kubotaLeopoldtPseudomeasure` and `kubotaLeopoldt_interpolation`, and §6.3, `bernoulliStickelberger_dictionary`: the canonical analytic object, inverse reciprocity coordinate, Teichmüller factor, Bernoulli sign, smoothing and conductor deletions. The normalized nonexceptional ordinary Eisenstein families are those of its §9.0. Section 0.12 transports them with their full constants and compares them to the broader character-family interfaces below. In the analytic coordinate `S` with `1 + S = u^s`, weight `k` means `s = 1 − k`, so `1 + S ↦ u(1 + X)⁻¹`. This differs from the inverse diamond coordinate `Y`. Apply these maps to integral numerators and their clearing factors before localizing; a pole is not removed by a coordinate change.

**Checks.**

- At weight 2 with `ε = 1`, the inverse diamond evaluates to 1 and our `[u]_w` to `u²`. The equation `u²[u]_w⁻¹ = 1` recovers the same weight-two homology fibre.
- For `h = p^(r−1)`, the supplier relation `(1 + Y)^h − u^((2−k)h)` maps to a unit multiple of `(1 + X)^h − u^(kh)`. Its roots retain every finite character trivial on `1 + p^rℤ_p`.
- At `p = 5`, our component `a = 0` has inverse-diamond component 2. Identifying the two component indices without the shift would change the nebentypus.
- At weight 0 the analytic substitution sends `S` to `u − 1`, the trivial branch's pole. Its cleared numerator remains meaningful, while its uncleared constant cannot be evaluated there.

### From DirichletPadicLFunctions

*Uses.* `DirichletPadicLFunctions`, §1.6, gives the full unit-character presentation of `IntegralIwasawaTheory`, §5.0's `kubotaLeopoldtPseudomeasure`, with normalization fixed by its §6.3. Sections 5.4–5.5 of `DirichletPadicLFunctions` supply `fullEisensteinAwaySeries`, its numerator `clearedEisensteinSeries`, shifted clearing relations and admissible evaluation. Section 5.6 supplies `integralTwistedPositiveEisensteinMeasure` for ordered left and right tame characters, with its coefficient-extension, finite-coordinate, moment and `p`-index identities. Section 5.7 supplies `normalizedTameEisensteinSeriesMeasure` for a nonprincipal right character when 2 is a unit; §5.8 supplies `principalTameEisensteinSeries` with the Euler deletions at its actual tame level. Section 5.9 supplies `characterEisenstein_full_interpolation` with parity, primitive inducing characters, omitted Euler factors and coefficient-field embeddings, and `characterEisenstein_lowWeight_of_qExpansion` for the conditional low-weight comparison. These are the arithmetic inputs of §0.12, including bounded smoothing, cross-multiplication, parameter independence and moments.

For the angular adapters use left character 1 at level one and right character `ψ` at its actual positive tame level `D`, weight by the continuous unit coordinate `x⁻¹`, and push forward along `x ↦ ⟨x⟩` before using `γ_w = 1 + p`. Apply these maps to the cleared full series and their denominators together. The principal level-one constant `Tw_x(ζ_p)/2` becomes the angular image of `ζ_p/2`; its factor `2(uδ_u − 1)` becomes `2([⟨u⟩] − 1)`. The map on localizations requires the transported denominator to be regular, and evaluation at `κ` requires `2(κ(⟨u⟩) − 1) ≠ 0`. A map on the entire total quotient ring is not supplied by angular pushforward. The tame weights `ψ(d)` remain in the finite divisor sums; they are not a continuous character on `ℤ_p^×`. The ordinary comparison here assumes `p ≥ 5`, so 2 is a unit; it retains each actual tame level and the finite character `ψω^(−k)` at weight `k`.

## How to read the build

The supplier order places `IntegralIwasawaTheory`, `DerivedModuleAlgebra`, `DeformationAndDerivedPatchingAlgebra`, `ModularSymbolsPadicLFunctions` (including §3.0) and `SerreWeightAndLevelOptimisation` before this roadmap. Read Layer 0a before Layer 0: finite-set factorial powers lead to profinite and locally finite ordinary parts, which then act on the shared integral Hecke and homology towers. Within Layer 0, build the Katz and coordinate adapters of §§0.1–0.9, then §0.16, then §§0.10–0.15 using the supplied rational control, and finally the odd-prime cuspidal extension §0.17. Layer 1 constructs periods and measures over the ordinary coefficient algebra. Layer 2a is the general eigenvariety machine, read before Layer 2 instantiates it with analytic family symbols. Layer 3 studies local critical fibres and their L-functions. Layer 4 first constructs the finite-level modular zeta inputs of §4.0, then compares Galois normalisations and constructs family reciprocity, retaining local correction terms. Layer 5 develops the totally real ordinary application. A result involving an integral comparison is used only after its named pairing, control or regulator comparison has been proved; a rational or pointwise equality does not discharge that requirement.

## Layer 0a: Ordinary projectors on modules and complexes

### 0a.0 Complete-flat and compatible minimal models

#### 0a.0.1 Minimal finite complexes

Use `DeformationAndDerivedPatchingAlgebra`, §7.3, for `IsMinimal C` on native cochain complexes over a local ring `(R, 𝔪, κ)`: `d(Cⁱ) ⊆ 𝔪Cⁱ⁺¹` in every degree, without boundedness, freeness or finite generation in the predicate. Its residue-differential, chain-isomorphism, shift and matrix comparisons are the shared API. The names `minimalFiniteModel`, `minimalFiniteModel_retract`, `minimalFiniteModel_residue` and `minimal_homotopyEquivalence_isIso` are aliases or specializations of that section's comparisons. For bounded finite free `C` they provide a minimal deformation retract in the same term interval, with `i : N → C`, `s : C → N`, `si = id` and `is ∼ id`, and `rank_R Nⁱ = dim_κ Hⁱ(C ⊗ κ)`. A homotopy equivalence between minimal termwise finite free complexes is a chain isomorphism. Uniqueness asserts existence of a chain isomorphism, not a unique comparison. (Source: [KT](#ref-kt), §2.2, Lemma 2.3, pp. 6–7.)

**Checks.**

- The identity disk `R —1→ R` retracts to zero, although it has two nonzero terms.
- Over a `DVR`, `R —ϖ→ R` is minimal and has one-dimensional residue cohomology in each of its two degrees.
- Over `κ[ε]/(ε²)`, the residue-field stalk has an infinite minimal free resolution; finite cohomology alone does not make it perfect.

#### 0a.0.2 Complete-flat complexes and their retracts

Let `R` be complete noetherian local. Use `DeformationAndDerivedPatchingAlgebra`, §7.5, for the native predicate `CompleteFlatComplex`: bounded terms, termwise flatness and separated maximal-adic completeness, allowing infinite rank. Its transport, cone and `K`-flat comparisons identify ordinary and derived residue tensors. The completed free direct sum `R^(J)` is its restricted-coefficient module: for each `n`, only finitely many coefficients lie outside `𝔪ⁿ`. The names `completeFlatBasis` and `completeFlatBasis_modPow` specialize the supplied basis comparison and its reductions for a flat separated complete module with chosen lifts of a residue basis. Use the supplied continuous column-matrix comparison, with no row-finiteness condition.

The names `completeFlat_morphismSplitting`, `completeFlat_minimalModel`, `completeFlat_minimalResidue`, `completeFlat_residualPerfect`, `completeFlat_residualQuasiIso` and `completeFlat_transferComposition` are aliases or specializations of §7.5's splitting, minimal-retract, residue and transfer comparisons. They give a minimal complete-flat deformation retract `N` of `C` in the same term interval, with `Nⁱ/𝔪Nⁱ ≃ Hⁱ(C ⊗ᴸ κ)`. Finite-dimensional residue spaces make `N` finite free; residue acyclicity gives a contraction, and a residue quasi-isomorphism between complete-flat complexes is a quasi-isomorphism. Endomorphism transfer `T ↦ sTi` preserves multiplication up to homotopy, hence in the derived category. These comparisons require no finite residue field. The ordinary and operator-equivariant applications use this shared package. (Source: [Pilloni](#ref-pilloni), §2.2, Propositions 2.2.1–2.2.2, pp. 8–9; §2.3, Lemma 2.3.1 and proof of Proposition 2.3.1, pp. 9–10; restricted completions: Stacks, [tag 05BC](https://stacks.math.columbia.edu/tag/05BC) (Lemma 15.28.1 and proof).)

**Checks.**

- At `𝔪 = 0` the completion of an infinite free direct sum is the direct sum, not the full product.
- Over a complete `DVR`, the family `(ϖʲ)ⱼ≥₀` is restricted; the constant family `(1)ⱼ≥₀` is not. Empty `J` gives zero and singleton `J` gives `R`.
- The matrix with every column the first basis vector defines a continuous map by summing a restricted family; its first row is infinite.
- The fraction field of a complete `DVR` is flat but is not adically separated, and is excluded.
- Transferring the identity disk gives zero in the derived category. Transfer of products agrees up to the retract homotopy and need not be a strict chain action.

#### 0a.0.3 Compatible models along coefficient quotients

Let `R` be complete noetherian local and let `I_n` be decreasing open ideals cofinal with `𝔪ⁿ`. For compatible perfect complexes over `R/I_n`, supported in one common finite term interval with fixed minimal residue ranks, use `DerivedModuleAlgebra`, §§1.E.0–1.E.1, for compatible based finite-free models and generic effectivity over `R ≃ lim R/I_n`. The input retains the specified derived reduction identifications and their composition coherence, in the supplier's derived-diagram category. The quotient transitions are surjective with nilpotent kernels, so satisfy its effectivity hypotheses. The application comparisons `compatibleMinimalModel` and `compatibleMinimalModel_reduction` choose minimal representatives using `DeformationAndDerivedPatchingAlgebra`, §7.3, and retain their given reduction identifications, compatible bases and common finite term interval. They also retain the operator-equivariant comparisons and coherent coefficient-tower diagrams used for ordinary factors.

For bounded finite free `P,Q`, consume `DeformationAndDerivedPatchingAlgebra`, §7.8, `finiteDerivedHomCompletion`, for
`Hom_D(R)(P,Q) ≃ lim_n Hom_D(R/I_n)(P ⊗ᴸ R/I_n, Q ⊗ᴸ R/I_n)`.
Use its shared cofinal-limit adapter from `DerivedModuleAlgebra`, §§1.T.1 and 1.1, to transport the maximal-ideal-power comparison to these open ideals, retaining every coefficient projection. The equivalence preserves identities and composition and gives a ring isomorphism for endomorphisms. It compares derived morphisms, not chosen chain representatives, and requires no finite residue field. (Source: [KT](#ref-kt), Lemmas 2.13–2.14, pp. 11–12; Stacks, [tag 0CQG](https://stacks.math.columbia.edu/tag/0CQG).)

**Checks.**

- The constant free tower gives the corresponding free stalk over `R`.
- The compatible two-term matrices `(ϖ mod I_n)` lift to `R —ϖ→ R`, not a free stalk or a zero differential.
- All zero ranks give the zero complex. Matching ranks without coherent reduction maps does not specify a limit object.
- A derived endomorphism with zero image at every coefficient quotient is zero; distinct homotopic chain representatives can still have the same image.

### 0a.1 Factorial iterates of a self-map of a finite set stabilise

Let `X` be a finite set with `m = |X|` elements and `f : X → X` any map. For every `n ≥ m`, `f^[n!] = f^[m!]`; the map `e = f^[m!]` is idempotent `(e ∘ e = e)`; its image is the eventual image `⋂_k f^[k](X)`; and `f` restricts to a bijection of that image, whose inverse there is `f^[m! − 1]`. Equivalently, in the finite monoid of self-maps of `X`, the powers `f^{n!}` are eventually constant, with value the unique idempotent among the positive powers of `f`. The zeroth power is excluded: it is the identity even when the eventual image is smaller than `X`.

`X` finite (no algebraic structure is used); `m = |X| ≥ 0`, with `0! = 1`.

For `x ∈ X` the orbit `x`, `f(x)`, `f²(x)`, … has at most `m` distinct points, so (pigeonhole) there are `i(x) < j(x) ≤ m` with `f^{i(x)}(x) = f^{j(x)}(x)`; put `ℓ(x) = j(x) − i(x) ≤ m`. Then `f^{a}(x) = f^{b}(x)` whenever `a`, `b ≥ i(x)` and `a ≡ b mod ℓ(x)`. For `n ≥ m: n! ≥ n ≥ m ≥ i(x)` and `ℓ(x) | n!` (as `ℓ(x) ≤ m ≤ n`), so `f^{n!}(x) = f^{m!}(x)` and `f^{2·m!}(x) = f^{m!}(x)`; hence `f^[n!] = f^[m!]` and `e ∘ e = e`. Image: `e(X) ⊆ f^[k](X)` for `k ≤ m!`, and for `k ≥ m!` the chain `f^[k](X)` is constant from `k = m` on (a decreasing chain of subsets of an `m`-element set stabilises after at most `m` steps), so `e(X) = ⋂_k f^[k](X)`. On `e(X)`, `f ∘ f^[m!−1] = f^[m!−1] ∘ f = e = id`, so `f` is a bijection of `e(X)` with inverse `f^[m!−1] (m! ≥ 1)`.

The threshold is explicit: `n ≥ |X|`; no bound uniform in a family of sets is claimed. No group-order averaging and no division by `m!` is used: the argument works in every characteristic. Test: on ZMod 6, `x ↦ 2x` has `f^[6!] = (x ↦ 4x)`, which is idempotent `(16 ≡ 4 mod 6)`.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses Mathlib `Finite.exists_ne_map_eq_of_infinite`; Mathlib `Nat.dvd_factorial`; Mathlib `Nat.self_le_factorial`; Mathlib `Nat.factorial_dvd_factorial`; Mathlib `Function.iterate_add`; Mathlib `Function.iterate_mul`; Mathlib `Set.BijOn`.

### 0a.2 Hida's ordinary projector on a finite module

Let `R` be a ring, `M` an `R`-module whose underlying set is finite, `m = |M|`, and `U ∈ End_R(M)`. The ordinary projector is `e_U := U^{m!} ∈ End_R(M)`. It satisfies `e_U = U^{n!}` for every `n ≥ m` (so `e_U = lim_n U^{n!}` in the discrete topology), `e_U² = e_U` and `U e_U = e_U U`. The ordinary part is `M_ord := e_U M` and the non-ordinary part is `M_nord := ker e_U = (1 − e_U)M`.

`R` any ring (not necessarily commutative); `M` finite as a set, e.g. a finite module over `R/I` with `R/I` finite. `U` is `R`-linear; the construction uses only the monoid structure of `End_R(M)`.

Apply §0a.1 to the underlying map of `U: U^{n!} = U^{m!}` for `n ≥ m` and `U^{m!}` is idempotent. `e_U` is a power of `U`, hence `R`-linear and commuting with `U`.

Changing `m` to any upper bound `N ≥ |M|` gives the same endomorphism `(U^{N!} = U^{m!})`. A supplied idempotent is not a substitute: `e_U` is defined from `U` alone. Units give `e_U = 1` and nilpotents give `e_U = 0`.

- `ordinaryProjector`: `e_U := U^{|M|!}`.
- `ordinaryProjector_eq_pow_factorial`: `e_U = U^{n!}` for all `n ≥ |M|`.
- `isIdempotentElem_ordinaryProjector`: `e_U² = e_U`.
- `commute_ordinaryProjector`: `U e_U = e_U U`.
- `ordinaryProjector_of_isUnit`: `U` a unit `⇒ e_U = 1`.
- `ordinaryProjector_of_isNilpotent`: `U` nilpotent `⇒ e_U = 0`.
- `ordinaryPart`: `M_ord := range e_U`, with `nonOrdinaryPart` :`= ker e_U`.
- `finite_ordinary_milestone`: the stabilisation, idempotence, complement, bijectivity and nilpotence statements of §§0a.1–0a.4 for `U`, as one statement.

**Checks.**

- On `ZMod 6 ≅ ZMod 2 × ZMod 3`, `e` for multiplication by 2 is multiplication by 4 (the projection onto the ZMod 3 factor): a definition via '`U` invertible `⇒ 1`, else 0' fails.
- Multiplication by 2 on ZMod 8 is nilpotent: `M_ord = 0`.
- Multiplication by the unit 3 on `ZMod 8: M_ord = M`.
- `e_1 = 1` (degenerate case: the identity is ordinary).
- Agreement with Mathlib: `range e_U = ⨅ₙ range Uⁿ` and `ker e_U = ⨆ₙ ker Uⁿ (LinearMap.isCompl_iSup_ker_pow_iInf_range_pow)`.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2); [Hida](#ref-hida), §1, after (1.16) and (1.17a), p. 244 (Numdam PDF; printed page = PDF page + 229).

This uses §0a.1; Mathlib `Module.End`; Mathlib `Module.End.pow_apply`; Mathlib `IsIdempotentElem`; Mathlib `Commute`.

### 0a.3 The ordinary projector is the Fitting projection

For `M` finite as a set and `U ∈ End_R(M): range e_U = ⨅_n range(Uⁿ)` and `ker e_U = ⨆_n ker(Uⁿ)`. Hence `e_U` is the projection of `M` onto `⨅_n range(Uⁿ)` along `⨆_n ker(Uⁿ)` in Mathlib's Fitting decomposition `LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`, and both chains are constant from `n = |M|` on.

`M` is Artinian and Noetherian (`isArtinian_of_finite`; Noetherian by the finite-set instance).

`range e_U = range U^{m!} ⊆ range Uⁿ` for `n ≤ m!`, and `range Uⁿ` is constant for `n ≥ m` (§0a.1, image clause), so `range e_U = ⨅ range Uⁿ`. `ker e_U ⊇ ker Uⁿ` for `n ≤ m!`; if `Uⁿx = 0` then `e_U x = U^{N!}x = 0` for `N ≥ max(m, n)`; so `ker e_U = ⨆ ker Uⁿ`. An idempotent is the projection onto its range along its kernel `(LinearMap.isProj_iff_isIdempotentElem)`; compare with LinearMap.linearProjOfIsCompl for the Fitting complement pair.

State the comparison as an equation of linear maps with the Mathlib projection, not only as equal submodules; the two submodule equalities are the milestone `finite_ordinary_fitting`.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses §0a.2; §0a.1; Mathlib `LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`; Mathlib `LinearMap.eventually_isCompl_ker_pow_range_pow`; Mathlib `LinearMap.eventually_iInf_range_pow_eq`; Mathlib `LinearMap.eventually_iSup_ker_pow_eq`; Mathlib `isArtinian_of_finite`; Mathlib `IsNoetherian`; Mathlib `LinearMap.isProj_iff_isIdempotentElem`; Mathlib `LinearMap.IsProj`; Mathlib `LinearMap.linearProjOfIsCompl`.

### 0a.4 `U` is invertible on the ordinary part and nilpotent on the rest

For `M` finite as a set and `U ∈ End_R(M): U` maps `M_ord` and `M_nord` into themselves; `U` restricts to an `R`-linear automorphism of `M_ord`, whose inverse is the restriction of `U^{m! − 1} (m = |M|)`; and `U^m` vanishes on `M_nord`.

`m = |M| ≥ 1` (`M` contains 0).

`U` commutes with `e_U`, so it preserves `range e_U` and `ker e_U`. On `M_ord`, `U^{m!−1} ∘ U = U ∘ U^{m!−1} = e_U = id`, giving the inverse. `ker Uⁿ` is an increasing chain of subgroups of an `m`-element group; each strict step at least doubles the size, so it is constant from `n = ⌊log₂ m⌋ ≤ m` on, and `M_nord = ⨆ ker Uⁿ = ker U^m`.

The exponent `m` on `M_nord` is uniform for this finite module; no uniform exponent exists for the profinite limit (§0a.12).

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses §0a.2; §0a.3; §0a.1; Mathlib `IsArtinian.bijective_of_injective_endomorphism`; Mathlib `LinearMap.restrict`; Mathlib `Set.BijOn`.

### 0a.5 Uniqueness of the ordinary decomposition

For `M` finite as a set and `U ∈ End_R(M)`, `M = M_ord ⊕ M_nord` with both summands `U`-stable, `U` bijective on `M_ord` and nilpotent on `M_nord`. Conversely, if `M = A ⊕ B` as `R`-modules with `U` mapping `A` bijectively onto `A` and every element of `B` killed by some power of `U`, then `A = M_ord` and `B = M_nord`; `U`-stability of `B` need not be assumed.

`M` finite as a set; the summands are `R`-submodules.

Existence: `e_U` is idempotent, so `M = range e_U ⊕ ker e_U`; apply ordinary-part-bijective. Uniqueness: `U(A) = A` gives `A = Uⁿ(A) ⊆ range Uⁿ` for all `n`, so `A ⊆ ⨅ range Uⁿ = M_ord`; every `b ∈ B` lies in some `ker Uⁿ`, so `B ⊆ ⨆ ker Uⁿ = M_nord` (§0a.3). Since `M = A ⊕ B = M_ord ⊕ M_nord` are finite, `|A|·|B| = |M_ord|·|M_nord|` with `|A| ≤ |M_ord|` and `|B| ≤ |M_nord|`, so both inclusions are equalities.

The milestone `finite_ordinary_unique` identifies both summands under these hypotheses.

**Checks.**

- For `U = 1`, the ordinary summand is all of `M` and the elementwise nilpotent summand is zero.
- For `U = 0`, the ordinary summand is zero and the other summand is all of `M`.
- For `U = diag(1, 0)` on `(ZMod 2)²`, the complement spanned by `e₁ + e₂` is excluded: its nonzero vector is never killed by a power of `U`.

The comparison is by inclusion and counting; no stability hypothesis on `B` is used, and `U(A) = A` (not merely `U(A) ⊆ A` with `U` injective on `A`) is what the statement asks. Test: `U = diag(1, 0)` on (ZMod 2)²: the complement `B = span(e₁ + e₂)` of `A = span(e₁)` is excluded because `Uⁿ(e₁ + e₂) = e₁ ≠ 0`.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses §0a.2; §0a.3; §0a.4; Mathlib `IsCompl`.

### 0a.6 Naturality of the ordinary projector

Let `M`, `N` be `R`-modules that are finite as sets, `U₁ ∈ End_R(M)`, `U₂ ∈ End_R(N)`, and `f : M → N` `R`-linear with `f U₁ = U₂ f`. Then `f e_{U₁} = e_{U₂} f`; in particular `f(M_ord) ⊆ N_ord` and `f(M_nord) ⊆ N_nord`.

The two operators act on their respective source and target modules.

Take `n ≥ max(|M|, |N|): e_{U₁} = U₁^{n!}` and `e_{U₂} = U₂^{n!}`, and `f U₁^{n!} = U₂^{n!} f` by induction.

The same `n` must serve both modules; this is why the threshold `n ≥ |M|` (not a fixed exponent) is recorded. The milestone is `finite_ordinary_naturality`.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2); [Hida](#ref-hida), §1, (1.17b), p. 244.

This uses §0a.2.

### 0a.7 Exactness of the ordinary part on finite modules

Let `M' → M → M''` (maps `f`, `g`) be exact at `M`, with `M'`, `M`, `M''` `R`-modules finite as sets and endomorphisms `U'`, `U`, `U''` such that `f U' = U f` and `g U = U'' g`. Then `ker g ∩ M_ord = f(M'_ord)`, and if `g` is surjective then `g(M_ord) = M''_ord`. Hence `M ↦ M_ord` and `M ↦ M_nord` are exact functors on `U`-equivariant exact sequences of finite modules.

Exactness in Mathlib's sense Function.Exact `f g (range f = ker g)`.

If `x ∈ M_ord` and `g x = 0`, write `x = f y`; then `x = e x = e f y = f e' y ∈ f(M'_ord)` (naturality). The reverse inclusion is naturality and `g f = 0`. If `g` is surjective and `z ∈ M''_ord`, choose `g y = z`; then `g(e y) = e'' g y = z` with `e y ∈ M_ord`. The ordinary part is a natural direct summand of the identity functor, hence a retract of an exact sequence.

The milestone `finite_ordinary_exact` states the image–kernel identity and preservation of surjections.

**Checks.**

- With all three endomorphisms equal to 1, the statement is the original exact sequence.
- With all three endomorphisms nilpotent, all ordinary parts vanish.
- The Chinese remainder sequence `0 → ZMod 2 → ZMod 6 → ZMod 3 → 0`, with the first map sending 1 to 3 and with multiplication by 2 on every term, becomes `0 → 0 → {0,2,4} → ZMod 3 → 0` on ordinary parts.

No Mittag-Leffler or limit argument enters at finite level.

See [KT](#ref-kt), §2.4, Lemma 2.11 and proof, pp. 9–10 (arXiv v2).

This uses §0a.6; §0a.2; Mathlib `Function.Exact.linearMap_ker_eq`; Mathlib `Submodule.map`.

### 0a.8 Ordinary parts of quotients

For `M` finite as a set, `U ∈ End_R(M)` and a `U`-stable submodule `P ⊆ M`, the ordinary part of `M/P` for the induced endomorphism is the image of `M_ord: (M/P)_ord = (M_ord + P)/P ≅ M_ord/(P ∩ M_ord) = M_ord/P_ord`. For a two-sided ideal `I` of a commutative `R` and `P = IM: (M/IM)_ord = M_ord/I·M_ord` and `(M/IM)_nord = M_nord/I·M_nord`.

`P` `U`-stable; for `P = IM` this holds for every `R`-linear `U` when `R` is commutative.

Apply §0a.7 to `0 → P → M → M/P → 0`. `IM = I·M_ord ⊕ I·M_nord` because `e_U` is `R`-linear, so `(IM)_ord = I·M_ord`.

Test: `M = ZMod 9`, `U = 3`, `P = 3M`: both sides are 0.

See [KT](#ref-kt), §2.4, Lemma 2.10(3) and proof, p. 9 (arXiv v2).

This uses §0a.7; §0a.6; Mathlib `Submodule.mapQ`; Mathlib `Submodule.mkQ`.

### 0a.9 The ordinary part is the localization at `U`

Let `R` be commutative, `M` an `R`-module finite as a set and `U ∈ End_R(M)`; regard `M` as an `R[X]`-module with `X` acting by `U` (`Module.AEval'`). Then `M_ord → M → M[X⁻¹] = LocalizedModule (powers X) M`, `x ↦ x/1`, is an isomorphism; equivalently the `R[X]`-linear map `M → M_ord`, `x ↦ e_U x`, is a localization at the powers of `X` (`IsLocalizedModule`). In particular every `U`-equivariant map from `M` to a module on which the endomorphism is bijective kills `M_nord`.

`R` commutative (so that `R[X]` is commutative and LocalizedModule applies).

Injective: if `x ∈ M_ord` and `X^k x = 0` in `M` then `U^k x = 0`, so `x = 0` since `U` is injective on `M_ord`. Surjective: `y/X^k = (U|_{M_ord})^{-k}(e y)/1 + ((1 − e)y)/X^k`, and `(1 − e)y` is killed by `U^m`, so its fraction vanishes. Universal property: `X` acts invertibly on `M_ord`, and `M_nord` is `X`-power torsion.

This is the comparison ACC+ use to identify Emerton's localization definition of ordinary parts with the direct-summand definition at finite level.

See [ACC](#ref-acc), §5.2, Proposition 5.2.15 and proof, pp. 999–1000 (2023 author copy, published pagination); [ACC](#ref-acc), §5.2.1, ordinary localization definitions and finite-coefficient comparison, p. 994 (2023 author copy, published pagination).

This uses §0a.4; §0a.5; Mathlib `LocalizedModule`; Mathlib `LocalizedModule.mk`; Mathlib `IsLocalizedModule`; Mathlib `Module.AEval'`; Mathlib `Module.AEval'.of`; Mathlib `Submonoid.powers`; Mathlib `Polynomial.X`.

### 0a.10 Finite quotient systems adapted to an endomorphism

Let `M` be an `R`-module and `U ∈ End_R(M)`. A finite quotient system for `(M, U)` indexed by a set `ι` is a family `(J_i)_{i∈ι}` of submodules of `M` such that: the family is directed downward (for `i`, `j` there is `k` with `J_k ⊆ J_i ∩ J_j`); each `J_i` is `U`-stable; each `M/J_i` is finite as a set; `⋂_i J_i = 0` (separated); and every compatible family `(x_i mod J_i)` is represented by one `x ∈ M` (complete). Then `M ≅ lim_i M/J_i`, and the `J_i` form a basis of neighbourhoods of 0 for the inverse-limit topology, in which `M` is compact and `U` is continuous.

The index set is nonempty; the countable decreasing case is the one used by Khare–Thorne.

Define the induced endomorphisms `U_i` of `M/J_i` by Submodule.mapQ. Separation and completeness say that the canonical map `M → lim M/J_i` is bijective.

The data are the `J_i`, not merely a topology: coefficient and level maps must respect them (§0a.13). For the usual product topology on `∏_{n∈ℕ} 𝔽₂`, the left shift admits no cofinal system of stable open submodules: any proper stable open submodule would impose a finite-coordinate relation whose successive shifts involve arbitrarily large coordinates. Continuity alone does not supply an adapted system.

- `FiniteQuotientSystem`: The bundled family `J` with the five axioms.
- `FiniteQuotientSystem.quotientEnd`: `U_i := (J_i)`.mapQ `(J_i) U`.
- `FiniteQuotientSystem.mk_eq_iff`: `x = y` iff `x ≡ y mod J_i` for all `i`.
- `FiniteQuotientSystem.equivLimit`: `M ≃ lim_i M/J_i`.

**Checks.**

- `ℤ_p` with `J_n = pⁿℤ_p` is a system for every `ℤ_p`-linear `U`.
- There is no system on `ℂ` over `ℂ` for `U = 2`: the only finite-index `ℂ`-submodule is `ℂ` itself, so separation fails (so no separated system exists).
- A module finite as a set has the one-element system `J = 0` (degenerate case).
- For `∏_{n∈ℕ} 𝔽₂` with its product topology and the left shift, no stable open-submodule system inducing that topology is separated.

See [Hida](#ref-hida), §1, (1.17b), p. 244; [KT](#ref-kt), §2.4, proof of Lemma 2.10, p. 9 (arXiv v2).

This uses Mathlib `Directed`; Mathlib `Submodule.mapQ`; Mathlib `Submodule.mkQ`; Mathlib `CategoryTheory.Functor.sections`.

### 0a.11 The profinite ordinary projector

Let `(J_i)` be a finite quotient system for `(M, U)`, `U_i` the induced endomorphisms of `M/J_i` and `e_i = e_{U_i}`. There is a unique `e = e_U ∈ End_R(M)` with `e(x) ≡ e_i(x mod J_i)` for all `i` and `x`. For every `x` and `i`, `U^{n!}x ≡ e x mod J_i` as soon as `n ≥ |M/J_i|`; thus `U^{n!} → e` pointwise in the inverse-limit topology. Moreover `e² = e`, `eU = Ue`, and `e(J_i) ⊆ J_i` for all `i` (continuity).

`(J_i)` a finite quotient system; no uniform threshold over `i` is asserted.

For `J_k ⊆ J_i` the projection `M/J_k → M/J_i` intertwines `U_k` and `U_i`, so it intertwines `e_k` and `e_i` (§0a.6): `(e_i(x mod J_i))_i` is a compatible family. Completeness gives `e x`; separation gives uniqueness; linearity follows from uniqueness. `U^{n!}x mod J_i = U_i^{n!}(x mod J_i) = e_i(x mod J_i)` for `n ≥ |M/J_i|`. Idempotence, commutation with `U` and `e(J_i) ⊆ J_i` hold modulo every `J_k`, hence exactly.

The congruence bound is uniform in `x` for a fixed quotient, but need not be uniform over all quotients: for `M = ℤ_p` and `U = p`, `e = 0` but `U^{n!} ≠ 0` for every `n`. Independent of the chosen system among systems defining the same topology `(projector_unique)`.

- `FiniteQuotientSystem.projector`: The limit projector `e`.
- `FiniteQuotientSystem.mkQ_comp_projector`: `(J_i)`.mkQ `∘ e = e_{U_i} ∘ (J_i)`.mkQ.
- `FiniteQuotientSystem.projector_sub_pow_factorial_mem`: `e x − U^{n!} x ∈ J_i` for `n ≥ |M/J_i|`.
- `FiniteQuotientSystem.isIdempotentElem_projector`: `e² = e`.
- `FiniteQuotientSystem.commute_projector`: `Ue = eU`.
- `FiniteQuotientSystem.projector_mapsTo`: `e(J_i) ⊆ J_i`.

**Checks.**

- `M = ℤ_p`, `U = p: e = 0`.
- `M = ℤ_p`, `U = u ∈ ℤ_p^×: e = 1` (`u^{n!} → 1` because `(ℤ/p^k)^×` is finite).
- `M = ℤ_p²`, `U = diag(1, p): e = diag(1, 0)`.
- For `M` finite with the system `J = 0`, `e` agrees with the finite ordinaryProjector.

See [Hida](#ref-hida), §1, (1.17a)–(1.17b), p. 244; [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses §0a.10; §0a.2; §0a.6; §0a.8.

### 0a.12 The ordinary decomposition of a profinite module

With `(J_i)`, `e` as in §0a.11: `M = eM ⊕ (1 − e)M`, both summands closed and `U`-stable; `U` restricts to a bijection of `eM` whose inverse is continuous; `U` is topologically nilpotent on `(1 − e)M` (for each `x` there and each `i`, `Uⁿx ∈ J_i` for all `n` large). Conversely `e` is the only idempotent in `End_R(M)` commuting with `U`, preserving every `J_i`, with `U` bijective on its range and topologically nilpotent on its kernel.

No uniform exponent: the `n` in '`Uⁿx ∈ J_i'` depends on `x` only through `i` (it can be taken `|M/J_i|`), but `U` need not be nilpotent on `(1 − e)M`.

Each summand is the kernel of a continuous endomorphism (`1 − e` or `e`), hence closed. Modulo `J_i`, `U` is bijective on `e_i(M/J_i)` and nilpotent of exponent `≤ |M/J_i|` on its complement (§0a.4); pass to the limit using completeness for the inverse `U^{-1} = lim U^{n!−1}` on `eM`. Uniqueness: modulo each `J_i` a competing `e'` induces a decomposition of `M/J_i` satisfying the hypotheses of §0a.5, so `e' ≡ e mod J_i` for all `i`.

Test on `ℤ_p` with `U = p: (1 − e)M = ℤ_p`, `U` topologically nilpotent but not nilpotent. Test on `ℤ_p²` with `U = (1 1; 0 p): eM` is the line spanned by `(1, 0)` and `(1 − e)M` the line spanned by `(1, p − 1)`.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses §0a.11; §0a.5; §0a.4; Mathlib `IsCompl`; Mathlib `Set.BijOn`.

### 0a.13 Naturality of the profinite projector

Let `(M, U, (J_i))` and `(N, V, (K_k))` carry finite quotient systems and let `f : M → N` be `R`-linear with `fU = Vf` and continuous for the systems (for every `k` there is `i` with `f(J_i) ⊆ K_k`). Then `f e_U = e_V f`. In particular the ordinary part is functorial for level and coefficient maps that respect the quotient systems.

The map must be continuous for the specified quotient systems as well as intertwine the operators.

Given `k`, choose `i` with `f(J_i) ⊆ K_k`; `f` induces `M/J_i → N/K_k` intertwining `U_i` and `V_k`. By §0a.6, `f e_U x ≡ e_V f x mod K_k` for every `k`; separation of `N` gives equality.

For finite modules over a complete noetherian local ring every `R`-linear map is continuous (AdicSpacesPartIII §F0.1 (finite modules over complete noetherian adic rings)), so the hypothesis is automatic in the adic instance.

See [KT](#ref-kt), §2.4, Lemma 2.10 and proof, p. 9 (arXiv v2).

This uses §0a.11; §0a.6.

### 0a.14 Ordinary projectors on finite modules over complete local rings

Let `R` be a noetherian local ring with maximal ideal `m` and finite residue field, `M` a finite `R`-module that is `m`-adically separated and complete (automatic when `R` is complete), and `U ∈ End_R(M)`. Then `(mⁿM)_{n≥0}` is a finite quotient system for `(M, U)`. Hence `e_U = lim_n U^{n!}` exists in `End_R(M)` for the `m`-adic topology, is idempotent, `M = M_ord ⊕ M_nord` with `U` invertible on `M_ord` and topologically nilpotent on `M_nord`, the decomposition is unique and natural for all `R`-linear maps, and `(M/IM)_ord = M_ord/IM_ord` for every proper ideal `I`.

Finite residue field is essential: for `R = ℂ (m = 0)`, `M = ℂ` and `U = 2`, the powers `2^{n!}` do not converge (finite generation over a complete local ring is not enough). Topologies: the `m`-adic topology on `End_R(M)`, equal to the topology of the kernels of `End_R(M) → End_R(M/mⁿM)`.

`R/mⁿ` is finite (`Ideal.finite_quotient_pow` with `R/m` finite) and `M/mⁿM` is a finite `R/mⁿ`-module, hence a finite set. `mⁿM` is `U`-stable because `U` is `R`-linear; separation and completeness are the `m`-adic hypotheses, supplied for finite modules over complete noetherian local rings by AdicSpacesPartIII §F0.1 (finite modules over complete noetherian adic rings). Convergence in `End_R(M): e − U^{n!}` maps `M` into `mᵏM` once `n ≥ |M/mᵏM|`, uniformly in `x`. Naturality for all `R`-linear maps: `f(mⁿM) ⊆ mⁿN`, so §0a.13 applies; the quotient statement is §0a.8 at each finite level.

Recover Khare–Thorne Lemma 2.10 exactly, including uniqueness and the quotient formula. Keep the failure test `R = ℂ`, `U = 2` as an explicit non-example of the hypotheses.

See [KT](#ref-kt), §2.4, opening paragraph and Lemma 2.10 with proof, p. 9 (arXiv v2).

This uses §0a.10; §0a.11; §0a.12; §0a.13; §0a.8; `AdicSpacesPartIII`, §F0.1; Mathlib `IsLocalRing.finite_quotient_iff`; Mathlib `Ideal.finite_quotient_pow`; Mathlib `IsAdicComplete`; Mathlib `IsLocalRing.ResidueField`; Mathlib `IsLocalRing.maximalIdeal`; Mathlib `Module.Finite`.

### 0a.15 Exactness of the profinite ordinary part

`(a)` If `0 → M' → M → M'' → 0` is exact, with finite quotient systems on the three modules, continuous `U`-equivariant maps, then `0 → M'_ord → M_ord → M''_ord → 0` and the non-ordinary sequence are exact. `(b)` If `(0 → M'_c → M_c → M''_c → 0)_c` is a cofiltered system of `U`-equivariant exact sequences of modules finite as sets, then the limit sequence is exact, its terms carry the finite quotient systems given by the kernels of the projections, and `(lim M_c)_ord = lim (M_c)_ord`.

The exactness assertion in `(b)` needs only finiteness of each kernel `M'_c` (compact surjectivity); the stated profinite topology on every term additionally uses finiteness of the levels; for `ℕ`-indexed towers of artinian modules this is the Mittag-Leffler condition.

`(a): e` is natural for continuous equivariant maps, so the ordinary sequence is a retract of the given exact sequence. `(b)`: the limit sequence is exact by Mathlib `nonempty_sections_of_finite_cofiltered_system` applied to the finite fibres; the kernels of `lim M_c → M_c` form a finite quotient system (separated and complete by construction); the limit projector agrees with the limit of the finite projectors by the uniqueness in §0a.11, and exactness of the ordinary parts at each `c` passes to the limit by Mathlib `nonempty_sections_of_finite_cofiltered_system` applied to the finite fibres again.

State `(b)` with the actual transition maps; equalities only after taking cohomology do not suffice.

See [KT](#ref-kt), §2.4, Lemma 2.11 and proof, pp. 9–10 (arXiv v2); [KT](#ref-kt), §2.4, proof of Lemma 2.13, p. 11 (arXiv v2).

This uses §0a.13; §0a.7; Mathlib `nonempty_sections_of_finite_cofiltered_system`; §0a.11; §0a.10.

### 0a.16 Ordinary parts of complexes and their cohomology

Let `C` be a complex of `R`-modules each finite as a set (or finite modules over a noetherian local ring with finite residue field, complete in each degree) and `T : C → C` a chain endomorphism. The degreewise projectors `e_{T^i}` form a chain map `e_T` with `e_T² = e_T`, giving `C = C_ord ⊕ C_nord` as complexes; for every `i` the induced maps give `H^i(C_ord) ≅ H^i(C)_ord` and `H^i(C_nord) ≅ H^i(C)_nord` (for the endomorphism `H^i(T)`); and for a chain map `f : C → D` with `f T = T' f`, `f(C_ord) ⊆ D_ord` and `f(C_nord) ⊆ D_nord`.

The second operator acts on `D•`. In the adic case `H^i(C)` is a finite `R`-module, so its ordinary part is defined by adic-instance.

The differentials intertwine `T^i` and `T^{i+1}`, so they commute with the projectors (naturality): `e_T` is a chain map. Cycles, boundaries and cohomology are obtained from `C` by kernels and cokernels of equivariant maps; exactness of the ordinary part (finite or adic) identifies `Z^i(C_ord) = Z^i(C)_ord`, `B^i(C_ord) = B^i(C)_ord` and `H^i(C_ord) = H^i(C)_ord`.

Degreewise application only uses a chain endomorphism; an endomorphism in the derived category needs derived-ordinary-idempotent.

See [KT](#ref-kt), §2.4, Lemma 2.11(1), p. 9 (arXiv v2).

This uses §0a.6; §0a.7; §0a.13; §0a.15; §0a.14; Mathlib `HomologicalComplex`; Mathlib `HomologicalComplex.homologyMap`.

### 0a.17 The ordinary part of a perfect complex

Let `R` be a complete noetherian local ring with finite residue field, `C` a good complex (bounded, with finite projective terms) and `t ∈ End_{K(R)}(C) = End_{D(R)}(C)`. There is a unique idempotent `e ∈ End_{K(R)}(C)` such that `e` is a polynomial in `t (e ∈ R[t])`, `H(t)` acts invertibly on `H(e)H*(C)` and topologically nilpotently on `(1 − H(e))H*(C)`; namely `e = e_t = lim t^{n!}`. For any chain representative `T` of `t`, the degreewise ordinary part `C_{T,ord}` is a direct summand subcomplex whose projection represents `e`, so `e` splits in `K(R)`; the resulting `C_ord` is unique up to isomorphism in `K(R)`, independent of `T`, and carries `x ↦ e x e` from any finite `R`-subalgebra of `End_{K(R)}(C)` commuting with `t`. Over an artinian local `R` this is the telescope comparison of IntegralHeckeAndGaloisDeterminants §2.3 (ordinary finiteness for bounded complexes with finite cohomology), which this statement extends to complete `R` by passing to the limit over `R/mⁿ`.

`C` good in Khare–Thorne's sense (§2.2); `K(R)` is the homotopy category, with `End_{K(R)}(C) = End_{D(R)}(C)` for good `C`. Uses `End_{K(R)}(C)`, a finite `R`-module since `R` is noetherian and `C` has finite projective terms.

`End_{K(R)}(C)` is a quotient of the finite `R`-module of chain endomorphisms, hence a finite `R`-algebra; apply the finite-algebra supplier contract to `t`. For a representative `T`, `e_T` (§0a.16) is a chain idempotent with `e_T = T^{n!}` modulo `mᵏ` for `n` large, so its class is `lim t^{n!} = e`: this splits `e` in `K(R)`. Properties on cohomology follow from ordinary-part-complexes. Uniqueness: idempotents of the finite commutative `R`-algebra `R[t] = ∏ R[t]_𝔪` (`R` complete) correspond to sets of maximal ideals; the cohomological conditions force the set `{𝔪 : t ∉ 𝔪}`.

Do not assume that `D(R)` is idempotent complete in the library: the splitting is produced from the degreewise ordinary part of a representative. The complete local and finite-residue hypotheses remain in force.

See [KT](#ref-kt), §2.4, Lemma 2.12, p. 10 (arXiv v2); [KT](#ref-kt), §2.2, definition of good and minimal complexes, p. 6 (arXiv v2).

This uses the finite-algebra supplier contract; §0a.16; §0a.14; §0a.0; `IntegralHeckeAndGaloisDeterminants`, §2.2 (specified idempotent summands); `IntegralHeckeAndGaloisDeterminants`, §2.3 (ordinary finiteness); Mathlib `HomotopyCategory`; Mathlib `Homotopy`.

### 0a.18 Ordinary parts along a tower of coefficient rings

Let `R` be a complete noetherian local ring with finite residue field, `I_1 ⊇ I_2 ⊇ …` open ideals cofinal with the powers of `m`, `R_c = R/I_c`. Suppose given perfect complexes `M_c` of free `R_c`-modules, `t_c ∈ End_{D(R_c)}(M_c)` and morphisms `f_{c+1} : M_{c+1} ⊗ R_c → M_c` with `f_{c+1}(t_{c+1} ⊗ 1) = t_c f_{c+1}` inducing isomorphisms `H*(M_{c+1} ⊗ R_c)_ord ≅ H*(M_c)_ord`. Then there are a minimal complex `F_∞` over `R` and maps `g_c : F_∞ ⊗ R_c → M_c`, `g'_c : M_c → F_∞ ⊗ R_c` with `g'_c g_c = 1`, `g_c g'_c` the ordinary idempotent of `t_c`, compatible with the `f_c`; `H*(F_∞ ⊗ R_c) ≅ H*(M_c)_ord`. The triple is unique up to an isomorphism unique up to homotopy, and compatible endomorphisms `s_c` commuting with `t_c` glue to a unique `s_∞ ∈ End_{D(R)}(F_∞)`.

Cofinality with `(mⁿ)` is an explicit hypothesis. Chevalley supplies it for a decreasing sequence of ideals with zero intersection in a complete noetherian local ring; completeness alone is insufficient. Minimal complexes (KT Lemma 2.3) and the gluing of good complexes and homotopy classes along `R_c` (KT Lemmas 2.13–2.14) are constructed in §0a.0.

Replace each `M_c` by a minimal complex; choose a chain representative `T_c` and put `F_c = (M_c)_{T_c,ord}` with inclusion `i_c` and projection `p_c`; then `i_c p_c = t_c^{N_c!}` in `D(R_c)`. `a_{c+1} = p_c f_{c+1}(i_{c+1} ⊗ 1) : F_{c+1} ⊗ R_c → F_c` is a quasi-isomorphism of minimal complexes, hence an isomorphism; glue the `F_c` to `F_∞` with isomorphisms `b_c` (§0a.0.3, `compatibleMinimalModel` and its homotopy-class comparison; KT Lemma 2.13) and set `g_c = i_c b_c`, `g'_c = b_c⁻¹ p_c`. `H*(F_∞) = lim H*(F_c)` by the Milnor sequence, since towers of finite modules over `R_c` are Mittag-Leffler. Uniqueness and gluing of `s_∞` by the homotopy-class comparison of §0a.0.3 (`compatibleMinimalModel`; KT Lemma 2.13(3)).

Keep the ordinary-cohomology compatibility hypothesis; transition maps that are isomorphisms only on the whole cohomology are not required. The identity `g_c g'_c = i_c p_c` holds as chain maps, before passing to `D(R_c)`.

See [KT](#ref-kt), §2.4, Proposition 2.15, statement point 3, p. 13 (arXiv v2); [KT](#ref-kt), §2.4, proof of Proposition 2.15, p. 13 (arXiv v2).

This uses §0a.17; §0a.16; §0a.15; §0a.0; `DerivedModuleAlgebra`, §1.T.1 (The Milnor sequence for towers of complexes); `DerivedModuleAlgebra`, §1.T.1 (Mittag–Leffler vanishing).

### 0a.19 Locally finite endomorphisms of complete modules

Let `R` be a complete noetherian local ring with maximal ideal `m` and finite residue field, and let `M` be an `R`-module that is `m`-adically separated and complete (`M ≅ lim_n M/mⁿM`; no finiteness of `M` is assumed). An `R`-linear endomorphism `T` of `M` is locally finite if for every `n ≥ 1` and every `v ∈ M/mⁿM` the `R`-submodule of `M/mⁿM` spanned by the orbit `{T^k v : k ≥ 0}` is finitely generated; equivalently, each `M/mⁿM` is the directed union of its `T`-stable finitely generated `R`-submodules. Since `R/mⁿ` is finite, a finitely generated `R/mⁿ`-module is a finite set, so each such submodule is finite. The predicate `IsLocallyFiniteEnd I T` is stated for an arbitrary ideal `I` of a commutative ring (modulo each `Iⁿ`, every orbit lies in a finitely generated submodule); this layer uses `I = m`, where the two formulations agree because `R` is noetherian.

`R` complete noetherian local with finite residue field; `M` `m`-adically separated and complete; `T ∈ End_R(M)`.

The two formulations agree: the span of an orbit is `T`-stable, and a sum of finitely many `T`-stable finitely generated submodules is again one. A finitely generated `R/mⁿ`-module is finite as a set because `R/mⁿ` has finite length and finite residue field `(Ideal.finite_quotient_pow)`.

A finite `R`-module carries only locally finite endomorphisms; the notion is new only for modules that are not finitely generated, such as completed direct sums of copies of `R` or completed cohomology.

- `IsLocallyFiniteEnd`: The predicate on `(M, T)`: for all `n` and `v ∈ M/mⁿM`, the orbit span of `v` is finitely generated over `R`.
- `isLocallyFiniteEnd_iff_directed_union`: `T` is locally finite iff every `M/mⁿM` is the union of its `T`-stable finitely generated submodules.
- `isLocallyFiniteEnd_of_finite`: If `M` is a finite `R`-module, every `T` is locally finite.
- `isLocallyFiniteEnd_of_finiteQuotientSystem`: If every `M/mⁿM` is finite, `T` is locally finite and `(mⁿM)_n` is a finite quotient system for `(M, T)` (§0a.10).
- `IsLocallyFiniteEnd.mul`: Products of commuting locally finite endomorphisms are locally finite (BCGP Lemma 2.11.2).

**Checks.**

- On `M = R²` over `R = ℤ_p` every endomorphism is locally finite, and the projector agrees with the adic projector of §0a.14.
- The zero endomorphism and the identity of any complete `M` are locally finite (orbit spans have at most one generator). In the Lean predicate this holds for every ideal of any commutative coefficient ring.
- `polynomial_shift_not_locallyFinite`: on `(ℤ/2)[X]` as a vector space over `ℤ/2`, multiplication by `X` is not locally finite for `I=0`: the orbit of 1 consists of the independent monomials `Xⁿ`.
- On the completed direct sum `M` of countably many copies of `ℤ_p`, the shift `e_i ↦ e_{i+1}` is not locally finite: modulo `p` the orbit of `e_0` spans an infinite-dimensional `𝔽_p`-space.
- On the same `M`, the diagonal endomorphism `e_i ↦ p^i e_i` is locally finite: modulo `pⁿ` it kills all `e_i` with `i ≥ n`, so each orbit span is finitely generated.

See [Pilloni](#ref-pilloni), §2.1, Definition 2.1.1, p. 7; [BCGP](#ref-bcgp), §2.11, Definition 2.11.1, p. 40.

This uses Mathlib `IsAdicComplete`; Mathlib `IsLocalRing.maximalIdeal`; Mathlib `Ideal.finite_quotient_pow`; Mathlib `Module.End`; Mathlib `Submodule.span`; §0a.2.

### 0a.20 Stability of local finiteness under extensions, quotients and products

Let `0 → M₁ → M₂ → M₃ → 0` be an exact sequence of `m`-adically separated complete `R`-modules with compatible endomorphisms `T`. (1) If `T` is locally finite on `M₁` and `M₃`, it is locally finite on `M₂`. (2) If `T` is locally finite on `M₂`, it is locally finite on `M₃`. (3) If `T` is locally finite on `M₂` and `mⁿM₂ = 0` for some `n`, it is locally finite on `M₁`. Without the bounded-torsion hypothesis (3) fails: on `M₂ = ∏_{i≥0} ℤ_p` with `T(a_0, a_1, …) = (0, p a_0, p² a_1, …, p^i a_{i−1}, …)`, `T` is locally finite on `M₂` and preserves the kernel `M₁` of `M₂ → ∏_i ℤ/p^{i(i+1)/2}`, but is not locally finite on `M₁`. (4) If `T₁`, `T₂` commute and are locally finite on `M`, then `T₁T₂` is locally finite.

`R` complete noetherian local with finite residue field; all modules `m`-adically separated and complete; `T`-equivariant maps.

(1): modulo `mⁿ`, write the image `M` of `M₁/mⁿ` in `M₂/mⁿ`; `T` is locally finite on `M` by (2). Given `v`, local finiteness on `M₃` gives `T^N v = w + Σ_{i<N} a_i T^i v` with `w ∈ M`, and local finiteness on `M` gives a relation for `w`; the span of `{T^i v, T^j w}` is `T`-stable and finitely generated. (2) and (3) are immediate from the definition, since an orbit span in a submodule killed by `mⁿ` is an orbit span in `M₂/mⁿ`. Put `r_i=i(i+1)/2` and `M₁=∏_i p^{r_i}ℤ_p`. The identity `r_i=r_{i−1}+i` shows that `T` preserves `M₁` and, under `(b_i) ↦ (p^{r_i}b_i)`, acts as the right shift. Modulo `p` the orbit of the first coordinate vector is linearly independent. On `M₂`, `T` is zero modulo `p`, so §0a.21 proves local finiteness there. `T` need not map all of `M₂` into `M₁`. (4): reduce to `M` killed by `mⁿ`; the span of `{T₂^i T₁^j v}` is finitely generated and `T₁T₂`-stable.

The counterexample uses `r_i=i(i+1)/2`, including the trivial `i=0` quotient. It asserts stability of `M₁`, not `T(M₂)⊆M₁`. Completeness uses each module’s intrinsic `p`-adic filtration.

See [Pilloni](#ref-pilloni), §2.1, Lemma 2.1.1, p. 7, and Remark 2.1.1, pp. 7–8; [BCGP](#ref-bcgp), §2.11, Lemma 2.11.2, p. 40.

This uses §0a.19; Mathlib `Submodule.span`; Mathlib `Function.Exact.linearMap_ker_eq`.

### 0a.21 Local finiteness is detected modulo the maximal ideal

For an `m`-adically separated complete `R`-module `M` and `T ∈ End_R(M)`, `T` is locally finite on `M` if and only if the induced endomorphism of `M/mM` is locally finite.

`R` complete noetherian local with finite residue field; `M` `m`-adically separated and complete.

Necessity is part (2) of §0a.20. Sufficiency by induction on `n`, using the right exact sequence `(m^{n−1}/mⁿ) ⊗_R M → M/mⁿM → M/m^{n−1}M → 0`: the left term is a quotient of a finite direct sum of copies of `M/mM` (`m^{n−1}/mⁿ` is a finite-dimensional `R/m`-space), so `T` is locally finite on it and on its image, and part (1) of §0a.20 applies to the image and the quotient.

For `M = ℤ_p^{(ℕ)}` completed and `T` the shift, the criterion fails modulo `p`, matching the shift Check of §0a.19.

See [Pilloni](#ref-pilloni), §2.1, Lemma 2.1.2, p. 8; [BCGP](#ref-bcgp), §2.11, Lemma 2.11.3, p. 40.

This uses §0a.19; §0a.20; Mathlib `Ideal.finite_quotient_pow`.

### 0a.22 The ordinary projector of a locally finite endomorphism

Let `T` be a locally finite endomorphism of an `m`-adically separated complete `R`-module `M`. For every `v ∈ M` the sequence `T^{N!}v` converges `m`-adically; `e(T)v := lim_N T^{N!}v` defines an `R`-linear idempotent `e = e(T) ∈ End_R(M)` commuting with `T`, and `M = eM ⊕ (1 − e)M` with both summands `T`-stable and closed, `T` bijective on `eM` and topologically nilpotent on `(1 − e)M` (for each `v ∈ (1 − e)M` and each `n`, `Tᵏv ∈ mⁿM` for `k` large). `e` is the unique idempotent with these properties. When every `M/mⁿM` is finite, `e` coincides with the projector of §0a.11 for the quotient system `(mⁿM)_n`.

`T ∈ End_R(M)` locally finite (§0a.19).

Fix `n` and `v ∈ M/mⁿM`; the orbit `span V` of `v` is a finite `T`-stable module, so §0a.2 gives `T^{N!}v = e_V v` for `N ≥ |V|`, independent of the choice of `V` by §0a.6 applied to inclusions of finite `T`-stable submodules. The resulting projectors on the `M/mⁿM` are compatible in `n` (naturality for the reduction maps), and `m`-adic completeness assembles them into `e` on `M`. Bijectivity of `T` on `eM`, topological nilpotence on `(1 − e)M` and uniqueness are checked modulo each `mⁿ` on finite `T`-stable submodules, where they are §0a.4 and §0a.5.

No uniform exponent `N` with `e = T^{N!}` on all of `M` is asserted; on the diagonal example of §0a.19, `e` is the projection onto the `e_0`-coordinate and `T^{N!}` differs from it at every finite `N`.

- `ordinaryProjectorLF`: `e(T) ∈ End_R(M)` for a locally finite `T`.
- `ordinaryProjectorLF_apply`: `e(T)v` is the `m`-adic limit of `T^{N!}v`.
- `isIdempotentElem_ordinaryProjectorLF`: `e(T)² = e(T)`.
- `commute_ordinaryProjectorLF`: `e(T)T = Te(T)`.
- `ordinaryProjectorLF_bijective`: `T` restricts to a bijection of `e(T)M`.
- `ordinaryProjectorLF_topNilpotent`: `T` is topologically nilpotent on `(1 − e(T))M`.
- `ordinaryProjectorLF_unique`: An idempotent commuting with `T` with these two properties equals `e(T)`.
- `ordinaryProjectorLF_eq_profinite`: If every `M/mⁿM` is finite, `e(T)` is the projector of §0a.11 for `(mⁿM)_n`.
- `locally_finite_ordinary_milestone`: for `IsLocallyFiniteEnd m T`, a unique idempotent commuting with `T`, with `T` bijective on its range, `T^{N!}v` converging to it and `T` topologically nilpotent on its kernel; `ordinaryProjectorLF_unique` also characterises it by bijectivity and topological nilpotence alone.

**Checks.**

- If `T` is invertible (for example `T = 1 + p` on `M = ℤ_p`), `e(T) = 1`.
- If `T` is topologically nilpotent (for example `T = p` on a completed free module), `e(T) = 0`.
- For `e_i ↦ p^i e_i` on the completed direct sum of copies of `ℤ_p`, `e(T)` is the projection onto `ℤ_p e_0`.
- In the diagonal example no single power `T^{N!}` equals `e(T)`, so a definition of `e` as a fixed power is wrong.

See [Pilloni](#ref-pilloni), §2.1, Lemma 2.1.3, p. 8; [BCGP](#ref-bcgp), §2.11, Lemma 2.11.4, p. 40.

This uses §0a.19; §0a.2; §0a.6; §0a.4; §0a.5; §0a.11; Mathlib `IsAdicComplete`.

### 0a.23 Functoriality and exactness of locally finite ordinary parts

Let `f : M₁ → M₂` be a `T`-equivariant `R`-linear map of `m`-adically separated complete modules on which `T` is locally finite. `(1) f e = e f`, so `f(eM₁) ⊆ eM₂` and `f((1 − e)M₁) ⊆ (1 − e)M₂`. (2) If `M₃ = coker f` is `m`-adically separated and complete, `coker(eM₁ → eM₂) = eM₃`. (3) If `T` is locally finite on `M₀ = ker f`, then `ker(eM₁ → eM₂) = eM₀`.

`T` locally finite on `M₁` and `M₂` (and on `M₀` for (3)); the cokernel separated and complete for (2).

Since `f` commutes with `T`, it commutes with each `T^{N!}`, hence with their limit `e` (continuity of `f` for the `m`-adic topologies). Thus `f` is the direct sum of `ef` and `(1 − e)f`, which gives (2) and (3); `T` is locally finite on `M₃` by §0a.20 (2).

For the inclusion `pℤ_p → ℤ_p` with `T =` multiplication by a unit, both ordinary parts are everything and the cokernel `ℤ/p` is its own ordinary part.

See [Pilloni](#ref-pilloni), §2.1, Lemma 2.1.4, p. 8.

This uses §0a.22; §0a.20.

### 0a.24 Locally finite endomorphisms of complete flat complexes

Let `C^flat(R)` be the category of bounded complexes of flat `m`-adically separated complete `R`-modules and `D^flat(R)` the full subcategory of `D(R)` of objects they represent (§0a.0, complete flat complexes). A chain endomorphism `T` of `M• ∈ C^flat(R)` is locally finite if it is locally finite on every term `Mⁱ`; then the degreewise projectors form a chain idempotent `e(T)`. An endomorphism `T` of an object `M•` of `D^flat(R)` is locally finite if it has a representative `(M•₀, T₀)` with `M•₀ ∈ C^flat(R)` and `T₀` a locally finite chain endomorphism. Characterisation (Pilloni Proposition 2.3.1): `T` is locally finite if and only if the pair `(M•, T)` admits a complete flat complex with a chain endomorphism representing `T`, and `T` acts locally finitely on every `Hⁱ(M• ⊗^L_R R/m)`.

`R` complete noetherian local with finite residue field.

Degreewise projectors commute with the differentials because the differentials are `T`-equivariant (§0a.23 (1)). Characterisation, forward direction: `Hⁱ(M•₀ ⊗ R/m)` is a subquotient of `Mⁱ₀/m`, so §0a.20 applies. Converse: replace a representative `M•₀` by a minimal complete flat subcomplex `N•` that is a deformation retract (differentials zero modulo `m`), using the splitting of a complete flat map into an isomorphism and a part vanishing modulo `m`; the transferred endomorphism `s T₀ i` acts on `Nⁱ/m = Hⁱ(M• ⊗ R/m)` as `T` does, hence is locally finite by §0a.21.

On a perfect complex every endomorphism is locally finite (Remark 2.3.1), so the notion adds nothing in `D^perf(R)` and is needed only for complexes of non-finitely-generated complete flat modules.

- `IsLocallyFiniteChainEnd`: Degreewise local finiteness of a chain endomorphism of a complete flat complex.
- `chainOrdinaryProjector`: The chain idempotent `e(T₀)` assembled from the degreewise projectors.
- `IsLocallyFiniteDerivedEnd`: Existence of a locally finite complete flat representative.
- `isLocallyFiniteDerivedEnd_iff`: Pilloni Proposition 2.3.1: given a complete flat chain representative of the pair `(M,T)`, local finiteness is equivalent to local finiteness on every `Hⁱ(M ⊗^L R/m)`.
- `isLocallyFiniteDerivedEnd_of_perfect`: Every endomorphism of an object of `D^perf(R)` is locally finite (Remark 2.3.1).

**Checks.**

- On the zero complex the projector is zero.
- On a bounded complex of finite free `R`-modules every chain endomorphism is locally finite and `e(T₀)` is the degreewise adic projector of §0a.16.
- For the two-term complex `ℤ_p --p--> ℤ_p` with `T = identity` in both degrees, `e(T) = 1` and the cohomology `ℤ/p` in degree one is its own ordinary part.
- The complex with the completed direct sum of copies of `ℤ_p` in degree 0 and the shift endomorphism is not locally finite, since its reduction modulo `p` is not.

See [Pilloni](#ref-pilloni), §2.2, p. 8, and §2.3, Definitions 2.3.1–2.3.2 and Proposition 2.3.1 with Lemma 2.3.1, pp. 9–10; [BCGP](#ref-bcgp), §2.11, p. 41.

This uses §0a.19; §0a.21; §0a.20; §0a.23; §0a.0; Mathlib `DerivedCategory`; Mathlib `CochainComplex`.

### 0a.25 The ordinary direct factor of a locally finite derived endomorphism

Let `T` be a locally finite endomorphism of `M• ∈ D^flat(R)`. A locally finite representative `(M•₀, T₀)` gives the chain idempotent `e₀ = e(T₀)` and the direct factor `ē₀M•` of `M•` in `D(R)` represented by `e₀M•₀`. If `ē₀M•` lies in `D^perf(R)`, then for any other locally finite representative `(M•₁, T₁)`, `ē₁M•` also lies in `D^perf(R)` and the canonical map `ē₀M• → ē₁M•` is a quasi-isomorphism; the ordinary direct factor `e(T)M• ∈ D^perf(R)` is therefore well defined up to canonical isomorphism, although the idempotent itself is only defined on representatives. When `M•` is perfect it agrees with the Khare–Thorne ordinary part of §0a.17.

`T` locally finite on `M• ∈ D^flat(R)`; `ē₀M•` perfect for one representative.

On each `Hⁱ(M• ⊗^L R/m)` the operators `T₀` and `T₁` induce the same locally finite endomorphism; by §0a.23 the projectors induced by `e₀` and `e₁` both equal its ordinary projector there, so `ē₀M• → ē₁M•` is an isomorphism modulo `m`. `ē₁M•` is perfect because its reduction modulo `m` has finite cohomology (complete flat complexes with finite residual cohomology are perfect). A map of complete flat complexes that is a quasi-isomorphism modulo `m` is a quasi-isomorphism. On a perfect `M•` the endomorphism algebra is finite over `R` and the factorial-power idempotent is unique (Pilloni Remark 2.3.1), which identifies the construction with §0a.17.

The statement asserts independence of the direct factor up to canonical quasi-isomorphism, never equality of idempotents in `End_{D(R)}(M•)` for non-perfect `M•`.

- `derivedOrdinaryPart`: `e(T)M• ∈ D^perf(R)`, defined from any locally finite representative when one gives a perfect direct factor.
- `derivedOrdinaryPart_isPerfect`: `e(T)M•` is perfect.
- `derivedOrdinaryPart_indep`: Two locally finite representatives give canonically quasi-isomorphic direct factors.
- `derivedOrdinaryPart_reduction`: `Hⁱ(e(T)M• ⊗^L R/m)` is the ordinary part of `Hⁱ(M• ⊗^L R/m)`.
- `derivedOrdinaryPart_eq_kt`: On `D^perf(R)` it is the ordinary part of §0a.17.

**Checks.**

- For `M• = R[0]` and `T =` multiplication by a unit, `e(T)M• = R[0]`; for `T =` multiplication by an element of `m`, it is 0.
- The ordinary part of the zero complex is zero.
- For `M• = R[0] ⊕ R[−1]` with `T = (1, a)` and `a∈m`, `e(T)M• = R[0]`. In particular this applies to `a=p` over `R=ℤ_p`; it does not assert that an unrelated rational prime is a nonunit in every coefficient ring.
- For `M•` the completed direct sum of countably many copies of `ℤ_p` in degree 0 and `T = 1`, `T` is locally finite but `e(T)M• = M•` is not perfect; the construction yields an object of `D^perf(R)` only under the perfectness hypothesis, which is therefore not automatic.

See [Pilloni](#ref-pilloni), §2.3, Lemma 2.3.2 and the paragraph after it, pp. 10–11; Remark 2.3.1, p. 11; [BCGP](#ref-bcgp), §2.11, p. 41; [KT](#ref-kt), §2.4, Lemma 2.12, p. 10.

This uses §0a.24; §0a.23; §0a.17; §0a.0; `IntegralHeckeAndGaloisDeterminants`, §2.2 (specified idempotent summands).

### 0a.26 Ordinary projectors over complete semilocal coefficient rings

Let `R` be a Jacobson-adically separated complete semilocal noetherian ring whose quotient by its Jacobson radical is finite (for example `Λ = ℤ_p[[ℤ_p^×]]` for odd `p`, a product of `p − 1` complete local rings `ℤ_p[[1 + pℤ_p]]`). Then `R = ∏_j R_j` with each `R_j` complete local with finite residue field, every Jacobson-adically separated complete `R`-module `M` decomposes as `∏_j M_j`, and an endomorphism `T` is locally finite when each component `T_j` is; the ordinary projector, the derived ordinary direct factor and their properties are defined factor by factor, with 'perfect' read as 'bounded complex of finite projective `R`-modules' (finite projective modules over `R` need not be free when the factors have different ranks).

`R` is noetherian semilocal, separated and complete for `J=rad(R)`, with `R/J` finite; `M` is `J`-adically separated and complete. For complexes impose these hypotheses degreewise, together with flatness and boundedness.

For the finitely many maximal ideals `m_j`, their powers are pairwise comaximal and `Jⁿ=∏_j m_jⁿ=⋂_j m_jⁿ`. Chinese remaindering followed by `J`-adic completeness gives `R≅∏_j lim_n R/m_jⁿ`. Each factor is complete local; its central idempotent decomposes modules and their filtrations. IntegralHeckeAndGaloisDeterminants §2.2 (finite local factors) supplies the finite-algebra special case, and this argument supplies the stated generality. All constructions of §0a.22 and §0a.25 commute with finite products.

For `R = ℤ_p[[ℤ_p^×]]` the decomposition has exactly `p − 1` factors, indexed by the characters of `μ_{p−1}`.

See [Pilloni](#ref-pilloni), §2 (standing hypothesis that `R` is complete local, p. 7) applied to `Λ = ℤ_p[[ℤ_p^×]]` in Parts II–IV.

This uses §0a.22; §0a.25; `IntegralHeckeAndGaloisDeterminants`, §2.2 (finite local factors); Mathlib `Module.Projective`.

### Examples

On `M=ℤ/6ℤ` let `U` be multiplication by 2. Its factorial powers stabilize at multiplication by 4: `U^{6!}=4`, `4²=4` modulo 6. The image is `{0,2,4}`, where `U` swaps 2 and 4 and fixes 0; the kernel is `{0,3}`, where `U` is zero. The direct sum has orders `3·2=6`. Multiplication by 3 reverses the two prime components. This example distinguishes an ordinary part from a `p`-primary part and fixes the positive-power convention.

For `M=ℤ_p²` and `U=diag(1,p)`, the limit is `diag(1,0)`, but `U^n` never vanishes on the second lattice. Modulo `p^r` its complement is nilpotent with exponent `r`. For `R=𝔽_q[[ϖ]]` the same calculation uses `ϖ`, not the residue characteristic, and gives `diag(1,0)` for `diag(1,ϖ)`. A cochain complex `R→R` with differential multiplication by `ϖ` and `U=1` remains the whole ordinary complex; its cohomology is `R/(ϖ)` in degree 1. Thus taking the ordinary factor does not make all cohomology projective.

### Dependencies

The finite-set statements use Mathlib’s iterate, factorial, finite-module and Fitting APIs named above. Profinite completion and exactness use finite cofiltered systems and the Mittag–Leffler input of `ArithmeticGaloisDuality`, R02.1. The derived construction uses §0a.0, including its complete-flat comparison. The finite-algebra idempotent and Artinian telescope comparison are supplied by `IntegralHeckeAndGaloisDeterminants`, §2.3. Local finiteness, its derived perfect-factor comparison and semilocal gluing are the additional constructions of this layer.

## Layer 0: Ordinary Hecke algebras and Hida families

### 0.1 Katz's `p`-adic modular functions and the `q`-expansion principle

For a `p`-adic ring `A (A = lim A/pⁿA)` and `N = N₀pʳ` with `p ∤ N₀`, `V(N; A)` is the ring of functions on isomorphism classes of triples `(E, φ, i)` over `p`-adic `A`-algebras — `E` an elliptic curve, `φ : Ê ≅ Ĝ_m` a trivialisation, `i` a level structure compatible with `φ` — compatible with base change; `W(N; A) ⊂ V(N; A)` is the subring of functions whose values at the trivialised Tate curves lie in `A[ζ_{N₀}][[q^{1/N₀}]]`. Evaluation at the Tate curve embeds `V(N; A)` in the `p`-adic completion of `A((q))` with `A`-flat cokernel (the `q`-expansion principle), `V(N; A) = V(N₀; A)`, and classical forms embed via `ω = φ^*(dx/x)`.

`p`-adic rings in Hida's sense; the ordinary Igusa tower of trivialised elliptic curves is constructed here over the level moduli supplied by ModularCurvesPartII §§3.1–3.5 and 5.17.

Define `V(N; A)` functorially on trivialised triples; the Tate curve `Tate(q)` over `ℤ_p((q))^` carries the canonical trivialisation. `q`-expansion principle (1.8a–`c`): injectivity into `A((q))`, stability under change of `A` and `A`-flatness of the cokernel. The compatibility condition (1.6) makes a level-`N` structure on a trivialised curve equivalent to a level-`N₀` one, so `V(N; A) = V(N₀; A)`. Classical forms of weight `k` embed by evaluating on `(E, ω = φ^*(dx/x))` (1.11).

The `q`-expansion principle is stated with `A`-flat cokernel, not only injectivity. The `p`-power part of the level disappears for `p`-adic modular functions `(V(N; A) = V(N₀; A))`.

- `KatzPadicModular`: `V(N; A)` as a `p`-adic `A`-algebra.
- `KatzPadicModular.qExpansion_injective`: Evaluation at the Tate curve is injective.
- `KatzPadicModular.qExpansion_flat_cokernel`: The cokernel of `q`-expansion is `A`-flat.
- `KatzPadicModular.level_eq`: `V(N₀pʳ; A) = V(N₀; A)`.

**Checks.**

- For `p≥5` the normalised `E_{p−1}` belongs to `W(1;ℤ_p)` and has `q`-expansion 1 modulo p.
- Over `ℤ/25`, `E₄` has `q`-coefficient `240 ≡ 15`, although its reduction modulo 5 is 1.
- Over `ℤ/5`, `Δ=q+q²+2q³+⋯` is nonconstant.
- At `p=5`, the first Igusa level retains the four automorphisms in `μ₄`; the full trivialisation tower cannot be a `1+5ℤ₅`-torsor over the ordinary locus.

See [Hida](#ref-hida), §1, (1.6)–(1.9), pp. 238–239 (Numdam PDF pages 9–10; printed page = PDF page + 229); [Hida](#ref-hida), §1, (1.8a–c), p. 239 (Numdam PDF page 10; printed page = PDF page + 229).

This uses `ModularCurvesPartII`, §§3.1–3.5 and 5.17; `ModularCurvesPartII`, §§3.6–3.7 and 4.1–4.4; `ModularCurvesPartII`, §§7.1–7.6.

### 0.2 `p`-adic modular forms are limits of classical forms (Katz)

For `K=Frac(𝒪)`, use combined expansions at the fixed Tate cusp and define the divided-congruence lattices `D_j^M(N;𝒪)=(⊕_{0≤k≤j} M_k(Γ₁(N);K))∩𝒪[[q]]` and `D_j^S(N;𝒪)=(⊕_{1≤k≤j} S_k(Γ₁(N);K))∩𝒪[[q]]`. The intersection is taken after summing the weight components in `K[[q]]`; it is not their direct sum of integral lattices. At any additional chosen cusp use the transported Tate parameter and coefficient extension of §0.1. Set `D^M=⋃_j D_j^M` and `D^S=⋃_j D_j^S`; their `p`-adic completions are `M̄` and `S̄`. These conventions apply throughout §§0.3–0.17, including the finite Hecke images, discrete duals and ordinary parts. (Source: [Hida](#ref-hida), §1, pp. 235–236.)

If `N₀ ≥ 3` or `p ≥ 5` (Layer 0 uses `p ≥ 5` throughout), then `W(N; ℤ_p) = W(N₀; ℤ_p)` equals the `p`-adic closure `M̄(N; ℤ_p)` of `D^M(N₀;ℤ_p)` in `ℤ_p[[q]]`, and modulo `p`, `W(N₀; F_p)^Γ ≅ G(Γ₁(N₀); F_p)/(E_{p−1} − 1)`, where `Γ=1+pℤ_p` and `G` is the graded algebra of mod-`p` modular forms of all weights; the isomorphism preserves `q`-expansions.

Hypothesis `N₀ ≥ 3` or `p ≥ 5` (Katz's Theorem 1.1).

Katz's Theorem 1.1 at full level `Γ(N₀)`, from the full Igusa trivialisation tower over the ordinary locus, whose group is `ℤ_p^× = μ_{p−1} × Γ`. The `Γ`-tower lies over the first Igusa level; retain the `μ_{p−1}` action and its weight-character decomposition in descent (Katz, Higher congruences between modular forms, Ann. of Math. 101 (1975), §2, Theorems 2.1–2.2, as recalled by Hida). Descend to `Γ₁(N₀)` with the trace `Tr(f) = N₀⁻¹ Σ_{u ∈ U₀} f|u`, which is uniformly continuous and fixes `E_{p−1} − 1` (Corollary 1.2).

The mod-`p` statement uses the Hasse invariant `E_{p−1} ≡ 1`: it is the reason `p`-adic weights are congruent `mod p − 1`.

See [Hida](#ref-hida), §1, Theorem 1.1, p. 240 (Numdam PDF page 11; printed page = PDF page + 229); [Hida](#ref-hida), §1, after Theorem 1.1, p. 241 (Numdam PDF page 12; printed page = PDF page + 229); [Hida](#ref-hida), §1, Corollary 1.2 and proof, pp. 241–242.

**Checks.**

- At `p=5`, `D=(E₄−1)/5` lies in `D_4^M(1;ℤ₅)` and hence in `W(1;ℤ₅)`. With `γ=6`, `D|γ−D=259E₄≡4 mod 5`; the closure of sums of individually integral tame-level forms is fixed by `γ` modulo 5 and omits `D`.
- The cusp form `(E₄Δ−Δ)/5` lies in `D_16^S(5;ℤ₅)`, although its two weight components are not individually integral.
- The displayed mod-`p` graded quotient describes `Γ`-invariants; `D mod 5` is a noninvariant Katz form and does not contradict that comparison.

This uses §0.1.

### 0.3 Hecke operators and the weight action on `p`-adic modular forms

On `M̄(N; 𝒪_K)` (`N` divisible by `p`) the operators `T(ℓ)` and `T(ℓ, ℓ)` are defined by Hida's `q`-expansion formulas (1.13), agreeing with the classical operators on each `M_k(Γ₁(N); 𝒪_K)`; they are `p`-adically contracting `(|f|T(ℓ)|_p ≤ |f|_p)`, hence extend to the `p`-adic closure. The profinite group `Z = ℤ_p^× × (ℤ/N₀)^×` acts continuously by `(f|z)(E, φ, i) = f(E, z_p⁻¹φ, z₀i)`, which on weight-`k` forms is `z_p^k` times the diamond action.

`N` divisible by `p`; the weight action is through Katz's modular interpretation.

Check (1.13) against the classical formulas on each weight, then extend by uniform continuity. (1.12): on weight `k`, `f|z = z_p^k f|γ` with `γ ∈ Γ₀(N)` of lower-right entry `≡ z₀`.

`T(p) = U_p` for `p | N`; its `q`-expansion is `a(n, f|U_p) = a(np, f)`.

- `padicHeckeT`: `T(ℓ)` on `M̄(N; 𝒪)`.
- `padicHeckeT_qExpansion`: Hida's formulas (1.13).
- `padicHeckeU_qExpansion`: `a(n, f|U_p) = a(np, f)`.
- `padicWeightAction`: The continuous action of `Z = ℤ_p^× × (ℤ/N₀)^×`.

**Checks.**

- `U_p` on the `p`-stabilised `E_2^{(p)}` has eigenvalue 1.
- On a classical form of weight `k`, `T(ℓ)` agrees with the classical `T_ℓ`.
- `z ∈ 1 + pℤ_p` acts on a weight-`k` form by `z^k` (degenerate check on constants: weight 0 acts trivially).

See [Hida](#ref-hida), §1, (1.13), p. 243 (Numdam PDF page 14; printed page = PDF page + 229); [Hida](#ref-hida), §1, (1.12), p. 242 (Numdam PDF page 13; printed page = PDF page + 229).

This uses §0.2; §0.1; Tau Ceti `HeckeRing.GL2.heckeUNat`.

### 0.4 Hida's universal Hecke algebra

`H_j(N; 𝒪_K)` is the `𝒪_K`-subalgebra of `End_𝒪(D_j^M(N;𝒪))` generated by the `T(ℓ)`, `T(ℓ, ℓ)`; the restriction maps `H_{j+1} → H_j` are surjective and `H(N; 𝒪_K) := lim_j H_j(N; 𝒪_K)` is a compact ring acting faithfully and continuously on `M̄(N; 𝒪_K)`. It is independent of the power of `p` in `N: H(N₀pʳ; 𝒪) = H(N₀p; 𝒪)`. The images on `D_j^S` give `h_j` and `h(N;𝒪)=lim_j h_j`. Rational stability and the contracting expansion formulas preserve these saturated lattices, including their divided congruences.

Each `H_j` is free of finite rank over `𝒪_K`.

Finite freeness of `H_j` gives compactness; the projective limit of compact rings is compact. Independence of the `p`-power: restriction `H(N; 𝒪) → H(N₀p; 𝒪)` is surjective and injective by Corollary 1.2.

Over `K` (not `𝒪_K`) the analogous limit does not act continuously; keep integral coefficients.

- `universalHecke`: `H(N; 𝒪) = lim H_j`.
- `universalHecke_compact`: `H(N; 𝒪)` is a compact topological ring.
- `universalHecke_level_indep`: `H(N₀pʳ; 𝒪) ≃ H(N₀p; 𝒪)`.
- `universalHecke_restrict`: `H(N; 𝒪) → H_k(Γ₁(N); 𝒪)` for each weight.

**Checks.**

- `N = p = 5: H(5; ℤ_5)` surjects onto the weight-2 Hecke algebra of `Γ₁(5)`, which is `0 (S₂(Γ₁(5)) = 0)` for cusp forms.
- `H(25; ℤ_5) ≃ H(5; ℤ_5)`.
- `N = p = 11`: its image in `End S₂(Γ₁(11))` is `ℤ_11`, the space being spanned by `η(z)²η(11z)²`, on which `U_11` acts by `a₁₁ = 1`.

See [Hida](#ref-hida), §1, (1.14), p. 243 (Numdam PDF page 14; printed page = PDF page + 229).

This uses §0.3; §0.2.

### 0.5 Hida's ordinary idempotent

`e := lim_n T(p)^{n!} ∈ H(N; 𝒪_K)` (and in `h(N; 𝒪_K)`) exists, is idempotent, is compatible with every restriction `H(N; 𝒪) → H_j(N; 𝒪)`, and on each finite level is the ordinary projector of `T(p)`. For a module `M` over `H(N; 𝒪)` the ordinary part is `M^ord = eM`.

Instance of PadicFamilies L0a: each `H_j` is a finite `𝒪`-algebra, complete for the `p`-adic topology.

Apply the finite-algebra supplier contract to `t = T(p)` in each `H_j` (finite over `𝒪`, residue field finite). Naturality (§0a.13) makes the `e_j` compatible under `H_{j+1} → H_j`; set `e = lim e_j`.

Hida's own construction (Jordan decomposition modulo `p` and lifting) gives the same idempotent by uniqueness in L0a. At `p ≥ 5`, identify its action with the projectors on the shared towers of `IntegralIwasawaTheory`, §9.0: both are limits of the same `U_p^{n!}` under the Hecke-compatible Katz comparison. No averaging over a group order is used.

- `hidaIdempotent`: `e = lim T(p)^{n!}`.
- `hidaIdempotent_isIdempotent`: `e² = e`.
- `hidaIdempotent_restrict`: `e` restricts to the finite-level ordinary projector.
- `ordinaryHecke`: `H^ord(N; 𝒪) = eH(N; 𝒪)`, `h^ord = eh`.

**Checks.**

- At `p=11`, `τ(11)=534612≡1 mod 11`. The unit-root 11-stabilisation `Δ_α(z)=Δ(z)−βΔ(11z)`, where `αβ=11¹¹`, is fixed by `e`; the original `Δ` is not asserted to be a `U_11`-eigenform at level 11.
- At `p=2`, both roots of `X²+24X+2¹¹` have positive 2-adic valuation, so `e` kills the two-dimensional old space generated by `Δ(z)`,`Δ(2z)`. This is a projector test; Hida’s `p≥5` control theorem is not used.
- `e` fixes the `p`-stabilised Eisenstein series `E_k^{(p)}` (`U_p`-eigenvalue 1).

See [Hida](#ref-hida), §1, (1.17a–b), p. 244 (Numdam PDF page 15; printed page = PDF page + 229).

This uses §0.4; the finite-algebra supplier contract; §0a.13; §0a.14.

### 0.6 Duality between Hecke algebras and modular forms

For `A=K` or `𝒪_K` let `M⁺_j(N;A)` be Hida’s quotient by constants (2.2): over `K` it is `⊕_{1≤k≤j} M_k(Γ₁(N);K)`; over `𝒪_K` its lattice requires integrality of all positive `q`-coefficients. Let `H⁺_j` be the Hecke algebra acting on this lattice. Proposition 2.1 identifies `H⁺_j≅Hom_A(M⁺_j,A)` and `h_j≅Hom_A(D_j^S,A)` (with `D_j^S⊗K` when `A=K`) via `(h,f)↦a(1,f|h)`. For `p≥5`, the universal `H` is also `lim_j H⁺_j` by (2.3). Theorem 2.2 gives compact–discrete Pontryagin duality between `H(N;ℤ_p)` and `M(N;ℚ_p)/(M(N;ℤ_p)+ℚ_p)`, where `M(N;ℤ_p)=D^M(N;ℤ_p)` and `M(N;ℚ_p)=D^M⊗ℚ_p`; likewise `h` and `(D^S⊗ℚ_p)/D^S`. The quotient-by-constants lattice `M⁺_j` still imposes only positive-coefficient integrality; it is kept distinct from `D_j^M`. Corollary 2.3 restricts the pairing to ordinary parts.

`p≥5` for passage to the universal algebra and discrete dual. Constants are quotiented out on the modular-form side; cusp forms require no such quotient.

At finite level `(T(n),f)=a(n,f)` detects a form only modulo constants. Over `K` use the faithful Hecke action; over `𝒪_K` the positive-coefficient integral lattice identifies with the integral dual (Proposition 2.1). Equation (2.3), using density of positive weights for `p≥5`, identifies the universal algebra with the inverse limit of these finite algebras. Dualising their finite free `ℤ_p`-modules into `ℚ_p/ℤ_p` and taking the direct limit yields the discrete module of (2.4b). Hecke self-adjointness for this pairing, equation (2.7), identifies the ordinary summands.

Constants would lie in the kernel of a first-coefficient pairing if not removed. The discrete dual is an algebraic direct-limit module, and is not asserted to be the quotient of the Banach completion of `q`-expansions.

See [Hida](#ref-hida), §2, Proposition 2.1, p. 245 (Numdam PDF page 16; printed page = PDF page + 229); [Hida](#ref-hida), §2, Theorem 2.2, p. 247 (Numdam PDF page 18; printed page = PDF page + 229).

**Checks.**

- At `p=5`, `f=Δ` and `g=E₄Δ` at level 5 have congruent expansions, so `a₁(f|h)≡a₁(g|h) mod 5` for every integral Hecke operator. The functional selecting only the weight-12 coefficient is not integral on `(g−f)/5` and is excluded from the dual of `D_16^S`.
- A constant has every positive coefficient zero, so it must be removed before first-coefficient duality on the all-form side.
- A cuspidal divided congruence needs no quotient by constants; its integral dual is the dual of `D_j^S`, not of the sum of individual integral weight spaces.

This uses §0.4; §0.5; Tau Ceti `HeckeRing.GL2.heckeUNat`.

### 0.7 The weight algebra `Λ` and arithmetic points

Use the supplied completed group ring `Λ_𝒪 = 𝒪[[Γ]] ≅ 𝒪[[X]]`, with `Γ = 1 + pℤ_p` and generator `u = 1 + p (γ = u ↦ 1 + X)`. The action of `Γ ⊂ Z` on `M̄(N; 𝒪)` commutes with the Hecke operators, making `H(N; 𝒪)` and `H^ord(N; 𝒪)` into `Λ_𝒪`-algebras. For `k ∈ ℤ`, `P_k = (1 + X) − u^k ∈ Λ`; the arithmetic specialisation at weight `k` is reduction modulo `P_k`. `H^ord` decomposes over the characters `a mod p − 1` of `μ_{p−1} ⊂ ℤ_p^×` as `⊕_a H^ord(N, a; 𝒪)`.

`p ≥ 5` so that `ℤ_p^× = μ_{p−1} × Γ`.

The `Γ`-action is by Hecke-equivariant automorphisms (the diamond action commutes with `T(ℓ)`), so `ℤ_p[Γ] → H` extends continuously to `Λ = ℤ_p[[Γ]]`. Idempotents of `ℤ_p[μ_{p−1}]` split `H^ord` by the character `a`.

Use the power-series coordinate of ProfiniteProPGroups Layer 9 / PadicMeasuresIwasawaAlgebras §1; do not rebuild `Λ`. The comparison with `IntegralIwasawaTheory`, §9.0, is the scalar transport `[z]_inv ↦ z²[z]_w⁻¹` in the supplier contract. In particular the supplier's inverse weight-and-level ideal maps to `ω_{r,k}=((1+X)^{p^{r−1}}−u^{k p^{r−1}})` up to a unit, and at `r=1` to `P_k`. Retain the component map `ω^a ↔ ω^(2−a)` as well as the principal-unit variable.

- `arithmeticPoint`: `P_k = (1 + X) − (1 + p)^k`.
- `ordinaryHecke_lambdaAlgebra`: `H^ord(N; 𝒪)` is the `Λ_𝒪`-algebra obtained from the shared ordinary algebra by `[z]_inv ↦ z²[z]_w⁻¹`, identified with the Katz Hecke image.
- `ordinaryHecke_decomp`: `H^ord = ⊕_{a mod p−1} H^ord(N, a)`.

**Checks.**

- `P_k ≠ P_{k′}` for `k ≠ k′` (`u` has infinite order).
- `Λ/P_k ≅ 𝒪` by `X ↦ u^k − 1`.
- `P_k ≡ P_{k′} mod p^{m+1}` when `k ≡ k′ mod p^m` (weight congruences).

See [Hida](#ref-hida), §3, Corollary 3.2 and the definition of P_k, p. 250 (Numdam PDF page 21; printed page = PDF page + 229).

This uses §0.3; §0.5; `IntegralIwasawaTheory`, §9.0, `rationalOrdinaryControl`; `PadicMeasuresIwasawaAlgebras`, §1 (Completed group algebras).

### 0.8 Jochnowitz's lemma

For `k ≥ 3` and `p ≥ 5`, `T(p)` annihilates the quotients `M_{k+(p−1)}(Γ₁(N₀); F_p)/M_k(Γ₁(N₀); F_p)` and `S_{k+(p−1)}/S_k`, where weight-`k` forms embed in weight `k + p − 1` by multiplication by `E_{p−1} ≡ 1`.

`k ≥ 3`, `p ≥ 5`; the proof for `Γ₀(N₀)` works unchanged for `Γ₁(N₀)`.

The filtration theory of mod-`p` forms: `U_p` lowers the filtration of a form of weight `k + (p − 1)` to at most weight `k` when `k ≥ 3` (Jochnowitz, via the `θ`-operator and the Hasse invariant).

Test: `p=5`, `k=8`: the quotient `S₁₂/S₈` is the nonzero line generated by `Δ`. Since `τ(5)=4830≡0 mod 5` and `Δ` is a Hecke eigenform, `U₅Δ=0` modulo 5.

See [Hida](#ref-hida), §4, Lemma 4.1, p. 258 (Numdam PDF page 29; printed page = PDF page + 229).

This uses §0.2; §0.3.

### 0.9 Ordinary mod-`p` forms live in bounded weight

For `p ≥ 5`, prove `q`-expansion-preserving isomorphisms `(M^ord(N; T_p)[p])^Γ ≅ ⊕_{a mod p−1} M^ord_{j(a)}(Γ₁(N₀); F_p)` and similarly for cusp forms, with `j(a) ∈ [3, p + 1]` the representative of a.

The bound includes `p=5`. Hida states Theorem 4.2 for `p>5` and Corollary 4.2 for `p≥5`; establish the endpoint by repeating the filtration argument with `E₄≡1` modulo 5 and the `p=5` case of Lemma 4.1. The representatives `j(a)` are 4,5,6,3 for `a=0`,1,2,3 respectively, so the same interval `[3,p+1]` contains every weight class.

For the saturated union `D^M` (and `D^S` on the cusp side), reduction modulo `p` followed by `Γ`-invariants identifies with `W(N₀;𝔽_p)^Γ≅G(Γ₁(N₀);𝔽_p)/(E_{p−1}−1)` (Corollary 1.2 and §4 equation (4.2)), decomposed by weight modulo `p−1`. The discrete ordinary module includes constants at this step, as in Theorem 4.2; the constants quotient is accounted for when dualising to `H`. Apply `e`: by Jochnowitz the ordinary part of each weight class stabilises at the smallest weight `j(a) ≥ 3`.

The bound is what makes the ordinary Hecke algebra finite over `Λ`.

See [Hida](#ref-hida), §4, Theorem 4.2, p. 258 (Numdam PDF page 29; printed page = PDF page + 229); [Hida](#ref-hida), §4, proof of Theorem 4.2, p. 258 (Numdam PDF page 29; printed page = PDF page + 229).

This uses §0.8; §0.2; §0.5.

### 0.10 The ordinary Hecke algebra is finite over `Λ`

For `p ≥ 5`, transport the finite weight algebras of `IntegralIwasawaTheory`, §9.0, through §0.7: `H^ord(N; 𝒪_K)` and `h^ord(N; 𝒪_K)` are finite `Λ_𝒪`-modules, and `H^ord(N; 𝒪_K) = H^ord(N; ℤ_p) ⊗_{ℤ_p} 𝒪_K`.

`p ≥ 5`.

By duality, finiteness over `Λ` is equivalent to cofiniteness of the Pontryagin dual `M^ord(N; T_p)` over `Λ`. The `Γ`-invariants of its `p`-torsion are finite (Theorem 4.2), so by topological Nakayama over `Λ` (local with residue field `F_p`) the dual is cofinitely generated.

Compactness plus finiteness of the `Γ`-invariants of the `p`-torsion, not a bound on individual weights, gives finiteness.

See [Hida](#ref-hida), §4, Corollary 4.2, p. 258 (Numdam PDF page 29; printed page = PDF page + 229).

This uses §0.9; §0.6; §0.7; §0a.14; §0.16.

### 0.11 Hida's control theorem

Transport `IntegralIwasawaTheory`, §9.0, `rationalOrdinaryControl`, through the Katz and coordinate comparisons of §§0.2–0.7. For `p ≥ 5` and `p | N: H^ord(N; 𝒪_K)` and `h^ord(N; 𝒪_K)` are free of finite rank over `Λ_𝒪`, with `rank_Λ H^ord(N, a) = rank_{ℤ_p} M_k^ord(Φ; ℤ_p)` for every `k ≥ 3` with `k ≡ a mod p − 1` (and similarly for cusp forms with `k ≥ 2`). Restriction induces isomorphisms `H^ord(N, a)/P_k H^ord(N, a) ≅ H_k^ord(Γ₁(N₀p), ω^{a−k}; 𝒪_K)` for `k ≥ j(a)`, and `h^ord(N, a)/P_k ≅ h_k^ord(Γ₁(N₀p), ω^{a−k}; 𝒪_K)` for `k ≥ 2`.

`p ≥ 5` and `p | N`; `ω` the Teichmüller character; the finite-level algebras are those of weight `k`, level `N₀p` and nebentypus `ω^{a−k}`.

Following §5 equations (5.1)–(5.4), Jochnowitz and divisibility identify the fixed-weight ordinary discrete submodule with the classical module and compute its `ℤ_p`-`corank r(a)`. Compact Nakayama gives a surjection `Λ^{r(a)}→M(a)`, the dual of the discrete ordinary module before quotienting constants. Every reduction at `P_k` in the appropriate weight class is a surjection between free `ℤ_p`-modules of equal rank and hence an isomorphism. Its kernel is contained in `P_kΛ^{r(a)}` for every such `k`, and their intersection is zero, proving freeness (§5 (5.5)). For the weight class `a=0` on the modular-form side, quotienting constants gives the kernel of `Λ^{r(0)}→ℤ_p=Λ/(X)`. In a suitable basis this is `XΛ⊕Λ^{r(0)−1}`, hence free (§5 (5.6)); the other classes and cusp forms have no constants correction. Control follows from equality of the `P_k`-torsion discrete module with the classical level-`N₀p` module. Hida proves the requisite rank inequality by multiplication by congruence-to-one Eisenstein series; the cusp-form `k=2` case additionally invokes Hida 1985 Proposition 6.2 / Ribet (§5 (5.8), p. 262). Include a separate `ordinary_weightTwo_rank` target: in each cuspidal weight component the ordinary weight-two rank is the same `r(a)` as at the higher congruent weights. Prove it through the ordinary cohomology of the modular curve and the weight-two rank comparison used in (5.8), keeping the two diamond characters in that equation. This is the additional rank calculation needed for the `k=2` endpoint; neither torsion-freeness nor a higher-weight rank bound proves it. The locator for this calculation is Hida’s use of his 1985 Proposition 6.2 and Ribet on p. 262; the present target includes that proof rather than presupposing it as a library theorem.

The weight range differs for modular forms `(k ≥ j(a))` and cusp forms `(k ≥ 2)`. Finite flatness is over `Λ`; do not assume the local components are Gorenstein.

See [Hida](#ref-hida), §3, Theorem 3.1, p. 250 (Numdam PDF page 21; printed page = PDF page + 229); [Hida](#ref-hida), §3, Corollary 3.2, p. 250 (Numdam PDF page 21; printed page = PDF page + 229); [Hida](#ref-hida), §3, p. 250 (Numdam PDF page 21; printed page = PDF page + 229); [Hida](#ref-hida), §5, (5.1)–(5.8), pp. 259–262.

This uses §0.10; §0.7; §0.6; §0.9; `IntegralIwasawaTheory`, §9.0, `rationalOrdinaryControl`. The Katz weight-two rank proof `ordinary_weightTwo_rank` is a target here.

### 0.12 The ordinary `Λ`-adic Eisenstein family

**Eisenstein adapters and ordinary comparison.** Let `p ≥ 5`, let `ψ` be an even Dirichlet character at a positive tame level `D` prime to `p`, with values in `𝒪`, and let `N₀` be a multiple of `D` prime to `p`. Use `Λ_w = 𝒪[[1 + pℤ_p]]` with the weight convention `P_k` of §0.7. The following names adapt the full-character arithmetic objects of `DirichletPadicLFunctions`, §§1.6 and 5.4–5.9, to this coefficient algebra, using the canonical object of `IntegralIwasawaTheory`, §5.0, and its normalization in §6.3. On the common nonexceptional ordinary domain they identify with its §9.0 Eisenstein family, preserving `a₁ = 1`, the full constant and Hecke eigenvalues. The ordinary modularity and Hecke comparisons use [Hida](#ref-hida), §7, (7.15), p. 271, and `ModularForms`, Layer 0; the arithmetic normalization is [RJW](#ref-rjw), §8, Theorem 8.2, p. 160.

For `n ≥ 1`, define `eisensteinCoefficientMeasure ψ n` as the angular pushforward of the inverse-coordinate weighting of `integralTwistedPositiveEisensteinMeasure` with left character 1 at level one and right character `ψ` at level `D`. Its supplied coefficient formula becomes `Σ_(d|n, p∤d) ψ(d)d⁻¹[⟨d⟩]`. Coefficient extension, moments and the equality of the coefficients at `pn` and `n` are transported from that ordered-pair interface.

Define `eisensteinConstantTerm ψ` and `eisensteinFamily ψ` by the same coefficientwise transport of the supplied full character family, including its constant. For `ψ = 1` at level one use `fullEisensteinAwaySeries` with the numerator `clearedEisensteinSeries`: transport both the clearing identity and its cross-multiplication identities, giving constant the angular image of `kubotaLeopoldtPseudomeasure/2` and denominator `2([⟨u⟩] − 1)`. Use a regular transported denominator to identify this localization with a subalgebra of `Frac Λ_w`; for example `u = 1 + p` gives denominator `2X`. Do not extend angular pushforward to arbitrary fractions. For nonprincipal `ψ`, use `normalizedTameEisensteinSeriesMeasure` of §5.7, with the unit 2 in `𝒪`. For a principal character at actual level `D > 1`, use `principalTameEisensteinSeries` of §5.8, including its deletions at every prime dividing `D`. After transport its factor at such a prime `ℓ` is `1 − ℓ⁻¹[⟨ℓ⟩]`. Thus all three adapters use the supplier's full constants as well as its positive coefficients.

The resulting expansion is `𝓔_ψ = eisensteinConstantTerm ψ + Σ_(n≥1) eisensteinCoefficientMeasure ψ n qⁿ` in `(Frac Λ_w)[[q]]`, with positive coefficients in `Λ_w`. An evaluation at a weight character `κ` is defined on the chosen localization only if its transported clearing factor has nonzero image; for the principal level-one denominator this is `2(κ(⟨u⟩) − 1) ≠ 0`. At `κ(⟨x⟩) = ⟨x⟩^k`, the divisor weight is `ψ(d)ω(d)^(−k)d^(k−1)`. Retain `θ = ψω^(−k)` at its actual level, its primitive inducing character, and all omitted tame Euler factors in the supplied §5.9 constant comparison. For primitive `ψ` this gives `L(1 − k, θ₀)(1 − θ₀(p)p^(k−1))/2`, where `θ₀` is the primitive inducing character of `θ`; imprimitive `ψ` retains the additional tame deletions. The weight-zero test for the level-one principal constant is excluded by its pole.

The analytic comparison fixes the scalar, not just its ideal: for primitive `ψ` at every admissible positive arithmetic weight, `eisensteinConstantTerm ψ(P_k) = L_p(ψ,1−k)/2`, using `IntegralIwasawaTheory`, §5.0, `kubotaLeopoldt_interpolation`. Its analytic coordinate is transported by `1 + S ↦ u(1 + X)⁻¹` as in §6.3 of that supplier, and its inverse-diamond tower coordinate by §0.7. For imprimitive `ψ`, transport the same additional tame Euler deletions on both sides. Equality of the positive coefficients together with this constant, or their cleared identities at a pole, identifies the full shared series. The principal pole, general tame levels and weight-two holomorphic comparison retain the full-character interfaces above; they are not restricted to an Eisenstein localization.

Prove the ordinary modular-form comparison at admissible arithmetic points `P_k`, `k ≥ 2`, with the stated parity, actual level and coefficient embeddings. For `k ≥ 3` use the supplied full character interpolation, including the primitive-character and level-raising comparison. At `k = 2` use the actual holomorphic Eisenstein form and its full specified q-expansion from `ModularForms`, Layer 0, to discharge the input of `characterEisenstein_lowWeight_of_qExpansion`; for the trivial-character pair use the corrected stabilized difference in place of a holomorphic level-one `E₂`. Here `E_k^{(p)}(θ)` denotes the form with right character `θ` at the actual level and the supplied Euler deletions. These comparisons take place at level `Γ₁(N₀p)` after the stated level inclusions.

- `eisensteinFamily`: the transported full `Λ_w`-adic expansion `𝓔_ψ`.
- `eisensteinFamily_specialise`: under the admissibility and modular-form hypotheses above, the specialization at `P_k` is `E_k^{(p)}(ψω^(−k))`; when `k ≡ 0 mod p − 1` the character is `ψ` at its actual tame level.
- `eisensteinFamily_ordinary`: `U_p𝓔_ψ = 𝓔_ψ`; hence the ordinary projector fixes the family.
- `eisensteinFamily_hecke`: `T(ℓ)𝓔_ψ = (1 + ψ(ℓ)[⟨ℓ⟩]ℓ⁻¹)𝓔_ψ` for `ℓ ∤ N₀p`.

The modular Hecke identities follow from the full q-expansion comparison, with the constant coefficient retained, and extend to the family through the cleared coefficient identities and arithmetic specialization. The `U_p` identity also follows directly from the supplied `p`-index identity and the unchanged constant.

**Checks.**

- The coefficient at 1 is the Dirac measure at 1, with every arithmetic moment 1. The coefficient at `p` is the same measure, and `U_p` has eigenvalue 1.
- For `p = 5`, level-one `ψ = 1` and `k = 4`, the coefficient at 2 is `1 + 2³ = 9` and the constant is `(1 − 5³)ζ(−3)/2 = −31/60`. Without stabilization the constant would be `1/240`.
- At `p = 5`, `k = 2` and level-one `ψ = 1`, the inducing character is the nontrivial character `ω^(−2)`. Omitting inverse-coordinate weighting changes exponent `k − 1` to `k` and gives the wrong coefficients.
- The trivial weight character kills every principal transported clearing factor. The uncleared level-one constant has no value there; the transported cleared identities still hold.
- A torsion unit `u` with `⟨u⟩ = 1` gives zero transported denominator, even if `u ≠ 1`. The choice `u = 1 + p` gives `2X`, regular in `Λ_w`, and has nonzero value at every positive integer weight.
- Principal characters at tame levels `D = ℓ` and `D = ℓ²`, `ℓ ≠ p`, give the same deletions. Their coefficient at `q^ℓ` is 1; their constant deletion at weight `k` is `1 − ω(ℓ)^(−k)ℓ^(k−1)`, retaining the actual tame level.

*Needs:* §§0.7, 0.5; `IntegralIwasawaTheory`, §§5.0, 6.3 and 9.0 (`kubotaLeopoldt_interpolation`, `bernoulliStickelberger_dictionary`, `rationalOrdinaryControl` and the normalized ordinary Eisenstein family); `DirichletPadicLFunctions`, §§1.6 and 5.4–5.9; `PadicMeasuresIwasawaAlgebras`, §§1 and 3.1–3.3; `ModularForms`, Layer 0.

### 0.13 Specialisation to classical ordinary forms

**Classical specialisation with tame degeneracy data.** Let `p ≥ 5` and let `F ∈ S^ord(N, a; Λ)` be a normalised `Λ`-adic eigenform (a `Λ`-algebra homomorphism `h^ord(N, a) → I`, `I` finite over `Λ`). For every arithmetic point `P` of `I` above `P_k (k ≥ 2)`, `g_P = F mod P` is the `q`-expansion of a classical normalised ordinary eigenform of weight `k`, level `N₀p` (or `N₀pʳ` for characters of conductor `pʳ`), nebentypus `ω^{a−k}` (times the finite character).

When `g_P` is old at `p`, retain its specified normalised tame-level eigenform `h ∈ S_k(Γ₁(N₀), χ)`, which may itself be tame old. Write `V_d h(z) = h(dz)`. If `α` is the unit root and `β` the other root of `X² − a_p(h)X + p^{k−1}χ(p)`, then `g_P = h_α = h − βV_p h`. This is the unique normalised ordinary eigenvector in `span{h, V_p h}`. Separately record the associated primitive newform `f` of conductor `M | N₀`, the descent of `χ` to `M`, and the tame degeneracy coefficients `h = Σ_(d|N₀/M) c_d V_d f`, with `c_1 = 1`. The actual specialisation is `g_P = Σ_(d|N₀/M) c_d V_d f_α`. Tame primitivity gives `h = f`; general arithmetic points retain the full tame oldspace data and bad-prime eigenvalues.

`k ≥ 2`; `p ∤ N₀`. In the `p`-old case `χ` descends to the tame level and `a_p(h)` is a unit. Uniqueness of the unit-root stabilisation is relative to `h`, including its tame degeneracy data.

The specialization map of `IntegralIwasawaTheory`, §9.0, transported through §§0.7 and 0.11, identifies `h^ord/P_k` with the classical ordinary Hecke algebra (Corollary 3.2), so the specialised eigensystem is classical. `ModularForms`, Layers 4A, 4B and 5, supply the primitive associate and its tame oldspace. The companion-matrix calculation of `ModularSymbolsPadicLFunctions`, §1.3, applies to `h` by linearity in its tame degeneracy expansion: `U_p h = a_p(h)h − p^{k−1}χ(p)V_p h` and `U_pV_p h = h`. Since `k ≥ 2`, the two roots have valuations 0 and `k − 1`, giving one ordinary line in this two-dimensional span. The operators `V_d` for `p ∤ d` commute with `V_p`, so the same tame coefficients occur after ordinary stabilisation.

Record nebentypus, the primitive associate, tame degeneracy data, `p`-refinement and oldspace multiplicities at each arithmetic point. For a `p`-new specialisation retain its actual conductor and `U_p` eigenvalue.

**Checks.**

- If `h` is tame new, `M = N₀`, `c_1 = 1` and `h_α = f − βV_p f` is the usual ordinary stabilisation of the primitive form.
- Take `p = 11`, `N₀ = 2` and the weight-12 level-one form `Δ`, with `a_2 = −24` and `a_11 = 534612 ≡ 1 mod 11`. Choose roots `α_2, β_2` of `X² + 24X + 2¹¹`, and let `α_11` be the unit root at 11, with complementary root `β_11`. Then `h = (1 − β_2V_2)Δ` and `g = (1 − β_11V_11)h` give a normalised ordinary eigenform at level 22. Its coefficient at `q²` is `α_2 = −24 − β_2 ≠ −24`, since `α_2β_2 = 2¹¹`. Its primitive associate is `Δ`, whose 11-stabilisation has coefficient `−24` at `q²`; the tame stabilisation remains essential.
- For any specified ordinary `h` of weight `k ≥ 2`, the complementary root has valuation `k − 1 > 0`. The other stabilisation is nonordinary even when `h` is tame old.
- For `d | N₀/M`, `V_d(f − βV_p f) = V_d f − βV_pV_d f`. Thus ordinary stabilisation preserves every coefficient `c_d` of the tame oldspace vector, while uniqueness of the primitive pair alone does not determine those coefficients.

See [Hida](#ref-hida), §3, Corollary 3.2, p. 250 (Numdam PDF page 21; printed page = PDF page + 229); [EPW](#ref-epw), paragraph after Proposition 4.1.4 and §4.2, p. 31 (arXiv v1).

This uses §0.11; `ModularForms`, Layers 4A, 4B and 5; `ModularSymbolsPadicLFunctions`, §1.3; Tau Ceti `HeckeRing.GL2.Newform`.

### 0.14 `Λ`-adic forms as `q`-expansions and their duality with the ordinary Hecke algebra

Let `p ≥ 5`, `N = N₀p` with `p ∤ N₀`, `Λ = ℤ_p[[X]]` with `X ↔ γ − 1` for `γ = 1 + p`, and `I` a reduced finite flat `Λ`-algebra. An ordinary `Λ`-adic cusp form in weight component a of level `N` with coefficients in `I` is a formal `q`-expansion `F = Σ_{n≥1} a(n, F)qⁿ ∈ I[[q]]` such that for every arithmetic point `P` of `I` above `P_k = (1 + X − (1 + p)^k)` with `k ≥ 2` the specialisation `F mod P` is the `q`-expansion of a classical ordinary cusp form of weight `k` and level `N₀p` with nebentypus `ω^{a−k}` at points above `P_k`. They form an `I`-module `S^ord(N,a; I)`. The pairing `(h, F) ↦ a(1, F|h)` identifies `S^ord(N; Λ)` with `Hom_Λ(h^ord(N,a; Λ), Λ)`, and normalised eigenforms in `S^ord(N,a; I)` correspond to `Λ`-algebra homomorphisms `h^ord(N,a; Λ) → I`. This definition does not use the Eisenstein family.

`p ≥ 5`; `N₀` prime to `p`; the arithmetic-point definition requires reduced finite flat `I`, with specialisation at every arithmetic point of weight `k ≥ 2`. For arbitrary finite flat `I`, define `S^ord(N,a; I) = Hom_Λ(h^ord(N,a; Λ), I)` and its coefficients by `a_n = ℓ(T(n))`; control proves its classical specialisation property. Normalised eigenforms correspond to algebra maps for this definition too.

Weight-`k` duality: Hecke algebras and forms are dual under the first-coefficient pairing at every finite weight and level (§0.6). Freeness and control (§0.11): `h^ord(N; Λ)` is free of finite rank and its fibre at `P_k` is the weight-`k` ordinary Hecke algebra; hence `Hom_Λ(h^ord, Λ)` specialises at every `P_k` to the dual of the weight-`k` Hecke algebra, i.e. to ordinary cusp forms of weight `k`, which is the `q`-expansion condition. Conversely a family of `q`-expansions specialising to classical forms defines, through `a(1, F|T(n)) = a(n, F)`, a `Λ`-linear functional on the Hecke algebra (the Hecke operators act on `q`-expansions coefficientwise and their action is determined at a Zariski-dense set of weights).

For reduced finite flat `I`, prove equivalence with the classicality condition on a Zariski-dense set of arithmetic points of `Spec I`, as in Wiles's definition (Invent. Math. 94, 1988), using control and coefficientwise density. The dense set must meet every component. Field-valued points do not detect nilpotent coefficients.

- `LambdaAdicForm`: the Hecke-dual module `Hom_Λ(h^ord(N,a; Λ), I)`, embedded in `I[[q]]` by its Hecke coefficients; for reduced finite flat `I` this equals the arithmetic-point definition.
- `LambdaAdicForm.specialise`: `F ↦ F mod P`, a classical ordinary cusp form.
- `lambdaAdicForm_equiv_hom`: `S^ord(N; I) ≅ Hom_Λ(h^ord(N,a; Λ), I)` for finite flat `I`, via the first-coefficient pairing.
- `lambdaAdicEigenform_equiv_algHom`: Normalised eigenforms in `S^ord(N; I) ↔ Λ`-algebra maps `h^ord(N; Λ) → I`.
- `LambdaAdicForm.ext`: Two `Λ`-adic cusp forms on the fixed weight component are equal if all their positive `q`-coefficients agree.

**Checks.**

- For a `Λ`-algebra map `φ:h^ord(N,a)→I`, the coefficients `a_n=φ(T(n))` give a normalised eigenfamily `(a_1=1)` whose weight-`k` specialisation is the controlled ordinary eigensystem with character `ω^{a−k}`.
- The zero `q`-expansion is a `Λ`-adic form; `S^ord(N; I) = 0` when `h^ord(N; Λ) = 0`.
- For a `Λ`-linear functional `ℓ:h^ord(N,a)→Λ`, the corresponding `q`-expansion has coefficient `a_n=ℓ(T(n))`; for `I=h^ord(N,a)`, the identity algebra map gives the universal eigenfamily `Σ_{n≥1}T(n)qⁿ`.
- The ordinary `Λ`-adic Eisenstein family has nonzero constant term and is not in `S^ord(N; Λ)`.
- For `I=Λ[ε]/(ε²)`, every arithmetic field-valued point kills `ε`, so all `εqⁿ` pass pointwise classicality. Their infinite independent span cannot be the finite Hecke dual; this algebra requires the Hom definition.

See [Hida](#ref-hida), §2, Proposition 2.1 and Theorem 2.2, pp. 245–247; §3, (3.2), Theorem 3.1 and Corollary 3.2, pp. 249–250.

This uses §0.6; §0.11; §0.5; §0.7; Mathlib `PowerSeries`.

### 0.15 Primitive components of the ordinary Hecke algebra

Let `L` be the fraction field of `Λ_K` and `h^ord(N; 𝒪_K)` the cuspidal ordinary Hecke algebra `(p ≥ 5, N = N₀p)`. The algebra `h^ord(N; K) := h^ord(N; 𝒪_K) ⊗_Λ L` is a finite-dimensional L-algebra; its primitive part `h^ord_prim` (the part not coming from lower tame level) is semisimple, a product of finite field extensions `𝒦` of `L` (the primitive components). If `𝒦` is a primitive cuspidal component with `d = [𝒦 : L]`, then for every `k ≥ 2` exactly `d` ordinary eigenforms of weight `k` and level `Γ₁(N₀p)` belong to `𝒦`, their associated newforms have conductor divisible by `N₀`, and conversely every ordinary eigenform of weight `k ≥ 2` whose newform has conductor divisible by `N₀` belongs to a unique primitive component. The algebraic closure of `ℚ_p` in `𝒦` is a finite extension of `K`, and primitive components are compatible with extension of `K`.

`p ≥ 5`; `N₀` prime to `p`; cuspidal components.

Semisimplicity: the primitive part of `h^ord ⊗ L` injects into a product over classical weights of semisimple new Hecke algebras (Hecke operators on newforms are semisimple), so it has no nilradical. Import the full newform eigenproperties from ModularForms Layer 4 and the semisimplicity of the newspace Hecke algebra from its Layer 8G. The pinned Newform structure alone only carries eigenproperties at good indices. For a primitive component `𝒦`, distinguish the projected Hecke image from its `Λ`-free closure `h(𝒦)`. Put `h_𝒦=𝒦∩h`. Prove that this intersection lattice `h_𝒦` is reflexive, as in the intersection/free-closure construction in Hida §6, pp. 264–265; it is then free over the regular two-dimensional `Λ`. The quotient `h/h_𝒦` is torsion-free since `h_𝒦` is the intersection with a generic direct factor. Theorem 3.6 concerns the resulting congruence modules, rather than being an independent reflexivity criterion for every projected image. At `P_k` the quotient is free over the `DVR Λ_(P_k)`, so `(h_𝒦)_(P_k)/P_k` is an ideal of the classical ordinary Hecke algebra, annihilating oldforms. Newform semisimplicity makes it a semisimple direct summand. The local projected image and its free closure agree there, so the free closure’s rank-`d` specialization embeds into this summand and has `d` geometric eigencharacters. This proves the count, without asserting that an arbitrary projected image is `Λ`-flat. The converse uses the tame-level degeneracy count over all divisors of `N₀`, as in Corollary 3.7’s proof. Prop 3.4: `Λ_K ⊆ 𝒦` and `X` is transcendental over the algebraic closure `M` of `ℚ_p` in `𝒦`, so `[M : K]` divides `[𝒦 : L]`.

The non-primitive part of `h^ord ⊗ L` need not be semisimple (oldforms with repeated `U_ℓ`-eigenvalues), which is why the statement is for primitive components; §1.9 removes the `U_ℓ` to obtain a reduced algebra.

See [Hida](#ref-hida), §3, Proposition 3.4, Theorem 3.5 and the terminology before them, pp. 251–252; Theorem 3.6 and Corollary 3.7, p. 253; §6, proof of Corollary 3.7, pp. 264–265 (Numdam printed pagination).

This uses §0.11; §0.14; §0.13; Tau Ceti `HeckeRing.GL2.Newform`; Mathlib `FractionRing`; `ModularForms`, Layers 4 and 8G.

### 0.16 Adic completeness of compact coefficient modules

Let `Λ` be complete noetherian local with maximal ideal `𝔪` and finite residue field. Let `M` be a profinite Hausdorff `Λ`-module with continuous action and a basis of open `Λ`-submodules. Then `⋂_n 𝔪ⁿM=0` and the canonical map `M→lim_n M/𝔪ⁿM` is an algebraic isomorphism (equip each quotient with its quotient topology to obtain the topological statement). Finite generation from a finite residual quotient is the topological Nakayama theorem of `PadicMeasuresIwasawaAlgebras`, §5.2.

`M` is profinite with continuous `Λ`-action and a basis of open `Λ`-submodules. Before finite generation is proved, the submodules `𝔪ⁿM` need not be open.

Each finite continuous quotient `M/U` is killed by some power of `𝔪`; hence for every open `Λ`-submodule `U`, some `𝔪ⁿM` is contained in `U`. This proves separation. Each `𝔪ⁿ` is finitely generated, so `𝔪ⁿM` is a compact image of a finite power of `M` and is closed. Nested compact cosets prove surjectivity to the inverse limit.

The result compares the actual compact module with its adic inverse limit even before the adic submodules are known to be open.

See [Hida](#ref-hida), §4, proof of Corollary 4.2, pp. 258–259.

This uses Mathlib `IsAdicComplete`; Mathlib `Ideal.finite_quotient_pow`; Mathlib `Submodule.span`.

### 0.17 Cuspidal ordinary control at every odd prime

For every odd prime `p`, tame level `N₀` prime to `p`, and `Λ=𝒪[[1+pℤ_p]]`, construct the cuspidal ordinary Hecke algebra from the integral divided-congruence completion of the full `p`-power level tower. Prove `ordinaryCuspidal_control_oddPrime`: this algebra is finite free over `Λ`; at every arithmetic prime with character `γ↦γ^k ε(γ)`, `k≥2` and finite-order `ε`, its quotient is the faithful Hecke algebra on the classical ordinary cusp forms with that character. Retain the finite `μ_{p−1}` component `ω^a`, hence nebentypus `ω^{a−k}ε`, and its conductor: use level `N₀p^r` with `r=max(1,condExponent_p ε)`. Include coefficient extension, first-coefficient duality and the new-quotient specialization used to select primitive branches. At `p≥5` identify this construction with the cuspidal algebra of §§0.4–0.15 and the transported shared algebra of `IntegralIwasawaTheory`, §9.0; its `rationalOrdinaryControl` supplies the common control maps.

At `p=3`, build the divided-congruence tower directly from modular-curve cohomology and the ordinary projector of Layer 0a, using fine auxiliary tame level and descent to the stated level. Prove the ordinary moment/control and integral rank comparison in this construction, rather than applying the bounded-weight argument of §0.9 outside its range. The weight-two endpoint and all finite characters are included. Layers 1 and 4 use this cuspidal theorem for every odd prime; their non-Eisenstein localization identifies any all-form algebra with its cuspidal quotient. (Sources: [EPW](#ref-epw), Theorem 2.1.2 and proof, pp. 7–8, Theorem 2.2.2, pp. 9–10; its Hida references, [Hida](#ref-hida), Theorem 3.1 and Corollary 3.2, p. 250, and Invent. Math. 85 (1986), Theorems 1.1–1.2.)

The cuspidal divided-congruence union and completion are exactly `D^S` and `S̄` of §0.2, now at every odd prime; all ordinary control and duality use that saturated lattice.

**Checks.**

- At `p=3`, `N₀=11` and weight 2, the form of 11a1 has `a₃=−1`; its unit-root stabilization is included although §0.11 assumes `p≥5`.
- At `p=3`, a primitive character of `1+3ℤ₃` of order 3 has conductor 9. Its specialization uses level `9N₀`, retaining the chosen tame Teichmüller component, rather than level `3N₀`.
- At `p≥5` and `ε=1`, the cuspidal quotient at `P_k` agrees with §0.11, including `k=2` and nebentypus `ω^{a−k}`. The modular-form constants correction is absent from this cuspidal statement.

This uses Layer 0a; §0.16; `ModularCurvesPartII`, §§7.1–7.6, 13.1–13.6 and 14.1–14.15; `ModularForms`, Layers 4 and 8G; `PadicMeasuresIwasawaAlgebras`, §§1 and 5.2.

### Examples

Fix `p≥5` and a Teichmüller component `ω^a`. Evaluating `[1+p]` at weight `k` sends it to `(1+p)^k` and sends `X` to `(1+p)^k−1`. The residual character of the weight-`k` specialization is `ω^{a−k}`; choosing `k≡a` modulo `p−1` makes it trivial. Two different congruence classes therefore require different components, even when their principal-unit coordinates are arbitrarily close.

For a normalized ordinary eigenform `f`, the specialization of its `Λ`-adic `q`-expansion has first coefficient 1 and `U_p` eigenvalue `a_p(f)∈𝒪×`. Multiplication of the family by `X` instead gives first coefficient `X` and zero specialization at the augmentation weight; the normalized family condition is not preserved by arbitrary scalar multiplication. In the constants component the compact dual correction is `XΛ⊕Λ^{r−1}`, which is free of rank `r` although its embedding in `Λ^r` is not an isomorphism at `X=0`.

### Dependencies

Layer 0a provides the ordinary projector, exactness and compact module operations. `IntegralIwasawaTheory`, §9.0, supplies the shared rational ordinary towers, `rationalOrdinaryControl` and normalized ordinary Eisenstein family; §§5.0 and 6.3 supply the canonical analytic normalization. Sections 0.7–0.13 transport those maps, retain the independent weight-two rank proof and compare the broader character families. Classical forms and full Hecke eigenproperties come from `ModularForms`, Layers 4 and 8G, and the existing Tau Ceti classical carriers. `ModularCurvesPartII`, §§3–5, 7, 13–17, supplies the ordinary elliptic geometry, cohomology and `q`-expansion comparisons; the Igusa and weight-two rank comparisons are targets here. `PadicMeasuresIwasawaAlgebras`, §§1 and 5.2, supplies `Λ`, its complete topology and topological Nakayama; `DirichletPadicLFunctions`, §§1.6 and 5.4–5.9, supplies the full-character arithmetic Eisenstein constants, measures and interpolation used by §0.12. The compact Nakayama argument uses the completeness and finite-residue hypotheses stated in §0.16.

## Layer 1: Integral period modules and family measures

### 1.1 The ordinary family modular-symbol module `M_m`

Let `p` be odd and `N` prime to `p`. Let `T_N` be the cuspidal ordinary algebra of §0.17 and `m` a maximal ideal with irreducible residual representation `ρ̄_m`. Write `(T*_N)_m` for the ordinary Hecke image on the localized relative homology tower below; the boundary sequence identifies it with `(T_N)_m`. At `p≥5` this agrees with the localization of the all-form algebra of §0.4; at `p=3` this definition requires no all-form control theorem. For each `r ≥ 0` the relative homology sequence `0 → H₁(X₁(Np^r); ℤ_p) → H₁(X₁(Np^r), C₁(Np^r); ℤ_p) → H̃₀(C₁(Np^r); ℤ_p) → 0` (4.1) remains exact on ordinary parts, and after localising at `m` the reduced `H₀` of the cusps vanishes. So `M_m := lim_r H₁(X₁(Np^r); ℤ_p)^ord_m ≅ lim_r H₁(X₁(Np^r), cusps; ℤ_p)^ord_m` is a module over `(T*_N)_m ≅ (T_N)_m`. Complex conjugation on `X₁(Np^r)` commutes with the Hecke action, and `M_m = M⁺_m ⊕ M⁻_m`.

`p` odd (for the `±` splitting); `ρ̄_m` irreducible (so the cusps disappear after localisation and `(T*_N)_m = (T_N)_m`).

The ordinary projector is exact (L0a), so (4.1) stays exact on ordinary parts; Eisenstein maximal ideals carry the cuspidal `H̃₀`, and at non-Eisenstein `m` it vanishes. The transition maps in `r` are the corestrictions/traces on homology, compatible with the Hecke action; `M_m` is their inverse limit. At `p ≥ 5` these are the relative and absolute limits and boundary maps of `IntegralIwasawaTheory`, §9.0, with the scalar transport of §0.7; at `p = 3` use §0.17's extension. Complex conjugation commutes with `T(ℓ)`, `U_p` and the diamond operators on homology; 2 is invertible.

`M_m` is integral (over `ℤ_p`) and defined before inverting p. At an Eisenstein `m` the absolute and relative limits differ; the construction is only claimed for irreducible `ρ̄_m`.

- `familySymbols`: `M_m = lim_r H₁(X₁(Np^r); ℤ_p)^ord_m`.
- `familySymbols_relative`: `M_m ≅ lim_r H₁(X₁(Np^r), cusps; ℤ_p)^ord_m` for irreducible `ρ̄_m`.
- `familySymbols.heckeModule`: The `(T_N)_m`-module structure.
- `familySymbols.sign`: Complex conjugation and `M_m = M⁺_m ⊕ M⁻_m`.

**Checks.**

- At an Eisenstein `m` (`ρ̄_m` reducible) the reduced `H₀` of the cusps survives localisation, so the absolute and relative limits need not agree.
- For `p` odd, `x = (x + cx)/2 + (x − cx)/2` splits `M_m`; for `p = 2` this fails.
- Quotient by the weight-2 prime `P₂` of `Λ` (not by a full Hecke eigenpacket prime) recovers the ordinary weight-2 homology at level `Np` localized at the residual maximal ideal. Quotient by a classical Hecke eigenpacket further selects its eigenquotient; it does not recover the entire ordinary homology.

See [EPW](#ref-epw), §4.1, p. 28 (arXiv v1; printed page = PDF page).

This uses §0.17; §0a.7; §0a.11; `ModularCurvesPartII`, §§14.1–14.4a, 14.9 and 14.12.

### 1.2 Control of the family symbol module

(Hida, Invent. Math. 85 (1986), Theorem 3.1, and Amer. `J`. Math. 110 (1988), Theorem 1.9, as used by Emerton–Pollack–Weston.) `(lim→_r H¹(Np^r; ℚ_p/ℤ_p)^ord)^Γ ≅ H¹(Np; ℚ_p/ℤ_p)^ord` (4.2); and for `r≥1`, `k≥2`, let `ω_{r,k}=((1+X)^{p^{r−1}}−(1+p)^{k p^{r−1}})⊂Λ_w` in each retained `μ_{p−1}` component. Its geometric roots are the weight characters `κ(z)=z^kε(z)` with finite-order part `ε` trivial on `1+p^rℤ_p` (equivalently `κ(z)=z^k` there). Then `T_N/ω_{r,k}T_N ≅ T_{r,k}` (the ordinary Hecke algebra of `S_k(Np^r)`) and `M_m/ω_{r,k}M_m ≅ (M_{r,k})_{m_{r,k}}` with `M_{r,k} = H₁(Np^r, cusps; L_{k−2}(ℤ_p))`.

`ρ̄_m` irreducible; `r≥1`; `k ≥ 2`.

In (4.2), `Γ` acts by the natural covering diamonds before the weight-coordinate transport. In our `Λ_w` coordinate this weight-two fibre is the quotient by `P₂`, as in §1.1. The natural covering action and the weight action therefore have different augmentation ideals.

The Hecke-algebra statement is §0.17. Define `ordinaryHomology_moment` using the dual polynomial/divided-power lattice `L_{k−2}` and trace maps. At `p ≥ 5`, identify it with the moment and specialization maps of `IntegralIwasawaTheory`, §9.0, `rationalOrdinaryControl`, under §0.7's inverse-diamond and weight transport; its kernel and cokernel then vanish after the ordinary localization and reduction by `ω_{r,k}`. At `p = 3`, construct and prove this control as part of §0.17's extension. For the discrete cohomology dual, the `Γ`-invariant level-collapse isomorphism (4.2) gives the compact homology quotient by duality. The covering/degeneracy comparison identifies the unwanted terms as `U_p`-nilpotent and retains the finite character in `ω_{r,k}`. This is the integral homological control theorem cited by EPW from Hida, Invent. Math. 85 (1986), Theorem 3.1, and Amer. `J`. Math. 110 (1988), Theorem 1.9; EPW’s application locators below fix its precise coefficient and level conventions. The Hecke-algebra quotient alone does not supply homological control.

The comparison with ModularSymbolsPadicLFunctions Layer 0 is through `H₁(Np^r, cusps; L_{k−2}) ≅` the modular symbols `Symb(V_{k−2})` (up to the duality of L0).

- `ordinaryHomology_moment`: the Hecke-equivariant trace-compatible map to homology with the specified dual algebraic coefficient lattice at weight `k` and conductor `p^r`.
- `ordinaryHomology_moment_baseChange`: its integral ordinary specialization is an isomorphism under the residual hypotheses above.
- `ordinaryHomology_moment_pairing`: moment evaluation is adjoint to polynomial specialization with the factorial/divided-power convention retained.

**Checks for the moment construction.**

- At `r=1`, `ω_{1,k}=P_k`; at weight 2 the coefficient system is trivial and the map is the ordinary trace-level map. The ordinary weight-two form of level 11 at `p=3` gives a nonzero control fibre.
- At `p=3`, `r=2`, finite characters of order 3 are included: the exponent is 3. The full nonzero power character is never trivial on an open subgroup.
- Degree `j` evaluation uses the dual of `z^j`, rather than identifying a symmetric power with its integral dual by division by `j!` when `p∣j!`.
- A positive-slope kernel element disappears after ordinary projection; a unit-root element survives. Thus rational control alone is insufficient.

See [EPW](#ref-epw), §4.1, proof of Proposition 4.1.1, p. 29 (arXiv v1; printed page = PDF page); [EPW](#ref-epw), §4.1, proof of Proposition 4.1.4, p. 30 (arXiv v1; printed page = PDF page).

This uses §1.1; §0.17; `ModularSymbolsPadicLFunctions`, §§0.4 and 0.6.

### 1.3 Freeness of `M^±_m`: the family period line

(Emerton–Pollack–Weston Proposition 4.1.1.) If `ρ̄_m` is irreducible and `p`-distinguished, each of `M⁺_m` and `M⁻_m` is a free `(T_N)_m`-module of rank one.

`ρ̄_m` irreducible and `p`-distinguished (the two characters of `ρ̄_m|_{G_{ℚ_p}}` are distinct).

By Wiles's mod-`p` multiplicity one at ordinary level (Ann. of Math. 141 (1995), Theorem 2.1, as cited by EPW) and EPW Theorem 2.1.2, `J₁(Np)(ℚ̄)[m]^ord` is free of rank 2 over `T_N/m`; this residual multiplicity-one theorem is a target here, with the Hecke and Jacobian carriers of ModularCurvesPartII §§13.1–13.6 and 14.13–14.15. By (4.2), `Hom(M_m, ℚ_p/ℤ_p)[m] ≅ H¹(Np; ℚ_p/ℤ_p)^ord_m[m] ≅ H¹(Np; F_p)^ord_m[m] ≅ J₁(Np)[p][m]^ord`, so `M_m/mM_m` is free of rank 2 over `T_N/m`. The ordinary tower is a compact module with a basis of open Hecke submodules. Its finite-dimensional residual quotient and compact Nakayama give finite generation and a surjection `T_m²→M_m`. EPW conclude from the freeness of `M_m ⊗ ℚ_p` of rank two over `T_m ⊗ ℚ_p`; prove the rank statement this needs at the generic points. Choose a weight `k ≥ 2` whose prime `P_k` avoids the finitely many height-one primes in the support of the `Λ`-torsion of `M_m`. Control (§1.2, §0.17) and Eichler–Shimura in weight `k` then give `rank_Λ M_m = 2 rank_Λ T_m`. So the kernel of `T_m² → M_m` has `Λ`-rank zero; it is a `Λ`-torsion submodule of `T_m²`, which is `Λ`-free by §0.17, hence zero. Since `p` is odd the two signs are direct summands of `M_m`, hence finite projective and so free over the local ring `T_m`. Complex conjugation splits the weight-`k` ordinary homology into two halves of equal dimension (Eichler–Shimura), so each sign has generic rank one and is free of rank one. Rank two of their direct sum alone would not prove the two sign ranks.

Without `p`-distinguishedness `M^±_m` need not be free; the family period is then a module, not a line.

See [EPW](#ref-epw), §4.1, Proposition 4.1.1, p. 28 (arXiv v1; printed page = PDF page).

This uses §1.2; §1.1; §0.17; `ModularCurvesPartII`, §§13.1–13.6 and 14.13–14.15.

### 1.4 Family periods as trivialisations of an invertible module

Under §1.3, a family period for sign `±` is a coordinate isomorphism `θ^±:M^±_m→T_m`. Two such maps differ by `T_m^×`. At a classical prime `℘` its inverse at 1 generates the rank-one homology eigenquotient `M^±_m⊗_{T_m}O(℘)`, fixing EPW’s quotient convention for canonical periods up to `O(℘)^×`. Identifying this normalization with the saturated cohomological eigensymbol lattice of ModularSymbolsPadicLFunctions Layer 1 requires an integral Hecke-compatible duality/control comparison; it does not follow from tensor specialization or rational Eichler–Shimura alone.

`ρ̄_m` irreducible and `p`-distinguished.

Freeness gives a coordinate isomorphism `θ^±:M^±_m→T_m`, whose inverse sends 1 to a basis; two coordinate maps differ by multiplication by a unit. Specialize the free rank-one homology module and use ordinary control to get its eigenquotient generator. To compare with the saturated eigensymbol line, supply the integral perfect pairing with the correct dual/divided-power coefficient lattice and identify the annihilator eigenline with the dual of this quotient. Track torsion and possible congruence or factorial denominators. Define `familyPeriod_integralPairing` and its map from the quotient-period lattice to the dual saturated cohomological lattice. At each arithmetic prime compute the torsion kernel and cokernel, or equivalently their fractional correction ideal after removing torsion. Prove that the correction is a unit under the explicit hypotheses that the integral coefficient pairing is perfect and the controlled eigensymbol sublattice is saturated. Without those hypotheses retain the correction ideal; rational comparison alone only proves equality after inverting the coefficient uniformiser. This target fixes the dual/divided-power convention rather than asserting an unconditional unit ratio.

A period line is not a globally chosen basis: `θ^±` is data, and statements depending on it are equalities up to `T_m^×` (integrally) or up to `O(℘)^×` at `℘`, not up to a field scalar. Where `M^±_m` is not free (`p`-distinguishedness fails) only the module, not a trivialisation, is available.

- `familyPeriod`: `A` coordinate trivialisation `θ^±:M^±_m≅T_m`; its inverse at 1 is the chosen basis.
- `familyPeriod_unique_up_to_unit`: Two trivialisations differ by a unit of `T_m`.
- `familyPeriod_specialise`: The inverse coordinate basis specializes to a generator of the homology eigenquotient. Equality with the saturated eigensymbol normalization is conditional on the integral duality/control comparison.

**Checks.**

- Replacing `θ^±` by `uθ^± (u ∈ T_m^×)` multiplies `L^±(m, N)` by `u` and each specialisation `L^±(m, N)(℘)` by `u mod ℘ ∈ O(℘)^×`.
- At `℘` the ambiguity is an `O(℘)^×` unit, not an arbitrary `K(℘)^×` scalar: `μ`-invariants of the specialisations are well defined.
- `M_m = M⁺_m ⊕ M⁻_m` is free of rank 2, so two independent periods (one per sign) are chosen.

See [EPW](#ref-epw), §4.1, proof of Proposition 4.1.4, p. 30 (arXiv v1; printed page = PDF page).

This uses §1.3; §1.2; `ModularSymbolsPadicLFunctions`, §1.1; `ModularSymbolsPadicLFunctions`, §1.1.

### 1.5 The two-variable measure of a Hida family

The paths `[∞, a]` on `X₁(Np^r)`, `a ∈ P¹(ℚ)`, give classes in `H₁(X₁(Np^r), cusps; ℤ_p)` compatible in `r`; projecting to ordinary parts, localising at `m` and passing to the limit gives `a ↦ {∞, a} ∈ M_m`. For `a + p^rℤ_p ⊆ ℤ_p^×`, `µ(a + p^rℤ_p) := U_p^{−r}{∞, a/p^r} ∈ M_m` (Definition 4.1.2) is additive (Proposition 4.1.3), hence defines `L(m, N) ∈ M_m ⊗̂_{ℤ_p} ℤ_p[[ℤ_p^×]]`, with `±` components `L^±(m, N) ∈ M^±_m ⊗̂ ℤ_p[[ℤ_p^×]]`; after a family period it lies in `(T_N)_m[[ℤ_p^×]]`. Projecting to the `ω^i`-part gives `L(m, N, ω^i) ∈ (T_N)_m ⊗̂ Λ^{(i)}` with sign `(−1)^i` (the other sign projects to 0).

`ρ̄_m` irreducible; `U_p` is invertible on `M_m` (ordinary part).

Additivity: `U_p = Σ_{b mod p}(1 b; 0 p)` acts on `{∞, a/p^r}` as `Σ_b {∞, (a + bp^r)/p^{r+1}}`, so `µ(a + p^rℤ_p) = Σ_b µ(a + bp^r + p^{r+1}ℤ_p)`. `ℤ_p[[ℤ_p^×]]` is the ring of `ℤ_p`-valued measures (PadicMeasuresIwasawaAlgebras §1); the completed tensor product uses the `m`-adic topology on `M_m`. The sign of the `ω^i`-projection: the involution `z ↦ −z` on `ℤ_p^×` corresponds to complex conjugation.

`U_p^{−r}` makes sense because `U_p` is a unit on the ordinary part; this is where ordinarity is used. `L(m, N)` is integral: no denominators are introduced before a period is chosen.

- `universalOrdinarySymbol`: `a ↦ {∞, a} ∈ M_m`.
- `familyMeasure`: `µ(a + p^rℤ_p) = U_p^{−r}{∞, a/p^r}`.
- `familyMeasure_additive`: `µ` is a measure (Proposition 4.1.3).
- `twoVariablePadicL`: `L^±(m, N) ∈ M^±_m ⊗̂ ℤ_p[[ℤ_p^×]]`.
- `twoVariablePadicL_branch`: `L(m, N, ω^i) ∈ (T_N)_m ⊗̂ Λ^{(i)}`.
- `familyMeasure_ext`: Two family measures are equal when evaluation on every compact open coset agrees, using the supplied continuous-measure extensionality interface.

**Checks.**

- The Hecke relation is `U_p{∞,a/p^r}=∑_{b mod p}{∞,(a+bp^r)/p^{r+1}}`. Multiplying by `U_p^{−r−1}` gives `μ(a+p^rℤ_p)=∑_b μ(a+bp^r+p^{r+1}ℤ_p)`. Omitting `U_p^{−r}` fails this test.
- `µ(ℤ_p^×) = Σ_{a mod p, p ∤ a} U_p^{−1}{∞, a/p}`.
- Projecting `L^∓(m, N)` to the `ω^i`-part with `∓ = −(−1)^i` gives 0.

See [EPW](#ref-epw), §4.1, Definition 4.1.2, p. 29 (arXiv v1; printed page = PDF page); [EPW](#ref-epw), §4.1, p. 31 (arXiv v1; printed page = PDF page).

This uses §1.1; §1.4; `PadicMeasuresIwasawaAlgebras`, §§0.1 and 1 (measures and completed group algebras).

### 1.6 Specialisation to one-variable `p`-adic L-functions

(Emerton–Pollack–Weston Proposition 4.1.4.) Under the hypotheses of §1.3, for every classical height-one prime `℘` of `(T_N)_m`, `L^±(m, N)(℘) ∈ O(℘)[[ℤ_p^×]]` is the analytic `p`-adic L-function of the normalised eigenform `f_℘ ∈ S_k(Np^∞, O(℘))^ord[κ_℘]`, computed with respect to a canonical period; `f_℘` need not be new, so the specialisation may be imprimitive (Euler factors at primes dividing the tame level of an oldform removed).

`ρ̄_m` irreducible and `p`-distinguished; `℘` classical of weight `k ≥ 2`.

The one-variable construction `µ_{r,k}(a + p^nℤ_p) = U_p^{−n}{∞, a/p^n} ∈ (M_{r,k})_{m_{r,k}}` gives `L^±_p(m_{r,k}, N)`. `(M_{r,k})^±_{m_{r,k}}` is free of rank one over `(T_{r,k})_{m_{r,k}}` by control and §1.3; the family period induces its trivialisation. The compatible measures specialize to the one-variable homology-quotient construction of EPW Proposition 4.1.4. Thus the resulting scalar function uses the specialized canonical quotient period. Comparison with ModularSymbolsPadicLFunctions Layer 2’s saturated-eigensymbol normalization needs the integral duality/control input of §1.4; do not identify the normalizations solely by their interpolation formulas.

The equality is up to `O(℘)^×` (the canonical period), not up to a field scalar. For the primitive/newform function use the branch construction §1.12 and its integral degeneracy-map comparison. The saturated eigensymbol-period convention requires the integral pairing and correction-ideal theorem of §1.4.

See [EPW](#ref-epw), §4.1, Proposition 4.1.4, p. 30 (arXiv v1; printed page = PDF page).

This uses §1.5; §1.2; §1.4; `ModularSymbolsPadicLFunctions`, §2.5; `ModularSymbolsPadicLFunctions`, §2.5.

### 1.7 The congruence module of an augmentation

Let `A` be a commutative ring, `O` an integral domain and `λ : A → O` a surjective ring homomorphism with kernel `𝔭_λ`. For an ideal `J` of `A` and an `A`-module `M` write `M[J] = {m ∈ M : Jm = 0}`, and put `I_λ := A[𝔭_λ] = Ann_A(𝔭_λ)`. The congruence module of `M` at `λ` is the `O`-module `Ψ_λ(M) := M / (M[𝔭_λ] + M[I_λ])` (it is killed by `𝔭_λ + I_λ`, hence an `O/λ(I_λ)`-module). It is functorial in `A`-linear maps, and when `(A,λ)` is an augmented complete noetherian local `O`-algebra in Iyengar–Khare–Manning’s `C_O(0)` (`O` a complete `DVR`, `A_{𝔭_λ}` regular of dimension zero) and `M` is finitely generated over `A`, `Ψ_λ(M)` is a torsion `O`-module of finite length that agrees, for `M` of positive depth, with their higher-codimension congruence module `Ψ_A(M)` in codimension zero.

`λ : A → O` surjective onto a domain; `M` any `A`-module. The definitions of `I_λ`, the annihilated submodules, `Ψ_λ` and `η_λ` make sense for any ring homomorphism between commutative rings; surjectivity of `λ` and the domain hypothesis on `O` are used only in the comparison and finiteness statements. For the IKM finite-length comparison: an `O`-algebra section of `λ`, `A` complete noetherian local, `A_{𝔭_λ}` regular of dimension zero, and `M` finitely generated. Positive depth is additionally required for the comparison isomorphism.

Functoriality: an `A`-linear map sends `M[J]` into `M'[J]` for every ideal `J`. Torsion and finite length when `A` is regular at `𝔭_λ` in codimension zero: at `𝔭_λ` the ring `A_{𝔭_λ}` is the field `Frac(O)`, so the annihilator sum has zero quotient there. The quotient is annihilated by `𝔭_λ+I_λ` and is finite over `O`; its generic localization is zero. It is therefore a finite torsion `O`-module, hence of finite length. One need not assert that all of `A[1/ϖ]`, which need not be finite over `K`, splits as a finite product. Comparison with Iyengar–Khare–Manning: their Proposition 2.10 gives a natural surjection from `M/(M[𝔭_λ] + M[I_λ])` onto their `Ψ_A(M)` with torsion kernel, bijective when `depth_A M ≥ 1`; their Example 2.11 shows it can fail to be injective in depth zero.

The Hecke-module instances in automorphic congruences, level optimisation and integral Iwasawa theory use this raw annihilator construction.

- `congruenceModule`: `Ψ_λ(M) = M/(M[𝔭_λ] + M[I_λ])`.
- `congruenceModule_map`: An `A`-linear map `M → M′` induces `Ψ_λ(M) → Ψ_λ(M′)`, with `map_id` and `map_comp`.
- `congruenceModule_annihilated`: `𝔭_λ + I_λ` annihilates `Ψ_λ(M)`.
- `congruenceModule_self`: `Ψ_λ(A) = A/(I_λ + Ann_A(I_λ))`.
- `congruenceModule_isTorsion`: For `A` in `C_O(0)` and `M` finitely generated, `Ψ_λ(M)` is torsion of finite length.
- `congruenceModule_compare_ikm`: For `depth_A M ≥ 1` it agrees with Iyengar–Khare–Manning's `Ψ_A(M)` in codimension zero.
- `congruenceModule_mk`: The canonical `A`-linear map `M→Ψ_λ(M)`, with kernel `M[ker λ]+M[I_λ]`.
- `congruenceModule_lift`: An `A`-linear map from `M` that kills `M[ker λ]+M[I_λ]` factors uniquely through `Ψ_λ(M)`; this gives quotient lifts and their extensionality.
- `augmentationAnnihilator`: `I_λ = Ann_A(ker λ)`, as an ideal of `A`.
- `congruenceSubmodule`: the submodule `M[ker λ] + M[I_λ]` of `M`.

**Checks.**

- For `A = {(a, b) ∈ ℤ_p × ℤ_p : a ≡ b mod pⁿ}` and `λ` the first projection, `𝔭_λ = 0 × pⁿℤ_p`, `I_λ = pⁿℤ_p × 0` and `Ψ_λ(A) ≅ ℤ/pⁿ`. At `p=5`, `n=1`, this is the `ZMod 5` quotient of the equalizer of the two residue maps.
- For `A = O` and `λ = id`, `𝔭_λ = 0`, `I_λ = A` and `Ψ_λ(M) = 0` for every `M`.
- For reduction `λ:ℤ/4→ℤ/2`, `Ann(ker λ)=(2)`, `η_λ=0` and `Ψ_λ(ℤ/4)` has two elements. This uses the general commutative-ring definition; the domain hypothesis is unnecessary for this computation.
- `congruenceModule_dualNumber_boundary`: for `A = O[t]/(t²)` and `λ(t) = 0`, `I_λ = 𝔭_λ = (t)` and `Ψ_λ(A) ≅ O` is not torsion: `A` is not reduced at `𝔭_λ`, so the finite-length statement needs its hypothesis. The named boundary theorem gives the case `O=ℤ`.
- For `A = O[[t]]/(ϖ²t)` and `M = A/(ϖ³)`, `M/(M[𝔭] + M[I]) ≅ O/(ϖ)` while Iyengar–Khare–Manning's `Ψ_A(M) = 0` (Example 2.11). At `O=ℤ₅`, the ideals are `(25t)` and `(125)` and the raw quotient is additively `ZMod 5`.

See [IKM](#ref-ikm), §2.2 (congruence modules), pp. 13–14; Proposition 2.10 and Example 2.11, pp. 16–17.

This uses Mathlib `Submodule.torsionBySet`; Mathlib `Module.annihilator`; Mathlib `Submodule.mkQ`.

### 1.8 The congruence ideal of an augmentation

For a surjection `λ:A→O`, put `𝔭_λ=ker λ`, `I_λ=Ann_A(𝔭_λ)`, and `η_λ=λ(I_λ)⊆O`. If `Ann_A(I_λ)=𝔭_λ`, then `Ψ_λ(A)≅O/η_λ`. A sufficient case is reduced `A` finite flat over the domain `O` with `λ` an `O`-algebra surjection: its generic algebra has `O`’s fraction field as the `λ`-factor. More generally a reduced Noetherian `A` with `𝔭_λ` a minimal prime has the double-annihilator identity. If `O` is a complete `DVR` in the finite-flat case, `η_λ` is nonzero and `O/η_λ` has finite length. Finite flatness over some other domain mapping onto `O` does not by itself give the double-annihilator identity.

`λ : A → O` surjective; for the identification `Ψ_λ(A) ≅ O/η_λ`, the double-annihilator identity `Ann_A(I_λ) = 𝔭_λ`, which holds for example when `A` is reduced noetherian and `𝔭_λ` is a minimal prime.

`Ψ_λ(A) = A/(I_λ + Ann_A(I_λ)) = A/(I_λ + 𝔭_λ) ≅ O/λ(I_λ)`. For reduced Noetherian `A` embed `A` into the product of its minimal-prime fraction fields. If `𝔭_λ` is minimal, `Ann(𝔭_λ)` is the lattice on that generic factor and its annihilator is `𝔭_λ`. In the finite-flat `O`-algebra case `λ` selects a field factor in `A⊗Frac(O)`, and clearing denominators gives a nonzero element of `η_λ`. No such factor argument applies merely from flatness over an unrelated base.

For the fibre product of two copies of `ℤ_p` glued modulo `pⁿ`, `η_λ = pⁿℤ_p` and `Ψ_λ(A) ≅ ℤ/pⁿ`.

- `congruenceIdeal`: `η_λ = λ(Ann_A(ker λ))`.
- `congruenceModule_self_eq`: `Ψ_λ(A) ≅ O/η_λ` when `Ann_A(I_λ) = 𝔭_λ`.
- `congruenceIdeal_ne_bot`: `η_λ ≠ 0` for `A` reduced, finite flat over `O`.
- `congruenceIdeal_map`: `A` surjection `A → A′` through which `λ` factors gives `η_λ(A) ⊆ η_λ(A′)`.
- `mem_congruenceIdeal_iff`: Under surjective `λ:A→O`, `o∈η_λ` exactly when `o=λ(a)` for some `a∈Ann_A(ker λ)`; retain surjectivity to identify the generated image ideal with the set image.
- `congruence_milestone`: for surjective `λ` with `Ann_A(I_λ) = ker λ`, an additive isomorphism `Ψ_λ(A) ≅ O/η_λ`.

**Checks.**

- For `A = {(a, b) : a ≡ b mod pⁿ} ⊆ ℤ_p²`, `η_λ = pⁿℤ_p`.
- For `A = O`, `η_λ = O`.
- For `A = O × O` (no congruence) and `λ` the first projection, `η_λ = O`.
- For `A = O[t]/(t²)`, `η_λ = 0` although `A` is finite flat over `O`.
- `congruenceModule_polynomial_boundary`: take `A=B=O[x]`, finite flat over `B` by the identity, and `λ` evaluation at `x=0`. Then `𝔭=(x)`, `Ann(𝔭)=0`, and `Ann(Ann(𝔭))=A≠𝔭`. Thus `η_λ=0` but the raw congruence quotient is zero. The named boundary theorem gives the case `O=ℤ`. The base `B` maps onto `O`, but that does not make `𝔭` minimal.

See [IKM](#ref-ikm), §2.2 and Proposition 2.10, pp. 13–17; [Hida](#ref-hida), §0 and §6, Numdam.

This uses §1.7; Mathlib `Ideal.map`; Mathlib `IsReduced`.

### 1.8a Ordinary witnesses at minimal tame conductor

**Ordinary witness preserving stabilization.** For odd `p` and an odd irreducible modular `ρ̄:G_ℚ→GL₂(k)` with an ordinary `p`-distinguished restriction, fix an exact sequence `0→k(χ̄₁)→V̄→k(χ̄₂)→0` at `p`, where `χ̄₂` is unramified and `χ̄₁≠χ̄₂`. The target `ordinaryResidual_minimalTameWitness` supplies a finite extension `E′/E` of a coefficient field with residue field containing `k`, a normalized ordinary cuspidal eigenform `f` of weight `w≥2` and level `Γ₁(N(ρ̄)p^r)` for some `r≥1`, a stable lattice, and an identification `T_f/ϖ′≅V̄⊗_k k′` carrying the ordinary line and quotient to the prescribed sequence. In particular the unit `U_p` root reduces to `χ̄₂(Frob_p)`; in the split unramified case either permitted ordered quotient is treated separately. No prescribed characteristic-zero nebentypus is imposed at `p=3`.

Use `SerreWeightAndLevelOptimisation` §2.13 for tame-conductor descent and its §§3.1, 3.5–3.7 and Layer 4 for the ordinary local description, extension-sensitive weight recipe, companions and removal of `p`-power level. The additional assertion here is the ordinary realization of the specified quotient: retain its unramified eigenvalue through weight changes and eigenvalue lifting. In the split unramified case use Diamond’s companion/Selmer branch to realize the selected order, rather than infer it from an unordered pair of traces. Include the endpoint weights and odd characteristic three without applying the companion theorem outside its range `2<w≤p`. The remaining ordinary weight-two realization is Diamond’s refined Serre theorem, Theorem 6.4, as used in EPW Proposition 3.2.3; its ordinary and chosen-quotient assertion is part of this target. This also proves the existence used by EPW Theorem 2.6.1, including `Σ=∅`. Sources: [EPW](#ref-epw), Theorem 2.6.1, p. 18, and Proposition 3.2.3, pp. 25–26, citing Diamond, *The refined conjecture of Serre*, Theorems 1.1 and 6.4.

**Checks.**

- For `Σ=∅` the witness has tame conductor `N(ρ̄)` and supplies an actual residual maximal ideal; fixed-level control alone supplies none.
- If the local representation is split unramified with two distinct characters, interchanging the quotient changes the prescribed residual `U_p` eigenvalue. A witness for one ordering does not discharge the other.
- At `p=3` the coefficient field and characteristic-zero character may change while the residual identification and ordered ordinary quotient remain fixed.

*Needs:* `SerreWeightAndLevelOptimisation`, §§2.13, 3.1, 3.5–3.7 and Layer 4; `AlgebraicModularFormsAndSerreWeights`, R15.5 (eigenvalue lifting); `ModularForms`, Layer 4.

### 1.9 The reduced Hida algebra `T_Σ` of a residual representation and its branches

Let `ρ̄ : G_ℚ → GL₂(k)` be irreducible, odd, ordinary, `p`-distinguished and modular, with a chosen `p`-stabilisation, `N(ρ̄)` its tame conductor, and for a finite set `Σ` of primes `ℓ ≠ p` let `N(Σ) = N(ρ̄)∏_{ℓ∈Σ} ℓ^{m_ℓ}` with `m_ℓ = dim V^{I_ℓ}`. `T_Σ = T_Σ(ρ̄)` is the localisation of the ordinary Hecke algebra `T′_{N(Σ)}` (without `U_ℓ` for `ℓ | N(Σ)`) at the unique maximal ideal whose residual representation with its `p`-stabilisation is `ρ̄`; it is reduced and finite flat over `Λ`, has its big Galois representation constructed separately in §4.1, and `Σ ⊆ Σ′` gives a surjection `T_{Σ′} → T_Σ`. For a minimal prime `𝔞` of `T_Σ`, `T(𝔞) := T_Σ/𝔞` is a local domain finite over `Λ`; there are a unique divisor `N(𝔞)` of `N(Σ)` and a minimal prime `𝔞′` of the new quotient `T^new_{N(𝔞)}` over `𝔞`, and `T(𝔞) ↪ T(𝔞)° := T^new_{N(𝔞)}/𝔞′` is an isomorphism after inverting `p` (and an isomorphism when `N(𝔞) = N(ρ̄)`).

`ρ̄` irreducible, odd, ordinary, `p`-distinguished and modular; `p ≥ 5` is not needed for the definitions.

Existence of the maximal ideal uses `ordinaryResidual_minimalTameWitness` of §1.8a, then §0.17 and the tame-level degeneracy maps to reach `N(Σ)` with the same ordered ordinary characters. Uniqueness follows from the residual good-prime traces and chosen ordinary quotient; the maximal ideal of `T_{N(Σ)}` lifting it with `T_ℓ ∈ 𝔫` for `ℓ ∈ Σ` gives an isomorphism of localisations (EPW Proposition 2.6.2). Reducedness and finite flatness over `Λ: T′_{N(Σ)} ⊗_Λ L` is a product of new Hecke algebras of levels dividing `N(Σ)` (EPW Proposition 2.4.2), and the ordinary Hecke algebra is finite flat over `Λ` (§0.17). Branches: minimal primes of `T_Σ` correspond to local components of `T_Σ ⊗_Λ L`, each of which comes from a unique new level.

`T_Σ` is reduced and finite flat over `Λ`, and its minimal primes correspond to Hida families of newforms with a definite tame conductor `N(𝔞)`.

- `reducedHidaAlgebra`: `T_Σ(ρ̄)` as a local `Λ`-algebra.
- `reducedHidaAlgebra_reduced`: `T_Σ` is reduced.
- `reducedHidaAlgebra_finite_flat`: `T_Σ` is finite and flat over `Λ`.
- `reducedHidaAlgebra_surj`: `Σ ⊆ Σ′` gives `T_{Σ′} ↠ T_Σ` compatible with the good-prime Hecke generators; the representation compatibility is proved in §4.1.
- `branchAlgebra`: `T(𝔞) = T_Σ/𝔞` and `T(𝔞)°` with `T(𝔞) ↪ T(𝔞)°`.
- `branchAlgebra_iso_inv_p`: `T(𝔞)[1/p] ≅ T(𝔞)°[1/p]`.

**Checks.**

- At a classical prime the residual localization selects the given `p`-stabilisation. The later representation theorem §4.1 identifies its good-prime Frobenius trace with `T_ℓ` for `ℓ∤N(Σ)`p.
- For `Σ = ∅` every branch has tame conductor `N(ρ̄)` and `T(𝔞) = T(𝔞)°`.
- If `T_Σ=Λ` and `𝔞=0`, then `T(𝔞)=Λ` and branchAlgebra is the identity quotient. No named modular form is asserted to have this coefficient ring without a source calculation.
- The full ordinary Hecke algebra of level `N(Σ)`, with `U_ℓ` for `ℓ ∈ Σ`, is not `T_Σ`: it is not reduced in general (oldforms give `U_ℓ`-Jordan blocks), which is why `T′` omits `U_ℓ`.

See [EPW](#ref-epw), §2.6, Theorem 2.6.1, Proposition 2.6.2 and Definition 2.6.3, pp. 18–19; §2.7, Definition 2.7.1, Proposition 2.7.2 and Definition 2.7.3, pp. 19–20.

This uses §0.17; §1.8a; `SerreWeightAndLevelOptimisation`, §2.13; Mathlib `IsReduced`.

### 1.10 Congruence modules of a branch of a Hida family

For a branch `𝔞` of `T_Σ` (§1.9), let `λ_𝔞 : T_Σ → T(𝔞)` be the quotient map. The family congruence module of an `T_Σ`-module `M` is `Ψ_{λ_𝔞}(M)` (§1.7, with `O` replaced by the local domain `T(𝔞)`) and the family congruence ideal is `η_𝔞 = λ_𝔞(Ann_{T_Σ}(𝔞)) ⊆ T(𝔞)`. Since `T_Σ` is reduced and finite flat over `Λ`, `Ψ_{λ_𝔞}(T_Σ) ≅ T(𝔞)/η_𝔞`, a torsion `T(𝔞)`-module, and `η_𝔞 = T(𝔞)` iff `Spec T(𝔞)` meets no other branch. For the ordinary family symbol module `M = M^±_𝔪 ⊗ T_Σ`, free of rank one over `T_Σ` under the hypotheses of §1.3, `Ψ_{λ_𝔞}(M) ≅ T(𝔞)/η_𝔞` as well, and the choice of a trivialisation of `M` does not change it. For a primitive cuspidal component, Hida also constructs a `Λ`-adic congruence module using free closures of the projected Hecke lattices. Its identification with the raw annihilator module above is not asserted without proving those lattices are reflexive. Hida’s free-closure module is a finite torsion module over `Λ` with principal annihilator (Hida, Theorem 3.6), and for each `k ≥ 2` the weight-`k` module of congruence between the forms belonging to the component and the other ordinary forms of weight `k` is the kernel of a canonical surjection between the weight-`k` fibres of Hida's two `Λ`-adic congruence modules (Hida, Corollary 3.8).

`ρ̄` irreducible and `p`-distinguished (for freeness of `M^±_𝔪`); `𝔞` a minimal prime of `T_Σ`.

Reducedness of `T_Σ` gives `Ann(Ann(𝔞)) = 𝔞`, hence §1.8's identification. Freeness of `M^±_𝔪` (§1.3) transports the computation from `T_Σ` to `M`; a different generator changes the isomorphism by a unit, not the module. `η_𝔞 = T(𝔞)` iff `Ann(𝔞) + 𝔞 = T_Σ` iff the branch is a connected component of `Spec T_Σ`. Hida’s (3.9) replaces the projected component lattices by their free closures (pp. 252–253), whereas `Ψ_{λ_𝔞}(T_Σ)` uses the raw projected lattices. Compare the inclusion between these quotients and its finite/pseudonull correction; equality requires an additional reflexivity hypothesis. Construct `familyCongruence_freeClosureComparison` from the inclusions of the projected lattices into their reflexive hulls. Its error modules are supported in codimension at least two over the regular two-dimensional weight algebra, hence have finite length. Prove the resulting kernel/cokernel exact sequence; it becomes an isomorphism when the projected lattices are already reflexive. Preserve that correction rather than asserting equality of the raw and free-closure quotients in general.

This is the Hecke-branch instance of §1.7.

- `familyCongruenceModule`: `Ψ_{λ_𝔞}(M)` for a `T_Σ`-module `M`.
- `familyCongruenceIdeal`: `η_𝔞 ⊆ T(𝔞)`.
- `familyCongruenceModule_self`: `Ψ_{λ_𝔞}(T_Σ) ≅ T(𝔞)/η_𝔞`.
- `familyCongruenceIdeal_eq_top_iff`: `η_𝔞 = T(𝔞)` iff `Spec T(𝔞)` is a connected component of `Spec T_Σ`.
- `familyCongruenceModule_symbols`: For the free family symbol module, `Ψ_{λ_𝔞}(M^±) ≅ T(𝔞)/η_𝔞`.

**Checks.**

- If `T_Σ = T(𝔞)` (one branch), `η_𝔞 = T(𝔞)` and the congruence module is zero.
- For nonzero nonunit `f∈Λ` and `T_Σ={(x,y)∈Λ²:x≡y mod f}`, the two distinct branches have congruence ideal `fΛ`. This computes the raw annihilator module.
- It is §1.7 for `A = T_Σ`, `O = T(𝔞)`.
- `Ψ` is independent of the choice of family period, whereas the scalar L-function changes by a unit under that choice (§1.11).

See [EPW](#ref-epw), §2.7, pp. 19–20, and §4.1, Proposition 4.1.1, p. 28; [Hida](#ref-hida), §3, Definition (3.9), Theorem 3.6 and Corollary 3.8, pp. 252–254.

This uses §1.7; §1.8; §1.9; §1.3; §1.4.

### 1.11 Change of trivialisation of the family period line

Let `θ^± : M^±_𝔪 ≅ T_𝔪` be a trivialisation of the invertible family symbol module (§1.4) and `L_θ^± ∈ T_𝔪 ⊗̂ ℤ_p[[ℤ_p^×]]` the scalar two-variable `p`-adic L-function obtained by applying `θ^±` to `L^±(𝔪, N)` (§1.5). If `θ′ = u·θ` with `u ∈ T_𝔪^×`, then `L_{θ′}^± = u·L_θ^±`, and for every classical height-one prime `℘` the specialisations differ by the unit `u(℘) ∈ O(℘)^×`. Conversely, any two trivialisations differ by such a unit, so the ideal generated by `L^±_θ` in `T_𝔪 ⊗̂ ℤ_p[[ℤ_p^×]]` and the Iwasawa `μ`- and `λ`-invariants of its specialisations do not depend on `θ`; equality with single-form `p`-adic L-functions built from canonical periods holds up to a unit, never up to an arbitrary scalar in `Frac O(℘)`.

`ρ̄_𝔪` irreducible and `p`-distinguished, so that `M^±_𝔪` is free of rank one.

`θ′ ∘ θ⁻¹` is a `T_𝔪`-linear automorphism of `T_𝔪`, i.e. multiplication by a unit `u`. Applying `θ` is `T_𝔪`-linear and commutes with the completed tensor product, so the formula follows; specialisation at `℘` is a ring map. Specialization preserves the homology eigenquotient basis, so EPW’s canonical quotient periods differ by `O(℘)^×`. Comparison with the saturated integral period lattice of ModularSymbolsPadicLFunctions Layer 1 is conditional on the integral pairing/control input recorded in §1.4; rational comparison alone permits nonunit denominators.

The statement is integral: no `p` is inverted, and the ambiguity is a unit of `T_𝔪`, separating equality up to a unit from equality up to a field scalar.

See [EPW](#ref-epw), §4.1, after Proposition 4.1.1 and Proposition 4.1.4, pp. 28–30.

This uses §1.4; §1.5; §1.6; `ModularSymbolsPadicLFunctions`, §1.1.

### 1.12 Two-variable `p`-adic L-functions on the branches of a Hida family

Let `ρ̄` be as in §1.9 and `0 ≤ i ≤ p − 2`, `Λ^{(i)}` the `ω^i`-component of `ℤ_p[[ℤ_p^×]]`. `(1) L_Σ(ρ̄, ωⁱ) ∈ T_Σ ⊗̂ Λ^{(i)}` is the image of `L(𝔫, N(Σ), ωⁱ)` (§1.5) under `T_Σ ≅ (T_{N(Σ)})_𝔫`, defined up to `T_Σ^×`; its reductions modulo a height-one prime `℘` and modulo the maximal ideal are defined up to units. (2) For a branch `𝔞`, `L(ρ̄, 𝔞, ωⁱ) ∈ T(𝔞)° ⊗̂ Λ^{(i)}` is the image of `L(𝔪, N(𝔞), ωⁱ)` under the surjection `T_{N(𝔞)} → T^new_{N(𝔞)}/𝔞′ = T(𝔞)°`; at a classical height-one prime `℘` of `T(𝔞)` it specialises to the `p`-adic L-function of the newform `f_℘`, whereas `L_Σ(ρ̄, ωⁱ)(℘)` is that of the `Σ-`imprimitive oldform `g_℘`. (3) Comparison: there is an isomorphism `T(𝔞)° ⊗ M(N(Σ))_𝔫 ≅ T(𝔞)° ⊗ M(N(𝔞))_𝔪` compatible with complex conjugation carrying `L(𝔫, N(Σ))` to `L(𝔪, N(𝔞))·E_Σ(𝔞)`, with `E_Σ(𝔞) = ∏_{ℓ∈Σ} E_ℓ(𝔞, ⟨ℓ⟩⁻¹)` the product of Euler factors; hence `L_Σ(ρ̄, ωⁱ) ≡ u·L(ρ̄, 𝔞, ωⁱ)·E_Σ(𝔞, ωⁱ)` modulo `𝔞` for a unit `u` of `T(𝔞)°`.

`ρ̄` irreducible, odd, ordinary, `p`-distinguished and modular, with a chosen `p`-stabilisation; `Σ` a finite set of primes `ℓ ≠` p. Prove `ordinaryIhara_residualInjective`: for `M` prime to `p`, `ℓ≠p`, `n_ℓ=1` when `ℓ∣M` and `n_ℓ=2` otherwise, `N=ℓ^{n_ℓ}M`, and a residual ordinary irreducible `p`-distinguished maximal ideal `𝔪` of `T_M`, the map
`H¹(Mp;𝔽_p)^ord[𝔪] → (T_M/𝔪)⊗_{T′_N/𝔪′}H¹(Np;𝔽_p)^ord[𝔪′]`
induced by `ε_ℓ*` is injective. Here `𝔪′` is the pullback to the Hecke algebra away from `N`, and `ε_ℓ*` is the degeneracy combination `B*_{ℓ,1}−ℓ⁻¹T_ℓB*_{ℓ,ℓ}` when `n_ℓ=1`, and `B*_{ℓ²,1}−ℓ⁻¹T_ℓB*_{ℓ²,ℓ}+ℓ⁻³D_ℓB*_{ℓ²,ℓ²}` when `n_ℓ=2`. Prove `ordinaryIhara_fullHeckeVanishing`: for `D` prime to `p` and `y∈H¹(Dp;𝔽̄_p)^ord`, if `B*_{ℓ,ℓ}y` is a full-Hecke eigenvector at level `Dℓ` with irreducible `p`-distinguished residual representation, then `B*_{ℓ,ℓ}y=0`. These are EPW Lemmas 4.5.2–4.5.3, pp. 39–42, in the conventions of Theorem 4.3.2. The degeneracy-map supplier alone does not assert them.

(1) and (2) are transports of §1.5 along the isomorphism of EPW Proposition 2.6.2 and the surjection (4.4); specialisation is §1.6. Use EPW Theorem 4.3.2’s degeneracy-map comparison: its integral isomorphism needs residual injectivity, proved in §4.5 by the Wiles–Ihara degeneracy exact sequence and the full-Hecke-eigenvector vanishing lemma. The mere existence of degeneracy maps is insufficient. Once this isomorphism is supplied, evaluating path classes gives the Euler-factor product and identifies periods up to a unit uniformly, not just pointwise after inverting p.

At every classical height-one prime `℘` of `T(𝔞)`, `L(ρ̄, 𝔞, ωⁱ)` specialises to the `p`-adic L-function of the newform `f_℘` up to a unit (EPW Proposition 4.1.4 with Definition 4.2.2).

- `imprimitiveFamilyL`: `L_Σ(ρ̄, ωⁱ) ∈ T_Σ ⊗̂ Λ^{(i)}` up to `T_Σ^×`.
- `branchFamilyL`: `L(ρ̄, 𝔞, ωⁱ) ∈ T(𝔞)° ⊗̂ Λ^{(i)}` up to units.
- `branchFamilyL_specialise`: At classical `℘` it is the `p`-adic L-function of `f_℘` with canonical period.
- `imprimitive_eq_branch_mul_euler`: `L_Σ ≡ u·L(ρ̄, 𝔞)·E_Σ(𝔞) mod 𝔞`.

**Checks.**

- For `Σ = ∅` and a minimal branch, `E_∅ = 1` and the two constructions agree up to a unit.
- For `ℓ∤N(𝔞)p` use `E_ℓ(𝔞,X)=1−a_ℓX+D_ℓℓ⁻¹X²`, where `D_ℓ` is the weight/tame Hecke diamond in `T(𝔞)°`. Evaluate at `X=[ℓ]_cyc⁻¹` in the independent cyclotomic measure algebra and then project to `ω^i`. For `ℓ∣N(𝔞)`, `E_ℓ=1−a_ℓX`, including `E_ℓ=1` when `a_ℓ=0`. The Hecke diamond `D_ℓ` and cyclotomic group element `[ℓ]_cyc` must not be identified.
- At a weight-two newform prime, the branch function is the canonical homology-quotient normalized one-variable function. Its identification with the saturated-eigensymbol normalization of ModularSymbolsPadicLFunctions requires the integral period comparison.
- At a nonempty `Σ`, the imprimitive and newform constructions differ by the specified Euler product up to a unit. A local factor may be 1 or may vanish at a character, so nonempty `Σ` alone does not force the values to differ.

See [EPW](#ref-epw), §4.2, Definitions 4.2.1–4.2.2, pp. 31–32; §4.3, Definition 4.3.1, Theorem 4.3.2 and Corollary 4.3.3, pp. 32–33; §4.5, Lemmas 4.5.1–4.5.3 and proofs, pp. 37–42.

This uses §1.9; §1.5; §1.6; §1.3; §1.1; `ModularCurvesPartII`, §15.1 (The two geometric degeneracy pullbacks).

### Examples

Choose `θ⁺:M⁺≃T` and replace it by `uθ⁺` for `u∈T×`. The scalar measure becomes `uL`, while the corresponding basis `θ⁺⁻¹(1)` becomes `u⁻¹θ⁺⁻¹(1)`. At a specialization `κ` this gives `κ(u)L_κ`; a nonunit scalar would change the integral period lattice and is not a change of trivialization.

For `A={(a,b)∈ℤ_p²:a≡b mod pⁿ}`, projection `λ` to the first factor has annihilator `pⁿℤ_p×0`. Its image ideal is `(pⁿ)`, and its raw congruence module is `ℤ_p/(pⁿ)`. For `n=0` this is zero, consistent with two separated factors. On a branch with `Σ` empty the Euler product is 1. Adding one good prime `ℓ` produces `1−a_ℓ[ℓ]_cyc⁻¹+D_ℓℓ⁻¹[ℓ]_cyc⁻²`; the weight diamond `D_ℓ` remains a coefficient independent of `[ℓ]_cyc`.

### Dependencies

Layer 0 supplies ordinary Hecke algebras and control; Layer 0a supplies projector exactness and inverse limits. `ModularCurvesPartII`, §§14.1–14.15, 15.1 and 17.2, supplies geometric coefficient systems, boundary comparisons, degeneracies and the integral Hecke realization. Relative homology with the trace convention and ordinary residual multiplicity one are targets in §§1.1–1.3 here. The integral moment maps, residual ordinary Ihara comparison and pairing corrections are stated in this layer. `ModularSymbolsPadicLFunctions`, Layers 0–2, supplies single-weight symbols, saturated eigensymbol lattices and one-variable interpolation. `PadicMeasuresIwasawaAlgebras` supplies completed tensor products and cyclotomic measures. The raw annihilator congruence construction uses Mathlib’s quotient and annihilator APIs; it is distinct from the higher-codimension Ext construction.

## Layer 2a: The eigenvariety construction

### 2a.1 The Fredholm spectral hypersurface

For a compact controlling operator `φ` on `a (Pr)` Banach `R`-module, form `Z_φ=V(det(1−Tφ))` inside `Sp(R)×A¹_an`. The coordinate `T` records the reciprocal of a nonzero `φ`-eigenvalue.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. A commutative Hecke algebra acts continuously and contains `φ`.

Use the entire Fredholm series to define a closed rigid subspace. Cover the analytic affine line by closed discs and construct the truncated affinoid zero loci. Use coefficientwise determinant base change to identify the pullback spectral hypersurface.

Keep the nilpotent structure of the zero locus. Verify `Tφ=1` on a selected eigenline; do not reverse the reciprocal convention.

- `Eigenvariety.spectralVariety`: `Z_φ := V(det(1 − Tφ)) ⊆ Sp R × 𝔸¹`, as a rigid space over `Sp R`.
- `Eigenvariety.spectralVariety_truncation`: `Z_φ ∩ (Sp R × B[0, r]) = Sp R⟨T/r⟩/(P)`.
- `Eigenvariety.mem_spectralVariety_iff`: `(x, λ) ∈ Z_φ` iff `1 − λφ_x` is not invertible on `M ⊗ k(x)`, i.e. `λ⁻¹` is a nonzero eigenvalue.
- `Eigenvariety.spectralVariety_baseChange`: `Z_{φ⊗1}` over `R'` is the pullback of `Z_φ` (coefficientwise base change of the Fredholm series).

**Checks.**

- `φ = 0: det(1 − Tφ) = 1` and `Z_φ = ∅`.
- `M = R`, `φ = a: Z_φ = V(1 − aT)` has one point `T = 1/a(x)` over each `x` with `a(x) ≠ 0` and none over the zeros of a.
- `M = R²`, `φ = (1 1; 0 1): det(1 − Tφ) = (1 − T)²`, so `Z_φ` is nonreduced along `T = 1` (the nilpotent structure is kept).

See [Buzzard](#ref-buzzard), §4 setup, pp. 25–26; §5, p. 32.

This uses `LocallyAnalyticDistributions`, §§4.8–4.9 and 4.14; `LocallyAnalyticDistributions`, §4.2; `LocallyAnalyticDistributions`, §4.1; `LocallyAnalyticDistributions`, §§4.2 and 4.15.

### 2a.2 Flat quasi-finite spectral charts

Each closed-disc truncation `Z_r` of an entire Fredholm hypersurface with constant coefficient one maps flatly and quasi-finitely to the affinoid weight base. Every affinoid subdomain of `Z` has the same properties.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. The radius lies in the divisible closure of `|K×|`.

After extending/rescaling the radius, reduce to `R⟨T⟩/(P)`. Use Weierstrass preparation to prove finite fibers. Use flatness of the Tate algebra and the nonzero image of `P` in each residue-field Tate algebra, followed by the local flatness criterion.

Track why the constant coefficient one excludes the zero function in every fiber. This is quasi-finite flatness, not a claim that the whole spectral map is finite.

See [Buzzard](#ref-buzzard), Lemma 4.1 and Corollary 4.2, p. 27.

This uses §2a.1; `AdicSpacesPartII`, R0.

For `r ∈ √|K×|`, construct the weighted relative Tate algebra `R⟨T/r⟩` from the completed tensor product of the affinoid algebra with the supplied weighted one-variable Tate algebra. Its API gives the coefficient/Gauss norm description, finite coefficient extension and compatibility with restrictions; prove `spectralBlock_weierstrass` for a Fredholm series distinguished on the chosen residue disc, with its unique distinguished polynomial and unit factor. Descent through a finite extension making `r` an actual value uses the scalar-extension comparison of `RigidAnalyticGeometry`, §§1.3 and 1.5. This is the weighted residue-fibre preparation needed in §2a.2. Source: [Buzzard](#ref-buzzard), §4, and [Conrad](#ref-conrad), Appendix A.1.

**Checks for weighted preparation.**

- At radius 1 it is the supplied ordinary relative Tate algebra.
- After an extension with `|a| = r`, the substitution `T = aS` identifies its norm with the radius-one Gauss norm.
- For `F=(T−a)U` on the radius-`r` disc, with `|a|≤r` and `U` a unit, the distinguished block has degree one. If `|a|>r`, `F` is a unit and the block has degree zero. On the unit disc over `ℚ₅`, `a=1/5` and `U=−5` give `F=1−5T`, whose inverse is `∑(5T)ⁿ` and whose spectral block is empty.

### 2a.3 Constant fiber rank gives finite charts

An affinoid spectral domain over an admissible open weight domain is finite flat when all its fibers have the same finite rank. The imported general criterion requires flatness, quasi-compactness, separatedness, finite fibers and locally constant fiber rank.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm.

Apply the already proved flatness of spectral charts. Conrad Theorem A.1.2 reduces a quasi-compact separated flat quasi-finite map of constant fibre rank to a finite flat map. Use AdicSpacesPartIII §§R2.6–R2.7 for formal-model separatedness, flattening and quasi-finite models, and §R2.4 for the rig-point criterion. Conrad Lemmas A.1.4–A.1.5, pp. 38–40, supply the scheme-theoretic and rigid fibre-rank comparison. Use these formal-model inputs through the AdicSpacesPartIII supplier contract. Verify each geometric hypothesis for the selected chart.

Retain quasi-compactness and separatedness, including over nondiscretely valued fields. Prove the constant-rank finiteness criterion from the stated formal-model comparisons; the existence of a formal model alone does not prove it.

See [Buzzard](#ref-buzzard), Corollary 4.3, p. 27; [Conrad](#ref-conrad), Theorem A.1.2 and proof, internal pp. 37–39.

This uses §2a.2; `AdicSpacesPartIII`, §R2.4; `AdicSpacesPartIII`, §R2.6; `AdicSpacesPartIII`, §§R2.6–R2.7; `AdicSpacesPartIII`, §R2.6.

### 2a.4 Newton polygons and fiber-degree loci

For a fixed closed-disc radius, the loci where the truncated spectral fiber has degree at least `i` are finite unions of affinoid domains, vanish for sufficiently large `i` and form a decreasing filtration of the weight base.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. The defining series is entire with constant coefficient one.

Choose a uniform coefficient cutoff after which `|r_n|r^n<1`. Describe the locus where the weighted `n`-th coefficient achieves the maximum by affinoid inequalities. Read fiber degree from the Newton polygon to express the degree-at-least-`i` locus as a finite union of these domains.

Prove a single finite cutoff valid over the whole affinoid base. Do not assume that an arbitrary quasi-finite image of an affinoid is affinoid.

See [Buzzard](#ref-buzzard), Lemma 4.4 and proof, p. 28.

This uses §2a.1; `LocallyAnalyticDistributions`, §4.2.

### 2a.5 Strict neighborhoods with a fixed slope block

Let `r` be in the divisible closure of `|K×|` and let `V` be an affinoid subdomain of `B=`Max`(R)` over which `f_r:f_r^{-1}(V)→V` is finite of constant degree `d>0`. Construct an affinoid subdomain `X` of `B` that is a strict neighbourhood of `V` (Buzzard's p. 28 definition: there is a finite union `W` of affinoid subdomains with `V∩W=∅` and `X∪W=B`) and a radius `s>r` in the divisible closure of `|K×|` such that `Y=f_s^{-1}(X)` contains `f_r^{-1}(V)`, is finite flat of degree `d` over `X`, and is open-and-closed in the full spectral preimage `f^{-1}(X)`, so `Y` lies in the cover `C`.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm; `P(T)=Σ r_n T^n` is entire with `r_0=1`. `r` lies in the divisible closure of `|K×|` and `V` is an affinoid subdomain of `B`. The initial block `f_r^{-1}(V)→V` is finite of positive constant degree `d`.

Newton polygons: constant fibre degree `d` over `V` means `|r_d(x)|≠0` and `−log|r_n(x)| ≥ (n−d)log r − log|r_d(x)|` for all `n`, strictly for `n>d`; use `r_0=1` at `n=0` to get `|r_d(x)| ≥ r^{−d}` on `V`. Entire decay gives `N>d` with `−log|r_n(x)| > n log(r+1)` for `n≥N` on all of `B`; the maximum modulus principle on the affinoid `V` gives `t` with `r<t<r+1` such that `−log|r_n(x)| ≥ (n−d)log t − log|r_d(x)|` for all `n` on `V`, with equality only at `n=d`. Choose `γ1`,`γ2`,`δ1`,`δ2` in log of the divisible closure of `|K×|` with `log r<γ1<γ2<log t` and `δ1 < −log|r_d| < δ2` on `V`. Define `X` by the `N` Laurent/rational conditions `δ1 ≤ −log|r_d(x)| ≤ δ2`; `−log|r_n(x)|+log|r_d(x)| ≥ (n−d)γ1` for `0 ≤ n < d` (the `n=0` condition `−log|r_d(x)| ≤ dγ1` supplies the uniform lower bound for `|r_d|` on `X`); `−log|r_n(x)|+log|r_d(x)| ≥ (n−d)log t` for `d<n<N`. On `X` the bound `|r_d|≥e^{−δ2}` makes `r_d` a unit, so the ratio conditions are Weierstrass conditions inside a Laurent domain and `X` is an affinoid subdomain. Strict neighbourhood: `V` satisfies every defining inequality strictly, so `V⊂X`. Let `W` be the union of the affinoid subdomains `{|r_d| ≥ e^{−δ1}}`, `{|r_d| ≤ e^{−δ2}}` and, for each ratio condition, `{|r_d| ≥ e^{−δ2}} ∩ {reversed ratio inequality}`; the intersection with the Laurent domain where `r_d` is a unit is needed for these pieces to be affinoid subdomains (a bare condition `|r_n| ≥ c|r_d|` is not an affinoid subdomain at common zeros of `r_n` and `r_d`). Then `V∩W=∅` and `X∪W=B`. Set `s=exp(γ2)`. For `x∈X` and every `n≠d` one has `−log|r_n(x)|+log|r_d(x)| > (n−d)γ2`: for `0≤n<d` from `γ1<γ2`, for `d<n<N` from `γ2<log t`, and for `n≥N` from the entire bound together with the `n=0` condition `(log|r_d(x)| ≥ −dγ1)`. Hence the Newton polygon of `P_x` has exactly `d` roots of norm `≤ s` and none of norm `s`, so `f_s^{-1}(X)→X` has constant degree `d` and Corollary 4.3 makes it finite flat. `Y∈C`: once `Y→X` is finite, `Y` is open and closed in `f^{-1}(X)` by footnote 2 (Grosse-Klönne; BGR 9.6.3/3 and 9.5.3/5); alternatively make the pointwise 'no root of norm `s'` uniform on the affinoid `X` by the maximum modulus principle to obtain an empty annulus `s<|T|≤s'` over `X`.

Keep radii and logarithmic radii distinct: the high-coefficient bound uses `(n−d)log t`. The `n=0` inequality gives the lower bound for `|r_d|` on `X`, and the pieces of `W` lie in the Laurent domain where `r_d` is invertible. The complement witness is `V∩W=∅` and `X∪W=B`; `X` and `W` may meet on their boundaries. For `P(T)=1+uT` over `Sp K⟨u⟩` with `V={|u|=1}`, `r=1` and `d=1`, this lower bound is exactly what prevents the selected fibre becoming empty on `X`.

- `Eigenvariety.strictNeighbourhood`: The affinoid `X ⊇ V` and radius `s > r` of the corrected Lemma 4.5.
- `Eigenvariety.subset_strictNeighbourhood`: `V ⊆ X`.
- `Eigenvariety.strictNeighbourhood_witness`: `A` finite union of affinoids `W` with `V ∩ W = ∅` and `X ∪ W = B`.
- `Eigenvariety.strictNeighbourhood_finiteFlat`: `f_s⁻¹(X) → X` is finite flat of degree `d` and open-and-closed in `f⁻¹(X)`.

**Checks.**

- `P(T) = 1 + uT` over `Sp K⟨u⟩`, `V = {|u| = 1}`, `r = 1`, `d = 1`: omitting the `n=0` condition permits points with empty fibre over `B[0,s]`; including it makes the degree 1 on `X`.
- `P(T) = 1 − T` (a constant family): `V = B` gives `X = B` and `f_s⁻¹(B) ≅ B`, degree 1.
- For `P=1+uT`, `X∩W` may contain boundary points `|u|=e^{−δ₂}`, while `V∩W=∅` and `X∪W=B` are the required strict-neighbourhood identities.

See [Buzzard](#ref-buzzard), Lemma 4.5 and proof, pp. 29–30 (author manuscript pagination); [Buzzard](#ref-buzzard), Definition of strict neighbourhood, p. 28; [Buzzard](#ref-buzzard), Lemma 4.5, proof, p. 30, strict-neighbourhood witness identities.

This uses §2a.4; §2a.3.

### 2a.6 An admissible cover by finite slope blocks

The affinoid domains `Y` of `Z` that are finite surjective over an affinoid weight domain and open-and-closed in its full spectral preimage form an admissible cover of `Z`.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm.

For each truncated `Z_r`, filter the base by the finite degree-at-least-`i` loci `U_i` of Lemma 4.4 (each a finite union of affinoids, `U_{i+1}⊆U_i`, empty for large `i`). Start with the maximal-degree locus `U_d`: cover it by affinoids `V_α`, where the degree is exactly `d`, so Corollary 4.3 gives finite flatness; enlarge each block to a strict neighbourhood `X_α` with `Y_α=f_{s_α}^{-1}(X_α)` by Lemma 4.5. Descend by induction on `i`: from a witness `W` with `W∩U_i=∅` and `W∪⋃X_α=B`, cover `W∩U_{i−1}` (a finite union of affinoids on which the degree is exactly `i−1`) by new blocks, apply Lemma 4.5 to them, and intersect witnesses to keep a strict-neighbourhood witness for `U_{i−1}`. Coverage of `f_r^{-1}(U_{i−1})` needs, for the old blocks, `f_r^{-1}(X_α)⊆Y_α`, which holds because `s_α>r`; retain this stronger inclusion in the induction hypothesis to cover points of `U_{i−1}∖U_i` that already lie in an old `X_α`. Conclude that every `Z_r` is covered by finitely many selected affinoids; since `Y∩Z_r` is an affinoid subdomain of the affinoid `Z_r`, the cover is admissible.

Establish a finite cover on each `Z_r`, not merely coverage of geometric points. Keep the strict-neighborhood induction and the finite-flatness theorem as explicit prerequisites.

See [Buzzard](#ref-buzzard), Theorem 4.6 and full proof, pp. 30–31.

This uses §2a.4; §2a.5; §2a.3.

### 2a.7 `A` polynomial for each spectral block

For a connected affinoid weight domain `A` and a finite-flat spectral block `Y` of degree `d`, identify `O(Y)` with `A[T]/(Q₀)`, normalize `Q₀` to have constant term one, and obtain a coprime factor `Q` of the Fredholm series. Apply the Riesz theorem to obtain the associated finite projective Hecke-stable summand `N`.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. `Y` belongs to the admissible slope cover.

Take the characteristic polynomial `Q_0` (monic of degree `d`) of the spectral coordinate `T` acting on the finite projective module `O(Y)` over the connected affinoid `A=O(X)`; Cayley–Hamilton gives `A[T]/(Q_0)→O(Y)`. Use the closed immersion of `Y` in `X×B[0,r]` and the equivalence of residue and finite-module Banach norms (BGR 3.7.4/1) to prove that `A[T]/(Q_0)→O(Y)` is surjective; equal ranks make it an isomorphism, so `F_A` vanishes in `A{{T}}/(Q_0)` and `Q_0` divides `F_A`. Normalise `Q=a_0^{-1}Q_0` with `Q(0)=1` and unit leading coefficient. The source invokes Theorem 3.3 without arguing that `Q` is coprime to `S:=F_A/Q`. Supply it: `Y` is open and closed in `f^{-1}(X)`, so over each point `x` the roots of `Q_x` are the roots of `F_x` lying in `Y_x` with their full multiplicities; hence `S_x` has no root in common with `Q_x`, `Res(Q,S)` has no zero on Max`(A)`, so it is a unit in the affinoid `A` and `(Q,S)=1` by the resultant-unit criterion. Apply the exact finite-slope theorem to obtain `N` with `Q*(φ)=0` on `N`; the projector lies in the closure of `A[φ]`, so `N` is stable under the commuting Hecke algebra.

Prove `Q(0)=1` and a unit leading coefficient, and justify coprimality with the complementary factor. Prove coprimality of `Q` with the cofactor `S` explicitly; test on a chart whose fibre over some point has a root of `F_x` of multiplicity 2 to see why the open-and-closed property is what guarantees full multiplicities in `Q_x`. Keep `N` finite projective; a global basis is not part of the conclusion.

- `Eigenvariety.slopePolynomial`: `Q = a₀⁻¹Q′` with `Q′` the characteristic polynomial of `T` on `O(Y)`.
- `Eigenvariety.slopePolynomial_constantCoeff`: `Q(0) = 1` and the leading coefficient of `Q` is a unit.
- `Eigenvariety.slopePolynomial_isCoprime`: `Q` and `F_A/Q` are coprime (resultant a unit).
- `Eigenvariety.slopeSummand`: `N ⊆ M_A` with `Q*(φ) = 0` on `N`, finite projective of rank `d`, Hecke-stable.

**Checks.**

- For `M=A` and `φ=a` with `a∈A^×`, the full spectral graph is finite over `Sp(A)`; `Q=1−aT` and `N=M`. Without the unit hypothesis the whole graph need not be a finite-flat block.
- For `M=A²` and `φ=diag(a,b)` with `a`,`b∈A^×` and `a−b∈A^×`, the two graphs are disjoint finite-flat blocks. Selecting the a-graph gives `Q=1−aT` and `N=A·e₁`.
- On `M=A²`, for `a∈A^×` and `φ=(a 1;0 a)`, the full block has `Q=(1−aT)²` and `N=M`; cutting the double root would violate open-and-closedness. For `a=0`, `φ` is nilpotent, its Fredholm determinant is 1, its spectral space is empty and `N=0`.

See [Buzzard](#ref-buzzard), §5, pp. 34–35.

This uses §2a.6; `LocallyAnalyticDistributions`, §§4.14–4.16; `LocallyAnalyticDistributions`, §4.4; the projective-determinant supplier contract.

### 2a.8 Finite Hecke algebras on slope blocks

Let `T(Y)` be the image of the commuting Hecke algebra in `End_A(N)`. It is finite over `A` and over `O(Y)`, where the spectral coordinate acts as `φ⁻¹`. Its affinoid spectrum `D(Y)` is therefore finite over `Y`.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. `N` is the finite projective slope summand.

The Riesz projector commutes with Hecke operators, so every Hecke action restricts to `N`. Use Noetherianity and finiteness of `End_A(N)` to prove that the Hecke image is finite. Use the reciprocal slope polynomial and its unit constant term to express `φ⁻¹` polynomially and construct `O(Y)→T(Y)`.

Retain generalized eigenspaces and nilpotents. Verify that the finite algebra is the actual image on `N`, not an abstract algebra specified by desired eigenvalues.

- `Eigenvariety.heckeImage`: `T(Y) :=` image of the Hecke algebra in `End_A(N)`.
- `Eigenvariety.heckeImage_finite`: `T(Y)` is a finite `A`-algebra, hence affinoid.
- `Eigenvariety.heckeImage_algebraMap`: `O(Y) → T(Y)` sending `T` to `φ⁻¹`.
- `Eigenvariety.heckeImage_le_end`: `T(Y)` is a commutative subalgebra of `End_A(N)`.

**Checks.**

- Hecke algebra generated by `φ: T(Y) = A[φ]|_N`, a quotient of `O(Y)` with nilpotent kernel (Chenevier 6.4.3).
- Buzzard's example over `R = K⟨X, Y⟩` (§5, p. 33): `T(Z_φ) = R ⊕ I` is finite, torsion-free and nonreduced.
- `N = 0: T(Y) = 0` and `D(Y) = ∅`.

See [Buzzard](#ref-buzzard), §5, pp. 34–35.

This uses §2a.7; `LocallyAnalyticDistributions`, §§4.9 and 4.14.

### 2a.9 Gluing Hecke charts

Construct compatible identifications of `D(Y)` under affinoid restriction and intersections of spectral blocks, then glue the `D(Y)` and their finite maps to a separated rigid eigenvariety finite over `Z`.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm.

Restrict a block idempotent to a smaller weight affinoid and identify the Hecke algebra by flat completed base change. For two blocks multiply their idempotents to describe the intersection and its corresponding connected components. Check the cocycle and glue both spaces and morphisms along the admissible spectral cover.

Prove the overlap maps are the prescribed pullbacks. Prove separatedness and local finiteness of the glued morphism.

- `Eigenvariety.eigenvariety`: `D_φ`, glued from the `D(Y)`, `Y ∈ C`.
- `Eigenvariety.eigenvariety_toSpectral`: The finite map `D_φ → Z_φ`.
- `Eigenvariety.eigenvariety_restrict`: `D_φ ×_{Z_φ} Y ≅ D(Y)` for `Y ∈ C`, compatible with restriction to smaller blocks.
- `Eigenvariety.eigenvariety_separated`: `D_φ` is separated.

**Checks.**

- Hecke algebra `= R[φ]: D_φ → Z_φ` is a nil-isomorphism.
- `φ = 0: D_φ = ∅`.
- If `Z_φ ∈ C` is one block, `D_φ = D(Z_φ)`.

See [Buzzard](#ref-buzzard), Lemmas 5.1–5.3 and gluing argument, pp. 35–37.

This uses §2a.8; §2a.6; `AdicSpacesPartIII`, §§R3.1–R3.3.

### 2a.10 Flat base change of eigenvarieties

For a flat morphism `R→R′` of reduced affinoid algebras, the eigenvariety formed after completed scalar extension agrees with the pullback eigenvariety. The spectral hypersurface commutes with arbitrary continuous coefficient extension, but the same assertion for the Hecke-image algebra requires a separate argument.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. `R→R′` is flat for the eigenvariety comparison.

Lemma 5.4: the spectral variety commutes with any continuous base change by Lemma 2.13. Pull back the admissible finite-slope cover: for `Y∈C` its pullback `Y′` lies in `C′`; the pulled-back blocks form an admissible cover of `Z_{φ′}` because finitely many of them cover each pulled-back truncation `Z′_r` (the source's appeal to BGR 9.1.4/2 for the separated space `Z_{φ′}` supplies affinoidness of intersections, not admissibility by itself). Use flatness of `R→R′` to commute taking the finite Hecke image inside `End_A(N)` with coefficient extension; without flatness the natural map from `D(Y′)` to the pullback of `D(Y)` need not be an isomorphism. Glue the finite-chart comparisons along the pulled-back cover.

Retain the flatness hypothesis. Use the source’s `R=K⟨X,Y⟩` example to test failure after specialization `X=Y=0`.

See [Buzzard](#ref-buzzard), Lemmas 5.4–5.5 and the flatness remark, pp. 37–38.

This uses §2a.9; §2a.1; `LocallyAnalyticDistributions`, §§4.2 and 4.15.

### 2a.11 Radius changes and linked Banach modules

A primitive link `α:M′→M` with compact Hecke-equivariant `c:M→M′` satisfying `αc=φ` and `cα=φ` induces an isomorphism of eigenvarieties. Finite composites of primitive links have the same property.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm. `M` and `M′` satisfy `(Pr)` and carry the same commuting Hecke actions.

Use the cyclic determinant identity (Lemma 2.12; the proof on p. 40 cites Lemma 2.13 for this step, which is the base-change lemma, while p. 39 correctly cites Lemma 2.12) to identify the Fredholm hypersurfaces and hence the slope covers `C` and `C′`. On every slope block, `φ` is invertible on `N` and `N′` by a polynomial `ψ(φ)` in `R[φ]` because `Q*` has unit constant term. Show `ψ(φ)c` is a two-sided inverse to `α:N′→N` on the finite projective summands (`α` and `c` commute with `φ`, so they respect the kernels of `Q*(φ)`); transport their Hecke-image algebras and glue.

Require genuine intertwining identities for a radius change; equality of pointwise eigenvalues is insufficient. Check compatibility with all chart-gluing maps.

See [Buzzard](#ref-buzzard), Primitive links and Lemma 5.6 with proof, pp. 39–40.

This uses §2a.8; §2a.9; `LocallyAnalyticDistributions`, §4.2.

### 2a.12 The eigenvariety over weight space

For a reduced rigid weight space `W` with `(Pr)` Banach modules on its affinoids, compact controlling operators, commuting Hecke actions and compatible links under restriction, glue the affinoid constructions to a rigid eigenvariety over `W`.

`K` is complete for a nontrivial nonarchimedean absolute value. `W` is a reduced rigid space; for each admissible affinoid open `X⊆W`, `R_X=O(X)` with its supremum norm carries `a (Pr)` Banach module `M_X` with a commuting action of `T` and compact `φ_X`. For affinoid opens `X_i⊆X_j` there are links `α_{ij}: M_{X_i} → M_{X_j} ⊗̂_{O(X_j)} O(X_i)` with the cocycle `α_{13} = (α_{23} ⊗̂ 1) ∘ α_{12}` for `X_1⊆X_2⊆X_3`. The link has source the module on the smaller affinoid and target the restriction of the module on the larger one; this typing fixes the scalar-extension direction in Construction 5.7.

Compare the module on a smaller affinoid with the base extension of the module on a larger one using the link theorem. Use flat affinoid base change to compare their eigenvarieties. Apply the compatibility of the links to verify descent and glue over `W`.

Prove canonical restriction to every affinoid and independence of the covering. Do not infer reducedness or flatness over `W` from reducedness of `W`.

- `Eigenvariety.eigenvarietyOverWeight`: `D_φ` over `W` from the data of Construction 5.7.
- `Eigenvariety.weightMap`: `D_φ → W`.
- `Eigenvariety.eigenvalueMap`: The `φ`-eigenvalue coordinate `D_φ → 𝔾_m^{an}`.
- `Eigenvariety.eigenvarietyOverWeight_restrict`: Canonical isomorphism with the affinoid construction over every affinoid `X ⊆ W`.
- `Eigenvariety.eigenvarietyOverWeight_cover_indep`: Independent of the admissible affinoid cover.

**Checks.**

- `W = a` point: recovers the eigenvariety of one `(Pr)` module.
- `M_X = M ⊗̂ O(X)` with `φ ⊗ 1` and identity links: `D_φ = D_pt × W`.
- With identity links the gluing reduces to §2a.9 over each affinoid.

See [Buzzard](#ref-buzzard), Construction 5.7 and proof, pp. 40–41.

This uses §2a.11; §2a.10; `PadicMeasuresIwasawaAlgebras`, §3a.1 (The character space of `ℤ_pˣ` and its functions).

### 2a.13 Points and finite-slope eigenpackets

Identify L-points of the constructed eigenvariety with `φ`-finite simultaneous Hecke eigensystems in the completed coefficient fibers, for complete extensions `L/K`. This classifies eigensystems, not a unique eigenvector or its multiplicity.

`K` is complete for a nontrivial nonarchimedean absolute value. `R` is a reduced `K`-affinoid algebra with its supremum norm.

Work directly at an L-valued weight point `w`. Choose a spectral block containing `(w,λ(φ)⁻¹)`. Base change the finite projective Riesz decomposition to `L`; this is coefficient base change of the slope summand and does not require base change of the entire eigenvariety to a reduced L-affinoid. In characteristic zero, a global field-extension argument is also possible after proving geometric reducedness, but separatedness alone is insufficient. Reduce to a finite projective slope module `N` over an affinoid chart `Y` with base `X∋P`; `K`-points of `D(Y)` above `P` are `K`-algebra maps from `T(Y)/mT(Y)` to `K`. The natural map `T(Y)⊗_A L→End_L(N⊗_A L)` has nilpotent kernel. Extend Lemma 5.10’s Cayley–Hamilton argument from a maximal ideal to the prime kernel of `A→L` by localising there, reducing to its residue field, and then extending that field flatly to `L`. On a local trivialisation, a matrix that reduces to zero has all nonleading characteristic coefficients in that prime, so its image in the specialised Hecke algebra is nilpotent. A character of the image algebra has a common eigenvector in its faithful finite-dimensional module: the corresponding local Artinian factor has a nonzero socle. Conversely an eigenvector `m∈M_X⊗̂K` with `λ(φ)≠0` gives a point `(P,λ(φ)^{-1})` of `Z_φ` (`1−λ(φ)^{-1}φ` is not injective, so by Lemma 3.1 over `K` the Fredholm series vanishes there); choose `Y∈C` containing it; then `Q*_P(λ(φ))=0` and `Q*(φ)` is invertible on the specialised complement, so `m` lies in `N⊗K`. The source states the reduction to `N⊗K` without this argument.

Retain the distinction between the point classification and an isomorphism of possibly nonreduced specialized Hecke algebras. Check that the controlling eigenvalue is nonzero. Write out the two directions of the bijection separately; the source's one-sentence reduction to `N⊗K` and its base-change remark are not proofs.

See [Buzzard](#ref-buzzard), Lemmas 5.9–5.10 and proofs, p. 42.

This uses §2a.8; §2a.10; §2a.12; `LocallyAnalyticDistributions`, §§4.8–4.9 and 4.14.

### 2a.14 Equidimensionality and components of the eigenvariety

If the reduced weight space `W` is equidimensional of dimension `n`, then the eigenvariety `D_φ` of Construction 5.7 is equidimensional of dimension `n`, and each irreducible component of `D_φ` maps finitely and surjectively onto an irreducible component of the spectral variety `Z_φ`. Under Chenevier's additional identification of the components of `Z_φ`, those are Fredholm hypersurfaces cut out by prime Fredholm series and their images in `W` are Zariski open in components of `W`.

`K` is complete for a nontrivial nonarchimedean absolute value; use the data of Construction 5.7 with reduced equidimensional affinoids `X⊆W` of dimension `n`. Use the irreducible components of rigid spaces in the form of Conrad-IC, Corollaries 2.2.7 and 2.2.9, constructed in the component-theory target below. The assertion identifying whole spectral components with prime Fredholm hypersurfaces additionally assumes a relatively factorial affinoid cover of `W`, as in Conrad Theorems 4.2.2 and 4.3.2. Tate-algebra weight charts satisfy this condition. Over a general reduced `W` retain equidimensionality and the finite Hecke-chart component statement, but do not assert a global principal prime-Fredholm description without that additional hypothesis.

For a chart `Y∈C` with connected base `X=`Max`(A)`, the Hecke image `T(Y)` is a commutative `A`-subalgebra of `End_A(N)` with `N` finite projective, hence `T(Y)` is `A`-torsion-free after every flat base change (Chenevier, Lemme 6.2.10, first assertion). A finite `A`-algebra that is torsion-free after flat base change has every irreducible component of its spectrum mapping surjectively onto an irreducible component of `Spec A`, so it is equidimensional of dimension `n` when `A` is (Lemme 6.2.10, second and third assertions; the proof localises at the image of a minimal prime and uses that the fibre is discrete and that a torsion-free quotient forces the image prime to be minimal). Apply this to `A ⊂ A[φ^{-1}] ⊂ T(Y)`: the affinoid `Y` has `O(Y)=A[T]/(Q)` whose map to `A[φ^{-1}]` is a nil-isomorphism (Lemme 6.4.3: the characteristic polynomial ideal satisfies `I^r⊂(P)⊂I`), so `Y`, Max `A[φ^{-1}]` and `D(Y)` share equidimension `n`, and `π` and the projection to `X` send components to components. Glue: an irreducible component `Σ` of `D_φ` meets each `D(Y)` in a union of components (Conrad 2.2.9), its image `π(Σ)` is an irreducible closed analytic subset of `Z_φ` (Conrad 2.2.3) of dimension `n`, hence a component of the `n`-equidimensional `Z_φ` (Conrad 2.2.7). Buzzard's Lemma 5.8 states this result for the general machine and delegates the proof to Chenevier's Proposition 6.4.2; the argument above uses only `T(Y)⊂End_A(N)` and equidimensionality of the charts, so the delegation is legitimate in Buzzard's generality once the imported component theory is available.

Construct `rigidIrreducibleComponents X` for a locally noetherian rigid space `X` by gluing the maximal irreducible closed analytic subspaces with their reduced structures. Prove local finiteness, covering, maximality, compatibility with affinoid restriction (an intersection can be a union of components), and compatibility with finite maps and finite affinoid algebras. On an equidimensional base with a relatively factorial affinoid cover, prove that the components of a Fredholm hypersurface are cut out by prime Fredholm series and that their weight images are Zariski open in components. This is the additional component-theory target used in the preceding proof. API: `rigidIrreducibleComponents_cover`, `rigidIrreducibleComponents_affinoid`, `rigidIrreducibleComponents_finiteMap` and `fredholmComponent_primeSeries`. Sources: Conrad-IC, Corollaries 2.2.7–2.2.9, pp. 499–500, and Theorems 4.2.2 and 4.3.2, pp. 524–527.

**Checks for component theory.**

- The empty rigid space has no irreducible components; an irreducible affinoid disc has exactly one.
- The affinoid node `xy = 0` has the two coordinate axes as components. Replacing components by connected components gives the wrong single answer.
- A nilpotent thickening leaves the component index set unchanged, but each component carries its reduced structure.
- Restricting an irreducible algebraic nodal curve to a small analytic neighbourhood of the node can separate its two branches. Component restriction is a union statement, not an assertion that every intersection stays irreducible.

State the torsion-freeness and equidimensionality lemma as a purely algebraic statement about finite algebras over Noetherian rings and test it on `A=K⟨X,Y⟩` with the nonreduced example of Buzzard p. 33, where `T(Z_φ)=R⊕I` is finite and torsion-free. Do not claim the Zariski-density statement for images of components without the Fredholm-series factorisation input (Coleman–Mazur 1.3.11 or Conrad 4.3.2).

See [Buzzard](#ref-buzzard), Lemma 5.8 and its one-line proof, p. 41; [Chenevier](#ref-chenevier), Proposition 6.4.2 and proof, internal p. 53; [Chenevier](#ref-chenevier), Lemme 6.2.10 and proof, internal pp. 47–48; [Chenevier](#ref-chenevier), Lemme 6.4.3 and Corollaire 6.4.4, internal p. 54; [Conrad-IC](#ref-conrad-ic), Corollary 2.2.7, p. 499, Corollary 2.2.9, p. 500, and Theorems 4.2.2 and 4.3.2, pp. 524–527.

This uses §2a.8; §2a.12.

### 2a.15 The spectral hypersurface of a compact endomorphism of a complex

Let `A` be a reduced affinoid algebra over a finite extension `K/ℚ_p`, `M•` a bounded complex of projective Banach `A`-modules (direct summands of orthonormalisable ones) and `U ∈ End_{K^proj(A)}(M•)` compact, i.e. represented by a chain endomorphism `Ũ` that is compact in every degree. Use the supplied representative product `P̃ = complexFredholmProduct(M•,Ũ)` from `LocallyAnalyticDistributions`, §4.16: it is the entire series `∏_k det(1−XŨ|M^k)`, with constant coefficient 1 and dependence on the chosen cochain representative. It records every degree, without alternating exponents. Its zero locus `Z̃ ⊆ Sp(A) × A¹` carries a complex of coherent sheaves `𝓜•` (the universal generalised eigenspace complex of `Ũ`): `Z̃` has an admissible cover by affinoids `Y` finite and flat over their image `V ⊆ Sp(A)`, with `Y` a union of connected components of `Z̃ ×_{Sp A} V`, and on such `Y` the complex `𝓜•|_Y` is the finite slope subcomplex of `M•|_V` cut out by the factor of `P̃` attached to `Y`, a perfect complex of `O(V)`-modules.

A reduced affinoid over finite `K/ℚ_p`; `M•` bounded with projective Banach terms; `Ũ` compact in each degree.

Use the degreewise Fredholm factors and their product from LocallyAnalyticDistributions §4.16, including its entirety and single-degree comparison. The admissible cover by finite flat spectral blocks is §2a.6 applied to `P̃`; on a block the Riesz factorisation `P̃ = Q·S` gives `Ũ`-stable decompositions `Mᵏ = N_Q(Mᵏ) ⊕ F_Q(Mᵏ)` compatible with the differentials, and the finite slope subcomplex `N_Q(M•)` is a bounded complex of finite projective `O(V)`-modules (LocallyAnalyticDistributions Layer 4, the finite-slope subcomplex and its perfect model). `𝓜•|_Y` is `N_Q(M•)` viewed over `O(Y) = O(V)[X]/(Q)` with `X` acting as `Ũ⁻¹`; the identifications glue by the compatibility of Riesz projectors under refinement.

For a complex concentrated in one degree, the supplied single-degree comparison for `complexFredholmProduct` in LocallyAnalyticDistributions §4.16 identifies `P̃` with its degree Fredholm determinant, so the spectral construction is §2a.1.

- `complexSpectralHypersurface`: `Z̃ = V(P̃) ⊆ Sp(A) × A¹`.
- `universalEigencomplex`: The complex of coherent sheaves `𝓜•` on `Z̃`.
- `universalEigencomplex_perfect_on_block`: On a finite flat block `Y` over `V`, `𝓜•|_Y` is a perfect complex of `O(V)`-modules equal to the finite slope subcomplex.

**Checks.**

- For `M• = 0`, `P̃ = 1` and `Z̃` is empty.
- For `M• = M[0]`, `Z̃` is the spectral hypersurface of §2a.1.
- For the cone of the identity of `M` with `Ũ = (U, U)`, `P̃ = det(1 − XU)²`, although the complex is acyclic.
- On the cone of identity with the same `U` in both degrees, the alternating Fredholm quotient is 1 and loses the degreewise spectral data; the chosen degreewise product is `det(1−XU)²`. Its dependence on the representative is intentional, while annihilator support is treated separately.

See [Pilloni](#ref-pilloni), §13.1.2, p. 84; [BCGP](#ref-bcgp), §6.1.1, p. 139; [Buzzard](#ref-buzzard), §§4–5, pp. 25–37.

This uses §2a.1; §2a.6; the projective-determinant supplier contract; `LocallyAnalyticDistributions`, §4.16 (`complexFredholmProduct` and its single-degree comparison).

### 2a.16 The spectral variety of a compact endomorphism in the homotopy category

With `M•`, `U` and a compact representative `Ũ` as in §2a.15, the cohomology sheaves `𝓗ⁱ(𝓜•)` are coherent on `Z̃`. Let `𝓘 ⊆ O_{Z̃}` be the annihilator of the graded module `⊕_i 𝓗ⁱ(𝓜•)`. The spectral variety of `(M•, U)` is the closed subspace `Z = V(𝓘) ⊆ Z̃`, with the graded coherent sheaf `𝓗•(𝓜•)` supported on it. `Z` and `𝓗•(𝓜•)` on `Z` depend only on `U ∈ End_{K^proj(A)}(M•)`, not on the representative `Ũ`; the cohomology sheaves have slope decompositions, and at a rank-one point `x` of `Sp(A)` the fibre cohomology `Hⁱ(M•_x)` has slope decompositions for `U`.

As in §2a.15.

Coherence: on a block, `𝓗ⁱ(𝓜•)` is the cohomology of a bounded complex of finite `O(Y)`-modules. For independence of `Ũ`, identify `Hⁱ(M•^{≤c})` with the intrinsic module `algebraicSlopePartLE Hⁱ(M•) Hⁱ(U) c`, using LocallyAnalyticDistributions §4.16, *Algebraic slope parts* and *Cohomology and finite slopes*. Homotopic representatives induce the same endomorphism on `Hⁱ(M•)`. These identifications therefore give the same modules on common finite windows, compatibly with restriction and refinement; the spectral coordinate acts by the inverse of that same invertible cohomology operator. Glue the cohomology comparisons over common blocks, viewed in `Sp(A)×A¹`, to identify the annihilator ideals and their closed subspaces there. This argument requires no strict intertwiner between the two cochain representatives and asserts no chain-level equivalence. Contractible summands carry zero cohomology and contribute no annihilator support.

For `K/ℚ_p` finite and `h∈ℚ`, local constancy of `x ↦ Σ_i (−1)ⁱ dim Hⁱ(M•_x)_{=h}` near each rank-one point follows on the rational neighbourhoods of LocallyAnalyticDistributions §4.16 (finite-slope Euler local constancy). These hypotheses belong to this Euler-characteristic target; the neighbourhoods need not cover `Sp(A)` (Pilloni’s footnote 20).

- `complexSpectralVariety`: `Z = V(Ann ⊕ᵢ 𝓗ⁱ(𝓜•)) ⊆ Z̃`.
- `complexSpectralVariety_indep`: `Z` and `𝓗•` are independent of the compact representative of `U`.
- `complexSpectralVariety_support`: `A` point of `Z̃` lies in `Z` iff some `𝓗ⁱ(𝓜•)` has nonzero stalk there.
- `complexSpectralVariety_eulerChar`: For `K/ℚ_p` finite and rational `h`, the exact-slope-`h` fibre Euler characteristic is locally constant near each rank-one point on the supplied rational neighbourhoods.

**Checks.**

- For the cone of identity with `U=1` on a nonzero finite free module, `Z` is empty while the degreewise determinant hypersurface `Z̃` is nonempty.
- For `M•=A²[0]` and `U=`identity, `P̃=(1−X)²`, while `Ann(𝓜)=(1−X)` and `Z=V(1−X)`. The two spaces have the same underlying support but different nilpotent structure. For `M•=A[0]`, `U=1`, they agree.
- For `M• = (A --0--> A)` in degrees 0, 1 with `Ũ = (a, b)`, `a`, `b ∈ A^×`, `Z` is the union of the graphs `X = a⁻¹` and `X = b⁻¹` over `Sp(A)`.
- `Z̃` depends on `Ũ` (adding a contractible summand changes it) while `Z` does not, so `Z̃` is not an invariant of the homotopy class.
- On `ℚ_p⟨S⟩[0]` with `U=S` and irrational `h>0`, the exact-`h` rank is 1 at the Gauss point of radius `p^(−h)` and 0 at arbitrarily close distinct radii. Rationality of `h` cannot be removed.
- On the identity disk `A —1→ A`, the scalar representatives `U₀=1` and `U₁=p` are homotopic but the identity is not a strict intertwiner. Both intrinsic cohomology modules vanish, so both annihilator supports are empty.

See [Pilloni](#ref-pilloni), §13.1.2, p. 84, and §13.1.3 with Proposition 13.1.3.1, pp. 84–85; [BCGP](#ref-bcgp), §6.1.1, p. 139; Theorem 6.3.16 with proof, pp. 152–153.

This uses §2a.15; `LocallyAnalyticDistributions`, §4.16; Mathlib `Module.annihilator`.

### 2a.17 The coherent eigenmodule sheaf on an eigenvariety

In the setting of §2a.12 (reduced rigid weight space `W`, linked `(Pr)` Banach modules, compact controlling operator `φ`, commuting Hecke algebra `𝐓`), the finite projective slope summands `N(Y)` of the spectral blocks `Y`, viewed as `T(Y)`-modules, glue to a coherent sheaf `𝓜` on the eigenvariety `D` with `𝓜(D(Y)) = N(Y)`. On every weight chart it is finite projective as an `O(V)`-module, hence torsion-free in the nonzerodivisor sense over the reduced weight base, its formation commutes with flat base change of the weight space, and for a point `w` of `W` and a point `x` of `D` over `w` with residue field `L`, the localisation at `x` of the weight-specialised module `N(Y)⊗_{O(V)}L` is the generalised eigenspace `(M_w ⊗ L)^{≤h}[x]` of the specialised Banach module. The map `𝐓 ⊗ k(w) → End(𝓜 ⊗ k(w))` has image the Hecke algebra of the fibre, and the surjection from the fibre of `O_D` at `w` onto it has nilpotent kernel; `D` is not asserted reduced, and the nilpotents of the fibre algebra are retained.

The data of §2a.12; slopes bounded on each chart.

On a chart `D(Y) = Sp T(Y)`, the module `N(Y)` is finite projective over `A` and a faithful `T(Y)`-module, hence a coherent sheaf on `D(Y)`. Under refinement of blocks and restriction of affinoids, the Riesz projectors are compatible (§2a.9), giving gluing data for the `N(Y)`. Fibres: Riesz decompositions commute with specialisation (LocallyAnalyticDistributions Layer 4 completed base change), so `N(Y) ⊗ k(w)` is the slope part of the fibre; localising at `x` gives the generalised eigenspace. The map `T(Y)⊗_A L` onto its image in `End_L(N(Y)⊗_A L)` is surjective by definition, and its kernel is nilpotent by the Cayley–Hamilton argument of Buzzard Lemma 5.10 (localise at the prime kernel of `A→L`, reduce, then extend the residue field). Equality of semisimplifications by itself would not prove this kernel statement.

This construction gives the eigenmodule itself. Cohomology in several degrees additionally requires the derived scalar-extension and Tor comparison of §2a.16.

- `eigenmoduleSheaf`: The coherent sheaf `𝓜` on `D` with sections `N(Y)` over `D(Y)`.
- `eigenmoduleSheaf_chart`: `𝓜(D(Y)) = N(Y)` as a `T(Y)`-module.
- `eigenmoduleSheaf_fibre`: Localising `N(Y)⊗_{O(V)}L` at the maximal ideal of the specialised Hecke algebra corresponding to `x` gives the full generalized eigenspace. Tensoring instead with `κ(x)` quotients by that ideal and generally has smaller dimension.
- `eigenmoduleSheaf_flatBaseChange`: Compatible with flat base change of `W`.
- `fibreHeckeSurjective_nilpotentKernel`: `O_D ⊗ k(w) →` Hecke algebra of the fibre is surjective with nilpotent kernel.

**Checks.**

- If `φ` is zero, `D` is empty and `𝓜 = 0`.
- If `M = A` with `φ =` multiplication by a unit `u` and `𝐓 = A[φ]`, `D` is the graph `X = u⁻¹` over `Sp(A)` and `𝓜 = O_D`.
- For `M=A²`, `φ=(u 1;0 u)` with `u∈A^×`, and Hecke algebra `A[φ]`, the specialised Hecke algebra is `L[t]/(t²)`. Its local factor acts on the two-dimensional generalized eigenspace, whereas the residue fibre `N⊗_{L[t]/(t²)}L` has dimension one. Reduction loses the nonzero nilpotent action.
- The support of `𝓜` is the eigenvariety `D` of §2a.12.

See [Buzzard](#ref-buzzard), §5, Construction 5.7 and Lemmas 5.9–5.10, pp. 40–42; [Chenevier](#ref-chenevier), §6.2, Lemme 6.2.10, pp. 47–48; §6.4, Lemme 6.4.3, p. 54; [Bellaïche09](#ref-bellaiche09), §3.4.3, Lemma 3.17, pp. 32–33.

This uses §2a.9; §2a.12; §2a.8; §2a.13; `LocallyAnalyticDistributions`, §§4.2 and 4.15; `LocallyAnalyticDistributions`, §§4.14–4.16; `AdicSpacesPartIII`, §§R3.1–R3.3.

### Examples

For `A=E⟨w⟩`, `M=A²` and `U=diag(1,p)`, the Fredholm determinant is `(1−X)(1−pX)`. A block selecting the unit eigenvalue has rank 1 and Hecke image `A` if only scalar Hecke operators are present. Its spectral coordinate is `X=1`, the inverse `U`-eigenvalue. The second block has `X=p⁻¹`. If both eigenvalues coalesce, a factor selecting only one occurrence has zero resultant against the complementary occurrence and cannot be used as a Riesz decomposition.

Consider a complex `M⁰=A`, `M¹=A`, `d=1`, with `U` the identity in both degrees. The auxiliary degreewise product is `(1−X)²`, whereas the cohomological support is empty. Replacing the product by an alternating determinant would cancel it before forming the auxiliary complex, losing the intended construction. For `d=w` instead, its degree 1 cohomology is `A/(w)`; its support is the closed point `w=0` above `X=1`.

### Dependencies

`LocallyAnalyticDistributions`, Layer 4, supplies property-`(Pr)` Banach modules, compact Fredholm theory, Riesz decompositions and intrinsic finite-slope cohomology comparisons. `RigidAnalyticGeometry`, §§6.1–6.3 and 7.1–7.4, and `AdicSpacesPartIII`, §§F0.1, R2.6 and R3.1–R3.3, supply rigid gluing and finite coherent modules. The additional component theory is constructed in §2a.14. Finite-projective determinants use `PadicMeasuresIwasawaAlgebras`, §5.1, and `IntegralHeckeAndGaloisDeterminants`, §0.6. This layer constructs finite Hecke charts, their sheaves and their gluing, and verifies the component argument; it does not infer compact homotopy invariance from an arbitrary algebraic homotopy.

## Layer 2: Families of distributions and the modular-symbol eigencurve

**Standing conventions.** From §2.4 on, every statement of this layer uses the analytic chart construction of §2.1, the Banach and descent targets of §2.2 and the global-image fibre convention of §2.3. At weight 0 and negative sign it uses the global-image subspace `g` of §2.3, or localises away from the `E₂` eigensystem, and never an isomorphism with all actual symbols at that exceptional point; for general charts the symbol-specialisation and descent input must supply the same convention. At decent classical refined points the `E₂` exception is excluded by the refinement hypotheses.

### 2.1 Families of locally analytic distributions over an affinoid of weight space

Let `W = Sp R` be an affinoid subdomain of the weight space `𝒲` of continuous characters of `ℤ_p^×`, with universal character `κ_W : ℤ_p^× → R^×`. For `r ∈ p^ℤ`, `r ≤ 1`, let `A[r]` be the affinoid algebra of the closed neighbourhood `{z ∈ ℂ_p : |z − a| ≤ r for some a ∈ ℤ_p}` of `ℤ_p`, with sup norm, and `D[r]` its continuous dual. The completed tensor products `R ⊗̂ A[r]` and `R ⊗̂ D[r]` are orthonormalisable Banach `R`-modules with a natural continuous evaluation map `R ⊗̂ D[r] → Hom_R`,`cont(R ⊗̂ A[r], R)`, which is not asserted to be surjective; for `r₁ > r₂` the restriction `R ⊗̂ A[r₁] → R ⊗̂ A[r₂]` and the dual map `R ⊗̂ D[r₂] → R ⊗̂ D[r₁]` are compact. The monoid `Σ₀(p)` of integral matrices `(a b; c d)` with `p ∤ a`, `p | c` and `ad − bc ≠ 0` acts on `R ⊗̂ A[r]` by `(γ·f)(z) = κ_W(a + cz) f((b + dz)/(a + cz))` and on the full continuous dual by transposition. The tensor module `R ⊗̂ D[r]` has the action constructed by bounded multiplication by `κ_W(a+cz)` before applying the weight-zero distribution action; for every `w ∈ W(ℚ_p)` the specialisation along `w : R → ℚ_p` identifies these with `A_w[r]` and `D_w[r]` carrying the weight-`w` action.

`p` is odd. `W=Sp(R)` is an analytic weight chart and `r∈p^ℤ`, `0<r≤1`, is chosen so `κ_W(a+cz)` belongs to `R ⊗̂ A[r]` for every `γ∈Σ₀(p)`. On the central logarithmic chart with exponent coordinate of norm`≤1`, `κ_W(x)=ω(x)^i exp(T log⟨x⟩)` has this property. A general affinoid and high-conductor finite-order weights require smaller analytic radii and suitable local charts; being in one connected component alone does not prove it.

Orthonormalisability: norms of elements of `A[r]` lie in `|ℚ_p^×|` when `r ∈ p^ℤ`, so `A[r]` and `D[r]` are orthonormalisable (Serre), and completed tensor products with `R` stay so. Compactness of the restriction maps between radii is the classical compactness of restriction of affinoid functions to a strictly smaller disc. Choose a deep enough subgroup `1+p^{m+1}ℤ_p` so the universal character’s value on `γ^{p^m}` lies uniformly within the `p`-adic exponential radius. Log/exp on this subgroup and finitely many cosets give an analytic radius `r(W)>0`; retain `r≤min(1,r(W))`. This is the analytic construction required beyond the central exponent chart of the later Lemma 3.3. The bounded bilinear multiplication `A[r]×D[r]→D[r]` extends to `A[r](R)×D[r](R)→D[r](R)`. Put `h_γ(z)=κ_W(a+cz)` and `(h·μ)(f)=μ(hf)`. Define `(b⊗μ)|γ=((h_γ·(b⊗μ))|₀γ)`, so `(μ|γ)(f)=μ(h_γ(z)f((b+dz)/(a+cz)))`. Extend this bounded bilinear construction continuously and prove the monoid identities from the transposed function action. Coefficient specialization gives the weight-`w` action. No identification with the full `R`-valued dual is used.

At integral weights the specialised action is the weight-`k` action of ModularSymbolsPadicLFunctions Layer 2, so the classical distribution modules are recovered.

- `distFamily`: `R ⊗̂ D[r]` with its `Σ₀(p)`-action through `κ_W`.
- `distFamily_orthonormalizable`: `R ⊗̂ D[r]` is an orthonormalisable Banach `R`-module.
- `distFamily_restrict_compact`: The radius-change maps are compact.
- `distFamily_specialise`: `(R ⊗̂ D[r]) ⊗_{R,w} ℚ_p ≅ D_w[r]`, `Σ₀(p)`-equivariantly.
- `distFamily_pairing`: Continuous evaluation pairing `(R ⊗̂ D[r]) × (R ⊗̂ A[r]) → R`; no identification with the entire continuous `R`-dual.
- `distFamily_ext`: Two tensor distributions are equal when their evaluation pairings against every analytic test function agree; this is injectivity of the pairing, not surjectivity onto the full continuous `R`-dual.

**Checks.**

- At `w = k ∈ ℤ_{≥0}`, the specialisation is the weight-`k` distribution module of ModularSymbolsPadicLFunctions Layer 2.
- The identity matrix acts trivially for every `W`.
- At weight 1, `δ₁|(1 0; p 1)=(1+p)δ_{1/(1+p)}`. Its value on 1 is `1+p`; multiplying after the weight-zero transform instead gives `(1+2p)/(1+p)` and fails transposition.
- On an analytic chart, `γ=diag(a,1)`, `a∈ℤ_p^×`, acts on functions by `κ_W(a)f(z/a)`; at an integral weight `k` this is `a^k f(z/a)`.
- A constant character `κ_W = 1` would give the weight-zero action at every point, failing the specialisation test at `w = k ≠ 0`.
- Take `R=ℚ_p⟨T⟩` and `A[1]=ℚ_p⟨z⟩`. The bounded `R`-linear functional on `R⟨z⟩` sending `z^n` to `T^n` is evaluation at `z=T`. It does not arise from `R ⊗̂ D[1]`: modulo `p` its moment values `T^n span` an infinite-dimensional `ℤ/p`-vector space, whereas every element of the completed tensor product is uniformly approximable by a finite sum and has moments modulo `p` in a finite-dimensional coefficient space.

See [Bellaïche09](#ref-bellaiche09), §3.1, §§3.1.1–3.1.4 with Lemmas 3.1–3.2, pp. 22–24; [Bellaïche11](#ref-bellaiche11), §3.1.2, pp. 23–24; Lemma 3.3 and its proof, pp. 24–25; §3.1.4 and Lemma 3.5, pp. 25–26.

This uses `PadicMeasuresIwasawaAlgebras`, §3a.1 (The character space of `ℤ_pˣ` and its functions); `ModularSymbolsPadicLFunctions`, §2.2; `LocallyAnalyticDistributions`, §4.1; `LocallyAnalyticDistributions`, §§4.2 and 4.15.

### 2.2 Families of distribution-valued modular symbols with compact `U_p`

On cuspidal local charts the Banach-complex construction is supplied by `ModularSymbolsPadicLFunctions`, §3.0. The additional construction here is the all-weight global Banach-symbol model, its boundary specialization and chart descent; §2.7a identifies its cuspidal local realization with that supplier.

For `N` prime to `p` and `Γ=Γ₁(N)∩Γ₀(p)`, the family symbols `Hom_Γ(Δ₀,D[r](R))` have the closed finite Manin-generators presentation. On a nice chart in the sense of the later author Definition 3.4 (`R` and its unit-ball reduction principal ideal domains), the closed-submodule argument of Lemma 3.7 proves potential orthonormalisability. The Hecke operators are continuous and `U_p` factors through radius improvement; the bounded restriction argument of Proposition 3.6 supplies compactness and links. For the dagger family `D†[r](R)`, compactly supported cohomology gives an injective specialization map. It is an isomorphism except at weight 0 with negative sign, where the cokernel is the one-dimensional `E₂` Hecke module. Passing to adapted slope`≤ν` pieces retains this exception exactly when `ν≥1`. General affinoid coefficient charts require the corresponding Banach hypothesis/descent interface; no unrestricted closed-submodule theorem is asserted.

`N` prime to `p`; `p` odd; an analytic coefficient chart and `0<r≤r(W)`. For potential orthonormalisability use the exact nice-chart hypotheses of the later Definition 3.4 and Lemma 3.7, or a separately supplied equivalent Banach hypothesis. For dagger coefficients use `0≤r<r(W)`. The global chart/descent extension is an explicit input; the source proves these statements on nice neighbourhoods of classical integer weights.

Choose finitely many Manin generators; their evaluations embed symbols as a closed submodule of a finite power of `D[r](R)`. On a nice chart, reduction of its unit ball embeds into the ambient free reduction module; the coefficient reduction is a `PID`, so this submodule is free. Lift a residue basis and complete to obtain an orthonormalisation (later Lemma 3.7, p. 28). This uses the `PID` reduction hypothesis, not merely closedness. Use the bounded `U_p` radius improvement and the compact restriction of Proposition 3.6, pp. 27–28, with companions proving the link relations. Construct `familySymb_chartDescent`: refine each weight affinoid by discs on which the universal character is analytic on a common deep subgroup; use finite cosets to transfer the Manin presentation to these radii, prove property`(Pr)` for this actual presentation, and construct compatible `U_p` links on overlaps. Descend the finite-projective Riesz blocks and their Hecke action, rather than inferring property`(Pr)` for every arbitrary closed kernel. Prove cocycle and refinement independence, and compatibility with completed scalar extension. This is the additional global-chart construction target. For the weight quotient `u=0`, apply the compact-support long exact sequence to `0→D†(R)→^u D†(R)→D†_w→0`. Poincaré duality identifies the obstruction with `u`-torsion in `H₀(Γ,D†(R))`; later Lemma 3.9 computes it as zero away from weight 0 and as the `E₂` module at weight 0. The orientation reversal makes its sign negative. Thus Theorem 3.10 and Corollary 3.12 give the stated cokernel, with `U_p=p` of slope 1.

The order of construction matters: prove the nice-chart Banach theorem and the chartDescent target before applying the eigenvariety machine globally. Specialization is the compact-support cohomology calculation, with its explicit exceptional quotient, rather than an unrestricted assertion that taking a closed kernel commutes with scalar extension.

- `familySymb`: `Symb^±_Γ(R ⊗̂ D[r])` as a Banach `R`-module with Hecke action.
- `familySymb_pr`: Potential orthonormalisability, hence property`(Pr)`, on the stated nice charts. On other affinoids require the Banach descent/orthonormalisability input.
- `familySymb_Up_compact`: Compact `U_p` and radius links under the bounded radius-factorization and nice-chart Banach hypotheses.
- `familySymb_specialise`: Injective dagger-symbol specialization; cokernel zero unless `w=0` and sign`−`, when it is the one-dimensional `E₂` Hecke module. On slope`≤ν` it survives precisely for `ν≥1`.
- `familySymb_iota`: The involution `ι` commutes with the Hecke operators and splits the module into `±` parts.
- `familySymb_ext`: Two family symbols are equal if they agree on a finite set of Manin generators of `Δ₀`; the relations and `Γ`-equivariance are part of the construction.

**Checks.**

- At `w = k` the specialisation map lands in ModularSymbolsPadicLFunctions Layer 2's `Symb_Γ(D_k)` and is Hecke-equivariant.
- `ι² = 1`, so on `R ⊗̂ D[r]` (where 2 is invertible) the projectors `(1 ± ι)/2` are complementary idempotents commuting with the Hecke operators.
- `Symb_Γ = Symb⁺_Γ ⊕ Symb⁻_Γ` because 2 is invertible on `R ⊗̂ D[r]`.
- The scalar relation map `R→R`, multiplication by `T` over `R=ℚ_p⟨T⟩`, has kernel zero, but after specializing `T=0` its kernel is `ℚ_p`. This presentation test prevents inferring symbol specialization from a closed-kernel description alone.
- At `w=0`, negative sign and `ν≥1`, specialization has a one-dimensional cokernel with `T_ℓ=1+ℓ`, `U_p=p` and trivial diamonds. A claimed full-symbol isomorphism fails here; `ν<1` removes that cokernel.

See [Bellaïche09](#ref-bellaiche09), §3.2.1, (10), p. 25; §3.2.2, Proposition 3.3 with proof, p. 26; [Bellaïche11](#ref-bellaiche11), Definition 3.4, p. 25; Proposition 3.6 and Lemma 3.7, pp. 27–28; Lemma 3.9, pp. 28–30; Theorem 3.10, p. 30; Corollary 3.12 and Definition 3.13, p. 32.

This uses §2.1; `ModularSymbolsPadicLFunctions`, §0.2; `ModularSymbolsPadicLFunctions`, §0.5; `ModularSymbolsPadicLFunctions`, §0.3; `LocallyAnalyticDistributions`, §4.1; `LocallyAnalyticDistributions`, §4.1.

### 2.3 Finite slope pieces of family modular symbols

For a slope-adapted analytic chart with the required property`(Pr)` and compact `U_p` inputs, Riesz theory gives a finite-projective Hecke-stable family-symbol summand of slope`≤ν`. At weight `w` its specialization is the global image `Symb^±_Γ(D_w)^{≤ν}_g`, defined as the image in the actual weight-`w` symbols. On nice charts it equals the full slope`≤ν` space except when `w=0`, the sign is negative and `ν≥1`, where the quotient is the one-dimensional `E₂` module. Compatible `U_p` links identify the bounded and dagger radius models on these finite-slope summands.

The chart is slope adapted and carries the Banach coefficient/symbol inputs specified above. Use the actual specialization exact sequence of family-modular-symbols. A full-symbol isomorphism is permitted only after excluding (`w=0`, sign`−`, `ν≥1`) or localizing away from the `E₂` eigensystem.

Riesz theory for compact operators on `(Pr)` modules (Coleman, Serre, Buzzard), from LocallyAnalyticDistributions Layer 4. Riesz base change gives the internal family fibre. The compact-support comparison of §2.2 identifies its image in actual weight-`w` symbols. The `E₂` cokernel has `U_p=p`, so survives precisely for `ν≥1` in the negative sign at weight 0. Use the global image `g` without silently identifying it with the full fibre. Radius independence follows from the link-and-companion relations `αc=cα=U_p^m` on appropriate radii: `U_p` is invertible on finite-slope pieces, so these links are isomorphisms there. Compact injectivity alone would not imply surjectivity.

The rank of the slope`-≤ν` family piece equals the dimension of its global-image fibre. The dimension of the entire actual-symbol fibre is larger by one in the stated exceptional case.

- `familySymbSlope`: `Symb^±_Γ(R ⊗̂ D)^{≤ν}` for an adapted pair `(W, ν)`.
- `familySymbSlope_projective`: It is finite projective over `R`.
- `familySymbSlope_specialise`: Specialization is the global-image space `Symb^±_Γ(D_w)^{≤ν}_g`; its quotient in actual symbols is `E₂` exactly at `(0,−,ν≥1)` on nice charts.
- `familySymbSlope_restrict`: Compatible with shrinking `W` and with increasing `ν`.

**Checks.**

- For an integral bounded coefficient model in which `U_p` preserves the unit ball, a factor selecting strictly negative slopes is zero. This is an extra integrality hypothesis, not a consequence of compactness.
- The family summand has locally constant rank on connected charts. At the exceptional weight 0 negative-sign fibre, its dimension is one less than the full-symbol slope`≤ν` dimension when `ν≥1`.
- At integer `k`, compare with the supplier’s actual weight-`k` slope space through the global-image injection. It is an isomorphism away from the stated `E₂` exception.
- The piece is projective but is not claimed free over `R`; over a non-principal affinoid algebra freeness can fail, and only the rank is constant.

See [Bellaïche09](#ref-bellaiche09), §3.2.2, after Proposition 3.3, and Corollary 3.4, p. 26; [Buzzard](#ref-buzzard), §2, Lemma 2.11, p. 19, and §3, Theorem 3.3, p. 24; [Bellaïche11](#ref-bellaiche11), §3.2.4, Proposition 3.11, Corollary 3.12 and Definition 3.13, pp. 31–32.

This uses §2.2; `LocallyAnalyticDistributions`, §§4.14–4.16; `LocallyAnalyticDistributions`, §§4.9 and 4.14; `LocallyAnalyticDistributions`, §4.16; `LocallyAnalyticDistributions`, §§4.2 and 4.15; §2a.6.

### 2.4 Local pieces of the modular-symbol eigencurve

On the cuspidal locus, these charts are the supplied `localHeckeChart` under §2.7a; the displayed image-algebra names specialize that carrier. The additional targets here are their global gluing and the boundary/global-image convention.

For a slope-adapted nice chart `W=Sp R` with `R` a one-dimensional principal ideal domain, let `𝕋^±_{W,ν}` be the `R`-subalgebra of `End_R(Symb^±_Γ(D(R))^{≤ν})` generated by `T_ℓ (ℓ∤Np)`, `U_p` and diamond operators. It is finite and torsion-free, hence flat over `R`; `C^±_{W,ν}=Sp 𝕋^±_{W,ν}` has a finite flat weight map. Its Hecke functions are bounded and `U_p` is invertible with valuation`≤ν`. At `w`, define `𝕋^±_{w,ν}` using the global-image subspace `Symb^±_Γ(D_w)^{≤ν}_g`, not the entire actual-symbol space; its geometric points are precisely the Hecke eigensystems in that subspace. Their extension uses the chartDescent construction in §2.2.

`(W, ν)` adapted; `W` one-dimensional and connected.

Finiteness: a subalgebra of the endomorphisms of a finite projective module over a noetherian ring. Torsion-freeness: it acts faithfully on a torsion-free module; flatness over the Dedekind ring `R` follows. This is §2a.8 in the modular instance, with the controlling operator `φ = U_p`.

`κ^±` is finite and flat, and the `ℚ̄_p`-points over `w` are the eigensystems of the fibre (with §2.5). All symbol-fibre and eigensystem comparisons use the global-image subspace; the exceptional `E₂` quotient is retained explicitly.

- `localEigencurveAlgebra`: `𝕋^±_{W,ν} ⊆ End_R(Symb^±_Γ(R ⊗̂ D)^{≤ν})`.
- `localEigencurveAlgebra_finite`: `𝕋^±_{W,ν}` is finite over `R`.
- `localEigencurveAlgebra_flat`: `𝕋^±_{W,ν}` is flat over `R`.
- `punctualEigencurveAlgebra`: `𝕋^±_{w,ν} ⊆ End(Symb^±_Γ(D_w)^{≤ν}_g)`.
- `punctualEigencurveAlgebra_points`: `ℚ̄_p`-points of `Spec 𝕋^±_{w,ν}` are the Hecke eigensystems in `Symb^±_Γ(D_w)^{≤ν}_g`.
- `localEigencurveAlgebra_hom_ext`: Two `R`-algebra maps from the Hecke-image algebra are equal when their values on all specified Hecke and diamond generators agree; relations are retained in the image algebra.

**Checks.**

- If `Symb^±_Γ(R ⊗̂ D)^{≤ν} = 0` the algebra is the zero ring and `C^±_{W,ν}` is empty.
- If the slope piece is free of rank one, `𝕋^±_{W,ν} = R` and `κ^±` is an isomorphism.
- At `w = k` and `ν < k + 1`, the punctual eigensystems are those of `Symb^±_Γ(V_k)^{≤ν}` (Stevens' control theorem). For `k=0`, `N=32`, `p=3` and `ν=0`, the CM form has `a₃=0` and both refinement slopes are `1/2`: they occur below 1 but not in this slope-zero piece.
- `𝕋^±_{w,ν}` can be non-reduced (a Jordan block for `U_p` at a critical point), so it is not the algebra of functions on a finite set of eigensystems.

See [Bellaïche09](#ref-bellaiche09), §3.4.1, Definition 3.15, pp. 31–32; §3.4.2, Definition 3.16, p. 32.

This uses §2.3; §2a.8; §2a.7.

### 2.5 Specialisation of Hecke algebras has nilpotent kernel

For `w∈W(ℚ_p)`, specialization gives a surjection `s_w:𝕋^±_{W,ν}⊗_{R,w}ℚ_p→𝕋^±_{w,ν}` with nilpotent kernel, where the target acts on the global-image slope subspace. Thus the geometric points of the weight fibre are the eigensystems in `Symb^±_Γ(D_w)^{≤ν}_g`. Localization at a geometric point gives the corresponding surjection of finite local residue-field algebras with nilpotent kernel. The family fibre algebra and the Hecke image of the specialized module need not be isomorphic. Use the full actual-symbol space only after excluding the exceptional `E₂` eigensystem.

`(W, ν)` adapted; `w ∈ W(ℚ_p)`. The specialization isomorphism with the global-image subspace in §2.3 is supplied; it does not identify the entire actual-symbol space at the exceptional weight.

Surjectivity: the image is a subalgebra of `𝕋^±_{w,ν}` containing the image of the Hecke operators. On a local free trivialization of the finite projective slope module, an element of the Hecke image whose specialized matrix is zero has all nonleading characteristic coefficients in the weight maximal ideal. Cayley–Hamilton shows that its image in the specialized Hecke algebra is nilpotent (Buzzard Lemma 5.10). The resulting nil ideal is nilpotent because the algebra is finite-dimensional. This requires identification with the global-image symbols `g`, as stated in the hypotheses; having the same semisimplification would be insufficient.

At a point where `κ^±` is étale and the generalised eigenspace is one-dimensional, `s_x` is an isomorphism `ℚ̄_p → ℚ̄_p`. All symbol-fibre and eigensystem comparisons use the global-image subspace; the exceptional `E₂` quotient is retained explicitly.

See [Bellaïche09](#ref-bellaiche09), §3.4.3, Lemma 3.17 and (19), pp. 32–33; [Buzzard](#ref-buzzard), Lemma 5.10, p. 42.

This uses §2.4; §2.3; §2a.17.

### 2.6 The eigencurves `C^±` from overconvergent modular symbols

Assume an admissible analytic coefficient-chart cover of all weight space with the property`(Pr)`, compact `U_p`, specialization and compatible radius links of family-slope-pieces. The eigenvariety machine glues `C^±_{W,ν}` to rigid curves `C^±` with weight maps `κ^±` and analytic Hecke functions, with `U_p` a unit. They are equidimensional of dimension one and the weight maps are locally finite and flat. For a complete extension `L/ℚ_p`, points over `w` are the finite-slope eigensystems in the global-image symbol space `Symb^±_Γ(D_w)_g⊗L`. On the source’s nice charts this is the full symbol space except for the negative-sign `E₂` quotient at weight 0. Construct the chart cover and its descent in §2.2 before gluing; the abstract machine supplies gluing only for those verified coefficient data.

`N` prime to `p`; weight space `𝒲` of continuous characters of `ℤ_p^×` (PadicMeasuresIwasawaAlgebras §3a.1).

Construct the local pieces (§2.4) and glue them along restriction and refinement (§2a.9 and §2a.12), the linked Banach modules being the family symbols for nested affinoids. Points: §2a.13 combined with §2.5. Equidimensionality and flatness: each local piece is finite flat over a one-dimensional affinoid, so every component has dimension one.

Every refined newform of slope `< k + 1` gives a point (§2.8), and the eigencurve is equidimensional of dimension one. All symbol-fibre and eigensystem comparisons use the global-image subspace; the exceptional `E₂` quotient is retained explicitly.

- `symbolEigencurve`: The rigid space `C^±` with `κ^± : C^± → 𝒲`.
- `symbolEigencurve_weight_flat`: `κ^±` is locally finite and flat.
- `symbolEigencurve_equidim`: `C^±` is equidimensional of dimension one.
- `symbolEigencurve_hecke`: `T_ℓ`, `U_p` and the diamond operators as analytic functions on `C^±`, with `U_p` a unit.
- `symbolEigencurve_points`: Points over `w` correspond to finite-slope Hecke eigensystems in the global-image symbol space `Symb^±_Γ(D_w)_g`.
- `symbolEigencurve_local`: Over an adapted `(W, ν)`, the subspace `{v_p(U_p) ≤ ν} ∩ (κ^±)⁻¹(W)` is `C^±_{W,ν}`.

**Checks.**

- A `p`-stabilised newform `f_β` of weight `k + 2` and level `Γ₁(N)` with `v_p(β) < k + 1` defines a point of `C^±` over `k` (with the sign condition for Eisenstein series).
- On the local piece over `(W, ν)`, the function `U_p` has valuation at most `ν`.
- Restricted to an adapted `(W, ν)`, `C^±` is `C^±_{W,ν}`.
- The construction supplies finiteness on adapted finite-slope charts. It supplies no uniform global slope bound: an infinite collection of nonempty slope blocks cannot be replaced by one finite weight algebra. In the degenerate case with no symbols the curve is empty, so an unconditional assertion that the weight map is never finite would also be wrong.

See [Bellaïche09](#ref-bellaiche09), §3 introduction and §3.4, pp. 22 and 31–33; [Buzzard](#ref-buzzard), Part II, §5, Construction 5.7 and Lemmas 5.8–5.10, pp. 40–42.

This uses §2.4; §2.5; §2a.9; §2a.12; §2a.13; §2a.14; `PadicMeasuresIwasawaAlgebras`, §3a.1 (The character space of `ℤ_pˣ` and its functions).

### 2.7 The coherent eigensymbol sheaf on `C^±`

The slope family-symbol modules glue, using the compatible links, to a coherent sheaf `𝓢^±` on `C^±`. It is torsion-free over weight space and its sections over `C^±_{W,ν}` are the slope family symbols. The local factor at `x` of its weight-specialized sections is the generalized eigenspace in `Symb^±_Γ(D_w)_g`. The residue fibre `𝓢^±⊗κ(x)` is the quotient of that local factor by its maximal ideal and may have smaller dimension. Evaluation and specialization are compatible sheaf maps. Local freeness is asserted only under the separate rank-one hypotheses; an eigenpacket does not specify an eigenvector. The global-image convention is essential at the exceptional `E₂` point.

As in §2.6.

Apply §2a.17 to the modular data; the fibre statement is §2.3 localised at `x` together with §2.5.

At a decent point of ramification index `e`, the generalized eigenspace in the weight fibre has dimension `e`, while the sheaf is locally free of rank one over the eigencurve by §3.7 and its residue fibre has dimension one. All symbol-fibre and eigensystem comparisons use the global-image subspace; the exceptional `E₂` quotient is retained explicitly.

- `eigensymbolSheaf`: `𝓢^±` on `C^±`.
- `eigensymbolSheaf_sections`: `𝓢^±(C^±_{W,ν}) = Symb^±_Γ(R ⊗̂ D)^{≤ν}`.
- `eigensymbolSheaf_weight_fibre`: The local factor at `x` of the weight fibre is `Symb^±_Γ(D_w)_g(x)`; this is distinct from the residue fibre `𝓢^±⊗κ(x)`.
- `eigensymbolSheaf_specialisation`: Compatible with `ρ_k : Symb(D_k) → Symb(V_k)` at integral weights.

**Checks.**

- At a non-critical, `κ`-étale classical point `x = f_β`, the fibre is one-dimensional over `ℚ̄_p`.
- At a decent critical point with ramification index `e>1`, the weight-fibre local factor has dimension `e`, while the eigencurve residue fibre has dimension one. A free rank-one module over `ℚ̄_p[t]/(t^e)` has exactly these two dimensions.
- Its support is `C^±`.
- Over the empty local piece the sections are zero.

See [Bellaïche09](#ref-bellaiche09), §3.4.2, p. 32, and §4.1, pp. 33–34.

This uses §2.6; §2a.17; §2.3; §2.5.

### 2.7a Comparison with cuspidal local charts

**Cuspidal local model comparison.** Near a cuspidal refined point with distinct Hecke roots, compare the global Banach-symbol model of §§2.1–2.7 with `ModularSymbolsPadicLFunctions` §3.0’s projective Banach complex. Construct `familySymb_localComparison` from their common finite Manin resolution, coefficient pairings and bounded radius links. On every common adapted factor, prove a Hecke-equivariant quasi-isomorphism of the finite-slope complexes. Under the supplier’s cuspidal concentration and fibre concentration hypotheses, its degree-zero map identifies the actual finite projective symbol modules, with all coefficient-specialization maps. Therefore their faithful Hecke-image algebras, local charts and coherent eigensymbol modules agree, including their nilpotents. Prove overlap compatibility and independence of the adapted factor and coefficient radius. The involution and opposite-monoid adapters use the sign dictionary in Layer 3; do not obtain a module comparison merely from equality of point sets. Sources: [Bellaïche09](#ref-bellaiche09), §§3.2–3.4, pp. 25–33; [Bellaïche11](#ref-bellaiche11), §§3.2.4–3.4; the common finite-slope complex and concentration theorem are supplied by `ModularSymbolsPadicLFunctions`, §3.0.

**Checks.**

- At a small-slope cuspidal point the comparison specializes to the supplier’s polynomial-moment identification with the same sign.
- Over `E[t]/(t²)` it identifies the length-two module and Hecke action, not just the single eigenpacket or its socle.
- At weight zero the negative-sign `E₂` quotient is boundary support and is excluded by the cuspidal localization. Without that localization the exceptional quotient of §2.2 remains.

*Needs:* §§2.1–2.7; `ModularSymbolsPadicLFunctions`, §3.0 (Projective Banach model for signed symbols; Local analytic Hecke charts); `LocallyAnalyticDistributions`, §§4.15–4.16.

### 2.8 Classicality of small-slope points of the eigencurve

Let `x` be a point of `C^±` over an integral weight `k ≥ 0` with `v_p(U_p(x)) < k + 1`. Then the specialisation `ρ*_k : Symb^±_Γ(D_k) → Symb^±_Γ(V_k)` restricts to an isomorphism of generalised eigenspaces at `x`, `Symb^±_Γ(D_k)(x) ≅ Symb^±_Γ(V_k)(x)`, and `x` is the eigensystem of a classical `p`-stabilised form of weight `k + 2` and level `Γ` (cuspidal, or an Eisenstein series of the sign of the `±` part). Classical points of slope `< k + 1` are Zariski dense in every component of `C^±`, and accumulate at every classical point of small slope.

`x` over `k ∈ ℤ_{≥0}`; slope strictly less than `k + 1`.

Stevens' control theorem (ModularSymbolsPadicLFunctions Layer 2) gives the isomorphism on slope-`<k+1` parts; restrict to the `x`-generalised eigenspace (§2.7). Eichler–Shimura (ModularSymbolsPadicLFunctions Layer 0) identifies `Symb^±_Γ(V_k)` with weight-`(k + 2)` forms of level `Γ`, so `x` is classical. Density on a central nice chart follows because integers `k` in its weight component with `k+1>ν` are Zariski dense, and every component of the finite-flat chart dominates `W`. For all of weight space construct `familySymb_finiteCharacterControl`: at a locally algebraic character `χz^k` identify the finite-slope global-image fibre with the corresponding `χ`-isotypical classical symbol space at level `Np^r`, where `r` is the conductor of `χ`, under the same strict bound `ν<k+1`. Construct the finite-character twists and trace-compatible radius links, and prove this control by the single-weight moment exact sequence on those conductor-level charts. Construct `symbolEigencurve_classicalDensity` using §2a.14’s global component-image theorem. Each global irreducible component maps finitely onto a spectral component whose weight image is Zariski open in its weight disc. This image meets the central integer-weight locus: a proper closed analytic subset of a disc cannot contain a sequence of integer weights accumulating inside the disc. Above such an integer choose an adapted finite-slope chart meeting the component, and a local branch dominating a central neighbourhood, with a fixed slope bound `ν`. The arbitrarily large nonnegative integers approaching that weight satisfy `ν<k+1` and are Zariski dense on this branch by finite flatness and control. The identity principle on the reduced irreducible global component propagates this density from that nonempty open branch to the whole component. Thus density on every refined affinoid is not required. Retain the finite-character control for the conductor-level classical fibres; it is not a proof of arithmetic density on arbitrary affinoids.

**Checks for global classical density.**

- At `p=5`, let `a^5=6` and `L=ℚ₅(a)`. The disc `|u−a|≤5⁻²`, `u=κ(6)`, has `v₅(log u)=0`, since `log a=log 6/5` and `v₅(u−a)≥2`. Locally algebraic weights instead have `log u=k log 6`, of valuation at least 1 or zero logarithm. This affinoid contains no arithmetic points.
- A global component still meets a central chart by its Zariski-open weight image; its intersections with arbitrary small affinoids need not contain classical points.
- On a central chart of slope bound `ν`, a sequence of arbitrarily large integers converging to its centre eventually satisfies `ν<k+1`; holding a single small weight fixed would not ensure classicality of all slopes.

The slope bound is strict: at slope exactly `k + 1` (critical slope) `ρ*_k` need not be injective on the eigenspace; that case is PadicFamilies L3.

See [Bellaïche09](#ref-bellaiche09), §3.2.3, Theorem 3.5, Proposition 3.6 and Corollary 3.7, pp. 26–28.

The global density proof is [Chenevier](#ref-chenevier), Corollary 6.4.4 and Proposition 6.4.6, pp. 54–55, applied to the component theorem of §2a.14.

This uses §2.7; §2.6; §2a.14; `ModularSymbolsPadicLFunctions`, §2.4; `ModularSymbolsPadicLFunctions`, §2.3; `ModularSymbolsPadicLFunctions`, §0.7.

### 2.9 Freeness of family symbols at étale non-critical points

For cuspidal points this is the transport of the local eigenmodule and multiplicity theorem of `ModularSymbolsPadicLFunctions`, §3.0, through §2.7a; its assertion here fixes the global sheaf identification.

Let `x ∈ C^±` lie over an integral weight `k` with slope `< k + 1`, corresponding to a refined newform `f_β` whose generalised eigenspace `Symb^±_Γ(V_k)(f_β)` is one-dimensional, and assume `κ^±` is étale at `x`. Then the localisation of `𝓢^±` at `x` is free of rank one over the local ring `O_{C^±,x}`, and the weight map induces an isomorphism of the geometric henselian local rings at `x` and `k` (or of their completions); consequently, after shrinking, there is a neighbourhood `V` of `x` and a family symbol `Φ ∈ 𝓢^±(V)` whose specialisation at every nearby classical étale newform point `y ∈ V` is a generator of its one-dimensional eigenline. This is the local freeness hypothesis required to form scalar-valued families of `p`-adic L-functions.

`x` classical of slope `< k + 1`; newform eigenspace of dimension one; `κ^±` étale at `x`.

The fibre of `𝓢^±` at `x` is `Symb^±_Γ(D_k)(x) ≅ Symb^±_Γ(V_k)(x)` (§2.8), of dimension one. At the geometric point, étaleness identifies the henselian local branch with the geometric weight `DVR`. The family module is finite and torsion-free over that `DVR`, hence free; its one-dimensional weight fibre gives rank one by Nakayama. Ordinary unhenselized local rings need not be literally equal under an étale map. A generator over a neighbourhood specialises to a nonzero element of each one-dimensional classical eigenline nearby (the eigenspaces are one-dimensional at nearby classical newform points).

This is a noncritical sufficient criterion. At a decent critical point, rank-one freeness over the eigencurve still holds by §3.7; its weight-fibre dimension is `e`, not its residue-fibre dimension.

See [Bellaïche09](#ref-bellaiche09), §4.1, pp. 33–34.

This uses §2.7; §2.8; `ModularSymbolsPadicLFunctions`, §0.7.

### 2.10 Comparison with the Coleman–Mazur–Buzzard eigencurve

Let `C` be the overconvergent-forms eigencurve of tame level `Γ₁(N)`, with cuspidal closed subspace `C⁰`. After constructing the elliptic overconvergent-forms and comparison targets below, the adapted pieces have canonical Hecke-compatible closed immersions `C⁰_{W,ν}→C^±_{W,ν}→C_{W,ν}`. At integral `k≥0`, the semisimplified slope modules satisfy `S†_{k+2}(Γ)^{ss}_{≤ν}⊆(Symb^±_Γ(D_k)_g)^{ss}_{≤ν}⊆M†_{k+2}(Γ)^{ss}_{≤ν}`. For a cuspidal refined form the generalized eigenspaces in cuspidal forms and symbols have the same dimension. The middle module is the global image: the full negative-sign weight 0 symbol module has an extra `E₂` quotient that cannot be inserted into this comparison.

`N` prime to `p`; the overconvergent-forms eigencurve `C` as constructed by Coleman–Mazur `(N = 1, p > 2)` and Buzzard (general `N`).

Chenevier's comparison theorem for eigenvarieties: two reduced equidimensional eigenvarieties over `𝒲` whose classical structures (Zariski-dense sets of classical points with the same Hecke eigensystems) correspond are related by closed immersions. The classical structures match by Coleman's control theorem on overconvergent forms and Stevens' control theorem with Eichler–Shimura on symbols (§2.8).

Construct `ellipticColemanForms`: Banach modules of elliptic modular forms on strict ordinary neighbourhoods at tame level `N`, their radius restrictions and compact `U_p` links, the `q`-expansion injection, completed weight scalar extension, and the slope-`<k+1` classicality theorem. These are additional analytic targets over the elliptic modular curves of ModularCurvesPartII and the Banach APIs of LocallyAnalyticDistributions; their source route is Bellaïche §2.1 and Coleman’s control theorem recalled there. Construct `eigenvariety_classicalComparison` in the form used in Bellaïche11 Theorem 3.27: for finite projective Hecke modules, injections of semisimplifications at a Zariski-dense classical set interpolate to injections at every fibre and closed immersions of the reduced Hecke-image spaces. Prove reducedness separately from classical semisimplicity and the torsion-free faithful family action. This supplies the actual closed immersions here, since the three family eigencurves are reduced. It does not identify nonreduced punctual Hecke algebras from point sets. For a cuspidal refined form use the two symbol signs and the equality of cuspidal local components to prove equality of generalized-eigenspace dimensions, as in Theorem 3.27(iv). For global comparison prove `eigenvariety_classicalComparison_global` by the Fredholm interpolation argument: take the positive integer weights in each tame component. This set is Zariski dense in its whole weight disc and in every irreducible affinoid neighbourhood of any one of its points. The latter assertion is a condition at these weights, not an assertion that every affinoid contains one. For each fixed slope bound, small-slope control fails at only finitely many of these weights. For every element `h` of the abstract Hecke algebra, form the compact operator `hU_p` and its global Fredholm series, with compatible radius links. On each prime spectral component use the component-image argument of §2.8 to choose a central adapted block. There `U_p` has bounded slope, so classical control gives the required inclusion of Hecke semisimplifications and the divisibility of the corresponding Fredholm factors. The rigid identity principle and prime-Fredholm factorization extend this divisibility globally; determine multiplicities on central fibres avoiding intersections of distinct prime factors. Apply this argument for all `h` to recover the compatible quotients of reduced Hecke-image algebras on every spectral block, and glue by their Hecke generators. The same proof for equal factors gives the cuspidal comparison. This extends algebraic Hecke relations to affinoids without arithmetic points. Sources: [Chenevier](#ref-chenevier), Corollary 6.4.4 and Proposition 6.4.6, pp. 54–55 (component images and density); Chenevier, [*Une correspondance de Jacquet-Langlands p-adique*](https://arxiv.org/pdf/math/0301032v1), §4.4, Proposition 4.5, pp. 13–14, and §6.1, Proposition 6.2 and Theorem 6.3, pp. 17–19 (Fredholm interpolation and recovery of the reduced Hecke spaces); [Bellaïche11](#ref-bellaiche11), Theorem 3.27 and proof, pp. 38–40 (the inclusion variant for forms and symbols). The exceptional negative-sign weight-zero quotient is retained throughout.

- `ellipticColemanForms`: the weight-character Banach module at an admissible ordinary radius, with its bounded Hecke action.
- `ellipticColemanForms_qExpansion_injective`: the expansion at all chosen cusps determines the section.
- `ellipticColemanForms_restrict`: restriction and its `U_p` companion satisfy the link identities; completed scalar extension commutes with these maps.
- `ellipticColemanForms_classical`: at algebraic weight `k+2` and conductor `p^r`, the slope-`<k+1` subspace is the classical space at that conductor.
- `eigenvariety_classicalComparison`: the compatible Hecke quotient gives the closed immersion of reduced spaces described above.

**Checks for the forms and comparison constructions.**

- The disc `|κ(6)−a|≤5⁻²` with `a^5=6` has no arithmetic points; the comparison on it is the restriction of the globally continued Hecke quotient.
- A normalized classical ordinary eigenform gives its original `q`-expansion in the radius module and the spectral coordinate `a_p⁻¹`.
- At slope exactly `k+1`, the strict classicality theorem supplies no surjectivity; a `θ`-image must remain possible.
- A character of conductor `p^r` requires the corresponding level; replacing it by level `Np` loses classical eigenforms.
- The algebras `E` and `E[ε]/(ε²)` have identical geometric points but different generalized eigenspaces, so point correspondence alone cannot identify nonreduced Hecke algebras.

See [Bellaïche09](#ref-bellaiche09), §2.1, pp. 13–17; §3.4.4, Proposition 3.18 with proof, p. 33; [Bellaïche11](#ref-bellaiche11), §3.4.4, Theorem 3.27(ii)–(iv) and proof route, pp. 38–40.

This uses §2.6; §2.8; §2a.14.

### Examples

On a central exponential chart the weight `κ=0` specializes to the trivial character and the distribution action has factor 1; at `κ=k≥0` it becomes `(a+cz)^k`. Evaluation at `z=T` with coefficients in `E⟨T⟩` is a continuous `E⟨T⟩`-valued functional, but it need not lie in the completed scalar extension of the E-valued distribution module. This distinguishes the family module used here from the full scalar-extended dual.

At a classical weight `k` and slope `ν<k+1`, moment specialization identifies the corresponding distribution symbols with polynomial symbols. Equality `ν=k+1` is excluded by the strict bound. In weight 0, the sign-minus `E₂` quotient begins at slope 1: a slope 0 comparison avoids it, while a claim covering every slope 1 generalized eigenspace without the quotient is false. On a chart with a smooth étale newform point the coherent module has a local generator, but only nearby classical étale newform points are asserted to specialize to one-dimensional classical eigensymbol lines.

### Dependencies

Layer 2a supplies the general finite-slope machine. `LocallyAnalyticDistributions`, Layers 0–4, and `ModularSymbolsPadicLFunctions`, Layers 0–2 and §3.0, supply the single-weight input and the cuspidal local family suite. Section 2.7a compares that suite with the global model. The family chart/Manin presentation, compact links, finite-character classicality and density are targets in this layer; they establish the machine’s hypotheses on every required chart. The elliptic overconvergent-form and classical-comparison targets of §2.10 provide the second eigencurve realization. Classical elliptic geometry comes from `ModularCurvesPartII`, §§3–5, 7, 13–17; no higher-dimensional canonical-subgroup input is used.

## Layer 3: Critical refinements and critical `p`-adic L-functions

**Standing conventions.** Signs use the supplier’s `ι=diag(−1,1)`. At polynomial degree `k`, a sign `s` here corresponds to Bellaïche’s sign `s_B=s(−1)^k`; write `ε(f_β)=(−1)^k ε_B(f_β)` in every Eisenstein sign and period formula below. At a family weight `κ`, the conversion is `s_B=sκ(−1)`, constant on its weight component. Every statement of this layer keeps the standing conventions of Layer 2: the analytic chart construction of §2.1, the Banach and descent targets of §2.2 and the global-image fibre convention of §2.3. Throughout Layer 3, the Eisenstein assertions require, in weight two, `χ₁χ₂⁻¹ ≠ χ_cyc`, where `χ_cyc` has Hodge–Tate weight −1 and `χ₁,χ₂` are ordered as in §3.0. This excludes primitive `E₂(χ,χ)` and the exceptional `E₂`-derived forms; it is retained in every dependent preferred-representation, criticality, decency and smoothness assertion.

### 3.0 Preferred Eisenstein representations

For a genuine primitive Eisenstein newform `f` of weight `k+2≥2`, tame level `N` prime to `p`, and distinct roots `α,β`, subject to the noncyclotomic-ratio hypothesis of the Layer 3 standing conventions, take its two classical Galois characters `χ₁,χ₂`, ordered with Hodge–Tate weights 0 and `k+1` in Bellaïche’s convention. Construct `eisensteinCharacterSelmer`: the global Bloch–Kato extension spaces, unramified outside `Np`, crystalline at `p` and with finite local condition at every `ℓ≠p`, satisfy `dim Ext¹_f(χ₂,χ₁)=1` and `Ext¹_f(χ₁,χ₂)=0`. Prove this character-Selmer calculation using the Dirichlet-character Bloch–Kato calculation in the proof of [Bellaïche09](#ref-bellaiche09), Lemma 2.11, pp. 17–18 (the Soulé character calculation); it is a target here over the cochains and finite local conditions of `SelmerIwasawaCohomology`, §§2.2 and 4.9–4.12. In weight two the finite-everywhere dimension calculation requires `χ₁χ₂⁻¹ ≠ χ_cyc`; primitive level alone does not imply this condition. No dimension formula is asserted for arbitrary character pairs.

Construct `preferredEisensteinRepresentation` as the extension `0→χ₁→ρ_f→χ₂→0` associated to a nonzero class. Prove existence, global nonsplitting and uniqueness up to isomorphism, since all nonzero classes in the one-dimensional extension space differ by rescaling the subcharacter. Identify its good-prime traces, determinant, ramification, crystalline realization and its two Frobenius eigenlines. Local splitting at `p` is a separate property. Use this representation in §§3.1–3.5, while the semisimple classical attachment remains the sum `χ₁⊕χ₂`. Both targets have source [Bellaïche09](#ref-bellaiche09), Lemma 2.11 and proof, pp. 17–18.

**Checks for the character calculation.**

- Reversing `χ₁` and `χ₂` reverses the dimensions 1 and 0; it cannot give two independent nonsplit crystalline extensions.
- A nonzero scalar multiple of the extension class gives an isomorphic middle representation, although it changes an extension with fixed end identifications.
- Let `χ` be the primitive quadratic character modulo 3. The primitive `E₂(χ,χ)` of level 9 at `p=5` has roots −1 and −5 and ratio `χ₁χ₂⁻¹=χ_cyc`. Its finite extension group twists to `H¹_f(ℚ,ℚ₅(1))=ℤ^×⊗ℚ₅=0` by Kummer theory; it is excluded despite being primitive. The formal level-one `E₂` and the weight-two `E₂`-derived forms are excluded as well.

**Checks for the preferred representation.**

- The zero class gives the globally split sum and fails indecomposability despite having the same traces.
- At each good prime `ℓ`, its trace is `χ₁(Frob_ℓ)+χ₂(Frob_ℓ)=a_ℓ(f)` and its determinant is their product; these identities alone do not determine the extension.
- Distinct `α,β` give two different Frobenius lines. Their existence does not split the filtered crystalline representation, and global nonsplitting does not preclude local splitting.

This uses `AlgebraicModularFormsAndSerreWeights`, §R15.5A.2; `SelmerIwasawaCohomology`, §§2.2 and 4.9–4.12; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.P2–R07.P5.

### 3.1 Critical-slope, critical and `θ`-critical refinements

For cuspidal forms use the supplied criticality and theta-criticality predicates of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a and the forms comparison of §2.10. The predicates below extend those carriers to the stated Eisenstein domain.

Let `f` be a newform (cuspidal or Eisenstein) of weight `k + 2` and level `Γ₁(N)`, `p ∤ N`, with Hecke polynomial `X² − a_pX + ε(p)p^{k+1}` having distinct roots `α`, `β`. The refinement `f_β` (the `p`-stabilisation with `U_p`-eigenvalue `β`) has critical slope if `v_p(β) = k + 1`; it is critical if the equivalent conditions of §3.2 hold (non-classical overconvergent generalised eigenforms, equivalently the eigencurve is not étale over weight space at `f_β`, equivalently `ρ_f|_{D_p}` is split with `β` on the weight-filtration line); it is `θ`-critical if `f_β` lies in the image of `θ^{k+1} : M†_{−k} → M†_{k+2}`. Critical implies critical slope; for cuspidal `f`, critical `⇔ θ`-critical.

`k≥0`; `p∤N`; `α≠β`; for Eisenstein forms in weight two, `χ₁χ₂⁻¹ ≠ χ_cyc`. The preferred representation is crystalline at `p`, supplied by the classical attachment for cuspidal forms and by `preferredEisensteinRepresentation` of §3.0 for Eisenstein forms, and is globally indecomposable in the Eisenstein case; its restriction to `D_p` may split.

Record the three notions separately: slope (valuation), criticality (local Galois/eigencurve geometry), `θ`-criticality (image of `θ^{k+1}` on overconvergent forms).

Keep 'slope `k+`1', '`θ`-critical' and 'critical refinement' distinct. The critical one-variable symbol theory uses precisely these distinctions.

- `IsCriticalSlope`: `v_p(β) = k + 1`.
- `IsCriticalRefinement`: strict inclusion of the classical generalized eigenspace in the overconvergent one; §3.2 proves the other characterizations.
- `IsThetaCritical`: `f_β ∈ θ^{k+1}(M†_{−k})`.
- `IsCriticalRefinement.isCriticalSlope`: Critical `⇒` critical slope.

**Checks.**

- `f` ordinary `(v_p(a_p) = 0)`: its non-ordinary refinement has critical slope.
- `f =` the weight-2 form of `X₀(32)` (CM by `ℚ(i)`), `p = 5` split: the critical-slope refinement is critical and `θ`-critical.
- `a_p = 0` (supersingular): both refinements have slope `(k + 1)/2`, neither is of critical slope.

See [Bellaïche09](#ref-bellaiche09), §2.2.2, p. 18 (arXiv v1 PDF; printed page = PDF page); [Bellaïche09](#ref-bellaiche09), §2.2.2, Definition 2.13, p. 19 (arXiv v1 PDF; printed page = PDF page).

This uses §3.0; `ModularSymbolsPadicLFunctions`, §2.1; `ModularSymbolsPadicLFunctions`, §1.3; §2.6.

### 3.2 Equivalent forms of criticality

The cuspidal criticality classification and its companion input are supplied by `ModularSymbolsPadicLFunctions`, §3.0. Here `criticalBoundary_coleman` and `criticalSplit_breuilEmerton` denote their specializations under §2.7a; the additional boundary theorem is the Eisenstein extension described below.

For a refined form `f_β` the following are equivalent: `(i) M_{k+2}(Γ)(f_β) ⊊ M†_{k+2}(Γ)(f_β)` (non-classical generalised eigenforms); `(i′) dim M†_{k+2}(Γ)(f_β) ≥ 2`; (ii) `v_p(β) > 0` and the eigencurve `C` is not étale over weight space at `x = f_β`; (iii) `v_p(β) > 0` and `ρ_f|_{D_p}` is a direct sum of two characters; (iv) the `β`-line of `D_cris(ρ_f|_{D_p})` equals the weight-filtration line. Then `v_p(β) = k + 1`. For cuspidal `f` these are equivalent to `(v) θ`-criticality; for Eisenstein `f` with `v_p(β)>0`, `(v)` holds. The ordinary Eisenstein refinement is not theta-critical.

`f` is a cuspidal or Eisenstein newform of weight `k+2≥2` and tame level `N` prime to `p`, with distinct Hecke roots `α`,`β`; use the preferred representation of §3.1, retaining the weight-two noncyclotomic-ratio hypothesis for Eisenstein forms. The equivalence with a split `D_p`-restriction includes the condition `v_p(β)>0`. The three boundary theorems below are prerequisite targets of this section and are proved before assembling these equivalences.

`(i) ⇔ (i′) ⇔` (ii): Bellaïche Lemma 2.9 (étaleness of the weight map at `x` versus the dimension of the generalised eigenspace of overconvergent forms). (iii) `⇔` (iv): weak admissibility of `D_cris`. `(v)`: at `v_p(β)=k+1`, Coleman's boundary control theorem identifies `coker θ^{k+1}` on the generalised eigenspace with `S_{k+2}(Γ)(x)`. At smaller cuspidal slopes use the small-slope control of §2.8.

Construct the following inputs with `k≥0`, `p∤N`, a genuine primitive newform and distinct crystalline Hecke roots, as above.

- `criticalBoundary_coleman`: assuming `v_p(β)=k+1`, on the generalized `f_β` eigenspace, the cokernel of `θ^{k+1}:M†_{−k}→M†_{k+2}` is the classical cuspidal generalized eigenspace. Retain the Hecke covariance, including the `ℓ^{k+1}` and `p^{k+1}` twists. Source: Coleman, *Classical and overconvergent modular forms*, Invent. Math. 124 (1996), Theorem 7.2 and Corollary 7.2.2, pp. 233–234 ([author copy](https://www.wstein.org/people/coleman/papers/classical_and_overconvergent_forms.pdf)); the tame-level application is [Bellaïche09](#ref-bellaiche09), Proposition 2.12, pp. 18–19.
- `criticalSplit_breuilEmerton`: for cuspidal ordinary `f`, its unique critical-slope refinement is in the image of `θ^{k+1}` exactly when the crystalline `ρ_f|_{D_p}` splits. Source: Breuil–Emerton, *Représentations p-adiques ordinaires de GL₂(ℚ_p) et compatibilité local-global*, [author copy](https://www.math.uchicago.edu/~emerton/pdffiles/ordinary.pdf), Theorem 1.1.3, p. 4, §§4–5 (the result cited as Theorem 2 in Bellaïche’s version). The construction includes the companion overconvergent form of weight `−k` and the local-global comparison yielding it; transport the source’s dual Galois convention before comparing splitness.
- `criticalEisenstein_bellaicheChenevier`: for a primitive Eisenstein `f` satisfying the weight-two noncyclotomic-ratio hypothesis and `v_p(β)>0`, the generalized overconvergent eigenspace has dimension greater than one exactly when the preferred representation of §3.0 splits at `p`. Source: Bellaïche–Chenevier, *Lissité de la courbe de Hecke de GL₂ aux points Eisenstein critiques*, [arXiv:math/0405415v2](https://arxiv.org/pdf/math/0405415v2), Theorem 3, §6.2, p. 13, with the reducibility-ideal calculation of Theorems 1–2; the primitive tame-level extension uses Lemma 2.9 in place of their Proposition 1(b), as explained in [Bellaïche09](#ref-bellaiche09), Remark 2.10, p. 17. Construct that extension with the finite character, not just the tame-level-one case.

**Checks for Coleman’s boundary theorem.**

- At a cuspidal primitive eigensystem of slope `k+1`, the classical quotient has dimension one and the theta image has codimension one. At smaller cuspidal slopes the small-slope comparison applies.
- At an Eisenstein eigensystem of slope `k+1`, the classical cuspidal quotient is zero, so theta is surjective on the generalized eigenspace. At `p=5`, the ordinary weight-four Eisenstein refinement instead has eigenvalue 1 and constant term −31/60; every theta-cube image has zero constant term, so this refinement is not theta-critical.
- In degree `k=0`, theta is first differentiation and multiplies `U_p` eigenvalues by `p`; forgetting the twist would leave the slope unchanged.

**Checks for the split/companion theorem.**

- The CM form of `X₀(32)` at `p=5` has split local representation and a weight-zero companion for its slope-one refinement.
- The unit-root refinement of an ordinary cuspidal form cannot be in the theta image: that image has slope at least `k+1`.
- A cuspidal ordinary form with nonsplit crystalline local representation has no companion for its critical-slope refinement. A valuation test alone cannot establish splitness.

**Checks for the Eisenstein theorem.**

- If the preferred local extension splits, the positive-slope point is ramified over weight space and the generalized eigenspace has dimension at least two.
- If that local extension is nonsplit, the positive-slope point is étale and the generalized eigenspace is one-dimensional, although its eigenform is theta-critical.
- The semisimple sum splits at every place and would wrongly predict ramification in the preceding nonsplit case; the representation of §3.0 is essential.

See [Bellaïche09](#ref-bellaiche09), §2.2.2, Proposition 2.12, p. 18 (arXiv v1 PDF; printed page = PDF page).

This uses §3.1; §2.8; §2.10; `ModularSymbolsPadicLFunctions`, §2.4.

### 3.3 Which newforms have critical-slope refinements

A newform `f` has a refinement of critical slope iff `(a) f` is cuspidal, not CM and ordinary at `p`; `(b) f` is cuspidal CM by `K` with `p` split in `K`; or `(c) f` is Eisenstein; the critical-slope refinement is then unique. In case `(b)` it is critical (hence `θ`-critical); in case `(c)` it is `θ`-critical, and non-critical when `p` is regular; in case `(a)` non-criticality is conjectural.

`v_p(α) + v_p(β) = k + 1`.

`v_p(β) = k + 1` forces `v_p(α) = 0`, i.e. `f` ordinary; for CM forms this means `p` split. CM: `ρ_f|_{D_p}` is a sum of two characters, so (iii) holds.

Test on `X₀(32)` (CM, `p ≡ 1 mod 4`) and on the weight-four level-one Eisenstein series at `p=5`, whose roots 1 and 125 select a unique critical-slope refinement. In weight two retain `χ₁χ₂⁻¹ ≠ χ_cyc`; the level-11 `E₂`-derived form is excluded.

See [Bellaïche09](#ref-bellaiche09), §2.2.3, Proposition 2.14, p. 19 (arXiv v1 PDF; printed page = PDF page).

This uses §3.2.

### 3.4 Decent refinements

`f_β` is decent, under the Layer 3 standing hypotheses (including the weight-two noncyclotomic-ratio condition), if `(i) f` is Eisenstein, or (ii) `f_β` is non-critical, or (iii) `f` is cuspidal and satisfies the supplied `IsDecentRefinement`, whose Selmer alternative is `H¹_g(ℚ,ad ρ_f)=0`. Sufficient conditions for (iii) (Proposition 2.15): `ρ̄_f|_{G_L}` absolutely irreducible for every quadratic extension `L/ℚ` contained in `ℚ(ζ_{p³})`; or `ρ̄_f` reducible with characters distinct on `G_{ℚ(ζ_{p^∞})}`; or `f` non-CM and cuspidal/special at all primes dividing `N`; or `f` CM.

For cuspidal forms, `IsDecent` is an alias of `ModularSymbolsPadicLFunctions` §3.0’s `IsDecentRefinement`; the Eisenstein alternative extends it. Both global Selmer conditions impose unramified conditions away from `p`; at `p`, `f` is the crystalline kernel and `g` the de Rham kernel. Prove `decentAdjoint_f_eq_g` for every cuspidal newform of weight `k+2≥2`, `p∤N`: the adjoint is crystalline and `D_cris((ad ρ_f)^∨(1))^{φ=1}=0`, hence the local finite and de Rham kernels agree. The crystalline Frobenius eigenvalues of the adjoint are 1 (twice) and the ratios of the two pure weight-`k+1` roots; their complex absolute values are 1. After dualizing and twisting by 1 none can be 1, since that would require a Frobenius eigenvalue of `(ad ρ_f)^∨` of complex absolute value `p`. Choose an auxiliary coefficient prime different from `p` and use `WeightsInEtaleCohomology`, R34.6 (Eigenform purity), for the complex absolute values of the Hecke polynomial at `p`; the supplied good-`p` crystalline comparison identifies this same polynomial with the one used here. This proves the required vanishing and the global equality. Dualizing the classical attachment does not change its adjoint. Sources: [Bellaïche09](#ref-bellaiche09), Proposition 2.15 and proof of Theorem 2.16, pp. 20–22; the Bloch–Kato fundamental period sequences in `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.P3, and local-condition comparison of `SelmerIwasawaCohomology`, §§4.9–4.12. Apply the stated finite-Selmer criteria only through this comparison.

Record the three alternatives; the listed criteria are cited results.

Every CM form is decent; cuspidal non-CM forms are conjecturally doubly decent.

- `IsDecent`: on cuspidal refinements the supplied `IsDecentRefinement`; on the stated Eisenstein domain, true. The finite-Selmer formulation is equivalent by `decentAdjoint_f_eq_g`.
- `isDecent_of_nonCritical`: Non-critical refinements are decent.
- `isDecent_of_CM`: CM forms are decent (Rubin).
- `isDecent_of_squarefree`: Non-CM forms of squarefree level with trivial character are decent.

**Checks.**

- The CM form of `X₀(32)` is decent by the supplier’s CM adjoint-Selmer theorem and the shared predicate.
- The scalar summand of `ad ρ_f` has dual Tate twist `E(1)` with `φ=p⁻¹`, so it introduces no `φ=1` exception to `decentAdjoint_f_eq_g`.
- A general crystalline representation with `D_cris(V^∨(1))^{φ=1}≠0` is outside this comparison; crystalline coefficients alone do not imply equality of the two kernels.
- Every Eisenstein refinement satisfying the standing noncyclotomic-ratio hypothesis is decent (condition `(i)`).
- The form of 11a1 is decent at every `p ∤ 11` (squarefree level, trivial character).

See [Bellaïche09](#ref-bellaiche09), §1.4.1, Definition 1, p. 5 (arXiv v1 PDF; printed page = PDF page); [Bellaïche09](#ref-bellaiche09), §2.2.4, Proposition 2.15, p. 20 (arXiv v1 PDF; printed page = PDF page).

This uses §3.1; `ModularSymbolsPadicLFunctions`, §3.0; `WeightsInEtaleCohomology`, R34.6 (Eigenform purity); `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.P3; `SelmerIwasawaCohomology`, §§2.2 and 4.9–4.12; `ArithmeticGaloisDuality`, §R02.4 (local duality and Euler characteristic).

### 3.4a Finite-slope periods and refined characteristic-zero deformations

Construct `eigencurvePseudocharacter` on the reduced Coleman–Mazur–Buzzard eigencurve of §2.10: a continuous two-dimensional pseudocharacter unramified outside `Np`, with good-prime trace `T_ℓ` and the classical determinant. Use the classical Galois attachments, accumulating classical eigensystems and determinant interpolation, verifying the common congruence witnesses in an integral model before passing to affinoid coefficients. Near an irreducible cuspidal classical point `x`, reconstruct a rank-two representation over the completed local ring `T_x`, with residue representation `ρ_f`; normalize one Sen weight to zero. Sources: Coleman–Mazur, *The eigencurve*, §5.1 (the Galois pseudocharacter); [Bellaïche09](#ref-bellaiche09), proof of Theorem 2.16, p. 21; `IntegralHeckeAndGaloisDeterminants`, §§1.3 and 4.2 (reconstruction and quantified interpolation).

For cuspidal `f_β` of weight `k+2≥2`, `p∤N` and distinct roots, `refinedCrystallinePeriod`, `refinedDeformationRepresentable` and `refinedTangent_selmer` are the transported finite-slope period, refined-deformation and tangent statements of `ModularSymbolsPadicLFunctions`, §3.0 (Galois and crystalline-period adapter). Identify its completed local Hecke algebra and its Artinian quotients with those of §2.10 by §2.7a. Use its dual arithmetic attachment `ρ=ρ_ar^∨`, with Hodge–Tate weights 0 and `k+1` and crystalline polynomial `X²−a_pX+ε(p)p^{k+1}`. The local restriction of the global pseudocharacter must be dualized to this convention before comparing representations, periods or tangent classes. Uniqueness of irreducible reconstruction supplies this identification, with the adjoint carried by transpose-dual. Its Artinian period assertion, constant zero Sen weight, tame inertial constraints and refined tangent map are imported on these same carriers. Section 3.4’s equality `H¹_f=H¹_g` matches the supplied decency hypothesis to the tangent calculation. Sources: [Bellaïche09](#ref-bellaiche09), Theorem 2.16 and proof, pp. 20–22; Kisin, Proposition 8.7 and the finite-slope period theorem cited there. The global interpolation target `eigencurvePseudocharacter` remains the additional construction here.

**Checks for the pseudocharacter.**

- At a cuspidal classical point, its trace and determinant recover the chosen classical attachment, with the same Frobenius convention.
- At an Eisenstein point it specializes to the character sum; irreducible reconstruction is used only at cuspidal points.
- Distinct refinements of one newform have identical global traces but different `U_p` functions; the pseudocharacter alone does not select a period.

**Checks for the finite-slope period.**

- For `I` the maximal ideal, the selected crystalline Frobenius line is one-dimensional because `α≠β`.
- For `T_x/I=E[ε]/(ε²)`, the period is free of rank one over the dual numbers, not merely nonzero on the residue field.
- Coincident roots can give a two-dimensional selected period and are excluded. A split local representation with distinct roots is included.

**Checks for the deformation and tangent adapters.**

- At `A=E[ε]/(ε²)`, conjugation by `1+εB` changes the infinitesimal cocycle by its coboundary; strict equivalence gives the stated `H¹` carrier.
- At a critical split point, the constant zero Sen weight and the selected `β`-period kill three of the four local adjoint factors, leaving `χ₂χ₁⁻¹`.
- The trivial or cyclotomic ratio has exceptional `H⁰` or `H²`, so the one-dimensional local tangent bound requires its explicit exclusion in §3.5. Residue characteristic zero cannot be replaced by the finite-field deformation problem.

This uses §§2.7a, 2.10 and 3.4; `ModularSymbolsPadicLFunctions`, §3.0; `IntegralHeckeAndGaloisDeterminants`, §§1.3 and 4.2; `SelmerIwasawaCohomology`, §§2.2 and 4.9–4.12; `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §§R07.P2–R07.P5; `ArithmeticGaloisDuality`, §R02.4.

### 3.5 The eigencurve is smooth at decent points

If `f` is decent (and `v_p(β) ≠ 0` when `f` is Eisenstein, retaining `χ₁χ₂⁻¹ ≠ χ_cyc` in weight two), the eigencurve `C` is smooth at the point `x` of `f_β`; when `f` is cuspidal its cuspidal part `C₀` has the same smooth germ; its weight map has some ramification index `e ≥ 1` at `x`, with `e > 1` iff `f_β` is critical.

Use the supplied characteristic-zero refined deformation ring, period theorem and tangent adapter transported in §3.4a.

For cuspidal refinements transport the supplier’s decent-point smoothness theorem via §§2.7a and 3.4a; §3.4 identifies its decency condition. The cuspidal closed subspace has the same smooth germ at such a point. For an Eisenstein refinement of positive slope, prove `decentEisenstein_smooth` by the Eisenstein local deformation calculation of Bellaïche Theorem 2.16: use the reducible determinant, the preferred extension class of §3.0 and the crystalline period condition, retaining the weight-two character exclusion. This is the additional smoothness target here. No assertion that an arbitrary Eisenstein point lies in the cuspidal subspace is made. The ramification criterion is §3.2.

Smoothness is what makes the local Hecke algebra a `DVR` (§3.7).

See [Bellaïche09](#ref-bellaiche09), §2.3, Theorem 2.16, p. 20 (arXiv v1 PDF; printed page = PDF page).

This uses §3.4a; §3.4; §3.2; §2.10; §2.7; §2a.13.

### 3.6 The `θ` exact sequence

For global overconvergent analytic functions `A†` on the closed unit disc (union of analytic discs of radii `r>1`), let `D†_k` be the strong continuous dual with the weight-`k` action. The radius-change theta target is the exact sequence `0→D†_{−2−k}(k+1)→^{Θ_k}D†_k→^{ρ_k}V_k→0`, where `Θ_k` is dual to `(k+1)`-st differentiation and `ρ_k(μ)=∫(Y−zX)^k dμ(z)`. It gives the left-exact sequence of `Γ`-symbols with the same determinant twist. Transport to finite-slope pieces of the locally analytic/fixed-radius coefficient model requires the compatible `U_p` radius links, not a raw Banach exact sequence for `D[r]`.

`k≥0`; the global dagger coefficient convention is specified here and must be related to ModularSymbolsPadicLFunctions Layer 2’s distribution model using bounded radius links and their `U_p`-power companions. Use `ModularSymbolsPadicLFunctions` §3.0’s `thetaDistribution` and its exactness and radius comparison as `theta_radiusComparison` on the same dagger coefficient model: transposed `(k+1)`-fold differentiation is defined with radius loss, and the bounded links with their `U_p`-power companions compare it to the single-weight distribution carrier. Use its exactness in that dagger model before taking symbols, and transport the induced maps to the global model via the common coefficient action. A fixed-radius surjectivity statement is not used.

On global analytic functions of radius `r>1`, differentiate `k+1` times; the kernel is the global degree`≤k` polynomial space. Antidifferentiation divides coefficients by a polynomial in their index, so converges on every smaller radius still `>1`. This radius loss gives the global dagger statement; the transpose moment formula divides by `(n+k+1)!/n!`, which likewise preserves subexponential moment growth. A fixed-radius bounded-moment Banach module need not be preserved by that division. To use finite-slope locally analytic symbols, prove compatible radius-link isomorphisms using `U_p` invertibility and the shifted slope under `Θ`. Apply `Hom_Γ(Δ₀, −)`, which is left exact.

The sequence of symbols is exact only on the left three terms; surjectivity of `ρ*_k` is part of Stevens' control theorem. For `k=0` in `D[1]`, `μ(1)=0` and `μ(z^n)=1` for `n≥1` is bounded and in `ker ρ₀`. Its only possible inverse under `Θ` has `ν(z^n)=1/(n+1)`, unbounded along `n=p^a−1`. Hence the asserted raw `D[1]` exactness fails. For radii`<1`, locally polynomial functions on different residue discs also enlarge the derivative kernel beyond one global `V_k`.

- `theta_radiusComparison`: the dagger coefficient exact sequence and its determinant-twisted `Σ₀(p)`-equivariance, followed by the finite-slope radius comparison.
- `theta_radiusComparison_moments`: transposed differentiation evaluates on `z^n` with the falling-factorial multiplier and vanishes in degrees `n≤k`.
- `theta_radiusComparison_Up`: `U_pΘ^{k+1}=p^{k+1}Θ^{k+1}U_p` in these right-action conventions.

**Checks for the radius comparison.**

- For `k=0` and `r=1`, a bounded moment sequence `μ(1)=0`, `μ(z^n)=1` has an inverse derivative with moments `1/(n+1)`, which is unbounded. Fixed-radius surjectivity is false.
- On a smaller analytic disc an exponential radius loss dominates these polynomial denominators; the dagger comparison permits this loss.
- Differentiation on locally analytic functions has piecewise polynomial kernels; only the stipulated global dagger model has the single global polynomial kernel used here.

See [Bellaïche09](#ref-bellaiche09), §3.2.3, p. 27 (arXiv v1 PDF; printed page = PDF page).

This uses `ModularSymbolsPadicLFunctions`, §§2.2–2.3 and §3.0 (The theta exact sequence).

### 3.7 Family modular symbols are free of rank one at decent points

On cuspidal refinements this is the supplied local critical suite of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a, with the decency identification of §3.4. The additional assertion here is its extension to the stated Eisenstein domain; the cuspidal carriers and APIs retain their supplier’s ownership.

Let `T±_{W,ν}` be the Hecke algebra acting on `Symb±_Γ(R ⊗̂ D)_{≤ν}` over an affinoid `W = Sp R` of weight space and `C±_{W,ν}` the corresponding piece of the eigencurve. If `x` is a smooth point, the localisation `Symb±_Γ(R ⊗̂ D)^{≤ν}_(x)` is free of finite rank over `(T±_{W,ν})_(x)` (a `DVR`), and the specialisation `(T±_{W,ν})_(x) ⊗ ℚ̄_p → (T±_{w,ν})_(x)` is an isomorphism; if `x` is a decent refined newform (with positive slope in the Eisenstein case), the rank is one. Here local rings and eigenspaces are taken at geometric points, in the rigid henselian sense.

`x` lies in the selected finite-slope chart; actual-symbol slope specialization has been supplied. At a decent Eisenstein refinement require `v_p(β)>0`. Use geometric henselian local rings (or their completions), not arbitrary scheme localizations. `DVR` lemma: a module over a `DVR R` that is finite over a finite free `R`-algebra `T` which is itself a `DVR`, and free over `R`, is free over `T` (Lemma 4.1; false for `T` merely local, Remark 4.2).

Lemma 4.1 at the smooth point `x` (`C` reduced, so the local ring is a `DVR`). Rank one: on a sufficiently small smooth neighbourhood of `x`, every classical point other than possibly `x` is an étale newform point with one-dimensional eigenspace (Prop 3.18, Lemma 2.9). Choose a classical `y≠x` there and compute the locally constant rank at `y`; no étaleness at `x` is inferred.

**Checks.**

- At a decent critical point of ramification index `e>1`, `x` itself is not étale; the rank is computed at a different classical point.
- At a nearby étale newform point `y≠x`, the generalized eigenspace has dimension one and computes rank one of the same locally free module.
- The free rank-one module over `E[t]/(t^e)` has weight-fibre dimension `e` but residue-fibre dimension one.

Test the `DVR` lemma's failure for `T` local but not a `DVR` (Remark 4.2).

See [Bellaïche09](#ref-bellaiche09), §4.1, Proposition 4.3, p. 34 (arXiv v1 PDF; printed page = PDF page); [Bellaïche09](#ref-bellaiche09), §4.1, Proposition 4.5, p. 35 (arXiv v1 PDF; printed page = PDF page).

This uses §3.5; §2a.8; §2a.12; `LocallyAnalyticDistributions`, §§4.14–4.16; §2.7.

### 3.8 The generalised eigenspace at a decent point

On cuspidal refinements this is the supplied local critical suite of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a, with the decency identification of §3.4. The additional assertion here is its extension to the stated Eisenstein domain; the cuspidal carriers and APIs retain their supplier’s ownership.

For decent `f_β` with weight-map ramification index `e` at `x: (T±_{k,ν})_(f_β) ≅ ℚ̄_p[t]/(t^e)`, and `Symb±_Γ(D_k)(f_β)` is a free module of rank one over it, of dimension `e`.

`f_β` is decent, with positive slope if Eisenstein. At a geometric point, the henselian weight and eigencurve local rings are DVRs with common algebraically closed residue field of characteristic zero; the finite flat branch is totally and tamely ramified of degree `e`.

Bellaïche Proposition 4.6, p. 35: in a totally tamely ramified extension of these henselian DVRs choose uniformizers `t` and `u` so that `t^e=u`. Hensel lifting absorbs the unit factor because the residue field is algebraically closed and `e` is invertible. This is a statement about the geometric henselian local branch, not every unhenselized local ring. `(T±_{k,ν})_(x) = (T±_{W,ν})_(x) ⊗_{R(k)} ℚ̄_p = R(k)[t]/(t^e − u) ⊗ R(k)/(u) = ℚ̄_p[t]/(t^e)`. Specialise the rank-one freeness.

`e = 1` iff `f_β` is non-critical.

See [Bellaïche09](#ref-bellaiche09), §4.2.1, Proposition 4.6 with proof, p. 35; [Bellaïche09](#ref-bellaiche09), §4.2, Theorem 4.7, p. 36 (arXiv v1 PDF; printed page = PDF page).

This uses §3.7; §2.7.

### 3.9 Bellaïche's theorem on critical eigensymbols

On cuspidal refinements this is the supplied local critical suite of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a, with the decency identification of §3.4. The additional assertion here is its extension to the stated Eisenstein domain; the cuspidal carriers and APIs retain their supplier’s ownership.

For a decent refinement `f_β` (`v_p(β) > 0` if `f` is Eisenstein), `Symb±_Γ(D_k)[f_β]` is one-dimensional for both signs, and the following are equivalent: `(i) f_β` is critical; (ii) the generalised eigenspaces `Symb±_Γ(D_k)(f_β)` have dimension `> 1`; (iii) `ρ*_k(Symb±_Γ(D_k)[f_β]) = 0` for both signs. For cuspidal `f`, `(TS±)` for one sign implies it for the other; for Eisenstein `f`, `(TS^{−ε(f_β)})` always holds.

Decency; this extends Stevens (non-critical slope) and Pollack–Stevens (non-`θ`-critical) to the `θ`-critical case.

The eigenspace is the socle `t^{e−1}Symb±(f_β)` of the free rank-one `ℚ̄_p[t]/(t^e)`-module: dimension 1. If `e > 1` the eigenline is `t^{e−1}·`(generator) and `ρ*_k` kills it (Corollary 4.8); if `e = 1` its image is the classical eigenline for cuspidal `f`.

Distinguish critical slope from failure of `ρ*_k` to be an isomorphism: the latter is criticality.

See [Bellaïche09](#ref-bellaiche09), §1.4.1, Theorem 1, p. 6 (arXiv v1 PDF; printed page = PDF page); [Bellaïche09](#ref-bellaiche09), §4.2, Corollary 4.8, p. 36 (arXiv v1 PDF; printed page = PDF page).

This uses §3.8; §3.6; §3.1; `ModularSymbolsPadicLFunctions`, §2.4.

### 3.10 The critical `p`-adic L-function

On cuspidal refinements this is the supplied local critical suite of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a, with the decency identification of §3.4. The additional assertion here is its extension to the stated Eisenstein domain; the cuspidal carriers and APIs retain their supplier’s ownership.

For decent `f_β` and a generator `Φ±_{f_β}` of `Symb±_Γ(D_k)[f_β]`, `L±(f_β, σ) := Φ±_{f_β}({∞} − {0})(σ)` for continuous `σ : ℤ_p^× → ℂ_p^×` (extended by 0 on `pℤ_p`); `L(f_β, σ) = L⁺ + L⁻`. It is analytic in `σ` (a power series in `s` on `|s − 1| < 1` for each tame character), of order `≤ v_p(β)`, defined up to a nonzero scalar for each sign, and equals the Mazur–Tate–Teitelbaum / Pollack–Stevens `p`-adic L-function when `f_β` is not `θ`-critical.

`f_β` satisfies Theorem 1: decent, distinct roots and positive slope if Eisenstein. Use the finite-slope extension to overconvergent distributions on all sufficiently small radii before evaluating arbitrary locally analytic characters. Decency, so that the eigenline is one-dimensional.

Evaluate at `{∞} − {0}`, restrict to `ℤ_p^×`, take the Mellin transform (Amice). Order `≤ v_p(β)`: the distribution `Φ±({∞} − {0})` is `v_p(β)`-admissible (Višik).

Interpolation determines `L±` only when `v_p(β) < k + 1`; at critical slope it does not.

- `criticalPadicL`: `L±(f_β, σ) = Φ±({∞} − {0})(σ)`.
- `criticalPadicL_analytic`: Analytic in `s` on the open unit ball for each tame character.
- `criticalPadicL_order`: Of order `≤ v_p(β)`.
- `criticalPadicL_eq_classical`: Agrees with the Pollack–Stevens L-function when `f_β` is not `θ`-critical.

**Checks.**

- For `s∈{±1}`, `L^s(f_β,σ)=0` unless `σ(−1)=s(−1)^k`; at family weight `κ` the condition is `σ(−1)=sκ(−1)`.
- At odd degree `k=1`, the plus symbol supports odd characters and the minus symbol supports even ones: `(μ|_1ι)(f)=−μ(f(−z))`. This detects the weight sign in the period-label conversion.
- For the ordinary refinement (slope 0) it is the Mazur–Tate–Teitelbaum measure, bounded.
- `f` Eisenstein, `θ`-critical: `L^{−ε(f_β)} ≡ 0` although `Φ^{−ε(f_β)} ≠ 0`.

See [Bellaïche09](#ref-bellaiche09), §1.4.2, p. 6 (arXiv v1 PDF; printed page = PDF page).

This uses §3.9; `ModularSymbolsPadicLFunctions`, §2.5; `LocallyAnalyticDistributions`, §§2.1–2.3 (order and uniqueness).

### 3.11 Vanishing at classical characters in the `θ`-critical case

If `f_β` is `θ`-critical then `L±(f_β, ϕt^j) = 0` for every finite-order `ϕ` and `0 ≤ j ≤ k`, except when `f` is Eisenstein, `f_β` non-critical, `± = ε(f_β)`, `ϕ` trivial and `j = k`. Equivalently each `s ↦ L±(f_β, ψχ_s)` is divisible by `log^{[k]}(s) = ∏_{i=0}^{k} log_p(γ^{−i}s)` (by `log^{[k]}(s)/(s − γ^k)` only on the tame component `ψ(t)=t^k` in the exceptional case).

`f_β` satisfies the hypotheses of §3.10 and is `θ`-critical. The eigensymbol lies in image `Θ*_k` only when `ρ*_k` kills it; `θ`-criticality of the modular form alone does not imply this for the exceptional Eisenstein sign.

When `ρ*_k(Φ±)=0`, use the dagger theta sequence and its proved finite-slope radius comparison to obtain `Φ±=Θ*_k(Ψ)` in every sufficiently small locally analytic test radius. Differentiation kills the locally polynomial tests `ϕ(z)z^j` there, `0≤j≤k`, giving the claimed values. The global dagger sequence alone does not allow evaluation on an arbitrary finite-order character until this radius comparison is supplied. If `ρ*_k(Φ±)≠0` in the `θ`-critical case, `f` is noncritical Eisenstein and `±=ε(f_β)`. Bellaïche pp. 37–38 writes its classical symbol as a boundary symbol. Cusp-stabilizer invariance and the moment formula show that lower moments vanish and the top moment on `a+p^nℤ_p` is independent of a. Summing against a nontrivial finite-order character kills that top moment; only the trivial character and `j=k` can remain. Each prescribed point is a simple zero of the logarithmic product. The exceptional missing factor occurs only on the tame component `ψ(t)=t^k`, where dividing by `s−γ^k` removes that one prescribed zero.

Interpolation values alone are not a uniqueness theorem here (they all vanish).

See [Bellaïche09](#ref-bellaiche09), §1.4.3, Theorem 2, p. 8 (arXiv v1 PDF; printed page = PDF page).

This uses §3.10; §3.6; §3.9.

### 3.12 Critical-slope L-functions have infinitely many zeros

At a decent refinement of weight `k+2` with `v_p(β)=k+1`, for every tame character `ψ` the function `s↦L±(f_β,ψχ_s)` has infinitely many zeros on the open character disc. The arithmetic and sign hypotheses are those of §3.10; `k≥0` and `p` is odd. An identically zero function is included in this assertion.

For `θ`-critical `f_β`, §3.11 gives infinitely many distinct prescribed zeros; its exceptional Eisenstein case removes only one of them. For a non-`θ`-critical critical-slope refinement, the other root `α` is a unit. Prove `pairedInterpolation_infiniteZeros`: let `K/ℚ_p` be finite, `F₁`,`F₂` analytic on its open unit disc, `a₁`,`a₂∈K×` with `v_p(a₁)≠v_p(a₂)`, and suppose `a₁^{n+1}F₁(ζ_{p^n}−1)=a₂^{n+1}F₂(ζ_{p^n}−1)` for every sufficiently large `n`. Then at least one `F_i` has infinitely many zeros. If both had finitely many, they would be nonzero and, by the finite-zero/bounded-coefficient lemma, admit Weierstrass decompositions `ϖ^{μ_i}P_iU_i`. For large `n` their valuations are `μ_i v_p(ϖ)+deg(P_i)/φ(p^n)`; the displayed relation gives an unbounded term `(n+1)(v_p(a₁)−v_p(a₂))` equal to a bounded one, a contradiction. This argument uses neither positivity of both slopes nor an order bound. Pollack’s Lemma 3.2 and proof of Theorem 3.3, pp. 533–534, supply the analytic argument; his stated theorem assumes both slopes positive, while this explicitly proved version permits slope zero.

Apply the lemma to the two interpolation functions, whose primitive-character values have a common numerator. If the ordinary function is nonzero, it is bounded and has finitely many zeros, forcing infinitely many for the critical one. If it is identically zero, the common-numerator interpolation directly gives zeros of the critical function at every primitive character in the sequence. No division by an interpolation value is used.

**Checks.**

- The nonzero constant 1 has order at most `k+1` but no zeros; an upper growth bound alone cannot prove the assertion.
- The zero function has infinitely many zeros and is handled before invoking the nonzero Weierstrass decomposition.
- When the two slopes coincide, the valuation contradiction disappears; the supersingular `a_p=0` case requires the separate signed decomposition, not this unequal-slope lemma.
- For a unit root `α` and critical root `β` of slopes 0 and `k+1`, the valuation difference is `(n+1)(k+1)`, while the two distinguished-polynomial contributions tend to constants.

See [Bellaïche09](#ref-bellaiche09), §1.4.3, Corollary 1, p. 8; [Pollack](#ref-pollack), Lemma 3.2 and Theorem 3.3 with its proof, pp. 533–534.

This uses §3.11; §3.10; the single-weight interpolation and bounded ordinary measure of `ModularSymbolsPadicLFunctions`, Layer 2.

### 3.13 Two-variable `p`-adic L-functions near a decent point

On cuspidal refinements this is the supplied local critical suite of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a, with the decency identification of §3.4. The additional assertion here is its extension to the stated Eisenstein domain; the cuspidal carriers and APIs retain their supplier’s ownership.

For decent `f_β` at `x ∈ C` there are an affinoid neighbourhood `V` of `x` and, for each sign, `L±(y, σ)` on `V ×` (characters), jointly analytic, well defined up to a nonvanishing analytic function of `y`; every refined newform point `y ∈ V` is decent and `L±(y, σ) = c_y L±(f′_{β′}, σ)` with `c_y ≠ 0`.

As in Theorem 1: decent, distinct roots, positive slope if Eisenstein; all L2 arithmetic coefficient and specialization inputs are supplied. Built from a generator of the rank-one family module (§3.7).

After finite coefficient extension and geometric henselian localization, choose the tame normal form `T≅R[t]/(t^e−u)` with `u(k)=0`, `t(x)=0`, and a generator `φ` of the free rank-one `T`-module `M` of finite-slope family symbols. In `N=M⊗_R T` keep the two `T`-actions distinct. Define `Ψ=∑_{i=0}^{e−1} t^i φ⊗t^{e−1−i}`. Telescoping gives `(t⊗1−1⊗t)Ψ=0` because `t^e=u∈R`. Thus specializing the second factor at `y` produces a simultaneous Hecke eigenvector with eigenvalues of `y`. At `x` it is `t^{e−1}φ_k`, a nonzero socle generator; at nearby unramified points the diagonal factor is nonzero. This proves eigenline specialization, which an arbitrary `φ∈M` would not give when `e>1`. Apply the family Mellin transform to `Ψ` using the second `T`-action. Its values specialize to the one-variable eigenline L-functions by Bellaïche Lemma 4.12 and Proposition 4.14, pp. 40–41. Choices of `φ` and uniformizers change `Ψ` and the scalar function by a unit. Prove the construction over the henselian branch and descend it after shrinking an affinoid neighbourhood: equivalently use the diagonal-annihilator line in `M⊗_R T` and its different. A henselian normal form alone does not assert an isomorphism of the original affinoid algebras. The diagonal line and its unit ambiguity give the required descended function.

Retain the sheaf-valued object; a scalar function requires a chosen trivialisation of the rank-one module.

See [Bellaïche09](#ref-bellaiche09), §1.4.4, Theorem 3, p. 10 (arXiv v1 PDF; printed page = PDF page); [Bellaïche09](#ref-bellaiche09), §4.3, Proposition 4.11, Lemmas 4.12–4.13 and Proposition 4.14, pp. 39–41.

This uses §3.7; §3.10; §2a.12; §2.7.

### 3.14 Secondary critical `p`-adic L-functions

On cuspidal refinements this is the supplied local critical suite of `ModularSymbolsPadicLFunctions`, §3.0, transported through §2.7a, with the decency identification of §3.4. The additional assertion here is its extension to the stated Eisenstein domain; the cuspidal carriers and APIs retain their supplier’s ownership.

For critical `f_β` with `e = dim Symb±_Γ(D_k)(f_β) > 1`, `L±_i(f_β, σ) := ∂^i L±(y, σ)/∂y^i` at `y = x (i = 0, …, e − 1)` for a uniformiser `y` of `C` at `x`; the flag `F₀ ⊆ … ⊆ F_{e−1}` they span is well defined, is the Mellin image of the generalised-eigenvector flag, each `L±_i` has order `≤ k + 1`, vanishes at all finite-order-twisted monomials `ϕ(z)z^j`, `0≤j≤k`, for `i≤e−2`, and for cuspidal `f` its top function `i=e−1` has the same critical-value interpolation and Euler factors as §3.10 in the non-`θ`-critical case, and has infinitely many zeros.

`C` smooth at `x` (§3.5).

The diagonal-sum construction gives `L_i=i!·`Mellin`(t^{e−1−i}φ_k)`. Changes of parameter and trivialization act by invertible triangular transformations, so their span filtration is intrinsic. The Mellin map need not be injective, so no strictness or dimension `i+1` is asserted. For `i<e−1` the classical specialization kills `t^{e−1−i}φ_k`; the moment formula gives vanishing. For cuspidal `f` the top specialization is nonzero and yields the ordinary critical-value interpolation formula. The order bound is the slope bound, and the paired-refinement argument supplies infinitely many zeros for the top function.

The individual `L±_i` depend on choices; only the flag is intrinsic.

The cuspidal APIs `secondaryPadicL`, `secondaryPadicL_flag` and `secondaryPadicL_interpolation` are supplied by `ModularSymbolsPadicLFunctions`, §3.0; the derivative description above identifies those same functions and their flag. Its `localFamilyPadicL` is likewise the cuspidal restriction of §3.13. The Eisenstein extension uses the same derivative and Mellin construction, with the exceptional sign and vanishing terms of §3.11; it makes no cuspidal top-interpolation assertion for Eisenstein forms.

**Checks.**

- `e = 1`: only `L₀ = L` exists (degenerate case).
- For the CM form of `X₀(32)`, `p=5`, criticality gives `e>1` and `e` secondary indices; no independence of their Mellin transforms or a specific value `e=2` is asserted without a further computation.
- For cuspidal `f` the top secondary function has the critical-value interpolation of the non-`θ`-critical construction, up to its chosen scalar and the Euler factors; lower secondary functions vanish at those test characters.

See [Bellaïche09](#ref-bellaiche09), §1.4.5, p. 10 (arXiv v1 PDF; printed page = PDF page).

This uses §3.13; §3.8; §3.5.

### Examples

Let the local weight algebra be `R=E[[w]]` and a tame ramified local eigencurve algebra `T=E[[t]]` with `w=t^e`, `e` prime to p. Then `T/(w)=E[t]/(t^e)`: its generalized eigenspace has dimension `e` and its eigenspace killed by `t` has dimension 1. The element `∑_{i=0}^{e−1}t^i⊗t^{e−1−i}` is killed by `t⊗1−1⊗t`. For `e=2` it is `1⊗t+t⊗1`; after setting the second coordinate `t=0` it gives `t`, the actual eigenvector, rather than the generator 1 of the generalized space.

If `e=1`, the eigenspace already equals the generalized space and there are no secondary terms. If `e>1` and the Mellin image of the top generalized term vanishes, its secondary filtration drops accordingly; one cannot conclude that every formal derivative defines an independent scalar function. For `θ`-critical symbols, all classical moments vanish in the indicated range except the single prescribed Eisenstein exception, while the nonzero critical `p`-adic L-function itself remains defined by the eigenline.

### Dependencies

Layer 2 supplies the global family symbol charts, coherent eigensymbols and classical control, including the `E₂` correction. `ModularSymbolsPadicLFunctions`, §3.0, owns the cuspidal critical predicates, theta sequence, local charts, refined deformation and tangent suite, decent-point multiplicity, secondary functions and local family L-functions. Section 2.7a identifies the local and global models, §3.4 compares the Selmer conventions, and §3.4a transports the supplied local adapters. The Eisenstein extensions remain here. `GlobalGaloisDeformations`, §3.6, supplies only its separately stated residual fixed-determinant comparison. The local algebra uses finite-flat `DVR`, different and diagonal-annihilator calculations; any tame normal form is used only after the stated henselian coefficient extension and descent.

## Layer 4: Galois representations, Selmer conditions and family reciprocity

### 4.0 Finite-level modular zeta classes and cyclotomic bounds

#### 4.0.1 Geometric classes, moments and norm relations

Use the open modular curves and weight local systems of `ModularCurvesPartII`, §§3.1–3.5, 5.17 and 14.1–14.4a. Construct the normalized theta unit `thetaUnit c` on an elliptic curve with `c` invertible and prime to 6: its divisor is `c²[0] − [c]⁎[0]`, its norm under multiplication by an integer prime to `c` has the prescribed distribution identity, and its leading Tate coefficient has Kato's normalization. Torsion evaluation gives the smoothed Siegel units. The API includes divisor, base change, isogeny norm and Tate `q`-expansion; fixing only the divisor does not fix the scalar. For `M,N ≥ 1`, `M + N ≥ 5`, integers `c,d > 1` with `gcd(c,6pM) = gcd(d,6pN) = 1`, construct the ordered Beilinson symbol from the two units on the two-index level curve. Develop the products and finite-étale transfers of these particular symbols, together with their étale Chern maps: the Chern image is the cup product of the two Kummer classes. Require base change, antisymmetry, the Steinberg relation, projection formula and transfer transitivity. These are local construction targets over the supplied open curves, not assumed symbol data.

For weight `k ≥ 2`, `1 ≤ r′ ≤ k − 1` and integral twist `r`, define `modularZeta c d M N k r r′` by the Chern moment map applied to the `p`-power level tower of those symbols. Specify the integral divided-power lattice before the rational symmetric-power comparison. The image lies in the degree-one arithmetic cohomology of the geometric weight-`k−2` local system with twist `k−r`. Construct the Hochschild–Serre edge comparison with the finite-ramification Galois model of `SelmerIwasawaCohomology`, §3.15. For a new prime `ℓ ∤ Mpcd`, write `A_ℓ = T′(ℓ)⟨1/ℓ,1⟩⁎` and `B_ℓ = ⟨1/ℓ,1/ℓ⟩⁎`. The conductor norm factor is `1 − ℓ^(−r)A_ℓ + ℓ^(k−1−2r)B_ℓ` if `ℓ ∤ N`, and `1 − ℓ^(−r)A_ℓ` if `ℓ | N`; the repeated `p`-level factor is the identity. Prove the `p`-level trace relation, moment compatibility, coefficient change, Hecke/diamond equivariance and descent from smoothed classes after retaining their explicit auxiliary factors. API: `modularZeta_moment`, `modularZeta_norm`, `modularZeta_trace`, `modularZeta_hecke` and `modularZeta_smoothing`. Projection to a classical eigenform uses `AlgebraicModularFormsAndSerreWeights`, §R15.5A.2; transport its arithmetic Frobenius to the geometric cohomological convention of §4.1 before writing the class norm factor as `det(1 − Frob_ℓ X)`. Sources: [Kato](#ref-kato), §§1–2, pp. 121–133; §§8.1–8.9, pp. 180–185; [Ochiai](#ref-ochiai), Proposition 1.2, pp. 117–118.

**Checks.**

- For nonzero `c`-torsion in characteristic zero, the theta unit has a simple pole, while at zero its order is `c² − 1`. The constant function 1 fails this divisor test for `c > 1`.
- Its isogeny norm equals the normalized unit on the target curve; changing it by an arbitrary scalar generally breaks that equality.
- For `c = 1`, extend the normalized theta convention by the constant unit 1; its divisor and every associated ordered symbol are zero. An unspecified scalar with divisor zero would fail this normalization.
- At `k = 2, r = 1`, the good-prime factor is `1 − A_ℓ/ℓ + B_ℓ/ℓ`; the bad-prime factor lacks the quadratic term. This distinguishes the two conductor cases.
- Raising a conductor already divisible by `p` gives ordinary trace compatibility with factor 1. Reinserting the good-prime Euler polynomial fails this test.
- Interchanging the two units negates their Chern cup product; forgetting the order changes the sign of reciprocity.
- At weights with `p | (k−2)!`, the divided-power moment is integral although the naive identification with the symmetric-power dual by factorial division need not be.

#### 4.0.2 Modular explicit reciprocity

Construct the modular dual exponential from the continuous period-sequence boundary maps of `FiniteFlatGroupsAndIntegralPadicHodgeTheory`, §R07.P3, and identify it on the open-curve local system with the filtered de Rham realization of `AlgebraicModularFormsAndSerreWeights`, §R15.5A.1. For the classes of §4.0.1, assume `1 ≤ r,r′ ≤ k−1`, at least one of `r,r′` is `k−1`, and every prime divisor of `M` divides `N`; when `(r,r′) = (k−2,k−1)` require `M ≥ 2`. Prove `modularZeta_explicitReciprocity`: its image is Kato's normalized product of Eisenstein series with the period pairing, multiplied by `1` when `p | M`, by `1 − p^(−r)T′(p)⟨1/p,1⟩⁎` when `p ∤ M` and `p | N`, and by `1 − p^(−r)T′(p)⟨1/p,1⟩⁎ + p^(k−1−2r)⟨1/p,1/p⟩⁎` when `p ∤ MN`. The Eisenstein product and its Hecke/Betti/de Rham comparisons are defined with the classical series of `ModularForms`, Layer 0; retain the literal dual and twist of the coefficient system. After projection to the eigenform and the period chosen in §4.5, this is the displayed critical L-value formula there. Require localization, coefficient-change and moment naturality, and explicit preservation of auxiliary smoothing factors.

The proof includes the local reciprocity comparison for the actual norm-compatible theta units: identify the Kummer cup-product trace with the filtered differential expression used by Kato, and prove the comparison square of §10, (10.9.5). Finite-local-field exponential existence alone does not prove that square. The residue field of the completed modular function field has finite `p`-basis and need not be perfect; construct the required differential/connection comparison in precisely that scope. Sources: [Kato](#ref-kato), §§9.5–9.7, pp. 188–189, §10, (10.9.5) and Proposition 10.12, pp. 195–198, and §11, pp. 199–217; the eigenform formula is [Ochiai](#ref-ochiai), Proposition 1.2(3), p. 118.

**Checks.**

- In weight two at `r = 1`, both nonconstant `p`-powers in the good-`p` factor are `p⁻¹`; they are not integral units and cannot be dropped in the lattice comparison.
- The three `p`-level cases give respectively a constant, linear or quadratic Euler operator. They agree with the conductor/moment normalization of §4.0.1.
- The identity is linear in the class; a zero class has zero dual-exponential image. A nonzero critical value therefore excludes replacement of the geometric class by zero.
- Interchanging the ordered units negates both the cup-product side and the normalized period pairing. Changing only one sign fails the equality.

#### 4.0.3 Cyclotomic torsion and the Euler-system bound

For a classical cuspidal eigenform `f` of weight `k ≥ 2`, coefficient field `E`, stable lattice `L` and cyclotomic Iwasawa algebra `Λ_cyc`, prove the rational cyclotomic cohomological Euler-system bound using the projected classes of §4.0.1 and their reciprocity of §4.0.2: degree-one Iwasawa cohomology has generic rank one, degree two is torsion, the geometric zeta submodule is non-torsion, and at each height-one prime of `Λ_cyc[1/p]`, the length of degree-two cohomology is at most that of degree one modulo the zeta submodule plus the length of local degree-two cohomology at p. The latter can be nonzero at a weight-two potentially multiplicative exceptional character and is retained there. Include the CM case through its induced-character decomposition and the corresponding elliptic-unit argument, rather than assuming a non-CM unipotent image. If `p` is odd and, in some integral basis of `L`, the image of `G_(ℚ(μ_(p∞)))` contains `SL₂(ℤ_p)`, prove integrality of the zeta submodule and the integral height-one inequality. Retain the local degree-two term at the exceptional primes; away from them it is zero. A choice of smoothed generator additionally retains its auxiliary factors. This is a theorem about the actual geometric classes, with Kolyvagin derivative relations and local singular/unramified comparison as proof targets here.

When `p ∤ N` and `a_p(f)` is a unit, use the saturated ordinary lattice filtration and the exact Greenberg local condition of `SelmerIwasawaCohomology`, §2.8. Prove `classicalOrdinarySelmer_torsion`, and the rational height-one bound of its compact dual by the ordinary `p`-adic L-function with the fixed good periods. For the all-prime integral bound impose `p` odd, the cyclotomic integral `SL₂(ℤ_p)` image condition just stated and good integral period bases: in the dual lattice `U ⊂ V(f*) ≃ L*(1−k)`, the de Rham vector generates `H⁰(ℚ_p, ℤ̂_p^ur ⊗ U″(k−1))` and the two Betti vectors generate `U⁺` and `U⁻`; retain the literal dual when factorials are nonunits. For the specialization step in §4.8 prove the following Euler-system bound. Let `B = 𝒪[[X₁,…,Xₙ]]`, `n ≥ 1`, and `V` a free rank-two `B`-representation unramified outside a finite `S` containing `p` and infinity, with an Euler system `z(r) ∈ H¹(ℚ(μ_r),V)`. Assume `z(1)` is not `B`-torsion, every finite `v ∈ S` has `B`-torsion `H²(ℚ_v,V)`, both `det V` and `det V*(1)` have infinite image, the residual representation is irreducible, and the two complex-conjugation eigenspaces have rank one. Require `τ ∈ G_(ℚ(μ_(p∞)))` acting as `(1 P_τ; 0 1)` with `P_τ ≠ 0` in a `B`-basis and `τ′ ∈ G_ℚ` acting by `−1`. Then `X²_S(V) = ker(H²(G_(ℚ,S),V) → ⊕_(v∈S) H²(ℚ_v,V))` is finite `B`-torsion, and, if it has a generating set of `k` elements, `(P_τ^k) char_B(H¹(G_(ℚ,S),V)/Bz(1)) ⊆ char_B(X²_S(V))`. Prove its specialization and local-condition comparisons for the Hida deformation of §4.8; the same fixed unipotent factor must work at all height-one primes. The local singular quotient and global localization errors are those of the Selmer supplier. Sources: [Kato](#ref-kato), Theorems 12.4–12.5, pp. 221–222, §§15.12–15.17, pp. 263–265, and §§17.1–17.5, pp. 272–274; [Ochiai](#ref-ochiai), §2, Theorems 2.4 and 2.6, pp. 123–125.

**Checks.**

- Localizing away from `p` removes `p`-power auxiliary denominators, but proves no assertion at the height-one prime `(p)`.
- At a CM form the rational theorem still applies; a hypothesis requiring a nontrivial non-CM unipotent would exclude this case.
- Over a height-one `DVR`, quotient by a nonzero element `ϖⁿ` has `length n`. The zero element gives a nontorsion quotient and is excluded by the proved non-torsion statement.
- The norm polynomial in the Kolyvagin relation uses Frobenius in the field class action separately from its coefficient action, as in §4.5. Replacing both by a scalar loses the conductor relation.

### 4.1 Hida's big Galois representation and its nearly ordinary twist

Let `p ≥ 3`, `Γ = Gal(ℚ_∞/ℚ)` for the cyclotomic `ℤ_p`-extension and `Γ′` the diamond group of the tower `Y₁(p^t)`, both identified with `1 + pℤ_p`. For a branch of the ordinary Hecke algebra with coefficient ring `H^ord_F` (a local domain finite flat over `ℤ_p[[Γ′]]`, attached to a `Λ`-adic eigen newform `F`), there is a finitely generated torsion-free `H^ord_F`-module `T^ord` of generic rank two with a continuous `G_ℚ`-action, unramified outside a finite set `S ∋ p`, `∞`, with Frobenius polynomials in Ochiai’s cohomological convention. This convention must be identified with the EPW Hecke representation by the appropriate dual and Tate twist; a bare trace`(Frob_ℓ)=T_ℓ` identification with the EPW representation is not asserted. The nearly ordinary Hecke algebra is `H^{n.o.}_F := H^ord_F ⊗̂_{ℤ_p} ℤ_p[[Γ]] ≅ H^ord_F[[Γ]]`, and the nearly ordinary deformation is `T := T^ord ⊗̂ ℤ_p[[Γ]](χ̃) ⊗ ωⁱ`, with `χ̃ : G_ℚ ↠ Γ ⊂ ℤ_p[[Γ]]^×` the universal cyclotomic character. Under `(F)`, `T` is free of rank two with irreducible residual representation. Its determinant is `χ⁻¹χ̃²χ̃′⁻¹ω^{2i}`, up to the finite-order branch character. At an arithmetic point `κ` of weight `w(κ)` and `1≤j≤w(κ)+1`, specialization along `χ^{j−1}∘κ` is `T_{f_κ}⊗χ^j⊗ωⁱ`, using the cohomological Deligne lattice of weight `w(κ)+2`. All formulas for the untwisted deformation explicitly set `i=0`.

`p ≥ 3`; a branch `H^ord_F` of the ordinary Hecke algebra; hypothesis `(F)` for the freeness statements. Use Ochiai §1, pp. 114–115: geometric Frobenius, the cohomological `T_{f_κ}`, and the indicated universal twists. An arithmetic pair `(j,κ)` specializes `T` to `T_{f_κ}⊗χ^j⊗ωⁱ`; even the trivial `Γ`-specialization `j=1` includes one cyclotomic twist. Construct the dual/Tate-twist normalization bridge to the Layer 1 EPW convention before transferring any Frobenius formula.

Construct the ordinary cohomological lattice from the Hecke-localized inverse system of modular-curve étale cohomology, with the trace transition and the dual of the covariant Tate-module lattice specified. Prove `hidaBigGaloisRep_normalization`: its arithmetic specialization is `T_{f_κ}⊗χ` in the geometric-Frobenius convention of Ochiai at `j=1`; identify the corresponding EPW representation by the dual, Tate and finite-character changes, and check both trace and determinant at every good prime. Use the integral ordinary moment control of §1.2 and the modular-curve étale/Betti comparison to establish the lattice specialization, not just a rational equality of characteristic polynomials. The residual irreducible determinant interpolation of IntegralHeckeAndGaloisDeterminants Layer 4 supplies the continuous rank-two representation once its trace data are constructed. At classical points the Eichler–Shimura relation gives those data, and coefficient density extends them. Freeness over the branch remains the explicit hypothesis `(F)`.

This construction concerns ordinary elliptic modular families over `ℚ`. The universal cyclotomic twist then produces the two-variable deformation; it does not supply totally real nearly ordinary representations without the corresponding automorphic and geometric inputs.

- `nearlyOrdinaryHeckeAlgebra`: `H^{n.o.}_F = H^ord_F ⊗̂ ℤ_p[[Γ]]`.
- `hidaBigGaloisRep`: `T^ord` with its `G_ℚ`-action over `H^ord_F`.
- `nearlyOrdinaryDeformation`: `T = T^ord ⊗̂ ℤ_p[[Γ]](χ̃) ⊗ ωⁱ` over `H^{n.o.}_F`.
- `hidaBigGaloisRep_trace`: The Frobenius polynomial of `T^ord` is the one obtained from Ochiai’s arithmetic specializations `T_{f_κ}⊗χ` at `j=1`, using geometric Frobenius and the cohomological convention. The EPW trace`=T_ℓ` formula requires the explicit dual/Tate-twist normalization bridge.
- `nearlyOrdinaryDeformation_specialise`: `T` specialized along `χ^{j−1}∘κ` is `T_{f_κ}⊗χ^j⊗ωⁱ`; for the untwisted deformation omit `ωⁱ`.

**Checks.**

- At `w(κ)=0` and `j=1`, the untwisted nearly ordinary specialization is `T_{f_κ}⊗χ`. Therefore the `Γ`-trivial specialization of `T^ord` is this twist. Comparing with a covariant Tate-module summand requires the stated normalization bridge.
- Removing the universal cyclotomic factor `χ̃²` from `det(T)` gives `det(T^ord)=χ⁻¹χ̃′⁻¹` times the finite-order branch character, in Ochiai’s convention. A determinant `χχ̃′` without an accompanying dual/twist fails this test.
- Specialising the cyclotomic variable at the trivial character recovers `T^ord ⊗ ωⁱ`.
- Without `(F)` the module `T^ord` is torsion-free of generic rank two but need not be free over `H^ord_F` (for example when `H^ord_F` is not Gorenstein); freeness is a hypothesis, not a theorem.

See [Ochiai](#ref-ochiai), §1, pp. 114–116 (Hida's nearly ordinary Hecke algebra, condition (F) and the basic properties 1)–3) of the Hida deformation); [EPW](#ref-epw), §2.3, Theorem 2.3.1, p. 10.

This uses §0.17; §1.9; §1.1; §1.2; `ModularCurvesPartII`, §13.5 (The modular Jacobian Tate module); `ModularCurvesPartII`, §17.2 (The Eichler–Shimura relation); `IntegralHeckeAndGaloisDeterminants`, §4.2 (finite-quotient witnesses and interpolation); `PadicMeasuresIwasawaAlgebras`, §§0.1 and 1 (measures and completed group algebras).

### 4.2 The ordinary filtration of the big Galois representation at `p`

Under `(F)`, the restriction of `T` to a decomposition group `G_{ℚ_p}` has a filtration `0 → F⁺T → T → F⁻T → 0` by `H^{n.o.}_F`-submodules free of rank one, with `F⁺T ≅ ℤ_p[[Γ]](χ̃) ⊗̂ H^ord_F(α̃) ⊗ ωⁱ` where `α̃ : G_{ℚ_p} → (H^ord_F)^×` is unramified with `α̃(Frob_p) = A_p` and `κ(A_p) = a_p(f_κ)` at every arithmetic point; the character of `F⁻T` is `det(T)/char(F⁺T)`, namely `χ⁻¹χ̃χ̃′⁻¹α̃⁻¹ωⁱ` up to the finite-order character occurring in `det(T)`. The filtration specialises at every arithmetic point to the ordinary filtration of `T_{f_κ} ⊗ χ^j ⊗ ωⁱ`, and is saturated (the quotient `F⁻T` is torsion-free).

Hypothesis `(F)`; `p`-distinguished residual representation for uniqueness of the filtration. The Hida–Wiles ordinary-line theorem supplies integral free rank-one `F⁺` and `F⁻` in Ochiai’s normalization. Freeness of `T` and residual irreducibility alone do not prove this local filtration. In the cohomological convention the unramified `α̃`-line is the submodule before the universal cyclotomic twist; the usual connected–étale quotient must first be dualized appropriately.

Construct `hidaBigGaloisRep_integralOrdinaryLine` from the ordinary connected–étale sequence of the modular Jacobian’s `p`-divisible group at each tower level, project by the localized Hecke action, and pass to trace-compatible integral limits. In the covariant Tate convention identify the unramified quotient and its Frobenius `U_p` action; dualize with the normalization bridge of §4.1 to obtain the unramified `α̃` submodule in Ochiai’s cohomological convention. Prove finite rank one, saturation and arithmetic control for both terms, retaining the distinguished residual characters and the lattice hypotheses of the Hida–Wiles theorem recalled by Ochiai properties 4–5. These integral assertions are additional family targets; global rank-two freeness alone does not prove them. Uniqueness of the distinguished ordinary line proves specialization compatibility. In a basis respecting the filtration the determinant is the product of the diagonal characters, hence `char(F⁻T)=det(T)/char(F⁺T)`.

The modular-curve supplier provides the Jacobian and its ordinary special-fibre geometry. The `p`-divisible-group ordinary-line comparison and its passage to family lattices are proved here in `hidaBigGaloisRep_integralOrdinaryLine`; the semistable `ℓ≠p` Tate-module comparison is insufficient for this `p`-local target.

- `hidaBigGaloisRep_integralOrdinaryLine`: the saturated rank-one ordinary submodule in the cohomological convention of §4.1.
- `hidaBigGaloisRep_integralOrdinaryLine_quotient`: its quotient is rank one and its geometric Frobenius character agrees with the stated unramified character after the explicit dual/twist comparison.
- `hidaBigGaloisRep_integralOrdinaryLine_specialise`: the filtration specializes to the ordinary local filtration, with saturation checked integrally.

**Checks for the integral line.**

- The étale line in the covariant Tate convention becomes the corresponding submodule or quotient only after dualizing the short exact sequence.
- The lattice `p𝒪⊕0` in `𝒪²` has the correct rational line but a quotient with `p`-torsion, and is rejected by saturation.
- Two distinct residual ordinary characters select a unique line; coincident characters do not satisfy the distinguished hypothesis used for this uniqueness.

See [Ochiai](#ref-ochiai), §1, p. 116, basic properties 4)–5); [EPW](#ref-epw), §2.3, Theorem 2.3.4(3), p. 13.

This uses §4.1; `ModularCurvesPartII`, §13.5 (The modular Jacobian Tate module).

### 4.3 Greenberg and Bloch–Kato Selmer groups of the nearly ordinary deformation

Let `A = T ⊗_{H^{n.o.}} Hom_{ℤ_p,cont}(H^{n.o.}_F, ℚ_p/ℤ_p)` be the discrete module attached to `T` and `ℚ_S` the maximal extension unramified outside `S`. For a local condition `H¹_`?`(ℚ_p, A) ⊆ H¹(ℚ_p, A)`, `Sel_`?`(T)` is the kernel of `H¹(ℚ_S/ℚ, A) → ∏_{ℓ∈S, ℓ≠p} H¹(ℚ_ℓ, A)/H¹_ur(ℚ_ℓ, A) × H¹(ℚ_p, A)/H¹_`?`(ℚ_p, A)`. Greenberg's condition is `H¹_Gr = ker(H¹(ℚ_p, A) → H¹(ℚ_p^ur, F⁻A))`; the Bloch–Kato condition is the limit of the Bloch–Kato finite parts `H¹_f` on the `Φ_{s,t}^{(j,k)}`-torsion of `A` along the height-two ideals of arithmetic points. Under `(F): Sel_BK(T) = Sel_Gr(T)`, independent of `(j, k)`, and its Pontryagin dual is a finitely generated torsion `H^{n.o.}_F`-module.

Hypothesis `(F)`. The `BK=Greenberg` comparison and cotorsion assertion are Ochiai Proposition `A`, pp. 116–117, with its local Iwasawa-module computation developed in Ochiai 2003 §4. Prove that computation for the actual branch lattice and arithmetic torsion system before applying it here. Arithmetic control retains global invariants, local inertia and localization-cokernel errors; their finite/bounded vanishing is an additional hypothesis, particularly at exceptional ordinary points.

The Greenberg condition is SelmerIwasawaCohomology Layer 2's Greenberg local condition for the filtration of §4.2; Selmer groups and their duals are L2's constructions over the coefficient ring `H^{n.o.}_F`. Equality of the two Selmer groups: at each arithmetic specialisation the ordinary Greenberg condition agrees with the Bloch–Kato finite condition up to finite error controlled uniformly (Ochiai, `A` generalization of the Coleman map, §4); pass to the limit. Torsionness: specialise to a weight and use Kato's cyclotomic theorem (§4.0.3) and the control theorem for Selmer groups (SelmerIwasawaCohomology Layer 3). For arithmetic control apply the supplier’s kernel-control exact sequence to the actual localization image, not automatically the full local-condition quotient. Ordinary direct-summand freeness does not kill inertia invariants or exceptional Euler factors.

Under `(F)` the dual Selmer group is torsion, which is what makes a characteristic ideal and a main conjecture meaningful.

- `familySelmer`: `Sel_`?`(T) ⊆ H¹(ℚ_S/ℚ, A)` for a local condition ? at p.
- `familySelmer_greenberg`: The Greenberg Selmer group `Sel_Gr(T)`.
- `familySelmer_bk_eq_gr`: `Sel_BK(T) = Sel_Gr(T)` under `(F)`.
- `familySelmer_dual_torsion`: The Pontryagin dual of `Sel(T)` is a finitely generated torsion `H^{n.o.}_F`-module.
- `familySelmer_specialise`: With the specified global-invariant, inertia and localization-cokernel control hypotheses, specialization along an arithmetic height-two ideal maps `Sel(T)[Φ]` to the Selmer group of `T_{f_κ}⊗χ^j⊗ωⁱ` with the controlled kernel and cokernel. Without those hypotheses retain the control-error terms.
- `familySelmer_mem_iff`: `A` global class belongs to `Sel_`?`(T)` exactly when each localization belongs to the specified unramified or `p`-local submodule.
- `familySelmer_map`: `A` continuous coefficient map compatible with the actual local conditions induces a map of Selmer kernels; this does not imply an arithmetic control isomorphism.

**Checks.**

- With the trivial local conditions everywhere (all of `H¹` allowed), the Selmer group is `H¹(ℚ_S/ℚ, A)`; Greenberg's condition is strictly smaller in general.
- At a fixed weight-two point, the arithmetic control comparison targets the Greenberg Selmer group of the specialized cohomological representation with its `χ^jωⁱ` twists. It is an isomorphism only when the specified invariant/inertia/localization error terms vanish; otherwise they remain in the comparison.
- The characteristic ideal of the dual is a principal ideal of `H^{n.o.}_F` when it is a regular ring (for example `O[[X₁, X₂]]`).
- `A` Bloch–Kato condition imposed at a single arithmetic point does not define a family Selmer group; the limit over `Φ_{s,t}` is required.

See [Ochiai](#ref-ochiai), §1, pp. 116–117, and Proposition A, p. 117.

This uses §4.2; `SelmerIwasawaCohomology`, §2.8; `SelmerIwasawaCohomology`, §2.2; `SelmerIwasawaCohomology`, §2.10; `SelmerIwasawaCohomology`, §3.11; `SelmerIwasawaCohomology`, §§3.18–3.21; §4.0.3.

### 4.4 The Selmer complex of the nearly ordinary deformation

With specified Greenberg and unramified local maps, form the Selmer fibre complex over `H=H^{n.o.}_F`. It is perfect only under the imported cochain/local-condition perfectness hypotheses. Its `H¹` is the extended compact Selmer module, with the local `H⁰` terms in its comparison to the classical compact Selmer group. For an arithmetic quotient `H→H/𝔓`, ambient derived base change gives a comparison whose cone is the sum of the local-condition comparison cones; it is an isomorphism only when these vanish. If `H` is a normal domain, this complex is perfect and generically acyclic, its inverse determinant has height-one divisor `Σ_i(−1)^i length H^i`; identifying that divisor with the dual classical Selmer characteristic ideal also requires the stated local-error and other-cohomology comparisons.

`(F)`; explicit local maps of complexes and their specialization comparisons. Supply perfectness over the actual possibly nonregular `H`, ambient derived base change, and the local correction-cone computations. Supply normality, generic acyclicity and the cohomology/duality comparisons for a scalar determinant formula. These extra conditions are not consequences of `(F)`.

Apply the lower-tier Selmer fibre construction to the actual local maps. Its long exact sequence retains local `H⁰` terms, so `H¹` need not equal the classical compact Selmer kernel. Tensor the fibre diagram in the derived category and use SelmerIwasawaCohomology §§3.8–3.10 (derived control and local correction complexes). The local comparison cones remain; `F⁺` being a direct summand over `H` does not make inertia cohomology commute with specialization. Once perfectness and generic acyclicity are proved, apply the supplier’s inverse determinant formula. Its divisor is the alternating cohomology-length sum. Specialize to a classical dual-Selmer characteristic ideal only after proving that the additional cohomology and local error divisors vanish or retaining them as factors.

This is the ordinary-family instance of the Selmer fibre construction, with the arithmetic representation and local maps fixed as above.

- `familySelmerComplex`: Selmer fibre from the specified Greenberg/unramified maps; perfectness requires the explicit supplier hypotheses.
- `familySelmerComplex_H1`: `H¹` is extended compact Selmer cohomology, with local `H⁰` terms in its comparison to the classical Selmer kernel.
- `familySelmerComplex_control`: Derived specialization comparison with the local-condition correction cones; an equivalence only when these cones vanish.
- `familySelmerComplex_det`: For a perfect generically acyclic complex over normal `H`, the inverse determinant has the alternating cohomology-length divisor; retain local-error factors.

**Checks.**

- For cohomology only in degrees one and two, the inverse determinant divisor is `char(H²)/char(H¹)`, rather than the divisor of `H²` alone unless the `H¹` divisor vanishes.
- At a weight-two arithmetic pair `(j=1,κ)`, the coefficient representation is `T_{f_κ}⊗χ⊗ωⁱ`. Derived specialization gives the corresponding Selmer complex only under ambient and local-map base change; otherwise its local correction cones remain.
- For the zero representation the Selmer complex is zero.
- A free local quotient with trivial inertia can still have exceptional invariants when its Frobenius specializes to 1. Direct-summand freeness does not prove that the unramified-condition comparison cone vanishes.

See [Ochiai](#ref-ochiai), §1, pp. 116–117; [EPW](#ref-epw), §3.1–§3.2, pp. 23–27.

This uses §4.2; §4.3; `SelmerIwasawaCohomology`, §§3.8–3.10; `SelmerIwasawaCohomology`, §§3.8–3.10; `SelmerIwasawaCohomology`, §3.9; `SelmerIwasawaCohomology`, §3.14.

### 4.5 Beilinson–Kato classes in Hida families

Under `(F)`, let `R` be the set of square-free integers prime to `S`. There is a family `Z(r) ∈ H¹(ℚ(ζ_r), T*(1))`, `r ∈ R`, unramified outside the primes above `S`, with the Euler system norm relations `Norm_{ℚ(ζ_{rq})/ℚ(ζ_r)} Z(rq) = P_q(Frob_q) Z(r)` for primes `q ∉ S` with `q ∤ r`, where `P_q(X)=det(1−Frob_q X|T)∈H^{n.o.}_F[X]` is computed using geometric Frobenius on `T`. In `P_q(Frob_q)` acting on the class, the argument instead denotes the image of geometric Frobenius in the abelian group `Gal(ℚ(ζ_r)/ℚ)`; the coefficient operator and this group-ring argument are distinct. For every arithmetic point `κ` and `1 ≤ j ≤ w(κ) + 1`, the specialisation `z_{(j,κ)}(1)` of `Z(1)` is Kato's zeta element for `f_κ` twisted by `χ^jωⁱ`, and the dual exponential of its image in `H¹_{/f}(ℚ_p, T_{(j,κ)}*(1))` equals `L^{(p)}(f_κ, ω^{i−j}, j)/((2π√−1)^{j−1} C^{(−1)^i}_{∞,κ}) · δ^{dR}_κ`, with `L^{(p)}` the L-function without its Euler factor at `p` and `C^±_{∞,κ}` complex periods.

Hypothesis `(F)`; `p ≥ 3`. Write `f*_κ` for the coefficient-conjugate dual form, with inverse nebentypus. The basis `δ^{dR}_κ` is the vector in `Fil^{w(κ)+2−j}V_dR(f*_κ)` corresponding to `f*_κ`; extend coefficients and use Ochiai’s identification with `Fil⁰ D_dR((V^{(j,κ)})*(1))`, with the same Tate and Teichmüller twists. The L-value is that of `f_κ`, while the dual form specifies this target line.

At each level `Np^t` and each cyclotomic level, The modular zeta elements of §4.0.1 lie in the étale cohomology of the modular curves; their ordinary projections are compatible under the trace maps in the weight (via the moment maps of §4.0.1) and in the cyclotomic variable (the norm relations of §4.0.1). The limit over both towers defines `Z(r)` in Iwasawa cohomology of `T*(1)`; the norm relations are inherited. The dual-exponential formula at arithmetic points is Kato's explicit reciprocity law (§4.0.2) at the specialised form.

At every arithmetic point the dual exponential of the specialised class is the critical L-value over the complex period (Proposition 1.2(3)).

- `bigKatoClass`: `Z(r) ∈ H¹(ℚ(ζ_r), T*(1))` for `r ∈ R`.
- `bigKatoClass_norm`: `Norm Z(rq) = P_q(Frob_q) Z(r)`.
- `bigKatoClass_unramified`: `Z(r)` is unramified outside the primes above `S`.
- `bigKatoClass_specialise`: Specialisation at `(j, κ)` is Kato's zeta element of `f_κ` twisted by `χ^jωⁱ`.
- `bigKatoClass_dualExp`: The dual exponential of its local image is the critical L-value over the complex period times `δ^{dR}_κ`.

**Checks.**

- For `q∉S`, `P_q(X)=1−tr(Frob_q|T)X+det(Frob_q|T)X²`. The linear coefficient is the negative trace in Ochiai’s geometric Frobenius/twist convention; transfer to `T_q` only after the normalization bridge.
- At a weight-two pair `(j=1,κ)`, `T` specializes to `T_{f_κ}⊗χ⊗ωⁱ`, and `Z(1)` specializes in `H¹(ℚ,(T_{f_κ}⊗χ⊗ωⁱ)*(1))`; retain this twist in comparison with Kato’s cohomological class.
- For a form with non-real nebentypus, coefficient conjugation changes the dual form and its de Rham basis; the numerator remains `L^{(p)}(f_κ,ω^{i−j},j)`, in agreement with §4.7.
- For `r=1` and `q∉S`, `Norm Z(q)=P_q(Frob_q)Z(1)`. This is a genuine norm relation, while `loc_{/f}(Z(1))` defines the two-variable L-function.
- With an arithmetic instead of a geometric Frobenius in `P_q` the norm relation fails already at a weight-two specialisation, where Kato's relation uses the geometric Frobenius; the convention is part of the definition.

See [Ochiai](#ref-ochiai), §1, Proposition 1.2 with the de Rham conventions before it, pp. 117–118; [KLZ](#ref-klz), §8, pp. 39–44.

This uses §4.1; §4.0.1; §4.0.2; `SelmerIwasawaCohomology`, §3.1.

### 4.6 The Perrin-Riou big logarithm in families

Let `M` be an unramified profinite `ℤ_p[G_{ℚ_p}]`-module (for the application, the unramified coefficient module obtained from the quotient of `T*(1)` dual to the `F⁺T` submodule, after removing its cyclotomic twist) and `D(M) = (M ⊗̂ ℤ_p^{ur})^{G_{ℚ_p}}` with Frobenius `φ`. There is a map `L_M : H¹(ℚ_p, M ⊗̂ Λ_Γ(−j_univ)) → D(M) ⊗̂ I^{−1}Λ_Γ`, where `I` is the kernel of specialisation at `j = −1`, functorial in `M` and commuting with `End_{ℤ_p[G_{ℚ_p}]}(M)`, with kernel `H⁰(ℚ_p, M)` and image under the pole-residue quotient `I⁻¹Λ_Γ/Λ_Γ` contained in `D(M)^{φ=1}`; for `M` finite free over `ℤ_p` it is Perrin-Riou's big logarithm. The application to the suitable unramified quotient of `T*(1)`, after removing its universal cyclotomic twist, is a regulator. Identifying it with Ochiai’s map `Ξ:H¹_{/f}(ℚ_p,T*(1))→Frac(H^{n.o.}_F)`, with his normalization, integrality and height-one length comparison, is a separate input; it does not follow from KLZ Theorem 8.2.3 alone.

`M` unramified and profinite; Hida-family coefficients for the application. `j_univ` denotes the universal cyclotomic character, not an integer. Use the quotient of the Tate dual induced by the dual of `F⁺T`, rather than ambiguously dualizing `F⁻`. Frobenius on `D(M)` has the KLZ unramified-coefficient convention. The residue is in `I⁻¹Λ/Λ`, not `Λ/I`.

Define `N(M) = D(M)[[π]]` with `φ` and its left inverse `ψ`, use Fontaine's isomorphism `H¹(ℚ_p, M ⊗ Λ_Γ(−j)) ≅ (π⁻¹N(M))^{ψ=1}` and the exact sequence for `1 − φ`; `φ` is invertible on `D(M)`, so `N(M)^{ψ=0} = D(M) ⊗̂ Λ_Γ`. Both sides commute with inverse limits, so the case of finite `M` suffices.

This roadmap constructs the KLZ unramified profinite-module regulator in its stated scope. Ochiai’s `Ξ` and the integral normalization/length comparison remain separate source inputs; the KLZ pole and `H⁰`-kernel prevent an automatic integral height-one isomorphism.

- `bigLogarithm`: `L_M` for an unramified profinite `M`.
- `bigLogarithm_natural`: `L_M` commutes with maps of unramified modules and with `End(M)`.
- `bigLogarithm_ker`: `ker L_M ≅ H⁰(ℚ_p, M)`.
- `bigLogarithm_specialise`: At characters of `Γ` it specialises to Bloch–Kato logarithms and dual exponentials with the Euler factors of KLZ.
- `familyColemanMap`: Ochiai’s `Ξ` with its separate normalization/integrality/length input; not identified with the preceding regulator without the integral normalization comparison.

**Checks.**

- For `M = 0` the map is zero.
- For `M = ℤ_p` with trivial action, `D(M) = ℤ_p`, `φ = 1`, and the kernel is `H⁰(ℚ_p, ℤ_p) = ℤ_p`.
- For `M` finite free over `ℤ_p`, `L_M` is Perrin-Riou's regulator (§4.0.2 and SelmerIwasawaCohomology Layer 3 conventions).
- The image is in `D(M) ⊗ I^{−1}Λ_Γ`, not in `D(M) ⊗ Λ_Γ`: a pole at `j = −1` can occur when `D(M)^{φ=1} ≠ 0`.

See [KLZ](#ref-klz), §8.2, Definition 8.2.1 and Theorem 8.2.3 with proof, p. 42 (arXiv v6); [Ochiai](#ref-ochiai), §1, Theorem B, p. 119.

This uses §4.2; `SelmerIwasawaCohomology`, §3.1; `SelmerIwasawaCohomology`, §3.6.

### 4.7 The two-variable `p`-adic L-function of a Hida family and the family reciprocity law

Under `(F)`, set `L_p(T) := Ξ(loc_{/f}(Z(1))) ∈ Frac(H^{n.o.}_F)`, integral when `H^{n.o.}_F` is integrally closed. Assume `H^{n.o.}_F` is normal and `L_p(T)` is nonzero on the chosen domain component for the following finite length/valuation assertion. Then (1) for every height-one prime `𝔭` of `H^{n.o.}_F`, `length_{(H^{n.o.})_𝔭} (H¹_{/f}(ℚ_p, T*(1))/loc_{/f}(Z(1)))_𝔭 = ord_𝔭(L_p(T))`; (2) for every arithmetic `(j, κ)` with `0 ≤ j − 1 ≤ w(κ)`, `(χ^{j−1} ∘ κ)(L_p(T))/C_{p,κ}` equals `(−1)^{j−1}(j − 1)!·(1 − ω^{i−j}(p)p^{j−1}/a_p(f_κ))·(p^{j−1}/a_p(f_κ))^{q(i,j)}·G(ω^{j−i})·L(f_κ, ω^{i−j}, j)/((2π√−1)^{j−1}C^{(−1)^i}_{∞,κ})`, with `C_{p,κ}` a `p`-adic period, `G` a Gauss sum and `q(i, j)` the `p`-order of the conductor of `ω^{i−j}`. The interpolation is derived from Kato's reciprocity law at each arithmetic point. The comparison with Layer 1’s Mazur–Kitagawa function is conditional on an integral analytic period identification; dense pointwise interpolation alone does not give a unit ratio on the branch.

`(F)`; Ochiai’s normalized `Ξ` and Theorem `B` input, which are not consequences of the abstract KLZ regulator. `H^{n.o.}_F` normal for integrality and the height-one `DVR` calculation, with `L_p(T)` nonzero on the chosen component for finite lengths. For the branch-unit comparison, an integral analytic identification of the two period lattices.

Construct `familyColemanMap_integral` in two steps. For [Ochiai03](#ref-ochiai03), Definition 3.1, p. 9, take `H` finite flat over `ℤ_p[[D_∞]]`, with `D_∞≃1+pℤ_p`, a free rank-two `H`-representation `T₀`, a free rank-one unramified submodule `F⁺T₀` with free rank-one quotient, and determinant `ψ₀χ⁻¹κ̃⁻¹` for a fixed Dirichlet character `ψ₀`. Form `R=H[[G_∞]]` and its cyclotomic deformation, retaining the Kummer dual for `H¹_{/f}`. Assume `R` is Gorenstein and its trivial finite-character factor `R_Δ` is a normal domain. Impose (MW) of Definition 3.7, p. 12: at every arithmetic pair of weights `(w,w′)` with `w′≥0`, the geometric Weil–Deligne Frobenius eigenvalues are algebraic, of complex absolute value `p^{(w′+1)/2−w}` if `N=0`, and `p^{w′/2−w}` on `ker N` and `p^{w′/2−w+1}` on `coker N` if `N≠0`. Choose a basis of `D=(F⁺T₀⊗̂ℤ_p^ur)^{G_{ℚ_p}}`. Theorem 3.13, p. 14, gives an injective `R_Δ`-linear map `Ξ` on `H¹_{/f}` with pseudo-null cokernel and the stated exponential interpolation. Its local-module calculation is in §4, pp. 17–27, and its construction in §5, pp. 27–37. The pseudo-null cokernel identifies the local source with `R_Δ` at every height-one prime, so the valuation formula follows by quotienting by the actual Euler-system class. For the broader branch coefficients satisfying `(F)`, construct the extension in the exact formulation asserted by [Ochiai](#ref-ochiai), Theorem `B` and Remark 1.3, pp. 119–120. This extension must establish its own integral image under normality and height-one comparison; the stronger Gorenstein and (MW) hypotheses of the 2003 author theorem cannot be silently discarded. Prove injectivity and the height-one cokernel-length equality in that formulation; these do not follow from a generic rank-one Euler-characteristic calculation. Specialize `Ξ` at `(j,κ)`, compare its dual exponential and Euler factors to §4.5, and obtain the interpolation formula. For `familyL_periodComparison`, construct an integral analytic map between the homology-period lattice of §1.4 and the de Rham regulator-period lattice on a fixed branch. Record its fractional correction ideal and prove it is a unit only under an integral lattice-isomorphism hypothesis. Under that hypothesis §1.11 and dense interpolation identify the scalar functions up to a branch unit; absent it retain the correction factor. This separates the reciprocity theorem from an unconditional assertion about differently normalized analytic functions.

The family reciprocity law is derived from the single-form reciprocity laws and the construction of `Ξ`, using the actual family class of §4.5.

- `familyColemanMap_integral`: the integral componentwise map `Ξ` with its actual coefficient, Gorenstein, (MW) and normality hypotheses in the first construction, and the separately proved branch-coefficient extension.
- `familyColemanMap_heightOne`: after localization at a height-one prime, `Ξ` identifies `H¹_{/f}` with the coefficient `DVR`; quotient by a nonzero class has length equal to its image valuation.
- `familyColemanMap_interpolation`: specialization is the normalized dual exponential with the factorial, Gauss and Euler factors of the displayed formula.
- `familyL_periodComparison`: the analytic lattice map and its fractional correction ideal; under an integral isomorphism it identifies the two scalar functions up to a unit.

**Checks for the regulator and periods.**

- Over a height-one `DVR`, the class `ϖ^n` in a source identified with the `DVR` has quotient `length n`, while the zero class gives a nontorsion quotient and no finite length.
- A pseudo-null cokernel vanishes at every height-one prime but may be nonzero at a closed codimension-two point; `Ξ` is not thereby a global isomorphism.
- Multiplying a period basis by a unit changes the scalar function by its inverse; multiplying it by `ϖ` changes the lattice correction and is not a unit change of basis.
- Equality up to arbitrary nonzero scalars at arithmetic points does not construct an analytic unit ratio: the function `X` is nonzero at many arithmetic points but is not a unit at `X=0`.

See [Ochiai](#ref-ochiai), §1, Theorem B with Remark 1.3, pp. 119–120.

This uses §4.6; §4.5; §1.12; §1.11; §4.0.2.

### 4.8 Euler system divisibility for the nearly ordinary deformation

Assume `(F)`, that `H^{n.o.}_F ≅ 𝒪[[X₁, X₂]]` for the ring of integers `𝒪` of a finite extension of `ℚ_p`, and that there are `τ ∈ G_{ℚ(μ_{p^∞})}` acting on `T` by a unipotent matrix `(1 P_τ; 0 1)` with `P_τ ≠ 0` and `τ′ ∈ G_ℚ` acting by `−1`. Then there is `k ≥ 0` such that for every height-one prime `𝔭` of `H^{n.o.}_F`, `length (Sel(T)^∨)_𝔭 ≤ length (H¹_{/f}(ℚ_p, T*(1))/loc_{/f}(Z(1)))_𝔭 + ord_𝔭(P_τ^k)`. Combined with §4.7, `(L_p(T)·P_τ^k) ⊆ char(Sel(T)^∨)`, equivalently a generator of `char(Sel(T)^∨)` divides `L_p(T)·P_τ^k`: one divisibility of Greenberg's two-variable main conjecture for Hida families, up to the factor `P_τ^k`.

`(F)`; `H^{n.o.}_F` a two-variable power series ring; the elements `τ`, `τ′` as stated.

Construct Kolyvagin derivative classes from `Z(r)`, retaining the nonzero unipotent entry `P_τ` in the denominator/control estimates. Use Ochiai’s specialization induction (Propositions 3.6 and 3.11 and §4), including non-arithmetic coefficient specializations, to descend the cyclotomic Euler-system bound to each height-one valuation of the deformation ring. A dense set of arithmetic height-two values alone does not control every height-one divisor. The defect is bounded by one fixed power `P_τ^k`. Identify the local quotient length with `ord_𝔭 L_p(T)` by §4.7. Work with the height-one characteristic divisor over `O[[X₁,X₂]]`, whose Krull dimension is three; a dimension-two Fitting/characteristic comparison is not used.

The hypotheses are visible: when `H^{n.o.}` is not regular, or no `τ` with nonzero `P_τ` exists, no bound is asserted.

See [Ochiai](#ref-ochiai), §1, Theorem C and the final Theorem, pp. 120–121; §2, Theorems 2.4 and 2.6.

This uses §4.5; §4.3; §4.7; §4.0.3; `PadicMeasuresIwasawaAlgebras`, §4.6 (Characteristic ideals).

### 4.9 Triangulations and the regulator over Coleman families

Let `f_α` be the normalized `p`-stabilization of a cuspidal newform `f` of weight `k+2≥2` and tame level `N` prime to `p`, with distinct Hecke roots and noncritical refinement (the noble hypotheses of LZ Definition 4.6.3) and `F` the Coleman family through it over an affinoid `disc V` of weight space (PadicFamilies L2), with Galois representation `M_V(F)*` over `O(V)`. After shrinking `V: (1)` the `(φ, Γ)`-module `D†_rig(M_V(F)*)` over the Robba ring over `O(V)` admits a canonical triangulation `0 → F⁺D → D → F⁻D → 0` with `F⁻D ≅ R_{O(V)}(α_F⁻¹)` and `F⁺D` a rank-one module given by `α_F·ε_F(p)⁻¹` twisted by `1 + κ_V`; (2) there is the Eichler–Shimura basis vector `ω_F` in `(F⁻D_V(F)(1+κ_V+ε_F^(p)))^{Γ=1}`, using `D_V(F)` rather than `D_V(F)*` as in LZ Theorem 6.4.1 specialising at each classical weight `t` to the differential of `f_t` (Eichler–Shimura in families); (3) for `A=O(V)` reduced and `α=α_F` a unit with `‖α‖≤1` and `α−1` a nonzerodivisor, LZ Lemma 6.2.2 and map (6.2.1) gives the injective single-family rank-one regulator `L_{A,α}:H¹_Iw(ℚ_{p,∞},R_A(α⁻¹))→A ⊗̂ O(𝒲)`, with its stated classical interpolation. The Rankin two-family quotient regulator and reciprocity of §7.1 require their additional second-family and tensor-quotient inputs. No constant-dimension crystalline module over the whole eigencurve neighbourhood is asserted: the triangulation exists only after shrinking around a noble point.

`f_α` is the normalized `p`-stabilization of a cuspidal newform of weight `k+2≥2` and tame level prime to `p`, with distinct Hecke roots and noncritical refinement; `V` is a sufficiently small affinoid disc around its weight. These noble hypotheses apply to all five constructions below (LZ Definition 4.6.3); a critical-slope nonsplit refinement can be noble. For the single-family regulator impose `A` reduced, `α` a unit of norm`≤1`, and `α−1` a nonzerodivisor as in Definition 6.2.1 and Lemma 6.2.2. Keep the dual/twist conventions of Theorems 6.3.2 and 6.4.1 when pairing with `ω_F`.

Liu's triangulation theorem for families of refined trianguline representations gives (1) at a non-critical point, after shrinking `V`. (2) is Andreatta–Iovita–Stevens's overconvergent Eichler–Shimura comparison composed with projection to `F⁻` (Sen theory in families). Apply LZ Lemma 6.2.2 and map (6.2.1), p. 29, to the stated single rank-one `R_A(α⁻¹)`, checking `α−1` is a nonzerodivisor. LZ Theorem 7.1.4 instead constructs a regulator for the `F⁻⁺` quotient of a Rankin pair of Coleman families; it is not a proof of the single-family assertion without those extra inputs. Its domain is `H¹_Iw(ℚ_{p,∞},R_A(α⁻¹))=R_A(α⁻¹)^{ψ=1}`, not ordinary `H¹` at a single local field.

Construct the nonordinary inputs in this layer: `colemanFamilyGaloisModule`, the rank-two compact-support cohomology summand with arithmetic control (LZ Theorem 4.6.6); the relative Robba functor and its base change (Theorem 6.1.2), Herr/Iwasawa identification (Corollary 6.1.4), and the noble-neighbourhood triangulation (Theorem 6.3.2); and the family Eichler–Shimura comparison with its dual/twist and basis normalization (Theorems 6.4.1–6.4.2). The general local-cohomology carriers use the lower SelmerIwasawaCohomology contracts, but these precise family comparison theorems are additional targets here. Prove the regulator of Definition 6.2.1 and Lemma 6.2.2 on `R_A(α⁻¹)`, with `α=α_F` and `‖α‖≤1`; for a positive-slope eigenvalue its inverse can have norm greater than one. The proof uses the `ψ/φ` exact sequence and `α−1` regularity. These targets concern a shrunk noble neighbourhood, not a triangulation over every critical eigencurve point.

- `colemanFamilyGaloisModule`: the rank-two family cohomology summand, with classical specialization and continuous Galois action.
- `colemanFamilyRobbaModule`: its relative Robba module, compatible with affinoid base change; `colemanFamilyRobbaModule_herrIw` identifies its `ψ=1` module with local Iwasawa cohomology.
- `colemanFamilyTriangulation`: the exact sequence on the shrunk noble neighbourhood, with the two explicit rank-one characters above.
- `colemanFamilyEichlerShimura`: the family comparison and normalized differential vector, with the indicated dual and character twists.
- `colemanFamilyRegulator`: the rank-one regulator on `R_A(α⁻¹)`; `colemanFamilyRegulator_specialise` gives its exponential interpolation.

**Checks for the nonordinary family constructions.**

- The ordinary 5-refinement of `E₄` has distinct roots 1 and 125 and is noncritical, but it is Eisenstein and `S₄(SL₂(ℤ))=0`; it does not satisfy the cuspidal hypothesis for these constructions.
- At a noble cuspidal classical point, the rank-two Galois specialization has the characteristic polynomial of the original refined eigenform, and the quotient `φ`-character is `α_F⁻¹`.
- If `v_p(α_F)>0` then `‖α_F‖<1` and `‖α_F⁻¹‖>1`; using the inverse as the norm-bounded regulator parameter is rejected.
- If `α=1` on a component, `α−1` is a zero divisor and the asserted injective regulator theorem does not apply.
- For a critical-slope nonsplit refinement, nobility can still hold; a critical split point cannot be included by replacing noncritical refinement with a numerical slope bound.
- Base change of the Robba module agrees with the single-point `(φ,Γ)`-module; a constant crystalline-period dimension over the neighbourhood is not required by this construction.

See [LZ](#ref-lz), §4.6, Theorem 4.6.6, p. 22; §6.3, Definition 6.3.1 and Theorem 6.3.2, pp. 29–30; §6.4, Theorems 6.4.1–6.4.2, p. 30; §7.1, Theorem 7.1.4, p. 31, and Theorem 7.1.5, p. 32 (arXiv v2); [LZ](#ref-lz), §4.6, Definition 4.6.3, p. 21; §6.2, Definition 6.2.1, Lemma 6.2.2 and (6.2.1), p. 29 (arXiv v2).

This uses §2.6; §2.9; §4.6; §4.0.2.

### Examples

For a two-term torsion complex [`A` —`f→ A`] in degrees 1 and 2 with `f≠0` over a normal domain, `H¹=0` and `H²=A/(f)`. Its inverse determinant has height-one divisor `+ord(f)`; switching to the determinant reverses the sign. This fixes the convention in §4.4. If `f=0` the complex is not generically acyclic and no torsion characteristic divisor is asserted.

At an ordinary arithmetic point the unramified quotient of `T*(1)` is dual to `F⁺T` with its Tate twist. Replacing it by the dual of `F⁻T` changes the Euler factor, so the local regulator uses the former. A local Coleman map with pseudo-null cokernel becomes an isomorphism at height one; quotient by a class mapping to `g` then has `DVR length ord(g)`. When `g=0` this quotient is not torsion and the finite-length formula requires the nonzero class hypothesis.

In a Coleman family `α` is the `U_p`-eigenvalue with `|α|≤1`, and the rank-one regulator is attached to `R_A(α⁻¹)`. Substituting `α⁻¹` for the bounded parameter itself would have norm`>1` at positive slope and violate the regulator’s hypothesis.

### Dependencies

Layer 1 supplies ordinary periods and measures; Layer 2 supplies the finite-slope eigenmodule; Layer 3 supplies the local eigenline. `IntegralHeckeAndGaloisDeterminants`, Layer 4, supplies determinant interpolation. `SelmerIwasawaCohomology`, §§2.21–2.24 and 3.8–3.14, supplies Selmer cones, control and their determinant comparisons; characteristic ideals use `PadicMeasuresIwasawaAlgebras`, §4.6, subject to the perfectness, local-error and normality hypotheses verified here. §4.0 constructs the finite-level modular zeta classes, reciprocity and cyclotomic bounds used by the family targets. The integral Coleman map, period bridge and Coleman-family relative Robba/triangulation interfaces are separately named targets in this layer, not consequences of pointwise interpolation.

## Layer 5: Totally real ordinary families and quaternionic periods

### 5.1 The nearly ordinary weight algebra of a totally real field

Let `F` be totally real of degree `d`, `p` odd, `U ⊆ GL₂(𝒪_F ⊗ Ẑ)` open compact with `U_v = GL₂(𝒪_{F,v})` for `v | p`, and `𝒪` the ring of integers of a finite extension of `ℚ_p`. Put `U^f = U ∩ A_f^×`, `Z(U_a) = U^f·𝒪_F^×/U^f_a·𝒪_F^×` and `Z(U) = lim_a Z(U_a)`; `G(U_a) ≅ (𝒪_F/p^a)^× × Z(U_a)` via `(a b; c d) ↦ (∏_{v|p}(a^{−1}d)_v, a)`, and `G(U) = lim_a G(U_a) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U)`. `Z(U)` has a maximal `ℤ_p`-free direct summand of rank `δ_F`, the `ℤ_p`-rank of the Galois group of the maximal abelian pro-`p` extension of `F` unramified outside `p`, generated by the reciprocity images `x_1`, …, `x_{δ_F}` of elements `γ_i^{p^{r_i}}`; for each `v_i | p` the units `𝒰_{v_i} ≡ 1 mod v_i` have a free summand of rank `d_i = [F_{v_i} : ℚ_p]` generated by `y^{(i)}_1`, …, `y^{(i)}_{d_i}`. The weight algebra is `Λ′_𝒪 = 𝒪[[X_1, …, X_{δ_F}, Y^{(i)}_j]]` (`δ_F + d` variables), and `𝒪[[G(U)]]` is a finite free `Λ′_𝒪`-module through `1 + X_i ↦ x_i`, `1 + Y^{(i)}_j ↦ y^{(i)}_j`, of rank the index of the closed subgroup `H` these generate. Its weight-two arithmetic points are the kernels of `Λ′_𝒪 → Q̄_p` with `1 + Y^{(i)}_j ↦ φ(y^{(i)}_j)` and `1 + X_i ↦ ψ(x_i)` for finite-order characters `φ` of `(𝒪_F ⊗ ℤ_p)^×` and `ψ` of `Z(U)`; they are Zariski dense in `Spec Λ′_𝒪`.

`p` odd; `U` maximal at p. `δ_F = 1 +` the Leopoldt defect of `(F, p)` by class field theory.

`G(U) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U)`: the map is well defined on `(U⁰_a·𝒪_F^×)/(U_a·𝒪_F^×)` and bijective by the definitions (Skinner–Wiles p. 32). `Z(U)` is `(𝒪_F ⊗ ℤ_p)^×` modulo the closure of the global units, with a finite torsion/idele-class contribution, possibly including `p`-primary torsion; its `ℤ_p`-rank is `d − rank(closure of 𝒪_F^×) = 1 + δ`, which by class field theory is the rank of the maximal abelian pro-`p` extension unramified outside p. `H≅ℤ_p^{δ_F+d}` has finite index in `G(U)`. Choose coset representatives; their group-like elements give a basis of `𝒪[[G(U)]]` as a module over `𝒪[[H]]=Λ′_𝒪`. This gives module freeness of rank `[G(U):H]`, not a canonical `Λ′_𝒪`-algebra isomorphism with `Λ′_𝒪[G(U)/H]` unless the extension splits. In one variable use kernels of evaluations `1+X↦ζ_{p^n}` for unbounded `n`. For `𝒪=ℤ_p` they are generated by `Φ_{p^n}(1+X)` (and `X` for `n=0`). These distinct height-one prime kernels are Zariski dense: a nonzero power series cannot lie in infinitely many distinct height-one primes in the two-dimensional Noetherian domain. For finite coefficient extensions choose the corresponding irreducible factors, and iterate this argument in each variable for products of finite-order characters. Conjugate roots may have the same kernel, and the linear polynomial `1+X−ζ` is not in `𝒪[[X]]` when `ζ∉𝒪`.

The `X`-variables see only the `ℤ_p`-free part of `Z(U)`; the torsion of `G(U)` (roots of unity, the finite quotient by global units) is not a weight variable. Nearly ordinary weight space includes the torus `(Y)` directions; the ordinary one-variable weight space of L0 is the parallel, untwisted slice.

- `nearlyOrdinaryWeightAlgebra`: `Λ′_𝒪 = 𝒪[[X_1, …, X_{δ_F}, Y^{(i)}_j]]`.
- `heckeGroup`: `G(U) = lim G(U_a) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U)`.
- `groupRing_free`: `𝒪[[G(U)]]` is finite free over `Λ′_𝒪` of rank `[G(U) : H]`.
- `deltaF_eq_rank`: `rank_{ℤ_p}` of the free part of `Z(U)` is `δ_F`.
- `totallyRealArithmeticPoint`: The weight-two point of finite characters `(φ, ψ)`.
- `arithmeticPoints_dense`: Weight-two arithmetic points are Zariski dense.

**Checks.**

- For `F=ℚ`, `d=δ_ℚ=1`, so `Λ′_𝒪=𝒪[[X,Y]]`. `X` is the chosen free central direction and `Y` the chosen free local-torus direction; the one-variable L0 comparison requires its specified parallel-weight slice, not an identification by the variable names alone.
- `F` real quadratic and abelian (Leopoldt holds by Brumer): `δ_F = 1`, so `Λ′_𝒪` has `1 + 2 = 3` variables.
- For `𝒪=ℤ_p`, the kernels of `1+X↦ζ_{p^n}`, `n=0`,1,2,…, are `X` and `Φ_{p^n}(1+X)`. They are distinct height-one prime ideals and dense in `Spec ℤ_p[[X]]`. Conjugate roots of the same order have the same kernel.
- For `F=ℚ`, allowing all central finite ideles would retain the unbounded valuations of `ℓⁿ` at `ℓ≠p`; the finite-level quotient uses global units instead.
- Non-example: `G(U)` itself is not the weight space; its torsion (e.g. `∏_{v|p} k_v^×` when `p` is unramified) gives the finite free `Λ′_𝒪`-module structure of rank `[G(U) : H] > 1`.

See [SW](#ref-sw), §3.2, p. 33 (Numdam PDF page 30; printed page = PDF page + 3); [SW](#ref-sw), §3.2, proof of Lemma 3.8, p. 38 (Numdam PDF page 35; printed page = PDF page + 3).

This uses Mathlib `MvPowerSeries`; Mathlib `Module.Free`; Mathlib `IsDedekindDomain.FiniteAdeleRing`; `PadicMeasuresIwasawaAlgebras`, §§0.1 and 1 (measures and completed group algebras).

### 5.2 Hida's ordinary projector on definite quaternionic forms

`F` is a totally real field of even degree `d`, `p` an odd prime, `D/F` the quaternion algebra ramified exactly at the infinite places, `X(U) = classSet U = D^×\G^D(A_f)/U` of `QuaternionicModularForms` §0.3 for open compact `U ⊆ GL₂(𝒪_F ⊗ Ẑ)` with `U_v = GL₂(𝒪_{F,v})` for `v | p`, `U_a = U ∩ U(p^a)` and `U⁰_a = U ∩ U₀(p^a)`, and `𝒪` the ring of integers of a finite extension `K` of `ℚ_p`. For an `𝒪`-module `R`, `H⁰(X(U_a), R)` is the module of `R`-valued functions on the finite set `X(U_a)`, with the Hecke operators `T₀(p) = [U_a (1 0; 0 p_p) U_a]` (`p_p` has component the rational integer `p` at every `v | p` and 1 elsewhere), `T₀(𝔭_i)` defined using a local uniformiser at `𝔭_i` and 1 elsewhere, the group `G(U_a)` and `T(ℓ)`, `S(ℓ)` for `ℓ ∤ p` with `U_ℓ` maximal. For `R` finite as a set, `e := lim_n T₀(p)^{n!}` is the finite ordinary projector of Layer 0a; for `R = 𝒪` it is the adic projector on the finite free module `H⁰(X(U_a), 𝒪)`; for `R = K/𝒪` it is the colimit of the projectors on the `𝒪/πⁿ`-coefficients. `e` is an idempotent commuting with the Hecke algebra `T(U_a, 𝒪)`, with change of coefficients `R → R′`, and with pullback and trace between levels `U_b ⊆ U_a`.

`F` even degree, `p` odd, `D` definite and unramified at all finite places. Use `p`-power level `a≥1` for the `U`-type operators and the assertion that the norm-form/constant subspace is killed by the ordinary projector. At maximal `p`-level `a=0`, `T_p` on constants instead has eigenvalue `Np+1`, a `p`-adic unit. Use the supplied `finite_classSet` for `X(U)` and construct the finite-central-fibre comparison below in this convention; the centre-quotiented definite class set is different.

Construct `definiteClassSet_finiteCentralFibres`: map `X(U_a)` to the centre-quotiented finite class set supplied by R18.3. Identify each central fibre with a quotient of the finite idele class group modulo the level’s central units. Use the reduced norm and the finite narrow ray class group at that level to prove this quotient finite; retain the finite kernel introduced by squaring central ideles under the reduced norm. Finiteness of `X(U_a)` is the specialization `definiteClassSet_finite` of the supplied `finite_classSet`; its finite fibres also follow directly by restriction to a fibre. The central-unit description additionally identifies the quotient map and its compatibility with every level-refinement map. Consequently `H⁰(X(U_a),R)` is finite for finite `R` and finite free for `R=O`. Apply §0a.2 and §0a.14; the `K/O` projector is the coefficient colimit by §0a.6. The double-coset identities of Skinner–Wiles show that the Hecke and level maps commute with `T₀(p)`, hence with every factorial power and its limit.

- `quaternionicOrdinaryProjector`: `e` on `H⁰(X(U_a), R)` for `R = 𝒪`, finite `R` and `K/𝒪`.
- `quaternionicOrdinaryProjector_eq_ordinaryProjector`: For finite `R` it is Layer 0a's ordinaryProjector of `T₀(p)`.
- `quaternionicOrdinaryProjector_comm_hecke`: `e` commutes with `T(U_a, 𝒪)`.
- `quaternionicOrdinaryProjector_pullback`: `e` commutes with pullback `H⁰(X(U_a), R) → H⁰(X(U_b), R)`, `b ≥ a`.
- `quaternionicOrdinaryProjector_trace`: `e` commutes with the trace `H⁰(X(U_b), R) → H⁰(X(U_a), R)`.

**Checks.**

- On `H⁰(X(U_a), 𝔽_p)` it equals `T₀(p)^{m!}` with `m = |H⁰(X(U_a), 𝔽_p)|`.
- On `R = 0` the projector is zero.
- At `U(p^a)`-level with `a≥1`, `T₀(𝔭)` acts on constant functions by `N𝔭`, divisible by `p`, so their ordinary projection is zero. At `a=0` the maximal-level `T_𝔭` eigenvalue is `N𝔭+1` and this conclusion does not hold.
- `e` is not the averaging idempotent over `G(U_a)`: averaging divides by #`G(U_a)`, which can be divisible by `p`, while `e` needs no division.

- `definiteClassSet_toCentralQuotient`: the natural surjection from `X(U_a)` to the centre-quotiented class set.
- `definiteClassSet_finiteCentralFibres`: its fibres are finite via the exact level central units and the ray-class reduced-norm comparison.
- `definiteClassSet_finite`: alias of `QuaternionicModularForms` §0.3’s `finite_classSet` for the specified `D`, `F` and `U_a`, using exactly its carrier and refinement maps.

**Checks for the central fibres.**

- Multiplying an idele representative by a central idele does not change the centre-quotiented class, but need not preserve its unquotiented class.
- A central element has reduced norm equal to its square, so the comparison retains a possible finite square-class kernel.
- Shrinking `U_a` changes the central congruence subgroup and its ray-class modulus; the proof uses the new modulus rather than a level-independent fibre count.

See [SW](#ref-sw), §3.2, pp. 32–34 (Numdam PDF pages 29–31; printed page = PDF page + 3).

This uses §0a.2; §0a.14; §0a.6; `QuaternionicModularForms`, §0.3; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.1; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.6; Mathlib `IsIdempotentElem`.

### 5.3 The nearly ordinary Hecke algebra `T_∞(U, 𝒪)`

`F` is a totally real field of even degree `d`, `p` an odd prime, `D/F` the quaternion algebra ramified exactly at the infinite places, `X(U) = classSet U = D^×\G^D(A_f)/U` of `QuaternionicModularForms` §0.3 for open compact `U ⊆ GL₂(𝒪_F ⊗ Ẑ)` with `U_v = GL₂(𝒪_{F,v})` for `v | p`, `U_a = U ∩ U(p^a)` and `U⁰_a = U ∩ U₀(p^a)`, and `𝒪` the ring of integers of a finite extension `K` of `ℚ_p`. Let `T(U_a, 𝒪) ⊆ End_𝒪(H⁰(X(U_a), 𝒪))` be generated by `T₀(p)`, the `T₀(𝔭_i)`, `G(U_a)` and `T(ℓ)`, `S(ℓ)` for `ℓ ∤ p` with `U_ℓ` maximal, and `T₂(U_a, 𝒪) := eT(U_a, 𝒪)`, its image in `End_𝒪(eH⁰(X(U_a), 𝒪))`. The transition maps `T₂(U_b, 𝒪) → T₂(U_a, 𝒪) (b ≥ a)` are surjective and `T_∞(U, 𝒪) := lim_a T₂(U_a, 𝒪)`. With `G(U) = lim_a G(U_a) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U)` there is a continuous map `𝒪[[G(U)]] → T_∞(U, 𝒪)`, making `T_∞(U, 𝒪)` an algebra over the weight algebra `Λ′_𝒪` of §5.1.

As in §5.2.

The transition maps are restrictions of Hecke operators along the pullback maps, which are compatible with `e`; surjectivity holds because generators map to generators. The `G(U_a)` act through the diamond-type operators, compatible in `a`, giving `𝒪[[G(U)]] → T_∞(U, 𝒪)` by the universal property of the completed group ring (PadicMeasuresIwasawaAlgebras §1). By the Jacquet–Langlands correspondence for definite quaternion algebras (HilbertModularVarietiesAndShimuraCurves R18.3), `T₂(U_a, 𝒪)` is Skinner–Wiles's Hecke algebra `eT*₂(U_a, 𝒪)` of Hilbert cusp forms of parallel weight two.

- `quaternionicHeckeAlgebra`: `T(U_a, 𝒪) ⊆ End_𝒪(H⁰(X(U_a), 𝒪))`.
- `quaternionicNearlyOrdinaryHeckeAlgebra`: `T₂(U_a, 𝒪) = eT(U_a, 𝒪)`.
- `quaternionicNearlyOrdinaryHeckeAlgebra_transition_surjective`: `T₂(U_b, 𝒪) ↠ T₂(U_a, 𝒪)` for `b ≥ a`.
- `hidaHeckeAlgebra`: `T_∞(U, 𝒪) = lim_a T₂(U_a, 𝒪)`.
- `hidaHeckeAlgebra_groupRingHom`: `𝒪[[G(U)]] → T_∞(U, 𝒪)`.
- `hidaHeckeAlgebra_lambdaAlgebra`: `T_∞(U, 𝒪)` as a `Λ′_𝒪`-algebra.

**Checks.**

- If `eH⁰(X(U_a), 𝒪) = 0` then `T₂(U_a, 𝒪) = 0`.
- The image of `g ∈ G(U_a)` in `T₂(U_a, 𝒪)` is the operator of `g` on `eH⁰(X(U_a), 𝒪)`.
- `T₂(U_a, 𝒪) ⊗ K` is the Hecke algebra of ordinary Hilbert cusp forms of parallel weight two and level `U_a` under Jacquet–Langlands.
- In a finite-level model where `U_p` acts by multiplication by `p` on a constant summand and by a unit on an ordinary summand, `eT` is the Hecke image on the latter and kills the former; retaining the constant summand gives the wrong ordinary algebra.

See [SW](#ref-sw), §3.2, pp. 32–33 (Numdam PDF pages 29–30).

This uses §5.2; §5.1; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.22; `PadicMeasuresIwasawaAlgebras`, §§0.1 and 1 (measures and completed group algebras); Mathlib `MvPowerSeries`.

### 5.4 The ordinary part does not grow in `Γ₀(p^a)`-level

`F` is a totally real field of even degree `d`, `p` an odd prime, `D/F` the quaternion algebra ramified exactly at the infinite places, `X(U) = classSet U = D^×\G^D(A_f)/U` of `QuaternionicModularForms` §0.3 for open compact `U ⊆ GL₂(𝒪_F ⊗ Ẑ)` with `U_v = GL₂(𝒪_{F,v})` for `v | p`, `U_a = U ∩ U(p^a)` and `U⁰_a = U ∩ U₀(p^a)`, and `𝒪` the ring of integers of a finite extension `K` of `ℚ_p`. For `a ≥ 2` the double coset `U⁰_a (1 0; 0 p_p) U⁰_a` equals `U⁰_a (1 0; 0 p_p) U⁰_{a−1}`, so `T₀(p)` maps `H⁰(X(U⁰_a), K/𝒪)` into the image of `H⁰(X(U⁰_{a−1}), K/𝒪)`, and `eH⁰(X(U⁰_a), K/𝒪) = eH⁰(X(U⁰_1), K/𝒪)`. Moreover `H⁰(X(U⁰_a), K/𝒪) = H⁰(X(U_a), K/𝒪)^{G(U_a)}`.

As in §5.2.

The double coset identity is a matrix computation at the places above p. Iterating, the image of `T₀(p)^{a−1}` lies in the level-`U⁰_1` forms, and `e` is a limit of powers of `T₀(p)` on which `T₀(p)` is invertible, so the ordinary part is contained in, hence equal to, the level-`U⁰_1` ordinary part. Invariants: `U⁰_a/U_a ≅ G(U_a)`-part acting on `X(U_a)`.

**Checks.**

- For `F=ℚ`, `p_p=p` at the unique place above `p`, recovering the rational level-drop identity.
- For `F=ℚ(√5)`, `p=5` and `a=2`, the local levels are `K₀(π⁴)` and `K₀(π²)`. With `g=diag(1,π)`, every element of `K₀(π⁴)gK₀(π⁴)` has lower-left entry divisible by `π⁴`, but `g(1 0;π² 1)` has entry `π³`. The single-uniformiser operator cannot give this rational-level drop.
- With `g=diag(1,p)`, use lower unipotent representatives `(1 0;p^{a−1}x 1)` for `K₀(p^{a−1})/K₀(p^a)`. Their conjugates by `g` have entry `p^a x` and lie in `K₀(p^a)`, giving the double-coset identity even at ramified places.

See [SW](#ref-sw), §3.2, definition of `T₀(p)`, p. 30, and proof of Proposition 3.3, p. 36 (Numdam printed pagination).

This uses §5.2; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.1.

### 5.5 Pontryagin duality for the ordinary quaternionic towers

`F` is a totally real field of even degree `d`, `p` an odd prime, `D/F` the quaternion algebra ramified exactly at the infinite places, `X(U) = classSet U = D^×\G^D(A_f)/U` of `QuaternionicModularForms` §0.3 for open compact `U ⊆ GL₂(𝒪_F ⊗ Ẑ)` with `U_v = GL₂(𝒪_{F,v})` for `v | p`, `U_a = U ∩ U(p^a)` and `U⁰_a = U ∩ U₀(p^a)`, and `𝒪` the ring of integers of a finite extension `K` of `ℚ_p`. Put `H_∞(U) = lim_→ eH⁰(X(U_a), K/𝒪)` and `H⁺_∞(U) = lim_→ eH⁰(X(U_a), K/𝒪)⁺` along pullbacks, and `M_∞(U) = lim_← eH⁰(X(U_a), 𝒪)⁺`, `M⁺_∞(U) = lim_← eH⁰(X(U_a), 𝒪)` along traces (the superscript `+` keeps the underlying module and changes the Hecke action to the adjoint action of Skinner–Wiles, p. 34; the norm-form subspace is a separate object killed by `e` at positive `p`-power level). These are `T_∞(U, 𝒪)`-modules, and the perfect pairings at finite level induce `T_∞(U, 𝒪)`-isomorphisms `M_∞(U) ≅ Hom_𝒪(H_∞(U), K/𝒪)` and `M⁺_∞(U) ≅ Hom_𝒪(H⁺_∞(U), K/𝒪)`.

As in §5.2. Pass to the cofinal levels at which stabilizer orders are units (in particular to free/neat levels), as required for the perfect integral pairing. The `+` notation denotes the adjoint Hecke module, not a subspace.

The pairing on functions on `X(U_a)` weighted by the stabiliser orders `c_{U_a}(x)` is perfect over `𝒪` when the stabilisers are trivial, which holds for a large (HilbertModularVarietiesAndShimuraCurves R18.3, integral pairing and neat level). For the stabilizer-weighted finite-level pairing, `t` acting on one side is adjoint to `t^adjoint` on the other; hence the `+` action makes the duality Hecke-linear. Pullback is adjoint to trace and `e` is compatible with adjoints. Passing to the cofinal perfect-pairing levels identifies the discrete direct-limit tower with the continuous dual of the compact inverse-limit tower. The algebraic CharacterModule baseline alone does not supply topological Pontryagin duality. The pinned CharacterModule is algebraic `Hom(A,ℚ/ℤ)`, not a topological Pontryagin dual. Finite-level character functions are continuous automatically. For the inverse/direct limits use the continuous duality interface of PadicMeasuresIwasawaAlgebras L0 with its compact/discrete topology; no character-module declaration alone supplies this passage.

See [SW](#ref-sw), §3.2, p. 35 (Numdam PDF page 32).

This uses §5.3; §5.2; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.5; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.4; Mathlib `CharacterModule`.

### 5.6 Hida's freeness theorem for definite quaternionic forms

Let `F` have even degree, with the definite quaternionic towers `M_∞(U)`, `M⁺_∞(U)` of §5.5, and suppose `U/(U∩F^×)` acts freely on `D^×\G^D(A_f)`. Prove that both towers are finitely generated projective `O[[G(U)]]`-modules, hence free of finite rank over `Λ′_O`. Their `Λ′`-rank is the `O`-rank of the augmentation fibre over `Λ′`. A formula multiplying the trivial torsion-character rank by #`G(U)_tors` requires equal ranks on all torsion-character factors; projectivity alone does not imply that equality. The source is Skinner–Wiles Proposition 3.3, after Hida, On nearly ordinary Hecke algebras for GL(2) over totally real fields, Adv. Stud. Pure Math. 17 (1989), Theorem 3.8. The additional finite-generation and descent targets below are part of the proof.

`[F:ℚ]` even and the indicated `U` action free. Work over the full completed group ring, retaining its `p`-primary and prime-to-`p` torsion. Establish control on every prime-to-`p` torsion-character factor. Equal factor ranks are needed only for the stated constant numerical rank formula, not for projectivity.

At each finite level the dual of all functions is free over `O[G(U_a)]`, by free action on the finite class set. Its ordinary part is an idempotent summand and is therefore projective, with potentially different ranks on different torsion factors. Construct `quaternionicOrdinary_twistedLevelControl`: after a finite unramified coefficient extension splitting prime-to-`p` torsion, the ordinary double-coset level-collapse of §5.4 holds in every `χ`-isotypical factor, with `χ` retained in the coefficient action. Use it to prove, for cofinal `b≥a`, that `P_b⊗_{O[G(U_b)]}O[G(U_a)]→P_a` is an isomorphism for the compact ordinary duals. Free action alone does not prove this ordinary coinvariant comparison. The same calculation bounds the number of generators at a fixed level in every `χ`-factor; the trivial factor alone would miss all nontrivial `χ`. Construct `quaternionicOrdinary_projectiveDescent`: for this compatible system of finite projectives, choose a cofinal level with fixed prime-to-`p` torsion quotient; subsequent augmentation kernels lie in the Jacobson radicals. Lift compatible finite idempotent presentations along these kernels, prove that the inverse-limit presentation is finite projective over `O[[G(U)]]`, and identify its base changes with `P_a`. This also proves completeness and finite generation of the limit. Descend the unramified coefficient extension faithfully flatly. Apply the identical argument to the adjoint Hecke action for `M⁺`. Finally `O[[G(U)]]` is finite free over the local `Λ′`, so a finite projective summand is finite free over `Λ′`.

These two named targets isolate the work behind the completed-group-ring assertion: the source’s trivial-invariant calculation must be extended to every torsion character, and finite-level projectives must be descended with their actual transition maps. Subsequent finiteness, control and period results use this full theorem. As a negative control, a projective module supported solely on a nontrivial prime-to-`p` character has zero trivial coinvariants but need not be zero; a bound on the latter cannot prove finite generation on the other factors.

- `quaternionicOrdinary_twistedLevelControl`: the ordinary coinvariant comparison at levels `b≥a` on each torsion-character factor, including a uniform finite generator bound.
- `quaternionicOrdinary_projectiveDescent`: the finite projective completed-group-ring module with its level-a base-change identifications.
- `quaternionicOrdinary_projectiveDescent_ext`: compatible level maps uniquely determine a continuous map of the complete limit modules.

**Checks for twisted control and descent.**

- For a prime-to-`p` cyclic torsion group, a projective module supported on a nontrivial character has zero trivial coinvariants and positive total rank; every character factor is necessary.
- For the identity ordinary operator on a finite free class-set permutation module, the ordinary summand is the whole module and control reduces to the stated free-action orbit calculation.
- For an ordinary operator zero on a direct summand, that summand contributes no inverse-limit ordinary generators.
- A compatible system of finite projectives without a uniform finite presentation need not have a finite limit; the Jacobson-radical lifting and fixed-level generator bound are part of the theorem.

See [SW](#ref-sw), §3.2, p. 35 (Numdam PDF page 32; printed page = PDF page + 3); [SW](#ref-sw), §3.2, proof of Proposition 3.3, p. 36 (Numdam PDF page 33; printed page = PDF page + 3).

This uses §5.1; §5.5; §5.4; §5.2; `HilbertModularVarietiesAndShimuraCurves`, R18.3; Mathlib `Module.Free`; Mathlib `IsLocalRing`.

### 5.7 Finiteness of the nearly ordinary Hecke algebra over `Λ′`

(Skinner–Wiles Corollary 3.4.) Let `F` have even degree. For every `U`, `T_∞(U, 𝒪)` is a finite torsion-free `Λ′_𝒪`-module; in particular it is a semilocal ring complete for its radical, the product of its localisations at its finitely many maximal ideals.

`[F : ℚ]` even. Use the twisted level-control and compatible projective-descent theorems of §5.6 on every torsion-character factor.

Choose a prime `ℓ ∤ 6` unramified in `F` such that `V = U ∩ U(ℓ)` acts freely modulo `F^×` (Skinner–Wiles Lemma 3.5, using the R18.3 neatness contract). Pullback `H⁰(X(U_a)) → H⁰(X(V_a))` is injective and commutes with the traces in `a`, so `M_∞(U) ↪ M_∞(V)`, compatibly with `T_∞(V, 𝒪) → T_∞(U, 𝒪)`; hence it is a map of `Λ′_𝒪`-modules. `M_∞(V)` is free of finite rank (§5.6), so `M_∞(U)` is finite and torsion-free over the Noetherian `Λ′_𝒪`. `T_∞(U, 𝒪)` acts faithfully on `M_∞(U)` (each `T₂(U_a, 𝒪)` acts faithfully on `eH⁰(X(U_a), 𝒪)⁺`, dual to its level-a quotient), so `T_∞(U, 𝒪) ↪ End_{Λ′_𝒪}(M_∞(U))` is finite and torsion-free; finite over the complete local `Λ′_𝒪` makes it semilocal and complete.

No freeness of `T_∞(U, 𝒪)` over `Λ′_𝒪` is claimed; only `M_∞(V)` is free.

See [SW](#ref-sw), §3.2, Corollary 3.4, p. 36 (Numdam PDF page 33; printed page = PDF page + 3).

This uses §5.6; §5.3; §5.5; `HilbertModularVarietiesAndShimuraCurves`, R18.3; Mathlib `Module.Finite`.

### 5.8 Hida's control theorem for nearly ordinary Hilbert forms

(Skinner–Wiles Proposition 3.7, after Hida, Adv. Stud. Pure Math. 17 (1989), Corollary 2.5.) Let `F` have even degree. If `λ : T_∞(U, 𝒪) → Q̄_p` is an `𝒪`-algebra homomorphism with `λ|_{Z(U)} = ψε^μ`, `μ ≥ 0`, where `ψ` and `φ = λ|_{(𝒪_F⊗ℤ_p)^×}` have finite order, then there is a nearly ordinary cuspidal automorphic representation `π` of parallel weight `k = (μ + 2)·t` such that `λ(T(ℓ))` and `λ(S(ℓ))` are the `T(ℓ)`- and `S(ℓ)`-eigenvalues of the newform of `π` for every prime `ℓ ∤ p` with `U_ℓ = GL₂(𝒪_{F,ℓ})`. The kernels of such `λ` are the algebraic primes of weight `k`.

`[F : ℚ]` even; `ε` is the cyclotomic character, viewed on `Z(U)` through reciprocity `Z(U) → Gal(F^{(p)}/F)`. Use the twisted level-control and compatible projective-descent theorems of §5.6 on every torsion-character factor.

For `μ=0` a finite-order weight character kills an open subgroup, so the algebra character factors through the appropriate finite-level ordinary Hecke quotient; prove this control quotient using §5.6, rather than asserting it from the bare definition of an inverse limit. For `μ>0` construct `quaternionicOrdinary_algebraicMoment`: evaluate the algebraic coefficient representation at the highest-weight line, with central character `ψε^μ` and finite local-torus character `φ`, and extend along the tower’s trace maps. For every `m≥1`, prove nilpotence of the ordinary operator on the kernel and cokernel of the moment map with coefficients `𝒪/ϖ^m`, allowing the exponent to depend on `m`. The non-highest-weight factors are uniformly contracting on these algebraic coefficient lattices; verify this contraction and the quotient-coefficient error modules, rather than infer integral annihilation from rational slopes. Apply ordinary exactness to these coefficient maps and the compatible complete inverse-limit comparison of §§0a.11–0a.15 to obtain the integral control isomorphism at the actual finite conductor. The integral error modules have zero ordinary factor; no single power need kill them. Combine with definite Jacquet–Langlands to obtain the stated automorphic eigensystem. This is the proof target behind Hida's Corollary 2.5 (Adv. Stud. Pure Math. 17, 1989) cited in Skinner–Wiles Proposition 3.7; it includes the algebraic coefficient calculation rather than treating the citation as an already available formal result.

Weights are parallel here: the torus character `φ` has finite order. Non-parallel weights need `λ|_{torus}` algebraic, which Proposition 3.7 does not treat.

- `quaternionicOrdinary_algebraicMoment`: highest-weight evaluation with central character `ψε^μ` and the finite torus character `φ`.
- `quaternionicOrdinary_algebraicMoment_trace`: the maps commute with the tower traces and the normalized ordinary Hecke operators.
- `quaternionicOrdinary_algebraicMoment_control`: the kernel and cokernel vanish on the ordinary factor, yielding the algebraic specialization quotient at its actual conductor.

**Checks for algebraic moments.**

- For `μ=0` the highest-weight representation is trivial and this is finite-character level control.
- On `Sym¹(ℤ₅²)`, highest-weight evaluation sends `X↦1`, `Y↦0`, and `U(X)=X`, `U(Y)=5Y`. The kernel has `U^nY=5^nY≠0` integrally, but is killed by `U^m` modulo `5^m` and has zero ordinary factor.
- Replacing `ψε^μ` by `ψ` gives the weight-two specialization and cannot recover the weight `μ+2` Hecke eigensystem.

See [SW](#ref-sw), §3.2, before Proposition 3.7, p. 37 (Numdam PDF page 34; printed page = PDF page + 3).

This uses §5.7; §5.1; §5.3; §§0a.11–0a.15; `GL2AutomorphicRepresentationsAndTransfer`, §§R16.6.3 and R16.6.5.

### 5.9 Weight-two algebraic primes are dense on every component

(Skinner–Wiles Lemma 3.8 and Corollary 3.9.) Let `Q` be a minimal prime of `T_∞(U, 𝒪)` and `𝒳(Q)` the set of algebraic primes of weight 2 containing `Q`. Then `𝒳(Q)` is Zariski dense in `Spec(T_∞(U, 𝒪)/Q)`. Consequently, if `V ⊇ U` and for all `P` in a Zariski-dense subset of `𝒳(Q)` some `λ ∈ ℋ(P)` factors through `T_∞(U, 𝒪) → T_∞(V, 𝒪)`, then `Q` is the inverse image of a minimal prime of `T_∞(V, 𝒪)`.

`[F : ℚ]` even; `ℋ(P)` is the finite set of `λ` with kernel `P`. Use the twisted level-control and compatible projective-descent theorems of §5.6 on every torsion-character factor.

`T_∞(U, 𝒪)/Q` is a domain, finite and torsion-free over `Λ′_𝒪` (§5.7), so `Λ′_𝒪 ↪ T_∞/Q` is a finite injective extension and `Spec(T_∞/Q) → Spec Λ′_𝒪` is surjective (lying over). Every prime of `T_∞/Q` over a weight-two arithmetic point of `Λ′_𝒪` is the kernel of some `λ` with finite-order restrictions, hence algebraic of weight 2 (§5.8 with `μ = 0`). The weight-two points of `Λ′_𝒪` are dense (§5.1). If the closure of `𝒳(Q)` were a proper closed subset of the irreducible `Spec(T_∞/Q)`, its image would be a closed subset of smaller dimension containing a dense set, which is impossible. Corollary 3.9: the `λ` factoring through `T_∞(V, 𝒪)` on a dense set put `Q` inside the closed set cut out by `ker(T_∞(U) → T_∞(V))`-compatible primes; a minimal prime of `T_∞(V, 𝒪)` below a generic point pulls back to `Q`.

The branch dominance used here follows from finiteness and torsion-freeness of the entire Hecke algebra over the weight domain: a minimal prime lying over a nonzero weight element would give a vertical generic component, contradicting torsion-freeness. Once its contraction is zero, the domain quotient is torsion-free over `Λ′`. This dominance precedes the lying-over and density argument.

See [SW](#ref-sw), §3.2, Lemma 3.8, p. 38 (Numdam PDF page 35; printed page = PDF page + 3); [SW](#ref-sw), §3.2, Corollary 3.9, p. 38 (Numdam PDF page 35; printed page = PDF page + 3).

This uses §5.7; §5.8; §5.1.

### 5.9a Classical Hilbert expansions and integral coefficients

For a totally real field `F`, odd `p`, parallel integral weight `k≥2`, a narrow ray class character `η` of the weight-compatible parity, and level `𝔫p^r` with `p∤𝔫`, construct `classicalHilbertQExpansion` at all polarization components and cusps. Start on a fine auxiliary tame level with an ordered invertible polarization ideal `c` prime to the auxiliary level, as in `HilbertModularVarietiesAndShimuraCurves`, §§H1.1–H1.10 and H2.2–H2.9. Use its Deligne–Pappas model at ramified `p`, its subgroup level of §H4.8, and its characteristic-zero Hodge/weight bundles of §§H5.3–H5.4. Retain their exact scalar-stabilizer character condition when descending by §§H3.6–H3.8; over integral ramified bases retain the unsplit real-multiplication module. Construct the formal Tate HBAV cusp charts and evaluate the weight bundle on their canonical differential. These cusp charts and the expansion principle are targets here, rather than exports of the representation-theoretic weight construction.

Prove `classicalHilbertQExpansion_injective` using expansions at a cusp on each component, with its level and trivialization fixed; include the principle that integral expansions descend the form to the coefficient subring. Define the integral lattice by these expansions with the cusp constants included. Prove `classicalHilbertQExpansion_baseChange` for flat extensions of the coefficient valuation ring, using the same lattice and all cusp charts; for `p`-adically complete flat coefficients use the compatible finite coefficient quotients and their inverse limit. No arbitrary nonflat lifting assertion is included. The source is Deligne–Ribet, [*Values of abelian L-functions at negative integers over totally real fields*](https://math.berkeley.edu/~ribet/Articles/deligne-ribet.pdf), §5, (5.1)–(5.7), pp. 259–262, in particular (5.4)–(5.5), p. 260. Include the comparison of their polarization and `Γ₀₀`-level conventions with the chosen Hilbert model, passing through the fine auxiliary level before descent.

Prove `classicalHilbertQExpansion_idealCoefficients`: the unit-equivariant positive Fourier coefficients at the narrow ideal-class representatives are equivalent to the normalized coefficients indexed by nonzero integral ideals, together with the separate cusp constants. Retain the weight, different and ideal-representative normalization factors and prove independence of representatives. Transport the good-prime and level-dividing Hecke formulas through this dictionary; its weight-`k`, character `χω^{1−k}` version is the coefficient carrier used in §5.10. Sources: Deligne–Ribet, §5, (5.2), (5.6)–(5.7), pp. 260–262, for cusp and analytic conventions; [DKV](#ref-dkv), §3.1, pp. 846–847, and §3.3, p. 850, for the normalized ideal-coefficient convention. The algebraic representation and rational multiplicity inputs are `GL2AutomorphicRepresentationsAndTransfer`, §§R16.6.3 and R16.6.5; they supply no Hilbert expansion theorem.

**Checks for expansions and injectivity.**

- For `F=ℚ`, the construction is the usual Tate-curve expansion, including its constant term.
- For a field with nontrivial narrow class group, expansion on just one component cannot detect a form supported on another component. Taking one cusp on every component detects it.
- A nonzero cusp form has a nonzero positive coefficient in some component; an Eisenstein series can have a nonzero cusp constant, which must be retained before testing equality.

**Checks for integral coefficient change.**

- Extension from `ℤ_p` to the integers of a finite extension of `ℚ_p` is flat; an integral expansion maps to the same coefficientwise expansion, without choosing a basis of the ramified coefficient ring.
- The identity coefficient map fixes every expansion. A compatible integral expansion is recovered from all its reductions modulo `ϖⁿ`; taking just its reduction modulo `ϖ` does not recover it.
- At ramified `p`, the embedding idempotents of `F⊗E` do not in general extend to `𝒪_F⊗𝒪_E`; integral coefficient change uses the unsplit model.

**Checks for the ideal-coefficient dictionary.**

- For `F=ℚ`, the ideal `(n)` coefficient is the `qⁿ` coefficient, while the constant term is separate.
- For nontrivial narrow class group, the ideal dictionary uses all class representatives. Restricting to principal ideals would lose coefficients from another narrow class.
- Rescaling a cusp differential by `x` multiplies its weight-`k` expansion by `Norm(x)^(−k)`, as in Deligne–Ribet (5.2). The normalization in the ideal dictionary compensates for this factor.

This uses `HilbertModularVarietiesAndShimuraCurves`, §§H1.1–H1.10, H2.2–H2.9, H3.6–H3.8, H4.8 and H5.3–H5.4; `GL2AutomorphicRepresentationsAndTransfer`, §§R16.6.3 and R16.6.5; `ModularForms`, Layer 0, for the elliptic specialization.

### 5.10 `Λ`-adic Hilbert modular forms and their ordinary parts

Let `F` be totally real, `p` odd, `E/ℚ_p` finite with ring of integers `𝒪_E`, `Λ = 𝒪_E[[T]]`, `u` a topological generator of `1 + pℤ_p` and `ν_k : Λ → 𝒪_E`, `T ↦ u^{k−1} − 1`, the weight-`k` specialisation. For a totally odd narrow ray class character `χ` of conductor `𝔫` prime to `p`, a `Λ`-adic Hilbert modular form of tame level `𝔫` and character `χ` is a family `F = (c(𝔞, F))_𝔞 ∈ Λ^{integral ideals}` together with constant terms, such that for every integer `k ≥ 2` the specialisation `ν_k(F)` is the `q`-expansion of a classical Hilbert modular form of parallel weight `k`, level `𝔫p` and character `χω^{1−k}`. They form a `Λ`-module `M(𝔫, χ)` with cuspidal submodule `S(𝔫, χ)`, Hecke operators `T_𝔩 (𝔩 ∤ 𝔫p)` and `U_𝔩 (𝔩 | 𝔫p)`. The ordinary projector `e = lim_n (∏_{𝔭|p} U_𝔭)^{n!}` defines the Hida families `M°(𝔫, χ) = eM(𝔫, χ)` and `S°(𝔫, χ) = eS(𝔫, χ)`, finite free over `Λ` by the separate parallel-weight construction/control target below, with Hecke algebras `T̃` and `T` acting on them.

`F` totally real; `p` odd; `χ` totally odd of conductor `𝔫` prime to `p`, with values in `E`; parallel weights. Finite freeness/control requires the parallel-weight Hida–Wiles construction below, in addition to the coefficient-family definition. The even-degree definite quaternionic theorem alone does not cover all totally real `F`.

Define the coefficient-family module using normalized ideal coefficients and all cusp constants, and transport the classical Hecke formulas coefficientwise. Use `classicalHilbertQExpansion`, its injectivity and its integral ideal-coefficient dictionary from §5.9a for this coefficient definition. Construct `parallelHilbertOrdinary_control` in all totally real degrees: the integral ordinary Hilbert cohomology/forms tower, the parallel-weight moment maps with character `χω^{1−k}`, the ordinary kernel/cokernel calculation and the first-coefficient Hecke duality. Prove uniform finite generation by ordinary control, and prove finite freeness using equality of the arithmetic fibre ranks and the integral duality, rather than torsion-freeness alone. Establish the finite-quotient locally finite operator hypotheses before taking the projector. These are the additional Hida–Wiles targets recalled in DKV §3.1; the definite quaternionic proof of §5.8 gives the even-degree comparison but is not substituted for this all-degree theorem. This construction uses the Hilbert geometry and weight bundles from `HilbertModularVarietiesAndShimuraCurves`, under the hypotheses of §5.9a, with its own ordinary tower and control proof. The integral cohomological coefficient lattice and its comparison with those bundles are part of `parallelHilbertOrdinary_control`; R16.6.3 supplies only the rational algebraic representation.

Weight-one specialisation `ν_1` is not required to be classical in the definition; Dasgupta–Kakde–Ventullo study it separately.

- `LambdaAdicHilbertForm`: The `Λ`-module `M(𝔫, χ)` of coefficient families specialising to classical forms of parallel weight `k ≥ 2`.
- `LambdaAdicHilbertForm.specialise`: `ν_k : M(𝔫, χ) → M_k(𝔫p, χω^{1−k})`.
- `lambdaAdicOrdinaryProjector`: `e = lim (∏_{𝔭|p}U_𝔭)^{n!}`.
- `hidaFamilies`: `M°(𝔫, χ) = eM(𝔫, χ)` and `S°(𝔫, χ)`, with Hecke algebras `T̃` and `T`.
- `hidaFamilies_free`: Finite freeness of `M°` and `S°` using `parallelHilbertOrdinary_control` and its integral rank/duality theorem.
- `hidaFamilies_specialise_ordinary`: At `k≥2`, ordinary specialization/control using that same theorem, retaining the finite character and conductor level.
- `LambdaAdicHilbertForm.ext`: Equality of every normalized ideal coefficient and all constant terms implies equality of Hilbert families. For cusp forms the constant terms are zero.

**Checks.**

- The ordinary Eisenstein family `E(1,χ)` specializes to `E_k(1,χω^{1−k})`, with the character regarded modulo an ideal divisible by every prime above `p` even when it is imprimitive there. Thus the `p`-divisor terms are omitted at weights `k≡1 mod(p−1)` too; constant terms are `2^{−[F:ℚ]}L_p(χω,1−k)` in the DKV convention.
- `ν_1(T) = 0`: weight one corresponds to the augmentation of `Λ`.
- For `F=ℚ`, compare `S°` with the L0 cuspidal `Λ`-adic module on the corresponding Teichmüller component and weight coordinate (`k−1` here versus L0’s convention); the ordinary Hecke duality is carried across that coordinate/component identification.
- A family specialising to a classical form at one weight only is not a `Λ`-adic form: the condition is imposed at every integer `k ≥ 2`.

- `parallelHilbertOrdinary_control`: the integral parallel-weight specialization at the actual finite character and conductor over every totally real `F`.
- `parallelHilbertOrdinary_heckeDuality`: the first ideal-coefficient pairing identifies the ordinary coefficient module with the dual Hecke algebra.
- `parallelHilbertOrdinary_finiteFree`: finite generation, control and the constant arithmetic fibre rank give the finite free `Λ`-module.

**Checks for parallel-weight control.**

- For `F=ℚ` the weight convention specializes to `k` and `χ ω^{1−k}` as stated, with its finite character retained.
- An odd-degree totally real `F` is included in this coefficient theorem although it has no quaternion algebra ramified at exactly all real places and no finite places.
- Torsion-freeness alone cannot give freeness: the ideal `(ϖ,T)` in `𝒪[[T]]` is torsion-free of rank one with two generators and a larger special fibre.

See [DKV](#ref-dkv), §3.1, (25)–(27) and the definitions of M(𝔫, χ), S(𝔫, χ), e, M°, S°, T̃, T, pp. 846–847.

This uses §5.9a; §0a.22; §0a.14; §5.8; `HilbertModularVarietiesAndShimuraCurves`, §§H1–H4 and H5.3–H5.4; `GL2AutomorphicRepresentationsAndTransfer`, §§R16.6.3 and R16.6.5; Mathlib `PowerSeries`.

### 5.11 `A` Hida family is determined by its Fourier expansion

Let `Λ_{(1)} = 𝒪_E[[T]]_{(T)}` be the localisation of `Λ` at the weight-one prime `(T)` (a discrete valuation ring in which `p` is invertible). The map `c : S°(𝔫, χ)_{(1)} → ∏_{𝔞 ⊆ 𝒪_F} Λ_{(1)}`, `H ↦ (c(𝔞, H))_𝔞`, sending a cuspidal Hida family to its normalised Fourier coefficients, is injective and `Λ_{(1)}`-linear.

`χ` of conductor `𝔫` prime to `p`; cuspidal families. `χ` totally odd as in §5.10.

A `Λ`-adic form is by definition a family of coefficients; the Fourier expansion map is injective on `S(𝔫, χ)` because a cuspidal Hilbert form is determined by its normalised coefficients `c(𝔞, ·)` (its constant terms vanish), so a family all of whose coefficients vanish specialises to zero at every `k ≥ 2`, hence is zero. For `H=f/s`, `s∉(T)`, whose coefficients vanish in each `Λ_(T)`, injectivity of `Λ→Λ_(T)` implies every coefficient of `f` is zero. Hence `f=0` by the coefficient-family definition and `H=0`. This common-denominator argument proves the stated map into the infinite product; flat localization need not commute with arbitrary products.

The common denominator belongs to the localized coefficient module before evaluating all coefficients; this is why the infinite product causes no localization-exactness assertion.

See [DKV](#ref-dkv), §3.3, p. 850.

This uses §5.9a; §5.10.

### 5.12 The localised cuspidal Hecke algebra is reduced at minimal tame level

Assume there exists a proper height-one Eisenstein prime `𝔪⊆T` generated by `T`, `T_𝔩 − (1 + χε(𝔩))` for `𝔩 ∤ 𝔫p` and `U_𝔩 − 1` for `𝔩 | 𝔫p` (the Eisenstein prime through `E₁(1, χ_S)`). If the tame character `χ` has conductor equal to the tame level `𝔫`, then the localisation `T_{(𝔪)}` is reduced: there are no `𝔫`-old forms, so `T_{(𝔪)} ⊗ Frac(Λ)` is a product of fields.

`cond(χ) = 𝔫`; the localisation at the height-one prime `𝔪`. `χ` totally odd. Supply parallel-weight ordinary control and the full minimal-tame-level newform semisimplicity input credited to Hida by DKV p. 857; prove this as the `parallelHilbertOrdinary_minimalLevelSemisimple` target below.

At tame level `cond(χ)=𝔫` all classical constituents are tame-new. Use the ordinary newform/control input including tame `U_𝔩` and the selected ordinary `U_𝔭` eigenvalues. Normality of `T_𝔩` away from `𝔫p` alone proves neither bad-prime semisimplicity nor reducedness of their enlarged image. Under that input, arithmetic specialization and multiplicity one give a reduced generic full Hecke image. The family image is `Λ`-torsion-free as a submodule of endomorphisms of the finite free ordinary module, hence embeds into the generic image; localizing at `𝔪` preserves reducedness. Prove `parallelHilbertOrdinary_minimalLevelSemisimple` by decomposing each controlled classical fibre into its newforms and verifying scalar action of every tame `U_𝔩` and the chosen ordinary `U_𝔭`, not only the good-prime `T_𝔩`. The character conductor equal to the tame level excludes tame oldspaces. Apply coefficient density and the faithful family action to conclude reducedness. DKV p. 857 credits this input to Hida, Ann. of Math. 128 (1988), Theorem 3.6 and Corollary 3.7, pp. 381–382; the target includes this proof and its bad-prime conventions.

The hypothesis `cond(χ) = 𝔫` is essential: with old forms at a prime `𝔩 | 𝔫`, `U_𝔩` has repeated eigenvalues on oldspaces and the Hecke algebra including `U_𝔩` can contain nilpotents.

See [DKV](#ref-dkv), §4, the paragraph before (50), p. 857.

This uses §5.10; §5.11; `GL2AutomorphicRepresentationsAndTransfer`, §R16.6.5; Mathlib `IsReduced`.

### 5.13 The total ring of fractions of the localised Hecke algebra and its eigenfamilies

Under the hypotheses of §5.12, let `L = Frac(T_{(𝔪)})` be the total ring of fractions. Then `T_{(𝔪)} ↪ L` and `L ≅ ∏_{i=1}^t L_{H_i}`, a finite product of fields, each a finite extension of `Frac(Λ)` corresponding to a cuspidal Hida eigenfamily `H_i`; the image of `T_𝔞` in `L_{H_i}` is the normalised coefficient `c(𝔞, H_i)`. These coefficients generate a finite local `Λ`-subalgebra `Λ_{H_i} ⊆ L_{H_i}`, the image of `T_{(𝔪)}` in `L_{H_i}` is the localisation of `Λ_{H_i}` at a height-one prime `𝔪_{H_i}` over `(T)`, and `c(𝔩, H_i) ≡ 1 + χ(𝔩) mod 𝔪_{H_i}` for `𝔩 ∤ 𝔫p` and `c(𝔩, H_i) ≡ 1 mod 𝔪_{H_i}` for `𝔩 | 𝔫p`: each `H_i` specialises at `𝔪_{H_i}` to the weight-one form `E₁(1, χ_S)`.

As in §5.12. Supply the finite ordinary-module/control and full Hecke reducedness inputs of §5.10 and §5.12. The algebraic total-quotient-ring step is routine once the finite reduced Hecke algebra is available.

A reduced Noetherian ring has finitely many minimal primes; localizing at all nonzerodivisors gives the product of the fraction fields of its minimal-prime quotients. The pinned Mathlib FractionRing is precisely this total quotient localization for any commutative ring, although it has a field instance only under domain hypotheses. For this finite torsion-free `Λ`-algebra the factors are finite over `Frac(Λ)`. The minimal primes of `T_{(𝔪)}` correspond to the Hecke eigensystems in `S°(𝔫, χ) ⊗ Frac(Λ)ᵃˡᵍ` that specialise into `𝔪`, i.e. to cuspidal Hida eigenfamilies; the field of each is generated over `Frac(Λ)` by its coefficients. The congruences are the description of `𝔪` by its generators.

Each eigenfamily `H_i` specialises at `𝔪_{H_i}` to `E₁(1, χ_S)`, as the congruences (51) state.

See [DKV](#ref-dkv), §4, (50) and (51), p. 857.

This uses §5.12; §5.11; §5.10; Mathlib `IsReduced`; Mathlib `FractionRing`.

### 5.14 Period modules of totally real Hida families

In the setting of §5.5, let `𝔪` be a maximal ideal of `T_∞(U, 𝒪)` and `T_𝔪` the localisation. The period module of the family at `𝔪` is the `T_𝔪`-module `P_𝔪 := M_∞(U)_𝔪` (and `P⁺_𝔪 := M⁺_∞(U)_𝔪`). It is faithful and finite over `T_𝔪`, and free over `Λ′_𝒪` when `U` acts freely and the twisted level-control and projective-descent theorems of §5.6 hold. It is exported as an invertible `T_𝔪`-module, with trivialisations `P_𝔪 ≅ T_𝔪` unique up to `T_𝔪^×`, only under the explicit hypothesis that `P_𝔪` is free of rank one over `T_𝔪` (an additional integral multiplicity-one hypothesis); without it `P_𝔪` has generic rank one at each minimal prime of `T_𝔪` whose classical specialisations are newforms of level exactly `U`, by multiplicity one for the definite quaternion algebra and strong multiplicity one, but need not be invertible. For `F = ℚ` (degree one, with the indefinite modular curve in place of the definite quaternion algebra) the corresponding object is Layer 1's family period line, and the change-of-trivialisation formula is §1.11.

`F` of even degree; `U` acting freely for the `Λ′`-freeness; for invertibility, the hypothesis that `P_𝔪` is free of rank one over `T_𝔪`. Use the twisted level-control and compatible projective-descent theorems of §5.6 on every torsion-character factor.

Using the finite-generation theorem of §5.6, `M_∞` is finite over the Hecke algebra and faithful by its image definition. For a finite module, annihilators localize; hence its localization at every maximal ideal is faithful and nonzero. Alternatively use the finite semilocal factor decomposition. Faithfulness without finite generation would not justify this step. Generic rank one: at a minimal prime the dense weight-two specialisations (§5.9) are quaternionic eigenforms whose eigenspaces in `eH⁰(X(U_a), K)` are one-dimensional when the corresponding Hilbert newform has level exactly `U` (Jacquet–Langlands and multiplicity one for `D^×`, HilbertModularVarietiesAndShimuraCurves R18.3). Invertibility: a finite faithful module that is free of rank one is invertible; trivialisations differ by units. No such statement is made without the hypothesis.

Integral invertibility requires rank one over the Hecke algebra itself. Freeness over the weight algebra and generic multiplicity one do not supply it.

- `quaternionicPeriodModule`: `P_𝔪 = M_∞(U)_𝔪` as a `T_𝔪`-module.
- `quaternionicPeriodModule_faithful`: `P_𝔪` is a faithful finite `T_𝔪`-module.
- `quaternionicPeriodModule_free_lambda`: `P_𝔪` is `Λ′`-free when `U` acts freely and the twisted-control and projective-descent conclusions of §5.6 hold.
- `quaternionicPeriodModule_invertible_of_free`: If `P_𝔪 ≅ T_𝔪`, it is invertible and trivialisations differ by `T_𝔪^×`.
- `quaternionicPeriodModule_compat_rational`: For `F = ℚ` with the modular curve in place of the definite algebra, the analogue is §1.4.

**Checks.**

- If `T_𝔪 = Λ′_𝒪` (a single family étale over weight space) and `M_∞(U)_𝔪` is free of rank one over `Λ′_𝒪`, then `P_𝔪` is invertible with trivialisations `Λ′_𝒪^×`.
- A finite faithful `M_∞` has support all of `Spec T_∞`. Thus every maximal ideal `𝔪` of a nonzero `T_∞` has `P_𝔪≠0`; a zero period module at such an ideal would contradict faithfulness. The zero ring has no maximal ideal.
- When two newforms of level `U` are congruent modulo `𝔪` and `T_𝔪` is not Gorenstein, `P_𝔪` can be faithful of generic rank one without being free over `T_𝔪`; it is then not exported as invertible.
- A change of trivialisation multiplies the resulting scalar family by a unit of `T_𝔪`, as in §1.11.

See [SW](#ref-sw), §3.2, pp. 35–37 (Numdam PDF pages 32–34), and §3.3.

This uses §5.5; §5.3; §5.6; §5.9; §1.4; §1.11; `HilbertModularVarietiesAndShimuraCurves`, §R18.3.22.

### Examples

For `F=ℚ` the parallel coordinate `ν_k(T)=u^{k−1}−1` has `ν_1(T)=0`; its coordinate translation to the elliptic convention of Layer 0 is necessary before comparing families. The normalized local parameter `π=T/log_p(u)` satisfies `π(k)=(k−1)+O((k−1)²)`, fixing the derivative normalization at weight 1. This `π` is a parameter after inverting `p` and must not be confused with the integral coefficient uniformizer `ϖ`.

If `G=Δ×ℤ_p^r`, a coefficient extension splitting `Δ` gives `𝒪[G/Δ′]` character factors for its prime-to-`p` quotient. Each factor has its own ordinary rank, possibly 0. Freeness over the whole semilocal weight algebra means projectivity with a locally constant rank, not equality of all those ranks. For an open subgroup `H⊂G` of index `d`, the completed group algebra is free over `𝒪[[H]]` with `d` coset representatives; tensoring with the augmentation has quotient by the closed ideal generated by `h−1`, not by all `g−1`.

### Dependencies

Layer 0a supplies module projectors and compact exactness; `QuaternionicModularForms`, §0.3, supplies the unquotiented finite class set and refinement maps. Layer 1 supplies the period convention and congruence comparisons. `HilbertModularVarietiesAndShimuraCurves`, R18.3, supplies centre-quotiented definite spaces and pairings; the finite central-fibre theorem here relates them to the unquotiented tower. `HilbertModularVarietiesAndShimuraCurves`, §§H1–H4 and H5.3–H5.4, supplies the classical Hilbert geometry and weight bundles under §5.9a’s hypotheses. `GL2AutomorphicRepresentationsAndTransfer`, §§R16.6.3 and R16.6.5, supplies algebraic weight representations and representation-theoretic multiplicity exports; §5.9a constructs the expansion/ideal-coefficient dictionary. `PadicMeasuresIwasawaAlgebras` supplies completed group algebras. Twisted-level ordinary control, semilocal projective descent and the all-degree parallel Hilbert ordinary construction are explicit targets here; definite even-degree freeness is not used as an all-degree theorem.

## Downstream consumers

The ordinary period and branch-measure constructions supply family normalisations for integral Iwasawa applications. Automorphic congruences and level optimisation use the raw annihilator congruence module and specialise its Hecke-module instances; higher-codimension Ext congruence constructions retain their own definitions. Automorphy and patching arguments use the ordinary projector on complete coefficient complexes, the finite-slope Hecke image, and the ordinary Hilbert tower with its full torsion-character decomposition. Critical-value and Euler-system applications consume the exact eigensymbol line and regulator comparison, including the exceptional and pole terms, rather than an unspecified period scalar.

## References

<a id="ref-kt"></a>

**KT.** Chandrashekhar Khare and Jack A. Thorne, [Potential automorphy and the Leopoldt conjecture](https://arxiv.org/pdf/1409.7007v2). arXiv:1409.7007v2 (6 July 2016), 50 pages; published in Amer. J. Math. 139 (2017), no. 5, 1205–1273. Page numbers are those of the arXiv v2 PDF.

<a id="ref-hida"></a>

**Hida.** Haruzo Hida, [Iwasawa modules attached to congruences of cusp forms](https://www.numdam.org/item/10.24033/asens.1507.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), no. 2, 231–273, DOI 10.24033/asens.1507; Numdam open-access scan (44 pages; printed page = PDF page + 229).

<a id="ref-sharifi-aws"></a>

**SharifiAWS.** Romyar Sharifi, [Modular curves and cyclotomic fields](https://www.math.ucla.edu/~sharifi/aws-iwasawa.pdf), Arizona Winter School notes, Chapter 4, §§4.2–4.3, pp. 44–52. The weight-two coordinate and inverse-diamond convention are specified separately there.

<a id="ref-buzzard"></a>

**Buzzard.** Kevin Buzzard, [Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf). Author manuscript dated 2 August 2006; published in *L-functions and Galois representations* (Durham, 2004), London Math. Soc. Lecture Note Ser. 320, Cambridge Univ. Press, 2007, 59–120. Page numbers are those of the manuscript (PDF page = manuscript page).

<a id="ref-conrad"></a>

**Conrad.** Brian Conrad, [Modular curves and rigid-analytic spaces](https://math.stanford.edu/~conrad/papers/genpaper.pdf). 51-page author manuscript (PDF metadata 20 January 2006); published in Pure Appl. Math. Q. 2 (2006), no. 1, 29–110. Page numbers are those of the manuscript.

<a id="ref-chenevier"></a>

**Chenevier.** Gaëtan Chenevier, [Familles p-adiques de formes automorphes pour GL_n](http://gaetan.chenevier.perso.math.cnrs.fr/articles/glnfam.pdf). Author copy glnfam.pdf (74 pages, PDF metadata 9 March 2008; internal page numbering); published in J. reine angew. Math. 570 (2004), 143–217, DOI 10.1515/crll.2004.031

<a id="ref-bellaiche09"></a>

**Bellaïche09.** Joël Bellaïche, [Critical p-adic L-functions](https://arxiv.org/pdf/0912.2925v1). arXiv:0912.2925v1 (15 December 2009), 44 pages; published in Invent. Math. 189 (2012), 1–60. Page numbers are those of the arXiv PDF (printed page = PDF page).

<a id="ref-sw"></a>

**SW.** C. M. Skinner and A. J. Wiles, [Residually reducible representations and modular forms](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (123 pages, OCR text layer; printed page = PDF page + 3).

<a id="ref-epw"></a>

**EPW.** Matthew Emerton, Robert Pollack and Tom Weston, [Variation of Iwasawa invariants in Hida families](https://arxiv.org/pdf/math/0404484v1). arXiv:math/0404484v1 (2004), 50 pages; published in Invent. Math. 163 (2006), no. 3, 523–580. Page numbers are those of the arXiv v1 PDF (printed page = PDF page).

<a id="ref-pilloni"></a>

**Pilloni.** Vincent Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), no. 9, 1647–1807; author's copy, whose page numbers are used here.

<a id="ref-bcgp"></a>

**BCGP.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3). arXiv:1812.09269v3 (28 November 2021), 292 pages; published in Publ. Math. IHÉS 134 (2021), 153–501. Page numbers of the arXiv v3 PDF.

<a id="ref-dkv"></a>

**DKV.** Samit Dasgupta, Mahesh Kakde and Kevin Ventullo, [On the Gross–Stark conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v188-n3-p03-s.pdf). Ann. of Math. (2) 188 (2018), no. 3, 833–870; the journal's free PDF (printed page = PDF page + 832).

<a id="ref-ochiai"></a>

**Ochiai.** Tadashi Ochiai, [Euler system for Galois deformations](https://aif.centre-mersenne.org/item/10.5802/aif.2091.pdf). Ann. Inst. Fourier (Grenoble) 55 (2005), no. 1, 113–146; Centre Mersenne / Numdam open-access PDF (journal page = PDF page + 111).

<a id="ref-klz"></a>

**KLZ.** Guido Kings, David Loeffler and Sarah Livia Zerbes, [Rankin–Eisenstein classes and explicit reciprocity laws](https://arxiv.org/pdf/1503.02888v6). arXiv:1503.02888v6 (21 November 2023, with the November 2023 correction), 67 pages; published in Cambridge J. Math. 5 (2017), 1–122. Page numbers of the arXiv v6 PDF.

<a id="ref-lz"></a>

**LZ.** David Loeffler and Sarah Livia Zerbes, [Rankin–Eisenstein classes in Coleman families](https://arxiv.org/pdf/1506.06703v2). arXiv:1506.06703v2 (2 June 2016), 40 pages; published in Res. Math. Sci. 3 (2016), Paper 29. Page numbers of the arXiv v2 PDF.

<a id="ref-ikm"></a>

**IKM.** Srikanth B. Iyengar, Chandrashekhar B. Khare and Jeffrey Manning, [Congruence modules and the Wiles–Lenstra–Diamond numerical criterion in higher codimensions](https://arxiv.org/pdf/2206.08212v3). arXiv:2206.08212v3 (84 pages); published in Invent. Math. 238 (2024), 769–864. Page numbers of the arXiv v3 PDF.

<a id="ref-bellaiche11"></a>

**Bellaïche11.** Joël Bellaïche, [Critical p-adic L-functions (later author version)](https://people.brandeis.edu/~jbellaic/preprint/criticalbeforepublication2.pdf). 51-page author copy criticalbeforepublication2.pdf, PDF metadata 22 July 2011; internal page numbers. Distinct from arXiv:0912.2925v1 and not identified with the 60-page published edition.

<a id="ref-acc"></a>

**ACC.** Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze, Taylor and Thorne, [Potential automorphy over CM fields (2023 author copy)](https://annals.math.princeton.edu/2023/197-3/p03). Ann. of Math. 197 (2023), 897–1113; the authors' copy carries the published pagination, which the locators use.

<a id="ref-conrad-ic"></a>

**Conrad-IC.** Brian Conrad, [Irreducible components of rigid spaces](https://www.numdam.org/item/AIF_1999__49_2_473_0/). Ann. Inst. Fourier 49 (1999), no. 2, 473–541; Numdam open-access scan (printed page = PDF page + 471). Locators use the journal pagination.

<a id="ref-ochiai03"></a>

**Ochiai03.** Tadashi Ochiai, [A generalization of the Coleman map for Hida deformations](https://www.ochiai.math.sci.titech.ac.jp/coleman.pdf). Author manuscript, 37 pages plus references; published in Amer. J. Math. 125 (2003), 849–892. Locators use the manuscript’s numbering, in particular Theorem 3.13, rather than the published renumbering.

<a id="ref-pollack"></a>

**Pollack.** Robert Pollack, [On the p-adic L-function of a modular form at a supersingular prime](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf). Duke Math. J. 118 (2003), 523–558; author-hosted journal copy, published pagination.

<a id="ref-kato"></a>

**Kato.** Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290; locators use the printed pagination.

<a id="ref-rjw"></a>

**RJW.** Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/pdf/2309.15692v2). arXiv:2309.15692v2; locators use the preprint section numbering.
