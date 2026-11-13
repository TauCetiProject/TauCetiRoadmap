# Roadmap: nonordinary CM special values

**Summary.** Let `K` be an imaginary quadratic field, `p` an odd prime inert in `K`, and `φ` a conjugation-equivariant Hecke character of `K` of ideal infinity type `(1,0)`, realised by a CM elliptic curve over the Hilbert class field `H`. This roadmap builds the complex and `p`-adic special-value theory of the anticyclotomic twists `φ̄νχ` at such a nonordinary prime, where no ordinary `p`-adic period exists. From the native Hecke characters of Tau Ceti, the CM theory of ComplexMultiplicationAndExplicitReciprocity, Hecke's functional equation of AnalyticNumberTheoryPartI and the local factors of AutomorphicLFunctionsAndLocalFactors it constructs: Kato's CM theta functions, his standard elliptic units and elliptic zeta elements, and his reciprocity law for CM characters; the integral class of Burungale–Kobayashi–Ota normalised by a Néron differential; the torsion and ring-class towers with their CM Lubin–Tate comparison at the parameter `π = −p`; the local Fröhlich–Queyrut theorem, the root numbers of the twists and the central zeros they force; Finis's theory of primitive and integral theta functions and his divisibility theorem for anticyclotomic `L`-values in every critical weight at split valuation primes and in weight one at nonsplit valuation primes; and Jia's nonvanishing theorem for arbitrary class number, with Rohrlich's Diophantine lattice count. The end theorems are the BKO unit theorem — for an auxiliary split prime `l`, almost every normalised value `Ω⁻¹ L_f(φ̄ν, 1)`, `ν` of `l`-power order, is a `p`-adic unit — and the parity dichotomy: in the `p`-anticyclotomic family, values of one conductor parity vanish and all but finitely many of the other parity do not.

## Scope and ownership

This roadmap owns:

- the carriers of the anticyclotomic family on Tau Ceti's `HeckeCharacter` (Layer 0): conjugation-equivariant characters of type `(1,0)`, anticyclotomic characters, the `p`-anticyclotomic family, primitive Euler factors and central values;
- the integral CM period of a good Néron differential, the auxiliary split prime and the auxiliary characters `X_l` (Layer 0);
- the canonical root number `W(φ) = (2/D)` for odd `D`, the root numbers of the auxiliary and `p`-anticyclotomic twists, the local Fröhlich–Queyrut theorem and the forced central zeros (Layer 1);
- Kato's CM refinement `_aθ_E` of the theta function, canonical CM pairs, standard elliptic units in Kato's normalisation, the elliptic zeta element, Kato's realisation `V_L(ψ)`, `S(ψ)`, `per_ψ`, the height-one explicit reciprocity law in the form applied by Kato, Kato's reciprocity law for CM characters (Kato 2004, Proposition 15.9), the twist of norm-compatible Kummer towers by a finite free coefficient module, the integral BKO class, its direct-character reciprocity and its period laws (Layer 2). The general Kato hypotheses (every imaginary quadratic `K`, every prime `p`, every `r ≥ 1`) are stated in §§2.1–2.6, separately from the BKO restrictions of §§2.7–2.10;
- the torsion and ring-class composita, their disjointness, the semilocal splitting, the inert Frobenius and the CM application of the Honda–Lubin–Tate comparison (Layer 3);
- Finis's divisibility theory: scalar theta functions on CM lattices, primitive subspaces, Shintani operators, the functional `l`, integral theta functions and the canonical bilinear forms, Yang's formula and its arithmetic form, the torsion-stabiliser input in characteristic `ℓ`, the nonvanishing of theta functions modulo `ℓ`, the ordinary-measure comparison across weights, and Finis's divisibility theorem in every critical weight for split valuation primes and in weight one for nonsplit valuation primes (Layer 4);
- the specialisation of Finis's theorem to the canonical family, the unit witness, the unramified coefficient field and the scalar/tensor kernel comparison (Layer 5);
- Rohrlich's lattice-point count, Jia's Galois-average limit, the Galois stability of central vanishing, central nonvanishing and the parity dichotomy (Layer 6).

It leaves to other roadmaps:

- the ordinary theta unit `_cθ_E` (divisor, distribution relation, base change, isogeny norm and `q`-expansion, for `c` invertible on the base and prime to `6`): PadicFamilies §4.0.1. Layer 2 constructs only its CM ideal refinement and compares the two when the ideal is principal;
- the elliptic units built from Siegel functions on a class-number-one CM curve with ordinary `p`, with their Euler-system relations and Rubin's two-variable main conjecture: NoncommutativeAndEquivariantIwasawa §4.3. Layer 2 uses Kato's theta normalisation on canonical CM pairs over every ray class field `K(f)` instead, with no class-number or ordinarity hypothesis;
- Hecke's continuation and functional equation for unitary idele-class characters: AnalyticNumberTheoryPartI §2.3a; the root-number product formula: ArithmeticGaloisRepresentations §2.7; local `ε`-factors and Gauss sums: AutomorphicLFunctionsAndLocalFactors AL.1.3;
- the cyclotomic twist of Iwasawa cohomology: SelmerIwasawaCohomology §3.7. The twist by a finite free module whose action factors through a `p`-adic Lie tower is §2.9 here;
- canonical Gross characters, their existence, their attached curves and their good reduction; CM periods, the idele and torsion dictionary, the ray-level generation criterion, the good-prime Frobenius identities: ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1, 4.3;
- Lubin–Tate formal modules, division fields and the Honda comparisons: LubinTateFormalModulesAndQuasiCanonicalLifts Layers 2 and 4.

The ordinary CM `ℓ`-adic period and Katz measure at split `ℓ` are supplied by AutomorphicPadicLFunctionsPartII §§6.2, 8.5; the Finis valuation comparison with them is §4.5a here. The Rubin `p`-adic `L`-function, the primitive elliptic-unit coordinate, the signed local decomposition, the `Δ`-projection of the elliptic class and its derivatives are outside this roadmap. The normalised values here define no Iwasawa function by interpolation, and no statement is made about central derivatives for sign `−1`.

## Conventions

**Fields and embeddings.** `K` is imaginary quadratic with ring of integers `O_K`, fundamental discriminant `−D`, quadratic character `κ_K`, class number `h_K`, unit order `w_K`, Hilbert class field `H` and complex conjugation `c`. Fix embeddings `ι_∞ : Q̄ → ℂ` and `ι_p : Q̄ → C_p` that agree on `K`; `ι : K → ℂ` is the restriction of `ι_∞`. The prime `p` is odd and inert in `K`, `Φ = K_p` is the unramified quadratic extension of `Q_p` with integers `O_Φ = W(F_{p²})`, and `π = −p`. In §§2.7–2.10 and Layers 3 and 5, `p ≥ 5` and `p ∤ h_K` (the BKO setting); §§2.1–2.6 hold for every prime `p`, split, inert or ramified, including `2` and `3`.

**Characters.** Artin reciprocity sends uniformizers to arithmetic Frobenius. A Hecke character is a continuous character of the idele class group, Tau Ceti's `HeckeCharacter`. Its ideal character is `HeckeCharacter.idealCharacter`, defined on fractional ideals prime to `HeckeCharacter.finiteConductor`, and its local conductor exponents are `HeckeCharacter.conductorExponent`. Ideal infinity type `(1,0)` for `ι` means `φ((x)) = ι(x)` for `x ≡ 1` modulo the conductor; at the idele level the archimedean component is `z ↦ z⁻¹` (idelic type `(−1,0)`). Kato writes `ψ` of type `(−r,0)` for the same normalisation, and Finis writes type `(k,j)` for `λ_∞(x) = x^{−k}x̄^{−j}`; so our `φ` is Kato's `ψ` with `r = 1`, and `φ̄ν/N` has Finis type `(−1,0)`.

**L-functions.** `L(η, s) = Σ_a η(a) N(a)^{−s}`, the sum over integral ideals prime to the conductor of `η`: the primitive `L`-function. For a finite set `S` of primes, `L_S(η, s)` removes the Euler factors at `S` (only the support of a modulus matters for deletion). A character `η = φρ` with `ρ` of finite order has weight one, its Euler product converges for `Re s > 3/2`, its central point is `s = 1`, and after the unitary normalisation `η|·|^{1/2}` the centre is `1/2`. The root number `W(η)` is that of the unitary character `η|·|^{1/2}` in AnalyticNumberTheoryPartI §2.3a, the product of the local constants `ε(1/2, η_v|·|_v^{1/2}, ψ_v)` of AutomorphicLFunctionsAndLocalFactors AL.1.3 for the standard additive character `ψ_K = ψ_Q ∘ Tr_{K/Q}` (ArithmeticGaloisRepresentations §2.7, Root-number product formula). Changing `ψ_v` to `ψ_v(−·)` multiplies a local central epsilon factor by `η_v(−1)`, and the product of these changes over all places is `η(−1) = 1`.

**Indices.** For an anticyclotomic character `ν` of exact order `l^r`, `r ≥ 1`, with `l` split, `l ∤ h_K`, `l ≥ 5`, the field layer is `L[r]` (degree `l^r`) and the conductor is `l^m O_K` with `m = r + 1`; for `ν = 1`, `r = m = 0`. For a `p`-anticyclotomic `χ` of exact order `p^n`, `n ≥ 1`, and `p ∤ h_K`, the conductor is `p^c O_K` with `c = n + 1`; the trivial character has `c = 0`. When `p | h_K` the conductor exponent `c` is still the index that controls signs, but it is not determined by the order. Order indices and conductor indices are never identified.

**Towers and periods.** `F_n = H(E[p^{n+1}])`, `Φ_n` its completion at the place above `p` fixed by `ι_p`, of degree `(p² − 1)p^{2n}` over `Φ`; `Φ_0 ≠ Φ`. Arithmetic Frobenius on the covariant Tate module of the reduction at a place above `p` is `[−p]`, and a compatible `π`-power basis differs from a `p`-power basis by the sign `(−1)^n` at level `n`. A period datum `(E, ω, Ω)` consists of a CM curve `E/H` with good reduction above `p`, a Néron differential `ω` at the place above `p`, and `Ω ∈ ℂ×` with period lattice of `ω` equal to `Ω O_K`; `Ω` is determined up to `O_K×`.

**Duals and twists.** `T_φ` is the rank-one `p`-adic realisation of `φ` over the integers `R` of a finite extension of `Φ` containing its values; `T_φ^∨(1) = Hom_R(T_φ, R)(1)`. Kato's `V_L(ψ)` carries the inverse action, so `V_L(φ)(1) ⊗ L_λ = T_φ^∨(1)[1/p]`, and its de Rham line is generated by `ω`. The normalised Betti vector is `γ = per_φ(ω)/Ω ∈ V_L(φ)`. Group-algebra evaluation of a character `ν` sends `[g]` to `ν(g)` (Mathlib's `MonoidAlgebra.lift`), never to `ν(g)⁻¹`.

## Exact supplier contracts

### From Mathlib

- `NumberField.RingOfIntegers`, `NumberField.classNumber`, `NumberField.IsCMField` and `NumberField.IsCMField.complexConj`, `Algebra.IsQuadraticExtension`: the field, its integers, class number and conjugation. For a degree-two CM field the maximal real subfield is `ℚ`, so `IsCMField` with `IsQuadraticExtension ℚ K` is exactly an imaginary quadratic field.
- `FractionalIdeal`, `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`: ideals, finite primes and norms.
- `MonoidAlgebra.lift` and `MonoidAlgebra.lift_single` (Mathlib/Algebra/MonoidAlgebra/Basic.lean): evaluation `[g] ↦ ν(g)`, without inversion.
- `Subalgebra.linearDisjoint_iff_injective` (Mathlib/RingTheory/LinearDisjoint.lean): linear disjointness is injectivity of the multiplication map.
- `DirichletCharacter.LFunction_apply_one_ne_zero` (Mathlib/NumberTheory/LSeries/Nonvanishing.lean): `L(1, κ) ≠ 0` for a nontrivial Dirichlet character of nonzero modulus.
- `PadicInt`, `Padic`, `IsAlgebraic`, `Set.ncard`, `HasProd`, `Differentiable`: the carriers of the Lean statements.

### From Tau Ceti

- `TauCeti.GlobalNumberFields.HeckeCharacter` (`ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ`), with `HeckeCharacter.IsFiniteOrder`, `HeckeCharacter.finiteConductor`, `HeckeCharacter.finiteConductor_ne_bot`, `HeckeCharacter.conductorExponent`, `HeckeCharacter.finiteComponent` and `HeckeCharacter.idealCharacter` (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean and Ideal.lean). `HeckeCharacter.idealCharacter_apply_prime` identifies the ideal value at a prime with the local component at any uniformizer; `HeckeCharacter.idealCharacter_apply_toPrincipalIdeal` identifies the value at `(x)`, `x ≡ 1`, with the inverse of the product of the archimedean components. The carrier includes non-unitary characters; finite order is a separate predicate.
- `TauCeti.GlobalNumberFields.Modulus`, `idealsPrimeTo`, `IsCongrOne`, `IsCongrOne.toPrincipalIdeal_mem_idealsPrimeTo`, `toPrincipalIdeal`: moduli, ideals prime to a modulus and multiplicative congruence. `IsCongrOne` is a condition on `Kˣ`, so zero is excluded.
- `TauCeti.ClassFieldTheory.ringClassField` (TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean): the ring class field of an order of a number field, an intermediate field of the separable closure, with its unramifiedness, Artin equivalence with the Picard group and degree. The Hilbert class field `H` and the ring-class layers `L[r]` are instances. The attached CM curve over `H` and its torsion fields are not at the pin.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

- §4.3 `IsCanonicalGrossCharacter`: conjugation equivariance, principal values `±α`, conductor primes ramified in `K`; `canonicalGrossExistence`: existence exactly for `D ≠ 3` with `D` odd or `8 | D`, and the attached CM curve over `H`; Canonical Gross good reduction away from the discriminant: good reduction above every rational prime not dividing `D`. Assumed: the attached curve realises `φ ∘ N_{H/K}` and is an `H`-isogeny class of `Q`-curves.
- §4.1 The algebraic Hecke character of a CM abelian variety (Frobenius values at good primes, principal law), One-dimensional CM components of the Tate module (rank-one coefficient summands, arithmetic Frobenius value `j(ψ(v))`), Frobenius and infinity-type identities (`π_v π̄_v = q`; for a rational CM elliptic curve at an inert good rational prime `p`, the Frobenius over `K` is `−p` of norm `p²`).
- §1.2 CM period and de Rham pairings, with its period-lattice comparison: the ideal-twist curve `ℂ/aΛ` of a CM curve, its `O_K`-action and the period pairing `ω_{E/ℂ} × H₁(E(ℂ), Z) → ℂ`.
- §2.2 Normalized idele and torsion dictionary and §3.2 Exact ray-level field and generation criterion: the action of `Aut(ℂ/K)` on CM torsion and the ray-class field generated by torsion values.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

- §2.3a Hecke continuation and functional equation: for a unitary idele-class character `ω` the completed function `Λ_H(ω, s)` continues meromorphically, is entire unless `ω` is a norm character `|·|^{it}`, and satisfies `Λ_H(ω, s) = W(ω)Λ_H(ω⁻¹, 1 − s)` with `|W(ω)| = 1`; norm twists translate the variable; any continuation agreeing with the Euler product on `Re s > 1` is this one. This is the target cited by AutomorphicLFunctionsAndLocalFactors under its identifiers AL.1.5.2 and AL.1.6.2.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors and ArithmeticGaloisRepresentations

- AL.1.1.1 Local quasi-characters, unramified characters and the conductor exponent; AL.1.3.1 the local factors `ε(s, ω, ψ)`; AL.1.3.4 The local Gauss sum; AL.1.3.5 Explicit local ε-factors (the unramified formula `ω(ϖ^ν)q^{(1/2−s)ν}`, the ramified formula with the Gauss sum, and the archimedean values `i^a` over `ℝ` and `i^{max(a,b)}` over `ℂ` for the standard additive characters).
- AL.5.1.1 Finite Euler corrections at critical points (`L^S = E_S L`, orders add) and AL.5.3.2 The functional-equation sign at the centre (sign `−1` at the centre forces a zero).
- ArithmeticGaloisRepresentations §2.7, Root-number product formula: Hecke's root number of a unitary idele-class character is the product of its local constants.

### From LubinTateFormalModulesAndQuasiCanonicalLifts

- §2.1 Finite-height torsion, §2.2 The π-adic Tate module, §2.3 Lubin–Tate division fields (the `π^m`-division field is totally ramified of degree `(q − 1)q^{m−1}` and generated by a primitive point), §2.4 The Lubin–Tate character.
- §4.3 The unramified Honda–Lubin–Tate comparison (over `O = W(F_{p²})`, a formal group with `q`-Frobenius `[sp]`, `s = ±1`, is strictly isomorphic to the Lubin–Tate group for `sp`) and §4.4 The supersingular elliptic comparison (a Weierstrass curve over `O` with `#W̄(F_{p²}) = p² + 1 − 2sp` has `p²`-Frobenius `[sp]` and Lubin–Tate parameter `sp`). The sign convention `a_{p²} = −2p ↔ π = −p` is the one fixed there. These sections concern connected formal groups.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory and NeronModelsAndSemistableAbelianVarieties

- FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8 (the Tate module of a `p`-divisible group over a mixed-characteristic base), R07.1.9 (the connected–étale sequence over a henselian local base), R07.1.12–R07.1.13 (commutative formal Lie groups; connected `p`-divisible groups are `p`-divisible formal Lie groups) and R07.1.14 (the dimension of a `p`-divisible group).
- NeronModelsAndSemistableAbelianVarieties §5.1 Néron–Ogg–Shafarevich: an abelian variety over a discretely valued field whose `ℓ`-adic Tate module is unramified for some `ℓ` different from the residue characteristic has good reduction.

### From TauCetiRoadmap.SelmerIwasawaCohomology

- §0.8 and §0.9: the `p`-adic and `S`-unit Kummer identifications `H¹(G_{F,S}, Z_p(1)) ≅ Z_p ⊗ O_{F,S}×`, compatible with restriction and with corestriction against the norm. §0.11: cup products and Shapiro under Kummer. §3.1 Iwasawa cohomology and §3.2 Shapiro's lemma for Iwasawa cohomology. §3.6: semilocal cohomology and descent. §3.7: the cyclotomic twist isomorphism of Iwasawa cohomology, the model for §2.9.

### From TauCetiRoadmap.PadicHodgeRegulators

- §1.4 Kato's dual exponential `exp* : H¹(K, V) → Fil⁰ D_dR(V)`, its kernel `H¹_g` and its adjunction with `exp`. §1.7 compatibility with twists, restriction and corestriction. §1.11 semilocal Bloch–Kato maps `exp*_{A,V}` on `A = F ⊗ Q_p`, componentwise and compatible with Shapiro.

### From TauCetiRoadmap.PadicFamilies and NoncommutativeAndEquivariantIwasawa

- PadicFamilies §4.0.1 Geometric classes, moments and norm relations: the normalised theta unit `_cθ_E` on an elliptic curve over a base on which `c` is invertible, `c` prime to `6`, with divisor `c²[0] − [c]⁎[0]`, the distribution identity under multiplication by integers prime to `c`, base change, the isogeny norm for isogenies of degree prime to `c`, and Kato's `q`-expansion normalisation.
- NoncommutativeAndEquivariantIwasawa §4.3: the Siegel-function elliptic units of the ray class fields of a class-number-one CM field; cited for the comparison of scope, not consumed.

### From TauCetiRoadmap.ModularSymbolsPadicLFunctions and GL2AutomorphicRepresentationsAndTransfer

