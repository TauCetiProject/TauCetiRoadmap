# Roadmap: cyclotomic class groups and Stickelberger theory

**Summary.** Build the Galois-module theory of cyclotomic ideal classes, integral Stickelberger annihilation at every conductor, the characterwise Herbrand–Ribet theorem, Kummer's regular-prime criterion and unit lemma, the prime-power circular-unit index, and the Iwasawa growth theorem for cyclotomic class numbers. The construction starts with native `CyclotomicField` number fields and ideal class groups and ends with an unramified inverse-character obstruction suitable for the Eisenstein ideal. All primes and all positive prime-power levels are included; the dyadic tower has its own integral treatment.

## Scope and ownership

This roadmap follows ClassFieldTheory. It owns finite cyclotomic class modules, their arithmetic character conventions, Hilbert's relative-unit and capitulation applications, the Stickelberger element and its integral ideal, Bernoulli annihilators, reflection, the modular construction of the converse to Herbrand, and regularity. Its prime-power circular-unit and norm-limit endpoints specialize the shared arithmetic constructions of IntegralIwasawaTheory. The inverse-character vanishing and its translation to unramified extensions and constant-coefficient étale cohomology are explicit end results.

Mathlib supplies basic cyclotomic fields, integer rings, Dirichlet's unit theorem, ideal norms and class-number finiteness. GlobalNumberFields Layer 10 supplies the cyclotomic ramification and splitting comparisons. NumberFieldArithmetic Layers 4 and 6 supply the different and its ramification criterion. ClassFieldTheory supplies reciprocity, Hilbert class fields, functoriality, the conductor–discriminant formula, and the generic unit and S-unit Herbrand-quotient computations. These are prerequisites, not new targets here. In particular the conductor–discriminant formula is in ClassFieldTheory Layer 13. It is not an additional cyclotomic theorem to develop.

ModularForms supplies modular forms, Fourier expansions, Eisenstein series, Hecke operators and integral Hecke modules. The residual eigencharacter lifting comparison is supplied in §4.2 below. ModularCurves supplies the modular curves, their integral moduli geometry, finite locally free group schemes and the finite connected–étale sequence. Section 4.3 specifies a shared field-valued abelian package and the shared Albanese modular quotient; its cyclotomic application takes the coefficient factor of that quotient's native Tate module. Section 4.4 specifies the shared small-ramification and Barsotti–Tate comparisons, followed by the prime-level good-reduction and local-splitting applications. These general prefixes precede the residual lattice application and use no Herbrand–Ribet converse. A residual extension with its desired ramification is not assumed as input.

The classical Ribet lattice target in IntegralHeckeAndGaloisDeterminants §1.4 supplies the choice of an oriented nonsplit reduction. PadicMeasuresIwasawaAlgebras supplies integral tame projectors and the algebra of completed group rings, including the torsion-module structure theorem and finite-coinvariant length calculation. IntegralIwasawaTheory supplies arithmetic norm limits, their Artin identification, finite generation, torsion, one-prime control and general class-number growth; Layer 7 identifies their cyclotomic specializations on the native fields used here.

General main conjectures, arbitrary arithmetic Iwasawa towers, Selmer complexes, and p-adic L-functions belong to their respective roadmaps. The primitive-character Bernoulli comparisons and congruences needed for annihilation are constructed here on the native generalized Bernoulli values. No main conjecture is an input to Herbrand–Ribet, Kummer's criterion, the circular-unit index, or inverse-character vanishing. The universal Kummer–Vandiver assertion is recorded as a conjecture, not as a theorem or an axiom.

## Conventions

Write `K_m = ℚ(ζ_m)` for the native `CyclotomicField m ℚ`, with a chosen compatible primitive root when a formula uses one, and write `O_m` for its native ring of integers. All conductor statements assume `m ≥ 2`; auxiliary definitions whose formulas also make sense at `m = 1` retain that value as a boundary check. A prime `p` is positive and prime throughout arithmetic assertions. A prime-power level is `m = p^r`, with `r ≥ 1`. The fields at conductors two and four are respectively `ℚ` and `ℚ(i)`.

Use the native multiplicative `ClassGroup (𝓞 K)`. In formulas concerning linear algebra, silently apply `Additive` and write the class group additively. Its p-primary subgroup is `A_p(K)`. The equivalent tensor model is `ℤ_p ⊗_ℤ Additive(Cl(O_K))`; the equivalence, not a replacement class-group construction, is a target of Layer 0. The full class number is `h(K) = NumberField.classNumber K`.

Identify `G_m = Gal(K_m/ℚ)` with `(ℤ/mℤ)ˣ` by `σ_a(ζ_m)=ζ_m^a`. The action on classes is covariant: `σ_a[𝔞]=[σ_a𝔞]`. Artin reciprocity uses arithmetic Frobenius. Thus `Art(σ_a𝔞)=σ_a Art(𝔞) σ_a⁻¹`. At conductor five, `σ_2 ζ_5=ζ_5²` and `σ_3 ζ_5=ζ_5³`; these two maps are inverse, not interchangeable. The tensor action in Suggested.lean sends a pure class tensor to the class transformed by `σ_a`, without an inverse.

For odd `p`, let `Δ_r ⊂ G_(p^r)` be the subgroup of order `p−1` and `Γ_r` its p-power complement. Reduction identifies `Δ_r` with `(ℤ/pℤ)ˣ`. Let `ω:Δ_r→ℤ_pˣ` be the multiplicative section of reduction, and put

```text
e_i = (p−1)⁻¹ Σ_(a∈Δ_r) ω(a)^(−i) σ_a,
A_r^(i) = e_i A_p(K_(p^r)).
```

Indices are integers modulo `p−1`. The displayed inverse character belongs to the projector coefficient; the image has action `ω^i`. No semisimple decomposition of the wild group `Γ_r` is intended. Complex conjugation acts on `A_r^(i)` as `(-1)^i`. At `p=2`, the formulas involving division by two are not used.

In group rings write `[a]` for the basis element `σ_a`. If `a` is a unit residue, `a₀` denotes its representative in `0,…,m−1`, necessarily nonzero when `m≥2`. The rational Stickelberger element is

```text
θ_m = Σ_(a∈G_m) (a₀/m)[a⁻¹].
```

For a positive integer `b` prime to `m`, positive smoothing means `(b−[b])θ_m`; its coefficient expression is `Σ_a floor(b a₀/m)[a⁻¹]`. In particular at `m=5`, the coefficients of `θ_5` at `[3]` and `[2]` are `2/5` and `3/5`; those of the smoothing with `b=2` are `0` and `1`. These two-term witnesses are proved examples in Suggested.lean.

Ordinary Bernoulli numbers use `B₁=−1/2`. For a nontrivial primitive Dirichlet character `χ` of conductor `f`, put `B_(1,χ)=f⁻¹Σ_(a=1)^f aχ(a)`. Its value under a specified p-adic embedding is used in annihilator statements. Characters at an inflated modulus must retain the primitive conductor or carry the appropriate Euler factor. The character `ω^i` evaluates `θ_p` as `B_(1,ω^(−i))`; consequently the Herbrand–Ribet component attached to `B_k` is `i=1−k`.

For the growth theorem set `F_n=K_(p^(n+1))` if `p` is odd and `F_n=K_(2^(n+2))` if `p=2`. Then `[F_n:F_0]=p^n` in both cases. Transition maps on class groups are norms, directed from higher to lower levels. With a topological generator `γ` of `Γ=Gal(F_∞/F_0)`, the coordinate `T` of `ℤ_p[[T]]` is `γ−1`.

## Exact supplier contracts

### From Mathlib

Use `CyclotomicField`, `IsCyclotomicExtension`, `IsCyclotomicExtension.Rat.galEquivZMod`, and `galEquivZMod_apply_of_pow_eq`. The last declaration fixes the action on roots, rather than merely giving an abstract group equivalence. Use `RingOfIntegers.mapRingEquiv` to transport each field automorphism to the integer ring, and use `ClassGroup` and `NumberField.classNumber` for the resulting arithmetic objects. `NumberField.classNumber_eq_one_iff` supplies the principal-ideal-ring comparison. Class-number positivity and finiteness remain those of the native class group.

Use `NumberField.maximalRealSubfield` with its inherited number-field structure; the real field is not a new abstract field chosen only by degree. The norm identities for `1−ζ_(p^r)`, the cyclotomic integer-ring description, and prime ideal factorization are consumed in their existing number-field forms. In particular `IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic` and its prime-power specializations distinguish norm `p` from the degree or the conductor.

The algebraic carriers are `MonoidAlgebra`, `Finsupp`, `Submodule`, `LinearMap.ker`, `TensorProduct`, and `LinearMap.baseChange`. Use `PadicInt.toZMod` for reduction, native finite-field units for tame characters, and native Bernoulli numbers with their integer numerator. Tensor products are over `ℤ`; scalar extension sends additive class-group maps to linear maps. The general finite abelian group and finite-module APIs supply primary decomposition, finite cardinalities, and Nakayama's lemma on finite modules. Cyclic field Hilbert 90, ideal different and discriminant identities, determinants, and Hadamard's inequality are library algebra and analysis inputs; this roadmap adds their arithmetic comparisons below.

Use `IsPrimitiveRoot.geom_sum_isUnit` and `associated_sub_one_pow_sub_one_of_coprime` for integral cyclotomic ratios; their integrality and unit property are already proved for primitive roots in an integral domain. Use `NumberField.Units.regOfFamily`, `regOfFamily_eq_det` and `regOfFamily_div_regulator` for family regulators and their index formula. The native `NumberField.IsCMField.indexRealUnits` is the Hasse unit index `Q_F=[E:μ(F)E⁺]`; `indexRealUnits_eq_one_or_two` gives its values, and `regulator_div_regulator_eq_two_pow_mul_indexRealUnits_inv` gives `R_F/R_(F⁺)=2^(d−1)/Q_F`. The map `unitsMulComplexConjInv` already sends u to the root of unity `u/c(u)`. These generic CM constructions and formulas are imports. Section 3.4 adds the prime-power value Q=1 and the abelian character class-number product.

Use `DirichletCharacter.LFunction`, `LFunction_eq_LSeries`, `differentiable_LFunction` and `DirichletCharacter.IsPrimitive.completedLFunction_one_sub` from Mathlib's Dirichlet meromorphic-extension file. The completed function uses `gammaFactor χ s`, with the parity shift in the gamma factor, and its functional equation has the factor `N^(s−1/2) * rootNumber χ`. Do not introduce a second meromorphic extension or assume a different completion convention. `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` identifies the right-hand residue at one with `dedekindZeta_residue`; `dedekindZeta_residue_def` gives `2^r₁(2π)^r₂ R h/(w√|D|)`. Layer 3 adds the finite scalar Bernoulli comparisons in degrees one and two, Euler-product comparison and regulator comparisons needed to apply those existing results.

### From Tau Ceti

`TauCeti.NumberTheory.ClassGroup.Equiv` provides `ClassGroup.mulEquivHom`, its identity and composition laws, and the computation on ideal classes through `ClassGroup.mulEquiv_mk0`. Apply it to `RingOfIntegers.mapRingEquiv σ`. This determines the covariant action; the tensor action `cyclotomicClassAction` is its scalar extension. The class-group functoriality is imported rather than developed again. The extension map is Mathlib's `ClassGroup.extendedHom`, with `extendedHom_mk0` and `extendedHom_comp`. `TauCeti.RingTheory.ClassGroup.RelNorm` supplies `ClassGroup.relNorm`, `ClassGroup.relNorm_mk0`, `ClassGroup.relNorm_extendedHom` and `ClassGroup.relNorm_comp_extendedHom` for a finite torsion-free extension of Dedekind domains: norm after extension raises a class to `Module.finrank R S`. Thus in a cyclotomic step the additive identity is `N_(s/r) ∘ j_(r/s)=p^(s−r)`; in the CM/real quadratic comparison it is multiplication by two. Norm and extension, and this degree identity, are suppliers. Layer 0 adds their characterwise and Galois orbit-sum comparisons.

LocalFieldsRamification Layers 0–4 supply completions, valuations, inertia and unramified extensions; ClassFieldTheory Layers 5–7 supply the local Kummer pairing and arithmetic reciprocity. Tau Ceti's `TauCeti.RingTheory.Henselian.Teichmuller` supplies `TauCeti.teichmuller`, `teichmuller_eq_iff` and `eq_teichmuller`: over a henselian local ring with finite residue field, with residue cardinality minus one a unit, this is the unique multiplicative section on residue-field units. In Suggested.lean the section is an explicit multiplicative map `ω` with reduction equal to the residue unit; its existence is not admitted as data.

For geometric torsion use the pinned library's `TauCeti.TateModule` from `TauCeti.Algebra.Module.Torsion.TateModule`, with `TateModule.proj`, `mapLinearMap`, `continuous_iff`, `continuous_map_apply`, `proj_surjective`, and `nonempty_linearEquiv_of_natCard`. Its `free_of_natCard`, `finite_of_natCard` and `finrank_eq_of_natCard` turn the level cardinalities into the rank of the inverse limit. The shared field realization `AbelianTate B ℓ` in §4.3 is this carrier on the additive group of geometric points, with its geometric Galois action. JacobianChallenge Layer E supplies the degree and étaleness of multiplication; §4.3 derives the geometric level counts and adds the realization comparisons. The characteristic polynomial is `End.charpoly` on the native abelian endomorphism ring, and the involution is `Polarization.rosati`. These geometric comparisons remain README targets where the necessary geometric APIs extend beyond the pin.

`TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli` supplies `DirichletCharacter.generalizedBernoulli`, `generalizedBernoulli_def`, `map_generalizedBernoulli`, `generalizedBernoulli_modOne`, `generalizedBernoulli_one_of_ne_one` and `natCast_mul_generalizedBernoulli_one_of_ne_one`. The carrier is a commutative ℚ-algebra, with the nontrivial-character sum formula requiring a domain and positive modulus. These include the finite Bernoulli-polynomial formula in every degree, coefficient extension, the first weighted character sum, and the conductor-one value `B_(1,1)=+1/2`. Ordinary `bernoulli 1` is instead `−1/2`. Applying the coefficient-map formula to complex conjugation also gives `conj(B_(n,χ))=B_(n,χ⁻¹)` for complex-valued characters. The arithmetic results below use this existing value at the primitive conductor; no separate finite-sum definition is needed. This module exists at the pinned Tau Ceti revision; Suggested.lean pins its first-degree formula with `#check`.

### From PadicPeriodRings

PadicPeriodRings §1.4 supplies `tate_H0_padicComplex_twist` and `tate_H1_padicComplex_twist` for finite extensions of ℚ_p: continuous H⁰ and H¹ of C(i) vanish for nonzero i, while the untwisted H¹ is one-dimensional. Its §2 supplies their general-base versions for complete mixed-characteristic discretely valued fields with perfect residue field, and `tateSen_character` for a continuous character into the base field's units with finite or virtually ℤ_p image. The infinite-inertia case has zero H⁰ and H¹; finite inertia gives the one-dimensional case. Section 4.4 applies these statements to construct the p-divisible-group comparison and the local character criterion; it does not reconstruct completed-field cohomology.

### From IntegralIwasawaTheory

IntegralIwasawaTheory §§1.1–1.6 supplies compatible cyclotomic fields, circular-number groups and their unit intersections, real generators, norm comparisons, and the prime-power regulator and index theorems, including the separate dyadic case. Sections 6.1–6.3 identify these groups with the native unit subgroups here, retaining the same roots of unity and real phases. Its general abelian-subfield norm convention and conductor-lattice correction in §§1.7–1.8 are retained; the equalities below concern full prime-power cyclotomic fields, not intersections with arbitrary real subfields. Sources: Sharifi Definition 4.3.1 and Theorem 4.3.3, pp.108–110; Lemma 4.2.17, pp.106–107; Theorem 4.7.1, pp.120–121.

IntegralIwasawaTheory §§0.1–0.4, 2.1 and 2.3 supplies the arithmetic tower, completed action, compact class norm limit and Artin comparison. Its §3.1 supplies `onePrimeClassControl` and `onePrimeClassModule_finite_torsion` under the hypothesis of exactly one finite ramified prime, totally ramified from the base, with no other ramification. Its §§3.2–3.3 supplies general tower growth and the base-shift and generator-change formulas; §7.4 supplies `VandiverCondition` and its real-class and plus-class reformulations for odd primes. Sections 6.4 and 7.1–7.3 transport these statements, including their actual norm and projection maps. Sources: Sharifi Proposition 3.2.6, Proposition 3.2.11, Remark 3.2.12 and Theorem 3.2.13, pp.79–82; the odd-prime real-class comparison uses §0.4 here. No main conjecture or μ-vanishing is required for these supplied results.

### From ClassicalArithmeticCompletion

ClassicalArithmeticCompletion §§1.47 and 1.55, “The Gauss sum power” and “Stickelberger's relation”, supply the finite-field Gauss power and its valuations and ideal factorization for every conductor `m≥2`, with reciprocal power-residue character. Its §7.12 supplies the digit-sum valuation. At a rational prime `ℓ≡1 mod m`, choose `𝔩|ℓ`, a generator c of `𝔽_ℓˣ` with `ζ_m mod 𝔩=c^(-(ℓ−1)/m)`, and χ(c)=ζ_m. For the negative Gauss sum `g=−Σ_(x≠0)χ(x)ζ_ℓ^x`, the supplied valuation, normalized by `v_𝔏(ζ_ℓ−1)=1`, reads `v_(σ_b⁻¹𝔏)(g)=(ℓ−1){b/m}`. The ideal identity downstairs is `(g^(ℓ−1))=𝔩^((ℓ−1)θ_m)`. The factor `ℓ−1` is the ramification index upstairs; the character and basis inverses have the conventions of this README. These are supplied relations, rather than additional targets here.

Mathlib's `gaussSum`, `gaussSum_ne_zero_of_nontrivial`, `gaussSum_mul_gaussSum_eq_card` and `gaussSum_mulShift_eq` supply the sum, nonvanishing, product and additive-character scaling. For nontrivial multiplicative χ over `𝔽_q` the product is `g(χ)g(χ⁻¹)=χ(−1)q`. For the trivial multiplicative character and nontrivial additive character, the negative sum is one and its product is one. Over `𝔽_(ℓ²)` the nontrivial-character factor is `ℓ²`, not ℓ. These conventions fix the normalization of the smoothing descent in §2.4. Sources: Sharifi Lemma 4.5.4 and proof of Theorem 4.5.6, pp.115–117; ClassicalArithmeticCompletion §1.55's Katre §4, Proposition 4(i), pp.82–84.

### From GlobalNumberFields and ClassFieldTheory

GlobalNumberFields Layer 10 supplies cyclotomic splitting and total ramification, with conductor normalization and compatibility with arithmetic Frobenius. The integer rings and maximal real subfield, archimedean logarithmic lattice, unit theorem and regulator are Mathlib's. Ideal-class norm and extension use the library declarations above. The analytic class-number formula is Mathlib's `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` with its native invariants.

NumberFieldArithmetic Layers 4 and 6 supply the different/discriminant criterion for finite separable number-field extensions and its comparison with ramification indices. In particular the finite residue fields are perfect, so a finite prime divides the different exactly when its ramification index exceeds one.

ClassFieldTheory Layers 5–7 and 11 supply local Kummer theory, local reciprocity and the global reciprocity comparison; Layers 10 and 13 supply the unit/S-unit Herbrand calculations; and Layer 13 supplies Hilbert class fields, equivariance, norm compatibility and the conductor–discriminant formula. Required conventions are `Cl(O_K) ≅ Gal(H_K/K)` using arithmetic Artin, conjugation on the right corresponding to the covariant ideal action, and restriction corresponding to ideal norm. A finite abelian extension unramified at finite primes and split at each real place factors through this ordinary class group. In the CM fields used for odd-prime character assertions there are no real places.

For a cyclic extension `L/K` of degree `d`, the supplied quotient is `q_G(E_L)=∏_(v|∞)[L_w:K_v]/d`, with `q_G(E_L)=#Ĥ⁰(G,E_L)/#H¹(G,E_L)`. We apply it with no ramification at infinity, so it is `1/d`. This contract explicitly includes the archimedean factor; it cannot be discarded in an imaginary quadratic extension of a real field.

### From ModularForms, ModularCurves and the lower algebra roadmaps

ModularForms Layers 0, 2, 4 and 8 supply spaces of weight-one and weight-two forms with Dirichlet character, the Fourier coefficient formulas, finite integral Hecke modules, cusp expansions and the characteristic-zero separation of Eisenstein eigensystems. Section 4.2 supplies the residual eigencharacter lifting theorem for finite Hecke modules. The prime-level specialization and integral constant-term argument in §4.2 are additional targets here. ModularCurves Layers 4–10 supply `X₁(N)`, `X₀(N)` and their integral moduli geometry; its Layers 0B–0C supply finite locally free group schemes, Cartier duality and affine finite-flat quotients, and 7E PD-2 supplies the finite connected–étale sequence. JacobianChallenge Layers D–F supply the Jacobian, its Picard interpretation, polarization, functoriality, and multiplication isogenies with degree and étaleness. Section 4.3 adds the shared field realization, endomorphism polynomial and Albanese modular quotient. Section 4.4 adds the shared local comparisons and the prime-level good model.

JacobianChallenge Layer B supplies coherent-sheaf cohomology, finite dimensionality for proper schemes over a field, and vanishing above the support dimension; Layer C supplies the relative pushforward and base-change maps. Use their cohomology carrier and Euler characteristic. Section 4.3 adds the numerical intersection polynomial and abelian-variety Riemann–Roch needed for Rosati positivity; the curve Riemann–Roch theorem is not rebuilt.

