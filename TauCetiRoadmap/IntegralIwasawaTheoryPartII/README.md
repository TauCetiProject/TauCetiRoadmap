# Roadmap: arithmetic Iwasawa theory and the main conjecture, part II — the Gross–Stark conjecture

**Summary.** This roadmap extends IntegralIwasawaTheory from its cyclotomic, Deligne–Ribet and Baker–Brumer infrastructure to the Gross–Stark leading-term theorem of Dasgupta–Kakde–Ventullo. For a totally real field `F`, a totally odd finite-order character `χ` of `G_F` and every rational prime `p`, including `p = 2`, the end theorem is

```text
L_p^{(r)}(χω, 0) / r!  =  L(χ, 0) · ∏_{𝔮 ∈ R′} (1 − χ(𝔮)) · R_p(χ),
R = {𝔮 | p : χ(𝔮) = 1},   R′ = {𝔮 | p : χ(𝔮) ≠ 1},   r = #R,
```

where `R_p(χ)` is Gross's signed `p`-adic regulator. The build constructs the odd `p`-unit and divisor components and the regulator (Layer 0), proves the all-prime lower bound `ord_{s=0} L_p(χω, s) ≥ r` through the integral Sczech–Eisenstein cocycle and Spiess's homological vanishing (Layer 0), develops restricted continuous cohomology, the cyclotomic subspace, both orthogonality theorems and Greenberg's cohomological form of the regulator (Layer 1), builds Ventullo's auxiliary family, the Gross–Stark semi-cusp family and its normalized cuspidal projection (Layer 2), identifies the Hecke image in three explicit Artin algebras (Layer 3), constructs the off-diagonal Galois class of the actual Hida representations with its local conditions and second-order bound (Layer 4), and compares determinants to conclude (Layer 5). The rank-`r` coefficient on the left may vanish: the assertion that the order of vanishing is exactly `r` is equivalent to `R_p(χ) ≠ 0`, which is proved here for `r ≤ 1` and is otherwise Gross's open order conjecture.

## Scope and ownership

This roadmap owns:

- the Gross–Stark data `(F, p, χ, H, E, R, R′, r)`, the χ⁻¹-components of the odd `p`-units and of the divisor module above `p`, the rational valuation isomorphism between them, Gross's signed regulator and its coordinate formula, and the normalized analytic invariants of the Deligne–Ribet branch at `s = 0` (Layer 0);
- the integral Sczech–Eisenstein cocycle on `GL_n`, its `ℓ`-smoothing, its cocycle of `p`-adic measures and the resulting integral representation of the smoothed `p`-adic zeta functions of a totally real field, compared with the Deligne–Ribet branch of IntegralIwasawaTheory §6.3 (Layer 0);
- the cap product between group cohomology with dual coefficients and group homology, the flat-module extension of positive-degree homology vanishing, Spiess's edge isomorphism (the degenerate Hochschild–Serre isomorphism in group homology for a normal subgroup with vanishing positive-degree homology), Spiess's homological vanishing and the all-prime lower bound for the order of vanishing, and the separation of the leading-term theorem from Gross's order conjecture (Layer 0);
- restricted continuous cohomology with `E(χ⁻¹)` coefficients, the Kummer description of its dual local condition, both orthogonality theorems, injectivity of the product of exceptional inertia restrictions, the cyclotomic subspace, its dimension, Greenberg's algebraic invariant and its equality with Gross's regulator (Layer 1);
- the weight-one coordinate of the parallel-weight line, the transport of the ordinary Eisenstein families to that coordinate, the products of classical weight-one forms with the shifted weight-zero family, the reversed Eisenstein component at the tame cusps, the degeneracy translates of the two-character Eisenstein series and the basis of the Eisenstein complement of the cusp forms over a totally real field by primitive character pairs and their translates, with Hecke and `U_𝔮` eigenvalues (the case `F = ℚ` is Tau Ceti's in weight at least three and ModularForms §0.1's in weight two), Ventullo's constant-term-one family with the comparison of small-disc families and the family module, the three-case division without an exact-order hypothesis, the Gross–Stark semi-cusp family, the Hecke separation of the ordinary Eisenstein boundary and the normalized cuspidal projection (Layer 2);
- the three Artin algebras, their normal forms and filtrations, the truncated Fourier Hecke orbit, the auxiliary operator `Y` and the three Hecke-image identifications (Layer 3);
- the verification, in this application, of the lattice, finiteness, closedness and continuity hypotheses of the shared Cayley–Hamilton and determinant machinery; the simultaneous good Galois element at every prime above `p`; the upper- and lower-entry extension classes; the infinitesimal cyclotomic characters; the refined diagonal entries; the local comparison coefficients; restricted ramification, inertia generation and the second-order bound (Layer 4);
- the exact determinant before Artin specialization, the graded leading-term comparisons, the inverse-character argument, the rank-zero case, the Gross–Stark theorem, the exact-order criterion and the rank-one consequence (Layer 5).

It leaves to other roadmaps, by section:

- Matrices, determinants, power series, free abelian groups, tensor products, total quotient rings, henselian rings, the finiteness of the class group and Dirichlet's unit theorem: Mathlib, as listed in the supplier contracts. The underlying S-unit group is Mathlib `Set.unit`, with `Set.unitEquivUnitsInteger`; its valuation map, kernel and finite-index image are Tau Ceti `Set.unitValuation`, `Set.unitValuation_ker` and `TauCeti.finiteIndex_range_unitValuation`. Layer 0 owns their minus and character specializations and the signed logarithm, rather than a second S-unit or valuation construction. IntegralIwasawaTheory §12.6 owns the smoothed integral Rubin–Stark lattice and its exterior order map; the rational character-space regulator here imposes no smoothing condition and treats every prime above `p`, including nonsplit ones.
- Continuous one-cocycles and the low-degree continuous cohomology carrier, the absolute local Artin map normalized by arithmetic Frobenius, the maps of absolute Galois groups along embeddings of separable closures (the decomposition maps `G_{F_𝔮} → G_F`) and the inertia subgroup of a nonarchimedean local field: Tau Ceti, `TauCeti.ContCohomology.H1`, `TauCeti.ClassFieldTheory.artinMap`, `TauCeti.absoluteGaloisGroupMap` and `TauCeti.inertiaSubgroup`. The cyclotomic unit norm formula is `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit`.
- Group homology, its functoriality and the coinflation map to a quotient group, and Shapiro's lemma: Mathlib, `groupHomology`, `groupHomology.coinfNatTrans` and `groupHomology.indIso`. Degree-zero homology is Mathlib `groupHomology.H0Iso`. Positive-degree vanishing for modules induced from the trivial subgroup and their restrictions is Tau Ceti `groupHomology.isZero_indBot_succ`, `groupHomology.isZero_res_indBot_succ` and `TauCeti.groupHomology.isZero_res_leftRegular_succ`; §0.7 extends this to flat coefficients rather than restating these cases.
- Excellence of complete Noetherian local rings and of their finite-type and localized algebras, regularity of the completion map of a local G-ring, and preservation of reducedness by regular maps: SchemeAndStackFoundations §0.21.
- The cusp–Eisenstein decomposition of elliptic modular forms with character by primitive pairs and their level raises: Tau Ceti in weight at least three (`TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace`), ModularForms §0.1 in weights one and two.
- Local reciprocity conventions, conductors, global reciprocity on the idele class group and the norm theorems and class fields over the CM field `H`: ClassFieldTheory, Layers 7, 11–13.
- Frobenius density and prime selection: Chebotarev, Layer 10.
- Finite-order Hecke `L`-functions of a number field, their functional equation and their nonvanishing on `Re s = 1`: LFunctions, Layers 5 and 7.
- The full cyclotomic character and its procyclic coordinate, the Deligne–Ribet pseudomeasure and its arithmetic interpolation on every branch including the pole branch, the algebraic-number form of Baker–Brumer, the all-prime integral Hilbert cusp geometry and level-one Hasse lifts: IntegralIwasawaTheory, Conventions, §§0.1, 4.2, 6.0, 6.3 and 9.3.
- Finite-index descent and inflation–restriction for rational coefficients, the Kummer sequence for `S`-units, the local Tate pairing with its cup-product sign, Poitou–Tate duality and its lattice and rational forms: ArithmeticGaloisDuality, §§R02.1.3, R02.2.3, R02.3.3, R02.4.2, R02.4.3, D7.6 and D7.7.
- The Iwasawa logarithm on `ℂ_p` and on every finite extension of `ℚ_p`, with `log_p(p) = 0` and the norm law: DirichletPadicLFunctions §0.6.
- Henselian generalized matrix algebras, reducibility ideals, the off-diagonal extension module and its injection, and uniqueness of continuous determinants from Frobenius density: IntegralHeckeAndGaloisDeterminants, §§1.3, 1.4 and 4.1.
- Classical and Λ-adic Hilbert modular forms, their `q`-expansion principle, Hecke and level-changing operators, the ordinary projector, ordinary control, Hecke duality and the fractional ordinary Eisenstein family `E(1, χ)`: NoncommutativeAndEquivariantIwasawa §F.5, presented as Hida families in PadicFamilies §§5.9a–5.13 together with Fourier injectivity at weight one, reducedness at minimal tame level and the total quotient ring of the localized cuspidal Hecke algebra; for `p = 2` and for characters ramified above `p`, the reversed family `E(χ, 1)`, the classical forms of parallel weight one and the products of classical forms through the gaps declared in the supplier contracts.
- The two-character classical Hilbert Eisenstein series `E_k(η, ψ)` of parallel weight `k ≥ 2`, with their coefficients and standard constant terms, and the weight-one series `E_1(1, η)` through the gap declared in the supplier contracts: OrdinaryAutomorphicFormsAndModularityLifting §2.12(a). The Galois representation of a Hilbert Hida family over an arbitrary totally real field with its ordinary local shape: OrdinaryAutomorphicFormsAndModularityLifting §2.12(b), through the gap declared in the supplier contracts. The basis of the Eisenstein complement over a totally real field is a target here (2.2a); it extends the elliptic case named above.

The characteristic polynomial of the endomorphism whose determinant is Gross's regulator is a linear-algebra object here; the conjectural formula of Dasgupta–Spiess for all its coefficients is not a target of this roadmap. The main-conjecture route to the lower bound (Wiles at odd `p`) is not used: the lower bound is proved for every prime by the cocycle route.

## Conventions

- `F` is a totally real number field, `p` a rational prime (including `2`), and algebraic closures `F̄ ⊂ ℂ` and `F̄ ⊂ ℂ_p` are fixed with compatible embeddings. `χ : G_F → F̄^×` is a continuous character of finite order which is totally odd: `χ(c_v) = −1` for the complex conjugation `c_v` at every real place `v`. Its fixed field `H = F̄^{ker χ}` is a cyclic CM extension of `F` with `G = Gal(H/F)`, on which `χ` is faithful; `c ∈ G` is the complex conjugation of `H`. `E/ℚ_p` is a finite extension containing the values of `χ`; it has characteristic zero for every `p`, so `|G|` and `2` are invertible in `E`.
- For a finite prime `𝔮` of `F`, `χ(𝔮) = χ(Frob_𝔮)` with arithmetic Frobenius when `𝔮` is unramified in `H`, and `χ(𝔮) = 0` when it is ramified. `R = {𝔮 | p : χ(𝔮) = 1}`, `R′` the other primes above `p`, `r = #R`. Order `R` as `𝔮_1, …, 𝔮_r` and fix one prime `𝔓_i` of `H` above each `𝔮_i`.
- `U = 𝒪_H[1/p]^×` is written additively after `Additive`; `X` is the free abelian group on the primes of `H` above `p`. A superscript minus is the `c = −1` eigenspace. All χ-components are χ⁻¹-eigenspaces after tensoring with `E`: `U_χ = {u ∈ U^- ⊗ E : σu = χ⁻¹(σ)u}` and similarly `X_χ`. The character projector `e_χ = |G|⁻¹ ∑_g χ(g) g` acts on the rationalized modules only; no integral minus idempotent is used at `p = 2`.
- `log_p` is the Iwasawa logarithm of DirichletPadicLFunctions §0.6, with `log_p(p) = 0`. For a prime `𝔓` of `H` above `p`, `ord_𝔓` is the normalized valuation and `ℓ_𝔓 = log_p ∘ N_{H_𝔓/ℚ_p}` is the **unsigned** local logarithm. Gross's signed map uses `−ℓ_𝔓`.
- **Reciprocity.** Write `Art_K = TauCeti.ClassFieldTheory.artinMap K`, normalized so that a uniformizer maps to arithmetic Frobenius, and put `rec_K(x) = Art_K(x⁻¹)`. Then `rec_K(ϖ⁻¹)` is arithmetic Frobenius and, for `K/ℚ_p` finite, `ε_cyc(rec_K(x)) = N_{K/ℚ_p}(x) · p^{−v_p(N_{K/ℚ_p} x)}`; in particular the cyclotomic character of `rec_K(u)` is `N_{K/ℚ_p}(u)` on units, and `log_p ε_cyc(rec_K(x)) = ℓ(x)` for every `x ∈ K^×`. This is the convention of Dasgupta–Kakde–Ventullo; it is the Tau Ceti map precomposed with inversion. Witness: over `ℚ_5`, `rec(2)` sends `ζ_5` to `ζ_5^2` while `Art(2)` sends it to `ζ_5^3`; over `ℚ_2`, `Art(2)` sends a fifth root of unity `ζ` to `ζ^2` (Tau Ceti's `localArtinMap_Q2_zeta5`) and `rec(2)` sends it to `ζ^3`.
- `ω` is the Teichmüller character, with values in `μ_{p−1}` for odd `p` and in `{±1}` for `p = 2`; `⟨x⟩ = x/ω(x)` lies in `1 + pℤ_p`, respectively `1 + 4ℤ_2`. `f_χ(s) = L_p(χω, s)` is the Deligne–Ribet branch with `f_χ(n) = L^*(χω^n, n)` for integers `n ≤ 0`, where `L^*(η, s) = L(η, s) ∏_{𝔮|p}(1 − η(𝔮) N𝔮^{−s})`. It is analytic at `s = 0` for every `χ`, including `χ = ω⁻¹`, where its only possible pole is at `s = 1`. `D_χ = L(χ, 0) ∏_{𝔮∈R′}(1 − χ(𝔮)) ≠ 0`; `s_χ = ord_{s=0} f_χ`; `L_an(χ) = f_χ^{(r)}(0)/(r! D_χ)` and `L^*_an(χ) = f_χ^{(s_χ)}(0)/(s_χ! D_χ)`.
- For `r ≥ 1`: `Λ = 𝒪_E[[T]]`, `ν_k(T) = u^{k−1} − 1` with `u = 1 + p` for odd `p` and `u = 5` for `p = 2`; `Λ_(1)` is the localization at `(T)`, a discrete valuation ring containing `E` with uniformizer `π = T/log_p(u)`. The Λ-adic topology (from `(ϖ_E, T)`), the topology of `Λ_(1)` and the maximal-ideal topology of a completion are kept distinct: Galois continuity always refers to the Λ-adic topology on finite Λ-modules.
- Continuous `H¹` is the cocycle quotient `TauCeti.ContCohomology.H1` with the `p`-adic vector topology on finite-dimensional `E`-coefficients; coefficients are never given the discrete topology. For the action `χ⁻¹`, a cocycle satisfies `κ(gh) = κ(g) + χ⁻¹(g) κ(h)` and coboundaries are `g ↦ (χ⁻¹(g) − 1) v`.
- In §0.7, `k` is an arbitrary commutative ring and `G` an arbitrary group in a common universe; `A : Rep k G` is Mathlib's representation carrier. The edge theorem assumes a normal subgroup and vanishing of its positive-degree homology, with no finiteness, commutativity or topological assumption on the group.
- Determinants of empty matrices are `1`. Artin algebras and family constructions are used only for `r ≥ 1`; rank zero is proved by interpolation.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib: `Matrix.det` (square matrices over a commutative ring, empty determinant `1`), `Matrix.det_mul`, `Matrix.det_nonsing_inv`, `LinearMap.det` and `LinearMap.det_toMatrix` (on a finite-dimensional `E`-space it is the determinant of any matrix of the endomorphism), `Set.unit` and `Set.unitEquivUnitsInteger` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`, S-units as a subgroup of the field units and their identification with units of S-integers), `FreeAbelianGroup` (the divisor module `X`), `TensorProduct` (with `Additive U` for the multiplicative `p`-units), `NumberField.RingOfIntegers.instFintypeClassGroup` (finiteness of the class group, `Mathlib/NumberTheory/NumberField/ClassNumber.lean`), `NumberField.Units.finrank_eq` (`finrank ℤ (Additive (𝓞 K)ˣ) = NumberField.Units.rank K`, `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`), `NumberField.IsTotallyReal` and `NumberField.IsCMField`, `PowerSeries.X`, `PowerSeries.coeff` and `PowerSeries.order` (the order is `⊤` for the zero series; it is the least nonzero coefficient degree, not an analytic notion), `PowerSeries.exists_isWeierstrassDivision` and `PowerSeries.exists_isWeierstrassFactorization` (`Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean`: division by, and factorization of, a power series over a complete local ring whose image in the residue field is nonzero), `HenselianRing` with `IsAdicComplete.henselianRing`, `FractionRing` (the total quotient localization of an arbitrary commutative ring; a field only for domains) and `IsReduced`. For group homology (`Mathlib/RepresentationTheory/Homological/GroupHomology/`): `groupHomology A n` for `A : Rep k G` over a commutative ring `k`, computed by any projective resolution of the trivial representation (`groupHomologyIso`); `groupHomology.map` and the coinflation transformation `groupHomology.coinfNatTrans k S n` (`Functoriality.lean`), whose component at `A` is the map `Hₙ(G, A) ⟶ Hₙ(G ⧸ S, A_S)` induced by `G →* G ⧸ S` and `A → A_S` for a normal subgroup `S`; `Rep.res` (restriction along a group homomorphism, `Rep/Res.lean`); Shapiro's lemma `groupHomology.indIso` (`Shapiro.lean`), `Hₙ(G, Ind_S^G A) ≅ Hₙ(S, A)`; `groupHomology.H0Iso` (`LowDegree.lean`), identifying degree-zero homology with coinvariants; and `isZero_groupHomology_succ_of_subsingleton` (`Basic.lean`), vanishing in positive degrees for a trivial group. Mathlib has no Hochschild–Serre spectral sequence and no edge isomorphism beyond the degree-one exact sequence `groupHomology.H1CoresCoinf`. Nothing beyond these definitions and their stated lemmas is assumed.

### From Tau Ceti

At the pinned Tau Ceti:

- `Set.unitValuation`, `Set.unitValuation_ker` and `Set.unit_fg_of_units` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`), and `TauCeti.finiteIndex_range_unitValuation` (`…/SInteger/Rank.lean`): the valuation map of S-units, its ordinary-unit kernel, finite generation for finite S when the base units are finitely generated, and finite index of its image for finite S and finite class group. The native multiplicative valuation has exponent equal to the negative normalized additive order; Layer 0 uses additive orders.

- `groupHomology.isZero_indBot_succ`, `groupHomology.isZero_res_indBot_succ` and `TauCeti.groupHomology.isZero_res_leftRegular_succ` (`TauCeti/RepresentationTheory/Homological/GroupHomology/Induced.lean`): over any commutative ring, positive-degree homology vanishes for a module induced from the trivial subgroup, its restriction to any subgroup, and the restricted left regular representation. These supply the induced and free cases in §0.7 and its proof route.