- ModularSymbolsPadicLFunctions §1.2: twisted Mellin formula and algebraicity of normalised critical values of newforms; §4.3: a field embedding `σ` carries the algebraic normalised critical coordinates of `f` to those of `f^σ`. No transport of complex periods is assumed.
- GL2AutomorphicRepresentationsAndTransfer R17.4.16: quadratic automorphic induction of a Hecke character `θ` of `K`, cuspidal exactly when `θ ≠ θ^c`, with `L(s, AI θ) = L(s, θ)`; for `η` of type `(1,0)` it gives the weight-two newform `θ_η`.

### From TauCetiRoadmap.AutomorphicPadicLFunctionsPartII and PadicMeasuresIwasawaAlgebras

- AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2 and 8.5: the paired complex and ordinary periods and bounded ray-class measure for an imaginary quadratic field at a split valuation prime `ℓ`, with critical moments, local Gauss factors and Euler depletion. Section 4.5a compares these normalisations with Finis's; it consumes no ordinary measure at an inert prime.
- PadicMeasuresIwasawaAlgebras §§1.7, 4.3 and 4.5: measures as completed group algebras, uniformizer-power preparation and the one-variable power-series coordinate, used to transfer the weight-one lower bound to the twisted measure.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

- §2.1: the subspace theorem with finitely many places; in two variables, solutions of the product inequality lie on finitely many lines. §2.3: Ridout's `p`-adic approximation theorem for algebraic targets (`∏_{p∈S} min(1, |ξ − α_p|_p) ≤ C H(ξ)^{−κ}` has finitely many rational solutions for `κ > 2`).

### From the Tau Ceti roadmaps on main

- GlobalNumberFields Layer 9 (Hecke and ray class characters, local components, finite conductor), Layer 10 (archimedean characters, infinity types, norm twists), Layer 11 (orders, conductors, Picard groups).
- ClassFieldTheory Layer 13 (Hilbert and ray class fields, ring class fields of quadratic orders with `Gal ≅ Pic(O)`, and Artin symbols of principal ideals; the anticyclotomic `Z_l` and `Z_p` quotients of the ring-class towers are derived here in §§0.2 and 0.6).
- Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitely many primes in a Frobenius class after finite exclusions).
- LocalFieldsRamification Layer 2 (unramified extensions, unit-root extensions `X^d − u`, `p ∤ d`) and Layer 3 (ramification; a totally ramified and an unramified extension meet in the base).
- EllipticCurves Layer 1 (invariant differential, formal group), Layer 2 (torsion, Weil pairing, faithful Tate realisation of endomorphisms), Layer 3 (Frobenius polynomial over finite fields).
- ArithmeticDirichletSeries Layer 3 (local factors and Euler products) and Layer 5 (polynomial bounds for ideal counts and partial summation).

## How to read the build

Layer 0 fixes the carriers (anticyclotomic characters, the `p`-anticyclotomic family, Euler factors and central values) and the data (the integral period, the auxiliary prime and characters). Layer 1 computes root numbers, proves the local Fröhlich–Queyrut theorem that the twisted signs need, and derives the zeros the signs force; it needs only Layer 0 and the local factors. Layer 2 constructs Kato's CM theta functions, elliptic units, zeta elements and realisations; the integral twisting comparison (§2.9) precedes the reciprocity laws and the BKO integral class that use it. Layer 3 builds the torsion and ring-class towers and applies Lubin–Tate theory at `π = −p`. Layer 4 develops Finis's scalar theta functions and the weight-one divisibility theorem, then compares ordinary moments to obtain all critical weights at split valuation primes; it is independent of Layers 1–3. Layer 5 specialises Finis to the canonical family to obtain the unit theorem and the coefficient descent; it uses Layers 0, 1, 2 and 4. Layer 6 proves Rohrlich's lattice count, Jia's average and the nonvanishing and parity theorems; it uses Layers 0 and 1. The Lean acceptance test states the parity dichotomy (§6.5) and Rohrlich's two bounds (§6.1).

The identifiers NCM.0–NCM.5 of the former numbering name the following sections.

| Former numbering | Sections here |
| --- | --- |
| NCM.0 | §§0.4–0.6, 1.1, and the dual and Tate-twist dictionary of §2.4 |
| NCM.1 | §§2.7–2.10 |
| NCM.2 | §§3.1–3.5 |
| NCM.3 | §§1.2–1.5 |
| NCM.4 | §§5.1–5.5 |
| NCM.5 | §§6.1–6.4, 5.6, 5.7 |

## Layer 0: CM data, characters and central values

### 0.1 Conjugation-equivariant characters of type (1,0)