IntegralHeckeAndGaloisDeterminants §1.4, “Classical Ribet lattice”, supplies the following theorem. For a compact group acting continuously and irreducibly on a two-dimensional vector space over a finite extension of `ℚ_p`, with integral characteristic polynomials and distinct residual characters `α,β`, a stable free full lattice can be chosen whose reduction is a nonsplit extension of `β` by `α` in a prescribed orientation. We use `α=1`, `β=χ_p^(k−1)`. Distinctness is checked from `2≤k≤p−3` and evenness.

PadicMeasuresIwasawaAlgebras §4.6 supplies the tame idempotent decomposition when the finite group order is invertible in the coefficient ring, and the `ℤ_p` specialization of completed group rings, `Λ≅ℤ_p[[T]]`. Its torsion-module theorem gives a pseudo-isomorphism to sums of `Λ/(p^a)` and `Λ/(f(T)^b)` for distinguished polynomials `f`, finite error modules, and the eventual length of finite `Γ_n`-coinvariants. The invariant convention is `μ=Σa`, `λ=Σb deg f`. Its §5.2 topological Nakayama theorem applies to a compact Hausdorff module with continuous action: finiteness of `M/(p,T)M` implies finite generation of M, without an initial finite-generation hypothesis. Its §5.2 compact inverse-limit exactness supplies the norm-limit arguments. Layers 1 and 4 supply the completed group ring and structure theorem. These algebraic statements are imported; the field-theoretic norm limit and its hypotheses are constructed in Layer 7.

## How to read the build

Layer 0 fixes the class action and character conventions. Layer 1 develops relative units and the class-group control used in towers. Layer 2 proves all-conductor integral annihilation. Layer 3 turns it into Bernoulli and reflection statements, and Layer 4 constructs Ribet's converse without a main conjecture. Layers 5 and 6 give regularity, Kummer's lemma and circular-unit indices, including powers of two. Layer 7 passes from norms to the cyclotomic Iwasawa module and class-number growth. Layer 8 packages the inverse-character vanishing as an arithmetic obstruction with the exact duality needed by the Eisenstein ideal.

The finite obstruction in §§8.1–8.3 follows from Layers 0–3 and §1.7, independently of the modular converse. The shared abelian package and modular quotient of §4.3 and the shared local prefix of §4.4 also precede that converse. Their prime-level application proceeds from the quotient's good model to characteristic-zero irreducibility, then the oriented residual lattice and its local splitting, and finally §4.5. The 691 negative control uses the converse separately.

## Layer 0: native class modules and arithmetic characters

### 0.1 The p-primary class module and its action

Define `cyclotomicClassModule p m` to be the p-primary subgroup of the additive native class group, for a prime `p` and `m≥2`. Give its natural finite `ℤ_p`-module structure: an element killed by `p^s` is multiplied by the reduction of a p-adic scalar modulo `p^s`. Independence of `s` is part of the construction. Define `cyclotomicClassTensorEquiv` from `ℤ_p⊗_ℤ Additive(Cl(O_m))` to this module, sending `1⊗x` to the p-primary component of `x`. It is canonical, linear, natural for class-group homomorphisms, and equivariant for `G_m`. Sources are Sharifi §1.3, Propositions 1.3.1–1.3.2, pp.14–15, together with the finite-module specialization of §2.8, pp.69–73.

Define `cyclotomicClassAction R m a` for any commutative ring `R` by scalar-extending the native covariant class-group automorphism. Its intended type is an `R`-linear endomorphism of `R⊗_ℤ Additive(Cl(O_m))`. Establish `classAction_one`, `classAction_mul`, `classAction_on_ideal`, `classAction_tensor`, and `classTensorEquiv_equivariant`. The Artin comparison `classArtin_equivariant` identifies this action with conjugation on `Gal(H_m/K_m)`, not its inverse. Source: Sharifi Propositions 1.3.1–1.3.2, pp.14–15, and Mazur I §2, equations (2.4)–(2.6), pp.50–51. The light scalar-extension action is recorded in Suggested.lean.

**Checks.**

- For an abstract class of order `p²`, scalar multiplication by a p-adic integer reducing to `1+p` is multiplication by `1+p` modulo `p²`, not multiplication by its residue modulo `p`. This detects an incorrect mod-p-only module.
- A class of order prime to `p` has zero image in the tensor model and in the p-primary projection; a class of order `p` does not. Thus tensoring with `ℚ_p` would give the wrong object.
- On `1⊗[𝔞]`, `cyclotomicClassAction R m a` gives `1⊗[σ_a𝔞]`. The pure-tensor comparison is the proved API theorem `classAction_tensor`. At conductor five, `IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq` identifies σ₂ and σ₃ by their respective powers on ζ₅; its class group is trivial.
- If the class group is trivial, both models are zero and the Artin extension is the base field. Finiteness here is finiteness of a module, not a claim that `ℤ_p` itself is finite.

### 0.2 Tame components at every odd-prime level

For odd `p` and `r≥1`, define `cyclotomicClassEigenspace p r i` as the image of `e_i`, or equivalently the submodule on which every `a∈Δ_r` acts by `ω(a)^i`. The two definitions must be compared by `mem_classEigenspace_iff` and `classEigenspace_eq_projector_range`. The general light definition `characterEigenspace ρ ω i` is the intersection of the kernels of `ρ(a)−ω(a)^i`; specializing it to `cyclotomicClassAction` gives the prime-conductor definition in Suggested.lean on the tensor carrier; its `ω` parameter is required in the theorems to reduce to the given unit of `ZMod p`. This condition fixes the Teichmüller section uniquely. The full prime-power construction retains the `Γ_r` action.

Provide `projector_mul_projector`, `projector_sum`, `projector_periodic`, `classEigenspace_periodic`, `classEigenspace_smul`, and compatibility with quotient, submodule, norm and extension maps. The scalar `p−1` is a unit of `ℤ_p`; use its unit inverse, not division in a fraction field followed by an unspecified descent. Sources: Sharifi Definition 2.8.1, Remark 2.8.2, Notation 2.8.3, Propositions 2.8.4 and 2.8.6, and Lemmas 2.8.5 and 2.8.7, pp.69–71; cyclotomic specialization §4.4, p.111. The generic projector algebra comes from the supplier contract; this target is its arithmetic specialization.

**Checks.**

- On `ℤ/25ℤ` with the order-four tame group acting through a fixed lift of the character `ω³`, `e_3` is the identity and `e_1` is zero. Inverting the exponent in the image condition would interchange these answers.
- On that abstract module, 1 lies in exponent −1 (equivalently 3) and not in exponent 1. Concretely the order-four roots in `(ℤ/25ℤ)ˣ` are the Teichmüller lifts of `(ℤ/5ℤ)ˣ`: the lift 7 of 2 acts by `7³=18`, while its inverse acts by 7. Suggested.lean proves the membership and nonmembership for `characterEigenspace`. The arithmetic class components at conductor five both vanish.
- A nontrivial wild action on a module at level `r=2` remains present inside one tame eigenspace. Projecting to tame characters must not replace the module by its wild invariants.
- At `p=2` the order-two conjugation projector `(1±c)/2` is not an integral operator on a two-primary group. This is outside the hypothesis of this definition.

### 0.3 Decomposition, conjugation, norms and extension

Prove `cyclotomicClassEigenspaces`: the natural map `⊕_(i mod p−1) A_r^(i)→A_r` is an isomorphism. Equivalently every class has a unique sum of components. This includes the zero module, without choosing bases or assuming cyclicity of a component. Prove `conjugation_on_component` with scalar `(-1)^i`, the even/odd decomposition of plus and minus parts, and characterwise compatibility with norms and extension. For `s≥r≥1`, prove the other composite identity

```text
j_(r/s) ∘ N_(s/r) = Σ_(g∈Gal(K_(p^s)/K_(p^r))) g.
```

Together with the supplied norm-after-extension degree identity, this gives the tower comparisons. These identities do not assert that extension of classes is injective. Source: Sharifi Definition 1.3.3 and the adjacent identities, p.15; §2.8, pp.69–73. The unique-sum prime-conductor signature appears in Suggested.lean.

The direction can be checked on a quadratic orbit `{𝔓,c𝔓}`: extending the norm of `[𝔓]` gives `[𝔓]+[c𝔓]`, while norm after extension of a base ideal class gives twice that class. In a cyclic degree-p step the analogous orbit sum has p terms. An element of order p can therefore be killed by `N∘j`; one cannot cancel the degree.

### 0.4 The real field and the dyadic boundary

For odd `p`, prove `realClassModuleEquivPlus`: extension of ideals gives `A_p(K_(p^r)^+)≅A_r^+`, with inverse `N/2`. Prove `minus_eq_norm_kernel` and `plus_even_components`. On a c-fixed element `x` of order `p^s`, `j(Nx/2)=x`; on a c-anti-fixed element `y`, `Ny=0`. This follows from the two norm identities and invertibility of two on a p-group. Source: Sharifi Lemma 1.3.5, p.15, and §4.2, pp.105–108.

At `p=2` define and keep separate `dyadicNormKernel=ker N`, `dyadicAntiInvariants=ker(1+c)` and `dyadicMinusQuotient=A/(1+c)A`. Their comparison maps and their kernels/cokernels are targets; prove the defects between the norm and anti-invariant descriptions are killed by two, using the norm/extension identities. No direct-sum plus/minus theorem is asserted over `ℤ_2`. This integral distinction is used before Layer 5 proves that the actual cyclotomic two-primary groups vanish.

For these three constructions supply `normKernel_mem`, `antiInvariants_mem`, `minusQuotient_map`, naturality for tower norms, and `comparison_defect_two_torsion`. The domains of each comparison are specified by the norm identities: `ker N` maps into `ker(1+c)`; `N` maps `ker(1+c)` into the two-torsion of the real class group; and the map from anti-invariants to the quotient by `(1+c)A` is the ambient quotient map. Its kernel and cokernel are killed by two, since `2x=(1−c)x+(1+c)x`.

**Checks.**

- On `ℤ/2ℤ` with trivial `c`, both plus and anti-invariant subgroups are the whole group. Their sum is not direct, so the odd-prime theorem cannot be generalized by deleting `p≠2`.
- On `ℤ/4ℤ` with trivial `c`, `ker(1+c)` has order two but `A/(1+c)A` has order two with the natural map from the former equal to zero. Equal cardinalities do not supply the claimed canonical isomorphism.
- On `ℤ/5ℤ` with `c=-1`, `N=0` into a zero real module, the minus subgroup is the whole module and the plus subgroup is zero. On the same group with `c=1`, the answer is reversed and `N/2` supplies the real inverse.
- At conductor two all three actual dyadic objects are zero because the field is rational; this is a separate arithmetic boundary from the abstract two-primary counterexamples.

### 0.5 The prime above p and the split-at-p quotient

For every prime `p` and `r≥1`, define `cyclotomicPrime p r` as the unique prime ideal `P_r=(1−ζ_(p^r))`. The existing ramification and norm calculations identify it as principal with residue norm p. The targets here are `primeAboveP_class_zero`, `primeAboveP_artin_zero`, and `splitAtP_unramifiedClassEquiv`: the maximal unramified abelian p-extension in which `P_r` splits has the same Galois group `A_r` as the ordinary maximal unramified abelian p-extension. The S-class quotient kills the subgroup generated by `[P_r]`, which is zero. Source: Sharifi Definition 1.3.19 and Remark 1.3.21, pp.22–23; the cyclotomic construction in §3.1, pp.75–77; Mazur I §2, pp.50–53.

The API includes `cyclotomicPrime_unique`, transport under the chosen root, class and Artin vanishing, norm compatibility across levels, and equivariance of the S-class comparison. The first two uniqueness/ramification facts are imported from the basic cyclotomic theory; this definition packages their class-field use.

**Checks.**

- At conductor `p`, the residue norm is p even though the degree is `p−1`. At conductor `p²` it remains p, not `p²`.
- For `p=2,r=1`, `1−ζ_2=2` gives the ordinary ideal `(2)` in `ℤ` and its class is zero.
- In an unrelated number field a nonprincipal prime can impose a genuine quotient on the unramified class group. The equivalence here depends on principality, not on uniqueness or total ramification alone.

### Examples

At conductor five the inverse basis used for `θ_5` gives its two unequal coefficients `2/5` at `[3]` and `3/5` at `[2]`. In contrast the action of `[2]` on ideal classes is the covariant action of `σ_2`. Keeping these two statements together fixes the eventual Bernoulli index. At a quadratic real/CM extension the formulas `Nj=2` and `jN=1+c` explain both the odd-prime plus comparison and its failure on two-primary modules.

### Dependencies

Native class groups, their finite primary decomposition and Mathlib's maximal real subfields; Tau Ceti class-group functoriality; GlobalNumberFields Layer 10's cyclotomic arithmetic; ClassFieldTheory's Hilbert class fields and equivariance; PadicMeasuresIwasawaAlgebras' tame projector algebra. No higher arithmetic Galois or Iwasawa theory is used in this layer.

## Layer 1: relative units, capitulation and one-prime control

### 1.1 Relative units modulo saturated base units

Let `L/K` be a cyclic extension of prime degree `ℓ`, with generator `σ`, and suppose no infinite place ramifies. This includes every odd prime degree; for degree two it excludes a real place becoming complex. Write `E_L=O_Lˣ`. Define the saturated base-unit subgroup

```text
E_K^sat = {u∈E_L : u^n∈E_K for some integer n>0},
R_(L/K) = E_L/E_K^sat.
```

Name these objects `relativeUnitSat` and `relativeUnitQuotient`. The embedding of `E_K` is the native integer-ring embedding. The saturation is taken inside the integral unit group, not inside `Lˣ`. It contains the torsion of `E_L`, and the quotient is a finite free abelian group. Since the norm of every unit lies in `E_K`, `1+σ+⋯+σ^(ℓ−1)` acts as zero on `R_(L/K)`. Give `R_(L/K)` its resulting `ℤ[ζ_ℓ]`-module structure with `ζ_ℓ` acting as `σ`.

Prove `relativeUnitSat_subgroup`, `relativeUnitSat_saturated`, `relativeUnitQuotient_torsionFree`, `relativeUnitQuotient_norm_zero`, `relativeUnitQuotient_rank`, and `relativeUnitQuotient_mod_uniformizer`. The abelian rank is `(ℓ−1)(r₁(K)+r₂(K))`; the `ℤ[ζ_ℓ]`-rank is `d=r₁(K)+r₂(K)`. Its quotient by `1−ζ_ℓ` has dimension d over `ℤ/ℓℤ`. Use the torsion-free module's projectivity over the Dedekind ring and its freeness after localizing at `(1−ζ_ℓ)`; no global free basis over `ℤ[ζ_ℓ]` is assumed. Source: Hilbert §55, Satz 91 and proof, pp.272–275; the rank input is the supplied Dirichlet unit theorem.

**Checks.**

- For a real quadratic field over `ℚ`, `E_ℚ^sat` is the torsion subgroup and `R` has abelian rank one. Modulo `1−σ`, its quotient has dimension one over `ℤ/2ℤ`.
- A unit `u` with `u^ℓ∈E_K` belongs to the saturated subgroup even when it is not itself a base unit. Omitting saturation leaves spurious torsion in `R`.
- For a cyclic cubic extension of an imaginary quadratic field, `d=1` and the relative abelian rank is two, not one. The quotient modulo `1−ζ_3` has dimension one.
- For an imaginary quadratic extension of `ℚ`, the relative unit rank is zero; this contradicts the displayed rank if the no-infinite-ramification hypothesis is omitted.

### 1.2 Relative fundamental systems and Hilbert 91

Define `RelativeFundamentalSystem L K σ` to consist of d integral units whose images are a basis of `R_(L/K)/(1−σ)R_(L/K)` over `ℤ/ℓℤ`. A change of representatives by saturated base units does not change this condition. Equivalently, if `F_j∈ℤ[X]` and

```text
∏_j u_j^(F_j(σ)) ∈ E_K^sat · {v/σ(v):v∈E_L},
```

then every `F_j(ζ_ℓ)` is divisible by `1−ζ_ℓ`. Conversely divisibility gives membership in the displayed subgroup. This is independence in the residue module, not an assertion that the chosen units generate `R` over the whole cyclotomic integer ring.

Prove `relativeFundamentalSystem_exists`, `relativeFundamentalSystem_independent`, `relativeFundamentalSystem_change_basis`, and invariance under saturated-unit multiplication. Lifts of a residue basis exist because the quotient map from `E_L` is surjective. The independence theorem is Hilbert 91 in these carriers. Source: Hilbert §55, Satz 91, pp.272–275. Its degree-two scope is exactly the no-infinite-ramification case specified in §1.1.

**Checks.**

- In rank one over `ℤ` with `σ=-1`, an odd multiple of a generator gives a residue basis modulo two; twice a generator fails. Thus real linear independence alone is insufficient.
- Replacing a relative fundamental unit by its product with a unit having a positive power in `E_K` leaves the same system.
- In a free model `ℤ[ζ_ℓ]^d`, the standard d generators form such a system. Replacing one by `(1−ζ_ℓ)` times itself fails, although it remains nonzero and independent over the fraction field.
- A nonprincipal projective rank-one cyclotomic module still has a one-element residue basis. A definition demanding a global free generator would wrongly exclude it.

### 1.3 Hilbert 92 and the exact unit-cohomology count

For a cyclic extension `L/K` of degree `n≥1` unramified at infinity, prove `unitCohomology_card`:

```text
#H¹(G,E_L) = n [E_K:N_(L/K) E_L].
```

Here `H¹` has its ordinary multiplicative-unit interpretation, with a cocycle represented for a generator by a norm-one unit and a coboundary by `σ(v)/v`. The inverse quotient `v/σ(v)` represents its negative. Finiteness and the equality follow from the supplied unit Herbrand quotient `1/n`, since `Ĥ⁰(G,E_L)=E_K/N E_L`. For prime `ℓ`, deduce `hilbert92`: a norm-one unit exists which is not a unit coboundary. Source: Hilbert §56, Satz 92, pp.275–277; Milne VII §3, Proposition 3.1, Lemma 3.2 and Lemmas 3.4–3.5, pp.208–209.

The field-level norm-one equation comes from the existing Hilbert 90: `u=α/σ(α)` for some `α∈Lˣ`. Add the explicit comparison `unitCoboundary_iff_principalWitnessUnit` identifying when the witness can be taken in `E_L`. It cannot always be a unit, and Hilbert 92 is exactly the obstruction. No new proof of field Hilbert 90 is requested.

For a real quadratic extension with a unit of norm `−1`, the norm index is one and `#H¹=2`; if every unit has norm `+1`, the index is two and `#H¹=4`. In `ℚ(i)/ℚ`, the infinite ramification changes the Herbrand quotient to one and gives `#H¹=2`, not four. These are tests of the hypotheses as well as the cohomological normalization. The degree-one case gives order one.

### 1.4 Invariant ideals, ramification and Hilbert 93

Let `I_L` be the multiplicative group of nonzero fractional ideals and `j:I_K→I_L` extension. For any finite Galois extension `L/K`, define `invariantIdealResidues` on `I_L^G` by taking, for each finite prime `v` of `K`, the common valuation at primes over v modulo `e_v`. Prove that it induces

```text
I_L^G / j(I_K) ≅ ⊕_(v finite) ℤ/e_vℤ.
```

Only ramified primes contribute; this is a finite group. The defining valuation at a chosen prime over v is independent of that choice by invariance. Prove its homomorphism law, independence, surjectivity by orbit products of primes, kernel equal to the extended ideals, and compatibility with maps of towers when the ramification indices divide. Source: Sharifi Proposition 1.3.6, pp.15–16, and the invariant-ideal calculation in the proof of Theorem 1.3.16, p.22; Hilbert §57, Satz 93, pp.277–278.

The Hilbert 93 comparison uses the supplied different criterion on these ideal carriers: a finite prime contributes precisely when its ramification index exceeds one. For cyclic prime degree, a ramified prime is totally ramified; an inert prime fixed by the Galois group has index one and contributes zero. Thus the valuation quotient detects ramification, while a merely invariant prime need not contribute.

**Checks.**

- In a finite unramified extension every `e_v=1`; the quotient of invariant fractional ideals by extended ideals is trivial even when ideal classes capitulate.
- A totally ramified prime of degree `ℓ` gives a cyclic summand of order ℓ, represented by the prime ideal upstairs. Its ℓth power is extended, while the prime itself is not.
- An inert unramified prime is Galois fixed but is already extended. A definition counting every fixed prime as a ramification contribution is false.
- With two ramified primes the quotient has two independent valuation residues. Replacing their direct sum by a single degree quotient loses this independence.

### 1.5 The capitulation cocycle

For a finite Galois extension L/K, define `capitulationKernel L K` as the kernel of Mathlib's native `ClassGroup.extendedHom` extension homomorphism `Cl(O_K)→Cl(O_L)`. For `x=[𝔞]` in this kernel, choose `α` with `𝔞O_L=(α)` and define `capitulationCocycle x` by the cohomology class of `g↦g(α)/α`. Changing α by a unit changes this by a coboundary; changing the ideal representative changes it by a field scalar whose coboundary is trivial on `G`. Prove a canonical injective homomorphism

```text
κ : ker(Cl(O_K)→Cl(O_L)) → H¹(G,E_L).
```

The image is the kernel of the map `H¹(G,E_L)→I_L^G/j(I_K)` which sends a norm-one-unit cocycle to the invariant principal ideal obtained from a Hilbert-90 witness. This map is well defined on cohomology, and the two sign conventions must agree. It is not asserted that κ is surjective in a ramified extension. Source: Sharifi Proposition 1.3.6 and proof, pp.15–16; Hilbert §58, Satz 94, pp.278–279.

Supply `capitulationCocycle_independent_generator`, `capitulationCocycle_independent_ideal`, `capitulationCocycle_mul`, `capitulationCocycle_injective`, `capitulationCocycle_image`, and `capitulationCocycle_equiv_of_unramified`. In the last statement finite unramifiedness makes §1.4's ideal quotient zero, so κ is an isomorphism. A two-term normalization witness is `κ([𝔞])(σ)=σ(α)/α` and `κ([𝔞]⁻¹)(σ)=α/σ(α)`; their product is one. The normalization check uses the actual ideal generator and its cocycle.