- `TauCeti.ContCohomology.H1` and `TauCeti.ContCohomology.H1EquivOfSmulEqSelf` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`): `H¹` is the additive quotient of continuous one-cocycles by coboundaries; for a trivial action it is identified with continuous homomorphisms to the coefficient group. The `E`-linear structure on `H¹` with finite-dimensional `E`-coefficients is induced by functoriality in the coefficients (Layer 1); the inherited quotient topology is not used.
- `TauCeti.ClassFieldTheory.artinMap` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`): the absolute local Artin map of a nonarchimedean local field into the topological abelianization of its absolute Galois group, normalized by arithmetic Frobenius, with `continuous_artinMap`, `denseRange_artinMap` and the norm functoriality `artinMap_norm`; `localArtinMap_Q2_zeta5` (`…/Local/Cyclotomic.lean`) pins the normalization. `TauCeti.ClassFieldTheory.localCyclotomicCharacter_artinMap_unit` (`TauCeti/NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean`) gives `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` for a finite extension `K/ℚ_p` and a local unit `u`; the norm comparison for Artin symbols is `TauCeti.ClassFieldTheory.abelianizedLocalCyclotomicCharacter_artinMap_norm` (`…/Local/Cyclotomic.lean`).
- `TauCeti.absoluteGaloisGroupMap` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Map.lean`): for an extension `L/K` and a `K`-embedding `τ` of separable closures, the continuous homomorphism `G_L → G_K`; with `L = F_𝔮` and `K = F` it is the decomposition map `G_{F_𝔮} → G_F`, and `TauCeti/NumberTheory/NumberField/LocalGlobal/AbsoluteGaloisGroup.lean` identifies the decomposition groups of finite Galois subextensions with restrictions of its image. `TauCeti.inertiaSubgroup` (`TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean`): the inertia subgroup of the absolute Galois group of a nonarchimedean local field, closed and normal, the fixing subgroup of the maximal unramified extension inside an algebraic closure (which is also a separable closure, the fields here having characteristic zero); `TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_artinMap` (`TauCeti/NumberTheory/ClassFieldTheory/Local/Unramified.lean`): a lift of the Artin symbol of a unit lies in the inertia subgroup.
- `TauCeti.EisensteinSeries.CharIndex` (`TauCeti/NumberTheory/ModularForms/EisensteinSeries/Subspace.lean`): triples of primitive Dirichlet characters `ψ` modulo `u`, `φ` modulo `v` of parity `(−1)^k` and `t ≥ 1` with `tuv | N`; `TauCeti.EisensteinSeries.CharIndex.linearIndependent_inCharSpace` (`…/Independence.lean`) and `TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace` (`…/Dimension.lean`): in weight `k ≥ 3` the raised series `E_k^{ψ,φ,t}` of nebentypus `χ` are linearly independent and span a complement of the cusp forms in `M_k(N, χ)`. This is the case `F = ℚ`, `k ≥ 3` of 2.2a.

### From TauCetiRoadmap.ClassFieldTheory

Layer 7 (absolute local Artin map, normalizations and conductors): arithmetic-Frobenius normalization, `χ_cyc(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` on units (Layer 7, cyclotomic normalization), the unit–inertia and uniformizer–unramified identifications and norm compatibility, at every prime including `2`. Layer 11 (global class formation and global Artin reciprocity): the global Artin map on the idele class group, triviality on principal ideles and the product of local symbols. Layers 12–13: the finite-order character / ray-class correspondence, the Hilbert class field of `H` as the maximal unramified abelian extension, and the restriction and norm identifications for `S`-units.

### From TauCetiRoadmap.Chebotarev

Layer 10, `hasDirichletDensity_frobeniusPrimeSet`: every conjugacy class of a finite Galois group is the Frobenius class of a set of primes of positive density, avoiding any finite set. It supplies the auxiliary smoothing prime of degree one, a prime with `χ(𝔮) ≠ 1`, primes separating distinct finite-character Eisenstein eigensystems, and Frobenius density in `G_{F,S}` for the trace arguments. Integrality and congruence extension use the separate closedness statements of Layer 4, never density alone.

### From TauCetiRoadmap.LFunctions

Layer 5: the finite-order Hecke `L`-function of a ray class character of `F`, its meromorphic continuation, functional equation and primitive/imprimitive Euler-factor comparison; the carrier is Tau Ceti's presented continuation `TauCeti.LFunctions.heckeLFunctionC` (`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean`), defined for every number field and equal to `0` when no continuation exists, so the continuation itself is a Layer 5 theorem. Layer 7: nonvanishing on `Re s = 1`. With the functional equation, a totally odd `χ` has `L(χ, 0) ≠ 0`, since the archimedean factors at `s = 0` are regular and nonzero for odd characters and `L(χ⁻¹, 1) ≠ 0`.

### From TauCetiRoadmap.ModularForms

§0.1: the character Eisenstein series of weights one and two for primitive characters `ψ` modulo `u`, `φ` modulo `v` and `t` with `tuv | N`, the corrected series `E_2(z) − tE_2(tz)` for `1 < t | N` in place of the nonholomorphic `E_2`, and the decomposition `M_k(N, χ) = S_k(N, χ) ⊕ E_k(N, χ)` in these weights. Only the weight-two case over `ℚ` of 2.2a is taken from it.

### From TauCetiRoadmap.IntegralIwasawaTheory

- Conventions and §0.1 (`kappaFull_spec`, `teichmullerFull`): the full cyclotomic character `κ = ε_cyc` on `G_F`, its principal-unit projection and the procyclic coordinate, with its distinct dyadic sign.
- §4.2: `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers`, the algebraic-number form of Baker–Brumer: `p`-adic logarithms of algebraic numbers that are linearly independent over `ℚ` are linearly independent over the algebraic closure of `ℚ` in `ℂ_p`.
- §6.0: `totallyRealHeckeValue_rational` (Siegel–Klingen rationality), `deligneRibetPseudomeasure` on the narrow ray tower and `deligneRibet_distributionCongruences`, at every prime.
- §6.3: `deligneRibet_arithmeticInterpolation` and `deligneRibet_characterNumerator`: for an even finite-order character `ψ` the branch is `G_{ψ,S}(T)/H_ψ(T)`, with `H_ψ = 1` except on a type-W branch, and interpolates `L_S(1 − r, ψω^{−r})`. With `ψ = χω` and `S` the primes above `p` this is `f_χ`; its only possible pole is at `s = 1`, so `f_χ` is analytic at `s = 0`.
- §9.3: `hilbertCuspGeometry` (integral Hilbert compactifications and `q`-expansions at the `p`-unramified cusps, for every `p`) and `hilbertHasseLift` (level-one forms with every cusp expansion congruent to `1` modulo `p^m`, in weights divisible by `(p−1)p^{N₀}`, including `p = 2`).

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.1.3 (rationalisation of lattice cohomology); §R02.2.3 (restriction and corestriction descent for finite index, valid for lattice and rational continuous coefficients, and inflation–restriction for compact and rational coefficients); §R02.3.3 (the Kummer sequence for `S`-units, with its Picard-group term); §R02.4.2 (the local Tate pairing, with the dual argument first, and the sign of swapping the cup product in degree `(1,1)`); §R02.4.3 (Poitou–Tate duality); §D7.6 (Poitou–Tate for lattices and rational coefficients, limits taken before rationalization, with the real-place correction at `p = 2` vanishing after inverting `p`); §D7.7 (dual local conditions). Finite-dimensional `E`-vector spaces are finite-dimensional `ℚ_p`-spaces with a commuting `E`-action; all statements are applied coordinatewise after choosing a basis, and the `E`-linear forms follow by functoriality.

### From TauCetiRoadmap.DirichletPadicLFunctions

§0.6: `HasIwasawaDecomposition`, `IsIwasawaLog`, `iwasawaLog` on `ℂ_p` and `localIwasawaLog` on every finite extension of `ℚ_p` (`existsUnique_isIwasawaLog_of_finiteDimensional`), with value `0` at `p` and on roots of unity, the product law on nonzero elements, Galois equivariance and the norm comparison; the angular coordinate on `1 + pℤ_p` (respectively `1 + 4ℤ_2`) with generator `u`.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§1.3: henselian lifting of matrix units and the multiplicity-free generalized matrix algebra structure of a Cayley–Hamilton algebra over a henselian local ring. §1.4: partition reducibility ideals, the GMA extension module, the extension identification and the off-diagonal extension injection, with `d!` invertible (here `d = 2` and the residue field `E` has characteristic zero). §4.1: `Determinant.eq_of_charpoly_frobenius`, uniqueness of a continuous determinant from its characteristic polynomials on a conjugacy-dense set, with Hausdorff coefficients. These are used on the actual representations of Layer 4, whose lattice and finiteness hypotheses are verified there.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.21: `excellent_examples` (complete Noetherian local rings, and finite-type and localized algebras over them, are excellent, hence quasi-excellent and G-rings) and `regular_map_completion` (a regular ring map between Noetherian rings carries a reduced source to a reduced target, and for a local G-ring `A` the completion map `A → Â` is regular), on the carriers `TauCeti.Excellence.IsGRing` and `TauCeti.Excellence.RegularAlgebraMap`. They are used only in 4.1, to pass reducedness from the localized Hecke algebra to its completion.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

§F.5: `hilbertForms`, `hilbertCuspForms`, `hilbertQExpansion`, both integral lattices and the normalized ideal-coefficient dictionary for every totally real field; the `q`-expansion principle; the Hecke and level-dividing operators and change-of-level maps; `hilbertCoefficientFamily` (`M`, `M′`, `S` with standard constants on every narrow-class component), the ordinary projector `e`, ordinary control, the Hecke images `T̃ → T` and their pairings, and the fractional ordinary Eisenstein family `ℰ(1, χ)`, written `E(1, χ)` here, with its denominator ideal. These are stated for odd `p` and for a character `χ` whose conductor `𝔫` is prime to `p`, with weight-`k` specializations of level `𝔫∏_{𝔮|p}𝔮` and character `χω^{1−k}`, and the classical form spaces for parallel weight `k ≥ 2`. §F.5 constructs neither the reversed family `E(χ, 1)`, nor classical forms of parallel weight one, nor products of classical forms; these are the gaps below.

What NoncommutativeAndEquivariantIwasawa must provide (gap:reversed-ordinary-eisenstein-family): for odd `p` and a totally odd finite-order `χ` of conductor `𝔫` prime to `p` with `χ(𝔮) = 1` for every `𝔮 | p`, the reversed ordinary Eisenstein family `E(χ, 1) ∈ M(𝔫, χ) ⊗_Λ Frac(Λ)`, regular at every integer `k ≥ 1`, whose weight-`k` specialization for `k ≥ 2` is the ordinary member `E_k(χ, ω^{1−k})` of the pair `(χ, ω^{1−k})` (second character with modulus divisible by every prime above `p`), with `T_𝔩`-eigenvalue `χ(𝔩) + ε(𝔩)` for `𝔩 ∤ 𝔫p`, `U_𝔩`-eigenvalue `ε(𝔩)` for `𝔩 | 𝔫` and `1` for `𝔮 | p`, weight-one specialization `E_1(1, χ_S)`, and standard constants `0` when `𝔫 ≠ 1` and `2^{−[F:ℚ]}χ⁻¹(λ)ℒ_{χ⁻¹}` at the component `λ` when `𝔫 = 1` (Dasgupta–Kakde–Ventullo §3.1, p. 847, and (30), p. 849; Dasgupta–Darmon–Pollack Proposition 2.1, (48)–(49), p. 459).

What NoncommutativeAndEquivariantIwasawa must provide (gap:weight-one-hilbert-forms-and-products): the §F.5 classical Hilbert form spaces `hilbertForms` with `hilbertQExpansion` at every cusp of every narrow-class component, their normalized ideal coefficients and standard constants, the `q`-expansion principle and the Hecke and level-dividing operators also in parallel weight one; and, for parallel weights `k, k′ ≥ 1`, the multiplication `M_k(𝔟, η) × M_{k′}(𝔠, ψ) → M_{k+k′}(lcm(𝔟, 𝔠), ηψ)` of classical forms, compatible with the slash action, whose expansion at every cusp of every component is the product of the two expansions, so that standard constants multiply.

What NoncommutativeAndEquivariantIwasawa must provide (gap:dyadic-hilbert-coefficient-families): the §F.5 coefficient families, ordinary projector, ordinary control, Hecke images and fractional ordinary Eisenstein families `E(1,χ)` and `E(χ,1)` also for `p = 2`, with `Λ = 𝒪[[T]]`, `u = 5`, `ν_k(T) = u^{k−1} − 1`, the character `χω^{1−k}` for `ω` with values in `{±1}`, and the dyadic level and standard-constant conventions of Dasgupta–Kakde–Ventullo §3.1.

What NoncommutativeAndEquivariantIwasawa must provide (gap:p-ramified-hilbert-coefficient-families): for every prime `p` (with the dyadic conventions of the preceding gap at `p = 2`) and every totally odd finite-order `χ` whose conductor `𝔫𝔣_p` has a nontrivial part `𝔣_p` supported above `p` and prime-to-`p` part `𝔫` (the tame level), including `χ = ω⁻¹` at tame level `1`, the §F.5 coefficient families `M`, `M′`, `S` with weight-`k` specializations of level `𝔫·lcm(𝔣_p, ∏_{𝔮|p}𝔮)` and character `χω^{1−k}` (the finite character above `p` retained), the operators `T_𝔩` for `𝔩 ∤ 𝔫p` and `U_𝔮` for `𝔮 | 𝔫p`, the ordinary projector, ordinary control, finite freeness of `M°` and `M′°`, Hecke images and pairings, and the ordinary Eisenstein family `E(1, χ)` with `T_𝔩`-eigenvalue `1 + χε(𝔩)`, `U_𝔮`-eigenvalue `1` at every `𝔮 | p` and standard constants `2^{−[F:ℚ]}L_p(χω, 1 − k)` (Dasgupta–Kakde–Ventullo §3.1, (25)–(27), where `𝔫` denotes the full conductor of `χ`).

### From TauCetiRoadmap.PadicFamilies

§§5.9a–5.10: the presentation of §F.5 as Hida families `M°(𝔫, χ)`, `S°(𝔫, χ)`, the Hecke algebras `T̃` and `T` generated by `T_𝔩` (`𝔩 ∤ 𝔫p`) and `U_𝔮` (`𝔮 | 𝔫p`), and extensionality by normalized coefficients and standard constants. §5.11: injectivity of the Fourier map `S°(𝔫,χ)_(1) → ∏_𝔞 Λ_(1)`. §5.12: reducedness of the localization `T_(𝔪)` at the Eisenstein height-one prime when the conductor of `χ` equals the tame level. §5.13: `T_(𝔪) ↪ L = ∏_i L_{H_i}`, a finite product of fields attached to cuspidal eigenfamilies `H_i` specializing to `E_1(1, χ_S)`. These are stated for odd `p` and for `χ` of conductor prime to `p`, §§5.12–5.13 when that conductor equals the tame level.

What PadicFamilies must provide (gap:dyadic-hilbert-hida-localization): the statements of §§5.10–5.13 (Fourier injectivity on `S°(𝔫,χ)_(1)`, reducedness of `T_(𝔪)` at minimal tame level, and the total quotient ring as a product of eigenfamily fields with the congruences to `E_1(1, χ_S)`) also for `p = 2`, on the dyadic families of NoncommutativeAndEquivariantIwasawa §F.5.

What PadicFamilies must provide (gap:p-ramified-hilbert-hida-localization): the statements of §§5.10–5.13 (the Hida-family presentation, Fourier injectivity on `S°(𝔫,χ)_(1)`, reducedness of `T_(𝔪)` when the prime-to-`p` part of the conductor of `χ` equals the tame level `𝔫`, and the total quotient ring as a product of eigenfamily fields `L_{H_i}` with `c(𝔩, H_i) ≡ 1 + χ(𝔩)` for `𝔩 ∤ 𝔫p` and `c(𝔮, H_i) ≡ 1` for `𝔮 | 𝔫p` modulo `𝔪_{H_i}`) on the families of gap:p-ramified-hilbert-coefficient-families, for every prime `p`.

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLifting

§2.12(a): the two-character classical Hilbert Eisenstein series `E_k(η, ψ)` of parallel weight `k ≥ 2`, for narrow ray class characters `η`, `ψ` of moduli `𝔞`, `𝔟` (possibly imprimitive) whose signs at the real places add to the parity of `k`, of level `𝔞𝔟` and nebentypus `ηψ`, with normalized coefficients `∑_{𝔯 | 𝔪} η(𝔪𝔯⁻¹) ψ(𝔯) N𝔯^{k−1}`, Dirichlet series `L(η, s) L(ψ, s − k + 1)` and normalized constant terms `2^{−[F:ℚ]} η(t_λ)⁻¹ L_{𝔞𝔟}(η⁻¹ψ, 1 − k)` when `𝔞 = 1` and `0` otherwise, excluding only the pairs with `F = ℚ`, `k = 2`, `𝔟 = 1` and `η` trivial on the ideals prime to `𝔞`; together with Dasgupta–Kakde–Ventullo §3.1, (25)–(27), these give the Fourier and constant-term formulas used in Layer 2. That section states no decomposition of a form into a cusp form and Eisenstein series; the decomposition is 2.2a here. §2.12(b): the Hilbert Hida family over an arbitrary totally real field with its arithmetic specializations, its determinant and its ordinary local Galois shape, stated there for odd `p` and for the determinant of the Newton–Thorne weight change. That section states no series of parallel weight one.

What OrdinaryAutomorphicFormsAndModularityLifting must provide (gap:weight-one-hilbert-eisenstein-series): for every totally real `F` and every totally odd narrow ray class character `η` of modulus `𝔟` (possibly imprimitive), the holomorphic Hilbert modular form `E_1(1, η)` of parallel weight one, level `𝔟` and character `η`, in the weight-one spaces of gap:weight-one-hilbert-forms-and-products, defined as the value at `s = 0` of Hecke's regularized series, with normalized coefficients `c(𝔪, E_1(1, η)) = ∑_{𝔯 | 𝔪, (𝔯, 𝔟) = 1} η(𝔯)` and standard constants `2^{−[F:ℚ]}L_𝔟(η, 0)` when `𝔟 ≠ 1` and `2^{−[F:ℚ]}(L(η, 0) + η⁻¹(λ)L(η⁻¹, 0))` at the component `λ` when `𝔟 = 1` (Dasgupta–Darmon–Pollack Proposition 2.1, (48), (50) and (51), pp. 459–460, which covers `k = 1`; Dasgupta–Kakde–Ventullo §3.1, p. 847, and footnote 6).

What OrdinaryAutomorphicFormsAndModularityLifting must provide (gap:hida-family-representations-all-degrees): for every totally real `F` of any degree and every prime `p` including `2`, and every cuspidal eigenfamily `H` of PadicFamilies §5.13 with coefficient field `L_H`, including those on the families of gap:dyadic-hilbert-hida-localization and gap:p-ramified-hilbert-hida-localization (whose character `χ` may be ramified at primes above `p`), a continuous irreducible representation `ρ_H : G_F → GL_2(L_H)`, where `L_H` carries the Λ-adic topology (that of the maximal ideal `(ϖ_E, T)` of `Λ`), unramified outside `𝔫p`, with characteristic polynomial `X² − c(𝔩, H)X + χε(𝔩)` at `Frob_𝔩` for `𝔩 ∤ 𝔫p`, and at each `𝔮 | p` the ordinary shape `[[χεη_{𝔮,H}⁻¹, ∗], [0, η_{𝔮,H}]]` on `G_𝔮` with `η_{𝔮,H} : G_𝔮 → Λ_H^×` unramified and `η_{𝔮,H}(rec(ϖ⁻¹)) = c(𝔮, H)` (Dasgupta–Kakde–Ventullo Theorem 4.1, pp. 857–858, after Hida and Wiles).

## How to read the build

Layer 0 fixes the arithmetic data and conventions, builds the regulator and the analytic invariants, constructs the integral Eisenstein cocycle and its measures, and proves the all-prime lower bound for the order of vanishing. Layer 1 turns the regulator into cohomology: restricted classes, orthogonality, inertia injectivity and the cyclotomic subspace, ending with Greenberg's formula for the regulator. Layer 2 builds the Hida families at weight one: the weight coordinate, Ventullo's family, the semi-cusp family and its normalized cuspidal projection, after a case division that assumes no exact order. Layer 3 computes the Hecke action on that cusp form and identifies its image with one of three explicit Artin algebras. Layer 4 passes to the actual family representations and constructs the off-diagonal class with its local conditions. Layer 5 compares the arithmetic determinant with the Artin algebra relations and concludes. Rank zero uses only Layer 0.

## Layer 0: arithmetic data, the regulator and the lower bound

### 0.1 Gross–Stark data

Define the Gross–Stark data as the tuple consisting of a totally real `F`, a rational prime `p`, the fixed embeddings, a totally odd continuous finite-order character `χ : G_F → F̄^×`, its fixed field `H`, `G = Gal(H/F)`, and a finite extension `E/ℚ_p` containing the embedded values of `χ`, together with the partition of the primes of `F` above `p` into `R = {𝔮 : χ(𝔮) = 1}` and `R′`, and `r = #R`. Prove that `H/F` is cyclic and CM, that `χ` is faithful on `G`, that complex conjugation of `H` is the unique `c ∈ G` with `χ(c) = −1` arising from a real place, and that for `𝔮 | p` membership in `R` is equivalent to complete splitting of `𝔮` in `H` (Dasgupta–Kakde–Ventullo §1, pp. 834–836). The route: the finite image of `χ` is cyclic; total oddness makes the fixed field of `⟨c⟩` totally real and `H` totally imaginary; faithfulness identifies `χ(Frob_𝔮) = 1` with trivial decomposition group. *Needs:* ClassFieldTheory Layers 7 and 12–13; Mathlib `NumberField.IsTotallyReal`, `NumberField.IsCMField`.

The API includes:

- The exceptional set `R` is the finite set of primes above `p` that are unramified in `H` with `χ(𝔮) = 1`; `r` is its cardinality.
- Replacing `χ` by `χ⁻¹` leaves `H`, `R`, `R′` and `r` unchanged, and replaces `D_χ` by `D_{χ⁻¹}`.
- For `𝔮 | p`, `𝔮 ∈ R` if and only if `𝔮` splits completely in `H`.
- Enlarging `E` to `E′` transports `χ` and preserves `R` and `r`, compatibly with composition of extensions.

**Checks.**

- For `F = ℚ`, `H = ℚ(i)` and `χ` the odd quadratic character of conductor `4`, at `p = 2` the prime is ramified: `χ(2) = 0`, `R = ∅`, `r = 0`. A convention putting ramified primes into `R` would give `r = 1`.
- In the same field at `p = 5`, `5 = (2+i)(2−i)` splits and `χ(5) = 1`: `R = {(5)}`, `r = 1`.
- In the same field at `p = 3`, `χ(3) = −1`: `R = ∅` and `R′ = {(3)}`; counting every prime above `p` as exceptional would give `r = 1` and a false trivial zero.
- For a nontrivial totally even `χ` the set `R` is still defined, but `H` is totally real, has no complex conjugation, and `L(χ, 0) = 0` because the archimedean factors have poles at `s = 0`; the totally odd hypothesis is needed both for the minus parts and for `D_χ ≠ 0`.

### 0.2 Odd p-units and divisor components

Let `S_H` be the primes of `H` above `p` and use Mathlib `U = Set.unit S_H H`, identified with `𝒪_H[1/p]^×` through `Set.unitEquivUnitsInteger`. Define `X = ⊕_{𝔓|p} ℤ·[𝔓]` with their `G`-actions, the minus parts `U^- = {u : c·u = −u}` (multiplicatively `c(u) = u⁻¹`) and `X^-`, and the χ-components `U_χ ⊆ U^- ⊗_ℤ E` and `X_χ ⊆ X^- ⊗_ℤ E` as the χ⁻¹-eigenspaces. Write `o_p(u) = (ord_𝔓 u)_𝔓` for the additive-order form of the supplied `Set.unitValuation`, and define Gross's signed logarithm map `ℓ_p(u) = (−ℓ_𝔓(u))_𝔓`, extended `E`-linearly; both are `G`-equivariant and restrict to maps `o_p^χ, ℓ_p^χ : U_χ → X_χ` (Dasgupta–Kakde–Ventullo §1, pp. 835–836; §5.1, p. 865). *Needs:* 0.1; DirichletPadicLFunctions §0.6 (`localIwasawaLog`); Mathlib `Set.unit`, `Set.unitEquivUnitsInteger`, `FreeAbelianGroup`, `TensorProduct`; Tau Ceti `Set.unitValuation`, `Set.unitValuation_ker`.

The API includes:

- The character projector `e_χ = |G|⁻¹ ∑_g χ(g) g` on either rationalized module is idempotent, has image the χ⁻¹-eigenspace and acts as the identity there; its denominators live in `E`.
- The `𝔓`-coordinate of `o_p(u)` is `ord_𝔓(u)` and that of `ℓ_p(u)` is `−log_p N_{H_𝔓/ℚ_p}(u)`; both maps are additive and `G`-equivariant.
- For `E ⊆ E′`, `E′ ⊗_E U_χ` and `E′ ⊗_E X_χ` are the corresponding `E′`-components and both maps commute with these identifications.
- For each `𝔮_i ∈ R`, the vector `x_i = ∑_g χ(g) g[𝔓_i]` lies in `X_χ`, and its `[g𝔓_i]`-coefficient is `χ(g)`.

**Checks.**

- Every root of unity of `H` has zero image under `o_p` and `ℓ_p` (since `log_p` kills roots of unity) and is zero in `U ⊗ E`; a logarithm not normalized by `log_p(p) = 0` would still kill roots of unity but give `ℓ_𝔓(p) ≠ 0` on the `p`-unit `p`.
- At `p = 2` the rational projector `(1 − c)/2` is defined on `U ⊗ E` and `X ⊗ E`; the integral module `U` has no such idempotent, and no statement here uses one.
- For `H = ℚ(i)`, `p = 5`, `u = (2+i)/(2−i)`: `c(u) = u⁻¹`, so `u ∈ U^-`, and since `G = {1, c}` with `χ(c) = −1` it lies in the χ⁻¹-eigenspace. At `𝔓 = (2+i)`, `ord_𝔓(u) = 1` (the supplied multiplicative valuation has exponent `−1`) and the signed logarithm coordinate is `−log_5(u)` under the embedding `H_𝔓 ≅ ℚ_5` with `i ≡ −2 (mod 5)`.
- For `𝔮 ∈ R′` the permutation module on the primes above `𝔮` has zero χ⁻¹-part: its decomposition group `D_𝔮` is nontrivial and `χ` is nontrivial on it by faithfulness, so `e_χ` kills `Ind_{D_𝔮}^G 1`.

### 0.3 Valuation isomorphism and rank

Prove that `o_p : U^- ⊗ ℚ → X^- ⊗ ℚ` is an isomorphism of `ℚ[G]`-modules; consequently `o_p^χ : U_χ → X_χ` is an `E`-linear isomorphism, `dim_E U_χ = dim_E X_χ = r`, and for any `E`-basis `u_1, …, u_r` of `U_χ` the matrix `O = (ord_{𝔓_i}(u_j))` has nonzero determinant. Moreover the χ-projections of the `R_H`-units (units of `𝒪_H` away from the primes above `R`) span `U_χ` (Dasgupta–Kakde–Ventullo §1, (5)–(6), pp. 835–836; §1.1, pp. 837–838). The route: by Dirichlet's unit theorem the units of `H` and of its maximal totally real subfield `H⁺` have equal rank, so ordinary units have zero minus part after tensoring with `ℚ`; this identifies the kernel. The finite-index image theorem `TauCeti.finiteIndex_range_unitValuation`, applied to `S_H`, gives surjectivity after rationalization. Decomposing the permutation modules by decomposition groups gives a one-dimensional χ⁻¹-summand exactly for `𝔮 ∈ R`, spanned by `x_i` of 0.2, and the same divisor argument on the `R_H`-units gives the spanning statement. *Needs:* 0.2; Mathlib `NumberField.Units.finrank_eq`, `NumberField.RingOfIntegers.instFintypeClassGroup`; Tau Ceti `Set.unitValuation_ker`, `TauCeti.finiteIndex_range_unitValuation`.

The isomorphism is of rationalized minus modules, not of the integral groups `U^-` and `X^-`. When `r = 0` both spaces are zero and `o_p^χ` is the unique map between them. In the coordinates `x_i`, the matrix of `o_p^χ` is `O` and the matrix of `ℓ_p^χ` is `−L` with `L = (ℓ_{𝔓_i}(u_j))`, where complete splitting identifies `H_{𝔓_i} = F_{𝔮_i}`.

### 0.4 Gross's p-adic regulator

Define Gross's regulator `R_p(χ) = det_E(ℓ_p^χ ∘ (o_p^χ)⁻¹)`, the determinant of an endomorphism of `X_χ` (Mathlib `LinearMap.det`). Prove that for every choice of primes `𝔓_i | 𝔮_i` and every `E`-basis `(u_j)` of `U_χ`, `R_p(χ) = det(−L)/det(O)` with `O_{ij} = ord_{𝔓_i}(u_j)` and `L_{ij} = log_p N_{F_{𝔮_i}/ℚ_p}(u_j)` (Dasgupta–Kakde–Ventullo §1, the definition preceding Conjecture 2 and (6), p. 836; §1.1, (8), p. 838). The route: in the basis `x_i` of 0.3 the endomorphism has matrix `(−L)O⁻¹`; apply `LinearMap.det_toMatrix`, `Matrix.det_mul` and `Matrix.det_nonsing_inv`. *Needs:* 0.3; Mathlib `LinearMap.det`, `LinearMap.det_toMatrix`, `Matrix.det_mul`, `Matrix.det_nonsing_inv`.

The endomorphism has source and target `X_χ`; the conjugate composite `(o_p^χ)⁻¹ ∘ ℓ_p^χ` on `U_χ` has the same determinant and characteristic polynomial. This regulator differs from Gross's original normalization by `(−1)^r ∏_{𝔮|p} f_𝔮` (Dasgupta–Kakde–Ventullo, footnote 1, p. 836); the normalization here is that of the end theorem.

The API includes:

- The coordinate formula holds for every ordered choice of prime lifts and every unit basis.
- Replacing `(O, L)` by `(OP, LP)` for `P ∈ GL_r(E)` (a change of unit basis) preserves `det(−L)/det O`.
- Replacing `𝔓_i` by `g𝔓_i` multiplies row `i` of both `O` and `L` by the same nonzero `χ(g)`, and permuting the `𝔮_i` permutes the rows of both; the ratio is preserved.
- A field embedding `E → E′` sends `R_p(χ)` to the regulator computed over `E′`.
- When `R = ∅`, `R_p(χ) = 1`.

**Checks.**

- For `0 × 0` matrices the regulator is `1`; a convention giving `0` would contradict the rank-zero theorem of 5.5.
- For `O = (2)` and `L = (3)` over `ℚ_5` the ratio is `−3/2`; the unsigned convention would give `3/2`.
- For `O = diag(2,3)` and `L = diag(5,7)` the ratio is `35/6`; multiplying both on the right by `diag(4,1)` gives `diag(8,3)` and `diag(20,7)`, ratio `140/24 = 35/6`. Multiplying only `L` changes it to `140/6`.
- For `O = I_2` and `L` with two equal rows the regulator is `0`: a singular logarithm matrix is permitted and is the case `s_χ > r` of the end theorem.
- For `H = ℚ(i)`, `p = 5`, `u = (2+i)/(2−i)` and `𝔓 = (2+i)`: `R_5(χ) = −log_5(u)/1`. Choosing `𝔓 = (2−i)` changes both `ord` and `log` of `u` by the factor `χ(c) = −1`, leaving the ratio fixed.

### 0.5 Analytic leading terms

With `f_χ(s) = L_p(χω, s)` from IntegralIwasawaTheory §6.3 and the complex `L(χ, s)` from LFunctions Layer 5, define `L_an(χ) = f_χ^{(r)}(0)/(r! D_χ)`, the order `s_χ = ord_{s=0} f_χ ∈ ℕ`, and the first leading term `L^*_an(χ) = f_χ^{(s_χ)}(0)/(s_χ! D_χ)` (Dasgupta–Kakde–Ventullo §1, (2)–(4), pp. 834–835; p. 837; §1.3, p. 841). Prove that `D_χ ≠ 0`, that `f_χ` is a nonzero analytic germ at `0` (so `s_χ` is finite and `L^*_an(χ) ≠ 0`), and that `ord_{s=0} L^*(χ, s) = r` for the complex `p`-depleted function. The route: `L(χ, 0) ≠ 0` from LFunctions (see the supplier contract); each factor `1 − χ(𝔮)N𝔮^{−s}` with `𝔮 ∈ R` has a simple zero at `0` and the others are nonzero there; `f_χ` takes the nonzero values `L^*(χω^n, n)` at infinitely many `n ≤ 0` accumulating `p`-adically at `0`, so it is not identically zero near `0`. All derivatives use the branch `χω`. *Needs:* 0.1; IntegralIwasawaTheory §§6.0, 6.3; LFunctions Layers 5, 7; Mathlib `PowerSeries.coeff`, `PowerSeries.order`.

The API includes:

- `L_an(χ)` is the coefficient of `s^r` in the Taylor expansion of `f_χ` at `0`, divided by `D_χ`; equivalently `f_χ^{(r)}(0)/(r! D_χ)`.
- If `s_χ > r` then `L_an(χ) = 0`; if `s_χ = r` then `L_an(χ) = L^*_an(χ) ≠ 0`.
- The Taylor coefficients at `0` determine `s_χ` as `PowerSeries.order` of the expansion.
- A compatible change of the embedding `F̄ → ℂ_p` together with a coefficient embedding transports `D_χ`, the Taylor coefficients and both quotients.

**Checks.**

- For a constant germ `f = D ≠ 0` and `r = 0`, the normalized coefficient is `1`.
- For `f(s) = 6Ds²` and `r = 2`, the normalized coefficient is `6`; omitting the factorial gives `12`.
- For `f(s) = Ds³` and `r = 2`, `L_an = 0` while `L^*_an = 1`; the rank-`r` invariant and the first leading term are different objects.
- At `p = 2` the unit `−1` has `ω(−1) = −1`, `⟨−1⟩ = 1` and `log_2⟨−1⟩ = 0`; using `μ_{p−1}` (trivial at `p = 2`) would make `⟨−1⟩ = −1`.
- The Euler factors deleted in `D_χ` are exactly those at `R′`: for `ℚ(i)` and `p = 3`, `D_χ = 2L(χ, 0) = 1` (with `L(χ, 0) = 1/2`), whereas deleting no factor gives `1/2`.

### 0.6 The integral Sczech–Eisenstein cocycle and its measures

For `n ≥ 1` let `Γ = GL_n(ℚ)` act on the polynomial ring `𝒫 = ℚ[X_1, …, X_n]` by `(AP)(X) = P(XA)` and on the set `𝒬` of nonempty finite tuples `Q = (Q_1, …, Q_m)`, of any length `m ≥ 1` independent of `n`, of real linear forms on `ℝ^n`, each nonvanishing on `ℚ^n ∖ {0}`, by `(AQ)(x) = Q(xA)` with `Q(x) = ∏_i Q_i(x)` (Charollois–Dasgupta §1.1, (15)–(16), pp. 8–9; the `Q`-summation requires absolute convergence of every truncated sum over `|Q(x)| < t`). Define `M_ℚ` as the `ℚ`-space of functions `φ(P, Q, v)` on `𝒫 × 𝒬 × (ℚ/ℤ)^n`, linear in `P` and satisfying the distribution relation in `v` for every nonzero integer scaling, with the left `Γ`-action of Charollois–Dasgupta (4)–(5), p. 5. Define Sczech's Eisenstein cocycle `Ψ` by the `Q`-summation of Charollois–Dasgupta (16)–(17), p. 9, and prove that it is a homogeneous `(n−1)`-cocycle representing a nonzero class in `H^{n−1}(Γ, M_ℚ)` (Sczech, *Eisenstein group cocycles for GL_n and values of L-functions*, Theorem 4, restricted to `u = 0`; restated as Charollois–Dasgupta Theorem 1.1, p. 9). For a prime `ℓ` let `Γ_ℓ` be the subgroup of `Γ ∩ GL_n(ℤ_ℓ)` whose first column is divisible by `ℓ` below the diagonal entry; define the smoothed cocycle `Ψ_ℓ^+` and its refinement `Ψ_ℓ` (Charollois–Dasgupta (25), §2) and prove the integrality theorem: `Ψ_ℓ` takes values in the `ℤ[1/ℓ][Γ_ℓ]`-submodule `M_ℓ ⊂ M_ℚ` of distributions with values in `(1/m)ℤ[1/ℓ]`, `m ≥ 1` the length of `Q`, on homogeneous `P` satisfying the integrality condition (10), and `Ψ_ℓ^+` takes values in `(1/2)M_ℓ`, which contains `M_ℓ` (Charollois–Dasgupta Theorem 4, p. 6, proved in §2.7, p. 18).

For a totally real `F` of degree `n`, a conductor `𝔣`, an integral ideal `𝔞` prime to `𝔣` and a prime `𝔠` of norm `ℓ` prime to `𝔣p`, prove the smoothed Sczech evaluation `ζ_{𝔣,𝔠}(𝔞, −k) = ⟨[Ψ_ℓ^+], [Z_{𝔞,𝔣,k,ℓ}]⟩` for every `k ≥ 0` (Charollois–Dasgupta (11), p. 7, and Theorem 3.1, p. 22). Put `Γ_{ℓ,p} = Γ_ℓ ∩ GL_n(ℤ[1/p])` and let `M_p` be the `ℂ_p`-space of functions `α` assigning to each `(Q, v) ∈ 𝒬 × (ℚ/ℤ)^n` a `ℂ_p`-valued measure `α(Q, v)` on `v + ℤ_p^n`, subject to `α(Q, pv)(pU) = α(Q, v)(U)` for every compact open `U`, with the left `Γ_{ℓ,p}`-action `(γα)(Q, v)(U) = α(AQ, Av)(AU)`, where `A = λγ ∈ M_n(ℤ)` for a power `λ` of `p`; such a `λ` exists because `γ` has entries in `ℤ[1/p]`, and the scaling relation makes the action independent of `λ` (Charollois–Dasgupta §4.1, p. 23). For `A ∈ Γ_{ℓ,p}^n`, `Q ∈ 𝒬` and `v ∈ ℚ^n` define the measure `μ_ℓ(A, Q, v)` on `v + ℤ_p^n` by evaluating `Ψ_ℓ` at `P = 1` on the basic compact open sets (Charollois–Dasgupta (61), p. 22), and prove that `μ_ℓ : Γ_{ℓ,p}^n → M_p` is a homogeneous `(n − 1)`-cocycle (Proposition 4.1, p. 23) whose moments recover `Ψ_ℓ` (Theorem 4.2, p. 23). The rational cocycles `Ψ` and `Ψ_ℓ` keep their larger groups `Γ` and `Γ_ℓ`; only the measure cocycle lives on `Γ_{ℓ,p}`. The multiplication matrices, in the chosen basis of the lattice, of the units and of the generators `π_i` used in 0.8 lie in `Γ_{ℓ,p}` (Charollois–Dasgupta §5.2, p. 29). Let `𝒲 = Hom_cts(ℤ_p^×, ℂ_p^×)` be the weight space, an integer `j` being embedded as `x ↦ x^j`. For an integral ideal `𝔞` prime to `𝔣p` and `κ ∈ 𝒲` define the smoothed `p`-adic partial zeta function

```text
ζ_{𝔣,𝔠,p}(𝔞, κ) = κ(N𝔞𝔠)⁻¹ · ∫_{𝒪^*_{p,𝔣}} κ(Nx)⁻¹ dμ_ℓ(A, Q, v),
```

where `𝒪^*_{p,𝔣} = ∏_{𝔮|p} (𝒪_𝔮^× ∩ (1 + 𝔣𝒪_𝔮))`, `(A, Q, v)` are the data attached to `𝔞` and the prime-to-`p` part of `𝔣`, and `N𝔞𝔠 ∈ ℤ_p^×`; prove that it is analytic on `𝒲` and that at `κ = (x ↦ x^{−k})` it equals `ζ^*_{𝔣,𝔠}(𝔞, −k)` for every `k ≥ 0` (Proposition 4.3, (74), p. 26; Theorem 2, p. 3). Its restriction to the characters `x ↦ ⟨x⟩^s`, `s ∈ ℤ_p`, is the principal branch `s ↦ ζ_{𝔣,𝔠,p}(𝔞, ⟨·⟩^s)`, analytic on `ℤ_p`; its value at `s = −k` is taken at `x ↦ x^{−k}ω(x)^k` and is not `ζ^*_{𝔣,𝔠}(𝔞, −k)` in general.

Finally prove the comparison with the Deligne–Ribet branch: with `L_{𝔠,p}(χω, s) = ∑_{𝔞 ∈ G_𝔣} χ(𝔞𝔠) ζ_{𝔣,𝔠,p}(𝔞, ⟨·⟩^s)` over representatives `𝔞` prime to `p` (Charollois–Dasgupta (3), p. 4), which satisfies `L_{𝔠,p}(χω, −k) = L^*(χω^{−k}, −k)(1 − χω^{−k}(𝔠) N𝔠^{1+k})` for `k ≥ 0` (ibid.),

```text
L_{𝔠,p}(χω, s) = (1 − χ(𝔠) N𝔠 ⟨N𝔠⟩^{−s}) · L_p(χω, s)
```

as an identity of meromorphic functions on `ℤ_p`: the left side is analytic, and after clearing the denominator `H_{χω}` of IntegralIwasawaTheory §6.3 both sides are analytic. Both sides interpolate the same values at `s = −k`, `k ≥ 0` (use `χω^{−k}(𝔠) N𝔠^{1+k} = χ(𝔠) N𝔠 ⟨N𝔠⟩^k`), and the negative integers are dense in `ℤ_p`, so they determine an analytic function. The factor is not a unit of the ring of analytic functions on `ℤ_p`: at `s = 1` it is `1 − χω(𝔠)`, which vanishes when `χω = 1`, exactly where `L_p(χω, s)` may have its pole. At `s = 0` it is `1 − χ(𝔠) N𝔠`, never zero because `χ(𝔠)` is a root of unity and `N𝔠 = ℓ ≥ 2`; so it is a unit in the ring of analytic germs at `s = 0`, and `ord_{s=0} L_{𝔠,p}(χω, s) = ord_{s=0} L_p(χω, s)`. *Needs:* IntegralIwasawaTheory §§6.0, 6.3 (the branch and moment separation); Chebotarev Layer 10 (a prime `𝔠` of degree one prime to `𝔣p`); ClassFieldTheory Layer 12 (narrow ray class groups); Mathlib `Matrix`, `MvPolynomial`.

The API includes:

- The `Γ`-action on `M_ℚ` is independent of the integral scaling used to define it, by the distribution relation.
- `Ψ` and `Ψ_ℓ` satisfy the homogeneous cocycle identity; `Ψ_ℓ^+` is the projection of `Ψ_ℓ` to the part invariant under `Q ↦ −Q`.
- For `A ∈ Γ_{ℓ,p}^n` the measures `μ_ℓ(A, Q, v)` are `(1/m)ℤ[1/ℓ]`-valued, hence bounded `p`-adic measures for every `p ≠ ℓ`, and are zero when the matrix of first columns of `A` is singular; `μ_ℓ` is a homogeneous cocycle on `Γ_{ℓ,p}` with values in `M_p`.
- The moment formula: the integral of `P` over `v + ℤ_p^n` against `μ_ℓ(A, Q, v)` is `Ψ_ℓ(A, P, Q, v)`.
- At `κ = (x ↦ x^{−k})`, `k ≥ 0`, the full-weight function `ζ_{𝔣,𝔠,p}(𝔞, κ)` is `ζ^*_{𝔣,𝔠}(𝔞, −k)`; the principal branch at `s = −k` is its value at `x ↦ x^{−k}ω(x)^k`, and the two agree when `ω^k = 1`.
- The smoothed `p`-adic `L`-function is the Deligne–Ribet branch times the explicit factor above, as meromorphic functions on `ℤ_p`; the factor is a unit among analytic germs at `s = 0` and vanishes at `s = 1` exactly when `χω(𝔠) = 1`.

**Checks.**

- For `n = 1` the cocycle is a `0`-cocycle and the evaluation formula reduces to the Bernoulli description of `ζ(−k)` smoothed at `ℓ`: for `F = ℚ`, `𝔣 = 1`, `ℓ = 3`, `k = 0`, `ζ_{1,3}(1, 0) = (1 − 3)ζ(0) = 1`.
- Sczech's unsmoothed `Ψ` has `p`-adically unbounded denominators as `v` varies (Charollois–Dasgupta, p. 7); the integrality theorem is a property of `Ψ_ℓ`, and a measure defined from `Ψ` itself would not be bounded.
- The smoothing factor at `s = 0` for `F = ℚ`, `χ` odd quadratic of conductor `4`, `𝔠 = (3)` is `1 − χ(3)·3 = 1 + 3 = 4`, nonzero; a factor `1 − χ(𝔠)` would vanish when `χ(𝔠) = 1` and destroy the order comparison. At `p = 2` this `χ` is `ω⁻¹`, `⟨3⟩ = −3` and the factor is `1 + 3(−3)^{−s}`: it is `4 ≠ 0` at `s = 0` but `0` at `s = 1`, where `L_2(χω, s)` is the `2`-adic zeta function with its pole. It is a unit among germs at `0`, not on `ℤ_2`.
- Full weight versus principal branch, for `F = ℚ`, `𝔣 = 1`, `p = 3`, `𝔠 = (2)`: at `κ = (x ↦ x^{−1})` the full-weight value is `ζ^*_{1,2}(1, −1) = (1 − 2²)(1 − 3)ζ(−1) = (−3)(−2)(−1/12) = −1/2`. The principal branch vanishes at every `s = −k` with `k` even (`ζ(−k) = 0` for even `k ≥ 2`, and the Euler factor `1 − 3^0` is `0` at `k = 0`), and these points are dense in `ℤ_3`, so it is identically `0`; its value at `s = −1` is `0 ≠ −1/2`. An integrand `⟨Nx⟩^{−s}` would therefore not interpolate `ζ^*_{𝔣,𝔠}(𝔞, −k)`.
- The empty tuple is excluded from `𝒬`: for `n = 1` it has `Q(x) = 1`, every truncation `|Q(x)| < t` with `t > 1` contains all nonzero integers, `∑ 1/|x|` diverges and the bound `(1/m)ℤ[1/ℓ]` has `m = 0`. The one-form tuple `Q = (X_1)` gives the finite truncations `0 < |x| < t`.
- At `p = 2`, `⟨N𝔠⟩` is taken in `1 + 4ℤ_2` with `ω` valued in `{±1}`; using `μ_{p−1}` changes the interpolated characters.
- The domain of the measure cocycle: for `n = 1`, `ℓ = 5` and `p = 3`, `Γ_5` consists of the rationals prime to `5` and `Γ_{5,3} = {±3^j}`; the matrix `(3)` lies in `Γ_{5,3}` and acts on `M_3` through `λ = 1`, and `(3)⁻¹` through `λ = 3`; the matrix `(2)` lies in `Γ_5` but not in `GL_1(ℤ[1/3])`, since no power `λ` of `3` makes `λ · (1/2)` integral, so the rule above does not define the action of `(2)⁻¹` on `M_3`, and a cocycle of measures on all of `Γ_5` is not defined by (61).
- For `n = 2` the single form `Q = (X_1 + √2 X_2)` vanishes on no nonzero rational vector, so it is an element of `𝒬` although it is not an `n`-tuple; the `n`-tuple of forms `Q_i = ∑_j τ_i(w_j^*) X_j` of Charollois–Dasgupta (7), p. 6, is the specialization used for the zeta values, not the definition of `𝒬`.

### 0.7 Cap products and Spiess's homological vanishing

For a group `U` and a `ℂ_p[U]`-module `M`, let `M^∨ = Hom_{ℂ_p}(M, ℂ_p)` with the contragredient action `(uλ)(m) = λ(u⁻¹m)`. Define the cap product `H^q(U, M^∨) × H_q(U, M) → ℂ_p` as the pairing induced by evaluating a homogeneous `q`-cocycle `κ : U^{q+1} → M^∨` on a homogeneous `q`-chain, `⟨κ, [g_0, …, g_q] ⊗ m⟩ = κ(g_0, …, g_q)(m)`; prove that it is balanced over `ℤ[U]`, so that it is defined on `ℤ[U^{q+1}] ⊗_{ℤ[U]} M`, that `⟨δκ, c⟩ = ⟨κ, ∂c⟩`, and hence that it descends to classes; on a chain `∑_g a_g [g] ⊗ f` with one coefficient `f` its value is `∑_g a_g κ(g)(f)` (Charollois–Dasgupta (81), p. 29; Brown, *Cohomology of Groups*, Chapter V §3). Then, for a commutative ring `k`, a group `G`, a normal subgroup `S` of `G`, the augmentation ideal `I ⊂ k[S]` and a `k[G]`-module `M`, prove the two statements of Spiess used in 0.8, where `k = ℂ_p`, `G = U = E_+ × T` and `S = T`:

- vanishing for flat coefficients: if `M` is flat as a `k[S]`-module, then `H_q(S, M) = 0` for every `q > 0` (Charollois–Dasgupta, proof of Theorem 5.1, p. 31, uses the free case; Brown, Chapter III §6, the Tor description). The route: compute group homology as `Tor_q^{k[S]}(k, M)` using a free right `k[S]`-resolution of the trivial module `k`; tensoring this resolution with the flat left module `M` is exact in positive degrees. Projective coefficients satisfy this hypothesis. The induced-module inputs used in the edge-map argument are the Tau Ceti declarations listed in the supplier contracts;
- Spiess's edge isomorphism, `isIso_coinfNatTrans_app_of_isZero_groupHomology_res`: if `H_q(S, M) = 0` for every `q > 0`, then the coinflation map `H_n(G, M) → H_n(G/S, M_S)`, `M_S = M/IM`, induced by the quotient maps `G → G/S` and `M → M_S` (Mathlib `groupHomology.coinfNatTrans`), is an isomorphism for every `n` (Charollois–Dasgupta Theorem 5.1, p. 30, after Spiess, for `G = E_+ × T` with `T` free abelian of finite rank; Brown, Chapter VII §6, for the Hochschild–Serre spectral sequence). The route: let `P_• → k` be a projective resolution over `k[G]` and `Q_• → k` one over `k[G/S]`. Restricted to `S`, `P_•` stays a projective resolution (Mathlib's restriction preserves projectives), so the complex `C_• = (P_• ⊗_k M)_S` of `k[G/S]`-modules has homology `H_•(S, M)`, which is `M_S` in degree `0` and `0` above. In the double complex `Q_• ⊗_{k[G/S]} C_•` the columns `Q_a ⊗_{k[G/S]} C_•` have homology `Q_a ⊗_{k[G/S]} M_S` in degree `0` only, because `Q_a` is projective; the rows `Q_• ⊗_{k[G/S]} C_b` compute `H_•(G/S, (P_b ⊗_k M)_S)`, which vanishes in positive degrees and is `(P_b ⊗_k M)_G` in degree `0`, because `P_b ⊗_k M` is a direct summand of a module induced from the trivial subgroup of `G`, whose `S`-coinvariants are induced from the trivial subgroup of `G/S`. Both augmentations are therefore quasi-isomorphisms, the total complex computes `H_•(G/S, M_S)` and `H_•(G, M)`, and the resulting isomorphism is the coinflation map, both being induced by a `k[G]`-chain map `P_• → Q_•` over `G → G/S` compatible with the augmentations. No spectral sequence is needed; this is the edge map of the Hochschild–Serre spectral sequence.

