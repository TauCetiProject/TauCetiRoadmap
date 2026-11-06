<!--tauceti-status:v1 {"roadmap":"ImaginaryQuadraticClassNumber","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: ImaginaryQuadraticClassNumber

This file documents the status of the ImaginaryQuadraticClassNumber roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** H1 (models, maximal orders, forms, orders of conductor f) is essentially complete, and the class number formula of H2.2 is proved. Several self-contained effective ingredients are proved: Siegel-function identities and bounds, the Heegner quartic, and class number one for the nine fields. The CM theory that would join them (most of H3.1, all of H3.3) is missing, and Siegel's lower bound is only begun. Neither summit is proved.

### Named results

- **The analytic class number formula**: an imaginary quadratic field of discriminant D has h = w√|D| L(1, χ_D)/(2π), from ζ_K(s) = ζ(s) L(s, χ_D) and a residue comparison. ([`TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.html#TauCeti.NumberField.classNumber_eq_card_units_mul_LFunction_one))
- **Class numbers from reduced forms**: the primitive reduced forms of discriminant −n represent each Picard class of the order of that discriminant exactly once. ([`TauCeti.BinaryQuadraticForm.picClass_primitiveReducedForms_bijective`](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/ClassNumber.html#TauCeti.BinaryQuadraticForm.picClass_primitiveReducedForms_bijective))
- **The nine fields have class number one**: for D = −3, −4, −7, −8, −11, −19, −43, −67, −163 the principal form is the only primitive reduced form. This is the converse half of the final theorem. Exhaustion is proved only for D > −51. ([`TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassNumberOne/HeegnerNumbers.html#TauCeti.NumberField.classNumber_eq_one_of_mem_heegnerDiscriminants), [`TauCeti.NumberField.classNumber_eq_one_iff_of_neg_fifty_one_lt_discr`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassNumberOne/SmallDiscriminant.html#TauCeti.NumberField.classNumber_eq_one_iff_of_neg_fifty_one_lt_discr))
- **The integer points of the Heegner quartic**: y² = 2u(u³ + 1) has exactly the solutions (−1, 0), (0, 0), (1, ±2), (2, ±6). Hence the coefficient γ in X³ − γX − 16 lies in {0, −32, −96, −960, −5280, −640320}. ([`TauCeti.sq_eq_two_mul_mul_pow_three_add_one_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassNumberOne/HeegnerQuartic.html#TauCeti.sq_eq_two_mul_mul_pow_three_add_one_iff), [`TauCeti.mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassNumberOne/HeegnerQuartic.html#TauCeti.mem_image_intCast_of_tschirnhausPolynomial_X_pow_four_eq))
- **The SL₂(ℤ) law for Siegel functions**: g_r(γτ) = ε g_{rγ}(τ) with ε a twelfth root of unity. At level two, g₀g₁g₂ = 2ζ₈ and the twelfth powers are the roots of Weber's cubic (X + 16)³ − jX. ([`TauCeti.ModularForm.exists_siegelFunction_smul_eq_mul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/SiegelFunction/Transform.html#TauCeti.ModularForm.exists_siegelFunction_smul_eq_mul), [`TauCeti.ModularForm.prod_X_sub_C_siegelFunction_pow_twelve`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/SiegelFunction/JInvariant.html#TauCeti.ModularForm.prod_X_sub_C_siegelFunction_pow_twelve))

### Notable definitions and infrastructure

- **The order of conductor f** ([`TauCeti.GlobalNumberFields.intAddMulOrder`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/Orders/IntAddMulOrder.html#TauCeti.GlobalNumberFields.intAddMulOrder)), ℤ + f𝓞_K, identified with the order of discriminant f²D. Through the conductor sequence it gives Cox's formula for h(O_f) and the class-number-one orders inside a given field. The thirteen-order corollary needs only the field list.
- **Laurent q-expansions on compactified modular curves** ([`Subgroup.CompactifiedQuotient.laurentQExpansion`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/QExpansion/FunctionField.html#Subgroup.CompactifiedQuotient.laurentQExpansion)), with the q-expansion principle. These define the coefficient fields behind F₁ = ℚ(j).
- **The Weierstrass point map** ([`PeriodPair.weierstrassPoint`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Elliptic/Uniformization.html#PeriodPair.weierstrassPoint)) z ↦ (℘(z), ℘′(z)/2) is a surjective holomorphic homomorphism onto the lattice's Weierstrass curve, with kernel the lattice. That curve has j-invariant j(τ). This is the analytic half of the CM dictionary.

### Roadmap coverage

**H1.1–H1.4 are done** as far as the material shows. **H2.1 is largely done**: it has the primitive χ_D of conductor |D| with its split, inert and ramified values, but χ_D(−1) = sign D is not established here. **H2.2 is done.** **H2.3 is partial**: it has nonnegative coefficients of ζLLL, its poles and residues at 1, and conjugation symmetry, but no Mellin contour or zero-free alternative. **H2.4 is untouched.** **H3.1 is partial**: it has F₁ = ℚ(j), X(1) with function field ℂ(j), the SL₂(ℤ/N) action on the function field of X(N), and the point map. Converse uniformization, isogenies, CM, class fields and the Hilbert class polynomial are missing. **H3.2 is partial**: γ₂, the level-N criterion and integrality are missing. **H3.3 has only its last step**: real algebraic integers of K are rational integers. **H3.4** has its bounds and the enumeration above −51, but the branch exclusions need H3.3's integer norms. **H3.5** is done for the quartic and coefficient calculation; applying it needs H3.3. **H3.6** has the nine-field converse only.

## The frontier

- **γ₂ (H3.2)**: build the holomorphic cube root of j with leading term q^(−1/3) and prove γ₂ = (g_i¹² + 16)/g_i⁴. Weber's cubic gives the cube. Then prove the level-N congruence criterion and integrality over ℤ[j].
- **Siegel's theorem (H2.3–H2.4)**: the Mellin contour, the zero-free alternative and L(1, χ) ≥ c_ε q^(−ε). With the class number formula this gives finiteness.
- **CM theory (H3.1)**: converse uniformization, isogenies, the ideal-lattice equivalence, and the Hilbert class polynomial. This consumes ClassFieldTheory Layers 12–13.
- **Level-two norms (H3.3)**: show x = Norm(α¹²) is an integer satisfying the j-formulas, and prove the small-power inclusion. This needs CM reciprocity from H3.1; after that, H3.4 and H3.5 apply directly.
- **The field theorem (H3.6)**: assemble the branches, recover D from γ₂(τ_D), and specialize the existing order classification to the thirteen orders.
