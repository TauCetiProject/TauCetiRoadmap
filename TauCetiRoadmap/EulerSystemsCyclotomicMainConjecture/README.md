# Roadmap: euler systems and the unconditional cyclotomic main conjecture

**Summary.** Construct the cyclotomic Euler system from actual cyclotomic numbers,
apply Kolyvagin–Rubin descent to class groups, and prove the cyclotomic main
conjecture by comparing circular-unit indices with characteristic ideals.
The abelian extension treats every prime, including 2, and gives the
Iwasawa–Leopoldt and Gras formulas with their integral correction factors.
The final layer translates the result into odd-character and Tate-twisted
Selmer formulations.

## Scope and ownership

This roadmap owns the cyclotomic arithmetic application and its abelian
extension, including the four arithmetic comparison targets in §§3.3,
4.7, 4.18 and 4.21. The supporting continuous-cohomology comparisons, Euler-system descent,
finite Stickelberger annihilation and analytic value formulas are targets of
Foundation F below. **IntegralIwasawaTheory** owns cyclotomic fields and
circular units, arithmetic Iwasawa modules, control, Leopoldt,
Ferrero–Washington and the canonical Kubota–Leopoldt pseudomeasure.
**ColemanPowerSeries** owns local interpolation and Coleman operators;
**PadicMeasuresIwasawaAlgebras** owns measures, Iwasawa-algebra structure
and characteristic ideals. **ClassicalArithmeticCompletion** §§1.47 and
1.55 supplies residue-character Gauss sums and their Stickelberger ideal
factorization; **Chebotarev** Layer 10 supplies primes with a prescribed
Frobenius class. The arithmetic comparisons with actual units and Gauss
ideals are proved here, including the character-isotypic Kummer and Selmer
dictionaries (§§0.25, 1.3), the idelic characters and Rubin's local
functionals (§0.30), the local unit limits (§2.2), Sinnott's correction and
stable index (§3.3), the all-prime unramified-coefficient Coleman sequence
(§4.4), uniform unit bounds, the exceptional component and the dyadic split
sequence (§§4.10, 4.14, 4.17), the `p`-adic class-number formula (§4.23), the
integral Coleman image (§4.27) and the characterwise Iwasawa ranks (§5.3).

The existing Tau Ceti **ClassFieldTheory** roadmap supplies local and global
reciprocity and ray class fields (the idelic sequences used here are derived
from them in §0.30);
**ProfiniteCohomology** supplies continuous cohomology and its local Kummer
comparison. The current Tau Ceti completed-group-algebra library is used
directly. **LocalGaloisGroups** owns the completed multiplicative module
of a local field, its Galois action and reciprocity identification;
**ProfiniteArithmetic** owns the profinite powering conventions. None of
those carriers or general theorems is rebuilt here. The existing
**NumberFieldArithmetic** Stickelberger congruence concerns discriminants
modulo 4; the ideal-annihilator application here is a different statement.

IntegralIwasawaTheory proves the integral abelian main conjecture by its
Eisenstein route (§§6.5 and 11.7 there); §§3.5 and 4.14 here are independent
Euler-system and Greither proofs of abelian cases of that endpoint, shared
statements rather than second declarations. The odd-prime endpoint compares
characteristic ideals without assuming Vandiver. Its stronger cyclic-module isomorphism is outside this roadmap.
Greither's integral all-prime argument is a separate arithmetic proof.
The finite-level unit equality and the Selmer reformulations are consequences
of the main-conjecture layers, rather than prerequisites for them.

## Conventions

Fix compatible primitive roots `ζ_m` for positive `m`, with `ζ_mn^n=ζ_m`, in the
cyclotomic tower supplied by IntegralIwasawaTheory §§0.1, 1.1. All Frobenius elements
are arithmetic: `Fr_q(ζ_m)=ζ_m^q` when `q∤m`. Relative norms are field norms, with
real norm degree 2 for `m>2` and degree 1 for `m=1`,2. A root of unity of order `m`
is never introduced by an arbitrary element satisfying only `ζ^m=1`.

Unless a target says otherwise, the odd-prime character setting means `p>2`,
`χ` even and nontrivial of finite order prime to `p`, `O=ℤ_p[χ]`, `L` the field cut out
by `χ`, and `f` its primitive conductor. Write `χ(q)=0` when `q|f`. The cyclotomic
`ℤ_p`-extension has layers `ℚ_n`, `L_n=Lℚ_n`, `Γ=Gal(ℚ∞/ℚ)`, and `Λχ=O[[Γ]]`. In a
chosen coordinate `γ`, `T=γ−1` and `J=(T)`. The Tate dual of a lattice `T₀` is
`T₀*=Hom_O(T₀,O)(1)`; its Euler polynomial, rather than that of `T₀` itself,
is used in Rubin’s norm relation. Multiplicative groups are written additively
after `p`-adic completion and tensoring. In particular a Kummer class of 1 is 0.

For the same `p`, two different character constructions occur. Rubin’s `M^χ` is
the eigensubmodule, equivalently the invariants of the `χ⁻¹` twist. Greither’s
`M_χ=M⊗_(ℤ_p[Δ])ℤ_p(χ)` is the character quotient. They agree under the
prime-to-`p` semisimple hypotheses; the latter is only right exact in general.
The finite sum `Σδ χ(δ)⁻¹δ` is unnormalised and is not an idempotent projection.

The source letters for Iwasawa modules are incompatible. The following table
fixes the dictionary used in the targets.

| Arithmetic object | Rubin III | RJW §13 | Greither §§3–4 |
|---|---|---|---|
| Norm limit of `p`-class groups; unramified extension group | `A∞` | `Y∞` | `X` |
| Maximal abelian `p`-ramified pro-`p` extension group | `Z∞` in III.2.10 | `X∞` | `Y` |
| Norm limit of completed semilocal multiplicative groups | `Y∞` | use its full arithmetic name | use its full arithmetic name |

A plus superscript refers to the real field or the plus quotient specified in
the target. At `p=2` it never licenses division by 2. For the analytic series choose `u` generating `1+2pℤ_p` and put `q₀=u−1`; thus the pole `s=1` corresponds to `T=q₀`. In the finite-index formulas
of Layer 4, the notation copied as mathematical notation from Greither is
`|a|_p=p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value. Thus
`Nχ(a)=p^{[ℚ_p(χ):ℚ_p]v_p(a)}=|a|_p^{d(χ)}`. This convention is used only for
those index formulas; analytic supplier statements retain their own explicit
normalised absolute values.

Rationalizing an Iwasawa algebra means `Λχ[1/p]`, with bounded coefficient
denominators. It does not mean the full formal series ring `ℚ_p(χ)[[T]]`.
For example `T−p` remains a nonunit after the former operation and becomes a
unit after the latter. The Coleman comparison retains the former ring.

## Exact supplier contracts

The library baseline is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`
and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

### From Mathlib

Use the following declarations, with the stated scope.

- `Algebra.norm_algebraMap` (Mathlib/RingTheory/Norm/Defs.lean): `norm_K(algebraMap K L x) = x^{finrank K L}`.
- `Algebra.norm_eq_prod_automorphisms` (Mathlib/RingTheory/Norm/Transitivity.lean): For `L/K` Galois, `algebraMap (norm_K x) = ∏_{σ ∈ Gal(L/K)} σ x`.
- `Algebra.norm_norm` (Mathlib/RingTheory/Norm/Transitivity.lean): Transitivity of the norm in a tower.
- `IntermediateField.adjoin.finrank` (Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean): `[K(x) : K] = deg minpoly_K(x)` for integral `x`.
- `IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver` (Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean): In `ℚ(μ_{p^{k+1}})`, every prime above `p` equals `(ζ − 1)`.
- `IsCyclotomicExtension.autEquivPow` (Mathlib/NumberTheory/Cyclotomic/Gal.lean): `Gal(L/K) ≃* (ZMod n)ˣ`, `σ ↦ k` with `σ ζ = ζ^k`, for `cyclotomic n K` irreducible.
- `IsCyclotomicExtension.finrank` (Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean): `finrank K L =` `n.totient` for a cyclotomic extension with `cyclotomic n K` irreducible.
- `IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime` (Mathlib/RingTheory/RootsOfUnity/CyclotomicUnits.lean): `ζ − 1` and `ζ^j − 1` are associated for `j` coprime to `n`.
- `IsPrimitiveRoot.geom_sum_isUnit` (Mathlib/RingTheory/RootsOfUnity/CyclotomicUnits.lean): `∑_{i<j} ζ^i` is a unit for a primitive `n`-th root `ζ` in a domain, `n ≥ 2` and `j` coprime to `n`.
- `IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic` (Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean): `norm_K(ζ − 1) = eval 1 (cyclotomic n ℤ)` for `2 < n` and `cyclotomic n K` irreducible.
- `Module.finrank_mul_finrank` (Mathlib/LinearAlgebra/Dimension/Free.lean): The tower law `finrank F K · finrank K A = finrank F A`.
- `Nat.totient_mul` (Mathlib/Data/Nat/Totient.lean): `φ(mn) = φ(m)φ(n)` for coprime `m`, `n`.
- `Nat.totient_mul_of_prime_of_dvd` (Mathlib/Data/Nat/Totient.lean): `φ(p·n) = p·φ(n)` when `p` is prime and `p ∣ n`.
- `NumberField.RingOfIntegers` (Mathlib/NumberTheory/NumberField/Basic.lean): The ring of integers `𝓞 K`; its units are the global units.
- `Polynomial.cyclotomic.irreducible_rat` (Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean): `cyclotomic n ℚ` is irreducible for `n > 0`.
- `Polynomial.eval_one_cyclotomic_prime` (Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean): `eval 1 (cyclotomic p R) = p` for `p` prime.
- `Representation.averageMap` (Mathlib/RepresentationTheory/Invariants.lean): For a finite group with invertible cardinality in the coefficient ring, the averaging map `|G|⁻¹∑ρ(g)` onto invariants. The invertibility hypothesis is required.
- `Representation.invariants` (Mathlib/RepresentationTheory/Invariants.lean): The submodule of `Δ`-invariants of a representation.
- `Representation.mem_invariants` (Mathlib/RepresentationTheory/Invariants.lean): `v ∈` invariants `ρ ↔ ∀ g`, `ρ g v = v`.
- `ZMod.unitOfCoprime` (Mathlib/Data/ZMod/Basic.lean): The unit of `ZMod n` given by `x` coprime to `n`.
- `isUnit_of_dvd_unit` (Mathlib/Algebra/Divisibility/Units.lean): A divisor of a unit is a unit.
- `minpoly.dvd` (Mathlib/FieldTheory/Minpoly/Field.lean): The minimal polynomial divides every polynomial vanishing at `x`.
- `sub_one_dvd_natCast_of_pow_eq_one` (Mathlib/RingTheory/RootsOfUnity/CyclotomicUnits.lean): `ζ − 1` divides `n` when `ζ^n = 1` and `ζ ≠ 1`, in a domain.
- `NumberField.Units.finrank_eq` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean): Dirichlet’s additive unit rank `r₁+r₂−1`. It does not supply the character multiplicities of the Galois-module unit theorem; the characterwise statement is IntegralIwasawaTheory §4.3 (`unitRepresentation_augmentation`).
- `DirichletCharacter.LFunction_apply_one_ne_zero` (Mathlib/NumberTheory/LSeries/Nonvanishing.lean): `L(χ,1)≠0` for a nontrivial Dirichlet character; with §F.10 it gives `B_{1,χ}≠0` for odd primitive `χ`.
- `Polynomial.eval_one_cyclotomic_not_prime_pow` (Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean) and `NumberField.isUnit_iff_norm` (Mathlib/NumberTheory/NumberField/Units/Basic.lean): `Φ_g(1)=1` when `g` is not a prime power, and an algebraic integer of norm `±1` is a unit; together `1−ζ_g` is a unit for such `g`.
- `NumberField.IsCMField.indexRealUnits_eq_one_or_two` (Mathlib/NumberTheory/NumberField/CMField.lean): the subgroup generated by the real units and roots of unity of a CM field has index 1 or 2 in all units, so for odd `p` the odd character components of the `p`-completed units are torsion.
- `IsGalois.normalBasis` (Mathlib/FieldTheory/Galois/NormalBasis.lean): a normal basis for a finite Galois extension, used for the ranks of the semilocal units.
- `PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean): Formal power series `𝒪⟦X⟧`.
- `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean): the right-hand residue at one in terms of the native class number, regulator, discriminant, roots of unity and archimedean factors. Section F.9 compares this existing formula with finite character products.
- `Finset.prod_range_succ` (Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean): `∏_{a<n+1} f a = (∏_{a<n} f a)·f n`; its additive form `Finset.sum_range_succ`.
- `IsCyclotomicExtension.Rat.ramificationIdx_eq_of_prime_pow` (Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean): in `ℚ(μ_{p^{k+1}})` every prime above `p` has ramification index `p^k(p−1)`, the degree, for every prime `p` including 2. Hence `p` is totally ramified in every layer of `ℚ(μ_{p^∞})/ℚ` and of `ℚ_∞/ℚ`. For a number field `L` unramified at `p`, or whose completions at `p` have degree prime to `p`, multiplicativity of ramification indices gives `L∩ℚ_∞=ℚ` and makes every prime above `p` totally ramified in `L_∞/L` and in `L(μ_{p^∞})/L(μ_{2p})` from level 0 on (and in their real subextensions). This is the form of total ramification used below; IntegralIwasawaTheory §0.3 gives only eventual total ramification for a general `ℤ_p`-extension.
- `groupCohomology.exists_div_of_norm_eq_one` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean): Hilbert's Theorem 90 for a finite cyclic Galois extension `L/K` with generator `g`: an element of norm one has the form `y/g(y)`. Applied to the local layers of the cyclotomic `ℤ_p`-extension, it gives the vanishing of the norm-kernel term in §3.3.

The norm-of-scalars and transitivity theorems are applied to finite free
field extensions with the scalar-tower instances. The norm product needs
Galoisness. Cyclotomic degree calculations use positive conductors and
irreducibility over `ℚ`. The prime norm formula with `2 < n` treats the prime
2 separately. The root-of-unity divisibility arguments take place in a
domain; invertibility of the root order is an additional hypothesis.

### From Tau Ceti

- `ClassGroup.mulEquivHom` (TauCeti/NumberTheory/ClassGroup/Equiv.lean): the covariant action of ring automorphisms on the native class group, used directly in the finite Stickelberger statement. `ClassGroup.mulEquivHom_apply` identifies each action with `ClassGroup.mulEquiv`.
- `DirichletCharacter.generalizedBernoulli`, `DirichletCharacter.generalizedBernoulli_def`, `DirichletCharacter.generalizedBernoulli_one_of_ne_one` and `DirichletCharacter.map_generalizedBernoulli` (TauCeti/NumberTheory/DirichletCharacter/GeneralizedBernoulli.lean): the finite Bernoulli-polynomial sums, their nontrivial-character first-degree formula and coefficient transport. The modulus-one convention is `DirichletCharacter.generalizedBernoulli_modOne`, with positive first Bernoulli number. The value comparisons in §F.10 use this object.
- `TauCeti.KummerCoeff` (TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean): `μ_n ⊆ (Kˢ)ˣ` as a discrete `G_K`-module, written additively.
- `TauCeti.kummerMap` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean): The Kummer map `Kˣ →* H¹(G_K, μ_n)` for `n` invertible in `K`, the connecting map of the Kummer sequence.
- `TauCeti.kummerMap_eq_one_iff` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean): `kummerMap a = 1` iff `a` is an `n`-th power in `K`.
- `TauCeti.kummerIso` and `TauCeti.kummerClassMap_injective` in the same module: the finite Kummer quotient isomorphism and its injectivity, for `IsUnit (n : K)`.
- `TauCeti.explicitCoeff1_kummerCoeffPow_kummerMap` in that module: for `m∣n`, the coefficient power map `μ_n→μ_m` carries the `n`-Kummer class of a unit to its `m`-Kummer class.
- `TauCeti.kummerRes_kummerMap` and `TauCeti.kummerCor_kummerMap` in that module: inclusion corresponds to restriction and the relative unit norm to corestriction for the specified finite separable field extension and chosen embedding.
- `TauCeti.hasSum_log_of_mem_unitFiltration_one`, `TauCeti.continuous_log_unitFiltration` and `TauCeti.log_unitFiltration_injective` (TauCeti/NumberTheory/LocalField/Logarithm.lean): for a finite `p`-adic extension of ramification index `e`, native `NormedSpace.log` converges and is continuous on `U(K,i)`, `i≥1`, and is injective when `e<(p−1)i`. The valuation comparison is `TauCeti.valuation_log_sub_log`. No new principal-unit logarithm or convergence theorem is requested here.

Here `KummerCoeff K n` is the additive form of the roots of unity in a
separable closure. `kummerMap` lands in the multiplicative wrapper of
continuous `H¹` and requires `IsUnit (n : K)`. The finite norm, restriction and coefficient-transition squares above are supplied
directly; §F.1 proves their inverse-limit comparison and §0.25 their character comparison.

For the current completed-group-algebra interface, use
`TauCeti.completedGroupAlgebra`, its finite projections `proj`, group map
`of`, compatible-family constructor `mk`, and extensionality `ext`, in
`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`.
The associated module, product and power-series interfaces in that
completed-group-algebra directory fix the carriers for the supplier Iwasawa theory; arithmetic statements below add no competing
completed group ring. This current interface is an ownership boundary;
the representative Lean signatures use the pinned declarations above.

### From the arithmetic roadmaps

Foundation F states the continuous-cohomology, descent, Stickelberger and
analytic comparisons used in the arithmetic layers. Their sources and exact
hypotheses are part of those targets. The external contracts are the following.

Each supplier below is consumed only through the sections named, and only
for the statements those sections make.

- **IntegralIwasawaTheory.** §0.1 (the cyclotomic `ℤ_p`-extension with its torsion retained); §0.3 (`cyclotomic_every_pPrime_ramifies`, `cyclotomic_no_finite_prime_splits_completely`, the Frobenius description `κ_Γ(Frob_ℓ)=⟨ℓ⟩` and linear disjointness from every finite prime-to-`p` extension); §§0.2, 1.1 (compatible cyclotomic fields, real subfields, the norm direction and the restriction of `σ_a`); §1.3 (real cyclotomic generators); §1.5 (the prime-power index); §1.7 (Sinnott's circular numbers `D_k`, generated by `−1` and the norms `N_{ℚ(μ_n)/ℚ(μ_n)∩k}(1−ζ_n^a)`, `n>1`, `n∤a`, and the circular units `C_k=E_k∩D_k`; Sinnott 1980, §4, p. 201); §1.8 (Sinnott's lattice `U` and his Theorem 4.1, p. 207: for real `k` of conductor `m`, `[E_k:C_k]=h_k·2^{[k:ℚ]−1}·(∏_{q|m}[k_{q^e}:ℚ]/[k:ℚ])·(R:U)`, with `q^e‖m` and `k_{q^e}=k∩ℚ(μ_{q^e})`, and the archimedean logarithmic image `circularLog_image`); §2.2 (completed units, principal semilocal units and `globalUnitClosure`); §2.3 (`p`-ramified and unramified modules, `pRamifiedModule_rayLimit`, `unramifiedModule_classGroupLimit`); §2.4 (`principalUnitLimit_finite`, `unramifiedModule_finite_torsion`, `classGroupDirectLimit_dual_finite_torsion`); §2.6 (weak Leopoldt: `𝔛_S(K_∞)` has `Λ`-rank `r₂(K)` and no nonzero finite submodule); §2.7 (`finiteGlobalLocalSequence` `0→D_n→E_n→U_n⊕Σ_n→𝔛_S(K_n)→Cl(K_n)(p)→0`, `infiniteGlobalLocalSequence` `0→E_∞→U_∞⊕Σ_∞→𝔛_S(K_∞)→X_∞→0`, `unitLimit_eq_limit_closures`, and the discrete Kummer sequence over `K_∞⊇μ_{2p}` with its contragredient dual); §2.8 (`uniformCapitulationBound`, including the `S`-class version for `S⊇S_p∪S_∞`); §3.1 (`onePrimeClassControl`, `onePrimeBaseClassZero`); §3.2 (`inertiaClassControl`, `inertiaKernel_transition`); §3.3 (`classNumberGrowth`); §3.5 (`rjwModuleDictionary`; `greitherRayDictionary`, with `0→𝔛_S(F_∞)_{Γ_n}→A′(F_n)→Γ_n→0` and `(1−e₀)A′(F)≅(1−e₀)𝔛_S(F_∞)_Γ` for real `F`; the `p`-split dictionary `X′_{S_p}=X/D_∞`; Chevalley's ambiguous-class formula for cyclic extensions); §§4.1–4.2 (`bakerBrumer_algebraicNumbers`, `algebraicLog_kernel`: below); §4.3 (`unitRepresentation_augmentation`: `(O_E^×/μ(E))⊗ℚ≅ℚ[G]/ℚ·N_G` for real abelian `E`); §4.4 (`abelianLeopoldt` for every abelian field and every `p`); §5.6 (Ferrero–Washington for every abelian field); §6.3 (`bernoulliStickelberger_dictionary`: over `ℚ` with `F_n=ℚ(μ_{mp^n})`, `(m,p)=1`, the character projection of the Bernoulli distribution with coefficient `a/(mp^n)−1/2` at `σ_a⁻¹` is the Kubota–Leopoldt series `f_χ`, `f_χ(u^s−1)=L_p(χ,s)`, for every `p` under its convention `q=4` at `p=2`, including `m=1`, with the Mellin relation `a(T)=u(1+T)⁻¹−1`); §10.4 (`arithmeticCharacter_eulerQuotient`, the coinvariant lemma `|M_Γ|/|M^Γ|=|O/f(0)|` when `f(0)≠0`).
- **IntegralIwasawaTheory §§4.1–4.2**: for nonzero algebraic `p`-adic units with `ℚ`-linearly independent normalized `p`-adic logarithms, those logs are independent over the embedded algebraic numbers. A common deep power meets the strict exponential-disc hypothesis, also at `p=2`. Its owner imports the qualitative `p`-adic Baker theorem from LinearFormsInLogarithms §8.10; no transcendence proof is replanned here. A `p`-unit `y` is first replaced by `p^(−v_pι(y))y` at a split completion, preserving `log` while making it a local unit. Section 4.18 supplies the actual nonzero Gauss-ideal vector before applying this generic input.
- **IntegralIwasawaTheory §4.2**: with Iwasawa's logarithm `(log_p p = 0)`, `(a) log_p α = 0` for algebraic `α ≠ 0` exactly when some power of `α` is a root of unity times a power of `p`, and `(b)` logarithms of algebraic numbers that are linearly independent over `ℚ` are linearly independent over `ℚ̄`. Section 4.18 uses it for the direct form of its nonvanishing argument, which needs neither the minus condition nor complete splitting.
- **ColemanPowerSeries.** For one finite unramified `E/ℚ_p` at every `p`, including 2: §1.82 (the unramified determinant norm), §1.83 (the unramified integral trace `τ`), §1.93 (`τ=pψ` for the normalized trace `ψ`), §1.85 (norm and coefficient Frobenius commute), §§1.117–1.120 (interpolation with arithmetic Frobenius, the equivalence `U_∞≅B^{N=Σ}`, its topology and its coefficient-Frobenius equivariance). A finite product of unramified rings is handled componentwise, with the semilocal tower and componentwise norm of §§0.97 and 0.148–0.150, as in §4.4, step 1. Over `ℤ_p` and for odd `p`: §3.46 (the principal Coleman sequence `0→ℤ_p(1)→U_{∞,1}→Λ(G)→ℤ_p(1)→0`); §2.39 `(Col=−Col₀)`; §4.24 (`Col(q(a))=([a]−1)ζ_p`, the raw image `Col₀(q(a))` being its negative); §4.27 (the real image ideal `Col(C^+_{∞,1})=I(G^+)ζ_p^+`); §4.30 (Iwasawa's real local-unit comparison `U^+_{∞,1}/C^+_{∞,1}≅Λ(Γ^+)/I(Γ^+)ζ_p`). This roadmap proves Coleman's exact sequence over unramified coefficients at every `p` ([§4.4](#greither-coleman-sequence-all-p)), the integral image for characters of order prime to `p` ([§4.27](#integral-coleman-image-prime-to-p)) and Rubin's local functionals ([§0.30](#stickelberger-class-family)).
- **`TauCetiRoadmap.ClassicalArithmeticCompletion`**: §1.47 (for `m≥2` and a prime `P∤m` of `ℤ[ζ_m]` of norm `q`, the Gauss sum `g(P)` of the inverse `m`-th power residue character, and `Φ(P)=g(P)^m∈ℤ[ζ_m]`, `stickelbergerPhi_prime`) and §1.55 (Stickelberger's relation, `span_stickelbergerPhi`: `(Φ(P))=P^γ` with `γ=Σ_{1≤t<m,(t,m)=1}tσ_t^{−1}`, for every rational prime below `P`, including 2 when `m` is odd).
- **`TauCetiRoadmap.Chebotarev`**: Layer 10 (`hasDirichletDensity_frobeniusPrimeSet`, with the derived infinitude of every Frobenius class in a finite Galois extension). Several conditions at once are imposed as one Frobenius class in a compositum, as in §4.9.
- **`TauCetiRoadmap.ClassFieldTheory`**: Layer 0 (the Herbrand quotient of a finite cyclic group, its multiplicativity in short exact sequences, `herbrandQuotient_eq_mul_of_shortExact`, and its invariance under maps with finite kernel and cokernel, `herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel`, on Tau Ceti's `TateCohomology.herbrandQuotient`); Layers 4 and 11 (the global Artin map on idele classes for finite Galois layers, compatible in towers: norm against restriction, and inclusion of idele classes against transfer); Layers 6–7 (finite local reciprocity `localArtinEquiv`, its norm functoriality `artinMap_norm`, and units into inertia `mem_inertiaSubgroup_of_mk_eq_artinMap`); Layer 12 (the global class-field correspondence and the norm index for finite abelian extensions); Layer 13 (Hilbert and ray class fields, `rayClassField` with `gal_rayClassField_equiv_rayClassGroup`, the cyclic Hasse norm theorem, and Kronecker–Weber with conductors, `kroneckerWeber`). Over `ℚ` these give the ray class field modulo `m∞` as `ℚ(μ_m)` and modulo `m` as `ℚ(μ_m)^+`, so the maximal `p`-subextension `ℚ(q)` of the ray class field modulo `q` lies in `ℚ(μ_q)`; §0.15 records this derivation. That the units map onto the Galois group of a totally ramified local layer is derived in §2.2 from `localArtinEquiv` and the norm of a uniformizer. The pro-`p`, `p`-ramified and idelic forms of class field theory are derived from these finite statements in §§0.30, 4.17 and through IntegralIwasawaTheory §§2.3, 2.7, 3.5.
- **`TauCetiRoadmap.ProfiniteCohomology`**: Layer 5 (inflation–restriction `0→H¹(G/N,M^N)→H¹(G,M)→H¹(N,M)` and the five-term sequence), Layer 6 (corestriction for an open subgroup, with its explicit transversal formula `explicitCor1Transversal`) and Layer 9 (Hilbert 90, Kummer theory and the Kummer norm square `kummerIso_norm`).

The following arithmetic inputs are stated by no supplier and are proved
here, each at its first use: the character-isotypic restriction–Kummer
isomorphism (§0.25, `restrictionKummer_chiEquiv`); the idelic exact
sequence with `ℤ_p`-valued idele characters and Rubin's local functionals
`λ_m` (§0.30); Rubin's identification of the Selmer group of `D_χ` with a
class-group dual, with its Iwasawa limit (§1.3); the ranks and torsion of
the local multiplicative limits (§2.2); Sinnott's Proposition 5.1 and his
stable index in `ℤ_p`-extensions (§3.`3(f)`–`(g)`); Coleman's exact sequence over
unramified coefficients at every prime (§4.4); Rubin's uniform Tate bounds
for units (§4.10); the finiteness of the exceptional `ω`-component (§4.14);
the split sequence `0→E_{1−γ}→G/G′→Γ→0` and the 2-ramified correspondence
(§4.17); the `p`-adic class number formula and the `p`-adic logarithmic image
of circular units (§4.23); the integral Coleman image for characters of
order prime to `p`, with the character form of the odd-prime main conjecture
(§4.27); and the characterwise ranks of the `p`-ramified module of `ℚ(μ_{p^∞})`
(§5.3).

Four comparisons need particular care, and each is proved here from the
statements above; no supplier is cited for that same conclusion. In §3.3 the equality of Iwasawa invariants compares semilocal
units modulo circular units and the `p`-ramified module with their finite
layers, where the control is exact or has a bounded error, and uses
Sinnott's stable index; no descent of global units is needed for it. The
same target also states the global-unit descent with uniformly bounded
kernel and cokernel (Belliard), the norm-limit adapter and the bounded
Sinnott correction. In §4.7 the pure cyclotomic characters of the Coleman
image are computed from the smoothed units `(1−ζ^b)/(1−ζ)` in Greither's
normalisation, and the comparison with the ColemanPowerSeries §§4.24, 4.27
normalisation is a separate target. In §4.18 the nonvanishing of the
exceptional Gauss-sum logarithm follows from its nonzero valuation vector
and Baker–Brumer. In §4.21 the odd-prime split case is proved through the
valuation and logarithm lattices, their finite control defect and the
faithful integral character quotient; there the odd-prime local logarithm
has kernel `p^ℤ×μ_{p−1}` on `ℚ_p^×` and maps `ℤ_p^×` onto `pℤ_p`.

## How to read the build

Foundation F gives the general cohomology, descent and value comparisons.
Layer 0 fixes the cyclotomic norm relations and their Kummer, character and
Stickelberger applications. Layer 1 gives finite descent and its class-group
bound; Layer 2 passes to the Iwasawa divisibility. Layer 3 proves equality
by comparing Iwasawa invariants with Sinnott's stable index at the finite
layers, through semilocal units modulo circular units and the `p`-ramified
module (with the global-unit descent as a second route), and by
Weierstrass preparation, and identifies the odd-prime analytic ideal. Layer 4 gives the abelian all-prime proof, with integral
character functors, the local image, Kolyvagin induction and the finite
trivial-zero calculations. Layer 5 collects the finite equality and the
odd-character and Tate-twisted consequences. The README is the specification;
`Suggested.lean` records only representative signatures over the available
library carriers.

## Foundation F: cohomology, descent and value comparisons

These targets provide the general statements used by the cyclotomic application.
Fix a number field `K`, a prime `p`, a finite extension `Φ/ℚ_p` with integer
ring `O`, uniformizer `π` and residue field `k`, and a finite free continuous
`O[G_K]`-lattice `T` unramified outside finitely many places. Put
`V=T⊗_O Φ`, `W=V/T`, `D=Φ/O`, `T*=Hom_O(T,O)(1)` and `W*=V*/T*`.
The definitions and results below retain arbitrary `K`, arbitrary rank of `T`
and the coefficient extensions allowed by their sources. A prime bound is
imposed only on the particular theorem that needs it.

<a id="compact-kummer-and-norm-limits"></a>
### F.1 Compact Kummer theory and norm limits

Use continuous-cochain cohomology for compact and rational coefficients,
with the finite-coefficient comparisons and inverse-limit maps of
IntegralIwasawaTheory §2.0 and ProfiniteCohomology Layers 0–12. For any field
`F` with `char F≠p`, construct `kummerLimit` as the inverse limit of the
native finite Kummer maps. Prove `kummerLimit_equiv`:
`H¹(F,ℤ_p(1)) ≅ lim_m Fˣ/(Fˣ)^(p^m)`.
The coefficient transition is the pth-power map on roots of unity and the
quotient transition on multiplicative classes. The groups `μ_(p^m)(F)`
are finite, hence their inverse system is Mittag–Leffler. The resulting
`lim¹ H⁰=0` gives the comparison with compact continuous `H¹`.
For local fields this is a homeomorphism; for arbitrary fields the assertion
is an algebraic isomorphism. Its API is `kummerLimit_res`,
`kummerLimit_cor`, `kummerLimit_linear` and compatibility with every finite
coefficient projection. Restriction corresponds to inclusion of elements,
and corestriction corresponds to the relative norm. The finite squares are
the pinned Tau Ceti declarations in the supplier contracts, not new targets.
(**RUBIN-ES**, `I` Example 2.1, p.3, `B` Proposition 2.3, p.152;
**RJW-PADIC-L**, display (10.7), p.52.)

Define `iwasawaCohomology` by `H¹_Iw(K∞/K,T)=lim_F H¹(F,T)` with
corestriction, for an abelian `ℤ_p^d`-extension with `d≥1`, and give it the
continuous completed-group-algebra action. Its API includes finite
projection, transitivity, coefficient maps, semilocal localization and
restriction/corestriction compatibility. Prove `universalNorm_unramified`:
at every prime away from `p` with infinite decomposition group, every
norm-coherent class is unramified. Thus if `S` contains `p`, the infinite
places, the ramification of `T` and the primes with finite decomposition
group, `lim_F H¹(F,T)=lim_F H¹(K_S/F,T)`. Prove the local assertion first
in an unramified `ℤ_p`-extension: the inertia-cohomology term is finitely
generated over `ℤ_p` and its norm limit vanishes. No condition at `p` is
deduced from this argument. (**RUBIN-ES**, `B` §3, Lemma 3.2, Proposition 3.3
and Corollaries 3.4–3.5, pp.153–155.)

**Checks.**

- Over a separably closed field, the multiplicative completion and `H¹` are
  both zero. Over `ℝ` at `p=2`, both are `ℤ/2`, with nontrivial sign class.
- Over `𝔽_q`, `p∤q`, the limit is the `p`-primary part of `𝔽_qˣ`; the
  coefficient transitions must preserve this finite torsion.
- For `ℚ`, completion is larger than `ℚˣ⊗ℤ_p`: `p`-adically convergent
  combinations with unbounded finite prime support occur in the former.
- The zero Iwasawa class projects to zero at every layer. A family with one
  nonzero projection cannot be the zero limit class.
- A class compatible under restriction has corestriction multiplied by the
  extension degree. It need not define an Iwasawa-cohomology class.
- A completely split prime has no growing local degree; the universal-norm
  assertion at that prime does not follow. Primes above `p` are also excluded.

*Needs:* IntegralIwasawaTheory §2.0; ProfiniteCohomology Layers 5–12;
LocalGaloisGroups Layer 0; PadicMeasuresIwasawaAlgebras §5.2.

<a id="selmer-and-local-conditions"></a>
### F.2 Local conditions and Selmer comparisons

Use the general discrete Selmer construction of EllipticCurves Layer 7.
Extend its kernel-of-localization description to the compact lattice `T`
and rational representation `V`, and propagate rational local conditions
to `T` by inverse image and to `W` by image. Away from `p`, set
`H¹_f(K_v,V)=ker(H¹(K_v,V)→H¹(I_v,V))`; at `p` allow the explicitly
specified rational local condition with its Tate-orthogonal dual.
For discrete torsion, compact finite-type or rational coefficients `B`,
define `unramifiedCondition` as the kernel of restriction to inertia and
prove `unramifiedCondition_coinvariants`:
`H¹_ur(K_v,B)≅B^I/(Fr_v−1)B^I`. On a ramified lattice or its torsion
quotient, the propagated finite condition and raw unramifiedness must be
compared, not identified without hypotheses. For a finite support `S`
containing `p∞` and the ramification, prove `selmerKernel_global`:
the kernel inside `H¹(G_(K,S),B)` equals the full global classes satisfying
the conditions at `S` and unramifiedness outside it. Enlarging `S` with
unramified conditions leaves the group unchanged. Supply coefficient
functoriality, strict/relaxed local modifications and their localization
exact sequences. (**RUBIN-ES**, I Definitions 3.1 and 3.4, Lemmas 3.2,
3.5 and 5.3, pp.4–7, 12.)

For a `G_(K_v)`-stable submodule `F⁺B⊆B` at `v|p`, define
`greenbergCondition=ker(H¹(K_v,B)→H¹(I_v,B/F⁺B))`. Its API includes
`greenberg_zero`, `greenberg_top`, `unramified_le_greenberg` and coefficient
maps preserving the filtration. Stability under the local decomposition
group suffices. For `W_n=(ℚ_p/ℤ_p)(n)` in §5.3 use `F⁺W_n=W_n` for
`n≥1` and zero for `n≤0`. (**RJW-PADIC-L**, Definition 13.19, p.70.)

Prove `selmerRestriction_injective` for any finite extension whose
restriction preserves the specified local conditions, under either of
these hypotheses: its degree is prime to `p`, or `B^(G_L)=0` for its
Galois closure `L/K`. In particular, vanishing upstairs implies vanishing
downstairs under these hypotheses. Use `cor∘res=[L:K]` in the first case
and inflation–restriction in the second. (**RUBIN-ES**, `B` Proposition 2.5,
p.153, and `I` §5, p.12.)

**Checks.**

- Trivial `ℤ/p` coefficients give an unramified local group `ℤ/p`.
  Discrete `ℤ` instead has `Hom_cts(Ẑ,ℤ)=0`, so its Frobenius
  coinvariant group `ℤ` is not a valid instance of the torsion formula.
- For an unramified lattice away from `p`, the propagated condition on
  `W` agrees with unramifiedness. A `p`-divisible Tamagawa defect can prevent
  that equality for a ramified lattice.
- With `F⁺B=0`, Greenberg's kernel is unramifiedness.
- With `F⁺B=B`, it is all of `H¹`.
- A filtration stable under the local decomposition group defines the
  condition even if it is not globally stable.
- For `B=ℤ/3` with unramified `Fr=−1`, the unramified group is zero,
  since `Fr−1` is invertible; a construction ignoring Frobenius fails.
- Over `ℚ` with `p=3`, relaxed support `{3,19,∞}` for `μ₃` gives Kummer
  generators 3 and 19. Strictness at 3 leaves the line generated by 19,
  since 19 is a cube in `ℚ₃`; strictness at both finite places gives zero.
- A nonzero class in `Hom(Gal(L/K),ℤ/p)` for a cyclic `p`-extension
  restricts to zero. Arbitrary extension degree does not imply injectivity.

*Needs:* §F.1; EllipticCurves Layer 7; ProfiniteCohomology Layer 5;
ClassFieldTheory Layer 5 for local Tate duality.

<a id="euler-system-module-and-conductors"></a>
### F.3 Euler polynomials, the module of systems and conductor presentations

For `q∤p` unramified on `T`, let `P_q(X)=det(1−Fr_q⁻¹X | T*)`.
Prove its equality with `det(1−Nq⁻¹ Fr_q X | T)` and the coefficient
comparison with `det(1−Fr_q X | T)`: the coefficients in degree `i`
differ by `Nq^(−i)`. They are congruent modulo `Nq−1`, but need not be
equal. Give constant term, rank-zero, direct-sum, coefficient-extension,
twist and Cayley–Hamilton APIs. (**RUBIN-ES**, IV Lemma 1.2, p.57.)

The polynomial and Euler-system definitions also apply over a commutative
coefficient order finite free over `ℤ_p`; the length bounds in §§F.7–F.8
use the complete DVR `O` specified above.

For any abelian extension `𝒦/K` and ideal `N` containing `p` and the
ramification of `T`, define `EulerSystem` to be the completed-group-algebra
submodule of `∏_(K⊆F⊆𝒦 finite) H¹(F,T)` satisfying
`Cor_(F′/F)c_(F′)=(∏_(q∈Σ(F′/F))P_q(Fr_q⁻¹))c_F`, where `Σ` consists
of primes outside `N` newly ramifying in `F′/K`. Give evaluation,
extensionality, addition, scalar action, tower restriction and compatible
family lifting APIs. Admissibility is a separate property: `𝒦` contains
every maximal `p`-subextension `K(q)` of the ray field modulo `q`, `q∤N`,
and a `ℤ_p^d`-extension, `d≥1`, with no completely split finite prime.
The family definition makes sense without this property; the descent
theorems use it or the rigidity alternatives of §F.5.
(**RUBIN-ES**, II Definition 1.1, pp.21–22.)

Prove `eulerSystem_conductorPresentation`: the module is equivalent to
the conductor-indexed ray-class family with the one-prime norm factors
`P_q(Fr_q⁻¹)` for `q∤mN` and 1 for `q|mN`. The conductor includes its
archimedean part. The comparison from ray families uses corestriction
from the field at the conductor; the inverse comparison inserts the
Euler factors of conductor primes unramified in that field. Prove also
the squarefree presentation on the cofinal fields `F(r)=FK(r)`, where
`K(r)` is the compositum of the `K(q)`, for the minimal admissible
extension. Give both inverse maps and their evaluation formulas.
(**RUBIN-ES**, II Remarks 1.3–1.4, pp.22–23.)

**Checks.**

- For `T=ℤ_p(1)`, Rubin's polynomial is `1−X`; the other convention is
  `1−Nq X`.
- For the zero representation the polynomial is 1.
- For the trivial lattice `T=ℤ_p`, Rubin's polynomial is `1−Nq⁻¹X`,
  different from the cyclotomic lattice's polynomial.
- The zero family satisfies every relation. Replacing corestriction by
  restriction fails when `([F′:F]−1)c_F≠0`.
- In the `p`-direction no new prime outside `N` occurs, so the family is
  norm coherent, with factor 1.
- At conductor one, the ray presentation uses `K(1)`, the `p`-Hilbert
  class field, which need not be `K`. Its norm to `K` must be retained.
- The tower `ℚ^ab/ℚ` contains every ray `p`-subextension and the cyclotomic
  `ℤ_p`-extension. A finite abelian tower fails the infinite-direction
  admissibility clause, regardless of its finite norm relations.
- Restricting the squarefree presentation to `r=1` leaves exactly the
  corestriction-compatible classes in the infinite `p`-direction.
- A conductor prime unramified in its ray-field intersection introduces
  an Euler factor in the inverse comparison; omitting it changes the family.

*Needs:* §§F.1–F.2; ClassFieldTheory Layer 13; native determinants and
characteristic polynomials; PadicMeasuresIwasawaAlgebras Layer 1.

<a id="admissible-primes-and-finite-singular"></a>
### F.4 Admissible primes and finite–singular comparison

Let `K(1)` be the `p`-Hilbert class field and `K(q)` the maximal `p`-subfield
of the ray class field modulo `q`. For finite `F⊆K∞` put `F(1)=FK(1)`.
For `0≠M∈O`, define `rubinPrimes(F,M,T)` as squarefree products of
primes `q∤N` with `M|[K(q):K(1)]`, `M|P_q(1)` and complete splitting
in `F(1)/K`. Specify the corresponding prime subset as well as its
squarefree products. Give membership, change-of-modulus, omission of a
factor and compositum APIs. If the ideal `M O∩ℤ` is generated by `M̄`,
prove `mem_rubinPrimes_of_frobenius`: a Frobenius conjugate to `τ` on
`F(1)(μ_M̄,(O_Kˣ)^(1/M̄),W_M)`, with `τ` fixing the ray-base, roots
and unit radicals and `T^(τ=1)≠0`, gives the stated membership.
Chebotarev supplies infinitely many such primes after any finite exclusion
once that conjugacy class exists. (**RUBIN-ES**, IV Definition 1.1 and
Lemmas 1.2–1.3, pp.56–58.)

For a finite free unramified local representation `B` over a commutative
artinian ring `R`, suppose `#k_vˣ R=0` and `det(1−Fr_v | B)=0`.
Write `P(X)=(X−1)Q(X)` for `P(X)=det(1−Fr_v X | B)`.
Define `finiteSingular` by the operator `Q(Fr_v⁻¹)` from
`B/(Fr_v−1)B` to `B^(Fr_v=1)`, using Frobenius evaluation on
`H¹_f` and tame inertia evaluation on `H¹_s`. Keep the tensor factor
`k_vˣ`, or its ray quotient `G_q`, in the intrinsic comparison. If
the Frobenius coinvariants are free of rank one, prove it is an
isomorphism. With a chosen generator `σ_q`, changing it to `σ_q^a`
multiplies the scalar comparison by `a⁻¹`; the tensor-valued comparison
is unchanged. Its API includes the quotient-polynomial identity,
coefficient reduction, the isomorphism criterion and generator change.
Naturality is asserted for coefficient reductions of one fixed lattice
and for maps commuting with the quotient-polynomial operators.
(**RUBIN-ES**, IV Lemma 5.2 and Definition 5.3, pp.67–68.)

**Checks.**

- Over `ℚ` for `T=ℤ_p(1)` and `M=p^k`, the prime criterion is
  `q≡1 mod p^k`; for a nontrivial twist, the Frobenius representation
  condition must also hold.
- For `p=3`, `F=ℚ`, `T=ℤ₃(1)` and `M=3`, the prime 7 is admissible;
  it fails the `M=9` criterion. Checking only the residual congruence
  would not detect this change.
- Splitting in `F` alone does not guarantee splitting in `F(1)`.
  Increasing `M` shrinks the admissible prime set.
- For `P=1−X`, `Q=−1`, which fixes the finite–singular sign.
- For `P=(1−X)²`, `Q(1)=0`; the repeated fixed eigenvalue cannot
  satisfy the rank-one isomorphism conclusion.
- Over `𝔽₅`, the fixed-line inclusion into `diag(1,2)` changes `Q(1)`
  from `−1` to 1. Arbitrary equivariant inclusions do not preserve this map.

*Needs:* §§F.1–F.3; ClassFieldTheory Layers 7 and 13;
Chebotarev Layer 10; native Cayley–Hamilton.

<a id="twisting-replacement-and-rigidity"></a>
### F.5 Twisting, Euler-factor replacement and rigidity

For a finite-order character `χ` of `Gal(𝒦/K)`, with values in `Oˣ`,
field `L` and conductor `fχ`, fix a generator `ξχ` of `Oχ`. Define
`twistEulerSystem(c,χ)_F=Cor_(FL/F)(c_(FL)⊗ξχ)`.
Prove this is a system for `(T⊗χ,𝒦,Nfχ)`. If `L⊆L′⊆𝒦` have the
same conductor, restriction to `FL′`, followed by cancelling `ξχ`,
is `Σ_(δ∈Gal(FL′/F))χ(δ)δ c_(FL′)`. Give linearity,
trivial-character, coefficient-extension, conductor and restriction APIs.
Comparing iterated twists uses corestriction from the compositum of
the character fields; cancelled ramification contributes its Euler
factors. Twisting by an inverse character therefore need not undo the
first twist. (**RUBIN-ES**, II Proposition 4.2 and Lemma 4.3, pp.30–31.)

Prove `replaceEulerFactors`: for polynomial families `f_q≡g_q mod Nq−1`,
there is an `O`-linear map from families satisfying the `f_q` relations
to those satisfying the `g_q` relations. It preserves components in
fields unramified outside `N` and preserves character sums whose
character conductor contains every newly ramified prime outside `N`.
Include the unit-factor and variable-power variants of the comparison.
This is a map of families with explicit evaluation identities, not an
assertion that the two norm conditions are equal.
(**RUBIN-ES**, IX Lemma 6.1 and Example 6.2, pp.141–142.)

For a tower containing all the `K(q)` but without an infinite
`p`-direction, retain the finite descent results under the following
rigidity alternatives, together with `T^(G_(K(1)))=0`: all ray-indexed
classes are finite away from `p`, and either there is `γ` fixing
`K(1)(μ_(p∞),(O_Kˣ)^(1/p∞))` with `γ−1` injective on `T`, or every
`Fr_q^(p^a)−1`, `a≥0`, is injective on `T` and the local congruence
of §F.6 is imposed on the family. Give the hypothesis predicate,
its stability under coefficient extension, and the finite-depth
version with classes in `T/MT`; the local finite condition in finite
depth can require one uniform multiplier. The ordinary admissible
tower is the third, infinite-direction alternative of the same
rigidity theorem. (**RUBIN-ES**, IX §1, pp.133–136, and §3, pp.136–137.)

**Checks.**

- The trivial twist is the original family.
- Twisting the zero family gives zero.
- A character ramified at a prime forces that prime into the new bad support.
- Twisting by `χ` and then `χ⁻¹` gives `Cor_(FL/F)c_(FL)`, with its
  Euler factors; a ramified character field need not give back `c_F`.
- When `f_q=g_q` for every `q`, the replacement map is the identity.
- Replacement is the identity on components unramified outside `N`,
  but the two one-prime norm relations can differ.
- An injective `γ−1` excludes the trivial rank-one action. Without
  any rigidity alternative, a family supported only at its base field
  can satisfy vacuous zero-factor norm relations with arbitrary base value.
- The Frobenius-injectivity alternative alone does not supply the local
  congruence; that congruence is a separate clause of the hypothesis.

*Needs:* §§F.1–F.4.

<a id="derivative-descent-and-local-relations"></a>
### F.6 Derivative descent and local relations

For each cyclic ray factor choose `σ_q`, put `n_q=|G_q|`,
`N_q=Σ_(i=0)^(n_q−1)σ_q^i` and
`D_q=Σ_(i=1)^(n_q−1)iσ_q^i`, and define `D_r=∏_(q|r)D_q`.
Prove `(σ_q−1)D_q=n_q−N_q`, the commuting-factor identities, and
the change-of-generator law modulo `M`. Construct the universal
norm-relation module on the symbols at divisors of `r`; prove its
finite freeness over `O`, its universal evaluation into cohomology,
and the coinduced lift and connecting map required for descent.
Define `derivativeClass(c,F,r,M)` in `H¹(F,T/MT)` by that connecting
map applied to the invariant universal derivative. It restricts to
`N_(F(1)/F)D_r c_(F(r)) mod M`, is independent of lifts and coset
representatives, and at `r=1` is `c_F mod M`. Supply linearity,
modulus reduction and coefficient inclusion, localization and intrinsic
generator independence after tensoring with `⊗_(q|r)G_q`.
Invariant derivatives upstairs are not used as a substitute for the
descended classes. (**RUBIN-ES**, IV §§2–4, pp.58–67, especially
Definition 4.10 and Lemma 4.13.)

Prove that these classes are finite away from `pr` and satisfy
`loc_q^s κ_(F,rq,M)=φ_(q,σ_q)^fs(loc_q κ_(F,r,M))` when `rq`
is admissible. When Frobenius coinvariants have rank one, the orders of
the two localized classes agree. If the original system is zero at
a finite set away from `p`, its derivative classes retain that condition.
For finite-depth systems retain the uniform multiplier in the finite
condition. Prove also the local congruence at primes above `q`:
`loc_Q c_(F(rq)) = A_q(Fr_q⁻¹)loc_Q c_(F(r))`, where
`A_q(X)=(P_q(X)−P_q(Nq X))/[K(q):K(1)]` is an integral polynomial.
The divisibility of the ray degree into `Nq−1` justifies this quotient.
(**RUBIN-ES**, IV Theorems 5.1 and 5.4, pp.67–68, §§6–7,
pp.69–76, Corollary 8.1, p.77, IX Theorem 5.2, p.140.)

**Checks.**

- For `r=1`, the derivative is the initial reduced class; for the zero
  system every derivative is zero.
- In a cyclic group of order 3, `D=σ+2σ²` gives
  `(σ−1)D=3−(1+σ+σ²)`, fixing the derivative sign.
- Corestriction from `F(r)` gives the norm element rather than `D_r`;
  at a nonempty admissible conductor its Euler factor can be zero
  modulo `M` even when the derivative class is nonzero.
- Replacing `σ_q` by `σ_q^a` changes the scalar local comparison
  by `a⁻¹`, which is cancelled by the tensor generator.
- The finite condition away from `pr` gives no condition at `p`;
  a claimed strict condition there would strengthen the theorem.

*Needs:* §§F.1–F.5; ProfiniteCohomology Layers 5–10 for connecting
maps, coinduction, Shapiro and semilocal restriction.

<a id="finite-euler-system-bound"></a>
### F.7 Finite bounds with both error terms

Define `rubinHyp(K,T)` by a `τ∈G_K` fixing `K(1)`, all `p`-power
roots of unity and all `p`-power roots of global units, with
`T/(τ−1)T` free of rank one, and with `T/πT` irreducible.
The rational variant replaces these by one-dimensional rational
coinvariants and irreducibility of `V`. Put
`Ω=K(1)K(W)K(μ_(p∞),(O_Kˣ)^(1/p∞))` and define
`ind_O(c)=sup{a : c_K∈π^a H¹(K,T)+H¹(K,T)_tors}`.
Define the two errors as the lengths of
`H¹(Ω/K,W)∩S^Σp(K,W)` and
`H¹(Ω/K,W*)∩S_Σp(K,W*)`, with inflation understood. Their finiteness
requires rational irreducibility and excludes the trivial and cyclotomic
rank-one representations. Give integral-to-rational implication,
rank-one, torsion, scaling and error-length APIs.
(**RUBIN-ES**, II §2 and Definition 2.1, p.24, `V` Lemma 3.2, p.87.)

Prove `finiteEulerSystem_bound`: for odd `p`, an admissible Euler
system and `rubinHyp(K,T)` give
`length_O S_Σp(K,W*) ≤ ind_O(c)+n_W+n_W*`.
The strict-at-`p` dual Selmer group is the one in this statement.
Under the rational hypothesis, `T≠O` and nontorsion `c_K`, prove its
finiteness for every `p`. For local conditions at `p` orthogonal to
their duals, a nonzero singular localization of finite index gives the
corresponding bound for the full Selmer group using
`length_O(H¹_s(K_p,T)/O loc^s(c_K))` in place of the initial index.
Allow prescribed zero localizations away from `p`, with the matching
relaxed/strict Selmer error intersections. Prove these statements also
under §F.5's rigidity hypotheses. The proof includes Chebotarev selection
detecting the quotient by the error intersections, the telescoping
derivative-localization filtration, its cokernel bound and the global
duality comparison. Finite coefficients are compared uniformly before
passing to `W*`; annihilator exponent is not substituted for length.
(**RUBIN-ES**, II Theorems 2.2–2.3, p.24, `I` Corollary 7.5,
pp.19–20, `V` Lemma 2.5 and proof, pp.82–86, IX §5, p.140.)

**Checks.**

- Rank one has `τ=1` and satisfies the integral hypothesis. The zero
  representation and the trivial rank-two representation fail it.
- A unipotent matrix with upper entry `π^a`, `a>0`, has rational
  coinvariant dimension one but integral coinvariants
  `O⊕O/(π^a)`; the integral freeness clause fails.
- In `H¹=O⊕O/(π²)`, initial value `(π³,1)` has index 3, while
  `(0,1)` has infinite index. Scaling by `π` increases the finite index by 1.
- An error group `(O/π)²` has length 2 and exponent 1; the bound uses 2.
- The zero system has infinite index and gives no finiteness assertion.

*Needs:* §§F.1–F.6; Chebotarev Layer 10; IntegralIwasawaTheory §2.0
for finite global duality; ClassFieldTheory Layer 5 for local duality.

<a id="iwasawa-euler-system-bound"></a>
### F.8 Iwasawa indices, duality and divisibility

Let `Γ=Gal(K∞/K)≅ℤ_p^d`, `d≥1`, with no completely split finite
prime, and `Λ=O[[Γ]]`. Define `rubinIwasawaHypT` and its rational
variant by §F.7 with `τ∈G_(K∞)` and irreducibility on `G_(K∞)`.
Define `rubinTowerHyp`: if `d=1` and the action on `V` is trivial or
cyclotomic over `G_(K∞)`, then `K` is totally real satisfying Leopoldt,
or imaginary quadratic. Give integral-to-rational and base-field
implications, invariance under `Γ`-character twists and the automatic
cases `d≥2` and `K=ℚ`. For an Iwasawa class `x`, define
`lambdaIndex(x)={f(x) : f∈Hom_Λ(H¹_Iw,Λ)}`. Prove this is an ideal,
that it scales by the scalar multiplying `x`, vanishes exactly on torsion,
and is `(a)` when `H¹_Iw/tors≅Λ` takes `x` to `a`.
(**RUBIN-ES**, II §3, pp.26–28, Definition 3.1, p.28.)

Define `restrictedSelmerDual` by dualizing the direct limit of the
strict-at-`p` groups `S_Σp(F,W*)`, and define the true Selmer dual using
`S(F,W*)`. Prove finite generation and the exact sequence
`0→H¹_(Iw,s)(K_p,T)/loc^s H¹_Iw(K,T)→Hom_O(S(K∞,W*),D)→X∞→0`,
where `X∞` is the restricted dual and the first term is formed from the
norm-limit singular local groups. This is obtained from finite duality
and §F.1's universal-norm comparison. Prove weak Leopoldt, that `X∞`
is `Λ`-torsion, from a nontorsion Euler-system Iwasawa class under the
rational Iwasawa and tower hypotheses. Prove the integral divisibility
`lambdaIndex(c)⊆char_Λ(X∞)` under the integral Iwasawa and tower
hypotheses. Under only the rational hypothesis prove
`p^t lambdaIndex(c)⊆char_Λ(X∞)` for some `t≥0`. These results hold
for every `d≥1` and every prime, including 2. Adopt characteristic
ideal zero for nontorsion modules; a torsion initial class has zero
index and does not force a nontorsion dual. Give height-one length,
scalar-twist and singular-localization consequences, with the
involution on Pontryagin duals explicit.
(**RUBIN-ES**, II Theorems 3.2–3.4 and Proposition 3.7, pp.28–29,
VII §§1–7, pp.97–121.)

**Checks.**

- A rank-one lattice satisfies the Iwasawa hypothesis with `τ=1`.
  A representation becoming trivial of rank two on `G_(K∞)` fails its
  irreducibility clause, even if its action over `G_K` is irreducible.
- A zero Iwasawa class has index zero; if `X∞=0`, its characteristic
  ideal is the unit ideal, and the zero-index inclusion still holds.
- On `H=Λ`, the index of `f` is `(f)`, so replacing the system by
  `p c` weakens the divisibility by exactly the factor `p`.
- `K=ℚ` satisfies the tower hypothesis. A mixed-signature cubic
  field with scalar cyclotomic action in a `ℤ_p`-extension need not.
- Rational coinvariant dimension one does not remove a `p`-power
  error; the integral free-coinvariant hypothesis is needed for that.
- When `d≥2`, pseudo-null modules need not be finite. Their
  characteristic ideal is still the unit ideal, as the height-one test requires.

*Needs:* §§F.1–F.7; IntegralIwasawaTheory §2.0;
PadicMeasuresIwasawaAlgebras §§4.2, 4.4, 4.6 and 5.2.

<a id="finite-stickelberger-and-class-number-comparisons"></a>
### F.9 Finite Stickelberger annihilation and class-number products

For every `m≥2`, use `G_m=(ℤ/mℤ)ˣ` and the covariant action
`σ_a(ζ_m)=ζ_m^a`. Define the rational element
`θ⁰_m=Σ_(a∈G_m)(a₀/m)[a⁻¹]`, the denominator ideal
`J_m={x∈ℤ[G_m] : xθ⁰_m∈ℤ[G_m]}` and its integral image
`I_m={xθ⁰_m : x∈J_m}` inside `ℚ[G_m]`. The latter is the
intersection of integral multiples of `θ` with `ℤ[G_m]`.
Prove coefficient, conjugation, augmentation, ideal-membership and
integral-image APIs, and the generation of `J_m` by `b−[b]` for all
positive integers `b` prime to `m`. Define positive smoothing by the
coefficients `floor(b a₀/m)` at `[a⁻¹]` and prove
`smoothedStickelberger_cast=(b−[b])θ⁰_m`.
(**SHARIFI-IWASAWA**, Definition 4.5.1 and Lemma 4.5.2, pp.113–114.)

Prove `gaussSum_smoothed_descent`: for a prime `𝔩` above a rational
prime `ℓ≡1 mod m`, choose the inverse residue character compatible
with `𝔩` and the chosen primitive root. For `x∈J_m`, its native
Gauss sum satisfies `g^x∈ℚ(μ_m)ˣ` and `(g^x)=𝔩^(xθ⁰_m)`.
Extend the `σ_a` to fix `ζ_ℓ`, and prove that the denominator-ideal
condition kills the inertia root-of-unity factor. Give independence
under simultaneous root/character/prime transport and multiplicativity
in `x`. Apply the supplied Gauss-power factorization, then Hilbert
class fields and Chebotarev to represent every class by such a split
prime. Deduce `stickelberger_smoothing_annihilates` and the stronger
`stickelbergerIdeal_annihilates` for the full class group at every
conductor, transported to any cyclotomic field model. The explicit
positive-smoothing statement is in `Suggested.lean`.
(**SHARIFI-IWASAWA**, Lemma 4.5.4 and Theorem 4.5.6, pp.115–117.)

For odd `p`, prove `cyclotomicClassEigenspace_one_eq_zero` for the
Teichmüller component of the `p`-class group of `ℚ(μ_p)`: take smoothing
`b=1+p`, whose `χ`-value is `p B_(1,ω⁻¹)`, and prove this scalar is
a `p`-adic unit. Indeed `p B_(1,ω⁻¹)≡p−1≡−1 mod p`.
Integral annihilation then kills this component. No nonintegral
Bernoulli scalar is made to act on a finite module.
(**SHARIFI-IWASAWA**, §4.5, Theorem 4.5.7, p.117.)

Use native class numbers, regulators, roots of unity and the CM Hasse
index `Q_F=[E_F:μ(F)E_(F⁺)]`. Prove for every abelian CM field
`relativeClassNumber_character_product`:
`h(F)/h(F⁺)=Q_F w_F ∏_(χ odd)(−B_(1,χ)/2)`.
Prove `realClassNumber_log_product` for its real subfield:
`h(F⁺)R(F⁺)=∏_(χ≠1 even)(−½Σ_(a=1)^(fχ)χ(a)log|1−exp(2πia/fχ)|)`.
Characters are taken at primitive conductors. The ratio is initially
a positive rational number; its prime-power cyclotomic integrality is
proved from norm surjectivity. Derive the products from native
Dedekind-zeta residues, the Euler-product factorization into primitive
Dirichlet functions, ClassFieldTheory's conductor–discriminant formula,
and the signed Gauss-product and logarithmic comparisons. Prove the
Gauss product with its phase `∏χ τ(χ)=i^(r₂(F))√|D_F|`: pair inverse
characters and evaluate the remaining primitive quadratic Gauss sums,
including discriminants `−4` and `±8`. Use the weighted complex-place
regulator; for prime-power CM fields its Hasse index is one.
(**SHARIFI-IWASAWA**, Proposition 4.1.21, pp.100–101, Proposition
4.2.13, Theorem 4.2.14, Lemma 4.2.17 and Theorem 4.2.20, pp.103–108.)

**Checks.**

- At `m=5`, `θ` has coefficients `2/5` at `[3]` and `3/5` at `[2]`.
  Positive smoothing by 2 has coefficients 0 and 1 at these indices.
- At `m=2`, `J_m=2ℤ` and `I_m=ℤ`. The denominator and image ideals
  are different. At `b=1+m`, smoothing is `mθ⁰_m`, not zero.
- At `m=3`, `1∉J_m` while `(2[2]−1)θ⁰_m=1`, so `I_m` is the
  unit ideal. This distinguishes multiplication by integral elements
  from taking all rational multiples before intersection.
- At `m=5`, augmentation of `θ` is 2, and every nontrivial even-character
  evaluation is zero. An inverse-basis error is detected by the unequal
  coefficients in the first Check.
- A Gauss sum need not lie in `ℚ(μ_m)`; its mth power and the
  denominator-ideal exponents descend. The trivial exponent gives 1.
- At `m=5,ℓ=11`, a choice `ζ₅ mod 𝔩=3` is compatible with residue
  generator 2 because `2⁻²=3`. Replacing only that generator by 8 gives
  `8⁻²=5`, and fails the root/character compatibility condition.
- Simultaneously reindexing the root, residue character and chosen prime
  transports the same Gauss ideal. Changing only the root changes the
  indexed ideal factors.
- The exceptional exponent-one and inverse-Teichmüller components are
  different at `p=5`; the unit smoothing above kills the first.
- For `ℚ(ζ₃)`, `B_(1,χ)=−1/3`, `w=6`, `Q=1` give ratio 1.
  For `ℚ(i)`, `w=4` and the odd Bernoulli value give ratio 1.
- For `ℚ(ζ₈)`, `Q=1` and `R_F=2R_(F⁺)`; using unweighted complex
  logarithms loses this factor. At conductor two the field is rational,
  so the degree-two CM formula does not apply.

*Needs:* ClassicalArithmeticCompletion §§1.47 and 1.55;
ClassFieldTheory Layer 13; Chebotarev Layer 10; Mathlib class groups,
CM units, Dirichlet functions and Dedekind-zeta residues; §F.10 for the
finite logarithmic value comparison; IntegralIwasawaTheory §1.5 for
the real regulator normalization.

<a id="dirichlet-values-and-branches"></a>
### F.10 Logarithmic values and analytic branch comparisons

Use IntegralIwasawaTheory §5.0's canonical Kubota–Leopoldt
pseudomeasure and its §6.3 Bernoulli normalization. No second
arithmetic measure is defined. Its integral smoothing denominator is
`δ_a−δ_1` after the inverse-weighted restriction to units. The branch
corresponding to a finite character `ην` satisfies, for `k≥1`,
`L_p(ην,1−k)=(1−ψ(p)p^(k−1))L(ψ,1−k)`, where `ψ` is the primitive
character inducing `ηνω^(−k)`; imprimitive presentations retain their
extra Euler deletions. Consume this interpolation, smoothing
independence, principal pole and residue from IntegralIwasawaTheory
§§5.0, 5.3 and 6.3. The complex Bernoulli identity is
`L(ψ,1−k)=−B_(k,ψ)/k`, with its primitive-character convention.
Give the evaluation comparison, coefficient-embedding and conductor
APIs for this same object. (**RJW-PADIC-L**, §§4–5, pp.26–35, and §7, pp.40–43.)

For nontrivial primitive complex `θ` of conductor `f>1`, prove
`dirichletValue_one_log`:
`L(θ,1)=−τ(θ⁻¹)⁻¹Σ_a θ⁻¹(a)Log(1−exp(2πia/f))`, using the positive
Gauss sum and principal logarithm and omitting zero-character terms.
For even `θ` pair conjugate roots to replace `Log` by `log|·|`.
For odd `θ` use the phase difference `2πi(a/f−1/2)` to obtain
`L(θ,1)=−πi B_(1,θ⁻¹)/τ(θ⁻¹)`. Prove root-change covariance,
inverse-character normalization and nonvanishing of the Bernoulli
factor from native `L(θ,1)≠0`. For every primitive nontrivial `θ` at
every prime, including conductor `p` and conductor 4 at 2, prove
`leopoldt_value_one` for the canonical `p`-adic branch:
`L_p(θ,1)=−(1−θ(p)/p)τ(θ⁻¹)⁻¹Σ_a θ⁻¹(a)log_p(1−ζ_f^a)`.
For odd `θ` both sides are zero. At wild conductor the Fourier trace
cancels, rather than producing an artificial `p`-Euler factor.
(**RJW-PADIC-L**, Theorem 6.1 and proof, pp.35–39.)

Use Mathlib's `NormedSpace.log` on principal units, with convergence,
continuity and deep-unit injectivity supplied by Tau Ceti as specified
in the exact contracts. Extend it to the normalized Iwasawa logarithm
with `log_p p=0` on the finite local extensions in use, and prove the
branch comparison, homomorphism and coefficient-extension laws and the
inverse exponential on the strict small disc. On `ℚ_pˣ` identify its
kernel as `p^ℤ×μ_(p−1)` for odd `p` and `2^ℤ×{±1}` at 2.
The algebraic-number kernel and independence statements are supplied
by IntegralIwasawaTheory §§4.1–4.2. Prove the Bernoulli limit
`B_(w_r)→1−p⁻¹`, `w_r=2(p−1)p^r`, by the moment and logarithm
estimates of the canonical measure. The Euler-deleted sequence has
the same limit. (**RJW-PADIC-L**, §7, Theorem 7.1 and
Lemmas 7.2–7.5, pp.40–43; **RUBIN-ES**, `D` §1, pp.163–166.)

**Checks.**

- At `s=0` the primitive interpolation character is `ηνω⁻¹`; at
  `s=−1` it is `ηνω⁻²`. A fixed character for all `k` is incorrect.
- For the odd quadratic character modulo 3, `τ=i√3` and the
  principal phase gives `L(1,θ)=π/(3√3)>0`. Taking only real logs
  gives zero and loses this value.
- If `p|f`, `θ(p)=0` and the Euler factor is 1. If `p∤f`,
  `θ(p)` is a root of unity and `1−θ(p)/p≠0` by valuation.
- The principal branch has residue `1−p⁻¹` at 1; it has no value
  there obtained by totalized division. The cleared numerator is
  integral at odd `p`, and its half is the integral normalization at 2.
- `log₂(−1)=0` although `−1` is a nontrivial principal unit.
  The first two terms of `log₂ 3` cancel, giving valuation 2.

*Needs:* IntegralIwasawaTheory §§4.1–4.2, 5.0, 5.3, 6.3;
PadicMeasuresIwasawaAlgebras §§1–3; native Dirichlet functions and
finite Fourier sums; LocalFieldsRamification Layers 0–2.

<a id="gamma-gauss-and-exceptional-derivative"></a>
### F.11 Gamma–Gauss comparison and the exceptional derivative

Construct Morita's signed `Γ_p:ℤ_p→ℤ_pˣ` as the continuous extension
of `Γ_p(n)=(−1)^n∏_(1≤j<n,p∤j)j`, at every prime. Give its recurrence,
unit values, continuity, coefficient embeddings and local analytic
expressions, including the dyadic small disc. For `q=p^f`, `f≥1`,
choose the actual unramified degree-`f` field, its Teichmüller lift `ω`,
a primitive pth root `ζ` and `π^(p−1)=−p` with
`π≡ζ−1 mod (ζ−1)²`. Define the negative finite-field Gauss sum
`g_q(a)=−Σ_(x∈𝔽_qˣ)ω(x)^(−a)ζ^(Tr x)`, `0≤a<q−1`.
Prove `grossKoblitz_formula`:
`g_q(a)=π^(S_p(a))∏_(j=0)^(f−1)Γ_p(a_j/(q−1))`, where `a_j`
is the least residue of `p^j a mod q−1`.
Its API includes character and root transport, valuation, leading
factorial residue and comparison with the positive Gauss convention.
Prove the analytic prerequisites: normalized factorial-quotient limits,
the Dwork coefficient identity, the convergent Frobenius telescope,
and the splitting-function trace-character identity at Teichmüller
points, with its convergence estimates. At 2 retain the estimate
`k/2−S₂(k)≥−1/2` and its exceptional minima `k=1`,3.
(**MORITA-1975**, Theorem 1 and §§3–4, pp.255–266;
**GROSS-KOBLITZ-1979**, Theorem 1.7, p.571, Lemma 2.11, p.575;
**ROBERT-2001**, Theorems 1–4, pp.160–168, appendices, p.169.)

For a primitive odd `χ` of conductor `N>1` prime to `p`, define
`ferreroGreenbergGammaSum(χ)=Σ_(0≤a<N)χ(a)log_p Γ_p(a/N)`.
Prove finite-sum, coefficient-map, conjugation and zero-term APIs and
identify the derivative of §F.10's actual branch:
`L_p′(χω,0)=ferreroGreenbergGammaSum(χ)+(1−χ(p))B_(1,χ)log_p N`.
Its value is `L_p(χω,0)=−(1−χ(p))B_(1,χ)`.
Differentiate the measure integral on its convergence disc, prove the
residue-permutation and Gamma-antidifference limits, and compare them
with this finite sum. If `χ(p)=1`, group into Frobenius orbits and
apply Gross–Koblitz to identify the sum with the Gauss-product
logarithms, retaining the orbit lengths and the matching Gauss sign.
The arithmetic nonvanishing of that projected logarithm is proved in
§4.18 and its odd-prime counterpart in §4.21; it is not deduced from
the nonzero values of the individual Gamma units.
(**GROSS-DASGUPTA-2022**, §2, pp.3–5; **ZHAO-2022**,
Theorem 4.1 and equations (4.5)–(4.6), pp.470–473.)

**Checks.**

- `Γ_p(0)=1`, whereas `Γ_p(1)=−1`; a constant unit function fails.
- `Γ_p(2)=1` at every prime. At 2, `Γ₂(3)=−1`, since the even factor
  2 is omitted; the ordinary factorial would give `−2`, which is not a unit.
- The recurrence at a `p`-divisible argument has multiplier `−1`, whereas
  at a unit argument it has multiplier `−x`; these cannot be conflated.
- The trivial finite-field character has negative Gauss sum 1.
  With `a=0`, the Gamma product is 1 as well. At `p=2`, `π=−2`.
- On a nontrivial character over `𝔽_(p²)`, the Gauss-product
  magnitude involves `p²`, not `p`; the two Gamma orbit factors remain.
- For `χ(p)=1`, the conductor-`log` correction is zero. For `χ(p)≠1`
  it remains with the displayed positive Bernoulli sign.
- For the odd quadratic character modulo 3, the finite Gamma-`log` sum is
  `A(1)−A(2)`, not its negative or one third of it.
- For a quartic character modulo 5 with `χ(2)=i`, its finite Gamma-`log`
  sum is `A(1)+iA(2)−iA(3)−A(4)`. Inverting `χ` or dividing by `N`
  fails this test, though a quadratic character would not detect inversion.
- A zero projected logarithm gives zero derivative; a simple-zero
  conclusion requires the separate nonvanishing argument.

*Needs:* §F.10; ClassicalArithmeticCompletion §§1.47 and 1.55;
LocalFieldsRamification Layers 0–2; native finite fields, power series,
convergent scalar series and Teichmüller lifts.

### Examples

The identity `(σ−1)(σ+2σ²)=3−(1+σ+σ²)` and the quotient
`(1−X)/(X−1)=−1` fix both derivative and finite–singular signs.
At conductor two, the smoothing multiplier 2 takes `θ⁰_2=1/2`
to 1, whereas its denominator ideal is `2ℤ`. At the exceptional
analytic zero the conductor-`log` correction vanishes exactly when
`χ(p)=1`; simplicity still needs the actual Gauss-`log` projection.

### Dependencies

ClassFieldTheory Layers 5–7 and 11–13; ProfiniteCohomology Layers 0–12;
EllipticCurves Layer 7; LocalFieldsRamification Layers 0–2;
LocalGaloisGroups Layer 0; Chebotarev Layer 10;
ClassicalArithmeticCompletion §§1.47 and 1.55;
IntegralIwasawaTheory §§1.5, 2.0, 4.1–4.2, 5.0, 5.3 and 6.3;
PadicMeasuresIwasawaAlgebras Layers 1–5; the native Mathlib arithmetic,
cohomology and scalar analysis used in the individual targets.
In §F.3 first define the polynomials, then construct §F.4's ray fields
and prime sets before completing the conductor presentations. Build §F.10
before §F.9's class-number products; its finite annihilation
argument is independent of those products.

## Layer 0: Euler systems and their normalization

Construct `c̃_m=N_(mp/m)(1−ζ_mp)` and its real norm, including conductor 1.
The elementary degree calculation fixes both Frobenius direction and the
sign in the `ζ−1` convention. Character twisting then produces the actual
classes used in descent. The unsmoothed and Stickelberger families retain
their distinct coefficient representations and norm polynomials.

<a id="minpoly-step-of-dvd"></a>
### 0.1 Minimal polynomial of a cyclotomic step when `ℓ` divides `m`
Prove `minpoly_step_of_dvd` with the following hypotheses and normalization.

Let `ℓ` be prime with `ℓ ∣ m`, `K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ})`, `ζ ∈ L` a primitive `mℓ`-th root of unity and `η = ζ^ℓ ∈ K`. Then the minimal polynomial of `ζ` over `K` is `X^ℓ − η`.

`ℓ` is prime and `m ≥ 1`; `K` and `L` are cyclotomic over `ℚ` of conductors `m` and `mℓ` (Mathlib's `IsCyclotomicExtension {m} ℚ K` and `{mℓ} ℚ L`), with `L` a `K`-algebra.

`ζ ∈ L` is a primitive `mℓ`-th root of unity and `η ∈ K` satisfies `η = ζ^ℓ` in `L`, so `η` is a primitive `m`-th root; this is the compatibility `ζ_{mℓ}^ℓ = ζ_m` that Rubin fixes before (2).

`ℓ ∣ m`.

Prove this as follows.

1. `[L : ℚ] = φ(mℓ) = ℓ·φ(m)` because `ℓ ∣ m` (`Nat.totient_mul_of_prime_of_dvd`), and `[K : ℚ] = φ(m)`; both from `IsCyclotomicExtension.finrank` with the irreducibility of the rational cyclotomic polynomials.
2. By the tower law (`Module.finrank_mul_finrank`), `[L : K] = ℓ`. `L` is generated over `ℚ`, hence over `K`, by `ζ`, so `deg minpoly_K(ζ) = ℓ` (`IntermediateField.adjoin.finrank`).
3. `ζ` is a root of the monic degree-`ℓ` polynomial `X^ℓ − η ∈ K[X]`, so `minpoly_K(ζ)` divides it (`minpoly.dvd`); both are monic of degree `ℓ`, so they are equal.

**Checks.**

- `m = 2`, `ℓ = 2`: the minimal polynomial of `i` over `ℚ` is `X² + 1 = X² − ζ₂`.
- `m = p^{n−1}`, `ℓ = p`, `n ≥ 2`: this is RJW's `X^p − ξ_{p^{n−1}}` in the proof of Lemma 10.3.

See **RJW-PADIC-L**, §10.2, proof of Lemma 10.3, printed p. 48 (arXiv v2). The local version of the step `m = p^{n−1}`, `ℓ = p`. **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The first case of (2) rests on this minimal polynomial.

*Needs:* `IsCyclotomicExtension.finrank`; `Polynomial.cyclotomic.irreducible_rat`; `Nat.totient_mul_of_prime_of_dvd`; `Module.finrank_mul_finrank`; `IntermediateField.adjoin.finrank`; `minpoly.dvd`.

<a id="minpoly-step-of-not-dvd"></a>
### 0.2 Minimal polynomial of a cyclotomic step when `ℓ` does not divide `m`
Prove `minpoly_step_of_not_dvd` with the following hypotheses and normalization.

Let `ℓ` be prime with `ℓ ∤ m`, and let `ℓ'` satisfy `ℓℓ' ≡ 1 (mod m)`. With `K`, `L`, `ζ`, `η` as before, `η^{ℓ'} ∈ K` is a root of `X^ℓ − η`, and `minpoly_K(ζ)·(X − η^{ℓ'}) = X^ℓ − η`. So the conjugates of `ζ` over `K` are the `ℓ`-th roots of `η` other than `η^{ℓ'}`, the unique one of order dividing `m`.

`ℓ` is prime and `m ≥ 1`; `K` and `L` are cyclotomic over `ℚ` of conductors `m` and `mℓ` (Mathlib's `IsCyclotomicExtension {m} ℚ K` and `{mℓ} ℚ L`), with `L` a `K`-algebra.

`ζ ∈ L` is a primitive `mℓ`-th root of unity and `η ∈ K` satisfies `η = ζ^ℓ` in `L`, so `η` is a primitive `m`-th root; this is the compatibility `ζ_{mℓ}^ℓ = ζ_m` that Rubin fixes before (2).

`ℓ ∤ m` and `ℓℓ' ≡ 1 (mod m)`; for `m = 1` every `ℓ'` works and `η = 1`.

Prove this as follows.

1. `[L : ℚ] = φ(m)(ℓ − 1)` (`Nat.totient_mul` for coprime `m`, `ℓ`, and `φ(ℓ) = ℓ − 1`), so `[L : K] = ℓ − 1` by the tower law.
2. `(η^{ℓ'})^ℓ = η^{ℓℓ'} = η` because `η^m = 1`, so `X − η^{ℓ'}` divides `X^ℓ − η` in `K[X]`; the quotient `g` is monic of degree `ℓ − 1`.
3. `ζ ≠ η^{ℓ'}` since `ζ` has order `mℓ` and `η^{ℓ'}` has order dividing `m`, so `g(ζ) = 0`; hence `minpoly_K(ζ)` divides `g`, and equality follows from the degrees.

**Checks.**

- `m = 3`, `ℓ = 2`: `L = ℚ(μ_6) = K`, and `minpoly` is `X − ζ_6` with `ζ_6 = −ζ_3²` (the other root of `X² − ζ_3` is `ζ_3²`, the one of order 3).

See **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The second case of (2) rests on this minimal polynomial.

*Needs:* `IsCyclotomicExtension.finrank`; `Polynomial.cyclotomic.irreducible_rat`; `Nat.totient_mul`; `Module.finrank_mul_finrank`; `IntermediateField.adjoin.finrank`; `minpoly.dvd`.

<a id="distribution-relation-of-dvd"></a>
### 0.3 Distribution relation, `ℓ` dividing `m`
Prove `norm_one_sub_of_dvd` with the following hypotheses and normalization.

With `K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ})`, `ζ = ζ_{mℓ}`, `η = ζ^ℓ = ζ_m` and `ℓ ∣ m`: `N_{L/K}(1 − ζ) = 1 − η`.

`ℓ` is prime and `m ≥ 1`; `K` and `L` are cyclotomic over `ℚ` of conductors `m` and `mℓ` (Mathlib's `IsCyclotomicExtension {m} ℚ K` and `{mℓ} ℚ L`), with `L` a `K`-algebra.

`ζ ∈ L` is a primitive `mℓ`-th root of unity and `η ∈ K` satisfies `η = ζ^ℓ` in `L`, so `η` is a primitive `m`-th root; this is the compatibility `ζ_{mℓ}^ℓ = ζ_m` that Rubin fixes before (2).

`ℓ ∣ m`.

The `1 − ζ` convention; Rubin's `ζ − 1` form differs by `(−1)^ℓ` (§0.6).

Prove this as follows.

1. `L/K` is Galois (cyclotomic), so `N_{L/K}(1 − ζ) = ∏_{σ ∈ Gal(L/K)} (1 − σζ)` (`Algebra.norm_eq_prod_automorphisms`).
2. The `σζ` are the roots of `minpoly_K(ζ) = X^ℓ − η`, each once, so the product is the value of `X^ℓ − η` at `X = 1`, namely `1 − η`.

**Checks.**

- `m = 2`, `ℓ = 2`: `N_{ℚ(i)/ℚ}(1 − i) = (1 − i)(1 + i) = 2 = 1 − ζ_2`.

See **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). First case of (2), in the `1 − ζ` convention. **RJW-PADIC-L**, §10.2, proof of Lemma 10.3, printed p. 48 (arXiv v2). The same computation for `ℓ = p`, `m = p^{n−1}`.

*Needs:* [§0.1](#minpoly-step-of-dvd); `Algebra.norm_eq_prod_automorphisms`.

<a id="distribution-relation-of-not-dvd"></a>
### 0.4 Distribution relation, `ℓ` not dividing `m`
Prove `norm_one_sub_mul_of_not_dvd` with the following hypotheses and normalization.

With `K = ℚ(μ_m) ⊆ L = ℚ(μ_{mℓ})`, `ζ = ζ_{mℓ}`, `η = ζ_m`, `ℓ ∤ m` and `ℓℓ' ≡ 1 (mod m)`: `N_{L/K}(1 − ζ)·(1 − η^{ℓ'}) = 1 − η`. For `m > 1` both factors are nonzero, so `N_{L/K}(1 − ζ_{mℓ}) = (1 − ζ_m)^{1 − Fr_ℓ^{−1}}`, `Fr_ℓ^{−1}` acting by `ζ_m ↦ ζ_m^{ℓ'}`.

`ℓ` is prime and `m ≥ 1`; `K` and `L` are cyclotomic over `ℚ` of conductors `m` and `mℓ` (Mathlib's `IsCyclotomicExtension {m} ℚ K` and `{mℓ} ℚ L`), with `L` a `K`-algebra.

`ζ ∈ L` is a primitive `mℓ`-th root of unity and `η ∈ K` satisfies `η = ζ^ℓ` in `L`, so `η` is a primitive `m`-th root; this is the compatibility `ζ_{mℓ}^ℓ = ζ_m` that Rubin fixes before (2).

`ℓ ∤ m` and `ℓℓ' ≡ 1 (mod m)`.

For `m = 1` the identity reads `0 = 0`; the conductor-one value is §0.7.

Prove this as follows.

1. `N_{L/K}(1 − ζ) = ∏_σ (1 − σζ)` (`Algebra.norm_eq_prod_automorphisms`), and the `σζ` are the roots of `minpoly_K(ζ)`.
2. Evaluate `minpoly_K(ζ)·(X − η^{ℓ'}) = X^ℓ − η` (§0.2) at `X = 1`.

**Checks.**

- `m = 3`, `ℓ = 2`: `N(1 − ζ_6) = 1 − ζ_6 = −ζ_3 = (1 − ζ_3)/(1 − ζ_3²)`.
- The relation holds for every prime `ℓ`, including `ℓ = 2`, with no sign; the `ζ − 1` form of Rubin's (2) fails at `ℓ = 2`.

See **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). Second case of (2), in the `1 − ζ` convention.

*Needs:* [§0.2](#minpoly-step-of-not-dvd); `Algebra.norm_eq_prod_automorphisms`.

<a id="distribution-relation-frobenius"></a>
### 0.5 Distribution relation with the arithmetic Frobenius
Prove `norm_one_sub_mul_frobenius` with the following hypotheses and normalization.

Let `σ ∈ Gal(ℚ(μ_m)/ℚ)` be the inverse of the arithmetic Frobenius `Fr_ℓ (ζ_m ↦ ζ_m^ℓ)`, that is the image of `ℓ^{−1} ∈ (ℤ/m)^×` under Mathlib's autEquivPow. For `ℓ ∤ m`, `N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(1 − ζ_{mℓ})·σ(1 − ζ_m) = 1 − ζ_m`.

`ℓ` is prime and `m ≥ 1`; `K` and `L` are cyclotomic over `ℚ` of conductors `m` and `mℓ` (Mathlib's `IsCyclotomicExtension {m} ℚ K` and `{mℓ} ℚ L`), with `L` a `K`-algebra.

`ζ ∈ L` is a primitive `mℓ`-th root of unity and `η ∈ K` satisfies `η = ζ^ℓ` in `L`, so `η` is a primitive `m`-th root; this is the compatibility `ζ_{mℓ}^ℓ = ζ_m` that Rubin fixes before (2).

`ℓ` is coprime to `m`.

Prove this as follows.

1. `σ(ζ_m) = ζ_m^{ℓ'}` for any `ℓ' ≡ ℓ^{−1} (mod m)`, by the defining property of autEquivPow.
2. Substitute into §0.4.

**Checks.**

- `Fr_ℓ` is the arithmetic Frobenius, as in Rubin and in RJW Definition 10.16 (`σ_ℓ` the image of `Frob_ℓ`); the Euler factor involves `Fr_ℓ^{−1}`.

For `m=7` and `ℓ=2`, choose `ζ₁₄=−ζ₇⁴`. The relative extension has degree one, so `N(1−ζ₁₄)=1+ζ₇⁴`. Arithmetic `Fr₂` sends `ζ₇` to `ζ₇²`, hence its inverse sends `ζ₇` to `ζ₇⁴`, and `(1+ζ₇⁴)(1−ζ₇⁴)=1−ζ₇`. Using `1−ζ₇²` instead gives a different value: the difference is `(1+ζ₇⁴)(ζ₇⁴−ζ₇²)≠0`. This detects inversion, which the conductor-3 involution cannot.

See **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The exponent `1 − Fr_ℓ^{−1}` of (2).

*Needs:* [§0.4](#distribution-relation-of-not-dvd); `IsCyclotomicExtension.autEquivPow`; `ZMod.unitOfCoprime`.

<a id="distribution-relation-rubin-convention"></a>
### 0.6 The `ζ − 1` convention and its sign
Prove `norm_sub_one_eq_neg_one_pow_mul` with the following hypotheses and normalization.

For any finite field extension `L/K` and `ζ ∈ L`, `N_{L/K}(ζ − 1) = (−1)^{[L:K]} N_{L/K}(1 − ζ)`. Hence, for the cyclotomic step, `N(ζ_{mℓ} − 1) = (−1)^{ℓ+1}(ζ_m − 1)` if `ℓ ∣ m` and `N(ζ_{mℓ} − 1) = (−1)^{ℓ−1}(ζ_m − 1)^{1 − Fr_ℓ^{−1}}` if `ℓ ∤ m`, `m > 1`. For odd `ℓ` these are Rubin's formulas (2); for `ℓ = 2` his first two cases need the sign `−1`.

`[L : K] = ℓ` when `ℓ ∣ m` and `ℓ − 1` when `ℓ ∤ m` (the two minimal-polynomial calculations).

Prove this as follows.

1. `N` is multiplicative and `N_{L/K}(−1) = (−1)^{[L:K]}` (the norm of an element of `K` is its `[L:K]`-th power, `Algebra.norm_algebraMap`).
2. Combine with §0.3 and §0.4.

**Checks.**

- Counterexample to the printed (2) at `ℓ = 2`: `N_{ℚ(i)/ℚ}(i − 1) = 2` while `ζ_2 − 1 = −2`.
- Second counterexample: `ℓ = 2`, `m = 3` gives `ζ_6 − 1 = ζ_3` while `(ζ_3 − 1)^{1 − Fr_2^{−1}} = −ζ_3`.

See **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). The printed formula, corrected at `ℓ = 2`.

*Needs:* `Algebra.norm_algebraMap`; [§0.3](#distribution-relation-of-dvd); [§0.4](#distribution-relation-of-not-dvd).

<a id="distribution-relation-conductor-one"></a>
### 0.7 Distribution relation at conductor one
Prove `norm_one_sub_of_prime` with the following hypotheses and normalization.

For every prime `ℓ` and primitive `ℓ`-th root `ζ_ℓ`, `N_{ℚ(μ_ℓ)/ℚ}(1 − ζ_ℓ) = ℓ`; equivalently `N(ζ_ℓ − 1) = (−1)^{ℓ−1}ℓ`, Rubin's third case.

`ℓ` prime, including `ℓ = 2` where `ℚ(μ_2) = ℚ` and `ζ_2 = −1`.

Prove this as follows.

1. For `ℓ` odd, `N(ζ − 1) = Φ_ℓ(1) = ℓ` (`IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic` with `2 < ℓ`, and `Polynomial.eval_one_cyclotomic_prime`), and `N(1 − ζ) = (−1)^{ℓ−1}N(ζ − 1) = ℓ` (§0.6).
2. For `ℓ = 2`, `1 − ζ_2 = 2 ∈ ℚ`.

**Checks.**

- `ℓ = 3`: `(1 − ζ_3)(1 − ζ_3²) = 3`.
- `ℓ = 2`: the value is 2, and `N(ζ_2 − 1) = −2 = (−1)^{1}·2`.

See **RUBIN-ES**, Chapter III, §2.1, display (2), printed p. 34 (PDF p. 44). Third case of (2).

*Needs:* `IsPrimitiveRoot.sub_one_norm_eq_eval_cyclotomic`; `Polynomial.eval_one_cyclotomic_prime`; [§0.6](#distribution-relation-rubin-convention).

<a id="p-extended-cyclotomic-number"></a>
### 0.8 The `p`-extended cyclotomic numbers `c̃_m`
Fix a prime `p` and the compatible roots `ζ_m` with the tower `ℚ(μ_m)` (IntegralIwasawaTheory §1.1). For `m ≥ 1` put `c̃_m = N_{ℚ(μ_{mp})/ℚ(μ_m)}(1 − ζ_{mp}) ∈ ℚ(μ_m)^×`. This is Rubin's `c̃_{m∞}` in the `1 − ζ` convention: Rubin's element `N(ζ_{mp} − 1)` equals `(−1)^{[ℚ(μ_{mp}):ℚ(μ_m)]}c̃_m`.

`p` prime; `m ≥ 1`. No coprimality between `m` and `p` is assumed.

The extra norm from level `mp` is what makes the family norm-compatible in the `p`-direction (Rubin, Remark 2.1); it loses information when `p ∤ m`.

Prove this as follows.

1. Definition as a relative norm.
2. API: `c̃_m = 1 − ζ_m` if `p ∣ m` (§0.3 with `ℓ = p`); `c̃_1 = p` (§0.7); `c̃_m ≠ 0` (`1 − ζ_{mp} ≠ 0` as `mp > 1`); the Rubin sign (§0.6).

The API consists of the following statements.

- `pCycNumber_of_dvd` (simp): If `p ∣ m` then `c̃_m = 1 − ζ_m`.
- `pCycNumber_one` (simp): `c̃_1 = p`.
- `pCycNumber_ne_zero` (other): `c̃_m ≠ 0` for `m ≥ 1`.
- `relNorm_zeta_sub_one_eq` (compatibility): Rubin's `c̃_{m∞} = N(ζ_{mp} − 1)` equals `(−1)^{[ℚ(μ_{mp}):ℚ(μ_m)]}c̃_m`; for `p` odd the sign is a `p`-adic unit of order 2 and is invisible in `H¹(ℚ(μ_m), ℤ_p(1))`.

These interfaces are used in Rubin, Chapter III §2.1: the Euler system for `ℤ_p(1)` is `{c̃_{m∞}, c̃_m}` via the Kummer map. Rubin, Chapter III (4) and (6): `c̃_f` and its norm give the twisted class `c_ℚ`. §F.3: the Euler-system module that receives these classes; §0.11 shows that the family is not torsion, although a single value such as `c̃_3=−ζ_3` at `p=5` is. Layer 1: the class `c_ℚ` fed to Rubin's Theorem II.2.2.

**Checks.**

- `pCycNumber_three_one` (value): For `p = 3`, `c̃_1 = 3`.
- `pCycNumber_five_three` (value): For `p = 5`, `c̃_3 = −ζ_3`: an individual `c̃_m` can be a root of unity.
- `pCycNumber_five_five` (value): For `p = 5`, `c̃_5 = 1 − ζ_5`.
- `rjw_ratio_torsion` (non-example): `(ζ^{−1} − 1)/(ζ − 1) = −ζ^{−1}` for every root of unity `ζ ≠ 1`: RJW's `c_m` is torsion. A root of unity is nonzero, and `ζ ≠ 1` makes the denominator nonzero. For a general field element both hypotheses are necessary: at `ζ=0` the quotient is 1, whereas `−ζ^{−1}=0`.
- The family is not torsion (§0.11), unlike RJW's `(ξ^{−1} − 1)/(ξ − 1) = −ξ^{−1}`.
- Individual `c̃_m` can be torsion: for `p = 5`, `c̃_3 = −ζ_3`.

See **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The definition of `c̃_{m∞}` and `c̃_m`. **RUBIN-ES**, Chapter III, Remark 2.1, printed p. 34 (PDF p. 44). The value for `p ∣ m` and the reason for the extra norm.

*Needs:* IntegralIwasawaTheory §1.1; IntegralIwasawaTheory §§0.2, 1.1; [§0.3](#distribution-relation-of-dvd); [§0.7](#distribution-relation-conductor-one); [§0.6](#distribution-relation-rubin-convention).

<a id="p-extended-tower-relation"></a>
### 0.9 Tower relation for `c̃`
For every `m ≥ 1`, `N_{ℚ(μ_{mp})/ℚ(μ_m)}(c̃_{mp}) = c̃_m`.

`m ≥ 1`, `p` prime.

Prove this as follows.

1. `c̃_{mp} = 1 − ζ_{mp}` since `p ∣ mp` (`pCycNumber_of_dvd`, from §0.3).
2. The left side is then `N(1 − ζ_{mp}) = c̃_m` by definition.

**Checks.**

- This is the Euler-system relation at `ℓ = p`, where no Euler factor enters (`N` is divisible by `p`).

See **RUBIN-ES**, Chapter III, Remark 2.1, printed p. 34 (PDF p. 44). The statement.

*Needs:* [§0.8](#p-extended-cyclotomic-number); [§0.3](#distribution-relation-of-dvd).

<a id="p-extended-auxiliary-relation"></a>
### 0.10 Auxiliary-prime relation for `c̃`
For a prime `ℓ ≠ p` and `m ≥ 1`: `N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(c̃_{mℓ}) = c̃_m^{1 − Fr_ℓ^{−1}}` if `ℓ ∤ m`, and `= c̃_m` if `ℓ ∣ m`. Here `Fr_ℓ ∈ Gal(ℚ(μ_m)/ℚ)`. The case `m = 1` is included (then `Fr_ℓ = 1` and the norm is 1).

`ℓ` prime, `ℓ ≠ p`; `m ≥ 1`.

The conductor-one exception of (2) never occurs, because `c̃` is a norm from level `mp > 1`.

Prove this as follows.

1. Norms are transitive in the square `ℚ(μ_m) ⊆ ℚ(μ_{mp})`, `ℚ(μ_{mℓ}) ⊆ ℚ(μ_{mℓp})` (`Algebra.norm_norm`), so the left side is `N_{ℚ(μ_{mp})/ℚ(μ_m)}(N_{ℚ(μ_{mℓp})/ℚ(μ_{mp})}(1 − ζ_{mℓp}))`.
2. Apply §0.3 `(ℓ ∣ mp)` or §0.5 `(ℓ ∤ mp)` at level `mp`.
3. The norm `N_{ℚ(μ_{mp})/ℚ(μ_m)}` commutes with every `σ∈Gal(ℚ(μ_{mℓp})/ℚ)`: it is the product of the `Gal(ℚ(μ_{mp})/ℚ(μ_m))`-conjugates (`Algebra.norm_eq_prod_automorphisms`), and `σ` commutes with each of them because the group is abelian. `Fr_ℓ` on `ℚ(μ_{mp})` restricts to `Fr_ℓ` on `ℚ(μ_m)`, because both act on the respective primitive roots by `ζ↦ζ^ℓ` (`IsCyclotomicExtension.autEquivPow` and the compatibility `ζ_{mp}^p=ζ_m`). No supplier statement is needed for these two elementary facts.

**Checks.**

- For `p=5`,`m=1`,`ℓ=2`, `c̃₂=1` and its norm is `1=5^{1−Fr₂⁻¹}`. For `p=2`,`m=1`,`ℓ=3`, `c̃₃=−ζ₃`, whose norm is `1=2^{1−Fr₃⁻¹}`. Both include the conductor-one boundary.

See **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The Euler-system relation with Euler polynomial `1 − x`.

*Needs:* [§0.8](#p-extended-cyclotomic-number); [§0.3](#distribution-relation-of-dvd); [§0.5](#distribution-relation-frobenius); `Algebra.norm_norm`; IntegralIwasawaTheory §§0.2, 1.1.

<a id="p-extended-nontorsion"></a>
### 0.11 The cyclotomic family is not torsion
`c̃_1 = p`, and for `k ≥ 1`, `c̃_{p^k} = 1 − ζ_{p^k}` with `N_{ℚ(μ_{p^k})/ℚ}(1 − ζ_{p^k}) = p`. Neither is of finite order, since roots of unity have norm `±1`.

`p` prime, `k ≥ 1`.

Prove this as follows.

1. `c̃_{p^k} = 1 − ζ_{p^k}` (`pCycNumber_of_dvd`).
2. Iterating §0.3 down the tower and using `Algebra.norm_norm`, `N_{ℚ(μ_{p^k})/ℚ(μ_p)}(1 − ζ_{p^k}) = 1 − ζ_p`; then §0.7 gives `p`.
3. A root of unity has norm a root of unity in `ℚ`, that is `±1 ≠ p`.

**Checks.**

- Contrast: RJW's `c_m = −ξ_m^{−1}` is a root of unity.

See **RJW-PADIC-L**, §10.5, printed p. 52 (arXiv v2). The torsion choice this target rules out.

*Needs:* [§0.8](#p-extended-cyclotomic-number); [§0.3](#distribution-relation-of-dvd); [§0.7](#distribution-relation-conductor-one); `Algebra.norm_norm`.

<a id="real-p-extended-number"></a>
### 0.12 The real cyclotomic numbers `c̃_m^+`
`c̃_m^+ = N_{ℚ(μ_m)/ℚ(μ_m)^+}(c̃_m) ∈ (ℚ(μ_m)^+)^×`, Rubin's `c̃_m`, attached to the ray class field modulo `m` (the real subfield) while `c̃_m` is attached to modulo `m∞`.

`m ≥ 1`; for `m ≤ 2`, `ℚ(μ_m)^+ = ℚ(μ_m) = ℚ` and `c̃_m^+ = c̃_m`.

The real norm has degree `e(m)=2` for `m>2` and `e(1)=e(2)=1`. At conductors 1 and 2 it is the identity, not multiplication by complex conjugation.

Prove this as follows.

1. Definition as a relative norm (real subfield and complex conjugation from IntegralIwasawaTheory §1.1).
2. For `m > 2`, `Gal(ℚ(μ_m)/ℚ(μ_m)^+) = {1, complex conjugation}`, so `c̃_m^+ = c̃_m·c̄̃_m`.

The API consists of the following statements.

- `pCycNumberReal_eq_mul_conj` (characterisation): For `m > 2`, `c̃_m^+ = c̃_m·conj(c̃_m)` in `ℂ`.
- `pCycNumberReal_of_le_two` (simp): For `m ≤ 2`, `c̃_m^+ = c̃_m`.
- `pCycNumberReal_ne_zero` (other): `c̃_m^+ ≠ 0`.

These interfaces are used in Rubin, Chapter III §2.1 and Remark II.1.3: the classes on the ray class fields modulo `m` (no archimedean place). Rubin, Chapter III (4): `c_ℚ` is the `χ`-twisted product of the `δc̃_f` over `Gal(ℚ(μ_f)^+/ℚ)`.

**Checks.**

- `pCycNumberReal_three_three` (value): For `p = 3`, `ℚ(μ_3)^+ = ℚ` and `c̃_3^+ = N(1 − ζ_3) = 3`.
- `pCycNumberReal_one` (degenerate): `c̃_1^+ = c̃_1 = p`.
- `pCycNumberReal_five_five` (value): For `p = 5`, `c̃_5^+ = (1 − ζ_5)(1 − ζ_5^{−1}) = 2 − ζ_5 − ζ_5^{−1} = (5 − √5)/2`, which is not `c̃_5`.
- `c̃_m^+` is real and, for `m > 2`, positive (`a` squared absolute value).

See **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The definition of `c̃_m`.

*Needs:* IntegralIwasawaTheory §1.1; [§0.8](#p-extended-cyclotomic-number).

<a id="real-relations"></a>
### 0.13 Relations for the real cyclotomic numbers
The family `c̃^+` satisfies the relations of `c̃`: `N_{ℚ(μ_{mp})^+/ℚ(μ_m)^+}(c̃_{mp}^+) = c̃_m^+`, and for a prime `ℓ ≠ p`, `N_{ℚ(μ_{mℓ})^+/ℚ(μ_m)^+}(c̃_{mℓ}^+) = (c̃_m^+)^{1 − Fr_ℓ^{−1}}` if `ℓ ∤ m` and `= c̃_m^+` if `ℓ ∣ m`. Moreover `N_{ℚ(μ_m)/ℚ(μ_m)^+}(c̃_m) = c̃_m^+` by definition, the relation between conductors `m∞` and `m`.

`m ≥ 1`; `ℓ ≠ p` prime.

Prove this as follows.

1. `N_{ℚ(μ_m)/ℚ(μ_m)^+}` commutes with the norms between levels, by transitivity in the square of real and full cyclotomic fields (`Algebra.norm_norm`), and with the Galois action.
2. Apply §0.9 and §0.10.

**Checks.**

- Both relations are proved simultaneously by the same commutation.

See **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The Euler-system relations for the whole collection `{c̃_{m∞}, c̃_m}`.

*Needs:* [§0.12](#real-p-extended-number); [§0.9](#p-extended-tower-relation); [§0.10](#p-extended-auxiliary-relation); `Algebra.norm_norm`.

<a id="smoothed-unit-comparison"></a>
### 0.14 Smoothed cyclotomic units and the smoothing divisor
Let `m ≥ 2` and `a ∈ ℕ` coprime to `m`. Then `c_m(a) = (1 − ζ_m^a)/(1 − ζ_m) = ∑_{i<a} ζ_m^i` is a unit of `ℤ[ζ_m]` and equals `σ_a(1 − ζ_m)/(1 − ζ_m)`. If `p ∣ m` it equals `σ_a(c̃_m)/c̃_m = c̃_m^{σ_a − 1}`; for `m = p^n` it is RJW's `c_n(a) = (ξ^a − 1)/(ξ − 1)`. The operator `σ_a − 1` is the image of the smoothing divisor `θ_a = δ_a − δ_1` (the denominator of §F.10) under the finite projection `Λ(ℤ_p^×) → ℤ_p[(ℤ/p^n)^×] ≅ ℤ_p[Gal(ℚ(μ_{p^n})/ℚ)]`, `δ_u ↦ σ_{u mod p^n}`. The smoothed family `{c̃_m^{σ_a − 1} : (m, a) = 1}` satisfies the relations of §0.9 and §0.10 for the primes `ℓ ∤` a.

`m ≥ 2` and `gcd(a, m) = 1`; a need not be prime to `p` for the unit statement, but the family indexed by all `m` requires the primes dividing a to be excluded, since `σ_a` is defined only on `ℚ(μ_m)` with `(a, m) = 1`.

The residue classes `a≡1` and `a≡−1 (mod m)` give the torsion elements 1 and `−ζ_m⁻¹`. Exclude these residue classes when asking for a non-torsion smoothing value; merely choosing an integer `a>1` does not exclude `a≡−1`.

Prove this as follows.

1. The quotient is the geometric sum, a unit by `IsPrimitiveRoot.geom_sum_isUnit`.
2. `σ_a(1 − ζ_m) = 1 − ζ_m^a` by definition of `σ_a` (IntegralIwasawaTheory §1.1); for `p ∣ m` use `pCycNumber_of_dvd`.
3. Under the finite projection (PadicMeasuresIwasawaAlgebras §1.1 (finite algebra projections of measures)) with the Dirac homomorphism (PadicMeasuresIwasawaAlgebras Layer 1 (Dirac monoid homomorphism)) and unit reduction (PadicMeasuresIwasawaAlgebras §1.3 (reduction of `p`-adic units)), `δ_a − δ_1` maps to `[a mod p^n] − [1]`, which acts as `σ_a − 1`.
4. `σ_a` commutes with the relative norms, so the relations transfer.

**Checks.**

- The signs of the `ζ − 1` and `1 − ζ` conventions cancel in the quotient.

See **RJW-PADIC-L**, §10.2, definition of `c_n(a)` and Lemma 10.3, printed p. 48 (arXiv v2). The smoothed units compared here.

*Needs:* [§0.8](#p-extended-cyclotomic-number); [§0.9](#p-extended-tower-relation); [§0.10](#p-extended-auxiliary-relation); `IsPrimitiveRoot.geom_sum_isUnit`; IntegralIwasawaTheory §1.2 (`cyclotomicRatio`); §F.10; PadicMeasuresIwasawaAlgebras §1.1 (finite algebra projections of measures); PadicMeasuresIwasawaAlgebras Layer 1 (Dirac monoid homomorphism); PadicMeasuresIwasawaAlgebras §1.3 (reduction of `p`-adic units).

<a id="qab-euler-hypotheses"></a>
### 0.15 `ℚ^ab` and `N = p` satisfy the Euler-system hypotheses
The pair `(𝒦, N) = (ℚ^ab, p)` satisfies Rubin's Definition II.1.1: `(i) 𝒦` contains `ℚ(q)` for every prime `q ≠ p`; (ii) `𝒦` contains the cyclotomic `ℤ_p`-extension `ℚ_∞`, in which no finite prime splits completely. In the conductor-indexed presentation of Remark II.1.3, the fields are `𝒦 ∩ ℚ[m∞] = ℚ(μ_m)` and `𝒦 ∩ ℚ[m] = ℚ(μ_m)^+`.

`p` prime (Rubin's §2.1 takes any `p`; the applications take `p > 2`).

Prove this as follows.

1. `(i) ℚ(q)` lies in the ray class field modulo `q`, which is `ℚ(μ_q)^+ ⊆ ℚ^ab` (step 3).
2. (ii) `ℚ_∞ ⊆ ℚ(μ_{p^∞}) ⊆ ℚ^ab` with `Gal(ℚ_∞/ℚ) ≅ ℤ_p`; `p` is totally ramified, and for `q ≠ p` the Frobenius of `q` has image `q` in `ℤ_p^×`, which is not a root of unity, so its image in `ℤ_p` has infinite order and the decomposition group is infinite (Rubin, Remark II.1.2).
3. The ray class fields of `ℚ` modulo `m∞` and `m` are `ℚ(μ_m)` and `ℚ(μ_m)^+`: by Kronecker–Weber with conductors (`kroneckerWeber`, Tau Ceti ClassFieldTheory Layer 13) an abelian field of conductor dividing `m∞` lies in `ℚ(μ_m)`, and conversely the conductor of `ℚ(μ_m)` divides `m∞`; the subfields of `ℚ(μ_m)` in which the real place does not ramify are exactly those in `ℚ(μ_m)^+`.

**Checks.**

- Every hypothesis of Definition II.1.1 is checked for this `𝒦` and `N`, not assumed.

See **RUBIN-ES**, Chapter II, Definition 1.1, printed p. 21 (PDF p. 31). The hypotheses verified. **RUBIN-ES**, Chapter II, Remark 1.2, printed p. 22 (PDF p. 32). Condition (ii) for `ℚ_∞`.

*Needs:* §F.3; §F.5; IntegralIwasawaTheory §§0.1, 0.3 (`cyclotomic_no_finite_prime_splits_completely`); IntegralIwasawaTheory §1.1; `TauCetiRoadmap.ClassFieldTheory Layer 13` (`rayClassField`, `kroneckerWeber`).

<a id="cyclotomic-kummer-classes"></a>
### 0.16 Kummer classes of the cyclotomic numbers
For `N ≥ 0` and `m ≥ 1`, `κ_N(c̃_m) ∈ H¹(G_{ℚ(μ_m)}, μ_{p^N})` is the Tau Ceti Kummer class of `c̃_m` (`TauCeti.kummerMap`, `n = p^N` invertible in characteristic 0), and likewise `κ_N(c̃_m^+)` over `ℚ(μ_m)^+`. The classes are compatible in `N`, and define `κ(c̃_m) ∈ H¹(ℚ(μ_m), ℤ_p(1)) = lim_N H¹(ℚ(μ_m), μ_{p^N}) = (ℚ(μ_m)^×)^`, Rubin's (1).

`p` prime; `p^N` is invertible in every number field.

Use §F.1 and the existing ProfiniteCohomology Kummer isomorphism; no inverse-limit cohomology carrier is postulated here.

Prove this as follows.

1. Apply `TauCeti.kummerMap` to `c̃_m` and `c̃_m^+`.
2. Compatibility in `N`: the `p`-th power map `μ_{p^{N+1}} → μ_{p^N}` commutes with the Kummer maps (connecting maps of compatible Kummer sequences; §F.1).
3. Norm compatibility: `Cor ∘ κ = κ ∘ N` (ProfiniteCohomology Layer `9, kummerIso_norm`).

The API consists of the following statements.

- `pCycKummerClass_eq_zero_iff` (characterisation): `κ_N(c̃_m) = 0` iff `c̃_m` is a `p^N`-th power in `ℚ(μ_m)` (from `TauCeti.kummerMap_eq_one_iff`).
- `pCycKummerClass_neg` (simp): For `p` odd, `κ_N(−x) = κ_N(x)`: `−1 = (−1)^{p^N}`.
- `pCycKummerClass_cor` (compatibility): `Cor_{ℚ(μ_{mℓ})/ℚ(μ_m)} κ_N(x) = κ_N(N x)` (ProfiniteCohomology Layer 9).
- `pCycKummerClass_galois` (functoriality): `σ κ_N(x) = κ_N(σ x)` for `σ ∈ Gal(ℚ(μ_m)/ℚ)`.
- `pCycKummerClass_compatible` (relation): The image of `κ_{N+1}(x)` under `μ_{p^{N+1}} → μ_{p^N}` is `κ_N(x)`.

These interfaces are used in Rubin, Chapter III §2.1 (1): `c̃` is read in `H¹(ℚ(μ_m), ℤ_p(1))`. Layer 1: the derivative classes are built from these Kummer classes (Foundation F).

**Checks.**

- `kummer_p_ne_zero` (value): `κ_1(c̃_1) = κ_1(p) ≠ 0` in `H¹(G_ℚ, μ_p)`.
- `kummer_pth_power` (degenerate): `κ_N(x^{p^N}) = 0` for every `x`.
- `kummer_torsion_invisible` (non-example): For `p = 5`, `κ_N(c̃_3) = 0` because `c̃_3 = −ζ_3` has order prime to 5; RJW's `−ξ^{−1}` behaves the same way away from `p`.
- `κ_1(c̃_1) = κ_1(p) ≠ 0` in `H¹(G_ℚ, μ_p)`, as `p` is not a `p`-th power in `ℚ` (`TauCeti.kummerMap_eq_one_iff`).
- For `p = 5`, `κ_N(c̃_3) = κ_N(−ζ_3) = 0`: `−ζ_3` has order 6, prime to 5, so it is a `5^N`-th power.

See **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The identification used to view `c̃` as cohomology classes. **RJW-PADIC-L**, §10.5, (10.5)–(10.7), printed p. 52 (arXiv v2). The finite-level Kummer map, as in `TauCeti.kummerMap_eq_kummerCocycleClass`.

*Needs:* `TauCeti.kummerMap`; `TauCeti.kummerMap_eq_one_iff`; `TauCeti.KummerCoeff`; [§0.8](#p-extended-cyclotomic-number); [§0.12](#real-p-extended-number); §F.1.

<a id="cyclotomic-euler-system"></a>
### 0.17 The Euler system of cyclotomic units
The classes `κ(c̃_m) ∈ H¹(ℚ(μ_m), ℤ_p(1))` and `κ(c̃_m^+) ∈ H¹(ℚ(μ_m)^+, ℤ_p(1))` form an Euler system for `(ℤ_p(1), ℚ^ab, p)` in the sense of §F.3 (Rubin, Definition II.1.1, through the conductor presentation of Remark II.1.3). For every `m` and prime `q ≠ p`, `Cor κ(c̃_{mq}) = P(Fr_q^{−1} | ℤ_p(1)^*; Fr_q^{−1}) κ(c̃_m) = (1 − Fr_q^{−1})κ(c̃_m)` if `q ∤ m` and `= κ(c̃_m)` if `q ∣ m`; `Cor κ(c̃_{mp}) = κ(c̃_m)`; the same holds for `c̃^+`; and `Cor_{ℚ(μ_m)/ℚ(μ_m)^+} κ(c̃_m) = κ(c̃_m^+)`. RJW's Definition 10.16 convention, `P_ℓ(V^*(1), σ_ℓ^{−1})` with `V = ℚ_p(1)`, gives the same factor `1 − σ_ℓ^{−1}`.

`p` prime, `𝒦 = ℚ^ab`, `N = p`.

`ℤ_p(1)^* = Hom(ℤ_p(1), ℤ_p(1)) = ℤ_p` with trivial action, so `P(Fr_q^{−1}|T^*; x) = 1 − x`.

Prove this as follows.

1. The hypotheses on `(𝒦, N)` hold (§0.15).
2. Kummer classes turn norms into corestrictions (§0.16).
3. The unit relations are §0.9, §0.10 and §0.13.
4. §F.3 turns these relations into an Euler system for the fields in `ℚ^ab`.

**Checks.**

- The system is not torsion (§0.11); in particular it is not RJW's `c_m`.

See **RUBIN-ES**, Chapter III, §2.1, printed p. 34 (PDF p. 44). The theorem. **RJW-PADIC-L**, §10.5, Definition 10.16, printed p. 53 (arXiv v2). The same Euler factor in RJW's convention. **RJW-PADIC-L**, Definition 10.16, printed p. 53; Appendix B.3, printed p. 81; §2.2.4, printed pp. 7–8. The cohomological Euler-system family and its Rubin conductor presentation are compared with the generic carrier of §F.3; the unconditional main conjecture is the endpoint of Layer 3.

*Needs:* [§0.15](#qab-euler-hypotheses); [§0.16](#cyclotomic-kummer-classes); [§0.9](#p-extended-tower-relation); [§0.10](#p-extended-auxiliary-relation); [§0.13](#real-relations); §F.3; §F.5.

<a id="chi-component"></a>
### 0.18 `χ`-components
Define `chiComponent` as the following eigensubmodule.

Let `O` be a commutative ring, `Δ` a finite group, `M` an `O[Δ]`-module and `χ : Δ → O^×` a character. Define `chiComponent` by `M^χ = {x ∈ M : δx = χ(δ)x for all δ ∈ Δ}`, an `O`-submodule. For a `ℤ[Δ]`-module `B`, Rubin's `B^χ` is `(B̂ ⊗_{ℤ_p} O)^χ`, with `B̂` the `p`-adic completion (`B ⊗ ℤ_p` for `B` finitely generated). Equivalently `B^χ ≅ (B̂ ⊗ O_{χ^{−1}})^Δ` after fixing a generator of `O_{χ^{−1}}`.

The `χ`-functor is exact when `|Δ|` is invertible in `O`. For the character decomposition used here, additionally assume `Δ` abelian, `O` the ring of integers of a finite extension of `ℚ_p` containing all `Δ`-character values, and `p∤|Δ|`. The bare eigen-submodule definition works over any commutative ring.

When `p` divides `|Δ|` the character functors are those of Layer 4 (Greither); this target is the prime-to-`p` case.

Prove this as follows.

1. Definition as an eigen-submodule; closure under 0, `+` and `O`-scalars uses only that `O` is commutative.
2. The twist description is Mathlib's invariants (`Representation.invariants`) of `ρ ⊗ χ^{−1}`.
3. Exactness and the decomposition use the idempotents `|Δ|^{−1}∑ χ(δ)^{−1}δ` (§0.19), as for `Representation.averageMap`.

The API consists of the following statements.

- `mem_chiComponent` (characterisation): `x ∈ M^χ` iff `δx = χ(δ)x` for all `δ`.
- `mem_chiComponent_iff_twist` (equivalence): `x ∈ M^χ` iff `χ(δ)^{−1}δx = x` for all `δ`: `M^χ` is the `Δ`-invariants of the twist by `χ^{−1}`, Rubin's `(B̂ ⊗ O_{χ^{−1}})^Δ`.
- `chiComponent_map` (functoriality): `Δ`-equivariant `O`-linear maps send `M^χ` into `N^χ`.
- `chiComponent_map_eq` (structure): If `|Δ|` is a unit, `M↦M^χ` is exact. If `Δ` is finite abelian and `O` is the integer ring of a finite extension of `ℚ_p` containing every `Δ`-character value, with `p∤|Δ|`, then `M=⊕χ M^χ`, via the orthogonal character idempotents.
- `chiComponent_ext` (extensionality): To identify a submodule `N` with `M^χ`, prove for every `x` that `x∈N` iff `δx=χ(δ)x` for every `δ`; use `Submodule.ext` and `mem_chiComponent`.
- `chiComponent_trivial_eq_bot` (characterisation): For the trivial action, injectivity on `M` of multiplication by `χ(δ)−1` for one `δ` implies `M^χ=0`. The module `M` itself, rather than just `O`, must satisfy this injectivity.

These interfaces are used in Rubin, Chapter III (3): `H¹(ℚ_n, T^*) ≅ (L_n^×)^χ`. Rubin, Chapter III Definition 2.2: `E_n^χ` and `C_{n,χ}`. Rubin, Chapter III Theorem 2.3: `|A_L^χ|` and `[E_L^χ : C_{L,χ}]`. Layer 2: the `Λ`-modules `A_∞^χ`, `E_∞^χ`, `C_{∞,χ}`.

**Checks.**

- `chiComponent_one` (compatibility): For `χ = 1`, `M^χ` is Mathlib's `ρ.invariants`.
- `chiComponent_trivial_rep` (degenerate): For the trivial action, if multiplication by `χ(δ)−1` is injective on `M` for some `δ`, then `M^χ=0`. In particular this holds for `M=O`, `O` a domain, and `χ(δ)≠1`.
- `chiComponent_regular` (value): For `|Δ| ∈ O^×`, `O[Δ]^χ` is free of rank one on `∑_δ χ(δ)^{−1}[δ]`.
- `chiComponent_not_split` (non-example): For `Δ=C_p` acting regularly on `M=𝔽_p[Δ]`, `M^1` is the one-dimensional span of the norm element. The augmentation `M→𝔽_p` induces the zero map on invariants, although it is surjective on `M`; invariants are not exact here.
- `chiComponent_torsion_counterexample` (non-example): For `O=ℤ`, `M=ℤ/2`, `Δ=C₂` acting trivially and `χ(s)=−1`, `M^χ=M≠0` although `χ(s)−1=−2` is a nonzerodivisor in `O`. Scalar regularity in `O` alone is insufficient.
- The trivial character gives the invariants.

See **RUBIN-ES**, Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24). The definition. **RUBIN-ES**, Chapter I, §6.2, printed p. 15 (PDF p. 25). The exactness and decomposition API.

*Needs:* `Representation.invariants`; `Representation.mem_invariants`; `Representation.averageMap`.

<a id="chi-sum"></a>
### 0.19 Twisted sums
Define `chiSum` as the following unnormalised character sum.

For an `O[Δ]`-module `M`, `χ : Δ → O^×` and `x ∈ M`, `chiSum_{χ}(x) = ∑_{δ∈Δ} χ(δ)^{−1} δx`. For `M = L^× ⊗ O` written additively this is the product `∏_δ (δx)^{χ^{−1}(δ)}` of Rubin's (4) and Definition 2.2.

`Δ` finite; no invertibility of `|Δ|` is needed to define it.

Prove this as follows.

1. Finite sum.
2. `χ(δε)^{−1} = χ(δ)^{−1}χ(ε)^{−1}` gives `ε·chiSum(x) = χ(ε)chiSum(x)`, so `chiSum` lands in `M^χ`.

The API consists of the following statements.

- `chiSum_mem` (other): `chiSum_{χ}(x) ∈ M^χ`.
- `chiSum_add` (simp): `chiSum_{χ}` is additive, indeed `O`-linear.
- `chiSum_of_mem` (simp): For `x ∈ M^χ`, `chiSum_{χ}(x) = |Δ|·x`.
- `chiSum_chiSum` (relation): `chiSum_{χ} ∘ chiSum_{χ} = |Δ|·chiSum_{χ}`; for `|Δ| ∈ O^×` this gives the idempotent projection onto `M^χ`.
- `chiSum_map` (functoriality): For a `Δ`-equivariant `O`-linear map `f`:`M→N`, `f(chiSumχ(x))=chiSumχ(f(x))`; hence character sums commute with the unit, norm and Kummer maps used here.

These interfaces are used in §0.22: `ξ_{L,χ} = chiSum(1 ⊗ u)`. Rubin, Chapter III (6): the identity `c_ℚ = ξ^{1 − χ^{−1}(p)}`.

**Checks.**

- `chiSum_trivial` (degenerate): Trivial character on a trivial module: `chiSum_1(x) = |Δ|·x`.
- `chiSum_trivial_group` (degenerate): For the trivial group, `chiSum` is the identity.
- `chiSum_sign_regular` (value): For `Δ=C₂={1,s}`, `O=ℤ`, `χ(s)=−1` and the regular module, `chiSumχ([1])=[1]−[s]`. The ordinary trace `[1]+[s]` is a wrong answer.
- On `M^χ`, `chiSum` is multiplication by `|Δ|`.

See **RUBIN-ES**, Chapter III, §2.2, display (4), printed p. 35 (PDF p. 45). The twisted products are `chiSum`. **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). `ξ_{n,χ}` is a twisted product.

*Needs:* [§0.18](#chi-component).

<a id="chi-sum-frobenius"></a>
### 0.20 Twisted sums and the Frobenius factor
Prove `chiSum_sub_frobenius` with the following arithmetic Frobenius convention.

For `φ ∈ Δ` and `u ∈ M`: `chiSum_{χ}(u − φ^{−1}u) = (1 − χ(φ)^{−1})·chiSum_{χ}(u)`.

`Δ` finite, `χ : Δ → O^×` a homomorphism; `Δ` need not be abelian.

Prove this as follows.

1. `chiSum_{χ}(φ^{−1}u) = ∑_δ χ(δ)^{−1}δφ^{−1}u`; reindex `δ' = δφ^{−1}`, so `χ(δ)^{−1} = χ(δ')^{−1}χ(φ)^{−1}`.

**Checks.**

- `φ = 1` gives `0 = 0`; for `χ(φ) = 1` the right side vanishes.
- For `Δ=C₄=⟨s⟩`, `O=ℂ`, `χ(s)=i` and `u=[1]` in the regular representation, `S=chiSumχ(u)=[1]−i[s]−[s²]+i[s³]`. Then `chiSumχ(u−s⁻¹u)=(1+i)S`; `1−i` is the wrong factor. The coefficient at `[1]` already distinguishes the two results.

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). The algebra behind (6), with `φ` the Frobenius of `p`.

*Needs:* [§0.19](#chi-sum).

<a id="one-sub-root-of-unity-unit"></a>
### 0.21 `1 − ω` is a unit for roots of unity of invertible order
Prove `isUnit_one_sub_of_pow_eq_one` with the following hypotheses and normalization.

In a commutative domain `O`, if `ω^n = 1`, `ω ≠ 1` and `n ∈ O^×`, then `1 − ω ∈ O^×`. In particular, for `χ` of order prime to `p` and `χ(p) ≠ 1`, `1 − χ^{−1}(p) ∈ O^×`.

`O` a domain; `n` a unit of `O` (for `O` the integers of a finite extension of `ℚ_p: p ∤ n`).

Prove this as follows.

1. `(ω − 1)` divides `n (sub_one_dvd_natCast_of_pow_eq_one)`, and `n` is a unit, so `ω − 1` and `1 − ω` are units `(isUnit_of_dvd_unit)`.

**Checks.**

- Fails without invertibility: `1 − (−1) = 2` is not a unit of `ℤ_2`.

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). Since `χ(p) ≠ 1` and `χ` has order prime to `p`, `1 − χ^{−1}(p) ∈ O×`.

*Needs:* `sub_one_dvd_natCast_of_pow_eq_one`; `isUnit_of_dvd_unit`.

<a id="chi-cyclotomic-generator"></a>
### 0.22 The `χ`-cyclotomic generators `ξ_{n,χ}`
Let `χ` be an even nontrivial character of `G_ℚ` of finite order prime to `p`, with conductor `f`, fixed field `L` and `Δ = Gal(L/ℚ)`; let `ℚ_n ⊆ ℚ(μ_{p^{n+1}})` be the layers of `ℚ_∞` and `L_n = Lℚ_n`, so `Gal(L_n/ℚ_n) = Δ`. Put `u_0 = N_{ℚ(μ_f)/L}(1 − ζ_f)` and, for `n > 0`, `u_n = N_{ℚ(μ_{fp^{n+1}})/L_n}(1 − ζ_{fp^{n+1}})`. Then `ξ_{n,χ} = chiSum_{χ}(1 ⊗ u_n) ∈ (O ⊗ L_n^×)^χ`. It equals Rubin's `∏_{δ∈Gal(ℚ(μ_f)/ℚ)} (ζ_f^δ − 1)^{χ^{−1}(δ)} (n = 0)`, respectively the product over `Gal(ℚ_n(μ_{fp^{n+1}})/ℚ_n) (n > 0)`.

`p` is odd. The indexing `ℚ_n⊆ℚ(μ_{p^{n+1}})` and Rubin’s prime-to-`p` character application in Layers 0–3 use this convention; Layer 4 treats `p=2` separately.

`χ` even, nontrivial, of order prime to `p` (Rubin §III.2.2); `χ` is viewed as a Dirichlet character modulo `f` with `χ(q) = 0` for `q ∣ f`.

The sign convention is immaterial: `∑ χ^{−1}(δ) = 0` over each group, since `χ` is nontrivial on it, so `(−1)` contributes `(−1)^0`.

Prove this as follows.

1. Rewrite Rubin's product over `Gal(ℚ(μ_f)/ℚ)` by grouping `δ` by its restriction to `L`: `χ^{−1}(δ)` depends only on `δ|_L`, and the inner product is the norm to `L`. This keeps `ξ` in `L_n^× ⊗ O` without a descent step (`p` may divide `[ℚ(μ_f) : L]`).
2. `chiSum` lands in the `χ`-component `(chiSum_mem)`.

The API consists of the following statements.

- `xiChi_mem` (other): `ξ_{n,χ} ∈ (O ⊗ L_n^×)^χ`.
- `xiChi_neg` (compatibility): The `ζ − 1` and `1 − ζ` conventions give the same `ξ` for `χ ≠ 1`.
- `xiChi_eq_prod` (characterisation): `ξ_{n,χ}` is Rubin's product over `Gal(ℚ(μ_f)/ℚ) (n = 0)` or `Gal(ℚ(μ_{fp^{n+1}})/ℚ_n) (n > 0)`.
- `xiChi_smul` (simp): `δ ξ_{n,χ} = χ(δ) ξ_{n,χ}` for `δ ∈ Δ`.

These interfaces are used in Rubin, Chapter III Definition 2.2: generator of `C_{n,χ}`. Rubin, Chapter III (6): `c_ℚ = ξ_{L,χ}^{1 − χ^{−1}(p)}`. Layer 2: `C_{∞,χ} = lim C_{n,χ}`.

**Checks.**

- `xiChi_conductor_five` (value): `χ` quadratic of conductor 5, `p = 3`: `ξ_{L,χ} = ε^{−2}`.
- `xiChi_sign` (compatibility): Replacing `1 − ζ_f` by `ζ_f − 1` leaves `ξ` unchanged.
- `xiChi_trivial_character` (non-example): For `χ = 1` and `f = ℓ^k` the analogous product `Φ_{ℓ^k}(1) = ℓ` is not a unit: nontriviality is needed.
- For `χ` the quadratic character of conductor 5 and `p = 3`: `L = ℚ(√5)`, `u_0 = (1 − ζ_5)(1 − ζ_5^{−1}) = (5 − √5)/2` and `ξ_{L,χ} = u_0/σ(u_0) = (3 − √5)/2 = ε^{−2}`, with `ε = (1 + √5)/2`.

See **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). The definition of `ξ_{n,χ}` and `C_{n,χ}`. **RUBIN-ES**, Chapter III, §2.2, printed pp. 34–35 (PDF pp. 44–45). The standing hypotheses.

*Needs:* [§0.19](#chi-sum); [§0.18](#chi-component); IntegralIwasawaTheory §§0.2, 1.1; IntegralIwasawaTheory §0.3 (disjointness of `ℚ_∞` from `L`).

<a id="chi-cyclotomic-generator-unit"></a>
### 0.23 `ξ_{n,χ}` is a unit
For `χ ≠ 1`, `ξ_{n,χ}` lies in the image of `O ⊗ E_n → O ⊗ L_n^×`, `E_n` the global units of `L_n`; so `ξ_{n,χ} ∈ E_n^χ`.

`χ` nontrivial; conductors as in §0.22.

Prove this as follows.

1. If the conductor `g` (`f`, respectively `fp^{n+1}`) of the root is not a prime power, `1 − ζ_g` is a unit: its norm to `ℚ` is `Φ_g(1)=1` (`Polynomial.eval_one_cyclotomic_not_prime_pow`), and an algebraic integer of norm `±1` is a unit (`NumberField.isUnit_iff_norm`). So `u_n ∈ E_n`.
2. If `g = ℓ^k`, the ideal `(1 − ζ_g)` is the unique prime above `ℓ` in `ℚ(μ_g)` (`IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver`, with conjugates associated by `IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime`); its norm to `L_n` is a `Δ`-invariant ideal, and `∑ χ^{−1}(δ) = 0` kills it in the ideal group `⊗ O`.
3. `L_n^×/E_n` is torsion-free (principal ideals), so `O ⊗ E_n → O ⊗ L_n^×` is injective with image the elements of trivial valuation.

**Checks.**

- The prime-power case (for example `f = 5`) is where the `χ`-part argument is needed.

See **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). Rubin places `ξ_{n,χ}` in `E^χ_n`.

*Needs:* [§0.22](#chi-cyclotomic-generator); `IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver`; `IsPrimitiveRoot.associated_sub_one_pow_sub_one_of_coprime`; `NumberField.RingOfIntegers`; IntegralIwasawaTheory §1.7.

<a id="chi-cyclotomic-units"></a>
### 0.24 The `χ`-cyclotomic units `C_{n,χ}`
`C_{n,χ}` is the `O[Gal(L_n/ℚ)]`-submodule of `E_n^χ` generated by `ξ_{n,χ}`. Since `Δ` acts on `E_n^χ` through `χ`, it is the `O[Gal(L_n/L)]`-span of `ξ_{n,χ}`; for `n = 0`, `C_{L,χ} = O·ξ_{L,χ}`.

`χ` even, nontrivial, of order prime to `p`.

Prove this as follows.

1. Span of the generator; §0.23 places it in `E_n^χ`.

The API consists of the following statements.

- `chiCyclotomicUnits_le` (other): `C_{n,χ} ⊆ E_n^χ ⊆ (O ⊗ L_n^×)^χ`.
- `chiCyclotomicUnits_stable` (structure): `C_{n,χ}` is `Gal(L_n/ℚ)`-stable.
- `chiCyclotomicUnits_eq_span` (characterisation): The `O[Δ]`-span of `ξ_{L,χ}` equals its `O`-span, so `C_{L,χ} = O·ξ_{L,χ}`.
- `chiCyclotomicUnits_index_finite` (other): `[E_L^χ : C_{L,χ}] < ∞`: `E_L^χ` has `O`-rank one (IntegralIwasawaTheory §4.3), and the `χ`-resolvent of `log|ξ_{L,χ}|` is a nonzero multiple of `L(1,χ̄)` (§F.9, logarithmic formula; `DirichletCharacter.LFunction_apply_one_ne_zero`).

These interfaces are used in Rubin, Chapter III Theorem 2.3: `|A_L^χ|` divides `[E_L^χ : C_{L,χ}]`. Layer 1: the index of divisibility `ind_O(c) = ℓ_O(E_L^χ/C_{L,χ})`.

**Checks.**

- `chiCyclotomicUnits_conductor_five` (value): `χ` quadratic of conductor 5, `p = 3`: `E_L^χ = ℤ_3·ε` and `C_{L,χ} = ℤ_3·ε^{−2}` have index 1, matching `|A_L^χ| = 1 (h(ℚ(√5)) = 1)` in Rubin's Corollary 2.4.
- `chiCyclotomicUnits_conductor_five_p5` (value): The same `χ` with `p = 5` (so `p ∣ f` and `χ(p) = 0`): again index 1.
- `chiCyclotomicUnits_torsion_choice` (non-example): Built from RJW's torsion `c_m`, the span would be 0 in `E_L^χ`.
- For `n = 0`, `[E_L^χ : C_{L,χ}]` is finite, because `L(1, χ̄) ≠ 0`; replacing `ξ_{L,χ}` by the `χ`-sum of a rational number gives index `∞`.

See **RUBIN-ES**, Chapter III, §2.4, Definition 2.2, printed p. 35 (PDF p. 45). The definition.

*Needs:* [§0.22](#chi-cyclotomic-generator); [§0.23](#chi-cyclotomic-generator-unit); [§0.18](#chi-component); IntegralIwasawaTheory §1.7; IntegralIwasawaTheory §4.3; §F.9; `DirichletCharacter.LFunction_apply_one_ne_zero`.

<a id="twisted-class-formula"></a>
### 0.25 The restriction–Kummer dictionary and the twisted class `c_ℚ`
Prove `restrictionKummer_chiEquiv`. Let `F` be a number field or a finite extension of `ℚ_ℓ` for some prime `ℓ`, `L/F` a finite abelian extension whose group `Δ=Gal(L/F)` has order prime to `p`, `O` the integers of a finite extension of `ℚ_p` containing the values of a character `χ`:`Δ→O^×`, `T*=O(1)⊗χ^{−1}` and `W*=T*⊗ℚ_p/ℤ_p`. Restriction, the `p`-adic Kummer identification and a fixed generator of `O_{χ^{−1}}` give isomorphisms of `O`-modules

```text
H¹(F, T*) ≅ H¹(L, T*)^Δ ≅ ((L^×)^ ⊗_{ℤ_p} O_{χ^{−1}})^Δ ≅ (L^×)^χ ⊆ L^× ⊗̂ O,
H¹(F, W*) ≅ (L^× ⊗ ℚ_p/ℤ_p)^χ.
```

They are natural for restriction in `L`. For a finite extension `F′/F` with `L′=`LF`′` and `[L′:F′]=[L:F]`, corestriction `H¹(F′,T*)→H¹(F,T*)` corresponds to the norm `N_{L′/L}`; for `F=ℚ_n` and `L=L_n` this is the tower version used in Layer 2. For `F` local and `ℓ≠p`, the finite subgroup `H¹_f(F,T*⊗ℚ_p)` corresponds to `U_L^χ⊗ℚ_p`, `U_L` the local units of `L⊗_F F`; for `ℓ=p` this correspondence is the definition of the finite subgroup used here. (Rubin, Chapter III, §2.2, display (3), printed p. 35; Chapter I, Proposition 6.3(i) and display (7), printed p. 15.)

`|Δ|` is prime to `p`; `χ` need not be even or nontrivial for this dictionary. The generator of `O_{χ^{−1}}` is fixed once; changing it multiplies the isomorphism by a unit of `O`.

Prove this as follows.

1. `Δ` has order prime to `p`, so `H^i(Δ,M)=0` for `i≥1` on every `p`-primary or pro-`p` module `M`. Inflation–restriction (`TauCetiRoadmap.ProfiniteCohomology` Layer 5) therefore makes restriction an isomorphism onto `Δ`-invariants, first with the finite coefficients `T*/p^kT*` and then in the limit, where §F.1 removes the `lim¹` term.
2. `G_L` acts trivially on `O_{χ^{−1}}`, so `H¹(L,T*)=H¹(L,ℤ_p(1))⊗O_{χ^{−1}}`. §F.1 identifies `H¹(L,ℤ_p(1))` with `(L^×)^`, compatibly with restriction and with corestriction against the norm. The torsion version uses the Kummer sequence for `μ_{p^∞}` (`TauCetiRoadmap.ProfiniteCohomology` Layer 9).
3. For the fixed generator, an element `x⊗1` of `(L^×)^⊗O_{χ^{−1}}` is `Δ`-invariant exactly when `δx=χ(δ)x` for all `δ`, that is when `x` lies in the `χ`-eigenspace (§0.18, `mem_chiComponent_iff_twist`).
4. For the finite subgroup apply the unramified condition (§F.2) on each factor of `L⊗_F F`, and local class field theory (`TauCetiRoadmap.ClassFieldTheory` Layers 6–7), under which the inertia subgroup corresponds to the local units.

**Checks for `restrictionKummer_chiEquiv`.**

- For `F=L` and `χ=1` the dictionary is the plain `p`-adic Kummer identification of §F.1.
- For `F=ℚ`, `L=ℚ(√5)`, `χ` the quadratic character and `p=3`, the rational prime 3 is `Δ`-invariant and has zero `χ`-component, while the fundamental unit `ε` of norm `−1` has `χ`-sum `ε/σ(ε)=−ε²`, whose class in `(L^×)^χ` is that of `ε²` (`−1` is a cube). An identification of `H¹(ℚ,T*)` with all of `(L^×)^` would wrongly contain the class of 3.
- The hypothesis `p∤|Δ|` is needed. For `p=2` and `L=ℚ(i)`, the Kummer class of `−1` in `H¹(ℚ,μ₂)` is nonzero, since `−1` is not a square in `ℚ`, but it restricts to zero in `H¹(ℚ(i),μ₂)`. Restriction is not injective.

With this dictionary, let `c = c̃^{χ^{−1}}` be the twist by `χ^{−1}` of the Euler system of cyclotomic units (§F.5, Rubin Proposition II.4.2), an Euler system for (`T^*, ℚ^ab`, pf) with `T = O_χ`, `T^* = ℤ_p(1) ⊗ χ^{−1}`. Under `restrictionKummer_chiEquiv`, `H¹(ℚ, T^*) ≅ (L^×)^χ ⊆ L^× ⊗̂ O` (Rubin (3)), and `c_ℚ` corresponds to `chiSum_{χ}(1 ⊗ N_{ℚ(μ_{fp})/L}(1 − ζ_{fp})) = ∏_{δ∈Gal(ℚ(μ_{fp})/ℚ)} (1 − ζ_{fp}^δ)^{χ^{−1}(δ)}`.

`p` is odd. The indexing `ℚ_n⊆ℚ(μ_{p^{n+1}})` and Rubin’s prime-to-`p` character application in Layers 0–3 use this convention; Layer 4 treats `p=2` separately.

`χ` even, nontrivial, of order prime to `p`, conductor `f`; `[L : ℚ]` prime to `p`.

Prove this as follows.

1. The twisting lemma of §F.5 (Rubin Lemma II.4.3) with `F = ℚ` and `L' = ℚ(μ_f)^+`, which has the same conductor as `L` because `χ` is even, gives `∏_{δ∈Gal(ℚ(μ_f)^+/ℚ)} (δc̃_f^+)^{χ^{−1}(δ)}`.
2. `c̃_f^+ = N_{ℚ(μ_f)/ℚ(μ_f)^+}N_{ℚ(μ_{fp})/ℚ(μ_f)}(1 − ζ_{fp})`, so the product is the one over `Gal(ℚ(μ_{fp})/ℚ)`; the sign convention is immaterial for `χ ≠ 1`.

**Checks.**

- For `p ∣ f` the norm `N_{ℚ(μ_{fp})/ℚ(μ_f)}(1 − ζ_{fp})` is `1 − ζ_f`.

See **RUBIN-ES**, Chapter III, §2.2, display (4), printed p. 35 (PDF p. 45). The theorem. **RUBIN-ES**, Chapter III, §2.2, display (3), printed p. 35 (PDF p. 45). The dictionary (3), proved above as `restrictionKummer_chiEquiv`. **RUBIN-ES**, Chapter I, Proposition 6.3(i) and display (7), printed p. 15 (PDF p. 25). The same dictionary with `W*=T*⊗ℚ_p/ℤ_p`, and its local form with the finite subgroup.

*Needs:* [§0.17](#cyclotomic-euler-system); [§0.12](#real-p-extended-number); [§0.19](#chi-sum); §F.3; §F.5; §§F.1, F.2; `TauCetiRoadmap.ProfiniteCohomology` Layers 5 and 9; `TauCetiRoadmap.ClassFieldTheory` Layers 6–7.

<a id="twisted-class-eq-xi-power"></a>
### 0.26 `c_ℚ = ξ_{L,χ}^{1 − χ^{−1}(p)}`
With `χ` as above and `χ(p) = 0` when `p ∣ f`: `c_ℚ = ξ_{L,χ}^{1 − χ^{−1}(p)}` in `(L^×)^χ`, that is `chiSum_{χ}(1 ⊗ N_{ℚ(μ_{fp})/L}(1 − ζ_{fp})) = (1 − χ^{−1}(p))·ξ_{L,χ}`.

`χ` even, nontrivial, of order prime to `p`, conductor `f`.

Prove this as follows.

1. By §0.25, `c_ℚ` is `chiSum_{χ}(1 ⊗ u')` with `u' = N_{ℚ(μ_f)/L}(N_{ℚ(μ_{fp})/ℚ(μ_f)}(1 − ζ_{fp}))`.
2. If `p ∤ f`, the inner norm is `(1 − ζ_f)^{1 − Fr_p^{−1}}` (§0.5), so `u' = u_0 − Fr_p^{−1}u_0` additively; §0.20 with `φ = Fr_p|_L` gives `(1 − χ(Fr_p)^{−1})ξ_{L,χ} = (1 − χ^{−1}(p))ξ_{L,χ}`.
3. If `p ∣ f`, the inner norm is `1 − ζ_f` (§0.3), so `c_ℚ = ξ_{L,χ} = ξ_{L,χ}^{1 − 0}`.

**Checks.**

- For `χ(p) = 1` the class `c_ℚ` is trivial: this is the source of Rubin's hypothesis `χ(p) ≠ 1` (Remark III.2.1).

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). Equation (6).

*Needs:* [§0.25](#twisted-class-formula); [§0.22](#chi-cyclotomic-generator); [§0.20](#chi-sum-frobenius); [§0.5](#distribution-relation-frobenius); [§0.3](#distribution-relation-of-dvd).

<a id="twisted-class-generates"></a>
### 0.27 `c_ℚ` generates `C_{L,χ}` when `χ(p) ≠ 1`
If `χ(p) ≠ 1`, then `1 − χ^{−1}(p) ∈ O^×` and `c_ℚ` generates `C_{L,χ} = O·ξ_{L,χ}`.

`χ` of order prime to `p`, `χ(p) ≠ 1` (including `χ(p) = 0` when `p ∣ f`).

Prove this as follows.

1. `χ^{−1}(p)` is 0 or a root of unity `ω ≠ 1` of order dividing `ord χ`, prime to `p`; then §0.21 makes `1 − ω` a unit.
2. `c_ℚ = (1 − χ^{−1}(p))ξ_{L,χ}` (§0.26) and `C_{L,χ} = O·ξ_{L,χ}` (§0.24).

**Checks.**

- For `χ(p) = 1` the conclusion fails: `c_ℚ = 0`.

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, equation (6), printed p. 36 (PDF p. 46). The last sentence.

*Needs:* [§0.26](#twisted-class-eq-xi-power); [§0.21](#one-sub-root-of-unity-unit); [§0.24](#chi-cyclotomic-units).

<a id="unsmoothed-cyclotomic-euler-system"></a>
### 0.28 The unsmoothed cyclotomic Euler system
Let `p` be odd, `χ` a nontrivial even finite-order character of order prime to `p` and conductor `f` prime to `p`, `O=ℤ_p[χ]`, and `T=O(1)⊗χ⁻¹`. For `m>1` prime to `p` set `b_m=(ζ_m−1)(ζ_m⁻¹−1)` in `ℚ(μ_m)⁺` and `b_1=1`. Apply Kummer and the finite-character twisting map of §F.5 to this family. The resulting `c^unsm` is an Euler system for `(T,𝒦,fp)`, where `𝒦=∪_{(m,p)=1}ℚ(μ_m)`, using the rigidity alternative rather than containment of a `ℤ_p`-extension. Its initial class generates `C_{L,χ}`, up to the unit factor 2 coming from realification, including when `χ(p)=1`.

Compatible roots and arithmetic Frobenius as in Layer 0. The raw `b_m` family is not itself an Euler system: at `m=ℓ` prime it has a nonzero `ℓ`-valuation and fails the required finite condition.

The twist uses the restriction–Kummer character isomorphism, not a formal change of coefficients on an arbitrary single class. The extension `𝒦` is unramified at `p`; the rigidity alternative supplies the hypothesis needed in place of a cyclotomic `ℤ_p`-extension.

Prove this as follows.

1. For `m>2` the `b_m` are the real norms of `1−ζ_m` and obey the nondegenerate auxiliary distribution relation. The raw family fails at the base conductor: `b₁=1`, whereas the full cyclotomic norm `N_{ℚ(μ_ℓ)/ℚ}(b_ℓ)=ℓ²`. For `ℓ>2` its norm from the real subfield is `ℓ`; at `ℓ=2`, `b₂=4` in `ℚ`. Twisting by nontrivial `χ` removes this base-conductor valuation/norm obstruction in the `χ`-component.
2. Use §F.5: choose `γ∈G_{ℚ(μ_{p∞})}` with `χ(γ)≠1`. Then `γ−1` is injective on `T`; the finite-order Frobenius and congruence alternative is verified by Rubin IV Example 8.2.
3. Twisting kills the valuation obstruction at conductor `f`. Since `χ` is even, `b_f` has `χ`-sum `2ξ_{L,χ}`; 2 and the prime-to-`p` twisting normalisation are units, so its span is `C_{L,χ}`. No Euler factor `1−χ⁻¹(p)` is inserted.

The API consists of the following statements.

- `unsmoothedEulerSystem_class` (data): Its class at conductor `m` is the finite-character twist of `κ(b_m)`, with the conductor presentation of §F.3.
- `unsmoothedEulerSystem_norm` (compatibility): Corestriction from an auxiliary prime `q` has factor `1−χ⁻¹(q)Fr_q⁻¹` in the twisted representation, as specified by the Tate-dual Euler polynomial of §F.3.
- `unsmoothedEulerSystem_initial_span` (characterisation): The initial class spans `C_{L,χ}` for every such `χ`, including `χ(p)=1`.

These interfaces are used in Rubin IX Theorem 1.2: Supplies initial classes without a vanishing `p`-Euler factor. §F.5: Tests an arithmetic example whose indexing extension contains no cyclotomic `ℤ_p`-extension.

**Checks.**

- `unsmoothed_base` (degenerate): `b_1=1` gives zero in additive Kummer cohomology.
- `unsmoothed_prime` (non-example): `b_ℓ` has nonzero valuation at `ℓ` for `ℓ≠p`, so its raw class fails the finite local condition; accepting the raw family as an Euler system is wrong.
- `unsmoothed_split_p` (value): For the quadratic character of conductor 5 and `p=11`, `χ(11)=1`: the `p`-extended initial class is zero, while the unsmoothed initial class has the same nonzero span as `ξ_{L,χ}`.
- Check the norm relations after twisting and verify the finite condition away from `p` at the initial conductor.
- At `χ(p)=1` the initial span is `C_{L,χ}`, whereas the `p`-extended initial class vanishes.
- The extension contains conductors coprime to `p` and the proof uses rigidity alternative `(b)` or `(c)`.

See **RUBIN-ES**, Chapter IX §1, Example 1.1 and Theorem 1.2, printed pp. 133–136; Chapter IV Example 8.2, printed p. 78. The alternative cyclotomic-unit construction removes the vanishing initial Euler factor of the `p`-extended system.

*Needs:* [§0.13](#real-relations); [§0.16](#cyclotomic-kummer-classes); [§0.24](#chi-cyclotomic-units); §F.5; [§0.25](#twisted-class-formula) (`restrictionKummer_chiEquiv`).

<a id="stickelberger-annihilator"></a>
### 0.29 Smoothed Stickelberger annihilation
For odd `p`, `m≥1` and an odd integer `b` prime to `mp`, let `θ_m=Σ_{a∈(ℤ/m)×}(a/m−1/2)σ_a⁻¹`, `θ_1=0`. Then `(b−σ_b)θ_m` has integral group-ring coefficients and annihilates the ideal class group of `ℚ(μ_m)`. Therefore `θ̄_m` of §0.30 is integral and annihilates its `p`-class group in both cases `p|m` and `p∤m`.

Use least nonnegative representatives a modulo `m` and arithmetic `σ_a(ζ_m)=ζ_m^a`. The extra factor `1−Fr_p⁻¹` is used only when `p∤m`.

Prove this as follows. The unshifted statement is proved in §F.9; only the half-norm shift and the Euler factor are new here.

1. Write `θ_m=θ⁰_m−½N_m`, with `θ⁰_m=Σ_a(a/m)σ_a⁻¹` the Stickelberger element of §F.9 (same group-ring convention `σ_a⁻¹=[a⁻¹]`) and `N_m=Σ_aσ_a`. Then `(b−σ_b)θ_m=s_{m,b}−((b−1)/2)N_m`, where `s_{m,b}=(b−[b])θ⁰_m` is the integral floor element of §F.9 (`smoothedStickelberger_cast`). Since `b` is odd, `(b−1)/2` is an integer, so the shifted element is integral.
2. `s_{m,b}` annihilates `Cl(ℚ(μ_m))` for `m≥2` and `b` prime to `m` (§F.9, `stickelberger_smoothing_annihilates`; its Gauss-sum descent is `gaussSum_smoothed_descent` in the same target). `N_m` annihilates `Cl(ℚ(μ_m))` because `N_m·[𝔞]` is the class of the extension of the ideal `N_{ℚ(μ_m)/ℚ}𝔞`, and `ℚ` has class number one; equivalently `N_m=(1+c)θ⁰_m` lies in the integral Stickelberger ideal (§F.9). For `m=1` the operator is zero.
3. Multiplication by the additional Euler factor `1−Fr_p⁻¹` preserves the annihilator property, and the `p`-primary projection is compatible with annihilation (§F.9).

**Checks.**

- `m=1` gives `θ_1=0` and the zero operator.
- For `m=3`,`b=5`, `θ_3=−(1/6)(1−j)`, and `(5−j)θ_3=−(1−j)`, an integral operator.
- The finite-field Gauss ideal identity alone concerns `g^m`; the descent of the smoothed ratio is the Gauss-sum descent statement of §F.9, not a consequence of that identity.
- For `b` even the half-norm term `((b−1)/2)N_m` is not integral: at `m=3`, `b=2` one gets `(2−j)θ_3=−(1/6)(2−j)(1−j)`, whose coefficient at 1 is `−1/2`.

See **RUBIN-ES**, Chapter III §4, Definition 4.1 and equations (7)–(8), printed p. 40; Definition 4.2 and its following annihilation argument, printed p. 41. The integral smoothed Stickelberger element annihilates the cyclotomic class group and thus defines the idèle-to-unit map used in the cohomology construction.

*Needs:* §F.9 (`smoothedStickelberger_cast`, `gaussSum_smoothed_descent`, `stickelberger_smoothing_annihilates`).

<a id="stickelberger-class-family"></a>
### 0.30 The Stickelberger cohomology family
Fix odd `p` and an integer `b` prime to `2p`. For `m≥1` prime to `b` let `F_m=ℚ(μ_m)`, `θ_m=Σ_{a∈(ℤ/m)×}(a/m−1/2)σ_a⁻¹`, and `θ_1=0`. Put `θ̄_m=(b−σ_b)θ_m` when `p|m` and `θ̄_m=(b−σ_b)(1−Fr_p⁻¹)θ_m` otherwise. Integral Stickelberger annihilation and global reciprocity, followed by `(1−j)` and Rubin’s local functional `λ_m`, give `φ_m`:`J_{F_m}/(F_m×B_{F_m})→ℤ_p`, with `B_F=∏_(w|∞)F_w× ×∏_(w|p){1}×∏_(w∤p∞)O_(F,w)×`, and hence `d_m∈H¹(F_m,ℤ_p)`. Extend the family by the conductor presentation. It has auxiliary norm polynomial `1−x`, is odd under `j`, and has trivial corestriction to the real subfield.

Use the idèle class quotient modulo the local factors away from `p`. Multiplication by `θ̄_m` sends the class-group quotient into the semilocal units modulo the closure of global units. The map `1−j` kills global units modulo torsion in this quotient.

`λ_m` is the actual homomorphism on local units modulo torsion of Rubin Appendix D Definition 1.2. Its compatibility is Lemma `D`.1.4; it is not a freely chosen functional. The coefficient representation here is trivial `ℤ_p`.

The two inputs of this construction are proved first.

Prove `idelicCharacter_equiv`. Let `F` be a number field, `p` a prime, `𝔸_F^×` its ideles, `U_F=∏_{w|p}O_{F,w}^×` its local units at `p` (all of them, not only the principal ones), `Ē_F` the closure of the global units in `U_F`, `A_F` the ideal class group, and `B_F=∏_{w|∞}F_w^× × ∏_{w|p}{1} × ∏_{w∤p∞}O_{F,w}^×`. `(a)` Every continuous homomorphism `𝔸_F^×/F^×→ℤ_p` is trivial on `B_F`, and global reciprocity gives `H¹(F,ℤ_p)=Hom_cts(G_F,ℤ_p)≅Hom_cts(𝔸_F^×/(F^×B_F),ℤ_p)`. `(b)` The map sending an idele to the ideal of its finite components induces an exact sequence `0→U_F/Ē_F→𝔸_F^×/closure(F^×B_F)→A_F→0`. `(c)` For a finite extension `F′/F`, corestriction `H¹(F′,ℤ_p)→H¹(F,ℤ_p)` corresponds to restriction of characters along the inclusion `𝔸_F^×⊆𝔸_{F′}^×`. (Rubin, Chapter III, §4.1, displays (9) and (10), printed p. 40; the corestriction statement in the proof of Proposition III.4.3, printed p. 41, citing Tate's chapter of Cassels–Fröhlich, §11(13).)

Prove it as follows.

1. A continuous character `χ` to `ℤ_p` factors, modulo each `p^k`, through a finite abelian quotient of the idele class group. `TauCetiRoadmap.ClassFieldTheory` Layers 11–12 identify these quotients with the Galois groups of finite abelian extensions, compatibly with refinement, which gives the isomorphism with `Hom_cts(G_F,ℤ_p)`.
2. `χ` kills `B_F`. On `F_w^×` for real `w`, the connected subgroup `ℝ_{>0}` is divisible and `{±1}` is finite, and `ℤ_p` has neither nonzero divisible subgroups nor torsion; complex places are connected. For `w∤p`, `O_{F,w}^×` is a finite group times a pro-`ℓ` group with `ℓ≠p`, which has no nontrivial continuous homomorphism to `ℤ_p`.
3. `(b)`: the ideal map is onto. An idele class in its kernel is represented by an idele with unit components at every finite place; modulo `B_F` only its components at `p` remain, and two such are identified exactly by a global unit. The closure is taken because continuous characters factor through the Hausdorff quotient.
4. `(c)`: on `Hom(G^ab,ℤ_p)`, corestriction is composition with the transfer `G_F^ab→G_{F′}^ab` (`TauCetiRoadmap.ProfiniteCohomology` Layer 6: evaluate the explicit transversal formula for corestriction on a homomorphism), and the transfer corresponds to the inclusion of idele classes under reciprocity (`TauCetiRoadmap.ClassFieldTheory` Layers 4 and 11, compatibility in towers).

**Checks for `idelicCharacter_equiv`.**

- For `F=ℚ` and odd `p`, `A_ℚ=0` and `U_ℚ/`Ē`_ℚ=ℤ_p^×/{±1}`, so `H¹(ℚ,ℤ_p)≅Hom(ℤ_p^×/{±1},ℤ_p)≅ℤ_p`. This is the single `ℤ_p`-extension of `ℚ`.
- Replacing `U_F` by its principal units changes the left term of `(b)` by the residue roots of unity of order prime to `p`. This is invisible to `ℤ_p`-valued characters but makes the sequence `(b)` wrong.
- A character nontrivial on `O_{F,w}^×` for some `w∤p` would be ramified at `w`; at `p=2` and a real place, the sign character of `ℝ^×` is `ℤ/2`-valued and does not lift to `ℤ_2`.

Prove `rubinLocalFunctional`. Let `p` be an odd prime and `m≥1` prime to `p`, put `N(m)=∏_{ℓ|m}ℓ`, and let `g_m∈ℤ_p[μ_m][[X]]^×` be the unique series with `g_m≡1 mod (p,X)` and `log g_m=G_m`, for Rubin's series `G_m` of Appendix D, §1 (Lemma `D`.1.`1(i)`–(ii), printed p. 164). For `n≥0` put `α_{mp^n}=∏_{d|m, N(m)|d} g_d^{Fr_p^{−n}}(ζ_{p^n}−1)∈ℤ_p[μ_{mp^n}]^×`. Then `N(α_{mp^{n+1}})=α_{mp^n}` for `n≥1` and `N(α_{mp})=α_m^{1−Fr_p^{−1}}` (Lemma `D`.1.`1(v)`). For a prime `P` of `ℚ(μ_m)` above `p`, let `α_{m,P}` be the image of `(α_{mp^n})_{n≥1}` in the Galois group of the maximal abelian extension of `ℚ(μ_{mp^∞})_P` under local reciprocity. Define `λ_{mp^n}`:`ℤ_p[μ_{mp^n}]^×→ℤ_p` by requiring, for every `k≥1`,

```text
∏_{P|p} (u_P^{1/p^k})^{α_{m,P} − 1} = ζ_{p^k}^{m·λ_{mp^n}(u)}.
```

Then `(i) λ_{mp^n}` is a homomorphism that kills torsion; (ii) `λ_{mp^n}(u)=p^{−n}Tr_{ℚ_p(μ_{mp^n})/ℚ_p}(x_{mp^n}log_p u)` with Rubin's explicit elements `x_{mp^n}` (Proposition `D`.1.3, printed p. 165); (iii) for every `m≥1` and prime `ℓ`, `λ_{mℓ}` restricted to `ℤ_p[μ_m]^×` is `λ_m` when `ℓ|m` or `ℓ=p`, and `λ_m∘(−Fr_ℓ)` when `ℓ∤mp` (Lemma `D`.1.4, printed p. 165). (Rubin, Appendix D, Lemma 1.1, Definition 1.2, Proposition 1.3 and Lemma 1.4, printed pp. 163–165.) The factor `m` in the defining display is Rubin's normalisation; `m` is a `p`-adic unit, and (ii) holds with it, since Rubin's `x_{mp^n}` carry the factor `m^{−1}`. Rubin's display uses the single root order `p^n`; requiring it for every `k` makes `λ_{mp^n} ℤ_p`-valued.

Prove it as follows.

1. Existence and uniqueness of `g_m`: Coleman's Theorem 24 (Coleman 1979, p. 110), applied as in Lemma `D`.1.`1(i)`–(ii); `log` is injective on `1+(p,X)ℤ_p[μ_m][[X]]` because `p` is odd, so `1+pℤ_p[μ_m]` is torsion-free.
2. The norm relations of the `α`: Lemma `D`.1.1(iv) is a direct computation with the `ζ`-translates, and `(v)` follows from it by injectivity of `log`. Equivalently `g_d` lies in the Coleman norm-fixed subgroup over the unramified ring `ℤ_p[μ_d]`, so the `α` form the interpolated tower of ColemanPowerSeries §§1.117–1.118 at `E=ℚ_p(μ_d)`.
3. `α_{m,P}` is well defined because local reciprocity is compatible with norms (`TauCetiRoadmap.ClassFieldTheory` Layer 7, `artinMap_norm`). It fixes `ℚ(μ_{mp^∞})_P`, which contains all `p`-power roots of unity, so the left side of the display is a `p^k`-th root of unity independent of the chosen root. The values for varying `k` are compatible, which defines `λ` in `ℤ_p`; Kummer theory (`TauCetiRoadmap.ProfiniteCohomology` Layer 9) makes it a homomorphism. A root of unity `u` has its `p^k`-th roots in `ℚ(μ_{mp^∞})_P`, so `λ(u)=0`.
4. (ii) is the explicit reciprocity law of Wiles for the multiplicative group, which Rubin cites from Wiles 1978 and de Shalit, Theorem I.4.2. The public statement used here is Coleman's explicit formula for the norm residue symbol of the multiplicative group over an unramified base `H`, Coleman 1981, Theorem 1, p. 377, with `H=ℚ_p(μ_m)`. Rubin's formula is its specialization to the second argument `α_{mp^n}`, written through the Coleman series `g_d`; carrying out this specialization, including the passage over `k`, is part of this target. No exceptional-derivative or main-conjecture input is used.
5. (iii): the trace relations `Tr_{ℚ_p(μ_{mℓ})/ℚ_p(μ_m)}x_{mℓ}=−Fr_ℓ^{−1}x_m` for `ℓ∤mp` and `=x_m` for `ℓ|m` or `ℓ=p` follow from Lemma `D`.1.1(iii)–(iv), and (ii) turns them into the stated restrictions.

**Checks for `rubinLocalFunctional`.**

- `p=2` is excluded. The constant `−1` lies in `1+(2,X)ℤ_2[μ_m][[X]]` and `log(−1)=0`, so `g≡1 mod (2,X)` and `log g=G_m` determine `g_m` only up to sign, and `α_{m,P}`, hence `λ`, would depend on that choice. Rubin's injectivity claim in the proof of Lemma `D`.1.`1(v)` needs `p` odd; the Stickelberger family of §0.30 uses only odd `p`.
- Dropping the factor `m` from the defining display multiplies `λ_{mp^n}` by `m`. For `m=2` and `p=3` this doubles every value, and (ii) fails, since `x_{2·3^n}` contains the factor `1/2`.

- `ℓ=p` in (iii) is tautological: `λ_{mp^{n+1}}` and `λ_{mp^n}` are defined by the same `α_{m,P}`, so the first restricts to the second.
- For `χ` of conductor `f` prime to `p` with `χ^{−1}ω(p)≠1`, and `u=g_f(0)^{1/f}`, Rubin's computation gives `λ_{f,χ}(u)=χ(−1)(χ(p)−p)Σ_{i≥0}p^iχ(p)^{−i−1}`, where `λ_{f,χ}=Σ_δχ(δ)λ_{δf}`. The geometric series sums to `(χ(p)−p)^{−1}`, so the value is exactly `χ(−1)=±1`. This is why `λ_{f,χ}` generates the `χ^{−1}`-part of `Hom(ℤ_p[μ_f]^×,O)` (Lemma `D`.1.5, printed pp. 165–166).
- An arbitrary `ℤ_p`-valued homomorphism on the local units satisfies no restriction law. For `ℓ∤mp` the factor is `−Fr_ℓ`, not 1; using the inclusion there would give the wrong Euler polynomial in `stickelbergerFamily_corestriction`.

The family itself is constructed as follows.

1. Use the integral Stickelberger annihilator to construct, through the sequence `(b)` of `idelicCharacter_equiv`, the induced map from the idèle class quotient to semilocal units modulo the closure of the global units.
2. Apply `1−j`, then `λ_m` of `rubinLocalFunctional`, obtaining a continuous `ℤ_p`-valued character; `idelicCharacter_equiv`(a) identifies it with a class in `H¹(F_m,ℤ_p)`.
3. Check the norm diagrams using `rubinLocalFunctional`(iii), `idelicCharacter_equiv`(c) and distribution of `θ̄_m`. Proposition III.4.3 gives norm polynomial `1−x`; use the odd projection for the real corestriction.

The API consists of the following statements.

- `stickelbergerFamily_character` (characterisation): Under global class field theory `d_m` is the continuous character `φ_m` constructed from `θ̄_m` and `λ_m`.
- `stickelbergerFamily_corestriction` (compatibility): For auxiliary `q` its raw norm relation is `cor(d_{mq})=(1−Fr_q⁻¹)d_m`.
- `stickelbergerFamily_odd` (simp): `j` acts by `−1`; corestriction to `F_m⁺` is zero.

These interfaces are used in Rubin IX Example 6.2: Provides the actual input to Euler-factor replacement. §F.5: Checks replacement on a norm-compatible arithmetic family.

**Checks.**

- `stickelberger_one` (degenerate): `θ_1=0`, so the corresponding raw initial character is zero.
- `stickelberger_even` (value): Every even character component of `d_m` vanishes for odd `p`.
- `stickelberger_euler_factor` (non-example): The raw factor is `1−x`. It differs from `1−q⁻¹x` at every auxiliary `q`; calling the raw family an Euler system for trivial `ℤ_p` coefficients misses this factor.
- The class corresponds to the displayed actual idèle character under global reciprocity.
- The raw norm polynomial is `1−x`, including the restriction compatibility of `λ_m`.
- Even components vanish and the real corestriction is zero.

See **RUBIN-ES**, Chapter III §4.1–4.3, printed pp. 40–42; Appendix D Lemma 1.1, Definition 1.2, Proposition 1.3, Lemmas 1.4–1.5, printed pp. 164–166. The raw Stickelberger family used by IX Example 6.2 has trivial, rather than Tate-twisted, coefficients. **COLEMAN-1979**, Theorem 24, p. 110. The series `g_m`. **COLEMAN-1981**, Theorem 1, p. 377. The explicit formula behind Proposition `D`.1.3.

*Needs:* [§0.29](#stickelberger-annihilator); ColemanPowerSeries §§1.117–1.118; `TauCetiRoadmap.ClassFieldTheory Layers 4, 7, 11 and 12`; `TauCetiRoadmap.ProfiniteCohomology` Layers 5, 6 and 9; §F.3.

<a id="euler-factor-variant"></a>
### 0.31 Euler-factor replacement for the Stickelberger family
For the preceding raw family `d`, apply the Euler-factor replacement of §F.5 with `f_q(x)=1−x` and `g_q(x)=1−q⁻¹x`. It produces `c^St_F∈H¹(F,ℤ_p)`, an Euler system for (`ℤ_p,𝒦_b`,pb), with `𝒦_b=∪_{(m,b)=1}ℚ(μ_m)` the maximal abelian extension unramified at every prime dividing `b`. It agrees with `d_F` on the finite fields whose ramification is supported on pb, in particular at the permitted `p`-power cyclotomic layers. The operation changes the norm relations and preserves the coefficient representation `ℤ_p`.

`p` is odd, `b` prime to `2p`, and the raw family and permitted fields are those of §0.30. `f_q(0)=g_q(0)=1`.

For trivial `T=ℤ_p`, `T*=ℤ_p(1)`, arithmetic `Fr_q` acts on `T*` by `q`, and `P(Fr_q⁻¹|T*;x)=1−q⁻¹x`. Thus the Euler-factor replacement takes place in the trivial coefficient representation.

Prove this as follows.

1. Instantiate §F.5 (Rubin IX Lemma 6.1) with the displayed two polynomials and the raw Stickelberger family.
2. Use its agreement on fields unramified outside pb. The generic lemma produces the new family in the same `H¹(F,T)`, so `T` remains `ℤ_p`.
3. Verify its conductor-indexed local finite conditions and use the rigidity of the `p`-power subextension to identify it as an Euler system.

The API consists of the following statements.

- `stickelbergerEulerSystem_norm` (compatibility): `cor(c^St_{F(q)})=(1−q⁻¹Fr_q⁻¹)c^St_F` for every permitted auxiliary `q`.
- `stickelbergerEulerSystem_agrees` (simp): `c^St_F=d_F` when `F` is unramified outside pb.
- `stickelbergerEulerSystem_coefficients` (characterisation): Its values lie in `H¹(F,ℤ_p)`; no Kummer identification with `H¹(F,ℤ_p(1))` is asserted.

These interfaces give the arithmetic Euler-factor replacement of Rubin IX Example 6.2. The coefficient representation distinguishes it from the cyclotomic-unit Tate-twist example of §0.17.

**Checks.**

- `factor_variant_agreement` (value): At a permitted `p`-power cyclotomic field, the replacement class equals the raw class.
- `factor_variant_polynomial` (non-example): For `q=2` and `p` odd, the target factor is `1−(1/2)x`, not `1−x`.
- `factor_variant_same_T` (compatibility): Applying the construction to the zero raw family gives the zero family in `H¹(F,ℤ_p)`, with unchanged Galois action.
- Verify congruence of `f_q` and `g_q` modulo `q−1` and preserve the coefficient `T=ℤ_p`.
- At every field unramified outside pb the replacement agrees with the raw family.
- Check the target factor `1−q⁻¹Fr_q⁻¹` at a new auxiliary prime.

See **RUBIN-ES**, Chapter IX §6, Lemma 6.1 and Example 6.2, printed pp. 141–143; Chapter III §4.1, printed pp. 40–42. Changing Euler factors converts the raw Stickelberger family into an Euler system without changing `T`.

*Needs:* [§0.30](#stickelberger-class-family); §F.5; §F.3.

### Examples

For `m=2`, `ℓ=2`, the extension `ℚ(i)/ℚ` has norm `N(1−i)=2`; its
minimal polynomial is `X²+1`. For `m=3`, `ℓ=2`, `ℚ(ζ₆)=ℚ(ζ₃)`,
`ζ₆=−ζ₃²` and `N(ζ₆−1)=ζ₃`. Thus the norm of `ζ−1` needs
the degree sign even though the `1−ζ` distribution is sign-free.
For `p=5`, `c̃₃=−ζ₃` is torsion, but the compatible `p`-power
sequence has absolute norm 5 at every level and is not torsion.
For the sign character of a two-element group in its regular module,
the character sum of `[1]` is `[1]−[s]`, fixing the inverse-character
convention without dividing by the group order.

The following boundary targets are named theorems in `Suggested.lean`, and
each is proved there from the pinned libraries and the two kept
definitions: the cyclotomic norm and degree lemmas for the root
statements, and finite sums over the group for the character sums. The
seventh-root inequality uses the degree 6 of the minimal polynomial. The
proved examples there also test the two kept definitions directly:
trivial-character invariants and the torsion `ℤ/2` case for `chiComponent`,
and the cardinality factor for `chiSum`. None of these
proofs uses an admitted API theorem.

| Named target | Exact boundary statement and location |
|---|---|
| `quartic_norm_sign_test` | For a primitive fourth root `ι` in a characteristic-zero fourth cyclotomic field, both `ℚ`-norms `N(1−ι)` and `N(ι−1)` are 2 (§0.6). |
| `sixthRoot_sub_one_test` | A primitive sixth root in a characteristic-zero field satisfies `ζ−1=ζ²` (§0.6). |
| `chiSum_regular_sign_test` | For a group of order 2 and its nontrivial integral sign character, the sum of the basis vector `[1]` is `[1]−[s]` (§0.19). |
| `chiSum_orderFour_frobenius_test` | If `χ(s)=i` over `ℂ`, the sum of `[1]−[s⁻¹]` is `(1+i)` times the sum of `[1]`, in the left regular representation (§0.20). |
| `seventhRoot_inverse_frobenius_test` | For a primitive seventh root `η` in characteristic zero, `(1+η⁴)(1−η⁴)=1−η`, while replacing the second exponent by 2 fails (§0.5). |
| `chiComponent_domain_test` | For a commutative domain `O` as its own module and `χ(δ)≠1`, the `χ`-eigensubmodule of the trivial representation is zero (§0.18); the `ℤ/2` example rejects extension to arbitrary torsion modules. |

### Dependencies

Mathlib norms, cyclotomic fields and representations; the finite Tau Ceti Kummer map; IntegralIwasawaTheory §§0.1–0.3, 1.1, 1.7 and 4.3; §F.9; Foundation F; §§F.1, F.2; §F.10; PadicMeasuresIwasawaAlgebras §§1.1, 1.3 and 1.7; ColemanPowerSeries §§1.117–1.118; Tau Ceti ClassFieldTheory Layers 4, 6–7 and 11–13; Tau Ceti ProfiniteCohomology Layers 5 and 9. The exact inputs are named at each target.

## Layer 1: Finite-level descent

Apply Rubin's error-tolerant bound to `O(1)⊗χ⁻¹`. Verify its rank-one
hypotheses and the vanishing of its two cohomological errors. The actual
cyclotomic derivatives and their local conditions identify the bound with
a class-group length. The equality of finite indices is a consequence in
Layer 5.

<a id="cyclotomic-hypotheses-and-error-terms"></a>
### 1.1 Hypotheses of Theorem II.2.2 and vanishing of its error terms for the cyclotomic twist
Let `p > 2` and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with conductor `f` and field `L`; `T = O_χ`, `W = D_χ`, `T* = O_{χ^{−1}}(1)`, `W* = T* ⊗ ℚ_p/ℤ_p`. Then `T*` satisfies `Hyp(ℚ, T*)` with `τ = 1`, because `rank_O T* = 1` (Remark II.2.4). For the Euler system `c = c̃^{χ^{−1}}` for (`T*, ℚ^ab`, pf), the field `Ω` of Theorem II.2.2 is `L(μ_{p^∞})`. Both error terms `n_{W*}` and `n*_{W*}` of Theorem II.2.2 vanish: `H¹(Ω/ℚ, W) = 0` because `χ ≠ 1` (Lemma III.1.1`(i)`), and `H¹(Ω/ℚ, W*) = 0` because `χ` is even, so it is not congruent modulo `p` to the odd cyclotomic character (Lemma III.1.1(ii)).

Theorem II.2.2 is applied to `T*` in place of `T`. Its bound is then on `S_{Σ_p}(ℚ, W)`, the dual of `W*` being `W`.

Over `ℚ`, `K(1) = ℚ` and `(O_ℚ^×)^{1/p^∞} ⊂ ℚ(μ_{p^∞})`, since `±1` are `p`-th powers for odd `p`. So `Ω = ℚ(W*)ℚ(μ_{p^∞}) = L(μ_{p^∞})`.

Prove this as follows.

1. Rank one gives `Hyp(ℚ, T*)(i)` with `τ = 1` and (ii) trivially (Remark II.2.4).
2. Lemma III.1.1: since `|Δ|` is prime to `p`, inflation–restriction gives `H¹(Ω/ℚ, k_ρ) = Hom(Gal(Ω/L), k_ρ^Δ)`. This vanishes if `ρ ≢ 1 mod p`, and then `H¹(Ω/ℚ, D_ρ) = 0` by dévissage. Take `ρ = χ`, and `ρ = χ^{−1}ε_cyc`, which is odd while `χ` is even, so `ρ ≢ 1` for `p > 2`.

**Checks.**

- `χ = 1` is excluded: then `H¹(Ω/ℚ, W) ≠ 0` in general.
- An odd `χ` can be congruent to `ε_cyc` (for instance `χ = ω`), which is why `χ` is even here.

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. `Hyp(ℚ, T*)` with `τ = 1`. **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. The vanishing of both error terms. **RUBIN-ES**, Chapter III, Lemma 1.1, printed p. 33. Lemma III.1.1(ii).

*Needs:* [§0.17](#cyclotomic-euler-system); [§0.25](#twisted-class-formula); §F.7.

<a id="chi-units-rank-one-and-index"></a>
### 1.2 `E_L^χ` is free of rank one, and the index of divisibility is the unit index
Let `p > 2` and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with conductor `f` and field `L`; `T = O_χ`, `W = D_χ`, `T* = O_{χ^{−1}}(1)`, `W* = T* ⊗ ℚ_p/ℤ_p`, with `χ(p) ≠ 1`. Then `E_L^χ` is a free `O`-module of rank one, by the Dirichlet unit theorem, since `L` is totally real and `χ ≠ 1` is even. The index of divisibility of the cyclotomic Euler system (Definition II.2.1) is `ind_O(c) = ℓ_O(E_L^χ/C_{L,χ})`. Indeed `L^×/E_L` is torsion-free, so a generator of `C_{L,χ}` is divisible by `p^n` in `H¹(ℚ, T*) ≅ (L^×)^χ` exactly when it is divisible by `p^n` in `E_L^χ`.

The Galois-module form of the unit theorem is needed: `E_L ⊗ ℚ` is the augmentation quotient of `ℚ[Δ]` for totally real `L` (Herbrand–Minkowski). This is IntegralIwasawaTheory §4.3 (`unitRepresentation_augmentation`). Mathlib has the rank statement (`NumberField.Units.finrank_eq`) but not the `Δ`-module structure.

`c_ℚ` generates `C_{L,χ}` when `χ(p) ≠ 1` (§0.27).

Prove this as follows.

1. The `χ`-part of `μ(L) ⊗ ℤ_p` vanishes for odd `p`, so `E_L^χ` is torsion-free.
2. `E_L ⊗ ℚ_p ≅` (augmentation quotient of `ℚ_p[Δ]`) contains each nontrivial character once. So `E_L^χ` has `O`-rank one, and it is free, being torsion-free over a DVR.
3. `H¹(ℚ, T*) ≅ (L^×)^χ` by (3). Since `L^×/E_L` is torsion-free, divisibility of `c_ℚ` in `H¹/`torsion is divisibility in `E_L^χ`. With `c_ℚ` a generator of `C_{L,χ}`, `ind_O(c) = ℓ_O(E_L^χ/C_{L,χ})`.

**Checks.**

- If `χ(p) = 1` then `c_ℚ = 0` and `ind_O(c) = ∞` (Remark II.2.8).

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. `E_L^χ` free of rank one. **RUBIN-ES**, Chapter II, Definition 2.1, printed p. 24. The index of divisibility.

*Needs:* [§0.27](#twisted-class-generates); [§0.24](#chi-cyclotomic-units); [§0.18](#chi-component); [§0.25](#twisted-class-formula) (`restrictionKummer_chiEquiv`); `NumberField.Units.finrank_eq`; IntegralIwasawaTheory §4.3.

<a id="selmer-is-class-group"></a>
### 1.3 The Selmer group of `D_χ` as a class-group dual, and the strict group when `χ(p) ≠ 1`
Prove first `selmer_eq_classGroupDual`. Let `K` be a number field, `χ`:`G_K→O^×` a character of finite order prime to `p`, `L/K` a finite abelian extension of degree prime to `p` through which `χ` factors, `Δ=Gal(L/K)`, `W=D_χ` and `V=Φ_χ`. At every finite place `v`, including `v|p`, take `H¹_f(K_v,V)=(⊕_{w|v}Hom(D_w/I_w,V))^Δ`, the unramified condition of Rubin `I (6)`, and `H¹_f(K_v,W)` its image. Then

```text
S(K, W) ≅ Hom(A_L, D_χ)^Δ = Hom_O(A_L^χ, D),
```

where `A_L` is the ideal class group of `L`. In the cyclotomic tower `K=ℚ_n`, `L=L_n`, the restriction maps `S(ℚ_n,W)→S(ℚ_{n+1},W)` correspond to the duals of the norms `A(L_{n+1})→A(L_n)`, and `S(ℚ_∞,W)=colim_n S(ℚ_n,W)≅Hom_O(A_∞^χ,D)` with `A_∞=lim A(L_n)`. No hypothesis on `χ(p)` is needed. (Rubin, Chapter I, Proposition 6.1 and its proof, printed p. 14; Chapter III, §2.3, display (5), printed p. 35.)

Prove it as follows.

1. `Δ` has order prime to `p` and `G_L` acts trivially on `W`, so inflation–restriction (`TauCetiRoadmap.ProfiniteCohomology` Layer 5) gives `H¹(K,W)≅Hom(G_L,D_χ)^Δ`.
2. Locally, restriction and Shapiro identify `H¹(K_v,W)` with `(⊕_{w|v}Hom(D_w,W))^Δ` and the unramified classes with `(⊕_{w|v}Hom(D_w/I_w,W))^Δ` (§F.2). Each `Hom(D_w/I_w,W)` is divisible because `D_w/I_w` is procyclic and torsion-free, and the averaging operator `|Δ|^{−1}Σ_δδ` preserves divisibility, so `H¹_f(K_v,W)` is exactly this group.
3. Hence `S(K,W)` consists of the `Δ`-equivariant homomorphisms `G_L→D_χ` that kill every inertia group, that is `Hom(Gal(H_L/L),D_χ)^Δ` for the Hilbert class field `H_L`, and reciprocity identifies `Gal(H_L/L)` with `A_L` (`TauCetiRoadmap.ClassFieldTheory` Layer 13).
4. A `Δ`-equivariant homomorphism to `D_χ` kills `(δ−χ(δ))A_L`, so it factors through the `χ`-quotient, which is the `χ`-eigenspace `A_L^χ` because `p∤|Δ|` (§0.18).
5. In the tower, restriction `G_{L_{n+1}}→G_{L_n}` corresponds under reciprocity to the norm on class groups (`TauCetiRoadmap.ClassFieldTheory` Layer 11, compatibility in towers). The direct limit of the duals of the finite groups `A(L_n)` is the dual of their inverse limit.

**Checks for `selmer_eq_classGroupDual`.**

- `L=K` and `χ=1` give `S(K,ℚ_p/ℤ_p)=Hom(A_K,ℚ_p/ℤ_p)`, Rubin `I (4)`.
- The local condition at `p` matters. For `K=ℚ(√−5)` and `p=2`, `A_K≅ℤ/2` is generated by the class of the prime above 2, so `S(K,ℚ_2/ℤ_2)≅ℤ/2`, while the group with the strict condition at 2 is the dual of `A_K` modulo that class, which is 0.
- In the tower the transition maps are restrictions on the Selmer side and norms on the class side. Using extension of ideals instead would compute the dual of the direct limit of class groups, which is a different module (IntegralIwasawaTheory §2.4).

Now let `χ` : `G_ℚ → O^×` be even, nontrivial, of finite order prime to `p`, with conductor `f` and field `L`; `T = O_χ`, `W = D_χ`, `T* = O_{χ^{−1}}(1)`, `W* = T* ⊗ ℚ_p/ℤ_p`, with `χ(p) ≠ 1`. Then `H¹_f(ℚ_p, W) = 0`, so `S_{Σ_p}(ℚ, W) = S(ℚ, W) ≅ Hom_O(A_L^χ, D)`, where `A_L` is the ideal class group of `L`.

Prove this as follows.

1. By Lemma I.3.2`(i)`, `H¹_ur(ℚ_p, V) = V^I/(Fr_p − 1)V^I = V^I/(χ(p) − 1)V^I`, which is 0 since `χ(p) ≠ 1`. If `p | f` then `V^I = 0` already.
2. The finite local subgroup at `p` is zero. Imposing the strict zero condition there therefore gives `S_{Σ_p}(ℚ,W)=S(ℚ,W)`; an upper-script `S^{Σ_p}` would relax that condition and is a different group.
3. `selmer_eq_classGroupDual` with `K=ℚ` gives `S(ℚ, W) ≅ Hom(A_L, D_χ)^Δ = Hom_O(A_L^χ, D)`.

**Checks.**

- If `χ(p)=1`, `H¹_f(ℚ_p,W)` can be nonzero. The strict group `S_{Σ_p}` is a subgroup of `S`, and their equality requires a separate local calculation. The relaxed group `S^{Σ_p}` contains `S`.

See **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. The local computation at `p`. **RUBIN-ES**, Chapter I, Proposition 6.1 and its proof, printed p. 14. The Selmer group is the dual of the `χ`-part of the class group.

*Needs:* [§1.1](#cyclotomic-hypotheses-and-error-terms); [§0.18](#chi-component); §F.2; `TauCetiRoadmap.ProfiniteCohomology` Layer 5; `TauCetiRoadmap.ClassFieldTheory` Layers 11 and 13.

<a id="cyclotomic-derivative-classes"></a>
### 1.4 Cyclotomic Kolyvagin derivative classes
Let `p>2`, `T=O(1)⊗χ⁻¹` as in Layer 1, `F` a finite layer of `ℚ∞`, `M=p^k`, and `r` a squarefree product of the `(F,M,T)`-Kolyvagin primes of §F.4, with their chosen cyclic generators `σ_q`. Define `κ^cyc_{F,r,M}=κ_{F,r,M}(c)` by applying the derivative-class construction of §F.6 to the twisted cyclotomic Euler system. Its restriction is the invariant derivative of the Kummer image of the norm-compatible cyclotomic `p`-unit, using `D_r=∏_{q|r}Σ_{i=1}^{|G_q|−1}iσ_q^i` and `D_{r,F}=N_{F(1)/F}D_r`, where `F(1)` is the auxiliary ray-class base field of §F.4. The construction includes the descent map; an invariant class alone is not a class over `F`.

`χ` is even, nontrivial and of finite order prime to `p`. Auxiliary primes satisfy all §F.4 conditions, not merely `q≡1 mod M`.

Use the generic construction’s annihilators and descent when invariants occur. It is not permissible to assert unique descent without its cohomological hypotheses.

Prove this as follows.

1. Substitute the actual Kummer family into §F.6.
2. Check `(σ_q−1)D_q=|G_q|−N_q` and `M` divisibility of the group orders; use the norm relation of §F.3 to obtain the invariant `mod`-`M` derivative.
3. Use the generic descent theorem and its compatibility with restriction/corestriction. Translate the class back to cyclotomic units using the Kummer norm square.

The API consists of the following statements.

- `cyclotomicDerivative_one` (simp): For `r=1` the derivative class is the `mod`-`M` reduction of `c_F`.
- `cyclotomicDerivative_restriction` (compatibility): `res_{F(r)/F}(κ^cyc_{F,r,M})` is the `mod`-`M` image of `D_{r,F}c_{F(r)}`, with `D_{r,F}=N_{F(1)/F}D_r`.
- `cyclotomicDerivative_change_modulus` (compatibility): For `M|M′` the classes reduce compatibly whenever the auxiliary primes satisfy the `M′` conditions.
- `cyclotomicDerivative_zero` (simp): The zero Euler system gives zero derivative classes.

These interfaces are used in §1.5: Transfers the finite/singular relation to cyclotomic units. §1.6: Makes the arithmetic classes used by the general bound explicit.

**Checks.**

- `cycDerivative_one` (degenerate): `r=1` gives the reduction of the original `c_F`, not zero by an empty product convention.
- `cycDerivative_order_three` (value): For a cyclic group of order 3, `D=σ+2σ²` and `(σ−1)D=3−(1+σ+σ²)`.
- `cycDerivative_admissibility` (non-example): If `M` does not divide `|G_q|`, the term `|G_q|` in `(σ_q−1)D_q` need not vanish modulo `M`; such `q` is excluded.
- Restriction is the actual `D_{r,F}` derivative of the Kummer class, rather than a freely postulated lift.
- The `r=1` and change-of-modulus formulas agree with §F.6.
- Check the telescoping identity at a cyclic group of order 3.

See **RUBIN-ES**, Chapter IV §4, Definition 4.1, printed p. 62; Definition 4.10 and Lemma 4.13, printed pp. 66–67. The generic derivative classes are specialized to the cyclotomic-unit Euler system, retaining their actual descent.

*Needs:* [§0.25](#twisted-class-formula); §F.4; §F.6.

<a id="cyclotomic-local-relation"></a>
### 1.5 Local conditions of cyclotomic derivatives
For `κ^cyc_{F,r,M}`, localization lies in `H¹_f`(`F_w,T/`MT) whenever `w∤`pr. If rq is admissible and `q∤r`, then `(κ^cyc_{F,rq,M})^s_q=φ^fs_{q,σ_q}((κ^cyc_{F,r,M})_q)`. Here `φ^fs` is the finite–singular comparison of §F.4 with arithmetic Frobenius, its `Q_q(Fr_q⁻¹)` factor, and evaluation at the same chosen `σ_q`. The generator-independent formula retains the tensor factor `G_q`. In rank one, when `W_M/(Fr_q−1)W_M` is free of rank one over `O/M`, it identifies the orders of these finite and singular classes: over `ℚ` this is §F.6`(c)`, and over `F` the comparison is the direct sum of the same isomorphism over the primes of `F` above `q`, which split completely in `F`. No finite condition at `p` follows solely from this theorem.

Use precisely the admissible primes and modulus of §1.4. Local groups, comparison maps and their normalisations are proved in §F.4.

Prove this as follows.

1. Apply the generic derivative-local-properties theorem to the actual cyclotomic family.
2. Use the Kummer norm and residue maps to read its finite/singular relation as the valuation/residue relation for cyclotomic derivatives. Keep the same arithmetic Frobenius convention.
3. At primes above `p` use only the local condition actually supplied by the chosen Euler system. The stronger `p`-finiteness in IX Theorem 1.2 needs an additional argument and is not smuggled into this result.

**Checks.**

- For `r=1` recover finiteness away from `p`.
- For a single auxiliary prime `q` check the finite–singular equality using the same generator in `D_q` and `φ^fs_q`.
- No conclusion at `p` is accepted without its separate local input.

See **RUBIN-ES**, Chapter IV Theorems 5.1 and 5.4, Corollary 5.5, printed pp. 67–68. The general local relation controls precisely the local conditions required in the cyclotomic descent.

*Needs:* [§1.4](#cyclotomic-derivative-classes); §F.4; §F.6.

<a id="kolyvagin-class-group-divisibility"></a>
### 1.6 Kolyvagin's bound: `|A_L^χ|` divides `[E_L^χ : C_{L,χ}]` (Rubin, Theorem III.2.3)
Let `p > 2` and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with conductor `f` and field `L`; `T = O_χ`, `W = D_χ`, `T* = O_{χ^{−1}}(1)`, `W* = T* ⊗ ℚ_p/ℤ_p`, with `χ(p) ≠ 1`. Then `|A_L^χ|` divides `[E_L^χ : C_{L,χ}]`.

Theorem II.2.2 (the error-tolerant Euler-system bound, `p > 2`) is proved in §F.7, with its derivative classes and Chebotarev inputs (Layers 1 and 3 there). The derivative descent, Chebotarev selection and duality proof are targets of §§F.4–F.7.

Mazur–Wiles proved it first; this proof is Kolyvagin's.

Prove this as follows.

1. Theorem II.2.2 for `T*`, with the cyclotomic Euler system `c`: `ℓ_O(S_{Σ_p}(ℚ, W)) ≤ ind_O(c) + n_{W*} + n*_{W*}`.
2. The error terms vanish (§1.1), and `ind_O(c) = ℓ_O(E_L^χ/C_{L,χ})` (§1.2).
3. `S_{Σ_p}(ℚ, W) = Hom_O(A_L^χ, D)` (§1.3), whose length is that of `A_L^χ`. Lengths over `O` give divisibility of orders.

**Checks.**

- `χ(p) = 1`: `c_ℚ = 0`, so Theorem II.2.2 gives nothing (Remark III.2.5); Layers 2–3 handle it through the main conjecture.
- `p | ord χ`: the Selmer group is no longer exactly the class group (Remark III.2.5).

See **RUBIN-ES**, Chapter III, the paragraph before Theorem 2.3, printed p. 35. Attribution. **RUBIN-ES**, Chapter III, proof of Theorem 2.3, printed p. 36. The end of the proof.

*Needs:* [§1.1](#cyclotomic-hypotheses-and-error-terms); [§1.2](#chi-units-rank-one-and-index); [§1.3](#selmer-is-class-group); §F.7; [§1.5](#cyclotomic-local-relation).

### Examples

At `r=1` the derivative is the original class reduced modulo `M`.
For a cyclic group of order 3, `D=σ+2σ²` and `(σ−1)D=3−(1+σ+σ²)`.
If `M` does not divide the group order, the first term need not vanish,
so descent excludes that prime. When `χ(p)=1` the `p`-extended initial
class is zero and this finite bound alone gives no information.

### Dependencies

Layer 0; Foundation F; IntegralIwasawaTheory §4.3; §F.2; Tau Ceti ProfiniteCohomology Layer 5; Tau Ceti ClassFieldTheory Layers 11 and 13. The exact inputs are named at each target.

## Layer 2: Iwasawa divisibility

Pass from finite cyclotomic classes to the inverse-limit index. The local
multiplicative module and the unit diagram track the augmentation factor
when `χ(p)=1`. Abelian Leopoldt removes that factor from the class-module
divisibility.

<a id="iwasawa-hypotheses-cyclotomic"></a>
### 2.1 Hypotheses of the Iwasawa-theoretic Euler-system theorems over `ℚ_∞`
Let `p` an odd prime and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with field `L`, `Λ = O[[Gal(ℚ_∞/ℚ)]]` and `J = char(O)` its augmentation ideal, and `T* = O_{χ^{−1}}(1)`. The cyclotomic `ℤ_p`-extension `ℚ_∞/ℚ` has `Gal ≅ ℤ_p`, and no finite prime splits completely in it. `Hyp(ℚ_∞, T*)` holds with `τ = 1`, because `rank_O T* = 1`. `Hyp(ℚ_∞/ℚ)` holds because `K = ℚ` is totally real and Leopoldt's conjecture holds for `ℚ`. So Rubin's Theorem II.3.3 applies to the cyclotomic Euler system `c`: `char(X_∞)` divides `ind_Λ(c)`.

Theorems II.3.2–II.3.4 and Proposition II.3.7 are proved in §F.8.

Theorem II.3.3 itself also holds for `p = 2` (Remark III.2.5), but `p = 2` for the cyclotomic main conjecture is left to Greither (Layer 4).

Prove this as follows.

1. Rank one gives `Hyp(ℚ_∞, T*)(i)` with `τ = 1` and (ii) trivially.
2. Rubin notes that `Hyp(K_∞/K)` is satisfied if `K = ℚ`; over `ℚ`, `O_ℚ^× = {±1}` is finite, so Leopoldt holds trivially.
3. Every finite prime `q ≠ p` is finitely decomposed in `ℚ_∞` (`Frob_q` generates an open subgroup), and `p` is totally ramified.

**Checks.**

- `χ` need not satisfy `χ(p) ≠ 1` here; the `χ(p) = 1` case enters only through the augmentation terms (§2.4).

See **RUBIN-ES**, Chapter II §3, Hypothesis `Hyp(K∞/K)`, printed p. 27. `Hyp(ℚ_∞/ℚ)`. **RUBIN-ES**, Chapter II §3, Theorem 3.3, printed p. 28. The general divisibility theorem. **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. Its application to `T*`.

*Needs:* [§1.1](#cyclotomic-hypotheses-and-error-terms); §F.8; IntegralIwasawaTheory §§0.1, 0.3; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

<a id="limit-unit-diagram"></a>
### 2.2 The limit of units, local units and cyclotomic units (Rubin, Proposition III.2.6)
Prove first `localUnitLimit_rank_one`. Let `p` be odd, `L` a real abelian field with `p∤[L:ℚ]`, `Δ=Gal(L/ℚ)`, identified with `Gal(L_n/ℚ_n)`, `Γ=Gal(L_∞/L)` with generator `γ` and `ω_n=γ^{p^n}−1`, and `O′` a finite unramified extension of `ℤ_p` containing the values of the characters of `Δ`. For a character `ψ` of `Δ` write `M^ψ` for the `ψ`-eigenspace of `M⊗O′`. Let `U_n` and `Y_n` be the `p`-adic completions of the principal semilocal units of `L_n⊗ℚ_p` and of `(L_n⊗ℚ_p)^×`, `U_∞` and `Y_∞` their norm limits, `E′_n` the `p`-units of `L_n` and `E′_∞` the norm limit of their completions. Then:

`(a)` For `m≥n` the norm induces an exact sequence `0→(Y_m)_{Gal(L_m/L_n)}→Y_n→⊕_{w|p}Gal(L_{m,w}/L_{n,w})→0`. In the limit, `Y_∞/ω_nY_∞→Y_n` is injective with cokernel `R_n=⊕_{w|p}Gal(L_{∞,w}/L_{n,w})≅ℤ_p[Δ/Δ_p]`, on which `Γ` acts trivially; `Δ_p` is the decomposition group of `p`. Hence `R_n^ψ=0` if `ψ(p)≠1` and `R_n^ψ≅O′` if `ψ(p)=1`.

`(b) U^ψ_∞` and `Y^ψ_∞` are finitely generated `O′[[Γ]]`-modules of rank one.

`(c) (E′_∞)^ψ` embeds in `Y^ψ_∞` and is `Λ`-torsion-free; when it is nonzero it has rank one.

Rubin quotes Iwasawa's Theorem 25 (in *On `ℤ_l`-extensions of algebraic number fields`*, Ann`. of Math. 98 (1973)) for the stronger statement that `Y^χ_∞` is torsion-free of rank one (proof of Theorem III.2.7, printed p. 38). Only `(b)` and `(c)` are used here, and `Y^ψ_∞` itself can have `Λ`-torsion; see the first Check.

Prove this as follows.

1. `(a)` For `w|p` the extension `L_{m,w}/L_{n,w}` is cyclic and totally ramified, because `[L_w:ℚ_p]` is prime to `p` and `p` is totally ramified in the cyclotomic tower (Mathlib `IsCyclotomicExtension.Rat.ramificationIdx_eq_of_prime_pow`, in the form recorded in the Mathlib contract). Tate cohomology of its multiplicative group gives `0→Ĥ^{−1}→(Y_m)_G→Y_n→Ĥ^0→0`. Hilbert's Theorem 90 (`groupCohomology.exists_div_of_norm_eq_one`) makes `Ĥ^{−1}` zero. Local reciprocity (`localArtinEquiv`, `TauCetiRoadmap.ClassFieldTheory` Layer 6) identifies `Ĥ^0=L_{n,w}^×/N(L_{m,w}^×)` with `Gal(L_{m,w}/L_{n,w})`, and the units map onto it: the extension is totally ramified, so the norm of a uniformizer of `L_{m,w}` is a uniformizer of `L_{n,w}`, and every class modulo norms is represented by a unit. (Layer 7 there gives the compatible statement that units map into inertia, `mem_inertiaSubgroup_of_mk_eq_artinMap`.) The modules are compact, so the limit over `m` is exact. `Γ` fixes every `w` and acts trivially on `R_n`, and `Δ` permutes the summands.
2. `(b) U_∞` is finitely generated (IntegralIwasawaTheory §2.4, `principalUnitLimit_finite`). At level `n` the `p`-adic logarithm maps `U_n`, with finite kernel, onto a lattice in `L_n⊗ℚ_p`, which is free of rank one over `ℚ_p[Gal(L_n/ℚ)]` by the normal basis theorem (`IsGalois.normalBasis`). So `U^ψ_n` has `O′`-rank `p^n`. By `(a)` and the valuation sequence `0→U^ψ→Y^ψ→ℤ_p[Δ/Δ_p]^ψ→0`, on which `ω_n` acts on the last term by zero, the `O′`-rank of `U^ψ_∞/ω_nU^ψ_∞` is `p^n+O(1)`. By the structure theorem (PadicMeasuresIwasawaAlgebras §4.2) a finitely generated module whose `ω_n`-quotients have rank `p^n+O(1)` has `Λ`-rank one; a torsion module has bounded ranks there. `Y^ψ_∞` differs from `U^ψ_∞` by `O′` or 0.
3. `(c)` By abelian Leopoldt (IntegralIwasawaTheory §4.4) the completed `p`-units of `L_n` inject into `Y_n`, and inverse limits are left exact. Let `x=(x_n)∈(E′_∞)^ψ` with `f·x=0` for a nonzero `f∈O′[[Γ]]`. Each `(E′_n)^ψ` is a free `O′`-module of finite rank, since `L_n` is totally real and `p` is odd. On its component for a character `ρ` of `Γ/Γ_n`, `f` acts by the scalar `f(ρ(γ)−1)`, and `f` has finitely many zeros in the open disc. So every `x_n` lies in the components for a finite set of characters factoring through `Γ/Γ_k`, with `k` fixed. For `n≥k` and `j≥0`, extension of units composed with the norm from `L_{n+j}` to `L_n` is the trace of `Gal(L_{n+j}/L_n)`, which acts on those components as `p^j`. Hence the image of `x_n` in `E′_{n+j}⊗O′` equals `p^jx_{n+j}`. A `p`-unit `u` of `L_n` that is a `p^j`-th power `v^{p^j}` in `L_{n+j}` is a `p^j`-th power in `L_n`: the conjugates of `v` over `L_n` are `ζv` with `ζ` a `p^j`-th root of unity in the totally real field `L_{n+j}`, so `ζ=1` and `v∈L_n`. Therefore `x_n` is divisible by `p^j` in `(E′_n)^ψ` for every `j`, and `x_n=0`.

**Checks for `localUnitLimit_rank_one`.**

- Torsion-freeness of `Y^χ_∞` itself fails. For `L=ℚ(√6)` and `p=3`, `ℚ_3(√6)=ℚ_3(√−3)` because `−2` is a 3-adic square, so the completions of `L_n` are `ℚ_3(μ_{3^{n+1}})`. Their roots of unity have norm limit `ℤ_3(1)`, on which the nontrivial element of `Δ` acts by `−1` and `γ` by its cyclotomic character. This is a `Λ`-torsion submodule of `Y^χ_∞`. By `(c)`, no norm-coherent sequence of real `p`-units lies in it.
- For `χ` quadratic of conductor 5 and `p=3`, `χ(3)=−1`, so `R^χ_n=0` and `U^χ_∞=Y^χ_∞`. For `p=11`, `χ(11)=1` and the valuation line `O′` appears.
- The module `ℤ_p` with trivial `Γ`-action has `ℤ_p`-rank one in every `ω_n`-quotient and `Λ`-rank zero. Rank one requires the growth `p^n` of the ranks, not just their nonvanishing.

Now let `p` be an odd prime and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with field `L`, `Λ = O[[Gal(ℚ_∞/ℚ)]]` and `J = char(O)` its augmentation ideal. With `A_∞`, `E_∞`, `C_{∞,χ}`, `U_∞`, `Y_∞ = lim (L_{n,p})^` and `E′_∞ = lim (E′_n)^` (`p`-units) the norm inverse limits: `(i)` the restriction isomorphisms identify `Λ{c_{ℚ_n}} ⊂ H¹_∞(ℚ, T*) ⊂ H¹_∞(ℚ_p, T*) ↠ H¹_{∞,s}(ℚ_p, T*)` with `C_{∞,χ} ⊂ (E′_∞)^χ ⊂ Y_∞^χ ↠ Y_∞^χ/U_∞^χ`; (ii) `Y_∞^χ/U_∞^χ ≅ ℤ_p[Δ/Δ_p]^χ`, which is 0 if `χ(p) ≠ 1` and `O` if `χ(p) = 1`; (iii) `(E′_∞)^χ/E_∞^χ` injects into `O`.

The injectivity of `(E′_∞)^χ → Y_∞^χ` uses Leopoldt's conjecture for the real abelian field `L` (Brumer, Ax), which is known.

`H¹_∞(ℚ, T*) = lim S^{p}(ℚ_n, T*)`, the limit of the Selmer groups relaxed at `p`: §F.1(ii)–(iii) (Rubin, Corollaries `B`.3.4–`B`.3.5, printed p. 155) makes every norm-coherent family unramified at each prime with infinite decomposition group in `ℚ_∞/ℚ`. Every prime `ℓ≠p` is such (IntegralIwasawaTheory §0.3, `cyclotomic_no_finite_prime_splits_completely`), and `H¹_ur⊆H¹_f` away from `p` (§F.2).

Prove this as follows.

1. The image of `c_{ℚ_n}` in `(L_n^×)^χ` is `ξ_{n,χ}` (Lemma II.4.3, as for (4)), which gives the left-hand isomorphism.
2. `S^{p}(ℚ_n, T*) ≅ (E′_n)^χ` by `restrictionKummer_chiEquiv` (§0.25), whose local form gives `H¹(ℚ_{n,p}, T*) ≅ (L_{n,p}^×)^χ ⊃ H¹_f ≅ U_n^χ`; the inclusion into `Y^χ_∞` is `localUnitLimit_rank_one`(c).
3. (ii): `L_{m,p}^×/U_m ≅ ⊕_{w|p} ℤ ≅ ℤ[Δ/Δ_p]` compatibly with norms, since every `w|p` is totally ramified in `L_∞/L` (`localUnitLimit_rank_one`(a)), and `ℤ_p[Δ/Δ_p]^χ ≠ 0` exactly when `χ` is trivial on `Δ_p`, that is `χ(p) = 1`.
4. (iii): `E_∞^χ` is the kernel of `(E′_∞)^χ → Y_∞^χ/U_∞^χ`.

**Checks.**

- `χ(p) ≠ 1`: `Y_∞^χ = U_∞^χ` and `(E′_∞)^χ = E_∞^χ`.
- `χ(p) = 1`: both quotients are at most `O`, and these are the augmentation corrections.

See **RUBIN-ES**, Chapter III, Proposition 2.6, printed p. 37. Part (iii). **RUBIN-ES**, Chapter III, proof of Proposition 2.6, printed p. 38. Part (ii).

*Needs:* [§0.24](#chi-cyclotomic-units); [§0.22](#chi-cyclotomic-generator); [§0.25](#twisted-class-formula) (`restrictionKummer_chiEquiv`); §§F.2, F.1; IntegralIwasawaTheory §§0.3, 2.4; PadicMeasuresIwasawaAlgebras §§4.6 and 4.2 (the characteristic ideal; the structure theorem); IntegralIwasawaTheory §4.4; `groupCohomology.exists_div_of_norm_eq_one`; `IsGalois.normalBasis`; `TauCetiRoadmap.ClassFieldTheory Layers 6–7`.

<a id="lambda-index-of-cyclotomic-units"></a>
### 2.3 The `Λ`-index of the cyclotomic Euler system
Let `p` an odd prime and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with field `L`, `Λ = O[[Gal(ℚ_∞/ℚ)]]` and `J = char(O)` its augmentation ideal. Then `(E′_∞)^χ` is a torsion-free, finitely generated `Λ`-module of rank one, `ind_Λ(c) = char((E′_∞)^χ/C_{∞,χ})`, and `ind_Λ(c)` divides `J·char(E_∞^χ/C_{∞,χ})`.

`Y_∞^χ` is finitely generated and of rank one over `Λ`, and `(E′_∞)^χ` is torsion-free, by `localUnitLimit_rank_one` (§2.`2(b)`–`(c)`). Rubin cites Iwasawa's Theorem 25 for torsion-freeness of `Y_∞^χ` itself, which is not used and can fail (§2.2, first Check).

Prove this as follows.

1. `(E′_∞)^χ` is a nonzero `Λ`-submodule of `Y_∞^χ`, torsion-free by §2.`2(c)`, so it has rank one.
2. Proposition III.2.6`(i)` identifies `c_{ℚ,∞}` with a generator of `C_{∞,χ}` inside `(E′_∞)^χ ≅ H¹_∞(ℚ, T*)`. So `ind_Λ(c) = {φ(c) : φ ∈ Hom_Λ(H¹_∞, Λ)} = char((E′_∞)^χ/C_{∞,χ})`.
3. By Proposition III.2.6(iii), `char((E′_∞)^χ/E_∞^χ)` divides `char(O) = J`, and multiplicativity of `char` gives the divisibility.

**Checks.**

- `χ(p) ≠ 1`: `(E′_∞)^χ = E_∞^χ` and `ind_Λ(c) = char(E_∞^χ/C_{∞,χ})` exactly.

See **RUBIN-ES**, Chapter II, Definition 3.1, printed p. 28. The `Λ`-index. **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. The index computation.

*Needs:* [§2.2](#limit-unit-diagram) (`localUnitLimit_rank_one`); [§2.1](#iwasawa-hypotheses-cyclotomic); PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal); §F.8.

<a id="cyclotomic-iwasawa-divisibility"></a>
### 2.4 Divisibility of characteristic ideals: `char(A_∞^χ)` divides `char(E_∞^χ/C_{∞,χ})` (Rubin, Theorem III.2.7)
Let `p` an odd prime and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with field `L`, `Λ = O[[Gal(ℚ_∞/ℚ)]]` and `J = char(O)` its augmentation ideal. Then `char(A_∞^χ)` divides `char(E_∞^χ/C_{∞,χ})`, where `A_∞ = lim A_n` is the inverse limit of the `p`-parts of the class groups of `L_n`. No hypothesis on `χ(p)` is needed.

Theorem II.3.3 and Proposition II.3.7 are proved here (§F.8). `Hom_O(S(ℚ_∞, W), D) ≅ A_∞^χ` is Rubin's (5), proved in §1.3 (`selmer_eq_classGroupDual`).

Leopoldt's conjecture for the real abelian field `L` is used to exclude `J` from `char(A_∞^χ)`.

The Iwasawa limit of the ordinary finite-condition Selmer group is the class-group dual for all `χ`, by the tower clause of `selmer_eq_classGroupDual` (§1.3). Do not use §1.3’s strict-at-`p` comparison here: that target assumes `χ(p)≠1`.

Prove this as follows.

1. Theorem II.3.3 with Proposition II.3.7: `char(Hom_O(S(ℚ_∞, W), D))` divides `ind_Λ(c)·char(H¹_{∞,s}(ℚ_p, T*))`.
2. `ind_Λ(c)` divides `J·char(E_∞^χ/C_{∞,χ})` (§2.3), and `char(H¹_{∞,s}(ℚ_p, T*)) = char(Y_∞^χ/U_∞^χ)` divides `J` (Proposition III.2.6(ii)). So `char(A_∞^χ)` divides `J²·char(E_∞^χ/C_{∞,χ})`.
3. `J` does not divide `char(A_∞^χ)`. `J | char(A_∞^χ)` iff `A_∞^χ/JA_∞^χ = Gal(M_∞/L_∞)^χ` is infinite, with `M_∞/L` abelian. `L` is real abelian, so Leopoldt holds and `L` has no `ℤ_p²`-extension. So `Gal(M_∞/L)` has `ℤ_p`-rank one and `[M_∞ : L_∞]` is finite ([Iw3] §3.1).
4. Since `J` is a height-one prime of the UFD `Λ`, coprime to `char(A_∞^χ)`, the `J²` can be removed.

**Checks.**

- `χ(p) ≠ 1`: the `J`-terms are units and step 3 is not needed.
- `χ(p) = 1`: both `J`-factors are present and step 3 removes them. This is the augmentation correction the roadmap asks for.

See **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. The reduction to `J ∤ char(A_∞^χ)`. **RUBIN-ES**, Chapter III, proof of Theorem 2.7, printed p. 38. The Leopoldt step.

*Needs:* [§2.3](#lambda-index-of-cyclotomic-units); [§2.2](#limit-unit-diagram); [§2.1](#iwasawa-hypotheses-cyclotomic); §F.8; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal); IntegralIwasawaTheory §4.4; [§1.3](#selmer-is-class-group) (`selmer_eq_classGroupDual`).

### Examples

If `χ(p)≠1` the valuation permutation module contributes no `χ`-part,
so `E′∞χ=E∞χ` and the augmentation correction disappears already
from the unit diagram. If `χ(p)=1`, its `χ`-part is `O`; the possible
correction is `J=(T)`, and abelian Leopoldt, rather than the finite
`χ(p)≠1` bound, removes `J` from the class characteristic ideal.

### Dependencies

Layers 0–1; Foundation F; IntegralIwasawaTheory §§0.1, 0.3, 2.4 and 4.4; §§F.2, F.1; PadicMeasuresIwasawaAlgebras §§4.2, 4.4, 4.6 and 4.7; Tau Ceti ClassFieldTheory Layers 6–7; Mathlib's Hilbert 90 and normal basis theorem. The exact inputs are named at each target.

## Layer 3: Equality and the odd-prime main conjecture

Compare semilocal units modulo circular units and the `p`-ramified module
with their finite layers, with errors bounded independently of the layer,
and combine this with Sinnott's stable circular-unit index; the global
units modulo circular units and the class modules also descend with
uniformly bounded errors. Componentwise divisibility makes the integral
quotients have nonnegative `μ` and `λ`; equality of their totals and
Weierstrass preparation make those quotients units. The four-term sequence
then identifies the analytic characteristic ideal.

<a id="galois-unit-four-term-sequence"></a>
### 3.1 The four-term sequence `0 → E⁺/C⁺ → U⁺/C⁺ → X⁺ → Y⁺ → 0` (RJW 13.13–13.14)
Let `p` an odd prime, `F_n = ℚ(μ_{p^n})`, `F_∞^+ = ∪F_n^+`, `G^+ = Γ^+ = Gal(F_∞^+/ℚ)`, `Λ = Λ(Γ^+)`, and `U^+_{∞,1}`, `E^+_{∞,1}`, `C^+_{∞,1}` the limits of the principal local units, the closures of the global units and of the cyclotomic units in them (RJW Definitions 11.8, 13.12). Let `X_∞^+ = Gal(M_∞^+/F_∞^+)` and `Y_∞^+ = Gal(L_∞^+/F_∞^+)`, where `M_∞^+` (resp. `L_∞^+`) is the maximal abelian pro-`p` extension of `F_∞^+` unramified outside `p` (resp. unramified). Then there is an exact sequence of `Λ`-modules `0 → E^+_{∞,1} → U^+_{∞,1} → Gal(M_∞^+/L_∞^+) → 0` (Proposition 13.13). Hence `Gal(M_∞^+/L_∞^+) ≅ U^+_{∞,1}/E^+_{∞,1} ≅ (U^+_{∞,1}/C^+_{∞,1})/(E^+_{∞,1}/C^+_{∞,1})`, and `0 → E^+_{∞,1}/C^+_{∞,1} → U^+_{∞,1}/C^+_{∞,1} → X_∞^+ → Y_∞^+ → 0` is exact (Corollary 13.14).

Use `U/E ≅ (U/C)/(E/C)`, with `E⊆U` and `C⊆E`. Exactness of the norm inverse limit follows because the finite-level modules are compact Hausdorff and the transition maps are continuous. Finite generation over `ℤ_p` alone does not imply the Mittag–Leffler condition: the inverse system `ℤ_p` with transition maps multiplication by `p` has nonstabilizing images. The global-unit comparison uses Leopoldt for `F_n⁺` and the rank `[F_n⁺:ℚ]−1=p^{n−1}(p−1)/2−1`.

The finite-level sequence `0 → E^+_{n,1} → U^+_{n,1} → Gal(M_n^+/L_n^+) → 0`, which RJW take from Washington, Corollary 13.6, is IntegralIwasawaTheory §2.7 (`finiteGlobalLocalSequence` for `F_n^+`): its term `D_n` vanishes by abelian Leopoldt (IntegralIwasawaTheory §4.4) and its sign term `Σ_n` is zero for odd `p`.

Prove this as follows.

1. Construct the plus-tower modules from IntegralIwasawaTheory §§2.2–2.3 and prove `0→E^+_{∞,1}/C→U^+_{∞,1}/C→X_∞^+→Y_∞^+→0` for every closed `C⊆E^+_{∞,1}`. Take `C=C^+_{∞,1}`, which is closed by definition. The sequence over the real tower is the quotient by `C` of IntegralIwasawaTheory §2.7 (`infiniteGlobalLocalSequence` with `Σ_∞=0`, and `unitLimit_eq_limit_closures`), and IntegralIwasawaTheory §3.5 (`rjwModuleDictionary`) identifies its `p`-ramified and everywhere-unramified Galois groups with RJW’s `X∞⁺` and `Y∞⁺`.
2. Use the principal global-unit closure of IntegralIwasawaTheory §2.2 to match `E`, `C` and `U` with RJW’s notation. The quotient is `U/E ≅ (U/C)/(E/C)`. Compactness, rather than finite generation alone, justifies exactness of the norm inverse limit.

**Checks.**

- The orientation check: the printed `E/U` is not a quotient, since `E ⊆ U`.

See **RJW-PADIC-L**, Proposition 13.13 and its proof, p. 68 (arXiv v2). The finite-level sequence. **RJW-PADIC-L**, Proof of Proposition 13.13, p. 68 (arXiv v2). The limit step, repaired by compactness. **RJW-PADIC-L**, Corollary 13.14 and its proof, p. 68 (arXiv v2). The four-term sequence; the quotient orientation is corrected.

*Needs:* [§2.2](#limit-unit-diagram); IntegralIwasawaTheory §§2.2, 2.7, 3.5, 4.4.

<a id="trivial-character-component"></a>
### 3.2 The trivial-character component of the main conjecture
Let `p` an odd prime, `F_n = ℚ(μ_{p^n})`, `F_∞^+ = ∪F_n^+`, `G^+ = Γ^+ = Gal(F_∞^+/ℚ)`, `Λ = Λ(Γ^+)`, and `U^+_{∞,1}`, `E^+_{∞,1}`, `C^+_{∞,1}` the limits of the principal local units, the closures of the global units and of the cyclotomic units in them (RJW Definitions 11.8, 13.12), and let `e₁` be the idempotent of the trivial character of `Δ^+ = Gal(ℚ(μ_p)^+/ℚ)`, so `e₁Λ = ℤ_p[[Γ₀]]` with `Γ₀ ≅ ℤ_p`. Then `e₁X_∞^+ = e₁Y_∞^+ = 0`, and `e₁(I(Γ^+)ζ_p) = e₁Λ`. So both sides of the main conjecture have trivial component the unit ideal. The pole of `ζ_p` at the trivial character is cancelled by the augmentation ideal: for a topological generator a of `ℤ_p^×`, the value of `([a] − [1])ζ_p` at the trivial character is `−(1 − p^{−1})·log_p(a)`, a `p`-adic unit.

`ζ_{p,p−1}` has a simple pole at `s = 1` with residue `(1 − p^{−1})` (RJW Theorem 7.1(ii)), and `lim_{s→1}(s − 1)^{−1}`(⟨a⟩`^{1−s} − 1`) `= −log_p(a)` (Lemma 7.2(ii)).

`log_p(a)` has valuation exactly 1 when a generates `ℤ_p^×` (`p` odd): `a^{p−1}` then generates `1+pℤ_p`, so it lies outside `1+p²ℤ_p` and `v_p(log_p(a^{p−1}))=1`. Hence `(1 − p^{−1})log_p(a) ∈ ℤ_p^×`.

Prove this as follows.

1. `e₁X_∞^+` is the Galois group over `ℚ_∞` of the maximal abelian pro-`p` extension of `ℚ_∞` unramified outside `p`. Its `Γ₀`-coinvariants form the Galois group of the maximal abelian pro-`p` extension of `ℚ` unramified outside `p` over `ℚ_∞`, which is trivial by Kronecker–Weber for odd `p`. By Nakayama, `e₁X_∞^+ = 0`, and so its quotient `e₁Y_∞^+ = 0`.
2. The value of `([a] − [1])ζ_p` at the trivial character is the numerator of (7.1) at `s = 1`, namely the residue `(1 − p^{−1})` times `−log_p(a)`. This is a unit, so `([a] − [1])ζ_p` is a unit of the local ring `e₁Λ`, and `e₁(I(Γ^+)ζ_p) = e₁Λ`.

**Checks.**

- `e₁ζ_p` itself is not in `e₁Λ` (it has a pole); only `I(Γ^+)ζ_p` is an ideal of `Λ` (RJW Proposition 11.5).
- With `e₁X_∞^+ = e₁Y_∞^+ = 0`, the four-term sequence gives `e₁(E/C) ≅ e₁(U/C) ≅ e₁Λ/e₁(I(Γ^+)ζ_p) = 0`.

See **RJW-PADIC-L**, Theorem 7.1(ii), p. 40 (arXiv v2). The residue.

*Needs:* [§3.1](#galois-unit-four-term-sequence); IntegralIwasawaTheory §0.1; `TauCetiRoadmap.ClassFieldTheory Layer 13` (`kroneckerWeber`); PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama); §F.10.

<a id="finite-layer-comparison"></a>
### 3.3 Finite-layer comparison for the unit/class equality
Let `p` be odd, `L` a real abelian field with `p∤[L:ℚ]`, `Δ=Gal(L/ℚ)`, identified with `Gal(L_n/ℚ_n)` for `L_n=Lℚ_n`, and `Γ=Gal(L_∞/L)` with topological generator `γ`, `T=γ−1`, `ω_n=γ^{p^n}−1` and `ν_n=ω_n/T`. Let `O′` be a finite unramified extension of `ℤ_p` containing the values of all characters of `Δ`. For a `ℤ_p[Δ]`-module `M` and a character `ψ` of `Δ` write `M^ψ` for the `ψ`-eigenspace of `M⊗O′`; this functor is exact because `p∤|Δ|`. Lengths `ℓ` are `ℤ_p`-lengths. At level `n` let `E_n`, `U_n` and `Y_n` be the `p`-adic completions of the global units of `L_n`, of the principal semilocal units of `L_n⊗ℚ_p` and of `(L_n⊗ℚ_p)^×`; let `C^S_n` be the `p`-adic completion of Sinnott's circular units of `L_n`, `A_n` the `p`-part of the class group and `𝔛_n=Gal(M_n/L_n)` for the maximal abelian pro-`p` extension `M_n` of `L_n` unramified outside `p`. Let `E_∞`, `U_∞`, `Y_∞`, `C^S_∞` and `A_∞` be the norm limits, `C_{∞,ψ}=lim C_{n,ψ}` with `C_{n,ψ}=O′[Γ/Γ_n]·ξ_{n,ψ}` (§0.24, formed for the field cut out by `ψ` and pushed into `L_n`), and `Z_∞=Gal(M_∞/L_∞)`. For every nontrivial character `ψ` of `Δ`:

`(a)` For every `n≥0`, `(C^S_n)^ψ = C_{n,ψ} + O′·ξ_{0,ψ}`, and `O′·ξ_{0,ψ} ⊆ C_{n,ψ}` when `ψ(p)≠1`. The trivial-character part of `C^S_n` is the completed circular-unit group of `ℚ_n`.

`(b)` If `ψ(p)≠1`, the norm projection induces an isomorphism `U^ψ_∞/(ω_nU^ψ_∞+C_{∞,ψ}) ≅ U^ψ_n/(C^S_n)^ψ`. If `ψ(p)=1`, then `U^ψ_∞=TY^ψ_∞` and `ℓ(U^ψ_n/(C^S_n)^ψ) = ℓ(U^ψ_∞/(ν_nU^ψ_∞+C_{∞,ψ})) + a_ψ` for every `n≥0`, with `a_ψ=ℓ(U^ψ_0/O′ξ_{0,ψ})` independent of `n`. All these modules are finite.

`(c) 𝔛_n^ψ ≅ Z_∞^ψ/ω_nZ_∞^ψ`, a finite group, and `0 ≤ ℓ(Z_∞^ψ/ω_nZ_∞^ψ) − ℓ(Z_∞^ψ/ν_nZ_∞^ψ) ≤ ℓ(𝔛_0^ψ)`.

`(d)` The sums over all nontrivial `ψ` of the `μ`-invariants of `E_∞^ψ/C_{∞,ψ}` and of `A_∞^ψ`, regarded as `ℤ_p[[Γ]]`-modules, are equal, and so are the sums of their `λ`-invariants.

`(e)` The `ψ`-part of `C^S_∞` is `C_{∞,ψ}` (`primitiveCircularLimit_eq`). The natural map `d_n`:`(E_∞/C^S_∞)/ω_n→E_n/C^S_n` has finite kernel and cokernel, with both orders bounded independently of `n`, and its source is finite for every `n` (`circularUnit_descent_bounded`). The correction `ε_n=v_p([E(L_n):C(L_n)])−v_p(h(L_n))` satisfies `|ε_n|≤b_L` for a constant `b_L`, and equals `v_p(c⁺_{L_∞})` for all large `n` (`sinnottCorrection_bounded`). Consequently there is a constant `B` independent of `n` such that, after removing the trivial character, the total `ℤ_p`-lengths of `⊕_ψ(E_∞^ψ/C_{∞,ψ})/ω_n` and of `(E(L_n)/C(L_n))_p` differ by at most `B`, and so do those of `⊕_ψ A_∞^ψ/ω_nA_∞^ψ` and `A_p(L_n)`. Both totals are taken after the same common unramified coefficient extension.

`(f)` `sinnottCorrection_primes`. For an abelian field `k` with Galois group `G`, conductor `m` and Sinnott's lattice `U` of IntegralIwasawaTheory §1.8, and for every positive divisor `s` of the radical of `m` and every `α∈ℚ[G]`, with Sinnott's intermediate lattices `U_s` (`U_1=R, U_s=U` when `s` is the radical of `m`, and the recursion of step 14), the generalized index `(αR:αU_s)` is an integer divisible only by primes dividing the order of the inertia group `T_s`. In particular `(R:U)`, `(e⁺R:e⁺U)` and `(e⁻R:e⁻U)` are integers divisible only by primes dividing `|G|`, and `(e⁺R:e⁺U)(e⁻R:e⁻U)=(R:U)·2^a` for an integer `a≥0` (Sinnott 1980, Lemma 5.1, p. 210, and Proposition 5.1, pp. 211–212).

`(g)` `sinnottStableIndex`. If `k` is real and `k_n` are the layers of its cyclotomic `ℤ_p`-extension `k_∞`, then there is a positive rational number `c⁺_{k_∞}`, depending only on `k_∞`, with `[E(k_n):C(k_n)]=h(k_n)·2^{[k_n:ℚ]}·c⁺_{k_∞}` for all sufficiently large `n`. For the group `C_1(k_n)` of units whose squares lie in `C(k_n)`, `[E(k_n):C_1(k_n)]=h(k_n)·c⁺_{1,k_∞}` for large `n` (Sinnott 1980, Introduction, Theorem, p. 182; Theorem 6.1, p. 226; §7, pp. 232–233).

Modules are finitely generated torsion over each `O′[[T]]` component. Everything is proved for the actual norm limits, independently of the main conjecture. Statement `(d)` is the input of §3.4. Steps 1–8 prove `(a)`–`(d)` by comparing semilocal units modulo circular units and the `p`-ramified module with their finite layers, where the control is exact or has an error independent of `n`; no descent of global units from `E_∞` to `E_n` and no class-side control theorem is used there. Steps 9–13 prove `(e)`, which gives a second proof of `(d)` through global-unit descent. Steps 14–15 prove `(f)` and `(g)`, which steps 3 and 13 use; they involve only the finite lattice and index theory of Sinnott.

Prove this as follows.

1. `(a)` Sinnott's circular numbers `D_n` of `L_n` are generated by `−1` and the norms `N_{ℚ(μ_m)/ℚ(μ_m)∩L_n}(1−ζ_m^a)`, and `C^S_n=D_n∩E(L_n)` (Sinnott 1980, §4, p. 201). Generators with `m` not dividing the conductor `f_0p^{n+1}` of `L_n` (`f_0` the prime-to-`p` part of the conductor of `L`) are rational numbers or, by the distribution relations, products of conjugates of the others; the rational numbers have zero `ψ`-part. The `ψ`-part of `−1` is zero, and a generator has zero `ψ`-projection unless `(ℚ(μ_m)∩L_n)ℚ_n` contains the field `L_ψ` cut out by `ψ`, because otherwise `ψ` is nontrivial on the subgroup of `Δ` fixing the generator; write `f_ψ` for the conductor of `ψ`. Write `m=q^bm′` with `q∤m′` for a prime `q≠p`. If `q^b` does not divide `f_ψ`, let `H⊆Δ` consist of the restrictions to `L_n` of the automorphisms fixing `μ_{m/q}` and `μ_{p^∞}`; it lies in the inertia group at `q`, has order prime to `p`, and `ψ` is trivial on it, because the `q`-part of `f_ψ` divides `m/q`. So the `ψ`-projection of the generator equals that of its `H`-average, which is a prime-to-`p` multiple of its norm to the field of conductor `m/q`. By the distribution relations (§0.3–§0.5) this norm is the generator for `m/q`, multiplied by `1−ψ^{−1}(q)Fr_q^{−1}∈O′[Γ/Γ_n]` when `q∤m/q`. After finitely many steps every `ψ`-projection is an `O′[Γ/Γ_n]`-multiple of the `ψ`-projection of a generator whose conductor has the same prime-to-`p` part as `f_ψ`. If that conductor is divisible by `p`, the projection is the trace element of `Gal(L_n/L_j)`, for the appropriate layer `L_j`, applied to `ξ_{n,ψ}`: the norm steps between conductors divisible by `p` carry no Euler factor at `p`. Otherwise `p∤f_ψ` and the projection is `ξ_{0,ψ}`. Conversely `ξ_{n,ψ}` and `ξ_{0,ψ}` are prime-to-`p` multiples of `ψ`-projections of generators. The trace of `ξ_{n,ψ}` to `L_0` is `ξ_{0,ψ}^{1−ψ^{−1}(p)}` (§0.26), and `1−ψ^{−1}(p)` is a unit when `ψ(p)≠1` (§0.27), which gives the inclusion `O′ξ_{0,ψ}⊆C_{n,ψ}`. Each `ψ`-projection of a generator is a unit: when `m` is a prime power, the ideal of the generator is a Galois-invariant power of a prime ideal, whose `ψ`-part is zero. So the `ψ`-part of `D_n` lies in that of the units, and `(C^S_n)^ψ` is the `ψ`-part of `D_n`. The trivial part follows because the norm from `L_n` to `ℚ_n` maps `D_n` onto the circular numbers of `ℚ_n` up to prime-to-`p` powers, by transitivity of norms, and `|Δ|` is invertible.
2. Index identity at level `n`. By Leopoldt's conjecture for the abelian field `L_n` (IntegralIwasawaTheory §4.4), `E^ψ_n→U^ψ_n` is injective. `E^ψ_n` is free of rank `p^n` over `O′` by the Galois-module unit theorem (IntegralIwasawaTheory §4.3, `unitRepresentation_augmentation`), and `U^ψ_n` has `O′`-rank `p^n` by the normal basis theorem (§2.2, step 2); `U^ψ_n` can have nonzero finite torsion, from the `p`-power roots of unity of the completions (for example `L=ℚ(√6), p=3`). So `U^ψ_n/E^ψ_n` is finite, and IntegralIwasawaTheory §2.7 (`finiteGlobalLocalSequence` for `L_n`, whose term `D_n` vanishes by Leopoldt and whose sign term vanishes for odd `p`) gives `0→U^ψ_n/E^ψ_n→𝔛^ψ_n→A^ψ_n→0`. Since `(C^S_n)^ψ` has finite index in `E^ψ_n` (Sinnott 1980, Theorem 4.1, p. 207), `ℓ(E^ψ_n/(C^S_n)^ψ)−ℓ(A^ψ_n) = ℓ(U^ψ_n/(C^S_n)^ψ)−ℓ(𝔛^ψ_n)`, all terms finite.
3. Stable index. Statement `(g)` (step 15), for `L` and for `ℚ`, gives `v_p[E(L_n):C^S(L_n)]−v_p(h(L_n)) = v_p(c⁺_{L_∞})` and the same for `ℚ_n` with `c⁺_{ℚ_∞}`, for all sufficiently large `n`. By `(a)`, the trivial-character parts are exactly the groups for `ℚ_n`. Summing the `ψ`-parts over the characters of `Δ` multiplies `ℤ_p`-lengths by `[O′:ℤ_p]`, so `Σ_{ψ≠1}(ℓ(E^ψ_n/(C^S_n)^ψ)−ℓ(A^ψ_n)) = [O′:ℤ_p](v_p(c⁺_{L_∞})−v_p(c⁺_{ℚ_∞}))` for all large `n`. This is a constant; it need not be zero.
4. `(c) Gal(M_∞/L_n)` is an extension of `Γ_n` by `Z_∞`. Every abelian pro-`p` extension of `L_n` unramified outside `p` lies in `M_∞`, and `Γ_n` is procyclic, so the extension splits and `Gal(M_n/L_n)` is its abelianisation, an extension of `Γ_n` by `Z_∞/ω_nZ_∞`. `Δ` acts trivially on `Γ_n`, so the `ψ`-part of `Γ_n` vanishes and `𝔛_n^ψ ≅ Z_∞^ψ/ω_nZ_∞^ψ`. Leopoldt's conjecture for `L_n` gives `Gal(M_n/L_n) ℤ_p`-rank one, carried by the trivial character, so `𝔛^ψ_n` is finite. Finally `ν_nZ/ω_nZ` is the image of `Z/`TZ`=𝔛^ψ_0` under multiplication by `ν_n`.
5. Local norms. By `localUnitLimit_rank_one`(a) (§2.2: Hilbert 90, local reciprocity and the norm of a uniformizer in the totally ramified layers), `Y_∞/ω_nY_∞` ↪ `Y_n` with cokernel `R_n=⊕_{w|p}Gal(L_{∞,w}/L_{n,w})≅ℤ_p[Δ/Δ_p]`, on which `Γ` acts trivially, `Δ_p` being the decomposition group of `p`. Hence `R_n^ψ=0` if `ψ(p)≠1` and `R_n^ψ≅O′` if `ψ(p)=1`.
6. `(b)` when `ψ(p)≠1`. The valuation module `ℤ_p[Δ/Δ_p]` has zero `ψ`-part, so `Y^ψ_∞=U^ψ_∞` and `Y^ψ_n=U^ψ_n` (§2.2(ii)), and step 5 gives `U^ψ_∞/ω_nU^ψ_∞ ≅ U^ψ_n`. The image of `C_{∞,ψ}` is `C_{n,ψ}`, because `ξ_{k+1,ψ}` maps to `ξ_{k,ψ}` for `k≥1` and `ξ_{1,ψ}` maps to the unit multiple `ξ_{0,ψ}^{1−ψ^{−1}(p)}`. By `(a)` this image is `(C^S_n)^ψ`, and coinvariants are right exact.
7. `(b)` when `ψ(p)=1`. Now `Y^ψ_∞/U^ψ_∞≅O′` through the valuation, with trivial `Γ`-action (§2.2(ii)), so `ω_nY^ψ_∞⊆U^ψ_∞`. By step 5 the kernel of `U^ψ_∞→U^ψ_n` is `U^ψ_∞∩ω_nY^ψ_∞=ω_nY^ψ_∞`, and its image `N_n` is the kernel of the reciprocity map `ρ_n`:`U^ψ_n→R^ψ_n≅O′`, which is onto. For `x∈L_w^×`, reciprocity over `L_{n,w}` sends `x` to the reciprocity image of `x^{p^n}` over `L_w`, by norm functoriality; under `R_n≅R_0` (division by `p^n`), `ρ_n(ξ_{0,ψ})` is therefore `ρ_0(ξ_{0,ψ})`. On `U^ψ_0≅U^1(ℚ_p)⊗O′`, which is torsion-free of rank one, `ρ_0` is the reciprocity isomorphism of the cyclotomic `ℤ_p`-extension of `ℚ_p` multiplied by the prime-to-`p` local degree, so it is injective; and `ρ_0(ξ_{0,ψ})≠0` because `ξ_{0,ψ}≠0` (§0.23, Leopoldt). Two consequences follow. First, `N_0=0`, so `U^ψ_∞=TY^ψ_∞` and `ω_nY^ψ_∞=ν_nU^ψ_∞`. Second, the image of `C_{∞,ψ}` in `U^ψ_n` is `C_{n,ψ}⊆N_n` for `n≥1` and is zero for `n=0`, because `1−ψ^{−1}(p)=0`; by `(a)`, `N_n∩(C^S_n)^ψ` is exactly this image, and `U^ψ_n/(N_n+(C^S_n)^ψ)≅O′/ρ_0(ξ_{0,ψ})O′`, of length `a_ψ`. Hence `ℓ(U^ψ_n/(C^S_n)^ψ) = ℓ(U^ψ_∞/(ν_nU^ψ_∞+C_{∞,ψ})) + a_ψ` for every `n≥0`. The left side is finite by step 2, so the other two terms are finite.
8. `(d)` Put `ε′_n=ω_n` if `ψ(p)≠1` and `ε′_n=ν_n=ω_n/ω_0` if `ψ(p)=1`. Both `U^ψ_∞/C_{∞,ψ}` and `Z^ψ_∞` are finitely generated torsion modules with finite `ε′_n`-quotients for every `n`, the first because `U^ψ_∞` has rank one (`localUnitLimit_rank_one`(b)) and `C_{∞,ψ}≠0`. Iwasawa's growth formula (PadicMeasuresIwasawaAlgebras §4.7 (Iwasawa's growth formula), with `n_0=−1` or `n_0=0`) gives `ℓ(M/ε′_nM)=μ(M)p^n+λ(M)n+ν(M)` for `n` large. Steps 2–7 make `Σ_{ψ≠1}[ℓ((U^ψ_∞/C_{∞,ψ})/ε′_n)−ℓ(Z^ψ_∞/ε′_n)]` differ from the constant of step 3 by a quantity bounded independently of `n`. So `Σ_ψ(μ(U^ψ_∞/C_{∞,ψ})−μ(Z^ψ_∞)) = 0` and similarly for `λ`. The four-term sequence `0→E^ψ_∞/C_{∞,ψ}→U^ψ_∞/C_{∞,ψ}→Z^ψ_∞→A^ψ_∞→0` (Rubin, proof of Theorem III.2.10: the `ψ`-part of IntegralIwasawaTheory §2.7, `infiniteGlobalLocalSequence` for `L` with `Σ_∞=0`, divided by the closed submodule `C_{∞,ψ}⊆E^ψ_∞`) and additivity of `μ` and `λ` (PadicMeasuresIwasawaAlgebras §4.4 (Iwasawa invariants, `muInvariant_add`)) give `(d)`.
9. `(e)`, `primitiveCircularLimit_eq`. Pass to the limit in `(a)`. When `ψ(p)≠1` the `ψ`-parts of `C^S_n` and `C_{n,ψ}` agree. When `ψ(p)=1` the quotient `(C^S_n)^ψ/C_{n,ψ}` is `O′ξ_{0,ψ}` for `n≥1`, since `ρ_n` vanishes on `C_{n,ψ}` and not on any nonzero multiple of `ξ_{0,ψ}` (step 7). The element `ξ_{0,ψ}` lies in the fixed layer `L`, so the norm from `L_{n+1}` to `L_n` acts on these quotients as multiplication by `p`, and their inverse limit in a finitely generated `ℤ_p`-module is zero. Exactness of inverse limits of these compact modules then identifies the `ψ`-part of `C^S_∞` with `C_{∞,ψ}`, with the unit normalization of the finite character sum `|Δ|e_ψ`. This assertion concerns norm limits; it does not assert equality of the two circular-unit lattices at every finite level, which `(a)` shows can fail by `O′ξ_{0,ψ}`.
10. Class side. Use IntegralIwasawaTheory §3.3 and IntegralIwasawaTheory §3.2: the primes above `p` are totally ramified in `L_∞/L` from level 0 on (the Mathlib ramification contract), so `inertiaClassControl` applies with cutoff level 0; the map `A_∞/ω_n→A_n` is onto, and its kernel is a quotient of the finitely generated module spanned by the inertia commutators, finite because `J` does not divide `char(A_∞^ψ)` (§2.4, step 3).
11. `circularUnit_descent_bounded`, kernel. Use the norm image `C̃_n` of `C^S_∞` in `C^S_n`. The quotient `C^S_n/C̃_n` eventually stabilizes (Belliard, Lemma 4.2, p.12); the finite image of `ker d_n` in this fixed finitely generated `ℤ_p`-module lies in its finite torsion subgroup. The remaining kernel is the quotient of the eventually stable invariant submodules of `E′_∞/E_∞` and `E′_∞/C^S_∞`, for the norm limit `E′_∞` of the `p`-units (Proposition 4.3, pp.12–13). These are noetherian `Λ`-modules; Theorem 1.1(2) makes the resulting descent kernels finite. This proves a uniform bound. The finiteness of the source for every `n` is Belliard, Theorem 1.1(2), Lemma 4.1(1) and Lemma 5.1(1), preprint pp.4–5, 12–14; it uses Coleman theory and abelian Leopoldt, without the main conjecture. Belliard's calligraphic letters denote semilocal units; the global units here are `E_n`.
12. `circularUnit_descent_bounded`, cokernel. Let `D` be the stabilized decomposition field of `p` in `L_∞`. The semilocal norm calculation reduces the cokernel to the quotient of the norms of norm-zero semilocal units by the norms of circular units. Both norm images contain their fixed `D`-lattices multiplied by `[L_n:D]`, with bounded index (Belliard, Lemma 5.2, pp.14–15). The fixed `D`-unit/circular-unit quotient is finite. Lemma 3.3, p.12, transfers the bound back to the global-unit quotient. No characteristic-ideal equality is used in steps 11–12.
13. `sinnottCorrection_bounded` and the second proof of `(d)`. Statement `(g)` (step 15) gives `[E(L_n):C(L_n)]=h(L_n)·2^{[L_n:ℚ]}·c⁺_{L_∞}` for all sufficiently large `n`, with a fixed positive rational `c⁺_{L_∞}`; its square-saturated circular-unit variant has a fixed rational correction without that power of 2, and the two variants have the same `p`-completion because `p` is odd. Thus `ε_n` is eventually `v_p(c⁺_{L_∞})`; enlarge `b_L` to include the finitely many earlier layers. This verifies the bounded-valuation consequence of Sinnott's general-conductor index formula (IntegralIwasawaTheory §1.8), also used in Belliard, Theorem 6.1(1), preprint p.15. It neither replaces the index by the class number nor asserts that `c⁺_{L_∞}=1`. A finite map gives `ℓ(E_n/C^S_n)−ℓ((E_∞/C^S_∞)/ω_n)=ℓ(coker d_n)−ℓ(ker d_n)`. Project using the integral idempotents `(p∤|Δ|)` and use step 9. The trivial `Δ`-part is the tower over `ℚ`; its `p`-class module and unit/circular-unit norm quotient vanish by §3.2 and the four-term sequence, and finite-level removal changes the length by a bounded amount, by the same descent theorem. Combining steps 10–12 with the bounded correction and comparing the coefficients of `p^n` and `n` in the growth functions, as in Belliard, Theorems 5.3(1) and 6.1(1), p.15, gives `(d)` again. Do not infer equality of characteristic polynomials from equality of `μ` and `λ` alone.
14. `(f)`, `sinnottCorrection_primes`. Let `p_1`,…,`p_j` be the primes dividing `s`, `s_0=1` and `s_i=p_1⋯p_i`. Then `(αR:αU_s)=∏_i(αU_{s_i}:αU_{s_{i+1}})`, since `U_1=R`. For a prime `q` dividing the radical of `m` but not `s′`, Sinnott's `U_{s′q}=U_{s′}(T_q)+(1−(q,k)^*)U_{s′}`, with `U_{s′}(T_q)` generated by the elements `s(T_{rq})∏(1−(ℓ,k)^*)`; the index `(αU_{s′}:αU_{s′q})` is the order of the finite group `B/(1−λ_q^{−1})B` with `B=(αU_{s′})^{T_q}/αU_{s′}(T_q)`, where `λ_q` is the Frobenius of `q` in `G/T_q` (Sinnott, Lemma 5.1 and (1.4)). The relations `s(T_q)αU_{s′}⊆αU_{s′}(T_q)⊆(αU_{s′})^{T_q}` show that `|T_q|` kills `B`, so each factor is an integer divisible only by primes dividing `|T_q|`. For the last assertion, `(R:U)=(e⁻R:e⁻U)(R⁺:U⁺)` and, for imaginary `k`, `(R⁺:U⁺)=(e⁺R:e⁺U)2^{−a}` with `a≥0`, by comparing `(1+j)R` with `R⁺` (Sinnott, p. 212). Generalized indices are the covolume ratios of IntegralIwasawaTheory §1.8.
15. `(g)`, `sinnottStableIndex`. Apply Sinnott's index theorem (IntegralIwasawaTheory §1.8, real case) to each layer: `[E(k_n):C(k_n)]=h(k_n)·2^{[k_n:ℚ]−1}·(∏_{q|m_n}[k_{n,q^e}:ℚ]/[k_n:ℚ])·(R_n:U_n)`. By `(f)`, `(R_n:U_n)` involves only `p` and the primes dividing `[k:ℚ]`. Sinnott's Theorem 6.1 shows that `(eR^{(n)}:eU^{(n)})` is an integer independent of `n` for large `n`: for a prime `q≠p`, let `k′` be the largest subfield of `k` of `q`-power degree over `ℚ`, and choose `n₀` so that `Gal(k_∞/k_{n₀})` lies in the decomposition group of every prime ramified in `k′` (these decomposition groups are infinite, hence of finite index); then only characters trivial on `Gal(k_n/k_{n₀})` contribute to the `q`-part; for `p` itself Sinnott's §6 runs an Iwasawa-module argument with the projective limit of the lattices. The degree factor `∏[k_{n,q^e}:ℚ]/[k_n:ℚ]` is eventually constant, and §7 (pp. 232–233) shows that the unit index `Q` and the integers `g′`, `g″` entering the variant `C_1` are eventually constant. The constants depend only on `k_∞`, because two fields with the same cyclotomic `ℤ_p`-extension have layers that agree after a shift.

**Checks.**

- `ψ(p)≠1`, for example `L=ℚ(μ_p)^+`: the control in `(b)` is an isomorphism at every level, and `(C^S_n)^ψ=C_{n,ψ}`.
- `ψ(p)=1` at the bottom layer: the image of `C_{∞,ψ}` in `U^ψ_0` is zero, while `(C^S_0)^ψ=O′ξ_{0,ψ}` has finite index in `U^ψ_0≅O′`. Replacing Sinnott's component by the image of the limit makes the finite-level quotient `U^ψ_0` itself, which is infinite. This is why `(b)` uses `ν_n` and the correction `a_ψ` when `ψ(p)=1`. There `U^ψ_∞=TY^ψ_∞`, so `U^ψ_∞/TY^ψ_∞=0` while `Y^ψ_∞/U^ψ_∞≅O′` is the valuation line.
- The error bound is uniform in `n`, not just a finite error at each individual level. The terms `a_ψ` and `ℓ(𝔛^ψ_0)` do not depend on `n`; an error that grows with `n`, such as `ℓ(ℤ_p/p^nℤ_p)=n`, would change the coefficient of `n` and would not determine `λ`.
- For a prime-power cyclotomic field recover the `p`-primary equality from the circular-unit index formula.
- For general conductor keep the full Sinnott correction: it need not be 1, and replacing it by 1 is neither justified nor needed. Only its stability for large `n` and its bounded valuation are used.
- The system `ℤ_p` with norm maps multiplication by `p` has inverse limit
  zero although every finite-level module is nonzero. This checks the
  distinction between fixed-conductor generators and genuine norm
  sequences in `primitiveCircularLimit_eq`.
- For a finite map with kernel of order `p²` and cokernel of order `p`,
  the finite-level length minus the coinvariant length is `−1`. Reversing
  the kernel/cokernel signs would give the wrong descent error. The zero
  map `ℤ/9→ℤ/3` realizes this: its kernel has order 9, its image has
  order 1, and its cokernel has order 3.
- Equal totals of `μ` and `λ` alone do not identify characteristic ideals; §3.4 uses them only after the divisibilities.
- `(f)` at a prime-power conductor: `U=R`, so `(R:U)=1` and the index formula of IntegralIwasawaTheory §1.8 for `k=ℚ(√5)` gives `[E:C]=1·2·(2/2)·1=2`, matching `C=`⟨`−1`,`ε²`⟩. A correction `(R:U)` divisible by a prime not dividing `|G|` would contradict `(f)`.
- `(g)` for `k=ℚ`: the layers `ℚ_n` lie in prime-power cyclotomic fields, so `[E(ℚ_n):C(ℚ_n)]=2^{[ℚ_n:ℚ]−1}h(ℚ_n)` and `c⁺_{ℚ_∞}=1/2`. The stable correction is a power of 2, so `v_p(c⁺_{ℚ_∞})=0` for odd `p`; writing the formula with `2^{[k_n:ℚ]−1}` in place of `2^{[k_n:ℚ]}` would change `c⁺` to 1.

See **SINNOTT-1980**, §4, definition of the circular numbers and units, p. 201; Theorem 4.1, p. 207. The circular units and their index. **SINNOTT-1980**, Introduction, Theorem, p. 182; Theorem 6.1, p. 226; §7, pp. 232–233. The index is `h·2^{[k_n:ℚ]}·c⁺` with `c⁺` independent of `n` in the cyclotomic `ℤ_p`-extension: statement `(g)`. **SINNOTT-1980**, Lemma 5.1, p. 210; Proposition 5.1 and its proof, pp. 211–212. Statement `(f)`. **RUBIN-ES**, Chapter III, Proposition 2.6 and its proof, printed pp. 37–38. The valuation module `ℤ_p[Δ/Δ_p]` and its `χ`-part. **RUBIN-ES**, Chapter III, proof of Theorem 2.10, printed p. 39. The four-term sequence for `L`. **RUBIN-ES**, Chapter III §2, proof of Corollary 2.8, printed p. 38 (citing Mazur–Wiles §1.6 and Rubin’s appendix p. 414). The finite-layer comparison invoked by the componentwise equality proof, which steps 1–8 supply.
See **BELLIARD-DESCENT**, Theorem 1.1(2), Lemmas 3.3, 4.1–4.2 and
5.1–5.2, Proposition 4.3 and Theorems 5.3, 6.1, preprint pp.4–5,
12–15, for the independent descent and growth argument of steps 11–13.

*Needs:* [§0.3](#distribution-relation-of-dvd); [§0.5](#distribution-relation-frobenius); [§0.22](#chi-cyclotomic-generator); [§0.23](#chi-cyclotomic-generator-unit); [§0.24](#chi-cyclotomic-units); [§0.26](#twisted-class-eq-xi-power); [§0.27](#twisted-class-generates); [§2.2](#limit-unit-diagram); [§2.4](#cyclotomic-iwasawa-divisibility); [§3.1](#galois-unit-four-term-sequence); [§3.2](#trivial-character-component); IntegralIwasawaTheory §4.3; IntegralIwasawaTheory §1.7; IntegralIwasawaTheory §1.8; IntegralIwasawaTheory §2.7; IntegralIwasawaTheory §3.3; IntegralIwasawaTheory §3.2; IntegralIwasawaTheory §4.4; IntegralIwasawaTheory §0.3; PadicMeasuresIwasawaAlgebras §4.7 (Iwasawa's growth formula); PadicMeasuresIwasawaAlgebras §4.4 (Iwasawa invariants, `muInvariant_add`); PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal is `(ϖ^μF_M)`).

<a id="componentwise-iwasawa-equality"></a>
### 3.4 Equality of characteristic ideals: `char(A_∞^χ) = char(E_∞^χ/C_{∞,χ})` (Rubin, Corollary III.2.8)
Let `p` be odd and `χ` an even nontrivial character of order prime to `p`, with field `L`. Then `char(A_∞^χ) = char(E_∞^χ/C_{∞,χ})`. For `L = ℚ(μ_p)^+` and all even `χ ≠ 1` of `Δ^+` at once, `char(Y_∞^+) = char(E^+_{∞,1}/C^+_{∞,1})` away from the trivial component; the trivial components vanish on both sides (§3.2).

Apply §3.3 to the field `L` cut out by `χ`, so that `p∤[L:ℚ]`. Every nontrivial character `ψ` of `Δ=Gal(L/ℚ)` is even, nontrivial and of order prime to `p`, so §2.4 applies to each of them. Work over a common unramified `O′` containing all their values; characteristic ideals and divisibility are unchanged by this flat extension. For general conductor §3.3 retains the full Sinnott index correction rather than the prime-power equality without its correction.

Prove this as follows.

1. By §2.4, for every nontrivial `ψ` of `Δ` write `char(E∞ψ/C∞ψ)=char(A∞ψ)·(hψ)` in `O′[[T]]`. The divisibility supplies the actual integral quotient `hψ`.
2. By §3.`3(d)` the sums over `ψ` of the `μ`- and `λ`-invariants of the two sides agree, so the sum of the invariants of the `hψ` is zero. Each `hψ` has nonnegative `μ` and `λ`, so every `hψ` has `μ=λ=0`.
3. By Weierstrass preparation a nonzero nonunit of `O′[[T]]` has positive `μ` or positive `λ`. Thus every `hψ` is a unit, in particular `hχ`, and the equality descends from `O′` to `O`. This is why divisibility plus growth gives equality; growth alone would not identify two distinguished polynomials.
4. For the full real cyclotomic tower combine these equalities with the trivial-character calculation.

**Checks.**

- A component-by-component equality does not follow from the totals without step 1's divisibilities.
- The totals must run over all nontrivial characters of `Gal(L/ℚ)`, including those `ψ` with `ψ(p)=1` even when `χ(p)≠1`. §2.4 has no hypothesis on `ψ(p)`, so every `ψ` has its divisibility.

See **RUBIN-ES**, Chapter III, Corollary 2.8 and its proof, printed p. 38. The statement; its proof refers to the finite-layer comparison, which §3.3 supplies.

*Needs:* [§2.4](#cyclotomic-iwasawa-divisibility); [§3.2](#trivial-character-component); IntegralIwasawaTheory §1.5; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal); [§3.3](#finite-layer-comparison); PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal is `(ϖ^μF_M)`).

<a id="cyclotomic-main-conjecture"></a>
### 3.5 The Iwasawa main conjecture over `ℚ` for odd `p` (RJW Theorem 13.8)
Let `p` an odd prime, `F_n = ℚ(μ_{p^n})`, `F_∞^+ = ∪F_n^+`, `G^+ = Γ^+ = Gal(F_∞^+/ℚ)`, `Λ = Λ(Γ^+)`, and `U^+_{∞,1}`, `E^+_{∞,1}`, `C^+_{∞,1}` the limits of the principal local units, the closures of the global units and of the cyclotomic units in them (RJW Definitions 11.8, 13.12). Then `X_∞^+` is a finitely generated torsion `Λ(Γ^+)`-module and `char_{Λ(Γ^+)}(X_∞^+) = I(Γ^+)ζ_p` (RJW Theorem 13.8). This holds for every odd `p`, unconditionally. The character form for an arbitrary real abelian field of degree prime to `p`, `char(Z_∞^χ) = L_χΛ` (Rubin Theorem III.2.10), needs the integral Coleman image over unramified coefficients and is §4.27. The stronger statement `X_∞^+ ≅ Λ(Γ^+)/I(Γ^+)ζ_p` (RJW Theorem 13.11) is not asserted; it needs `p` to be a Vandiver prime.

The local-unit theorem `U^+_{∞,1}/C^+_{∞,1} ≅ Λ(Γ^+)/I(Γ^+)ζ_p` through the Coleman map (RJW Theorem 12.23(ii), Iwasawa) is ColemanPowerSeries §4.30.

`Y_∞^+` is finitely generated and torsion (Iwasawa): IntegralIwasawaTheory §2.4 (`unramifiedModule_finite_torsion`).

Prove this as follows.

1. Take characteristic ideals in the four-term sequence (§3.1). `char` is multiplicative (RJW Lemma 13.6), so `char(E/C)·char(X_∞^+) = char(U/C)·char(Y_∞^+)`.
2. `char(U/C) = I(Γ^+)ζ_p` (Theorem 12.23(ii)), and `char(E/C) = char(Y_∞^+)` (§3.4), which is nonzero since `Y_∞^+` is torsion. Cancel in the domain components of `Λ`.
3. Torsion: `U/C ≅ Λ/I(Γ^+)ζ_p` is torsion because `ζ_p ≠ 0`, and `Y_∞^+` is torsion, so `X_∞^+` is torsion. The trivial component is handled by §3.2.

**Checks.**

- Without the Vandiver hypothesis only characteristic ideals are compared, not modules.
- `p = 2` is not covered here (Greither, Layer 4).

See **RJW-PADIC-L**, Theorem 13.8, p. 67 (arXiv v2). The statement. **RJW-PADIC-L**, Theorem 13.11, p. 67 (arXiv v2). The Vandiver case, not asserted here.

*Needs:* [§3.1](#galois-unit-four-term-sequence); [§3.4](#componentwise-iwasawa-equality); [§3.2](#trivial-character-component); ColemanPowerSeries §4.30; IntegralIwasawaTheory §§2.4, 3.1; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

### Examples

The series `T` and `T−p` have the same `μ` and `λ` but different principal
ideals. Their growth alone cannot prove equality: the argument requires
componentwise integral divisibility first. On the trivial component,
`([a]−[1])ζ_p` evaluates to `−(1−p⁻¹)log_p(a)`, a `p`-adic unit for a
topological generator a at odd `p`. This cancels the pole and gives the
unit ideal.

### Dependencies

Layers 0–2; IntegralIwasawaTheory §§0.1, 0.3, 1.7–1.8, 2.2, 2.4, 2.7, 3.2–3.3, 3.5, 4.3 and 4.4; §3.1; ColemanPowerSeries §4.30; §F.10; PadicMeasuresIwasawaAlgebras §§4.2, 4.4, 4.6, 4.7 and 5.2; Tau Ceti ClassFieldTheory Layer 13; Sinnott's Lemma 5.1, Proposition 5.1 and stable-index theorem, proved in §3.3. The exact inputs are named at each target.

## Layer 4: Abelian fields and the prime 2

Let `F/ℚ` be abelian and unramified at `p` and set `K_n=F(ζ_(2p^(n+1)))`.
In particular `K_0=F(i)` at `p=2`. Use integral character quotients with their
bounded errors, rather than semisimple projectors. First prove the local
image and the all-prime Iwasawa inequality, then use Kummer duality and
class-number products. The finite applications retain split-prime divisor
modules, valuation/logarithm lattices and the essential factor `1/2`.

<a id="greither-chi-parts"></a>
### 4.1 Greither's `χ`-parts, including the case `p ∣ |Δ|`
Let `Δ` be a finite abelian group, `χ` a `p`-adic character of `Δ`, and `M` a `ℤ_p[Δ]`-module. The `χ`-part of `M` is `M_χ = M ⊗_{ℤ_p[Δ]} ℤ_p(χ)`, where `ℤ_p(χ) = ℤ_p[χ(δ) | δ ∈ Δ]` with `Δ` acting through `χ`. Properties: `(a) M ↦ M_χ` is right exact, and exact if `p ∤ |Δ|`; `(b) Q_p`-conjugate characters give isomorphic parts; `(c)` the kernels of `ℤ_p[Δ] → ℤ_p(χ)` are the minimal primes of `ℤ_p[Δ]`; `(d)` if `p ∤ |Δ|`, `M ≅ ∏_χ M_χ` over `Q_p`-conjugacy classes. For `Δ = Gal(F/ℚ)` with complex conjugation `j`: `(e)` for odd `χ`, `(1 + j)M` maps to 0 in `M_χ`; `(f)` for `M = A_p(F)`, `M_χ ≅ (M/im M^+)_χ` for odd `χ`; `(g)` if `p = 2` and `Δ = Δ₂ × Δ₀` with `Δ₀` odd and `Δ₂` cyclic of 2-power order, then for a minus module `M` and odd `χ`, `M_χ ≅ M_{χ₀}`, with `χ₀ = χ|_{Δ₀}`.

When `p | |Δ|` the `χ`-part is only right exact; this is why Greither's bounds carry controlled error terms, unlike Rubin's §III.2, which assumes `p ∤ |Δ|`.

Prove this as follows.

1. Define `M_χ` by base change along `ℤ_p[Δ] → ℤ_p(χ)`.
2. `(a)`–`(d)`: standard. `(e)`: `χ(j) = −1` kills `1 + j`. `(f)`: the norm `A_p(F) → A_p(F^+)` is onto, so `im M^+ = (1 + j)M`.
3. `(g)`: `χ` odd on a cyclic 2-group forces `χ` injective on `Δ₂` with `χ(j) = −1`, so `ℤ₂[χ|Δ₂] = ℤ₂[Δ₂]/(j+1)`. Taking the `Δ₂`-character quotient of a minus module changes nothing. Then take the `Δ₀`-character quotient, giving `M_χ ≅ M_{χ₀}`; when `Δ₀=1` this is `M` itself.

The API consists of the following statements.

- `chiPart` (constructor): `M_χ = M ⊗_{ℤ_p[Δ]} ℤ_p(χ)`.
- `chiPart_rightExact` (characterisation): `M ↦ M_χ` is right exact, and exact when `p ∤ |Δ|`.
- `chiPart_odd_kills_plus` (characterisation): For odd `χ`, `(1 + j)M ↦ 0` in `M_χ`.
- `chiPart_minus_two` (characterisation): `p = 2`, `Δ₂` cyclic, `M` a minus module, `χ` odd: `M_χ ≅ M_{χ|Δ₀}` (property `(g)`).

These interfaces are used in §4.14: the `χ`-parts in which the main conjecture is stated for all `p`. §4.12: the `ρ`-parts of `X` and `E_∞/C_∞` when `p` divides `[F : ℚ]`.

**Checks.**

- `chiPart.test_prime_to_p` (value): `p ∤ |Δ|`: `M ≅ ∏_χ M_χ` over conjugacy classes (property `(d)`).
- `chiPart.test_not_exact` (non-example): `p = 2`, `Δ = ⟨δ⟩ ≅ ℤ/2`, `χ(δ) = −1`: `0 → ℤ_2 → ℤ_2[Δ] → ℤ_2(χ) → 0 (1 ↦ 1 + δ)` is exact, but its `χ`-part `ℤ/2 → ℤ_2 → ℤ_2 → 0` has zero first map, so `(·)_χ` is not left exact when `p ∣ |Δ|`.
- `chiPart.test_minus_module` (characterisation): For a minus module (`j` acts as `−1`) and odd `χ` of a cyclic 2-group, `M_χ = M`.
- Greither's introductory example: an imaginary abelian field whose 2-class group `(ℤ/2)^3` equals its minus part, on which the usual Stickelberger theorem says nothing about the Galois structure.

See **GREITHER-1992**, Introduction, the Definition and properties `(a)`–`(f)`, p. 451. `(a)`. **GREITHER-1992**, Introduction, property `(g)`, p. 451. The `p = 2` phenomenon.

*Needs:* [§0.18](#chi-component).

<a id="greither-semilocal-norm-descent"></a>
### 4.2 Norm descent for semilocal units, with bounded errors (Greither, Lemmas 2.1–2.2)
Let `p` be a prime, `F/ℚ` abelian with `p ∤ cond(F)`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^×` the semilocal units above `p`, `U_n` its pro-`p` part, `𝒞_n` Sinnott's circular units of `K_n` and `C_n` the pro-`p` part of their closure in `𝒰_n`; `𝒰_∞`, `U_∞`, `𝒞_∞`, `C_∞` the inverse limits; `t = 1` for odd `p` and `t = 2` for `p = 2`. (Lemma 2.2) Let `H ⊆ Δ` be finite abelian groups, `X` a `ℤ_pΔ`-module, `X′` a `ℤ_p(Δ/H)`-module, and `N`: `X → X′`, `i`: `X′ → X Δ`-maps with Ni `= |H|` and iN `= Σ_{σ∈H}σ`. Then the kernel and cokernel of the induced map `N̄`: `X_H → X′` are annihilated by `|H|`. (Lemma 2.1) For `F′ ⊆ F` with `H = Gal(F/F′)`, the kernel and cokernel of the norm map `α`: `(𝒰_n)_H → 𝒰′_n` are annihilated by `|H| = [F:F′]`. (Corollary) If `χ` is a character of `F′`, the kernel and cokernel of `α_χ`: `(𝒰_∞)_χ → (𝒰′_∞)_χ` are annihilated by `[F:F′]²`.

These bounds are the bounded errors of the character functors when the group order is divisible by `p`. Since `F/F′` is unramified above `p`, `𝒰_n` is cohomologically trivial as an `H`-module, so `α` is in fact an isomorphism. The bound by `|H|` is all that Greither's later arguments use.

Prove this as follows.

1. Lemma 2.2: if `N̄(x̄) = 0`, then `|H|·x = iN(x) + (|H| − Σσ)x ∈ I_H·X`, since `Σσ ≡ |H| mod` the augmentation ideal; so `|H|` kills `ker N̄`. For `x′ ∈ X′`, `|H|x′ = N(i(x′))`, so `|H|` kills `coker N̄`.
2. Lemma 2.1: the kernel of the norm `(𝒰_n)_H → 𝒰_n^H = 𝒰′_n` is a Tate cohomology group of `H` in degree `−1`, and the cokernel is `Ĥ⁰(H, 𝒰_n)`. Both are annihilated by `|H|`.
3. Corollary: for `A = ker α` and `B = coker α`, taking `χ`-parts gives `A_χ → 𝒰_{∞,χ} → Im(α)_χ → 0` and `Tor(ℤ_p(χ), B) → Im(α)_χ → 𝒰′_{∞,χ} → B_χ → 0`, with `Tor` over `ℤ_p[Gal(F/ℚ)]`. `[F:F′]` annihilates `A_χ`, `B_χ` and the `Tor` term, so the composite has kernel and cokernel killed by `[F:F′]²`. Coinvariants commute with the inverse limit because the modules are compact.

**Checks.**

- `F′ = F`: every bound is trivial.
- `p ∤ [F:F′]`: `α_χ` is an isomorphism on pro-`p` parts.

See **GREITHER-1992**, §2, the setting, p. 455. The definitions of `𝒰_n`, `U_n`, `𝒞_n`, `C_n`. **GREITHER-1992**, §2, Lemma 2.2, p. 456. Lemma 2.2.

*Needs:* [§4.1](#greither-chi-parts).

<a id="greither-circular-unit-limit"></a>
### 4.3 Generators of the limit of circular units (Greither, Lemma 2.3)
Let `p` be a prime, `F/ℚ` abelian with `p ∤ cond(F)`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^×` the semilocal units above `p`, `U_n` its pro-`p` part, `𝒞_n` Sinnott's circular units of `K_n` and `C_n` the pro-`p` part of their closure in `𝒰_n`; `𝒰_∞`, `U_∞`, `𝒞_∞`, `C_∞` the inverse limits; `t = 1` for odd `p` and `t = 2` for `p = 2`. Let `m = cond(F)` and `G = Gal(K_∞/ℚ)`. For `1 ≠ m′ | m` put `η_{m′,F} = (N_{ℚ(m′)/ℚ(m′)∩F}(1 − ζ_{m′}^{p^{−ν}}·ζ_{p^{ν+t}}))_{ν∈ℕ}`, a norm-coherent sequence. Then, up to a finite torsion group of order prime to `p`, `𝒞_∞` is the closure of the `ℤ_pG`-span of `{±η_{m′,F} : 1 ≠ m′ | m} ∪ 𝒞_∞(ℚ(ζ_{p^∞}))`.

Sinnott's circular numbers `D(k) = ℤ[Gal(k/ℚ)]`-`span{±N_{ℚ(n)/ℚ(n)∩k}(1 − ζ_n^a)}` and circular units `D(k) ∩ 𝒪_k^×` are IntegralIwasawaTheory §1.7 (`abelianCircularNumbers`, `abelianCircularUnits`).

Prove this as follows.

1. `⊇` is the definition: the `η_{m′,F}` are norm-coherent circular units.
2. Remark 1: if some relative norm of a circular number `x` is a unit, then `x` is a unit, hence a circular unit (Sinnott, p. 202).
3. Remark 2: in `D(k)` one may take `a = 1`, since `N_{ℚ(n)/ℚ(n)∩k}(1 − ζ_n^a)` is a Galois conjugate of the element for `n/gcd(n, a)`.
4. Remark 3: for `k` of conductor dividing `m`, `D(k) ∩ 𝒪_k[1/m]^× =` ⟨`±N_{ℚ(n)/ℚ(n)∩k}(1 − ζ_n)` : `n | m`⟩. Indices `n` not prime to `m` reduce to `gcd(n, m)`. For `n` prime to `m`, `k ∩ ℚ(n) = ℚ`, so those factors are integers prime to `m`, hence `±1`.
5. `⊆`: it suffices that the universal norms in `D_ν` lie in `A_ν`, the closure of the Galois span of the `η_{m′,F}` at level `ν` and `𝒞_ν(ℚ)`. The key claim (**) is `N_{ν+μ/ν}(D_{ν+μ}) ⊆ A′_ν·(D_ν)^{p^μ}`. For `x(n)`, `n = m′p^a`: when `a ≤ ν + t` the norm is a `p^μ`-th power; when `a > ν + t` and `m′ ≠ 1`, `x(n)` is in the Galois span of `η_{m′,F}`; when `m′ = 1` it lies in the cyclotomic part.
6. Let `μ → ∞`, intersect with the global units (Remark 1), and pass to closures and the limit.

**Checks.**

- `F = ℚ`: `m = 1`, so there are no `η`'s, and `𝒞_∞ = 𝒞_∞(ℚ(ζ_{p^∞}))`, the cyclotomic units of `ℚ(μ_{p^∞})`.
- Roots of unity of order prime to `p` disappear on pro-`p` parts. At `p=2` this does not apply to `−1`; its finite-level class survives until rationalization. Norm coherence must be checked separately.

See **GREITHER-1992**, §2, Lemma 2.3, p. 456. Lemma 2.3. **GREITHER-1992**, §2, proof of Lemma 2.3, p. 457. The inclusion `⊆`.

*Needs:* [§4.2](#greither-semilocal-norm-descent); IntegralIwasawaTheory §1.7.

<a id="greither-coleman-sequence-all-p"></a>
### 4.4 Coleman's exact sequence over unramified coefficients, including `p = 2` (Greither, Theorem 2.4–Corollary 2.7)
Let `p` be a prime, `F/ℚ` a finite abelian extension unramified at `p`, `Δ=Gal(F/ℚ)`, and `𝒪=ℤ_p⊗_ℤ𝒪_F`, a finite product of unramified DVRs with primitive idempotents `e_1`, …, `e_g`. Write `Frob` for its componentwise Frobenius, `𝒪[[X]]° = {f : f(0) ≡ 1 mod p}`, `φ`: `𝒪[[X]] → 𝒪[[X]]` the `ℤ_p`-algebra endomorphism with `φ|_𝒪 = Frob` and `φ(1 − X) = (1 − X)^p`, and `Γ′ = ℤ_p^×` acting by `[a](1 − X) = (1 − X)^a`. (Theorem 2.4) After fixing `ζ = (ζ_{p^{ν+t}})` generating `ℤ_p(1)`, for odd `p` there is an exact sequence of `Δ × Γ′`-modules `0 → ℤ_p(1)^g → 𝒪[[X]]° → 𝒪[[X]] → ℤ_p(1)^g → 0`, the middle map being `(1 − φ/p)∘log`. For `p = 2` the outer terms are `(ℤ_2(1) × {±1})^g`. The `i`-th factor maps by `ζ ↦ 1−e_i+e_i(1−X)` (and `−1 ↦ 1−2e_i` for `p=2`), and the last map is `f ↦ ζ^{Tr(e_if′(0))}`, with a second component `(−1)^{Tr(e_if(0))}` for `p = 2`. (Lemma 2.5, Theorem 2.6) With `R = 𝒪[[Γ′]]` and `𝒱 = ker(ψ)` for Coleman's trace operator `ψ`: `𝒪[[X]] = R·(1 − X) + φ(𝒪[[X]])` and `𝒱 = R·(1 − X)`, that is, the `ℤ_p[[Γ′]]`-span of `𝒪·(1 − X)`. (Corollary 2.7) `D = (1 − X)d/`dX satisfies `D𝒱 = 𝒱` and gives an `R`-isomorphism `𝒱 → 𝒱(1)`.

This sequence is a target of this roadmap. Greither deduces it from Coleman's *Division values in local fields*, Theorem 22, p. 109, which Greither prints as "Theorem 2.2", for the multiplicative formal group over the integers of an unramified local field, where the torsion term `𝒞` is `{±1}` at `p = 2`; and from Coleman's *Local units modulo circular units*, Lemma 2 and Theorem 3, as invoked in Greither, pp. 460–461. ColemanPowerSeries supplies, over one finite unramified coefficient ring and at every `p` including 2, the determinant norm and integral trace (§§1.82–1.83), their commutation with coefficient Frobenius (§1.85) and the interpolation equivalence (§§1.117–1.120). Its `ℤ_p`-coefficient principal sequence (§3.46) is for odd `p` only and is not used here.

Componentwise multiplicative formulas are embedded as global units by inserting 1 in every other factor. The expressions `e_i(1−X)` and `−e_i` on p. 459 are component notation, not units of the entire product algebra when `g>1`.

Prove this as follows.

1. Reduce to `g = 1` (`𝒪` a domain) using the idempotents.
2. The map. In Coleman's notation `ℱ` is the multiplicative formal group, `ℱ(𝔪) = 𝒪[[X]]°`, `λ = log` is its logarithm and `Θh = h − φh/π` with `π = p`, so `Θ_ℱ = Θ∘λ = (1 − φ/p)log`. It is continuous and `R`-linear. Its values lie in `𝒪[[X]]` by Coleman's Lemma 2(ii) and `p^{−1}·p𝒪 = 𝒪` (Coleman 1979, proof of Theorem 22, p. 109). At 0 its value is `(1−Frob/p)log f(0)`, and its derivative at 0 is `(1−Frob)(log f)′(0)` (display (2) there).
3. The image is `A = {g : g′(0) ∈ (1 − Frob)𝒪}` for odd `p`, with the extra condition `g(0) ∈ 2𝒪 + (1 − Frob)𝒪` for `p = 2`. The inclusion uses `|log a| = |a|` on the relevant discs (Coleman's (1), p. 108). For the reverse inclusion approximate `g ∈` A successively by the series `Θ_ℱ(εX^i)`, `ε` running over the Teichmüller representatives, whose leading terms are `(ε − Frob(ε)p^{i−1})X^i`; Coleman's Lemma 20(ii) makes the resulting product converge in `ℱ(𝔪)` (pp. 109–110).
4. The kernel. `Θ_ℱ(g) = 0` exactly when `log g` is a `ℚ_p`-multiple of `log(1−X)` (p. 110), that is when `g` is a torsion element `≡ 1 mod p` times `(1 − X)^a` with `a ∈ ℤ_p`. The torsion is trivial for odd `p` and `{±1}` for `p = 2`, and the closed span of the `(1 − X)^a` is `Γ′`-isomorphic to `ℤ_p(1)`.
5. The last map. `𝒪` is free over `ℤ_p[Gal(𝒪/ℤ_p)]`: a normal basis of the residue extension (`IsGalois.normalBasis` over `𝔽_p`) lifts by Nakayama. So `Ĥ^{−1}` of `𝒪` vanishes, `(1 − Frob)𝒪 = ker(Tr: 𝒪 → ℤ_p)`, and `Tr` is onto. Hence `A` is the kernel of the displayed last map, which is onto because `y·(1 − X)`, `y ∈ 𝒪`, has derivative `−y` at 0.
6. Lemma 2.5 and Theorem 2.6. `ψ` is the normalized unramified trace, `τ=pψ` for the integral trace `τ` of ColemanPowerSeries §1.83 (§1.93 there), `ψφ = p·Frob` is checked on `𝒪` and on `ℤ_p[[X]]`, so `ψφ` is injective, and `ψ(1 − X) = 0`. Coleman's argument for Lemma 2 and Theorem 3 of *Local units modulo circular units* then applies over `𝒪` without change.
7. Corollary 2.7: `D(1 − X) = −(1 − X)`, and `D([a]g) =` a`·[a]D(g)` (chain rule), so `D` commutes with `R` up to the twist. `ker D = 𝒪` and `𝒪 ∩ 𝒱 = 0` (`ψ` is multiplication by `p` on `𝒪`).

**Checks.**

- `p = 2` differs only by the `±1` torsion, which appears in the first and last terms.
- For `𝒪=ℤ_p×ℤ_p` and `e₁=(1,0)`, the embedded root unit is `(1−X,1)`. The expression `(1−X,0)` is not a unit and cannot define this injection.
- At `p = 2` the constant term matters: for `𝒪 = ℤ_2` and `g = 1 ∈ 𝒪[[X]]`, `g′(0) = 0 ∈ (1−Frob)𝒪 = 0` but `g(0) = 1 ∉ 2ℤ_2`, so `g` is not in the image; the second component `(−1)^{Tr(g(0))} = −1` detects it. At odd `p` the same `g` lies in the image.
- For `𝒪 = ℤ_p` the condition `(1 − Frob)𝒪 = 0` makes A the series with `g′(0) = 0`, and the last map is `f ↦ ζ^{f′(0)}`; replacing the derivative at 0 by the value at 0 would give a map whose kernel is not the image of `Θ_ℱ`.

See **GREITHER-1992**, §2, before Theorem 2.4, p. 458. The set-up with `𝒪` unramified. **GREITHER-1992**, §2, proof of Theorem 2.4, p. 459. The translation from Coleman's Theorem 22, which Greither cites as "Theorem 2.2". **COLEMAN-1979**, Theorem 22 and its proof, pp. 108–110. The sequence, its image and its kernel. **GREITHER-1992**, §2, Lemma 2.5 and Theorem 2.6, p. 460. Coleman's second paper, Lemma 2 and Theorem 3.

*Needs:* `PowerSeries`; `IsGalois.normalBasis`; ColemanPowerSeries §§1.82, 1.83, 1.85, 1.93; ColemanPowerSeries §§1.117–1.120 (with §§0.97 and 0.148–0.150 for the componentwise product).

<a id="greither-semilocal-coleman-map"></a>
### 4.5 The semilocal Coleman map and its kernel and cokernel (Greither, Theorem 2.8, Lemma 2.9, Proposition 2.10)
In the setting of the previous lemma, let `𝒩` be Coleman's norm operator, `𝔐 = {f ∈ 𝒪((X))^× : 𝒩f = Frob(f)}` and `𝔐° = 𝔐 ∩ 𝒪[[X]]°`. (Theorem 2.8) There is an exact sequence `0 → ℤ_p(1)^g → 𝔐° → 𝒱 → ℤ_p(1)^g → 0`, the middle map being `β = (1 − φ/p)log`. (Lemma 2.9) With `U_i = {x ∈ 𝒪[ζ_{p^{i+t}}] : x ≡ 1 mod (1 − ζ_{p^{i+t}})}`, the map `a ↦ f_a` (Coleman's interpolating series, `f_a(1 − ζ_{p^{i+t}}) = Frob^i(a_i)`) is a `ℤ_p[[Γ′]]`-isomorphism `U_∞ = lim U_i → 𝔐°`. (Proposition 2.10) With `δ = D∘log` and `α = Dβ = (1 − φ)δ`, there are exact sequences of `ℤ_p[[Γ′]][Δ]`-modules `0 → ℤ_p(1)^g → 𝔐° →α 𝒱(1) → ℤ_p(1)^g → 0` and `0 → ℤ_p(1)^g → U_∞ →αψ 𝒱(1) → ℤ_p(1)^g → 0`.

`t=1` for odd `p` and `t=2` for `p=2` in both the local unit groups and the evaluation points. At `p=2` the first local level uses fourth roots, not second roots.

Use the signed root generator `s(1−X)`, `s=(−1)^{p−1}`: its norm equals itself. At `p=2` the kernel generator is `−(1−X)`, since `𝒩(1−X)=−(1−X)`. This sign is required by the native Coleman norm at `p=2`.

Prove this as follows.

1. Theorem 2.8. Put `Y=1−X` and `s=(−1)^{p−1}`. The defining product for `𝒩` gives `𝒩(Y)=`sY and `𝒩`(sY)`=`sY`=Frob`(sY), so sY`∈𝔐°`. Claim: `β⁻¹(𝒱)=𝔐°` for odd `p` and `β⁻¹(𝒱)=±𝔐°` for `p=2`. Using `ψφ=p·Frob` and `ψlog=log𝒩` gives `ψβ(f)=log(𝒩f/Frob f)`. Its vanishing means this ratio is 1 for odd `p` and `±1` for `p=2`; multiplying `f` by `−1` switches the dyadic sign because `𝒩(−1)/Frob(−1)=−1`. This yields the stated kernel with the signed generator.
2. The maps `𝒪[[X]] → (ℤ_p(1)[×{±1}])^g` and `𝒱 → ℤ_p(1)^g` have the same kernel, and the second is surjective (take `y·(1 − X), y ∈ 𝒪`). For `p = 2` this uses that `g′(0)` determines `g(0) mod 2` for `g ∈ 𝒱`, by Theorem 2.6. Combine with Theorem 2.4.
3. Lemma 2.9 is Coleman's Corollary 17, with Theorem 16 for the existence and uniqueness of `f_a`. `𝒪` may be a finite product of unramified rings.
4. Proposition 2.10: all maps are `Δ`-equivariant. The first sequence combines Corollary 2.7 with Theorem 2.8, using `Dφ = pφD`, so `D(1 − φ/p) = (1 − φ)D`. The second follows through Lemma 2.9.

**Checks.**

- The kernel `ℤ_p(1)^g` is the Tate module of the roots of unity, one copy per factor of `𝒪`.
- The cokernel `ℤ_p(1)^g` is the cyclotomic moment; its `ρ`-part vanishes when `χ(p) ≠ 1`.
- At `p=2`, `N_{ℚ₂(ζ₈)/ℚ₂(i)}(ζ₈)=−i` and `N(−ζ₈)=−i`. Thus `(−ζ_{2^{i+2}})_i` is norm compatible, whereas the unsigned root sequence is not.
- At `p=2`, `U₀` is taken in `𝒪[i]`, and interpolation evaluates at `X=1−i`.

See **GREITHER-1992**, §2, proof of Theorem 2.8, p. 462. Lemma 2.9. **GREITHER-1992**, §2, Proposition 2.10, p. 462. Proposition 2.10.

*Needs:* [§4.4](#greither-coleman-sequence-all-p); ColemanPowerSeries §§1.82–1.83 (Coleman's norm operator `𝒩` and trace over unramified coefficients); ColemanPowerSeries §§1.117–1.120 (Coleman's Theorem 16 and Corollary 17 over unramified coefficients, every `p`).

<a id="greither-circular-unit-generators"></a>
### 4.6 One generator per character for the circular units (Greither, Lemma 2.11 and Corollary 2.12)
Let `p` be a prime, `F/ℚ` abelian with `p ∤ cond(F)`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^×` the semilocal units above `p`, `U_n` its pro-`p` part, `𝒞_n` Sinnott's circular units of `K_n` and `C_n` the pro-`p` part of their closure in `𝒰_n`; `𝒰_∞`, `U_∞`, `𝒞_∞`, `C_∞` the inverse limits; `t = 1` for odd `p` and `t = 2` for `p = 2`. Let `F` be unramified over `p`, `𝒪 = ℤ_p ⊗ 𝒪_F`, `Δ = Gal(F/ℚ)`, and for a `p`-adic character `χ` of `Δ` and a `ℤ_p[Δ]`-module `M` let `V_χ(M) = ℚ_p ⊗ M ⊗_{ℤ_p[Δ]} ℤ_p[χ]`. Let `χ` have conductor `m | cond(F)` and `F′ = F ∩ ℚ(m)`. `(a) V_χ(ℚ_p ⊗_ℚ F)` is generated over `ℚ_pΔ` by `y_χ = (Tr_{ℚ(m)/F′}(ζ_m))_χ`. `(b)` If `χ ≠ 1`, `V_χ(C_∞) = V_χ(ℤ_p[[Γ′]][Δ])·(η_m)_χ` with `η_m = (N_{ℚ(m)/F′}(1 − ζ_mζ_{p^{ν+t}})^{Frob^{−ν}})_ν`. (Corollary 2.12) `V_χ(𝒱)` is free of rank one over `ℚ_p ⊗ ℤ_p(χ)[[Γ′]]` on `z_χ = y_χ·(1 − X)`.

Greither writes '`F′ = F ∩ ℚ(M)'`. `M` is not defined; `ℚ(m)` is meant.

Greither's `R` is `𝒪[[Γ′]]` on p. 460 but `ℤ_p[[Γ′]]` in Lemma 2.11(b), Corollary 2.12 and p. 465; the target names each ring explicitly.

All rationalized completed group rings mean inversion of `p` after integral completion. The Amice comparison is applied at integral coefficients first and extended through a finite coefficient basis, retaining bounded denominators.

Prove this as follows.

1. `(a) ℚ_pF` is generated by the `x_{m′} = Tr_{ℚ(m′)/F∩ℚ(m′)}(ζ_{m′})`, `m′ | cond(F)`, by additive normal bases. `ker χ` acts trivially on `V_χ`, so `ℚ_pF′` surjects onto `V_χ(ℚ_pF)`. For a proper divisor `m′` of `m`, pick `a ≡ 1 mod m′` with `χ(a) ≠ 1`; then `σ_a` fixes `x_{m′}` and multiplies its image by `χ(a)`, so the image is 0.
2. `(b)` By Lemma 2.3, `C_∞` is generated by `−1`, the `η_{m′}` and the cyclotomic part `C_0`. Tensoring with `ℚ_p`, the fixed part under `ker χ` comes from `F^{ker χ}` (norm argument). As in `(a)` only `η_m` survives; `C_0` dies because `χ` is nontrivial, and `−1` dies in the pro-`p` part (odd `p`) or after `⊗ℚ_2 (p = 2)`.
3. The `ℤ_p[[Γ′]]`-form of the Amice equivalence is derived here. `Γ′=ℤ_p^×`, so the measure–completed-algebra comparison of PadicMeasuresIwasawaAlgebras §1.7 identifies `ℤ_p[[Γ′]]` with the integral measures on `ℤ_p^×`, carrying the group element `[a]` to the Dirac measure at `a`. For such a measure `r`, `r·(1−X)=∫(1−X)^a dr(a)` is the Amice transform of `r`, extended by zero to `ℤ_p`, evaluated at `Z=−X`. The integral unit-measure Amice equivalence (PadicMeasuresIwasawaAlgebras §2.6, unit measures as the kernel of `ψ`) then identifies `ℤ_p[[Γ′]]` with the trace-kernel series module over `ℤ_p`, and the Amice dilation identity (PadicMeasuresIwasawaAlgebras §2.11, dilation pushforward) shows that `[a]` acts by `(1−X)↦(1−X)^a`, which is Greither's action. The check `r=[1]−[a]` gives `(1−X)−(1−X)^a`, whose linear coefficient is `a−1`. Extend this identification coefficientwise along a finite `ℤ_p`-basis of `𝒪`; this is a finite direct-sum calculation. After inverting `p` and taking `Δ`-characters, the normal-basis theorem makes `(ℚ_p⊗F)_χ` one-dimensional over `ℚ_p(χ)`, and `(a)` makes `yχ` a basis. Thus `zχ=yχ(1−X)` is a free basis on every finite `Φ`-character factor of `(ℤ_p(χ)[[Γ′]])[1/p]`. Nonzero alone would not prove freeness over this product ring.

**Checks.**

- For odd `p`, `±1` disappears in the pro-`p` part; for `p = 2` it disappears only after `⊗ℚ_2`, which is why `V_χ` is used.
- For a product ring `A₁×A₂`, the nonzero element (1,0) is not a free basis. Verify faithfulness on both factors; the Amice and normal-basis comparisons supply it here.

See **GREITHER-1992**, §2, before Lemma 2.11, p. 463. Working over `ℚ_p`, one character at a time.

*Needs:* [§4.3](#greither-circular-unit-limit); [§4.4](#greither-coleman-sequence-all-p); [§4.1](#greither-chi-parts); PadicMeasuresIwasawaAlgebras §1.7 (comparison of measures with the completed group algebra); PadicMeasuresIwasawaAlgebras §2.6 (integral unit measures as the kernel of `ψ`); PadicMeasuresIwasawaAlgebras §2.11 (Amice transform of dilation pushforward).

<a id="greither-stickelberger-image"></a>
### 4.7 The Coleman image of the circular units is the Stickelberger series (Greither, Theorem 2.13 and Lemma 2.15)
Let `p` be a prime, `F/ℚ` abelian with `p ∤ cond(F)`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `𝒰_n = (ℤ_p ⊗ 𝒪_{K_n})^×` the semilocal units above `p`, `U_n` its pro-`p` part, `𝒞_n` Sinnott's circular units of `K_n` and `C_n` the pro-`p` part of their closure in `𝒰_n`; `𝒰_∞`, `U_∞`, `𝒞_∞`, `C_∞` the inverse limits; `t = 1` for odd `p` and `t = 2` for `p = 2`. Let `F` be unramified over `p`, `Δ = Gal(F/ℚ)`, `Δ′ = Gal(K_0/ℚ) = Δ × Φ`, `Γ = Gal(K_∞/K_0)`, and `Λ_ρ = ℤ_p(ρ)[[T]]` with the involution `T′ = (1 + T)^{−1} − 1`. For every even nontrivial character `ρ` of `Δ′` with `χ = ωρ^{−1}`: `αψ(V_ρ(C_∞)) = G_p(T′, ρ)·z_{χ^{−1}} ⊂ V_ρ(𝒱(1)) = (V_{χ^{−1}}(𝒱))(1)`, where `G_p(T, ρ)` is the Stickelberger series (Washington's `f(T, ρ)`).

The statement is over `ℚ_p (V_ρ)`. Greither expects an integral version (Remark, p. 468), which is not claimed.

Lemma 2.15(b) as printed has `ζ_mζ_{p^{ν′−1}}` in its second term where `ζ_m^p·ζ_{p^{ν′−1}}` is meant. The proof's left-hand side has the correct `ζ_m^p`.

If `m=cond(ρ|Δ)=1`, the restriction to `Δ` is trivial but `ρ` on `Φ` can be even and nontrivial for odd `p`. This case is proved separately in step 7: Lemma 2.11(b) requires a nontrivial `Δ`-character, and the series `f₀=X` used below is not a unit there. At `p=2`, `Φ=C₂` and evenness forces its character to be trivial, so `m=1` cannot occur under `ρ≠1`.

Prove this as follows.

1. First suppose `m=cond(ρ|Δ)>1`. Lemma 2.11(b) applies to the nontrivial `Δ`-character `ρ|Δ`, so its projected circular-unit module is generated by `η_m`. The following calculation proves the required image on that generator. The separate `m=1` case is treated after this calculation.
2. Let `f_0 = ζ_mX + (1 − ζ_m)` and `e = |(𝒪/p𝒪)^×|`. Its constant term satisfies `f_0(0)^e ≡ 1 mod p` and `𝒩(f_0) = Frob(f_0)`, so `f_0^e ∈ 𝔐°`, and `ψ(η^e) = N_{ℚ(m)/ℚ(m)∩F}(f_0^e)`. Here `𝔐°` requires the constant-term congruence, as in Greither's definition on p.458; no congruence of the whole series to 1 is needed. It suffices that `(1 − φ)δ(f_0)_{χ^{−1}} = (G_p(T′, ρ)·ζ_m(1 − X))_{χ^{−1}}`, then take the norm.
3. Evaluate at `X = 1 − ζ_{p^{ν′}} (ν′ = ν + t)`; these evaluations separate points. The left side: `δ(f_0) = (1 − X)ζ_m/(ζ_mX + 1 − ζ_m)`, so `(1 − φ)δ(f_0)|_{1−ζ_{p^{ν′}}} = ζ_{p^{ν′}}ζ_m/(1 − ζ_{p^{ν′}}ζ_m) − ζ_{p^{ν′−1}}ζ_m^p/(1 − ζ_{p^{ν′−1}}ζ_m^p)`.
4. The right side: with `q_ν = m·p^{ν′}` and the Stickelberger elements `ξ′_ν(ρ) = −q_ν^{−1}Σ_a` a`·ρω^{−1}(a)γ_ν(a)` (Washington, p. 118, as used by Greither, p. 467), `G_p(T′, ρ) = lim ξ′_ν(ρ)`. This limit is IntegralIwasawaTheory §6.3 (`bernoulliStickelberger_dictionary`) with that roadmap's `m` equal to `cond(ρ|Δ)`, including `m=1`, at every `p` (`q=4` at `p=2`): the `ρω^{−1}`-projection of the Bernoulli distribution at level `ν`, with coefficient `a/q_ν−1/2` at `σ_a⁻¹`, written in the coordinates `γ_ν(a)` and inverted, is `ξ′_ν(ρ)`. The constant `−1/2` contributes `−½Σ_aρω^{−1}(a)γ_ν(a)=0`, because `ρ` is even and `ω` odd, so `ρω^{−1}` is a nontrivial character of `Δ′` and its sum over each fibre of `a↦γ_ν(a)` vanishes. The interpolation `G_p(u^s−1,ρ)=L_p(s,ρ)` is the dictionary's `f_ρ(u^s−1)=L_p(ρ,s)`. Then `q_ν·G_p(T′, ρ)z_{χ^{−1}}|_{1−ζ_{p^{ν′}}} = −(Σ_{(a,q_ν)=1} a(ζ_mζ_{p^{ν′}})^a)_{χ^{−1}}`.
5. Lemma 2.15: `(a) Σ_{a=1}^{q_ν}` a`·x^a = −q_ν·x/(1 − x)` for `x = ζ_mζ_{p^{ν′}}`, a root of unity of order `q_ν`, `x ≠ 1`. `(b)` Removing the multiples of `p` gives `Σ_{(a,p)=1}` a`·x^a = −q_ν·x/(1 − x) + q_ν·x^p/(1 − x^p)`, with `x^p = ζ_m^pζ_{p^{ν′−1}}`. So the terms with `(a, p) = 1` give the left side.
6. The terms with `(a, m) > 1` lie in `ℚ(ζ_d, ζ_{p^{ν′}})` for proper divisors `d` of `m`. Their `χ^{−1}`-part vanishes because `m` is the conductor (as in Lemma 2.11), so they contribute 0.
7. If `m=1`, then `p` is odd and `ρ` is an even character, trivial on `Δ` and nontrivial on `Φ≅μ_{p−1}⊂Γ′`. Fix `b∈μ_{p−1}` with `ρ(b)≠1`.
   - Reduction to one smoothed unit. The `ρ`-part of the valuation module `ℤ_p[Δ/D]` vanishes, because `Φ` acts trivially on it (`p` is totally ramified in `ℚ(μ_p)`). So `V_ρ` of the semilocal units equals `V_ρ` of the full completed multiplicative groups, and the norm-coherent system `π=(1−ζ_{p^{ν+1}})_ν` may be used there. Since `ρ` is trivial on `Δ` and `|Δ|` is invertible after `⊗ℚ_p`, even if `p` divides it, `V_ρ` sees only norms from `K_ν` to `ℚ(μ_{p^{ν+1}})`. By the distribution relations these norms take every `η_{m′,F}` into the `Λ[Φ]`-span of `π`, with Euler factors `∏_{q|m′}(1−Fr_q^{−1})`. Lemma 2.3 (§4.3) then gives `V_ρ(C_∞)=V_ρ(Λ[Φ]π)`. Since `σ_b−1` acts on the `ρ`-part as the unit `ρ(b)−1`, also `V_ρ(C_∞)=V_ρ(Λ·c_b)` for the system of units `c_b=(σ_b−1)π=((1−ζ_{p^{ν+1}}^b)/(1−ζ_{p^{ν+1}}))_ν`.
   - Its Coleman series. `π` has Coleman series `X`, and `σ_b` acts on Coleman series by `g↦g∘[b]`, so `c_b` has the series `[b]X/X=(1−(1−X)^b)/X`, with constant term `b`. Multiplying by the constant system `b^{−1}`, which is norm-coherent because `b^p=b`, puts it in `𝔐°` without changing `δ`. By the chain rule `δ(g∘[b])=b·[b]δ(g)` (proof of Corollary 2.7), and `φ` commutes with `[b]`, so `αψ(c_b)=(b[b]−1)(1−φ)δ(X)`, with `δ(X)=(1−X)/X`.
   - Integrality on the `χ^{−1}`-part. `αψ(c_b)` lies in `𝒱(1)`, so it is an integral power series. On the `χ^{−1}`-part, `[b]` acts as `χ^{−1}(b)`, so `b[b]−1` acts as `ω(b)χ^{−1}(b)−1=ρ(b)−1`, a unit by §0.21. Hence `((1−φ)δ(X))_{χ^{−1}}=(ρ(b)−1)^{−1}αψ(c_b)_{χ^{−1}}` is an integral power series, although `(1−φ)δ(X)` itself is only meromorphic: with `Y=1−X` it equals `r(Y)−r(Y^p)` for `r(Y)=Y/(1−Y)`, with simple poles at `Y^p=1`. The projection removes them. At `X=0` the polar term is `(1−p^{−1})X^{−1}`, and `[b′]X^{−1}=(b′X)^{−1}+`(power series) for `b′∈μ_{p−1}`; the `χ^{−1}`-projection `(p−1)^{−1}Σ_{b′∈μ_{p−1}}χ(b′)[b′]` multiplies the polar term by `(p−1)^{−1}Σ_{b′}χω^{−1}(b′)=(p−1)^{−1}Σ_{b′}ρ^{−1}(b′)=0`. The residues at the points `X=1−ζ_p^j`, `j≠0`, come from `r(Y^p)` and cancel in the same way. Cancelling the pole at `X=0` alone would not show integrality.
   - Identification with the Stickelberger series. Steps 3–5 apply verbatim with `ζ_m=1` at every evaluation point `X=1−ζ_{p^{ν′}}` with `ν′≥2`, where `x=ζ_{p^{ν′}}` and `x^p≠1`, so Lemma 2.15(b) holds; there are no terms with `(a,m)>1`. Two bounded power series that agree at infinitely many points of the open unit disc are equal, by Weierstrass preparation. So `((1−φ)δ(X))_{χ^{−1}}=(G_p(T′,ρ)(1−X))_{χ^{−1}}`, with `z_{χ^{−1}}=1·(1−X)` because `y_χ=1` for `m=1`.
   - Conclusion. `αψ(c_b)_{χ^{−1}}=(ρ(b)−1)·((1−φ)δ(X))_{χ^{−1}}` with `ρ(b)−1` a unit, and `V_ρ(C_∞)=V_ρ(Λ·c_b)`. Therefore `αψ(V_ρ(C_∞))=G_p(T′,ρ)·z_{χ^{−1}}`, as for `m>1`. The bottom point `ν′=1` is excluded from the evaluation: there `x^p=1`, and both `φδ(X)` and Lemma 2.15(b) have a pole. Substituting `m=1` into the unit-series computation of steps 2–3, without the smoothing by `σ_b−1`, is invalid because `f₀=X` has zero constant coefficient.
8. Steps 8–12 compare this image with the normalisation of ColemanPowerSeries §§4.24, 4.27; step 7 does not use them. As in step 7 the component is that of `F=ℚ`. Use a natural `a`
   prime to `p` whose image generates `ℤ_p^×`. The genuine cyclotomic unit
   `c(a)_n=(ζ_n^a−1)/(ζ_n−1)` has unit series
   `f_a(Z)=Σ_(0≤i<a)(1+Z)^i`. Its principal real adjustment `q(a)`, supplied
   by ColemanPowerSeries §4.24, differs by a Teichmüller constant and a
   compatible root of unity. Both are killed by the Coleman map and
   by `αψ`. Put `Y=1−X` and `h_a(X)=f_a(−X)=(1−Y^a)/(1−Y)`.
   Its constant term `a` is a `p`-adic unit; `f₀=X` is never used as a unit.
9. Prove `pureCyclotomic_coleman_transport`. Distinguish the series
   variable `Z` from the Iwasawa variable `T`. Let `C(F)(X)=F(−X)`,
   `∂=(1+Z)d/`dZ, `D=(1−X)d/`dX, and A the intrinsic unit Amice transform.
   Then DC`=−C∂` and `Cφ_Z=φ_XC`, where
   `φ_Z(F)=F((1+Z)^p−1)` and `φ_X(H)=H(1−(1−X)^p)`.
   These are arithmetic Frobenius substitutions; coefficients are `ℤ_p`
   in this case. The supplier's raw map satisfies
   `A(Col₀(u))=H((1−φ_Z)∂log f_u)`, where `H` is inverse weighting and
   `∂H=`id on unit-supported series. Thus, for `Θ=C∂A`,
   `αψ(u)=−Θ(Col₀(u))=Θ(Col(u))`, since `Col=−Col₀`.
   Omitting `∂` would incorrectly suppress the Tate twist. Indeed
   `Θ([b]μ)=b[b]Θ(μ)`; on finite characters this sends `ρ` to
   `ρω⁻¹=χ⁻¹` before the target twist (1).
10. Prove `pureCyclotomic_smoothed_stickelberger`: the finite-sum calculation
   of step 7, with the global smoothed unit in place of `c_b` and the
   normalization of `G_p` fixed in step 4.
   Set `r(Y)=Y/(1−Y)` and `S_a=a[a]−1`, where `[a]` acts by `Y↦Y^a` on
   Greither's series module. Rational differentiation gives
   Dlog `h_a=`a `r(Y^a)−r(Y)`. For `ν′≥2`, `Y=ζ_(p^ν′)` and `Y^p≠1`.
   The identity of step 5 with `m=1` gives
   `−p^(−ν′)Σ_(1≤b≤p^ν′,p∤b)bY^b=r(Y)−r(Y^p)`.
   Apply `a[a]−1` and project to `χ⁻¹`. Evaluation separation therefore
   proves the identity of integral series
   `αψ(q(a))_ρ=S_a G_p(T′,ρ)·e_(χ⁻¹)Y`.
   Although `r` has a pole at `Y=1`, its smoothed difference is the regular
   logarithmic derivative of `h_a`. Only these regular series are
   compared; the separating evaluations are all nonzero roots.
11. The constant of `S_a` on this finite-character factor reduces modulo
    the maximal ideal to `ρ(ω(a))−1`. It is nonzero because `ρ` is a
    nontrivial prime-to-`p Φ`-character and `ω(a)` generates `Φ`. Thus `S_a`
    is a unit of `Λ_(χ⁻¹)`. The vector `e_(χ⁻¹)Y` freely generates the
    rational trace-kernel component (the unit-support Amice equivalence).
    Cyclicity of `q(a)` on the real circular-unit tower gives again
    `αψ(V_ρ(C∞))=G_p(T′,ρ)·e_(χ⁻¹)Y`, in agreement with step 7. Combined with step 9 and the
    supplier's `Col(q(a))=([a]−1)ζ_p`, this identifies the independently
    normalized Coleman numerator with the Stickelberger series. It is
    an equality through specified maps, without renormalizing `ζ_p`.
12. Finally arithmetic `γ` acts on the target series by its actual
    substitution. The finite Stickelberger elements in step 4 contain
    `γ_ν(b)`, whereas `G_p(T,ρ)` contains `γ_ν(b)⁻¹`. Hence the coordinate
    there is `T′=(1+T)⁻¹−1`, not `T` or `−T`. This inversion of `Γ` is
    separate from `C`:`Z↦−X` and from the factor `b` in `Θ`'s covariance.

**Checks.**

- For `F=ℚ` and `p=5`, `ρ=ω²` is even and nontrivial on `Φ` but has `m=cond(ρ|Δ)=1`, so the nontrivial `Δ`-character lemma cannot justify it and step 7 is needed. Take `b` the Teichmüller lift of 2, of order 4. Then `ρ(b)=b²=−1`, so `b[b]−1` acts on the `χ^{−1}`-part as `−2`, a 5-adic unit, and the polar coefficient is `Σ_{b′∈μ₄}ρ^{−1}(b′)=1−1+1−1=0`.
- Trivial `ρ` is excluded from step 7. For `ρ=1` the polar coefficient is `Σ_{b′}1=p−1≠0`, and `ρ(b)−1=0` for every `b`; this is the pole of the `p`-adic zeta function.
- For the comparison of steps 8–11 in the same case choose `a=2`. Then `h₂=2−X`, Dlog `h₂=−(1−X)/(2−X)`,
  and the linear coefficient of `(1−φ_X)`Dlog `h₂` is `(1−5)/4=−1`.
  The normalized Coleman second moment is `+1`, whose image under `C∂A`
  has linear coefficient `−1`. The raw map gives the opposite moment.
  Also `S₂` reduces to `(−1)−1=−2=3` in `𝔽₅`, so it is a unit. These
  computed two-term witnesses distinguish all three sign/weight choices.
- For `γ=1+T`, inversion begins `T′=−T+T²+⋯`. Its quadratic coefficient
  is 1, whereas the coordinate substitution `−T` has quadratic coefficient
  0. The two substitutions cannot be interchanged.
- For `a=1` the genuine unit is 1, `S₁=0` and its Coleman image is 0;
  the unit-cancellation step requires the chosen nontrivial `ρ` and a.
- At `p=5`, `h₂(X)^4=(2−X)^4` has constant coefficient 1 modulo 5,
  but its `X⁴` coefficient is also 1. The constant-term condition of
  `𝔐°` must not be strengthened to a congruence of the entire series.
- For `(m,p,ν′)=(3,2,2)`, put `x=ζ₃ζ₄`, a primitive twelfth root. Then `Σ_{a=1}^{12}`a `x^a=−12x/(1−x)`. Removing the even a gives `−12x/(1−x)+12x²/(1−x²)`, with `x²=ζ₃²ζ₂`. Replacing `ζ₃²` by `ζ₃` changes this nonzero rational function value. The same test applies at (5,3,1), (7,2,3) and (3,5,1).

See **GREITHER-1992**, §2, proof of Theorem 2.13, p. 466. The one-generator reduction is valid for nontrivial `ρ|Δ`. For `m=1` the smoothed-unit argument of step 7 replaces it. **GREITHER-1992**, §2, proof of Corollary 2.7, p. 461. The identity `D([a]g)=`a`·[a]D(g)` used for the smoothing factor. **GREITHER-1992**, §2, proof of Theorem 2.13, right-hand side, p. 467. The Stickelberger computation; Lemma 2.15(b) is misprinted. **GREITHER-1992**, §2, Remark after Theorem 2.13, p. 468. Greither's remark that an integral version is expected.
Steps 8–12 are the comparison of that smoothed conductor-one image with the
ColemanPowerSeries §§4.24, 4.27 normalisation, using the same finite-sum identity, **RJW-PADIC-L**, §10.2–§10.3, Theorems 12.17, 12.23 and §12.3–§12.4,
pp.48–49, 62–65 (arXiv v2), and the signed actual-generator theorem of
ColemanPowerSeries §4.24. Neither step 7 nor steps 8–12 use Greither's nontrivial-`Δ` lemma
at `m=1` or an unspecified comparison of analytic normalizations.

*Needs:* [§0.3](#distribution-relation-of-dvd); [§0.5](#distribution-relation-frobenius); [§0.21](#one-sub-root-of-unity-unit); [§4.3](#greither-circular-unit-limit); [§4.4](#greither-coleman-sequence-all-p); [§4.5](#greither-semilocal-coleman-map); [§4.6](#greither-circular-unit-generators); IntegralIwasawaTheory §6.3 (`bernoulliStickelberger_dictionary`); `Finset.prod_range_succ`; `PowerSeries`; ColemanPowerSeries §4.27; ColemanPowerSeries §4.24.

<a id="greither-semilocal-units"></a>
### 4.8 Semilocal units modulo circular units (Greither, Theorem 2.13 and Corollary 2.14)
Let `p` any prime (`p = 2` included), `F/ℚ` abelian and unramified at `p`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `Δ′ = Gal(K_0/ℚ)`, `Γ = Gal(K_∞/K_0) ≅ ℤ_p`, and `Λ_χ = ℤ_p(χ)[[T]]`, and `ρ` an even nontrivial character of `Δ′`, with `χ = ωρ^{−1}`. Then `Q_p ⊗ (U_∞/C_∞)_ρ` and `Λ_χ[1/p]/(G_p(T, ρ))*(1)` have the same characteristic ideal over `Q_pΛ_ρ`, and they are isomorphic if `χ(p) ≠ 1`. Here `U_∞` and `C_∞` are the pro-`p` parts of the limits of semilocal units and of Sinnott's circular units, `G_p(T, ρ)` is Washington's `f(T, ρ)` with `L_p(s, ρ) = G_p(u^s − 1, ρ)`, and * means `Δ′ × Γ` acts through the inverse. This is the form of Iwasawa's and Gillard's theorem for all `p` that Greither proves in §2.

The proof uses Coleman's theory adapted to unramified coefficients and `p = 2` (§4.4, §4.5). Coleman's interpolation and norm operator over one unramified coefficient ring are ColemanPowerSeries §§1.82–1.85 and 1.117–1.120; his exact sequence over unramified coefficients at every `p` is proved in §4.4.

Characteristic ideals are compared after `⊗Q_p`, so only up to powers of `p`. The `μ = 0` input of §3 removes these.

Rationalization means `ℚ_p⊗Λ_χ=Λ_χ[1/p]`, the bounded-denominator series ring, and similarly on every finite character factor. It is not the full formal series ring `ℚ_p(χ)[[T]]`. For example `T−p` remains a nonunit in `Λ_χ[1/p]` although it is a unit in the full field-coefficient series ring.

Prove this as follows.

1. Theorem 2.13 (§4.7) gives `αψ(V_ρ(C_∞)) = G_p(T′, ρ)·z_{χ^{−1}}`, and `z_{χ^{−1}}` is a free generator (Corollary 2.12). So `V_ρ(𝒱(1))/αψ(V_ρ(C_∞)) ≅ Λ_{χ^{−1}}[1/p]/(G_p(T′, ρ))(1)`, and `T ↦ T′` turns it into `(Λ_χ[1/p]/(G_p(T, ρ)))*(1)`.
2. Proposition 2.10 gives `0 → V_ρ(ℤ_p(1)^g) → V_ρ(U_∞/C_∞) → V_ρ(𝒱(1))/αψ(V_ρ(C_∞)) → V_ρ(ℤ_p(1)^g) → 0`, using `ℤ_p(1)^g ∩ C_∞ = ℤ_p(1)` and `V_ρ(ℤ_p(1)) = 0` since `ρ ≠ ω`. Since `ℤ_p(1)^g ≅ ℤ_p[Δ/D] ⊗ ℤ_p(1)`, with `D` the decomposition group of `p`, the outer terms vanish when `χ(p) ≠ 1`.
3. Multiplicativity of characteristic ideals gives the corollary.

**Checks.**

- `χ(p) = 1` (`p` splits in the `χ`-field): isomorphism is lost, but equality of characteristic ideals remains.
- Retain the height-one factor `T−p` under rationalization. Replacing the coefficient ring by the unrestricted formal series ring would lose it.

See **GREITHER-1992**, §2, Theorem 2.13 and Corollary 2.14, p. 465. The corollary. **GREITHER-1992**, §2, proof of Corollary 2.14, p. 465. The sequence with the outer terms.

*Needs:* [§4.1](#greither-chi-parts); [§4.5](#greither-semilocal-coleman-map); [§4.7](#greither-stickelberger-image); [§4.2](#greither-semilocal-norm-descent); IntegralIwasawaTheory §6.3; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

<a id="greither-chebotarev-at-two"></a>
### 4.9 Kolyvagin primes with prescribed class and Kummer symbol, including `p = 2` (Greither, Theorem 3.7 and Corollary 3.8)
Let `K/ℚ` be real abelian, `G = Gal(K/ℚ)`, `M` a power of `p` (`M ≥ 4` if `p = 2`), `c ∈ A(K)`, `W ⊆ K^×/K^{×M}` a finite `ℤ[G]`-submodule and `ψ`: `W → (ℤ/M)[G]` a `G`-homomorphism; let `2^h` be the exact power of 2 dividing `cond(K)`. Then there are infinitely many primes `λ` of `K` such that, with `ℓ` the rational prime below `λ` and the bracketed factors present only for `p = 2`: `(1) [λ] = [2^{h+2}]·c` in `A(K)`; `(2) ℓ ≡ 1 mod M` and `ℓ` splits completely in `K`; `(3) (w)_ℓ = 0` in `𝒥_ℓ/M𝒥_ℓ` for all `w ∈ W`, and there is `u ∈ (ℤ/M)^×` with `φ_ℓ(w) = [2^{h+2}]·u·ψ(w)λ` for all `w ∈ W`. (Complement) For `K = K_ν^+` and `p = 2` the factor `2^{h+2}` may be replaced by 4. (Corollary 3.8) For `K = K_ν^+` and every `p`, the conclusions hold with `[λ] = p²·c` and `φ_ℓ(w) = p²·u·ψ(w)λ`. Here `𝒥_ℓ` is the group of divisors above `ℓ` and `φ_ℓ`: `(𝒪_K/ℓ)^× → 𝒥_ℓ/M𝒥_ℓ` is Rubin's map (Lemma 3.5).

For odd `p` this is Rubin's Theorem 3.1 (The main conjecture, appendix to Lang's Cyclotomic Fields), whose Kolyvagin prime sets and Frobenius criterion are §F.4 (`mem_rubinPrimes_of_frobenius`). The selection itself, one Frobenius class in a compositum and the Chebotarev theorem, is steps 4–5 below, at every `p`. Lemmas 3.5 (the map `φ_ℓ`) and 3.6 (the Euler-system identities `(κ_r)_ℓ = 0` for `ℓ ∤ r` and `(κ_{ℓr′})_ℓ = φ_ℓ(κ_{r′})`) are Rubin's Lemmas 2.3 and 2.4.

`H` is the 2-class field of `K` in the wide sense, so `Gal(H/K) ≅ A(K)`; the class field theory is IntegralIwasawaTheory §2.3 with Tau Ceti ClassFieldTheory Layer 13, and the prime selection uses the Tau Ceti Chebotarev roadmap.

Prove this as follows.

1. Claim `(a)`: `[H ∩ K′ : K] ≤ 2^h`, and `H ∩ K′ = K` for `K = K_ν^+`. If `h > 0`, 2 ramifies in `K/ℚ` with exponent at most `2^{h−1}`, so the primes above 2 ramify in `K′/K` with exponent at least `M/2^h`. For `K = K_ν^+` the only subfield of `K′` unramified everywhere over `K` is `K`.
2. Claim `(b)`: `Gal(H ∩ K″/K)` is killed by `2^{h+1}` (by 2 for `K = K_ν^+`). Complex conjugation `j` of `K′` acts as `−1` on `Gal(K″/K′)` and trivially on `Gal`(HK`′/K′`), so `K″ ∩` HK`′/K′` is 2-elementary; combine with `(a)`.
3. Claim `(c)`: the Kummer injection `Gal(K″/K′) → Hom(W, μ_M)` has cokernel killed by 2. The kernel `U` of `K^×/K^{×M} → K′^×/K′^{×M}` embeds in `H¹(K′/K, μ_M)`. With `Z = K(μ_4) ∩ K′`, either `Z = K` and `|U| ≤ 2`, or `U` is a Klein four group bounded by `|H¹(K′/Z, μ_M)|·|H¹(Z/K, μ_M)| ≤ 4`.
4. Core: the restriction square for `Gal(K″H/K)` is cartesian and its lower right group is killed by `2^{h+1}`. Define `ι`:`(ℤ/M)[G]→μ_M` by its coefficient at 1. Claim `(c)` supplies `γ∈Gal(K″/K′)` mapping to `2ιψ`. Let `γ₁=2·Art_H(c)`. Their restrictions to `K″∩H` need not agree, but multiplying both by `2^{h+1}` kills the discrepancy. Therefore choose `δ` with `δ|K″=2^{h+1}γ` and `δ|H=2^{h+1}γ₁=2^{h+2}Art_H(c)`. Chebotarev then gives degree-one primes with this Frobenius class.
5. `δ` is trivial on `K′`, so `ℓ ≡ 1 mod M`; its class on `H` gives (1). Comparing '`w` is an `M`-th power `mod λ'` through `γ` and through `φ_ℓ` gives `φ_ℓ(w) = 2^{h+2}·u·ψ(w)λ`, as in Rubin, p. 403.
6. Complement: when `K=K_ν⁺` the common restriction group is killed by 2; choose `δ|K″=2γ` and `δ|H=2γ₁=4Art_H(c)`. Both the prescribed ideal class and symbol therefore acquire factor 4. For odd `p`, replacing `c` and `ψ` by `p²c` and `p²ψ` in the prime-selection theorem gives Corollary 3.8.

**Checks.**

- `p = 2` loses only a bounded power of 2 (4 at the layers `K_ν^+`), which the final argument absorbs.

See **GREITHER-1992**, §3, Rubin's maps and Euler systems, p. 471. Every circular number starts an Euler system. **GREITHER-1992**, §3, proof of Theorem 3.7, p. 472. The fields `K′ = K(μ_M)`, `K″ = K′(W^{1/M})`, `H`. **GREITHER-1992**, §3, proof of Theorem 3.7, p. 473. The cartesian diagram and the choice of `δ`. **GREITHER-1992**, §3, Corollary 3.8, p. 474. Corollary 3.8.

*Needs:* [§4.1](#greither-chi-parts); §F.4 (Kolyvagin prime sets); IntegralIwasawaTheory §2.3 (the 2-class field as the unramified module); `TauCetiRoadmap.ClassFieldTheory Layer 13` (Hilbert class field); `TauCetiRoadmap.Chebotarev` Layer 10; `TauCetiRoadmap.ProfiniteCohomology` Layer 9 (Kummer theory).

<a id="greither-finite-level-links"></a>
### 4.10 Links between the Iwasawa modules and the finite layers, with bounded constants (Greither, Lemmas 3.9–3.11)
Let `F/ℚ` be abelian and unramified at `p`, `K_n = F(ζ_{2p^{n+1}})`, `Δ = Gal(K_0^+/ℚ)`, `G_n = Gal(K_n^+/ℚ)`, `Γ_n = Gal(K_n^+/K_0^+)`, `γ` a generator of `Γ = lim Γ_n` and `γ_n = γ^{p^n}`. Write `X = lim A(K_n^+)`, and `E_∞`, `C_∞` for the plus-part limits of the global units and circular units. For an even character `χ ≠ 1` of `Δ` put `Λ_χ = ℤ_p(χ)[[T]]`, `Λ_{n,χ} = Λ_χ/(1 − γ_n)`, and let `H_χ` generate `char((E_∞/C_∞)_χ)`. Fix a quasi-isomorphism `X_χ → ⊕_{i=1}^k Λ_χ/(g_i)`, so that `char(X_χ) = (g)` with `g = g_1⋯g_k`. (Lemma 3.9) There are `c_1 = c_1(F)` and `G_n`-maps `ϑ_n`: `E_{n,χ} → Λ_{n,χ}` with `(γ − 1)²p^{c_1}·H_χ·Λ_{n,χ} ⊆ ϑ_n(im C_{n,χ}) ⊆ p^{−c_1}·H_χ·Λ_{n,χ}`. (Lemma 3.10) There are `c_2 = c_2(F)` and `G_n`-maps `τ_n`: `A_{n,χ} → ⊕_i Λ_{n,χ}/(g_i)` with `p^{c_2}·coker(τ_n) = 0`. (Lemma 3.11) `γ − 1` acts on `X` with finite kernel and cokernel.

Prove first `rubinUnitTateBound`. Let `K_∞/K_0` be a `ℤ_p`-extension of a totally real field in which every prime above `p` is totally ramified from `K_0` on and no other prime ramifies, with layers `K_m`, `Γ_{m,n}=Gal(K_m/K_n)`, `E_m` the units of `K_m` and `Ĥ^i` Tate cohomology. Then there is an integer `k`, independent of `m≥n≥0`, with

```text
#[(γ − 1)Ĥ^0(Γ_{m,n}, E_m)] ≤ p^k,        #[(γ − 1)Ĥ^{−1}(Γ_{m,n}, E_m)] ≤ p^k.
```

This is Rubin's Lemma 1.2 (Rubin, Invent. Math. 93 (1988), p. 703, with its proof on pp. 703–704). Greither notes (pp. 475–476) that the hypothesis there that `[K_0^+:ℚ]` is prime to `p` is not used in full: it suffices that the primes above `p` are totally ramified in `K_∞^+/K_0^+` and that `K_0^+` is linearly disjoint from the cyclotomic `ℤ_p`-extension of `ℚ`. For `K_∞^+` over `K_0^+` with `F` unramified at `p` both conditions hold, by the Mathlib ramification contract: `p` is totally ramified in `ℚ(μ_{p^∞})` and unramified in `F`. Prove it as follows.

1. Let `E′_m` be the `p`-units and `R_m` the free `ℤ`-module on the primes of `K_m` above `p`, so `0→E_m→E′_m→R_m→0`. Total ramification makes `Γ` act trivially on `R_m`. So `Ĥ^{−1}(Γ_{m,n},R_m)=0`, `Ĥ^0(Γ_{m,n},R_m)=(ℤ/p^{m−n})^s` with `s` the number of primes above `p` in `K_0`, and `γ−1` kills `Ĥ^0(R_m)`.
2. Capitulation. Every ramified prime of `K_m/K_n` lies above `p`, so Hilbert 90 gives `Ĥ^{−1}(Γ_{m,n},E′_m)≅H^1(Γ_{m,n},E′_m)≅ker(Cl_S(K_n)→Cl_S(K_m))` for `S` the primes above `p` and `∞`. Its order is bounded independently of `m` and `n` by IntegralIwasawaTheory §2.8 (`uniformCapitulationBound`, `S`-class version). This replaces Rubin's appeal to Iwasawa's 1973 Annals paper, §5.4.
3. The Herbrand quotient of the `p`-units is `#Ĥ^0/#Ĥ^{−1}=p^{(m−n)(s−1)}`, because `E′_m⊗ℚ` is the augmentation part of `ℚ`[{primes above `p` and `∞`}] as a `Γ_{m,n}`-module and the Herbrand quotient depends only on the rational representation: two lattices in it are related by a map with finite kernel and cokernel (Tau Ceti `TateCohomology.herbrandQuotient` and `herbrandQuotient_trivial_int_eq_card`; multiplicativity and the finite kernel and cokernel invariance are `TauCetiRoadmap.ClassFieldTheory` Layer 0). The `s` fixed places above `p` contribute `ℤ` with quotient `p^{m−n}` each, the free orbits of infinite places contribute induced modules with quotient 1, and the augmentation removes one copy of `ℤ`. With step 2 this bounds `#Ĥ^0(Γ_{m,n},E′_m)` between `p^{(m−n)(s−1)}` and `p^{(m−n)(s−1)+r}`.
4. The norm `N_{n/0}` induces a surjection `Ĥ^0(Γ_{m,n},E′_m)/(γ−1)→E′_n/(N_{m/n}E′_m+(γ−1)E′_n)→N_{n/0}E′_n/N_{m/0}E′_m`, and comparing the orders of `Ĥ^0` at levels `(m,n)`, `(n,0)` and `(m,0)` gives `#((γ−1)Ĥ^0(Γ_{m,n},E′_m))≤p^{2r}` (Rubin, p. 704).
5. The sequence of step 1 gives `Ĥ^0(E_m)`↪`Ĥ^0(E′_m)`, and `Ĥ^0(R_m)→Ĥ^{−1}(E_m)→Ĥ^{−1}(E′_m)` with `γ−1` killing the first term. Both bounds follow with `k=2r`.

**Checks for `rubinUnitTateBound`.**

- For `K_0=ℚ` and `p` odd, `K_m=ℚ_m` has one prime above `p`, `s=1`, and the Herbrand quotient of the `p`-units is 1. The bound is then the capitulation bound alone.
- The factor `γ−1` is needed: `Ĥ^0(Γ_{m,n},R_m)=(ℤ/p^{m−n})^s` is unbounded in `m−n` when `s≥1`, and it is killed by `γ−1` only because `Γ` acts trivially on the primes above `p`. A prime above `p` that splits further in the tower would break this.
- Without the capitulation bound the argument fails: a bound on `Ĥ^{−1}` at each level separately, growing with `m`, would not give a constant `k`.

Lemmas 3.9–3.11 are then proved as follows.

1. Lemma 3.9. The sequence `0 → lim H^{−1}(Γ_{mn}, E_m) → (E_∞)_{1−γ_n} → E_n → lim H⁰(Γ_{mn}, E_m) → 0` has outer terms killed by `(γ − 1)p^κ`, by `rubinUnitTateBound`.
2. `V_χ(U_∞)` is free cyclic over `ℚ_p ⊗ Λ_χ` (proof of Corollary 2.14), hence so is `V_χ(E_∞)`. This gives `α`: `E_{∞,χ} → Λ_χ` with finite cokernel and kernel killed by a power of `p`.
3. A `Tor` argument gives `0 → A_n → (E_{∞,χ})_{1−γ_n} → E_{n,χ} → B_n → 0` with `(γ − 1)p^{c′}` killing `A_n` and `B_n`. Maps `ϑ_n` then fit a square with `(γ − 1)²p^{2c′}α` on top (Rubin, p. 705).
4. `H_χ·(α(E_{∞,χ})/α(im C_{∞,χ}))` is finite, so `p^sH_χ ∈ α(im C_{∞,χ})`, giving `(γ − 1)²p^{s+2c′}H_χΛ_{n,χ} ⊆ ϑ_n(im C_{n,χ})`. Also `p^{s′}·im C_{∞,χ} ⊆ H_χE_{∞,χ}`, because `ℚ_pE_{∞,χ}` is cyclic. Take `c_1 = max(s′, s + 2c′)`.
5. Lemma 3.11. `X` is finitely generated `Λ`-torsion, so it suffices that `Z = X/(γ − 1)X` is finite. `Z` is the Galois group of the maximal unramified `p`-extension `N` of `K_∞^+` that is abelian over `K_0^+`. `N` is unramified outside `p` and is a compositum of finitely many `ℤ_p`-extensions and a finite extension. By Leopoldt for the real abelian `K_0^+` its only `ℤ_p`-extension is `K_∞^+`, so `N/K_∞^+` is finite.
6. Lemma 3.10. By Washington, p. 278, `A_n ≅ X/Y_n` with `Y_n = ((1 − γ_n)/(1 − γ))·Y_0` and `(γ − 1)X ⊆ Y_0 ⊆ X`. So the kernel of `X/(1 − γ_n)X → A_n` is a quotient of `Y_0/(γ − 1)X`, which is finite by 3.11. The kernels are bounded, the same holds on `χ`-parts `(Tor)`, and `τ_n` comes from the quasi-isomorphism.

**Checks.**

- The constants `c_1`, `c_2` depend on `F` only, not on `n`; this is what the induction needs.

See **GREITHER-1992**, §3, Lemmas 3.9–3.10, p. 475. Lemmas 3.9 and 3.10. **GREITHER-1992**, §3, proof of Lemma 3.9, pp. 475–476. Rubin's Lemma 1.2 and the weakened hypotheses. **GREITHER-1992**, §3, Lemma 3.11 and the proof of 3.10, p. 477. The proof of Lemma 3.10. **RUBIN-1988**, Lemma 1.2, p. 703, and its proof, pp. 703–704; the exact sequence on p. 705. `rubinUnitTateBound`.

*Needs:* [§4.1](#greither-chi-parts); [§4.8](#greither-semilocal-units); IntegralIwasawaTheory §0.3; IntegralIwasawaTheory §2.8 (`uniformCapitulationBound`); IntegralIwasawaTheory §3.2 (`inertiaClassControl`); IntegralIwasawaTheory §4.4; Tau Ceti `TateCohomology.herbrandQuotient`; `TauCetiRoadmap.ClassFieldTheory Layer 0`; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

<a id="greither-kolyvagin-step"></a>
### 4.11 The Kolyvagin step and the Maschke lift (Greither, Lemmas 3.12–3.13)
(Lemma 3.12) Let `K/ℚ` be real abelian, `G = Gal(K/ℚ)`, `Δ ⊆ G`, `χ` a character of `Δ`, `M` a power of `p`, `r = ℓ_1⋯ℓ_ν ∈ 𝒮_{M,K}`, `ℓ = ℓ_ν`, `λ` a prime of `K` above `ℓ`, and `c = [λ] ∈ A = A(K)`. Let `B ⊆ A` be generated by the classes of the primes above `ℓ_1`, …, `ℓ_{ν−1}`. Let `x ∈ K^×/K^{×M}` with `(x)_{[q]} = 0` for every prime `q ∤ r`, and `W` its `ℤ_p[G]`-span. Suppose `E`, `g`, `η ∈ ℤ_p[G]` satisfy `(i) E·Ann((c)_χ ∈ (A/B)_χ) ⊆ g·(ℤ_p[G])_χ`; (ii) `(ℤ_p[G])_χ/(g)` is finite; (iii) `M ≥ |A_χ|·|η·((𝒥_ℓ/M𝒥_ℓ)/(W)_{[ℓ]})_χ|`. Then there is a `G`-homomorphism `ψ`: `W_χ → (ℤ/M)[G]_χ` with `(g·ψ(x)λ)_χ = E·η·(x_{[ℓ]})_χ`. (Lemma 3.13) For a `ℤ_p[Δ]`-module `N` and `π`: `N → N_χ` the projection, there is a `ℤ_p[Δ]`-map `ε_χ`: `N_χ → N` with `π∘ε_χ = |Δ|·`id.

Prove this as follows.

1. Lemma 3.12. Choose a lift `β` of `x` and write `(β)_{[ℓ]} = v_λ(β)λ`, where `ℓ` splits totally in `K`. Since `M·A_χ = 0` by (iii), the image of `(β)_{[ℓ]}` in `(A/B)_χ` is that of the principal ideal `(β)`, hence trivial. So `v_λ(β)` kills `(c)_χ`, and by `(i) E·v_λ(β)_χ = g·δ` in `R = (ℤ_p[G])_χ`.
2. Division by `g` is unique in `R`, which has no `ℤ_p`-torsion and `R/(g)` finite by (ii). Define `ψ(ρx) = ηρδ mod` MR. Then `g·ψ(x)λ = η·E·v_λ(β) = E·η·(x)_{[ℓ]}`.
3. Well-definedness: if `ρx = 0`, then `ρβ = y^M`. By (iii) and `h = |A_χ|`, `ηρ` kills `M·h^{−1}(𝒥_ℓ/M𝒥_ℓ)_χ ≅ R/`hR, so `h | ηρ` in `R/`MR. Writing `(y)` over the primes `q`, multiplying by `η` and passing to `(A/B)_χ` shows that `η·v_λ(y)` kills `c_χ`. By `(i)`, `E·η·v_λ(y)_χ ∈` gR, hence `E·η·v_λ(ρx) ∈` MgR, and `ηρδ ∈` MR.
4. Lemma 3.13 (Maschke): reduce to `N = ℤ_p[Δ]`, `N_χ = ℤ_p(χ)`; with `f` a `ℤ_p`-linear section of `π`, `ε_χ(y) = Σ_{δ∈Δ} δf(δ^{−1}y)`.

**Checks.**

- The factor `|Δ|` from 3.13 and the factors `p²` from Corollary 3.8 are what the induction accumulates.

See **GREITHER-1992**, §3, before Lemma 3.12, p. 477. After Rubin's Lemma 7.1. **GREITHER-1992**, §3, Lemma 3.13, p. 479. The factor `|Δ|` from Maschke.

*Needs:* [§4.1](#greither-chi-parts); [§4.9](#greither-chebotarev-at-two); §F.4.

<a id="greither-real-main-conjecture"></a>
### 4.12 The real main conjecture for all `p` (Greither, Theorem 3.1)
Let `p` any prime (`p = 2` included), `F/ℚ` abelian and unramified at `p`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `Δ′ = Gal(K_0/ℚ)`, `Γ = Gal(K_∞/K_0) ≅ ℤ_p`, and `Λ_χ = ℤ_p(χ)[[T]]`. For every even character `ρ ≠ 1` of `K_0`, the characteristic ideal of the `Λ_ρ`-module `X_ρ (X = lim A_p(K_n))` divides the characteristic ideal of `(E_∞/C_∞)_ρ`, where `E_∞` is the limit of the pro-`p` parts of the closures of the global units. For `ρ = 1` both are (1). Equality holds, as a by-product of the proof of Theorem 3.2. `X` and `E_∞/C_∞` may be replaced by their plus parts.

The proof is Kolyvagin–Rubin's Euler system of circular units (Rubin, Invent. Math. 103 (1991)). Every circular number starts an Euler system (Greither §3, via Lemma 2.3).

For `p = 2`, Rubin's Chebotarev step is replaced by Greither's Theorem 3.7 (§4.9), which loses a factor `2^{c+2}`, or 4 at the layers `K_n^+`.

Factors of `p` and `(γ − 1)` accumulate through Lemmas 3.9–3.13; they are removed at the end using `μ = 0` (Ferrero–Washington) and Leopoldt for real abelian fields.

Prove this as follows.

1. Reduce to plus parts and to even `χ ≠ 1`: for `χ = 1`, `X_χ` is quasi-isomorphic to `lim A(ℚ_ν) = 0`.
2. Fix `n`, `K = K_n^+`, `h` a power of `p` with `h ≥ |Λ_{n,χ}/(H_χ)|`, `|Λ_{n,χ}/(ord Δ)|`, `|Λ_{n,χ}/(p)|`, and `M = |A_χ|·h^{3k+ck+1}` with `c = max(c_1, c_2)`. By Lemma 3.10 choose `c_i ∈ A_χ` with `τ_n(c_i) = p^{c_2}` in the `i`-th place; then `p^{c_2}·Ann`(`c_i` in `A_χ/`(`c_1`, …, `c_{i−1}`)) `⊆ g_iΛ_{n,χ}`. By Lemma 3.9 choose a circular unit `ξ` with `ϑ_n(ξ) = (γ − 1)²p^{c_1}H_χ`, and an Euler system starting with `ξ`.
3. Construct primes `λ_1`, …, `λ_{k+1}` of `K` inductively (Corollary 3.8, Lemmas 3.12–3.13) with `[λ_i]_χ = p²c_i`, `ℓ_i ∈ 𝒮_{M,K}`, `v_{λ_1}(κ_{ℓ_1}) =` unit`·|Δ|·(γ − 1)²p^{2+c_1}H_χ`, and for `2 ≤ i ≤ k + 1`: `g_{i−1}·v_{λ_i}(κ_{r_i}) =` unit`·|Δ|·p^{2+c_2}(γ − 1)^{2^{i−1}}·v_{λ_{i−1}}(κ_{r_{i−1}})`. At step `i`, apply Lemma 3.12 with `η = (γ − 1)^{2^{i−1}}` and `E = p^{c_2}`; its hypothesis (iii) is the bound on `N = (γ − 1)^{2^{i−1}}(𝒥_{ℓ_{i−1}}/(M, (κ_{r_{i−1}})_{[ℓ_{i−1}]}))`, where Greither prints the exponent as `2^t`.
4. Multiplying out gives `g_1⋯g_k·v_{λ_{k+1}}(κ_{r_{k+1}}) = |Δ|^{k+1}p^{k(2+c_2)+(2+c_1)}(γ − 1)^{2^{k+1}}·H_χ = η·H_χ` in `Λ_{n,χ}/(M)`. So `g` divides `ηH_χ` in `Λ_{n,χ}/(p^n)` for every `n`, and hence in `Λ_χ` (as in Rubin).
5. By Lemma 3.11 and `μ = 0` (Ferrero–Washington), `η` acts on `X_χ` with finite kernel and cokernel, so `η` and `g` are coprime in `ℚ_pΛ_χ`: `p^N = aη +` bg. Hence `g | p^N·H_χ`, and since `μ = 0`, `p ∤ g`, so `g | H_χ`.

**Checks.**

- For odd `p` and `p ∤ [F : ℚ]` this is Rubin's III.2.7 (§2.4).
- `p = 2` is new in this source.

See **GREITHER-1992**, §3, Theorem 3.1, p. 468. The statement. **GREITHER-1992**, §3, Remark `b`) after Theorem 3.1, p. 468. The trivial character. **GREITHER-1992**, §3, before Theorem 3.7, p. 471. The `p = 2` modification. **GREITHER-1992**, §3, proof of Theorem 3.7, p. 472. Odd `p` is Rubin's. **GREITHER-1992**, §3, the proof strategy, p. 470. The accumulated factors and their removal. **GREITHER-1992**, §3, the induction, p. 480. The induction. **GREITHER-1992**, §3, the end of the proof, p. 481. `g | ηH_χ`. **GREITHER-1992**, §3, the end of the proof, p. 482. Removing `p` and `γ − 1`.

*Needs:* [§4.1](#greither-chi-parts); [§2.4](#cyclotomic-iwasawa-divisibility); §F.8; IntegralIwasawaTheory §1.8; IntegralIwasawaTheory §5.6; [§4.9](#greither-chebotarev-at-two); [§4.10](#greither-finite-level-links); [§4.11](#greither-kolyvagin-step); IntegralIwasawaTheory §4.4; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

<a id="greither-kummer-duality"></a>
### 4.13 Kummer duality between the odd and even sides (Greither, Lemma 3.3 and Proposition 3.4)
Let `p` any prime (`p = 2` included), `F/ℚ` abelian and unramified at `p`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `Δ′ = Gal(K_0/ℚ)`, `Γ = Gal(K_∞/K_0) ≅ ℤ_p`, and `Λ_χ = ℤ_p(χ)[[T]]`. `X = lim A_p(K_n)` is quasi-isomorphic over `Λ` to `Hom_{ℤ_p}(A_∞, ℚ_p/ℤ_p)`, where `A_∞ = lim→ A_p(K_n)` and `Λ` acts through `σ ↦ σ`, not its inverse (Lemma 3.3, after Iwasawa and Solomon). For each even `ρ`, with `χ = ωρ^{−1}`: `V_ρ(Y^+) ≅ V_χ(X)*(1)`, where `Y` is the Galois group of the maximal abelian `p`-ramified `p`-extension of `K_∞` and `V = Q_p ⊗ (·)` (Proposition 3.4).

Greenberg analyses the Kummer pairing at `p = 2` without `⊗Q_p`; Greither tensors with `Q_p` for simplicity, so the duality holds up to finite and `p`-power errors.

Prove this as follows.

1. Lemma 3.3 from Iwasawa's quasi-isomorphism over `Λ`, as in Solomon.
2. Proposition 3.4 from the Kummer pairing between `Y^+` and `A_∞`, as in Greenberg.

**Checks.**

- The twist (1) and the inversion * are what exchange even `ρ` with odd `χ = ωρ^{−1}`.

See **GREITHER-1992**, §3, Lemma 3.3, p. 469. Lemma 3.3. **GREITHER-1992**, §3, Proposition 3.4, p. 469. Proposition 3.4.

*Needs:* [§4.1](#greither-chi-parts); IntegralIwasawaTheory §2.4 (`classGroupDirectLimit_dual_finite_torsion`, the pseudo-isomorphism of the dual direct class limit with `X^ι`); IntegralIwasawaTheory §2.7 (the discrete Kummer sequence over `K_∞ ⊇ μ_{2p}` and its contragredient dual); IntegralIwasawaTheory §3.1.

<a id="greither-main-conjecture-all-p"></a>
### 4.14 The main conjecture for all `p`, with the one-half normalisation (Greither, Theorem 3.2)
Let `p` any prime (`p = 2` included), `F/ℚ` abelian and unramified at `p`, `K_n = F(ζ_{2p^{n+1}})` (so `K_0 = F(√−1)` when `p = 2`), `K_∞ = ∪K_n`, `Δ′ = Gal(K_0/ℚ)`, `Γ = Gal(K_∞/K_0) ≅ ℤ_p`, and `Λ_χ = ℤ_p(χ)[[T]]`, and `X = lim A_p(K_n)`, `X^+ = lim A_p(K_n^+)`. For every odd character `χ ≠ ω` of `K_0` (with `χ̌ = ωχ^{−1}`), `(X/im X^+)_χ ≅ X_χ` canonically, and `char(X_χ) = ((1/2)·G_p(T, χ̌))` as ideals of `Λ_χ = ℤ_p(χ)[[T]]`. For the exceptional character `χ=ω`, `X_ω` is finite and its characteristic ideal is (1); the pole-cleared analytic expression is `((1/2)·G_p(T,1)·(T−q₀))=(1)`. For odd `p`, `1/2` is a unit, and this is the Mazur–Wiles theorem in odd-character form; for `p = 2` the factor `1/2` is essential.

`(1/2)G_p(T, ψ) ∈ ℤ_p(ψ)[[T]]` for nontrivial `ψ`, and `(1/2)G_p(T, ψ)(T − q₀)` is a unit for trivial `ψ` (Washington pp. 122–125, as used by Greither, p. 469). This is the normalisation Federer gives; the integral numerator for trivial `ψ` is IntegralIwasawaTheory §6.3 and §F.10.

Prove first `exceptionalOmega_finite`: `X_ω` is finite for every `F` and `p`, and `X_ω = 0` when `F = ℚ`. (Greither, proof of 3.`1 ⇒ 3`.2, p. 470.)

1. `F = ℚ`, `p` odd. `K_n = ℚ(μ_{p^{n+1}})` over `K_0 = ℚ(μ_p)` has one prime above `p`, totally ramified, and the `ω`-projection is exact because `p∤p−1`. IntegralIwasawaTheory §3.1 (`onePrimeClassControl`) identifies `X_ω/TX_ω` with the `ω`-eigenspace of the `p`-class group of `ℚ(μ_p)`, which is zero by §F.9 (`cyclotomicClassEigenspace_one_eq_zero`). Topological Nakayama (PadicMeasuresIwasawaAlgebras §5.2) gives `X_ω = 0`. This is the fact Greither takes from Mazur–Wiles, p. 183.
2. `F = ℚ`, `p = 2`. `K_n = ℚ(μ_{2^{n+2}})` over `K_0 = ℚ(i)` has one prime above 2, totally ramified, and `ℚ(i)` has class number one, so `X = 0` (IntegralIwasawaTheory §3.1, `onePrimeBaseClassZero`).
3. General `F`. `F` is unramified at `p`, so `Δ′ = Δ × Φ` with `Φ = Gal(ℚ(ζ_{2p})/ℚ)`, and `ω` factors through `Φ`. Hence `X_ω = ((X)_Δ)_ω`. The norm to the tower over `ℚ(ζ_{2p})` and the extension of ideals compose to `|Δ|` and to the trace, so by §4.2 (Greither Lemma 2.2, with `H = Δ`) the map `(X)_Δ → X(ℚ)` has kernel and cokernel killed by `|Δ|`. Taking `ω`-parts, as in the Corollary of §4.2, `X_ω` is killed by `|Δ|²`, because `X(ℚ)_ω = 0` by steps 1–2. `X_ω` is a finitely generated torsion `Λ_ω`-module, a quotient of `X`, whose `μ`-invariant vanishes by Ferrero–Washington (IntegralIwasawaTheory §5.6). A finitely generated torsion module with `μ = 0` that is killed by a power of `p` is finite.
4. A finite module has characteristic ideal (1), which matches the unit `(1/2)G_p(T,1)(T − q₀)`.

**Checks for `exceptionalOmega_finite`.**

- For `p = 3` and `F = ℚ`, `ℚ(μ_3)` has class number one, so `X_ω = 0` already at the base, consistent with step 1.
- The `ω`-component vanishes even at an irregular prime. For `p = 37` the nonzero odd component of the class group of `ℚ(μ_37)` is the one predicted by `B_32`, which is not `ω`; step 1 is not a regularity assumption.
- Being killed by `|Δ|²` alone does not give finiteness: `Λ/(p)` is killed by `p` and is infinite. The vanishing of `μ` is used.

The main statement is then proved as follows.

1. Two exact sequences: `0 → U_∞/E_∞ → Y → X → 0` and `0 → E_∞/C_∞ → U_∞/C_∞ → U_∞/E_∞ → 0`. The first is IntegralIwasawaTheory §2.7 (`infiniteGlobalLocalSequence`); its sign term at `p = 2` is killed by 2 and disappears after `⊗ℚ_p`, where Greither's comparisons of characteristic ideals take place.
2. By Theorem 3.1, `h_ρ·char(X_ρ) = char((E_∞/C_∞)_ρ)`. With Corollary 2.14, `h_ρ·char(Y_ρ) = char(U_∞/C_∞)_ρ = char(Λ/(½G_p(T, ρ))*(1))`.
3. Proposition 3.4 converts `char(Y_ρ^+)` into `char(X_χ*(1))`, so `char(X_χ)` divides `(½G_p(T, χ̌))` for every odd `χ ≠ ω`.
4. `X_ω` is finite (`exceptionalOmega_finite`).
5. The relative class number formula `h(K_n)/h(K_n^+) = Q_{K_n}w_{K_n}∏_{χ odd}(−B_{1,χ}/2)` at every layer (§F.9, `relativeClassNumber_character_product`), with the growth formula (IntegralIwasawaTheory §3.3) and the exceptional component of step 4, shows that the sums over odd `χ` of the `μ`- and `λ`-invariants of `X_χ` and of `(½G_p(T, χ̌))` agree (Greenberg's argument, as cited by Greither, p. 470). Each divisibility of step 3 then has a unit quotient, by Weierstrass preparation as in §3.4, steps 2–3.

**Checks.**

- `χ = ω` is excluded: that component is finite, and there `char` is (1).
- For `p = 2` the characteristic ideal is that of `½G₂`, not of `G₂`.

See **GREITHER-1992**, §1, the Main Conjecture (`=` Theorem 3.2), p. 452. The statement including `p = 2`. **GREITHER-1992**, §3, proof of 3.`1 ⇒ 3`.2, p. 470. The last step.

*Needs:* [§4.12](#greither-real-main-conjecture); [§4.8](#greither-semilocal-units); [§4.13](#greither-kummer-duality); [§4.2](#greither-semilocal-norm-descent); [§3.4](#componentwise-iwasawa-equality); IntegralIwasawaTheory §§2.7, 3.1, 3.3, 5.6, 6.3; §F.9; §F.10; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal); PadicMeasuresIwasawaAlgebras §5.2 (topological Nakayama).

<a id="greither-split-prime-divisor-classes"></a>
### 4.15 Classes of the primes above `p`, and injectivity of `E⁺ → E` (Greither, Lemma 4.2 and Corollary 4.3)
Let `p` be a prime and `F` an imaginary abelian field such that `p` splits completely in `F`, every prime of `F` above `p` is totally ramified in the cyclotomic `ℤ_p`-extension `F_∞/F`, and `μ_{p^∞}(F_∞)` is finite; let `Δ = Gal(F/ℚ)`, `j` complex conjugation and `Γ = Gal(F_∞/F)`. Let `B_n` be the subgroup of the divisor group of `F_n` generated by the primes above `p`, `D_n` its image in `A_n = A_p(F_n)`, `D_∞ = lim D_n`, and `D_∞^+` the same for `F_n^+`. Then `D_∞/im D_∞^+ ≅ ℤ_p[Δ]/(1 + j)ℤ_p[Δ]` as `ℤ_p[Δ][[Γ]]`-modules, with `Γ` acting trivially on the right (Lemma 4.2). For `p = 2`, with `X = lim A_n`, `E = X/D_∞ ≅ lim A_n/D_n` (`a` quotient of class groups, not a unit group) and `E^+` the same for `F^+`, the canonical map `E^+ → E` is injective (Corollary 4.3).

Lemma 4.2 uses only the three hypotheses above (Greither's parenthesis before the lemma), so it holds for every `p`; Corollary 4.3 is stated for `p = 2`.

Prove this as follows.

1. Fix a norm-coherent sequence `𝔭_n` of primes above `p` in `F_n`, and let `h` be the `p`-class number of `F`. The projective system `B_n/(hB_0 + B_n^+)` is isomorphic to `(ℤ/hp^nℤ)[Δ]/(1 + j)` via `1 ↦ 𝔭_n`; `hB_0` maps to 0 in `D_n`.
2. It is enough that the kernels of `α_n`: `B_n/(hB_0 + B_n^+) → D_n/im D_n^+` have bounded order, which follows from `|D_n|/|D_n^+| ≥` const`·p^{n|Δ|/2}`.
3. Apply the ambiguous-class formula for a cyclic extension `K/F′` (Chevalley's formula, IntegralIwasawaTheory §3.5; Lang, Cyclotomic Fields II, Chapter 13 §4, formulas (2)–(3), as cited by Greither) to `(F_n, F)` and `(F_n^+, F^+)`. The products of ramification indices are `e(F_n/F) = p^{n|Δ|}` and `e(F_n^+/F^+) = p^{n|Δ|/2}`. The two unit norm indices differ by a bounded factor because `F` has only finitely many `p`-power roots of unity.
4. The kernels have bounded order and the limit `ℤ_p[Δ]/(1 + j)` is `ℤ_p`-torsion-free, so `lim α_n` is an isomorphism.
5. Corollary 4.3: from the rows `0 → D_∞^± → X^± → E^± → 0` it suffices that `D_∞ ∩ im X^+ = im D_∞^+`. On `Q = (D_∞ ∩ im X^+)/im D_∞^+`, `j` acts as `+1` (`Q` lies in the image of `X^+`) and as `−1` (`Q` lies in `D_∞/im D_∞^+ ≅ ℤ_2[Δ]/(1 + j)`). That module has no 2-torsion, so `Q = 0`.

**Checks.**

- `Γ` acts trivially on `D_∞/im D_∞^+`, so for odd `χ` its `χ`-part has characteristic ideal `(T)` over `Λ_χ` (used in the trivial-zero reduction).

See **GREITHER-1992**, §4, proof of Lemma 4.2, p. 484. The start of the proof. **GREITHER-1992**, §4, proof of Corollary 4.3, p. 485. The end of the proof of 4.3.

*Needs:* [§4.1](#greither-chi-parts); IntegralIwasawaTheory §3.5 (Chevalley's ambiguous-class formula; the `p`-split dictionary `X/D_∞`); IntegralIwasawaTheory §2.4.

<a id="greither-trivial-zero-reduction"></a>
### 4.16 The trivial-zero reduction when `χ(2) = 1` (Greither, Lemma 4.4, Proposition 4.5 and (***))
Let `p = 2`, `F` an imaginary abelian field unramified at 2 with `Δ = Gal(F/ℚ) = Δ_2 × Δ_0`, `Δ_2` cyclic and `|Δ_0|` odd, `j` complex conjugation, `F_n` the layers of the cyclotomic `ℤ_2`-extension, `A_n = A_2(F_n)`, and `χ` an odd character of `Δ`, injective on `Δ`, with `χ(2) = 1` (so 2 splits completely in `F`) and `ξ = χ|Δ_0` nontrivial; `χ̌ = ωχ^{−1}` and `Λ_χ = ℤ_2(χ)[[T]]`. Let `E_n = A_n/D_n` and `E_n^+ = A_n^+/D_n^+`. For a module `M` and `x ∈ ℤ_2[[Γ]]` write `M_x = M/xM`, and `M^{(x)}` for the kernel of `x`. Let `γ` generate `Γ` and `T = γ − 1`. Define `Z` and `Z^+` as the kernels in the rows `0 → Z^+ → (E^+)_{1−γ} → E_0^+ → 0` and `0 → Z → E_{1−γ} → E_0 → 0`, with vertical maps `α`, `β` and `ε`. Then: (Lemma 4.4) if `Z/im Z^+` is finite, `|ker β| ≤ |(E/E^+)^{(1−γ)}| < ∞`; (Proposition 4.5) `|½G′_2(0, χ̌)|_2^{d(χ)} ≤ (|E_{0ξ}|/|E^+_{0ξ}|)·|(Z/Z^+)_ξ|`, where `′ = d/dT`; and hence `(***) |A(F)_χ| = |(A_0)_ξ|/|(A_0^+)_ξ| ≥ |½G′_2(0, χ̌)|_2^{d(χ)}·|(Z/im Z^+)_ξ|^{−1}·|(D_0)_ξ|/|(D_0^+)_ξ|`.

Greither writes `|x|_p = p^{v(x)}` with `v(p) = 1`, so `|x|_p^{d(χ)}` is the order of `ℤ_p(χ)/xℤ_p(χ)`; an inequality between such orders is a divisibility of 2-powers.

`|Δ_0|` is odd, so `(·)_ξ` is exact on `ℤ_2[Δ_0]`-modules, and (**) and Lemma 4.4 hold after taking `ξ`-parts.

In these finite-index formulas Greither’s notation `|a|_p` means `p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value; `d(χ)=[ℚ_p(χ):ℚ_p]`. Thus `|a|_p^{d(χ)}=Nχ(a)`.

Prove this as follows.

1. (**) The snake lemma, with `|E_0|·|E_0^+|^{−1} = |coker ε|·|ker ε|^{−1}`, gives `|(E/E^+)_{1−γ}| = |coker β| ≤ |ker β|·|E_0|·|E_0^+|^{−1}·|Z/im Z^+|`; the inequality drops `|ker α|^{−1}`.
2. Lemma 4.4. The norm `F_n → F_n^+` gives `β′` with `β′β = 2`, so `ker β` is killed by 2. It is finite because `E^+`, a quotient of `X^+`, is finitely generated over `ℤ_2`. Since `E_0` is finite, the hypothesis makes `(E/E^+)_{1−γ}` finite, so `T` has finite kernel and cokernel on `E/E^+`. The sequence `Tor^Λ(Λ/(T), E/E^+) → (E^+)_{1−γ} → E_{1−γ} → (E/E^+)_{1−γ} → 0` bounds `ker β` by the `Tor` term, which is `(E/E^+)^{(1−γ)}`.
3. Proposition 4.5. Corollary 4.3 and the snake lemma give `0 → (D_∞/D_∞^+)_ξ → (X/im X^+)_ξ → (E/E^+)_ξ → 0`, and `ξ` may be replaced by `χ` in all three terms. `char((D_∞/D_∞^+)_χ) = (T)` by Lemma 4.2, and `char((X/im X^+)_χ) = (½G_2(T, χ̌))` by Theorem 3.2. So `½G_2(T, χ̌)` is divisible by `T`, the trivial zero forced by `χ(2) = 1` (the interpolation of IntegralIwasawaTheory §6.3 at `s=0` gives `G_2(0,χ̌)=L_2(0,χ̌)=−(1−χ^{−1}(2))B_{1,χ^{−1}}=0`), and `char((E/E^+)_χ) = (½G_2(T, χ̌)·T^{−1})`.
4. The coinvariant lemma (Coates, Lemma 9) gives `|coker β_ξ| = |(E/E^+)_{ξ,1−γ}| = |(E/E^+)^{(1−γ)}_ξ|·|½G′_2(0, χ̌)|_2^{d(χ)}`. Combine this with (**) and the `ξ`-version of Lemma 4.4. If `(Z/Z^+)_ξ` is infinite, the proposition is trivial.
5. `(***) |E_0|/|E_0^+| = |A_0|·|A_0^+|^{−1}·|D_0|^{−1}·|D_0^+|`, also in `ξ`-parts. Since `ξ` is nontrivial, `(A_0^+)_ξ → A_{0ξ}` and `(D_0^+)_ξ → D_{0ξ}` are injective, and `|(A_0)_ξ|/|(A_0^+)_ξ| = |A(F)_χ|`.

**Checks.**

- The inequality bounds `|A(F)_χ|` from below. The trivial-zero formula identifies the right side of (***) with `|½B_{1,χ^{−1}}|_2^{d(χ)}`.

See **GREITHER-1992**, §4, Convention and Remark before Lemma 4.4, p. 486. `ξ`-parts are exact because `|Δ_0|` is odd. **GREITHER-1992**, §4, proof of Proposition 4.5, p. 487. `T` divides `½G_2(T, χ̌)`.

*Needs:* [§4.15](#greither-split-prime-divisor-classes); [§4.14](#greither-main-conjecture-all-p); [§4.1](#greither-chi-parts); PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal); IntegralIwasawaTheory §10.4 (`arithmeticCharacter_eulerQuotient`, the coinvariant lemma of Coates, Lemma 9).

<a id="greither-split-units-quotient"></a>
### 4.17 `Z/Z⁺` as a quotient of 2-adic semilocal units (Greither, Proposition 4.7)
Let `p = 2`, `F` an imaginary abelian field unramified at 2 with `Δ = Gal(F/ℚ) = Δ_2 × Δ_0`, `Δ_2` cyclic and `|Δ_0|` odd, `j` complex conjugation, `F_n` the layers of the cyclotomic `ℤ_2`-extension, `A_n = A_2(F_n)`, and `χ` an odd character of `Δ`, injective on `Δ`, with `χ(2) = 1` (so 2 splits completely in `F`) and `ξ = χ|Δ_0` nontrivial; `χ̌ = ωχ^{−1}` and `Λ_χ = ℤ_2(χ)[[T]]`. With `Z`, `Z^+` as in the trivial-zero reduction, fix a prime `𝔭` of `F` above 2. The primes above 2 are `𝔭_δ = 𝔭^δ (δ ∈ Δ)`, and `(ℚ_2 ⊗ F)^× = (ℚ_2^×)^Δ`. Let `V = {±1} × 2^ℤ ⊂ ℚ_2^×`, `N(F) = (ℚ_2 ⊗ F)^×/closure(O_F[1/2]^×)·V^Δ`, and `N(F^+)` the same with `Δ^+ = Δ/{1, j}`. `N(F)` is a quotient of `(ℤ_2^×)^Δ`. Then `(a)` there is a natural isomorphism `Z_ξ ≅ N(F)_ξ`, and likewise `Z^+_ξ ≅ N(F^+)_ξ`; `(b) (Z/im Z^+)_χ ≅ (N(F)/N(F^+))_χ ≅ N(F)_χ`.

Prove first the two class-field inputs of this argument.

`splitExtension_abelianization`. Let `G` be a profinite group with a closed normal abelian subgroup `E` such that `G/E=Γ≅ℤ_p`, and let `γ∈G` map to a topological generator. Then `G=E⋊⟨γ⟩`, the closed commutator subgroup `G′` is `(γ−1)E`, and `0→E_{1−γ}→G/G′→Γ→0` is exact, where `E_{1−γ}=E/(γ−1)E`. Proof: `Γ` is a free pro-`p` group of rank one, so the closed subgroup generated by any lift `γ` maps isomorphically onto `Γ` and splits the extension. `E` is abelian, so `G′` is the closed subgroup generated by the commutators `[γ^a,x]`, `x∈E`, which equal `(γ^a−1)x`; these lie in, and for `a=1` generate, the closed submodule `(γ−1)E`. (Washington, Lemma 13.14, as invoked by Greither, p. 489; the same splitting argument is IntegralIwasawaTheory §3.1, `onePrimeInertia_section`.)

`twoRamifiedCorrespondence`. Let `F` be a number field and `C_2(F)=J_F/closure(F^×·∏_{q∤2}U_q)`, with `U_q` the local units at a finite `q∤2` and the identity component of `F_q^×` at an archimedean `q`, so that real places may ramify, as in IntegralIwasawaTheory §2.3 at 2. The finite abelian 2-extensions of `F` unramified at every finite prime not above 2 correspond, by global reciprocity, to the open subgroups of 2-power index of `C_2(F)`, and the maximal such pro-2 extension has Galois group the pro-2 completion of `C_2(F)`. For `F` imaginary, as here, the archimedean factors are connected and play no role. Under this correspondence the inertia group at a prime `𝔭|2` is the image of `U_𝔭` and the decomposition group the image of `F_𝔭^×`. (Greither, proof of Proposition 4.7(a), p. 489.) Proof: `TauCetiRoadmap.ClassFieldTheory` Layer 12 gives the correspondence for finite abelian extensions, with local–global compatibility of the Artin map (Layer 11, `globalArtinMap_local`) identifying decomposition and inertia groups; a finite abelian extension is unramified at `q∤2` exactly when its norm subgroup contains `U_q`. Passing to the limit over the finite subextensions is IntegralIwasawaTheory §2.3 (`pRamifiedModule_rayLimit`, which retains the real modulus at 2 for fields with real places).

**Checks for these inputs.**

- For `G=ℤ_p⋊ℤ_p` with `γ` acting on `E=ℤ_p` by multiplication by `1+p`, `E_{1−γ}=ℤ_p/pℤ_p`, so `G/G′≅ℤ/p×ℤ_p`. Taking `G′=0` would give the wrong abelianization.
- For `F=ℚ(√−7)`, 2 splits, so `C_2(F)` has two factors `ℤ_2^×`; the inertia groups at the two primes above 2 are the images of these factors, not of a single diagonal copy.
- Omitting the closure in `C_2(F)` would leave a non-Hausdorff quotient; continuous characters to finite groups see only the closure.

The proposition is then proved as follows.

1. Let `L` be the maximal unramified abelian 2-extension of `F_∞` in which every prime above 2 splits completely, so `Gal(L/F_∞) ≅ E = X/D_∞` by the `p`-split dictionary of IntegralIwasawaTheory §3.5. Let `L_0` be the same over `F`, so `Gal(L_0/F) ≅ E_0`. Put `M = L ∩ F^ab`, `G = Gal(L/F)` and `G/G′ = Gal(M/F)`.
2. Claim: `Gal(M/L_0) ≅ N(F)`. `M` is the maximal abelian 2-ramified 2-extension of `F` that is unramified over `F_∞` and in which every prime above 2 has inertial degree one. By `twoRamifiedCorrespondence` it corresponds to a closed subgroup `H` of `C_2(F) = J_F/F^×·∏_{q∤2}U_q`. Decomposition equals inertia at each `𝔭_δ`, which forces `(2·u_δ^{−1})^{(δ)} ∈ H` with `u_δ ∈ {±1}`, and `M/F_∞` unramified gives `(−1)^{(δ)} ∈ H`. So `H` is the image of `V^Δ`.
3. Hence `Gal(M/F) = C_2(F)/im V^Δ`, and `0 → N(F) → G/G′ → E_0 → 0` is exact.
4. With `0 → E_{1−γ} → G/G′ → Γ → 0` (`splitExtension_abelianization`, applied to `G=Gal(L/F)` and `E=Gal(L/F_∞)`) and `Δ` acting trivially on `Γ`, `Γ_ξ = 0`. So `E_{ξ,1−γ} ≅ (G/G′)_ξ`, and `N(F)_ξ ≅ ker(E_{ξ,1−γ} → E_{0ξ}) = Z_ξ`. This is `(a)`; the argument for `F^+` is the same.
5. `(b)` Naturality of `(a)` for `F` and `F^+` gives `(Z/im Z^+)_ξ ≅ (N(F)/N(F^+))_ξ`. Since `j` acts as `−1` on the right side, `ξ` may be replaced by `χ` on both sides.

**Checks.**

- `Γ` carries the trivial `Δ`-action, so `Γ_ξ = 0` for `ξ ≠ 1`; this is where the nontriviality of `ξ` enters.

See **GREITHER-1992**, §4, before Proposition 4.7, p. 488. `N(F)` is a quotient of `(ℤ_2^×)^Δ`. **GREITHER-1992**, §4, proof of Proposition 4.7(a), p. 489. The second exact sequence.

*Needs:* [§4.16](#greither-trivial-zero-reduction); [§4.1](#greither-chi-parts); IntegralIwasawaTheory §§2.3, 3.1, 3.5; `TauCetiRoadmap.ClassFieldTheory Layers 11–12`.

<a id="greither-gauss-sum-vectors"></a>
### 4.18 The Gauss-sum 2-unit with its valuation and logarithm vectors (Greither, `(G1), (G2)` and Lemma 4.8)
Let `p = 2`, `F` an imaginary abelian field unramified at 2 with `Δ = Gal(F/ℚ) = Δ_2 × Δ_0`, `Δ_2` cyclic and `|Δ_0|` odd, `j` complex conjugation, `F_n` the layers of the cyclotomic `ℤ_2`-extension, `A_n = A_2(F_n)`, and `χ` an odd character of `Δ`, injective on `Δ`, with `χ(2) = 1` (so 2 splits completely in `F`) and `ξ = χ|Δ_0` nontrivial; `χ̌ = ωχ^{−1}` and `Λ_χ = ℤ_2(χ)[[T]]`. Let `W = O_F[1/2]^×/O_{F^+}[1/2]^×`. Let `M` be the free `ℤ_2`-module on the `𝔭_δ` modulo the span of the `𝔭_δ + 𝔭_{δj}`, so `M ≅ ℤ_2[Δ]/(1 + j)`. Define `μ`: `W → M`, `u ↦ Σ_δ v_{𝔭_δ}(u)·𝔭_δ`, and `λ`: `W → 4M`, `u ↦ Σ_δ log_2(u^{δ^{−1}})·𝔭_δ`, where `log_2`: `F^× → F_𝔭 = ℚ_2` and `log_2(ℤ_2^×) = 4ℤ_2`. Let `m` be the conductor of `F` (odd), `𝔓` a prime of `ℚ(μ_m)` above `𝔭`, `f = ord(2 mod m)`, `η` the `m`-th power residue symbol at `𝔓`, `ψ` the nontrivial additive character of `𝔽_2`, and `g = −Σ_a η^{−1}(a)ψ(Tr a)` the Gauss sum. Let `D` be the decomposition field of 2 in `ℚ(μ_m)`, so `F ⊆ D` and `g ∈ D`, and put `g_F = N_{D/F}(g) ∈ F`, a 2-unit. With `Ŵ=ℤ₂⊗_ℤW` and `⟨g_F⟩` its `ℤ₂Δ`-span in `Ŵ` (the maps `μ` and `λ` extend continuously): `(G1) μ_χ(g_F) = B_{1,χ^{−1}}·(𝔭)_χ` (Stickelberger); `(G2) λ_χ(g_F) = 4·G′_2(0, χ̌)·`unit`·(𝔭)_χ`, by Gross–Koblitz, Ferrero–Greenberg and Lemma 4.8 (`Σ_{(b,m)=1} χ^{−1}(b)ζ_2(b, s) = L_2(s, χ̌)` as meromorphic functions on `ℤ_2`), with `L_2(s, χ̌) = G_2(u^s − 1, χ̌)` and `log_2(u)` associated to 4. Both `μ_χ(g_F)` and `λ_χ(g_F)` are nonzero.

The carriers `W` and `M` and maps `μ` and `λ` are defined for every imaginary abelian `F` in which 2 splits completely. The stated `χ`-assumptions apply to the character formulas and the subsequent trivial-zero argument. In the `m=7` tests only the carriers and `(G1)` are being tested; `ξ` is trivial there.

Greither takes `g` itself and asserts `g ∈ F`. In general `g` lies only in `D`, and `D` can be larger than `F`. Its norm `g_F` is what his sums over all `b` with `(b, m) = 1` compute, and it equals `g` when `F = D`.

Greither's `(G1)` and `μ_χ` carry an extra factor `m` and drop `b` from the exponent. `m` is odd, so this does not change any 2-adic order.

Use the primitive odd character `η=χ⁻¹` with `η(2)=1` in §F.11. Its conductor-`log` correction vanishes. The nonvanishing proof below establishes the arithmetic Gauss-ideal projection and its logarithmic comparison here. It imports only the generic algebraic-coefficient Baker–Brumer theorem from IntegralIwasawaTheory §§4.1–4.2; it does not assume the nonvanishing of the exceptional derivative, which §F.11 leaves as an input.

Prove this as follows.

1. `g` is fixed by `σ_2`, since `Tr(a²) = Tr(a)` (Frobenius invariance), so `g ∈ D`, where 2 splits completely. `F ⊆ D` because 2 splits completely in `F`.
2. `(G1)` By Stickelberger's relation at `p = 2` (`TauCetiRoadmap.ClassicalArithmeticCompletion` §1.55 with `m` odd; `(g)^m=(Φ(𝔓))` determines `(g)`), `(g) = ∏_{b ∈ (ℤ/m)^×/⟨2⟩} (σ_b^{−1}𝔓)^{Σ_{t=1}^{f}⟨2^t b/m⟩}`. Taking `N_{D/F}` collects all `b` with `σ_b|_F = δ`: `μ(g_F) = Σ_δ Σ_{b mod m, σ_b ↦ δ} ⟨b/m⟩·𝔭_{δ^{−1}}`, and `μ_χ(g_F) = (Σ_b ⟨b/m⟩χ^{−1}(b))·(𝔭)_χ = B_{1,χ^{−1}}·(𝔭)_χ`, since `χ` has conductor `m`.
3. `(G2) λ_χ(g_F) = (Σ_δ log_2(g_F^δ)·χ^{−1}(δ))·(𝔭)_χ`. The actual norm, not a chosen abstract generator, gives the sum over all conductor residues. Apply the Gross–Koblitz comparison and the Ferrero–Greenberg identity in §F.11, with primitive `η=χ⁻¹` and `η(2)=1`. Their conductor-`log` term is zero, so the weighted `log` sum is the corresponding exceptional derivative, up to the stated unit normalization. This step identifies the value; steps 5–8 independently establish that it is nonzero.
4. Lemma 4.8 identifies the partial-zeta sum with `L′_2(0, χ̌)·(𝔭)_χ`: the interpolation identity holds at the dense sequence `s=1−n` with `n` positive and odd. Then `L′_2(0, χ̌)=log_2(u)G′_2(0, χ̌)`, and `log_2(u)` is associated to 4. The `p`-adic `L`-function is the canonical branch compared in §F.10; the displayed logarithm identity is a theorem about its derivative.
5. Prove `gaussIdealProjection_ne_zero`. Put `U⁻=(ℚ⊗O_F[1/2]^×)^{j=−1}`, writing the multiplicative group additively. The minus valuation map `U⁻→ℚ[S]⁻`, for `S` the primes above 2, is an isomorphism: its kernel consists of minus global units and is torsion before rationalization, and its cokernel is a quotient of the finite ideal class group. The quotient `W` has the same rationalization, through `[u]↦`(`u−`ju)/2. In `E⊗U⁻`, where `E` is the number field generated by the values of `χ`, `(G1)` says that the actual vector `e_χ[g_F]` has nonzero valuation `B_{1,χ⁻¹}(𝔭)_χ`. Here `e_χ` is used only over `E`, and `B_{1,χ⁻¹}≠0` for primitive odd `χ`, because §F.10 expresses `L(1,χ)` as a nonzero multiple of `B_{1,χ⁻¹}` and `L(1,χ)≠0` (`DirichletCharacter.LFunction_apply_one_ne_zero`). Thus this vector is nonzero. No integral character quotient is asserted to be an eigenspace.
6. Prove `minusTwoUnit_log_rational_injective`. Fix `ι`:`F`↪`ℚ₂` and a rational basis of `U⁻`. After clearing denominators, represent its elements by algebraic 2-units `y₁`,…,`yᵣ` with `yᵢ·j(yᵢ)=1`; representatives `u/j(u)` suffice. A rational relation between `log₂ι(yᵢ)`, after clearing denominators again, gives an actual algebraic 2-unit `y` with `log₂ι(y)=0`. The kernel of the normalized logarithm on `ℚ₂×` is `{±1}·2^ℤ`. Injectivity of `ι` implies `y=±2ᵏ` in `F`, and `yj(y)=1` forces `k=0`. Hence `y` is torsion and the original rational combination in `U⁻` is zero. The basis logs are therefore `ℚ`-linearly independent. This uses complete splitting, which makes the chosen completion exactly `ℚ₂`, and the minus condition; it would be false for all 2-units, since `log₂(2)=0`.
7. Prove `gaussLogProjection_ne_zero`. First replace `yᵢ` by `2^(−v₂ι(yᵢ))yᵢ`, an algebraic local unit with the same normalized logarithm. Apply IntegralIwasawaTheory §§4.1–4.2 to these units with the common normalized logarithm, including `p=2`: `ℚ`-independent `p`-adic logarithms of algebraic numbers are independent over the algebraic numbers in the chosen `p`-adic closure. Its owner is IntegralIwasawaTheory §§4.1–4.2 (the same input consumed by Foundation F; IntegralIwasawaTheory imports it from LinearFormsInLogarithms §8.10); it uses no main conjecture or exceptional derivative theorem. Thus the nonzero algebraic-coefficient vector `e_χ[g_F]` of step 5 has nonzero `ι`-`log`. Equivariance expands this scalar as a nonzero multiple of `Σ_δχ⁻¹(δ)log₂ι(g_F^δ)`, with exactly the inverse-index convention of `λ`. Consequently `λ_χ(g_F)≠0`; `(G2)` then implies `G′₂(0,χ̌)≠0`. This proves, in this application, the nonvanishing that §F.11 leaves as an input, rather than assuming it or a general `p`-adic Stark conjecture.
8. The same conclusion has a direct proof that needs neither the minus condition nor complete splitting, from IntegralIwasawaTheory §4.2. For `u∈F^×` and a homomorphism `f`:`F^×→ℂ_2`, extended `ℚ̄`-linearly to `F^×⊗ℚ̄`, the `χ`-sum `Σ_δχ^{−1}(δ)f(u^δ)`, which is the shape of `μ_χ` (with `f=v_𝔭`) and of `λ_χ` (with `f=log_2∘ι_𝔭`) as in step 3, equals `|Δ|·f(e·u)`, where `e=|Δ|^{−1}Σ_δχ^{−1}(δ)δ` is the idempotent of `χ` over `ℚ̄`. Taking `f=v_𝔭` shows `e·g_F≠0`, as in step 5. Now take `f=log_2∘ι_𝔭`, Iwasawa's branch with `log_2(2)=0`, on the `ℚ`-span `V` of the conjugates of `g_F` in `F^×⊗ℚ`. By part `(a)` of that theorem its kernel on `V` is `K=V∩ℚ·[2]`, because an algebraic number with zero logarithm has a power equal to a root of unity times a power of 2; `K` is `Δ`-stable. By part `(b)`, the logarithms of a `ℚ`-basis of a complement of `K` are linearly independent over `ℚ̄`, so the kernel of the `ℚ̄`-linear extension of `f` to `V⊗ℚ̄` is `K⊗ℚ̄`. If `λ_χ(g_F)` were zero, `e·g_F` would lie in `K⊗ℚ̄⊆ℚ̄·[2]`, and applying `e` again would give `e·g_F∈ℚ̄·e[2]=0`, because 2 is `Δ`-invariant and `χ≠1`, a contradiction. Gross's Conjecture 1.15 is not used; this rank-one case needs only Baker–Brumer. Section 4.21 uses this form at odd `p`, with `log_p` and `p` in place of `log_2` and 2.

The API consists of the following statements.

- `twoUnitQuotient` (constructor): `W = O_F[1/2]^×/O_{F^+}[1/2]^×`, a `ℤΔ`-module with `ℚ_2 ⊗ W ≅ ℚ_2Δ/(1 + j)`.
- `primeDivisorModule` (constructor): `M = ℤ_2[Δ]/(1 + j)` on the classes of the `𝔭_δ`; `M_χ ≅ ℤ_2(χ)` by `(𝔭)_χ ↦ 1`.
- `valuationVector` (constructor): `μ(u) = Σ_δ v_{𝔭_δ}(u)·𝔭_δ`, a `ℤΔ`-linear map `W → M`.
- `logVector` (constructor): `λ(u) = Σ_δ log_2(u^{δ^{−1}})·𝔭_δ`, a `ℤΔ`-linear map `W → 4M`.
- `gaussSumNorm` (constructor): `g_F = N_{D/F}(g)` for the Gauss sum `g = −Σ_a η^{−1}(a)ψ(Tr a) ∈ D`.
- `valuationVector_gaussSumNorm` (characterisation): `(G1) μ_χ(g_F) = B_{1,χ^{−1}}·(𝔭)_χ`.
- `logVector_gaussSumNorm` (characterisation): `(G2) λ_χ(g_F) = 4·G′_2(0, χ̌)·`unit`·(𝔭)_χ`.
- `gaussIdealProjection_ne_zero` (nonvanishing): the actual Gauss-norm vector `e_χ[g_F]` in `E⊗U⁻` is nonzero, as detected by its `(G1)` valuation.
- `minusTwoUnit_log_rational_injective` (comparison): the chosen embedding-`log U⁻→ℚ₂` is injective as a `ℚ`-linear map, under complete splitting.
- `gaussLogProjection_ne_zero` (nonvanishing): the algebraic `χ`-projection of that actual vector has nonzero logarithm, by the preceding comparison and the generic Baker–Brumer input, or directly by step 8.

These interfaces are used in §4.19: the lines `λ_χ⟨g_F⟩` and `μ_χ⟨g_F⟩` whose indices give `G′_2(0, χ̌)` and `B_{1,χ^{−1}}`.

**Checks.**

- `logVector.test_kernel` (value): `log_2` kills `V = {±1} × 2^ℤ` and `log_2(ℤ_2^×) = log_2(1 + 4ℤ_2) = 4ℤ_2`, so `λ` lands in `4M`.
- `gaussSum.test_conductor_seven` (value): `m = 7`, `F = D = ℚ(√−7)`, `f = 3`: `|g|² = 8` and `(g) = 𝔭·𝔭̄²`, so `μ(g) = 𝔭 + 2𝔭̄ = −𝔭` in `M`, and `μ_χ(g) = −(𝔭)_χ = B_{1,χ}·(𝔭)_χ` with `B_{1,χ} = −1` for the quadratic character `χ`.
- `gaussSum.test_not_in_F` (non-example): `m = 217 = 7·31`, `χ =` (quadratic character `mod 7`)`·`(cubic character `mod 31`), odd with `χ(2) = 1`, `F` its sextic field: `σ_120` fixes `F` but `σ_120(g) ≠ g` (`v_𝔓(g) = s(151) = 5, v_{σ_120^{−1}𝔓}(g) = s(18120) = 6` in binary digit sums), so `g ∉ F` and the norm `g_F` is needed.
- `twoUnitQuotient_real` (degenerate): The global 2-unit 2 and every real 2-unit have zero class in `W`.
- `twoUnitQuotient_seven` (value): For `F=ℚ(√−7)`, `α=(1+√−7)/2` has norm 2. In `W` one has `[ᾱ]=−[α]`, and `[α]` has infinite order, as seen from its unequal valuations at the two primes above 2.
- `twoUnitQuotient_torsion` (compatibility): For `F=ℚ(√−7)`, both global units `±1` come from `ℚ` and vanish in `W`. Replacing `W` by all `S`-units without dividing by the real `S`-units fails this test.
- `primeDivisorModule_seven` (value): For `F=ℚ(√−7)`, `M` is free of rank one on `𝔭`, with `𝔭̄=−𝔭`.
- `primeDivisorModule_plus` (degenerate): For every `δ`, `𝔭_δ+𝔭_{δj}=0`. The quotient imposes this relation integrally, without dividing by 2.
- `primeDivisorModule_not_zero` (non-example): In the two-prime case the individual class `𝔭` is nonzero. Quotienting by each prime separately would incorrectly give zero.
- `valuationVector_real` (degenerate): `μ(2)=𝔭+𝔭̄=0` for `F=ℚ(√−7)`, so the map factors through the real 2-unit quotient.
- `valuationVector_alpha` (value): Choose `𝔭=(α)` above 2 for `F=ℚ(√−7)`; then `μ(α)=𝔭` and `μ(ᾱ)=−𝔭`.
- `valuationVector_unit` (compatibility): The valuation vector of a global unit is zero. This tests valuation, rather than logarithm, as the definition of `μ`.
- `logVector_sign` (degenerate): `λ(−1)=0` because the Iwasawa logarithm kills `−1`.
- `logVector_uniformizer` (degenerate): `λ(2)=0` because `log₂(2)=0`; assigning `log₂(2)=1` is incompatible with the chosen branch.
- `logVector_alpha` (value): For `F=ℚ(√−7)` and an embedding where `α=(1+√−7)/2` is a 2-adic unit, `α≡3 mod 8`. Then `λ(α)=2log₂(α)𝔭`, with `v₂(log₂(α))=2`. Its coefficient has valuation 3, so `λ` is nonzero and the pair of conjugate primes must both be included.
- `gaussSumNorm_transitivity` (compatibility): For `F⊆F′⊆D`, `N_(F′/F)(g_F′)=g_F`. Taking `g` itself in every field fails this norm compatibility when `g` is not in `F`.
- `gaussSumNorm_seven_conjugates` (value): For `m=7` and `F=D=ℚ(√−7)`, `g_F=g` and `g_F·conj(g_F)=8`. This checks the finite-field cardinality `2^3` and the additive-character normalisation.
- The index computations in the trivial-zero formula use only the `ℤ_2(χ)`-lines spanned by `μ_χ(g_F)` and `λ_χ(g_F)`, so units (including `m`) do not matter.
- A zero artificial logarithm satisfies no version of the injective comparison: for `F=ℚ(√−7)`, the minus unit `α/ᾱ` has unequal prime valuations and infinite order, while its embedding-`log` is nonzero by step 6. Conversely the real 2-unit 2 is a genuine kernel element before taking the minus part.
- Dropping oddness loses the argument that `B₁` is nonzero; dropping complete splitting loses step 6's assertion that the local logarithm kernel is just `{±1}·2^ℤ`, although step 8 does not use it. Neither generalization is part of the target.
- The nonvanishing argument needs a nonzero `χ`-valuation. For `u=2`, both `μ_χ(2)` and `λ_χ(2)` vanish, because 2 is `Δ`-invariant and `log_2(2)=0`; Baker–Brumer gives `λ_χ(u)≠0` only when `e·u≠0`, as for `g_F` by `(G1)`.

See **GREITHER-1992**, §4, definitions before `(G1)`, p. 490. The definitions of `W`, `M`, `μ`, `λ`. **GREITHER-1992**, §4, the Gauss sum, p. 490. Greither's claim `g ∈ F`, corrected here. **GREITHER-1992**, §4, `(G2)`, p. 491. The derivation of `(G2)`. **GROSS-DASGUPTA-2022**, §2, pp.3–5, describes the valuation/logarithm regulator convention and the algebraic-coefficient case. The elementary and Baker–Brumer deductions in steps 5–8 prove the nonvanishing of the actual Gauss projection. The generic theorem is the `p`-adic Baker–Brumer input of IntegralIwasawaTheory §§4.1–4.2. The derivative identity is proved in §F.11.

*Needs:* `TauCetiRoadmap.ClassicalArithmeticCompletion` §§1.47 and 1.55 (Stickelberger's relation); [§4.1](#greither-chi-parts); IntegralIwasawaTheory §6.3 `(L_2(s,χ̌)=G_2(u^s−1,χ̌))`; §F.10; §F.11; `DirichletCharacter.LFunction_apply_one_ne_zero`; IntegralIwasawaTheory §§4.1–4.2 (generic Baker–Brumer input only); IntegralIwasawaTheory §4.2.

<a id="greither-trivial-zero-formula"></a>
### 4.19 The trivial-zero formula (Greither, Lemmas 4.9–4.10 and Theorem 4.6)
Let `p = 2`, `F` an imaginary abelian field unramified at 2 with `Δ = Gal(F/ℚ) = Δ_2 × Δ_0`, `Δ_2` cyclic and `|Δ_0|` odd, `j` complex conjugation, `F_n` the layers of the cyclotomic `ℤ_2`-extension, `A_n = A_2(F_n)`, and `χ` an odd character of `Δ`, injective on `Δ`, with `χ(2) = 1` (so 2 splits completely in `F`) and `ξ = χ|Δ_0` nontrivial; `χ̌ = ωχ^{−1}` and `Λ_χ = ℤ_2(χ)[[T]]`. With `Z`, `Z^+`, `D_0` as in the trivial-zero reduction and `μ`, `λ` as in the Gauss-sum construction: (Lemma 4.9) `|coker(λ_χ: W′_χ → 4ℤ_2(χ))| = |(Z/im Z^+)_χ|`, where `W′_χ` is the 2-adic completion of `W_χ` modulo 2-torsion, of rank one over `ℤ_2(χ)`; (Lemma 4.10) `|coker μ_χ| = |(D_0/im D_0^+)_χ|`; and (Theorem 4.6) `|½G′_2(0, χ̌)|_2^{d(χ)}·|(Z/im Z^+)_ξ|^{−1}·|(D_0)_ξ|/|(D_0^+)_ξ| = |½B_{1,χ^{−1}}|_2^{d(χ)}`.

In these finite-index formulas Greither’s notation `|a|_p` means `p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value; `d(χ)=[ℚ_p(χ):ℚ_p]`. Thus `|a|_p^{d(χ)}=Nχ(a)`.

Prove this as follows.

1. `ℚ_2 ⊗ W ≅ ℚ_2Δ/(1 + j)`, so `ℚ_2 ⊗ W_χ ≅ ℚ_2(χ)`, and `λ_χ`, `μ_χ` induce monomorphisms `W′_χ → M_χ ≅ ℤ_2(χ)`.
2. Lemma 4.9. Compare `W′_χ → 4ℤ_2(χ)` with `V^Δ → ((ℚ_2F)^×/(ℚ_2F^+)^×)_χ → 4ℤ_2(χ)`, where `λ′` is `λ` on `(ℚ_2^×)^Δ`. Since `ker(log_2: ℚ_2^× → 4ℤ_2) = V`, the lower sequence is exact. So `coker λ_χ ≅ (N(F)/N(F^+))_χ`, which is `(Z/im Z^+)_χ` by Proposition 4.7(b).
3. Lemma 4.10. The definition of `μ` gives `coker μ ≅ D_0/im D_0^+` naturally.
4. Theorem 4.6. `|(Z/im Z^+)_χ|^{−1}·|(D_0/im D_0^+)_χ| = |coker λ_χ|^{−1}·|coker μ_χ|`. Computing both indices through the lines spanned by `λ_χ(⟨g_F⟩)` and `μ_χ(⟨g_F⟩)`, the factors `|W′_χ/⟨g_F⟩|` cancel, and `(G1)`, `(G2)` give `|G′_2(0, χ̌)|_2^{−d(χ)}·|B_{1,χ^{−1}}|_2^{d(χ)}`. Multiplying by `|½|_2^{d(χ)}` on both sides and using injectivity of `(D_0^+)_ξ → D_{0ξ}` gives 4.6.

**Checks.**

- The `½` cancels between the two sides of 4.6; the content is `|(Z/im Z^+)_χ|^{−1}·|(D_0/im D_0^+)_χ| = |G′_2(0, χ̌)|_2^{−d(χ)}·|B_{1,χ^{−1}}|_2^{d(χ)}`.

See **GREITHER-1992**, §4, reduction to Theorem 4.6, p. 488. Theorem 4.6 suffices for Theorem 4.1. **GREITHER-1992**, §4, proof of Theorem 4.6, p. 492. The end of the proof.

*Needs:* [§4.17](#greither-split-units-quotient); [§4.18](#greither-gauss-sum-vectors); [§4.15](#greither-split-prime-divisor-classes).

<a id="greither-relative-class-group-bound"></a>
### 4.20 The 2-adic relative class-group lower bound (Greither, Theorem 4.1)
Let `p=2` and `F/ℚ` be imaginary abelian and unramified at 2, with `Δ=Δ₂×Δ₀`, `Δ₂` cyclic and `|Δ₀|` odd. For every odd character `χ`, `|A₂(F)_χ|≥Nχ(½B_{1,χ⁻¹})`, where `Nχ(a)=2^{[ℚ₂(χ):ℚ₂]v₂(a)}`. The bound is an inequality between positive rational powers of 2; its right side can be fractional for a character of 2-power order. One has `A₂(F)_χ≃(A₂(F)/im A₂(F⁺))_χ`. Identification with the `χ`-part of the minus subgroup is used only when `χ₀=χ|Δ₀≠1`, as in the Iwasawa–Leopoldt target.

The all-prime statement of Greither Theorem 4.1 requires `χ` faithful on `Δ_p`. This subsection gives its `p=2` proof, where oddness implies faithfulness on cyclic `Δ₂`. The odd-prime statement and its separate split-lattice comparison are in §4.21.

In these finite-index formulas Greither’s notation `|a|_p` means `p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value; `d(χ)=[ℚ_p(χ):ℚ_p]`. Thus `|a|_p^{d(χ)}=Nχ(a)`.

Handle `χ₀=1` first by the pure 2-power analytic class-number formula of §1, with the degree exponent `d(χ₂)`. The split-prime arguments below use `χ₀≠1`, as required by their nontrivial `ξ` hypotheses.

Prove this as follows.

1. `χ(j) = −1` makes `χ` injective on `Δ_2`, so `ker χ ⊂ Δ_0`. Replace `F` by the fixed field of `ker χ`, so that `χ` is injective on `Δ`.
2. If `χ₀=1`, the faithful reduction has a cyclic 2-power Galois group. The analytic class-number formula, as Greither applies it in §1, p. 453 (the relative class number product of §F.9 for `F` and for its real subfield), gives `|A(F)_χ|=2·Nχ(½B_{1,χ⁻¹})·k_F` with the capitulation-kernel order `k_F≥1`. This already gives the lower bound without using the later proof that `k_F=1`. For the remaining steps assume `χ₀≠1`, so the split-prime `ξ` arguments apply.
3. Case `χ(2) ≠ 1`. Let `D` be the decomposition group of 2 in `Δ`, `Δ̄ = Δ/D`, `γ` a topological generator of `Γ` and `γ_n = γ^{p^n}`. As in Washington p. 278, cited by Greither, there is an exact sequence `0 → ((1 − γ_n)/(1 − γ))·Y_0/(1 − γ_n)X → X/(1 − γ_n)X → A(K_n) → 0`, whose first term is a quotient of `Z = Y_0/(1 − γ)X`; this is IntegralIwasawaTheory §3.2 (`inertiaClassControl`, `inertiaKernel_transition`) with `Y_0` the module generated by the inertia commutators and `(γ−1)X`.
4. With `L` and `G = Gal(L/F)` as on Washington p. 277, `𝔓` a prime of `L` above a divisor `𝔭` of `p` and `σ` a generator of its inertia group, `Z` is the `ℤ_p`-span of the `z_τ = [σ^τσ^{−1}] (τ ∈ Gal(L/ℚ))`. `z_τ = 0` for `τ ∈ G`, so `Z` is a quotient of the augmentation ideal of `ℤ_pΔ`; it is cyclic because `Δ_p` is cyclic, and `D` acts trivially, so `Z` is a quotient of `ℤ_pΔ̄`. Taking `χ`-parts gives `(ℤ_pΔ̄)_χ → X_χ/(1 − γ_n)X_χ → A(K_n)_χ → 0`. The Frobenius at 2 acts on the left term trivially and by `χ(2)`, so that term is cyclic over `ℤ_2(χ)`, killed by `1 − χ(2)`, of order at most `|1 − χ(2)|_2^{d(χ)}`.
5. `char(X_χ) = (½G_2(T, χ̌))` by Theorem 3.2, and `½G_2(T, χ̌)|_{T=0} = ½L_2(0, χ̌) = −½(1 − χ^{−1}(2))B_{1,χ^{−1}} ≠ 0`. The coinvariant lemma (Coates, Lemma 9) gives `|X_χ/(1 − γ)X_χ| ≥ |½G_2(0, χ̌)|_2^{d(χ)}`, and `|1 − χ(2)|_2 = |1 − χ^{−1}(2)|_2`. So `|A(F)_χ| ≥ |½B_{1,χ^{−1}}|_2^{d(χ)}`.
6. Case `χ(2) = 1`. Then 2 splits completely in `F`. (***) of the trivial-zero reduction and Theorem 4.6 give `|A(F)_χ| ≥ |½G′_2(0, χ̌)|_2^{d(χ)}·|(Z/im Z^+)_ξ|^{−1}·|(D_0)_ξ|/|(D_0^+)_ξ| = |½B_{1,χ^{−1}}|_2^{d(χ)}`.

**Checks.**

- When `χ` is not of 2-power order, equality holds; this is Theorem `A`.
- For `χ` of 2-power order, `|A(F)_χ|=2·Nχ(½B_{1,χ⁻¹})`. For `F=ℚ(ζ₅)`, `χ` of order 4, the bound is `½` and the class-group order is 1. Do not interpret a fractional lower bound as divisibility of integer orders.

See **GREITHER-1992**, §4, before the proof of Theorem 4.1, p. 482. The proof is written for `p = 2`. **GREITHER-1992**, §4, proof of Theorem 4.1, p. 483. The two cases `χ(2) ≠ 1` and `χ(2) = 1`. **GREITHER-1992**, §4, the case `χ(2) ≠ 1`, p. 484. The coinvariant lemma.

*Needs:* [§4.16](#greither-trivial-zero-reduction); [§4.19](#greither-trivial-zero-formula); [§4.14](#greither-main-conjecture-all-p); [§4.1](#greither-chi-parts); IntegralIwasawaTheory §3.2; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal); IntegralIwasawaTheory §10.4 (`arithmeticCharacter_eulerQuotient`); IntegralIwasawaTheory §6.3; §F.9.

<a id="relative-class-group-bound-odd"></a>
### 4.21 The relative class-group bound for odd primes
Let `p` be odd and `F/ℚ` imaginary abelian, unramified at `p`, with cyclic `p`-Sylow subgroup `Δ_p` of `Δ=Gal(F/ℚ)`, and write `Δ=Δ_p×Δ_0` with `|Δ_0|` prime to `p`. For every odd `p`-adic character `χ` of `Δ` that is faithful on `Δ_p`, the finite `χ`-part of the `p`-class group satisfies `|A_p(F)_χ| ≥ Nχ(B_{1,χ⁻¹}) = Nχ((1/2)B_{1,χ⁻¹})`, where `Nχ(a)=p^{[ℚ_p(χ):ℚ_p]v_p(a)}` and `½` is a unit. The Bernoulli number is evaluated for the primitive Dirichlet character attached to `χ`. This is Greither Theorem 4.1 at odd `p`, complementing the separate `p=2` target. Solomon proves the corresponding equality for the field cut out by `χ` (Solomon, Theorem II.1), and steps 1 and 8 below obtain it as well.

Faithfulness on the cyclic `p`-Sylow subgroup is an explicit hypothesis of Greither Theorem 4.1. No assertion for nonfaithful `p`-Sylow characters is made by this target.

The `χ`-part is the coinvariant character quotient, which is not exact when `p` divides `|Δ|`. The target cannot be reduced to a semisimple eigenspace argument in that case.

The following local targets supply the odd-`p` comparison. They retain the
finite errors and the integral character quotient. They use the main
conjecture already proved in §4.14, not a later finite class-number result.

Prove this as follows.

1. Faithfulness on `Δ_p` puts `ker χ` in `Δ₀`. Norm and extension through
   this prime-to-`p` kernel identify the `χ`-quotient with that for
   `K=F^{ker χ}`. Thus `χ` is faithful on `G=Gal(K/ℚ)`, which is cyclic;
   put `O=ℤ_p[χ]`.
   For `χ(p)≠1` the faithful control sequence is
   `0→A_K`,`χ→(A^d_∞)^Γ_χ→ker(1−χ(p):Frac(O)/O→Frac(O)/O)→0`.
   The last term has `O`-length `v_O(1−χ(p))`; specialization of §4.14
   has length `v_O((1−χ⁻¹(p))B₁,χ⁻¹)`. Since `χ(p)` is a unit,
   the two Euler factors have the same valuation, leaving
   `v_O(B₁,χ⁻¹)`. This is Solomon Propositions III.1–III.2,
   equation (19), pp.481–484. The discrete limit `A^d_∞` is along
   extension of ideals, with the dual convention in step 4.
2. Suppose `χ(p)=1`, so `p` splits completely in `K`. Write `G=G′×G_p`,
   `χ=χ′χ_p`, `|G_p|=pˢ`, `O′=ℤ_p[χ′]`, `O=ℤ_p[χ]`, and `K=K_s⊃⋯⊃K₀`
   for the cyclic `p`-tower. Each `K_i` is CM; `χ′` is odd because `p` is odd.
   `O/O′` is totally ramified, so their residue fields agree. All lengths
   below denoted `ℓ′` are `O′`-lengths; `v_O` is normalized by a uniformizer
   of `O`. In particular `v_O(x)` is not the normalized `v_p(x)`.
   Let `W_i=ℤ_p⊗O_(K_i)[1/p]^×` and `I_i=⊕_(𝔭|p)ℤ_p𝔭`. Define
   `μ_i(w)=Σv_𝔭(w)𝔭` and `λ_i(w)=Σlog_p(ι_𝔭w)𝔭`, with `log_p(p)=0`.
   Then `λ_i(W_i)⊂pI_i`. On `χ′`-parts `μ_i` is injective: its kernel is
   a minus global unit and `K_i` contains no `μ_p`, since `p` is unramified.
   The logarithm is injective there by a characterwise version of
   §4.18: for each odd character `τ`, use the Gauss unit of the field
   cut out by `τ` and extend it to `K_i`. Its `τ`-valuation is a nonzero
   multiple of the primitive `B₁`,`τ⁻¹`. The rational minus-unit argument,
   with kernel `μ_(p−1)·p^ℤ`, and generic Baker–Brumer make its
   `τ`-logarithm nonzero. Each `τ`-line is one-dimensional by the
   valuation isomorphism. Semisimplicity over a splitting `p`-adic
   field therefore makes the full logarithm matrix nonsingular.
   This does not infer `p`-adic linear independence from rational
   independence alone, or use an integral `p`-Sylow projector.
3. Choose a prime above `p` at every level. Let `γ_i` be the norm to `K_i`
   from the `p`-decomposition field in `ℚ(μ_(f_i))` of the `f_i`-th power
   of its finite-field Gauss sum; `f_i=cond(K_i)` is prime to `p`.
   Stickelberger gives `μ_i(γ_i)=Σ_(a mod f_i)^× a·σ_a⁻¹`. This is
   the conductor-multiplied, integral Gauss unit; the harmless `f_i` is
   kept throughout the calculation. Define `V₀=ℤ_pG₀γ₀` and
   `V_i=W_(i−1)+ℤ_pG_iγ_i` for `i>0`, in additive notation.
   Using `W_(i−1)`, rather than `V_(i−1)`, is essential in the next step.
   These are concrete lattices inside the actual `p`-unit modules.
4. Prove `oddSplit_lattice_exact_sequences`. Let `A_i` be the finite
   `p`-class group of `K_i` and `D_i` its subgroup generated by `p`-primes.
   Here use the **discrete** direct limits `A^d_(∞,i)=colim_n A(K_(i,n))`
   and `E^d_(∞,i)=colim_n(A(K_(i,n))/D_(i,n))`, along extension of ideals.
   They are different from the compact norm-limit `X` in §4.14; pass
   between them by Pontryagin duality and `Γ`-inversion. Let
   `𝒟_i=coker((A^d_(∞,i))^Γ→(E^d_(∞,i))^Γ)`. The divisor sequence,
   ambiguous classes and Hilbert 90 give the following exact sequences
   after the exact prime-to-`p` projection `χ′`:

   `0→D_i^χ′→A_i^χ′→(E^d_(∞,i))^{Γ,χ′}→𝒟_i^χ′→0`;

   `0→(μ_iW_i/μ_iV_i)^χ′→(I_i/μ_iV_i)^χ′→A_i^χ′`
     `→(E^d_(∞,i))^{Γ,χ′}→𝒟_i^χ′→0`;

   `0→(λ_iW_i/λ_iV_i)^χ′→(pI_i/λ_iV_i)^χ′`
     `→(pI_i/λ_iW_i)^χ′→0`.

   Prove `oddSplit_control_defect`:
   `(pI_i/λ_iW_i)^χ′≃𝒟_i^χ′` and both first lattice quotients are
   isomorphic to `(W_i/V_i)^χ′`. These are isomorphisms of finite
   `O′`-modules, not just an assertion of bounded errors. For the first
   isomorphism use the cyclic norm diagram for `p`-units, all divisors,
   and divisors away from `p`. Hilbert 90 and total ramification at `p`
   identify the defect, at sufficiently large cyclotomic level `n`, with
   `(W_i∩N_(K_(i,n)/K_i)K_(i,n)^×)^χ′/pⁿW_i^χ′`. The cyclic Hasse norm
   theorem identifies its numerator with the local norm conditions.
   At each split completion the local norm subgroup is
   `p^ℤ·μ_(p−1)·(1+p^(n+1)ℤ_p)`, so its logarithmic lattice is
   `p^(n+1)I_i^χ′`. The finite index of `λ_iW_i` in `pI_i` on `χ′`-parts makes
   `p^(n+1)I_i^χ′` lie in `λ_iW_i` for large `n`, so the intersection is
   exactly this numerator lattice.
   Dividing by `pⁿλ_iW_i` gives precisely `pI_i/λ_iW_i`. This is the
   finite defect computation of Mazur–Wiles Proposition 3, p.222,
   with its cyclic divisor diagram on pp.223–224, and Solomon
   Lemma III.5`(i)`, p.490; it does not discard a capitulation factor.
5. Write `e_i=ℓ′((E^d_(∞,i))^{Γ,χ′})`,
   `a_i=ℓ′((I_i/μ_iV_i)^χ′)`, `b_i=ℓ′((pI_i/λ_iV_i)^χ′)`.
   All terms in step 4 are finite. The first and last errors cancel
   *through the displayed isomorphisms*, giving
   `ℓ′(A_i^χ′)=a_i−b_i+e_i`. Equivalently one can replace `V_i` by
   `W_i` in both `a_i` and `b_i`: the equal finite quotients `W_i/V_i` cancel.
   Finiteness follows by induction from the prime-to-`p` base, the
   nonzero Bernoulli number and the nonzero Gauss logarithm; it is
   not inferred from the bare derivative identity.
6. Prove `oddSplit_successive_indices`. For `s>0` the inclusions of
   prime-divisor modules give injections

   `α`:`(pI_(s−1)/λ_(s−1)W_(s−1))^χ′→(pI_s/λ_sV_s)^χ′`,

   `β`:`(I_(s−1)/μ_(s−1)W_(s−1))^χ′→(I_s/μ_sV_s)^χ′`.

   Put `R_χ=p⁻¹Σ_(σ∈G)χ⁻¹(σ)log_pι(γ_s^σ)`, which is nonzero.
   Their cokernel lengths are respectively `v_O(R_χ)` and
   `v_O(B₁,χ⁻¹)`. To see the finite factors, identify `pI_s` and `I_s` with
   `ℤ_pG` using `p𝔭` and `𝔭` respectively. If `C⊂G_p` has order `p`, the
   smaller-field image is `N_Cℤ_pG`. The quotient
   `(O′G)^χ′/N_C(O′G)^χ′` is `O`. Multiplication by the projected `log`
   element or the Stickelberger element is injective on this quotient
   and has cokernel `O/`(unit`·R_χ`) or `O/`(unit`·B₁,χ⁻¹`). The factors
   `f_s` and `log_p(u)/p` are `p`-adic units; neither contributes a hidden
   `p`-power. This proves both injections and both length formulas.
7. The reduced characteristic series for the dual of `E^d` removes
   one split-prime zero `T` on each character line. The norm/extension comparison in
   the `p`-tower, §4.14, and the exceptional derivative identity give
   `e_s−e_(s−1)=v_O(R_χ)`. More explicitly, if `a_i(T)` and `e_i(T)` are
   the `O′`-characteristic polynomials for the duals of `A^d` and `E^d`,
   then `a_i(T)=T^(p^i)·e_i(T)`: the split-prime divisor part
   has `O′`-rank `p^i`, not rank one. The successive quotient has polynomial
   `∏_(τ∈Gal(Frac(O)/Frac(O′)))g_χ(T)^τ`, with `g_χ(T)` having a
   simple zero. Consequently `e_s(T)/e_(s−1)(T)` is the product
   of the conjugates of `g_χ(T)/T`. Evaluation at `T=0` gives
   this length difference, by the finite Euler characteristic.
   The dual of `E^d` embeds in the dual of `A^d`, which has no nonzero
   finite submodule. Once its `T`-coinvariants are finite, its `T`-kernel
   is a finite submodule and therefore zero. This is the vanishing
   needed in the Euler characteristic; no absence of finite
   quotients of a compact finitely generated module is asserted.
   The derivative
   formula gives `v_O(g′_χ(0))=v_O(R_χ)`. This is Solomon
   Lemmas III.1 and III.3, pp.486–488. For `s=0` the rank-one
   calculation has `a₀=v_(O′)(B₁,χ′⁻¹)`, `b₀=v_(O′)(R_χ′)`,
   `e₀=v_(O′)(R_χ′)`; Mazur–Wiles §1.10, Proposition 2 and
   Proposition 3, pp.218–224, supply exactly this base calculation.
   The characteristic series is supplied here by §4.14, so no
   converse finite class-number formula is used as an input.
8. Subtract the two step-5 identities, using `W_(s−1)` in both lower
   lattices. Steps 6–7 give
   `ℓ′(A_s^χ′)−ℓ′(A_(s−1)^χ′)=v_O(B₁,χ⁻¹)`.
   Prove `faithfulCharacter_quotient_length`: Solomon Lemma II.2
   identifies the faithful `χ`-eigenspace with `ker N_C` and the
   coinvariant `χ`-quotient with `coker N_C` on `A_s^χ′`. Norm onto
   `A_(s−1)^χ′` is surjective and extension is injective, with composite
   `N_C` (Proposition II.2 and Corollary II.1). Their lengths therefore
   equal the displayed difference. In particular the coinvariant
   quotient has `O`-length `v_O(B₁,χ⁻¹)`, even when `p` divides `ord χ`.
   Since 2 is a unit, its order is `Nχ(½B₁,χ⁻¹)`, proving the required
   lower bound (in fact equality in this split, unramified case).
9. Alternative proof when `χ(p)≠1`, for every odd `p`. Complex conjugation
   `j` has order 2, so `j∈Δ_0`, and `χ(j)=−1` makes `ξ=χ|Δ_0` nontrivial.
   After the reduction of step 1, run steps 3–5 of §4.20 with `p` in place
   of 2; none of them uses `p=2`, and they use only right exactness of the
   `χ`-quotient. The inertia sequence (IntegralIwasawaTheory §3.2, `inertiaClassControl`) gives a
   surjection `X_χ/(1−γ)X_χ→A(F)_χ`. Its kernel is a quotient of
   `(ℤ_pΔ̄)_χ`, which is cyclic because `Δ_p` is cyclic and is killed by
   `1−χ(p)`, since the Frobenius at `p` acts on it trivially and by `χ(p)`.
   So the kernel has order at most `Nχ(1−χ(p))`. By §4.14,
   `char(X_χ)=(½G_p(T,χ̌))` with `½` a unit, and
   `G_p(0,χ̌)=L_p(0,χ̌)=−(1−χ⁻¹(p))B_{1,χ⁻¹}≠0`. The coinvariant lemma
   gives `|X_χ/(1−γ)X_χ| ≥ Nχ(G_p(0,χ̌))`, and `Nχ(1−χ(p))=Nχ(1−χ⁻¹(p))`.
   Hence `|A(F)_χ| ≥ Nχ(B_{1,χ⁻¹})`.
10. Alternative proof when `χ(p)=1` and `Δ_p=1`. Then `ξ=χ`, every character
    quotient is exact, `χ` is faithful after step 1, and `p` splits
    completely in `F`. Greither's dyadic argument §§4.15–4.19 runs at odd `p`
    with the following changes, each checked here.
    - Lemma 4.2 (§4.15) is stated for every `p`. Its hypotheses hold: `p`
      splits completely in `F`, each prime above `p` is totally ramified in
      `F_∞/F` because `F_𝔭=ℚ_p`, and `μ_{p^∞}(F_∞)` is finite because `p` is
      unramified in `F` and has `p`-power ramification index in `F_∞/F`, so
      `F_∞` does not contain `μ_p`.
    - Corollary 4.3 and Lemma 4.4 (§§4.15–4.16). The composite of
      `E⁺→E` with the norm back to `E⁺` is multiplication by 2, a unit at
      odd `p`. So `E⁺→E` is injective and `ker β=0`, without the finiteness
      hypothesis of Lemma 4.4.
    - Proposition 4.5 and (***) (§4.16) hold with `½G_2` replaced by `G_p`,
      because `char(X_χ)=(G_p(T,χ̌))` up to a unit and `G_p(0,χ̌)=0` when
      `χ(p)=1`. They give `|A(F)_χ| ≥ Nχ(G′_p(0,χ̌))·|(Z/im Z⁺)_χ|⁻¹·`
      `|(D_0)_χ|/|(D_0⁺)_χ|`.
    - Proposition 4.7 (§4.17) holds with `V_p=p^ℤ×μ_{p−1}` in place of
      `{±1}×2^ℤ`. By local reciprocity the norm group of the cyclotomic
      `ℤ_p`-extension of `ℚ_p` is `p^ℤ×μ_{p−1}`, with unit part `μ_{p−1}`. `A`
      subextension of the maximal abelian `p`-ramified `p`-extension of `F`
      that is unramified over `F_∞` at `𝔭_δ` corresponds to a subgroup `H`
      containing `μ_{p−1}` in the `δ`-coordinate, and inertial degree one at
      `𝔭_δ` forces `p·u_δ⁻¹` into `H` for a unit `u_δ`, which lies in `μ_{p−1}`
      because `p` maps trivially to `Gal(F_∞/F)`. So `H` is the image of
      `V_p^Δ`, `N(F)=(ℚ_p⊗F)^×/closure(O_F[1/p]^×)·V_p^Δ` is a quotient of
      `(ℤ_p^×)^Δ`, and `(Z/im Z⁺)_χ≅N(F)_χ` because `Γ_χ=0`.
    - The Gauss sum (§4.18). Let `m` be the conductor of `F`, prime to `p`,
      and `g` the Gauss sum of the `m`-th power residue character at `𝔓` with
      an additive character of order `p` of `𝔽_p`. Changing the additive
      character multiplies `g` by an `m`-th root of unity, so `g^m` is
      independent of it and lies in the decomposition field `D` of `p` in
      `ℚ(μ_m)` (Solomon, p. 485). Put `g_F=N_{D/F}(g^m)`, a `p`-unit of `F`.
      Stickelberger's theorem gives `μ_χ(g_F)=±m·B_{1,χ⁻¹}·(𝔭)_χ`, with `m` a
      `p`-adic unit. The Gross–Koblitz and Ferrero–Greenberg formulas
      (§F.11) express
      `Σ_δχ⁻¹(δ)log_pι_𝔭(g_F^δ)` as a `p`-adic unit multiple of
      `L′_p(0,χ̌)` (Solomon, (22), p. 486), and `L_p(s,χ̌)=G_p(u^s−1,χ̌)` with
      `log_p(u)` associated to `p`. So `λ_χ(g_F)=p·G′_p(0,χ̌)·`unit`·(𝔭)_χ`.
    - The logarithm map `λ` lands in pM, because `log_p(ℤ_p^×)=pℤ_p` for odd
      `p` and the kernel of `log_p` on `ℚ_p^×` is `V_p`. So Lemma 4.9 (§4.19)
      reads `|coker(λ_χ:W′_χ→pℤ_p(χ))|=|(Z/im Z⁺)_χ|`, and Lemma 4.10 is
      unchanged.
    - Step 8 of §4.18, with `log_p` and `p` in place of `log_2` and 2, shows
      `λ_χ(g_F)≠0`. Hence `G′_p(0,χ̌)≠0`, and all the modules above are finite.
    - Theorem 4.6 (§4.19). Compute both cokernels through the lines
      spanned by `λ_χ(g_F)` and `μ_χ(g_F)`. The index of the span of `g_F` in
      `W′_χ` cancels, as do the factor `p` and the unit `m`, so
      `Nχ(G′_p(0,χ̌))·|(Z/im Z⁺)_χ|⁻¹·|(D_0)_χ|/|(D_0⁺)_χ|=Nχ(B_{1,χ⁻¹})`.
    When `Δ_p≠1` this route does not transfer. In Proposition 4.5 and
    Theorem 4.6 Greither replaces `χ`-quotients by `Δ₀`-quotients (pp. 486–487),
    which is property `(g)` of §4.1 for minus modules and holds only at
    `p=2`. At odd `p` the `Δ₀`-quotient also carries the characters `ξθ` with `θ`
    not faithful on `Δ_p`, so the `χ`-part is not exact and steps 2–8 are
    needed.

**Checks.**

- For `χ(p)≠1` the comparison specializes the all-prime characteristic ideal through finite-level control, and the error is bounded by `Nχ(1−χ(p))`.
- For `χ(p)=1`, `G_p(0,χ̌)=0`. The lower bound comes from `G′_p(0,χ̌)`, the lattice index of the logarithm line and the divisor classes, not from cancelling a zero constant term.
- The odd-prime local logarithm differs from the dyadic one: its kernel on `ℚ_p^×` is `p^ℤ×μ_{p−1}` rather than `{±1}×2^ℤ`, and it maps `ℤ_p^×` onto `pℤ_p` rather than `4ℤ_2`. Both the target lattice `pℤ_p(χ)` and the factor `p` in `λ_χ(g_F)` change together, so they cancel.
- At odd `p` the Gauss sum itself depends on the additive character. `g^m`, and not `g`, is the element of `D` whose norm enters; at `p=2` the additive character is `±1`-valued and `g` lies in `D`.
- At `χ(p)=1`, retain `𝒟_i` on the valuation sequence and identify it
  with `pI_i/λ_iW_i` on the `log` sequence before cancelling. Retaining
  a nonzero `W_i/V_i` likewise cancels equal lengths; setting either
  finite quotient to zero would give the wrong class length.
- For a concrete nonsemisimple test take `p=3`, a cyclic group of order
  3 acting on `ℤ/9` by multiplication by 4. Its norm acts by
  `1+4+4²=3` modulo 9. The kernel and cokernel each have order 3,
  and its image is the three-element subgroup {0,3,6}.
  This tests the norm kernel/cokernel argument, not Maschke's theorem.
- At `s=0` the two logarithmic lengths `b₀` and `e₀` cancel. At `s>0`
  their differences, rather than their individual values, cancel
  with `v_O(R_χ)`. The two cases cannot use an exact integral
  `p`-Sylow projector.
- A character trivial on a nontrivial `Δ_p` is outside this target,
  even if it is odd on `Δ₀`. The faithful-on-`Δ_p` hypothesis is used
  in the group-ring quotient by `N_C`.

See **GREITHER-1992**, Theorem 4.1, pp.482–484, for the all-prime
statement and the explicitly dyadic proof; the paragraph after the
statement, p.482, says the restriction to `p=2` is for simplicity, and the
proof replaces `χ`-parts by `χ₀`-parts on pp.486–487. Steps 9–10 follow its two
cases. The odd-`p` calculation here
uses **SOLOMON-1990**, Theorem II.1, p.472; Lemma II.2 and Corollary II.1,
pp.470–471; Proposition II.2 and Corollary II.2, pp.476–478;
Lemma III.2, equations (23)–(24), p.487; Lemmas III.3–III.4,
pp.487–489; Lemma III.5 and Corollary III.3, equations (30)–(31),
pp.490–491. **MAZUR-WILES-1984**, §1.10, pp.218–224, especially
Proposition 3, p.222, supplies the base and the finite norm defect.
**SOLOMON-1990**, §III, Case 1, pp.481–484, and Case 2, pp.484–486, with
(21), (22) and Lemma III.1, gives the odd-prime Gauss-sum element, its
Stickelberger factorization and the Ferrero–Greenberg logarithm formula
used in step 10. These are public primary articles, read at those locators.

*Needs:* [§4.14](#greither-main-conjecture-all-p); [§4.1](#greither-chi-parts); [§4.15](#greither-split-prime-divisor-classes); [§4.16](#greither-trivial-zero-reduction); [§4.17](#greither-split-units-quotient); [§4.18](#greither-gauss-sum-vectors) (the minus-unit/Baker–Brumer argument, with odd `p`); [§4.19](#greither-trivial-zero-formula); [§4.20](#greither-relative-class-group-bound); IntegralIwasawaTheory §3.5 (Chevalley's ambiguous-class formula for cyclic extensions); IntegralIwasawaTheory §§2.4, 2.7 (discrete class limits and their duals); IntegralIwasawaTheory §3.2 (inertia control); `TauCetiRoadmap.ClassFieldTheory Layer 13` (cyclic Hasse norm theorem); IntegralIwasawaTheory §§4.1–4.2 (generic Baker–Brumer input); IntegralIwasawaTheory §4.2; IntegralIwasawaTheory §6.3; `TauCetiRoadmap.ClassicalArithmeticCompletion` §§1.47 and 1.55 (Stickelberger's relation); §F.11; IntegralIwasawaTheory §10.4 (`arithmeticCharacter_eulerQuotient`).

<a id="greither-iwasawa-leopoldt-two"></a>
### 4.22 The Iwasawa–Leopoldt conjecture at `p = 2` (Greither, Theorem `A`)
Let `F/ℚ` be an imaginary abelian field unramified at 2 with Galois group `Δ = Δ_2 × Δ_0`, `Δ_2` cyclic and `|Δ_0|` odd. For every odd 2-adic character `χ` of `Δ` that is not of 2-power order (that is, `χ|Δ_0 ≠ ε`), `|A_2(F)^−_χ| = |½B_{1,χ^{−1}}|_2^{d(χ)}`, where `A_2(F)^− = {x ∈ A_2(F): x^j = −x}`, `d(χ)=[ℚ₂(χ):ℚ₂]` and `|a|₂=2^{v₂(a)}`, with `v₂(2)=1`. This valuation can be fractional when `ℤ₂(χ)` is ramified. For the single odd character `χ_2` of 2-power order (up to `ℚ_2`-conjugacy), with `L` the fixed field of `Δ_0`, `|A_2(F)_{χ_2}| = |A_2(L)^−| = 2·|½B_{1,χ_2^{−1}}|_2^{d(χ_2)}·k_L`, where `k_L = |ker(A_2(L^+) → A_2(L))| = 1`. Consequently `(1 − e_ε)A_2(F)^−` is annihilated by `½` times the images in `(1 − e_ε)ℤ_2[Δ]/(1 + j)` of the Stickelberger elements of `F`, which sharpens Stickelberger's theorem at 2.

The characters `χ` are taken up to `ℚ_2`-conjugacy, and each class contributes one factor with exponent `d(χ)`.

In these finite-index formulas Greither’s notation `|a|_p` means `p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value; `d(χ)=[ℚ_p(χ):ℚ_p]`. Thus `|a|_p^{d(χ)}=Nχ(a)`.

Prove this as follows.

1. For each odd `χ` with `χ|Δ_0 ≠ ε`, `|A_2(F)^−_χ| = |(A_2(F)/im A_2(F^+))_χ|`. For a cyclic 2-group `Δ_2` the minus quotient `ℤ_2(χ_0)[Δ_2]/(1 + j)` is the domain `ℤ_2(χ)`; see the `χ`-parts node, property `(g)`.
2. The analytic class number formula for `F` and for `L` (with `Q_L = 1` and `w_L = 2`) and `k_F = k_L` give `|(1 − e_ε)A_2(F)^−| = ∏ |½B_{1,χ^{−1}}|_2^{d(χ)}` over the odd `χ` with `χ|Δ_0 ≠ ε`, modulo `ℚ_2`-conjugacy. The same product of the `|A_2(F)^−_χ|` equals `|(1 − e_ε)A_2(F)^−|`, because `ξ`-parts are exact.
3. Theorem `B` bounds each factor below; the products agree, so every factor is an equality.
4. `k_L = 1`. Every nontrivial subgroup of the cyclic 2-group `Gal(L/ℚ)` contains `j`, and some odd prime `ℓ` ramifies in `L`, so `L/L^+` is ramified above `ℓ`. `L` is unramified at 2, so `i ∉ L`, and `μ(L)/μ(L)²` is generated by `−1`. Let `𝔞` be a class of `L^+` with `𝔞O_L = (α)`. Then `α/`ᾱ is a unit of absolute value 1 everywhere, so a root of unity. If `α/`ᾱ `= ζ² = ζ/ζ̄`, then `α/ζ ∈ L^+` generates `𝔞`, which is trivial. Otherwise `α` can be rescaled so that ᾱ `= −α`. Then `δ = α² ∈ L^+`, `L = L^+(√δ)` and `δO_{L^+} = 𝔞²`, so `v_𝔮(δ)` is even at every `𝔮` above `ℓ`. This contradicts the ramification of `L/L^+` above `ℓ`.
5. For `χ₀≠1` the relevant minus quotient of the group ring is the DVR `Oχ`. If its finite class module has `Oχ`-length `ℓ`, equality of orders gives `ℓ=v_π(½B_{1,χ⁻¹})`. Every finite-length DVR module of length `ℓ` is killed by `π^ℓ`, without any cyclicity assumption. The `χ`-values of half the indicated Stickelberger elements are integral multiples of `½B_{1,χ⁻¹}`, so they annihilate this component. Exact decomposition by the prime-to-2 characters `χ₀` proves the global annihilation statement.

**Checks.**

- Examples show some condition on `Δ_2` is necessary (Greither, Remark `a`)).
- `F = ℚ(ζ_5)`: `χ_2` of order 4, `d(χ_2) = 2`, `B_{1,χ_2^{−1}} = (−3 + i)/5`, so `2·|½B|_2^2 = 2·2^{−1} = 1 = |A_2(ℚ(ζ_5))|`.
- The finite `Oχ`-module `(Oχ/π)⊕(Oχ/π)` has length 2 and is killed by `π²`, but is not cyclic. An order calculation cannot justify a cyclicity claim.

See **GREITHER-1992**, §1, Remark `a`) after Theorem `A`, p. 453. The Stickelberger consequence. **GREITHER-1992**, §1, Remark `b`) after Theorem `A`, p. 453. The 2-power-order character; the printed formula lacks the exponent `d(χ_2)`. **GREITHER-1992**, §1, Theorem `B` implies Theorem `A`, p. 454. The deduction.

*Needs:* [§4.20](#greither-relative-class-group-bound); [§4.1](#greither-chi-parts); §F.9 (`relativeClassNumber_character_product`).

<a id="greither-ray-class-real-fields"></a>
### 4.23 Ray class groups of real abelian fields and `½L_p(1, χ)` (Greither, Theorem 4.11)
Let `F` be a real abelian field and `p` a prime unramified in `F`, with `Δ = Gal(F/ℚ) = Δ_p × Δ_0` and `Δ_p` the `p`-part. Let `A′(F) = lim_ν C_{(p^ν)}(F)`, where `C_{(p^ν)}(F)` is the `p`-part of the ray class group modulo `p^ν`. Let `e = e_ε = |Δ_0|^{−1}Σ_{δ∈Δ_0}δ`. Then `(1 − e)A′(F)` is finite, and for every character `χ_0 ≠ 1` of `Δ_0`, `|A′(F)_{χ_0}| = ∏_{χ|Δ_0 = χ_0} |½L_p(1, χ)|_p^{d(χ)}`, the product over the characters `χ` of `Δ` restricting to `χ_0`, taken up to conjugacy over `ℚ_p(χ_0)`. Equivalently, as in the proof, the product runs over all such `χ` with exponent `d(χ_0)`.

Leopoldt's conjecture for `F` and `p` (true for abelian `F`, IntegralIwasawaTheory §4.4) makes `(1 − e)A′(F)` finite, and IntegralIwasawaTheory §3.5 (`greitherRayDictionary`) gives `(1 − e)A′(F) ≅ (1 − e)Y/TY`. Greither writes `A′(F) ≅ Y/TY`; the full `A′(F)` is an extension of `Γ` by `Y/TY`, and the projection `1 − e` removes `Γ`, on which `Δ₀` acts trivially.

In these finite-index formulas Greither’s notation `|a|_p` means `p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value; `d(χ)=[ℚ_p(χ):ℚ_p]`. Thus `|a|_p^{d(χ)}=Nχ(a)`.

Every character in the characteristic-ideal and `L`-value product restricts to the fixed nontrivial `χ₀`. The trivial character, where the analytic series has a pole, is excluded.

Prove first `padicClassNumberFormula`. Let `F` be a real abelian field of degree `d` with `G=Gal(F/ℚ)`, `p` any prime, `ι`:`F→ℂ_p` an embedding, and `R_p(F)=det(log_pι(σ_iε_j))_{1≤i,j≤d−1}` the `p`-adic regulator, for a basis `ε_1`,…,`ε_{d−1}` of the units modulo `±1` and `d−1` distinct elements `σ_i` of `G`. Then

```text
2^{d−1} h(F) R_p(F) / √d_F = ∏_{χ≠1} (1 − χ(p)p^{−1})^{−1} L_p(1, χ),
```

over the nontrivial characters of `G`, each taken primitive, for a suitable choice of the sign of `R_p(F)` and of the square root of the discriminant `d_F`. (Washington, Theorem 5.24, as used by Greither in the proof of Theorem 4.11, p. 494.)

Prove it as follows.

1. For each `χ≠1` with conductor `f_χ`, field `F_χ⊆F` and `ζ=e^{2πi/f_χ}`, put `η_χ=N_{ℚ(μ_{f_χ})/F_χ}(1−ζ)` and `c_χ=Σ_{δ∈G}χ^{−1}(δ)[δη_χ]` in `F^×⊗ℚ(χ)`. For every homomorphism `g` from the multiplicative group of `ℚ(μ_{f_χ})` to a field containing `ℚ(χ)`, extended `ℚ(χ)`-linearly, `g(c_χ)=[F:F_χ]·Σ_{a∈(ℤ/f_χ)^×}χ^{−1}(a)g(1−ζ^a)`: `χ` factors through `Gal(F_χ/ℚ)`, and the norm groups the conjugates of `1−ζ` by their restriction to `F_χ`. Both `log|·|` and `log_p∘ι` are such homomorphisms.
2. `c_χ` lies in `E_F⊗ℚ(χ)`: when `f_χ` is not a prime power `1−ζ` is a unit, and otherwise the ideal of `η_χ` is Galois-invariant, so its `χ`-sum vanishes (as in §0.23). The `χ`-eigenspace of `E_F⊗ℚ(χ)` is one-dimensional (IntegralIwasawaTheory §4.3), spanned by `e_χ[α]=Σ_δχ^{−1}(δ)[δα]` for a unit `α` whose conjugates span a subgroup of finite index (the unit `α` of that section). So `c_χ=r_χe_χ[α]` with `r_χ∈ℚ(χ)`, an algebraic identity.
3. Applying `log|·|` and `log_p∘ι` to step 2 gives the archimedean and the `p`-adic `χ`-resolvents of the cyclotomic numbers as the same multiple `r_χ` of the corresponding resolvents of `α`. The group-determinant identity (Washington, Lemma 5.26, as used in the proof of Theorem 5.24) expresses `∏_{χ≠1}Σ_δχ^{−1}(δ)g(δα)` as `±R_g(⟨α⟩)` for any homomorphism `g` killing `±1`, the same constant for both `g`, and `R_g(⟨α⟩)=[E_F:±⟨α⟩]R_g(E_F)` for both regulators, since the index is the determinant of an integral change of basis. Hence the ratio of the `p`-adic and archimedean products of resolvents is `R_p(F)/R(F)`.
4. Leopoldt's formula (§F.10) gives `(1−χ(p)p^{−1})^{−1}L_p(1,χ)=−G(χ^{−1})^{−1}Σ_aχ^{−1}(a)log_p(1−ζ^a)`, and the complex formula `L(1,χ)=−G(χ^{−1})^{−1}Σ_aχ^{−1}(a)log|1−ζ^a|` for even `χ` (§F.10; §F.9) has the same Gauss-sum factor. The archimedean formula `2^{d−1}h(F)R(F)/√d_F=∏_{χ≠1}L(1,χ)` is the real class number product of §F.9 (`realClassNumber_log_product`, applied to the abelian CM field `F(√−1)`, whose maximal real subfield is `F`), with `∏_χG(χ^{−1})` a square root of `d_F` by the conductor–discriminant formula (`TauCetiRoadmap.ClassFieldTheory` Layer 13). Dividing by step 3 gives the `p`-adic formula.

Prove also `padicCircularLog_image`, the `p`-adic form of Sinnott's Proposition 4.2 used in §4.26. Let `F` be real abelian and unramified at `p`, `C_F` Sinnott's circular units and `U` his lattice (IntegralIwasawaTheory §§1.7–1.8), `λ(u)=Σ_{δ∈G}log_p(ι(u^{δ^{−1}}))δ` in `ℂ_p[G]`, `e′` an idempotent of `ℚ[G]` orthogonal to the trivial idempotent, and `ω′=Σ_{χ≠1}e_{χ^{−1}}L_p(1,χ)(p^{−1}χ(p)−1)^{−1}f_χτ(χ̄)^{−1}`. Then `λ(e′C_F)=e′ω′U`. The archimedean statement `circularLog_image` (IntegralIwasawaTheory §1.8; Sinnott 1980, Propositions 4.1–4.2, pp. 203–207) computes the `χ`-resolvents of the logarithms of Sinnott's generators against the integral lattice `U`, using only the distribution relations and resolvent identities of the kind in steps 1–2. The same computation with `log_p∘ι` in place of `log|·|`, and Leopoldt's formula in place of the complex values, gives the `p`-adic statement. Every denominator is nonzero: `p∤f_χ`, the Gauss sum is a `p`-adic unit because `|τ(χ̄)|²=f_χ`, and `p^{−1}χ(p)−1` has valuation `−1`.

**Checks for these inputs.**

- `F=ℚ`: `d=1`, the product is empty, `R_p=1` and `d_F=1`, so both sides are 1.
- `F=ℚ(√5)`, `p=3`: 3 is inert, `χ(3)=−1`, and `ε=(1+√5)/2` has `ε^8=21ε+13≡1+3ε² mod 9`, so `v_3(log_3ε)=1`. The formula gives `L_3(1,χ)=(4/3)·2·log_3ε/√5` up to sign, a 3-adic unit. Dropping the Euler factor `(1+1/3)^{−1}` would give the wrong valuation 1.
- In `padicCircularLog_image` the trivial character must be removed by `e′`: `log_p` of a rational prime `ℓ` in the circular numbers is a nonzero multiple of the norm element, and `L_p(s,1)` has a pole at `s=1`.

Prove this as follows.

1. `Y = lim A′(F_n)` is the Galois group of the maximal abelian `p`-ramified `p`-extension of `F_∞`, a `Λ_Δ`-module with `(1 − e)A′(F) ≅ (1 − e)Y/TY` (above). Define `T̂` by `1 + T̂ = u·(1 + T)^{−1}`. By Theorem 3.2 and Proposition 3.4, `char_{Λ_χ}(Y_χ) = ½G_p(T̂, χ)Λ_χ` for `χ` with `χ|Δ₀=χ₀≠1`, so `char_{Λ_{χ_0}}(Y_{χ_0}) = (∏_χ ½G_p(T̂, χ))` over `χ|Δ_0 = χ_0`.
2. Let `H` be the `ℤ_p`-torsion submodule of `Y_{χ₀}`; it is finite by arithmetic `μ=0`. Put `δ(χ₀)=|H/`TH`|=|H[T]|`. Since `Y_{χ₀}/TY_{χ₀}` is finite, its `T`-invariants lie in `H`, so this is also `|Y_{χ₀}[T]|`. Iwasawa theory gives `|A′_{χ_0}| = ∏_χ |½G_p(T̂, χ)|_{T=0}|_p^{d(χ_0)}·δ(χ_0) = ∏_χ |½L_p(1, χ)|_p^{d(χ_0)}·δ(χ_0)`.
3. It suffices that `∏_{χ_0 ≠ 1}|A′_{χ_0}| = ∏_{χ|Δ_0 ≠ 1}|½L_p(1, χ)|_p`; then every `δ(χ_0) = 1`. The left side is the order of the finite kernel `(1−e)A′(F)` of the norm to `A′(L)`, where `L=F^{Δ₀}`. Norm and inclusion split off the `e`-part because `|Δ₀|` is a `p`-adic unit. Equivalently, use the stabilized ratio of the finite ray-class orders at modulus `p^ν`; never divide the orders of the infinite limits.
4. `0 → (1 − e)(U_F/Ē_F) → (1 − e)A′(F) → (1 − e)A(F) → 0`, and `|(1−e)(U_F/Ē_F)|=p^{−[F:ℚ]+[L:ℚ]}·p^{v_p(R_p(F)/R_p(L))}`. Use the same regulator normalization and compatible unit bases in `F` and `L`. The proof compares `log_p`: `(1 − e)U_F → (1 − e)p(ℤ_p ⊗ O_F)`, whose kernel and cokernel have equal order (1 for odd `p, 2^{g(F)−g(L)}` for `p = 2, g` the number of primes above 2), and uses `(1 − e)Ē_F ∩ ker log_p = 0`.
5. Apply `padicClassNumberFormula` for `F` and for `L` to the finite index in step 4. The discriminants are `p`-adic units. For each intervening character, `χ(p)` is a unit and `v_p(1−p⁻¹χ(p))=−1`. Thus the inverse Euler factors cancel the factor `p^{−[F:ℚ]+[L:ℚ]}`, leaving the product of the `p`-values of `½L_p(1,χ)`, with the coefficient-degree multiplicities. This proves the required product identity and forces each `δ(χ₀)=1`.

**Checks.**

- Every `δ(χ₀)=1`: the finite `ℤ_p`-torsion submodule of `Y_{χ₀}` has trivial `T`-coinvariants for `χ₀≠1`. Here “torsion” must not mean `Λ`-torsion: `Y_{χ₀}` itself is `Λ`-torsion.
- For the test module `M=ℤ_p[[T]]/(T−p)`, `M/`TM has order `p` and `M[T]=0`, agreeing with `N`(`T−p` evaluated at 0)`=p`. For the finite module `M=ℤ/p` with `T=0`, `char(M)=(1)`, while `|M/`TM`|=|M[T]|=p`. Dropping the finite torsion factor fails the latter test.
- For `p = 2` the kernel and cokernel of `log_2` on `(1 − e)U_F` both have order `2^{g(F)−g(L)}`; for odd `p` both are trivial.

See **GREITHER-1992**, §4, proof of Theorem 4.11, p. 493. The coinvariant step. **GREITHER-1992**, §4, proof of Theorem 4.11, p. 494. The `p`-adic class number formula.

*Needs:* [§4.14](#greither-main-conjecture-all-p); [§4.13](#greither-kummer-duality); [§4.1](#greither-chi-parts); [§0.23](#chi-cyclotomic-generator-unit); IntegralIwasawaTheory §3.5 (`greitherRayDictionary`); IntegralIwasawaTheory §§1.7–1.8; IntegralIwasawaTheory §4.3; IntegralIwasawaTheory §4.4; IntegralIwasawaTheory §6.3; §F.10; §F.9 (`realClassNumber_log_product`); `TauCetiRoadmap.ClassFieldTheory Layer 13` (conductor–discriminant formula).

<a id="greither-ray-class-transfer"></a>
### 4.24 Norm and inclusion maps on `p`-adic ray class groups (Greither, Lemma 4.13)
Let `F/K` be a `p`-extension of cyclic number fields that are unramified above `p`, with `C = Gal(F/K)`. There are Galois-equivariant homomorphisms `α`: `A′(F) → A′(K)`, induced by `N_{F/K}`, and `β`: `A′(K) → A′(F)`, induced by `K ⊂ F`, such that `α` is surjective, `β` is injective, and `βα` is multiplication by the norm element `Σ_{σ∈C}σ`.

`F/ℚ` is cyclic, `K` is its intermediate field, and `[F:K]` is a power of `p`. Both fields are unramified at `p`; abelian Leopoldt supplies the principal-unit lattice calculation.

Prove this as follows.

1. The inertia groups generate `Gal(F/ℚ)`, since `ℚ` has no nontrivial extension unramified at every finite prime. Their images generate its cyclic `p`-Sylow quotient, so one inertia group surjects onto that quotient. It therefore contains the entire `p`-Sylow subgroup. For a prime `ℓ≠p` with this inertia, `F/K` is totally ramified above `ℓ`. Thus `F/K` has no nontrivial subextension unramified outside `p`, and reciprocity makes `α` onto. This does not require total ramification in `F/ℚ`.
2. For a divisor `𝔪` of `K`, `ker(C_𝔪(K) → C_𝔪(F))` embeds into `H¹(C, E_𝔪(F))` with `E_𝔪(F) = ker(O_F^× → (O_F/𝔪O_F)^×)`. Since `lim` is left exact, it suffices that `lim_ν H¹(C, E_{(p^ν)}(F)) = 0`.
3. Leopoldt's conjecture for `p` and `F` gives `N ≥ 2` such that every `x ∈ E_{(p^{N+1})}(F)` is a `p`-th power of a unit `y`, and `y ∈ E_{(p^N)}(F)` because `p` is unramified in `F`.
4. Let `p^c = |C|` and `ν ≥ N`. Every 1-cocycle `x = (x_σ)` in `Z¹(C, E_{(p^{ν+c})}(F))` has `x_σ = y_σ^{p^c}` with `y_σ ∈ E_{(p^ν)}(F)`. `E_{(p^ν)}(F)` contains no nontrivial `p`-power root of unity: for odd `p` because `F` is unramified at `p`, and for `p = 2` because `−1 ≢ 1 mod 4` and `ν ≥ 2`. So `(y_σ)` is again a cocycle, and the image of `x` in `H¹(C, E_{(p^ν)}(F))` is divisible by `p^c`, hence zero.

**Checks.**

- For `p = 2` the field `F` contains `−1`. The cocycle step needs `ν ≥ N ≥ 2`, not the absence of 2-power roots of unity from `F` that Greither states.
- For `F=ℚ(√5)ℚ(ζ₇)⁺`, `p=3` and `K=ℚ(√5)`, `Gal(F/ℚ)=C₆` has inertia of orders 2 at 5 and 3 at 7. Neither prime is totally ramified over `ℚ`, but `F/K` is totally ramified at 7, which is the required relative statement.

See **GREITHER-1992**, §4, proof of Lemma 4.13, p. 495. The maps `α` and `β`. **GREITHER-1992**, §4, proof of Lemma 4.13, p. 495. The use of Leopoldt's conjecture.

*Needs:* IntegralIwasawaTheory §3.5 (`greitherRayDictionary`); `TauCetiRoadmap.ClassFieldTheory Layer 13` (ray class groups and reciprocity); `TauCetiRoadmap.ProfiniteCohomology` Layer 9 (Hilbert 90); IntegralIwasawaTheory §4.4.

<a id="greither-real-iwasawa-leopoldt"></a>
### 4.25 The real analogue of the Iwasawa–Leopoldt conjecture (Greither, Theorem 4.12 `=` Theorem `C`)
Let `F` be a real abelian field and `p` a prime unramified in `F`, with `Δ = Gal(F/ℚ) = Δ_p × Δ_0` and `Δ_p` cyclic. For every character `χ` of `Δ` with `χ|Δ_0 ≠ ε` (the order of `χ` is not a power of `p`) and `χ|Δ_p` faithful, `|A′(F)_χ| = |½L_p(1, χ)|_p^{d(χ)}`. Here `A′(F)` is the `p`-part of the projective limit of the ray class groups `C_{(p^ν)}(F)`; `A′(F)` is infinite, but `(1 − e_ε)A′(F)` is finite.

In these finite-index formulas Greither’s notation `|a|_p` means `p^{v_p(a)}`, the reciprocal of the usual `p`-adic absolute value; `d(χ)=[ℚ_p(χ):ℚ_p]`. Thus `|a|_p^{d(χ)}=Nχ(a)`.

Prove this as follows.

1. Let `χ′ = χ|Δ_0 ≠ 1`. If `Δ_p = 1`, the statement is Theorem 4.11. Otherwise let `C` be the subgroup of `Δ_p` of order `p`, and `F_1` its fixed field.
2. Lemma 4.13 gives `α`: `A′(F) → A′(F_1)` onto and `β`: `A′(F_1) → A′(F)` injective with `βα = N_C`.
3. If `Δ_p = ⟨σ⟩` has order `p^k`, then `N_C = Φ_{p^k}(σ)`, and for `χ` faithful on `Δ_p`, `A′(F)_χ = A′(F)_{χ′}/Φ_{p^k}(σ)A′(F)_{χ′}` (`Φ_{p^k}` is irreducible over the unramified `ℚ_p(χ′)`). Since `α` is onto and `β` injective, `N_C·A′(F)_{χ′} = β(A′(F_1)_{χ′}) ≅ A′(F_1)_{χ′}`, so `|A′(F)_χ| = |A′(F)_{χ′}|/|A′(F_1)_{χ′}|` (Solomon, Corollary II.1).
4. A character of `F` is a character of `F_1` exactly when it is not faithful on `Δ_p`. By Theorem 4.11 the quotient is `∏|½L_p(1, ξ)|_p^{d(χ′)}` over the `ξ` with `ξ|Δ_0 = χ′` that are faithful on `Δ_p`. These `ξ` are the `ℚ_p(χ′)`-conjugates of `χ`, so the product is `|½L_p(1, χ)|_p^{d(χ)}`.

**Checks.**

- `χ|Δ_0 ≠ ε` is needed: for `Δ_p = 1` and `χ = 1`, `A′(F)_χ` has `ℤ_p`-rank one and `L_p(s, 1)` has a pole at `s = 1`.

See **GREITHER-1992**, §1, Theorem `C`, p. 454. Theorem `C` with `χ|Δ_0 ≠ ε`. **GREITHER-1992**, §4, Theorem 4.12, p. 494. Theorem 4.12; its printed hypothesis omits `χ|Δ_0 ≠ ε`. **GREITHER-1992**, §4, proof of Theorem 4.12, p. 494. The order of the `χ`-part.

*Needs:* [§4.23](#greither-ray-class-real-fields); [§4.24](#greither-ray-class-transfer); [§4.1](#greither-chi-parts).

<a id="greither-gras-conjecture"></a>
### 4.26 Units modulo circular units and the Gras conjecture (Greither, Theorem 4.14 and Corollary 4.15)
Let `F/ℚ` be real abelian with `Δ = Gal(F/ℚ) = Δ_p × Δ_0` and `Δ_p` cyclic, and `p` unramified in `F`. Let `𝒞_F` be Sinnott's group of circular units of `F`, `E_F` the unit group, `C_F = 𝒞_F ∩ E_F`, and `(·)_p` the `p`-adic completion. For every nontrivial character `χ′` of `Δ_0`, `|(E_F/C_F)_{p,χ′}| = |A(F)_{χ′}|·|((ℤ_p/2ℤ_p)[Δ])_{χ′}|·|(R : U)_{χ′}|`, where `R = ℤ[Δ]` and `U` are as in Sinnott, and `|((ℤ_p/2ℤ_p)[Δ])_{χ′}|` is `2^{d(χ′)|Δ_p|}` for `p = 2` and 1 for odd `p`. If `|Δ|` is prime to `p`, then `[E_{F,p}/C̄_{F,p}] = [A(F)]` in the Grothendieck group `K_0` of finite `ℤ_p[Δ]`-modules, where `C̄_F` is Sinnott's larger group of circular units. In particular, for `p = 2` and `|Δ|` odd, `(E_F/C̄_F)⊗ℤ₂` and `A₂(F)` have isomorphic composition series as `ℤ_2[Δ]`-modules (the Gras conjecture).

Sinnott's `(R : U)` is a generalised index of full rational group-ring lattices, and `|(R : U)_{χ′}|` is the generalised index of their `χ′`-components over `ℤ_p(χ′)`. Sinnott's proof of Lemma 5.1 applies verbatim to these `ℤ_p`-lattices, so by §3.`3(f)` it is a power of `p` with nonnegative exponent, equal to 1 when `p∤|Δ|`. IntegralIwasawaTheory §§1.7–1.8 supply the conductor and norm lattice `U`, the circular units and the archimedean logarithmic identity; the enlarged circular-unit group `C̄_F` and its 2-elementary quotient are those of Greither's proof of Corollary 4.15, p. 496. An arbitrary lattice having the same rational character ranks does not satisfy this statement; its integral index is essential.

Greither prints the middle factor as `2^{d(χ′)|Δ_p|}` for every `p`. His proof gives `[e′(ℤ_p/2)[Δ]]`, which is 0 for odd `p`; the target states the corrected factor.

Prove this as follows.

1. Let `e′ = 1 − e_ε`. The statement is equivalent to `[e′(E_p/C_p)] = [e′A(F)] + [e′(ℤ_p/2)[Δ]] + ([e′R/e′L₀]−[e′U/e′L₀])` in `K_0(ℤ_p[Δ])`, where `L₀` is any common full lattice contained in `R∩U`. `R_{χ′} = ℤ_p(χ′)[Δ_p]` is local, so the class of an `R_{χ′}`-module is determined by its order.
2. Let `𝒪` be `ℤ_p` with all character values adjoined. Theorem 4.11 and the exact sequence of §4.23 give `[𝒪 ⊗ e′A(F)] = Σ_χ[𝒪_χ/(½L_p(1, χ))] − [𝒪 ⊗ e′(U_p/E_p)]` over the `χ` nontrivial on `Δ_0`. Since `[E_p/C_p] = [U_p/C_p] − [U_p/E_p]` and `K_0(ℤ_pΔ) → K_0(𝒪Δ)` is injective, it remains to prove (*) for `[𝒪 ⊗ e′(U_p/C_p)]`.
3. For the logarithmic comparison extend `𝒪`, if necessary, to contain the Gauss sums as well as the character values. Write `e_χ` for the rational character idempotent, `f_χ` for the primitive conductor and `τ(χ̄)` for the primitive Gauss sum. On the `e′`-part put `ω′=Σ_{χ≠1}e_{χ⁻¹}·L_p(1,χ)·(p⁻¹χ(p)−1)⁻¹·f_χ·τ(χ̄)⁻¹`. Every denominator is nonzero: `f_χ` is prime to `p`, the Gauss sum is nonzero, and `p⁻¹χ(p)` has valuation `−1`. The `p`-adic form of Sinnott's Proposition 4.2, `padicCircularLog_image` (§4.23), gives `λ(e′C_p)=e′ω′U` for `λ(u)=Σ_δlog_p(u^{δ⁻¹})δ`, and identifies `[𝒪⊗e′(U_p/C_p)]` with the generalized index `[e′p𝒪[Δ]:e′ω′U]`. Let `S=∏_χ𝒪_χ` be the maximal order of `𝒪[Δ]`. Since `f_χ` and `τ(χ̄)` are `p`-adic units and `(p⁻¹χ(p)−1)⁻¹` is associated to `p`, [`e′`pS:`e′ω′S`]`=Σ_χ[𝒪_χ/(L_p(1,χ))]`, over `χ` nontrivial on `Δ₀`. Replacing `S` by `𝒪[Δ]` gives the same class: its two finite lattice defects cancel under multiplication by `p` and `ω′`. Thus `[𝒪⊗e′(U_p/C_p)]=Σ_χ[𝒪_χ/(L_p(1,χ))]+[e′𝒪R:e′𝒪U]`. Comparing `L_p` with `½L_p` in step 2 contributes `Σ_χ[𝒪_χ/(2)]`, which is `[e′(𝒪/2𝒪)[Δ]]` in the finite-module Grothendieck group. This is precisely the factor that is nontrivial at `p=2` and disappears at odd `p`. All generalized indices here are differences through a common full sublattice, as in step 1.

4. Corollary 4.15. If `|Δ|` is prime to `p`, then `ℤ_pR = ℤ_pU`, so `[E_p/C_p] = [A(F)] + [(1 − e_ε)(ℤ_p/2)[Δ]]`. For odd `p` that term vanishes and `C̄_F/C_F` is 2-elementary. For `p = 2`, every totally positive element of `C_F` is a square in `E_F` (Sinnott, p. 209, with `(2, |Δ|) = 1`), so `C̄_F/C_F ≅ (1 − e_ε)(ℤ/2)[Δ]`, which cancels the extra term.

**Checks.**

- For odd `p` the factor `|((ℤ_p/2ℤ_p)[Δ])_{χ′}|` is 1: both sides of 4.14 are then powers of `p`.

See **GREITHER-1992**, §4, Theorem 4.14, p. 495. Theorem 4.14; its printed factor `2^{d(χ′)|Δ_p|}` is corrected for odd `p`. **GREITHER-1992**, §4, proof of Corollary 4.15, p. 496. Corollary 4.15. **GREITHER-1992**, §4, proof of Theorem 4.14, p. 497. Sinnott's §4 with `p`-adic `L`-functions.

*Needs:* [§4.23](#greither-ray-class-real-fields) (`padicCircularLog_image`); [§3.3](#finite-layer-comparison) (`sinnottCorrection_primes`); [§4.1](#greither-chi-parts); IntegralIwasawaTheory §1.7; IntegralIwasawaTheory §1.8; §F.10.

<a id="integral-coleman-image-prime-to-p"></a>
### 4.27 The integral Coleman image for characters of order prime to `p`, and the character form of the odd-prime main conjecture (Rubin, Theorems III.2.9(ii) and III.2.10)
Let `p` be odd, `χ` an even nontrivial character of `G_ℚ` of finite order prime to `p`, with field `L` and conductor `f`, `O=ℤ_p[χ]` and `Λ=O[[Gal(ℚ_∞/ℚ)]]`. Let `U_∞` and `C_{∞,χ}` be as in §2.2, and `Z_∞` the Galois group of the maximal abelian pro-`p` extension of `L_∞` unramified outside `p`. Let `L_χ∈Λ` be the element of Rubin's Theorem III.2.9`(i)`: for every `k≥1` and every finite-order character `ρ` of `Gal(ℚ_∞/ℚ)`, `(ω^{−1}ε_cyc)^kρ(L_χ)=(1−ω^{−k}ρχ(p)p^{k−1})L(1−k,ω^{−k}ρχ)`. Then:

`(i)` `integralColemanImage_primeToP`: `char(U^χ_∞/C_{∞,χ})=L_χΛ` (Rubin, Theorem III.2.9(ii));

(ii) `cyclotomicMainConjecture_chi`: `Z_∞` is a finitely generated `Λ`-module and `char(Z^χ_∞)=L_χΛ` (Rubin, Theorem III.2.10).

In a coordinate `γ↦1+T`, `L_χ(T)=G_p(u(1+T)^{−1}−1,χ)` for Greither's series `G_p` of §4.7, by the Mellin relation of IntegralIwasawaTheory §6.3; both sides are determined by their values at the points `u^kζ−1`.

`p` is odd and the order of `χ` is prime to `p`, so the character functors are exact. For `p=2`, or for characters whose order is divisible by `p`, §4.8 gives the corresponding statement only after inverting `p`, and §4.14 gives the class-side statement.

Prove this as follows.

1. Reduction to §§4.3–4.8. The order of `χ` is prime to `p`, so `f=f₀p^ε` with `p∤f₀` and `ε∈{0,1}`, and `χ=χ₀χ_p` with `χ₀` a character modulo `f₀` and `χ_p` a power of `ω`. Let `F` be the field cut out by `χ₀`, which is unramified at `p` and of degree prime to `p`, and `K_n=F(ζ_{p^{n+1}})`. Then `L_n⊆K_n`, `Δ′=Gal(K_0/ℚ)` has order prime to `p`, and `χ` is an even character `ρ` of `Δ′`. The `χ`-parts of `U`, `C` and `Z` over `L_∞` are the `ρ`-parts of the corresponding modules over `K_∞`, by the exact prime-to-`p` projections.
2. With `p∤|Δ′|`, Proposition 2.10 (§4.5) gives on `ρ`-parts the exact sequence `0→(ℤ_p(1)^g)_ρ→U_{∞,ρ}→𝒱(1)_ρ→(ℤ_p(1)^g)_ρ→0`. Its two outer terms are isomorphic, so they cancel in characteristic ideals. Hence `char(U_{∞,ρ}/C_{∞,ρ})=char(𝒱(1)_ρ/αψ(C_{∞,ρ}))`.
3. Integral freeness. `F` is unramified at `p`, so `ℤ_p⊗O_F` is free over `ℤ_p[Δ]` (`a` normal basis of the residue extension lifts, as in §4.4, step 5), and its `ρ|_Δ`-part is free of rank one over `ℤ_p(ρ)`. It is generated by `y_ρ=(Tr_{ℚ(μ_m)/F′}ζ_m)_ρ`, `m=cond(ρ|_Δ)`: the `ρ`-resolvent of `y_ρ` is a Gauss sum of conductor `m`, and `m` is prime to `p`, so the resolvent is a `p`-adic unit. By Theorem 2.6 (§4.4), `𝒱_ρ` is free of rank one over `Λ_ρ` on `z_ρ=y_ρ(1−X)`, integrally.
4. Integral generation. By Lemma 2.3 (§4.3), `C_∞` is generated, up to a finite group of order prime to `p`, by the `η_{m′,F}`, `±1` and the circular units of `ℚ(ζ_{p^∞})`. The exact `ρ`-projection kills `±1`, kills the circular units of `ℚ(ζ_{p^∞})` when `ρ|_Δ≠1`, and kills `η_{m′,F}` for `m′` a proper divisor of `m`, as in Lemma 2.11(b), whose argument is integral once the projection is exact. So `C_{∞,ρ}=Λ_ρ·(η_m)_ρ`. When `ρ|_Δ=1`, that is `L⊆ℚ(μ_p)^+`, `C_{∞,ρ}=Λ_ρ·(c_b)_ρ` by §4.7, step 7, with `σ_b−1` acting as the unit `ρ(b)−1`.
5. The image. The identities of §4.7, steps 2–6 for `m>1` and step 7 for `m=1`, are identities of integral power series, so `αψ(C_{∞,ρ})=G_p(T′,ρ)·Λ_ρz_ρ`. Hence `𝒱(1)_ρ/αψ(C_{∞,ρ})≅Λ/(G_p(T′,ρ))(1)`, and the twist (1) with the inversion `T′` carries `G_p(T′,ρ)` to the series `L_χ(T)=G_p(u(1+T)^{−1}−1,χ)`. This proves `(i)`.
6. (ii). The `ψ`-part of IntegralIwasawaTheory §2.7 (`infiniteGlobalLocalSequence` for `L`, with no sign term at odd `p`), divided by the closed submodule `C_{∞,χ}⊆E^χ_∞`, gives `0→E^χ_∞/C_{∞,χ}→U^χ_∞/C_{∞,χ}→Z^χ_∞→A^χ_∞→0`; finite generation of `Z_∞` is IntegralIwasawaTheory §2.4. Multiplicativity of characteristic ideals, §3.4 `(char(E^χ_∞/C_{∞,χ})=char(A^χ_∞)≠0)` and `(i)` give `char(Z^χ_∞)=L_χΛ`.

**Checks.**

- For `L=ℚ(μ_p)^+` and `χ=ω^k` with `k` even and `k≢0 mod p−1`, `(i)` is the `χ`-component of Iwasawa's theorem, ColemanPowerSeries §4.30, and (ii) is the `χ`-component of §3.5.
- The variable change at `k=1`, `ρ=1`: the character `ω^{−1}ε_cyc` sends `γ` to `u`, so `L_χ(u−1)=G_p(0,χ)=L_p(0,χ)=−(1−χω^{−1}(p))B_{1,χω^{−1}}`, which is Rubin's value `(1−ω^{−1}χ(p))L(0,ω^{−1}χ)`. Using `G_p(T,χ)` without the inversion would give `G_p(u−1,χ)=L_p(1,χ)` at that point instead.
- For `χ` quadratic of conductor 5 and `p=11`, `χ(11)=1`, but `χ` is unramified at 11, so `ρ|_Φ` is trivial while `Φ` acts on `ℤ_p(1)` through the odd character `ω`. The outer terms of step 2 vanish and `(i)` holds with no `ℤ_p(1)`-correction, although the valuation line of §2.2 is present in `Y^χ_∞`.

See **RUBIN-ES**, Chapter III, Theorem 2.9 and its proof references, printed p. 39 (citing Iwasawa, Washington Theorem 13.56, Lang Theorem 7.5.2 and Gillard Théorème 1); Appendix D, §2, Lemmas 2.1–2.2, printed pp. 167–168, for the main computation; Theorem 2.10 and its proof, printed p. 39. **GREITHER-1992**, §2, Lemma 2.3 and Lemma 2.11 to Corollary 2.14, pp. 456–465; the Remark after Theorem 2.13, p. 468, notes that the integral version is expected in general. Here it is proved for characters of order prime to `p`, where the projections are exact.

*Needs:* [§2.2](#limit-unit-diagram); [§3.4](#componentwise-iwasawa-equality); [§4.3](#greither-circular-unit-limit); [§4.4](#greither-coleman-sequence-all-p); [§4.5](#greither-semilocal-coleman-map); [§4.6](#greither-circular-unit-generators); [§4.7](#greither-stickelberger-image); [§4.8](#greither-semilocal-units); [§0.21](#one-sub-root-of-unity-unit); IntegralIwasawaTheory §§2.4, 2.7, 6.3; ColemanPowerSeries §4.30; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

### Examples

For `F=ℚ`, `p=5` and `ρ=ω²`, `ρ` is nontrivial on `Φ` but trivial on `Δ`.
The conductor-`m` unit-series argument has `m=1` and `f₀=X`, so the image is
computed from the smoothed unit `(1−ζ^b)/(1−ζ)` with `b` of order 4, where
`b[b]−1` acts as `ρ(b)−1=−2` on the relevant component. For the comparison
with the Coleman normalisation `h₂=2−X` is a genuine
unit, and at `p=5` its arithmetic-Frobenius boundary has coefficient `−1`
as computed in §4.7. At odd `p` the
local logarithm has kernel `p^ℤ×μ_{p−1}` on `ℚ_p^×` and image `pℤ_p` on
`ℤ_p^×`; at `p=2` these are `{±1}×2^ℤ` and `4ℤ_2`. At `p=2`, `N(ζ₈)=−i`; the
signed root generator is `−(1−X)`. For `F=ℚ(√−7)`, `α=(1+√−7)/2`
has norm 2 and `μ([α])=𝔭` while `μ([2])=0` in the minus divisor
quotient. The quartic character of conductor 5 has
`B₁`,`χ⁻¹=(−3+i)/5` and `Nχ(½B₁)=1/2`; the pure-2-power factor 2
recovers the class-group order 1. The conductor-217 and
ray-class transfer checks above distinguish field descent and relative ramification.
For `ℚ(√5)` and `p=3`, `ε^8=21ε+13≡1+3ε² mod 9` gives `v_3(R_3)=1`, and
the Euler factor `(1+1/3)^{−1}` makes `L_3(1,χ)` a 3-adic unit in the `p`-adic
class number formula. For `p=2` and `𝒪=ℤ_2` the constant series 1 has zero
derivative but is not in the image of Coleman's map, because `1∉2ℤ_2`.

### Dependencies

Layers 0–3; IntegralIwasawaTheory §§0.3, 1.7–1.8, 2.3–2.4, 2.7–2.8, 3.1–3.2, 3.5, 4.1–4.4, 5.6, 6.3 and 10.4 (including both forms of Baker–Brumer); §F.9; ColemanPowerSeries §§1.82–1.85, 1.93, 1.117–1.120, 2.39, 4.24, 4.27 and 4.30; §§F.10, F.11; §F.4; `TauCetiRoadmap.ClassicalArithmeticCompletion` §§1.47 and 1.55; `TauCetiRoadmap.Chebotarev` Layer 10; Tau Ceti ClassFieldTheory Layers 0 and 11–13; Tau Ceti ProfiniteCohomology Layer 9; PadicMeasuresIwasawaAlgebras §§1.1, 1.3, 1.7, 2.6, 2.11, 4.2, 4.4, 4.6, 4.7 and 5.2. The exact inputs are named at each target.

## Layer 5: Finite and Selmer consequences

Apply the preceding theorems after all their inputs. The finite unit-index
equality uses Gras for the auxiliary split characters; the odd-character
form uses all-prime Kummer duality; the Greenberg formulation uses the exact
Tate-twist dictionary and retains the ideal cancelling the analytic pole.

<a id="mazur-wiles-chi-equality"></a>
### 5.1 The equality `|A_L^χ| = [E_L^χ : C_{L,χ}]` (Rubin, Corollary III.2.4)
Let `p > 2` and `χ` : `G_ℚ → O^×` even, nontrivial, of finite order prime to `p`, with conductor `f` and field `L`; `T = O_χ`, `W = D_χ`, `T* = O_{χ^{−1}}(1)`, `W* = T* ⊗ ℚ_p/ℤ_p`, with `χ(p) ≠ 1`. Then `|A_L^χ| = [E_L^χ : C_{L,χ}]` (Mazur–Wiles).

`p>2`, `χ` even nontrivial of order prime to `p`, `L` its fixed field and `χ(p)≠1`, as in Rubin III Corollary 2.4. A common finite unramified coefficient extension `O′` contains all characters `ψ` of `Δ=Gal(L/ℚ)`.

Use the exact circular-unit class-number product for `L`. Sinnott's index theorem gives `v_p[E_L:C^S_L]=v_p(h_L)` for odd `p` and real `L` with `p∤[L:ℚ]` (Sinnott 1980, Theorem 4.1, p. 207, which is IntegralIwasawaTheory §1.8, with Proposition 5.1, p. 211, which is §3.`3(f)`): the conductor factor `∏_{q|f}[L_{q^e}:ℚ]/[L:ℚ]` and the index `(R:U)` involve only primes dividing `[L:ℚ]`, and the remaining factor is a power of 2. By §3.`3(a)` at `n=0`, the `ψ`-part of Sinnott's group is `O′ξ_{L,ψ}=C_{L,ψ}` for every `ψ≠1`, and its trivial part is the circular-unit group of `ℚ`, which vanishes after `p`-adic completion. So the sum over `ψ≠1` of the `O′`-lengths of `E_Lψ/C_{L,ψ}` equals that of `A_Lψ`; the conductor/norm-lattice correction is a `p`-adic unit for `p∤|Δ|`.

This finite equality follows after Layer 4. Layer 2 uses the finite divisibility of §1.6; the present equality is a later consequence.

Prove this as follows.

1. For each `ψ≠1` with `ψ(p)≠1` apply §1.6 to the field `Lψ` cut out by `ψ`. Since `[L:Lψ]` is prime to `p`, restriction/norm identifies its `ψ` class and unit components with those of `L`; the corresponding circular-unit line differs only by the prime-to-`p` norm scalar.
2. If `ψ(p)=1`, its primitive conductor is prime to `p`. Apply §4.26 to the real unramified-at-`p` field `Lψ`, of degree prime to `p`. This gives equality of the `ψ` class and circular-unit lengths without using the finite equality being proved here.
3. The class-number product above says the sum of the nonnegative differences `ℓ(E_Lψ/C_{L,ψ})−ℓ(A_Lψ)` is zero. Each difference is therefore zero, including `χ`. Finite unramified coefficient extension preserves this equality and descent gives the claimed orders over `O`.
4. This argument also explains why the `p|f` case cannot be proved by applying the unramified Gras theorem directly to `L`: only the `ψ(p)=1` subfields use that theorem. The remaining `ψ` use the finite Euler-system bound.

**Checks.**

- Needs the bound for all characters of `Δ`, not only `χ`.

See **RUBIN-ES**, Chapter III, Corollary 2.4 and its proof, printed p. 36. States the finite class-group/circular-unit equality and invokes the analytic product argument. Use the exact product above and the unramified Gras theorem for the other characters. **SINNOTT-1980**, Theorem 4.1, p. 207, and Proposition 5.1, p. 211. The index of the circular units of an abelian field, and the primes that can divide its correction factor.

*Needs:* [§1.6](#kolyvagin-class-group-divisibility); [§3.3](#finite-layer-comparison); [§4.26](#greither-gras-conjecture); [§0.24](#chi-cyclotomic-units); IntegralIwasawaTheory §1.8.

<a id="odd-character-formulation"></a>
### 5.2 The odd-character form of the main conjecture at odd `p`
Let `p` be odd, `F_∞ = ℚ(μ_{p^∞})`, `Δ = Gal(ℚ(μ_p)/ℚ)`, `Γ = Gal(F_∞/ℚ(μ_p))` and `Y_∞ = lim← A_p(ℚ(μ_{p^{n+1}}))`, the Galois group of the maximal unramified abelian pro-`p` extension of `F_∞`. For every odd character `χ ≠ ω` of `Δ`, `char_{ℤ_p(χ)[[T]]}(Y_{∞,χ}) = (G_p(T, χ̌))` with `χ̌ = ωχ^{−1}`, and `Y_{∞,ω}` has characteristic ideal (1). This is equivalent to the even form `char_{Λ(Γ^+)}(X_∞^+) = I(Γ^+)ζ_p` (Theorem 13.8): each follows from the other by Kummer duality between the odd part of `Y_∞` and the even part of `X_∞`.

For odd `p` the `χ`-parts are exact, since `p ∤ |Δ| = p − 1`, and `½` is a unit, so Greither's normalisation agrees with the classical one.

Prove this as follows.

1. Even to odd. This is the case `F = ℚ`, `p` odd, of §4.14. Its proof passes from the real main conjecture (here Theorem 13.8, through the four-term sequence and the local-unit theorem) to the odd components by Kummer duality (Greither, Lemma 3.3 and Proposition 3.4).
2. Odd to even. Kummer duality is an equality `V_ρ(X^+) ≅ V_χ(Y)^*(1)` of `ℚ_p`-representations for `ρ = ωχ^{−1}`. Together with `μ = 0` (Ferrero–Washington) it turns the odd characteristic ideals into the even ones componentwise. The `χ = ω` component corresponds to the trivial component of `X_∞^+`, which is treated in §3.2.
3. The `χ`-parts match RJW's `Λ(Γ^+)`-module `X_∞^+` through the decomposition `Λ(Γ^+) = ∏_ρ ℤ_p(ρ)[[T]]` over the even characters `ρ` of `Δ`, which is valid because `p ∤ |Δ|`.

**Checks.**

- `χ = ω` is the component where `Y_∞` is finite; its characteristic ideal is (1), matching the unit trivial component of `I(Γ^+)ζ_p`.

See **RJW-PADIC-L**, Remark 13.9, p. 67 (arXiv v2). RJW leave the odd form to the literature. **GREITHER-1992**, §1, the Main Conjecture (`=` Theorem 3.2), p. 452. The odd form; for odd `p` the factor `½` is a unit.

*Needs:* [§3.5](#cyclotomic-main-conjecture); [§4.13](#greither-kummer-duality); [§4.14](#greither-main-conjecture-all-p); [§4.1](#greither-chi-parts); PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

<a id="tate-twisted-selmer-formulation"></a>
### 5.3 The main conjecture as Greenberg's conjecture for the Tate twists `ℚ_p(n)` (RJW §13.5)
Let `p` be odd, `F = ℚ(μ_{p^∞})^+`, `Γ^+ = Gal(F/ℚ)` and `χ` the cyclotomic character. For `n ∈ ℤ` let `W_n = (ℚ_p/ℤ_p)(n)`, let `S_n = H¹_{L_Gr}(F, W_n)` be its Greenberg Selmer group, and `S_n^∨` its Pontryagin dual, a finitely generated `Λ(Γ^+)`-module. The Greenberg condition is unramified away from `p`; at `p` it is the whole of `H¹` for `n ≥ 1` and the unramified subgroup for `n ≤ 0`. Let `r_n` be the order of the pole of `L_∞(ℚ_p(n), s) = π^{−(s−n)/2}Γ((s−n)/2)` at `s = 1`, and `G=Gal(ℚ(μ_{p∞})/ℚ)`. Define `Tw_n` on `Λ(G)` by `[g]↦χ(g)^n[g]` (multiplication of measures by `x^n`, RJW’s `∂^n`). For even `n` it restricts to an automorphism of `Λ(Γ⁺)`. For odd `n` it exchanges the plus and minus factors; `χ` itself does not descend to `Γ⁺`. Then:
`(a)` Greenberg's Conjecture 13.21(i) holds for every `n`. `S_n^∨` has `Λ(Γ^+)`-rank `r_n`, which is 1 for odd `n ≥ 1` and 0 otherwise.
`(b)` For even `n ≥ 2`, where `r_n = r_{1−n} = 0`: `S_n^∨ ≅ X_∞^+(−n)` and `char(S_n^∨) = Tw_n(I(Γ^+)ζ_p) = Tw_n(I(Γ^+))·∂^nζ_p`.
`(c)` For odd `n ≤ −1`, where `r_n = r_{1−n} = 0`: `S_n^∨ ≅ Y_∞^{c=−1}(−n)`, and `char(S_n^∨)` is the `Tw_n`-twist of the odd-character characteristic ideal.
`(d)` For even `n ≤ 0`, `r_{1−n} = 1`, so Conjecture 13.21(ii) does not apply; this includes `n = 0` (Remark 13.23).

The filtration specifying Greenberg’s condition is `G_{ℚ_p}`-stable. For the one-dimensional representation `ℚ_p(n)`, take the whole space when `n≥1` and zero when `n≤0`.

RJW's Example 13.22 calls Greenberg's conjecture for `ℚ_p(n)` 'essentially' Theorem 13.8, with `p`-adic `L`-function `∂^nζ_p`. That element has a pole at the even character `x^{−n}` and is not in `Λ(Γ^+)`. The integral characteristic ideal carries the factor `Tw_n(I(Γ^+))`, the ideal of the character `x^{−n}`; part `(b)` states the precise identity.

Prove first `pRamified_characterRank`. Let `p` be odd, `Δ=Gal(ℚ(μ_p)/ℚ)`, and `X_∞` the Galois group over `ℚ(μ_{p^∞})` of its maximal abelian pro-`p` extension unramified outside `p`. For every character `ψ` of `Δ`, the `ψ`-component of `X_∞` has rank one over `ℤ_p[[Γ]]` when `ψ` is odd and rank zero when `ψ` is even, where `Γ=Gal(ℚ(μ_{p^∞})/ℚ(μ_p))`. (Iwasawa's rank theorem in characterwise form, used by RJW §13.5.)

Prove it as follows.

1. IntegralIwasawaTheory §2.7 (`infiniteGlobalLocalSequence`, with no sign term at odd `p`) gives `0→E_∞→U_∞→X_∞→Y_∞→0`, and `Y_∞` is torsion (IntegralIwasawaTheory §2.4). The projections to `ψ`-components are exact because `p∤p−1`. So `rank e_ψX_∞=rank e_ψU_∞−rank e_ψE_∞`.
2. The local units: ColemanPowerSeries §3.46 gives `0→ℤ_p(1)→U_{∞,1}→Λ(G)→ℤ_p(1)→0` with `G=Gal(ℚ_p(μ_{p^∞})/ℚ_p)≅Δ×Γ`, so every `e_ψU_∞` has rank one.
3. The global units: for odd `ψ`, `e_ψE_∞` has rank zero, because the subgroup generated by real units and roots of unity has index 1 or 2 in all units (`NumberField.IsCMField.indexRealUnits_eq_one_or_two`) and complex conjugation acts trivially on real units and by inversion on roots of unity, so the odd components of `E_n⊗ℤ_p` are the `p`-power roots of unity. Hence every odd `ψ` has rank `e_ψX_∞=1`.
4. The total rank of `X_∞` is `r_2(ℚ(μ_p))=(p−1)/2` (IntegralIwasawaTheory §2.6, weak Leopoldt). There are `(p−1)/2` odd characters, so the even components have total rank zero, and each has rank zero.

**Checks for `pRamified_characterRank`.**

- `p=3`: `Δ` has one odd character `ω` and one even character. `X_∞` has rank `r_2(ℚ(μ_3))=1`, all of it in the `ω`-component; the even component is `X_∞^+`, which is zero (§5.3, first Check).
- The total rank `(p−1)/2` alone does not give the distribution: a rank of 2 on one odd component and 0 on another has the same total. Step 3 is what forces each odd component to have rank one.
- For `ψ=1`, `e_1X_∞` is the `p`-ramified module of `ℚ_∞`, which is zero (§3.2), consistent with rank `e_1U_∞=`rank `e_1E_∞=1`.

The theorem is then proved as follows.

1. The identification of `S_n`. For `n ≥ 1`, `S_n = Hom_cts((X_∞)^{c=(−1)^n}, W_n)`; for `n ≤ 0`, `S_n = Hom_cts((Y_∞)^{c=(−1)^n}, W_n)`. Here `X_∞` and `Y_∞` are the Galois groups over `F_∞ = ℚ(μ_{p^∞})` of the maximal abelian pro-`p` extensions unramified outside `p` and everywhere unramified, and `(X_∞)^{c=1} ≅ X_∞^+` (RJW §13.5.2; the module comparison of §3.1). The Pontryagin dual of `Hom_cts(M, W_n)` is `M(−n)`, with `g` acting as `χ(g)^{−n}g`. So `char(M(−n)) = Tw_n(char M)`, since `M(−n)` is `M` pulled back along `Tw_n^{−1}`.
2. Gamma factors. The poles of `Γ((s − n)/2)` are at `s = n − 2k`, `k ≥ 0`, so `r_n = 1` exactly when `n` is odd and `n ≥ 1`. The dual `ℚ_p(n)^∨ = ℚ_p(1 − n)` has `r_{1−n} = 1` exactly when `n` is even and `n ≤ 0`. So (ii) applies exactly for even `n ≥ 2` and odd `n ≤ −1`, the critical cases of Remark 13.23.
3. `(a) X_∞^+` is torsion by Theorem 13.8, and `Y_∞` is torsion. `X_∞` has `Λ(Γ)`-rank `r_2(ℚ(μ_p)) = (p − 1)/2`, all of it on the `c=−1` side, with each odd component of rank one (`pRamified_characterRank`). This refined characterwise formula, rather than the total rank alone, gives rank one over the minus factor of `Λ(G)`. Twisting by an odd power of `χ` carries that minus part to `Λ(Γ^+)`. So `S_n^∨` has rank 1 for odd `n ≥ 1` and is torsion otherwise.
4. `(b)` For even `n ≥ 2`, `S_n^∨ = X_∞^+(−n)`, and Theorem 13.8 gives `char = Tw_n(I(Γ^+)ζ_p) = Tw_n(I(Γ^+))·Tw_n(ζ_p)`. `Tw_n(ζ_p) = ∂^nζ_p` is RJW's twist of Kubota–Leopoldt.
5. `(c)` For odd `n ≤ −1`, `S_n^∨ = Y_∞^{c=−1}(−n)`. The twist by the odd character `χ^n` turns `Y_∞`'s odd part into a `Λ(Γ^+)`-module, and the odd-character formulation gives its characteristic ideal componentwise.
6. `(d)` is the gamma-factor count.

**Checks.**

- `p = 3`: `Γ^+ = ℤ_3^×/{±1} ≅ 1 + 3ℤ_3` and `X_∞^+ = 0`, since the only abelian 3-ramified pro-3 extension of `ℚ` is the cyclotomic `ℤ_3`-extension. So `S_n = 0` for even `n ≥ 2`, and `char(S_n^∨) = Λ = Tw_n(I(Γ^+)ζ_3)`, while `∂^nζ_3` alone has a pole at `x^{−n}`. This separates the precise identity from the 'essentially' of Example 13.22.
- `n = 0` is excluded from (ii), and `n = 1` has corank 1, matching `r_1 = 1`.

See **RJW-PADIC-L**, §13.5.1, Definition 13.19, p. 70 (arXiv v2). Greenberg's local condition. **RJW-PADIC-L**, §13.5.2, p. 70 (arXiv v2). `X_∞` as a Greenberg Selmer group. **RJW-PADIC-L**, §13.5.2(3), p. 71 (arXiv v2). The local condition at `p`; '`n ≥ 0'` should read `n ≤ 0`. **RJW-PADIC-L**, Conjecture 13.21 and Example 13.22, p. 71 (arXiv v2). Greenberg's conjecture and the case of even `n`. **RJW-PADIC-L**, Remark 13.23, p. 72 (arXiv v2). `n = 0`; its gamma-factor identity is misprinted.

*Needs:* [§3.5](#cyclotomic-main-conjecture); [§5.2](#odd-character-formulation); [§3.2](#trivial-character-component); §F.2; §3.1; IntegralIwasawaTheory §§2.4, 2.6, 2.7; ColemanPowerSeries §3.46; `NumberField.IsCMField.indexRealUnits_eq_one_or_two`; PadicMeasuresIwasawaAlgebras §4.6 (the characteristic ideal).

### Examples

For `p=3` the real cyclotomic `p`-ramified module is zero. Thus for even
`n≥2`, `S_n=0` and its characteristic ideal is the unit ideal
`Tw_n(Iζ₃)`, while `∂ⁿζ₃` alone has a pole at `x⁻ⁿ`. At `n=0` the
dual gamma rank excludes Greenberg's characteristic-ideal assertion;
at `n=1` the Selmer corank is 1.

### Dependencies

Layers 1, 3 and 4; IntegralIwasawaTheory §§1.8, 2.4, 2.6 and 2.7; §F.2; §3.1; ColemanPowerSeries §3.46; PadicMeasuresIwasawaAlgebras §§4.2, 4.4, 4.6 and 4.7. The exact inputs are named at each target.

## Downstream consumers

SpecialValuesBirchTate uses Layer 4: Greither's main conjecture for abelian
fields unramified at `p`, at every prime `p` including 2, with its character
quotients, Kummer duality and exceptional character (§§4.1, 4.13 and 4.14),
in its proof of Federer's main conjecture for totally real abelian fields.
Kato's Euler system and the other arithmetic applications apply the generic
Euler-system theory directly; the cyclotomic units here are its worked example.

## References

- **SHARIFI-IWASAWA** — Romyar Sharifi, *Iwasawa Theory*, 189-page author notes.
  [Author PDF](https://www.math.ucla.edu/~sharifi/iwasawa.pdf).
  Sections 4.1–4.2, pp.100–108, give the finite value and class-number products;
  §4.5, pp.113–117, gives integral Stickelberger smoothing and annihilation.
- **MORITA-1975** — Yasuo Morita, *A `p`-adic analogue of the `Γ`-function*,
  J. Fac. Sci. Univ. Tokyo Sect. IA Math. 22 (1975), 255–266.
  [Repository PDF](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf).
- **GROSS-KOBLITZ-1979** — Benedict H. Gross and Neal Koblitz, *Gauss sums
  and the `p`-adic `Γ`-function*, Annals of Mathematics 109 (1979), 569–581.
  [Author-hosted scan](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf).
- **ROBERT-2001** — Alain M. Robert, *The Gross–Koblitz formula revisited*,
  Rend. Sem. Mat. Univ. Padova 105 (2001), 157–170.
  [Numdam PDF](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf).
  Theorems 1–4 and the appendices supply the all-prime scalar analytic proof.
- **ZHAO-2022** — Luochen Zhao, *Sum expressions for Kubota–Leopoldt `p`-adic
  `L`-functions*, Proc. Edinburgh Math. Soc. 65 (2022), 460–479.
  [Published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf).
  Theorem 4.1 and equations (4.5)–(4.6), pp.470–473, give the derivative comparison.

All locations in the targets are printed page numbers. The Rubin author draft
has printed page = PDF page − 10; Greither's scan has journal page = PDF page + 447;
Sinnott's scan has journal page = PDF page + 179; Solomon's scan has journal page = PDF page + 465;
the scans of Coleman 1979 and Rubin 1988 have journal page = PDF page + 89 and + 699.
Belliard and RJW citations explicitly use preprint pagination.

- **RUBIN-ES** — Karl Rubin, *Euler systems*, freely readable author draft distributed
  with the 1999 Arizona Winter School notes, with chapter and section numbering of
  Annals of Mathematics Studies 147 (2000). [Author draft](https://swc-math.github.io/notes/files/99RubinES.pdf).
- **RJW-PADIC-L** — Joaquín Rodrigues Jacinto and Chris Williams, *An introduction
  to `p`-adic `L`-functions*, arXiv:2309.15692v2, 19 December 2024.
  [Version cited](https://arxiv.org/abs/2309.15692v2). Citations use this version's pagination.
- **GREITHER-1992** — Cornelius Greither, *Class groups of abelian fields, and the
  main conjecture*, Annales de l'Institut Fourier 42 (1992), no. 3, 449–499.
  [Numdam](https://www.numdam.org/item/AIF_1992__42_3_449_0/).
- **BELLIARD-DESCENT** — Jean-Robert Belliard, *Global units modulo circular units:
  descent without Iwasawa's main conjecture*, Canadian Journal of Mathematics
  61 (2009), 518–533. [Author preprint, arXiv:0912.2528v1](https://arxiv.org/abs/0912.2528v1).
  Locators above use the preprint's pages 1–18.
- **SINNOTT-1980** — Warren Sinnott, *On the Stickelberger ideal and the circular
  units of an abelian field*, Inventiones Mathematicae 62 (1980), 181–234.
  [GDZ article scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0062/LOG_0014.pdf).
  Cited for the definition of circular units (§4, p. 201), the index
  theorem (Theorem 4.1, p. 207), the primes dividing its correction
  (Proposition 5.1, p. 211) and its stability in `ℤ_p`-extensions: the
  introduction theorem is on p.182, and §7, pp.232–233, proves the
  conductor-correction stabilization using Theorem 6.1, p. 226.
- **SOLOMON-1990** — David Solomon, *On the classgroups of imaginary abelian fields*,
  Annales de l'Institut Fourier 40 (1990), no.3, 467–492.
  [Primary article](https://www.numdam.org/item/AIF_1990__40_3_467_0/). Cited for the
  odd-prime class-group theorem (Theorem II.1, p. 472) and its split-prime
  proof (§III, pp. 481–491).
- **MAZUR-WILES-1984** — Barry Mazur and Andrew Wiles, *Class fields of abelian
  extensions of `ℚ`*, Inventiones Mathematicae 76 (1984), 179–330.
  [GDZ article scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0076/LOG_0020.pdf).
  The proof route here uses §1.10, pp.218–224, and the already available
  main-conjecture layer of this roadmap.
- **GROSS-DASGUPTA-2022** — Benedict H. Gross and Samit Dasgupta, *Two encounters
  with the `p`-adic Stark conjecture*, 2022 manuscript.
  [Author manuscript](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf), §2, pp.3–5.
- **COLEMAN-1979** — Robert F. Coleman, *Division values in local fields*,
  Inventiones Mathematicae 53 (1979), 91–116.
  [GDZ article scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0053/LOG_0011.pdf).
  Cited for Theorem 22 and its proof, pp. 108–110 (the exact sequence behind
  Greither's Theorem 2.4), and Theorem 24, p. 110 (the series of Rubin's Appendix D).
- **COLEMAN-1981** — Robert F. Coleman, *The dilogarithm and the norm residue
  symbol*, Bulletin de la Société Mathématique de France 109 (1981), 373–402.
  [Numdam](https://www.numdam.org/item/BSMF_1981__109__373_0/). Cited for
  Theorem 1, p. 377, the explicit formula for the norm residue symbol.
- **RUBIN-1988** — Karl Rubin, *On the main conjecture of Iwasawa theory for
  imaginary quadratic fields*, Inventiones Mathematicae 93 (1988), 701–713.
  [GDZ article scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0093/LOG_0034.pdf).
  Cited for Lemma 1.2, p. 703, its proof, pp. 703–704, and the sequence on p. 705.

References to Iwasawa, Coates, Ferrero–Greenberg, Gillard, Wiles, de Shalit, Tate,
Washington and Lang identify results invoked in these public sources. Coleman's
*Local units modulo circular units* (Proc. Amer. Math. Soc. 89 (1983)) is cited
only through Greither, pp. 460–461. Sinnott, Mazur–Wiles and Solomon are cited
directly for the conductor and finite lattice comparisons. The exact mathematical
contracts consumed from their supplier roadmaps are stated above; no theorem
is supplied by a bare book reference.
