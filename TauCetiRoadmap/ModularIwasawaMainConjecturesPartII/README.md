# Roadmap: main conjectures for modular forms and their families, part II — CM forms at every prime

**Summary.** ModularIwasawaMainConjectures formulates Kato's cyclotomic main conjecture for a modular form (its §§0.6–0.7) and proves it in the ordinary, signed and family ranges where the automorphic reverse bounds apply. It stops before the forms with complex multiplication, where the residual image is dihedral and those bounds do not apply, and before the prime 2. This Part II proves the rational form of Kato's main conjecture for every CM newform of weight `k ≥ 2` at every prime `p`, including `p = 2` and `p = 3` (Burungale–Tian, Theorem 2.6). The route goes through the imaginary quadratic CM field `K`. Over the two-variable ray tower `K(p^∞f)` it builds the tower Iwasawa cohomology, the norm limits `h¹` of `p`-units and `h²` of class groups, Kato's CM theta functions and the elliptic units, Kato's CM realizations and his reciprocity law for elliptic units, and the elliptic-unit Euler system. With these it proves Johnson-Leung and Kings' main conjecture for every finite-order character at every prime and Rubin's two-variable main conjecture with its all-prime classical form. At a split prime it proves the Katz-measure form, its anticyclotomic `θ`-components and the λ-invariant identity used by Castella–Grossi–Lee–Skinner. It then proves the rational equivariant main conjecture over `ℤ_p[[Gal(K(p^∞f)/K)]] ⊗ ℚ`, with the Euler factors at the primes of `f` prime to `p` that its printed form omits. It identifies the elliptic-unit generator in the CM Iwasawa cohomology of KatoEulerSystems §4.4, and finally descends the equivariant equality to the cyclotomic tower over `ℚ` through Kato's comparison of elliptic units with Beilinson–Kato elements. The descent proves an equality, not just Kato's one-sided inequality.

## Scope and ownership

This roadmap owns the Iwasawa theory of elliptic units over imaginary quadratic fields at every prime and its CM-modular consequences:

- the arithmetic specialization of the completed group algebra to the CM ray group `Gal(K(p^∞f)/K)`, its normalization after inverting `p`, and the characteristic ideals over it (Layer 0);
- the tower modules `h¹`, `h²`, their Kummer and Brauer comparisons, the Euler-factor sequence for `H²` and the weak Leopoldt and rank-one statements for the ray tower (Layer 1);
- Kato's CM theta functions, canonical CM pairs, standard elliptic units, the elliptic-unit module and its cotorsion (Layer 2);
- Kato's realizations `V(ψ)`, `S(ψ)` of a Hecke character of type `(−r, 0)` for every `r ≥ 1`, and his explicit reciprocity law for elliptic units (Layer 3);
- the elliptic-unit Euler system, the Tamagawa number conjecture at `s = 0` for abelian extensions of `K`, Rubin's Euler-system bound, Johnson-Leung–Kings' main conjecture and Rubin's Theorem 4.1 (Layer 4);
- the Coleman power series of the height-one formal group of the CM curve at a split prime, the split-prime two-variable Coleman map, the elliptic-unit/Katz identification, the Katz form of the main conjecture, the anticyclotomic `θ`-component theorem and the functional-equation λ-identity (Layer 5);
- the rational equivariant main conjecture with its Euler factors (Layer 6);
- the general-weight normalization of CM induction, Kato's CM comparison map, the descent lemmas including the contained case `K ⊂ ℚ(μ_{p^∞})`, Kato's length lemma, the elliptic-unit generator at height zero and Kato's lattice inequality (Layer 7);
- the archimedean normalization of the induction, the reciprocity law in `V(f)`-coefficients, the bridge from elliptic units to Beilinson–Kato elements, the equality descent and the endpoint (Layer 8).

It leaves the following to their owners, by section:

- The formulation of Kato's main conjecture, the modular Iwasawa datum and Kato's Iwasawa cohomology `H^i(T)` over `ℤ[ζ_{p^n}, 1/p]` are ModularIwasawaMainConjectures §§0.1, 0.6 and 0.7. The endpoint here is the rational form `KMC_ℚ` of §0.7 for CM forms; it is not a second definition.
- Kato's zeta morphism `γ ↦ z_γ(f)` and the zeta submodule `Z(f)` are KatoEulerSystems §5.1, their critical interpolation is KatoEulerSystems §5.3, and the nonvanishing of twisted critical values (Jacquet–Shalika on the edge, Rohrlich's finiteness at the centre) is KatoEulerSystems §4.2. The rational and integral module structure of Kato's Theorem 12.4 for CM forms is KatoEulerSystems §4.4, and the rational Euler-system inequality is KatoEulerSystems §7.2 and PadicFamilies §4.0.3. Section 7.8 here identifies the elliptic-unit generator at height zero, which is stronger than the unmarked rank-one assertion and supplies the generator needed for equality descent. Section 7.9 keeps Kato's lattice inequality, whose additional conclusion at primes containing p under Rubin's condition (b) is distinct from the rational bound. The CM predicate and unnormalized Galois induction are AutomorphicGaloisRepresentations §3.15; §§7.1–7.2 here give the explicit weight dictionary and Kato's de Rham normalization.
- NonordinaryCMSpecialValues §§2.1–2.2 supply existence and uniqueness of the ideal-indexed theta function and canonical CM pair. Sections 2.2–2.3 here retain the coprime-degree norm law and pointed Artin action, with the coprimality hypotheses needed to preserve the divisor and level. Its §§2.3–2.6 use a direct theta-value convention and have standing hypotheses p ≥ 5 inert and p ∤ h_K; §§2.4–3.3 here give the inverse-unit, cohomological and all-prime extensions, with the regulator factor at 2 kept explicit. The theta and canonical-pair constructions of §§2.1–2.2 are prime-independent.
- The normalized theta unit `cθ` attached to an integer `c` prime to 6 and its distribution and isogeny laws are PadicFamilies §4.0.1. The ideal-indexed CM refinement `aθ_E` of Layer 2 differs in its index: it is attached to an ideal `a` of `O_K` and its norm law is along `O_K`-linear isogenies of degree prime to `N(a)`.
- The generalized Eisenstein–Kronecker series and their meromorphic continuation are AutomorphicPadicLFunctionsPartII §§3.3–3.4. Katz's two-variable `p`-adic measure on `Gal(K(p^∞f)/K)` at an ordinary prime is AutomorphicPadicLFunctionsPartII §8.5. The functional equation of Katz's measure is stated here (§5.5) because no supplier states it.
- Iwasawa algebras of `ℤ_p^d × Δ`, twists `Tw_κ`, Iwasawa cohomology for a profinite group, Shapiro, descent and control are SelmerIwasawaCohomology §§3.0–3.3 and 3.7. The S-unit Kummer identification is SelmerIwasawaCohomology §0.9. The étale and Galois comparison in Kato's `j_*` convention is SelmerIwasawaCohomology §3.15. The local cofreeness at `p` for the CGLS characters is SelmerIwasawaCohomology §3.17.
- Characteristic ideals, pseudo-null modules and determinants are PadicMeasuresIwasawaAlgebras §§4.1, 4.6 and 5.1.
- Euler systems and their twists are EulerSystemsAndKolyvaginSystems §§2.2 and 2.5. Rubin's Iwasawa-theoretic theorems over `ℤ_p^d`-extensions (hypotheses, weak Leopoldt from an Euler system, divisibility) are EulerSystemsAndKolyvaginSystems §§8.1–8.2, 8.6, 8.14, 8.25 and 8.37.
- The ideal isogenies of a CM elliptic curve, the CM period and de Rham pairings, the idele–torsion dictionary, ray-level fields and CM Hecke characters with their Tate components are ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1 and 4.2; the lattice–ideal dictionary of complex CM curves is ImaginaryQuadraticClassNumber §H3.1.
- The elliptic units of a rational CM curve `E/ℚ` with `End(E) = O_K` at a prime `p ≥ 5` of good ordinary reduction, built from Siegel functions on the ray class fields of its class-number-one field, the Coleman map of its formal group on the ray tower `K(𝔣p^∞)` with its explicit reciprocity law in Coleman form, the identification of `char((U_∞/𝒞̄_∞)^χ)` with Katz's measure and Rubin's two-variable main conjecture for such `E`, are NoncommutativeAndEquivariantIwasawa §4.3. The statements of Layers 4 and 5 differ from them by their generality: any imaginary quadratic `K` of any class number, Rubin's abelian `K₀ ⊃ H` with `p ∤ [K₀ : K]`, every prime in §4.5 and in the classical form of §4.8, the inert and ramified primes in §4.8(ii), and any CM curve with good reduction at the chosen split place in §5.1. The height-two Coleman interpolation at an inert prime is AnticyclotomicLocalUnits §1.1.
- Kato's ideal-indexed elliptic units `a z_f` at every prime and every modulus, with their norm relations and the module `z`, are §§2.2–2.6 here. EllipticCurvePeriodsAndModularParametrizations takes, in its one-variable `𝔩`-adic tower over ring class fields, norm limits of closures of elliptic units given as norms of CM values of modular units in ray class fields; those units are built from the same modular units as the units of §2.4 and are not cited here, and nothing of that roadmap is restated.
- The inert anticyclotomic main conjecture of Burungale–Kobayashi–Ota (their Theorems 6.1–6.2), with Rubin's signed `p`-adic L-function, the signed Selmer groups and their control, is InertAnticyclotomicCMMainConjecture. Nothing here is consumed from it, and nothing of it is restated here.

The former numbering CZ.4 is now Layer 6 (rational-equivariant-main-conjecture is §6.2); CZ.5 is now Layer 7 (cm-contained-descent is §7.6, and cm-h2-torsion is supplied by KatoEulerSystems §4.4, with the identified-generator strengthening in §7.8); CZ.6 is now Layer 8 (cm-kato-main-conjecture is §8.6 and cm-kato-normalization-dictionary is §8.7).

The vanishing of the μ-invariant of anticyclotomic Katz `p`-adic L-functions (Hida), which Castella–Grossi–Lee–Skinner combine with §5.4, is not a theorem of this roadmap; §5.4 asserts the characteristic-ideal and λ statements only. The Kato equality at a prime containing `p`, the integral equivariant (`Ω`-) form of the imaginary quadratic main conjecture at singular primes, and the integral refinement of Theorem 2.6 (Burungale–Tian, Remark 2.7) are not theorems of this roadmap. The first two need Johnson-Leung and Kings' μ-hypothesis (their Conjecture 5.5), known only for split `p ∤ 6`. The rational statements here make no claim about them.

## Conventions

- `K` is an imaginary quadratic field with a fixed embedding `K ⊂ ℂ`, `O_K` its integers, `w_K = #O_K^×` and `h_K` its class number. For a nonzero ideal `a`, `K(a)` is the ray class field of modulus `a` inside `K^ab ⊂ ℂ`. The Artin symbol `σ_a = (a, K(a′)/K)` is normalized so that a prime goes to its arithmetic Frobenius (ClassFieldTheory §2.6). `N(a) = #O_K/a`.
- `p` is any prime, `p = 2` and `p = 3` included. `f` is a nonzero ideal, `K(p^∞f) = ⋃_n K(p^n f)`, and `G = G_{p∞f} = Gal(K(p^∞f)/K)` is a profinite abelian group. Its torsion subgroup `Δ = Δ_f` is finite of any order, possibly divisible by `p`. `Γ ≅ ℤ_p²` is a chosen complement mapping isomorphically onto the Galois group of the `ℤ_p²`-extension of `K`.
- `O` is the ring of integers of a finite extension of `ℚ_p`. `R_O = O[[G]]` is `TauCeti.completedGroupAlgebra` at `(O, G)`, and `R = ℤ_p[[G]]`. Galois groups act on Iwasawa modules on the left. Twists are `Tw_χ(g) = χ(g)·g` (SelmerIwasawaCohomology §3.0). With a chosen basis `t_χ` of a character line, `x ↦ x ⊗ t_χ` is `Tw_{χ⁻¹}`-semilinear: `φ(g·x) = χ(g)⁻¹·g·φ(x)`.
- A height-one prime `q` of `R_O` is *regular* if `p ∉ q` and *singular* if `p ∈ q`. For a finitely generated torsion `R_O[1/p]`-module `M`, `ξ(M)` is the invertible ideal `∏_q q^{length M_q}` over the height-one primes, formed componentwise on the normalization (§0.2).
- A Hecke character `ψ` of `K` has *infinity type* `(m, n)` when its archimedean component on `ℂ^×` is `z ↦ z^m z̄^n`. A CM newform of weight `k` corresponds to a character of type `(1 − k, 0)`; Kato's realization uses `r = k − 1` and type `(−r, 0)`. `ψ̄` is the complex conjugate character, so `ψψ̄ = N^r` on ideals prime to the conductor.
- `L_S(ψ̄, χ, s) = Σ_b ψ̄(b)χ(b)N(b)^{−s}` over integral ideals `b` prime to `S`, with `χ(b) = χ(σ_b)`.
- `V_{F_λ}(f)` is Kato's cohomological realization of a newform `f` (Kato, 8.3). It is the dual of the covariant representation, and geometric Frobenius at a good prime `ℓ` has characteristic polynomial `X² − a_ℓX + ε(ℓ)ℓ^{k−1}`. Étale cohomology of `O_{K′}[1/p]` with coefficients `T` means cohomology of `j_*T` along the generic point (Kato, 8.2): neither extension by zero nor unrestricted cohomology of a larger open set.
- `G_∞ = Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^×`, including its torsion (`ℤ/(p − 1)` for odd `p`, `ℤ/2` for `p = 2`). `Λ = O_λ[[G_∞]]` and `Λ_ℚ = Λ[1/p]`.
- The dual exponential is Kato's (PadicHodgeRegulators §1.4). Periods `per_ψ`, `per_f` are Kato's (15.8 and 6.3).

## Exact supplier contracts

### From Mathlib

- `ClassGroup` of `O_{K′}` gives the ideal class groups whose `p`-primary parts form `h²`.
- `Module.length`, `IsLocalization.AtPrime` and `Ideal.height` give the height-one lengths in `ξ` and in Kato's length lemma. `Module.length` is the Krull dimension of the submodule lattice; it is `⊤` for a module of infinite length.
- `NumberField.Units.logEmbedding` and `NumberField.Units.logEmbedding_eq_zero_iff` identify the kernel of the logarithmic embedding with torsion; `NumberField.Units.regulator` and `NumberField.Units.regulator_ne_zero` give the positive covolume, rather than a map or its injectivity. `NumberField.Units.torsion` is the group of roots of unity.
- `NumberField.IsTotallyComplex` gives the absence of real places, which removes the dyadic real-place terms at `p = 2`.
- `IsCyclotomicExtension` and `cyclotomicCharacter` give the cyclotomic fields and the character whose kernel is the auxiliary ideal of §2.6.
- `PowerSeries` and `MvPowerSeries` give the coordinate rings of `O[[Γ]]`.

### From Tau Ceti

- `TauCeti.completedGroupAlgebra` with its projections, `map`, `lift` and topology is the ring `R_O` (SelmerIwasawaCohomology §3.0 specifies its coordinates and twists).
- `TauCeti.GlobalNumberFields.Modulus`, `TauCeti.GlobalNumberFields.RayClassGroup` and `TauCeti.GlobalNumberFields.HeckeCharacter` are the ray class groups and Hecke characters. The native ray class field and reciprocity are `TauCeti.ClassFieldTheory.rayClassField` and `TauCeti.ClassFieldTheory.rayClassArtinEquiv` in `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean`; ClassFieldTheory Layer 13 specifies their class-field-theoretic interface.
- `HeckeRing.GL2.Newform` is the newform carrier.

### From TauCetiRoadmap.GlobalNumberFields, ClassFieldTheory and ProfiniteProPGroups

GlobalNumberFields Layers 2 (moduli and ray class carriers), 9 (Hecke and ray class characters) and 10 (infinity types) supply moduli, characters and infinity types. ClassFieldTheory Layer 10 supplies the Brauer sequence and the sum of local invariants, Layer 11 global Artin reciprocity and Layer 13 ray class fields with their Artin isomorphisms. ProfiniteProPGroups Layer 9 ("The completed group algebra of the orientation image") specifies the completed group algebra.

### From TauCetiRoadmap.ModularForms, EllipticCurves and ModularCurves

ModularForms Layers 4–5 and 9 supply newforms, strong multiplicity one and the self-twist invariant, and Layer 7 their L-functions. EllipticCurves Layers 1–2 supply isogenies, formal groups, torsion and Tate modules. ModularCurves Layer 0 (relative effective Cartier divisors) and Layer 2 (isogenies and multiplication maps) supply the divisors and isogeny norms used for `aθ_E`.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§4.1 supplies pseudo-null modules and pseudo-isomorphisms. §4.6 supplies `charIdeal` over a noetherian normal factorial domain, multiplicative in short exact sequences and invariant under pseudo-isomorphism. §5.1 supplies determinant lines of perfect complexes. Characteristic ideals over `R_O[1/p]` are formed on each normal factor by §4.6.

### From SelmerIwasawaCohomology

