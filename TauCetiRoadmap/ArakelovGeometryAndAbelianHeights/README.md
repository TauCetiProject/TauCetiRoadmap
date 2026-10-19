# Roadmap: arakelov geometry and heights of abelian varieties

**Summary.** Build the hermitian degree and the arithmetic height of a point, equip the Hodge line of an abelian variety with its integration metric, and derive relative and stable Faltings heights. The main outputs are the isogeny formula with its half-`log`-degree bounds, the equality between the Hodge and modular heights, Northcott finiteness for polarized moduli points, and a uniform lower bound in each dimension. The development also provides arithmetic divisors on schemes and dimension-zero stacks, logarithmic metrics at compactification boundaries, theta-height comparisons, and the component heights used in CM arithmetic.

## Scope and ownership

This roadmap owns hermitian metrics on arithmetic bundles and their degree, the arithmetic divisor/Green-function enhancement of ordinary divisors and Picard groups, and the comparison between metrized degree and ordinary point heights. It owns the Faltings metric, its normalization adapters, relative and stable Faltings heights, isogeny differents and their height identities, logarithmic growth of the Hodge metric, the metrized modular line, theta heights, and the arithmetic height identity for Zarhin’s product. **PadicDifferentialEquationsAndRigidCohomology** §RD.5.116 supplies its principal polarization and dimension formula.

Ordinary finite locally free bundles, symmetric and exterior powers and their determinant belong to **AlgebraicVectorBundles**, Layers L0B–L0C, including `FiniteLocallyFreeSheaf` and `determinantObj`; this roadmap equips these objects with hermitian metrics. Tau Ceti’s `ZLattice.covolume_sq_eq_det_gram` supplies the generic Gram-determinant calculation, while **DifferentialGeometry**, Layers 0–2 and §5.2, supplies differential forms, wedge products, orientation and integration. The complex period specialization and its arithmetic normalization are the work here.

The unmetrized Hodge bundle `e^*Ω¹` and its determinant are the interface of **AbelianSchemesAndArithmeticModuli** §§A1.3 and A6.38, and **NeronModelsAndSemistableAbelianVarieties** §1.11. The exact supplier contracts below record the imported interface and its checks. Abelian varieties, duals, polarizations, theta groups and their algebraic section spaces belong to abelian schemes; Néron models, semistability and their lattice comparison belong to Néron models. **PELModuli** §§M3.9 and M6.3–M6.10 supplies the moduli spaces and their Hodge line. The principal Siegel compactifications over `Spec ℤ` and their descended ample powers are targets of §5.0; the metric and exact height identity are targets of §§5.3–5.5. Section 2.0 gives the semi-abelian family and extension interface used by these targets.

**ArithmeticGaloisDuality** §D7.6 supplies local Tate duality for abelian varieties and the duality of isogeny sequences. Section 4.3 uses that pairing for its Kummer corollary and proves the Néron `Lie`-filtration asymptotics and dual-different identity.

**SchemeAndStackFoundations** §§3.4–3.5 and 4.17 supplies ordinary divisors, Picard groups, line-bundle norms and normal crossings; its §5.1 supplies Chow groups on the special fibres. Its §§1.19–1.22 supplies the Deligne–Mumford stack interface, and **AlgebraicModuliForArithmeticGeometry** §3.1 supplies quasi-coherent descent. **ComplexComparisonPartII** §§C−1.1, C0.4 and C5.1 supplies analytification and comparison of algebraic and analytic differential forms. **DiophantineApproximationAndTranscendence** §§0.2–0.3 supplies absolute scalar and tuple heights, field comparison and bounded-degree scalar Northcott. Sections 1.12–1.14 construct the metrized-degree realization, the projective line-bundle height class and its ample Northcott theorem, with the sup and Fubini–Study comparisons.

**FaltingsFinitenessAndIsogenyTheorems**, Layers R28.1–R28.2, consumes the height package. Its descent to number-field isomorphism classes without level, bounds inside an isogeny class, global Hodge–Tate determinant arguments, Tate theorems and Shafarevich finiteness remain there. CM-type invariance and the averaged Colmez theorem, higher arithmetic Chow products, Arakelov Riemann–Roch and general adelic intersection theory are outside this roadmap. The local CM comparison in §4.8 has its precise rank-one freeness hypothesis; it does not construct the whole CM cohomology theory.

## Conventions

Write `O_K = 𝓞 K` for a number field’s ring of integers and `Σ_K` for all embeddings `K → ℂ`. Complex conjugate embeddings both occur in `Σ_K`. An infinite place `v` instead occurs once, with `InfinitePlace.mult v` equal to 1 at a real place and 2 at a complex place. The hermitian norm at either representative of a complex place is the ordinary norm, and the multiplicity weights its logarithm. Use natural logarithms and positive norms; a section used in a degree formula is nonzero. Finite norms are absolute ideal norms. A determinant of a torsion-free module over `O_K` is an invertible module, not an arbitrarily chosen free rank-one module.

Inner products use Mathlib's convention: conjugate-linear in the first argument and linear in the second. Integration formulas for mixed arguments are written in that order; their diagonal values give the stated squared norms. On a scheme with several irreducible components, a rational function used for a principal Cartier divisor is invertible in the total ring of rational functions, and a rational section trivializes the line on every component.

The unnormalized hermitian degree is `deĝ(L̄) = log #(L/O_Ks) − Σ_σ log ‖s‖_σ` for an integral section `s ≠ 0`. Its normalized degree is `deĝ(L̄)/[K:ℚ]`. For higher rank, take the determinant metric first; slope additionally divides by the positive rank. Arithmetic Green functions use `−log ‖s‖²`, so the archimedean arithmetic degree has the factor `½`. Chow groups and the one-cycle pairing have rational coefficients; over `O_K[1/S]` the pairing takes values in `ℝ_S = ℝ/Σ_{p below S} ℚ log p`.

For a `g`-dimensional complex abelian variety the Faltings squared norm is

```text
‖α‖²_Fal = (i^(g²)/2^g) ∫_A α ∧ ᾱ = 2^(−g) |∫_A α ∧ ᾱ|.
```

The complex orientation is ordered `(x₁,y₁,…,x_g,y_g)`. The factor `i^(g²)` makes the form positive in every dimension. With the same finite Hodge lattice, the Deligne/Yuan–Zhang squared norm is `(2π)^(−g)|∫ α∧ᾱ|` and the unscaled squared norm is `|∫ α∧ᾱ|`. Thus

```text
h_Del = h_Fal + (g/2) log π;    h_unscaled = h_Fal − (g/2) log 2.
```

These formulas apply to both relative and stable heights. An unlabelled Faltings height uses the Faltings normalization. The component heights in §4.6–§4.8 and Pazuki’s comparison in §5.8 use the Deligne normalization explicitly. Mathlib’s `Height.logHeight` and `Projectivization.logHeight` are relative heights; divide by `[K:ℚ]` for an absolute point height. Mathlib’s `ModularForm.discriminant` is `Δ = η²⁴` with normalized `q`-product, whereas the lattice discriminant is `(2π)^12 Δ`.

All abelian varieties and their isogenies here are over characteristic-zero fields; `[n]` used as an isogeny always has `n ≠ 0` and logarithms of its degree use `|n|`. The dimension-zero case has the unit Hodge line and height zero. Stack degrees include automorphism weights and geometric residue points. Model-specific Galois invariance is over the model’s field of definition.

## Exact supplier contracts

### From Mathlib

Use `NumberField.RingOfIntegers`, `Module.Projective`, `Module.finrank`, `InnerProductSpace` and `NumberField.InfinitePlace` for the existing carriers. The finite projective module and its scalar extensions, together with conjugation-compatible inner products, are the data of a hermitian bundle. Use `FractionalIdeal.absNorm` and `Ideal.absNorm` for finite index terms. `FractionalIdeal.absNorm_span_singleton` identifies the norm of `(f)` with `|Norm_K/ℚ(f)|`; `NumberField.InfinitePlace.prod_eq_abs_norm` and `NumberField.prod_abs_eq_one` supply the archimedean and complete product formulas. The nonzero hypotheses in these formulas are retained.

`Ideal.absNorm_algebraMap` identifies `N_L(I O_L)` with `N_K(I)^[L:K]` for the rings of integers: both are finite free over `ℤ`, and `O_L` is finite and torsion-free over `O_K`. This does not require `O_L` to be free over `O_K`. `Algebra.norm_norm` supplies transitivity in a finite free scalar tower, as applies to the number fields. `ClassGroup`, `NumberField.Units.logEmbedding` and `NumberField.Units.regulator` supply the ideal-class quotient and unit lattice; the omitted coordinate of the logarithmic embedding is reconstructed by the product formula, with multiplicity included.

`NumberField.mulHeight_eq` gives the infinite-place product times the finite-place product of coordinate maxima. For a nonzero integral tuple, `NumberField.absNorm_mul_finprod_finitePlace_eq_one` gives the reciprocal norm of its coordinate ideal as that finite product. `NumberField.mulHeight_eq_max_abs_of_gcd_eq_one` is the coprime-integer check. `Height.logHeight` and `Projectivization.logHeight` keep their library conventions. `UpperHalfPlane`, `ZLattice.covolume`, `ModularForm.discriminant`, `ModularForm.discriminant_eq_q_prod`, `ModularForm.discriminant_ne_zero` and the discriminant’s weight-12 modular transformation supply the elliptic analytic interface.

### From vector bundles, covolumes and complex geometry

**AlgebraicVectorBundles** Layers L0B–L0C supplies `FiniteLocallyFreeSheaf`, `determinantObj`, tensor, dual, symmetric and exterior powers, with their affine and pullback comparisons. Tau Ceti’s module `TauCeti.Algebra.Module.ZLattice.Covolume` supplies `ZLattice.covolume_sq_eq_det_gram` for a full discrete lattice in a finite-dimensional real inner-product space with its canonical volume; Mathlib’s `ZLattice.covolume_eq_det_mul_measureReal` supplies the determinant/measure formula. These are the generic covolume results used in §2.2, including the empty basis.

**DifferentialGeometry** Layers 0–2 and §5.2 supplies `SmoothForm`, wedge products, complex-valued forms, orientations and `integralTopForm`, with chartwise change of variables. Section 2.3 specializes this integration theory to finite holomorphic coverings. **ComplexComparisonPartII** §C−1.1 supplies `complexSchemeAnalytification`, its complex points, smooth manifold charts and properness comparison; §C0.4 supplies `CoherentAnalytification`, and §C5.1 supplies the algebraic/analytic differential-form comparison. The new ingredients here are the hermitian metrics and period normalizations.

### From Tau Ceti’s ordinary divisor dictionary

In `TauCeti.AlgebraicGeometry.WeilDivisor.FractionalIdealDivisor.Basic`, use `TauCeti.AlgebraicGeometry.WeilDivisor.fractionalIdealDivisorAddEquiv` for the equivalence between invertible fractional ideals and finite Weil divisors on the height-one spectrum of a Dedekind domain. The finite part of §1.7 uses this equivalence; the real archimedean coefficients, hermitian metrics and degree are the additional objects here.

### From schemes, stacks and ordinary heights

**SchemeAndStackFoundations** §3.4 supplies the ordinary divisor/Picard comparison `classGroup_picard_locallyFactorial` on regular schemes, and §3.5 supplies `lineBundleNorm` with its tensor, composition, base-change and relative-determinant identities. Section 3.8 supplies `invariant_differentials`. Section 4.17 supplies `SNCData`, `IsStrictNormalCrossings` and `IsNormalCrossings`, applied to the reduced inverse-image boundary. Sections 1.19–1.22 supplies Deligne–Mumford stacks, étale charts, inertia and quasi-coherent descent. **AlgebraicModuliForArithmeticGeometry** §3.1 supplies `spaceFpqcQuasicoherentDescent`, retaining line bundles and all module maps.

SchemeAndStackFoundations §5.1 supplies `cyclesOfDimension` and `ChowGroup` only for schemes locally of finite type over a fixed field. It is used on the special fibres in §1.10. Arithmetic one-cycles over `O_K`, their proper-support condition and the quotient by special-fibre rational equivalence are constructed in §1.10 on Mathlib’s `AlgebraicGeometry.AlgebraicCycle`; no field-based grading is applied to `Spec O_K`.

**HeightsAndUnits** §1.1 supplies `instNorthcottProjectivizationMulHeight` and `instNorthcottProjectivizationLogHeight` over a field whose scalar height satisfies `Northcott`. Section 1.13 uses the bounded-degree absolute-height variant, rather than specifying another fixed-field instance.

**DiophantineApproximationAndTranscendence** §0.2 supplies the following separate field-comparison statements.

- `mulHeight_algebraMap`: for a finite extension `L/K` of number fields and any finite tuple `x` over `K`, `H_rel,L(x) = H_rel,K(x)^[L:K]`, with the coordinates mapped to `L`. This includes the zero tuple, whose multiplicative height is 1. Applying this to `(x,1)` gives the scalar comparison.
- `absoluteProjectiveTupleHeight` and `absoluteProjectiveTupleHeight_eq`: for a tuple over a number field `K`, `H_abs(x) = H_rel,K(x)^(1/[K:ℚ])`; this absolute height is invariant under extension of the containing number field. The degree identity `[L:ℚ] = [L:K][K:ℚ]` cancels the relative-height power.

These contracts use relative-height scaling and absolute-height invariance as distinct assertions ([Wu, Arithmetic Heights](https://www.math.columbia.edu/~xiaorunw/diop/08.pdf), §2, Lemma 2.5 and Definition 2.7, p. 4). Section 0.3 supplies `finite_setOf_absMulHeight₁_le` over arbitrary characteristic-zero ambient fields. These give the absolute degree normalization and scalar bounded-degree finiteness used in §§1.13–1.14 and §5.9. The general projective line-bundle height class, its ample lower bound and its Northcott comparison are targets of §1.13.

**Checks.**

- The tuple `(1,2)` has relative multiplicative height 2 over `ℚ` and 4 over `ℚ(i)`, while its absolute multiplicative height is 2 in both fields.
- The tuple `(√2,1)` has relative multiplicative height 2 over `ℚ(√2)` and 4 over `ℚ(√2,i)`; both degree roots give absolute height `√2`.
- The zero tuple has relative and absolute multiplicative height 1 over every number field; it does not define a projective point or an `ArakelovDivisor.ofTuple`.

### From abelian schemes and Néron models

**AbelianSchemesAndArithmeticModuli** §§A1.1 and A1.3 supplies `relativeProductsAndDimension` and `relativeInvariantForms`; §§A2.2 and A3.5 supplies `normalizedPoincare`, duals and `dualIsogenyCartierKernel`; §§A3.1, A3.6–A3.7 and A3.11 supplies `IsAbelianIsogeny`, `ThetaGroup`, `polarizedWeilPairing` and `principalQuotient`. The multiplication pullback of a symmetric line is §A1.5. Sections A4.3, A5.1, A5.3–A5.4 and A5.7–A5.8 supplies `AbelianH1dR`, `AbelianLattice`, `appellHumbert`, `polarizationType`, `realizationConventions` and `SiegelFamily`. Sections A6.13, A6.18, A6.22 and A6.38 supplies `polarizedIsogenyDegree`, `polarizedAutomorphisms`, `CoefficientHom` and `AbelianHodgeLine`.

The supplied theta group and its action are the algebraic inputs to §5.7. That section constructs Pazuki’s good translated basis: good lifts for `A[r²]`, representatives modulo `A[r]`, basis and base-change compatibility, and changes by a common scalar times permutation and root-of-unity phases. These additional basis identities are targets here. A general complex unitary change of basis is insufficient for the finite-place identity.

**NeronModelsAndSemistableAbelianVarieties** §§1.1, 1.3 and 1.5 supplies `NeronMappingProperty`, `NeronModel.extend` and extension of homomorphisms; §§1.7–1.9 supplies local existence, the abelian-scheme case and Dedekind gluing; §1.11 supplies `DifferentialLattice` and `NeronDifferentials.det`. Sections 3.1–3.3, 3.10 and 3.12 supplies `SemistableReduction`, `SemistabilityIsogeny`, `SemistableIdentityBasechange`, `FiniteSeparableSemistableExtension` and `FiniteTorsionSemistability`. The strict non-unit determinant at a non-semistable prime is an additional theorem of §3.6, stated on these differential lattices.

### The imported Hodge-line interface

Use the following interface from abelian schemes and Néron models, with their ordinary determinant operations. The metric added in §2.1 is the construction owned here.

Let `S` be a scheme and `G → S` a smooth separated commutative group scheme of finite presentation, of constant relative dimension `g`, with unit section `e`. Its Hodge bundle is `ω_G = e^*Ω¹_{G/S} = Lie(G/S)^∨`, locally free of `rank g`, and its Hodge line is `ω̄_G := det ω_G = e^*Ω^g_{G/S} = Λ^g Lie(G/S)^∨`. (a) Formation of `ω_G` and of its determinant commutes with every base change `S′ → S`. (b) For an open subgroup scheme `G⁰ ⊂ G` containing `e(S)` (for instance the fibrewise identity component of a Néron model) restriction is an isomorphism `ω̄_G = ω̄_{G⁰}`. (c) A homomorphism `φ : G → H` of such group schemes of the same relative dimension induces `φ^* : ω̄_H → ω̄_G`; `ω̄_{G×H} ≅ ω̄_G ⊗ ω̄_H`. (d) If `G → S` is an abelian scheme (proper with geometrically connected fibres), evaluation at `e` gives `p_*Ω^g_{G/S} ≅ ω̄_G` and agrees with the Hodge line of AbelianSchemesAndArithmeticModuli §A6.38; without properness `p_*Ω^g` need not be `ω̄_G`.

`G` smooth, separated, commutative, finitely presented over `S`, all fibres of dimension `g`. In (d) the comparison is for abelian schemes; for a semi-abelian scheme only the definition `e^*Ω^g` is used.

The following supplier comparisons are used with their stated generalities. On an arbitrary smooth group scheme use `invariant_differentials` and `determinantObj`; on an abelian scheme use `relativeInvariantForms` and `AbelianHodgeLine`, and on a Néron model use `NeronDifferentials.pullback` and `NeronDifferentials.det`. The displayed product, base-change and open-subgroup identities are their natural identifications, rather than new carrier definitions.

- The invariant-differential bundle from `invariant_differentials` is `ω_G = e^*Ω¹_{G/S}`, locally free of `rank g`.
- Its determinant, using `determinantObj` (and `NeronDifferentials.det` for a Néron model), is `ω̄_G = det ω_G = e^*Ω^g_{G/S}`.
- Base-change comparison, specialized by `AbelianHodgeLine.baseChange` on abelian schemes: `ω̄_{G_{S′}} ≅ (S′ → S)^*ω̄_G`, compatible with composition of base changes.
- `invariant_differentials`: `ω̄_{G⁰} = ω̄_G` for an open subgroup containing the unit section.
- Pullback of invariant differentials and its determinant (`NeronDifferentials.pullback` on Néron models): `φ^* : ω̄_H → ω̄_G` for a homomorphism of equal relative dimension; `(ψφ)^* = φ^*ψ^*`.
- The determinant product comparison (`AbelianHodgeLine.product` on abelian schemes): `ω̄_{G×H} ≅ ω̄_G ⊗ ω̄_H`.
- The proper pushforward identity from `relativeInvariantForms`: for an abelian scheme `p_*Ω^g ≅ ω̄_G`, and `ω̄_G` is the Hodge determinant `λ_H` of AbelianSchemesAndArithmeticModuli §A6.38.

`ω_G = e^*Ω¹_{G/S}` is locally free of `rank g` because `G` is smooth of relative dimension `g`; `Ω¹_{G/S} ≅ p^*ω_G` by translation invariance, so `Ω^g_{G/S} ≅ p^*ω̄_G` and `e^*Ω^g = ω̄_G`.

Base change: `Ω¹` commutes with base change and pullback along `e` commutes with base change.

(b) is local at `e(S)`; (c) pulls back differentials along `φ` and uses `Ω¹_{G×H} = pr₁^*Ω¹_G ⊕ pr₂^*Ω¹_H`.

(d) For an abelian scheme `p_*O_G = O_S` universally, so `p_*Ω^g = p_*p^*ω̄_G = ω̄_G` (AbelianSchemesAndArithmeticModuli §A1.3 (`relativeInvariantForms`)).

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §2, pp. 350–351, Bemerkungen a), b); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2 (Généralisation), p. 27; [Yuan](https://arxiv.org/abs/2108.05625v4), §3.1.3, p. 43 (arXiv v4); [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §1.1, p. 2 (arXiv v3).

*Needs:* **AbelianSchemesAndArithmeticModuli** §A6.38 (`AbelianHodgeLine`); **AbelianSchemesAndArithmeticModuli** §A1.3 (`relativeInvariantForms`); **AbelianSchemesAndArithmeticModuli** §A1.1 (`relativeProductsAndDimension`); **NeronModelsAndSemistableAbelianVarieties** §1.11 (`DifferentialLattice`); Mathlib `Module.Projective`.

**Checks.**

- `GroupScheme.hodgeLine_Gm`: For `𝔾_m` over `ℤ, ω̄ = ℤ·dt/t`.
- `GroupScheme.hodgeLine_pushforward_nonexample`: For `𝔾_m, p_*Ω¹` is free of infinite rank, so it is not the Hodge line: (d) needs properness.
- `GroupScheme.hodgeLine_trivial_group`: For `g = 0 (G = S)` the Hodge line is `O_S`.
- `GroupScheme.hodgeLine_multiplication`: For an abelian scheme of relative dimension `g` and `n ∈ ℤ, [n]^*` acts on `ω̄_G` by `n^g`.
- `GroupScheme.hodgeLine_disconnected_proper_nonexample`: The constant group `ℤ/2` over `S` is proper and smooth of dimension zero, but `p_*Ω⁰=O_S⊕O_S` while the Hodge line at the unit is `O_S`. Properness without geometrically connected fibres does not imply the abelian-scheme pushforward identity.
- For `G = 𝔾_m` over `Spec ℤ, ω̄_G = ℤ·dt/t`; `p_*Ω¹ = ℤ[t, t^{-1}]·dt/t` is not of rank one, which is why (d) needs properness.

### From finite flat groups and local arithmetic duality

**FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.17 supplies `invariantDifferentialsAndAbsoluteDifferent`: over a complete mixed-characteristic DVR `R` with perfect residue field, `length_R ω_(Γ[p^n]) = n·v_R(p)·dim Γ`, and `Fitt₀(ω_G)` is the absolute different of a finite flat commutative group `G`. This retains arbitrary ramification and arbitrary prime-power exponent. Section R07.1.21 supplies `BarsottiTate.exists_of_tateModule_summand`: inside an ambient `p`-divisible group, the closures of a generic `p`-divisible subgroup become the truncations of a `p`-divisible group after taking a quotient by a fixed initial level. The ambient group exists for abelian schemes at good reduction; semistable reduction alone does not supply it. Section 4.5 keeps its explicit finite-part hypothesis at bad reduction. The Cartier-dual length sum is an additional theorem of §4.3, using the supplied different; the finite parts of kernels on semi-abelian identity components are not assumed Cartier dual.

**ClassFieldTheory**, Layer 5, supplies `tateDualityPairing_perfect_mixed`, `finite_H` and `eulerCharacteristic_mixed` for finite smooth discrete modules over finite extensions of `ℚ_p`.

**ArithmeticGaloisDuality** §D7.6, “Local abelian-variety duality and gerbe evaluation” and “Self-dual isogenies and their local index,” supplies the perfect local pairings for abelian varieties over every finite extension of `ℚ_p`, with profinite rational points and discrete `torsion H¹`, normalized by the Poincaré/Ext construction and the local invariant. It supplies the mutually dual long exact sequences of every characteristic-zero isogeny and its dual, including adjunction of the Kummer boundary maps. This sequence duality allows degree divisible by `p`; the prime-to-`p` hypothesis belongs to the supplier's subsequent numerical self-dual index formula. Section 4.3 takes its Kummer corollary from these sequences and constructs the Néron `Lie`-filtration asymptotics.

### From elliptic curves and Siegel moduli

**EllipticCurves**, Layer 4.5a, supplies `minimalDiscriminantIdeal`, its local minimal-equation convention and `Δ_(uω) = u^(−12)Δ_ω`. **NeronModelsAndSemistableAbelianVarieties** §6.9 supplies the comparison with the minimal Néron differential lattice. Section 2.9 uses this lattice, rather than the discriminant from an arbitrary Weierstrass equation, together with Mathlib’s normalized analytic `Δ`.

**PELModuli** §§M3.9 and M5.2 supplies Siegel uniformization and fine level spaces. Sections M6.3, M6.5–M6.6 and M6.8–M6.10 supplies `siegelStack` over `ℤ`, `coarseModuli`, `fieldOfModuli`, `boundedFieldOfDefinition`, `PELModuli.hodgeLine` and `PELModuli.hodgeLine_classify`. In particular a polarized object of dimension `g` has a model over an extension of its field of moduli of degree at most `2·3^(4g²)`.

The level-one principal Siegel compactifications are constructed in §5.0 over all of `Spec ℤ`: a toroidal stack with universal semi-abelian `G`, a normal projective coarse minimal scheme `A_g^*`, and `m ≥ 1` with an ample `L` on `A_g^*` and `π^*L ≅ ω_G^m`, compatible with cone refinements. The exponent kills stabilizers. The fine level-`n` minimal spaces over `ℤ[1/n]` map finitely to `A_g^*⊗ℤ[1/n]`. Valuative stack lifts allow finite extensions, which preserve normalized heights. Compactifications over `ℤ[1/n]` alone do not determine the omitted finite-place terms of the level-one height.

## How to read the build

Layer 1 gives the arithmetic degree and point-height interface, with the projective calculation of §1.14 used in the height-class theorem of §1.13; Layer 2 supplies the semi-abelian family extension theorem and equips the supplied Hodge lines with metrics and proves semistable duality. Layer 3 defines relative and stable heights and their base-change correction. Layer 4 proves isogeny identities, including the squared dual-line comparison for arbitrary reduction, and then component heights. Layer 5 constructs the integral principal Siegel compactifications and compares stable height with an ample moduli height and with theta and `j`-heights. Layer 6 applies Zarhin’s trick and the field-degree bounds to finiteness and uniform lower bounds. Each numbered topic states its hypotheses, the required interface, proof route, sources and discriminating checks. `Suggested.lean` contains representative signatures over carriers available in the libraries; this README is the full specification.

## Layer 1: Hermitian bundles, arithmetic divisors and heights

Start from finite projective `O_K`-modules and the product formula. First metrize the bundle operations and define degree; then identify the divisor and Picard descriptions. The Green-function enhancement extends this to arithmetic schemes and stacks, and the normalized pullback degree becomes the point-height interface.

### 1.1 Hermitian vector bundles over the ring of integers

Let `K` be a number field with ring of integers `O_K` and let `Σ_K` be the set of field embeddings `σ : K → ℂ`, on which complex conjugation acts by `σ ↦ σ̄`. A hermitian vector bundle `Ē = (E, (h_σ)_{σ∈Σ_K})` over `Spec O_K` is a finitely generated projective `O_K`-module `E` together with, for every `σ ∈ Σ_K`, a positive definite hermitian inner product `h_σ` on the complex vector space `E_σ = E ⊗_{O_K,σ} ℂ`, such that `h_{σ̄}(x ⊗ 1, y ⊗ 1)` is the complex conjugate of `h_σ(x ⊗ 1, y ⊗ 1)` for all `x, y ∈ E`. Write `‖x‖_σ = h_σ(x, x)^{1/2}`. The rank of `Ē` is the rank of `E`. A hermitian line bundle is a hermitian vector bundle of rank one. An isometry `Ē ≅ F̄` is an `O_K`-linear isomorphism `E ≅ F` whose complexifications are unitary at every `σ`. `Pic^(O_K)` is the set of isometry classes of hermitian line bundles; it is an abelian group under the tensor product of the next section.

`K` a number field; `E` finitely generated and projective (equivalently torsion-free) over the Dedekind domain `O_K`. The compatibility with complex conjugation is part of the data: at a real embedding it says `h_σ` is the complexification of a real inner product on `E ⊗_σ ℝ`. Rank one is the case Faltings, Deligne and Szpiro call a metrized (compactified) invertible sheaf.

Provide the following maps and identities.

- `HermitianBundle.module`: The underlying finitely generated projective `O_K`-module `E`.
- `HermitianBundle.inner`: For `σ ∈ Σ_K`, the positive definite hermitian form `h_σ` on `E ⊗_{O_K,σ} ℂ`.
- `HermitianBundle.inner_conj`: `h_{σ̄}(x ⊗ 1, y ⊗ 1) = conj h_σ(x ⊗ 1, y ⊗ 1)` for `x, y ∈ E`.
- `HermitianBundle.rank`: `rank Ē = finrank_K (E ⊗ K)`.
- `HermitianBundle.trivial`: `Ō_K = (O_K, |·|)` with `h_σ(1, 1) = 1` for every `σ`.
- `HermitianBundle.ofFractionalIdeal`: For a nonzero fractional ideal `𝔞 ⊂ K` and real numbers `(λ_v)` indexed by infinite places, the line bundle `𝔞` with `‖x‖_σ = e^{−λ_v}|σ(x)|` for `σ` inducing `v`.
- `HermitianBundle.Isometry.ext`: Two isometries with equal underlying `O_K`-linear maps are equal.
- `HermitianBundle.rescale`: For `c ∈ ℝ, Ē(c)` has the same module and metrics `e^{−c}‖·‖_σ` at every `σ`.
- `HermitianBundle.normAt`: For a rank-one bundle and an infinite place `v` of `K` (Mathlib's InfinitePlace), the norm `‖·‖_v` on `E ⊗ K_v` induced by any `σ` inducing `v`; it is independent of `σ` by the conjugation condition.
- `PicHat`: `Pic^(O_K)`: isometry classes of hermitian line bundles, an abelian group under `⊗` with inverse the dual and identity `Ō_K`.

Define the structure from the module `E`, the family of inner products indexed by `Σ_K`, and the conjugation condition; for a rank-one bundle the data is equivalently one norm `‖·‖_v` on `E ⊗ K_v` for each infinite place `v` (Deligne §1.1, p. 26; Szpiro §1.2, p. 13), which is how Mathlib's InfinitePlace records places.

Isometry classes form a set because `E` embeds in `K^n` and the inner products are finite-dimensional data; the group structure on `Pic^(O_K)` is the tensor product with inverse the dual (§1.2).

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.1, pp. 25–26; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, p. 13; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), Appendice A.1–A.2, pp. 146–147.

*Needs:* Mathlib `NumberField.RingOfIntegers`; Mathlib `Module.Projective`; Mathlib `Module.finrank`; Mathlib `InnerProductSpace`; Mathlib `NumberField.InfinitePlace`; Mathlib `NumberField.InfinitePlace.mult`.

**Checks.**

- `HermitianBundle.trivial_rank`: `rank Ō_K = 1` and the rank of the zero module with the empty family of forms is 0.
- `HermitianBundle.ofFractionalIdeal_one`: `ofFractionalIdeal (1)` with all `λ_v = 0` is isometric to `Ō_K`.
- `HermitianBundle.conj_nonexample`: For `K = ℚ(i)` with embeddings `σ, σ̄`, the data `O_K` with `h_σ(1,1) = 1` and `h_{σ̄}(1,1) = 4` violates the conjugation condition, so it is not a hermitian line bundle, although each `h` is positive definite.
- `HermitianBundle.rationals`: For `K = ℚ` every hermitian line bundle is isometric to `(ℤ, r·|·|)` for a unique real `r > 0`.
- The trivial bundle `Ō_K = (O_K, |·|_σ)` is a hermitian line bundle; a fractional ideal `𝔞` with the restricted absolute values `|σ(x)|` is a hermitian line bundle; a hermitian line bundle whose metrics fail the conjugation condition is not an object of this definition.

### 1.2 Sums, tensor products, duals, determinants, sub-bundles and base change

For hermitian vector bundles `Ē, F̄` over `Spec O_K`: (i) `Ē ⊕ F̄` carries the orthogonal sum metric; (ii) `Ē ⊗ F̄ = (E ⊗_{O_K} F, h^E_σ ⊗ h^F_σ)`; (iii) the dual `Ē^∨ = (Hom(E, O_K), dual metric)`; (iv) the exterior powers `Λ^k Ē` with the induced metric, and the determinant `det Ē = Λ^{rk E} Ē`, a hermitian line bundle; (v) for an `O_K`-submodule `F ⊂ E` that is saturated (`E/F torsion`-free), `F̄` carries the restricted metric and `E/F` the quotient metric (each `h_σ` on `(E/F)_σ` identified with the orthogonal complement of `F_σ`); (vi) for a finite extension `L/K`, the base change `Ē_{O_L} = (E ⊗_{O_K} O_L, (h_{τ|K})_τ)` with `τ ∈ Σ_L` extending `σ = τ|_K`. These are compatible with isometries and satisfy the usual identities: `det(Ē ⊕ F̄) ≅ det Ē ⊗ det F̄, det(Ē^∨) ≅ (det Ē)^∨`, and for `0 → F̄ → Ē → Q̄ → 0` with restricted and quotient metrics, `det Ē ≅ det F̄ ⊗ det Q̄` isometrically.

`F ⊂ E` saturated, so that `E/F` is projective. Base change uses that every `τ ∈ Σ_L` restricts to an element of `Σ_K` and every `σ` has exactly `[L:K]` extensions.

Provide the following maps and identities.

- `HermitianBundle.sum`: `Ē ⊕ F̄` with the orthogonal sum metric.
- `HermitianBundle.tensor`: `Ē ⊗ F̄` with the tensor product metric.
- `HermitianBundle.dual`: `Ē^∨` with the dual metric.
- `HermitianBundle.det`: `det Ē = Λ^{rank} Ē`, a hermitian line bundle.
- `HermitianBundle.restrict`: For `F ⊂ E` saturated, `F̄` with the restricted metric.
- `HermitianBundle.quotient`: For `F ⊂ E` saturated, `E/F` with the quotient metric.
- `HermitianBundle.baseChange`: `Ē ↦ Ē_{O_L}` along `O_K → O_L`; `baseChange_id` and `baseChange_comp` hold up to canonical isometry.
- `HermitianBundle.det_sum`: `det(Ē ⊕ F̄) ≅ det Ē ⊗ det F̄` isometrically.
- `HermitianBundle.det_exact`: For `0 → F̄ → Ē → Q̄ → 0` with restricted and quotient metrics, `det Ē ≅ det F̄ ⊗ det Q̄` isometrically.
- `HermitianBundle.dual_dual`: `Ē^∨∨ ≅ Ē` isometrically.

Form each module construction over `O_K` and the corresponding hermitian linear algebra fibrewise at each `σ`; the conjugation condition is preserved because every construction is natural.

For the determinant identity of an exact sequence choose at `σ` an orthonormal basis of `F_σ` completed by an orthonormal basis of its orthogonal complement, which maps isometrically onto `Q_σ`; the wedge of the combined basis has norm one, so the canonical isomorphism `det E ≅ det F ⊗ det Q` is an isometry (Deligne §2.1, p. 36, for the Hodge-line case).

Base change is functorial and compatible with `⊗, ∨` and `det` because these commute with the flat base change `O_K → O_L`.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §2.1, p. 36; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), Appendice A.2–A.3, p. 147; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, p. 13.