Define `IsEquivariantTypeOneZero ι φ`, for a Hecke character `φ` of a CM field `K` (Mathlib's `IsCMField`; this roadmap applies it to imaginary quadratic `K`) and an embedding `ι : K → ℂ`, by two conditions on the ideal character modulo the finite conductor (`conductorModulus φ`, §0.3): `φ((x)) = ι(x)` for every `x ∈ K×` with `x ≡ 1` modulo the conductor, and `φ(ā) = conj φ(a)` for every pair of fractional ideals `a`, `ā` prime to the conductor. The first condition fixes the archimedean component `z ↦ z⁻¹`: by `HeckeCharacter.idealCharacter_apply_toPrincipalIdeal` the archimedean component equals `ι(x)⁻¹` on the elements `x ≡ 1`, and these are dense in `ℂ×` by weak approximation at the archimedean place and the primes dividing the conductor, so continuity determines it. That congruence subgroup has infinite index in `K×` (its elements are units at the conductor primes), and density, not finite index, is what is used. So the character is algebraic of ideal type `(1,0)` for `ι`. Prove that such a `φ` satisfies `φ((n)) = κ_K(n) n` for every rational integer `n` prime to the conductor, and conversely that this rational-principal law together with type `(1,0)` gives equivariance (Jia, Property 1, pp.3–4; JIA24 line 126). Prove that the conductor `f` is stable under conjugation and that `φ φ̄ = N` on ideals prime to `f`. *Needs:* Tau Ceti `HeckeCharacter.idealCharacter`, `HeckeCharacter.idealCharacter_apply_toPrincipalIdeal`; GlobalNumberFields Layers 1, 9–10 (weak approximation, Hecke characters, infinity types).

API:

- The rational-principal law: for `n ∈ Z` prime to `f`, `φ((n)) = κ_K(n) n`; in particular `φ((p)) = −p` for an inert `p ∤ f`.
- Norm relation: `φ(a) conj φ(a) = N(a)` for `a` prime to `f`, so `|φ(a)| = N(a)^{1/2}`.
- Conjugation stability: `f̄ = f`.
- Twists: if `ρ` is an anticyclotomic character of finite order, `φρ` satisfies the conjugation law `φρ(ā) = conj(φρ(a))` on ideals prime to its conductor, and `L(φ̄ρ, s) = L(φρ⁻¹, s)` by `a ↦ ā`.
- Canonical characters: an `IsCanonicalGrossCharacter` of ComplexMultiplicationAndExplicitReciprocity §4.3 satisfies the predicate.

**Checks.**

- For `y² = x³ − x` over `K = Q(i)`, the character with `φ((−1 + 2i)) = −1 + 2i` at the prime of norm `5` and `φ((7)) = −7` at the inert prime `7` satisfies the rational-principal law: `κ_K(7) = −1`, and `−7 = κ_K(7)·7`. Omitting the quadratic character gives the wrong value `+7`; inverting `κ_K` does not change it (`κ_K(7)⁻¹ = −1`), while inverting the whole character gives `−1/7`.
- The inverse character `φ⁻¹` has archimedean component `z ↦ z` and fails the first condition: `φ⁻¹((x)) = ι(x)⁻¹`, not `ι(x)`.
- Agreement with Tau Ceti: at a prime `v ∤ f`, the ideal value equals `φ.finiteComponent v (ϖ_v)` for any uniformizer `ϖ_v`, by `HeckeCharacter.idealCharacter_apply_prime`; a definition through `ϖ_v⁻¹` gives `φ(v)⁻¹`, of absolute value `N(v)^{−1/2}`.
- The norm character `N` itself has `N((x)) = x x̄`, not `ι(x)`; it is excluded.
- Density without finite index: for `K = Q(i)` and conductor `(1 + i)³`, the elements `x ≡ 1` have valuation `0` at `1 + i`, so the cosets `(1 + i)^n U`, `n ∈ Z`, are pairwise distinct and the subgroup `U` has infinite index in `K×`; it is still dense in `ℂ×`, which is all the type argument uses.

### 0.2 Anticyclotomic characters and the p-anticyclotomic family

Define `IsAnticyclotomic χ`, for a Hecke character `χ` of a CM field `K`, by `χ(ā) = χ(a)⁻¹` for every pair of fractional ideals `a`, `ā` prime to the conductor of `χ`. Define `IsPAnticyclotomic p v χ`, for a natural number `p` and a finite prime `v` of `K` (applied with `p` an odd prime inert in the imaginary quadratic `K` and `v = pO_K`), by: `χ` has finite order, a power of `p`; `χ` is anticyclotomic; `χ` is unramified at every finite prime other than `v`. Prove that an anticyclotomic character of odd finite order is trivial on the ideles of `Q`, hence a ring class character, and that for `p` odd and inert, the characters of the family are exactly the characters of finite order of the maximal anticyclotomic pro-`p` extension of `K` unramified outside `p`; when `p ∤ h_K` this is the anticyclotomic `Z_p`-extension (ClassFieldTheory Layer 13; Jia, Introduction, p.1, JIA24 line 18). Prove the conductor formula: if `p ∤ h_K` and `χ` has exact order `p^n`, `n ≥ 1`, then `conductorExponent v χ = n + 1`; the trivial character has exponent `0`. Prove that for every `p` odd and inert (including `p | h_K`) the family contains infinitely many characters of even and infinitely many of odd conductor exponent: the `p`-part of `Pic(O_{p^c})` grows strictly with `c` for `c ≥ 2`, so each large `c` is the conductor exponent of some character. *Needs:* Tau Ceti `HeckeCharacter.IsFiniteOrder`, `HeckeCharacter.conductorExponent`, `TauCeti.ClassFieldTheory.ringClassField`; ClassFieldTheory Layer 13; GlobalNumberFields Layer 11.

API:

- The family is closed under products and inverses, and `c(χ⁻¹) = c(χ)`.
- An anticyclotomic character of odd order is trivial on every conjugation-stable ideal prime to its conductor: `χ(b) = χ(b̄) = χ(b)⁻¹` and `χ(b)` has odd order.
- For `p ∤ h_K`, the `p`-part of `Gal(K[p^∞]/K)` is `Z_p` and the characters of exact order `p^n` have conductor `p^{n+1}`.
- An odd-order anticyclotomic character unramified at `p` satisfies `χ((p)) = 1`; for a character ramified at `p` the ideal value at `(p)` is not defined.

**Checks.**

- For `K = Q(√−7)`, `p = 5`: the ring class group of conductor `5^{m}` has `5`-part of order `5^{m−1}`, so a character of order `5` first appears at conductor `25` (`c = 2`), and one of order `25` at conductor `125` (`c = 3`). Assigning `c = n` would give conductor `5` to an order-`5` character, but the ring class group of conductor `5` has order `(5 + 1)/1 = 6`, prime to `5`.
- `K = Q(√−31)` has class number `3` (reduced forms `(1,1,8)`, `(2,−1,4)`, `(2,1,4)`) and `3` is inert (`−31 ≡ 2 mod 3` is a nonresidue). A nontrivial character of the class group has order `3`, is anticyclotomic and unramified everywhere, so it lies in the family for `p = 3` with `c = 0`, not `c = 2`: the order-to-conductor rule needs `p ∤ h_K`.
- A character of `5`-power order of the cyclotomic `Z_5`-extension (factoring through the norm to `Q`) satisfies `χ(ā) = χ(a)` and is not anticyclotomic unless trivial.
- A character ramified at only one of the two primes above a split `l` is not anticyclotomic: conjugation exchanges the primes and would force equal conductor exponents.
- The trivial character belongs to the family with `c = 0`; the formula `c = n + 1` is not applied to it.
- Values on a conjugate pair: `χ(a) = ζ_5`, `χ(ā) = ζ_5⁻¹` satisfies the anticyclotomic law; `χ(a) = χ(ā) = ζ_5` does not.

### 0.3 Primitive Euler factors and central values

Define `conductorModulus η` as the finite conductor of `η` with no real places; it is the modulus on whose prime-to ideals `HeckeCharacter.idealCharacter` is defined. Define `eulerFactor η ϖ v s`, for uniformizers `ϖ`, as `(1 − η(ϖ_v) N(v)^{−s})⁻¹` when `η` is unramified at `v` and `1` otherwise. Define `HasCentralValue η ϖ z` by: there is an entire function `F` with `HasProd (v ↦ eulerFactor η ϖ v s) (F s)` for `Re s > 3/2` and `F 1 = z`. Prove that for `η = φρ` with `φ` as in §0.1 and `ρ` of finite order, `HasCentralValue η ϖ z` holds for exactly one `z`, namely the value at `1` of the analytic continuation of `L(η, s)`, which is entire: the completed function of the unitary character `η|·|^{1/2}` is entire by AnalyticNumberTheoryPartI §2.3a, since that character is not a norm character (its archimedean component has angular part `z/|z|` to a nonzero power), and the archimedean gamma factor has no zeros. Prove that for a finite set `S` of primes, `L_S(η, 1) = E_S(1) L(η, 1)` with `E_S(1) ≠ 0`: at an unramified prime the deleted polynomial is `1 − η(v)N(v)^{−1}`, of parameter of absolute value `N(v)^{−1/2} < 1` (AL.5.1.1 Finite Euler corrections at critical points). *Needs:* Tau Ceti `HeckeCharacter.finiteComponent`, `HeckeCharacter.conductorExponent`, `HeckeCharacter.finiteConductor`; AnalyticNumberTheoryPartI §2.3a; AL.5.1.1 Finite Euler corrections at critical points; ArithmeticDirichletSeries Layer 3.

API:

- `conductorModulus η` has finite part `finiteConductor η`, which is nonzero, and empty infinite part; a fractional ideal is prime to it exactly when it is prime to every prime at which `η` is ramified.
- The Euler factor is independent of the uniformizer at unramified primes and equals `(1 − η(v)N(v)^{−s})⁻¹` with the ideal value `η(v)`.
- Absolute convergence: for `|η(v)| = N(v)^{1/2}` the product converges absolutely and unconditionally for `Re s > 3/2`, and no factor has a zero denominator there.
- Uniqueness: two entire functions agreeing with the product on `Re s > 3/2` agree everywhere, so `HasCentralValue η ϖ z` and `HasCentralValue η ϖ z'` give `z = z'`.
- Nonvanishing transfers between primitive and deleted values; vanishing transfers from primitive to deleted values for every `S`.

**Checks.**

- The trivial character has `conductorModulus 1` with finite part the unit ideal, so every fractional ideal is prime to it; a character of conductor `p²` at the inert `v` has finite part `v²` and `(p)` is not prime to it.
- `conductorModulus η⁻¹ = conductorModulus η`, since inversion preserves every conductor exponent; for `η = φν` with `φ` of conductor `f`, `ν ∈ X_23` of order `23` and `23 ∤ N(f)`, the finite part is `f·23²O_K`, with both primes above `23` to the second power, not `f·23O_K`.
- The infinite part is empty: for `K` imaginary quadratic there are no real places, so the modulus is the finite conductor itself and no sign condition at infinity is lost.
- At a ramified prime the factor is `1`, not `(1 − 0)⁻¹` computed from an extended-by-zero value of a wrong modulus; for `η` ramified at both primes above `l`, the `l`-factors are `1` (§5.3).
- For `φ` of the curve `y² = x³ − x` at the inert prime `7`, `eulerFactor` at `s = 1` is `(1 − (−7)/49)⁻¹ = (1 + 1/7)⁻¹ = 7/8`; using `+7` gives `7/6`.
- Uniformizer independence: at an unramified `v`, replacing `ϖ_v` by `uϖ_v` with `u` a unit leaves `η(ϖ_v)` unchanged since `η_v` is trivial on units; at a ramified `v` the value would change, which is why the factor there is `1`.
- For `p` inert with `p ∤ f` and the trivial `p`-character, deleting the `p`-factor gives `E_{{p}}(1) = 1 − φ((p))/p² = 1 + 1/p`, which is nonzero but has `v_p = −1`; deletion at `p` is harmless for nonvanishing and changes valuations.
- Without the entire-function clause the value at `1` would not be determined: the function equal to the Euler product on `Re s > 3/2` and assigned the value `0`, respectively `1`, at `s = 1` would witness both `HasCentralValue η ϖ 0` and `HasCentralValue η ϖ 1`. Entirety and the identity theorem exclude such assignments.

### 0.4 The integral CM period

Construct the period datum: for a CM curve `E/H` attached to `φ ∘ N_{H/K}` with good reduction at every place above the inert `p`, choose a smooth integral Weierstrass model at the place above `p` fixed by `ι_p` and its Néron differential `ω`. After replacing `E` by a conjugate in its ideal-class orbit, choose `Ω ∈ ℂ×` with period lattice of `(E, ω)` equal to `Ω O_K`. Define the normalised value `A_S(η; E, ω, Ω) = Ω⁻¹ L_S(η, 1) ∈ ℂ`. Its algebraicity for `η = φ̄χ`, `χ` of finite order, and hence its `p`-adic avatar under `ι_p`, is a consequence of Kato's reciprocity law (§2.6), not part of this construction; no map `ℂ → C_p` is used (BKO, §3.0.2, p.951). *Needs:* ComplexMultiplicationAndExplicitReciprocity §1.2 CM period and de Rham pairings (with its period-lattice comparison), §4.3 `canonicalGrossExistence` and Canonical Gross good reduction away from the discriminant; AnalyticNumberTheoryPartI §2.3a.

API:

- The integration image of `H₁(E(ℂ), Z)` against `ω` is `Ω O_K`.
- Changing `Ω` to `εΩ`, `ε ∈ O_K×`, multiplies `A_S` by `ε⁻¹` and preserves every valuation.
- Changing `ω` to `vω` with `v ∈ H×` a unit at the place above `p` changes `Ω` to `vΩ` and `A_S` to `v⁻¹A_S`.
- `A_S(η) ≠ 0` if and only if `L_S(η, 1) ≠ 0`.
- Extending the algebraic coefficient field carries `A_S` to the same value under the extended embedding.

**Checks.**

- Scaling `ω` by `2` at `p ≥ 5` gives `A_S/2`, still a `p`-unit when `A_S` is.
- Scaling `ω` by `p` destroys Néron normalisation and lowers `v_p(A_S)` by one; it is not an allowed change.
- For `K = Q(√−5)` (`h_K = 2`) and the nonprincipal ideal `a = (2, 1 + √−5)`, the lattice `a` is not `Ω O_K` for any `Ω`, since `a` would be principal; the conjugate-curve step is required.
- If `L_S(η, 1) = 0` then `A_S = 0`; the nonzero period creates no unit.
- At an inert `p` the ordinary `p`-adic period of a CM curve does not exist (the formal group has height two), while `Ω` is defined.

### 0.5 The auxiliary split prime

Prove: for `K` imaginary quadratic, `p ≥ 5` inert in `K` and a finite set `S` of rational primes, there are infinitely many primes `l ∉ S` with `l ≥ 5`, `l` split in `K` and `l ≢ 1 mod p`; in particular `p ∤ (l − 1)` (BKO, §3.0.2, p.951, the hypotheses before (3.3)). Proof route: `p` is unramified in `K`, so `K` is not the quadratic subfield of `Q(μ_p)` and the two fields are linearly disjoint; take the Frobenius class `(1, a)` with `a ≢ 1 mod p` in `Gal(K(μ_p)/Q)` and apply Dirichlet-density Chebotarev. *Needs:* Chebotarev Layer 10; ClassFieldTheory Layer 13.

**Checks.**

- `K = Q(√−7)`, `p = 5`: `l = 23` splits (`−7 ≡ 16 = 4²` mod `23`) and `23 ≡ 3 mod 5`; `l = 11` splits (`−7 ≡ 4` mod `11`) but `11 ≡ 1 mod 5` is excluded.
- `l = 13`: `−7 ≡ 6 mod 13`, and the nonzero squares modulo `13` are `1, 3, 4, 9, 10, 12`, so `(−7/13) = −1` and `13` is inert in `Q(√−7)`; it is not an auxiliary prime although `13 ≢ 1 mod 5`.
- For `p = 3` the statement requires `l ≡ 2 mod 3`; the BKO setting `p ≥ 5` is kept.

### 0.6 The auxiliary anticyclotomic characters

Define `X_l`, for a prime `l ≥ 5` split in `K` with `l ∤ h_K N(f)` and `p ∤ (l − 1)`, as the set of characters of finite order of the anticyclotomic `Z_l`-extension `K_l^{ac}/K`, viewed as Hecke characters through the arithmetic Artin map, with values embedded by `ι_∞` and `ι_p`. For `ν ≠ 1` of exact order `l^r` write `L[r]` for its field layer and `l^m O_K`, `m = r + 1`, for its conductor; for `ν = 1`, `m = 0` (BKO, §3.0.2, pp.951–953; the published text uses one letter for order, layer and conductor). Prove that the depth-`m` anticyclotomic principal-unit quotient has order `l^{m−1}` since `l ∤ h_K` and `l ∤ #O_K×`. *Needs:* ClassFieldTheory Layer 13; GlobalNumberFields Layers 9–11; Tau Ceti `TauCeti.ClassFieldTheory.ringClassField`; Mathlib `MonoidAlgebra.lift`.

API:

- `X_l` is an abelian group, the Pontryagin dual of `Gal(K_l^{ac}/K) ≅ Z_l`, isomorphic to `Q_l/Z_l`; `ν⁻¹ = ν ∘ c`.
- A character of exact order `l^r` factors through `L[r]` and no smaller layer, and its conductor is `l^{r+1} O_K` for `r ≥ 1`.
- Every element of `X_l` satisfies `IsAnticyclotomic`, has odd order and is unramified at `p`.
- Group-algebra evaluation is `MonoidAlgebra.lift` applied to `ν`: `[g] ↦ ν(g)`.
- Any embedding of the value field transports evaluation, order and conductor.

**Checks.**

- For `r = 1` the field layer has degree `l` and the conductor is `l²`.
- `ν = 1` has `m = 0`; the rule `m = r + 1` is not applied.
- For `ν(g) = ζ_l`, `[g]` evaluates to `ζ_l`, which differs from `ζ_l⁻¹` since `ζ_l² ≠ 1` for odd `l`.
- A cyclotomic `l`-power character is not in `X_l` unless trivial.

### Examples

For `K = Q(√−7)`, `p = 5`, `l = 23`: `X_23` has characters of exact order `23` with conductor `23² O_K`; each is anticyclotomic, odd and unramified at `5`. The character of `y² = x³ − x` over `Q(i)` is equivariant of type `(1,0)` with `φ((7)) = −7`.

### Dependencies

Mathlib; Tau Ceti `HeckeCharacter`, the ray-class carriers and `ringClassField`; GlobalNumberFields Layers 1, 9–11; ClassFieldTheory Layer 13; Chebotarev Layer 10; ArithmeticDirichletSeries Layer 3; AnalyticNumberTheoryPartI §2.3a; AL.5; ComplexMultiplicationAndExplicitReciprocity §§1.2, 4.3.

## Layer 1: Root numbers and forced central zeros

### 1.1 The canonical root number

Prove: if `φ` is a canonical Gross character (`IsCanonicalGrossCharacter`) of `K` with fundamental discriminant `−D` and `D` odd, then `W(φ) = W(φ̄) = (2/D)`. In particular `W(φ) = +1` exactly when `2` splits in `K`, that is `D ≡ 7 mod 8`; this split case is the one used in Layer 5. Proof route: the conductor of `φ` is `√−D O_K` (Rohrlich, Root numbers, Proposition 1.4, p.14), which is the different, so every finite place prime to `D` contributes `1`. In Rohrlich's normalisation of the local root numbers (Root numbers, Lecture 2 §5.1, (2.41)–(2.42), pp.34–35) the archimedean factor of `φ_∞(z) = z⁻¹` is `i^{−1} = −i`, and the factor at an odd ramified `q` is `i^{δ_q}(2/q)∏_{r | D, r ≠ q}(q/r)`, with `δ_q = 0` or `1` as `q ≡ 1` or `3 mod 4`; quadratic reciprocity collapses the product to `(2/D)` (Rohrlich, Root numbers, Proposition 1.5, p.14, and Lecture 2 §5.2, (2.44)–(2.49), pp.35–36; BKO, proof of Theorem 3.4, p.953). To pass to the standard additive character of AL.1, replace `ψ_v` by `ψ_v(−·)` at every place: this multiplies the local factor at `v` by `φ_v(−1)`, turns the archimedean factor into `+i` (AL.1.3.5(iv)) and multiplies each ramified factor by `φ_q(−1)`; the product of the changes is `φ(−1) = 1`, so the global sign is unchanged. Conjugation reindexes the ideal series, so `φ̄` has the same completed function and the same sign. For `8 | D` there are two canonical families with opposite root numbers; class-character twists preserve the root number within each family (Rohrlich, Root numbers, Proposition 1.6, p.15). *Needs:* ComplexMultiplicationAndExplicitReciprocity §4.3; AL.1.3.5 Explicit local ε-factors; AnalyticNumberTheoryPartI §2.3a; ArithmeticGaloisRepresentations §2.7 Root-number product formula.

**Checks.**

- For `D = 8`, `h_K = 1`: each sign family has one character, and the only class-character twist is the identity, which preserves its sign (Rohrlich, Proposition 1.6, p.15).
- `K = Q(√−7)`: `2` splits (`−7 ≡ 1 mod 8`) and `(2/7) = +1`.
- `K = Q(√−11)`: `2` is inert (`−11 ≡ 5 mod 8`) and the theorem gives `W(φ) = (2/11) = −1`; the split hypothesis of Layer 5 is what selects the sign `+1`.
- Conventions: for `K = Q(√−7)` Rohrlich's factors at `∞` and `7` are `(−i, i)`, of product `1`. Both `φ_∞(−1)` and `φ_7(−1)` equal `−1` (the global product of the `φ_v(−1)` is `1` and every other place is unramified), so AL.1's factors are `(i, −i)`, also of product `1`. Changing only the archimedean factor gives `(i, i)` and the wrong sign `−1`.
- `D = 3` has no canonical character (the unit `ζ₃` violates the principal-sign rule of ComplexMultiplicationAndExplicitReciprocity §4.3), so `(2/3) = −1` is never asserted as a root number.

### 1.2 Auxiliary twists preserve the root number

Prove: for `φ` as in §0.1 with `p ∤ f`, and every `ν ∈ X_l`, `W(φν) = W(φ)` and `W(φ̄ν) = W(φ̄)`. Proof route: at the two primes over `l` the components of `ν` are inverse to each other under conjugation, with equal conductor exponents; pair their Gauss sums by `ε(ν_λ)ε(ν_λ⁻¹) = ν_λ(−1) = 1`, and the unitary values of `φ` at the two primes multiply to `φ((l))/l = κ_K(l) = 1`. At every other place `ν_v` is unramified and the ratio of local root numbers is `ν_v` at `ϖ_v^{a(φ_v) + n(ψ_v)}` (AL.1.3.5(i)–(ii)); the product is `ν(f 𝔡_K)`, the conductor times the different, a conjugation-stable ideal, on which an odd-order anticyclotomic character is `1` (BKO, §3.0.2, p.951; Greenberg, §1, pp.246–247; Rohrlich, Root numbers, Lecture 2 §5.1, (2.39)–(2.43), pp.34–35; Finis, proof of Corollary 2.3, p.778). *Needs:* §§0.1, 0.6; AL.1.1.1 Local quasi-characters, unramified characters and the conductor exponent, AL.1.3.5 Explicit local ε-factors; ArithmeticGaloisRepresentations §2.7 Root-number product formula.

**Checks.**

- `ν = 1`: both sides agree trivially.
- A character ramified at only one prime over `l` is not in `X_l`; for it the pairing step fails.
- The odd-order hypothesis is used: a genus character of a field with even class number is anticyclotomic of order `2`, and can take the value `−1` on a ramified prime dividing `f𝔡_K`, so the ratio `ν(f𝔡_K)` can be `−1`.

### 1.3 The local Fröhlich–Queyrut theorem

Prove: let `F` be a local field of characteristic zero, `E/F` a quadratic field extension with conjugation `x ↦ x̄`, `ψ_F` a nontrivial additive character of `F` and `ψ_E = ψ_F ∘ Tr_{E/F}`, and `χ` a quasi-character of `E×` trivial on `F×`. Then `χ` is unitary (of finite order when `F` is nonarchimedean, since `E×/F×` is then compact and totally disconnected), the value `χ(Δ)` is the same for every `Δ ∈ E×` with `Tr_{E/F}(Δ) = 0` and equals `±1` (because `Δ² ∈ F×`), and `ε(1/2, χ, ψ_E) = χ(Δ)` (the theorem of Fröhlich and Queyrut, whose local formula is recorded in Queyrut 1974, p.135, QUEYRUT74 lines 86–97). Prove on the way that `ε(1/2, χ, ψ_E)` does not depend on `ψ_F`: replacing `ψ_F` by `ψ_F(a·)`, `a ∈ F×`, multiplies it by `χ(a) = 1` (AL.1.3.1). Proof route: Fröhlich–Queyrut's local computation. Its inputs are the explicit factors and Gauss sums of AL.1.3.4–AL.1.3.5, the dependence on the additive character just stated, and the conjugation symmetry: `x ↦ x̄` fixes `ψ_E` and carries `χ` to `χ⁻¹` (since `χ(x x̄) = 1`), so `ε(1/2, χ, ψ_E) = ε(1/2, χ⁻¹, ψ_E)`, and with `ε(1/2, χ, ψ_E)ε(1/2, χ⁻¹, ψ_E) = χ(−1) = 1` this already gives `ε = ±1`; the computation identifies the sign with `χ(Δ)`. *Needs:* AL.1.3.1 the local factors `ε(s, ω, ψ)`, AL.1.3.4 The local Gauss sum, AL.1.3.5 Explicit local ε-factors; LocalFieldsRamification Layers 2–3.

API:

- Independence of `ψ_F` at the centre, for `χ` trivial on `F×`.
- `ε(1/2, χ, ψ_E) = ε(1/2, χ⁻¹, ψ_E) = ±1`.
- Compatibility with unramified twists on `F`: for `μ` an unramified character of `F×`, the formula for `χ` and for `χ ⊗ (μ ∘ N_{E/F})` are related by the unramified formula of AL.1.3.5(i).

**Checks.**

- `E/F` unramified with odd residue characteristic: a character trivial on `F×` and unramified is trivial (a uniformizer of `F` is one of `E`), so `ε = 1`; a trace-zero `Δ = √u` with `u` a nonsquare unit is a unit and `χ(Δ) = 1`.
- `E = F(√ϖ_F)` ramified with odd residue characteristic, `χ` unramified with `χ(√ϖ_F) = −1`: then `χ(ϖ_F) = 1`, so `χ` is trivial on `F×`. With `ψ_F` of conductor exponent `0`, `ψ_E` has conductor exponent the different exponent `1`, and AL.1.3.5(i) gives `ε(1/2, χ, ψ_E) = χ(ϖ_E) = −1`; the trace-zero element `Δ = √ϖ_F` gives `χ(Δ) = −1`.
- `E/F = ℂ/ℝ`, `χ(z) = (z/z̄)^k`: AL.1.3.5(iv) gives `ε = i^{2|k|} = (−1)^k`, and `χ(i) = (i/(−i))^k = (−1)^k`.
- Negative control: for the unramified `χ` on `F(√ϖ_F)` with `χ(√ϖ_F) = i`, `χ(ϖ_F) = −1`, so `χ` is not trivial on `F×`; replacing `ψ_F` by `ψ_F(ϖ_F·)` multiplies `ε(1/2, χ, ψ_E)` by `−1` while `χ(Δ)` is unchanged, so no formula of this shape holds without triviality on `F×`.

### 1.4 The p-anticyclotomic conductor sign

Prove: let `p` be odd and inert, `φ` as in §0.1 with `p ∤ f`, `ν` anticyclotomic of odd finite order unramified at `p`, and `χ` in the `p`-anticyclotomic family with `c = conductorExponent v χ`. Then `W(φνχ) = (−1)^c W(φν)`, and the same with `φ̄`. When `p ∤ h_K` and `χ ≠ 1` has exact order `p^n`, `c = n + 1` (§0.2), so order `p` gives `c = 2` and order `p²` gives `c = 3`. Proof route: at `p`, `φν` is unramified with unitary uniformizer value `φ((p))ν((p))/p = −1` (§§0.1, 0.2) and `n(ψ_p) = 0`; the local root number of `χ_p` is `χ_p(Δ)` for a trace-zero `Δ ∈ Φ×` by §1.3, since `χ_p` is trivial on `Q_p×` (§0.2), and `χ_p(Δ) = 1` because `χ_p(Δ)² = χ_p(Δ²) = 1` and `χ_p` has odd order; the unramified twist contributes `(−1)^c` (AL.1.3.5(i)). At every other place the ratio is `χ` on the conjugation-stable ideal `f(φν)𝔡_K`, hence `1` (Greenberg, p.247, where `w(Ψρ) = (−1)^{n+1} w(Ψ)` in the supersingular case and `w(ρ) = +1` is attributed to Fröhlich–Queyrut; Queyrut 1974, p.135, QUEYRUT74 line 86; BKO, proof of Proposition 3.3(3), p.953). *Needs:* §§0.1, 0.2, 1.2, 1.3; AL.1.3.5 Explicit local ε-factors, AL.1.3.4 The local Gauss sum; ArithmeticGaloisRepresentations §2.7 Root-number product formula.

**Checks.**

- `p ∤ h_K`: `c = 2` (order `p`) preserves the sign; `c = 3` (order `p²`) reverses it.
- The trivial `χ` has `c = 0` and keeps `W(φν)`; the formula `c = n + 1` would assign it `c = 1` and reverse the sign.
- `K = Q(√−31)`, `p = 3`: the unramified class character of order `3` has `c = 0` and keeps the sign, although its order is `p`; the statement in terms of `c` covers `p | h_K`.
- At `p` the unitary value is `−1` because `p` is inert; for a split prime the same twist has two ramified places and no parity factor.

### 1.5 Wrong-sign central values vanish

Prove: with the hypotheses of §1.4, if `(−1)^c W(φν) = −1` then `L(φνχ, 1) = 0` and `L_S(φνχ, 1) = 0` for every finite `S`; likewise for `φ̄νχ`. Proof route: `η = φνχ` satisfies `η η̄ = N`, so its dual is `η̄`, and `η̄(a) = η(ā)`, so `L(η̄, s) = L(η, s)` (Jia, p.2, JIA24 lines 42–61); the completed function satisfies `Λ(s) = W(η)Λ(2 − s)` (AnalyticNumberTheoryPartI §2.3a, after the shift by `|·|^{1/2}`), and sign `−1` gives `Λ(1) = −Λ(1)`, so `Λ(1) = 0`; the archimedean factor at the centre is finite and nonzero; the Euler deletion polynomial is entire (AL.5.3.2 The functional-equation sign at the centre, AL.5.1.1 Finite Euler corrections at critical points; BKO, Proposition 3.3(3) and its proof, p.953). No converse is asserted from sign `+1`. *Needs:* §1.4; AnalyticNumberTheoryPartI §2.3a; AL.5.3.2 The functional-equation sign at the centre, AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- `W(φν) = +1`, `c = 2`: no zero is supplied; `c = 3`: a zero is forced.
- `χ = 1` with `W(φν) = −1`: `L(φν, 1) = 0`.
- A deleted value at a prime where the polynomial vanishes at `s = 1` would also vanish; the argument never divides by it.

### Examples

For `K = Q(√−7)`, `p = 5`, `φ` canonical: `W(φ) = +1` (§1.1); for `ν ∈ X_23`, `W(φν) = +1` (§1.2); for `χ` of order `5`, `c = 2` and `W = +1`; for order `25`, `c = 3`, `W = −1` and `L(φνχ, 1) = 0`. For `K = Q(√−11)` the canonical sign is `−1` (§1.1) and `7` is inert (`−11 ≡ 3 mod 7` is a nonsquare, and `h_K = 1`); for `ν = 1`, the `7`-anticyclotomic characters of order `7` (`c = 2`) have sign `−1` and central value `0`, and those of order `49` (`c = 3`) have sign `+1`.

### Dependencies

Layer 0; ComplexMultiplicationAndExplicitReciprocity §4.3; AnalyticNumberTheoryPartI §2.3a; AL.1, AL.5; ArithmeticGaloisRepresentations §2.7; LocalFieldsRamification Layers 2–3.

## Layer 2: Elliptic units and Kato's reciprocity law for CM characters

### 2.1 Kato's CM theta function

Let `K′` be a field containing `K` and `E/K′` an elliptic curve with an isomorphism `O_K ≅ End(E)`, normalised so that `O_K` acts on `Lie(E)` through the inclusion `K ⊂ K′`. Construct, for an integral ideal `a` of `O_K` prime to `6`, the unique `_aθ_E ∈ O(E ∖ E[a])×` with divisor `N(a)(0) − E[a]` and `N_b(_aθ_E) = _aθ_E` for every integer `b` prime to `a`, where `N_b` is the norm along multiplication by `b` (Kato 2004, §15.4, pp.252–253, by the argument of Proposition 1.3, pp.121–122). Prove: for `a = (c)` with `c ∈ Z` prime to `6`, `_{(c)}θ_E` is the theta unit `_cθ_E` of PadicFamilies §4.0.1 (Kato's (15.4.1)); for an `O_K`-linear isogeny `h : E → E′` of such curves whose kernel meets `E[a]` trivially, the norm along `h` sends `_aθ_E` to `_aθ_{E′}` (Kato's (15.4.2), printed without the kernel condition, which is necessary); the cocycle relation (15.4.3) between coprime-to-`6` ideals `a` and `b`; and, for a CM pair `(E, α)` of modulus `f` over `K(f)` (§2.2) and `a`, `b` prime to `6f`, the Artin-symbol relation (15.4.4) (Kato 2004, (15.4.1)–(15.4.4), pp.252–253). *Needs:* PadicFamilies §4.0.1; EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §1.2 (the period-lattice comparison).

API:

- Uniqueness: two units with the same divisor and the norm invariance agree.
- Principal ideals: `_{(c)}θ_E = _cθ_E` for `c ∈ Z` prime to `6`.
- Isogeny law: for an `O_K`-linear isogeny `h : E → E′` with `ker h ∩ E[a] = 0`, `h` maps `E[a]` bijectively onto `E′[a]` and the norm along `h` sends `_aθ_E` to `_aθ_{E′}`.
- Cocycle: `(_bθ_E)^{N(a)} · (pr_a^* {}_bθ_{E/E[a]})^{−1} = (_aθ_E)^{N(b)} · (pr_b^* {}_aθ_{E/E[b]})^{−1}`, with `pr_a : E → E/E[a]`; both sides have divisor `N(a)N(b)(0) − N(a)E[b] − N(b)E[a] + E[ab]`.

**Checks.**

- `a = (c)`: the CM refinement is Kato's `_cθ_E`; its divisor `c²(0) − E[c]` has degree `c² − c² = 0`.
- For `a` of norm `5` in `Z[i]`, `E[a]` has `5` points and the divisor `5(0) − E[a]` has degree `0`; a divisor `(0) − E[a]` has nonzero degree and is not principal.
- Kernel condition: on `E = ℂ/Z[i]` with `a = (5)`, the divisor of `_aθ_E` is `25(0) − E[5]`, whose pushforward along `[5]` is `25(0) − 25(0) = 0`, not `25(0) − E[5]`; so the norm along `[5]` is not `_aθ_E`. The isogeny `[2]` has kernel `E[2]`, which meets `E[5]` trivially, permutes `E[5]` and preserves the divisor.
- Without the norm invariance, `ζ·_aθ_E` for a root of unity `ζ` has the same divisor; since `N_b(ζθ) = ζ^{b²}N_b(θ)`, invariance for `b = 2` and `b = 3` (both prime to `a`) forces `ζ³ = ζ⁸ = 1`, so `ζ = 1`.

### 2.2 Canonical CM pairs and standard elliptic units

Construct, for an ideal `f` with `O_K× → (O_K/f)×` injective, the canonical CM pair `(E, α)` of modulus `f` over the ray class field `K(f)`: a CM curve with the normalised `O_K`-action and a torsion point with annihilator `f`, isomorphic over `ℂ` to `(ℂ/f, 1 mod f)`. Prove its uniqueness up to unique isomorphism, its universality (a CM pair of modulus `f` over a field `K′ ⊇ K` is the base change of the canonical pair along a unique `K(f) → K′`), and that for an ideal `a` prime to `f` the Artin symbol `σ_a` carries `(E, α)` to a pair isomorphic to `(E/E[a], α mod E[a])` (Kato 2004, §15.3, (15.3.1)–(15.3.3), pp.251–252). Define the standard elliptic unit of modulus `f` and twist `a` as the reciprocal of a theta value: `_az_f = _aθ_E(α)⁻¹ ∈ K(f)×`, for `a` prime to `6f` (Kato 2004, §15.5, p.253). Prove that `_az_f` is a `𝔭`-unit for every prime `𝔭 ∤ f`, and a unit when `f` has at least two prime divisors; norm compatibility: for `n ≥ 1` with `O_K× → (O_K/p^n f)×` injective, the norm from `K(p^{n+1}f)` to `K(p^n f)` sends `_az_{p^{n+1}f}` to `_az_{p^n f}`; and Kronecker's limit formula for the standard unit, `2 Σ_{σ ∈ Gal(K(f)/K)} χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹) · lim_{s→0} s⁻¹ L_{K,f}(χ, s)` for characters `χ` of `Gal(K(f)/K)`, where `|·|` is the ordinary complex absolute value, with `L_{K,f}(χ, s) = Σ_b χ(b)N(b)^{−s}` over ideals `b` prime to `f` (Kato 2004, (15.5.1), p.253, deduced from §3.8). *Needs:* §2.1; ComplexMultiplicationAndExplicitReciprocity §2.2 Normalized idele and torsion dictionary, §3.2 Exact ray-level field and generation criterion; ClassFieldTheory Layer 13.

API:

- Base change: a CM pair over a field `K′` is the base change of the canonical pair along a unique `K(f) → K′`.
- Norm compatibility in the `p`-tower on the levels where the units inject.
- Kronecker's limit formula for `_az_f`, with the sign above.
- Galois action: `σ_b(_az_f) = _aθ_{E/E[b]}(α mod E[b])⁻¹` for `b` prime to `f`.

**Checks.**

- `K = Q(i)`, `f = (3)`: `O_K× = {±1, ±i}` injects into `(Z[i]/3)×` of order `8`, so the canonical pair exists over `K(3)`, of degree `2` over `K`. For `f = (2)` the units `1` and `−1` have the same image in `(Z[i]/2)×`, so the map is not injective and the hypothesis fails.
- Direction of the principal isomorphism: for `a = (λ)` with `λ ≡ 1 mod f` the Artin symbol is trivial, and multiplication by `λ` maps `(E/E[a], α mod E[a])` isomorphically to `(E, α)`. For `E = ℂ/3Z[i]` and `λ = 4`, `E/E[a] = ℂ/(3/4)Z[i]`, and `z ↦ 4z` carries the lattice `(3/4)Z[i]` onto `3Z[i]` and `α = 1` to `4 ≡ 1 mod 3`; `z ↦ z/4` sends the lattice vector `3/4` to `3/16`, which is nonzero modulo `3Z[i]`.
- Sign of the unit: `K = Q(i)`, `f = (3)`, `a = (5)`, `χ = 1`. Here `L_{K,f}(1, s) = ζ_K(s)(1 − 9^{−s})` and `ζ_K(0) = −1/4`, so `lim_{s→0} s⁻¹ L_{K,f}(1, s) = −(log 3)/2` and the right side is `24 · (−(log 3)/2) = −12 log 3`. The ordinary norm logarithm is `log|N_{K(3)/K}(_az_f)| = −6 log 3`, so twice it is `−12 log 3`; the theta norm logarithm is `+6 log 3`.
- `f = (𝔮^k)` with a single prime divisor: `_az_f` need not be a unit at `𝔮`.

### 2.3 The elliptic zeta element and its smoothing

Let `G = Gal(K(p^∞f)/K)`, `Λ = Z_p[[G]]`, `Q(Λ)` its total quotient ring, and `n_0 ≥ 1` the least integer with `O_K× → (O_K/p^{n_0} f)×` injective. Define `H¹_{p^∞f}(T) = lim_{K′} H¹(O_{K′}[1/p], T)` over the finite extensions `K′` of `K` inside `K(p^∞f)`, and the zeta element `z_{p^∞f} = (N(a) − σ_a)⁻¹ (_az_{p^n f})_{n ≥ n_0} ∈ H¹_{p^∞f}(Z_p(1)) ⊗_Λ Q(Λ)`, for any `a` prime to `6pf` with `a ≠ O_K`, where `σ_a` is the Artin symbol: the system lives on the cofinal tail `n ≥ n_0` of levels admitting canonical pairs, and earlier finite layers are reached by corestriction, never by evaluation at a torsion point of a smaller modulus. Prove independence of `a` by the cocycle relation (15.4.4), and that `(N(a) − σ_a) z_{p^∞f}` lies in `H¹_{p^∞f}(Z_p(1))` for every `a` prime to `6pf` (Kato 2004, §15.6, (15.6.3), p.254). Prove that the ideal of `Λ` generated by all `N(a) − σ_a` is the unit ideal at every height-one prime, and that the image `z_{K′}` at a finite layer lies in `(O_{K′}[1/p]×) ⊗ Q` with the logarithmic Kronecker formula (Kato 2004, (15.6.4)–(15.6.5), pp.254–255). The unsmoothed element is not integral in general. *Needs:* §2.2; SelmerIwasawaCohomology §§0.8–0.9, 3.1.

API:

- Integrality of smoothed elements: `(N(a) − σ_a) z_{p^∞f} ∈ H¹_{p^∞f}(Z_p(1))`.
- Independence of the smoothing ideal.
- Specialisation at a finite layer `K′` through the localisation at non-zero-divisors whose images in `Q_p[Gal(K′/K)]` are invertible.

**Checks.**

- If `N(a) − σ_a` maps to a nonunit on a component (for instance `σ_a` acting by `N(a)` there), the unsmoothed component cannot be read off integrally; the smoothed one can.
- Membership in `H¹ ⊗ Q(Λ)` or in `H¹[1/p]` does not imply membership in `H¹`.
- Changing `a` to `b` multiplies the smoothed element by `(N(b) − σ_b)/(N(a) − σ_a)` and leaves `z_{p^∞f}` unchanged.
- Cofinal tail: for `K = Q(i)` and `f = O_K`, the units inject modulo `7`, so `n_0 = 1` for `p = 7`; modulo `2` they do not (`K(2) = K`), while modulo `4` they do and `K(4)` has degree `2`, so `n_0 = 2` for `p = 2`.

### 2.4 Kato's realisation, de Rham line and period map

Let `r ≥ 1` and `ψ` a Hecke character of `K` of type `(−r, 0)`; let `L ⊂ ℂ` be the field generated over `K` by the values of `ψ` on the finite ideles, a finite extension of `K`. Choose `f` contained in the conductor of `ψ` with `O_K× → (O_K/f)×` injective, and let `(E, α)` be the canonical CM pair over `K(f)`. Construct (Kato 2004, §§15.7–15.8, pp.255–258):

- the `L`-line `V_L(ψ) = H¹(E(ℂ), Q)^{⊗_K r} ⊗_K L`, the tensor power taken over `K` acting through `End(E) ⊗ Q`;
- for each finite place `λ` of `L` above a prime `ℓ`, the `L_λ`-linear action of `Gal(K̄/K)` on `V_{L_λ}(ψ) = V_L(ψ) ⊗_L L_λ` extending the étale action of `Gal(K̄/K(f))`: an element `σ` acts through the isomorphism of `E^{(σ)}` with `E/E[a]`, `a` an ideal prime to `f` with `σ|_{K(f)} = σ_a`, followed by pullback along `E → E/E[a]` and multiplication by `ψ(a)⁻¹`; this is independent of `a`, factors through `Gal(K(ℓ^∞f)/K)`, the Artin symbol of `a` prime to `ℓf` acts by `ψ(a)⁻¹`, and an idele `a ∈ K̂×` acts by `a_v^r ψ(a)⁻¹`, `v` the place of `K` below `λ`;
- the `L`-line `S(ψ) ⊂ coLie(E)^{⊗ r} ⊗_K L` (tensor power over `K(f)`) of invariants of the semilinear `Gal(K(f)/K)`-action in which `σ_a` acts by `ψ(a)⁻¹` times the pullback `coLie(E^{(σ_a)}) ≅ coLie(E/E[a]) → coLie(E)` along the canonical isogeny, independent of the representative `a`;
- the period map `per_ψ : S(ψ) → V_L(ψ) ⊗_L ℂ`, induced by the period pairing of `coLie(E)` with `H₁(E(ℂ), Z)`;
- the de Rham isomorphism `S(ψ) ⊗_L L_λ ≅ Fil^j D_dR(K ⊗ Q_ℓ, V_{L_λ}(ψ))` for every `1 ≤ j ≤ r`, the filtration being constant in that range;

and prove that all of these are independent of `f`, through the canonical isogenies between the canonical pairs of two admissible moduli. Prove the dictionary with this roadmap's conventions: for `ψ = φ` (`r = 1`) and `λ` the place induced by `ι_p`, `V_{L_λ}(φ) = T_φ^∨[1/p]` and `V_{L_λ}(φ)(1) = T_φ^∨(1)[1/p]`, the de Rham line at every prime above `p` is generated by `ω`, `γ = per_φ(ω)/Ω` lies in `V_L(φ)` because the periods of `ω` lie in `Ω O_K`, and the analytic character in §2.6 is `φ̄` times the direct finite character (Kato 2004, §15.8 and Proposition 15.9, pp.256–258; BKO, §3.0.2, p.951 and (3.4), p.952). *Needs:* §2.2; ComplexMultiplicationAndExplicitReciprocity §1.2 CM period and de Rham pairings, §4.1 One-dimensional CM components of the Tate module and Frobenius and infinity-type identities; PadicHodgeRegulators §1.4.

API:

- The Artin symbol of `a` prime to `ℓf` acts on `V_{L_λ}(ψ)` as `ψ(a)⁻¹`; the idele `a ∈ K̂×` acts as `a_v^r ψ(a)⁻¹`.
- `S(ψ)` is one-dimensional over `L` and `per_ψ` is injective.
- At a good prime `a`, arithmetic Frobenius on `T_φ^∨(1)` is `N(a)/φ(a)`.
- Independence of the auxiliary modulus `f`.

**Checks.**

- Dual and twist: on `T_φ` arithmetic Frobenius at `a` is `φ(a)`; on the dual it is `φ(a)⁻¹`, and the Tate twist multiplies by `N(a)`. At the inert good prime `7` for `y² = x³ − x` over `Q(i)`, `φ((7)) = −7`, the dual eigenvalue is `−1/7` and the twisted one `49·(−1/7) = −7`; omitting the twist leaves `−1/7`, of absolute value `N(a)^{−1/2}` instead of `N(a)^{1/2}`.
- The exponent `r` in the local action: for `r = 2` and an idele whose component at `v` is `6`, the action carries the factor `6² = 36`, not `6`.
- Descent normalisation: for `ψ` of type `(−2, 0)` with conductor dividing `f = (8)` in `Z[i]` and `a = (9)`, `9 ≡ 1 mod 8`, so `σ_a = 1`; pullback along multiplication by `9` multiplies `coLie(E)^{⊗2}` by `81`, and `ψ((9)) = 9² = 81`, so the identity acts by `81/81 = 1`. Omitting the factor `ψ(a)⁻¹` would make the identity act by `81`.
- The comparison uses `Fil^j` with `1 ≤ j ≤ r`, not `Fil⁰`: for `r = 1` the Hodge filtration of `H¹` jumps at `0` and `1`, so `Fil⁰ D_dR` is strictly larger than `Fil¹ D_dR`.

### 2.9 Twisting norm-compatible Kummer towers

Prove: let `F_∞/K` be a `p`-adic Lie extension, the union of finite layers `F_n`, and `T` a finite free `O`-module, `O` the integers of a finite extension of `Q_p`, with a continuous `G_K`-action factoring through `Gal(F_∞/K)`. Then Kummer theory and cup product give an `O`-linear isomorphism `(lim_cor H¹(F_n, Z_p(1))) ⊗_{Z_p} T ≅ lim_cor H¹(F_n, T(1))`, equivariant for the diagonal action of `Gal(F_∞/K)` on the left, compatible with localisation and corestriction, and with the same statement for the `p`-completed `S`-unit cohomology of SelmerIwasawaCohomology §0.9 with its finite-`S` Kummer correction retained. Apply it with `F_∞ = K(fp^∞)`, on which the action on `T_φ` factors, and `T = T_φ^∨`: the coefficient factor transforms by `φ⁻¹` (BKO, (3.5), p.952). Proof route: modulo `p^k` the action on `T/p^k` is trivial on `G_{F_n}` for all `n` beyond some `n(k)`; there the cup product with an `O/p^k`-basis gives `H¹(F_n, μ_{p^k}) ⊗ T/p^k ≅ H¹(F_n, T/p^k(1))`, and the projection formula makes these maps commute with corestriction between such levels (SelmerIwasawaCohomology §0.11); pass to the limit over `n` and `k`, finite freeness making `⊗ T` commute with the limits (SelmerIwasawaCohomology §§3.1–3.2). The cyclotomic instance is SelmerIwasawaCohomology §3.7. *Needs:* §2.4; SelmerIwasawaCohomology §§0.8–0.11, 3.1–3.2, 3.7.

**Checks.**

- `T = O` with trivial action: both sides are `lim_cor H¹(F_n, Z_p(1)) ⊗ O` and the map is the identity.
- Changing the basis of `T` multiplies both sides by the same matrix.
- Diagonal action: if `g` acts on the coefficient line by `φ(g)⁻¹`, then `g(x ⊗ t) = g(x) ⊗ φ(g)⁻¹t`; ignoring the coefficient action gives `g(x) ⊗ t`, which differs by the factor `−1` when `φ(g) = −1`.
- Without factorisation through `Gal(F_∞/K)`, for instance `T = Z_p(1)` over the anticyclotomic `Z_p`-tower of an inert `p`, no finite layer trivialises `T/p` (it contains no `μ_p`), and the untwisted Kummer map gives no such identification.

### 2.5 The height-one explicit reciprocity law

Prove, in the form applied by Kato: let `r ≥ 1`, `ψ` of type `(−r, 0)`, `f` contained in its conductor, and `K′ = K(g)` with `g = p^m f_0`, `m ≥ 1`, `f_0` the least divisor of `f` prime to `p`, such that `g ⊂ f` and `O_K× → (O_K/g)×` is injective. Let `(E, α)` be the canonical CM pair over `K(g)` and assume that `E` has good reduction at every place above `p`. Let `β ∈ H₁(E(ℂ), Q)` be the image of `1 ∈ K` under `K ≅ H₁(ℂ/g, Q)`, and let `ξ = (ξ_n)_n` be the `O_K ⊗ Z_p`-basis of `T_pE` given by `p^m β`, with `ξ_n` its image in `E[p^n]`. For `n ≥ 0` let `α_n` be the image of `p^{m−n}β` in `E(ℂ)_tors` (so `α_m = α`), `ν_n = ξ_n − α_n`, a point of `E(K′)` killed by `f_0`, and, for `a` prime to `6pf`, `θ_n(z) = _aθ_E(z − ν_n)`, so that `θ_n(ξ_n) = _aθ_E(α_n)`. Then on the tail `n ≥ m`, where `α_n` has annihilator `p^n f_0` and the values are units, the image of `ξ^{⊗(−r)} ⊗ (θ_n(ξ_n))_{n ≥ m}` under the cup product with `(T_pE)^{⊗(−r)}`, corestriction to `K′`, localisation at the places above `p` and the dual exponential is `p^{−mr} (r − 1)!⁻¹ ((d/ω)^r log θ_m)(ξ_m) · ω^{⊗ r}`, for a `K′`-basis `ω` of `coLie(E)`. Since `ξ^{⊗(−r)} = p^{−mr}β^{⊗(−r)}`, the image of `β^{⊗(−r)} ⊗ (_aθ_E(α_n))_{n ≥ m}` is `(r − 1)!⁻¹ ((d/ω)^r log {}_aθ_E)(α_m) · ω^{⊗ r}` (Kato 2004, proof of Proposition 15.9, pp.258–259). The proof applies the height `h = 1` case of Kato's generalised explicit reciprocity law (Kato 1999, Theorem 4.3.1) to the triples `(K′_v, G(v, 𝔭), O_𝔭)` for every place `v` of `K′` above `p` and every prime `𝔭` of `O_K` above `p`, where `G(v, 𝔭)` is the part of the Néron model of `E` over `O_v` killed by a power of `𝔭`: a `p`-divisible group with an `O_𝔭`-action of relative height one. It need not be connected: at a split ordinary `p` one prime component is connected of dimension one and the other étale of dimension zero, and only the connected one is a formal Lubin–Tate `O_𝔭`-module. The good-reduction hypothesis is local at the places above `p`; injectivity of global units modulo `g` alone does not imply it. The printed proof defines `θ_n` by translation by `+ν_n` while evaluating `θ_n(ξ_n) = _aθ_E(α_n)`; translation by `−ν_n` is the one consistent with that evaluation. *Needs:* §§2.1–2.4; PadicHodgeRegulators §§1.4, 1.7, 1.11; SelmerIwasawaCohomology §0.11; NeronModelsAndSemistableAbelianVarieties §5.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8, R07.1.9, R07.1.12–R07.1.14; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.1–2.2 for the connected components.

**Checks.**

- `K = Q(i)`, `p = 2`, `f = (1+i)³`, `g = (4)`: the inertia idele `i` fixes `K(4)` but acts on the cohomological `3`-adic line by `i⁻¹ = −i ≠ 1`, so this pair fails the good-reduction hypothesis. At modulus `(20)`, the prime-to-`2` part `(5)` separates all four global units (`i ≠ 1 mod 5`), eliminating this obstruction.

- `r = 1`: the right side is `p^{−m}(d log θ_m/ω)(ξ_m)·ω`, and after the conversion to `β` it is `(d log {}_aθ_E/ω)(α_m)·ω`, the logarithmic derivative of the theta function at the torsion point.
- Translation: `K = Q(i)`, `p = 7`, `m = 1`, `f_0 = (8)`, `g = (56)`, `E = ℂ/56Z[i]`. Then `β = 1` is not in `T_7E`, while `7β` is a basis; at level `1`, `α_1 = 1`, its `7`-primary component is `ξ_1 = 8` modulo `56` (since `1 ≡ 8 + 49`), and `ν_1 = 7`, killed by `8`. Translation by `−ν_1` sends `ξ_1` to `8 − 7 = 1 = α_1`; translation by `+ν_1` sends it to `15`, a different point.
- Initial level: `K = Q(i)`, `p = 7`, `f_0 = O_K`, `m = 1`, `g = (7)`, `a = (5)`: `α_0 = 7β = 0`, and `_aθ_E` has a zero of order `N(a) − 1 = 24` at `0`, so `n = 0` gives no unit. On the tail, `α_1 = 1` and `α_2 = 1/7` modulo `7Z[i]` have annihilators `(7)` and `(49)`, and `K(7)`, `K(49)` have degrees `12` and `588` over `K`.
- Prime components: for `y² = x³ − x` over `Q(i)` and `p = 5`, `#E(F_5) = 8`, so `a_5 = −2` and the reduction is ordinary; the two prime components above `5` have dimensions `1` and `0`, the second étale with five geometric `5`-torsion points. For an inert `p` there is one prime `𝔭 = pO_K`, and `G(v, 𝔭)` is connected of height two over `Z_p` and height one over `O_𝔭`.
- The factorial `(r − 1)!⁻¹` is `1` for `r = 1, 2` and `1/2` for `r = 3`.
- Changing `ω` to `uω`, `u ∈ K′×`, multiplies `(d/ω)^r log θ_m` by `u^{−r}` and `ω^{⊗ r}` by `u^r`; the right side is independent of `ω`, as the left side is.

### 2.6 Kato's reciprocity law for elliptic units

Prove: let `r ≥ 1`, `ψ` of type `(−r, 0)`, `f` contained in the conductor of `ψ`, `K′` a finite extension of `K` inside `K(p^∞f)` and `γ ∈ V_L(ψ)`. The image of `z_{p^∞f}` under `H¹_{p^∞f}(Z_p(1)) → H¹(O_{K′}[1/p], V_{L_λ}(ψ)(1))` (cup product with `γ`), the semilocal dual exponential and the de Rham isomorphism of §2.4 lies in `S(ψ) ⊗_K K′`, and for every character `χ : Gal(K′/K) → ℂ×`, `Σ_{σ ∈ Gal(K′/K)} χ(σ) per_ψ(σ(·)) = L_{pf}(ψ̄, χ, r) · γ`, with `L_{pf}(ψ̄, χ, s) = Σ_a ψ̄(a)χ(a)N(a)^{−s}` over ideals prime to `pf` (Kato 2004, Proposition 15.9, p.258). Proof route: enlarge the prime-to-`p` part of the working modulus to `f_0 b`, with `b` prime to `pf`, so that `O_K× → (O_K/f_0 b)×` is injective. For the canonical pair over `K(p^m f_0 b)`, prove good reduction above `p`: a local inertia idele fixing this ray field differs from a ray congruence idele by a global unit congruent to `1` modulo `f_0 b`, hence that unit is `1`; the prime-to-`p` Tate action is then trivial by §2.4 and Néron–Ogg–Shafarevich applies. Apply §2.5 there with `γ = β^{⊗(−r)}`, then descend by traces and the theta distribution relations of §2.1, retaining the Euler factors at the auxiliary primes of `b`. Each auxiliary factor `1 − ψ̄(q)χ(q)N(q)^{−r}` is nonzero because `|ψ̄(q)χ(q)N(q)^{−r}| = N(q)^{−r/2} < 1`; cancel these factors to recover the original `pf`-deleted formula, not a formula with the auxiliary factors omitted (Kato 2004, §§15.4–15.5 and proof of Proposition 15.9, pp.252–253, 258–260). Because `_az_f = _aθ_E(α)⁻¹` (§2.2), the Kummer class of the standard units is the negative of the class of the theta values of §2.5, and this sign is carried through the comparison. Evaluate `(d/ω)^r log {}_aθ` at the torsion points by the analytic theory of Eisenstein series (Kato 2004, §3.8, (3.8.1)–(3.8.2), pp.138–140), obtaining `Σ_σ χ(σ) per(σ(z)) = (N(a) − ψ(a)χ(a)⁻¹) L_{pf}(ψ̄, χ, r) γ` for the smoothed element, (15.9.1)–(15.9.2), pp.259–260. *Needs:* §§2.1–2.5; PadicHodgeRegulators §§1.4, 1.11; NeronModelsAndSemistableAbelianVarieties §5.1; ClassFieldTheory Layer 13.

API:

- Algebraicity: `Ω⁻¹ L_{pf}(φ̄χ, 1)` for `χ` of finite order factoring through `K(p^∞f)` is algebraic and lies in the field generated by `L`, `K′` and the coefficients of the chosen model.
- Smoothed form: the smoothing factor becomes `N(a) − ψ(a)σ_a` after the twist by `V_L(ψ)`.
- Trace compatibility in `K′`.

**Checks.**

- Auxiliary descent at `p = 2`: for the Gaussian CM character and `b = (5)`, the two new Euler factors at `s = 1` multiply to `(1 − (−1+2i)/5)(1 − (−1−2i)/5) = 8/5 ≠ 0`. Cancellation is valid in the rational reciprocity law even though `v_2(8/5) = 3`; it does not establish integral descent.

- For `χ = 1`, `r = 1` and `p` inert with `p ∤ f`, the deleted value `L_{pf}(φ̄, 1)` contains the `p`-factor `1 − φ̄((p))/p² = 1 + 1/p`, nonzero and of valuation `−1`. At a split `p` this formula does not apply: for `y² = x³ − x` over `Q(i)` and `p = 5`, `φ((5)) = 5`, the two Frobenius values are `−1 ± 2i` and the deleted factor is `(1 − (−1 + 2i)/5)(1 − (−1 − 2i)/5) = 8/5`, while `1 − φ̄((5))/25 = 4/5`.
- Orientation of the weights: the sum weights `σ` by `χ(σ)`, not `χ(σ)⁻¹`; for `χ(σ) = ζ_25` the two weights differ since `ζ_25² ≠ 1`. The resulting central values may coincide (for the order-`25` characters of the Layer 1 example both are `0`), so the convention is pinned by the weights, not by the values.
- The smoothing factor for `a = (α)` with `α ≡ 1 mod f`: `N(a) − ψ(a) = α ᾱ − α^r`, which for `r = 1` is `α(ᾱ − 1)`.

### 2.7 The integral normalised class

Construct, for the period datum `(E, ω, Ω)` and `γ = per_φ(ω)/Ω`, the norm-compatible family `z_a ∈ H¹(K(a), T_φ^∨(1))` for admissible moduli `a` divisible by `f` and supported on `f`, `p` and the auxiliary `l`, whose rationalisation is Kato's class `z_a^{(p)}(γ)` of §2.6; the transition maps are corestriction, with the arithmetic-Frobenius Euler factors at newly introduced primes retained (BKO, §3.0.2, pp.951–952). Integrality is a theorem here, not a consequence of §2.6, which is a statement after inverting `p`. Proof route for the component the local-unit argument uses (the `ν`-evaluation, the augmentation over `Gal(H/K)` and the `Δ`-invariant projection): under the twist the smoothing factor is `N(a) − φ(a)σ_a` (Kato 2004, (15.9.2), p.259); take `a = (α)` with `α ≡ 1 mod 6 f l^{m+1}` and `α ≡ 2 mod p`; on that component `σ_a` acts through `ν(a) = 1` and a pro-`p` element, so the factor is congruent to `N(a) − φ(a) = α(ᾱ − 1)`, a `p`-adic unit, hence invertible in the local Iwasawa algebra, and Kato's (15.6.3) gives integrality of the projected element. The full lattice statement needs the Betti lattice: `γ` generates `T_φ^∨` integrally, including the prime-to-`p` comparison between the curve over `H` and the canonical CM pair over `K(f)`. *Needs:* §§0.4, 2.3, 2.4, 2.6, 2.9; SelmerIwasawaCohomology §§0.9, 0.11.

API:

- Rationalisation: `z_a ⊗ Q = z_a^{(p)}(γ)`.
- Corestriction: at fixed prime support, `cor(z_{ap}) = z_a`.
- A new good prime `q` introduces the Euler operator of arithmetic Frobenius at `q`.
- Flat coefficient extension `R → R′` carries `z_a` to the class of the same normalisation.
- For `ε ∈ O_K×`, replacing `Ω` by `εΩ` multiplies `γ` and `z_a` by `ε⁻¹`.

**Checks.**

- `α = 2` modulo `p` with `ᾱ ≡ 2`: `α(ᾱ − 1) ≡ 2` is a unit; a choice `α ≡ 1 mod p` gives `ᾱ − 1 ≡ 0` and a nonunit factor.
- Two successive `p`-levels after `p` divides the modulus: corestriction gives the previous class with no extra Euler factor.
- Changing `Ω` to `−Ω` negates `γ` and the class; changing `ω` and `Ω` together by `2` fixes both.

### 2.8 Direct-character reciprocity at an inert prime

Prove: for the integral class at level `K(gp^n)`, `g` divisible by `f`, and a character `χ` of finite order of `Gal(K(gp^n)/K)`, `Σ_σ χ(σ) exp*_p(loc_p(z^σ)) = Ω⁻¹ L_{pg}(φ̄χ, 1) · ω` in the common coefficient-tensor-de Rham line, the sum taken over the semilocal places with the trace of the native localisation (BKO, (3.4), p.952; Kato 2004, Proposition 15.9 and (15.9.1)–(15.9.2), pp.258–260). `L_{pg}` deletes the primes dividing `pg`; for `g = f` it is `L_{pf}`, and for auxiliary `ν` take `g = f l^m` with the actual conductor exponent `m`. Only `φ` is conjugated. Equality of integral classes is not inferred from this rational identity. *Needs:* §§2.4, 2.6, 2.7; PadicHodgeRegulators §§1.4, 1.11; AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- `χ = 1`: the inert `p`-factor `1 + 1/p` is retained.
- Weights: the coefficient of the `σ`-term is `χ(σ)`; with `χ(σ) = ζ_25` the inverse convention would put `ζ_25⁻¹ ≠ ζ_25` there, whatever the values of the two sides.
- `g = f l^m` with `ν ≠ 1`: the `l`-factors of `L_{pg}` are `1` (§5.3), so `L_{pg}(φ̄ν, 1) = L_{pf}(φ̄ν, 1)`.

### 2.10 Period changes

Prove: for fixed `ω`, replacing `Ω` by `uΩ` and `γ` by `u⁻¹γ`, `u` an allowed lattice unit, multiplies `z_a` and both sides of §2.8 by `u⁻¹`; replacing `ω` by `vω` and `Ω` by `vΩ`, with `v ∈ H×` a unit at the place above `p`, leaves `γ` and `z_a` unchanged, multiplies the normalised scalar by `v⁻¹`, and leaves its product with the generator `vω` unchanged (BKO, §3.0.2, p.951, and (3.4), p.952). The `p`-unit property of the normalised value is independent of the allowed choices. *Needs:* §§0.4, 2.7, 2.8.

**Checks.**

- `v = 2`: the class is fixed and the scalar halves.
- `u = −1`: class and scalar both change sign.
- `v = p` is not allowed: `pω` is not a Néron differential.

### Examples

For `K = Q(√−7)`, `p = 5`, `f` the canonical conductor, `a = (α)` with `α ≡ 1 mod 6f·23²` and `α ≡ 2 mod 5`: the twisted smoothing factor is congruent to `2(2 − 1) = 2`, a `5`-adic unit. For `χ = 1` the deleted factor at `5` is `6/5`. For `K = Q(i)`, `f = (3)`, `a = (5)`, the standard unit of modulus `(3)` has `log|N_{K(3)/K}(_az_f)| = −6 log 3`.

### Dependencies

Layers 0–1; PadicFamilies §4.0.1; EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1; ClassFieldTheory Layer 13; SelmerIwasawaCohomology §§0.8–0.11, 3.1–3.2, 3.6, 3.7; PadicHodgeRegulators §§1.4, 1.7, 1.11; NeronModelsAndSemistableAbelianVarieties §5.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8, R07.1.9, R07.1.12–R07.1.14; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.1–2.2; AL.5.

## Layer 3: Torsion towers and the CM Lubin–Tate comparison

### 3.1 The torsion and ring-class compositum

Construct, for `n ≥ 0`, `r ≥ 0`, the fields `F_n = H(E[p^{n+1}])` and `M_{n,r} = F_n L[r]` inside `Q̄`, the corestriction maps between their continuous Kummer cohomologies induced by the field inclusions, and `Φ_n`, the completion of `F_n` at the place fixed by `ι_p`. For `ν` of exact order `l^r`, `r ≥ 1`, prove `M_{n,r} ⊂ K(f l^{r+1} p^{n+1})`; for `ν = 1`, `M_{n,0} = F_n` (BKO, p.952 and the corestriction arrows on pp.952–953). *Needs:* §0.6; ComplexMultiplicationAndExplicitReciprocity §4.1 The algebraic Hecke character of a CM abelian variety, §3.2 Exact ray-level field and generation criterion; ClassFieldTheory Layer 13; SelmerIwasawaCohomology §0.11; LubinTateFormalModulesAndQuasiCanonicalLifts §2.3 Lubin–Tate division fields.

API:

- The `n` and `r` inclusions commute and induce transitive corestrictions.
- `Φ_n` is the Lubin–Tate `π^{n+1}`-division field after §3.5.
- `L[0] = K`, `M_{n,0} = F_n`.
- Localisation commutes with corestriction through the sum over places above the chosen prime.

**Checks.**

- `n = 0`: `[Φ_0 : Φ] = p² − 1`, so `Φ_0 ≠ Φ`.
- An order-`l` character uses `L[1]` and ray modulus `l²`.
- `l | (p + 1)` is allowed: no coprimality of degrees is assumed.

### 3.2 Ramification proves linear disjointness

Prove: `F_n` and `L[r]` are linearly disjoint over `K`, so `F_n ⊗_K L[r] → M_{n,r}` is an isomorphism, including when `l | p² − 1`. Proof route: the intersection is abelian of `l`-power degree, unramified above `l` (good reduction of `E` there) and unramified away from `l` (`L[r]/K` is ramified only above `l`); with no real places it lies in the Hilbert class field and is trivial since `l ∤ h_K` (BKO, p.953). *Needs:* §3.1; ClassFieldTheory Layer 13; LocalFieldsRamification Layers 2–3; ComplexMultiplicationAndExplicitReciprocity §4.1 One-dimensional CM components of the Tate module; Mathlib `Subalgebra.linearDisjoint_iff_injective`.

**Checks.**

- `K = Q(√−7)`, `p = 47`, `l = 23`: `47` is inert (`(−1/47) = −1` and `(7/47) = −(47/7) = −(5/7) = 1`, so `(−7/47) = −1`), `23` splits (`−7 ≡ 4² mod 23`), `23 ∤ h_K = 1` and `47 ∤ 22`, so the pair is admissible. For `r ≥ 1`, `[L[r] : K] = 23^r` and `23` divides `[F_n : H] = (47² − 1)47^{2n}` since `47² − 1 = 2208 = 23·96`; the degrees are not coprime, and the ramification argument still gives disjointness. At `r = 0`, `L[0] = K` and disjointness is immediate.
- If `l | h_K`, the Hilbert class field contains a cyclic `l`-extension that may lie in both fields; the hypothesis is used.
- The disjointness is of Galois extensions of `K`; a coprime-degree argument would fail for `l | (p² − 1)p^{2n}`.

### 3.3 Splitting and the semilocal character factors

Prove: `pO_K` splits completely in `H` and in every ring class field of conductor prime to `p`, including `L[r]`. After compatible choices of places, `F_n ⊗_K Φ ≅ ∏_{Gal(H/K)} Φ_n` and `M_{n,r} ⊗_K Φ ≅ ∏_{Gal(H/K) × Gal(L[r]/K)} Φ_n`; finite-level Kummer cohomology acquires the corresponding regular group-algebra factors, evaluation of the second factor sends `[g]` to `ν(g)`, and forgetting the `H`-factor is its augmentation; these identifications commute with the transition maps (BKO, pp.952–953). Proof route: `p` lies in every order of conductor prime to `p` and generates a principal proper ideal, whose Artin class is trivial; combine with §3.2 and the local torsion ramification. *Needs:* §§3.1–3.2; ClassFieldTheory Layer 13; LocalFieldsRamification Layer 2; SelmerIwasawaCohomology §§0.11, 3.6; LubinTateFormalModulesAndQuasiCanonicalLifts §2.3 Lubin–Tate division fields; Mathlib `MonoidAlgebra.lift_single`.

**Checks.**

- For nonreal `ν` the coefficient of `[g]` is `ν(g)`, not `ν(g)⁻¹`.
- Augmentation over `Gal(H/K)` differs from keeping one place without its conjugates: for `h_K = 2` the augmentation of `(x, y)` is `x + y`, the single place gives `x`.
- A ring class field of conductor divisible by `p` need not split `p`.

### 3.4 The inert Frobenius is multiplication by −p

Prove: for `φ` as in §0.1 and `p ∤ f` inert, `φ((p)) = −p`; at a place of `H` above `p` the residue field is `F_{p²}`, and the arithmetic Frobenius of the reduction of `E` is the endomorphism `[−p]`; its characteristic polynomial is `(X + p)²` and `a_{p²} = −2p` (Rubin 1987, Lemma 3.1 and its proof, p.409, RUBIN87 line 191; Jia, Property 1, pp.3–4). Proof route: `κ_K(p) = −1` and §0.1; `p` splits in `H/K`; identify Frobenius through the CM Hecke realisation and conclude equality of endomorphisms by faithfulness of the Tate realisation. *Needs:* §0.1; ComplexMultiplicationAndExplicitReciprocity §4.1 The algebraic Hecke character of a CM abelian variety and One-dimensional CM components of the Tate module; §3.3; EllipticCurves Layers 2–3.

**Checks.**

- The sign is negative though the residue field has `p²` elements: `y² = x³ − x` at `7` has Frobenius `−7` over `Q(i)`, local factor `(1 + 7T)²`.
- Point count: for `p = 5`, Frobenius `[−5]` has trace `−10` and `#E(F_25) = 25 + 1 + 10 = 36`; the opposite sign would give `16`.
- Equal traces do not give equal endomorphisms; faithfulness of the Tate realisation is used.
- At a split rational prime no height-two conclusion is asserted.

### 3.5 Apply the Honda comparison at π = −p

Prove: the formal completion of the good model of `E` at the place above `p`, with the differential `ω`, is a height-two formal group over `O_Φ` and is strictly isomorphic over `O_Φ`, with the CM tangent embedding, to the Lubin–Tate `O_Φ`-module for `π = −p`; the isomorphism matches invariant differentials and compatible Tate bases; the completion of `H(E[p^{n+1}])` is the `π^{n+1}`-division field `Φ_n`, totally ramified of degree `(p² − 1)p^{2n}`; and `μ_{p^{n+1}} ⊂ Φ_n` by the Weil pairing on `E[p^{n+1}]` (BKO, §2, p.947 and §3.0.2, p.953; Rubin 1987, §3, pp.409–410). Compatible points with `[p]P_{n+1} = P_n` are converted to the `[−p]` convention by the sign `(−1)^n`. *Needs:* §§3.1, 3.4; LubinTateFormalModulesAndQuasiCanonicalLifts §4.4 The supersingular elliptic comparison, §4.3 The unramified Honda–Lubin–Tate comparison, §2.2 The π-adic Tate module, §2.3 Lubin–Tate division fields, §2.4 The Lubin–Tate character; EllipticCurves Layer 2.

**Checks.**

- The parameter is `−p`: `a_{p²} = −2p` corresponds to `s = −1` in LubinTateFormalModulesAndQuasiCanonicalLifts §4.4; `s = +1` would require `a_{p²} = 2p`.
- `n = 0`: degree `p² − 1`; for `p = 5`, `24`.
- The Weil pairing puts `μ_{p^{n+1}}` in `Φ_n`; `[Φ_n : Φ]` is divisible by `[Φ(μ_{p^{n+1}}) : Φ] = (p − 1)p^n`, consistent with `(p² − 1)p^{2n}`.

### Examples

For `p = 5`: `Φ_0/Φ` has degree `24`, `Φ_1/Φ` degree `600`; the inert Frobenius is `[−5]` with polynomial `(X + 5)²`.

### Dependencies

Layers 0 and 2 (the class field `K(f)` and torsion fields); ComplexMultiplicationAndExplicitReciprocity §§3.2, 4.1; ClassFieldTheory Layer 13; LocalFieldsRamification Layers 2–3; EllipticCurves Layers 2–3; SelmerIwasawaCohomology §§0.11, 3.6; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.2–2.4, 4.3, 4.4.

## Layer 4: Finis's divisibility theorem

Throughout this layer, the *tower prime* is an odd prime split in `K` and the *valuation prime* `ℓ` is an odd prime different from it; `δ ∈ O_K` is the square root of `−D` with `Im ι(δ) > 0`, `e_K = e_Q ∘ Tr_{K/Q}` with `e_Q(x_∞) = e^{2πix_∞}`, `ω_{K/Q}` is the quadratic character of `K/Q`, `ν(D)` is the number of prime divisors of `D`, and `𝔩` is the prime of `K` above `ℓ` determined by `ι_ℓ`. The scalar theta functions (Finis's `ν = 0`) prove the weight-one case; the comparison with the ordinary measure at split `ℓ` in §4.5a supplies every weight `k ≥ 1`. In the application of Layer 5 the tower prime is the auxiliary `l` and the valuation prime is the inert `p`.

### 4.1 Finis's local invariants

Define, for a Hecke character `λ` of `K` with Finis type `(k, j)` (`λ_∞(x) = x^{−k}x̄^{−j}`) and dual `λ*(x) = λ(x̄)⁻¹|x|_{A_K}`: `λ` is anticyclotomic in Finis's sense when `λ = λ*` (then `k + j = −1` and `λ|_{A_Q×} = ω_{K/Q}|·|`); the local Gauss sum `G(d_q, λ_q)` of `λ_q` with respect to `e_K` and an element `d_q` with `d_q O_{K_q} = δO_{K_q}`, equal to `1` when `λ_q` is unramified; the local root numbers `W_q(λ) = N(q)^{−e(q)}G(−δ, λ_q)` at nonsplit `q` (`e(q)` the conductor exponent) and `W_ℓ(λ) = N(𝔩)^{−e(𝔩)}G(δ, λ_𝔩)` at the valuation prime; the set `W` of sign systems `(w_q)` over nonsplit primes with almost all `w_q = 1` and `∏ w_q = 1`, and `w(λ) ∈ W` for `W(λ) = +1`; and, for an inert `q` and a character `χ_q` of `K_q×`, `μ_ℓ(χ_q) = 0` if `χ_q` is unramified and `min_{x ∈ O_{K_q}×} v_ℓ(χ_q(x) − 1)` otherwise (Finis, §1, pp.768–769, FINIS06 lines 61–99). Prove `W_q(λ) = ±1` for nonsplit `q`, `W_q(λ) = (−1)^{v_q(f_λ)}` for inert `q`, and `W(λ) = ∏_q W_q(λ)` for type `(−k, k − 1)`, `k ≥ 1` (Finis, p.769; proof of Corollary 2.3, p.778). *Needs:* AL.1.3.4 The local Gauss sum, AL.1.3.5 Explicit local ε-factors; Tau Ceti `HeckeCharacter`.

API:

- `μ_ℓ` depends only on the restriction to local units, and `μ_ℓ(χ_q) = 0` when that restriction is trivial.
- `μ_ℓ(χ_q χ'_q) = μ_ℓ(χ_q)` when `χ'_q` is unramified.
- For `φ` equivariant of ideal type `(1,0)` and `ρ` anticyclotomic of finite order, `φ̄ρ/N` is Finis-anticyclotomic of type `(−1, 0)`: its archimedean component is `z̄⁻¹ · z z̄ = z` (§5.1). Without the conjugation, `φρ/N` has archimedean component `z⁻¹ · z z̄ = z̄`, Finis type `(0, −1)`.

**Checks.**

- `χ_q` of conductor `q` with values `ζ_ℓ` on units: `μ_ℓ = v_ℓ(ζ_ℓ − 1) = 1/(ℓ − 1)` in the normalisation `v_ℓ(ℓ) = 1`; for values of order prime to `ℓ`, `μ_ℓ = 0`.
- At `z = i` the archimedean component of `φ̄ρ/N` is `i`, that of `φρ/N` is `−i`; type `(−1, 0)` gives `k + j = −1`, and type `(1, 0)` gives `k + j = 1` and is not Finis-anticyclotomic.
- For inert `q` with `v_q(f_λ) = 1`, `W_q = −1`; with `v_q(f_λ) = 0`, `W_q = 1`.

### 4.2 Theta functions on CM lattices, primitive subspaces and Yang's formula

Define, for a positive rational `r` and a fractional ideal `a` of `K` with `rN(a) ∈ Z`, the space `T_{r,a}` of theta functions: holomorphic `ϑ : ℂ → ℂ` with `ϑ(w + l) = ψ(l) e^{−2πirδ l̄ (w + l/2)} ϑ(w)` for `l ∈ a`, where `ψ(l) = (−1)^{rD|l|²}` (Finis, (3), p.771, with `ν = 0`). Define the operators `(A_l f)(w) = e^{2πirδ l̄ (w + l/2)} f(w + l)` for `l ∈ ℂ` (Finis, (4), p.771) and the normalised scalar product `⟨ϑ_1, ϑ_2⟩ = (2/(√D N(a))) ∫_{ℂ/a} conj((A_uϑ_1)(0)) (A_uϑ_2)(0) du`, the average over a fundamental domain (Finis, (5), p.772). For `b ⊇ a` with `rN(b) ∈ Z`, let `i : T_{r,b} → T_{r,a}` be the inclusion and `t_b = Σ_{l ∈ b/a} ψ(l)A_l : T_{r,a} → T_{r,b}` the trace; define the primitive subspace `T^{prim}_{r,a} = ⋂_{b ⊋ a, rN(b) ∈ Z} ker t_b` (Finis, p.772). For a positive integer `d` define `T_d` as the families `(t_a)` in `∏_a T_{d/N(a),a}` with `t_{λa}(λw) = t_a(w)` for `λ ∈ K×`, isomorphic to `⊕_{a ∈ A} T^1_{d/N(a),a}` (the invariants under the roots of unity) for a system `A` of class representatives, with the sum of the scalar products; for a genus class `C ∈ N(I_K)/N(K×)` let `V_{d,C}` be the subspace of families supported on ideals of norm class `C`, and `V^{prim}_{d,C}` its primitive part (Finis, p.772). Define the Shintani operators: for a norm-one ideal `b = c̄c⁻¹`, `c` integral with `c + c̄ = O_K`, `E(b)` is the inclusion `T_{r,a} → T_{r,ac̄}` followed by `t_{ac̄c⁻¹}`; the normalised operators `F*(c) : T_{r,a} → T_{r,acc̄⁻¹}` are `γ_{rN(a)}(c)E(cc̄⁻¹)` for Finis's normalising factor `γ_{rN(a)}`, multiplicative in `c` (Finis, pp.773–774). Define the linear functional `l(ϑ) = Σ_{a ∈ A} ϑ_a(0)` on `T_d` (Finis, (9), p.780). Prove:

- `dim T_{r,a} = rDN(a)`; the `A_l`, `l ∈ a* = (rN(a)D)⁻¹a`, preserve `T_{r,a}`, satisfy `A_{l_1}A_{l_2} = e^{πir Tr(δl_1 l̄_2)}A_{l_1+l_2}`, act by `ψ(l)` for `l ∈ a`, are unitary, and make `T_{r,a}` an irreducible representation of the Heisenberg group `G_{r,a}`, an extension of `a*/a` by `ℂ×` (Finis, pp.771–772);
- `i` is an isometry for the normalised scalar products, `t_b ∘ i = [b : a]·id`, and the adjoint of `i` is `t_b/[b : a]`; `T^{prim}_{r,a}` is the orthogonal complement of the images of the inclusions. (Finis, p.772, calls `t_b` itself the adjoint; with the normalised scalar products the index factor is needed. The Shintani operators use the unnormalised `t_b`.)
- `F*` is a representation of the group of ideals `c` with `cc̄⁻¹` prime to `d` on `V_{d,C}`, preserving `V^{prim}_{d,C}`; `F*(z)` acts by `z⁻¹` for `z ∈ K×` with `z ≡ 1 mod rN(a)D` (Finis, pp.773–777, 783);
- the characters of `F*` on `V^{prim}_{d,C}`: a Hecke character `λ` with `λ|_{A_Q×} = ω_{K/Q}|·|` appears exactly when it has Finis type `(−1, 0)`, conductor `dD𝔡_λ⁻¹` with `𝔡_λ` a squarefree product of ramified primes, and `W_q(λ) = ω_{K/Q,q}(d/c)` for `q | D` and a rational representative `c` of `C`, and then with multiplicity one; consequently `λ` occurs in some `V^{prim}_{d,C}` if and only if it has type `(−1, 0)` and `W(λ) = +1`, and then in exactly one (Finis, Proposition 2.2 and Corollary 2.3, p.778);
- Yang's formula: for a Shintani eigenfunction `ϑ ∈ V^{prim}_{d,C}` with character `λ`, `|l(ϑ)|²/⟨ϑ, ϑ⟩ = (w_K²√D/(4πh_K)) ∏_{p | d}(1 − ω_{K/Q}(p)p⁻¹)⁻¹ L(0, λ)`, the product over rational primes dividing `d` (Finis, Proposition 2.4, (10), p.780, FINIS06 line 564, reformulating Yang 1997, Theorem 2.6, (2.19), p.43, with the split-place test function of Yang 1997, Theorem 2.15, p.48).

*Needs:* §4.1; ComplexMultiplicationAndExplicitReciprocity §1.2 (the period-lattice comparison); AnalyticNumberTheoryPartI §2.3a.

API:

- `T_{r,b} ⊂ T_{r,a}` for `b ⊇ a` with `rN(b)` integral; `A_l` for `l ∈ a` is the scalar `ψ(l)`.
- `t_b ∘ i = [b : a]·id` and `i* = t_b/[b : a]`; `t_b` is surjective.
- For an eigenfunction, the components `ϑ_a` are eigenfunctions of the local Shintani operators, and the eigenline in `V^{prim}_{d,C}` of a given `λ` is one-dimensional.
- `l(ϑ)` does not depend on the system of representatives `A`, since `t_{λa}(0) = t_a(0)`.

**Checks.**

- Dimension: for `K = Q(√−7)`, `r = 25` and `a = O_K`, `dim T_{r,a} = 25·7·1 = 175`; for `b = (1/5)O_K` (`5` is inert, so `b` is the only ideal strictly containing `O_K` with `rN(b)` integral) `dim T_{r,b} = 25·7/25 = 7`, and the primitive subspace `ker t_b` has dimension `175 − 7 = 168`.
- Irreducibility is consistent with the dimension: `[a* : a] = (rDN(a))²`, the square of `dim T_{r,a}`.
- Adjoint normalisation: in the same example, for `h ∈ T_{r,b}` of norm `1`, `⟨ih, ih⟩_a = 1` while `⟨h, t_b ih⟩_b = 25`; the adjoint of `i` is `t_b/25`, not `t_b`.
- The constant function `1` is not in `T_{r,a}` for `r > 0`: the factor `e^{−2πirδ l̄(w + l/2)}` is nonconstant in `w` for `l ≠ 0`.
- A character with `W(λ) = −1` does not appear, consistent with `L(0, λ) = 0` and `l(ϑ) = 0`.
- The constant `w_K²√D/(4πh_K)` for `K = Q(√−7)`: `w_K = 2`, `h_K = 1`, giving `4√7/(4π) = √7/π`; the correction factor at a ramified `p | d` (`ω_{K/Q}(p) = 0`) is `1`.
- Normalisation of `l`: replacing `l` by `5l` keeps linearity and the eigenlines but multiplies the left side of Yang's formula by `25`.

### 4.3 Integral theta functions, the canonical bilinear forms and the valuation identity

Define the `ℓ`-integral theta functions `T^{int}_{r,a} ⊂ T_{r,a}` as those `ϑ` for which every special value `(A_xϑ)(0)`, `x ∈ K`, is an algebraic number whose image under `ι_ℓ ∘ ι_∞⁻¹` is integral, and the arithmetic ones `T^{ar}_{r,a}` by algebraicity of these values; prove that these agree with the sections of the line bundle `L_{r,a}` on a CM curve `E_a` with period lattice `Ω_{∞,a}a` and good reduction at `ι_ℓ`, rigidified at the origin, and that `A_x` (`x ∈ a*`) and `F*(c)` (`c` prime to `𝔩`, `cc̄⁻¹` prime to `rN(a)`) preserve them (Finis, Lemma 3.1, p.783, and pp.782–784). Call `ϑ ∈ T^{int}_{r,a}` normalised when `γϑ ∈ T^{int}_{r,a}` exactly for `ℓ`-integral `γ` (Finis, p.788). Define the antilinear map `ϑ ↦ ϑ†`, `ϑ†(w) = conj(ϑ(w̄))`, from `T_{r,a}` to `T_{r,ā}`; the bilinear form `b(ϑ_1, ϑ_2) = ⟨ϑ_1†, ϑ_2⟩` on `T_{r,ā} × T_{r,a}`; when `aā⁻¹` is prime to `rN(a)`, the symmetric form `b′(ϑ_1, ϑ_2) = b(F*(ā)ϑ_1, ϑ_2)` on `T_{r,a}`; and their arithmetic versions `b_ar = (Ω/2π)b`, `b′_ar = (Ω/2π)b′`, `Ω` the period of §4.6 (Finis, p.784). Define, for `ℓ` inert or ramified, a character `λ_ℓ` of `K_ℓ×` with `λ_ℓ|_{Q_ℓ×} = ω_{K/Q,ℓ}|·|_ℓ` and a positive rational `r` with `W_ℓ(λ_ℓ) = ω_{K/Q,ℓ}(r)`, `b_ℓ(λ_ℓ, r) = −min v_ℓ(D^{1/4} b_ar(ϑ_1, ϑ_2))` over `ϑ_1 ∈ T^{int}_{r,ā}(λ_ℓ)`, `ϑ_2 ∈ T^{int}_{r,a}(λ_ℓ)`, the `λ_ℓ`-eigenspaces of the local Shintani operator at `ℓ`, for any `a` with `v_ℓ(rN(a))` large; and `b_ℓ = 0` for split `ℓ`; through the bijection `Q_{>0}/N(K×) ≅ W`, `r ↦ (ω_{K/Q,q}(r))_q`, this defines `b_ℓ(λ_ℓ, w)` (Finis, (14), p.788, FINIS06 lines 886–917). Prove:

- `b_ar` takes algebraic values on arithmetic functions, and `(dD)^{5/2}D^{1/4}b_ar(ϑ_1, ϑ_2)` is `ℓ`-integral on integral ones, `d = rN(a)`; the same for `b′_ar` when `a` is moreover prime to `𝔩̄` (Finis, Proposition 3.4, p.786);
- `b_ℓ(λ_ℓ, r)` is independent of `a`, satisfies `b_ℓ(λ_ℓ, rN(α)) = b_ℓ(λ_ℓ, r)` for `α ∈ K×`, and vanishes when `λ_ℓ` is unramified (`ℓ` inert) or of minimal conductor (`ℓ` ramified) (Finis, p.788);
- for `λ` Finis-anticyclotomic of type `(−1, 0)`, `W(λ) = +1`, conductor `dD𝔡_λ⁻¹`, `ϑ_λ` in its eigenline in `V^{prim}_{d,C}` and `a` with `N(a) ∈ C`: `Ω⁻¹ L(0, λ) = (2^{ν(D)}/√D) ∏_{q | d}(1 − ω_{K/Q}(q)q⁻¹) b_ar(ϑ_{λ,ā}, ϑ_{λ,a})⁻¹ (l(ϑ_λ)/w_K)²`, the product over rational primes dividing `d`, and `b_ar(ϑ_{λ,ā}, ϑ_{λ,a}) = λ(ā)⁻¹ b′_ar(ϑ_{λ,a}, ϑ_{λ,a})` when `a` is prime to `dD` (Finis, Proposition 3.6, (13), p.787);
- for `a` prime to `dD𝔩̄` and a normalised integral eigenfunction `ϑ ∈ T^{prim}_{d/N(a),a}` with local eigencharacters `λ_p`, `p | dD`: `v_ℓ((W̃/(D^{1/4}b′_ar(ϑ, ϑ))) · ∏_{q | d}(1 − ω_{K/Q}(q)q⁻¹)) = Σ_{q | d inert, q ≠ ℓ} μ_ℓ(λ_q) + b_ℓ(λ_ℓ, dN(a)⁻¹)`, where `W̃ = g(λ_𝔩, μ)` is the Gauss sum of `λ_𝔩`, viewed as a Dirichlet character of `ℓ`-power conductor, at a root of unity `μ` of order `ℓ^{v_ℓ(d)}` when `ℓ | d` and `ℓ` splits, and `W̃ = 1` otherwise (Finis, Proposition 3.7, (15), p.789);
- consequently, for `λ` of type `(−1, 0)` with `W(λ) = +1` and a normalised integral eigenfunction `ϑ_λ`, `v_ℓ(Ω⁻¹ W̃ D^{1/4} L(0, λ)) = Σ_{q ≠ ℓ inert} μ_ℓ(λ_q) + b_ℓ(λ_ℓ, w(λ)) + 2 v_ℓ(l(ϑ_λ)/w_K)`, with `W̃ = 1` for nonsplit `ℓ` and `v_ℓ(W̃) = v_ℓ(W_ℓ(λ))` for split `ℓ` (Finis, proof of Theorem 1.1, p.794, FINIS06 lines 1130–1148).

The period `Ω` is that of a pair `(E, ω)` with good reduction at the `ℓ`-adic place and `ω` reducing to a nonvanishing differential (Finis, p.768). *Needs:* §§4.1–4.2; ComplexMultiplicationAndExplicitReciprocity §1.2 CM period and de Rham pairings (with its period-lattice comparison); EllipticCurves Layer 1.

API:

- `T^{int}_{r,a}` is a lattice in `T^{ar}_{r,a} ⊗ ℂ`, stable under `A_x`, `x ∈ a*`, and under `F*(c)` for `c` prime to `𝔩`.
- `(ϑ†)† = ϑ` and `(F*(c)ϑ)† = F*(c̄)ϑ†`; for a Shintani eigenfunction `ϑ† = γϑ` with `|γ| = 1` (Finis, Lemma 3.5, p.787).
- `b_ar` and `b′_ar` scale by `Ω/2π` relative to `b` and `b′`, and the valuation identity is unchanged when `Ω` is multiplied by an `ℓ`-unit.

**Checks.**

- Discriminant bookkeeping in the last identity: substituting (15) into (13), the factor `1/√D` of (13) contributes `−v_ℓ(D)/2`, solving (15) for `−v_ℓ(b′_ar)` contributes `+v_ℓ(D)/4`, and the `D^{1/4}` on the left contributes `+v_ℓ(D)/4`; the sum is `0`, so no power of `D` survives. With `√D` in the numerator of (13) instead, a ramified `ℓ` would leave an extra `v_ℓ(D)`.
- Placement of the pairing in (15): if `v_ℓ(W̃) = v_ℓ(D) = 0`, `v_ℓ(b′_ar) = 3/4` and the product has valuation `1`, the left side is `0 − 0 − 3/4 + 1 = 1/4`; putting `b′_ar` in the numerator would give `7/4`.
- `v_ℓ(l(ϑ_λ)/w_K) ≥ 0` gives the lower bound `v_ℓ(Ω⁻¹ W̃ D^{1/4} L(0, λ)) ≥ Σ μ_ℓ + b_ℓ`, except possibly for `K = Q(√−3)`, `ℓ = 3`.
- Normalisation: replacing a normalised `ϑ` by `ℓϑ` keeps it integral but not normalised, raises `v_ℓ(l(ϑ))` by `1` and `v_ℓ(b′_ar(ϑ, ϑ))` by `2`.
- Split `ℓ`: `b_ℓ = 0` and `W̃` is the Gauss sum, so for `ℓ = 11` split in `Q(√−7)` and `λ` unramified at `11`, `ℓ ∤ d` gives `W̃ = 1`; an arbitrary choice such as `W̃ = 11` would shift the left side by `1`.
- Replacing `ω` by `ℓω` changes `Ω` by `ℓ` and the left side by `−1`; the good-reduction normalisation excludes it.

### 4.4 Torsion points on subvarieties in characteristic ℓ

Prove, in the form used by Finis: let `E` be an elliptic curve over `F̄_ℓ` with CM by `O_K`, `p` a prime with `ℓ ≠ p`, `r ≥ 1`, and `B ⊂ E^r` an irreducible closed subvariety such that `B ∩ E^r[p^∞]` is Zariski dense in `B`. Then `B` is a translate of its stabiliser, an algebraic subgroup of `E^r` (Finis, proof of Lemma 4.5, p.803, FINIS06 line 1587, applying Boxall 1992, Théorème 1, pp.1063–1066). Deduce Finis's Lemma 4.5: for `β_ν ∈ O_{K_p}` and an infinite subset `M ⊂ E[p^n p̄^∞]`, the Zariski closure of `(⟦β_ν⟧P)_ν` contains a translate of the abelian subvariety cut out by the `O_K`-relations among the `p̄`-components `α′_ν` of the `β_ν = (α_ν, α′_ν)` (Finis, Lemma 4.5, p.803, FINIS06 lines 1571–1584). *Needs:* EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §1.2 (the period-lattice comparison).

**Checks.**

- `r = 1`: an irreducible curve `B = E` is a translate of `E`; a finite `B` with dense torsion is a torsion point, a translate of the trivial subgroup.
- The diagonal in `E²` contains all `(P, P)` with `P ∈ E[p^∞]` and is a subgroup; the graph of `[2]` likewise.
- A curve in `E²` of genus at least two contains only finitely many `p`-power torsion points; it is not a translate of a subgroup and its torsion is not dense.
- Relations among the second components: for `β_0 = (1, 1)`, `β_1 = (2, 1)` the relation module of the `α′_ν` is `{(x, −x)}` and the subvariety is the diagonal of `E²`, while relations among the full pairs would give `0` and all of `E²`.

### 4.5 Nonvanishing of theta functions modulo ℓ

Prove: let `ℓ ≠ p` be primes, `p` odd and split in `K`, and `d_0` a positive integer prime to `p`. For `m` large enough, for every character `λ` appearing in the Shintani representation on `T^{prim}_{d_0 p^m}` there is an `ℓ`-integral representative `ϑ` of the `λ`-eigenspace with `v_ℓ(l(ϑ)/w_K) = 0` (Finis, Theorem 4.1, p.795, FINIS06 line 1221). Proof route: fix the restriction of `λ` to `Λ_{d_0D}` and write the eigenfunctions explicitly (Lemma 4.2); assuming infinitely many eigenspaces with `v_ℓ(l(ϑ)/w_K) > 0`, reduce modulo `ℓ` and apply Galois conjugation to place infinitely many `p`-power torsion points on a subvariety `D_{n_1} ⊂ E^r` in characteristic `ℓ` (Lemmas 4.3–4.4); §4.4 gives a translate of an explicit abelian subvariety inside `D_{n_1}`, contradicted for large `n_1` (Lemmas 4.6–4.7, pp.795–807). *Needs:* §§4.2–4.4.

**Checks.**

- The statement is for all `λ` at sufficiently large level `m`; at small level a single eigenspace may have `v_ℓ > 0`.
- `ℓ = p` is excluded: the reduction argument uses `p`-power torsion in characteristic `ℓ ≠ p`.
- The unit `w_K` is invertible at `ℓ` unless `ℓ | w_K`, which occurs only for `ℓ = 3`, `K = Q(√−3)` or `ℓ = 2`.
- The assertion is about some integral representative: `ℓϑ` is also integral and has `v_ℓ(l(ℓϑ)/w_K) = 1`.

### 4.5a Comparison of weights at a split valuation prime

Let `ℓ` be odd and split, `k ≥ 1`, and `λ` Finis-anticyclotomic of type `(−k, k−1)` with `W(λ) = +1`. Write `B_k(λ) = Ω^(1−2k)(k−1)!(2π/√D)^(k−1)W_ℓ(λ)L(0, λ)` and `α(λ) = Σ_{q inert} μ_ℓ(λ_q)`. Use the bounded ordinary ray-class measure of AutomorphicPadicLFunctionsPartII §8.5. For a tame modulus containing the conductor away from `ℓ`, first take characters ramified at every prime of that modulus. Prove that its `λ`-moment, with the ordinary unit periods, has valuation `v_ℓ(B_k(λ)(1 − λ(𝔩̄))²)`; a local value at a ramified prime is `0` in this Euler-factor notation. Retain all tame depletion factors when the conductor has smaller support. This comparison includes the period duality, factorial, local Gauss sum and two ordinary Euler factors (Finis, proof of Theorem 1.1, p.794, FINIS06 lines 1149–1165).

For `k > 1`, prove the change-of-weight comparison: choose a character `σ` of type `(k−1, 1−k)` with conductor dividing `ℓ^m`, for a fixed `m` depending on `K, ℓ, k`, whose avatar factors through the torsion-free anticyclotomic quotient `W_ac ≅ Z_ℓ` and is congruent to `1`. Then `λ′ = λσ` has type `(−1, 0)`, `W(λ′) = +1` and `α(λ′) = α(λ)`. Weighting the ordinary measure by `λ′` and projecting to `W_ac` gives a measure divisible by a scalar of valuation `α(λ)`: deduce this from the weight-one lower bound of §4.3 by one-variable preparation. The two moments differ by an element of valuation strictly greater than `α(λ)`, since the avatar of `σ⁻¹ − 1` is in the maximal ideal. Consequently `v_ℓ(B_k(λ)) ≥ α(λ)`, with strict inequality exactly when `v_ℓ(B_1(λ′)(1 − λ′(𝔩̄))²) > α(λ)`; for `k > 1` the factor `1 − λ(𝔩̄)` is a unit (Finis, pp.794–795, FINIS06 lines 1166–1208). Along a fixed split tower prime `p ≠ ℓ`, the extra failure `λ′(𝔩̄) ≡ 1` occurs for only finitely many twists, because distinct `p`-power roots of unity remain distinct modulo `ℓ`; together with §4.5 this gives finiteness of the higher-weight exceptional set (Finis, p.795, FINIS06 lines 1209–1216). *Needs:* §§4.1, 4.3, 4.5; AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2, 8.5; PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5; GlobalNumberFields Layer 10.

**Checks.**

- At `k = 1, 2, 3` the multiplier before `W_ℓ(λ)L(0, λ)` is respectively `Ω⁻¹`, `Ω⁻³(2π/√D)` and `2Ω⁻⁵(2π/√D)²`; the factorial first differs from `1` at `k = 3`.
- Types add: `(−2, 1) + (1, −1) = (−1, 0)`; the inverse twist would give `(−3, 2)`.
- At `ℓ = 11`, `v_11(λ′(𝔩̄) − 1) = 1` makes the squared Euler factor contribute `2`; if the value is `0` by ramification the factor is `1` and contributes `0`. Deleting this factor before the comparison changes the exceptional set.
- For an inert valuation prime there is no ordinary splitting: the two sets of CM places coincide, so the supplied ordinary measure does not apply and no higher-weight conclusion is asserted.

### 4.6 Finis's divisibility theorem

Prove: let `d` and `k` be fixed positive integers, `p` an odd prime split in `K` (the tower prime), `ℓ` an odd prime different from `p` (the valuation prime), and `Ω` the period of a pair `(E, ω)` as in §4.3. For all but finitely many anticyclotomic Hecke characters `λ` of `K` of conductor dividing `dDp^∞`, Finis type `(−k, k−1)` and `W(λ) = +1`:

- if `ℓ` splits in `K`, `v_ℓ(Ω^(1−2k)(k−1)!(2π/√D)^(k−1) W_ℓ(λ) L(0, λ)) = Σ_{q inert} μ_ℓ(λ_q)`;
- if `ℓ` is inert or ramified in `K` and `k = 1`, `v_ℓ(Ω⁻¹ D^{1/4} L(0, λ)) = Σ_{q ≠ ℓ inert} μ_ℓ(λ_q) + b_ℓ(λ_ℓ, w(λ))`;

and for every such `λ` (finite exception set or not) the left side is at least the right side, except possibly for `K = Q(√−3)`, `ℓ = 3`. The displayed normalised values are algebraic (Finis, Theorem 1.1, p.769, FINIS06 lines 101–122; proof, pp.793–795). Proof route: for `k = 1`, §4.3's identity reduces the equality to `v_ℓ(l(ϑ_λ)/w_K) = 0` for almost all `λ`, which is §4.5; §4.5a gives the split case for `k > 1`. *Needs:* §§4.1–4.5a.

**Checks.**

- `W(λ) = −1`: `L(0, λ) = 0` by the functional equation and the theorem says nothing.
- If `λ` is unramified at every inert prime, the right side of the split case is `0` and almost all normalised values are `ℓ`-units.
- The tower prime must be split: with `p` inert the family of conductor `dDp^∞` is not the one of Theorem 4.1.

### Examples

For `K = Q(√−7)` (`D = 7`), tower prime `23`, valuation prime `5`: `D^{1/4} = 7^{1/4}` is a `5`-adic unit; for `λ` unramified at every inert prime, the nonsplit identity reads `v_5(Ω⁻¹ 7^{1/4} L(0, λ)) = b_5(λ_5, w(λ))`, and `b_5 = 0` when `λ_5` is unramified. For `r = 25`, `a = O_K`, the theta space has dimension `175` and its primitive part dimension `168`.

### Dependencies

AL.1; AnalyticNumberTheoryPartI §2.3a; ComplexMultiplicationAndExplicitReciprocity §1.2; EllipticCurves Layers 1–2; AutomorphicPadicLFunctionsPartII §§5.1, 6.1–6.2, 8.5; PadicMeasuresIwasawaAlgebras §§1.7, 4.3, 4.5; GlobalNumberFields Layer 10; Tau Ceti `HeckeCharacter`.

## Layer 5: Unit values in the canonical family

From here on `φ` is a canonical Gross character (`IsCanonicalGrossCharacter`), `−D` is odd with `2` split in `K`, `p ≥ 5` is inert with `p ∤ h_K D`, and `l` is the auxiliary prime of §0.5.

### 5.1 The weight-one Finis family

Construct `λ_ν = φ̄ν/N` for `ν ∈ X_l`: on ideals prime to the conductor, `λ_ν(a) = φ̄(a)ν(a)/N(a) = φ(a)⁻¹ν(a)`; at the idele level, multiply `φ̄ν` by the norm absolute value, so the archimedean component is `z`. Prove: `λ_ν` has Finis type `(−1, 0)`, is anticyclotomic in Finis's sense (`λ = λ*`), has conductor dividing `dDl^∞` for a fixed `d`, `L(0, λ_ν) = L(φ̄ν, 1)`, and `W(λ_ν) = +1`; the family is injective in `ν` (Finis, §1, p.768; Theorem 1.1, p.769; proof of Corollary 2.3, p.778; BKO, p.954). The period is that of the same pair `(E, ω)` as §0.4, which has good reduction at the valuation prime `p`. *Needs:* §§0.4, 0.6, 1.1, 1.2, 4.1; ComplexMultiplicationAndExplicitReciprocity §4.3; AnalyticNumberTheoryPartI §2.3a.

API:

- `λ_ν(a) = φ̄(a)ν(a)/N(a)` on prime-to-conductor ideals.
- Self-duality from `φφ̄ = N` and `ν^c = ν⁻¹`.
- `L(0, λ_ν) = L(φ̄ν, 1)`, with matching primitive Euler factors.
- `λ_ν = λ_{ν'}` if and only if `ν = ν'`.
- Algebraic embeddings of the value field transport the family and its normalised values.

**Checks.**

- Centres of the two norm twists of `η = φ̄ν`: the divided twist has `L(η/N, s) = L(η, s + 1)` and centre `0`; the opposite twist `Nη` has `L(Nη, s) = L(η, s − 1)` and centre `2`, and its value at `s = 0` is `L(η, −1)`. At a prime of norm `25` with `η(a) = −5` (the inert prime `5` of `Q(√−7)`, `ν = 1`), the divided coefficient is `−1/5`, and the denominators of the divided twist at `0`, of `η` at `1` and of `Nη` at `2` are all `6/5`, while `Nη` at `s = −1` gives `3126`.
- Euler denominators: `1 − φ̄(a)ν(a)Q^{−s}·Q^{−1}` at `s = 0` equals the `φ̄ν` denominator at `s = 1`.
- Finis's tower prime set to the inert `p` violates the split hypothesis of §4.6.
- `ν = 1` belongs to the family with sign `+1`; the almost-all theorem need not make its value a unit.

### 5.2 All inert correction terms vanish

Prove: for `λ_ν` in the canonical family, `μ_p((λ_ν)_q) = 0` for every inert `q ≠ p` and `b_p((λ_ν)_p, w(λ_ν)) = 0`: the canonical conductor is supported on ramified primes, `ν` is ramified only above the split `l`, the norm twist is unramified, and `p ∤ fl`, so `λ_ν` is unramified at every inert prime, including `p` (Finis, pp.768–769 and p.788; BKO, p.954). *Needs:* §§4.1, 4.3, 5.1; ComplexMultiplicationAndExplicitReciprocity §4.3 Canonical Gross good reduction away from the discriminant.

**Checks.**

- An extra inert prime in the conductor would contribute `μ_p ≥ 0` and is excluded by the canonical support condition.
- Changing the depth of `ν` at `l` changes no inert term.
- At `p` the character is unramified, the branch where `b_p = 0` (§4.3); `μ_p` of an unramified character is `0` by definition, not the minimum over units of `v_p(1 − 1) = ∞`.

### 5.3 The deleted auxiliary factors equal one

Prove: for `ν ≠ 1` of exact order `l^r` and conductor `l^m`, `m = r + 1`, the conductor of `φ̄ν` is `f l^m`; both primes above `l` are ramified for `φ̄ν`, so the local factors there are `1` and `L_{f l^m}(φ̄ν, 1) = L_f(φ̄ν, 1)`. This fails for `ν = 1`. Deleting the inert `p`-factor at the trivial `p`-character gives `1 + 1/p`, not a unit (BKO, (3.6)–(3.9), pp.953–954). *Needs:* §§0.3, 0.6, 3.4; AL.1.1.1 Local quasi-characters, unramified characters and the conductor exponent; AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- `ν = 1`: the factors at `l` are `(1 − φ̄(λ)/l)` for the two primes `λ | l`, nontrivial in general.
- A ramified rank-one local representation has no inertia invariants, so its factor is `1`.
- `p` and `l` deletions are separate: `L_{p f l^m}(φ̄ν, 1) = (1 + 1/p)L_f(φ̄ν, 1)` for `ν ≠ 1`.

### 5.4 Almost all normalised auxiliary values are p-units

Prove: for the canonical `φ` and the auxiliary `l`, all but finitely many `ν ∈ X_l` satisfy `v_p(Ω⁻¹ L_f(φ̄ν, 1)) = 0`; the value is algebraic in the normalisation of §0.4, hence a unit in the integers of every finite extension of `Φ` containing it (BKO, (3.9), p.954). Proof route: apply §4.6 in the nonsplit case with tower prime `l` and valuation prime `p` to `λ_ν`; its right side is `0` by §5.2; `D^{1/4}` is a `p`-adic unit since `p ∤ D`; transport by §5.1 and §5.3; injectivity of `ν ↦ λ_ν` keeps the exceptional set finite. *Needs:* §§0.4, 4.6, 5.1–5.3.

**Checks.**

- The finite exceptional set may contain `ν = 1`.
- Positive root number alone gives no unit statement; Finis's theorem is the input.
- Dropping `D^{1/4}` before checking its valuation would be wrong if `p | D`; here `p ∤ D`.

### 5.5 A nontrivial unit-value witness

Prove: there is `ν ∈ X_l`, `ν ≠ 1`, with `Ω⁻¹L_f(φ̄ν, 1)` a `p`-adic unit, and such `ν` have arbitrarily large conductor (BKO, proof of Theorem 3.4, pp.953–954). Proof route: for each `r ≥ 1` choose a primitive character of order `l^r`, conductor `l^{r+1}`; remove the finite exceptional set of §5.4. *Needs:* §§0.6, 5.4.

**Checks.**

- No claim is made for `ν = 1`.
- The characters for distinct `r` are distinct since their conductors differ.
- The witness uses neither a signed decomposition nor a primitive Iwasawa coordinate.

### 5.6 Unramified coefficients for the canonical family

Prove: for canonical `φ` with `p ∤ h_K D` and `ν ∈ X_l`, the field `Φ(φ, ν)` generated over `Φ` by the values of `φ` on ideals prime to `f` and of `ν` is finite unramified; `T_φ` and the evaluation at `ν` are defined over its integers `W`; and `A_ν = Ω⁻¹L_f(φ̄ν, 1)` lies in a finite unramified extension of `Φ`, so valuation zero makes it a unit of the integers of any unramified coefficient field containing it. Proof route: for a class representative `a` of order `d | h_K`, `a^d = (α)` with `α` prime to `pf` and `φ(a)^d = ±α`; since `p ∤ d`, `X^d ∓ α` generates an unramified extension; the values of `ν` have `l`-power order; for the value, apply §2.8 at level `g = f l^m` with `ν` trivial on the `p`-part, so the weighted sum is invariant under `Gal(K(gp^n)/K(g))` and lies in `W[1/p] ⊗ coLie(E) ⊗_K K(g)`, with `K(g)/K` unramified above `p`; the `p`-factor `1 + 1/p` is rational and the `l`-factors are `1` for `ν ≠ 1` (BKO, p.954; Kato 2004, Proposition 15.9, p.258). *Needs:* §§0.6, 2.8, 3.3, 5.3; ComplexMultiplicationAndExplicitReciprocity §4.3; LocalFieldsRamification Layer 2; GlobalNumberFields Layer 10.

**Checks.**

- `p | h_K`: `X^p − u` can be ramified, and the proof fails; for `p = 5`, adjoining a fifth root of `6` gives the shifted polynomial `Y⁵ + 5Y⁴ + 10Y³ + 10Y² + 5Y − 5`, Eisenstein at `5`.
- `X² − 2` is irreducible modulo `5` with nonzero derivative, so a square root of `2` generates an unramified extension of `Q_5`, as the prime-to-`p` root argument requires.
- A rescaling of `Ω` by a ramified unit preserves valuations but leaves the unramified normalisation.
- `ν = 1` uses level `f` and keeps `1 + 1/p` separate.

### 5.7 Scalar and tensor character kernels

Prove: let `F = Φ_n` and `U = Frac(W)` as in §5.6. The multiplication map `F ⊗_Φ U → C_p` is injective; hence for `χ` of the finite anticyclotomic quotient with values in `F` and `x_σ ∈ F ⊗_Φ U`, `Σ_σ χ(σ)x_σ = 0` if and only if its image in `C_p` is `0`; the same holds for the integral tensor after its flat injection (BKO, §2, pp.948–949, and §3.0.2, pp.953–954). Proof route: a common subextension of the totally ramified `Φ_n` and the unramified `U` is `Φ`; linear disjointness follows and is equivalent to injectivity (`Subalgebra.linearDisjoint_iff_injective`). For a ramified coefficient field this fails, and no statement is made for it. *Needs:* §§3.5, 5.6; LocalFieldsRamification Layers 2–3; Mathlib `Subalgebra.linearDisjoint_iff_injective`.

**Checks.**

- `U = F` with `F ≠ Φ` ramified: `a ⊗ 1 − 1 ⊗ a` for `a ∉ Φ` is nonzero with image `0`.
- `n = 0`, `p = 5`, `U = Φ(ζ_23)`: `ζ_23` generates an unramified extension of `Φ` of degree `11` (the order of `25` modulo `23`), and `Φ_0 ⊗_Φ U` is a field of degree `24·11 = 264` over `Φ`.
- `χ` of order `p^n` takes values in `μ_{p^n} ⊂ Φ_n` by §3.5.

### Examples

For `K = Q(√−7)`, `p = 5`, `l = 23`: `D^{1/4} = 7^{1/4}` has `v_5 = 0`; for `ν` of order `23`, the factors at the two primes above `23` are `1`; almost all `Ω⁻¹L_f(φ̄ν, 1)` are `5`-adic units. These are hypothesis and normalisation checks; no particular value is asserted to lie outside the exceptional set.

### Dependencies

Layers 0, 1, 2, 3 and 4; ComplexMultiplicationAndExplicitReciprocity §4.3; AnalyticNumberTheoryPartI §2.3a; AL.1, AL.5; LocalFieldsRamification Layers 2–3; GlobalNumberFields Layer 10.

## Layer 6: Nonvanishing of central values

### 6.1 Rohrlich's lattice-point count

Define `rohrlichCount P α β q t`, for a finite set `P` of primes, `α_p, β_p ∈ Z_p`, a positive integer `q` and `t > 0`, as the number of `(u, v) ∈ Z²` with `|u|, |v| ≤ t` such that for every `p ∈ P`, `uβ_p − vα_p` is nonzero and lies in `qZ_p` (Rohrlich 1984, §3, p.401, ROHRLICH84 line 763). The Lean form indexes `α` and `β` by `Nat.Primes`, with the primality instance `factPrime` that makes `Z_p` available for each element. Prove, for `α_p, β_p` algebraic over `Q` and not both `0`:

- `rohrlichCount_eq_zero`: for every `c < 1/2`, `M(q, q^c) = 0` for all sufficiently large `q` divisible only by primes of `P` (Rohrlich 1984, §3, Proposition 1, pp.401–402);
- `rohrlichCount_lt`: for every `d` and `s` with `1/2 < d < 3/5` and `5d/2 − 1 < s < 1/2`, `M(q, q^d) < q^s` for all sufficiently large such `q` (Rohrlich 1984, §3, Proposition 2 and its proof, pp.402–407, ROHRLICH84 lines 896–900).

Proof route: Ridout's inequality `∏_{p ∈ P}|u − vγ_p|_p > k·max(|u|, |v|)^{−κ}` for algebraic `γ_p`, `κ > 2`, from DiophantineApproximationAndTranscendence §2.3 (or §2.1 in two variables), extended from coprime pairs to all pairs; part one with `γ_p = α_p(β_p + jα_p)⁻¹` and `c < 1/κ < 1/2`; part two by covering the box with squares of side `q^c`, part one, the rational-line case and a Dirichlet-principle subdivision along a line. Jia's restatement prints the modulus `Z_p` instead of `qZ_p` and the box bound `q⁻¹` instead of `q^c` (Jia, §4, pp.18–20); Rohrlich's text is the reference. *Needs:* DiophantineApproximationAndTranscendence §§2.1, 2.3; Mathlib `PadicInt`, `Set.ncard`.

API:

- Invariance under rescaling `(α_p, β_p) ↦ (γ_pα_p, γ_pβ_p)` with `γ_p ∈ Z_p×`.
- Monotonicity in `t` and in the divisibility of `q`.
- The set counted is finite (a bounded box).

**Checks.**

- `P = {p}`, rational direction `(a, b) ∈ Z²`: `|ub − va|` is a nonzero integer divisible by `q`, so it is at least `q`, while `|ub − va| ≤ (|a| + |b|)q^d`; hence `M(q, q^d) = 0` for any fixed `d < 1` and large `q`.
- With modulus `Z_p` in place of `qZ_p`, every pair in the box off the direction line counts, `M(q, q^c)` grows like `q^{2c}`, and part one fails.
- Boundary of the box: for `c < 0` and `q > 1` the box contains only `(0, 0)`, excluded by the nonvanishing condition, so `M(q, q^c) = 0`. For `c = 0` the box is `{−1, 0, 1}²` and the count need not vanish for small `q`: with `P = {5}`, `α_5 = 5`, `β_5 = 0`, the pairs counted at `q = 5` are the six `(u, ±1)`, `u ∈ {−1, 0, 1}`, while at `q = 25` there are none. The theorem is eventual in `q`.
- `d = 11/20`, `s = 7/16`: `5d/2 − 1 = 3/8 < 7/16 < 1/2`, an admissible pair.
- `P = ∅`: the only `q` divisible only by primes of `P` is `1`, so the statements are vacuous beyond `Q = 2`.

### 6.2 The Galois-average limit

Prove: let `K` be imaginary quadratic, `φ` as in §0.1, `P` a finite set of primes, `L_P` the union of the ring class fields of conductor divisible only by primes of `P`, and `ρ` ranging over the characters of finite order of `Gal(L_P/K)` with `W(φρ) = +1`. Partition by the rational support `R` of the conductor and write `η = φρ`, `f(η) = (N cond η)^{1/2}`, `κ_R` the quadratic character induced to a modulus containing `R`, extended by zero on `R`. As `f(η) → ∞` within a fixed support, the average of `L(1, η^σ)` over the `K`-embeddings `σ` of the value field tends to `2L(1, κ_R) ≠ 0`; there are finitely many supports (Jia, Theorem 1, p.2; §2, (2.20)–(2.29), pp.6–7; Propositions 1–2, pp.7–8; Main Lemma 2, pp.13–14; Lemma 3, pp.17–18; Proposition 5, pp.18–20; Rohrlich 1984, §1, pp.386–392, and §4, p.407). Proof route: the sign-positive approximate functional equation with `A = √|disc K|/(2π)`; the rational-ideal part tends to `2L(1, κ_R) = 2L(1, κ_K)∏_{q ∈ R}(1 − κ_K(q)/q)`, retaining the conductor exclusions and their Euler deletions; each `η^σ` has the same conductor and root number (Jia, (2.13)–(2.18), pp.5–6); the non-conjugation-stable ideals with nonzero averaged character are counted through the trace-of-roots-of-unity criterion, the class-group reduction with `a_0^h = (w_0)` and the retained `h`-th root, and §6.1, giving `N_η(f^a) = 0` for `a < 1` and `N_η(f^b) < f^r` for some `b > 1`, `r < 1/2`; choose `2r < a < 1`, bound the middle sum by `O(f^{r − a/2})` and the tail by ideal counting and the cutoff `exp(−N(a)/(Af))`. Jia's printed tail bound has the wrong sign in the exponent (Jia, (2.43), p.10) and the inverse `n⁻¹` in the rational-principal law before (2.1), p.4; the correct forms are used. *Needs:* §§0.1, 0.3, 6.1; AnalyticNumberTheoryPartI §2.3a; AL.1.3.5 Explicit local ε-factors; ArithmeticDirichletSeries Layer 5; GlobalNumberFields Layers 9–10; ClassFieldTheory Layer 13; Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`.

**Checks.**

- `K = Q(√−7)`, `P = {5}`, support `R = {5, 7}` (the ramified `7` always lies in the support, since `κ_K` has conductor `7`): the limit is `2L(1, κ_K)(1 − κ_K(5)/5)(1 − κ_K(7)/7) = 2L(1, κ_K)(1 + 1/5)`; the unrestricted constant `2L(1, κ_K)` is wrong, and the support `{5}` alone does not occur.
- For `h_K > 1` the `h`-th roots and the coset directions survive; no class-number-one hypothesis is used.
- Exponents: `r = 7/16`, `a = 15/16` satisfy `2r < a < 1`, and `r − a/2 = −1/32 < 0`, so the middle sum decays.
- The estimates are ineffective: no conductor bound for the exceptions is part of the statement.

### 6.3 Galois stability of central vanishing

Prove: for `η = φρ` as in §6.2 and `σ ∈ Aut(ℂ/K)`, `L(η, 1) = 0` implies `L(η^σ, 1) = 0`, where `η^σ(a) = σ(η(a))`. Proof route: let `θ_η` be the weight-two newform with `L(θ_η, s) = L(η, s)` (GL2AutomorphicRepresentationsAndTransfer R17.4.16); its coefficient conjugate is `θ_{η^σ}`; the algebraic normalised critical value `L(θ_η, 1)/Ω^+` is carried by `σ` to that of `θ_{η^σ}` (ModularSymbolsPadicLFunctions §§1.2, 4.3), so vanishing is preserved (Jia, p.3, JIA24 lines 96–100, citing Shimura). *Needs:* §0.1; ModularSymbolsPadicLFunctions §§1.2, 4.3; GL2AutomorphicRepresentationsAndTransfer R17.4.16.

**Checks.**

- Take `K = Q(√−7)`, `p = 5`, canonical `φ`, and `ρ` of order `25` in the `5`-anticyclotomic family. A `σ` fixing `K` and acting by `ζ_25 ↦ ζ_25²` sends `ρ` to `ρ²`; both have conductor exponent `3`, hence root number `−1` and central value `0` (§§1.1, 1.4–1.5). For `σ = id` the implication is the identity.
- Complex conjugation is not in `Aut(ℂ/K)` (it sends `i` to `−i` for `K = Q(i)`); the separate identity `L(η̄, 1) = L(η, 1)` comes from reindexing ideals by `a ↦ ā` (§1.5), not from this theorem.
- Nonvanishing is not transported by a transcendental period alone; the algebraic normalisation is essential.
- `η` and `η^σ` have the same conductor, so the family of §6.2 is stable under `σ`.

### 6.4 Correct-sign central values are almost always nonzero

Prove: for `φ` as in §0.1 and a fixed anticyclotomic `ν` of odd finite order, all but finitely many `χ` in the `p`-anticyclotomic family with `W(φνχ) = +1` satisfy `L(φνχ, 1) ≠ 0`, and then `L_S(φνχ, 1) ≠ 0` for every finite `S`; the same holds for `φ̄νχ` (Jia, Theorem 1, p.2, JIA24 line 66; BKO, §6.0.1, p.961). Proof route: `ρ = νχ` runs over characters of `Gal(L_P/K)` with `P = {p} ∪` the primes below the conductor of `ν`; if `L(η, 1) = 0` then by §6.3 every term of the Galois average vanishes, contradicting §6.2 for large conductor; finitely many `χ` have bounded conductor; §0.3 passes to deleted values; `L(φ̄νχ, s) = L(φν⁻¹χ⁻¹, s)` (§0.1). *Needs:* §§0.1, 0.3, 6.2, 6.3; AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- Agboola–Howard, proof of Proposition 3.1 and Remark 3.2, p.4 (AH05 lines 141–152): for a CM curve over `Q` and a primitive `χ` of order `p^n`, `n > 0`, `W(χψ) = (−1)^{n+1}W(ψ)`, a forced zero for one parity and Rohrlich's almost-all nonvanishing for the other; the formula fails for the trivial character, which has `c = 0`.
- Wrong-sign characters have value `0` (§1.5); the quantifier ranges over the correct-sign family only.
- An orbit of zero values has Galois average `0`, which cannot approach the positive limit `2L(1, κ_R)` of §6.2 along conductors tending to infinity.

### 6.5 The parity dichotomy

Prove `centralValue_parity_dichotomy`: let `K` be imaginary quadratic, `ι : K → ℂ`, `p` an odd prime with `pO_K` prime (inert), `v` the prime `pO_K`, `φ` with `IsEquivariantTypeOneZero ι φ` unramified at `v`, and `ν` an anticyclotomic character of odd finite order unramified at `v`; fix uniformizers `ϖ`. There is `ε ∈ {±1}` such that for every `χ` with `IsPAnticyclotomic p v χ` and `c = conductorExponent v χ`: if `(−1)^c = −ε` then `HasCentralValue (φνχ) ϖ 0`; and the set of `χ` with `(−1)^c = ε` for which no nonzero central value exists is finite. Here `ε = W(φν)`. Proof route: §1.4 gives `W(φνχ) = (−1)^c W(φν)`; §1.5 gives the zeros; §6.4 gives the nonvanishing; §0.3 identifies `HasCentralValue` with the continued value. The sign `ε` is determined, because the family contains infinitely many characters of each parity of `c` (§0.2). By `L(φ̄νχ, s) = L(φν⁻¹χ⁻¹, s)` the statement holds verbatim for the characters `φ̄νχ` used in BKO §§3 and 6. No hypothesis `p ∤ h_K` or `p ≥ 5` is needed. *Needs:* §§0.1–0.3, 1.4, 1.5, 6.4.

**Checks.**

- `K = Q(√−7)`, `p = 5`, `φ` canonical, `ν = 1`: `ε = +1`; `χ` of order `5` (`c = 2`) has almost always nonzero value; `χ` of order `25` (`c = 3`) has value `0`.
- `p = 3`, `K = Q(√−7)` (`3` inert since `(−7/3) = (2/3) = −1`): the statement applies; `p = 2` is excluded since the family would contain characters of even order.
- If `φ` were ramified at `p`, the unitary value at `p` is undefined and the parity factor can change; the hypothesis `φ` unramified at `v` is used.
- Taking `ε` of the wrong sign makes both clauses fail: the infinitely many correct-sign characters with nonzero value would be claimed to vanish, and the infinitely many forced zeros would fill the set claimed finite.

### Examples

Worked parity table for `K = Q(√−7)`, `p = 5`, canonical `φ`, `ν ∈ X_{23}`: `W(φ) = W(φν) = +1`; orders `1, 5, 25, 125` of `χ` have `c = 0, 2, 3, 4` and signs `+1, +1, −1, +1`; the `c = 3` values vanish and almost all others do not.

### Dependencies

Layers 0 and 1; DiophantineApproximationAndTranscendence §§2.1, 2.3; ArithmeticDirichletSeries Layer 5; AnalyticNumberTheoryPartI §2.3a; AL.1, AL.5; ModularSymbolsPadicLFunctions §§1.2, 4.3; GL2AutomorphicRepresentationsAndTransfer R17.4.16; GlobalNumberFields Layers 9–10; ClassFieldTheory Layer 13.

## Downstream consumers

AnticyclotomicLocalUnits consumes the integral class and its reciprocity (§§2.7–2.10), the towers, splitting and Lubin–Tate comparison (Layer 3), the forced zeros (§1.5), the unit theorem and witness (§§5.4–5.5) and the scalar/tensor comparison (§5.7); it owns the `ξ_ν` projection, the `Δ`-averaging, derivatives and signed kernels, and must compare its native derivative with the scalar value. InertAnticyclotomicCMMainConjecture consumes the central nonvanishing and parity dichotomy (§§6.4–6.5) and the period laws (§2.10). The CM continuations of ModularIwasawaMainConjecturesPartII consume Kato's CM theta function, standard elliptic units, zeta elements, realisation and reciprocity law (§§2.1–2.6), stated here for every prime `p`. The scalar/tensor comparison applies only with unramified coefficients (§5.7).

## Worked examples

Take `K = Q(√−7)`, `p = 5`, the canonical character with conductor supported at `7`, and `l = 23`. The prime `2` splits and `(−7/5) = −1`, so `5` is inert, `h_K = 1`. An auxiliary character of order `23` has field layer of degree `23` and conductor `23²`, ramified at both primes over `23`, so both local factors are `1`. The inert Frobenius at `5` is `[−5]`, and `Φ_0/Φ` has degree `24`. Finis's discriminant factor `7^{1/4}` has `5`-adic valuation `0`. A `p`-character of order `5` has `c = 2` and sign `+1`; of order `25`, `c = 3`, sign `−1` and central value `0`. Group-algebra evaluation sends `[g]` with `ν(g) = ζ_23` to `ζ_23`, not `ζ_23⁻¹`. Changing `ω` by `2` fixes the class and halves the scalar; `pω` is not allowed. The `p`-deleted trivial-character factor `6/5` has valuation `−1`. For scalar/tensor descent, `Φ_n` totally ramified and `U` unramified meet in `Φ`, so `Φ_n ⊗_Φ U` embeds in `C_5`; for `U = Φ_n` it does not.

## References

- **BKO21**: Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://doi.org/10.4007/annals.2021.194.3.8), Annals of Mathematics 194 (2021), 943–966. §2, pp.947–949; §3.0.2, pp.951–953, (3.3)–(3.7); Proposition 3.3, p.953; §3.0.3, Theorem 3.4 and its proof, (3.8)–(3.9), pp.953–954; §6.0.1, p.961.
- **KATO04**: Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/article/AST_2004__295__117_0.pdf), Astérisque 295 (2004), 117–290. Proposition 1.3, pp.121–122; §3.8, pp.138–140; §§15.3–15.9, pp.251–260.
- **KATO99**: Kazuya Kato, Generalized explicit reciprocity laws, Advanced Studies in Contemporary Mathematics (Pusan) 1 (1999), 57–126. Theorem 4.3.1 (the case of height `h = 1`).
- **FINIS06**: Tobias Finis, [Divisibility of anticyclotomic L-functions and theta functions with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf), Annals of Mathematics 163 (2006), 767–807. §1, pp.767–770; §2, pp.770–781, with (3)–(5), p.771–772, Proposition 2.2 and Corollary 2.3, p.778, (9)–(10) and Proposition 2.4, p.780; §3, Lemma 3.1, p.783, Proposition 3.4, p.786, Lemma 3.5 and Proposition 3.6, p.787, (14), p.788, Proposition 3.7, p.789; proof of Theorem 1.1, pp.793–795; Theorem 4.1 and Lemmas 4.2–4.7, pp.795–807.
- **YANG97**: Tonghai Yang, [Theta liftings and Hecke L-functions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0485/LOG_0007.pdf), Journal für die reine und angewandte Mathematik 485 (1997). Theorem 2.6, (2.19), p.43; Theorem 2.15, p.48.
- **BOXALL92**: John Boxall, Autour d’un problème de Coleman, Comptes Rendus de l’Académie des Sciences, Paris, Série I 315 (1992), 1063–1066. Théorème 1.
- **JIA24**: Haijun Jia, [On L-functions of Hecke characters and anticyclotomic towers](https://arxiv.org/abs/2412.05867v1), arXiv:2412.05867v1 (2024); published in Acta Arithmetica 224 (2026), 99–116. Locators refer to arXiv v1: Introduction, p.1; Theorem 1, p.2; Property 1, pp.3–4; §2; §4, Proposition 5, pp.18–20.
- **ROHRLICH84**: David E. Rohrlich, [On L-functions of elliptic curves and anticyclotomic towers](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0075/LOG_0028.pdf), Inventiones Mathematicae 75 (1984), 383–408. §1, pp.386–392; §3, pp.401–407; §4, p.407.
- **ROHRLICH-NOTES**: David E. Rohrlich, [Root numbers](https://math.bu.edu/people/rohrlich/pcmi.pdf), Park City lecture notes (2011). Propositions 1.4–1.6, pp.14–15; Lecture 2 §§5.1–5.2, (2.39)–(2.49), pp.34–36.
- **GREENBERG83**: Ralph Greenberg, [On the Birch and Swinnerton-Dyer conjecture](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0072/LOG_0016.pdf), Inventiones Mathematicae 72 (1983), 241–265. §1, pp.246–247.
- **QUEYRUT74**: Jacques Queyrut, [Sur l’équation fonctionnelle des séries L d’Artin pour des caractères réels](https://www.numdam.org/item/MSMF_1974__37__133_0.pdf), Mémoires de la SMF 37 (1974), 133–135. The theorem and its local formula on p.135.
- **RUBIN87**: Karl Rubin, [Local units, elliptic units, Heegner points and elliptic curves](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0026.pdf), Inventiones Mathematicae 88 (1987), 405–422. Lemma 3.1, p.409; §3, pp.409–410.
- **AH05**: Adebisi Agboola and Benjamin Howard, [Anticyclotomic Iwasawa theory of CM elliptic curves II](https://arxiv.org/abs/math/0401124), Mathematical Research Letters 12 (2005), 611–621; arXiv:math/0401124v2. Proposition 3.1 and Remark 3.2, p.4 of the arXiv version.