**Checks.**

- A principal ideal `(a)` in the base field can use `α=a`; its cocycle is identically one and κ sends its class to zero.
- Replacing `α` by `uα` multiplies the cocycle by `σ(u)/u`, so its cohomology class is unchanged.
- In the unramified case every unit cohomology class arises by descent of an invariant principal ideal; in the ramified case an invariant ideal with a nonzero valuation residue need not descend. This distinguishes the kernel statement from an unconditional equivalence.
- In degree one both the capitulation kernel and unit cohomology are trivial. The construction must not depend on a nontrivial choice of generator of the Galois group.

### 1.6 Hilbert 94 and exact capitulation

For a cyclic extension `L/K` of degree `n≥1` unramified at every finite and infinite place, combine §1.3 and §1.5 to prove `hilbert94_card`:

```text
#ker(Cl(O_K)→Cl(O_L)) = n [E_K:N E_L].
```

For prime degree `ℓ`, prove `capitulationKernel_killed_by_degree` using `Nj=ℓ`, and conclude that the kernel contains a class of exact order ℓ. Thus `ℓ∣h(K)`. Source: Hilbert §58, Satz 94, pp.278–279, with the precise cardinality supplied by the unit-cohomology calculation above. The same formula for arbitrary cyclic n is the natural reusable statement; it does not assert that the kernel is cyclic or has order n in general.

At degree two with no infinite ramification, the kernel can have order four when the unit norm index is two. This does not contradict being killed by two: the kernel can be a two-dimensional vector space over `ℤ/2ℤ`. At degree one the formula reduces to one. If a proposed unramified extension of prime degree starts from a field with class number prime to that degree, this theorem rules it out.

### 1.7 One-prime class-group control

For a finite abelian extension `L/K` unramified at infinite places, construct the genus comparison on the native class groups. Put `G=Gal(L/K)` and let `H_L` be the Hilbert class field. Define `genusClassQuotient L K` to be `Cl(O_L)` modulo the inverse Artin image of the commutator subgroup of `Gal(H_L/K)`; that image lies in `Gal(H_L/L)`. Let `Σ:⊕_v I_v→G` be the sum of the inertia inclusions, over the finite ramified places of K. Prove the exact sequence

```text
ker Σ → genusClassQuotient L K → Cl(O_K) → coker Σ → 0.
```

The middle map is induced by norm. For cyclic G, identify the quotient with `Cl(O_L)_G`. This comparison and the connecting map from `ker Σ` are targets here, built from the supplied Hilbert class field and reciprocity, rather than an additional supplier assumption. Give `genusClassQuotient_mk`, its quotient universal property, `genusClassQuotient_norm`, and `genus_sequence_exact`. Source: Sharifi Proposition 1.3.11 and its proof, pp.16–17. The nonabelian p-extension consequence below is obtained by a normal series and cyclic steps; it does not require such a sequence for a nonabelian G.

**Checks.** In degree one the quotient and norm recover `Cl(O_K)`. For a cyclic unramified extension, Σ has zero source and the cokernel is G, so norm need not be surjective. For a cyclic extension with a single totally ramified finite prime, Σ is an isomorphism, and norm on coinvariants is an isomorphism. For a cyclic extension with two nontrivial inertia groups, `ker Σ` can be nonzero; deleting it would give a false injectivity assertion.

Prove `classModule_vanishes_of_one_ramified_prime`: if `L/K` is a finite Galois p-extension, no infinite place ramifies, at most one finite prime ramifies, and `A_p(K)=0`, then `A_p(L)=0`, provided in the nonabelian case that the ramified prime, if present, has a unique prime above it in L. A normal series of the p-group reduces to cyclic degree-p steps; the genus-field argument shows that any nonzero class module would yield a further unramified abelian p-extension of K after killing the one possible inertia group. Source: Sharifi Corollary 1.3.12 and Lemma 1.3.13, pp.17–18.

For a cyclic p-power extension with exactly one ramified finite prime and that prime totally ramified, prove `onePrime_norm_coinvariants`: ideal norm gives an isomorphism `A_p(L)_Gal(L/K)≅A_p(K)`. Its proof uses the genus sequence, including the inertia contribution and the fact that total ramification makes the extension disjoint from the maximal unramified extension of K. This is stronger than surjectivity of norm and supplies the finite-level input to Layer 7. Source: Sharifi §1.3, Proposition 1.3.11 and Corollary 1.3.12, pp.17–18; §3.2, Remark 3.2.12, pp.80–81.

Both claims require the ramification hypothesis: when several primes ramify, the independent inertia contributions need not collapse. The identity `Nj=[L:K]` alone is insufficient to prove norm surjectivity or vanishing in a p-extension.

### Examples

The real quadratic unit calculation separates a field Hilbert-90 witness from a unit witness. The inert-prime example separates fixed ideals from ramification. In a cyclotomic step `K_(p^(r+1))/K_(p^r)` the single prime above p is totally ramified, every infinite place is already complex except the rational dyadic boundary, and the one-prime theorem applies once the base of the dyadic tower is `ℚ(i)`.

### Dependencies

Layer 0; native fractional ideals, norms and differents; the existing field Hilbert 90 and Dirichlet unit theorem; ClassFieldTheory's Hilbert class field, reciprocity and unit Herbrand quotient; finite cyclic cohomology from ProfiniteCohomology. The new work is the saturated relative lattice, its residue systems, and the arithmetic maps, genus comparison and consequences on these carriers.

## Layer 2: the integral Stickelberger ideal at every conductor

### 2.1 The rational element and its evaluations

Define `stickelberger m : ℚ[G_m]` by `θ_m=Σ_a(a₀/m)[a⁻¹]`. This is a finite sum on the existing `MonoidAlgebra` carrier. The definition is independent of a choice of primitive root once the Galois group is identified through its action on roots. Changing the primitive root does not replace `σ_a` by an inverse. Establish `stickelberger_coeff`, `stickelberger_conjugation`, `stickelberger_augmentation`, and `character_eval_stickelberger`. Explicitly,

```text
coeff_[b](θ_m) = representative(b⁻¹)/m,
(1+c)θ_m = N_(G_m),
augmentation(θ_m) = φ(m)/2.
```

The last two identities include `m=2`, where `c=1` and `θ_2=[1]/2`. For a nontrivial character `χ` viewed at modulus m, evaluation is the finite Bernoulli sum `m⁻¹Σ aχ⁻¹(a)`; its comparison to the primitive-conductor value is part of §3.1. Source: Sharifi Definition 4.5.1(a), pp.113–114, and Theorem 4.5.7, p.117.

**Checks.**

- At `m=5`, the coefficients at `[3]` and `[2]` are `2/5` and `3/5`. Both unequal values occur as proved examples in Suggested.lean, so a missing basis inverse fails.
- At `m=2`, the group has one element and the coefficient is `1/2`, as stated by `stickelberger_two_coeff`. Replacing the least nonnegative representative of a unit by zero would fail even this boundary.
- For a nontrivial even character at odd prime conductor, the value is zero, by pairing a and `p−a`; an odd character generally has a nonzero value. The trivial character has value `(p−1)/2`, not the primitive trivial Bernoulli value `+1/2`.
- At `m=1` the same finite-sum formula gives zero, as stated by `stickelberger_one`. All-conductor arithmetic theorems here start at two and do not use `φ(1)/2` as an augmentation formula.

### 2.2 Denominators and the integral ideal

Define the denominator ideal and the integral Stickelberger ideal as ideals of `ℤ[G_m]`:

```text
J_m = {x∈ℤ[G_m] : x θ_m has integral coefficients},
I_m = {x θ_m : x∈J_m} = ℤ[G_m]θ_m ∩ ℤ[G_m].
```

Name these `denominatorIdeal m` and `stickelbergerIdeal m`. The intersection is taken inside `ℚ[G_m]`. It is not `ℚ[G_m]θ_m∩ℤ[G_m]`. The latter replaces integral multiples by rational multiples and can be strictly larger. Define `integralStickelbergerMap : J_m→I_m` by multiplication by θ, with its coefficient-integrality proof. The coefficient map `integralGroupRingCast` embeds `ℤ[G_m]` into `ℚ[G_m]`; `integralGroupRingCast_injective` gives injectivity. Use it for both ideals. The theorem `integralStickelbergerMap_cast` states that the chosen integral value maps to `xθ_m`. The ideals use these preimage and integral-image conditions, and the map selects their unique integral product.

Prove `denominatorIdeal_mem_iff`, closure under addition and group-ring multiplication, `integralStickelbergerMap_surjective`, `stickelbergerIdeal_eq_intersection`, and `denominatorIdeal_generators`. The generators of `J_m` are `[b]−b` for all positive integers b prime to m. It is essential to allow integers representing the same residue more than once: taking `b=1+m` gives `−m`, and this includes the denominator-clearing relation `mθ_m`. Prove the coefficient congruence criterion `x∈J_m ↔ Σ_a n_a a₀≡0 mod m` for `x=Σ_a n_a[a]`. It follows by comparing every coefficient modulo m, using that multiplication by a unit permutes residues. Source: Sharifi Definition 4.5.1(b) and Lemma 4.5.2, p.114.

**Checks.**

- At `m=2`, `J_2=2ℤ` but `I_2=ℤ` under the one-element group-ring identification. The named target `stickelbergerIdeals_two` states these ideal equalities. These two ideals must not be conflated.
- At `m=3`, `1∉J_3`, while `(2[2]−1)θ_3=1`, so `1∈I_3` and `I_3=ℤ[G_3]`. The named target `stickelbergerIdeals_three` states all three assertions. Equality of denominator and image ideals would be wrong.
- The representative `b=1` gives the zero generator; the equally valid representative `b=1+m` gives `−m`. Restricting the generators to one residue system omits a necessary integral relation.
- For `x=[b]−b`, the congruence criterion reads `b₀−b≡0 mod m`, as required. The sign in this generator is opposite to the positive smoothing of §2.3, but the ideals are unchanged.

For `integralGroupRingCast`, the following three Checks use the coefficient-extension formula in Mathlib's `MonoidAlgebra.coeff_mapRingHom` and `mapRingHom_single`.

- At conductor five, `[3]` maps to `[3]` and differs from `[2]`; coefficient extension must preserve the basis index.
- The coefficient of `[3]` in the image of `−2[3]+3[2]` is −2; the sign is preserved.
- The image of `−2[3]+3[2]` is exactly the same two-term rational sum, with coefficient 3 at `[2]`. Distinct support entries must not merge. Suggested.lean proves these cast Checks in two examples.

For `integralStickelbergerMap`, the following three Checks are named theorem targets on the ideal subtypes in Suggested.lean. Each asserts the existence of the indicated denominator-ideal element and computes its image, using the finite sums of §§2.1–2.3.

- `integralStickelbergerMap_two`: the multiplier 2 at conductor two maps to 1.
- `integralStickelbergerMap_three`: the multiplier `2[−1]−1` at conductor three maps to 1.
- `integralStickelbergerMap_five`: the multiplier `2−[2]` at conductor five maps to `[2]+[4]`. The unequal coefficients of θ₅ and the inverse basis determine these two image indices.

### 2.3 Positive smoothing and floor coefficients

Define `smoothedStickelberger m b : ℤ[G_m]` for natural b by the finite sum of floors. For `m≥2` and `b.Coprime m`, prove `smoothedStickelberger_cast`:

```text
s_(m,b) = Σ_(a∈G_m) floor(b a₀/m)[a⁻¹] = (b−[b])θ_m.
```

The cast to `ℚ[G_m]` is injective. Show `smoothedStickelberger_mem`, the coefficient formula, `s_(m,1)=0`, `s_(m,b+m)=s_(m,b)+mθ_m`, and the product relation `s_(m,bd)=b s_(m,d)+[d]s_(m,b)` when b and d are positive and prime to m. The last equality is in the integral group ring after casting and expanding. Every floor is the ordinary natural quotient, so no signed representative is used. Source: Sharifi Lemma 4.5.2 and its coefficient calculation, p.114; the sign is chosen to make the floors nonnegative.

**Checks.**

- At `m=5,b=2`, the coefficients at `[3]` and `[2]` are zero and one. Suggested.lean proves both values. Smoothing with `[b]−b` would give zero and minus one.
- At `m=5,b=6`, `[6]=[1]` but `s_(5,6)=5θ_5`, which is nonzero; `smoothedStickelberger_five_six` states this after the integral cast. Reducing b modulo m before taking floors is incorrect.
- At `m=2,b=3`, the group ring is `ℤ` and `s_(2,3)=1`, as stated by `smoothedStickelberger_two_three`. This witnesses integral smoothing at the smallest conductor.
- At `b=1` all coefficients are zero. The formula exists for `b=0`, but the annihilation theorem's coprimality hypothesis excludes it when `m≥2`.

### 2.4 Gauss sums, valuations and descent

Let `m≥2`, let `ℓ≡1 mod m` be a rational prime, and let `𝔩|ℓ` in `K_m`. Define `compatibleGaussData` to bundle this prime, compatible primitive roots, a generator c of `𝔽_ℓˣ`, and a character χ with `χ(c)=ζ_m` and `ζ_m mod 𝔩=c^(-(ℓ−1)/m)`. Its sum is the native `gaussSum` with the negative sign fixed in the supplier contract. An arbitrary generator without this equality gives a different indexing of the ideal factors. Source: Sharifi Lemma 4.5.4, p.115, and proof of Theorem 4.5.6, pp.115–117.

Prove existence of compatible data and its independence under simultaneous reindexing of c, χ and the prime factors. The API includes the root-reduction equality, transport of the chosen prime, comparison with the native sum, and compatibility with field embeddings. Use the supplied Gauss ideal relation to prove `gaussSum_smoothed_descent`: for every `x∈J_m`, the exponent action gives `g^x∈K_mˣ` and `(g^x)=𝔩^(xθ_m)`. Extend each `σ_a` to fix `ζ_ℓ`; these extensions are canonical since m and ℓ are coprime. The action on elements and fractional ideals is the same covariant action. Prove independence of the extension, multiplicativity in x, and compatibility with the integral Stickelberger map. The descent assertion kills the root-of-unity inertia factor using precisely the denominator-ideal congruence, rather than assuming that g itself lies in `K_m`.

**Checks.**

- At `m=2` χ is quadratic and nontrivial. The valuation is `(ℓ−1)/2`, and squaring the appropriate Gauss sum yields the familiar quadratic principal ideal, with ideal independent of its sign.
- At `m=5,ℓ=11`, fix `ζ₅ mod 𝔩=3` and `c=2`, so `c^(−2)=3`. Replacing c by `c³=8` with the same prime and χ gives `8^(−2)=5≠3` and `χ(c³)=ζ₅³≠ζ₅`; this bundle fails compatibility. Changes with `u≡1 mod m` preserve these conditions. At `m=2,ℓ=7`, both primitive generators 3 and 5 give inverse cube −1 and the same quadratic character value, so a generator change alone need not break compatibility.
- Under `τ_y:ζ_ℓ↦ζ_ℓ^y`, `g` is multiplied by `χ(y)⁻¹`. The exponent `x∈J_m` kills this root-of-unity factor. The exponents `x=0` and `x=m` give respectively one and a descended mth power.
- For the trivial character on `𝔽_ℓˣ`, the product is one, providing a negative control for a missing nontriviality hypothesis. Over `𝔽_(ℓ²)` with nontrivial χ the absolute product factor is `ℓ²`.

### 2.5 Annihilation of the full native class group

Prove `stickelbergerIdeal_annihilates`: for every `m≥2`, every `x∈I_m` and every class `a∈Cl(O_m)`, `x·a=0`. This concerns the full finite class group, without restricting to its odd part or assuming that m is prime. Transport it to any number field equipped with `IsCyclotomicExtension {m} ℚ K`. The concrete signature in Suggested.lean states that every positive smoothing annihilates by the corresponding product of transformed ideal classes; the general ideal statement follows from the generators of `J_m`.

The proof first represents each ideal class by a prime above a rational prime `ℓ≡1 mod m`. Use the Hilbert class field, its normality over `ℚ`, and Chebotarev to impose the desired Artin class while making the rational prime split in `K_m`. Apply §2.4 to principalize its smoothed powers and extend by multiplicativity. Finite sets of excluded primes are avoided in the same prime-selection statement. This prime-representative step is part of the target, not an assumption that every arbitrary prime splits over `ℚ`. Source: Sharifi Theorem 4.5.6 and proof, pp.115–117.

Prove `stickelberger_smoothing_annihilates`, `stickelberger_annihilation_equivariant`, and compatibility with the p-primary projection. At `m=3`, §2.2's unit in `I_3` forces the class group to vanish, agreeing with the direct class-number computation. At `m=2` the same is true. A rational element θ itself is not asserted to act integrally on a class group; the theorem always uses an element of `I_m`.

### Examples

At conductor three, `θ_3=(1+2c)/3` and `(2c−1)θ_3=1`. At conductor five, positive smoothing with two is the sum of the basis elements indexed by inverses of the residues three and four, since the floors of `2a/5` are `0,0,1,1`. The coefficient pair in the conventions section records the first two nontrivial inverse-index tests. The all-conductor theorem includes even conductors; its proof needs nontrivial auxiliary characters, not an odd-conductor hypothesis.

### Dependencies

Layers 0–1 for class-field conventions; basic cyclotomic ramification and splitting; native finite-field characters and Gauss sums; fractional-ideal valuations; ClassFieldTheory's Hilbert class fields; Chebotarev's prime selection. General finite-field character-sum algebra is consumed from the existing library where available; the new targets are the compatible arithmetic data, smoothing descent, integral ideal, and annihilation comparisons.

## Layer 3: Bernoulli annihilators, reflection and class-number products

### 3.1 Bernoulli evaluation and p-adic congruences

For a nontrivial character χ with values in a characteristic-zero field, prove `characterBernoulli_even_zero` when χ is even, and `characterBernoulli_induced`: if χ₀ is primitive of conductor f and χ is its zero-extended induction at a multiple m of f, then

```text
B_(1,χ at modulus m) = B_(1,χ₀) ∏_(ℓ|m, ℓ∤f) (1−χ₀(ℓ)).
```

The product is over distinct new prime divisors. Inflating the modulus without introducing a new prime leaves the value unchanged. Primitive-conductor notation and induction as a native Dirichlet character must be distinguished: the latter vanishes also at the new nonunits. Establish `characterBernoulli_induced_trans`: for `f|m|n`, induction in two steps agrees with direct induction, with each new prime factor appearing once. Prove `characterBernoulli_generatingSeries`: at the primitive conductor f, the coefficient of t in `Σ_(a=1)^f χ(a) t exp(at)/(exp(ft)−1)` is `B_(1,χ)`. Interpret each quotient after cancelling t; its denominator then has the nonzero constant f. These are arithmetic comparisons on the supplied value. Sources: Sharifi Definition 4.2.4, Remarks 4.2.5–4.2.7, Lemma 4.2.10 and Corollary 4.2.11, pp.102–103; the induced-character formula follows by removing multiples of each new prime from the finite sum.

Prove `character_eval_stickelberger` with value `B_(1,χ⁻¹)` when χ is nontrivial at conductor m. At prime conductor, for odd p, even `2≤k≤p−3`, and the fixed p-adic embedding, prove

```text
B_(1,ω^(k−1)) ∈ ℤ_p,
B_(1,ω^(k−1)) ≡ B_k/k mod p.
```

Also prove the separate exceptional calculation `p B_(1,ω⁻¹)∈ℤ_pˣ` and `p B_(1,ω⁻¹)≡−1 mod p`. The latter value is not itself p-integral. Prove the ordinary Bernoulli denominator and Kummer congruences used here in the existing Bernoulli API: `p B_n` is p-integral; for positive even n with `(p−1)∤n`, `B_n/n` is p-integral and its residue depends only on n modulo `p−1`. Use finite power-sum identities and the finite sums above to pass to Teichmüller values modulo `p²`. These finite arithmetic comparison theorems are targets here; they do not require a p-adic L-function. Sources: Mazur I §2, pp.52–54, proof of Corollary 2.9; Ribet Lemma 3.1, pp.156–157. The index range keeps k and its Bernoulli denominator p-units.

**Checks.**

- For the odd quadratic character modulo three, the finite sum is `(1−2)/3=−1/3`. For the odd character modulo four it is `(1−3)/4=−1/2`. These values fix both the sign and the conductor denominator and are Checks of the native generalized Bernoulli convention.
- A nontrivial even character has first Bernoulli value zero; the trivial character is excluded. The raw sum `m⁻¹Σ a₀χ(a)` at modulus one is zero, while the supplied generalized value there is `1/2`; the nontriviality hypothesis is essential to its first-degree residue formula. The primitive trivial value is `B_(1,1)=1/2` and `L(0,1)=−1/2`, agreeing with the ordinary number `B₁=−1/2`. Over a field of characteristic dividing m the raw expression has inverse of m equal to zero; the supplied ℚ-algebra carrier and all arithmetic congruence statements exclude that coefficient field.
- At `p=5,k=2`, the integral value `B_(1,ω)` reduces to `B₂/2=1/12≡3 mod 5`. It is a unit. The excluded character `ω⁻¹=ω³` has a pole of order one in its denominator instead.
- Inflating a nontrivial character from conductor f to modulus fℓ introduces `1−χ(ℓ)` when `ℓ∤f`. That factor can vanish, so the primitive-conductor condition cannot be replaced by a modulus label.

### 3.2 Integral characterwise annihilation and Herbrand's implication