*Needs:* §1.1; Mathlib `InnerProductSpace`.

**Checks.**

- `HermitianBundle.tensor_trivial`: `Ō_K ⊗ Ē ≅ Ē` isometrically.
- `HermitianBundle.det_trivial_sum`: `det(Ō_K ⊕ Ō_K) ≅ Ō_K`, with `e₁ ∧ e₂` of norm one at every `σ`.
- `HermitianBundle.quotient_metric_nonexample`: For `E = ℤ²` with the standard metric and `F = ℤ·(1,1)`, the quotient `E/F ≅ ℤ` with the quotient metric has `‖[e₁]‖ = 1/√2`, not 1: the quotient metric is not the metric of a chosen complement lattice.
- `HermitianBundle.baseChange_rank`: `rank Ē_{O_L} = rank Ē` and `(det Ē)_{O_L} ≅ det(Ē_{O_L})`.
- The identities are stated as isometries, not just module isomorphisms; `Ō_K ⊗ Ē ≅ Ē`; the dual of `Ō_K` is `Ō_K`.

### 1.3 The Arakelov degree of a hermitian bundle

For a hermitian line bundle `L̄` over `Spec O_K` and any nonzero `s ∈ L, deg^(L̄) = log #(L / O_K·s) − Σ_{σ∈Σ_K} log ‖s‖_σ`; equivalently, with Mathlib's infinite places and multiplicities `mult(v) ∈ {1, 2}, deg^(L̄) = log #(L / O_K s) − Σ_v mult(v)·log ‖s‖_v`. For a hermitian vector bundle, `deg^(Ē) = deg^(det Ē)`, the normalised degree is `deg^_n(Ē) = deg^(Ē)/[K:ℚ]`, and for positive rank the slope is `μ^(Ē) = deg^(Ē)/rank Ē`. In Gillet–Soulé's normalisation an arithmetic divisor `(Z, g)` on `Spec O_K` has degree `log #(Z) + ½ Σ_σ g_σ`; the two agree through `L̄ ↦ (div s, −log ‖s‖²)`.

`L̄` a hermitian line bundle over `Spec O_K` (§1.1). `#(L/O_K s)` is the finite index of the submodule generated by `s`.

Provide the following maps and identities.

- `HermitianBundle.arakelovDegree`: `deg^(L̄) = log #(L/O_K s) − Σ_σ log ‖s‖_σ` for any `s ≠ 0`; for higher rank through `det`.
- `HermitianBundle.normalizedDegree`: `deg^_n(Ē) = deg^(Ē)/[K:ℚ]`.
- `HermitianBundle.slope`: `μ^(Ē) = deg^(Ē)/rank Ē` for `Ē` of positive rank.
- `HermitianBundle.arakelovDegree_eq_infinitePlace`: `deg^(L̄) = log #(L/O_K s) − Σ_v mult(v) log ‖s‖_v`, summing over InfinitePlace `K`.
- `HermitianBundle.arakelovDegree_eq_fractionalIdeal`: For any nonzero `t ∈ L ⊗ K`, with `𝔟` the fractional ideal such that `L = 𝔟·t, deg^(L̄) = −log N(𝔟) − Σ_σ log ‖t‖_σ (N = FractionalIdeal.absNorm)`; for `t ∈ L` this is the defining formula, since then `N(𝔟)^{−1} = #(L/O_K t)`.
- `HermitianBundle.arakelovDegree_trivial`: `deg^(Ō_K) = 0`.
- `HermitianBundle.arakelovDegree_rescale`: `deg^(L̄(c)) = deg^(L̄) + [K:ℚ]·c` for the rescaling `‖·‖ ↦ e^{−c}‖·‖`. For a bundle of `rank r` the change is `r[K:ℚ]c`, because the determinant norm scales by `e^(−rc)`; for rank zero it is zero.
- `HermitianBundle.arakelovDegree_ofFractionalIdeal`: `deg^(𝔞, e^{−λ_v}|·|_v) = −log N(𝔞) + Σ_v mult(v)·λ_v`.
- `HermitianBundle.arakelovDegree_congr`: Isometric hermitian line bundles have equal degree.

Define `deg^` with a chosen nonzero section; independence of the choice is §1.4, so `deg^` is a function on `Pic^(O_K)`.

For higher rank use the determinant of §1.2; normalised degree and slope are quotients by `[K:ℚ]` and the rank.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.1, pp. 25–26; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, pp. 353–354; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.1–1.2, Corollaire, p. 14; [Gillet–Soulé](https://www.numdam.org/item/PMIHES_1990__72__93_0/), §3.4.3, p. 131.

*Needs:* §1.1; §1.2; Mathlib `FractionalIdeal.absNorm`; Mathlib `NumberField.InfinitePlace.mult`.

**Checks.**

- `HermitianBundle.arakelovDegree_trivial`: `deg^(Ō_K) = 0`, using `s = 1`.
- `HermitianBundle.arakelovDegree_ideal`: For `K = ℚ(i)` and `𝔞 = (1 + i)` with the standard metric, `deg^ = −log 2`.
- `HermitianBundle.arakelovDegree_rat`: For `K = ℚ` and `(ℤ, r·|·|), deg^ = −log r`; Deligne's example `deg L = −½ log⟨e, e⟩`.
- `HermitianBundle.arakelovDegree_weight_nonexample`: Summing `log ‖s‖` once per infinite place instead of once per embedding gives, for `K = ℚ(i), Ō_K` and `s = 2`, the value `log 4 − log 2 ≠ 0`, so the multiplicity `mult(v) = 2` at a complex place is forced.
- `HermitianBundle.arakelovDegree_rescale_rank`: Rescaling the norm on `Ō_K⊕Ō_K` by `e^(−c)` adds `2[K:ℚ]c`, while the zero bundle stays of degree zero. This distinguishes bundle rescaling from line rescaling.
- `HermitianBundle.normalizedDegree_gaussian`: For the Gaussian ideal `(1+i)` with its standard metric, the degree is `−log 2` and its normalized degree is `−½log 2`. Extending it to a quadratic extension doubles degree and leaves normalized degree unchanged.
- `HermitianBundle.slope_sum`: For a rank-two orthogonal sum over `ℚ` with basis norms `e^(−a), e^(−b)`, degree is `a+b` and slope is `(a+b)/2`. Tensoring with a line of degree `c` changes slope by `c`, whereas duality changes its sign.
- `HermitianBundle.slope_zero_nonexample`: The zero bundle has degree zero but no slope in the positive-rank interface. A total division in Lean must not erase this restriction.
- `deg^(Ō_K) = 0`; `deg^` of a fractional ideal `𝔞` with the standard metric is `−log N(𝔞)`; multiplying every metric by `e^{−c}` adds `[K:ℚ]·c`.

### 1.4 Independence of the section: the product formula

For a hermitian line bundle `L̄` over `Spec O_K` and nonzero `s, t ∈ L, log #(L/O_K s) − Σ_σ log ‖s‖_σ = log #(L/O_K t) − Σ_σ log ‖t‖_σ`. Consequently `deg^ : Pic^(O_K) → ℝ` is a well-defined function; §1.5 proves it is a group homomorphism.

`s, t ≠ 0` in `L`, so `t = a s` for a unique `a ∈ K^×`.

Write `t = a·s` with `a ∈ K^×`. The finite term changes by `log #(L/O_K t) − log #(L/O_K s) = log |N_{K/ℚ}(a)| = −Σ_𝔭 log |`a`|_𝔭 (FractionalIdeal.absNorm_span_singleton)`.

The archimedean term changes by `−Σ_σ log |σ(a)| = −log |N_{K/ℚ}(a)| (InfinitePlace.prod_eq_abs_norm)`.

The two changes cancel; this is the product formula `NumberField.prod_abs_eq_one`. Transporting a section by an isometry preserves both terms, so the function descends to hermitian isometry classes.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.1, p. 25; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, p. 354; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, Proposition 1.1 and Corollaire, pp. 13–14.

*Needs:* §1.3; Mathlib `NumberField.prod_abs_eq_one`; Mathlib `NumberField.InfinitePlace.prod_eq_abs_norm`; Mathlib `FractionalIdeal.absNorm_span_singleton`.

**Checks.**

- Replacing `s` by `2s` in `Ō_ℚ` leaves `log 2 − log 2 = 0`.
- For `K = ℚ(√2)` and `a = 1 + √2` a unit, the finite term and the sum of archimedean terms are unchanged separately, although the individual embedding norms change.
- On the trivial line over `ℚ(i)`, replacing 1 by 2 increases the finite term by `log 4` and decreases the sum over the two embeddings by `2 log 2`. Counting its complex place only once would fail section independence.

### 1.5 Additivity of the Arakelov degree

For hermitian vector bundles over `Spec O_K: deg^(L̄ ⊗ M̄) = deg^(L̄) + deg^(M̄)` and `deg^(L̄^∨) = −deg^(L̄)` for line bundles; `deg^(Ē ⊕ F̄) = deg^(Ē) + deg^(F̄)`; for an exact sequence `0 → F̄ → Ē → Q̄ → 0` with restricted and quotient metrics, `deg^(Ē) = deg^(F̄) + deg^(Q̄)`. If `L ⊂ L′` are hermitian line bundles with the same generic fibre and the same metrics, `deg^(L̄′) = deg^(L̄) + log #(L′/L)`.

The sub-bundle `F` is saturated in `E`. In the last statement `L` and `L′` are `O_K`-lattices in one `K`-line with equal metrics at every `σ`.

For tensor products use the section `s ⊗ s′`: the index is multiplicative, `#(L ⊗ M / O_K(s ⊗ s′)) = #(L/O_K s)·#(M/O_K s′)`, and norms multiply. Together with section independence from §1.4, this constructs the bundled homomorphism `deg^ : Pic^(O_K) →+ ℝ`.

Dual: write `L = 𝔞·s` with `𝔞 ⊇ O_K` the fractional ideal determined by `s ∈ L`, so `log #(L/O_K s) = −log N(𝔞) (FractionalIdeal.absNorm)`. Then `L^∨ = 𝔞^{−1}·s^∨` with `s^∨(s) = 1` and `‖s^∨‖_σ = ‖s‖_σ^{−1}`; `s^∨` lies in `L^∨` only when `𝔞 = O_K`, so compute with the generic-section form of the degree (§1.3, `arakelovDegree_eq_fractionalIdeal`): `deg^(L̄^∨) = −log N(𝔞^{−1}) − Σ_σ log ‖s^∨‖_σ = log N(𝔞) + Σ_σ log ‖s‖_σ = −deg^(L̄)`.

Exact sequences and sums reduce to rank one through `det_exact` and `det_sum` of §1.2.

For `L ⊂ L′` choose `s ∈ L`; `#(L′/O_K s) = #(L′/L)·#(L/O_K s)`.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §2.1, p. 36; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, Corollaire, p. 14; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), Appendice A.3, p. 147.

*Needs:* §1.3; §1.4; §1.2; Mathlib `FractionalIdeal.absNorm`.

**Checks.**

- `deg^` of the Hodge line of a product is the sum (Layer 2/§2.5); in Deligne §2.1 the exact sequence of group schemes gives `deg ω(A) = deg ω(A′) + deg ω(A″)`.
- Over `ℚ`, trivial lines with generator norms `e^(−a)` and `e^(−b)` have tensor degree `a+b` and dual degrees `−a` and `−b`.
- For `ℤ ⊂ ½ℤ` with the same absolute-value metric, the degrees are 0 and `log 2`; the quotient has order 2, fixing the sign of the lattice-index term.

### 1.6 Arakelov degree under finite extension

For a finite extension `L/K` of number fields and a hermitian vector bundle `Ē` over `Spec O_K, deg^(Ē_{O_L}) = [L:K]·deg^(Ē)`; hence the normalised degree `deg^(Ē)/[K:ℚ]` does not change under base change. More generally, if `L̄ ⊂ L̄′` are hermitian line bundles over `O_L` with equal metrics and `L = M ⊗_{O_K} O_L` for a hermitian line bundle `M̄` over `O_K`, then `deg^(L̄′) = [L:K]·deg^(M̄) + log #(L′/L)`.

`L/K` finite; `Ē` over `Spec O_K`.

Reduce to rank one by the determinant. Take `s ∈ M` nonzero, viewed in `M ⊗ O_L`.

Finite part: the index of `O_L s` in `M ⊗ O_L` is the norm of the extended ideal, `N_L(𝔞O_L) = N_K(𝔞)^{[L:K]}` for `𝔞` the ideal with `M = 𝔞^{-1}s`, by Mathlib's `Ideal.absNorm_algebraMap (absNorm(I·O_L) = absNorm(I)^{[L:K]})` applied to `𝔞`, an integral ideal since `s ∈ M`.

Archimedean part: each `σ ∈ Σ_K` has exactly `[L:K]` extensions `τ ∈ Σ_L` with `‖s‖_τ = ‖s‖_σ`.

