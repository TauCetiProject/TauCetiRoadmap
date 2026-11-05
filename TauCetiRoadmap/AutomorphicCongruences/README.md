# Roadmap: automorphic congruences and reverse main-conjecture divisibilities

**Summary.** Eisenstein congruences produce integral Galois extension classes and lower bounds for Selmer groups. This roadmap builds the source-specific ordinary and semi-ordinary congruence arguments, their period and local-condition comparisons, and their transport to universal deformation families and cyclotomic towers. The endpoints are the Skinner–Urban divisibilities, the precisely localized Castella–Liu–Wan bounds, the Fouquet–Wan family and pointwise theorems, Wan's Hilbert-family divisibility and the rational and integral ordinary elliptic-curve main conjectures under the rank-one image condition of Burungale–Castella–Skinner. Each retains its own residual, local, coefficient-ring and period hypotheses. The roadmap is this README; [Suggested.lean](Suggested.lean) names the headline theorems and the carriers that the pinned libraries lack for stating them.

## Scope and ownership

This roadmap owns the Skinner–Urban (SU), Castella–Liu–Wan (CLW), Fouquet–Wan (FW), Wan and Burungale–Castella–Skinner (BCS) instances of Eisenstein data, their integral boundary and Fourier-coefficient identities, the congruence-to-Selmer bounds, and the compatibility maps assembling those endpoints. Layer 0 fixes Σ-primitive Selmer groups, Eisenstein ideals, the polarized lattice theorem and the CM congruence input; Layer 1 is the ordinary GU(2,2) construction; Layer 2 the semi-ordinary and general-weight GU(3,1) constructions with the Beilinson–Flach reciprocity; Layers 3–4 the universal deformation families and zeta morphisms; Layer 5 the totally real Wan–Fujiwara engine; Layers 6–7 the BCS two-variable and cyclotomic arguments; Layer 8 collects the elliptic endpoints. It does not construct a second general theory of modular forms, continuous cohomology, deformation rings, Selmer structures, determinant lines or characteristic divisors.

The following statements have no other owner and are targets here, in the generality used: the polarized three-block lattice theorem of shape 1+n+1 for a CM quadratic extension of a totally real field and every middle rank n ≥ 1 (§0.7; the rank-two Ribet theorem of IntegralHeckeAndGaloisDeterminants Layer 6 is a different statement); the CM theta-family congruence divisibility (§0.9; its integral cases outside Hid06 and HT94 Theorem 0.3 are gap:cm-congruence-katz-integral); Ichino's triple product formula (§2.4); Harris's exclusion of holomorphic Klingen-type CAP eigensystems (§2.6); Ikeda's dense-image theorem for Fourier–Jacobi coefficients of unitary Siegel Eisenstein series (§2.12); the Yager module of the unramified ℤ_p-extension and the unramified-by-cyclotomic Bloch–Kato exponential (§2.19); FW's analytic Selmer-complex comparison and p-irregular comparison (§2.20); Nakamura's universal zeta morphism (§3.7); and the source-specific p-adic interpolation of the Siegel Eisenstein series on GU(3,3) together with its pullback to the Klingen families (§§1.4, 1.6, 2.3, 2.10 and 5.3), for which only the complex doubling identities are imported. §2.22 is the general statement of Wan-2020 Theorems 1.1–1.2; the weight-two elliptic specialization of Theorem 1.2 under the local conditions of Skinner's converse theorem is a target of ArithmeticStatisticsPartVI (its anticyclotomic main-conjecture implication), stated there from its source and not restated here, and that roadmap consumes nothing from this one. Katz's two-variable p-adic L-function of an imaginary quadratic field is not constructed here: it is the bounded measure of AutomorphicPadicLFunctionsPartII §8.5 at L = K with p split, and only its comparison with the Hida–Tilouine normalization is requested (gap:katz-cm-padic-l); the class-number-one elliptic-unit instance of NoncommutativeAndEquivariantIwasawa §4.3 is a specialization not consumed here.

| Neighbour | Imported interface and boundary |
| --- | --- |
| PadicFamilies, §§0a.11–0a.22, 1.3–1.11, 4.0.1–4.0.3, 4.1, 4.6, 4.9, 5.1, 5.6–5.9 | Ordinary projectors, congruence modules and period lines, modular zeta classes and their reciprocity, the big ordinary Galois representation, the family big logarithm and Coleman-family regulator, totally real nearly ordinary Hida theory. Hida's Rankin–Selberg p-adic L-functions against CM families (gap:hida-rankin-selberg-cm), the mod-p nonvanishing of Hecke L-values (gap:hecke-l-values-mod-p), Hsieh's anticyclotomic Rankin–Selberg p-adic L-functions with their μ-invariants (gap:anticyclotomic-rankin-selberg), the mod-p nonvanishing of anticyclotomic twists (gap:anticyclotomic-nonvanishing-mod-p), Vatsal's μ-invariant formula for the quaternionic theta element (gap:vatsal-theta-mu), the general-CM auxiliary unit/congruence input for §5.5, the integral CM-branch congruence-to-Katz comparison for the cases of §0.9 outside Hid06 and HT94, and totally real Hida theory in odd degree are requested as gaps (below). Katz's p-adic L-function itself is imported from AutomorphicPadicLFunctionsPartII. |
| AutomorphicPadicLFunctionsPartII, §8.5 | The bounded p-adic measure on Gal(K(p^∞f)/K) of an imaginary quadratic K with p split, with its interpolation formula at critical Hecke characters: Katz's two-variable p-adic L-function and, by pushforward, its anticyclotomic restriction. Its comparison with the Hida–Tilouine normalization is a gap. |
| IntegralHeckeAndGaloisDeterminants, §§1.3–1.4, 2.1–2.3, 3a.1, 4.1–4.2, 5.3 | Generalized matrix algebras, reducibility ideals and extension modules, integral Hecke images, GLₙ Hecke polynomials, determinant uniqueness and interpolation, lattice changes. |
| ProfiniteCohomology, Layer 7; EllipticCurves, Layers 2 and 7; NumberFieldArithmetic, §1.1 | Continuous Shapiro for discrete coefficients; torsion, Tate modules and Selmer kernels of elliptic curves; the splitting dictionary for number fields. |
| PadicMeasuresIwasawaAlgebras, §§4.1, 4.4, 4.6, 5.1 | Pseudo-null modules, μ and λ, characteristic divisors and principal characteristic ideals over UFDs, determinant lines of perfect complexes. The divisorial characteristic ideal over a nonfactorial normal domain is a gap. |
| SelmerIwasawaCohomology, Layers 2–4; PhiGammaModulesAndIwasawaCohomology, §§4.4, 4.5, 5.4; ArithmeticGaloisDuality, §R02.4.3 and Layer D7 | Selmer structures, Pontryagin duals, ordinary and unramified local conditions, Iwasawa cohomology and control along finite layers, Poitou–Tate; relative Herr complexes over affinoid coefficients; derived continuous cochains and duality. Control along an arbitrary ideal of the coefficient ring is §0.3 here. |
| PELModuli, §§M5.5–M5.6; ShimuraCompactifications, §§7.3, 7.15, 7.16; AutomorphicBundles, §§12.2, 12.8, 12.15, 12.16; IgusaVarietiesAndTorsionConcentration | Unitary PEL data of the needed signatures, integral toroidal and minimal compactifications, Fourier–Jacobi expansions of classical forms and the expansion principle. The Igusa tower over the ordinary locus of these unitary Shimura varieties and its p-adic forms are a gap on IgusaVarietiesAndTorsionConcentration. |
| MetaplecticAutomorphicForms, §§3.3, 6.2, 6.10a–6.13, 6.17–6.20; AutomorphicLFunctionsAndLocalFactors, Layer AL.3; AutomorphicSpectralTheory, §§1.2, 2.4, 4.3 | Unitary dual-pair splittings, Siegel–Weil sections, doubling factors and local doubling zeta integrals, Rallis inner products, the Jacobi group and Fourier–Jacobi extraction; Whittaker models and local Rankin–Selberg integrals; Eisenstein series and the spectral decomposition. |
| AutomorphicGaloisRepresentationsPartII, Layers AG2.2, AG2.5, AG2.6 | Galois representations of regular algebraic cuspidal representations of unitary groups and their local–global compatibility. The descent to an imaginary quadratic base field is a gap. |
| OrdinaryAutomorphicFormsAndModularityLifting; GlobalGaloisDeformations, §§3.7–3.8; LocalGaloisDeformationRings, §§F.2.5, F.2.9, 1.1, 3.4, 6.12, 8.3; DeformationAndDerivedPatchingAlgebra, §§3.1, 3.4, 6.2, 7.3 | Deformation rings, presentations and complete-intersection algebra. Fujiwara's minimal totally real R = T and the base change of minimal modular lifts are gaps. Layer 5 applies them and verifies local types. |
| CompletedCohomologyAndLocalGlobalCompatibility, §§4.1, 4.4, 4.5, 4.7, 6.2; PadicLocalLanglandsForGL2Qp, §§5.5, 5.7–5.9, 5.11, 6.1, 6.6; SmoothRepresentationsOfLocalGroups, §SR.5.2 | Completed (co)homology and local–global compatibility, p-adic local Langlands and its projective envelopes for p ≥ 3, co-Whittaker families. The p = 3 case of Paškūnas's freeness criterion and the unconditional GL₂ essential-vector statement are gaps. The extension of the completed-homology descent to FW local cases with nonscalar endomorphisms is gap:fw-zeta-local-descent. Layer 3 owns their zeta-morphism application. |
| GL2ModularityLifting, §§5.16, 7.8, 8.7–8.8, 10.5, 12.1; ClassicalSerreModularity, Layer R27.6; SerreWeightAndLevelOptimisation, §2.13 | Modularity lifting at odd primes, Kisin's crystalline lifting, Pan's theorem in its residually modular form, Serre's conjecture in its strong form. |
| PadicHodgeRegulators, §§1.2, 1.10, 8.8, 8.18, 8.19, 8.22, 9.22 | Bloch–Kato exponential and logarithm, Perrin-Riou regulator and reciprocity, Coleman maps, noncritical refinements. It plans no Yager module; §2.19 owns it. |
| KatoEulerSystems, §§0.1, 2.1–2.3, 4.1–4.4, 5.1, 5.3, 5.4, 7.2, 7.4; EulerSystemsAndKolyvaginSystems, §8.16 | Kato's Euler system and its Rubin hypotheses, the cyclotomic bounds and zeta morphisms; the integral saturated Kato-to-Néron comparison needed by §7.10 is gap:kato-neron-saturated-comparison; the Iwasawa Poitou–Tate sequence. |
| ModularSymbolsPadicLFunctions, §§1.1, 1.3, 2.5; IntegralIwasawaTheory, §§5.0, 12.1; DirichletPadicLFunctions, §2.8; GrossZagierAndArithmeticHeights, §§9.15, 9.21 | Modular-symbol p-adic L-functions with integral periods, the Kubota–Leopoldt function and Euler deletion, Wiles's totally real main conjecture, the BDP function in weight two. The Néron-period normalization of the Mazur–Swinnerton-Dyer function is a gap. |

This roadmap is consumed by ModularIwasawaMainConjectures (the endpoints of Layers 1, 2, 4 and 7 and the zeta construction of Layer 3, through its supplier gap automorphic-endpoints) and by HeegnerPointEulerSystems (§§5.1, 5.4, 5.10 and 6.1–6.3; its supplier gap primitive-toric-mu is answered by §6.5 together with gap:anticyclotomic-rankin-selberg); neither is a supplier. A main conjecture for arbitrary unitary representations, a general CM-field main conjecture and a stronger theorem over the full possibly nonfactorial deformation ring are not endpoints of this roadmap.

The pinned Tau Ceti also supplies `TauCeti.fittingIdeal`, continuous cohomology, quadratic composita and quadratic-twist point equivariance. Their existence does not identify an integral Tate lattice with a discrete cohomological coefficient, establish an ordinary Selmer control theorem, or compare analytic period lattices. LocalGaloisGroups and ProfiniteArithmetic retain ownership of local Galois groups and their profinite structure; IntegralLattices retains integral quadratic-lattice theory.

## Conventions

- **Fields and towers.** K is imaginary quadratic in the SU/CLW/FW and BCS descent arguments. In the Hilbert engine F is totally real and M/F is CM quadratic; in the quartic application F is real quadratic and M=FK. The suffix g^F or E^F means quadratic twist over Q, while g_F means base change to F. Γ_K has cyclotomic and anticyclotomic directions Γ_K⁺ and Γ_K⁻. Coefficient rings and completed tensor products are specified at each target.
- **Selmer conditions.** Galois representations with coefficients are unramified outside a finite set of places, so that global cohomology is that of G_(F,S) for a finite S. Σ relaxes conditions only at places away from p. At every v|p the chosen Greenberg condition remains in force, even if v∈Σ. In the inertia-kernel convention T_v=0 means unramified at p; it is not the strict zero local condition. Primitive, inertia-kernel and locally-trivial conditions are compared by explicit maps before being identified. Compact integral Tate lattices, discrete p-divisible representations and their Iwasawa dual coefficients are distinct carriers.
- **Characteristic divisors.** For a finite torsion module over a noetherian normal domain, Ch or char denotes the divisorial ideal determined by its height-one lengths. Such an ideal need not be principal on a normal Hida branch; it is the ideal of gap:divisorial-char-ideal (PadicMeasuresIwasawaAlgebras §4.6). Principal characteristic generators are used only with the required UFD hypothesis. Some source theorems extend the characteristic ideal to zero for non-torsion modules; that convention gives no torsion proof. Control specializes a principal analytic majorant with nonzero specialization, not an arbitrary nonprincipal characteristic ideal.
- **Containment direction.** Ch(X)⊆(L) is the reverse divisibility: L divides a characteristic generator when a generator exists. Kato supplies the opposite containment (L)⊆Ch(X). All products, cancellations and scalar descent take place in the coefficient ring stated, with nonzero/torsion hypotheses retained.
- **Forms and ideals.** ℰ_D denotes an Eisenstein family, I_D the ideal of Hecke-operator differences in the cuspidal algebra, and 𝔈_D=ker(Λ_D→h_D/I_D) its coefficient-ring ideal. Context-dependent E_D notation in the sources is separated here into the family ℰ_D and the coefficient ideal 𝔈_D. A nonvanishing hypothesis modulo a prime concerns ℰ_D. The Hecke algebra on boundary-corank-at-most-one forms and its cuspidal quotient are distinguished; an Eisenstein eigencharacter on the former need not lift the cuspidal quotient character to Λ_D. In the SU layer, “noncuspidal” refers to this boundary-corank module, not to every form.
- **Frobenius and twists.** Each source retains its own reciprocity convention. For det(1−MX), trace is minus coefficient 1: diag(1,2,3,4) gives coefficients (1,−10,35,−50,24) and trace 10. SU Lemma 3.2.17 uses det(1−X·frob_ℓ⁻¹ | (T⊗Frac A)^(I_ℓ)) and substitutes ℓ⁻¹ε(frob_ℓ). Nakamura's newform Euler polynomial is 1−a_ℓX+ℓᵏ⁻¹ε(ℓ)X². Passing to Mathlib's det(T·I−M), a dual representation or a Tate twist requires the explicit reciprocal-polynomial/representation dictionary.
- **Periods.** SU uses its cohomological canonical periods Ω_f⁺Ω_f⁻, with the stabilization and archimedean factors of Lemma 12.2.2. Wan's Hilbert canonical period uses Definition 79. MSD functions for curves use the specified Néron periods and Manin-constant comparison. A p-adic unit comparison preserves ideals; a rational scalar comparison preserves them only after p-inversion. No canonical/Gross-period identity is assumed.
- **Localizations and nonvanishing.** Inverting p differs from localizing the entire cyclotomic coefficient subring. CLW's addendum supplies two rational Klingen families whose Fourier–Jacobi values jointly avoid every height-one prime away from p. One chooses a family locally at each prime; no single-family unit coefficient is inferred. The auxiliary ℓ-power nonvanishing repair is separate from the p-power μ=0 input. Its general-weight FW form is the two-family theorem of §2.12, whose only weight-dependent ingredient is the archimedean constant 1/(k−1).
- **Quadratic splitting.** At an odd unramified prime use the Jacobi criterion for a fundamental discriminant D. At 2 with D odd, splitting means D≡1 mod 8 and inertia means D≡5 mod 8. The auxiliary-field conditions include this case when 2 divides a level.
- **Universal families.** FW's regular subring Λ=O[[X₁,X₂,X₃]] and the finite free deformation/Hecke algebra T have different roles. Restriction of scalars uses a determinant norm. For a primal line trivialization t and its dual t∨, t∨(Δ⁻¹)=αΛ corresponds to t(Δ)=α⁻¹Λ. The full fundamental line has local corrections at Σ∖{p}, and its base change requires Iwasawa suitability.

For characteristic divisors over a normal domain, multiplication of characteristic ideals means the divisorial hull of their ordinary ideal product. Height-one valuations are additive. In a UFD or for principal factors this agrees with the ordinary ideal product. The ideal containments against a principal analytic ideal therefore have their usual literal meaning. Arithmetic applications use mixed-characteristic coefficient integer rings O finite over Z_p, with uniformizer ϖ; no argument replaces ϖ by p when O is ramified.

## Exact supplier contracts

Each subsection names the sections consumed and what is assumed of them. A requirement that the named supplier does not plan is a declared gap, written `What <Supplier> must provide (gap:<slug>): …`; an endpoint using a gap is proved once the gap is supplied. No target here restates a supplier's theorem.

### From Mathlib

The dependency pin is Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`. Mathlib supplies `Module.length`, `LocalizedModule`, `Ideal.span`, `Ideal.map`, `Ideal.comap`, `Ideal.mem_comap`, `Ideal.map_mul`, `Ideal.map_span`, `Ideal.span_singleton_mul_left_unit`, `RingHom.ker`, `Matrix.charpoly`, `MvPowerSeries`, `IsDiscreteValuationRing`, `IsLocalRing`, `IsReduced`, `IsRegularLocalRing` and `UniqueFactorizationMonoid`. Ideal extension preserves products and generated ideals; contraction is a preimage, and arbitrary kernel specialization does not follow from either fact. `Matrix.charpoly` uses det(TI−M), so it must be converted to the reciprocal polynomial used by SU; `Matrix.coeff_charpolyRev_eq_neg_trace` in Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean gives coefficient 1 of the reciprocal polynomial as minus the trace.

The Eisenstein quotient presentation uses `RingHom.quotientKerEquivOfSurjective` from `Mathlib/RingTheory/Ideal/Quotient/Operations.lean`, applied to f=(Λ→𝕋→𝕋/I_E). The kernel is the contraction 𝔈_E by `RingHom.comap_ker` and `Ideal.mk_ker`, and `RingHom.quotientKerEquivOfSurjective_apply_mk` gives the compatibility e([r])=[ι(r)], hence the required Λ-algebra compatibility. These statements apply to arbitrary commutative coefficient and Hecke rings; no local, finite or domain hypothesis is needed. Surjectivity onto the quotient is essential: constants ℤ→ℤ[X] with all operator differences zero leave X outside the image.

### From Tau Ceti

The dependency pin is Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. It supplies `TauCeti.ContCohomology.H1`, the additive quotient of continuous cocycles by coboundaries; `TauCeti.fittingIdeal` with its base change; `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`; `NumberField.ncard_primesOver_multiquadratic_iff` for odd primes avoiding the radicands; `TauCeti.Multiquadratic.isGalois` when 2≠0 in the base field; and `TauCeti.Multiquadratic.oddPrimeDiscriminant`, the discriminant p* = (−1)^((p−1)/2)p. Point equivariance must still be restricted to p-power torsion, passed through compatible inverse limits and matched to the ordinary filtration. The splitting criterion verifies selected fields; it does not select them.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Import §4.1 (pseudo-null modules and pseudo-isomorphism), §4.4 (μ and λ), §4.6 (`charDivisor` over a noetherian integrally closed domain; the principal `charIdeal` over a noetherian normal UFD, with multiplicativity in exact sequences and the pseudo-null criterion) and §5.1 (`detLine` of a perfect complex: for [A→(1−α)A] in degrees 0,1 the standard basis maps to 1−α over the fraction field when that scalar is nonzero, and the inverse determinant gives the reciprocal lattice). §4.6 builds the divisor over a normal domain but its ideal only over a UFD; SU's normal Hida branches and Wan's coefficient rings need the following.

What PadicMeasuresIwasawaAlgebras must provide (gap:divisorial-char-ideal): for a finitely generated torsion module M over a noetherian integrally closed domain A, the divisorial ideal Ch_A(M) = ⋂_𝔭 𝔭^(length_(A_𝔭) M_𝔭) (𝔭 of height one, symbolic powers) attached to `charDivisor`, equal to A exactly when M is pseudo-null, equal to `charIdeal` when A is factorial, multiplicative in short exact sequences up to divisorial hull, with Ch_A(M) ⊆ fA for f ≠ 0 if and only if ord_𝔭(f) ≤ length_(A_𝔭) M_𝔭 at every height-one 𝔭, and, for a finite extension O→O′ of p-adic rings of integers and A = O⟦T_1,…,T_r⟧, the base change Ch_(A⊗O′)(M⊗O′) = Ch_A(M)·(A⊗O′) whose contraction to A is Ch_A(M).

### From TauCetiRoadmap.SelmerIwasawaCohomology

Import §2.1 (Selmer data), §§2.7–2.8 and 2.8a (unramified and Greenberg conditions, ordinary filtrations), §2.9 (Galois Selmer groups unramified outside a finite set), §2.10 (Pontryagin duals), §2.12 (finite elliptic Selmer groups to p^∞), §§2.13 and 2.19 (dual Selmer structures and finite-level Poitou–Tate), §2.21 (Selmer complexes), §2.23 (primitive, imprimitive and strict condition-change triangles), §2.24 (lattice changes), §§3.1–3.2 (Iwasawa cohomology and its Shapiro lemma), §3.5 (universal norms), §§3.8–3.14 (Iwasawa Selmer complexes, specialization correction complexes, derived control along the finite layers, classical restriction control, Iwasawa duality, finiteness and local Euler ranks, the determinant line and its characteristic divisor), §3.16 (degree-one specialization at the cyclotomic twist), §§3.17–3.20 (local cofreedom and away-p Euler factors, checkable ordinary hypotheses, surjectivity of global ordinary localization, no pseudo-null submodule), §4.7 and §4.10 (Fontaine–Laffaille realization and the integral finite preimage, for p > 2, unramified base and width at most p−2). The control isomorphism along an arbitrary ideal of a profinite coefficient ring (SU Prop. 3.2.8) is §0.3 here; the integral Tate-lattice dictionary for quadratic twists is §7.1 here; the torsion of the quartic-CM and cyclotomic duals is proved in §§5.12 and 7.3 from Kato's bounds.

### From TauCetiRoadmap.ArithmeticGaloisDuality and TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

Import ArithmeticGaloisDuality §R02.4.3 (Poitou–Tate duality for finite modules) and Layer D7, §§D7.1, D7.3–D7.5 (coefficient algebras, derived continuous cochains, derived local and global duality). Import PhiGammaModulesAndIwasawaCohomology §4.4 (perfectness of amplitude [0,2], Euler characteristic −[K:ℚ_p]·rank and duality of relative Herr complexes over affinoid coefficients), §4.5 (derived coefficient change along affinoid maps) and §5.4 (comparison of analytic Iwasawa cohomology with the ψ-complex), after KPX Theorems 4.4.2–4.4.6 and Corollary 4.4.11. The global analytic Selmer complex over Pottharst's quasi-Stein algebra with FW's finite-slope local conditions is §2.20 here.

### From TauCetiRoadmap.ProfiniteCohomology, TauCetiRoadmap.EllipticCurves and TauCetiRoadmap.NumberFieldArithmetic

Import ProfiniteCohomology Layer 7 (coinduced discrete modules and Shapiro's lemma) for the finite-level p-primary coefficients and their filtered direct limit, or for the discrete Iwasawa coefficient T⊗Λ^∨ with reciprocal action; it does not apply directly to a compact nondiscrete Tate lattice. Import EllipticCurves Layer 2 (torsion, Weil pairing and Tate module, with the integral inverse limit and twist-equivariant transition maps) and Layer 7 (Selmer groups). Import NumberFieldArithmetic §1.1 (relative splitting criteria).

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Import §1.3 (Henselian lifting of matrix units and generalized matrix algebras), §1.4 (partition reducibility ideals, extension modules and the off-diagonal extension injection), §§2.1–2.3 (integral and derived Hecke images, local factors, operator localization and ordinary parts), §3a.1 (GLₙ Hecke polynomials and Frobenius conventions), §§4.1–4.2 (uniqueness of continuous determinants from Frobenius density, interpolation with uniform congruences) and §5.3 (local conditions under change of lattice). Its Layer 6 rank-two Ribet theorem with two residual characters is not the polarized three-block theorem of §0.7, which is owned here; the rank-four GU(2,2) Hecke-polynomial normalization is fixed in §§1.3 and 5.6 here.

### From TauCetiRoadmap.IntegralIwasawaTheory and TauCetiRoadmap.DirichletPadicLFunctions

Import IntegralIwasawaTheory §5.0 (the canonical Kubota–Leopoldt object, with Euler factors added by imprimitive presentations) and §12.1 (`wilesMainConjecture`, the totally real main conjecture for odd p), and DirichletPadicLFunctions §2.8 (arithmetic Euler deletion). The image of the Kubota–Leopoldt function under γ ↦ (1+W)⁻¹γ²₊ in 𝕀⟦Γ_K⟧ is §1.3 here; the identification of Wiles's characteristic ideal with the scalar Selmer module for χ′/χ under Wan's local conditions is §5.8 here.

### From TauCetiRoadmap.PELModuli, TauCetiRoadmap.ShimuraCompactifications and TauCetiRoadmap.AutomorphicBundles

Import PELModuli §§M5.5–M5.6 (unitary PEL data with prescribed signatures, including signature (2,2)), ShimuraCompactifications §7.3 (integral toroidal compactifications), §7.15 (Fourier–Jacobi expansions of Hodge-line sections) and §7.16 (the integral minimal compactification), and AutomorphicBundles §§12.2 and 12.15 (scalar and vector Fourier–Jacobi expansions) and §§12.8 and 12.16 (joint injectivity at component-detecting cusps and the expansion principle). These are statements about classical forms on Lan's good-prime models.

### From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

Import the unitary similitude data and Hecke algebras of Layer 0 and the Igusa towers of Layers 1–2. The ordinary p-adic forms used by SU, CLW, FW and Wan are the following.

What IgusaVarietiesAndTorsionConcentration must provide (gap:unitary-ordinary-igusa): for an odd prime p, the unitary similitude groups GU(2,2) and GU(3,1) over an imaginary quadratic field split at p, and GU(2,2) over a CM quadratic M/F with every p-place split, with neat prime-to-p level, the ordinary Igusa tower of connected p-divisible-group trivializations as a pro-étale torsor under its integral Levi automorphism group (for SU's GU(2,2) tower H(ℤ_p) = GL₂(ℤ_p) × GL₂(ℤ_p), with finite-level group H(ℤ/pˢ)), functions with the specified boundary ideals followed by invariants under the chosen Borel's unipotent subgroup, the residual diagonal torus action defining weights, q- and Fourier–Jacobi expansions and their injectivity, prime-to-p Hecke and U_p actions, Siegel boundary maps and sufficiently regular classical comparison (SU §§5.4.9, 6.1.4–6.2; CLW §§2–4; Wan-2015 §§3–5).

### From TauCetiRoadmap.MetaplecticAutomorphicForms, TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors and TauCetiRoadmap.AutomorphicSpectralTheory

Import MetaplecticAutomorphicForms §3.3 (unitary dual-pair splittings), §6.2 (the Siegel–Weil section), §6.10a (standard doubling factors and the global doubling integral), §6.11 (local doubling zeta integrals), §6.12 (factorization of theta pairings), §6.13 (the Rallis inner product formula), §6.17 (the Jacobi group of a symplectic space) and §§6.19–6.20 (Fourier–Jacobi extraction and the Jacobi theta decomposition). The unitary Jacobi group N′U(2,2) is the restriction of §6.17 along the hermitian-to-symplectic embedding; §§2.4 and 2.12 own the weight-specific applications. Import AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Whittaker realizations; unequal-rank and equal-rank local Rankin–Selberg integrals). Its local factors at ramified places do not include the triple-product factors used by Ichino's formula, whose local integrals are those of CLW Props 7.9.1–7.12.1 and FW Prop. 7.27 in §2.4 here. Import AutomorphicSpectralTheory §1.2 (Eisenstein series in the convergence chamber), §2.4 (meromorphic continuation and functional equations) and §4.3 (completeness of the spectral decomposition); it does not state Harris's holomorphic CAP exclusion, which is §2.6 here.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

Import Layer AG2.2 (geometric existence in the Shin-regular range; Galois assembly for discrete unitary transfer), Layer AG2.5 (unramifiedness and the good-prime polynomial) and Layer AG2.6 (polarized admissibility at the coefficient prime). Discrete assembly is used only after its cuspidal constituents are attached, and is not itself CAP exclusion. The existence statement of Layer AG2.2 is over a CM field whose maximal totally real subfield has degree at least two.

What AutomorphicGaloisRepresentationsPartII must provide (gap:unitary-galois-imaginary-quadratic): for an imaginary quadratic field K and a cohomological cuspidal representation π of GU(2,2) or U(3,1) over K of sufficiently regular weight, a four-dimensional polarized Galois representation of G_K unramified outside the ramification of π and p, whose Frobenius characteristic polynomials at the unramified places are the Hecke polynomials of π, crystalline at the places above p when π_p is unramified, and, when π is ordinary (respectively semi-ordinary) at p, with the corresponding filtration at the places above p (SU Theorem 7.1.1; CLW proof of Theorem 8.2.1).

### From TauCetiRoadmap.AutomorphicPadicLFunctionsPartII

Import §8.5 (critical Hecke-value interpolation over totally imaginary fields) at L = K imaginary quadratic (d = 1), with the p-ordinary lifted type the choice of one prime 𝔭 above the odd split prime p, and a tame ideal f prime to p: a bounded O_(ℂ_p)-valued measure μ_f on Gal(K(p^∞f)/K) whose integral against every critical algebraic Hecke character χ of conductor dividing p^∞f and infinity type β − α in that roadmap's ideal-exponent convention (α ≥ 1 at 𝔭, β ≥ 0 at 𝔭̄) equals, after division by the period Ω_p^α(Ω_p^∨)^β, the class sign ε(1,α−1,β) = (−1)^(α+β+1) times the factorial-normalized product of the local factor Local(χ,Σ), the Euler factors (1 − χ(𝔭⁻¹)/N𝔭)(1 − χ(𝔭̄)) and the f-imprimitive value L_f(χ,0), the measure being unique by density of the finite-order twists. This is Katz's two-variable p-adic L-function of K; its images under the projections Gal(K(p^∞f)/K) → Γ_K ≅ ℤ_p² and Γ_K → Γ_K^− (pushforward of bounded measures, PadicMeasuresIwasawaAlgebras §4.1) are the two-variable and anticyclotomic Katz functions written L^Katz in Layers 0, 2 and 6. What is assumed of §8.5: boundedness, the interpolation formula at every critical character with the displayed depletion factors, uniqueness, and functoriality under enlarging f. An inert p is excluded there and never used here (Conventions). The elliptic-unit instance of NoncommutativeAndEquivariantIwasawa §4.3 (E/ℚ with complex multiplication by O_K, so h_K = 1, p ≥ 5, de Shalit's normalization) is a specialization and is not consumed.

What AutomorphicPadicLFunctionsPartII must provide (gap:katz-cm-padic-l): for K imaginary quadratic and p odd and split in K, the identification of the measure of §8.5, pushed to Γ_K and to Γ_K^−, with Katz's p-adic L-function in the Hida–Tilouine normalization: the comparison of §8.5's interpolation formula (its periods Ω_p and Ω_p^∨, class sign ε(1,α−1,β), factor Local(χ,Σ) and depletion factors) with the formula of HT93 Theorem II, p. 193, as restated in Hida2010 (1.3), p. 44 (periods Ω_∞ and Ω_p, Gamma factors, powers of π and of Im δ, the root-number factor W_p(χ), the Euler factors at the conductor and at 𝔭̄), as an equality up to a unit of the unramified coefficient ring at every critical character, and the same comparison with de Shalit's normalization L_v(K), L_v̄(K) of CGS23 Theorem 1.4.2, p. 9, with its functional equation up to a unit; so that the anticyclotomic restriction carries the period, Euler-factor and class-number normalization of HT93 Theorem 7.1 with (7.3a,b) and (8.8b) used in §0.9, in which h_K·L^Katz_ξ interpolates up to a unit the self-Petersson products of the CM theta series of the branch of ξ divided by the CM period (CGS23 (1.2), p. 10). It is a comparison of normalizations of one bounded measure, not a second construction.

### From TauCetiRoadmap.PadicFamilies

Import §§0a.11, 0a.15, 0a.16, 0a.19 and 0a.22 (profinite ordinary projectors, exactness, ordinary parts of complexes, locally finite endomorphisms and their projectors), §§1.3, 1.7, 1.8, 1.10 and 1.11 (family period lines, congruence modules and ideals, change of trivialization), §§4.0.1–4.0.3 (modular zeta classes, their explicit reciprocity, cyclotomic torsion and the rational Euler-system bound, with the separate CM treatment), §4.1 (the big ordinary Galois representation), §4.6 (the family big logarithm), §4.9 (the Coleman-family regulator) and §§5.1 and 5.6–5.9 (the nearly ordinary weight algebra, Hida freeness, finiteness, control and density of weight-two points for a totally real field of even degree). The comparison of the lattice, dual and Tate-twist normalization of §4.1 with those of SU, CW and FW is made in §§1.3 and 2.15 here; a rational trace identity alone does not identify integral Selmer groups.

What PadicFamilies must provide (gap:hecke-l-values-mod-p): for an arithmetic Hecke character χ of a CM field K over a totally real F, of infinity type kΦ + κ(1−c), k > 0 and κ ≥ 0, with conductor C, a p-ordinary CM type Φ and p > 2 unramified in F, Hsieh2012's two distinct nonvanishing branches for the period-, gamma- and auxiliary-Euler-normalized L^(ℓ)(0,χν): in Theorem A, χ|_(𝔸_F^×) = τ_(K/F)|·|_F, μ_p(χ_v) = inf_x v_p(χ_v(x)−1) = 0 at every nonsplit v|C, W(χ|·|_K^(−1/2)) = +1, the ramified part of C is squarefree, ℓ ≠ p splits in K and (pℓ,D_(K/F)C) = 1; in Theorem B, the same local μ = 0 and coprimality, but χ is not residually self-dual (χ·N_(F/ℚ) is not congruent to τ_(K/F) on ideals of F prime to pC), with no squarefree or splitting condition on ℓ. Nonvanishing holds outside finitely many anticyclotomic ℓ-power twists when [F_ℓ:ℚ_ℓ] = 1, and on a Zariski-dense set in general (Hsieh2012 Theorems A–B, pp. 2–3, Corollary 6.5, p. 22); Hida2010 Theorem I is the anticyclotomic instance with C divisible only by primes split in K, p unramified in K and outside Hida's exceptional case, stated there as the vanishing of the μ-invariant of the anticyclotomic restriction of the Katz measure. Also its weakened form, with "all but finitely many" replaced by "infinitely many" ℓ-power anticyclotomic twists, for F = ℚ and χ of infinity type (k+m, −m) with k, m > 0 under the hypotheses of Theorem B, obtained by replacing the Zariski-density input of Hsieh's proof by Hida's weaker density theorem (CLW-addendum Theorem 1.0.1 and the paragraph before it, p. 1); this is the form §§2.3, 2.4 and 2.12 use, since the stronger statements rest on a nonvanishing input whose proof has a gap (CLW-addendum §1, p. 1). And Finis2006 Theorem 1.1, the valuation formula for positive-root-number self-dual characters of an imaginary quadratic K of infinity type (−k,k−1), k ≥ 1, varying at a split odd auxiliary prime ℓ ≠ p with fixed tame conductor, which gives unit nonvanishing only when the sum of its local μ-invariants is zero. Here F = ℚ throughout, the values are normalized by the CM periods and the measure of AutomorphicPadicLFunctionsPartII §8.5 in the normalization of gap:katz-cm-padic-l, and the statements are about the values, not about any p-adic L-function of π.

What PadicFamilies must provide (gap:hida-rankin-selberg-cm): for an imaginary quadratic K in which the odd prime p splits, Hida's Rankin–Selberg p-adic L-function of a primitive ordinary form or Hida family 𝐟 against the ordinary CM Hida family g of a Hecke character of K, the trivial character included (whose CM family is the unique cuspidal family through the p-stabilized weight-one Eisenstein series Eis_(1,η_K), BDP22 Theorem A(i), as in CGS23 Theorem 1.4.1 and Lemma 1.4.4, pp. 9–10), with coefficients in I_g ⊗̂ 𝕀[[Γ_ℚ]] for I_g ⊂ Frac(Λ_g) the cuspidal congruence module of the CM branch, so that its denominator is the congruence power series H(g) of §0.9; interpolating the Rankin–Selberg values at s = 1 divided by the self-Petersson products of the CM specializations, in both orderings of the two families, with every Euler factor away from p present and the p-Euler factors and local root numbers displayed (Hid91 Lemma 5.3(vi), p. 355, for the Petersson-norm normalization); and its factorization through Katz's function: on the line interpolating values at s = 1, the product of this function with h_K·L^Katz of the CM branch, in the normalization of gap:katz-cm-padic-l, is the Greenberg two-variable function of 𝐟 over K (FW Corollary 7.21, with Proposition 4.35 for the Katz normalization; CGS23 Definition 1.4.3, p. 9, for the Perrin-Riou function of weight two). It is the construction, its denominator and its factorization only; the integral comparison of H(g) with h_K·L^Katz is gap:cm-congruence-katz-integral.

What PadicFamilies must provide (gap:cm-congruence-katz-integral): for an imaginary quadratic field K, a prime p ≥ 3 split in K and a Hecke character ξ as in CLW §5.2 with ξ_p ≢ ξ_p̄ modulo the maximal ideal, the integral comparison of the congruence ideal of the CM branch with the anticyclotomic Katz function: the congruence ideal H(g) (§1.10, for the branch of the ordinary CM Hida family g through σ_ξ) divides h_K·L^Katz_ξ in O^ur[[Γ_K^−]], with h_K·L^Katz_ξ in the normalization in which CLW's L^Hida is the product, interpolating up to a unit the self-Petersson products of the specializations of g divided by the CM period (HT93 Theorem 7.1 and (8.8b); Hid91 Lemma 5.3(vi)), in every case outside the hypotheses of Hid06's main theorem (pp. 466–467) and of HT94 Theorem 0.3, p. 92, with nothing inverted: in particular p = 3 with 3 dividing φ(𝔫)·∏_(𝔩|c″)(1+N𝔩), any p dividing φ(𝔫)·∏_(𝔩|c″)(1+N𝔩) with a conductor prime nonsplit in K, and the trivial-zero case χ(D) ⊂ μ_(p^∞) of HT94 Theorem 0.3(ii), at every tame conductor 𝔫 and auxiliary conductor c = c′c″ of HT94 Theorem 0.3 (CLW proof of Theorem 8.2.1(2), p. 81, which cites HT93, HT94 and Hid06 for this comparison). It is the congruence-to-Katz divisibility for the CM family alone, retaining h_K and the local factors of (8.8b); it is neither CLW's main-conjecture divisibility nor the integrality of L^Hida.

What PadicFamilies must provide (gap:anticyclotomic-rankin-selberg): for a cuspidal representation π of GL₂ over a totally real field F (F = ℚ included) of parallel or general weight, a CM quadratic extension K/F in which every place above an odd prime p splits, and a Hecke character λ of K of the infinity type making the central value critical, Hsieh's anticyclotomic p-adic L-function with its interpolation formula under the local root-number hypothesis at the primes dividing the nonsplit level and squarefree nonsplit level (Hsieh2014 Theorem A, pp. 711–712; in weight two over ℚ it is the function of GrossZagierAndArithmeticHeights §9.15), and the vanishing of its μ-invariant when moreover p is unramified in F, the residual representation is absolutely irreducible on G_K and p ∤ ∏ #λ(O_(K_v)^×) over the nonsplit places of the conductor of λ (Hsieh2014 Theorem B, p. 713), with the imprimitive Euler factors at nonsplit primes retained. It is the construction and the μ-invariant only; the mod-p nonvanishing of anticyclotomic twists is gap:anticyclotomic-nonvanishing-mod-p and Vatsal's quaternionic function is gap:vatsal-theta-mu.

What PadicFamilies must provide (gap:anticyclotomic-nonvanishing-mod-p): in the setting of gap:anticyclotomic-rankin-selberg, for a prime 𝔩 of F above ℓ ≠ p with (p𝔩, n·c_χ·D_(K/F)) = 1, the residual representation absolutely irreducible on G_K and p prime to the orders of the local images λ(O_(K_v)^×) at the nonsplit places of the conductor, the nonvanishing modulo p of the period-normalized twisted central values L(1/2, π_K ⊗ χφ) for almost all finite-order characters φ of the anticyclotomic pro-ℓ extension of conductor 𝔩^∞: all but finitely many when [F_𝔩:ℚ_ℓ] = 1, a Zariski-dense set otherwise (Hsieh2014 Theorem C, p. 713); its weakened "infinitely many" form for F = ℚ and π of any weight t with χ of infinity type (t/2+m, −t/2−m), m ≥ 0 (CLW-addendum Theorem 1.0.2, p. 1), which is the form §§2.3, 2.4 and 2.12 use; and, for the toric periods of parallel-weight Hilbert newforms in Wan-2015 Theorem 86 and §5.4, Hung2017 Theorem B (cited by its locator), each with the imprimitive Euler factors at nonsplit primes retained and with the period of the function of gap:anticyclotomic-rankin-selberg.

What PadicFamilies must provide (gap:vatsal-theta-mu): for a weight-two newform g on Γ_0(N) ordinary at p, an imaginary quadratic K of discriminant prime to N with N = N⁺N⁻, N⁺ divisible only by primes split in K and N⁻ a squarefree product of an odd number of primes inert in K, and a tame anticyclotomic character χ_t, the anticyclotomic p-adic L-function L(g, χ_t, T) ∈ O[[T]] built from the theta element on the definite quaternion algebra of discriminant N⁻ (the Gross curve of conductor N⁺), with its interpolation formula L(g, χ_t, ζ−1) = α^(−2n)·L(g,χ,1)·C_χ/Ω_g^can at the characters χ = χ_tχ_w of conductor p^n (Vatsal2003 §1, p. 3), and Vatsal's formula for its μ-invariant, μ = ord_λ(C_Eis²·C_csp) (Vatsal2003 Theorem 1.1, p. 3), with the two constants retained as defined in his §2.4, pp. 10–11: C_csp = η_0/η_B, the ratio of the congruence number of g in the Hecke algebra of Γ_0(N) to its congruence number in the quaternionic Hecke algebra, and C_Eis = λ̃^ν with ν the largest integer modulo which the quaternionic eigenfunction of g is constant; together with the criteria that C_Eis is a unit when ρ̄_g is irreducible (Vatsal2003 Lemma 2.8, p. 11: ν ≥ 1 forces a_q ≡ q+1 mod λ for every q ∤ N) and that C_csp is a unit when g has no congruence modulo λ with a form whose level omits a prime of N⁻, which holds when ρ̄_g is ramified at every prime dividing N⁻ (Vatsal2003 §1, pp. 4–5, and §4.3). These are the conditions under which SU 12.3.5 uses μ = 0 without stating them and under which §1.5(iii) applies it. The period comparison Ω = Ω_g^can·C_csp (Vatsal2003 Lemma 2.5, p. 11) and the Euler factors at nonsplit primes are retained.

What PadicFamilies must provide (gap:hilbert-cm-unit-congruence): for a totally real F of degree greater than one, a CM quadratic M/F with CM type Φ satisfying Wan's hypothesis Δ+ ((Δ) of Wan-2015 §1.1, p. 1: M is not contained in the narrow Hilbert class field of F, equivalently M/F is ramified at some finite place, so the relative discriminant D_(M/F) is not the unit ideal, and every prime of F ramified over ℚ splits in M), and p > 3 unramified in F and split at every p-place of M/F, the auxiliary-character construction in Wan-2015 Proposition 96, pp. 79–80: after enlarging the tame bad set S and coefficient integers, a character θ with infinity type ∏_(v∈Φ) z_v⁻¹, θ|_(𝔸_F^×) = |·|_F χ_(M/F), norm of conductor (M_θ²) with M_θ prime to p and divisible by the relative discriminant, tame level and places of S away from p, at some finite place v dividing D_(M/F), which exists by Δ+, the restriction of the anticyclotomic part to local units has order divisible by the residue cardinality q_v, Ω_∞^(−2Φ)L(1,θ) a p-adic unit, and θ_(v,2)(p)−1 a unit at every v|p, whose anticyclotomic torsion part has prime-to-p order, is nontrivial at each chosen p-place and remains nontrivial on G_(M(√p*)); its ordinary CM theta family has parallel weight two, level M_θ² times the discriminant ideal, trivial central character, residual irreducibility and ordinary distinctness, a Gorenstein localized Hecke algebra and congruence generator η dividing its Petersson norm normalized by Ω_∞^(2Φ), with the integral period comparison in the proof of Wan-2015 Proposition 96, p. 80, retaining the local factors; auxiliary twists use Hsieh2012 Theorem A with its sign +1 and local μ = 0 hypotheses, and the nonsquarefree conductor extension invoked in Wan's proof, not an imaginary-quadratic-only nonvanishing theorem.

What PadicFamilies must provide (gap:bianchi-p-irregular-l-functions): for a p-irregular cuspidal newform f (repeated root α of its Hecke polynomial at p) of weight k+2 ≥ 2 and tame level M prime to p, its unique p-stabilization and an imaginary quadratic field K in which p splits, the Gorenstein property of the Coleman–Mazur eigencurve at the p-stabilization and of the Bianchi eigencurve at its base change, the families of overconvergent modular-symbol eigenclasses over a sufficiently small neighbourhood V, the two-variable signed p-adic L-functions over V and the three-variable Bianchi p-adic L-function of the base change over V, each specializing at classical points to the single-form functions up to nonzero p-adic periods depending only on the point, with their interpolation formulas, and the cyclotomic Artin factorization of the restricted Bianchi function at the p-stabilization into the p-adic L-functions of f and of f ⊗ χ_K (BW Theorems A–C, §§1.1–1.2, pp. 2–4); the distinct-root constructions of §4.9 do not apply at α = β.

What PadicFamilies must provide (gap:hilbert-hida-odd-degree): the statements of §§5.6–5.9 (freeness, finiteness, control and density of weight-two points for nearly ordinary Hilbert forms) for a totally real field F of odd degree, through definite or indefinite quaternion algebras and the Shimura-curve Ihara input, with the same coefficient rings and normalizations (Fujiwara §§6–11; Wan-2015 Theorem 8).

### From TauCetiRoadmap.ModularSymbolsPadicLFunctions and TauCetiRoadmap.GrossZagierAndArithmeticHeights

Import ModularSymbolsPadicLFunctions §1.1 (period lines and integral periods from saturated lattices), §1.3 (p-stabilization and the interpolation dictionary) and §2.5 (the p-adic L-function of a small-slope refinement, its interpolation and uniqueness, and the ordinary integral measure). Import GrossZagierAndArithmeticHeights §9.15 (the BDP anticyclotomic p-adic L-function in weight two) and §9.21 (its integrality).

What ModularSymbolsPadicLFunctions must provide (gap:msd-neron-periods): for an elliptic curve E/ℚ with good ordinary reduction at an odd prime p and its quadratic twists, the Mazur–Swinnerton-Dyer p-adic L-function normalized by the Néron period of a minimal model and the unit root, and its comparison with the saturated-lattice normalization of §2.5 through the modular parametrization, the Manin constant and the modular degree (CGS23 Definition 1.2.2 and Remark 1.2.3).

### From TauCetiRoadmap.KatoEulerSystems and TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

Import KatoEulerSystems §0.1 (rational auxiliary independence), §§2.1–2.3 (the conductor Euler-system adapter, the Hecke/twist dictionary and full-level zeta classes), §4.1 (admissible coefficient places and the CM boundary), §4.2 (nonvanishing of twisted critical values), §4.3 (Kato's hypotheses imply Rubin's, and the integral bound at every height-one prime when p is odd, the residual representation is irreducible over G_ℚ and some σ ∈ G_(ℚ(μ_(p^∞))) has T/(σ−1)T free of rank one), §4.4 (rational and lattice module structure), §§5.1, 5.3 and 5.4 (the rational zeta morphism, its critical interpolation and Nakamura's twist-one morphism), §7.2 (the cohomological upper bound) and §7.4 (the Coleman value Col(c) = r_E·L_(E,N) and the elliptic divisibilities). The integral form of §7.4 that §7.7 uses comes from §4.3, which needs only the rank-one quotient condition (im) and residual irreducibility, not an SL₂(ℤ_p) image; it bounds the characteristic ideal by r_E·L_(E,N), so this unsaturated value reaches the primitive Mazur–Swinnerton-Dyer function directly only when p ∤ r_E ∏_(q|N, q≠p) ℓ_q(q⁻¹); the comparison needed without that restriction is gap:kato-neron-saturated-comparison. Import EulerSystemsAndKolyvaginSystems §8.16 (the Iwasawa Poitou–Tate sequence).

What KatoEulerSystems must provide (gap:kato-neron-saturated-comparison): for E/ℚ with good ordinary reduction at p > 3, E[p] irreducible and a free rank-one quotient T_p(E)/(σ−1)T_p(E) for σ ∈ G_(ℚ(μ_(p^∞))), an integral comparison from the full-level Kato zeta morphism to the saturated Néron-normalized ordinary Selmer determinant: construct the integral good-pair zeta morphism on saturated Tate, Betti and de Rham coefficient lattices and the ordinary local regulator, compare the determinant cones for the primes q|N, q ≠ p, with the primitive classical Selmer local conditions, and show that the regulator comparison carries the primitive good-pair zeta image to the primitive MSD function with the minimal Néron periods up to a ℤ_p[[Γ_ℚ]]-unit, compatibly with quadratic twists unramified at p; saturation concerns the coefficient lattices and must retain the arithmetic index of the zeta image, and the comparison must account for r_E and every imprimitive Euler factor in §§6.6 and 7.4 by the integral lattice and local cones, rather than divide the unsaturated class by a nonunit or assume the final characteristic-ideal divisibility (BCS Theorem 1.1.2(b) and (5.4), pp. 2, 12; Kato2004 §§12.5, 17.4–17.5).

### From TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture

What EulerSystemsCyclotomicMainConjecture must provide (gap:rubin-imaginary-quadratic): for an imaginary quadratic field K in which an odd prime p splits and a finite-order character of prime-to-p conductor, Rubin's two-variable and anticyclotomic main conjecture identifying the characteristic ideal of the Iwasawa module of the corresponding branch with Katz's p-adic L-function up to a unit of the unramified coefficient extension, in the normalization of AutomorphicPadicLFunctionsPartII §8.5 fixed by gap:katz-cm-padic-l (as used in HT94 p. 91 and CGS23 Lemma 1.4.4 and Proposition 1.4.5).

### From TauCetiRoadmap.PadicHodgeRegulators

Import §1.2 (the normalized Bloch–Kato exponential), §1.10 (the integral Bloch–Kato logarithm for unramified fields), §8.8 (the crystalline Perrin-Riou regulator), §8.18 (Perrin-Riou's explicit reciprocity formula), §8.19 (the determinant of the crystalline regulator), §8.22 (ordinary and multiplicative Coleman maps) and §9.22 (noncritical crystalline refinements). It plans no Yager module; §2.19 owns the Yager module, its normal integral basis, its completed tensor with the cyclotomic tower and the unramified-by-cyclotomic exponential of FW §4.2.2.

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting, TauCetiRoadmap.GlobalGaloisDeformations, TauCetiRoadmap.LocalGaloisDeformationRings and TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Import OrdinaryAutomorphicFormsAndModularityLifting §3.39 (ordinary deformation and tangent refinements: the nearly ordinary ordered-flag deformation condition and Mazur's presentation) and §§5.3 and 5.8 (Skinner–Wiles ordinary modularity lifting over a totally real field, conditional on its Hypothesis H and on component support; the unconditional route over ℚ is ClassicalSerreModularity §I.1); GlobalGaloisDeformations §§3.7–3.8 (presentation over the local rings and the dimension lower bound); LocalGaloisDeformationRings §§F.2.5 and F.2.9 (universal and fixed-determinant deformation rings), §1.1 (framed local rings), §3.4 (potentially semistable rings of fixed type), §6.12 (Geraghty's fixed-weight ordinary rings) and §8.3 (low-weight crystalline rings); DeformationAndDerivedPatchingAlgebra §3.1 (free modules of maximal depth over regular local rings), §3.4 (complete intersections), §6.2 (support under coefficient change) and §7.3 (residual detection for pseudo-coherent complexes).

What OrdinaryAutomorphicFormsAndModularityLifting must provide (gap:fujiwara-minimal): for a totally real field F, an odd prime p unramified in F and a nearly ordinary weight-two residual representation ρ̄ of G_F, absolutely irreducible on G_(F(ζ_p)) and outside Fujiwara's p = 5 exception, with a minimal deformation type satisfying Fujiwara's Definition 6.11 and Hypothesis 6.7, the identification of the minimal deformation ring with the localized Hecke algebra as a complete intersection, the freeness of the quaternionic and Hilbert Hecke modules over it, the finite flat Hida lift and the Gorenstein duality (Fujiwara Theorems 11.1–11.2 and Corollary 11.5), together with the ordinary modularity-lifting alternative used for condition (10) of Wan-2015 §9.2.1.

What GlobalGaloisDeformations must provide (gap:minimal-lift-base-change): for an absolutely irreducible residual elliptic representation ρ̄ of G_ℚ and a real quadratic field F satisfying the field conditions of §5.13, a minimal modular lift of ρ̄ whose restriction to G_F is minimal in the sense of all six clauses of Fujiwara's Definition 6.11, with the determinant and Teichmüller types fixed and the local types preserved under the restriction of §4.1 (Wan-2015 proof of Theorem 103).

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility, TauCetiRoadmap.PadicLocalLanglandsForGL2Qp and TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Import CompletedCohomologyAndLocalGlobalCompatibility §4.1 (local Langlands families over the completed Hecke algebra), §§4.4–4.5 (Emerton's refined and main local–global compatibility), §4.7(1)–(2) (the dual factorization of completed Borel–Moore homology, for p ≥ 3 with End(ρ̄_p) = 𝔽 and ρ̄_p not a twist of (1 ∗; 0 ε)) and §6.2 (Böckle's R = T). Import PadicLocalLanglandsForGL2Qp §5.5 (endomorphism rings of projective envelopes), §5.7 (deformations of π̄ and ρ̄ coincide), §5.8 (P̃ is the dual of the universal deformation of π̄) and §5.9 (removing P̃ from Hom), which hold for p ≥ 3 with End(ρ̄) = 𝔽 and ρ̄ not a twist of (ε ∗; 0 1) or (1 ∗; 0 ε), and §§5.11, 6.1 and 6.6 (Paškūnas's support criterion and cycle formula, Breuil–Mézard for p ≥ 5, Kisin's local inequality). Import SmoothRepresentationsOfLocalGroups §SR.5.2 (universal Whittaker modules, co-Whittaker families, reduced-family reconstruction and the conditional local Langlands family).

What PadicLocalLanglandsForGL2Qp must provide (gap:paskunas-p3-freeness): the application of §5.11 at p = 3 with End(ρ̄) = 𝔽 and ρ̄ not a twist of (ε ∗; 0 1): reducedness and the freeness of the patched module M(Θ) over the potentially semistable deformation ring of fixed type at its generic points, as used in Nakamura Theorem 4.7 (Paskunas2016 Proposition 2.33, generalizing the p ≥ 5 result of §6.1).

What CompletedCohomologyAndLocalGlobalCompatibility must provide (gap:fw-zeta-local-descent): for p ≥ 3 and an odd globally absolutely irreducible modular residual ρ̄ satisfying FW Assumptions 2.1 and 3.5, including split distinct-character and irreducible but not absolutely irreducible local ρ̄_p, a coefficient-compatible descent from the Hecke/Galois-equivariant completed Borel–Moore homology zeta map constructed in §3.6 below to maps (ρ^m_Σ)^* → H¹_Iw(ℤ[1/Σn, ζ_n], (ρ^m_Σ)^*(1)) over the promodular Hecke algebra, with τ-equivariance, Euler-system relations, change-of-Σ factors and the classical comparison z_(Σ,1)(f) = ∏_(ℓ∈Σ∖{p}) P_(f,ℓ)(σ_ℓ⁻¹) z(f), agreeing with the envelope/Whittaker construction when End(ρ̄_p) = 𝔽, and hence inducing the FW map T_Σ(−1)^+ → H¹(ℤ[1/Σ], T_Σ) (FW Theorem 3.6; NAK §§3–4); the descent and comparison are required without inferring scalar endomorphisms from FW Assumption 2.1.

What SmoothRepresentationsOfLocalGroups must provide (gap:gl2-essential-vectors): for GL₂ over a finite extension of ℚ_ℓ, ℓ ≠ p, and a reduced complete noetherian local p-torsion-free W(𝔽)-algebra, unconditional co-Whittaker families with prescribed generic local Langlands fibres for the principal-series, special and supercuspidal types, and, at the common conductor exponent m of a family with unchanged monodromy filtration, freeness of rank one of its K₁(ϖ^m)-invariants with base change along every specialization (FW Propositions 6.7–6.9).

### From TauCetiRoadmap.GL2ModularityLifting, TauCetiRoadmap.ClassicalSerreModularity and TauCetiRoadmap.SerreWeightAndLevelOptimisation

Import GL2ModularityLifting §5.16 (Kisin's crystalline lifting over ℚ in the medium-weight range), §7.8 (the local exclusions at p), §§8.7–8.8 (modularity lifting for de Rham representations at odd p), §10.5 (Pan's residually irreducible lifting theorem, with residual modularity) and §12.1 (transfer along a congruence with cyclotomically irreducible residual representation, including the ℚ(√p*) criterion). Import ClassicalSerreModularity Layer R27.6 (Serre's conjecture in its strong form, giving a newform of weight k(ρ̄) and level N(ρ̄)) and SerreWeightAndLevelOptimisation §2.13 (descent to the full Serre level). Residual modularity of the two-dimensional constituents in §2.6 comes from Layer R27.6, so the residually modular form of Pan's theorem applies.

## How to read the build

Layer 0 fixes the Selmer, Eisenstein-ideal, period and polarized-lattice conventions and the CM congruence input. Layer 1 gives the ordinary Skinner–Urban application over an imaginary quadratic field. Layer 2 gives the semi-ordinary weight-two Castella–Liu–Wan argument, its general-weight Fouquet–Wan extension, the Beilinson–Flach reciprocity laws and the seed main conjectures at crystalline-short and ordinary points. Layers 3 and 4 use these seed points to construct and trivialize the universal fundamental lines and to specialize them to every classical point. The independent totally real engine of Layer 5 feeds the early two-variable product bound of Layer 6; Layer 7 projects it to the cyclotomic line, compares four quadratic twists and separates the four factors using the opposite Kato bounds. Layer 8 only collects the elliptic endpoints. The selected-field theorem of §5.13 is conditional on its field hypotheses; their existence is §6.4. Suggested.lean states no theorem: none of the headline theorems is statable against the pinned libraries, and its docstring names the missing carriers.

## Layer 0: Congruence ideals and ordinary Selmer classes

### 0.1 Σ-primitive ordinary Selmer groups over Iwasawa towers

Let F be a number field, A a profinite ℤ_p-algebra, T a free A-module of finite rank with a continuous A-linear G_F-action unramified outside a finite set S_T of places of F, and for each place v | p a G_(F_v)-stable A-direct summand T_v ⊆ T with T/T_v free. For a finite set Σ of finite places, Sel^Σ_F(T,(T_v)) is the kernel of the restriction from H¹(F, T ⊗_A A^∨) (A^∨ the Pontryagin dual) to the product over v ∉ Σ, v ∤ p of H¹(I_v, T ⊗ A^∨) and over v | p of H¹(I_v, (T/T_v) ⊗ A^∨): no condition at Σ away from p, unramified elsewhere away from p, and the ordinary (Greenberg) condition at p. Its dual X^Σ_F = Hom_A(Sel^Σ_F, A^∨) is finitely generated over A; this uses the finiteness of S_T. For an extension E/F inside a ℤ_p^d-tower, Sel^Σ_E is the direct limit over finite subextensions and X^Σ_E the inverse limit, and Shapiro's lemma identifies Sel^Σ_(F_∞)(T) with Sel^Σ_F(T ⊗_A Λ_(F,A)(ε_F⁻¹)) as Λ_(F,A)-modules, where Λ_(F,A) = A ⊗̂ ℤ_p[[Gal(F_∞/F)]] and ε_F is the tautological character. When A is noetherian and normal, Ch^Σ_(F,A)(T) denotes the characteristic ideal of X^Σ_F(T) and Ft^Σ_(F,A)(T) its Fitting ideal. The p-condition is imposed for every v|p regardless of membership in Σ. For torsion X, Ch means the divisorial ideal of its length divisor; noetherian normal does not imply principal. Use SU’s zero characteristic-ideal convention if X is not torsion.

Assume T free of finite rank over the profinite ℤ_p-algebra A, with a continuous action of G_F unramified outside a finite set S_T; T_v free direct summands with free quotients for v | p. Σ is finite. Continuity alone does not force finite ramification. If S contains Σ, p and the ramification of T, the same kernel may be computed using H¹(G_(F,S),−); membership of p in Σ does not remove its local condition. The characteristic ideal is used only over noetherian normal A, as the divisorial ideal of height-one lengths.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §3.1.3, p. 18. Skinner–Urban define the Σ-primitive Selmer group by unramified conditions outside Σ ∪ {p} and the ordinary condition given by T_v at p, with its Pontryagin dual X^Σ. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §3.1.8, pp. 20–21, and Prop. 3.2.3, p. 21. Characteristic and Fitting ideals of X^Σ, and Shapiro's identification of the tower Selmer group with one over Λ_(F,A). [CLW](https://arxiv.org/pdf/2109.08375v1), (1.0.1)–(1.0.2) p. 3 and proof of Thm 8.2.1, p. 79. CLW use the instance with relaxed condition at one prime above p and unramified at the other, and its Σ ∪ {ℓ,ℓ′}-primitive variant.

The proof proceeds as follows. Instantiate the imported Selmer kernel with relaxed conditions at Σ away from p, unramified conditions at other non-p places, and Greenberg conditions from T_v at all v|p. Finite generation of the dual: for S finite containing Σ, p and the ramification of T, the Selmer group is a subgroup of H¹(G_(F,S), T ⊗ A^∨), which is cofinitely generated (SU Lemma 3.1.9, stated for a continuous G_(F,S)-module with S finite). Shapiro: the coinduced module of A^∨ along Gal(F_n/F) has direct limit Λ_(F,A)^∨(ε_F⁻¹); the restriction maps at v correspond to the products over places of F_n above v (SU 3.1.2, Prop. 3.2.3). Define Ch^Σ via the height-one length divisor of X^Σ and Ft^Σ via Fitting ideals of a presentation.

The interface is used in SU-2014 Thm 3.6.1, p. 41 to Ch^Σ_(K_∞)(f) is the characteristic ideal of the Σ-primitive dual over the two-variable tower; in CLW-v1 proof of Thm 8.2.1, p. 79 to the Σ ∪ {ℓ,ℓ′}-primitive Selmer group in the lattice argument; in BCS-v2 §2, p. 6 to the ordinary Selmer group H¹_(F_Λ)(M, M_g) over a quartic CM tower, consumed by Layer 6; in [§7.3](#73-cyclotomic-projection-and-characteristic-inequality) to the Σ-primitive groups whose specialization Layer 7 controls.

**API.**

- The Σ-primitive Selmer group Sel^Σ_F(T,(T_v)) is an A-submodule of H¹(F, T ⊗_A A^∨), cut out by the local conditions above.
- For T unramified outside a finite set S_T, the dual X^Σ_F = Hom_A(Sel^Σ_F, A^∨) is a finitely generated A-module.
- Σ ⊆ Σ′ gives an inclusion Sel^Σ ⊆ Sel^(Σ′) and a surjection X^(Σ′) → X^Σ.
- Sel^Σ_(F_∞)(T) ≅ Sel^Σ_F(T ⊗_A Λ_(F,A)(ε_F⁻¹)) as Λ_(F,A)-modules, compatibly with the local conditions.
- For finite torsion X over a noetherian normal domain, Ch is the divisorial ideal corresponding to div(X) (gap:divisorial-char-ideal). In a UFD it agrees with `charIdeal` of PadicMeasuresIwasawaAlgebras §4.6, and it contains the zeroth Fitting ideal, being the smallest divisorial ideal containing it.
- For an ideal 𝔞 with A/𝔞 profinite there is a natural map X^Σ(T)/𝔞 → X^Σ(T/𝔞T); it is an isomorphism under the hypotheses of [§0.3](#03-specializing-σ-primitive-selmer-groups-and-their-characteristic-ideals).
- The module agrees with the Galois Selmer group of SelmerIwasawaCohomology §2.9 whose local conditions are relaxed at the non-p places of Σ, unramified at the other non-p places and Greenberg at every p-place.
- Two classes in Sel^Σ are equal iff their images in global H¹ agree; membership is exactly the vanishing of the stated localization maps.

**Checks.**

- With T_v=T and Σ containing all non-p ramification, Sel^Σ_F is full H¹(G_(F,Σ∪p),T⊗A^∨).
- For the zero coefficient module T=0 all local/global groups and X vanish; Ch=(1). This rejects a construction that inserts a coefficient-independent local summand.
- With T_v=0 the condition is unramified at p, not strict zero: for trivial Q_p/Z_p coefficients at Q_p, a nonzero unramified homomorphism G_Qp/I_p→Q_p/Z_p belongs to this local kernel. A strict zero local condition excludes it.
- For A = 𝔽_p⟦X⟧[ε]/(ε²), primes ℓ_k ≡ 1 mod p and the continuous character of Gal(ℚ^ab/ℚ) sending a generator of tame inertia at ℓ_k to 1+εX^k (of order p, the values tending to 1), T = A(χ) is continuous but ramified at every ℓ_k. It is excluded by the finiteness of S_T, and SU Lemma 3.1.9 does not apply to it.
- If T_v=T at all p-places and S contains Σ, p and ram(T), then Sel^Σ_F=H¹(G_(F,S),T⊗A^∨) when S=Σ∪{v|p}∪ram(T) and ram(T) away from p lies in Σ.
- For Σ⊂Σ′ the quotient embeds in the sum of changed local-condition quotients; surjectivity onto all local terms needs the additional hypotheses of §0.2(iii).

*Needs:* SelmerIwasawaCohomology §§2.1, 2.7, 2.8, 2.9, 2.10, 3.1 and 3.2; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal); Tau Ceti `TauCeti.ContCohomology.H1`; Mathlib `Module.length`; Mathlib `LocalizedModule`.

### 0.2 Primitive against Σ-primitive Selmer groups and the removed Euler factors

Let T, (T_v) and A be as in [§0.1](#01-σ-primitive-ordinary-selmer-groups-over-iwasawa-towers) with A noetherian normal, F any number field, and S a finite set of finite places not above p at which T is unramified, contained in Σ. Then (i) Ch^Σ_(F,A)(T) ⊇ Ch^(Σ∖S)_(F,A)(T) · ∏_(v∈S) det_A(1 − q_v⁻¹ frob_v⁻¹ | T) (SU Lemma 3.2.15, Cor. 3.2.16); (ii) over ℚ_∞, the Pontryagin dual of H¹_Σ(ℚ_∞, T ⊗ A^∨) = ∏_(v∈Σ, v∤p) H¹(ℚ_(∞,v), T ⊗ A^∨) is a finitely generated torsion Λ_(ℚ,A)-module with no nonzero pseudo-null submodule, and its characteristic ideal is generated by ∏_(ℓ∈Σ) P_(T,ℓ)(ℓ⁻¹ ε_ℚ(frob_ℓ)), P_(T,ℓ)(X) = det(1 − X frob_ℓ⁻¹ | (T⊗_A Frac A)^(I_ℓ)) (SU Lemma 3.2.17); (iii) when the primitive dual is torsion and the global-to-local map is surjective (Greenberg–Vatsal), Ch^Σ = Ch^∅ · ∏_(ℓ∈Σ) P_(T,ℓ)(ℓ⁻¹ε(frob_ℓ)) (SU Prop. 3.2.18). On the analytic side the Σ-imprimitive p-adic L-functions are defined by multiplying the primitive ones by the same Euler-factor elements, so every removed factor is matched by the identical element of Λ.

For (i), A is noetherian normal and T is unramified at S, a finite set away from p. For the local cyclotomic module in (ii), use the compact finite-type coefficients of SU §3.2.2; the characteristic-divisor assertion also requires normal noetherian A. For the exact sequence in (iii), A admits decreasing ideals I_n with intersection zero and each A/I_n finite free over Z_p; the primitive X_Q∞(T,T_p) is Λ_Q,A-torsion; T* (the Pontryagin dual in SU §3.1.3) has no nonzero A-submodule with trivial G_Q action; Σ∪{p} contains ram(T). For every finite Σ′⊂Σ, localization onto H¹_(Σ\Σ′) is then surjective (SU Prop. 3.2.18). The Euler polynomial of Lemma 3.2.17 uses inverse frob_ℓ on rational inertia invariants. A rank-one invariant space gives 1−αX, where α is the eigenvalue of that precise inverse Frobenius. Integral lattices and analytic conventions must be compared explicitly.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.15 and Cor. 3.2.16, author-copy p. 26; Lemma 3.2.17, pp. 26–27; Prop. 3.2.18, p. 27. The three comparisons of Selmer groups as Σ varies, with the Euler-factor characteristic ideals. [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1, p. 79. CLW reduce to the Σ ∪ {ℓ,ℓ′}-primitive inclusion using that unramified local cohomology is controlled by local Euler factors (Greenberg–Vatsal Prop. 2.4).

The proof proceeds as follows. (i): the cokernel of Sel^(Σ∖S) → Sel^Σ injects into ∏_(v∈S) H¹(I_v, T ⊗ A^∨)^(G_(F_v)), whose dual has characteristic ideal det(1 − q_v⁻¹frob_v⁻¹|T) because T is unramified at v. (ii): Shapiro over ℚ_∞ and local Tate duality compute the local terms; each is Λ-torsion with characteristic ideal the displayed Euler factor, and has no pseudo-null submodule. (iii): with the localization map surjective the sequence 0 → Sel^∅ → Sel^Σ → H¹_Σ → 0 is exact, and multiplicativity of characteristic ideals gives equality. Analytic matching: the Σ-imprimitive p-adic L-function is by definition the primitive one times ∏_(ℓ∈Σ) P_ℓ(ℓ⁻¹γ_ℓ), so the comparison of characteristic ideals and of analytic functions involves the same elements.

**Checks.**

- Transfer a primitive/imprimitive bound only after matching identical Euler elements on the arithmetic and analytic sides; do not cancel a vanishing specialization.
- A Steinberg Euler element is a unit in the local power-series ring exactly when its residue at augmentation is nonzero. With ℓ=11, p=5 and α=1, 1−ℓ⁻¹γ has augmentation 10/11, so it is not a unit even though the residual representation can be ramified.

*Needs:* §0.1; SelmerIwasawaCohomology §2.23; PadicMeasuresIwasawaAlgebras §§4.1 and 4.6; ArithmeticGaloisDuality §R02.4.3; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 0.3 Specializing Σ-primitive Selmer groups and their characteristic ideals

Let F_∞ be ℚ_∞, K_∞ or K^+_∞, A a profinite ℤ_p-algebra, 𝔞 ⊂ A an ideal and T as in [§0.1](#01-σ-primitive-ordinary-selmer-groups-over-iwasawa-towers). Assume the explicit SU Prop. 3.2.8 hypotheses below, so that X^Σ_(F_∞)(T)/𝔞 ≅ X^Σ_(F_∞)(T/𝔞T). Then (i) Ft^Σ_(F,A/𝔞)(T/𝔞T) = Ft^Σ_(F,A)(T) mod 𝔞; (ii) if A and A/𝔞 are noetherian normal domains and (f) ⊇ Ch^Σ_(F,A)(T) is principal, then f mod 𝔞 divides Ch^Σ_(F,A/𝔞)(T/𝔞T); in particular when A is factorial Ch^Σ_(F,A)(T) mod 𝔞 divides Ch^Σ_(F,A/𝔞)(T/𝔞T). (iii) For the descent K_∞ → K^+_∞ along I^- = ker(Λ_K → Λ_ℚ), X^Σ_(K_∞)(T)/I^- ≅ X^Σ_(K^+_∞)(T), and when A is factorial Ch^Σ_(K_∞)(T) mod I^- divides Ch^Σ_(K^+_∞)(T).

In SU Prop. 3.2.8, inertia at p acts on T/T_p through Γ_Q; Σ∪{p} contains ram(T); F∞ is Q∞, K∞ or K⁺∞; T* (the Pontryagin dual in SU §3.1.3) has no nonzero A-subquotient on which G_F acts trivially. These hypotheses apply for every ideal 𝔞 under consideration, not merely a presumed control isomorphism. The control isomorphism for a general ideal 𝔞 of the coefficient ring is SU Prop. 3.2.8 and is owned here; the derived control of SelmerIwasawaCohomology §3.10 covers the specialization to finite layers of a one-variable tower and is used only there. The control isomorphism needs SU Prop. 3.2.8's hypotheses; without them only a map with kernel and cokernel controlled by H⁰ and local terms exists. Characteristic ideals do not commute with base change in general; only the principal majorant transfers (ii). A specialization at which f vanishes gives no information.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Prop. 3.2.8, p. 23; Cor. 3.2.9, Prop. 3.2.11, p. 24. The control isomorphism, the Fitting base change, the principal-majorant divisibility and the descent from K_∞ to K^+_∞. [BCS-v2](https://arxiv.org/pdf/2405.00270v2), proof of Lemma 5.1.1, p. 9. BCS apply SU Props 3.6–3.7 and Cor. 3.8 (journal numbering) to restrict from a quartic CM tower to K.

The proof proceeds as follows. Fitting ideals commute with base change of a presentation (i). The characteristic ideal is the smallest divisorial ideal containing the Fitting ideal; a principal ideal is divisorial, so (f) ⊇ Ch ⊇ Ft and reduction gives f mod 𝔞 ∣ Ft(T/𝔞) ⊆ Ch(T/𝔞) (ii). For (iii), Shapiro along Γ^-_K and Prop. 3.2.8 identify Sel^Σ_(K^+_∞) with the I^- torsion of Sel^Σ_(K_∞), and (ii) applies.

**Checks.**

- Vanishing check: if f ∈ 𝔞 the conclusion of (ii) is empty, and no cancellation of f against the specialized characteristic ideal is allowed.
- Direction: for A = ℤ_p⟦T⟧, 𝔞 = (T) and X = A/(p,T), the module is pseudo-null over A, so Ch_A(X) = A and its specialization is ℤ_p. But X/TX = 𝔽_p has characteristic ideal (p), strictly contained in ℤ_p. Thus (ii) has the stated containment; the reverse would require 1 ∈ (p).
- For X = A/(T) ⊕ A/(T−p), Ch_A(X) = (T(T−p)) specializes to 0, and X/TX = ℤ_p ⊕ 𝔽_p has positive rank and extended characteristic ideal 0. This tests only the zero convention, since both containments are equalities.
- For X = A/(p) the generator p reduces to p and X/TX = 𝔽_p has characteristic ideal (p): the μ-part specializes without loss.

*Needs:* §0.1; SelmerIwasawaCohomology §3.10; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal); Tau Ceti `TauCeti.fittingIdeal` with its base change (cited in PadicMeasuresIwasawaAlgebras §6.5).

### 0.4 The Eisenstein ideal of an Eisenstein family

Let Λ be a noetherian complete local domain, 𝕋 a reduced finite Λ-algebra generated over Λ by the images of a set 𝒯 of Hecke operators acting on a space of Λ-adic cusp forms, and λ: 𝒯 → Λ the system of eigenvalues of a Λ-adic Eisenstein family E (a Λ-algebra homomorphism from the abstract Hecke algebra). The Eisenstein ideal I_E ⊆ 𝕋 is the ideal generated by t − λ(t) for t ∈ 𝒯; when the structure map Λ → 𝕋/I_E is surjective, the Eisenstein ideal of Λ is its kernel E_E, so that Λ/E_E ≅ 𝕋/I_E. When I_E is proper, 𝕋_E denotes the localization of 𝕋 at the maximal ideal containing I_E.

Assume 𝕋 is generated over Λ by 𝒯 together with the U_p-operators, so Λ → 𝕋/I_E is surjective; otherwise E_E is defined as the kernel on the image. The Hecke operators are those at primes outside a fixed finite set Σ, the U_p-operators, and the central or diamond operators used by the source.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §6.5.3, pp. 97–98, (6.5.3.a). Skinner–Urban define I_D by the coefficients of Q_v(X) − Q_(v,D)(X), the U_p-relations and the central operators, and 𝔈_D as the kernel of Λ_D → h_D/I_D. [FW](https://arxiv.org/pdf/2107.13726v3), Def. 7.30, p. 96. Fouquet–Wan define I_D by t − λ(t) for the Klingen Eisenstein family and 𝔈_D as its inverse image in O[[Γ_K]]. [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1, p. 79. The ideal E_(π,ξ) used in the set-up (5).

The proof proceeds as follows. Define I_E as the ideal generated by {t − λ(t) : t ∈ 𝒯} and E_E := ker(Λ → 𝕋/I_E). Surjectivity follows because the generators of 𝕋 over Λ act by scalars of Λ modulo I_E.

The interface is used in [§1.3](#13-the-p-adic-eisenstein-datum-and-its-eisenstein-ideal) to the SU generators of I_D; in [§2.5](#25-the-clw-eisenstein-ideal-is-bounded-by-the-p-adic-l-functions) to E_(π,ξ) bounded below by L_(π,K,ξ)L_(ξ,ℚ); in [§2.12](#212-general-weight-fourierjacobi-values-the-two-family-theorem) to Lemma 7.31's comparison ord_P(L) ≤ ord_P(𝔈_D); in [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups) to the ideal J := E_E A and I := I_E R of the abstract set-up.

**API.**

- The Hecke-side Eisenstein ideal I_E ⊆ 𝕋 is generated by the differences t − λ(t), t ∈ 𝒯.
- The coefficient Eisenstein ideal is E_E := ker(Λ → 𝕋/I_E).
- Formation of I_E and its contraction E_E commutes with flat coefficient base change, in particular Λ→Λ_P and Λ_P→Λ̂_P. Here 𝕋 is transported by tensor product; noetherianity makes the completion flat. Completing a chosen local Hecke factor also requires the compatible factor decomposition. No assertion is made for arbitrary quotient specialization, which need not preserve kernels.
- For a unital structure map, E_E≠⊤ iff I_E≠⊤. For finite local Λ-algebras, this is equivalent to existence of a residue-field cuspidal eigensystem satisfying the specified congruences.
- Enlarging 𝒯 enlarges I_E; restricting to a direct factor of 𝕋 enlarges E_E.
- Equality of the generated Hecke ideals implies equality of their contractions; membership in E is equivalent to the image in 𝕋/I being zero.

**Checks.**

- For weight 12, level 1 cusp forms over ℤ_691 with E = E_12 (λ(T_ℓ) = 1 + ℓ¹¹), 𝕋 = ℤ_691 and E_E = (691). Ramanujan's congruence gives containment in (691), and τ(2)−(1+2¹¹)=−2073=−3·691 gives equality; replacing the ideal by (691²) fails this check.
- If no cusp form is congruent to E, then I_E = 𝕋 and E_E = Λ (for example weight 12 at p = 5).
- In a weight-two prime-level Mazur setting, I_E in the cuspidal Hecke algebra is generated by the appropriate T_ℓ−1−ℓ and 1+w_N. E_E is its contraction along Λ→𝕋, an ideal in Λ; it is not identified with that Hecke ideal.
- E_E differs from the congruence ideal of a cuspidal eigenform: for weight 12, level 1 and p = 691 the congruence ideal of Δ in the cuspidal Hecke algebra is the unit ideal (𝕋 = ℤ_p), while E_E = (691).
- The congruence statements of Layers 1 and 2 are lower bounds ord_P(E_E) ≥ ord_P(L) for height-one primes P of Λ, from a cuspidal family congruent to E.
- For Λ=Z, 𝕋=Z[X], the constant structure map and one equal operator/eigenvalue pair 7, I_E=0 and E_E=0. The induced coefficient map still misses X. Thus vanishing operator differences alone cannot replace the algebra-generation or quotient-surjectivity hypothesis.

*Needs:* Mathlib `Ideal.span`; Mathlib `RingHom.ker`; Mathlib `Ideal.map`.

### 0.5 The Skinner–Urban lattice datum

Let H = G ⋊ {1, c} with c of order two, A a complete discrete valuation ring with fraction field F and maximal ideal m, and R a local reduced finite flat A-algebra with R/M = A/m. A lattice datum consists of: (1) a character ν: H → A^×; (2) a character χ: G → A^× with χ̄ ≠ ν̄χ̄⁻ᶜ, and χ′ := νχ⁻ᶜ; (3) a representation ρ: G → Aut_A(V), V ≅ A^n, with ρ^c ≅ ρ^∨ ⊗ ν, ρ̄ absolutely irreducible and ρ residually disjoint from χ and χ′ (some x ∈ A[G] has coprime residual characteristic polynomials); (4) a representation σ: G → Aut_(R⊗F)(M), M ≅ (R ⊗ F)ⁿ⁺², with σ^c ≅ σ^∨ ⊗ ν, tr σ(G) ⊆ R and finitely generated R[G]-orbits; (5) a proper ideal I ⊂ R with J := A ∩ I ≠ 0, A/J ≅ R/I and tr σ ≡ χ′ + tr ρ + χ mod I. Local data at a subgroup D ⊂ G: a D-stable free summand M^+ ⊆ M with free quotient, a D-stable free summand V^+ ⊆ V, and the congruence Ch(M^+, x, T) ≡ Ch(V^+, x, T)(1 − Tχ(x)) mod I for x ∈ R[D]. The datum is ν-polarized when ν is compatible (Φ^t = −ν(c)Φ) with the polarization of ρ.

Assume the polarization conditions are those of SU 4.2.2; residual disjointness is in the sense of SU 4.1.2. In applications G = G_(M,Σ) and H = G_(F,Σ) for a totally real field F and a CM quadratic extension M/F, with c a complex conjugation; D is a decomposition group at a place of M above p, A the completion of a localization of an Iwasawa algebra at a height-one prime P, and R a completed local Hecke algebra. SU, CLW and FW take F = ℚ and M = K imaginary quadratic; Wan 2015 takes F totally real and n = 2. SU §4.3 requires the common residue field κ to have at least n+2 nonzero elements. To deduce compatibility of ν with σ from Lemma 4.3.3, require char κ≠2 and absolute irreducibility of every field factor σ_i; otherwise compatibility with σ is a separate hypothesis of the Selmer consequence. SU Ch(θ,x,T)=det(1−Tθ(x)); convert Mathlib’s det(TI−θ(x)) before invoking polynomial congruences.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §4.1.2, Lemma 4.1.3, p. 48; §4.2.1–4.2.3, pp. 48–49; §4.5.1–4.5.3, p. 59. The rings A and R, the polarized data (1)–(5) and the local conditions with their congruence of characteristic polynomials. [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1, p. 79. CLW list the data (1)–(5) for GU(3,1), taking ν trivial and σ from the pseudo-representation of the semi-ordinary Hecke algebra. [Wan-2020](https://arxiv.org/pdf/1408.4044v5), introduction, p. 4. Wan's U(3,1) argument follows the SU set-up; its lattice construction (Prop. 9.2, set-up (1)–(9)) is the variant used by CLW and FW. [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §9.2.1, set-up (1)–(10) and Proposition 98, pp. 84–86. The same datum for H = G_(F,Σ) ⊃ G = G_(M,Σ) with middle rank two, its polarization sign Φ^t = −ν(c)Φ and the plus/minus local pieces at every place above p.

The proof proceeds as follows. Record the data (1)–(5) and the local data 4.5.1–4.5.3 as fields; derive the congruence for the quotients M^- and V^- from 4.3.1. Residual disjointness gives projectors x_1, x_2 ∈ B[G] with x_i acting as identity on one summand and zero on the other (SU Lemma 4.1.3, via the Henselian property).

The interface is used in [§1.9](#19-the-skinnerurban-selmer-lower-bound-from-the-eisenstein-ideal) to the instance of SU 7.3.2 with A = Λ̂_(D,P) and R = 𝕋̂_(D,Q); in [§2.7](#27-the-castellaliuwan-divisibility-over-the-cyclotomic-localized-ring) to the GU(3,1) instance with ν trivial; in [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture) to the general-weight GU(3,1) instance; in [§5.8](#58-polarized-121-extension-with-ordinary-local-conditions) to the Hilbert GU(2,2) instance over a totally real field.

**API.**

- The companion character is χ′ = νχ⁻ᶜ.
- The trace satisfies tr σ ≡ χ′ + tr ρ + χ modulo I.
- Residual disjointness gives elements x_1, x_2 ∈ R[G] acting as the identity on one residual constituent and as zero on the other (SU Lemma 4.1.3).
- Given descent data satisfying SU §4.4 and the freeness/residual conditions, localization and completion produce the datum; preservation of absolute irreducibility and disjointness must be checked, not inferred for arbitrary base change.
- The local data are the D-stable summands M^±, V^± with the congruence of characteristic polynomials of the plus parts, which implies the corresponding congruence for the minus parts with χ′ in place of χ.
- The R[G]-span of a lattice in M carries a generalized-matrix-algebra structure of type (1, n, 1) relative to the residual decomposition.
- A datum is given by the five fields of SU §4.2.3, the compatibility of ν with the polarization of ρ, and the local data.
- Isomorphisms of the coefficient representations preserving χ,ν,I and the chosen local summands transport the datum and its trace/polynomial identities.

**Checks.**

- For eigenvalues 1, 2, 3, 4 the reciprocal polynomial is 1 − 10X + 35X² − 50X³ + 24X⁴, so minus its X coefficient is 10, the trace. Minus its cubic coefficient is 50. The monic characteristic polynomial is X⁴ − 10X³ + 35X² − 50X + 24; conversion preserves the trace 10.

- Rank n=0 is excluded by the absolutely irreducible middle-constituent requirement. A bare two-character Ribet datum cannot be passed to this constructor; the rank-two Ribet theorem is a distinct supplier contract.
- In SU 7.3.2, χ = σ_(χ̄_f,0)σ^c_ψ ε⁻³, ρ_0 = ρ_f ⊗ σ_(χ̄_f,0)σ⁻ᶜ_ξ σ^c_ψ ε⁻², χ′ = σ_(χ̄_f,0)ε⁻¹det ρ_f σ⁻¹_(ξ′)σ^c_ψ, and ν is fixed by χ^cχ′ = σ^2_(χ̄_f,0)ε⁻⁷ε_ℚ⁻²; these satisfy χ′ = νχ⁻ᶜ, and the trace of ρ_D in (6.5.2.a) is χ + tr ρ_0 + χ′.
- If χ̄ = ν̄χ̄⁻ᶜ then condition (2) fails; SU (dist) and CLW's ξ_p ≢ ξ_p̄ are exactly what rule this out.
- For a lattice datum with σ residually multiplicity free, the generalized matrix algebra of type (1, n, 1) on the R[G]-span of a lattice agrees with the one of IntegralHeckeAndGaloisDeterminants §1.3 for the same residual decomposition; with n = 0 the decomposition would have two blocks and the datum is rejected.
- The SU instance (SU 7.3.2), the CLW instance (proof of CLW Thm 8.2.1, items (1)–(5)) and the FW instance (proof of FW Thm 7.32) are all lattice data with n = 2 and (F, M) = (ℚ, K).
- Wan's Hilbert datum (Wan 2015 §9.2.2, p. 87: ρ = ρ_f ⊗ σ_ξ⁻ᶜσ_ψ^c ε⁻², χ = σ_ψ^c ε⁻³, χ′ = νχ⁻ᶜ) is a lattice datum with n = 2 over a totally real F ≠ ℚ; its trace is χ′ + tr ρ + χ, of total rank 4. A datum whose groups are taken over ℚ when F ≠ ℚ has the wrong local subgroups at the places above p and is rejected by the local-data clause.

*Needs:* IntegralHeckeAndGaloisDeterminants §§1.3 and 1.4; Mathlib `IsDiscreteValuationRing`; Mathlib `IsReduced`; Mathlib `Matrix.charpoly`.

### 0.6 Local conditions satisfied by the automorphic extension classes

For a [§0.5](#05-the-skinnerurban-lattice-datum) with a stable lattice, its residual block projectors and the SU §4.4 off-diagonal cocycle c_φ(g)=(φ⊗id)(χ⁻¹(g)σ(g)ε̄*−ε̄*), the classes [c_φ] obtained from the off-diagonal blocks of σ satisfy, after multiplication by an element t ∉ P: (a) at every place v ∉ Σ they are unramified, since σ is unramified outside Σ; (b) at the primes above p they lie in the kernel of restriction to H¹(D, V^-_0 ⊗ A_0^∨(χ⁻¹)) for D = G_(K,p) (the ordinary condition), and by the polarization the corresponding statement holds at G_(K,p̄); (c) at places v ∈ Σ, v ∤ p, no condition is imposed (Σ-primitive). At a Steinberg place, pass between Σ-primitive and primitive objects using the precise Euler element of §0.2; residual ramification alone does not make that element a unit.

Assume the residual disjointness of V^+ ⊕ A(χ) and V^- ⊕ A(χ′) modulo P (SU (7.3.3.a)) is what produces the D-projector; it is verified in each instance (SU proof of Thm 7.3.5, CLW and FW checks). The same local bridge is required over a totally real F and its CM quadratic M/F for the Wan 98 characters specified in [§5.8](#58-polarized-121-extension-with-ordinary-local-conditions), at every v|p. The imported polarized extension theorem and the exact local plus/minus disjointness hypotheses are retained.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Prop. 4.5.4, pp. 59–60; proof of Thm 7.3.5, p. 107. The ordinary local condition at p from the projector, and the verification of residual disjointness of the four characters at p. [FW](https://arxiv.org/pdf/2107.13726v3), Thm 1.6(2), p. 6; Assumption 3.7, p. 25. Thm 1.6(2) has both the inertia-dimension and decomposition-invariants conditions; Assumption 3.7 has only the former.

The proof proceeds as follows. (a) σ, hence every block, factors through G_(K,Σ). (b) is SU Prop. 4.5.4(ii): the projector x^+ acts as identity on M^+ and kills M^-, so the extension restricted to D splits along the filtration. At Steinberg places compute the Euler element by local duality. FW Assumption 3.7 imposes dim ρ̄^(I_ℓ)=1; Thm 1.6(2) additionally imposes dim ρ̄^(G_ℓ)=0. Neither substitutes for the unit criterion of §0.2.

**Checks.**

- Condition (b) is the kernel of restriction to the whole decomposition group D on the minus part, which is contained in the inertial kernel defining the Selmer group of §0.1. For V⁻_0 = A_0 = ℤ_p with trivial action, the unramified homomorphism G_(ℚ_p)/I_p → ℚ_p/ℤ_p sending Frobenius to 1/p lies in the inertial kernel but not in the D-kernel, so (b) is the stronger conclusion and implies membership in the Selmer group.
- Condition (a) needs Σ to contain every place where σ ramifies: at a place v ∉ Σ where σ is ramified the off-diagonal classes can be ramified, and (a) fails.
- At a Steinberg place ℓ = 11 with p = 5 and normalized eigenvalue α = 1, the Euler element of §0.2 has augmentation 1 − 1/11 = 10/11, of 5-adic valuation one, so the classes of (c) need not lie in the primitive Selmer group although the residual representation is ramified at ℓ.

*Needs:* §§0.2 and 0.5; SelmerIwasawaCohomology §§2.7 and 2.8; IntegralHeckeAndGaloisDeterminants §5.3.

### 0.7 The lattice construction: Eisenstein ideals bound Selmer groups

Let F be totally real, M/F a CM quadratic extension in which every place above p splits, and Σ a finite set of places of F containing those above p and ∞. Let (ν, χ, ρ, σ, I) be a ν-polarized lattice datum ([§0.5](#05-the-skinnerurban-lattice-datum)) of middle rank n ≥ 1 with H = G_(F,Σ), G = G_(M,Σ), and local data at D_w = G_(M_w) for one place w above each place of F above p (the places of a p-adic CM type), satisfying SU 4.5.1–4.5.3 at each D_w, with V^+_0 ⊕ A(χ) and V^-_0 ⊕ A(χ′) residually disjoint modulo P, where A = Â_(0,P) for a height-one prime P of a noetherian normal domain A_0, and J = A ∩ I. Then (i) ord_P Ch^Σ_ℚ(ψν) ≥ ℓ_P(ℒ̄(χ′)/𝒥̄(χ′)); (ii) ord_P Ch^Σ_K(ρ_0 ⊗ χ⁻¹) ≥ ℓ_P(N/N′) (SU Prop. 4.5.6(ii)), and if moreover N′ = 0 and the orbit module spans, ℒ ⊗_A Frac(A) = M, then ord_P Ch^Σ_K(ρ_0 ⊗ χ⁻¹) ≥ ord_P(J), because spanning gives Fitt_R(N) ⊆ I (SU Lemma 4.3.10(iii)); (iii) if ord_P Ch^Σ_ℚ(ψν) = 0 and either ℒ ⊗_A Frac(A) = M or the hypothesis of SU Lemma 4.3.11 holds, then ord_P Ch^Σ_K(ρ_0 ⊗ χ⁻¹) ≥ ord_P(J) (SU Cor. 4.5.7, whose proof passes through the case N′ = 0 of (ii)); (iv) under SU Lemma 4.3.11, if ord_P(J) > ord_P Ch^Σ_ℚ(ψν) then ord_P Ch^Σ_K(ρ_0 ⊗ χ⁻¹) ≥ 1 (SU Prop. 4.5.8). Here ℓ_P is the length at P; ψ is the character of H extending χ⁻ᶜχ⁻¹ with ψ(c) = 1, so that ψν restricts to χ′/χ on G (SU §4.4.3); for the R[G]-stable orbit module ℒ ⊂ M of SU §4.3, write ℒ = ℒ(χ′) ⊕ ℒ(ρ) ⊕ ℒ(χ) for its unreduced block decomposition and ℒ̄ := ℒ/Iℒ, with ℒ̄(μ) := ℒ(μ)/Iℒ(μ). Each block map A_(μ,λ)(x): ℒ(λ) → ℒ(μ) induces Ā_(μ,λ)(x): ℒ̄(λ) → ℒ̄(μ). Put 𝒥̄(χ′) := ∑_x im Ā_(χ′,ρ)(x) and 𝒥̄(ρ) := ∑_x im Ā_(ρ,χ′)(x), for x ∈ R[G]. Put N := ℒ̄(α_2), the first middle matrix-unit block for the fixed projectors of SU §4.3. This is a finite torsion R-module, and the reduced diagonal action gives ℒ̄(ρ) ≅ N ⊗_R (V ⊗_A R) as representations (SU Lemma 4.3.10(ii)); N′ ⊆ N corresponds to 𝒥̄(ρ), and ℒ̄(ρ)/𝒥̄(ρ) ≅ (N/N′) ⊗_R (V ⊗_A R) (SU (4.4.1.c)). These assertions concern ℒ̄, not ℒ. Here the Selmer groups are the Σ-primitive ones of [§0.1](#01-σ-primitive-ordinary-selmer-groups-over-iwasawa-towers) for the pairs (A_0(ψν), 0) and (V_0(χ⁻¹), V^+_0(χ⁻¹)); for general (F, M) the subscripts ℚ and K are read as F and M. SU states and proves (i)–(iv) for (F, M) = (ℚ, K) and every n; Wan 2015 Proposition 98 proves the case n = 2 for a general totally real F. The construction of SU §§4.3–4.4 uses only the profinite pair G ⊂ H of index two, the polarization and the local subgroups, and §4.5 uses only the Selmer conditions at the places of M, so the same proof gives the general statement. The variant of Wan20 Prop. 9.2 replaces the irreducibility of σ by condition (9): every specialization σ_λ is absolutely irreducible or contains an absolutely irreducible two-dimensional subrepresentation with trace ≡ χ + χ′ modulo I.

Assume P is a height-one prime of A_0 with A_0 noetherian normal; the polarization ν is compatible with the polarization of ρ (4.5.5.a). The bound concerns the Σ-primitive groups; primitive versions follow by [§0.2](#02-primitive-against-σ-primitive-selmer-groups-and-the-removed-euler-factors). The excluded case ord_P Ch^Σ_ℚ(ψν) > 0 is where the abelian Selmer group may absorb the extensions; CLW and Wan exclude such P explicitly. Use SU §4.4 descent: A_0 is a profinite Krull domain with height-one P and completion A; R_0 is a reduced local finite A_0-algebra with Q over P and completed R; ρ descends to the free A_0-representation V_0, σ has trace in R_0 and finite R_0[G]-orbits, and I_0,J_0 are the contractions. G,H are profinite and representations continuous. For SU §4.5.5 require ν compatible with the polarization Φ of σ, and V⁺_0 an A_0-free direct summand stable under G_Qp. This compatibility follows from Lemma 4.3.3 only in odd residue characteristic with each σ_i absolutely irreducible. The Wan20 Prop. 9.2 variant requires all its setup (1)–(9), including a rank-one local M⁺ character congruence and disjoint M⁻ constituent. Its condition (9) permits a two-dimensional absolutely irreducible subrepresentation whose trace is congruent to χ+χ′, not χ+χ⁻ᶜ unless ν=1. The auxiliary one-dimensional Selmer factor must have valuation zero for the full length-of-J bound.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §4.3–4.5, Props 4.4.4–4.4.5, 4.5.4, 4.5.6, Cor. 4.5.7, Prop. 4.5.8, pp. 52–61. The cocycle construction, the local conditions at p and the length bounds. [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1, pp. 79–80. CLW verify Wan20's properties (6)–(9), with (9) by the CAP-exclusion argument, then apply Wan20 Prop. 9.2 at height-one P with ord_P(E_(π,ξ)) > 0 and (X_(ξ∘Nm) ⊗ ℚ)_P = 0. [FW](https://arxiv.org/pdf/2107.13726v3), proof of Thm 7.32, pp. 96–97. Fouquet–Wan apply the lattice construction (Wan20 Prop. 9.2) to the semi-ordinary GU(3,1) pseudo-character. [Wan-2020](https://arxiv.org/pdf/1408.4044v5), §9, setup (1)–(9) and Prop. 9.2, PDF pp. 93–94. The variant’s complete local/descent setup and alternative irreducibility condition, with its complete local and descent hypotheses. [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §9.2.1, Proposition 98, pp. 84–86. The totally real, middle-rank-two form with its ten set-up conditions, including the alternative condition (10) for a characteristic-zero specialization.

The proof proceeds as follows. Choose the stable orbit module ℒ of SU §4.3 and then reduce it modulo I. In ℒ̄ the sum Sub(ℒ̄) = ℒ̄(χ′) ⊕ ℒ̄(ρ) is G-stable and Quot(ℒ̄) ≅ (R/I)(χ). The two extensions have middle terms ℒ̄/(ℒ̄(ρ) ⊕ 𝒥̄(χ′)) and ℒ̄/(ℒ̄(χ′) ⊕ 𝒥̄(ρ)), with kernels ℒ̄(χ′)/𝒥̄(χ′) and ℒ̄(ρ)/𝒥̄(ρ), respectively (SU (4.4.1.a–c)). For the second extension let C be the R_0[G]-submodule generated by the reduced lift ε̄* and C₁ its intersection with the kernel. Choose a finite R_0-submodule 𝒩 ⊆ N/N′ with C₁ ⊆ 𝒩 ⊗_(A_0) V_0; its localization/completion recovers N/N′ as in SU §4.4. Define c_φ(g) = (φ ⊗ id)(χ⁻¹(g)σ̄(g)ε̄* − ε̄*) for φ ∈ Hom_(A_0)(𝒩, A_0^∨), using the induced action σ̄ on the reduced extension. This gives Hom_(A_0)(𝒩, A_0^∨) → H¹(G, V_0 ⊗ A_0^∨(χ⁻¹)); its dual is surjective after localizing at P (SU Props 4.4.4–4.4.5). Local conditions: the projector x^+ ∈ R[D] splits the D-extension, so a multiple t ∉ P of the image lies in the kernel of restriction to H¹(D, V^-_0 ⊗ A_0^∨(χ⁻¹)), i.e. satisfies the ordinary condition (SU Prop. 4.5.4); by polarization the same holds at the conjugate prime. Lengths: the dual Selmer group surjects onto Hom_(A_0)(𝒩, A_0^∨)^∨ localized at P, whose length is that of N/N′, giving (ii); For (iii): the vanishing of ord_P Ch^Σ_ℚ(ψν) and (i) give 𝒥̄(χ′) = ℒ̄(χ′), hence N′ = 0 by Lemma 4.3.8(i). If ℒ spans M, the spanning case of (ii) applies. Under Lemma 4.3.11 instead, ℒ̄(χ′) is a faithful A/J-module and is the sum of the images of the maps Ā_(χ′,ρ)(x) on ℒ̄(ρ) ≅ Nⁿ, so Ann_A(N) ⊆ J; over the discrete valuation ring A this gives ℓ_P(N) ≥ ℓ_P(A/Ann_A(N)) ≥ ord_P(J), and (ii) concludes. (iv) follows from (i), (ii) and Lemma 4.3.11. For Wan20 Prop. 9.2 read and verify setup (1)–(9), retaining its rank-one ordinary line and alternative two-dimensional irreducible-subrepresentation case. This source-specific polarized construction is not a specialization of the supplier’s two-dimensional local Ribet theorem.

**API.**

- Reduction sends every block map ℒ(λ) → ℒ(μ) to the indicated map ℒ̄(λ) → ℒ̄(μ); the reduced diagonal middle block acts through ρ modulo I.
- Sub(ℒ̄) is G-stable and the quotient is (R/I)(χ). The two reduced extensions and their kernels are those displayed above.
- The isomorphism ℒ̄(ρ) ≅ N ⊗_R (V ⊗_A R) carries 𝒥̄(ρ) to N′ ⊗_R (V ⊗_A R), so its quotient uses N/N′.
- The cocycle map has source Hom_(A_0)(𝒩, A_0^∨) and the stated global H¹ target; after localization its dual and the local-condition comparison give the length bound.

**Checks.**

- Over a DVR R with I = (ϖ), an unreduced free middle block R² has generic rank 2. Its reduction is (R/ϖ)² = (R/ϖ) ⊗_R R², with N = R/ϖ and generic rank 0. Attaching this N to R² gives unequal generic ranks.
- With N = R/ϖ² and N′ = ϖN, the reduced kernel is (R/ϖ)ⁿ and length(N/N′) = 1, while length(N) = 2. This distinguishes the quotient used in (ii).
- For I = (ϖ), the scalar ϖ map on an unreduced block becomes zero on its reduction. For I = R the entire reduction would be zero; the lattice datum excludes that case by requiring I proper.
- A height-one prime with ord_P(J) = 2, N′ = 0 and spanning orbit module must give ord_P(Ch) ≥ 2, not just ≥ 1.
- Negative control for the spanning hypothesis: the split datum σ = χ′ ⊕ ρ ⊕ χ satisfies the trace congruence for every proper I, and the orbit of the χ-basis vector is the line through it, so N = N′ = 0 and (ii) only gives ord_P(Ch) ≥ 0. With K = ℚ(i), p = 5, A = ℤ_5, I = (5), n = 1, χ = 1 and ρ the cyclotomic character, the middle Selmer group is zero (class number 1, and the S-unit 1 + i has (1 + i)⁴ = 1 − 5, primitive in the principal units at either prime above 5), while ord_P(J) = 1; so N′ = 0 alone does not give the length-of-J bound.
- Over F = ℚ(√5) with M/F CM, the datum of Wan 2015 §9.2.2 is admissible with n = 2, and the conclusion bounds a Selmer group over M; a version with H = G_(ℚ,Σ) cannot express Wan's local conditions at the two places of F above a split p.
- Excluded-prime check: when ord_P Ch^Σ_ℚ(ψν) > 0 and Lemma 4.3.11 fails, no conclusion is drawn.
- The extension classes are those of the automorphic family; the theorem does not presuppose any divisibility of characteristic ideals.

*Needs:* §§0.1, 0.5 and 0.6; IntegralHeckeAndGaloisDeterminants §1.4; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal); Mathlib `Module.length`.

### 0.8 Canonical periods, Petersson norms and the congruence number

For the p-stabilized ordinary newform f over a finite integral extension R⊂Q̄_p of Z_p satisfying (irred) and (dist), SU Lemma 12.2.2 gives η_f = u_f·2⁻³(2i)^(κ+1) S(f)·⟨f,f^c|W_(p^rM)⟩/(Ω_f^+Ω_f^-), with u_f∈R^× and S(f) the explicit stabilization correction of SU (11.7.3.b). Under the stated integral/Gorenstein hypotheses η_f generates the congruence ideal. For a primitive ordinary family over an integral finite Λ-algebra I satisfying (irred),(dist), the family congruence generator η_I specializes to the η_f choices (SU pp. 194–195); Lemma 12.2.7 supplies the integral functional used in the canonical-period-normalized Eisenstein coefficients. No canonical/Gross period comparison or unproved identification of EPW homology and SU cohomology period lattices is used.

Assume (irred) and (dist) for f, which give the freeness of the relevant Hecke modules and the Gorenstein property used to make the congruence module cyclic. The unit u_(f_φ) in SU Thm 12.3.1(ii) depends only on f_φ and is not specified further. The Hilbert extension uses Wan Definition 79: the Gorenstein pairing identifies the intersection of the integral Hecke algebra with its rational f-eigenline with the principal congruence line. It requires the same finite free Hecke module and paired eigenlattice; its generator defines the period only up to the compatible coefficient unit, as specified in [§5.2](#52-integral-congruence-line-generator-and-canonical-period).

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thm 12.3.1 (i)–(ii), p. 199; Thm 12.4.1, pp. 202–203. The Petersson-normalized and the Ω^+Ω^--normalized interpolation formulas, the latter integral under (irred) and (dist). [FW](https://arxiv.org/pdf/2107.13726v3), remark before Thm 1.6, p. 6. Deducing Thm 1.6 from SU would need a comparison of the canonical and Gross periods, which Fouquet–Wan say may not exist in the literature in the generality needed. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 12.2.2 and family discussion, author-copy pp. 194–195; Lemma 12.2.7, pp. 197–198; (11.7.3.b). The full congruence-period formula and the family integral functional.

The proof proceeds as follows. Use SU’s integral cohomological lattice and Lemma 12.2.2, retaining S(f) and every displayed normalization; do not replace the formula by an unqualified Petersson quotient. Use the family construction on p. 195 and the functional of Lemma 12.2.7 (pp. 197–198) to obtain the two normalizations of Thm 12.3.1 and Thms 12.4.1–12.4.2. The generic congruence module is that of PadicFamilies §§1.7–1.10. The comparison of the period lattice of PadicFamilies §1.3 with SU's cohomological normalization is part of this target.

**Checks.**

- The integral normalization is the one in which the lattice construction measures congruences; replacing Ω^+Ω^- by a non-integral period breaks the integrality of ℰ_D's coefficients.
- Replacing Ω_f^+Ω_f^- by uΩ_f^+Ω_f^- with u ∈ R^× multiplies η_f by u⁻¹ and leaves the congruence ideal (η_f) unchanged; replacing it by ϖΩ_f^+Ω_f^- changes ord_ϖ(η_f) by one, so the period is fixed only up to R^×.
- For Δ ∈ S_12(SL₂(ℤ)) the cuspidal Hecke algebra is ℤ_p, so the congruence ideal of Δ is the unit ideal at every p, including p = 691 where Δ is congruent to the Eisenstein series; the congruence ideal measures cusp-form congruences only, and the Eisenstein congruence is the ideal of §0.4.

*Needs:* PadicFamilies §§1.3, 1.7, 1.8, 1.10 and 1.11.

### 0.9 CM theta-family congruence and Katz normalization for the CLW integrality input

Let K be imaginary quadratic, p ≥ 3 a prime split in K, ξ a Hecke character as in CLW §5.2 with ξ_p ≢ ξ_p̄ modulo the maximal ideal of O_L, and g the ordinary CM Hida family through the CM form σ_ξ, with coefficients in the anticyclotomic ring O^ur[[Γ_K^−]]. Let H(g) generate the congruence ideal of g, which is the denominator of Hida's Rankin–Selberg p-adic L-function for g against a fixed form, and let L^Katz_ξ be the anticyclotomic Katz p-adic L-function of the branch character, with h_K the class number of K. Prove that H(g) divides h_K·L^Katz_ξ in O^ur[[Γ_K^−]] for every such K, p and ξ, at every tame conductor. Here h_K·L^Katz_ξ carries the normalization in which CLW's L^Hida is the product (HT93 Theorem 7.1 and (8.8b); Hid91 Lemma 5.3(vi)): up to a unit it interpolates the self-Petersson products of the specializations of g divided by the CM period, so the divisibility compares the congruence ideal of g with its CM-period-normalized Petersson norm. The proof splits into the following cases; (A) and (B) are proved here from the literature, (C) is the rational statement, and (D) is supplied.

- (A) p ≥ 5 and the branch character satisfies the hypotheses of Hid06's theorem listed below. Then the divisibility is an equality up to a unit: h_K·L^Katz_ξ generates the congruence ideal (Hid06, main theorem, pp. 466–467, as applied in Wan-2020 §7.5, p. 64, under (irred) and (dist) for g_ξ).
- (B) p ≥ 3, including p = 3: the branch character is primitive outside p, HT94's ordinarity and Leopoldt-type conditions Ord(K,p) and (L_(K∞,Σ)) hold, either χ(D) ⊄ μ_(p^∞) (case (i) of HT94 Theorem 0.3) or the trivial-zero element 𝒱(T) is shown prime to H(g), and p ∤ φ(𝔫)·∏_(𝔩|c″)(1+N𝔩), where 𝔫 = Nc is the conductor in HT94 Theorem 0.3 and c″ is the part of the auxiliary conductor supported on primes inert or ramified in K. HT94 Theorem 0.3, p. 92, gives H | h_K·∏_(𝔩|c″)(1+N𝔩)·𝒱(f) after inverting φ(𝔫), with f the characteristic series of the anticyclotomic Iwasawa module; under the displayed unit condition nothing is inverted. Rubin's main conjecture for K, as invoked in HT94's comment on p. 91 and in CGS23 Lemma 1.4.4, p. 9, identifies f with L^Katz_ξ up to a unit.
- (C) Rationally: for every p ≥ 3, under the hypotheses of (B) except the unit condition, the divisibility holds in O^ur[[Γ_K^−]] ⊗ ℚ.
- (D) The remaining integral cases: p = 3 with 3 dividing φ(𝔫)·∏_(𝔩|c″)(1+N𝔩); any p ≥ 3 at which neither (A) nor (B) applies, as when p divides φ(𝔫)·∏_(𝔩|c″)(1+N𝔩) and a prime of the conductor is nonsplit in K; and HT94's trivial-zero case χ(D) ⊂ μ_(p^∞) with 𝒱(T) not shown prime to H(g). The same integral divisibility, in the same normalization, is supplied by PadicFamilies (gap:cm-congruence-katz-integral). The inputs CLW's proof cites do not reach these cases: Hid06 assumes p > 3 and a split prime-to-p conductor, and HT94 Theorem 0.3 inverts φ(𝔫) and, in its second case, 𝒱(T).

Consequently the CLW normalization L^Hida_(π,K,ξ), the product of Hida's Rankin–Selberg function and h_K·L^Katz_ξ, is integral for every p ≥ 3 split in K and every ξ with ξ_p ≢ ξ_p̄, through case (A), (B) or (D); case (C) alone gives L^Hida ∈ O^ur[[Γ_K]] ⊗ ℚ. The direction matters: HT93 Theorem I and HT94 Theorem 0.2 prove the opposite divisibility, of H by the Katz function, after ⊗ℚ, and they do not give integrality; HT94 Theorem 0.1 is the rational divisibility of the anticyclotomic characteristic series by the Katz function.

Assume all hypotheses of CLW Thm 8.2.1(2), in particular ξ_p≢ξ_p̄, together with the hypotheses of the case used. The congruence ideal and the Katz factor are compared integrally, at the stated tame conductor, ordinary refinement and period normalization; an identity in the fraction field does not give the integral cases.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1(2), p. 81. CLW deduce integrality of L^Hida_(π,K,ξ) from the anticyclotomic main conjecture of Hida–Tilouine and Hida (HT93, HT94, Hid06). [Wan-2020](https://arxiv.org/pdf/1408.4044v5), Thm 1.1 and the remark after Thm 1.2, pp. 2–3, and §7.5, p. 64. Wan proves integrality of Hida's p-adic L-function under (irred) and (dist) for the CM form g_ξ, within Theorem 1.1, whose hypothesis (a) is p ≥ 5; §7.5 deduces it from Hid06's theorem (Hid06, p. 468, (F)), so it is case (A).

The original normalization formulas are [HT93](https://www.numdam.org/article/ASENS_1993_4_26_2_189_0.pdf), Thm 7.1, printed p. 242 (PDF p. 55), with the primitivity and local choices of (7.3a,b), pp. 240–241, and (8.8b), printed p. 251 (PDF p. 64); and [Hid91](https://aif.centre-mersenne.org/item/10.5802/aif.1258.pdf), Lemma 5.3(vi), printed p. 355 (PDF p. 46). These retain adjoint Euler factors and the chosen primitive form. [Hid06](https://ems.press/content/book-chapter-files/27475?nt=1), pp. 466–467, assumes p>3 unramified in M, a p-ordinary CM type, and a finite anticyclotomic character ψ of order prime to p. Its prime-to-p conductor is split in M/F, ψ is nontrivial at every chosen p-place, and its restriction to G_(M(√p*)) is nontrivial. The theta-family application also uses Thm 6.3, p. 509, and its (h1)–(h4); the integral pairing and adjoint formula are (7.15)–(7.17), pp. 526–527. The main-conjecture identity is over the completed unramified coefficient extension and is only up to a unit there.

[HT94](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf), Theorems 0.1 and 0.2, printed p.91 (PDF p.4), admit odd p but state the anticyclotomic divisibility and Katz-to-congruence divisibility after tensoring with Q. Theorem 0.3, p.92 (PDF p.5), keeps the class-number ratio, nonsplit conductor Euler factors, localization at φ(Nc), and a further exceptional-zero factor in its second case. The local congruence module and its cotangent comparison are (5.1)–(5.4) and Proposition 5.1, p.139; the application on p.140 completes at a height-one prime away from the specified exceptional zeros. Theorem 7.1 and its proof, p.146, use these comparisons with ordinarity, the stated Leopoldt-type condition and p∤Ncφ(Nc). These statements do not provide an unrestricted integral equality at every tame level or determine a p-power discrepancy removed by rationalization.

The routes of the cases above are, for (A), Hid06's main conjecture for the CM family with its p > 3, split-conductor and global restriction hypotheses, for (B), HT94 Theorem 0.3 with the localization at φ(𝔫) and the factors ∏(1+N𝔩) and 𝒱(T), followed by Rubin's theorem, and for (D), the supplied comparison. [CGS23](https://arxiv.org/pdf/2303.04373v1), Lemma 1.4.4 and proof, p. 9, carries out route (B) for the CM family through the weight-one Eisenstein series, where the trivial-zero factor is excluded by BDP22 Theorem A(i). Distinguishedness at p alone verifies neither Hid06's global restriction nor its split-conductor condition.

The proof proceeds as follows. Identify the CM theta family and its residual irreducibility and distinguishedness from ξ_p≢ξ_p̄, which make its local Hecke algebra Gorenstein, so that H(g) is a congruence power series in HT94's sense. In case (A) apply Hid06's theorem to the branch character after checking the hypotheses (h1)–(h4) of its Thm 6.3, p. 509, and the integral pairing (7.15)–(7.17), pp. 526–527. In case (B) apply HT94 Theorem 0.3 (with Proposition 5.1, p. 139, and Theorem 7.1, p. 146, on which it rests), check that the unit condition makes the localization trivial, and replace f by the Katz function by Rubin's theorem. In case (D) take the divisibility from gap:cm-congruence-katz-integral. Multiply Hida's Rankin–Selberg function, whose denominator is H(g), by h_K·L^Katz_ξ to obtain the integrality of L^Hida. Retain the integral normalization throughout; vanishing of μ does not prove the divisibility.

**Checks.**

- For K = ℚ(√−23), h_K = 3 and 3 splits in K (−23 ≡ 1 mod 3), so at p = 3 the factor h_K has 3-adic valuation one: dropping h_K from the divisibility asserts an ideal smaller by one power of 3, and integrality of L^Hida would then fail by that factor.
- Over O[[T]], the ideals (p) and (1) become equal after inverting p but have different lengths at the prime generated by the uniformizer. Thus a rational Katz-to-congruence divisibility cannot establish the integral p-primary comparison.
- If p=3 divides φ(𝔫), localizing by the factor allowed in HT94 Theorem 0.3 also inverts 3, so that theorem then controls nothing 3-primary: neither (A) nor (B) applies, the proved routes give only the rational statement (C), and the integral divisibility comes from case (D). For 𝔫 = 7, φ(7) = 6 has v₃(6) = 1 and selects (D); for 𝔫 = 5, φ(5) = 4 is a 3-adic unit and case (B) applies when its other conditions hold.
- Case (D) is a statement about the CM family g alone: it mentions neither π, f nor the Selmer group of §2.7, so it assumes neither the integrality of L^Hida nor CLW's divisibility. With H(g) = 3, h_K·L^Katz_ξ = 3 and a Rankin–Selberg value u/3, u a unit, the divisibility gives L^Hida = u, integral; with h_K·L^Katz_ξ = 1 it fails and L^Hida = u/3.
- Direction: the rational divisibility of H by the Katz function (HT93 Theorem I) gives no bound on the denominator of L^Hida. With H = 3 and Katz value 1 it holds, while a Rankin–Selberg value u/3 with u a unit gives L^Hida = u/3, which is not integral.
- Changing an integral CM period by a unit preserves the congruence ideal. Multiplication by a uniformizer changes its valuation even though the corresponding fraction-field lines agree; equality of those lines is not the required lattice map.

*Needs:* §0.7; AutomorphicPadicLFunctionsPartII §8.5; AutomorphicPadicLFunctionsPartII (gap:katz-cm-padic-l); PadicFamilies (gap:hida-rankin-selberg-cm); PadicFamilies (gap:cm-congruence-katz-integral); PadicFamilies §1.7; EulerSystemsCyclotomicMainConjecture (gap:rubin-imaginary-quadratic).

### Examples

For the single operator 8 and scalar eigenvalue 3 over Z, the Hecke difference is 5, hence I_E=(5) and, for the identity coefficient map, 𝔈_E=(5). Equal values 7 and 7 give (0); the difference 2−1 gives the unit ideal. Under Z→F₅, equal operator and eigenvalue instead give I_E=0 and 𝔈_E=(5), because contraction sees the coefficient kernel. Equal constant values in Z[X] also give the zero Hecke ideal, but the coefficient map misses X, as its degree-one coefficient is 0 for constants and 1 for X. For Δ at ℓ=2 the difference −24−(1+2¹¹)=−2073=−3·691 has 691-adic valuation one. At p=5 that same difference is a unit.

The reciprocal-polynomial convention has a direct witness: for M=diag(2,3) over Q, det(TI−M)=T²−5T+6, whereas det(1−XM)=1−5X+6X². Replacing M by M⁻¹ gives 1−(5/6)X+(1/6)X². Thus a change to dual or inverse Frobenius changes both coefficients. If an additional twist multiplies eigenvalues by u, the linear coefficient is multiplied by u and the quadratic one by u².

For the inertia-kernel ordinary condition with T_v=0 and trivial Q_p/Z_p coefficients, the continuous unramified homomorphism sending Frobenius to an element of order p is nonzero and satisfies the local condition. A strict zero local condition rejects it. For T=0 every Selmer module is zero and its characteristic ideal is the unit ideal. At a Steinberg prime ℓ=11 with p=5 and normalized eigenvalue α=1, the Euler element has augmentation 1−1/11=10/11, which is a nonunit in Z₅. Ramification alone cannot justify canceling it.

### Dependencies

Suppliers: ArithmeticGaloisDuality §R02.4.3; AutomorphicPadicLFunctionsPartII §8.5, (gap:katz-cm-padic-l); EulerSystemsCyclotomicMainConjecture (gap:rubin-imaginary-quadratic); IntegralHeckeAndGaloisDeterminants §§1.3, 1.4 and 5.3; PadicFamilies §§1.3, 1.7, 1.8, 1.10 and 1.11, (gap:hida-rankin-selberg-cm), (gap:cm-congruence-katz-integral); PadicMeasuresIwasawaAlgebras §§4.1 and 4.6, (gap:divisorial-char-ideal); SelmerIwasawaCohomology §§2.1, 2.7, 2.8, 2.9, 2.10, 2.23, 3.1, 3.2 and 3.10. Libraries: Mathlib `Ideal.map`; Mathlib `Ideal.span`; Mathlib `IsDiscreteValuationRing`; Mathlib `IsReduced`; Mathlib `LocalizedModule`; Mathlib `Matrix.charpoly`; Mathlib `Module.length`; Mathlib `RingHom.ker`; Tau Ceti `TauCeti.ContCohomology.H1`; Tau Ceti `TauCeti.fittingIdeal` with its base change (cited in PadicMeasuresIwasawaAlgebras §6.5).

## Layer 1: The ordinary GU(2,2) construction over Q

Throughout §§1.1–1.11, p is odd and split in K (SU §2, author-copy p. 13). In particular Γ_2 = (1 + pℤ_p)⁴ has no order-two torsion.

### 1.1 Ordinary p-adic Hermitian modular forms on GU(2,2) and their Hecke algebra

Let p be an odd prime and K an imaginary quadratic field in which p splits, G = G_2 = GU(2,2) the unitary similitude group of the skew-Hermitian form w_2 = (0 1_2; −1_2 0) over O_K, and K′ ⊂ G(𝔸^p_f) a neat open compact subgroup. On the ordinary locus of the integral model of the Shimura variety S_G(K′K_p) (with its toroidal and minimal compactifications), and over its Igusa tower, define the space V^q_(a,ord) (dual of the ordinary p-adic Hermitian modular forms; q = 0 for cusp forms, q = 1 for forms of boundary corank at most one) of weight a with coefficients in Λ_2 = ℤ_p[[Γ_2]], Γ_2 = (1 + pℤ_p)^4 ⊂ T_2(ℤ_p), with the q-expansions at the cusps x = diag(u, t ū⁻¹), the Hecke operators at unramified places, the U_p-operators u_t for t = diag(p^(a_1),…,p^(a_4)), the ordinary projector e = lim u_t^(n!), and the universal ordinary cuspidal Hecke algebra h_(Σ,0)(K′; Λ). Specializations at arithmetic weights are classical holomorphic Hermitian modular forms of weight (κ, κ; 0, 0)-type when the weight is sufficiently regular. Write M^q=Hom_Λ(V^q,Λ) for the module of forms carrying q-expansions: V and M are dual carriers and are not identified without a pairing.

Assume p is odd and splits in K; K′K_p neat; the p-adic weights are characters of T_2(ℤ_p) through Γ_2 and µ_(p−1)^4. The unitary PEL datum is that of PELModuli §§M5.5–M5.6, the compactifications are those of ShimuraCompactifications §§7.3 and 7.16, the classical expansions those of AutomorphicBundles §§12.2, 12.8, 12.15 and 12.16, and the ordinary Igusa tower with its p-adic forms is gap:unitary-ordinary-igusa; this target instantiates them for GU(2,2) in SU's normalization.

The boundary ideal is I^q = π* I_(∂^q S*), where ∂^q S* is the union of boundary strata of genus 2r with r < n−q. For n = 2, I⁰ vanishes on the whole boundary, while I¹ still vanishes at the genus-zero strata. The functions defining forms use this ideal on the Igusa tower, then the prescribed unipotent invariants and torus weight (SU §5.4.9 and (6.1.5.a)).

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §5 (groups G_n §5.1, Shimura varieties §5.2, cusps and boundary §5.4–5.5, Cor. 5.5.9), pp. 61–80; §6.1–6.2, pp. 81–91. Skinner–Urban's unitary similitude groups, Shimura varieties and ordinary automorphic forms with q-expansions and Hecke operators. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §6.3–6.4 (Thms 6.3.3, 6.3.10, 6.4.1), pp. 91–95. Λ-adic ordinary forms and the universal ordinary Hecke algebra h_(S,0).

The proof proceeds as follows. Instantiate the unitary PEL datum of PELModuli §M5.6 at signature (2,2) and the ordinary p-adic forms of gap:unitary-ordinary-igusa, using SU §5 conventions (G_n, the Siegel parabolic, cusps C_(n−1)(K)). Define the ordinary projector by the profinite ordinary projector of PadicFamilies §0a.11 applied to u_t on the p-adic forms. q-expansions at x and the Fourier–Jacobi expansions along the Klingen parabolic are those of AutomorphicBundles §§12.2 and 12.15 on classical forms and of gap:unitary-ordinary-igusa on p-adic forms.

The interface is used in [§1.2](#12-hida-theory-for-gu22-freeness-control-and-the-boundary-sequence) to the spaces whose freeness and control are proved; in [§1.6](#16-the-λ_d-adic-klingen-eisenstein-family-and-its-constant-terms) to ℰ_D is an element of M^ord_a(K′; Λ_D); in [§1.8](#18-the-four-dimensional-pseudo-character-of-the-ordinary-gu22-hecke-algebra) to the Hecke algebra h_D on which the pseudo-character lives; in [§5.3](#53-normalized-hilbert-klingen-family-and-its-boundary) to the totally real analogue over M/F, which uses the same carrier (gap:unitary-ordinary-igusa).

**API.**

- For q = 0 (cusp forms) and q = 1 (forms of boundary corank at most one) there are the dual space V^q_(a,ord)(K′; Λ_2) and the space of forms M^q_(a,ord)(K′; Λ_2) = Hom_Λ(V^q, Λ).
- The cusp q-expansion of a form in M^q=Hom_Λ(V^q,Λ), with injectivity on M^q by the q-expansion principle; it is not a q-expansion map on the compact dual V^q.
- The Hecke operators T_v, Z_(ℓ,0), Z⁽ⁱ⁾_(ℓ,0) and u_t commute, and e is the ordinary projector built from the u_t.
- Specialization at an arithmetic weight φ lands in classical holomorphic ordinary forms of weight φ for sufficiently regular φ.
- The Siegel operator Φ maps to the boundary and fits in the exact sequence of SU Cor. 5.5.9 and Thm 6.3.10.
- The ordinary cuspidal Hecke algebra h_(Σ,0)(K′; Λ) is the Λ-algebra generated by the Hecke operators acting on ordinary cusp forms; after base change it is finite and reduced over Λ_D.
- Forms in M^q are equal when every coefficient at every permitted cusp agrees.

**Checks.**

- At p = 3 and level p, the full GU(2,2) Igusa fibre has |GL₂(𝔽₃)|² = (8·6)² = 2304 elements, while its diagonal torus has 2⁴ = 16. In GL₂(𝔽₃), U = [[1,1],[0,1]] and V = [[1,0],[1,1]] give UV = [[2,1],[1,1]] and VU = [[1,1],[1,2]], so the structure group is not commutative.
- A q = 1 form has genus-zero boundary constant term 0. A full form with that constant term 1 is excluded, even though it is a legitimate unrestricted form; q = 0 also has zero genus-two boundary restriction.
- At p = 2, −1 ∈ 1 + 2ℤ₂ and ([−1]−1)([−1]+1) = [1]−1 = 0 with two nonzero factors in its completed group ring. At p = 3, −1 ≡ 2 mod 3 is absent from 1 + 3ℤ₃, so this order-two obstruction is absent.
- For n = 1 the same construction for GU(1,1) gives ordinary p-adic elliptic modular forms twisted by Hecke characters of K, with Hida's ordinary projector.
- A form whose q-expansions vanish at every cusp x with x_p ∈ Q(ℤ_p) is zero (q-expansion principle on each connected component).
- For the Eisenstein family with nonzero boundary value, ℰ_D belongs to M^1 and not M^0. This rejects confusing the boundary kernel with the boundary-corank-at-most-one space or the forms with their compact duals.
- e ∘ e = e and e commutes with every T_v; on a classical form of weight a whose u_t-eigenvalue is a p-adic unit, e acts as the identity.

*Needs:* PELModuli §§M5.5 and M5.6; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); ShimuraCompactifications §§7.3 and 7.16; AutomorphicBundles §§12.2, 12.8, 12.15 and 12.16; PadicFamilies §0a.11; Mathlib `MvPowerSeries`.

### 1.2 Hida theory for GU(2,2): freeness, control and the boundary sequence

For n = 2 and q = 0 (cusp forms) or q = 1 (forms of boundary corank at most one): (i) V^q_(a,ord) is free of finite rank over Λ_n, and its specializations at finite-order characters ψ of level s have rank independent of ψ and of the weight (SU Thm 6.3.3); (ii) for any Λ_n-algebra A there is a short exact sequence 0 → M^0_(a,ord)(K^p, A) → M^1_(a,ord)(K^p, A) →Φ ⊕_([g] ∈ C_(n−1)(K)) M^0_(a′,ord)(K^p_(n−1,g), Λ_(n−1)) ⊗ A → 0, Φ the sum of the Siegel operators to the boundary components (cusp forms on G_(n−1) = GU(1,1)) (SU Thm 6.3.10, from Cor. 5.5.9); (iii) for every sufficiently regular algebraic dominant weight k the canonical surjection h^(S,q)(K^p; Λ_n) ⊗ Λ_n/P_k ↠ h^(S,q)_(k,ord)(K) has nilpotent kernel, so every ℚ̄_p-valued character of the Λ-adic Hecke algebra at P_k comes from a classical ordinary eigenform of weight k (SU Thm 6.4.1). Consequently h_(Σ,0)(K′; Λ) is finite over Λ_2 and its arithmetic points of regular weight are Zariski dense.

Assume weights sufficiently regular in the sense of SU 6.2; neat level; p odd and split in K. The q = 1 control theorem and Hecke algebra act on the boundary-corank-at-most-one module.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thm 6.3.3, p. 91; Thm 6.3.10 and Thm 6.4.1, p. 95; Cor. 5.5.9, p. 78. Freeness of ordinary forms over Λ_n, the boundary exact sequence and control in sufficiently regular weight.

The proof proceeds as follows. Freeness from vertical control on the Igusa tower (SU §6.2–6.3, Props 6.2.5, Cor. 6.2.6, Thm 6.2.10). Boundary exact sequence: the Siegel operator surjects onto boundary ordinary forms (SU Cor. 5.5.9, Thm 6.3.10). Control of the Hecke algebra in sufficiently regular weight (nilpotent kernel, SU Thm 6.4.1); density of such weights in Spec Λ_2.

**Checks.**

- For n = 2, a genus-zero boundary coefficient is 0 in both M⁰ and M¹. A coefficient 1 there lies outside the domain of this control theorem; the boundary quotient concerns cusp forms on GU(1,1).
- The boundary sequence is what lets one subtract an Eisenstein family from a lift and obtain a cusp form congruent to it.

*Needs:* §1.1; PadicFamilies §§0a.15 and 0a.16; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa).

### 1.3 The p-adic Eisenstein datum and its Eisenstein ideal

A p-adic Eisenstein datum D = (A, 𝕀, 𝐟, ψ, ξ, Σ) consists of the ring of integers A of a finite extension of ℚ_p containing ℤ[µ_(M_D p), i, D_K^(1/2)], a normal domain 𝕀 finite over Λ_(W,A), an 𝕀-adic ordinary eigenform 𝐟 of tame level M, finite idele class characters ψ and ξ of 𝔸_K^× (ψ|_(𝔸^×) = χ_𝐟), and a finite set of primes Σ containing those dividing M p D_K and the ramification of ξ. Put Λ_D = 𝕀[[Γ^-_K × Γ_K]], a finite local reduced Λ_2-algebra via α ⊗ β (SU 6.5.1), the characters σ_ψ, σ_ξ, σ_(ξ′) = σ_ξσ^c_ξ, and the semisimple representation ρ_D = σ_(χ̄_f,0)σ^c_ψε⁻³ ⊕ (ρ_𝐟 ⊗ σ_(χ̄_f,0)σ⁻ᶜ_ξσ^c_ψε⁻²) ⊕ σ_(χ̄_f,0)ε⁻¹det ρ_𝐟 σ⁻¹_(ξ′)σ^c_ψ of G_K over Frac Λ_D (6.5.2.a). The Eisenstein ideal I_D ⊆ h_D = h_(Σ,0)(K′; Λ_D) is generated by the coefficients of Q_v(X) − Q_(v,D)(X) (v ∉ Σ), the relations u_t − ∏β_i^(a_i) for the U_p-operators with the prescribed (β_1,…,β_4), and the central operators Z_(ℓ,0), Z⁽ⁱ⁾_(ℓ,0) minus their values on the Eisenstein characters; 𝔈_D ⊆ Λ_D is the kernel of Λ_D → h_D/I_D, so Λ_D/𝔈_D ≅ h_D/I_D (6.5.3.a), and 𝕋_D is the localization of h_D at the maximal ideal containing I_D. The two p-adic L-functions attached to D are L^Σ_(𝐟,K,ξ) ∈ 𝕀[[Γ_K]] ([§1.5](#15-the-skinnerurban-three-variable-p-adic-l-function)) and L^Σ_(χ̄_𝐟ξ̄′), the image of the Kubota–Leopoldt function of the Dirichlet character χ̄_𝐟ξ̄′; their product is L_D.

Assume ψ exists with ψ|_(𝔸^×) = χ_𝐟 and unramified outside Σ (SU Thm 12.3.1 hypothesis); (irred)_𝐟 and (dist)_𝐟 when 𝕋_D is used. The big ordinary representation ρ_𝐟 is that of PadicFamilies §4.1; its comparison with SU's lattice, dual and Tate-twist normalization is part of this target, as a Galois-equivariant lattice isomorphism preserving the ordinary submodule and the reciprocal Frobenius polynomial; a rational trace identity alone does not identify the integral Selmer groups.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §6.5.1–6.5.3, pp. 96–98. The datum D, the ring Λ_D, the representation ρ_D, the generators of I_D and the isomorphism Λ_D/𝔈_D ≅ h_D/I_D.

The proof proceeds as follows. Define Λ_D, the characters and ρ_D as in SU 6.5.1–6.5.2. Instantiate [§0.4](#04-the-eisenstein-ideal-of-an-eisenstein-family) with the Hecke operators listed in SU 6.5.3 and the eigensystem of ρ_D and the U_p-characters.

The interface is used in [§1.6](#16-the-λ_d-adic-klingen-eisenstein-family-and-its-constant-terms) to Thm 6.5.4 bounds ord_P(𝔈_D) below by ord_P(L_D); in [§1.9](#19-the-skinnerurban-selmer-lower-bound-from-the-eisenstein-ideal) to the lattice datum of SU 7.3.2 takes J_0 = 𝔈_D and I_0 = I_D; in [§1.8](#18-the-four-dimensional-pseudo-character-of-the-ordinary-gu22-hecke-algebra) to the residual pseudo-character of 𝕋_D is tr ρ̄_D.

**API.**

- The coefficient ring is Λ_D = 𝕀[[Γ^-_K × Γ_K]], a Λ_2-algebra through α ⊗ β.
- The semisimple G_K-representation ρ_D of (6.5.2.a) is unramified outside Σ and has det(1 − ρ_D(g)X) ∈ Λ_D[X].
- The Hecke-side ideal I_D ⊆ h_D is generated as in SU 6.5.3, and 𝔈_D := ker(Λ_D → h_D/I_D) is its coefficient ideal.
- The structure map induces Λ_D/𝔈_D ≃ h_D/I_D (6.5.3.a).
- The analytic product is L_D = L^Σ_(𝐟,K,ξ)·L^Σ_(χ̄_𝐟ξ̄′) ∈ Λ_D.
- At an arithmetic φ ∈ X^a_D with an associated Eisenstein series, φ(ρ_D) is that series' Galois representation and φ(Q_(v,D)) its Hecke polynomial.
- Transport of A,I, the family and characters preserving their stated identities transports ρ_D, I_D and 𝔈_D; equality of all generator eigenvalues identifies the ideals.

**Checks.**

- For eigenvalues 1, 2, 3, 4 the reciprocal polynomial is 1 − 10X + 35X² − 50X³ + 24X⁴, so minus its X coefficient is 10, the trace. Minus its cubic coefficient is 50. The monic characteristic polynomial is X⁴ − 10X³ + 35X² − 50X + 24; conversion preserves the trace 10.

- tr ρ_D is the sum of two characters and the trace of a twist of ρ_𝐟; its reduction modulo the maximal ideal is the residual trace used in Thm 7.3.1, with exactly one irreducible two-dimensional constituent under (irred)_𝐟.
- 𝔈_D ≠ Λ_D exactly when some cuspidal ordinary eigensystem is residually congruent to the eigensystem of ρ_D.
- At an arithmetic quotient I→O of a genuine finite Iwasawa branch, Λ_D⊗_I O≅O[[Γ_K^-×Γ_K]] has three Iwasawa variables and Krull dimension four. The original I still has its weight variable; I=O is not a finite extension of O[[W]].
- Replacing h_D by the GL₂ Hecke algebra of 𝐟 does not give an Eisenstein ideal of this datum: ρ_D has rank four and its Hecke polynomials Q_v have degree four.
- The specialization of ρ_D at an arithmetic point with an associated Eisenstein series is the Galois representation of that Eisenstein series (SU remark after (6.5.2.a)).

*Needs:* §§0.4 and 1.1; IntegralHeckeAndGaloisDeterminants §3a.1; PadicFamilies §4.1; IntegralIwasawaTheory §5.0; DirichletPadicLFunctions §2.8.

### 1.4 Klingen Eisenstein series on GU(2,2) as pullbacks of Siegel Eisenstein series on GU(3,3)

For a cuspidal eigenform f on GU(1,1) (from an elliptic newform and a character ψ), a character ξ of 𝔸_K^× and a choice of local sections at the places of Σ and at p, construct the holomorphic Klingen-type Eisenstein series E_D(Z, x) on GU(2,2), induced from the Klingen parabolic with Levi GU(1,1) × Res_(K/ℚ)𝔾_m, of weight κ > 6 (SU §9, 'good Eisenstein series' Prop. 9.3.3), its Hecke eigenvalues and Satake parameters (SU §9.5–9.6), and its expression through the pullback of a Siegel Eisenstein series on GU(3,3) along GU(2,2) × GU(1,1) ↪ GU(3,3) paired against f (SU §11, Prop. 11.2.3). Distinguish this raw series from G_D=M^(κ/2)W′(f)⁻¹L_D⁽²⁾|µ(x)|_Q^(-κ)E_D, the normalized series of SU (11.7.5.a), p. 181. Write C_D(β,x) for the coefficients of G_D. Local Whittaker calculations and the global pairing determine C_D (SU Cors 11.7.5–11.7.6 and §11.8); these coefficients are not identified with the coefficients of E_D. The integral singular-coefficient divisibility belongs to the canonical-period-normalized family interpolating G_D/(Ω_f^+Ω_f^-), as in SU Thm 12.4.2(ii), p. 203.

Assume κ > 6 for the absolutely convergent range; the sections at p have conductor dividing p as in (12.4.2.a) when the family is formed. The complex doubling identities and the local doubling integrals are imported from MetaplecticAutomorphicForms §§6.2, 6.10a and 6.11; the Siegel Eisenstein series on GU(3,3) with SU's sections, its pullback, the Klingen-specific choices and the coefficient formulas are owned here.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §9 (Props 9.2.6, 9.3.3, 9.5.3, 9.6.1, 9.6.2), pp. 113–135. The Klingen-type cuspidal Eisenstein series on GU(2,2), their Hecke eigenvalues and U_p-behaviour. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §11 (Prop. 11.2.3; §11.4, especially Props 11.4.13, 11.4.17, 11.4.18 and 11.4.23; Props 11.6.1–11.6.2; Cor. 11.6.3; Props 11.7.1–11.7.2, Lemma 11.7.3 and Prop. 11.7.4; Cors 11.7.5–11.7.6; Prop. 11.8.2), pp. 140–190. Siegel Eisenstein series on GU(3,3), their pullbacks and the computation of Fourier coefficients. Normalization is (11.7.5.a), p. 181, and the integral family and divisibility are Thms 12.4.1–12.4.2, pp. 202–203.

The proof proceeds as follows. Pullback (doubling) formula: restricting E^Sieg_(GU(3,3)) to GU(2,2) × GU(1,1) and integrating against f gives the Klingen series times the standard L-value (SU Prop. 11.2.3, from Shimura/Garrett). Local computations at unramified places, at Σ and at p (SU §11.4, Props 11.4.13, 11.4.17, 11.4.18, 11.4.23) and the Fourier coefficients (SU §11.6–11.7). Hecke eigenvalues: E is an eigenform with Hecke polynomial Q_(v,D) (SU §9.5–9.6).

The interface is used in [§1.6](#16-the-λ_d-adic-klingen-eisenstein-family-and-its-constant-terms) to the classical members G_(D_φ) interpolated by ℰ_D; in [§1.7](#17-a-nonsingular-fourier-coefficient-is-prime-to-the-p-adic-l-function) to the nonsingular coefficients c_D(β_i, x) analysed in §13; in [§5.3](#53-normalized-hilbert-klingen-family-and-its-boundary) to Wan 2015's Hilbert analogue uses the same pullback pattern.

**API.**

- The raw series E_D(Z,x) on GU(2,2) is determined by (f, ψ, ξ, Σ) and the local sections.
- The pairing of the pullback of E^Sieg_(GU(3,3)) with f equals the Klingen series times the scalar obtained from SU Prop. 11.2.3 and the local calculations of §11.4, retaining its L-value and local normalizations.
- G_D=M^(κ/2)W′(f)⁻¹L_D⁽²⁾|µ(x)|_Q^(-κ)E_D with its specified nonzero Atkin–Lehner scalar W′(f). Multiplication by this scalar scales every Fourier coefficient by that same factor.
- C_D(β,x) is the coefficient of the normalized G_D, obtained from the local Whittaker integrals and global pairing of SU Cors 11.7.5–11.7.6. At the arithmetic points of §1.6, the integral coefficient c_D(β,x) specializes to u_φ C_(D_φ)(β,x)/(Ω_(f_φ)^+Ω_(f_φ)^-), with u_φ a coefficient unit independent of β.
- Under the family, cusp and local-section hypotheses of SU Thm 12.4.2(ii), det β=0 implies c_D(β,x)∈(L^Σ_(f,K,ξ)L^Σ_(χ̄_fξ̄′)) in Λ_D. Its arithmetic specialization is the corresponding canonical-period-normalized product of complex L-values with all interpolation factors retained. This ideal containment is not asserted for coefficients of the raw E_D.
- E is a Hecke eigenform with Hecke polynomials Q_(v,D) at v ∉ Σ and the U_p-eigenvalues ∏β_i^(a_i).
- The Klingen constant term of the raw E_D is its inducing section ϕ_D(z_κ), by SU Lemma 9.3.2(ii), pp. 125–126. The corresponding boundary coefficient of G_D is multiplied by the full scalar in (11.7.5.a). The canonical-period-normalized family has the product divisibility of §1.6; that product is not inserted into the raw constant term.
- Equality follows from equality of all q-expansion coefficients at the specified cusps; compatible coefficient extension carries the local-section integrals and their eigenvalues to the extended series.

**Checks.**

- In the absolutely convergent holomorphic range, the raw Klingen constant term equals ϕ_D(z_κ), since the intertwining term vanishes (SU Lemma 9.3.2). Normalizing E_D to G_D multiplies this term by exactly M^(κ/2)W′(f)⁻¹L_D⁽²⁾|µ(x)|_Q^(-κ); a definition inserting that scalar twice fails this check.
- The Siegel Eisenstein series on GU(2,2) itself (induced from the Siegel parabolic) has Hecke polynomials of a different shape (four characters, no two-dimensional constituent) and is not E.
- At v ∉ Σ, the Hecke polynomial of E equals φ(Q_(v,D)), the characteristic polynomial of Frob_v on the specialization of ρ_D ([§1.3](#13-the-p-adic-eisenstein-datum-and-its-eisenstein-ideal)).
- In the normalized integral family, at the cusps admitted by SU Thm 12.4.2(ii), all singular coefficients lie in the displayed product ideal; the nonsingular ones need not. Rescaling G_D by a nonunit rescales its coefficient lattice and cannot preserve the same integral normalization.

*Needs:* §1.1; MetaplecticAutomorphicForms §§6.2, 6.10a and 6.11.

### 1.5 The Skinner–Urban three-variable p-adic L-function

Let A, 𝕀, 𝐟, ξ and Σ be as in a p-adic Eisenstein datum, and suppose there is a finite A-valued idele class character ψ with ψ|_(𝔸^×) = χ_𝐟, unramified outside Σ. (i) There is L̃^Σ_(𝐟,K,ξ) ∈ Frac(𝕀) ⊗_𝕀 𝕀_K whose value at every φ ∈ X_(𝕀_K,A)(𝐟, ψ, ξ) is the Petersson-normalized algebraic part of L^Σ_K(f_φ, χ̄_(f_φ)ξ_φ, κ_φ − 1) (SU Thm 12.3.1(i)); (ii) under (irred)_𝐟 and (dist)_𝐟 there is L^Σ_(𝐟,K,ξ) ∈ 𝕀_K whose value at φ is u_(f_φ) times the same L-value normalized by the canonical periods Ω^+_(f_φ)Ω^-_(f_φ), u_(f_φ) a p-adic unit (SU Thm 12.3.1(ii)). (iii) For ℓ ∈ Σ ∖ {p} let E_(𝐟,K,ξ,ℓ) ∈ 𝕀[[Γ_K]] be the removed Euler factor at ℓ: the element whose value at every φ is the product, over the primes w of K above ℓ, of the Euler factors at w of L_K(f_φ, χ̄_(f_φ)ξ_φ, s) at s = κ_φ − 1 twisted by φ|_(Γ_K); it is a polynomial in the images in Γ_K of the Frobenius elements at the primes above ℓ with coefficients in 𝕀, and L^Σ_(𝐟,K,ξ) = E_(𝐟,K,ξ,ℓ)·L^(Σ∖{ℓ})_(𝐟,K,ξ) whenever Σ ∖ {ℓ} is still admissible, by interpolation on the Zariski-dense set of arithmetic points. If ℓ is nonsplit in K (inert or ramified), the Frobenius of the prime above ℓ is fixed by complex conjugation and lies in Γ^+_K (p odd), so E_(𝐟,K,ξ,ℓ) ∈ 𝕀[[Γ^+_K]]; if ℓ splits, the primes above ℓ are finitely decomposed in the anticyclotomic ℤ_p-extension, their Frobenius elements have nontrivial image in Γ^-_K, and E_(𝐟,K,ξ,ℓ) has a unit coefficient in its expansion in γ^- − 1, so it lies in no prime Q·𝕀[[Γ_K]] with Q a proper ideal of 𝕀[[Γ^+_K]]. Write E^ns_Σ for the product of the E_(𝐟,K,ξ,ℓ) over the ℓ ∈ Σ ∖ {p} nonsplit in K, an element of 𝕀[[Γ^+_K]]. If moreover χ_𝐟 = 1, ξ = ξ̄^c with conductor dividing (p), (M, D_K) = 1, M = M^+M^- with every prime dividing M^+ split in K, M^- squarefree with an odd number of primes, all inert in K, and ρ̄_𝐟 ramified at every ℓ | M^-, then: (a) at every weight-two arithmetic point φ of 𝕀 with trivial nebentypus, with f := f_φ and φ̃ the extension of φ to 𝕀[[Γ^+_K]] with φ̃(γ^+) = 1, the anticyclotomic restriction L^(Σ,−)_(f,K,ξ) := φ̃(L^Σ_(𝐟,K,ξ)) ∈ Λ^-_(K,A) equals, up to a unit of A, the product of Vatsal's anticyclotomic p-adic L-function L(f, ξ, γ^- − 1) with ∏_(ℓ∈Σ∖{p}) φ̃(E_(𝐟,K,ξ,ℓ)) (SU (12.3.5.b)); μ(L(f, ξ, γ^- − 1)) = 0 (Vatsal2003 Theorem 1.1, through gap:vatsal-theta-mu, whose constants C_Eis and C_csp are units under (irred)_𝐟 and the ramification of ρ̄_𝐟 at every ℓ | M^-, both assumed in this item), the split factors have μ = 0 and the nonsplit factors φ̃(E_(𝐟,K,ξ,ℓ)) are constants of A, so μ(L^(Σ,−)_(f,K,ξ)) = Σ ord_ϖ(φ̃(E_(𝐟,K,ξ,ℓ))) over the nonsplit ℓ ∈ Σ ∖ {p}, and L^(Σ,−)_(f,K,ξ) ∉ ϖΛ^-_(K,A) if and only if every removed nonsplit factor is a unit at φ̃; (b) for every height-one prime Q of 𝕀[[Γ^+_K]], ord_(Q·𝕀[[Γ_K]])(L^Σ_(𝐟,K,ξ)) ≤ ord_Q(E^ns_Σ): L^Σ_(𝐟,K,ξ) lies in no pulled-back prime Q·𝕀[[Γ_K]] with E^ns_Σ ∉ Q, and at a pulled-back prime containing E^ns_Σ its valuation is at most that of the removed nonsplit Euler product. SU Prop. 12.3.6 asserts that L^Σ_(𝐟,K,ξ) lies in no pulled-back prime at all; its proof takes μ(L^(Σ,−)_(f,K,ξ)) = 0 from (12.3.5.b), which overlooks the nonsplit constants, and the assertion fails as soon as one removed nonsplit factor is a nonunit (Checks). Statement (b) is the analogue of Wan-2015 Lemma 87, p. 71. Precisely, the common numerator at φ is a(p,f_φ)^(-ord_p Nm(f_(χ̄_f ξ_φ)))·((κ_φ−2)!)²·g(χ̄_f ξ_φ)·Nm(f_(ξ_φ)d)^(κ_φ−2)·L_K^Σ(f_φ,χ̄_f ξ_φ,κ_φ−1). In (i) divide it by (−2πi)^(2κ_φ−2)·2⁻³(2i)^(κ_φ+1)S(f_φ)⟨f_φ,f_φ^c|W_(N_φ)⟩; in (ii) divide by (−2πi)^(2κ_φ−2)Ω^+_(f_φ)Ω^-_(f_φ) and multiply by u_(f_φ).

Retain the stated hypotheses; the interpolation set X_(𝕀_K,A)(𝐟, ψ, ξ) is defined in SU §12.3 (conductor conditions at p). A contains i, sqrt(D_K), and the local Gauss sums g(ξ_ℓ^c,a_ℓδ_K), g(χ̄_f,ℓ ξ_ℓ^c,b_ℓδ_K), g(χ_f,ℓ ξ̄′_ℓ) for ℓ∈Σ\{p}, with conductors as in Prop. 12.2.5. In (iii), every prime of M⁺ splits in K; the stated inert conditions apply to M⁻.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thm 12.3.1, p. 199; 12.3.5 and (12.3.5.b), pp. 201–202; Prop. 12.3.6 and proof, p. 202. The two interpolation statements and the comparison with the anticyclotomic function. Prop. 12.3.6 claims avoidance of every pulled-back prime for every admissible Σ by asserting that the Σ-imprimitive anticyclotomic function has μ = 0; the removed Euler factors at nonsplit primes are constants that its proof does not account for, so the corrected statement is (iii)(b), following [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), the paragraph before Lemma 87, p. 70, and Lemma 87, p. 71. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Prop. 12.2.5, author-copy p. 196; Thm 12.3.1, p. 199. The coefficient/Gauss-sum conditions and all factors of the two interpolation formulas.

The original [Vatsal](https://personal.math.ubc.ca/~vatsal/research/mew3.pdf), Thm 1.1, author-copy p. 3, computes µ=ord_λ(C_Eis²C_csp), not unconditional vanishing. Its congruence constants and periods are in §2.4, pp. 10–11; the coefficient nonvanishing argument is §4.6 and Prop. 4.7, pp. 18–19, with its reduction in §5.9, p. 26. The application must show that both constants are units under the SU hypotheses and match SU's canonical-period lattice. The residual irreducibility and ramification conditions in (iii) must remain in that comparison.

The proof proceeds as follows. Apply the interpolation lemma 12.2.7 to the family g = f⁽¹⁾_(D,1/M,1) of Prop. 12.2.5; Cor. 11.7.5 identifies the specializations (proof of SU Thm 12.3.1). Density of X′_D and independence of φ|_(Γ^-_K) place L̃ in Frac(𝕀) ⊗ 𝕀_K; the integral version N_g of Lemma 12.2.7(ii) gives (ii) ([§0.8](#08-canonical-periods-petersson-norms-and-the-congruence-number)). (iii): the identity L^Σ = E_ℓ·L^(Σ∖{ℓ}) and the shape of E_(𝐟,K,ξ,ℓ) are read off from the interpolation formula of (ii) on the Zariski-dense set of arithmetic points. For a split ℓ each factor 1 − c·⟨frob_w⟩ of E_(𝐟,K,ξ,ℓ), with c a unit of a finite extension of 𝕀 (the roots of the Hecke polynomial at ℓ are units since their product is ℓ times a unit) and ⟨frob_w⟩ = g^+·(γ^-)^u with g^+ ∈ Γ^+_K and u ∈ ℤ_p ∖ {0}, has coefficient −c·g^+·binom(u, p^k), a unit, at (γ^- − 1)^(p^k) for p^k ∥ u, so its anticyclotomic specializations have μ = 0; μ is additive, so the product of the two factors has μ = 0 at a weight-two point and hence a unit coefficient. (a): compare the interpolation formulas of (ii) and of Vatsal's function as in SU 12.3.5, once Vatsal's congruence constants C_Eis and C_csp are shown to be units under the stated hypotheses and his period is matched with the canonical periods; μ is additive on Λ^-_(K,A). (b): let 𝓛_(𝐟,K,ξ) ∈ 𝕀[[Γ_K]] be the primitive two-variable function, with every Euler factor away from p present: Hida's Rankin–Selberg p-adic L-function of 𝐟 against the ordinary CM family of ξ, with its congruence-ideal denominator cleared by the congruence generator of [§0.8](#08-canonical-periods-petersson-norms-and-the-congruence-number) (gap:hida-rankin-selberg-cm). Comparing interpolation formulas on a common Zariski-dense set of arithmetic points, as Wan-2015 Prop. 84, p. 68, does for Hilbert families, gives L^Σ_(𝐟,K,ξ) = u·𝓛_(𝐟,K,ξ)·∏_(ℓ∈Σ∖{p}) E_(𝐟,K,ξ,ℓ) with u a unit of 𝕀[[Γ_K]] made of local root numbers away from p. By (a) the anticyclotomic restriction of 𝓛_(𝐟,K,ξ) at a weight-two point is a unit multiple of Vatsal's function and has μ = 0, so some coefficient of 𝓛_(𝐟,K,ξ) in γ^- − 1 is a unit of the local ring 𝕀[[Γ^+_K]] and 𝓛_(𝐟,K,ξ) lies in no pulled-back prime; the split factors lie in no pulled-back prime either, so ord_(Q𝕀[[Γ_K]])(L^Σ_(𝐟,K,ξ)) = ord_Q(E^ns_Σ), which gives (b).

**API.**

- The Petersson-normalized L̃ has coefficients in Frac(𝕀) ⊗_𝕀 𝕀_K, and its value at each permitted φ is the explicit numerator divided by its nonzero Petersson/stabilization normalization. The test form is the nonzero normalized eigenform and its specified dual vector, whose pairing in this formula is nonzero.
- Under (irred) and (dist), the canonical-period-normalized L lies in 𝕀_K, with the displayed interpolation formula and the source's compatible units u_(f_φ).
- Arithmetic-point interpolation on the stated dense set determines each normalized function; changing a period generator by a unit changes the corresponding scalar function by the inverse unit.
- Under the hypotheses of (iii), the anticyclotomic restriction of L at a weight-two point has μ-invariant equal to the sum of the valuations of the removed nonsplit Euler constants, and the valuation of L at a pulled-back height-one prime Q·𝕀[[Γ_K⁺]]·𝕀[[Γ_K]] is at most ord_Q(E^ns_Σ); a pulled-back prime not containing E^ns_Σ does not contain L. The comparison with Vatsal's function retains the congruence constants and every Euler factor.

**Checks.**

- If the product Ω⁺Ω⁻ is multiplied by 2 at p = 3, its interpolation denominator doubles and the normalized value is halved; the principal ideal is unchanged since v₃(2) = 0. Multiplication by 3 lowers the valuation by 1 and does not preserve the integral normalization.
- In a power-series model B⟦Y⟧, the series Y has a coefficient 1, so it belongs to no extended prime Q·B⟦Y⟧, although its specialization at Y = 0 is 0. Conversely pY lies in the extended prime (p). This distinguishes the coefficient primitivity of (iii) from nonzero specialization everywhere.
- For κ = 2 and unramified twisting conductor at p, the displayed factorial and ordinary-root factors are (κ−2)!² = 1 and a_p⁰ = 1. At κ = 4 the factorial factor is 2!² = 4; replacing it by 1 changes the normalized interpolation value by 4 when the other factors are held fixed.
- Integrality (ii) requires (irred) and (dist); without them only (i) holds.
- The interpolation uses the canonical periods Ω^±; the anticyclotomic restriction is compared with Bertolini–Darmon's function only up to a unit (SU 3.6.14).
- Nonsplit witness: p = 7, K = ℚ(√−3), the ordinary family through the curve 11a1 (a_7 = −2 a unit, ρ̄ irreducible and ramified at 11, which is inert in K, so (iii) applies) and ℓ = 113, inert in K (113 ≡ 2 mod 3) with 113 ≡ 1 mod 7 and a_113 = 9. At the weight-two point with trivial anticyclotomic character the removed factor is (1 − α²/113²)(1 − β²/113²) = ((113 + 1)² − 9²)/113² = 12915/12769, and 12915 = 3²·5·7·41 has 7-adic valuation 1. So E_(𝐟,K,1,113) is a nonunit of the local ring 𝕀[[Γ^+_K]], some height-one prime Q of 𝕀[[Γ^+_K]] contains it, and L^(Σ∪{113}) = E_(𝐟,K,1,113)·L^Σ lies in Q·𝕀[[Γ_K]]: the avoidance asserted by SU Prop. 12.3.6 fails for Σ ∪ {113}, while (iii)(b) allows valuation at most ord_Q(E_(𝐟,K,1,113)) there. For ℓ = 13, split in K (−3 ≡ 6² mod 13), the factor has a unit coefficient and lies in no pulled-back prime.
- Constants against series in A[[Y]] with ϖ = 7: the nonsplit constant 12915/12769 has μ = 1; a split factor 1 − c(1 + Y)^u with c a unit has coefficient −cu at Y, a unit when u is, and coefficient −c·binom(u, p^k) at Y^(p^k) for p^k ∥ u in general, so μ = 0; their product has μ = 1 + 0 = 1, as (iii)(a) predicts, and a formula that put μ = 0 for the Σ-imprimitive function would be off by one here.

*Needs:* §§0.2, 0.8 and 1.4; PadicFamilies (gap:vatsal-theta-mu); PadicFamilies (gap:hida-rankin-selberg-cm); PadicFamilies §1.3.

### 1.6 The Λ_D-adic Klingen Eisenstein family and its constant terms

Let D be a p-adic Eisenstein datum with cond(ψ_p), cond(ξ_p) | p, (irred)_𝐟 and (dist)_𝐟, and K′ ⊆ K′_D with K′K_p neat. (i) There is ℰ_D ∈ M^(a,ord)(K′; Λ_D) whose specialization at every φ ∈ X″_D is u_φ·G_(D_φ)/(Ω^+_(f_φ)Ω^-_(f_φ)) with |u_φ|_p = 1, G_(D_φ) the classical Klingen Eisenstein series (SU Thm 12.4.2(i), Thm 12.4.1); (ii) for x with x_p ∈ Q(ℤ_p) and det β = 0, the β-Fourier coefficient c_D(β, x) lies in L^Σ_(𝐟,K,ξ)·L^Σ_(χ̄_𝐟ξ̄′)·Λ_D (Thm 12.4.2(ii)); (iii) The ordinary Hecke algebra h_D^1 acting on forms of boundary corank at most one has the Eisenstein eigencharacter λ_D^1:h_D^1→Λ_D. The cuspidal Hecke algebra h_D^cusp only acquires this eigensystem modulo 𝔈_D, through Λ_D/𝔈_D≅h_D^cusp/I_D. SU uses h_D for the noncuspidal algebra on p. 204 and the cuspidal algebra in §6.5.3; the carrier here is M¹, with its I¹ boundary ideal. Consequently, if P ⊂ Λ_D is a height-one prime with ℰ_D ≢ 0 modulo P, then ord_P(𝔈_D) ≥ ord_P(L_D) (SU Thm 6.5.4): subtracting a lift of ℰ_D's constant terms produces a cuspidal family congruent to ℰ_D modulo L_D. Here ℰ_D denotes the Eisenstein form and 𝔈_D the coefficient-ring ideal; a hypothesis that the form is nonzero modulo P concerns ℰ_D.

Assume (irred)_𝐟, (dist)_𝐟; A satisfies the hypotheses of SU Prop. 12.2.5; conductor condition (12.4.2.a) at p. The conclusion of Thm 6.5.4 is conditional on ℰ_D being nonzero modulo P; [§1.7](#17-a-nonsingular-fourier-coefficient-is-prime-to-the-p-adic-l-function) supplies this.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thms 12.4.1–12.4.2, pp. 202–203; Thm 6.5.4 and the paragraph before it, p. 98. The Λ_D-adic Eisenstein series, divisibility of its singular coefficients by L_D, and the resulting lower bound for the Eisenstein ideal.

The proof proceeds as follows. Interpolate each q-expansion coefficient by Lemma 12.2.7 applied to f⁽²⁾_(D,β,x) (proof of SU Thm 12.4.1), using Cor. 11.7.6. Assemble a Λ_D-adic ordinary form by the q-expansion principle and Hida theory ([§1.2](#12-hida-theory-for-gu22-freeness-control-and-the-boundary-sequence)). Thm 6.5.4: if ord_P(L_D) = r and ℰ_D ≢ 0 mod P, the boundary exact sequence lets one subtract a Λ_D-adic lift of ℰ_D's boundary values times L_D⁻¹·(unit), producing a cusp form H ≡ ℰ_D mod P^r, whence 𝕋_D/I_D surjects onto Λ_D/(𝔈_D, P^r).

**API.**

- The family ℰ_D lies in the ordinary boundary-corank-at-most-one module M¹ over Λ_D and specializes at every permitted φ to the stated unit multiple of the canonically normalized classical family. Its genus-zero boundary restriction is zero.
- At every permitted cusp and singular β, c_D(β,x) lies in the product ideal (L_D); nonsingular coefficients determine primitivity separately in §1.7.
- The Hecke action on M¹ gives λ_D^1 into Λ_D; the cuspidal image gives the eigencharacter only in Λ_D/𝔈_D through the stated quotient isomorphism.
- If ℰ_D mod P is nonzero, boundary lifting yields a nonzero cuspidal congruence of order at least ord_P(L_D), hence the stated Eisenstein-ideal bound. The q-expansion principle determines the family from its permitted coefficients.

**Checks.**

- For β = diag(1,0), det β = 0 and its coefficient lies in (L_D); for β = diag(1,1), det β = 1 and no such divisibility is asserted. If every nonsingular coefficient were also in P while L_D ∈ P, every coefficient would vanish modulo P, contradicting the primitivity hypothesis.
- Over a DVR, a family with one coefficient 1 reduces nontrivially modulo (ϖ); its multiple by ϖ reduces to 0 and cannot use the same primitivity argument. If ord_P(L_D) = 2, only the first family yields the lower bound 2 by this argument.
- The noncuspidal eigencharacter sends T_v to its Eisenstein value in Λ_D. A cuspidal quotient with 𝔈_D = (ϖ) sends it only to that value modulo ϖ: a Λ_D-algebra lift Λ_D/(ϖ) → Λ_D would send both ϖ = 0 and ϖ ≠ 0 to the same scalar, an impossibility for a DVR. At a genus-zero cusp ℰ_D has constant term 0, whereas an unrestricted form with term 1 is outside M¹.
- The congruence is with the whole family ℰ_D, not with an individual Eisenstein series; an interpolation formula for ℰ_D alone does not give it.
- Excluded case: if ℰ_D ≡ 0 mod P no bound is claimed.

*Needs:* §§0.4, 0.8, 1.2, 1.3, 1.4 and 1.5; MetaplecticAutomorphicForms §6.2.

### 1.7 A nonsingular Fourier coefficient is prime to the p-adic L-function

Let A be the ring of integers of a finite extension of ℚ_p, 𝕀 a domain finite over Λ_(W,A), 𝐟 ∈ M^ord(M, 1; 𝕀) an 𝕀-adic newform with (irred)_𝐟 and (dist)_𝐟, and Σ_0 ⊇ {ℓ | pMD_K}. There is a finite Σ ⊇ Σ_0 such that for D = (A, 𝕀, 𝐟, 1, 1, Σ) the set C_D = {c_D(β_i, x) : 1 ≤ i ≤ h_K, x ∈ G(𝔸_f) with x_p ∈ Q(ℤ_p)} of nonsingular coefficients of ℰ_D, where β_i = diag(1, q_i) is the Hermitian matrix attached to the i-th ideal-class representative a_i and its rational number q_i (SU (11.9.3.c), p. 190), satisfies: (i) every height-one prime of Λ_D containing C_D is of the form PΛ_D with P a height-one prime of 𝕀[[Γ^+_K]]; (ii) if M = M^+M^- with every prime dividing M^+ split in K, every prime dividing M^- inert in K, M^- squarefree with an odd number of prime factors, and ρ̄_𝐟 ramified at every ℓ | M^-, then a height-one prime of Λ_D containing both L^Σ_(𝐟,K,1) and C_D is of the form Q·Λ_D with Q a height-one prime of 𝕀[[Γ^+_K]] containing the removed nonsplit Euler product E^ns_Σ of [§1.5](#15-the-skinnerurban-three-variable-p-adic-l-function)(iii), and at such a prime ord_(QΛ_D)(L^Σ_(𝐟,K,1)) ≤ ord_Q(E^ns_Σ); no other height-one prime contains both (SU Prop. 13.4.1, corrected at the pulled-back primes as in §1.5(iii)).

Assume the hypotheses of SU Prop. 12.2.5 on A; the auxiliary primes of Prop. 13.2.5 (a set of primes split in K not dividing the level) are part of the choice of Σ.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Prop. 13.4.1 and the paragraph before it, p. 217; Props 13.2.5, 13.3.4, pp. 210–213. Existence of a datum whose nonsingular coefficients share no height-one prime with L^Σ_(𝐟,K,1). [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.4.5, p. 9. The proof uses formulas from §11 and the mod-p nonvanishing results of Vatsal and Finis.

The proof proceeds as follows. Express a Λ_D-combination of the c_D(β_i, x) as a product of Hecke L-values attached to auxiliary CM forms (SU §13.2–13.3, Props 13.2.5, 13.3.4). Choose the auxiliary split variation prime away from p, the discriminant and the CM conductor. For the self-dual Hecke factors verify sign +1 and vanishing of every local μ-invariant before using Finis’s valuation formula or Hsieh2012 Theorem A, including its squarefree ramified conductor condition; for a non-residually-self-dual factor use Theorem B with its local μ and coprimality hypotheses. Apply these mod-p nonvanishing inputs and Vatsal’s theorem for anticyclotomic twists (gap:hecke-l-values-mod-p and gap:vatsal-theta-mu) to show that combination is not divisible by any height-one prime other than those pulled back from 𝕀[[Γ^+_K]]. Combine with [§1.5](#15-the-skinnerurban-three-variable-p-adic-l-function)(iii)(b): a pulled-back prime Q·Λ_D contains L^Σ_(𝐟,K,1) only if E^ns_Σ ∈ Q, with the stated valuation bound, which gives (ii). SU Prop. 13.4.1(ii) states that no height-one prime contains both; that form rests on SU Prop. 12.3.6 and fails at the primes of §1.5's nonsplit witness.

**Checks.**

- A self-dual factor of root number −1 has central value 0 and cannot furnish the required coefficient unit. With sign +1 but a Finis local μ sum equal to 1, the normalized value has valuation 1 and again is not a unit. Only sum 0 gives a unit outside the finite exceptional twist set.
- Over ℚ the split auxiliary prime has local degree 1, so the nonvanishing set is cofinite; a degree-two local base in Hsieh's general-CM statement gives only the specified Zariski-dense conclusion, not a cofinite one.
- This is what makes ℰ_D nonzero modulo every height-one prime dividing L^Σ_(𝐟,K) other than the pulled-back primes containing E^ns_Σ, so that Thm 6.5.4 applies at those primes.
- At the nonsplit witness of §1.5 (11a1, p = 7, K = ℚ(√−3), 113 ∈ Σ), a height-one prime Q of 𝕀[[Γ^+_K]] containing E_(𝐟,K,1,113) may contain C_D by (i) and contains L^Σ_(𝐟,K,1); (ii) then gives only ord_(QΛ_D)(L^Σ) ≤ ord_Q(E_(𝐟,K,1,113)), and §1.10 treats Q by the Euler-factor comparison, not by a nonsingular coefficient. A statement of (ii) without the pulled-back exception would be refuted by this Q.
- Level test for (ii), with K = ℚ(√−7) and p = 11 (split, since −7 ≡ 4 = 2² mod 11). Take M^- = 3: −7 ≡ 2 mod 3 is a nonsquare, so 3 is inert and M^- has one prime factor. With M^+ = 13, −7 ≡ 6 mod 13 is a nonsquare, so 13 is inert, the inert part of M = 39 has two prime factors and (ii) does not apply; a version that only constrains the labelled factor M^- would wrongly accept this level. With M^+ = 29, −7 ≡ 22 ≡ 14² mod 29, so 29 splits and the level M = 87 satisfies the level conditions of (ii). Part (i) carries no level condition and holds for both.

*Needs:* §§1.5 and 1.6; PadicFamilies (gap:hecke-l-values-mod-p); PadicFamilies (gap:vatsal-theta-mu).

### 1.8 The four-dimensional pseudo-character of the ordinary GU(2,2) Hecke algebra

For a neat K = K^0_pK^p ⊂ G(𝔸_f) and a finite set S of primes containing p and the primes where K_ℓ is not hyperspecial, there is a pseudo-representation T^S_(K^p): G_K → h_(S,0)(K^p) of dimension four such that tr R_p(π) = λ^ord_π ∘ T^S_(K^p) for every p-ordinary cuspidal π of weight k with π_f^(K^p) ≠ 0 (SU Prop. 7.2.1), where R_p(π) is the four-dimensional Galois representation attached to π (AutomorphicGaloisRepresentationsPartII Layers AG2.2, AG2.5 and AG2.6, with the imaginary-quadratic descent of gap:unitary-galois-imaginary-quadratic: polarized, unramified outside S, crystalline at p when π_p is unramified, with the ordinary filtration at the primes above p). For a datum D, T_D is its composite with h_D, R_D the semisimple representation over the total fraction ring of h_D with trace T_D, and for each irreducible component J, R_J is either absolutely irreducible or, over a finite extension of Frac J, R_1 ⊕ R_2 with two-dimensional R_i satisfying R_i^c ≅ R_i^∨ ⊗ ε⁻³ω¹⁺ᶜ_(K′) (SU Thm 7.3.1).

Assume k regular for the attachment of R_p(π) (SU Thm 7.1.1 and the references there); (irred)_𝐟 and (dist)_𝐟 for Thm 7.3.1. The Galois representations of cuspidal representations of GU(2,2) and their local–global compatibility at p are imported, not constructed here.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thm 7.1.1, p. 99; Prop. 7.2.1 and its proof, p. 101. The Galois representations of ordinary cuspidal representations of GU(2,2) and the pseudo-representation on the universal ordinary Hecke algebra. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thm 7.3.1 and its proof, pp. 103–105. Components of the Hecke algebra give irreducible or polarized-reducible representations.

The proof proceeds as follows. Define T(frob_v) := T_v (the Hecke operator giving minus the coefficient of X in the reciprocal Hecke polynomial det(1 − X·Frob_v)) for v ∉ S ∪ {p}, extend by continuity using Chebotarev density and compactness of h, and check independence of the approximating sequence on a Zariski-dense set of arithmetic points (proof of SU Prop. 7.2.1). The pseudo-representation identities hold because they hold at each classical point and these are dense. Thm 7.3.1: if R_J were a sum of two characters and an irreducible two-dimensional piece, specialize at a regular-weight point unramified at p to get a CAP representation, excluded by the residual shape tr ρ̄_D; otherwise R_J = R_1 ⊕ R_2 with the stated polarization.

The interface is used in [§1.9](#19-the-skinnerurban-selmer-lower-bound-from-the-eisenstein-ideal) to σ of the lattice datum is the representation R_D over the localized Hecke algebra; in [§2.6](#26-irreducibility-of-the-gu31-pseudo-character-excluding-cap-components) to CLW and FW use the same pseudo-character argument on GU(3,1) (SU Prop. 7.2.1 cited there).

**API.**

- T^S_(K^p): G_K → h_(S,0)(K^p) is a continuous four-dimensional pseudo-representation.
- It satisfies λ^ord_π ∘ T = tr R_p(π) for every ordinary cuspidal π of level K^p.
- T(frob_v) = T_v for v ∉ S ∪ {p}; the characteristic polynomial of frob_v is the Hecke polynomial Q_v.
- T(c g c) = T(g⁻¹)·(similitude character) — the polarization inherited from each R_p(π).
- For each component J of 𝕋_D, R_J is absolutely irreducible or the polarized sum R_1 ⊕ R_2 of SU Thm 7.3.1.
- The reduction of T_D modulo the maximal ideal is tr ρ̄_D.
- Continuous pseudocharacters agreeing at all unramified Frobenius classes agree by Chebotarev density; compatible Hecke quotient maps transport the pseudocharacter.

**Checks.**

- For eigenvalues 1, 2, 3, 4 the reciprocal polynomial is 1 − 10X + 35X² − 50X³ + 24X⁴, so minus its X coefficient is 10, the trace. Minus its cubic coefficient is 50. The monic characteristic polynomial is X⁴ − 10X³ + 35X² − 50X + 24; conversion preserves the trace 10.

- T(1) = 4.
- The cuspidal pseudocharacter modulo I_D agrees with tr ρ_D modulo 𝔈_D through Λ_D/𝔈_D≅h_D^cusp/I_D. It need not admit an Eisenstein eigencharacter into Λ_D itself.
- A pseudo-character of dimension two (the GL₂ one of 𝐟) does not satisfy the specialization identity λ^ord_π ∘ T = tr R_p(π): its value at 1 is 2.
- No component J has R_J = character ⊕ character ⊕ irreducible two-dimensional (the CAP shape), under (irred)_𝐟 and (dist)_𝐟.
- The residual pseudo-character of 𝕋_D is tr ρ̄_D: two characters and one irreducible two-dimensional constituent.

*Needs:* §§1.1 and 1.3; AutomorphicGaloisRepresentationsPartII Layer AG2.2 (geometric existence in the Shin-regular range); AutomorphicGaloisRepresentationsPartII Layer AG2.2 (Galois assembly for discrete unitary transfer); AutomorphicGaloisRepresentationsPartII (gap:unitary-galois-imaginary-quadratic); AutomorphicGaloisRepresentationsPartII Layer AG2.5 (unramifiedness and the good-prime polynomial); AutomorphicGaloisRepresentationsPartII Layer AG2.6 (polarized admissibility at the coefficient prime); IntegralHeckeAndGaloisDeterminants §§4.1 and 4.2.

### 1.9 The Skinner–Urban Selmer lower bound from the Eisenstein ideal

Assume (irred)_𝐟, (dist)_𝐟 and 𝕀 integrally closed. Let T = (T_𝐟 ⊗_𝕀 𝕀[[Γ_K]])(det ρ_𝐟⁻¹σ⁻ᶜ_ξε⁻ᶜ_K) with its ordinary summand T^+, and Ch^Σ_K(ρ_𝐟 ⊗ σ_ξε_K) ⊆ 𝕀[[Γ_K]] the characteristic ideal of X^Σ_K(T, T^+). For a height-one prime P_0 ⊂ 𝕀[[Γ_K]] with P = P_0Λ_D such that the four G_(K,p)-characters of SU (7.3.3.a) are residually distinct modulo P: (i) if ord_P(L^Σ_(χ̄_𝐟ξ̄′)) = 0 then ord_(P_0)(Ch^Σ_K(ρ_𝐟 ⊗ σ_ξε_K)) ≥ ord_P(𝔈_D) (SU Thm 7.3.3); (ii) if ℰ_D ≢ 0 modulo P and ord_P(L^Σ_(𝐟,K,ξ)) ≥ 1, then ord_P(Ch^Σ_K) ≥ 1, and if moreover ord_P(L^Σ_(χ̄_𝐟ξ̄′)) = 0 then ord_P(Ch^Σ_K) ≥ ord_P(L^Σ_(𝐟,K,ξ)) (SU Thm 7.3.5). The bound is height-one-prime by height-one-prime and needs ℰ_D ≢ 0 mod P; [§1.7](#17-a-nonsingular-fourier-coefficient-is-prime-to-the-p-adic-l-function) supplies this at every P dividing L^Σ_(𝐟,K).

The residual disjointness condition (7.3.3.a) is verified in the proof of Thm 7.3.5: the four characters δ²_fσ⁻¹_(χ_f)ε_Wε, δ_fσ⁻¹_(χ_f)σ_ξε_W, δ_fσ⁻¹_(χ_f)σ^c_ξε_W, σ_(χ_f)ε⁻¹_Wσ⁻¹_(ξ′)ε are not ≡ 1 modulo P, by (dist)_𝐟 and a codimension count.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §7.3.2 set-up, Thm 7.3.3, p. 105; Thm 7.3.5 and proof, pp. 107–108. The SU instance of the lattice construction and the passage from the Eisenstein ideal to the p-adic L-function.

The proof proceeds as follows. Set up the lattice datum of SU 7.3.2: A_0 = Λ_D, A = Λ̂_(D,P), J_0 = 𝔈_D, R_0 = 𝕋_D, I_0 = I_D, V_0 = T_𝐟 ⊗ Λ_D, ρ_0 = ρ_𝐟 ⊗ σ_(χ̄_f,0)σ⁻ᶜ_ξσ^c_ψε⁻², V^±_0 from T^+_𝐟, χ, χ′, ν, and σ from R_D. Apply [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups) (Prop. 4.5.6 and Cor. 4.5.7, with the hypothesis of SU Lemma 4.3.11 supplied by the dichotomy of SU Thm 7.3.1 for the components of 𝕋_D, as in SU proof of Thm 7.3.3, p. 106) and Shapiro ([§0.1](#01-σ-primitive-ordinary-selmer-groups-over-iwasawa-towers)) to pass from ρ_0 ⊗ χ⁻¹ over Λ_D to ρ_𝐟 ⊗ σ_ξε_K over 𝕀[[Γ_K]]. Thm 7.3.5 combines (i) with [§1.6](#16-the-λ_d-adic-klingen-eisenstein-family-and-its-constant-terms) (Thm 6.5.4) and checks (7.3.3.a).

**Checks.**

- Orientation of (i): at a height-one P with ord_P(𝔈_D) = 2 and ord_P(L^Σ_(χ̄_𝐟ξ̄′)) = 0, a characteristic valuation 3 satisfies the conclusion and a valuation 1 violates it; the reversed inequality would accept 1 and reject 3.
- A family all of whose coefficients lie in P, for instance g times a family for a generator g of P, is ≡ 0 modulo P and fails the hypothesis of (ii); no bound is drawn from it.

*Needs:* §§0.1, 0.5, 0.7, 1.3, 1.6 and 1.8.

### 1.10 Skinner–Urban's two-variable divisibility over K

Let L ⊆ ℚ̄_p be a finite extension of ℚ_p containing ℚ[µ_(Np), i, D_K^(1/2)], 𝕀 a normal domain finite over Λ_(W,O_L), and 𝐟 an 𝕀-adic ordinary eigenform of tame level N with χ_𝐟 = 1. Suppose N = N^+N^- with N^+ divisible only by primes split in K and N^- only by primes inert in K, N^- squarefree with an odd number of prime factors, (irred)_𝐟 and (dist)_𝐟, and ρ̄_𝐟 ramified at every ℓ | N^-. For every finite Σ containing the primes dividing ND_K, Ch^Σ_(K_∞)(𝐟) ⊆ (L^Σ_(𝐟,K)) (SU Thm 3.6.1). For a classical p-ordinary eigenform f ∈ S_k(Np^r, χ; L), k ≥ 2, with χ = ωᵏ⁻²χ_1 (χ_1 of p-power order and conductor) and the same hypotheses, Ch^Σ_(K_∞,L)(f) ⊆ (L^Σ_(f,K)) (SU Cor. 3.6.2).

Retain the stated hypotheses; the hypotheses on N^- and ρ̄_𝐟|_(I_ℓ) enter through Vatsal's theorem ([§1.5](#15-the-skinnerurban-three-variable-p-adic-l-function) (iii)); χ_𝐟 = 1 enters there and in the Galois argument; Σ ⊇ primes dividing ND_K avoids local–global compatibility away from p (SU remarks (i)–(v) after Thm 3.6.1).

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Thm 3.6.1 and remarks (i)–(v), pp. 41–42; Cor. 3.6.2 and proof, p. 42; end of §7, p. 108. The two-variable divisibility for Hida families and its specialization to classical forms.

The proof proceeds as follows. If X^Σ_(K_∞)(𝐟) is not torsion, Ch^Σ = 0 by the convention of [§0.1](#01-σ-primitive-ordinary-selmer-groups-over-iwasawa-towers) and the containment holds; assume it torsion. Write Σ^ns for the primes of Σ ∖ {p} nonsplit in K and E^ns_Σ for the product of their removed Euler factors ([§1.5](#15-the-skinnerurban-three-variable-p-adic-l-function)(iii)). For each height-one prime P_0 of 𝕀[[Γ_K]] dividing L^Σ_(𝐟,K) that is not of the form Q·𝕀[[Γ_K]] with Q a height-one prime of 𝕀[[Γ^+_K]] containing E^ns_Σ, choose the datum of [§1.7](#17-a-nonsingular-fourier-coefficient-is-prime-to-the-p-adic-l-function) so that ℰ_D ≢ 0 mod P = P_0Λ_D (§1.7(ii)); the Dirichlet factor L^Σ_(χ̄_𝐟ξ̄′) is a unit at P because it lives in the cyclotomic variable only and P_0 is not pulled back (by §1.5(iii)(b) a pulled-back P_0 dividing L^Σ_(𝐟,K) has E^ns_Σ ∈ Q), so [§1.9](#19-the-skinnerurban-selmer-lower-bound-from-the-eisenstein-ideal) (ii) gives ord_(P_0)(Ch^Σ) ≥ ord_(P_0)(L^Σ_(𝐟,K)). At a pulled-back P_0 = Q·𝕀[[Γ_K]] with E^ns_Σ ∈ Q, where ℰ_D may vanish modulo P and the coefficient argument gives nothing, compare Euler factors instead: X^Σ torsion makes the primitive dual torsion, and (irred)_𝐟 leaves T* no trivial subquotient, so [§0.2](#02-primitive-against-σ-primitive-selmer-groups-and-the-removed-euler-factors) (iii), applied over ℚ_∞ to the coefficient module induced from K along the anticyclotomic direction (Shapiro as in §0.1 and SU Lemma 3.1.5) for the sets Σ and Σ ∖ Σ^ns, with the Euler elements matched as in §0.2, gives Ch^Σ = Ch^(Σ∖Σ^ns)·∏_(ℓ∈Σ^ns) E_(𝐟,K,1,ℓ); hence ord_(P_0)(Ch^Σ) ≥ ord_Q(E^ns_Σ) ≥ ord_(P_0)(L^Σ_(𝐟,K)) by §1.5(iii)(b). Conclude ord_(P_0)(Ch^Σ) ≥ ord_(P_0)(L^Σ_(𝐟,K)) for every height-one P_0, hence the divisorial containment (end of SU §7, p. 108, whose appeal to SU Prop. 13.4.1(ii) at the pulled-back primes is replaced by this Euler-factor comparison). Cor. 3.6.2: specialize along 𝕀 → O_L using (3.3.12.b), [§0.3](#03-specializing-σ-primitive-selmer-groups-and-their-characteristic-ideals) (ii) and the comparison of L^Σ_(𝐟,K) with L^Σ_(f,K) (SU 3.4.6).

**Checks.**

- Over the localization at a height-one prime, analytic valuation 2 and characteristic valuation 3 give (ϖ³) ⊆ (ϖ²), as Ch ⊆ (L) requires; valuations 2 and 1 give (ϖ) ⊄ (ϖ²) and violate it. The reverse containment is the opposite direction, not this theorem.
- At the height-one prime (p) the ideals (p) and (1) have valuations 1 and 0 and coincide after inverting p; an analytic function p against characteristic ideal (1) violates this integral statement, while a p-inverted version would accept it.
- Level parity: N⁻ = 1 has zero prime factors, an even number, and is excluded; N⁻ a single prime inert in K, at which ρ̄_𝐟 is ramified, is admitted.
- Pulled-back witness: for 11a1, p = 7, K = ℚ(√−3) and Σ ⊇ {3, 7, 11, 113}, let Q be a height-one prime of 𝕀[[Γ^+_K]] containing E_(𝐟,K,1,113), whose weight-two value 12915/12769 has 7-adic valuation 1, and P_0 = Q·𝕀[[Γ_K]]. The analytic side gains ord_Q(E_(𝐟,K,1,113)) ≥ 1 at P_0 from L^Σ = E_(𝐟,K,1,113)·L^(Σ∖{113}), and the Selmer side gains the same term from Ch^Σ = Ch^(Σ∖{113})·E_(𝐟,K,1,113) in the torsion case, so the bound at P_0 holds with both terms retained; a proof using only the coefficient argument of §1.7 has no datum with ℰ_D ≢ 0 mod P_0Λ_D at this Q and proves nothing there.

*Needs:* §§0.1, 0.2, 0.3, 1.5, 1.7 and 1.9; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 1.11 Skinner–Urban's cyclotomic divisibility

Let f ∈ S_k(Np^r, χ; L), k ≥ 2, be a p-ordinary cuspidal eigenform with (irred) and (dist) for ρ_f, χ = ωᵏ⁻²χ_1 with χ_1 of p-power order and conductor, and a prime q ≠ p with q ∥ N at which ρ̄_f is ramified; choose an imaginary quadratic K in which p splits, every prime dividing N/q splits and q is inert, so N^- = q. Then for every finite set of primes Σ, Ch^Σ_(ℚ_∞,L)(f)·Ch^Σ_(ℚ_∞,L)(f ⊗ χ_K) ⊆ (L^Σ_f·L^Σ_(f⊗χ_K)) (SU Cor. 3.6.3). This is the reverse divisibility that ModularIwasawaMainConjectures imports through its supplier gap automorphic-endpoints, in the normalization of the Σ-imprimitive ordinary Selmer dual and the canonical-period p-adic L-function; the equality (SU Thm 3.6.4, with Kato) is assembled there, not here.

Retain the stated hypotheses; the integral containment needs only these hypotheses. The integral equality additionally uses Kato's image condition (a basis with image containing SL₂(ℤ_p)), owned by the consumer. The identification with the ordinary Selmer dual and canonical-period p-adic L-function of ModularIwasawaMainConjectures is made in that roadmap, in the range (trivial character, p ∤ N, the range of SU Thm 3.6.4); outside it the statement is about SU's own Σ-primitive Selmer group and L^Σ_f.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Cor. 3.6.3 and proof, p. 42; proof of Thm 3.6.4 (choice of K), p. 43. The cyclotomic product divisibility and the choice of the auxiliary imaginary quadratic field.

The proof proceeds as follows. Reduce to Σ ∪ {p} containing all primes dividing ND_K (SU Lemma 3.2.17 and [§0.2](#02-primitive-against-σ-primitive-selmer-groups-and-the-removed-euler-factors)). Apply [§1.10](#110-skinnerurbans-two-variable-divisibility-over-k) (Cor. 3.6.2), then descend from K_∞ to the cyclotomic line: [§0.3](#03-specializing-σ-primitive-selmer-groups-and-their-characteristic-ideals) (iii) (SU Prop. 3.2.11, Lemma 3.2.5, Cor. 3.2.9) gives Ch^Σ_(K^+_∞) = Ch^Σ_(ℚ_∞)(f)·Ch^Σ_(ℚ_∞)(f ⊗ χ_K) by Shapiro, and the restriction of L^Σ_(f,K) to Γ^+_K is L^Σ_f·L^Σ_(f⊗χ_K) up to unit (SU 3.4.6).

**Checks.**

- For the curve 11a1 (conductor 11, split multiplicative at q = 11 with ord_11(Δ) = 5) and p = 7, ρ̄_(E,7) is ramified at 11 and a_7 = −2 is a 7-adic unit. The field K = ℚ(√−3) has 7 split (−3 ≡ 2² mod 7) and 11 inert (−3 ≡ 8 mod 11 is not a square), so N⁻ = 11 has one prime factor, as §1.10 requires; a field in which 11 splits would give N⁻ = 1 and is not allowed.
- The auxiliary field depends on f: for the same curve at p = 5, ρ̄_(E,5) is reducible (11a1 has a rational point of order 5), so (irred) fails and the corollary is not asserted.

*Needs:* §§0.1, 0.2, 0.3, 1.5 and 1.10; ModularSymbolsPadicLFunctions §1.1.

### Examples

At an arithmetic quotient I→O, the SU coefficient ring becomes O[[Γ_K⁻×Γ_K]], with three independent pro-p variables. Its Krull dimension is four; the original Hida branch retains its additional weight direction. This distinguishes specialization from the invalid choice I=O as a finite branch over O[[W]].

At a residual Eisenstein point the trace is χ′+tr ρ₀+χ, so its value at the identity is 1+2+1=4 and its reciprocal characteristic polynomial has constant coefficient 1. The GL₂ family alone has trace 2 at the identity and cannot furnish this eigenpacket. A nonzero boundary coefficient of ℰ_D remains the product of the two specified analytic factors times the inducing form; it puts the form in M¹ rather than its cuspidal kernel M⁰. Reducing that boundary product to zero modulo (L_D), while retaining a nonconstant coefficient outside P, is exactly what produces a nonzero cuspidal congruence modulo (L_D).

### Dependencies

Earlier layers: §§0.1, 0.2, 0.3, 0.4, 0.5, 0.7 and 0.8. Suppliers: AutomorphicBundles §§12.2, 12.8, 12.15 and 12.16; AutomorphicGaloisRepresentationsPartII Layer AG2.2 (geometric existence in the Shin-regular range), Layer AG2.2 (Galois assembly for discrete unitary transfer), (gap:unitary-galois-imaginary-quadratic), Layer AG2.5 (unramifiedness and the good-prime polynomial), Layer AG2.6 (polarized admissibility at the coefficient prime); DirichletPadicLFunctions §2.8; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); IntegralHeckeAndGaloisDeterminants §§3a.1, 4.1 and 4.2; IntegralIwasawaTheory §5.0; MetaplecticAutomorphicForms §§6.2, 6.10a and 6.11; ModularSymbolsPadicLFunctions §1.1; PELModuli §§M5.5 and M5.6; PadicFamilies §§0a.11, 0a.15, 0a.16, 1.3 and 4.1, (gap:hecke-l-values-mod-p), (gap:hida-rankin-selberg-cm), (gap:vatsal-theta-mu); PadicMeasuresIwasawaAlgebras §4.6, (gap:divisorial-char-ideal); ShimuraCompactifications §§7.3 and 7.16. Libraries: Mathlib `MvPowerSeries`.

## Layer 2: Semi-ordinary GU(3,1) congruences, general weights and seed main conjectures

### 2.1 The semi-ordinary weight space and projector for GU(3,1)

Let K be imaginary quadratic with p = v_0v̄_0 split, and GU(3,1) the unitary similitude group of signature (3,1), so that GU(3,1)(ℚ_p) ≅ GL_4(ℚ_p) × ℚ_p^× and the diagonal torus of the p-adic group gives a four-coordinate p-adic weight space (after fixing the similitude character) of characters (a_1, a_2, a_3; b_1). The semi-ordinary torus T_so(ℤ_p) ⊂ T(ℤ_p) is the two-dimensional subtorus of weights (0, 0, t^+; t^-), with Iwasawa algebra Λ_so = ℤ_p[[T_so(1+pℤ_p)]]. On the p-adic forms V on the Igusa tower put U_p := U^+_(p,2)U^+_(p,3)U^-_(p,1); for every f ∈ V the limit e_so f := lim_(r→∞) U_p^(r!) f exists and defines the semi-ordinary projector e_so. A classical form is semi-ordinary if it is fixed by e_so; this asks unit U_p-eigenvalues only in the two directions of T_so, so it allows forms whose GL_2 part at p is not ordinary (a_p = 0 is allowed). Keep the finite character of T_so(ℤ_p)/T_so(1+pℤ_p) when using the full group algebra; it is not another power-series variable.

Assume p ≥ 3 split in K; the operators U^±_(p,i) are those of CLW (3.0.7)–(3.0.8) on p-integral forms. The convergence of U_p^(r!) on every f uses the finiteness property (F) of CLW Thm 4.6.1, proved there; the generic profinite projector is that of PadicFamilies §0a.11.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), Thm 2.9.1(1), p. 13; Thm 4.6.1 and proof, p. 29. The operator U_p = U^+_(p,2)U^+_(p,3)U^-_(p,1), convergence of U_p^(r!) on every p-adic form, and the semi-ordinary projector e_so. [CLW](https://arxiv.org/pdf/2109.08375v1), §1, p. 3. The modular form is not assumed ordinary at p, so the standard Hida theory does not apply; the semi-ordinary theory replaces it.

The proof proceeds as follows. Define U_p and verify property (F) for forms in V^♭ by CLW Prop. 3.0.2 and Prop. 4.5.2, and for all of V by Prop. 4.5.3. Apply the profinite ordinary projector of PadicFamilies §§0a.11 and 0a.22 to the locally finite endomorphism U_p to obtain e_so.

The interface is used in [§2.2](#22-semi-ordinary-hida-theory-and-the-fundamental-exact-sequence) to the freeness and control theorems are for e_so-parts; in [§2.3](#23-the-semi-ordinary-klingen-eisenstein-family-on-gu31) to E^Kling is a measure valued in e_so V; in [§2.9](#29-semi-ordinary-hida-theory-on-gu31-in-general-weight) to FW §7.3 extends the same projector to general weight.

**API.**

- The semi-ordinary torus T_so is two-dimensional; Λ_so = ℤ_p[[T_so(1+pℤ_p)]], and ℤ_p[[T_so(ℤ_p)]] is the sum of its finite-character components.
- The operator U_p = U^+_(p,2)U^+_(p,3)U^-_(p,1) acts on p-adic forms.
- The limit e_so = lim U_p^(r!) is an idempotent, e_so ∘ e_so = e_so, commuting with the Hecke operators away from p.
- e_so ∘ e_ord = e_ord: ordinary forms are semi-ordinary.
- A Λ_so-family has a weight, a character (τ^+, τ^-) of T_so(ℤ_p) at each specialization.
- Two semi-ordinary forms are equal iff their ambient forms are equal; membership is e_so(f)=f. The projector transports along equivariant maps.

**Checks.**

- On a classical eigenform whose U_p-eigenvalue is a p-adic unit u, U_p^(r!)f = u^(r!)f → f because u^(r!) → 1 in ℤ_p^× along r!; on an eigenform with U_p-eigenvalue in pℤ_p the limit is 0.
- In the unitary normalization, a good supersingular weight-two GL₂ constituent has Satake valuations 0,0. It can occur in CLW’s semi-ordinary Klingen family although its classical GL₂ U_p roots have valuation 1/2,1/2. The extreme unitary valuations ±1/2 describe the ordinary case; they are not the supersingular example.
- After fixing a_1=a_2=0, Λ_so has two weight variables and Krull dimension three over Z_p; the finite torus character is retained separately. The unfixed weight tuple has four coordinates.
- Using the ordinary projector in place of e_so on the weight-two forms of a supersingular π gives zero, so it cannot produce the Klingen family of [§2.3](#23-the-semi-ordinary-klingen-eisenstein-family-on-gu31).
- Semi-ordinary is weaker than ordinary: an ordinary form is semi-ordinary, while a form whose GL_2 constituent at p has a_p = 0 can be semi-ordinary and is killed by the ordinary projector.

*Needs:* PadicFamilies §§0a.11, 0a.19 and 0a.22; PELModuli §§M5.5 and M5.6; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); Mathlib `MvPowerSeries`.

### 2.2 Semi-ordinary Hida theory and the fundamental exact sequence

With e_so as in [§2.1](#21-the-semi-ordinary-weight-space-and-projector-for-gu31): (1) the duals V^(0,*)_so = Hom(e_so V^0, ℚ_p/ℤ_p) and V^*_so = Hom(e_so V, ℚ_p/ℤ_p) are free of finite rank over Λ_so (vertical control, CLW Thm 3.0.7 for cusp forms, Thm 4.6.1 for all forms); (2) the spaces of Λ_so-families of tame level K^p_f, M^0_so = Hom_(Λ_so)(V^(0,*)_so, Λ_so) and M_so = Hom_(Λ_so)(V^*_so, Λ_so), specialize isomorphically at every weight (τ^+, τ^-) with 0 ≥ t^+ ≥ −t^- + 4 onto the limits of e_so-parts of mod p^m forms of that weight, and classical semi-ordinary forms embed into the specialization after inverting p (CLW (2.9.1)); (3) Thm 2.9.1(4) gives the exact sequence 0→M_so^0→M_so→⊕_g M_(0,0)(K′_(f,g);Z_p)⊗_Zp Z_p[[T_so(Z_p)]]→0. Thus the boundary uses the full torus group algebra, with its finite-character action. Only after the specified ξ/Γ_K base change does one obtain the boundary form used in Thm 8.1.1. Thm 2.9.1(3) gives surjectivity onto classical cuspidal forms for t^-≥A(t^+); this extra condition is not automatic from the cone in (2).

Assume the weights in (2) satisfy 0 ≥ t^+ ≥ −t^- + 4; for the Klingen family, 0 ≫ t^+ ≫ −t^-. The Shimura variety of GU(3,1) and its toroidal and minimal compactifications are those of PELModuli §§M5.5–M5.6 and ShimuraCompactifications §§7.3 and 7.16, and the Igusa tower, its p-adic forms and the boundary strata are gap:unitary-ordinary-igusa. Retain the finite torus character when passing from Λ_so to the full boundary group algebra. Classical cusp-surjectivity additionally requires t^-≥A(t^+). The exactness on the right is what allows a Λ_so-adic lift of the boundary values of the Klingen family, hence a cuspidal family congruent to it.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), Thm 2.9.1, PDF pp. 13–14; Thm 3.0.7, p. 19; Prop. 4.4.1, p. 24; Thm 4.6.1, p. 29. Freeness, control, the boundary exact sequences and the vertical control theorem for semi-ordinary forms on GU(3,1). [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.1.1, p. 77. The fundamental exact sequence in the form used for the congruence.

The proof proceeds as follows. Base change and q-expansion: CLW Props 3.0.1–3.0.6; vertical control for cusp forms (Thm 3.0.7). The boundary: restriction to the strata Z_(g,n) gives the exact sequences (4.4.2)–(4.4.3) with the Siegel operators Φ_g (Prop. 4.4.1), whose global sections are forms on the zero-dimensional Shimura variety of GU(2). Finiteness (F) and the vertical control for all forms (Props 4.5.1–4.5.3, Thm 4.6.1); combine into Thm 2.9.1.

**Checks.**

- The model boundary map A² → A, (x, y) ↦ y, is surjective with kernel A × 0, and the boundary value 1 lifts to (0, 1); the zero map A² → A has cokernel A and lifts no nonzero boundary value, so a sequence that is not exact on the right gives no cuspidal family congruent to the Klingen family.
- A factor ℤ_p^× of T_so(ℤ_p) contributes ℤ_p[[ℤ_p^×]] ≅ ℤ_p[μ_(p−1)] ⊗ ℤ_p[[1 + pℤ_p]] to the boundary algebra, which has p − 1 local components (4 at p = 5), one for each finite character of μ_(p−1); the algebra ℤ_p[[1 + pℤ_p]] is local. Identifying the two before the ξ/Γ_K base change discards all but one finite-character component.
- Divisible against compact: at p = 5 with a single coefficient fibre V = ℚ_5/ℤ_5, the Pontryagin dual Hom(V, ℚ_5/ℤ_5) is ℤ_5; multiplication by 5 is surjective on V with kernel 𝔽_5 and injective on ℤ_5 with cokernel 𝔽_5. Identifying the divisible module e_so V with its compact dual V^*_so would interchange these, and the Λ_so-freeness of (1) is a statement about the compact duals.

*Needs:* §2.1; PadicFamilies §§0a.15 and 0a.16; AutomorphicBundles §§12.2, 12.8, 12.15 and 12.16; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa).

### 2.3 The semi-ordinary Klingen Eisenstein family on GU(3,1)

Let π and ξ satisfy CLW §5.2: π is weight two, each π_v is unramified, Steinberg or its unramified quadratic twist, π_p is unramified, some nonsplit q has π_q ramified, π is ramified at 2 if 2 is nonsplit, ρ̄_π|G_K is irreducible, and ξ has infinity type (0,k_0) with k_0 even. CLW addendum Thm 4.0.1 constructs two families E^Kling_i (i=1,2) in the specified space of ♮ semi-ordinary measures tensored with Q. They use different auxiliary data, have the same unramified/U_p eigensystem, and specialize to the semi-ordinary holomorphic Klingen series at ξτ of type (0,k), k≥6 even. Every constant term of either family is divisible by L^(Σ∪{ℓ,ℓ′})_(ξ,Q)L^(Σ∪{ℓ,ℓ′})_(π,K,ξ) in R[1/p], R=O_L^ur[[Γ_K]]. No integral unscaled measure or single-family unit coefficient is asserted.

Use the two auxiliary data sets of CLW addendum §3, not the original simultaneous-unit choice. The weakened ℓ-tower nonvanishing and the additional finite-set avoidance there are required. The complex doubling identities and local doubling integrals are those of MetaplecticAutomorphicForms §§6.2, 6.10a and 6.11. The p-adic interpolation of the Siegel Eisenstein series on GU(3,3) with CLW's semi-ordinary sections at p (CLW Thm 5.9.1), its pullback (CLW Thm 5.5.1) and the Klingen choices are owned here; Eischen–Wan's ordinary family (EW16 Theorem 1.2) is the ordinary analogue and is not used.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), §5.2–5.4, p. 31; Thm 5.5.1, p. 34; Prop. 5.6.1 and §5.6, pp. 35–36; Thm 5.9.1, p. 42; Prop. 5.10.1, p. 44. Set-up, doubling formula, auxiliary choices, the p-adic Siegel measure and the semi-ordinary Klingen family. [CLW](https://arxiv.org/pdf/2109.08375v1), §6.1, (6.1.1)–(6.1.2) and Thm 6.1.1, p. 46. Divisibility of the degenerate Fourier–Jacobi coefficients by L_(ξ,ℚ)·L_(π,K,ξ). [CLW-addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), §§2–3, pp. 2–3; Thm 4.0.1, pp. 4–5. Two ♮ Klingen families with the same eigensystem and rational constant-term divisibility.

The proof proceeds as follows. Choose the quaternion transfer and two local auxiliary data sets as in the addendum §§2–3. Its weakened nonvanishing suffices to make two selected factors units for each set, rather than all three for one set. Interpolate the Siegel Eisenstein series on GU(3,3) into a measure (Thm 5.9.1) and pull back along GU(3,1) × GU(0,2) ↪ GU(3,3) against π_D (Thm 5.5.1, doubling formula), applying e_so (Prop. 5.10.1). Use the local calculations of CLW §§5–7 and addendum Thm 4.0.1: both ♮ measure families have the same eigensystem and the specified constant-term divisibility in R[1/p]. CLW’s nonordinary p-sections are owned here.

The interface is used in [§2.4](#24-joint-height-one-coprimality-of-two-semi-ordinary-fourierjacobi-families) to the joint ideal of the two families’ Fourier–Jacobi functional values avoids every height-one prime after inverting p; in [§2.5](#25-the-clw-eisenstein-ideal-is-bounded-by-the-p-adic-l-functions) to the congruence of E^Kling with a cuspidal family bounds E_(π,ξ); in [§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function) to FW's general-weight analogue.

**API.**

- There is an indexed pair E_i in the ♮ semi-ordinary measure space tensored with ℚ, as in CLW addendum Thm 4.0.1; no unscaled integral measure is claimed.
- Its value at τ is e_so of the holomorphic Klingen Eisenstein series of weight given by ξτ (∞-type (0,k), k ≥ 6).
- For i=1,2 every constant term is divisible by L_(ξ,Q)L_(π,K,ξ) in R[1/p].
- E^Kling_φ is an eigenvector for the unramified Hecke operators and U_p, with eigensystem λ_(π,ξ) defining the Eisenstein ideal E_(π,ξ).
- Its Fourier–Jacobi coefficients along the Klingen parabolic are sections of line bundles on the boundary abelian scheme.
- Both families share π,ξ and the eigensystem; their auxiliary characters and local sections are indexed by i. A general-weight adaptation must retain that index.
- Equality of measure-valued forms follows from all permitted cusp Fourier–Jacobi expansions; integrating a character and extracting a coefficient commute wherever the construction is defined.

**Checks.**

- The interpolation theorem asserts the convergent holomorphic construction at type (0,k) with k≥6 even. It makes no assertion of nonexistence or nonconvergence at every smaller weight.
- At an interpolation point of either indexed family, its standard constant term has the complex L-value factors and local normalizations of CLW (6.1.1)–(6.1.2). On the family their divisibility is in R[1/p], not an unproved integral measure lattice.
- The Galois representation of an interpolation point is ρ_π|_(G_K) twisted, plus two characters: three constituents of dimensions 2, 1, 1.
- For a supersingular π (a_p = 0) the ordinary-projected Klingen family vanishes, while E^Kling_φ does not.
- Shared local test data: the sections at p and the auxiliary characters are fixed before any arithmetic conclusion, and FW's general-weight family ([§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function)) reuses them.

*Needs:* §2.2; MetaplecticAutomorphicForms §§6.2, 6.10a and 6.11; PadicFamilies (gap:hecke-l-values-mod-p); PadicFamilies (gap:anticyclotomic-nonvanishing-mod-p).

### 2.4 Joint height-one coprimality of two semi-ordinary Fourier–Jacobi families

For the pair E_i of [§2.3](#23-the-semi-ordinary-klingen-eisenstein-family-on-gu31), let J⊂R[1/p] be the ideal generated by all β=1 Fourier–Jacobi functional values indexed by i and the permitted (g,u) of CLW addendum Thm 4.0.1. Then J is contained in no height-one prime of R[1/p]. This does not assert that either single family has a unit coefficient or that J is the unit ideal. The local expansions, triple-product identities and Rallis pairings are those of CLW §7; the addendum replaces the original auxiliary-unit choice.

Use precisely the two auxiliary data sets of addendum §3. Its first set makes L_5,L_6 units with L_1 nonzero; its second makes L_1,L_5 units with L_6 nonzero, while L_2 remains a fixed nonzero scalar. State and prove Ichino's triple product formula in the generality used, and apply it with the local triple product integrals of CLW Props 7.9.1–7.12.1: for a definite quaternion algebra D over ℚ (equivalently the definite unitary group U(2) used by CLW and FW) and three cuspidal automorphic representations π_1, π_2, π_3 of GL₂(𝔸_ℚ) with trivial product of central characters and Jacquet–Langlands transfers to D^×, write I for the product of the two global trilinear periods, d_i for each global Petersson pairing and d_(i,v) for its local counterpart. Let Σ be a finite set of places containing ∞ and every prime at which some φ_i or φ̃_i is not the prescribed unramified vector of local pairing 1. Let J_v = ∫_(ℚ_v^×\D^×(ℚ_v)) ∏_i ⟨π^D_(i,v)(g)φ_(i,v), φ̃_(i,v)⟩_v dg be the raw local matrix-coefficient integral, with no normalizing L-factor and without dividing by d_(i,v), and let ζ^Σ(2), L^Σ(1/2,Π,r) and L^Σ(1,Π,Ad) be the Euler products over the primes outside Σ (no archimedean factor). With compatible factorizable pairings, prove the identity with pairings cleared:

    I · ∏_(v∈Σ,i) d_(i,v) = (C/8) · ζ^Σ(2)² · L^Σ(1/2,Π,r)/L^Σ(1,Π,Ad) · (∏_i d_i) · ∏_(v∈Σ) J_v.

Here C is the Tamagawa constant of D^×. Every Euler factor on the right is at a prime outside Σ, and every place of Σ contributes its raw integral, so the identity does not depend on Σ: at an added unramified prime v the raw integral with pairings 1 is ζ_v(2)²L_v(1/2,Π_v,r)/L_v(1,Π_v,Ad), Ichino's normalized integral there being 1, and this is exactly the Euler factor that the partial product then omits. Equivalently, with Ichino's normalized integrals J_v^♮ = ζ_v(2)⁻²L_v(1,Π_v,Ad)/L_v(1/2,Π_v,r)·J_v at every v ∈ Σ, archimedean included and where those local factors are finite and nonzero, the partial ratio is replaced by the complete ratio ζ(2)²L(1/2,Π,r)/L(1,Π,Ad) whose factors at Σ are those local factors. Partial L-functions together with normalized local integrals mix the two conventions and give a false identity. This identity permits zero pairings. Only when every d_i and every d_(i,v) used as a denominator is nonzero state the normalized quotient I/(∏ d_i) = (C/8)·ζ^Σ(2)²·L^Σ(1/2,Π,r)/L^Σ(1,Π,Ad)·∏_(v∈Σ) (J_v/∏_i d_(i,v)) (Ichino2008 Theorem 1.1 with its normalization of the local integrals, cited by its locator; Ichino treats every number field and quaternion algebra). CLW (7.11.9), p. 72, uses this raw arrangement, with partial ζ and L-functions outside Σ ∪ {∞, p, ℓ, ℓ′}. For Wan's variant choose translates g′_i in the local group algebras such that each global pairing ⟨φ_i,π(g′_i)φ̃_i⟩ and every corresponding local pairing used in the quotient is nonzero; use those pairings consistently, or keep the identity with them cleared. Wan-2020 §8.4, p. 80, prints the complete ζ(2)², partial L-functions and normalized local integrals together; the raw arrangement above replaces that formula. Wan-2020 §8.4 treats archimedean weight-two discrete series; the weight-k application retains FW's raw archimedean integral 1/(k−1) of §2.12. The local integrals at split, nonsplit and supercuspidal places are those of CLW Props 7.9.1–7.12.1 and FW Prop. 7.27 and Cor. 7.28.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), §7: Prop. 7.4.2 p. 57, Prop. 7.6.1 p. 61, Prop. 7.7.1 p. 64, Prop. 7.9.1 p. 67, Props 7.11.1–7.11.3 pp. 68–73, Prop. 7.12.1 p. 73. The Fourier–Jacobi computation: Jacobi-group expansion, CM family, Rallis inner products, triple product integrals at nonsplit places. [Wan-2020](https://arxiv.org/pdf/1408.4044v5), introduction, steps (1)–(5), pp. 5–6. The five-step pattern: Fourier–Jacobi coefficient of the Siegel series, restriction, pairing with θ⋆ and h, interpolation, Ichino's formula. [CLW-addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), §3, pp. 2–3; Thm 4.0.1 and proof, pp. 4–5. The two auxiliary choices and joint height-one coprimality, proved using independent variable directions.

The proof proceeds as follows. The β-th Fourier–Jacobi coefficient of the Siegel Eisenstein series on GU(3,3) is a finite sum of products of Siegel Eisenstein series on U(2,2) and theta functions on the unitary Jacobi group (CLW Prop. 7.4.2; the Jacobi group and Fourier–Jacobi extraction are MetaplecticAutomorphicForms §§6.17, 6.19 and 6.20). Restrict to (N·U(2)) × U(2), pair with θ⋆ and then with h via the doubling formula; the result is a triple product integral ∫ h θ f (Props 7.6.1, 7.7.1). Apply addendum Thm 4.0.1: after its finite integral coefficient extension and power map, J contains, up to units, the nonzero factors L_(1,1) and L_(6,2) in independent rank-one directions. They have no common height-one prime. Descend this assertion along the finite integral extension; it gives height-one avoidance for J in R[1/p].

**Checks.**

- In the two-dimensional pairing model, ⟨e₁,e₂⟩ = 0, so the normalized quotient is undefined for those nonzero vectors; the identity with pairings cleared still applies. Translating e₂ to e₁ gives pairing 1, permitting that denominator. Nonzero vectors alone do not ensure a nonzero pairing.
- With three global pairings (1,0,1), their product is 0; with (1,2,1), it is 2. Even in the second case a local pairing 0 prohibits the normalized local quotient, so both global and local hypotheses are necessary.
- Rescaling one dual vector by 2 doubles I, its global d_i and the affected raw local J_v. The cleared identity scales equally on each side, and the permitted normalized quotient remains unchanged; rescaling a zero pairing still gives 0.
- Enlarging Σ by the prime 2, where each of the three representations is unramified with Satake parameters (i, −i) and the local pairings are 1: ζ_2(2) = 4/3, L_2(1/2,Π,r) = (1 + 1/2)^(−4) = 16/81 (its eight parameter products are four copies each of i and −i) and L_2(1,Π,Ad) = (8/9)³ = 512/729, so the raw integral is J_2 = (16/9)·(16/81)/(512/729) = 1/2. Omitting the factor at 2 from the partial product multiplies the right side by (9/16)·(81/16)·(512/729) = 2, and J_2 multiplies it by 1/2, so neither side changes. With the complete ζ(2)², partial L-functions and the normalized integral J_2^♮ = 1 the right side would change by (512/729)/(16/81) = 32/9, and with partial ζ and L but J_2^♮ = 1 by 2, while the left side stays fixed.
- For each P∤p choose one indexed family and functional whose value is not in P. This local choice, rather than a global unit from one family, is the input to the congruence proof.

*Needs:* §2.3; MetaplecticAutomorphicForms §§3.3, 6.12, 6.13, 6.17, 6.19 and 6.20; PadicFamilies (gap:hecke-l-values-mod-p); PadicFamilies (gap:anticyclotomic-nonvanishing-mod-p); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Whittaker realizations, unequal-rank and equal-rank integrals).

### 2.5 The CLW Eisenstein ideal is bounded by the p-adic L-functions

Let ϕ be as in CLW Prop. 7.11.2 and E_(π,ξ) ⊆ Ô^ur_L[[Γ_K]] the Eisenstein ideal ([§0.4](#04-the-eisenstein-ideal-of-an-eisenstein-family)) of the semi-ordinary cuspidal Hecke algebra 𝕋^0_(so,ξ,Γ_K) for the eigensystem of E^Kling_ϕ. For every height-one prime P of Ô^ur_L[[Γ_K]] with P ∩ Ô^ur_L = 0, ord_P(L^(Σ∪{ℓ,ℓ′})_(π,K,ξ)·L^(Σ∪{ℓ,ℓ′})_(ξ,ℚ)) ≤ ord_P(E_(π,ξ)) (CLW Thm 8.1.1).

Assume P not containing p (P ∩ Ô^ur_L = 0).

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), Thm 8.1.1 and proof, p. 77. The congruence between the semi-ordinary Klingen family and cusp forms, measured by L_(π,K,ξ)L_(ξ,ℚ). [CLW-addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), Thm 5.0.1, PDF p. 6. The repaired proof of CLW Thm 8.1.1, choosing an indexed family separately at each height-one prime.

The proof proceeds as follows. Fix P∤p and choose one of the two families with a Fourier–Jacobi functional value outside P (addendum Thm 5.0.1). Use the fundamental exact sequence to lift its boundary values divided by L_(π,K,ξ)L_(ξ,Q) modulo P^r. Subtract to obtain a cuspidal family modulo P^r; its chosen functional value is a P-unit, so the congruence class is nonzero. The eigensystem therefore yields E_(π,ξ)⊂P^r locally for r=ord_P(L·L); hence ord_P(E_(π,ξ))≥r. The original proof’s final ≤ sign on PDF p. 78 is reversed, while its theorem statement is correct.

**Checks.**

- At P with ord_P(L·L) = 2, an Eisenstein ideal of valuation 3 satisfies the bound and one of valuation 1 violates it.
- The prime (ϖ) meets Ô^ur_L in ϖ ≠ 0 and is excluded: an Eisenstein ideal (1) against an L-product of valuation 1 at (ϖ) is not contradicted by the theorem.

*Needs:* §§0.4, 2.2, 2.3 and 2.4.

### 2.6 Irreducibility of the GU(3,1) pseudo-character: excluding CAP components

Let 𝕋 be the semi-ordinary (or ordinary) cuspidal Hecke algebra of GU(3,1) localized at the Eisenstein maximal ideal, T: G_K → 𝕋 its four-dimensional pseudo-character (built as in [§1.8](#18-the-four-dimensional-pseudo-character-of-the-ordinary-gu22-hecke-algebra) from the Galois representations of cuspidal representations of U(3,1)), and suppose ρ̄_π|_(G_K) is irreducible. Then for every Frac(A)-algebra map λ: 𝕋 ⊗ Frac(A) → K′, the representation σ_λ is absolutely irreducible or contains an absolutely irreducible two-dimensional subrepresentation whose trace is ≡ χ + χ′ (with χ′=χ⁻ᶜ here because ν=1) modulo I — Wan20's property (9) (CLW proof of Thm 8.2.1). If instead T = δ_1 + δ_2 + δ_3 with δ_3 two-dimensional and residually tr ρ̄_π, then at an arithmetic point x of weight (0,0,t^+;t^-) with 0 ≫ t^+ ≫ −t^-, a twist of the specialization of δ_3 descends to a G_ℚ-representation ρ′_(3,x) which is modular (ordinary case: as in SU Thm 7.3.1; non-ordinary case: ρ_Π|_(G_(K,p)) is crystalline by a Jacquet-module argument and the semi-ordinary slopes, and Kisin's theorem applies; in general weight FW uses Pan's theorem), so Π is CAP, which Harris's Thm 2.5.6 excludes in these weights.

Assume ρ̄_π|_(G_K) irreducible; arithmetic points in the absolutely convergent range of sufficiently regular weight. The unitary forms and Hecke operators are the carriers of gap:unitary-ordinary-igusa; the semi-ordinary projector is that of §2.1. The CAP input is owned here: Harris's theorem (Harris1984 Theorem 2.5.6, cited by its locator) that a cuspidal holomorphic representation of U(3,1) of the sufficiently regular weights (0,0,t⁺;t⁻) with 0 ≫ t⁺ ≫ −t⁻ has no Hecke eigensystem of Klingen–Eisenstein type, in the weight range used by SU Theorem 7.3.1, p. 104, CLW's proof of Theorem 8.2.1, pp. 79–80, and FW's proof of Theorem 7.32, p. 97. It is used in addition to, and after, the GL₂ modularity of the two-dimensional constituent.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1, property (9), pp. 79–80. The CAP-exclusion argument in the ordinary case (SU Thm 7.3.1, p. 103, cited by CLW as [SU14, Theorem 7.5] in the journal numbering; Harris Thm 2.5.6) and the non-ordinary case (Jacquet modules, crystallinity, Kisin). [FW](https://arxiv.org/pdf/2107.13726v3), proof of Thm 7.32, p. 97. The same argument in general weight, with modularity from Pan's Thm 1.0.4.

The proof proceeds as follows. Suppose the pseudo-character is a sum δ_1 + δ_2 + δ_3; residual irreducibility of ρ̄_π gives a two-dimensional 𝕋-valued representation for δ_3. Ordinary π: the specialization of δ_3 at x is ordinary and modular by the SU argument. Non-ordinary π: Edixhoven makes ρ̄_π|_(G_(ℚ_p)) irreducible; Jacquet modules show Π_p is an unramified principal series (the semi-ordinary valuations (8.2.4)–(8.2.5) force distinct ratios ≠ p^(±1)), so ρ_Π|_(G_(K,p)) and ρ′_(3,x) are crystalline; ρ̄′_(3,x) is not induced from ℚ(√p*), so Kisin's modularity lifting applies (FW: Pan's Fontaine–Mazur theorem for de Rham ρ with ρ̄|_(G_(ℚ_p)) absolutely irreducible). Modularity of ρ′_(3,x) makes Π CAP (Klingen type), contradicting Harris Thm 2.5.6 for the chosen weights.

**Checks.**

- For eigenvalues 1, 2, 3, 4 the reciprocal polynomial is 1 − 10X + 35X² − 50X³ + 24X⁴, so minus its X coefficient is 10, the trace. Minus its cubic coefficient is 50. The monic characteristic polynomial is X⁴ − 10X³ + 35X² − 50X + 24; conversion preserves the trace 10.

- In both [§2.7](#27-the-castellaliuwan-divisibility-over-the-cyclotomic-localized-ring) and [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture) the modularity theorem for the two-dimensional constituent and holomorphic CAP exclusion must both be applied. Attaching its Galois representation alone is insufficient.

*Needs:* §1.8; AutomorphicGaloisRepresentationsPartII Layer AG2.2 (Galois assembly for discrete unitary transfer); AutomorphicGaloisRepresentationsPartII (gap:unitary-galois-imaginary-quadratic); AutomorphicGaloisRepresentationsPartII Layer AG2.6 (polarized admissibility at the coefficient prime); GL2ModularityLifting §§8.7, 8.8 and 10.5.

### 2.7 The Castella–Liu–Wan divisibility over the cyclotomic-localized ring

Let K be imaginary quadratic, p ≥ 3 split in K, and π, ξ as in CLW §5.2. Let Γ^+_K ⊂ Γ_K be the rank-one ℤ_p-submodule on which complex conjugation acts by +1 and R := O^ur_L[[Γ_K]] ⊗_(O_L[[Γ^+_K]]) Frac(O_L[[Γ^+_K]]), the localization inverting every nonzero element of the cyclotomic coefficient subring O_L[[Γ^+_K]]. Then, as fractional ideals of R, (L_(π,K,ξ)) ⊇ char_R(X^ur_(π,K,ξ) ⊗_(A) R), where X_(π,K,ξ) is the dual of the Selmer group of T_(π,K,ξ) = T_π(ε^2_(cyc))|_(G_K)(ξ⁻¹) ⊗ ℤ_p[[Γ_K]](Ψ⁻¹_K) with relaxed condition at p, unramified condition at p̄, and unramified conditions at every place away from p (CLW Thm 8.2.1(1)). The localization is in the cyclotomic subring; it is not the inversion of p. Here A=O_L^ur[[Γ_K]] and X^ur denotes extension to A first. The final tensor is over A; tensoring the A-module X again over the smaller cyclotomic subring would duplicate variables. This localization also inverts p, but inverts many additional elements.

Assume CLW §5.2; the excluded height-one primes are exactly those with P ∩ O_L[[Γ^+_K]] ≠ 0 (pulled back from the cyclotomic line) — in particular primes where (X_(ξ∘Nm) ⊗ ℚ)_P ≠ 0 may be among them. If X_(π,K,ξ) is not torsion its characteristic ideal is 0 and the statement is empty. The statement is one-sided and localized; neither torsion of X nor equality is proved here. Height-one primes pulled back from O_L[[Γ^+_K]] are not controlled: CLW cannot prove the analogue of Wan20 Lemma 9.3 with π fixed.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), Thm 8.2.1(1), p. 78; proof pp. 79–81. The divisibility over R and its proof by the lattice construction, with the explicit exclusion of cyclotomic height-one primes. [CLW](https://arxiv.org/pdf/2109.08375v1), (1.0.1)–(1.0.2), p. 3. The Selmer group with relaxed condition at p and unramified condition at p̄. [CLW-addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), Thm 5.0.2, PDF p. 6. The main theorem’s statements remain unchanged after the repair.

The proof proceeds as follows. Reduce to the Σ ∪ {ℓ,ℓ′}-primitive inclusion ([§0.2](#02-primitive-against-σ-primitive-selmer-groups-and-the-removed-euler-factors); JSW Thm 6.1.6 and Greenberg–Vatsal Prop. 2.4). For P with P ∩ O_L[[Γ^+_K]] = 0, the inequality ord_P(L) ≤ length(X_P) follows from ord_P(E_(π,ξ)) ≤ length(X_P) by [§2.5](#25-the-clw-eisenstein-ideal-is-bounded-by-the-p-adic-l-functions) (L_(ξ,ℚ) lives in the cyclotomic variable, hence is a unit at P). Set up the lattice datum (1)–(5) with ν trivial, χ = ξΨ_K, ρ from ρ_π, σ the pseudo-representation of the semi-ordinary Hecke algebra, J = E_(π,ξ)A_P the coefficient Eisenstein ideal and I ⊂ R its Hecke-side ideal in the completed localized Hecke algebra R, so that J = A ∩ I and A/J ≅ R/I as in §0.5 (CLW write I for E_(π,ξ)A_P); check (6)–(8) as in Wan20 and (9) by [§2.6](#26-irreducibility-of-the-gu31-pseudo-character-excluding-cap-components); apply [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups) (Wan20 Prop. 9.2) where ord_P(E_(π,ξ)) > 0 and (X_(ξ∘Nm) ⊗ ℚ)_P = 0.

**Checks.**

- In A = O[[X,Y]] with X the cyclotomic variable, localizing at O[[X]] ∖ {0} makes X and p units, so A/(X) and A/(p) become zero, while A/(Y) stays nonzero; a characteristic ideal (Y) survives in R and (X), (p) become (1). Inverting only p kills A/(p) but not A/(X), so the two localizations give different statements.

*Needs:* §§0.1, 0.2, 0.5, 0.7, 2.5 and 2.6; PadicMeasuresIwasawaAlgebras §4.6.

### 2.8 Integrality of the CLW p-adic L-function and the p-inverted divisibility

In the setting of [§2.7](#27-the-castellaliuwan-divisibility-over-the-cyclotomic-localized-ring): (a) if ξ_p ≢ ξ_p̄ modulo the maximal ideal of O_L, then L_(π,K,ξ) ∈ O^ur_L[[Γ_K]]; (b) if ξ_p ≢ ξ_p̄ and moreover ξ|_(𝔸_ℚ^×) = ω² (ω the Teichmüller character) with k_0 ≡ 0 mod 2(p − 1), the local base-change root number ε_v(1/2, BC(π) × ξ_0) equals 1 at every finite place v nonsplit in K, and the conductor of ξ is divisible only by primes split in K, then (L_(π,K,ξ)) ⊇ char_(O^ur_L[[Γ_K]] ⊗ ℚ)(X_(π,K,ξ) ⊗ ℚ) (CLW Thm 8.2.1(2)): the containment holds after inverting p, without the cyclotomic localization. It is not a nonordinary equality. Part (a) is integral for every p ≥ 3, p = 3 included, and at every tame conductor, as CLW state it. Its proof takes the integral CM comparison of [§0.9](#09-cm-theta-family-congruence-and-katz-normalization-for-the-clw-integrality-input) from whichever of cases (A), (B) and (D) applies. The inputs cited in CLW's proof, p. 81 (HT93, HT94, Hid06), give only (A) and (B), since Hid06 assumes p > 3 and a split prime-to-p conductor and HT94 Theorem 0.3 inverts φ(𝔫) and, in its trivial-zero case, 𝒱(T); the remaining cases, in particular p = 3 with 3 dividing φ(𝔫)·∏_(𝔩|c″)(1+N𝔩), use case (D), the comparison supplied by gap:cm-congruence-katz-integral. A rational identity does not replace it. Part (b) is after inverting p; it uses (a) only to place L_(π,K,ξ) in O^ur_L[[Γ_K]] ⊗ ℚ, and it keeps p = 3.

Assume (a) needs only residual distinctness ξ_p ≢ ξ_p̄, which gives (irred) and (dist) for the CM form σ_ξ; no further condition on p or on the tame conductor is imposed. (b) adds the four listed conditions to ξ_p ≢ ξ_p̄; the containment is only after ⊗ ℚ. Under the conductor condition of (b) every prime of the conductor of ξ splits in K, so the factor ∏_(𝔩|c″)(1+N𝔩) of §0.9 is empty.

The source is [CLW](https://arxiv.org/pdf/2109.08375v1), Thm 8.2.1(2), p. 78; proof of (2), p. 81. Integrality via L^Hida, Hida–Tilouine and Hida's anticyclotomic main conjecture, and the second containment from Hsieh's µ = 0. [Wan-2020](https://arxiv.org/pdf/1408.4044v5), Thm 1.1, pp. 2–3. Wan's three-variable theorem under conditions (a)–(g), with L^Hida integral when g_ξ satisfies (dist) and (irred). [CLW-addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), Thm 5.0.2, PDF p. 6. The integrality and main-divisibility statements survive the two-family correction.

The proof proceeds as follows. (a): as in Wan20 §7E, build L^Hida_(π,K,ξ) as the product of Hida's Rankin–Selberg p-adic L-function for the ordinary CM family g through σ_ξ and the newform f, and Katz's p-adic L-function on the line interpolating values at 1; only the ordinarity of g is used. Apply the CM congruence divisibility of [§0.9](#09-cm-theta-family-congruence-and-katz-normalization-for-the-clw-integrality-input) in the case at hand: CLW p. 81 invokes HT93 Thm 7.1 and (8.8b) and Hid91 Lemma 5.3(vi) for the Petersson-norm normalization, and HT93/HT94/Hid06 for the congruence ideal. Hida's Rankin–Selberg function has denominator H(g), so L^Hida is integral in cases (A), (B) and (D), which together cover every p ≥ 3 and every ξ with ξ_p ≢ ξ_p̄; case (C) alone gives only L^Hida ∈ O^ur_L[[Γ_K]] ⊗ ℚ. The application is confined to the stated CM-theta families. (b): by (a), L_(π,K,ξ) ∈ O^ur_L[[Γ_K]]; Hsieh's vanishing of the anticyclotomic µ-invariant (Hsieh2014 Theorem B, through gap:anticyclotomic-rankin-selberg) shows L_(π,K,ξ) lies in no height-one prime pulled back from O_L[[Γ^+_K]] other than possibly (p), so combining with [§2.7](#27-the-castellaliuwan-divisibility-over-the-cyclotomic-localized-ring) the excluded primes contribute nothing after inverting p.

**Checks.**

- The µ=0 comparison uses Hsieh2014 Theorem B (gap:anticyclotomic-rankin-selberg); the integral coefficient statement also needs the CM congruence divisibility of §0.9. Vanishing µ alone does not prove the latter.
- At p = 3 with a tame conductor 𝔫 = 7, φ(7) = 6 and v₃(6) = 1, so neither case (A) nor case (B) applies: the integral assertion (a) then rests on case (D) of §0.9, and it is not weakened to its ⊗ℚ form; (b) holds as well. At p = 3 with 𝔫 = 5, φ(5) = 4 and v₃(4) = 0, so case (B) proves (a) when its other conditions hold.
- Over O^ur_L[[Γ_K]] at p = 3, the elements u/3 and u, u a unit, generate the same ideal after inverting 3, but only u is integral. A Rankin–Selberg value u/3 against the denominator H(g) = 3 gives an integral L^Hida exactly when 3 divides h_K·L^Katz_ξ, which is what case (D) supplies; the rational case (C) cannot distinguish the two.
- Case (A) at p = 3 is never available, since Hid06 assumes p > 3; a statement deriving p = 3 integrality from Hid06 alone is rejected.

*Needs:* §§0.9 and 2.7; AutomorphicPadicLFunctionsPartII §8.5; AutomorphicPadicLFunctionsPartII (gap:katz-cm-padic-l); PadicFamilies (gap:anticyclotomic-rankin-selberg); PadicFamilies (gap:hida-rankin-selberg-cm); PadicFamilies (gap:cm-congruence-katz-integral).

### 2.9 Semi-ordinary Hida theory on GU(3,1) in general weight

For f a normalized cuspidal eigenform of even weight k ≥ 2 and the vector-valued semi-ordinary forms on GU(3,1) of weight k = (a_1, a_2, a_3; b_1) in the family set X_ρ of Fouquet–Wan: the semi-ordinary parts e_α·V_k(K_0(p,p^n)) are p-divisible with uniformly bounded classical dimensions (Props 7.9–7.10); for each weight k = (a_1, a_2, a_3; b_1) ∈ X_ρ there is A(a) such that, for b_1 large compared with A(a), the restriction e_α M_k(K_0(p), O) ⊗ ℚ_p/ℤ_p → e_α·V_k(K_0(p)) is an isomorphism (FW Thm 7.11); for q = 0 or ∅ the Λ̃-adic families V^q_so are free of finite rank and M^q_so(K, Λ̃) ⊗ Λ̃/P_k ≅ e_α M^q_k(K, O) at such weights (Thm 7.12), with Thm 7.15 and the weight-k boundary sequence of Thm 7.17; and the short sequence of cusp forms, forms and boundary forms is exact (Thm 7.18). These extend [§2.2](#22-semi-ordinary-hida-theory-and-the-fundamental-exact-sequence) (CLW, weight two) to general weight and are the only new Hida-theoretic input of the general-weight part of this layer.

Assume weights in FW's set X_ρ; level K_0(p, p^n); the unitary Shimura data and Igusa varieties as in FW §7.3.1–7.3.3, with the carriers of PELModuli §§M5.5–M5.6 and gap:unitary-ordinary-igusa. Fix ρ=(a_1,a_2). The full torus algebra has four variables; the fixed-ρ family varies (a_3,b_1). Thm 7.11 requires b_1>A(a,n); Thm 7.12 identifies classical specializations only in its sufficiently regular range. Prop. 7.13 additionally assumes ρ̄_f|G_Qp irreducible, a_1=a_2=0, a_3≡b_1≡0 mod p−1, and a_2−a_3 and a_3+b_1 sufficiently large; its conclusion gives the required unramified principal-series points. At the weight-two scalar specialization the control map is the semi-ordinary control map of §2.2. Varying the other highest-weight coordinates requires the vector-valued control and its separate regularity bound.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), §7.3.4–7.3.5: Props 7.5, 7.7–7.10, Thms 7.11, 7.12, Prop. 7.13, Thms 7.15, 7.17, 7.18, pp. 83–88. Semi-ordinary forms and control theorems on GU(3,1) for general weight. [FW](https://arxiv.org/pdf/2107.13726v3), §7.1, p. 80. The Hida theory of CLW §§2–4 (with its fundamental exact sequence) is the input; §7.3 develops what is needed in general weight.

The proof proceeds as follows. Vertical control for the vector-valued sheaves (FW Props 7.5, 7.7–7.10) following CLW §§3–4. Uniform boundedness of dimensions and classicality (Thm 7.11, Prop. 7.13). Freeness and the boundary exact sequence (Thms 7.12, 7.15, 7.17, 7.18), with the Siegel operators of §2.2.

**Checks.**

- The U(2)-factor of the coefficient representation of highest weight (a_1, a_2) has rank a_1 − a_2 + 1, which is k − 1 for the weights of §2.10: rank 1 at k = 2 and rank 3 at k = 4. The weight-two scalar control isomorphism cannot identify the rank-3 coefficient modules of weight 4.

*Needs:* §§2.1 and 2.2; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); PadicFamilies §0a.15.

### 2.10 The vector-valued Klingen Eisenstein family and the Greenberg p-adic L-function

Let p≥3 split in the imaginary quadratic field K, let k ≥ 2 be even, and let π = π_f be the unitary automorphic representation of a weight-k form f, and let Σ be a finite set containing the bad primes. (i) There is L^Σ_(f,K,ξ_0) ∈ Λ_(K,O^ur) ⊗ ℚ_p interpolating, at characters ξ_φ of Γ_K that are avatars of Hecke characters of conductor p and infinity type (κ_φ/2 + m_φ, −κ_φ/2 − m_φ) with κ_φ ≥ 6 even and m_φ ≥ (k−2)/2, the values L^Σ(π̃, ξ_φ, (κ_φ − 1)/2) times the stated periods and local factors (FW Prop. 7.19(i), from Eischen–Wan Thm 1.2); (ii) there is a family of formal q-expansions E_(f,ξ_0) whose specializations at a Zariski-dense set of arithmetic points are the Fourier–Jacobi expansions of the highest weight vectors of the holomorphic vector-valued Klingen Eisenstein series on GU(3,1) built by the pullback formula, eigen for U_(t+) with nonzero eigenvalue (Prop. 7.19(ii)); (iii) the constant terms a_(t,[g])(0) are divisible by L^Σ_(f,K,ξ_0)·L^Σ_(τ̄′) (Prop. 7.19(iii)). After the reparametrization t⁻ᶜ_(ξ′_0), L^(Gr,Σ)_(f,K) := t⁻ᶜ_(ξ′_0)(L_(f,K,ξ_0)) is the rational Greenberg Rankin–Selberg p-adic L-function; its factorization and its integrality are proved in [§2.11](#211-factorization-of-the-greenberg-function-into-hida-and-katz-factors). The multiplier in Prop. 7.19(i) is Ω_p^(4m+2κ)/Ω_∞^(4m+2κ) · c′_φ · p^(κ−3) · g(ξ_(φ,2))² · ∏_(i=1)²(χ_i⁻¹ξ_(φ,2)⁻¹)(p), where Lemma 7.20 gives c′_φ=Γ(κ+m−k/2)Γ(κ+m+k/2−1)2^(−3κ−4m+1)π^(1−2κ−2m)i^(k−κ−2m−1). The highest weight is (m+(k−2)/2,m−(k−2)/2,0;κ); after reparametrization it is ((k−2)/2,−(k−2)/2,−m;κ+m).

Fix ξ_0 of infinity type (κ_0/2,−κ_0/2), with κ_0 divisible by 2(p−1), such that the p-adic avatar of ξ′_0 = ξ_0·(ε⁻¹∘Nm) factors through Γ_K (FW §7.4.1, p. 88). FW's remark after Prop. 7.19 removes the distinct-Satake-parameter assumption in this U(2) case. The p-adic Klingen family of FW Prop. 7.19, which restates EW16 Theorem 1.2 in the semi-ordinary setting, is constructed here from the Siegel Eisenstein series on GU(3,3) and its pullback, with the complex doubling identities of MetaplecticAutomorphicForms §§6.2, 6.10a and 6.11; FW's reparametrization and the Ikeda-type archimedean factorization are owned here.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Prop. 7.19 and the reparametrization after it, p. 88. The Klingen family on U(3,1) and its constant terms divisible by the Rankin–Selberg and Dirichlet p-adic L-functions. [FW](https://arxiv.org/pdf/2107.13726v3), Lemma 7.20 and Cor. 7.21, PDF p. 89. The gamma, power-of-two, π and i factors and the change of highest weight.

The proof proceeds as follows. Translate Eischen–Wan Thm 1.2 to the semi-ordinary GU(3,1) setting with the shared local data of [§2.3](#23-the-semi-ordinary-klingen-eisenstein-family-on-gu31) (FW Prop. 7.19). Reparametrize by t⁻ᶜ_(ξ′_0) (γ′ ↦ γ′ξ′_0(γ′)⁻¹, then γ′ ↦ γ′⁻ᶜ).

**API.**

- The rational L-function has the exact interpolation values, periods, gamma factors and local factors displayed above at every specified arithmetic character.
- The family is a collection of coefficient functions at the specified p-adic cusps with values in the Fourier–Jacobi coefficient modules of Prop. 7.19(ii), specializing densely to the highest weight Klingen vectors. Its constant terms belong to the product ideal of (iii) in that rational coefficient module; integrality of L^Gr alone asserts no integral lattice for the entire Klingen family.
- The character automorphism t⁻ᶜ_(ξ′_0) acts on group-like elements by γ ↦ ξ′_0(γ)⁻¹·γ⁻ᶜ; equivalently it is the composition of scalar character translation and inverse conjugation described above. Evaluation composes with that automorphism, and the highest weight becomes ((k−2)/2,−(k−2)/2,−m;κ+m).

**Checks.**

- For (k,m) = (2,0), the reparametrized highest weight is (0,0,0;κ); for (4,1) it is (1,−1,−1;κ+1). At (4,0), m < (k−2)/2 = 1, so this point is outside the stated interpolation range.
- At (k,m,κ) = (2,0,6), both gamma arguments are 5 and 6, giving Γ(5)Γ(6) = 24·120 = 2880, the power of 2 is 2⁻¹⁷, and i^(k−κ−2m−1) = i⁻⁵ = −i. The archimedean multiplier is −2880i·2⁻¹⁷π⁻¹¹, so dropping the weight-dependent factors changes interpolation.
- For a group generator γ with ξ′_0(γ) = a and a character φ with φ(γ⁻ᶜ) = b, evaluation after translation then inverse conjugation is a⁻¹b. Treating inversion as also inverting the scalar would incorrectly give ab. At p = 3 take a = 4 and b = 7, both in 1 + 3ℤ₃. The two values are 7/4 and 28; the denominator 4 is a 3-adic unit.

*Needs:* §§2.3 and 2.9; MetaplecticAutomorphicForms §6.10a.

### 2.11 Factorization of the Greenberg function into Hida and Katz factors

With the normalizations of FW §4.5.2 and Appendix B, the Greenberg Rankin–Selberg p-adic L-function of f over K factors as L^Gr_K(f) = L^Hida_(f⊗g)·L^Katz_K·h_K, where L^Hida_(f⊗g) is Hida's Rankin–Selberg p-adic L-function of f against the canonical CM Hida family g, L^Katz_K is Katz's p-adic L-function of K restricted to the relevant line and h_K the class number factor (FW Cor. 7.21, with Prop. 4.35 for the Katz normalization). The factorization is an identity in Frac(O^ur[[Γ_K]]) obtained by comparing interpolation formulas on a Zariski-dense set; it carries the class-number, period and local factors explicitly and does not pass through Layer 6. Consequently L^Gr_K(f), the function of [§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function) with the primitive Euler factors restored, lies in O^ur[[Γ_K]] (FW Lemma 7.22, p. 89).

Assume the interpolation formulas of FW Prop. 7.19 and Prop. 4.35 on both sides; the set of comparison points is Zariski dense.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Cor. 7.21 and the lemma before it, p. 89; Prop. 4.35, p. 57. L^Hida_(f⊗g)·L^Katz_K h_K = L^Gr_K(f), from the interpolation formulas. [FW](https://arxiv.org/pdf/2107.13726v3), Lemma 7.22, p. 89. Integrality of the Greenberg function.

The proof proceeds as follows. Compare interpolation formulas at the arithmetic points of Prop. 7.19 using the doubling interpolation on one side and Hida's Rankin–Selberg plus Katz's interpolation on the other (FW Lemma before Cor. 7.21). Density of the comparison points and the Weierstrass preparation in O^ur[[Γ_K]] give the identity. For integrality apply FW Lemma 7.22 with its two independent denominator bounds, one supported at p and the explicit Euler factors (from the Hida factor) and one in the CM-family variable (from the Katz factor), and prove that these supports are disjoint using that lemma; a nonzero rational scalar alone does not prove integrality.

**API.**

- The Greenberg function factors as the Hida function times the Katz function times h_K; its two denominator bounds have disjoint height-one supports, giving the integral carrier O^ur[[Γ_K]] (FW Lemma 7.22).

**Checks.**

- The factor h_K is present: for K = ℚ(√−23) with h_K = 3 and p = 3 split in K, omitting it changes the integral ideal by one power of 3 at the prime (3) but not after inverting p, so an identity checked only rationally cannot detect it.
- In A = ℤ_p⟦Y,Z⟧ the height-one primes (p) and (Y) are distinct. The rational element 1/p has valuation −1 at (p) and fails the bound allowing denominators only at (Y); 1/Y has valuation −1 at (Y) and fails a bound supported on p and Euler factors prime to Y. A common Euler factor Y would destroy disjointness and is explicitly excluded by the Lemma 7.22 input.
- At k = 2 the identity specializes to the CLW normalization L^Hida_(π,K,ξ) of §2.8, the product of Hida's Rankin–Selberg function and h_K·L^Katz.

*Needs:* §2.10; AutomorphicPadicLFunctionsPartII §8.5; AutomorphicPadicLFunctionsPartII (gap:katz-cm-padic-l); PadicFamilies (gap:hida-rankin-selberg-cm).

### 2.12 General-weight Fourier–Jacobi values: the two-family theorem

Let f be a normalized cuspidal eigenform of even weight k ≥ 2, trivial character and conductor N prime to p, and K imaginary quadratic with p split, as in [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture); let R = O^ur[[Γ_K]] and let 𝔈_D be the Eisenstein ideal of [§0.4](#04-the-eisenstein-ideal-of-an-eisenstein-family) for the semi-ordinary Klingen eigensystem of [§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function). Prove that there are two auxiliary data sets (c_(v,i), χ_(θ,i), χ_(h,i)), i = 1, 2, each satisfying the conditions (1)–(5) of CLW §5.6 in weight k, and two vector-valued semi-ordinary Klingen Eisenstein families E_1, E_2 of [§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function) with the same Hecke eigensystem, such that the ideal of R ⊗ ℚ generated by all β = 1 Fourier–Jacobi values FJ^(h_i)_(β,θ_i⋆)(E_i)(g, u), over i and the permitted (g, u), lies in no height-one prime of R ⊗ ℚ. Consequently, for every height-one prime P ≠ (p) of R, ord_P(L^(Gr,Σ)_(f,K)) ≤ ord_P(𝔈_D) (FW Lemma 7.31), with i chosen separately at each P.

Assume the hypotheses of FW Thm 7.32 and the local data of FW §7.4; the vector-valued computation is FW's addition over the scalar case of [§2.4](#24-joint-height-one-coprimality-of-two-semi-ordinary-fourierjacobi-families). This replaces FW Prop. 7.29, whose proof makes L_1, L_5, L_6 simultaneously units by the cofinite nonvanishing theorems of Hsieh; those theorems rest on a nonvanishing input whose proof has a gap, and the available replacements give only infinitely many good characters (CLW addendum §1, Theorems 1.0.1–1.0.2). The two-family statement is the published repair in weight two (CLW addendum Theorem 4.0.1). In weight k it is not stated in the literature; it is a target of this roadmap, with the proof below, which uses no input beyond the cited ones.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), §7.4.2, Props 7.27, Cor. 7.28, Prop. 7.29, Def. 7.30, Lemma 7.31, pp. 90–96, for the Fourier–Jacobi computation, the triple-product evaluation (7.4.4)–(7.4.5) and the Eisenstein-ideal bound; p. 95 for the vector-valued archimedean triple-product integral, which equals the fixed constant 1/(k−1) by Schur orthogonality because the pairing of an L_(k−2)-valued form with an L_(k−2)^∨-valued one is (k−1) times any single coordinate integral. [CLW-addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf), §1, Theorems 1.0.1–1.0.2, p. 1, for the weakened nonvanishing, stated for characters of infinity type (k+m, −m) and for forms of any weight t; §3, pp. 2–3, for the two auxiliary data sets; Theorem 4.0.1 and its proof, (4.0.2)–(4.0.5), pp. 4–5, and Theorem 5.0.1, p. 6, for the weight-two argument. [FW](https://arxiv.org/pdf/2107.13726v3), §1.2.1, p. 11, for the role of Ikeda's theory and Ichino's formula.

Prove Ikeda's dense-image theorem in the following form: for β ∈ ℚ^×, the additive character ψ_β and the fixed splitting character λ, in Ikeda's §2, case 2, with m = 1 and n = 2, the β-th Fourier–Jacobi coefficients of a Siegel Eisenstein series on U(3,3) generate a representation π of the Jacobi group N′U(2,2), and the map ω_ψ ⊗ I → π, from the Weil representation tensored with the space I of Ikeda's integrals, has dense image; I lies in the space of Siegel Eisenstein series on U(2,2) with the fixed character (Ikeda1994 Proposition 1.3, Lemma 1.1 and Theorem 3.2, cited by their locators as in FW §7.4.2, pp. 92–93; the theta pairing is Ikeda1994 p. 620 and the integral comparison p. 628). For a nearly holomorphic Siegel Eisenstein series, FW's lowest-weight argument then gives surjectivity on K-finite vectors, (7.4.2), and the finite sum of Lemma 7.26: π, ω_ψ and I are lowest-weight (g, K)-modules, the U(1)(ℝ)-weights in a lowest-weight module generated by one vector increase with finite-dimensional eigenspaces, the induced representation is of finite length, and so only finitely many pairs of K-types contribute to a fixed K-type of π.

The proof proceeds as follows.

- Fix ℓ split and ℓ′ inert in K, with π_ℓ, π_ℓ′ unramified, and base data χ_(θ,0), χ_(h,0) satisfying CLW §5.6 (1)–(5) in weight k. By the addendum's Theorems 1.0.1–1.0.2 (through gap:hecke-l-values-mod-p and gap:anticyclotomic-nonvanishing-mod-p), which allow forms of any weight, there are infinitely many η_1, η_2, η_3 in the ℓ-power anticyclotomic characters making the three normalized weight-k L-values of addendum (3.0.1) p-adic units, and by Hung's theorem (Hung2017, through gap:anticyclotomic-nonvanishing-mod-p) all but finitely many make (3.0.2) a unit and (3.0.3) nonzero; choose them, then ν_i, μ_i with ν_1μ_1^c = ν_2μ_2^c = η_1, ν_1μ_1 = η_2, ν_2μ_2 = η_3, and put χ_(θ,i) = ν_iχ_(θ,0), χ_(h,i) = μ_iχ_(h,0).
- Build E_1, E_2 from the two data sets by [§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function). Their constant terms are bounded by L^(Gr,Σ)_(f,K)L^Σ_(τ̄′) for both i, since the boundary does not depend on the auxiliary characters.
- For each i, Ikeda's dense-image theorem above, FW (7.4.4)–(7.4.5) and Ichino's formula of §2.4 express the Fourier–Jacobi value, up to a unit of R ⊗ ℚ, as C_i·L_(1,i)L_(2,i)L_(5,i)L_(6,i) times a fixed nonzero pairing, with C_i ∈ Q̄_p^× and the raw archimedean local integral J_∞ of §2.4, divided by its pairing, equal to 1/(k−1). The vector-valued structure enters only through constants independent of the Iwasawa variables.
- By the choices, L_(2,i) is a nonzero constant, data set 1 makes L_(5,1), L_(6,1) units and data set 2 makes L_(1,2), L_(5,2) units, as in addendum (4.0.3). The remaining factors satisfy addendum (4.0.2): after the N-th power map P_N, L_(1,1) lies in the anticyclotomic one-variable subring and L_(6,2) in the cyclotomic one, read off from their interpolation formulas. L_(1,1) ≠ 0 because the anticyclotomic μ-invariant of Hsieh's function is finite (addendum p. 5, from Hsieh's proof of Theorem B), and L_(6,2) ≠ 0 because it interpolates nonzero Hecke L-values in the range of absolute convergence.
- Hence P_N of the joint ideal contains (L_(1,1), L_(6,2)). Two nonzero elements of the two independent one-variable subrings lie in no common height-one prime, and P_N is an integral extension, so the joint ideal lies in no height-one prime of R ⊗ ℚ. At a height-one P ≠ (p) choose i with the value outside P, and run FW's proof of Lemma 7.31 with that family, exactly as addendum Theorem 5.0.1 does in weight two.

The API below records the three steps of the general-weight argument, each for every admissible even k, including k = 2.

**API.**

- For each fixed k and auxiliary datum there is the K-finite functional of FW (7.4.2)–(7.4.3), built from a basis φ_(4,i,∞) contributing to the surjection on the K-type of ω_ψ and its dual basis φ_(2,i,∞) for the pairing of Ikeda p. 620, compatible with the pullback, local sections and triple-product pairing. These archimedean Schwartz functions depend only on k, and the raw archimedean triple-product integral J_∞ of §2.4, divided by its pairing, is the constant 1/(k−1). At k = 2 it is the scalar functional of [§2.4](#24-joint-height-one-coprimality-of-two-semi-ordinary-fourierjacobi-families). The weight k of f is fixed along the family, so no specialization in k is involved.
- The two data sets and families of the first two steps have the same unramified and U_p eigenvalues and boundary divisor L^(Gr,Σ)_(f,K)L^Σ_(τ̄′), and their functional values ν_1, ν_2 ∈ R[1/p] satisfy the two product identities of the third step, with the comparison scalars, local Euler factors and the two remaining nonunit factors L_(1,1), L_(6,2).
- For those values, every height-one prime P of R[1/p] omits ν_1 or ν_2; equivalently no such P contains (ν_1, ν_2). The proof uses the independent variable directions of L_(1,1) and L_(6,2) and their nonvanishing; nonvanishing of ν_1 and ν_2 alone is insufficient.

The triple-product application uses §2.4 with all global and local denominators nonzero for the chosen translated pairings, or its identity with pairings cleared. For orthogonal vectors the pairing is 0 and only the latter formula applies; translating to a unit pairing of value 1 permits normalization. For k = 2 and k = 4 these raw archimedean integrals are 1 and 1/3, respectively; the archimedean place lies in Σ, so no archimedean L-factor enters the partial product of §2.4.

**Checks.**

- In B=Q_p[[X,Y]], the values X and Y are each nonunits, but no height-one prime contains both: the joint ideal (X,Y) has height two. Thus joint height-one avoidance does not assert a unit value or the unit ideal.
- Values X and X² are nonzero and share the height-one prime (X), so nonvanishing of both values does not establish the required avoidance. A construction leaving the same variable direction twice fails.
- Specializing Y to 0 sends the first pair to X,0 and loses avoidance at (X). Hence a scalar or arithmetic specialization alone cannot prove the comparison of families before specialization.
- A map with dense image into an infinite-dimensional smooth completion need not express every vector as a finite tensor sum. The finite K-type and lowest-weight hypotheses are essential to the passage used in Lemma 7.26; β=0 is outside that nontrivial-character Jacobi argument.
- Archimedean constant: for k = 2 the coefficient representation is one-dimensional and 1/(k−1) = 1, recovering the scalar computation; for k = 4 it is 1/3, a nonzero constant, so it changes no ideal of R ⊗ ℚ. A factor depending on the Iwasawa variables in its place would break the argument.
- A single data set with only two of L_1, L_5, L_6 units leaves one nonunit factor; if it is L_(1,1), every height-one prime containing L_(1,1) is missed by the bound. The second data set, whose nonunit factor L_(6,2) lies in the other variable, is what covers those primes.

*Needs:* §§0.4, 2.4, 2.9 and 2.10; MetaplecticAutomorphicForms §§6.13, 6.17, 6.19 and 6.20; AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Whittaker realizations, unequal-rank and equal-rank integrals); PadicFamilies (gap:hecke-l-values-mod-p); PadicFamilies (gap:anticyclotomic-nonvanishing-mod-p).

### 2.13 Removing the excluded height-one primes

Let L ∈ O^ur[[Γ_K]] be L^Gr_K(f) (or Wan's L_(f,K,ξ)). If the anticyclotomic restriction of L has vanishing µ-invariant — which holds when every prime ℓ | N nonsplit in K is ramified in K with π_ℓ the appropriately twisted Steinberg representation and the residual and conductor hypotheses of Hsieh's Theorem B are met — then L lies in no height-one prime of O^ur[[Γ_K]] of the form Q·O^ur[[Γ_K]] with Q a height-one prime of O[[Γ^+]]; hence it is prime to the cyclotomic Dirichlet factor L^Σ_(τ̄′) of the constant terms, and a divisibility proved up to those pulled-back primes extends over them (any independent p-power ambiguity must also be removed). For a Hida family, Wan20 Lemma 9.3 gives the same conclusion; for a single form outside the µ = 0 range the exceptional primes remain excluded.

Assume the hypotheses of Hsieh2014 Theorem B (gap:anticyclotomic-rankin-selberg) for the anticyclotomic specialization; the auxiliary-field choice of [§2.18](#218-choosing-the-auxiliary-imaginary-quadratic-field-for-the-fouquetwan-route) must preserve them (no nonsplit-prime or minimality condition dropped). The CLW addendum weakens the auxiliary ℓ-tower nonvanishing used for Fourier–Jacobi choices, not Hsieh’s p-tower µ=0 theorem. Do not replace one by the other.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), proof of Thm 7.32, last paragraph, p. 97. The Steinberg-twist assumption lets Fouquet–Wan apply the vanishing of the anticyclotomic µ-invariant, so L is in no height-one prime of O[[Γ^+]]. [CLW](https://arxiv.org/pdf/2109.08375v1), proof of Thm 8.2.1(1), p. 81. In Wan20 such primes need not be excluded thanks to Lemma 9.3 and Hsieh; with π fixed CLW cannot prove the analogue.

The proof proceeds as follows. Write L = Σ a_i (γ^- − 1)^i with a_i ∈ O^ur[[Γ^+]]; L ∈ Q·O^ur[[Γ_K]] iff every a_i ∈ Q. Specialize at the trivial character of Γ^+ (or at a weight point): the anticyclotomic function has µ = 0, so some a_i is a unit there, so not all a_i lie in Q (the argument of SU Prop. 12.3.6, with Hsieh in place of Vatsal). The Dirichlet factor lives in the cyclotomic variable, so it is a product of pulled-back primes and is coprime to L.

**Checks.**

- In O[[X,Y]] with X cyclotomic and Y anticyclotomic, L = X + Y restricts at X = 0 to Y, with μ = 0, and lies in no prime Q·O[[X,Y]] with Q ⊂ O[[X]] of height one, since its Y-coefficient is 1. L = X − p restricts to −p, with μ = 1, and lies in the pulled-back prime (X − p), so no extension over that prime is claimed.

*Needs:* §§2.10 and 2.11; PadicFamilies (gap:anticyclotomic-rankin-selberg).

### 2.14 Fouquet–Wan's GU(3,1) divisibility for the Greenberg main conjecture

Let p≥3, let K be imaginary quadratic with p split, and let f be a normalized cuspidal eigenform of even weight k, trivial character and conductor N prime to p, such that either ρ̄_f|_(G_(ℚ_p)) is absolutely irreducible or f is ordinary at p; suppose every prime q | N nonsplit in K satisfies q ∥ N and there is at least one such q, that 2 ∥ N if 2 is nonsplit in K, and that ρ̄_f is absolutely irreducible over G_K. Then char_(O^ur[[Γ_K]])(X^Gr_K(f) ⊗_O O^ur) ⊆ (L^Gr_K(f)) up to height-one primes pulled back from O[[Γ^+]]; if moreover every ℓ | N nonsplit in K is ramified in K with π_ℓ the Steinberg representation twisted by the unramified character sending ℓ to −ℓ^(k/2−1), the whole containment holds (FW Thm 7.32 = Thm 4.41 = Thm 1.12). Here X^Gr_K(f) is the dual of the Greenberg Rankin–Selberg Selmer group (FW Def. 4.39: Greenberg condition at v_0, strict at v̄_0, unramified-quotient conditions away from p). At every retained height-one prime the asserted direction is ord(L)≤length(X). In weight two its semi-ordinary specialization agrees with the control of §2.2 and the lattice construction of §0.7.

Retain the stated hypotheses; ρ_f|_(G_(ℚ_p)) crystalline in Thm 4.41's form. The first containment excludes height-one primes pulled back from O[[Γ^+]]; the second needs the Steinberg-twist hypothesis to invoke the anticyclotomic µ = 0 theorem. This is the source theorem target. Its Fourier–Jacobi step is the two-family theorem of [§2.12](#212-general-weight-fourierjacobi-values-the-two-family-theorem), for the families of [§2.10](#210-the-vector-valued-klingen-eisenstein-family-and-the-greenberg-p-adic-l-function); FW's printed simultaneous-unit choice is not used.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Thm 7.32 and proof, pp. 96–97; Thm 4.41 and Def. 4.39, pp. 58–59; Thm 1.12, pp. 10–11. The GU(3,1) divisibility with and without the Steinberg-twist hypothesis, and its proof by the lattice construction, CAP exclusion, Euler factors and µ = 0.

The proof proceeds as follows. Σ-primitive version first: lattice construction (Wan20 Prop. 9.2; [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups)) shows that 𝔈_D contains the characteristic ideal of the dual Selmer group, with Wan20's condition (9) by [§2.6](#26-irreducibility-of-the-gu31-pseudo-character-excluding-cap-components) (modularity from Pan's theorem in general weight). Lemma 7.31 ([§2.12](#212-general-weight-fourierjacobi-values-the-two-family-theorem)) bounds ord_P(L^(Gr,Σ)) ≤ ord_P(𝔈_D) for P ≠ (p). Put back the Euler factors at Σ (Greenberg–Vatsal Prop. 2.4; K_∞ contains the cyclotomic ℤ_p-extension; [§0.2](#02-primitive-against-σ-primitive-selmer-groups-and-the-removed-euler-factors)). Under the Steinberg hypothesis apply Hsieh's anticyclotomic µ = 0 to see that L^Gr_K(f) lies in no height-one prime of O[[Γ^+]], hence is prime to the Dirichlet factor in the constant terms ([§2.13](#213-removing-the-excluded-height-one-primes)).

**Checks.**

- At a retained height-one prime, L of valuation 2 and X of length 3 satisfy ord(L) ≤ length(X); length 1 violates it.
- In O[[X,Y]] with X the cyclotomic variable, L = X − p lies in the pulled-back prime (X − p); the first containment makes no claim at that prime, and only the Steinberg-twist containment covers it.

*Needs:* §§0.2, 0.7, 1.8, 2.6, 2.7, 2.12 and 2.13; SelmerIwasawaCohomology §2.8.

### 2.15 Λ-adic Beilinson–Flach classes for a Hida family and the CM family

Let 𝐟 be a Hida family with coefficient ring 𝕀 and g the canonical CM Hida family of K (with T_g ≅ Ind^ℚ_K ℤ_p[[Γ_p]]). The Kings–Loeffler–Zerbes Beilinson–Flach class BF_(𝐟,g) ∈ H¹(ℚ, T_𝐟 ⊗̂ T_g ⊗̂ Λ_Γ), obtained from Rankin–Eisenstein classes on products of modular curves (diagonal pushforward of Eisenstein classes, Siegel units) with tame and p-power norm relations, defines through Shapiro's lemma a class BF ∈ H¹(K, T) and, after the twist tw_(Θ⁻¹), a class BF† ∈ Sel^(Gr,∅)(K, T†) (Greenberg condition at one prime above p, relaxed at the other) over 𝕀[[Γ_K]] in the integral normalization asserted by CW Theorem 3.6. The c-smoothed class is KLZ17 Definition 8.1.1 with m=1; its local membership is Proposition 8.1.7. Removing c requires the denominator comparison specified next. Specializations at weight-k points give the classes used in FW §4.4 and §4.8. For a fixed elliptic newform g the same construction gives BF_α ∈ H¹_(F_ord,rel)(K, T_g(α) ⊗̂ Λ_K) without a Hida family through g (the fixed-form form below).

Assume, for the statements taken from CW (the CW form): p > 3 (and p ≥ 5, the standing assumption of KLZ17 from §7.2, p. 35, on); 𝕀 regular and finite flat over O_L[[T]]; 𝐟 an ordinary Hida family of tame level N prime to p with trivial tame character (needed for the critical character Θ of CW (2.2), p. 8); ρ̄_𝐟 irreducible with ε̄ ≠ δ̄ on D_p, so that T_𝐟 and F^±T_𝐟 are free (CW p. 12); K imaginary quadratic with p split and discriminant prime to Np (CW p. 2). The Fouquet–Wan route of §§2.18 and 2.21 needs the same class, the reciprocity law of §2.16 and the equivalence of §2.17 in a wider generality (the FW form): p ≥ 3; f of even weight k ≥ 2 satisfying hypotheses (1)–(3) of FW Thm 1.6 and 𝐟 the ordinary family through f, with 𝕀 normal and T_𝐟 free by (1) and (3); K as in FW Definition 4.24, p. 51, which is ramified at the prime ℓ ∥ N of hypothesis (2). FW §4.8, p. 68, asserts that the CW argument extends to this setting without giving it. In the FW form the three statements are targets of this roadmap, proved by rerunning the KLZ17 construction and the CW argument with these data: Ohta's description of ordinary cohomology at p = 3 replaces the p ≥ 5 citation, and the local conditions and Euler factors at the ramified prime ℓ replace the coprimality of D_K and N. The analytic families of Beilinson–Flach elements of FW §4.4 used at crystalline points are a different construction over Pottharst's quasi-Stein algebra and belong to §2.20, not to either form here. The Burungale–Castella–Skinner route of [§6.1](#61-the-ordinary-two-variable-perrin-riougreenberg-equivalence-bcs-theorem-413-corollary-414) needs the class for a fixed elliptic newform and no Hida family (the fixed-form form): p an odd prime, g ∈ S_2(Γ_0(N)) an elliptic newform with p ∤ 2N and a_p(g) a p-adic unit, T_g ⊂ V_g the lattice generated by the image of H¹_ét(Y_1(N), ℤ_p)(1), with its ordinary filtration T_g^+ ⊂ T_g and T_pE_• ≅ T_g for Wuthrich's curve E_• in the isogeny class of g (CGS23 §3, p. 17), K imaginary quadratic with p split, and α : Γ_K → R^× a character with values in the ring of integers R of a finite extension of ℚ_p; the class BF_α ∈ H¹_(F_ord,rel)(K, T_g(α) ⊗̂ Λ_K), built from the Rankin–Eisenstein classes of g against the CM family of K, with the ordinary condition at v and the relaxed condition at v̄ (CGS23 Theorem 3.1.1, p. 17). CGS23 Theorem 3.1.1 states this class for every p ∤ 2N, with the proof in BST19 §5 from KLZ17 and BDP22; KLZ17's standing assumption from §7.2 on is p ≥ 5, so for p ≥ 5 the class is CGS23's, and at p = 3 it is a target here, obtained by rerunning that construction with Ohta's description of ordinary cohomology at p = 3, as in the FW form. Neither ramification of K at a level prime nor coprimality of D_K to N enters the construction; (irr_K) and (D_K, N) = 1 are hypotheses of the equivalence of §6.1, not of the class. Whenever the CW form applies, the fixed-form class is the specialization of the CW class at g. The construction must supply KLZ17 Definition 8.1.1, its tame and p-power norm relations, Proposition 8.1.7 for the local conditions, and LLZ14 Lemma 6.8.9 for removal of the auxiliary c. CW Theorem 3.6 identifies the precise specialization consumed here; an abstract class with the same local images is insufficient. LLZ14 Lemma 6.8.9 assumes that the conductor of ε_fε_g does not divide mp^∞ and avoids only height-one primes not containing p. Corollary 6.8.10 therefore gives a c-independent class after p-inversion. To obtain the integral CW class on the stated lattice, additionally prove that the smoothed classes descend integrally at primes over p: either exhibit a smoothing factor that is a unit there, or prove the equivalent denominator/lattice comparison. This is a separate requirement; the cited LLZ lemma alone does not establish it.

The source is [CW](https://arxiv.org/pdf/2001.03878v1), Thm 3.6 and its proof, p. 15. The class BF† ∈ Sel^(Gr,∅)(K,T†) from KLZ17 Def. 8.1.1 (m = 1), LLZ14 Lemma 6.8.9 and the CM family via BST19 and Shapiro. [KLZ17](https://arxiv.org/pdf/1503.02888v6), Definition 8.1.1, p. 40, and Proposition 8.1.7, p. 42 (arXiv v6 pagination). [LLZ14](https://annals.math.princeton.edu/wp-content/uploads/annals-v180-n2-p06-p.pdf), Lemma 6.8.9 and Corollary 6.8.10, p.736. [FW](https://arxiv.org/pdf/2107.13726v3), §4.4 (Prop. 4.22, §4.4.2), pp. 49–51. Hida families of CM representations and analytic families of Beilinson–Flach elements used in the crystalline case. [CGS23](https://arxiv.org/pdf/2303.04373v1), §3 and Theorem 3.1.1, p. 17. The fixed-form class on the lattice T_g with its ordinary-relaxed local conditions.

The proof proceeds as follows. Rankin–Eisenstein classes: pushforward along the diagonal Y_1(N) → Y_1(N)² of Eisenstein classes (from Siegel units, KatoEulerSystems §0.1 and PadicFamilies §4.0.1), with the étale realization and the moment maps. Norm relations in the tame and p-power directions give a Λ-adic class over the tower (KLZ). Compare the c-smoothed classes using their smoothing factors, retaining the tame conductor hypothesis and the separate integral descent at primes over p. Specialize the second family to the canonical CM family g and apply Shapiro to obtain BF ∈ H¹(K, T); twist by Θ⁻¹.

The interface is used in [§2.16](#216-explicit-reciprocity-for-beilinsonflach-classes) to the Coleman images of loc_p(BF†) are the two Rankin–Selberg p-adic L-functions; in [§2.17](#217-greenberg-and-beilinsonflach-main-conjectures-over-k-are-equivalent) to BF† generates the rank-one Selmer module in the Beilinson–Flach main conjecture; in [§2.20](#220-fouquetwans-main-conjecture-at-crystalline-short-points) to the analytic families of Beilinson–Flach elements in FW §4.4–4.6.

**API.**

- The two-family class is BF_(𝐟,g) ∈ H¹(ℚ, T_𝐟 ⊗̂ T_g ⊗̂ Λ_Γ).
- Shapiro identifies BF_(𝐟,g) with BF ∈ H¹(K, T), T = T_𝐟 ⊗ 𝕀[[Γ_K]]-coinduced.
- Its critical twist is BF† = tw_(Θ⁻¹)(BF) ∈ H¹(K, T†).
- BF† belongs to Sel^(Gr,∅): Greenberg at p, relaxed at p̄, and the specified unramified conditions away from p (CW Thm 3.6).
- The classes satisfy the tame norm relations with Euler factors P_ℓ(Frob_ℓ⁻¹) and are norm-compatible in the p-power direction.
- Specialization along arithmetic points of 𝕀 and of Γ_K commutes with Shapiro and the twist.
- loc_v(BF†) is non-torsion over 𝕀[[Γ_K]] for each v | p (CW Thm 3.6, last sentence).
- In the fixed-form form, BF_α ∈ H¹_(F_ord,rel)(K, T_g(α) ⊗̂ Λ_K) for every α, with the ordinary condition at v and the relaxed condition at v̄, norm-compatible along Γ_K; loc_v(BF_α) lies in H¹(K_v, T_g^+(α) ⊗̂ Λ_K).
- Under Shapiro and the critical-twist isomorphism two BF classes are equal iff their inverse images are equal; the distinguished class includes its norm-compatible construction, not just its local images.

**Checks.**

- The universal class satisfies both Coleman reciprocity identities in their specified fractional congruence-ideal targets. Specialization commutes wherever defined; a specialized L-value may vanish, so no fixed weight-two/trivial-character value is required to be nonzero.
- loc_(v_0)(BF†) satisfies the Greenberg condition, while loc_(v̄_0)(BF†) is unrestricted (relaxed).
- The curve 11a1 at p = 5 has reducible residual representation (it has a rational 5-torsion point), so a Hida family through it fails the residual irreducibility of both forms and receives no class from this subsection.
- At p = 3, or for K ramified at a prime of N, the CW form does not apply; such an instance needs the FW form, whose proof is part of this target, not a citation of CW Theorem 3.6.
- If the tame conductor divides mp^∞, the LLZ auxiliary-factor avoidance lemma cannot be applied. If only primes away from p have been checked, the integral BF lattice assertion remains to be proved.
- Kato's zeta element of f alone (KatoEulerSystems §2.3) is a class for T_f over ℚ_∞, not for T_𝐟 ⊗ T_g over the two-variable tower; replacing BF by Kato's class fails the identification over K.
- With g the canonical CM family, T_g ≅ Ind^ℚ_K ℤ_p[[Γ_p]] (BST19), and Shapiro gives the identification over K used by Castella–Wan.
- Fixed-form instance outside both family forms: for 11a1 at p = 3 with K = ℚ(√−2), a_3 = −1 is a 3-adic unit, D_K = −8 is prime to 3·11, 3 splits in K (−2 ≡ 1 mod 3), and ρ̄_(E,3) is irreducible on G_K: 5 is inert in K (−2 ≡ 3 mod 5 is a nonsquare), so Frob_5² ∈ G_K, and its characteristic polynomial X² − (a_5² − 2·5)X + 25 = X² + 9X + 25 ≡ X² + 1 mod 3 (a_5 = 1) is irreducible over 𝔽_3, so E[3] has no G_K-stable line. The CW form needs p > 3 and the FW form needs K ramified at a prime dividing 11; neither applies, and the fixed-form form is what supplies the class and the two reciprocity laws that §6.1 uses here.

*Needs:* KatoEulerSystems §0.1; PadicFamilies §§4.0.1 and 4.1; SelmerIwasawaCohomology §§3.1, 3.2 and 3.5; EllipticCurves Layer 2.

### 2.16 Explicit reciprocity for Beilinson–Flach classes

Over I[[Γ_K]], CW Thm 3.6 gives injections with pseudo-null cokernel Col^((1),†):H¹(K_p̄,F^-T†)→I_f⊗_I I[[Γ_K]] and Col^((2),†):H¹(K_p,F^+T†)→I_g⊗̂_Zp I[[Γ_K]]. Their images on loc_p̄(BF†) and loc_p(BF†) are respectively tw_(Θ⁻¹)L_p(f,g) and tw_(Θ⁻¹)L_p(g,f). The targets I_f and I_g are the specified fractional congruence ideals, not units that may be silently discarded. The maps are obtained by pairing the family Perrin–Riou logarithm with η_f⊗ω_g and η_g⊗ω_f. Each universal localization of BF† is non-torsion; this does not require every arithmetic specialization to be nonzero. Weight moments: specializing at weight-k points gives the reciprocity laws FW uses in §4.4–4.6 for the analytic families.

In the fixed-form form of §2.15 the two maps are Col̃_g : H¹(K_v̄, T_g^-(α) ⊗̂ Λ_K) → I_g ⊗̂ Λ_K and Col̃_CM : H¹(K_v, T_g^+(α) ⊗̂ Λ_K) → I_CM ⊗̂ Λ_K, injective and Λ_K-linear with pseudo-null cokernel, where I_g ⊂ ℚ_p is the image of the Hecke-equivariant functional on M_2(Γ_0(N), ℤ_p) normalized by g ↦ 1 and I_CM ⊂ Frac(Λ_CM) is its analogue for the CM family; they send p^-(loc_v̄ BF_α) and loc_v BF_α to the two Rankin–Selberg p-adic L-functions L_p(g(α)/K, Σ^(1)) and L_p(g(α)/K, Σ^(2′)) (CGS23 Theorem 3.1.1(a)–(b), p. 17). Rescaling by deg(π_•)·H_p(g), where deg(π_•)·I_g = ℤ_p (CGS23 Lemma 3.1.2), and by the congruence generator h_K·L_v(K)^- of the CM family ([§0.9](#09-cm-theta-family-congruence-and-katz-normalization-for-the-clw-integrality-input)) gives Λ_K- and Λ^ur_K-valued maps Col_(E_•) and Col_CM with Col_(E_•)(p^-(loc_v̄ BF_α)) = L^PR_p(E_•(α)/K) and Col_CM(loc_v BF_α) = L^Gr_p(g(α)/K) (CGS23 Corollary 3.1.3, p. 18); these are the maps of [§6.1](#61-the-ordinary-two-variable-perrin-riougreenberg-equivalence-bcs-theorem-413-corollary-414), with the same pseudo-null cokernels. For p ≥ 5 both laws are CGS23's; at p = 3 they are part of the fixed-form target of §2.15.

Use the hypotheses of [§2.15](#215-λ-adic-beilinsonflach-classes-for-a-hida-family-and-the-cm-family); the big logarithm in families is that of PadicFamilies §4.6.

The source is [CW](https://arxiv.org/pdf/2001.03878v1), Thm 3.6 and proof, p. 15. The Coleman maps in CW normalization. [KLZ17](https://arxiv.org/pdf/1503.02888v6), Theorem 10.2.2, p. 52, with the congruence-ideal target of Notation 7.7.1, p. 39 (arXiv v6 pagination). The normalized explicit reciprocity comparison for BF†. [CGS23](https://arxiv.org/pdf/2303.04373v1), Theorem 3.1.1, p. 17; Lemma 3.1.2 and Corollary 3.1.3, pp. 17–18. The fixed-form reciprocity laws and their integral rescaling. [FW](https://arxiv.org/pdf/2107.13726v3), §4.4.2 and §4.5, pp. 51–57. Analytic families of Beilinson–Flach elements, Selmer complexes and Rankin–Selberg p-adic L-functions.

The proof proceeds as follows. Construct Col⁽ⁱ⁾ by pairing the Perrin-Riou big logarithm of the graded pieces F^∓ with the differentials η, ω (PadicFamilies §4.6, PadicHodgeRegulators §8.8). Use KLZ reciprocity through CW Thm 3.6 in the two different local groups just specified, preserving the congruence-ideal factors and critical twist. When passing from KLZ Theorem 10.2.2 to CW normalization, track the auxiliary smoothing factor, the Atkin–Lehner pseudo-eigenvalue, the sign and the fractional congruence ideal; remove a factor only after proving its inverse is allowed in the target lattice. The norm-compatible KLZ construction and both explicit reciprocity laws are required; the existence of the displayed Coleman maps alone does not construct the distinguished class. Injectivity with pseudo-null cokernel from the structure of local Iwasawa cohomology of rank-one graded pieces.

**Checks.**

- Fractional targets: with congruence generator η_f = ϖ the target I_f is ϖ⁻¹Λ, which contains the value 1/ϖ; the integral target Λ does not, so treating I_f as a unit rejects a correct reciprocity law with denominator ϖ.
- Pseudo-null cokernels over Λ = O[[X,Y]]: multiplication by 1 has cokernel 0; multiplication by X has cokernel Λ/(X), supported in height one and not pseudo-null; Λ/(X,Y) is pseudo-null. Only the first and the last are allowed as cokernels of the Coleman maps.

*Needs:* §§0.9 and 2.15; PadicFamilies §4.6; PadicHodgeRegulators §§8.8 and 8.18.

### 2.17 Greenberg and Beilinson–Flach main conjectures over K are equivalent

Let 𝐟 be a Hida family with ρ_𝐟|_(G_K) irreducible. The following are equivalent, up to powers of p: (i) X^(Gr,0)(K_∞, A†_𝐟) is 𝕀[[Γ_K]]-torsion, Sel^(Gr,∅)(K, T†) has rank one, and char(X^(Gr,0)) = char(Sel^(Gr,∅)(K,T†)/𝕀[[Γ_K]]·BF†); (ii) X^(∅,0)(K_∞, A†_𝐟) and Sel^(0,∅)(K, T†) are torsion and char(X^(∅,0))·𝕀^ur[[Γ_K]] = (tw_(Θ⁻¹)(L_p(𝐟/K))) (CW Thm 3.8). The same argument holds for a weight-k specialization with the Greenberg main conjecture supplied by [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture) in place of the weight-two input (FW §4.8). Each divisibility direction in (ii) corresponds to the same direction in (i).

Assume ρ_𝐟|_(G_K) irreducible and the hypotheses of the CW form or of the FW form of [§2.15](#215-λ-adic-beilinsonflach-classes-for-a-hida-family-and-the-cm-family); in the FW form (p ≥ 3, weight k, K as in FW Definition 4.24) the equivalence is a target here whose proof reruns CW Thm 3.8 with §2.14 as the Greenberg input. The comparison is up to powers of p, so it does not by itself remove a power of p. Integrality is not claimed: the p-power ambiguity is removed only in [§2.21](#221-the-fouquetwan-ordinary-reverse-divisibility-theorem-16-by-48), using Kato's bound and the §4.6.3-type argument.

The source is [CW](https://arxiv.org/pdf/2001.03878v1), Thm 3.8, p. 16. The equivalence of the Beilinson–Flach and Greenberg two-variable main conjectures over K, up to powers of p. [FW](https://arxiv.org/pdf/2107.13726v3), §4.8, p. 68. The argument goes through in general weight by replacing Greenberg's main conjecture there by Thm 7.32.

The proof proceeds as follows. The two Poitou–Tate four-term exact sequences for the Selmer structures (Gr,∅) ⊃ (Gr,0) and (∅,∅) ⊃ (∅,0) relate the four modules; the Coleman maps of [§2.16](#216-explicit-reciprocity-for-beilinsonflach-classes) identify the local terms with the p-adic L-functions. Rank and torsion statements are proved before any cancellation: loc_v(BF†) is non-torsion, so Sel^(Gr,∅) has rank one when X^(Gr,0) is torsion. Multiplicativity of characteristic ideals along the exact sequences gives the equivalence, with pseudo-null cokernels absorbed.

**Checks.**

- The ideals (p) and (1) agree after inverting p and have valuations 1 and 0 at (p); an equivalence up to powers of p cannot certify their integral equality.
- Characteristic ideals and rank: Λ/(f) has characteristic ideal (f), the zero module (1), and Λ itself, of rank one, has extended characteristic ideal 0; so (i) needs the rank-one statement before char(Sel^(Gr,∅)/BF†) is a nonzero ideal.

*Needs:* §§2.15 and 2.16; SelmerIwasawaCohomology §§2.13, 2.19 and 3.12; ArithmeticGaloisDuality §R02.4.3; EulerSystemsAndKolyvaginSystems §8.16; PadicMeasuresIwasawaAlgebras §4.6.

### 2.18 Choosing the auxiliary imaginary quadratic field for the Fouquet–Wan route

Let p≥3 and let f ∈ S_k(Γ_0(N)), p ∤ N, k ≥ 2 even, satisfy the hypotheses of FW Thm 1.6 (ρ̄_f absolutely irreducible; some ℓ ∥ N with dim ρ̄^(I_ℓ)_f = 1 and dim ρ̄^(G_ℓ)_f = 0; ordinary with χ̄_1 ≠ χ̄_2). Then there is an imaginary quadratic K with p split, the chosen ℓ ramified in K, every other prime dividing N split in K, 2 split when ℓ≠2 and ramified when ℓ=2, and ρ̄_f|_(G_K) absolutely irreducible. These are the field conditions of FW Definition 4.24 and give the field/local hypotheses of [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture), first containment. The additional Steinberg-twist and Hsieh conditions needed to remove the excluded primes are checked separately; ramification of ℓ alone does not prove them. The general-weight ordinary comparison of [§2.17](#217-greenberg-and-beilinsonflach-main-conjectures-over-k-are-equivalent) remains a separate proof input.

Assume only the hypotheses of FW Thm 1.6 on f; the conditions on K are finitely many local conditions at finitely many primes plus the avoidance of the finitely many quadratic subfields of the splitting field of ρ̄_f. The Steinberg-twist hypothesis of the second containment is not automatic; when it fails the exceptional primes are handled by [§2.13](#213-removing-the-excluded-height-one-primes) or remain excluded.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Definition 4.24, p. 51; §4.8, p. 68; Thm 1.6, pp. 6–7. The ordinary argument uses the field selection of §4.6. The different SU choice in the proof of Thm 3.6.4, p. 43, has its witness prime inert and is used in §1.11; it is not the field selection specified by FW Definition 4.24.

The proof proceeds as follows. Impose splitting at p and the other primes of N, and ramification at ℓ, by choosing fundamental D_K in compatible local square classes (including the discriminant class at 2); infinitely many such K exist. Absolute irreducibility of ρ̄_f|_(G_K): ρ̄_f is absolutely irreducible over ℚ, so it fails over K only if ρ̄_f is induced from K; this excludes at most finitely many K. Verify that q=ℓ is the only nonsplit level prime, q∥N, that ρ̄_f|_(G_K) is absolutely irreducible, and that p splits. When ℓ=2 use 2∥N and a ramified local quadratic extension at 2; otherwise impose D_K≡1 mod 8. Verify ordinary distinctness for the separate comparison, and retain every local hypothesis of §2.13 before removing its exceptional primes.

**Checks.**

- At 2: D_K = −7 ≡ 1 mod 8 splits 2, D_K = −3 ≡ 5 mod 8 leaves 2 inert, and D_K = −4 or −8 ramifies 2. When the chosen witness is ℓ = 2 only the ramified class is admissible; when ℓ ≠ 2 only the split class.
- For ℓ = 7 and p = 5: K = ℚ(√−7) ramifies 7 but leaves 5 inert ((−7/5) = (3/5) = −1), so it fails the splitting of p; K = ℚ(√−91) ramifies 7, and (−91/5) = (4/5) = 1 splits 5, so it passes these two conditions.

*Needs:* §§2.14 and 2.17.

### 2.19 Boundedness of the Bloch–Kato exponential along unramified extensions

Under FW Assumption 4.1 (short crystalline V with irreducible residual representation) and for a chosen lattice T, Prop. 4.12 gives a fixed m such that exp(W(F̄_p)·ω_V)⊂p⁻ᵐH¹(I_p,T). Cor. 4.13 gives its Yager-module description after the unramified twist ρ(Frob)=1+x with v_p(x)>0. In Cor. 4.14 assume every unramified specialization V′ satisfies D_crys(V′)^(φ=1)=0. The exponential line is then a rank-one direct summand after inverting p; after a fixed rescaling b∈E^× it determines the saturated integral local line. The raw exponential is not asserted integral. Keep the constants b_p,d_p of Def. 4.15 in subsequent comparisons.

Define the Yager module: let U = Gal(ℚ_p^(ur,p)/ℚ_p) for the unramified ℤ_p-extension, U_m its quotient of order p^m with fixed field K_m (unramified of degree p^m over ℚ_p), let Ô_∞ be the p-adic completion of ⋃_m O_(K_m), the ring of integers of ℚ_p^(ur,p), on which U acts through Galois, the elements fixed by Gal(ℚ_p^(ur,p)/K_m) forming O_(K_m) (LZ14 Lemma 3.1, p. 9), and write e_σ for the group-like basis element of σ in Ô_∞[[U]] and in O_K[Gal(K/ℚ_p)]. Let U act on Ô_∞[[U]] in two ways: by the inverse multiplication action u⋆f = e_(u⁻¹)f, and by f ↦ f^u, the Galois action on the coefficients. The Yager module is S = {f ∈ Ô_∞[[U]] : f^u = u⋆f for all u ∈ U}. The maps y_(K/ℚ_p)(x) = Σ_(σ∈Gal(K/ℚ_p)) x^σ e_σ satisfy y(x^u) = u⋆y(x), are compatible with the trace maps, and induce an isomorphism of ℤ_p[[U]]-modules from lim← O_(K_m) (trace transitions, U acting through Galois) onto S with U acting by ⋆ (FW §4.2.2, (4.2.2), pp. 43–44, after [LZ14](https://arxiv.org/pdf/1108.5954v3), §3.2, Definition 3.4 and Proposition 3.6, pp. 10–11, with the convention change noted by FW). Prove that S is free of rank one over ℤ_p[[U]], generated by y(d) for any trace-compatible d = (d_m) with d_0 ∈ ℤ_p^×; and that x ∈ O_(K_m) generates O_(K_m) as a ℤ_p[U_m]-module exactly when Tr_(K_m/ℚ_p)(x) ∈ ℤ_p^× (FW p. 44). Define the Yager twist: for a one-dimensional unramified representation ρ of U on F, ρ(d) ∈ Aut(F ⊗ Ô_∞), where ρ is extended Ô_∞-linearly by e_σ ↦ ρ(σ), and its inverse-type element ρ(d)^∨, with ρ(d)·x fixed by G_(ℚ_p) for x ∈ F (FW p. 44): for u ∈ U, u(ρ(d)x) = ρ(e_u·d^u)x = ρ(e_u e_(u⁻¹) d)x = ρ(d)x. Its API consists of the isomorphism with the trace-compatible norm limit, the freeness of rank one, the normal-basis criterion, the G_(ℚ_p)-invariance of the twisted elements, and the compatibility with the cyclotomic variable through the completed tensor product with ℤ_p[[Γ_cyc]].

**Checks.**

- Coefficient ring: the coefficients are Ô_∞, not the completed maximal unramified ring W(F̄_p). At p = 3, Frobenius acts on W(𝔽₉) with order 2, which no action of the pro-3 group U induces; and if a Teichmüller unit a ∈ W(𝔽₉) ∖ ℤ₃ were declared U-fixed, a·y(d) would satisfy the defining law with augmentation a ∉ ℤ₃. With coefficients in Ô_∞ the augmentation of S lies in Ô_∞^U = ℤ_p, matching the trace limit at level 0.
- At m = 0, K_0 = ℚ_p, y is the identity of ℤ_p and d_0 must be a unit: d_0 = p fails to generate, while d_0 = 1 generates.
- For K_1/ℚ_p unramified of degree p and x = 1, Tr(1) = p is not a unit, so 1 is not a normal-basis generator of O_(K_1); an element of trace 1 is.
- An element f with f^u = f for all u (Galois-invariant coefficients) and f ≠ 0 is not in S unless u⋆f = f, which fails for f = 1 since u⋆1 = e_(u⁻¹) ≠ 1; the two actions must be matched, not confused.
- Degree three at p = 3: the residue field of K_1 is 𝔽₂₇ = 𝔽₃[a]/(a³ − a − 1) (no root in 𝔽₃), and Frobenius τ sends a to a³ = a + 1. In the basis (e_1, e_τ, e_(τ²)), y(a) = (a, a+1, a+2); its coefficient conjugate y(a)^τ is (a+1, a+2, a), and τ⋆y(a) = e_(τ²)y(a) is also (a+1, a+2, a). Pairing x^σ with e_(σ⁻¹) instead gives (a, a+2, a+1), whose conjugate (a+1, a, a+2) differs from τ⋆ of it, (a+2, a+1, a): that convention does not land in S. The trace Checks cannot detect this inversion.

Then use the Yager module and twist for the unramified-by-cyclotomic exponential, with the integral-lattice and two-action compatibility specified above.

Assume FW Assumption 4.1, the unramified twist of Cor. 4.13, and the φ=1 exclusion at every unramified specialization in Cor. 4.14. The Yager normal basis and the integral comparison are this subsection's own targets; a purely rational regulator is insufficient.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), §4.2.1 Prop. 4.12, p. 43; §4.2.2 (Yager modules after LZ14 §3.2, Definition 3.4 and Proposition 3.6, pp. 10–11), p. 43; §4.2.3 Cors 4.13–4.14, pp. 44–45. Boundedness of the exponential map along the unramified family and the integral local subspace replacing the ± theory. [FW](https://arxiv.org/pdf/2107.13726v3), §1.2.1, pp. 11–12. The integral local theory along the line unramified at v_0 replaces a two-variable ± theory.

The proof proceeds as follows. Use the integral short-crystalline comparison to prove the uniform denominator bound of Prop. 4.12. Use the Yager module and twist to compute the unramified-family exponential as in §4.2.2–4.2.3. Under the φ=1 exclusion prove the rational direct-summand assertion of Cor. 4.14, then choose the fixed rescaling and saturated integral line of Def. 4.15.

**Checks.**

- A bounded denominator p⁻ᵐ with m>0 must remain visible before the fixed rescaling. A specialization with φ=1 is excluded from the direct-summand assertion, since the corresponding exponential can fail to have the required injectivity.

*Needs:* PadicHodgeRegulators §§1.2, 1.10 and 8.22; SelmerIwasawaCohomology §§4.7 and 4.10.

### 2.20 Fouquet–Wan's main conjecture at crystalline short points

Let f ∈ S_k(Γ_0(N)) be a normalized eigencuspform of weight k ≥ 2 with ρ_f|_(G_(ℚ_p)) crystalline (p ∤ N) and short, ρ̄_f|_(G_(ℚ_p)) absolutely irreducible, and some ℓ ∥ N with dim ρ̄^(I_ℓ) = 1 and dim ρ̄^(G_(ℚ_ℓ)) = 0. Then Kato's main conjecture holds for M(f): char H²(ℤ[1/p], T ⊗ Λ_Iw) = char H¹(ℤ[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw (FW Thm 4.51 = Thm 1.13; Thm 4.38 under the residual hypothesis of Thm 1.7). The proof first gives the equalities of Prop. 4.42 after inverting p (through Pottharst's analytic Iwasawa theory and Selmer complexes over ΛK,∞), then removes the power of p by the unramified local theory along the line through the point (§4.6.3, Prop. 4.48), and treats equal Satake parameters through the Bianchi three-variable p-adic L-function of Betina–Williams (§4.7).

Retain the stated hypotheses; the distinct-Satake-parameter case first, then §4.7 for the p-irregular case. Kato's one-sided bound (KatoEulerSystems §7.2) supplies the divisibility F_1 | F of the proof of Thm 4.51. The source theorem is the target; its proof inputs are [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture) through the two-family theorem of [§2.12](#212-general-weight-fourierjacobi-values-the-two-family-theorem), the Yager-module theory of [§2.19](#219-boundedness-of-the-blochkato-exponential-along-unramified-extensions), and the analytic comparisons stated below. Kato’s integral bound must be applied with its actual free rank-one τ-quotient condition, not merely residual irreducibility.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Thm 4.38 p. 58; Prop. 4.42 p. 59; §4.6.3 and Thm 4.51 with proof pp. 61–65; §4.7 Prop. 4.53 pp. 66–67. Kato's main conjecture at crystalline short points with residually irreducible local representation. [FW](https://arxiv.org/pdf/2107.13726v3), §1.2.1, pp. 11–12. Outline: analytic Iwasawa theory after inverting p, then the unramified line to remove powers of p, then the Betina–Williams comparison.

Prove FW's analytic Selmer-complex comparison: over Pottharst's quasi-Stein algebra Λ_K,∞, the inverse limit of affinoid algebras with dense transition maps, the Selmer complex of the analytic Beilinson–Flach family with FW's finite-slope local conditions is perfect, commutes with derived base change to each affinoid and to arithmetic points, and, after inverting p, the Poitou–Tate identifications of FW §4.5 (Propositions 4.28, 4.30, 4.43 and Corollary 4.44) relate its cohomology to the Greenberg and Beilinson–Flach Selmer modules with all Tor and local correction terms. The local complexes and their base change are PhiGammaModulesAndIwasawaCohomology §§4.4–4.5 and 5.4; the derived global cochains are ArithmeticGaloisDuality §§D7.3–D7.5. Prove FW's p-irregular comparison: when α = β (so k ≥ 4), for the Coleman family through f_α with normal coefficient ring I and the CM Hida family g, the right-hand side of the explicit reciprocity law of Loeffler–Zerbes's Coleman-family theorem is the explicit factorial multiple of L(f, g, 1+j) of FW Prop. 4.53, and the ratio G of the Betina–Williams modular-symbol function to the Loeffler–Zerbes function is a nonzero element of Frac(I) depending only on the Coleman variable (FW §4.7.2, pp. 66–67). The Betina–Williams three-variable function and its Artin factorization are imported from PadicFamilies (gap:bianchi-p-irregular-l-functions), with the hypotheses of BW Theorems A–C below; the distinct-root regulator of PadicFamilies §4.9 does not cover α = β.

The analytic complexes instantiate [Pottharst](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), Thms 1.11–1.13, pp. 1585–1586 (PDF pp. 16–17): perfectness requires the local perfect complexes of the specified amplitude, derived base change uses the boundedness hypotheses, and the quasi-Stein extension uses dense transition maps. Thm 3.13, pp. 1608–1609 (PDF pp. 39–40), treats nearly ordinary conditions with additional inertia-flatness and specialization hypotheses; it is not automatically the finite-slope comparison needed here. For equal Satake parameters, [Betina–Williams](https://arxiv.org/pdf/2011.02331v2), Thms A–C, pp. 2–4, provide the p-irregular family and Artin factorization under their level and split-p assumptions. The factorization allows nonzero period scalars; FW (4.7.4)–(4.7.5), p. 68, is the required comparison to the chosen Beilinson–Flach differential. Neither an unspecified period scalar nor equality at too few critical values proves an integral regulator identity.

The proof proceeds as follows. Prop. 4.42: from [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture) over K and the Beilinson–Flach reciprocity of [§2.16](#216-explicit-reciprocity-for-beilinsonflach-classes) in analytic families, via Poitou–Tate for Selmer complexes (FW §4.5, Props 4.28, 4.30, 4.43, Cor. 4.44), get the equality after inverting p. §4.3: control of Selmer groups and absence of pseudo-null submodules (Prop. 4.20). §4.6.3: along the unramified line through the point, the integral local subspace of [§2.19](#219-boundedness-of-the-blochkato-exponential-along-unramified-extensions) gives the bound at a generic arithmetic point (Prop. 4.48, Lemmas 4.49–4.50); with Kato's divisibility F_1 | F and Kato's explicit reciprocity this gives Thm 4.51. §4.7: when the Satake parameters coincide, compare with the Betina–Williams Bianchi p-adic L-function (Prop. 4.53).

**Checks.**

- Integral, not only after inverting p; this is the seed FW Prop. 5.6 uses at crystalline-short points of the deformation space.
- Equal Satake parameters occur only for even k ≥ 4: for k = 2, α ≠ β is known (FW §4.7, p. 66), so the p-irregular branch is empty there and the target is not invoked. The Loeffler–Zerbes period ⟨f,f⟩E(f_α)E*(f_α) vanishes when α = β, so the comparison must go through G and not through that period.
- Derived base change: for C = [A --X→ A] over A = E⟨X⟩, the specialization at X = 0 has H⁰ = E coming from Tor₁; a comparison of cohomology modules alone would give 0, so the Selmer comparison is stated for complexes.

*Needs:* §§2.14, 2.16, 2.17 and 2.19; KatoEulerSystems §§4.3, 4.4, 5.3 and 7.2; PadicFamilies §§4.0.2 and 4.9; PadicFamilies (gap:bianchi-p-irregular-l-functions); SelmerIwasawaCohomology §§3.8 and 3.20; PadicHodgeRegulators §9.22; PadicMeasuresIwasawaAlgebras §5.1.

### 2.21 The Fouquet–Wan ordinary reverse divisibility (Theorem 1.6 by §4.8)

Let f ∈ S_k(Γ_0(N)), p ∤ N, k ≥ 2, be an eigencuspform with (1) ρ̄_f absolutely irreducible; (2) some ℓ ∥ N with dim_𝔽 ρ̄^(I_ℓ)_f = 1 and dim_𝔽 ρ̄^(G_ℓ)_f = 0; (3) ρ_f|_(G_(ℚ_p)) an extension 0 → χ_1 → ρ_f|_(G_(ℚ_p)) → χ_2 → 0 with χ̄_1 ≠ χ̄_2. Then char_(Λ_Iw) H¹(ℤ[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw divides char_(Λ_Iw) H²(ℤ[1/p], T ⊗ Λ_Iw) (FW Thm 1.6). The route is FW §4.8, not SU plus a period lemma: over an auxiliary K ([§2.18](#218-choosing-the-auxiliary-imaginary-quadratic-field-for-the-fouquetwan-route)) prove the two-variable Greenberg Rankin–Selberg main conjecture divisibility by [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture), transfer it through [§2.17](#217-greenberg-and-beilinsonflach-main-conjectures-over-k-are-equivalent) to the Beilinson–Flach formulation, descend to the cyclotomic line, separate the twist factor f ⊗ χ_K, and remove the power of p by a §4.6.3-type integral argument that uses Kato's one-sided bound. No comparison of canonical and Gross periods is used.

Assume hypotheses (1)–(3) of FW Thm 1.6 exactly; trivial character, even weight for the GU(3,1) input. FW §4.8 outlines the transfer and refers to Castella–Wan Theorem 3.8 in weight two. The target also requires the cyclotomic specialization, separation of the quadratic-twist factor and integral descent removing the p-power error in general even weight. The source theorem is the target; its proof inputs are the two-family theorem of [§2.12](#212-general-weight-fourierjacobi-values-the-two-family-theorem) (through §2.14) and the integral local theory of [§2.19](#219-boundedness-of-the-blochkato-exponential-along-unramified-extensions). Kato’s integral bound must be applied with its actual free rank-one τ-quotient condition, not merely residual irreducibility. For Γ₀(N), even weight and p odd are retained in the scalar-residual parity argument. The integral descent uses the chosen local lattice and Kato normalization; it does not assert a canonical/Gross-period identity.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Thm 1.6 and the remark before it, pp. 6–7; §4.8, p. 68. Theorem 1.6 and its proof sketch: auxiliary K, two-variable Rankin–Selberg main conjecture via Thm 7.32, Beilinson–Flach reciprocity and Poitou–Tate as in Castella–Wan, then Kato. [CW](https://arxiv.org/pdf/2001.03878v1), Thm 3.8, p. 16. The weight-two equivalence that FW §4.8 extends.

The proof proceeds as follows. Choose K by [§2.18](#218-choosing-the-auxiliary-imaginary-quadratic-field-for-the-fouquetwan-route); [§2.14](#214-fouquetwans-gu31-divisibility-for-the-greenberg-main-conjecture) gives char(X^Gr) ⊆ (L^Gr) up to pulled-back primes, integrally when [§2.13](#213-removing-the-excluded-height-one-primes) applies. [§2.17](#217-greenberg-and-beilinsonflach-main-conjectures-over-k-are-equivalent) (weight k) converts this into the Beilinson–Flach divisibility char(X^(Gr,0)) ⊆ char(Sel^(Gr,∅)/BF†), up to powers of p. Specialize to the cyclotomic line ([§0.3](#03-specializing-σ-primitive-selmer-groups-and-their-characteristic-ideals)) and compare BF† with Kato's zeta elements of f and f ⊗ χ_K (as in FW §4.6.2–4.6.3), separating the two factors. Remove the power of p as in FW §4.6.3: Kato's divisibility (the cohomological upper bound of KatoEulerSystems §7.2) and an integral local subspace along a line in Spec Λ_K reduce the integral statement to a cardinality at one generic arithmetic point.

**Checks.**

- Kato's τ-quotient condition: σ = [[1,1],[0,1]] on ℤ_p² has (σ − 1)-cokernel ℤ_p, free of rank one; σ = [[1,p],[0,1]] has cokernel ℤ_p ⊕ 𝔽_p, not free, so the integral descent is unavailable although the residual representation may be irreducible.
- Λ/(T²) has μ = 0 and λ = 2; Λ/(p) has μ = 1 and λ = 0. Equal λ-invariants alone do not remove a power of p.

*Needs:* §§0.3, 2.13, 2.14, 2.17, 2.18 and 2.19; KatoEulerSystems §§4.3, 4.4 and 7.2; PadicFamilies §4.0.3; PadicMeasuresIwasawaAlgebras §5.1.

### 2.22 Wan's ordinary GU(3,1) Rankin–Selberg divisibility

Let K be imaginary quadratic with p = v_0v̄_0 split, 𝐟 a Hida family of ordinary eigenforms that are new outside p, of square-free tame level N, with a weight-two specialization f_0 of trivial nebentypus that is the ordinary stabilization of a newform of level N, and ξ a Hecke character of infinity type (κ/2, −κ/2), κ ≥ 6 even, with ord_(v_0), ord_(v̄_0) of its conductor ≤ 1. (Thm 1.1) If p ≥ 5, ξ|_(𝔸^×_ℚ) = ω∘Nm with κ ≡ 0 mod 2(p − 1), ρ̄_𝐟|_(G_K) irreducible, some q | N nonsplit in K with ρ̄_𝐟 ramified at q, the CM form g_ξ satisfies (dist) and (irred), every local root number ε(π_(f,v), ξ_v, 1/2) = 1 at nonsplit v, and the conductor of ξ is divisible only by split primes, then L^Hida_(𝐟,ξ,K) ∈ Î^ur[[Γ_K]] and (L^Hida_(𝐟,ξ,K)) ⊇ char(X_(𝐟,K,ξ)). (Thm 1.2) For the single form f_0, if p ≥ 5, the p-adic avatar of ξ|·|^(κ/2)(ω⁻¹∘Nm) factors through Γ_K with κ ≡ 0 mod 2(p − 1), ρ̄_(f)|_(G_K) is irreducible and some q ∥ N is nonsplit in K, then (L_(f,ξ,K)) ⊇ char(X_(f,K,ξ)) as fractional ideals of Ô^ur_L[[Γ_K]] ⊗ L, allowing both global root numbers; this p-inverted, imprimitive two-variable bound comes with the exceptional-prime and normality arguments of Wan20 §9.

Use the hypotheses stated in Wan20 Thms 1.1–1.2; the published ordinary theorem (arXiv:1408.4044, Algebra Number Theory 2020), not the withdrawn arXiv:1412.1767 nor the nonordinary replacement of §§2.1–2.8.

The source is [Wan-2020](https://arxiv.org/pdf/1408.4044v5), Thms 1.1–1.2 and the discussion after them, pp. 2–4; outline pp. 4–6. The three-variable and two-variable divisibilities for Rankin–Selberg p-adic L-functions on U(3,1) and the steps of their proof.

The proof proceeds as follows. Construct the Klingen Eisenstein family on U(3,1) whose constant terms are L^Σ_(𝐟,K,ξ) (Wan20 step (1)), with the Siegel section at p of Wan20 §4.3. Fourier–Jacobi coprimality through the functional l_(θ⋆), the doubling formula for U(2) × U(2) and Ichino's formula (Wan20 steps (2)–(5); [§2.4](#24-joint-height-one-coprimality-of-two-semi-ordinary-fourierjacobi-families) is the weight-two semi-ordinary analogue). Galois argument: lattice construction (Wan20 Prop. 9.2, [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups)) with CAP exclusion ([§2.6](#26-irreducibility-of-the-gu31-pseudo-character-excluding-cap-components)); Thm 1.2 by specializing a weaker three-variable statement after inverting all nonzero elements of 𝕀.

**Checks.**

- Theorem 1.1 needs a weight-two member that is the stabilization of a newform of level N: a family whose weight-two members are old at a prime of N is excluded, and hypothesis (d) fails when every prime of N splits in K.
- Theorem 1.2 is p-inverted: over Ô^ur_L[[Γ_K]] the ideals (p) and (1) differ, and the bound says nothing at the prime (p).

*Needs:* §§0.7, 2.4, 2.6 and 2.13; MetaplecticAutomorphicForms §6.2; AutomorphicPadicLFunctionsPartII §8.5; AutomorphicPadicLFunctionsPartII (gap:katz-cm-padic-l); PadicFamilies (gap:hida-rankin-selberg-cm); PadicFamilies (gap:anticyclotomic-rankin-selberg); PadicFamilies (gap:hecke-l-values-mod-p); PadicFamilies (gap:anticyclotomic-nonvanishing-mod-p).

### Examples

On a semi-ordinary eigenvector with U_p-eigenvalue 1, U_p^(r!) is the identity; on one with eigenvalue p it tends to zero. A supersingular weight-two GL₂ constituent has slopes 1/2,1/2 for its classical roots, yet the two unitary-normalized Satake valuations used here are 0,0. Replacing the semi-ordinary projector by the GL₂ ordinary projector kills this permitted constituent.

For the commutative-algebra model A=k[[X,Y]], the ideal (X,Y) is proper but lies in no height-one prime: a height-one prime containing X is (X), which does not contain Y. Thus joint height-one avoidance neither says that the coefficient ideal is A nor that one coefficient is globally a unit. Localizing at (X) makes Y a unit; localizing at (Y) makes X a unit. This is the distinction required by the two indexed rational families of the CLW addendum. Their denominators remain inverted; the computation does not construct an unscaled integral family.

At a height-one prime write J=(ϖᵃ) and L=uϖᵇ with u a unit. The desired reverse containment J⊆(L) is a≥b. For a=2,b=1 it holds; reversing the inequality would fail. If the prime lies over the cyclotomic subring, the Fourier–Jacobi argument is replaced by the local-Euler and μ comparison. Inverting p removes only primes over p; inverting every nonzero cyclotomic coefficient can also remove horizontal height-one primes. The two localized conclusions are therefore recorded separately.

For an ordinary residual representation u⊕u⁻¹χ̄_cyc, with u unramified and u(Frob_p)=a_p mod p, the excluded cyclotomic-ratio shape occurs when u²=1, namely a_p≡±1 mod p. This is a hypothesis check before selecting an auxiliary field, not a consequence of irreducibility over Q. The Steinberg example 1−11⁻¹=10/11 at p=5 also persists here: dim ρ̄^(I_ℓ)=1 by itself cannot remove that Euler factor.

### Dependencies

Earlier layers: §§0.1, 0.2, 0.3, 0.4, 0.5, 0.7, 0.9 and 1.8. Suppliers: ArithmeticGaloisDuality §R02.4.3; AutomorphicBundles §§12.2, 12.8, 12.15 and 12.16; AutomorphicGaloisRepresentationsPartII Layer AG2.2 (Galois assembly for discrete unitary transfer), (gap:unitary-galois-imaginary-quadratic), Layer AG2.6 (polarized admissibility at the coefficient prime); AutomorphicLFunctionsAndLocalFactors Layer AL.3 (Whittaker realizations, unequal-rank and equal-rank integrals); AutomorphicPadicLFunctionsPartII §8.5, (gap:katz-cm-padic-l); EulerSystemsAndKolyvaginSystems §8.16; GL2ModularityLifting §§8.7, 8.8 and 10.5; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); KatoEulerSystems §§0.1, 4.3, 4.4, 5.3 and 7.2; MetaplecticAutomorphicForms §§3.3, 6.2, 6.10a, 6.11, 6.12, 6.13, 6.17, 6.19 and 6.20; PELModuli §§M5.5 and M5.6; PadicFamilies §§0a.11, 0a.15, 0a.16, 0a.19, 0a.22, 4.0.1, 4.0.2, 4.0.3, 4.1, 4.6 and 4.9, (gap:hecke-l-values-mod-p), (gap:hida-rankin-selberg-cm), (gap:anticyclotomic-rankin-selberg), (gap:anticyclotomic-nonvanishing-mod-p), (gap:cm-congruence-katz-integral); PadicHodgeRegulators §§1.2, 1.10, 8.8, 8.18, 8.22 and 9.22; PadicMeasuresIwasawaAlgebras §§4.6 and 5.1; SelmerIwasawaCohomology §§2.8, 2.13, 2.19, 3.1, 3.2, 3.5, 3.8, 3.12, 3.20, 4.7 and 4.10. Libraries: Mathlib `MvPowerSeries`.

## Layer 3: Universal deformation families and zeta morphisms

### 3.1 The residual hypotheses of the Fouquet–Wan and Nakamura theorems

For an odd prime p, a finite field 𝔽 of characteristic p and an odd absolutely irreducible continuous ρ̄: G_ℚ → GL_2(𝔽) unramified outside a finite set Σ ∋ p, define the predicates: (A2.1) ρ̄|_(G_(ℚ(√p*))) is absolutely irreducible (p* = (−1)^((p−1)/2)p), and if ρ̄|_(G_(ℚ_p)) is an extension of χ_2 by χ_1 then χ_1⁻¹χ_2 ∉ {1, χ̄_cyc} (FW Assumption 2.1); (A3.5) if (ρ̄|_(G_(ℚ_p)))ˢˢ = χ̄_1 ⊕ χ̄_2 then χ̄_1⁻¹χ̄_2 ≠ χ̄_cyc (FW Assumption 3.5); (A3.7) there is ℓ ∥ N, ℓ ≠ p, with dim_𝔽 ρ̄^(I_ℓ) = 1 (FW Assumption 3.7); (T1.7) (ρ̄|_(G_(ℚ_p)))ˢˢ ≠ χ̄ ⊕ χ̄χ̄_cyc for every character χ̄, and there is ℓ ∤ p with ρ̄|_(G_(ℚ_ℓ)) a ramified extension 0 → µχ^(1−k/2)_cyc → ρ̄|_(G_(ℚ_ℓ)) → µχ^(−k/2)_cyc → 0, µ the nontrivial unramified quadratic character (FW Thm 1.7); and Nakamura's (N1) p ≥ 5, (N2) ρ̄|_(G_(ℚ(ζ_p))) absolutely irreducible, (N3) End_(𝔽[G_(ℚ_p)])(ρ̄_p) = 𝔽, (N4) ρ̄_p not of the form (1 ∗; 0 ε^(±1)) ⊗ χ, (N5) ρ̄_p not of the form (1 ∗; 0 1) ⊗ χ (Nakamura Thm 1.1). Define T5.1 separately: the same global irreducibility, local semisimple exclusion and ramified Steinberg-shape witness, but µ may be trivial when ρ̄|G_Qp is reducible; it must be nontrivial when that local representation is irreducible. The pointwise and family theorems of §5 use T5.1, not an identification of these two predicates.

Assume the predicates are on the residual representation only. The second clause of A2.1 excludes a reducible ρ̄|_(G_(ℚ_p)) with semisimplification χ̄ ⊕ χ̄. FW's remark after Assumption 2.1 (FW p. 17) deduces End_(𝔽[G_(ℚ_p)])(ρ̄_p) = 𝔽 from A2.1; that deduction needs ρ̄_p to be absolutely irreducible or a non-split extension of two distinct 𝔽-valued characters, so N3 is kept as a separate hypothesis wherever the local endomorphism algebra is used (§§3.5, 3.7 and 3.8). The FW endpoints of §§4.3–4.5 retain their full scope and use gap:fw-zeta-local-descent when N3 fails.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Assumption 2.1, p. 17; Assumption 3.5, p. 24; Assumption 3.7, p. 25; Thm 1.7, p. 7; Thm 5.1, p. 68. The residual hypotheses of the deformation-theoretic part and of the main theorems. [Nakamura](https://arxiv.org/pdf/2006.13647v2), Thm 1.1 (1)–(5) and Remark 1.2, pp. 4–5. Nakamura's hypotheses, with the remark that (2) and (5) can be removed for the promodular ring and why (1), (3), (4) are needed.

For p = 3, FW's remark after Thm 3.6, p. 24, replaces the two places where Nakamura uses p ≥ 5 (Nakamura Theorem B.24, the projective envelope as the dual of the universal deformation, and Theorem 4.7, the freeness at potentially semistable points) by Paskunas2016 Propositions 2.13 and 2.33 (arXiv v2 numbering). The first is covered by PadicLocalLanglandsForGL2Qp §§5.8–5.9, which hold for p ≥ 3; the second is gap:paskunas-p3-freeness. The remaining local residual hypotheses are not removed by these results. For the full FW hypotheses without N3, the descent and classical comparison are gap:fw-zeta-local-descent on CompletedCohomologyAndLocalGlobalCompatibility §4.7; the envelope branch remains restricted to N3.

The proof proceeds as follows. Record each predicate as a proposition about ρ̄ with its source. The local endomorphism algebra is computed from the shape of ρ̄_p: it is 𝔽 when ρ̄_p is absolutely irreducible or a non-split extension of distinct 𝔽-valued characters, a quadratic extension of 𝔽 when ρ̄_p is irreducible but not absolutely irreducible, and 𝔽 × 𝔽 when ρ̄_p is a split sum of distinct characters. Nakamura's remark on N2/N5 (they can be dropped for the promodular ring) and FW's remark on p ≥ 5 are recorded as API facts.

The interface is used in [§3.2](#32-the-universal-deformation-ring-is-a-reduced-complete-intersection-finite-free-over-λ-and-equal-to-the-hecke-algebra) to A2.1 makes R_Σ(ρ̄) representable, CI and isomorphic to the Hecke algebra; in [§3.7](#37-nakamuras-universal-zeta-morphism) to N1–N5 (or N1, N3, N4 for the promodular ring); in [§4.5](#45-fouquetwans-main-conjecture-at-every-point-of-the-family) to T5.1 is the §5 pointwise hypothesis; T1.7 is the narrower introductory formulation; and in ModularIwasawaMainConjectures (supplier gap automorphic-endpoints), where T5.1 is again the pointwise hypothesis.

**API.**

- A2.1, A3.5 and A3.7 are FW Assumptions 2.1, 3.5 and 3.7 as propositions about ρ̄; A3.7 asks for a prime ℓ ∥ N with one-dimensional inertia invariants.
- T1.7 is the residual hypothesis of FW Thm 1.7, with nontrivial µ in every case.
- N1–N5 are Nakamura's hypotheses (N1)–(N5).
- End_(𝔽[G_(ℚ_p)])(ρ̄_p) = 𝔽 when ρ̄_p is absolutely irreducible or a non-split extension of two distinct 𝔽-valued characters. A2.1 alone does not imply it, and N3 is the predicate that asserts it.
- A2.1, A3.5 and the Nakamura exclusions are invariant under character twists. A3.7 is preserved by a twist unramified at its chosen witness ℓ. The specified Steinberg shape and µ in T1.7/T5.1 are not invariant under arbitrary twists.
- T5.1 is the residual hypothesis of FW Thm 5.1, with µ allowed trivial only when ρ̄_p is reducible.
- Each predicate transports under an isomorphism of residual representations; predicates including a witness retain the chosen prime and its local characters.

**Checks.**

- For p = 5 and ρ̄ induced from a character of G_(ℚ(√5)) (dihedral with respect to ℚ(√p*)), A2.1 fails while ρ̄ itself is absolutely irreducible.
- For E/ℚ with good ordinary reduction at p, (ρ̄_(E,p)|_(G_(ℚ_p)))ˢˢ = u ⊕ u⁻¹χ̄_cyc with u unramified, u(Frob_p) = a_p mod p; this has the form χ̄ ⊕ χ̄χ̄_cyc exactly when a_p ≡ ±1 mod p, and then the first clause of T1.7 fails.
- For E/ℚ with split multiplicative reduction at ℓ and p ∤ ord_ℓ(Δ_E), ρ̄_(E,p) is ramified at ℓ with dim ρ̄^(I_ℓ) = 1, so A3.7 holds for ℓ ∥ N (Tate curve).
- If (ρ̄|_(G_(ℚ_p)))ˢˢ ≅ χ̄ ⊕ χ̄, the endomorphism algebra of a split ρ̄|_(G_(ℚ_p)) is M_2(𝔽), so N3 fails.
- For a reducible-at-p residual representation with the required ramified local Steinberg shape and µ=1, that witness is allowed by T5.1 and excluded by T1.7. This distinguishes the two source statements rather than conflating their µ hypotheses.
- For 𝔽 = 𝔽_5 and ρ̄|_(G_(ℚ_5)) unramified with Frobenius of characteristic polynomial X² + 2, irreducible over 𝔽_5 since −2 is not a square mod 5, the second clause of A2.1 is vacuous and the endomorphism algebra is 𝔽_25: the local clause of A2.1 holds and N3 fails. Over 𝔽_25 the representation splits and N3 still fails.
- For ρ̄|_(G_(ℚ_p)) = χ̄_1 ⊕ χ̄_2 split with χ̄_1⁻¹χ̄_2 ∉ {1, χ̄_cyc, χ̄_cyc⁻¹}, the second clause of A2.1 holds for both orderings while the endomorphism algebra is 𝔽 × 𝔽, so N3 fails; the non-split extension of the same characters has endomorphism algebra 𝔽.
- For the split scalar representation ρ̄|G_Qp=χ̄⊕χ̄, the endomorphism algebra has dimension four, so N3 and A2.1 fail. For p≥3 the weaker A3.5 ratio exclusion alone does not reject this example, because χ̄_cyc≠1. This distinguishes the two local hypothesis predicates.

*Needs:* LocalGaloisDeformationRings §F.2.5; GL2ModularityLifting §§7.8 and 12.1; Tau Ceti `TauCeti.Multiquadratic.oddPrimeDiscriminant`.

### 3.2 The universal deformation ring is a reduced complete intersection, finite free over Λ, and equal to the Hecke algebra

Under FW Assumption 2.1 ([§3.1](#31-the-residual-hypotheses-of-the-fouquetwan-and-nakamura-theorems)), the universal deformation ring R_Σ(ρ̄) of ρ̄ unramified outside Σ is a flat O-algebra which is a complete intersection of Krull dimension 4 (FW Prop. 2.4); there is a Zariski-dense open X^sm ⊂ Spec R_Σ(ρ̄) containing every point that is ordinary up to twist (if ρ̄|_(G_(ℚ_p)) is reducible) or crystalline and short up to twist (if irreducible), at which Spec R^χ_Σ(ρ̄) → Spec O is formally smooth, and R_Σ(ρ̄) is reduced (Cor. 2.5); the classical points (up to twist) are Zariski dense, so the surjection R_Σ(ρ̄) → 𝕋^Σ_(m_ρ̄) is an isomorphism (Prop. 2.6); and there is a regular sequence (x_1, x_2, x_3) in 𝕋^Σ_(m_ρ̄) making it a finite free module over Λ = O[[X_1, X_2, X_3]], such that classical points with the same image in Spec Λ are all crystalline-short (resp. ordinary) up to twist or none are (Cor. 2.7). Finite flatness over the regular ring Λ does not make R_Σ(ρ̄) regular; the main conjecture over R_Σ(ρ̄) is formulated through perfect complexes and the regular subring Λ.

Assume FW Assumption 2.1; p odd; Σ finite containing p and the ramification of ρ̄. The existence of a classical point of the Serre weight (ClassicalSerreModularity Layer R27.6) and the local deformation rings at p (ordinary or crystalline-short) are inputs. The complete-intersection and density proof here is FW Prop. 2.4–2.6 with its local hypotheses. Do not replace it by the supplier’s unobstructed-ring hypothesis or assume all such rings regular. The Λ-structure depends on the initial classical point; the map Spec 𝕋 → Spec Λ may be ramified, even at classical points, but not at points of X^sm.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Prop. 2.4 and proof, p. 18; Cor. 2.5, p. 19; Prop. 2.6 and Cor. 2.7 with proofs, p. 20. Flatness and the complete-intersection property, the smooth locus X^sm, R = 𝕋 and the finite free Λ-structure. [FW](https://arxiv.org/pdf/2107.13726v3), §1.2, p. 9; §1.2.2, p. 14. R_Σ(ρ̄) ≅ 𝕋 is a reduced complete intersection of relative dimension 3, not known to be factorial; the descent is carried out over the regular ring Λ.

The proof proceeds as follows. Twisting by canonical square roots of characters in 1 + ϖO identifies R_Σ(ρ̄) ≅ R^χ_Σ(ρ̄) ⊗̂ R_Σ(𝟙), reducing to fixed determinant (proof of FW Prop. 2.4). Fixed determinant: the ordinary (resp. crystalline-short) quotient is cut out by a regular sequence (x_2, x_3) and is a finite Hecke algebra at a classical point; a presentation over the local rings gives the complete-intersection property (GlobalGaloisDeformations §§3.7–3.8). Use FW Cor. 2.5 and Prop. 2.6: establish reducedness and density with the specified ordinary/crystalline local quotients, then identify R with T. CompletedCohomologyAndLocalGlobalCompatibility §6.2 supplies a related unobstructed statement; it does not prove this obstructed complete-intersection theorem on its own. Choose x_1 from R_Σ(𝟙) to get the Λ-structure of Cor. 2.7.

**Checks.**

- O[[x,y,z]] has Krull dimension 4. B = O[[x,y,z]][t]/(t² − x²) is finite free of rank 2 over O[[x,y,z]], a complete intersection and reduced (t² − x² = (t − x)(t + x) with distinct prime factors), but singular at its maximal ideal, since t² − x² lies in the square of the maximal ideal. O[t]/(t²) is finite flat over O and not reduced. Finite flatness gives neither regularity nor reducedness; both are proved separately.

*Needs:* §3.1; LocalGaloisDeformationRings §§1.1, 3.4, 6.12, 8.3, F.2.5 and F.2.9; GlobalGaloisDeformations §§3.7 and 3.8; CompletedCohomologyAndLocalGlobalCompatibility §6.2; GL2ModularityLifting §§8.7 and 8.8; DeformationAndDerivedPatchingAlgebra §§3.1 and 3.4; Mathlib `IsRegularLocalRing`; Mathlib `IsReduced`.

### 3.3 Classical points of good reduction type exist and are dense

Under FW Assumption 2.1: (i) if ρ̄|_(G_(ℚ_p)) is irreducible there is a crystalline and short classical point λ_f with R_Σ(ρ̄) ≅ R_Σ(ρ̄_f) (FW Lemma 2.2), and in general a point of Spec 𝕋^Σ_(m_ρ̄) that is crystalline-short, crystalline-short up to the quadratic twist ω^((p−1)/2), good ordinary, or good ordinary up to a quadratic twist (FW Lemma 2.8, used in the proof of Thm 5.1); (ii) X^sm is Zariski dense and the set of specializations that are not Iwasawa-suitable, or at which Spec 𝕋 is not étale over Spec Λ, is contained in a locus of codimension at least one (FW Props 2.6, 3.16).

Retain the stated hypotheses; Iwasawa-suitable in the sense of FW Def. 3.19.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Lemma 2.2 and proof, p. 17; Lemma 2.8 and proof, pp. 20–21, used in the proof of Thm 5.1, p. 73; Prop. 2.6, p. 20; §3.2.2 (Prop. 3.16), p. 29. Existence of crystalline-short or ordinary points and density of good specializations.

The proof proceeds as follows. Lemma 2.2: twist so that the inertial weights are fundamental characters of level 2 and use the Serre weight conjecture (now a theorem) to produce a crystalline short form. Lemma 2.8: the analogous statement covering the reducible-at-p case with ordinary points. Density and codimension from Cor. 2.5 and Prop. 3.16.

**Checks.**

- These are the seed points at which [§4.2](#42-from-pointwise-main-conjectures-at-an-étale-point-to-the-family-over-λ) applies the crystalline theorem of §2.20 or the ordinary theorem of §2.21.
- If ρ̄|_(G_(ℚ_p)) is reducible the seed point given by Lemma 2.8 is ordinary, and no crystalline-short point is asserted; if it is irreducible the point is crystalline-short of weight 2 ≤ k′ ≤ p.
- The congruence of Lemma 2.8 may hold only after twisting by ω^((p−1)/2); for p = 5 this is the quadratic character ω², so the seed point is crystalline-short or ordinary up to that quadratic twist, not necessarily on the nose.

*Needs:* §3.2; ClassicalSerreModularity Layer R27.6; SerreWeightAndLevelOptimisation §2.13; LocalGaloisDeformationRings §8.3.

### 3.4 Fundamental lines over the deformation ring and its quotients

Let A be a quotient of 𝕋^Σ_(m_ρ̄) or of Λ (for example 𝕋, R(𝔞) = 𝕋/𝔞 for a minimal prime 𝔞, Λ, O_Iw or O) and T := T_Σ ⊗ A. The complexes RΓ_et(ℤ[1/Σ], T) and RΓ(G_(ℚ_ℓ), T) are perfect and commute with derived base change (FW Lemma 3.17). The Σ-partial fundamental line is the graded invertible A-module Δ_Σ(T) := Det⁻¹_A RΓ_et(ℤ[1/Σ], T) ⊗_A Det⁻¹_A T(−1)^+ (FW Def. 3.18); for A a domain and ℓ ∈ Σ prime to p put X_ℓ(T) := Det_A RΓ(G_(ℚ_ℓ)/I_ℓ, T^(I_ℓ)) if rank T^(I_ℓ) ≠ 1 and Det_A[A —(1−α_ℓ)→ A] if rank T^(I_ℓ) = 1, and the fundamental line Δ(T) := Δ_Σ(T) ⊗ ⊗_(ℓ∈Σ∖{p})(X_ℓ(T) ⊗ Det⁻¹_A RΓ(G_(ℚ_ℓ), T)). Any ψ: A → A′ induces Δ_A(T) ⊗_A A′ ≅ Δ_(A′)(T′) for the Σ-partial line, and for the full line when ψ is Iwasawa-suitable; when both are defined, Δ_A(T) ≅ Det⁻¹RΓ_et(ℤ[1/p], T) ⊗ Det⁻¹T(−1)^+ (FW Prop. 3.20). In the rank-one correction [A→(1−α_ℓ)A], the two terms are in degrees 0 and 1. Under the acyclic trivialization its determinant basis maps to 1−α_ℓ; the inverse determinant gives (1−α_ℓ)⁻¹. No local X_p is used.

Use the determinant line `detLine` of perfect complexes of PadicMeasuresIwasawaAlgebras §5.1; T(−1)^+ is the complex-conjugation + part.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), §3.3: Lemma 3.17, Defs 3.18–3.19, Prop. 3.20 and proof, pp. 31–32. The Σ-partial and full fundamental lines over quotients of 𝕋 or Λ and their base change. [FW](https://arxiv.org/pdf/2107.13726v3), §1.2.2, pp. 12–14. Why fundamental lines rather than characteristic or Fitting ideals.

The proof proceeds as follows. Perfectness and base change of étale cohomology complexes (Nekovář's Selmer complexes, FW Lemma 3.17). Define Δ_Σ and Δ by the determinant functor; the local factors X_ℓ use the explicit two-term complex when the inertia invariants have rank one. Prop. 3.20: identify Δ with the {p}-partial line through the cone of RΓ(ℤ[1/Σ]) ⊕ ⊕RΓ(G_(ℚ_ℓ)) → ⊕RΓ(G_(ℚ_ℓ)/I_ℓ, T^(I_ℓ)), and check base change of X_ℓ when ranks of inertia invariants agree and ψ(α_ℓ) = α′_ℓ.

The interface is used in [§3.9](#39-the-zeta-trivialization-of-the-fundamental-line) to prove that the zeta morphism trivializes Δ_Σ(T_Σ) inside Frac Λ; in [§4.3](#43-fouquetwans-universal-family-main-conjecture) to establish Δ_Σ(T_Σ) ≅ Λ; in [§4.6](#46-euler-factors-tor-terms-and-the-regular-subring-in-specialization) to the Euler-factor lines X_ℓ and their base change at non-Iwasawa-suitable points; and in ModularIwasawaMainConjectures (supplier gap automorphic-endpoints) in that roadmap's formulation.

**API.**

- Δ_Σ(T) = Det⁻¹RΓ_et(ℤ[1/Σ], T) ⊗ Det⁻¹T(−1)^+, a graded invertible A-module.
- The full line Δ(T) is Δ_Σ(T) tensored with X_ℓ(T)⊗Det⁻¹RΓ(G_Qℓ,T) for ℓ∈Σ∖{p}.
- X_ℓ=Det[A→(1−α_ℓ)A] in degrees 0,1 in rank one. Its acyclic trivialization has image (1−α_ℓ)A when 1−α_ℓ≠0.
- Δ_Σ(T) ⊗_A A′ ≅ Δ_Σ(T ⊗ A′) for every ring map A → A′.
- Δ(T) ⊗_(A,ψ) A′ ≅ Δ(T′) for ψ Iwasawa-suitable (FW Prop. 3.20).
- Δ_A(T) ≅ Det⁻¹RΓ_et(ℤ[1/p], T) ⊗ Det⁻¹T(−1)^+ when the latter is defined.
- Over a regular domain, a trivialization of Δ inside Frac A is A itself iff the corresponding characteristic ideals agree (using the determinant/characteristic criterion stated here pointwise).
- The determinant functor transports isomorphisms of perfect complexes and their distinguished-triangle identifications; specified trivializations agree iff their generic maps agree.

**Checks.**

- For A = O_Iw and T = T(f)_Iw with H¹ free of rank one and H² torsion, Δ_Σ(T) is concentrated in degree zero and is a free O_Iw-module of rank one.
- For [A→d A] in degrees 0,1 with d≠0, the standard determinant basis maps to d, giving the fractional lattice dA; Det⁻¹ gives d⁻¹A. For d a unit both are A. This fixes the sign rather than leaving ±1 unspecified.
- For ψ: 𝕋 → R(𝔞) the base change of Δ_Σ(T_Σ) is Δ_Σ(T(𝔞)) — the left column of FW (1.2.2).
- Take A=k[[x,y]] and M=A/(x,y). M has finite projective dimension two, characteristic divisor zero and divisorial characteristic ideal A, but Fitt₀(M)=(x,y), which is not invertible. Replacing its perfect-complex determinant by this Fitting ideal loses invertibility even though Fitting ideals themselves commute with module base change.
- Fitting ideals commute with ordinary module base change but need not be invertible and do not encode the alternating determinant of all cohomology. Characteristic divisors require the appropriate normal-ring hypotheses and are principal only in a UFD. Perfect-complex determinant lines commute with derived base change; the full local correction also requires Iwasawa-suitability.
- At α=1 the Euler differential is zero. The determinant line still exists, but its acyclic fractional trivialization does not; no inverse of 1−α is formed.

*Needs:* §3.2; PadicMeasuresIwasawaAlgebras §5.1; SelmerIwasawaCohomology §§2.21, 3.13 and 3.14.

### 3.5 Completed (co)homology localized at ρ̄ and its local–global factorization

Under Nakamura (N1),(N3),(N4), use the intrinsic BM co-Whittaker factor B_(Σ_0) and its smooth dual B^∨_(Σ_0). In NAK-v2 Cor. 2.5 (p. 25), completed Borel–Moore homology factors as (π_p^m)^*⊗(ρ^m)^*⊗B_(Σ_0); the factor is the untilde π of that version. NAK-v2 Thm 2.2 (p. 20) describes completed cohomology using the smooth-dual factor, denoted tilde π there. The zeta construction uses the BM factor as in NAK-v2 (47), p. 63; do not identify B with B^∨. In the GL₂ families used by FW Props 6.7–6.9, retain the minimal-lift hypothesis and let the essential-vector level be the common conductor exponent. Its invariants are free of rank one and commute with the specified classical base change; no assertion is made across a conductor jump. This last property uses the explicit GL₂ classification, not merely the rank-one top derivative in the definition of co-Whittaker.

Assume (N3), (N4) and p ≥ 3; for p ≥ 5 this is Nakamura's setting (N1). The Borel–Moore factorization is CompletedCohomologyAndLocalGlobalCompatibility §4.7(1)–(2), stated for p ≥ 3; the projective envelope and its removal from Hom are PadicLocalLanglandsForGL2Qp §§5.8–5.9, also for p ≥ 3, which is the content of FW's remark after Thm 3.6 for the envelope. The freeness at potentially semistable points used in §3.8 is gap:paskunas-p3-freeness at p = 3. The co-Whittaker families of FW Prop. 6.8 are those of SmoothRepresentationsOfLocalGroups §SR.5.2 with gap:gl2-essential-vectors; its conditional general local Langlands family is not used.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), Thm 2.2, p. 20; Cor. 2.5 (§2.3), p. 25; §4.1 (47), p. 63. The factorization of completed cohomology and its dual for completed Borel–Moore homology, used to define the zeta morphism. [FW](https://arxiv.org/pdf/2107.13726v3), Props 6.7–6.9, pp. 77–78; Thm 6.10, p. 79. Co-Whittaker modules in families, essential vectors and Emerton's theorem in FW's form.

The proof proceeds as follows. Import Emerton's local–global compatibility (CompletedCohomologyAndLocalGlobalCompatibility §§4.4–4.5 and 4.7) and Paškūnas's description of the Montréal functor (PadicLocalLanglandsForGL2Qp §§5.5 and 5.7–5.9). Use NAK-v2 Cor. 2.5 for BM homology and its untilde co-Whittaker factor; use Thm 2.2 for cohomology and the smooth-dual factor. Track the factors by their intrinsic property, not by the tilde notation. Essential vectors in families: co-Whittaker modules are unique (FW Prop. 6.7), have the explicit shapes of Prop. 6.8, and their K_1(ϖ^m)-invariants at the common conductor exponent are free of rank one with base change (Prop. 6.9). Retain the minimal-lift/unchanged-monodromy hypothesis of §6.2; a specialization with conductor drop is outside this assertion.

**Checks.**

- If Σ_0 = ∅ (ρ̄ unramified outside p), the co-Whittaker factor is 𝕋 itself and the factorization reduces to (π_p^m)^* ⊗ (ρ^m)^*.
- For an unramified principal series of GL₂(ℚ_ℓ) the K₁(ℓ^m)-invariants have rank m + 1; rank one occurs only at the conductor exponent m = 0, which is why the essential vector is taken at the common conductor exponent and no assertion is made across a conductor jump.
- (N4) excludes ρ̄_p ≅ (1 ∗; 0 ε^(±1)) ⊗ χ; for such ρ̄_p the envelope statements of PadicLocalLanglandsForGL2Qp §5.8 are not available and the factorization is not asserted.

*Needs:* §3.1; CompletedCohomologyAndLocalGlobalCompatibility §§4.1, 4.4, 4.5 and 4.7; PadicLocalLanglandsForGL2Qp §§5.5 and 5.8; SmoothRepresentationsOfLocalGroups §SR.5.2; SmoothRepresentationsOfLocalGroups (gap:gl2-essential-vectors).

### 3.6 The G_Σ-equivariant zeta morphism on completed homology

For N ≥ 3, n ≥ 1 with prime(Np) = Σ and (n, Σ) = 1, Nakamura constructs from Kato's full-level Hecke-linear zeta classes a ℤ_p[GL_2(ℤ/N)]-linear map z^Iw_(N,n)(k, −): H¹(Y(N), 𝒱^*_k)(1) → H¹_Iw(ℤ[1/Σ_n, ζ_n], H¹(X(N), j_*𝒱^*_k(2)))_(Q_(k,n)) (Prop. 3.8, Q_(k,n) the multiplicative set of the smoothing factors); after localizing at the non-Eisenstein ideal of ρ̄ it lands in the unlocalized Iwasawa cohomology of H¹(Y(N), 𝒱^*_k)_ρ̄(2) (Cor. 3.14, Prop. 3.15); the limits over p-power level define a continuous 𝕋_(ρ̄,Σ)[G_Σ]-linear map z^Iw_(Σ,n,ρ̄): H̃^BM_(1,ρ̄,Σ) → H¹_Iw(ℤ[1/Σ_n, ζ_n], H̃^BM_(1,ρ̄,Σ)(1)) with z(τv) = σ₋₁z(v) and the Euler-system norm relations (Thm 3.16); and the weight-k maps are recovered from weight two by tensoring over O[[K_m]] with W = Symᵏ⁻²(O²)^* (Prop. 3.17).

Localization at the non-Eisenstein maximal ideal of ρ̄ (absolutely irreducible) is what makes H¹(X(N), j_*𝒱) and H¹(Y(N), 𝒱) agree and the map integral.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), §3.2 Prop. 3.8 (p. 48), Cors 3.10–3.11 (p. 52); §3.3 Cor. 3.14, Prop. 3.15 (p. 56); §3.4 Thm 3.16 (p. 60), Prop. 3.17 (p. 61) — statements. The equivariant zeta morphisms at finite level, their integrality after localization, the limit on completed homology and the weight comparison.

The proof proceeds as follows. Prop. 3.8: assemble Kato's classes c,d-z_(N,n)(k, r, r′) into a Hecke- and GL_2(ℤ/N)-equivariant map, removing the c,d smoothing in the localization Q_(k,n) (following Fukaya–Kato). Use NAK-v2 Prop. 3.15 to remove the smoothing denominators after non-Eisenstein localization, via freeness and the finite-level comparison. Its smoothing coefficient is c², as in arXiv v2, and this comparison needs c². Thm 3.16: pass to the limit over N_0p^∞ and over levels in Σ_0; Prop. 3.17 compares weights.

The interface is used in [§3.7](#37-nakamuras-universal-zeta-morphism) to z^Iw_(Σ,n,ρ̄) is transported through φ_1 to define z_(Σ,n)(ρ^m); in [§3.8](#38-the-universal-zeta-morphism-specializes-to-katos) to Prop. 3.17 and the finite-level maps compute the specialization at classical points.

**API.**

- The map z^Iw_(N,n)(k, −) is ℤ_p[GL_2(ℤ/N)]-linear with values in the Q_(k,n)-localized Iwasawa cohomology.
- After localization at ρ̄ the map is integral (no Q_(k,n)-denominators).
- The localized map z^Iw_(Σ,n,ρ̄) on H̃^BM_(1,ρ̄,Σ) is continuous and 𝕋_(ρ̄,Σ)[G_Σ]-linear.
- z(τv) = σ₋₁z(v) for complex conjugation τ.
- Cor ∘ z_(Σ,nl) = z_(Σ,n) if l | n and P_l(σ_l⁻¹)z_(Σ,n) if (l, n) = 1, l ∉ Σ.
- Use the completed tensor W⊗_(O[[K_m]])H̃^BM_1[1/p] in NAK-v2 Prop. 3.17, not a plain tensor over O. It is identified with the indicated finite-level weight-k cohomology, and the induced zeta maps commute.
- The continuous limit map is determined by its finite-level compatible maps. Its weight maps retain the K_m coinvariants.

**Checks.**

- At k=2, W is the trivial representation, so tensoring over O[[K_m]] takes K_m-coinvariants and gives the finite-level comparison. It does not identify the entire infinite-level homology with a finite-level group by an ordinary tensor.
- For l | n, corestriction from level nl to n is the identity on the zeta morphism (no Euler factor).
- For j=0 and the trivial cyclotomic character, the augmentation of c²−c²⁻ʲσ_c is zero, so the smoothing element cannot be inverted integrally there. This rejects a universal unsmoothing-by-unit argument; it does not assert nonintegrality of every Eisenstein component.
- At finite level N and weight k the map agrees with the full-level Hecke-linear zeta classes of KatoEulerSystems §2.3 after removing the smoothing factors; a construction omitting the smoothing factors c² − c²⁻ʲσ_c would differ from them by those factors.

*Needs:* §3.5; KatoEulerSystems §§2.1, 2.2 and 2.3; PadicFamilies §4.0.1; SelmerIwasawaCohomology §3.1.

### 3.7 Nakamura's universal zeta morphism

Let ρ̄: G_ℚ → GL_2(𝔽) satisfy (N1)–(N5) of [§3.1](#31-the-residual-hypotheses-of-the-fouquetwan-and-nakamura-theorems) (or (N1), (N3), (N4) with R_(ρ̄,Σ) replaced by the promodular ring 𝕋_(ρ̄,Σ)), with universal deformation ρ^u over R_(ρ̄,Σ). There is a family of R_(ρ̄,Σ)-linear maps z_(Σ,n)(ρ^u): (ρ^u)^* → H¹_Iw(ℤ[1/Σn, ζ_n], (ρ^u)^*(1)), n ≥ 1 prime to Σ, such that (i) z_(Σ,n)(ρ^u)(τv) = σ₋₁z_(Σ,n)(ρ^u)(v) for complex conjugation τ; (ii) Cor ∘ z_(Σ,nl)(ρ^u) = z_(Σ,n)(ρ^u) if l | n and P_l(σ_l⁻¹)·z_(Σ,n)(ρ^u) if (l, n) = 1; (iii) at every point x_f of Spec R_(ρ̄,Σ)(ℚ̄_p) attached to a newform f, z_(Σ,1)(f) = ∏_(l∈Σ∖{p}) P_(f,l)(σ_l⁻¹)·z(f) with P_(f,l)(u) = det(1 − Frob_l u | ρ_f^(I_l)) (Nakamura Thm 1.1, Cor. 4.2, Thm 4.3). Condition (i) makes z_(Σ,n)(ρ^u) an R ⊗̂ Λ_n-linear map on (ρ^u)^* ⊗̂_(ℤ_p[±1]) Λ_n (Remark 1.2). It is defined by transporting z^Iw_(Σ,n,ρ̄) along φ_1 ([§3.5](#35-completed-cohomology-localized-at-ρ̄-and-its-localglobal-factorization)), factoring out the projective envelope P̃ and applying the Whittaker functor Ψ_(Σ_0) at the primes of Σ_0 (§4.1, Lemma 4.1).

The envelope construction assumes (N1)–(N5), or (N1), (N3), (N4) over the promodular ring. For FW Assumptions 2.1 and 3.5 with N3, the same route at p = 3 uses PadicLocalLanglandsForGL2Qp §§5.8–5.9 and gap:paskunas-p3-freeness, retaining both local cyclotomic exclusions. Without N3, use gap:fw-zeta-local-descent for the construction and its classical comparison. This supplies the full FW Theorem 3.6 interface without asserting envelope cancellation for a local representation with nonscalar endomorphisms.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), Thm 1.1 and Remark 1.2, pp. 4–5; §4.1 (47)–(48), Lemma 4.1 and the construction, pp. 63–65; Cor. 4.2, p. 65. The universal zeta morphisms and their τ-equivariance and Euler-system relations. [FW](https://arxiv.org/pdf/2107.13726v3), §3.2.1, Assumption 3.5 and Thm 3.6, p. 24. Fouquet–Wan's statement of Nakamura's theorem and the removal of p ≥ 5.

The proof proceeds as follows. Lemma 4.1: φ_1 induces an isomorphism H¹_Iw(ℤ[1/Σ_n, ζ_n], H̃^BM_(1,ρ̄,Σ)(1)) ≅ (π^m_p)^* ⊗̂ H¹_Iw(ℤ[1/Σ_n, ζ_n], (ρ^m)^*(1) ⊗ B^m_(Σ_0)), via a perfect complex computing Iwasawa cohomology. Remove the factor (π^m_p)^* using Paškūnas's identification of P̃ with the dual of the universal deformation of π̄ (PadicLocalLanglandsForGL2Qp §5.9), and apply the Whittaker functor to B^m_(Σ_0), which is co-Whittaker so that Ψ_(Σ_0)(B) ≅ 𝕋 (§4.1). This cancellation uses N3 and is confined to that branch. For the other FW local cases the descent and its comparison come from gap:fw-zeta-local-descent. Properties (i)–(ii) on the envelope branch follow from Thm 3.16 (Cor. 4.2); (iii) is [§3.8](#38-the-universal-zeta-morphism-specializes-to-katos).

The interface is used in [§3.9](#39-the-zeta-trivialization-of-the-fundamental-line) to z_Σ trivializes the fundamental line Δ_Σ(T_Σ); in [§4.7](#47-congruences-between-katos-zeta-morphisms) to congruent newforms have congruent Euler-corrected zeta morphisms because they are specializations of one z_(Σ,n)(ρ^u); in [§4.8](#48-the-residual-zeta-morphism-and-the-space-of-points-xρ̄) to base change to 𝔽 gives z_(Σ,n)(ρ̄).

**API.**

- z_(Σ,n)(ρ^u): (ρ^u)^* → H¹_Iw(ℤ[1/Σn, ζ_n], (ρ^u)^*(1)) is R_(ρ̄,Σ)-linear.
- z(τv) = σ₋₁z(v); hence R ⊗̂ Λ_n-linearity on (ρ^u)^* ⊗̂_(ℤ_p[±1]) Λ_n.
- The maps satisfy the Euler-system norm relations in n.
- Base change along x: R_(ρ̄,Σ) → A. Iwasawa cohomology is computed by a perfect complex C, and C ⊗ᴸ_R A computes the Iwasawa cohomology of ρ_x (derived base change). The specialized morphism z_(Σ,n)(ρ_x) is z_(Σ,n)(ρ^u) ⊗ A composed with the natural map H¹(C) ⊗_R A → H¹(C ⊗ᴸ_R A); that map is an isomorphism only under a Tor-vanishing condition (for the quotient by one nonzerodivisor f, with C concentrated in degrees [0, 2], it is injective with cokernel H²(C)[f]), and otherwise the base-change spectral sequence is retained.
- For Σ ⊂ Σ′, z_(Σ′,n)(ρ^m_(Σ′)) ⊗ id = ∏_(l∈Σ′∖Σ) P_l(σ_l⁻¹)·z_(Σ,n)(ρ^m_Σ) (Nakamura (77)).
- At a newform point, z_(Σ,1)(f) = ∏_(l∈Σ_0) P_(f,l)(σ_l⁻¹)·z(f) (Thm 4.3).
- On the N3 branch the map is uniquely specified by the equivariant completed-homology construction after the projective-envelope and Whittaker identifications; compatible changes of those identifications give the same transported morphism.

**Checks.**

- At p = 5, two unramified characters with Frobenius values 1 and 2 have ratio 2 (or 3 in reverse order), neither 1 nor χ̄_cyc since the latter is nontrivial on inertia. Their split sum has endomorphism algebra 𝔽₅ × 𝔽₅, of dimension 2. It uses gap:fw-zeta-local-descent, whereas a nonsplit extension of these characters has only scalar endomorphisms, of dimension 1, and can use envelope cancellation.
- For eigenvalues 1, 2, 3, 4 the reciprocal polynomial is 1 − 10X + 35X² − 50X³ + 24X⁴, so minus its X coefficient is 10, the trace. Minus its cubic coefficient is 50. The monic characteristic polynomial is X⁴ − 10X³ + 35X² − 50X + 24; conversion preserves the trace 10.

- Derived against underived base change: for A = k[[X]] and C = [A —X→ A] in degrees 1 and 2, H¹(C) = 0 while H¹(C ⊗ᴸ_A k) = k, the difference being Tor₁ᴬ(A/(X), k) = k. The natural map H¹(C) ⊗ k → H¹(C ⊗ᴸ k) is 0 → k, so an API asserting an isomorphism of H¹ after specialization would be false here.
- For l ∉ Σ, (l, n) = 1, Cor ∘ z_(Σ,nl) = P_l(σ_l⁻¹)·z_(Σ,n) with P_l(u) = det(1 − Frob_l u | ρ^u) of degree two in u.
- If Σ = {p} (ρ̄ unramified outside p), the Euler factor in the classical comparison of the API is empty and z_(Σ,1)(f) = z(f).
- At a weight-two newform of an elliptic curve E of conductor N, the specialization is ∏_(l | N) P_(E,l)(σ_l⁻¹) times Kato's zeta morphism of E (KatoEulerSystems §5.4).
- For residually reducible ρ̄ (Eisenstein) the construction is not available: Emerton's factorization and Kato's Λ-freeness of H¹_Iw are only known for absolutely irreducible ρ̄ (Nakamura Remark 1.2).
- It is the morphism FW call z_Σ: T_Σ(−1)^+ → H¹(ℤ[1/Σ], T_Σ) (FW Thm 3.6) after the identifications of FW §3.2.1.

*Needs:* §§3.2, 3.5 and 3.6; PadicLocalLanglandsForGL2Qp §§5.8 and 5.9; SmoothRepresentationsOfLocalGroups §SR.5.2; SelmerIwasawaCohomology §3.1; CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent); PadicLocalLanglandsForGL2Qp (gap:paskunas-p3-freeness).

### 3.8 The universal zeta morphism specializes to Kato's

Under the assumptions of Nakamura §4 ((N1), (N3), (N4)), for every modular point x_f ∈ Spec(𝕋_(ρ̄,Σ))(E) attached to a newform f ∈ S_k(Γ_1(N_f))^new of weight k ≥ 2 and every n ≥ 1 prime to Σ, z_(Σ,n)(f) = ∏_(l∈Σ_0) P_(f,l)(σ_l⁻¹)·z_n(f) as maps V′_1(f)_E → H¹_Iw(ℤ[1/Σn, ζ_n], V′_1(f)_E(1)) under V′_1(f)_E ≅ ρ_f^* (55), where z_n(f) is Kato's (Nakamura-twisted) zeta morphism and Σ_0 = Σ ∖ {p}; the equality does not depend on the choice of (55) since End_(E[G_ℚ])(ρ_f) = E (Nakamura Thm 4.3, Remark 4.4). In particular the morphism specializes to the Kato class of KatoEulerSystems §§5.1 and 5.4.

Assume (N1), (N3), (N4); x_f modular. For the full FW class without N3 the corresponding classical comparison is part of gap:fw-zeta-local-descent; this theorem does not apply the envelope argument there. At p = 3 the freeness of Nakamura Theorem 4.7 is gap:paskunas-p3-freeness.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), Thm 4.3 and Remark 4.4, PDF p. 66; Cor. 4.8 and Prop. 4.9, pp. 69–70; motivic comparison in §4.4, pp. 70–74. The specialization theorem and its proof through Kisin's and Paškūnas's results. [FW](https://arxiv.org/pdf/2107.13726v3), Thm 3.6, p. 24. The diagram expressing that z_Σ specializes to z(f)_(Σ,Iw) at classical points.

The proof proceeds as follows. Let τ be the Galois type of ρ_f|_(G_(ℚ_p)) and ⋄ = cr or st; x_f factors through Kisin's potentially semistable (crystalline) quotient R^⋄_p(k, τ) (Nakamura Thm 4.5). Use NAK-v2 Cor. 4.8 and Prop. 4.9 with M^⋄(k,τ), the algebraic dual and σ^⋄(τ), tensoring over O[[K_0]] with completed BM homology. The type/coinvariant construction is essential and is not the plain tensor with W from a trivial local type. Under these identifications z_(Σ,n)(f) is the base change of Ψ_(Σ_0)(z^Iw_(Σ_0,n,ρ̄)(k, σ^⋄(τ), −)); comparing motivic structures with Kato's construction (Nakamura §4.4, (68)–(76), pp. 71–74) gives the equality with the Euler factors at Σ_0.

**Checks.**

- The Euler factors at Σ_0 are exactly those of the classical comparison of §3.7; dropping them would contradict the change-of-Σ formula (77), p. 78.
- For Σ_0 = {ℓ} with f Steinberg at ℓ, P_(f,ℓ)(u) = 1 − a_ℓu has degree one, since ρ_f^(I_ℓ) is a line; using the degree-two unramified polynomial there gives the wrong factor.
- For Σ_0 = ∅ the comparison is z_n(f) itself, with no correction factor.

*Needs:* §§3.6 and 3.7; KatoEulerSystems §§5.1 and 5.4; LocalGaloisDeformationRings §3.4; PadicLocalLanglandsForGL2Qp §§5.7, 5.11, 6.1 and 6.6; PadicLocalLanglandsForGL2Qp (gap:paskunas-p3-freeness); CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent).

### 3.9 The zeta trivialization of the fundamental line

Let z_Σ: T_Σ(−1)^+ → H¹_et(ℤ[1/Σ], T_Σ) be Nakamura's zeta morphism (FW Thm 3.6). Since H²_et(ℤ[1/Σ], T_Σ) is torsion and H¹ has generic rank equal to that of T_Σ(−1)^+ over 𝕋 (or over Λ), z_Σ determines an injective trivialization triv_(z_Σ): Δ_Σ(T_Σ) ↪ Q(𝕋^Σ_(m_ρ̄)), equivalently an isomorphism Δ_Σ ≅ (x/y)𝕋 for an invertible fractional ideal (FW (1.2.1)); over Λ it gives triv_(z_Σ): Δ_Σ(T_Σ) ↪ Frac Λ (Conj. 3.30's map). For every specialization λ: 𝕋 → R(𝔞) to a minimal prime and every classical point λ_f: R(𝔞) → O_Iw there are commutative diagrams relating triv_(z_Σ), triv_(z(𝔞)) and triv_(z(f)_Iw) (FW (1.2.2), (1.2.3), Props 3.22–3.23), and for Iwasawa-suitable λ the same holds for the full fundamental lines with Euler factors. The Λ-valued map is obtained by the determinant after restriction of scalars; it is the norm construction, not an identification Q(T)=Frac Λ. Define the dual trivialization t^∨ on Δ_Σ⁻¹; if t^∨(Δ_Σ⁻¹)=αΛ then t(Δ_Σ)=α⁻¹Λ. FW Prop. 5.5 proves integrality for this dual image.

Assume FW Assumptions 2.1, 3.5; the specializations in the diagrams with full lines are Iwasawa-suitable (Def. 3.19). On each minimal component the zeta morphism becomes an isomorphism on the one-dimensional generic source and target. Establish this using classical-point density and Kato nonvanishing together with FW Lemma 3.13. Generic rank one and torsion H² alone do not suffice.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), §1.2.2 (1.2.1)–(1.2.3), pp. 13–14; §3.3 Props 3.22–3.23, p. 33; Conj. 3.30, p. 36. The trivialization defined by the zeta morphism and its compatibility diagrams. [FW](https://arxiv.org/pdf/2107.13726v3), Def. 3.19, p. 31; Props 3.14–3.16, pp. 27–29. Iwasawa-suitable specializations.

The proof proceeds as follows. Torsion of H² and the rank of H¹ over the total fraction ring (Kato's results at classical points, density) make Det⁻¹RΓ ⊗ Det⁻¹T(−1)^+ ⊗ Q(𝕋) canonically trivial once a generator of the image of z_Σ is chosen. Compatibility with base change ([§3.4](#34-fundamental-lines-over-the-deformation-ring-and-its-quotients)) and with specialization of z_Σ ([§3.8](#38-the-universal-zeta-morphism-specializes-to-katos)) gives the diagrams (FW Props 3.22–3.23). Over Λ, view T_Σ as a free Λ-module of rank 2d and repeat (FW proof of Prop. 5.5).

The interface is used in [§3.10](#310-katos-generalized-main-conjecture-for-the-universal-family-and-its-specializations) to the conjectures assert the image of triv is the whole ring; in [§4.1](#41-the-zeta-trivialization-over-λ-is-integral) to FW Prop. 5.5 puts the image of the dual map on Δ⁻¹ inside Λ; in [§4.4](#44-from-the-family-over-λ-to-every-classical-point) to the diagram at a classical point is the one used in the limit argument.

**API.**

- The zeta trivialization triv_(z_Σ): Δ_Σ(T_Σ) ↪ Q(𝕋) is injective with image an invertible fractional ideal (x/y)𝕋.
- Apply determinant after restricting the finite free T-representation to Λ; generically this is the determinant norm from the finite Λ-algebra. It does not identify its total fraction algebra with Frac Λ.
- It commutes with base change along 𝕋 → R(𝔞) and R(𝔞) → O_Iw (FW diagrams (1.2.2) and (1.2.3)).
- For Iwasawa-suitable λ the same holds for the full lines Δ with the Euler-factor lines X_ℓ.
- Keep t(Δ_Σ)=α⁻¹Λ and t^∨(Δ_Σ⁻¹)=αΛ distinct. Both are unit lattices exactly when α∈Λ^×.
- At a classical point, triv_(z(f)_Iw) is Kato's trivialization of Δ(f)_Iw (FW Thm 3.4).
- Two trivializations of the same invertible module agreeing after extension to the total fraction algebra agree; scalar extension uses the determinant norm.

**Checks.**

- At a classical point with O_Iw regular, triv_(z(f)_Iw)(Δ) = O_Iw iff char H² = char(H¹/z(f)_Iw) (Kato's main conjecture).
- For residually reducible ρ̄ no z_Σ is available and the zeta trivialization is not defined.
- At the finite étale fiber used in FW Prop. 5.7, the dual αΛ specializes to the product of the dual pointwise lattices. The primal lattice specializes to the inverse product; this detects swapping Δ and Δ⁻¹.
- If the deformation problem is unobstructed, 𝕋 = Λ is itself a power series ring and the trivializations over 𝕋 and over Λ coincide.
- The universal main conjecture is the statement that the image of triv_(z_Σ) is 𝕋 (resp. Λ); over the non-factorial 𝕋 this cannot be deduced from pointwise statements, which is why the family statement is made over Λ.
- The zero morphism between two free rank-one modules, with H²=0, has zero determinant and gives no injection into the total fraction algebra; it is excluded by the componentwise nonvanishing hypothesis.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent); §§3.2, 3.4, 3.7 and 3.8; KatoEulerSystems §4.4; PadicMeasuresIwasawaAlgebras §5.1.

### 3.10 Kato's generalized main conjecture for the universal family and its specializations

For an Iwasawa-suitable λ:T→S, FW Conj. 3.25 is the proposition that the Σ-partial zeta trivialization on the cyclotomic deformation T_(λ,Iw) has image S_Iw in Q(S_Iw). When S is a domain it also asserts the corresponding full-line trivialization Δ_(S_Iw)(T_(λ,Iw))≅S_Iw. The coefficient ring is S_Iw, not S. At a classical point Conj. 3.24 is the full O_Iw-line statement, equivalent to Kato’s characteristic-ideal equality. Conj. 3.27 states the minimal-component full-line assertion. Conj. 3.30 is the Σ-partial Λ-line statement for the regular subring Λ=O[[X_1,X_2,X_3]]; Conj. 3.26 is the separate stronger assertion over T itself.

Assume the propositions are stated, not assumed; Λ-structure as in [§3.2](#32-the-universal-deformation-ring-is-a-reduced-complete-intersection-finite-free-over-λ-and-equal-to-the-hecke-algebra).

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Conjs 3.24–3.27, p. 34; Conj. 3.30, p. 36; Conj. 1.5, p. 6; Thm 1.8, p. 8. The pointwise, minimal-prime and universal-family forms of Kato's generalized main conjecture.

The proof proceeds as follows. Define each conjecture as the proposition that the image of the corresponding trivialization is the unit fractional ideal. Record the implications: Conj. 3.26 (over 𝕋) ⇒ Conj. 3.30 (over Λ) by restriction of scalars; Conj. 3.30 ⇒ Conj. 3.24 at classical points is FW Prop. 5.8 ([§4.4](#44-from-the-family-over-λ-to-every-classical-point)).

The interface is used in [§4.3](#43-fouquetwans-universal-family-main-conjecture) to prove Conj. 3.30; in [§4.5](#45-fouquetwans-main-conjecture-at-every-point-of-the-family) to prove Conj. 3.24 at every classical point under FW Thm 5.1's hypotheses; and in ModularIwasawaMainConjectures (supplier gap automorphic-endpoints), which restates the pointwise conjecture in its own formulation.

**API.**

- Conj. 3.25 for λ:T→S is the Σ-partial S_Iw assertion, with its full-line version when S is a domain. At λ(f)_Iw use Conj. 3.24 over O_Iw.
- Conj. 3.27 is the corresponding assertion over R(𝔞), Conj. 3.30 the assertion over Λ, and Conj. 3.26 the assertion over 𝕋, a separate and stronger proposition.
- The conjecture over 𝕋 (Conj. 3.26) implies the conjecture over Λ (Conj. 3.30).
- At a classical point, the pointwise conjecture (Conj. 3.24) is Kato's main conjecture char H² = char(H¹/z(f)_Iw) by the determinant/characteristic criterion of [§3.4](#34-fundamental-lines-over-the-deformation-ring-and-its-quotients).
- These are propositions attached to a specified representation, zeta morphism and trivialization; isomorphisms preserving those data preserve the propositions.

**Checks.**

- If 𝕋 = Λ (unobstructed), the conjectures over 𝕋 and over Λ are the same proposition.
- For a rank-one line A·e over A=O[[Γ]], the fractional trivializations t(e)=1 and t(e)=ϖ have images A and ϖA respectively. Only the first has unit image, although both become isomorphisms over Frac A. A fraction-field isomorphism alone is not the conjecture.
- For a weight-two GL₂-type abelian variety with L(A,1) ≠ 0, the pointwise conjecture at its form compares char H² with char(H¹/z(f)_Iw); FW Cor. 5.4 turns it into the p-part of the Birch–Swinnerton-Dyer formula by a further comparison that is outside this roadmap's scope, so no Birch–Swinnerton-Dyer statement is attached to these propositions.
- For A=k[[x,y]], M=A/(x,y) has Fitt₀(M)=(x,y) but zero characteristic divisor. Its determinant comparison is divisorial; replacing the zeta-basis assertion by a bare Fitting containment confuses these different invariants.
- The conjecture for the component R(𝔞) (Conj. 3.27) implies the pointwise conjecture at every classical point of R(𝔞) that is Iwasawa-suitable, by base change of the zeta trivialization (§3.9).
- If t(e)=γ−1, its image (γ−1)A is proper and its specialization at γ=1 vanishes. This rejects replacing the O[[Γ]]-line assertion by a statement over O or specializing an acyclic trivialization at a zero Euler factor. The regular-subring assertion of FW Thm 1.8 still uses Λ, separately from the stronger assertion over 𝕋.

*Needs:* §§3.4 and 3.9; KatoEulerSystems §§5.1, 5.4 and 7.2; PadicMeasuresIwasawaAlgebras §5.1.

### Examples

Let A be a DVR with uniformizer ϖ and take C=[A→ϖ²A] in degrees 0,1. The standard determinant basis maps to ϖ² under the acyclic generic trivialization, so its image is ϖ²A; the inverse determinant has image ϖ⁻²A. Setting the differential equal to 1 gives A on both sides. Setting it equal to zero preserves the determinant line but destroys the acyclic trivialization. These values fix the direction of every local correction.

For A=k[[X,Y]] and M=A/(X,Y), localization at every height-one prime kills M, so its characteristic divisor is zero and its divisorial characteristic ideal is A. Its zeroth Fitting ideal is (X,Y). Hence a Fitting ideal cannot replace the invertible determinant line. Likewise, the zero map A→A has rank-one source and target and no H² obstruction but cannot give the zeta trivialization: nonvanishing on every generic component is needed.

For the Γ₀ setting of FW, k is even and p is odd. A scalar semisimplification χ̄⊕χ̄ would give an even cyclotomic exponent 2a modulo the even integer p−1, while the determinant exponent k−1 is odd. At p=5 the equation 2a≡k−1 (mod 4) has no solution. The local exclusions of FW (§3.1) and the freeness at p = 3 (gap:paskunas-p3-freeness) are separate inputs, which this parity count does not replace.

### Dependencies

Suppliers: ClassicalSerreModularity Layer R27.6; CompletedCohomologyAndLocalGlobalCompatibility §§4.1, 4.4, 4.5, 4.7 and 6.2; DeformationAndDerivedPatchingAlgebra §§3.1 and 3.4; GL2ModularityLifting §§7.8, 8.7, 8.8 and 12.1; GlobalGaloisDeformations §§3.7 and 3.8; KatoEulerSystems §§2.1, 2.2, 2.3, 4.4, 5.1, 5.4 and 7.2; LocalGaloisDeformationRings §§1.1, 3.4, 6.12, 8.3, F.2.5 and F.2.9; PadicFamilies §4.0.1; PadicLocalLanglandsForGL2Qp §§5.5, 5.7, 5.8, 5.9, 5.11, 6.1 and 6.6, (gap:paskunas-p3-freeness); CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent); PadicMeasuresIwasawaAlgebras §5.1; SelmerIwasawaCohomology §§2.21, 3.1, 3.13 and 3.14; SerreWeightAndLevelOptimisation §2.13; SmoothRepresentationsOfLocalGroups §SR.5.2, (gap:gl2-essential-vectors). Libraries: Mathlib `IsReduced`; Mathlib `IsRegularLocalRing`; Tau Ceti `TauCeti.Multiquadratic.oddPrimeDiscriminant`.

## Layer 4: Integral family trivializations and specialization

### 4.1 The zeta trivialization over Λ is integral

Under the hypotheses of FW Thm 5.1, let t_Λ:Δ_Σ(T_Σ)↪Frac Λ be the zeta trivialization and t_Λ^∨:Δ_Σ(T_Σ)⁻¹↪Frac Λ its dual. FW Prop. 5.5 gives t_Λ^∨(Δ_Σ⁻¹)=αΛ with α∈Λ. Equivalently the primal image is α⁻¹Λ. This is an integrality bound on the dual lattice; equality with Λ still requires the seed-point argument.

Assume FW Thm 5.1's residual hypotheses; Λ = O[[X_1, X_2, X_3]] factorial and regular. The integral Kato bound needs its actual lattice/image hypotheses at the chosen classical points; one must exhibit a τ with T/(τ−1)T free of rank one on the chosen integral lattice; residual irreducibility alone does not do so. This uses only Kato's divisibility and density; Zariski density alone is not used to conclude that a rational section is an integral generator — the height-one prime argument over the factorial Λ is.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Prop. 5.5 and proof, pp. 70–71. The image of Δ_Σ(T_Σ)⁻¹ lies in Λ, by a height-one prime of the factorial ring Λ and Kato's bound at well-chosen classical points.

The proof proceeds as follows. Suppose the image of Δ⁻¹ is (x/y)Λ with x/y ∉ Λ; since Λ is factorial there is a height-one prime 𝔭 = (y_0) containing y but not x. By density ([§3.3](#33-classical-points-of-good-reduction-type-exist-and-are-dense)) choose an Iwasawa-suitable λ_Iw, étale over Λ, with λ(y_0) ∈ m^n_(O_Iw) and λ(x) ∉ m^n for large n; at such a point T_(λ,Iw) is a lattice in a direct sum of classical representations V_(λ,r,Iw). Kato's one-sided divisibility at each classical point (KatoEulerSystems §7.2 (cohomological upper bound), integral where T_(λ,Iw) has the needed image) gives t_Λ^∨(Δ⁻¹) ⊆ O_Iw at λ, contradicting λ(x/y) ∉ O_Iw.

**Checks.**

- The trivializations e ↦ 1 and e ↦ ϖ of a free line A·e are both generically invertible, with images A and ϖA; their duals have images A and ϖ⁻¹A. Only the first is integral with integral inverse, so a rational trivialization is not integral without the height-one argument.

*Needs:* §§3.2, 3.3 and 3.9; KatoEulerSystems §§4.3 and 7.2; Mathlib `UniqueFactorizationMonoid`.

### 4.2 From pointwise main conjectures at an étale point to the family over Λ

Suppose there is a point x: Λ → O at which Spec 𝕋^Σ_(m_ρ̄) → Spec Λ is étale and every point ψ: 𝕋 → O above x satisfies Kato's main conjecture (FW Conj. 3.24). Then triv_(z_Σ): Δ_Σ(T_Σ) ↪ Frac(Λ) is an isomorphism onto Λ (FW Prop. 5.7). Every invertible module over the local deformation ring is abstractly free. The issue is the prescribed rational zeta trivialization: its lattice need not be the unit lattice. FW proves the needed integrality over the factorial regular subring Λ, then uses the finite étale fiber and its determinant norm to prove α is a unit.

Retain the stated hypotheses; all λ_Iw above x are Iwasawa-suitable because of étaleness.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Prop. 5.7 and proof, pp. 71–72. An étale point all of whose preimages satisfy the pointwise conjecture forces the family conjecture over Λ.

The proof proceeds as follows. Use the dual trivialization of [§4.1](#41-the-zeta-trivialization-over-λ-is-integral), with image αΛ and α∈Λ. Specialize along x_Iw: by the base-change diagram (FW Prop. 3.23; [§3.9](#39-the-zeta-trivialization-of-the-fundamental-line)), x_Iw(α)O_Iw is the product over ψ ∈ S_x of the pointwise images, each O_Iw by hypothesis, so x_Iw(α) is a unit. An element of the local ring Λ whose specialization is a unit is a unit; hence αΛ = Λ.

**Checks.**

- A local ring map sends the maximal ideal into the maximal ideal: α = ϖ specializes to the nonunit ϖ, and α = 1 + X to the unit 1, so a unit specialization x_Iw(α) forces α ∈ Λ^×, as the proof uses.
- The dual trivialization images A and ϖ⁻¹A of e ↦ 1 and e ↦ ϖ differ, although both are generically invertible; only the unit image is the asserted integrality.

*Needs:* §§3.9, 3.10 and 4.1; Mathlib `IsLocalRing`.

### 4.3 Fouquet–Wan's universal-family main conjecture

Let p ≥ 3 and ρ̄: G_ℚ → GL_2(𝔽) satisfy the hypotheses of FW Thm 5.1 (absolutely irreducible; (ρ̄|_(G_(ℚ_p)))ˢˢ ≠ χ̄ ⊕ χ̄χ̄_cyc; a prime ℓ ∤ p with ρ̄|_(G_(ℚ_ℓ)) a ramified extension of µχ^(−k/2)_cyc by µχ^(1−k/2)_cyc, µ unramified and nontrivial if ρ̄|_(G_(ℚ_p)) is irreducible). For Σ finite, viewing the universal deformation T_Σ as a free module over Λ ≅ O[[X_1, X_2, X_3]], the zeta morphism z_Σ induces an isomorphism triv_(z_Σ): Δ_Σ(T_Σ) ≅ Λ (FW Thm 5.2 = Thm 1.8; Kato's Conjecture 3.2.2 for (Spec ℤ[1/Σ], Λ, T_Σ)). The statement is over the regular subring Λ; the stronger statement over 𝕋 ≅ R_Σ(ρ̄) itself is not asserted.

Assume FW Thm 5.1’s T5.1 residual hypotheses. For the even-weight Γ₀ modular normalization, the scalar local semisimplification is automatically excluded by the determinant parity argument of FW p. 69, recorded in the Layer 3 Examples and applied in [§4.5](#45-fouquetwans-main-conjecture-at-every-point-of-the-family). The proof imports the ordinary/crystalline seed targets, whose general-weight nonvanishing, regulator and integral Kato-witness hypotheses are retained. No stronger theorem over the nonfactorial deformation ring is asserted.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Thm 5.2, p. 69; Thm 1.8, p. 8; Prop. 5.6, p. 71; proof of Thm 5.1, p. 73. The universal-family isomorphism over Λ and its proof from a seed point of known type.

The proof proceeds as follows. Find a seed point: by FW Lemma 2.8 ([§3.3](#33-classical-points-of-good-reduction-type-exist-and-are-dense)) there is a classical point that is crystalline-short, crystalline-short up to the quadratic twist ω^((p−1)/2), good ordinary, or good ordinary up to quadratic twist. At such a point Kato's main conjecture holds (FW Prop. 5.6): crystalline-short points by [§2.20](#220-fouquetwans-main-conjecture-at-crystalline-short-points) (Thm 4.51), ordinary points by the ordinary theorem — obtain the ordinary seed equality by combining [§2.21](#221-the-fouquetwan-ordinary-reverse-divisibility-theorem-16-by-48) directly with KatoEulerSystems §7.2 and the determinant/characteristic criterion of [§3.4](#34-fundamental-lines-over-the-deformation-ring-and-its-quotients); twists are handled in the same way. Points near the seed that are étale over Λ and of the same type satisfy the pointwise conjecture; apply [§4.2](#42-from-pointwise-main-conjectures-at-an-étale-point-to-the-family-over-λ).

**Checks.**

- For a split étale fiber of degree 2 the determinant norm of the scalars (2, 3) is 6; the factors (ϖ, ϖ⁻¹) have norm 1 without being integral, so a unit norm alone does not show each factor is a unit.
- A module free of rank two over 𝕋, with 𝕋 free of rank 2 over Λ, has Λ-rank 4; the determinant over Λ is of this rank-4 module, not of the rank-2 𝕋-module.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent); §§2.20, 2.21, 3.3, 3.10, 4.1 and 4.2.

### 4.4 From the family over Λ to every classical point

Assume the family Σ-partial trivialization is an isomorphism over Λ. FW Prop. 5.8 gives the corresponding Σ-partial trivialization at every classical point, including points ramified over Λ. Its morphism is the Euler-corrected z_Σ(f)_Iw. With the full-line local correction comparison of §§3.3–3.4 this yields Conj. 3.24 for the full line and Kato’s z(f)_Iw. Keep these two lines and their morphisms distinct; a specialized Euler factor that vanishes cannot simply be cancelled; the argument avoids the zero set of β and works with the Euler-factor-corrected lines.

Retain the stated hypotheses; the Σ-partial lines and the Euler-factor-corrected morphisms are used, which both commute with specialization at a classical point even if it is ramified over Λ.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Prop. 5.8 and proof, pp. 72–73. The limit argument: family isomorphism over Λ implies the pointwise main conjecture at every classical point.

The proof proceeds as follows. Kato’s bound puts the dual pointwise lattice in O_Iw, say γO_Iw with γ∈O_Iw. The primal lattice is then γ⁻¹O_Iw. Over 𝕋 write the image of Δ_Σ as (α/β)𝕋 with λ(f)_Iw(β) ≠ 0 (FW Prop. 3.23). Choose λ close to λ(f), outside the zero set of β, étale over Λ with all points above Iwasawa-suitable; the family isomorphism forces each pointwise γ_ψ to be a unit there, so λ_Iw(α/β) is a unit. By continuity, taking λ close to λ(f), 1/γ = λ(f)_Iw(α/β) is a unit.

**Checks.**

- T/T has the removable value 1 at T = 0; 1/T has no value there, and T/1 specializes to the nonunit 0. Cancelling a vanishing Euler factor would treat T/T as 0/0.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent); §§3.3, 3.4, 3.9 and 4.3; KatoEulerSystems §7.2.

### 4.5 Fouquet–Wan's main conjecture at every point of the family

Let p ≥ 3 and f ∈ S_k(Γ_0(Np^r)) a normalized eigencuspform of weight k ≥ 2 whose residual representation satisfies the hypotheses of FW Thm 5.1 ([§3.1](#31-the-residual-hypotheses-of-the-fouquetwan-and-nakamura-theorems), T5.1), with the auxiliary prime ℓ satisfying ℓ ∥ N. Then the zeta morphism gives an isomorphism triv_(z(f)_Iw): Δ_(O_Iw)(T(f)_Iw) ≅ O_Iw (FW Thm 5.1; Thm 1.7 is its narrower nontrivial-µ formulation); equivalently char_(Λ_Iw)H²(ℤ[1/p], T ⊗ Λ_Iw) = char_(Λ_Iw)H¹(ℤ[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw. This covers non-ordinary and bad-reduction points at p (π(f)_p principal series, Steinberg or supercuspidal) and needs no µ-invariant hypothesis. Consequence: Sel_ℚ(f) is finite iff L(f, k/2) ≠ 0 (Cor. 5.3). FW Cor. 5.4, the p-part of the Birch–Swinnerton-Dyer formula for abelian varieties of GL_2-type with L(A,1) ≠ 0, is a source consequence outside this roadmap's scope; only the cohomological main conjecture and the Selmer finiteness criterion are targets here.

Assume all hypotheses of FW Thm 5.1, including the global Γ₀ form, even k, and ℓ∥N. The Thm 1.7 formulation additionally requires µ nontrivial even in the reducible-at-p case. The scalar local semisimplification is automatically impossible: det ρ̄_f|I_p=ωᵏ⁻¹ with k−1 odd; a scalar semisimplification would give ω²ᵃ for some integer a, contradicting 2a≡k−1 mod p−1 because p is odd. Thus no additional scalar exclusion is missing from the displayed theorem (FW p. 69). For the normalized residual representation in the proof on p. 73, the ramified Steinberg witness also excludes quadratic-induced restriction exceptions: its nontrivial unipotent p-element cannot occur in an induction from the index-two quadratic cyclotomic field, since ℓ≠p is unramified there and prime-to-p characters have no such inertia image. Together with the local exclusion, this supplies the A2.1/A3.5 dictionary; preserve the source’s critical twist.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Thm 5.1, p. 68; Thm 1.7, p. 7; Cors 5.3–5.4, p. 69; proof of Thm 5.1, p. 73. The pointwise main conjecture for all eigencuspforms with the residual hypotheses, and its corollaries. [FW](https://arxiv.org/pdf/2107.13726v3), Remark after Thm 5.1, PDF p. 69; proof of Thm 5.1, p. 73. Automatic scalar exclusion by odd cyclotomic determinant and the normalized residual representation used in the proof.

The proof proceeds as follows. Use the determinant-parity and Steinberg-witness arguments in the hypotheses to pass to the normalized residual datum of FW p. 73. Apply [§4.3](#43-fouquetwans-universal-family-main-conjecture) to ρ̄_f. Apply [§4.4](#44-from-the-family-over-λ-to-every-classical-point) at λ(f) (FW proof of Thm 5.1, p. 73). Translate the fundamental-line statement into characteristic ideals over the regular O_Iw (the determinant/characteristic criterion of [§3.4](#34-fundamental-lines-over-the-deformation-ring-and-its-quotients), as applied in [§3.10](#310-katos-generalized-main-conjecture-for-the-universal-family-and-its-specializations)).

**Checks.**

- At p = 5 and weight 2 a scalar residual semisimplification χ̄ ⊕ χ̄ has determinant ω^(2a), while det ρ̄_f = ω^(k−1) = ω for trivial character; 2a ≡ 1 mod 4 has no solution. At p = 3 the equation 2a ≡ 1 mod 2 has none either.

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility (gap:fw-zeta-local-descent); §§3.1, 3.10, 4.3 and 4.4; PadicMeasuresIwasawaAlgebras §5.1; KatoEulerSystems §§5.1, 5.4 and 7.2.

### 4.6 Euler factors, Tor terms and the regular subring in specialization

For a specialization λ: A → A′ between quotients of 𝕋^Σ_(m_ρ̄) or Λ: (i) the Σ-partial fundamental line commutes with every base change, Δ_Σ(T) ⊗ A′ ≅ Δ_Σ(T′); (ii) the full fundamental line commutes with λ when λ is Iwasawa-suitable, the Euler-factor lines X_ℓ(T) specializing to X_ℓ(T′) because the ranks of inertia invariants and the eigenvalues α_ℓ are preserved (FW Prop. 3.20); otherwise the rank of T^(I_ℓ) can jump and the comparison acquires the factor relating X_ℓ(T) ⊗ A′ and X_ℓ(T′); (iii) Nakamura's change-of-Σ formula z_(Σ′,n) ⊗ id = ∏_(l∈Σ′∖Σ) P_l(σ_l⁻¹)·z_(Σ,n) matches the passage from Δ_(Σ′) to Δ_Σ with the Euler factors P_l; (iv) a statement over the regular subring Λ (FW Thm 1.8) is a statement about T_Σ as a Λ-module of rank 2d, and at a point x of Λ it is a statement about the product over all points of 𝕋 above x — it implies the statement over 𝕋 only at points étale over Λ, and at ramified points only through [§4.4](#44-from-the-family-over-λ-to-every-classical-point).

Retain the stated hypotheses; Iwasawa-suitable as in FW Def. 3.19.

For FW local data with nonscalar endomorphisms, the zeta morphism and its classical comparison in this statement are supplied by gap:fw-zeta-local-descent; the N3 branch uses §§3.5–3.8 with all their hypotheses.

The source is [FW](https://arxiv.org/pdf/2107.13726v3), Lemma 3.17, Prop. 3.20, pp. 31–32; Props 5.7–5.8, pp. 71–73; §1.2.2, p. 14. Base change of fundamental lines with and without Euler factors, and the role of points étale over Λ. [Nakamura](https://arxiv.org/pdf/2006.13647v2), §5.3: (77), PDF p. 78; (78)–(79), p. 80. Change of Σ for the zeta morphism and for H²_Iw.

The proof proceeds as follows. (i)–(ii): perfectness and derived base change of RΓ (FW Lemma 3.17), and the explicit two-term complexes defining X_ℓ (FW Prop. 3.20's proof). Use NAK-v2 change-of-Σ formula (77), p. 78, together with the H¹ isomorphism (78) and H² exact sequence (79), p. 80. These are different formulas and must not share a locator. (iv): restriction of scalars along the finite free Λ → 𝕋 and the étale-point analysis of FW Props 5.7–5.8.

**Checks.**

- For M = diag(1,2,3,4), det(1−MX) = 1−10X+35X²−50X³+24X⁴, and the trace is 10 from minus coefficient 1. For the rank-two local factor diag(1,2), it is 1−3X+2X², with trace 3; the factor stays reciprocal under the change-of-Σ comparison.
- A change of stable lattice is handled by the determinant of its global and local correction cones, with the specified Euler terms. It is not summarized by one unspecified scalar index. Use the universal lattice and record a full cone comparison before transporting a zeta basis.

*Needs:* §§3.4, 3.7 and 3.9; SelmerIwasawaCohomology §§2.24, 3.9 and 3.10.

### 4.7 Congruences between Kato's zeta morphisms

Let f, g be normalized newforms with coefficients in E, ρ̄_f absolutely irreducible, and the assumptions of Nakamura §4 holding for ρ̄ = ρ̄_f. If f ≡ g modulo ϖ^m (Hecke eigenvalues congruent at all but finitely many primes), then ∏_(l∈Σ_0) P_(f,l)(σ_l⁻¹)·z_n(f) ≡ ∏_(l∈Σ_0) P_(g,l)(σ_l⁻¹)·z_n(g) modulo ϖ^m as maps ρ^*_(f,m) → H¹_Iw(ℤ[1/Σ_n, ζ_n], ρ^*_(f,m)(1)) (Nakamura Cor. 5.6).

Assume Nakamura §4 assumptions ((N1), (N3), (N4)); Σ containing the levels of f and g and p.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), Cor. 5.6, p. 77. Congruent newforms have congruent Euler-corrected zeta morphisms.

The proof proceeds as follows. x_f and x_g are points of the same Spec 𝕋_(ρ̄,Σ) that agree modulo ϖ^m (the congruence modulus throughout the argument is ϖ^m). Both Euler-corrected zeta morphisms are specializations of the one universal z_(Σ,n)(ρ^m) ([§3.8](#38-the-universal-zeta-morphism-specializes-to-katos)), so they agree modulo ϖ^m.

**Checks.**

- Multiplication by 1 and by 1 + ϖ^m induce the same map modulo ϖ^m; multiplication by 1 and by 1 + ϖ^(m−1), m ≥ 1, do not. The congruence is detected exactly at level m.

*Needs:* §§3.7 and 3.8.

### 4.8 The residual zeta morphism and the space of points X(ρ̄)

Let Σ_ρ̄ = {p} ∪ ram(ρ̄). For Σ_ρ̄ ⊆ Σ ⊆ Σ′, ρ^m_(Σ′) ⊗ 𝕋_(ρ̄,Σ) ≅ ρ^m_Σ and z_(Σ′,n)(ρ^m_(Σ′)) ⊗ id = ∏_(l∈Σ′∖Σ) P_l(σ_l⁻¹)·z_(Σ,n)(ρ^m_Σ) (Nakamura (77)). The residual zeta morphism z_(Σ,n)(ρ̄) is the base change of z_(Σ,n)(ρ^m) to 𝔽 composed with the natural map H¹_Iw(ℤ[1/Σn, ζ_n], (ρ^m)^*(1)) ⊗ 𝔽 → H¹_Iw(ℤ[1/Σn, ζ_n], ρ̄^*(1)) of [§3.7](#37-nakamuras-universal-zeta-morphism), a Λ_(n,𝔽)-linear map ρ̄^* ⊗_(𝔽[±1]) Λ_(n,𝔽) → H¹_Iw(ℤ[1/Σn, ζ_n], ρ̄^*(1)). Put X(ρ̄) = ∪_Σ Spec(𝕋_(ρ̄,Σ))(ℤ̄_p) with its modular points X(ρ̄)^mod, and for a character η of Δ = Gal(ℚ(ζ_p)/ℚ) consider η-components over Λ^η.

Assume Nakamura §4 assumptions; absolute irreducibility of ρ̄.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), §5.3, (77) and the residual definitions, PDF p. 78; Thm 5.7, p. 79. The residual zeta morphism, change of Σ, and the points X(ρ̄).

The proof proceeds as follows. Base change of z_(Σ,n)(ρ^m) along 𝕋_(ρ̄,Σ) → 𝔽, composed with the natural map from H¹_Iw ⊗ 𝔽 to the H¹_Iw of the derived base change of the perfect complex computing it; that map is not asserted to be an isomorphism (at a point x and reduction modulo ϖ its cokernel is H²_Iw[ϖ], Nakamura (91), p. 82). Compatibility with change of Σ from (77).

The interface is used in [§4.9](#49-residual-nonvanishing-µ--0-and-the-structure-of-residual-iwasawa-cohomology) to NAK-v2 Thms 5.7, 5.8 and 5.10 are statements about z_(Σ,1)(ρ̄)^η; in [§4.10](#410-the-λ-defect-is-constant-on-the-family-and-katos-main-conjecture-propagates-along-congruences) to the λ-defect at every point equals the residual defect.

**API.**

- The residual zeta morphism is z_(Σ,n)(ρ̄): ρ̄^* ⊗_(𝔽[±1]) Λ_(n,𝔽) → H¹_Iw(ℤ[1/Σn, ζ_n], ρ̄^*(1)).
- z_(Σ′,n)(ρ̄) = ∏_(l∈Σ′∖Σ) P̄_l(σ_l⁻¹)·z_(Σ,n)(ρ̄) for Σ_ρ̄ ⊆ Σ ⊆ Σ′.
- The space of points is X(ρ̄) = ∪_Σ Spec(𝕋_(ρ̄,Σ))(ℤ̄_p), with its modular subset X(ρ̄)^mod.
- For a character η of Δ, z_(Σ,1)(ρ̄)^η is the η-component.
- For x ∈ X(ρ̄), z_(Σ,1)(ρ_x) mod ϖ = z_(Σ,1)(ρ̄).
- The residual map is the reduction of the universal map; compatible coefficient and Σ maps give the same reduction. Equality is tested on the residual source module, with its η projection.

**Checks.**

- For x_f modular, z_(Σ,1)(ρ̄) is the reduction modulo ϖ of ∏_(l∈Σ_0)P_(f,l)(σ_l⁻¹)·z(f) (Thm 4.3 mod ϖ).
- For Σ = Σ_ρ̄ the change-of-Σ map of the API is the identity: the product of Euler factors over Σ ∖ Σ_ρ̄ is empty.
- Residual map against derived base change: for C = [A —X→ A] in degrees 1, 2 over A = k[[X]], H¹(C) = 0 and H²(C) = k, while H¹(C ⊗^L k) = k; the residual map factors through H¹(C) ⊗ k = 0 → H¹(C ⊗^L k) = k, which is injective with cokernel H²(C)[X] = k. A definition declaring that comparison map an isomorphism would manufacture a nonzero residual class out of zero.
- The residual Euler element 1−γ in F[[γ−1]] equals −(γ−1): it is nonzero and is not a unit. Therefore an Euler-corrected residual map cannot be replaced by the uncorrected Kato map by discarding this factor, even though the formal factor has not vanished.
- Projectors: over 𝔽_5 with complex conjugation c = diag(1, −1), the idempotents e_± = (1 ± c)/2 are diag(1, 0) and diag(0, 1), so e_+ fixes (1, 0) and kills (0, 1); interchanging them sends (1, 0) to 0. For η the Teichmüller character of Δ = 𝔽_5^×, e_η = (1/4)Σ_δ η(δ)⁻¹[δ] = 4[1] + 2[2] + 3[3] + [4] in 𝔽_5[Δ], and [2]·e_η = 3[1] + 4[2] + [3] + 2[4] = 2·e_η = η(2)·e_η, whereas on e_(η²) the element [2] acts by η²(2) = 4 ≠ 2; so the η-component is the one on which Δ acts through η. At p = 2 the idempotents e_± are undefined.

*Needs:* §§3.7 and 4.6; SelmerIwasawaCohomology §3.1.

### 4.9 Residual nonvanishing, µ = 0 and the structure of residual Iwasawa cohomology

Fix a character η of Δ. (i) The following are equivalent: z_(Σ_ρ̄,1)(ρ̄)^η ≠ 0; µ(H¹_Iw(ℤ[1/Σ_f], ρ_f^*(1))^η/Im(z_1(f)^η)) = 0 for some x_f ∈ X(ρ̄)^mod; the same for all x_f ∈ X(ρ̄)^mod (NAK-v2 Thm 5.7). (ii) Assume X(ρ̄)^mod_a ≠ ∅ (modular points with Nakamura's condition (a)) and (i) holds for η. Then H¹_Iw(ℤ[1/Σ_ρ̄], ρ̄^*(1))^η is free of rank one over Λ^η_𝔽, and H¹_Iw/Im(z_(Σ_ρ̄,1)(ρ̄)^η) and H²_Iw(ℤ[1/Σ_ρ̄], ρ̄^*(1))^η are finite-dimensional (NAK-v2 Thm 5.8); the η-part of Kato's main conjecture for ρ̄ is the equality of their dimensions (NAK-v2 Conj. 5.9). (iii) For every x ∈ Spec(𝕋_(ρ̄,Σ))(O) ⊂ X(ρ̄): H¹_Iw(ℤ[1/Σ], ρ_x^*(1))^η is free of rank one over Λ^η_O; the quotient by Im z_(Σ,1)(ρ_x)^η and H²_Iw are torsion with µ = 0; and if x is modular, or there is τ ∈ Gal(ℚ̄/ℚ(ζ_(p^∞))) with (ρ_x/(τ−1)ρ_x)[1/p] one-dimensional, then Char(H¹_Iw/Im z^η) ⊆ Char(H²_Iw^η) (NAK-v2 Thm 5.10).

Assume Nakamura §4 assumptions. In (ii)–(iii), assume both residual nonvanishing in the selected η-component and existence of a modular point satisfying condition (a) of NAK-v2 Thm 5.2, p. 75: there is τ∈Gal(Q̄/Q(ζ_p∞)) such that ρ_f/(τ−1)ρ_f is O-free of rank one. A quotient of rational dimension one alone does not meet this integral condition. Under these inputs, rank-one freeness, torsion and µ=0 hold at all promodular points. The characteristic-ideal containment in (iii) additionally needs modularity or the weaker rational condition (b) of NAK-v2 Thm 5.10(4), p. 79; do not infer it at every promodular point. Residual nonvanishing and the integral condition-(a) modular witness are hypotheses. The theorem does not prove unconditional µ=0.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), Thm 5.2(a), PDF p. 75; Thms 5.7–5.8, Conj. 5.9 and Thm 5.10 (with its condition (b)), p. 79; the set X(ρ̄)_b after Conj. 5.12, p. 80; proofs pp. 80–84. Residual nonvanishing versus µ = 0, and the structure of residual and pointwise Iwasawa cohomology.

The proof proceeds as follows. (i): the mod-ϖ exact sequences relating H¹_Iw(ρ_f^*(1))/ϖ and H¹_Iw(ρ̄^*(1)), freeness of H¹_Iw (Kato Thm 12.4(3)) and [§4.7](#47-congruences-between-katos-zeta-morphisms). (ii): Kato's theorem 5.2 at a point of X^mod_a gives the rank and finiteness; descend modulo ϖ. (iii): lift freeness and torsion from the residual statement; µ = 0 from (i); the divisibility from the Euler system bound (KatoEulerSystems §§4.3 and 7.2, with EulerSystemsAndKolyvaginSystems §8.16) under the image condition.

**Checks.**

- Λ/(T²) has μ = 0, λ = 2, and its reduction modulo ϖ has 𝔽-dimension 2 = 2 − 0, matching λ = dim(M/ϖ) − dim(M[ϖ]); Λ/(ϖ) has μ = 1, residual nonvanishing fails for it, and no μ = 0 conclusion is drawn.

*Needs:* §§4.7 and 4.8; KatoEulerSystems §§4.3 and 4.4; PadicMeasuresIwasawaAlgebras §4.4.

### 4.10 The λ-defect is constant on the family and Kato's main conjecture propagates along congruences

Under the assumptions of [§4.9](#49-residual-nonvanishing-µ--0-and-the-structure-of-residual-iwasawa-cohomology) (ii), for every x ∈ X(ρ̄): λ(H¹_Iw(ℤ[1/Σ], ρ_x^*(1))^η/Im z_(Σ,1)(ρ_x)^η) − λ(H²_Iw(ℤ[1/Σ], ρ_x^*(1))^η) equals dim_𝔽(H¹_Iw(ℤ[1/Σ_ρ̄], ρ̄^*(1))^η/Im z_(Σ_ρ̄,1)(ρ̄)^η) − dim_𝔽 H²_Iw(ℤ[1/Σ_ρ̄], ρ̄^*(1))^η, hence is independent of x (NAK-v2 Thm 5.13); consequently the η-part of Kato's main conjecture for ρ̄ holds iff the weak (λ-) version holds for some x iff it holds for all x (NAK-v2 Cor. 5.14). In particular (Nakamura Thm 1.4): if g_1, g_2, g_3 are congruent to f with (1) some τ ∈ Gal(ℚ̄/ℚ(ζ_(p^∞))) making ρ_(g_1)/(τ − 1)ρ_(g_1) free of rank one over O, (2) µ = 0 for g_2, and (3) Kato's main conjecture for g_3, then µ = 0 and Kato's main conjecture hold for f.

Use the hypotheses of [§4.9](#49-residual-nonvanishing-µ--0-and-the-structure-of-residual-iwasawa-cohomology); the torsion and λ-defect term is H², not the H¹ printed in the last display of the source proof.

The source is [Nakamura](https://arxiv.org/pdf/2006.13647v2), Thm 5.13 and Cor. 5.14, PDF p. 80; proof pp. 80–84; Thm 1.4, pp. 6–7. Constancy of the λ-defect, equivalence of the residual and pointwise main conjectures, and propagation along congruences.

The proof proceeds as follows. For a module with µ = 0, λ(M) = λ_𝔽(M/ϖ) − λ_𝔽(M[ϖ]) (Nakamura (93), p. 84); apply it to H¹_Iw/Im z and to H²_Iw and use the residual exact sequences (91)–(92), pp. 82–83. Constancy gives the equivalence of weak λ-equality at some/all promodular points and the residual equality. Full characteristic-ideal equality additionally uses the one-sided containment, available for modular points or those satisfying condition (b) of NAK-v2 Thm 5.10(4), p. 79; it is not asserted at every promodular point merely from equal λ-invariants. Thm 1.4 is the specialization of these statements to modular points, as in Kim–Lee–Ponsinet.

**Checks.**

- If µ ≠ 0 for the residual Iwasawa cohomology, λ(M) = λ_𝔽(M/ϖ) − λ_𝔽(M[ϖ]) fails: for M = Λ/(ϖ) one has λ(M) = 0 while M/ϖ = M[ϖ] = Λ/(ϖ) has infinite 𝔽-dimension, so the µ = 0 hypothesis of Nakamura (93) is needed.
- Equal λ-invariants at two congruent points give equality of characteristic ideals only together with the one-sided containment at one of them; for Λ/(T) and Λ/(T − p) the λ-invariants agree (both 1) while the ideals differ.

*Needs:* §§4.7 and 4.9; PadicMeasuresIwasawaAlgebras §§4.4 and 5.1; KatoEulerSystems §§5.1, 5.4 and 7.2.

### Examples

If the dual determinant trivialization has image ϖΛ, the primal image is ϖ⁻¹Λ. The dual lattice is integral but is not Λ; this detects the gap between dual integrality and the full main conjecture. At a finite étale fiber with two factors, the dual image specializes to α₁α₂O_Iw. If it is a unit lattice and each α_i is integral, both α_i are units; the primal image is the inverse product. This is the norm calculation used in the family argument.

If O is ramified with p=uϖᵉ and e>1, a single ϖ-defect has length one over O, whereas a p-defect has length e. Rationalizing at p erases both and cannot distinguish them. In the residual cyclotomic algebra F[[T]], with γ=1+T, the Euler element 1−γ is −T: it is nonzero and not a unit. Reduction and change of Σ must retain it even when its augmentation vanishes.

### Dependencies

Earlier layers: §§2.20, 2.21, 3.1, 3.2, 3.3, 3.4, 3.7, 3.8, 3.9 and 3.10. Suppliers: KatoEulerSystems §§4.3, 4.4, 5.1, 5.4 and 7.2; PadicMeasuresIwasawaAlgebras §§4.4 and 5.1; SelmerIwasawaCohomology §§2.24, 3.1, 3.9 and 3.10. Libraries: Mathlib `IsLocalRing`; Mathlib `UniqueFactorizationMonoid`.

## Layer 5: The totally real Wan–Fujiwara engine

### 5.1 Fujiwara’s minimal theorem in the Wan instance

For the specified nearly ordinary weight-two residual Hilbert representation and its minimal deformation type D, identify Wan’s localized Hecke algebra with the minimal deformation ring by Fujiwara's theorem (gap:fujiwara-minimal on OrdinaryAutomorphicFormsAndModularityLifting). Verify every condition of Fujiwara 11.1, then use 11.2 and 11.5 for freeness of the precise quaternionic/Hilbert module and the Hida-family comparison. The minimal algebra is a relative complete intersection; the appropriate finite flat Hecke algebra is Gorenstein. This is an application of the supplier theorem, not a new proof of totally real R=T.

Assume p>3; F totally real, p unramified in F; residual representation absolutely irreducible on G_(F(ζ_p)). For p=5 exclude the simultaneous PGL2(F5) projective-image and mod-p-cyclotomic factorization through its abelianization of order two. The local nearly ordinary types are distinguished; flat types satisfy Fujiwara’s unramified base-field restriction; a minimal modular lift exists as in Definition 6.11. Verify Hypothesis 6.7 via Theorem 6.8 in the ordinary/weight-two instance; retain Hypothesis 5.9 in exactly the nonminimal cases where 11.1 requires it. Odd [F:Q] requires the Shimura-curve Ihara input in Wan 8. Exclude the actual exceptional 0E case using the induced-representation description: the local representation is absolutely irreducible, its inertia restriction is absolutely reducible, and q_v≡−1 mod p. BCS H3 excludes this case. Additionally verify Wan 8’s literally printed irreducible-inertia q_v test. The actual induced type has reducible inertia, so the additional literally printed test alone does not exclude it. At real quadratic F no odd-degree Ihara condition is invoked. A general residual irreducibility statement without minimal lift or local types does not satisfy this target.

The source is [Fujiwara](https://arxiv.org/pdf/math/0602606v2), Definition 6.11, pp.54–55; Theorems 11.1–11.2, p.95; Corollary 11.5, p.97. Exact minimal conditions and freeness. [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Theorem 8, pp.6–7. Gorenstein input and the actual inertia condition. [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Hypothesis 3.1.1 and Remark 3.1.2, pp.7–8. Application conditions; BCS H3 matches the induced exceptional type, with the induced local type tested explicitly below.

The proof proceeds as follows. Match the determinant, Teichmuller twist characters, finite local deformations away p and nearly ordinary/flat local deformation conditions, not just residual representations. Apply the exact minimal supplier theorem and freeness; the deformation conditions of OrdinaryAutomorphicFormsAndModularityLifting §3.39 and its conditional Skinner–Wiles lifting (§§5.3 and 5.8) are inputs to the gap, not by themselves this theorem. Use finite flatness over the regular weight ring and complete-intersection duality to deduce Gorenstein; finite flatness alone does not imply regularity.

**Checks.**

- At p = 5 a place of norm 19 has q_v = 19 ≡ −1 mod 5, where the exceptional induced type must be excluded; a place of norm 19² = 361 ≡ 1 mod 5 is never exceptional.
- For an unramified quadratic extension and a character ψ with ψ ≠ ψ^Frob, the induced local representation is irreducible but its restriction to inertia is ψ|_I ⊕ ψ^Frob|_I, reducible; the literally printed irreducible-inertia test does not detect it.

*Needs:* OrdinaryAutomorphicFormsAndModularityLifting (gap:fujiwara-minimal); GlobalGaloisDeformations (gap:minimal-lift-base-change); PadicFamilies §§5.1, 5.6, 5.7, 5.8 and 5.9; PadicFamilies (gap:hilbert-hida-odd-degree).

### 5.2 Integral congruence-line generator and canonical period

In the specified ordinary Hilbert Hecke algebra T over the normal Hida coefficient ring I, let e_f be the rational idempotent of the f-component. Identify T∩I_frac e_f with the rank-one integral congruence line generated by the integral congruence-line generator ℓ_f=η_f e_f, using the supplied Gorenstein duality and free Hecke module (Wan-2015 §7.2.1, p. 65, where ℓ_f is chosen as a generator of this line). Then ℓ_f² = η_f ℓ_f, and ℓ_f acts on the f-line by multiplication by η_f; ℓ_f is idempotent only when η_f is a unit, and the idempotent and projector of the f-component is e_f, which lies in T ⊗ I_frac and in general not in T. Wan’s canonical period divides the specified Petersson pairing by η_f with the archimedean factors of Definition 79. Replacing ℓ_f by uℓ_f, u∈I×, changes the normalized p-adic L-function and Eisenstein family by the matching unit; their ideals are unchanged.

Assume the Hecke algebra and module are those in the preceding Fujiwara instance, not an arbitrary finite flat algebra: Gorenstein of an arbitrary finite flat algebra, without this free module and pairing, does not give the congruence-line comparison. The rational idempotent is never declared integral, and no equality of the period over F with the square of a period over ℚ is inferred. The f-component is generically isolated; the congruence number is nonzero at the chosen arithmetic point; the actual integral lattice and pairing are fixed.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §7.2.1, Definition 79, Remark 80, pp.65–66; Theorem 82, pp.66–68. Canonical normalization, the integral congruence-line generator and the rational idempotent.

The proof proceeds as follows. Use the exact minimal free Hecke module and the Gorenstein pairing of §5.1 to compare the congruence line with the period line, as in §0.8. The rank-two Ribet theorem of IntegralHeckeAndGaloisDeterminants Layer 6 does not identify this Hilbert congruence line. Match Wan 7.2.1/Definition 79, including the choice of generator, powers of 2 and i, conductor and conjugate/twisted form. Use the congruence-line generator ℓ_f, with its factor η_f kept in the canonical-period normalization, in the integral interpolation; retain e_f only for the rational version.

**Checks.**

- In T = ℤ₅[x]/(x(x−5)), embedded in ℤ₅² by x ↦ (0,5) with image {(a,b) : a ≡ b mod 5} (a finite flat reduced local complete intersection, hence Gorenstein, ℤ₅-algebra), the f-idempotent is e = (1,0) ∉ T, and T ∩ ℚ₅e = ℤ₅(5,0), so ℓ = (5,0) and η = 5. Then ℓ² = (25,0) = 5ℓ ≠ ℓ, while e² = e holds only in ℚ₅². Calling ℓ an idempotent would force η to be a unit and the congruence ideal (5) to be trivial.
- Period direction and unit invariance at p = 5: with Petersson numerator 10 and congruence generator η = 5 the canonical period is 10/5 = 2. Replacing η by the unit multiple 2η = 10 gives period 1 and multiplies the interpolated values by the unit 2, leaving their ideal unchanged. Multiplying instead of dividing by η would give period 50, which differs from 2 by the nonunit 25.
- Nonunit rescaling is excluded: replacing η = 5 by 25, a generator of a different ideal, gives period 2/5 and multiplies the interpolated values by 5, changing the integral ideal they generate; only generators of the congruence line itself are admissible.

*Needs:* §§0.8 and 5.1; Mathlib `Ideal.span_singleton_mul_left_unit`.

### 5.3 Normalized Hilbert Klingen family and its boundary

In the module of ordinary p-adic forms on GU(2,2) over M/F (gap:unitary-ordinary-igusa), construct the Klingen family ℰ_D from Wan's local sections and the pullback of the Siegel Eisenstein series on GU(3,3) (Wan-2015 §§4–7, Theorems 82 and 88), together with Wan's p-adic L-function L^Σ_(f,M,ξ) as the factor of its degenerate coefficients, and prove its normalized coefficient and boundary identities. At every x = diag(u, t ū⁻¹) ∈ G(𝔸^Σ_(F,f)) admitted by Wan-2015 Theorem 88 its coefficients c_D(β,x) lie in Λ_D and specialize at each generic arithmetic point φ to the coefficient C_(D_φ)(β,x) of the normalized classical Klingen series G_(D_φ), divided by Ω_(f_φ,can). Indices β are positive semidefinite Hermitian rank-two matrices; the degenerate indices det β=0 are included. Every degenerate coefficient (det β=0) belongs to (L_f,M,ξ^Σ L_ξ′^Σ). This is the boundary divisibility needed for a cuspidal congruence.

Assume D=(A,I,f,ψ,ξ,Σ) is Wan’s p-adic Eisenstein datum; the group is GU(2,2) over M/F with the ordinary projector, and neither GU(3,1) nor the semi-ordinary projector of Layer 2 enters; Σ contains p and every bad prime; local sections are generic at the interpolation points. Residual irreducibility, ordinary distinctness and the Gorenstein instance hold; the auxiliary finite ψ has the specified central restriction and is unramified outside Σ.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §§6–7; Theorem 82, pp.66–68; Theorem 88 and Remark 89, p.71; Theorem 27, p.23; the normalization G_D before Corollary 71, p.54. Actual source-specific integral family and boundary ideal.

The proof proceeds as follows. Use the unitary PEL datum of PELModuli §M5.6, the ordinary p-adic forms and q-expansions of gap:unitary-ordinary-igusa, the control of §1.2 extended to M/F, and the complex doubling identities of MetaplecticAutomorphicForms §§6.10a–6.11; the p-adic interpolation of the Siegel series and its pullback with Wan's sections is part of this target. Use ℓ_f rather than e_f to obtain integral coefficients, then check the local p sections and tame local factors against Wan’s interpolation formula. Evaluate the Siegel operator at every cusp; the degenerate coefficient computation gives the product of Rankin and abelian p-adic L-functions.

**API.**

- The raw Klingen series E_D(Z,x) on GU(2,2) over M/F is determined by D = (A, I, f, ψ, ξ, Σ) and Wan's local sections. Its normalization is G_D(Z,x) = W′(f)⁻¹L_D^(2)|µ(x)|_F^(−κ)E_D(Z,x), with the nonzero scalar applied once; C_D(β,x) denotes the β-th coefficient of G_D, which is therefore that scalar times the β-th coefficient of E_D.
- Coefficient extraction at an admitted x is a Λ_D-linear map from the ordinary Λ_D-adic forms on GU(2,2) of gap:unitary-ordinary-igusa to formal q-expansions Σ_β c(β,x)q^β, indexed by the positive semidefinite Hermitian β ∈ S(F), degenerate β included; for ℰ_D its values c_D(β,x) lie in Λ_D.
- Specialization at a generic arithmetic point φ is a ring map Λ_D → O_φ applied coefficientwise: φ(c_D(β,x)) = C_(D_φ)(β,x)/Ω_(f_φ,can) for every β at the same x, so extraction and specialization commute and no β-dependent unit enters.
- A Λ_D-adic form is determined by its expansions at all admitted x (q-expansion principle on the boundary sequence of Wan-2015 Theorem 27), so the family is unique.
- The integral family uses the integral congruence-line generator ℓ_f = η_f e_f of §5.2 (not an idempotent: ℓ_f² = η_f ℓ_f) and the canonical period Ω_(f_φ,can) of Theorem 82(ii). Without the Gorenstein hypothesis only the version Ẽ_D with the rational idempotent e_f (Wan's 1_f) and the Petersson-normalized L̃ of Theorem 82(i) is available (Remark 89), with coefficients in Frac(I) ⊗_I Λ_D.
- For det β = 0, c_D(β,x) ∈ L^Σ_(f,M,ξ)L^Σ_(ξ′)Λ_D at every admitted x. In terms of Theorem 27: at every boundary component of its exact sequence, every q-expansion coefficient of the image of ℰ_D under the Siegel operator lies in this ideal. This is not asserted for the raw coefficients of E_D.

**Checks.**

- For β = diag(1,0), det β = 0 and its coefficient lies in (L^Σ_(f,M,ξ)L^Σ_(ξ′)); for β = diag(1,1), det β = 1 and no divisibility is asserted. A definition demanding the divisibility at every β would put all coefficients of ℰ_D in the product ideal and leave §5.5 nothing to detect.
- If a raw coefficient of E_D is 2 and the normalizing scalar W′(f)⁻¹L_D^(2)|µ(x)|_F^(−κ) equals 3, the coefficient of G_D is 6. Inserting the scalar twice gives 18, and omitting it gives 2; only 6 matches the specialization formula.
- Over a DVR with uniformizer ϖ, a family with a coefficient 1 at some admitted x reduces modulo ϖ to a form with coefficient 1, while its multiple by ϖ reduces to 0 at every x. Only the first can serve as the primitive family of §§5.5–5.7. Changing Ω_(f_φ,can) by a unit u multiplies every specialized coefficient by u⁻¹ and keeps the lattice; changing it by ϖ does not.
- Boundary divisibility is tested at every admitted x, that is at every boundary component of the Siegel-operator sequence of Theorem 27, not only at the standard cusp. When that sequence has two boundary components, a form with constant term 0 at the first and 1 at the second satisfies the standard-cusp test and fails the all-cusp test.

*Needs:* §§1.1, 1.2 and 5.2; PELModuli §§M5.5 and M5.6; IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); MetaplecticAutomorphicForms §§6.10a and 6.11; PadicFamilies §§5.1, 5.6, 5.7, 5.8 and 5.9; PadicFamilies (gap:hilbert-hida-odd-degree).

### 5.4 Quaternionic period and primitive anticyclotomic input

Let f_(κ0) be an ordinary member of the parallel Hilbert family f of even parallel weight κ0 > 2 and trivial nebentypus (the weight Wan-2015 fixes before Theorem 86, p. 69), with tame level n = n⁺n⁻, where every prime of n⁺ splits in M and every prime of n⁻ is inert in M, and let φ_(κ0) : I → A be its weight specialization. The Σ-primitive functions live over the family: L^Σ_(f,M,ξ) ∈ I[[Γ_M]], the function constructed with the Klingen family in [§5.3](#53-normalized-hilbert-klingen-family-and-its-boundary) when the localized Hecke algebra is Gorenstein (the instance of §5.2; Wan-2015 Theorem 82(ii), p. 67), and L̃^Σ_(f,M,ξ) ∈ Frac(I) ⊗_I I[[Γ_M]] (Theorem 82(i)). Let β : I[[Γ_M]] → Λ⁻_(M,A) be the anticyclotomic specialization: the composite of φ_(κ0) on coefficients, I[[Γ_M]] → A[[Γ_M]] = Λ_(M,A), with the ring map Λ_(M,A) → Λ⁻_(M,A) that sends the cyclotomic variable to the point of the central critical value L(f_(κ0), κ0/2), so that β restricts the three-variable function to the anticyclotomic twists of that value. It extends to the elements of Frac(I) ⊗_I I[[Γ_M]] whose denominators in I lie outside ker φ_(κ0), with values in Frac(A) ⊗_A Λ⁻_(M,A) (Wan-2015 §7.3.1, pp. 69–70, where the point φ_0 is fixed). Define the integral anticyclotomic function L^(Σ,−)_(f,M,ξ) = β(L^Σ_(f,M,ξ)) ∈ Λ⁻_(M,A), normalized by Wan’s canonical period and the congruence-line generator of §5.2, and, when L̃^Σ_(f,M,ξ) is finite at φ_(κ0) in this sense, the rational function L̃^(Σ,−)_(f,M,ξ) = β(L̃^Σ_(f,M,ξ)) ∈ Frac(A) ⊗_A Λ⁻_(M,A), Petersson-normalized. For a place v | p of F, the v-restriction sets every anticyclotomic variable γ⁻_(v′,i) with v′ ≠ v equal to 1; it gives L^(Σ,−)_(f,M,ξ,v) ∈ A[[Γ⁻_v]] and L̃^(Σ,−)_(f,M,ξ,v) ∈ A[[Γ⁻_v]] ⊗_(ℤ_p) ℚ_p. For q ∈ Σ with q ∤ p let E⁻_(q,v) be the image under β and the v-restriction of the removed local Euler factor E_(f,M,ξ,q). At a nonsplit q the Frobenius of the prime of M above q is fixed by complex conjugation, so it has trivial image in the anticyclotomic quotient for odd p and E⁻_(q,v) is a constant of A; at a split q, E⁻_(q,v) has μ = 0 (SU §12.3.2, as cited in Wan-2015, p. 70). Say that f satisfies (NV1) at v if L̃^(Σ,−)_(f,M,ξ,v) ≠ 0 (Wan-2015 Definition 85, p. 69). Under (NV1) every E⁻_(q,v) is nonzero, and the primitive v-restricted function is L^(−)_(f,M,ξ,v) := L^(Σ,−)_(f,M,ξ,v)·∏_(q ∈ Σ, q ∤ p)(E⁻_(q,v))⁻¹ ∈ Frac(A) ⊗_A A[[Γ⁻_v]]. Say that f satisfies (NV2) at v if L^(−)_(f,M,ξ,v) lies in A[[Γ⁻_v]] and not in ϖ_A·A[[Γ⁻_v]] for a uniformizer ϖ_A of A. Wan-2015 Definition 85 places this condition on the Σ-imprimitive function; the condition is placed here on the primitive function, which is what the toric nonvanishing theorem behind Wan-2015 Theorem 86 controls, since the Σ-imprimitive function is divisible by ϖ_A as soon as one removed nonsplit factor is a nonunit.

Prove: (1) if ξ = 1, n⁻ is squarefree with number of prime factors ≡ [F:Q] mod 2, and ρ̄_f is ramified at every prime of n⁻, then (NV1) holds at every v | p; (2) if moreover the assumptions of Wan-2015 Theorem 8 (the Fujiwara instance of §5.1) hold, then (NV2) holds at every v | p (Wan-2015 Theorem 86, p. 70); consequently μ(L^(Σ,−)_(f,M,1,v)) = Σ_(q ∈ Σ nonsplit, q ∤ p) ord_(ϖ_A) E⁻_(q,v), and L^(Σ,−)_(f,M,1,v) ∉ ϖ_A·A[[Γ⁻_v]] if and only if every removed nonsplit factor E⁻_(q,v) is a unit of A. (3) Under the same hypotheses, for every height-one prime P of I[[Γ_M]] pulled back from a height-one prime of I[[Γ⁺_M]], ord_P L^Σ_(f,M,1) ≤ ord_P ∏_(v ∈ Σ nonsplit, v ∤ p) E_(f,M,1,v), the product of the removed nonsplit local Euler factors (Wan-2015 Lemma 87, p. 71); split removed factors do not contribute. The route compares the quaternionic self-pairing congruence period of the Jacquet–Langlands transfer with Wan’s canonical period up to an integral unit, and imports Hung/Hsieh nonvanishing with that period.

Assume p≥5 unramified in F; M/F CM with p split; κ0 > 2 even; residual irreducibility and ordinary distinctness; the split/inert decomposition n = n⁺n⁻ above; ξ = 1 for (1)–(3); the Gorenstein instance of §5.2 for the integral function; the Fujiwara instance for (2) and (3). Nonsplit imprimitive Euler factors are kept and may contribute positive μ; no imprimitive variant is asserted primitive.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §7.3.1, Definition 85 and Theorem 86, pp.69–70; Lemma 87, pp.70–71. Anticyclotomic specialization, per-place NV1/NV2, period comparison and exceptional Euler factors. The nonvanishing theorem behind Theorem 86 is Hung2017, Theorem B, as cited in Wan-2015, proof of Theorem 86, p. 70. Wan-2015 prints p > 5 and κ0 > 2 (Theorem 86 and the paragraph before it, pp. 69–70); the prime p = 5 is admitted because the only prime restriction Wan's printed proof adds beyond the hypotheses of Hung2017 Theorem B (cited by locator) is the stabilizer argument, which excludes p = 3 alone (Wan-2015, proof of Theorem 86, p. 70), while the p = 5 exception of Theorem 8 is part of the Fujiwara instance assumed in (2) and (3); this is the reading of [BCS-v2](https://arxiv.org/pdf/2405.00270v2), §1.5, p. 5, and Theorem 3.2.1, p. 7.

The proof proceeds as follows. Check stabilizer orders are prime to p (a p-torsion element would yield a field quadratic over F containing μ_p, so [F(ζ_p):F] = p − 1 would be at most 2, which for p unramified in F forces p = 3). Under the split/inert decomposition, squarefree n⁻ and residual ramification at n⁻, the transfer has the same localized Hecke algebra; under the Fujiwara instance the integral quaternionic forms of level n are free of rank one over it, so the self-pairing generates the congruence module and the quaternionic period is the canonical period. Apply the toric nonvanishing supplier at each v | p on its character domain, then compare primitive versus removed-Euler-factor normalizations for (3).

**Checks.**

- n−=1 is allowed when [F:Q]=2.
- A μ=0 assertion for every imprimitive function fails at nonsplit Euler factors and is excluded. Witness: p = 7, M = ℚ(√−3), the ordinary family through the curve 11a1, and q = 113, which is inert in M (113 ≡ 2 mod 3) with q ≡ 1 mod 7 and a_113 = 9 ≡ 2 mod 7. The base-change factor at q is (1 − α²q^(−κ0))(1 − β²q^(−κ0)), which at weight two equals ((q+1)² − a_q²)/q² = 12915/12769, of 7-adic valuation 1, and at every weight reduces modulo 7 to 4 − a_q² ≡ 0. Putting 113 in Σ multiplies every anticyclotomic coefficient by a nonunit, so the imprimitive function is divisible by ϖ_A while (NV2), a statement about the primitive function, is untouched.
- Two places v_1, v_2 above p, with variables X = γ⁻_(v_1) − 1 and Y = γ⁻_(v_2) − 1 in A[[X,Y]]: the v_2-restriction sets X = 0 and the v_1-restriction sets Y = 0. The function X is nonzero and not divisible by ϖ_A, yet its v_2-restriction is 0, so it fails (NV1) at v_2. The function X + Y restricts to Y and to X, both nonzero and not divisible by ϖ_A: (NV1) and (NV2) at both places. The function ϖ_A(X + Y) restricts to ϖ_A Y and ϖ_A X, nonzero but divisible by ϖ_A: (NV1) holds and (NV2) fails at both places. A global nonzero or primitive function is therefore not the per-place hypothesis.
- Level test: F real quadratic, n⁻ = 1 and n⁺ a prime inert in M. The labelled factor n⁻ satisfies the parity condition, but the inert part of n has one prime factor, of the wrong parity; the split condition on n⁺ excludes this level.
- Prime boundary: for p unramified in F, F ∩ ℚ(ζ_p) = ℚ, so [F(ζ_p):F] = p − 1. At p = 5 this degree is 4 > 2, so no element of B^×(F) of order 5 exists and the stabilizers have order prime to 5; at p = 3 the degree is 2 and the argument fails. A version admitting p = 3 is not supported by the proof.
- Domain of β: with I = A[[W]] and a family function W·T ∈ I[[Γ_M]], a map defined only on A[[Γ_M]] is undefined on W; the composite with φ_(κ0), W ↦ w(κ0), gives w(κ0)·β(T), which vanishes whenever f_(κ0) sits at W = 0. For a surviving anticyclotomic variable T, β(T) = T ≠ 0 in the domain Λ⁻_(M,A), so the product vanishes exactly when w(κ0) = 0; for T = γ_cyc − c with β(γ_cyc) = c the cyclotomic factor is killed and β(W·T) = 0 although w(κ0) may be p ≠ 0. The weight point is part of β.
- Weight boundary: (1)–(3) are stated at a member of weight κ0 > 2 only; the weight-two member of the same family is reached in §5.10 through such a member, not by applying the period comparison at weight two.

*Needs:* §§5.2 and 5.3; PadicFamilies (gap:anticyclotomic-nonvanishing-mod-p); OrdinaryAutomorphicFormsAndModularityLifting (gap:fujiwara-minimal).

### 5.5 Nonconstant Fourier coefficient coprimality

For ℰ_D, the ideal generated by the selected nondegenerate Fourier–Jacobi/theta pairings is contained in no height-one prime of Λ_D except possibly a prime pulled back from R+=I[[Γ_M+]]. At each remaining height-one prime dividing L_f,M,ξ^Σ there is an actual nonconstant coefficient which is a unit after localization. This supplies the coefficient which survives the cuspidal congruence; nonzero interpolation alone is insufficient.

Assume Wan’s irreducibility/distinctness and Gorenstein conditions and, when [F:ℚ] > 1, Wan's hypothesis Δ+ ((Δ) of Wan-2015): M is not contained in the narrow Hilbert class field of F, so that M/F is ramified at some finite place, which carries the prescribed local character, and every prime of F ramified over ℚ splits in M (Wan-2015 §1.1, p. 1); §5.10 assumes the same condition and §5.13 verifies it for its fields. For [F:ℚ] > 1 the auxiliary theta/CM character and its prescribed infinity type, conductor, unit value and congruence-period comparison come from gap:hilbert-cm-unit-congruence. For F = ℚ use gap:hecke-l-values-mod-p (Hsieh2012 Theorem A or Finis2006 Theorem 1.1 for the unit value) and §0.9 (the congruence-period comparison) with the corresponding hypotheses. The CM character is chosen with its period-normalized algebraic value a p-adic unit, with local Euler factors units and CM residual irreducibility/distinctness; all factors are tested on the chosen lattice.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Proposition 95, pp.78–79; Proposition 96, pp. 78–79, and its proof, pp. 79–81. Selected coefficient ideal and the CM unit computation.

The proof proceeds as follows. Apply the explicit Fourier–Jacobi identity and Hecke projection of Wan 95; keep its A_D,g factor in R+ and its B_D,g factor in Λ_D. Choose the auxiliary CM family and characters as in 96, using gap:hilbert-cm-unit-congruence on PadicFamilies, whose hypothesis Δ+ is assumed here, when [F:ℚ] > 1, and gap:hecke-l-values-mod-p with §0.9 when F = ℚ. Retain the infinity type at every CM embedding, the sign +1, local μ = 0 and the conductor extension required in Wan’s proof; the unit conclusion does not follow from the field and prime assumptions alone. Show the B factor is a unit and identify the remaining possible divisors as pulled-back primes.

**Checks.**

- For F = ℚ(√29), M = Fℚ(√−7) and p = 23, 29 ≡ 11² and −7 ≡ 4² mod 23. Thus p splits completely in M, [M:ℚ] = 4 and |Φ| = 2; the CM period has two components. The general-CM input applies to this carrier, while a K/ℚ-only function has only one CM component. The absolute discriminants 29 and (29·7)² give N(D_(M/F)) = (29·7)²/29² = 49, so 7 ramifies in M/F, and the ramified prime 29 of F splits in M since 29 ≡ 1 mod 7; Δ+ holds. Existence of θ and its unit value still comes from the character-construction theorem, not from splitting alone.
- For F = ℚ(√3), M = ℚ(ζ₁₂) and p = 13, the absolute discriminants are 12 and 144, so N(D_(M/F)) = 144/12² = 1: M/F is unramified at every finite place, and M is the narrow Hilbert class field of F. Although 13 splits completely in M (4² ≡ 3 and 5² ≡ −1 mod 13), there is no finite place of M/F to carry the auxiliary local character, and Δ+ excludes this pair. A contract stating only the splitting conditions would apply to it.
- For a self-dual auxiliary character with central root number −1, L = −L forces L = 0; its normalized value cannot be a p-adic unit. A sign +1 character still requires local μ = 0 and the conductor conditions of the supplier contract.
- At an excluded prime from R+ use the exceptional-prime target, rather than this coprimality statement.
- A single dense set of nonzero classical coefficients does not imply integral primitivity.

*Needs:* §§5.3 and 5.4; PadicFamilies (gap:hilbert-cm-unit-congruence); PadicFamilies (gap:hecke-l-values-mod-p); §0.9.

### 5.6 Wan’s coefficient Eisenstein ideal

For Λ_D→h_D, where h_D is the reduced localized cuspidal ordinary Hecke image, let J index the exact characteristic-polynomial coefficients, central-character values and ordinary U_p eigenvalues in Wan §9.1. For every unramified inert place include all coefficients of Q_v−Q_v,D and its central Z_v,0 difference; for each split place include Q_w−Q_w,D, Q_wbar−Q_wbar,D and both central Z_v,0^(i) differences. Use i_w=1 and i_wbar=2: Q_w uses T_i^(i_w) with the complementary central operator Z_0^(3−i_w), and Q_wbar uses T_i^(i_wbar) with Z_0^(3−i_wbar). The second polynomial uses the conjugate-prime index i_wbar throughout, including its complementary central operator. The polynomial constant coefficient is 1, so only degrees 1–4 contribute. At every v|p include u_t,v−λ_ℰ_D(u_t,v) for t=diag(p^a1,p^a2,p^a4,p^a3), a1≤a2≤a3≤a4. Reciprocity uses geometric Frobenius and the central character is σ_ψσ_ξ^−1. Write H_j∈h_D and λ_j∈Λ_D for these cuspidal operators and Eisenstein values. Let I_D be the ideal generated by H_j−λ_j, and define 𝔈_D as the kernel of Λ_D→h_D/I_D, the contraction of I_D along the coefficient map, which need not be injective. The exact Hecke-generator dictionary proves the structure map onto h_D/I_D is surjective, so Λ_D/𝔈_D≅h_D/I_D. The definition does not assume surjectivity or identify a reducibility ideal with a congruence ideal.

Assume the coefficient inclusion is a unital ring map; the Hecke carrier, reduced image and eigenvalues are those of IntegralHeckeAndGaloisDeterminants §§2.1–2.3 on the ordinary forms of gap:unitary-ordinary-igusa. The actual index set J contains all operators listed in Wan §9.1, with its central and U_p relations.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §9.1, pp.81–83 (definitions of h_D, I_D and 𝔈_D). The source-specific operator list and coefficient kernel, using existing ideal theory. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §§9.5.2–9.5.5, pp.130–132. The two split Hecke families and complementary Satake variables justify the corrected conjugate-prime operator index.

The proof proceeds as follows. Use the existing ideal span, preimage and quotient API to specialize the generic congruence construction to the source eigenpacket. Prove its kernel and generator relations using membership in a generated ideal. Use the Hecke-generation dictionary of IntegralHeckeAndGaloisDeterminants §§2.1–2.3 and §3a.1: polynomial-coefficient, central and ordinary differences reduce every generator to its Eisenstein scalar. Check that inverted central/ordinary/localizing elements have unit scalar images. This proves coefficient-to-quotient surjectivity; scalar maps otherwise give only the stated kernel inclusion.

The interface is used in [§5.7](#57-cuspidal-lift-and-eisenstein-congruence-length) to Its local quotient length measures the cuspidal Eisenstein congruence.; in [§5.8](#58-polarized-121-extension-with-ordinary-local-conditions) to 𝔈_D is the coefficient intersection J0 required for the Ribet extension theorem..

**API.**

- r∈𝔈_D iff its image in h_D belongs to the ideal generated by the operator differences.
- 𝔈_D equals the kernel of the coefficient map followed by the quotient h_D→h_D/I_D.
- Each operator H_j and the image of λ_j agree in h_D/I_D.
- If the coefficient-to-quotient map is surjective, its induced map Λ_D/𝔈_D→h_D/I_D is a ring equivalence.
- For a commuting coefficient/Hecke square and transported operator values, the extension of 𝔈_D is contained in the new coefficient Eisenstein ideal; equality requires a proved kernel-base-change condition.

**Checks.**

- For eigenvalues 1, 2, 3, 4 the reciprocal polynomial is 1 − 10X + 35X² − 50X³ + 24X⁴, so minus its X coefficient is 10, the trace. Minus its cubic coefficient is 50. The monic characteristic polynomial is X⁴ − 10X³ + 35X² − 50X + 24; conversion preserves the trace 10.

- For Λ=h=ℤ, identity coefficient map, one operator H=7 and λ=7, E=(0).
- For Λ=h=ℤ, identity coefficient map, H=8 and λ=3, E=(5), not (25).
- For Λ=h=ℤ, identity coefficient map, H=2 and λ=1, E=ℤ.
- For the coefficient map ℤ→ZMod 5 and an operator equal to its eigenvalue, I_D=0 but 𝔈_D=(5), detecting the coefficient kernel.
- The ideal lives in Λ_D, distinct from I_D in h_D.
- The coefficient map need not be injective in the general algebraic prototype; arithmetic h_D uses the actual coefficient action.
- At a split prime the two independent Satake operator families are retained; changing only the central operator in Q_wbar is insufficient.

*Needs:* §0.4; IntegralHeckeAndGaloisDeterminants §§2.1, 2.2 and 2.3; Mathlib `Ideal.comap`; Mathlib `Ideal.mem_comap`; Mathlib `Ideal.map_span`.

### 5.7 Cuspidal lift and Eisenstein congruence length

At a height-one prime P of Λ_D not pulled back from R+, with a nonconstant Fourier coefficient of ℰ_D outside P, construct a cusp family congruent to ℰ_D modulo the Rankin factor L^Σ. After localizing the source at P, the induced Λ_D,P-algebra map (h_D/I_D)⊗_ΛD Λ_D,P→Λ_D,P/(L^Σ) is onto. The separate global coefficient map Λ_D→h_D/I_D is onto by the Hecke-generator dictionary. Its kernel 𝔈_D satisfies ord_P(𝔈_D)≥ord_P(L^Σ). In the rational projector variant retain b e_f integral, b(φ0)≠0, P⊂φ0, and the coefficient nonvanishing condition on b times the rational family.

Assume the integral family and coprimality theorem, ordinary boundary exact sequence and lifting/control theorem hold for all cusps. P is height one; the local ring is a DVR; the Rankin factor is nonzero. The unwanted abelian factor is removed only with the actual unit/localization argument of Wan.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Theorem 27, p.23; §9.1 and Theorem 97, pp.81–84. Cuspidal congruence and orientation of the local length bound.

The proof proceeds as follows. Use Wan 27 to lift the cuspidal reduction of the family; verify the boundary and flatness hypotheses of the form module. In the localized cusp module, evaluate a Hecke translate at a coefficient invertible at P. Divide by that coefficient to obtain a Λ_D,P-linear functional. The congruent eigenvalue relations modulo P^r prove multiplicativity and unit preservation on the Hecke quotient; linearity alone does not make a ring map. The localized quotient map gives 𝔈_D Λ_D,P⊂P^r Λ_D,P, with r=ord_P(L^Σ). Use source-specific Gorenstein duality only where required, and keep the coefficient/global quotient distinct from its localization.

**Checks.**

- Orientation: at a height-one P with ord_P(L^Σ) = 2 and a nonconstant coefficient outside P the conclusion is ord_P(𝔈_D) ≥ 2; at a P with ord_P(L^Σ) = 0 it says nothing, and a strict inequality would be false whenever 𝔈_D is a unit at P.
- A vanishing/nonunit coefficient cannot be used as a denominator.
- The unlocalized map R/P→Frac(R/P) need not be onto: for R=k[x,y], P=(x), it is k[y]→k(y). Localization of the Hecke source is essential.

*Needs:* §§1.2, 5.3, 5.5 and 5.6; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 5.8 Polarized 1+2+1 extension with ordinary local conditions

Import the integral determinant and reconstruction ingredients of IntegralHeckeAndGaloisDeterminants §§1.3–1.4 and 4.1–4.2, and apply the polarized lattice theorem [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups) over (F, M) with middle rank two (Wan Proposition 98) to the actual cuspidal rank-four Galois representation congruent to χ′⊕ρ⊕χ. Verify all ten hypotheses of Wan §9.2.1 on the completed height-one Hecke algebra. The resulting extension classes belong to the Σ-imprimitive ordinary Selmer group for the same rank-two lattice and twist as the Rankin function. For P0⊂I[[Γ_M]] height one not pulled back from R+=I[[Γ_M+]], require that P=P0Λ_D is the corresponding height-one prime. If the plus/minus local constituents are residually disjoint modulo P, obtain ord_P0(char X^Σ)≥ord_P(𝔈_D).

Assume Λ_D is a Krull domain; h_D is finite, local and reduced. The selected localized/completed congruence model satisfies the coefficient-intersection and quotient clauses of Wan §9.2.1; these clauses require proof and do not follow merely from finite flatness. The three residual constituents are disjoint, the rank-two one absolutely irreducible, and the polarization and local ordinary characteristic polynomials have Wan’s twists. A trace congruence alone produces no integral representation; the scalar Selmer term and the common-local-constituent condition are retained; and the two-character rank-two Ribet theorem of IntegralHeckeAndGaloisDeterminants Layer 6 is not the rank-four three-block length theorem used here. The cuspidal characteristic-zero constituents are absolutely irreducible or satisfy the precise rank-two alternative in condition (10); CAP exclusion and ordinary modularity lifting prove this alternative. The scalar-character Selmer characteristic ideal has valuation zero at P by the totally real character main conjecture; the plus/minus local pieces have no common irreducible constituent modulo P. For primes containing 𝔈_D, use A=completion of (Λ_D)_P, a DVR, and the corresponding completed Hecke factor R. Choose the source model A0,R0,I0,J0 so I0∩A0=J0, A0/J0≅R0/I0 and the extended ideals contract as required by Wan §9.2.1. Global I_D,𝔈_D do not automatically contract unchanged after height-one localization. A supplier may use their P-primary saturations only after proving the same local quotient lengths and valuations. At a prime not containing 𝔈_D the congruence valuation is zero. Wan setup (1)–(3): use H=G_F,Σ, G=G_M,Σ and its conjugation c. The continuous polarization character ν extends to H; χ is a continuous character of G and χ′=νχ^(−c) has different residual character. The rank-two ρ is defined on a free A0-lattice, satisfies ρ^c≅ρ^∨⊗ν, and its residual representation is absolutely irreducible and disjoint from both residual characters. Residual disjointness is witnessed by coprime characteristic polynomials of some group-algebra element, as in the supplier theorem. Wan setup (4)–(6): the rank-four σ is defined over the image of R0 in R, with integral traces and a finitely generated R-orbit module for every vector. It satisfies the same polarization; the proper congruence ideal I has nonzero J=A∩I and A/J≅R/I, and tr σ≡χ′+tr ρ+χ modulo I. The irreducible ρ has a compatible polarization pairing Φ with Φ^t=−ν(c)Φ. Wan setup (7)–(9): at every v|p the plus and minus rank-two lattice pieces are free over A0, and the plus and minus rank-four pieces are free over R⊗_A Frac(A). For every element x of the local group algebra, the plus characteristic polynomial of σ agrees modulo I with Ch(ρ^+,x,T)(1−χ(x)T); the minus relation uses χ′. The two combined local pieces have no common residual irreducible constituent. Wan setup (10): for each characteristic-zero specialization of R⊗_A Frac(A), σ is absolutely irreducible or has the specified absolutely irreducible rank-two subrepresentation whose trace is congruent to χ+χ′. The ordinary lifting and CAP exclusion supplier proves this alternative; it is not assumed for an arbitrary trace. Match the exact twist dictionary of Wan §9.2.2, p.87: ρ=ρ_f⊗σ_ξ^(−c)σ_ψ^c ε^(−2), χ=σ_ψ^c ε^(−3), and χ′=νχ^(−c), using ε for the p-adic cyclotomic character. The final Selmer lattice is (T_f⊗I[[Γ_M]])(ε_M^(−c))⊗ε and its ordinary line, with the actual coefficient map and primitive/Σ conventions. All height-one extension and coefficient normalization comparisons are verified before identifying the valuations. Characteristic valuations use the divisorial height-one-length construction over the normal coefficient ring, with faithful localized/completed scalar transport; principality is not inferred from normality.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), §9.2.1, Proposition 98, pp.84–86; §9.2.2, Theorem 100, pp.87–88. Actual polarized extension instance and ordinary local-condition check.

The proof proceeds as follows. Use the determinant and Hecke-algebra ingredients of IntegralHeckeAndGaloisDeterminants. Its Layer 6 statement concerns rank-two representations with two residual characters; it is not Wan’s rank-four χ′⊕ρ⊕χ theorem, which is the case n = 2 over (F, M) of [§0.7](#07-the-lattice-construction-eisenstein-ideals-bound-selmer-groups). Use the [§0.6](#06-local-conditions-satisfied-by-the-automorphic-extension-classes) bridge for its ordinary Selmer realization. Match Wan’s characters χ, χ′, ν, rank-two lattice and cyclotomic/CM twists using the displayed formulas on p.87; keep the polarization sign. Use the ordinary lifting alternative of gap:fujiwara-minimal and CAP exclusion for condition (10), and Wiles's main conjecture (IntegralIwasawaTheory §12.1, `wilesMainConjecture`) for the character χ′/χ of the totally real field, with the identification of its characteristic ideal with the scalar Selmer module under Wan's local conditions and cyclotomic twist made here, to kill the unwanted character extension at the non-pulled-back prime. Apply the length theorem and compare the resulting local conditions with the source Selmer group; if X is not torsion the source’s extended characteristic ideal is zero, not a nonzero genuine characteristic ideal.

**Checks.**

- Degree count at v | p: tr σ(1) = 1 + 2 + 1 = 4, and the plus pieces have ranks 1 (ρ^+), 1 (χ) and hence 2 (σ^+), so Ch(σ^+, x, T) has degree 2 = deg Ch(ρ^+, x, T)(1 − χ(x)T); a plus piece of σ of rank 3 cannot satisfy clause (7) of Wan §9.2.1.
- Orientation of the scalar term: ord_P(𝔈_D) = 2 with the scalar Selmer characteristic ideal of χ′/χ of valuation 0 at P gives ord_(P_0)(char X^Σ) ≥ 2; with scalar valuation 1 only ≥ 1 follows, through §0.7(iv); with scalar valuation 2 nothing follows.
- Localization changes contractions: in A = ℤ the ideal (6) localized at (2) becomes 2ℤ_((2)), whose contraction to ℤ is (2) ≠ (6); equality of a localized congruence ideal with its global contraction must be proved, not presumed.

*Needs:* §§0.1, 0.5, 0.6, 0.7, 5.6 and 5.7; IntegralHeckeAndGaloisDeterminants §§1.3, 1.4, 3a.1, 4.1 and 4.2; OrdinaryAutomorphicFormsAndModularityLifting (gap:fujiwara-minimal); IntegralIwasawaTheory §12.1; SelmerIwasawaCohomology §3.11; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 5.9 The pulled-back height-one primes

For a height-one P pulled back from I[[Γ_M+]], bound ord_P(L^Σ) by the sum of valuations of the nonsplit removed Euler factors, by §5.4(3), which rests on (NV2) at every v | p and the period comparison. If X^Σ is torsion, Poitou–Tate and the vanishing of the compact global term give the exact primitive/imprimitive characteristic-ideal comparison with those local factors. Hence ord_P(char X^Σ)≥ord_P(L^Σ). If X^Σ is not torsion, record only the zero extended-ideal containment. No uniform imprimitive μ=0 assertion is made.

Assume the ordinary primitive and imprimitive local conditions use the same lattice; Σ includes bad primes and p. The hypotheses of §5.4(2) hold, so that (NV2) holds at every v | p; local H¹ finite-part modules have the indicated Euler characteristic ideals; the necessary compact global term vanishes after checking torsion and torsion-freeness. Nonsplit factors with positive μ are included on both sides. The non-torsion case is not reported as a proof of torsionness.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Lemma 87, p.71; proof of Theorem 101, p.89. Exceptional primes and local-factor comparison rather than automatic primitivity.

The proof proceeds as follows. Apply Wan 87 to the primitive-normalized function with the nonsplit Euler product retained. Use the Selmer supplier’s Poitou–Tate exact sequence; prove its global compact term is both torsion-free (residual irreducibility) and torsion under the stated cotorsion hypothesis. Match each local characteristic divisor with its analytic Euler factor and use divisorial characteristic multiplicativity. Use the divisorial characteristic ideal of gap:divisorial-char-ideal, not the principal-generator theorem of PadicMeasuresIwasawaAlgebras §4.6, which is available only for a UFD.

**Checks.**

- Primitive analytic valuation 0 and removed nonsplit factor valuation 1 give imprimitive analytic valuation 1; primitive Selmer length 2 and local term length 1 give imprimitive length 3, and the bound reads 3 ≥ 1. With primitive length 0 and the local term dropped on the Selmer side only, it would compare 0 with 1 and fail.

*Needs:* §§0.2 and 5.4; SelmerIwasawaCohomology §§2.23 and 3.17; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 5.10 Wan’s parallel Hilbert-family divisibility

Let F be totally real of degree d, p≥5 unramified in F, M/F CM with p split, and I a local normal finite integral extension of the parallel Hida weight algebra. Let f be a nearly ordinary I-adic eigenform of trivial character with an ordinary specialization of even parallel weight κ0 > 2 and trivial nebentypus, at which §5.4 is applied. A family through an ordinary weight-two form of trivial nebentypus has such a member, of parallel weight p + 1 ≡ 2 mod (p − 1), by the control theorem for nearly ordinary Hilbert forms (PadicFamilies §5.8, and gap:hilbert-hida-odd-degree for odd d); so the weight-two members are covered. Under residual irreducibility over M, distinctness, the full Wan 8/Fujiwara instance, Δ+ (M not in the narrow Hilbert class field of F and F/Q-ramified primes split in M), tame level n = n⁺n⁻ with every prime of n⁺ split in M and every prime of n⁻ inert in M, squarefree n⁻ with parity d, and residual ramification at all n⁻, prove char^Σ(X_f,M)⊂(L_f,M^Σ). For Σ including all bad primes, the normalized function is integral. For arbitrary Σ the result is a fractional-ideal statement with the Euler factors restored. Here char^Σ is the divisorial characteristic ideal defined by height-one lengths over the normal coefficient ring when the finite dual is torsion; it need not be principal. The principal/UFD characteristic-generator interface does not cover this generality; in the non-torsion case Wan’s assertion uses zero.

Assume all conditions in the statement, including the integral Gorenstein period normalization and the same lattice in the analytic and Galois comparisons. No general main conjecture for an arbitrary unitary-group representation or arbitrary weight Hida family is inferred.

The source is [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Theorems 3 and 101, pp.3–4 and 88–89. Parallel-family theorem with fractional and integral domains separated. Wan-2015 prints p > 5 and κ0 > 2 in Theorems 3 and 101; the proof of Theorem 101 uses the prime restriction only through Theorem 86, whose proof excludes p = 3 alone (see §5.4), and [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Theorem 3.2.1, p. 7, and §1.5, p. 5, apply the theorem for p > 3 with the p = 5 exception of Theorem 8 carried by the Fujiwara instance.

The proof proceeds as follows. Combine the coefficient coprimality, congruence length and Galois extension bounds at non-pulled-back primes. Use the exceptional-prime target on the complementary primes. Import height-one detection of divisorial ideal containment over the normal coefficient ring; remove/add local factors through Poitou–Tate to treat each Σ.

**Checks.**

- Weight two is reached through a member of weight κ0 > 2: for g of weight two and p = 5, the same family has the member of parallel weight 6 ≡ 2 mod 4, trivial nebentypus, at which §5.4 applies; a version that applied §5.4 at κ0 = 2 itself would need the uncertified Hung2017 period input at weight two, and a version without any member of weight > 2 has no cited source.
- p = 5 is admitted: [F(ζ_5):F] = 4 for F unramified at 5, so the stabilizer argument of §5.4 goes through, and the Theorem 8 exception at p = 5 (projective image PGL₂(𝔽₅) with the cyclotomic character through the abelianization) is excluded by the Fujiwara instance; p = 3 is not admitted.
- Separate the source’s extended ideal from cotorsion needed to use a nonzero characteristic divisor.

*Needs:* §§5.4, 5.7, 5.8 and 5.9; PadicFamilies §5.8; PadicFamilies (gap:hilbert-hida-odd-degree); PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 5.11 Arithmetic specialization with control corrections

At the ordinary weight-two point φ:I→O giving g_F, extend φ to Λ_D→Λ_M and compare the specialized Rankin function with the fixed-form normalization. Choose the principal analytic majorant (f) containing the big divisorial characteristic ideal, as supplied by the family divisibility. Prove φ(f)≠0 and the ordinary Selmer control hypotheses; SU Corollary 3.2.9 then gives char_ΛM(X_specialized)⊂(φ(f)), with any nonvanishing Tor/local correction retained in the precise corrected bound. This does not assert that the image of a possibly nonprincipal big characteristic ideal contains the specialized characteristic ideal. In a separately proved principal/UFD case one may take f to be a characteristic generator. The Eisenstein coefficient kernel has only the stated base-change inclusion until its own kernel compatibility is proved.

Assume φ is the point of the same parallel family; the integral period and congruence-line generator match the fixed-form normalization. Finite Selmer duals and compatible ordinary/away-p local conditions; residual no-invariants and local ordinary quotient hypotheses needed for control. A height-one generator must have nonzero specialization before cancellation.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proof of Theorem 3.2.1, p.8 (arXiv v2 p.7). Weight-two specialization, whose control and integral normalization must be checked. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Proposition 3.2.8, Corollary 3.2.9, pp.23–24. Control followed by specialization of a principal majorant of the characteristic divisor; the normal coefficient ring need not be a UFD.

The proof proceeds as follows. Use the imported Hida control theorem to identify the form and its Galois lattice at φ. Apply derived control and its Tor spectral sequence; prove the kernel/localization-image corrections vanish using the actual residual representation, not irreducibility as a generic substitute. Apply SU Corollary 3.2.9 to a nonzero-specializing principal majorant f of the big characteristic divisor, in particular the analytic Rankin bound. Then compare its specialized period and Euler factors on the same O[[Γ_M]]. Rational-specialization supplies only its rational-lattice statement; it does not prove the integral comparison. Use the residual detection of DeformationAndDerivedPatchingAlgebra §7.3 only for a pseudo-coherent comparison cone, and its support base change §6.2 for finite modules only.

**Checks.**

- Specialization against a pseudo-null summand: for A = O[[X,Y]], φ : X ↦ 0 and X = A/(X + p) ⊕ A/(X, Y), Ch_A(X) = (X + p) because the second summand is pseudo-null; the principal majorant f = X + p has φ(f) = p ≠ 0, and X/XX ≅ O[[Y]]/(p) ⊕ O[[Y]]/(Y) has characteristic ideal (pY) ⊊ (p) = (φ(f)): the pseudo-null summand reappears after specialization and the containment of SU Corollary 3.2.9 is strict. With f = X instead, φ(f) = 0 and nothing is concluded; a rule that applied φ to the divisorial ideal (X + p) and declared the result the specialized characteristic ideal would miss the factor Y.
- Tensor product against a kernel: for the injection ℤ_p —p→ ℤ_p with cokernel 𝔽_p, applying ⊗ 𝔽_p gives the zero map 𝔽_p → 𝔽_p, not injective; a Selmer kernel computed before specialization is not the kernel after it, which is why the Tor correction is retained.
- Finite flatness does not give regularity: O[[x,y,z]][t]/(t² − x²) is finite flat of rank 2 over O[[x,y,z]], reduced for odd p and singular (§3.2); a specialization argument that assumed a regular branch would not apply to it.

*Needs:* §§0.3 and 5.10; SelmerIwasawaCohomology §§3.10, 3.11 and 3.16; PadicFamilies §§5.8 and 5.9; PadicFamilies (gap:hilbert-hida-odd-degree); DeformationAndDerivedPatchingAlgebra §§6.2 and 7.3; PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### 5.12 The BCS quartic-CM input

For a weight-two elliptic newform g of level N and good ordinary p>3, let F be real quadratic with gcd(pN,D_F)=1, and M/F CM quadratic, p split, gcd(NO_F,D_M/F)=1. Require residual irreducibility over M, the exact H1/minimal-lift conditions, both local inertia checks of the Fujiwara instance, and Δ+. If n− is squarefree with an even number of inert prime factors and the residual representation is ramified at each factor, prove (L_p(g_F/M))⊇char(X_ord(g/M∞)) in O[[Γ_M]], in the torsion case. State separately the source’s zero-ideal containment when the dual is not torsion; torsion must come from the explicit Selmer/Kato supplier. This is the source-qualified integral engine used in Layer 6.

Assume all field, local and residual hypotheses in the statement; p>3 entails p≥5. The integral ordinary local conditions away p are BCS §2’s locally trivial ones; compare Wan’s inertia/Σ conventions through actual local Euler modules before changing primitive status. The fixed-form analytic object is the normalized specialization of the family object; the exceptional induced local type has reducible inertia, and the required Δ+ uses the narrow Hilbert class field. Both are checked explicitly in the two following field-selection targets. The output is one divisibility; no quartic-CM main-conjecture equality is claimed.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Theorem 3.2.1, p.8; §2, pp.6–7. The quartic-CM specialization with strengthened explicit supplier conditions. [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Theorems 8, 82 and 101, pp.6–7, 66–68, 88–89. Integral family input, not a universal torsion theorem.

The proof proceeds as follows. Verify the full minimal theorem instance and the canonical period. Apply the family divisibility and arithmetic specialization targets on the same coefficient ring and lattice. Remove precisely the Euler factors for the fixed primitive Selmer convention; record any nonunit rather than cancel it without a comparison. Use the separate torsion supplier for a genuine characteristic ideal.

**Checks.**

- Parity of n⁻: the empty product n⁻ = 1 has zero inert factors and 0 ≡ 2 mod 2, so it is admissible in degree two; a single inert prime gives 1 ≢ 0 and is excluded; two inert primes at each of which the residual representation is ramified are admissible.

*Needs:* §§0.1, 0.2, 5.1 and 5.11; PadicMeasuresIwasawaAlgebras §4.6; SelmerIwasawaCohomology §§3.2, 3.11, 3.18, 3.19 and 3.20.

### 5.13 Discharging the auxiliary-field hypotheses

For imaginary quadratic K and real quadratic F satisfying the following field conditions, prove the quartic engine’s conditions. K has odd discriminant not −3, all primes N split, and p splits; F has odd discriminant coprime pN, p inert, D_F-primes split in K, and an N-prime ℓ is inert in F exactly when ℓ≡−1 mod p. Residual irreducibility holds over M=FK and G_(F(ζ_p)) (absolute irreducibility is verified for the elliptic application), with the p=5 exceptional case excluded. Then p splits in M/F, discriminants are coprime to N, n−=1, both local q_v tests hold, and a minimal modular lift base-changes to a minimal lift over F. These conditions force M/F to be ramified at a finite place, so M is not contained in the narrow Hilbert class field of F: an odd prime dividing D_K does not divide D_F, because the primes dividing D_F split in K, so it is unramified in F and ramifies in M/F. This is a conditional verification; the existence theorem of §6.4 is not an input.

Assume the complete selected-field conditions, rather than arbitrary quadratic fields, and the exact minimal modular lift over ℚ and its base change supplied by gap:minimal-lift-base-change. The p=5 auxiliary exclusion F≠Q(ζ5)+ is available; for elliptic representations the projective exception is also excluded by Fujiwara 9.8. No Heegner or anticyclotomic endpoint is used.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proposition 5.2.1 and Lemma 5.2.3, pp.11–12 (v2 pp.9–10). Discharge all conditions before using the weaker endpoint hypotheses. [Wan-2015](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf), Proof of Theorem 103, pp.91–92. Minimal base-change lift route. [Fujiwara](https://arxiv.org/pdf/math/0602606v2), Definition 6.11, pp.54–55; Proposition 9.8, p.83. Minimality and elliptic p=5 exception.

The proof proceeds as follows. Use the pinned multiquadratic Galois and prime-splitting declarations for F, K and their compositum; the character/tower identifications are inherited from the supplied elliptic/Selmer comparison. The splitting dictionary is NumberFieldArithmetic §1.1. Auxiliary-field existence is §6.4. At ℓ|N, inertness in F turns q=ℓ into q=ℓ²≡1 when ℓ≡−1; otherwise q≠−1 already. Outside N the residual representation is unramified; at p the ordinary residual representation is reducible/distinguished. Thus both local inertia tests are discharged. Match all six clauses of Fujiwara 6.11 under base change; invoke the specific local minimality theorem supplied by the deformation owner. Since an odd prime q dividing D_K does not divide D_F, M/F is ramified at the primes above q. Verify n−=1 directly from Heegner splitting in K.

**Checks.**

- For p = 5 and ℓ = 19 ≡ −1 mod 5 dividing N, ℓ is inert in F and q_v = 19² = 361 ≡ 1 mod 5, distinct from −1 ≡ 4; for ℓ = 11 ≡ 1 mod 5, ℓ splits in F and q_v = 11 ≡ 1 mod 5. In both cases the test q_v ≢ −1 mod p holds; with ℓ = 19 split in F instead, q_v = 19 ≡ −1 mod 5 and the test fails.
- Δ+ needs no extra choice: for K = ℚ(√−7), the prime 7 ramifies in K and cannot divide D_F, so FK/F is ramified above 7 for every F satisfying the conditions.

*Needs:* OrdinaryAutomorphicFormsAndModularityLifting (gap:fujiwara-minimal); GlobalGaloisDeformations (gap:minimal-lift-base-change); Tau Ceti `NumberField.ncard_primesOver_multiquadratic_iff`; Tau Ceti `TauCeti.Multiquadratic.isGalois`.

### Examples

For k[X,Y] and P=(X), the global quotient by P is k[Y], whereas the quotient of the localization k[X,Y]_P by P is k(Y). The global coefficient map to k(Y) is not surjective. A Hecke-to-Λ_P/(L) congruence quotient must therefore localize its source before asserting surjectivity. Clearing a rational eigenprojector by b with b(φ₀)≠0 makes b a unit at every P⊆ker φ₀; it gives no such claim at an unrelated P.

In degree [F:Q]=2, n⁻=1 has zero prime factors and satisfies the even parity condition. If ℓ≡−1 mod p is inert in F, its residual cardinality becomes q_v=ℓ²≡1 mod p, which is different from −1 for p odd. At p=5 the values 1 and −1=4 are distinct. For the two split Hecke families i_w=1 and i_w̄=2, the complementary central factors have indices 2 and 1 respectively; a repeated i_w in both operator families would incorrectly use the first Satake polynomial twice.

### Dependencies

Earlier layers: §§0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 1.1 and 1.2. Suppliers: DeformationAndDerivedPatchingAlgebra §§6.2 and 7.3; GlobalGaloisDeformations (gap:minimal-lift-base-change); IgusaVarietiesAndTorsionConcentration (gap:unitary-ordinary-igusa); IntegralHeckeAndGaloisDeterminants §§1.3, 1.4, 2.1, 2.2, 2.3, 3a.1, 4.1 and 4.2; IntegralIwasawaTheory §12.1; MetaplecticAutomorphicForms §§6.10a and 6.11; OrdinaryAutomorphicFormsAndModularityLifting (gap:fujiwara-minimal); PELModuli §§M5.5 and M5.6; PadicFamilies §§5.1, 5.6, 5.7, 5.8 and 5.9, (gap:hilbert-hida-odd-degree), (gap:anticyclotomic-nonvanishing-mod-p), (gap:hecke-l-values-mod-p), (gap:hilbert-cm-unit-congruence); PadicMeasuresIwasawaAlgebras §4.6, (gap:divisorial-char-ideal); SelmerIwasawaCohomology §§2.23, 3.2, 3.10, 3.11, 3.16, 3.17, 3.18, 3.19 and 3.20. Libraries: Mathlib `Ideal.comap`; Mathlib `Ideal.map_span`; Mathlib `Ideal.mem_comap`; Mathlib `Ideal.span_singleton_mul_left_unit`; Tau Ceti `NumberField.ncard_primesOver_multiquadratic_iff`; Tau Ceti `TauCeti.Multiquadratic.isGalois`.

## Layer 6: The early two-variable product bound

### 6.1 The ordinary two-variable Perrin-Riou/Greenberg equivalence (BCS Theorem 4.1.3, Corollary 4.1.4)

Let g ∈ S_2(Γ_0(N)) be an elliptic newform, p ∤ 2N an ordinary prime for g, and K imaginary quadratic with p split (spl), (D_K, N) = 1 and ρ̄_g irreducible over G_K (irr_K). The following are equivalent: (i) X_ord(g/K_∞) is Λ_K-torsion and (L^PR_p(g/K)) ⊇ ch_(Λ_K)(X_ord(g/K_∞)) in Λ_K ⊗ ℚ_p; (ii) X_Gr(g/K_∞) is Λ_K-torsion and (L^Gr_p(g/K)) ⊇ ch_(Λ_K)(X_Gr(g/K_∞)) in Λ^ur_K ⊗ ℚ_p; the same holds for the opposite divisibilities and before inverting p (BCS Thm 4.1.3). For two newforms g, g′ with p ∤ 2NN′ ordinary for both and K satisfying (spl), (D_K, NN′) = 1 and (irr_K) for both, the product statements (L^PR_p(g/K)·L^PR_p(g′/K)) ⊇ ch(X_ord(g/K_∞))·ch(X_ord(g′/K_∞)) and (L^Gr_p(g/K)·L^Gr_p(g′/K)) ⊇ ch(X_Gr(g/K_∞))·ch(X_Gr(g′/K_∞)) are equivalent, in either direction (BCS Cor. 4.1.4). Prove these equivalences (BCS Theorem 4.1.3 and Corollary 4.1.4). The two-variable zeta element is the Beilinson–Flach class BF_α ∈ H¹_(F_ord,rel)(K, T_g(α) ⊗̂ Λ_K) of g against the CM Hida family, the fixed-form form of [§2.15](#215-λ-adic-beilinsonflach-classes-for-a-hida-family-and-the-cm-family) (not the CW form, which needs p > 3, nor the FW form, which needs K ramified at a level prime), with its two explicit reciprocity laws: a Coleman map at v̄ sends p^−(loc_v̄ BF_α) to the Perrin-Riou function, and loc_v BF_α lies in the ordinary line with a Coleman map sending it to the Greenberg function, both through injective Λ_K-linear maps with pseudo-null cokernel (CGS23 Theorem 3.1.1, p. 17, and Corollary 3.1.3, p. 18, from KLZ17 and BDP22; these are the reciprocity laws of [§2.16](#216-explicit-reciprocity-for-beilinsonflach-classes)). The normalizing factors are the congruence ideal of the CM family, generated by h_K·L_v(K)^− (CGS23 proof of Corollary 3.1.3, from [§0.9](#09-cm-theta-family-congruence-and-katz-normalization-for-the-clw-integrality-input)-type input), and deg(π_•)·H_p(g) for the curve E_• with T_pE_• ≅ T_g.

Assume BCS Thm 4.1.3 has (irr_K), which implies H⁰(K,g[p])=0 and hence the van_K condition needed in the integral comparison. The source asserts both directions, including the integral version under these hypotheses. No claim is made about what survives if van_K is removed outside this setting. The reference to Proposition 4.1.3 in the proof of BCS Proposition 5.2.1 means Theorem 4.1.3. The anticyclotomic Theorem 4.2.1 of BCS, which belongs to HeegnerPointEulerSystems Layer 8b, is not used.

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Thm 4.1.3 and proof, Cor. 4.1.4, p. 8. Equivalence of the two-variable Perrin-Riou and Greenberg main conjectures, in both directions and before inverting p, and its two-form product version; the proof rests on CGS23 Prop. 3.2.1 and the references there. [CGS23](https://arxiv.org/pdf/2303.04373v1), Theorem 3.1.1, p. 17; Corollary 3.1.3, p. 18; Proposition 3.2.1 and proof, pp. 18–19. The Beilinson–Flach class, its two reciprocity laws and the two four-term Poitou–Tate sequences, on the cyclotomic line under E_•(K)[p] = 0 and nonvanishing of the two cyclotomic restrictions; the two-variable argument is the same with Λ_K in place of Λ_K^+.

The proof proceeds as follows. Writing H for the rank-one global module, Z for the two-variable zeta class and X_st for the strict Selmer dual, the two Poitou–Tate sequences give ch(H/ΛZ)·ch(X_Gr) = (L_Gr)·ch(X_st) and ch(H/ΛZ)·ch(X_ord) = (L_PR)·ch(X_st) after the unramified coefficient extension, using both explicit reciprocity laws. Prove rank one, torsion and nonvanishing of the terms before cancelling; this gives ch(X_Gr)·(L_PR) = ch(X_ord)·(L_Gr), hence both directions of the equivalence. Cor. 4.1.4: direct sums of the two pairs of sequences for g and g′.

**Checks.**

- For 11a1 at p = 3 and K = ℚ(√−2) (the fixed-form Check of §2.15), p ∤ 22, (spl), (D_K, 11) = 1 and (irr_K) all hold, so the equivalence is asserted, and its class and reciprocity laws come from the fixed-form form; a version citing CW Theorem 3.6 for them would assert p > 3 falsely here, and one citing the FW form would need 11 ramified in K, which fails for D_K = −8.
- If the Coleman map at v̄ had a cokernel that is not pseudo-null, the second term of the Poitou–Tate sequence would not be pseudo-isomorphic to Λ_K/(L^PR) and the equivalence would fail; the pseudo-null cokernel clause is part of the reciprocity input.
- With E(K)[p] ≠ 0 the strict–relaxed Selmer module need not vanish, and the sequence used in the proof is not exact on the left; (irr_K) is what removes this.

*Needs:* §§0.9, 2.15 and 2.16; ArithmeticGaloisDuality §R02.4.3; SelmerIwasawaCohomology §§2.13, 2.19 and 3.12; PadicMeasuresIwasawaAlgebras §4.6.

### 6.2 Restricting the quartic-CM characteristic ideal to K

Let g ∈ S_2(Γ_0(N)) be an elliptic newform, p > 3 a good ordinary prime with ρ̄_g irreducible, F a real quadratic field, K imaginary quadratic, M = FK the quartic CM field, K̃_∞ = FK_∞, Λ̃_K = O[[Gal(K̃_∞/M)]] ≅ Λ_K and π_K: Λ_M → Λ̃_K ≅ Λ_K induced by Gal(M_∞/M) ↠ Gal(K̃_∞/M). Then π_K(ch_(Λ_M)(X_ord(g/M_∞))) ⊇ ch_(Λ_K)(X_ord(g/K_∞))·ch_(Λ_K)(X_ord(g^F/K_∞)) in Λ_K, where g^F is the twist of g by the quadratic character of F/ℚ (BCS Lemma 5.1.1).

Use the hypotheses of BCS §5; the containment is integral and in the stated direction only. Here O is a coefficient integer DVR, Λ_M≅O[[T₁,T₂,T₃]] and Λ_K≅O[[T₁,T₂]]; their characteristic ideals are principal. The selected characteristic generator has nonzero π_K-image. Derive finite torsion duals and the no-invariants/local-control hypotheses from early cyclotomic Kato bounds and quadratic descent, rather than from the final main-conjecture equality. If the quotient has a correction term, retain its divisor in the bound.

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Lemma 5.1.1 and proof, p. 9. The restriction from the quartic CM tower to K and the resulting containment of characteristic ideals.

The proof proceeds as follows. Use control at I_K to identify the restricted quartic Selmer module with the corresponding module over M with coefficients T_g⊗Λ̃_K^∨. Shapiro then identifies it with the direct sum of the two Selmer modules over K for T_g and T_g⊗η_F; the right-hand cohomology groups are over K, not M as printed in BCS p. 9. The quadratic character η_F is trivial on G_M. Restriction from M to K of a module induced along Gal(M/K) ≅ Gal(F/ℚ) splits by the characters of Gal(M/K) (Shapiro). SU Cor. 3.8 (journal): π_K(ch_(Λ_M)(X)) ⊇ ch_(Λ_K)(X/I_K) ([§0.3](#03-specializing-σ-primitive-selmer-groups-and-their-characteristic-ideals) (ii)).

**Checks.**

- If the specialized quartic ideal is (ϖ³) and the two K-ideals are (ϖ²) and (ϖ²), the containment (ϖ³) ⊇ (ϖ⁴) holds (3 ≤ 4); with K-ideals (ϖ) and (ϖ) it would require (ϖ³) ⊇ (ϖ²), which fails. Reversing the containment reverses the inequality.

*Needs:* §§0.1 and 0.3; SelmerIwasawaCohomology §3.2; ProfiniteCohomology Layer 7.

### 6.3 The quartic-CM p-adic L-function restricted to K

In the setting of [§6.2](#62-restricting-the-quartic-cm-characteristic-ideal-to-k), (π_K(L_p(g_F/M))) = (L^PR_p(g/K)·L^PR_p(g^F/K)) in Λ_K ⊗ ℚ_p, where L_p(g_F/M) is Wan's p-adic L-function of the base change g_F over M (§5.3) and g^F is the quadratic twist, as in the Conventions (BCS Lemma 5.1.2).

Assume the identity is only after inverting p (the comparison of interpolation properties involves periods whose p-integral comparison is open — BCS Remark 1.1.3(ii)). Exported only after inverting p; the integral statement of [§6.6](#66-burungalecastellaskinners-two-variable-product-divisibility) uses µ = 0 instead of an integral period comparison.

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Lemma 5.1.2 and proof, p. 9; §2 (p-adic L-functions), p. 6. The factorization of the restricted quartic p-adic L-function by direct comparison of interpolation properties.

The proof proceeds as follows. Compare interpolation formulas on a Zariski-dense set of characters of Γ_K: the base-change L-value L(g_F/M ⊗ χ, 1) factors as L(g/K ⊗ χ, 1)·L(g^F/K ⊗ χ, 1) (Wan's Prop. 84 in the journal numbering). The interpolation comparison identifies the restricted function with the product up to the fixed nonzero period scalar and the specified normalizations. After inverting p this scalar is a unit, giving equality of principal ideals. Density alone cannot remove the period scalar to yield an exact identity of normalized functions.

**Checks.**

- In Λ_K ⊗ ℚ_p the ideals (p) and (1) coincide, so the statement allows π_K(L_p(g_F/M)) = p·L^PR_p(g/K)·L^PR_p(g^F/K), whose integral ideal differs by valuation 1 at (p); the integral comparison of §6.6 rests on μ = 0 (§6.5).

*Needs:* §§5.3 and 5.12.

### 6.4 Existence of the auxiliary fields K and F

Let g ∈ S_2(Γ_0(N)) be an elliptic newform and p ≥ 5 a prime of good ordinary reduction with ρ̄_g irreducible over G_ℚ. There exist an imaginary quadratic K satisfying (disc) (D_K odd, D_K ≠ −3), (Heeg) (every ℓ | N splits in K), (spl) (p splits in K) and (irr_K), and a real quadratic F with (i) p inert in F, (ii) D_F odd with every prime dividing D_F split in K, (iii) every ℓ | N inert in F if ℓ ≡ −1 mod p and split otherwise, (iv) (irr_M) for M = FK, (v) ρ̄_g|_(G_(F(ζ_p))) irreducible, (vi) F ≠ ℚ(ζ_5)^+ if p = 5 (BCS Lemma 5.2.3). Moreover such M/F satisfies (pN, D_F) = 1, (N O_F, D_(M/F)) = 1, (spl_F) and (Δ), and n^- = O_F, so the hypotheses of Wan's theorem (Layer 5) other than Hypothesis 3.1.1 hold, and (H1)–(H3) follow from (v), (vi), the minimal-lift argument and (iii) (proof of BCS Prop. 5.2.1). These conditions already give the stronger condition Δ+ used in Layer 5: D_K is odd and different from 1, so some odd prime q ramifies in K; by (ii) every prime dividing D_F splits in K, so q ∤ D_F and q is unramified in F; hence the primes of F above q ramify in M = FK, M/F is ramified at a finite place, and M is not contained in the narrow Hilbert class field of F.

Retain the stated hypotheses; the conditions are independent splitting conditions satisfied by a positive proportion of quadratic fields.

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Lemma 5.2.3 and proof, p. 10; conditions (i)–(vi) of Prop. 5.2.1, p. 9; proof of Prop. 5.2.1 (hypothesis checks), p. 10. Existence of K and F and the verification of Wan's hypotheses for M = FK.

The proof proceeds as follows. Since p ∤ N, conditions (i) and (iii) on F are independent splitting conditions; fix F with odd D_F. Similarly (spl), (Heeg) and (ii) hold for a positive proportion of K; choose one with (disc) and (irr_K). (irr_M) holds if FK is not in the splitting field of ρ_g|_(G_K); if ρ̄_g|_(G_(F(ζ_p))) is reducible, ρ̄_g|_(G_F) is induced from an index-two subgroup containing G_(F(ζ_p)), which forces p = 5 and F = ℚ(ζ_5)^+. Check the hypotheses of BCS Thm 3.2.1: (ii) gives n^- = O_F; (H2) from the base change of a minimal modular lift (Wan's Thm 103); (H3) from (iii) ([§5.13](#513-discharging-the-auxiliary-field-hypotheses)). Δ+ follows as stated: an odd prime q dividing D_K does not divide D_F, by (ii), so F is unramified at q and FK/F is ramified at the primes above q. The finitely many local square-class conditions defining K are independent by the Chinese remainder theorem, including D_K ≡ 1 or 5 mod 8 at 2, and the resulting infinite classes of discriminants still permit excluding the finitely many quadratic subfields that cause residual reducibility.

**Checks.**

- Δ+ is automatic under (disc) and (ii): for K = ℚ(√−7), 7 ramifies in K and is unramified in every F allowed by (ii), so FK/F is ramified above 7. A selection adding a further ramified prime of K outside D_F gives no additional condition.
- (disc) and (ii) are compatible: K = ℚ(√−7) has D_K = −7 ≡ 1 mod 8, so 2 splits in K, and F = ℚ(√29) has odd D_F = 29 with 29 split in K, since −7 ≡ 22 ≡ 14² mod 29.
- The splitting tests include the prime 2 when 2 divides N. For an odd fundamental discriminant D, 2 splits when D≡1 (mod 8) and is inert when D≡5 (mod 8). The Jacobi-symbol criterion is used only at odd primes; the two congruence classes modulo 8 distinguish these cases.

*Needs:* §§5.1 and 5.13; NumberFieldArithmetic §1.1.

### 6.5 Vanishing of the µ-invariant of the Greenberg function

Let g ∈ S_2(Γ_0(N)) be an elliptic newform with good reduction at p > 2 and K satisfying (disc), (Heeg), (spl) and (irr_K). Then µ(L^Gr_p(g/K)) = µ(L^BDP_p(g/K)) = 0 (BCS Prop. 4.2.2). Here L_p^BDP is BCS §2’s normalized BDP function, which already interpolates the squared quantity. The comparison of principal ideals in Prop. 4.2.2 introduces no additional square.

Retain the stated hypotheses; under (Heeg) the nonsplit level n⁻ is trivial, so Hsieh's local root-number and squarefree hypotheses hold, and (irr_K) is his residual hypothesis. The projection comparison is CGS23 Prop. 1.4.5 (Lemma 2.4.4/Prop. 2.4.5 in a later version), which needs Rubin's main conjecture (gap:rubin-imaginary-quadratic), the Katz factor h_K·L_v(K)^− in the Hida–Tilouine normalization (AutomorphicPadicLFunctionsPartII §8.5 with gap:katz-cm-padic-l) and Hida's Rankin–Selberg factor of CGS23 Theorem 1.4.1 (gap:hida-rankin-selberg-cm).

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Prop. 4.2.2 and proof, p. 9. µ = 0 for L^Gr and L^BDP, from Hsieh's Theorem B and the CGS23 projection comparison.

The proof proceeds as follows. L^BDP_p(g/K) has µ = 0 by Hsieh's Theorem B (Hsieh2014 Theorem B, through gap:anticyclotomic-rankin-selberg; in weight two the function is that of GrossZagierAndArithmeticHeights §9.15). The projection of L^Gr_p(g/K) to Λ^(-,ur)_K generates the same ideal as L^BDP_p(g/K) by comparing interpolation properties (CGS23 Prop. 1.4.5); µ of a two-variable function is bounded by µ of a one-variable specialization.

**Checks.**

- A two-variable series whose specialization at T = 0 has µ = 0 has µ = 0, since ϖ dividing L would divide L(S, 0). The converse fails: L = T has µ = 0 while L(S, 0) = 0, so the specialization used must be nonzero.
- The square in the BDP normalization is harmless: µ(f²) = 2µ(f), which vanishes exactly when µ(f) does.
- This is BCS's Proposition 4.2.2 for the Greenberg function, not their anticyclotomic Theorem 4.2.1; it is the Greenberg-function form of the toric µ = 0 input that HeegnerPointEulerSystems requests as supplier gap primitive-toric-mu.

*Needs:* §0.9; AutomorphicPadicLFunctionsPartII §8.5; AutomorphicPadicLFunctionsPartII (gap:katz-cm-padic-l); PadicFamilies (gap:anticyclotomic-rankin-selberg); PadicFamilies (gap:hida-rankin-selberg-cm); EulerSystemsCyclotomicMainConjecture (gap:rubin-imaginary-quadratic); GrossZagierAndArithmeticHeights §§9.15 and 9.21; PadicMeasuresIwasawaAlgebras §4.4.

### 6.6 Burungale–Castella–Skinner's two-variable product divisibility

Let g ∈ S_2(Γ_0(N)) be an elliptic newform, p ≥ 5 a good ordinary prime, K satisfying (disc), (Heeg), (spl), (irr_K), and F a real quadratic field satisfying (i)–(vi) of [§6.4](#64-existence-of-the-auxiliary-fields-k-and-f). Then (L^PR_p(g/K)·L^PR_p(g^F/K)) ⊇ ch_(Λ_K)(X_ord(g/K_∞))·ch_(Λ_K)(X_ord(g^F/K_∞)) in Λ_K, and (L^Gr_p(g/K)·L^Gr_p(g^F/K)) ⊇ ch_(Λ_K)(X_Gr(g/K_∞))·ch_(Λ_K)(X_Gr(g^F/K_∞)) in Λ^ur_K (BCS Prop. 5.2.1). Both containments are integral.

Retain the stated hypotheses; Wan's quartic-CM theorem (BCS Thm 3.2.1) is §5.12, with its hypotheses discharged by [§6.4](#64-existence-of-the-auxiliary-fields-k-and-f).

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Prop. 5.2.1 and proof, pp. 9–10. The integral Perrin-Riou and Greenberg product containments over K from Wan's quartic-CM divisibility, Lemmas 5.1.1–5.1.2, Thm 4.1.3 and Prop. 4.2.2.

The proof proceeds as follows. Wan's theorem for M/F ([§5.12](#512-the-bcs-quartic-cm-input)): (π_K(L_p(g_F/M))) ⊇ π_K(ch_(Λ_M)(X_ord(g/M_∞))). Lemmas 5.1.1–5.1.2 ([§6.2](#62-restricting-the-quartic-cm-characteristic-ideal-to-k), [§6.3](#63-the-quartic-cm-p-adic-l-function-restricted-to-k)) give the Perrin-Riou product containment in Λ_K ⊗ ℚ_p. [§6.1](#61-the-ordinary-two-variable-perrin-riougreenberg-equivalence-bcs-theorem-413-corollary-414) (Cor. 4.1.4) converts it to the Greenberg product containment in Λ^ur_K ⊗ ℚ_p. µ(L^Gr_p(g/K)·L^Gr_p(g^F/K)) = 0 ([§6.5](#65-vanishing-of-the-µ-invariant-of-the-greenberg-function) for g and g^F), so the Greenberg containment holds integrally in Λ^ur_K; Cor. 4.1.4 again gives the integral Perrin-Riou containment.

**Checks.**

- Integrality from µ = 0: given the rational containment, at the prime (ϖ) the Greenberg product has valuation 0 and the characteristic product valuation ≥ 0, so the containment holds integrally; with µ = 1 the argument fails at (ϖ).
- The product form is needed: Corollary 4.1.4 applies to g and g^F together, and the quartic-CM bound of §5.12 gives no containment for g alone.
- The cyclotomic endpoint of Layer 7 and the anticyclotomic endpoints of HeegnerPointEulerSystems are not inputs; Layer 7 and HeegnerPointEulerSystems Layer 8b consume this bound.

*Needs:* §§5.12, 5.13, 6.1, 6.2, 6.3, 6.4 and 6.5.

### Examples

Suppose a Greenberg analytic product has μ=0 and the rational product containment holds. At every height-one prime away from (ϖ) the valuation inequality is already known. At (ϖ) the analytic valuation is zero, and the characteristic valuation is nonnegative. Thus the containment holds integrally. This explains why μ=0 suffices without identifying Hilbert and elliptic periods integrally.

For odd fundamental discriminants, −7≡1 mod 8 and 13≡5 mod 8. Hence 2 splits in Q(√−7) and is inert in Q(√13); a Jacobi test with even denominator would not express these two local conditions. Every odd prime q dividing D_K is prime to D_F, since the primes dividing D_F split in K; F is unramified at q, so q ramifies in FK/F. This witnesses the narrow-Hilbert-class-field exclusion for every admissible pair (K, F).

### Dependencies

Earlier layers: §§0.1, 0.3, 0.9, 2.15, 2.16, 5.1, 5.4, 5.12 and 5.13. Suppliers: ArithmeticGaloisDuality §R02.4.3; AutomorphicPadicLFunctionsPartII §8.5, (gap:katz-cm-padic-l); EulerSystemsCyclotomicMainConjecture (gap:rubin-imaginary-quadratic); GrossZagierAndArithmeticHeights §§9.15 and 9.21; NumberFieldArithmetic §1.1; PadicFamilies (gap:anticyclotomic-rankin-selberg), (gap:hida-rankin-selberg-cm); PadicMeasuresIwasawaAlgebras §§4.4 and 4.6; ProfiniteCohomology Layer 7; SelmerIwasawaCohomology §§2.13, 2.19, 3.2 and 3.12.

## Layer 7: Four twists and cyclotomic factor separation

### 7.1 The four quadratic twists on integral Tate lattices

For E/Q, distinct quadratic fields K imaginary and F real, and p>3 unramified in K and F, identify T_p(E^χ) with T_p(E)⊗χ integrally for χ∈{1,η_K,η_F,η_Kη_F}. Use the existing quadratic-twist point isomorphism and its character-equivariance, restrict to all p-power torsion and take the compatible inverse limit. Every twist has good ordinary reduction at p; its ordinary line is the transported line twisted by χ. The cyclotomic Iwasawa coefficient ring and reciprocal tautological action are the same for all four twists.

Assume E has good ordinary reduction at p; the quadratic discriminants are prime to p; all extensions and the algebraic closure embeddings are fixed. The inverse-limit transition maps and ordinary filtration are the actual Tate-module ones; no rational isogeny is substituted for an integral lattice equivalence. A p-power index in the lattice comparison would invalidate the integral endpoint and must not be discarded. The product character is the third quadratic subfield character, not the real base-change representation g_F.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proof of Theorem 1.1.2, p.12; Lemma 5.1.1, p.10. The four twists must satisfy Kato on their actual integral lattices. [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §3.1.1–3.1.5, pp.16–19. Twisted coefficient convention used in Shapiro.

The proof proceeds as follows. Apply the pinned Tau Ceti point-group isomorphism with its quadratic character, then restrict to E[p^n] and check compatibility with multiplication by p. Pass to the inverse limit and verify the selected ordinary sublattice using unramified quadratic twisting at p. For the product character use composition of the two twists and the canonical integral scalar action; keep the character Galois restriction maps.

**Checks.**

- Twisting twice by a quadratic χ gives χ² = 1; at g with χ(g) = −1 the twisted action is the negative of the original. An unramified quadratic twist changes the ordinary unit root α to ±α, of valuation 0; multiplication by p on a rank-two lattice has cokernel 𝔽_p² and is not an integral isomorphism.

*Needs:* EllipticCurves Layer 2; SelmerIwasawaCohomology §§2.8a, 2.9 and 2.12; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`.

### 7.2 Integral quadratic Selmer decomposition

For any finite extension of the cyclotomic tower in the chosen setting, restriction and the idempotents (1±c)/2 give Sel_ord(E/KQ∞)≅Sel_ord(E/Q∞)⊕Sel_ord(E^K/Q∞), on the discrete p-primary coefficients A_χ=T_p(E^χ)⊗_Zp Q_p/Z_p derived from the integral lattices, with the matched ordinary local conditions. Compact T_p(E^χ) itself is not used as a discrete Shapiro coefficient. The Pontryagin dual decomposition is Λ-linear. Apply it also to E^F and, when needed for the early torsion check, to the biquadratic compositum to obtain all four summands. For torsion duals, characteristic ideals multiply exactly. At away-p places retain the localization-image and primitive/imprimitive errors until the matching local-condition comparison proves them absent.

Assume p odd makes 2 a unit; coefficient ring O is the fixed p-adic integer ring. The ordinary sublattice is stable under the larger decomposition group and transports to both primes of K over p; the same Σ is pulled back from Q. The local condition is specified: BCS uses the locally trivial away-p condition; the inertia-kernel convention in SU requires a proved comparison or explicit Euler corrections.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.1.5, p.19; Lemma 3.2.5, p.22. Integral quadratic and cyclotomic-tower decompositions. [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proof of Theorem 1.1.2, p.12. The decomposition used in four-factor descent.

The proof proceeds as follows. Apply ProfiniteCohomology Shapiro to the finite-level discrete p-primary coefficients, then pass through the compatible filtered direct limit. For the Iwasawa model use the discrete module T⊗Λ∨ with the reciprocal tautological action. SelmerIwasawaCohomology §§2.9–2.12 and 3.1–3.2 supply continuity, duality and global/local transition maps; do not invoke this discrete theorem on compact T_p(E) itself. Split the quadratic group ring using the integral ± idempotents, dualize, and use the Tate-twist lattice dictionary. Apply the existing characteristic-ideal multiplicativity theorem only after proving finiteness and torsion.

**Checks.**

- After inverting p the decomposition agrees with the rational representation decomposition.
- At p=2 the idempotents are unavailable; the theorem excludes that case.

*Needs:* §7.1; ProfiniteCohomology Layer 7; SelmerIwasawaCohomology §§2.8a, 2.9, 2.12, 3.2, 3.11, 3.18, 3.19 and 3.20; PadicMeasuresIwasawaAlgebras §4.6.

### 7.3 Cyclotomic projection and characteristic inequality

For each of E and E^F over K, construct the map X_ord(K∞)/I−X_ord(K∞)→X_ord(KQ∞), where π+:Λ_K→Λ_Q and I−=ker π+. Under the actual no-invariants, ordinary inertia-quotient and primitive local-control hypotheses, prove the required isomorphism; otherwise retain the finite/pseudo-null correction with its divisor. In the exact case, π+(char_ΛK X)⊇char_ΛQ(X/I−X). This is a divisibility, not a general equality of specialized characteristic ideals. Use Kato’s cyclotomic torsion for the two twists and Nakayama with the finite dual to establish the torsion needed for the nonzero two-variable characteristic ideal.

Assume Λ_K≅O[[T+,T−]], Λ_Q≅O[[T+]] are normal domains with the actual continuous quotient map. The source control condition excludes a trivial subquotient of T* over the tower; its p-inertia quotient action factors through the cyclotomic group. Σ∪{p} contains every ramified prime for the imprimitive comparison. Every removed Euler factor is compared on both sides before passing back to primitive Selmer groups; specialization of the analytic/characteristic generator is nonzero. The displayed power-series rings are regular UFDs for the fixed coefficient DVR O. The specialization inequality concerns the principal characteristic generator; it does not extend to the arbitrary image of a divisorial ideal over a nonfactorial Hida branch. π+(char X) is not replaced by char(X/I−X) without an additional theorem. The zero extended characteristic ideal of a non-torsion module cannot be canceled.

The source is [SU](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Proposition 3.2.8, Corollary 3.2.9(ii), Proposition 3.2.11, pp.23–24. Control and the correct direction of characteristic specialization. [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), §5.1 and proof of Theorem 1.1.2, pp.10–12. The projection used for descent.

The proof proceeds as follows. Apply the Selmer kernel-control theorem to global and local restriction maps, including the image of localization. Use SU 3.2.8 and 3.2.11 on the verified ordinary lattice; import derived control for correction complexes. Apply the Fitting-to-characteristic inequality of SU 3.2.9(ii) or its exact supplier implementation. Use the quadratic decomposition and early Kato torsion to prove the quotient dual torsion, then localized Nakayama to rule out positive generic rank of the two-variable dual. This does not import the completed cyclotomic equality.

**Checks.**

- For A = O[[X,Y]] and M = A/(p,Y): Ch_A(M) = (1), since M is pseudo-null, while M/YM ≅ O[[X]]/(p) has characteristic ideal (p); π+(Ch) = (1) ⊇ (p) as stated, and the reverse containment would be false. For M = A, of positive rank, the extended characteristic ideal is 0 and cannot be cancelled.

*Needs:* §§0.2, 0.3 and 7.2; SelmerIwasawaCohomology §§3.10 and 3.11; PadicMeasuresIwasawaAlgebras §4.6; KatoEulerSystems §7.4.

### 7.4 Period-normalized analytic quadratic factorization

For E/Q and imaginary quadratic K with odd discriminant, p split and all N-primes split, project the Perrin–Riou Rankin function (Hida's Rankin–Selberg p-adic L-function of E against the CM family of K through the weight-one Eisenstein series, CGS23 Theorem 1.4.1; gap:hida-rankin-selberg-cm) to the cyclotomic line. With CGS’s normalization by deg(π_E)/c_E² and H_p(E), prove (π+L_PR(E/K))=(L_MSD(E/Q)L_MSD(E^K/Q)) in the integral cyclotomic coefficient ring when the analytic objects are integral, and in its p-inversion for the rational normalization. The relation is up to a Λ_Q-unit; its derivation tracks the discriminant character factor, the constant discriminant/twist-period scalar and the real-component factor, with p odd. Prove the analogous identity for E^F using its own Néron periods and primitive Euler factors.

Assume the modular parametrization π_E, Manin constant c_E, ordinary unit root α_p and Néron differentials of E and E^K are the actual objects used by CGS. Use a common coefficient extension containing the character values and required discriminant/period scalars, then descend by the supplier’s faithful coefficient comparison. All four primitive functions are nonzero. At E^F its level may acquire D_F²; those primes split in K, so its required Heegner and period comparison conditions still hold. Keep the actual period ratio, including the discriminant square root implicit in CGS Remark 1.2.3. In the selected split, prime-to-p case it contributes a p-adic unit; no exact equality of unscaled complex periods is assumed. There is no assumed canonical-period-over-F equals period-over-Q squared identity. Do not use a character interpolation identity before checking the functions lie in the same bounded/integral function space.

The source is [CGS-v1](https://arxiv.org/pdf/2303.04373v1), Definition 1.2.2, Remark 1.2.3, Proposition 1.2.4 and proof, pp.7–8. The actual Perrin–Riou to MSD normalization and cyclotomic product. [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proof of Theorem 1.1.2, p.12. Apply analytic factorization to both quadratic-twist pairs. [CGS-v2](https://arxiv.org/pdf/2303.04373v2), Definition 2.2.2, Remark 2.2.3 and Proposition 2.2.4, pp.7–8. The same normalization and missing discriminant factor persist in the final preprint; the cyclotomic ideal identity requires unit tracking rather than the literally displayed complex period equality.

The proof proceeds as follows. Import the MSD/Rankin interpolation carriers; compare at finite characters of positive p-power conductor using complex quadratic factorization and the Gauss-sum identity. Use π_E*ω_E=c_Eω_f and integration under the finite map: the raw Petersson integral is deg(π_E)/c_E² times the raw Néron area. With CGS’s Ω_E/K, division by sqrt(|D_K|) also occurs, so its displayed identity misses that factor. Track the resulting discriminant and twist-period scalars under the chosen p-adic embedding; they are units since p splits and avoids D_K. The real-component factor is a power of two. Use uniqueness of the bounded p-adic measure/interpolation on the stated domain, not bare Zariski density. Repeat for E^F with its own Manin constant, modular degree and Néron differential, matching every tame Euler factor. Descend a finite coefficient extension by faithful extension/contraction after the characteristic base-change comparison, not by the norm theorem for restriction of scalars.

**Checks.**

- Raw Néron area a and deg(π_E)/c_E² = d give the Petersson numerator d·a. Using a/√|D_K| as the period instead gives the ratio d·√|D_K|; for p ∤ 2D_K this factor is a unit, while rescaling by p changes the integral ideal by valuation 1.

*Needs:* §7.1; ModularSymbolsPadicLFunctions §§1.1 and 2.5; PadicFamilies (gap:hida-rankin-selberg-cm); ModularSymbolsPadicLFunctions (gap:msd-neron-periods); PadicMeasuresIwasawaAlgebras §4.6; Mathlib `Ideal.span_singleton_mul_left_unit`.

### 7.5 The early four-factor cyclotomic bound

For the auxiliary K,F of §6.4 (BCS Lemma 5.2.3), project its early integral ordinary product bound (L_PR(E/K)L_PR(E^F/K))⊇char(X_E/K∞)char(X_EF/K∞) to Λ_Q. The analytic factorization, Selmer decompositions and correctly oriented characteristic-control comparisons give ∏_(χ∈{1,η_K,η_F,η_Kη_F})(L_MSD(E^χ/Q))⊇∏_χ char(X_Eχ/Q∞). The same assertion holds after p-inversion. This is the only reverse input used for factor separation; it is not an individual reverse inequality.

Assume the selected-field, minimality, μ and integral product-bound conditions of Layer 6; the Fourier/period/Euler normalization is matched here. The four cyclotomic duals are finite torsion and the four functions nonzero; the control and analytic comparison targets apply to E and E^F. The anticyclotomic endpoints of HeegnerPointEulerSystems Layer 8b, BCS Theorem 4.2.1 and the anticyclotomic main conjectures are not prerequisites.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proposition 5.2.1, pp.11–12; proof of Theorem 1.1.2, p.12. The early product bound and its four-factor cyclotomic projection.

The proof proceeds as follows. Import the early Proposition 5.2.1 bound, independently of the Heegner endpoint; the μ upgrade is §6.6. Extend the product ideal through π+ using Mathlib `Ideal.map_mul`, then apply the analytic identity. Use the two Selmer projection inequalities and quadratic multiplicativity to reach the four-factor characteristic product on the same ring.

**Checks.**

- Analytic valuations (1, 2, 0, 3) sum to 6 and characteristic valuations (2, 2, 1, 3) sum to 8, so the characteristic product is contained in the analytic product. Equal product valuations do not identify the factors: (ϖ)(ϖ) = (ϖ²)(1).

*Needs:* §§6.4, 6.6, 7.3 and 7.4; PadicMeasuresIwasawaAlgebras §4.6; Mathlib `Ideal.map_mul`.

### 7.6 The rank-one image condition survives quadratic twisting

Let T=T_p(E), p odd, and σ∈G_Q(μ_p∞) satisfy T/(σ−1)T≅Z_p as Z_p-modules. Then every quadratic twist T⊗χ satisfies the same condition for some element of G_Q(μ_p∞). If χ(σ)=1 use σ. If χ(σ)=−1 use σ²: det ρ(σ)=1, the free rank-one cokernel forces ρ(σ) to be a nontrivial unipotent with unit off-diagonal in a suitable integral basis, and σ²−1 doubles that unit. The factor 2 is a unit. Hence one exact (im) hypothesis on E suffices for all four twists; residual surjectivity is only a stronger sufficient condition.

Assume the determinant is the cyclotomic character, so it equals 1 on the chosen group. T is free rank two over Z_p; the cokernel is free of rank one, rather than merely having rank one after tensoring with Q_p. χ takes values ±1 and p>2.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Theorem 1.1.2(b), p.2; proof, p.12. The exact image condition used for the integral four-twist argument. [Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 17.4, p.273. The integral strengthening needs an integral lattice condition, not just rational rank.

The proof proceeds as follows. Use the direct-summand kernel/image consequence of the free cokernel and determinant one to choose an integral unipotent basis. Compute (1+N)²−1=2N, N²=0, on the same lattice. Use χ(σ²)=1 and invertibility of 2 to preserve the integral cokernel; pass through the existing twist-lattice equivalence.

**Checks.**

- For A=[[1,p],[0,1]], the quotient T/(A−1)T is Z_p⊕Z/p and fails (im); A itself is invertible and has zero cokernel. Replacing p by a unit gives the required free rank-one quotient.
- For p=2 the squaring argument loses the unit and the target is not asserted.

*Needs:* §7.1; KatoEulerSystems §4.3.

### 7.7 Kato’s four ordinary bounds with period and image conditions

For each E^χ in the selected set of four twists, of conductor N_χ, use the ordinary cyclotomic torsion and the rational Euler-system bound with the MSD/Néron period normalization: (L_MSD(E^χ/ℚ)) ⊆ char(X_(E^χ/ℚ_∞)) after inverting p (PadicFamilies §4.0.3, after Kato Theorem 17.4(1)–(2)). For the integral form, assume (im) on E and use its twist stability ([§7.6](#76-the-rank-one-image-condition-survives-quadratic-twisting)). For T = T_p(E^χ) with p odd, E^χ[p] irreducible over G_ℚ and (im), KatoEulerSystems §4.3 bounds the length of X_(E^χ/ℚ_∞) at every height-one prime by that of Λ modulo the index ideal of Kato's Euler system, and the Coleman value Col(c) = r_(E^χ)·L_(E^χ,N_χ) of KatoEulerSystems §7.4 identifies the index ideal; here L_(E^χ,N_χ) is the MSD function with the Euler factors at the primes q | N_χ, q ≠ p, removed and r_(E^χ) is the positive integer of KatoEulerSystems §6.6. Prove that this gives (r_(E^χ)·L_(E^χ,N_χ)) ⊆ char_Λ(X_(E^χ/ℚ_∞)) in Λ, and, when moreover p ∤ r_(E^χ)·∏_(q|N_χ, q≠p) ℓ_q(q⁻¹) with ℓ_q the Euler polynomial at q, the integral inclusion (L_MSD(E^χ/ℚ)) ⊆ char_Λ(X_(E^χ/ℚ_∞)). This unsaturated comparison yields only the r_(E^χ)·L_(E^χ,N_χ) inclusion without that unit condition. For the full integral BCS endpoint use the saturated comparison of gap:kato-neron-saturated-comparison: the integral Euler-system determinant bound on those coefficient lattices is then transported with its primitive local cones to the primitive Néron-normalized function, giving (L_MSD(E^χ/ℚ)) ⊆ char_Λ(X) under (im) alone. This does not cancel a nonunit from the weaker inclusion. Kato's own integral clause, Theorem 17.4(3), rests on the SL₂(ℤ_p)-image condition (12.5.2) of Theorem 12.5(4); the (im) route through Rubin's hypotheses is distinguished from it. If the endpoint includes CM curves, use their separately proved rational elliptic-unit bound (PadicFamilies §4.0.3); never apply a non-CM theorem to them.

Assume p>3 good ordinary, residual E[p] irreducible; the four quadratic characters are unramified at p, so each twist is good ordinary and residual irreducible. Nonzero primitive analytic functions, compatible dual-form lattices and good period generators. Integral version: exact (im) on the original Tate lattice, not an assertion that every irreducible residual representation is surjective. The additional unit condition p ∤ r_(E^χ)·∏_(q|N_χ, q≠p) ℓ_q(q⁻¹) is needed only for removing factors from the unsaturated bound. The saturated comparison gives the primitive form without it.

The source is [Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 17.4 and §17.5, pp.273–274; Theorem 12.5, pp.221–222. Rational torsion/divisibility, and integrality under (12.5.2), the SL₂(ℤ_p) condition of Theorem 12.5(4). BCS (5.4), p. 10, uses the integral divisibility under (im), citing Kato Theorem 17.4; the route through Rubin's Theorem II.3.3 (KatoEulerSystems §4.3) needs only (im) and residual irreducibility, its translation through the unsaturated Coleman value needs the unit condition above, while the general primitive comparison is gap:kato-neron-saturated-comparison. [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Theorem 1.1.2 and its proof, pp.2,12. The elliptic (im) refinement used on all four factors.

The proof proceeds as follows. Check the four residual representations remain irreducible under scalar quadratic twisting and the actual integral Tate lattices match. Invoke the rational ordinary supplier, including the separate CM branch if applicable. For the integral case invoke KatoEulerSystems §4.3 with the rank-one-twist theorem of §7.6, then the Coleman value of KatoEulerSystems §7.4; remove r_(E^χ) and the Euler factors at q | N_χ only under the unit condition, preserving every period and local-condition comparison. For the general integral endpoint use gap:kato-neron-saturated-comparison instead of removing these factors: apply the integral bound on the saturated coefficient lattices, retain the index of the zeta image and transport the primitive local correction cones. Use the analytic nonvanishing supplier before factoring characteristic generators.

**Checks.**

- In H = A·e over a DVR, the zeta image A·(ϖe) has index length 1. Replacing that image by its saturation A·e erases the length and is not the asserted comparison: only the coefficient lattices are saturated, with the zeta image and its arithmetic index retained.

- If p divides r_(E^χ), the argument gives only (r_(E^χ)·L_(E^χ,N_χ)) ⊆ char(X): for r_(E^χ) = p the bound loses one power of p at the prime (p), and the unsaturated bound alone gives no integral MSD inclusion.
- For E^χ with split multiplicative reduction at q ∥ N_χ, a_q = 1 and ℓ_q(q⁻¹) = 1 − q⁻¹; for q ≡ 1 mod p this is not a p-adic unit, the Euler factor has a zero in the open disc, and the imprimitive inclusion does not give the primitive one.
- The upper bound must use the exact elliptic (im) condition and MSD/Néron normalization; a general SL₂-image bound with a p-power error does not give the asserted integral result.
- (im) is weaker than (12.5.2): a Borel-type image containing [[1,1],[0,1]] satisfies (im) (the quotient T/(σ−1)T is ℤ_p for σ that unipotent) but contains no conjugate of SL₂(ℤ_p); residual irreducibility is then a separate hypothesis of Hyp(ℚ_∞, T), and it is retained.

*Needs:* §§7.4 and 7.6; PadicFamilies §4.0.3; KatoEulerSystems §§4.1, 4.2, 4.3 and 7.4; KatoEulerSystems (gap:kato-neron-saturated-comparison).

### 7.8 Separating four characteristic factors

Over A=O[[Γ_Q]] or A[1/p], a noetherian normal UFD, let all X_χ be finite torsion, J_χ=char_A(X_χ) nonzero principal, and L_χ nonzero. Suppose (L_χ)⊂J_χ separately for each χ and ∏J_χ⊂(∏L_χ). Then J_χ=(L_χ) for every χ. At each height-one prime, each ord(L_χ)−ord(J_χ) is nonnegative and their sum is nonpositive; hence each is zero. Equivalently choose generators j_χ, write L_χ=j_χa_χ and conclude ∏a_χ is a unit, so each a_χ is a unit. This argument needs every individual upper inequality; the product bound alone cannot separate factors.

Assume all four factors lie in the same domain and use the same integral/rational coefficient extension and primitive normalizations. Torsion and nonvanishing have already been proved; principal characteristic ideals are supplied by the Iwasawa algebra owner. The integral claim uses integral inequalities at the prime (p) too; rational equality has no information there.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Proof of Theorem 1.1.2, p.12. Nonnegative defects and factorwise equality.

The proof proceeds as follows. Import UFD characteristic ideals and their height-one lengths. If the analytic comparison uses a finite coefficient extension, use the faithful characteristic base change and ideal contraction of gap:divisorial-char-ideal; the determinant norm after restriction of scalars is a different interface and cannot supply that theorem. Choose nonzero generators or work with the associated finite effective divisors; orient the inequalities correctly. Apply the four individual Kato inequalities and early product inequality; use normality/principality to conclude equality of ideals. The final cancellation holds for any finite family of ideals J_i over a domain, without UFD or principality hypotheses on J_i: for x∈J_i multiply by the nonzero product of the other L_j; the product containment and cancellation give x∈(L_i). The UFD hypotheses above construct the arithmetic characteristic ideals and their divisors, rather than being needed for this final cancellation.

**Checks.**

- Test a product with factors p and p^−1 over the fraction field: without individual upper bounds a product equality gives no integral factor equality.
- Defect cancellation: the defects ord(L_χ) − ord(J_χ) at a height-one prime equal to (1, 0, 0, 0) have sum 1 > 0 and are excluded by the product bound; (1, −1, 0, 0) has sum 0 but is excluded by the individual bounds (L_χ) ⊂ J_χ, which force every defect to be nonnegative; only (0, 0, 0, 0) survives both, and a rational equality alone, which ignores the prime (p), excludes neither.

*Needs:* §§7.5 and 7.7; PadicMeasuresIwasawaAlgebras §4.6.

### 7.9 BCS’s rational cyclotomic theorem

For E/Q and good ordinary p>3 with E[p] irreducible as a G_Q-module, X_ord(E/Q∞) is finite Λ_Q-torsion and char_ΛQ(X)Λ_Q[1/p]=(L_p(E/Q))Λ_Q[1/p]. Here L_p is the MSD function with the actual Néron periods, and X is the Pontryagin dual of the classical p-primary Selmer group. Apply the auxiliary-field existence of §6.4, the four-factor product bound and Kato’s rational individual inequalities, then select the trivial character factor. No residual surjectivity or multiplicative-reduction prime is added.

Assume precisely p>3 good ordinary and residual irreducibility, plus the verified supplier conclusions used to construct the auxiliary fields and compare classical/ordinary Selmer conventions. CM and non-CM curves use the correct separately owned upper-bound route. It includes p=5; p=3 and supersingular reduction are outside scope. The statement remains rational even if an integral analytic object is separately available.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Theorem 1.1.2(a), p.2; proof, p.12. The endpoint under irreducibility, after p-inversion.

The proof proceeds as follows. Choose K,F by the supplier’s existence theorem and verify all field/local hypotheses, including Δ+, which the conditions of §6.4 imply. Apply factor separation over Λ_Q[1/p] to the four finite torsion cyclotomic duals. Use the actual classical-Selmer versus ordinary-Galois-Selmer comparison, with primitive local conditions; descend coefficient scalars if enlarged. ModularIwasawaMainConjectures imports the equality through its supplier gap automorphic-endpoints; its results are never inputs here.

**Checks.**

- char(X) = (p) and L_p = 1 satisfy the p-inverted equality but differ at (p) by valuation 1; the statement does not separate them.
- p = 5 satisfies p > 3 and is admitted; at p = 3 the hypothesis fails and no conclusion is drawn.

*Needs:* §§6.4 and 7.8; SelmerIwasawaCohomology §§2.8a, 2.9 and 2.12; PadicMeasuresIwasawaAlgebras §4.6.

### 7.10 BCS’s integral rank-one-image refinement

Under the rational endpoint hypotheses, assume (im): there exists σ∈G_Q(μ_p∞) with T_p(E)/(σ−1)T_p(E)≅Z_p as Z_p-modules, prove char_ΛQ(X_ord(E/Q∞))=(L_p(E/Q)) in Λ_Q itself. Apply the twist-stable (im) hypothesis and the integral Kato inequalities to all four factors, then separate them using the integral early product bound. Every p-power lattice, Euler and period discrepancy has been accounted for before equality. Residual surjectivity is not substituted for (im); its use is only as a sufficient implication if separately proved.

Assume exactly the preceding rational endpoint hypotheses and the free rank-one quotient condition on the integral Tate lattice. The primitive integral Kato-to-Néron comparison is gap:kato-neron-saturated-comparison. The unsaturated bound of §7.7 is an intermediate statement with extra scalar and Euler factors; it is not substituted for BCS (5.4). The early product bound, analytic factorization and all four Kato bounds are integral on the same lattice and Néron-normalized functions.

The source is [BCS-published](https://web.math.ucsb.edu/~castella/BCS-print.pdf), Theorem 1.1.2(b), p.2; proof, p.12. Integral equality under the exact image condition. [Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 17.4(3) and Theorem 12.5(4). The integral clause of the divisibility used in BCS (5.4).

The proof proceeds as follows. Use the twist stability of (im) from §7.6, not rational lattice independence, for the four primitive integral upper bounds obtained from KatoEulerSystems §4.3 and gap:kato-neron-saturated-comparison in §7.7. Apply the factor separation of §7.8 in Λ_Q, including the height-one prime (p). Descend any coefficient extension by the faithful characteristic-ideal base change of gap:divisorial-char-ideal.

**Checks.**

- A cokernel with nonzero finite p-torsion fails the hypothesis: σ = [[1,p],[0,1]] gives T/(σ−1)T ≅ ℤ_p ⊕ ℤ/p.
- The theorem does not assume a canonical Hilbert period is the square of an elliptic period.
- For E: y² = x³ − 4x + 7 at p = 5, Δ = −16·11·97, #E(𝔽₃) = 7 and #E(𝔽₅) = 4, so a₃ = −3 and a₅ = 2. The Frobenius polynomial at 3 has discriminant 2 mod 5, giving irreducible E[5]. At 11, c₄ = 192 is a unit, v₁₁(Δ) = 1 and −c₆ = 6048 ≡ 9 mod 11, so the reduction is split multiplicative. Tate inertia gives a unit transvection on T₅(E), fixing μ_(5^∞), hence (im). The Euler augmentation 10/11 has v₅ = 1. This E is included in the integral endpoint and requires the saturated comparison, since the unsaturated unit criterion fails.
- If r_(E^χ) = p, the unsaturated bound loses one valuation at (p). The saturated comparison must recover the primitive determinant and regulator, not infer (L) ⊆ char(X) by cancelling p from (pL) ⊆ char(X).

*Needs:* §§7.6, 7.7, 7.8 and 7.9; KatoEulerSystems §§4.3, 6.6 and 7.4; KatoEulerSystems (gap:kato-neron-saturated-comparison); PadicMeasuresIwasawaAlgebras §4.6; PadicMeasuresIwasawaAlgebras (gap:divisorial-char-ideal).

### Examples

For a free rank-two Z_p lattice and σ represented by [[1,u],[0,1]], the cokernel of σ−1 is free of rank one exactly when u is a unit. Squaring replaces u by 2u. At p odd this preserves the free rank-one quotient and eliminates a negative quadratic character value. For u=p, the cokernel is Z_p⊕Z/p, so a rational rank-one check would incorrectly accept it. At p=2 squaring a unit u produces a nonunit and the argument fails.

At a fixed height-one prime let the four Kato defects ord(L_χ)−ord(J_χ) be d₁,d₂,d₃,d₄. Each is nonnegative. The reverse product bound says their sum is nonpositive, so every d_i is zero. If the individual bounds are omitted, J₁=(ϖ), J₂=(ϖ), L₁=ϖ², L₂=1, with the other two factors equal to 1, have equal products but unequal factors. At the prime (ϖ), the rational ring has forgotten these defects entirely. The cancellation of §7.8 keeps all individual containments and all nonzero factors; for an empty family the conclusion is vacuous and both products are units.

### Dependencies

Earlier layers: §§0.2, 0.3, 6.4 and 6.6. Suppliers: EllipticCurves Layer 2; KatoEulerSystems §§4.1, 4.2, 4.3, 6.6 and 7.4, (gap:kato-neron-saturated-comparison); ModularSymbolsPadicLFunctions §§1.1 and 2.5, (gap:msd-neron-periods); PadicFamilies §4.0.3, (gap:hida-rankin-selberg-cm); PadicMeasuresIwasawaAlgebras §4.6, (gap:divisorial-char-ideal); ProfiniteCohomology Layer 7; SelmerIwasawaCohomology §§2.8a, 2.9, 2.12, 3.2, 3.10, 3.11, 3.18, 3.19 and 3.20. Libraries: Mathlib `Ideal.map_mul`; Mathlib `Ideal.span_singleton_mul_left_unit`; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`.

## Layer 8: The ordinary elliptic-curve aggregate

### 8.1 The ordinary elliptic-curve refinement: aggregate of the endpoints

For an elliptic curve E/ℚ and a prime p of good ordinary reduction, this layer collects, without a second proof, the two reverse-divisibility endpoints planned in this roadmap: (a) Burungale–Castella–Skinner's cyclotomic theorem — for p > 3 with E[p] irreducible, X_ord(E/ℚ_∞) is Λ-torsion and char_Λ X_ord(E/ℚ_∞) = (L_p(E/ℚ)) in Λ ⊗ ℚ_p, with equality in Λ under the rank-one image condition (im) of §7.10 (BCS Thm 1.1.2), proved in Layer 7 from the early product input of Layer 6 and four Kato bounds; and (b) Fouquet–Wan's cohomological theorem at good ordinary points ([§4.5](#45-fouquetwans-main-conjecture-at-every-point-of-the-family), through [§2.21](#221-the-fouquetwan-ordinary-reverse-divisibility-theorem-16-by-48)). The scalar ordinary main conjecture with canonical periods, the curve-to-form lattice and Manin-constant transport and the final assembly belong to ModularIwasawaMainConjectures, which imports the endpoints directly from Layers 4 and 7 (supplier gap automorphic-endpoints). The endpoint comparison requires opposite divisibilities on the same integral objects as Kato's; no hypothesis assuming the divisibility is admitted, and the BCS rational/integral distinction is kept.

The hypotheses are those of each endpoint; nothing is added or removed here. This layer is an aggregate; ModularIwasawaMainConjectures consumes the endpoint of §7.10 directly.

The source is [BCS-v2](https://arxiv.org/pdf/2405.00270v2), Thm 1.1.2 and Remark 1.1.3, p. 2; proof of Thm 1.1.2, p. 10. The rational and integral cyclotomic theorems and their proof from Prop. 5.2.1 and Kato's bounds. [FW](https://arxiv.org/pdf/2107.13726v3), Thm 1.6, Thm 1.7, pp. 6–7. The ordinary and pointwise theorems.

The proof proceeds as follows. List the endpoints with their owners: [§7.9](#79-bcss-rational-cyclotomic-theorem) and [§7.10](#710-bcss-integral-rank-one-image-refinement) for (a), [§4.5](#45-fouquetwans-main-conjecture-at-every-point-of-the-family) for (b). Record that the BCS rational/integral distinction survives: (a) is in Λ ⊗ ℚ_p without (im) and in Λ with (im).

**Checks.**

- The ideals (ϖ) and (1) are equal rationally and unequal integrally. A unit transvection has (σ − 1)-cokernel ℤ_p; a transvection with off-diagonal p has ℤ_p ⊕ 𝔽_p and fails the integral image condition (im).

*Needs:* §§2.21, 4.5, 6.6, 7.9 and 7.10.

### Examples

The rational endpoint permits a defect supported at (ϖ), since p is invertible there. For example, (ϖ) and the unit ideal become equal after adjoining 1/p although they differ over O[[T]]. The integral endpoint removes precisely this possibility using (im) and the four integral Kato bounds. The aggregate retains the distinction and does not infer an integral conclusion from its rational branch.

### Dependencies

Earlier layers: §§2.21, 4.5, 6.6, 7.9 and 7.10.

## Downstream consumers

- ModularIwasawaMainConjectures imports the endpoints of Layers 1, 2, 4 and 7 and the universal zeta construction of Layer 3 through its supplier gap automorphic-endpoints, and owns the scalar modular-form and elliptic-curve assembly.
- HeegnerPointEulerSystems imports §§5.1, 5.4, 5.10 and 6.1–6.3 and requests the toric µ = 0 input as supplier gap primitive-toric-mu, answered by §6.5 with gap:anticyclotomic-rankin-selberg; its anticyclotomic endpoint is never an input to Layer 7.

Neither a Birch–Swinnerton-Dyer statement nor a supersingular endpoint is proved here.

## References

Each entry is listed under its key in sources.toml. Locators refer to the version named; SU uses its author-manuscript pagination, and BCS-v2 and BCS-published are the arXiv and published versions of one work.

- **SU**: Christopher Skinner and Eric Urban. [The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf). Invent. Math. 195 (2014), 1–277; locators refer to the author manuscript of 21 December 2012 (226 pages).
- **FW**: Olivier Fouquet and Xin Wan. [The Iwasawa main conjecture for universal families of modular motives](https://arxiv.org/pdf/2107.13726v3). arXiv:2107.13726v3; printed pages equal the PDF pages.
- **CLW**: Francesc Castella, Zheng Liu and Xin Wan. [Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)](https://arxiv.org/pdf/2109.08375v1). arXiv:2109.08375v1; PDF pages.
- **CLW-addendum**: Francesc Castella, Zheng Liu and Xin Wan. [Addendum to Iwasawa–Greenberg main conjecture for non-ordinary modular forms and Eisenstein congruences on GU(3,1)](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf). Six-page author-hosted addendum; its theorem numbers are separate from CLW, and it supersedes CLW's simultaneous-unit auxiliary selection.
- **NAK** (cited as Nakamura and NAK-v2): Kentaro Nakamura. [Zeta morphisms for rank two universal deformations](https://arxiv.org/pdf/2006.13647v2). arXiv:2006.13647v2; published in Invent. Math. 234 (2023), 171–290; locators refer to arXiv v2.
- **BCS** (cited as BCS-v2 and BCS-published): Ashay Burungale, Francesc Castella and Christopher Skinner. Base change and Iwasawa main conjectures for GL2. [arXiv:2405.00270v2](https://arxiv.org/pdf/2405.00270v2) and the published version, IMRN 2025, [author copy](https://web.math.ucsb.edu/~castella/BCS-print.pdf).
- **CW**: Francesc Castella and Xin Wan. [The Iwasawa main conjectures for GL2 and derivatives of p-adic L-functions](https://arxiv.org/pdf/2001.03878v1). arXiv:2001.03878v1.
- **Wan-2020** (cited as Wan20): Xin Wan. [Iwasawa main conjecture for Rankin–Selberg p-adic L-functions](https://arxiv.org/pdf/1408.4044v5). arXiv:1408.4044v5; published in Algebra & Number Theory 14 (2020).
- **Wan-2015**: Xin Wan. [The Iwasawa main conjecture for Hilbert modular forms](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CEF44E686A47C92CDAAAC4BA361E9CB5/S205050941500016Xa.pdf/the-iwasawa-main-conjecture-for-hilbert-modular-forms.pdf). Forum Math. Sigma 3 (2015), e18; open-access published version.
- **EW16**: Ellen Eischen and Xin Wan. p-adic Eisenstein series and L-functions of certain cusp forms on definite unitary groups. J. Inst. Math. Jussieu 15 (2016); [arXiv:1404.7153v2](https://arxiv.org/pdf/1404.7153v2). Theorem 1.2 is used as cited in FW Proposition 7.19.
- **Fujiwara**: Kazuhiro Fujiwara. [Deformation rings and Hecke algebras in the totally real case](https://arxiv.org/pdf/math/0602606v2). arXiv:math/0602606v2, manuscript pagination.
- **CGS23** (cited as CGS-v1 and CGS-v2): Francesc Castella, Giada Grossi and Christopher Skinner. Mazur's main conjecture at Eisenstein primes. [arXiv:2303.04373v1](https://arxiv.org/pdf/2303.04373v1) and [arXiv:2303.04373v2](https://arxiv.org/pdf/2303.04373v2), which renumbers its §1 as §2.
- **Kato2004** (cited as Kato): Kazuya Kato. [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290.
- **KLZ17**: Guido Kings, David Loeffler and Sarah Livia Zerbes. Rankin–Eisenstein classes and explicit reciprocity laws. Cambridge J. Math. 5 (2017), 1–122; [arXiv:1503.02888v6](https://arxiv.org/pdf/1503.02888v6); page locators use the arXiv v6 pagination.
- **LLZ14**: Antonio Lei, David Loeffler and Sarah Livia Zerbes. Euler systems for Rankin–Selberg convolutions of modular forms. Ann. of Math. 180 (2014), 653–771; [arXiv:1212.4056v2](https://arxiv.org/pdf/1212.4056v2).
- **LZ14**: David Loeffler and Sarah Livia Zerbes. Iwasawa theory and p-adic L-functions over ℤ_p²-extensions. Int. J. Number Theory 10 (2014), 2045–2095; [arXiv:1108.5954v3](https://arxiv.org/pdf/1108.5954v3); page locators use the arXiv v3 pagination.
- **HT93**: Haruzo Hida and Jacques Tilouine. [Anti-cyclotomic Katz p-adic L-functions and congruence modules](https://www.numdam.org/article/ASENS_1993_4_26_2_189_0.pdf). Ann. Sci. ENS 26 (1993), 189–259.
- **HT94**: Haruzo Hida and Jacques Tilouine. [On the anticyclotomic main conjecture for CM fields](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf). Invent. Math. 117 (1994), 89–147; Göttingen digitization, whose added cover page makes printed p. 89 the PDF p. 2.
- **Hid91**: Haruzo Hida. [On p-adic L-functions of GL(2) × GL(2) over totally real fields](https://aif.centre-mersenne.org/item/10.5802/aif.1258.pdf). Ann. Inst. Fourier 41 (1991), 311–391.
- **Hid06**: Haruzo Hida. [Anticyclotomic main conjectures](https://ems.press/content/book-chapter-files/27475?nt=1). Documenta Math., Extra Volume Coates (2006), 465–532.
- **Hida2010**: Haruzo Hida. [The Iwasawa μ-invariant of p-adic Hecke L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf). Ann. of Math. 172 (2010), 41–137.
- **Finis2006**: Tobias Finis. [Divisibility of anticyclotomic L-functions and theta functions with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf). Ann. of Math. 163 (2006), 767–807.
- **Hsieh2012**: Ming-Lun Hsieh. On the non-vanishing of Hecke L-values modulo p. Amer. J. Math. 134 (2012), 1503–1539; [arXiv:1208.4751](https://arxiv.org/pdf/1208.4751).
- **Hsieh2014**: Ming-Lun Hsieh. Special values of anticyclotomic Rankin–Selberg L-functions. Documenta Math. 19 (2014), 709–767, [open-access PDF](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/24.pdf).
- **Hung2017**: Pin-Chi Hung. On the non-vanishing mod ℓ of central L-values with anticyclotomic twists for Hilbert modular forms. J. Number Theory 173 (2017); cited by its locator.
- **Vatsal2003** (cited as Vatsal): Vinayak Vatsal. [Special values of anticyclotomic L-functions](https://personal.math.ubc.ca/~vatsal/research/mew3.pdf). Duke Math. J. 116 (2003), 219–261; locators use the author copy's pages.
- **Paskunas2016**: Vytautas Paškūnas. On 2-dimensional 2-adic Galois representations of local and global fields. Algebra & Number Theory 10 (2016), 1301–1358; [arXiv:1509.00332v2](https://arxiv.org/pdf/1509.00332v2), whose numbering is used.
- **Pottharst2013** (cited as Pottharst): Jonathan Pottharst. [Analytic families of finite-slope Selmer groups](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf). Algebra & Number Theory 7 (2013), 1571–1612.
- **BW** (cited as Betina–Williams): Adel Betina and Chris Williams. [Arithmetic of p-irregular modular forms: families and p-adic L-functions](https://arxiv.org/pdf/2011.02331v2). arXiv:2011.02331v2.
- **KPX**: Kiran Kedlaya, Jonathan Pottharst and Liang Xiao. Cohomology of arithmetic families of (φ,Γ)-modules. J. Amer. Math. Soc. 27 (2014); [arXiv:1203.5718](https://arxiv.org/pdf/1203.5718v3).
- **Pan**: Lue Pan. The Fontaine–Mazur conjecture in the residually reducible case. J. Amer. Math. Soc. 35 (2022); [arXiv:1901.07166](https://arxiv.org/pdf/1901.07166v2); Theorem 1.0.4 is FW's reference 95.
- **Kisin**: Mark Kisin. [Moduli of finite flat group schemes, and modularity](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf). Ann. of Math. 170 (2009), 1085–1180.
- **JSW17** (cited as JSW): Dimitar Jetchev, Christopher Skinner and Xin Wan. The Birch and Swinnerton-Dyer formula for elliptic curves of analytic rank one. Cambridge J. Math. 5 (2017); [arXiv:1512.06894](https://arxiv.org/pdf/1512.06894v1).
- **GV00** (cited as Greenberg–Vatsal): Ralph Greenberg and Vinayak Vatsal. On the Iwasawa invariants of elliptic curves. Invent. Math. 142 (2000), 17–63; [arXiv:math/9906215](https://arxiv.org/pdf/math/9906215v1).
- **BDP22**: Adel Betina, Mladen Dimitrov and Alice Pozzi. On the failure of Gorensteinness at weight 1 Eisenstein points of the eigencurve. Amer. J. Math. 144 (2022), 227–265; [arXiv:1804.00648](https://arxiv.org/pdf/1804.00648v4).
- **Ichino2008**: Atsushi Ichino. Trilinear forms and the central values of triple product L-functions. Duke Math. J. 145 (2008), 281–307; cited by its locator.
- **Ikeda1994**: Tamotsu Ikeda. On the theory of Jacobi forms and Fourier–Jacobi coefficients of Eisenstein series. J. Math. Kyoto Univ. 34 (1994), 615–636; cited by its locators.
- **Harris1984**: Michael Harris. Eisenstein series on Shimura varieties. Ann. of Math. 119 (1984), 59–94; cited by its locator.
- **Rubin2000**: Karl Rubin. Euler Systems. Annals of Mathematics Studies 147 (2000); cited by its locator.
- **BST19**: Ashay Burungale, Christopher Skinner and Ye Tian. Elliptic curves and Beilinson–Kato elements: rank one aspects; cited by its locator for the induced CM family used in CW Theorem 3.6.