For odd p, write `A=A_p(K_p)`. Prove `bernoulli_annihilates_component`: for every odd index `i≢1 mod p−1`, the p-integral scalar `B_(1,ω^(−i))` kills `A^(i)`. Choose a positive b prime to p for which `b−ω(b)^i` is a p-adic unit and project the positive smoothing of §2.3. Such a b exists because `i≢1`; reduction of the two characters differs somewhere. The equality of its projected scalar with `(b−ω(b)^i)B_(1,ω^(−i))` fixes the inverse index. Source: Sharifi Theorem 4.5.7, p.117; Mazur Proposition 2.8, p.53.

For `i=1`, use `b=1+p`, so that `[b]=1` at conductor p. The smoothing scalar is `p B_(1,ω⁻¹)`, a unit by §3.1. Deduce `cyclotomicClassEigenspace_one_eq_zero`. This handles the exception by integral smoothing; it never applies the nonintegral value `B_(1,ω⁻¹)` directly to a finite module.

Prove `herbrand`: if `2≤k≤p−3` is even and `A^(1−k)≠0`, then p divides the integer numerator of `B_k`. Its contrapositive is the form used for inverse-character vanishing. A nonzero finite p-group cannot be killed by a p-adic unit. The converse is constructed in Layer 4, rather than inferred from an annihilator. Sources: Mazur Corollary 2.9, pp.53–54; Sharifi Theorem 4.5.7, p.117.

The distinguished components must remain separate: `A^(1)=0` is the exceptional Stickelberger calculation, while `A^(−1)=0` follows from `B₂`. They coincide only when the index group has order two, as at p=3. At p=5 they are exponents one and three, and a convention test must distinguish them.

### 3.3 Kummer reflection with the correct dual action

Build the reflection comparison for an odd prime p, a totally real number field F, a totally odd finite-order character χ of `G_F` of order prime to p, and a finite abelian extension `E/F` of degree prime to p containing the field cut out by χ and `μ_p`. Let `𝒪` be an unramified p-adic integer ring containing the character values, k its residue field, and measure each character component by `dim_k` after tensoring with 𝒪 and reducing modulo p. Set `ψ=ωχ⁻¹`. Prove the inequalities

```text
dim_k(A_E/p A_E)^ψ − δ_χ ≤ dim_k(A_E/p A_E)^χ,
dim_k(A_E/p A_E)^χ ≤ dim_k(A_E/p A_E)^ψ
                         + dim_k(E_E/E_E^p)^ψ.
```

Here `δ_χ` is one precisely when `χ=ω` and adjoining pth roots of the roots of unity of E gives an unramified extension of E; it is zero otherwise. It is roots of unity of E in this condition. This formulation avoids multiplying one side by the residue degree of a different coefficient field. Prove invariance under further unramified coefficient extension. Source: Sharifi Theorem 4.4.2 and proof, pp.111–113; the proof's Kummer radical uses `μ(E)`.

Define `unramifiedKummerRadical E p` as the subgroup of `Eˣ/Eˣᵖ` whose elements generate extensions unramified at all finite places, with the real-place condition where needed. Construct the ideal-class map from a radical represented by x: unramifiedness implies `(x)=𝔞^p`, and send it to `[𝔞]∈Cl(E)[p]`. Its kernel is the unramified unit radical. Use the supplied Kummer pairing and global reciprocity to obtain the exact sequence from this unit radical to `Hom(A_E,μ_p)` to `Cl(E)[p]`. Give `unramifiedRadical_independent_representative`, `unramifiedRadical_idealClass`, `unramifiedRadical_kernel`, and `kummerPairing_equivariant`. Sources: Sharifi Lemma 1.4.6, p.25, and Theorem 4.4.2, pp.111–113.

**Checks.**

- The representative x=1 gives the trivial extension and zero ideal class. Replacing x by `x y^p` multiplies 𝔞 by the principal ideal `(y)` and preserves its class.
- An element having valuation one at a finite prime is not in this radical: adjoining its pth root is ramified there. Being an arbitrary Kummer class is insufficient.
- On a component with action `ω^i`, `Hom(−,μ_p)` has character `ω^(1−i)`, because the target carries ω. `Hom(−,𝔽_p)` with constant target has character `ω^(−i)` instead.
- If the coefficient residue field is enlarged from k to k′, the displayed dimensions remain the same after extension of scalars. Treating them as absolute `𝔽_p` dimensions without the corresponding degree factor would fail this check.

Specialize to `E=K_p,F=ℚ`. Prove `classComponent_zero` and the reflection bounds

```text
A^(0)=A^(1)=0,
r_p(A^(k)) ≤ r_p(A^(1−k)) ≤ r_p(A^(k))+1       (k even).
```

Here `r_p(B)=dim_(𝔽_p)(B/pB)`. The rank of the even unit component is one except at index zero, where it is zero. The cyclotomic pth-root-of-unity extension is ramified, so the exceptional δ is zero. The invariant class component is zero by the degree-prime-to-p norm comparison with `ℚ`; its class group is trivial. Sources: Sharifi Lemma 4.4.3 and Corollaries 4.4.4–4.4.5, p.113. Reflection bounds ranks; they do not assert an isomorphism of the reflected class components.

### 3.4 CM units, regulators and the relative class number

For a CM number field F write `Q_F` for the native Hasse index in the supplier contract and `w_F=#μ(F)`. For every cyclotomic prime-power field `K_(p^r)` with `p^r>2`, prove `primePower_indexRealUnits_eq_one : Q_(K_(p^r))=1`. Use the native criterion `indexRealUnits_eq_two_iff` and the unique ramified prime to exclude index two. This arithmetic specialization applies to any number field K with `IsCyclotomicExtension {p^r} ℚ K` and its CM structure, for prime p, `r≥1` and `p^r>2`. Source: Sharifi Lemma 4.2.17, p.106. Use the standard weighted complex-place regulator of that API in the character products below.

**Checks.**

- For `ℚ(ζ₃)` the roots-of-unity group has order six, `E⁺={±1}`, and `[E:E⁺]=3`, giving Q=1. Counting only the pth roots would give the wrong identity.
- For `ℚ(i)`, `w=4` and `[E:E⁺]=2`, again Q=1. Both regulators are one because their free ranks are zero.
- For `ℚ(ζ₈)` the real field is `ℚ(√2)`, Q=1 and `R_F=2R_(F⁺)`. This detects an unweighted complex logarithm convention.
- Conductor two is the rational field and is not a CM extension of its maximal real field; it is treated directly rather than inserted into the degree-two CM identities.

For a primitive quadratic complex Dirichlet character χ of conductor f, prove `quadraticCharacter_gaussSum`: the positive Gauss sum `τ(χ)=Σ_(a mod f)χ(a)exp(2πia/f)` is the positive real `√f` when χ is even and `i√f` when χ is odd. Include the primitive trivial character at conductor one. Identify primitive quadratic characters with the characters of fundamental discriminants, evaluate the odd-prime sums with their signs, compute the dyadic sums at conductors four and eight, and use Chinese remainders with the quadratic reciprocity factors to obtain every primitive conductor. This is an arithmetic target here; the square of a Gauss sum alone does not fix its sign. Source: Montgomery–Vaughan, *Multiplicative Number Theory I*, §9.3, Theorem 9.17 and proof, p.286 (Theorem 17 in the linked chapter draft).

**Checks.**

- The quadratic character of discriminant −3 has `τ=i√3`, while that of discriminant 5 has `τ=√5`.
- The characters of discriminants −4, 8 and −8 give respectively `2i`, `√8` and `i√8`. These include both primitive quadratic signs at conductor eight.
- At conductor one the unique character gives `τ=1`; the same character represented imprimitively at conductor two does not satisfy the primitive hypothesis.

For any abelian number field F with primitive character group `X(F)`, prove `abelianCharacter_gauss_product`:

```text
∏_(χ∈X(F)) τ(χ) = i^(r₂(F)) √|D_F|.
```

Use the positive exponential in every Gauss sum and the positive real square root on the right. Pair each nonquadratic χ with χ⁻¹, proving `τ(χ)τ(χ⁻¹)=χ(−1)fχ` at every common primitive conductor from finite Fourier orthogonality and complex conjugation. The pinned `DirichletCharacter.IsPrimitive.fourierTransform_eq_inv_mul_gaussSum` supplies the Fourier identity at composite conductors as well as prime ones; the finite-field product formula alone does not cover this case. Sources for this inverse-pair calculation are Montgomery–Vaughan §9.2, Theorems 9.5 and 9.7, pp.273–274 (Theorems 5 and 7 in the draft). Evaluate the remaining quadratic characters with `quadraticCharacter_gaussSum`. An odd inverse pair contributes phase −1 and two odd characters; an odd quadratic character contributes phase i and one odd character. Since the number of odd characters is `r₂(F)`, the phase is exactly the displayed power of i. ClassFieldTheory's conductor–discriminant formula gives the positive magnitude. Source: Sharifi equation (4.2.2), p.107; this finite-character proof uses no Artin or Dedekind functional equation.

**Checks.**

- For ℚ the product is the conductor-one Gauss sum 1 and `D=1,r₂=0`.
- For `ℚ(i)`, `D=−4,r₂=1`, the product is `2i`. For `ℚ(√2)`, `D=8,r₂=0`, it is `√8`.
- For `ℚ(ζ₅)`, the odd inverse pair contributes −5 and the quadratic character contributes `√5`, giving `−5√5=i²√125`. Taking only absolute values loses this minus sign.

For abelian CM F, define `relativeClassNumber F = h(F)/h(F⁺)` initially as a positive rational number. The general character product below is an equality of positive rational numbers. For the prime-power fields write it `h_m⁻` and prove integrality directly by norm. Prove `relativeClassNumber_character_product` and `realClassNumber_log_product`:

```text
h(F)/h(F⁺) = Q_F w_F ∏_(χ odd in X(F)) (−B_(1,χ)/2),
h(F⁺) R_(F⁺) = ∏_(1≠χ even in X(F))
                  (−(1/2) Σ_(a=1)^(fχ) χ(a) log|1−exp(2πia/fχ)|).
```

Each χ on the right is used at its primitive conductor. The products are embedded in ℂ, and comparison with the positive rational or real left side is part of the statement. Source: Sharifi Theorem 4.2.20, pp.107–108. The full class number, real class number and their ratio must not be replaced by the cardinality of a chosen eigenspace.

Give `relativeClassNumber_pos`, `relativeClassNumber_mul_real` and `relativeClassNumber_primePower_integral`. **Checks.** For `ℚ(ζ₃)` and `ℚ(i)` the ratio is one and their respective odd-character products use w=6 and w=4. For `ℚ(ζ₈)` it is also one, although the real field has positive unit rank. If the two class numbers are abstractly h and h⁺, the definition is the rational quotient h/h⁺; integrality requires the arithmetic norm argument and is not a property of arbitrary pairs of positive integers. Taking conductor two has no CM character product, while its direct full and real class numbers are both one.

Build the analytic bridge as follows. Prove the Euler-product identity `ζ_F(s)=∏_(χ∈X(F))L(χ,s)` for `Re(s)>1` using the existing splitting law. Compare right-hand limits at one with Mathlib's `dedekindZeta_residue`; the trivial primitive factor is the Riemann zeta factor. Derive `L(0,χ)=−B_(1,χ)` and the finite logarithmic formula at one for nontrivial even χ, using the existing Dirichlet meromorphic-extension and functional equation, or the finite Fourier expansion of `−log(1−z)`. Keep the gamma parity and Gauss-sum normalization of the native functions. Use `abelianCharacter_gauss_product` for F and F⁺, together with ClassFieldTheory's conductor–discriminant theorem and the CM regulator comparison above, to cancel discriminants, Gauss phases, roots of unity and powers of two in the relative product. Apply the same signed Gauss-product identity to the totally real field F⁺ in the logarithmic class-number product. The special-value comparisons and the Euler-product bridge are targets here; meromorphic extension, the functional equation and conductor–discriminant are imports. Sources: Sharifi Proposition 4.1.21, pp.100–101, Proposition 4.2.13 and Theorem 4.2.14, pp.103–105, and Theorem 4.2.20, pp.107–108.

### Examples

For `F=ℚ(ζ₃)`, its single odd character has `B_(1,χ)=−1/3`. The product gives `6·(1/6)=1`, as required. For `F=ℚ(i)` it gives `4·(1/4)=1`. Both real fields are rational, so their real logarithmic products are empty and equal one, matching `h=R=1`. At p=5 the Herbrand component associated to `B₂` is exponent three; the exceptional exponent-one component is obtained by a different unit smoothing.

### Dependencies

Layers 0–2; native ordinary and generalized Bernoulli numbers, finite character sums, complex logarithms and regulators; Mathlib's Dirichlet meromorphic-extension and Dedekind-zeta residue; ClassFieldTheory's Kummer pairing, Hilbert class fields and conductor–discriminant theorem; finite Galois cohomology. The new work consists of the finite special-value comparisons, integral annihilators, Kummer radical and reflection sequence, cyclotomic Hasse-index calculation and the displayed class-number products.

## Layer 4: the modular construction and Herbrand–Ribet

### 4.1 A determinant bound for the relative class number

For an odd prime p put `d=(p−1)/2` and choose `R={1,…,d}` as representatives of `(ℤ/pℤ)ˣ/{±1}`. Define the integer `oddResidueMatrix p` by

```text
B_(a,b) = 2 r_p(a b⁻¹) − p,             a,b∈R,
```

where `r_p` is the representative in `1,…,p−1`. Inversion is in `(ℤ/pℤ)ˣ`. The definition uses a fixed representative system, while the absolute determinant is independent of changing that system or its ordering: changing a representative negates the corresponding row or column. Give `oddResidueMatrix_entry`, `oddResidueMatrix_change_representatives`, `oddResidueMatrix_row_norm`, and `oddResidueMatrix_character_eigenvalues`.

Extend a character vector from R to an odd function on the full unit group. Pairing c and −c in the full convolution shows that its eigenvalue is `p B_(1,χ⁻¹)` for each odd χ. The character vectors form a basis over a splitting field. With §3.4 and `Q_(K_p)=1,w_(K_p)=2p`, prove `oddResidueMatrix_det` and the row-norm identity

```text
|det B| = (2p)^(d−1) h_p⁻,
Σ_(b∈R) B_(a,b)^2 = p(p−1)(p−2)/6.
```

Apply Hadamard to obtain `h_p⁻≤[p(p−1)(p−2)/6]^(d/2)/(2p)^(d−1)`. For `p≥5`, the ratio of this upper bound to `p^(d/2)` is strictly less than `2p/24^(d/2)<1`. The last inequality holds at p=5 and remains true on increasing odd p by two. At p=3 the determinant is `[-1]` and `h_3⁻=1<√3`. Thus prove `relativeClassNumber_lt : h_p⁻ < p^((p−1)/4)` for every odd prime. Real exponents and inequalities are taken in ℝ. This is the numerical bound needed in Ribet Theorem 3.3, p.157; the determinant proof here derives it directly from Sharifi Theorem 4.2.20, pp.107–108, and the native Hadamard inequality.

**Checks.**

- At p=5 the matrix is `[[-3,1],[-1,-3]]`, with determinant ten. Division by `(2p)^(d−1)=10` gives `h_5⁻=1`. Missing the centering term or the factor two fails this calculation.
- At p=3 the matrix has size one and determinant −1. The exponent `d−1` is zero, so the class-number formula has no extra factor of p.
- Replacing one representative a by −a changes its row sign and, if the column representative is changed too, its column sign; the absolute determinant and each row's squared norm are unchanged.
- At p=5 the eigenvalues are the two complex-conjugate values `5 B_(1,χ)` for the odd characters. Their product is ten. Using the even-character space would introduce a zero eigenvalue.

Let t be the number of even `k∈[2,p−3]` for which p divides the numerator of `B_k`. Prove `irregular_count_bound : t<(p−1)/4`. The relative class-number product, integrality of all the nonexceptional Bernoulli factors and the exceptional unit `p B_(1,ω⁻¹)` show `p^t∣h_p⁻`. Then `p^t≤h_p⁻<p^((p−1)/4)`. This proof precedes Ribet's converse and does not use it. Sources: Ribet Theorem 3.3 and its concluding argument, pp.157–158; the finite congruence is §3.1.

### 4.2 The integral prime-level Eisenstein congruence

Assume p is odd, `2≤k≤p−3` is even, and `p∣num(B_k)`. Put `ε=ω^(k−2)`, interpreted as a complex Dirichlet character through a fixed embedding of the `(p−1)`st roots, and choose a prime 𝔭 above p realizing the given Teichmüller reduction. Necessarily `k≥4`, since `B₂=1/6`, and ε is nontrivial and even. Work over the localization of the ring of integers of `ℚ(μ_(p−1))` at 𝔭, not over a coefficient field with no integral lattice.

Prove `primeLevel_eisenstein_integral_congruence`: the existing weight-two and weight-one Eisenstein series have p-integral expansions and

```text
G_(2,ω^(k−2)) ≡ G_(1,ω^(k−1))
             ≡ −B_k/(2k) + Σ_(n≥1)(Σ_(d|n)d^(k−1))q^n mod 𝔭.
```

Here the two forms have different weights, and the congruence is of formal Fourier expansions. Their constants are respectively `L(−1,ω^(k−2))/2` and `L(0,ω^(k−1))/2`. Prove `eisenstein_constant_bernoulli_two`, identifying the analytic value `L(−1,ε)` with `−B_(2,ε)/2` and deriving its integral constant-term congruence from the degree-two character sum. This is the constant-term comparison needed in addition to §3.1. Source: Ribet Lemma 3.1, pp.156–157.

Prove `primeLevel_unit_constant_form`: there exists a weight-two form g of character ε with p-integral Fourier coefficients and constant one. Use either `G_(2,ε)` when its constant is a unit or a product `G_(1,ω^(n−1))G_(1,ω^(m−1))` with even `n,m∈[2,p−3]`, `n+m≡k mod p−1`, both Bernoulli numerators prime to p. If none of those products has unit constant, consider the involution `n↦k−n` on the d even residue classes modulo p−1, where `d=(p−1)/2`. Remove 0 and k. The remaining d−2 classes pair among themselves, and each orbit must contain an irregular index. Since k is already irregular, this gives at least `1+(d−2)/2=d/2` irregular indices, including the fixed-point orbits with their actual multiplicity. This contradicts §4.1. Divide by the resulting unit constant. This finite counting argument and the modular-form product are targets; existence of g is not an independent assumption. Sources: Ribet Corollary 3.2 and Theorem 3.3, p.157.

Prove `finiteHecke_eigencharacter_lift` at the algebraic level. Let O be a DVR, K its fraction field, M a nonzero finite free O-module, and T a commutative O-subalgebra of `End_O(M)` finite as an O-module. Given a residual O-algebra character `φ:T→k′` occurring in `M⊗_O k′`, for a finite extension k′ of the residue field, there exist a finite extension K′/K, an extension of the valuation with residue embedding of the values of φ, and a nonzero simultaneous T-eigenvector in `M⊗_O K′` whose integral eigencharacter reduces to φ. No semisimplicity or distinctness of residual eigenvalues is required. Let 𝔪=ker φ, with its finite residue embedding `T/𝔪↪k′`. Choose a minimal prime 𝔮 contained in 𝔪 and an extension of the valuation on the finite field `Frac(T/𝔮)` centered at 𝔪. Its residue field is a finite extension of `T/𝔪`; embed it and k′ into a common finite residue extension so that the two embeddings of `T/𝔪` agree. The faithful generic action gives an eigenline for 𝔮 after a finite splitting-field extension, and its integral eigencharacter reduces to φ under these embeddings. Finite freeness prevents a residual component supported only in torsion. This is an algebraic target here; the finite Hecke algebra and its lattice are the supplied modular objects. Sources: Deligne–Serre, *Formes modulaires de poids 1*, §6, Lemme 6.11, p.522, for eigencharacter lifting; Ribet Proposition 3.5, pp.158–159, for its modular application. The formulation over an arbitrary DVR with the specified finite residue extension uses the finite torsion-free algebra argument above.

**Checks.** On a rank-one lattice with T=O, the scalar character lifts to itself. For `diag(1,1+ϖ)` on O² the coincident residual eigenvalues admit a lift; residual distinctness is unnecessary. On the zero lattice there is no occurring residual character, so the nonzero-vector conclusion has no instance. A module equal to the residue field has a nonzero residual vector and zero generic fiber, showing why torsion freeness cannot be omitted.

With c the constant of `G_(2,ε)`, form `f₀=G_(2,ε)−cg`. It has zero constant at infinity and is congruent to `G_(2,ε)`. It need not yet be cuspidal at the other cusp. Apply `finiteHecke_eigencharacter_lift` to its nonzero residual eigensystem. The noncuspidal eigensystem in the space of forms vanishing at infinity has eigenvalue `ε(ℓ)+ℓ`, while the desired one has `1+ℓε(ℓ)`. These are distinct modulo 𝔭 for a rational prime ℓ with `ε(ℓ)≠1`: equality would imply `(ℓ−1)(ε(ℓ)−1)=0`, and the chosen nontrivial Teichmüller value also implies `ℓ≠1 mod p`. Dirichlet's theorem supplies such an ℓ. Conclude `primeLevel_cuspidal_eigenlift`.

Normalize the lifted form and prove it is an eigenform for every Hecke operator, including at p, and is new at level p. The old weight-two level-one cuspidal space is zero. The target is a normalized cuspidal eigenform f with coefficients in a number field E, a single prime λ above p, character ε, and

```text
a_ℓ(f) ≡ 1+ℓ^(k−1) mod λ       for every prime ℓ≠p.
```

The same λ works for all ℓ. Sources: Ribet Propositions 3.4–3.6 and Theorem 3.7, pp.158–159. The Fourier-expansion and characteristic-zero Hecke machinery is imported from ModularForms; the finite eigencharacter lifting comparison and its prime-level cusp application are targets above.

Checks of the comparison include the constant `−B_k/(2k)`, the first coefficient one, and the coefficient at a prime ℓ, `1+ℓ^(k−1)`. At a prime with nontrivial ε value, reversing the two Eisenstein series changes that eigenvalue. At k=2 the divisibility hypothesis is false, so no argument may infer a nontrivial ε from evenness alone.