The second statement adds the index term of §1.5.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2 (Remarque), p. 27; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, p. 354; [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §1.1, pp. 2–3 (arXiv v3).

*Needs:* §1.3; §1.5; §1.2; Mathlib `Ideal.absNorm`; Mathlib `Algebra.norm`; Mathlib `Algebra.norm_norm`; Mathlib `Ideal.absNorm_algebraMap`.

**Checks.**

- For `K = ℚ, L = ℚ(i), M̄ = (ℤ, 2|·|): deg^(M̄) = −log 2` and `deg^(M̄_{O_L}) = −2 log 2`.

### 1.7 Arakelov divisors on `Spec O_K` and the compactified Picard group

The group `Div^(O_K)` of Arakelov divisors is the set of formal sums `D = Σ_𝔭 n_𝔭[𝔭] + Σ_v λ_v[v]` with `n_𝔭 ∈ ℤ` almost all zero (`𝔭` nonzero primes) and `λ_v ∈ ℝ` (`v` infinite places); its degree is `deg^(D) = Σ_𝔭 n_𝔭 log N𝔭 + Σ_v λ_v`. The principal divisor of `f ∈ K^×` is `(f) = Σ_𝔭 ord_𝔭(f)[𝔭] − Σ_v mult(v)·log|f|_v [v]`. The map `D ↦ O(D) = (𝔞_D^{-1}, ‖x‖_v = e^{−λ_v/mult(v)}|x|_v), 𝔞_D = ∏𝔭^{n_𝔭}`, induces an isomorphism `Div^(O_K)/{principal} ≅ Pic^(O_K)` carrying `deg^` to the Arakelov degree, and there is an exact sequence `0 → ℝ^{r₁ + r₂}/log|O_K^×| → Pic^(O_K) → Cl(K) → 0`, where `log|O_K^×|` is the image of the units under `u ↦ (mult(v) log|u|_v)_v`. In Gillet–Soulé's language `Div^(O_K)/principal` is `ĈH¹(Spec O_K)` with Green functions `g_v = 2λ_v/mult(v)`.

`K` a number field; `r₁, r₂` the numbers of real and complex places.

Provide the following maps and identities.

- `ArakelovDivisor`: A pair `(𝔞, λ)` of a nonzero fractional ideal (the finite part `∏𝔭^{n_𝔭}`) and a real function `λ` on InfinitePlace `K`.
- `ArakelovDivisor.degree`: `deg^(𝔞, λ) = log N(𝔞) + Σ_v λ_v`.
- `ArakelovDivisor.principal`: `(f) = (f·O_K, v ↦ −mult(v) log |f|_v)` for `f ∈ K^×`.
- `ArakelovDivisor.degree_principal`: `deg^((f)) = 0`.
- `ArakelovDivisor.degree_add`: `deg^(D + D′) = deg^(D) + deg^(D′)` for the componentwise group law.
- `ArakelovDivisor.toPicHat`: `Div^(O_K)/principal ≅ Pic^(O_K)`, compatible with degrees.
- `ArakelovDivisor.picHat_exact`: `0 → ℝ^{r₁+r₂}/log|O_K^×| → Pic^(O_K) → Cl(K) → 0`.
- `ArakelovDivisor.toChowHat`: Identification with `ĈH¹(Spec O_K): (𝔞, λ) ↦ (div 𝔞, g_v = 2λ_v/mult(v))`, with degree `log #(Z) + ½ Σ_σ g_σ`.
- `ArakelovDivisor.finitePart`: The finite part `𝔞`, an invertible fractional ideal.
- `ArakelovDivisor.infinitePart`: The archimedean coefficient `λ_v` at an infinite place `v`.
- `ArakelovDivisor.principalSubgroup`: The subgroup generated by the principal divisors `(f), f ∈ K^×`.
- `ArakelovDivisor.PicHat`: The quotient `Div^(O_K)/principal`, the compactified Picard group.
- `ArakelovDivisor.degree_zero`: `deg^(0) = 0`.
- `ArakelovDivisor.degree_eq_of_sub_mem`: `deg^` is constant on classes modulo principal divisors.

Define `D ↦ O(D)`. For the principal divisor `(f)`, the module is `f^(−1)O_K` and its metric is `|f|_v|x|_v`. The section `f^(−1)`, not `f`, has norm one and trivializes it isometrically (Szpiro, Proposition 1.1).

For a hermitian line `L̄` choose `s ≠ 0` and write `L = 𝔟_s s` with `𝔟_s ⊇ O_K`. Put `𝔞_s=𝔟_s^(−1)`; its valuations are the zero divisor of `s`. The divisor `D = Σ ord_𝔭(𝔞_s)[𝔭] − Σ_v mult(v)log‖s‖_v[v]` recovers `L̄`. Changing `s` changes `D` by a principal divisor.

Degree compatibility is the definition of §1.3; principal divisors have degree zero (§1.4).

The exact sequence: the kernel of `Pic^(O_K) → Cl(K)` is represented by divisors supported at infinity, modulo the principal divisors of units (Gillet–Soulé §3.4.3); the image of the units is Mathlib's `NumberField.Units.logEmbedding`, which records the coordinates at the places `w ≠ w₀`, the coordinate at `w₀` being fixed by the product formula, and its lattice covolume in the omitted-coordinate convention of `logEmbedding` is the regulator. A Euclidean hyperplane measure would introduce an extra normalization factor.

The source identifications are [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.1–1.2, Proposition 1.1 and Corollaire, pp. 13–14; [Gillet–Soulé](https://www.numdam.org/item/PMIHES_1990__72__93_0/), §3.4.3, p. 131.

*Needs:* §1.3; §1.4; Mathlib `ClassGroup`; Mathlib `NumberField.Units.regulator`; Mathlib `FractionalIdeal.absNorm`; Mathlib `NumberField.Units.logEmbedding`.

**Checks.**

- `ArakelovDivisor.degree_principal_two`: For `K = ℚ` and `f = 2: (2) = [2] − log 2·[∞]` has degree `log 2 − log 2 = 0`.
- `ArakelovDivisor.degree_zero`: The zero divisor `(O_K, 0)` has degree 0.
- `ArakelovDivisor.mult_nonexample`: For `K = ℚ(i)` and `f = 2`, the divisor with archimedean coefficient `−log|2|` (multiplicity forgotten) has degree `log 4 − log 2 ≠ 0`, so it is not principal-compatible.
- `ArakelovDivisor.picHat_rat`: For `K = ℚ, deg^ : Div^(ℤ)/principal → ℝ` is a bijection, matching Gillet–Soulé's `deg : ĈH¹(Spec ℤ) ≅ ℝ`.
- `ArakelovDivisor.principal_trivialization`: For `f=2` over `ℚ, O((2))` is `½ℤ` with norm `2|·|`. Its unit-norm generator is `½`; the section 2 has norm 4. This detects the sign of the trivializing section.
- `deg^((f)) = 0` for every `f ∈ K^×`; for `K = ℚ, Pic^(ℤ) ≅ ℝ` through `deg^`.

### 1.8 Arithmetic divisors with Green functions and `ĈH¹`

Let `X` be a regular scheme, flat, separated and of finite type over `B = Spec O_K` or over `B_S = Spec O_K ∖ S` for a finite set `S` of nonzero primes, with smooth generic fibre; `X` need not be proper. For `σ ∈ Σ_K` write `X_σ(ℂ)` for the complex manifold of `X ⊗_σ ℂ`, and `F_∞` for complex conjugation acting on `⊔_σ X_σ(ℂ)`. An arithmetic divisor is a pair `D̂ = (D, g)` with `D` a Cartier divisor on `X` (`ℚ`-coefficients allowed) and `g = (g_σ)` a Green function for `D: g_σ` is a smooth real function on `X_σ(ℂ) ∖ D_σ(ℂ), F_∞`-invariant across `σ`, such that for every local equation `f` of `D` the function `g_σ + log|f|²` extends smoothly. `Div^(X)` is the group of arithmetic divisors; the principal arithmetic divisor of an invertible rational function `f ∈ K(X)^×` is `d̂iv(f) = (div f, (−log|f|²_σ)_σ)`; `ĈH¹(X) = Div^(X)/{principal}`. The classes supported over `S, ĈH¹_{|S|}(X)`, are those `(D, 0)` with `D` supported in fibres over primes of `S`; for `X` over `O_K` and `X_S = X ×_B B_S` restriction induces `ĈH¹(X)/ĈH¹_{|S|}(X) ≅ ĈH¹(X_S)`.

`X` regular, flat and separated of finite type over `B` or `B_S`, with smooth generic fibre; Cartier divisors and Weil divisors agree on the regular `X` (SchemeAndStackFoundations §§3.4–3.5: `classGroup_picard_locallyFactorial` in §3.4). Green functions are smooth Green currents of logarithmic type in Gillet–Soulé's sense for divisors; no `log`-`log` growth is allowed in this result. `ℚ`-coefficients: `ĈH¹(X)_ℚ = ĈH¹(X) ⊗ ℚ` is the group used by Zhang's localized pairing.

Provide the following maps and identities.

- `ArithmeticDivisor`: Pairs `(D, g)` of a Cartier divisor and an `F_∞`-invariant Green function of logarithmic type.
- `ArithmeticDivisor.principal`: `d̂iv(f) = (div f, −log|f|²)` for `f ∈ K(X)^×`, invertible on every irreducible component.
- `ArithmeticChow1`: `ĈH¹(X) = Div^(X)/{d̂iv(f)}`, with `ℚ`-coefficient version.
- `ArithmeticDivisor.ofGreen`: For a smooth `F_∞`-invariant function `φ` on `X(ℂ)`, the class `a(φ) = (0, φ)`.
- `ArithmeticChow1.forget`: `ζ : ĈH¹(X) → CH¹(X), (D, g) ↦ D`, with kernel the image of `a`.
- `ArithmeticChow1.restrict`: Restriction to an open `X_S = X ×_B B_S`; it vanishes on `ĈH¹_{|S|}(X)`.
- `ArithmeticChow1.localization`: `ĈH¹(X)/ĈH¹_{|S|}(X) ≅ ĈH¹(X_S)`.
- `ArithmeticChow1.vertical_fibre`: Over `ℤ: (V_p, 0) = a(2 log p)` in `ĈH¹(X)`.

Define `Div^(X)` as pairs; principal divisors are arithmetic divisors because `−log|f|² + log|f|² = 0` extends trivially. With `dd^c = (i/2π)∂∂̄`, Poincaré–Lelong gives `dd^c log|f|² = δ_{div f}`, hence `dd^c(−log|f|²) + δ_{div f} = 0`.

`ĈH¹(X)` is the quotient; on `Spec O_K` it is the group of §1.7 `(g_v = 2λ_v/mult(v))`.

Localization: an element of `ĈH¹(X)` restricts to `X_S`; its kernel is generated by vertical divisors over `S` together with their principal relations, which is `ĈH¹_{|S|}(X)` (Zhang, Remark 8.5). For `B = Spec ℤ` and a prime `p` the vertical fibre `V_p` satisfies `(V_p, 0) = (0, 2 log p)` in `ĈH¹(X)`, since `d̂iv(p) = (V_p, −2 log p)`.

The source identifications are [Gillet–Soulé](https://www.numdam.org/item/PMIHES_1990__72__93_0/), §3.3.2–3.3.4, pp. 126–127; [Wei Zhang](https://arxiv.org/abs/1909.02697v3), §8.4 and Remark 8.5, p. 42 (arXiv v3); [Andreatta–Goren–Howard–Madapusi Pera](https://arxiv.org/abs/1508.00178v3), §4.6, display (4.6.1), arXiv v3.

*Needs:* §1.7; **SchemeAndStackFoundations** §§3.4–3.5 (Picard groups and norms); **SchemeAndStackFoundations** §5.1 (dimension-graded Chow groups); **ComplexComparisonPartII** §§C−1.1, C0.4 and C5.1; **ComplexComparisonPartII** §C5.4 (`CurrentCalculus`, `AnalyticCycleIntegration`, `lelongPoincareSection`), specialized to a meromorphic function in the trivial constant-metric line. Its `(i/π)∂∂̄ log|f|` is this roadmap's `(i/2π)∂∂̄ log|f|²`.

**Checks.**

- `ArithmeticChow1.spec_ok`: For `X = Spec O_K, ĈH¹(X)` is `Div^(O_K)/principal` with `g_v = 2λ_v/mult(v)`.
- `ArithmeticChow1.vertical_fibre_Z`: For `X = Spec ℤ` and `p` prime, `([p], 0)` and `(0, 2 log p)` define the same class, both of degree `log p`.
- `ArithmeticDivisor.green_nonexample`: For `X = ℙ¹_ℤ` and `D = [0]`, the pair `(D, 0)` is not an arithmetic divisor: `0 + log|z|²` does not extend smoothly across `z = 0`.
- `ArithmeticDivisor.principal_green_sign`: On `ℂ` with coordinate `z, dd^c(−log|z|²) = −δ₀`, so its sum with the divisor current is zero. The positive sign fails the Green-current identity.
- `ArithmeticDivisor.rational_unit_nonexample`: On `Spec ℤ ⊔ Spec ℤ`, the rational function `(1,0)` is nonzero but not invertible in `ℚ × ℚ`; it has no principal Cartier divisor. The function `(2,1)` is invertible and defines one.
- `ArithmeticChow1.empty_divisor`: `a(0) = 0` and `a(φ)` for constant `φ = c` is the pullback of `(0, c)` from the base.
- The relation `(V_p, 0) ≡ (0, 2 log p)` over `ℤ`; on `Spec O_K` the definition recovers Szpiro's compactified divisors.

### 1.9 Metrized line bundles and arithmetic divisors

For `X` as in §1.8, let `Pic^(X)` be the group of isometry classes of line bundles on `X` with an `F_∞`-invariant smooth hermitian metric on `L_ℂ` over `⊔_σ X_σ(ℂ)`. The map `ĉ₁ : Pic^(X) → ĈH¹(X), L̄ ↦ (div s, −log ‖s‖²)` for any rational section `s` nonvanishing on every irreducible component, is a well-defined group isomorphism. Every morphism `f : X′ → X` of such schemes over the arithmetic base pulls back metrized line bundles. Transport this map through `ĉ₁` to define pullback on `ĈH¹`; then `ĉ₁(f^*L̄) = f^*ĉ₁(L̄)` for every such `f`.

For a specified arithmetic divisor representative `(D,g)`, the formula `f^*(D,g) = (f^*D,g∘f)` requires `f(ξ) ∉ |D|` for the generic point `ξ` of every irreducible component of `X′`. Under this hypothesis the formula represents the class pullback just defined. The condition concerns the support of `D` itself.

`X` regular, so Cartier divisors and line bundles with rational sections correspond. Metrics are smooth and `F_∞`-invariant.

Changing `s` to fs changes `(div s, −log‖s‖²)` by `d̂iv(f)`, so the class is independent of `s`.

`−log ‖s‖²` is a Green function for `div s`: locally `s = u·f·e` with `e` a frame, so `−log‖s‖² + log|f|² = −log(|u|²‖e‖²)` is smooth.

Inverse: from `(D, g)` form `O(D)` with the metric `‖1_D‖² = e^{−g}`; isometry classes correspond to classes modulo principal divisors.

Group laws: `⊗` goes to `+` since `‖s ⊗ t‖ = ‖s‖‖t‖`. Pullback on metrized lines preserves tensor products, identities and composition, so its transport gives these laws on `ĈH¹`. For an admissible representative, regularity makes `X′` reduced and the componentwise condition ensures that pulled-back local equations are rational units defining Cartier divisors. The smooth extension `g + log|f_D|²` for a local equation `f_D` pulls back to the required Green-function extension. Thus the representative formula agrees with pullback of `O(D)` and its metric.

The source identifications are [Gillet–Soulé](https://www.numdam.org/item/PMIHES_1990__72__93_0/), §3.4.2, p. 131; [Andreatta–Goren–Howard–Madapusi Pera](https://arxiv.org/abs/1508.00178v3), §4.6, display (4.6.1); [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, Proposition 1.1, p. 14; [Stacks Project, Tag 02OO](https://stacks.math.columbia.edu/tag/02OO), case (3), for effective Cartier pullback on a reduced source, applied to the positive and negative parts of `D`.

*Needs:* §1.8; §1.1; **SchemeAndStackFoundations** §§3.4–3.5 (Picard groups and norms).

**Checks.**

- On `Spec O_K` this is the isomorphism of §1.7; for `X = Spec ℤ, ĉ₁(ℤ, r|·|) = (0, −2 log r)` of degree `−log r`.
- On `ℙ¹_ℤ`, the section `X₀` of sup-metrized `O(1)` has zero divisor `[X₀=0]`. On `X₁≠0` its Green function is `−log(|z|²/max(1,|z|)²), z=X₀/X₁`; adding `log|z|²` leaves the continuous local metric term. For a smooth Fubini–Study metric the corresponding term is `log(1+|z|²)`, which is smooth. Thus the smooth arithmetic Chow group uses the latter metric, while the continuous sup metric belongs to §1.12.
- For the trivial line on `Spec ℤ`, tensoring metrics `r|·|` and `s|·|` gives Green function `−2 log`(rs), the sum of `−2 log r` and `−2 log s`; dualizing changes its sign. Using `−log‖s‖` instead of `−log‖s‖²` would fail this comparison with the degree of §1.3.
- For `X = ℙ¹_ℤ, D = (t=0)` and a smooth metric on `O(D)`, let `X′ = Spec ℤ ⊔ Spec ℤ` map by `t=0` and `t=1` on its two components. Its whole image is not contained in `|D|`, but `t` pulls back to `(0,1) ∈ ℤ×ℤ`, annihilated by the nonzero `(1,0)`; the representative pullback fails on the first component. The metrized line and its arithmetic class still pull back. If the two sections instead have `t=1` and `t=2`, each generic point avoids `D` and the representative formula applies, including the vertical divisor at 2 on the second component.

### 1.10 Arithmetic degree of `ĈH¹` on proper one-cycles

Let `X` be regular and flat over `B = Spec O_K` (or `B_S`) with smooth generic fibre, and `Z₁^c(X)` the group of 1-cycles on `X` proper over the base. There is a bilinear pairing `(·,·) : ĈH¹(X)_ℚ × Z₁^c(X)_ℚ → ℝ` (respectively `ℝ_S = ℝ/span_ℚ{log p : some prime of S lies over p}` over `B_S`), defined on an irreducible `C` not contained in `|D|` as follows: if `C` is horizontal with normalization `ν : Spec O_{K(C)} → X` (or `Spec O_{K(C)}[1/S_C]` over `B_S`), `(D̂, C) = deg^(ν^*ĉ₁^{-1}(D̂))`, the Arakelov degree of the pulled-back hermitian line bundle over `O_{K(C)}`, equivalently `Σ_{x ∈ C ∩ |D|} i_x(C, D)·log #k(x) + ½ Σ_{y ∈ C(ℂ)} g(y)`, where `i_x(C, D)` is the signed intersection multiplicity on the normalization of `C` (the length for an effective `D`, extended by subtraction); if `C` is vertical, lying in the fibre over `𝔭, (D̂, C) = deg_{C}(O(D)|_C)·log N𝔭`. The value depends only on the class of `D̂`, is defined for every `C` by restricting its metrized line bundle, including when `C` lies in `|D|`, and on vertical cycles depends only on rational equivalence inside proper subschemes of special fibres; this defines the pairing on the quotient `Z₁(X)` of `Z₁^c(X)` by such cycles. The height of a point `x ∈ X(K′)` with closure `C_x` is `h_{D̂}(x) = (D̂, C_x)/[K(x):ℚ]` when `X` is proper, where `K(x)` is the residue field of the geometric point image. Equivalently, pushing forward the extension `Spec O_{K′} → X` gives the cycle `[K′:K(x)]·C_x`, and its pairing divided by `[K′:ℚ]` gives the same height.

Construct `ArithmeticChow1.properOneCycles X` as the subgroup of Mathlib’s `AlgebraicGeometry.AlgebraicCycle X ℚ` generated by integral closed subschemes `C` of absolute Krull dimension one that are proper over `B` (respectively `B_S`). The dimension is that of `C` itself, not its codimension in `X`. Since `X` is of finite type over a Noetherian arithmetic base, its locally finite supports are finite. Define `ArithmeticChow1.verticalRatEquiv` as the subgroup generated by pushforwards of principal divisors of rational units on integral proper surfaces contained in a special fibre; its quotient is `ArithmeticChow1.oneCycleQuotient`. The special-fibre relations use **SchemeAndStackFoundations** §5.1 over the residue field. Supply `properOneCycles_horizontal`, `properOneCycles_vertical`, `properOneCycles_pushforward` for proper morphisms, `verticalRatEquiv_pushforward` and the quotient projection. This constructs precisely the cycle argument of the pairing, with no arithmetic intersection ring assumed. (Wei Zhang §9.1, (9.1)–(9.4), p. 43; Gillet–Soulé §3.3, pp. 126–129.)

Horizontal 1-cycles proper over the arithmetic base are finite over it. Their normalizations are `Spec O_F` over `B` and `Spec O_F[1/S_F]` over `B_S`. Over `B_S` the finite contributions at primes of `S` are not defined, so values are taken modulo `ℚ`-multiples of their logarithms.

Provide the following maps and identities.

- `ArithmeticChow1.pairing`: `(D̂, C) ∈ ℝ` (or `ℝ_S`) for `D̂ ∈ ĈH¹(X)_ℚ` and `C ∈ Z₁(X)_ℚ`.
- `ArithmeticChow1.pairing_horizontal`: For `C` horizontal with normalization `ν, (D̂, C) = deg^(ν^*ĉ₁^{-1}D̂)`.
- `ArithmeticChow1.pairing_vertical`: For `C` in the fibre over `𝔭, (D̂, C) = deg_C(O(D)|_C)·log N𝔭`.
- `ArithmeticChow1.pairing_principal`: `(d̂iv f, C) = 0`.
- `ArithmeticChow1.pairing_green`: `(a(φ), C) = ½ Σ_{y ∈ C(ℂ)} φ(y)` for `C` horizontal.
- `ArithmeticChow1.pairing_projection`: Projection formula `(f^*D̂, C′) = (D̂, f_*C′)` for `f : X′ → X` proper.
- `ArithmeticChow1.pairing_localize`: Over `B_S` the pairing is the image in `ℝ_S` of the pairing over `B` when `X` extends.
- `ArithmeticChow1.pointHeight`: `h_{D̂}(x) = (D̂, C_x)/[K(x):ℚ]` for `X` proper over `B`.

Horizontal case: `ν^*O(D)` with the pulled-back metric is a hermitian line bundle over `O_{K(C)}`; its degree splits into the finite intersection multiplicities with `D` and the archimedean values of `g` at the points of `C(ℂ)`.

Independence of the class: a principal divisor `d̂iv(f)` pairs to `deg^` of a principal divisor on `O_{K(C)}`, which is 0 (§1.4), and vertical principal relations pair to 0 by the degree of a principal divisor on a proper curve over a field.

Over `B_S` the finite contributions at `S` are only defined up to `ℚ·log p`, giving values in `ℝ_S`; Zhang (9.3) applies the same definition with the base `Spec O_E ∖ S`.

For `C` contained in `|D|`, restrict the metrized line bundle `ĉ₁^{-1}(D̂)` directly: use its degree on a horizontal normalization and its ordinary line-bundle degree on a vertical curve. This extends the displayed intersection formula without a moving-lemma prerequisite.

The source identifications are [Wei Zhang](https://arxiv.org/abs/1909.02697v3), §9.1, (9.1)–(9.4), p. 43 (arXiv v3); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.7, pp. 29–30; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Remark 4.3, p. 167.

*Needs:* §1.8; §1.9; §1.3; §1.4; **SchemeAndStackFoundations** §5.1 (dimension-graded Chow groups).

**Checks.**

- For `X = Spec O_K`, the fundamental cycle has dimension one and generates the horizontal summand. It has codimension zero, which rules out a codimension-one definition of `properOneCycles`.
- For `X = ℙ¹` over `O_K`, a closed fibre is a vertical proper one-cycle. A closed point in that fibre has dimension zero and is excluded.
- For `X = 𝔸¹` over `O_K`, a fibre `𝔸¹_𝔽p` has dimension one but is not proper over the base and is excluded; a section `Spec O_K` remains a proper horizontal one-cycle. Properness of its support is necessary even though `X` itself need not be proper.
- `ArithmeticChow1.pairing_vertical_fibre`: Over `ℤ`, for `C` a horizontal section of `ℙ¹_ℤ, ((V_p, 0), C) = ((0, 2 log p), C) = log p`.
- `ArithmeticChow1.pairing_spec`: For `X = Spec O_K` and `C = X`, the pairing is the Arakelov degree of §1.3.
- `ArithmeticChow1.pairing_RS_nonexample`: Over `Spec ℤ[1/p]`, the value `log p` is 0 in `ℝ_S`; a real-valued pairing on `ĈH¹(X_S)` is not well defined.
- `ArithmeticChow1.pairing_metric_shift`: Adding a constant `c` to the Green function at every `σ` changes `(D̂, C)` for a horizontal `C` of degree `d` over `K` by `½·c·d·[K:ℚ]`.
- `ArithmeticChow1.pointHeight_field_extension`: For `[1:2]` with the smooth Fubini–Study metric over `ℚ`, the height is `½log 5`. Viewing it over `ℚ(i)` pushes `Spec ℤ[i]` forward to twice its original closure cycle, so the degree doubles and the normalized height stays `½log 5`. Dividing the unchanged closure pairing by 2 would give the wrong value.
- Over `Spec ℤ, (0, 2 log p)` pairs with the horizontal section of `ℙ¹_ℤ` to `log p`, matching `([p], 0)`; inverting a new prime `p` enlarges the quotient `ℝ_S` by `ℚ log p`.

### 1.11 Arithmetic degree on relative dimension zero Deligne–Mumford stacks

Let `Y` be a regular Deligne–Mumford stack, flat and proper with finite geometric fibres (relative dimension 0) over `Spec O_E`, with finite inertia. `ĈH¹(Y)` is the group of pairs `(Z, Φ)` with `Z` a Cartier divisor (supported in positive characteristic) and `Φ` an `F_∞`-invariant real function on `Y(ℂ)`, modulo `d̂iv(Ψ) = (div Ψ, −log|Ψ|²)`, for rational functions invertible on every generic component. The comparison with hermitian lines is `Pic^(Y) ⊗ ℚ ≅ ĈH¹(Y) ⊗ ℚ`. The arithmetic degree extends `ℚ`-linearly to `deg^ : ĈH¹(Y) ⊗ ℚ → ℝ` with `deg^(Z, 0) = Σ_𝔮 log N(𝔮)·Σ_{z ∈ Z(F̄_𝔮)} length(O^{et}_{Z,z})/#Aut(z)` for `Z` effective, and `deg^(0, Φ) = ½ Σ_{y ∈ Y(ℂ)} Φ(y)/#Aut(y)`. For a finite étale morphism `Y′ → Y` of degree `d, deg^(π^*D̂) = d·deg^(D̂)`; for `Y = Spec O_L` it is the Arakelov degree over `O_L`.

`Y` is regular, flat, proper, of relative dimension zero over `O_E`, with finite inertia and finite geometric fibres. The morphism need not be representable, as the classifying-stack example shows. `O^{et}_{Z,z}` is the étale local ring at `z`; residue-field norms `N(𝔮)`, not the residue characteristic, weight each prime.

Provide the following maps and identities.

- `StackDegree.arakelovDegree`: `deg^ : ĈH¹(Y) ⊗ ℚ → ℝ` by the weighted formulas.
- `StackDegree.degree_effective`: `deg^(Z, 0) = Σ_𝔮 log N𝔮 Σ_z length(O^{et}_{Z,z})/#Aut z`.
- `StackDegree.degree_green`: `deg^(0, Φ) = ½ Σ_y Φ(y)/#Aut y`.
- `StackDegree.degree_principal`: `deg^(d̂iv Ψ) = 0`.
- `StackDegree.degree_pullback_etale`: `deg^(π^*D̂) = deg(π)·deg^(D̂)` for `π` finite étale.
- `StackDegree.degree_scheme`: For `Y = Spec O_L, deg^` is the Arakelov degree of hermitian line bundles over `O_L`.
- `StackDegree.picHat_iso`: `Pic^(Y) ⊗ ℚ ≅ ĈH¹(Y) ⊗ ℚ`.

Define the degree on effective divisors and on Green functions by the displayed weighted sums; principal divisors have degree zero by the product formula applied on an étale atlas by schemes and division by automorphism orders.

For a hermitian line `L̄` choose a positive tensor power `L̄^{⊗n}` with trivial generic stabilizer action. The generic fibre has a finite coarse space over `E` (SchemeAndStackFoundations §1.23); descent there supplies a rational trivialization of that power. A rational section `s` then defines `n^{−1}(div s, −log ‖s‖²)`. Principal relations and a common tensor power prove independence of `n` and `s`. Conversely the metrized `O(Z)` construction of §1.9 supplies the inverse after tensoring with `ℚ`, using étale descent (AlgebraicModuliForArithmeticGeometry §3.1 and SchemeAndStackFoundations §§1.19–1.22).

Finite étale pullback: each geometric point of `Y` has `d` preimages counted with automorphism weights, so both sums scale by `d`.

For a scheme `Y = Spec O_L` every automorphism group is trivial and the formula is `deg^` of §1.3.

The source identifications are [Andreatta–Goren–Howard–Madapusi Pera](https://arxiv.org/abs/1508.00178v3), §6.4, arithmetic degree definition before Theorem 6.4.2, pp. 79–80 (arXiv v3).

*Needs:* §1.3; §1.9; **AlgebraicModuliForArithmeticGeometry** §3.1 (`spaceFpqcQuasicoherentDescent`); **SchemeAndStackFoundations** §§1.19–1.23 (stack descent and the generic coarse space).

**Checks.**

- `StackDegree.degree_point_aut`: For `Y = [Spec O_E / (ℤ/2)]` with trivial action and `Φ ≡ 2, deg^(0, Φ) = ½·[E:ℚ]·2/2 = [E:ℚ]/2`.
- On `B(ℤ/2)` over `ℤ`, the sign line with unit metric has nontrivial generic character and no rational trivialization. Every vertical divisor line has trivial generic character, so the integral comparison fails. The sign line's square is the unit metrized line, and its rationalized class and degree are zero.
- `StackDegree.degree_scheme_case`: For `Y = Spec O_E` (trivial automorphisms) `deg^` agrees with §1.3.
- `StackDegree.residue_norm_nonexample`: Weighting a closed point over `𝔮` with `log p` instead of `log N(𝔮)` gives the wrong degree for a divisor at an inert prime of residue degree 2.
- `StackDegree.etale_cover_scaling`: A degree-`d` finite étale cover multiplies `deg^` of pulled-back classes by `d`.
- AGHMP's `[·:Y]` is `deg^` composed with pullback along `Y → M`; for a level cover both numerator and denominator in Theorem 6.4.2 scale by the same `d`.

### 1.12 Heights of algebraic points for metrized line bundles

Let `𝒳` be a projective flat scheme over `Spec ℤ` (or over `Spec O_K`), `X = 𝒳_ℚ` (respectively `𝒳_K`), `ℒ` a line bundle on `𝒳` and `‖·‖` a continuous `F_∞`-invariant hermitian metric on `ℒ_ℂ` over `𝒳(ℂ)`. For a number field `K′` and `x ∈ X(K′)`, let `x̄ : Spec O_{K′} → 𝒳` extend `x` (properness) and set `h_{ℒ̄}(x) = deg^(x̄^*ℒ, x^*‖·‖)/[K′:ℚ]`. This depends only on the image of `x` in `X(ℚ̄)`, giving `h_{ℒ̄} : X(ℚ̄) → ℝ`. Changing the integral model of `(X, L)` changes `h` by a bounded function; changing the continuous metric by `φ = log(‖·‖′/‖·‖)` changes `h` by at most `sup|φ|`.

`𝒳` proper over the base, so every `K′`-point extends uniquely to `O_{K′}`. Metrics are continuous (not necessarily smooth); smooth metrics give the pairing of §1.10 on the closure of `x`.

Provide the following maps and identities.

- `Height.ofMetrized`: `h_{ℒ̄} : X(ℚ̄) → ℝ, x ↦ deg^(x̄^*ℒ̄)/[K(x):ℚ]`.
- `Height.ofMetrized_galois`: For a model and metric over `O_K, h(x^γ) = h(x)` for `γ ∈ Gal(ℚ̄/K)`. For a model over `ℤ` this holds for `Gal(ℚ̄/ℚ)`.
- `Height.ofMetrized_tensor`: `h_{ℒ̄ ⊗ ℳ̄} = h_{ℒ̄} + h_{ℳ̄}`.
- `Height.ofMetrized_pullback`: For `f : 𝒳′ → 𝒳` over the base, `h_{f^*ℒ̄} = h_{ℒ̄} ∘ f`.
- `Height.ofMetrized_metric_change`: `|h_{(ℒ, ‖·‖′)} − h_{(ℒ, ‖·‖)}| ≤ sup |log(‖·‖′/‖·‖)|`.
- `Height.ofMetrized_model_change`: Two integral models of `(X, L)` give heights differing by a bounded function.
- `Height.ofMetrized_field`: The value at `x ∈ X(K′)` does not depend on the field `K′` containing the field of definition.

Existence and uniqueness of `x̄` is the valuative criterion of properness; `x̄^*ℒ` with `x^*‖·‖` is a hermitian line bundle over `O_{K′}`.

Field independence: for `K″ ⊃ K′` the extension of `x` to `O_{K″}` is the base change of `x̄`, so §1.6 gives the same normalised value.

Model change: two integral models agree over `ℤ[1/N]`; at primes dividing `N` the integral structures of `x̄^*ℒ` differ by an amount bounded by the orders of the two lattices, uniformly in `x` (Deligne §1.7: heights are independent of the integral structure up to `O(1)`).

Metric change: the archimedean terms change by `−Σ_σ φ(x_σ)/[K′:ℚ]`, bounded by `sup|φ|`.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.7, pp. 29–30; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Remark 4.3, p. 167; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, Lemma 3, p. 356.

*Needs:* §1.3; §1.6; §1.10; **ComplexComparisonPartII** §§C−1.1, C0.4 and C5.1.

**Checks.**

- `Height.ofMetrized_trivial`: For `ℒ̄ = O_𝒳` with the constant metric `1, h ≡ 0`.
- `Height.ofMetrized_constant_metric`: Multiplying the metric by `e^{−c}` adds `c` to `h` at every point.
- `Height.ofMetrized_projective_line`: For `𝒳 = ℙ¹_ℤ, ℒ = O(1)` with the sup metric and `x = [a : b]` with coprime integers, `h(x) = log max(|a|, |b|)`.
- `Height.ofMetrized_unnormalised_nonexample`: Without the factor `1/[K′:ℚ]` the value at `x = [1 : 2]` would double on passing from `ℚ` to `ℚ(i)`, so the unnormalised degree is not a function on `X(ℚ̄)`.
- For `ℙⁿ_ℤ` with `O(1)` and the sup metric, `h_{Ō(1)}` is the absolute logarithmic Weil height (§1.14).

### 1.13 Metrized heights represent Weil heights; Northcott for ample bundles

For a projective variety `X` over a number field `K`, construct `Height.weilClass L`, the class modulo bounded real functions on `X(ℚ̄)` of the height attached to a line bundle `L`. Its intended signature is an additive map from the ordinary Picard group of `X` to the additive quotient of functions `X(ℚ̄) → ℝ` by the subgroup of bounded functions. Use the projective height `absoluteProjectiveTupleHeight` of **DiophantineApproximationAndTranscendence** §0.2 for `O(1)`, extend a line bundle to a projective arithmetic model after a proper modification, and use §1.12 for its degree representative. Independence of this extension is the model-change assertion of §1.12. The API is `Height.weilClass_tensor`, `Height.weilClass_dual`, `Height.weilClass_pullback` for morphisms of projective varieties, and `Height.weilClass_projective` for the absolute sup height of `O(1)`. Prove `Height.weilClass_ample_lowerBound`, `Height.weilClass_northcott` and `Height.northcott_boundedChange` for absolute heights with bounded degree: ample representatives are bounded below, have finite bounded-degree bounded-height sublevel sets, and retain these properties under bounded changes. The projective-space finiteness follows coordinatewise from **DiophantineApproximationAndTranscendence** §0.3 after normalizing a nonzero coordinate to 1; the ample case follows from a projective embedding by a positive tensor power. (Deligne §1.7–Rappel 1.8, pp. 29–30; Faltings–Chai V, Proposition 4.4, pp. 167–168.)

In the situation of §1.12, `h_{ℒ̄}` represents this Weil height class `h_L` of the generic fibre `(X, L): h_{ℒ̄} − h_L` is bounded on `X(ℚ̄)`. Consequently, if `L` is ample, `h_{ℒ̄}` is bounded below on `X(ℚ̄)`, and for all `D ≥ 1` and `B ∈ ℝ` the set `{x ∈ X(ℚ̄) : [ℚ(x):ℚ] ≤ D, h_{ℒ̄}(x) ≤ B}` is finite.

`X = 𝒳_ℚ` is a projective variety over `ℚ` (for a reducible or non-reduced `X` apply the statement to the reduced irreducible components); `L` ample for the last two statements; metrics continuous.

For `ℒ = O(1)` on `ℙⁿ_ℤ` with the sup metric, `h_{ℒ̄}` equals the normalised Weil height exactly (§1.14).

For very ample `L` choose an embedding `𝒳 → ℙⁿ_ℤ` over `ℤ[1/N]` with `L = O(1)`; by §1.12 the change of model and of metric is bounded, so `h_{ℒ̄}` represents `h_L`.

For general `L` write `L = L₁ ⊗ L₂^{-1}` with `L_i` very ample and use additivity.

Lower bound and Northcott follow from the projective embedding and bounded-change assertions just specified, retaining the absolute degree bound.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.7–Rappel 1.8, pp. 29–30; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. `V`, Proposition 4.4 (the case `X = X̄`), p. 168.

*Needs:* §1.12; §1.14 for the degree/projective-height calculation; **DiophantineApproximationAndTranscendence** §§0.2–0.3; **HeightsAndUnits** §1.1 for the fixed-field projective normalization.

**Checks.**

- On `ℙ¹` over `ℚ, O(1)` gives `h([1:2]) = log 2`, while its dual gives `−log 2`. The `O(−1)` height is unbounded below and its upper sublevels need not be finite, so ampleness is necessary.
- For roots of unity `ζ, h([1:ζ]) = 0`. There are infinitely many such points if the absolute degree restriction is dropped; for degree one and height zero the affine coordinate is `−1, 0` or 1.
- Tensoring `O(1)` by itself doubles the height class; replacing its continuous metric by `e^(−c)` times that metric adds the bounded constant `c` to the representative and leaves the class unchanged.
- Deligne's Rappel 1.8: finitely many `x ∈ X(k)` with `h_L(x) ≤ h` for `L` ample.

### 1.14 Projective space: the Arakelov degree is Mathlib's height

Let `K` be a number field, `n ≥ 0` and `x = (x₀, …, x_n) ∈ K^{n+1} ∖ {0}` with point `[x] ∈ ℙⁿ(K)`. Let `𝔟 ⊂ K` be the fractional ideal generated by the coordinates. The hermitian line bundle `x̄^*O(1)` with the sup metric (`‖ℓ‖_σ = |ℓ(x)|_σ / max_i |x_i|_σ` for linear forms `ℓ`) is isometric to `O(D_x)` for the Arakelov divisor `D_x = (𝔟^{-1}, v ↦ mult(v)·log max_i |x_i|_v)`, and `deg^(x̄^*Ō(1)_sup) = log N(𝔟^{-1}) + Σ_v mult(v) log max_i |x_i|_v = Height.logHeight x`, the logarithm of Mathlib's relative multiplicative height of the tuple; it depends only on `[x]` and equals `Projectivization.logHeight [x]`. With the Fubini–Study metric `‖ℓ‖_σ = |ℓ(x)|_σ/(Σ_i |x_i|²_σ)^{1/2}` the degree is `log` of the Arakelov `(ℓ²)` height, and `0 ≤ deg^_FS − deg^_sup ≤ ½[K:ℚ]·log(n + 1)`.

`x ≠ 0`; the sup 'metric' is continuous but not smooth on `ℙⁿ(ℂ)`. Mathlib's height is relative: it is `[K:ℚ]` times the absolute height.

Provide the following maps and identities.

- `ArakelovDivisor.ofTuple`: For `x ≠ 0`, the Arakelov divisor `(𝔟^{-1}, v ↦ mult(v) log max_i |x_i|_v)` of `x^*Ō(1)` with the sup metric.
- `ArakelovDivisor.degree_ofTuple`: `deg^(ofTuple x) = Height.logHeight x`.
- `ArakelovDivisor.ofTuple_smul`: `ofTuple(c·x) = ofTuple x − (c)` for `c ∈ K^×`.

The pullback of `O(−1)` is the saturated lattice `Kx ∩ O_K^{n+1} = 𝔟^{−1}x`. Its dual, the pullback of `O(1)`, is identified with `𝔟` by evaluation on `x`, and its degree has finite term `−log N(𝔟) = log N(𝔟^{−1})`.

By `NumberField.absNorm_mul_finprod_finitePlace_eq_one` (after scaling `x` to be integral, which changes neither side by `mulHeight_smul_eq_mulHeight` and §1.4), `∏ᶠ_𝔭 max_i |x_i|_𝔭 = N(𝔟)^{-1}`.

The archimedean terms are `Σ_v mult(v) log max_i |x_i|_v`, matching `NumberField.mulHeight_eq`.

For the Fubini–Study metric, `max_i |x_i| ≤ (Σ|x_i|²)^{1/2} ≤ (n+1)^{1/2} max_i |x_i|` at each embedding; summing over `[K:ℚ]` embeddings gives the bound.

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, Lemma 3 and its proof, p. 356; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.7, p. 29; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, Corollaire, p. 14.

*Needs:* §1.7; §1.12; Mathlib `Height.logHeight`; Mathlib `Projectivization.logHeight`; Mathlib `NumberField.mulHeight_eq`; Mathlib `NumberField.absNorm_mul_finprod_finitePlace_eq_one`; **DiophantineApproximationAndTranscendence** §0.2 (absolute tuple and scalar heights).

**Checks.**

- `ArakelovDivisor.ofTuple_zero_nonexample`: The zero tuple does not define a projective point or an invertible coordinate ideal, even though Mathlib assigns its tuple height a junk value.
- `ArakelovDivisor.ofTuple_coprime`: For nonzero coprime integers `a,b` over `ℚ`, the degree of `ofTuple(a,b)` is `log max(|a|,|b|)`, agreeing with `NumberField.mulHeight_eq_max_abs_of_gcd_eq_one`.
- `ArakelovDivisor.ofTuple_FS`: At `[1:1]` over `ℚ`, the sup degree is 0 and the Fubini–Study degree is `½ log 2`; at `[1:0]` both are 0.
- `ArakelovDivisor.ofTuple_scaling`: Scaling by `c ≠ 0` subtracts the principal divisor `(c)`; for `(2,2)` and `(1,1)` the degree stays 0.
- For `K = ℚ` and `x = (a, b)` coprime, `deg^ = log max(|a|, |b|)`, Mathlib's `mulHeight_eq_max_abs_of_gcd_eq_one`; for `x = (1, 1)` the Fubini–Study degree is `½ log 2`.

### 1.15 Hermitian `ℚ`-lines and norms of hermitian line bundles

(a) The group of hermitian `ℚ`-line bundles over `Spec O_K` is `Pic^(O_K)_ℚ = Pic^(O_K) ⊗ ℚ`, with `deg^` extended `ℚ`-linearly; equivalently `ĈH¹(Spec O_K)_ℚ`. (b) For a finite extension `L/K`, the norm `N_{L/K} : Pic^(O_L) → Pic^(O_K)` sends `M̄ = (M, ‖·‖)` to the norm `N_{O_L/O_K}(M)` of the invertible `O_L`-module with the metrics `‖N(m)‖_σ = ∏_{τ ∈ Σ_L, τ|_K = σ} ‖m‖_τ`; it is a group homomorphism, corresponds to the push-forward `ĈH¹(Spec O_L) → ĈH¹(Spec O_K)`, and satisfies `deg^(N_{L/K} M̄) = deg^(M̄)` and `N_{L/K}(L̄_{O_L}) ≅ L̄^{⊗[L:K]}` for `L̄` over `O_K`. (c) For `π : 𝒴 → 𝒳` finite locally free of constant degree `d` between flat proper arithmetic schemes, étale on generic fibres, `N_π(ℳ)` carries the metric `‖N_π(m)‖(x) = ∏_{π(y) = x} ‖m‖(y)` at complex points, and for every `x ∈ 𝒳(ℚ̄), h_{N_π ℳ̄}(x) = Σ_{y ∈ 𝒴(ℚ̄), π(y) = x} h_{ℳ̄}(y)`, a sum over the `d` points above `x`.

`L/K` finite; for (c) the morphism is finite locally free so that the module norm exists (SchemeAndStackFoundations §§3.4–3.5: `lineBundleNorm` in §3.5); in (c) `π` is étale on generic fibres.

Provide the following maps and identities.

- `PicHat.rat`: `Pic^(O_K)_ℚ = Pic^(O_K) ⊗ ℚ` with the `ℚ`-linear degree.
- `PicHat.norm`: `N_{L/K} : Pic^(O_L) → Pic^(O_K)`.
- `PicHat.norm_mul`: `N_{L/K}(M̄ ⊗ M̄′) = N_{L/K}M̄ ⊗ N_{L/K}M̄′`.
- `PicHat.degree_norm`: `deg^(N_{L/K}M̄) = deg^(M̄)`.
- `PicHat.norm_baseChange`: `N_{L/K}(L̄_{O_L}) ≅ L̄^{⊗[L:K]}`.
- `PicHat.norm_trans`: `N_{L/K} ∘ N_{M/L} = N_{M/K}` for towers `M/L/K`.
- `PicHat.norm_pushforward`: `N_{L/K}` agrees with the push-forward `ĈH¹(Spec O_L) → ĈH¹(Spec O_K)`.

(a) Tensor with `ℚ`; `deg^` is a homomorphism (§1.5).

(b) The norm of an invertible `O_L`-module along the finite flat `O_K → O_L` exists and is multiplicative (SchemeAndStackFoundations §3.5 `lineBundleNorm`); for `m ∈ M` nonzero, `N(m)` generates a submodule of index `#(M/O_L m)`, since the absolute norm is transitive; the archimedean norms multiply over the `[L:K]` embeddings above each `σ`, so `deg^` is preserved.

Compatibility with push-forward: Gillet–Soulé's proper push-forward on `ĈH¹` of `Spec O_L → Spec O_K` sends `(div m, −log‖m‖²)` to `(div N(m), −Σ log‖m‖²_τ)`, the class of `N_{L/K}M̄`.

`N_{L/K}(L̄_{O_L}) ≅ L̄^{⊗[L:K]}` because the norm of a pulled-back module is the `[L:K]`-th power.

(c) The norm commutes with the base change `x̄ : Spec O_{K′} → 𝒳`, so `x̄^*N_π ℳ = N_{R/O_{K′}}(ℳ|_R)` for the order `R = O(𝒴 ×_𝒳 Spec O_{K′})`; for an invertible `R`-module and a generic generator `f` the indices `#(R/fR)` and `#(R̃/fR̃)` agree (both are `|N(f)|, R` and its normalisation `R̃` being lattices in the same étale `K′`-algebra), so (b) applied to the factors `O_{K′_j}` of `R̃` gives `deg x̄^*N_π ℳ̄ = Σ_j deg^ y_j^*ℳ̄`; dividing by `[K′:ℚ]` gives the sum over the `d` geometric points.

The source identifications are [Gillet–Soulé](https://www.numdam.org/item/PMIHES_1990__72__93_0/), §3.6, Theorem 3.6.1, pp. 134–135; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), §1.2, Corollaire, p. 14.

*Needs:* §1.5; §1.7; **SchemeAndStackFoundations** §§3.4–3.5 (Picard groups and norms); Mathlib `Ideal.absNorm`; Mathlib `Algebra.norm`; Mathlib `Algebra.norm_norm`.

**Checks.**

- `PicHat.norm_self`: For `L = K, N_{K/K}` is the identity.
- `PicHat.norm_gaussian_prime`: `N_{ℚ(i)/ℚ}` of the ideal `(1 + i)` with the standard metric is `(2ℤ, |·|)`, of degree `−log 2`.
- `PicHat.norm_degree_nonexample`: Taking the metric `‖N(m)‖_σ = ‖m‖_τ` for a single `τ` above `σ` (instead of the product) breaks `deg^(N M̄) = deg^(M̄)` as soon as `[L:K] > 1`.
- `PicHat.degree_rat`: `deg^` on `Pic^(O_K)_ℚ` restricts to `deg^` on `Pic^(O_K)`.
- `PicHat.degree_half_line`: Over `ℚ`, half the class of `(ℤ, 2|·|)` has degree `−½ log 2`, and doubling it recovers degree `−log 2`. Integral tensor powers alone do not supply this division operation.
- `PicHat.rat_torsion`: In the kernel `ℝ²/log|O_K^×|` for `K=ℚ(√2)`, take half the weighted logarithmic vector of the fundamental unit `1+√2`. It represents a nonzero class killed by 2, so its image in `Pic^(O_K)_ℚ` is zero. Rationalization is not an injective replacement for the original compactified Picard group.
- For `K = ℚ, L = ℚ(i)` and `M̄ = (𝔭, standard metric)` with `𝔭 = (1 + i): N_{L/ℚ}M̄ = (2ℤ, |·|)` of degree `−log 2 = deg^(M̄)`.

### Examples

Over `ℚ` a line `(ℤ,r|·|)` has degree `−log r`. For the Gaussian ideal `(1+i)` with its inherited metric the degree is `−log 2`. For a divisor `(2)` over `ℚ(i)`, its finite term is `log 4` and its single infinite-place term is `−2log 2`, so the total is zero. On `ℙ¹` the point `[1:1]` has sup height zero and FS height `½log 2`. These calculations distinguish ideal signs, multiplicities and the two metrics.

### Dependencies

Mathlib number fields, ideals, projective modules, inner products, product formula and heights; AlgebraicVectorBundles; SchemeAndStackFoundations §§3.4–3.5 and 5.1; HeightsAndUnits §1.1; AlgebraicModuliForArithmeticGeometry §3.1 and SchemeAndStackFoundations §§1.19–1.22; ComplexComparisonPartII §§C−1.1, C0.4 and C5.1; DiophantineApproximationAndTranscendence §§0.2–0.3.

## Layer 2: The Hodge line and the Faltings metric

Use the invariant-differential Hodge line from the suppliers. The new content is its integration metric, its lattice normalization and its compatibility with arithmetic models. The period and discriminant checks pin the sign and all factors of `2π`.

### 2.0 Semi-abelian families and extension of homomorphisms

Use the semi-abelian geometric-fibre condition of **NeronModelsAndSemistableAbelianVarieties** §3.1: a connected smooth commutative group over a field is an extension of an abelian variety by a torus. For a smooth separated commutative group scheme `G → S` of finite presentation, define `GroupScheme.IsSemiAbelianFamily G` by requiring this condition on every geometric fibre. Its intended signature is a predicate on the existing group-scheme object over `S`. Toric rank may jump; this predicate does not require `G` globally to be an extension of an abelian scheme by a torus. Supply `GroupScheme.IsSemiAbelianFamily.baseChange`, `.of_isIso`, `.prod`, `.geometricFibre` and `.abelianLocus`, the last identifying the toric-rank-zero locus with the locus where `G` is an abelian scheme. On `Spec O_K`, an everywhere semistable abelian variety has such an identity model by the Néron supplier. (Faltings–Chai `I`, Definition 2.3 and Remark 2.4, p. 8; Remark 2.8, p. 11.)

Prove `GroupScheme.semiAbelianHom_extend`: if `S` is Noetherian and normal, `U ⊂ S` is dense open, and `G` and `H` are semi-abelian families over `S`, restriction `Hom_S(G,H) → Hom_U(G_U,H_U)` is bijective. Supply compatibility with identities, composition and restriction to smaller dense opens. In particular, an isomorphism over `U` extends to an isomorphism over `S`. On a Dedekind arithmetic base, a semi-abelian model with abelian generic fibre is the Néron identity component, compatibly with the comparison of **NeronModelsAndSemistableAbelianVarieties** §3.3. The extension proof reduces to traits by closure of the graph and normality; in the abelian-generic-fibre case the Néron mapping property identifies the extension. (Faltings–Chai `I`, Proposition 2.7 and proof, pp. 9–11.)

**Checks.**

- An abelian scheme is a semi-abelian family of toric rank zero; the constant family `𝔾_m` is a semi-abelian family of toric rank one and is not proper.
- The Tate elliptic identity model has toric rank zero generically and one at the closed point. It satisfies the fibrewise predicate and cannot be a global extension with constant torus rank.
- `𝔾_a` over a field fails the predicate: its connected affine fibre is unipotent, rather than a torus. The zero group over `S` satisfies it and has unit determinant line.
- For `𝔾_m` over a normal integral `S`, the generic homomorphism `t ↦ t²` extends uniquely as `t ↦ t²`, including at residue characteristic two; no étaleness is required for this extension theorem.

*Needs:* **NeronModelsAndSemistableAbelianVarieties** §§3.1 and 3.3 for the fibre condition and Dedekind specialization; **SchemeAndStackFoundations** §§0.6 and 3.8 for normal-base extension and invariant differentials; **AbelianSchemesAndArithmeticModuli** §A1.1.

### 2.1 The Faltings metric on top differential forms

For a complex abelian variety `A` of dimension `g`, the one-dimensional space `H⁰(A, Ω^g)` carries the hermitian form `⟨α, β⟩_Fal = (i^{g²}/2^g)·∫_{A(ℂ)} β ∧ ᾱ`. It is positive definite: `‖α‖²_Fal = 2^{−g}·|∫_{A(ℂ)} α ∧ ᾱ| > 0` for `α ≠ 0`, and `i^{g²} ∫ α ∧ ᾱ` is a positive real number, `i^{g²} = i^g(−1)^{g(g−1)/2}`. Other normalisations in use are `‖α‖²_Del = (2π)^{−g}|∫ α ∧ ᾱ|` (Deligne, Bost, Yuan–Zhang, Gaudron–Rémond) and `‖α‖²_un = |∫ α ∧ ᾱ|` (Tsimerman, Andreatta–Goren–Howard–Madapusi Pera); see §2.7.

`A` a complex abelian variety (compact complex torus with a polarization) of dimension `g ≥ 0`; for `g = 0, H⁰ = ℂ` with `‖1‖ = 1`. Faltings prints `(i/2)^g ∫ α ∧ ᾱ`, which is negative for `g ≡ 2, 3` mod 4; the factor `i^{g²} = i^g(−1)^{g(g−1)/2}` corrects the sign.

Provide the following maps and identities.

- `AbelianVariety.faltingsInner`: `⟨α, β⟩_Fal = (i^{g²}/2^g)∫_{A(ℂ)} β ∧ ᾱ` on `H⁰(A, Ω^g)`.
- `AbelianVariety.faltingsNormSq`: `‖α‖²_Fal = 2^{−g}|∫ α ∧ ᾱ|`.
- `AbelianVariety.faltingsInner_pos`: `⟨α, α⟩_Fal > 0` for `α ≠ 0`.
- `AbelianVariety.faltingsNormSq_smul`: `‖λα‖²_Fal = |λ|²‖α‖²_Fal`.
- `AbelianVariety.faltingsNormSq_aut`: `‖f^*α‖_Fal = ‖α‖_Fal` for an automorphism `f` of `A`.
- `AbelianVariety.faltingsNormSq_conj`: For `A` defined over `ℝ ⊂ ℂ` or for the conjugate variety `Ā, ‖ᾱ‖_Fal` on `Ā` equals `‖α‖_Fal` on `A`.
- `AbelianVariety.faltingsNormSq_eq_volume`: `‖α‖²_Fal` is the volume of `A(ℂ)` for the Haar measure `|α ∧ ᾱ|/2^g`.
- `ComplexTorus.faltingsNormSqDz`: For a lattice `Λ ⊂ ℂ, ‖dz‖²_Fal` on `ℂ/Λ`, equal to the covolume of `Λ`.
- `ComplexTorus.faltingsNormSqDz_span`: `‖dz‖²_Fal` on `ℂ/(ℤ + τℤ)` is `Im τ`.

In linear coordinates `z₁`, …, `z_g` on `A(ℂ) = ℂ^g/Λ` write `α = c·dz₁ ∧ ⋯ ∧ dz_g`. Then `α ∧ ᾱ = |c|²(−1)^{g(g−1)/2}∏_j(dz_j ∧ dz̄_j)` and `dz_j ∧ dz̄_j = −2i dx_j ∧ dy_j`.

Hence `(i^{g²}/2^g)α ∧ ᾱ = |c|²·dx₁ ∧ dy₁ ∧ ⋯ ∧ dx_g ∧ dy_g`, the Lebesgue volume form; integrating gives `|c|²·vol(ℂ^g/Λ) > 0` (§2.2).

The order `β ∧ ᾱ` makes the form conjugate-linear in `α` and linear in `β`, agreeing with `InnerProductSpace`; hermitian symmetry follows from conjugating the integrand and the coefficient. The form is invariant under all automorphisms of `A` since they preserve `∫`.

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §2, p. 351, Bemerkung d); [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Definition 4.1, p. 167; [Yuan](https://arxiv.org/abs/2108.05625v4), §3.1.3 (1), pp. 43–44 and §4.3.1, pp. 70–72 (arXiv v4); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2(b), p. 26.

*Needs:* **AbelianSchemesAndArithmeticModuli** §A5.1 (`AbelianLattice`); **ComplexComparisonPartII** §§C−1.1, C0.4 and C5.1; Mathlib `UpperHalfPlane`.

**Checks.**

- `AbelianVariety.faltingsInner_sesquilinear`: On `ℂ/(ℤ+iℤ), ⟨i dz,dz⟩_Fal = −i` and `⟨dz,i dz⟩_Fal = i`. Reversing the mixed integrand violates Mathlib's first-argument convention.
- `AbelianVariety.faltingsNormSq_elliptic`: For `E = ℂ/(ℤ + τℤ)` and `α = dz, ‖dz‖²_Fal = Im τ`.
- `AbelianVariety.faltingsInner_sign_nonexample`: For `g = 2` and `A = E × E` with `α = dz₁ ∧ dz₂, (i/2)²∫ α ∧ ᾱ = −(Im τ)² < 0`: the printed factor `(i/2)^g` is not positive definite.
- `AbelianVariety.faltingsNormSq_dim_zero`: For `g = 0, ‖1‖_Fal = 1`.
- `AbelianVariety.faltingsNormSq_product`: For `A × B` and `α ∧ β` (pulled back), `‖α ∧ β‖²_Fal = ‖α‖²_Fal·‖β‖²_Fal` (Fubini).
- `‖dz‖²_Fal = Im τ` for `ℂ/(ℤ + τℤ)`; scaling `α` by `λ` multiplies `‖α‖` by `|λ|`; for `g = 2` the printed `(i/2)²∫ α ∧ ᾱ` is `−‖α‖²_Fal`.

### 2.2 The Faltings norm is a covolume

Let `A(ℂ) ≅ V/Λ` with `V = T₀A ≅ ℂ^g` and `Λ` the period lattice (AbelianSchemesAndArithmeticModuli A5). For a basis `z₁`, …, `z_g` of linear coordinates on `V, ‖dz₁ ∧ ⋯ ∧ dz_g‖²_Fal = covol(Λ)`, the Lebesgue covolume of `Λ` in `ℂ^g = ℝ^{2g}`. In the Siegel normalisation `Λ = ℤ^g + τℤ^g` with `τ ∈ ℍ_g, ‖dz₁ ∧ ⋯ ∧ dz_g‖²_Fal = det(Im τ)`; for a general basis of periods `(Ω₁ | Ω₂)` with `Ω₁` invertible and `τ = Ω₁^{−1}Ω₂`, the form `dz₁ ∧ ⋯ ∧ dz_g` in the fixed original coordinates has squared norm `|det Ω₁|²·det(Im τ)`. For `g = 1` and `Λ = ℤω_1 + ℤω_2` with `Im(ω₂/ω₁) > 0, ‖dz‖²_Fal = |ω₁|²·Im(ω₂/ω₁) =` area of `ℂ/Λ`.

`A` a complex abelian variety; `Λ ⊂ ℂ^g` a full lattice; `τ ∈ ℍ_g` symmetric with positive definite imaginary part.

By the computation in §2.1 the integrand is the Lebesgue volume form; integrate over a fundamental domain of `Λ`.

For `Λ = ℤ^g + τℤ^g` the real `2g × 2g` matrix of the basis has determinant `det(Im τ)` (block elimination of `Re τ`).

Write `z = Ω_1w`. The lattice in the `w`-coordinates is `ℤ^g + τℤ^g`, and `dz₁ ∧ ⋯ ∧ dz_g = det(Ω₁) dw₁ ∧ ⋯ ∧ dw_g`. Thus the squared norm of the fixed `z`-form is `|det Ω₁|² det(Im τ)`; the normalized `w`-form has squared norm `det(Im τ)`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, proof of Proposition 4.5, p. 168; [Pazuki](https://arxiv.org/abs/0907.1458v2), Theorem 1.1, p. 2 (arXiv v2); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.10, p. 31.

*Needs:* §2.1; **AbelianSchemesAndArithmeticModuli** §A5.1 (`AbelianLattice`); **AbelianSchemesAndArithmeticModuli** §A5.8 (`SiegelFamily`); Mathlib `ZLattice.covolume`; Mathlib `UpperHalfPlane`.

**Checks.**

- For `E = ℂ/(ℤ + iℤ), ‖dz‖² = 1`; for `τ = 2i, ‖dz‖² = 2`; for `E × E′` the norm squared of `dz₁ ∧ dz₂` is the product of covolumes.

### 2.3 Faltings norms along isogenies

Let `φ : A → B` be an isogeny of complex abelian varieties of degree `d = deg φ`. For `α ∈ H⁰(B, Ω^g), ‖φ^*α‖²_Fal = d·‖α‖²_Fal`. Equivalently, for the canonical section 1 of `ω̄_A ⊗ ω̄_B^{−1}` given by `φ^*`, its norm at a complex embedding with these metrics is `d^{1/2}`, so a complex place of multiplicity two contributes `log d` to the weighted sum of `log` norms.

`φ` surjective with finite kernel of order `d` (AbelianSchemesAndArithmeticModuli A3 relative-isogeny over `ℂ`).

`φ : A(ℂ) → B(ℂ)` is a covering map of degree `d`, a local biholomorphism.

`∫_{A(ℂ)} φ^*(α ∧ ᾱ) = d·∫_{B(ℂ)} α ∧ ᾱ` by the change of variables for a `d`-sheeted covering.

In lattice terms: `φ` is induced by a linear isomorphism `V_A → V_B` carrying `Λ_A` onto a sublattice of `Λ_B` of index `d`.

The source identifications are [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), §1.4, pp. 204–205; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, proof of Lemma 3.4, p. 166.

*Needs:* §2.1; §2.2; **AbelianSchemesAndArithmeticModuli** §A3.1 (`IsAbelianIsogeny`); **AbelianSchemesAndArithmeticModuli** §A5.1 (`AbelianLattice`).

**Checks.**

- For `[n]` with `n ∈ ℤ` and `n ≠ 0 : A → A, ‖[n]^*α‖² = n^{2g}‖α‖²` and `[n]^*α = n^g α`, consistent; for `E → E/⟨P⟩` with `P` of order `p` the norm squares scale by `p`.

### 2.4 The metrized Hodge line bundle over `O_K`

Let `K` be a number field and `G → Spec O_K` a smooth separated commutative group scheme of finite type whose generic fibre `A = G_K` is an abelian variety of dimension `g` (`a` Néron model, its identity component, or a semi-abelian model). The metrized Hodge line `ω̄̂(G)` is the hermitian line bundle over `Spec O_K` whose module is `ω̄_G` (the imported Hodge-line interface) and whose metric at `σ ∈ Σ_K` is the Faltings metric on `ω̄_G ⊗_σ ℂ = H⁰(A_σ, Ω^g), A_σ = A ⊗_{K,σ} ℂ`. The archimedean data depend only on `A`; the finite data depend on the model, and for the Néron model `𝒜` of `A` one writes `ω̄̂(A/K) = ω̄̂(𝒜) = ω̄̂(𝒜⁰)`. For a finite extension `L/K` there is a canonical injection `ω̄_{𝒜_L}` ↪ `ω̄_𝒜 ⊗_{O_K} O_L` of lattices in `ω̄(A_L)` (pullback of invariant differentials along the morphism `𝒜 ⊗ O_L → 𝒜_L` given by the Néron mapping property) which is an isometry at every complex embedding.

`G` smooth over `O_K` with abelian generic fibre; the Néron model exists by NeronModelsAndSemistableAbelianVarieties §§1.1–1.11. The conjugation condition holds because `A_{σ̄}` is the complex conjugate variety of `A_σ` and the Faltings form is conjugation-compatible.

Provide the following maps and identities.

- `AbelianVariety.metrizedHodgeLine`: `ω̄̂(A/K)`: the Néron Hodge line with Faltings metrics, a hermitian line bundle over `O_K`.
- `GroupScheme.metrizedHodgeLine`: `ω̄̂(G)` for a smooth model `G` with abelian generic fibre.
- `AbelianVariety.metrizedHodgeLine_identityComponent`: `ω̄̂(𝒜⁰) = ω̄̂(𝒜)`.
- `AbelianVariety.metrizedHodgeLine_baseChange_le`: `ω̄_{𝒜_L} ⊆ ω̄_𝒜 ⊗ O_L` inside `ω̄(A_L)`, with equal metrics.
- `AbelianVariety.metrizedHodgeLine_iso`: A `K`-isomorphism `A ≅ B` induces an isometry `ω̄̂(A/K) ≅ ω̄̂(B/K)`.
- `AbelianVariety.metrizedHodgeLine_pullback`: A `K`-isogeny `φ : A → B` induces `φ^* : ω̄_{𝒜_B} → ω̄_{𝒜_A}` scaling norms by `deg(φ)^{1/2}` at every `σ`.
- `AbelianVariety.metrizedHodgeLine_norm_eq_volume`: `‖α‖²_σ` is the Faltings volume of `A_σ` for `α ∈ ω̄_{𝒜}`.

Module: `ω̄_G` is a projective `O_K`-module of rank one (the imported Hodge-line interface, NeronModelsAndSemistableAbelianVarieties §1.11); its generic fibre is `H⁰(A, Ω^g)`.

Metric: §2.1 at each `σ`; conjugation compatibility from §2.1's conjugation API.

Base change map: the Néron mapping property gives `𝒜 ⊗_{O_K} O_L → 𝒜_L` extending the identity; pulling back invariant differentials gives `ω̄_{𝒜_L} → ω̄_{𝒜} ⊗ O_L`, injective because it is the identity on generic fibres; the archimedean metrics are computed on the same complex abelian varieties.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2(a)–(b), p. 26; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, p. 354; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169; [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §1.1, p. 2 (arXiv v3); [Tsimerman](https://arxiv.org/abs/1506.01466v5), §2.1, p. 3 (arXiv v5).

*Needs:* the imported Hodge-line interface; §2.1; §1.1; **NeronModelsAndSemistableAbelianVarieties** §1.11 (`DifferentialLattice`); **NeronModelsAndSemistableAbelianVarieties** §1.1 (`NeronMappingProperty`); **NeronModelsAndSemistableAbelianVarieties** §1.7 (local existence); **NeronModelsAndSemistableAbelianVarieties** §1.9 (Dedekind gluing); **ComplexComparisonPartII** §§C−1.1, C0.4 and C5.1.

**Checks.**

- `AbelianVariety.metrizedHodgeLine_elliptic_Q`: For `E/ℚ` with Néron differential `ω_N` and period lattice `Λ, ω̄̂(E/ℚ) ≅ (ℤ, ‖1‖² = covol(Λ))`, so its degree is `−½ log covol(Λ)`.
- `AbelianVariety.metrizedHodgeLine_dim_zero`: For `g = 0, ω̄̂ = Ō_K`.
- `AbelianVariety.metrizedHodgeLine_model_nonexample`: For `E : y² + y = x³ (27.a3)` with Néron differential `ω_N = dx/(2y + 1)`, the non-minimal model `W² = X³ + 16 (X = 4x, W = 8y + 4)` has invariant differential `dX/(2W) = ω_N/2`; its lattice `ℤ·ω_N/2` contains `ℤ·ω_N` with index 2 and would raise the degree by `log 2`: the finite part must be the Néron lattice. This is a test of a wrong differential lattice from a singular non-minimal Weierstrass equation, not a second smooth semi-abelian model.
- `AbelianVariety.metrizedHodgeLine_product`: `ω̄̂(A × B) ≅ ω̄̂(A) ⊗ ω̄̂(B)` (§2.5).
- For `A = E` an elliptic curve over `ℚ` with Néron differential `ω_N, ω̄̂(E/ℚ) =` (`ℤ·ω_N, ‖ω_N‖² =` area of `ℂ/Λ_{ω_N}`); LMFDB's Faltings height of `11.a2` is `−½ log` of that area, `−0.30801`…

### 2.5 Products: the metrized Hodge line is multiplicative

For abelian varieties `A, B` over a number field `K`, the Néron model of `A × B` is `𝒜 ×_{O_K} ℬ` and `ω̄̂(A × B) ≅ ω̄̂(A) ⊗ ω̄̂(B)` isometrically; more generally for semi-abelian (or smooth) models `G, H, ω̄̂(G ×_{O_K} H) ≅ ω̄̂(G) ⊗ ω̄̂(H)`. Hence `deg^ ω̄̂(A × B) = deg^ ω̄̂(A) + deg^ ω̄̂(B)`, and for `n ≥ 1, deg^ ω̄̂(A^n) = n·deg^ ω̄̂(A)`.

`A, B` abelian varieties over `K`; the Néron mapping property is checked on smooth test schemes.

The product of Néron models has the Néron mapping property for `A × B`, since morphisms into a product are pairs.

The imported Hodge-line product comparison gives `ω̄_{G×H} ≅ ω̄_G ⊗ ω̄_H` at the module level.

Archimedean: for `α` on `A_σ` (dimension `g`) and `β` on `B_σ` (dimension `h`), reordering `α ∧ β ∧ ᾱ ∧ β̄` to `α ∧ ᾱ ∧ β ∧ β̄` costs `(−1)^{gh}`, and `i^{(g+h)²} = i^{g²}i^{h²}(−1)^{gh}`; the signs cancel and `2^{−g−h} = 2^{−g}2^{−h}`, so by Fubini `‖α ∧ β‖²_Fal = ‖α‖²_Fal‖β‖²_Fal` and the isomorphism is an isometry.

Degrees add by §1.5.

The source identifications are [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), §2.3, p. 7 (arXiv v1); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Remarque 1.22, p. 35.

*Needs:* §2.4; the imported Hodge-line interface; §1.5; **AbelianSchemesAndArithmeticModuli** §A1.1 (`relativeProductsAndDimension`); **NeronModelsAndSemistableAbelianVarieties** §1.1 (`NeronMappingProperty`); **NeronModelsAndSemistableAbelianVarieties** §1.7 (local existence); **NeronModelsAndSemistableAbelianVarieties** §1.9 (Dedekind gluing).

**Checks.**

- `h(E × E′) = h(E) + h(E′)`; `h(A^4 × (A^t)^4) = 4h(A) + 4h(A^t)`.

### 2.6 The Hodge lines of `A` and its dual

For a semi-abelian scheme `G` over a locally Noetherian normal base `S`, abelian on a dense open meeting every irreducible component, and its semi-abelian dual model `G^t`, use the natural generic Serre-duality identification to construct `p_G : ω̄_G ≅ ω̄_{G^t}`. It extends integrally and is an isometry for the Faltings metrics at every complex embedding. For an isogeny `α : G → G₁` between such models, with dual `α^t`, the maps satisfy `deg(α)·p_{G₁} = α^{t*} ∘ p_G ∘ α^*`. Consequently a semistable abelian variety and its dual have isometric Hodge lines and equal degrees. The squared-line theorem for arbitrary Néron models is stated and constructed in §4.3.

`S` locally Noetherian and normal; `G` and `G^t` semi-abelian and dual abelian schemes on a dense open meeting every component. The metric assertion applies to their complex fibres with the Faltings metrics. The arithmetic specialization is an abelian variety semistable over `O_K`.

Identify the lines on the abelian locus by Serre duality. Work affine-locally on `S`, component by component. Its codimension-one local rings are Noetherian normal local domains of dimension one, hence DVRs (Stacks, Tag `00PD`). After faithfully flat completion use the Raynaud extension and dual one-motive from **NeronModelsAndSemistableAbelianVarieties** §§3.13–3.14 to compare the lattices through their period pairing. This trait package includes residue characteristic zero. Faltings–Chai V, Lemma 3.4, p. 166 computes the order of the possible pole; comparison with multiplication by `n` forces this order to vanish. Apply the codimension-one extension criterion of **SchemeAndStackFoundations** §0.6 (Stacks, Tag `0AY7`) to the generic comparison and its inverse: line bundles are reflexive, so both extend and are inverse. Uniqueness on the dense open glues these local isomorphisms.

The same period pairing gives the isogeny identity `deg(α)·p_{G₁} = α^{t*}p_Gα^*`. Over `ℂ` the generic comparison is an isometry by the Riemann form and the covolume calculation.

At toric bad reduction the finite parts of the two kernels on identity components need not be Cartier dual. The semistable argument uses the integral comparison of Hodge lines; the Cartier-dual-kernel argument applies to abelian schemes with good reduction.

The source identifications are [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), §2.1, p. 206; Théorème 2.1.1 and Corollaire 2.1.3, p. 207; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Lemma 3.4, p. 166, and §4, p. 169; [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), §2.3, p. 7 (arXiv v1); [Stacks Project, Tag 00PD](https://stacks.math.columbia.edu/tag/00PD), cases (1) and (5), and [Tag 0AY7](https://stacks.math.columbia.edu/tag/0AY7).

*Needs:* §2.4; §2.3; **AbelianSchemesAndArithmeticModuli** §A2.2 (`normalizedPoincare`); **AbelianSchemesAndArithmeticModuli** §A3.5 (`dualIsogenyCartierKernel`); §2.0, applied on Noetherian affine opens; **SchemeAndStackFoundations** §0.6 (reflexive sheaves and the codimension-one extension criterion); **NeronModelsAndSemistableAbelianVarieties** §1.7 (local existence); **NeronModelsAndSemistableAbelianVarieties** §1.9 (Dedekind gluing); **NeronModelsAndSemistableAbelianVarieties** §§3.13–3.14 (`RaynaudExtensionComparison`, `RigidUniformisation`, `RaynaudOneMotive.dual` and `RaynaudOneMotive.polarized_positive`), for complete-trait degeneration data and the dual period pairing in every residue characteristic.

**Checks.**

- For an elliptic curve `E, A^t ≅ A` and the semistable isometry and the squared-line isometry of §4.3 are tautological; for a principally polarized `A` the canonical isomorphism `ω̄_A ≅ ω̄_{A^t}` is induced by the polarization.
- For the split Tate curve with `q = π⁵` over `ℂ((π))`, the trait package has `G = 𝔾_m, B = 0` and period pairing 5. Both integral Hodge lines are generated by `dt/t`; the comparison has order zero also in residue characteristic zero.
- At good reduction the period lattice `Y` is zero and the Raynaud extension is the abelian scheme itself. The integral comparison then is the Serre-duality comparison, without a toric contribution.
- For the compatible union `R = ⋃_{n≥1} ℂ[[t^(1/n!)]]` inside `⋃_{n≥1} ℂ((t^(1/n!)))`, the valuation group is `ℚ`. This rank-one valuation ring is normal and its maximal ideal has height one, but there is no least positive value and no uniformizer. It is not Noetherian and its height-one localization is not a DVR, so it lies outside the stated base hypotheses.

### 2.7 Normalisations of the Faltings metric and height

For an abelian variety `A` of dimension `g` over a number field and any model, the three metrics on the Hodge line satisfy `‖α‖²_Del = π^{−g}‖α‖²_Fal` and `‖α‖²_un = 2^g‖α‖²_Fal`, so the normalised degrees `h_• = deg^/[K:ℚ]` satisfy `h_Del = h_Fal + (g/2) log π` and `h_un = h_Fal − (g/2) log 2 = h_Del − (g/2) log(2π)`. Thus Yuan–Zhang's and Gaudron–Rémond's `h(A)` is `h_Del`; Faltings' original height (also Bilu–Parent–Rebolledo's `h_F`) is `h_Fal`; Tsimerman's and Andreatta–Goren–Howard–Madapusi Pera's `h_Falt`, Colmez's, and Faltings–Chai's modular height `h_mod` (whose squared norm is `i^{g²}∫ α ∧ ᾱ`, without `2^{−g}`) is `h_un`; in particular `h_YZ = h_AGHMP + (g/2) log(2π)`. More generally multiplying every squared norm by `c > 0` changes the normalised height by `−½ log c`, and the finite lattices are unchanged.

The same model and the same finite lattice are used on both sides; only the archimedean metrics differ.

Multiplying `‖·‖²_σ` by `c` at every `σ` subtracts `½ Σ_σ log c = ½[K:ℚ] log c` from `deg^` (§1.3's rescaling API).

Substitute `c = π^{−g}` (Deligne), `c = 2^g` (unscaled), `c = (2π)^{−g}·2^g` relative to unscaled.

The source identifications are [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), §2.3, Définition 2.1 and the following paragraph, pp. 6–7 (arXiv v1); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2(b), p. 26; [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §1.1, p. 2 and the remark on normalisation, p. 3 (arXiv v3); [Tsimerman](https://arxiv.org/abs/1506.01466v5), §2.1, p. 3 (arXiv v5); [Andreatta–Goren–Howard–Madapusi Pera](https://arxiv.org/abs/1508.00178v3), Definition 9.1.4 (arXiv v3); [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Definition 4.1, p. 167, and §4, p. 169.

*Needs:* §2.4; §1.3; §2.1.

**Checks.**

- For `g = 1: h_Del(E) = h_Fal(E) + ½ log π ≈ h_Fal + 0.5724`; Gaudron–Rémond state `h_F(A) = h(A) − (g/2) log π`.

### 2.8 The Faltings metric on families and on the Siegel space

Let `S` be a complex manifold and `A → S` a family of complex abelian varieties (proper smooth with abelian fibres) of dimension `g`. The Faltings metrics on the fibres define a smooth hermitian metric `‖·‖_Fal` on the Hodge line `ω̄_{A/S}`. On the Siegel family `X_τ = ℂ^g/(ℤ^g + τℤ^g)` over `ℍ_g` the global frame `e = dz₁ ∧ ⋯ ∧ dz_g` has `‖e‖²_Fal(τ) = det(Im τ)`, and under `γ = (A B; C D) ∈ Sp_{2g}(ℤ)` the frame transforms by `det(Cτ + D)^{−1}` while `det Im(γτ) = |det(Cτ + D)|^{−2} det Im τ`, so the metric descends to the Hodge line on `Γ\ℍ_g` and on the complex fibre of the fine moduli space `A_{g,n}(ℂ), n ≥ 3`. The metric is invariant under complex conjugation of the family.

`A → S` proper and smooth with abelian fibres (polarizable), `S` a complex manifold; `Γ ⊂ Sp_{2g}(ℤ)` the level subgroup.

Provide the following maps and identities.

- `AbelianFamily.faltingsMetric`: The smooth hermitian metric on `ω̄_{A/S}` given fibrewise by `faltingsNormSq`.
- `AbelianFamily.faltingsMetric_baseChange`: For `f : S′ → S, f^*‖·‖_Fal` is the Faltings metric of `A ×_S S′`.
- `SiegelFamily.faltingsMetric_frame`: `‖dz₁ ∧ ⋯ ∧ dz_g‖²(τ) = det Im τ`.
- `SiegelFamily.faltingsMetric_invariant`: `‖·‖_Fal` is `Sp_{2g}(ℤ)`-invariant on the Hodge line of the Siegel family.
- `AbelianFamily.faltingsMetric_conj`: Complex conjugation of the family is an isometry for `‖·‖_Fal`.

Smoothness: locally on `S` choose a holomorphic frame `α` of `ω̄`; `∫_{A_s} α ∧ ᾱ` is a fibre integral of a smooth form along a proper submersion, hence smooth in `s`.

Siegel family: §2.2 gives `‖e‖²(τ) = det Im τ`; the automorphy factor of `e` is A5's `det(Cτ + D)` convention, and `det Im(γτ) = |det(Cτ+D)|^{−2} det Im τ`.

Descent to the quotient follows because both sides transform by the same factor; at neat level `n ≥ 3` the quotient is the complex fibre of `A_{g,n}` (PELModuli §M3.9).

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.10, p. 31; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Definition 4.1, p. 167; [Yuan](https://arxiv.org/abs/2108.05625v4), §3.1.3, Lemma 3.4, pp. 43–44 (arXiv v4).

*Needs:* §2.1; §2.2; **AbelianSchemesAndArithmeticModuli** §A5.8 (`SiegelFamily`); **PELModuli** §M6.9 (`PELModuli.hodgeLine`); **PELModuli** §M3.9 (Siegel uniformization); **ComplexComparisonPartII** §§C−1.1, C0.4 and C5.1.

**Checks.**

- `SiegelFamily.faltingsMetric_g1`: For `g = 1` and `τ = i, ‖dz‖² = 1`; for `τ = 2i, ‖dz‖² = 2`.
- `SiegelFamily.faltingsMetric_modular_invariant`: For `f` of weight `12, |f(τ)|²(Im τ)^12` is `SL₂(ℤ)`-invariant. For `f = Δ` this is the square of the positive term `|Δ(τ)|(Im τ)^6` in §2.9, rather than that term itself.
- `SiegelFamily.faltingsMetric_holomorphic_nonexample`: The function `τ ↦ det(τ)` is not the norm of the frame: the norm must be real, positive and `Sp`-equivariant with the factor `|det(Cτ+D)|^{−2}`.
- `AbelianFamily.faltingsMetric_constant`: For a constant family `A × S → S` with a constant frame, the norm is constant.
- For `g = 1`, the Petersson-type metric `‖e‖² = Im τ` on weight-one forms; for a modular form `f` of weight `k, ‖f·e^{⊗k}‖² = |f(τ)|²(Im τ)^k` is `Γ`-invariant.

### 2.9 Elliptic curves: the Faltings height from the discriminant and the periods

Let `E` be an elliptic curve over a number field `K` with minimal discriminant ideal `Δ_{E/K}` (computed from the Néron model at every prime), and for `σ ∈ Σ_K` choose `τ_σ ∈ ℍ` with `E_σ(ℂ) ≅ ℂ/(ℤ + τ_σℤ)`. With Mathlib's modular discriminant `Δ(τ) = η(τ)^{24} = q∏_{n≥1}(1 − qⁿ)^{24}, q = e^{2πiτ}`, the Faltings-normalised degree of the metrized Hodge line satisfies `12·deg^ ω̄̂(E/K) = log N(Δ_{E/K}) − Σ_{σ∈Σ_K} log(|Δ(τ_σ)|·(Im τ_σ)^6) − 12[K:ℚ] log(2π)`. The archimedean term `|Δ(τ)|(Im τ)^6` is `SL₂(ℤ)`-invariant, so it does not depend on the choice of `τ_σ`.

`E/K` any elliptic curve (semistability not needed for this formula, which computes the Néron-model degree). `Δ(τ)` here is the normalised `q`-product, without the factor `(2π)^{12}`; the lattice discriminant `g_2³ − 27g_3²` of `ℤ + τℤ` is `(2π)^{12}Δ(τ)`.

Provide the following maps and identities.

- `EllipticCurve.faltingsArchimedeanTerm`: `τ ↦ |Δ(τ)|·(Im τ)^6` on `ℍ, SL₂(ℤ)`-invariant.
- `EllipticCurve.faltingsArchimedeanTerm_smul`: `faltingsArchimedeanTerm(γτ) = faltingsArchimedeanTerm(τ)` for `γ ∈ SL₂(ℤ)`.
- `EllipticCurve.faltingsHeight_formula`: `12[K:ℚ]·h_Fal(E/K) = log N(Δ_{E/K}) − Σ_σ log faltingsArchimedeanTerm(τ_σ) − 12[K:ℚ] log 2π`.
- `EllipticCurve.faltingsArchimedeanTerm_pos`: `faltingsArchimedeanTerm(τ) > 0` (`Δ` has no zeros on `ℍ`).

Choose a Weierstrass equation over `K` with invariant differential `ω` and discriminant `Δ_ω`, scaling `ω` by a nonzero element of `O_K` so that `ω` is a section of the Néron Hodge lattice. Such a scaling exists by clearing denominators; the corresponding equation remains defined over `K`. At each prime `𝔭, ω = u_𝔭 ω_min` with `Δ_ω = u_𝔭^{−12}Δ_min`, so `12·log #(ω̄_𝒜/O_K ω) = log N(Δ_{E/K}) − Σ_𝔭 v_𝔭(Δ_ω) log N𝔭 = log N(Δ_{E/K}) − log |N_{K/ℚ}(Δ_ω)|`.

At `σ`: the period lattice of `ω` is `Λ = ω₁(ℤ + τ_σℤ)`; by §2.2 `‖ω‖²_σ = |ω₁|² Im τ_σ`, and `σ(Δ_ω) = ω₁^{−12}(2π)^{12}Δ(τ_σ)` by homogeneity of the lattice discriminant; hence `|σΔ_ω|·‖ω‖_σ^{12} = (2π)^{12}|Δ(τ_σ)|(Im τ_σ)^6`.

Sum: `12 deg^ = 12 log #(ω̄/O_K ω) − 12 Σ_σ log ‖ω‖_σ`, and `Σ_σ log|σΔ_ω| = log|N Δ_ω|` cancels.

`SL₂(ℤ)`-invariance from `Δ(γτ) = (cτ + d)^{12}Δ(τ) (ModularForm.discriminant_S_invariant, discriminant_T_invariant)` and `Im(γτ) = Im τ/|cτ + d|²`.

The source identifications are [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), §7.6, proof of Lemme 7.9, p. 33 (arXiv v1); [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Exemple 1.4, p. 28; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, p. 354.

*Needs:* §2.4; §2.2; §1.3; Mathlib `ModularForm.discriminant`; Mathlib `ModularForm.discriminant_eq_q_prod`; Mathlib `UpperHalfPlane`; **EllipticCurves**, Layer 4.5a (minimal discriminants).

**Checks.**

- `EllipticCurve.faltingsHeight_11a2`: For `11.a2` over `ℚ` the formula evaluates to `−0.3080098`… (agreeing with LMFDB to 10 digits). The reference values `Δ_min=−11⁵, j=−122023936/161051` and `h_Fal=−0.308009841118403`… are recorded on [LMFDB 11.a2](https://www.lmfdb.org/EllipticCurve/Q/11/a/2). A period ratio `τ≈½+1.1493901061232523i` reproduces that height.
- `EllipticCurve.faltingsArchimedeanTerm_S`: `faltingsArchimedeanTerm(−1/τ) = faltingsArchimedeanTerm(τ)`.
- `EllipticCurve.faltingsHeight_lattice_disc_nonexample`: Using the lattice discriminant `(2π)^{12}Δ(τ)` together with the `−12 log 2π` term double-counts `2π`: the two normalisations differ by exactly `12 log 2π`.
- `EllipticCurve.faltingsHeight_basechange`: For `E` with semistable reduction over `K` and `L/K` finite, both sides scale by `[L:K]`.
- For `E = 11.a2` over `ℚ (Δ_min = −11⁵, τ ≈ ½ + 1.14939i)` the formula gives `h_Fal(E) = deg^/1 ≈ −0.3080098`, LMFDB's value of the Faltings height; in Deligne's normalisation add `½ log π`.

### 2.10 The hermitian pairing of `Ω(A)` with `Ω(A^t)`

Let `A` be a complex abelian variety with dual `A^t`, uniformized as `A^t(ℂ) = H¹(A, O_A)/H¹(A, 2πiℤ)`. The canonical isomorphisms `Ω(A^t)^∨ = Lie(A^t) ≅ H¹(A, O_A) ≅ H^{0,1}(A) = Ω̄(A)` give a perfect hermitian pairing `Ω(A) × Ω(A^t) → ℂ`, functorial in the sense `(φ^*α, β) = (α, (φ^t)^*β)` for `φ : B → A`. Its determinant metrizes `ω̄(A) ⊗ ω̄(A^t)`, and for `α ∈ det Ω(A), β ∈ det Ω(A^t), ‖α‖²·‖β‖² = ‖α ⊗ β‖²`, where `‖·‖` on `ω̄(A)` and `ω̄(A^t)` is Yuan–Zhang's `(2π)^{−g}|∫ α ∧ ᾱ|` (equivalently Deligne's).

The dual is normalized with the lattice `H¹(A, 2πiℤ)`; with `H¹(A, ℤ)` the identity acquires the factor `(2π)^{2g}`. The uniformization of `A^t` is Appell–Humbert's description of `Pic⁰(A)` as the conjugate-linear dual of `V` modulo the dual lattice (AbelianSchemesAndArithmeticModuli A5), rewritten through `H¹(A, O_A) ≅ Ω̄(A)` and `H₁ = Λ, H¹ = Λ^*` (A5.7 `realizationConventions`).

Sum the pairing and its conjugate to a perfect pairing `H¹(A, ℂ) ⊗ H¹(A^t, ℂ) → ℂ`, dual to `H₁(A, ℤ) ⊗ H₁(A^t, ℤ) → 2πiℤ`.

Taking determinants and the Hodge decomposition gives an isomorphism `ω(A) ⊗ ω̄(A) ⊗ ω(A^t) ⊗ ω̄(A^t) ≅ ℂ` dual to `det H_{2g}(A, ℤ) ⊗ det H_{2g}(A^t, ℤ) → (2πi)^{2g}ℤ`.

Evaluate on generators `e_A, e_{A^t}` with `(e_A, e_{A^t}) = (2πi)^{2g}`: the `(2π)^{−2g}` factors of the two norms combine to `‖α ⊗ β‖²`.

The source identifications are [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §2.1, Lemma 2.1 and the preceding construction, pp. 11–12 (arXiv v3).

*Needs:* §2.1; §2.7; **AbelianSchemesAndArithmeticModuli** §A5.1 (`AbelianLattice`); **AbelianSchemesAndArithmeticModuli** §A5.3 (`appellHumbert`); **AbelianSchemesAndArithmeticModuli** §A5.7 (`realizationConventions`); **AbelianSchemesAndArithmeticModuli** §A2.2 (`normalizedPoincare`).

**Checks.**

- For an elliptic curve `E = A = A^t` with the canonical principal polarization, `‖α‖⁴ = ‖α ⊗ α‖²` for the self-pairing.
- On `E=ℂ/(ℤ+iℤ)`, the Deligne squared norm of `dz` is `1/π`; hence `‖dz⊗dz‖²=1/π²`. Substituting the Faltings squared norm 1 would lose the two factors of `π`.
- Choose dual frames `α,β` with `(α,β)=1`. With the conjugate-linear first-argument convention, `(iα,β)=−i` and `(α,iβ)=i`; a complex bilinear evaluation would fail the first equality.
- In dimension zero both determinant lines are the unit line, and the empty determinant pairing has norm 1, rather than 0.

### Examples

For `ℂ/(ℤ+iℤ), ‖dz‖²=1`; for `ℂ/(ℤ+2iℤ)`, it is 2. On a product the norm of `dz₁∧dz₂` is the product norm and the positive coefficient is `i⁴/4`. For `E=11.a2` the minimal discriminant is `−11⁵` and the covolume formula gives `h_Fal≈−0.30801`; the period formula uses Mathlib `Δ` with the separate `−log(2π)` term. For `27.a3` the non-minimal equation `W²=X³+16` gives `ω_N/2` and the wrong degree shifts by `log 2`.

### Dependencies

Layer 1; AbelianSchemesAndArithmeticModuli A1–A6; NeronModelsAndSemistableAbelianVarieties §§1.1–1.11; DifferentialGeometry; Tau Ceti’s Gram/covolume theorem; ComplexComparisonPartII §§C−1.1, C0.4 and C5.1; PELModuli §§M3.9 and M6.3–M6.10; §2.0; EllipticCurves 4.5a; Mathlib modular discriminant and covolume.

## Layer 3: Relative and stable Faltings heights

The Néron Hodge lattice defines the relative height. The inclusion between differential lattices under finite extension measures the loss in height. Semistability makes this inclusion an isomorphism and thereby defines a geometric stable height.

### 3.1 The Faltings height of an abelian variety over a number field

For an abelian variety `A` of dimension `g` over a number field `K` with Néron model `𝒜` over `O_K`, the (relative, Faltings-normalised) Faltings height is `h(A/K) = deg^ ω̄̂(A/K)/[K:ℚ]`, the normalised Arakelov degree of the metrized Hodge line. For a smooth model `G` over `O_K` with generic fibre `A` (for instance a semi-abelian model) put `h(G) = deg^ ω̄̂(G)/[K:ℚ]`. Concretely, for any nonzero `α ∈ ω̄_𝒜, h(A/K) = (1/[K:ℚ])·(log #(ω̄_𝒜/O_K α) − ½ Σ_{σ∈Σ_K} log(2^{−g}|∫_{A_σ(ℂ)} α ∧ ᾱ|))`. Other normalisations are obtained by §2.7.

`A` an abelian variety over a number field `K`; `𝒜` its Néron model; `g = dim A ≥ 0`.

Provide the following maps and identities.

- `AbelianVariety.faltingsHeight`: `h(A/K) = deg^ ω̄̂(A/K)/[K:ℚ]` in the Faltings normalisation.
- `GroupScheme.faltingsHeight`: `h(G)` for a smooth model with abelian generic fibre.
- `AbelianVariety.faltingsHeight_eq`: `h(A/K) = (log #(ω̄_𝒜/O_K α) − ½ Σ_σ log ‖α‖²_{σ,Fal})/[K:ℚ]` for any `α ≠ 0`.
- `AbelianVariety.faltingsHeight_congr`: `A ≅ B` over `K` implies `h(A/K) = h(B/K)`.
- `AbelianVariety.faltingsHeight_rescale`: Replacing the squared metric by `c·‖·‖²` changes `h` by `−½ log c` (Deligne: `+(g/2) log π`; unscaled: `−(g/2) log 2`).
- `AbelianVariety.faltingsHeight_prod`: `h((A × B)/K) = h(A/K) + h(B/K)`.

Apply §1.3 to the hermitian line bundle of §2.4; the explicit formula is the definition with the Faltings norm of §2.1.

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, p. 354; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2, p. 27; [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §1.1, p. 2 (arXiv v3); [Tsimerman](https://arxiv.org/abs/1506.01466v5), §2.1, p. 3 (arXiv v5); [Andreatta–Goren–Howard–Madapusi Pera](https://arxiv.org/abs/1508.00178v3), Definition 9.1.4 (arXiv v3); [Yuan](https://arxiv.org/abs/2108.05625v4), §4.3.1, pp. 70–72 (arXiv v4).

*Needs:* §2.4; §1.3; §1.4.

**Checks.**

- `AbelianVariety.faltingsHeight_11a2`: For `E = 11.a2` over `ℚ` (semistable), `h(E/ℚ) ≈ −0.3080098`.
- `AbelianVariety.faltingsHeight_dim_zero`: For `g = 0, h = 0`.
- `AbelianVariety.faltingsHeight_model_nonexample`: For `E : y² + y = x³ (27.a3)`, computing with the lattice `ℤ·dX/(2W)` of the non-minimal model `W² = X³ + 16` instead of the Néron lattice gives `h(E/ℚ) + log 2`: the Néron model is essential.
- `AbelianVariety.faltingsHeight_normalization`: For `E/ℚ, h_Del(E) = h(E/ℚ) + ½ log π`.
- `h(A/K)` does not depend on `α` (§1.4) and is unchanged under `K`-isomorphism of `A`.

### 3.2 The Faltings height is an invariant of the abelian variety

(a) If `A` has semistable reduction everywhere and `G` is any semi-abelian scheme over `O_K` with generic fibre `A`, then `G ≅ 𝒜⁰` canonically, so `h(G) = h(A/K)`. (b) `h(A/K)` depends only on the `K`-isomorphism class of `A`; in particular it does not depend on a polarization: for a polarized `(A, λ)` one sets `h(A, λ) := h(A/K)`. (c) The value does not depend on the nonzero section `α` of `ω̄_𝒜` used to compute it.

`A` over a number field `K`; in (a) semistable reduction at every prime.

(a) A semi-abelian model is unique up to unique isomorphism (homomorphisms of semi-abelian schemes over the normal base `Spec O_K` extend uniquely from the generic fibre, §2.0); the identity component of the Néron model of a semistable `A` is semi-abelian (NeronModelsAndSemistableAbelianVarieties §3.1) and so is that model.

(b) Néron models are functorial for `K`-isomorphisms (Néron mapping property), and §2.4 has an isometry for each isomorphism; nothing in the construction uses a polarization.

(c) §1.4.

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §2, Lemma 1, p. 350, and §3, p. 354; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169.

*Needs:* §3.1; §2.4; §2.0; **NeronModelsAndSemistableAbelianVarieties** §1.1 (`NeronMappingProperty`); **NeronModelsAndSemistableAbelianVarieties** §1.7 (local existence); **NeronModelsAndSemistableAbelianVarieties** §1.9 (Dedekind gluing); **NeronModelsAndSemistableAbelianVarieties** §3.1 and §3.10 (`SemistableReduction`); §1.4.

**Checks.**

- Two different principal polarizations on `E × E` give the same height; Faltings–Chai note the modular height does not depend on the choice of polarization.

### 3.3 Faltings height under finite extension and the bad-place correction

Let `A/K` be an abelian variety and `L/K` a finite extension. The Néron mapping property gives an injection of `O_L`-lattices `ω̄_{𝒜_L}` ↪ `ω̄_𝒜 ⊗_{O_K} O_L` inside `ω̄(A_L)`, an isometry at every complex embedding. Hence `h(A_L/L) = h(A/K) − c(A, L/K)` with `c(A, L/K) = log #((ω̄_𝒜 ⊗ O_L)/ω̄_{𝒜_L})/[L:ℚ] ≥ 0`. The correction is a sum of local terms supported at the primes of `L` over which `A` does not have semistable reduction over `K`; it vanishes if `A` has semistable reduction over `K`, so then `h(A_L/L) = h(A/K)`.

`A/K` abelian, `L/K` finite; `𝒜, 𝒜_L` the Néron models over `O_K` and `O_L`.

The Néron mapping property for `𝒜_L` applied to the smooth `O_L`-scheme `𝒜 ⊗ O_L` gives a morphism `𝒜 ⊗ O_L → 𝒜_L` extending the identity; pulling back invariant differentials gives `ω̄_{𝒜_L} → ω̄_𝒜 ⊗ O_L`, injective as it is the identity on generic fibres.

Metrics agree (§2.4). By §1.6 and §1.5, `deg^ ω̄_{𝒜_L} = [L:K] deg^ ω̄_𝒜 − log #`(quotient); divide by `[L:ℚ]`.

Locality: at primes of semistable reduction `𝒜⁰ ⊗ O_{L,w} → 𝒜_L⁰` is an isomorphism (NeronModelsAndSemistableAbelianVarieties §3.3), so the local quotient vanishes; `ω̄` only depends on identity components.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2 (Remarque), p. 27; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169; [Tsimerman](https://arxiv.org/abs/1506.01466v5), §2.1, p. 3 (arXiv v5).

*Needs:* §3.1; §2.4; §1.6; §1.5; **NeronModelsAndSemistableAbelianVarieties** §1.1 (`NeronMappingProperty`); **NeronModelsAndSemistableAbelianVarieties** §1.7 (local existence); **NeronModelsAndSemistableAbelianVarieties** §1.9 (Dedekind gluing); **NeronModelsAndSemistableAbelianVarieties** §3.3 (`SemistableIdentityBasechange`).

**Checks.**

- For `E : y² + y = x³ (27.a3)`, additive at `3, h(E_L/L) < h(E/ℚ)` for `L/ℚ` over which `E` acquires good reduction, the difference being a positive integer multiple of `(log 3)/[L:ℚ]`.

### 3.4 The stable Faltings height

For an abelian variety `A` over a number field `K` choose a finite extension `L/K` over which `A` has semistable reduction at every prime (one exists: `L = K(A[12])` works, since full level 3 forces semistability away from 3 and full level 4 away from 2). The stable Faltings height is `h_st(A) := h(A_L/L)`. It does not depend on `L`, is unchanged under base change to any finite extension of `K`, and depends only on `A ⊗_K ℚ̄`; hence `h_st` is a function on isomorphism classes of abelian varieties over `ℚ̄` (each defined over some number field).

`A` over a number field; semistable reduction is that of NeronModelsAndSemistableAbelianVarieties §§3.1–3.12.

Provide the following maps and identities.

- `AbelianVariety.stableFaltingsHeight`: `h_st(A) = h(A_L/L)` for any `L` over which `A` is everywhere semistable.
- `AbelianVariety.stableFaltingsHeight_eq_of_semistable`: `h_st(A) = h(A/K)` if `A` is semistable over `K`.
- `AbelianVariety.stableFaltingsHeight_baseChange`: `h_st(A_L) = h_st(A)` for `L/K` finite.
- `AbelianVariety.stableFaltingsHeight_le`: `h_st(A) ≤ h(A/K)`.
- `AbelianVariety.stableFaltingsHeight_congr_geometric`: `A ⊗ ℚ̄ ≅ B ⊗ ℚ̄ ⇒ h_st(A) = h_st(B)`.
- `AbelianVariety.stableFaltingsHeight_twelve`: `h_st(A) = h(A_{K(A[12])}/K(A[12]))`.

Existence of `L`: NeronModelsAndSemistableAbelianVarieties §3.12 applied to `A[3]` (primes not above 3) and to `A[4]` (primes not above 2) shows `A_{K(A[12])}` is semistable everywhere.

Independence: for `L, L′` both semistable, compare through LL′ with §3.3 (equality in the semistable case).

Geometric invariance: if `A ⊗ ℚ̄ ≅ B ⊗ ℚ̄`, the isomorphism is defined over a finite extension `M` where both are semistable; then `h(A_M) = h(B_M)`.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.2 (Remarque), p. 27; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169; [Tsimerman](https://arxiv.org/abs/1506.01466v5), §2.1, p. 3 (arXiv v5); [Yuan](https://arxiv.org/abs/2108.05625v4), §4.3.1, pp. 70–72 (arXiv v4).

*Needs:* §3.1; §3.3; **NeronModelsAndSemistableAbelianVarieties** §3.12 (`FiniteTorsionSemistability`).

**Checks.**

- `AbelianVariety.stableFaltingsHeight_11a2`: `h_st(11.a2) = h(11.a2/ℚ) ≈ −0.3080098` (semistable over `ℚ`).
- `AbelianVariety.stableFaltingsHeight_twist`: A quadratic twist `E^d` of `E` over `K` has `h_st(E^d) = h_st(E)`, although `h(E^d/K)` and `h(E/K)` may differ.
- `AbelianVariety.stableFaltingsHeight_relative_nonexample`: For `27.a3` over `ℚ, h(E/ℚ) > h_st(E)`: the relative height of a non-semistable curve is not the stable height.
- `AbelianVariety.stableFaltingsHeight_dim_zero`: `h_st` of the zero abelian variety is 0.
- `h_st(A) = h(A/K)` when `A` is semistable over `K` (`e.g`. `11.a2`); `h_st` of a CM elliptic curve with `j = 0` is the minimum of `h_st` over elliptic curves (Deligne, Remarque 1.5).

### 3.5 Products, duals and powers for the stable height

For abelian varieties `A, B` over `ℚ̄: h_st(A × B) = h_st(A) + h_st(B)`; `h_st(A^n) = n·h_st(A)`; `h_st(A^t) = h_st(A)`; `h_st(A^4 × (A^t)^4) = 8·h_st(A)`. For `A` semistable over a number field `K, h(A/K)=h(A^t/K)`. The general relative duality identity without semistability is proved in §4.3.

The stable identities hold for all abelian varieties; the relative duality identity here assumes semistability over `K`.

Choose `L` over which `A` and `B` (and `A^t`) are semistable; Néron models of products are products (§2.5), giving additivity and powers.

Duality over the chosen semistable `L` follows from §2.6: `deĝ ω̄̂(A_L/L)=deĝ ω̄̂(A_L^t/L)`. This proves the stable identity without using the later arbitrary-reduction theorem.

Combine for `A^4 × (A^t)^4`.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Remarque 1.22, p. 35; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169; [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), Corollaire 2.1.3, p. 207; [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), §2.3, p. 7 (arXiv v1).

*Needs:* §3.4; §2.5; §2.6; §1.5.

**Checks.**

- `h_st(E^2) = 2h_st(E)` for an elliptic curve; Deligne's Remarque 1.22 uses `h(A × B) = h(A) + h(B)` and `h(A) = h(A*)` to reduce lower bounds to principal polarizations.

### 3.6 Each non-semistable prime contributes at least `(log p)/[K′:ℚ]`

Let `A` be an abelian variety of dimension `g` over a number field `K` and `K′ = K(A[15])`, so that `[K′:K] ≤ #GL_{2g}(ℤ/15ℤ)` and `A_{K′}` has semistable reduction everywhere (full level 3 and 5). Then `h(A/K) − h_st(A) = c(A, K′/K) ≥ Σ_p (log p)/[K′:ℚ]`, the sum over the distinct residue characteristics `p` of primes of `K` at which `A` does not have semistable reduction. Consequently, if `c ∈ ℝ` is a lower bound for `h_st` on a class `𝒞` of abelian varieties of dimension `g` over `K`, every `A ∈ 𝒞` with `h(A/K) ≤ t` has semistable reduction at every prime whose residue characteristic `p` satisfies `log p > [K′:ℚ](t − c)`; as `[K′:ℚ] ≤ [K:ℚ]·#GL_{2g}(ℤ/15ℤ)`, the remaining primes form a finite set depending only on `(K, g, t, c)`. The lower bound `c = c(g)` for all abelian varieties of dimension `g` is Layer 6/§6.5, and the resulting finite set containing all non-semistable primes is exported in Layer 6/§6.6 `(c)`.

`A` over `K`; the consequence is stated for an arbitrary lower bound `c` on `h_st`, so this result does not depend on Layer 6.

Semistability over `K′`: NeronModelsAndSemistableAbelianVarieties §3.12 with `N = 3` and `N = 5`.

Prove `NeronDifferentials.baseChange_determinant_nonunit`: for a finite extension `R → R′` of complete mixed-characteristic DVRs with finite residue fields, an abelian variety `A` over `Frac(R)` that is non-semistable over `R` and semistable over `R′` has a non-unit determinant for `Lie(𝒜)⊗R′ → Lie(𝒜′)`. Both `Lie` modules have rank `dim A` and the map is the generic identity. If its determinant were a unit, the smooth-group differential criterion would make the comparison étale near the unit. Translation and the separated birational étale comparison then identify the identity model with the semi-abelian identity model after extension, forcing the original identity fibre to be semi-abelian by descent. This contradicts non-semistability. The Néron existence, base-change map and identity-model comparison come from **NeronModelsAndSemistableAbelianVarieties** §§1.3, 1.11 and 3.3; this strictness implication is the extra local theorem required here (Deligne, proof of Lemme 1.23, p. 35). Thus the local differential-lattice quotient is nonzero, with cardinality at least `Nw ≥ p`. Non-isomorphism of the group schemes alone does not imply this `Lie` assertion.

Hence `c(A, K′/K) ≥ (log p)/[K′:ℚ]` for each such `p`.

Consequence: `h_st(A) ≥ c` gives `(log p)/[K′:ℚ] ≤ h(A/K) − h_st(A) ≤ t − c`, bounding `p`.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Lemme 1.23 and its proof, p. 35.

*Needs:* §3.3; §3.4; **NeronModelsAndSemistableAbelianVarieties** §3.12 (`FiniteTorsionSemistability`); **NeronModelsAndSemistableAbelianVarieties** §3.1 and §3.10 (`SemistableReduction`); **NeronModelsAndSemistableAbelianVarieties** §§3.1–3.12.

**Checks.**

- For `27.a3` over `ℚ, h(E/ℚ) − h_st(E) ≥ (log 3)/[ℚ(E[15]):ℚ]`.

### Examples

For a semistable elliptic curve, the relative and stable heights agree, and passing to `ℚ(i)` doubles the unnormalized degree while preserving the height. Quadratic twists have the same stable height but can have different relative heights at their additive primes. For `27.a3` the correction is positive at residue characteristic 3 and is at least `log 3` divided by the semistability field’s absolute degree.

### Dependencies

Layers 1–2; NeronModelsAndSemistableAbelianVarieties §§1.1–1.11 and 3.1–3.12; §2.0. The non-semistable-prime consequence is first proved for an arbitrary supplied lower bound `c`, so it has no forward dependency on Layer 6.

## Layer 4: Isogenies, differents and component heights

For an isogeny, the determinant of its `Lie` map supplies the finite correction and the covering degree supplies the archimedean correction. The dual-different identity yields bounds and squared-line duality without semistability. The last topics apply the pairing to `O_E`-eigenquotients with an explicit integral determinant convention.

### 4.1 The different of an isogeny of Néron models

Let `u_K : A → B` be an isogeny of abelian varieties over a number field `K`, of degree `d`, and `u : 𝒜 → ℬ` its extension to Néron models over `O_K` (Néron mapping property). Then `Lie(u) : Lie(𝒜) → Lie(ℬ)` is injective and `u^* : ω̄_ℬ → ω̄_𝒜` is an injection of invertible `O_K`-modules; its cokernel is an invertible-module twist of `O_K/𝔡_u` for a unique nonzero ideal `𝔡_u`, the different of `u`, generated locally by `det Lie(u)` in bases. `𝔡_u` is supported at the primes where `u` is not étale, hence at primes dividing `d`. If `u` restricted to identity components is surjective (fppf), with kernel `ℳ`, then `ω̄_𝒜 ⊗ ω̄_ℬ^{−1}` is the pullback along the unit section of the relative dualizing sheaf of `ℳ`; when the finite part `M` of the quasi-finite flat `ℳ` is finite flat (in particular when `A` is semistable, by the semi-abelian kernel computation), `𝔡_u` is the classical different of the finite `O_K`-algebra of `M` and `#(O_K/𝔡_u) = #e^*Ω¹_{M/O_K}`. The determinant-line cokernel has annihilator equal to its zeroth Fitting ideal. For the full `Lie`-module cokernel use the zeroth Fitting ideal; its annihilator can differ when `g > 1`. Locally the kernel comparison is an equality of determinant differents at the unit section; it is not an assertion that the determinant-line ideal is a global generator of the different ideal in the finite algebra.

`u_K` an isogeny over `K`; Néron models over the Dedekind base `O_K` (NeronModelsAndSemistableAbelianVarieties §§1.1–1.11). The comparison with `e^*Ω¹` of the kernel needs the kernel to be flat; for non-semistable `A` multiplication by `p` need not even be flat on Néron models.

Provide the following maps and identities.

- `Isogeny.different`: `𝔡_u ⊆ O_K`, the Fitting ideal of `coker(u^* : ω̄_ℬ → ω̄_𝒜)`.
- `Isogeny.different_ne_bot`: `𝔡_u ≠ 0`.
- `Isogeny.different_eq_top_of_etale`: `𝔡_u = O_K` at primes where `u` is étale; in particular at primes not dividing `deg u`.
- `Isogeny.different_comp`: `𝔡_{v∘u} = 𝔡_u·𝔡_v`.
- `Isogeny.card_quotient_different`: `#(O_K/𝔡_u) = #(ω̄_𝒜/u^*ω̄_ℬ)`.
- `Isogeny.different_eq_kernel_differentials`: If `u` is flat on identity components with finite flat kernel `𝒢, #(O_K/𝔡_u) = #e^*Ω¹_{𝒢/O_K}`.

`u_K` étale on the generic fibre, so `Lie(u)` is injective and `ω̄_ℬ → ω̄_𝒜` is injective; define `𝔡_u` as the annihilator (equivalently Fitting ideal) of the cokernel; locally it is generated by `det Lie(u)`.

Where `u` is étale on identity components the cokernel vanishes; `u` is étale at primes not dividing `d`.

Semistable case: the isogeny extends to the semi-abelian identity components (homomorphism extension over the normal base `O_K`); it is quasi-finite (fibrewise an isogeny of semi-abelian varieties) between schemes smooth over the regular base, hence flat by the fibrewise flatness criterion, with quasi-finite flat kernel (Faltings §4, p. 357).

In the flat case, `ω_ℳ := e^*`(relative dualizing sheaf) of the lci kernel computes `ω̄_𝒜 ⊗ ω̄_ℬ^{−1}`; localizing and completing at each prime `𝔭` of `O_K`, the Fitting ideal of `e^*Ω¹` of the finite part is the different of its algebra (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.17 at primes of mixed characteristic; at primes not dividing `d` the kernel is étale and contributes nothing).

The source identifications are [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), §1.3, pp. 202–204; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §4, p. 357; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §2.2, p. 36.

*Needs:* the imported Hodge-line interface; §2.4; **NeronModelsAndSemistableAbelianVarieties** §1.1 (`NeronMappingProperty`); **NeronModelsAndSemistableAbelianVarieties** §1.7 (local existence); **NeronModelsAndSemistableAbelianVarieties** §1.9 (Dedekind gluing); **AbelianSchemesAndArithmeticModuli** §A3.1 (`IsAbelianIsogeny`); **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.17 (`invariantDifferentialsAndAbsoluteDifferent`); §2.0.

**Checks.**

- `Isogeny.different_mul_n`: For `[n], n ∈ ℤ ∖ {0}`, on a `g`-dimensional abelian scheme, the different is `(n^g)`, and its norm is `|n|^{g[K:ℚ]}`. For `g > 1` the annihilator of the full `Lie` cokernel is `(n)`, which detects the need for its Fitting ideal.
- `Isogeny.different_id`: `𝔡_{id} = O_K`.
- `Isogeny.different_mu_p`: For `E` over `ℤ_p` with a subgroup scheme `μ_p` (ordinary, multiplicative kernel) the quotient isogeny has different `(p)` at `p`, while the étale-kernel quotient `(ℤ/p)` has different `(1)`.
- `Isogeny.different_nonflat_nonexample`: For an elliptic curve whose identity special fibre at `p` is additive, `[p]` has a positive-dimensional kernel on that fibre and is not flat as an isogeny of models. The finite-flat-kernel comparison cannot replace the determinant of its `Lie` map.
- For `[n]` with `n ≠ 0` on an abelian scheme of relative dimension `g` over `O_K, 𝔡_{[n]} = (n^g)` and `#(O_K/𝔡) = |n|^{g[K:ℚ]}`; for an étale isogeny `𝔡_u = O_K`.

### 4.2 Faltings' isogeny formula

Let `u_K : A → B` be an isogeny of degree `d` of abelian varieties over a number field `K`. Then `h(B/K) = h(A/K) + ½ log d − (1/[K:ℚ]) log #(O_K/𝔡_u)`. If `A` (equivalently `B`) has semistable reduction, `u` extends to semi-abelian models with quasi-finite flat kernel `𝒢` and `h(B/K) = h(A/K) + ½ log d − (1/[K:ℚ]) log #e^*Ω¹_{𝒢/O_K}`; the same formula holds for the stable heights `h_st` after any extension making `A` semistable.

`u_K` an isogeny over `K` of degree `d`; heights in Faltings' normalisation (the formula is normalisation-independent since both sides shift by the same constant).

The section 1 of `ω̄_𝒜 ⊗ ω̄_ℬ^{−1}` given by `u^*` has finite part `log #(O_K/𝔡_u)` (§4.1).

At each complex embedding its norm is `d^{1/2}` (§2.3), contributing `−½[K:ℚ] log d`.

So `deg^ ω̄̂(A) − deg^ ω̄̂(B) = −½[K:ℚ] log d + log #(O_K/𝔡_u)` (§1.5); divide by `[K:ℚ]`.

Semistable case: §4.1 identifies the finite term with the kernel's differentials; semistability is preserved by isogeny (NeronModelsAndSemistableAbelianVarieties §3.2).

The source identifications are [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), Proposition 1.4.1, pp. 204–205; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §4, Lemma 5, p. 358; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §2.1, (2.1.1), p. 36.

*Needs:* §4.1; §2.3; §2.4; §3.1; §1.5; **NeronModelsAndSemistableAbelianVarieties** §3.2 (`SemistabilityIsogeny`).

**Checks.**

- Multiplication by `n ≠ 0: d = |n|^{2g}, #(O_K/𝔡) = |n|^{g[K:ℚ]}`, so `h(A) = h(A) + g log |n| − g log |n|`, consistent; an étale isogeny of degree `d` raises the height by `½ log d`.

### 4.3 Dual differents and the squared Hodge-line theorem

For an isogeny `u_K : A → B` of degree `d` over a number field `K` with dual `u_K^t : B^t → A^t`, extended to Néron models, the differents satisfy `𝔡_u·𝔡_{u^t} = (d)`. Consequently `log #(O_K/𝔡_u) + log #(O_K/𝔡_{u^t}) = [K:ℚ] log d`, and `h(B) − h(A) = h(B^t) − h(A^t)`: the oriented height changes along `u : A → B` and along `u^t : B^t → A^t` are opposite, consistently with `h(A^t) = h(A)` and `h(B^t) = h(B)`. In the good-reduction case this is the local identity `length ω_𝒢 + length ω_{𝒢^D} = v(#𝒢)` for a finite flat group `𝒢` and its Cartier dual over a complete DVR of mixed characteristic with finite residue field, the kernel of `u^t` being the Cartier dual of the kernel of `u`. For every abelian variety over `K`, the natural squared Hodge-line comparison `ω̄_A^(⊗2) ≅ ω̄_(A^t)^(⊗2)` extends to an integral isometry on the Néron Hodge lattices, using a polarization to construct the isometry. Hence `h(A^t/K)=h(A/K)` without a semistability assumption.

Néron models over `O_K`; no semistability assumption.

Prove the local milestone `Isogeny.cartierDual_length`: for a finite flat commutative group `𝒢` of `rank d` over a complete mixed-characteristic DVR `R` with finite residue field, `length_R ω_𝒢 + length_R ω_(𝒢^D) = v_R(d)`. There is no ramification bound and no restriction to groups killed by `p`. Use `invariantDifferentialsAndAbsoluteDifferent` from **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.17 to express the two lengths as valuations of absolute differents, then the duality of the Hopf algebras and their trace lattices to identify their product with (d) (Raynaud, Théorème 2.1.1 and Remarque 2.1.2, p. 207). At a good-reduction prime the kernels of `u` and `u^t` are these Cartier-dual finite flat groups, so this milestone gives `v(𝔡_u)+v(𝔡_{u^t})=v(d)`. The tame statement for `p`-torsion with `e ≤ p−1` alone does not cover this use.

For semistable models, apply §2.6 to `u`: the identity `deg(u) p_B = u^{t*}p_Au^*` gives the equality of determinant ideals directly, including toric reduction.

For arbitrary reduction over number fields, take the local abelian-variety pairing and the mutually dual isogeny sequences from **ArithmeticGaloisDuality** §D7.6, with the topology and normalization in the supplier contract above. For `F` a finite extension of `ℚ_p, M = ker(u)` and every finite unramified extension `F_r/F`, specialize these supplied sequences to obtain `Isogeny.localKummer_exact`: `0 → coker(A(F_r) → B(F_r)) → H¹(F_r,M) → Hom(coker(B^t(F_r) → A^t(F_r)), ℚ/ℤ) → 0`. The right map is restriction under the supplied pairing; its exactness is the supplied adjunction of Kummer maps. Both cokernels are finite, so their continuous and abstract character groups coincide. This corollary applies to every isogeny over `F`, including degree divisible by `p` (Raynaud §2.3 and Remark 2.4.1, pp. 211–212).

Let `q` be the residue cardinality of `F` and `v_F` its integral valuation. Prove `log_q #coker(u(F_r)) = r v_F(𝔡_u) + O(1)`, with the constant independent of `r`, by comparing the analytic `Lie` filtrations of Néron models and their finite component groups. Finite-module Tate duality and the local Euler characteristic give `log_q #H¹(F_r,M) = r v_F(d) + O(1): #H⁰` and `#H²` are bounded by `d` while `r` varies. The preceding exact sequence then identifies the linear coefficients and proves `v_F(𝔡_u)+v_F(𝔡_{u^t})=v_F(d)`. This finite-residue-field proof supplies exactly the local fields of number-field Néron models.

The new local target is `Isogeny.localCokernel_asymptotic`, the displayed conormal-length asymptotic with one bound uniform in `r ≥ 1`. Together with the supplied duality and its `Isogeny.localKummer_exact` corollary, comparison of linear coefficients gives the dual-different and height identities here.

Globalize the equality of local ideals. Add the two isogeny formulas: `½log d−log N𝔡_u/[K:ℚ]` and `½log d−log N𝔡_{u^t}/[K:ℚ]` sum to zero. Equivalently `h(B)−h(A)=h(B^t)−h(A^t)`.

For a polarization `u : A → A^t, u=u^t` and `𝔡_u²=(d)`. The squared pullback map divided by `d` identifies `ω̄_A^{⊗2}` and `ω̄_{A^t}^{⊗2}` integrally; its archimedean norm is 1 by §2.3. This proves the isometry of squared metrized Hodge lines for arbitrary reduction and equality of their degrees (Raynaud Corollary 2.1.3, pp. 207–208).

The source identifications are [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), Théorème 2.1.1 and Remarque 2.1.2, p. 207; §2.4 and Remark 2.4.1, pp. 211–212; Corollary 2.1.3, pp. 207–208; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), V, Lemma 3.4, p. 166.

*Needs:* §4.1; **AbelianSchemesAndArithmeticModuli** §A3.5 (`dualIsogenyCartierKernel`); **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.17 (`invariantDifferentialsAndAbsoluteDifferent`); **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §§R07.1.5–R07.1.17; §2.6; §2.3; §4.2; **ArithmeticGaloisDuality** §D7.6 (“Local abelian-variety duality and gerbe evaluation” and “Self-dual isogenies and their local index,” for the pairing and dual isogeny sequences); **ClassFieldTheory**, Layer 5 (finite-module local duality and Euler characteristic).

**Checks.**

- For `μ_(p^n)` over a complete mixed-characteristic DVR `R, ω = R/p^n` has `length n·v_R(p)`; its Cartier dual `ℤ/p^n` is étale and has conormal length zero. Their sum is `v_R(p^n)`, including arbitrarily ramified `R`.
- For the unit group of rank one, both conormal lengths vanish and the dual-length formula reads `0 = v_R(1)`. A formula with `v_R(p)` in place of `v_R(rank G)` would fail this case.
- For a self-dual isogeny (`a` polarization of degree `d`), `𝔡_u² = (d)`.
- For `[p]` on a good-reduction `g`-dimensional variety over `F, v_F(𝔡)=g v_F(p)`. The local cokernel therefore has logarithmic size `r g v_F(p)+O(1)`, while the finite-module `H¹` term has size `2r g v_F(p)+O(1)`; the two dual cokernels give the required factor two.
- For `[p]` on an elliptic curve over `F/ℚ_p, #coker([p](F)) = #E[p](F)·p^[F:ℚ_p]`. The Kummer corollary still applies, whereas replacing this index by `#E[p](F)` would incorrectly apply the supplier's prime-to-`p` numerical formula.
- At split multiplicative reduction, the finite part of the full `p`-torsion kernel is `μ_p`, whose Cartier dual is étale and differs from the finite part of the dual `[p]`-kernel. The semistable Hodge-line argument still gives `𝔡_[p]²=(p²)` for an elliptic curve; replacing it by a duality of those finite parts would fail.

### 4.4 Bounds and denominators for heights along isogenies

In the situation of §4.2: (i) `|h(B/K) − h(A/K)| ≤ ½ log d`, and the same for stable heights; (ii) if `d = p^n` for a prime `p`, then `h(A/K) − h(B/K) = (m/(2[K:ℚ]))·log p` with `m ∈ ℤ, |m| ≤ [K:ℚ]·n`; (iii) `exp(2[K:ℚ](h(B) − h(A))) = d^{[K:ℚ]}·#(O_K/𝔡_u)^{−2}` is a rational number with `|v_p(·)| ≤ [K:ℚ]·v_p(d)` for every prime `p`, so only primes dividing `d` occur (this sharpens the exponent bound of Faltings' remark); (iv) for elliptic curves `E, E′` over a number field related by an isogeny of degree `δ, |h_st(E) − h_st(E′)| ≤ ½ log δ`, in particular `≤ ½ log p` for a cyclic `p`-isogeny, primes dividing `p` included.

`u` of degree `d` over `K`; (iv) uses (i) for stable heights after a common semistable extension.

By §4.3, `𝔡_u` divides `(d)`, so `0 ≤ log #(O_K/𝔡_u) ≤ [K:ℚ] log d`; insert in the formula to get `(i)`.

(ii) For `d = p^n, #(O_K/𝔡_u) = p^k` with `0 ≤ k ≤ [K:ℚ]n`; then `h(A) − h(B) = ((2k − [K:ℚ]n)/(2[K:ℚ])) log p`.

(iii) Rearrange the formula; since (d) `⊆ 𝔡_u`, the `p`-part of `#(O_K/𝔡_u)` is `p^k` with `0 ≤ k ≤ [K:ℚ]v_p(d)`, so `v_p` of `d^{[K:ℚ]}#(O_K/𝔡_u)^{−2}` lies in `[−[K:ℚ]v_p(d), [K:ℚ]v_p(d)]`.

(iv) is (i) with `g = 1` for stable heights.

The source identifications are [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), Corollaire 2.1.4, p. 207; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §4, Bemerkung after Lemma 5, p. 358; [Bilu–Parent–Rebolledo](https://aif.centre-mersenne.org/item/10.5802/aif.2781.pdf), Proposition 4.4(i), p. 971; [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), §2.3, p. 7 (arXiv v1).

*Needs:* §4.2; §4.3; §3.4.

**Checks.**

- Bilu–Parent–Rebolledo's Proposition `4.4(i): |h_F(E) − h_F(E′)| ≤ ½ log δ`; Gaudron–Rémond recall `h(A′) ≤ h(A) + ½ log deg φ` in every normalisation.

### 4.5 Heights along a tower of `p`-divisible subgroups

Let `A` be an abelian variety with semistable reduction over a number field `K, ℓ` a prime, and `G ⊂ A[ℓ^∞]` a `K`-rational `ℓ`-divisible subgroup of height `h_G`. Put `G_n = G[ℓ^n]` and `A_n = A/G_n`. For each `v | ℓ`, assume that the finite parts of the schematic closures of `G_n` in the semi-abelian identity component form the truncations `Γ_v[ℓ^n]` of an `ℓ`-divisible group `Γ_v` over `O_{K_v}`, of dimension `d_v`. Then the conormal module of the kernel has `length n·e_v·d_v` at `v | ℓ` and vanishes at `v ∤ ℓ`, so `h(A_n) = h(A) + n·log ℓ·(h_G/2 − (1/[K:ℚ]) Σ_{v|ℓ} [K_v:ℚ_ℓ]·d_v)`. The finite-part height can be smaller than `h_G` at bad reduction.

`A` semistable over `K`; `G` an `ℓ`-divisible subgroup over `K`; the finite-part truncation hypothesis at the primes over `ℓ`. The global determinant argument that evaluates `Σ_v [K_v:ℚ_ℓ] d_v` (through Hodge–Tate weights), and the general semistable tower stabilization, are FaltingsFinitenessAndIsogenyTheorems R28.2–R28.3; this result supplies the height calculation once the local truncations are given.

The kernel of `A → A_n` on semi-abelian models is the closure `𝒢_n` of `G_n`, quasi-finite flat; at `v ∤ ℓ` it is étale so it contributes nothing.

At `v | ℓ` the finite part `𝒢_n^f` is `Γ_v[ℓ^n]`. Its identity neighbourhood agrees with that of `𝒢_n`, so their conormal modules agree, and `length ω_{Γ_v[ℓ^n]} = n e_v d_v` (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.17). Thus `log #e^*Ω¹ = Σ_{v|ℓ} n e_v d_v f_v log ℓ = n log ℓ Σ_v [K_v:ℚ_ℓ] d_v`.

Insert in §4.2 with `d = ℓ^{n h_G}`.

If `A` has good reduction at every `v | ℓ`, its local `ℓ`-divisible group supplies the ambient group required by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.21 (`BarsottiTate.exists_of_tateModule_summand`). After a common shift `n₀`, the quotient closures form `ℓ`-divisible groups `Γ_v`. Apply the calculation to `A_{n₀}` and `G/G_{n₀}: h(A_{n₀+m}) = h(A_{n₀}) + m·log ℓ·(h_G/2 − Σ_{v|ℓ}[K_v:ℚ_ℓ]d_v/[K:ℚ])` for `m ≥ 0`. For bad reduction the displayed finite-part hypothesis must instead be supplied explicitly; this finite-flat theorem does not make the full quasi-finite closure `ℓ`-divisible.

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §4, p. 359, the height formula; [Raynaud](https://www.numdam.org/item/AST_1985__127__199_0/), Definition 4.1.1 and the different calculation, p. 219, Corollary 4.1.3 and Lemma 4.2.4, p. 220; §§4.2–4.3, pp. 220–228, for the additional global determinant argument.

*Needs:* §4.2; **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.17 (`invariantDifferentialsAndAbsoluteDifferent`); **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.21 (`BarsottiTate.exists_of_tateModule_summand`); **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.5–R07.1.15 (`BarsottiTate`).

**Checks.**

- For `G = A[ℓ^∞]` itself with good reduction at the primes above `ℓ (h_G = 2g, d_v = g), h(A_n) = h(A) + n log ℓ·(g − g) = h(A)`, consistent with `A/A[ℓ^n] ≅ A`.
- For the zero subgroup, `h_G = d_v = 0, A_n = A` and the height increment is zero, including `n = 0`.
- Locally at a split multiplicative elliptic curve, the full generic torsion has height 2 while its finite part is `μ_{ℓ^∞}`, of height and dimension 1. The formula again has coefficient `1−1 = 0`. Replacing that finite part by a finite flat group of height 2 would contradict its rank-`ℓ` special fibre already at level one; good reduction is essential to the full-closure shift argument.

### 4.6 `τ`-components of the Hodge line under an `O_E`-action

Let `E` be a totally real or CM number field acting on an abelian variety `A` over a number field `K ⊇` the normal closure of `E`, through `O_E → End(𝒜)` on the semi-abelian identity component `𝒜` of the Néron model (`A` semistable), with the dual action `γ ↦ γ^t` on `A^t`. For an embedding `τ : E → K` let `W(𝒜, τ) = Ω(𝒜) ⊗_{O_K ⊗ O_E, 1⊗τ} O_K`, and `N(𝒜, τ) = det(W(𝒜, τ)/torsion) ⊗ det(W(𝒜^t, τ^c)/torsion)`, where `c` is the CM involution of `E` (trivial if `E` is totally real). At each complex embedding, the perfect hermitian pairing `Ω(A_σ) × Ω(A^t_σ) → ℂ` (§2.10) is an orthogonal sum of pairings between `W(A_σ, τ)` and `W(A^t_σ, τ^c)`, which metrizes `N(𝒜, τ)`. The `τ`-part of the Faltings height is `h(A, τ) = deg^ N̄(𝒜, τ)/(2[K:ℚ])` (in Yuan–Zhang's `(2π)^{−g}` normalisation of §2.10).

`A` semistable over `K` with `O_E ⊂ End(A)`; `K` contains the Galois closure of `E`; `E` is totally real or CM when the CM involution is used. `W(𝒜, τ)` need not be locally free at primes ramified in `E`; its determinant is then taken of the torsion-free quotient, and isogeny comparisons assume local freeness.

Provide the following maps and identities.

- `AbelianVariety.componentQuotient`: `W(𝒜, τ) = Ω(𝒜) ⊗_{O_K ⊗ O_E, τ} O_K`.
- `AbelianVariety.componentLine`: `N̄(𝒜, τ) = det(W(𝒜,τ)/torsion) ⊗ det(W(𝒜^t,τ^c)/torsion)`, with the pairing metric. Taking the torsion-free quotient precedes the determinant.
- `AbelianVariety.componentHeight`: `h(A, τ) = deg^ N̄(𝒜, τ)/(2[K:ℚ])`.
- `AbelianVariety.componentHeight_baseChange`: `h(A_L, τ) = h(A, τ)` for `L/K` finite (semistable `A`).
- `AbelianVariety.componentPairing_orthogonal`: The pairing of §2.10 is the orthogonal sum over `τ` of pairings `W(A, τ) × W(A^t, τ^c) → ℂ`.
- `AbelianVariety.componentLine_trivial_action`: For `E = ℚ, N̄(𝒜, id) = ω̄̂(A) ⊗ ω̄̂(A^t)` with the Yuan–Zhang `((2π)^{−g})` metrics, and `h(A, id) = (h_YZ(A) + h_YZ(A^t))/2 = h_YZ(A) = h_Del(A)`.
- `AbelianVariety.componentHeight_sum`: If every `W` is locally free and `O_K ⊗ O_E → ∏_τ O_K` is an isomorphism at every prime, then `Σ_τ h(A, τ) = h_Del(A)`.

The `O_E`-action on `A` extends to the Néron model, hence to its identity component, by the Néron mapping property; the dual action on `A^t` is `γ ↦ γ^t`.

`Ω(A) ⊗ K` decomposes under `E ⊗ K = ∏_τ K` into the eigenquotients `W(A, τ)`; integrally `W(𝒜, τ)` is the `τ`-quotient.

§2.10's pairing is `E`-equivariant (`γ` on `A` pairs with `γ^t` on `A^t`), so it pairs `W(A, τ)` with `W(A^t, τ^c)` and is an orthogonal sum.

Determinants give the hermitian line bundle `N̄(𝒜, τ)`; its degree defines `h(A, τ)`.

The source identifications are [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §2.1–2.2, pp. 11–13 (arXiv v3).

*Needs:* §2.10; §2.4; the imported Hodge-line interface; §1.3; **AbelianSchemesAndArithmeticModuli** §A6.22 (`CoefficientHom`); **NeronModelsAndSemistableAbelianVarieties** §1.1 (`NeronMappingProperty`).

**Checks.**

- `AbelianVariety.componentHeight_Q`: For `E = ℚ, h(A, id) = h_YZ(A)`.
- `AbelianVariety.componentQuotient_rank`: For a CM elliptic curve of type `{τ}`, the generic ranks of `W(𝒜,τ)` and `W(𝒜,τ^c)` are 1 and 0. The torsion-free quotient of the latter is zero; the raw quotient at a ramified prime can have torsion.
- `AbelianVariety.componentHeight_torsion_nonexample`: At a prime ramified in `E` the raw quotient `W(𝒜, τ)` can have torsion; taking `det` of the raw module without the torsion-free convention changes the degree.
- For `E = ℚ(i)` and `K` containing `E`, at a place `v` above 5 the map `O_{K,v} ⊗ O_E → O_{K,v} × O_{K,v}` is an isomorphism: the roots `i` and `−i` differ by the unit `2i`. The `τ`- and `τ^c`-eigenlines give the determinant product with no local index.
- At `v` above 2, on a free CM elliptic differential line where `i` acts by `τ(i)`, the raw `τ^c`-quotient is `O_{K,v}/(2i)`, whereas its torsion-free quotient is zero. The integral split formula does not apply at this prime.
- `Σ_τ deg^ N̄(𝒜, τ)` differs from `deg^ ω̄̂(A) + deg^ ω̄̂(A^t)` by the discriminant-type correction of the `τ`-decomposition, which vanishes when all `W(𝒜, τ)` are locally free and `O_K ⊗ O_E → ∏ O_K` is an isomorphism at every prime.

### 4.7 `τ`-component heights along `O_E`-isogenies

In the setting of §4.6, let `f : 𝒳 → 𝒴` be an `O_E`-linear isogeny of abelian schemes over `O_K` (good reduction) with dual `f^t : 𝒴^t → 𝒳^t`. Assume the `τ`-quotients of `Ω(𝒳), Ω(𝒴)` and the `τ^c`-quotients of `Ω(𝒳^t), Ω(𝒴^t)` are locally free `O_K`-modules. Then the rational comparison `det(f^*) ⊗ det(f^{t*})^{−1}` between the generic fibres of `N̄(𝒴,τ)` and `N̄(𝒳,τ)` is an isometry at infinity and `h(X, τ) − h(Y, τ) = (1/(2[K:ℚ]))·(log #coker(f^* : W(𝒴, τ) → W(𝒳, τ)) − log #coker(f^{t*} : W(𝒳^t, τ^c) → W(𝒴^t, τ^c)))`. In particular `h(X, τ) = h(Y, τ)` whenever, at every finite place, the `τ`-length of `Ω(ker f)` equals the `τ^c`-length of `Ω(ker f^t) = Ω((ker f)^D)`; this holds when `ker f` is `O_E`-isomorphic to its Cartier dual with conjugation-invariant `O_E`-action. The rational comparison need not carry the integral source into the integral target: its finite divisor is the difference of the two cokernel divisors.

Local freeness of the four `τ`-quotients is a hypothesis: at primes ramified in `E` (or `F`) the raw quotients can have torsion, and the length count must then be redone with a determinant convention.

`f^*` and `f^{t*}` induce a rational map `φ = det f^* ⊗ (det f^{t*})^{−1} : N(𝒴, τ) → N(𝒳, τ)`.

Archimedean: the pairing of §2.10 is functorial `((φ^*α, β) = (α, φ^{t*}β))`, so `φ` is an isometry at every complex embedding.

Finite: under local freeness the cokernel of `det f^*` on `W(·, τ)` has the length of the cokernel of `f^*`, and likewise for `f^{t*}`; the degree difference is the difference of logarithms of the orders.

Self-dual kernels: `ker f^t ≅ (ker f)^D O_E`-linearly (AbelianSchemesAndArithmeticModuli §A3.5), and the `τ`- and `τ^c`-lengths match under the hypotheses.

The source identifications are [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §2.2, proof of Theorem 2.2, pp. 12–13 (arXiv v3); [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), Erratum appended to arXiv v3, §2.1 (November 2021).

*Needs:* §4.6; §2.10; **AbelianSchemesAndArithmeticModuli** §A3.5 (`dualIsogenyCartierKernel`); **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.17 (`invariantDifferentialsAndAbsoluteDifferent`); §1.5.

**Checks.**

- For `E = ℚ` the formula reduces to the difference of the isogeny formulas for `f` and `f^t`, consistent with §4.3.

### 4.8 The Hodge filtration of a CM abelian scheme over a `p`-adic ring

Let `A` have CM by `O_E` of type `Φ ⊂ Hom(E, K)` with good reduction over the completion `O_σ` of `O_K` at a finite place `σ` over `p`, model `𝒜_σ`, assume `H¹_dR(𝒜_σ/O_σ)` is free of rank one over `O_σ ⊗ O_E`, and assume `K` is large enough that `O_E ⊗_ℤ O_σ = O_σ[x]` for an element `x` (monogenic). Let `P(t) = ∏_{ρ ∈ Hom(E,K)} (t − x_ρ), P_Φ = ∏_{τ∈Φ}(t − x_τ), P_{Φ^c} = ∏_{τ∈Φ^c}(t − x_τ)`. Then, with `x` acting as `t`, the Hodge–de Rham sequence `0 → Ω(𝒜_σ) → H¹_dR(𝒜_σ/O_σ) → H¹(𝒜_σ, O) → 0` is isomorphic as a sequence of `O_σ ⊗ O_E`-modules to `0 → O_σ[t]/P_Φ → O_σ[t]/P → O_σ[t]/P_{Φ^c} → 0` (first map multiplication by `P_{Φ^c}`); in particular `Ω(𝒜_σ) ≅ O_σ[t]/P_Φ`, and the decomposition map `Ω(𝒜_σ) → ⊕_{τ∈Φ} O_σ` has determinant generating `√(Δ(Φ))` with `Δ(Φ) = ∏_{i<j}(x_{τ_i} − x_{τ_j})²`.

Monogenicity of `O_E ⊗ O_σ` is a hypothesis (it may require enlarging `K`). Rank-one freeness of `H¹_dR` over `O_σ ⊗ O_E` is an explicit hypothesis of this local polynomial comparison, separate from the ordinary Hodge–de Rham sequence.

Use the `O_E`-equivariant Hodge–de Rham sequence from **AbelianSchemesAndArithmeticModuli** §A4.3. Choose a basis of `H¹_dR` as a rank-one `O_σ ⊗ O_E`-module, using the stated freeness hypothesis, to identify the middle module with `O_σ[t]/P`.

Exactness of the polynomial sequence: Gauss's lemma for divisibility by `P_{Φ^c}` in `O_σ[t]`.

The isomorphism of the middle terms carries the Hodge filtration to the unique saturated submodule of CM type `Φ`.

The determinant of `t ↦ (x_τ)_{τ∈Φ}` in the basis `1, t`, …, `t^{g−1}` is a Vandermonde determinant.

The source identifications are [Yuan–Zhang](https://arxiv.org/abs/1507.06903v3), §2.2, Lemma 2.4 and Corollary 2.5, pp. 15–16 (arXiv v3).

*Needs:* §4.6; **AbelianSchemesAndArithmeticModuli** §A4.3 (`AbelianH1dR`).

**Checks.**

- For `E` imaginary quadratic and `p` split, `Ω(𝒜_σ) ≅ O_σ` with `x` acting by `x_τ`, and `Δ(Φ) = 1`.

### Examples

Multiplication by `n≠0` has degree `|n|^(2g)` and different `(n^g)`; its archimedean and finite terms cancel. An ordinary `μ_p`-kernel quotient at good reduction has different `(p)`, while the étale quotient has unit different. Their height changes have opposite signs. For the full `ℓ`-divisible group at good primes the tower coefficient is `g−g=0`. A rank-zero `τ`-quotient can still have torsion before saturation at a ramified prime.

### Dependencies

Layers 1–3; AbelianSchemesAndArithmeticModuli A2–A4 and A6; NeronModelsAndSemistableAbelianVarieties §§1.1–1.11 and 3.1–3.12; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.5–R07.1.21; ClassFieldTheory Layer 5; §2.0. The CM polynomial target additionally assumes the stated rank-one freeness and monogenic presentation.

## Layer 5: Logarithmic metrics, moduli and theta heights

A logarithmic metric is allowed to grow like powers of a logarithm relative to a fixed boundary extension. Its height differs from a continuous ample height by a logarithm of that height, enough for Northcott. Apply this to the integral modular line, and then compare with the more explicit theta and elliptic `j`-heights.

### 5.0a Principal Siegel toroidal compactifications and degeneration charts

Fix `g ≥ 1` and the principal Siegel stack `𝔄_g` over `Spec ℤ` of **PELModuli** §M6.3. Let `Σ` be a smooth admissible rational polyhedral cone decomposition of the cone of positive semidefinite symmetric forms on a rank-`g` integral lattice with rational radical, invariant under its integral linear group and with finitely many orbits of cones. Admissibility includes coverage of that cone and compatibility on rational boundary components. Define `SiegelModuli.ToroidalCompactification g Σ`: a proper smooth Deligne–Mumford stack `Ā_{g,Σ}` over `ℤ` with dense open `𝔄_g`, a relative normal-crossings boundary, a stratification by the cone data, and a semi-abelian family `SiegelModuli.toroidalFamily` extending the universal abelian scheme. These properties and the formal chart comparison characterize the compactification up to its compatible isomorphism. The family is semi-abelian in §2.0’s fibrewise sense. (Faltings–Chai IV, Definition 5.6 and Theorem 5.7(1)–(4), pp. 116–117.)

Construct the formal chart comparison `SiegelModuli.toroidalDegenerationChart`: along a cone stratum, the completed stack and its family are the quotient of the Mumford degeneration chart by the finite cone stabilizer. The chart includes the character lattice `X`, period lattice `Y`, an abelian scheme `B`, its extension by the split torus with characters `X`, and the bilinear period pairing `b:Y×X →` units on the abelian locus. A principal polarization identifies the period and character lattices and makes the valuation forms positive semidefinite in the prescribed cone. Construct these data and their semi-abelian family using Mumford’s construction, retaining arbitrary abelian part and the polarization and descent comparisons; prove the chart is the completion of the algebraic family. On a complex polydisc with reduced boundary `x₁⋯x_a = 0`, the pairing has the form `b(y,x) = u(y,x)·∏_j x_j^(s_j(y,x))`, with `u` a unit and each `s_j` positive semidefinite. This is the degeneration interface consumed by §5.3. (Faltings–Chai II §§3–5; III §§2–7 and §10; IV §3 and Theorem 5.7(4); V, proof of Proposition 4.5, pp. 168–169.)

The API is `SiegelModuli.toroidalOpen`, `SiegelModuli.toroidalBoundary`, `SiegelModuli.toroidalFamily_restrict`, `SiegelModuli.toroidalRefinement`, `SiegelModuli.toroidalRefinement_family` and `SiegelModuli.toroidalValuativeLift`. A cone refinement induces a proper map equal to the identity on `𝔄_g` and identifies the pulled-back semi-abelian family with the refined family; common smooth refinements exist. A principally polarized abelian variety over the fraction field of a DVR has, after a finite extension, a lift to `Ā_{g,Σ}`; its pulled-back family is its semi-abelian identity model. This is the valuative property of the proper stack, and permits a finite extension even when the coarse point is rational. For full symplectic level `n ≥ 3`, construct the corresponding fine toroidal spaces over `ℤ[1/n,ζ_n]`, or the union of pairing components over `ℤ[1/n]`, with smooth relative boundary intersections after a smooth cone choice. Level pullback preserves the family and the formal charts. (Faltings–Chai IV, proof of properness before Theorem 5.7, p. 116; Theorem 5.7(5), p. 117; §6, pp. 120–131.)

**Checks.**

- For `g = 1` the cusp chart is the Tate degeneration: the special identity fibre is `𝔾_m`, the period is `q`, and the reduced boundary is `q = 0`. A construction restricted to abelian schemes cannot supply this chart.
- The product of this degeneration with a constant elliptic family has a nonzero abelian block and a rank-one logarithmic toric block. Its formal data must retain both; replacing the whole family by a torus loses the constant factor.
- On the abelian open stratum the toric lattice has rank zero, the period factor is empty and the family is the universal abelian scheme.
- A subdivision changes the toroidal boundary strata but induces the identity over `𝔄_g` and the same semi-abelian family after pullback. A construction whose Hodge lattice changes with the subdivision fails this check.

*Needs:* §2.0; **PELModuli** §§M6.3 and M6.9–M6.10; **AbelianSchemesAndArithmeticModuli** §§A2.2, A3.6 and A5.8; **SchemeAndStackFoundations** §§1.18–1.23, 4.7–4.10 and 4.17 for stacks, formal completion, algebraization and normal crossings.

### 5.0b The integral minimal compactification and its ample Hodge power

Construct `SiegelModuli.MinimalCompactification g`, a normal projective scheme `A_g^*` over all of `Spec ℤ` containing the coarse moduli `A_g` as a dense open. Its intended construction is `Proj` of the integral graded ring `⊕_{k≥0} H⁰(Ā_{g,Σ},ω_G^k)`; prove finite generation and independence of the smooth cone decomposition. Supply an integer `m ≥ 1` and an ample line `SiegelModuli.minimalHodgePower` `L` on `A_g^*`, with `SiegelModuli.toroidalToMinimal` `π_Σ:Ā_{g,Σ} → A_g^*` and `SiegelModuli.minimalHodgePower_pullback`: `π_Σ^*L ≅ ω_G^m`. On the open this is the descent of the universal Hodge power through the coarse map. The exponent annihilates the inertia action on Hodge fibres and can be enlarged to make `L` very ample. The construction retains the finite-place lattice at every prime of `ℤ`. (Faltings–Chai V, Proposition 2.1 and Theorem 2.3(1)–(3), pp. 149–150.)

Prove `SiegelModuli.hodgePower_generated`: a positive Hodge power is globally generated on the toroidal stack. Prove also `SiegelModuli.hodgeDegree_zero_criterion`: if `C` is a smooth proper geometrically connected curve over an algebraically closed field, `G → C` is a semi-abelian family with principally polarized abelian generic fibre, and `deg(det ω_G) ≤ 0`, then `det ω_G` is torsion, its degree is zero, and `G` is an isotrivial abelian scheme (constant after a finite étale cover). In this principally polarized case the algebraic theta sections show that a nonpositive Hodge degree forces all theta moduli to be constant; the generic abelian scheme then has good reduction everywhere. These results give the projective contraction and the ample descended line. (Faltings–Chai V, Propositions 2.1–2.2 and their proofs, pp. 149–150.) The API also includes `SiegelModuli.minimalHodgePower_refinement`, compatibility of `π_Σ` and its line comparison under common refinements; `SiegelModuli.minimalLevelMap`, the finite surjective map `q_n : A^*_{g,n} → A_g^*⊗ℤ[1/n]` for `n ≥ 3`, with the fixed-`ζ_n` version over `ℤ[1/n,ζ_n]`, satisfying `q_n⁻¹(A_g) = A_{g,n}`; and `SiegelModuli.minimalLevel_hodgePower`, identification of `q_n^*L` with the `m`-th power of the extended fine-level Hodge line on the whole minimal compactification, compatible with toroidal pullback. Surjectivity follows from properness and surjectivity on the dense moduli open; the boundary strata map to strata of the same abelian dimension (Faltings–Chai V, Theorem 2.5(3)–(6), pp. 152–153). The level-one integral model, rather than a model over `ℤ[1/n]` alone, fixes the height in §5.5. A coarse point extends to `A_g^*` by properness, and §5.0a supplies its toroidal stack lift after a finite extension when its generic point is in `A_g`. (Faltings–Chai V, Propositions 2.1–2.2 and Theorem 2.3, pp. 149–151; Theorem 2.5, pp. 152–153.)

**Checks.**

- For `g = 1, A₁^* = ℙ¹_ℤ, m = 12` and `L = O(1)`; the boundary section corresponds to the integral discriminant. The exponent one would not kill elliptic stabilizers.
- For `g = 0`, use `Spec ℤ, m = 1` and the unit line. The graded ring is `ℤ[t]` and its relative `Proj` is `Spec ℤ`. In the curve criterion a constant principally polarized abelian family has trivial Hodge line of degree zero; a family satisfying the hypotheses with positive Hodge degree cannot be isotrivial.
- On every positive-dimensional contraction fibre, the pulled-back `L` has degree zero. Thus the Hodge power is semiample on the toroidal model, while ampleness is the property on the minimal scheme.
- A common cone refinement gives the same projective scheme and the same line pullback. Restricting only to `ℤ[1/n]` cannot distinguish extensions differing at primes dividing `n`, so it does not replace the level-one integral comparison.

*Needs:* §5.0a; **PELModuli** §§M6.3, M6.5 and M6.9; **SchemeAndStackFoundations** §0.3 (relative `Proj`) and §1.23 (coarse moduli); **AlgebraicVectorBundles** Layer L0C.

### 5.1 Hermitian metrics with logarithmic singularities

Let `X̄` be an arbitrary complex analytic variety, `Z ⊂ X̄` a closed analytic subvariety with dense complement `U = X̄ ∖ Z`, and let `L` be a fixed holomorphic line bundle on `X̄` with a continuous hermitian metric `‖·‖` on `L|_U`. The metric has logarithmic singularities along `Z` if every `z ∈ Z` has a neighbourhood `N`, a local generator `s` of `L` on `N` and local generators `f₁`, …, `f_t` of the ideal of `Z` on `N`, with `C > 0` and `n ∈ ℕ`, such that for `x ∈ N ∖ Z: max(‖s(x)‖, ‖s(x)‖^{−1}) ≤ C·(1 + |log max_i |f_i(x)||)^n`. When `X̄` is compact, this is equivalent (Deligne) to bounds by `C₀^{±1}‖·‖₀·ρ^{±r}`, with one `C₀ ≥ 1, r ≥ 0`, a continuous metric `‖·‖₀` on `L` over `X̄` and a logarithmic distance function `ρ ≥ 1`, locally comparable to `1+|log Σ|f_i|²|` near `Z`. For the fixed extension `L`, the local condition is independent of frames and boundary generators, is preserved under pullback of that extension, and can be checked after a proper birational modification using `π^*L` (Faltings–Chai Remark 4.3). Different extensions of `L|_U` across the boundary can have different answers. On a punctured disc, a bounded unit norm for a frame of `O` and the norm `|q|` for a frame of `O(−[0])` describe the same metric on `U` through their identification, but only the first extension has logarithmic growth. Choose a neighbourhood with `0 < max_i |f_i| < 1`, and use `1+|log max_i |f_i||`; `n = 0` is permitted.

The predicate and its local functoriality require no compactness. Compactness is required for the uniform distance formulation and for the global height arguments of §5.2. Metrics are `F_∞`-invariant when `X̄` comes from a scheme over `ℝ` or `ℚ`.

Provide the following maps and identities.

- `HermitianMetric.HasLogSingularities`: The local predicate on a continuous metric on `L|_U` along `Z = X̄ ∖ U`, relative to the fixed extension `L` on an arbitrary complex analytic variety `X̄`.
- `HermitianMetric.hasLogSingularities_iff_distance`: For compact `X̄`, equivalent to `C₀^{−1}‖·‖₀ρ^{−r} ≤ ‖·‖ ≤ C₀‖·‖₀ρ^r` near `Z` for a logarithmic distance `ρ ≥ 1` and uniform `C₀ ≥ 1, r ≥ 0`.
- `HermitianMetric.hasLogSingularities_pullback`: Preserved under pullback along morphisms `g` with `g^{−1}(Z)` contained in the new boundary.
- `HermitianMetric.hasLogSingularities_of_modification`: Can be checked after a proper modification isomorphic over `U`, using the extension `π^*L`.
- `HermitianMetric.hasLogSingularities_iff_pullback_of_finite_surjective`: For a finite surjective morphism `q : Ȳ → X̄` of normal complex analytic varieties, with `U = X̄ ∖ Z` and `V = q⁻¹(U)` both dense, a continuous hermitian metric on `L|_U` has logarithmic singularities along `Z` relative to `L` if and only if its pullback on `(q^*L)|_V` has logarithmic singularities along the reduced inverse-image boundary `W = (q⁻¹Z)_red` relative to `q^*L`. Neither compactness nor absence of ramification is required; the extension upstairs is exactly `q^*L`.
- `HermitianMetric.hasLogSingularities_tensor`: Closed under tensor products and duals.
- `HermitianMetric.hasLogSingularities_of_continuous`: A continuous metric on `L` over all of `X̄` has logarithmic singularities along every `Z`.
- `HermitianMetric.LogSingularAtZero`: One-variable local model: a positive frame norm `f` on a punctured disc has a logarithmic singularity at 0 iff `max(f, f^{−1}) ≤ C(1 + |log|q||)^n` near 0.
- `HermitianMetric.LogSingularAtZero.inv`: The reciprocal frame norm has logarithmic growth on the fixed dual extension.
- `HermitianMetric.LogSingularAtZero.pow`: The local model is stable under natural-number powers, including the unit power. Negative integral powers use the dual extension.
- `HermitianMetric.LogSingularAtZero.comp_pow_iff`: For `f : ℂ → ℝ` and a natural number `e ≥ 1`, the local condition for `f` is equivalent to that for `u ↦ f(u^e)`, with the pulled-back frame of the fixed extension.

Locally, `log Σ|f_i|²` differs from `2 log max|f_i|` by a bounded amount. For compact `X̄` a finite cover makes the local constants uniform, and any two continuous metrics on `L` over `X̄` have bounded ratio. This gives the uniform distance formulation.

Independence of the generators `f_i`: two systems of generators satisfy `|f′| ≤ C|f|^a` and conversely, so the logarithms are comparable.

Pullback: along `g : Ȳ → X̄` with `g^{−1}(Z) ⊂ Z′`, local equations pull back to functions vanishing on `g^{−1}(Z)`, and `log` of a holomorphic function vanishing on a subvariety is dominated by `log` of its ideal generators (Łojasiewicz).

Birational check: for a proper modification `π : X̃ → X̄` isomorphic over `U` the sup over fibres is controlled (Faltings–Chai leave this as an exercise; Faltings states it with a resolution `Φ`).

Finite-cover descent: trivialize `L` near a boundary point `x` and use its pulled-back frame. If `I` is generated by the pulled-back boundary equations and `J` is the reduced ideal of `W`, then `J = √I`. Finite generation and the local analytic Nullstellensatz give `J^a ⊂ I ⊂ J` for some `a ≥ 1` after shrinking each chart. With bounded coefficients on smaller charts, the maxima `δ_W` and `δ_Z` of the absolute values of boundary generators satisfy `δ_W(y)^a ≤ C δ_Z(q(y))` and `δ_Z(q(y)) ≤ C′ δ_W(y)`. Thus `1 + |log δ_W(y)|` and `1 + |log δ_Z(q(y))|` are comparable, including at ramified points. The fibre over `x` is finite; choose such charts at its points and use properness to shrink the neighbourhood of `x` so that its entire inverse image is covered by them. The finitely many growth constants and exponents then give a bound downstairs by surjectivity. Pullback gives the reverse implication. The frame norm upstairs equals the downstairs frame norm at `q(y)`, so this argument uses `q^*L` throughout. The one-variable comparison is `|log|u^e|| = e |log|u||`; positive `e` also makes `u ↦ u^e` surjective on sufficiently small punctured discs. The ideal-radical identity is Demailly, *Complex Analytic and Differential Geometry*, Ch. II, Theorem 4.22; it applies on local analytic charts and their quotient rings.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Definition 4.2 and Remark 4.3, p. 167; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), p. 30, the definitions following Rappel 1.8; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, Definition, p. 355.

*Needs:* **ComplexComparisonPartII** §§C−1.1, C0.2, C0.4 and C5.1 (analytic morphisms, coherent boundary ideals and line pullbacks); **SchemeAndStackFoundations** §4.17 (normal crossings); Mathlib `UpperHalfPlane`.

**Checks.**

- `HermitianMetric.logSing_cusp`: On the disc with coordinate `q` and the fixed trivial extension, the cusp Hodge squared norm `f(q) = −(1/(2π))log|q|` satisfies the local logarithmic condition. Multiplication by `2π` gives the frame norm `−log|q|` with the same property.
- `HermitianMetric.logSing_polynomial_nonexample`: `‖1‖ = |q|^{−1/2}` does not have logarithmic singularities along `q = 0` (it grows faster than any power of `log`).
- `HermitianMetric.logSing_empty_boundary`: With `Z = ∅` every continuous metric qualifies.
- On `X̄ = 𝔸¹_ℂ` with `Z = {0}`, the constant unit metric on `O` has logarithmic singularities. This noncompact example and the disc examples use the local predicate.
- `HermitianMetric.logSing_power`: If `‖·‖` has logarithmic singularities so does `‖·‖^k` on `L^{⊗k}` for `k ∈ ℤ`. In particular, the reciprocal of `−(1/(2π))log|q|` has logarithmic growth on the fixed dual extension `(k = −1)`.
- `HermitianMetric.logSing_zero_nonexample`: The zero function is not a frame norm. Eventual strict positivity is part of LogSingularAtZero; `max(0,0⁻¹)=0` in Lean must not let the zero function pass.
- `HermitianMetric.logSing_negative_nonexample`: A negative constant is not a metric, even if its maximum with its reciprocal satisfies a formal upper bound. Require `C > 0` and a positive frame norm.
- `HermitianMetric.logSing_extension_nonexample`: Replacing a boundary extension by `O(−[0])` multiplies its generator norm by `|q|`. Its inverse has polynomial growth, so logarithmic singularity is not invariant under arbitrary boundary twists.
- For the finite ramified disc map `q = u^e, e ≥ 1`, and the trivial extension, a norm `−log|q|` pulls back to `−e log|u|` near zero. Both have logarithmic growth; `HermitianMetric.LogSingularAtZero.comp_pow_iff` includes `e = 2`, where the map has degree two and is not a modification.
- Under the same map, `|q|^(−1/2)` pulls back to `|u|^(−e/2)`; neither norm has logarithmic growth. The constant map `e = 0` would instead give the unit norm upstairs, so the positive-exponent hypothesis is necessary.
- For the unit norm on `O` over the punctured disc, changing the extension to `O(−[0])` gives frame norm `|q|`. Its pullback frame has norm `|u|^e` on `q^*O(−[0]) = O(−e[0])`, and both fail the logarithmic condition. Replacing this extension by `O` upstairs would change the answer and is excluded.
- The metric `‖dz‖² = Im τ` on the Hodge line over the `j`-line near the cusp `q = 0: Im τ = −(1/2π) log|q|`, so it has logarithmic singularities along `q = 0`.

### 5.2 Heights for metrics with logarithmic singularities

Let `𝒳̄` be proper and flat over `O_K` (or `ℤ`), `𝒳 ⊂ 𝒳̄` open dense with generic fibres `X ⊂ X̄, ℒ` an ample line bundle on `𝒳̄` and `‖·‖` an `F_∞`-invariant hermitian metric on `ℒ|_{X(ℂ)}` with logarithmic singularities along `X̄(ℂ) ∖ X(ℂ)`. Define `h_{ℒ̄}(x)` for `x ∈ X(ℚ̄)` as in §1.12. Let `h′` be the height for any continuous metric on `ℒ` over `X̄(ℂ)`. Then there are constants `C₁, C₂ > 0` with `|h_{ℒ̄}(x) − h′(x)| ≤ C₁ + C₂·log(max(h′(x), 1))` on `X(ℚ̄)`. Consequently (i) `h_{ℒ̄}` is bounded below on `X(ℚ̄)`, and (ii) for all `t ∈ ℝ` and `D ≥ 1` the set `{x ∈ X(ℚ̄) : [ℚ(x):ℚ] ≤ D, h_{ℒ̄}(x) ≤ t}` is finite.

`ℒ` ample on the proper `𝒳̄`; the metric is singular only along the boundary `X̄ ∖ X`. Points are taken in the open part `X`.

Embed `𝒳̄` by a power of `ℒ`; the sup-type continuous metric gives `h′ =` Weil height up to `O(1)` (§1.13).

Logarithmic distance: choose sections `f₁`, …, `f_t` of `ℒ^{⊗s}` over `𝒳̄` with common zero locus the boundary and `‖f_i‖₀ ≤ 1` for the continuous metric (Faltings, proof of Lemma 3); §5.1 gives `|log(‖·‖/‖·‖₀)(z)| ≤ c₁ + c₂ log(1 − log ‖f_i(z)‖₀)` for each `i`. For `x ∈ X(ℚ̄)` of degree `N = [ℚ(x):ℚ]` pick `i` with `f_i(x) ≠ 0`; since `f_i(x)` is an integral section of `x̄^*ℒ^{⊗s}`, the finite part of its degree is `≥ 0` and `(1/N)Σ_σ −log ‖f_i(x_σ)‖₀ ≤ s·h′(x) + c₃`. Concavity of `log` (Jensen) bounds the average `(1/N)Σ_σ log(1 − log ‖f_i(x_σ)‖₀)` by `log(1 + s·h′(x) + c₃)`, uniformly in `N`; bounding each embedding separately would make the constants depend on `N`.

Insert `‖·‖ ≍ ‖·‖₀ρ^{±r}` (§5.1) in the archimedean part of the degree.

`(i)`, (ii): `h′` is bounded below and satisfies Northcott with bounded degree (§1.13); the comparison transfers both, since `h ≤ t` forces `h′ ≤ t + C₁ + C₂ log max(h′, 1)`, bounding `h′`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Proposition 4.4 and the following paragraph, pp. 167–168; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Proposition 1.9 and its proof, p. 30; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, Lemma 3, p. 356.

*Needs:* §5.1; §1.12; §1.13; §1.14.

**Checks.**

- For the `j`-line with `‖dz‖² = Im τ, h_{Hodge}(E) = h(j)/12 + O(log max(h(j), 1))` (§5.9).

### 5.3 The Faltings metric has logarithmic growth at the boundary

Let `S̄` be a smooth complex variety, `D ⊂ S̄` a normal-crossings divisor, and `G → S̄` a semi-abelian scheme that is abelian (and polarizable) over `S = S̄ ∖ D`. Then the Faltings metric on `ω̄_G|_S` (§2.8) satisfies §5.1's local logarithmic-singularity predicate along `D` for the extension `ω_G`, without a properness assumption on `S̄`. In particular, on a smooth toroidal compactification `Ā_{g,n}` of the fine Siegel moduli space `(n ≥ 3)` with its universal semi-abelian scheme, and hence (§5.1's modification invariance) on the minimal compactification `A*_{g,n}` with `L_n = q_n^*L` identified with the extended fine-level Hodge power by §5.0b, the induced metric has logarithmic singularities along the boundary. The toroidal extension is `π_n^*L_n ≅ ω̄_G^{⊗m}`.

`G` semi-abelian over `S̄`, abelian over `S`; `D` a normal-crossings divisor (after resolution). For the moduli application the toroidal compactification (smooth cone decompositions, so that the boundary is a divisor with smooth relative intersections) and its universal semi-abelian scheme over `ℂ` are the base change to `ℂ` of §5.0a at neat level `n ≥ 3`. For a general `(S̄, D, G)` the local degeneration structure is constructed for that family, rather than inferred solely from moduli charts; the proof restricts to holomorphic discs meeting `D` transversally and uses the one-parameter argument of Deligne's Lemme 1.18 together with the bound for several parameters of Faltings–Chai V.4.5.

Reduce to a polydisc near a boundary point with coordinates `x₁`, …, `x_a` cutting out `D`, using the degeneration data: `G` is the quotient of an extension of an abelian scheme by a torus by a period lattice given by a bilinear form `b = ∏ x_j^{s_j}` with `s_j` positive semi-definite.

The period Gram matrix has a bounded regular abelian block as well as the toric logarithmic terms: in a fixed local frame the squared norm is, up to bounded positive factors, `det(B(x) + Σ_j −log|x_j|·s_j)`. The bounded term `B(x)` cannot be discarded when the toric rank is smaller than `g`. The polarization is uniformly positive on the common nullspace of the `s_j`; comparison of the Schur complement gives a uniform positive lower bound after shrinking the chart.

Bound the eigenvalues above by `C(1+Σ_j |log|x_j||)`; bound the full Gram determinant below using the preceding abelian block and the positive toric directions. Its determinant and reciprocal are then bounded by powers of `1+|log|x₁⋯x_a||`. This is the logarithmic condition for the fixed extension of the Hodge line.

One-variable version (Deligne Lemma 1.18): over a punctured disc the lattice `Λ_z` contains the monodromy-invariant sublattice `Λ⁰` extending across 0, and the volume of `ℂ^g/Λ_z` grows like `|log|z||^{2g−r}`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Proposition 4.5 and its proof, pp. 168–169; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Proposition 1.11, p. 31, and Lemme 1.18 with its proof, pp. 33–34; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, p. 355 (statement and proof sketch); [Faltings, Arakelov’s theorem](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0025.pdf), §2 (end), pp. 339–340; [Szpiro](https://www.numdam.org/item/AST_1985__127__11_0/), Exposé I, §3, Théorème 3.2 and Lemme 3.2.1, p. 26.

*Needs:* §2.8; §2.2; §5.1; §2.0; §5.0a; §5.0b; **SchemeAndStackFoundations** §4.17 (normal crossings); **PELModuli** §M3.9 (Siegel uniformization).

**Checks.**

- For `g = 1` near the cusp `q = 0` of the `j`-line, `‖dz‖² = Im τ = −(1/2π)log|q|`.
- For a product of a degenerating elliptic curve and a fixed elliptic curve, the logarithmic part has rank one while the full Hodge determinant is positive and proportional to `Im τ`. Dropping the fixed elliptic block would give determinant zero, contradicting positivity.
- For a fixed complex elliptic curve `E`, the constant family `E × 𝔸¹_ℂ` over `𝔸¹_ℂ` with `D = {0}` has a constant positive Hodge frame norm. Its logarithmic bound has exponent zero despite the noncompact base.

### 5.4 The Hodge-metrized modular line bundle on the minimal compactification

Let `A_g` be the coarse moduli space of principally polarized abelian varieties of dimension `g` over `ℤ` (PELModuli §§M6.3–M6.10) and `A_g^*` its minimal compactification, a normal projective scheme over `ℤ` (§5.0b over all primes). There is `m ≥ 1` and an ample line bundle `L` on `A_g^*` such that, for every toroidal compactification `Ā_{g,Σ}` of the stack `𝔄_g` with universal semi-abelian scheme `G` and proper `π : Ā_{g,Σ} → A_g^*, π^*L ≅ ω̄_G^{⊗m}`; over the open part the pullback of `L` to the stack is `ω̄^{⊗m}` of the universal abelian scheme. The Faltings metric on `ω̄` (§2.8) induces an `F_∞`-invariant continuous metric on `L|_{A_g(ℂ)}`, which has logarithmic singularities along the boundary by fine-level growth (§5.3) and finite-surjective descent (§5.1). The pair `L̄ = (L, ‖·‖_Fal^{⊗m})` is the metrized modular line bundle. The same construction applies to the fine level-`n` spaces `A_{g,n}` over `ℤ[1/n] (n ≥ 3)`, whose minimal compactification maps finitely to `A_g^* ⊗ ℤ[1/n]`.

Principal Siegel datum; the toroidal compactifications of the stack `𝔄_g` over `ℤ` and its minimal compactification are those of §5.0 (stack at non-neat level, coarse minimal scheme over all of `Spec ℤ`). `m` is chosen so that `ω̄^{⊗m}` descends (killing stabilizers) and is ample on `A_g^*`.

Provide the following maps and identities.

- `SiegelModuli.modularLineBundle`: The metrized `L̄`, whose underlying ample line `L` on `A_g^*` is constructed in §5.0b, equipped here with the Faltings metric on the open part.
- `SiegelModuli.modularLineBundle_pullback`: The integral comparison of §5.0b `π^*L ≅ ω̄_G^{⊗m}` is an isometry on the abelian open part for the metric just defined, compatibly with refinements of `Σ`.
- `SiegelModuli.modularMetric`: The metric `‖·‖_Fal^{⊗m}` on `L|_{A_g(ℂ)}`.
- `SiegelModuli.modularMetric_logSing`: The metric on `L|_{A_g(ℂ)}` has logarithmic singularities along `A_g^*(ℂ) ∖ A_g(ℂ)`, relative to the fixed extension `L` on `A_g^*(ℂ)`.
- `SiegelModuli.modularLineBundle_level`: Pullback along `A^*_{g,n} → A_g^* ⊗ ℤ[1/n]` gives the level-`n` metrized modular line bundle.
- `SiegelModuli.modularLineBundle_g1`: For `g = 1, A₁^* = ℙ¹_ℤ, L = O(1), m = 12`.

`A_g^* = Proj` of the graded algebra of Hodge-line sections (§5.0b); some power of the Hodge line descends to an ample `L` with `π^*L = ω̄^{⊗m}` (§5.0b).

Metric: §2.8 on the open stack descends to the coarse space because it is invariant under automorphisms (Faltings–Chai Definition 4.1).

Logarithmic singularities: choose a full symplectic level `n ≥ 3` over `ℂ`. The fine-level toroidal and minimal compactifications are normal analytic varieties, and `π_n : Ā_{g,n} → A^*_{g,n}` is a proper modification isomorphic over `A_{g,n}`. Put `L_n = q_n^*L` for the finite surjective level-forgetting map `q_n : A^*_{g,n} → A_g^*` of §5.0b; its inverse-image boundary is `A^*_{g,n} ∖ A_{g,n}`. The identifications of §5.0b give `π_n^*L_n ≅ ω̄_G^{⊗m}` on the whole toroidal compactification, and the metric there on the abelian open is the `m`-th tensor power of §5.3's Faltings metric. Modification descent in §5.1 therefore gives logarithmic growth on the fixed extension `L_n`. The universal-family comparison is an isometry over `A_{g,n}`, identifying this metric with `q_n^*` of the coarse modular metric. Apply `HermitianMetric.hasLogSingularities_iff_pullback_of_finite_surjective` to descend the estimate to `L` on `A_g^*`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 167; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.10, p. 31.

*Needs:* §2.8; §5.3; §5.1; **PELModuli** §M6.3 (`siegelStack`); **PELModuli** §M6.5 (`coarseModuli`); **PELModuli** §M6.9 (`PELModuli.hodgeLine`); §5.0b.

**Checks.**

- `SiegelModuli.modularLineBundle_g1_norm`: For `g = 1`, the integral discriminant section `Δ` of `ω̄^{⊗12}` (`q`-expansion `q∏(1 − qⁿ)^{24}` for `2πi dz`) has `‖Δ‖_Fal^{⊗12}(τ) = (2π)^{12}|η(τ)^{24}|(Im τ)^6`, that is `|g₂³ − 27g₃²|(Im τ)^6` for the lattice `ℤ + τℤ`; the value `|η(τ)^{24}|(Im τ)^6` would shift the height of `j(E)` by `12 log 2π`.
- `SiegelModuli.modularLineBundle_ample_nonexample`: For boundary contraction fibres of positive dimension, `ω̄` has degree zero, so it cannot be ample on a toroidal compactification. Ampleness is the property of the descended power on the minimal compactification; genus one has no such positive-dimensional contraction fibre.
- `SiegelModuli.modularMetric_continuous_nonexample`: The metric does not extend continuously to the boundary: `‖dz‖² = Im τ → ∞` at the cusp.
- `SiegelModuli.modularLineBundle_g0`: For `g = 0` the moduli space is `Spec ℤ` and `L̄` is trivial.
- For `g = 1` over `ℂ` and `j ≠ 0, 1728`, the principally polarized elliptic curve has the nonidentity automorphism `[−1]`, which maps to the identity on the coarse `j`-line. It acts by `−1` on the Hodge fibre and by 1 on its twelfth power. Thus the line with `m = 12` descends while the stack-to-coarse map still has inertia and is not an isomorphism over the open. The finite map from a fine level replaces this map in the growth argument.
- For `g = 1: A₁^* = ℙ¹_ℤ` (the `j`-line) and `L = O(1)` with `m = 12`, the section of `O(1)` at `j = ∞` corresponding to the discriminant section `Δ` of `ω̄^{⊗12}` (`q`-expansion `q∏(1 − qⁿ)^{24}` for the canonical differential `2πi dz` of the Tate curve). Its Faltings norm at `τ` is `(2π)^{12}|Δ(τ)|(Im τ)^6` with Mathlib's `Δ = η^{24}`, which gives both the archimedean term and the `−12 log 2π` of §2.9.

### 5.5 The modular height of a moduli point is `m` times the stable Faltings height

Let `(A, λ)` be a principally polarized abelian variety of dimension `g` over a number field `K` and `x_A ∈ A_g(K)` its moduli point. Then `h_{L̄}(x_A) = m·h_st(A)`, where `h_{L̄}` is the height of §1.12 for the metrized modular line bundle (computed on `A_g^*` over `ℤ` with the logarithmically singular metric). More precisely, if `A` has semistable reduction over `K` with semi-abelian model `𝒢` over `O_K, x_A` extends to `x̄ : Spec O_K → A_g^*`. After a further finite extension if needed for a toroidal stack lift, the pullbacks of `x̄^*L̄` and `ω̄̂(𝒢)^{⊗m}` are isometric: the two-sided commensurability of the modular line bundle and the Hodge line holds with no correction. For a point `y` of a fine level-`n` space `A_{g,n} (n ≥ 3)` with `image x` in `A_g`, the pulled-back metrized line bundle gives the same value: `h(y) = h_{L̄}(x) = m·h_st(A_y)`.

`(A, λ)` principally polarized; the identity is for the stable height (the relative height `h(A/K)` can be larger at non-semistable primes). The integral structure is the one of `A_g^*` over `ℤ` of §5.4; another projective model changes `h_{L̄}` by `O(1)` (§1.12).

Extend `K` so that `A` is semistable (§3.4); `h_{L̄}` is unchanged by field extension (§1.12).

The coarse moduli point extends by properness of `A_g^*`. Apply the valuative properness contract for the toroidal stack, allowing a further finite extension for a stack lift and a compatible cone decomposition. The pulled-back universal semi-abelian scheme is the Néron identity component by the uniqueness contract in §3.2. Both normalized heights are unchanged by this extension.

Pull back `π^*L ≅ ω̄_G^{⊗m}: x̄^*L ≅ ω̄_𝒢^{⊗m}` as `O_K`-modules (the imported Hodge-line base change), and the metrics agree at every `σ` by construction.

Hence `deg^ x̄^*L̄ = m·deg^ ω̄̂(𝒢)`, so `h_{L̄}(x_A) = m·h(A/K) = m·h_st(A)`.

Alternative route without integral compactifications (Faltings 1983 §2, Deligne 1.13–1.17): pass through stable curves and Gabber's lemma to get `e·ρ^*M ⊂ ω^{⊗r} ⊂ e^{−1}ρ^*M` with a uniform `e`, which only gives equality up to `O(1)`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Proposition 1.12 and its discussion, p. 32, and §1.17, p. 33; [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §2, Korollar to Lemma 2, pp. 352–353.

*Needs:* §5.4; §1.12; §1.10; the imported Hodge-line interface; §2.4; §3.4; §3.2; §5.0b; §2.0; **PELModuli** §M6.10 (`PELModuli.hodgeLine_classify`).

**Checks.**

- For `g = 1` and `E/ℚ` semistable, `h_{O(1)}(j(E))` with the metric `‖Δ‖(τ) = (2π)^{12}|Δ(τ)|(Im τ)^6` on the discriminant section (Mathlib's `Δ = η^{24}`) equals `12·h_Fal(E)`, which is §2.9 (`log N Δ_min` is the finite part of the degree).

### 5.6 Northcott and a lower bound for the stable height of principally polarized varieties

For every `g ≥ 1`: (i) there is `c(g) ∈ ℝ` with `h_st(A) ≥ c(g)` for every principally polarized abelian variety of dimension `g` over a number field; (ii) for all `t ∈ ℝ` and `D ≥ 1`, the set of moduli points `x ∈ A_g(ℚ̄)` with `[ℚ(x):ℚ] ≤ D` and `h_st(A_x) ≤ t` is finite, `i.e`. there are finitely many `ℚ̄`-isomorphism classes of principally polarized `(A, λ)` of dimension `g` whose moduli point has degree at most `D` and whose stable height is at most `t`.

Finiteness is for moduli points (`ℚ̄`-isomorphism classes, field of moduli of bounded degree); passing to `K`-isomorphism classes is FaltingsFinitenessAndIsogenyTheorems R28.1.

By §5.5, `m·h_st(A_x) = h_{L̄}(x)`.

`L̄` is ample with a metric with logarithmic singularities (§5.4), so §5.2 gives a lower bound and Northcott for bounded degree.

The field of moduli of `(A, λ)` is the residue field of `x` (PELModuli §M6.6), so 'moduli point of degree `≤ D`' is the bounded-degree condition.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Proposition 4.6, p. 169; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Lemme 1.6, p. 29, and Lemme 1.20, p. 34.

*Needs:* §5.5; §5.2; §5.4; **PELModuli** §M6.6 (`fieldOfModuli`).

**Checks.**

- For `g = 1`: finitely many `j ∈ ℚ̄` of degree `≤ D` with `h_st(E_j) ≤ t`, consistent with `h_st ≥ h(j)/12 − O(log)` and Northcott for `h(j)`.

### 5.7 The theta height of a principally polarized abelian variety

Let `(A,L)` be principally polarized over `ℚ̄` with `L` symmetric and ample, and let `r ≥ 2` be even. Use Pazuki’s good translated basis of `H⁰(A,L^{⊗r²})`: choose a rigidification and `[r]^*L ≅ L^{⊗r²}`, a nonzero `s ∈ H⁰(A,L)`, good theta-group lifts `i_x` for `x ∈ A[r²]`, and representatives `Γ` of `A[r²]/A[r]`. Put `s_x = i_x ∘ t_x^* ∘ [r]^*s` for `x ∈ Γ`. There are `r^{2g}` sections and they form a basis; `r² ≥ 4` gives a projective embedding `Θ : A → ℙ^{r^{2g}−1}`. Define `thetaNullPoint = [s_x(0)]` and `thetaHeight = h_FS(thetaNullPoint)`, the absolute logarithmic height using the Fubini–Study metric at infinity and the sup metric at finite places. Changing the good lifts, representatives, rigidification or section changes this basis by a common scalar, a permutation and roots of unity (of order dividing `r⁴`). These preserve the projective height at every place, so `thetaHeight` depends only on the geometric isomorphism class of `(A,L)` and on `r`. The assertion applies to these good translated bases; it does not assert invariance under arbitrary Heisenberg theta structures or arbitrary archimedean unitary matrices.

`r ≥ 2` even, so `L^{⊗r²}` is very ample `(r² ≥ 4)`; `L` symmetric defining the principal polarization.

Provide the following maps and identities.

- `AbelianVariety.thetaNullPoint`: `Θ(0) = [s_x(0)]` for a Pazuki good translated basis at the fixed even level `r`. The representative point is defined modulo scalar, phase and permutation changes.
- `AbelianVariety.thetaHeight`: `h_Θ(A, L) = h_FS(Θ(0))`.
- `AbelianVariety.thetaHeight_nonneg`: `h_Θ(A, L) ≥ 0`.
- `AbelianVariety.thetaHeight_congr`: `thetaHeight` is unchanged under geometric isomorphism of `(A,L)` and under the permitted good-basis choices, with `r` fixed.

Use the theta group and the canonical isomorphism `[r]^*L ≅ L^{⊗r²}` from **AbelianSchemesAndArithmeticModuli** §§A3.6 and A1.5. Translation by `r²`-torsion produces the sections; the canonical `A[r]`-subgroup identifies representatives differing by `A[r]`. The good-lift relation is the rigidified translation compatibility of Pazuki §2.3, pp. 7–9.

Prove the resulting `r^{2g}` sections are a basis and calculate changes of the choices as monomial matrices with root-of-unity entries, up to a common scalar. A root of unity has absolute value 1 at every finite and infinite place, and permutations preserve both the sup and `ℓ²` norms. Common scaling cancels by the product formula.

Evaluate at the origin, then apply §1.14’s field-independent absolute Fubini–Study height. No arbitrary unitary change-of-basis assertion is needed.

The source identifications are [Pazuki](https://arxiv.org/abs/0907.1458v2), §2.3.3–2.3.4, Definition 2.6, p. 9 (arXiv v2).

*Needs:* **AbelianSchemesAndArithmeticModuli** §A3.6 (`ThetaGroup`); **AbelianSchemesAndArithmeticModuli** §§A3.1–A3.7; §1.14; **DiophantineApproximationAndTranscendence** §0.2 (absolute tuple and scalar heights); **AbelianSchemesAndArithmeticModuli** §A5.8 (`SiegelFamily`).

**Checks.**

- `AbelianVariety.thetaHeight_level_dependence`: `h_Θ` depends on `r`; the comparison constants of §5.8 depend on `(g, r)`.
- `AbelianVariety.thetaHeight_elliptic`: For `g = 1, r = 2`, use the four half-characteristic constants `θ_(a,b)(τ,0), a,b ∈ {0,½}`, including `θ_(½,½)(τ,0)=0`. The raw Mumford coordinates `θ_(m,0)(4τ,0), m ∈ (¼)ℤ/ℤ`, use a different basis related by a Fourier transform. They cannot replace the good translated-basis coordinates in `thetaHeight` without computing the finite-place correction. Neither system consists of four second-order constants at `2τ`.
- At `τ=i`, put `a=2^(−1/4)`. The half-characteristic point is `[1:a:a:0]`, while the raw Mumford point is `[1+a:a:1−a:a]`. At every embedding their squared `ℓ²` norms differ by factor 2; both have finite height contribution `¼ log 2`. The raw Mumford FS height is therefore larger by `½ log 2`.
- `AbelianVariety.thetaHeight_sup_nonexample`: Using the sup-norm Weil height of `Θ(0)` instead of the `ℓ²` height changes `h_Θ` by up to `½ log(r^{2g})`.
- `AbelianVariety.thetaHeight_product`: For a product of principally polarized varieties with product theta structures, `Θ(0)` is the Segre product and `h_Θ` is additive.
- `AbelianVariety.thetaHeight_unitary_nonexample`: The real orthogonal matrix `(1/5)[[3,4],[−4,3]]` sends `[1:0]` to `[3:−4]`. Both vectors have the same archimedean `ℓ²` norm after scaling, but their absolute FS heights are 0 and `log 5`. An arbitrary unitary matrix need not preserve finite-place sup norms.
- Over `ℂ` with `A(ℂ) = ℂ^g/(ℤ^g + τℤ^g)`, the good translated-basis coordinates of `Θ(0)` are the theta constants `θ_(m₁,m₂)(τ,0)`, with `m₁,m₂ ∈ ((1/r)ℤ/ℤ)^g` (Pazuki, §2.3.4, p. 10, arXiv v2).

### 5.8 Comparison of theta height and stable Faltings height

Let `(A, L)` be a principally polarized abelian variety of dimension `g ≥ 1` over `ℚ̄` with `L` symmetric, `r ≥ 2` even, `K` a number field of definition and `τ_σ ∈` Siegel's fundamental domain with `A_σ(ℂ) ≅ ℂ^g/(ℤ^g + τ_σℤ^g)`. In Deligne's normalisation `h_F = h_st,Del: m(r, g) ≤ h_Θ(A, L) − ½h_F(A) − (1/(4[K:ℚ]))Σ_σ log det(Im τ_σ) ≤ M(r, g)` with `m(r, g) = g(¼ log(4π) − ½ r^{2g} log r)` and `M(r,g) = (g/4)log(4π) + g log r + (g/2)log(2 + 2^{1+3g/4}/3^{1/4})`. Consequently, with `h_Θ⁺ = max(h_Θ, 1)` and `h_F⁺ = max(h_F, 1): |h_Θ(A, L) − ½h_F(A)| ≤ C₁(g, r) log(h_Θ⁺ + 2)` and `|h_Θ⁺ − ½h_F⁺| ≤ C₂(g, r) log(min(h_Θ⁺, h_F⁺) + 2)`, with `C₁ = 6r^{2g} log(r^{2g}), C₂ = 1000 r^{2g}(log r^{2g})^5`. In particular a bound `h_F(A) ≤ H` (Deligne's normalisation; `h_F = h_st,Fal + (g/2) log π`) gives `h_Θ ≤ B/2 + C₂ log(B + 2)` with `B = max(H, 1)`. The matrix bound is `[K:ℚ]^{−1}Σ_σ |log det(Im τ_σ)| ≤ C(g) log(max(h_Θ,1)+2)`, with `C(g) = (8g/π)(1+2g² log(4g))`. Replacing the logarithm in the first comparison by `log(max(h_Θ⁺,h_F⁺)+2)` gives a weaker bound with the same `C₁`. All these heights use the same fixed even `r` and the Deligne normalization.

Principal polarization by a symmetric `L`; constants depend only on `(g, r)`. The bound on `Σ_σ |log det Im τ_σ|` by `C(g) log(max(h_Θ, 1) + 2)` is Masser's matrix lemma, made explicit by David–Philippon (Pazuki Remark 1.2).

Construct the following arithmetic package before the comparison, for the symmetric principally polarizing line `L` and the fixed even `r`. These are targets of this section. A cubist hermitian line has a rigidification at zero and a norm-one trivialization of its alternating cube bundle on the triple product, satisfying the symmetry and cocycle identities (Pazuki §3.1). After a finite extension, construct a Moret–Bailly model of `(A,L,A[r²])`: a smooth separated semistable group scheme, possibly with disconnected fibres, a cubist hermitian extension of `L`, sections extending the `r²`-torsion points, and a finite flat closure of the theta kernel `K(L^{⊗2})`. Prove existence, independence up to the induced integral isometries, and compatibility with finite extension as in Definition 3.1 and Theorem 3.4(i), (iii)–(iv). The zero-section pullback is the unit metrized line by the cubist rigidification; no general Néron–Tate-height theory is needed for this specialization.

Construct the locally free pushforwards `E = π_*ℒ^{⊗r²}` and `π_*ℒ` with their `L²` metrics for probability Haar measure. For either ample cubist line `ℳ` in this model, with `ρ = rank π_*ℳ`, prove the key degree identity `deg^(π_*ℳ)/(ρ[K:ℚ]) = −½h_F(A) + ¼ log(ρ/(2π)^g)` (Theorem 3.4(v)). Extend the good translation maps integrally and isometrically, obtaining `F = image((π_*ℒ)^{⊕r^{2g}} → E)`, generically all of `E` (Proposition 5.1). The full section system generates `ℒ^{⊗r²}` on the subgroup containing the torsion sections, in particular at the origin (Theorem 3.4(vi)).

For `F` and `E` define their base-point ideals by the images of evaluation, `β_𝔭` as the lengths after pullback to the zero section, and `β_σ = −½ log Σ_i ‖u_i(0)‖²` for an `L²`-orthonormal basis of `F_σ` (Pazuki §4.1, equations (5)–(6)). Prove the intrinsic/projective degree identity and the index bound for `F ⊂ E` (Propositions 4.1–4.2). Specializing Lemma 5.2 to the origin gives

```text
0 = h_Θ(A,L) − ½h_F(A) − (g/4)log(2π)
    + (Σ_𝔭 β_𝔭 log N𝔭 + Σ_σ β_σ)/[K:ℚ].
```

Prove the finite-place estimates of Proposition `5.3: β_𝔭(E,0)=0` and `0 ≤ [K:ℚ]^{−1}Σ_𝔭 β_𝔭(F,0) log N𝔭 ≤ (g/2)r^{2g}log r`. Prove Lemma 5.4's expression for `β_σ` as a sum of squared normalized theta values over `(1/r)Λ/Λ`. Prove Proposition 5.5's lower and upper estimates on this sum, with `c(g) = (2+2^{1+3g/4}/3^{1/4})^g`. Substitution in the origin identity gives precisely the displayed `m(r,g)` and `M(r,g)`.

Prove the explicit matrix lemma bound of Remark 1.2 with the displayed `C(g)`, then combine it with Theorem 1.1 to get Corollary 1.3 with the displayed `C₁` and `C₂`.

Translate normalisations with §2.7 (Pazuki uses `(2π)^{−g}i^{g²}`).

Prove `AbelianVariety.thetaHeight_northcott` after these comparisons: for fixed `(g,r)`, bounded `h_Θ` and bounded degree of a field of definition give finitely many geometric classes of `(A,L)`. Corollary 1.3(1) bounds `h_st,Del` above, and §5.6 gives finitely many principally polarized geometric classes. For a fixed principal polarization, its symmetric representing lines form a finite `A[2]`-torsor over `ℚ̄`. This proof uses only the construction and choice-invariance from §5.7 as inputs to the comparison.

The source identifications are [Pazuki](https://arxiv.org/abs/0907.1458v2), Theorem 1.1, Remark 1.2, Corollary 1.3, pp. 2–3; Definition 3.1 and Theorem 3.4, §§3.1–3.2, pp. 10–13; Propositions 4.1–4.2, pp. 13–16; §5.1, Proposition 5.1 and Lemma 5.2, pp. 16–18; §5.2, Propositions 5.3 and 5.5, Lemma 5.4 and §5.2.1, pp. 18–20 (arXiv v2); §2.2, pp. 6–7.

*Needs:* §5.7 (theta construction and choice-invariance); §3.4; §2.7; §2.2; §2.0; §§1.1–1.6; §1.14; §5.2; §5.6 (for theta Northcott only); **AbelianSchemesAndArithmeticModuli** §§A1.5 and A3.6 (`ThetaGroup`); **NeronModelsAndSemistableAbelianVarieties** §3.10 (semistable reduction after finite extension).

**Checks.**

- Pazuki's Remark 1.4 deduces `h_F(A) ≥ −C(g) log C(g) − M(r, g)`; Bost's explicit linear bound is `h_F ≥ −(g/2) log(2π)` in this normalisation.
- On a Moret–Bailly model the zero-section pullback of `ℒ` is integrally isometric to the unit line, so the left side of the origin identity is exactly zero. Generation by `E` at zero gives `β_𝔭(E,0)=0`; replacing `F` by `E` without its lattice index would lose the upper bound `(g/2)r^{2g}log r`.
- After a finite extension `K′/K`, the degrees and the total weighted evaluation terms multiply by `[K′:K]`, while the normalized identities and constants `m, M, C₁` and `C₂` stay unchanged.
- If `h_Θ ≤ T`, Corollary 1.3(1) gives `h_st,Del ≤ 2T+2C_1 log(max(T,1)+2)`. Section 5.6 then gives finiteness of the principally polarized geometric classes.
- In the local evaluation API over a DVR `R` with uniformizer `π`, take `E = R⁴` and `F = πR e₁ ⊕ R e₂ ⊕ R e₃ ⊕ R e₄`, with evaluation in the unit line selecting the first coordinate. The image ideals are `R` and `(π)`, so `β(E) = 0` and `β(F) = 1` although the generic section spaces agree; `length(E/F) = 1` makes the index bound sharp.
- For an `L²`-orthonormal complex section basis whose evaluation vector in a unit frame is `(1,1,0,0), β_σ = −½ log 2`. Omitting the factor `½` gives `−log 2`. With evaluation vector `(1,2,0,0)` the value is `−½ log 5`; summing norms instead of squared norms would give `−½ log 3`.
- At good reduction and a prime not dividing `r`, the good translation maps give an integral basis, `F = E` locally, and `β_𝔭(F,0) = 0`. For example, over an unramified extension `R` of `ℤ₅` splitting `E[4]` for `E : y² = x³ − x` and `r = 2`, the abelian scheme with its rigidified principal line satisfies the finite-place conditions of a Moret–Bailly model: all 4-torsion sections extend and the theta kernel of `L^{⊗2}` is `E[2]`, finite étale of rank four.
- On `ℂ/(ℤ+iℤ)`, multiply a cubist norm by `exp(f(z))`, where `f(z) = cos(2π Re z) − 1`. The zero-section norm is unchanged. For `D₃(L) = ⊗_{I≠∅}(sum_I^*L)^{⊗(−1)^|I|}`, the logarithm of the norm of its trivialization `D₃(L) → O` changes at `P = Q = R = 1/6` by `f(1/2) − 3f(1/3) + 3f(1/6) = 1`. Thus the perturbed norm is not cubist despite its unit rigidification.
- For the trivial unit-metrized line on `ℂ/(ℤ+2iℤ)`, the constant section 1 has `L²` norm one for probability Haar measure. Using ordinary area measure gives squared norm two. On `ℂ/(ℤ+iℤ)` both measures give squared norm one, so the rectangular torus distinguishes the normalization.

### 5.9 The stable Faltings height of an elliptic curve and `h(j)`

For every elliptic curve `E` over `ℚ̄` with `j`-invariant `j, h_st(E) ≤ h(j)/12 + 3` in Faltings' normalisation (Bilu–Parent–Rebolledo's `h_F`), where `h` is the absolute logarithmic Weil height; Gaudron–Rémond prove `h_st,Del(E) ≤ h(j)/12 + 2.95` in Deligne's normalisation, which is stronger since `h_st,Fal = h_st,Del − ½ log π`. More precisely, for `E` semistable over `K, 12·h_st,Fal(E) = h(j) − (1/[K:ℚ]) Σ_σ log(max(1, |j(τ_σ)|)·|Δ(τ_σ)|·(Im τ_σ)^6) − 12 log(2π)`, and the function `U(τ) = max(1, |j(τ)|)|Δ(τ)|(Im τ)^6` is bounded below by a positive constant on Siegel's fundamental domain.

`E` over a number field `K`; for the identity, semistable over `K` (pass to an extension).

Semistable case: at every prime `v(Δ_min) = max(0, −v(j))`, so `log N(Δ_{E/K}) = Σ_𝔭 log max(1, |j|_𝔭)·`(local degree), the finite part of `[K:ℚ]h(j)`.

Substitute in §2.9 and write the archimedean part of `h(j)` as `Σ_σ log max(1, |j(τ_σ)|)`.

Lower bound for `U` on the fundamental domain: `|Δ(τ)| ≥ e^{−1/9}e^{−2π Im τ}` and `|j(τ)| ≥ e^{2π Im τ} − 1193` (Faisant–Philibert), so `U(τ) ≥ e^{−1/9}min_y f(y)` with `f(y) = max(y^6 e^{−2πy}, y^6(1 − 1193e^{−2πy}))`; prove a uniform positive lower bound for this maximum on `y ≥ √3/2`, sufficient for the constants 3 and 2.95 in the displayed height inequalities. The two branches agree at `y = log(1194)/(2π)`; their derivative signs and exact endpoint inequalities give the required analytic bound.

Normalisation: Gaudron–Rémond's `h` is `h_Del`; subtract `½ log π` for `h_Fal`.

The source identifications are [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), Lemme 7.9 and its proof, pp. 32–33 (arXiv v1); [Bilu–Parent–Rebolledo](https://aif.centre-mersenne.org/item/10.5802/aif.2781.pdf), Proposition 4.4(ii) and the following paragraph, p. 971.

*Needs:* §2.9; §3.4; §2.7; **DiophantineApproximationAndTranscendence** §0.2 (absolute tuple and scalar heights); Mathlib `ModularForm.discriminant`.

**Checks.**

- For `E = 11.a2, h_st,Fal(E) ≈ −0.308` and `h(j)/12 = log(122023936)/12 ≈ 1.552`, consistent with the bound.
- As a worked numerical check, the fundamental-domain values are `U ≈ 0.0020239` near `τ ≈ −½+0.8944i` with `j=−1`, and `U ≈ 0.0020272` at `j=0`. The first value suggests envelopes `h_Fal−h(j)/12 ≈ −1.3210` and `h_Del−h(j)/12 ≈ −0.7486`. These two values do not characterize a global minimum or an equality case for either envelope. The uniform inequalities have the constants 3 and 2.95. The minimum of the stable elliptic Faltings height itself occurs at `j=0`, approximately `−1.3211` (Faltings) or `−0.7488` (Deligne), as described by Deligne, Remark 1.5.

### Examples

At `q=0, −log|q|` and its square root satisfy logarithmic bounds, whereas `|q|^(−1/2)` does not. A zero or negative function is not a frame norm. For `g=1` the modular discriminant section has norm `(2π)^12|Δ(τ)|(Im τ)^6`, so its point height is exactly 12 times the stable Faltings height. At theta level `r=2` use the four half-characteristics at `τ`, including the vanishing odd constant. The `j`-height comparison is an upper estimate and cannot by itself turn a Faltings upper bound into a `j`-height upper bound.

### Dependencies

Layers 1–3; AbelianSchemesAndArithmeticModuli A3/A5; DiophantineApproximationAndTranscendence §§0.2–0.3; ComplexComparisonPartII §§C−1.1, C0.4 and C5.1; SchemeAndStackFoundations §4.17; PELModuli §§M3.9 and M6.3–M6.10; §5.0; Mathlib modular discriminant.

## Layer 6: Finiteness and uniform height bounds

Zarhin’s trick reduces an unpolarized abelian variety to a principally polarized one in dimension `8g`. The height identity and explicit field-degree bounds combine the preceding comparisons into the exact inputs used by arithmetic finiteness theorems.

### 6.1 Zarhin's product

For a polarized abelian scheme `(A, λ)` over `S`, define `AbelianVariety.zarhin` as `Z(A) := (A ×_S A^t)^4`. Use **PadicDifferentialEquationsAndRigidCohomology** §RD.5.116 for the existence of a principal polarization over `S` and for `AbelianVariety.zarhin_dim`, `dim Z(A) = 8 dim A`. Over a field every abelian variety admits a polarization, so this supplies a principally polarized variety over the original field. Section 6.2 proves the arithmetic height identity for this product.

The supplied principal-polarization theorem is used with a polarization `λ` defined over `S`. If `A` only admits a polarization étale locally, its supplied conclusion is correspondingly étale local. No selected principal polarization or its compatibility with base change is needed for the height identity.

The product definition gives `AbelianVariety.zarhin_baseChange`, the natural isomorphism `Z(A)_{S′} ≅ Z(A_{S′})` of underlying abelian schemes, by base change of duals and products. The arithmetic height is independent of the principal polarization chosen on this product.

The source identifications are [Moret-Bailly](https://www.numdam.org/item/AST_1985__129__1_0/), Chapitre IX, §1, Lemme 1.1 and proof §§1.2–1.6, pp. 205–208; [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. I, Lemma 5.5, p. 29.

*Needs:* **PadicDifferentialEquationsAndRigidCohomology** §RD.5.116 (Zarhin's principal polarization and dimension formula); **AbelianSchemesAndArithmeticModuli** §A1.1 (`relativeProductsAndDimension`) and §A2.2 (duals and base change).

**Checks.**

- `AbelianVariety.zarhin_zero`: For the zero-dimensional abelian scheme, `Z(A)` is the trivial group scheme with its unique unit principal polarization and dimension zero.
- For an elliptic scheme `E` with its principal polarization, `Z(E) ≅ E^8` has dimension eight and admits the product principal polarization. The height identity uses only the underlying product.
- `AbelianVariety.zarhin_baseChange_check`: For an elliptic curve over a number field `K` and an extension `L/K, Z(E)_L ≅ (E_L)^8` as abelian varieties. This identifies the product after extension independently of any choice of principal polarization.

### 6.2 Heights through Zarhin's trick

For every abelian variety `A` over `ℚ̄, h_st((A × A^t)^4) = 8·h_st(A)`; if `A` has semistable reduction over `K, h((A × A^t)^4/K) = 8·h(A/K)`. The height of a principally polarized abelian variety does not depend on the principal polarization chosen, so bounds for principally polarized varieties of dimension `8g` give bounds for all abelian varieties of dimension `g`.

The stable identity holds for all `A`; the relative one needs semistability (Néron models of products and duals).

§3.5 gives additivity and duality invariance: `h_st((A × A^t)^4) = 4h_st(A) + 4h_st(A^t) = 8h_st(A)`.

Polarization independence: §3.2.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V §4, p. 169; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Remarque 1.22, p. 35; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), Appendice C, end, p. 155.

*Needs:* §6.1; §3.5; §3.2.

**Checks.**

- If `h_st(A) ≤ t` then the principally polarized `Z(A)` of dimension `8g` has `h_st ≤ 8t`.

### 6.3 Field-degree constants for semistability and level structures

Let `A` be an abelian variety of dimension `g ≥ 1` over a number field `K`. (i) `A` has semistable reduction everywhere over `K(A[12])` (indeed over `K(A[3])` at primes not above 3 and over `K(A[4])` at primes not above 2), and for every integer `n ≥ 1, [K(A[n]):K] ≤ #GL_{2g}(ℤ/nℤ)`. (ii) For a principally polarized `(A, λ)` and `n ≥ 3`, a full symplectic level-`n` structure exists over `K(A[n])`, so `(A, λ)` defines a point of the fine moduli space `A_{g,n}` over `K(A[n]) ⊃ K(μ_n)`, of degree `≤ [K:ℚ]·#GSp_{2g}(ℤ/nℤ)`. (iii) A principally polarized `(A, λ)` over `ℚ̄` whose field of moduli `F` has degree `D` over `ℚ` has a model over an extension `F′` of `F` with `[F′:F] ≤ 2·3^{4g²}`. Hence every quantity in §6.4 depends only on `g`, the degree bound and the height bound.

`n ≥ 3` for rigidity; (iii) in characteristic 0, principal polarization.

(i) NeronModelsAndSemistableAbelianVarieties §3.12 with `N = 3` and `N = 4`; the Galois action on `A[n]` embeds `Gal(K(A[n])/K)` into `GL_{2g}(ℤ/n)`.

(ii) The Weil pairing makes the image symplectic up to similitude, so `Gal(K(A[n])/K) ⊂ GSp_{2g}(ℤ/n)`; a symplectic basis over `K(A[n])` is a level-`n` structure; rigidity at `n ≥ 3` (AbelianSchemes A6).

(iii) PELModuli §M6.8.

The source identifications are [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Lemme 1.23 and §1.24, p. 35.

*Needs:* **NeronModelsAndSemistableAbelianVarieties** §3.12 (`FiniteTorsionSemistability`); **PELModuli** §M6.8 (`boundedFieldOfDefinition`); **AbelianSchemesAndArithmeticModuli** §A6.18 (`polarizedAutomorphisms`); **AbelianSchemesAndArithmeticModuli** §A3.7 (`polarizedWeilPairing`).

**Checks.**

- `AbelianVariety.torsionField_dimZero_nonexample`: The zero abelian variety has trivial torsion and `K(A[n])=K`, so its empty Weil pairing does not force `μ_n` into that field. The cyclotomic-containment assertion is stated in positive dimension.
- For `g = 1, [K(E[12]):K] ≤ #GL₂(ℤ/12) = 4608`.

### 6.4 Finiteness of principally polarized abelian varieties of bounded stable height

For integers `g ≥ 1, D ≥ 1` and `t ∈ ℝ`: (i) there are only finitely many `ℚ̄`-isomorphism classes of principally polarized abelian varieties `(A, λ)` of dimension `g` that are defined over some number field of degree at most `D` and satisfy `h_st(A) ≤ t`; (ii) for `n ≥ 3` and a number field `K`, there are only finitely many `K`-isomorphism classes of triples `(A, λ, ε)` over `K` with a principal polarization `λ`, a level-`n` structure `ε, dim A = g` and `h(A/K) ≤ t`; (iii) the same holds with `h_st` in place of `h` and with Faltings', Deligne's or the unscaled normalisation, the bounds changing by `(g/2)·log π` or `(g/2)·log 2`. The explicit height containment is that the sets are contained in the sets of moduli points of `A_g` of degree `≤ D` (resp. of `A_{g,n}(K)`) with height `≤ m·t` for the metrized modular line bundle.

Finiteness of `ℚ̄`-classes (moduli points); the descent to `K`-isomorphism classes of abelian varieties without level structure, the isogeny-class bound and Shafarevich finiteness are proved in FaltingsFinitenessAndIsogenyTheorems R28.

(i) If `(A, λ)` is defined over `K` of degree `≤ D`, its moduli point lies in `A_g(ℚ̄)` with residue field of degree `≤ D`; §5.6 gives finiteness.

(ii) Level-`n` triples over `K` are `K`-points of the fine space `A_{g,n}` (no automorphisms), so isomorphism classes over `K` inject into `A_{g,n}(K)`; `A_{g,n} → A_g` is finite, heights pull back (§5.4 level API), and `h(A/K) ≥ h_st(A)`; apply (i) with `D = [K:ℚ]`.

(iii) §2.7.

Constants: §6.3 bounds every auxiliary field degree in terms of `g` and `D`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Proposition 4.6(ii), p. 169; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Lemme 1.6, p. 29, and Proposition 1.3, p. 27; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), §2.1.3, Théorème 2.1 ii), p. 119; [Pazuki](https://arxiv.org/abs/0907.1458v2), Definition 2.6 and the following paragraph, p. 9 (arXiv v2).

*Needs:* §5.6; §5.5; §6.3; §2.7; **PELModuli** §M6.5 (`coarseModuli`); **PELModuli** §M6.6 (`fieldOfModuli`).

**Checks.**

- For `g=1`, bounded-degree elliptic curves of bounded stable Faltings height give finitely many `j`-invariants. To deduce the familiar Northcott range from a bound on `h_st` use the lower comparison supplied by the metrized moduli height and §5.2; the upper inequality `h_st ≤ h(j)/12+3` alone cannot bound `h(j)` from above.

### 6.5 A lower bound for the stable Faltings height

For every `g ≥ 1` there is `c(g) ∈ ℝ` such that `h_st(A) ≥ c(g)` for every abelian variety `A` of dimension `g` over `ℚ̄`. Bost’s explicit theorem gives a lower bound linear in `g: h_st,Del(A) ≥ −(g/2) log(2π)` in Deligne's normalisation, `h_st,Fal(A) ≥ −(g/2) log(2π²) > −3g/2` in Faltings'.

Any abelian variety (no polarization needed, through Zarhin's trick). The linear estimate is Bost’s theorem as recorded by Pazuki, Remark 1.4, and Gaudron–Rémond, Polarisations et isogénies §9. It is not asserted to be the best possible lower bound. The existence and an effective non-sharp constant also follow from the moduli and theta arguments below.

Principally polarized case: §5.6 (i) gives `c′(g)` with `h_st ≥ c′(g)`.

General case: §6.2 gives `h_st(A) = h_st(Z(A))/8 ≥ c′(8g)/8`.

For the explicit linear bound, prove Gaudron–Rémond, Périodes, Theorem 8.1 and Lemma 8.2, pp. 34–37. For a principally polarized `A` over a number field `K` enlarged to admit a Moret–Bailly model as in §5.8, choose period matrices `τ_σ` in Siegel's fundamental domain, put `Y_σ = Im τ_σ` and

```text
F_σ(τ_σ p+q) = det(2Y_σ)^(1/4)
               · Σ_{n∈ℤ^g} exp(iπ(n+p)^t τ_σ(n+p) + 2iπ n^t q),
```

for real `p,q`. Its absolute value is periodic in `p,q`. Prove `∫_{(ℝ^g/ℤ^g)^2}|F_σ|² dp dq = 1` and

```text
−½(h_st,Del(A)+(g/2)log(2π))
  ≤ [K:ℚ]^(−1) Σ_σ ∫_{(ℝ^g/ℤ^g)^2} log|F_σ| dp dq.
```

The `L²` identity follows by integrating the Fourier series in `q` and then the Gaussian in `p` (Lemma 8.2); the lower estimate is the normalized theta-integral inequality of Theorem 8.1, proved using cubist theta sections and their arithmetic degrees. The arithmetic cubist-model and degree package is §5.8. Jensen's inequality makes each logarithmic integral at most zero, giving Corollary 8.4, p. 37: `h_st,Del(A) ≥ −(g/2)log(2π)`. Section 6.2 extends the bound to arbitrary `A` through `Z(A)`, and §2.7 gives the Faltings normalization.

For an effective non-sharp alternative, Bost's Appendix C bounds `h_F` from below through second-order theta constants (Proposition C.2 and the reduction theory estimates), then Zarhin and duality invariance.

Normalisation translation: §2.7 `(h_Fal = h_Del − (g/2) log π)`.

The source identifications are [Faltings–Chai](https://doi.org/10.1007/978-3-662-02632-8), Ch. V, Proposition 4.6(i), p. 169; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), Lemme 1.21 and Remarque 1.22, p. 35; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), Théorème 2.1 i), p. 119, and Appendice C, Proposition C.2, pp. 154–155; [Gaudron–Rémond, Périodes](https://arxiv.org/abs/1105.1230v1), Theorem 8.1, Lemma 8.2, pp. 34–35, and Corollary 8.4, p. 37 (arXiv v1); [Pazuki](https://arxiv.org/abs/0907.1458v2), Remark 1.4, p. 3 (arXiv v2); [Tsimerman](https://arxiv.org/abs/1506.01466v5), Theorem 2.1, p. 3 (arXiv v5); [Gaudron–Rémond, Polarisations](https://lmbp.uca.fr/~gaudron/art13.pdf), §9 (Conclusion des démonstrations), p. 2101.

*Needs:* §5.6; §5.8 (cubist-model and theta-section degrees); §6.2; §2.7.

**Checks.**

- For `g = 1` the minimum of `h_st,Del` over elliptic curves is attained at `j = 0` (Deligne Remarque 1.5), about `−0.749`, which is above `−½ log(2π) ≈ −0.919`.
- For the empty theta product in dimension zero, `F_σ = 1, ∫log|F_σ| = 0` and `∫|F_σ|² = 1`; the bound is `0 ≥ 0`.
- Dividing the bound `h_st,Del(Z(A)) ≥ −(8g/2)log(2π)` by 8 gives the same linear constant in dimension `g`. The normalization shift then gives `−(g/2)log(2π²)` in Faltings' convention.

### 6.6 The height inputs to Faltings' finiteness theorems

For a number field `K` and `g ≥ 1` the following package is exported to FaltingsFinitenessAndIsogenyTheorems: (a) the stable and relative Faltings heights with `h(A/K) ≥ h_st(A) ≥ c(g)`; (b) for every `t`, the set of moduli points (in `A_g` or `A_{g,n}`) of principally polarized varieties of dimension `g` over fields of degree `≤ D` with `h_st ≤ t` is finite, with all field degrees bounded by §6.3; (c) every abelian variety `A` of dimension `g` over `K` with `h(A/K) ≤ t` has semistable reduction at all primes of residue characteristic `p` with `log p > [K′:ℚ](t − c(g))`, where `[K′:K] ≤ #GL_{2g}(ℤ/15ℤ)`, so its non-semistable primes lie in a finite set depending on `(K, g, t)`; (d) `h(A × B) = h(A) + h(B), h(A^t) = h(A), h_st(Z(A)) = 8h_st(A)`; (e) the isogeny formula and bounds of Layer 4. The arithmetic bound for all abelian varieties in an isogeny class, the descent from moduli points to `K`-isomorphism classes, and the finiteness of `K`-forms remain theorems of R28.

Exported statements are exactly those of the cited results; nothing about isogeny classes is assumed.

Collect §6.4, §6.5, §3.6, §6.2 and the Layer 4 results.

(c) is §3.6 applied with the lower bound `c = c(g)` of §6.5.

The source identifications are [Faltings, Endlichkeitssätze](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf), §3, Satz 1 and its proof, pp. 356–357; [Deligne](https://www.numdam.org/item/SB_1983-1984__26__25_0/), §1.24, p. 35; [Bost](https://www.numdam.org/item/SB_1994-1995__37__115_0/), §2.1.3, Théorème 2.1, p. 119.

*Needs:* §6.4; §6.5; §3.6; §6.2; §4.4; §4.2; §4.3.

**Checks.**

- For multiplication by `n ≠ 0` on a `g`-dimensional `A`, the exported isogeny formula has `d = |n|^{2g}` and `N𝔡 = |n|^{g[K:ℚ]}`, so its height change is zero. The value `n = 0` is excluded because the map is not an isogeny in positive dimension.
- For `E/ℚ`, the semistable extension may be chosen with degree at most 4608 using `E[12]`. Applying the local non-unit determinant argument of §3.6 to this extension gives semistability at every `p` with `log p > 4608(t − c(1))` when `h(E/ℚ) ≤ t`. This conclusion permits multiplicative reduction: for example, `11.a2` is semistable with a multiplicative fibre at 11.
- Quadratic twists of an elliptic curve have the same geometric moduli point and stable height. The exported geometric finiteness alone therefore supplies no bound on the number of `ℚ`-forms; the downstream descent needs the relative-height and non-semistable-prime bounds.

### Examples

For an elliptic curve `Z(E)=E⁸` and `h_st(Z(E))=8h_st(E)`. The torsion extension bound at level 12 is `#GL₂(ℤ/12ℤ)=4608`. In dimension one the minimum stable height at `j=0` is about `−1.3211` in Faltings normalization, while Bost’s stated linear bound is weaker. Finiteness of geometric polarized classes does not imply finiteness of all forms over a fixed field without the descent supplied downstream.

### Dependencies

Layers 3–5; AbelianSchemesAndArithmeticModuli A2/A3/A6; NeronModelsAndSemistableAbelianVarieties §§3.1–3.12; PELModuli §§M6.3–M6.10. This layer exports to FaltingsFinitenessAndIsogenyTheorems rather than depending on it.

## Downstream consumers

FaltingsFinitenessAndIsogenyTheorems, Layers R28.1–R28.2, imports the metric, relative and stable heights, logarithmic Northcott comparison, modular-height identity, isogeny formula and denominator bounds. Its global determinant and descent arguments use these results through §6.6. The local terms along divisible towers are the height side of that argument, not a substitute for its Hodge–Tate input.

GrossZagierAndArithmeticHeights uses the hermitian degree and arithmetic-divisor pairing, including proper cycles inside a non-proper arithmetic scheme. HilbertModularVarietiesAndShimuraCurves uses the metrized arithmetic Hodge line. CM height developments use the Deligne normalization, the hermitian dual pairing and the integral component-line convention. Period and isogeny bounds use the metric dictionary and degree estimates; uniform Bogomolov applications use the stable height of a Jacobian, whose determinant metric is identified in Szpiro, Lemma 3.2.1, p. 26, and Yuan, Lemma 3.4, pp. 43–44.

## References

Page numbers below are printed page numbers for published scans and page numbers of the stated arXiv version for preprints. Individual targets give the theorem or section locator. The mathematical statements above use their own formulation and the fixed conventions of this roadmap.

- Pierre Deligne. [Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)](https://www.numdam.org/item/SB_1983-1984__26__25_0/). Séminaire Bourbaki exp. 616 (1983/84), Astérisque 121–122 (1985), 25–41.
- Gerd Faltings. [Endlichkeitssätze für abelsche Varietäten über Zahlkörpern](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf). Invent. Math. 73 (1983), 349–366 (GDZ scan).
- Gerd Faltings. [Arakelov's theorem for abelian varieties](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0025.pdf). Invent. Math. 73 (1983), 337–347 (GDZ scan).
- Gerd Faltings and Ching-Li Chai. [Degeneration of Abelian Varieties](https://doi.org/10.1007/978-3-662-02632-8). Ergebnisse der Mathematik (3) 22, Springer 1990.
- Michel Raynaud. [Hauteurs et isogénies](https://www.numdam.org/item/AST_1985__127__199_0/). Séminaire sur les pinceaux arithmétiques: la conjecture de Mordell, Astérisque 127 (1985), exposé VII, 199–234.
- Lucien Szpiro. [Degrés, intersections, hauteurs](https://www.numdam.org/item/AST_1985__127__11_0/). Astérisque 127 (1985), exposé I, 11–28.
- Henri Gillet and Christophe Soulé. [Arithmetic intersection theory](https://www.numdam.org/item/PMIHES_1990__72__93_0/). Publ. Math. IHÉS 72 (1990), 93–174.
- Jean-Benoît Bost. [Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz)](https://www.numdam.org/item/SB_1994-1995__37__115_0/). Séminaire Bourbaki exp. 795 (1994/95), Astérisque 237 (1996), 115–161.
- Laurent Moret-Bailly. [Pinceaux de variétés abéliennes](https://www.numdam.org/item/AST_1985__129__1_0/). Astérisque 129 (1985).
- Éric Gaudron and Gaël Rémond. [Théorème des périodes et degrés minimaux d'isogénies](https://arxiv.org/abs/1105.1230v1). Comment. Math. Helv. 89 (2014), 343–403; arXiv:1105.1230v1.
- Éric Gaudron and Gaël Rémond. [Polarisations et isogénies](https://lmbp.uca.fr/~gaudron/art13.pdf). Duke Math. J. 163 (2014), 2057–2108 (author copy).
- Fabien Pazuki. [Theta height and Faltings height](https://arxiv.org/abs/0907.1458v2). Bull. Soc. Math. France 140 (2012), 19–49; arXiv:0907.1458v2.
- Yuri Bilu, Pierre Parent and Marusia Rebolledo. [Rational points on `X₀^+(p^r)`](https://aif.centre-mersenne.org/item/10.5802/aif.2781.pdf). Ann. Inst. Fourier 63 (2013), 957–984.
- Xinyi Yuan and Shou-Wu Zhang. [On the averaged Colmez conjecture](https://arxiv.org/abs/1507.06903v3). Ann. of Math. 187 (2018), 533–638; arXiv:1507.06903v3 (with the November 2021 erratum appended).
- Jacob Tsimerman. [The André–Oort conjecture for `A_g`](https://arxiv.org/abs/1506.01466v5). Ann. of Math. 187 (2018), 379–390; arXiv:1506.01466v5.
- Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard and Keerthi Madapusi Pera. [Faltings heights of abelian varieties with complex multiplication](https://arxiv.org/abs/1508.00178v3). Ann. of Math. 187 (2018), 391–531; arXiv:1508.00178v3.
- Wei Zhang. [Weil representation and arithmetic fundamental lemma](https://arxiv.org/abs/1909.02697v3). Ann. of Math. 193 (2021), 863–978; arXiv:1909.02697v3.
- Xinyi Yuan. [Arithmetic bigness and a uniform Bogomolov-type result](https://arxiv.org/abs/2108.05625v4). Ann. of Math. 203 (2026), no. 1; arXiv:2108.05625v4.