*Needs:* Mathlib `groupHomology`, `groupHomologyIso` (the carrier and its computation by a projective resolution of the trivial representation), `groupHomology.coinfNatTrans`, `Rep.res`, `groupHomology.indIso`, `groupHomology.H0Iso`, `isZero_groupHomology_succ_of_subsingleton`; Tau Ceti `groupHomology.isZero_indBot_succ`, `groupHomology.isZero_res_indBot_succ` and `TauCeti.groupHomology.isZero_res_leftRegular_succ`.

The API includes:

- The cap product is `ℂ_p`-bilinear, natural in `M` for `ℂ_p[U]`-linear maps (covariant in homology, contravariant in cohomology), and in degree `0` is the evaluation of a `U`-invariant functional on a coinvariant class.
- Positive-degree vanishing for flat coefficients is compatible with the supplied degree-zero coinvariants identification and is preserved under coefficient isomorphisms.
- The edge isomorphism is natural in `M` for `k[G]`-linear maps between modules with vanishing positive-degree `S`-homology, and a class of `H_n(G, M)` is zero as soon as its image in `H_n(G/S, M/IM)` is zero; this is the only way 0.8 uses it.
- Under the positive-degree vanishing hypothesis, for `S` trivial the edge map is the identity; for `S = G` it is the identity of `M_G` in degree `0`, and both sides vanish above.

**Checks.**

- For `k = ℤ`, `S = ⟨t⟩ ≅ ℤ` and the flat localization `M = ℚ[t, t⁻¹]` of `ℤ[S]`, multiplication by `1 − t` is injective, so `H_1(S, M) = 0` and `H_0(S, M) = ℚ`. For the trivial module `ℤ/2`, multiplication by `1 − t` is zero and `H_1(S, ℤ/2) = ℤ/2`; the flatness hypothesis over `ℤ[S]` fails.
- For `G = S = T = ⟨π⟩ ≅ ℤ` the complex `0 → ℂ_p[T] → ℂ_p[T] → ℂ_p → 0`, `x ↦ (1 − π)x`, is a free resolution of the trivial module; for `M = ℂ_p[T] = ℂ_p[π, π⁻¹]` it gives `H_1(T, M) = ker(1 − π on M) = 0` and `H_0(T, M) = ℂ_p`, while for the trivial module `M = ℂ_p`, which is not free, `1 − π` acts as `0` and `H_1(T, ℂ_p) = ℂ_p ≠ 0`: the vanishing hypothesis fails there.
- Commutativity and finite rank of `S` are not used: for `G = S = S₃` and `M = ℂ_p[S₃]`, Shapiro's lemma gives `H_q(S₃, M) = 0` for `q > 0` and `H_0 = ℂ_p`, and the edge map to `H_n(1, ℂ_p)` is the identity of `ℂ_p` in degree `0` and `0 → 0` above; for `G = S₃`, `S = A₃` and the same `M`, free over `ℂ_p[A₃]`, `M_S = ℂ_p[S₃/A₃]` is the regular module of `C₂`, and both `H_n(S₃, M)` and `H_n(C₂, ℂ_p[C₂])` are `ℂ_p` for `n = 0` and `0` for `n > 0`.
- For `G = S = ℤ` and the trivial module `M = ℂ_p`, the map `H_1(G, ℂ_p) = ℂ_p → H_1(1, ℂ_p) = 0` is not injective, so the edge isomorphism fails without the vanishing hypothesis; for `M = ℂ_p[ℤ]` both sides are `0` in degree `1` and `ℂ_p` in degree `0`.
- For `G = E_+ × T` with `E_+ = ⟨ε⟩` and `T = ⟨π⟩` infinite cyclic, `S = T` and `M = ℂ_p[T]` with `ε` acting trivially, `M` is induced to `G` from the trivial `E_+`-module `ℂ_p`, so `H_1(G, M) = H_1(E_+, ℂ_p) = ℂ_p` by Shapiro's lemma (Mathlib `groupHomology.indIso`), and `H_1(E_+, M/IM) = H_1(E_+, ℂ_p) = ℂ_p`, as the isomorphism predicts; the target `H_1(E_+, M)` without coinvariants would be `M^{E_+} = ℂ_p[T]`, of infinite dimension.
- Balancing: `⟨κ, [ug] ⊗ m⟩ = κ(ug)(m) = (uκ(g))(m) = κ(g)(u⁻¹m) = ⟨κ, [g] ⊗ u⁻¹m⟩`, which is the relation `[ug] ⊗ m = [g] ⊗ u⁻¹m` of the tensor product over `ℤ[U]`; with the action `(uλ)(m) = λ(um)` on `M^∨` in place of the contragredient one the two sides differ as soon as `κ(g)` is not `u²`-invariant, so the pairing would not be defined on the chain group.

### 0.8 All-prime lower bound for the order

Prove that for every prime `p`, including `2`, `ord_{s=0} L_p(χω, s) ≥ r` (Charollois–Dasgupta Theorem 3, p. 4; §§5.1–5.2, pp. 27–32; Dasgupta–Kakde–Ventullo §1, (4), p. 835). By 0.6 it suffices to show that the integrals `∫_𝒪 (log_p Nx)^k dμ_ℓ(A, Q, v)` vanish for `0 ≤ k < r`, where `𝒪 = ∏_{i}(𝒪_{𝔮_i} − π_i 𝒪_{𝔮_i}) × ∏_{𝔮 ∉ R} 𝒪^*_{𝔮,𝔣}` and `π_i` is a totally positive generator, congruent to `1` modulo `𝔣`, of a power of `𝔮_i` (Charollois–Dasgupta (79)–(80), p. 28). Express each integral, up to the sign of the symmetrized unit chain, as the cap product (0.7) of the class of the measure cocycle, pulled back along `U → Γ_{ℓ,p}` (each element to its multiplication matrix, 0.6), in `H^{n−1}(U, C_c(F_p)^∨)` with the class `[L_k] ∈ H_{n−1}(U, C_c(F_p))`, where `U = E_+ × T` with `E_+` the free abelian group of rank `n − 1` of totally positive units congruent to `1` modulo `𝔣` and `T = ⟨π_1, …, π_r⟩` free abelian of rank `r` (Charollois–Dasgupta (81), p. 29). Then prove Spiess's two theorems in this setting:

- define `C_c^♭(F_p)` as the subspace of finite sums of products of continuous one-coordinate functions, with exceptional factors compactly supported and constant near `0` and other factors continuous on `𝒪_𝔮^×`, extended by zero (Charollois–Dasgupta §5.2, p. 29). Prove that it is a free `ℂ_p[T]`-module (Charollois–Dasgupta Lemma 5.3, p. 30), so by 0.7 `H_q(T, C_c^♭(F_p)) = 0` for `q > 0` and the edge map `H_{n−1}(U, C_c^♭) → H_{n−1}(E_+, C_c^♭/I·C_c^♭)` is an isomorphism, `I` the augmentation ideal of `ℂ_p[T]` (Theorem 5.1, p. 30);
- for `k < r`, `1_𝒪 · (log_p Nx)^k ∈ I · C_c^♭(F_p)` (Theorem 5.2, p. 30). Prove the stronger induction statement: for `J ⊆ R`, let `𝒪_J` have factor `𝒪_𝔮 − π_i𝒪_𝔮` at `𝔮 = 𝔮_i ∈ J`, factor `𝒪_𝔮` at `𝔮 ∈ R ∖ J`, and factor `𝒪^*_{𝔮,𝔣}` at the other primes above `p`. For a multi-index `n = (n_𝔮)` with `n_𝔮 = 0` on `R ∖ J` and `|n| = ∑_𝔮 n_𝔮 < #J`, put `g_n(x) = ∏_𝔮 ℓ_𝔮(x_𝔮)^{n_𝔮}` on this box, omitting factors with exponent zero. Then `1_{𝒪_J} g_n ∈ I·C_c^♭`. The action is `(π_i f)(x) = f(x/π_i)` on every coordinate, so with `c_{𝔮,i} = ℓ_𝔮(π_i)` the polynomial `D_i g_n = g_n − ∏_𝔮 (ℓ_𝔮 − c_{𝔮,i})^{n_𝔮}` contains only monomials of total degree below `|n|`. Choose `𝔮_i ∈ J` with `n_{𝔮_i} = 0`, and put `J₀ = J ∖ {𝔮_i}`. The exact identity is

```text
1_{𝒪_J} g_n = (1 − π_i)(1_{𝒪_{J₀}} g_n)
                − 1_{𝒪_{J₀}} D_i g_n + 1_{𝒪_J} D_i g_n.
```

The primitive in the first term belongs to `C_c^♭`: its logarithmic factors in exceptional coordinates are supported away from zero, and the remaining exceptional factors are indicators of `𝒪_𝔮`. Each monomial of `D_i g_n` has degree at most `|n| − 1 < #J₀` and has no exceptional logarithms outside `J₀`, so both correction terms lie in `I·C_c^♭` by induction on total degree. The base case is `1_{𝒪_J} = (1 − π_i)1_{𝒪_{J₀}}` for nonempty `J`. Taking `J = R` proves the assertion after expanding the logarithmic power (Charollois–Dasgupta (87)–(88) and proof of Theorem 5.2, pp. 31–32).

Hence `[L_k] = 0` for `k < r`, the first `r` Taylor coefficients of `L_{𝔠,p}(χω, s)` vanish, and dividing by the smoothing factor of 0.6, a unit in the ring of analytic germs at `s = 0`, gives the bound for `f_χ`. This is an inequality only; it assumes no nonvanishing of the regulator. At `r = 0` it is vacuous. *Needs:* 0.5, 0.6, 0.7; ClassFieldTheory Layer 11 (global units and principal ideals in the ray class group); DirichletPadicLFunctions §0.6 (`log_p` and its norm law); Mathlib `groupHomology` (the carrier).

The API includes:

- `C_c^♭` embeds linearly in the compactly supported continuous functions on `F_p`; its product factors specify the support and the behaviour near each exceptional zero coordinate.
- It is stable under `U` acting by `f(x) ↦ f(x/u)`: scaling preserves compact support and constancy near zero, and every `u ∈ U` is a unit at the nonexceptional primes.
- For the stated `J` and `n`, both `1_{𝒪_J}g_n` and the primitive `1_{𝒪_{J₀}}g_n` belong to `C_c^♭`; the induction gives augmentation-ideal membership, which is stronger than membership in this function space.

**Checks.**

- For `r = 1`, `k = 0`, the shell indicator is `(1 − π_1)1_{𝒪_{𝔮_1}}` times the factors at the nonexceptional primes: it is `1` on the shell and `0` on `π_1𝒪_{𝔮_1}`. The same indicator at `k = 1` lies outside the bound `k < r`.
- For `F = ℚ(√5)`, `p = 11`, take `H = F(√−2)` and `π_1 = (4 + √5)^4 = 761 + 336√5`, `π_2 = (4 − √5)^4`. They are totally positive generators of fourth powers of the two primes, congruent to `1` modulo `8`; the character of `H/F` has conductor dividing `8`, and both primes split in `H` since `−2 ≡ 3² (mod 11)`, so `r = 2`. Label the primes by `√5 ≡ 7, 4 (mod 11)`. At the second, `√5 ≡ 48 (mod 121)`, `4 + √5 ≡ 52` and `log_11(52) ≡ 22 (mod 121)`, hence `c = ℓ_2(π_1) ≡ 88 (mod 121) ≠ 0`. With `Δ_2 = 𝒪_2 ∖ π_2𝒪_2`, `A = 𝒪_1 × Δ_2`, `B = π_1𝒪_1 × Δ_2`, `𝒪 = A ∖ B` and `h = 1_Aℓ_2`, one has `(1 − π_1)h = 1_𝒪ℓ_2 + c1_B`. At `x = (π_1, 1)` the left side is `c` and `1_𝒪ℓ_2` is `0`; omitting the shift is false.
- In that two-coordinate example, `c1_B = (1 − π_2)(c1_{π_1𝒪_1 × 𝒪_2})`, so `1_𝒪ℓ_2 = (1 − π_1)h − (1 − π_2)(c1_{π_1𝒪_1 × 𝒪_2})` belongs to `I·C_c^♭`. At `(π_1, 1)` the corrected right side is `c − c = 0`; at `(1, 1 + 11)` it is `log_11(1 + 11) ≡ 11 (mod 121)`, matching the left side. Both primitives are compactly supported and constant near zero in each exceptional coordinate.

### 0.9 The leading-term theorem and the order conjecture