### 4.3 Shared abelian arithmetic and the modular residual extension

The field-valued abelian constructions in this subsection form a shared package on Tau Ceti's `AbelianVariety k` and `AbelianVariety.End B`. The native Hom group comes from `TauCeti.AlgebraicGeometry.AbelianVariety.MorphismGroup`; Suggested.lean states the finite-free and rank-bound part of `homFreeFinite` on its additive reindexing. The public geometric objects are `AbelianTate`, `End.charpoly`, `End.trace` and `Polarization.rosati`; the names beginning with abelian below are comparisons to these objects. The degree and intersection theory, torsion and characteristic-polynomial comparisons, and positivity precede the finite-field Frobenius theorem. These targets quantify over arbitrary fields and abelian varieties. The modular coefficient projection and irreducibility argument are their applications.

The shared modular constructor is `modularQuotient f`; `modularAbelianQuotient f` abbreviates this same abelian variety and quotient map. For every normalized weight-two newform f of primitive level N and character ε, with coefficient field E, construct it over ℚ from the native Jacobian of `X₁(N)` and the annihilator of its Hecke eigensystem. Use the point-of-exact-order moduli model `(E,P)` and the Albanese Hecke action: for `X₁(N)←π₁ Z→π₂ X₁(N)`, set `T_ℓ=π₂*π₁^*` and diamond a equal to `I_a*`. Its cotangent action is the classical action on weight-two forms. Define the eigencharacter by `T_n↦a_n(f)`, `⟨a⟩↦ε(a)`. The quotient kills the connected abelian subvariety generated by the images of its kernel. The transpose Picard action is transported to this convention by the cyclotomic Fricke map with its field of definition retained; it is not identified with it on the same quotient. Construct the quotient as an abelian variety, with an action `E→End⁰(A_f)`, and prove `dim A_f=[E:ℚ]` and the quotient's compatibility with changing an embedding of E. The curve-to-Jacobian and abelian-variety carriers are supplied by JacobianChallenge and Tau Ceti. This is the shared Albanese quotient, with its universal quotient map, Hecke order and rational E-action; the cyclotomic application uses its abbreviation. Sources: Ribet §4(i)–(iii), pp.159–160, for the prime-level application; Ribet–Stein, Appendix by B. Conrad, Definition 5.13 and Theorem 5.14, pp.73–74, for the general quotient and coefficient action.

Construct the shared quotient API `abelianSubvarietyQuotient B C` for any abelian subvariety C of an abelian variety B over a field k: the fppf quotient B/C is an abelian variety, with a surjective homomorphism having scheme-theoretic kernel C, universal among homomorphisms killing C, and compatible with field extension. The finite locally free subgroup quotient is included: invariant ample-bundle descent represents the projective quotient, and smoothness and properness descend along the finite flat torsor. Poincaré complete reducibility gives a complement D with `C×D→B` an isogeny and identifies B/C with `D/(C∩D)`. For the acting modular Hecke algebra put `modularQuotientForIdeal I` equal to the quotient by the connected sum of its I-images; finite ideal generators suffice. Its specialization at the eigencharacter kernel is `modularQuotient f`. Provide `modularQuotient_map`, `modularQuotient_kills`, `modularQuotient_lift`, `modularQuotient_hom_ext`, `modularQuotient_baseChange` and `modularQuotient_hecke`. Sources: Milne's 2022 notes, §12, Proposition 12.1, pp.19–20; Milne version 2.00, I §8, Proposition 8.10 and Remarks 8.12 and 8.15, pp.38–40, for the projective finite-group-scheme quotient; Ribet–Stein, Definition 5.13 and proof of Theorem 5.14, p.73, for their modular specialization and rational Tate exactness.

**Checks.** The zero ideal gives the original Jacobian and the unit ideal gives the zero abelian variety. Quotienting B by zero gives B, and quotienting B by itself gives the zero variety. For `N<5` the weight-two cusp space is zero, so there is no normalized newform input. The level-11 rational newform gives dimension one. A weight-twelve level-one form is outside this constructor's weight hypothesis.

Define its λ-adic representation using `AbelianTate A_f p`, scalar extension to `ℚ_p`, and the coefficient projection `E⊗ℚ_p→E_λ`. Prove `modularTate_coefficientComparison`: the resulting Galois representation is canonically the E_λ-factor of the native Tate module of `modularQuotient f`, with its E-action and the specified embedding into E_λ. Compatibility includes changing coefficient embeddings and base field, and intertwining the Albanese Hecke action. Prove `modularTate_rank_two`, continuity, a stable integral lattice, and the arithmetic Frobenius identities

```text
tr ρ_(f,λ)(Frob_ℓ) = a_ℓ(f),
det ρ_(f,λ)(Frob_ℓ) = ε(ℓ)ℓ       (ℓ∤Np).
```

Prove unramifiedness at those primes, using good reduction and the prime-to-residue-characteristic torsion comparison. This arithmetic comparison includes the Eichler–Shimura relation on the special-fiber Jacobian and the rank-two coefficient summand. An analytic Eichler–Shimura isomorphism alone does not imply either statement. Source: Ribet §4(i)–(iii), pp.159–160, especially the arithmetic relation at the start of p.160.

For a prime ℓ different from the characteristic of k, define the shared field realization `AbelianTate B ℓ` as `TauCeti.TateModule ℓ` on the additive group of B-points over a separable closure, with the induced continuous Galois action. Its base-change, homomorphism and finite-level projection maps are those of the native carrier; establish `AbelianTate.modPow`, identifying reduction modulo ℓ^n with the geometric ℓ^n-torsion compatibly with transitions. The cardinality comparison is `abelianTorsion_card`: for an abelian variety B of dimension g over any field k, a prime ℓ different from its characteristic, an algebraic closure Ω and every `n≥0`, the geometric kernel of `[ℓ^n]` has cardinality `ℓ^(2gn)`. Prove that its transition maps are multiplication by ℓ and are surjective, then apply the existing generic Tate-module rank theorem to obtain `abelianTate_rank : rank_(ℤ_ℓ) T_ℓB=2g`. Establish `abelianTate_faithful` for homomorphisms and `abelianTate_goodReduction`, identifying the generic and special geometric prime-to-residue-characteristic torsion, equivariantly for the unramified quotient. The level-cardinality proof applies JacobianChallenge Layer E's `multiplication_isogeny` and `multiplication_etale_iff` to the finite étale kernel of `[ℓ^n]`; smooth proper base change for finite étale torsion gives the good-reduction comparison. Sources: Milne, *Abelian Varieties*, version 2.00, I §7, Theorem 7.2 and Remark 7.3, pp.33–34, I §10, Proposition 10.5 and Lemma 10.6, p.45; IV §3, the forward implication of Theorem 3.5, p.141, for good reduction.

**Checks.** At n=0 the kernel has one point, not zero points. For g=0 the Tate module is zero and all levels have one point. For an elliptic curve the formula is `ℓ^(2n)` and gives rank two; for a product of two elliptic curves it gives rank four. At ℓ equal to the characteristic the geometric-point count can be smaller than the group-scheme degree, so this cardinality theorem has no such instance. Multiplication by ℓ on a free Tate module is injective but not surjective; it must not be confused with the surjective transition between finite torsion levels.

Define `numericalIntersection X Z (L₁,…,L_d)` for a proper k-scheme X, a closed subscheme Z of dimension at most d, and invertible sheaves Lᵢ, as the coefficient of `n₁⋯n_d` in

```text
χ(Z, (L₁|Z)^n₁ ⊗ ⋯ ⊗ (L_d|Z)^n_d).
```

First prove `coherentEuler_polynomial` for every coherent sheaf F on X: the analogous function with F tensored in is an integer-valued rational polynomial of total degree at most `dim Supp F`, for all integer exponents. Use dimension induction and exact sequences for meromorphic sections, so negative exponents are included. Give `intersection_symmetric`, `intersection_tensor_add`, `intersection_projection`, `intersection_cartier_restrict`, `intersection_ample_positive` and field-extension compatibility. The projection formula for an integral d-dimensional Z includes the degree of the function-field extension when its image has dimension d, and is zero when that dimension drops. Sources: Stacks Project, Varieties §45, Lemma 45.1 (tag 0BEM), Definition 45.3 (0BEP), Lemmas 45.4–45.9 (0BEQ–0BEV), pp.101–104; the online chapter numbering is §33.45.

**Checks.** On `ℙ¹`, the one-fold intersection of `O(a)` is a, including negative a. On `ℙ¹×ℙ¹`, the intersection of `O(1,0)` and `O(0,1)` is one, while either one's self-intersection is zero. On a rational point the empty intersection is one, and on a finite closed point it is its residue degree; if d exceeds the support dimension the intersection is zero. In positive dimension a trivial line-bundle factor gives zero. These distinguish the mixed coefficient from the leading coefficient after setting every variable equal, which would introduce a factorial.

Prove `abelianDegree_polynomial`: degree, extended by zero on nonisogenies, extends to a homogeneous rational polynomial of degree 2g on `End⁰(B)`. The shared polynomial is `End.charpoly α`, the unique monic polynomial with `P_α(n)=deg([n]−α)` for every integer n. For an integral endomorphism it lies in ℤ[X]. On rational endomorphisms use `P_(α/d)(X)=d^(−2g)P_α(dX)` for nonzero integer d and prove independence of d. Define `End.trace` as minus the coefficient of degree `2g−1` when g>0 and as zero when g=0. Prove `charpolyTate`, with `abelianCharpoly_tate` its field-realization comparison: P_α is the characteristic polynomial on `AbelianTate B ℓ⊗ℚ_ℓ`, independent of ℓ. Its finite-level reduction is the characteristic polynomial on `B[ℓ^n]` through `AbelianTate.modPow`. Use cube/square for polynomial dependence of pulled-back ample divisors and numerical intersections for degree. To justify integral coefficients, establish `homFreeFinite`: over any field, Hom(B,C) is finite free over ℤ of rank at most `4 dim B dim C`, and its ℤ_ℓ-realization is injective with torsion-free cokernel for ℓ different from the characteristic. Its determinant trick makes integral endomorphisms algebraic integers; the kernel-count comparison identifies the rational polynomial with the Tate characteristic polynomial. Sources: Milne's 2022 notes, §12, Proposition 12.4, Theorem 12.5, Lemma 12.6 and Proposition 12.9, pp.21–23; equivalently Milne version 2.00, I §10, Theorem 10.9 and Propositions 10.13 and 10.20, pp.46–52.

**Checks.** Hom to or from the zero abelian variety is zero. For an elliptic curve over an algebraically closed field the endomorphism rank can be one, two or four; finite freeness makes no commutativity assertion. For a supersingular elliptic curve in characteristic p the p-adic geometric Tate module is zero, so the faithful realization requires ℓ different from p.

Give `endomorphismPolynomial_eval`, `endomorphismPolynomial_smul`, `endomorphismPolynomial_tate`, `endomorphismTrace_add` and `endomorphismTrace_cyclic`. **Checks.** For `[a]` on dimension g the polynomial is `(X−a)^(2g)`, with trace 2ga. For the zero endomorphism in positive dimension it is `X^(2g)` and its constant coefficient is zero. In dimension zero the polynomial is one and the trace is zero, so no coefficient of degree −1 is read. On a product the polynomial is the product of the factor polynomials. For rational endomorphisms denominators are permitted; integrality is asserted only for actual endomorphisms.

Prove `abelianRiemannRoch`: for every invertible sheaf L on B with divisor D, `χ(L)=(D^g)/g!` and `deg φ_L=χ(L)^2`, with degree zero for a nonisogeny φ_L. The comparison is valid in arbitrary characteristic, including inseparable polarizations. The cohomology and cube/square identities are the supplied ones; this degree/intersection comparison is the additional abelian-variety target. Source: Milne, *Abelian Varieties*, author's 2022 notes, §13, Theorem 13.3(a)–(b), p.25. **Checks.** In dimension zero both χ and the degree are one. On an elliptic curve `χ(L)=deg D` and `deg φ_L=(deg D)^2`, including degree zero. A principal ample polarization has χ=1. For a product polarization, χ and its isogeny degree multiply, whereas the top self-intersection includes the binomial coefficient.

For g>0, a polarization from an ample divisor D after algebraic closure, and every rational endomorphism α, prove `rosati_trace_intersection`:

```text
Tr(αα†) = 2g (D^(g−1) · α*D)/(D^g).
```

For rational α extend the integral-endomorphism formula quadratically after clearing a nonzero denominator. One algebraic proof compares the coefficient of `n^(2g−1)` in `deg([n]+α†α)` with `χ(L^n⊗α*L)^2/χ(L)^2`, using Riemann–Roch. The degree and intersection polynomials just constructed justify that comparison without a general étale cycle-class theory. For a nonzero integral α, choose a translate of D whose support does not contain the positive-dimensional image of α. Its pullback is a nonzero effective Cartier divisor, with positive intersection against `D^(g−1)`; translation preserves the polarization and numerical class. Clear denominators for rational α. Prove the shared `rosatiPositivity`: `(α,β)↦Tr(αβ†)` is a symmetric positive-definite rational bilinear form on `End⁰(B)`; `rosati_trace_positive` is its diagonal specialization. Source for the identity and positivity: Milne's 2022 notes, §17, Theorem 17.3, pp.35–36. The denominator is positive because D is ample and g>0; the dimension-zero case is handled separately.

Build `abelianFrobenius_abs` for any abelian variety B over a finite field of cardinality q and any auxiliary prime different from its characteristic: its integral Frobenius polynomial has degree `2 dim B`, and every complex root has absolute value √q. Use the native dual abelian variety and polarization. Use the shared `Polarization.rosati` on `End⁰(B)`, defined by `α↦λ⁻¹αᵛλ`; prove its involution laws and `rosati_trace_positive`, namely `Tr(αα†)>0` for nonzero α. Establish `π†π=q` for Frobenius π. The positivity on the commutative algebra generated by π forces each complex embedding to send † to complex conjugation, so `|ιπ|²=q`. Prove `modularTate_trace_bound`: specialize this polynomial comparison to the actual `E_λ`-rank-two coefficient summand to get `|ιa_ℓ|≤2√ℓ` for every complex embedding ι of E. Its two roots are roots of the full abelian Frobenius polynomial, and its trace is the sum of precisely those two roots; the full `ℚ_p` trace has a different degree. Sources: Milne, *Abelian Varieties*, version 2.00, I §14, Theorem 14.3, pp.61–62; II §1, Theorem 1.1 and Lemmas 1.2–1.3, pp.75–77. Polarizations and dual varieties are supplied by JacobianChallenge; this positivity and arithmetic Frobenius comparison are additional targets here.

Give `rosati_id`, `rosati_comp`, `rosati_scalar`, `rosati_trace_positive`, `frobenius_rosati_mul` and compatibility with polarized isogenies. **Checks.** For an elliptic curve with its principal polarization, `[n]†=[n]` and `Tr([n][n]†)=2n²`, positive exactly for n≠0. On a product with the product polarization, Rosati takes the transpose of a matrix of integer multiplications; the two off-diagonal elementary matrices are exchanged. In dimension zero the endomorphism algebra has no nonzero element, so positivity is vacuous and the Frobenius polynomial is one. At q=1 there is no finite field, so the finite-field theorem has no such instance.

Prove `abelianTate_line_character` for an abelian variety over ℚ with potentially good reduction at p: every one-dimensional coefficient-field character in its p-adic Tate module's semisimplification is `χ_p^n η`, where n is an integer and η has finite order. At p use the p-divisible-group comparison and `hodgeTate_character_iff_locallyAlgebraic` of §4.4 after passing to a field of good reduction. Hodge–Tate descent and the character theorem over ℚ_p make this character locally an integral power of χ_p on an open inertia subgroup. After removing this power, inertia is finite at every prime and the global character factors through a finite ray class group of ℚ, by the supplied global reciprocity. Thus η is finite. This target does not assert local algebraicity for an arbitrary continuous p-adic character. Sources: Ribet Proposition 4.1 and its proof, p.160; Tate, *p-Divisible Groups*, §4.1, Theorem 3 and Corollary 2, pp.179–180; Brian Conrad, Appendix B, Definition B.1 and the following comparison, p.32.

For the prime-level quotient used here, §4.4 supplies potential good reduction at p independently of any residual lattice. If its two-dimensional representation were reducible, apply the preceding character theorem to obtain `χ_p^n₁η₁⊕χ_p^n₂η₂`. The determinant gives `n₁+n₂=1`; after ordering, `n₁≥1,n₂≤0`. For each prime ℓ outside the finite bad set, the reverse triangle inequality gives `|a_ℓ|≥ℓ−1`, contradicting `|a_ℓ|≤2√ℓ` when ℓ≥7. Conclude `modularTate_irreducible`. More generally this argument proves irreducibility of any rank-two modular Tate factor with determinant finite-order times χ_p and potential good reduction at p. The dependency order is: construct the quotient and its good model, establish the characteristic-zero comparison and irreducibility, then choose the nonsplit residual lattice. It does not use the chosen lattice to establish good reduction. Source: Ribet Proposition 4.1, p.160.

Give `modularAbelianQuotient_hecke` as the specialization of `modularQuotient_hecke`, together with `modularTate_frobenius`, `modularTate_irreducible`, `modularTate_change_lattice`, and `modularTate_good_reduction`. The definition has the following checks.

- The λ-adic factor has E_λ-rank two, even if `dim A_f>1`; for `[E:ℚ]=2` the full rational Tate module has dimension four. The coefficient comparison is Galois-equivariant and preserves the same Hecke eigenvalues.
- At an unramified prime the determinant is `ε(ℓ)ℓ`, not `ε(ℓ)ℓ⁻¹`. Geometric Frobenius changes the polynomial, so the arithmetic convention is essential.
- For a rational-coefficient weight-two form whose quotient is an elliptic curve, the construction recovers its ordinary rank-two Tate module and its point-count Frobenius trace.
- Rescaling a full lattice changes the reduction carrier but not the characteristic-zero representation or its characteristic polynomials.

For the form of §4.2, Chebotarev and the trace/determinant identities identify the residual semisimplification with `1⊕χ_p^(k−1)` over a finite residue field 𝔽. The characters are distinct. Apply the existing oriented lattice theorem to obtain a nonsplit exact sequence of actual `G_ℚ`-representations

```text
0 → 𝔽 → V̄ → 𝔽(χ_p^(k−1)) → 0.
```

The residual representation is unramified outside p. Its image is finite because its coefficient field is finite and it is continuous. The lattice theorem is an import from IntegralHeckeAndGaloisDeterminants §1.4, not a new target here. Source: Ribet Proposition 2.1, pp.154–155, and §4, pp.160–161. The local splitting at p is the next target and is not part of the lattice theorem.

### 4.4 Shared local structure and splitting at p

The shared local prefix consists of the finite-flat generic-fiber comparison, `BarsottiTate S p h`, its formal and Tate realizations, and the local character criterion below. It uses ModularCurves' finite group-scheme and connected–étale carriers and PadicPeriodRings' completed-field cohomology. The lattice realization, good model of the modular quotient, and connected–étale splitting are applications to the shared `modularQuotient` of §4.3.

Over a discrete valuation ring R of mixed characteristic `(0,p)`, with fraction field L and absolute ramification index `e<p−1`, prove the shared `prolongation_unique_of_lt` and `genericFibre_map_bijective`. For finite flat commutative R-group schemes killed by a power of p, restriction to the generic fiber is fully faithful, its morphisms have finite flat kernel and cokernel, and a finite flat model of a given generic group is unique up to unique generic-compatible isomorphism. The application names `finiteFlatModel_hom_extend` and `finiteFlatModel_unique` specialize these same maps and uniqueness theorem. A model is an existence hypothesis. Source: Raynaud Theorem 3.3.3 and Corollary 3.3.6, p.268; the finite-vector-space case is Proposition 3.3.2, p.267.

**Checks.** Over ℤ_p for p≥3, `e=1<p−1` and a generic splitting extends uniquely. Prove `prolongation_unique_boundary`: over `R=ℤ_p[ζ_p]`, `e=p−1`, the constant ℤ/p and μ_p have isomorphic generic fibers via `1↦ζ_p` but different special fibers. For p=2 a mixed-characteristic DVR has e≥1 and the strict inequality has no instance. Even below the bound, full faithfulness asserts extension of maps between existing models and supplies no model for an arbitrary representation.

For a finite flat commutative group scheme over a Dedekind domain R with fraction field L, prove the shared `schematicClosure_flat`: the schematic closure of a closed subgroup of its generic fiber is finite flat, has that generic fiber, and is compatible with inclusions. On an affine chart contract the generic Hopf ideal; the quotient coordinate ring embeds in its localization and is torsion free, hence flat over R. Use ModularCurves Layer 0C for the finite flat fppf quotient. The application comparisons are `genericSubgroupClosure_flat` and `finiteFlatQuotient_genericFiber`. Over the small-ramification DVR extend scalar endomorphisms by `genericFibre_map_bijective`, preserving their ring laws by uniqueness. Use the connected–étale sequence of ModularCurves 7E PD-2 to prove `connectedEtale_scalar_stable`. Sources: Raynaud §2.1, pp.259–260; Tate §1.4, pp.159–160, for the finite connected–étale comparison.

**Checks.** The closures of the trivial and full generic subgroups are respectively the unit section and the full flat group. Over `ℤ_p[ζ_p]`, the graph of `ℤ/p≅μ_p` inside the generic fiber of `ℤ/p×μ_p` has a flat schematic closure, even though full faithfulness fails there. Contraction of the generic subgroup ideal gives a subgroup; intersecting a sub-Hopf algebra instead describes a quotient. Over a henselian local ring, a split special-fiber connected–étale sequence need not split over the ring.