§0.9 (Kummer identification for S-units) and §0.10 (inverse-limit hypotheses); §3.0 (Iwasawa algebras of `ℤ_p^d × Δ`, the involution and twists `Tw_κ`); §3.1 (Iwasawa cohomology `H^i_Iw(G, H; M)` for a profinite group with closed normal `H`, its corestriction-limit description under condition (F), and `H⁰_Iw = 0`); §3.2 (Shapiro); §3.3 (descent and control); §3.7 (twisting); §3.15 (étale cohomology of `Spec O_{F,S}` and the `j_*` comparison in degree one); §3.17 (local cofreeness at `p` and the away-`p` Euler factor for the CGLS characters); §2.8 (Greenberg's local condition). Its §3.13 rank formula is stated for the cyclotomic `ℤ_p`-extension and odd `p`. The ray-tower rank statement of §1.7 is proved here from the finite-level Euler characteristic and is not taken from §3.13.

### From ArithmeticGaloisDuality

§R02.4.3 (Poitou–Tate), §R02.4.4 (finiteness, cohomological dimension and Tate's global Euler characteristic formula) and §D7.5 (compact support and derived global duality).

### From IntegralIwasawaTheory

§2.6 (weak Leopoldt in every cyclotomic tower) and §10.0 (compact coefficients, Shapiro and mapping fibres).

### From EulerSystemsAndKolyvaginSystems

§2.2 (the module of Euler systems), §2.5 (twisting Euler systems by characters of finite order), §8.1 (`ℤ_p^d`-extensions in which no finite prime splits completely), §8.2 (Rubin's hypotheses `Hyp(K_∞, T)`), §8.6 (`Hyp(K_∞/K)`), §8.7 (the `Λ`-adic index of divisibility), §8.14 (invariance under twisting), §8.25 (weak Leopoldt from an Euler system, Rubin II.3.2) and §8.37 (Rubin's divisibility `char(X_∞) | ind_Λ(c)`, Rubin II.3.3).

### From ComplexMultiplicationAndExplicitReciprocity and ImaginaryQuadraticClassNumber

ComplexMultiplicationAndExplicitReciprocity §1.2 (the Serre tensor by a CM ideal: for an integral ideal `a` the isogeny `[a] : E → a⁻¹ ⊗ E` has kernel `E[a]` and degree `N(a)`, and `a⁻¹ ⊗ E` has period lattice `a⁻¹Λ` when `E` has lattice `Λ`; the CM period and de Rham pairings), §2.2 (the idele–torsion dictionary), §3.2 (ray-level value fields), §4.1 (the CM Hecke character `ψ_A` and the one-dimensional CM components of the Tate module) and §4.2 (the full elliptic CM L-factorization and the weight-two CM induction comparison). ImaginaryQuadraticClassNumber §H3.1 (the dictionary between complex elliptic curves with CM by `O_K` and lattices that are fractional ideals, with the ideal action on lattices).

### From AutomorphicGaloisRepresentations and AutomorphicGaloisRepresentationsPartII

AutomorphicGaloisRepresentations §3.15 supplies the CM predicate and algebraic-character induction, with the weight and dual dictionary of §§7.1–7.2. Its §1.5 (rank-two newform realization) and §7.3 (the fixed-eigenform compatible family) supply `V_{F_λ}(f)` and its Frobenius polynomials. AutomorphicGaloisRepresentationsPartII AG2.0 supplies the `λ`-adic Galois characters of algebraic Hecke characters.

### From AnalyticNumberTheoryPartI and LFunctions

AnalyticNumberTheoryPartI §2.3a supplies continuation and the functional equation of unitary Hecke L-functions, with the norm shifts for algebraic Hecke characters. LFunctions Layer 7 (intrinsic nonvanishing) supplies that a nontrivial primitive finite-order Hecke L-function has no zero on `Re s = 1`.

### From PadicHodgeRegulators

§1.4 (Kato's dual exponential) and §1.7 (twists, restriction and corestriction for the Bloch–Kato maps).

NonordinaryCMSpecialValues §2.5 supplies the applied relative-height-one theta reciprocity statement in its standing range p ≥ 5 inert and p ∤ h_K. Section 3.3 here owns the all-prime extension, including split, ramified and dyadic primes, and its inverse-unit normalization. The dual-exponential API alone is not an explicit reciprocity theorem.

### From AutomorphicPadicLFunctionsPartII

§§3.3–3.4 supply the Eisenstein–Kronecker series `K^ν(H, z, w, s, Λ)` with their continuation and residues. In dimension one with `w = 0`, `(z + λ)^{−k}|z + λ|^{−s} = conj(z + λ)^k·|z + λ|^{−2k−s}`, so Kato's `E(k, τ, z, s)` is that series with `ν = k` at the variable `k + s/2`. §8.5 supplies the bounded measure `μ_f` on `Gal(K(p^∞f)/K)` interpolating critical Hecke values for an ordinary lifted type. For `K` imaginary quadratic and `p = v v̄` split this is Katz's two-variable measure.

### From NonordinaryCMSpecialValues

Sections 2.1–2.2 supply the theta function and canonical CM pair. Sections 2.3–2.6 fix direct-unit and homological conventions in their standing range p ≥ 5 inert and p ∤ h_K; §§2.4–3.3 here compare them with the inverse-unit and cohomological realizations and extend the applied reciprocity to all primes. Only the construction and rigidity are imported without comparison; the coprime-degree isogeny law and preservation of a pointed level are the qualified statements of §§2.2–2.3.

### From PadicFamilies

§4.0.1 supplies the normalized theta unit `cθ` (divisor `c²[0] − [c]⁎[0]`, distribution law, isogeny norm, Tate expansion). §4.0.3 supplies the rational cyclotomic Euler-system inequality for eigenforms, including CM forms; §7.9 records the stronger lattice variant under condition (b).

### From KatoEulerSystems

§4.2 (nonvanishing of twisted critical values: for every sign and every character component of `G_∞`, infinitely many finite-order characters `χ` of `p`-power conductor with `L_{{p}}(f*, χ, k − 1) ≠ 0`, through Jacquet–Shalika for `k ≥ 3` and Rohrlich for `k = 2`), §5.1 (the rational zeta morphism `γ ↦ z_γ(f)`, its conjugation law `z_{ιγ} = −σ_{−1}z_γ`, and `Z(f)` as the `Λ_ℚ`-span of its values) and §5.3 (critical interpolation `Σ_σ χ(σ) per_f(ω_{γ,r,n}^σ)^± = (2πi)^{k−r−1}L_{{p}}(f*, χ, r)γ^±`). Its §4.4 supplies the CM module structure, including dyadic torsion-freeness and rational rank one, before the identification of the elliptic-unit generator in §7.8. Its §7.2 supplies the rational cohomological upper bound; §7.9 adds the integral condition-(b) variant.

### From NoncommutativeAndEquivariantIwasawa

§4.3 (its Construction of the elliptic units and of the two-variable `𝔭`-adic measure `ν_𝔣` of a rational CM curve at `p ≥ 5` ordinary, its Coleman map `Col_𝔣` on the ray tower `K(𝔣p^∞)` with image the annihilator ideal of `ℤ_p(1)` and the law `Col_𝔣(β(𝔞)) = (σ_𝔞 − N𝔞)ν_𝔣`, the characteristic-ideal identity `char((U_∞/𝒞̄_∞)^χ)·A_D = (μ_χ)`, and its Theorem, Rubin's two-variable main conjecture `char X_∞^χ = char (U_∞/𝒞̄_∞)^χ` for every `χ`). It is the case `E/ℚ`, `End(E) = O_K`, `p ≥ 5` of good ordinary reduction of §§4.8(i), 5.1–5.3, which the routes there do not reprove.

### From PeriodsAndSpecialValues

PS.5.2 (the equivariant Tamagawa number conjecture `ETNC(M, O)` as a predicate: continuation, the predicted order, rationality and integrality of the obstruction, stored separately). PS.6.5 states the Bloch–Kato predicate for triples of weight at most `−3` and does not cover `h⁰(F)(0)`.

### From ModularIwasawaMainConjectures

§0.1 (the modular Iwasawa datum), §0.6 (`H^i(T_K) = lim_n H^i_ét(ℤ[ζ_{p^n}, 1/p], j_*T_K)`) and §0.7 (`KMC^η` and its rational form `KMC_ℚ`, comparing `char(H¹/Z(f))` and `char(H²)` in `Λ[1/p]`).

## How to read the build

Layer 0 fixes the CM ray group, its Iwasawa algebra, the regular/singular dichotomy and `ξ`. Layer 1 builds the tower cohomology and the modules `h¹`, `h²`, and proves their comparisons and module structure, keeping the Euler terms at primes of `f` prime to `p`. Layer 2 constructs elliptic units and the module `z`, and proves Kronecker's limit formula and cotorsion. Layer 3 constructs Kato's CM realizations and proves his reciprocity law. Layer 4 proves the integral character-wise main conjecture of Johnson-Leung and Kings at every prime, and Rubin's theorem. Layer 5 treats split primes through Coleman maps and Katz's measure; it is used by no later layer. Layer 6 assembles the regular-prime lengths into the rational equivariant main conjecture. Layer 7 fixes the normalization of the supplied CM induction, identifies the elliptic-unit generator in the supplied rank-one cohomology and descends from the ray tower to the cyclotomic tower over `ℚ`. Layer 8 proves that elliptic units become Beilinson–Kato elements and deduces Kato's equality. Layers 7–8 use Layers 2–4 and 6, not Layer 5.

## Layer 0: the CM ray tower and its Iwasawa algebra

### 0.1 The ray group and its algebra

Define the *CM ray group* of `(K, p, f)` as `G = Gal(K(p^∞f)/K)` with its profinite topology. Through the global Artin map it is `lim_n RayClassGroup(p^n f)` (ClassFieldTheory Layer 13, GlobalNumberFields Layer 2). Define its Iwasawa algebra as `R_O = TauCeti.completedGroupAlgebra O G`. Prove that the torsion subgroup `Δ` of `G` is finite. Prove that `G/Δ ≅ ℤ_p²` maps isomorphically onto the Galois group of the `ℤ_p²`-extension of `K`: the unit rank of `K` is zero, so there is no Leopoldt defect, and the `ℤ_p`-rank is `r₂ + 1 = 2`. Prove that a chosen complement gives `R_O ≅ O[Δ][[S, T]]`, a three-dimensional semilocal ring (Burungale–Tian, §2.1.1, p. 3, BT line 136; Kato, 15.1, p. 250; Johnson-Leung–Kings, §4.1, p. 19). *Needs:* ClassFieldTheory Layer 13; GlobalNumberFields Layer 2; SelmerIwasawaCohomology §3.0; ProfiniteProPGroups Layer 9, "The completed group algebra of the orientation image".

- Define J = ker(R → ℤ_p) for the cyclotomic character. Its quotient is ℤ_p, of dimension one, so its height is two in the three-dimensional ray algebra. Section 2.6 identifies its elliptic-unit smoothing generators.
- For `f ∣ f′` restriction `G_{p∞f′} → G_{p∞f}` is onto and induces a surjection of Iwasawa algebras, compatible with composition and the identity.
- Restriction to `K(μ_{p^∞})` induces `R_O → O[[G_∞]]`. It is onto when `K ⊄ ℚ(μ_{p^∞})`. When `K ⊂ ℚ(μ_{p^∞})` it is onto `O[[G′_∞]]` with `G′_∞ = Gal(ℚ(μ_{p^∞})/K)`, of index two in `G_∞`.
- `R_O` is a domain exactly when `Δ` is trivial. It is always reduced, since it is torsion-free and embeds in `O[[Γ]] ⊗ Frac(O)[Δ]`. When `O` contains the values of the characters of `Δ`, it is a finite product of normal domains exactly when `p ∤ #Δ`.

**Checks.**

- For `K = ℚ(i)`, `p = 2`, `f = (1)`: `ℤ_2[i]^× = μ_4 × ℤ_2²` and the global units are `μ_4`, so `Δ` is trivial and `G ≅ ℤ_2²`. A model taking `Δ` to be the image of the global units would give `μ_4` instead.
- For `K = ℚ(i)`, `p = 5`, `f = (1)`: `5` splits, `(O_K ⊗ ℤ_5)^× = (μ_4 × ℤ_5)²`, and dividing by the diagonal `μ_4` gives `Δ ≅ ℤ/4`, prime to `5`.
- For `K = ℚ(i)`, `p = 2`, `f = (3)`: `(O_K/3)^× = 𝔽_9^×` is cyclic of order 8 and `i` has order 4 in it. The torsion of `(μ_4 × ℤ/8)` modulo the diagonal `μ_4` is cyclic of order 8, so `2 ∣ #Δ` and `ℤ_2[[G]]` is not a product of normal domains. A definition assuming `p ∤ #Δ` excludes this case.
- The restriction to the cyclotomic tower is onto `G_∞` for `K = ℚ(i)`, `p = 5`. For `K = ℚ(i)`, `p = 2` its image is `Gal(ℚ(μ_{2^∞})/ℚ(i)) ≅ 1 + 4ℤ_2`, of index two.

### 0.2 Normalization, regular primes and characteristic ideals

Assume that `O` contains the values of the characters of `Δ`. Prove that `O[Δ] ⊂ ∏_{χ ∈ Δ^} O` has cokernel killed by `#Δ`. Hence `R_O → ∏_χ O[[Γ]](χ)` is the normalization of `R_O` in its total quotient ring, and it becomes an isomorphism after inverting `p`. Prove that at a regular height-one prime `q` the localization `(R_O)_q` is a discrete valuation ring and equals the localization of one factor `O[[Γ]](χ)` (Johnson-Leung–Kings, Lemma 7.2, p. 34, and Lemma 7.6 with Definition 7.5, p. 35, JLK line 1477). Define `ξ(M)` for a finitely generated torsion `R_O[1/p]`-module as the product, over the factors, of the characteristic ideals of PadicMeasuresIwasawaAlgebras §4.6 of the components of `M[1/p]` (Burungale–Tian, §2.1.1, p. 3, BT line 146). *Needs:* §0.1; PadicMeasuresIwasawaAlgebras §§4.1, 4.6; Mathlib `Ideal.height`, `IsLocalization.AtPrime`, `Module.length`.

- `ξ` is multiplicative in short exact sequences of torsion `R_O[1/p]`-modules.
- `ξ(M) = ξ(N)` if and only if `length M_q = length N_q` at every height-one prime `q` of `R_O[1/p]`.
- `ξ(M)` is the unit ideal exactly when `M` is pseudo-null over `R_O[1/p]`.
- Extension of scalars `O → O′` is faithfully flat and multiplies `ξ` compatibly.

**Checks.**

- Over `ℤ_p[[T]]`, `ξ` of `ℤ_p[[T]]/(p)` is the unit ideal after inverting `p`, while its integral characteristic ideal is `(p)`. A definition that does not invert `p` makes the rational equality of Layer 6 false on such modules.
- For `Δ = ℤ/2` and `p = 2`, `ℤ_2[Δ] = ℤ_2[x]/(x² − 1)` has `(x − 1, 2)` as its unique maximal ideal and is not a product of domains, while `ℤ_2[Δ][1/2] ≅ ℚ_2 × ℚ_2`. The normalization statement holds only after inverting `p`.
- `ℤ_p[[T]]/(T²)` and `ℤ_p[[T]]/(T) ⊕ ℤ_p[[T]]/(T)` have the same `ξ`, namely `(T²)`, though they are not isomorphic: `ξ` records lengths, not modules.

### Examples

For `K = ℚ(√−7)` and `p = 7`, `K ⊂ ℚ(μ_7)` and the cyclotomic quotient of §0.1 has image of index two. For `K = ℚ(√−7)` and `p = 5`, the quotient is onto.

### Dependencies

ClassFieldTheory Layer 13; GlobalNumberFields Layer 2; ProfiniteProPGroups Layer 9, "The completed group algebra of the orientation image"; SelmerIwasawaCohomology §3.0; PadicMeasuresIwasawaAlgebras §§4.1, 4.6; Mathlib `Ideal.height`, `IsLocalization.AtPrime`, `Module.length`.

## Layer 1: tower cohomology, units and classes

### 1.1 Iwasawa cohomology of the ray tower

For a finitely generated `O`-module `T` with continuous `Gal(K̄/K)`-action, unramified outside a finite set, define `H^q_{p∞f}(T) = lim_{K′} H^q_ét(O_{K′}[1/p], j_*T)`. The limit runs over finite `K ⊂ K′ ⊂ K(p^∞f)` along corestriction, with `j` the inclusion of the open set over which `T` is lisse. Define `H^q(O_K[1/pf], ·)` likewise over `O_{K′}[1/pf]`. Prove that each `H^q_{p∞f}(T)` is a finitely generated `R_O`-module and vanishes for `q ∉ {1, 2}`. Degree zero vanishes because corestriction kills invariants in the limit; degrees at least three vanish because `K` has no real place, so the cohomological dimension is two (Kato, 15.6, p. 253, and 8.2, pp. 180–181). For a continuous character `χ : G → O^×` with chosen basis `t_χ`, prove that `x ↦ x ⊗ t_χ` is a `Tw_{χ⁻¹}`-semilinear isomorphism `H^q_{p∞f}(T) ≅ H^q_{p∞f}(T(χ))` (Johnson-Leung–Kings, Lemma 4.7, p. 22, JLK line 935). Perfectness of the underlying complexes is asserted only for `RΓ(O_K[1/p], Λ(η)(1))` with `η` of finite order and for `RΓ(O_K[1/pf], Ω(1))` (Johnson-Leung–Kings, Lemma 4.3, p. 20, JLK line 861). *Needs:* SelmerIwasawaCohomology §§3.1, 3.2, 3.7, 3.15; ArithmeticGaloisDuality §§R02.4.4, D7.5; §0.1; Mathlib `NumberField.IsTotallyComplex`.

- A continuous homomorphism of coefficient modules induces `R_O`-linear maps, compatible with composition and with finite-level corestriction.
- The degree-one limit agrees with SelmerIwasawaCohomology §3.1's corestriction limit of Galois cohomology of `G_{K′,S}` for `S` the places above `p` and the ramification of `T`, through the degree-one `j_*` comparison of SelmerIwasawaCohomology §3.15.
- The twist by the trivial character is the identity, and twisting by `χ₁` and then `χ₂` is twisting by `χ₁χ₂`.

**Checks.**

- `H⁰(K′, ℤ_p(1)) = T_p μ_{p^∞}(K′) = 0` for a number field K′. For K′ = ℚ(i), p = 2 the finite root group has order 4 but its Tate module is zero. Restriction between these zero groups still gives zero; it does not produce the discrete group of roots of unity.
- With `f` divisible by a prime `𝔩 ∤ p`, `H²` over `O[1/p]` and over `O[1/pf]` differ by the nonzero module of §1.5. The `j_*` convention is not the unrestricted cohomology of the larger open set.
- For `T = ℤ_p(1) ⊗ O(χ)` with `χ(g) = i` for some `g`, the semilinearity is `φ(g·x) = −i·g·φ(x)`. The opposite convention gives +i; for a quadratic character both conventions give −1, so that test alone does not distinguish them.

### 1.2 The tower unit and class modules

Define `h¹ = lim_{K′}(O_{K′}[1/p]^× ⊗ ℤ_p)` and `h² = lim_{K′} ClassGroup(O_{K′})[p^∞]`, the limits along field norms and norms of ideals over finite `K ⊂ K′ ⊂ K(p^∞f)`, with `G` acting through its finite quotients. Inside `h¹` define the submodule `E_∞` of norm-compatible global units (Burungale–Tian, §2.1.1, p. 3, BT lines 138–140; Kato, 15.1, p. 251; Johnson-Leung–Kings, §5.4, p. 26). *Needs:* §0.1; Mathlib `ClassGroup`; SelmerIwasawaCohomology §0.10; IntegralIwasawaTheory §10.0.

- Each projection `h¹ → O_{K′}[1/p]^× ⊗ ℤ_p`, `h² → Cl(K′)[p^∞]` is `R`-linear. For `K′ ⊂ K″` the projection to `K′` is the norm composed with the projection to `K″`.
- A norm-compatible family of `p`-completed `p`-units, respectively of `p`-primary ideal classes, defines a unique element, and two elements agree when all projections agree.
- For `f ∣ f′` the norm maps `h^i(f′) → h^i(f)` are compatible with `R(f′) → R(f)`.
- `E_∞ ⊂ h¹` is the kernel of the valuation maps at the finitely many places above `p` (Johnson-Leung–Kings, proof of Theorem 3.9, p. 18).

**Checks.**

- If every layer has trivial `p`-primary class group then `h² = 0`. For `K = ℚ(i)` and `p = 2` this holds at the first layer, `Cl(ℚ(i)) = 1`, and gives `h²` as the limit of the higher layers only.
- The root-of-unity norm limit over the full two-variable tower is zero: fix a layer and move in the transverse direction while keeping its cyclotomic level fixed. Norm then raises its finite root group to p^m-th powers, eventually 1. The cyclotomic line alone instead has N(ζ₂₅) = ζ₅ at p = 5; it cannot replace the full tower.
- At the base layer `K′ = K = ℚ(i)` with `p = 5`, `O_K[1/5]^× ⊗ ℤ_5 ≅ ℤ_5²`, generated by `2 + i` and `2 − i`, while `O_K^× ⊗ ℤ_5 = μ_4 ⊗ ℤ_5 = 0`. A definition through global units instead of `p`-units would lose this rank.

### 1.3 Kummer identification of the unit module

Prove that the finite-level Kummer isomorphisms `O_{K′}[1/p]^× ⊗ ℤ_p ≅ H¹(O_{K′}[1/p], ℤ_p(1))`, built with the fixed compatible system of `p`-power roots of unity, commute with norm and corestriction. Prove that they give an `R`-isomorphism `h¹ ≅ H¹_{p∞f}(ℤ_p(1))` compatible with the projections (Kato, (15.6.1), p. 253; Johnson-Leung–Kings, Lemma 5.8, p. 27, JLK line 1117). *Needs:* SelmerIwasawaCohomology §§0.9, 0.10; §§1.1, 1.2.

### 1.4 Class groups and degree-two cohomology

Construct an `R`-linear map `h² → H²_{p∞f}(ℤ_p(1))` whose kernel and cokernel are finitely generated `ℤ_p`-modules, hence pseudo-null over `R`. Consequently `(h²)_q ≅ H²_{p∞f}(ℤ_p(1))_q` at every height-one prime `q` (Kato, (15.6.2) and its proof, p. 254). At each layer the map comes from the Kummer sequence `0 → Pic(O_{K′}[1/p])[p^∞] → H²(O_{K′}[1/p], ℤ_p(1)) → T_p Br(O_{K′}[1/p]) → 0`. The last term is the kernel of the sum map `ℤ_p^Σ → ℤ_p` on the set `Σ` of places of `K′` above `p`, and `Cl(K′) → Pic(O_{K′}[1/p])` is onto with kernel generated by the classes of the primes in `Σ`. Retain both correction terms through the limit; they vanish only after localization at height one. *Needs:* ClassFieldTheory Layer 10; §§1.1–1.3; PadicMeasuresIwasawaAlgebras §4.1.

**Checks.**

- For a layer `K′` with two places above `p`, the Brauer term is the kernel of the sum map `ℤ_p² → ℤ_p`, of rank one, so `H²(O_{K′}[1/p], ℤ_p(1))` is not `Pic(O_{K′}[1/p])[p^∞]`. A definition identifying the two at finite level is wrong already for `K = ℚ(i)`, `p = 5`, `K′ = K`.
- For `K = ℚ(i)`, `p = 2`, `K′ = K`: `Cl(K) = 1` and there is one place above `2`, so `Pic(O_K[1/2])[2^∞] = 0`, the Brauer kernel `ℤ_2 → ℤ_2` is zero, and both correction terms vanish at the base layer. Their vanishing at one layer does not make the limit map an isomorphism.
- For a finitely generated `ℤ_p`-module `M` with `R`-action, `R/Ann(M)` embeds in `End_{ℤ_p}(M)` and is finite over `ℤ_p`, of dimension at most one, so `Ann(M)` has height at least two in the three-dimensional `R` and lies in no height-one prime: `M_q = 0` at every height-one `q`. A kernel or cokernel that were merely `R`-torsion, such as `ℤ_p[[G/D_𝔩]]` of §1.5, would not localize to zero.

### 1.5 The Euler-factor sequence

Write `H^i_S = lim_{K′} H^i(O_{K′}[S⁻¹], ℤ_p(1))`. Prove that `H¹_p = H¹_{pf}` and that restriction gives an exact sequence of `R`-modules

```text
0 → H²_p → H²_{pf} → ⊕_{𝔩 ∣ f, 𝔩 ∤ p} ℤ_p[[G/D_𝔩]] → 0,
```

where `D_𝔩` is the decomposition group of `𝔩` in `G`, of `ℤ_p`-rank one. Each `ℤ_p[[G/D_𝔩]]` is torsion and not pseudo-null. After inverting `p` its localization vanishes at every height-one prime on a component where the inertia group `I_𝔩 ⊂ G` acts nontrivially. On a component where `I_𝔩` acts trivially it is the cyclic module defined by `1 − Frob_𝔩⁻¹` (Johnson-Leung–Kings, Lemma 4.3 and its proof, pp. 20–21, JLK line 861, for the localization triangle, purity and the determinant `(1 − η(𝔩)Frob_𝔩⁻¹)⁻¹`; the limit sequence is derived here). *Needs:* §§0.2, 1.1, 1.3; SelmerIwasawaCohomology §3.17; ArithmeticGaloisDuality §D7.5; PadicMeasuresIwasawaAlgebras §4.1.

The route: at each layer, the localization triangle for `Spec O_{K′}[1/pf] ⊂ Spec O_{K′}[1/p]` and purity give `0 → H¹_p → H¹_{pf} → ⊕_{w∣𝔩} ℤ_p → H²_p → H²_{pf} → ⊕_{w∣𝔩} H¹(κ(w), ℤ_p) → 0`. In the limit the degree-two supported terms vanish, because corestriction multiplies by residue degrees that grow without bound, `Frob_𝔩` having infinite order in `G/I_𝔩`. The degree-three supported terms assemble to `ℤ_p[[G/D_𝔩]]`. Inverse limits of compact modules are exact.

**Checks.**

- If every prime factor of `f` lies above `p`, the sum is empty and `H²_p = H²_{pf}`.
- For `K = ℚ(i)`, `p = 5`, `f = (3)`: `3` is inert of norm 9, and `I_{(3)}` is the image of `1 × (O_K/3)^×` in `((O_K ⊗ ℤ_5)^× × (O_K/3)^×)/μ_4`, cyclic of order 8, since the diagonal `μ_4` meets it trivially. On the trivial finite-character component the factor is 1 − γ⁻¹ and is a nonzero nonunit. On the inertia-trivial component χ = ω ∘ χ_cyc, its finite Frobenius eigenvalue is ω(9) = −1, and the factor 1 + γ⁻¹ has augmentation 2 and is a unit. Triviality on inertia alone does not force a divisor.
- `ℤ_p[[G/D_𝔩]]` is not pseudo-null: `G/D_𝔩` has `ℤ_p`-rank one, so the module has dimension two over the three-dimensional `R`. Discarding it as pseudo-null would drop a codimension-one factor.

### 1.6 Torsion of the class module

Prove that `h²`, `H²_{p∞f}(ℤ_p(1))` and `H²_{pf}` are finitely generated torsion `R`-modules, each killed by a non-zero-divisor (Burungale–Tian, §2.1.1, p. 3, BT line 143; Kato, 15.1, p. 251; Johnson-Leung–Kings, Corollary 7.3, p. 34). The route passes through weak Leopoldt for the ray tower. `K(p^∞f)` is the union of the cyclotomic towers `K′(μ_{p^∞})` of its finite layers, since `K(μ_{p^∞}) ⊂ K(p^∞)`. Weak Leopoldt for each such tower (IntegralIwasawaTheory §2.6) gives `H²(G_{K(p^∞f), S}, ℚ_p/ℤ_p) = 0` by passage to the limit, and Poitou–Tate in the limit turns this into torsion of `H²_{p∞f}(ℤ_p(1))`. §1.4 transfers torsion to `h²`, and §1.5 to `H²_{pf}`. *Needs:* IntegralIwasawaTheory §2.6; ArithmeticGaloisDuality §§R02.4.3, D7.5; §§1.1, 1.4, 1.5.

### 1.7 Structure of the unit module

Prove that `h¹` is a finitely generated, torsion-free `R`-module, and that `h¹_q` is one-dimensional over the field `R_q` at every height-zero prime `q` (Burungale–Tian, §2.1.1, p. 3, BT lines 141–143; Kato, 15.1, p. 251; Johnson-Leung–Kings, proof of Theorem 6.4(2), p. 30, and Corollary 7.3, pp. 34–35). Here torsion-free means that no nonzero element is killed by a non-zero-divisor. The route has three parts. Finite generation comes from §1.3 and §1.1. The rank comes from Tate's global Euler characteristic formula at each finite layer: `K′` is totally complex, `ℤ_p(1)` has rank one and `H⁰ = 0` in the limit, so `rank H¹ − rank H² = [K′ : K]` normalized by the degree, combined with §1.6 on every `Δ`-component, `p = 2` included, since no real places occur. Torsion-freeness is a ray-tower statement. For a non-zero-divisor `x` of `R`, the elements of `H¹_{p∞f}(ℤ_p(1))` killed by `x` form `H⁰(K, ℤ_p(1) ⊗ R/x)`, by the coefficient sequence for `x` and `H⁰_{p∞f} = 0` (§1.1); `G_K` acts on `ℤ_p(1) ⊗ R/x` through `g ↦ χ_cyc(g)·g⁻¹`, so this group is `(R/x)[J]` for the ideal J of §0.1, the kernel of the cyclotomic character `R → ℤ_p`. `R = ℤ_p[Δ][[S, T]]` is Cohen–Macaulay of dimension three, `ℤ_p[Δ]` being finite free over `ℤ_p`, so `R/x` is unmixed of dimension two and its associated primes have height one, while `J` has height two: `(R/x)[J] = 0`. The invariants `ℤ_p(1)^{Gal(K̄/K(p^∞f))} = ℤ_p(1)` do not vanish; it is the codimension of `J` that forces torsion-freeness, and in a one-variable cyclotomic tower the same module has torsion (Checks). Vanishing of `ℤ_p`-torsion alone controls only `p`-power torsion, not `R`-torsion. *Needs:* §§1.1, 1.3, 1.6; ArithmeticGaloisDuality §R02.4.4; SelmerIwasawaCohomology §§3.1, 3.3.

**Checks.**

- For `K = ℚ(i)`, `p = 2`, `f = (1)`, `R = ℤ_2[[ℤ_2²]]` is a domain and the statement is that `h¹` is torsion-free of rank one.
- The zero module is torsion-free but not of rank one: rank one is a separate assertion and fails for a definition producing `h¹ = 0`.
- Over `R = ℤ_2[[G]]` with `Δ = ℤ/8` (the third check of §0.1), "killed by a non-zero-divisor" differs from "killed by a nonzero element". `x − 1` for `x` a generator of `Δ` is a nonzero zero-divisor, so torsion-freeness is stated with non-zero-divisors.
- In the one-variable tower `ℚ(ζ_{p^n})` over `ℚ`, `p` odd, the module `lim_n ℤ[ζ_{p^n}, 1/p]^× ⊗ ℤ_p` is not torsion-free: `N_{ℚ(ζ_{p^{n+1}})/ℚ(ζ_{p^n})}(ζ_{p^{n+1}}) = ζ_{p^{n+1}}^{Σ_{0≤j<p}(1 + jp^n)} = ζ_{p^n}`, since `Σ_j (1 + jp^n) = p + p^{n+1}(p − 1)/2 ≡ p mod p^{n+1}`, so `(ζ_{p^n})_n` is a nonzero norm-compatible element, killed by `σ − χ_cyc(σ)`. There `J` has height one in the two-dimensional algebra, and the argument of the route fails exactly where it must; a proof of §1.7 through vanishing of the invariants of `ℤ_p(1)` would prove this false statement too.

### Examples

For `K = ℚ(i)`, `p = 5`, `f = (1)`, the decomposition `R = ⊕_{χ ∈ Δ^} ℤ_5[[Γ]](χ)` has four factors, and §§1.6–1.7 say that each component of `h²` is torsion and each component of `h¹` has rank one.

### Dependencies

Layer 0; SelmerIwasawaCohomology §§0.9, 0.10, 3.1–3.3, 3.7, 3.15, 3.17; ArithmeticGaloisDuality §§R02.4.3, R02.4.4, D7.5; IntegralIwasawaTheory §§2.6, 10.0; ClassFieldTheory Layer 10; PadicMeasuresIwasawaAlgebras §4.1; Mathlib `ClassGroup`, `NumberField.IsTotallyComplex`.

## Layer 2: elliptic units

### 2.1 Theta functions as Eisenstein–Kronecker series

For `Im τ > 0` and `z ∉ ℤτ + ℤ` put `E(k, τ, z, s) = Σ_{(m,n) ∈ ℤ²} (z + mτ + n)^{−k}|z + mτ + n|^{−s}`. This is the one-dimensional Eisenstein–Kronecker series of AutomorphicPadicLFunctionsPartII §3.3, read through the conjugation identity of the supplier contracts. Put `E^{(k)}(τ, z) = (−1)^{k−1} (k − 1)! (2πi)^{−k} E(k, τ, z, 0)` for `k ≥ 1`, and `E^{(0)}(τ, z) = −lim_{s→0} s⁻¹E(0, τ, z, s)`. For `E_τ = ℂ/(ℤτ + ℤ)`, the coordinate `t = e^{2πiz}` and `c ≥ 2` prime to 6, prove the following two identities, for `z` and `cz` outside the lattice (Kato, 3.8 and (3.8.1)–(3.8.2), pp. 138–140):

```text
D^{k−1} dlog(cθ_E) = (c² E^{(k)}(τ, z) − c^k E^{(k)}(τ, cz)) · (dt/t)^{⊗k}    (k ≥ 1)
log|cθ_E| = c² E^{(0)}(τ, z) − E^{(0)}(τ, cz)
```

Transport them to the lattice of a CM pair by a homothety; the factor `(dt/t)^{⊗k}` scales by the `k`-th power of the scalar. *Needs:* AutomorphicPadicLFunctionsPartII §§3.3–3.4; PadicFamilies §4.0.1.

**Checks.**

- For `k ≥ 3` both sides are absolutely convergent lattice sums at `s = 0`; for `k = 1, 2` the right side is the continued value.
- At a torsion point `z = ατ + β ≠ 0` the second identity specializes to the Siegel-unit formula `log|g_{α,β}| = E^{(0)}_{α,β}` (Kato, (3.8.4)(iii)).
- `E(0, τ, z, s)` vanishes at `s = 0`, so `E^{(0)}` is a derivative and not a value. A definition by the value at 0 would give zero and break the second identity. Near z = 0 the theta function has order c²−1; for c = 5 the logarithmic derivative has leading coefficient +24/z, detecting the sign in E⁽¹⁾. For k = 2 and 3 the corresponding leading coefficients are −24/z² and +48/z³, with the powers of 2πi retained.

### 2.2 Kato's CM theta function

Let `K′ ⊃ K` be a field and `E/K′` an elliptic curve with `O_K ≅ End(E)`, normalized so that `O_K → End(E) → End(Lie E) = K′` is the inclusion. For an ideal `a` of `O_K` prime to 6, use the theta function of NonordinaryCMSpecialValues §2.1, denoted aθ_E, the unique unit on `E ∖ E[a]` with divisor `N(a)·(0) − E[a]` and with `N_b(aθ_E) = aθ_E` for every integer `b` prime to `a`, `N_b` being the norm along multiplication by `b` (Kato, 15.4, p. 252; Johnson-Leung–Kings, §3.2, p. 14). The new comparison is the norm law for an O_K-linear isogeny of degree prime to N(a); the coprimality ensures a bijection on a-torsion. The construction, uniqueness, base change, integer specialization and cocycle are supplied by NonordinaryCMSpecialValues §2.1. *Needs:* NonordinaryCMSpecialValues §2.1; ModularCurves Layers 0 and 2; EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §1.2; ImaginaryQuadraticClassNumber §H3.1; PadicFamilies §4.0.1.

- `div(aθ_E) = N(a)(0) − E[a]` as relative Cartier divisors.
- Invariance under `N_b` for integers `b` prime to `a`, and uniqueness among units with that divisor and that invariance.
- For `a = (c)` with `c ∈ ℤ` prime to 6, `aθ_E = cθ_E` of PadicFamilies §4.0.1 (Kato, (15.4.1)).
- For an `O_K`-linear isogeny `E → E′` of degree prime to `N(a)`, the norm of `aθ_E` is `aθ_{E′}`. This is Kato's (15.4.2), whose printed form omits the coprimality.
- For `a, b` prime to 6, `(bθ_E)^{N(a)} · (pr₁^* bθ_{E₁})⁻¹ = (aθ_E)^{N(b)} · (pr₂^* aθ_{E₂})⁻¹` with `E₁ = E/aE` and `E₂ = E/bE` (Kato, (15.4.3)).
- Compatibility with base change `K′ → K″`.

**Checks.**

- The divisor has degree `N(a) − #E[a] = 0`, since `E[a]` has order `N(a)`.
- For `a = O_K` the divisor is `(0) − (0) = 0` and `aθ_E = 1`.
- For a primitive cube root of unity `u`, `u·aθ_E` has the same divisor and passes the `N_2` test, since `u^{2²−1} = u³ = 1`, but fails the `N_3` test, since `u^{3²−1} = u⁸ = u² ≠ 1`. Testing `N_2` alone does not determine the function.
- For `N(a) > 1` the quotient `q : E → E/E[a]` has degree `N(a)`, not prime to `N(a)`. It sends the divisor `N(a)(0) − E[a]` to `N(a)(0) − N(a)(0) = 0`, so the norm is constant and cannot equal the nonconstant `aθ` on the quotient. This rules out the unrestricted isogeny law.

### 2.3 Canonical CM pairs

Let `f` be a nonzero ideal with `O_K^× → (O_K/f)^×` injective. A *CM pair of modulus `f`* over a field `K′ ⊃ K` is `(E, α)`, with `E/K′` as in §2.2 and `α ∈ E(K′)` a torsion point whose annihilator in `O_K` is `f`. Use the canonical CM pair, its rigidity and its universal base-change property from NonordinaryCMSpecialValues §2.2. It is the pair over K(f) with complex model (ℂ/f, 1 mod f). For finite abelian `K′/K`, `a` prime to f and to the ramification and `σ = (a, K′/K)`, there is a unique isomorphism `η_a : (E/aE, α mod aE) ≅ (E^{(σ)}, σ(α))` (Kato, 15.3 and (15.3.1)–(15.3.3), pp. 251–252; Johnson-Leung–Kings, §3.2, pp. 13–14). *Needs:* NonordinaryCMSpecialValues §2.2; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2; ImaginaryQuadraticClassNumber §H3.1; ClassFieldTheory Layer 13; Mathlib `NumberField.Units.torsion`.

- Uniqueness of isomorphisms: an automorphism fixing `α` is a unit congruent to 1 modulo `f`, hence 1.
- Base change along `K(f) → K′` is an equivalence onto CM pairs of modulus `f` over `K′`.
- For (a, f) = 1, the Artin action of `a` is the quotient by `E[a]`, that is, the ideal isogeny `[a] : E → a⁻¹ ⊗ E` of ComplexMultiplicationAndExplicitReciprocity §1.2, of degree `N(a)`, with the point carried along; over `ℂ` it is `ℂ/Λ → ℂ/a⁻¹Λ` in the lattice dictionary of ImaginaryQuadraticClassNumber §H3.1.

**Checks.**

- For `K = ℚ(i)` and `f = (3)`, `μ_4 → 𝔽_9^×` is injective, so the canonical pair exists over `K(3)`, an extension of degree `#𝔽_9^×/4 = 2` over `K`.
- For `K = ℚ(i)` and `f = (1 + i)`, `(O_K/f)^× = 1` and `μ_4` does not inject. The automorphism `i` fixes every point of annihilator `f`, so isomorphisms of pairs are not unique, and the definition must pass to a multiple of `f`.
- For `f = (1 + i)^3` (norm 8), `(O_K/f)^×` has order 4 and `i ↦ i mod f` is injective, so `K(f) = K`. The canonical pair is a model over `ℚ(i)` with a rational point of annihilator `(1 + i)^3`.

- With π = 1+i, level (π³) and a = (π), the quotient point has annihilator (π²), not (π³), although K((π³)) = K. Requiring (a,f) = 1 excludes this failed pointed action. For a = (5), 5−1 ∈ (π³) and the annihilator stays (π³).

### 2.4 Standard elliptic units

Fix a prime p. For `f` as in §2.3, `(E, α)` the canonical pair over `K(f)` and `a` prime to `6pf`, define the standard elliptic unit `a z_f = aθ_E(α)⁻¹ ∈ K(f)^×`. For general `m` prime to `a`, define `a ζ_m = N_{K(p^r m)/K(m)}(aθ_E(α)⁻¹)`, with `(E, α)` the canonical pair of modulus `p^r m`, for any `r ≥ 1` making units inject (Kato, 15.5, p. 253; Johnson-Leung–Kings, Definition 3.2 and Proposition 3.3, pp. 14–15, JLK line 600). *Needs:* §§2.2–2.3; §1.2; ClassFieldTheory Layer 13.

- `a ζ_m` does not depend on `r`.
- `a z_f` has valuation zero at every prime not dividing `f`. It is a unit when `f` has two distinct prime factors, and an `O_K[1/𝔮]`-unit when `f` is a power of a prime `𝔮`.
- Norm relation: for a prime `𝔮` with `m𝔮` prime to `a`, `N_{K(m𝔮)/K(m)}(a ζ_{m𝔮}) = (a ζ_m)^{1 − Frob_𝔮⁻¹}` if `𝔮 ∤ pm`, and `= a ζ_m` if `𝔮 ∣ pm`.
- Auxiliary independence: `(b z_f)^{N(a) − σ_a} = (a z_f)^{N(b) − σ_b}` for `a, b` prime to `6f` (Kato, (15.4.4)).
- Galois action: `σ_c(a z_f)` is the theta value at the conjugate point, computed through `η_c`.

**Checks.**

- For `a = (5)` and `b = (7)` in `ℚ(i)` with `f` prime to `35`, the relation reads `(7 z_f)^{25 − σ_{(5)}} = (5 z_f)^{49 − σ_{(7)}}`. The unequal factors test the relation itself, which `a = b` would not.
- For `K = ℚ(i)` and `f = (3)(1 + i)^3`, with two distinct prime factors, `a z_f` is a global unit of `K(f)`.
- The cyclotomic units `1 − ζ_{p^n}` of `ℚ(μ_{p^n}) ⊂ K(p^n)` do not form this system. Their norms along the `ℤ_p`-direction transverse to the cyclotomic one are not compatible, and they carry no factor `N(a) − σ_a`.
- Dropping the factor `1 − Frob_𝔮⁻¹` for `𝔮 ∤ pm` would make the family norm-compatible in every direction, which contradicts the Kronecker limit formula of §2.5.

### 2.5 Kronecker's limit formula for elliptic units

In this subsection and in the finite-level projection of §2.6, log|u| uses the squared complex norm |u| = u·ū. The Beilinson regulator r_B uses the ordinary absolute value, so r_D = 2r_B. For `f` with injective units, `a` prime to `6pf` and every character `χ` of `Gal(K(f)/K)`, prove (Kato, (15.5.1), p. 253):

```text
Σ_{σ ∈ Gal(K(f)/K)} χ(σ) log|σ(a z_f)| = (N(a) − χ(a)⁻¹) · lim_{s→0} s⁻¹ L_f(χ, s).
```

The route applies §2.1 at the canonical pair and sums over the ray classes through `η_c`. *Needs:* §§2.1, 2.3, 2.4; AnalyticNumberTheoryPartI §2.3a; GlobalNumberFields Layer 9.

**Checks.**

- For the trivial character the finite-level smoothed formula involves the derivative at 0 of the partial zeta function prime to f; the unsmoothed projection in §2.6 excludes the trivial character.
- If χ is nontrivial and `χ` is unramified at a prime `𝔩 ∣ f` with `χ(𝔩) = 1`, then `L_f(χ, s)` has a zero of order at least two at `0` and the left side vanishes: the unit of modulus `f` does not see that component.
- For `a = (5)` in `ℚ(i)` and `χ((5)) = −1`, the factor is `25 + 1 = 26`, and a factor `N(a) − χ(a)` would give the same value. When `χ(a) = i` the stated factor is `25 − i⁻¹ = 25 + i`, while `N(a) − χ(a)` gives `25 − i`: the inverse is detected only by non-real values.

- For the trivial character over ℚ(i), f = (3), L_f(1,s) = ζ_K(s)(1−9^(−s)) has derivative −log(9)/4, not zero. Only a nontrivial character supplies the pre-existing zero that makes an additional vanishing Euler factor raise the order to at least two.
- At τ = i, c = 5 and z = 1/3, the ordinary theta logarithms at the two quadratic conjugates are approximately 0.6619210722 and 5.9297526599. The inverse unit has squared-norm weighted logarithm 10.5356631754 = 8log(2+√3); the ordinary regulator gives half that value.

### 2.6 The elliptic-unit module and the auxiliary-free element

Define `z ⊂ h¹` as the `R`-submodule generated by the norm-compatible families `(a z_{p^n f})_n`, over all ideals `a` prime to `6pf`. Define `z_{p∞f} = (N(a) − σ_a)⁻¹·(a z_{p^n f})_n ∈ h¹ ⊗_R Q(R)` for any `a ≠ O_K` prime to `6pf` (Kato, 15.5–15.6 and (15.6.3)–(15.6.4), pp. 253–254; Burungale–Tian, §2.1.1, p. 3, BT line 144; Johnson-Leung–Kings, §§5.1, 5.3, pp. 23 and 25). Here `N(a) − σ_a` is a non-zero-divisor of `R`, because its image under every finite-order character `η`, `N(a) − η(σ_a)`, is nonzero. *Needs:* §§1.2, 1.3, 2.4, 0.1; Mathlib `cyclotomicCharacter`.

- `z_{p∞f}` does not depend on `a`: `(N(b) − σ_b)·(a z) = (N(a) − σ_a)·(b z)` in `h¹`.
- `(N(a) − σ_a)·z_{p∞f} ∈ H¹_{p∞f}(ℤ_p(1))` for every admissible `a`.
- The ideal `J` generated by the elements `N(a) − σ_a` is the kernel of the cyclotomic character `R → ℤ_p`. `R/J ≅ ℤ_p` is pseudo-null, so `J_q = R_q` and `z_q = R_q·z_{p∞f}` at every height-one prime `q`.
- For `f ∣ f′` the norm `h¹(f′) → h¹(f)` sends `z_{p∞f′}` to `∏_{𝔩 ∣ f′, 𝔩 ∤ pf} (1 − Frob_𝔩⁻¹)·z_{p∞f}`.
- Under `h¹ ≅ H¹(O_K[1/pf], Ω(1))` (§§1.3, 1.5), the inverse-unit z_(p∞f) is compared with the Johnson-Leung–Kings element after the regulator normalization of §4.3; rationally their factor 2 is invertible.

**Checks.**

- `R/J ≅ ℤ_p` with `g` acting through the cyclotomic character. The quotient has dimension one, so the localization of J is the unit ideal at every height-one prime. A fixed auxiliary factor need not be a unit there.
- For admissible `a` with `N(a) > 1`, `(N(a) − σ_a)·z_{p∞f}` is the family `(a z_{p^n f})_n`. A definition with `1 − σ_a` or `N(a) − σ_a⁻¹` fails this test. The full ideal J clears the denominator at every height-one prime; a single factor can still vanish there.
- `ξ((h¹/z)_ℚ) = ξ(h¹_ℚ/R_ℚ·z_{p∞f})`, because `z` and `R·z_{p∞f}` differ only in codimension two.

For finite `K ⊂ K′ ⊂ K(p^∞f)`, let `z_{K′}` be the image of `z_{p∞f}` (§2.6) in `O_{K′}[1/p]^× ⊗ ℚ`. Prove that `Σ_σ χ(σ) log|σ(z_{K′})| = lim_{s→0} s⁻¹ L_{pf}(χ, s)` for every nontrivial `χ` of `Gal(K′/K)` (Kato, (15.6.5), p. 255; Johnson-Leung–Kings, Proposition 3.3(4), p. 14, with the squared norm retained). *Needs:* §§2.4–2.5 and the auxiliary independence above.

**Checks.**

- The finite-level projection formula uses the squared norm of §2.5; its ordinary Beilinson regulator is half the displayed leading coefficient.
- Norm from a conductor enlarged by a tame prime with nontrivial Frobenius gives the factor 1−Frob⁻¹; replacing this by 1 would disagree with §1.5.
- The ideal O_K as an auxiliary index gives N(a)−σ_a = 0; it is excluded before inverting the factor.

### 2.7 Cotorsion of elliptic units

Prove that `h¹/z` is a torsion `R`-module for every `p` and every `f`; equivalently, `z_{p∞f}` generates `h¹` at every height-zero prime (Burungale–Tian, §2.1.1, p. 3, BT line 145; Kato, 15.1, p. 251; Johnson-Leung–Kings, Theorem 3.9 and its proof, pp. 17–18, JLK line 727). The route works one height-zero prime at a time. On its component choose a finite-order `η` ramified at all primes above `p` with `η(Frob_𝔩) ≠ 1` at the primes `𝔩 ∣ f`, `𝔩 ∤ p`, where the component is unramified. Such `η` exist because `Frob_𝔩` has infinite order in `G/I_𝔩`. By §2.5 the archimedean regulator of the `η`-part of `z_{K′}` is the leading coefficient of `L_{pf}(η⁻¹, s)` at `s = 0`, which is nonzero by the functional equation and the nonvanishing of `L(η̄, 1)`. Since the regulator is injective on units modulo torsion, the `η`-part is nonzero, and §1.7 gives rank one. *Needs:* §§1.7, 2.5, 2.6; AnalyticNumberTheoryPartI §2.3a; LFunctions Layer 7; Mathlib `NumberField.Units.logEmbedding_eq_zero_iff`.

### Examples

For `K = ℚ(i)`, `p = 2`, `f = (1)`, `R = ℤ_2[[ℤ_2²]]` is a domain, and §2.7 says that `z_{2∞} ≠ 0`. For `K = ℚ(√−3)` the auxiliary ideal must be prime to 6p; away from p = 5, 7, `a = (5)` (inert, norm 25) and a = (2 + √−3) (norm 7) give the factors `25 − σ_{(5)}` and `7 − σ_a` with `a` a prime above 7.

### Dependencies

Layer 1; Layer 0; NonordinaryCMSpecialValues §§2.1–2.2; AutomorphicPadicLFunctionsPartII §§3.3–3.4; PadicFamilies §4.0.1; ModularCurves Layers 0 and 2; EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2; ImaginaryQuadraticClassNumber §H3.1; ClassFieldTheory Layer 13; GlobalNumberFields Layer 9; AnalyticNumberTheoryPartI §2.3a; LFunctions Layer 7; Mathlib `NumberField.Units.regulator_ne_zero`, `NumberField.Units.torsion`, `cyclotomicCharacter`.

## Layer 3: CM realizations and Kato's reciprocity law

### 3.1 Kato's realization of a CM Hecke character

Let `r ≥ 1` and let `ψ` be a Hecke character of `K` of type `(−r, 0)`, with values generating the finite extension `L = K(ψ(K̂^×)) ⊂ ℂ`. Choose `f` contained in the conductor of `ψ` with injective units, and let `(E, α)` be the canonical pair over `K(f)`. Define the Betti realization `V_L(ψ) = H¹(E(ℂ), ℚ)^{⊗r} ⊗_K L`, the tensor power over `K`. These are the cohomological realizations, compared with NonordinaryCMSpecialValues §2.4 by dualizing its homological convention. Define the étale realization `V_{L_λ}(ψ) = H¹_ét(E_{ℚ̄}, ℚ_p)^{⊗r} ⊗_{K ⊗ ℚ_p} L_λ` for a place `λ ∣ p` of `L`. Extend the natural `Gal(ℚ̄/K(f))`-action to `Gal(ℚ̄/K)` by `σ ↦ ψ(a)⁻¹ (J_a^*)^{⊗r} ∘ σ`, where J_a = η_a ∘ q_a : E → E^(σ_a) includes the quotient isogeny q_a : E → E/E[a], (a,f) = 1 and `σ|_{K(f)} = σ_a`; this is independent of `a`. Define the de Rham realization `S(ψ) ⊂ coLie(E)^{⊗r} ⊗_K L` as the invariants of the semilinear Gal(K(f)/K)-action through the pullbacks of the same J_a; the tensor power of coLie(E) is over K(f). Define the period map `per_ψ : S(ψ) → V_L(ψ) ⊗ ℂ` (Kato, 15.7–15.8 and (15.8.1), pp. 255–258; Burungale–Tian, §2.2.5, p. 5, BT lines 199–206). *Needs:* §2.3; ComplexMultiplicationAndExplicitReciprocity §§1.2, 4.1; AutomorphicGaloisRepresentationsPartII AG2.0; GlobalNumberFields Layers 9–10; EllipticCurves Layer 2.

- `V_L(ψ)`, `S(ψ)` are one-dimensional over `L`, and `V_{L_λ}(ψ)` is one-dimensional over `L_λ`.
- An idele `a` acts on `V_{L_λ}(ψ)` by `a_v^r ψ(a)⁻¹`, where `v` is the place of `K` under `λ`. For `a` prime to `pf` the Artin symbol `σ_a` acts by `ψ(a)⁻¹`, and the action factors through `G_{p∞f}`.
- `S(ψ) ⊗_L L_λ ≅ D^j_dR(K ⊗ ℚ_p, V_{L_λ}(ψ))` for `1 ≤ j ≤ r` (Kato, (15.8.1)), from the filtered de Rham comparison for `E` over the completions of `K(f)`, with the CM action and tensor powers, descended through the semilinear action.
- The constructions for `f ⊂ f′` are identified through the canonical isogenies of canonical pairs.
- For `r = 1` and `ψ` the character of a CM elliptic curve, `V_{L_λ}(ψ)` is the corresponding one-dimensional component of ComplexMultiplicationAndExplicitReciprocity §4.1, dualized to Kato's cohomological convention.

**Checks.**

- At a prime `𝔮 ∤ pf` of `K` a Frobenius acts on `V_{L_λ}(ψ)` by `ψ(𝔮)⁻¹`. For `K = ℚ(i)`, `r = 1`, `ψ` the character of `y² = x³ − x` and `𝔮 = (2 + i)`, `ψ(𝔮)` has norm 5 and the eigenvalue `ψ(𝔮)⁻¹` has absolute value `5^{−1/2}`, not a root of unity.
- `V_{L_λ}(ψ)` is ramified at `v`, because the idele action contains `a_v^r` with `r ≥ 1`. It is not a finite-order character.
- `dim_L V_L(ψ) = 1` although `H¹(E(ℂ), ℚ)` has dimension two over `ℚ`. The tensor power is over `K`, and a tensor power over `ℚ` would have dimension `2^r`.

### 3.2 The period evaluation

With `K′ = K(g)` for `g = p^m f₀ ⊂ f` with injective units (`f₀` the prime-to-`p` part of `f`), `a` prime to 6pf, `ω` a basis of `coLie(E)` and `β ∈ H₁(E(ℂ), ℚ)` the image of `1` under `K ≅ H₁(ℂ/g, ℚ)`, put `ω_r = (r − 1)!⁻¹ (d/ω)^r log(aθ)(α_m) · ω^{⊗r}`. Prove that for every character `χ` of `Gal(K′/K)` (Kato, (15.9.1)–(15.9.2) and their proof, pp. 259–260):

```text
Σ_σ χ(σ) per_ψ(σ(ω_r)) = (N(a) − ψ(a)χ(a)⁻¹) · L_{pf}(ψ̄, χ, r) · β^{⊗(−r)}.
```

Consequently, when `N(a) − ψ(a)χ(a)⁻¹ ≠ 0` for every character `χ` of `Gal(K′/K)`, so that `N(a) − ψ(a)σ_a` is invertible in `L[Gal(K′/K)]`, the element `z = (N(a) − ψ(a)σ_a)⁻¹ω_r` satisfies `Σ_σ χ(σ) per_ψ(σ(z)) = L_{pf}(ψ̄, χ, r)·β^{⊗(−r)}`. Such auxiliary ideals exist for every `K′`. For `r ≠ 2`, `|ψ(a)| = N(a)^{r/2} ≠ N(a)` whenever `N(a) > 1`. For `r = 2`, any prime `a = 𝔮` split in `K` and prime to `6pf` works: `ψ(𝔮)/N(𝔮)` has absolute value one, but some power of it is a root of unity times `π/π̄` for a generator `π` of a power of `𝔮`, which is not a root of unity because `𝔮 ≠ 𝔮̄`. The route expresses `(d/ω)^r log θ` by §2.1 and re-indexes the lattice sum by `c ↦ cb` onto ideals in a ray class. It uses `ψ((c)) = c^r` for `c ≡ 1` modulo the conductor and `ψψ̄ = N^r`. *Needs:* §§2.1–2.3, 3.1; AnalyticNumberTheoryPartI §2.3a.

**Checks.**

- For r ≥ 3 and trivial χ both sides are absolutely convergent, and the identity is a rearrangement of lattice sums.
- At r = 1 the value lies left of the absolute-convergence boundary 3/2, and at r = 2 it lies on the boundary 2. Both use the continued L-function.
- The auxiliary factor can vanish. For type `(−r, 0)`, `ψ((c)) = c^r` for `c ≡ 1` modulo the conductor, so for `r = 2`, `c ∈ ℤ` prime to `6f` and `a = (c)`, `ψ(a) = c² = N(a)` and the factor is zero at the trivial character. The invertibility hypothesis on `a` is needed.
- `|ψ(a)| = N(a)^{r/2}`, since `ψψ̄ = N^r` and `|ψ| = |ψ̄|`. For `r = 1` the factor satisfies `|N(a) − ψ(a)χ(a)⁻¹| ≥ N(a) − N(a)^{1/2} > 0`, so every auxiliary `a ≠ O_K` is admissible in weight two.

- At r = 2, the finite part cannot be dropped: for the square of the Gaussian curve character twisted by the quadratic ray character modulo (3), ψ((7)) = −49 and ψ((41)) = 1681. At χ = 1 the auxiliary factors are 98 and 0, respectively. The congruence modulo the conductor is necessary before writing ψ((c)) = c².

- Replacing ω by uω multiplies (d/ω)^r by u^(−r) and ω^(⊗r) by u^r, leaving ω_r unchanged.
- Auxiliary inversion is performed only when every character scalar is nonzero; for r = 2 a split prime supplies such an index.
- The character formula is compatible with trace to a smaller ray layer by summing its conjugates; it retains all removed Euler factors.

### 3.3 Kato's explicit reciprocity law for elliptic units

First prove the local theta-system reciprocity formula for every prime p. Let g = p^m f₀, m ≥ 1, with injective units, let (E,α) be its canonical CM pair and require good reduction at the place above p under consideration. Choose the CM-compatible torsion basis ξ = (ξ_n) of T_pE coming from the Betti class of 1 ∈ K, with [p]ξ_(n+1) = ξ_n. Write ν_n = ξ_n − α_n for its prime-to-p level translate and θ_n(z) = aθ_E(z − ν_n), where a is prime to 6pg. For every r ≥ 1 and every nonzero invariant differential ω, prove that cup product of the norm-compatible theta-value Kummer class with ξ^(⊗(−r)), followed by localization and Kato's dual exponential, is

    p^(−mr) (r−1)!⁻¹ (d/ω)^r log θ_m(ξ_m) · ω^(⊗r).

Here θ_n(ξ_n) = aθ_E(α_n), and the translated derivative at ξ_m is the derivative of aθ_E at α_m. The target uses the semilocal product of the relative O_𝔭-height-one CM division groups; the underlying p-height can be two. For inverse theta values, transport the sign by inversion of the Kummer class and fix it using the differential convention of §2.1. This local formula and its trace, differential-change and coefficient-change comparisons are the all-prime variant owned here; NonordinaryCMSpecialValues §2.5 supplies its p ≥ 5 inert, p ∤ h_K range (Kato, proof of Proposition 15.9, pp. 258–259). *Needs:* §§2.1–2.4, 3.1–3.2; PadicHodgeRegulators §§1.4, 1.7; SelmerIwasawaCohomology §3.6; NonordinaryCMSpecialValues §2.5 for its stated range; ComplexMultiplicationAndExplicitReciprocity §4.1.

Let `r ≥ 1`, `ψ` of type `(−r, 0)`, `p` any prime, `f` contained in the conductor of `ψ`, `K′ ⊂ K(p^∞f)` finite over `K` and `γ ∈ V_L(ψ)`. Map `z_{p∞f}` along `H¹_{p∞f}(ℤ_p(1)) → H¹_{p∞f}(V_{L_λ}(ψ)(1)) → H¹(O_{K′}[1/p], V_{L_λ}(ψ)(1))`, the first map being `x ↦ x ⊗ γ`. Then localize at `p` and apply the dual exponential and (15.8.1). Prove that the image lies in `S(ψ) ⊗_K K′`, and that for every character `χ` of `Gal(K′/K)`, `Σ_σ χ(σ) per_ψ(σ(image)) = L_{pf}(ψ̄, χ, r)·γ` (Kato, Proposition 15.9 and its proof, pp. 258–260). The route reduces by traces to `K′ = K(g)` and by linearity to `γ = β^{⊗(−r)}`. It then applies the all-prime local formula above, transporting the direct theta values to the inverse convention, to the norm-compatible system of theta values `θ_n(ξ_n)` with `θ_n(z) = aθ(z − ν_n)`. Each `𝔭`-divisible group of `E` over a place of `K(g)` above `p` has relative `O_𝔭`-height one (underlying p-height two at inert or ramified p). Enlarge the level by an auxiliary prime away from 6pf so that the units congruent to 1 modulo the prime-to-place part of the level are trivial; the Serre–Tate criterion then gives good reduction at the places used in the reciprocity law. Descend by trace, retaining the auxiliary Euler factor and choosing its value nonzero by §3.2. The unit-injectivity condition for the full level alone does not imply good reduction at its own prime divisors. The result `p^{−mr}·ω_r` is then divided by `N(a) − ψ(a)σ_a`, and §3.2 is applied. *Needs:* PadicHodgeRegulators §§1.4, 1.7; NonordinaryCMSpecialValues §2.5; §§2.6, 3.1, 3.2, 1.3; the local formula above; NeronModelsAndSemistableAbelianVarieties §5.1.

**Checks.**

- For `χ` of conductor divisible by every prime of `pf`, `L_{pf}(ψ̄, χ, r) = L(ψ̄χ, r)`, the full Hecke value.
- For `r = 1`, `K = ℚ(i)` and `ψ` the character of `y² = x³ − x`, the formula relates the localized elliptic units to `L(ψ̄χ, 1)`. At `p = 2`, `K ⊂ ℚ(μ_{2^∞})` and the statement is not excluded.
- For additive torsion coordinates ξ = 1/5, α = 1/5 + 1/3 = 8/15, ν = ξ−α = −1/3, the translated argument ξ−ν is 8/15 = α. Using ξ+ν gives −2/15 instead and fails the theta-evaluation comparison.
- The relative height is one at inert `p`, although the `p`-divisible group of `E` has height two there. A hypothesis "ordinary `p`-height one" would exclude inert primes, which the law covers.

### Examples

For a CM newform of weight `k` attached to `ψ` of type `(1 − k, 0) = (−r, 0)` with `r = k − 1`, Layer 3 is applied to that `ψ`. For `k = 2`, `r = 1`, the period evaluation is the classical one for the CM elliptic curve.

### Dependencies

Layer 2; Layer 1 (§1.3); SelmerIwasawaCohomology §3.6; ComplexMultiplicationAndExplicitReciprocity §§1.2, 4.1; AutomorphicGaloisRepresentationsPartII AG2.0; GlobalNumberFields Layers 9–10; EllipticCurves Layer 2; PadicHodgeRegulators §§1.4, 1.7; NonordinaryCMSpecialValues §2.5; NeronModelsAndSemistableAbelianVarieties §5.1; AnalyticNumberTheoryPartI §2.3a.

## Layer 4: the elliptic-unit Euler system and the integral character-wise main conjecture

### 4.1 The Euler system of elliptic units and its twists

Fix `p` and an ideal `a` prime to `6p`, and let `𝒦` be the union of the `K(q)` over `q` prime to `a`. Prove that the classes `a ζ_m ∈ O_{K(m)}[1/p]^× ⊗ ℤ_p ⊂ H¹(O_{K(m)}[1/p], ℤ_p(1))` form an Euler system for `(𝒦, ℤ_p(1), pa)` in the sense of EulerSystemsAndKolyvaginSystems §2.2. Corestriction from `K(m𝔮)` to `K(m)` multiplies by `1 − Frob_𝔮⁻¹` for `𝔮 ∤ mpa` and by 1 otherwise. For a character `χ` of conductor `f_χ` prime to `a`, with values in a number field `E`, `O_p = O_E ⊗ ℤ_p` and canonical generator `t_p(χ)`, define the twisted classes `a ζ_m(χ) = tr_{K(f_χ m)/K(m)}(a ζ_{f_χ m} ⊗ t_p(χ))`. Prove that they form an Euler system for `(𝒦, O_p(χ)(1), p f_χ a)` with limit `a ζ(χ) ∈ H¹(O_K[1/p], Λ(χ)(1))`, `Λ = O_p[[Gal(K_∞/K)]]` (Johnson-Leung–Kings, §§3.1–3.4, Definition 3.1, Corollary 3.4, Definition 3.5, Proposition 3.6 and Lemma 3.7, pp. 13–16, JLK line 673). *Needs:* §§2.4, 1.1; EulerSystemsAndKolyvaginSystems §§2.2, 2.5, 8.1.

- For `K ⊂ F ⊂ L ⊂ 𝒦` with `G = Gal(L/F)`, the image of `ζ_L` under the integral character map `O_p[G] → O_p(χ)` is `ζ_F(χ)`. The map is the idempotent projection only when `#G` is invertible.
- For a continuous `ρ : Γ → O_p^×`, the twisting isomorphism `Λ ≅ Λ(ρ)` sends `a ζ(χ)` to `a ζ(χρ)` (Johnson-Leung–Kings, Lemma 6.1).
- The trivial twist is the untwisted system, and twisting by `ρ₁` then `ρ₂` is twisting by `ρ₁ρ₂`.

**Checks.**

- For `χ = 1` the twisted classes are `a ζ_m`.
- At `𝔮 ∤ pma` the corestriction factor is `1 − Frob_𝔮⁻¹`; with arithmetic Frobenius and inverse-Artin character values `η(𝔮) = η(Frob_𝔮⁻¹)` the twisted factor is `1 − χ(𝔮)Frob_𝔮⁻¹`.
- For `#G = p` the integral character map is defined and the idempotent `(1/p)Σ_g χ(g)⁻¹g` is not integral. A definition through the idempotent excludes `p ∣ #G`.

### 4.2 The scalar Tamagawa number conjecture at s = 0

For a finite abelian extension F/K and every prime p, prove the scalar Tamagawa number conjecture for h⁰(F) at s = 0, with its rationality and integral scalar lattice: use PeriodsAndSpecialValues PS.5.2 with scalar order ℤ, and its scalar extensions to O_p. The fundamental line, compact-support comparison and leading term are those of Johnson-Leung–Kings, §2.2, (5)–(8), Theorem 2.6, pp. 9–11. This does not assert equivariant integrality over ℤ[Gal(F/K)]. The proof uses the analytic class number formula, including the root-of-unity denominator at p = 2 (Huber–Kings, Proposition 2.3.1, p. 18, for odd p; Johnson-Leung–Kings, Theorem 2.6, for every p). *Needs:* PeriodsAndSpecialValues PS.5.2; ArithmeticGaloisDuality §D7.5; PadicMeasuresIwasawaAlgebras §5.1; Mathlib `NumberField.Units.regulator`, `NumberField.IsTotallyComplex`.

For abelian L ⊃ F ⊃ K, let z_B(η) be the zeta element characterized by the Beilinson regulator r_B(z_B(η)) = L′(η, 0) in its character line; the rational direct sum and the tensor over η ∈ Ĝ_L ∖ Ĝ_F are the objects supplied by the scalar theorem, rather than independent integral statements for each character. Put z_B,p(η) = ∏_(𝔭∣p)(1 − η(𝔭)) z_B(η), where η(𝔭) = 0 at a ramified prime. If every removed Euler factor is nonzero, identify the tensor of its p-adic regulator lattices with ⊗_η Det⁻¹ RΓ(O_K[1/p], O_p(η⁻¹)(1)). The shift convention is Det(C[1]) = Det⁻¹(C), with exactly one inversion (Johnson-Leung–Kings, Proposition 2.9 and Corollary 2.11, pp. 11–13). When an Euler factor vanishes, retain the full local cohomology determinant and leading-term trivialization; a zero vector cannot generate the invertible line. Ramification at every prime above p is a sufficient nonvanishing condition for the vector formula used in §4.3. *Needs:* §1.1; the scalar theorem above; ArithmeticGaloisDuality §D7.5; PadicMeasuresIwasawaAlgebras §5.1.

- The zeta element is fixed by r_B and the specified character basis, so rescaling the basis transports the element and its lattice together.
- Euler removal is multiplicative over the primes above p and is 1 at a ramified prime.
- Tensoring character lines commutes with scalar extension; it does not give separate integral projectors when p divides the group order.

**Checks.**

- For K = ℚ(i), ζ_K(0) = −1/4; its dyadic valuation is −2 and it is a unit at odd primes. The root denominator cannot be dropped.
- A determinant lattice of valuation 1 has shifted determinant of valuation −1; inverting the shifted determinant would incorrectly restore +1.
- Over ℤ₇[C₃] ≅ ℤ₇³ the tuple (1, 7, 1/7) has scalar determinant 1 but character valuations (0, 1, −1). Scalar integrality cannot be promoted to integral equivariant ETNC.
- For K = ℚ(i), L = K(3) = K(√3), p = 13, the quadratic η has η(𝔭) = 1 at both primes above 13, since 4² = 3 modulo 13. Thus z_B,13(η) = 0 while the determinant line has rank one; the vector formula is inapplicable. At p = 3, η is ramified and both omitted local factors are 1.

### 4.3 The regulator normalization of the elliptic zeta elements

Let η have sufficiently large level to be ramified at every prime above p, and let a ≠ O_K be prime to 6pf_η. Denote by e_D(η⁻¹) the trace of the inverse theta value of §2.4 tensored with t_p(η⁻¹). Prove that e_D(η⁻¹) lies in H¹_f and

    e_D(η⁻¹) = (N(a) − η(a)) z_B,p(η)/2.

Here η(a) uses the inverse-Artin ideal convention of §4.1. This is the comparison of Kronecker's formula with the ordinary Beilinson regulator; the factor 1/2 is forced by r_D = 2r_B. Define e_B(η⁻¹) = 2e_D(η⁻¹) and, at every finite level and in the tower, aζ_B(χ) = 2aζ(χ). These are norm-compatible integral Euler-system classes. For n large, the tensor over characters of exact level n of (N(a) − η(a))⁻¹e_B(η⁻¹)O_p equals the tensor of Det⁻¹ RΓ(O_K[1/p], O_p(η⁻¹)(1)). Equivalently the tensor formed with e_D equals 2^(−m) times that lattice for m character factors (Johnson-Leung–Kings, (6), Definition 3.8, Theorem 3.9 and Corollary 3.10, pp. 9, 17–19, with the squared-norm convention of Kato (15.5.1) transported explicitly). The nonzero scalar N(a) − η(a) is invertible over the coefficient field because N(a) > 1 and η(a) is a root of unity. *Needs:* §§2.5, 4.1–4.2; Mathlib `NumberField.Units.logEmbedding_eq_zero_iff`.

- Both e_D and e_B are non-torsion and lie on the same rational character line.
- Changing from r_B to r_D changes the corresponding zeta generator to z_D = z_B/2, and changes its integral determinant lattice by the same factor; no dyadic unit is assumed.
- The tensor identity is transported over the whole rational direct sum of the characters; it does not require individual integral idempotents at a wild character.

**Checks.**

- For K = ℚ(i), p = 3, η quadratic of conductor (3), a = (5), put R = log(2 + √3). Then r_B(e_D) = 4R and L′(η, 0) = R/3: (25 − 1)R/(2·3) = 4R. Omitting 1/2 gives 8R.
- The doubled class has r_B(e_B) = 8R = 24R/3, exactly the z_B normalization.
- In a dyadic rank-one lattice, multiplying a generator by 2 increases its valuation by 1. For m character factors the tensor changes by 2^m, while at odd p this scalar is a unit.

### 4.4 Rubin's Euler-system bound for elliptic units

Let `η` have level large enough that `O_p(η)` is ramified at every place above `p`, `Λ_O = O_p[[Γ]]`, `Γ ≅ ℤ_p²`. Prove the following (Johnson-Leung–Kings, Definition 6.3, Theorem 6.4 and Corollary 6.5, pp. 30–31, JLK lines 1257 and 1302; Lemma 4.6, p. 22):

1. `H²(O_K[1/p], Λ(η)(1))` is `Λ_O`-torsion.
2. `H¹(O_K[1/p], Λ(η)(1))` has rank one.
3. `H¹/Λ_O·a ζ_B(η)` is torsion, where aζ_B = 2aζ is §4.3's Beilinson-normalized system.
4. At every height-one prime `𝔮` of `Λ_O`, `length H²_𝔮 ≤ length (H¹/Λ_O·a ζ_B(η))_𝔮`.

Here the integral bound uses the B-normalized system of §4.3 throughout. The bound holds for `H²_0`, the kernel of localization to `⊕_{v∣p} H²(K_v, Λ(η)(1))`, and then for `H²`, because those local terms are finitely generated `O_p`-modules, hence pseudo-null. By twisting, the inequality holds for every `χ` at height-one primes; this is Rubin's inequality, Kato's Theorem 15.2(1) at regular primes; the unscaled integral version under Rubin's condition (b) is retained in §7.9. The route checks Rubin's hypotheses for the `ℤ_p²`-extension (no finite prime splits completely; rank-one coefficients; `τ = 1`). Weak Leopoldt from the non-torsion class of §4.3 gives (1), Tate's Euler characteristic gives (2), and Rubin's divisibility with the pseudo-isomorphism `H¹ → Λ_O ⊕ (torsion)` gives (4). *Needs:* §§4.1, 4.3, 1.1; EulerSystemsAndKolyvaginSystems §§8.1, 8.2, 8.6, 8.7, 8.14, 8.25, 8.37; ArithmeticGaloisDuality §R02.4.4; PadicMeasuresIwasawaAlgebras §4.1.

**Checks.**

- The inequality is integral for the B-normalized system at every p including 2; the factor 2 between B and D is retained rather than treated as a unit.
- For `η` of small level, unramified at a prime above `p`, the local `H⁰` can be nonzero and the large-level hypothesis fails. The general case comes from twisting, not from this statement directly.

### 4.5 The integral character-wise main conjecture at every prime

Let p be any prime, χ : G(f_χ) → E× a finite-order character, Γ = Gal(K_∞/K) ≅ ℤ_p² and Λ_O = O_p[[Γ]]. Project the ray group to Γ using the chosen complement and write [σ_a|Γ] for its group-ring element. Define the twisted smoothing factor

    s_a(χ) = N(a) − χ(σ_a)⁻¹[σ_a|Γ].

Let J_χ be the ideal generated by these factors for a prime to 6pf_χ, equivalently the image of the ray-tower auxiliary ideal under the twisted character projection. Define ζ_D(χ) = s_a(χ)⁻¹aζ(χ), independent of a, and ζ_B(χ) = 2ζ_D(χ). The integral submodule J_χζ_B(χ) is generated by all aζ_B(χ), not by an arbitrarily chosen single smoothed class. These definitions use the inverse semilinearity of §1.1 and the regulator convention of §4.3; an untwisted denominator does not descend correctly (Johnson-Leung–Kings, §5.1, equation (17), pp. 23–24, with both normalizations transported).

Prove the character-wise main conjecture: H⁰ = 0; H¹ has rank one; H² and H¹/J_χζ_B(χ) are torsion; and the inclusion of J_χζ_B(χ) into RΓ(O_K[1/p], Λ(χ)(1))[1] has divisor zero. Thus

    length (H¹/J_χζ_B(χ))_q = length H²_q

at every height-one q, including q containing p, and the associated determinant lattices agree (Johnson-Leung–Kings, Theorem 5.2 and §6, pp. 24, 29–33, in the Beilinson normalization of §4.3). In the inverse-unit normalization the corresponding quotient is H¹/(2J_χζ_D(χ)); multiplication by 2 is retained at p = 2. No condition p ∤ 6 or p ∤ [K(f_χ):K] is imposed. A route twists to large-level characters, applies the Euler-system bound of §4.4 to aζ_B and the determinant comparison at augmentation of §4.3, and uses effectivity to conclude that the divisor is zero. In that calculation Det(J_χζ_B) = s_a(χ)⁻¹Det(Λ_O aζ_B); both the twisted factor and the factor 2 occur before taking augmentation. *Needs:* §§4.1–4.4, 2.6; PadicMeasuresIwasawaAlgebras §§4.6, 5.1; SelmerIwasawaCohomology §3.7.

- Twisting χ by ρ transports J_χ and ζ_B(χ) by the same semilinear map.
- The quotient by J_χ has support in codimension at least two; it is the character projection of the cyclotomic auxiliary ideal, not an unproved identification with the untwisted kernel.
- After inverting p, the B- and D-normalized modules have the same characteristic ideal, since 2 is invertible there at every prime p.

**Checks.**

- For K = ℚ(i), p = 3, χ quadratic modulo (3), a = (2 + i), b = (7), the augmented factors are 5 − (−1) = 6 and 49 − 1 = 48. The normalized values are 6u/6 = 48u/48 = u. Untwisted factors give 6u/4 = 3u/2 and 48u/48 = u.
- At χ = 1, J_χ is the cyclotomic auxiliary ideal, of height two; it is not principal, although every height-one localization is the unit ideal.
- For K = ℚ(i), p = 2, χ = 1, both normalizations yield the same rational equality, but the integral modules J_χζ_B and J_χζ_D differ by 2. The theorem uses the former and does not silently cancel that dyadic factor.
- Rubin's hypothesis p ∤ #μ(H) excludes p = 2 for ℚ(i), and p = 2, 3 for ℚ(√−3); the normalized character-wise statement includes these primes.

### 4.6 The character-wise equality with tame Euler factors

Suppose f_χ ∣ f. Define ζ_B(χ, f) = ∏_(𝔩∣f, 𝔩∤p)(1 − χ(𝔩)Frob_𝔩⁻¹)ζ_B(χ), with χ(𝔩) in the inverse-Artin convention and zero at a ramified prime. Prove that the inclusion J_χζ_B(χ, f) → RΓ(O_K[1/pf], Λ(χ)(1))[1] has divisor zero. In particular Det(H¹/J_χζ_B(χ, f)) ≅ Det H². The supported complexes contribute the inverse Euler determinant, compensated by the displayed factors (Johnson-Leung–Kings, Corollary 5.3, pp. 24–25). Use the same twisted smoothing ideal as §4.5. *Needs:* §§4.5, 1.5.

**Checks.**

- If every prime of f lies above p, the product is empty, equals 1 and this is §4.5.
- At a ramified prime χ(𝔩) = 0 and its factor is 1.
- At an unramified prime with finite Frobenius eigenvalue −1 and p = 5, the factor 1 + γ⁻¹ has augmentation 2 and contributes no divisor; finite inertia alone does not specify its support.

### 4.7 Rubin's Iwasawa modules

Fix a prime `𝔭` of `K` above `p`, an abelian extension `K₀ ⊃ H` of `K` (with `H` the Hilbert class field) with `p ∤ [K₀ : K]`, and an abelian extension `K_∞ ⊃ K₀` of `K` with `Gal(K_∞/K₀) ≅ ℤ_p` or `ℤ_p²`. Assume Rubin's standing hypothesis `p ∤ #μ(H)`. Write E′_∞ for the norm limit of p-units. Define `A_∞`, `ℰ̄_∞`, `𝒞̄_∞`, `U_∞` and `X_∞` as norm limits over finite `F ⊂ K_∞` of: the `p`-parts of class groups; the closures of the global units and of Rubin's elliptic units in the local principal units at the primes above `𝔭`; the local principal units themselves; and the Galois groups of the maximal abelian `p`-extensions unramified outside the primes above `𝔭`. They are modules over `Λ = ℤ_p[[Gal(K_∞/K)]] = ⊕_χ Λ^χ`, `Λ^χ ≅ R_χ[[Γ]]` (Rubin 1991, §1, p. 27, and §4, pp. 36–37, Rubin91 lines 500–541). *Needs:* §§1.2, 2.4; ClassFieldTheory Layers 11–13; IntegralIwasawaTheory §10.0; PadicMeasuresIwasawaAlgebras §4.6.

- Each module is the direct sum of its `χ`-components `e_χ Y` over the irreducible `ℤ_p`-representations `χ` of `Δ = Gal(K₀/K)`; the idempotents are integral since `p ∤ #Δ`.
- Class field theory gives the exact sequence `0 → ℰ̄_∞/𝒞̄_∞ → U_∞/𝒞̄_∞ → X_∞ → A_∞ → 0`, the limit of the finite-level sequences by exactness of compact inverse limits.
- `char(Y)` for a finitely generated torsion `Λ`-module is the product of the characteristic ideals of its components.
- For `p ∤ #Δ` the `χ⁻¹`-projection of `E′_∞` is `H¹(O_K[1/p], Λ(χ)(1))` (Johnson-Leung–Kings, §5.4 and Lemma 5.8, pp. 26–27).

**Checks.**

- When `p` splits in `K`, `X_∞` and `U_∞/𝒞̄_∞` are torsion, and the two equalities of §4.8(i) are equivalent through the sequence (Rubin91 lines 565–566).
- When `p` is inert in `K` and `Gal(K_∞/K₀) ≅ ℤ_p²`, `U_∞/𝒞̄_∞` is not torsion (Rubin91 lines 566–567); a torsion characteristic ideal assigned to it is not defined.
- For `Δ` trivial (`K₀ = K = H`, class number one) there is one component and `Λ ≅ ℤ_p[[Γ]]`.

### 4.8 Rubin's main conjecture and its all-prime classical form

Under Rubin's hypotheses prove (Rubin 1991, Theorem 4.1 and Remarks (1)–(2), p. 37, Rubin91 lines 545–571):

- (i) If `p` splits in `K`, then `char(A_∞) = char(ℰ̄_∞/𝒞̄_∞)` and `char(X_∞) = char(U_∞/𝒞̄_∞)`.
- (ii) If `p` is inert or ramified, then `char(A_∞)` divides `char(ℰ̄_∞/𝒞̄_∞)`, with `char(A_∞)^χ = char(ℰ̄_∞/𝒞̄_∞)^χ` for every irreducible `χ` nontrivial on the decomposition group of `𝔭` in `Δ`.

Write I_Λ for the augmentation ideal of the two-variable algebra and p_(χ⁻¹) for the integral character projector when p ∤ #Δ. The class and closed-unit norm limits are defined without the standing μ(H) restriction as well. Dropping that restriction for this clause, for the full two-variable extension and p ∤ #Δ prove also the Beilinson-normalized classical form at every prime `p`, `2` and `3` included, with no condition on the splitting of `p` or on `χ`: `char(p_{χ⁻¹}A_∞) = char(p_{χ⁻¹}E_∞/I_Λ J_χζ_B(χ))`, integrally (Johnson-Leung–Kings, §5.4, pp. 26–27). For other one-variable quotients retain the control and Tor terms of §5.1; no arbitrary-line characteristic-ideal equality follows by ordinary tensor product. For the two-variable classical form, decompose `Ω_O = ∏_χ Λ(χ)` and identify the `χ`-parts with the cohomology of §4.5. The decomposition-group modules at `p` in Lemma 5.8's sequence are pseudo-null, so `H²` and `A_∞` have the same characteristic ideal; apply §§4.5–4.6. For (i)–(ii) a proof can follow either Rubin's Kolyvagin-system argument (Rubin 1991, §§8–10) or this classical form wherever Rubin's hypotheses imply `p ∤ #Δ`. For `E/ℚ` with `End(E) = O_K`, `p ≥ 5` of good ordinary reduction and `K_∞ = K(E[p^∞])`, the equalities of (i) are the Theorem of NoncommutativeAndEquivariantIwasawa §4.3, which the route does not reprove; the statement here differs by admitting any `K` of any class number, any abelian `K₀ ⊃ H` with `p ∤ [K₀ : K]`, the inert and ramified primes of (ii), and every prime in the classical form. *Needs:* §§4.5–4.7; PadicMeasuresIwasawaAlgebras §§4.1, 4.6; NoncommutativeAndEquivariantIwasawa §4.3.

**Checks.**

- For `K = ℚ(i)`, `p = 5` (split), `f = (1)`: `Δ ≅ ℤ/4` has order prime to 5 and both forms apply on all four components.
- For `p` inert, an equality `char(X_∞^χ) = char(U_∞^χ/𝒞̄_∞^χ)` is not a statement of (ii): the modules are not torsion (§4.7). What (ii) asserts at an inert prime is the `χ`-part equality `char(A_∞)^χ = char(ℰ̄_∞/𝒞̄_∞)^χ` for `χ` nontrivial on the decomposition group of `𝔭`.
- For `K = ℚ(i)`, `p = 5`, `E : y² = x³ − x` and `K_∞ = K(E[5^∞])`, (i) is the two-variable theorem of NoncommutativeAndEquivariantIwasawa §4.3 on all sixteen χ-components of the division tower K(E[5^∞]); the conductor-one ray tower K(5^∞) has only four, because its finite quotient divides out μ₄. The same curve at `p = 3` (inert) is outside that theorem and inside (ii).

### Examples

For `K = ℚ(√−7)`, `p = 2` splits (`−7 ≡ 1 mod 8`) and `μ(H) = μ_2`, so Rubin's hypothesis excludes `p = 2`, while §4.5 and the classical form of §4.8 (with `p ∤ #Δ`) cover it.

### Dependencies

Layers 1–2; EulerSystemsAndKolyvaginSystems §§2.2, 2.5, 8.1, 8.2, 8.6, 8.7, 8.14, 8.25, 8.37; ArithmeticGaloisDuality §§R02.4.4, D7.5; PadicMeasuresIwasawaAlgebras §§4.1, 4.6, 5.1; PeriodsAndSpecialValues PS.5.2; SelmerIwasawaCohomology §3.7; ClassFieldTheory Layers 11–13; IntegralIwasawaTheory §10.0; NoncommutativeAndEquivariantIwasawa §4.3; Mathlib `NumberField.Units.regulator`, `NumberField.Units.logEmbedding_eq_zero_iff`.

## Layer 5: split primes, Coleman maps and Katz's measure

### 5.1 Coleman maps and control under one-variable specialization

Let p = 𝔭𝔭̄ split in K, and let Ô be the completed maximal unramified integer ring of ℚ_p with coefficient Frobenius φ. Let F be a one-dimensional height-one formal group over Ô with its ℤ_p-action and a chosen isomorphism θ : Ĝ_m → F. For a CM elliptic-curve specialization require good reduction at the selected split place before invoking height one; splitting alone does not supply it. Put t_n = ζ_(p^(n+1)) − 1, ξ_n = θ(t_n) and Φ_n = Frac(Ô)(ξ_n), n ≥ 0; successive degrees are p. Define the transported Frobenius and derivation by

    Φ_θ(g) = ((g ∘ θ)^φ) ∘ θ⁻¹,
    D_θ = θ′(0) D_F,       D_F = λ_F′(X)⁻¹ d/dX.

For a norm-compatible unit system u_n ∈ O_(Φ_n)× construct the unique Coleman series g_u ∈ Ô[[X]]× such that Φ_θ^(−n)(g_u)(ξ_n) = u_n. It is the cyclotomic series of ColemanPowerSeries, in multiplicative coordinates, transported with all operations through θ. Define N by (Ng)([p]_F X) = ∏_(η∈F[p])g(X ⊕_F η). Prove Ng_u = Φ_θ(g_u), and

    p Φ_θ(D_θ log g_u)([p]_F X) = ∑_(η∈F[p]) D_θ log g_u(X ⊕_F η).

These are the norm and trace formulas of Coleman, Theorem A, p. 92, Theorem 11 and Corollary 12, p. 102, in the transported coordinate; Yager, Chapter 3, (7) and (10), gives the Frobenius convention. *Needs:* ColemanPowerSeries Layer 1 and §§2.37, 2.39, 2.44; IntegralIwasawaTheory §§7.1–7.2; EllipticCurves Layer 1; §4.7.

- The assignment u ↦ g_u is multiplicative and continuous; the constant system 1 gives g_u = 1.
- For κ(σ) the Tate-module character, σ sends g_u to g_u ∘ [κ(σ)]_F. Replacing the Tate basis by [b]_Fξ changes g_u to g_u ∘ [b⁻¹]_F.
- Changing θ transports Φ_θ, D_θ and the torsion basis together. Coefficientwise Frobenius on F is not substituted for Φ_θ without descent data on F.
- On the multiplicative coordinate, let φ_F h(T) = h^φ((1 + T)^p − 1). The Amice measure μ_u of (1 − φ_F)D_θ log g_u is supported on ℤ_p×. Define the local Coleman measure as −x⁻¹μ_u. Its division by x cancels the Tate-character factor in the derivative's Galois action and makes it linear for ordinary pushforward. The factor is 1 − φ_F, not 1 − φ_F/p after taking the logarithmic derivative (IntegralIwasawaTheory §7.2; ColemanPowerSeries §§2.39, 2.44).

**Checks.**

- For u = 1, g = 1, Ng = 1 and D_θ log g = 0, hence the local map is zero.
- Take p = 5, c³ = 1, c ≠ 1, φ(c) = c², θ(T) = cT and F(X,Y) = X + Y + XY/c. Then g = 1 + X/c has Ng = Φ_θ(g) = g and D_θ log g = 1. The trace identity reads 5 = 5. Coefficientwise φ would give g^φ = 1 + cX and the incorrect derivative equation 5c = 5c².
- For a Teichmüller constant c in Ô, u_n = c^(φ^(−n)) has norm c^(pφ^(−n−1)) = c^(φ^(−n)); its Coleman series is c. The coefficient twist is needed even though the coordinate example above has Φ_θ(g) = g.
- In multiplicative coordinates at p = 5, take g(T) = (2 + T)/ω(2). The boundary measure has mass 0 and first moment −1; the integrated measure −x⁻¹μ has first moment 0 and second moment 1. Under the action of a = 2 its second moment is 4. The unintegrated derivative carries an extra factor 2 and is not linear for ordinary pushforward.
- For E : y² = x³ − 25x at p = 5, v₅(c₄) = 2 and v₅(Δ) = 6. The special fibre is cuspidal, its formal group has infinite height and no θ exists. For y² = x³ − x, Δ = 64 and a₅ = −2, so the height is 1. At inert p the good-reduction formal group has ℤ_p-height 2 and its separate interpolation is AnticyclotomicLocalUnits §1.1.

Now take Rubin's full two-variable extension K_∞/K₀ with Gal(K_∞/K₀) ≅ ℤ_p², under §4.7's hypotheses, and a CM curve with good reduction at the selected places. Assemble the local measures by the unramified direction to construct Col : U_∞ ⊗ Ô → A = Ô[[Gal(K_∞/K)]]. All scalar extensions to Ô use completed tensor product. On each χ-component prove injectivity and determine its exact image J_loc,χ as the annihilator ideal of the Tate-module character on the local roots of unity, with the inverse-Artin action transported to A. Prove A/J_loc,χ is pseudo-null in two variables. On nonexceptional components this ideal is A; on an exceptional component its coordinate form is the kernel of the evaluation at the local Tate character. This is the general-field extension of NoncommutativeAndEquivariantIwasawa §4.3, which supplies the rational CM-curve case at p ≥ 5. Sources: Yager, Chapters 3–8 and Theorem 1; Rubin91, Remark (1) after Theorem 4.1, p. 37. *Needs:* local construction above; §4.7; PadicMeasuresIwasawaAlgebras Layers 1, 4; NoncommutativeAndEquivariantIwasawa §4.3.

- Col is A-linear for the ordinary action on measures.
- With C_loc,χ = A/J_loc,χ, the exact sequence is 0 → U_∞^χ ⊗ Ô → A^χ → C_loc,χ → 0; a proper image ideal is retained even when its quotient has zero characteristic divisor.
- A norm map to a one-variable subextension commutes with the Coleman construction, with the kernel and cokernel described by the control theorem below.

**Checks.**

- The identity unit system maps to zero.
- For A = Ô[[S,T]] and J_loc = (S − a,T − b), A/J_loc ≅ Ô has codimension two, so its characteristic ideal is 1, although J_loc ≠ A.
- At an inert prime the full local-unit module has rank 2; an injective linear map from it to the rank-one A cannot exist. The split hypothesis is essential.

For every one-variable quotient B = A/(a), where a generates the kernel of a surjection of the two-variable pro-p group onto ℤ_p, construct the control maps α_Y : Y/aY → Y′ for Y = U_∞, ℰ̄_∞, 𝒞̄_∞, X_∞, A_∞ and their exact-sequence quotients. Here Y′ is the actual norm-limit module of the smaller tower, not a definition by ordinary tensor product. Define K_Y = ker α_Y and D_Y = coker α_Y. Prove the control exact sequences by derived descent of local and global Iwasawa cohomology, Kummer and the local valuation sequence; identify the kernels and cokernels by local H⁰, H² and the corresponding norm-limit root groups. Retain their full character components. At the algebraic Coleman sequence, prove explicitly

    0 → Tor₁^A(C_loc, B) → U_∞ ⊗_A B → B → C_loc ⊗_A B → 0.

For a finitely generated torsion A-module Y with Y/aY and Y[a] torsion over B, prove the divisor specialization formula div_B(Y/aY) − div_B(Y[a]) = specialization of div_A(Y), via its perfect resolution. If K_Y and D_Y are torsion, combine it with div_B(Y′) = div_B(Y/aY) + div_B(D_Y) − div_B(K_Y). If ranks appear, retain the entire determinant complex and its cohomological ranks instead of assigning a torsion characteristic ideal. This control theorem is part of the roadmap for every one-variable quotient; vanishing of its error modules is a separate conclusion that needs the corresponding local hypotheses. Sources and route: SelmerIwasawaCohomology §3.3, its local/global derived descent; IntegralIwasawaTheory §10.0; Johnson-Leung–Kings, Lemma 5.8, pp. 27–28; PadicMeasuresIwasawaAlgebras §5.1 for determinant base change. *Needs:* §§1.1–1.5, 4.7; these supplier sections; the two-variable map above.

- The maps α_Y commute with quotient maps and the five-term class-field sequence of §4.7.
- Norm-compatible roots are retained in the kernel of a map to a torsion-free one-variable algebra; torsion here means Iwasawa-algebra torsion, not p-power torsion.
- For two successive quotients the comparison is derived tensor-product associativity, including Tor; ordinary tensor product alone supplies no exact control theorem.

**Checks.**

- At p = 5 in K = ℚ(i), K₀ = K(μ₅), K′_∞ = K(μ_(5^∞)), the principal local units contain (ζ_(5^(n+1)))_n ≠ 0. Norm ζ₂₅ = ζ₂₅^55 = ζ₅, and σ − κ(σ) kills this system, so every linear map into torsion-free B kills it. No power of 5 kills the whole system.
- Specializing C_loc = A/(S − a,T − b) by T = b gives C_loc ⊗ B = B/(S − a) and Tor₁^A(C_loc,B) = B/(S − a). Each has length 1 at S − a; the two-variable pseudo-null error does not disappear.
- For Y = A/(S), specialization T = 0 gives Y/aY = B/(S), Y[a] = 0, of divisor (S). Specialization S = 0 instead produces the rank-one B, so the torsion divisor formula is inapplicable and the determinant with its rank is required.

### 5.2 Elliptic units and the exact Katz image

On the full two-variable tower of §5.1, prove that the image of the closed inverse elliptic-unit module is J_aux,χ·ν_𝔭^χ on each χ-component. Here ν_𝔭 is Katz's measure of AutomorphicPadicLFunctionsPartII §8.5, with its period and conductor Euler factors fixed, and J_aux,χ is generated by the auxiliary factors N(a) − σ_a transported through the chosen local character. The sign in Col(a z) = (N(a) − σ_a)ν_𝔭 is the inverse-unit convention; a generator differing by a unit gives the same ideal. The exact image need not be principal. Its divisorial hull is (ν_𝔭^χ), since the auxiliary ideal becomes the unit ideal at height one. Consequently char(U_∞^χ/𝒞̄_∞^χ)·Λ_Ô^χ = (L_𝔭^χ), including the image-ideal correction C_loc of §5.1 before passing to characteristic ideals. Sources: Yager, Theorem 1 (class number one, p ≥ 5, good reduction); Rubin91, Remark (1) after Theorem 4.1, p. 37, for the general-field measure identification; NoncommutativeAndEquivariantIwasawa §4.3 for its exact image and rational-curve specialization.

A route evaluates the local Coleman measure on the theta system through §3.3 and compares its moments with Katz interpolation on a dense family. It identifies each smoothed value, then the entire generated ideal. For an arbitrary one-variable quotient, specialize this exact image and use every Tor, K_Y and D_Y term of §5.1; the assertion is the resulting corrected divisor identity, not an unrestricted equality of the actual one-variable image with a principal Katz ideal. *Needs:* §§5.1, 3.3, 2.6; AutomorphicPadicLFunctionsPartII §8.5; NoncommutativeAndEquivariantIwasawa §4.3.

**Checks.**

- For K = ℚ(i), p = 5, E : y² = x³ − x, point counts over x = 0,1,2,3,4 give 1+1+2+2+1 affine points and ∞, so a₅ = −2 and ψ(𝔭) = −1 + 2i at 𝔭 = (2+i). Its idelic type is (−1,0), whereas its ideal-valued type is (1,0). At ψ⁻¹ the two supplier interpolation formulas have Euler product ((6−2i)/5)² = (32−24i)/25 and value L(ψ⁻¹,0) = L(ψ̄,1); exchanging the ordinary place conjugates the product to (32+24i)/25. The factorial is 0! = 1. Keep the suppliers' periods, sign +1 and factor i in comparing generators.
- For J = (S − a,T − b) and nonzero ν, Jν ≠ Aν but (Jν)^(**) = Aν. A single nonzero auxiliary factor in J can have a height-one divisor; the whole ideal J becomes the unit ideal there.
- At an inert prime U_∞/𝒞̄_∞ has positive rank, and the ordinary Katz measure does not exist. This ideal statement requires the split type.
- Under T = b the exceptional image ideal becomes (S − a), and its correction has length 1. Passing to the principal hull before specialization loses that factor.

### 5.3 The Katz main conjecture and its specialization formula

For the full two-variable extension under Rubin's split-prime hypotheses, prove char(X_∞^χ) = (L_𝔭^χ) for every χ. This follows from §4.8(i) and §5.2 (Rubin91, Theorem 4.1(i) and Remark (1), p. 37). For a rational CM curve at p ≥ 5 ordinary this is the theorem and measure comparison of NoncommutativeAndEquivariantIwasawa §4.3. The statement here admits any imaginary quadratic field and Rubin's K₀. *Needs:* §§4.8, 5.1–5.2; NoncommutativeAndEquivariantIwasawa §4.3.

For every one-variable quotient B = A/(a) with nonzero specialized L′_𝔭, prove

    div_B(X′_∞) = div_B(B/(L′_𝔭)) + div_B(X_∞[a])
                  + div_B(D_X) − div_B(K_X).

The terms are those of §5.1's actual control map on the χ-component. Prove the analogous formula for U′_∞/𝒞̄′_∞, keeping the unit and elliptic-unit control kernels and cokernels. When L′_𝔭 = 0, give the determinant version with the cohomological ranks instead. On the particular one-variable extension unramified outside 𝔭, prove the vanishing or cancellation of these terms required for Rubin's principal-ideal formula (Rubin91, Remark (1), p. 37); do not infer that cancellation for an arbitrary line. *Needs:* §§5.1–5.2, 4.7–4.8; PadicMeasuresIwasawaAlgebras §5.1; SelmerIwasawaCohomology §3.3.

**Checks.**

- For the conductor-one tower over ℚ(i) at p = 5 there are four finite-character components. Its full two-variable equality includes all four.
- X_∞ is ramified only at 𝔭. Allowing both primes above p gives a rank-one module in two variables, so no torsion characteristic ideal of that larger module enters this formula.
- If K_X = D_X = X_∞[a] = 0, the corrected formula gives div(X′) = div(L′_𝔭). A surviving B/(S−a) error contributes +1 or −1 according to its position, rather than 0.

### 5.4 Anticyclotomic `θ`-components

Let `p > 2` split in `K` as `v v̄`, `K_∞` the anticyclotomic `ℤ_p`-extension and `Λ = ℤ_p[[Gal(K_∞/K)]]` (scalars extended as needed). Let `θ : G_K → 𝔽_p^×` have conductor divisible only by primes split in `K`, Teichmüller-lifted, with `θ|_{G_v̄} ≠ 1, ω`. Let `K_θ` be its fixed field, `Δ_θ = Gal(K_θ/K)`, `M_θ = ℤ_p(θ) ⊗ Λ^∨`, and `𝔛_∞ = Gal(M_∞/K_∞K_θ)` for `M_∞` the maximal abelian pro-`p` extension unramified outside `v`. Prove that the Greenberg Selmer group `H¹_{F_Gr}(K, M_θ)` is `Hom_cts(𝔛_∞^θ, ℚ_p/ℤ_p)`. Its local conditions are: unramified away from `p`, relaxed at `v`, strict at `v̄`. For any class number h_K, prove that `char_Λ(𝔛_∞^θ) = (L_θ)`, the `θ`-branch anticyclotomic projection of Katz's measure. In particular `𝔛_∞^θ` is torsion and `λ(𝔛_∞^θ) = λ(L_θ)` (Castella–Grossi–Lee–Skinner, Definition 1.2.1, Theorem 1.2.2 with proof and Remark 1.2.3, pp. 7–8, CGLS lines 380–420). For a branch tamely ramified at `p`, `L_θ` is the projection of Katz's measure on the ray tower of conductor `𝔠p^∞` along the branch character, keeping the `Δ_θ`-invariants in the comparison.

The route has three steps.

1. Restriction to `K_θ` is an isomorphism onto `Δ_θ`-invariants since `p ∤ #Δ_θ`. Shapiro identifies these with the dual of the `θ`-part of the `Σ`-ramified Galois group, and the Greenberg conditions cut out the quotient ramified only at `v`. This step uses the hypothesis `θ|_{G_v̄} ≠ 1, ω` through the local cofreeness and the away-`p` Euler factors of SelmerIwasawaCohomology §3.17.
2. Prove the integral comparison with the θ-branch Katz ideal, including the anticyclotomic control and Tor terms of §5.1 (CGLS, proof of Theorem 1.2.2, pp. 7–8). If p ∤ h_K, §5.3 applies over K₀ = K_θ·H, since #Δ_θ ∣ p−1. For general h_K, use §4.5 for the characters of the p-primary Hilbert class extension as well, retaining their integral character maps and the finite-class-group descent terms. Prove that the net divisor of these terms and the local control terms is zero on the θ-component under θ|_(G_v̄) ≠ 1, ω; the local vanishing is SelmerIwasawaCohomology §3.17 and the global comparison uses the class-field sequence of §4.7. This cancellation, with its finite-class-group terms, is a target here; neither ordinary tensor product nor a prime-to-p idempotent establishes it. The resulting specialized measure is L_θ.
3. `λ`-invariants of generators of the same principal ideal agree.

*Needs:* §§5.1–5.3, 4.8; SelmerIwasawaCohomology §§2.8, 3.17; AutomorphicPadicLFunctionsPartII §8.5.

**Checks.**

- `p > 2` split gives `p ∤ #O_K^×`, since `3` ramifies in `ℚ(√−3)` and `2` does not split in `ℚ(i)`.
- The excluded characters `θ|_{G_v̄} = 1` and `= ω` are those where the local `H⁰` at `v̄`, or its dual, is nonzero (SelmerIwasawaCohomology §3.17). There the strict condition at `v̄` differs from the unramified one by a nonzero local term, and step 1 does not identify the Selmer group with `𝔛_∞^θ`.
- The λ-equality is a consequence of the ideal equality, not conversely. For `Λ = ℤ_p[[T]]` the elements `T` and `p·T` have the same λ-invariant but generate different ideals.

### 5.5 The functional equation of Katz's measure and the λ-identity

With p split, 𝔠 prime to p and the conductor and ordinary type fixed as in Kriz, Theorem 27, for the Katz `p`-adic L-function `L_p(χ, 0)` on `Gal(K(𝔠p^∞)/K)` of Kriz's normalization, prove the functional equation `W((χ)_∞, √D_K)·L_p(χ̌, 0) = L_p(χ, 0)`. Here `χ̌(a) = χ⁻¹(a)N(a)` and `W` is the product of the local Gauss sums at the primes of the conductor (Kriz, Theorem 27, p. 22, Kriz lines 1034–1064). Deduce that in the setting of §5.4, if `θ` and `θ⁻¹ω` both satisfy its hypotheses (or the tamely ramified branch convention is used for the one ramified at `p`), then `λ(L_θ) = λ(L_{θ⁻¹ω})`. In particular `λ(L_ψ) = λ(L_φ)` for `ψ = φ⁻¹ω` (Castella–Grossi–Lee–Skinner, proof of Theorem 2.2.3, (2.11), p. 15, CGLS line 836). The route restricts the functional equation to the anticyclotomic line. There `χ ↦ χ̌` exchanges the branches `θ` and `θ⁻¹ω` and inverts the anticyclotomic variable. The involution `γ ↦ γ⁻¹` preserves λ, and the factor `W` restricted to the line is a unit of `Λ_Ô`, hence of λ-invariant zero. At the primes of the tame conductor, all prime to `p`, the local Gauss sums vary with the anticyclotomic character through group elements of `Λ` times Gauss sums of absolute value a power of the residue norm, which are `p`-adic units. *Needs:* §5.4; AutomorphicPadicLFunctionsPartII §8.5.

**Checks.**

- `χ ↦ χ̌` is an involution: `(χ̌)ˇ(a) = (χ⁻¹N)⁻¹(a)N(a) = χ(a)`.
- On the anticyclotomic line, a character `χ = θ·η` with `η` anticyclotomic satisfies `η ∘ c = η⁻¹`, so `χ̌` has anticyclotomic part `η⁻¹`. This is the inversion of the variable.
- Only λ is asserted, and the involution preserves it. `ι(T) = (1 + T)⁻¹ − 1 = −T·(1 + T)⁻¹` is `T` times a unit, so for a distinguished polynomial P of degree d its reduction after substitution is (−1)^d T^d(1 + T)^(−d). Its first unit coefficient still has index d. Thus `λ(ι(T)) = λ(T) = 1`.

### Examples

For `K = ℚ(√−2)` and `p = 3` (split, since `−2 ≡ 1 mod 3`), the branch `θ = 1` is excluded by `θ|_{G_v̄} ≠ 1`, and `θ = ω` is excluded too, so §5.4 applies only to characters of nontrivial conductor at split primes or nontrivial restriction at `v̄`.

### Dependencies

Layer 4; Layer 3 (§3.3); Layer 2 (§§2.2, 2.6); IntegralIwasawaTheory §7.1; ColemanPowerSeries Layer 1; PadicMeasuresIwasawaAlgebras Layer 1 and §4.1; AutomorphicPadicLFunctionsPartII §8.5; NoncommutativeAndEquivariantIwasawa §4.3; SelmerIwasawaCohomology §§2.8, 3.17; EllipticCurves Layer 1.

## Layer 6: the rational equivariant main conjecture

### 6.1 Equality at regular height-one primes

For every prime `p` and nonzero `f`, prove that at every height-one prime `q` of `R` with `p ∉ q`:

```text
length_{R_q} (h¹/z)_q = length_{R_q} (H²_{pf})_q = length_{R_q} h²_q + Σ_{𝔩 ∣ f, 𝔩 ∤ p} length_{R_q} ℤ_p[[G/D_𝔩]]_q.
```

In particular `length h²_q = length (h¹/z)_q` whenever `q` lies on a component on which the inertia group of every such `𝔩` acts nontrivially (Johnson-Leung–Kings, §§7.1–7.2, Lemmas 7.1, 7.2, 7.6, 7.7 and the argument after Lemma 7.7, pp. 34–36, JLK lines 1412–1487; Burungale–Tian, proof of Theorem 2.1, p. 4, BT lines 155–157). The route extends scalars to `O` containing the values of the characters of `Δ`. At regular `q`, `(R_O)_q` is the localization of one factor `O[[Γ]](χ)` (§0.2), and the projection of `a ζ(f)` to that factor is `∏(1 − χ(𝔩)Frob_𝔩⁻¹)·a ζ(χ)` (Lemma 7.7). On that factor J_χ is the projected auxiliary ideal; its height-one localization is the whole ring. Since 2 is a unit at q ∌ p, §4.6 in the B normalization gives the first equality for the D-normalized inverse units as well via §§1.3 and 2.6. §§1.4–1.5 give the second. *Needs:* §§4.5, 4.6, 1.3–1.5, 2.6, 0.2.

### 6.2 The rational equivariant main conjecture

For every prime `p` and nonzero `f`, prove the equality of ideals of `R[1/p] = ℤ_p[[G_{p∞f}]] ⊗ ℚ`:

```text
ξ((h¹/z)_ℚ) = ξ(h²_ℚ) · ∏_{𝔩 ∣ f, 𝔩 ∤ p} ξ(ℤ_p[[G/D_𝔩]]_ℚ),     equivalently     ξ((h¹/z)_ℚ) = ξ((H²_{pf})_ℚ).
```

This corrects Burungale–Tian, Theorem 2.1 (BT lines 152–153), which prints `ξ(h²_ℚ) = ξ((h¹/z)_ℚ)`. Kato's quotation of Rubin (Kato, Theorem 15.2(2) and 15.6, pp. 251 and 255) has the same imprecision. The printed form holds in the ranges of §6.3. The modules are torsion by §§1.6 and 2.7, so both sides are defined. After inverting `p` every height-one prime is regular, and §6.1 gives the lengths. *Needs:* §§6.1, 1.6, 2.7, 1.5, 0.2.

### 6.3 Where the printed form holds

Prove the following (Burungale–Tian, Theorem 2.1; Johnson-Leung–Kings, Lemma 4.3 and Corollary 5.3):

- (a) If every prime factor of `f` lies above `p`, then `ξ(h²_ℚ) = ξ((h¹/z)_ℚ)`.
- (b) For any `f`, at a height-one prime of `R[1/p]` on the `χ`-component of a character `χ` of `Δ` ramified at every `𝔩 ∣ f` with `𝔩 ∤ p`, `length h²_q = length (h¹/z)_q`.
- (c) On the trivial finite-character component, a prime 𝔩 ∣ f, 𝔩 ∤ p contributes the nonunit factor 1 − γ_𝔩⁻¹. On a general inertia-trivial χ-component its factor is 1 − χ(δ_𝔩)⁻¹γ_𝔩⁻¹, where Frob_𝔩 = δ_𝔩γ_𝔩 under the chosen splitting. It can be a unit; all such factors are retained in §6.2.

Parts (a) and (b) are immediate from §6.2. For (c), the pro-p part γ_𝔩 has infinite order. On the trivial component 1 − γ_𝔩⁻¹ has augmentation zero; if χ(δ_𝔩) − 1 is a unit of O, the Euler factor is a unit instead. After inverting p the exact divisor is still read from the displayed factor, rather than from inertia alone. *Needs:* §§6.2, 1.5.

**Checks.**

- (a) applies to `K = ℚ(i)`, `p = 2`, `f = (1 + i)^3`.
- (c) applies to `K = ℚ(i)`, `p = 5`, `f = (3)`. On the trivial component the printed equality fails by the factor `1 − Frob_{(3)}⁻¹`.
- On the `ψ`-components used in Layer 8, where `f` is the conductor of `ψ`, every `𝔩 ∣ f` is ramified for `ψ`, and (b) gives the printed equality there.

### Examples

For `K = ℚ(√−3)`, `p = 3`, `f = (3)`, every prime of `f` lies above `p`, so (a) gives the printed form. For `p = 2` and `f = (3)`, `(3) = (√−3)²` is a prime power not above 2, and (c) applies on the components where its inertia acts trivially.

### Dependencies

Layers 0–2 and 4.

## Layer 7: CM newforms, induction and descent

### 7.1 The weight dictionary for the supplied CM predicate

Let f be a normalized newform of weight k ≥ 2 and level N on `HeckeRing.GL2.Newform`. Use the CM predicate and inducing character of AutomorphicGaloisRepresentations §3.15, and the newform and self-twist theory of ModularForms Layers 5, 7 and 9. Fix a Hecke character ψ of the imaginary quadratic K of idelic type (1−k,0) with L(f,s) = L(ψ,s). For the unitary adelization π_unit put α_unit = ψ|·|^((k−1)/2). Translate to the supplier's cohomological normalization by

    α_AGR = ψ|·|^(1/2),
    π_AGR = π_unit ⊗ |det|^(−(k−2)/2),
    w = k−2,              α′_AGR = α_AGR|·|^(−1/2) = ψ.

Choose the conjugate infinity type in that supplier's formula. After the half-norm factor is removed it gives z^(1−k); its parity condition k ≡ w modulo 2 is automatic. This dictionary, rather than α_unit at every weight, is the input to the supplied induction. The resulting CM newform has level N = |d_K|N(f_ψ) and Hecke field contained in K(ψ(K̂×)); its quadratic self-twist is the one of K (Kato, §15.10, p. 260; Burungale–Tian, §2.2.5, p. 5; the level formula is the theta-series level formula, Schütt, *CM newforms with rational coefficients*, Theorem 1.4, p. 3). These are normalization comparisons of the supplied CM objects. *Needs:* AutomorphicGaloisRepresentations §3.15; ModularForms Layers 5, 7, 9; GlobalNumberFields Layers 9–10; AnalyticNumberTheoryPartI §2.3a.

**Checks.**

- For 32.2.a.a, ψ has conductor (1+i)³ and 4·8 = 32. For 27.2.a.a the conductor (3) has norm 9 and 3·9 = 27.
- At k = 3 take ψ = ψ_E² for E : y² = x³ − x. At the prime (2+i), ψ = (−1+2i)² = −3−4i has absolute value 5. Then α_unit = ψ/5, α_AGR = ψ/√5 and α′_AGR = ψ; the final absolute value is 5. Using α_unit in the supplier would instead give absolute value √5.
- At k = 2, w = 0 and π_AGR = π_unit; the dictionary reduces to the weight-two convention.
- The form 11.2.a.a is non-CM: a CM field at level 11 would be ℚ(√−11), where 2 is inert, forcing a₂ = 0, but a₂ = −2.

### 7.2 Kato's de Rham normalization of CM induction

For f and ψ of §7.1, let L = K(ψ(K̂×)), λ ∣ p and r = k−1. Use the cohomological dual of the induction of AutomorphicGaloisRepresentations §3.15 to identify V_(L_λ)(f) with Ind_(G_K)^(G_ℚ)V_(L_λ)(ψ). Fix an L-linear isomorphism S(ψ) ≅ S(f) ⊗_F L. Prove that there is a unique G_ℚ-isomorphism of these representations inducing that fixed isomorphism on D_dR^r. This is Kato's (15.11.1)–(15.11.2), Lemma 15.11(1), pp. 260–261; the construction uses the irreducibility of the supplied induction and the de Rham comparison. It does not construct a second unnormalized induction theorem. *Needs:* §§3.1, 7.1; AutomorphicGaloisRepresentations §§1.5, 3.15, 7.3; AutomorphicGaloisRepresentationsPartII AG2.0; ComplexMultiplicationAndExplicitReciprocity §4.2; PadicHodgeRegulators §1.4.

**Checks.**

- At k = 2 the induction is the curve-induced comparison of ComplexMultiplicationAndExplicitReciprocity §4.2, with the same cohomological dual.
- An automorphism of the absolutely irreducible induction is a scalar c; its action on the nonzero de Rham line is also c. Fixing the line comparison forces c = 1; omitting it leaves L_λ× ambiguity.
- Restricted to G_K, the two characters are V(ψ) and its conjugate, with labelled degrees 0 and r at the selected embedding; for k = 3 those degrees are 0 and 2, not two equal degrees.

### 7.3 Kato's CM comparison map

For a finite place `λ` of `L` and a `Gal(ℚ̄/K)`-stable lattice `T ⊂ V_{L_λ}(ψ)` with induction `T̃`, define the `O_λ[[G_{p∞f}]]`-linear map (Kato, (15.12.1), p. 263):

```text
H¹_{p∞f}(T) → H¹(T̃)
```

It is corestriction from `K(p^n f)` to `K ⊗ ℚ(ζ_{p^n})` (a field when `K ⊄ ℚ(ζ_{p^n})`, a finite étale algebra otherwise), followed by Shapiro and (15.11.2), in the limit. *Needs:* §§1.1, 7.2, 3.1, 0.1; SelmerIwasawaCohomology §§3.1–3.2.

- The map is linear over `O_λ[[G_{p∞f}]] → O_λ[[G_∞]]`, or over `→ O_λ[[G′_∞]]` when `K ⊂ ℚ(μ_{p^∞})`.
- At each level `n` it is the finite-level corestriction followed by Shapiro.
- It is compatible with the integral and rational versions and with change of lattice.

**Checks.**

- At level `n = 0` with `K ⊄ ℚ(μ_{p^∞})`, it is corestriction from `K(f)` to `K` followed by Shapiro to `ℚ`.
- For `m ≥ n`, the projection to level `n` of the image equals the corestriction of its level-`m` value. This tests the transition maps, which a map sending zero to zero alone would not.
- A map built from the archimedean isomorphism (15.11.3) as a Galois identification is not this map for `k ≥ 3`, since that isomorphism is not known to be Galois-equivariant.

- Changing a lattice T to pT multiplies both the source generator and its image by p; the rational map is unchanged after scalar extension.

### 7.4 Twisting the tower cohomology to CM coefficients

Let `ψ` have conductor `f`, `T ⊂ V_{L_λ}(ψ)` a stable lattice and `χ_T : G_{p∞f} → O_λ^×` the character of `Gal(ℚ̄/K)` on `T(−1)`. Prove two things (Kato, 15.15 and proof of Proposition 15.17, p. 265, and proof of Lemma 15.13, p. 264; Johnson-Leung–Kings, Lemma 4.7, p. 22). First, `H^q_{p∞f}(T) ≅ (H^q_{p∞f}(ℤ_p(1)) ⊗ O_λ) ⊗ T(−1)`; with a basis `t` of `T(−1)`, `x ↦ x ⊗ t` is `Tw_{χ_T⁻¹}`-semilinear and carries `z ⊗ O_λ` to the span of `z_{p∞f} ⊗ T(−1)` at height one. Second, `H¹_{p∞f}(T)` is torsion-free of generic rank one, and `H¹_{p∞f}(V_{L_λ}(ψ))_q` is free of rank one at every height-one prime `q` lying over a height-zero prime of `O_λ[[G_∞]]`. *Needs:* §§1.1, 1.3, 1.7, 2.6, 3.1.

### 7.5 Kato's descent lemma

Assume `K ⊄ ℚ(μ_{p^∞})`. Let `f` be the conductor of `ψ`, `Δ` the torsion of `G_{p∞f}`, `𝔭` a prime of `O_λ[[G_∞]]` and `q` its inverse image in `O_λ[[G_{p∞f}]]`. If `2` and `#Δ` are invertible in the residue field of `𝔭`, prove three things (Kato, Lemma 15.13 and proof, p. 264):

1. Both localizations are regular local rings, and the kernel of `O_λ[[G_{p∞f}]]_q → O_λ[[G_∞]]_𝔭` is principal, generated by some `a`.
2. `H²_{p∞f}(T)_q/a ≅ H²(T̃)_𝔭`.
3. `0 → H¹_{p∞f}(T)_q/a → H¹(T̃)_𝔭 → H²_{p∞f}(T)_q[a] → 0` is exact.

The hypothesis on the residue field holds whenever `p ∉ 𝔭`, since that residue field has characteristic zero (Burungale–Tian, footnote 4, p. 5, BT line 228). The route uses the coefficient sequence `0 → T ⊗ O_λ[[G_{p∞f}]] →(a) T ⊗ O_λ[[G_{p∞f}]] → T ⊗ O_λ[[G_∞]] → 0`, with `σ` acting through `σ⁻¹`. Inertia at `v ∤ p` acts through `Δ`, so the cokernel of the invariants is killed by `#Δ`, and the `j_*` long exact sequence localizes. *Needs:* §§7.3, 7.4, 0.1, 1.1; SelmerIwasawaCohomology §3.3.

### 7.6 Descent when `K` lies in the cyclotomic tower

Assume `K ⊂ ℚ(μ_{p^∞})`. Prove that this happens exactly for `K = ℚ(√−p)` with `p ≡ 3 mod 4`, and for `p = 2` with `K = ℚ(i)` or `ℚ(√−2)`. With `G′_∞ = Gal(ℚ(μ_{p^∞})/K)` and `H^q(T) = lim_n H^q(ℤ[ζ_{p^n}, 1/p], T)`, prove that `H^q(T̃) ≅ H^q(T) ⊗_{O_λ[[G′_∞]]} O_λ[[G_∞]]`, and that §7.5 holds with `G′_∞` and `H^q(T)` in place of `G_∞` and `H^q(T̃)` (Kato, 15.14, p. 264, and the last sentences of 15.15 and of the proof of Proposition 15.17, p. 265). The classification: the quadratic subfields of `ℚ(μ_{p^∞})` are `ℚ(√p*)` for odd `p`, `p* = (−1)^{(p−1)/2}p`, and `ℚ(i)`, `ℚ(√2)`, `ℚ(√−2)` for `p = 2`. *Needs:* §§7.5, 7.4; Mathlib `IsCyclotomicExtension`.

**Checks.**

- `K = ℚ(i)`, `p = 2`: contained. `K = ℚ(√−3)`, `p = 3`: contained, since `ℚ(√−3) = ℚ(ζ_3)`. `K = ℚ(√−7)`, `p = 7`: contained.
- `K = ℚ(i)`, `p = 5`: not contained, since `5 ≡ 1 mod 4` and the only quadratic subfield of `ℚ(μ_{5^∞})` is `ℚ(√5)`.
- `ζ_8 + ζ_8³ = i√2`, so `ℚ(√−2) ⊂ ℚ(ζ_8)`, while `ℚ(√2)` is real and not a CM field.

### 7.7 Kato's length lemma

Let `A` be a noetherian commutative ring, `C` the category of finitely generated `A`-modules supported in codimension at least two and `G(C)` its Grothendieck group. Let `M` be a finitely generated `A`-module supported in codimension at least one, and `a ∈ A` such that `M_𝔮 = 0` at every height-one prime `𝔮` containing `a`. Prove that `M/aM` and `M[a]` lie in `C`, and that (Kato, Lemma 14.15 and proof, pp. 243–244):

```text
[M/aM] − [M[a]] = Σ_{𝔮 ∌ a, ht 𝔮 = 1} length_{A_𝔮}(M_𝔮) · [A/(𝔮 + aA)]   in G(C).
```

The route filters `M` with pieces in `C` or isomorphic to `A/𝔮`, `𝔮` of height one not containing `a`. Both sides are additive by the snake lemma. *Needs:* Mathlib `Module.length`, `IsLocalization.AtPrime`, `Ideal.height`; PadicMeasuresIwasawaAlgebras §4.1.

**Checks.**

- `A = ℤ_p[[T]]`, `M = A/(T)`, `a = p`: `M/aM = 𝔽_p`, `M[a] = 0`, and the right side is `length(M_{(T)})·[A/(T, p)] = [𝔽_p]`.
- `A = ℤ_p[[T]]`, `M = A/(p)`, `a = p`: the height-one prime `(p)` contains `a` and `M_{(p)} ≠ 0`. The hypothesis fails, and indeed `M/aM = M` is not in `C`.
- For `A` two-dimensional local, classes in `G(C)` are lengths, so the identity becomes the equality of integers used in §8.5.

### 7.8 Elliptic units generate CM Iwasawa cohomology at height zero

Let f be a CM newform attached to ψ of conductor f_ψ and type (1−k,0), L = K(ψ(K̂×)), λ ∣ p, T ⊂ V_(L_λ)(ψ) a stable lattice and T̃ its induction with the normalization of §7.2. Put Λ = O_λ[[G_∞]]. In the contained case use G′_∞ and H^q(T) of §7.6 before inducing to G_∞. Use the torsion and torsion-free rank-one results of KatoEulerSystems §4.4. Define Z(ψ,T) as the Λ-submodule in rational H¹(T̃)[1/p] generated by the image under §7.3 of z_(p∞f_ψ) ⊗ T(−1). The generator is rational; no assertion of integral membership at singular primes is implicit. Put w = z_(p∞f_ψ) ⊗ γ ⊗ (ζ_(p^n))_n^(⊗(−1)) for nonzero γ ∈ V_L(ψ).

Prove that at every height-zero prime 𝔭 of Λ, with inverse image q in O_λ[[G_(p∞f_ψ)]], A = O_λ[[G_(p∞f_ψ)]]_q is a DVR, w generates the free rank-one ray-tower H¹_q and H²_q = 0. Prove also Z(ψ,T)_𝔭 = H¹(T̃)_𝔭, so the quotient of rational H¹ by Z(ψ,T)[1/p] is torsion. These are the identified-generator statements of Kato §15.15, p. 265, strengthened by the rational equivariant equality; they are distinct from the supplied unmarked module structure (Burungale–Tian, Theorem 2.3, p. 4).

A route uses §7.5 or §7.6 to obtain the DVR. If w lies in its maximal ideal, finite-order characters through the cyclotomic quotient make its dual exponential zero except at finitely many zeros of the remaining nonzero power series. Section 3.3 and KatoEulerSystems §4.2 give infinitely many nonzero values on each component, a contradiction. The Hecke identity needed is

    L_(pf_ψ)(ψ̄, χ₀ ∘ N_(K/ℚ), k−1) = L_({p})(f*, χ₀, k−1).

At a split rational prime only the primes of K dividing f_ψ are omitted; an unramified conjugate prime still contributes on both sides. It is false to discard the whole rational Euler factor merely because one prime above it divides the conductor. Finally §6.1 and §1.4, twisted by §7.4, give length H²_q ≤ length(H¹_q/Aw) = 0. Descent gives the asserted generator in cyclotomic cohomology. *Needs:* §§7.1–7.6, 6.1, 3.3, 2.6, 1.4, 0.2; KatoEulerSystems §§4.2, 4.4; SelmerIwasawaCohomology §3.1.

- Z(ψ,T) changes by the same scalar as T and commutes with coefficient extension.
- The generator at a height-zero prime is determined by the nonzero vector γ, not by an unspecified choice of a rank-one basis.
- At regular primes the integral smoothing ideal is the unit ideal, so Z(ψ,T) can be localized without an auxiliary denominator; at singular primes use the integral intersection specified in §7.9.

**Checks.**

- The zero submodule has rank 0, whereas H¹ has rank 1. The supplied rank statement alone does not identify Z, and the assertion Z_𝔭 = H¹_𝔭 excludes this model.
- For 32.2.a.a at p = 2, G′_∞ = 1+4ℤ₂ and Λ′ = ℤ₂[i][[T]] is a domain. The retained primitive generator assertion uses §7.6; it is not a second module-structure theorem.
- For y² = x³ − 25x the rational point (25/4,75/8) lies on the curve and the trivial central twist can have zero value. The proof uses ramified twists with nonzero value, not universal nonvanishing of the trivial twist.
- If a split prime is 𝔩𝔩̄ with ψ ramified only at 𝔩, its Hecke factor is (1 − ψ̄(𝔩̄)χ₀(ℓ)ℓ^(−s))⁻¹. Both sides of the identity retain it; deleting it gives 1 instead of that nontrivial factor.

### 7.9 Kato's lattice inequality for CM forms

Let `λ ∣ p` be a finite place of `L`, `𝔭` a height-one prime of `O_λ[[G_∞]]`, and assume either `p ∉ 𝔭`, or `p ∤ #μ(H)` and `p ∤ #Δ` (Rubin's condition (b)). For a stable lattice `T ⊂ V_{L_λ}(ψ)`, prove first that the image of z_(p∞f) ⊗ T(−1) belongs to H¹(T̃)_𝔭 under the stated condition, and let Z(ψ,T)_𝔭 be its O_λ[[G_∞]]_𝔭-span there. At a regular prime this agrees with §7.8's rationally generated submodule. This integrality is part of Kato's lattice comparison, not a definition by saturation. Prove that `length H²(T̃)_𝔭 ≤ length (H¹(T̃)_𝔭/Z(ψ, T)_𝔭)` (Kato, Proposition 15.17 and proof, p. 265). This is the CM case of the inequality of Kato's Theorem 12.5(3) in the form `Z(ψ, T)`, which §8.4 identifies rationally with `Z(f)`; it differs from the non-CM rational Euler-system bound of PadicFamilies §4.0.3 in two ways: it is stated for the elliptic-unit lattice `Z(ψ, T)`, and it holds at primes containing `p` under condition (b). The route applies §7.7 to `M₁ = H²_{p∞f}(T)_q` and `M₂ = H¹_{p∞f}(T)_q/A·(z_{p∞f} ⊗ T(−1))` over `A = O_λ[[G_{p∞f}]]_q`, with `a` the generator of §7.5(1): both vanish at the height-one prime `aA` of `A`, which lies over the height-zero prime of `O_λ[[G_∞]]` under `𝔭`, by §7.8, and their lengths at the other height-one primes of A are compared by Rubin's lattice bound on the unscaled elliptic units under condition (b), and at regular primes by §§4.4–4.6, where 2 is invertible; §§7.5–7.6 then descend. The length input is Lemma 14.15, pp. 243–244. *Needs:* §§7.3–7.8, 4.4.

### Examples

For `f = 32.2.a.a` and `p = 2`, `K = ℚ(i) ⊂ ℚ(μ_{2^∞})` and §7.6 applies with `G′_∞ = 1 + 4ℤ_2`. For `f = 27.2.a.a` and `p = 5`, `K = ℚ(√−3) ⊄ ℚ(μ_{5^∞})` and §7.5 applies at every `𝔭 ∌ 5`; §7.8 says that `H²(V(f))` is torsion and `H¹(V(f))` free of rank one over each of the four components of `ℤ_5[[ℤ_5^×]][1/5]`.

### Dependencies

Layers 0–4 and 6; KatoEulerSystems §4.4; AutomorphicGaloisRepresentations §3.15; ModularForms Layers 5, 7, 9; GlobalNumberFields Layers 9–10; ComplexMultiplicationAndExplicitReciprocity §4.2; AutomorphicGaloisRepresentations §§1.5, 7.3; AutomorphicGaloisRepresentationsPartII AG2.0; AnalyticNumberTheoryPartI §2.3a; PadicHodgeRegulators §1.4; KatoEulerSystems §4.2; SelmerIwasawaCohomology §§3.1–3.3; PadicMeasuresIwasawaAlgebras §4.1; Mathlib `IsCyclotomicExtension`, `Module.length`, `IsLocalization.AtPrime`, `Ideal.height`.

## Layer 8: Kato's main conjecture for CM newforms at every prime

### 8.1 The archimedean normalization of the induction

With (15.11.1) fixed, let `Ṽ_L(ψ) = V_L(ψ) ⊕ ιV_L(ψ)` be induced from `V_L(ψ)` to `Gal(ℂ/ℝ)`. Prove that there is a unique `Gal(ℂ/ℝ)`-isomorphism `Ṽ_L(ψ) ≅ V_L(f)` under which `per_f` corresponds to `per_ψ` (Kato, Lemma 15.11(2) with proof, pp. 261–262). It serves only to transport `γ ∈ V_L(ψ)` to `γ′ ∈ V_L(f)`. The route fixes a sign `±` and chooses `m ≥ 1` and `z ∈ S(ψ) ⊗ ℚ(ζ_m)`, `z′ ∈ S(f) ⊗ ℚ(ζ_m)` whose `χ`-twisted period sums are `L_S(ψ̄, χ, k − 1)γ` and `L_S(f*, χ, k − 1)γ′` for every `χ` of sign `±`, with some value nonzero. This uses §3.2, KatoEulerSystems §§4.2 and 5.3, and `L(f*, s) = L(ψ̄, s)`. The ratio of the images is fixed by `Gal(L(ζ_m)/L)`, hence lies in `L^×`. *Needs:* §§7.2, 3.1, 3.2; KatoEulerSystems §§4.2, 5.3.

### 8.2 The reciprocity law in `V(f)`-coefficients

Let `γ ∈ V_L(ψ)` with image `γ′ ∈ V_L(f)` under §8.1, `f` the conductor of `ψ` and `n ≥ 0`. Consider the composite of the Tate-twisted §7.3 with specialization at level `n`, localization at `p` and the dual exponential, extended to the localization at the non-zero-divisors invertible in `ℚ_p[Gal(ℚ(ζ_{p^n})/ℚ)]`. Prove that it sends `z_{p∞f} ⊗ γ` into `S(f) ⊗_F L ⊗ ℚ(ζ_{p^n})`, and that for every character `χ` of `Gal(ℚ(ζ_{p^n})/ℚ)` (Kato, (15.12.2), p. 263):

```text
Σ_σ χ(σ) per_f(σ(image)) = L_{{p}}(f*, χ, k − 1) · (γ′)^±,   ± = χ(−1).
```

Here `L_{{p}}` omits only the Euler factor at `p`. The route applies §3.3 and translates the periods by (15.11.1) and §8.1. It uses the identity `L_{pf}(ψ̄, χ ∘ N_{K/ℚ}, k − 1) = L_{{p}}(f*, χ, k − 1)` of §7.8, with the conductor-sensitive factor comparison of §7.8: ramified primes of K contribute 1, and a surviving unramified conjugate factor is retained on both sides. *Needs:* §§3.3, 7.3, 7.2, 7.8, 8.1.

**Checks.**

- At `k = 2`, `r = 1` the shape agrees with KatoEulerSystems §5.3 at `r = k − 1 = 1`, where `(2πi)^{k−r−1} = 1`.
- With `f` strictly smaller than the conductor (a larger modulus), extra Euler factors at the added primes remain, and the value is not `L_{{p}}`. The statement requires `f` to be exactly the conductor.
- For `χ` even (`χ(−1) = 1`) only `(γ′)^+` occurs. For the induced vector γ′ = (γ,0), its even projection is (γ,ιγ)/2 and is nonzero when γ ≠ 0. A claim that a nonzero inducing vector has zero even projection would be false.

### 8.3 The equivariant equality on `ψ`-components

Let `ψ` have conductor `f`, `T ⊂ V_{L_λ}(ψ)` a stable lattice and `A = O_λ[[G_{p∞f}]]`. Take a height-one prime `q′` of `A` with `p ∉ q′`, contained in the inverse image `q` of a prime `𝔭 ∌ p` of `O_λ[[G_∞]]` (of `O_λ[[G′_∞]]` when `K ⊂ ℚ(μ_{p^∞})`). Prove that `length H²_{p∞f}(T)_{q′} = length (H¹_{p∞f}(T)/A·(z_{p∞f} ⊗ T(−1)))_{q′}` (Kato, 15.15 and the proof of Proposition 15.17, p. 265; Burungale–Tian, proof of Theorem 2.6, p. 5, BT lines 213–218). The route twists by §7.4 to the regular prime `Tw_{χ_T}(q′)` and applies §6.1. It then kills the Euler terms. For `g ∈ I_𝔩`, `g` has finite order and maps to 1 in `G_∞`, so `g − 1 ∈ q`. A height-one `q′ ⊂ q` contains `g − ζ` for a root of unity `ζ` with `ζ − 1 ∈ q`, and `p ∉ q` forces `ζ = 1`. After the twist the Euler module is killed by `χ_T(g)⁻¹g − 1 ≡ χ_T(g)⁻¹ − 1` modulo `q′`, which is nonzero in characteristic zero because `χ_T|_{I_𝔩} = ψ⁻¹|_{I_𝔩} ≠ 1`. Finally §1.4 replaces `h²` by `H²_{p∞f}(ℤ_p(1))`. *Needs:* §§6.1, 7.4, 1.4, 1.5, 2.6.

### 8.4 Elliptic units become Beilinson–Kato elements

Let `f` be a CM newform attached to `ψ`, with coefficients enlarged to `L ⊃ F`, and `γ ∈ V_L(ψ)` with image `γ′`. Prove that §7.3 sends `z_{p∞f} ⊗ γ ⊗ (ζ_{p^n})_n^{⊗(−1)}` to `z_{γ′}(f)`, the value at `γ′` of Kato's zeta morphism of KatoEulerSystems §5.1, extended `L`-linearly. Consequently the `Λ_ℚ`-span of the images of `z_{p∞f} ⊗ V_L(ψ)(−1)` is `Z(f) ⊗ L` (Kato, 15.16 and (15.16.1), p. 265; Burungale–Tian, proof of Theorem 2.6, BT lines 215–216). The route goes through `H¹(V(f))`, torsion-free of rank one over each component of `Λ_ℚ`, hence free of rank one over it (KatoEulerSystems §4.4), which contains both elements. Their dual-exponential images agree at every finite level and character, by §8.2 and KatoEulerSystems §5.3: both equal `L_{{p}}(f*, χ, k − 1)(γ′)^±`, since (15.11.1) and §8.1 were fixed compatibly. At the infinitely many characters with nonzero value (KatoEulerSystems §4.2), the dual exponential is injective on the specialized rank-one line. The difference therefore specializes to zero on a dense set and vanishes in the free rank-one module. *Needs:* §§8.2, 8.1, 7.8, 7.3, 7.2, 2.6; KatoEulerSystems §§4.2, 5.1, 5.3.

**Checks.**

- The comparison is rational. An integral identification of the lattices `Z(ψ, T)` and `Z(f, T)` is not claimed.
- The conjugation law `z_{ιγ} = −σ_{−1}z_γ` of KatoEulerSystems §5.1 holds for the elliptic side as well. The twist by `(ζ_{p^n})^{⊗(−1)}` interchanges the parity of `χ(−1)` with the sign of `γ′` as in §8.2. Without that twist the parities would not match.
- For `f = 32.2.a.a` and `p = 2` the statement identifies the elliptic units of the 2-power ray tower of `ℚ(i)` with the Beilinson–Kato element of the congruent-number curve, after the base change of §7.6.

### 8.5 From the equivariant equality to Kato's equality

In the setting of §7.5 (or §7.6), let `𝔭 ∌ p`, `q` its inverse image, and `A = O_λ[[G_{p∞f}]]_q`, a regular local ring of dimension two whose kernel to the cyclotomic localization is generated by a prime element `a`. Put `M₁ = H²_{p∞f}(T)_q` and `M₂ = H¹_{p∞f}(T)_q/A·(z_{p∞f} ⊗ T(−1))`. Suppose `length (M₁)_{q′} = length (M₂)_{q′}` at every height-one prime `q′` of `A`. Prove that then `length H²(T̃)_𝔭 = length (H¹(T̃)_𝔭/Z(ψ, T)_𝔭)` (Kato, proof of Proposition 15.17, p. 265, and Lemma 14.15, pp. 243–244). Kato's argument gives only the inequality; Burungale–Tian's appeal to Kato §15 (BT lines 213–218) needs this equality. The route:

1. `M₁` and `M₂` vanish at `aA`, the height-one prime of `A` over the height-zero prime of `O_λ[[G_∞]]` under `𝔭`: `H²` vanishes there and `z` generates `H¹` there, by §7.8.
2. §7.7 gives `[M₁/aM₁] − [M₁[a]] = [M₂/aM₂] − [M₂[a]]` as lengths.
3. By §7.5, `M₁/aM₁ = H²(T̃)_𝔭`, and `H¹(T̃)_𝔭/Z(ψ, T)_𝔭` is an extension of `M₁[a]` by `M₂/aM₂`.
4. `M₂[a] = 0`. The zeta generator embeds the torsion-free rank-one `H¹` as `A ⊂ H ⊂ Frac(A)` with `H_{(a)} = A_{(a)}`. If `ah ∈ A` with `h ∈ H`, then `h ∈ a⁻¹A ∩ A_{(a)} = A`, because `A` is factorial and `a` prime.
5. The `M₁[a]` terms cancel, giving the equality.

*Needs:* §§7.5–7.8, 7.4, 2.6.

**Checks.**

- In a two-dimensional regular local ring `A` with regular parameters `x, y` and `a = x`, take `M₁ = M₂ = A/(y)`. Then `M_i/xM_i = A/(x, y)` has length 1 and `M_i[x] = 0`, and §7.7 gives `1 = length(M_i)_{(y)}·length A/(x, y) = 1`.
- With `M₁ = A/(x)`, supported at the prime containing `a`, the hypothesis of §7.7 fails: `M₁/xM₁ = A/(x)` has dimension one and is not in `C`.
- If `z` did not generate `H¹` at `aA`, `M₂` would be nonzero at the prime containing `a` and §7.7 would not apply. Step 1 is needed.
- With `A` not factorial, `a⁻¹A ∩ A_{(a)}` can be larger than `A`. The regularity in §7.5 supplies factoriality.

### 8.6 Kato's main conjecture for every CM newform and every prime

Let `f` be a normalized CM newform of weight `k ≥ 2` (§7.1), `p` any prime, `F` its Hecke field, `λ ∣ p` and `V = V_{F_λ}(f)`. Let `H^q(V)` be Kato's cyclotomic Iwasawa cohomology (ModularIwasawaMainConjectures §0.6) and `Z(f) ⊂ H¹(V)` the `Λ_ℚ`-submodule of Beilinson–Kato elements (KatoEulerSystems §5.1). Prove that, as ideals of `Λ_ℚ = O_λ[[G_∞]][1/p]` (Burungale–Tian, Theorem 2.6 and its proof, p. 5, BT lines 208–218):

```text
ξ(H²(V)) = ξ(H¹(V)/Z(f)).
```

This is the rational form `KMC_ℚ` of ModularIwasawaMainConjectures §0.7 for CM forms. There is no hypothesis of ordinarity, good reduction, residual irreducibility or `p ∤ 6`. `p = 2` with `K = ℚ(i)` or `ℚ(√−2)`, and `p` dividing `#Δ`, are included. The route has three steps.

1. Extend coefficients to `L` and identify `V_{L_λ}(f)` with the induction by §7.2; characteristic ideals descend along the faithfully flat `O_λ[[G_∞]] → O_v[[G_∞]]`.
2. By §8.4, `Z(f) ⊗ L` is `Z(ψ, T) ⊗ ℚ` for any lattice `T`.
3. At each height-one `𝔭 ∌ p`, §8.3 supplies the hypothesis of §8.5, which gives equal lengths, using §7.5 or §7.6 according to whether `K ⊄` or `K ⊂ ℚ(μ_{p^∞})`.

Both modules are torsion: H²(V) by KatoEulerSystems §4.4, and `H¹(V)/Z(f)` because `Z(f) ⊗ L = Z(ψ, T) ⊗ ℚ` (§8.4) and `Z(ψ, T)` generates `H¹(T̃)` at every height-zero prime (§7.8); so equal lengths at every height-one prime of `Λ_ℚ` give equal ideals. *Needs:* §§8.3–8.5, 7.1, 7.2, 7.5, 7.6, 7.8; KatoEulerSystems §§4.4, 5.1; ModularIwasawaMainConjectures §§0.1, 0.6, 0.7; PadicMeasuresIwasawaAlgebras §4.6.

**Checks.**

- `f = 32.2.a.a`, `p = 2`: `ξ(H²(V)) = ξ(H¹(V)/Z(f))` over `ℤ_2[[ℤ_2^×]][1/2]`, through the contained case.
- `f = 27.2.a.a`, `p = 3`: the contained case `ℚ(√−3) = ℚ(ζ_3)`.
- The integral equality is not asserted. Over `ℤ_p[[T]]` the ideals `(p)` and `(1)` agree after inverting `p`, so the rational statement says nothing at the prime `(p)`.

### 8.7 Normalization dictionary

Prove that §8.6 is stated with the following conventions, which are those of ModularIwasawaMainConjectures §§0.6–0.7 and of its consumers (Burungale–Tian, §§2.2.1–2.2.4, pp. 4–5, BT lines 160–196):

- `V` is Kato's cohomological realization, dual to the covariant one.
- `H^q(V) = lim_n H^q(ℤ[ζ_{p^n}, 1/p], j_*T) ⊗ ℚ`, in the `j_*` convention.
- `Λ = O_λ[[G_∞]]` for the full `G_∞ ≅ ℤ_p^×`, its torsion `Δ` included, so the equality holds on every character component.
- `Z(f)` is generated by `z_γ(f)` for all `γ ∈ V`, normalized by Kato's Theorem 12.5(1).
- Characteristic ideals are taken over `Λ ⊗ ℚ`.

For even k, the central specialization at the kernel of `σ_c ↦ c^{−k/2}` is at a prime of `Λ` not containing `p`, so the rational equality applies there (Burungale–Tian, proof of Theorem 3.1, p. 6, BT lines 231–243). *Needs:* §8.6; ModularIwasawaMainConjectures §§0.6–0.7; SelmerIwasawaCohomology §§3.7, 3.15.

**Checks.**

- The torsion `Δ` of `G_∞` is `ℤ/(p − 1)` for odd `p` and `ℤ/2` for `p = 2`. A formulation over `O_λ[[Γ]]` alone would see only the trivial component.
- With extension by zero in place of `j_*`, `H²` at a prime `ℓ ∣ N` where `V` is ramified would acquire a local term and change `ξ(H²)`.
- For `k = 2` the character is `σ_c ↦ c⁻¹`. Its kernel is a height-one prime of `Λ` with quotient `O_λ`, of characteristic zero, so it does not contain `p`. For odd `p` its restriction to `Δ = μ_{p−1}` is `ω⁻¹`, so it lies on the `ω⁻¹`-component.

- At k = 3 a character h on the full cyclotomic group must satisfy h(−1)² = 1, whereas the proposed square (−1)^(−3) is −1. The half-weight central specialization is excluded, while §8.6 still covers weight 3.

### Examples

For the congruent-number curve `y² = x³ − x` (32.2.a.a), `p = 2`, `f = (1 + i)^3`: every prime of `f` lies above 2, so Layer 6 has no Euler terms, `Δ` is trivial (§0.1) and Layer 7 uses the contained case. For 27.2.a.a at `p = 3`, `f = (3)` lies above 3, and again there are no Euler terms.

### Dependencies

Layers 0–4, 6 and 7; KatoEulerSystems §§4.2, 4.4, 5.1, 5.3; ModularIwasawaMainConjectures §§0.1, 0.6, 0.7; SelmerIwasawaCohomology §§3.7, 3.15; PadicMeasuresIwasawaAlgebras §4.6.

## Downstream consumers

The rank-zero `p`-converse for CM elliptic curves and CM newforms at every prime, and its congruent-number and cube-sum applications (CMRankZeroConverse), use the rational equivariant main conjecture of §6.2, the contained-case descent of §7.6, the generator identification of §7.8 and Kato's main conjecture of §8.6 with the dictionary of §8.7. The Eisenstein-prime anticyclotomic arguments of Castella–Grossi–Lee–Skinner use §§5.4–5.5.

## Worked examples

- **The Gaussian field at `p = 2`.** `K = ℚ(i)`, `p = 2`, `f = (1)`: `Δ = 1`, `G ≅ ℤ_2²`, `R` is a domain, `h¹` is torsion-free of rank one, `z_{2∞} ≠ 0`, and §4.5 is an integral equality for the B-normalized module over `ℤ_2[[ℤ_2²]]`. Rubin's hypothesis excludes this case (`μ(K) = μ_4`); Johnson-Leung–Kings' theorem does not.
- **A tame Euler factor.** `K = ℚ(i)`, `p = 5`, `f = (3)`: on the trivial finite-character component, where the inertia at (3), cyclic of order 8, acts trivially, `ξ((h¹/z)_ℚ) = ξ(h²_ℚ)·(1 − Frob_{(3)}⁻¹)`. On inertia-trivial components with finite Frobenius eigenvalue −1, the factor has augmentation 2 and is a unit; on inertia-nontrivial components the Euler module is zero.
- **A residue-characteristic obstruction in Lemma 15.13.** For `K = ℚ(i)`, `p = 2` and `f = (3)`, `Δ ≅ ℤ/8` (§0.1), so `#Δ` is not invertible in residue characteristic 2, and the hypothesis of §7.5 fails at primes whose residue field has characteristic 2. Only primes not containing `p` enter §8.6.

## References

- **BT.** Ashay A. Burungale and Ye Tian, *A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin*, Annals of Mathematics 203 (2026); read as [arXiv:2506.03465v2](https://arxiv.org/abs/2506.03465v2), whose page numbers are used. §2.1.1, Theorems 2.1, 2.3, 2.4, 2.6, Remark 2.7, footnotes 3–4, pp. 3–5; proof of Theorem 3.1, p. 6.
- **Kato.** Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Astérisque 295 (2004), 117–290, [Numdam](https://www.numdam.org/item/AST_2004__295__117_0.pdf). 3.8, 8.2–8.3, Theorems 12.4–12.5, Remark 12.8, Conjecture 12.10, Lemma 14.15, §15.
- **JLK.** Jennifer Johnson-Leung and Guido Kings, *On the equivariant and the non-equivariant main conjecture for imaginary quadratic fields*, J. reine angew. Math. 653 (2011), 75–114; read as [arXiv:0804.2828v2](https://arxiv.org/abs/0804.2828v2), whose numbering is used.
- **Rubin91.** Karl Rubin, *The "main conjectures" of Iwasawa theory for imaginary quadratic fields*, Inventiones Mathematicae 103 (1991), 25–68, [GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0103/LOG_0009.pdf). §§1, 4, Theorem 4.1 and Remarks.
- **HuberKings.** Annette Huber and Guido Kings, *Bloch–Kato conjecture and main conjecture of Iwasawa theory for Dirichlet characters*, Duke Math. J. 119 (2003); [arXiv:math/0101071v2](https://arxiv.org/abs/math/0101071v2). Proposition 2.3.1.
- **CGLS.** Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*, Inventiones Mathematicae 227 (2022), 517–580; read as [arXiv:2008.02571v2](https://arxiv.org/abs/2008.02571v2). Definition 1.2.1, Theorem 1.2.2, Remark 1.2.3, (2.11).
- **Kriz.** Daniel Kriz, *Generalized Heegner cycles at Eisenstein primes and the Katz p-adic L-function*, Algebra & Number Theory 10 (2016), 309–374; read as [arXiv:1512.05032v1](https://arxiv.org/abs/1512.05032v1). Theorem 27.
- **Yager.** Rodney Ian Yager, *On two variable p-adic L-functions*, PhD thesis, Australian National University (1981), [ANU Open Research](https://openresearch-repository.anu.edu.au/items/7c4519f4-e0eb-49ce-a2d9-e5777fa9483d). Chapters 3–8 and Theorem 1.

- **Coleman79.** Robert F. Coleman, *Division values in local fields*, Inventiones Mathematicae 53 (1979), 91–116, [GDZ](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0053/LOG_0011.pdf). Theorem A, p. 92; Theorem 11 and Corollary 12, p. 102.
- **BKO21.** Ashay Burungale, Shinichi Kobayashi and Kazuto Ota, *Rubin’s conjecture on local units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966, [NSF public copy](https://par.nsf.gov/servlets/purl/10336626). Theorems 6.1–6.2, pp. 960–963.
- **Schutt09.** Matthias Schütt, *CM newforms with rational coefficients*, Ramanujan Journal 19 (2009), 187–205; [arXiv:math/0511228v5](https://arxiv.org/abs/math/0511228v5), Theorem 1.4, p. 3.