Prove the boundary statement: given the lower bound 0.8, `s_χ = r` holds if and only if `L_an(χ) ≠ 0`; so, once the leading-term identity `L_an(χ) = R_p(χ)` of 5.6 is proved, `s_χ = r` holds if and only if `R_p(χ) ≠ 0` (Dasgupta–Kakde–Ventullo §1, Conjectures 1–2 and Theorem 1, pp. 835–837). The general assertion `s_χ = r` (Gross's order conjecture) is not claimed. The characteristic polynomial of `ℓ_p^χ ∘ (o_p^χ)⁻¹` is defined, and only its determinant coefficient enters the end theorem (Dasgupta–Kakde–Ventullo Remark 1.1, p. 837). *Needs:* 0.4, 0.5, 0.8.

A vanishing regulator is compatible with `s_χ > r`; the leading-term theorem then asserts `0 = 0` and is still meaningful, since it determines that `s_χ > r`.

### Examples

For `F = ℚ`, `H = ℚ(i)`: at `p = 2`, `r = 0`, `D_χ = L(χ, 0) = 1/2`, `f_χ(0) = L^*(χ, 0) = 1/2` and the empty regulator is `1`. Here `χ = ω = ω⁻¹` at `p = 2`, so `χω` is trivial and `f_χ` is the `2`-adic zeta function of `ℚ`, regular at `0`; excluding `χ = ω⁻¹` would remove this example. At `p = 3`, `r = 0` and `D_χ = 1 = f_χ(0)`. At `p = 5`, `r = 1` and `R_5(χ) = −log_5((2+i)/(2−i))`.

### Dependencies

Mathlib (determinants, power series, tensor products, unit and class-group theorems, group homology with coinflation and Shapiro's lemma); Tau Ceti local Artin map and induced-module homology vanishing; ClassFieldTheory Layers 7, 11–13; Chebotarev Layer 10; LFunctions Layers 5, 7; IntegralIwasawaTheory §§0.1, 6.0, 6.3; DirichletPadicLFunctions §0.6.

## Layer 1: cyclotomic cohomology and orthogonality

### 1.1 Restricted continuous cohomology

For a finite-dimensional `E`-vector space `V` with the `p`-adic topology and `G_F` acting through `χ⁻¹`, define `H¹_R(G_F, V(χ⁻¹))` as the `E`-subspace of `H¹(G_F, V(χ⁻¹))` (Tau Ceti's `TauCeti.ContCohomology.H1`) of classes whose restriction to `H¹(I_𝔮, V(χ⁻¹))` vanishes for every finite prime `𝔮 ∉ R`. At `𝔮 ∈ R`, `χ` is trivial on `G_𝔮`, so the restriction is a continuous homomorphism `G_𝔮 → V`, hence through `rec` a continuous homomorphism from the profinite completion of `F_𝔮^×` to `V`; on `V = E`, the maps `o_𝔮 = ord_𝔮 ∘ rec⁻¹` and `ℓ_𝔮 = log_p N_{F_𝔮/ℚ_p} ∘ rec⁻¹` span a two-dimensional space of such homomorphisms (Dasgupta–Kakde–Ventullo §1.2, pp. 838–839; §2, pp. 843–845). The route: the `E`-structure on `H¹` is induced from scalar multiplication on `V`, which commutes with the action; local restriction is the pullback along the decomposition map `G_{F_𝔮} → G_F`, Tau Ceti's `TauCeti.absoluteGaloisGroupMap` for a fixed `F`-embedding of the separable closure of `F` into that of `F_𝔮` (at `𝔮_i ∈ R` the one inducing `𝔓_i`; another choice conjugates the map in `G_F`, which does not change whether a restricted class vanishes), and the inertia group `I_𝔮` is the image of `TauCeti.inertiaSubgroup` of `F_𝔮`; at `𝔮 ∈ R` apply `H1EquivOfSmulEqSelf` and the local Artin map, local units going to inertia by `TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_artinMap`. Independence of `o_𝔮` and `ℓ_𝔮`: a uniformizer has `o_𝔮 = 1`, and a principal unit `1 + p^m a` with nonzero norm logarithm has `o_𝔮 = 0`. *Needs:* 0.1, 0.2; Tau Ceti `TauCeti.ContCohomology.H1`, `H1EquivOfSmulEqSelf`, `TauCeti.ClassFieldTheory.artinMap`, `TauCeti.absoluteGaloisGroupMap`, `TauCeti.inertiaSubgroup`, `TauCeti.ClassFieldTheory.mem_inertiaSubgroup_of_mk_eq_artinMap`; ClassFieldTheory Layer 7; ArithmeticGaloisDuality §R02.2.3; DirichletPadicLFunctions §0.6.

The API includes:

- Membership in `H¹_R` means that the restriction class is zero at every finite `𝔮 ∉ R`; this is a condition on classes, not on cocycle representatives.
- At `𝔮 ∈ R` the local restriction of a class is a well-defined continuous homomorphism `F_𝔮^× → V` (through `rec`), independent of the representative cocycle, since local coboundaries vanish on `G_𝔮` when `χ|G_𝔮 = 1`.
- A continuous `E`-linear map `V → V′` induces a map of restricted cohomology compatible with every local restriction, with identity and composition laws.
- With an `E`-basis of `V`, `H¹_R(G_F, V(χ⁻¹))` is the direct sum of the coordinate spaces `H¹_R(G_F, E(χ⁻¹))`.

**Checks.**

- The zero cocycle lies in `H¹_R` for every `R`, including `R = ∅`.
- Every coboundary `g ↦ (χ⁻¹(g) − 1)v` restricts to the zero function on `G_𝔮` for `𝔮 ∈ R`; at `𝔮 ∈ R′` unramified it restricts to a nonzero function when `v ≠ 0`, but its class is zero.
- For `ℤ_p` acting trivially on `E`, the inclusion `ℤ_p → E` is a continuous homomorphism, hence a nonzero class; with the discrete topology on `E` the only continuous homomorphisms `ℤ_p → E` are zero, so a discrete-coefficient replacement loses every class used here.
- Under `rec`, `o_𝔮(ϖ) = 1` and `o_𝔮(a) = 0` for every local unit `a`, while `ℓ_𝔮(1 + p^2) = log_p(1 + p^2) ≠ 0` for `F_𝔮 = ℚ_p`; with the inverse normalization `Art` in place of `rec`, `o_𝔮(ϖ)` becomes `−1`.

### 1.2 Kummer description of the dual local condition

Prove that the rationalized Kummer map identifies `U_χ` with the subspace of `H¹(G_F, E(χ)(1))` cut out by the local unit-Kummer condition at every finite `𝔮 ∉ R`; locally, `(lim_n H_𝔓^×/(H_𝔓^×)^{p^n}) ⊗_{ℤ_p} E ≅ H¹(G_{H_𝔓}, E(1))`, with the inverse limit formed before tensoring with `E`; at `𝔮 ∉ R` the image lies in the orthogonal complement of the unramified condition on `E(χ⁻¹)`. With the local pairing ordered as `H¹(E(χ⁻¹)) × H¹(E(χ)(1))`, the local invariant of the cup product of a class with the Kummer class of `u` is `±` the evaluation of the class at `u` through `rec`, with one sign independent of the place and of `u` (Dasgupta–Kakde–Ventullo §2, Proof 1 of Proposition 2.1, (19)–(22), pp. 843–844; Dasgupta–Darmon–Pollack Proposition 1.4 and Lemma 1.5, pp. 455–456). The route: the finite-level `S`-unit Kummer sequence carries a Picard-group term which disappears after passing to inverse limits and tensoring with `E`, by finiteness of the class group; restriction to `G_H` identifies the χ⁻¹-components because `|G|` is invertible in `E`; ordinary units of the CM field have zero minus component and, at primes above `p` outside `R`, the valuation component vanishes; the local evaluation identity is the local Tate pairing transported through the inverse Artin normalization. *Needs:* 0.3, 1.1; ArithmeticGaloisDuality §§R02.1.3, R02.2.3, R02.3.3, R02.4.2, D7.6, D7.7; ClassFieldTheory Layer 7.

At finite coefficient levels the class-group term is present; it disappears only after rationalization. The same pairing order is used in the global invariant sum and in the local evaluation identity; swapping the two degree-one arguments changes the sign (ArithmeticGaloisDuality §R02.4.2). At primes above `p` the dual condition is the unit-Kummer condition, not ordinary unramifiedness of `E(χ)(1)`.

### 1.3 Orthogonality from Poitou–Tate duality

Prove that for every finite-dimensional `V`, every `κ ∈ H¹_R(G_F, V(χ⁻¹))` and every `u ∈ U_χ`, `∑_{i=1}^r (res_{𝔮_i} κ)(u) = 0` in `V`, the evaluation using the chosen `𝔓_i` and the identification `H_{𝔓_i} = F_{𝔮_i}` (Dasgupta–Kakde–Ventullo Proposition 2.1, Proof 1, pp. 843–844). The route: for `V = E` pair `κ` with the Kummer class of `u`; the sum of local invariants of a global cup product is zero by the rational Poitou–Tate sequence; at `𝔮 ∉ R` the two local conditions annihilate each other; at `𝔮 ∈ R` the local term is the universal sign times the evaluation, so the sign cancels; the real-place terms at `p = 2` vanish after tensoring with `E`. Recombine coordinates for general `V`. *Needs:* 1.2; ArithmeticGaloisDuality §§R02.4.3, D7.6.

For `r = 0` the sum is empty and the statement is `0 = 0`.

### 1.4 Orthogonality from global reciprocity

Prove the same identity by class field theory, independently of Poitou–Tate (Dasgupta–Kakde–Ventullo Proposition 2.1, Proof 2, (23)–(24), pp. 844–845). The route: positive-degree cohomology of the finite group `G` vanishes on `E`-spaces, so inflation–restriction identifies `H¹(G_F, V(χ⁻¹))` with the χ⁻¹-equivariant continuous homomorphisms `G_H^{ab} → V`; for an `R_H`-unit, its principal idele has trivial global Artin symbol; away from the primes above `R` its components are local units at which an unramified class vanishes; summing over the primes above `𝔮_i` and projecting with `e_χ`, equivariance turns the sum into a nonzero multiple of the sum over the chosen `𝔓_i`, and one divides by that scalar in `E`. Conclude by the spanning statement of 0.3 and `E`-linearity. *Needs:* 0.3, 1.1; ClassFieldTheory Layers 11 and 13; ArithmeticGaloisDuality §R02.2.3.

Global reciprocity is used on the profinite quotient of the idele class group; the uncompleted idele class group is not identified with a Galois group. Division takes place in `E`, so the argument holds at `p = 2`.

### 1.5 Injectivity of the product of inertia restrictions

Prove that the product of restrictions `H¹_R(G_F, V(χ⁻¹)) → ∏_{𝔮∈R} H¹(I_𝔮, V)` is injective for every finite-dimensional `V` (Dasgupta–Kakde–Ventullo Proposition 2.2, p. 845). The route: a class in the kernel is unramified at every finite place; its restriction to `G_H` is a continuous homomorphism from the Galois group of the maximal unramified abelian extension of the totally imaginary field `H` to the torsion-free `V`; that group is the finite class group of `H`, so the homomorphism is zero; restriction from `G_F` to `G_H` is injective on `E`-coefficients. *Needs:* 1.1; ClassFieldTheory Layer 13; ArithmeticGaloisDuality §R02.2.3; Mathlib `NumberField.RingOfIntegers.instFintypeClassGroup`.

When `R = ∅` this gives `H¹_∅ = 0`. For `r > 1` the product over all of `R` is needed: a single inertia restriction is not injective in general.

### 1.6 Cyclotomic classes

Define `H¹_cyc(χ) ⊆ H¹_R(G_F, E(χ⁻¹))` as the classes whose restriction at each `𝔮_j ∈ R` lies in `E·o_j + E·ℓ_j` (with `ℓ_j` unsigned), and for a family `κ_1, …, κ_m` define the coefficient matrices `X = (x_{ij})`, `Y = (y_{ij})` by `res_{𝔮_j} κ_i = x_{ij} o_j + y_{ij} ℓ_j`; the map `κ ↦ (y_j)_j` is the logarithmic coordinate (Dasgupta–Kakde–Ventullo §1.2, pp. 838–839). *Needs:* 1.1, 1.5.

The API includes:

- `H¹_cyc(χ)` is the inverse image of `⊕_j (E o_j + E ℓ_j)` under the restriction maps.
- The coefficients `x_j` and `y_j` of a class are unique, by independence of `o_j` and `ℓ_j`, and depend `E`-linearly on the class.
- Coefficient extraction depends only on the class, since local coboundaries vanish at `𝔮 ∈ R`.
- Extension of scalars `E ⊆ E′` transports the local pair, the subspace and the coefficient maps.

**Checks.**

- The zero class has `x_j = y_j = 0` for all `j`.
- If every logarithmic coefficient of a class in `H¹_cyc` is zero, all its inertia restrictions vanish (since `o_j` is unramified and `ℓ_j` is not), so it is zero by 1.5; an arbitrary tuple of valuation coefficients is therefore not realized by a global class.
- For a local homomorphism `2o_j + 3ℓ_j` the extracted coefficients are `(x_j, y_j) = (2, 3)`; reversing the convention gives `(3, 2)` and inverts Greenberg's invariant.

### 1.7 Dimension of the cyclotomic subspace

Prove that the logarithmic coordinate `H¹_cyc(χ) → E^r` is an isomorphism; in particular `dim_E H¹_cyc(χ) = r` and for every basis `κ_i` the matrix `Y` is invertible (Dasgupta–Kakde–Ventullo §1.2, p. 839; Dasgupta–Darmon–Pollack Lemma 1.5 and its proof, pp. 455–456). The route: by the rational Poitou–Tate sequence and 1.2, the image of the global restriction to `W = ⊕_j (E o_j + E ℓ_j)` is the annihilator of `U_χ` under evaluation; the evaluation map `W → U_χ^∨` is surjective because its restriction to the valuation summand has matrix `O` with `det O ≠ 0` (0.3); the kernel has dimension `2r − r = r` and, by 1.5, is identified with `H¹_cyc(χ)`; the logarithmic coordinate is injective by Check 2 of 1.6, hence an isomorphism. *Needs:* 0.3, 1.2, 1.5, 1.6; ArithmeticGaloisDuality §§R02.4.3, D7.6.

For `r = 0` the subspace is zero. The proof handles every `r` directly rather than iterating the rank-one lemma.

### 1.8 Greenberg's algebraic invariant

For an ordered basis `κ_1, …, κ_r` of `H¹_cyc(χ)` define `L_alg(χ) = det X / det Y` (Dasgupta–Kakde–Ventullo §1.2, the definition of the algebraic invariant, p. 839). *Needs:* 1.7; Mathlib `Matrix.det_mul`.

The API includes:

- `L_alg(χ)` is independent of the basis: a change of basis multiplies `X` and `Y` on the left by the same `P ∈ GL_r(E)`.
- Reindexing the exceptional primes permutes the columns of `X` and `Y` simultaneously and preserves the ratio.
- For `r = 0`, `L_alg(χ) = 1`.

**Checks.**

- For `X = (2)` and `Y = (3)` the value is `2/3`.
- For the zero space the value is `1` (empty determinants).
- For `X = diag(2,5)` and `Y = diag(3,7)` the value is `10/21`; left multiplication of both by `diag(4,1)` leaves `40/84 = 10/21`, while multiplying only `X` gives `40/21`.

### 1.9 The cohomological formula for the regulator

Prove `L_alg(χ) = R_p(χ)` (Dasgupta–Kakde–Ventullo §1.2, the comparison following Proposition 1, p. 839). The route: evaluate `res_{𝔮_j} κ_i = x_{ij} o_j + y_{ij} ℓ_j` at each `u_k` and sum over `j`; orthogonality (1.3 or 1.4) gives `XO + YL = 0`, so `X = −Y L O⁻¹` and `det X/det Y = det(−L)/det O`. *Needs:* 0.4, 1.3 or 1.4, 1.8; Mathlib `Matrix.det_mul`.

For `r = 1` the relation is `x·o(u) + y·ℓ(u) = 0`, so `x/y = −ℓ(u)/o(u)`. No extra `(−1)^r` occurs: the regulator carries the sign of its signed logarithm.

### Examples

For `H = ℚ(i)` and `p = 5` (`r = 1`), a nonzero class `κ ∈ H¹_cyc(χ)` has local restriction `x o + y ℓ` at `(5)` with `y ≠ 0`, and orthogonality with `u = (2+i)/(2−i)` gives `x/y = −log_5(u)`, which is `R_5(χ)`.

### Dependencies

Layer 0; Tau Ceti continuous cohomology, local Artin map, decomposition maps and inertia subgroups; ClassFieldTheory Layers 7, 11, 13; ArithmeticGaloisDuality §§R02.1.3, R02.2.3, R02.3.3, R02.4.2, R02.4.3, D7.6, D7.7; DirichletPadicLFunctions §0.6.

## Layer 2: weight-one families and cuspidal projection

Throughout this layer and the next, `r ≥ 1` and `S` is the set of primes above `p`. Write the conductor of `χ` as `𝔫𝔣_p`, with `𝔫` prime to `p` (the tame level) and `𝔣_p` supported on the primes above `p`; the character `χ` keeps its ramification above `p`. A prime `𝔮 | 𝔣_p` has `χ(𝔮) = 0` and so lies in `R′` (0.1): `𝔣_p = 1` when `R′ = ∅`, and ramification above `p` occurs only in Case 1 of 2.4. The weight-`k` members of the families have level `𝔫_S = 𝔫·lcm(𝔣_p, ∏_{𝔮∈S}𝔮)` (at `p = 2`, the dyadic level of gap:dyadic-hilbert-coefficient-families) and character `χω^{1−k}`. The families are those of NoncommutativeAndEquivariantIwasawa §F.5 presented in PadicFamilies §§5.10–5.13; for `p = 2` they come through gap:dyadic-hilbert-coefficient-families and gap:dyadic-hilbert-hida-localization, and for `𝔣_p ≠ 1`, as well as for the family of character `ω⁻¹` in 2.3, through gap:p-ramified-hilbert-coefficient-families and gap:p-ramified-hilbert-hida-localization.

### 2.1 The weight-one coordinate and the cyclotomic character

Define the weight-one coordinate `π = T/log_p(u)` in `Λ_(1)` and the universal cyclotomic character `ε : G_F → Λ^×`, `ε(σ) = (1 + T)^{log_p⟨ε_cyc(σ)⟩ / log_p(u)}`, so that `ν_k(ε(σ)) = ⟨ε_cyc(σ)⟩^{k−1}` (Dasgupta–Kakde–Ventullo §3.1, (25)–(27), p. 846). Identify this coordinate with the parallel-weight line of PadicFamilies §5.10. *Needs:* 0.5; IntegralIwasawaTheory Conventions and §0.1; DirichletPadicLFunctions §0.6; PadicFamilies §5.10; Mathlib `PowerSeries.X`, `PowerSeries.coeff`.

The API includes:

- `ν_k(π) = (u^{k−1} − 1)/log_p(u)`, and `Λ_(1)` is a discrete valuation ring with uniformizer `π`, residue field `E` and `p` invertible.
- If `h = π^n h′` with `ν_1(h′) ≠ 0`, then `k ↦ ν_k(h)` has a zero of order `n` at `k = 1` and its `n`-th derivative there divided by `n!` is `ν_1(h′)`.
- `ε(σ) ≡ 1 + log_p⟨ε_cyc(σ)⟩ π (mod π²)`, and inverting `σ` negates the linear coefficient.
- If `ℒ_χ ∈ Λ_(1)` satisfies `ν_k(ℒ_χ) = f_χ(1 − k)`, its `π`-adic valuation is `s_χ` and its leading coefficient is `(−1)^{s_χ} D_χ L^*_an(χ)`.

**Checks.**

- At `p = 2`, `u = 5` and `⟨−1⟩ = 1`, so `ε(σ) = 1` for a `σ` with `ε_cyc(σ) = −1`; with `u = 3` the weight coordinate would not be a generator of `1 + 4ℤ_2`, since `3 ∉ 1 + 4ℤ_2`.
- The germ `π` has first `k`-derivative `1` at `k = 1`, while `T` has first derivative `log_p(u)`; normalizing by `T` would rescale every leading term by a power of `log_p(u)`.
- If `f(s) = as² + bs³ + O(s⁴)`, then `ν_k(ℒ) = f(1−k)` has leading `π²`-coefficient `a`; a first-order term `cs` would contribute `−cπ`, with the sign reversed.

### 2.2 The Eisenstein and ordinary-family dictionary

Transport to this coordinate the Hida families `M°(𝔫, χ)`, `S°(𝔫, χ)`, the Hecke algebras `T̃` (on all families) and `T` (on cuspidal families), and the ordinary Eisenstein family `E(1, χ)` with `T_𝔩`-eigenvalue `1 + χε(𝔩)` for `𝔩 ∤ 𝔫p`, every standard-cusp constant equal to `2^{−[F:ℚ]} ℒ_χ`, and weight-one specialization `E_1(1, χ_S)`, where `χ_J` denotes `χ` with modulus divisible by the primes in `J`. When `R′ = ∅` use also the reversed family `E(χ, 1)` of gap:reversed-ordinary-eisenstein-family, with eigenvalue `χ(𝔩) + ε(𝔩)`, `U_𝔩`-eigenvalue `ε(𝔩)` for `𝔩 | 𝔫` and the same weight-one specialization. Prove, for `R′ ⊆ J ⊆ S` and `𝔮 ∈ S`, that `(U_𝔮 − 1) E_1(1, χ_J) = E_1(1, χ_{J ∪ {𝔮}})` when `𝔮 ∉ J` and `= 0` when `𝔮 ∈ J` (Dasgupta–Kakde–Ventullo §§3.1–3.3, pp. 847–851, footnote 6 and (35); §3.4, p. 854). The route: match the divisor-sum Fourier coefficients `∑_{𝔯 | 𝔞, (𝔯, modulus) = 1} η(𝔯) N𝔯^{k−1}` with `ν_k`; apply ordinary stabilization and the constant-term formulas; compare Fourier coefficients after adjoining one prime to the modulus and conclude by the `q`-expansion principle. *Needs:* 2.1; NoncommutativeAndEquivariantIwasawa §F.5 (through gap:dyadic-hilbert-coefficient-families and gap:p-ramified-hilbert-coefficient-families where `p = 2` or `𝔣_p ≠ 1`, gap:reversed-ordinary-eisenstein-family for `E(χ, 1)`, and gap:weight-one-hilbert-forms-and-products for the operators in weight one); PadicFamilies §§5.9a–5.10; OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) (through gap:weight-one-hilbert-eisenstein-series for `E_1(1, χ_J)`).

For the primitive weight-one series of modulus `1` the constant term is `2^{−[F:ℚ]}(L(η, 0) + η⁻¹(λ) L(η⁻¹, 0))` at the component `λ`; the one-term formula does not apply there. The family `E(χ, 1)` and its common weight-one specialization are used only when `R′ = ∅`. No Deligne–Ribet function, Hilbert modular form space or Eisenstein series is constructed here: the weight-one series are those of gap:weight-one-hilbert-eisenstein-series, and their products with families are 2.2b.

### 2.2a The Eisenstein complement of the cusp forms

For a totally real `F`, an integral ideal `𝔟`, a parallel weight `k ≥ 2` and a narrow ray class character `ψ` of modulus `𝔟` whose sign at every real place is `(−1)^k`, let `P(𝔟, ψ)` be the set of triples `(η, φ, 𝔱)` in which `η` and `φ` are primitive narrow ray class characters of conductors `𝔣_η` and `𝔣_φ` with `η(𝔞)φ(𝔞) = ψ(𝔞)` for every integral ideal `𝔞` prime to `𝔟`, and `𝔱` is an integral ideal with `𝔱𝔣_η𝔣_φ | 𝔟`. For an integral ideal `𝔱` let `B_𝔱 : M_k(𝔟′, ψ) → M_k(𝔱𝔟′, ψ)` be the degeneracy translate among the change-of-level maps of NoncommutativeAndEquivariantIwasawa §F.5, the slash by the diagonal finite idele matrix `diag(1, t⁻¹)` for an idele `t` generating `𝔱`, normalized so that `c(𝔪, f|B_𝔱) = c(𝔪𝔱⁻¹, f)` (zero unless `𝔱 | 𝔪`); prove this coefficient formula, `B_𝔱B_{𝔱′} = B_{𝔱𝔱′}`, `T_λB_𝔱 = B_𝔱T_λ` for `λ ∤ 𝔱`, and that the standard constants of `f|B_𝔱` are those of `f` moved between the narrow-class components by the class of `𝔱` (Linowitz, *Characterizing Hilbert modular cusp forms by coefficient size*, §2, p. 5). Prove that the forms `E_k(η, φ)|B_𝔱` of OrdinaryAutomorphicFormsAndModularityLifting §2.12(a), `(η, φ, 𝔱) ∈ P(𝔟, ψ)`, are linearly independent and that their span `ℰ_k(𝔟, ψ)` satisfies `M_k(𝔟, ψ) = S_k(𝔟, ψ) ⊕ ℰ_k(𝔟, ψ)`, for `k ≥ 3` and for `k = 2` when `F ≠ ℚ` (Linowitz, Proposition 3.2 and (5), pp. 6–7, for `k ≥ 3`, restating Atwill–Linowitz, *Newform theory for Hilbert Eisenstein series*, Proposition 3.11; Wiles, *On p-adic representations for totally real fields*, Proposition 1.5, to which Dasgupta–Darmon–Pollack §2.3, p. 465, attribute the weight-two case). When `F = ℚ` and `k = 2` the triples with `η = φ = 1` give no holomorphic form and are replaced by the series `E_2(z) − tE_2(tz)` for `1 < t | 𝔟`, all other triples being kept (ModularForms §0.1); the case `F = ℚ`, `k ≥ 3` is Tau Ceti's `TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace` with `TauCeti.EisensteinSeries.CharIndex.linearIndependent_inCharSpace`. Prove that for every prime `λ ∤ 𝔟`, `E_k(η, φ)|B_𝔱` is an eigenvector of `T_λ` with eigenvalue `η(λ) + φ(λ) Nλ^{k−1}`. Only the levels `𝔫_S` and characters `χω^{1−k}` of this layer, at weights `k ≥ 3`, are used in this roadmap. The route: the eigenvalue is read from the coefficient formula, whose Dirichlet series `L(η, s) L(φ, s − k + 1)` has the Euler factor `(1 − η(λ)X)⁻¹(1 − φ(λ)Nλ^{k−1}X)⁻¹` at `λ`, so the coefficients satisfy `c(λ^{j+1}) = (η(λ) + φ(λ)Nλ^{k−1}) c(λ^j) − ηφ(λ) Nλ^{k−1} c(λ^{j−1})` and are multiplicative, and `B_𝔱` commutes with `T_λ`; for independence, triples with different primitive pairs have different `T_λ`-eigenvalues for a set of `λ` of positive density, and for one pair the coefficient of `E_k(η, φ)|B_𝔱` at the ideal `𝔱′` is `0` unless `𝔱 | 𝔱′` and is `c(𝒪_F, E_k(η, φ)) = 1` at `𝔱′ = 𝔱`, a unitriangular pattern; the spanning statement is the dimension count of the constant-term data at the cusps supplied by the cited newform theory. *Needs:* OrdinaryAutomorphicFormsAndModularityLifting §2.12(a); NoncommutativeAndEquivariantIwasawa §F.5 (`hilbertForms`, `hilbertCuspForms`, the Hecke operators and the change-of-level maps); PadicFamilies §5.9a; Chebotarev Layer 10; Tau Ceti `TauCeti.isCompl_eisensteinSubspace_range_cuspToModFormCharSpace` and ModularForms §0.1 for `F = ℚ`.

The API includes:

- Every `f ∈ M_k(𝔟, ψ)` is uniquely `f_0 + ∑_{(η,φ,𝔱) ∈ P(𝔟,ψ)} a_{η,φ,𝔱} E_k(η, φ)|B_𝔱` with `f_0` a cusp form, for `k ≥ 3` and for `k = 2` when `F ≠ ℚ`; for `F = ℚ`, `k = 2`, the triples `(1, 1, t)` are replaced as above.
- `T_λ(E_k(η, φ)|B_𝔱) = (η(λ) + φ(λ) Nλ^{k−1}) E_k(η, φ)|B_𝔱` for `λ ∤ 𝔟`; the eigenvalue of the reversed pair is `φ(λ) + η(λ) Nλ^{k−1}`. Two different primitive pairs of the same nebentypus disagree on a set of primes of Dirichlet density at least `1/2`. For `k ≥ 3`, agreement on density strictly greater than `1/2` forces equality (Linowitz Theorem 3.3, p. 6, restating Atwill–Linowitz Theorem 3.6). The densities exist: away from `𝔟`, equality of eigenvalues at weight `k ≥ 2` is equivalent to equality of both character values, since equality with distinct first values and the common product `ηφ = ψ` would force `Nλ^{k−1}` to be a root of unity. Thus agreement is the inverse image of a subgroup in the finite joint character quotient; for distinct pairs it is a proper subgroup, of index at least `2`. Chebotarev gives its density, and positive-density disagreement supplies the separating primes in the independence argument.
- For a prime `𝔮 | 𝔟`, a pair `(η, φ)` and `𝔱` prime to `𝔮`, let `m ≥ 0` be largest with `𝔮^m𝔱𝔣_η𝔣_φ | 𝔟`. If `m = 0`, `E_k(η, φ)|B_𝔱` is a `U_𝔮`-eigenvector with eigenvalue `η(𝔮) + φ(𝔮)N𝔮^{k−1}`, one of the two terms being `0`. If `m ≥ 1`, `U_𝔮` maps `E_k(η, φ)` to `(η(𝔮) + φ(𝔮)N𝔮^{k−1})E_k(η, φ) − ηφ(𝔮)N𝔮^{k−1}E_k(η, φ)|B_𝔮` and `E_k(η, φ)|B_{𝔮^j}` to `E_k(η, φ)|B_{𝔮^{j−1}}` for `j ≥ 1`, and on the span of the `E_k(η, φ)|B_{𝔱𝔮^j}`, `0 ≤ j ≤ m`, its characteristic polynomial is `X^{m−1}(X − η(𝔮))(X − φ(𝔮)N𝔮^{k−1})`. For `𝔮 | p` and `k ≥ 2` only `η(𝔮)` can be a `p`-adic unit. Consequently, when every prime above `p` divides `𝔟`, the ordinary subspace for a fixed primitive pair is zero if `η` is ramified at any prime above `p`; otherwise it has basis `E_k(η, φ_S)|B_{𝔱₀}` over all ideals `𝔱₀` prime to `p` with `𝔱₀𝔣_η𝔣_φ | 𝔟`. Here `E_k(η, φ_S) = ∏_{𝔮|p}(1 − φ(𝔮)N𝔮^{k−1}B_𝔮)E_k(η, φ)` is the ordinary stabilization, with a factor equal to `1` when `φ(𝔮) = 0`. For each fixed `𝔱₀` the ordinary contribution is one-dimensional; different tame translates are retained. This follows from the displayed characteristic polynomial at each prime above `p`, the coefficient formula and commutation with prime-to-`p` translates (Linowitz §2, p. 5, and Proposition 3.2, p. 6).
- An imprimitive series `E_k(η′, φ′)` of OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) with primitive characters `η`, `φ` and moduli `𝔪_{η′}𝔪_{φ′} | 𝔟` is `∑_{A,B} (−1)^{#A+#B} η(𝔞_A) φ(𝔞_B) N𝔞_B^{k−1} E_k(η, φ)|B_{𝔞_A𝔞_B}`, over the sets `A` of primes dividing `𝔪_{η′}` but not `𝔣_η` and `B` of primes dividing `𝔪_{φ′}` but not `𝔣_φ`, with `𝔞_A = ∏_{𝔮∈A}𝔮`. It depends on the moduli only through these sets of primes.
- The standard constants of `E_k(η, φ)|B_𝔱` vanish if and only if `𝔣_η ≠ 1`; a combination of translates with `𝔣_η ≠ 1` has vanishing standard constants without being a cusp form.

**Checks.**

- For `F = ℚ`, `𝔟 = (8)`, `ψ = 1`, `k = 4`: `P` consists of `(1, 1, t)` for `t = 1, 2, 4, 8`, so the Eisenstein space is spanned by `E_4(z), E_4(2z), E_4(4z), E_4(8z)`, as many as the cusps of `Γ_0(8)`. Their coefficients at `n = 1, 2, 4, 8` are `(1, 9, 73, 585)`, `(0, 1, 9, 73)`, `(0, 0, 1, 9)`, `(0, 0, 0, 1)`, a unitriangular matrix. Indexing instead by imprimitive pairs whose moduli multiply to `8` fails: `(1_2, 1_4)` and `(1_4, 1_2)` both give `E_4 − 9E_4|B_2 + 8E_4|B_4`, with coefficients `σ_3(n)` for odd `n` and `0` for even `n` (`1, 0, 28, 0, 126, …`), and the four imprimitive pairs span only three dimensions.
- For `F = ℚ`, `𝔟 = (11)`, `ψ = 1`, `k = 2`: the only primitive pair is `(1, 1)`, its translates by `t = 1, 11` are replaced by the single series `E_2(z) − 11E_2(11z)`, and `M_2(Γ_0(11))` has dimension `2`, the cusp form of `X_0(11)` plus this series; keeping both translates would predict an Eisenstein space of dimension `2`.
- For `F = ℚ`, `𝔟 = (p²)`, `ψ = 1` and even `k ≥ 4`: the triples are `(1, 1, t)` for `t = 1, p, p²` and `(η, η⁻¹, 1)` for the `p − 2` nontrivial characters `η` modulo `p`, in all `p + 1`, the number `∑_{d | p²} φ(gcd(d, p²/d)) = 1 + (p − 1) + 1` of cusps of `Γ_0(p²)`; omitting the translates `t = p, p²` would give `p − 1`.
- For `F = ℚ`, `𝔟 = (25)`, `ψ = 1`, `k = 4`, the pairs `(1, 1)` and `(ξ, ξ)` for the quadratic character `ξ` modulo `5` have conductor products `1` and `25`. They agree on the classes `1, 4 (mod 5)` and disagree on `2, 3 (mod 5)`, so disagreement has density `2/4 = 1/2`. At `λ = 2` the eigenvalues are `9, −9`; at `λ = 11` both are `1332`. A strict lower bound of `1/2` would exclude this pair.
- For `F = ℚ`, `𝔟 = (6)`, `k = 4`, `p = 2`, the pair `(1, 1)` has the two ordinary tame translates `g = E_4(z) − 8E_4(2z)` and `g|B_3 = g(3z)`. Since `c(n, g) = ∑_{d|n, d odd}d³`, `c(2n, g) = c(n, g)` and both have `U_2`-eigenvalue `1`. Their coefficient columns at `n = 1, 3` are `(1, 28)` and `(0, 1)`, of determinant `1`, so ordinary dimension is `2`. At tame level `1`, as required by the conductor of the trivial nebentypus in 2.6, only `g` remains.
- For `F = ℚ`, `𝔟 = (4)`, `ψ = χ_4` the odd character of conductor `4`, `k = 3`: `M_3(Γ_0(4), χ_4)` is spanned by `E_3(1, χ_4)` and `E_3(χ_4, 1)`, with `T_3`-eigenvalues `1 + χ_4(3)·9 = −8` and `χ_4(3) + 9 = 8`; the order of the pair is visible in the eigenvalue. At `p = 2` their `U_2`-eigenvalues are respectively `1` and `4`, so the pair with first character ramified at `2` has zero ordinary contribution.
- The `U_𝔮` action for `F = ℚ`, `η = φ = 1`, `k = 4`, `𝔮 = 2`, `m = 1`: on the span of `E_4(z)` and `E_4(2z)`, `U_2` has eigenvalues `1` and `8`, with eigenvectors `E_4(z) − 8E_4(2z)` (coefficients `∑_{d|n, d odd} d³`, so `1` at `n = 2`) and `E_4(z) − E_4(2z)`. At `p = 2` only the first is ordinary; the eigenvalue `8` has `2`-adic valuation `3`.
- The Hecke separation of 2.6 in miniature: on `M_2(Γ_0(11))`, `T_2` has eigenvalue `1 + 2 = 3` on the Eisenstein series and `−2` on the cusp form, so `T_2 − 3` kills the Eisenstein part and acts invertibly on the cusp form.

### 2.2b Products of weight-one forms with shifted families

Let `ℋ ∈ M°(1, ω⁻¹)_(0)` be a Hida family of tame level one and character `ω⁻¹`, localized at weight zero, and `ℋ^♭(T) = ℋ((1 + T)u⁻¹ − 1)` its shift, so that `ν_k(ℋ^♭) = ν_{k−1}(ℋ)`. For a classical holomorphic Hilbert modular form `g` of parallel weight one, level dividing `𝔫_S` and character `χ` (gap:weight-one-hilbert-forms-and-products), define `g·ℋ^♭` on each narrow-class component as the product of the `q`-expansion of `g` with the Λ-adic `q`-expansion of `ℋ^♭`. Prove that `g·ℋ^♭ ∈ M(𝔫, χ)_(1)`, that `ν_k(g·ℋ^♭) = g·ν_{k−1}(ℋ)` in `M_k(𝔫_S, χω^{1−k})` for every integer `k ≥ 3` at which `ℋ` is regular in weight `k − 1`, and that `c_λ(0, g·ℋ^♭) = c_λ(0, g)·c_λ(0, ℋ^♭)` for every narrow class `λ` (Dasgupta–Kakde–Ventullo §3.2, (28)–(30), pp. 848–849; Dasgupta–Darmon–Pollack (68), p. 465, for the classical product). It is applied to `g = E_1(1, χ_J)`, `R′ ⊆ J ⊆ S`, the weight-one series of gap:weight-one-hilbert-eisenstein-series, with coefficients `∑_{𝔯 | 𝔪, (𝔯, J) = 1} χ(𝔯)` and standard constants `2^{−[F:ℚ]}L(χ, 0)∏_{𝔮∈J}(1 − χ(𝔮))` when its modulus `𝔫·lcm(𝔣_p, ∏_{𝔮∈J}𝔮)` is not `1`. The route: write `ℋ = ℋ′/d` with `ℋ′ ∈ M°(1, ω⁻¹)` and `d ∈ Λ`, `ν_0(d) ≠ 0`; by the product of classical forms of gap:weight-one-hilbert-forms-and-products, `ν_k(g·ℋ′^♭) = g·ν_{k−1}(ℋ′)` is classical of weight `k`, level dividing `𝔫_S` and character `χω^{1−k}` for every `k ≥ 3`, with integral normalized coefficients after scaling `g` by a nonzero constant; at `k = 2` the factor `ν_1(ℋ′)` need not be classical, so multiply by `d_2 = (1 + T) − u`, which has `ν_k(d_2) = u^{k−1} − u`, zero exactly at `k = 2`, and `ν_1(d_2) = 1 − u ≠ 0`. Then `d_2·g·ℋ′^♭` satisfies the defining conditions of `M(𝔫, χ)` at every `k ≥ 2`, and `g·ℋ^♭ = (d_2 d^♭)⁻¹(d_2·g·ℋ′^♭)` with `d^♭` and `d_2` units of `Λ_(1)`. *Needs:* 2.1; NoncommutativeAndEquivariantIwasawa §F.5 (through gap:weight-one-hilbert-forms-and-products, gap:p-ramified-hilbert-coefficient-families for the character `ω⁻¹`, and gap:dyadic-hilbert-coefficient-families at `p = 2`); OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) (through gap:weight-one-hilbert-eisenstein-series); PadicFamilies §5.10.

