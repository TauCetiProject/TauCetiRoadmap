# Roadmap: Selmer groups and Iwasawa cohomology

**Summary.** This roadmap builds Selmer groups and Selmer complexes for compact, rational and discrete p-adic Galois coefficients, compares their local conditions under Tate duality, and carries them up cyclotomic and `ℤ_p^d` towers as Iwasawa cohomology with its descent, control, duality and determinant formulas. It starts from the p-adic completion of multiplicative groups and the p-adic Kummer identification, and it ends with the cyclotomic unit–class-group dictionary, the finite (Bloch–Kato) and ordinary (Greenberg) local conditions with their explicit comparison, Greenberg's structure theorems for ordinary Selmer groups (surjective localisation, no pseudo-null submodules, Fitting equals characteristic ideal), the Iwasawa–Greenberg main conjecture as a precisely normalised proposition, and two parity theorems: constancy of Selmer-rank parity in self-dual ordinary families, and the `2`-primary Selmer parity of the congruent-number curves. It also supplies the arithmetic Selmer and deformation comparisons, including the `H⁰` and determinant boundaries and derived coefficient change (§§2A.1–2A.5). Along the way it supplies the étale description of restricted-ramification Galois cohomology used in Kato's `j_*` convention, and applies the supplied p-adic period theory to the finite local conditions. We want it because Euler-system, main-conjecture and Bloch–Kato arguments all consume exactly these objects with exactly these error terms.

`README.md` is normative. [`Suggested.lean`](Suggested.lean) states the headline results that can be expressed against the pinned Mathlib and Tau Ceti: p-adic Kummer theory (§0.8), integral weak-semisimplicity lifting (§0.13), finite-cotype primary decomposition (§2.12a), the Hodge Gamma order formulas (§4.14), and the local Kummer image calculation for congruent-number curves (§4.29). It is not exhaustive. Every target below states its hypotheses and source. The statements and supporting definitions in `Suggested.lean` use the namespace `TauCetiRoadmap.SelmerIwasawaCohomology`; the other targets are stated as mathematics. Every library definition comes with the API it needs and with checks that a plausible wrong definition fails. Nothing here is optional.

## Scope and ownership

This roadmap owns:

- local completion and tensor comparisons, the p-adic Kummer identification for fields and S-units, coefficient-limit hypotheses, weak semisimplicity and integral lifting (Layer 0);
- compact, rational and discrete Selmer data and Selmer groups, propagation of local conditions along coefficient maps, unramified, Greenberg and finite conditions at bad primes, Pontryagin duals and coranks, dual Selmer structures, Poitou–Tate for Selmer groups, Selmer-specific adapters to the supplied mapping fibres and their `H⁰` correction, extensions to the coefficient complexes of §2.21, lattice changes and descent of vanishing, with the abelian Kummer/Sha adapters, finiteness and all-place Kummer annihilators of §2.12a (Layer 2);
- arithmetic compact-support identification and Selmer-complex `H¹` with its `H⁰` correction, function-field Greenberg–Wiles, comparison with deformation tangents, determinant tangent fibres and derived coefficient change (Layer 2A);
- Iwasawa algebras of `ℤ_p^d × Δ` with their coordinates, involution and twists, the general profinite and coefficient extensions of supplied arithmetic Iwasawa cochains, Selmer-specific Shapiro, descent, control and duality comparisons, universal norms, semilocal descent, Iwasawa Selmer adapters with derived specialization, determinant lines, the étale `K(π,1)` comparison for `Spec 𝒪_{F,S}` and the `j_*` convention, local cofreedom, and Greenberg's structure theorems (Layer 3);
- the cohomological Cassels–Tate pairing for `Ш(A/K) × Ш(A∨/K)` and its divisible radicals (§4.29), the small-weight crystalline realization, the Bloch–Kato conditions and their integral and finite variants, archimedean realizations with Gamma factors and Greenberg criticality, the cyclotomic unit–class-group dictionary, the main-conjecture propositions, global finite Selmer reductions, and the parity theorems of §§4.28–4.29 (Layer 4).

IntegralIwasawaTheory §§2.0, 10.0–10.3 supplies the common finite p-primary and finite-free compact number-field constructions and their actual arithmetic maps. NoncommutativeAndEquivariantIwasawa §F.4 supplies the number-field lattice Selmer mapping fibres, Iwasawa cochains and control with their errors, and on the same domain the module-level local conditions, Selmer groups, their contragredient duals and the basic étale comparison. IntegralIwasawaTheory §§2.1–2.3 and 2.7 supply the cyclotomic class, unit and p-ramified towers with their reciprocity sequence. The contracts below identify these common instances; this roadmap retains its more general coefficient and profinite-group extensions and its Selmer-specific comparisons. ArithmeticGaloisDuality supplies continuous cochains with compact and rational coefficients and their limits (its Layer R02.1), the Hochschild–Serre spectral sequence and descent (Layer R02.2), restricted ramification, `G_{K,S}` and the S-idele class formation (Layer R02.3), local and global Tate duality, Poitou–Tate and the Euler characteristic (Layer R02.4), the Greenberg–Wiles formula (Layer R02.5) and the derived continuous cochains with compact support and their duality, including the complete Tate correction at real places when `p = 2` (Layer D7). This roadmap consumes those statements and does not restate them. Layer 2A here owns the arithmetic Selmer comparisons, function-field Greenberg–Wiles, deformation tangent comparisons, determinant tangent fibres and derived coefficient change.

Already in the libraries and only cited: Mathlib's `AdicCompletion` with `AdicCompletion.map`, `AdicCompletion.map_id`, `AdicCompletion.map_comp` and `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Mathlib's `Submodule.orthogonalBilin` with `Submodule.mem_orthogonalBilin`, `Submodule.orthogonalBilin_antitone`, `Submodule.orthogonalBilin_bot` and `Submodule.orthogonalBilin_top_eq_ker`; Mathlib's perfect pairings `LinearMap.IsPerfPair` (both curried maps bijective); Mathlib's `PontryaginDual`, `PadicComplex`, `BDeRhamPlus`, `BDeRham`, `Complex.Gammaℝ`, `Complex.Gammaℂ` and `cyclotomicCharacter`; Tau Ceti's finite-level Kummer theory (`TauCeti.kummerMap_surjective`, `TauCeti.kummerIso`, `TauCeti.kummerIso_res`, `TauCeti.kummerIso_norm`, the coefficient transition `TauCeti.kummerCoeffPow` with `explicitCoeff1_kummerCoeffPow_kummerMap` and `explicitCoeff1_kummerCoeffPow_surjective`), finiteness of local power classes (`TauCeti.finiteIndex_range_powMonoidHom`), the all-degree discrete Shapiro isomorphism (`TauCeti.ContinuousCohomology.shapiroIso`, `TauCeti.ContinuousCohomology.shapiroIsoTopRep`), the completed group algebra `TauCeti.completedGroupAlgebra`, and the Hodge carriers `TauCeti.Hodge.HodgeStructureOn` with `dual`, `tateTwist`, `prod`, `hodgeNumber` and `TauCeti.Hodge.tate`. Tau Ceti's `TauCeti.FiniteBilinearModule.orthogonalComplement` treats a finite module paired with itself into `ℚ/ℤ`; ArithmeticGaloisDuality §D7.7.1 supplies finite pairings of two independent `ℤ/n`-modules into `ℤ/n`. Tau Ceti's `TauCeti.instModulePadicCharacterContragredient` supplies the algebraic contragredient action on p-adic characters; §2.10 adds the continuous p-primary and completed-Iwasawa versions by comparison with PadicLocalLanglandsForGL2Qp §0.3.

Not in this roadmap: the construction of p-adic L-functions, Euler and Kolyvagin systems and their bounds, proofs of main conjectures, Hida families as objects (they enter §4.28 as data), Heegner points, the Gross–Zagier formula and Kolyvagin's theorem, root numbers of modular forms and their constancy in families, general p-adic Hodge comparison theorems, `(φ, Γ)`-modules and regulators, and transverse (Kolyvagin) local conditions. The analytic half of Nekovář's parity theorem for ordinary modular forms (relating the Selmer parity of §4.28 to the order of vanishing of the L-function) consists of these excluded inputs; the full congruence is the target *Nekovář's parity theorem for ordinary modular forms* of HeegnerPointEulerSystems HE.8, which consumes §4.28.

## Conventions

Fix a prime `p`. For arithmetic coefficients `O` is the ring of integers of a finite extension `E/ℚ_p, λ` a uniformizer, `T` a finite free O-lattice with continuous Galois action, `V = T ⊗_O E` and `A = V/T`. The compact Tate dual is `Hom_O(T, O)(1)`; the discrete Tate dual is `Hom_O(T, E/O)(1)`. They are distinct coefficient objects. Finite coefficient quotients use `λ^m`; a formula written over `ℤ_p` with `p^m` is specialised to `O = ℤ_p` unless its O-version is stated. A number field `F` has a finite set `S` of places containing its p-adic and infinite places and the ramification of the coefficients. Local conditions use decomposition-group stability, without imposing global stability on an ordinary filtration.

Write `Â = lim_m A/p^mA` for additive completion, and use power quotients for multiplicative groups. This is not an unrestricted algebraic tensor product. Inverse limits of compact coefficient systems carry their inverse-limit topology. Rational Iwasawa cohomology means integral Iwasawa cohomology tensored with `ℚ_p`, rather than an inverse limit allowing unbounded denominators. Pontryagin corank of a cofinitely generated discrete module is the rank of its compact dual.

Cochain complexes are cohomological. The fibre of `f` is `Cone(f)[−1]`. Write `C_v^ord(X) = C_cont(G_v,X)` at every place. The arithmetic local diagram `C_v^mod(X)` uses the same complex at finite places, complete Tate cochains at real places and zero at complex places. The supplier map `q_v:C_v^ord→C_v^mod` is the identity at finite places, the ordinary-to-Tate map at real places and the zero map at complex places. Modified localization is `q_v∘res_v`. For a module `T`, ordinary local `H⁰` is `T^{G_v}`; modified real `H⁰` is `T^{G_v}/N_vT` and modified complex `H⁰` is zero. Ordinary cochains supply deformation tangents; arithmetic compact support in the duality convention and derived Selmer duality use the modified diagram. IntegralIwasawaTheory §10.1 separately supplies the bounded ordinary Burns–Flach compact-support instance, including at real dyadic places. Section 2.21 transports the supplied fibres and their archimedean comparison to the specified Selmer diagrams, and §2.22 uses `H⁰` of that diagram.

Local Tate duality has degree two and global compact-support duality degree three. The bounded derived arithmetic statements assume condition `(P): p` is odd or `F` has no real places. Under `(P)`, modified archimedean cochains are acyclic, so arithmetic compact support is represented by the finite-place fibre. Ordinary archimedean `H⁰` need not vanish under `(P)`. At `p = 2` with real places use ArithmeticGaloisDuality §D7.5 (*Duality when `p = 2` and `K` has real places*), with complete Tate cochains in the unbounded derived category; finite Poitou–Tate modifications alone do not give this derived comparison. Ordinary étale and Galois cohomology of `Spec 𝒪_{F,S}` agree in all degrees with no real-place modification (§3.15). The displayed cyclotomic Euler-rank formulas assume `p` odd. Finite ordinary and nonsingular conditions retain their `H⁰`, inertia and Tamagawa errors.

For `Λ = O⟦Γ⟧` the induced compact coefficient action is `g(ℓ ⊗ t) = [g]⁻¹ℓ ⊗ gt`; `ι(γ) = γ⁻¹`. A k-fold Tate cup twist is semilinear for `Tw_k(γ) = χ_cyc(γ)⁻ᵏγ` (§3.0). Arithmetic Frobenius is used in the explicitly specified Euler factors. The arithmetic determinant is `det⁻¹`; for a generically acyclic complex its valuation is `Σ_i(−1)^i length H^i`, so degrees one and two give `char H²/char H¹`. Positive rank needs a supplied regulator trivialization.

For L-functions `ℚ_p(n)` has Hodge type `(n, n)`, real Betti involution `(−1)^n` and Gamma factor `Γ_ℝ(s − n)`, so `L(ℚ_p(n), s) = ζ(s − n)`. Its p-adic Hodge–Tate weight is `−n`. The native cohomological Hodge Tate index is `−n`. Pole orders refer to the meromorphic Gamma function (equivalently zeros of its analytic reciprocal), rather than a nonzero value of Mathlib's totalized Gamma at a pole.

`ℂ_p` is Mathlib's `PadicComplex p`, finite extensions of `ℚ_p` are taken inside `PadicAlgCl p`, and `G_K = PadicAlgCl p ≃ₐ[K] PadicAlgCl p` acts on `ℂ_p` by continuous extension (PadicPeriodRings §1.1).

## Exact supplier contracts

### From Mathlib

Completion: `AdicCompletion`, `AdicCompletion.of`, `AdicCompletion.map` (with `map_id`, `map_comp`), `AdicCompletion.ofTensorProduct`, `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`, `AdicCompletion.of_injective_iff`, `PadicInt`, `PadicInt.toZModPow`. Number fields: `NumberField.RingOfIntegers`, `NumberField.Units.exist_unique_eq_mul_prod`, `NumberField.Units.rank`, `RingOfIntegers.instFintypeClassGroup`, `Set.unit` (S-units), `IsIntegral.of_pow`. Limits and roots of unity: `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`, `rootsOfUnity`, `card_rootsOfUnity`. Pairings: `Submodule.orthogonalBilin` and its lemmas listed in Scope, `LinearMap.IsPerfPair`, `Submodule.map_le_iff_le_comap`. Duals and ranks: `PontryaginDual`, `ContinuousMonoidHom.comp`, `MulDistribMulAction.toMonoidHom`, `Module.finrank`. Continuous cohomology with topological coefficients: `continuousCohomology`. p-adic fields: `PadicAlgCl`, `PadicComplex`, `PadicComplexInt`, `PadicComplex.isAlgClosed`, `spectralNorm`, `UniformSpace.Completion.map`, `cyclotomicCharacter`, `BDeRhamPlus`, `BDeRham`, `fontaineThetaInvertP`, `WittVector.fontaineTheta`. Gamma factors: `Complex.Gammaℝ`, `Complex.Gammaℂ`. Iwasawa algebras: `MvPowerSeries`, `RingTheory.Sequence.IsRegular`. Étale algebras: `Algebra.IsUnramifiedAt`, `Algebra.FormallyEtale`. Elliptic curves: `WeierstrassCurve`, `WeierstrassCurve.Affine.Point`. These are used as stated in Mathlib; nothing is assumed beyond their docstrings.

### From Tau Ceti

S-unit finite generation and valuation maps use `TauCeti.RingTheory.DedekindDomain.SInteger.Unit`. HeightsAndUnits §4.2 supplies the rank and fundamental systems; ArithmeticGaloisDuality §R02.3.0c supplies the finite-generation module, cardinality and reindexing adapters and the completion comparison used in §0.9.

At the pinned commit: the Kummer theory of `TauCeti.FieldTheory.GaloisCohomology.Kummer` (`TauCeti.kummerClassMap`, `TauCeti.kummerClassMap_injective`, `TauCeti.kummerMap_surjective`, `TauCeti.kummerIso`, `TauCeti.kummerIso_res`, `TauCeti.kummerIso_norm`, `TauCeti.kummerCoeffPow`, `explicitCoeff1_kummerCoeffPow_kummerMap`, `explicitCoeff1_kummerCoeffPow_surjective`) and `TauCeti.powerClassQuotient`; `TauCeti.finiteIndex_range_powMonoidHom` (finite index of n-th powers in a local field, `n ≠ 0` in `K`); the Shapiro maps `TauCeti.ContinuousCohomology.shapiroMap`, `shapiroIso` and `shapiroIsoTopRep`; inflation–restriction `TauCeti.ContCohomology.explicitInfRes_exact`; `TauCeti.completedGroupAlgebra` with `lift`, `map`, `domCongr`, `domCongr_of`, `continuous_map`, `map_id`, `map_comp`, the product decomposition and `powerSeriesCoordinate`; the local cyclotomic character `TauCeti.localCyclotomicCharacter`; the Hodge carriers `TauCeti.Hodge.Conjugation`, `TauCeti.Hodge.HodgeStructureOn` (`piece`, `hodgeNumber`, `finite_setOf_hodgeNumber_ne_zero`, `dual`, `finrank_dual_piece`, `tateTwist`, `prod`, `prod_piece`), `TauCeti.Hodge.latticeConjugation`, `TauCeti.Hodge.isBaseChange_tateLatticeMap`, `TauCeti.Hodge.tate` and `TauCeti.Hodge.tate_hodgeNumber`.

### From TauCetiRoadmap.ProfiniteCohomology

Layer 5: inflation–restriction `0 → H¹(G/H, M^H) → H¹(G, M) → H¹(H, M)` for discrete modules. Layer 6: the Mackey double-coset formula for restriction and corestriction. Layer 7: Shapiro's lemma in low degrees with corestriction. Layer 9: Hilbert 90 and the Kummer isomorphism with its restriction and norm squares (implemented in Tau Ceti as above). Layer 10: the long exact sequence in every degree, the all-degree Shapiro isomorphism and the all-degree Mackey formula. Layer 11: cohomological dimension, in particular `cd_p(Ẑ) = 1` and the criterion `cd_ℓ(G) ≤ n` iff `H^{n+1}(G, A) = 0` for simple `ℓ`-torsion `A`. Layer 12: cup products, their naturality in the coefficients (`cup_coeffMap`) and the projection formula `cor(res a ⌣ b) = a ⌣ cor b` (`cup_projection`). ArithmeticGaloisDuality §R02.2.3a supplies `H¹` of `Ẑ` as Frobenius coinvariants for §2.7.

### From TauCetiRoadmap.ProfiniteProPGroups

Layer 9: the completed group algebra `completedGroupAlgebra p Γ` (Tau Ceti `TauCeti.completedGroupAlgebra ℤ_[p] Γ`), its inverse-limit topology and the one-variable power-series coordinate, on which §3.0 builds.

### From TauCetiRoadmap.LocalFieldsRamification

Layer 1: for `K/ℚ_ℓ` finite, `K^× ≃ ℤ × 𝒪_K^×, 𝒪_K^× ≃ μ_{q−1} × U¹_K` with `U¹_K` pro-`ℓ` and `U^i_K ≅ ℤ_ℓ^{[K:ℚ_ℓ]}` for large `i`, and finiteness of `K^×/(K^×)^n`. Layer 3: ramification groups, the Herbrand function, upper numbering and the different. Layer 4: the tame quotient `I_K/P_K ≅ ∏_{ℓ′ ≠ ℓ} ℤ_{ℓ′}(1)`. The finite generation of `H¹(I_K, T)` for `ℓ ≠ p`, the p-cohomological dimension one of `I_K` for `ℓ ≠ p`, and the `U¹`-module structure beyond these statements are derived where used (§§2.14, 3.5).

### From TauCetiRoadmap.LocalGaloisGroups

Layer 5: the local cyclotomic character. Layer 7: the completed multiplicative group `A(K) = lim_m K^×/(K^×)^{p^m}` (`padicCompletionUnits`, `padicCompletionTransition`, `padicCompletionUnitsOf`) with its `ℤ_p`-module structure and, for `K/ℚ_p` finite, its torsion and rank.

### From TauCetiRoadmap.ClassFieldTheory

Layer 5: local Tate duality for finite modules over a local field, and the local Euler formulas `eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp`. Layer 10: the global Brauer group sequence `0 → Br F → ⊕_v Br F_v → ℚ/ℤ`. Layer 11: global reciprocity, the idele class formation and norm/transfer compatibility. Layer 12: global existence and `globalClassFieldCorrespondence`. Layer 13: Hilbert and ray class fields, `gal_hilbertClassField_equiv_classGroup` and their maximal-unramified properties. Layers 11–13 give the unramified/class-group dictionary used in §4.27 and, through IntegralIwasawaTheory §§2.3 and 2.7, in §4.16, with arithmetic Frobenius normalization and norm compatibility; Layer 13 also supplies the principal ideal theorem, through ArithmeticGaloisDuality §R02.3.3.

### From TauCetiRoadmap.EllipticCurves

Layer 2: the Weil pairing `e_N` with its compatibility `e_N(φP, Q) = e_N(P, φ̂Q)` for an isogeny `φ`. Layer 7: Selmer structures on discrete modules, `Sel_m(E/K), Ш(E/K)` and the m-descent sequence `0 → E(K)/m → Sel_m → Ш[m] → 0`. The comparison with the canonical continuous carrier on `A = V/T` is §2.1 here.

### From IntegralIwasawaTheory

For a number field `F`, finite `S ⊇ S_p ∪ S_∞ ∪ S_ram`, finite continuous p-primary coefficients and finite free continuous `ℤ_p`-lattices, consume §2.0 (*Finite-coefficient global duality and compact arithmetic cochains*): `arithmeticPoitouTate`, `arithmeticCompactSupport` in its ordinary and complete-Tate versions, and `arithmeticCompactDuality`. Identify the localization, restriction, corestriction, local-invariant, evaluation-cup and connecting maps used here with those maps, not just their cohomology groups. For either diagram `ε = ord, mod`, the strict instance satisfies `RΓ_f^ε(F,S,T;0) ≃ arithmeticCompactSupportε(F,S,T)`. The comparison carries `q_v` and `Q_∞` to the ordinary-to-Tate map and its cone. Finite free O-lattices retain their O-action after scalar restriction to `ℤ_p`; comparisons involving O-duals also retain the O-linear evaluation and trace conventions, rather than identifying O-duals with `ℤ_p`-duals.

Consume §10.0 (*Compact coefficients, Shapiro and mapping fibers*), targets `completedArithmeticCoefficients`, `derivedArithmeticTower`, `compactArithmeticShapiro` and `arithmeticLocalMappingFiber`; §10.2 (*Arithmetic instances of Iwasawa complexes*), targets `arithmeticIwasawaComplex` and `arithmeticIwasawa_shapiroComparison`; and §10.3 (*Finite-layer descent with every Tor term*). For the same local maps the equation is `RΓ_f^ε(F,S,T;U⁺) ≃ arithmeticLocalMappingFiberε(F,S,T;U⁺)`. These identifications preserve finite-level projections, corestriction, the inverse action on induced coefficients, coefficient triangles, derived quotient-tower change and its Tor edge maps. For a tower in the supplied abelian p-adic Lie setting, §§3.1–3.3 identify its global cochains with §10.0's `derivedArithmeticTower` through `compactArithmeticShapiro`; §§3.8–3.10 transport its maps to the chosen Selmer conditions. The §10.2 complex `arithmeticIwasawaComplex F S T` and the §10.3 descent are used only for the cyclotomic tower of a finite abelian extension `F/k`, which has p-adic Lie dimension one; a `ℤ_p^d`-tower with `d ≥ 2`, such as the compositum of the cyclotomic and anticyclotomic `ℤ_p`-extensions of an imaginary quadratic field, or a noncyclotomic `ℤ_p`-extension, uses §10.0 and NoncommutativeAndEquivariantIwasawa §F.4 only.

Section 10.1 (*A bounded all-prime compact-support model*) supplies `burnsFlachFiniteComplex`, `burnsFlachFinite_perfect`, `burnsFlachComplex` and `burnsFlach_derivedBaseChange`. In that section's finite arithmetic sheaf setting, the strict ordinary fibre, with the corresponding induced coefficients for a finite extension, is `burnsFlachFiniteComplex`. Its tower limit is `burnsFlachComplex` under the stated totally real cyclotomic hypotheses. Its boundedness is not a boundedness assertion for the strict modified fibre: at a real dyadic place the latter can have negative Tate cohomology. The comparison is the triangle with `Q_∞[−1]` of §2.21. General complete Noetherian coefficient rings, localized coefficients and function fields keep the hypotheses and dualizing complexes of ArithmeticGaloisDuality; they are not reduced to the finite-free number-field instance. (Burns–Flach, equation (1.9), p. 73, Proposition 1.20 and ordinary/Tate comparison, pp. 78–80; Nekovář, §5.7.2, pp. 131–132.)

Consume §2.1 (*Norm limits and extension limits of class groups*), §2.2 (*Units, semilocal units, and the field-level defect*), §2.3 (*The extensions represented by each arithmetic module*) and §2.7 (*Global-local reciprocity, with real signs*): the class norm limit, principal-unit and closed global-unit towers, the unramified and p-ramified modules with their Artin comparisons, and the augmented global–local reciprocity sequence with `unitLimit_eq_limit_closures`. Sections 4.16–4.17 use them for the cyclotomic tower of `ℚ(μ_p)` with the index change and notation dictionary stated in §4.16 (the supplier's unramified `X` is `Y` here and its p-ramified `𝔛_S` is `X` here); they add only the plus/minus parts, the real-tower identification and the quotient by an arbitrary closed unit submodule.

### From NoncommutativeAndEquivariantIwasawa

Consume §F.4 (*Selmer mapping fibres, Iwasawa cochains and control*), targets `arithmeticSelmerComplex`, `arithmeticSelmerComplex.changeCondition`, `arithmeticSelmerComplex.h1_exact`, `arithmeticSelmerComplex.duality`, `arithmeticIwasawaCochains`, `arithmeticIwasawaCochains.shapiro`, its quotient-tower specialization, and `arithmeticSelmerComplex.control`. In the supplied number-field lattice setting, use identical global cochains, local-condition maps, localization homotopies and the explicit ordinary or modified diagram of §2.21. The adapters satisfy

```text
RΓ_f^ε(F,S,T;U⁺) ≃ arithmeticSelmerComplexε(F,S,T;U⁺),
RΓ_Iw(G_(F,S),G_(F∞,S);T) ≃ arithmeticIwasawaCochains(F∞/F,T),
RΓ_f,Iw^ε(F∞/F,T;U⁺) ≃ Rlim_{n,cor} arithmeticSelmerComplexε(F_n,S_n,T;U_n⁺).
```

The superscript `ε` specifies the local diagram, with zero complex-place terms in the modified instance. The superscripts denote evaluation on these specified diagrams. When a fixed supplied instance omits ordinary complex-place terms, retain the complex-place comparison cones of §2.21 in passing to the ordinary diagram here. These are comparisons of complexes with their maps. For an abelian p-adic Lie tower and a `ℤ_p`-lattice the middle complex also equals IntegralIwasawaTheory §10.0's `derivedArithmeticTower`; when the tower is the cyclotomic tower of a finite abelian extension `F/k`, it further equals §10.2's `arithmeticIwasawaComplex F S T`. The induced coefficient is identified by `t ⊗ λ ↦ λ ⊗ t`, giving `g(λ ⊗ t) = λ[g]⁻¹ ⊗ gt` on both sides. Quotient-tower specialization is derived tensor on both sides; its local comparison cone is exactly §3.9's local specialization correction complex. The `H⁰` correction, condition-change triangles, involution, duality maps and Tor edge maps are transported from the supplied targets. This roadmap supplies the propagation, finite/ordinary comparison, archimedean adapters and general coefficient/profinite extensions; it does not construct a second number-field lattice cochain theory. (Nekovář, §§6.1–6.3, pp. 135–143; §§8.3–8.4, pp. 201–216; §8.10, Proposition 8.10.1, pp. 249–251.)

Consume also §F.4's module-level constructions on the same number-field lattice domain (number field `F`, finite `S ⊇ S_p ∪ S_∞ ∪ S_ram`, compact O-lattice `T`, `V=T⊗_O E`, `A=V/T`): its local Kummer, unramified and Greenberg conditions on the actual continuous cochains, its kernel-defined Selmer groups with functoriality for coefficient maps and compatible conditions, their Pontryagin duals with the action `(gφ)(x)=φ(g⁻¹x)` and exactness of duality, its restriction/corestriction comparisons, and its comparison of the cochain model with continuous étale cohomology of `Spec 𝒪_{F,S}`. On that domain the following are equalities of submodules of the same cohomology groups, or the supplier's canonical maps: the unramified condition of §2.7; the Greenberg condition of §2.8 for a stable direct summand `F⁺T`; the Galois Selmer groups of §2.9 for these conditions; the duals of §2.10 on such Selmer groups; the elliptic Kummer conditions of §2.12; and the finite-coefficient and lattice comparisons of §3.15. Those sections own only their extensions beyond this domain, each restricting to the supplied object: arbitrary profinite decomposition groups with discrete torsion, finite-type or rational coefficients (§2.7); stable submodules that are not direct summands and the ordinary filtrations of §2.8a (§2.8); the general Selmer data of §§2.1–2.6 and arbitrary local conditions (§2.9); the comparison of the circle-valued carrier with PadicLocalLanglandsForGL2Qp §0.3's `DualitySupport.torsionDual` for arbitrary profinite groups, and the completed Iwasawa action (§2.10); the direct-limit elliptic carrier and its corank (§2.12); and the cover equivalence, the `G_m` calculation, the real-place identification in high degree and the `j_*` stalk, Leray and tower statements in Kato's convention (§3.15). The `j_*` comparison is distinct from the supplied basic étale comparison.

### From PadicLocalLanglandsForGL2Qp

Consume §0.3 (*Coefficient-linear duality and the residual ramification dictionary*): `DualitySupport.torsionDual M = Hom_O(M,L/O)` for discrete O-torsion `M` with its compact counterpart, the exact contravariant equivalence `DualitySupport.exact`, evaluation biduality `DualitySupport.bidual`, finite-quotient and limit compatibility `DualitySupport.finiteQuotient`, the trace comparison `DualitySupport.traceComparison` with the inverse different, and the action `(g·f)(v)=f(g⁻¹v)` of `DualitySupport.contragredient`. At `L=ℚ_p` this is the generic p-primary duality used here; §2.10 identifies it with Mathlib's `PontryaginDual` restricted to p-primary modules and adds the completed Iwasawa action. O-linear duals of O-lattices keep the trace comparison of §0.3 rather than an identification of `L/𝔇⁻¹` with `L/O`.

### From ArithmeticGaloisDuality

Layer R02.1: §R02.1.2 (*Tate's inverse-limit theorem*; *Continuous sections of coefficient surjections*; *Long exact sequences for continuous cohomology*, including the period coefficients `V ⊗ B_cris` and `V ⊗ B_dR`, which have continuous sections by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3), §R02.1.3 (*Rationalisation of lattice cohomology*; *The sequence `T → V → W` and the torsion of `H¹(T)`*). Layer R02.2: §R02.2.1 (*The Hochschild–Serre spectral sequence*), §R02.2.2 (*The five-term sequence and the transgression*), §R02.2.3 (*Restriction and corestriction descent for finite index*; *Inflation–restriction for compact and rational coefficients*). Layer R02.3: §R02.3.1 (*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*; *Finiteness of `H¹(G_{K,S}, M)`*; *Localisation maps and the modified local groups*), §R02.3.3 (*The S-idele classes as a quotient of the idele classes*; *The Kummer sequence for S-units*). Layer R02.4: §R02.4.2 (*Unramified classes are exact annihilators*; *Restricted products of local cohomology and `Ш^r_S`*), §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*), §R02.4.4 (*Finiteness of Galois cohomology with restricted ramification*; *Cohomological dimension of `G_{K,S}`*; *High-degree cohomology of the S-units*; *Tate's global Euler characteristic formula*). Function fields: §R02.4.5 (*Prime-to-characteristic function-field Poitou–Tate duality*; *Function-field arithmetic finiteness and Euler characteristic*). Layer R02.5: §R02.5.1 (*The Greenberg–Wiles formula*). Layer D7: §D7.1 (*Derived tensor, perfect amplitude and `Tor`*), §D7.3 (*Nakamura cochain tensor comparisons*; *Admissible compact and cofinite coefficients*; *Continuous cochains in the derived category*; *Cohomological finiteness and perfect amplitude*; *Compact Shapiro and projection formulas*, the complete finite-type extension of the discrete Shapiro isomorphism), §D7.4 (*Derived local Tate duality*), §D7.5 (*Continuous cochains with compact support*; *Derived Poitou–Tate duality*; *Duality after localising the coefficients*; *Duality when `p = 2` and `K` has real places*; *Euler–Poincaré characteristic with compact support*), §D7.6 (*Poitou–Tate for lattices and rational coefficients*; *Local abelian-variety duality and gerbe evaluation*; *Self-dual isogenies and their local index*). Sections D7.7.1–D7.7.6 supply perfect pairings, coefficient-compatible Tate pairings, derived orthogonal complements, global mapping-fibre duality, ordinary annihilators and nonsingular torsion classes for Layers 2–4. Sections R02.3.0a–R02.3.0c supply multiplicative completion, global units and S-units. Section R02.2.3a supplies procyclic `H¹`. Section D8.1 supplies *Trace-zero adjoint duality without division by `n`* and *First-order Galois cocycle comparison*. These are used with the hypotheses stated there; condition `(P)` is imposed wherever the derived statements require it.

### From SchemeAndStackFoundations

§1.1 (descent of sheaves), §2.1 (pullback and higher direct images on sites, `higherDirectImage_iso_sheafify`), §2.2 (`leray_spectral_sequence`), §2.11 (`hilbert90`, `fppf_kummer_sequence`, étale for `n` invertible), §2.15 (`etale_galois_comparison` for fields, `etale_cohomology_limits`, `hochschildSerre_galois_covering` for profinite Galois coverings), §2.22 (the Brauer group of a scheme). These supply the étale side of §3.15; the arithmetic comparison itself is proved there.

### From PadicMeasuresIwasawaAlgebras

§1.7 (comparison of integral measures with the completed group algebra), §4.1 (pseudo-null modules and pseudo-isomorphism), §4.2 (the structure theorem and its consequences: reflexive modules over a regular local ring of dimension two are free, and a finitely generated `Λ`-module has projective dimension at most one iff it has no nonzero finite submodule), §4.4 (generator change and Iwasawa invariants), §4.6 (characteristic ideals, their transport along semilinear equivalences, and the isotypic decomposition over `Λ(H × ℤ_p)`), §5.1 (determinant lines of perfect complexes, their multiplicativity, base change and the trivialization of an acyclic complex), §6.1 (the sharp involution of a finite group ring), §6.3 (quadratic presentations and the initial Fitting ideal).

### From DerivedModuleAlgebra

§1.T.1 supplies `lim` and `lim¹`, the Mittag–Leffler criterion, the six-term exact sequence and the Milnor sequence for towers of complexes. §S.1 supplies the spectral sequence of a first-quadrant double complex.

### From PerfectoidTowers

§P9.0 supplies continuous cochains into an inverse limit and comparison with the canonical continuous-cohomology carrier for compact coefficients.

### From PadicPeriodRings

§§1.1–1.5 supply the continuous Galois action on `ℂ_p`, Ax–Sen–Tate, normalized cyclotomic traces, Tate's `H⁰/H¹` calculations and the topological de Rham period rings. §2 supplies their general-base Tate–Sen form; §3 supplies the principal `O_C` envelope, its presentation and completion, `θ_cris` and logarithm; §§4.1–4.3 supply the general-base topological period carriers, actions and structure maps, invariant functors and rational predicates, fixed fields, regularity and underlying fundamental period sequence. Finite-K period objects use these same carriers.

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory

§§R07.P2–R07.P5 supply finite-K comparison contracts for the period carriers, functors and fixed fields of PadicPeriodRings §§3–4: §R07.P2 identifies the crystalline period structures; §R07.P3 supplies the additional fundamental exact sequences, continuous sections and boundary maps; §§R07.P4–R07.P5 identify the fixed fields and arithmetic realization interfaces. Section R07.P5a supplies integral crystalline predicates with `HT(ℚ_p(1)) = +1`. This roadmap uses `HT(ℚ_p(1)) = −1`: a local weight interval `[a,b]` here is tested by the supplied predicates `IsTorsionCrystalline(R,−b,−a)` and `IsIntegralCrystalline(R,−b,−a)` at the reindexed interval. This reindexing introduces no separate crystalline notion; scalar restriction to `ℤ_p` and all finite reductions use the same conversion. §R07.3.3a supplies the filtered Frobenius carrier over a general ring with an automorphism and its complete API; §R07.3.4 specializes it to `W(k)`. Sections R07.3.6–R07.3.7, R07.3.10–R07.3.12, R07.3.14 and R07.3.16–R07.3.17 supply the period carrier, the torsion realization with its exactness, full faithfulness and subquotient closure, the lattice functor, rational admissibility and the lattice correspondence; §4.7 consumes them and adds only the essential-image comparison with the reindexed predicates. Section R07.3.15 supplies the period comparison behind §R07.3.16.

### From NeronModelsAndSemistableAbelianVarieties

§3.10 supplies potential semistable reduction; §§3.13–3.14 supply Raynaud uniformization and its full `1`-motive. §5.3 supplies `PadicComparison`, `AbelianVariety.deRham` and finite-extension de Rham descent, including the homological Tate-module convention and the filtered realization of the full Raynaud `1`-motive. Section 4.26 applies these geometric comparisons to the period carriers of PadicPeriodRings §§1.1–1.5, `2`–3, 4.1–4.3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5. The comparison preserves Frobenius, filtration and the duality between the homological Tate module and `H¹`.

### From AbelianSchemesAndArithmeticModuli

§§A2.2–A2.3 supply the dual abelian variety, rigidified Poincaré bundle, biduality and Mumford map; §§A3.1–A3.5 and A3.7 supply isogenies, multiplication kernels, dual isogenies and the intrinsic and polarized Weil pairings. Section A5.1 supplies complex lattice uniformization; §2.12a constructs its real conjugation compatibility. These are the geometric inputs to §§2.12a and 4.29, including A2.2's positive elliptic self-duality `a ↦ O([−a] − [O])` and A3.5's inversion comparison with the other self-duality. Section A4.3 supplies the degree-one de Rham and vector-extension comparison used in §4.26.

### Gamma products

LFunctions Layer 0 (*Completed L-function data*)
owns `AnalyticLFunctionData.gammaFactor` on the record's real and complex shift multisets;
ZerosOfLFunctions Layer 1, items 5–6 (*Gamma-factor asymptotics and the continued L-function*),
owns its arbitrary-complex-shift divisor and analytic reciprocal. Section 4.14 owns the
Hodge/sign recipe, its integral pole count, Tate-dual transformation and the comparison
of the Hodge product with that record's factor. Its Hodge order formulas use
Mathlib's scalar Gamma results directly; they require only a Hodge realization. The record
comparison consumes LFunctions Layer 0, independently of its arithmetic L-function constructions.

## How to read the build

Layer 0 applies ArithmeticGaloisDuality §§R02.3.0a–R02.3.0c to local completion, Kummer comparisons and coefficient limits, and develops weak semisimplicity. Layer 2 specializes the supplied number-field Selmer fibres and extends their coefficients, using ArithmeticGaloisDuality §§D7.7.1–D7.7.6 for annihilators and mapping-fibre duality beyond the common lattice domain. Layer 2A identifies arithmetic compact support, proves the function-field dimension formula and compares Selmer complexes with deformation tangents, determinant fibres and derived coefficient change. Layer 3 fixes the Iwasawa algebras (§3.0), identifies the supplied induced Iwasawa coefficients and control maps, extends them to the general coefficients of §3.1, and computes Selmer-specific errors and determinants, and compares with étale cohomology (§3.15), then proves Greenberg's structure criteria under their explicit hypotheses. Layer 4 applies the supplied period rings, crystalline predicates and filtered modules to the small-weight realization and finite conditions, the archimedean criticality, the cyclotomic arithmetic dictionary and the parity theorems (§§4.28–4.29).

## Layer 0: Completions and coefficient limits

### 0.4 Local completion and algebraic tensor comparison

Import `A(K)=lim_m Kˣ/(Kˣ)^(p^m)` and its p-adic module from TauCetiRoadmap.LocalGaloisGroups Layer 7 (`padicCompletionUnits`), whose carrier is defined for arbitrary fields. Its free-quotient rank `[K:ℚ_p]+1` requires `K/ℚ_p` finite; for `ℓ≠p` use LocalFieldsRamification Layer 1’s multiplicative decomposition instead. Identify it with the Mathlib completion of ArithmeticGaloisDuality §R02.3.0a through their common quotient tower. For `K/ℚ_ℓ` finite the canonical `Kˣ⊗ℤℤ_p→A(K)` is surjective and not injective: valuation contributes `ℤ_p`; principal units contribute their p-adic completion, not their algebraic tensor product. For `ℓ=p` the noninjectivity includes `a⊗1−1⊗a` in `ℤ_p⊗ℤℤ_p` with `a∉ℚ`; for `ℓ≠p` the nonzero tensor of the pro-`ℓ` unit factor is killed by completion.

`K/ℚ_ℓ` finite, `ℓ` any prime (`ℓ = p` allowed).

Prove this as follows. Import the valuation/unit decomposition (TauCetiRoadmap.LocalFieldsRamification Layer 1) and `A(K)` (TauCetiRoadmap.LocalGaloisGroups Layer 7); construct the comparison through the quotient tower, without a second local completion carrier. The finite roots-of-unity factor and valuation factor are in the tensor image. For `ℓ=p`, multiplication `ℤ_p⊗ℤℤ_p→ℤ_p` is onto; for `ℓ≠p` multiplication by `p` is invertible on principal units, so their completion vanishes. Rationalize the principal-unit tensor factor to prove the asserted kernel is nonzero; the same argument embeds the `ℓ=p` antisymmetric tensor in `ℚ_p⊗ℚℚ_p`.

(Rodrigues Jacinto–Williams (arXiv v2), §10.5, (10.8), printed p. 53 (arXiv v2).)

For `ℓ ≠ p`, the kernel contains `U^1_K ⊗ ℤ_p ≠ 0`.

*Needs:* ArithmeticGaloisDuality §R02.3.0a (Comparison of the multiplicative completion with Mathlib adic completion); TauCetiRoadmap.LocalFieldsRamification Layer 1; TauCetiRoadmap.LocalGaloisGroups Layer 7.

### 0.5 Profinite topology on the local Kummer comparison

Use Tau Ceti's `TauCeti.finiteIndex_range_powMonoidHom` for `K/ℚ_ℓ` finite and `n ≥ 1`, and `TauCeti.kummerIso`, to put the finite discrete topology on `Kˣ/(Kˣ)^(p^m)` and `H¹(K,μ_(p^m))`. Their compatible Kummer isomorphisms induce a homeomorphism of inverse limits. The target is the topological comparison; the power-class finiteness is Tau Ceti's.

`K/ℚ_ℓ` finite; `n ≥ 1`.

Prove this as follows. Take finite power quotients (`TauCeti.finiteIndex_range_powMonoidHom`) and finite-level Kummer isomorphisms (`TauCeti.kummerIso`) from Tau Ceti. Endow both towers with finite discrete topologies. Compatibility identifies the closed subsets of products defining the inverse limits. The resulting algebraic isomorphism and its inverse are continuous by the inverse-limit universal property.

(Rubin (1999 draft), Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163).)

For a number field `F` and `n≥2, F^×/(F^×)^n` is infinite; for `n=1` it is trivial. Thus the full global p-power quotient tower is not a tower of finite groups.

**Checks.**

- For `F=ℚ` and `n=1` the power-class quotient is the trivial group, of cardinality one.
- For `F=ℚ` and `n≥2`, distinct rational primes give distinct power classes, as their valuations differ modulo `n`.
- For finite `K/ℚ_ℓ` the finite discrete p-power quotients give a compact inverse limit, and the compatible finite-level Kummer inverses induce its continuous inverse comparison.

*Needs:* Tau Ceti `TauCeti.powerClassQuotient`; TauCetiRoadmap.LocalFieldsRamification Layer 1; TauCetiRoadmap.ProfiniteCohomology Layer 9.

### 0.6 The limit Kummer map

For a field `K` with `p` invertible, `κ_∞ : lim_m K^×/(K^×)^{p^m} → lim_m H¹(G_K, μ_{p^m})` is the limit of the Kummer class maps (TauCeti.kummerClassMap) along the coefficient transition square specified in Scope and ownership. It is bijective by the finite-level Kummer isomorphisms and their coefficient-transition square.

`p` invertible in `K`.

The construction proceeds as follows. Levelwise injectivity `(TauCeti.kummerClassMap_injective)` passes to inverse limits. Levelwise bijectivity (Hilbert 90) gives an isomorphism of inverse systems, hence of limits.

(Rodrigues Jacinto–Williams (arXiv v2), §10.5, display (10.7), printed p. 52 (arXiv v2).)

The library targets include the following operations and identities:

- `κ_∞` is injective.
- `κ_∞` is bijective given Hilbert 90 at every level.
- For finite separable `L/K` with an embedding, `κ_∞` commutes with restriction and the inclusion `Kˣ → Lˣ`.
- `κ_∞` carries the norm `N_{L/K}` to corestriction.
- `κ_∞` is `ℤ_p`-linear.

**Checks.**

- `K` separably closed: both sides are `0`.
- `K=ℝ, p=2, m≥1: ℝˣ/(ℝˣ)^(2^m) ≅ ℤ/2 ≅ H¹(ℤ/2,μ_(2^m))`; both inverse limits are `ℤ/2`.
- `K=𝔽_q, p∤q`: both inverse limits are the p-primary part of `𝔽_qˣ`, using arithmetic Frobenius and multiplication-by-p coefficient transitions.
- `K = ℚ`: the limit is not `ℤ_p ⊗ ℚ^×` (ArithmeticGaloisDuality §R02.3.0a, the infinite free sum check).

The limit is taken of groups; topologies are compared in §0.8.

*Needs:* Tau Ceti `explicitCoeff1_kummerCoeffPow_kummerMap` (Scope and ownership); ArithmeticGaloisDuality §R02.3.0a (Comparison of the multiplicative completion with Mathlib adic completion); Tau Ceti `TauCeti.kummerClassMap`; Tau Ceti `TauCeti.kummerClassMap_injective`; Tau Ceti `TauCeti.powerClassQuotient`; TauCetiRoadmap.ProfiniteCohomology Layer 9.

### 0.7 The system `μ_{p^m}(K)` is Mittag-Leffler

For any field `K`, the inverse system `m ↦ μ_{p^m}(K) = H⁰(G_K, μ_{p^m})` with the p-th power maps consists of finite groups (at most `p^m` elements), so it is Mittag-Leffler and `lim^1_m H⁰(G_K, μ_{p^m}) = 0`.

`K` any field with `p` invertible.

Prove this as follows. `μ_{p^m}(K)` has at most `p^m` elements `(card_rootsOfUnity)`. A system of finite sets is Mittag-Leffler `(CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range)`. `lim^1` of a Mittag-Leffler system of groups vanishes (DerivedModuleAlgebra §1.T.1).

(Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162).)

This is the finiteness hypothesis of Rubin's Proposition B.2.3 for `i = 1`.

*Needs:* Mathlib `card_rootsOfUnity`; Mathlib `rootsOfUnity`; Mathlib `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`; DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*).

### 0.8 The p-adic Kummer identification

`Suggested.lean` states the algebraic isomorphism as `padicKummer_equiv`, using `compactTateCoefficients`, the topological representation on Tau Ceti's `PadicTateTwist` with its cyclotomic action, and `TauCeti.padicCompletionUnits` for the multiplicative completion. For a field `K` with `p` invertible, `H¹(G_K, ℤ_p(1)) ≅ lim_m K^×/(K^×)^{p^m} = (K^×)^,` where `ℤ_p(1) = lim μ_{p^m}` is a compact coefficient module and `H¹` is continuous-cochain cohomology (ArithmeticGaloisDuality Layer R02.1). The map is `H¹(G_K, ℤ_p(1)) → lim_m H¹(G_K, μ_{p^m})`, an isomorphism because the Milnor term `lim^1 H⁰(G_K, μ_{p^m})` vanishes, followed by `κ_∞^{−1}`. It is an algebraic isomorphism for every `K`; when every `K^×/(K^×)^{p^m}` is finite (local fields) both sides are profinite and it is a homeomorphism. It is compatible with restriction and with corestriction versus the norm for finite separable extensions.

`p` invertible in `K`. No finite generation of `K^×` is assumed; the target is the completion, not `K^× ⊗ ℤ_p`.

Prove this as follows. Milnor sequence `0 → lim^1 H⁰(G_K, μ_{p^m}) → H¹(G_K, ℤ_p(1)) → lim H¹(G_K, μ_{p^m}) → 0` (DerivedModuleAlgebra §1.T.1; PerfectoidTowers §P9.0; Rubin Proposition B.2.3). §0.7 kills the `lim^1` term. §0.6 identifies the limit with `(K^×)^.` For local `K`, §0.5 makes both sides profinite, and a continuous bijection of compact Hausdorff groups is a homeomorphism.

(Rubin (1999 draft), Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); Rodrigues Jacinto–Williams (arXiv v2), §10.5, display (10.7), printed p. 52 (arXiv v2).)

For `K = ℚ` the identification holds with the completion, and `ℚ^× ⊗ ℤ_p → H¹(G_ℚ, ℤ_p(1))` is not surjective.

*Needs:* §0.6 (The limit Kummer map); §0.7 (The system `μ_{p^m}(K)` is Mittag-Leffler); §0.5 (Profinite topology on the local Kummer comparison); DerivedModuleAlgebra §1.T.1 (*The Milnor sequence for towers of complexes*); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*).

### 0.9 The Kummer identification for S-units

This S-unit Kummer adapter applies the completion comparison of ArithmeticGaloisDuality §R02.3.0c. Let `F` be a number field and `S` a finite set of places containing those above `p` and `∞`. Then `H¹(G_{F,S}, ℤ_p(1)) ≅ ℤ_p ⊗ 𝓞_{F,S}^×`, compatibly with restriction to finite extensions inside `F_S` and with corestriction versus the norm.

`S ⊇ {v | p∞}`, so `μ_{p^m}` is a `G_{F,S}`-module and `p` is an S-unit.

Prove this as follows. The Kummer sequence for `G_{F,S}: 0 → 𝓞_{F,S}^×/p^m → H¹(G_{F,S}, μ_{p^m}) → Pic(𝓞_{F,S})[p^m] → 0` (ArithmeticGaloisDuality Layer R02.3). Pass to the limit: §0.7 removes `lim^1 H⁰`; `Set.unit_moduleFinite` of ArithmeticGaloisDuality §R02.3.0c makes the terms `𝓞_{F,S}^×/p^m` finite; `lim_m Pic[p^m] = T_p Pic = 0` because `Pic(𝓞_{F,S})` is finite. `lim 𝓞_{F,S}^×/p^m = ℤ_p ⊗ 𝓞_{F,S}^×` (ArithmeticGaloisDuality §R02.3.0c).

(Milne, *Arithmetic Duality Theorems*, Chapter I, §4, proof of Lemma 4.12, p. 59 (PDF p. 67), and proof of Corollary 4.18, p. 63 (PDF p. 71), as in ArithmeticGaloisDuality §R02.3.3, *The Kummer sequence for S-units*; Rubin (1999 draft), Appendix B, Proposition 2.3, p. 152 (PDF p. 162).)

The tower limit is §§3.1 and 4.19; Burungale–Tian §2.2.3 is a downstream Iwasawa étale-cohomology application (§3.15).

*Needs:* §0.7 (The system `μ_{p^m}(K)` is Mittag-Leffler); HeightsAndUnits §4.2 (S-unit rank); ArithmeticGaloisDuality §R02.3.0c (S-unit rank and cardinality adapter, `Set.unit_moduleFinite`, and Completion of S-units); DerivedModuleAlgebra §1.T.1 (*The Milnor sequence for towers of complexes*); ArithmeticGaloisDuality §R02.3.3 (*The Kummer sequence for S-units*).

### 0.10 Which inverse-limit hypotheses hold

For every field `K` with `char K≠p`, the `μ_(p^m)(K)` tower is finite and hence Mittag–Leffler. The `H¹(K,μ_(p^m))` tower is Mittag–Leffler for every such `K` as well: under finite-level Kummer its transitions are the surjections `Kˣ/(Kˣ)^(p^(m+1))→Kˣ/(Kˣ)^(p^m)`. Thus both `H¹(K,ℤ_p(1))` and `H²(K,ℤ_p(1))` have their ordinary inverse-limit descriptions. For `G_(F,S), S⊇{p,∞}`, finite `H¹` gives Mittag–Leffler separately. Infinite cardinality of the full number-field `H¹` does not obstruct Mittag–Leffler; surjectivity proves it.

`p` invertible; `F` a number field; `S` finite.

Prove this as follows. `H⁰`: use §0.7. `H¹` for the full `G_K`: finite-level Kummer theory and the coefficient transition square `explicitCoeff1_kummerCoeffPow_kummerMap` identify transitions with surjective quotient maps. Apply the supplier Mittag–Leffler theorem, without assuming finiteness. `H¹` for `G_(F,S)`: use finite restricted-ramification cohomology. Apply the imported Milnor exact sequences in degrees one and two; other coefficient towers require their own hypotheses.

(Rubin (1999 draft), Appendix B, §2, Proposition 2.3, printed p. 152 (PDF p. 162); Rubin (1999 draft), Appendix B, §2, Proposition 2.7, printed p. 153 (PDF p. 163).)

Every interchange of `H²` with an inverse limit cites one of the three cases above.

*Needs:* §0.7 (The system `μ_{p^m}(K)` is Mittag-Leffler); §0.5 (Profinite topology on the local Kummer comparison); §0.9 (The Kummer identification for S-units); DerivedModuleAlgebra §1.T.1 (*The Milnor sequence for towers of complexes*); Tau Ceti `explicitCoeff1_kummerCoeffPow_kummerMap` (Scope and ownership); DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); §0.6 (The limit Kummer map).

### 0.11 Cup products and Shapiro under p-adic Kummer

The p-adic Kummer equivalence intertwines restriction with extension of scalars, corestriction with the field norm, and cup product with the inverse limit of the finite `μ_(p^m)` cup products. For a finite separable extension `L/K`, Shapiro followed by evaluation at the identity identifies the induced Kummer class with its L-class; composing the induced-coefficient trace with Shapiro is norm/corestriction. In particular `cor(κ_L(a)∪res x)=κ_K(N_(L/K)a)∪x`. The cup target is `H²(K,ℤ_p(1)⊗ℤ_p M)`, not `H²(K,M)` without a twist.

`char K≠p`; `L/K` finite separable; `M` finite or compact finite free, with the continuous tensor product and coefficient comparison supplied by ArithmeticGaloisDuality.

Prove this as follows. Use the finite connecting-map squares and Tau Ceti's Kummer restriction and norm identities (`TauCeti.kummerIso_res`, `TauCeti.kummerIso_norm`). Apply cup naturality and the projection formula at every finite coefficient level; pass through the Milnor comparison with the actual derived-limit term when it does not vanish. Use Shapiro evaluation and its trace/corestriction compatibility at finite level, then the coefficient-limit comparison. No new cup or Shapiro theory is introduced.

(Rubin (1999 draft), Appendix B §§4–5, pp. 155–158; Chapter I Example 2.1, p. 3.)

**Checks.**

- For `L=K`, Shapiro and the norm are the identity.
- For `x=κ_K(b)`, the formula has the Tate-twist-two cup target.
- For a base-field `a, κ_K(N a)=[L:K]κ_K(a)`, so replacing corestriction by restriction fails.

*Needs:* §0.8 (The p-adic Kummer identification); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 12.

### 0.12 Weak semisimplicity at the invariant eigenvalue

For a finite-type `ℤ_p`-module or finite-dimensional `ℚ_p`-space `M` with continuous action of a procyclic group `Γ=Ẑ`, let `can:M^Γ→M_Γ` be inclusion followed by quotient. `M` is weakly semisimple when `can` is an isomorphism. With a topological generator `σ`, this is the direct decomposition `M=ker(σ−1)⊕im(σ−1)`; it is weaker than semisimplicity of every eigenvalue. Supply the same definition after restriction of an O-action to `ℤ_p`.

`Γ` procyclic; continuity in the natural p-adic topology; finite type for integral modules.

The construction proceeds as follows. For a topological generator `σ`, continuity and closedness of `ker(σ−1)` and `im(σ−1)` in a finite-type p-adic module identify invariants and continuous coinvariants with this kernel and cokernel. The decomposition is elementary linear algebra; no finite-index descent theorem is used. Define the canonical map, independent of generator. Kernel zero and surjectivity are exactly the direct decomposition. Transport through equivariant isomorphisms and direct sums.

(Liu–Tian–Xiao–Zhang–Zhu, Definition 2.1.2, p. 121.)

The library targets include the following operations and identities:

- `invariantCoinvariantMap` — the map `can : ker(σ − 1) → coker(σ − 1)` for a chosen generator `σ`.
- `IsWeaklySemisimple` — `can:M^Γ→M_Γ` is bijective.
- Equivalent to `ker(σ−1)⊕im(σ−1)=M`.
- An equivariant module equivalence preserves the condition.
- Finite direct sums are weakly semisimple iff every summand is.

**Checks.**

- The trivial action is weakly semisimple, with `can=id`.
- The linear invariants-to-coinvariants criterion fails for `σ=[[1,1],[0,1]]` on `ℚ²`; its invariant line maps to zero. The same computation holds over `ℚ_p²` with the continuous procyclic unipotent action.
- The linear criterion holds for `σ=[[2,1],[0,2]]` on `ℚ²` because `σ−1` is invertible, although `σ` is not semisimple. The same computation applies over `ℚ_p` for `p` odd.

*Needs:* ArithmeticGaloisDuality §R02.3.0a (Comparison of the multiplicative completion with Mathlib adic completion).

### 0.13 Procyclic invariants and integral lifting

For finite-type integral `M` with procyclic `Γ: M_Γ=0` implies `M^Γ=0`; surjectivity of `can:M^Γ→M_Γ` implies bijectivity. Weak semisimplicity is preserved by equivariant subquotients and finite sums. If `M` is a free O-lattice, `M/λM` is weakly semisimple and `dim_E(M⊗E)^Γ≥dim_k(M/λM)^Γ`, then equality holds and `M` is weakly semisimple.

`O` the integers of `E/ℚ_p`; `λ` a uniformizer; `M` free for the last assertion.

The endomorphism form of the surjectivity criterion holds on any Noetherian module
over a commutative ring. The integral lifting statement `weaklySemisimple_integral_lift` in `Suggested.lean`
holds for a finite free module over any DVR `O`, with fraction field `K` and residue field
`k`: for an endomorphism `σ`, assume that its scalar extension to `k` is weakly semisimple
and that `dim_k ker(σ_k−1) ≤ dim_K ker(σ_K−1)`. Then `σ` is weakly semisimple over `O`
and these dimensions agree. Scalar extension uses Mathlib's `LinearMap.baseChange`.

Prove this as follows. For coinvariants zero, `σ−1` is a surjective endomorphism of a Noetherian module, hence injective. Apply this to the image summand to prove the surjective-can criterion. Use the induced invariant/image splitting for subquotients and finite sums. Reduction bounds the invariant rank above by the residual invariant dimension; the assumed opposite inequality forces equality. Lift the invariant summand and apply Nakayama to its complement, following Lemma 2.1.5.

(Liu–Tian–Xiao–Zhang–Zhu, Lemmas 2.1.3–2.1.5, pp. 121–123.)

**Checks.**

- `M=ℤ_p` with `σ=1+p` has rational invariants zero and residual invariants one, so the dimension hypothesis fails and `can` is not bijective.
- The residual unipotent two-dimensional action fails the §0.12 hypothesis.
- The trivial free rank-r action satisfies both dimensions `r` and `can=id`.

*Needs:* §0.12 (Weak semisimplicity at the invariant eigenvalue).

### Examples

For the endomorphism `σ=1` on a vector space the invariant-to-coinvariant map is the identity. For the size-two unipotent Jordan block its kernel and range both contain the first basis vector, so that vector maps to zero in coinvariants and weak semisimplicity fails. For a Jordan block with eigenvalue `2` over `ℚ, σ−1` is invertible and both invariant and coinvariant spaces vanish: weak semisimplicity holds although the block is not semisimple.

### Dependencies

ArithmeticGaloisDuality §§R02.3.0a–R02.3.0c supply completion and units. The other supplier interfaces: Mathlib `AdicCompletion.map`; Mathlib `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Mathlib `AdicCompletion.ofTensorProduct`; Mathlib `AdicCompletion.of`; Mathlib `AdicCompletion`; Mathlib `CategoryTheory.Functor.isMittagLeffler_of_exists_finite_range`; Mathlib `IsIntegral.of_pow`; Mathlib `NumberField.RingOfIntegers`; Mathlib `NumberField.Units.exist_unique_eq_mul_prod`; Mathlib `PadicInt.toZModPow`; Mathlib `PadicInt`; Mathlib `Set.unit`, `NumberField.Units.rank`, `NumberField.Units.exist_unique_eq_mul_prod`, `RingOfIntegers.instFintypeClassGroup`; Mathlib `card_rootsOfUnity`; Mathlib `rootsOfUnity`; Tau Ceti `TauCeti.kummerClassMap_injective`; Tau Ceti `TauCeti.kummerClassMap`; Tau Ceti `TauCeti.powerClassQuotient`; Tau Ceti `explicitCoeff1_kummerCoeffPow_kummerMap`; TauCetiRoadmap.LocalFieldsRamification Layer 1; TauCetiRoadmap.LocalGaloisGroups Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 12; TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 9; DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); DerivedModuleAlgebra §1.T.1 (*The Milnor sequence for towers of complexes*); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); ArithmeticGaloisDuality §R02.3.3 (*The Kummer sequence for S-units*).

## Layer 2: Selmer structures and complexes

### 2.1 Compact and rational Selmer data

Extend the general discrete Selmer interface of TauCetiRoadmap.EllipticCurves Layer 7 to compact lattice `T` and rational `V` cohomology, and compare coefficient propagation on `A=V/T` with that interface. Selmer data over a commutative ring `R` indexed by a set of places `ι`: a global R-module `H` (for example `H¹(G_{K,Σ}, M)`), local R-modules `H_v` (for example `H¹(K_v, M)`), R-linear localisation maps `res_v : H → H_v`, and local conditions `L_v ⊆ H_v` (R-submodules). Modifications replace the conditions: relaxed `(L_v = H_v)` on a set of places, strict `(L_v = 0)` on a set of places.

The module-theoretic diagram admits compact and rational cohomology through ArithmeticGaloisDuality Layer R02.1, with coefficient-change maps to `A=V/T`.

The construction proceeds as follows. Use the supplier’s discrete datum without introducing a second discrete carrier. Instantiate the same module-theoretic localization diagram with compact/rational cohomology and compare the maps under coefficient change.

(Mazur–Rubin (arXiv v1), §1, Definition 1.1, p. 4 (arXiv v1); Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1).)

The library targets include the following operations and identities:

- Selmer data: global module, local modules, localisation maps and local conditions.
- Replace the local conditions.
- Relaxed condition `H_v` at the places of a set `B`.
- Strict condition `0` at the places of a set `A`.
- `Sel_strict ≤ Sel ≤ Sel_relaxed`.

**Checks.**

- All conditions relaxed: the Selmer module is `H`.
- All conditions strict: the Selmer module is `⋂_v ker res_v`.
- No places: the Selmer module is `H`.
- Strict `≤` relaxed.

Mazur–Rubin's `F^b_a(n)` is the Selmer datum with its conditions replaced by strict ones at `a` and relaxed ones at `b`; transverse (Kolyvagin) conditions are not part of this roadmap.

*Needs:* Mathlib `Submodule.map_le_iff_le_comap`; TauCetiRoadmap.EllipticCurves Layer 7.

### 2.2 Compact and rational Selmer kernel

Extend the general discrete Selmer interface of TauCetiRoadmap.EllipticCurves Layer 7 to compact lattice `T` and rational `V` cohomology, and compare coefficient propagation on `A=V/T` with that interface. For Selmer data `D, Sel(D) = {c ∈ H : res_v(c) ∈ L_v for all v} = ker(H → ∏_v H_v/L_v)`.

For infinitely many places use the product. For discrete torsion coefficients arising from a
lattice ramified at finitely many places, each individual global class has only finitely many
nonzero singular localisations (Rubin's remark after Definition 5.1). Compact and rational
coefficients use the product unless a smaller target has been justified. Separately, on
`H¹(G_{K,S}, M)`, with `S` containing the archimedean places, coefficient primes and ramification
of `M`, the unramified conditions outside `S` hold automatically: each cocycle factors through
`G_{K,S}`. Neither assertion makes almost every local condition relaxed on `H¹(G_K, M)`.

The construction proceeds as follows. Intersection of the preimages of the `L_v`; equality with the kernel of the product of quotient maps.

(Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1); Rubin (1999 draft), Chapter I, §5, Definition 5.1, printed pp. 11–12 (PDF pp. 21–22).)

The library targets include the following operations and identities:

- The intersection of local-condition preimages on the supplied compact/rational diagram.
- `c ∈ Sel` iff `res_v c ∈ L_v` for all `v`.
- `Sel = ker(H → ∏_v H_v/L_v)`.
- Monotone in the local conditions.

**Checks.**

- Relaxed everywhere gives `H`.
- Strict everywhere gives `⋂ ker res_v`.
- An empty index set gives `H`.
- For `K = ℚ`, `T = ℤ_p(1)` and every prime `ℓ ≠ p`, the Kummer class of `ℓ` has singular
  localisation of valuation `1` at `ℓ`. Thus no fixed finite set supports the singular
  localisations of all classes in `H¹(ℚ, T)`.
- Choose distinct primes `ℓ_j ≠ p`. The classes of `u_m = ∏_{0 ≤ j < m} ℓ_j^(p^j)` modulo
  `(ℚ^×)^(p^m)` are compatible, since `u_(m+1)/u_m = ℓ_m^(p^m)`. Their limit Kummer class
  in `H¹(ℚ, ℤ_p(1))` has nonzero singular valuation `p^j` at every `ℓ_j`; it needs a product.

Rubin's `S^Σ` and `S_Σ` are relax and strict applied to `Σ`.

*Needs:* §2.1 (Compact and rational Selmer data); TauCetiRoadmap.EllipticCurves Layer 7.

### 2.3 Change of local conditions

If `L_v ≤ L'_v` for all `v`, then `Sel_L ⊆ Sel_{L'}` and the sequence `0 → Sel_L → Sel_{L'} → ∏_v L'_v/L_v` is exact.

Same global module and localisation maps for both conditions.

Prove this as follows. Monotonicity; a class of `Sel_{L'}` lies in `Sel_L` iff each `res_v c` lies in `L_v`, that is, iff its image in `∏ L'_v/L_v` vanishes.

(Mazur–Rubin (arXiv v1), §2, Definition 2.3 and display (2.4), pp. 6–7 (arXiv v1).)

Mazur–Rubin (2.4) is the case `L' = L` relaxed at the primes dividing `n/m`.

*Needs:* §2.2 (Compact and rational Selmer kernel).

The algebraic form is the change-of-condition map of Selmer data, whose kernel is the smaller Selmer module. The map is not asserted onto the product of local quotients.

### 2.4 Functoriality of Selmer modules

A map of Selmer data (R-linear `f : H → H', f_v : H_v → H'_v` with `f_v ∘ res_v = res'_v ∘ f` and `f_v(L_v) ⊆ L'_v`) maps `Sel(D)` into `Sel(D')`.

Compatibility squares and inclusion of conditions.

Prove this as follows. Chase: `res'_v(f c) = f_v(res_v c) ∈ f_v(L_v) ⊆ L'_v`.

(Rubin (1999 draft), Chapter I, §5, Lemma 5.4, printed p. 12 (PDF p. 22).)

Applied to `T → V → W` with the propagated conditions of §2.6. The algebraic statement is that a map of Selmer data carries one Selmer module into the other.

*Needs:* §2.2 (Compact and rational Selmer kernel).

### 2.5 Propagating local conditions

Along a coefficient map inducing `g : H¹(K_v, X) → H¹(K_v, Y)`, a condition `L ⊆ H¹(K_v, X)` propagates forwards to `g(L)` (quotients `T ↠ T`/IT, `V → W`), and a condition `L' ⊆ H¹(K_v, Y)` propagates backwards to `g^{−1}(L')` (submodules `T[I] ↪ T, T → V`). The two form a Galois connection.

Any R-linear `g`.

The construction proceeds as follows. Image and preimage of submodules; Galois connection `Submodule.map_le_iff_le_comap`.

(Mazur–Rubin (arXiv v1), §1, Definition 1.1, p. 4 (arXiv v1).)

The library targets include the following operations and identities:

- Forward propagation `g(L)`.
- Backward propagation `g^{−1}(L')`.
- `g(L) ≤ L' ↔ L ≤ g^{−1}(L')`.
- The relaxed condition propagates forwards along a surjection to the relaxed one.
- The strict condition propagates backwards to `ker g`.

**Checks.**

- Forward propagation of `⊤` along a surjection is `⊤`.
- Backward propagation of `⊥` is the kernel.
- Forward propagation along `g∘h` applies `h` then `g`; backward propagation applies `g` then `h: (g∘h)⁻¹(L)=h⁻¹(g⁻¹(L))`.

Mazur–Rubin propagate by image to `T`/IT and by inverse image to `T[I]`.

*Needs:* Mathlib `Submodule.map_le_iff_le_comap`.

### 2.6 From `V` to `T` and `W`; saturation

Given `L_V ⊆ H¹(K_v, V)`, put `L_T =` inverse image under `H¹(K_v, T) → H¹(K_v, V)` and `L_W =` image under `H¹(K_v, V) → H¹(K_v, W)` (Rubin's `H¹_f(K_v, T), H¹_f(K_v, W)`). Then `H¹(K_v, T)/L_T` is torsion-free (`L_T` is saturated) and `L_W` is divisible. The algebraic assertion holds for any domain `O` with fraction field `E`: the preimage of an E-subspace under an O-linear map is saturated for every nonzero element of `O`. In particular, `O = ℤ`, `E = ℚ` gives saturation for every nonzero integer.

`T` a finitely generated free `ℤ_p`- or O-module with continuous action, `V = T[1/p], W = V/T`; `L_V` an E-subspace (a `ℚ_p`-subspace for `O=ℤ_p`).

Prove this as follows. If `n·x ∈ L_T` with `n ≠ 0` then `n·x ↦ n·y ∈ L_V`, and `y ∈ L_V` as `L_V` is an E-subspace, so `x ∈ L_T`. `L_W` is the image of a `ℚ_p`-vector space, hence divisible. The maps `H¹(T) → H¹(V) → H¹(W)` come from ArithmeticGaloisDuality Layer R02.1.

(Rubin (1999 draft), Chapter I, §3.2, Definition 3.4, printed p. 5 (PDF p. 15); Rubin (1999 draft), Chapter I, §3.2, proof of Lemma 3.5, printed p. 6 (PDF p. 16).)

Saturation on `T` and divisibility on `W` are separate properties of the propagated conditions.

**Checks.**

- For `O = ℤ`, `E = ℚ`, the inclusion `g : ℤ → ℚ` and `L_V = 0` give preimage `0`, saturated for every nonzero integer. The scalar `n = 0` cannot be allowed: `0·1 ∈ 0` but `1 ∉ 0`.
- For `Y = E` and `L_V = E` the preimage is all of `X`, including when `X` has O-torsion.
- The ℤ-submodule `2ℤ ⊂ ℚ` is not a ℚ-subspace: its preimage under `ℤ → ℚ` contains `2·1` but not `1`, so the E-linearity hypothesis is necessary.

*Needs:* §2.5 (Propagating local conditions); ArithmeticGaloisDuality §R02.1.3 (*The sequence `T → V → W` and the torsion of `H¹(T)`*).

### 2.7 The unramified condition

For a decomposition group `G_v` with inertia subgroup `I_v` and a `G_v`-module `B, H¹_ur(K_v, B) = ker(H¹(G_v, B) → H¹(I_v, B))`. By inflation–restriction it is the image of `H¹(G_v/I_v, B^{I_v})`, and for procyclic `G_v/I_v` generated by `Fr` and `B` discrete torsion, finitely generated over `ℤ_p` or finite-dimensional over `ℚ_p` it is `B^{I_v}/(Fr − 1)B^{I_v}`.

The definition and the inflation description: `B` discrete, a finitely generated `ℤ_p`-module, or a finite-dimensional `ℚ_p`-space. The coinvariant formula: `B` a discrete torsion module, a finitely generated `ℤ_p`-module, or a finite-dimensional `ℚ_p`-space (Rubin Lemma I.3.2); it fails for discrete `B` that is not torsion.

On the number-field lattice domain of NoncommutativeAndEquivariantIwasawa §F.4 this condition is that supplier's unramified condition; this target is its extension to arbitrary profinite decomposition groups and the coefficients above.

The construction proceeds as follows. Kernel of restriction to inertia. Inflation–restriction (TauCetiRoadmap.ProfiniteCohomology Layer 5; Rubin Proposition B.2.5(i)) identifies it with the image of `H¹(G_v/I_v, B^{I_v})`, and ArithmeticGaloisDuality §R02.2.3a identifies that image with the Frobenius coinvariants.

(Rubin (1999 draft), Chapter I, §3.1, Definition 3.1, printed p. 4 (PDF p. 14); Rubin (1999 draft), Chapter I, §3.1, Lemma 3.2(i), printed p. 4 (PDF p. 14).)

The library targets include the following operations and identities:

- The unramified condition `ker`(`res` to inertia).
- Inflation–restriction — The discrete case is the pinned `TauCeti.ContCohomology.explicitInfRes_exact`: the range of `explicitInfl1` equals the kernel of `explicitRes1`, for every topological group and normal subgroup with the continuous module actions in its signature. For a profinite decomposition group `G_v` and closed normal inertia `I_v`, identify the compact finite-type and rational unramified conditions with the range of inflation from `H¹(G_v/I_v,B^{I_v})` through ArithmeticGaloisDuality §R02.2.3. Mathlib `LinearMap.exact_iff` supplies the algebraic range/kernel conversion.
- Its identification with `B^{I}/(Fr − 1)B^{I}`.

**Checks.**

- `B = ℤ/p` with trivial action over `ℚ_ℓ: H¹_ur = Hom(Gal(K^ur/K), ℤ/p) = ℤ/p`.
- For `K/ℚ_ℓ` finite with `ℓ≠p` and an unramified lattice `T, H¹_f(K,W)=H¹_ur(K,W)` (Rubin Lemma 3.5(iv)).
- For `K/ℚ_ℓ` with `ℓ≠p, H¹_f(K,T)/H¹_ur(K,T) ≅ (W^I/(W^I)_div)^(Fr=1)`; this is nonzero for a Tate curve with p-divisible Tamagawa number, so raw unramifiedness is too small.
- `B = ℤ`, discrete with trivial action: `H¹(Ẑ, ℤ) = Hom_cont(Ẑ, ℤ) = 0`, since a compact subgroup of the discrete group `ℤ` is finite, while `ℤ/(Fr − 1)ℤ = ℤ`. The coinvariant formula needs torsion discrete coefficients.

Unramified `B: H¹_ur = B/(Fr − 1)B`.

*Needs:* §2.1 (Compact and rational Selmer data); ArithmeticGaloisDuality §§R02.2.3–R02.2.3a (inflation–restriction and procyclic `H¹`); TauCetiRoadmap.ProfiniteCohomology Layer 5; NoncommutativeAndEquivariantIwasawa §F.4 (module-level local conditions).

### 2.8 Greenberg's local condition

For a decomposition group `G_v` at `p` with inertia `I_v` and a `G_v`-stable submodule `F^+M ⊆ M, L^Gr_v = ker(H¹(G_v, M) → H¹(I_v, M/F^+M))`. `F^+M` need only be stable under `G_v`, not under the global Galois group.

`F^+` stable under `G_v`; for `W = V/T` use the image `F^+W` of `F^+V`. When `F^+T` is a stable direct summand of a lattice on the domain of NoncommutativeAndEquivariantIwasawa §F.4, the condition equals that supplier's Greenberg condition; stable submodules that are not direct summands are the extension owned here.

The construction proceeds as follows. Kernel of the composite of restriction to `I_v` and the map induced by `M → M/F^+M`.

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.1, Definition 13.19(1), p. 70 (arXiv v2).)

The library targets include the following operations and identities:

- The Greenberg condition `ker(H¹(G_v, M) → H¹(I_v, M/F^+M))`.
- For `F^+ = 0`, the isomorphism `e : H¹(I_v,M) ≃ H¹(I_v,M/0)` induced by the coefficient quotient gives `ker(e ∘ res_I) = ker res_I`, identifying the Greenberg and unramified conditions.
- `F^+ = M` gives the relaxed condition.
- `H¹_ur ⊆ L^Gr`.

**Checks.**

- `F^+ = 0: L^Gr = H¹_ur`.
- `F^+ = M: L^Gr = H¹`.
- For an ordinary elliptic curve, the ordinary line of `V_pE` is `G_{ℚ_p}`-stable but not `G_ℚ`-stable; the condition is still defined.
- For `T = ℤ₃(1)` over `ℚ` at the place `3`, `F^+ = T` gives the full condition `H¹(ℚ₃, T)` and `F^+ = 0` gives the unramified condition, in agreement with NoncommutativeAndEquivariantIwasawa §F.4's Greenberg conditions for these two direct summands.

For `M = W_n = (ℚ_p/ℤ_p)(n)` over `ℚ(μ_{p^∞})^+` with `Fil^1 = W_n (n ≥ 1)` or `0 (n ≤ 0), L^Gr` is everything or the unramified condition (RJW §13.5.2).

*Needs:* §2.7 (The unramified condition); §2.1 (Compact and rational Selmer data); NoncommutativeAndEquivariantIwasawa §F.4 (module-level local conditions).

### 2.8a Ordinary Galois filtrations

**Ordinary filtrations.** For a finite-dimensional continuous E-representation `V` of `G_K, K/ℚ_p` finite, define an ordinary filtration to be an exhaustive separated decreasing filtration `Fil^iV` by `G_K`-stable E-subspaces, with finitely many jumps and inertia acting on gr`^iV` through `χ_cyc^i`. Call `V` ordinary if this datum exists, and take its plus part to be `Fil¹V`. The general stable-subspace condition in §2.8 also applies when no ordinary filtration exists. For a stable O-lattice `T`, use the saturated intersections `T∩Fil^iV` and their images on `V/T`.

Give Tate-twist, direct-sum and dual-filtration operations. On `V(n)` put `Fil^i=Fil^{i−n}V`; on `V^*` put `Fil^i=ann(Fil^{1−i}V)`, and then twist by one for the Tate dual. Prove stability, inertia character, finiteness of jumps and compatibility of saturated lattice intersections with these operations. The filtration datum takes an actual representation, inertia subgroup and cyclotomic character; the arithmetic interface carries their continuity and local-field hypotheses.

(Rodrigues Jacinto–Williams, Definition 13.19(1), arXiv v2 p. 70; Greenberg, *Iwasawa theory for p-adic representations*, §1. For the supersingular boundary, Fontaine–Laffaille Theorem 5.3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.9.)

**Checks.**

- The zero representation has the zero filtration and is ordinary.
- For `ℚ_p(n), Fil^i=V` for `i≤n` and zero for `i>n`; its only graded piece has inertia `χ_cyc^n`. The character-line statement applies to a line acted on by the n-th power of the supplied character. In particular `Fil¹` is `V` for `n≥1` and zero for `n≤0`.
- The good supersingular curve `y²=x³−x` over `ℚ₃` has no ordinary filtration on `V₃E`: its residual inertia characters have niveau two, rather than integral cyclotomic powers. Good reduction alone does not imply ordinarity.

*Needs:* §2.1 (Compact and rational Selmer data); TauCetiRoadmap.LocalGaloisGroups Layer 5 (cyclotomic character); Mathlib `Representation`, `Submodule`.

### 2.9 Compact and rational Galois Selmer groups

Extend the general discrete Selmer interface of TauCetiRoadmap.EllipticCurves Layer 7 to compact lattice `T` and rational `V` cohomology, and compare coefficient propagation on `A=V/T` with that interface. For a number field `K`, a finite set `Σ` of places containing those above `p∞` and the ramified primes, and a coefficient module `M` (discrete, compact or rational), `Sel_L(K, M)` is the Selmer module of the data `H = H¹(G_{K,Σ}, M), H_v = H¹(K_v, M), res_v` the localisation (restriction to a decomposition group), with local conditions `L_v` for `v ∈ Σ`. It equals the classes of `H¹(K, M)` that are unramified outside `Σ` and satisfy `L_v` at `Σ` (Rubin Lemma I.5.3).

`Σ ⊇ {v | p∞} ∪` {ramified primes}; the conditions at `v ∉ Σ` are unramified.

For a lattice on the domain of NoncommutativeAndEquivariantIwasawa §F.4 with its unramified, Greenberg or Kummer conditions, this is that supplier's kernel-defined Selmer group; the general data of §§2.1–2.6 and arbitrary local conditions are the extension owned here.

The construction proceeds as follows. `G_{K,Σ}`, decomposition groups and localisation maps come from ArithmeticGaloisDuality Layer R02.3. Rubin's Lemma I.5.3: the unramified conditions outside `Σ` cut out `H¹(K_Σ/K, M)` inside `H¹(K, M)`.

(Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1); Rubin (1999 draft), Chapter I, §5, Lemma 5.3, printed p. 12 (PDF p. 22).)

The library targets include the following operations and identities:

- `Sel_L(K, M) =` {`c ∈ H¹(K, M) : c_v ∈ L_v (v ∈ Σ), c_v` unramified `(v ∉ Σ)`}.
- Enlarging `Σ` with unramified conditions leaves `Sel` unchanged.
- Relaxed at every `v ∈ Σ: Sel = H¹(G_{K,Σ}, M)`.
- Maps of coefficient modules with compatible conditions induce maps.

**Checks.**

- Relaxed on `Σ: H¹(G_{K,Σ}, M)`.
- With coefficients `μ_p` and relaxed conditions on `Σ={v|p∞}`, the Selmer group is `H¹(G_(K,Σ),μ_p)`, fitting into the S-unit/`p` and `Pic[p]` Kummer sequence. Requiring unramifiedness also at `p` cuts this group down.
- For `F=ℚ, p=3, Σ={3,19,∞}` and `M=μ₃`, relaxed `H¹` is `(ℤ/3)²` with Kummer generators 3 and 19, since `Pic(ℤ[1/57])=0`. Strict at 3 and relaxed at 19 gives the nonzero line generated by 19: the cube map carries `1+3ℤ₃` onto `1+9ℤ₃`, so 19 is a cube in `ℚ₃`, while 3 has valuation one. Strict at both finite places gives zero, since 19 has valuation one at 19.

Enlarging `Σ` with unramified conditions does not change the group.

*Needs:* §2.2 (Compact and rational Selmer kernel); §2.7 (The unramified condition); ArithmeticGaloisDuality §R02.3.1 (*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*); ArithmeticGaloisDuality §R02.3.1 (*Localisation maps and the modified local groups*); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*); TauCetiRoadmap.EllipticCurves Layer 7; NoncommutativeAndEquivariantIwasawa §F.4 (kernel-defined Selmer groups).

### 2.10 Pontryagin duals with the contragredient action

Extend Tau Ceti's algebraic contragredient action on p-adic characters (`TauCeti.instModulePadicCharacterContragredient`) to the continuous p-primary dual and the completed Iwasawa action. For a discrete p-primary module `M` with a continuous G-action, `M^∨ = Hom_cont(M, ℚ_p/ℤ_p)` (Mathlib's PontryaginDual for the circle, restricted to p-primary `M`) with the contragredient action `(g·f)(x) = f(g^{−1}x)`. Over a group ring `ℤ_p[[Γ]]` the dual is a module through the involution `γ ↦ γ^{−1}`.

`M` discrete p-primary; `G` acts continuously. On Selmer groups of the domain of NoncommutativeAndEquivariantIwasawa §F.4 this is that supplier's Pontryagin dual with the same action. The generic coefficient-linear duality is PadicLocalLanglandsForGL2Qp §0.3's `DualitySupport.torsionDual` at `L=ℚ_p, O=ℤ_p`; this section owns only the comparison with the circle-valued carrier, the completed Iwasawa action and the Selmer-specific dualities.

The construction proceeds as follows. For a discrete p-primary `M`, every circle-valued character has p-power torsion image; identifying the circle’s p-primary torsion with `ℚ_p/ℤ_p` gives a canonical topological isomorphism `PontryaginDual M ≅ Hom_ℤp(M,ℚ_p/ℤ_p) = DualitySupport.torsionDual M`, natural in `M` and compatible with the compact-open topologies. Transport across it the supplier's exactness (`DualitySupport.exact`), biduality (`DualitySupport.bidual`), compatibility with finite quotients and limits (`DualitySupport.finiteQuotient`) and contragredient action (`DualitySupport.contragredient`); compactness of the dual of a discrete module is that of the Pontryagin dual. Under the comparison the contragredient action is `ContinuousMonoidHom.comp` with the action of `g^{−1}`, a left action because `(gh)^{−1} = h^{−1}g^{−1}`. For `Γ` abelian profinite, the `ℤ_p[[Γ]]`-module structure on `M^∨` is the supplier's action transported through the involution `ι` of §3.0, with continuity from the completed-group-algebra topology. These are the arithmetic modules needed by corank and the closed-condition annihilator rules.

(Burungale–Tian (arXiv v2), §1.0.1 and §3.1, pp. 1 and 6 (arXiv v2); PadicLocalLanglandsForGL2Qp §0.3, after Paškūnas 2013, §2.)

The library targets include the following operations and identities:

- The canonical isomorphism `PontryaginDual M ≅ DualitySupport.torsionDual M` for p-primary `M`, natural in `M`.
- The contragredient action `(g·f)(x) = f(g^{−1}x)`.
- The contragredient action is a left action.
- As a `ℤ_p[[Γ]]`-module, `M^∨` is the dual twisted by the involution `γ ↦ γ^{−1}`.
- Selmer maps dualise contravariantly.

**Checks.**

- `(ℚ_p/ℤ_p)^∨ = ℤ_p`.
- A finite module has a finite dual of the same order.
- Trivial action dualises to trivial action.
- For `M=ℤ/7` and `g` acting by multiplication by `2` (order 3), the dual action is multiplication by 4, the inverse of `2` mod 7; direct multiplication by `2` fails.
- For `M=(ℚ₃/ℤ₃)(1)` and `g` acting by a scalar `u ∈ ℤ₃^×`, the dual action on `ℤ₃` is multiplication by `u⁻¹`, as in NoncommutativeAndEquivariantIwasawa §F.4.

Dualising twice returns `M`; `(ℚ_p/ℤ_p)^∨ = ℤ_p`.

*Needs:* Mathlib `PontryaginDual`; Mathlib `ContinuousMonoidHom.comp`; Mathlib `MulDistribMulAction.toMonoidHom`; PadicLocalLanglandsForGL2Qp §0.3 (`DualitySupport.torsionDual`, `DualitySupport.exact`, `DualitySupport.bidual`, `DualitySupport.finiteQuotient`, `DualitySupport.contragredient`); NoncommutativeAndEquivariantIwasawa §F.4 (Selmer duals); §3.0 (the involution `ι`).

### 2.11 Coranks

For a cofinitely generated discrete `ℤ_p`-module `M, corank_{ℤ_p} M = dim_{ℚ_p}(M^∨ ⊗_{ℤ_p} ℚ_p)`.

`M` cofinitely generated, so `M^∨` is a finitely generated `ℤ_p`-module.

The construction proceeds as follows. Module.finrank over `ℚ_p` of the rationalised dual.

(Burungale–Tian (arXiv v2), §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2).)

The library targets include the following operations and identities:

- The corank of a discrete cofinitely generated `M` is `dim_ℚp(ℚ_p⊗_ℤp M^∨)`.
- On a given compact dual `N=M^∨`, compute `dim_ℚp(ℚ_p⊗_ℤp N)`; the corank of `M` is this number for its Pontryagin dual.
- A finite compact dual gives corank zero.
- Additive on short exact sequences of finitely generated compact duals; exact Pontryagin duality gives the corresponding discrete corank formula.
- For `M=(ℚ_p/ℤ_p)^r` with compact dual `N=ℤ_p^r`, both computations give corank `r`.

**Checks.**

- The discrete module `ℚ_p/ℤ_p` has `corank 1`, computed from its compact dual `ℤ_p`.
- The finite discrete module `ℤ/p` has `corank 0`, computed from its finite compact dual.
- The discrete module `(ℚ_p/ℤ_p)²` has `corank 2`, computed from its compact dual `ℤ_p²`.

Additive in short exact sequences of cofinitely generated modules.

*Needs:* §2.10 (Pontryagin duals with the contragredient action); Mathlib `Module.finrank`.

### 2.12 Passage from finite elliptic Selmer groups to `p^∞`

For an elliptic curve `E` over a number field `F` and a prime `p, Sel_{p^∞}(E/F)` is the Galois Selmer group of `M = E[p^∞]` with local conditions the images of `E(F_v) ⊗ ℚ_p/ℤ_p` under the local Kummer maps; equivalently `ker(H¹(F, E[p^∞]) → ∏_v H¹(F_v, E)[p^∞])`, and the direct limit of the `Sel_{p^m}`. It sits in `0 → E(F) ⊗ ℚ_p/ℤ_p → Sel_{p^∞}(E/F) → Ш(E/F)[p^∞] → 0`.

`E/F` elliptic; the finite-level Selmer groups and local Kummer maps come from TauCetiRoadmap.EllipticCurves Layer 7.

Prove this as follows. Instantiate §2.9; identify the local conditions with the Kummer images, which are NoncommutativeAndEquivariantIwasawa §F.4's elliptic Kummer conditions `E(F_v)⊗ℚ_p/ℤ_p → H¹(F_v,E[p∞])`; pass to the direct limit over `m`.

(Burungale–Tian (arXiv v2), §1.0.1, the exact sequence and (1.1), p. 1 (arXiv v2).)

The library targets include the following operations and identities:

- The direct-limit Selmer carrier with its canonical Galois-kernel comparison.
- The exact sequence with Mordell–Weil tensor and `Ш[p^∞]`.
- Corank equals Mordell–Weil rank plus the corank of `Ш[p^∞]`.

**Checks.**

- A finite Mordell–Weil group has zero tensor with `ℚ_p/ℤ_p`, even when `E(F)[p]` is nonzero.
- Finite `Ш[p^∞]` makes Selmer corank equal to the Mordell–Weil rank; divisible `Ш` contributes an additional corank.
- When both `E(F)⊗ℚ_p/ℤ_p` and `Ш[p^∞]` vanish, the infinite Selmer group vanishes, even if finite-level torsion classes occur.

The Bloch–Kato comparison of these conditions on `V_pE` belongs to §4.26.

*Needs:* §2.9 (Compact and rational Galois Selmer groups); §2.11 (Coranks); TauCetiRoadmap.EllipticCurves Layer 7; NoncommutativeAndEquivariantIwasawa §F.4 (elliptic Kummer conditions).

### 2.12a Abelian Kummer and Sha interfaces

**Abelian Kummer, Selmer and Sha carriers.** Let `K` be a number field, `A, B` native abelian varieties over `K`, and `φ : A → B` an isogeny. Use `AbelianVariety.Points A L` for the additive form of the native group of morphisms `Spec L → A` over `K`, with identity, addition, inverse, integer multiplication and extension-of-field maps. Define `AbelianVariety.torsion A n L` as the kernel of `[n]` on these points, with inclusion for `n | m`, base-change and homomorphism compatibility; the geometric finite étale kernel remains the supplied isogeny kernel. All Galois cohomology uses discrete geometric points; prove the degree-one groups are torsion by splitting cocycles over finite extensions and using restriction–corestriction. The abelian Kummer connecting map gives `B(K)/φA(K) ↪ H¹(K,A[φ])`, natural in the field and in compositions of isogenies. Instantiate the discrete Selmer structure of EllipticCurves Layer 7 with the local Kummer images to obtain the Kummer Selmer structure and the abelian Selmer group `Sel_φ(A/K)`. Define `Ш(A/K)` by specializing Mathlib's `ContinuousCohomology.tateShafarevich` to degree one and the discrete module `A(Kˢ)`, over all places; retain its membership and kernel-of-product API.

Supply the local `H¹` comparison: restriction of `A(Kˢ)` to each local absolute Galois group followed by `A(Kˢ) → A(K_vˢ)` induces the canonical degree-one isomorphism with `H¹(K_v,A)`, compatible with Kummer maps and isogenies. At finite places descend a smooth torsor to the henselian algebraic local field and prove the required smooth approximation to its completion using étale charts, Hensel lifting and density; at real places use the real closure and complexification, and at complex places both degree-one groups vanish. Thus the fixed-coefficient kernel is the classical everywhere-locally-trivial kernel. Prove the descent sequence `0 → B(K)/φA(K) → Sel_φ(A/K) → ker(Ш(A/K) → Ш(B/K)) → 0`, by the global and local Kummer sequences. Include membership, restriction under finite field extension and comparison of the elliptic Selmer and Sha carriers with EllipticCurves Layer 7. No Mordell–Weil theorem is needed for these adapters.

(Milne, *Arithmetic Duality Theorems*, I, §3, Remark 3.10, pp. 47–48, and §6, Lemma 6.1, pp. 73–74, and Proposition 6.4, p. 75; native `AbelianVariety` and Mathlib `ContinuousCohomology.tateShafarevich`, `mem_tateShafarevich`, `tateShafarevich_eq_ker_pi`.)

**Checks.**

- The zero abelian variety has singleton point group and zero Sha. For every `A`, `[1]` has zero kernel and `[0]` has the whole point group as kernel.
- For `φ = id`, both the Kummer quotient and the Selmer group are zero; `[0]` on a positive-dimensional variety is not an isogeny.
- An elliptic curve recovers the supplied point law and Selmer group, including the point at infinity as identity; the Sha comparison includes real places, so a genus-one torsor with no real point is excluded.
- For `[n]`, `n ≥ 1`, the sequence ends in `Ш(A/K)[n]`, not all of `H¹(K,A)[n]`; local triviality is essential.

**Finite Selmer and reduced primary groups.** Prove finiteness of `Sel_φ(A/K)` for every number-field isogeny `φ`. For finite `S` containing the infinite places, the bad places of `A, B` and all primes dividing `deg φ`, good-reduction integral Kummer theory identifies the local image outside `S` with unramified `H¹(K_v,A[φ])`. Thus the Selmer group embeds into the finite group `H¹(G_{K,S},A[φ])` of ArithmeticGaloisDuality §R02.3.1. Descent makes `Ш(A/K)[n]` finite for every `n ≥ 1`.

The statement `finiteCotype_primaryDecomposition` in `Suggested.lean` gives the group decomposition: a p-primary torsion abelian group `G` with finite `G[p]` is noncanonically `(ℚ_p/ℤ_p)^r ⊕ F`, with `r` finite and `F` a finite p-group; its maximal divisible subgroup is the first summand and the quotient is finite. Finite branching of division trees gives compatible infinite division chains; split their Prüfer subgroups by injectivity of divisible abelian groups. Finite `G[p]` bounds their number. An unbounded-exponent remainder would give another infinite chain, whereas a bounded-exponent remainder is finite by induction. Apply this to `Ш(A/K)[p^∞]`; no finiteness of the full Sha group is assumed.

(Milne, I, §6, Lemma 6.1, pp. 73–74, Proposition 6.4 and Corollary 6.6, pp. 75–77, and Remark 6.7, p. 77.)

**Checks.**

- `G = ℚ_p/ℤ_p` has finite `G[p]`, but is infinite; its reduced quotient is zero.
- `G = ℤ/p²` has divisible subgroup zero and reduced quotient itself; finite p-torsion alone does not imply divisibility.
- A p-primary torsion group with `G[p] = 0` is zero; the torsion hypothesis excludes `ℤ_p` from this inference.

**All-place Kummer annihilators.** Define `KummerLocal φ v` as the image of `B(K_v)/φA(K_v)` in `H¹(K_v,A[φ])`. Prove the dual annihilator property: for every place `v`, these images and those for `φ∨ : B∨ → A∨` are exact annihilators under the finite local Tate pairing for `A[φ]` and its Cartier dual `B∨[φ∨]`. Include membership, isogeny functoriality, the good prime-to-degree unramified comparison used above, and the specialization to `[n]`, `n ≥ 1`. At finite places use ArithmeticGaloisDuality §D7.6's dual isogeny sequences. At real places construct the conjugation adapter for A5.1’s complex uniformization: the differential of the real descent involution is an antilinear involution on the tangent space, commutes with the exponential and preserves its kernel lattice. Prove that the lattice-to-torsion identifications intertwine this involution with Galois conjugation and that Poincaré duality intertwines the two lattice actions with conjugation on roots of unity. Use the resulting conjugation-equivariant lattice sequences and the Tate complex with differentials `1 − c` and `1 + c`; their adjoint exact sequences give the same annihilators. In degree zero the real Tate group is `A(ℝ)/N A(ℂ) = π₀ A(ℝ)`, so its two-primary part is retained. At complex places `H¹ = 0` and the Kummer quotients vanish.

Prove the global-plus-local decomposition: for `[n]` and finite `S` containing the bad, infinite and n-adic places, a tuple in `∏_{v∈S} H¹(K_v,A[n])` annihilates the localization of `Sel_n(A∨/K)` iff it is the sum of a localization from `H¹(G_{K,S},A[n])` and local Kummer classes. This is the finite Poitou–Tate localization diagram with the just established annihilators, including the real terms.

(Milne, I, §3, Theorem 3.2 and Corollary 3.4, pp. 41–44, Remark 3.7, p. 46, and §6, Lemma 6.15, pp. 86–87.)

**Checks.**

- At a good finite place with residue characteristic prime to `deg φ`, the image is the unramified subgroup; setting it to zero need not give the Kummer condition.
- For a real elliptic curve with two components and `n = 2`, `E(ℝ)/2E(ℝ) ≅ ℤ/2` gives a nonzero local Kummer image and a real two-primary annihilator condition.
- For odd `n` the real `[n]` Kummer quotient is zero, and at a complex place it is zero for every `n ≥ 1`.
- For the real elliptic curve with analytic lattice `ℤ + iℤ`, conjugation fixes `1` and negates `i`; the adapter sends `[λ/n]` to `[λ̄/n]` on n-torsion, retaining both lattice actions.

*Needs:* §§2.1–2.2 (Selmer diagrams and kernels); TauCetiRoadmap.EllipticCurves Layer 7; Mathlib `ContinuousCohomology.tateShafarevich`; native `AbelianVariety`; AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, A3.1–A3.5, A3.7, A5.1; SchemeAndStackFoundations §§0.12, 2.1, 2.15 (henselization, torsors and field étale/Galois comparison); ArithmeticGaloisDuality §§R02.1.2, R02.3.1, R02.4.3, D7.6 (cohomology sequences, restricted-ramification finiteness, finite Poitou–Tate and local abelian duality).

### 2.13 Dual Selmer structures

Extend the discrete Selmer structures of TauCetiRoadmap.EllipticCurves Layer 7 by orthogonal local conditions on the compact and rational Selmer data of §2.1 and their dual coefficient diagrams. A Selmer structure `F` on `T` (Mazur–Rubin, Definition 2.1) is a finite set `Σ(F)` of places containing the archimedean places, the places above `p` and the primes where `T` is ramified, with a local condition `H¹_F(K_q, T)` for each `q ∈ Σ(F)`; its Selmer module `H¹_F(K, T)` is the kernel of `H¹(K_{Σ(F)}/K, T) → ⊕_{q∈Σ(F)} H¹(K_q, T)/H¹_F(K_q, T)`. For an O-lattice use `T^*=Hom_O(T,E/O)(1)`, paired O-linearly into `E/O`, as in the Conventions. Mazur–Rubin’s Cartier dual `Hom_ℤp(T,μ_{p^∞})` instead uses the canonical trace-dual coefficient `E/d⁻¹`, where `d` is the different of `E/ℚ_p`. Coefficient trace identifies `Hom_O(T,E/d⁻¹)(1)` with that Cartier dual; identifying it with the `E/O`-dual requires a specified coefficient comparison. The dual Selmer structure `F^*` has `Σ(F^*) = Σ(F)` and `H¹_{F^*}(K_q, T^*) = H¹_F(K_q, T)^⊥` under the local Tate pairing (Mazur–Rubin, Definition 2.5).

`T` finitely generated over `O` with continuous `G_K`-action, unramified outside a finite set. Compact local conditions are closed in their natural topology (in the finite-type `O` case submodules are closed); coefficient biduality and perfect topological pairings are used for double orthogonals.

The construction proceeds as follows. Take the discrete Selmer structure of TauCetiRoadmap.EllipticCurves Layer 7 and its finite place set; instantiate the compact and rational Selmer data of §2.1 and their localization maps. The dual conditions are ArithmeticGaloisDuality §D7.7.1 for the local Tate pairings. `F^{**} = F` from ArithmeticGaloisDuality §D7.7.1's double-orthogonal rule; strict and relaxed modifications swap under duality; the structure induced on `T`/IT is dual to the one induced on `T^*[I] =` (`T`/IT)`^*` by the image/preimage rule and ArithmeticGaloisDuality §D7.7.2.

(Mazur–Rubin (arXiv v1), §2, Definition 2.1, p. 6 (arXiv v1); Mazur–Rubin (arXiv v1), §2, Definition 2.5, p. 7 (arXiv v1).)

The library targets include the following operations and identities:

- `Σ(F)` with local conditions at each `q ∈ Σ(F)`.
- `H¹_F(K, T)` as §2.9 for these data.
- The dual structure `F^*` on `T^*`.
- Local annihilators and their algebraic Selmer datum on the supplied dual global/local modules.
- `F^{**} = F`; on the algebraic datum this is double duality of local conditions for finite local modules.
- `(F^b_a)^* = (F^*)^a_b`: strict at `a ↔` relaxed at a (Mazur–Rubin, Definition 2.3), also on the algebraic datum.
- With `T^*=Hom_O(T,E/O)(1)`, the structure induced on `T`/IT is dual to the one induced on `T^*[I]`; use the O-linear pairing into `E/O` throughout.

**Checks.**

- The structure relaxed at every `q ∈ Σ` has dual strict at every `q ∈ Σ`; the dual Selmer module is `Ш¹_Σ(K, T^*)` (ArithmeticGaloisDuality §R02.4.2 (*Restricted products of local cohomology and `Ш^r_S`*)).
- For `T` unramified at `q∤p, H¹_f(K_q,T)` and `H¹_f(K_q,T*)` are exact annihilators in their respective local cohomology groups; they are not identified as the same subgroup of one module.
- At a real place `H¹(ℝ, W_M) = 0` for `p` odd, so every archimedean condition is `0 =` its dual; for `p = 2` it can be nonzero (Rubin, Remark 3.7).
- For `O=ℤ_p[√p], p` odd and `T=O`, coefficient trace on `E/O` has kernel `d⁻¹/O≠0`; it cannot identify the O-linear `E/O`-dual with the Cartier dual.
- Adding a place `q ∉ Σ(F)` to `Σ(F^*)` with the relaxed condition does not give the dual structure: the dual keeps the finite condition at `q`.

`Σ(F^*) = Σ(F)`; the dual conditions are orthogonal complements for the named local Tate pairing.

*Needs:* ArithmeticGaloisDuality §D7.7.1 (Perfect pairings and dual local conditions); ArithmeticGaloisDuality §D7.7.2 (Compatibility of the local pairings for `T, V, W` and `W_M`); §2.9 (Compact and rational Galois Selmer groups); §2.1 (Compact and rational Selmer data).

### 2.14 Dimensions of unramified classes

Let `K/ℚ_ℓ` be finite with `ℓ ≠ p` and `V` a finite-dimensional `ℚ_p[G_K]`-module. Then `dim H¹_ur(K, V) = dim V^{G_K}`, and `dim H¹(K, V)/H¹_ur(K, V) = dim H²(K, V)`.

`ℓ ≠ p`.

Prove this as follows. §2.7: `H¹_ur(K, V) = V^I/(Fr − 1)V^I`, so `0 → V^{G_K} → V^I → V^I → H¹_ur(K, V) → 0` gives (i). The tame quotient `I/P ≅ ∏_{ℓ′≠ℓ} ℤ_{ℓ′}(1)`, with `P` the pro-`ℓ` wild inertia (TauCetiRoadmap.LocalFieldsRamification Layer 4), gives a closed normal subgroup `I′ ⊆ I` of pro-order prime to `p` with `I/I′ ≅ ℤ_p(1)`; since `H^n(I′, −)` vanishes for `n ≥ 1` on p-primary and rational coefficients, Hochschild–Serre reduces the cohomology of `I` to that of `ℤ_p`, so `I` and `Gal(K^ur/K) ≅ Ẑ` have p-cohomological dimension `1` (TauCetiRoadmap.ProfiniteCohomology Layer 11 for `cd_p(Ẑ) = cd_p(ℤ_p) = 1`). Hochschild–Serre (ArithmeticGaloisDuality Layer R02.2) gives `H¹(K^ur/K, H¹(I, V)) = H²(K, V)` and `H¹(K, V)/H¹_ur(K, V) = H¹(I, V)^{Fr=1}`; the sequence `0 → H¹/H¹_ur → H¹(I, V) → H¹(I, V) → H²(K, V) → 0` gives (ii).

(Rubin (1999 draft), Chapter I, §3.1, Corollary 3.3, printed p. 5 (PDF p. 15).)

Only for `ℓ ≠ p`; at `ℓ = p` the finite condition is chosen, not computed.

*Needs:* §2.7 (The unramified condition); ArithmeticGaloisDuality §R02.2.1 (*The Hochschild–Serre spectral sequence*); TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 11.

### 2.15 Finite against unramified classes at bad primes

Let `K/ℚ_ℓ` be finite with `ℓ ≠ p, H¹_f(K, V) = H¹_ur(K, V)`, and `H¹_f(K, T), H¹_f(K, W), H¹_f(K, W_M)` as in §2.6. Put `𝒲 = W^I/(W^I)_div`, a finite module. `(i) H¹_f(K, W) = H¹_ur(K, W)_div`. (ii) `H¹_ur(K, T) ⊆ H¹_f(K, T)` with finite index, and `H¹_s(K, T)` is torsion-free. (iii) `H¹_ur(K, W)/H¹_f(K, W) ≅ 𝒲/(Fr − 1)𝒲` and `H¹_f(K, T)/H¹_ur(K, T) ≅ 𝒲^{Fr=1}`. (iv) If `T` is unramified, `H¹_f = H¹_ur` for `T` and `W`. Moreover `H¹_f(K, W_M)` is the image of `H¹_f(K, T)`, and equals `H¹_ur(K, W_M)` when `T` is unramified. At an archimedean place `H¹_f(K, W) = 0, H¹_f(K, T) = H¹(K, T)` and `H¹_f(K, W_M) = W^{G_K}/M W^{G_K}`, all zero unless `K = ℝ` and `p = 2`.

`ℓ ≠ p` for (i)–(iv); `T` a lattice.

Prove this as follows. The diagram of the rows `0 → H¹_ur(K, A) → H¹(K, A) → H¹(I, A)` for `A = T, V, W` gives `H¹_f(W) ⊆ H¹_ur(W)` and `H¹_ur(T) ⊆ H¹_f(T)` (ArithmeticGaloisDuality Layer R02.1's long exact sequences). The image of `V^I` in `W^I` is `(W^I)_div`; taking `I`-cohomology and Frobenius invariants of `0 → T → V → W → 0` gives `0 → 𝒲^{Fr=1} → H¹(I, T)^{Fr=1} → H¹(I, V)^{Fr=1}`, and with §2.7 this gives (iii); (i), (ii) follow since `𝒲` is finite; (iv) since `W^I = W` is divisible when `T` is unramified. Image of `H¹_f(K, T)`: the diagram `H¹(K, T) → H¹(K, W_M) → H²(K, T)` over `H¹(K, V) → H¹(K, W) → H²(K, T)` (Rubin Lemma 3.8). Archimedean: `H¹(K, V) = 0` (Rubin Remark 3.7).

(Rubin (1999 draft), Chapter I, §3.2, Lemma 3.5, printed p. 6 (PDF p. 16); Rubin (1999 draft), Chapter I, §3.2, Remark 3.7, printed p. 7 (PDF p. 17).)

These terms measure the difference between the finite rational condition and its finite-coefficient reductions at bad primes.

*Needs:* §2.6 (From `V` to `T` and `W`; saturation); §2.7 (The unramified condition); ArithmeticGaloisDuality §R02.1.2 (*Long exact sequences for continuous cohomology*); ArithmeticGaloisDuality §R02.1.3 (*The sequence `T → V → W` and the torsion of `H¹(T)`*).

### 2.16 Local duality for the finite condition on `V`

If `K` is archimedean, or nonarchimedean of residue characteristic `ℓ ≠ p`, then `H¹_f(K, V)` and `H¹_f(K, V^*)` are exact orthogonal complements under the local Tate pairing.

`ℓ ≠ p` or `K` archimedean.

Prove this as follows. Archimedean `K`: all the groups vanish. The pairing of two unramified classes factors through `H²(K^ur/K, Φ(1)) = 0`, as `Gal(K^ur/K)` has cohomological dimension `1`. `dim H¹_f(K, V^*) = dim H⁰(K, V^*) = dim H²(K, V) = dim H¹(K, V) − dim H¹_f(K, V)`, by §2.14, local duality for `V` (ArithmeticGaloisDuality Layer R02.4) and §2.14 again; conclude with ArithmeticGaloisDuality §D7.7.1's dimension count.

(Rubin (1999 draft), Chapter I, §4, Proposition 4.2, printed p. 9 (PDF p. 19).)

The dimension count, not only orthogonality, is proved.

*Needs:* §2.14 (Dimensions of unramified classes); ArithmeticGaloisDuality §D7.7.1 (Perfect pairings and dual local conditions); ArithmeticGaloisDuality Layer R02.4.

### 2.17 Local duality for the finite conditions on `T` and `W_M`

Suppose `K` is archimedean, or nonarchimedean of residue characteristic `ℓ ≠ p`, or nonarchimedean with `ℓ = p` and `H¹_f(K, V), H¹_f(K, V^*)` chosen to be orthogonal complements. Then `H¹_f(K, T)` and `H¹_f(K, W^*)` are exact orthogonal complements, and so are `H¹_f(K, W_M)` and `H¹_f(K, W^*_M)` for every nonzero `M ∈ O`. In particular, for `T` unramified and `ℓ ≠ p`, the unramified conditions on `T` and `T^*` are exact annihilators (Mazur–Rubin, Proposition 1.7(i)).

The case `ℓ = p` needs the chosen orthogonal pair `H¹_f(K, V), H¹_f(K, V^*)`.

Prove this as follows. ArithmeticGaloisDuality §D7.7.2: `⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩`. By §2.16 (or the hypothesis at `ℓ = p`), `H¹_f(K, V)^⊥ = H¹_f(K, V^*)`. Since `H¹_f(K, W^*) = φ^*(H¹_f(K, V^*))` and `H¹_f(K, T) = φ^{−1}(H¹_f(K, V))` (§2.6), ArithmeticGaloisDuality §D7.7.1's image/preimage rule gives `H¹_f(K, W^*)^⊥ = H¹_f(K, T)`. For `W_M`, use `T ↠ W_M` and `W^*_M ↪ W^*` in the same way, with `H¹_f(K, W_M)` the image of `H¹_f(K, T)` (§2.15). Unramified `T` with `ℓ ≠ p`: §2.15 (iv) identifies the finite and unramified conditions; at finite level this agrees with ArithmeticGaloisDuality's unramified-exact-annihilators.

(Rubin (1999 draft), Chapter I, §4, Proposition 4.3, printed p. 9 (PDF p. 19); Mazur–Rubin (arXiv v1), §1, Proposition 1.7, p. 5 (arXiv v1).)

At `ℓ = p` nothing is claimed without the chosen orthogonal pair; that Bloch–Kato's subspaces for de Rham `V` are such a pair (Rubin, Remark 7.1) is §4.9.

- Rubin's `S^Σ(K, W_M)` and `S_Σ(K, W^*_M)` are the Selmer modules of dual structures under these exact-annihilator hypotheses.

*Needs:* §2.16 (Local duality for the finite condition on `V`); ArithmeticGaloisDuality §D7.7.1 (Perfect pairings and dual local conditions); ArithmeticGaloisDuality §D7.7.2 (Compatibility of the local pairings for `T, V, W` and `W_M`); §2.15 (Finite against unramified classes at bad primes); §2.6 (From `V` to `T` and `W`; saturation); §2.13 (Dual Selmer structures); ArithmeticGaloisDuality §R02.4.2 (*Unramified classes are exact annihilators*).

### 2.18 Selmer groups of `T` and `W` as limits

For a finite set `Σ` of places: `(i) S^Σ(K, T) = lim_M S^Σ(K, W_M)` and `S_Σ(K, T) = lim_M S_Σ(K, W_M)`; (ii) `S^Σ(K, W) = colim_M S^Σ(K, W_M)` and `S_Σ(K, W) = colim_M S_Σ(K, W_M)`; the finite and singular parts of the local cohomology commute with these limits. The map `ι_M : H¹(K, W_M) → H¹(K, W)` induces a surjection `S^Σ(K, W_M) ↠ S^Σ(K, W)[M]`, which can fail for `S_Σ`. `S^Σ(K, W_M)` is finite, `S^Σ(K, T)` is finitely generated over `O`, and the Pontryagin dual of `S^Σ(K, W)` is finitely generated over `O`.

`Σ` finite; `T` a lattice unramified outside a finite set.

Prove this as follows. `H¹(K, W) = colim_M H¹(K, W_M)`, and `H¹(K, T) = lim_M H¹(K, W_M)` by Tate's inverse-limit theorem (ArithmeticGaloisDuality §R02.1.2 (*Tate's inverse-limit theorem*); the `H⁰` are finite). The local groups at level `M` are finite, so the finite parts and singular quotients commute with the limits (Rubin, Corollary 3.10, using §2.15's description of `H¹_f(K, W_M)`). `ι_M(H¹(K, W_M)) = H¹(K, W)[M]`, and `ι_M^{−1}(S^Σ(K, W)[M]) = S^Σ(K, W_M)` by definition; for `S_Σ` the strict condition at `Σ` is not preserved under `ι_M^{−1}` (Rubin, Remark 5.5). Enlarging `Σ, S^Σ(K, A) = H¹(K_Σ/K, A)` (§2.9), which is finite for `A = W_M` (ArithmeticGaloisDuality §R02.3.1 (*Finiteness of `H¹(G_{K,S}, M)`*)); the other two statements follow by the limits.

(Rubin (1999 draft), Chapter I, §5, Proposition 5.6, printed p. 12 (PDF p. 22); Rubin (1999 draft), Chapter I, §5, Remark 5.5, printed p. 12 (PDF p. 22).)

Both the relaxed and the strict Selmer groups are covered, with the strict-condition exceptions to Rubin Lemma 5.4 retained.

*Needs:* §2.9 (Compact and rational Galois Selmer groups); §2.6 (From `V` to `T` and `W`; saturation); §2.15 (Finite against unramified classes at bad primes); ArithmeticGaloisDuality §R02.1.2 (*Tate's inverse-limit theorem*); ArithmeticGaloisDuality §R02.3.1 (*Finiteness of `H¹(G_{K,S}, M)`*); Mathlib `PontryaginDual`.

### 2.19 Poitou–Tate for Selmer groups

Let `K` be a number field, `T` a p-adic representation of `G_K` ramified at finitely many primes, with `H¹_f(K_v, V)` and `H¹_f(K_v, V^*)` orthogonal complements at the places above `p`; let `M ∈ O` be nonzero and `Σ_0 ⊆ Σ` finite sets of places. `(i) 0 → S^{Σ_0}(K, W_M) → S^Σ(K, W_M) → ⊕_{v∈Σ−Σ_0} H¹_s(K_v, W_M)` and `0 → S_Σ(K, W^*_M) → S_{Σ_0}(K, W^*_M) → ⊕_{v∈Σ−Σ_0} H¹_f(K_v, W^*_M)` are exact. (ii) The images loc`^s(S^Σ(K, W_M))` and loc`^f(S_{Σ_0}(K, W^*_M))` are exact orthogonal complements under `Σ_{v∈Σ−Σ_0}⟨ , ⟩_v`. (iii) `S_{Σ_0}(K, W^*_M)/S_Σ(K, W^*_M) ≅ Hom_O`(`coker(loc^s_{Σ,Σ_0}), O`/MO); in particular `|S_{Σ_0}(K, W^*_M)| = |coker(loc^s_{Σ,Σ_0})|` when `S_Σ(K, W^*_M) = 0`.

Orthogonal finite conditions at the places above `p`; `Σ_0 ⊆ Σ` finite.

Prove this as follows. (i) is immediate from the definitions (§2.3). For `Σ` containing the archimedean places, the places above `p` and the ramified primes, `S^Σ(K, A) = H¹(K_Σ/K, A)` (§2.9). The segment `H¹(G_Σ, W_M) → P¹_Σ(K, W_M) → H¹(G_Σ, W^*_M)^∨` of Poitou–Tate (ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*)), §2.17 (`H¹_s(W_M)` is dual to `H¹_f(W^*_M)`, by ArithmeticGaloisDuality §D7.7.1's quotient pairing) and the dual of the tautological sequence for `S_Σ(K, W^*_M)` splice to the exact sequence `0 → S^{Σ_0} → S^Σ → ⊕ H¹_s → S_{Σ_0}(W^*_M)^∨ → S_Σ(W^*_M)^∨ → 0`, whose exactness in the centre is (ii). General `Σ`: take `Σ′ ⊇ Σ` large; the snake lemma on the diagram for `Σ_0 ⊆ Σ′` and `Σ ⊆ Σ′` gives the sequence for `Σ_0 ⊆ Σ` (the map there is `(loc^f_{Σ,Σ_0})^∨`). (iii) restates (ii).

(Rubin (1999 draft), Chapter I, §7, Theorem 7.3, printed p. 17 (PDF p. 27).)

Uses the global duality of ArithmeticGaloisDuality Layer R02.4; summing local pairings alone does not prove (ii). The real places enter through ArithmeticGaloisDuality's modified groups, which agree with ordinary cohomology in degree `1`.

*Needs:* §2.17 (Local duality for the finite conditions on `T` and `W_M`); §2.13 (Dual Selmer structures); §2.9 (Compact and rational Galois Selmer groups); §2.3 (Change of local conditions); ArithmeticGaloisDuality §D7.7.1 (Perfect pairings and dual local conditions); ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*); ArithmeticGaloisDuality §R02.4.2 (*Restricted products of local cohomology and `Ш^r_S`*).

### 2.20 Poitou–Tate for the Selmer group of `W^*`

With `Σ_p` the places above `p: S(K, W^*)/S_{Σ_p}(K, W^*) ≅ Hom_O(coker(loc^s_{Σ_p}), D)`, where loc`^s_{Σ_p} : S^{Σ_p}(K, T) → ∏_{v|p} H¹_s(K_v, T)`.

As in §2.19.

Prove this as follows. Apply §2.19 (iii) with `Σ=Σ_p` and `Σ_0=∅` at each level `M`. By §2.18 the direct limit of `S(K,W^*_M)/S_{Σ_p}(K,W^*_M)` identifies with `S(K,W^*)/S_{Σ_p}(K,W^*)`. On the lattice side use the inverse limit of `S^{Σ_p}(K,W_M)`, which identifies with `S^{Σ_p}(K,T)`, and the corresponding inverse limits of singular quotients. All groups at level `M` are finite: `Hom_O`(`−, O`/MO) turns the inverse limit of the cokernels into the direct limit of their duals (Pontryagin duality), and the inverse limit of the cokernels is the cokernel of the limit, as `lim¹` of finite groups vanishes (DerivedModuleAlgebra §1.T.1).

(Rubin (1999 draft), Chapter I, §7, Corollary 7.5, printed p. 19 (PDF p. 29).)

The `lim¹` bookkeeping is explicit.

*Needs:* §2.19 (Poitou–Tate for Selmer groups); §2.18 (Selmer groups of `T` and `W` as limits); DerivedModuleAlgebra §1.T.1 (*The six-term sequence of `lim` and `lim¹`*); DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); Mathlib `PontryaginDual`.

### 2.21 Selmer complex as a mapping fibre

Use NoncommutativeAndEquivariantIwasawa §F.4 (*Selmer mapping fibres, Iwasawa cochains and control*), `arithmeticSelmerComplex`, for number-field lattice coefficients, with IntegralIwasawaTheory §10.0's `arithmeticLocalMappingFiber` on their common domain. Extend the same fibre functor to a finite set `S` and bounded compact/rational/discrete coefficient complexes `X` as follows. Specify actual local complexes `C_v(X)`, localization maps `loc_v:C_cont(G_(F,S),X)→C_v(X)`, and local-condition maps `i_v^+:U_v^+→C_v(X)`. The adapter `RΓ_f(F,S,X;C_v,U^+)` is `Cone(C_cont(G_(F,S),X)⊕⊕_v U_v^+ --loc−i-->⊕_v C_v(X))[−1]`. Put `U_v^−=Cone(i_v^+)` and `C_c(C_v)=Fib(loc)`; supply the triangles `RΓ_f→RΓ_global→⊕U_v^−` and `C_c(C_v)→RΓ_f→⊕U_v^+`. Strict uses `U^+=0` and relaxed uses `i=id` into the chosen `C_v`. Submodules of `H¹` are not by themselves a unique choice of `U^+`.

Instantiate this carrier as `RΓ_f^ord` with `C_v^ord` and ordinary restriction, and as `RΓ_f^mod` with `C_v^mod` and localization `q_v∘res_v` from the Conventions. For an ordinary condition keep `U_v^+` and replace `i_v^+` by `q_v∘i_v^+` to obtain its modified condition. Only `C_c(C_v^mod)` is arithmetic compact support `RΓ_c`. Under `(P)` its acyclic archimedean target terms can be omitted, giving the finite-place model; any archimedean `U_v^+` remain in the Selmer source. At `p=2` with real places the modified diagram and its duality use ArithmeticGaloisDuality §D7.5 (*Duality when `p = 2` and `K` has real places*) in the unbounded derived category. Global cochains remain ordinary and untruncated in both diagrams.

Construct the natural comparison for these transported conditions. With `S_∞` the archimedean part of `S`, put `Q_∞(X)=⊕_{v∈S_∞} Cone(q_v)`. The triangle is

```text
RΓ_f^ord(X) → RΓ_f^mod(X) → Q_∞(X)[−1] → RΓ_f^ord(X)[1].
```

For a coefficient module `T` in degree zero, `H^j(Q_∞(T))=0` for `j≥0` and `H^{−1}(Q_∞(T))=⊕_{v∈S_∞} T_{G_v}`, with `T_{G_v}=T` at a complex place. Thus the comparison gives

```text
H⁰(RΓ_f^ord) → H⁰(RΓ_f^mod) → ⊕_{v∈S_∞} T_{G_v} → H¹(RΓ_f^ord) → H¹(RΓ_f^mod) → 0,
H^j(RΓ_f^ord) ≅ H^j(RΓ_f^mod)  (j≥2).
```

Under `(P), Q_∞(T)[−1]≃⊕_{v∈S_∞} T^{G_v}[0]`. At a dyadic real place, lower negative Tate groups can survive in `Q_∞`, so this concentration in degree zero requires `(P)`, or coefficients on which `2` is invertible.

In the supplied lattice setting transport the fibre triangles, functoriality, condition changes and quasi-isomorphism comparisons from §F.4, using precisely its localization-minus-condition arrow. For the additional coefficient complexes, extend this functor by finite direct sums and the shifted cone in the derived category, preserving those maps and triangles. The square with identity on the source and `⊕q_v` on the target gives the archimedean comparison, identified in the finite p-primary and finite-free number-field cases with IntegralIwasawaTheory §2.0's ordinary/Tate comparison. For a real module, use the periodic Tate resolution: the quotient by ordinary cochains has top cohomology `T_{G_v}` in degree `−1`, and lower cohomology is the negative Tate cohomology. At a complex place `Cone(q_v)≃T[1]`. For discrete `X` compare the classical continuous `H¹` kernel with TauCetiRoadmap.EllipticCurves Layer 7 using §2.22.

(Nekovář, Definitions 6.1.1–6.1.2 and triangles 6.1.3, pp. 135–136; §5.7.2, pp. 131–132, for modified localization.)

The library targets include the following operations and identities:

- The adapter `Cone(loc−i)[−1]`, equal to the supplied `arithmeticSelmerComplex` and, on the common domain, `arithmeticLocalMappingFiber`, with the specified diagram.
- The instance using ordinary cochains at every place.
- The instance using the modified arithmetic local diagram and `q_v∘res_v`.
- `RΓ_f→RΓ_global→⊕Cone(i_v^+)` is an exact triangle.
- `C_c(C_v)→RΓ_f→⊕U_v^+` is an exact triangle for the same local diagram; its first vertex is arithmetic `RΓ_c` in the modified instance.
- Maps of the global, local and condition complexes with compatible localization homotopies induce a fibre map, with identity and composition.
- Compatible quasi-isomorphic conditions give equivalent Selmer complexes.
- `Q_∞(X)`, the sum of the archimedean comparison cones.
- The ordinary-to-modified comparison triangle above, natural in the transported local conditions.

**Checks.**

- If every `i_v=id, RΓ_f` is quasi-isomorphic to `RΓ_global`.
- If every `U_v^+=0` in the modified diagram, `RΓ_f^mod` is arithmetic compact support, represented under `(P)` by the finite-place fibre.
- For `S` empty, the fibre is the global complex, without an extra shift.
- Two local conditions with equal `H¹` image can give different Selmer `H¹` because their `H⁰` differs.
- For `F=ℚ, S={p,∞}, T=k=𝔽_p` trivial and `p` odd, strict conditions give `0→k→H¹(RΓ_f^ord)→H¹(RΓ_f^mod)→0` and `Q_∞[−1]≃k[0]`. The ordinary fibre is not arithmetic compact support.
- At a complex place and for a module `T, C_v^ord≃T[0], C_v^mod=0` and `Cone(q_v)[−1]≃T[0]`; even a totally imaginary field can have an ordinary archimedean correction.
- At a real place with `T=𝔽₂` trivial, `Cone(q_v)` has `H^{−1}=𝔽₂` and `H^j=𝔽₂` for every `j≤−2`, but `H^j=0` for `j≥0`. The comparison of fibre cohomology in degrees `≥2` still holds.
- For `F=ℚ, S={2,∞}, T=𝔽₂` trivial and strict conditions, the modified Selmer complex has `H^i=𝔽₂` for every `i<0`; the ordinary one is the bounded ordinary `burnsFlachFiniteComplex` of IntegralIwasawaTheory §10.1 in this finite-coefficient case and has no negative cohomology. The comparison cone distinguishes these objects.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (`arithmeticSelmerComplex`, its condition-change and functoriality API); IntegralIwasawaTheory §§2.0, 10.0–10.1 (`arithmeticCompactSupport`, `arithmeticLocalMappingFiber`, `burnsFlachFiniteComplex`); ArithmeticGaloisDuality §D7.5 (*Continuous cochains with compact support*; *Duality when `p = 2` and `K` has real places*); ArithmeticGaloisDuality §R02.3.1 (*Localisation maps and the modified local groups*); ArithmeticGaloisDuality §D7.7.3 (Local conditions and derived orthogonal complements); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*).

### 2.22 The `H⁰` correction before the classical Selmer kernel

Specify the local diagram of §2.21 and assume `H¹(U_v^+)→H¹(C_v)` is injective. With `L_v` its image and `Sel_L=ker[H¹(C_global)→⊕H¹(C_v)/L_v]` using that localization, the fibre LES gives `0→J→H¹(RΓ_f)→Sel_L→0`, where `J=coker[H⁰(C_global)⊕⊕H⁰(U_v^+) --loc−i-->⊕H⁰(C_v)]`. The right map forgets the uniquely determined local `H¹` lifts. Hence `H¹(RΓ_f)→Sel_L` is an isomorphism exactly when this `H⁰` arrow is onto; a sufficient hypothesis is `H⁰(i_v^+)` bijective for every `v`. For a module `T` in degree zero, the ordinary diagram uses `T^{G_v}` at all places, whereas the modified diagram uses Tate `H⁰` at real places and zero at complex places. For such a module and conditions transported by `q_v`, the classical `H¹` kernels agree, since `H¹(q_v)` is bijective; their `H⁰` correction terms can differ. Without `H¹`-injectivity, retain `ker(⊕H¹(U_v^+)→⊕H¹(C_v))` in the kernel calculation.

Use the fibre of §2.21. In the number-field lattice setting this sequence is NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticSelmerComplex.h1_exact`, with the same `H⁰` arrow and the same projection to the classical Selmer kernel. The statement for the broader coefficient diagrams retains these maps and their local `H¹` kernels; there is no unconditional identification of fibre `H¹` with the classical kernel.

Prove this as follows. Write the LES segment in degrees zero and one, including both global and local-condition `H⁰`. Project `ker[H¹global⊕H¹U→H¹local]` to `H¹global`. Injectivity of `H¹i` makes each local lift unique. Take the displayed cokernel as `J`. Without the injectivity hypothesis use the full LES rather than deleting its local kernel.

(Nekovář, §6.1.4, pp. 136–137.)

**Checks.**

- For global complex `0`, one local complex `k[0]` and strict condition, `Sel=0` while `H¹`(fibre)`=k`.
- For a nonzero `U^+` in degree one mapping to zero, the extra local `H¹` survives; `H¹i` injectivity fails.
- Bijective local `H⁰` and injective local `H¹` give the classical kernel.
- For `F=ℚ, S={p,∞}, T=k=𝔽_p` trivial and `p` odd, with strict conditions, the ordinary `H⁰` map is the diagonal `k→k⊕k` with cokernel `k`. The modified map `k→k⊕0` is onto, so `J^mod=0` and `H¹(RΓ_f^mod)` is the classical strict kernel.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §2.2 (Compact and rational Selmer kernel).

### 2.23 Primitive, imprimitive and strict condition-change triangles

For local-condition maps `U^+→U′^+` commuting with their maps to `C_v`, let `D_v=Cone(U_v^+→U′_v^+)`. There is a triangle `RΓ_f(U)→RΓ_f(U′)→⊕D_v`. At `H¹`-submodule level `L⊆L′` it gives `0→Sel_L→Sel_L′→⊕_v L′_v/L_v`, exact at the first three terms, with the cokernel beyond that term governed by the fibre `H²` map and `H⁰` corrections. Relaxation at `Σ` replaces `U_v^+` by `C_v` and `D_v` by `U_v^−`; strict modification uses zero. Surjectivity of the displayed localization to local quotients is a separate theorem, never part of the definition of imprimitive Selmer.

Finite changed set; maps/homotopies on actual complexes. Kernel-level conclusion uses §2.22 or its correction.

Prove this as follows. Use cone functoriality and the octahedral axiom on `res−i`. Write the LES of the triangle and compare it with the kernel-level localization map. Record precisely which cokernel is killed by global surjectivity or dual Selmer vanishing in the applications of §§3.11 and 3.19.

(Nekovář, §6.1, pp. 135–137; §7.8, pp. 187–192.)

**Checks.**

- Identical conditions have acyclic difference and equivalent fibres.
- With global module `0` and one nonzero local quotient, `Sel_L′→L′/L` is not onto.
- Relaxing one place retains exactly its `U_v^−`, including its degree-zero terms.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §2.22 (The `H⁰` correction before the classical Selmer kernel); §2.3 (Change of local conditions).

### 2.24 Lattice changes with global and local errors

For stable lattices `T⊂T′⊂V` with finite `Q=T′/T` and compatible local-condition complexes, the cone of `RΓ_f(T)→RΓ_f(T′)` is the fibre of the global coefficient cone `RΓ(Q)` and the local-condition cones mapping to the local `RΓ(Q)`. If the local conditions form exact triangles with their Q-condition, this is `RΓ_f(Q)`; otherwise retain their discrepancy cones. For this fibre `C_Q`, the exact fragment `H⁰_f(T′)→H⁰(C_Q)→H¹_f(T)→H¹_f(T′)→H¹(C_Q)→H²_f(T)` controls the kernel and cokernel. The discrete map `A=V/T→A′=V/T′` has kernel `Q` and has the corresponding exact triangle in the other order. Rationalization identifies both lattice complexes with the same V-complex, but finite integral errors need not vanish.

Continuous coefficient exact sequences and compatible local maps; `Q` finite. Saturated propagation of rational conditions does not imply local exactness on every finite quotient.

Prove this as follows. Import the cochain coefficient exact triangle for `T→T′→Q`. Take the diagram of localization and local-condition triangles; its fibre identifies the cone, including any nonexact local propagation. Read the LES, then invert `p` to eliminate `Q` and the finite lattice discrepancies only under the rational comparison hypotheses.

(Nekovář, §6.1.3, pp. 136–137; §8.10, pp. 249–251; Rubin (1999 draft), Chapter I, Lemma 5.4 and Remark 5.5, pp. 11–12.)

**Checks.**

- `T=T′` gives `Q=0` and an equivalence.
- `T′=p^−1T` has nonzero finite `Q`; integral `H⁰` and `H²` errors cannot be removed by rational equality.
- At a bad Tamagawa prime, the raw inertia condition on `Q` need not equal the condition propagated from `V`.

*Needs:* §2.21 (Selmer complex as a mapping fibre); §2.5 (Propagating local conditions); ArithmeticGaloisDuality §R02.1.3 (*The sequence `T → V → W` and the torsion of `H¹(T)`*).

### 2.25 Selmer vanishing descends under injective restriction

For a finite extension `F′/F` and a Selmer structure stable under restriction at every place, restriction maps `Sel_F(M)` to `Sel_F′(M)`. If `p∤[F′:F]` for a p-primary O-module `M, cor∘res=[F′:F]` makes it injective. Alternatively, if `M^(G_L)=0` for the Galois closure `L/F` of `F′`, inflation–restriction gives injectivity to `L`, hence to `F′`. Therefore `Sel_F′(M)=0` implies `Sel_F(M)=0` under either hypothesis. For `M=ad⁰(r)⊗E/O`, vanishing of `(ad⁰ r̄)^(G_L)` implies vanishing of `M^(G_L)` by taking the lowest nonzero `λ`-primary torsion level.

The local conditions must be preserved by restriction. The prime-to-p or invariant-vanishing condition is essential; arbitrary finite extensions do not suffice.

Prove this as follows. Build the semilocal restriction squares and apply the Selmer functoriality API. Prove injectivity using restriction/corestriction or the supplier five-term sequence over the Galois closure. For discrete lattice quotients, every nonzero invariant has a nonzero `λ`-torsion invariant after multiplying by a power of `λ`; conclude the residual criterion.

(Calegari–Geraghty–Harris (arXiv v1), Remark after Theorem 1.2, preprint p. 3 (published Appendix A, p. 882).)

**Checks.**

- The identity extension preserves the Selmer group and restriction is injective.
- A nonzero `Hom(Gal(L/F),ℤ/p)` class restricts to zero when `Gal(L/F)=ℤ/p` and the coefficient action is trivial.
- For p-degree extensions, the residual-invariant criterion may still give injectivity.

*Needs:* §2.4 (Functoriality of Selmer modules); ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*); ArithmeticGaloisDuality §R02.2.2 (*The five-term sequence and the transgression*).

### Examples

Let `R` be a field, global module `R²`, one local module `R` and localization `(x,y)↦y`. The strict Selmer group is `R×{0}`, the relaxed group is `R²` and the change map is `y`, with kernel the strict group. For localization zero and local condition zero the Selmer group is all of `R²`, rather than zero. This distinguishes a localization kernel from the local condition itself.

For a fibre `Cone(f)[−1]` with global and local-condition complexes zero and local cochains `R` in degree zero, the fibre has `H¹=R` although the naive kernel of degree-one localization is zero. Thus the `H⁰` cokernel `J` in the fibre/kernel comparison cannot be discarded. In Pontryagin corank, the compact dual of `ℚ_p/ℤ_p` is `ℤ_p` and gives corank one; a finite p-primary discrete module gives corank zero.

### Dependencies

Layer 0 and ArithmeticGaloisDuality §§D7.7.1–D7.7.6, R02.2.3a, together with the supplier interfaces: Mathlib `ContinuousMonoidHom.comp`; Mathlib `Module.finrank`; Mathlib `MulDistribMulAction.toMonoidHom`; Mathlib `PontryaginDual`; Mathlib `Submodule.map_le_iff_le_comap`; TauCetiRoadmap.EllipticCurves Layer 7; TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 11; TauCetiRoadmap.ProfiniteCohomology Layer 5; ArithmeticGaloisDuality Layer R02.4; ArithmeticGaloisDuality §D7.5 (*Continuous cochains with compact support*); DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); DerivedModuleAlgebra §1.T.1 (*The six-term sequence of `lim` and `lim¹`*); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); ArithmeticGaloisDuality §R02.1.2 (*Long exact sequences for continuous cohomology*); ArithmeticGaloisDuality §R02.1.2 (*Tate's inverse-limit theorem*); ArithmeticGaloisDuality §R02.1.3 (*The sequence `T → V → W` and the torsion of `H¹(T)`*); ArithmeticGaloisDuality §R02.2.1 (*The Hochschild–Serre spectral sequence*); ArithmeticGaloisDuality §R02.2.2 (*The five-term sequence and the transgression*); ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*); ArithmeticGaloisDuality §R02.3.1 (*Finiteness of `H¹(G_{K,S}, M)`*); ArithmeticGaloisDuality §R02.3.1 (*Localisation maps and the modified local groups*); ArithmeticGaloisDuality §R02.3.1 (*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*); ArithmeticGaloisDuality §R02.4.2 (*Restricted products of local cohomology and `Ш^r_S`*); ArithmeticGaloisDuality §R02.4.2 (*Unramified classes are exact annihilators*); ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*).

## Layer 2A: Arithmetic Selmer comparisons and deformation tangents

This layer specializes the mapping fibres and `H⁰` correction of §§2.21–2.22 to arithmetic compact support, compares Selmer groups with first-order deformation tangents, and retains the trace boundaries and derived `Tor` terms under determinant constraints and coefficient change. Ordinary cochains compute deformation tangents; the modified arithmetic diagram supplies compact support and duality.

### 2A.1 Selmer complex `H¹` with its `H⁰` correction

**Selmer complex `H¹` with its `H⁰` correction.** Let `T` be a coefficient module and `S` a finite set
of places as in §2.21 *Selmer complex as a mapping fibre*.
Fix a prime `p` and the `p`-adic coefficient hypotheses of ArithmeticGaloisDuality Layer D7 whenever `(P)` is used, and
write `S_∞` for the archimedean places in `S`.
Specify either the ordinary diagram `C_v^ord(T)` or the modified arithmetic-duality diagram
`C_v^mod(T)` of the Conventions, with maps `i_v : U_v⁺ → C_v(T)`, not merely subgroups of `H¹`.
Write `S̃(T)` for §2.21's Selmer complex, the fibre of

```text
C(G_S, T) ⊕ ⊕_{v∈S} U_v⁺ → ⊕_{v∈S} C_v(T),   (x, (u_v)) ↦ (loc_v(x) − i_v(u_v))_v,
```

using ordinary restriction for `C_v^ord` and its composite with `q_v` for `C_v^mod`.
Write `S̃^ord` and `S̃^mod` for its ordinary and modified instances.
That section supplies adapters to NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticSelmerComplex`, their functoriality and
quasi-isomorphism invariance, extending them to the coefficient complexes stated there. ArithmeticGaloisDuality §§R02.3.1, D7.5 supply the arithmetic complexes
`C_v^mod` and maps `q_v`. Identify the strict modified instance with ArithmeticGaloisDuality §D7.5's
Tate-modified carrier `Ĉ_c`, using finite-place cochains, complete real Tate cochains and zero complex-place terms. The projection forgetting the real Tate terms compares this carrier with the finite-place `GaloisCohomology.compactCochains`; it is a quasi-isomorphism under `(P)`, or whenever all real Tate terms are acyclic. With
`U_v^{−,mod} = Cone(i_v^mod)`, the supplied global and compact-support triangles of §2.21
specialize to

```text
S̃^mod(T) → C(G_S,T) → ⊕ U_v^{−,mod} → S̃^mod(T)[1],
C_c^mod(G_S,T) → S̃^mod(T) → ⊕ U_v⁺ → C_c^mod(G_S,T)[1].
```

Here the first vertex of the second triangle is identified with ArithmeticGaloisDuality §D7.5's arithmetic compact support
`C_c^mod`. In the finite p-primary and finite-free `ℤ_p` number-field cases this is IntegralIwasawaTheory §2.0's `arithmeticCompactSupport^mod`, preserving the supplied localization, cup product and trace. The ordinary strict fibre instead identifies with its ordinary support and, in §10.1's arithmetic sheaf setting, `burnsFlachFiniteComplex`. The superscript `mod` here denotes the modified instance of the supplier's support construction. The triangles, including their maps and homotopies, belong to
§2.21 and use this same modified diagram.

Let `H¹_f(T) = {x ∈ H¹(G_S, T) : loc_v(x) ∈ im H¹(i_v) for all v ∈ S}` be the classical Selmer
kernel (§2.2 *Compact and rational Selmer kernel*). For a module
`T` in degree zero, `q_v` induces an isomorphism in degree one, so the ordinary and modified
kernels agree when the conditions are transported along `q_v`. If `H¹(i_v)` is injective for
every `v ∈ S`, the canonical map `H̃¹(T) → H¹_f(T)` is surjective with kernel

```text
coker( H⁰(G_S, T) ⊕ ⊕_{v∈S} H⁰(U_v⁺) → ⊕_{v∈S} H⁰(C_v(T)) ),
```

so it is an isomorphism exactly when this map on `H⁰` is surjective. This specializes
§2.22 *The `H⁰` correction before the classical Selmer kernel*,
which transports the supplied `arithmeticSelmerComplex.h1_exact` and extends it to either chosen coefficient diagram. For the ordinary
fibre the local `H⁰` groups are invariants at every place; for the modified fibre they are Tate
groups at real places and zero at complex places. Strict conditions give arithmetic compact
support only in the modified diagram. Under `(P)` that diagram agrees with the finite-place
fibre, including for odd `p` when ordinary archimedean invariants can be nonzero.

For an ordinary local condition, keep `U_v⁺` and compose `i_v` with `q_v` to obtain the
transported modified condition. Use §2.21's archimedean cone
`Q_∞(T) = ⊕_{v∈S_∞} Cone(q_v)` and its archimedean triangle:

```text
S̃^ord(T) → S̃^mod(T) → Q_∞(T)[−1] → S̃^ord(T)[1].
```

The first arrow is §2.21's fibre map with identity on the global cochains and local conditions
and `⊕ q_v` on the local target.

For a module in degree zero, `H^j(Q_∞) = 0` for `j ≥ 0`, and
`H^{−1}(Q_∞) = ⊕_{v∈S_∞} T_{G_v}` (coinvariants, also `T` at a complex place). Hence the comparison
includes

```text
H⁰(S̃^ord) → H⁰(S̃^mod) → ⊕_{v∈S_∞} T_{G_v} → H¹(S̃^ord) → H¹(S̃^mod) → 0,
H^j(S̃^ord) ≅ H^j(S̃^mod)  (j ≥ 2).
```

Under `(P)`, `Q_∞(T)[−1] ≃ ⊕_{v∈S_∞} T^{G_v}[0]`. These terms, together with the ordinary local
and global automorphism spaces `H⁰`, are retained in comparisons with framed deformation
problems. §2.21 supplies these arithmetic cohomology calculations,
the comparison exact sequence and concentration under `(P)`; §2.22 supplies the `H⁰` correction.
This target identifies the strict modified instance with arithmetic compact support supplied by
ArithmeticGaloisDuality §D7.5, compatibly with the modified fibre duality of
ArithmeticGaloisDuality §§D7.7.3–D7.7.4. The identification uses the modified fibre, including
under `(P)`.

*Proof sketch.* The strict modified fibre has exactly ArithmeticGaloisDuality §D7.5's modified localisation arrow.
Specialize §2.22 using the fibre long exact sequence

```text
H⁰(G_S, T) ⊕ ⊕_v H⁰(U_v⁺) → ⊕_v H⁰(C_v(T)) → H̃¹(T) → H¹(G_S, T) ⊕ ⊕_v H¹(U_v⁺) → ⊕_v H¹(C_v(T)),
```

Nekovář's sequence (6.1.3). Projection to `H¹(G_S, T)` maps the kernel of the last map onto
`H¹_f(T)`, with kernel `⊕_v ker H¹(i_v)`, which is zero by hypothesis; this gives the `H⁰`
correction for the chosen diagram supplied by §2.22. Use §2.21's arithmetic cohomology
calculation of `Q_∞`, comparison exact sequence and concentration under `(P)`, with the
local maps of ArithmeticGaloisDuality §R02.3.1. The strict modified fibre identification is compatible with both
supplied fibre triangles. (Nekovář, *Selmer
complexes*, §6.1, Definition 6.1.2 and exact
sequence 6.1.3, §6.1.4, pp. 135–137; §5.7.2, pp. 131–132, for the ordinary-to-Tate map.)
*Needs:* ArithmeticGaloisDuality §R02.3.1 (*Localisation maps and the modified local groups*), §D7.1 (*Derived tensor, perfect amplitude and `Tor`*), §D7.5 (*Continuous cochains with compact support*; *Duality when `p = 2` and `K` has real places*); §2.2 (Compact and rational Selmer kernel); §2.21 (Selmer complex as a mapping fibre); §2.22 (The `H⁰` correction before the classical Selmer kernel).

**Checks.**

- For `K=ℚ`, `S={2,∞}` and trivial `T=𝔽₂`, the strict modified fibre has `H^i=𝔽₂` for every `i<0`, from the complete real Tate term. The finite-place `GaloisCohomology.compactCochains` and the bounded ordinary `burnsFlachFiniteComplex` have no negative cohomology, so neither can replace this modified fibre.
- With `q = id`, the supplied comparison map is the identity of the ordinary fibre.
  With every `U_v⁺ = 0`, the modified fibre is `C_c^mod`; with every modified `i_v = id`, it is
  the global complex. Both identities use the displayed modified triangles.
- `F = ℚ`, `T = μ_p` with `p` odd, `S = {ℓ, p, ∞}` with `ℓ ≡ 1 mod p` and the strict condition
  `U_ℓ⁺ = 0`: `H⁰(G_S, μ_p) = 0` but `H⁰(ℚ_ℓ, μ_p) = μ_p`, so the cokernel contains `μ_p` and
  `H̃¹(T) → H¹_f(T)` is not injective.
- The result depends on the map of complexes, not only on its image in `H¹`: the strict condition
  `U_v⁺ = 0` and the condition `U_v⁺ = T^{G_v}` placed in degree `0` both have image `0` in
  `H¹(G_v, T)`, but contribute `H⁰(G_v, T)` and `0` respectively to the cokernel.
- `F = ℚ`, `T = μ_p` with `p` odd and `S = {p, ∞}`: `H⁰(ℚ_p, μ_p) = 0` and `H⁰(ℝ, μ_p) = 0`, so the
  cokernel vanishes and `H̃¹(T) ≅ H¹_f(T)` for every choice of local conditions with `H¹(i_v)`
  injective.
- `F = ℚ`, `S = {p, ∞}`, `T = k = 𝔽_p` with `p` odd, strict conditions at both places: the
  ordinary `H⁰` map is `k → k ⊕ k`, with cokernel `k`; the modified map is `k → k ⊕ 0`, with
  zero cokernel. Thus `0 → k → H¹(S̃^ord) → H¹(S̃^mod) → 0`, with both maps to the same classical
  strict Selmer kernel. The comparison term is `Q_∞[−1] ≃ k[0]`.
- For a function field there are no archimedean places: `Q_∞ = 0` and the two fibres agree.

### 2A.2 Function-field Greenberg–Wiles

**Function-field Greenberg–Wiles.** Let `F` be a global function field of characteristic `ℓ`, `k` a
finite field of characteristic `p ≠ ℓ`, `M` a finite-dimensional `k`-vector space with a continuous
`k`-linear action of `G_F` (hence unramified outside a finite set of places), and
`M^D = Hom(M, μ_p)`. Let `L_v ⊆ H¹(F_v, M)` be `k`-subspaces with `L_v = H¹_un(F_v, M)` for all but
finitely many `v`, and `L_v^⊥` their annihilators; the Selmer groups and orthogonal complements are
those of ArithmeticGaloisDuality §D7.7.1 and Layer 2 here. Then, with dimensions over `k`,

```text
dim Sel_L(M) − dim Sel_{L^⊥}(M^D) = h⁰(F, M) − h⁰(F, M^D) + Σ_v (dim L_v − h⁰(F_v, M)),
```

a finite sum over the places of `F`, with no archimedean term. When `h⁰(F, M) = h⁰(F, M^D) = 0`,
the difference is the sum of the local excesses `dim L_v − h⁰(F_v, M)`.

*Proof sketch.* As for ArithmeticGaloisDuality §R02.5.1 *The Greenberg–Wiles formula*: the finite part of the Poitou–Tate sequence
for coefficients prime to `ℓ` and the function-field Euler characteristic `#H⁰ · #H² / #H¹ = 1`,
which has no archimedean factor, give the cardinality formula; take logarithms to the base `#k`.
Almost every local term vanishes, because `dim H¹_un(F_v, M) = h⁰(F_v, M)` wherever `M` is
unramified. ([Fakhruddin–Khare–Patrikis, *Lifting and automorphy of reducible mod `p` Galois
representations over global fields*](https://arxiv.org/pdf/2008.12593), §2, p. 10;
Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*, §8.7, Definition 8.7.8 and
Theorem 8.7.9, pp. 511–513.) *Needs:* ArithmeticGaloisDuality §R02.5.1 (*The Greenberg–Wiles formula*), §R02.4.5 (*Function-field arithmetic finiteness and Euler characteristic*; *Prime-to-characteristic function-field Poitou–Tate duality*), §D7.7.1 (*Perfect pairings and dual local conditions*); §2.2 (Compact and rational Selmer kernel); §2.21 (Selmer complex as a mapping fibre).

**Checks.**

- `F = 𝔽_q(t)`, `M = 𝔽_p` with `p ∤ q(q − 1)`, `L_v = H¹_un` at every place: `Sel_L` is spanned by
  the constant field extension of degree `p`, so it has dimension `1`, and
  `Sel_{L^⊥}(F, μ_p) = 𝔽_q^×/𝔽_q^{×p} = 0`; the formula gives `1 − 0 + 0 = 1`. Over `ℚ` the
  corresponding difference is `0` (ArithmeticGaloisDuality §R02.5.2 *Rank-one Selmer numerics*), the real place contributing `−1`;
  no such term occurs here.
- In the same setting, relaxing at a place `v` of degree `d` with `p ∣ q^d − 1` raises the
  difference by `1`, since `dim H¹(F_v, 𝔽_p) = 2` and `dim H¹_un(F_v, 𝔽_p) = 1`; as `Sel_{L^⊥} = 0`,
  the new Selmer group has dimension `2`, the new class being a tame character ramified only at `v`.
  At a place with `p ∤ q^d − 1` relaxing changes nothing.
- For `M = 0` both sides are `0`.

### 2A.3 Selmer and deformation tangent comparison

**Selmer and deformation tangent comparison.** Let `F` be a number field, `S` a finite set of places
of `F`, `k` a finite field, `n ≥ 1` and `ρ : G_{F,S} → GL_n(k)` continuous, and let a first-order local lift
problem at each `v ∈ S` be given by a subspace `L_v ⊆ H¹(G_v, ad ρ)`. Deformation-local cochains
are `C_v^ord(ad ρ)`, including at archimedean places. By ArithmeticGaloisDuality §D8.1 *First-order Galois cocycle
comparison*, the global first-order lifts form `H¹(G_{F,S}, ad ρ)`, the local ones `H¹(G_v, ad ρ)`,
and the two are compared by the restriction maps induced by `G_v → G_{F,S}`, in a commutative square
of cocycle identifications (not merely an equality of dimensions). The tangent space of the global
problem with the local conditions `L_v` is therefore the Selmer group
`H¹_L(G_{F,S}, ad ρ) = ker(H¹(G_{F,S}, ad ρ) → ⊕_{v∈S} H¹(G_v, ad ρ)/L_v)`, the kernel Selmer group
of Layer 2. When the local conditions are maps of complexes
`U_v⁺ → C_v^ord(ad ρ)` that are injective on `H¹` with image `L_v`, `H¹` of the ordinary Selmer
fibre `S̃^ord(ad ρ)` (§2.21 *Selmer complex as a mapping fibre*)
maps onto `H¹_L` with kernel the cokernel of
`H⁰(G_{F,S}, ad ρ) ⊕ ⊕_v H⁰(U_v⁺) → ⊕_v H⁰(G_v, ad ρ)` (*Selmer complex `H¹`
with its `H⁰` correction*, §2A.1); the two agree exactly when this `H⁰` map is surjective, and
no equality is asserted without that hypothesis. Framed versions keep cocycles instead of classes
and use the exact sequence
`0 → H⁰(G, ad ρ) → ad ρ → Z¹(G, ad ρ) → H¹(G, ad ρ) → 0` for the global group and each local
group `G`. Thus, when finite-dimensional, the framing contribution is
`dim Z¹ − dim H¹ = n² − dim H⁰`, with ordinary `H⁰` at every place. Passage to `S̃^mod` also
retains the `Q_∞[−1]` comparison of §2A.1, whose boundary in degree zero measures the change
in `H¹`; condition `(P)` does not remove this correction. The subspaces `L_v`, and the `H⁰` and
`H¹` of the `U_v⁺`, do not determine `H²` of the Selmer complex (Check), so no duality for that
`H²` (the target of an obstruction map) is asserted from
them. For these degree-zero coefficients `H²(S̃^ord) ≅ H²(S̃^mod)` by the comparison triangle.
Apply ArithmeticGaloisDuality §D7.7.4 *Duality for a global mapping fibre with local
conditions* to the modified fibre of §2.21, with the arithmetic compact-support identification
of §2A.1 and ArithmeticGaloisDuality §D7.5's duality. This theorem uses the modified local diagram under the following
hypotheses: `S` contains the places above `p = char k` and the archimedean places; use the
finite-place model under `(P)` and the full modified real-place model of *Duality when `p = 2` and
`K` has real places* (ArithmeticGaloisDuality §D7.5) otherwise;
and dual local conditions `U_v^{⊥+} → C_v^mod(ad ρ(1))` are given for the trace-pairing dual
`(ad ρ)^∨(1) ≅ ad ρ(1)`, together with chosen nullhomotopies of the local cup products
(ArithmeticGaloisDuality §D7.7.3 *Local conditions and derived orthogonal
complements*), for `U_v⁺ → C_v^mod` obtained by composing the ordinary condition with `q_v`.
It gives a morphism from `S̃^mod(ad ρ, U⁺)` to the shift by `[−3]` of the `k`-dual of
`S̃^mod(ad ρ(1), U^{⊥+})`, whose cone is `⊕_{v∈S} Err_v`
(`localDualError`). When every `Err_v` is acyclic (`derivedComplement_iff`), `H²` of the first is
`k`-dual to the modified `H¹` of the second; replacing that group by its ordinary fibre `H¹`
requires its own archimedean comparison. Otherwise the error terms are part of the statement. The
determinant and trace-zero variants come from the trace sequence, as in §2A.4 *Determinant tangent
fibres*.

*Proof sketch.* Write a first-order lift as `(1 + εc)ρ` by ArithmeticGaloisDuality §D8.1 *First-order Galois cocycle comparison*.
The commutative restriction square identifies the global tangent space subject to the local
conditions with the kernel. Apply the long exact sequence of the fibre, keeping the framing and `H⁰`
corrections. Compare the ordinary and modified fibres by §2A.1. For `H²`, apply
ArithmeticGaloisDuality §D7.7.4's modified fibre duality with the given dual local
conditions and nullhomotopies, using ArithmeticGaloisDuality §D7.5's arithmetic local and global duality. Take cohomology
of its error triangle.
(Nekovář, *Selmer complexes*, §6.1, pp.
135–137; [Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1–4.2, pp. 39–45.) *Needs:* ArithmeticGaloisDuality §D8.1 (*First-order Galois cocycle comparison*), §D7.5 (*Duality when `p = 2` and `K` has real places*), §D7.7.3 (*Local conditions and derived orthogonal complements*), §D7.7.4 (*Duality for a global mapping fibre with local conditions*); §2A.1 (Selmer complex `H¹` with its `H⁰` correction); §2.2 (Compact and rational Selmer kernel); §2.21 (Selmer complex as a mapping fibre).

**Checks.**

- The classical data do not determine `H²`: replacing one `U_v⁺` by `U_v⁺ ⊕ k[−2]`, the new summand
  mapping to zero, changes neither `H⁰(U_v⁺)`, `H¹(U_v⁺)`, `L_v` nor the tangent space, but adds the
  summand `k[−2]` to the mapping fibre and so a summand `k` to its `H²`; it also changes `Err_v`, so
  a dual condition complementary to `U_v⁺` is not complementary to the new one.
- Every `L_v = H¹(G_v, ad ρ)` gives the relaxed group `H¹(G_{F,S}, ad ρ)`; every `L_v = 0` gives the
  strict group `Ш¹_S(F, ad ρ)`, the kernel of localisation.
- `F = ℚ`, `S = {p, ∞}` with `p` odd, `n = 1`, `ρ` trivial, `k = 𝔽_p`, relaxed conditions: the
  tangent space is `Hom(G_S, 𝔽_p) ≅ 𝔽_p`, spanned by the first layer of the cyclotomic
  `ℤ_p`-extension.
- `n = 1`, `ρ` trivial, strict conditions `U_v⁺ = 0` at `s ≥ 2` places: the `H⁰` map is the diagonal
  `k → k^s`, with cokernel `k^{s−1}`, so `H¹(S̃^ord)` is an extension of `Ш¹_S(F, k)`
  by `k^{s−1}` and is strictly larger than the Selmer group.
- For `F = ℚ`, `S = {p, ∞}`, `p` odd and the same trivial rank-one strict conditions,
  `H¹(S̃^ord)` has the correction `k`, while `H¹(S̃^mod)` has correction zero. This is the
  §2A.1 comparison even though `(P)` holds.

### 2A.4 Determinant tangent fibres

**Determinant tangent fibres.** Let `ρ : G_{F,S} → GL_n(k)` be as above with `n ≥ 1`, `p = char k`, and
`k[ε] = k[ε]/(ε²)`. On first-order matrices `det(1 + εX) = 1 + ε tr X`, so the differential of the
determinant is the trace, an identity valid also at rank zero. For
positive rank, `tr(E₁₁) = 1` makes `0 → ad⁰ ρ → ad ρ → k → 0` exact, including when `p | n`
(Mathlib `Matrix.trace_surjective` uses a nonempty matrix index type). The trace induces maps of the global and local continuous
cochain complexes `C(G_{F,S}, −)` and `C_v^ord(−)` that commute with restriction. Their mapping
fibres identify with the cochains of `ad⁰ ρ` and give the determinant-relative tangent
comparison and, globally and at each `v ∈ S`, the long exact sequence

```text
0 → H⁰(ad⁰ ρ) → H⁰(ad ρ) → H⁰(k) → H¹(ad⁰ ρ) → H¹(ad ρ) → H¹(k) → H²(ad⁰ ρ) → ⋯
```

For the modified arithmetic diagram, apply the trace to `C_v^mod` and retain the full Tate long
exact sequence at each real place:

```text
⋯ → Ĥ^{−1}(G_v, k) → Ĥ⁰(G_v, ad⁰ ρ) → Ĥ⁰(G_v, ad ρ) → Ĥ⁰(G_v, k) → Ĥ¹(G_v, ad⁰ ρ) → ⋯ .
```

The initial zero of the ordinary sequence is not present here. The maps `q_v` commute with the
trace sequence and its connecting maps, giving the ordinary/modified comparison also for the
determinant fibres. Local determinant conditions are given as maps of local complexes compatible
with the trace, and, still with `n ≥ 1`, the fixed-determinant Selmer comparison uses the dual quotient
`(ad⁰ ρ)^∨ ≅ ad ρ/k·Id` with its
Tate twist, including when `p` divides `n`.

*Proof sketch.* Expand the determinant over the dual numbers and identify its linear term. Check
that the trace intertwines conjugation, so that it induces the global and local cochain maps. Apply
the long exact sequences of the mapping fibre and of the trace sequence, using the complete
resolution at real places in the modified diagram. Compare with the
fixed-determinant first-order lift problem of ArithmeticGaloisDuality §D8.1 *First-order Galois cocycle comparison*, keeping the
`H⁰` boundary. ([Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1.4–4.2, pp. 41–43;
Nekovář, *Selmer complexes*, §5.7.2,
pp. 131–132.) *Needs:* ArithmeticGaloisDuality §D8.1 (*Trace-zero adjoint duality without division by `n`*; *First-order Galois cocycle comparison*); §2A.3 (Selmer and deformation tangent comparison); ArithmeticGaloisDuality §D7.1 (*Derived tensor, perfect amplitude and `Tor`*).

**Checks.**

- `n = 1`: the trace is the identity, `ad⁰ = 0`, and the fixed-determinant tangent space is zero.
- `n = 0`: `ad = ad⁰ = 0` and the trace is not onto `k`. Its cochain fibre is
  `RΓ(G, k)[−1]`, not `RΓ(G, ad⁰) = 0`; the displayed ordinary sequence would fail at
  `H⁰(G, k) = k`. The determinant derivative identity still reads `1 = 1`.
- `p | n` and `H⁰(G_{F,S}, ad ρ) = k·Id`: `H⁰(ad ρ) → H⁰(k)` is zero (`tr Id = n = 0`), so the
  boundary `k → H¹(ad⁰ ρ)` is injective and the fixed-determinant tangent space is
  `H¹(G_{F,S}, ad⁰ ρ)/k`.
- `p ∤ n`: `ad ρ = ad⁰ ρ ⊕ k·Id` equivariantly, the boundary vanishes, and the fixed-determinant
  tangent space is `H¹(G_{F,S}, ad⁰ ρ)`.
- At a real place in characteristic two, take `k = 𝔽₂` and
  `ρ(c) = u = [[1,1],[0,1]]` on `k²`. Conjugation by `u` has invariant spaces of dimension `2`
  on both `ad` and `ad⁰`; the norm `1+c` has image dimensions `2` and `1`, respectively
  (orders `4` and `2`). Hence `Ĥ⁰(G_v, ad) = 0` while `Ĥ⁰(G_v, ad⁰) ≅ k`. The preceding
  `Ĥ^{−1}(G_v,k) → Ĥ⁰(G_v,ad⁰)` is surjective; an initial zero would falsely assert injectivity
  into `Ĥ⁰(G_v,ad)`.

### 2A.5 Derived coefficient change for Selmer comparisons

**Derived coefficient change for Selmer comparisons.** Let `R → R′` be a homomorphism of complete
Noetherian local coefficient rings. Let `C_f` be the ordinary or modified Selmer complex of
§2.21 over `R` — the mapping fibre of
the global cochain complex together with the local conditions `U_v⁺` towards the local cochain
complexes, with the same specified ordinary or modified convention over both rings — and `C′_f`
the corresponding complex over `R′`, with given morphisms from the `R`-data to the `R′`-data.
Assume that the global, local and local-condition complexes are perfect
of bounded amplitude; that the global and local derived base-change morphisms
`R′ ⊗^L_R C(·) → C′(·)` (ArithmeticGaloisDuality §D7.3 *Nakamura cochain tensor comparisons*) are quasi-isomorphisms;
and that each local condition comes with a base-change morphism `R′ ⊗^L_R U_v⁺ → U′_v⁺` which is a
quasi-isomorphism (this is data: no compatibility is asserted for arbitrary local deformation
conditions). Then `R′ ⊗^L_R C_f ≃ C′_f`, and there is a spectral sequence

```text
E₂^{−a,b} = Tor_a^R(R′, H^b(C_f)) ⇒ H^{b−a}(C′_f),
```

convergent because the amplitude is bounded. If `R′` is flat over `R`, or more generally
`Tor_a^R(R′, H^b(C_f)) = 0` whenever `a ≥ 1` and `b − a ∈ {0, 1}`, then
`H¹(C′_f) = R′ ⊗_R H¹(C_f)`. Otherwise all `Tor` terms and differentials contributing to total degree
one must be kept; there is no unconditional correction sequence involving only `H⁰` and `H²`. The
trace and determinant fibres of §2A.4 *Determinant tangent fibres* commute with this base change.

*Proof sketch.* Apply the derived tensor product to the triangle relating the Selmer complex, the
global cochains with the local conditions, and the local cochains. The given global, local and
local-condition quasi-isomorphisms compare its three vertices, so the triangulated comparison
theorem gives a quasi-isomorphism of fibres. The `Tor` spectral sequence is the general one for a
bounded complex (ArithmeticGaloisDuality §D7.1 *Derived tensor, perfect amplitude and `Tor`*); identify its differentials and the
terms of low total degree. (Nekovář, *Selmer
complexes*, §4.2, pp. 97–100; §6.1, pp.
135–137; [Nakamura, *Zeta morphisms for rank two universal
deformations*](https://arxiv.org/pdf/2006.13647), Appendix B, Lemmas B.29–B.31, author pp. 104–106;
[Pottharst, *Analytic families of finite-slope Selmer
groups*](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), §1, Theorem 1.1, Lemma 1.3 and Theorem
1.4, pp. 1574–1578.) *Needs:* ArithmeticGaloisDuality §D7.3 (*Nakamura cochain tensor comparisons*; *Cohomological finiteness and perfect amplitude*), §D7.1 (*Derived tensor, perfect amplitude and `Tor`*); §2A.1 (Selmer complex `H¹` with its `H⁰` correction); §2A.4 (Determinant tangent fibres); §2.2 (Compact and rational Selmer kernel); §2.21 (Selmer complex as a mapping fibre).

**Checks.**

- `R′ = R`: the comparison is the identity and the spectral sequence is concentrated in `a = 0`.
- `R′` flat over `R`: `Tor_a = 0` for `a ≥ 1`, and `H^i(C′_f) = R′ ⊗_R H^i(C_f)` in every degree.
- `R = ℤ_p`, `R′ = 𝔽_p`: `Tor₀ = H^b(C_f)/p`, `Tor₁ = H^b(C_f)[p]` and higher `Tor` vanish, giving
  `0 → H¹(C_f)/p → H¹(C′_f) → H²(C_f)[p] → 0`; so `H¹(C′_f) ≠ H¹(C_f)/p` as soon as `H²(C_f)` has
  `p`-torsion, and a quotient `R′` does not give ordinary tensor compatibility in general.

### Examples

Over `F = 𝔽_q(t)` with `M = 𝔽_p`, `p ∤ q(q − 1)`, and unramified conditions everywhere, the Greenberg–Wiles difference is `1`, coming from the constant degree-`p` extension; over `ℚ` the same choice gives `0`, because the real place contributes `−1` (§2A.2). At a real place in characteristic two the unipotent `u = [[1,1],[0,1]]` gives `Ĥ⁰(G_v, ad) = 0` but `Ĥ⁰(G_v, ad⁰) ≅ k`, so the trace-zero and full adjoint tangent comparisons have different archimedean terms and `1/2` cannot split off the scalars (§2A.4). Reducing a Selmer complex over `ℤ_p` modulo `p` gives `0 → H¹(C_f)/p → H¹(C′_f) → H²(C_f)[p] → 0`, so `p`-torsion in `H²` enlarges the mod-`p` `H¹` beyond the ordinary tensor (§2A.5).

### Dependencies

Layer 2, together with ArithmeticGaloisDuality §R02.3.1 (*Localisation maps and the modified local groups*); ArithmeticGaloisDuality §R02.4.5 (*Function-field arithmetic finiteness and Euler characteristic*; *Prime-to-characteristic function-field Poitou–Tate duality*); ArithmeticGaloisDuality §R02.5.1 (*The Greenberg–Wiles formula*); ArithmeticGaloisDuality §D7.1 (*Derived tensor, perfect amplitude and `Tor`*); ArithmeticGaloisDuality §D7.3 (*Nakamura cochain tensor comparisons*; *Cohomological finiteness and perfect amplitude*); ArithmeticGaloisDuality §D7.5 (*Continuous cochains with compact support*; *Duality when `p = 2` and `K` has real places*); ArithmeticGaloisDuality §§D7.7.1, D7.7.3, D7.7.4; ArithmeticGaloisDuality §D8.1 (*Trace-zero adjoint duality without division by `n`*; *First-order Galois cocycle comparison*).

## Layer 3: Iwasawa cohomology, control and determinants

### 3.0 Iwasawa algebras of `ℤ_p^d × Δ`

Let `R` be a complete Noetherian local ring with finite residue field of characteristic `p, Γ = Γ₀ × Δ` with `Γ₀ ≅ ℤ_p^d (d ≥ 0)` and `Δ` finite abelian. Coordinates and regular sequences use `Λ_R=R⟦Γ⟧` on the carrier `TauCeti.completedGroupAlgebra R Γ`; arithmetic specializations take `R=O`, the ring of integers of a finite extension of `ℚ_p`, and `Λ = O⟦Γ⟧` the completed group algebra `TauCeti.completedGroupAlgebra O Γ` of Tau Ceti (TauCetiRoadmap.ProfiniteProPGroups Layer 9 specifies it and its API: `proj`, `of`, `lift`, `map`, the inverse-limit topology). This subsection fixes the coordinates, the involution, the twists and the augmentation regular sequence that the rest of the layer uses; for `d = 1` the one-variable coordinate and the structure theory are PadicMeasuresIwasawaAlgebras §§1.7 and 4.1–4.6.

**Coordinates.** Prove the coordinate isomorphism: a `ℤ_p`-basis `γ₁,…,γ_d` of `Γ₀` gives a continuous R-algebra isomorphism `R⟦X₁,…,X_d⟧≅R⟦Γ₀⟧, X_i↦γ_i−1`, for the `(𝔪_R,X)`-adic and inverse-limit topologies. Also `R⟦Γ⟧≅R⟦Γ₀⟧[Δ]`, finite free of rank #`Δ`. Construct the multivariable coordinate by the completed-group-algebra universal property and compatible finite quotients; for `R=ℤ_p` and `d=1` it agrees with `TauCeti.completedGroupAlgebra.powerSeriesCoordinate`, and the product decomposition is Tau Ceti's `CompletedGroupAlgebra/Prod.lean`. The regular-local dimension `d+1` conclusion is stated for `O⟦Γ₀⟧` with `R=O` a DVR, not for `Λ=O⟦Γ⟧` when `Δ ≠ 1`. If `p ∤ #Δ`, the idempotents of `O[Δ]` split it as a product of unramified extensions `O_ω` of `O` indexed by Galois orbits of characters (PadicMeasuresIwasawaAlgebras §4.6), so `Λ=∏_ω O_ω⟦Γ₀⟧` is regular componentwise and is not local when `Δ ≠ 1`; if `p | #Δ` no regularity is asserted.

(Nekovář, §§8.4.1–8.4.2, pp. 204–205; Tau Ceti's completed-group-algebra coordinate and product APIs.)

**Checks** (coordinates).

- `d=0` gives `R[Δ]`, including `R=𝔽_p`; no dimension-one assertion is made for `R=𝔽_p`.
- `R=O, d=1` and `Δ=1` gives `O[[X]]`, regular local of dimension two.
- `p=3, O=ℤ₃, d=1, Δ=C₂=⟨δ⟩`: the idempotents `(1±δ)/2` give `Λ≅ℤ₃[[X]]×ℤ₃[[X]]`, which is not local. For `Δ=C₃` the ring `ℤ₃[[X]][C₃]` is local of dimension two, but `(1+Y)³−1 ≡ 0` modulo `(3,X,Y)²` for `Y=δ−1`, so its maximal ideal `(3,X,Y)` needs three generators and the ring is not regular.
- `R=𝔽_p[ε]/(ε²), d=1` and `Δ=1` gives `R[[X]]`, retaining the nonzero nilpotent `ε`; the general coefficient ring need not be regular.

**Augmentation regular sequence.** Prove over `R` that `γ₁−1,…,γ_d−1` is a `Λ_R`-regular sequence with quotient `R[Δ]`. For any closed `Γ′≅ℤ_p^{r′}` in `Γ₀`, Smith normal form gives a basis with `Γ′` generated by `γ_i^{p^{a_i}}, 1≤i≤r′`. The elements `γ_i^{p^{a_i}}−1` form a regular sequence with quotient `R⟦Γ/Γ′⟧`. In coordinates they are the distinguished monic polynomials `(1+X_i)^{p^{a_i}}−1`. Prove division for these polynomials by lifting the unique division modulo `𝔪_R`, where they become `X_i^{p^{a_i}}`, through successive powers of `𝔪_R` and passing to the complete limit. Each quotient is finite free in the eliminated variable over the remaining power-series ring, and multiplication by the next polynomial is injective. This supplies arbitrary closed-subgroup descent in §§3.3 and 3.10, including nonsaturated `Γ′`.

(Nekovář, §8.4.8.1, p. 214, and §8.4.8.3, pp. 215–216; Smith normal form over `ℤ_p` and complete-local Weierstrass division.)

**Checks** (regular sequence).

- `Γ′=0` gives the empty sequence and quotient `Λ_R`.
- `R=𝔽_p, Γ=ℤ_p, Γ′=pℤ_p`: the generator is `X^p`, a non-zero-divisor, and the quotient is `𝔽_p[[X]]/(X^p)≅𝔽_p[C_p]`. The generator `X` would give the wrong quotient.
- `Γ=ℤ_p², Γ′` generated by `γ₁^{p²}`: the quotient retains the second variable and the finite `C_{p²}` factor; `Γ′` need not be a direct summand.

**Involution and twists.** Define the Iwasawa involution by the pinned `TauCeti.completedGroupAlgebra.domCongr` along inversion on the abelian group `Γ`. It gives the O-algebra involution `ι` of `Λ` with `ι(γ) = γ^{−1}` by `domCongr_of`; continuity follows from `continuous_map`, and involutivity from `map_comp` and `map_id`. For a continuous character `κ : Γ → O^×`, prove that there is a unique continuous O-algebra automorphism `Tw_κ` of `Λ` with `Tw_κ(γ) = κ(γ)γ` (from `completedGroupAlgebra.lift` applied to `γ ↦ κ(γ)γ`), with `Tw_1 = id, Tw_κ ∘ Tw_{κ′} = Tw_{κκ′}` and `ι ∘ Tw_κ ∘ ι = Tw_{κ^{−1}}`. With the cyclotomic character `χ_cyc` of the Conventions, `Tw_k := Tw_{χ_cyc^{−k}}`, so `Tw_k(γ) = χ_cyc(γ)^{−k}γ`. For a G-module `M` on which `Λ` acts compatibly, and the tautological character `χ_Γ : G → Γ ⊂ Λ^×`, define the twisted module `M⟨n⟩` (same `Λ`-module, `G` acting by `χ_Γ(g)^n g`) and `M^ι` (same G-module, `Λ` acting through `ι`); then `M⟨n⟩^ι = M^ι⟨−n⟩`.

The involution statement on `TauCeti.completedGroupAlgebra O Γ` holds for every
topological commutative ring `O` and profinite abelian group `Γ`. The definition
The involution needs only a commutative ring `O` and a topological abelian group `Γ`.

(Nekovář, *Selmer complexes*, §8.4.1–8.4.2, pp. 204–205 (Numdam PDF pp. 213–214); §8.4.8.1, p. 214, for the regular sequence.)

**Checks.**

- `d = 0: Λ = O[Δ]`, the regular sequence is empty, `ι` is the antipode of the group ring (PadicMeasuresIwasawaAlgebras §6.1, the sharp involution) and `Tw_κ` is `γ ↦ κ(γ)γ`.
- `d = 1, Γ = ℤ_p` with generator `γ` and `X = γ − 1: ι(X) = (1 + X)^{−1} − 1 = −X + X² − X³ + …`, not `−X`; and for `κ(γ) = u ∈ 1 + pℤ_p, Tw_κ(X) = u(1 + X) − 1`, which differs from PadicMeasuresIwasawaAlgebras §4.4's generator change `σ_u(X) = (1 + X)^u − 1`.
- `d = 2: Λ/(γ₁ − 1, γ₂ − 1) = O[Δ]` and `Λ/(λ, γ₁ − 1) ≅ k⟦X₂⟧[Δ]`. For `Δ = 1` these are `O` and `k⟦X₂⟧`; the latter is infinite although the quotient has height two, so pseudo-null modules over `O⟦ℤ_p²⟧` need not be finite (§3.18).
- `ι ∘ Tw_κ ∘ ι = Tw_{κ^{−1}}`: on `γ` both sides give `κ(γ)^{−1}γ`; replacing the right side by `Tw_κ` fails unless `κ² = 1`.

*Needs:* Tau Ceti `TauCeti.completedGroupAlgebra` (`lift`, `map`, `powerSeriesCoordinate`, the product decomposition); TauCetiRoadmap.ProfiniteProPGroups Layer 9; PadicMeasuresIwasawaAlgebras §§1.7, 4.4, 6.1; Mathlib `MvPowerSeries`, `RingTheory.Sequence.IsRegular`.

### 3.1 Iwasawa cohomology

In the number-field finite-free lattice setting, use NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticIwasawaCochains` and `arithmeticIwasawaCochains.shapiro`; for an abelian p-adic Lie tower and a `ℤ_p`-lattice identify them with IntegralIwasawaTheory §10.0's `derivedArithmeticTower` and `compactArithmeticShapiro`, and, for the cyclotomic tower of a finite abelian extension, with §10.2's `arithmeticIwasawaComplex`. Extend this theory to the following general profinite and coefficient setting. Let `R` be a complete local noetherian ring with finite residue field of characteristic `p, G` a profinite group, `H` a closed normal subgroup, `Γ = G/H, 𝒰` the open subgroups `U ⊇ H`, and `M` an ind-admissible `R[G]`-module; `M_U = M ⊗_R R[G/U]`. `RΓ_Iw(G, H; M)` is the complex `lim_U C^•_cont(G, M_U)` of `R̄`-modules, `R̄ = R⟦Γ⟧`, and `H^i_Iw(G, H; M)` its cohomology. There is a spectral sequence `E₂^{ij} = lim^{(i)}_{U,cor} H^j_cont(U, M) ⇒ H^{i+j}_Iw(G, H; M)`; if `M` is of finite type over `R` and `G` satisfies `(F)` (finite cohomology of finite modules on open subgroups), then `H^j_Iw(G, H; M) = lim_{U,cor} H^j_cont(U, M)`. If moreover `𝒰` has a cofinal chain and `p^∞` divides the pro-finite order of `Γ`, then `H⁰_Iw(G, H; M) = 0`.

`R` complete local noetherian; `M` of finite type over `R` for the corestriction-limit description; condition `(F)`, which `G_{K,S}` and local Galois groups satisfy (ArithmeticGaloisDuality §R02.4.4 (*Finiteness of Galois cohomology with restricted ramification*)).

The general extension is identified with the supplied arithmetic derived limit by the finite-level Shapiro maps, compatibly with their corestriction transitions. Its cochain-limit model is justified as follows. The transition maps `C^•_cont(G, M_V) → C^•_cont(G, M_U)` are surjective, so the projective system is weakly flabby and the first hypercohomology spectral sequence for `lim` collapses (Jannsen); the second is the stated one, with corestriction transitions by Shapiro's lemma at finite level (ProfiniteCohomology Layer 7). For finite R-length coefficient quotients, `(F)` gives finite cohomology groups and vanishing higher derived limits. For finite-type complete R-coefficients the cohomology groups are compact, not necessarily finite-length: use exactness of inverse limits of compatible compact groups and the coefficient-limit spectral sequence. Do not assert a Mittag–Leffler condition for an arbitrary corestriction tower of lattices. Use the ArithmeticGaloisDuality Layer R02.1 compact-limit interface to extend finite-level Shapiro to these complete coefficients. `H⁰: M^{U_n}` stabilises to `N`, and the corestrictions `N → N` are multiplication by `[U_n : U_{n′}]`, whose p-part tends to infinity; so the limit vanishes (Rubin, Lemma B.3.2).

(Nekovář, Chapter 8, 8.3.4–8.3.5, p. 203 (Numdam PDF p. 212); Rubin (1999 draft), Appendix B, §3, Lemmas 3.1–3.2, printed pp. 153–154 (PDF pp. 163–164).)

The library targets include the following operations and identities:

- `RΓ_Iw(G, H; M) = lim_U C^•_cont(G, M_U)`; for `G=G_(F,S), H=G_(F∞,S)` and a supplied lattice T, the comparison is `RΓ_Iw(G_(F,S), G_(F∞,S); T) ≃ Rlim_{n,cor} C(G_(F_n,S),T) ≃ arithmeticIwasawaCochains(F∞/F,T)`. For an abelian p-adic Lie tower and a `ℤ_p`-lattice it also equals `derivedArithmeticTower`; for the cyclotomic tower of a finite abelian extension `F/k` this is in turn `arithmeticIwasawaComplex F S T`. All comparisons use the same finite-level projections.
- `H^i_Iw(G, H; M)`, an `R⟦Γ⟧`-module.
- Under `(F): H^j_Iw(G, H; M) ≅ lim_{U,cor} H^j_cont(U, M)` (Nekovář 8.3.5(ii)).
- `H⁰_Iw(G, H; M) = 0` when `p^∞` divides #`Γ` (8.3.5(iii); Rubin B.3.2).
- `lim_F H¹(F, T) = lim_n H¹(F_n, T/p^nT)` along a tower (Rubin, Lemma B.3.1).
- Natural in `M` and exact on distinguished triangles.

**Checks.**

- `Γ = 1: H^i_Iw(G, G; M) = H^i_cont(G, M)`.
- Cyclotomic `ℤ_p`-extension, `M=ℤ_p` with trivial action: every finite-level `H⁰` is `ℤ_p`, while corestriction multiplies by `p` along consecutive levels and `H⁰_Iw=0`. Replacing these transitions by restrictions gives `ℤ_p` instead.
- For Kato’s `j_*` convention, §3.15 proves the degree-one comparison with the finite-S Galois norm limit and no all-degree `j_*/Rj_*` identification: higher inertia cohomology is retained.
- With restriction instead of corestriction transitions, `lim H⁰(F_n, ℚ_p/ℤ_p) = ℚ_p/ℤ_p ≠ 0`: the transition maps are part of the definition.
- For a constant number-field tower, the comparison with each supplied tower complex is the identity on the continuous cochains. For the zero lattice all these complexes are zero.
- With `R=𝔽_p[ε]/(ε²)` or an ind-admissible coefficient outside the lattice setting, the general construction still applies under its stated hypotheses; it is not replaced by the `ℤ_p`-lattice specialization.

`H⁰_Iw = 0` is a consequence of `p^∞ |` #`Γ`, not an assumption; torsion of `H²_Iw` is not asserted here (see §3.4).

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (`arithmeticIwasawaCochains`, `arithmeticIwasawaCochains.shapiro`); IntegralIwasawaTheory §10.0 (`derivedArithmeticTower`, `compactArithmeticShapiro`); IntegralIwasawaTheory §10.2 (`arithmeticIwasawaComplex`, cyclotomic towers of finite abelian extensions); §2.9 (Compact and rational Galois Selmer groups); DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); ArithmeticGaloisDuality §R02.1.2 (*Tate's inverse-limit theorem*); ArithmeticGaloisDuality §R02.4.4 (*Finiteness of Galois cohomology with restricted ramification*); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteCohomology Layer 10.

### 3.2 Shapiro's lemma for Iwasawa cohomology

Use the supplied `arithmeticIwasawaCochains.shapiro` and `compactArithmeticShapiro` on the arithmetic domains of §3.1, retaining their finite-level maps. With `𝓕_Γ(M) = lim_U M_U`: for `M` of finite type over `R` there are canonical `R̄[G]`-isomorphisms `𝓕_Γ(M) ≅ (M ⊗_R R̄) ⟨−1⟩` and `𝓕_Γ(M)^ι ≅ (M ⊗_R R̄^ι)⟨+1⟩ ≅ (M ⊗_R R̄)⟨1⟩`, where `⟨n⟩` twists the G-action by `χ_Γ^n, χ_Γ : G → Γ ⊂ R̄^×` the tautological character, and `ι` is the involution `γ ↦ γ^{−1}`; `𝓕_Γ(M)` is of finite type over `R̄`. The last isomorphism is `id ⊗ ι`; the middle exponent is positive because twisting the scalar action by `ι` reverses `⟨n⟩`. The canonical morphism `C^•_cont(G, 𝓕_Γ(M)) → lim_U C^•_cont(G, M_U)` is an isomorphism, so `RΓ_cont(G, 𝓕_Γ(M)) ≅ RΓ_Iw(G, H; M)`.

`M` ind-admissible of finite type over `R`; `Γ` abelian, `Γ ≅ Γ₀ × Δ` with `Γ₀ ≅ ℤ_p^r` and `Δ` finite.

For the general finite-type R-coefficient extension, prove the comparison as follows. `N ⊗_R R̄ = N ⊗_R lim R_U ≅ lim (N ⊗_R R_U)` for `N` of finite type; on `𝓕_Γ(M), x ∈ R̄` acts by `id ⊗ ι(x)` and `g ∈ G` by `g ⊗ χ_Γ(g)`, which gives the two isomorphisms (Nekovář 8.4.4.1). Let `m` be the maximal ideal of `R, γ₁, …, γ_r` a `ℤ_p`-basis of `Γ₀` and `J = mR̄ + (γ₁ − 1, …, γ_r − 1)R̄`, the extension of the maximal ideal of the local ring `R⟦Γ₀⟧`. Since `R̄` is finite over `R⟦Γ₀⟧` and `R̄/J = (R/m)[Δ]` is artinian, `J` lies in the Jacobson radical `rad(R̄)` and `rad(R̄)^N ⊆ J` for some `N`. So the J-adic and `rad(R̄)`-adic topologies agree, and on each local factor of the semilocal ring `R̄` they restrict to the adic topology of its maximal ideal. The two projective-limit topologies on `𝓕_Γ(M)`, the J-adic and the `(U, n)`-adic, coincide, because `{J^N}` and `{J_U + m^n R̄}` are cofinal in each other `(J_U = ker(R̄ → R[G/U]))`. In the finite ring `(R/m^n)[G/U]` each `γ_i` has p-power order, so the image of `J` is generated by nilpotent elements and some `J^N` lies in `J_U + m^n R̄`. Conversely `γ_i^{p^k} − 1 ∈ J^{k+1}`, because `p ∈ m`. Hence continuous cochains commute with the limit (8.4.4.2).

(Nekovář, Chapter 8, §8.4.1, pp. 204–205 (Numdam PDF pp. 213–214), for the semilocal ring `R̄` and its radical; Nekovář, Chapter 8, Proposition 8.4.4.1, p. 206 (Numdam PDF p. 215); Nekovář, Chapter 8, Proposition 8.4.4.2 and its proof, p. 207 (Numdam PDF p. 216), which treats the local case `Γ = Γ₀`.)

On the common arithmetic domain the tensor flip identifies `𝓕_Γ(T)` with IntegralIwasawaTheory §10.0's `completedArithmeticCoefficients`, and the cochain isomorphism is its `compactArithmeticShapiro`, also NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticIwasawaCochains.shapiro`. The inverse action is explicit: with the tautological character the Galois action on `T ⊗ Λ` is `g ⊗ χ_Γ(g)^{−1}` (Nekovář 8.4.4.1, the module `(M ⊗_R R̄)⟨−1⟩`); the opposite convention is `𝓕_Γ(M)^ι`.

**Checks.**

- `R = ℤ₃, G = Γ = ℤ₃, H = 1, M = ℤ₃` trivial: in the first tensor model, `𝓕_Γ(M)^ι` has scalar action `λ·x = ι(λ)x` and Galois action `γ·x = γ⁻¹x`. The module `Λ^ι⟨+1⟩` has exactly these actions; `Λ^ι⟨−1⟩` instead has Galois action `γx`. For `γ = 1 + X`, the coefficient of `X` in `γ − γ⁻¹` is `2`, so a unit cannot intertwine those actions in `ℤ₃[[X]]`. Already modulo `(3, X²)`, `γ = 1 + ε` and `γ⁻¹ = 1 − ε` are distinct inverse units.
- `R = ℤ₅, Γ = ℤ₅ × C₂: R̄ ≅ A × A` with `A = ℤ₅⟦T⟧`, and `J = (5, T)A × (5, T)A` gives the separated product topology. The maximal ideal `m₊ = (5, T)A × A` has `⋂_n m₊^n = 0 × A`, so its adic topology is not separated; a maximal ideal cannot replace `J` when `Δ` is not a p-group.
- `R = ℤ_p, Γ = ℤ_p × C_p` with `δ` generating `C_p: R̄` is local with maximal ideal `rad(R̄) = J + (δ − 1)R̄`. Since `(δ − 1)^p ∈ pR̄, rad(R̄)^p ⊆ J ⊊ rad(R̄)`, so the two ideals define the same topology.
- `Δ = 1: J` is the maximal ideal of `R⟦Γ₀⟧`, the local case of Nekovář 8.4.4.2. For `Γ = 1` the ideals `J_U` vanish, so `m^n R̄` is needed in the second system.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (`arithmeticIwasawaCochains.shapiro`); IntegralIwasawaTheory §10.0 (`completedArithmeticCoefficients`, `compactArithmeticShapiro`); §3.1 (Iwasawa cohomology); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*); §3.0 (Iwasawa algebras of `ℤ_p^d × Δ`).

### 3.3 Descent and control for Iwasawa cohomology

The number-field lattice comparisons are the quotient-tower specialization of NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticIwasawaCochains` and, for the cyclotomic tower of a finite abelian extension with a `ℤ_p`-lattice, IntegralIwasawaTheory §10.3 (*Finite-layer descent with every Tor term*), using their actual augmentation and quotient maps; other abelian towers use §10.0's derived base change and Tor spectral sequence. For the general profinite/R-coefficient extension: (i) for `M` supported at the maximal ideal there is the Hochschild–Serre spectral sequence `E₂^{ij} = H^i_cont(Γ, H^j_cont(H, M)) ⇒ H^{i+j}_cont(G, M)`. (ii) If `Γ ≅ ℤ_p^r`, then `RΓ_Iw(G, H; T) ⊗^L_{R̄} R ≅ RΓ_cont(G, T)`, with a homological spectral sequence `E²_{ij} = H_{i,cont}(Γ, H^{−j}_Iw(G, H; T)) ⇒ H^{−i−j}_cont(G, T)`, each term of finite type over `R` when `G` satisfies `(F)`. If `Γ ≅ ℤ_p` it degenerates into `0 → H^j_Iw(G, H; T)_Γ → H^j_cont(G, T) → H^{j+1}_Iw(G, H; T)^Γ → 0`; and if `cd_p(G) = e < ∞` and `τ_{≤n}T ≅ T`, then `H^{e+n}_Iw(G, H; T)_Γ ≅ H^{e+n}_cont(G, T)`. (iii) For a closed `Γ′ ≅ ℤ_p^{r′}` in `Γ` with preimage `H′, RΓ_Iw(G, H; T) ⊗^L R⟦Γ/Γ′⟧ ≅ RΓ_Iw(G, H′; T)`, with the analogous spectral sequence and, for `Γ′ ≅ ℤ_p`, the analogous short exact sequences.

`Γ ≅ ℤ_p^r (or Γ′ ≅ ℤ_p^{r′})`; `T` a bounded-below complex of finite type over `R`.

Transport the supplied arithmetic maps in their common domain. For the extension, (i) is ArithmeticGaloisDuality's Hochschild–Serre spectral sequence (R02.2). (ii) `γ₁ − 1, …, γ_r − 1` is a regular sequence in `R̄` with `R̄/x ≅ R`; tensoring the exact sequences `0 → R̄_{i−1} → R̄_{i−1} → R̄_i → 0` with `T` and applying §3.2 gives the isomorphism; the Koszul filtration gives the spectral sequence (Nekovář 8.4.8.1). For `r = 1` the spectral sequence has two columns (8.4.8.2); (iii) replaces `x` by the generators of `Γ′` (8.4.8.3–8.4.8.4).

(Nekovář, Chapter 8, Proposition 8.4.8.1, p. 214 (Numdam PDF p. 223); Nekovář, Chapter 8, Corollary 8.4.8.2 and Proposition 8.4.8.3, p. 215 (Numdam PDF p. 224).)

The control statements carry their error terms (coinvariants and invariants); no isomorphism `H^j_Iw(G, H; T)_Γ ≅ H^j(G, T)` is claimed in general.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (quotient-tower specialization of `arithmeticIwasawaCochains`); IntegralIwasawaTheory §10.3 (*Finite-layer descent with every Tor term*, cyclotomic towers of finite abelian extensions); IntegralIwasawaTheory §10.0 (derived base change and the Tor spectral sequence of `derivedArithmeticTower`); §3.2 (Shapiro's lemma for Iwasawa cohomology); ArithmeticGaloisDuality §R02.2.1 (*The Hochschild–Serre spectral sequence*); DerivedModuleAlgebra §S.1 (*The spectral sequence of a first-quadrant double complex*); §3.0 (Iwasawa algebras of `ℤ_p^d × Δ`).

### 3.4 A criterion for torsion Iwasawa cohomology

Assume `Γ ≅ ℤ_p^r, G` satisfies `(F)` and `cd_p(G) < ∞`. Let `𝔭 ∈ Spec(R)` and `𝔭̄ ∈ Spec(R̄)` its preimage under the augmentation `R̄ → R`. If `T ∈ D^b` of finite type over `R` has `RΓ_cont(G, T)_𝔭 ≅ 0`, then `RΓ_cont(G, 𝓕_Γ(T))_𝔭̄ ≅ 0`.

The vanishing of the specialised complex at `𝔭` is a hypothesis.

Prove this as follows. §3.3 (ii) localised at `𝔭` gives `E²_{ij} = H_{i,cont}(Γ, H^{−j})_𝔭 ⇒ H^{−i−j}_cont(G, T)_𝔭 = 0`, with finitely many nonzero terms. If `E²_{0,j} = 0` then all `E²_{i,j} = 0` (Nekovář 7.2.7 and Lemma 8.10.5); by induction on `j, (H^{−j})_𝔭̄/J = 0` for the augmentation ideal `J ⊆ 𝔭̄`, and Nakayama's lemma gives `H^{−j}_𝔭̄ = 0`.

(Nekovář, Chapter 8, Proposition 8.4.8.5, p. 216 (Numdam PDF p. 225).)

This is the form in which torsion of `H²_Iw` and of Selmer duals is proved; it is a separate conclusion from a specialisation hypothesis, with its specialization hypothesis retained.

*Needs:* §3.3 (Descent and control for Iwasawa cohomology); §3.2 (Shapiro's lemma for Iwasawa cohomology).

### 3.5 Universal norms are unramified away from `p`

Let `T` be finitely generated over `ℤ_p`. (i) If `K/ℚ_ℓ` is finite with `ℓ ≠ p` and `K_∞` its unramified `ℤ_p`-extension, every norm-compatible `{c_F} ∈ lim H¹(F, T)` has `c_F ∈ H¹_ur(F, T)`. (ii) If `K` is a number field, `K_∞/K` abelian with `Gal(K_∞/K) ≅ ℤ_p^d`, and `λ ∤ p` a prime of `F` whose decomposition group in `Gal(K_∞/K)` is infinite, then `(c_F)_λ ∈ H¹_ur(F_λ, T)`. (iii) If `S` contains the primes where `T` is ramified, those above `p`, those with finite decomposition group in `Gal(K_∞/K)` and the infinite places, then `lim_F H¹(F, T) = lim_F H¹(K_S/F, T)`.

`ℓ ≠ p` in (i); `d ≥ 1`.

Prove this as follows. `(i) 0 → H¹_ur(F, T) → H¹(F, T) → H¹(I, T)^{G_F}`, with `H¹(I, T)` finitely generated over `ℤ_p` (Rubin, Proposition B.2.7(iii)); the limit of the last terms vanishes by §3.1's `H⁰` statement (Lemma B.3.2). (ii) Choose `F′ ⊆ F_∞` with `Gal(F_∞/F′) ≅ ℤ_p` undecomposed at `λ̄` and apply (i); corestrict. (iii) By (ii) the restriction of `c_F` to each inertia group outside `S` vanishes, so its cocycles factor through `Gal(K_S/F)`.

(Rubin (1999 draft), Appendix B, §3, Proposition 3.3, printed p. 154 (PDF p. 164).)

Only for primes not above `p`; the places above `p` and those that split finitely are kept in `S`.

*Needs:* §3.1 (Iwasawa cohomology); §2.7 (The unramified condition); ArithmeticGaloisDuality §R02.3.1 (*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*); TauCetiRoadmap.LocalFieldsRamification Layer 4.

### 3.6 Semilocal cohomology and descent of local classes

Let `K` be a number field, `q` a prime of `K, F/K` finite and `S` the primes of `F` above `q`, with decomposition groups `D_Q = g_Q^{−1} D g_Q`. For a discrete `G_K`-module `T` and a D-submodule `T′`, use `Coind_D^{G_K}T′`, the supplier’s discrete module of locally constant D-equivariant functions. Then `H^i(F,Coind_D^{G_K}T′)≅⊕_{Q∈S}H^i(F_Q,T′_Q)` in every degree; the same statement applies to `T` and `T^I`, with conjugated coefficients at each `Q`. For `F/K` finite Galois and `T` finitely generated over `ℤ_p`, restriction gives `H¹(K_q, T) ≅ (⊕_{Q|q} H¹(F_Q, T))^{Gal(F/K)}` if `[F : K]` is prime to `p`, and `H¹(K_q, V) ≅ (⊕_{Q|q} H¹(F_Q, V))^{Gal(F/K)}` always.

`T` discrete for coinduction; `D` closed, `G_F` open, and `i≥0` arbitrary. `T` finitely generated over `ℤ_p` for the descent.

Prove this as follows. `D\G_K/G_F↔S` by `DgG_F↦g^{−1}Q₀`. Partition locally constant equivariant functions over this finite double-coset set to obtain the restriction decomposition below. Apply the pinned all-degree `TauCeti.ContinuousCohomology.shapiroIso` to each closed subgroup `D_Q∩G_F`; ProfiniteCohomology Layer 10 supplies its all-degree contract. Descent: ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*) applied to the semilocal module; for `V`, finite groups have no rational cohomology.

(Rubin (1999 draft), Appendix B, §5, Proposition 5.1, printed p. 157 (PDF p. 167).)

**Restriction decomposition for semilocal coinduction.** Prove `res_{G_F}Coind_D^{G_K}T′≅⊕_Q Coind_{D_Q∩G_F}^{G_F}T′_Q`. Restrict each function to `Dg_QG_F` and translate by `g_Q`; extend the resulting functions by zero on the other clopen double cosets. These maps are inverse, `G_F`-equivariant and preserve local constancy. Finite `F/K` makes the direct sum a finite product.

(Rubin, Appendix B, Proposition 5.1, p. 157 (PDF p. 167); ProfiniteCohomology Layers 7 and 10, on the coinduced carrier.)

**Checks.**

- `F=K` gives one summand and the original coinduced module.
- If `q` splits completely in `F`, the decomposition has `[F:K]` local summands, not one.
- For `D` closed of infinite index and trivial nonzero finite `T′, H⁰(G_K,Coind_D T′)=T′` via constant functions. Algebraic induction has no nonzero invariant finite-support function and would give zero.

This is how infinite-level local conditions are defined: as limits of semilocal conditions, not as conditions over a 'completion' of `K_∞`.

*Needs:* §3.1 (Iwasawa cohomology); ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*); TauCetiRoadmap.ProfiniteCohomology Layer 7 (closed-subgroup coinduction); Layer 10 (all-degree Shapiro); Tau Ceti `TauCeti.ContinuousCohomology.shapiroIso`.

### 3.7 Twisting Iwasawa cohomology

For the cyclotomic `Γ=Gal(ℚ(μ_(p∞))/ℚ)`, choose `t=(ζ_(p^n))_n` in `ℤ_p(1)`, with `ζ_(p^(n+1))^p=ζ_(p^n)`. For `k∈ℤ` let `t^k` denote the corresponding generator of `ℤ_p(k)`, using the dual generator for negative `k`. This trivializes the Tate line over the infinite field, rather than over each finite layer with integral coefficients. The resulting twist isomorphism `φ_k:H^q_Iw(T)≃H^q_Iw(T(k))` is O-linear and satisfies `φ_k(λx)=Tw_k(λ)φ_k(x)`, where `Tw_k(σ)=κ(σ)^−kσ`. For a finite `S` containing `p`, infinity and coefficient ramification, augmentation specialization gives `H¹_Iw(V)→H¹(G_(ℚ,S),V(k))`, factoring through the specialization prime `σ_c↦c^−k`.

Cyclotomic tower; `T` finite free over `O` with continuous action; chosen compatible generators. Rational Iwasawa cohomology is `H^q_Iw(T)⊗_ℤpℚ_p`, retaining bounded denominators. For `p=2`, the degree statements use the real-place conventions already specified.

Prove this as follows. On the infinite Galois subgroup, `t^k` identifies the coefficient representations and their cochains. Transfer this identification to the completed induced coefficients of §3.2. At degree one, Rubin's diagonal limit identifies the construction with cup product on `H¹(F_n,T/p^nT)` using the invariant generator `t_n^k` of `(ℤ/p^n)(k)`; reduction of `t_(n+1)^k` gives `t_n^k`. The projection formula makes these cup maps compatible with corestriction combined with coefficient reduction. There is no claim that integral lattice `H⁰` roots form a corestriction-compatible system. For `σ∈Γ, σt^k=κ(σ)^kt^k`; thus `φ_k(σx)=κ(σ)^−kσφ_k(x)`. The inverse uses `t^−k`. Apply derived augmentation control to obtain the finite-S specialization.

(Kato, Theorem 12.5(1), p. 221, the roots-of-unity cup-product isomorphism; Rubin (1999 draft), Appendix B, Lemma 3.1, printed pp. 153–154 (PDF pp. 163–164); Burungale–Tian (arXiv v2), §2.2.2, p. 4 and §3, equation (3.2), p. 6.)

**Checks.**

- For `k=0` the chosen coefficient identification and `Tw₀` are the identity.
- For `k=1` and `κ(γ)=4` over `ℚ₃, φ₁(γx)=(1/4)γφ₁(x)`; the opposite scalar 4 fails.
- For `k=−1` the dual generator is used, and `φ_(−1)φ₁` is the identity; a negative tensor power of a finite root is not a definition.
- The inverse corestriction limit of finitely generated lattice `H⁰` is zero in an infinite p-tower (§3.1). It cannot contain a nonzero integral Tate generator. The roots used in the diagonal degree-one construction are finite-coefficient invariant generators with coefficient-reduction compatibility.

*Needs:* §3.1 (Iwasawa cohomology); §3.2 (Shapiro's lemma for Iwasawa cohomology); §3.3 (Descent and control for Iwasawa cohomology); §3.0 (Iwasawa algebras of `ℤ_p^d × Δ`); TauCetiRoadmap.ProfiniteCohomology Layer 12.

### 3.8 Iwasawa Selmer complex and completed action

For `Γ=Gal(F∞/F)≅ℤ_p^d, Λ=O[[Γ]]`, let the Iwasawa Selmer complex be the adapter to NoncommutativeAndEquivariantIwasawa §F.4's Iwasawa Selmer fibre with the same local diagrams. It satisfies `RΓ_f,Iw^ε(F∞/F,T;U) ≃ Rlim_{n,cor} arithmeticSelmerComplexε(F_n,S_n,T;U_n)`. For a `ℤ_p`-lattice each finite fibre is also IntegralIwasawaTheory §10.0's `arithmeticLocalMappingFiber`, with §10.0's `compactArithmeticShapiro` and `derivedArithmeticTower` for the tower; the comparisons of §10.2 apply only when `F∞` is the cyclotomic tower of a finite abelian extension, so `d = 1`. For the broader compatible coefficient complexes of §2.21, extend this adapter by the same formula. Thus the infinite compact complex is `Rlim_n RΓ_f(F_n,T;U_n)`, with corestriction, and the discrete complex is `colim_n RΓ_f(F_n,A;U_n)`, with restriction. Specify the ordinary or modified diagram of §2.21 at each level, with actual local maps, transition maps and their coherent comparison homotopies. Shapiro identifies the compact complex with the finite-S fibre for `T_Λ=Λ⊗̂_O T` on which `g` acts by `[g]^−1⊗g`, using that same local diagram. Arithmetic duality in §3.12 uses the modified instance. At a place `v` use the induced semilocal `Λ`-module from its decomposition subgroup `Γ_v`. The completed action is continuous, and the compact/discrete actions are paired contragrediently. `F∞,v` is never treated as a locally compact local field.

Finite `S` containing `p`, infinite places and coefficient ramification; finitely generated compatible local coefficient complexes. Nekovář condition `(U)`: added non-p places are unramified in the tower, or their ramification errors are retained.

Transport the global and semilocal vertices, completed action, fibre maps and coherent homotopies from the supplied Iwasawa Selmer diagram. Specialize its local-condition maps to the propagation and finite/ordinary conditions of Layer 2. For coefficients beyond the supplied lattice domain, use the general Shapiro comparison of §§3.1–3.2 and ArithmeticGaloisDuality §D7.3 (*Compact Shapiro and projection formulas*), with derived coefficient limits from DerivedModuleAlgebra §1.T.1 and PerfectoidTowers §P9.0. The discrete adapter uses filtered restriction colimits and its Pontryagin dual. No new arithmetic cochain or mapping-fibre carrier is introduced.

(Nekovář, §8.5.6, p. 220; §§8.6 and 8.8, pp. 221–237.)

The library targets include the following operations and identities:

- The adapter to the supplied corestriction derived inverse limit of the finite-level fibres, extended to the stated coefficient diagrams.
- The restriction colimit of the discrete finite-level fibres.
- Equivalent to the induced-coefficient finite-S fibre.
- Continuous `Λ`-action with inverse action on the induced factor.
- Induction from `Γ_v` represents the sum over all places above `v`.

**Checks.**

- A constant tower of relaxed conditions reduces to global Iwasawa cohomology.
- Under a generator `γ`, evaluation on an induced function translates by `γ^−1`; direct `γ`-translation gives the wrong Shapiro map.
- If `Γ_v=1`, the finite-level local sum has `[Γ:Γ_n]` summands; one local factor is incorrect.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (Iwasawa Selmer fibre and `arithmeticIwasawaCochains.shapiro`); IntegralIwasawaTheory §10.0 (`arithmeticLocalMappingFiber`, `compactArithmeticShapiro`, `derivedArithmeticTower`); IntegralIwasawaTheory §10.2 (`arithmeticIwasawa_shapiroComparison`, cyclotomic towers of finite abelian extensions); §2.21 (Selmer complex as a mapping fibre); §3.2 (Shapiro's lemma for Iwasawa cohomology); §3.6 (Semilocal cohomology and descent of local classes); §3.0 (Iwasawa algebras of `ℤ_p^d × Δ`).

### 3.9 Local specialization correction complex

For a specialization `Λ→R` and a specified local condition `i:U^+→C_v`,Iw with specialized finite-level condition `i_R:U_R^+→C_v,R`, define `E_v(R)=Cone(U^+⊗^L_ΛR→U_R^+)` using the actual comparison map. When ambient global/local cochains satisfy derived base change, the cone of `RΓ_f`,Iw`⊗^L R→RΓ_f,R` is `⊕E_v(R)`, with the orientation determined by the condition-change triangle. Its LES records all local correction groups. An exceptional eigenvalue or finite-slope condition is encoded by the provided local map; this construction supplies no `(φ,Γ)`-module regulator.

A specified coherent specialization map on `U^+` and ambient cochains; finite changed set.

In the number-field lattice domain this is the local comparison cone in NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticSelmerComplex.control`: `E_v(R) = Cone(U_v^+ ⊗^L_Λ R → U_v,R^+)` with the very same comparison arrow. Transport its triangle and LES, retaining the global `H⁰` and every local kernel and cokernel. For the broader coefficient diagrams, extend this comparison by the diagram of fibres and the octahedral axiom; the ambient comparison cones vanish by hypothesis. Prove naturality under a second specialization.

(Nekovář, §6.1, pp. 135–137; §8.10, pp. 249–251.)

The library targets include the following operations and identities:

- The cone `E_v(R)` of the local-condition specialization map.
- Acyclic iff the specified local comparison is a quasi-isomorphism.
- The fibre comparison has the direct sum of these errors as its cone.
- Coherent specialization maps induce maps of error triangles.

**Checks.**

- Identity comparison has acyclic error.
- A failed degree-zero comparison contributes to the control LES even if local `H¹` images agree.
- Nonflat `U^+` must be derived-tensored; ordinary tensor can delete a `Tor` correction.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (`arithmeticSelmerComplex.control` with its local errors); §2.23 (Primitive, imprimitive and strict condition-change triangles); §3.8 (Iwasawa Selmer complex and completed action); PadicMeasuresIwasawaAlgebras §5.1.

### 3.10 Derived specialization and control spectral sequence

Specialize NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticSelmerComplex.control` to the local maps of §§3.8–3.9, and use IntegralIwasawaTheory §10.3's Tor edge maps for the cyclotomic tower of a finite abelian extension with a `ℤ_p`-lattice, and §10.0's Tor spectral sequence for other abelian p-adic Lie towers. Extend these comparisons to the broader coefficient diagrams under the following hypotheses. For compatible induced local conditions with derived base-change equivalences, `RΓ_f`,Iw`⊗^L_Λ Λ_n≃RΓ_f(F_n,T)`, where `Λ_n=O[Γ/Γ_n]`. The spectral sequence `Tor_i^Λ`(`H^j_f`,Iw,`Λ_n`)`⇒H^(j−i)_f(F_n,T)` has its natural edge maps. For `Γ=ℤ_p` and `Λ_n=Λ/(γ^(p^n)−1)`, this yields `0→H^j_f`,Iw/`(γ^(p^n)−1)→H^j_f(F_n,T)→H^(j+1)_f`,Iw`[γ^(p^n)−1]→0`. Local conditions without derived base change contribute the correction complex of §3.9. No unconditional specialization isomorphism is asserted.

Bounded cohomology and the derived-completion and base-change hypotheses of ArithmeticGaloisDuality §D7.3 (*Continuous cochains in the derived category*). Local maps, not only their `H¹` images, must commute with derived specialization.

Write `C_Iw^sup` for the supplied Iwasawa Selmer fibre. Writing `C_Iw` for the Iwasawa Selmer complex of §3.8, the specialization equation is `C_Iw ⊗^L_Λ Λ_n ≃ C_Iw^sup ⊗^L_Λ Λ_n ≃ arithmeticSelmerComplex(F_n,T;U_n)`. The second comparison is an equivalence under the stated local base-change hypotheses; otherwise its cone is the sum over `v` of the local specialization correction complexes of §3.9 at `Λ_n`. Identify the edge maps and error LES with those of `arithmeticSelmerComplex.control`, not just their dimensions. For the coefficient extension, apply infinite Shapiro to each vertex and derived base change to the fibre triangle; a projective resolution of `Λ_n` gives the spectral sequence. For `d=1` its two-term resolution gives the displayed sequence, including degree `j+1` torsion.

(Nekovář, §8.10, especially §§8.10.1–8.10.5, pp. 249–251.)

**Checks.**

- A complex with only `H²=Λ/(γ−1)` contributes `O` to finite-level `H¹`.
- A complex with only a `Λ`-free `H¹` specializes without a `Tor` error.
- For `Γ=ℤ_p²`, higher `Tor can` survive; a universal short exact sequence is false.
- For `Λ=O[[X]]` and `[Λ --X→ Λ]` in degrees zero and one, derived augmentation gives O in both degrees, while its only original cohomology is `H¹=Λ/(X)`. The supplied control and the adapter both retain the additional degree-zero O from Tor.
- A local specialization map `0→O[0]` has error `O[0]`; even with ambient base change it prevents the Selmer comparison from being an equivalence. Equal local `H¹` images do not remove this degree-zero error.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (`arithmeticSelmerComplex.control`, quotient-tower specialization); IntegralIwasawaTheory §10.3 (*Finite-layer descent with every Tor term*, cyclotomic towers of finite abelian extensions); IntegralIwasawaTheory §10.0 (Tor spectral sequence of `derivedArithmeticTower`); §3.8 (Iwasawa Selmer complex and completed action); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); PadicMeasuresIwasawaAlgebras §5.1.

### 3.11 Classical restriction control with invariants and localization errors

Put `H_n=H¹(G_(F_n,S),A), H∞=H¹(G_(F∞,S),A)`, and `Q_n=⊕H¹(F_n,w,A)/L_n,w`. Inflation–restriction gives `ker(H_n→H∞^Γ_n)=H¹(Γ_n,A^G_(F∞,S))`; its cokernel is the appropriate subgroup of `H²(Γ_n,A^G_(F∞,S))`. Compute local restriction by the same sequence for `Γ_n,w` and by the maps of inertia quotients. Let `I_n=im(H_n→Q_n)` and `I∞,n=im(H∞^Γ_n→Q∞^Γ_n)`. Snake on `0→Sel→H→I→0` gives `0→ker SelRes→ker` HRes`→ker(I_n→I∞,n)→coker SelRes→coker` HRes`→coker(I_n→I∞,n)→0`. Identify `I`-errors through the Q-errors and localization cokernels `C=Q/I`. Only when localization is onto at both levels may `I` be replaced by `Q`. Thus the control criterion is vanishing or boundedness of these explicitly computed invariant, inertia and C-errors. The bottom short exact row uses `I∞,n`; it is generally smaller than `(im(H∞→Q∞))^Γ_n`. Its comparison with that larger group has the `H¹(Γ_n,Sel∞)` error.

`A` is discrete p-primary; local conditions are restriction-compatible; use invariants of the exact infinite-level sequence, including `H¹(Γ_n,Sel∞)` when comparing its image with `I∞^Γ_n`. The superscript invariants does not preserve right exactness.

Prove this as follows. Apply the five-term sequences of ArithmeticGaloisDuality §R02.2.2 globally and locally, including the decomposition subgroup and inertia maps. Use the actual image of the localization map and take invariants with their derived terms; construct the commuting short exact rows. Apply the snake lemma to those rows. Compare `I` with `Q` by their cokernel sequences; retain `H¹` of the `Γ`-invariants functor and localization failures.

(Nekovář, §§8.10.1–8.10.5, pp. 249–251; Rubin (1999 draft), Appendix B §3, pp. 153–155.)

**Checks.**

- `A^G∞=0` kills the global five-term kernel but does not by itself kill every local-condition error.
- If `H=0` and `Q≠0`, localization is not onto and replacing `I` by `Q` in the snake sequence is invalid.
- A trivial ordinary quotient at `p` can have a nonzero unramified control term even when generic specialization is exact.

*Needs:* §2.4 (Functoriality of Selmer modules); §2.23 (Primitive, imprimitive and strict condition-change triangles); ArithmeticGaloisDuality §R02.2.2 (*The five-term sequence and the transgression*); §3.10 (Derived specialization and control spectral sequence).

### 3.12 Iwasawa duality with the involution and local errors

For number-field lattices, transport NoncommutativeAndEquivariantIwasawa §F.4's `arithmeticSelmerComplex.duality` through §3.8, preserving its involution and local errors. For the broader perfect coefficient duals `T` and `T^*(1)`, extend this comparison using the duality of ArithmeticGaloisDuality §D7.7.4 to induced coefficients on the modified arithmetic local diagram, with local complements computed on that diagram. For `Γ≅ℤ_p^d` and the regular local ring `Λ=O[[Γ]]`, use coefficient duality with `Λ` placed in degree zero and obtain `RΓ_f`,Iw`(T)→RHom_Λ`(`RΓ_f`,Iw`(T^*(1)),Λ`)`^ι[−3]`, where `ι(γ)=γ^−1`. Its cone is the sum of the induced local complement errors. With elementary coefficient complements at `p` and the precise unramified conditions elsewhere, calculate which errors vanish and which survive (including Tamagawa terms); derived duality is an equivalence only after those errors vanish. This is compatible with finite-level specialization, global degree-three duality and local degree-two pairings.

Perfectness/dualizing coefficient hypotheses of Nekovář §8.9 and the duality of ArithmeticGaloisDuality §D7.5 (*Derived Poitou–Tate duality*); tower condition `(U)`; condition `(P): p` odd or `F` has no real places. The `p=2` real-place version uses ArithmeticGaloisDuality §D7.5 (*Duality when `p = 2` and `K` has real places*), the modified compact-support construction in the unbounded derived category; no bounded integral amplitude is claimed. A height-one disappearance of an error is weaker than its integral acyclicity. Here the compact dual `T^*(1)` means `Hom_O(T,O)(1)`; it is distinct from Rubin’s discrete `T^*=Hom_O(T,E/O)(1)`. `Λ` is the degree-zero coefficient dualizing module in this normalization; using an absolute dualizing complex shifted by `dim Λ` requires the compensating shift. The displayed shift is the arithmetic degree-three normalization.

Prove this as follows. Identify compact and discrete tower duals using Shapiro and the Pontryagin involution. Apply the parametric global-fibre duality to the induced coefficients. Compute the elementary ordinary complements and the unramified local adjoint cones; retain the nonacyclic cones and apply derived control to specialize.

(Nekovář, §8.5.6, p. 220; §§8.9.6–8.9.7, pp. 240–244.)

**Checks.**

- A `γ`-eigencharacter `c` is paired with `c^−1`, rather than `c`.
- A nontrivial local Tamagawa error prevents an integral quasi-isomorphism.
- For `d ≥ 1`, a finite `Λ=O[[ℤ_p^d]]`-error has support of codimension at least two and disappears at every height-one prime, but must remain in the integral triangle.
- For the trivial tower `d=0`, `Λ=O` and `(O/λ)_(λ)=O/λ≠0`; this finite error contributes the characteristic factor `(λ)`.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.4 (`arithmeticSelmerComplex.duality`); IntegralIwasawaTheory §2.0 (`arithmeticCompactDuality` on the common coefficient domain); ArithmeticGaloisDuality §D7.7.4 (Duality for a global mapping fibre with local conditions); §3.8 (Iwasawa Selmer complex and completed action); §2.10 (Pontryagin duals with the contragredient action); PadicMeasuresIwasawaAlgebras §5.1.

### 3.13 Finite generation, amplitude and local Euler ranks

For the cyclotomic `ℤ_p`-extension, `p` odd, finite `S` and finite free `T`, global Iwasawa cohomology is finitely generated over `Λ` and concentrated in degrees one and two under the standard global `H⁰`-vanishing hypothesis. The amplitude statement for `p=2` with real places requires modified compact-support cochains and is outside these hypotheses. Its rank difference is `rank_Λ H¹_Iw−rank_Λ H²_Iw=Σ_(v real) rank_O T^(c_v=−1)+Σ_(v complex) rank_O T`. At a p-adic place `K, rank_Λ H¹_Iw(K,T)=[K:ℚ_p]rank_O T` and `H²_Iw(K,T)` is torsion. Global `H²` torsion is an additional weak-Leopoldt assertion. For arbitrary `ℤ_p^d` extensions the conclusion is finite generation/perfectness only with the finite-resolution statements of ArithmeticGaloisDuality §D7.3 (*Cohomological finiteness and perfect amplitude*) and the local conditions, not a universal cyclotomic rank formula.

Canonical compact cochains; `p` odd for the displayed cyclotomic rank formulas. The `p=2` real-place comparison uses ArithmeticGaloisDuality D7.5 and does not give the same bounded integral amplitude.

Prove this as follows. Use induced coefficients, finite mod-`λ` cohomology and compact Nakayama for finite generation. Use the cohomological-dimension statements of ArithmeticGaloisDuality §R02.4.4 (*Cohomological dimension of `G_{K,S}`*) and the `H⁰` statements of §3.1 to establish the amplitude actually available. Apply global and local Euler characteristics after passage to finite levels and normalize by tower degree. Retain the global `H²` rank rather than asserting its vanishing.

(Kato, §12.2, formulas (12.2.1)–(12.2.3), p. 220; §13.8, pp. 227–229. The displayed general-number-field rank formula uses ArithmeticGaloisDuality §R02.4.4 (*Tate's global Euler characteristic formula*).)

*Needs:* §3.2 (Shapiro's lemma for Iwasawa cohomology); ArithmeticGaloisDuality §R02.4.4 (*Finiteness of Galois cohomology with restricted ramification*); ArithmeticGaloisDuality §D7.5 (*Euler–Poincaré characteristic with compact support*); §3.0 (Iwasawa algebras of `ℤ_p^d × Δ`).

### 3.14 Determinant line and its height-one characteristic divisor

For a perfect `Λ`-Selmer complex `C`, define its arithmetic determinant line `𝔇(C)=(det_Λ C)⁻¹` using the determinant functor of PadicMeasuresIwasawaAlgebras §5.1. If `C⊗Frac(Λ)` is acyclic, the canonical fraction-field trivialization identifies `𝔇(C)` with a fractional invertible lattice whose height-one valuation is `Σ_i(−1)^i length_(Λ_𝔭) H^i(C)_𝔭`. Thus for cohomology only in degrees one and two its divisor is `char H²/char H¹`. The inverse determinant is essential for this sign convention. If generic cohomology has positive rank, determinant is a line without a canonical scalar trivialization; a regulator/leading-term trivialization is separate input. Base change and duality induce the determinant comparisons only for the corresponding perfect derived complexes.

`Λ` Noetherian normal domain, `C` perfect, torsion cohomology for the scalar divisor statement. For nonregular multi-variable coefficients request the precise perfectness rather than infer it from finite generation.

The construction proceeds as follows. Import the determinant functor, exact-triangle multiplicativity and fraction-field trivialization from PadicMeasuresIwasawaAlgebras §5.1. Localize at a height-one DVR and compute the determinant of a two-term free resolution of each torsion cohomology module. Multiply with the cohomological signs and transport through specialization/duality. Record local-error determinants as factors in these comparisons.

(Nekovář, §8.9, pp. 238–244; §8.10, pp. 249–251; Kato, §12.2, pp. 220–221.)

The library targets include the following operations and identities:

- The arithmetic line `(det_Λ C)⁻¹` of a perfect Selmer complex, with the stated cohomological sign.
- Exact triangles give multiplicative line equivalences.
- The signed height-one cohomology lengths give the divisor.
- Derived base change gives the corresponding line equivalence.

**Checks.**

- An acyclic perfect complex has the unit line and zero divisor.
- For `H¹=Λ/(a), H²=Λ/(b)`, the divisor is `(b)/(a)`, so reversing the cohomological sign fails.
- A free nonzero `H¹` prevents a canonical torsion scalar trivialization.

*Needs:* §3.8 (Iwasawa Selmer complex and completed action); PadicMeasuresIwasawaAlgebras §5.1; PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals).

### 3.15 Étale cohomology of `Spec 𝒪_{F,S}`, the comparison with `G_{F,S}`, and `j_*`

Throughout this subsection `F` is a number field, `S` a finite set of places of `F` containing the archimedean places and the places above `p, U = Spec 𝒪_{F,S}` the spectrum of the ring of S-integers (so `p` is invertible on `U`), `F_S ⊆ F^s` the maximal extension unramified outside `S` and `G_{F,S} = Gal(F_S/F)` (ArithmeticGaloisDuality §R02.3.1). Étale cohomology is sheaf cohomology on the small étale site of SchemeAndStackFoundations Layer 2. The subsection supplies the étale description of the Galois cohomology used in Kato's `j_*` convention: an all-degree comparison for `U` itself, the derived lattice version, and a degree-one statement for the direct image along `U ⊂ Spec 𝒪_F[1/p]`. On the number-field lattice domain the comparison maps for `U` are those of NoncommutativeAndEquivariantIwasawa §F.4; this subsection adds the finite-coefficient form with its real-place behaviour in high degree, the Milnor-sequence compatibilities, and the `j_*` statements, which that supplier does not provide.

**Finite étale covers and locally constant sheaves on `U`.** Prove that sending a finite separable extension `L/F` inside `F_S` to the integral closure `Spec 𝒪_{L,S}` of `𝒪_{F,S}` in `L` extends to an equivalence between finite étale U-schemes and finite discrete `G_{F,S}`-sets; correspondingly, taking the stalk at the geometric generic point is an equivalence between locally constant constructible abelian sheaves of finite order on `U_ét` and finite discrete `G_{F,S}`-modules. Write `M_U` for the sheaf attached to `M`. Hypotheses: `S` as above; no condition on `p` is needed for the covers, and the sheaf statement is used only for modules of order invertible on `U`.

Prove this as follows. A finite étale `𝒪_{F,S}`-algebra is a finite product of normal domains, each the integral closure `𝒪_{L,S}` of `𝒪_{F,S}` in a finite separable `L/F`; `𝒪_{L,S}` is étale over `𝒪_{F,S}` exactly when every finite place of `F` outside `S` is unramified in `L` (Mathlib `Algebra.IsUnramifiedAt`, `Algebra.FormallyEtale`), that is when `L ⊆ F_S` (ArithmeticGaloisDuality §R02.3.1, the membership criterion for `RestrictedRamification.maxUnramifiedOutside`). Morphisms of covers are F-embeddings of the generic fibres, which are `G_{F,S}`-equivariant maps of the finite sets of embeddings into `F_S`. A locally constant sheaf of finite order becomes constant on a finite étale cover, so it is determined by its generic stalk with the action of `G_{F,S}` (SchemeAndStackFoundations §2.15, `etale_galois_comparison` at the generic point, and SchemeAndStackFoundations §1.1 for descent along the cover).

(Milne, *Arithmetic Duality Theorems*, Chapter II, §2, paragraph before Proposition 2.9, printed p. 170 (PDF p. 178).)

**Checks.**

- `U = Spec ℤ[1/2]`: the cover `Spec ℤ[1/2, i]` is étale, since the discriminant of `ℤ[i]` is `−4`, and corresponds to `ℚ(i) ⊆ ℚ_{{2,∞}}`.
- `U = Spec ℤ[1/2]: Spec ℤ[1/2, √3]` is not étale over `U`, since 3 ramifies in `ℚ(√3)`; correspondingly `ℚ(√3) ⊄ ℚ_{{2,∞}}`. Replacing "finite étale" by "finite flat" would admit it.
- For `p` invertible on `U, μ_p` is locally constant on `U` and corresponds to `μ_p(F^s)` with the cyclotomic action; the constant sheaf `ℤ/p` corresponds to the trivial module, and the two agree on `U_L` once `μ_p ⊆ L`.

**The étale cohomology of `G_m` on `U`.** Prove: `H⁰(U, G_m) = 𝒪_{F,S}^×, H¹(U, G_m) = Pic(𝒪_{F,S})`, the sequence

```text
0 → H²(U, G_m) → ⊕_{v∈S} Br(F_v) --Σ inv_v--> ℚ/ℤ → H³(U, G_m) → 0
```

is exact (with `Br(ℝ) = ½ℤ/ℤ` and `Br(ℂ) = 0`), and `H^r(U, G_m) ≅ ⊕_{v real} H^r(F_v, G_m)` for `r ≥ 4`. Because `S` contains a finite place, `Σ inv_v` is onto, `H³(U, G_m) = 0`, and for `r ≥ 3` the group `H^r(U, G_m)` is `⊕_{v real} Ĥ⁰(ℝ, ℂ^×) ≅ (ℤ/2)^{r₁}` for `r` even and `0` for `r` odd. In particular `H^r(U_L, G_m) = 0` for `r ≥ 3` when `L` is totally imaginary. Hypotheses: as at the head of the subsection.

Prove this as follows. Let `g : Spec F → U` be the generic point. Its higher direct images `R^s g_* G_m` vanish for `s > 0`: the stalk at a geometric point over a closed point `v` is `H^s` of the fraction field of the strict henselisation, whose Brauer group and higher cohomology vanish because it is a `C₁` field (Milne, Chapter II, Lemmas 1.3–1.4). The Leray spectral sequence for `g` (SchemeAndStackFoundations §2.2) therefore identifies `H^r(U, g_*G_m)` with `H^r(F, G_m)`. Take the cohomology of the divisor sequence `0 → G_m → g_*G_m → ⊕_{v∈U} i_{v*}ℤ → 0`, using `H^r(k(v), ℤ) = ℤ, 0, ℚ/ℤ, 0, …` for the finite residue fields and SchemeAndStackFoundations §2.11 (`hilbert90`) for `H¹`. Compare with the Brauer–Hasse–Noether sequence `0 → Br F → ⊕_{all v} Br F_v → ℚ/ℤ → 0` (TauCetiRoadmap.ClassFieldTheory, global Brauer group, as consumed by ArithmeticGaloisDuality §R02.4.4) by the kernel–cokernel sequence, and use `H^r(F, G_m) ≅ ⊕_{v real} H^r(F_v, G_m)` for `r ≥ 3` (ArithmeticGaloisDuality §R02.4.4, *High-degree cohomology of the S-units*, with `S` the set of all places).

(Milne, *Arithmetic Duality Theorems*, Chapter II, §1, Lemmas 1.3–1.4, printed p. 150; §2, Proposition 2.1 and Remark 2.2(a), printed pp. 163–165 (PDF pp. 171–173).)

**Checks.**

- `F = ℚ, S = {p, ∞}: Pic(ℤ[1/p]) = 0`, and `H²(U, G_m)` is the kernel of `Br(ℚ_p) ⊕ Br(ℝ) → ℚ/ℤ`, which is `ℤ/2`, generated by the quaternion algebra ramified exactly at `p` and `∞`. Omitting the real place would give `0`.
- `F` totally imaginary: `H^r(U, G_m) = 0` for every `r ≥ 3`.
- `F = ℚ, r = 4: H⁴(U, G_m) ≅ Ĥ⁰(ℝ, ℂ^×) = ℝ^×/ℝ_{>0} ≅ ℤ/2`, so a real place contributes in every even degree at least 4; a vanishing statement above degree 3 is false over `ℚ`.

**The `K(π,1)` comparison for p-primary coefficients.** Prove that for every finite discrete `G_{F,S}`-module `M` of p-power order the edge maps

```text
H^r(G_{F,S}, M) → H^r(U_ét, M_U),   r ≥ 0,
```

of the Hochschild–Serre spectral sequence of the pro-Galois covering `Ũ = Spec 𝒪_{F_S,S} → U` are isomorphisms, natural in `M`, compatible with connecting maps, with restriction to finite extensions inside `F_S` and with corestriction. The comparison is for the ordinary cohomology of `U` in all degrees and needs no modification at real places: when `p = 2` and `F` has real places, for `r ≥ 3` both sides are identified with the real-place Tate cohomology `⊕_{v real} Ĥ^r(F_v, M)`, which can be nonzero in every such degree (for `M = ℤ/2` it is `(ℤ/2)^{r₁}`), and the maps identify them. The Tate-modified real-place terms enter only compact-support cohomology (ArithmeticGaloisDuality §D7.5, *Duality when `p = 2` and `K` has real places*).

Prove this as follows. The Hochschild–Serre spectral sequence of the covering (SchemeAndStackFoundations §2.15, `hochschildSerre_galois_covering`, profinite form) reduces the claim to `H^s(Ũ, ℤ/p) = 0` for `s ≥ 1`, since `M_U` becomes constant on Ũ and has a composition series with quotients `ℤ/p`. By `etale_cohomology_limits` (SchemeAndStackFoundations §2.15), `H^s(Ũ, ℤ/p) = colim_L H^s(U_L, ℤ/p)` over finite `L ⊆ F_S`, with `U_L = Spec 𝒪_{L,S}`; enlarging `L` inside `F_S`, assume `μ_p ⊆ L` and `L` totally imaginary: for odd `p` adjoin `μ_p`, which already makes `L` totally imaginary and is unramified outside `p`; for `p = 2` adjoin `√−1`, whose ramification is dyadic and hence lies in `S`, so `ℤ/p ≅ μ_p` on `U_L`. For `s = 1` every class is killed by the corresponding cover, which lies in `F_S` by the cover equivalence above. For `s = 2` the Kummer sequence on `U_L` (SchemeAndStackFoundations §2.11, `fppf_kummer_sequence`, étale since `p` is invertible) gives `0 → Pic(U_L)/p → H²(U_L, μ_p) → Br(U_L)[p] → 0`. The Picard term dies in the colimit because `lim_L Pic(𝒪_{L,S}) = 0` over finite `L ⊆ F_S` (ArithmeticGaloisDuality §R02.3.3, *The S-idele classes as a quotient of the idele classes*, through the principal ideal theorem). By the `G_m` calculation, `Br(U_L)[p]` embeds in `⊕_{w∈S_L} Br(L_w)[p]`, and a class dies over any `L′ ⊆ F_S` whose local degree at every `w ∈ S_L` is divisible by `p`; such `L′` is obtained from the Hilbert class field `H` of `L` by adjoining p-th roots of generators of the primes in `S_L`, which become principal in `H`, and this extension is unramified outside `S`. For `s ≥ 3` the `G_m` calculation for totally imaginary `L` and the Kummer sequence give `H^s(U_L, μ_p) = 0`.

(Milne, *Arithmetic Duality Theorems*, Chapter II, §2, Proposition 2.9 and its proof, printed pp. 170–172 (PDF pp. 178–180).)

**Checks.**

- `F = ℚ, p = 3, S = {3, ∞}: ℚ(μ₃)` is an allowed totally imaginary extension, whereas `ℚ(i)` ramifies at `2` and is not contained in `F_S`. For `p = 2` the extension `ℚ(i)` is allowed.
- `F = ℚ, p` odd, `S = {p, ∞}, M = μ_p`: in degree one both sides are `ℤ[1/p]^×/p ≅ ℤ/p`, generated by the class of `p`; `−1` is a p-th power and `Pic(ℤ[1/p]) = 0`.
- `p = 2, F = ℚ, S = {2, ∞}, M = ℤ/2, r = 3: H³(G_{ℚ,S}, ℤ/2) ≅ Ĥ³(ℝ, ℤ/2) ≅ ℤ/2` (ArithmeticGaloisDuality §R02.4.4, *Cohomological dimension of `G_{K,S}`*), and `H³(Spec ℤ[1/2], ℤ/2) ≅ ℤ/2` as well; truncating either side above degree two is not part of the comparison.
- Replacing `G_{F,S}` by `G_F` fails already in degree one: `H¹(G_ℚ, ℤ/p)` is infinite (one line for each cyclic degree-p extension of `ℚ`, ramified anywhere), while `H¹(Spec ℤ[1/p], ℤ/p)` is finite.
- `p = 2, F = ℚ, S = {2, ∞}, M = 𝔽₂[Gal(ℚ(i)/ℚ)]` inflated to `G_{ℚ,S}`: complex conjugation acts on `M` as on the regular `𝔽₂[C₂]`-module, whose Tate cohomology vanishes, so both sides are zero in every degree `r ≥ 3`. High-degree nonvanishing depends on `M`.

**Continuous étale cohomology of lattices.** Let `O` be the ring of integers of a finite extension `E/ℚ_p` with uniformizer `λ, T` a finite free O-module with continuous `G_{F,S}`-action and `T_n = T/λ^nT`. Define the continuous étale cohomology `H^r_cont(U, T)` as Jannsen's `H^r(U, (T_{n,U})_n)`, the derived functors of `(F_n) ↦ lim_n Γ(U, F_n)` on inverse systems of sheaves. Prove that the comparison maps give isomorphisms `H^r(G_{F,S}, T) ≅ H^r_cont(U, T)` for all `r ≥ 0` with the continuous-cochain cohomology of ArithmeticGaloisDuality Layer R02.1, compatible with the two Milnor sequences `0 → lim¹ H^{r−1}(−, T_n) → H^r(−, T) → lim H^r(−, T_n) → 0`, with the long exact sequences of `0 → T → T → T/λ → 0`, and, after inverting `p`, with the rational comparison for `V = T[1/p]`. For finite `S` as here, also prove the natural simplification `H^r_cont(U, T) ≅ lim_n H^r(U, T_n)`: the finite-coefficient comparison and ArithmeticGaloisDuality §R02.4.4 make every finite-level group finite, so the systems are Mittag–Leffler and `lim¹` vanishes. A short exact sequence of lattices with lattice quotient reduces exactly modulo `λ^n`; its finite cohomology groups and image systems are Mittag–Leffler, so the ordinary limits also form the long exact sequence. The derived definition applies to general coefficient systems, where this simplification requires its own Mittag–Leffler hypotheses.

Prove this as follows. Jannsen's spectral sequence for the Galois covering `Ũ → U, H^a(G_{F,S}, (H^b(Ũ, T_n))_n) ⇒ H^{a+b}(U, (T_n))`, has vanishing rows `b > 0` by the `K(π,1)` comparison (each `H^b(Ũ, T_n)` vanishes). Its bottom row is the continuous cohomology of the inverse system `(T_n)`, which is the continuous-cochain cohomology of `T = lim T_n` because the transition maps are onto (Jannsen, Theorem 2.2; PerfectoidTowers §P9.0, *Continuous cochains into an inverse limit*, and DerivedModuleAlgebra §1.T.1, *The Milnor sequence for towers of complexes*). Naturality of the edge maps gives the compatibility with the Milnor sequences. Apply restricted-ramification finiteness (ArithmeticGaloisDuality §R02.4.4) and the finite-coefficient comparison to kill `lim¹` in the finite-S case. For the lattice long exact sequence, pass through the finite image systems using exactness of limits of Mittag–Leffler systems (Stacks, tag 0598).

(Jannsen, *Continuous étale cohomology*, §2, (2.1), Theorem 2.2 and Remark 2.3, pp. 215–216; §3, (3.1)–(3.3), pp. 216–217; Milne, *Arithmetic Duality Theorems*, Chapter I, Corollary 4.15, p. 62; Stacks, tags 07KW and 0598.)

**Checks.**

- `F = ℚ, p` odd, `S = {p, ∞}, T = ℤ_p(1): H¹_cont(Spec ℤ[1/p], ℤ_p(1)) = lim ℤ[1/p]^×/p^n ≅ ℤ_p`, generated by `p`, on both sides; the `lim¹` term vanishes because the finite levels are finite.
- Rationalising, `H¹_cont(Spec ℤ[1/p], ℚ_p(1))` is one-dimensional, matching ArithmeticGaloisDuality §D7.6's check for `H¹(G_{ℚ,S}, ℚ_p(1))`.
- For `0 → T′ → T → T`″ `→ 0` with all three terms lattices and `S` finite, reduction modulo `λ^n` is exact and the finite cohomology image systems are Mittag–Leffler. The identifications with ordinary limits carry the derived long exact sequence to a long exact sequence of `lim H^r(U, −/λ^n)`.
- Outside the lattice-quotient systems, take constant étale sheaves on `Spec ℂ` in the towers `0 → p^nℤ → ℤ → ℤ/p^n → 0`, with inclusions, identity maps and reductions as transitions. The ordinary `H⁰` limits give `0 → 0 → ℤ → ℤ_p`, which is not onto; every finite-level `H¹` is zero. Jannsen's `H¹` of the system `(p^nℤ)` is `lim¹ p^nℤ ≅ ℤ_p/ℤ ≠ 0`, providing the missing connecting term (DerivedModuleAlgebra §1.T.1).

**Stalks of `j_*` and `R^q j_*`, and the degree-one Leray sequence.** Let `X = Spec 𝒪_F[1/p], Σ a` finite set of finite places of `F` not above `p`, and `j : U = X ∖ Σ → X`, so `U = Spec 𝒪_{F,S}` with `S = {v | p∞} ∪ Σ`. For a finite p-primary `G_{F,S}`-module `M`, prove that at a geometric point over `v ∈ Σ, (j_*M_U)_{v̄} ≅ M^{I_v}` and `(R^q j_*M_U)_{v̄} ≅ H^q(I_v, M)`, equivariantly for `Gal(k(v)^s/k(v))` acting through arithmetic Frobenius, and `R^q j_*M_U = 0` for `q ≥ 2` because the inertia group `I_v (v ∤ p)` has p-cohomological dimension one. Prove that the Leray spectral sequence of `j` gives the exact sequence

```text
0 → H¹(X, j_*M_U) → H¹(U, M_U) → ⊕_{v∈Σ} H¹(I_v, M)^{Fr_v=1},
```

so, through the `K(π,1)` comparison for `U, H¹(X, j_*M_U)` is the subgroup of `H¹(G_{F,S}, M)` of classes unramified at every `v ∈ Σ`: the Galois Selmer module of §2.9 with relaxed conditions at the places above `p` and `∞` and unramified conditions at `Σ`. Thus `j_*` imposes no finite condition at `p`. For a lattice `T` the same holds for Jannsen's continuous groups, by the limit argument above; the `lim¹` of the finite groups `H⁰` vanishes. In degree two the Leray terms `H¹(X, R¹j_*M_U)` remain, so no identification of `RΓ(X, j_*M_U)` with a Selmer complex in all degrees is asserted.

Prove this as follows. Higher direct images are sheafifications of `V ↦ H^q(V ×_X U, −)` (SchemeAndStackFoundations §2.1, `higherDirectImage_iso_sheafify`); at `v̄` the colimit over étale neighbourhoods is the cohomology of the fraction field of the strict henselisation of `𝒪_{X,v}` (SchemeAndStackFoundations §2.15, `etale_cohomology_limits`), whose absolute Galois group is `I_v` (`etale_galois_comparison`). The vanishing for `q ≥ 2` is `cd_p(I_v) = 1` (the tame quotient of `I_v` is `∏_{ℓ≠char k(v)} ℤ_ℓ(1)`, TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 11). The displayed sequence is the five-term sequence of the Leray spectral sequence (SchemeAndStackFoundations §2.2), with `H⁰(X, R¹j_*M_U) = ⊕_{v∈Σ} H⁰(k(v), H¹(I_v, M))`.

(Milne, *Arithmetic Duality Theorems*, Chapter II, §1, proof of Proposition 1.1(a) and Lemma 1.4, printed pp. 149–150 (PDF pp. 157–158); Kato, §8.2, pp. 180–181, for the `j_*` convention.)

**Checks.**

- `M = ℤ/p` trivial and `q_v ≢ 1 (mod p)` for every `v ∈ Σ`: each `H¹(I_v, ℤ/p)^{Fr_v=1} = (ℤ/p(−1))^{Fr_v=1}` is zero, so all unramified conditions at `Σ` are automatic and `H¹(X, j_*ℤ/p) = H¹(U, ℤ/p)`.
- `F = ℚ, p = 3, Σ = {2, 7}, M = 𝔽₃, X = Spec ℤ[1/3], U = Spec ℤ[1/42]`: the singular term at `2` vanishes, but the cyclic cubic subfield of `ℚ(ζ₇)` gives a class ramified at 7 in `H¹(U, 𝔽₃)` outside `H¹(X, j_*𝔽₃)`. Vanishing at one removed place does not give the equality.
- `F = ℚ, Σ = {ℓ}` with `ℓ ≡ 1 (mod p)`: the degree-p subfield of `ℚ(μ_ℓ)` gives a class of `H¹(U, ℤ/p)` that is ramified at `ℓ`, so it does not lie in `H¹(X, j_*ℤ/p)`.
- `R¹j_*ℤ/p ≠ 0` at such `ℓ`, so the degree-two Leray term `H¹(X, R¹j_*ℤ/p)` can be nonzero; replacing `j_*` by `Rj_*` in all degrees would change `H²`.

**Universal norms and the tower limit in degree one.** In a cyclotomic tower `F_∞/F` whose decomposition group at every `v ∈ Σ` is infinite, prove that the inverse limit under corestriction of `H¹(X_n, j_*T) (X_n = Spec 𝒪_{F_n}[1/p])` identifies with `H¹_Iw(G_{F,S}, T)` of §3.1. Norm-compatible classes have zero singular localisation at `Σ` by §3.5, so the finite-level injections of the previous target identify the two inverse limits. The assertion is in degree one only.

(Kato, §8.2 and §8.5, pp. 180–184, and §12.2, pp. 220–221, for the convention; Rubin (1999 draft), Appendix B, Proposition 3.3 and Corollaries 3.4–3.5, printed pp. 154–155 (PDF pp. 164–165).)

**Checks.**

- For the trivial tower `F_n = ℚ` with identity transitions, `p = 3, Σ =` {7} and `T = ℤ₃(1)`, all decomposition groups are finite, outside the theorem's hypotheses. The Leray injection is `ℤ₃ → ℤ₃²: H¹_cont(Spec ℤ[1/3], j_*T)` is generated by 3, whereas `H¹_cont(Spec ℤ[1/21], T)` is generated by 3 and 7. The class of 7 is norm-compatible but ramified at 7, so the unramified subgroup is proper.
- If the decomposition group of some `v ∈ Σ` in `F_∞/F` is finite, a norm-compatible class can be ramified at `v`, so `v` must be kept in `S` and the identification is with the limit of `H¹(U_n, T)` instead.
- In an infinite p-power tower, `lim_{cor} H⁰` vanishes on both sides (§3.1). For the trivial tower and the trivial lattice `ℤ_p` with identity transitions, this limit is `ℤ_p`; the infinite-tower hypothesis cannot be dropped from degree-zero vanishing either.
- For `K/ℚ_ℓ` finite, `ℓ ≠ p`, its unramified degree-`p^n` extensions `K_n` and trivial
  `T = ℤ_p`, Frobenius evaluation gives `H¹_ur(K_n, T) ≅ ℤ_p`. Restriction is multiplication
  by `p`, so the module colimit is `ℚ_p` via `[a,n] ↦ p^(−n)a`; for `V = ℚ_p` it is also
  `ℚ_p`. These nonzero restriction colimits are distinct from the corestriction limits above.

*Needs:* §2.9 (Compact and rational Galois Selmer groups); §3.1 (Iwasawa cohomology); §3.5 (Universal norms are unramified away from `p`); DerivedModuleAlgebra §1.T.1 (*The Milnor sequence for towers of complexes*; *Mittag-Leffler towers have vanishing `lim¹`*; *The six-term sequence of `lim` and `lim¹`*); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); ArithmeticGaloisDuality §R02.3.1 (*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*); ArithmeticGaloisDuality §R02.3.3 (*The S-idele classes as a quotient of the idele classes*); ArithmeticGaloisDuality §R02.4.4 (*Finiteness of Galois cohomology with restricted ramification*; *Cohomological dimension of `G_{K,S}`*; *High-degree cohomology of the S-units*); SchemeAndStackFoundations §§1.1, 2.1, 2.2, 2.11, 2.15; TauCetiRoadmap.ClassFieldTheory (global Brauer group); TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 11; Mathlib `Algebra.IsUnramifiedAt`, `Algebra.FormallyEtale`; NoncommutativeAndEquivariantIwasawa §F.4 (cochain/étale comparison).

### 3.16 Lattice independence, twists and degree-one specialization

The rationalized Iwasawa complex and its rational specializations depend only on `V`: finite lattice quotients disappear after inverting `p`. A Tate twist by `k` is semilinear for `Tw_k(γ)=χ_cyc(γ)^−kγ` on the `Λ` factor; specialization for `V(k)` is at the kernel of `γ↦χ_cyc(γ)^−k` with the convention of §3.7. For `Γ=ℤ_p`, the degree-one specialization sequence retains `H²_Iw[𝔮]`. If the specialized `H²` vanishes and the localized complex has amplitude `≤2`, derived control and Nakayama kill `H²_Iw,𝔮` and hence that `Tor` correction. The finite-level `H²` calculation itself retains `H³_Iw[𝔮]` until the amplitude theorem removes it.

Rational coefficients at specialization; a specified character convention; the vanishing assertion and amplitude are separate inputs.

Prove this as follows. Apply §2.24 and rationalization to finite quotient errors. Compute the induced coefficient action after twisting, yielding the stated automorphism and specialization prime. Apply §3.10 in degrees one and two. Use the amplitude hypothesis and Nakayama at `𝔮` for the asserted `H²` vanishing implication.

(Burungale–Tian (arXiv v2), Version 2, §2, p. 4; §3, pp. 5–6, equation (3.1).)

*Needs:* §2.24 (Lattice changes with global and local errors); §3.7 (Twisting Iwasawa cohomology); §3.10 (Derived specialization and control spectral sequence); §3.13 (Finite generation, amplitude and local Euler ranks).

### 3.17 Local cofreedom and an away-p Euler factor

In the CGLS anticyclotomic setting `K` imaginary quadratic, `p` odd split, `Γ≅ℤ_p` and `Λ=ℤ_p[[Γ]]`, let `M_θ=ℤ_p(θ)⊗Λ^∨` with action `θ⊗Ψ^−1`. At `w∤p` with finite-index decomposition subgroup, `H¹(K_w,M_θ)^∨` is torsion with characteristic ideal generated by `P_w(ℓ^−1γ_w), P_w(X)=det(1−Fr_w X|V_θ^I_w)`, using arithmetic Frobenius `γ_w`; its `μ`-invariant is zero. At `w|p, θ|G_w≠1,ω` implies `H⁰=H²=0`, restriction `H¹→H¹(I_w)^G_w/I_w` is an isomorphism, and `H¹` is `Λ`-cofree rank one. For an elliptic curve satisfying Lemma 1.3.1’s good-reduction and `E(K_w)[p]=0` hypotheses, the corresponding local `H¹` is cofree rank two. These are the stated cases, not every representation at every place.

CGLS §1.1’s finite character and anticyclotomic tower. The mod-p trivial and cyclotomic characters are explicitly excluded in the at-p character case. `θ` is the Teichmüller lift of a character `G_K→𝔽_pˣ` with conductor supported on split primes, as in CGLS §1.1. For the non-p formula `w` lies above a rational split prime `ℓ`; then Norm`(w)=ℓ` and its decomposition subgroup has finite index. The elliptic specialization uses `E/ℚ` with the stated good ordinary p-reduction.

Prove this as follows. Compute away-p inertia/residue cohomology and identify its dual presentation by `1−ℓ^−1γ_w Fr_w`. At `p` use local duality and the excluded characters to kill `H⁰,H²`; reduction gives a torsion-free free specialization. Apply Lemma 1.1.2’s compact Nakayama criterion `X[γ−1]=0` and free `X/(γ−1)` to obtain `Λ`-freeness. For the elliptic case apply Lemma 1.3.1.

(Castella–Grossi–Lee–Skinner (author preprint), §1.1, Lemmas 1.1.1–1.1.2 and Proposition 1.1.3, pp. 6–7; Lemma 1.3.1, p. 10.)

**Checks.**

- The trivial residual character can have `H⁰` and is excluded.
- The cyclotomic residual character can have dual `H⁰` and is excluded.
- Replacing arithmetic `γ_w` by its inverse without changing conventions changes the displayed Euler polynomial.

*Needs:* §3.6 (Semilocal cohomology and descent of local classes); ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*); PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals).

### 3.18 Checkable hypotheses for ordinary Selmer structure

For `Λ=O[[T]]`, let `D=T₀⊗_ΛΛ^∨` with `T₀` finite free. Then `T₀* = Hom(D,μ_(p∞))` is the compact Tate dual; Greenberg’s discrete `D`* is `T₀*⊗_ΛΛ^∨`. Record RFX (`T₀` reflexive), `LOC2_v` (`T₀`*/`H⁰(F_v,T₀*)` reflexive), `LOC1_η` (`H⁰(F_η,T₀*)=0` at one finite `η`), LEO (`ker`[`H²`(global,`D`)`→⊕H²`(local,`D`)] `Λ`-cotorsion), CRK `(corank H¹global=corank Sel+corank Q)`, and almost divisibility of the chosen local conditions (multiplication by each height-one parameter is onto except for finitely many height-one primes). Record additionally Greenberg’s alternative `(a), (b)` or (c): residual exclusion of `μ_p` as subquotient; cofree `D` with exclusion as quotient; or a finite `η` with dual `H⁰` zero and `Q_η` divisible/coreflexive as required by the theorem. These are explicit propositions on modules and maps, not inferred from residual irreducibility alone.

Finite `S`; `p` odd for the applications here; finitely generated compact duals. In dimension two with finite residue field, pseudo-null finitely generated modules have finite length and finite cardinality. Higher-dimensional pseudo-null is not synonymous with finite. The residual module in alternatives `(a),(b)` is `D[𝔪_Λ]` as a `G_(F,S)`-module, and `μ_p` has its mod-p cyclotomic action. In alternative `(c), η` is finite and `H⁰(F_η,T₀*)=0`; the localization-surjectivity theorem requires divisible `Q_η`, while the no-pseudo-null theorem requires coreflexive `Q_η`.

The construction proceeds as follows. Define every hypothesis using the actual localization maps, reflexive duals and height-one localizations. Translate almost divisibility of a discrete module into absence of nonzero pseudo-null submodules of its compact dual. Provide proof fields only for the hypotheses a concrete representation establishes; keep LEO and CRK separate.

(Greenberg (author preprint), §2, pp. 5–11; §4.1, pp. 19–20.)

The library targets include the following operations and identities:

- The listed module and localization predicates, with the chosen alternative.
- Equivalent to the compact dual having no nonzero pseudo-null submodule.
- Tracks exactly which LOC1 and local divisibility hypotheses are supplied by relaxing a finite place.

**Checks.**

- The zero representation satisfies the zero-rank, local and localization predicates.
- A residual irreducibility proof supplies the residual exclusion for rank at least two, but supplies neither LEO nor CRK.
- Over `O[[T₁,T₂]], Λ/(T₁,T₂)` is pseudo-null and can be infinite; the finite equivalence must be restricted to dimension two.

*Needs:* §2.10 (Pontryagin duals with the contragredient action); §2.11 (Coranks); PadicMeasuresIwasawaAlgebras §§4.1–4.2.

### 3.19 Surjectivity of global ordinary localization

Under Greenberg Proposition 2.6.3’s hypotheses `D Λ`-divisible, LEO, CRK and one of alternatives `(a), (b), (c)` of §3.18 (with `Q_η` divisible in (c)), the map `H¹(G_(F,S),D)→Q=⊕H¹(F_v,D)/L_v` is onto. Thus primitive/imprimitive change of conditions has the asserted right exact local-quotient map only under these hypotheses. For ordinary elliptic curves in the cyclotomic tower, `p` odd, good ordinary reduction, `E(F)[p]=0` and cotorsion Selmer imply the hypotheses by Greenberg §4.4’s local/Euler computation. For general ordinary representations these hypotheses are part of the statement.

The exact Proposition 2.6.3 alternative is part of the input. Residual irreducibility of rank at least two rules out a `μ_p` subquotient but does not replace LEO or CRK.

Prove this as follows. Apply Poitou–Tate and the localization corank equality to show its cokernel is cotorsion. Use LEO and the selected residual/local alternative to eliminate that cotorsion cokernel as in Greenberg Proposition 2.6.3. For the elliptic application compute the local quotient ranks, `H⁰` and Euler rank difference; cotorsion Selmer gives CRK and the stated weak-Leopoldt condition.

(Greenberg (author preprint), Proposition 2.6.3, p. 11; §4.4, pp. 24–25.)

**Checks.**

- A cotorsion localization cokernel alone need not vanish.
- After relaxing `Σ`, the surjective map gives `Sel^Σ/Sel≅⊕_(v∈Σ)Q_v`.
- An irreducible residual rank-one cyclotomic character contains `μ_p` and does not satisfy alternative (a).

*Needs:* §3.18 (Checkable hypotheses for ordinary Selmer structure); §2.19 (Poitou–Tate for Selmer groups); §3.13 (Finite generation, amplitude and local Euler ranks).

### 3.20 No pseudo-null submodule of the ordinary Selmer dual

Assume RFX, LEO, LOC2 at every place, LOC1 at one finite place, local-condition almost divisibility, CRK and one of Greenberg Proposition 4.1.1’s alternatives, using coreflexive `Q_η` in its third alternative. Then `Sel` is almost divisible, and `X=Sel^∨` has no nonzero pseudo-null `Λ`-submodule. For `Λ=O[[T]]` this means no nonzero finite submodule. Proposition 4.2.1 supplies the imprimitive version when the relaxed set contains a suitable finite LOC1 place. The cyclotomic ordinary elliptic case of Greenberg §4.4 follows under `p` odd, `E(F)[p]=0`, good ordinary p-reduction and cotorsion Selmer. CGLS Corollary 1.4.3 concerns its stated imprimitive anticyclotomic Selmer dual and is not a universal primitive assertion.

Finite generated `X`; retain all Greenberg local/global hypotheses and distinguish the primitive and imprimitive conditions.

Prove this as follows. Use the quotient diagram and almost divisibility of the local conditions to show that the Selmer kernel is almost divisible, with the selected alternative handling the exceptional cokernel. Dualize the height-one multiplication criterion to exclude every pseudo-null submodule. For the dimension-two cyclotomic algebra identify pseudo-null finite generated modules with finite modules. Verify the elliptic and stated imprimitive examples separately.

(Greenberg (author preprint), Propositions 4.1.1 and 4.2.1, pp. 19–21; §§4.3–4.4, pp. 21–25.)

**Checks.**

- The module `Λ/(λ,T)` is torsion but has a nonzero finite submodule; torsion does not suffice.
- The imprimitive theorem cannot be transferred to a primitive dual without controlling its local quotient.
- The stated elliptic cyclotomic hypotheses imply the no-finite-submodule conclusion.

*Needs:* §3.18 (Checkable hypotheses for ordinary Selmer structure); §3.19 (Surjectivity of global ordinary localization); PadicMeasuresIwasawaAlgebras §§4.1–4.2.

### 3.21 Fitting equals characteristic under the structure criterion

Let `Λ=O[[T]]` with `O` a complete DVR with finite residue field, `λ` its uniformizer, and `X` a finitely generated torsion `Λ`-module with no nonzero finite submodule. Then `depth_Λ X≥1` and `pd_Λ X≤1`. A finite free resolution `0→Λ^r→Λ^r→X→0` gives `Fitt_Λ X=(det A)=char_Λ X` as ideals. Apply this to the ordinary Selmer dual only after §3.20 and cotorsion establish the hypotheses. For modules with finite submodules or higher-dimensional `Λ`, equality is not asserted. This is the form in which main-conjecture and rank-zero arguments compare Fitting and characteristic ideals.

`Λ` regular local of dimension two; `X` finitely generated torsion. The zero module uses the unit ideal convention.

Prove this as follows. The maximal-ideal torsion submodule is finite; its absence gives a nonzerodivisor on `X` and `depth` at least one. Use the dimension-two Auslander–Buchsbaum formula to obtain a projective resolution of length at most one. Local free modules and rank zero give a square presentation. Invoke the quadratic presentations and initial Fitting ideals of PadicMeasuresIwasawaAlgebras §6.3 and the characteristic-ideal formulas of its §4.6; identify both with the determinant.

(Greenberg (author preprint), §1, pp. 1–4; Proposition 4.1.1, pp. 19–20 (arithmetic no-pseudo-null input).)

**Checks.**

- For `X=Λ/(f), f` nonzero, both ideals equal `(f)`.
- For `X=Λ/(λ,T), char X=Λ` but `Fitt X=(λ,T)`; the no-finite-submodule hypothesis is necessary.
- For `X=0`, both ideals are `Λ`.
- If `O=k[[λ]]` with `k` infinite, `X=Λ/(λ,T)=k` has no nonzero submodule of finite cardinality, yet `char X=Λ` and `Fitt X=(λ,T)`. This excludes dropping the finite-residue-field hypothesis while retaining the finite-cardinality condition. A finite-length formulation is the appropriate generalization.
- Over `O=𝔽_p[[λ]], p=0`, so `Λ/(p,T)=O` is not a finite-length counterexample. The uniformizer quotient `Λ/(λ,T)` is the required residue-field example.

*Needs:* §3.20 (No pseudo-null submodule of the ordinary Selmer dual); PadicMeasuresIwasawaAlgebras §6.3 (quadratic presentations); PadicMeasuresIwasawaAlgebras §6.3 (the initial Fitting ideal of a quadratic presentation); PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals); PadicMeasuresIwasawaAlgebras §§4.1–4.2.

### Examples

For `Λ=O[[X]]` and a two-term complex with multiplication `X` from degree one to degree two, `H¹=0` and `H²=Λ/(X)`. Derived augmentation makes the differential zero, so finite-level `H¹=O` comes from `H²[X]`, while the ordinary specialization of `H¹` is zero. This fixes the direction and degree of the control correction. With arithmetic determinant `det⁻¹`, the same complex has scalar lattice `(X)`, confirming the positive divisor of `H²`; moving the map to degrees zero and one gives `(X)⁻¹`.

At one cyclotomic group element `γ` with `χ(γ)=u, φ_k(γx)=u⁻ᵏγφ_k(x)`, because `γφ_k(x)=uᵏφ_k(γx)`. For `k=1, u=4` over `ℤ₃`, the scalar is `1/4` and not 4. Contragredient duality sends a character `u` to `u⁻¹`. For the zero torsion module the characteristic and zeroth Fitting ideals are both the unit ideal. Over `O[[X]]`, the residue-field module has characteristic ideal `(1)` and Fitting ideal `(λ,X)`; its finite submodule prevents the equality theorem from applying.

### Dependencies

Layers 0, `2` and ArithmeticGaloisDuality §D7.7.4, together with the supplier interfaces: Mathlib `Algebra.IsUnramifiedAt`, `Algebra.FormallyEtale`; Mathlib `MvPowerSeries`, `RingTheory.Sequence.IsRegular`; Tau Ceti `TauCeti.completedGroupAlgebra` (`lift`, `map`, `powerSeriesCoordinate`, the product decomposition); TauCetiRoadmap.ClassFieldTheory (global Brauer group); TauCetiRoadmap.LocalFieldsRamification Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 10; TauCetiRoadmap.ProfiniteCohomology Layer 11; TauCetiRoadmap.ProfiniteCohomology Layer 12; TauCetiRoadmap.ProfiniteCohomology Layer 6; TauCetiRoadmap.ProfiniteCohomology Layer 7; TauCetiRoadmap.ProfiniteProPGroups Layer 9; ArithmeticGaloisDuality §D7.5 (*Euler–Poincaré characteristic with compact support*); DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); DerivedModuleAlgebra §1.T.1 (*The Milnor sequence for towers of complexes*); PerfectoidTowers §P9.0 (*Comparison with the canonical carrier for compact coefficients*); PerfectoidTowers §P9.0 (*Continuous cochains into an inverse limit*); ArithmeticGaloisDuality §R02.1.2 (*Tate's inverse-limit theorem*); ArithmeticGaloisDuality §R02.2.1 (*The Hochschild–Serre spectral sequence*); DerivedModuleAlgebra §S.1 (*The spectral sequence of a first-quadrant double complex*); ArithmeticGaloisDuality §R02.2.2 (*The five-term sequence and the transgression*); ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*); ArithmeticGaloisDuality §R02.3.1 (*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*); ArithmeticGaloisDuality §R02.3.3 (*The S-idele classes as a quotient of the idele classes*); ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*); ArithmeticGaloisDuality §R02.4.4 (*Cohomological dimension of `G_{K,S}`*; *High-degree cohomology of the S-units*); ArithmeticGaloisDuality §R02.4.4 (*Finiteness of Galois cohomology with restricted ramification*); SchemeAndStackFoundations §§1.1, 2.1, 2.2, 2.11, 2.15; PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals); PadicMeasuresIwasawaAlgebras §5.1; PadicMeasuresIwasawaAlgebras §6.3 (quadratic presentations); PadicMeasuresIwasawaAlgebras §6.3 (the initial Fitting ideal of a quadratic presentation); PadicMeasuresIwasawaAlgebras §§1.7, 4.4, 6.1; PadicMeasuresIwasawaAlgebras §§4.1–4.2.

## Layer 4: Finite conditions and arithmetic applications

### 4.7 Small-weight crystalline realization and extension exactness

**Essential image of the small-weight realization.** Let `p>2`, `K/ℚ_p` finite unramified and `[a,b]` an interval of width `b−a≤p−2`. Consume from FiniteFlatGroupsAndIntegralPadicHodgeTheory the small-weight filtered Frobenius category over `W(k)=O_K` with filtration support `[a,b]` and its covariant realization `T_cov` (§R07.3.3a, which already translates the interval and records that support `[a,b]` has supplier Hodge–Tate interval `[−b,−a]`), the exactness, faithfulness and length preservation of §R07.3.10, the full faithfulness of §R07.3.11 on the translated safe interval, closure of its essential image under subquotients (§R07.3.12), the lattice functor and its rank (§R07.3.14), rational admissibility (§R07.3.16) and the lattice correspondence (§R07.3.17). This target identifies the essential image in this roadmap's sign convention: a finite `ℤ_p[G_K]`-module `R` is isomorphic to `T_cov(M)` for a torsion object `M` with support `[a,b]` if and only if `IsTorsionCrystalline(R,−b,−a)`; a finite free `ℤ_p`-lattice `R` with continuous action is isomorphic to `T_cov(M)` for a free object `M` with support `[a,b]` if and only if `IsIntegralCrystalline(R,−b,−a)`, and then `R[1/p]` is crystalline with local weights in `[a,b]` (weight of `ℚ_p(1)` equal to `−1`) and every `R/p^mR` is `T_cov(M/p^mM)`.

`p>2`, `K` unramified, width `≤p−2`; Nizioł's covariant normalization. Endpoint width `p−1` needs extra nilpotence or unipotence hypotheses and is outside this target. No second realization functor or period carrier is introduced: the period ring is the supplier's `ringS` (§R07.3.6) with the finite-level period objects of §R07.3.7.

Prove this as follows. For a torsion object `M`, lift an adapted generating family of its filtration steps to a free filtered module with the same support and lift the divided Frobenius maps to semilinear maps; the generation condition lifts by Nakayama, so `M` is the cokernel of an injection `M′→M″` of free objects with support `[a,b]`. Exactness and the lattice functor turn this into `T_cov(M)≅T_cov(M″)/T_cov(M′)`, two stable lattices in the crystalline representation `T_cov(M″)[1/p]` of §R07.3.16, which gives `IsTorsionCrystalline(T_cov(M),−b,−a)`. Conversely, if `R≅R″/R′` with stable lattices in a crystalline representation with local weights in `[a,b]`, translate the interval and apply §R07.3.17 to obtain strongly divisible lattices with `R″`, `R′` as covariant realizations; exactness identifies `R` with the realization of their quotient. For free `R`, the integral predicate says every `R/p^mR` lies in the torsion image; full faithfulness makes the resulting torsion objects and transition maps unique, their limit is a free object of the same rank by §R07.3.14, and §R07.3.16 identifies the rationalization. The sign comparison is the reindexing rule recalled in the supplier contract above.

(Fontaine–Laffaille, Theorem 3.3, p. 562; Theorem 6.1, pp. 581–583; Propositions 7.15 and 7.17, pp. 593–594; Theorem 8.4, p. 595; Nizioł, §2, pp. 750–751; Breuil, §2.3, Proposition 6 and Remark 8, p. 465; Liu–Tian–Xiao–Zhang–Zhu, Definition 2.2.4 and Lemma 2.2.6, pp. 124–125.)

**Checks.**

- The zero filtered object realizes to zero, which satisfies both predicates in every interval.
- The weight-zero object `W(k)/p` realizes to the nonzero trivial `ℤ/p`, which satisfies `IsTorsionCrystalline(ℤ/p,0,0)`, whereas its rational `B_cris` tensor is zero.
- At `p=5` the free jump-`−1` line realizes covariantly to `ℤ₅(1)`, of local weight `−1` here and supplier weight `+1`; its reduction `𝔽₅e` realizes to the nonzero `𝔽₅(1)` and satisfies `IsTorsionCrystalline(𝔽₅(1),1,1)` at the reindexed interval. Dualization and interval reindexing preserve these values without another realization functor.
- For `K=ℚ₃` the module `μ₃` does not satisfy `IsTorsionCrystalline(μ₃,0,0)`, so it is not the realization of any support-`[0,0]` torsion object, although it is the realization of the reduction of the jump-`−1` line.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.3a (Small-weight filtered Frobenius modules); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5a (Integral crystalline coefficient predicates); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.6–R07.3.7 (`ringS`, `flFunctor_eq_hom`), R07.3.10–R07.3.12 (exactness, full faithfulness and subquotients), R07.3.14 (lattice functor), R07.3.16 (admissibility), R07.3.17 (lattice correspondence).

### 4.8 Integral crystalline modules and nonsingular extensions

Use the predicates `IsTorsionCrystalline` and `IsIntegralCrystalline` of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5a over unramified `K/ℚ_p`, with scalar restriction for O-coefficients. A local interval `[a,b]` is passed to the supplier as `[−b,−a]`; the first predicate is the quotient-lattice condition and the second tests the first on every `R/p^mR`, `m≥1`. For `R` satisfying `IsIntegralCrystalline(R,−b,−a)` and `a≤0≤b`, define `H¹_ns(K,R)` as extension classes `0→R→R_s→ℤ_p→0` whose middle term satisfies `IsIntegralCrystalline(R_s,−b,−a)`. For finite modules the integral and torsion predicates agree. The extension set is an O-submodule. The rationalized tensor `R⊗_{ℤ_p}B_cris` vanishes for finite p-primary `R` and cannot define this condition.

`K` unramified and coefficient weight conventions fixed; weights of `ℚ_p(1)` are `−1`. Scalar restriction precedes the crystalline test.

The construction proceeds as follows. Use the reindexed predicates of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5a and continuous `Ext¹`/cohomology to identify classes with extensions and pull back the crystalline extension predicate. For the submodule assertion use closure of crystalline lattice quotients under finite products and subquotients in the fixed interval: Baer sum and coefficient pushout are formed from those operations. Use the exact small-weight filtered-module category only for the comparison and finite-length calculations within its allowed interval, not to prove a general-width assertion.

(Liu–Tian–Xiao–Zhang–Zhu, Definitions 2.2.4–2.2.5, pp. 124–125.)

The library targets include the following operations and identities:

- Submodule of cohomology represented by crystalline extensions.
- Compatible coefficient maps induce the extension-class map.
- O-coefficient predicate agrees with the underlying `ℤ_p` predicate.

**Checks.**

- Zero is crystalline and has zero nonsingular extension group.
- `ℤ/p^m(1)` is crystalline in any permitted interval containing `−1`.
- For finite p-primary `R, R⊗_{ℤ_p}B_cris=0`, equivalently its rationalization is zero. Testing only that tensor loses the integral crystalline condition; `R=ℤ/p` is nonzero despite its zero rationalization.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5a (Integral crystalline coefficient predicates); §4.7 (Small-weight crystalline realization and extension exactness, for small-weight comparisons); ArithmeticGaloisDuality §R02.1.2 (*Long exact sequences for continuous cohomology*).

### 4.9 The Bloch–Kato local condition on `T` and `W`

For finite `K/ℚ_p` define `H¹_f(K,V)=ker[H¹(K,V)→H¹(K,V⊗B_cris)]` on the canonical continuous cochain carrier, with the period topology. Define the T-condition by inverse image and the `A=V/T` condition by image. Away from `p` use the unramified rational condition and its propagated lattice/discrete conditions; the raw unramified condition on a finite quotient may differ. Give coefficient, restriction and duality compatibility. For de Rham `V`, the fundamental sequences give the exponential/finiteness exact fragments; for crystalline `V, 0→H⁰(K,V)→D_cris(V)→D_cris(V)⊕D_dR(V)/Fil⁰→H¹_f(K,V)→0`, with `x↦((1−φ)x,x mod Fil⁰)`. The map `1−φ` is `ℚ_p`-linear, generally not `K₀`-linear. Thus `dim_ℚp H¹_f=[K:ℚ_p]·dim_K(D_dR/Fil⁰)+dim_ℚp H⁰`. The exact-annihilator compatibility with `V*(1)` uses de Rham `V` (Bloch–Kato Proposition 3.8). Values on `ℚ_p` and `ℚ_p(1)` are respectively unramified classes and Kummer completed-unit classes.

Finite `K/ℚ_p` and finite-dimensional continuous `V` with stable lattice `T`; finite-condition definition makes sense generally, the realization exact sequence is asserted with crystalline/de Rham hypotheses as specified.

The construction proceeds as follows. Use FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P2 and the continuous-cochain long exact sequences of ArithmeticGaloisDuality §R02.1.2 for the period coefficients to form the kernel. Tensor the sequences of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 with `V` and take the continuous-cohomology LES; identify the invariants and its finite-kernel fragment. Propagate through `T→V→A`, then compute Tate examples through Kummer and local units. For de Rham `V`, use Bloch–Kato Proposition 3.8 and local Tate duality for the exact finite-condition annihilator.

(Bloch–Kato, §3.7, Proposition 3.8, Corollary 3.8.4 and Example 3.9, pp. 352–359; Rodrigues Jacinto–Williams (arXiv v2), Definition 13.19(2), preprint p. 70.)

The library targets include the following operations and identities:

- `L^BK_v` on `W` as the image of `H¹_f(F_v, V)`.
- The preimage on `T`.
- The structure uses finite period conditions at `p`, unramified rational conditions away from `p`, and their image/preimage propagation on `A/T`. Raw finite-coefficient unramified conditions may differ.
- Agreement with §2.5 applied to `H¹_f`.

**Checks.**

- `V = ℚ_p: H¹_f(F_v, ℚ_p) = H¹_ur(F_v, ℚ_p)`, so `L^BK` is the image of the unramified classes.
- `V=ℚ_p(1): H¹_f(K,V)` is the Kummer image of the p-completion of `O_Kˣ`, rationalized over `ℤ_p`; its `ℚ_p`-dimension is `[K:ℚ_p]`.
- For `K=ℚ_p, V=ℚ_p(1)` and `Fil⁺=V`, the Greenberg condition of §2.8 gives all `H¹(K,V)` of dimension `2`, while `H¹_f(K,V)` is the completed-unit line of dimension `1`; the uniformizer class is excluded by the finite condition.
- For an unramified quadratic `K/ℚ_p` and `V=ℚ_p(1), dim_ℚp H¹_f(K,V)=2` although `dim_K D_dR(V)/Fil⁰=1`; omitting `[K:ℚ_p]` fails.

The comparison with ordinary local conditions is the conditional defect calculation of §4.12; equality requires the specific vanishings stated there.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5 (Crystalline and de Rham realization data); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 (Fundamental period sequences with continuous sections); §2.5 (Propagating local conditions); §0.8 (The p-adic Kummer identification); ArithmeticGaloisDuality Layer R02.1.

### 4.10 Crystalline extensions and the integral finite preimage

Let `p>2` and `R` be a finite free O-lattice over unramified `K/ℚ_p, R[1/p]` crystalline with weights `[a,b], a≤0≤b` and `b−a≤p−2`. Then `H¹_ns(K,R)` is exactly the preimage of `H¹_f(K,R[1/p])` under `H¹(K,R)→H¹(K,R[1/p])`. The key lifting criterion is Breuil Proposition 6: a stable free lattice is rationally crystalline in the permitted interval when all its finite p-power reductions satisfy the supplier predicate `IsTorsionCrystalline(−,−b,−a)`. Apply it to the middle term of the extension; width bounds and unramifiedness are hypotheses.

The extension has a free middle term; all finite reductions must be tested. No such equivalence is asserted for arbitrary weights or ramified `K`.

Prove this as follows. A crystalline integral extension gives a rational crystalline extension, hence a finite rational class by the period exact sequence. For the converse represent a rational finite class by its crystalline rational extension and apply the finite-reduction lattice criterion to the integral middle term. Use the small-weight fully faithful exact realization to identify the reductions; Breuil’s limit argument gives crystalline rational middle term and the prescribed bounded weights.

(Breuil, §2.3, Proposition 6 and Remark 8, p. 465; Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.2.6, p. 125.)

**Checks.**

- For `R=ℤ_p` with trivial action, `p>2` and `[a,b]=[0,0]`, both conditions are the unramified `ℤ_p`-line.
- For `R=ℤ_p(1), p>2` and `[a,b]=[−1,0]`, the predicates are tested at supplier interval `[0,1]`; both conditions give integral unit Kummer classes and exclude the uniformizer.
- For `p=5`, `K=ℚ₅` and `R=ℤ₅(1)`, all reductions have supplier witnesses in `[0,1]`. They cannot all have witnesses in `[−1,0]`: twisting such witnesses by `(1)` and applying Breuil Proposition 6 would put `ℚ₅(2)` in supplier interval `[0,1]`, although its supplier weight is `2`. The witnesses may vary with the reduction level.
- For `p=2, K=ℚ₂` and `R=ℤ₂` of weight zero, the interval bounds alone hold but the `p>2` hypothesis fails. The dyadic `[0,0]` torsion realization belongs to FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.10–R07.3.11; it does not supply the free-lattice comparison asserted here.

*Needs:* §4.8 (Integral crystalline modules and nonsingular extensions); §4.9 (The Bloch–Kato local condition on `T` and `W`); §4.7 (Small-weight crystalline realization and extension exactness).

### 4.11 Finite crystalline annihilators and the inverse different

For unramified `K/ℚ_p` and finite `R` satisfying `IsTorsionCrystalline(R,−b,−a)` with `a<0≤b` and `b−a≤(p−2)/2`, the nonsingular groups for underlying `ℤ_p` coefficients are exact annihilators under the finite local Tate pairing. For O-coefficients and the O-linear dual `R*=Hom_O(R,E/O)`, `H¹_ns(K,R)` and `H¹_ns(K,R*(1))` are exact annihilators under the O-linear local Tate pairing into `E/O`, including when `E/ℚ_p` is ramified. Their pairing therefore vanishes. The weaker inclusion in `d_(E/ℚp)^−1/O` follows already from the canonical unscaled coefficient trace.

Finite `R`; the half-width bound allows the tensor-product crystalline calculation. The local Tate-dual interval `[−b−1,−a−1]` is passed to the supplier as `[a+1,b+1]`; its nonsingular extensions use the same reindexed integral predicate.

Prove this as follows. Use the crystalline extension product to factor the nonsingular cup through crystalline `H²`, which vanishes in this range. Compare lengths of the two filtered modules and their `Fil⁰` pieces, then use local Euler characteristic and Tate duality to get exact annihilators over `ℤ_p` (Nizioł 6.2). The canonical unscaled coefficient trace gives `Tr(a z)∈ℤ_p` for every `a∈O`, hence `z∈d^−1`, yielding Liu 2.2.7.

For the exact O-linear assertion choose `δ∈Eˣ` with `d^−1=δO`. The character `ψ_δ:E/O→ℚ_p/ℤ_p`, `z+O↦Tr(δz)+ℤ_p`, is well-defined and `ℤ_p`-linear. The perfect integral trace form `Tr(δab)` on `O` makes composition with `ψ_δ` an isomorphism `Hom_O(R,E/O)≃Hom_ℤp(R,ℚ_p/ℤ_p)`. The O-action on the latter is precomposition with scalar multiplication on `R`; this makes the comparison O-linear and Galois-equivariant. This character is distinct from the unscaled trace; multiplication by `δ` alone need not descend to `E/O`.

After twisting, §4.8's scalar-restriction predicate identifies the nonsingular conditions on these duals, with the same dual interval. If `z+O` is a nonsingular pairing value, Nizioł's vanishing applied to `ax` and the compared dual class gives `Tr(δaz)∈ℤ_p` for every `a∈O`. Thus `δz∈d^−1=δO` and `z∈O`. Conversely, any class annihilating the first nonsingular group O-linearly maps to its `ℤ_p` annihilator and hence belongs to the dual nonsingular group. Finite local duality gives the annihilator equality in both directions. Replacing `δ` by a unit multiple changes only the comparison, so the annihilators are independent of its choice.

(Nizioł, Proposition 6.2 and proof, pp. 764–765; Liu–Tian–Xiao–Zhang–Zhu, Lemma 2.2.7, p. 125.)

**Checks.**

- For unramified `E/ℚ_p` the inverse different is `O` and the value is zero.
- For `E=ℚ_p(√p), p` odd, write `s=√p`. Then `d=(2s)` and `z=1/(2s)` represents a nonzero class of `d^−1/O` with `Tr(az)∈ℤ_p` for every `a∈O`. This shows the limitation of the unscaled trace test. With `δ=1/(2s)`, the normalized test at `a=1` gives `Tr(δz)=1/(2p)∉ℤ_p`, so this class cannot occur as a nonsingular pairing value.
- Changing the generator from `δ` to `uδ`, `u∈Oˣ`, precomposes the dual comparison by multiplication by `u`; §4.8's O-submodules and their exact annihilators are unchanged.
- Width `p−2` is insufficient for the product proof; the half-width bound is essential.
- The local Tate line of weight `−1` dualizes to weight `0`: the intervals `[−1,0]` and `[−1,0]` on the two sides both become supplier interval `[0,1]`, consistent with supplier duality `[c,d] ↦ [1−d,1−c]`.

*Needs:* §4.7 (Small-weight crystalline realization and extension exactness); §4.8 (Integral crystalline modules and nonsingular extensions); ArithmeticGaloisDuality §D7.7.2 (Compatibility of the local pairings for `T, V, W` and `W_M`); ClassFieldTheory Layer 5, `eulerCharacteristic_mixed` and `eulerCharacteristic_finrank_fp`, applied to the underlying finite `ℤ_p`-module and transported through coefficient trace for `O`.

### 4.12 Finite versus ordinary local conditions with explicit exceptional terms

For a de Rham `V` equipped with an ordinary filtration (§2.8a), put `V^+=Fil¹V` and `V^−=V/V^+`; use saturated intersections on lattices. Then compare `L_f=H¹_f(K,V), L_str=im H¹(K,V^+)` and `L_Gr=ker[H¹(K,V)→H¹(I_K,V^−)]`. Use the coefficient LES, the finite-period exact sequence and ArithmeticGaloisDuality §D7.7.5 to calculate `L_str/(L_str∩L_f), L_f/(L_str∩L_f)`, and `L_Gr/L_str=im H¹(K,V)→H¹(K,V^−) ∩ H¹_ur(K,V^−)`. The first two are measured by the kernel/cokernel of the induced finite-period maps and the `H⁰` coefficient boundary; the third is the displayed unramified quotient. Under the separate vanishings `H¹_f(K,V^+)=H¹(K,V^+), H¹_f(K,V^−)=0` and exactness of the finite-extension sequence, `L_f=L_str`; under zero unramified intersection `L_str=L_Gr`. Verify these conditions in each arithmetic example, retaining `φ=1, Fil⁰` and `H⁰` factors when they fail.

Finite `K/ℚ_p`; the ordinary filtration of §2.8a, de Rham coefficient sequence and compatible finite-period complexes. No universal equality of Bloch–Kato and Greenberg conditions is assumed. Infinite-level comparison uses the limits and §3.9, not a period ring at an infinite local field.

Prove this as follows. Write the `H⁰/H¹` coefficient LES and the two finite-period exact sequences as a commuting diagram. Compute the two intersections and their quotient kernels/cokernels by the snake lemma, preserving the boundary and `(1−φ)/Fil⁰` maps. Combine with the inertia/unramified quotient of ArithmeticGaloisDuality §D7.7.5. When every displayed defect vanishes conclude equality; otherwise propagate each actual defect through `T→V→A` and the tower.

(Bloch–Kato, §3.7–3.8, pp. 352–359; Rodrigues Jacinto–Williams (arXiv v2), Remark 13.20, preprint p. 70; Nekovář, §6.7, pp. 151–154.)

**Checks.**

- For `V=ℚ_p, V^+=0, L_str=0` but `L_f=L_Gr=H¹_ur` is one dimensional.
- For `V=ℚ_p(1), V^+=V, L_str=L_Gr=H¹`, while `L_f` consists of unit Kummer classes and omits the valuation line.
- In the good ordinary elliptic case, the nonexceptional unit-root eigenvalue and local Euler dimensions eliminate the finite/strict defect.

*Needs:* §2.8a (Ordinary Galois filtrations); §4.9 (The Bloch–Kato local condition on `T` and `W`); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 (Fundamental period sequences with continuous sections); ArithmeticGaloisDuality §D7.7.5 (Strict ordinary and inertia ordinary annihilators); §2.24 (Lattice changes with global and local errors); §3.9 (Local specialization correction complex).

### 4.13 Archimedean realization on the existing Hodge carrier

At a real place, extend the existing `TauCeti.Hodge.HodgeStructureOn(W,ω,w)`, finite-dimensional over `ℂ`, by a `ℂ`-linear involution `F∞` commuting with the antilinear coefficient conjugation `ω` and taking `H^(a,w−a)` to `H^(w−a,a)`. These involutions are different data. On a diagonal piece `H^(a,a)`, let `h_a^ε` be the dimension of the `F∞=(-1)^(a+ε)` eigenspace, `ε=0,1`. At a complex place use the Hodge numbers without real eigenspaces. Require an explicit comparison specifying which Hodge realization defines `L(V,s)`; in RJW’s Tate convention `V=ℚ_p(n)` has archimedean type `(n,n), F∞=(-1)^n` and `L(V,s)=ζ(s−n)`. The usual cohomological Tate Hodge convention must be dualized to this L-function convention.

Finite-dimensional pure Hodge realization on the actual opposed-filtration carrier. No conversion from a p-adic representation to Hodge data without comparison data.

The construction proceeds as follows. Import Tau Ceti's `TauCeti.Hodge.HodgeStructureOn`, its pieces, symmetry and finite support, and add the Betti involution with its actual compatibility equations. Restrict `F∞` to diagonal pieces and use the `±` eigenspace decomposition in characteristic zero. Import the existing Hodge dual and Tate twist: the L-function Tate-dual Hodge carrier is `H.dual.tateTwist(−1)`, with types `(1−a,1−b)`. Extend it by the negative transpose of `F∞`; this changes the Betti involution, not the underlying Hodge dual construction. Prove the diagonal eigenspace formulas and direct-sum compatibility.

(Deligne, §5.2–5.3 and Table 5.3, pp. 328–329; Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, preprint pp. 71–72.)

The library targets include the following operations and identities:

- `ArchimedeanRealization` — Existing HodgeStructureOn plus the real involution and its compatibility.
- `archRealization_diagonalMultiplicity` — The `(-1)^(a+ε)` eigenspace dimension on `H^(a,a)`.
- Direct sum with both conjugations and summed multiplicities.
- The L-function Tate-dual types and involution.
- Projection to the existing opposed-filtration Hodge structure.
- Factorwise coefficient conjugation for the product carrier.
- The Tate line of type `(n,n)`, transported from Tau Ceti's `TauCeti.Hodge.tate` with its standard conjugation and the added Betti sign; `(n, n)` is its only Hodge type.
- Negate the Betti involution while preserving the Hodge filtration.

**Checks.**

- Zero Hodge structure gives zero diagonal and off-diagonal multiplicities.
- Two weight-zero rank-one structures with the same Hodge filtration and opposite `F∞` give `Γ_ℝ(s)` for sign `+1` and `Γ_ℝ(s+1)` for sign `−1`; their pole counts at zero are respectively `1` and `0`.
- For `ℚ_p(n)` in the RJW convention, the type is `(n,n)` and `F∞=(-1)^n`; using type `(−n,−n)` without changing `L(V,s)` gives the wrong criticality.

*Needs:* §2.10 (Pontryagin duals with the contragredient action); Tau Ceti `TauCeti.Hodge.HodgeStructureOn.dual`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`; Tau Ceti `TauCeti.Hodge.tate`; Tau Ceti `TauCeti.Hodge.tate_hodgeNumber`.

### 4.14 Gamma factor and its integer pole order

**Hodge Gamma recipe and integer adapter.** For a real place, each off-diagonal pair `(a,b),(b,a), a<b`, contributes a complex shift `−a` with multiplicity `h^(a,b)`, and the diagonal sign `ε` contributes a real shift `ε−a` with multiplicity `h_a^ε`. For a complex place each type `(a,b)` contributes a complex shift `−`min`(a,b)` with its multiplicity. Finite support makes these lists finite. The integer carrier `gammaPoleOrder` sums multiplicities of complex factors with `m+`shift`≤0` and real factors with `m+`shift a nonpositive even integer. Products and pole orders include every archimedean place.

Define `hodgeGammaFactor` as the weighted product of Mathlib's real and complex Gamma
functions on these integral lists, and the Hodge shift expansion by repeating their multiplicities
in two complex-shift multisets. For such a list `f` and a supplied LFunctions
`AnalyticLFunctionData d` whose shift multisets `(d.gammaR, d.gammaC)` are the expansion of `f`, prove the equality
`hodgeGammaFactor f s = d.gammaFactor s`, including totalized values. This is a comparison
with the existing record's product and needs no analytic or arithmetic predicates on `d`.
The Hodge product and its order formulas themselves take only the realization data.

`Suggested.lean` states `gammaPoleOrder_hodge_analytic` for a real-place realization and
`gammaPoleOrder_complexHodge_analytic` for a complex-place Hodge structure: at each integer
`m`, the meromorphic order of its product is the negative of `gammaPoleOrder` on its factor
list, in `WithTop ℤ`. Use §4.13's actual opposed-filtration carrier and eigenspaces. Mathlib
`Complex.differentiable_Gammaℝ_inv` and `Complex.differentiable_Gammaℂ_inv` supply the scalar
analytic reciprocals. The Gamma recurrence and residue at zero give the simple scalar poles;
nonvanishing away from them and `meromorphicOrderAt_mul` then add the weighted orders on
the finite Hodge lists. The exponential factors in `Complex.Gammaℝ_def` and
`Complex.Gammaℂ_def` have order zero. Prove list-concatenation and Tate-dual compatibility;
the dual order formula follows by applying the Hodge theorem to the actual dual realization.

(Deligne, §5.3 and Table 5.3, p. 329; Rodrigues Jacinto–Williams, §13.5.3, arXiv v2 p. 71;
Mathlib `Analysis/SpecialFunctions/Gamma/Deligne.lean`, Gamma recurrence, scalar reciprocal
analyticity and residue at zero, and `Analysis/Meromorphic/Order.lean`;
LFunctions Layer 0, definition of `AnalyticLFunctionData.gammaFactor`.)

The library targets include the following operations and identities:

- `ShiftedGamma` — Real or complex native Gamma function with its integral shift.
- `complexHodgeGammaFactors` — One complex-place factor per Hodge type, with shift `−`min`(a,b)`.
- `hodgeGammaFactors` — Weighted real-place factor list.
- For `a<b=w−a`, the dual complex shift is `b−1`; diagonal real shifts are `a−1` and a with the original `ε=0` and `ε=1` multiplicities.
- Agreement up to permutation with the native Tate-dual realization and its negative transpose Betti involution.
- Expansion into real and complex shift multisets.
- The record comparison gives equality with `AnalyticLFunctionData.gammaFactor` when the record has the expanded Hodge shifts, including totalized values.
- `gammaPoleOrder` — Weighted integer pole count.
- Concatenation multiplies Gamma products and adds integer pole counts.
- The real Tate line `ℚ_p(n)` gives `Γ_ℝ(s−n)`.
- `gammaPoleOrder_hodge_analytic`, `gammaPoleOrder_complexHodge_analytic` — Real- and complex-place Hodge products have analytic order equal to the negative integer count.

**Checks.**

- Zero realization gives product `1` and pole order `0`; directly at a complex place, `complexHodgeGammaFactors` of the zero carrier gives product `1`.
- The real Tate type `(n,n)`, sign `(−1)^n` gives `Γ_ℝ(s−n)`. At a complex place `complexHodgeGammaFactors` of the type-`(2,2)` Tate line instead gives `Γ_ℂ(s−2)`.
- Weight-zero real sign `+` gives `Γ_ℝ(s)`, sign `−` gives `Γ_ℝ(s+1)`; their orders at `0` differ.
- A real weight-one structure with `h^(0,1)=h^(1,0)=1` gives `Γ_ℂ(s)`, counted once. At a complex place the same two Hodge types give `Γ_ℂ(s)²`: `complexHodgeGammaFactors` has two zero shifts, rather than shifts `0` and `−1`.
- The dual factors of the zero realization have no positive multiplicities. The dual of the type `(0,0)`, sign `+` line has `Γ_ℝ(s−1)` and a pole at one; the dual of the type `(2,2)`, sign `+` line has `Γ_ℝ(s+1)` and no pole there.
- Expanding a real shift `−2` of multiplicity two, a complex shift `1` of multiplicity one and a real shift of multiplicity zero preserves signs, kinds and multiplicities.
- The weight-zero sign `+` Tate realization has totalized product zero at `0`, integer count `1` and analytic order `−1`.
- A matching record with two real shifts `0` and one complex shift `0` has the same product as
  the combined Hodge lists and order `−3` at `0`. The record's conductor, coefficients and
  completed function do not enter this equality.
- At `−1` the weight-zero real Tate line has order `0`, whereas its complex-place factor
  has order `−1`. The zero realization has order `0` everywhere, including at `0`.

*Needs:* §4.13 (Archimedean realization on the existing Hodge carrier); LFunctions Layer 0 (`AnalyticLFunctionData.gammaFactor`, for the record comparison); Mathlib `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.differentiable_Gammaℝ_inv`, `Complex.differentiable_Gammaℂ_inv`, `Meromorphic.Gamma`, `meromorphicOrderAt` and its finite-product API.

### 4.15 The Gamma factor, `r_V` and criticality

For explicit archimedean realization data attached to `L(V,s)`, define `r_V=gammaPoleOrder(V,1)` from §4.14. Define Greenberg criticality by `r_V=r_(V*(1))=0`, using the Tate-dual Hodge types and real signs from §4.13. For `ℚ_p(n), r_V` is one exactly for positive odd `n`, and the dual is `ℚ_p(1−n)`; consequently the critical integers are positive even `n` or negative odd `n`. At `n=0` the dual factor has a pole, so `n=0` is not critical. Criticality is a computed predicate, not a supplied Boolean or Gamma factor. The criticality predicate computes the second pole order through the Tate-dual factor list of §4.14, which is identified with the factor list of the actual Tate-dual realization, without an independently supplied dual factor list.

A finite-dimensional Hodge realization and its comparison to the chosen L-function convention, together with the compatible Tate-dual realization.

The construction proceeds as follows. Apply §4.14’s Hodge/sign recipe and its Hodge analytic-order formulas through the integer-count adapter. Apply the Tate-dual transformation to compute the second order. For Tate types, the real factor gives poles at `n,n−2,…`; evaluate at `1` for `n` and `1−n` to obtain the exact parity table.

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, pp. 71–72 (arXiv v2), with Remark 13.23; published pp. 198–199.)

The library targets include the following operations and identities:

- `L_∞(V,s)` computed from the explicit Hodge/sign realization by §4.14, in the chosen L-function convention.
- `r_V`, the order of the pole of `L_∞(V, s)` at `s = 1`.
- The Tate dual `V^∨ = Hom_cts(V, ℚ_p(1))`.
- Greenberg criticality: `r_V = 0` and `r_{V^∨} = 0`.
- `r_{ℚ_p(n)} = 1` if `n` is odd and positive, `0` otherwise.
- `ℚ_p(n)` is critical iff `n` is even and positive or odd and negative.

**Checks.**

- `n = 2: r_V = r_{V^∨} = 0`, so `ℚ_p(2)` is critical.
- `n = 0: r_{ℚ_p(1)} = 1`, so `ℚ_p` is not critical, although Theorem 13.8 is its main conjecture (Remark 13.23).
- `n = 1: r_{ℚ_p(1)} = 1` (the pole of `Γ(s/2 − 1/2)` at `s = 1`).
- `n = −1`: critical (odd and negative).
- For `−6≤n≤6`, criticality agrees with the parity rule: the critical twists are `−5,−3,−1,2`,4,6.

This is Greenberg's Gamma-factor notion; it agrees with Deligne's criticality for Tate twists (`L(ℚ_p(n), 1) = ζ(1 − n)` and `L(ℚ_p(n)^∨, 1) = ζ(n)` both critical).

*Needs:* §4.14 (Hodge Gamma recipe and integer adapter); §4.13 (Archimedean realization on the existing Hodge carrier).

### 4.16 Class groups, p-ramified Galois groups and unit towers

For `F_n=ℚ(μ_(p^n)), p` odd, import the arithmetic tower modules of IntegralIwasawaTheory for the cyclotomic `ℤ_p`-extension of `K=ℚ(μ_p)`. Its layer `K_(n−1)` is `F_n` here. Notation dictionary: the supplier's class norm limit `classGroupLimit` (§2.1) and unramified module `unramifiedModule` (§2.3), identified by `unramifiedModule_classGroupLimit`, are `Y_n, Y∞` here; its p-ramified module `pRamifiedModule` for `S=S_p∪S_∞` (§2.3), with `pRamifiedModule_rayLimit`, is `X_n, X∞` here (the fields are totally imaginary, so the archimedean places impose nothing); its principal units `U_n` and closed image `globalUnitClosure n` of `E_n=O_(F_n)^×⊗ℤ_p` (§2.2) are `U_n,1, E_n,1` here, and `unitLimit_eq_limit_closures` (§2.7) identifies `E∞,1` with the norm limit of these closures. The closure of the global units lying in principal units has prime-to-`p` index in the closed image of `E_n`, so both descriptions of `E_n,1` agree. The supplier's norm, transfer and Artin compatibilities are used as stated there. This target adds the plus/minus decomposition: for complex conjugation `c`, `e±=(1±c)/2` gives the plus and minus parts, and `X∞^+, Y∞^+` are identified with the corresponding groups over the real tower `F∞^+`. A chosen closed norm-compatible unit submodule `C∞,1^+⊆E∞,1^+` is parameter data here; constructing cyclotomic units and Euler systems is not part of this roadmap.

Cyclotomic tower and `p` odd; closed unit images rather than algebraic unit images; global Artin reciprocity normalized with arithmetic Frobenius, as in the supplier.

The construction proceeds as follows. Transport the supplier's modules along the index change `n↦n−1`, with their continuous tower action. Compute the action of `c` and the idempotents `e±`, which are integral because `2` is a unit in `ℤ_p`. Prove descent to the real tower using the prime-to-p group of order two: averaging over `{1,c}` identifies the plus parts with the modules of `F_n^+`.

(Rodrigues Jacinto–Williams (arXiv v2), §13.2 and Definition 13.12, preprint pp. 65–67; Proposition 13.13 and Corollary 13.14, pp. 67–68.)

The library targets include the following operations and identities:

- The `e±` decomposition of the imported tower modules for `p` odd.
- The plus parts of the imported unramified and p-ramified modules agree with the corresponding modules of the real tower.

**Checks.**

- A dense proper algebraic unit subgroup has the same closed image; replacing closure by raw image changes the compact quotient.
- For `c=1` the minus part is zero and the plus part is the whole module.
- At `p=2`, division by `2` is unavailable and the `e±` integral direct sum is not an allowed construction.
- A constant tower with every class group `C₃` and identity norms has norm limit `C₃` both as the supplier's class norm limit and as `Y∞` here; the index change does not alter limits.

*Needs:* IntegralIwasawaTheory §2.1 (*Norm limits and extension limits of class groups*), §2.2 (*Units, semilocal units, and the field-level defect*), §2.3 (*The extensions represented by each arithmetic module*), §2.7 (*Global-local reciprocity, with real signs*); ArithmeticGaloisDuality §R02.3.0b (Completion of global units); §3.6 (Semilocal cohomology and descent of local classes).

### 4.17 The closed-unit and class-group exact sequence

In the cyclotomic plus tower with the objects of §4.16, `0→E∞,1^+→U∞,1^+→X∞^+→Y∞^+→0` is exact. For any closed `Λ`-submodule `C∞,1^+⊆E∞,1^+`, quotienting gives `0→E∞,1^+/C∞,1^+→U∞,1^+/C∞,1^+→X∞^+→Y∞^+→0`. In particular `ker(X∞^+→Y∞^+)≃U∞,1^+/E∞,1^+`, with the quotient in that direction. The image `E_n,1` is a closure; equality with the abstract completed unit lattice requires the separate Leopoldt assertion.

`p` odd; the supplier's finite-level reciprocity maps and cyclotomic ramification; `C` closed and contained in `E`. This comparison constructs no cyclotomic units.

Prove this as follows. For `p` odd the real-sign term of IntegralIwasawaTheory §2.7 vanishes, so its `infiniteGlobalLocalSequence` reads `0→E∞→U∞→X∞→Y∞→0` in the dictionary of §4.16, with `E∞` identified with `E∞,1` by `unitLimit_eq_limit_closures`. Applying the exact functor `e+` gives the first sequence. Apply the quotient exact sequence for `C⊆E⊆U` and check the quotient orientation in the reciprocity kernel.

(Rodrigues Jacinto–Williams (arXiv v2), Proposition 13.13 and Corollary 13.14, preprint pp. 67–68 (published p. 193); NSW, Corollary 10.3.24, p. 640.)

**Checks.**

- `C=0` gives the original unit/class-group sequence.
- `C=E` gives `0→0→U/E→X→Y→0`.
- `E⊆U`, so `U/E` is defined while `E/U` is not; this rejects the reversed printed quotient. For `E=3ℤ₃⊂U=ℤ₃` and `C=0`, the reciprocity kernel is `U/E≅C₃` both in the supplier's sequence and here.

*Needs:* §4.16 (Class groups, p-ramified Galois groups and unit towers); IntegralIwasawaTheory §2.7 (*Global-local reciprocity, with real signs*).

### 4.18 Leopoldt and the strict-at-p Tate Selmer group

For a number field `F` and `W*=ℚ_p/ℤ_p(1)`, choose the Selmer condition strict at every p-adic place and the propagated finite condition away from `p`. The resulting Selmer group is finite iff the p-adic unit localization map `O_F^×⊗ℤ_p→⊕_(v|p)` completed `O_Fv^×` has `rank r₁+r₂−1` (Leopoldt). For a finite character `χ` of prime-to-p order, the corresponding `χ`-component is finite when Leopoldt holds for its splitting field; use the character idempotent only under the prime-to-p hypothesis. This is a statement/equivalence, not a proof of Leopoldt for all number fields.

Finite `F`; p-primary coefficient and local conditions specified. The strict `p` condition cannot be replaced by relaxed or the full finite unit condition.

Prove this as follows. Use global Kummer and the finite class group to write the exact unit/class-group Selmer sequence. Strictness at `p` cuts out the kernel of the unit localization map; its corank is precisely the Leopoldt rank defect. The other class-group and finite torsion terms are finite. For `χ` use the prime-to-p idempotent and apply the same argument to the splitting field.

(Rubin (1999 draft), Corollary I.6.4, p. 16; Remark II.2.7, p. 25.)

**Checks.**

- For `ℚ` the unit rank is zero and the strict Selmer group is finite.
- Relaxing `p` admits local unit Kummer classes and no longer expresses the same rank-defect kernel.
- If `p` divides the character group order, its integral averaging idempotent is unavailable.

*Needs:* §0.9 (The Kummer identification for S-units); §4.17 (The closed-unit and class-group exact sequence); §2.2 (Compact and rational Selmer kernel).

### 4.19 Local units and the cyclotomic Euler system in Iwasawa cohomology

For `K_n=ℚ_p(μ_(p^n))`, the completion `K̂_n^×≃H¹(K_n,ℤ_p(1))` intertwines norms with corestriction and gives `lim_n K̂_n^×≃H¹_Iw(ℚ_p,ℤ_p(1))`. Principal-unit inclusions give `U∞→H¹_Iw`. Every specified norm-compatible unit sequence maps to its compatible local Kummer sequence. For an external cyclotomic-unit Euler system, localization of its norm identities must retain the Frobenius operator on the field/class, rather than replace it by the scalar coefficient action. This is the cohomological reinterpretation of RJW §10.5; constructing those Euler-system classes is not part of this roadmap.

`p` odd; `D ≥ 1` prime to `p`; completions as in Layer 0.

Prove this as follows. Apply the local Kummer norm squares at every finite level and take the inverse limit. Restrict the comparison to principal units and prove compatibility with the completed `Γ`-action. Apply this map to any supplied norm-compatible sequence; for external Euler-system sequences use the actual Frobenius class action in each identity.

(Rodrigues Jacinto–Williams (arXiv v2), §10.5, (10.5)–(10.8) and Definition 10.16, pp. 52–53 (arXiv v2); published pp. 170–172.)

Coleman's map Col′ and Perrin-Riou's big logarithm, which RJW mention after (10.8), are not part of this roadmap.

*Needs:* §0.8 (The p-adic Kummer identification); §0.4 (Local completion and algebraic tensor comparison); §3.1 (Iwasawa cohomology).

### 4.20 Greenberg Selmer groups of Tate twists

Give `V_n = ℚ_p(n)` the filtration `Fil^iℚ_p(n) = ℚ_p(n)` for `i ≤ n` and `0` for `i > n`. Then `L^Gr_{v_p} = H¹(K_∞^+, W_n)` for `n ≥ 1` and `L^Gr_{v_p} = H¹_ur(K_∞^+, W_n)` for `n ≤ 0`. Inflation–restriction gives `H¹(F, W_n) = Hom_{cts,{±1}}(G_{F_∞}, W_n)`, and hence `H¹_{L^Gr}(F, W_n) = Hom_cts(X_∞^{c=(−1)^n}, W_n)` for `n ≥ 1` and `Hom_cts(Y_∞^{c=(−1)^n}, W_n)` for `n ≤ 0`. Since `(X_∞)^{c=1} ≅ X_∞^+`, for even `n > 0, H¹_{L^Gr}(F, W_n) = Hom_cts(X_∞^+, W_n)`, whose Pontryagin dual is `X_∞^+(−n)`, the module `X_∞^+` with its `Λ(Γ^+)`-action twisted by `χ^{−n}` (RJW §13.5.2, Example 13.22).

`p` odd; `F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}`; `K_∞^+ = ⋃_n ℚ_p(μ_{p^n})^+` denotes the local tower, with cohomology defined by finite-level restriction colimits; `χ` is the cyclotomic character, `T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n)`; `X_∞ = Gal(M_∞/F_∞)` and `Y_∞ = Gal(L_∞/F_∞)` for the maximal abelian pro-p extensions unramified outside `p` and everywhere unramified, with `X_∞^+ = Gal(M_∞^+/F_∞^+)` (§4.16).

Prove this as follows. Local condition: `W_n/Fil^1W_n` is `0` for `n ≥ 1` and `W_n` for `n ≤ 0`, so `L^Gr` is everything or the unramified condition (§2.8). `G_{F_∞}` acts trivially on `W_n`, so `H¹(F_∞, W_n) = Hom_cts(G_{F_∞}, W_n)`; since #`{1, c} = 2` is prime to `p`, inflation–restriction gives `H¹(F, W_n) = Hom_cts(G_{F_∞}, W_n)^{{1,c}}`. A class is p-power torsion with abelian image, so it factors through the maximal abelian pro-p extension of `F_∞`; the unramified conditions away from `p` factor it through `X_∞`, and for `n ≤ 0` the condition at `p` factors it through `Y_∞`. `c` acts on `W_n` by `(−1)^n` and `X_∞ = X_∞^{c=1} ⊕ X_∞^{c=−1}` (`p` odd), so `{±1}`-equivariant homomorphisms are those on the `(−1)^n`-eigenspace; restriction identifies `X_∞^{c=1}` with `X_∞^+`. Pontryagin duality with the contragredient action (§2.10) turns `Hom_cts(X_∞^+, W_n)` into `X_∞^+(−n)`.

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.2, pp. 70–71 (arXiv v2); published pp. 196–197.)

RJW write `H¹_{L^Gr}(F_∞, W_n)` for the group over `F = F_∞^+` in steps (3)–(4), and "`n ≥ 0`" for `n ≤ 0`. The odd-n and `n ≤ 0` cases give the minus part of `X_∞` and the parts of `Y_∞`; only even `n > 0` recovers `X_∞^+`.

*Needs:* §2.8 (Greenberg's local condition); §2.7 (The unramified condition); §2.9 (Compact and rational Galois Selmer groups); §2.10 (Pontryagin duals with the contragredient action); §2.2 (Compact and rational Selmer kernel); §4.16 (Class groups, p-ramified Galois groups and unit towers).

### 4.21 The Iwasawa–Greenberg main conjecture (as a proposition)

**Iwasawa corank from the compact dual.** Let `p` be odd, `O` the ring of integers of a finite extension of `ℚ_p, Γ^+ = Γ₀ × Δ^+` with `Γ₀ ≅ ℤ_p` and `Δ^+` finite abelian of order prime to `p`, and `Λ = O⟦Γ^+⟧`. For a discrete p-primary module `M` with compatible continuous `Λ`-action, assume its compact contragredient dual `X = M^∨` is finitely generated over `Λ`. Use PadicMeasuresIwasawaAlgebras §4.6 to write `Λ = ∏_ω Λ_ω`, with `Λ_ω = O_ω[[T]]` indexed by Galois orbits of `Δ^+`-characters. Define the Iwasawa corank as the tuple `(rank_{Λ_ω} X_ω)_ω`, where the component rank is `dim_{Q_ω}(Q_ω ⊗_{Λ_ω} X_ω)` for `Q_ω = Frac Λ_ω`. Its library API includes invariance under compact-dual equivalences, additivity in exact sequences of finite compact duals, rank one for the component ring itself, and rank zero for torsion modules. The rank-zero assertion uses `Λ_ω`-torsion, not finite cardinality. Saying `corank_Λ M = r` means every component has `rank r`; torsion means all components have rank zero. The finiteness input for the arithmetic group is §3.13 with its finite-generation and local-condition hypotheses (or a specified finite compact dual as datum); §2.11's `ℤ_p`-corank does not apply to an arbitrary `Λ`-cofinite module.

Here `Frac Λ` is the total quotient ring, localization at the non-zero-divisors (`FractionRing`, `IsFractionRing`); it is `∏_ω Q_ω` and is not required to be a field. Individual character ranks after a splitting coefficient extension agree with these orbit-component ranks. Prove the API by flat localization on each component and exact Pontryagin duality.

(Rodrigues Jacinto–Williams, §13.1, Lemma 13.4 and Definition 13.5, arXiv v2 p. 66 (published p. 190), and §13.5.3, Conjecture 13.21, arXiv v2 p. 71 (published p. 198); PadicMeasuresIwasawaAlgebras §4.6, isotypic and nonsplit orbit decomposition.)

**Checks.**

- For `Δ^+ = 1` and `X = O[[T]]`, its discrete dual has Iwasawa corank one, although `X` is not finitely generated over `ℤ_p`.
- For a finitely generated torsion `X`, every component corank is zero, including `X = Λ/(T)`.
- For split `Δ^+ = C₂` and `X = e_+Λ`, the ranks are `(1,0)`; no scalar corank one on all components is assigned. At `p = 5` the cyclotomic `Γ^+` has this finite factor and its total quotient ring has two field factors.

For a `G_ℚ`-representation `V` equipped at `p` with an ordinary filtration of §2.8a, stable global lattice `T` and `A=V/T`, explicit archimedean realization and a specified analytic p-adic L-function `L_p(V)` in `Frac Λ(Γ^+)`, state Greenberg’s proposition: `corank_Λ Sel_Gr(F∞^+,A)=r_V`; and, if `V` is critical, its compact Selmer dual `X` is `Λ`-torsion and, using that torsion conclusion, `char_Λ(X)=(L_p(V))`. If `L_p(V)` is only a fraction, equality is an equality of fractional ideals with the integral characteristic ideal, and hence asserts integrality of that ideal. The datum carries the normalization/interpolation hypothesis appropriate to `V`; no general existence theorem is asserted. Positive corank leads to a determinant/leading-term proposition with a regulator trivialization, not this rank-zero characteristic-ideal equation.

`V` has the ordinary filtration of §2.8a, with saturated lattice intersections; `L_p(V)` is supplied data.

The construction proceeds as follows. Definitions only: (i) uses the componentwise Iwasawa corank just defined, with finitely generated compact dual, and (ii) includes torsion in its critical branch before forming the characteristic ideal of `X` (PadicMeasuresIwasawaAlgebras §§4.1–4.2, with the isotypic decomposition over `Λ(Γ^+)`).

(Rodrigues Jacinto–Williams (arXiv v2), §13.5.3, Conjecture 13.21, p. 71 (arXiv v2); published p. 198.)

The library targets include the following operations and identities:

- An element `L_p(V)` of `Frac Λ(Γ^+)`, recorded as data with its conjectural interpolation.
- Proposition (i): every component of the Iwasawa corank of `H¹_{L^Gr}(F, W)` is `r_V`; finite generation of its compact dual is a hypothesis of the interface.
- Proposition (ii): if `V` is critical, there exists a proof `h_tors` that `X=H¹_{L^Gr}(F,W)^∨` is `Λ`-torsion and `char_Λ(X;h_tors)=(L_p(V))`. The ideal equality depends on that proof; (ii) is defined independently of (i).
- The conjunction of (i) and (ii).
- (ii) holds vacuously when `V` is not critical.

**Checks.**

- `V = ℚ_p(n), n` even `> 0`: (ii) is the twisted Iwasawa main conjecture (§4.22).
- `V = ℚ_p: r_{V^∨} = 1`, so (ii) says nothing, although Theorem 13.8 is proved (Remark 13.23).
- A free compact dual `X=Λ` has finite generation but positive component rank. In a critical branch (ii) fails at its torsion assertion, before any torsion-only characteristic ideal is formed.
- At the torsion ideal-comparison interface over `Λ=O[[T]], X=Λ/(f)` with `f≠0` has characteristic ideal `(f)`. The predicate with supplied element `f` is true, whereas the predicate with `pf` is false, since `p` is a nonunit. A unit multiple of `f` preserves the predicate. Thus supplying an element does not make the ideal assertion automatic.
- Changing the lattice preserves rationalized Iwasawa cohomology and corank. Its integral finite-coefficient tower errors need not be finite `Λ`-modules; a `Λ/(p)` error changes a height-one characteristic divisor. Do not assert integral characteristic-ideal independence without a proved error cancellation.

The rank-zero characteristic-ideal statement (ii) and any positive-rank leading-term statement are distinct propositions; only (i) and (ii) are stated. RJW state the conjecture over `F = ℚ(μ_{p^∞})^+`, not over the cyclotomic `ℤ_p`-extension used by Greenberg (their Remark 13.9).

*Needs:* §2.8a (Ordinary Galois filtrations); §2.8 (Greenberg's local condition); §2.9 (Compact and rational Galois Selmer groups); §2.11 (Coranks); §2.10 (Pontryagin duals with the contragredient action); §4.15 (The Gamma factor, `r_V` and criticality); PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals); PadicMeasuresIwasawaAlgebras §4.6 (isotypic decomposition over `Λ(H × ℤ_p)`).

### 4.22 Equivalence of the critical Tate-twist main-conjecture propositions

For `n` positive even, the Tate Selmer dictionary identifies its compact dual with `X∞^+(−n)`. State the cyclotomic proposition as torsion of `X∞^+` together with `char_Λ(X∞^+)=I(Γ^+)ζ_p`, where `I(Γ^+)` is the augmentation ideal and `ζ_p` the Kubota–Leopoldt pseudomeasure. Choose a generator a of `I` and put `z=aζ_p`. For `Γ^+=Γ₀×Δ^+`, with `e₀` the trivial `Δ^+` idempotent and `γ` a generator of `Γ₀`, take `a=(1−e₀)+e₀(γ−1)`. The normalized analytic datum for `ℚ_p(n)` is `Tw_{−n}(z)`, with `Tw_k(γ)=χ(γ)^{−k}γ` as in §3.0. Even `n` makes `χ^n` descend to `Γ^+`. Prove char`(X∞^+(−n))=Tw_{−n}(char X∞^+)` when `X∞^+` is torsion; thus §4.21’s dependent torsion-and-ideal proposition is equivalent to the stated cyclotomic proposition. Its corank assertion is separately equivalent to torsion of `X∞^+`. The `n=0` case is excluded by criticality of the Tate dual.

The interpolation normalization is evaluation at `ψ: Tw_{−n}(z)(ψ)=z(χ^nψ)=a(χ^nψ)ζ_p(χ^nψ)`, whenever the raw pseudomeasure has finite evaluation. At its augmentation pole use the regularized value of `aζ_p`. Changing `γ` changes a by a unit and hence preserves the ideal proposition; changing a to `1` does not. Retain the nonunit augmentation factor on the trivial `Δ^+` component before twisting, and transport that idempotent along `Tw_{−n}`.

`p` odd; `F_∞ = ℚ(μ_{p^∞}), F = F_∞^+ = ℚ(μ_{p^∞})^+, Gal(F_∞/F) = {1, c}`; `K_∞^+` denotes the finite-level local tower; `χ` is the cyclotomic character, `T_n = ℤ_p(n), V_n = ℚ_p(n), W_n = (ℚ_p/ℤ_p)(n)`; `X_∞ = Gal(M_∞/F_∞)` and `Y_∞ = Gal(L_∞/F_∞)` for the maximal abelian pro-p extensions unramified outside `p` and everywhere unramified, with `X_∞^+ = Gal(M_∞^+/F_∞^+)` (§4.16).

Prove this as follows. Use the explicit plus/Tate-dual dictionary, including the contragredient `Λ` action. For the action `χ^{−n}` on `X∞^+(−n)`, the identity on underlying coefficients is `Tw_{−n}`-semilinear. Transport the characteristic ideal along that automorphism and compare `Tw_{−n}(aζ_p)`, preserving the augmentation factor. State the equivalence in both directions; the main-conjecture assertion itself is the proposition of §4.21 and is not proved here.

(Rodrigues Jacinto–Williams, §13.3, Theorem 13.8, arXiv v2 p. 67; §13.5.3, Example 13.22 and Remark 13.23, pp. 71–72, for the Selmer twist and criticality.)

**Checks.**

- `p=3` gives `Δ^+=1` and `a=γ−1`. Its `Tw_{−n}` image `χ(γ)^nγ−1` remains a nonunit; the augmentation factor cannot be discarded from the equation with the raw `ζ_p` twist.
- `p=5` gives `Δ^+=C₂: a` is `γ−1` on the trivial component and `1` on the other component, so replacing `I` by the procyclic augmentation ideal on every component is wrong. For `n=2, Tw_{−2}` sends `e₀` to the nontrivial-character idempotent; the augmentation factor follows that transport.
- Twisting back by `Tw_n` recovers `Iζ_p` and `X∞^+`, including the torsion branch. At `n=0` this algebraic transport exists, but §4.21(ii) is vacuous because `ℚ_p` is not critical.

*Needs:* §4.20 (Greenberg Selmer groups of Tate twists); §4.15 (The Gamma factor, `r_V` and criticality); §4.21 (The Iwasawa–Greenberg main conjecture (as a proposition)); PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals); PadicMeasuresIwasawaAlgebras §4.6 (transport of characteristic ideals along semilinear equivalences).

### 4.23 Positive-rank determinant formulation as a separate proposition

Specify `O` a complete DVR with fraction field `E`, a perfect integral Selmer complex `C`, a specialization `χ`, a parameter `u` at `χ`, a series `f(u)∈E[[u]]`, and `r=dim_E H¹(C⊗^L_χ E)>0`. A supplied nondegenerate regulator, with its normalization, must induce an actual line equivalence `θ_reg:𝔇(C⊗^L_χ O)⊗E≃E`; for each retained perfect local correction `E_v` supply the corresponding line trivialization. Let `J` be the product of `θ_reg(𝔇(C⊗^L_χ O))` and the local-error fractional lattices, with the inverse-determinant convention of §3.14. Define the proposed leading-term assertion by `f_k=0` for `k<r, f_r≠0` and `O·f_r=J`. Record the regulator construction as input, not an unconstrained asserted equality. Specialization `rank r` is distinct from generic `Λ`-corank. This is an explicitly proposed arithmetic schema, not a claim that RJW Conjecture 13.21(ii) states it or that a non-torsion module has a characteristic ideal.

Perfectness, specialization, chosen parameter, analytic series and actual regulator/line maps. All determinant factors are defined before the assertion. No existence of these analytic/regulator data is asserted.

The construction proceeds as follows. Use the determinant line of §3.14, which has no canonical scalar trivialization in positive rank. Specify the regulator-induced comparison of generic determinant lines and the specialized exterior powers. Define equality of the resulting fractional lattices with the analytic leading coefficient, including order and local factors.

(Rodrigues Jacinto–Williams (arXiv v2), Conjecture 13.21(ii) and Remark 13.24, preprint pp. 71–72; Nekovář, §§8.9–8.10, pp. 238–251.)

The library targets include the following operations and identities:

- Actual perfect complex, parameterized analytic series, specialized rank and regulator line equivalences.
- Coefficients below `r` vanish, coefficient `r` is nonzero and its principal fractional lattice equals the defined determinant product.
- Scaling the regulator equivalence by `a∈Eˣ` scales `J` by `a`; an O-unit leaves its fractional ideal unchanged.
- For `u′=a u` plus higher terms, `a∈Oˣ`, the leading coefficient scales by `a^−r` and its fractional lattice is unchanged.

**Checks.**

- Generic acyclicity can coexist with positive specialization rank: `C=`[`O[[u]]` —`u→ O[[u]]`] in degrees one and two is generically acyclic, but at `u=0` it has `H¹=H²=O` and still needs the supplied regulator. Only an acyclic specialized complex has the canonical acyclic trivialization of §3.14.
- A degenerate regulator cannot give a determinant trivialization.
- Deleting a nonunit local-error determinant changes the leading-term lattice.

*Needs:* §3.14 (Determinant line and its height-one characteristic divisor); §3.9 (Local specialization correction complex); §4.21 (The Iwasawa–Greenberg main conjecture (as a proposition)).

### 4.24 Global finite Selmer reductions and conjugation

Define `Sel_f(F,T)` as the preimage of the rational finite Selmer group and `Sel_(f,T)(F,T/λ^m)` as the image of `Sel_f(F,T)` in finite coefficient cohomology; distinguish this global image from the Selmer kernel formed from independently propagated local conditions. For a free O-submodule `S` of `Sel_f(F,T)` whose image modulo torsion is saturated, its image `S(m)` is free over `O/λ^m` of the same rank. Its localizations lie in the nonsingular condition at unramified non-p places and at unramified `p` places in the small crystalline range. If `c` restricts to an automorphism of `F`, conjugation gives `Sel_f(F,V)≃Sel_f(F,V^c)`, carrying each place to its conjugate.

Stable free lattice `T`; `m≥1`; the saturation condition is on the image in `Sel_f`/torsion, not merely a submodule of the torsion group. The local crystalline hypothesis includes `p>2` and the interval bounds of §4.10.

Prove this as follows. Apply the coefficient LES and the global kernel definition to form the preimage and finite image. The map (`Sel_f`/torsion)/`λ^m→Sel_(f,T)(T/λ^m)`/image(torsion) is injective; saturation gives the stated free reduction and rank. Use §4.10 and unramified propagation for the local containment. Conjugate extension classes and localization maps to get inverse Selmer maps.

(Liu–Tian–Xiao–Zhang–Zhu, Definitions 2.4.1–2.4.2 and Lemma 2.4.3, p. 129; Lemma 2.4.5 and Proposition 2.4.6(1), p. 130.)

*Needs:* §4.9 (The Bloch–Kato local condition on `T` and `W`); §4.10 (Crystalline extensions and the integral finite preimage); §2.6 (From `V` to `T` and `W`; saturation); §2.15 (Finite against unramified classes at bad primes).

### 4.25 Uniform local annihilation away from `p`

Let `T` be free over `O` with `V = T[1/p]` and `V^c ≃ V^*(1)` (conjugate Tate self-duality, `c` an automorphism of `F` of order at most two), and let `Σ` be a finite set of finite places of `F` not above `p` such that, for every `w ∈ Σ, H⁰(F_w, V) = 0` and `H⁰(F_w, V^*(1)) = 0`. Prove that there is `m_Σ ≥ 0` depending only on `T` and `Σ` such that for every saturated `S` of §4.24 and every `m > m_Σ`, the localisation of `λ^{m_Σ}S(m)` at every `w ∈ Σ` is zero. Explicitly, at such `w` local duality gives `H²(F_w, V) = H⁰(F_w, V^*(1))^∨ = 0` and the away-p Euler characteristic gives `H¹(F_w, V) = 0`; hence the finite groups `H¹(F_w, T)` and `H²(F_w, T)_tors` are killed by `λ^{m_w}` for some `m_w`, the coefficient long exact sequence kills the finite-level `H¹(F_w, T/λ^m)` image by `λ^{2m_w}`, and `m_Σ = max_{w∈Σ} 2m_w`.

The vanishing hypotheses hold when `V` is pure of weight `−1` at every `w ∈ Σ` in the Weil–Deligne sense: purity of weight `−1` excludes the Frobenius eigenvalue `1` on the monodromy-invariant part of `V^{I_w}` and of `V^*(1)^{I_w}`, which is the form in which Liu–Tian–Xiao–Zhang–Zhu use it. The theorem is stated with the two `H⁰`-vanishings, which are what the argument consumes; no assertion is made at `p` or at archimedean places.

Prove this as follows. Local Tate duality for `V` (ArithmeticGaloisDuality Layer R02.4, through §R02.4.2 and §D7.6) gives `H² = 0` from the `H⁰`-vanishing of `V^*(1)`; the local Euler characteristic of `V` at `w ∤ p` is zero (ArithmeticGaloisDuality §R02.4.4, local form, and §2.14), so `H¹(F_w, V) = 0`. Finiteness of the integral `H¹` and of the torsion of `H²` follows from the rational vanishing and the coefficient long exact sequence (ArithmeticGaloisDuality §R02.1.3, *Rationalisation of lattice cohomology*); take `m_w` to kill both, then use `T → T → T/λ^m`.

(Liu–Tian–Xiao–Zhang–Zhu, Proposition 2.4.6(2) and its proof, pp. 130–131.)

**Checks.**

- `Σ = ∅` gives `m_Σ = 0` and no condition.
- `V = ℚ_p(1)`, of weight `−2: H⁰(F_w, V^*(1)) = H⁰(F_w, ℚ_p) = ℚ_p ≠ 0` at every `w ∤ p`, and `V` is not conjugate Tate self-dual. The Kummer uniformizer spans `H¹(F_w, ℚ_p(1)) ≅ ℚ_p`, refuting the stronger intermediate vanishing `H¹(F_w, V) = 0` without its hypotheses; its classes in `H¹(F_w, μ_{p^m})` have order `p^m`, so all finite-coefficient local cohomology has no uniform annihilator.
- For the same `V` and `T = ℤ_p(1), H¹_f(F_w, V) = H¹_ur(F_w, V) = 0`. The integral finite preimage is the finite p-primary roots-of-unity part of local Kummer cohomology, killed by `p^{ord_p(q_w−1)}`. Global finite Selmer localizations land there and their reductions remain uniformly killed. The uniformizer lies outside this finite condition and gives no counterexample to the stated finite-Selmer-image conclusion.
- For an elliptic curve `E` with good reduction at `w ∤ p, V = V_pE` is pure of weight `−1` and `V^*(1) ≅ V` by the Weil pairing; `H⁰(F_w, V) = 0` because the Frobenius eigenvalues have absolute value `q_w^{1/2} ≠ 1`, and `m_w` is governed by the p-part of `E(F_w)_tors`.

*Needs:* §4.24 (Global finite Selmer reductions and conjugation); §2.14 (Dimensions of unramified classes); ArithmeticGaloisDuality §D7.7.2 (Compatibility of the local pairings for `T, V, W` and `W_M`); ArithmeticGaloisDuality Layer R02.4; ArithmeticGaloisDuality §R02.1.3 (*Rationalisation of lattice cohomology*).

### 4.26 Elliptic Bloch–Kato and classical Selmer vanishing

**Elliptic tangent, exponential and descent comparison.** For every finite `K/ℚ_p` and elliptic curve `E/K`, with `V = V_pE` in the homological convention, prove that `V` is de Rham and `D_dR(V)/Fil⁰ ≃ Lie(E/K)`, functorially in `E` and under finite extensions of `K`. Prove that on a sufficiently small open lattice in `Lie(E/K)`, the Bloch–Kato exponential of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3 equals the rational Kummer map composed with the formal-group exponential; after rationalizing the p-adic completion of `E(K)`, the logarithm is the inverse tangent identification. Prove `D_cris(V)^{φ=1} = 0`, so `H¹_e(K,V) = H¹_f(K,V)`. Prove that these maps and equality of Kummer and finite images descend through every finite Galois `L/K`, including ramified and p-power degree extensions, by restriction/invariants and corestriction/trace over `ℚ_p`.

Use NeronModelsAndSemistableAbelianVarieties §5.3 (`AbelianVariety.deRham`, `PadicComparison`, finite-extension descent), §§3.10, 3.13–3.14 (potential semistability and full Raynaud `1`-motive), and AbelianSchemesAndArithmeticModuli §A4.3 (degree-one de Rham and vector-extension comparison). Their crystalline and de Rham statements concern the carriers `dCris`, `dDeRham`, `IsCrystalline` and `IsDeRham` supplied by PadicPeriodRings §§4.2–4.3 through the finite-K comparison contracts of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5; only the homological Tate-module convention is matched here. Over a semistable splitting field, apply the semi-abelian logarithm and period-boundary calculation of Bloch–Kato Example 3.10.1, diagram (3.10.2), pp. 359–360, to the Raynaud uniformization, including the lattice contribution, to obtain the tangent and exponential diagram of Example 3.11. The `φ`-fixed crystalline subspace vanishes: the toric part has nonunit Frobenius eigenvalues, the abelian part has no eigenvalue one by the Weil bounds, and the uniformizing lattice contributes through monodromy rather than a `φ`-fixed vector in `ker N`. This gives `H_e = H_f` by the fundamental sequence. Descent uses the supplied de Rham descent and finite-group cohomology of `ℚ_p`-spaces; averaging is available even for p-power degree, and rationalized Kummer images descend by restriction/corestriction. No good-reduction, unramified-base or small-weight assumption is imposed.

(Bloch–Kato, Examples 3.10.1 and 3.11, diagrams (3.10.2) and (3.11.1), printed pp. 359–361; NeronModelsAndSemistableAbelianVarieties §5.3, Coleman–Iovita comparison and Fontaine finite-extension descent locators.)

**Checks.**

- Good ordinary reduction over ramified `K`: the formal logarithm identifies the one-dimensional K-tangent quotient; no Fontaine–Laffaille weight bound is used.
- Good supersingular reduction over ramified `K` gives the same tangent/Kummer identification without an ordinary filtration.
- Split multiplicative reduction `E_q`: retain the Tate extension and uniformizing lattice; `D_cris(V)^{φ=1} = 0` although `V` has a trivial quotient.
- Potentially semistable additive reduction over ramified `K`: establish the diagram over a semistable Galois extension and descend, including when `p` divides its degree.

For `E/F` and `V=V_p E`, identify `H¹_f(F_v,V)` with `(lim_m E(F_v)/p^m E(F_v))⊗_ℤpℚ_p` under Kummer at every finite place; at `v∤p` this space is zero, and the propagated finite condition on `E[p∞]` is zero; finite `E[p^m]` Kummer conditions can still retain Tamagawa contributions. Globally the rational finite Selmer group is (`lim_m Sel_(p^m)(E/F)`, with multiplication-by-p coefficient transitions)`⊗ℤpℚ_p`, equivalently `T_p Sel_(p∞)(E/F)⊗ℤpℚ_p`, and `H¹_f(F,V)=0` iff the classical `p∞` Selmer group is finite (equivalently its `ℤ_p`-corank is zero). The Weil pairing gives `V*(1)≃V`, so its Tate-dual finite Selmer group vanishes under the same hypothesis. No finiteness of the full Tate–Shafarevich group is inferred.

Stable Tate module and the finite-level Kummer/Selmer exact sequences of TauCetiRoadmap.EllipticCurves Layer 7. At `p` use the tangent, exponential and descent comparisons above, with their geometric suppliers.

Prove this as follows. Import the finite-level elliptic Kummer and Selmer/Sha sequences from TauCetiRoadmap.EllipticCurves Layer 7. Use the elliptic tangent/exponential comparison and `H_e = H_f` above at `p` and the away-p rational unramified dimension calculation; distinguish rational zero from finite torsion Kummer images. Pass to the Tate-module limit and rationalization; compact Selmer finiteness gives finite rank, so rational zero iff the discrete classical group has corank zero and hence is finite. Apply the Weil pairing for the dual.

(Bloch–Kato, Example 3.11, pp. 359–361; Burungale–Tian (arXiv v2), §3.1, preprint pp. 5–6; Skinner (author preprint), §2.2.1, preprint p. 8; Rubin (1999 draft), Chapter I, §6.4 (Abelian varieties), display (9) and Remark 6.6, printed pp. 16–17 (PDF pp. 26–27).)

**Checks.**

- Rational local finite cohomology is zero away from `p`, but finite p-torsion Kummer images need not be zero.
- The Weil pairing identifies the Tate dual with `V`, so both rational finite Selmer vanishings are obtained together.
- Corank zero implies finiteness of the p-primary Selmer group, not the full Sha group at every prime.
- The torsion discrete `Sel_(p∞)` tensor `ℚ_p` is zero regardless of corank, so it cannot be the rational finite Selmer group.

*Needs:* §2.12 (Passage from finite elliptic Selmer groups to `p^∞`); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P3–R07.P5 (period boundary and realizations); §4.9 (The Bloch–Kato local condition on `T` and `W`); §2.18 (Selmer groups of `T` and `W` as limits); TauCetiRoadmap.EllipticCurves Layer 7; NeronModelsAndSemistableAbelianVarieties §§3.10, 3.13–3.14, 5.3; AbelianSchemesAndArithmeticModuli §A4.3.

### 4.27 Finite-image adjoint Selmer finiteness with descent errors

Let `ρ` be a finite-image characteristic-zero representation over `E` with stable lattice, `L/F` its finite Galois splitting field, and `A=ad⁰(ρ)⊗E/O`. The finite-condition Selmer group `Sel_f(F,A)` is finite. Restriction maps it into the everywhere-unramified `Hom` of the finite p-class group of `L` with `A`; the restriction kernel is a subgroup of `H¹(Gal(L/F),A)`, which is finite. This proves finiteness even when `p` divides `[L:F]`. A canonical quotient of the class group is not asserted: the actual target is a Galois-equivariant `Hom` group with finite group-cohomology errors. Under prime-to-p degree and compatible unramified propagated conditions, restriction/invariants give the sharper class-group-`Hom` identification.

Finite-image `ρ`; finite-dimensional `ad⁰` and propagated rational finite conditions. Odd irreducible rank-two Artin over `ℚ` is the source’s worked case; modularity is not needed for the finiteness argument.

Prove this as follows. Over `L` the representation is trivial and its rational finite condition is unramified at every finite place, including `p`; restriction of propagated finite classes therefore lands in unramified discrete classes. Use TauCetiRoadmap.ClassFieldTheory Layer 11 for reciprocity and norm compatibility, and Layers 12–13 for existence and the Hilbert-class-field/maximal-unramified identification, to factor those classes through `Cl_L[p∞]`, giving a finite `Hom` group. Inflation–restriction gives the finite kernel: finite group cohomology of a finite-`corank E/O` module is finite and killed by `|Gal(L/F)|`. Include these errors when the degree has a p-part.

(Calegari–Geraghty–Harris (arXiv v1), §2, preprint p. 4 (published Appendix A §A.2, pp. 883–884).)

*Needs:* §4.9 (The Bloch–Kato local condition on `T` and `W`); §2.25 (Selmer vanishing descends under injective restriction); ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*); TauCetiRoadmap.ClassFieldTheory Layers 11–13.

### 4.28 Parity of Selmer ranks in self-dual ordinary families and under quadratic twist

This subsection proves the Selmer-complex half of Nekovář's parity theorem: in a family of self-dual ordinary Galois representations the parity of the Selmer rank is constant, and over a `2`-abelian extension it decomposes along characters. Throughout, `p` is odd, `E` is a number field and `S` contains `p∞` and the coefficient ramification. At `v | p` use the strict ordinary complex `U_v^+(X) = C_cont(G_v,X_v^+)` with its inclusion into `C_cont(G_v,X)`; at the other finite places use the unramified complex `C_cont(G_v/I_v,X^{I_v})`. At archimedean places use `U_v^+=0` into `C_v^mod`. Every `RΓ_f` in this subsection uses this modified arithmetic diagram of §2.21, represented here by its finite-place model. The inertia-kernel condition of §2.8 requires its separate correction and is not substituted for this complex. Write `h¹_f(E,X)` for the dimension of its `H¹` for rational `X`; comparison with Bloch–Kato uses §4.12 and the `H⁰` correction of §2.22 (Nekovář Proposition 12.7.13.3(iii)).

**The skew-symmetric generalized Cassels–Tate pairing.** Let `O` be a DVR with fraction field `𝒦` of characteristic zero and `2 ∈ Oˣ`. Coefficients are either finite free continuous O-lattices for `O` the integers in a finite extension of `ℚ_p`, or finite-type admissible localized coefficients in ArithmeticGaloisDuality §D7.5, *Duality after localising the coefficients*, arising from a complete Noetherian local ring with finite residue field; cochains in the latter case are filtered colimits over finite-type submodules of that base ring, not cochains for an invented O-adic topology. Let `X` be finite free over `O` with a perfect equivariant skew-symmetric pairing `π : X ⊗_O X → O(1)`. Assume its global and modified local cochain complexes and `U_v^+` are perfect, that `X_v^+` at `p` is a stable O-direct summand equal to its orthogonal, and that every local error `Err_v` of ArithmeticGaloisDuality §D7.7.3 on this diagram is acyclic. Include the orthogonality nullhomotopies and their transposition data from ArithmeticGaloisDuality §§D7.7.3–D7.7.5. Prove: for `C = RΓ_f^mod(E,X)`, cup product with `π` followed by the arithmetic compact-support trace `RΓ_c(E,O(1)) → O[−3]` gives a pairing `C ⊗^L_O C → O[−3]` and an isomorphism

```text
C ≃ RHom_O(C,O)[−3].
```

The coefficient Tate twist has been consumed by the trace. The pairing transposes by the signed swap with coefficient sign `c = −1`; its Bockstein pairing on `H²(C)_tors` is O-bilinear, nondegenerate and skew-symmetric, hence alternating since `2` is a unit. No Galois action or extra Tate twist is attached to the final O-module dual. The Iwasawa involution in §3.12 is a separate convention.

Prove this by the error triangle of ArithmeticGaloisDuality §D7.7.4, using the strict ordinary adjoints of ArithmeticGaloisDuality §D7.7.5, then the abstract Bockstein construction with its transposition homotopies. Perfectness and localized duality are used with their actual coefficient contracts.

(Nekovář, Theorem 6.3.4, pp. 142–143; Proposition 10.2.5, p. 306; Theorem 10.4.4, pp. 321–322; Proposition 12.7.13.4(iv), pp. 485–486.)

**Checks.**

- Torsion-free `H²(C)` gives a pairing on zero; free `H¹(C)` can nevertheless be nonzero.
- A nondegenerate alternating torsion pairing has paired elementary divisors. A symmetric pairing `x·y` on `O/ϖ` can have odd length and supplies no parity constraint.
- Nonacyclic `Err_v` must remain in the error triangle; a Tamagawa error can make the torsion pairing degenerate.
- The coefficient target `O(1)` and degree-three trace give an untwisted O-module dual; inserting another `(1)` does not describe this adjoint.

**Symplectic filtration of a skew-Hermitian module.** Let `O` be a DVR with fraction field `𝒦`, uniformizer `ϖ`, residue field `k` and `2 ∈ Oˣ`. Let `N` be of cofinite type over `O` with an O-bilinear skew-symmetric form `N × N → 𝒦/O` whose left and right radicals are `N_div`, the maximal O-divisible submodule. Equivalently the induced form on the finite-length quotient `N/N_div` is perfect alternating. Prove that `F^j = N[ϖ] ∩ ϖ^{j−1}N` has nondegenerate alternating k-bilinear forms on gr`^j F, F^∞ = ∩_j F^j = N[ϖ] ∩ N_div`, and `dim_k N[ϖ] ≡ dim_k F^∞ (mod 2)`. Trivial involution is used: `b`(ax,by) `=` ab `b(x,y)`. Construct the graded pairing by choosing lifts `x,y` in `N[ϖ^j]`, multiplying `b(x,y)` by `ϖ^{j−1}`, and identifying `ϖ^{−1}O/O` with `k` to obtain the form on `ϖ^{j−1}x, ϖ^{j−1}y`; check independence of lifts and that its radical is `F^{j+1}`.

(Nekovář, Lemma 10.6.5, pp. 326–327, trivial involution and `ε = 1`.)

**Checks.**

- `N = 𝒦/O` with the zero form: `N = N_div` and `F¹ = F^∞` is one-dimensional.
- `N = (O/ϖ)²` with the standard symplectic form: `gr¹` has dimension two and `F^∞ = 0`.
- `O` the unramified quadratic extension of `ℤ₃, k = 𝔽₉, N = k: b(x,y) = j(xy³−x³y)`, with `j : k ≃ (𝒦/O)[3]`, is biadditive alternating with zero radical but not O-bilinear. Its dimension one violates the parity conclusion, so it is excluded.
- `O/ϖ²` has even length but `dim_k N[ϖ] = 1`; even length alone cannot replace a perfect alternating pairing. A nondegenerate symmetric form on `O/ϖ` also fails the parity conclusion.

**Algebraic specialization parity.** Let `O` be a DVR with `2 ∈ Oˣ`, fraction field `𝒦` and residue field `k`. Let `C` be a perfect cohomological O-complex with a perfect degree-three pairing `C ⊗^L C → O[−3]`, a skew adjoint under the signed transpose and the transposition homotopies of the abstract Cassels–Tate construction. Assume `H⁰(C ⊗^L_O k) = 0`. Prove:

```text
dim_k H¹(C ⊗^L_O k) ≡ dim_𝒦 H¹(C ⊗_O 𝒦)  (mod 2).
```

The coefficient triangle gives `H¹(C)[ϖ] = 0` and
`0 → H¹(C)/ϖ → H¹(C ⊗^L k) → H²(C)[ϖ] → 0`.
Thus `H¹(C)` is finite free. The Bockstein form on `H²(C)_tors` is perfect alternating, so its elementary divisors occur in equal pairs: equivalently apply the filtration theorem to this finite-length module. This makes `dim_k H²(C)[ϖ]` even and proves the congruence.

Also give the coefficient comparison
`0 → H¹(C) ⊗ (𝒦/O) → H¹(C ⊗^L (𝒦/O)) → H²(C)_tors → 0`.
Its first term is precisely the maximal divisible submodule of the middle term: it is divisible, the quotient has finite length, and any divisible submodule maps to zero in that quotient. The finite quotient is `H²(C)_tors`, whose pairing can be transported; the full middle term is not the dual of a finite torsion module. When applied arithmetically this triangle uses derived coefficients and the base-change comparison below.

(Nekovář, §§10.1–10.2, pp. 300–307; Lemma 10.6.5, pp. 326–327; Proposition 12.7.13.4 and Corollary 12.7.13.5, pp. 485–487.)

**Checks.**

- `C = O` in degrees one and two with zero differential, paired by evaluation with the prescribed degree-three skew transpose: `H¹` is free of rank one, `H²` is torsion-free and discrete `H¹` is `𝒦/O`, although `H²_tors = 0`.
- A paired torsion summand `(O/ϖ^a)²` contributes dimension two to `H²[ϖ]`, for every `a ≥ 1`; parity uses the number of elementary divisors rather than just their total length.
- If `H⁰(C ⊗^L k)` is nonzero, the argument establishing freeness of `H¹` no longer applies and the `H⁰` correction must be retained.

**Arithmetic realization and common local-condition base change.** Let `R` be a complete Noetherian normal local domain of characteristic zero, with finite residue field of characteristic `p`, equipped with the dualizing coefficient contract of ArithmeticGaloisDuality §D7.5. Let `𝒦_R = Frac R` and `𝒱` be a finite-dimensional admissible localized `𝒦_R`-representation of `G_{E,S}`, with a fixed nondegenerate equivariant skew pairing `π : 𝒱 ⊗ 𝒱 → 𝒦_R(1)`. Specify once and for all its generic ordinary summands `𝒱_v^+` and generic local-condition diagram, including restriction maps and orthogonality/transposition homotopies. For each height-one `P` under consideration, `O_P = R_P` is a DVR with `k(P)` of characteristic zero; supply an admissible finite-type R-lattice `T_R(P) ⊆ 𝒱` and stable finite-type local submodules whose localizations `T(P), T(P)_v^+` are finite free and direct summands, respectively. Require `T(P) ⊗ 𝒦_R = 𝒱` and `T(P)_v^+ ⊗ 𝒦_R = 𝒱_v^+` as subrepresentations with their specified local maps. A scalar multiple of the common generic skew pairing must restrict to a perfect pairing `T(P) ⊗ T(P) → O_P(1)`, with self-orthogonal `T(P)_v^+` and the compatible homotopies. For every twist `β` used below, assume the global, local and strict ordinary cochain models over `R` are perfect; their localizations are the ind-admissible cochains of ArithmeticGaloisDuality §D7.3, not cochains for the maximal-ideal topology on `R_P`.

For a quadratic or trivial character `β` with values in `Rˣ`, set `V_P = T(P)`/PT`(P)`. Impose (A1) `H⁰(E,V_P ⊗ β) = 0` and (A2): at every `w ∤ p∞` in `S`, both `C_cont(G_w,X ⊗ β)` and `C_cont(G_w/I_w,(X ⊗ β)^{I_w})` are acyclic for `X = T(P), V_P, 𝒱`. Define `C_P` as the modified arithmetic fibre with these strict ordinary/unramified conditions and zero archimedean conditions. Prove that `C_P` is perfect and there are canonical comparisons

```text
C_P ⊗^L_{O_P} k(P) ≃ RΓ_f(E,V_P ⊗ β),
C_P ⊗_{O_P} 𝒦_R ≃ RΓ_f(E,𝒱 ⊗ β),
C_P ⊗^L_{O_P} (𝒦_R/O_P) ≃ RΓ_f(E,T(P) ⊗ β ⊗ (𝒦_R/O_P)).
```

For the last comparison use the derived-propagated local diagram of the coefficient triangle, not an independently selected `H¹` condition. Include the global and every local base-change map, the homotopies commuting with localization and inclusion, and the transported orthogonality/transposition homotopies. At `p` the exact coefficient sequences for the direct summands give reduction compatibility; localization follows from the ind-admissible cochain comparison of Nekovář §3.7. Away from `p` (A2) identifies the relevant integral, residual and generic diagrams with zero, so no unproved base change of inertia invariants is used. Construct the divisible-coefficient comparison from `O_P → 𝒦_R → 𝒦_R/O_P`. Mapping fibres preserve these comparisons. Use ArithmeticGaloisDuality §D7.7.5 for the strict ordinary adjoints and (A2) elsewhere, and apply ArithmeticGaloisDuality's localized duality contract and ArithmeticGaloisDuality §D7.7.4 to obtain the degree-three skew duality. The injection `H⁰(C_P ⊗^L k(P)) ↪ H⁰(E,V_P ⊗ β)`, together with (A1), supplies the `H⁰` hypothesis of the algebraic theorem.

(Nekovář, Propositions 3.4.2–3.4.4, pp. 83–84; §3.7, pp. 93–94; Proposition 5.6.3, p. 130; §§6.7.1–6.7.6, pp. 151–153; Proposition 12.7.13.4(i)–(iv), pp. 485–486.)

**Checks.**

- In a symplectic generic plane, the distinct lines `𝒦_Re₁` and `𝒦_Re₂` are both Lagrangian. Lattices inducing these different lines cannot satisfy the common generic local-condition datum.
- A nonzero local specialization cone is a failure of the comparison hypothesis; an isomorphism of `H¹` images alone cannot replace a quasi-isomorphism of diagrams.
- For `O_P` with characteristic-zero residue field, `2` is a unit; its cochains still come from the complete R-coefficient contract, not from treating `k(P)` as a finite residue field.
- A strict ordinary complex `C(G_v,T(P)_v^+)` carries the proven adjoint; replacing it by an inertia-kernel condition requires its additional error comparison.

**Parity is constant in a self-dual ordinary family.** For two points `P,P′` of the common arithmetic datum just specified, satisfying all its hypotheses for the same `β`, prove:

```text
h¹_f(E,V_P ⊗ β) ≡ dim_{𝒦_R} H¹_f(E,𝒱 ⊗ β) ≡ h¹_f(E,V_{P′} ⊗ β)  (mod 2).
```

Apply the base-change comparison and the algebraic specialization parity at each point. The generic complex is common because its local-condition maps and homotopies are common. The finite quotient of the discrete `H¹` coefficient comparison, rather than its full module, carries the transported torsion pairing.

(Nekovář, §12.7.12, (12.7.12.1)–(12.7.12.2), pp. 482–483; Proposition 12.7.13.4 and Corollary 12.7.13.5, pp. 485–487.)

**Checks.**

- `P = P′` gives the same specialization congruence with the common generic rank.
- A non-quadratic `β` pairs a twist with its inverse twist and does not supply a skew form on that single twist.
- Without (A1), retain the `H⁰` terms; the asserted freeness and parity proof do not apply.

**Parity under a `2`-abelian extension.** For a finite abelian extension `E′/E` of exponent two with character group `A` and `V = V_P` as above (or any self-dual `V` with the specified local-condition complexes, their Shapiro compatibility and degree-three duality for each `α ∈ A`), prove `H¹_f(E′, V) ≅ ⊕_{α∈A} H¹_f(E, V ⊗ α)`, and hence `h¹_f(E′, V) = Σ_{α∈A} h¹_f(E, V ⊗ α)`. Prove this as follows. Shapiro's lemma for Selmer complexes and the character decomposition of the induced coefficients (§3.6 for the semilocal terms; TauCetiRoadmap.ProfiniteCohomology Layer 7). The characters take the values `±1` and `2` is invertible in the coefficients, so the decomposition holds without enlarging the coefficient field.

(Nekovář, Proposition 12.5.9.2(iv), pp. 450–451; §12.10.1, p. 521.)

**Checks.**

- `E′ = E: A` is trivial and the formula is an identity.
- `E′/E` quadratic with character `η: h¹_f(E′, V) = h¹_f(E, V) + h¹_f(E, V ⊗ η)`, so the parity can change, by the parity of `h¹_f(E, V ⊗ η)`.
- `E′/E` biquadratic with quadratic characters `η₁, η₂: h¹_f(E′, V)` is the sum of the four terms for `1, η₁, η₂` and `η₁η₂`, each computed over the original coefficient field.

**Parity under an odd-degree abelian extension.** Let `E′/E` be a finite abelian extension of odd degree `n` with character group `A`, with `S` containing its ramification. Let `V` be a finite-dimensional representation over a field `𝒦` of characteristic zero (`V_P` above, or a representation over a finite extension of `ℚ_p`) with a nondegenerate equivariant skew pairing `V ⊗ V → 𝒦(1)`, stable subspaces `V_v^+` at `v | p` equal to their orthogonals, and the strict ordinary and unramified local-condition complexes of this subsection with their Shapiro compatibility. For every `α ∈ A` assume the degree-three duality of ArithmeticGaloisDuality §D7.7.4 between `RΓ_f(E, V ⊗ α)` and `RΓ_f(E, V ⊗ α^{−1})`, with the strict ordinary adjoints of ArithmeticGaloisDuality §D7.7.5; over a characteristic-zero coefficient field the unramified errors at `w ∤ p` vanish (Nekovář §7.8.4.5). Assume `H⁰(E′, V) = 0`. Prove `h¹_f(E, V ⊗ α) = h¹_f(E, V ⊗ α^{−1})` for every `α ∈ A`, and `h¹_f(E′, V) ≡ h¹_f(E, V) (mod 2)`.

Prove this as follows. Let `𝒦′ = 𝒦(μ_n)`, so that every `α ∈ A` takes values in `𝒦′^×`. Continuous cochains commute with the finite flat extension `𝒦 → 𝒦′`, so each dimension over `𝒦` equals the corresponding dimension over `𝒦′`; no condition on `n` beyond oddness is used. Over `𝒦′`, Shapiro's lemma and the character decomposition give `RΓ_f(E′, V) ⊗ 𝒦′ ≃ ⊕_{α∈A} C_α` with `C_α = RΓ_f(E, V ⊗ α)`. Also `H⁰(E′, V) ⊗ 𝒦′ = ⊕_{α∈A} H⁰(E, V ⊗ α)`, so every `H⁰(E, V ⊗ α)` vanishes. Hence `H⁰(C_α) = 0`, through the injection `H⁰(C_α) ↪ H⁰(E, V ⊗ α)`, and `H³(C_α) ≅ H⁰(C_{α^{−1}})^∨ = 0` by duality. Since `p` is odd, `G_{E,S}` and every `G_v` have p-cohomological dimension at most two; the archimedean groups have odd-p cohomological dimension zero. Thus `C_α` has amplitude `[0,3]`. The Euler characteristic formula for these local conditions gives

```text
χ(C_α) = Σ_{v|∞} dim (V ⊗ α)^{G_v} − Σ_{v|p} [E_v : ℚ_p] dim V_v^+.
```

An odd-order `α` is trivial on every real decomposition group. Each complex conjugation acts on `V` with isotropic `±1`-eigenspaces, hence of dimension `(dim V)/2` each, and `dim V_v^+ = (dim V)/2`. Thus `χ(C_α) = (r₁ + 2r₂ − [E : ℚ])(dim V)/2 = 0`. With the vanishing end groups this gives `h¹(C_α) = h²(C_α)`, and duality gives `h²(C_α) = h¹(C_{α^{−1}})`. The nontrivial characters pair off as `α ≠ α^{−1}`, which proves the congruence.

(Nekovář, §7.8.4.5 and §7.8.5, p. 185; Theorem 7.8.6 and Corollary 7.8.7, pp. 185–186; Proposition 7.8.11 and its proof, pp. 187–188, where simplicity of `V` supplies the vanishing `H⁰`-terms; §12.10.1, p. 521, for the splitting coefficient field and the pairing of `α` with `α^{−1}`.)

**Checks.**

- At a complex place `G_v=1`, and at a real place `G_v=C₂`. For odd `p` both have p-cohomological dimension zero: higher cohomology vanishes, while ordinary `H⁰` can be nonzero. This preserves the amplitude bound without discarding the archimedean `H⁰` Euler terms.
- The degree-three dual pair `C_α = 𝒦′` in degrees `0` and `1` and `C_{α^{−1}} = 𝒦′` in degrees `2` and 3, with zero differentials, has Euler characteristic zero on both sides but `h¹` equal to `1` and `0`. Duality and the Euler characteristic give only `h¹(C_α) − h¹(C_{α^{−1}}) = h⁰(C_α) − h⁰(C_{α^{−1}})`, so the `H⁰` hypothesis cannot be dropped.
- `E = ℚ, p` odd, `α` a cubic character of prime conductor `ℓ ≠ p, 𝒦 ⊇ μ₃, V = 𝒦(α^{−1}) ⊕ 𝒦(α)(1)` with the hyperbolic skew pairing and `V_p^+ = 𝒦(α^{−1})`. Then `H⁰(ℚ, V) = 0` but `V ⊗ α` has the trivial line inside its ordinary summand. So `h⁰(C_α) = 1, h⁰(C_{α^{−1}}) = 0`, and `h¹_f(ℚ, V ⊗ α) = h¹_f(ℚ, V ⊗ α^{−1}) + 1`. Thus `h¹_f(E′, V) − h¹_f(ℚ, V)` is odd: `H⁰`-vanishing for the untwisted `V` does not suffice, and here `H⁰(E′, V) ≠ 0`.
- If `V` is simple, `H⁰(E′, V) = 0` holds automatically. A nonzero `V^{G_{E′}}` would be `G_E`-stable, hence all of `V`, with `G_E` acting through a finite quotient, which the pairing into `𝒦(1)` excludes. For `E′/E` cyclic cubic this gives `h¹_f(E′, V) ≡ h¹_f(E, V) (mod 2)`, computed over `𝒦(μ₃)` even when `𝒦` does not contain `μ₃`.

**Ordinary modular forms.** Let `f` be a cuspidal newform over `ℚ` of even weight `k` with trivial nebentypus, `λ | p` with `p` odd, `f` ordinary at `λ`, and `V = V_λ(f)(k/2)` in Nekovář's self-dual convention. Suppose `V = V_P` and `P′` is a second arithmetic point of a self-dual ordinary family with `P` and `P′` carrying the common local diagram and coefficient realization above. Prove `h¹_f(ℚ,V_P) ≡ h¹_f(ℚ,V_{P′}) (mod 2)` when the realization hypotheses, (A1) and (A2) hold for `β = 1` at both points. For a specified quadratic extension `F/ℚ` with character `η_F`, enlarge `S` to include its ramification and impose the same realization hypotheses, (A1) and (A2) also for `β = η_F` at both points. Then `h¹_f(F,V_P) ≡ h¹_f(F,V_{P′}) (mod 2)`. Apply family parity separately to `1` and `η_F`, then the `2`-abelian decomposition. The family and its lattices are data; the theorem applies to every quadratic `F` for which these two twisted contracts are supplied.

(Nekovář, Proposition 12.7.14.4(iii), pp. 492–493, for Hilbert modular forms; Proposition 12.7.13.3 and Corollary 12.7.13.5, pp. 484–487, for the finite-order twists.)

**Checks.**

- Rank one at `P` forces odd rank at `P′` under the `β = 1` contract.
- For quadratic `F`, untwisted hypotheses alone do not discharge the `η_F` contract; its ramification must be included in `S`.
- Nonordinary `f` supplies no required ordinary direct summand, so the hypotheses fail.
- These are Selmer dimensions; no order of vanishing of an L-function is inferred.

*Needs:* ArithmeticGaloisDuality §§D7.7.3–D7.7.5 (local-condition diagrams, nullhomotopies and strict ordinary adjoints); §§2.21–2.22 (mapping fibres and `H⁰` correction); §3.6 (semilocal Shapiro); §4.12 (finite/ordinary comparison); ArithmeticGaloisDuality §R02.4.4 (*Cohomological dimension of `G_{K,S}`*; *Tate's global Euler characteristic formula*); ArithmeticGaloisDuality §D7.3 (*Admissible compact and cofinite coefficients*; *Continuous cochains in the derived category*; *Cohomological finiteness and perfect amplitude*), §D7.5 (*Duality after localising the coefficients*); TauCetiRoadmap.ProfiniteCohomology Layer 7.

### 4.29 Two-primary Selmer parity for congruent-number curves

For positive squarefree `n` let `E_n` be the elliptic curve `y² = x³ − n²x` over `ℚ` (isomorphic to `n y² = x³ − x` by `(X, Y) = (nx, n²y)`), with its rational `2`-torsion point `P = (0, 0)` and the `2`-isogeny `φ : E_n → E′_n = E_n/⟨P⟩, E′_n : Y² = X³ + 4n²X`. The endpoint is the parity of the `ℤ₂`-corank of the `2^∞`-Selmer group `Sel_{2^∞}(E_n/ℚ)` (§2.12), which includes the divisible part of `Ш`; it is proved here from the Cassels–Tate pairing, the isogeny Selmer formula and an explicit computation of the local Kummer images of `φ`.

**The cohomological Cassels–Tate pairing and its radicals.** For every abelian variety `A` over a number field `K`, construct the pairing `⟨,⟩_A : Ш(A/K) × Ш(A∨/K) → ℚ/ℤ` on the carriers of §2.12a. No finiteness of Sha or polarization is assumed. For `a ∈ Ш(A/K)[n]`, `b ∈ Ш(A∨/K)[n]`, `n ≥ 1`, choose Kummer cocycles `α, β` with coefficients in `A[n], A∨[n]`. Lift `α` to a global `1`-cochain `α₁` in `A[n²]`; it need not be a cocycle, and `dα₁` lies in the kernel `A[n]`. Local triviality gives local Kummer cocycle lifts `α_{v,1}` in `A[n²]` mapping to `α_v`. Use the intrinsic Weil pairing `A[n] × A∨[n] → μ_n` of AbelianSchemesAndArithmeticModuli §A3.5, followed by `μ_n ⊂ (Kˢ)^×`. Choose `ε ∈ C²(G_K,(Kˢ)^×)` with `dε = dα₁ ∪ β`. It exists by ArithmeticGaloisDuality §R02.4.4's `H³(G_K,(Kˢ)^×) = 0`; no vanishing of `H³(G_K,μ_n)` is used. Fix the sign by

```text
⟨a,b⟩_A = Σ_v inv_v([(α₁,v − α_{v,1}) ∪ β_v − ε_v]).
```

The difference is `A[n]`-valued, and the Leibniz rule makes the displayed expression a local `G_m`-valued `2`-cocycle. Real invariants take values in `½ℤ/ℤ`. Prove this finite-coefficient formula, finite support, independence of cochains, Kummer lifts and `ε`, bilinearity and compatibility for `n | m`, giving the pairing on all Sha. Global changes cancel by reciprocity; local Kummer changes cancel by §2.12a's all-place annihilators. Prove isogeny adjunction: for every isogeny `f : A → B`, `⟨fa,b⟩_B = ⟨a,f∨b⟩_A`.

Prove that the left annihilator of `Ш(A∨/K)[n]` is `n Ш(A/K)` for `n ≥ 1`, and the transposed statement. Finite Poitou–Tate first detects the obstruction to n-division in global `H¹(A)`; §2.12a's global-plus-local decomposition then corrects the finite tuple of local failures by a global `A[n]` class to obtain division in Sha itself. Prove that the full left and right kernels are the respective maximal divisible subgroups, and the same holds on each primary component. With `finiteCotype_primaryDecomposition`, prove that the quotients of `Ш(A/K)[ℓ^∞]` and `Ш(A∨/K)[ℓ^∞]` by their divisible subgroups are finite and perfectly paired. Alternation is not part of this general theorem. The torsor/divisor and Poincaré-biextension constructions and their Brauer–Manin comparisons belong to HeightsRationalPointsAndObstructions §§3.17a–3.17d; their comparisons identify those constructions with this cohomological pairing and its sign.

(Milne, *Arithmetic Duality Theorems*, I, Corollary 4.21, p. 66, Proposition 6.9, pp. 78–79, Remark 6.10(a), p. 79, Theorem 6.13(a), pp. 82–83, and Lemmas 6.15–6.17 and the concluding diagram, pp. 86–89. The global-minus-local sign uses the correction footnote to Proposition 6.9 and the cohomological Leibniz rule.)

**Checks.**

- A single global Brauer cup class has `Σ_v inv_v(res_v c) = 0` by reciprocity, so that construction gives zero rather than the Cassels–Tate pairing.
- `A[n²] → A[n]` need not be onto on `H¹`: its obstruction remains as `dα₁` and is cancelled by `ε`; at real places with even `n`, `H³(G_K,μ_n)` need not vanish.
- A Prüfer summand pairs to zero. For divisible `Ш(A/K)[ℓ^∞]` its reduced quotient is zero, whereas `n = 1` gives the full Sha group as annihilator.
- On `ℤ/ℓ²`, characters of order `ℓ` detect divisibility by `ℓ`, not vanishing; replacing `n Ш` by zero in the annihilator formula fails.
- General principally polarized abelian varieties need not have alternating Cassels–Tate pairing; Poonen–Stoll, Theorem 8 and Corollary 9, pp. 1122–1124, allow a reduced two-primary group of twice-square order.

**The elliptic specialization and alternation.** For an elliptic curve `E/K`, let `A_E` be its abelian variety and `λ_(O) : A_E ≅ A_E∨` the positive principal polarization from the rational divisor `(O)`. In AbelianSchemesAndArithmeticModuli §A2.2's convention it sends `P` to `O([−P] − [O])`. Construct the carrier comparison `e : Ш(E/K) ≅ Ш(A_E/K)`, induced by the point and localization identifications of §2.12a. Define the elliptic pairing by the pullback in the second variable and prove:

```text
⟨a,b⟩_E = ⟨e a, (λ_(O))_* e b⟩_(A_E),   e the carrier comparison.
```

Its cochain sign is the global-minus-local invariant sum above, and its coefficient pairing is `e_n(x, λ_(O)y)`. Transport the supplied Weil-pairing comparison with EllipticCurves Layer 2 through AbelianSchemesAndArithmeticModuli §§A3.5–A3.7, retaining the inversion when replacing `λ_(O)` by `P ↦ O([P] − [O])`; that replacement negates the pulled-back Cassels–Tate pairing. Prove that the elliptic pairing is alternating, with both kernels the maximal divisible subgroup, and for every prime `ℓ` its reduced ℓ-primary group is `T × T` for a finite abelian ℓ-group `T`. The radical statement is the general theorem above; alternation follows from the rational divisor `(O)`, whose polarization obstruction is zero, and the finite alternating perfect pairing gives the product decomposition and square order.

(Milne, I, Remarks 6.10(b)–6.11 and their correction footnotes, pp. 79–81; Poonen–Stoll, Theorem 5, p. 1120, Corollaries 6–7, pp. 1121–1122, and Corollary 9, pp. 1123–1124; Cassels, *Arithmetic on curves of genus 1. IV. Proof of the Hauptvermutung*, J. reine angew. Math. 211 (1962).)

**Checks.**

- If `Ш(E/K)[ℓ^∞]` is divisible, the reduced group is zero and `T = 0`; no unconditional finiteness of the unreduced group follows.
- `Ш(E/K)[2^∞]/Ш(E/K)[2^∞]_div` cannot be `ℤ/2`, since its order is a square. This elliptic conclusion uses `(O)` and does not extend to every principal polarization.
- Replacing `λ_(O)` by its negative negates the pairing; a value `1/3` becomes `2/3`. Changing neither the polarization nor the local cocycle sign leaves the comparison unchanged.

**Selmer corank parity from a rational `2`-isogeny.** Let `K` be a number field, `E/K` an elliptic curve with a K-rational point `P` of order two, `φ : E → E′ = E/⟨P⟩`, and for each place `v` let `φ_v : E(K_v) → E′(K_v)` and `σ_φ(E/K_v) = (−1)^{ord₂`(#`coker φ_v` / #`ker φ_v`)}. Prove that `σ_φ(E/K_v) = 1` for all but finitely many `v`, and

```text
(−1)^{corank_{ℤ₂} Sel_{2^∞}(E/K)} = ∏_v σ_φ(E/K_v).
```

Prove this as follows. The Greenberg–Wiles formula (ArithmeticGaloisDuality §R02.5.1) for `M = E[φ]`, with `M^* = E′[φ̂]` through the `φ`-Weil pairing (derived from `e₂` of TauCetiRoadmap.EllipticCurves Layer 2), local conditions the images of the local Kummer maps `E′(K_v)/φE(K_v) ↪ H¹(K_v, E[φ])`, and their exact annihilators the images for `φ̂` (ArithmeticGaloisDuality §D7.6, *Self-dual isogenies and their local index*), gives Cassels's formula

```text
#Sel_φ(E/K) / #Sel_φ̂(E′/K) = (#E(K)[φ] / #E′(K)[φ̂]) · ∏_v #coker φ_v / #ker φ_v.
```

The exact sequences relating `Sel_φ, Sel_φ̂` and `Sel₂` (the Kummer sequences of `φ, φ̂` and `[2] = φ̂φ`, TauCetiRoadmap.EllipticCurves Layer 7) and the passage from `Sel₂` to `Sel_{2^∞}` (§2.12) express the left side, modulo squares, as `2^{corank}` times the order of `Ш_nd[2^∞]`-contributions, which are squares by the Cassels–Tate pairing.

(Dokchitser, *Notes on the parity conjecture*, Theorem 2.8 and the formula of Cassels following it, p. 9, and (5.4) with Notation 5.3, p. 27; Dokchitser–Dokchitser, *On the Birch–Swinnerton-Dyer quotients modulo squares*, Theorem 4.3, p. 584; Cassels, *Arithmetic on curves of genus 1. VIII*, J. reine angew. Math. 217 (1965).)

**Checks.**

- At a finite place `v ∤ 2` of good reduction, #`coker φ_v =` #`ker φ_v = 2`, so `σ_φ = 1`.
- At a complex place `E′(ℂ)` is divisible, `coker φ_v = 0` and `σ_φ = −1`; the archimedean places contribute signs.
- The formula computes the corank of `Sel_{2^∞}`, not `dim_{𝔽₂} Sel₂`: for `E₁ : y² = x³ − x, Sel₂(E₁/ℚ) ≅ E₁(ℚ)[2] = (ℤ/2)²` while the corank is `0`.

**Local Kummer images for the congruent-number curves.** For a place `v` of `ℚ`, let `I_v(n) ⊆ ℚ_v^×/ℚ_v^{×2}` be the image of `E′_n(ℚ_v)` under `X ↦ X` for `X ≠ 0, O ↦ 1` and `(0, 0) ↦ 4n² ≡ 1`, which is the coboundary of `φ`, so #`I_v(n) =` #`coker φ_v` and #`ker φ_v = 2`. The statement `congruentLocalKummerImage_ncard` in `Suggested.lean` gives the finite-place rows of the following table for `congruentLocalKummerImage`; also prove the real-place row:

```text
v = ∞:             #I_v(n) = 1
v = q odd, q ∤ n:  #I_v(n) = 2
v = q odd, q | n:  #I_v(n) = 2 if q ≡ 1 (mod 4),  1 if q ≡ 3 (mod 4)
v = 2:             #I_v(n) = 4 if n ≡ ±1 (mod 8),  2 if n ≡ ±3 (mod 8),  1 if n is even
```

so `σ_φ(E_n/ℚ_v)` is `−1` at `∞, 1` at odd `q ∤ n`, the Legendre symbol `(−1/q)` at odd `q | n`, and at `2` equals `−1` for `n ≡ ±1` (mod 8) and for `n` even, `+1` for `n ≡ ±3` (mod 8). Prove this as follows. At `∞, X³ + 4n²X ≥ 0` forces `X ≥ 0`, so the image is trivial. At odd `q ∤ n` the curves have good reduction; `φ` is an isomorphism on the formal groups (its degree `2` is prime to `q`) and the reduced isogeny on the finite groups of points of the reductions has kernel and cokernel of equal order, so #`coker φ_v =` #`ker φ_v = 2`. At odd `q | n` and at `2`, decide for each of the finitely many classes `d` whether `d(d²t⁴ + 4n²)` is a nonzero square in `ℚ_v` for some `t ∈ ℚ_v^×`, using that a unit is a square in `ℚ_q` iff it is a square modulo `q`, and in `ℚ₂` iff it is `≡ 1` (mod 8); the answer depends only on `q` mod 4, respectively on `n` mod 8.

(Silverman, *The Arithmetic of Elliptic Curves*, Chapter X, Proposition 4.9, for the coboundary of a `2`-isogeny; Dokchitser, *Notes on the parity conjecture*, §§5.1–5.4, pp. 27–30, for the archimedean and good places. Dokchitser §5.3, Conjecture 5.6, p. 29, proved in §5.7, p. 33, gives `w(E/K_v)=σ_φ(E/K_v)(−2,−b)_v` for `a=0`. Here `b=−n²` and `(−2,n²)_v=1` at every place, so `σ_φ(E_n/ℚ_v)=w(E_n/ℚ_v)`, which gives an independent check against Cowland Kellock–Dokchitser, Theorem 2.3, pp. 4–5, and Appendix `A`, pp. 26–27.)

**Checks.**

- `n = 1, v = 2: I₂(1) = {1, 2, 5, 10}`, of order 4, so `σ_φ(E₁/ℚ₂) = −1 = w(E₁/ℚ₂)`; for instance `X = 2` gives `X³ + 4X = 16`.
- `n = 5: I₂(5) = {1, 5}` and `I₅(5) = {1, 5}`, both of order `2`, so `σ_φ = +1` at `2` and at 5, matching `w(E₅/ℚ₂) = w(E₅/ℚ₅) = +1`.
- `n = 3: I₃(3) = {1}`, so `σ_φ(E₃/ℚ₃) = −1 = (−1/3)`; `n = 6: I₂(6) = I₃(6) = {1}`.

**Two-primary parity.** Prove that for positive squarefree `n`,

```text
corank_{ℤ₂} Sel_{2^∞}(E_n/ℚ) ≡ 0 (mod 2)  if n ≡ 1, 2, 3 (mod 8),
corank_{ℤ₂} Sel_{2^∞}(E_n/ℚ) ≡ 1 (mod 2)  if n ≡ 5, 6, 7 (mod 8).
```

The residues `0` and 4 modulo 8 do not occur for squarefree `n`. Prove this as follows. Multiply the local signs of the previous target in the isogeny parity formula: for `n` odd the product is `(−1) · σ₂(n) · (−1/n)`, which is `+1` for `n ≡ 1`, 3 and `−1` for `n ≡ 5`, 7 (mod 8); for `n = 2m` it is `(−1) · (−1) · (−1/m)`, which is `+1` for `n ≡ 2` and `−1` for `n ≡ 6` (mod 8). The same signs are the global root numbers `w(E_n/ℚ)` (Cowland Kellock–Dokchitser, Theorem 3.40, p. 19), so this is the `2`-parity conjecture for `E_n`; for general `E/ℚ` the `2`-primary case is due to Monsky (Dokchitser–Dokchitser, Theorem 4.19, pp. 593–594). This is a statement about the corank of the infinite Selmer group, which includes divisible `Ш`, not about `dim_{𝔽₂} Sel₂` nor about the Mordell–Weil rank.

**Checks.**

- `n = 1`: the local signs are `−1 (∞)` and `−1 (2)`, product `+1`, even corank; `E₁(ℚ)` has `rank 0` and `dim Sel₂ = 2` comes from rational `2`-torsion.
- `n = 5: −1 (∞), +1 (2), +1` (5), product `−1`, odd corank; 5 is a congruent number (`E₅` has `rank 1`).
- `n = 6: −1 (∞), −1 (2), −1` (3), product `−1`, odd corank; the 3`-`4`-`5 triangle has area 6.

*Needs:* §2.12 (Passage from finite elliptic Selmer groups to `p^∞`); §2.12a (Abelian Kummer, Sha, finiteness and all-place annihilators); §2.11 (Coranks); ArithmeticGaloisDuality §R02.4.4 (*High-degree cohomology of the S-units*); AbelianSchemesAndArithmeticModuli §§A2.2–A2.3, A3.5–A3.7; TauCetiRoadmap.ClassFieldTheory Layer 10; ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*); ArithmeticGaloisDuality §R02.5.1 (*The Greenberg–Wiles formula*); ArithmeticGaloisDuality §D7.6 (*Local abelian-variety duality and gerbe evaluation*; *Self-dual isogenies and their local index*); TauCetiRoadmap.EllipticCurves Layers 2 and 7.

### Examples

For the Tate line `ℚ_p(n), h^(n,n)=1` and `F∞=(−1)^n`, hence `Γ_ℝ(s−n)`. At `s=1` its pole order is one exactly for positive odd `n`. Applying the same calculation to the Tate dual `ℚ_p(1−n)` shows that the critical twists are positive even or negative odd: `n=2` and `n=−1` pass, `n=0` fails. Changing the real Betti sign of the type `(0,0)` line replaces `Γ_ℝ(s)` by `Γ_ℝ(s+1)`, so the pole at zero disappears.

For the crystalline trivial representation, `D_cris=K₀, t_V=D_dR/Fil⁰=0` and `H⁰=ℚ_p`, so `dim_ℚp H¹_f=1`. For `ℚ_p(1), t_V` has dimension one over `K` and `H⁰=0`, giving `dim_ℚp H¹_f=[K:ℚ_p]`. Over a general finite p-adic `K` this factor cannot be dropped. The unit/class sequence gives `ker(X∞⁺→Y∞⁺)=U∞,1⁺/E∞,1⁺`. A rank-zero unit image makes this kernel `U∞,1⁺`, fixing the quotient direction. The curve transformation `(X,Y)=(nx,n²y)` sends `n y²=x³−x` to `Y²=X³−n²X` for `n≠0`. In its `2`-primary Selmer corank the divisible part of Sha remains; a finite `Sel₂` computation does not determine that corank.

### Dependencies

Layers 0, `2`, 3; PadicPeriodRings §§1.1–1.5, `2`–3, 4.1–4.3 (period carriers, functors and fixed fields); FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a (finite-K comparisons, additional sequences, continuous sections, boundary maps and integral predicates), R07.3.3a (filtered Frobenius modules), R07.3.6–R07.3.7, R07.3.10–R07.3.12, R07.3.14, R07.3.16–R07.3.17 (small-weight realization, lattices and admissibility); IntegralIwasawaTheory §§2.1–2.3, 2.7 (class, unit and p-ramified towers and global–local reciprocity); ArithmeticGaloisDuality §§D7.7.2–D7.7.5; and the supplier interfaces: Mathlib `PadicComplex`, `PadicAlgCl`, `PadicComplexInt`, `PadicComplex.isAlgClosed`, `spectralNorm`, `UniformSpace.Completion.map`, `cyclotomicCharacter`, `continuousCohomology`, `BDeRhamPlus`, `BDeRham`, `fontaineThetaInvertP`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.dual`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.finrank_dual_piece`; Tau Ceti `TauCeti.Hodge.HodgeStructureOn.tateTwist`; Tau Ceti `TauCeti.Hodge.tate_hodgeNumber`; Tau Ceti `TauCeti.Hodge.tate`; TauCetiRoadmap.ClassFieldTheory Layers 5, 10–13; TauCetiRoadmap.EllipticCurves Layer 7; TauCetiRoadmap.EllipticCurves Layers 2 and 7; TauCetiRoadmap.LocalFieldsRamification Layer 3; TauCetiRoadmap.LocalGaloisGroups Layer 5; TauCetiRoadmap.ProfiniteCohomology Layer 7; ArithmeticGaloisDuality Layer R02.1; ArithmeticGaloisDuality Layer R02.4; ArithmeticGaloisDuality §D7.6 (*Local abelian-variety duality and gerbe evaluation*; *Self-dual isogenies and their local index*); DerivedModuleAlgebra §1.T.1 (*Mittag-Leffler towers have vanishing `lim¹`*); ArithmeticGaloisDuality §R02.1.2 (*Long exact sequences for continuous cohomology*); ArithmeticGaloisDuality §R02.1.3 (*Rationalisation of lattice cohomology*); ArithmeticGaloisDuality §R02.2.3 (*Restriction and corestriction descent for finite index*); ArithmeticGaloisDuality §R02.4.3 (*Poitou–Tate duality and the nine-term exact sequence*); ArithmeticGaloisDuality §R02.5.1 (*The Greenberg–Wiles formula*); PadicMeasuresIwasawaAlgebras §4.6 (characteristic ideals); PadicMeasuresIwasawaAlgebras §4.6 (isotypic decomposition over `Λ(H × ℤ_p)`); PadicMeasuresIwasawaAlgebras §4.6 (transport of characteristic ideals along semilinear equivalences).
## Downstream consumers

HeightsRationalPointsAndObstructions §§1.0a–1.5 and 3.17a–3.17d consume the abelian Kummer/Sha carriers, all-place annihilators, cohomological Cassels–Tate pairing and radical API of §§2.12a and 4.29. It owns the torsor/divisor and Poincaré-biextension realizations, their comparison with this pairing and the Brauer–Manin applications.

Euler-system arguments for the cyclotomic main conjecture use the completed units, the Kummer and norm compatibilities and the cyclotomic Selmer dictionary (§§0.8, 4.16–4.22). Main-conjecture arguments for ordinary modular forms use the Iwasawa Selmer complexes, corrected specialization, localization surjectivity and the Fitting/characteristic comparison (§§3.8–3.21). Regulator and p-adic Hodge arguments use the finite-condition comparisons (§§4.8–4.12), built on PadicPeriodRings §§1.1–1.5, `2`–3, 4.1–4.3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a. Rank-zero and rank-one Bloch–Kato arguments for elliptic curves use the ordinary structure criteria, the elliptic Selmer comparison and the parity theorems (§§3.18–3.21, 4.26, 4.28–4.29). The Bloch–Kato arguments for Rankin–Selberg motives in the style of Liu–Tian–Xiao–Zhang–Zhu use the torsion-crystalline condition, its small-weight comparisons and the uniform away-p bound (§§4.8–4.11, 4.24–4.25). The adjoint Bloch–Kato argument for finite-image representations uses the restriction and class-group finiteness criterion (§4.27). Global deformation problems use the arithmetic Selmer comparisons and determinant and coefficient fibres of §§2A.1–2A.5.

## References

Locators use the editions below. For Rubin's draft, PDF page is printed page plus ten; for Nekovář, plus nine; for Milne's *Arithmetic Duality Theorems*, plus eight. ArXiv and author-preprint pagination is stated explicitly, and differs from journal pagination.

- Karl Rubin, Euler systems. Author draft of Annals of Mathematics Studies 147 (2000), 1999 Arizona Winter School; printed page = PDF page − 10.
- Barry Mazur; Karl Rubin, [Controlling Selmer groups in the higher core rank case](https://arxiv.org/abs/1312.4052v1). arXiv:1312.4052v1 (14 December 2013); published in J. Théor. Nombres Bordeaux 28 (2016).
- Joaquín Rodrigues Jacinto; Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2). arXiv:2309.15692v2 (19 December 2024); published in Essential Number Theory 4 (2025), 101–216. Locators use the arXiv v2 pagination unless expressly marked as published.
- Ashay A. Burungale; Ye Tian, [A rank zero p-converse to a theorem of Gross–Zagier, Kolyvagin and Rubin](https://arxiv.org/abs/2506.03465v2). arXiv:2506.03465v2 (11 October 2025); Annals of Mathematics 203 (2026).
- David Burns; Matthias Flach, [Motivic L-functions and Galois module structures](https://gdz.sub.uni-goettingen.de/id/PPN235181684_0305). Mathematische Annalen 305 (1996), 65–102; equation (1.9), p. 73, Proposition 1.20 and the ordinary/Tate comparison, pp. 78–80.
- Jan Nekovář, Selmer complexes. Astérisque 310 (2006), Numdam open-access PDF (568 PDF pages; printed page = PDF page − 9).
- Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4). Inventiones Mathematicae 228 (2022), 107–375; version of record.
- Ralph Greenberg, [On the structure of Selmer groups](https://warwick.ac.uk/fac/sci/maths/people/staff/david_loeffler/jhc70/greenberg.pdf). Author preprint, 29 pages; use PDF pagination.
- F. Castella; G. Grossi; J. Lee; C. Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein.pdf). Author preprint dated 10 August 2021, 34 pages; published Inventiones Mathematicae 227 (2022).
- F. Calegari; D. Geraghty; M. Harris, [Bloch–Kato conjectures for automorphic motives](https://arxiv.org/pdf/1907.08694v1). Companion appendix preprint, 10 pages, to Modularity lifting for non-regular symplectic representations, Duke Mathematical Journal 169 (2020), Appendix A.
- Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/pdf/1405.7294). Author preprint; published Annals of Mathematics 191 (2020), 329–354.
- Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290.
- Spencer Bloch; Kazuya Kato, L-functions and Tamagawa numbers of motives. The Grothendieck Festschrift I (1990), 333–400.
- Pierre Deligne, [Valeurs de fonctions L et périodes d’intégrales](https://publications.ias.edu/sites/default/files/33_Valeursde.pdf). Proc. Sympos. Pure Math. 33, Part 2 (1979), 313–346; author-hosted scan.
- Lilybelle Cowland Kellock; Vladimir Dokchitser, [Root numbers and parity phenomena](https://arxiv.org/abs/2303.07883v1). arXiv:2303.07883v1 (14 March 2023); locators use its 29-page preprint.
- Tim Dokchitser; Vladimir Dokchitser, [On the Birch–Swinnerton-Dyer quotients modulo squares](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p11-p.pdf). Annals of Mathematics 172 (2010), 567–596.
- Christophe Breuil, [Une remarque sur les représentations locales p-adiques et les congruences entre formes modulaires de Hilbert](https://www.numdam.org/article/BSMF_1999__127_3_459_0.pdf). Bull. Soc. Math. France 127 (1999), 459–472.
- Wiesława Nizioł, [Cohomology of crystalline representations](https://webusers.imj-prg.fr/~wieslawa.niziol/duke1993.pdf). Duke Mathematical Journal 71 (1993), 747–791.
- Jean-Marc Fontaine, [Le corps des périodes p-adiques](https://www.numdam.org/item/AST_1994__223__59_0.pdf). Astérisque 223 (1994), 59–111.
- Jean-Marc Fontaine; Guy Laffaille, [Construction de représentations p-adiques](https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf). Annales scientifiques de l’École normale supérieure 15 (1982), 547–608.
- Jean-Marc Fontaine, [Représentations p-adiques semi-stables](https://www.numdam.org/item/AST_1994__223__113_0.pdf). Astérisque 223 (1994), 113–184.
- J. S. Milne, Arithmetic Duality Theorems. Second edition, BookSurge (2006), author-hosted electronic version; printed page = PDF page − 8.
- J. S. Milne, Algebraic Number Theory. Course notes, version 3.08 (2020).
- Uwe Jannsen, [Continuous étale cohomology](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf). Mathematische Annalen 280 (1988), 207–245.
- Jean-Marc Fontaine; Yi Ouyang, Theory of p-adic Galois representations. Book manuscript, author-hosted; locators use its printed pagination.
- Olivier Brinon; Brian Conrad, CMI summer school notes on p-adic Hodge theory. Preliminary version, author-hosted; locators use its printed pagination.
- James Ax, Zeros of polynomials over local fields — the Galois action. Journal of Algebra 15 (1970), 417–428.
- John Tate, p-divisible groups. Proceedings of a Conference on Local Fields (Driebergen, 1966), Springer (1967), 158–183.
- J. W. S. Cassels, Arithmetic on curves of genus 1. IV. Proof of the Hauptvermutung. Journal für die reine und angewandte Mathematik 211 (1962), 95–112.
- J. W. S. Cassels, Arithmetic on curves of genus 1. VIII. On conjectures of Birch and Swinnerton-Dyer. Journal für die reine und angewandte Mathematik 217 (1965), 180–199.
- Bjorn Poonen; Michael Stoll, [The Cassels–Tate pairing on polarized abelian varieties](https://arxiv.org/abs/math/9911267). Annals of Mathematics 150 (1999), 1109–1149; the arXiv version carries the journal pagination.
- Tim Dokchitser, [Notes on the parity conjecture](https://arxiv.org/abs/1009.5389). arXiv:1009.5389v2 (2012); in *Elliptic curves, Hilbert modular forms and Galois deformations*, Advanced Courses in Mathematics CRM Barcelona, Birkhäuser (2013); locators use the arXiv pagination.
- Joseph H. Silverman, The Arithmetic of Elliptic Curves. Second edition, Graduate Texts in Mathematics 106, Springer (2009).