To pass from the chosen stable lattice to such a model, prove `abelian_isogeny_realizes_lattice` over any characteristic-zero field k: a G_k-stable full lattice in the full p-adic Tate module of an abelian variety is realized, up to homothety, by a k-isogenous abelian variety. For an E_λ-factor, extend the chosen lattice by stable lattices on the other factors before applying this assertion. Prove `isogeny_preserves_good_reduction` after localization at a place where the original variety has a good abelian model. A finite-index lattice inclusion corresponds to quotienting by a finite Galois-stable torsion subgroup; take its finite flat closure in the good-reduction abelian scheme and form the quotient abelian scheme. Its p-power kernels are finite flat, and coefficient endomorphisms act on the relevant λ-torsion subquotient. This supplies the model of V̄, rather than assuming that reduction of an arbitrary stable lattice preserves an unspecified model. Source: Ribet §4, p.161, paragraph realizing the lattice by an isogenous variety; the group-scheme closure and quotient construction is the general comparison just specified.

Construct the shared scheme-valued carrier `BarsottiTate S p h` for a scheme S, a prime p and height `h≥0`, on the finite locally free commutative group schemes of ModularCurves Layer 0B. It consists of inductive levels G_n of rank `p^(nh)`, with `G_0=0`, compatible closed inclusions, `G_n=ker[p^n]` in every later level and exact sequences `0→G_n→G_(n+m)→G_m→0`. Give `BarsottiTate.truncation`, `BarsottiTate.baseChange`, `BarsottiTate.dual` and `BarsottiTate.ofAbelian`; the last sends an abelian scheme of relative dimension g to its p-power kernels of height 2g. The dual inclusions are induced by dualizing the multiplication-by-p maps between levels. The notation over a ring R means `S=Spec R`, with height still an explicit parameter.

Give `BarsottiTate.tateModule` using the native `TauCeti.TateModule` on the geometric p-primary torsion group after specifying an algebraically closed field Ω of characteristic different from p and a point `Spec Ω→S`. Prove its level projections agree with G_n(Ω), and obtain rank-h freeness from their orders. Over a complete noetherian local ring with residue characteristic p, use the supplied finite connected–étale sequence levelwise to construct `BarsottiTate.connectedEtale`, identify its connected part with a divisible commutative formal Lie group by `BarsottiTate.equivFormalLieGroup`, and define `BarsottiTate.tangentSpace` and `BarsottiTate.dim`. Prove `BarsottiTate.dim_add_dim_cartierDual : dim G+dim Gᵛ=h`. The names `pDivisible_height`, `pDivisible_dual`, `pDivisible_connectedEtale`, `pDivisible_formal_equiv`, `pDivisible_tate_free` and `pDivisible_dual_dimension` are comparisons on these shared objects. Sources: Tate §§2.1–2.4, pp.160–169, particularly Proposition 1, pp.162–164, Proposition 3, p.166, and the generic-fiber Tate module, pp.168–169. The formal-group equivalence constructs the completed coordinate algebra as the inverse limit of the connected finite coordinate algebras.

For a complete mixed-characteristic DVR R with perfect residue field, fraction field L and completed algebraic closure C, prove the shared covariant `BarsottiTate.hodgeTate`:

```text
T_p G ⊗_(ℤ_p) C ≅ Lie(Gᵛ)^∨⊗_L C ⊕ Lie(G)⊗_L C(1).
```

The named comparison `pDivisible_hodgeTate` is its constant-target C-linear dual, on the same G and native Tate module:

```text
Hom_(ℤ_p)(T_p G,C) ≅ Lie(Gᵛ)⊗_L C ⊕ Lie(G)^∨⊗_L C(−1).
```

Both comparisons are continuous semilinear G_L-equivariant isomorphisms, natural in G; C-linear duality identifies the covariant decomposition with the displayed constant-target Hom decomposition. Construct the comparison from the formal logarithm and Cartier pairing, use the dimension identity, and prove the splitting using the vanishing of `H⁰(G_L,C(1))` and `H¹(G_L,C(1))`. The coefficient-twist convention is `T_p μ_(p∞)=ℤ_p(1)`; the displayed Hom is its constant-target dual. The completed local-field cohomology is the supplied nonzero-twist vanishing from PadicPeriodRings §2, with continuous cochains for the norm topology of C; for finite L/ℚ_p its names are `tate_H0_padicComplex_twist` and `tate_H1_padicComplex_twist`. No vanishing of untwisted `H¹(G_L,C)` is used. Sources: Tate §3, Theorems 1–2, pp.176–177, and §4.1, Theorem 3 and Corollary 2, pp.179–180. For an abelian scheme use `BarsottiTate.ofAbelian`; identify its Tate module with `AbelianTate` on the generic fiber, compatibly with finite-level projections, Cartier pairing and coefficient endomorphisms. This local theorem is stated for all such p-divisible groups, not just the two-dimensional factor.

**Checks.** For `G=μ_(p∞)`, height and dimension are one, `T_pG=ℤ_p(1)` and the constant Hom has the single twist −1. For `G=ℚ_p/ℤ_p`, the height is one, the dimension is zero and its Tate module has trivial character. These groups are Cartier dual, so their dimensions sum to the height. For their product the two terms each have dimension one; for the zero p-divisible group the height, dimensions and both terms vanish. A finite flat group killed by p alone is not a positive-height p-divisible group: the required successive surjections and orders fail. In residue characteristic p the finite group scheme `μ_p` is connected; it cannot be replaced by a constant étale group. The cohomological vanishing concerns nonzero twist; the untwisted `H¹(G_L,C)` is a one-dimensional L-space in Tate Theorem 1.

For finite extensions L and E of ℚ_p and a continuous character `ψ:G_L→Eˣ`, define `LocallyAlgebraicCharacter ψ` by requiring that, after embedding E in a finite extension E′ splitting L, there are integers n_τ with `ψ(Art_L(x))=∏_(τ:L→E′)τ(x)^(−n_τ)` on an open subgroup of `O_Lˣ`. The right side must take values in E. This is independent of E′ and is the explicit character-lattice description of a morphism between restriction-of-scalars tori; constructing a second theory of those tori is unnecessary. Define `HodgeTate V` for a finite-dimensional ℚ_p-representation by the existence of its semilinear C-decomposition into integer cyclotomic twists, retaining their multiplicities. Give `locallyAlgebraic_mul`, `locallyAlgebraic_inv`, `locallyAlgebraic_baseChange`, `hodgeTate_subquotient`, `hodgeTate_finiteExtension_iff` and compatibility with coefficient extension. Prove `hodgeTate_character_iff_locallyAlgebraic`: the underlying ℚ_p-representation of ψ is Hodge–Tate exactly when ψ is locally algebraic. For the weight calculation, write `E⊗_(ℚ_p)L=∏F_j`; near one the character has the form

```text
ψ(Art_L(x)) = ∏_j Norm_(F_j/E)(q_j(1⊗x))^(−n_j),     n_j∈ℤ.
```

For an embedding `σ:E→C`, its weight is n_j for the unique factor through which `σ⊗1:E⊗L→C` factors. The norm product is independent of a splitting field. Prove this by the completed-field character comparison, reducing to a splitting field, calculating the embedding weights and descending the invariant integer exponents. The completed-field input is `tateSen_character` from PadicPeriodRings §2: for a continuous character `G_L→Lˣ` whose splitting extension becomes totally ramified with group ℤ_p after a finite intermediate extension, the twisted C has vanishing H⁰ and H¹. This is the infinite-inertia branch of the supplied theorem. Sources: Tate §3, Theorem 2, p.177; Brian Conrad, *Lifting global representations with local properties*, Appendix B, Definition B.1 and the comparison following it, p.32, Lemma B.2, p.33, and Proposition B.3, pp.33–34. Subquotient closure and finite-extension descent are included in this local comparison, rather than inferred for arbitrary continuous characters.

**Checks.** Over L=ℚ_p, `ψ=χ_p` has weight one and `ψ(Art_L(u))=u⁻¹` on units; using geometric Artin would reverse that formula. The trivial character has weight zero and every n_j is zero. A continuous unramified character, including one of infinite order, is locally algebraic with all weights zero; local algebraicity alone does not make a local character finite. On a sufficiently small unit subgroup of ℚ_p, the continuous character `u↦u^s` with `s∈ℤ_p\ℤ` is not locally algebraic, and its corresponding local Galois character is not Hodge–Tate. Over general L the weights can differ across embeddings; the single integer n in §4.3 uses L=ℚ_p and is not asserted over arbitrary number fields.

For p≥5 prove `primeLevel_newQuotient_good_reduction`: the quotient of `J₁(p)` by the image of `J₀(p)` acquires good reduction over `ℚ(ζ_p)⁺` at p, and over that field at the other finite primes. Prove the nontrivial-character quotient A_f of §4.3 factors through it up to isogeny; the trivial diamond action on `J₀(p)` makes its ε-summand zero. Build the smooth proper abelian model using the integral modular-curve model, its special fiber and the induced Picard map. Source: Deligne–Rapoport, V §3, Example 3.7(i), p.DeRa-113, as applied in Ribet §4(ii), p.159. This particular model comparison is included here because the arithmetic construction needs it; it is not inferred from good reduction away from p.

Apply these targets over `L=ℚ_p(ζ_p)⁺`, whose ramification index is `(p−1)/2<p−1`. Let 𝓥 be the finite flat model of V̄ and 𝓧 the closure of its invariant line. Uniqueness identifies 𝓧 with the constant étale model of 𝔽. The quotient line has inertia character `χ_p^(k−1)`, which is nontrivial on the inertia subgroup of G_L: k−1 is odd and `χ_p(I_L)` has order two. Thus its model is not étale. The connected component `𝓥⁰` has 𝔽-rank one, is disjoint from the étale line, and gives a G_L-stable complementary generic line. For an element of `G_(ℚ_p)`, twist the model by its induced automorphism of R. Its generic fiber is identified with the original generic representation. Generic-fiber uniqueness extends that identification to the models, and therefore preserves their connected components. This descent argument, using normality of `G_L`, makes the complementary generic line stable under the full decomposition group. Hence `residual_local_split`: `V̄|_(G_(ℚ_p))≅1⊕χ_p^(k−1)`, and the local image has order prime to p. Sources: Ribet §4, pp.161–162; Raynaud Proposition 3.3.2 and Corollary 3.3.6, pp.267–268.

The bridge must pass these checks: the closure of the constant subline is étale by uniqueness; its intersection with a connected rank-one part is zero; the quotient's ramified character prevents the entire model being étale; a decomposition group cannot gain a nontrivial p-subgroup in a sum of the two tame characters. At `e=p−1` the uniqueness theorem is unavailable, so replacing the real local field by `ℚ_p(ζ_p)` would invalidate this proof. At p=3 the Bernoulli range is empty, so this modular construction is never invoked.

### 4.5 The unramified extension and the converse

Let M be the fixed field of the kernel of V̄ and put `L=M K_p`. Prove `ribetExtension_nontrivial`, `ribetExtension_elementary_abelian`, `ribetExtension_unramified`, and `ribetExtension_character`. Over K_p the diagonal characters are trivial and the image is a nonzero additive subgroup of 𝔽. Global nonsplitting forces this subgroup to be nonzero, since a finite group of order prime to p has semisimple representations. At primes away from p use §4.3. At p the local image has order prime to p by §4.4 and its intersection with the unipotent p-group is trivial. Therefore `L/K_p` is a nontrivial everywhere-unramified abelian p-extension.

For a diagonal matrix with entries a,d, conjugation on `[[1,x],[0,1]]` multiplies x by `a/d`. In the orientation above this is `χ_p^(1−k)`. The Artin map is covariant, so the resulting quotient of A has tame character `ω^(1−k)`. The additive subgroup need not have order p; it is enough that it is nonzero and killed by p. Source: Ribet Theorem 1.1 and the deduction from Theorem 1.3, pp.151–153, completed in §4, pp.160–162.

Combine this with §3.2 to prove `herbrand_ribet`: for every odd prime p and every even `2≤k≤p−3`,

```text
A_p(K_p)^(1−k) ≠ 0   ↔   p ∣ num(B_k).
```

The theorem is about nonzero character components, not their order or cyclicity. At `p=37,k=32`, the exponent is `−31≡5 mod 36`, not 31. At p=3 there is no k in the stated range and the assertion has no instance. There is no assumption of Vandiver or any main conjecture.

### Examples

The p=5 determinant calculation fixes the class-number normalization before the congruence argument. In an upper triangular residual representation `[[1,b],[0,d]]`, diagonal conjugation sends a unipotent parameter to `d⁻¹b`; this explains the inverse shift of the class character. Reversing the extension would change that character and would not prove the displayed Herbrand–Ribet statement. The first irregular pair `(37,32)` therefore produces a nonzero exponent-five component.

### Dependencies

Layers 0–3; ModularForms' Eisenstein and integral Hecke theory; ModularCurves' integral models; JacobianChallenge's Jacobian and abelian-variety constructions; the existing lattice lemma; native finite Galois representations and Chebotarev. The modular arithmetic realization, Rosati/Frobenius bound, p-divisible-group local comparison and small-ramification finite-flat/good-reduction bridges are targets of §§4.3–4.4. No later modularity-lifting, main-conjecture or general Iwasawa result is a prerequisite for this layer; its needed local Hodge–Tate comparison is constructed in §4.4 from PadicPeriodRings’ completed-field cohomology.

## Layer 5: regular primes, primary units and prime-power stability

### 5.1 Class-number regularity and Kummer's criterion

Define `IsRegularPrime p` for a nonzero natural p by `¬ p∣h(K_p)`. All arithmetic theorems assume p prime. The light predicate in Suggested.lean does not bundle primality; its arithmetic tests use prime conductors. Prove `regular_iff_classModule_zero`, `regular_iff_no_unramified_abelian_p_extension`, and invariance under the chosen cyclotomic-field model. The extension assertion concerns nontrivial abelian p-extensions unramified at every finite prime and split at real places. It follows from the ordinary Hilbert class field. Sources: Sharifi Example 1.3.14, p.18, for class-module regularity; the Hilbert class-field interpretation of §1.3, pp.14–18; and the Bernoulli comparison below.

For odd p prove `kummer_criterion`:

```text
IsRegularPrime p ↔
  ∀ even k, 2≤k≤p−3 → p∤num(B_k).
```

For the forward direction use the relative class-number product: any numerator divisibility supplies a p-factor in `h_p⁻`. For the reverse direction Herbrand's annihilator kills every odd component except index one, which is already zero; reflection kills the even components. This proof of Kummer's criterion does not need Ribet's converse, even though that stronger theorem is available. The full class number is used in the definition; replacing it by the relative class number requires the reflection argument just given. Sources: Sharifi Theorem 4.2.20, pp.107–108, Corollary 4.4.4, p.113, and Theorem 4.5.7, p.117; Mazur I Corollary 2.9, pp.53–54, supplies the Bernoulli implication used in the reverse direction.

**Checks.**

- At p=2, `K₂=ℚ` has class number one and the prime is regular. Suggested.lean proves this rational boundary from the native cyclotomic discriminant and principal-ideal criterion. The odd-prime Bernoulli criterion is not applied to this field.
- At p=3 the range of k is empty; the criterion gives regularity, agreeing with the native principal-ideal-ring theorem for `ℤ[ζ₃]`. A proved Lean example uses that theorem directly.
- At p=37, `B₃₂=−7709321041217/510` has numerator divisible by 37. Hence regularity fails, and Layer 4 locates a nonzero exponent-five component. The denominator is prime to 37.

### 5.2 Primary unit radicals and the unramified extension

Let p be odd, `K=K_p` and `λ=1−ζ_p`. Prove `primaryUnit_radical_unramified`: if `v∈O_Kˣ` and `v≡1 mod λ^p`, then `K(v^(1/p))/K` is either trivial or cyclic of degree p and is unramified at all finite places. The extension is interpreted through an actual root in an algebraic closure and a Kummer subextension, not an assumed irreducible polynomial. Source: Hilbert §126, Satz 148 and proof, pp.394–397, and §141, second proof of Satz 156, pp.439–440.

At primes away from p, a pth root of a unit gives an étale Kummer algebra since p is invertible. At λ, put `β=(v^(1/p)−1)/λ`. The polynomial obtained from `(1+λX)^p−v`, divided by `λ^p`, is monic over the local ring. All intermediate coefficients are integral because `p/λ^(p−1)` is a unit. Its reduction has nonzero constant derivative: the X coefficient is that unit and all other derivative terms vanish in characteristic p. The algebra generated by β is therefore finite étale; each field factor is unramified. Prove the coefficient valuations and this local étaleness explicitly. If v is already a pth power, the field extension is trivial and the polynomial algebra can have multiple field factors; the argument does not assert degree p unconditionally.

At v=1 the extension is the base field. The coefficient `p/λ^(p−1)` is a unit, whereas `p/λ^p` is not; this fixes the exponent p in the primary congruence. A unit congruent to one only modulo λ need not give an unramified radical. Nonunits with valuation not divisible by p are excluded, since their radicals ramify.

### 5.3 Kummer's unit lemma

For a regular odd prime p prove `kummer_lemma`: if an integral unit u in `O_(K_p)` is congruent modulo p to a rational integer, then u is a pth power of an integral unit. The congruence means `∃a∈ℤ, u−a∈p O_(K_p)`, not congruence modulo λ and not congruence modulo an arbitrary prime above p. Sources: Hilbert §141, Satz 156, pp.439–440, especially its second proof; Conrad Theorem 1, p.1, for the statement.

For each generator σ of `Gal(K_p/ℚ)`, show that `w=u/σu` is congruent to one modulo `λ^p`. Since `u≡a mod p`, the difference of the two p-multiples gains a factor λ when their coefficients are subtracted under σ. Section 5.2 gives an unramified radical of w. Regularity and class field theory force this radical to be trivial, so w is a pth power in K and its root is an integral unit. This shows that the class of u in `E/E^p` is invariant under the tame group. Its norm is a rational unit, ±1, which is a pth power for odd p. Since the group has order p−1, norm on its invariant p-torsion module is multiplication by a unit. Thus the class of u is zero. Prove `primaryUnit_quotient_congruence`, `primaryUnit_quotient_power`, and `unit_mod_power_invariants` as the API leading to the theorem.

This argument requires neither an explicit analytic logarithm basis nor a claim that every unit is primary. The examples u=1 and u=−1 have roots 1 and −1. For a nontrivial root of unity ζ_p, `ζ_p−a` cannot be divisible by p for a rational a: its nonconstant λ coefficient rules out the congruence. Thus the hypothesis does not incorrectly force a pth root of ζ_p inside K_p. Replacing p by λ in the hypothesis would admit ζ_p and give a false conclusion.

### 5.4 All regular-prime levels and the dyadic tower

For every regular odd prime p and every `r≥1`, prove `regular_prime_power_class_number : p∤h(K_(p^r))`. The initial level is the definition of regularity. Each successive degree-p extension is totally ramified at its unique prime above p and unramified elsewhere, and all fields are complex. Apply §1.7 and induction. This statement concerns all levels, not eventual vanishing or only the first layer. Source: Sharifi Lemma 1.3.13 and Example 1.3.14, p.18, applied to the cyclotomic total-ramification tower.

Prove separately `dyadic_class_number : 2∤h(K_(2^r))` for every `r≥1`. The conductor-two field is rational. The conductor-four field has Gaussian integer ring and class number one; obtain this from the native Euclidean/principal ideal ring comparison or its norm-Euclidean proof. Starting at `ℚ(i)`, every further step has no infinite ramification and a single totally ramified finite prime, so §1.7 applies. Do not apply its no-infinite-ramification statement to `ℚ(i)/ℚ`. Source: Sharifi Lemma 1.3.13, p.18, applied above the Gaussian base field, together with the cyclotomic ramification calculation of §3.1, pp.75–77.

Also prove `regular_prime_power_real_class_number`: the real field's p-primary class group is zero at every such level. For odd p use §0.4's norm/extension comparison. For p=2 use norm surjectivity on the full class groups of `K_(2^r)/K_(2^r)^+`, since the finite prime above two is ramified and hence the quadratic extension meets the real field's Hilbert class field trivially. This makes the real two-primary class module a quotient of the zero complex one; it does not divide a norm by two. At conductors two and four the real field is rational. Sources: Sharifi Lemma 1.3.8 and Corollary 1.3.9, pp.16–17; Lemma 1.3.13, p.18, gives the complex-field vanishing used here.

### Examples

The prime-three criterion is empty but nonvacuous: the class-number predicate is independently checked through the native integer ring. Kummer's lemma excludes the cyclotomic root ζ_p by its modulus-p hypothesis. The dyadic proof has two initial fields and applies the tower argument only above `ℚ(i)`, preserving the infinite-place condition that is harmless in odd-degree steps.

### Dependencies

Layers 0–3, with Layer 4 providing the stronger characterwise converse; cyclotomic total ramification and integer rings; local finite étale/Kummer comparison; the ordinary Hilbert class field; Gaussian integer Euclideanity. No conjectural class-number assertion is used.

## Layer 6: circular units and the real class-number index

### 6.1 The prime-power circular-unit subgroup

For a prime p, `r≥1` and `m=p^r`, let `φ_r:K_m≃ℚ F(p^r)` be the field isomorphism sending the chosen primitive root to the compatible root of IntegralIwasawaTheory §1.1. Its integer-ring and maximal-real-field restrictions identify the native unit groups and commute with the Galois action, extension and relative norms. Retain `cyclotomicSUnitSubgroup m`, `circularUnits m` and `realCircularUnits m` as the pullbacks under these maps of its circular-number and unit-intersection groups in §§1.2–1.3 (and §1.6 at two). Thus, writing D for those supplied groups,

```text
φ_r(cyclotomicSUnitSubgroup m) = ⟨μ(F(p^r)), 1−ζ_(p^r)^a : 1≤a<p^r⟩,
φ_r(circularUnits m) = D_r,
φ_r(realCircularUnits m) = D_r⁺.
```