The API includes:

- The product is `E`-linear in `g` and semilinear in `ℋ` for the coefficient isomorphism `Λ_(0) → Λ_(1)`, `a(T) ↦ a((1 + T)u⁻¹ − 1)`: multiplying `ℋ` by `a` multiplies the product by this shifted scalar. It commutes with specialization at every `k ≥ 3` where `ℋ` is regular in weight `k − 1`.
- Standard constants multiply; in particular `c_λ(0, E_1(1, χ_J)·ℋ^♭) = c_λ(0, E_1(1, χ_J))` when every standard constant of `ℋ` is `1`.
- The normalized ideal coefficients of `g·ℋ^♭` are those of the componentwise product of `q`-expansions; they are not the Dirichlet convolution of the two ideal-coefficient functions.

**Checks.**

- For `F = ℚ` and `χ = χ_4`, `E_1(1, χ_4) = θ²/4` with `θ = ∑_{n∈ℤ} q^{n²}`: its coefficients at `n = 1, 2, 3, 4, 5` are `1, 1, 0, 1, 2` and its constant is `1/4 = 2^{−1}L(χ_4, 0)`. At `p = 5`, `E_1(1, χ_S)` (the character `χ_4` taken with modulus `20`) has coefficients `1` and `1` at `n = 1` and `5`, and `(U_5 − 1)E_1(1, χ_4)` has coefficients `2 − 1 = 1` at `n = 1` and `3 − 2 = 1` at `n = 5`, as 2.2 predicts.
- The excluded weight is `k = 2` only: `ν_2(d_2) = u − u = 0`, while `ν_1(d_2) = 1 − u` is `−p` for odd `p` and `−4` at `p = 2`, a unit of `Λ_(1)`. Without `d_2` the weight-two member `g·ν_1(ℋ′)` would have to be classical, and `ν_1` of a family is not required to be classical (PadicFamilies §5.10).
- Scalar transport detects the shift: for `a(T) = T`, `(aℋ)^♭ = ((1 + T)u⁻¹ − 1)ℋ^♭`. At weight one this scalar is `u⁻¹ − 1`, which is `−5/6` at `p = 5`, while the unshifted scalar `T` gives `0`. Ordinary linearity over the unshifted coefficient ring fails.
- Constants multiply with the modulus of `g`: for `F = ℚ`, `g = E_1(1, χ_4)` and a family `ℋ` with constant `1`, the constant of `g·ℋ^♭` is `1/4`; the two-term formula of modulus `1` would give `2^{−1}(L(χ_4, 0) + L(χ_4, 0)) = 1/2`, and the constant of `F̃` in 2.5 would become `2^{−1}ℒ_χ − (1/2)·2ℒ_χ = −ℒ_χ/2 ≠ 0`.

### 2.3 Ventullo's constant-term-one family

Construct `𝒢 ∈ M°(1, ω⁻¹)_(0)`, a Hida family of level one localized at weight zero, with `ν_0(𝒢) = 1` and every standard-cusp constant identically `1`, and its shift `𝒢^♭(T) = 𝒢((1 + T)u⁻¹ − 1)`, which is regular at weight one with `ν_k(𝒢^♭) = ν_{k−1}(𝒢)`, so `ν_1(𝒢^♭) = 1` (Dasgupta–Kakde–Ventullo Lemma 3.1 and the weight-shift identity, p. 848; Ventullo Theorem 2 and §§4.1–4.2, pp. 14–20). No Leopoldt hypothesis is used.

As part of this target, define small-disc families and prove that an ordinary one through the constant form at weight zero gives a member of `M°(1, ω⁻¹)_(0)` (Ventullo §4.1, p. 15, where this comparison is asserted). For an integer `r ≥ 1` let `Λ_r = 𝒪_E[[X]]`, a `Λ`-algebra by `1 + T ↦ u⁻¹(1 + p^r X)`: the weight `k ∈ ℤ_p` corresponds to `X = (u^k − 1)/p^r`, it lies in the open unit disc exactly when `v_p(u^k − 1) > r`, and weight zero is `X = 0`. A small-disc family is a tuple of coordinates `c(𝔞)`, `c_λ(0)` in `Λ_r`, indexed as the coordinates of the families of NoncommutativeAndEquivariantIwasawa §F.5, whose specializations at an infinite set of integers `k ≥ 2` of the open disc (its classical weights) are the normalized coefficients of classical forms of parallel weight `k`, level `∏_{𝔮|p}𝔮` (the dyadic level at `p = 2`) and character `ω^{−k}` in the standard-component lattice. Prove:

- (i) `U = ∏_{𝔮|p} U_𝔮`, acting on coordinates by the formulas of the supplied families, preserves small-disc families, and `e = lim_n U^{n!}` exists coordinatewise in the `(ϖ_E, X)`-adic topology, commutes with specialization at every classical weight and at weight zero, and fixes the constant tuple `1` at weight zero (`U_𝔮` sends `c(𝔞)` to `c(𝔞𝔮)` and permutes the standard constants among the narrow-class components). The route: an element of `Λ_r` is determined modulo `(ϖ_E, X)^M` by its values modulo a sufficiently high power of `ϖ_E` at `M` distinct points of the open disc (Weierstrass division by the product of the `M` linear factors, then Lagrange interpolation), and at each classical weight the factorial powers of `U` converge uniformly on a `U`-stable lattice of the finite classical space.
- (ii) A small-disc family `𝒦` with `e𝒦 = 𝒦` lies in `M°(1, ω⁻¹) ⊗_Λ Frac(Λ_r)`. The route: for a `Λ`-basis `h_1, …, h_d` of the finite free module `M°(1, ω⁻¹)` choose ideals `𝔞_1, …, 𝔞_d` with `D = det(c(𝔞_i, h_j)) ≠ 0` (a family is determined by its positive coefficients, since a classical form of weight `k ≥ 2` with only a constant term is `0`); Cramer's rule gives `x_j ∈ D⁻¹Λ_r` with `c(𝔞_i, 𝒦) = ∑_j x_j c(𝔞_i, h_j)`. At every classical weight `k` of `𝒦` outside the finitely many zeros in the disc of `D` and of a nonzero `δ ∈ Λ` with `δM′° ⊆ M°`, ordinary control puts `ν_k(𝒦)` in the `E`-span of the `ν_k(h_j)`, with coordinates `ν_k(x_j)`. So every coordinate of `D𝒦 − ∑_j (Dx_j) h_j` is an element of `Λ_r` with infinitely many zeros in the open disc, and it vanishes by Weierstrass preparation.
- (iii) If moreover `ν_0(𝒦) = 1`, then there is `𝒢′ ∈ M°(1, ω⁻¹)_(0)` with `ν_0(𝒢′) = 1`. The route: `Λ` and `Λ_r` share at weight zero the uniformizer `g_0 = T − u⁻¹ + 1` (its image is `u⁻¹p^r X`) and the residue field `E`, so there are `y_j ∈ Frac(Λ)` with `x_j − y_j` in the maximal ideal of the localization of `Λ_r` at `X = 0`; since the coordinates of the `h_j`, standard constants included, lie in `Λ`, every coordinate of `𝒢′ = ∑_j y_j h_j` lies in `Λ_(0)`, with the same value at weight zero as that of `𝒦`. Writing `𝒢′ = 𝒢″/(g_0^a d′)` with `𝒢″ ∈ M°` and `ν_0(d′) ≠ 0`, the coordinates of `d′𝒢′` lie in `Λ_(0) ∩ g_0^{−a}Λ = Λ`, `Λ` being factorial and `g_0` prime, and its specializations at every `k ≥ 2` are those of `𝒢″` divided by `ν_k(g_0)^a = (u^{k−1} − u⁻¹)^a ≠ 0`; so `d′𝒢′ ∈ M`, it is fixed by `e`, and `𝒢′ = (d′𝒢′)/d′ ∈ M°(1, ω⁻¹)_(0)`.

The route to `𝒢`: take a form `f` of level one and parallel weight `w` divisible by `(p − 1)p^{N}` with every cusp expansion congruent to `1` modulo `p` (IntegralIwasawaTheory §9.3 `hilbertHasseLift`). For `r` large the binomial expansion of `f^{k/w}` gives a small-disc family `𝒦_f` with `ν_0(𝒦_f) = 1` whose classical members are the powers `f^j` at the weights `k = wj` of the open disc divisible by `2(p − 1)` (by `4` at `p = 2`), of trivial character `ω^{−wj} = 1` (Ventullo Lemma 4 and the choice of the exponent `r` before it, p. 19, which at `p = 2` is larger than at odd `p`). The expansion interpolates the coefficients of each component `λ` before normalization; with representatives `t_λ` prime to `p`, the normalizing factor `N(t_λ)^{−k/2}` agrees at those weights with `⟨N t_λ⟩^{−k/2}`, an element of `Λ_r` for `r` large, which is `1` at weight zero. Apply (i) to `𝒦_f` and (ii)–(iii) to `e𝒦_f`, which gives `𝒢′`. For each character `η ≠ 1` of `Cl⁺(F)` choose by Chebotarev a prime `λ_η ∤ p` with `η(λ_η) ≠ 1` and put `t_η = d_η⁻¹(T_{λ_η} − η(λ_η) − η⁻¹ω⁻¹(λ_η)ε(λ_η))`, where `d_η = (1 − η(λ_η))(1 − η⁻¹ω⁻¹(λ_η)ε(λ_η))` is the eigenvalue of the bracket on `E(1, ω⁻¹)`, a unit of `Λ_(0)` because `ν_0(d_η) = (1 − η(λ_η))(1 − η⁻¹(λ_η)Nλ_η⁻¹) ≠ 0`. Then `t = ∏_η t_η` acts on the weight-zero constant tuple by `1` (there `T_λ` acts by `1 + Nλ⁻¹`), so `ν_0(t𝒢′) = 1`; and at every integer `k ≥ 3` outside a finite set, `ν_k(t𝒢′)` is ordinary of level `∏_{𝔮|p}𝔮` and character `ω^{−k}`, so by 2.2a it is a cusp form plus a combination of the ordinary series `E_k(η, (η⁻¹ω^{−k})_S)`, `η` a character of `Cl⁺(F)`, in which `t` has killed every `η ≠ 1`. The remaining series `E_k(1, (ω^{−k})_S)` has the same standard constant on every component (OrdinaryAutomorphicFormsAndModularityLifting §2.12(a)), so all standard constants of `t𝒢′` equal one element `a ∈ Λ_(0)`, and `ν_0(a) = 1`. Put `𝒢 = a⁻¹ t𝒢′`, a unit multiple, and pull back by the affine weight change. *Needs:* 2.2, 2.2a; IntegralIwasawaTheory §9.3; NoncommutativeAndEquivariantIwasawa §F.5 (the coordinatewise operators `U_𝔮` and `T_𝔩`, the lattices `M° ⊆ M′°` of character `ω⁻¹` with `M°` finite free and `δM′° ⊆ M°` for a nonzero `δ ∈ Λ`, and ordinary control at every `k ≥ 2`, through gap:p-ramified-hilbert-coefficient-families, since `ω⁻¹` is in general ramified above `p`, gap:dyadic-hilbert-coefficient-families at `p = 2`, and gap:weight-one-hilbert-forms-and-products for the products of classical forms in the powers `f^j`); PadicFamilies §§5.9a–5.10; OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) (the standard constants of `E_k(1, ψ)`); Chebotarev Layer 10; Mathlib `PowerSeries.exists_isWeierstrassDivision` and `PowerSeries.exists_isWeierstrassFactorization`.

The API includes:

- `𝒢` is a Hida family in the supplied family module, localized at weight zero, with every standard-cusp constant equal to `1`.
- `ν_0(𝒢) = 1` as a `q`-expansion: every positive coefficient is `0` and the constant is `1`.
- `𝒢^♭` is the pullback of `𝒢` along `T ↦ (1 + T)u⁻¹ − 1`, and `ν_k(𝒢^♭) = ν_{k−1}(𝒢)`.
- The ordinary projector acts on small-disc families, commutes with their specializations at classical weights and at weight zero, and fixes the weight-zero constant tuple `1`.
- An ordinary small-disc family lies in `M°(1, ω⁻¹) ⊗_Λ Frac(Λ_r)`; one whose weight-zero specialization is `1` gives a member of `M°(1, ω⁻¹)_(0)` with the same weight-zero specialization.

**Checks.**

- At weight zero every positive Fourier coefficient of `𝒢` vanishes and the constant is `1`; the zero family has the right positive coefficients and fails the constant.
- The disc, for `F = ℚ`, `p = 5` (`u = 6`), `f = E_4^5 ≡ 1 (mod 5)` of weight `w = 20` and `r = 2`: since `v_5(6^k − 1) = 1 + v_5(k)`, the open disc consists of the weights in `25ℤ_5`, and the classical members of `𝒦_f` are `E_4^{5j}` at the weights `20j` with `10 | j` (`5 | j` for the disc, `2 | j` for divisibility by `2(p − 1) = 8`). Weight `3` is not in the disc, so `𝒦_f` has no weight-`3` member, while every element of `M°(1, ω⁻¹)` has a classical weight-`3` specialization: treating `𝒦_f` as an element of the family module would require `f^{3/20}` to be classical, and (ii)–(iii) are what replace that.
- The weight-zero value does not fix the constants: `a·𝒢` with `a = 1 + g_0 = T + 2 − u⁻¹` has `ν_0(a·𝒢) = 1` but standard constant `a`, with `ν_1(a) = 2 − u⁻¹ ≠ 1`. Used in place of `𝒢` in Case 1 of 2.5, it would leave `F̃` with standard constants `2^{−[F:ℚ]}ℒ_χ(1 − a^♭) = −2^{−[F:ℚ]}u⁻¹Tℒ_χ`, zero at weight one but not identically; the division by `a` in the route removes this.
- For a totally real field with nontrivial narrow class group, the constant at each standard cusp, one per narrow class, is `1`; a family normalized at one cusp only fails at the others.
- `ν_1(𝒢^♭)` evaluates `𝒢` at `T = u⁻¹ − 1`, which is `ν_0`; evaluating `𝒢` itself at `T = 0` is `ν_1(𝒢)`, which need not be `1`.

### 2.4 Three cases without an exact-order hypothesis

For `r ≥ 1` write `s = s_χ ≥ r` (by 0.8). If `R′ ≠ ∅`, call this Case 1. If `R′ = ∅`, then `𝔣_p = 1`, the conductor of `χ` and of `χ⁻¹` is the tame level `𝔫`, and we put `t = s_{χ⁻¹} ≥ r`,

```text
ε(𝔫) = ∏_{𝔩 | 𝔫} ε(Frob_𝔩)^{v_𝔩(𝔫)} ∈ Λ^×,      W = ε(𝔫) · (ℒ_χ/ℒ_{χ⁻¹}) · L(χ⁻¹, 0)/L(χ, 0) ∈ Frac(Λ),
```

where `ε(𝔫)` is defined because `ε` is unramified outside `p`, has `ν_k(ε(𝔫)) = ⟨N𝔫⟩^{k−1}`, `ν_1(ε(𝔫)) = 1`, and equals `1` when `𝔫 = 1`. Then `ν_k(W) = ⟨N𝔫⟩^{k−1} f_χ(1 − k) L(χ⁻¹, 0)/(f_{χ⁻¹}(1 − k) L(χ, 0))` and `W` has `π`-adic valuation `s − t`. The factor `ε(𝔫)` is the one for which the family `E(χ, 1)W` of 2.5 cancels the Eisenstein component of the pair `(χ, ω^{1−k})` (2.5a, from Dasgupta–Darmon–Pollack Proposition 2.7, p. 467, and (79), p. 469); it is a unit congruent to `1` modulo `π`, so the valuation `s − t`, the residue `w` below, the constant `c` of 3.3 and the Artin algebras of Layer 3 are those of the same formula without it. Prove: after interchanging `χ` and `χ⁻¹` if necessary, `s ≥ t` and `W ∈ Λ_(1)`; then either `w = ν_1(W) ≠ 0` and `s = t` (Case 2), or `w = 0` and `s > t` (Case 3). In Case 2 the argument applies to either orientation; in Case 3 it must prove the result for both `χ` and `χ⁻¹` (Dasgupta–Kakde–Ventullo §3.2, (30)–(31) and the case division, p. 849, with the factor `ε(𝔫)` restored). The route: nonzero analytic germs have finite order (0.5) and 2.1 preserves orders; interchanging the characters replaces `W` by `ε(𝔫)²W⁻¹`, so negates its valuation, and preserves `R` and `r`. *Needs:* 0.8, 2.1; DirichletPadicLFunctions §0.6 (the angular coordinate `⟨·⟩`).

The value `w = −1` belongs to Case 2. Neither `s = r` nor `t = r` is assumed.

**Checks.**

- Interchanging `χ` and `χ⁻¹` replaces `W` by `ε(𝔫)²W⁻¹` and its valuation `s − t` by `t − s`, so at least one orientation has `W ∈ Λ_(1)`, and both do exactly when `s = t`; `R`, `R′` and `r` are unchanged (0.1). When `χ = χ⁻¹` the two expressions agree, `W = ε(𝔫)`; the bare inversion `W ↦ W⁻¹` would force `ε(𝔫)² = 1`, false for `𝔫 ≠ 1`.
- When `s = t`, the leading coefficients `(−1)^s D_χ L^*_an(χ)` and `(−1)^t D_{χ⁻¹} L^*_an(χ⁻¹)` of 2.1, with `D_χ = L(χ, 0)` and `D_{χ⁻¹} = L(χ⁻¹, 0)` because `R′ = ∅`, together with `ν_1(ε(𝔫)) = 1`, give `w = L^*_an(χ)/L^*_an(χ⁻¹)`; in general `ν_1(W/π^{s−t}) = (−1)^{s−t} L^*_an(χ)/L^*_an(χ⁻¹)`, the constant `c` of 3.3. For `F = ℚ`, `H = ℚ(i)`, `p = 5`: `R′ = ∅`, `χ = χ⁻¹`, `𝔫 = (4)`, `W = ε(Frob_2)²` with `ν_k(W) = ⟨4⟩^{k−1} = (−4)^{k−1}` (since `ω(4) = −1`), `w = 1` and the datum is in Case 2.
- In the same example the factor is needed: with `W = 1` in place of `ε(𝔫)`, the coefficient of the pair `(χ, ω^{1−k})` in `e·ν_k(F̃)` would be `1 − ⟨4⟩^{k−1}` by 2.5a, a formula whose value at `k = 3` is `1 − (−4)² = −15`, and which is nonzero for every `k ≠ 1` because `−4` is not a root of unity; since every operator of `T̃` has eigenvalues congruent modulo `π` on `E(χ, 1)` and `E(1, χ)`, no operator normalized as in 2.6 could remove it.
- `w = −1` is Case 2: `s = t` and `W` is a unit of `Λ_(1)`; a case division by `1 + w ≠ 0` would misplace it in Case 3, where `s > t` and `w = 0`, and the Artin algebra at `w = −1` is `W_2` of 3.2 (with `π^s = 0`), not `W_3`.

### 2.5 The Gross–Stark semi-cusp family

Define `F̃ ∈ M(𝔫, χ)_(1)`: in Case 1, `F̃ = E(1, χ) − E_1(1, χ_{R′}) 𝒢^♭ ℒ_χ / D_χ`; when `R′ = ∅`, `F̃ = E(1, χ) − E_1(1, χ) 𝒢^♭ ℒ_χ / L(χ, 0) + E(χ, 1) W` (Dasgupta–Kakde–Ventullo §3.2, (28)–(31), pp. 848–849). Prove that every standard-cusp constant of `F̃` vanishes identically, that `F̃` is regular at weight one, and that its weight-one specialization is `E_1(1, χ_S)` in Cases 1 and 3 and `(1 + w) E_1(1, χ_S)` in Case 2. The route: the products are those of 2.2b, whose standard constants multiply; in Case 1 the constants of `E_1(1, χ_{R′})` are `2^{−[F:ℚ]} D_χ` and those of `𝒢^♭` are `1`; when `R′ = ∅` and `𝔫 = 1`, both constant terms of the modulus-one series `E_1(1, χ)` occur, and the second, `2^{−[F:ℚ]}χ⁻¹(λ)L(χ⁻¹, 0)ℒ_χ/L(χ, 0)` after the factor `ℒ_χ/L(χ, 0)`, is cancelled by the constant `2^{−[F:ℚ]}χ⁻¹(λ)ℒ_{χ⁻¹}W` of `E(χ, 1)W` (here `ε(𝔫) = 1`); when `R′ = ∅` and `𝔫 ≠ 1`, `E_1(1, χ)` has the single constant `2^{−[F:ℚ]}L(χ, 0)` and `E(χ, 1)` has zero standard constants, so the standard constants vanish without the third term, which is there to cancel the Eisenstein component of the pair `(χ, ω^{1−k})` (2.5a, 2.6); `ℒ_χ` vanishes at weight one because `s ≥ r ≥ 1`. *Needs:* 0.5, 2.2, 2.2b, 2.3, 2.4.

The API includes:

- `F̃` is the displayed case-dependent combination in the family module localized at weight one.
- Every standard-cusp constant of `F̃` is identically zero.
- `ν_1(F̃) = E_1(1, χ_S)` in Cases 1 and 3 and `(1 + w)E_1(1, χ_S)` in Case 2.
- In Case 1 the subtracted product is `(−1)^s L^*_an(χ) π^s E_1(1, χ_{R′})` modulo `π^{s+1}`.

**Checks.**

- In Case 1, `ν_1(F̃)` is the ordinary stabilized Eisenstein series `E_1(1, χ_S)`, nonzero, because `s ≥ 1` kills the correction at weight one.
- In Case 2 with `w = −1`, `ν_1(F̃) = 0`; a claim that the weight-one specialization is always nonzero fails here.
- For `s = 1` the leading correction is `−L^*_an(χ) π E_1(1, χ_{R′})`, for `s = 2` it is `+L^*_an(χ) π² E_1(1, χ_{R′})`: the sign `(−1)^s` comes from `ν_k(ℒ_χ) = f_χ(1 − k)`.

Vanishing standard constants is the semi-cuspidal condition; cuspidality at every cusp is the conclusion of 2.6.

### 2.5a The reversed Eisenstein component at the tame cusps

Assume `R′ = ∅` and `𝔫 ≠ 1`, so that `χ` is primitive of conductor `𝔫` prime to `p` and `χ(𝔮) = 1` for every `𝔮 | p`; let `𝔠_p` be the part of the level `𝔫_S` supported above `p`. For each narrow class `λ`, with representative `t_λ` and `𝔡` the different of `F`, fix `A_λ = [[1, x_λ], [α_λ, y_λ]] ∈ SL_2(F)` with `α_λ ∈ 𝔠_p𝔡t_λ`, `x_λ ∈ 𝔡⁻¹t_λ⁻¹` and `y_λ ∈ 𝔫`, and write `c_λ(0, f|A)` for the normalized constant term of `f|A_λ` on the component `λ` (Dasgupta–Darmon–Pollack (58), p. 462). Let `k ≥ 3` be an integer at which `𝒢` is regular in weight `k − 1` and `f_{χ⁻¹}(1 − k) ≠ 0`, and let `a_k` be the coefficient of the ordinary series `E_k(χ, ω^{1−k})` of the pair `(χ, ω^{1−k})` (2.2a; the specialization of `E(χ, 1)`) in `e(E_1(1, χ)·ν_{k−1}(𝒢))`. Prove:

- for every ordinary series `E_k(η, φ_S)` of 2.2a at level `𝔫_S` and character `χω^{1−k}`, `c_λ(0, E_k(η, φ_S)|A) = 0` unless `η = χν⁻¹` and `φ = ω^{1−k}ν` for a character `ν` of `Cl⁺(F)`; for these the tuple `(c_λ(0, E_k(η, φ_S)|A))_λ` is `(κ_λ ν(t_λ))_λ` times a scalar, with `κ_λ ≠ 0` independent of `k` and `ν`, and for `ν = 1` the constant is `c_λ(0, E_k(χ, ω^{1−k})|A) = κ_λ · ⟨N𝔫⟩^{1−k} · 2^{−[F:ℚ]} f_{χ⁻¹}(1 − k)`;
- for every `f ∈ M_k(𝔫_S, χω^{1−k})` with `e f = 0`, `c_λ(0, f|A) = 0` for every `λ`; consequently `c_λ(0, (e f)|A) = c_λ(0, f|A)` for every `f ∈ M_k(𝔫_S, χω^{1−k})`;
- `c_λ(0, E_1(1, χ)|A) = κ_λ · 2^{−[F:ℚ]} L(χ⁻¹, 0)` with the same `κ_λ`, and `c_λ(0, ν_{k−1}(𝒢)|A) = 1`;
- consequently `a_k = ⟨N𝔫⟩^{k−1} L(χ⁻¹, 0)/f_{χ⁻¹}(1 − k)`, and the coefficient of the pair `(χ, ω^{1−k})` in `e·ν_k(F̃)` is `ν_k(W) − (f_χ(1 − k)/L(χ, 0))·a_k = 0` for the `W` of 2.4.

These are Dasgupta–Darmon–Pollack Propositions 2.3–2.5 and 2.7, pp. 462–467, stated there for a single prime above `p` and for the Eisenstein family `G_{k−1}(1, ω^{1−k})` in place of `𝒢`; the statement for several primes above `p` and for Ventullo's `𝒢` is proved here. The exponent `1 − k` in the constant of the first item is the one consistent with their Proposition 2.7 and (79), p. 469, which carry `⟨N𝔫⟩^{k−1}` in `a_k`; their Proposition 2.3 prints `⟨N𝔫⟩^{k−1}` in the constant (see the Checks). The route: for `k ≥ 3` the series is the absolutely convergent Eisenstein sum (Dasgupta–Darmon–Pollack (51), pp. 459–460), and only the lattice vectors whose image under `A_λ` has vanishing first coordinate contribute to the constant; the character sum over the residues of the second coordinate vanishes unless the second character is `ω^{1−k}ν`, and the remaining sum is converted by the functional equation (LFunctions Layer 5) into the value at `1 − k`, with the factor `N𝔫^{−k}φ(𝔫)⁻¹ = N𝔫^{−1}⟨N𝔫⟩^{1−k}` for `φ = ω^{1−k}`; the weight-one constant is the value at `s = 0` of Hecke's regularized series of gap:weight-one-hilbert-eisenstein-series, computed as in Dasgupta–Darmon–Pollack Proposition 2.4, p. 463, using `χ(pO_F) = 1`; `A_λ` lies in the level group of the component `λ` at level `𝔠_p`, and `y_λ ≡ 1` modulo `𝔠_p` because `y_λ − x_λα_λ = 1`, so `ν_{k−1}(𝒢)|A_λ`, of tame level one, has the standard constant `1` of 2.3. For the second item: `e` is the product of the commuting idempotents `e_𝔮 = lim_n U_𝔮^{n!}`, `𝔮 | p` (every eigenvalue of `U_𝔮` is integral), so its kernel is the sum of their kernels; cusp forms have zero constants at every cusp; and by the `U_𝔮`-item of 2.2a the kernel of `e_𝔮` on the Eisenstein complement is spanned by the translates `E_k(η′, φ)|B_𝔱` in which `η′` is `η` taken with modulus `lcm(𝔣_η, 𝔮)`, so that `E_k(η′, φ) = E_k(η, φ) − η(𝔮)E_k(η, φ)|B_𝔮` (which is `E_k(η, φ)` when `𝔮 | 𝔣_η`), and `𝔱·lcm(𝔣_η, 𝔮)·𝔣_φ | 𝔫_S`. In the Eisenstein sum of such a translate slashed by `A_λ`, a lattice vector contributing to the constant term has `η′`-argument of `𝔮`-adic valuation at least `v_𝔮(𝔠_p) − v_𝔮(𝔣_φ) − v_𝔮(𝔱) ≥ 1`, because `α_λ ∈ 𝔠_p𝔡t_λ`; so every term carries the value `0` of `η′` (Dasgupta–Darmon–Pollack, proof of Proposition 2.3, the case in which `𝔭` does not divide the modulus of the second character, pp. 462–463, and (73), p. 468, for a single prime above `p`). Finally decompose `e(E_1(1, χ)·ν_{k−1}(𝒢))` by 2.2a: being ordinary, it is a cusp form plus a combination of the ordinary series `E_k(η, φ_S)` (no prime-to-`p` translate occurs, since at each tame prime the conductor exponents of `η` and `φ` add up to at least that of `𝔫`, the tame conductor of `χω^{1−k}`); by the second item its constants at `A` are those of the unprojected product, which are the products of the constants of the third item, the expansions of a product of classical forms at every cusp being the products of the expansions (gap:weight-one-hilbert-forms-and-products); cusp forms have zero constants, and the remaining tuples are independent by the independence of the characters `ν` of `Cl⁺(F)`, so the coefficient of `E_k(χ, ω^{1−k})` is the stated `a_k`. *Needs:* 2.2, 2.2a, 2.2b, 2.3, 2.4, 2.5; OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) (through gap:weight-one-hilbert-eisenstein-series for `E_1(1, χ)`); NoncommutativeAndEquivariantIwasawa §F.5 (slash operators and expansions at every cusp, through gap:weight-one-hilbert-forms-and-products in weight one); LFunctions Layer 5; DirichletPadicLFunctions §0.6.

**Checks.**

- The exponent, over `F = ℚ`: at the cusp `A·∞ = 1/α` with `p | α`, `N | y`, the Eisenstein sum gives the constant of `E_k(χ, φ)|A` as a `k`-independent multiple of `φ(N)⁻¹N^{−k}L(1 − k, χ⁻¹φ)`, the factor `φ(N)⁻¹N^{−k}` coming from the conductor `Np` of `χφ⁻¹` in the functional equation and from `τ(χφ⁻¹) = χ(p)φ(N)⁻¹τ(χ)τ(φ⁻¹)`. For `N = 4`, `p = 5`, `k = 3` and `φ = ω^{−2}` this factor is `ω(4)²/4³ = 1/64 = 4^{−1}·⟨4⟩^{−2}` (`ω(4) = −1`, `⟨4⟩ = −4`), so the constant carries `⟨N⟩^{1−k}` and `a_3` carries `⟨4⟩² = 16`; the printed exponent `k − 1` would put `⟨4⟩² = 16` in place of `⟨4⟩^{−2} = 1/16` in the constant, and `1/16` in place of `16` in `a_3`.
- At the standard cusps the pair `(χ, ω^{1−k})` is invisible when `𝔫 ≠ 1`: the standard constants of `E_k(χ, ω^{1−k})` are `0` (2.2a), so the standard-constant equations of 2.6 do not determine its coefficient, while at `A` its constant `κ_λ⟨N𝔫⟩^{1−k}2^{−[F:ℚ]}f_{χ⁻¹}(1 − k)` is nonzero.
- For `𝔫 = 1` the factor is `⟨1⟩^{k−1} = 1` and the coefficient `L(χ⁻¹, 0)/f_{χ⁻¹}(1 − k)` is read from the standard constants (Dasgupta–Darmon–Pollack (71), p. 466), in agreement with `ε(𝔫) = 1` in 2.4.
- The non-ordinary members, over `F = ℚ` with `𝔫 = (4)`, `p = 5` and `k = 5`, where `ω^{1−k} = 1` and the level is `20`: the Eisenstein complement is spanned by `E = E_5(χ_4, 1)`, `E|B_5`, `E_5(1, χ_4)` and `E_5(1, χ_4)|B_5`, and `U_5` has the eigenvalues `1, 5⁴, 1, 5⁴` on it. With `κ` the single `κ_λ` (`Cl⁺(ℚ)` is trivial), at the cusp `A·∞ = 1/5` the forms `E` and `E|B_5` have the same constant `c = κ⟨4⟩^{−4}L(−4, χ_4)/2 = 5κ/1024` (`L(−4, χ_4) = 5/2`, `⟨4⟩ = −4`). The non-ordinary `E − χ_4(5)E|B_5` has constant `(1 − χ_4(5))c = 0`, as the second item asserts, while the ordinary `E − 5⁴E|B_5` has constant `−624c = κ⟨4⟩^{−4}2^{−1}f_{χ⁻¹}(−4)` with `f_{χ⁻¹}(−4) = (1 − 5⁴)L(−4, χ_4)`, as the first item asserts. Reading `a_5` from the unprojected product without the second item leaves the coefficient of `E − E|B_5` uncontrolled; a nonzero constant there would change `a_5`.

### 2.6 The ordinary Eisenstein boundary and the normalized cuspidal projection

Prove that there is `t ∈ T̃_(1)` such that `F = t·e·F̃ ∈ S°(𝔫, χ)_(1)` and `ν_1(t) E_1(1, χ_S) = E_1(1, χ_S)` (Dasgupta–Kakde–Ventullo Theorem 3.2, p. 849, in the normalized form of the preprint, Theorem 3.2, p. 16; Dasgupta–Darmon–Pollack Lemma 2.9 and Corollary 2.10, pp. 469–470, Propositions 3.3–3.4 and Lemma 3.5, pp. 472–474). The route: at each classical weight `k ≥ 3` in a neighbourhood of `1` (an infinite set of weights, which determines a family), the specialization of `e·F̃` lies in `M_k(𝔫_S, χω^{1−k})` and has vanishing standard constants (each `U_𝔮`, `𝔮 | p`, permutes the standard constants among the narrow-class components, so `e` preserves their vanishing); by 2.2a it is a cusp form plus a combination of the translates `E_k(η, φ)|B_𝔱`, `(η, φ, 𝔱) ∈ P(𝔫_S, χω^{1−k})`. Group these by the primitive pair, which is determined by its eigensystem away from `𝔫p` (2.2a). At a general level 2.2a retains every admissible prime-to-`p` translate of its ordinary stabilization, and gives zero if `η` is ramified above `p`. Here the tame conductor of `ηφ = χω^{1−k}` is exactly `𝔫`, since `ω` is ramified only above `p`. At each tame prime `λ`, both characters are trivial on the local unit filtration at depth `v_λ(𝔣_η) + v_λ(𝔣_φ)`, so `v_λ(𝔫) ≤ v_λ(𝔣_η) + v_λ(𝔣_φ)`, while `𝔱𝔣_η𝔣_φ | 𝔫_S` gives `v_λ(𝔱) + v_λ(𝔣_η) + v_λ(𝔣_φ) ≤ v_λ(𝔫)`. Hence `v_λ(𝔱) = 0` at every tame prime, and the only prime-to-`p` translate is `𝔱₀ = 1`. Thus each surviving pair contributes just `E_k(η, φ_S)` at this minimal tame level. For each pair with `η ∉ {1, χ}` choose by Chebotarev a prime `λ ∤ 𝔫p` with `η(λ) ∉ {1, χ(λ)}` (possible because `ker η ∪ ker(ηχ⁻¹)` is a union of two proper subgroups) and use `T_λ − η(λ) − η⁻¹χ(λ)ε(λ) ∈ T̃`: its weight-`k` value kills that pair, because `φ(λ)Nλ^{k−1} = η⁻¹χω^{1−k}(λ)Nλ^{k−1} = ν_k(η⁻¹χε(λ))`, and its weight-one eigenvalue on `E_1(1, χ_S)` is `(1 − η(λ))(1 − χη⁻¹(λ)) ≠ 0`. These operators preserve vanishing of the standard constants. The ordinary member of the pair `(1, χω^{1−k})` has every standard constant equal to `2^{−[F:ℚ]} f_χ(1 − k)`, which is nonzero for `k ≠ 1` near `1` because `f_χ` is a nonzero analytic germ (0.5), so the standard-constant equations remove it. When `R′ = ∅` the pair `η = χ`, `φ = ω^{1−k}` cannot be separated from `E_1(1, χ_S)` by operators normalized at weight one, since every generator of `T̃` has eigenvalues congruent modulo `π` on `E(χ, 1)` and `E(1, χ)`; its coefficient in `e·ν_k(F̃)` is already zero: for `𝔫 = 1` because its standard constants `2^{−[F:ℚ]}χ⁻¹(λ)f_{χ⁻¹}(1 − k)` form a tuple proportional to `(χ⁻¹(λ))_λ`, independent of the constant tuple of the pair `(1, χω^{1−k})` since `χ` is then a nontrivial character of `Cl⁺(F)`, so the standard-constant equations remove both; for `𝔫 ≠ 1` by 2.5a and the factor `ε(𝔫)` of 2.4. In Case 1 the system `η = χ` can have the same away-from-`𝔫p` eigenvalues as `E_1(1, χ_S)`; if it survives the ordinary projector use `U_𝔮 − χ(𝔮)` for a `𝔮 ∈ R′`, which kills it and acts on `E_1(1, χ_S)` by `1 − χ(𝔮) ≠ 0`. Normalize the product so that its eigenvalue on `E_1(1, χ_S)` is `1`. The family `𝒢` is Ventullo's, so no Leopoldt hypothesis enters. *Needs:* 0.5, 2.2, 2.2a, 2.3, 2.4, 2.5, 2.5a; ClassFieldTheory Layer 7 (local conductors defined by the unit filtration); PadicFamilies §5.10 (through gap:dyadic-hilbert-hida-localization and gap:p-ramified-hilbert-hida-localization where `p = 2` or `𝔣_p ≠ 1`); OrdinaryAutomorphicFormsAndModularityLifting §2.12(a); Chebotarev Layer 10.

The normalization `ν_1(t)E_1(1, χ_S) = E_1(1, χ_S)` is part of the statement: `t = 0` satisfies the bare existence statement. On the finite weight-one space spanned by the stabilized Eisenstein series `E_1(1, χ_{R′ ∪ J})`, `t` acts by `1` plus a nilpotent and is invertible, which preserves the independence used in 3.8–3.10. The projected family `F` has the same Hecke-leading identities as `F̃`, since `t` and `e` commute with all Hecke operators; when `w = −1`, `ν_1(F) = 0`.

### Examples

For `F = ℚ(√5)`, `p = 11` and `H = F(√α)` with `α = −4 − √5`, whose two real conjugates are negative, so that `H` is CM and its quadratic character `χ` is totally odd: `11` splits in `F` as `𝔮_1𝔮_2` with `√5 ≡ 4` modulo `𝔮_1` and `√5 ≡ 7` modulo `𝔮_2`, and `Nα = 11`. Modulo `𝔮_1`, `α ≡ −8 ≡ 3 = 5²` is a unit square, so `𝔮_1` splits in `H` and `χ(𝔮_1) = 1`; at `𝔮_2`, `α ≡ −11` has valuation one, so `𝔮_2` ramifies and `χ(𝔮_2) = 0`. Thus `R = {𝔮_1}`, `R′ = {𝔮_2}`, `r = 1`: a Case 1 datum with `𝔮_2 | 𝔣_p`, whose families come through gap:p-ramified-hilbert-coefficient-families. Here `D_χ = L(χ, 0)` and `F̃ = E(1, χ) − E_1(1, χ_{R′}) 𝒢^♭ ℒ_χ/D_χ` has leading correction `−L^*_an(χ)π E_1(1, χ_{R′})` when `s = 1`. Over `F = ℚ` Case 1 does not occur: the only prime above `p` lies in `R` when `r ≥ 1`, so `R′ = ∅`. In Case 2 with `w = −1` the weight-one specialization of `F̃` is zero, while `F̃` itself is a nonzero family.

### Dependencies

Layer 0 (for the analytic invariants); NoncommutativeAndEquivariantIwasawa §F.5 and PadicFamilies §§5.9a–5.11, with gap:dyadic-hilbert-coefficient-families, gap:dyadic-hilbert-hida-localization, gap:p-ramified-hilbert-coefficient-families, gap:p-ramified-hilbert-hida-localization, gap:reversed-ordinary-eisenstein-family and gap:weight-one-hilbert-forms-and-products; OrdinaryAutomorphicFormsAndModularityLifting §2.12(a), with gap:weight-one-hilbert-eisenstein-series; Tau Ceti elliptic Eisenstein decomposition and ModularForms §0.1 (the case `F = ℚ` of 2.2a); IntegralIwasawaTheory §§0.1, 9.3; LFunctions Layer 5; DirichletPadicLFunctions §0.6; ClassFieldTheory Layer 7; Chebotarev Layer 10; Mathlib Weierstrass division and preparation for power series (2.3).

## Layer 3: infinitesimal Hecke quotients

Throughout, `a = L^*_an(χ) ≠ 0`, `s = s_χ ≥ r ≥ 1`, and `ε_J = ∏_{j∈J} ε_j` for `J ⊆ {1, …, r}`. Checks of the quotient algebras also use formal parameters satisfying the displayed algebraic hypotheses; such a ring need not arise from a Gross–Stark datum.

### 3.1 The Case 1 Artin algebra

Define `W_1 = E[π, ε_1, …, ε_r] / (π^{s+1}, ε_i², πε_i, ε_1⋯ε_r + (−1)^s a π^s)`, a `Λ_(1)`-algebra by sending the uniformizer to `π`, with augmentation sending `π` and every `ε_i` to `0` (Dasgupta–Kakde–Ventullo Theorem 3.3, pp. 850–852). *Needs:* 2.1, 2.4.

The API includes:

- In `W_1`, `π^{s+1} = ε_i² = πε_i = 0` and `∏_i ε_i = (−1)^{s+1} a π^s`.
- The augmentation has residue field `E` and kernel `𝔪 = (π, ε_1, …, ε_r)`, which is nilpotent.
- For an `E`-algebra `B` and commuting elements of `B` satisfying the displayed relations there is a unique `E`-algebra map `W_1 → B` sending the generators to them.

**Checks.**

- For `r = s = 1`: `ε_1 = aπ` and `W_1 ≅ E[π]/(π²)`, of dimension `2 = 2^1 + 1 − 1`.
- For `r = 1`, `s = 2`: `ε_1 = −aπ²`, nonzero in `W_1` but zero in `𝔪/𝔪²`.
- For `r = 2`: `ε_1² = 0` but `ε_1ε_2 = (−1)^{s+1}aπ^s ≠ 0`; setting all products of distinct `ε_i` to zero gives a different ring.
- The empty product is never imposed: for `r = 0` and `s ≥ 1` the relation would read `1 + (−1)^s aπ^s = 0`, making the nilpotent `π` invertible and the ring zero. At the arithmetic rank-zero values `s = 0`, `a = 1`, it reads `2 = 0`, again giving the zero ring over `E`; for the unrelated formal value `s = 0`, `a = −1`, it imposes no relation and the quotient is `E`. None is the positive-rank construction.

### 3.2 The Case 2 Artin algebra

For `R′ = ∅`, `W ∈ Λ_(1)` with `w = ν_1(W) ≠ 0`, define `W_2 = E[π, ε_1, …, ε_r, y] / (π^{s+1}, y^{s+1}, y(π − y), π^s W − y^s (W + 1), ε_i², πε_i, yε_i, ∏ε_i + (−1)^s a(π^s − y^s))`, where `W` stands for its `π`-Taylor polynomial modulo `π^{s+1}` (Dasgupta–Kakde–Ventullo §3.4, the definition before Theorem 3.6, p. 853). *Needs:* 2.1, 2.4.

The API includes:

- In `W_2`, `yπ = y²` (so `π^k y = y^{k+1}`) and `ε_iπ = ε_iy = ε_i² = 0`.
- `π^s W = wπ^s` and `y^s(W + 1) = (w + 1)y^s`, hence `wπ^s = (w + 1)y^s`, including for `w = −1`.
- `∏_i ε_i = (−1)^{s+1} a (π^s − y^s)`.
- Commuting elements of an `E`-algebra satisfying the relations define a unique map from `W_2`.

**Checks.**

- For `r = s = 1` and `w ∉ {0, −1}`: `y = wπ/(1 + w)` and `ε_1 = aπ/(1 + w)`.
- For `w = −1`: `π^s = 0` while `y^s ≠ 0`, and `(π − y)^s = −y^s ≠ 0`; for `r = s = 1` the ring is `E[y]/(y²)` with `ε_1 = −ay`.
- For `w ≠ 0`, `π^s − y^s = y^s/w`; replacing the difference `π^s − y^s` by `π^s` in the top relation would make `∏ε_i = 0` when `w = −1` and lose that case.

### 3.3 The Case 3 Artin algebra

For `R′ = ∅` and `s > t ≥ r`, write `W = π^{s−t} W_0` with `c = ν_1(W_0) = (−1)^{s−t} L^*_an(χ)/L^*_an(χ⁻¹) ≠ 0`, and define `W_3 = E[π, ε_1, …, ε_r, y] / (π^{s+1}, y^{t+1}, y(π − y), π^t W − y^t, ε_i², πε_i, yε_i, ∏ε_i + (−1)^s aπ^s)` (Dasgupta–Kakde–Ventullo §3.5 and Theorem 3.8, pp. 855–856). *Needs:* 2.1, 2.4.

The API includes:

- `y^t = cπ^s`, since `π^t W = cπ^s` modulo `π^{s+1}`.
- `∏_i ε_i = (−1)^{s+1} aπ^s = (−1)^{t+1} L^*_an(χ⁻¹) y^t`.
- `y^{t+1} = π^{s+1} = ε_i² = πε_i = yε_i = 0` and `yπ = y²`.
- Commuting elements satisfying the relations define a unique map from `W_3`.

**Checks.**

- For `r = t = 1`, `s = 2`: `y = cπ²`, `ε_1 = −aπ²`, and `W_3` has basis `1, π, π²`.
- In that example `y ≠ 0` has zero class in `𝔪/𝔪²`, but `yW_3/y²W_3 = E·y` is one-dimensional.
- For `s = t + 1`, `c = −L^*_an(χ)/L^*_an(χ⁻¹)` and the inverse-character top product has sign `(−1)^{t+1}`; with `c` of the wrong sign the two expressions for `∏ε_i` disagree.

### 3.4 Normal form in Case 1

Prove that `1, π, …, π^{s−1}` together with `ε_J` for every nonempty `J ⊆ {1, …, r}` is an `E`-basis of `W_1`, so `dim_E W_1 = 2^r + s − 1`; equivalently one may use `π^s` and omit `ε_R`, where `R` also denotes the index set `{1, …, r}`. Prove that `π^r` has nonzero class in `𝔪^r/𝔪^{r+1}` (Dasgupta–Kakde–Ventullo, proof of Theorem 3.3, pp. 851–852; §5.1, p. 867). The route: every monomial with a repeated `ε_i` or a mixed `πε_i` factor is zero, leaving powers of `π` and squarefree `ε`-products; the top relation with `a ≠ 0` eliminates `π^s` or `ε_R`; multiplication on the proposed basis is well defined because the only overlap involves the top term multiplied by `𝔪`, which is zero both ways. If `s = r`, `𝔪^{r+1} = 0` and `π^r = ±a⁻¹ε_R ≠ 0`; if `s > r`, `𝔪^{r+1}` is spanned by `π^{r+1}, …, π^s`. *Needs:* 3.1.

The count uses `2^r`, not `2^s`: for `r = 2`, `s = 3`, the dimension is `6`.

### 3.5 Normal form in Case 2

Prove that `1, π, …, π^{s−1}`, `y, …, y^s` and `ε_J` for `∅ ≠ J ⊊ {1, …, r}` form an `E`-basis of `W_2`, so `dim_E W_2 = 2^r + 2s − 2`. With `z = π − y`, prove `z^n = π^n − y^n` for `n ≥ 1`, `yz = 0`, and that `z^r` has nonzero class in `𝔪^r/𝔪^{r+1}`; the whole degree-`r` graded piece is not claimed to be one-dimensional when `s > r` (Dasgupta–Kakde–Ventullo, proof of Theorem 3.6, pp. 854–855; §5.1, pp. 867–868). The route: `πy = y²` reduces mixed monomials to powers of `y`; `w ≠ 0` eliminates `π^s = (w + 1)y^s/w` (also at `w = −1`, where it gives `π^s = 0`) and the top relation eliminates `ε_R = (−1)^{s+1}a y^s/w`; overlaps of top relations are annihilated by `𝔪`. For `r = s`, `z^r = y^s/w` spans `𝔪^r` and `𝔪^{r+1} = 0`; for `r < s`, `π^r − y^r` is a combination of two basis vectors not in the span of `𝔪^{r+1}`. *Needs:* 3.2.

At `w = −1` the surviving top element is `y^s`, not `π^s`. The published dimension count is corrected to `2^r + 2s − 2`; for `r = 2`, `s = 3` it is `8`.

### 3.6 Normal forms and two filtrations in Case 3

Prove that `1, π, …, π^s`, `y, …, y^{t−1}` and `ε_J` for `∅ ≠ J ⊊ {1, …, r}` form an `E`-basis of `W_3`, so `dim_E W_3 = 2^r + s + t − 2`; that `z^r` has nonzero class in `𝔪^r/𝔪^{r+1}`; and that `𝔪·yW_3 = y²W_3` and, for `1 ≤ n ≤ t`, `y^nW_3/y^{n+1}W_3` is one-dimensional over `E`, spanned by `y^n` (Dasgupta–Kakde–Ventullo Theorem 3.8, p. 856; §5.2, pp. 867–868). The route: reduce with `πy = y²`, replace `y^t` by `cπ^s` and `ε_R` by its multiple of `π^s`; multiplying either top relation by `𝔪` gives zero, so overlaps agree. Since `r ≤ t < s`, the term `π^r` of `z^r` cannot lie in `𝔪^{r+1}`, and when `r = t` the term `y^r = cπ^s` already lies in `𝔪^{r+1}`. Multiplying `y` by `π` or `y` gives `y²` and by `ε_i` gives `0`, so `y^nW_3` is spanned by `y^n, …, y^t` with `y^t = cπ^s ≠ 0`. *Needs:* 3.3.