The first group is `cyclotomicNumbers r` at odd p. Since `−ζ_(p^r)` generates the full root-of-unity group there, its generators agree with the displayed ones; at two μ is generated by ζ. At m=2 the circular-number group is generated by two and −1 and its unit intersection is `{±1}`. Membership means membership in these actual subgroups. Sources: IntegralIwasawaTheory §§1.1–1.3 and 1.6; Sharifi Definition 4.3.1, p.108, with the roots-of-unity subgroup included explicitly.

Transport the supplied subgroup, Galois stability, torsion and real-field preimage results as `circularUnits_subgroup`, `circularUnits_galois_stable`, `circularUnits_rootsOfUnity`, `realCircularUnits_eq_comap`, and independence of a change of primitive root. For every a prime to p, retain the integral unit `cyclotomicUnit m a` with

```text
η_(m,a) = (1−ζ_m^a)/(1−ζ_m).
```

An integer representative can be used in this expression; its dependence is only on a modulo m, with the corresponding roots of unity when negative representatives are used in polynomial expressions. Obtain the integral unit from the native geometric-sum unit in the supplier contract. Its light definition takes a primitive root ζ in any integral domain A, `m≥2`, and a unit residue a; taking `A=O_m` and the native root transported by `IsPrimitiveRoot.toInteger_isPrimitiveRoot` gives the arithmetic unit. Its field value satisfies `φ_r(η_(m,a))=cyclotomicRatio ζ_(p^r) a₀`. Retain `cyclotomicUnit_inverse` and `cyclotomicUnit_galois` on these carriers and transport `cyclotomicUnits_generators` from IntegralIwasawaTheory §1.3 as `circularUnits_eq_closure_ratios`: μ and these η generate the whole intersection. The supplied factorization of nonprimitive differences and their valuations identifies this intersection with the ratio-generated subgroup, including the dyadic case of §1.6.

**Checks.**

- `1−ζ_m` has absolute norm p, so it belongs to the S-unit subgroup but is not an integral unit. Its norm is not `p^r`.
- `η_(m,1)=1`, and `η_(m,−1)=−ζ_m⁻¹`. The first and the conductor-three value `η_(3,−1)=1+ζ₃` are proved examples; `cyclotomicUnit_neg_one` states the second in Suggested.lean on integral unit carriers. Thus the ratio group must contain the relevant roots of unity; these two extreme ratios do not form a free-unit basis.
- For m=8, a=2 gives the nonprimitive element `1−i`; it belongs to the S-unit subgroup but has positive valuation at two. Excluding nonprimitive exponents from the definition would require a separate distribution argument before the subgroups could be identified.
- At m=2 the sole nonzero difference is two. Intersecting the subgroup generated by two and `{±1}` with `ℤˣ` gives `{±1}`, not an infinite group of units.

For `m>2`, retain `realCyclotomicUnit m a = ζ_m^t η_(m,a)` with `2t≡1−a mod m`. If p is odd choose the unique t modulo m; if p=2 choose the integer `t=(1−a)/2` for an odd representative a. The latter choice is well defined up to sign on residue classes, and the subgroup includes −1. Under φ_r its value is `ζ_(p^r)^t cyclotomicRatio ζ_(p^r) a₀`, the `smoothedCyclotomicUnit r a` of IntegralIwasawaTheory §1.3 at odd p and its §1.6 generator at two. The light definition `realCyclotomicUnit` takes the phase t explicitly and returns an ambient integral unit. The target `realCyclotomicUnit_fixed`, under `2t=1−a` in `ZMod m`, says that the involution sending ζ to ζ⁻¹ fixes it; in `O_m` this gives its descent to the native real integer ring. Retain the change-of-representative and conjugation identities on these carriers. The supplied real generator theorem identifies the real circular group with the subgroup generated by −1 and the units with representatives `1<a<m/2`, prime to p. Sources: IntegralIwasawaTheory §§1.3 and 1.6; Sharifi proof of Theorem 4.3.3, pp.108–109; the same elementary realness calculation applies to powers of two.

**Checks.**

- At m=8, a=3, the real ratio is `ζ₈⁻¹(1+ζ₈+ζ₈²)=1+√2`. Its nontrivial real conjugate is `1−√2`, with norm −1; total positivity is not a membership condition.
- At odd m=5, a=2, `t≡2 mod 5` and the real ratio is negative in the chosen complex embedding. Its absolute logarithm agrees with the sine-ratio regulator. The named target `realCyclotomicUnit_five_negative` states this with the specified standard complex embedding. A definition demanding positive representatives would change it by a sign, which must be recorded.
- At m=4 there is no free generator in `1<a<m/2`; −1 still generates the real unit torsion. The empty list must not produce the trivial subgroup.
- For dyadic m, replacing a by a+m changes the half-exponent by `−m/2` and hence the real ratio by −1. It preserves the subgroup, not necessarily the individual chosen generator. The target `realCyclotomicUnit_eight_sign` states the sign reversal at a=3 by comparing phases −1 and −5 on the same unit residue.

### 6.2 Norms, distribution and CM comparison

With compatible primitive roots, prove `cyclotomic_difference_distribution`:

```text
1−ζ_n^a = ∏_(j=0)^(q−1) (1−ζ_(nq)^(a+jn))
```

for positive n,q and `a≢0 mod n`, with `ζ_(nq)^q=ζ_n`. The general finite distribution identity is a target here. At prime-power levels identify it with IntegralIwasawaTheory §§1.3–1.4 and 1.6; transport norm stability and extension compatibility as `circularUnit_norm`, `realCircularUnit_norm`, and the corresponding commutative diagrams with the unit inclusions and real-field norms. The field norm is the product over relative conjugates, whereas the distribution product includes all roots of the relevant polynomial; their equality uses the actual relative conjugates in each specialization. Source: Sharifi proof of Theorem 4.3.3, p.109, and Lemma 4.3.5, p.110.

For m>2, retain `primePower_units_eq_roots_mul_real` as the native-field form of the Hasse-index and circular-generator comparisons: `E_(K_m)=μ(K_m)E_(K_m⁺)` and `C_m=μ(K_m)C_m⁺`. At odd p use IntegralIwasawaTheory §§1.3 and 1.5's Hasse-index result and `fullRealCircularQuotientEquiv`; at two use §3.4's `primePower_indexRealUnits_eq_one` and the supplied dyadic generators of IntegralIwasawaTheory §1.6. The real-unit inclusion induces the canonical quotient isomorphism

```text
E_(K_m)/C_m ≅ E_(K_m⁺)/C_m⁺.
```

The intersection of μ with the real field is `{±1}`, contained in `C_m⁺`, so the map induced by the real-unit inclusion is injective as well as surjective. This is an isomorphism of unit quotients. It is not an isomorphism of those quotients with a class group. At m=2 both quotients are trivial and the assertion is proved directly. Source: Sharifi Lemma 4.2.17, p.106, and the generator argument in Theorem 4.3.3, pp.108–109.

**Checks.**

- The norm of a ratio is a ratio of products, so the common nonunit factors cancel. At m=8, the norm of `1−ζ₈` to `ℚ(i)` is `1−i`, while the rational norm is two.
- For m=4 over m=2 the full-field step has degree two, whereas both real fields are ℚ and their relative norm is the identity. The restriction of the full norm to real units is the square of that real norm, as in IntegralIwasawaTheory §1.1's exponent `e(4)/e(2)=2`.
- Across the step from conductor eight to four, the real generator with a=3 and phase −1 has norm −1. The conductor-four generator with the same representative and phase is +1; the dyadic phase and sign in IntegralIwasawaTheory §1.6 must be retained.

### 6.3 The real circular regulator and index, including powers of two

Let `m=p^r>2`, `G⁺=(ℤ/mℤ)ˣ/{±1}` and `d=#G⁺=[K_m⁺:ℚ]`. Choose the representatives `1≤a<m/2` prime to p and omit a=1 from the free-unit list. Retain `circularRegulator m` as the native regulator of this family. Under φ_r it equals the family regulator in IntegralIwasawaTheory §§1.5–1.6: the absolute determinant of the `(d−1)×(d−1)` logarithm matrix after omitting the identity embedding. Transport along the specified root map also identifies the omitted embedding and the sign torsion; no second regulator of the whole unit group is introduced.

Transport the shared regulator calculation as `circularRegulator_det`, `circularRegulator_character_product`, `circularRegulator_pos` and `circularUnitFamily_independent`. Writing `f(a)=log|1−ζ_m^a|`, the entry at row a and column b is `f(ab)−f(a)`. Inverting the column representatives only permutes the determinant and changes its sign; hence the supplied reduced group-determinant calculation gives

```text
R_circ = |∏_(1≠χ even mod m) ((1/2) Σ_(a∈(ℤ/mℤ)ˣ) χ(a) f(a))|.
```

This comparison preserves the finite-character specialization of the native determinant and character-orthogonality APIs. The shared calculation adds back the trivial-character row and column and diagonalizes the convolution operator. The identity remains valid when the trivial eigenvalue is zero, by a polynomial identity or the augmentation-space argument; division by a zero trivial eigenvalue is not permitted. Sources: IntegralIwasawaTheory §1.5; Sharifi Proposition 1.5.18, p.34, and proof of Theorem 4.3.3, pp.108–109.

Every nontrivial character in the product is used at its primitive conductor `fχ`, a power of p. Repeated distribution gives the exact equality of the logarithmic character sum at m with the one at `fχ`. For p=2, every nontrivial even primitive conductor is at least eight; it is never one or four. Consequently no additional Euler factor from a new rational prime occurs. Retain `circularRegulator_eq_classNumber_mul_regulator` as the transport of IntegralIwasawaTheory §1.5's `circularRegulator_eq_classNumber_mul`, with its §1.6 dyadic comparison:

```text
R_circ = h(K_m⁺) R_(K_m⁺).
```

The right side is positive. The supplied independence and finite-index statements therefore apply to the transported `d−1` circular units. With the generator comparison of §6.1 and −1 in the torsion subgroup, the native regulator-index formula gives

```text
[E_(K_m⁺):C_m⁺] = h(K_m⁺),
[E_(K_m):C_m] = h(K_m⁺).
```

Retain `circularUnit_index` for every prime p and `r≥1` as the native-field specialization of IntegralIwasawaTheory's `primePowerCircularUnitIndex` at odd p (§1.5) and `dyadicPrimePowerCircularUnitIndex` at p=2 (§1.6), treating m=2 directly. Sources: Sharifi Theorem 4.3.3, pp.108–109, for odd p; Theorem 4.7.1, pp.120–121, with one prime divisor and correction exponent zero, for dyadic powers. The dyadic regulator comparison retains the explicit real phases, distribution and class-number product; it does not remove the odd-prime hypothesis from Hasse's stated theorem.

**Checks.**

- At m=8, the family is the single unit `1+√2`, its regulator is `log(1+√2)`, and it generates the real free-unit group together with −1. The index is one, with no extra factor two.
- At m=4 and m=3, d=1, the determinant is empty and equals one. The real field is rational and both its class number and regulator are one.
- At m=2 the real units and circular units are both `{±1}`; the direct index calculation gives one. A formula requiring a primitive odd character is unnecessary here.
- Inflating the even quadratic character of conductor eight to modulus sixteen preserves its logarithmic sum by distribution. An artificial Euler factor at two would incorrectly change the regulator.
- Removing −1 from the circular subgroup would change the full real-unit index by two while leaving its logarithmic regulator unchanged. The torsion assertion is therefore part of the index theorem.

### 6.4 Vandiver at a prime and its exact reformulations

Define `VandiverAt p` for a nonzero p by `p∤h(K_p⁺)`, using the native maximal real subfield. The universal assertion that this holds for every odd prime is the **Kummer–Vandiver conjecture**. Record it as a mathematical conjecture in prose; do not introduce an axiom or a sorry-backed proposition claiming its truth. Source: Soulé, *Perfect forms and the Vandiver conjecture*, arXiv:math/9812171v1, Introduction, p.1; the equivalence of plus-class and real-class formulations is §0.4 here.

For odd prime p, the restriction of φ_1 to the maximal real field identifies `VandiverAt p ↔ VandiverCondition p` of IntegralIwasawaTheory §7.4. Retain `vandiver_iff_realClassModule_zero` and `vandiver_iff_even_components_zero` by transporting its real-class and plus-class comparisons through §0.4 and the tame decomposition. Retain `vandiver_iff_circularUnitQuotient_pPart_zero` by the transported exact index theorem: the p-primary unit quotient is zero exactly when p does not divide its order `h(K_p⁺)`. Retain `vandiver_of_regular` using the supplied regularity implication and the same finite-field comparison. Do not assert the converse: regularity also controls the odd components. No canonical isomorphism between the unit quotient and the real class group is inferred from their equal cardinalities. Sources: IntegralIwasawaTheory §§1.5–1.6 and 7.4; Sharifi Theorem 4.3.3, pp.108–109; the finite plus/real comparison is §0.4 here.

**Checks.**

- At p=3 the real field is rational, so `VandiverAt 3` holds; `vandiver_three` states this boundary on the native maximal real subfield.
- At p=2 the real field is rational and `vandiver_two` states the arithmetic boundary. Agreement with the supplier's odd-prime `VandiverCondition` and the even-projector reformulation have no dyadic instance.
- An abstract finite tame module with zero plus part and a nonzero odd component satisfies the vanishing pattern required by Vandiver and fails the pattern for regularity. Thus the two predicates cannot be identified by character decomposition alone.
- A finite unit quotient of order prime to p has zero p-primary part even when it is nontrivial. The reformulation must not demand that all units are circular.

### Examples

The real circular unit at conductor eight has norm −1, so total positivity would impose the wrong subgroup and index. At conductor four there is no free logarithmic generator, but the torsion generator −1 remains necessary. The equality of unit index and real class number gives a numerical and p-primary comparison; it does not manufacture an Artin map on units.

### Dependencies

Layers 0, 3 and 5; IntegralIwasawaTheory §§1.1–1.6 and 7.4 for the shared groups, arithmetic norm comparisons, regulator/index and odd-prime Vandiver reformulations; native cyclotomic integer rings, unit logarithmic lattice and regulator-of-family index formula. The finite ratio and real-phase identities and the general distribution identity retain their native carriers here; the index and norm-limit endpoints specialize the supplied arithmetic theory.

## Layer 7: the cyclotomic norm limit and class-number growth

### 7.1 The tower and its compact class module

For every prime p use the fields F_n fixed in Conventions: conductors `p^(n+1)` at odd p and `2^(n+2)` at p=2. Identify them with the compatible fields of IntegralIwasawaTheory §§0.1–0.4 and 1.1 by `φ_(n+1)` at odd p and `φ_(n+2)` at two. Transport its union `F_∞` inside a fixed algebraic closure, compatible embeddings, and topological isomorphism `Gal(F_∞/F_0)≅ℤ_p`. At odd p retain the commuting tame group Δ of order p−1. The dyadic base `ℚ(i)` removes the order-two torsion in `ℤ_2ˣ`; the procyclic group is the `1+4ℤ_2` factor. Sources: Sharifi Remark 3.1.4, Lemma 3.1.5, Corollary 3.1.6 and Definition 3.1.8, pp.75–76; the completed-group-ring identification is supplied by PadicMeasuresIwasawaAlgebras.

Retain `cyclotomicClassInverseLimit p` as the specialization of IntegralIwasawaTheory §2.1's `classGroupLimit` to this tower, transported through the finite class-module identifications of Layer 0. Thus it is the compact inverse limit

```text
X = lim_(←n,N) A_p(F_n).
```

Its continuous `Λ=ℤ_p[[Γ]]` action is the supplied arithmetic completed action under this identification. Its carrier consists of compatible class tuples. Retain `classLimitProjection n` as `classGroupLimit_proj` at the corresponding field. If Φ denotes the induced limit isomorphism and `φ_n^Cl` the finite class-module map, their equation is `φ_n^Cl ∘ classLimitProjection n = classGroupLimit_proj n ∘ Φ`. Transport `classLimitProjection_norm`, continuity, compact Hausdorffness, and `classLimitProjection_surjective` from the shared construction and one-prime control of IntegralIwasawaTheory §3.1. Finite-level norm surjectivity uses total ramification at the unique prime above p and trivial intersection with the lower field's Hilbert class field. Sources: Sharifi Definition 3.2.3, p.78, and §1.3, Lemma 1.3.8, pp.16–17.

Retain `classLimit_ext`, `classLimit_zero_iff`, `classLimit_norm_transitive`, `classLimit_tame_action`, and `classLimit_generator_coordinate` as the corresponding universal-property, norm and action specializations of IntegralIwasawaTheory §§0.4 and 2.1. The Λ coordinate T is `γ−1`; γ itself acts as `1+T`. The comparison intertwines the covariant ideal action and arithmetic Artin action. A different topological generator gives a canonically transported Λ action, not a new arithmetic class module.

**Checks.**

- The inverse limit of zero class modules is zero; the compatible constant tower `ℤ/p²ℤ` with identity transitions has that same finite inverse limit. Using extension maps instead would generally construct a different object.
- A tuple `(x_n)` belongs exactly when `N_(n+1/n)x_(n+1)=x_n`. The image of a higher-level principal ideal is principal, so all-zero classes form a compatible tuple independently of chosen ideal generators.
- At odd p, `F_0=K_p`; at p=2, `F_0=K_4`. The first step in the latter tower has degree two. Choosing `K_2` as F_0 would leave a group with torsion and would not give the stated `ℤ_2[[T]]` coordinate.
- On a module with trivial Γ action, T acts by zero and γ by one. This distinguishes the coordinate from γ and fixes the later coinvariant polynomial.

### 7.2 Artin identification and exact cyclotomic control

Let `H_n/F_n` be the maximal unramified abelian p-extension. Retain `classLimit_artin` as the transported `unramifiedModule_classGroupLimit` of IntegralIwasawaTheory §2.3: compatible arithmetic Artin maps identify X with the Galois group of the maximal unramified abelian pro-p extension of F_∞. The comparison must commute with finite-level arithmetic Artin maps, conjugation and norm, and with the completed local unramified-extension maps. The supplied descent assertion places every finite unramified abelian p-extension of F_∞ in `H_n F_∞` after enlarging n. Sources: Sharifi Proposition 3.2.6 and Corollary 3.2.7, p.79.

For every `n≥0` retain `cyclotomicClass_control` as the inverse of IntegralIwasawaTheory §3.1's `onePrimeClassControl`, transported through Φ and `φ_n^Cl`:

```text
X / (γ^(p^n)−1)X  ≅  A_p(F_n).
```

The isomorphism is induced by the actual norm projection, is Λ-linear through the quotient group, and commutes with the tame action at odd p. Its defining equation is `cyclotomicClass_control n (x mod (γ^(p^n)−1)X)=classLimitProjection n x`. In the T coordinate the annihilating polynomial is `(1+T)^(p^n)−1`. The supplier's hypotheses hold from F_0 onward: there is exactly one finite ramified prime, it is totally ramified, and there is no other ramification. For p=2 the base F_0 is already complex. Thus the inertia-sum map has zero kernel and cokernel and the closed kernel of the norm projection is `(γ^(p^n)−1)X`. Sources: Sharifi Proposition 3.2.11, exact sequence (3.2.1), pp.80–81, and Remark 3.2.12, p.81.

The assertion is exact for this tower at every n; it does not follow solely from norm surjectivity in an arbitrary tower. The prime above p is principal at each finite level, but exact control also needs its total ramification and the genus comparison. At n=0 the statement is `X/TX≅A_p(F_0)`. Replacing the norm limit by a direct limit would lose this map. If several primes above p were allowed, the inertia kernel would generally remain and the stated isomorphism would need a correction term.

### 7.3 Finite generation, torsion and the growth invariants

Retain `cyclotomicClassInverseLimit_finite` in the module-theoretic sense of finite generation over Λ, and `cyclotomicClassInverseLimit_torsion`, by transporting `onePrimeClassModule_finite_torsion` from IntegralIwasawaTheory §3.1 through Φ. Its compact Nakayama hypothesis is `X/(p,T)X≅A_p(F_0)/p` finite, with X compact Hausdorff and continuous action. This provides finite generation before the algebraic structure theorem is used.

The shared torsion argument uses the structure theorem for a finitely generated module, with possible free summands. Positive Λ-rank would force unbounded `ℤ_p`-rank of Γ_n-coinvariants under the structure comparison and its finite cokernel. Exact one-prime control makes every such coinvariant finite. The transported conclusion concerns this arithmetic module, not rank preservation by an arbitrary nonexact coinvariant functor. Source: Sharifi Proposition 3.2.11 and proof, pp.80–81.

Retain `cyclotomic_class_number_growth` as the specialization of IntegralIwasawaTheory §3.3's `classNumberGrowth` to this tower, with `μ(X)=towerMu(F_∞/F_0)`, `λ(X)=towerLambda(F_∞/F_0)` and `ν=towerNu(F_∞/F_0)` under Φ. There are `μ,λ∈ℕ`, `ν∈ℤ` and `n₀∈ℕ` such that

```text
v_p(h(F_n)) = μ p^n + λ n + ν        for every n≥n₀.
```

Equivalently `#A_p(F_n)=p^(μ p^n+λn+ν)` for those n. The integer exponent is nonnegative there because it is the length of a finite p-group; ν itself is not required to be nonnegative. The invariants μ and λ are exactly those of X, using p as the uniformizer of `ℤ_p`. Finite Λ-modules have μ=λ=0 and contribute to the constant term. The native valuation equation in Suggested.lean is also the specialization of the supplier's `cyclotomicClassNumberGrowth` with conductor parameter m=1 at odd p and m=2 at p=2, since `2·2^(n+1)=2^(n+2)`. Sources: IntegralIwasawaTheory §3.3; Sharifi Theorem 3.2.13, pp.81–82; the abstract algebra is PadicMeasuresIwasawaAlgebras Layer 4, “Cyclotomic polynomials and growth”.