The `y`-adic filtration differs from the `𝔪`-adic one: `y^t ∈ 𝔪^s`. The final line `y^rW_3/y^{r+1}W_3` must not be replaced by `𝔪^r/𝔪^{r+1}`, in which `y^r` vanishes when `r = t < s`.

### 3.7 The Fourier Hecke orbit and the auxiliary operator

Let `F = t·e·F̃` (2.6) and `c : S°(𝔫,χ)_(1) → ∏_𝔞 Λ_(1)` the injective Fourier map (PadicFamilies §5.11). Define `ℋ` as the image of the Hecke span of `F` under `c` modulo `π^{s+1}`, a finite `E[π]/(π^{s+1})`-module, and `φ : T → End_E(ℋ)` the induced action. When `R′ = ∅`, choose a prime `𝔮 ∤ 𝔫p` with `χ(𝔮) ≠ 1` and define `Y = (T_𝔮 − 1 − χε(𝔮)) / ((χ(𝔮) − 1)(1 − ε(𝔮))/π) ∈ T̃_(1)`, whose denominator is a unit of `Λ_(1)` with residue `−(χ(𝔮) − 1) log_p⟨N𝔮⟩ ≠ 0`; write `y` for its image (Dasgupta–Kakde–Ventullo §3.3, (32), p. 850; §3.4, (40) and the definition of `Y`, p. 853). *Needs:* 2.1, 2.6; PadicFamilies §5.11 (through gap:dyadic-hilbert-hida-localization and gap:p-ramified-hilbert-hida-localization where `p = 2` or `𝔣_p ≠ 1`); Chebotarev Layer 10; DirichletPadicLFunctions §0.6.

The API includes:

- `ℋ` is a finite module over `E[π]/(π^{s+1})`, generated as a `T`-module by `c(F)`.
- `φ` is the algebra homomorphism given by the actual Hecke action on `ℋ`; an operator killing `F` kills `ℋ`.
- `Y F̃ ≡ π E(χ, 1) W (mod π^{s+1})` and `Y² = πY` on `ℋ`.
- Changing the prime `𝔮` changes the representative `Y` but not its image `y` once 3.9 or 3.10 identifies the Hecke image.

**Checks.**

- An operator killing `F` kills every element of its orbit by commutativity of the Hecke algebra; a noncommuting operator algebra would not have this property.
- `π^{s+1}` acts as zero on `ℋ`, while the order-`s` terms used in the normal forms remain visible.
- If `χ(𝔮) = 1` the denominator of `Y` lies in `πΛ_(1)` and is not a unit; if `χ(𝔮) ≠ 1` its residue is `−(χ(𝔮) − 1)log_p⟨N𝔮⟩`, nonzero because `⟨N𝔮⟩ ≠ 1` for an integer `N𝔮 ≥ 2` (at `p = 2`, `⟨N𝔮⟩ = ±N𝔮`).

### 3.8 The Hecke image in Case 1

Prove that in Case 1 the image of `T ⊗ E` in `End_E(ℋ)` is isomorphic to `W_1`, giving a `Λ`-algebra homomorphism `T → W_1` with `T_𝔩 ↦ 1 + χε(𝔩)` for `𝔩 ∤ 𝔫p`, `U_𝔩 ↦ 1` for `𝔩 | 𝔫` or `𝔩 ∈ R′`, and `U_{𝔮_i} ↦ 1 + ε_i` (Dasgupta–Kakde–Ventullo Theorem 3.3 and its proof, pp. 850–852). The route: the leading correction and the `U_𝔮` identities of 2.2 give `ε_i² = πε_i = 0` and the top relation; this yields a surjection from `W_1`; on the proposed basis applied to `F`, distinct `π`-orders separate `1, π, …, π^{s−1}`, and at order `s` the squarefree operators give nonzero multiples of distinct stabilized `E_1(1, χ_{R′∪J})`, whose `q`-expansions are independent by a triangular argument on prime-power ideals with each pattern of divisibility by the `𝔮_i`; `t` acts invertibly on that space and `e` as the identity. *Needs:* 2.2, 2.5, 2.6, 3.4, 3.7.

The argument proves the top product nonzero even when `s > r`.

### 3.9 The Hecke image in Case 2

Prove that in Case 2 the image is isomorphic to `W_2`, with `T_𝔩 ↦ 1 + χε(𝔩) + (χ(𝔩) − 1)((1 − ε(𝔩))/π) y` for `𝔩 ∤ 𝔫p`, `U_𝔩 ↦ 1 + ((ε(𝔩) − 1)/π) y` for `𝔩 | 𝔫`, and `U_{𝔮_i} ↦ 1 + ε_i` (Dasgupta–Kakde–Ventullo Theorem 3.6 and its proof, pp. 853–855; Remark 3.7, p. 855). The route: compute on `F̃` that `Y² = πY`, `Y^{s+1} = 0`, `π^sW = Y^s(W + 1)`, `ε_i² = πε_i = Yε_i = 0` and the top relation, and pass through `t·e`; this gives a surjection from `W_2`. For `w ≠ −1` compare the leading terms of `π^jF` and `Y^jF` and apply `Y`: the coefficients `α, β` satisfy `α(1 + w) + βw = 0` and `α + β = 0`, hence vanish; proceed by order below `s`. For `w = −1` begin with the pair `F, YF`, then `πF, Y²F`, and at the last order use that `Y` kills `ε_JF` and `Y^sF` while `π^{s−1}YF` has nonzero leading term. The remaining stabilized Eisenstein `q`-expansions are independent by the triangular argument. *Needs:* 2.2, 2.5, 2.6, 3.5, 3.7.

For `r = s = 1` and `w ∉ {0, −1}`, `W_2 = E[π]/(π²)` with `y = wπ/(1 + w)` (3.2), and the image of `U_𝔩` for `𝔩 | 𝔫` is `1 + (w/(1 + w)) log_p⟨N𝔩⟩ π`, which need not be `1`. For `r = 1` and `s ≥ 2` there is no such formula: by 3.5 the classes of `π` and `y` are independent in `𝔪/𝔪²` (for `s = 2` the basis is `1, π, y, y²`), so the image of `U_𝔩` is `1 + log_p⟨N𝔩⟩ y` modulo `𝔪²` and is not a polynomial in `π`. The proof of 3.9 itself never divides by `w + 1`.

### 3.10 The Hecke image in Case 3

Prove that in Case 3 the image is isomorphic to `W_3`, with the formulas of 3.9 (Dasgupta–Kakde–Ventullo Theorem 3.8 and its proof, p. 856). The route: the Case 2 computation does not use `w ≠ 0`; the stronger identities `Y^{t+1}F = 0` and `Y^tF = π^tWF` give a surjection from `W_3`. Put `d = s − t ≥ 1`: `π^jF` has order `j` with leading term `E_1(1, χ_S)`, `Y^iF` has order `d + i` with leading term `cE_1(1, χ_S)`, `Y^tF = cπ^sF`, and `Y` kills every `ε_JF` with `J ≠ ∅`. In a relation among the basis vectors, increasing orders first remove the coefficients of `π^jF` for `j ≤ d`; then for `m = 1, …, t − 1` apply `Y^{t−m}`: terms `π^jF` with `j ≥ d + m` vanish modulo `π^{s+1}` (their order is at least `2s − t ≥ s + 1`), terms `Y^iF` with `i > m` vanish, and the remaining term is the coefficient of `Y^mF` times `cπ^sF`; then comparing order `d + m` removes the coefficient of `π^{d+m}F`. Finally `π^sF` and the `ε_JF`, `∅ ≠ J ⊊ R`, have independent stabilized Eisenstein leading terms. *Needs:* 2.2, 2.5, 2.6, 3.6, 3.7.

The proof uses only `s > t ≥ r`. When `t = 1` there are no basis vectors `Y^iF` and the argument goes directly to the final comparison.

### Examples

In `W_2` with `r = s = 1` and `w = −1`, `π = 0`, `ε_1 = −ay` and `z = −y ≠ 0`: the family has zero weight-one specialization but a nonzero first-order Hecke image. In `W_3` with `r = t = 1`, `s = 2`, put `b = L^*_an(χ⁻¹)` and `c = −a/b`: then `y = cπ²` and `ε_1 = −aπ² = by`; the ring has basis `1, π, π²`, and its `y`-line vanishes in `𝔪/𝔪²` but survives in `yW_3/y²W_3`.

### Dependencies

Layer 2; PadicFamilies §5.11 (through gap:dyadic-hilbert-hida-localization and gap:p-ramified-hilbert-hida-localization where `p = 2` or `𝔣_p ≠ 1`); Chebotarev Layer 10; DirichletPadicLFunctions §0.6.

## Layer 4: the arithmetic Galois class

Throughout, `r ≥ 1`, `W` is the Artin algebra of the relevant case, and `φ : T → W` is the homomorphism of Layer 3.

### 4.1 The actual Hida representations and the coefficient ring

Let `𝔪` be the height-one prime of `T` determined by `T → W → E` (generated by `T`, `T_𝔩 − (1 + χε(𝔩))` for `𝔩 ∤ 𝔫p`, and `U_𝔩 − 1` for `𝔩 | 𝔫p`), `A = T_(𝔪)` and `Â` its `𝔪`-adic completion, with residue field `E`. Prove: `A` is a reduced Noetherian local ring; `Â` is finite over the completion of `Λ_(1)`; `Â` is reduced, `Â ↪ K` for its total quotient ring `K`, and `K` is a finite product of fields, each receiving the coefficient field `L_H` of one cuspidal eigenfamily `H` specializing to `E_1(1, χ_S)`; and the product of the representations `ρ_H : G_F → GL_2(L_H)` supplied through the gap `hida-family-representations-all-degrees` gives `ρ : G_F → GL_2(K)` with `trace ρ(Frob_𝔩) = T_𝔩` and `det ρ(Frob_𝔩) = χε(𝔩)` for `𝔩 ∤ 𝔫p` and with the ordinary local shape `[[χεη_𝔮⁻¹, ∗], [0, η_𝔮]]` at every `𝔮 | p`, where `η_𝔮` is unramified with `η_𝔮(rec(ϖ⁻¹)) = U_𝔮` (Dasgupta–Kakde–Ventullo §4 and Theorem 4.1, pp. 856–858; (63)–(64), pp. 860–861). Prove also that for every `σ ∈ G_F` the characteristic polynomial of `ρ(σ)` has coefficients in the image of `T` in `K`, hence in `A`, and is congruent to `(X − 1)(X − χ(σ))` modulo `𝔪`. The route: PadicFamilies §§5.12–5.13 give reducedness and the total quotient ring of `A`; `Â` is a direct factor of `T ⊗_Λ Λ̂_(1)`, finite over `Λ̂_(1)`; `Â` is reduced because `A` is: `Λ` is a complete Noetherian local ring, `T` is finite over `Λ` and `A` is a localization of `T`, so `A` is excellent and in particular a local G-ring (SchemeAndStackFoundations §0.21, `excellent_examples`), its completion map `A → Â` is regular, and a regular map between Noetherian rings carries the reduced `A` to a reduced `Â` (`regular_map_completion`); the image of `T` in `∏_H L_H`, the coefficient orders `Λ_H` and their Eisenstein ideals `𝔪_H` are finite `Λ`-modules, hence closed for the Λ-adic topology, so Frobenius-dense identities and congruences extend to all of `G_F` by continuity (IntegralHeckeAndGaloisDeterminants §4.1). *Needs:* 3.8–3.10; PadicFamilies §§5.12–5.13 (through gap:dyadic-hilbert-hida-localization and gap:p-ramified-hilbert-hida-localization where `p = 2` or `𝔣_p ≠ 1`); OrdinaryAutomorphicFormsAndModularityLifting §2.12(b) (through gap:hida-family-representations-all-degrees); SchemeAndStackFoundations §0.21; IntegralHeckeAndGaloisDeterminants §4.1; Chebotarev Layer 10.

The residue characteristic of `Â` is zero, so `1 ≠ χ` residually also at `p = 2`. The determinant is `χε`, not `χ`. `A` is not claimed to be finite over the uncompleted `Λ_(1)`, and the off-diagonal modules below are not assumed free of rank one.

**Checks.**

- `T_𝔩 ↦ 1 + χε(𝔩) ↦ 1 + χ(𝔩)` and `U_𝔩 ↦ 1` under `T → W → E`, since `ε(𝔩) ≡ 1` modulo `π`; so `𝔪` contains `T`, `T_𝔩 − (1 + χε(𝔩))` and `U_𝔩 − 1`, which generate it, `𝔪 ∩ Λ = (T)`, and `𝔪` has height one with residue field `E` of characteristic zero. The maximal ideal `(𝔪, ϖ_E)` is a different object: for `F = ℚ`, `H = ℚ(√−7)`, `χ` the quadratic character of conductor `7` and `p = 2` (which splits in `H`, so `r = 1`), `χ ≡ 1` modulo `ϖ_E`, and the characters `1` and `χ` coincide in the residue field of the maximal ideal but differ in `E`.
- In every factor, complex conjugation `c` at a real place has `det ρ_H(c) = χε(c) = −1`, because `ε_cyc(c) = −1`, `⟨−1⟩ = 1` and so `ε(c) = 1`; with `ρ_H(c)² = 1` the eigenvalues are `1` and `−1` and the trace is `0`. A determinant `χ` in place of `χε` gives the same value at `c`; the two are told apart at `Frob_𝔩`, where `χε(𝔩) ≡ χ(𝔩)(1 + log_p⟨N𝔩⟩ π)` modulo `π²` differs from `χ(𝔩)` because `⟨N𝔩⟩ ≠ 1` for the integer `N𝔩 ≥ 2`.
- The factors of `K` are not in bijection with the eigenfamilies: take the two-dimensional local domain `Λ_H = 𝒪_E[[T]][y]/(y² − T²(T + p))` with `√p ∈ E` (finite over `𝒪_E[[T]]`, so of dimension `2`, with the prime chain `(0) ⊊ (T, y) ⊊ (ϖ_E, T, y)`; a domain, since `T + p` is not a square in `𝒪_E[[T]]`). Its localization at the height-one prime `(T, y)`, the unique prime above `(T)`, is a one-dimensional local domain with residue field `E`, and the completion of that localization is `E[[T]][y]/((y − Ts)(y + Ts))` with `s = √(T + p) ∈ E[[T]]^×`, reduced with two minimal primes, and its total quotient ring `E((T)) × E((T))` has two fields receiving the single field `L_H`. This tests the ring interface only and asserts no family realizing it.

### 4.2 A simultaneous good Galois element

Prove that there is `τ ∈ G_F` with `χ(τ) ≠ 1` such that, for every eigenfamily `H` and every `𝔮 | p` (in `R` and in `R′`), the ordinary invariant line of `ρ_H|G_𝔮` is neither eigenline of `ρ_H(τ)`; the two eigenvalues of `ρ(τ)` lie in `Â` with residues `1` and `χ(τ)` (Dasgupta–Kakde–Ventullo Lemmas 4.2–4.3, pp. 858–860; Lemmas 4.6–4.7, p. 864). The route: for a line `v` its stabilizer `G_v` is closed; if `χ(G_v) ≠ 1` and `G_v` had finite index, diagonalize an element of `G_v` with distinct residual eigenvalues, take the lower entry in the order `(1, χ)` (a χ-cocycle), or in the reversed order the lower entry times `χ⁻¹` (a χ⁻¹-cocycle), restrict to `G_v`, where it vanishes, use injectivity of finite-index restriction on `E`-coefficients and the coboundary normalization at the diagonal element, and conclude by Nakayama on the finite off-diagonal module that `ρ_H` is reducible, a contradiction. So each relevant stabilizer is either contained in `ker χ` or of infinite index, hence closed with empty interior; a finite union of such sets cannot cover the nonempty open coset `{χ = χ(τ_0)}` with `χ(τ_0) ≠ 1`; Hensel's lemma gives the eigenvalues. *Needs:* 4.1; IntegralHeckeAndGaloisDeterminants §1.3; ArithmeticGaloisDuality §R02.2.3; Mathlib `HenselianRing`.

The line-avoidance is required at every `𝔮 | p`, not only at `𝔮 ∈ R`: 4.6 and 4.7 divide by the local comparison coefficients at `𝔮 ∈ R′`. Only ordinary invariant lines are used.

### 4.3 The adapted extension class

Using `τ`, write `ρ(σ) = [[a(σ), b(σ)], [c(σ), d(σ)]]` in a basis of eigenvectors with `ρ(τ) = diag(λ_1, λ_2)`, `λ_1 ≡ 1`, `λ_2 ≡ χ(τ)`. Define `B ⊆ K` as the `Â`-module generated by the `b(σ)`, `B̄ = B/𝔪B`, and `κ(σ) = b̄(σ)χ⁻¹(σ)`; prove that `a(σ), d(σ) ∈ Â` with residues `1` and `χ(σ)`, that `B` is a finite `Â`-module, that `B̄` is a finite-dimensional `E`-space on which `κ` is continuous for the `p`-adic topology, and that `κ` is a continuous cocycle for the action `χ⁻¹` with `κ(τ) = 0`, defining `[κ] ∈ H¹(G_F, B̄(χ⁻¹))` (Dasgupta–Kakde–Ventullo §4.2, (65)–(69), pp. 861–862). The route: the henselian multiplicity-free GMA theorem (IntegralHeckeAndGaloisDeterminants §1.3) gives the idempotents and integrality of the diagonal; the extension-module identification and injection (§1.4) interpret the upper off-diagonal span; finite generation is proved by clearing denominators through the finite coefficient orders `Λ_H` and their lattices before passing to `Â` and `B̄`; the cocycle identity comes from `b(στ) = a(σ)b(τ) + b(σ)d(τ)` after reduction and multiplication by `χ⁻¹(στ)`. *Needs:* 1.1, 4.1, 4.2; IntegralHeckeAndGaloisDeterminants §§1.3, 1.4.

The API includes:

- `a(σ) ≡ 1` and `d(σ) ≡ χ(σ)` modulo `𝔪` for every `σ`.
- `κ(στ′) = κ(σ) + χ⁻¹(σ)κ(τ′)` for all `σ, τ′ ∈ G_F`.
- `κ(τ) = 0`, since `b(τ) = 0` in the eigenbasis.
- The class `[κ]` agrees with the realization of the GMA off-diagonal extension of IntegralHeckeAndGaloisDeterminants §1.4 under the chosen idempotents.
- Every continuous `E`-linear map `B̄ → V` sends `[κ]` to the corresponding class and commutes with all local restrictions.

**Checks.**

- Reducing `b(στ′) = a(σ)b(τ′) + b(σ)d(τ′)` with `a ≡ 1`, `d ≡ χ` gives `b̄(στ′) = b̄(τ′) + b̄(σ)χ(τ′)`, a right-action relation; multiplying by `χ⁻¹(στ′)` gives `κ(στ′) = κ(σ) + χ⁻¹(σ)κ(τ′)`. Taking `b̄` itself as the cocycle fails the left-action identity as soon as `χ(τ′) ≠ 1` and `b̄(σ) ≠ 0`.
- If `κ = (χ⁻¹ − 1)v` is a coboundary, then `κ(τ) = 0` and `χ(τ) ≠ 1` force `v = 0`, so `κ` is the zero function.
- Over `A = E[[x, y]]`, the ideal `B = (x, y) ⊂ Frac(A)` is a finite `A`-module with `dim_E B/(x,y)B = 2`; the finite-module hypotheses used here admit it, whereas a requirement that `B` be free of rank one would exclude it. This tests the module interface only and asserts no family realizing it.

The cocycle is `b̄χ⁻¹`, not `b̄`. Only the diagonal entries are integral by this argument; no realization of `ρ` over `Â` is assumed.

### 4.4 Infinitesimal cyclotomic characters

For `ε(σ) = ∑_{j≥0} a_j(σ) π^j` with `a_0 = 1`, define in `W_2` or `W_3` the characters `ε_y(σ) = ∑_j a_j(σ) y^j` and `ε_z(σ) = ∑_j a_j(σ) z^j` with `z = π − y`, and put `(ψ_1, ψ_2) = (1, χε)` in Case 1 and `(ε_y, χε_z)` in Cases 2 and 3 (Dasgupta–Kakde–Ventullo §4.3, (70)–(74), p. 862). Prove that these are continuous characters with `ε_y = 1 + ((ε − 1)/π) y`, `ε_z = 1 + ((ε − 1)/π) z` and `ε_y ε_z = ε`. The route: the sums are finite by nilpotence; `πy = y²` and `πz = z²` turn them into the displayed linear expressions, and `yz = 0` gives the product. *Needs:* 2.1, 3.2, 3.3; Mathlib `PowerSeries.coeff`.

The API includes:

- `ψ_1(1) = ψ_2(1) = 1` and `ψ_1ψ_2 = χε`.
- Modulo `𝔪_W` the pair is `(1, χ)`.
- Modulo `𝔪_W²`, `ε_y(σ) = 1 + log_p⟨ε_cyc(σ)⟩ y` and `ε_z(σ) = 1 + log_p⟨ε_cyc(σ)⟩ z`.

**Checks.**

- At `σ = 1` the value is `1`; a sum starting at `j = 1` would give `0`, not a unit.
- At `y = 0` one gets `ε_y = 1` and `ε_z = ε`.
- In `E[y′, z′]/(y′², z′²)`, put `π = y′ + z′` and take the series `ε(X) = (1 + LX)²` with `L ∈ E`, `L ≠ 0`. Then `ε(y′)ε(z′) = 1 + 2Lπ + 4L²y′z′`, while `ε(π) = 1 + 2Lπ + 2L²y′z′`; their difference is `2L²y′z′ ≠ 0`. The linear formulas of the theorem cannot be used here because `πy′ = y′z′ ≠ y′² = 0`. Imposing `y′z′ = 0` makes the difference zero, as in `W_2` and `W_3`.

### 4.5 Refined diagonal entries

Prove that `φ` extends uniquely to `φ_𝔪 : Â → W` and that `φ_𝔪(a(σ)) = ψ_1(σ)` and `φ_𝔪(d(σ)) = ψ_2(σ)` for every `σ ∈ G_F` (Dasgupta–Kakde–Ventullo Lemma 4.4, (72)–(78), pp. 862–863). The route: `W` is an Artin local `E`-algebra, so the map extends through localization and completion; the Hecke formulas of 3.8–3.10 give `trace = ψ_1 + ψ_2` at Frobenius elements, and 4.1 with IntegralHeckeAndGaloisDeterminants §4.1 extends it to all `σ`; the determinant is `ψ_1ψ_2 = χε`; the eigenvalues at `τ` map to `ψ_1(τ), ψ_2(τ)`; comparing traces at `σ` and `στ` gives a linear system with determinant `ψ_2(τ) − ψ_1(τ)`, a unit since its residue is `χ(τ) − 1`. *Needs:* 4.1, 4.3, 4.4; IntegralHeckeAndGaloisDeterminants §4.1; Chebotarev Layer 10.

Equality of residual traces alone does not determine the two images; the τ-diagonal basis and the actual traces do.

### 4.6 Invertible local comparison coefficients

For each `𝔮 | p` let `M_𝔮 = [[A_𝔮, B_𝔮], [C_𝔮, D_𝔮]]` be the change of basis from an ordinary basis at `𝔮` to the τ-basis. Prove that `A_𝔮` and `C_𝔮` are units of `K` and that for `σ ∈ G_𝔮`, `b(σ) = (A_𝔮/C_𝔮)(χεη_𝔮⁻¹(σ) − a(σ))` and `c(σ) = (C_𝔮/A_𝔮)(χεη_𝔮⁻¹(σ) − d(σ))` (Dasgupta–Kakde–Ventullo §4.4, (79)–(80) and Lemma 4.6, pp. 863–864; §5.2, p. 867). The route: in each field factor a zero `A_𝔮` or `C_𝔮` would make the ordinary line an eigenline of `ρ_H(τ)`, excluded by 4.2; compare first columns of `ρ(σ)M_𝔮 = M_𝔮 [[χεη_𝔮⁻¹, ∗], [0, η_𝔮]]` and divide in `K`. *Needs:* 4.1, 4.2, 4.3.

The quotients `A_𝔮/C_𝔮` need not lie in `Â`; cancellation is justified only in `K`.

### 4.7 Restricted ramification of the class

Prove that `[κ] ∈ H¹_R(G_F, B̄(χ⁻¹))` and that `[κ]` is locally trivial at every `𝔮 ∈ R′` (Dasgupta–Kakde–Ventullo Lemma 4.7, p. 864). The route: at `𝔩 ∤ p`, restrict to `G_H` to make the action trivial; by local class field theory the inertia image is a quotient of the local units, which are a finite group times a pro-`ℓ` group (`ℓ` the residue characteristic); a continuous homomorphism from the finite part to the torsion-free `B̄` is zero, and the compact image of the pro-`ℓ` part lies in a `p`-adic lattice, so it is both pro-`ℓ` and pro-`p`, hence zero; descend by finite-index averaging. At `𝔮 ∈ R′` choose `σ̃ ∈ G_𝔮` with `χ(σ̃) ≠ 1`: `χεη_𝔮⁻¹(σ̃) − a(σ̃)` is a unit of `Â`, so `A_𝔮/C_𝔮 ∈ B` by 4.6, and reducing gives `κ(σ) = (1 − χ⁻¹(σ))·(A_𝔮/C_𝔮 mod 𝔪B)` on `G_𝔮`, a coboundary. *Needs:* 1.1, 4.3, 4.6; ClassFieldTheory Layer 7; ArithmeticGaloisDuality §R02.2.3.

The additive group `B̄` is not profinite; only compact images lie in lattices. The local unit group away from `p` is not pro-`ℓ`; its finite torsion part is treated separately.

### 4.8 Generation by exceptional inertia

Prove that `B` is generated as an `Â`-module by the `b(σ)` with `σ ∈ I_𝔮`, `𝔮 ∈ R` (Dasgupta–Kakde–Ventullo Lemma 4.8, pp. 864–865). The route: let `B_I` be the submodule so generated; the induced class with values in `(B/B_I)/𝔪(B/B_I)` lies in `H¹_R` and has zero inertia restriction at every `𝔮 ∈ R`, so it is zero by 1.5; it is a coboundary vanishing at `τ`, so it is the zero function; its values generate the quotient, which is therefore zero, and Nakayama on the finite module `B/B_I` gives `B = B_I`. *Needs:* 1.5, 4.3, 4.7.

### 4.9 The second-order bound

With `α_i = A_{𝔮_i}/C_{𝔮_i} ∈ K`, prove `B ⊆ ∑_i α_i 𝔪` and hence `𝔪B ⊆ ∑_i α_i 𝔪²` inside `K` (Dasgupta–Kakde–Ventullo Lemma 4.9, p. 865). The route: for `σ ∈ I_{𝔮_i}`, `χ(σ) = η_i(σ) = 1` and `ε(σ) − a(σ) ∈ 𝔪`, so 4.6 puts `b(σ)` in `α_i𝔪`; apply 4.8 and multiply by `𝔪`. All sums and products are `Â`-submodules of `K`; no integrality of `α_i` is assumed. *Needs:* 4.6, 4.8.

### Examples

For `r = 1` in Case 1 with `s = 1`, `W = E[π]/(π²)` and `φ_𝔪(a) = 1`, `φ_𝔪(d) = χε`; the bound `𝔪B ⊆ α_1𝔪²` is what allows the error term of the determinant in 5.1 to be discarded modulo `𝔪_W²`.

### Dependencies

Layers 1 and 3; PadicFamilies §§5.12–5.13 (through gap:dyadic-hilbert-hida-localization and gap:p-ramified-hilbert-hida-localization where `p = 2` or `𝔣_p ≠ 1`); OrdinaryAutomorphicFormsAndModularityLifting §2.12(b) (through gap:hida-family-representations-all-degrees); SchemeAndStackFoundations §0.21; IntegralHeckeAndGaloisDeterminants §§1.3, 1.4, 4.1; ArithmeticGaloisDuality §R02.2.3; ClassFieldTheory Layer 7; Chebotarev Layer 10; Mathlib `HenselianRing`, `FractionRing`, `IsReduced`.

## Layer 5: determinants and the Gross–Stark theorem

### 5.1 The exact determinant before Artin specialization

For an `E`-basis `u_1, …, u_r` of `U_χ` with matrices `O` and `L` (0.4), prove that there is an `r × r` matrix with entries in `𝔪 ⊂ Â` whose determinant is zero in `Â` and whose image under `φ_𝔪` has entries `L_{ij} z + O_{ij} ε_i + n_{ij}` with `n_{ij} ∈ 𝔪_W²`, where `z = π` in Case 1 and `z = π − y` in Cases 2 and 3; consequently `det(L_{ij} z + O_{ij} ε_i + n_{ij}) = 0` in `W` (Dasgupta–Kakde–Ventullo §5.1, (81)–(86), pp. 865–866). The route: write each `u_j` as a finite `E`-combination of actual `p`-units; lift the local symbols `rec(u_j)` at `𝔓_i` to elements of `G_{𝔮_i}` and extend `a`, `b` and `η_i⁻¹ε` linearly to the corresponding group-algebra elements `σ_{ij}`; orthogonality (1.3) applied to `[κ]` gives `∑_i b(σ_{ij}) ∈ 𝔪B`; by 4.6 `b(σ_{ij}) = α_i h_{ij}` with `h_{ij} ∈ 𝔪`, and by 4.9 the error is `∑_i α_i q_{ij}` with `q_{ij} ∈ 𝔪²`; so `∑_i α_i(h_{ij} − q_{ij}) = 0` exactly. The weighted matrix has rows summing to zero, so its determinant vanishes in `K`; cancel the unit `∏α_i` in `K`; the unweighted matrix has entries in `Â`, so its determinant vanishes in `Â ⊆ K`. Apply `φ_𝔪`: `η_i⁻¹(rec u) = U_{𝔮_i}^{o_i(u)} ↦ 1 + o_i(u)ε_i` and `ε(rec u) ≡ 1 + ℓ_i(u)π` modulo `𝔪_W²` (Conventions), while `φ_𝔪(a)` contributes `0` (Case 1) or `ℓ_i(u)y` (Cases 2, 3). *Needs:* 0.4, 1.3, 4.5, 4.6, 4.7, 4.9; ClassFieldTheory Layer 7; Mathlib `Matrix.det`.

The `𝔪B` error is absorbed using `𝔪²` before taking the determinant; discarding it first only places the determinant in a larger module. The `α_i` are cancelled in `K` and the determinant is then returned to `Â` before applying `φ_𝔪`.

### 5.2 The leading-term comparison for the oriented character

Prove, for `r ≥ 1`, that `det(L) z^r + det(O) ∏_i ε_i = 0` in `𝔪_W^r/𝔪_W^{r+1}` and that in each of Cases 1–3, `L_an(χ) = R_p(χ)`; in particular if `s > r` then `det L = 0` and both sides vanish (Dasgupta–Kakde–Ventullo §5.1, (85)–(87), pp. 866–867). The route: every term of the determinant containing some `n_{ij}` has at least `r + 1` factors from `𝔪_W`; every term mixing a `z` factor and an `ε_i` factor vanishes since `zε_i = 0`; what remains is `det(L)z^r + det(O)∏ε_i`. If `s = r` the top relation gives `∏ε_i = (−1)^{r+1} L_an(χ) z^r` (Case 1 directly; Case 2 through `π^s − y^s = z^s`; Case 3 has `s > r`); if `s > r`, `∏ε_i ∈ 𝔪_W^s ⊆ 𝔪_W^{r+1}`. Cancel the nonzero class of `z^r` (3.4–3.6) and use `det O ≠ 0`: `L_an(χ) = (−1)^r det L/det O = R_p(χ)`. *Needs:* 0.4, 0.5, 3.4, 3.5, 3.6, 5.1.

Only the nonzero line `E·z^r` is used; the graded piece need not be one-dimensional. `L^*_an` enters only when `s = r`.

### 5.3 The lower-entry class in Case 3

In Case 3 define `C ⊆ K` as the `Â`-module generated by the `c(σ)` and `C̄ = C/𝔪C`; prove that `c̄` is a continuous cocycle for the action `χ` with `c̄(τ) = 0`, defining `[c] ∈ H¹_R(G_F, C̄(χ))` (restricted cohomology for `χ⁻¹` in place of `χ`); with `β_i = C_{𝔮_i}/A_{𝔮_i}` and `𝔶 = φ_𝔪⁻¹(yW_3) ⊆ Â`, prove that `C` is generated by the `c(σ)` with `σ` in exceptional inertia, that `C ⊆ ∑_i β_i 𝔶` and hence `𝔪C ⊆ ∑_i β_i 𝔪𝔶` (Dasgupta–Kakde–Ventullo §5.2 and Lemma 5.1, pp. 867–868). The route: use the GMA adapter of 4.3 for the lower entry, with the identity `c(στ′) = c(σ)a(τ′) + d(σ)c(τ′)`, which reduces to the χ-action; the away-from-`p` argument of 4.7 applies, and all primes above `p` are in `R` since `R′ = ∅`; for `σ ∈ I_𝔮`, `φ_𝔪(ε(σ) − d(σ)) = ε(σ) − χ(σ)ε_z(σ) = ε_y(σ) − 1 ∈ yW_3` (using `χ = η_𝔮 = 1` there, `ε = ε_yε_z` and `yz = 0`), so 4.6 puts `c(σ)` in `β_i𝔶`; generation follows from 1.5 for `χ⁻¹`, the τ-normalized coboundary argument and Nakayama. *Needs:* 1.5, 4.3, 4.4, 4.5, 4.6, 4.7; IntegralHeckeAndGaloisDeterminants §1.4.

The API includes:

- `c̄(στ′) = c̄(σ) + χ(σ)c̄(τ′)`, with no `χ⁻¹` factor.
- For `σ ∈ G_𝔮`, `c(σ) = β_𝔮(χεη_𝔮⁻¹(σ) − d(σ))`.
- On inertia at `𝔮_i`, `c(σ) ∈ β_i𝔶`.
- `C ⊆ ∑ β_i𝔶` and `𝔪C ⊆ ∑ β_i𝔪𝔶`, inclusions in `K`.

**Checks.**

- The lower matrix identity reduces to `c̄(στ′) = c̄(σ) + χ(σ)c̄(τ′)`, the χ-action, whereas the normalized upper entry has the χ⁻¹-action; the function `c̄χ⁻¹`, normalized like the upper entry, satisfies only the right-action relation `f(στ′) = f(σ)χ⁻¹(τ′) + f(τ′)`.
- On exceptional inertia the image of `ε − d` is a multiple of `y`, even when `y` has zero class in `𝔪_W/𝔪_W²`.
- For `r = t = 1`, `s = 2`, `yW_3 = E·cπ²` is a nonzero line; the degree-one maximal-ideal quotient would lose it.

### 5.4 The inverse-character determinant in Case 3

Prove that in Case 3, `L_an(χ⁻¹) = R_p(χ⁻¹)`: for a basis of `U_{χ⁻¹}` with matrices `O⁻, L⁻`, `det(L⁻) y^r + det(O⁻)(−1)^{t+1} L^*_an(χ⁻¹) y^t = 0` in `y^rW_3/y^{r+1}W_3` (Dasgupta–Kakde–Ventullo §5.2, (88)–(89), p. 868). The route: repeat 5.1 with `c`, `β_i` and orthogonality for `χ⁻¹`, absorbing the error with `𝔪C ⊆ ∑β_i𝔪𝔶`; after `φ_𝔪` the entries are `L⁻_{ij} y + O⁻_{ij} ε_i + n_{ij}` with `n_{ij} ∈ 𝔪_W yW_3 = y²W_3`; a determinant term involving an error either contains an `ε` factor and vanishes, or lies in `y^{r+1}W_3`; the top product is `(−1)^{t+1}L^*_an(χ⁻¹)y^t` (3.3). If `t = r`, cancel the nonzero line `y^r` (3.6) and divide by `det O⁻`; if `t > r`, `y^t` is zero in the quotient, so `det L⁻ = 0` and `L_an(χ⁻¹) = 0`. *Needs:* 0.4, 0.5, 1.3, 3.6, 5.3.

The comparison uses `t = s_{χ⁻¹}`, so at `t = r` the leading term is `L_an(χ⁻¹)`. The quotient line is one-dimensional even when `y^r ∈ 𝔪_W^{r+1}`.

### 5.5 Rank zero

Prove that if `R = ∅`, then `L_an(χ) = f_χ(0)/D_χ = 1 = R_p(χ)` and `s_χ = 0` (Dasgupta–Kakde–Ventullo §1, (2)–(3) at `n = 0` and `L(χ, 0) ≠ 0`, p. 834; the exact order for `r ≤ 1`, p. 837). The route: interpolation at `0` gives `f_χ(0) = L(χ, 0) ∏_{𝔮|p}(1 − χ(𝔮)) = D_χ ≠ 0`, and the regulator is the determinant on the zero space. *Needs:* 0.4, 0.5.

No Artin algebra is used; the case includes dyadic ramification, for example `F = ℚ`, `H = ℚ(i)`, `p = 2`.

### 5.6 The Gross–Stark theorem

Prove that for every Gross–Stark datum (0.1), with `p` any rational prime,

```text
f_χ^{(r)}(0) / r!  =  L(χ, 0) · ∏_{𝔮∈R′} (1 − χ(𝔮)) · R_p(χ),
```

equivalently `L_an(χ) = R_p(χ) = L_alg(χ)` (Dasgupta–Kakde–Ventullo Theorem 1, p. 837; §5, pp. 865–868). No Leopoldt conjecture, exact-order hypothesis, restriction to odd `p`, parity condition on `[F : ℚ]` or nonvanishing of the regulator is assumed. The route: `r = 0` by 5.5; `r ≥ 1` and `R′ ≠ ∅` by Case 1 and 5.2; `R′ = ∅` by interchanging `χ` and `χ⁻¹` to reach `s ≥ t`, then 5.2 in Case 2 (for either orientation) and 5.2 with 5.4 in Case 3 (for both characters); the equality with `L_alg` is 1.9. *Needs:* 1.9, 2.4, 5.2, 5.4, 5.5.

### 5.7 Exact order and regulator nonvanishing

Prove that `ord_{s=0} L_p(χω, s) = r` if and only if `R_p(χ) ≠ 0` (Dasgupta–Kakde–Ventullo, the discussion after Theorem 1, p. 837). The route: 0.8 gives vanishing below order `r`, and 5.6 identifies the divided `r`-th derivative with `D_χ R_p(χ)` with `D_χ ≠ 0`. The assertion that `R_p(χ) ≠ 0` for every `χ` in arbitrary rank is Gross's open order conjecture and is not claimed. *Needs:* 0.5, 0.8, 5.6.

### 5.8 The rank-one case and the classical specializations

Prove that for `r = 1`, `R_p(χ) ≠ 0`, hence `ord_{s=0} L_p(χω, s) = 1` and `L_p'(χω, 0) = D_χ R_p(χ) ≠ 0`; for `r = 0` the order is `0` (Dasgupta–Kakde–Ventullo §1, pp. 836–837; §1.2, pp. 838–839). The route: for `r = 1`, `R_p(χ) = −ℓ_{𝔓_1}(u)/ord_{𝔓_1}(u)` for a generator `u = e_χ u_0` of `U_χ` with `u_0 ∈ U`, so that `u ∈ U^- ⊗ ℚ(χ)` with `ℚ(χ) ⊂ ℚ̄ ⊂ ℂ_p` through the fixed embeddings, and `ord_{𝔓_1}(u) ≠ 0` because `o_p^χ` is an isomorphism onto the line `E·x_1` and `x_1` has `[𝔓_1]`-coordinate `1` (0.2–0.3). The numbers `log_p N(g u_0)`, `g ∈ G`, are in general `ℚ`-linearly dependent (see the Checks), so Baker–Brumer is applied to rational kernels, in two steps. Write `ℓ = ℓ_{𝔓_1}` on `U ⊗ ℚ`, `K = ker ℓ`, and `ℓ̄` for its `ℚ̄`-linear extension to `U ⊗ ℚ̄`. (i) `ker ℓ̄ = K ⊗ ℚ̄`: choose a `ℚ`-complement of `K` in the finite-dimensional `U ⊗ ℚ` with a basis `c_1, …, c_m` in `U`; each `ℓ(c_j)` is the `p`-adic logarithm of the algebraic number `N_{H_{𝔓_1}/ℚ_p}(c_j)`, a product of conjugates of `c_j`; these logarithms are `ℚ`-linearly independent because `ℓ` is injective on the complement, hence `ℚ̄`-linearly independent by IntegralIwasawaTheory §4.2 (`bakerBrumer_algebraicNumbers`). (ii) `K ∩ (U^- ⊗ ℚ) ⊆ ker ord_{𝔓_1}`: let `y ∈ U^-` with `ℓ(y) = 0`, let `Ĥ` be the Galois closure of `H` over `ℚ`, `𝔓̂` the prime of `Ĥ` above `𝔓_1` given by the embedding into `ℂ_p`, `D` its decomposition group and `𝔭 = 𝔓̂ ∩ Ĥ^D`, so that `Ĥ^D` embeds in `ℚ_p` and `𝔭` is unramified of degree one over `p`. Then `N_{H_{𝔓_1}/ℚ_p}(y)` is the image of `z = N_{HĤ^D/Ĥ^D}(y) ∈ Ĥ^D`, and `log_p z = 0` forces `z^n = p^a` for some `n ≥ 1` and `a ∈ ℤ` (IntegralIwasawaTheory §4.2, `algebraicLog_kernel`: a nonzero algebraic number with vanishing logarithm has a power equal to a root of unity times a power of `p`; raise once more to remove the root of unity). Every complex absolute value of `z` is `1`, because `z` is a product of conjugates of `y` and `|τ(y)|² = τ(y·c(y)) = 1` for every complex embedding `τ` of the CM field `H`; hence `a = 0`. Since `𝔓̂` is the only prime of `Ĥ` above `𝔭`, the field `HĤ^D` has a single prime `𝔔` above `𝔭`, and `0 = ord_𝔭(z) = f(𝔔/𝔭)·e(𝔔/𝔓_1)·ord_{𝔓_1}(y)`, so `ord_{𝔓_1}(y) = 0`. Now if `ℓ̄(u) = 0`, then `u ∈ (K ⊗ ℚ̄) ∩ (U^- ⊗ ℚ̄) = (K ∩ U^- ⊗ ℚ) ⊗ ℚ̄`, and (ii) gives `ord_{𝔓_1}(u) = 0`, a contradiction. Then apply 5.6 and 5.7. For `F = ℚ` the identity specializes to the rank-one formula of Gross, obtained classically from Ferrero–Greenberg and Gross–Koblitz; when the order of `χ` divides `p − 1`, the equality of 5.6 implies the equality of the `p`-adic valuations of the two sides (Federer–Gross), with `v_p(0) = +∞`. *Needs:* 0.2, 0.3, 5.5, 5.6, 5.7; IntegralIwasawaTheory §4.2 (`algebraicLog_kernel`, `bakerBrumer_algebraicNumbers`).

Baker–Brumer gives no higher-rank nonvanishing: for `r ≥ 2` the regulator is a polynomial in logarithms, to which linear independence does not apply.

**Checks.**

- The logarithms need not be independent over `ℚ`: for `H = ℚ(i)`, `p = 5`, `𝔓_1 = (2+i)` and `u_0 = (2+i)/(2−i)`, the list `(ℓ(u_0), ℓ(c u_0)) = (λ, −λ)` with `λ = log_5(u_0)` satisfies the `ℚ`-relation with coefficient vector `(1, 1)`, while the χ-weighted combination `(λ − (−λ))/2 = λ` is the image of `(1, −1)/2`, which is not in that relation space; a proof asserting independence of the list would assert something false here.
- Step (ii) in that example: `λ = 0` would give `u_0^n = 5^a ζ` in `ℚ(i)` with `ζ ∈ μ_4`, whose valuations at `((2+i), (2−i))` are `(n, −n)` on the left and `(a, a)` on the right, forcing `n = 0`; so `λ ≠ 0` and `R_5(χ) = −λ ≠ 0`.
- Step (ii) needs the minus part: the `p`-unit `p` lies in the plus part, has `ℓ_𝔓(p) = log_p(p^{[H_𝔓:ℚ_p]}) = 0` and `ord_𝔓(p) = e(𝔓/p) ≥ 1`; there the archimedean step fails, since `|p| ≠ 1`.

### Examples

For `F = ℚ`, `H = ℚ(i)`, `p = 5`: `r = 1`, `R′ = ∅`, `D_χ = L(χ, 0) = 1/2`, and the theorem reads `L_5'(χω, 0) = (1/2)·(−log_5((2+i)/(2−i)))`, nonzero by 5.8. The formal Case 3 algebra with `r = t = 1`, `s = 2` makes the upper determinant yield a zero oriented regulator and the lower determinant yield the inverse-character leading coefficient. Such unequal orders cannot occur for a Gross–Stark datum of rank one, by 5.8; this calculation tests the two filtrations of the abstract algebra.

### Dependencies

Layers 0, 1, 3 and 4; IntegralIwasawaTheory §4.2; ClassFieldTheory Layer 7; Mathlib `Matrix.det`.

## Worked examples

**A ramified dyadic prime.** Take `F = ℚ`, `H = ℚ(i)` and its odd quadratic character `χ`. At `p = 2` the prime ramifies: `χ(2) = 0`, `R = ∅`, `D_χ = L(χ, 0) = 1/2`, and interpolation gives `f_χ(0) = L^*(χ, 0) = 1/2 = D_χ`; the empty regulator is `1`. Here `χ` is the dyadic Teichmüller character, so `χω = 1` is the potentially exceptional branch, whose germ at `0` is regular; the Kubota–Leopoldt value is `−(1 − ω⁻¹(2))B_{1,ω⁻¹} = −B_{1,χ} = 1/2`.

**An inert prime.** In the same field, `p = 3` has `χ(3) = −1`. Again `r = 0`, while `D_χ = 2L(χ, 0) = 1`. The Euler factor changes the normalization but creates no exceptional zero; counting every prime above `p` as exceptional would fail this example.

**A split prime and the regulator sign.** At `p = 5` the prime splits and `r = 1`. With `𝔓 = (2+i)`, the minus `p`-unit `u = (2+i)/(2−i)` has valuation `1` at `𝔓` and `R_5(χ) = −log_5(u)` in `H_𝔓 ≅ ℚ_5`. The conjugate prime changes valuation and logarithm by the same sign. In linear algebra alone, `O = (2)`, `L = (3)` gives `−3/2`, and `O = diag(2,3)`, `L = diag(5,7)` gives `35/6`.

**The fibre `w = −1`.** In `W_2` with `r = s = 1` and `w = −1`, the relation `wπ = (w + 1)y` forces `π = 0`. The ring is `E[y]/(y²)` with `ε_1 = −ay`, so `π − y = −y ≠ 0` although `π = 0`. The family has zero weight-one specialization and a nonzero first leading term; cancelling `π` or discarding this case would invalidate the theorem.

**The unequal-order fibre.** As a formal algebra calculation, in `W_3` with `r = t = 1`, `s = 2`, let `a, b ∈ E^×` be the two leading-coefficient parameters and put `c = −a/b`. Then `y = cπ²` and `ε_1 = −aπ² = by`, the ring has basis `1, π, π²`, and its `y`-line vanishes in `𝔪/𝔪²` but survives in `yW_3/y²W_3`. The formal upper determinant forces the oriented regulator ratio to be `0`; the lower determinant on the `y`-line gives `det(L⁻) + det(O⁻)·b = 0`, so the formal regulator ratio is `b`. These relations test the determinant calculation, but no Gross–Stark datum with these rank-one orders exists: 5.8 forces both orders to be `1`.

## Corrections to the sources

The following corrections are applied in the statements above; locators refer to the published article unless stated otherwise.

- Dasgupta–Kakde–Ventullo Remark 4.5, p. 863: the asserted factorization of the full localized Hecke algebra through the Artin algebra is not used; for `r ≥ 2` the relations `πε_i = 0` and the nonzero top product obstruct it. The proof uses the actual maps to `W_1, W_2, W_3`.
- §1.3, display after (14), p. 841, and §5.1, p. 867: every leading term uses the branch `L_p(χω, s)`.
- §3.2, case division, p. 849: the last order in the comparison is that of `χ⁻¹`.
- §3.3, after the Fourier embedding, p. 850: the analytic quantities are those of §1.3, p. 841, not the complex Euler-depleted function (2).
- §4.2, (63), p. 860: the representation on the left is the product `ρ` over all eigenfamilies.
- §5.2, p. 867: the lower-entry identity is `c(στ) = c(σ)a(τ) + d(σ)c(τ)`, with `σ` and `τ` independent.
- Remark 1.1, p. 837: `ℓ_p^χ ∘ (o_p^χ)⁻¹` is an endomorphism of `X_χ`; the conjugate composite on `U_χ` has the same characteristic polynomial.
- Proof 1 of Proposition 2.1, (21)–(22), p. 844: the order `(χ⁻¹, χ(1))` of the local pairing is kept throughout with one universal sign, which cancels in the global sum.
- §1.4, outline after (16), p. 843: in Cases 2 and 3 only the line `E·z^r` in `𝔪^r/𝔪^{r+1}` is used; when `s > r`, `𝔪^r` contains the independent powers `π^r, …, π^s`.
- §1.4, (16), pp. 842–843: the error is absorbed by the weighted-row construction of §5.1 before the determinant is taken.
- §1.4, rank-one comparison, p. 842: the local formula is for the scalar specialization of the class.
- Theorem 3.2, p. 849: the normalization `ν_1(t)E_1(1, χ_S) = E_1(1, χ_S)` of the preprint (arXiv v1, Theorem 3.2, p. 16) is required; without it `t = 0` satisfies the statement.
- §3.1, footnote 6, p. 847: for a general character `η` the constant is `2^{−[F:ℚ]}(L(η, 0) + η⁻¹(λ)L(η⁻¹, 0))`.
- §3.1, Hecke operators, p. 847: `U_𝔩` is included for every `𝔩 | 𝔫p`.
- §3.2, regularity, p. 849: `F̃` lies in `M(𝔫, χ)_(1)` and `t·e·F̃` in `S°(𝔫, χ)_(1)`; a product of a weight-one Eisenstein series with `𝒢^♭` need not be ordinary.
- §3.2, (29)–(31), pp. 848–849: when `R′ = ∅` and `𝔫 ≠ 1`, the coefficient of `E_k(χ, ω^{1−k})` and the element `W` carry the factor `⟨N𝔫⟩^{k−1}`, interpolated by the unit `ε(𝔫)` (2.4), as in Dasgupta–Darmon–Pollack (79), p. 469; it is `1` at weight one, so the Artin algebras are unaffected, but without it the Eisenstein component of the pair `(χ, ω^{1−k})` survives at every `k ≠ 1` and Theorem 3.2 fails.
- Dasgupta–Darmon–Pollack Proposition 2.3, p. 462: the constant of `E_k(χν⁻¹, ω^{1−k}ν)` at the cusps `A` carries `⟨N𝔫⟩^{1−k}`, not `⟨N𝔫⟩^{k−1}`; the printed exponent contradicts Proposition 2.7 and (79), which the computation of 2.5a confirms.
- §3.4, (41)–(42), p. 853: the modulus is `π^{s+1}`.
- §3.4, (48), p. 854: the `i`-th factor is `U_{𝔮_i} − 1`.
- Proof of Theorem 3.6, p. 854: `dim_E W_2 = 2^r + 2s − 2` and `ε_J = ∏_{j∈J} ε_j`; for `r = 2`, `s = 3` the dimension is `8`.
- Remark 3.7, p. 855: for `r = s = 1` the formulas use `π = T/log_p(u)`, with `y ↦ wπ/(1 + w)` and `ε_1 ↦ L_an π/(1 + w)`; the image of `U_𝔩` for `𝔩 | 𝔫` is `1 + (w/(1 + w)) log_p⟨N𝔩⟩π`, not `1`.
- §4.1, after (53), p. 858, and §4.2, before (66), p. 861: the same prime `𝔩` appears in `Frob_𝔩`, `T_𝔩` and `χ(𝔩)`.
- §4.1, before Lemma 4.3, p. 860: the line-avoidance list includes every `𝔮 | p`.
- Proof of Lemma 4.2, p. 860: in the reversed eigenvalue order the lower entry is multiplied by `χ⁻¹(σ)` to give a left-action cocycle.
- §4.2, after (64), p. 861: `η_𝔮` is used consistently, one character for each `𝔮 | p`.
- §4.3, before (70), p. 862: the substituted series start at `j = 0` with `a_0 = 1`.
- Proof of Lemma 4.7, p. 864: the finite torsion of the local units and the pro-`ℓ` principal units are treated separately; only compact images lie in lattices.
- (85)–(86), p. 866, and p. 868: a single determinant of the displayed matrix is meant.
- §5.2, (88)–(89), p. 868: after `φ_𝔪` the error ideal is `𝔪_W yW = y²W` and the final line is `y^rW/y^{r+1}W`.
- §5.2, after (89), p. 868: the leading term is `L_an(χ⁻¹)`, since `t` is the order for `χ⁻¹`.
- Charollois–Dasgupta, proof of Theorem 5.1, p. 31 (author copy of 4 November 2014): a free module over `ℂ_p[T]` is projective, so `H_q(T, C_c^♭) = 0` for all `q > 0`; this, rather than a homological dimension of one, is what gives the edge isomorphism.
- Ventullo §4.1, p. 15: after the Hecke operators the standard constants of the family are one element `a` of `Λ_(0)` with `ν_0(a) = 1`, not identically `1`, and the family is divided by the unit `a`; the comparison of families over the small disc with the family module is proved in 2.3, (ii)–(iii).
- Ventullo §4.2, final sentence of the proof, p. 20 of arXiv:1308.2261v1 (p. 961 of the published article): the reference is to Theorem 2, whose family is constructed in §4.

## Downstream consumers

The leading-term theorem, Gross's signed regulator, the cyclotomic subspace with Greenberg's invariant, and the all-prime lower bound are the interfaces exported to later work on `p`-adic Stark conjectures, the Gross–Stark units and the Brumer–Stark refinements over totally real fields. The integral Eisenstein cocycle and its measures are exported as a construction of the smoothed `p`-adic zeta functions of a totally real field. The three Artin algebras, the semi-cusp family and the extension classes are internal to this roadmap.

## References

- **DKV16.** Samit Dasgupta, Mahesh Kakde and Kevin Ventullo, [On the Gross–Stark conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v188-n3-p03-s.pdf), Annals of Mathematics (2) 188 (2018), 833–870, DOI 10.4007/annals.2018.188.3.3; preprint [arXiv:1605.08169v1](https://arxiv.org/abs/1605.08169v1) (2016). Locators use the published pagination (for example Theorem 1, p. 837) except where marked as the preprint, whose Theorem 3.2, p. 16, carries the normalization used in 2.6.
- **DDP11.** Samit Dasgupta, Henri Darmon and Robert Pollack, [Hilbert modular forms and the Gross–Stark conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v174-n1-p12-p.pdf), Annals of Mathematics (2) 174 (2011), 439–484.
- **CD14.** Pierre Charollois and Samit Dasgupta, [Integral Eisenstein cocycles on GL_n, I: Sczech's cocycle and p-adic L-functions of totally real fields](https://sites.math.duke.edu/~dasgupta/papers/Charollois-Dasgupta.pdf), Cambridge Journal of Mathematics 2 (2014), 49–90; locators use the pagination of the author copy dated 4 November 2014.
- **V15.** Kevin Ventullo, [On the rank one abelian Gross–Stark conjecture](https://arxiv.org/abs/1308.2261v1), arXiv:1308.2261v1; published in Commentarii Mathematici Helvetici 90 (2015), 939–963. Locators use the arXiv v1 pagination; Theorem 2 and §§4.1–4.2 carry the same numbering in the published version.
- **Sc93.** Robert Sczech, Eisenstein group cocycles for GL_n and values of L-functions, Inventiones Mathematicae 113 (1993), 581–616, DOI 10.1007/BF01244319; cited by its locator (Theorem 4) without the text.
- **Lin12.** Benjamin Linowitz, [Characterizing Hilbert modular cusp forms by coefficient size](https://arxiv.org/abs/1205.4063v1), arXiv:1205.4063v1 (2012); §2, p. 5, the degeneracy translates; Proposition 3.2 and (5), pp. 6–7, the basis of the Eisenstein space in weight at least three; Theorem 3.3, p. 6.
- **AL13.** Timothy W. Atwill and Benjamin Linowitz, Newform theory for Hilbert Eisenstein series, The Ramanujan Journal 30 (2013), 257–278, DOI 10.1007/s11139-012-9418-2; cited by its locators (Proposition 3.11, Theorem 3.6) without the text.
- **W86.** Andrew Wiles, On p-adic representations for totally real fields, Annals of Mathematics (2) 123 (1986), 407–456, DOI 10.2307/1971332; cited by its locator (Proposition 1.5) without the text.
- **Br82.** Kenneth S. Brown, Cohomology of Groups, Graduate Texts in Mathematics 87, Springer, 1982, DOI 10.1007/978-1-4684-9327-6; cited by its locators (Chapter III §6, Chapter V §3, Chapter VII §6) without the text.