Retain `growth_generator_independent` and `growth_shift_base` as the generator-change and base-shift specializations of IntegralIwasawaTheory §3.3. Passing from F_0 to F_s and renumbering levels by n changes the constants as `μ′=p^s μ`, `λ′=λ`, `ν′=ν+sλ`. These follow by substitution in the displayed formula and uniqueness of its coefficients on a tail. At odd p the character decomposition yields growth for each tame component with its own invariants; plus and minus invariants are the sums over even and odd components. At p=2 there is no integral plus/minus direct-sum conclusion from this theorem.

The zero-module check gives μ=λ=ν=0 and `v_p(h(F_n))=0` at all levels for a regular p, using Layer 5; it includes the dyadic tower. For the algebraic control `Λ/(p)`, the coinvariant length is `p^n`, so μ=1 and λ=0. For `Λ/(T−p)` at odd p it is `n+1`, so μ=0, λ=1 and ν=1. These are controls on the supplied algebraic length theorem, not assertions that those modules are realized by cyclotomic class groups. A module `Λ/(T)` has infinite coinvariants and does not satisfy the finite-coinvariant hypothesis.

### Examples

The dyadic field sequence begins `ℚ(i)⊂ℚ(ζ₈)⊂ℚ(ζ₁₆)`, with degrees one, two and four over its base. Its class-number exponents are all zero by Layer 5. At odd p, replacing the norm projection by ideal extension would reverse the direction of the system and would not yield the exact quotient `X/TX` at the base field.

### Dependencies

Layers 0–1 and cyclotomic total ramification identify the native fields and their maps with IntegralIwasawaTheory §§0.1–0.4, 1.1, 2.1, 2.3 and 3.1–3.3. That supplier provides arithmetic Artin descent, norm-limit control, finite generation, torsion and growth for the transported module. ClassFieldTheory supplies finite Hilbert class fields and reciprocity; PadicMeasuresIwasawaAlgebras supplies Λ and its abstract algebra. Layer 5 gives the regular and dyadic examples. None of these specializations uses a main conjecture.

## Layer 8: inverse-character vanishing and unramified quotients

### 8.1 The low odd components at all prime-power levels

For every odd prime p and `r≥1`, prove `inverseCharacterClassGroup` and its prime-power version `inverseCharacterClassGroup_all_levels`:

```text
A_p(K_(p^r))^(−1) = 0.
```

At the base level this is §3.2's annihilator with `B₂=1/6`, reducing the index modulo p−1 before selecting a Bernoulli number; at p=3 the index is one and the exceptional unit smoothing applies. For the higher levels, §1.7 identifies the wild coinvariants of the exponent-minus-one component with its zero base component. A finite p-group module with zero coinvariants under a p-group is zero, by Nakayama over the local finite group ring. This proves the assertion without a main conjecture or growth formula. Equivalently one can apply the exact control of Layer 7 and compact Nakayama to the corresponding tame component of X. Sources: Mazur I Proposition 2.8 and Corollaries 2.9–2.10, pp.53–54, for the prime-conductor assertions; the propagation is Sharifi Corollary 1.3.12, p.18, or Remark 3.2.12, p.81.

Also prove `lowOddClassComponents_all_levels`:

```text
A_r^(−j)=0  for j=1,3,5,7,9,
A_r^(−11)=0  when p≠691.
```

These hold at every level, with tame indices modulo p−1. Use the exact values `B₂=1/6`, `B₄=−1/30`, `B₆=1/42`, `B₈=−1/30`, `B₁₀=5/66` and `B₁₂=−691/2730`, together with the denominator and congruence statements of §3.1. Small primes must be handled by reducing the character index first. A Bernoulli number whose denominator or index is divisible by p is not a p-adic unit test at that unreduced index. The exceptional character exponent one is zero by the separate smoothing calculation. Sources: Mazur Corollary 2.10, p.54; higher levels use the same norm-coinvariant argument.

**Checks.**

- At p=5, exponent −9 reduces to −1. It is killed by the unit attached to `B₂`, despite the numerator of `B₁₀` being divisible by five. Applying the unreduced numerator test would give the wrong conclusion.
- At p=3 all odd exponents reduce to one, so the exceptional annihilator kills all of them. The empty ordinary Bernoulli range is not an obstacle.
- At p=691 the exclusion for exponent −11 is essential: `B₁₂` has numerator divisible by 691 and Herbrand–Ribet makes that component nonzero at the base level.
- At p=5, `A^(1)` and `A^(−1)` both vanish, but their scalar proofs use different Bernoulli values. The two submodule definitions still have different character conditions on a general tame module.

### 8.2 The unramified class-field quotient

Define `inverseCharacterUnramifiedQuotient p r` to be the maximal quotient of the p-primary class module on which every tame a acts by `ω(a)⁻¹`. Use the existing finite-module quotient by the submodule generated by `(a−ω(a)⁻¹)x`; prove its universal property and compare it to the exponent-minus-one projector component. This definition is on the native class module and its supplied action, not on an arbitrary group labelled “unramified”. Give `inverseCharacterUnramifiedQuotient_mk`, `inverseCharacterUnramifiedQuotient_lift`, `inverseCharacterUnramifiedQuotient_eq_component`, and `inverseCharacterUnramifiedQuotient_zero`.

Through arithmetic Artin identify it with the maximal everywhere-unramified abelian p-extension of `K_(p^r)` whose tame conjugation action is the inverse cyclotomic character. The theorem says this extension is the base field. In particular, if `L/K_(p^r)` is a finite abelian p-extension, unramified at finite primes, stable under the tame action, and that action on `Gal(L/K_(p^r))` is `ω⁻¹`, then L is trivial. State the action as an actual conjugation action of a Galois extension over the tame fixed field, or give compatible semilinear descent data; an arbitrary action on an abstract group is not enough to identify it with the class-field action. Source: Mazur I §2, equivariance discussion and Proposition 2.8–Corollary 2.10, pp.53–54, together with the Hilbert class-field comparison.

The single prime above p is principal, so requiring it also to split does not alter the ordinary unramified class-group quotient. Prove `inverseCharacterUnramifiedQuotient_splitAtP` by the comparison with the quotient by its ideal class from §0.5. The tame character condition does not assert that the wild `Gal(K_(p^r)/K_p)` action is trivial; its commuting action remains on the zero quotient and on the universal-property comparison.

**Checks.**

- At the trivial class module the quotient is zero and its class field is the base field. A trivial extension is permitted by the theorem's hypotheses.
- On the abstract tame module `ℤ/25ℤ` at p=5 with character `ω⁻¹`, the universal quotient is the entire module; with character ω it is zero. This distinguishes the inverse character from the exceptional exponent-one character before applying arithmetic vanishing.
- An abelian p-extension ramified at p need not be a quotient of this class module. Unramifiedness at all finite primes is required, even though the ramified prime has principal ideal class.
- A nonabelian extension with only its abelianization carrying `ω⁻¹` is not the object defined here. The theorem applies to its specified abelian quotient and does not identify its whole Galois group with a class group.

### 8.3 Constant étale coefficients and the two duals

For `S_r=Spec O_(K_(p^r))`, prove `etaleH1_constant_classGroup`: the constant-coefficient group `H¹_et(S_r,𝔽_p)` identifies naturally with `Hom_(𝔽_p)(A_r/pA_r,𝔽_p)`. A degree-one constant torsor is a continuous homomorphism from the étale fundamental group; its abelian p-quotient is the p-Hilbert class field. The rings here have no real places, so no additional infinite-place condition is hidden. The identification is tame-equivariant with the contragredient action `(aφ)(x)=φ(a⁻¹x)` on the right. Construct the number-ring finite-constant-torsor comparison from finite étale covers and Galois descent, with its base-point and pullback functoriality; this is a target of this subsection. Prove that the induced map on degree-one cohomology is the displayed arithmetic Artin dual. Source: Mazur I §2, equations (2.4)–(2.6), pp.50–51, followed by Proposition 2.8 and Corollaries 2.9–2.10, pp.53–54.

Prove `constantEtaleDual_character`: a class component with character `ω^i` contributes to the constant dual with character `ω^(−i)`. Hence `etaleH1_constant_character_one_zero`: the exponent-one part of `H¹_et(S_r,𝔽_p)` is zero by §8.1. This is the duality used in constant-group extension arguments. It uses coefficients `𝔽_p` with trivial target action.

Separately prove `kummerDual_character`: `Hom_(𝔽_p)(A_r/pA_r,μ_p)` has character shift `i↦1−i`, because its target carries ω. `μ_p` is being used here as its geometric root-of-unity Galois module; over `S_r` at primes above p its group scheme is not étale. It cannot replace the constant coefficient sheaf in the preceding identification.

Define the light character comparison `homCharacter source target = target * source⁻¹` for multiplicative characters into any commutative group. Its use for linear Hom assumes the given source and target are one-dimensional representations with those characters; the conjugation action is `g·f=ρ_target(g)∘f∘ρ_source(g⁻¹)`. Give `homCharacter_apply`, `homCharacter_constant_target`, `homCharacter_self`, `homCharacter_mul_target`, and its comparison with the actual Hom representation. **Checks.** A trivial target gives the inverse source character. Equal source and target characters give the trivial Hom character. A trivial source gives the target character. The characteristic-five values below are proved examples of this definition in Suggested.lean; the formula is also valid over the trivial coefficient group, where both values are one.

For a concrete two-term witness take p=5 and a tame element with `ω(a)=2 mod 5`. On a one-dimensional exponent-three class component it acts by `2³=3`. On the constant dual it acts by `3⁻¹=2`, exponent one; on the μ₅-valued dual it acts by `2·3⁻¹=4`, exponent two. Thus the inverse-character class component governs the positive-one constant-dual component, not the negative-one constant-dual component. The abstract Hom-action calculation is part of the API and its characteristic-five values distinguish inversion from the cyclotomic twist.

### 8.4 Consumer-facing conclusions

Expose `cyclotomicClassEigenspaces`, `stickelbergerHerbrandAnnihilator`, and `inverseCharacterUnramifiedQuotient` as the three arithmetic contracts for EisensteinIdealAndRationalTorsion. The first includes the native Sylow/tensor comparison, tame decomposition at every prime-power level, arithmetic Artin equivariance and the real-field comparison at odd p. The second includes the all-conductor integral annihilator, the prime-conductor Bernoulli scalar with the `1−k` index, and the separate exceptional exponent-one vanishing. The third includes inverse-character vanishing, its universal unramified quotient, the harmless split-at-p condition and the constant étale duality just specified.

The downstream interface for FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.G5, `admissible-cyclotomic-class-obstruction`, consists of `cyclotomicClassEigenspaces`, `bernoulli_annihilates_component`, `herbrand`, `cyclotomicClassEigenspace_one_eq_zero`, `inverseCharacterClassGroup` and `inverseCharacterUnramifiedQuotient_zero`, with the carrier `cyclotomicClassEigenspace`. Its ideal action is the covariant action of §§0.2–0.3 and its scalar is the primitive-conductor evaluation of §§2.5 and 3.1–3.2. The prime-conductor obstruction is the r=1 application of §§8.1–8.3, with the rational dyadic boundary handled directly. The global Ext applications belong to the downstream finite-flat development.

An application to a division field must first prove that its proposed quotient is abelian of p-power order, unramified at every finite prime, and carries the actual inverse tame conjugation action. The arithmetic contract then kills that quotient. It does not turn a general division field into an unramified extension, or identify two different Hom target actions. The vanishing remains valid without regularity or Vandiver, and at all higher prime-power levels.

### Examples

At p=5 the constant and μ₅-valued duals of an exponent-three line have exponents one and two. At p=691 the exponent-minus-eleven component supplies a negative control for indiscriminate low-index vanishing. At every odd p, an unramified abelian p-extension with inverse tame action is trivial even if other class components are nonzero.

### Dependencies

Layers 0–3 and §1.7 for all-level vanishing; Layer 4 for the 691 negative control; ClassFieldTheory's equivariant Hilbert class field; finite étale torsors and their fundamental-group comparison, with the explicit number-ring constant-coefficient construction in §8.3. Layer 7 gives an equivalent inverse-limit proof but is not needed for the finite-level norm-coinvariant propagation.

## Downstream consumers

EisensteinIdealAndRationalTorsion consumes the three contracts of §8.4. Its division-field and finite-flat arguments must supply the actual ramification and conjugation hypotheses before applying the unramified quotient. The class-field result then applies at every prime-power level. Constant group schemes use the constant-coefficient dual of §8.3; a root-of-unity target requires the additional cyclotomic twist.

The downstream interface for DirichletPadicLFunctions contains the primitive-conductor Bernoulli values, their p-adic integrality, the Kummer congruence of §3.1, the finite Stickelberger character evaluations and the circular-unit distribution relations. Measures and interpolation are outside this roadmap. These finite arithmetic results do not assume a p-adic L-function or a main conjecture.

The norm-compatible cyclotomic class module, its arithmetic Artin realization, exact one-prime control and growth invariants in Layer 7 specialize IntegralIwasawaTheory §§0–3. The comparison preserves norms, projections, the covariant Galois action and `T=γ−1`, with conductor exponent n+1 at odd p and n+2 at two. The circular-unit and regulator adapters in Layer 6 specialize its §§1.1–1.6, and agreement of `VandiverAt` with its §7.4 predicate is restricted to odd primes. Other finite cyclotomic targets here retain their own ownership. The abstract completed-group-ring algebra remains supplied by PadicMeasuresIwasawaAlgebras. Comparison with an analytic characteristic ideal is additional mathematics; growth alone identifies no such ideal.

The shared field-valued package in §4.3 supplies downstream AbelianSchemesAndArithmeticModuli with the native `AbelianTate`, `End.charpoly`, `End.trace`, `charpolyTate` and `Polarization.rosati` specializations. Its relative constructions extend these field objects and their maps. The shared `modularQuotient`, its universal quotient map, Hecke and dimension APIs are the input to downstream ModularCurvesPartII's weight-two quotient theory; `modularAbelianQuotient` is its abbreviation. The scheme-valued `BarsottiTate S p h` and the shared local prefix in §4.4 are the input to downstream AbelianSchemesAndArithmeticModuli and FiniteFlatGroupsAndIntegralPadicHodgeTheory; their constructions extend this carrier and its maps. These are independent of prime level, Bernoulli divisibility and the Herbrand–Ribet converse. The covariant and constant-target dual comparisons use `HT(χ_p)=1`. Completed-field cohomology is an input from PadicPeriodRings. General Néron-model theory and local–global compatibility beyond these targets are outside this roadmap.

Explicit cyclotomic arithmetic, Fermat-type applications and unit computations consume the full class-number formulation of regularity, Hilbert's relative-unit and capitulation comparisons, primary-unit lemma and all-level stability. The circular-unit index supplies a concrete unit subgroup with quotient order `h(K_m⁺)`. It does not give an isomorphism of that unit quotient with the real ideal class group, nor prove the universal Vandiver conjecture.

## References

- Romyar Sharifi, [*Iwasawa Theory*](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), author's lecture notes. The numbering used here is that of the 189-page version: §§1.3–1.5 for class modules, Kummer radicals and group determinants; §2.8 for character components; §§3.1–3.2 for cyclotomic towers and norm limits; §§4.1–4.5 for Dirichlet values, class-number products, circular units, reflection and Stickelberger annihilation. Individual statements and printed pages are specified where used.
- Hugh L. Montgomery and Robert C. Vaughan, [*Multiplicative Number Theory I: Classical Theory*, Chapter 9 draft](https://personal.science.psu.edu/rcv4/568s20/568chapter9.pdf), §9.2, pp.273–274, Theorems 9.5 and 9.7 (Theorems 5 and 7 in the draft), and §9.3, Theorem 9.17, p.286 (Theorem 17 in the draft), for primitive inverse-pair products and the signed quadratic Gauss sum, including discriminants −4 and ±8.
- David Hilbert, *Die Theorie der algebraischen Zahlkörper*, Jahresbericht der Deutschen Mathematiker-Vereinigung 4 (1897), pp.175–546. The [ETH/e-rara digitization](https://doi.org/10.3931/e-rara-10039) supplies the original numbering: §§54–58, pp.271–279, for relative units and capitulation; §126, Satz 148, pp.394–397, for the primary radical; §141, Satz 156, pp.439–440, for Kummer's lemma. The ideal-class and field-extension formulations here use modern native carriers.
- Pierre Deligne and Jean-Pierre Serre, [“Formes modulaires de poids 1”](https://www.numdam.org/item/ASENS_1974_4_7_4_507_0/), Annales scientifiques de l’École Normale Supérieure, série 4, 7 (1974), pp.507–530, §6, Lemme 6.11, p.522, for simultaneous eigencharacter lifting over a discrete valuation ring.
- Kenneth A. Ribet, [“A modular construction of unramified p-extensions of ℚ(μ_p)”](https://math.berkeley.edu/~ribet/Articles/invent_34.pdf), Inventiones Mathematicae 34 (1976), pp.151–162. Theorems 1.1 and 1.3 state the extension and representation targets; Proposition 2.1 supplies the lattice argument; §3 constructs the congruent cusp form; §4 constructs and studies the arithmetic representation. The determinant estimate in §4.1 of this roadmap is an explicit finite-character proof of the auxiliary bound used in Ribet's §3.
- Barry Mazur, [“Modular curves and the Eisenstein ideal”](https://www.numdam.org/item/PMIHES_1977__47__33_0/), Publications Mathématiques de l'IHÉS 47 (1977), pp.33–186. Part I §2, especially Proposition 2.8 and Corollaries 2.9–2.10, pp.53–54, fixes the inverse-character obstruction; the constant-coefficient class-field interpretation is on pp.50–51.
- Kenneth A. Ribet and William Stein, [*Lectures on Serre’s Conjectures*](https://wstein.org/papers/serre/ribet-stein.pdf), Appendix by Brian Conrad, Definition 5.13 and Theorems 5.14–5.16, pp.73–79, for the Albanese modular quotient, coefficient realization and Frobenius relation.
- Pierre Deligne and Michael Rapoport, “Les schémas de modules de courbes elliptiques”, in *Modular Functions of One Variable II*, Lecture Notes in Mathematics 349, Springer (1973; corrected printing 1986), pp.143–316. Chapter V §3, Theorem 3.2 and Example 3.7(i), pp.DeRa-112–113 (volume pp.254–255), provide the good-reduction comparison used in §4.4. The page labels DeRa-112–113 are the article’s own page labels, distinct from the volume pagination.
- Michel Raynaud, [“Schémas en groupes de type (p,…,p)”](https://www.numdam.org/item/BSMF_1974__102__241_0/), Bulletin de la Société Mathématique de France 102 (1974), pp.241–280. §2.1, pp.259–260, treats schematic closure and quotient; Proposition 3.3.2, p.267, and Theorem 3.3.3 and Corollary 3.3.6, p.268, give the small-ramification generic-fiber comparison.
- John Tate, [“p-Divisible Groups”](https://math.bu.edu/people/jsweinst/AWS/Files/TatePDivisibleGroups.pdf), in *Proceedings of a Conference on Local Fields* (Driebergen, 1966), Springer (1967), pp.158–183. §§1.3–1.4 and 2.1–2.4 provide the finite-flat and p-divisible-group carriers; §3 and §4.1 give the completed-field cohomology and local comparison. This is the p-divisible-groups paper.
- J. S. Milne, [*Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), version 4.03 (2020), VII §3, Proposition 3.1, Lemma 3.2 and Lemmas 3.4–3.5, pp.208–209, for the generic unit Herbrand quotient consumed in Layer 1.
- J. S. Milne, [*Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf), version 2.00 (2008), I §14, Theorem 14.3, pp.61–62, and II §1, Theorem 1.1 and Lemmas 1.2–1.3, pp.75–77, for the Rosati positivity and Frobenius bound used in §4.3.
- J. S. Milne, [*Abelian Varieties*](https://www.jmilne.org/math/xnotes/AVs.pdf), author's 2022 notes of the 1986 article, §13, Theorem 13.3, p.25, and §17, Theorem 17.3, pp.35–36, for the abelian Riemann–Roch and intersection/trace formulas. This numbering differs from the 2008 course notes.
- The Stacks Project, [Varieties §45: Numerical intersections](https://stacks.math.columbia.edu/tag/0BEL), tags 0BEM and 0BEP–0BEV, printed pp.101–104 of the Varieties chapter, for the Euler polynomial and numerical intersection API; the online section number is 33.45.
- Brian Conrad, [*Lifting global representations with local properties*](https://math.stanford.edu/~conrad/papers/locchar.pdf), author's version dated December 11, 2011, Appendix B, Definition B.1, Lemma B.2 and Proposition B.3, pp.32–34, for local algebraicity and the embedding-indexed Hodge–Tate weights of characters.
- Keith Conrad, [*Kummer's Lemma*](https://kconrad.math.uconn.edu/blurbs/gradnumthy/kummer.pdf), author's notes, 8 pages. Theorem 1, p.1, states the unit lemma, and pp.6–7 give a logarithmic proof. The proof route in Layer 5 uses Hilbert's unramified-radical argument; it does not use the basis assertion of Conrad's Theorem 7.
- Christophe Soulé, [*Perfect forms and the Vandiver conjecture*](https://arxiv.org/abs/math/9812171v1), version 1 (1998), Introduction, p.1, for the formulation of Vandiver's conjecture and its even-component interpretation. No assertion of the conjecture's truth is an input or a target here.

The supplier contracts use the named declarations in Mathlib and Tau Ceti and the named layers of GlobalNumberFields, NumberFieldArithmetic, ClassFieldTheory, ClassicalArithmeticCompletion, ModularForms, ModularCurves, JacobianChallenge, IntegralHeckeAndGaloisDeterminants, IntegralIwasawaTheory, PadicPeriodRings and PadicMeasuresIwasawaAlgebras. Their mathematical ownership is retained when the arithmetic specializations above are constructed.
