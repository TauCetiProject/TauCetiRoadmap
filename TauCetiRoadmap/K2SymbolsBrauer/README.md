# Roadmap: explicit `K₂`: symbols, residues and reciprocity

**Summary.** Develop explicit symbol calculus on the Steinberg `K₂` constructed in Layer 0: finite-rank monomial and integer word refinements, a bar-calibrated classical-to-Quillen comparison, native Milnor K-theory and its products, residues, norms and reciprocity. Construct tame symbols and higher Milnor residues, integral Milnor norms with Kato's independence theorem and Suslin's reciprocity law for curves over any field, and compare them with localization boundaries and Quillen transfers. Compute tame kernels, `K₂(ℤ)≅ℤ/2` and `K₂(ℚ)`, and develop the absolute and relative Dennis–Stein presentations of `K₂` with their double-ring and homotopy-fibre descriptions.

The end targets are the explicitly normalized comparison `K₂(R)≃H₂(E(R);ℤ)≃π₂(BGL(R)⁺)` and its product sign (Layers 1–4, 8), the identification of native `K₂ᴹ(F)` with the supplied Matsumoto presentation (Layer 7), the Bass–Tate sequence, Kato norms and integral Weil–Suslin reciprocity (Layer 10), localization and the integer and rational computations (Layers 11–12), and the absolute and guarded relative Dennis–Stein presentations (Layer 13).

## Scope and ownership

This roadmap owns the explicit bar and symbol normalization adapters, the finite-rank row, column and monomial refinements over the stated rings, the integer word calculation, native Milnor K-groups in all degrees, their residues, specializations and norms, and the comparisons and arithmetic applications in Layers 8–13. It consumes the generic universal central extension and Hopf machinery from StableHomotopyKTheory §3.29. Layer 0 constructs stable matrices, classical and relative `K₁`, finite and stable Steinberg groups, stable centrality and universality, classical `K₂`, and the classical field presentation. These classical contracts also occur in AlgebraicKTheory A1–A3 and A5; use its shared carriers through the presentation adapters below, retaining the root-word, finite-rank and normalization targets here. The generic universal-extension machinery is not repeated here. The prime-to-characteristic local function-field symbols needed for §10.33 are supplied by ClassicalArithmeticCompletion §1.14 and ClassFieldTheory Layer 5; §§10.32a–10.32b construct their cyclic-algebra normalization adapters, global function-field pairings and the prime-to-characteristic global function-field degree-two norm-residue equivalence. The algebraic/cohomological Brauer equivalence uses Tau Ceti’s crossed-product API. The remaining comparison of these symbols with Galois cohomology and class field theory (the Galois symbol read through Kummer classes and cup products, trivialisation of twists by a primitive root, Brauer-valued and cyclic-algebra symbols, norm-residue and Hilbert symbols as Steinberg symbols and their local invariants, global reciprocity for symbols of a number field, the transported Tate comparisons and the degree-two étale Chern comparison) belongs to the downstream roadmap K2SymbolsBrauerPartII, a consumer of this roadmap; nothing here depends on it.

### Prerequisites and boundaries

Layer 0 and the supplying roadmaps GeneralAlgebraicKTheory §§3.2–3.14 and Layers 4, 7–8, StableHomotopyKTheory Layers 1–4, and KTheoryLowDegrees §§6.1–6.2, 8.1 and 13.1–13.5 have the contracts below. Named APIs below specify construction targets. `Suggested.lean` contains the headline statements statable on the pinned libraries and their supporting definitions; it is not an exhaustive checklist.

- **Stable matrices and classical K-theory.** §§0.1–0.2 construct `GL, E`, elementary identities over arbitrary associative rings, Whitehead's lemma and classical and relative `K₁`; §0.3 constructs `St` and classical `K₂`. KTheoryLowDegrees §6.2 supplies the stable elementary centralizer calculation, and §§8.1, 13.1 supply the determinant and normalized `K₁` comparisons. Its §13.2 supplies the quotient-root calculation and the signed comparison prism used by relative constructions. The associative-ring elementary identities are constructed in §0.1, including distant commutation and the reverse coefficient `−ba`.
- **Higher K-theory.** GeneralAlgebraicKTheory supplies the ring K-space, plus/Q comparison, biexact products, transfers, localization, dévissage, resolution and homotopy-fibre relative K-theory. StableHomotopyKTheory supplies classifying spaces, plus constructions, the universal-extension foundation, homotopy fibres and their long exact sequences. Hurewicz, Whitehead and covering spaces come from AlgebraicTopology Stages 5 and 8. The extra multiplicative comparison and its explicit torus normalization are §8.1 here.
- **Arithmetic suppliers.** ClassFieldTheory Layers 5–6 and 10–14 supply the local and global degree-two norm-residue pairings and their reciprocity, used in the Bass–Tate argument of §10.32. ClassFieldTheory Layer 5 supplies the local cohomological Brauer group and `invMap` for all nonarchimedean local fields; ClassicalArithmeticCompletion §1.14 supplies the prime-to-characteristic local symbol, including equal characteristic. Its §1.1 supplies the explicit unit generators modulo `2^k` used in §13.15.
- **Curves and valuations.** AlgebraicCurves Layers 2 and 12 and the Tau Ceti `Place` API supply the function-field/place dictionary. EllipticCurves Layer 2 supplies elliptic-curve Weil reciprocity; LocalFieldsRamification Layer 1 supplies local-field units and filtrations. Normalized finite extensions of complete discrete valuations with arbitrary imperfect residues require the additional lattice statements §§10.15–10.18 here.
- **Existing algebra.** Mathlib's `groupHomology` supplies integral group homology. Tau Ceti's `GroupExtension` and `FactorSet` APIs supply extensions with a fixed action, their cohomology classes and classification; central extensions use the trivial action. ReductiveGroups Layer 7 and RootSystems Layer 3 supply ordinary Bruhat and Coxeter facts. This roadmap's finite-rank lifted monomial statements refine those facts inside `St`, rather than rebuilding a general BN-pair theory.
- **Downstream directions.** Further degree-three comparisons, norm-residue isomorphism theorems beyond the global function-field case of §10.32b, and higher motivic comparisons belong to the roadmaps listed under Downstream consumers; none supplies an input here.

## Conventions

Rings are associative and unital, and ring maps preserve 1; commutativity is assumed only where stated. Fields are commutative. Matrices act on column vectors; `e_ij(a) = 1 + aE_ij` for `i ≠ j`. Commutators are `[x, y] = xyx⁻¹y⁻¹`. The Steinberg group `St_n(R)` is defined for `n ≥ 3` with generators `x_ij(r) (i ≠ j)` and the relations `x_ij(r)x_ij(s) = x_ij(r + s), [x_ij(r), x_kl(s)] = 1` for `j ≠ k, i ≠ l, [x_ij(r), x_jl(s)] = x_il(rs)` for `i ≠ l`, and `[x_ij(r), x_ki(s)] = x_kj(−sr)` for `j ≠ k`; nothing is imposed on opposite roots. Finite-rank and stable statements are kept apart: centrality of `ker(St_n(R) → E_n(R))` is never deduced from the stable theorem.

Group homology `H_n(G; ℤ)` has trivial integral coefficients and groups live in `Type`, as Mathlib's `groupHomology` requires. Group-valued kernels are written additively through `Additive` when they enter additive statements.

Steinberg symbols are `{r, s} = [h_ij(r), h_ik(s)]` with `w_ij(r) = x_ij(r)x_ji(−r⁻¹)x_ij(r)` and `h_ij(r) = w_ij(r)w_ij(−1)`; the Milnor symbol `{a, b} ∈ K₂ᴹ(F)` is the class of `a ⊗ b`, and Matsumoto's map sends `{a, b}` to `{a, b}`. Milnor K-groups have integral coefficients: `{a, a} = {a, −1}` is 2-torsion but is not zero in general.

For a discrete valuation `v` with uniformiser `π` and residue field `k`, the tame symbol is `∂_v{f, g} = (−1)^{v(f)v(g)} · (f^{v(g)}/g^{v(f)})‾`, the bar applied to a unit, so `∂_v{u, π} = ū` and `∂_v{π, u} = ū⁻¹`; this is the inverse of the K-book's Lemma III.6.3 symbol. Higher residues are read with `Π` on the right, `∂_v{u₁, …, u_{n−1}, π} = {ū₁, …, ū_{n−1}}`, and equal `(−1)^{n−1}` times the residue of Weibel's Theorem III.7.3. The localization boundary of K-theory is normalised by `B₁[π] = 1` and the right module rule; in degree two `det ∘ B ∘ (Matsumoto, product-normalized comparison θ₂♮)` is the inverse of the tame symbol (§11.8), and every comparison square states which sign it uses.

The norm-residue pairings use arithmetic Frobenius. In §§10.32a–10.32b write `[a,b]_K=normResidueSymbol b a`, with the first entry under the radical and the second under reciprocity. Thus `[u,π]_K=ū^((Q−1)/ℓ)` for a residue unit and a uniformizer when `ℓ∣Q−1`; this fixes the order in the cyclic-algebra and invariant comparisons. Sources are cited by theorem number and printed page; "Weibel" is the K-book (2013), whose printed page is the PDF page minus eight.

## Exact supplier contracts

### From Mathlib

`PresentedGroup`, `FreeGroup`, `IsFreeGroup`, `commutatorElement`, `Subgroup.center`, `Group.IsPerfect`, `Abelianization`, `MonoidHom.eqLocus` and `DirectLimit` with its group structure (`DirectLimit.lift`, `DirectLimit.map`, `DirectLimit.exists_eq_mk₂`, `DirectLimit.setoid`) supply the presentations, centres and colimits of Layers 1–3; the group colimit is used as a carrier and its finite-representative equality is part of §0.3. `GroupExtension` with `inl_conjAct_comm` supplies extensions. `groupHomology`, `groupHomology.H1`, `groupHomology.H2`, `groupHomology.map`, `groupHomology.chainsMap`, `groupHomology.inhomogeneousChains`, `groupHomology.H1AddEquivOfIsTrivial`, `groupHomologyIso`, `CategoryTheory.ProjectiveResolution`, `ShortComplex.ShortExact.δ` with `homology_exact₁`–`homology_exact₃` and `HomologicalComplex.HomologySequence.δ_naturality` supply the homological algebra of Layer 1; `CharacterModule` supplies the Pontryagin-dual argument of StableHomotopyKTheory §3.29. `groupCohomology.H2` is the cohomology of the classification statement.

`Matrix.GeneralLinearGroup.transvection`, `Matrix.det_permutation` and `Matrix.diag2_decompose` supply matrix identities over commutative rings. `TensorAlgebra` with `TensorAlgebra.gradedAlgebra`, `TensorAlgebra.equivDirectSum` and `TensorAlgebra.lift`, `TensorProduct.lift`, `Submodule.liftQ`, `TwoSidedIdeal`, `RingCon.mk'`, `RingQuot`, `PiTensorProduct.isEmptyEquiv`, `PiTensorProduct.subsingletonEquiv` and `TensorPower.mulEquiv` supply the presentations of Layer 5. `Valuation`, `ValuationSubring.unitGroup`, `ValuationSubring.unitGroupToResidueFieldUnits` (surjective, with kernel the principal units), `IsLocalRing.residue`, `IsLocalRing.ResidueField.map`, `IsDiscreteValuationRing`, `HenselianRing`, `IsDedekindDomain.HeightOneSpectrum` with `Support.finite`, `NumberField.RingOfIntegers`, `NumberField.InfinitePlace`, `Algebra.norm` with `Algebra.norm_norm`, `Ideal.sum_ramification_inertia_eq_finrank`, `Polynomial.modByMonic`, `Polynomial.resultant_eq_prod_eval`, `spectralNorm` with `spectralNorm_unique`, `KaehlerDifferential`, `DualNumber` and `TrivSqZeroExt` supply the valuation, number-field and coefficient carriers of Layers 9–13. `HomotopyGroup` represents `π_n`.

### From Tau Ceti

`TauCeti.transvectionUnit` with `transvectionUnit_add`, `commute_transvectionUnit`, `commutatorElement_transvectionUnit` and `commutatorElement_transvectionUnit_reverse`, `TauCeti.diagGL`, `TauCeti.permutationGL` with `permutationGL_mul_diagGL_mul_inv`, `TauCeti.det_diagGL`, `Matrix.SpecialLinearGroup.diag2nUnit_decompose`, `TauCeti.upperUnitriangularGroup` with `UpperUnitriangularGroup.ext` and `UpperTriangularGroup.mem_diagonalTorus_of_mem` supply the matrix calculus over commutative rings. `TauCeti.GroupExtension.InducesAction`, `TauCeti.GroupExtension.conjAct_eq_one_of_le_center`, `TauCeti.FactorSet` with `inl_range_le_center`, `groupExtension`, `exists_cohomologyClass_eq`, `nonempty_splitting_iff_cohomologyClass_eq_zero` and `TauCeti.GroupExtension.nonempty_equiv_iff_cohomologyClass_factorSet_eq` supply factor sets and the classification of extensions with a fixed action.

`Valuation.ord` with `ord_mul`, `ord_zpow`, `ord_add_eq_min_of_ord_ne`, `isUnit_iff_ord_eq_zero`, `mem_maximalIdeal_iff_ord_pos`, `mem_valuationSubring_iff_ord_nonneg`, `valuation_eq_exp_neg_ord`, `exists_eq_zpow_mul_unit_of_surjective`, `exists_isUniformizer_of_surjective`, `isUniformizer_iff_ord_eq_one_of_surjective` and `nontrivial_valueGroup_of_surjective` supply orders and unit parts; `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` supplies roots of principal units. `TauCeti.Place` with `degree`, `restrict`, `normResidue`, `residueUnit`, `ratFuncEquiv`, `heightOneSpectrumEquiv`, `adicOfIrreducibleResidueFieldEquiv`, `inftyResidueFieldEquiv`, `ord_infty`, `isUniformizer_infty`, `finite_setOf_ord_ne_zero` and `sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`, together with `TauCeti.Divisor.principal`, `Divisor.eval` and `Divisor.eval_eq_prod_normResidue`, supply places of function fields and divisor evaluation; `IsDedekindDomain.integerHeightOneSpectrumEquiv` and `WeierstrassCurve.Affine.isFunctionField` supply the integer and elliptic cases. `HomotopyGroup.mapHom`, `HomotopyGroup.mulEquivOfHomotopyEquiv` and `TauCeti.homotopyGroupTransport_map` supply based maps on homotopy groups. `TauCeti.unitsEquivIntProd`, `TauCeti.coe_unitsEquivIntProd_apply_snd` and `TauCeti.coe_unitsEquivIntProd_apply_snd_eq_mul` in `TauCeti.NumberTheory.LocalField.UnitsDecomposition` supply the topological splitting of `Kˣ` into its normalized valuation and depth-zero unit component for a nonarchimedean local field, with a chosen uniformizer and the change-of-uniformizer formula. `TauCeti.Algebra.norm_quotient_mk` in `TauCeti.RingTheory.Norm.Quotient` supplies reduction of the determinant norm for a finite free commutative algebra modulo an ideal. The unit-part compatibility of §9.1 and the general complete-DVR norm identity of §10.17 use these declarations in their stated scope.

### Shared classical foundations and local presentation refinements

[AlgebraicKTheory, A1–A3 and A5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e5df75ba384b2f944b7b626c00803871017b0b1c/TauCetiRoadmap/AlgebraicKTheory/README.md#a1-stable-matrices-elementary-operations-and-whiteheads-lemma) supplies stable matrices and Whitehead’s theorem (A1), classical and relative `K₁` (A2–A3), and finite/stable Steinberg groups, classical `K₂`, stable universality, Matsumoto and finite-field vanishing (A5). Realize the Layer 0 contracts on those shared carriers; presentation variants are identified by `classicalCarrierTransport`.

§0.1 supplies stable matrices and elementary identities; §0.2 supplies classical and relative `K₁`; §0.3 supplies finite and stable Steinberg groups, their functorial maps, stable centrality, universality and classical `K₂`; §0.4 supplies the classical field presentation and finite-field vanishing. Layers 1, 4 and 8 fix the additional bar/product normalization.

### From GeneralAlgebraicKTheory

§3.2: the functorial ring K-space and filtered continuity; §§3.12–3.14: plus/Q and the projective-automorphism comparison, using right finite projectives and positive unit classes; §§4.6, 4.8, 4.14: resolution, dévissage and Serre localization; §§7.2–7.4: the double-S biexact product, including its pushout-product condition; §7.7: transfers and projection formula; §7.8: finite-field base change; §8.1: relative K-theory as a homotopy fibre; §§8.11–8.13: the degree-one index and DVR boundary with `B₁[π]=1` and the right product action. The stable smash-product adapter in §1.8 is not by itself the multiplicative plus/Q comparison required in §8.1 here.

### From StableHomotopyKTheory

§§1.30, 1.32: `BG`, bar chains and the natural group/classifying-space homology comparison; GeneralizedCohomology G2.10 supplies the based homotopy-fibre carrier; §2.4 supplies `homotopyFiber.connecting` and `homotopyFiber.connectingHom`, §2.5 supplies exactness, §2.7 supplies path transport, and §§2.8–2.10 supply iterated-fibre comparison; §§3.12, 3.26, 3.27: acyclic plus constructions, uniqueness and functoriality; §3.28: H-space recognition; §3.29: the generic universal-extension/Hopf foundation and `plusConstruction.pi2Equiv`, `plusConstruction.fiber_universalCentralExtension`; §3.30: naturality; §3.31: `BP⁺` as the universal cover of `BG⁺` for perfect `P`; §§3.32–3.33: the central-extension plus fibration and its acyclic base change; §4.14: the block-sum H-space structure. The `kernel–H₂` map is used with the explicit bar calibration §1.1 here.

### From KTheoryLowDegrees

§6.1: finite block refinements of stable `GL`; §6.2: finite elementary perfectness and the stable centralizer calculation; §8.1: determinant and unit-class normalization; §13.1: `K₁(R)≃π₁(BGL(R)⁺)`; §13.2: the quotient-root normal-closure theorem and the based signed comparison prism; §§13.3–13.5: congruence loops and relative degree-zero/one comparisons. KTheoryLowDegrees uses AlgebraicKTheory A1–A3 and A5’s carriers, including literal aliases in its §13.2. Consume these same carriers in §§0.1–0.3; §0.3’s presentation transports identify any finite-word variant with them. The root-presentation and congruence-quotient identifications, including their compatibility with the generic plus construction, are targets here; they are not an additional classical foundation supplied by KTheoryLowDegrees.

### From other TauCetiRoadmap roadmaps

ClassicalArithmeticCompletion Layer 1 (§1.1 units modulo `2^k`, §1.14 `normResidueSymbol`); ClassFieldTheory Layers 5–6 and 10–14 (`localSymbol`, the local and global degree-two pairings, `hilbertProductFormula`); AlgebraicCurves Layers 2 and 12; EllipticCurves Layer 2; LocalFieldsRamification Layers 0 and 1; ReductiveGroups Layer 7; RepresentationTheory/RootSystems Layer 3; AlgebraicTopology Stages 5 and 8.

## How to read the build

Layer 0 constructs the classical matrix and Steinberg foundations. Layers 1–4 calibrate and refine these using the supplied generic universal-extension machinery, retaining the finite-rank splitting theorem and the actual Hopf, Hurewicz and fibre routes. Layer 5 constructs native Milnor K-theory. Layer 6 gives the additional commuting-unit and finite-rank monomial calculus; Layer 7 identifies native degree two with the supplied Matsumoto presentation. Layer 8 fixes the Quillen product comparison and its numerical sign. Layers 9–11 develop Milnor residues and norms, integral reciprocity and their higher-K comparison. Layer 12 computes tame kernels and the integer and rational groups. Layer 13 develops Dennis–Stein symbols, the relative Steinberg group of the double, its comparison with the homotopy fibre, and the absolute and relative presentations.

## Layer 0: classical matrix and Steinberg foundations

### 0.1 Stable matrices and elementary groups

Use AlgebraicKTheory A1’s stable matrix and elementary carriers. For every associative unital ring `R`, realize `GL(R)=colim GL_n(R)` using upper-left block stabilization, and `E(R)` generated by the finite transvections. Construct coefficient maps and stabilization maps, prove their identity/composition laws and the finite-representative equality criterion. Prove the elementary identities in Conventions, normality of `E(R)` in `GL(R)`, Whitehead's identity `E(R)=[GL(R),GL(R)]`, and perfectness of stable `E(R)`. These are stable assertions over arbitrary rings, including the zero ring. (Weibel, III.1.1–1.3, pp.179–183; III.5.1, p.217.)

**Checks.**

- The reverse-root commutator has coefficient `−sr`, retaining the order of factors over a noncommutative ring.
- Two finite representatives are equal exactly when their images agree at a common finite stage.
- The zero ring gives trivial groups; no `Nontrivial R` assumption enters.

*Needs:* AlgebraicKTheory A1; Mathlib `Matrix.GeneralLinearGroup`; Mathlib `PresentedGroup`; Mathlib `DirectLimit`.

### 0.2 Classical and relative degree one

Use AlgebraicKTheory A2–A3’s classical and relative degree-one groups. For every associative unital `R`, identify `K₁(R)=GL(R)/E(R)` and its functorial abelian-group structure. For a two-sided ideal `I`, construct `GL(R,I)=ker(GL(R)→GL(R/I))`, the normal elementary subgroup `E(R,I)` generated in `E(R)` by the root elements with coefficients in `I`, and `K₁(R,I)=GL(R,I)/E(R,I)`. Construct the forgetful and quotient maps and exactness `K₁(R,I)→K₁(R)→K₁(R/I)`. For commutative `R`, determinant induces `K₁(R)→Rˣ`; it is an isomorphism for commutative semilocal rings. KTheoryLowDegrees supplies the additional finite-block, determinant and homotopy comparisons in its stated scope. (Weibel, III.1.1, III.1.4–1.5 and III.2.2, pp.179–180, 183–184, 192–193.)

**Checks.**

- Relative `K₁` is its quotient construction, with a forgetful map; it is not defined as the kernel of the absolute map.
- For `I=0` the relative group is trivial; for `I=R` it is absolute `K₁(R)`.
- A unit over a commutative ring has determinant equal to that unit under its one-by-one representative.

*Needs:* §0.1; AlgebraicKTheory A2–A3; Mathlib `QuotientGroup`; Mathlib `Ideal.Quotient`.

### 0.3 Finite and stable Steinberg groups

Use AlgebraicKTheory A5’s finite and stable Steinberg groups and classical kernel. For every associative unital ring `R` and `n≥3`, realize `St_n(R)` by the presentation in Conventions and the surjection `φ_n:St_n(R)→E_n(R)`. Construct stabilization and coefficient maps, their commuting squares with `φ_n`, and `St(R)=colim St_n(R)`. Define classical `K₂(R)=ker(St(R)→E(R))`. Prove stable centrality, perfectness of `St(R)`, and universality of the central extension `St(R)→E(R)`: every central extension of `E(R)` receives a unique homomorphism from `St(R)` over `E(R)`. Prove universality directly by normalized lifts of root words and their relations, independently of the generic Hopf and plus comparisons. Express the result in the universal-extension API of StableHomotopyKTheory; its generic comparisons then apply to this extension. Layers 2–3 supply the additional finite-rank refinements and bar calibration. (Weibel, Definitions III.5.1–5.3.1 and Theorem III.5.5, pp.217–220.)

`Suggested.lean` defines `Steinberg.Root`, `Steinberg.rootWord`, `Steinberg.relators` and `Steinberg.FiniteRank` as a finite-word presentation adapter to AlgebraicKTheory A5 for the central-extension splitting theorem in §3.2. The additional reverse-root relation follows from its forward-root relation by reversing the commutator; it does not change the presented group.

**Checks.**

- Stable `K₂` is abelian and coefficient maps restrict to homomorphisms on it.
- No centrality of a finite-rank kernel is inferred from stable centrality without §2.3's injectivity hypothesis.
- Opposite roots receive no extra presentation relation; in particular no relation forces their commutator to be trivial.

*Needs:* §0.1; AlgebraicKTheory A5; Mathlib `PresentedGroup`; Mathlib `DirectLimit`; StableHomotopyKTheory §3.29 (universal-extension API only; the root-word universality proof is local).

**Classical carrier transports** (`classicalCarrierTransport`). For every unital associative ring, construct the natural equivalences from §§0.1–0.3 to AlgebraicKTheory A1–A3 and A5’s shared stable matrix, elementary and Steinberg carriers, which KTheoryLowDegrees §§6.1–6.2 and 13.2 also use. Construct them on finite matrices and root words, prove both composites are identities by their presentation mapping properties, and descend the relative degree-one equivalence through the congruence quotients of §0.2. Specialize the generic plus and universal-extension comparisons to these local carriers; the unique comparison of universal extensions is over the elementary group. This supplies the carrier identifications used by Layers 1–4 and 13. (Own presentation-uniqueness argument from Weibel, III.1.1–1.3, pp.179–181; III.5.1–5.5, pp.217–220.)

**Checks.**

- Every root `x_ij(a)` and every finite matrix representative is preserved; the transports commute with stabilization and coefficient maps, without injective Steinberg transitions.
- Over the zero ring all these groups and maps are trivial; over the quaternions the transported commutator has coefficient `ij=k`, preserving multiplication order.
- For every two-sided `I`, the relative degree-one transport preserves `GL(R,I)/E(R,I)` and its forgetful map, rather than replacing it by the kernel of the absolute map.

*Needs:* §§0.1–0.3; AlgebraicKTheory A1–A3 and A5; Mathlib `PresentedGroup`; Mathlib `DirectLimit`; StableHomotopyKTheory §§3.29–3.30 (generic comparisons only).

### 0.4 The classical field presentation

Use AlgebraicKTheory A5’s Matsumoto presentation and finite-field vanishing. For every field `F`, identify its classical Steinberg symbol by the root word `[h₁₂(a),h₁₃(b)]` of Conventions. Prove bimultiplicativity, the complementary-unit relation, generation of classical `K₂(F)`, and completeness of these relations (Matsumoto's theorem). Equivalently every Steinberg pairing factors uniquely through classical `K₂(F)`. Prove finite-field classical `K₂` vanishing. The native tensor-quotient construction in Layer 5 is separate; Layer 7 identifies it with this classical presentation, preserving the actual root word. (Weibel, Theorem III.6.1 and Corollary III.6.1.1, pp.230–231; III.5.10, p.225.)

**Checks.**

- The map to any Steinberg pairing preserves `{a,b}` in the displayed order, including the real sign pairing.
- `K₂(𝔽₂)` and `K₂(𝔽₃)` vanish without any lower bound on field cardinality.
- `{-1,-1}` over `ℝ` remains nonzero; the presentation is not an exterior square.

*Needs:* §0.3; AlgebraicKTheory A5; Mathlib `Units`; Mathlib `FreeAbelianGroup`.

## Layer 1: bar normalization of the supplied kernel equivalence

### 1.1 The bar-calibrated kernel identification

For group elements `a,b` write `torusLiftBoundary a b=ba(ab)⁻¹`. This light group word is the inverse commutator; the following target identifies its class with a specific homological connecting map.

For a free presentation `q:F→G` with kernel `N` use the unnormalised differential `d[a|b]=[b]−[ab]+[a]`. The positive connecting map takes a quotient 2-cycle to the boundary of a lift. Identify the relative 1-cycle `[a]−[b], q(a)=q(b)`, with `ab⁻¹` in N/[F,N]. Require the supplied Hopf equivalence `H₂(G;ℤ)≃(N∩[F,F])/[F,N]` to use this connecting map. If a supplying implementation uses the opposite connecting sign, explicitly compose its Hopf equivalence with inversion to obtain this convention; the bar formula, rather than an arbitrary isomorphism, determines that adapter. For perfect `G`, invert this calibrated map on the canonical commutator-extension kernel and transport it through the unique universal-extension equivalence. This specifies the `kernel→H₂` map used below. (Löh, Theorem 3.2.18 and proof, pp.129–131; Loday, Lemma 2.2.4 and Corollary 2.2.5 with proofs, pp.338–340.)

For the presentation `ℤ²=⟨s,t | [s,t]⟩`, its positively ordered torus cycle is `z=[s|t]−[t|s]`. Its lifted boundary is `[ts]−[st]`, whose relative class is `ts(st)⁻¹=[s,t]⁻¹` in N/[F,N]. Thus the calibrated Hopf map sends `z` to the inverse relator. Naturality now says that for commuting `g,h` in a perfect group and any lifts `g̃,h̃` to its universal central extension, the image of the ordered torus class in `H₂` is the calibrated kernel image of `[g̃,h̃]⁻¹`. This is the particular refinement of the supplier needed in §8.1; the existence, bijectivity and presentation independence of Hopf's formula stay with the supplier.

Provide the following API.

- `K2HopfCalibration.transgression_lift`: The supplier's connecting map, transported to the stated bar convention, sends a cycle to the positive boundary of a lift and `[a]−[b]` to `ab⁻¹`.
- `K2HopfCalibration.torus`: The ordered torus cycle maps to `[s,t]⁻¹`, and under a map to a perfect group to the inverse commutator of its lifts.
- `K2HopfCalibration.natural`: These identifications commute with maps of free presentations and with the supplier's unique maps of universal extensions.

**Checks.**

- For the identity group quotient the relative kernel and its connecting map vanish.
- In the upper-unitriangular group over `𝔽₃` write `(x,y,z)(x′,y′,z′)=(x+x′,y+y′,z+z′+xy′)`. For `a=(1,0,0), b=(0,1,0), [a,b]` has central coordinate 1, whereas `ba(ab)⁻¹` has coordinate 2. The positive lifted bar boundary has coordinate 2; reversing its sign fails this test.
- Swapping `s,t` negates `z` and inverts `[s,t]⁻¹`. The torus formula respects this swap and has the same sign in every presentation.
- In characteristic two the two central coordinates cannot distinguish a sign; the `𝔽₃` control is required.

### Examples

- A commuting pair maps the two torus edges to `g,h` in that order; reversing the sphere orientation reverses both the fundamental class and the calibrated kernel image.
- For the trivial group the supplied universal extension and the calibrated kernel identification are trivial.

### Dependencies

StableHomotopyKTheory §§1.32, 3.29–3.30; Mathlib integral `groupHomology`, its inhomogeneous bar differential and connecting maps.

## Layer 2: refinements of the supplied Steinberg groups

§§0.1–0.3 supply stable `GL, E, K₁`, the finite Steinberg presentations, stabilization and coefficient maps, stable `St→E`, its central kernel `K₂` and its universal central extension theorem. These are the objects throughout this roadmap. In particular no local presentation or colimit is constructed again, and a stable word equality is witnessed at a common finite stage; injectivity of Steinberg transition maps is not assumed. The following refinements concern faithful root subgroups, the whole centre and conditional finite-rank centrality. (Weibel, III.5.1–5.5, pp.217–220.)

### 2.1 Faithful row and column root subgroups

For an associative unital ring `R, n ≥ 3` and an index `t`, define `rho_t` from the additive group of vectors `(v_i)` indexed by `i ≠ t` to `St_n(R)` by the product of `x_it(v_i)`. These roots commute, so the order is immaterial and `rho_t` is an injective additive-to-multiplicative homomorphism. Its matrix image is `I + sum_i E_it(v_i)`. Its composite into `St(R)` is also injective. The row analogue `eta_t(v) = product_i x_ti(v_i)` has the same assertions. For `a,b` distinct and both different from `t`, conjugation by `x_ab(c)` replaces column coordinate `v_a` by `v_a + c v_b`, and row coordinate `v_b` by `v_b − v_a c`. These are left and right multiplications in the displayed order. (Weibel, Exercise III.5.2, proof of Theorem III.5.2.1, pp. 217, 228; Weibel, III.1.2, p. 180.)

`R` is an associative unital ring; neither commutativity nor nontriviality is assumed. `n ≥ 3`; vectors have exactly `n−1` coordinates, omitting `t`. For the normalization formulas `a ≠ b, a ≠ t` and `b ≠ t`. Opposite roots are excluded.

Provide the following API.

- `Steinberg.column`: `rho_t(v)=product` over `i≠t` of `x_it(v_i)`, with commuting factors and fixed finite index type.
- `Steinberg.row`: `eta_t(v)=product` over `i≠t` of `x_ti(v_i)`, with commuting factors.
- `Steinberg.column_add`: `rho_t(v+w)=rho_t(v)rho_t(w)`; the identical row law also holds.
- `Steinberg.column_basis`: `rho_t` of the vector supported at `i` with value `r` is `x_it(r)`; row basis evaluates to `x_ti(r)`.
- `Steinberg.phi_column`: The image under `phi_n` is `I+sum_i E_it(v_i)`; row image is `I+sum_i E_ti(v_i)`.
- `Steinberg.column_injective`: `rho_t` and `eta_t` are injective, and remain injective after mapping to stable `St(R)`.
- `Steinberg.column_conj`: For `a,b≠t` and `a≠b, x_ab(c)rho_t(v)x_ab(c)` inverse equals `rho_t(v with v_a increased by c v_b)`.
- `Steinberg.row_conj`: Under the same hypotheses conjugation increases row coordinate `v_b` by `−v_a c`.
- `Steinberg.column_map`: Ring maps act on every vector entry; index stabilization adds zero entries. Row maps satisfy the same laws.

**Checks.**

- For any `n,t, rho_t(0)=1` and `eta_t(0)=1`; over the zero ring both image groups are trivial.
- In rank three over `Z`, with `t=3` and vector `(2,3), phi_3(rho_3(v))=I+2E13+3E23`. Thus `rho_3(v)` is not identity.
- Over `R=M2(Z)`, for the outer rank-three column `t=3`, take `c=E12` and `v_2=E21`. Conjugation by `x_12(c)` adds `E11` to `v_1`, not `E22`.
- Over `R=M2(Z)`, take row `t=3, c=E12` and `v_1=E21`. Conjugation by `x_12(c)` adds `−E22` to `v_2`, not `−E11`.
- Over `Z`, the stable image of `rho_3(1,0)=x_13(1)` has matrix entry `(1,3)=1` and is nonidentity.
- Over `Z`, conjugating `e_13(1)` by `e_31(1)` gives a matrix with a nonzero `(3,1)` entry and changed diagonal entries. It is not in the column subgroup; the normalizer formula cannot include `a=t` or `b=t`.

*Needs:* §0.3; KTheoryLowDegrees §6.2; KTheoryLowDegrees §6.1.

### 2.2 The whole stable centre

For every associative unital ring `R` the supplied central kernel `K₂(R)` is the entire centre of `St(R)`. The additional inclusion follows because the image of a central element centralizes `E(R)` in stable `GL(R)`, whose centralizer is trivial by KTheoryLowDegrees §6.2. The reverse inclusion is §0.3's centrality theorem. This refines that theorem without rebuilding its fresh-root proof. (Weibel, Theorem III.5.2.1, pp.217–218.)

**Checks.**

- The zero ring gives trivial `St, E` and centre.
- A nonzero elementary root is not central, since its elementary image is nonidentity.
- Nothing is inferred about the whole centre or the kernel in a fixed finite rank without the extra hypothesis in §2.3.

*Needs:* §0.3; KTheoryLowDegrees §6.2.

### 2.3 Conditional centrality in finite rank

If the map `ker(St_n(R)->E_n(R)) -> ker(St(R)->E(R))` induced by stabilization is injective, then `ker(St_n(R)->E_n(R))` is central in `St_n(R)`. This hypothesis is not asserted for arbitrary `n,R`. (Weibel, Theorem III.5.2.1, pp.217–218, and Remark III.5.5.2, p.221.)

`R` is an associative unital ring; `n` is at least three. The stabilization map restricted to the finite-rank kernel is injective.

**Checks.**

- The proof uses injectivity on the kernel, not injectivity of the entire stabilization map.
- Without the injectivity hypothesis the stable-centre theorem alone has no finite-rank conclusion.
- Together with `n>=5` splitting and perfectness, this centrality hypothesis permits a finite-rank UCE conclusion.

*Needs:* §0.3; §2.2.

### Examples

- Over `M₂(ℤ)` the row and column conjugation formulas distinguish `E₁₂E₂₁` from `E₂₁E₁₂`.
- The finite-rank centrality criterion uses injectivity only on the finite kernel, not on the whole Steinberg group.

### Dependencies

§§0.1–0.3; KTheoryLowDegrees §6.2; Mathlib `DirectLimit` and the supplied finite-stage Steinberg maps.

## Layer 3: finite-rank sections and kernel calibration

For `n≥5` every central extension of `St_n(R)` splits by the normalized lifts below. The stable universal extension and its `kernel–H₂` equivalence are consumed from §0.3 and StableHomotopyKTheory §3.29. This layer adds the finite-rank normalized-section API and the bar calibration of that supplied equivalence. Finite-rank universality requires the separate centrality hypothesis of §2.3.

### 3.1 Normalized lifts of Steinberg generators

Let `n≥5` and `q:Y→St_n(R)` be a surjective homomorphism with central kernel. For `i≠j` and `a∈R` define `y_ij(a)=[u,v]`, where `q(u)=x_ik(1), q(v)=x_kj(a)`, and `k` differs from `i,j`. The resulting element is independent of `u,v` and of `k`, and `q(y_ij(a))=x_ij(a)`. More generally, for `i,k,j` pairwise distinct, any lifts `U,V` of `x_ik(a),x_kj(b)` satisfy `[U,V]=y_ij(ab)`. (Weibel, III.5.5.1, and Exercise III.5.3, pp. 220, 228.)

`n≥5`. `q` is surjective and `ker q≤Z(Y)`; no centrality of `St_n→E_n` is assumed.

Provide the following API.

- `Steinberg.normalisedRootLift`: `y_ij(a)` is the commutator of any indicated two preimages under `q`.
- `Steinberg.normalisedRootLift_image`: `q(y_ij(a))=x_ij(a)`.
- `Steinberg.normalisedRootLift_choice`: Changing either preimage or the intermediate index leaves `y_ij(a)` unchanged.
- `Steinberg.normalisedRootLift_zero`: `y_ij(0)=1`, since any lift of `x_kj(0)=1` lies in the central kernel.
- `Steinberg.normalisedRootLift_product`: For arbitrary lifts of `x_ik(a),x_kj(b)`, their commutator is `y_ij(ab)`.
- `Steinberg.normalisedRootLift_extensionHom`: A homomorphism `Y→Y′` over `St_n` carries normalized lifts to normalized lifts; `q′` must again be a surjective central extension.

**Checks.**

- For `q=id` on `St_n, y_ij(a)=x_ij(a)`.
- For every central extension, `y_ij(0)=1` even when the arbitrary set section sends 1 to a nonidentity kernel element.
- Multiplying either chosen lift by any kernel element leaves the commutator unchanged.
- In rank five the choices `k=2` and `k=3` for `i=0,j=1` give the same `y_01(a)`.
- For `R=M₂(Z)`, `[lift x_02(E12),lift x_21(E21)]=y_01(E11)`. It is not `y_01(E22)`, since the elementary image distinguishes those parameters.

*Needs:* StableHomotopyKTheory §3.29; §0.3; Mathlib `commutatorElement`; Mathlib `commutatorElement_mul_right_eq_mul_conj`.

### 3.2 Every central extension of the finite-rank Steinberg group splits, for `n` at least five

For `n` at least five every central extension of `St_n(R)` splits. If the canonical surjection `St_n(R) -> E_n(R)` is separately known to have central kernel, then it is the universal central extension of `E_n(R)`; centrality is not a consequence of splitting. (Weibel, III.5.5.1, p. 220.)

`Suggested.lean` states `Steinberg.centralExtension_splits`: every surjective central extension has a unique homomorphic section.

`R` is an associative unital ring; `n` is at least five.

**Checks.**

- The bound `n` at least five is used in the first step and is recorded, not smoothed over.
- The splitting is by an explicit homomorphism, which is what makes the argument constructive.
- The statement does not say that the kernel of the finite-rank map is central, which is the separate caveat below.

*Needs:* StableHomotopyKTheory §3.29; §0.3.

**The lifted relations give the unique finite section.** For `n≥5` every surjective central extension `q:Y→St_n(R)` has a unique homomorphic section `σ`, with `σ(x_ij(a))=y_ij(a)`. The normalized lifts satisfy all Steinberg relations, including additivity and reverse multiplication `−ba`. This implies finite-rank universality of `St_n→E_n` only under a separately supplied central-kernel hypothesis. (Weibel, III.5.5.1, p. 220.)

`n≥5`; `q` is a surjective central extension of `St_n(R)`.

**Checks.**

- All four relations are checked with their index hypotheses; the opposite-root case stays unprescribed.
- The additive calculation works over `M₂(Z)`.
- A claim of finite-rank universality without a centrality input fails the acceptance contract.

*Needs:* StableHomotopyKTheory §3.29; §0.3; §2.3; §3.1; Mathlib `commutatorElement_mul_right_eq_mul_conj`; Mathlib `commutatorElement_inv`.

### 3.3 Calibrating the supplied kernel equivalence

Write `α_R:K₂(R)≃H₂(E(R);ℤ)` for the supplied kernel equivalence after the bar calibration of §1.1. Its inverse on a torus class represented by a commuting elementary pair is the inverse commutator of their Steinberg lifts. This refinement fixes the comparison used in Layer 4 and its sign in Layer 8; it is natural for every unital ring map. (Loday, Lemma 2.2.4 and Corollary 2.2.5, pp.338–340.)

**Checks.**

- Over the zero ring both groups vanish and `α` is their unique equivalence.
- Its inverse takes the positively ordered torus cycle to the inverse commutator, as the `𝔽₃` calculation of §1.1 checks.
- The identity and composite ring-map squares commute with the actual `H₂(E(f);ℤ)` map, without an injectivity hypothesis on `f`.

*Needs:* §1.1; §0.3; StableHomotopyKTheory §3.29.

### Examples

- In rank five the normalised lift `y₀₁(a)` does not depend on the auxiliary index `(k = 2 or k = 3)`.
- For `R = ℤ` both `K₂(ℤ)` and `H₂(E(ℤ); ℤ)` are cyclic of order two.

### Dependencies

Layers 1–2; KTheoryLowDegrees §6.2 `(E(R) perfect)`.

## Layer 4: classical `K₂` as the second homotopy group

Classical `K₂` is identified with `π₂` of `BGL(R)⁺` in two natural ways: the Hurewicz route `β_R` through `H₂(E(R))` and the simply connected cover `BE(R)⁺`, and the fibre route `χ_A` through the connecting map of the plus-construction fibre, which is StableHomotopyKTheory's `plusConstruction.pi2Equiv`. Both are natural in unital ring maps and independent of the plus model; the fibre route is transported to `π₂` of the Q-construction of finitely generated projective modules. The degree-two product comparison of Layer 8 fixes its sign relative to `β`.

### 4.1 `K_2` is the second homotopy group of the K-theory space

For every ring `R` there is an isomorphism from `K_2(R)` to the second homotopy group of the plus construction on the classifying space of the stable general linear group, natural in `R`. It is obtained by combining the identification with the second homology of `E(R)` with the Hurewicz theorem applied to the simply connected space obtained from the plus construction. (Weibel, Corollary IV.1.7.1, p.265, and Exercise IV.1.8, p.274.)

**Checks.**

- The composite isomorphism is natural in the ring.
- For a finite field both sides are trivial.
- The Hurewicz step needs simple connectivity, which is why the elementary group, and not the general linear group, appears.

*Needs:* §3.3; StableHomotopyKTheory Layer 3; GeneralAlgebraicKTheory Layer 3; Mathlib `HomotopyGroup`; KTheoryLowDegrees Layer 6.

**Chosen classical and homotopy `K₂` comparisons.** For an associative unital ring `R` in `Type`, let `α_R:K₂(R)≃H₂^grp(E(R);Z)` be the kernel equivalence of the unique isomorphism over `E(R)` from `St(R)` to the canonical Hopf universal extension, followed by Hopf’s formula with the bar calibration of §1.1. Put `B_R=BGL(R)⁺` with its canonical based vertex, `j_R:BE(R)→BE(R)⁺` and `p_R:BE(R)⁺→B_R` the universal-cover model supplied by StableHomotopyKTheory Layer 3. Let `γ_R:H₂^grp(E(R);Z)≃H₂^top(BE(R);Z)` be the natural group/classifying-space comparison supplied by StableHomotopyKTheory §1.32, oriented from group homology to space homology. Define `β_R=p_R,* ∘ hur_R⁻¹ ∘ H₂^top(j_R) ∘ γ_R ∘ α_R`, where `hur_R:π₂(BE(R)⁺)≃H₂^top(BE(R)⁺;Z)` is absolute Hurewicz. Then `β_R:K₂(R)≃π₂(B_R)`, and, under the early K-space zero-component equivalence, `β_R` identifies classical with homotopy `K₂`. Both maps are natural for unital ring homomorphisms; `H₂` has trivial integral coefficients and group-valued carriers use the appropriate additive/multiplicative type tags. (Weibel, III.5.5, IV.1.7 and Corollary IV.1.7.1, Exercise IV.1.8, pp. 220, 264, 274.)

Groups are in `Type`, matching the integral group-homology API; larger universes use compatible universe lifts. GeneralAlgebraicKTheory Layer 3 supplies a based zero-component equivalence with `B_R` and its ring-map compatibility. Plus comparison homotopies are based; free-homotopy comparisons instead require the trivial action of target `π₁` on `π₂`, supplied for the ring K-space by its H-space structure.

Provide the following API.

- `K2.classicalHomologyEquiv`: `α_R` is the kernel restriction of the unique Hopf universal-extension equivalence.
- `K2.classicalPlusEquiv`: `β_R` is the displayed cover/Hurewicz/integral-homology composite.
- `K2.classicalHomologyEquiv_natural`: `α_S∘K₂(f)=H₂^grp(E(f);Z)∘α_R` for any unital ring map `f`.
- `K2.classicalPlusEquiv_natural`: `β_S∘K₂(f)=π₂(BGL(f)⁺)∘β_R`, with the stated basepoint or trivial-action condition.
- `K2.classicalPlusEquiv_cover`: `hur_R∘p_R,*⁻¹∘β_R=H₂^top(j_R)∘γ_R∘α_R`.
- `K2.classicalPlusEquiv_transport`: Changing the plus/cover model by a based equivalence compatible under `BE` and `BGL` carries `β` to the new `β`; changing the Hopf presentation carries `α` by the canonical equivalence.
- `K2.classicalPlusEquiv_KSpace`: Transport `β` along the based equivalence between `BGL⁺` and the zero component of the ring K-space of GeneralAlgebraicKTheory §3.2.

**Checks.**

- For the zero ring, `St=E=1` and both comparisons are the unique maps between trivial groups.
- For `z∈K₂(R), α_R⁻¹α_R(z)=z` and `β_R⁻¹β_R(z)=z`; neither comparison is merely a map factoring through the trivial group.
- For identity and composable unital ring maps the two naturality squares compose to the identity and composite squares with the actual induced maps.
- For every `z, hur_R(p_R,*⁻¹β_R(z))=H₂^top(j_R)(γ_R(α_R(z)))`; the intermediate value `γ_R(α_R(z))` lies in space homology of `BE`, not group homology of `E`. This checks carrier alignment and the direction of Hurewicz.
- The square applies to the unital quotient map `Z→Z/2`; injectivity or invertibility of the ring map is not a hypothesis.

*Needs:* StableHomotopyKTheory §3.29; §0.3; KTheoryLowDegrees §6.2; StableHomotopyKTheory §3.31; StableHomotopyKTheory §3.12; StableHomotopyKTheory §3.30; StableHomotopyKTheory §§1.30, 1.32; AlgebraicTopology Stage 8; GeneralAlgebraicKTheory Layer 3.

### 4.2 The normalised classical-to-plus comparison

For an associative unital ring `A` in `Type`, write `s_A : St(A) → E(A), C_A = ker(s_A)`, and `i_A : BGL(A) → X_A = BGL(A)⁺` relative to `E(A)`, based at the vertex and its image. Put `F_A = F(i_A,x_A)`, with paths from `i_A(z)` to `x_A, U_A = π₁(F_A)`, and `ε_A : U_A → E(A)` the factor of the fibre projection. Let `δ_A : Additive(π₂(X_A,x_A)) ≃+ Additive(ker ε_A)` be the positive loop-space connecting map of StableHomotopyKTheory §2.4, corestricted to the kernel. Let `κ_A : Additive C_A ≃+ H₂(E(A);ℤ)` and `κ_F,A : Additive(ker ε_A) ≃+ H₂(E(A);ℤ)` be the StableHomotopyKTheory §3.29 kernel identifications, using the same Hopf transgression convention. Define `ρ_A = κ_F,A ∘ δ_A` and `χ_A = ρ_A⁻¹ ∘ κ_A`. Written additively, `ρ_A` is the equivalence TauCeti.plusConstruction.pi2Equiv of StableHomotopyKTheory §3.29 for `G = GL(A), P = E(A)`: that construction builds it from this connecting map and StableHomotopyKTheory §3.29 applied to the fibre extension, so `ρ_A` is consumed from StableHomotopyKTheory Layer 3 and not constructed a second time here. This specifies an additive equivalence `Additive C_A ≃+ Additive(π₂(X_A,x_A))`. It realises the existence-and-naturality statement of §4.1 by Weibel's fibre route (Proposition IV.1.7, Corollary IV.1.7.1), with an explicit normalisation; the Hurewicz composite `β_R` of §4.1 is a second natural equivalence with the same source and target, and no equality `χ_A = β_A` is asserted. Here `H₂(E;ℤ)` means the underlying additive group of groupHomology.H2 (Rep.trivial `ℤ E ℤ`). (Weibel, §III.5, Definition 5.3.1, Lemma 5.3.3, Example 5.3.4 and Theorem 5.5, pp. 219, 220; Weibel, §IV.1, Homotopy Fiber 1.2; Proposition 1.7 and Corollary 1.7.1, pp. 262, 264, 265.)

`A` is an associative ring with 1; commutativity, nontriviality, regularity and finiteness are not assumed. `E(A)` and `St(A)` are the stable groups, not fixed finite-rank groups. The stable Steinberg extension and `ε_A` are universal central extensions of the perfect group `E(A)`. `i_A` is a plus construction in the local-coefficient/acyclic sense, not just an integral homology equivalence; all spaces have the CW models supplied by StableHomotopyKTheory Layers 1–3.

Provide the following API.

- `K2Comparison.fromHomology`: Given the established `κ_A` and `ρ_A, χ_A` is their composite `κ_A` followed by `ρ_A⁻¹`. A light general form accepts an actual group homomorphism `s:S→E` and equivalences `Additive(ker s)≃+H₂(E;ℤ)` and `Additive(π₂X)≃+H₂(E;ℤ)`.
- `K2Comparison.fromHomology_normalise`: For every `z, ρ_A(χ_A(z))=κ_A(z)`.
- `K2Comparison.fromHomology_symm`: For every `v` in `Additive(π₂X_A), χ_A⁻¹(v)=κ_A⁻¹(ρ_A(v))`.
- `K2Comparison.fromHomology_unique`: An additive homomorphism c:Additive `C_A→Additive(π₂X_A)` with `ρ_A∘c=κ_A` equals `χ_A`.
- `K2Comparison.fromHomology_fibre`: For the unique UCE isomorphism `a_A:St(A)≃*U_A` over `E(A), δ_A∘χ_A` is its restriction to the kernel, written additively.
- `K2Comparison.fromHomology_pi2Equiv`: For a ring `A, ρ_A` is the additive form of StableHomotopyKTheory's TauCeti.plusConstruction.pi2Equiv for `G = GL(A), P = E(A)`, so `χ_A` is `κ_A` followed by the inverse of that equivalence. A user never needs the fibre-level definition of `ρ_A` beyond this identification and `fromHomology_fibre`.
- `K2Comparison.fromHomology_add`: `χ_A(0)=0, χ_A(z+w)=χ_A(z)+χ_A(w)`, and `χ_A(-z)=-χ_A(z)`; the inverse obeys the corresponding identities.

**Checks.**

- For `z` in `Additive C_A, ρ_A(χ_A(z))=κ_A(z)`, using the fixed Hopf map of §1.1 rather than an unspecified automorphism of `H₂`.
- For `v` in `Additive(π₂X_A), χ_A(κ_A⁻¹(ρ_A(v)))=v`.
- For the zero ring, every stable Steinberg generator is `x_ij(0)=1`, so `C_A` and `π₂X_A` are trivial and `χ_A` is the unique equivalence between their additive groups.
- If `κ_A(z)≠-κ_A(z)`, the map `z↦-χ_A(z)` fails the normalisation equation at `z`. In the light composition template with all three additive groups `ℤ` and both equivalences the identity, 1 maps to 1 and not to -1; this template test is not a computation of `K₂(ℤ)`.

*Needs:* StableHomotopyKTheory §3.29; §0.3; §3.3; KTheoryLowDegrees §6.2; StableHomotopyKTheory §§1.30, 1.32; GeneralizedCohomology G2.10; StableHomotopyKTheory §§2.4–2.5; StableHomotopyKTheory §2.7; StableHomotopyKTheory §2.8; Mathlib `groupHomology.H2`; Mathlib `Rep.trivial`; Mathlib `HomotopyGroup`; Mathlib `MonoidHom.ker`; Mathlib `MulEquiv.toAdditive`; Tau Ceti `HomotopyGroup.mapHom`.

### 4.3 Naturality of the normalised comparison

For every unital ring homomorphism `f:A→B`, let `C(f):C_A→C_B` be the kernel map of §0.3 and `f⁺:X_A→X_B` a plus map with its comparison homotopy over `BGL(f)`. Use a based square, or transport basepoints along the specified tracks and use the trivial `π₁(X_B)-action` supplied by the block-sum H-space structure of StableHomotopyKTheory §4.14. Then `ρ_B ∘ π₂(f⁺) = H₂(E(f);ℤ) ∘ ρ_A` and `χ_B ∘ Additive(C(f)) = Additive(π₂(f⁺)) ∘ χ_A`. In the first equality the `π₂` groups are written additively. `H₂(E(f);ℤ)` is exactly groupHomology.map of `E(f)`, with the identity morphism of trivial integral coefficients, in degree 2. These maps satisfy identity and composition on groups, although the chosen plus-space maps need only do so up to homotopy. (Weibel, §IV.1, Functoriality 1.1.2; Proposition 1.7 and Corollary 1.7.1, pp. 261, 264, 265.)

`A` and `B` are associative unital rings in `Type`; `f` preserves 1. For a free comparison homotopy the target `X_B` has trivial `π₁-action` on `π₂`; StableHomotopyKTheory §4.14 supplies the block-sum H-space structure on the ring plus model and the triviality of the `π₁ = K₁(B)` action on every `π_n`. The same abelianness is the hypothesis under which StableHomotopyKTheory Layer 3/plus-construction-functoriality produces `f⁺`.

**Checks.**

- For `f=id_A` both squares are identities, and for `A→B→D` the square for the composite equals the composite of the squares.
- A free homotopy without a specified track or a trivial target action is not used as equality of based homotopy-group maps.
- `κ` and `ρ` use the same `H₂(E(f);ℤ)`, not `H₂(GL(f);ℤ)`.

*Needs:* StableHomotopyKTheory §3.29; §3.3; §4.2; StableHomotopyKTheory §3.30; StableHomotopyKTheory §3.27; StableHomotopyKTheory §3.15; StableHomotopyKTheory §4.14; Mathlib `groupHomology.map`; Mathlib `groupHomology.map_id`; Mathlib `groupHomology.map_comp`; Mathlib `MonoidHom.toAdditive`; Tau Ceti `TauCeti.homotopyGroupTransport_map`.

### 4.4 Independence of the plus model

Let `i_A:BGL(A)→X_A` and `i′_A:BGL(A)→X′_A` be two ring plus models, and let `u:X_A→X′_A` be a homotopy equivalence under `BGL(A)`. For a based comparison homotopy, or with its basepoint track and the trivial `π₁-action` on `π₂` of the target ring model, `u_* χ_A=χ′_A` and `ρ′_A u_*=ρ_A`. Consequently the transported comparison is independent of the representative `u` and of the homotopy used under `BGL(A)`. For arbitrary choices of CW, fibre and Hopf-presentation models, the same statements hold through their specified comparison maps; no literal equality of elements in different carriers is asserted. (Weibel, §III.5, Definition 5.3.1 and Lemma 5.3.3, p. 219; Weibel, §IV.1, Definition 1.1; Theorem 1.5; Corollary 1.7.1, pp. 260, 263, 265.)

Both plus maps kill `E(A)` and preserve homology with all quotient local coefficients. `u` is under `BGL(A)`, with the basepoint policy of the naturality theorem. Arbitrary self-equivalences of the bare target `X_A` are not allowed.

**Checks.**

- Taking `X′_A=X_A` and `u` homotopic to the identity under `BGL(A)` gives `u_*χ_A=χ_A`.
- A mere abstract isomorphism `C_A≅π₂X_A` does not determine the comparison; normalisation and the map under `BGL(A)` are retained.

*Needs:* StableHomotopyKTheory §3.29; §4.3; StableHomotopyKTheory §3.26; StableHomotopyKTheory §4.14; StableHomotopyKTheory §3.15; Tau Ceti `HomotopyGroup.mulEquivOfHomotopyEquiv`; Tau Ceti `TauCeti.homotopyGroupTransport_map`.

### 4.5 The comparison with the projective-module K-space

Let `K_Q(A)=ΩBQ(Proj_fg(A))`, based at the constant loop, and let `K_Q(A)₀` be its path component of zero with inclusion `j_A`. Use the natural zero-component equivalence `η_A:X_A≃K_Q(A)₀` supplied by GeneralAlgebraicKTheory Layer 3. Define `Ξ_A=(j_A)_* ∘ (η_A)_* ∘ χ_A : Additive C_A ≃+ Additive(π₂(K_Q(A),0))`, with any needed basepoint track retained. The inclusion of the path component induces an isomorphism on based `π₂`. The equivalence `Ξ_A` is natural in all unital ring maps, using scalar extension on finitely generated projectives, and is invariant under the compatible model comparisons above. No representatives of nonzero `K₀-components` are chosen. (Weibel, §IV.4, Theorem 4.11 and Corollary 4.11.1; §IV.7, Theorem 7.1 and Corollary 7.2 with proof; §IV.1, Functoriality 1.1.2, pp. 308, 309, 328, 261.)

`A` is an associative unital ring in `Type`. GeneralAlgebraicKTheory Layer 3 constructs `Proj_fg(A), K_Q(A)`, its zero component, `η_A` and their compatibility with scalar extension and direct sum.

Provide the following API.

- `K2Comparison.toQuillen`: `Ξ_A` is `χ_A` followed by `η_A` on `π₂` and the zero-component inclusion. The light template composes an actual `kernel-to-π₂` equivalence with an actual homotopy equivalence; the component-inclusion step is supplied separately.
- `K2Comparison.toQuillen_apply`: For `z, Ξ_A(z)=j_A*(η_A*(χ_A(z)))`.
- `K2Comparison.toQuillen_symm`: For `v` in `π₂K_Q(A), Ξ_A⁻¹(v)=χ_A⁻¹(η_A*⁻¹(j_A*⁻¹(v)))`.
- `K2Comparison.toQuillen_natural`: For any unital `f:A→B, Ξ_B C(f)=K_Q(f)_* Ξ_A`; identities and composition hold on groups.
- `K2Comparison.toQuillen_model_independent`: Compatible changes of the Q/group-completion and plus models transport `Ξ_A` through the induced based `π₂` equivalences; the zero-component comparison square must be retained.

**Checks.**

- For each `z, j_A*(η_A*(χ_A(z)))=Ξ_A(z)`; the inverse transports back to `z`.
- For the zero ring the category of finitely generated projective modules is equivalent to the zero exact category, so `π₂K_Q(A)=0` and `Ξ_A` is the unique equivalence from `C_A=0`.
- Scalar extension `ℤ→ℤ/2ℤ`, although not flat, gives `K_Q(f)_* Ξ_ℤ=Ξ_(ℤ/2ℤ) C(f)`; the statement does not require a flatness instance.
- `Ξ_A` always lands at the zero basepoint. Changing a chosen representative of a nonzero `K₀-class` is not an input to `Ξ_A` and cannot change it; no natural `K₀(A)×X_A` splitting of infinite-loop spaces is inferred.

*Needs:* §4.2; §4.3; §4.4; GeneralAlgebraicKTheory Layer 3; Tau Ceti `HomotopyGroup.mulEquivOfHomotopyEquiv`; Mathlib `MulEquiv.toAdditive`.

### Examples

- For the zero ring every group involved is trivial and both comparisons are the unique maps.
- Scalar extension `ℤ → ℤ/2`, which is not flat, still gives the naturality square for the Quillen comparison.

### Dependencies

Layers 1–3; StableHomotopyKTheory Layers 1–4; GeneralAlgebraicKTheory Layer 3; KTheoryLowDegrees §6.2; AlgebraicTopology Stage 8.

## Layer 5: Steinberg pairings and Milnor K-theory

Steinberg pairings `F^× × F^× → A`, the universal degree-two presentation, Milnor K-theory `K_*ᴹ(F)` as the quotient of the tensor algebra of `F^×` by the two-sided ideal generated by `a ⊗ (1 − a)`, its grading and functoriality, the integral sign rules (`{a, b} = −{b, a}`, `{a, a} = {a, −1}`), and the classical calculations: `K_nᴹ(𝔽_q) = 0` for `n ≥ 2`, unique divisibility over algebraically closed fields, `K_nᴹ(ℝ) = ℤ/2 ⊕` divisible. The arithmetic high-degree computations follow the norm construction in Layer 10.

### 5.1 Bilinear Steinberg pairings

For an abelian group `A` written additively, `IsSteinbergPairing(c)` for `c:Fˣ×Fˣ→A` means `c(ab,d)=c(a,d)+c(b,d), c(a,bd)=c(a,b)+c(a,d)`, and `c(a,b)=0` whenever `a+b=1` in `F`. The last condition uses the field values of two units, so neither zero nor a fake totalised inverse enters the definition. (Matsumoto, §5, Lemma 5.6 and bilinear conditions (S°), pp. 27–28; Weibel, III.6.1, p. 231.)

`F` is a field and `A` is an `AddCommGroup`.

Provide the following API.

- `IsSteinbergPairing`: The three equations in the statement.
- `pairing_postcompose`: For `f:A→+B` and a Steinberg pairing `c, f∘c` is a Steinberg pairing.
- `pairing_pullback`: For a field homomorphism `f:F→E, c(f(a),f(b))` is a Steinberg pairing over `F`.
- `pairing_one_left`: Every Steinberg pairing satisfies `c(1,b)=0`.
- `pairing_one_right`: Every Steinberg pairing satisfies `c(a,1)=0`.

**Checks.**

- The constant zero map is a Steinberg pairing for every `F` and `A`.
- The constant function with value 1 in `ℤ` is not a Steinberg pairing, since its bilinearity at `(1,1,1)` would give `1=2`.
- Over `ℝ`, the pairing to `ℤ/2` with value 1 exactly when both arguments are negative has values `c(-1,-1)=1, c(-1,1)=0` and `c(2,-1)=0`; it satisfies the three equations.

*Needs:* Mathlib `Additive`; Mathlib `Units`.

### 5.2 Universal degree-two symbol presentation

Put `U=Additive Fˣ` and `P₂(F)=(U⊗ℤU)/R₂`, where `R₂` is the `ℤ-submodule` spanned by `a⊗b` for unit pairs with `a+b=1`. Let `p(a,b)` be the quotient class of `a⊗b`. For every abelian `A`, evaluation on `p` gives a bijection between additive maps `P₂(F)→A` and Steinberg pairings `Fˣ×Fˣ→A`. (Weibel, III.6.1 and III.7.1, pp. 231, 245.)

`Suggested.lean` defines `steinbergRelations`, `SymbolGroup` and `symbol` for the field Dennis–Stein presentation in §13.4.

Provide the following API.

- `SymbolGroup`: The quotient `P₂(F)` with its `AddCommGroup` and `ℤ-module` structures.
- `symbol`: The class `p(a,b)` of the pure tensor.
- `presentation_universal`: For every Steinberg pairing `c` to `A`, there is exactly one `f:P₂(F)→+A` satisfying `f(p(a,b))=c(a,b)`.
- `presentation_hom_ext`: Maps `P₂(F)→+A` agreeing on every `p(a,b)` agree.
- `presentation_relations`: The pairing `p` is bilinear and `p(a,b)=0` if `a+b=1`.

**Checks.**

- `P₂(F₂)=0` because `F₂ˣ` is trivial, before using Matsumoto.
- `p(1/2,1/2)=0` over `ℚ` because the entries sum to one.
- Over `ℝ, p(-1,-1)` is nonzero because the sign pairing descends and sends it to 1 in `ℤ/2`.

*Needs:* §5.1; Mathlib `TensorProduct.lift`; Mathlib `Submodule.liftQ`; Mathlib `Submodule.span`.

**The degree-two tensor realization.** Set `T₂(F)=U⊗ℤU, R₂(F)=spanℤ{a⊗b : a,b∈F× and a+b=1 in F}`, and `Q₂(F)=T₂(F)/R₂(F)`. Let `symbol(a,b)` be the quotient class of `a⊗b`. For every abelian group `A`, evaluation on symbols identifies `Homℤ(Q₂(F),A)` with bilinear maps `U×U→A` annihilating these complementary-unit tensors. (Weibel, Definition III.7.1, Theorem III.6.1, pp. 245, 231.)

Provide the following API.

- `SymbolTensor`: `T₂(F)=Additive Fˣ⊗ℤAdditive Fˣ`.
- `steinbergRelations`: `R₂(F)` is the `ℤ-span` of `a⊗b` with `a+b=1`.
- `SymbolGroup`: `Q₂(F)=T₂(F)/R₂(F)`.
- `symbol`: For units `a,b, symbol(a,b)` is their tensor class.
- `symbol_mul_left`: `symbol(ab,c)=symbol(a,c)+symbol(b,c)`.
- `symbol_mul_right`: `symbol(a,bc)=symbol(a,b)+symbol(a,c)`.
- `symbol_steinberg`: If `a+b=1` in `F` then `symbol(a,b)=0`.
- `symbol_one_left`: `symbol(1,a)=0`.
- `symbol_one_right`: `symbol(a,1)=0`.
- `symbol_inv_left`: `symbol(a⁻¹,b)=−symbol(a,b)`.
- `universal`: Every bilinear complementary-zero pairing factors through a unique linear map `Q₂(F)→A`.
- `hom_ext`: Two linear maps out of `Q₂(F)` agreeing on all symbols are equal.
- `map_exists`: A field map induces a unique linear map sending symbols to symbols of mapped units; the maps respect identity and composition.

**Checks.**

- `symbol(1,a)=0` for any field and unit `a`.
- `symbol(a,b)=0` when `a+b=1`, with both entries units.
- `symbolℝ(−1,−1)≠0`; the presentation is not the exterior square of `ℝ×`.
- There exists a linear map `Q₂(ℝ)→ℤ/2` whose value on `symbolℝ(−1,−1)` is 1 and whose value on every complementary-unit symbol is 0. A zero or exterior-square presentation fails this check.
- `Q₂(𝔽₃)` is trivial.
- `symbol𝔽₂(a,a)=0` for every unit `a`.

*Needs:* Mathlib `TensorProduct.lift`; Mathlib `Submodule.liftQ`; Mathlib `Additive`.

### 5.3 Integral symbol identities

Every Steinberg pairing satisfies `c(a,-a)=0, c(a,b)=-c(b,a), c(a,a)=c(a,-1)`, and `2c(a,a)=0`. In characteristic two `c(a,a)=0`. The assertion `c(a,a)=0` is false for general integral coefficients. (Weibel, III.5.10.2–5.10.4; III.6.1, pp. 225, 231; Matsumoto, §5, Proposition 5.7(a),(c), pp. 28–29.)

**Checks.**

- No division by `1-a` occurs in the `a=1` branch.
- The real sign pairing has `c(-1,-1)=1`, disproving integral alternation.
- Characteristic-two diagonal vanishing is stated separately from skew-symmetry.

*Needs:* §5.1.

**Field-only proof of the symbol sign identities.** For any bilinear pairing `c:F××F×→A` into an abelian group with `c(a,1−a)=0` for `a≠0,1`, one has `c(a,−a)=0, c(a,b)=−c(b,a), c(a,a)=c(a,−1)`, and `2c(a,a)=0`. In characteristic two `c(a,a)=0`. The statement applies to the classical symbol of §6.4 and to the tensor realization, without a general-ring localization theorem. (Weibel, Discussion following Theorem III.6.1, Definition III.7.1, pp. 231, 245.)

`F` is a commutative field; `A` is an abelian group; `c` is bilinear in multiplicative units and annihilates complementary units.

**Checks.**

- No assumption that `1−a` is a unit is made when `a=1`; that case has its own normalization argument.
- Over `ℝ` the square `c(−1,−1)` need not vanish.
- The proof does not use Matsumoto injectivity or residues.

*Needs:* §5.2.

### 5.4 Milnor K-theory of a field

For a field `F` form the tensor algebra of the multiplicative group written additively, with the degree-one element attached to a nonzero `x` written `l(x)`. Define the graded ring `K^M` of `F` as the quotient of that tensor algebra by the two-sided ideal generated by the homogeneous elements `l(x)` tensor `l(one minus x)` with `x` different from zero and one. The Milnor K-group in degree `n` is the degree-n part, presented by symbols that are multiplicative in each entry and vanish when two consecutive entries sum to one. Degree zero is the integers and degree one is the multiplicative group written additively. When an index `n−1` occurs at `n=0` in the residue algebra, `K⁽ᴹ⁾_j(F)=0` for `j<0`. (Weibel, III.7.1, p. 245.)

`Suggested.lean` defines `milnorRel`, `MilnorK`, `MilnorK.ofUnit`, `MilnorK.symbol` and `MilnorK.degree`. The degree group is the image of Mathlib's homogeneous tensor-algebra submodule in the Steinberg ring quotient.

All tensor products are over the integers.

Provide the following API.

- `MilnorK`: The graded ring, and its degree-n part.
- `MilnorK.symbol`: The symbol of an n-tuple of nonzero elements.
- `MilnorK.symbol_mul`: Multiplicativity in each entry.
- `MilnorK.symbol_steinberg`: A complementary two-entry symbol vanishes; multiplying on either side gives vanishing for consecutive complementary entries in any symbol.
- `MilnorK.zero`: Degree zero is the integers.
- `MilnorK.one`: Degree one is the unit group written additively.
- `MilnorK.map`: Functoriality in the field.
- `MilnorK.hom_ext`: Graded ring maps agreeing on degree-one units are equal, since products of these generate.
- `MilnorK.lift`: A homomorphism `F× ->` degree-one elements of a graded target that kills every Steinberg product extends uniquely to a graded ring map.
- `MilnorK.map_id_comp`: Field maps induce graded maps respecting identity and composition on every symbol.
- `MilnorK.symbol_product`: Concatenating two tuples gives the product of their symbols with degree addition.

**Checks.**

- Degree zero is the integers and degree one is the unit group.
- For a finite field every degree at least two vanishes.
- The quotient is graded, because the ideal is generated in a single degree.
- Permuting entries multiplies a symbol by the permutation sign, as a theorem derived from degree-two skew-symmetry. Repeated entries are retained: over `ℝ, {−1,−1}` is nonzero, so this is not an exterior-algebra quotient.

*Needs:* Mathlib `TensorAlgebra`; Mathlib `Additive`; Mathlib `RingQuot`; Mathlib `Units`.

### 5.5 Homogeneity of the two-sided Steinberg ideal

In the tensor-algebra construction of §5.4, let `T=TensorAlgebra ℤ U, T_d` its homogeneous pieces, and `J` the least two-sided ideal containing `ι(a)ι(b)` for `a+b=1`. Every homogeneous component of every `z∈J` lies in `J`. Moreover `J∩T₀=J∩T₁=0`, and `J∩T₂` is exactly the `ℤ-span` of the Steinberg degree-two products. (Weibel, III.7.1, p. 245.)

**Checks.**

- Use the TensorAlgebra.gradedAlgebra instance, not a new tensor grading.
- Left and right multiplication by degree-one tensors preserve the ideal and raise the relation degree to three.
- Degree-zero and degree-one embeddings into T/J are injective.

*Needs:* §5.2; §5.4; Mathlib `TensorAlgebra.gradedAlgebra`; Mathlib `TwoSidedIdeal`; Mathlib `RingCon.mk'`; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `PiTensorProduct.isEmptyEquiv`.

**The homogeneous Steinberg quotient bridge.** In the tensor algebra of `U` with its grading, identify the degree-n module `T_n` with `U⊗ℤ⋯⊗ℤU (n factors)` using TensorAlgebra.equivDirectSum. For the ungraded Steinberg ring quotient of §5.4, its relation module `R_n` is the sum, over `i+j=n−2`, of images of `T_i⊗R₂⊗T_j` under concatenation; `R₀=R₁=0`. Construct canonical equivalences `K⁽M⁾_n(F)≅T_n/R_n` compatible with concatenation and field maps, including `K⁽M⁾₂(F)≅Q₂(F)`. The natural map from the direct sum of these quotients to the ungraded ring quotient is an additive equivalence. (Weibel, Definition III.7.1, p. 245.)

`n` is a natural number; the generating relations have degree exactly two.

Provide the following API.

- `MilnorK.degreePresentation`: `K⁽M⁾_n(F)≃ₗ[ℤ]T_n/R_n`, sending a symbol to its pure tensor class.
- `MilnorK.degreeTwoEquiv`: `K⁽M⁾₂(F)≃ₗ[ℤ]Q₂(F)`, with positive symbol normalization.
- `MilnorK.relationComponent`: `I∩T_n=R_n`.
- `MilnorK.gradedQuotientEquiv`: The direct sum of degree quotients is the underlying additive group of the tensor-algebra ring quotient.
- `MilnorK.concat_quotient`: Multiplication of pure symbol classes is concatenation, and `R_iT_j+T_iR_j⊆R_{i+j}`.
- `MilnorK.degreePresentation_natural`: Every field map commutes with the degree presentation and with the degree-two equivalence.

**Checks.**

- The degree-zero component and its multiplication are canonically `ℤ`; `1≠0` in the ring.
- The degree-one symbol class identifies `K⁽M⁾₁(F)` with `Additive Fˣ` and sends the unit 1 to zero.
- `degreeTwoEquiv({a,b})=symbol(a,b)`.
- For a free rank-two module with basis `x,y, x⊗y−y⊗x≠0` before imposing relations; a commutative ideal quotient cannot supply this bridge.

*Needs:* §5.2; Mathlib `TensorAlgebra`; Mathlib `TensorAlgebra.gradedAlgebra`; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `RingQuot`.

### 5.6 Milnor quotient grading and symbol API

Refine the Milnor ring `Kᴹ(F)=T/J` by equipping it with the `ℕ-grading` whose degree-d piece is the image of `T_d` under the congruence quotient. The direct sum of these pieces maps isomorphically to `Kᴹ(F)`. Define n-symbols as products of the degree-one unit classes; they generate degree `n`, are multilinear and vanish when consecutive entries sum to one. (Weibel, III.7.1, p. 245.)

Provide the following API.

- `milnor_gradedAlgebra`: The images of `T_d` form an `ℕ-graded ℤ-algebra` decomposition of the Milnor ring.
- `milnor_symbol_mem_degree`: The product `{a₁,…,aₙ}` lies in degree `n`; the empty symbol is 1 in degree zero.
- `milnor_symbol_mul`: Multiplying an i-symbol and a j-symbol concatenates their lists, in that order.
- `milnor_symbol_multilinear`: Multiplication of one unit entry becomes addition of two symbols.
- `milnor_hom_ext`: Ring homomorphisms out of `Kᴹ(F)` are determined by the degree-one unit classes.
- `milnor_low_degrees`: Degrees zero and one are `ℤ` and `Additive Fˣ`, with explicit maps and inverses.

**Checks.**

- For `F₂` the constant 7 survives in degree zero and `1≠0` in `Kᴹ(F₂)`.
- The one-entry symbol `{1}` is zero in degree one, whereas the empty symbol is the ring unit.
- For units `a,b` with `a+b=1`, the degree-four symbol `{r,a,b,s}` vanishes; imposing only a left-ideal relation would not justify the trailing `s`.
- The symbol `{-1}²={-1,-1}` is nonzero over `ℝ`, so the graded ring is not an exterior algebra.

*Needs:* §5.5; Mathlib `RingCon.mk'`; Mathlib `TensorAlgebra.gradedAlgebra`; Mathlib `TensorAlgebra.lift`; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `PiTensorProduct.isEmptyEquiv`; Mathlib `PiTensorProduct.subsingletonEquiv`.

### 5.7 Degree two equals the tensor-square presentation

There is a canonical additive equivalence `Kᴹ₂(F)≃P₂(F)` taking the two-entry Milnor symbol `{a,b}` to `p(a,b)`. This is an equivalence of the two specified quotient constructions; it is independent of classical or Quillen K-theory. (Weibel, III.7.1 and III.6.1, pp. 245, 231.)

**Checks.**

- The equivalence sends `{1/2,1/2}` to zero over `ℚ`.
- Both maps are fixed on symbols; there is no arbitrary chosen isomorphism.

*Needs:* §5.2; §5.6; Mathlib `TensorAlgebra.equivDirectSum`; Mathlib `TensorPower.mulEquiv`; Mathlib `PiTensorProduct.subsingletonEquiv`.

### 5.8 Functorial maps on the Milnor presentation

For a field homomorphism `f:F→E` construct the graded ring map `Kᴹ(f)` induced by units `a↦f(a)`. Its degree-two map corresponds under the tensor-square equivalences to `p(a,b)↦p(f(a),f(b))`; identity and composition are strict map equalities. (Weibel, III.7.1, p. 245; Matsumoto, §9, functorial observations (a),(b), p. 50.)

Provide the following API.

- `milnorFieldMap`: A graded ring homomorphism from the Milnor ring of `F` to that of `E`.
- `milnorFieldMap_symbol`: An n-symbol maps to the n-symbol of its images, with unchanged entry order.
- `milnorFieldMap_id`: The identity field map induces the identity ring map.
- `milnorFieldMap_comp`: For `F→E→L` the composite of induced maps equals the map of the composite.
- `milnorFieldMap_degreeTwo`: The degree-two square with the two tensor-square presentation maps commutes.

**Checks.**

- Under `ℚ→ℝ, p(-1,-1)` maps to `p(-1,-1)`, detected by the real sign pairing.
- The identity of `F₂` is the identity on degree zero `ℤ`, even though its degree-two group vanishes.
- The image of `{a,b,c}` is `{f(a),f(b),f(c)}`, not the reversed symbol, which would introduce a permutation sign.

*Needs:* §5.6; §5.7; Mathlib `TensorAlgebra.lift`.

### 5.9 A real symbol detecting the integral diagonal

Define `ε:ℝˣ→ℤ/2` to be 1 on negative units and 0 on positive units. The function `c∞(a,b)=ε(a)ε(b)` is a Steinberg pairing. It descends to `P₂(ℝ)→ℤ/2` and therefore detects the nonzero order-two class `{-1,-1}` in Milnor and classical `K₂(ℝ)`. It also defines a graded map `Kᴹ(ℝ)→(ℤ/2)[t]` sending the degree-one class of a to `ε(a)t`. (Weibel, III.6.2.1; III.7.2(c), pp. 232, 245.)

`F=ℝ` and the coefficient target is `ℤ/2`.

Provide the following API.

- `realSignPairing`: The `ℤ/2-valued` function with value 1 exactly when both units are negative.
- `realSignPairing_isSteinberg`: The displayed function satisfies the pairing predicate.
- `realSignDetector`: The unique `P₂(ℝ)→+ℤ/2` evaluating on symbols as realSignPairing.
- `realGradedSignDetector`: The map to `(ℤ/2)[t]` sends `{a₁,…,aₙ}` to `(Π_i ε(a_i))t^n`.

**Checks.**

- `c∞(-1,-1)=1`.
- `c∞(2,-1)=0` and `c∞(-1,1)=0`.
- `c∞(-1,2)=0` since the inputs sum to one.
- Its diagonal at -1 is nonzero, despite skew-symmetry in the additive group `ℤ/2`.

*Needs:* §5.1; §5.2; §5.3; §5.6; Mathlib `TensorAlgebra.lift`.

### 5.10 Skew-symmetry of Milnor symbols

Permuting Milnor-symbol entries multiplies by the permutation sign. Repeated-entry symbols are killed by 2 but can be nonzero integrally; in characteristic two a repeated adjacent pair vanishes because `{a,a}={a,-1}` and `-1=1`. (Weibel, III.7.1, p. 245; Weibel, III.6.3, p. 234.)

`F` is a field; the entries are nonzero.

**Checks.**

- A transposition changes the sign.
- A symbol with a repeated entry is two-torsion but not necessarily zero, which is the same caveat as in degree two.
- A square root of -1 is NOT sufficient for integral vanishing. In `F=C(t), {t,t}={t,-1}` has tame residue -1 at `t=0` and is nonzero, although `i` belongs to `F`. In characteristic two it vanishes; modulo 2 it vanishes if -1 is a square.

*Needs:* §5.3; §5.4.

**Permutation signs without integral alternation.** In the Milnor ring, interchanging adjacent unit entries negates an n-symbol. A permutation `π` multiplies a symbol by `sign(π)`. A consecutive repeated entry can be replaced by (a,-1); in characteristic two such a consecutive repeat vanishes. The sign rule alone does not make all repeated-entry symbols vanish integrally. (Weibel, III.7.1–7.2(c), p. 245.)

**Checks.**

- The degree-two equation is `{a,a}={a,-1}`, not zero.
- The `ℝ` symbol `{-1,-1,-1}` has a nonzero polynomial detector.

*Needs:* §5.3; §5.6; §5.7; §5.9.

### 5.11 Finite-field tensor-square vanishing

For a finite field `F, P₂(F)=0` and `Kᴹ₂(F)=0`, independently of the classical comparison. Every Steinberg pairing from `F` to an abelian group is zero. (Weibel, III.6.1.1, p. 231.)

`F` is a finite field.

**Checks.**

- `P₂(F₂)=P₂(F₃)=P₂(F₄)=0`.
- No assertion that every skew pairing on a cyclic group is zero substitutes for the Steinberg relation.

*Needs:* §5.2; §5.3; §5.7; Mathlib `isCyclic_of_injective_ringHom`.

**The cyclic-unit symbol annihilator.** Suppose `F×` is cyclic with generator `g` and `c:F××F×→A` is a bilinear Steinberg pairing. If char `F=2`, or if there exist complementary units `a,b` whose exponents relative to `g` are both odd, then `c(g,g)=0` and consequently `c` is identically zero. Every finite field satisfies one of these alternatives. (Weibel, Corollary III.6.1.1, Example III.7.2(a), pp. 231, 245.)

`F` a commutative field with cyclic units; `c` takes values in an abelian group and annihilates complementary units.

**Checks.**

- For `q=3` take `a=b=−1`; the relation directly kills `z`.
- For `q=2` normalization alone kills the symbol.
- This argument does not assert that all finite-field stable `K₂` is symbol-generated without a proof.

*Needs:* §5.3; Mathlib `isCyclic_of_injective_ringHom`.

### 5.12 Milnor K-theory of finite fields

For a finite field Fq and `n >= 2, K_n^M(Fq)=0`. (Weibel, III.7.2(a), p. 245.)

Fq is a finite field. `n >= 2`.

`Suggested.lean` states the vanishing of the native degree group as `MilnorK.finiteField_vanishing`.

**Checks.**

- `K0^M(Fq)=Z` is not covered.
- `K1^M(Fq)=Fq×` is not asserted zero.
- Degrees at least two vanish by generation from degree two.

*Needs:* §5.4; §5.11.

### 5.13 Divisibility and torsion in tensor quotients

Let `p>0`. If abelian groups `U,V` are p-divisible then multiplication by `p` on `U⊗ℤV` is bijective. If multiplication by `p` on an abelian group `T` is bijective and its subgroup `R` is p-divisible, then multiplication by `p` on T/R is bijective. These statements need no torsion-freeness assumption on `U` or `V` themselves. (Weibel, Proposition III.6.4.1, Exercise III.7.3, pp. 235, 257.)

`p` a positive integer; `U,V,T` abelian groups; `R` an additive subgroup or equivalently an `ℤ-submodule` of `T`.

**Checks.**

- Divisibility of a quotient alone does not rule out torsion.
- For `p>1, Q/ℤ` is a counterexample if the subgroup hypothesis is dropped from the quotient claim: `ℤ` is not p-divisible and `Q/ℤ` has nonzero p-torsion. For `p=1` the multiplication map is always the identity.

*Needs:* Mathlib `TensorProduct.lift`; Mathlib `Submodule.liftQ`; Mathlib `rTensor_exact`.

### 5.14 Root factorization divides the homogeneous relation modules

For a prime `p`, assume every polynomial `X^p−a` with `a∈F×` splits into linear factors over `F`. Every relation module `R_n` from §5.5 is p-divisible. For `n≥2`, multiplication by `p` on `T_n/R_n` is bijective. Thus this proves the unique-divisibility statement for algebraically closed fields in exactly degrees `n≥2`. (Weibel, Proposition III.6.4.1, Exercise III.7.3, pp. 235, 257.)

`F` a field, `p` prime; every `X^p−a` for a nonzero splits over `F`; repeated roots are counted with multiplicity.

**Checks.**

- In characteristic `p`, use multiplicities, not a false assertion that there are `p` distinct roots.
- For algebraically closed `F`, the assertion is `n≥2`; it does not assert `F×` is uniquely divisible.

*Needs:* §5.5; §5.13.

**Milnor groups of algebraically closed fields.** For an algebraically closed field `F` and `n >= 2, K_n^M(F)` is uniquely divisible. In degree one `F×` is divisible but need not be uniquely divisible; degree zero is `Z`. (Weibel, Example III.7.2(b), p.245, and Exercise III.7.3, p.257.)

`F` is algebraically closed. `n >= 2`.

`Suggested.lean` states `MilnorK.uniqueDivisible_of_isAlgClosed`: multiplication by every positive integer is bijective on the native degree group.

**Checks.**

- For each prime `p`, multiplication by `p` is both surjective and injective in degree at least two.
- Degree one is excluded: roots of unity prevent unique divisibility of `ℂˣ`.
- In characteristic `p`, root factorizations use multiplicities; distinctness of roots is not assumed.

*Needs:* §5.4; §5.13 and the homogeneous relation argument above.

### 5.15 The positive-entry subgroup over the real field

For `n≥1` let `D_n⊂K⁽M⁾_n(ℝ)` be the `ℤ-span` of symbols with at least one strictly positive entry. Let `e_n={−1,…,−1}`. Then `D_n` is divisible, `e_n` has exact order two, and every class decomposes uniquely as `εe_n+d` with `ε∈ℤ/2` and `d∈D_n`. The sign map sends a symbol to 1 in `ℤ/2` exactly when all entries are negative, and its kernel equals `D_n`. For `n=2` use the light realization `realPositive⊂Q₂(ℝ)`. (Weibel, Example III.7.2(c), real symbol in Example III.6.2.1, pp. 245, 232.)

`n≥1`; the usual ordered field `ℝ`; entries are nonzero units.

`Suggested.lean` defines the positive-entry submodule `MilnorK.realPositive` and states `MilnorK.real_decomposition`, with the inclusion of that submodule and the class `{−1,…,−1}` fixed by the equivalence. It states the ring calculation modulo two as `MilnorK.real_modTwo_equiv_polynomial`, sending the degree-one class of `−1` to the polynomial generator.

Provide the following API.

- `MilnorK.realPositive`: `D_n` is the `span` of degree-n real symbols with a positive entry, `n≥1`.
- `MilnorK.realSign`: The additive sign map is 1 on all-negative symbols and 0 on all others.
- `MilnorK.realSign_kernel`: `ker(realSign)=D_n`.
- `MilnorK.realDecomposition`: `K⁽M⁾_n(ℝ)≃+(ℤ/2)×D_n`, sending `e_n` to `(1,0)`.
- `MilnorK.realPositive_divisible`: For every integer `m>0`, multiplication by `m` on `D_n` is surjective.
- `realPositive`: The degree-two realization is the `span` in `Q₂(ℝ)` of `symbol(a,b)` with `a>0` or `b>0`.
- `realPositive_divisible`: For `m>0` multiplication by `m` on realPositive is surjective.
- `real_sign_exists`: The all-negative pairing descends to a linear sign map `Q₂(ℝ)→ZMod 2` with kernel realPositive.
- `real_minus_one_nonzero`: `symbolℝ(−1,−1)≠0`.
- `real_decomposition`: `Q₂(ℝ)≃ₗ[ℤ]ZMod 2×realPositive`.
- `realPositive_contains`: A real symbol with a positive entry belongs to realPositive.
- `realPositive_excludes_minus_one`: `symbolℝ(−1,−1)∉realPositive`.

**Checks.**

- `D₁` identifies with the positive real units; `e₁` is the class of `−1` and has order two.
- If `a>0`, then `symbolℝ(a,b)∈realPositive` for every `b`.
- `symbolℝ(−1,−1)∉realPositive`.
- Multiplication by two on realPositive is surjective.
- `K⁽M⁾₀(ℝ)=ℤ` is not `(ℤ/2)⊕D₀`; realDecomposition takes `n≥1`.

*Needs:* §5.3; §5.5.

**Milnor K-theory of the real field.** For `n >= 1, K_n^M(R)` is `Z/2` generated by `{-1,...,-1}`, direct sum a divisible subgroup. As a graded ring, `K_*^M(R)/2` is `F2[epsilon]`, with `epsilon` of degree one. (Weibel, III.7.2(c), p. 245.)

`n >= 1` for the group decomposition. The base field is `R`.

*Needs:* §5.4; §5.10.

### Examples

- `{−1, −1} ≠ 0` in `K₂ᴹ(ℝ)`: the sign pairing `c(a, b) = 1` exactly when `a, b < 0` detects it, so Milnor K-theory is not an exterior algebra.
- `K₂ᴹ(𝔽₃) = 0` since `{−1, −1}` is killed by the Steinberg relation at `a = b = −1`; `K₂ᴹ(𝔽₂) = 0` because `𝔽₂^×` is trivial.
- In `ℂ(t), {t, t} = {t, −1}` has tame residue `−1` at `t = 0`, so it is nonzero although `−1` is a square.

### Dependencies

Mathlib tensor algebras, tensor products and quotients.

## Layer 6: Steinberg symbols and the monomial kernel

Steinberg symbols `{r, s} = [h_ij(r), h_ik(s)]` for commuting units of a ring, their bilinearity, skew-symmetry and the Steinberg identity, and Milnor's §9: the monomial subgroup `W_n(A)`, its kernel `C_n(A)`, generation of `C_n(A)` by finite-rank symbols for every commutative ring, and the theorem that for a field the whole kernel of `St_n(F) → E_n(F)` is monomial. Consequently `K₂` of a field is generated by symbols and `K₂(𝔽_q) = 0` without Matsumoto's theorem. The Bruhat cover `St_n(F) = T·W·T` and the unique ordered form of the upper unipotent subgroup are proved here for `SL_n` over a field.

### 6.1 The star product of commuting matrices

If two matrices of `E(R)` commute, lift them to `St(R)` and define their star product to be the commutator of the lifts, an element of `K_2(R)`. The definition does not depend on the lifts, because two lifts differ by central elements. The star product is invariant under simultaneous conjugation by an element of `GL(R)`, is skew-symmetric, and is bilinear. (Weibel, III.5 Steinberg symbols, p. 225.)

`R` is an associative unital ring; the two matrices lie in `E(R)` and commute.

Provide the following API.

- `starProduct`: The star product of two commuting elements of `E(R)`.
- `starProduct_lift_indep`: It does not depend on the chosen lifts.
- `starProduct_conj`: Invariance under simultaneous conjugation by an element of `GL(R)`.
- `starProduct_skew`: Skew-symmetry.
- `starProduct_mul_left`: For `A1,A2,B` in `E(R)`, if each `Ai` commutes with `B` then `(A1*A2) star B=(A1 star B)*(A2 star B)`. No mutual commutation of `A1` and `A2` is required.
- `starProduct_mul_right`: For `A` commuting with `B1` and `B2` in `E(R)`, `A star (B1*B2)=(A star B1)*(A star B2)`.

**Checks.**

- For `A` in `E(R)`, `A star A=1` using the same lift twice.
- Over `Z` in rank three, `e_01(1)` and `e_12(1)` do not commute; their lifted commutator maps to `e_02(1)`, so it cannot be a K2-valued star input.
- Over `Z, diag(-1,-1,1)` star `diag(-1,1,-1)` is `{-1,-1}`, the nontrivial `K2(Z)` class once Layer 12 supplies that computation.
- For `A1,A2` each commuting with `B`, the product rule holds; omit either commutation proof and the construction is ill-typed.

*Needs:* §0.3; §2.2; Mathlib `commutatorElement`; KTheoryLowDegrees Layer 6.

### 6.2 Weyl lift words

For `i != j` and a unit `r`, define `w_ij(r)=x_ij(r)x_ji(-r^-1)x_ij(r)`. Its elementary image has block `[[0,r],[-r^-1,0]]` at coordinates `i,j`. (Weibel, III.5.10.1, p. 225.)

`R` is an associative unital ring; `r` and `s` are commuting units.

Provide the following API.

- `Steinberg.w`: The indexed word `w_ij(r)` for `i != j`.
- `Steinberg.w_toGL`: `phi(w_ij(r))` has `r,-r^-1` in the two off-diagonal positions.
- `Steinberg.w_map`: Unital ring homomorphisms preserve the indexed word and its elementary image.

**Checks.**

- `w_01(1)` has block [[0,1],[-1,0]].
- `w_01(-1)` has block [[0,-1],[1,0]].
- Over `Q, w_12(2)` has off-diagonal entries 2 and -1/2 in positions (1,2),(2,1), and entry 1 at `(0,0)`.

*Needs:* §0.3; Mathlib `Units`; Mathlib `Matrix.diag2_decompose`; Tau Ceti `Matrix.SpecialLinearGroup.diag2nUnit_decompose`.

### 6.3 Diagonal lift words

For `i != j` and a unit `r`, define `h_ij(r)=w_ij(r)w_ij(-1)`. Its elementary image is diagonal with `r,r^-1` in positions `i,j`. (Weibel, III.5.10.1, p. 225.)

`R` is an associative unital ring; `r` and `s` are commuting units.

Provide the following API.

- `Steinberg.hDiag`: For `i != j` and a unit `r`, define `h_ij(r)=w_ij(r)w_ij(-1)`. Its elementary image is diagonal with `r,r^-1` in positions `i,j`.
- `Steinberg.hDiag_toGL`: The image is `diag(r,r^-1)` on coordinates `i,j`.
- `Steinberg.hDiag_map`: Ring homomorphisms preserve `h_ij(r)`, retaining the two indices.

**Checks.**

- `h_01(1)` has identity elementary image.
- Over `Q, h_01(2)` has diagonal image (2,1/2,1).
- Over `Q, h_12(2)` has diagonal image (1,2,1/2).

*Needs:* §6.2.

### 6.4 The Steinberg symbol

For commuting units `r` and `s` of a ring `R` define the Steinberg symbol as the star product of the diagonal matrix with `r` and `r` inverse at two coordinates with the diagonal matrix with `s` and `s` inverse at two coordinates chosen to overlap in exactly one index. Equivalently it is the commutator of the elements `h_ij(r)` and `h_ik(s)` of `St(R)`, where `w_ij(r)` is the word `x_ij(r) x_ji(minus r inverse) x_ij(r)` and `h_ij(r)` is `w_ij(r) w_ij(minus one)`. The symbol is skew-symmetric and bilinear. (Weibel, III.5.10 and III.5.10.1, p. 225.)

`R` is an associative unital ring; `r` and `s` are commuting units.

Provide the following API.

- `steinbergSymbol`: The symbol of two commuting units.
- `steinbergSymbol_eq_commutator`: It is the commutator of `h_ij(r)` and `h_ik(s)`.
- `steinbergSymbol_one`: The symbol with a one entry is trivial.
- `steinbergSymbol_mul_left`: Bilinearity for a pairwise commuting triple `r1,r2,s` of units. Over a commutative ring the commuting hypotheses are automatic.
- `steinbergSymbol_skew`: Skew-symmetry.
- `steinbergSymbol_index_indep`: Independence of the chosen indices.
- `steinbergSymbol_map`: Unital ring homomorphisms preserve the commuting-unit symbol and its indexed commutator formula.

**Checks.**

- The symbol with a one entry is trivial.
- For the integers the symbol of minus one with itself is the nontrivial element of `K_2(Z)`.
- The product rule holds for pairwise commuting units `r1,r2,s`; in a commutative field it has no extra condition.
- The symbol of a with itself is not trivial in general, which §6.9 computes.

*Needs:* §0.3; §6.1; §6.2; §6.3; Mathlib `Matrix.diag2_decompose`; Tau Ceti `Matrix.SpecialLinearGroup.diag2nUnit_decompose`; Mathlib `Units`.

### 6.5 Field Weyl and diagonal lift calculus

Use the words `w_ij(a)=x_ij(a)x_ji(-a⁻¹)x_ij(a)` and `h_ij(a)=w_ij(a)w_ij(-1)`. In `St_n(F), n≥3`, their conjugation on every root subgroup is the signed and rescaled matrix Weyl/torus action. In particular `w_ij(a)⁻¹=w_ij(-a), h_ij(a)x_kl(t)h_ij(a)⁻¹=x_kl(d_k t d_l⁻¹)`, where `d_i=a,d_j=a⁻¹` and all other `d_k=1`. (Steinberg, §6, Lemma 37(a)–(f), pp. 67–68; Weibel, Exercise III.5.8(a)–(e), p. 229.)

**Checks.**

- Rank two is excluded.
- At `a=-1` the elementary image of `h` is `diag(-1,-1)`; it is not the identity over `ℚ`.
- Disjoint root coordinates are fixed; adjacent parameters have the displayed scaling.

*Needs:* §0.3; §6.2; §6.3; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit_reverse`.

**Weyl conjugation and commutator-symbol normalization.** For commutative `F` and pairwise distinct `i,j,k` in `St_m(F), m≥3, w_ij(r)w_ij(−r)=1, w_ij(r)x_ij(s)w_ij(r)⁻¹=x_ji(−r⁻²s)`, and `w_ij(r)x_ji(s)w_ij(r)⁻¹=x_ij(−r²s)`. After stabilization, or in a compatible central extension, the commutator convention of §6.4 gives `{r,s}=h_ij(rs)h_ij(r)⁻¹h_ij(s)⁻¹=h_ij(r)h_ij(s)h_ij(rs)⁻¹`. This fixes the positive normalization when comparing Matsumoto’s cocycle with the classical symbol. (Weibel, Exercises III.5.8–5.9, with the torus-factor order corrected, p. 229; Matsumoto, Lemma 5.4(c), p.26.)

`r,s∈F×` for torus expressions; the root parameter in conjugation can be any field element; `m≥3`.

**Checks.**

- The coefficient `−r⁻²s` is required in the opposite-root conjugation formula.
- The two inverse torus factors appear in order `r` then `s`; reversing them changes the result in general.
- No finite-rank kernel centrality is assumed from the stable centre theorem; the torus-defect equality is asserted stably or in an explicitly central extension.

*Needs:* §0.3; §6.2; §6.4.

### 6.6 Diagonal commutator equals the toral defect

In stable `St(F)`, for distinct `i,j,k` and units `a,b`, the chosen classical symbol `s(a,b)=[h_ij(a),h_ik(b)]` equals `c_ij(a,b)=h_ij(a)h_ij(b)h_ij(ab)⁻¹`. The positive roots `e_i-e_j` and `e_i-e_k` have Cartan pairing `+1`. The corresponding simple adjacent roots instead have pairing -1; their toral commutator is `c(a,b)⁻¹`. (Matsumoto, §5, Lemma 5.4(a)–(d), p. 26; Weibel, III.5.10.1 and Exercise 5.9, p. 225.)

**Checks.**

- The normalization is the displayed commutator, not its inverse.
- The matrix image of `c_ij` is 1, but that fact alone is not used to conclude `c_ij=1`.
- The comparison agrees with Matsumoto’s cocycle for the `+1` root overlap.

*Needs:* §2.2; §6.4; §6.5.

### 6.7 The Steinberg identity

If `r` and `1-r` are units of an associative unital ring, the Steinberg symbol `{r,1-r}` is 1. (Weibel, III.5.10.2, III.5.10.3 and III.5.10.4, p. 225.)

`R` is an associative unital ring; `r` is a unit, and for the first statement one minus `r` is also a unit.

**Checks.**

- Both `r` and `1-r` must be units.
- The two entries commute because `(1-r)r=r(1-r)`.
- No symbol with a zero entry is constructed.

*Needs:* §0.3; §6.4.

### 6.8 The symbol of a unit and its negative

For every unit `r` of an associative unital ring `R, {r,-r}=1`, without requiring `1-r` to be invertible. (Weibel, III.5.10.3-.4, p. 226.)

`R` is an associative unital ring and `r` is a unit.

**Checks.**

- Over `ℤ` take `r=−1: {−1,1}=1` although `1−r=2` is not a unit. A hypothesis requiring `1−r` to be a unit would lose this case.
- At `r=1` the identity is `{1,−1}=1`, with no symbol having a zero entry.
- Over `ℝ` take `r=−1`. The conclusion concerns `{−1,1}`, whereas `{−1,−1}` is nontrivial by the real sign detector; it does not assert that every diagonal symbol vanishes.

*Needs:* §6.4; §6.7.

### 6.9 Skew-symmetry, and the correct value of the symbol of a unit with itself

The Steinberg symbols are skew-symmetric: the symbol of a with `b` times the symbol of `b` with a is trivial. The symbol of a with itself is the symbol of a with minus one, which is an element of order dividing two; it is not trivial in general. Asserting that the symbol of a with itself vanishes integrally is an error. (Weibel, III.6.1, p. 231.)

`R` is an associative unital ring; a and `b` are commuting units.

**Checks.**

- For the integers the symbol of minus one with itself is the nontrivial element of `K_2(Z)`, so the symbol of a unit with itself is not always trivial.
- For a finite field of even order the symbol of a with itself is trivial, because minus one is one there.
- Skew-symmetry gives the permutation-sign law of Milnor K-theory; it does not force repeated-entry symbols to vanish integrally.

*Needs:* §6.4; §6.7; §6.8.

### 6.10 The monomial subgroup `W_n(A)` of the Steinberg group and its kernel `C_n(A)`

Let `A` be a commutative ring and `n ≥ 3`, let `St_n(A)` be the finite-rank Steinberg group of §0.3 and `φ_n : St_n(A) → E_n(A) ⊆ GL_n(A)` its elementary map (§0.3). The monomial subgroup `W_n(A) ⊆ St_n(A)` is the subgroup generated by the Weyl lift words `w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u)`, for `i ≠ j` and `u ∈ A^×` (§6.2). It contains every diagonal lift `h_ij(u) = w_ij(u) w_ij(−1)` (§6.3). The monomial kernel is `C_n(A) = W_n(A) ∩ ker φ_n`. Its image is described by Milnor's Lemma 9.1: `φ_n(W_n(A))` is exactly the group of monomial matrices of determinant one, the matrices `P_π·diag(v_1, …, v_n)` with `π` a permutation, `P_π e_k = e_{π(k)}`, every `v_k ∈ A^×` and `sign(π)·v_1⋯v_n = 1`. (Milnor, §9, opening definitions and Lemma 9.1, p. 71.)

`A` is a commutative ring: the determinant condition and the diagonal-lift calculus use commutativity. `n ≥ 3`, using §0.3’s finite-rank carrier; `i, j` are distinct indices in `{1, …, n}` and `u` ranges over `A^×`.

Provide the following API.

- `Steinberg.monomialSubgroup`: `W_n(A)`: the subgroup of `St_n(A)` generated by all `w_ij(u), i ≠ j, u ∈ A^×`.
- `Steinberg.w_mem_monomialSubgroup`: `w_ij(u) ∈ W_n(A)`.
- `Steinberg.h_mem_monomialSubgroup`: `h_ij(u) ∈ W_n(A)`.
- `Steinberg.monomialKernel`: `C_n(A) = W_n(A) ⊓ ker φ_n`.
- `Steinberg.mem_monomialKernel_iff`: `z ∈ C_n(A) ↔ z ∈ W_n(A) ∧ φ_n z = 1`.
- `Steinberg.toElementary_monomialSubgroup`: Lemma 9.1: the image of `W_n(A)` in `GL_n(A)` is the set of permutationGL `π ·` diagGL `v` with `sign(π)·∏ v_k = 1`.
- `Steinberg.monomialSubgroup_map`: For `f : A →+* B`, Steinberg.map `f` carries `W_n(A)` into `W_n(B)` and `C_n(A)` into `C_n(B)`.
- `Steinberg.monomialSubgroup_stabilise`: Stabilisation carries `W_n(A)` into `W_{n+1}(A)` and `C_n(A)` into `C_{n+1}(A)`.
- `Steinberg.monomialSubgroup_int`: For `n ≥ 3, W_n(ℤ)` is generated by the `w_ij(1)`; it is IntegerSteinbergModel.monomialSubgroup of §12.6.

**Checks.**

- Over `ℤ` with `n = 3, φ_3(w_12(1))` is the matrix with rows `(0, 1, 0), (−1, 0, 0), (0, 0, 1)`. Its square is `diag(−1, −1, 1) = φ_3(h_12(−1))` and its fourth power is 1.
- Over `𝔽₂` the only unit is 1 and `−1 = 1`, so `φ_3(w_ij(1))` is the permutation matrix of the transposition `(i j)`, and `φ_3(W_3(𝔽₂))` is the group of the six `3 × 3` permutation matrices.
- Over `𝔽₅, h_12(2) ∈ W_3(𝔽₅)` and `φ_3(h_12(2)) = diag(2, 3, 1)`, which is not a signed permutation matrix. A definition that generates `W` by the `w_ij(±1)` alone, as the integer model does, is too small for a general ring.
- Over `𝔽₃, φ_3(W_3(𝔽₃))` has `3!·2² = 24` elements: the `3 × 3` monomial matrices of determinant one.
- For `n ≥ 3, W_n(ℤ)` equals the monomial subgroup of §12.6, generated by the `w_ij(1)`.

*Needs:* §0.3; §6.2; §6.3; Mathlib `Subgroup.closure`; Mathlib `Matrix.det_permutation`; Tau Ceti `TauCeti.permutationGL`; Tau Ceti `TauCeti.diagGL`; Tau Ceti `TauCeti.det_diagGL`.

### 6.11 Conjugation by the monomial subgroup permutes the root generators (Milnor 9.2–9.5)

Let `A` be commutative and `n ≥ 3`. For `w ∈ W_n(A)` write `φ_n(w) = P_π·diag(v_1, …, v_n)` (§6.10). For `i ≠ j, λ ∈ A` and `u ∈ A^×: (a) w x_ij(λ) w⁻¹ = x_{π(i)π(j)}(v_i λ v_j⁻¹)`; `(b) w w_ij(u) w⁻¹ = w_{π(i)π(j)}(v_i u v_j⁻¹)` and `w h_ij(u) w⁻¹ = h_{π(i)π(j)}(v_i u v_j⁻¹)·h_{π(i)π(j)}(v_i v_j⁻¹)⁻¹`; `(c) w_ij(u)⁻¹ = w_ij(−u)` and `w_ij(u) = w_ji(−u⁻¹)`; `(d)` the subgroup `H_n(A)` generated by the `h_ij(u)` is normal in `W_n(A)`; `(e) C_n(A)` lies in the centre of `St_n(A)`. These are Milnor's Lemma 9.2, Corollaries 9.3 and 9.4 and Lemma 9.5. (Milnor, Lemma 9.2 with its seven-case proof, pp. 71–73; Milnor, Corollaries 9.3 and 9.4, pp. 71–72; Milnor, Lemma 9.5 and the example before it, p. 73.)

`A` is commutative and `n ≥ 3`; `i ≠ j, λ ∈ A, u ∈ A^×`. `P_π e_k = e_{π(k)}` and `φ_n(w) = P_π D` with `D = diag(v_1, …, v_n)`; this factorisation exists by §6.10.

**Seven root positions over a ring.** It suffices to conjugate by `w_ab(u)`, because `W_n` is generated by these words and the proposed action composes with multiplication of monomial matrices. Let `c,d` lie outside `{a,b}`; in the first row `c≠d`. With the commutator convention of §0.3, the seven cases are

| Input | Conjugate by `w_ab(u)` |
| --- | --- |
| `x_cd(λ)` | `x_cd(λ)` |
| `x_ac(λ)` | `x_bc(−u⁻¹λ)` |
| `x_bc(λ)` | `x_ac(uλ)` |
| `x_ca(λ)` | `x_cb(−λu)` |
| `x_cb(λ)` | `x_ca(λu⁻¹)` |
| `x_ab(λ)` | `x_ba(−u⁻²λ)` |
| `x_ba(λ)` | `x_ab(−u²λ)` |

For the first five rows, expand `w_ab(u)=x_ab(u)x_ba(−u⁻¹)x_ab(u)`, conjugating successively from the right. Use only additivity and the two three-distinct-index commutator relations. For example, `x_ac(λ)` first commutes with `x_ab(u)`, then becomes `x_bc(−u⁻¹λ)x_ac(λ)` under `x_ba(−u⁻¹)`; the final `x_ab(u)` contributes `x_ac(−λ)`, cancelling `x_ac(λ)`. This gives the second row, including its negative sign. The other three shared-index rows follow by the same two-factor collection; the distant row commutes with all three factors.

For either remaining row choose `c` distinct from `a,b` and use `x_ab(λ)=[x_ac(λ),x_cb(1)]` or `x_ba(λ)=[x_bc(λ),x_ca(1)]`. The already established rows turn these into `[x_bc(−u⁻¹λ),x_ca(u⁻¹)]=x_ba(−u⁻²λ)` and `[x_ac(uλ),x_cb(−u)]=x_ab(−u²λ)`, respectively. Thus opposite roots are derived using rank three, never assumed as extra presentation relations. No nonzero nonunit is inverted and no field Bruhat theorem is used.

Additivity immediately gives `w_ab(u)⁻¹=w_ab(−u)`. To obtain `w_ab(u)=w_ba(−u⁻¹)`, write `X=x_ab(u), Y=x_ba(−u⁻¹)`. The last row gives `(XYX)Y(XYX)⁻¹=X`; cancellation yields `YXY=XYX`. Conjugating the defining `w` and `h` words now gives `(b)`. In particular, writing `c=v_i v_j⁻¹`, the conjugate of `h_ij(u)` is `w_(πi,πj)(cu)w_(πi,πj)(−c)=h_(πi,πj)(cu)h_(πi,πj)(c)⁻¹`. This proves normality of `H_n`. Finally, an element of `C_n` has identity elementary image, so the seven-case action fixes every root generator; such an element is central. The zero ring is harmless: every root parameter and generator is trivial, so no uniqueness of its monomial permutation is needed.

Provide the following API.

- `Steinberg.w_conj_root`: The seven displayed formulas with their explicit index hypotheses, for arbitrary commutative `A` and `n≥3`.
- `Steinberg.monomial_conj_root`: Formula `(a)` for any monomial word and any stated decomposition of its elementary image.
- `Steinberg.monomial_conj_w_h`: Formula `(b)` and normality of the subgroup generated by the diagonal words.
- `Steinberg.monomialKernel_le_center`: `C_n(A)≤Z(St_n(A))`, deduced from the action on generators.

**Checks.**

- Over `ℤ: w_12(1) x_12(λ) w_12(1)⁻¹ = x_21(−λ)` and `w_12(1) x_13(λ) w_12(1)⁻¹ = x_23(−λ)`.
- `w_12(1)⁴ = h_12(−1)⁻²` lies in `C_n(ℤ)`, so it is central in `St_n(ℤ)`.
- Over a field, the same-root and opposite-root cases agree with §6.5.
- Over `𝔽₅` with `u=2, w_12(2)` conjugates `x_21(1)` to `x_12(1)`, since `−2²=1`, and conjugates `x_23(1)` to `x_13(2)`. A permutation-only action misses the coefficient; replacing `u` by `u⁻¹` gives 3 in the second result.
- In characteristic two the two negative signs become positive, but the powers `u` and `u⁻¹` still differ in, for example, `𝔽₄`. Rank two is excluded from the third-index derivation.

*Needs:* §0.3; §6.2; §6.3; §6.10; Mathlib `Subgroup.center`; Mathlib `Subgroup.Normal`; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.transvectionUnit_injective`; Tau Ceti `TauCeti.permutationGL_mul_diagGL_mul_inv`.

### 6.12 The finite-rank Steinberg symbol `{u, v}_n` in `C_n(A)`

Let `A` be commutative and `n ≥ 3`. For `u, v ∈ A^×` and pairwise distinct indices `i, j, k` put `{u, v}_n = [h_ij(u), h_ik(v)] = h_ij(u) h_ik(v) h_ij(u)⁻¹ h_ik(v)⁻¹ ∈ St_n(A)`. Then: `(a) {u, v}_n = h_ik(uv) h_ik(u)⁻¹ h_ik(v)⁻¹` (Lemma 9.6); `(b) {u, v}_n ∈ C_n(A)`, so it is central; `(c)` it does not depend on the triple `(i, j, k)`; `(d)` it is bimultiplicative and skew-symmetric, `{v, u}_n = ({u, v}_n)⁻¹` (Lemma 9.7); `(e) {u, 1 − u}_n = 1` when `u` and `1 − u` are units, and `{u, −u}_n = 1` (Lemma 9.8); `(f)` stabilisation sends `{u, v}_n` to `{u, v}_{n+1}`, and its image in the stable group `St(A)` is the Steinberg symbol `{u, v}` of §6.4; `(g)` a ring map `f` sends `{u, v}_n` to `{f(u), f(v)}_n`. Milnor calls this the sharper, finite-rank meaning of the symbol. (Milnor, Lemmas 9.6 and 9.7, pp. 73–74; Milnor, Lemma 9.8 and its proof, pp. 74–75; Milnor, Lemmas 8.1–8.2, pp. 63–64; Milnor, Theorem 10.1, p. 81.)

These finite-rank targets use §0.3’s Steinberg carrier and are specified in the README.

`A` is commutative and `n ≥ 3`; `u, v ∈ A^×`; `i, j, k` pairwise distinct. Commutators are `[a, b] = aba⁻¹b⁻¹`, the convention of §6.4 and of §6.5.

Provide the following API.

- `Steinberg.finiteRankSymbol`: `{u, v}_n := [h_12(u), h_13(v)]` at the standard triple `(1, 2, 3)`.
- `Steinberg.commutator_h_eq_finiteRankSymbol`: For pairwise distinct `i, j, k: [h_ij(u), h_ik(v)] = {u, v}_n`.
- `Steinberg.finiteRankSymbol_eq_h`: For pairwise distinct `i, j, k: {u, v}_n = h_ik(uv) h_ik(u)⁻¹ h_ik(v)⁻¹`.
- `Steinberg.finiteRankSymbol_mem_monomialKernel`: `{u, v}_n ∈ C_n(A)`; in particular it is central in `St_n(A)`.
- `Steinberg.finiteRankSymbol_mul_left`: `{uu′, v}_n = {u, v}_n {u′, v}_n`.
- `Steinberg.finiteRankSymbol_mul_right`: `{u, vv′}_n = {u, v}_n {u, v′}_n`.
- `Steinberg.finiteRankSymbol_swap`: `{v, u}_n = ({u, v}_n)⁻¹`.
- `Steinberg.finiteRankSymbol_one_left`: `{1, v}_n = 1` and `{u, 1}_n = 1`.
- `Steinberg.finiteRankSymbol_one_sub`: If `u` and `1 − u` are units, `{u, 1 − u}_n = 1`.
- `Steinberg.finiteRankSymbol_neg`: `{u, −u}_n = 1` for every unit `u`.
- `Steinberg.finiteRankSymbol_stabilise`: Stabilisation sends `{u, v}_n` to `{u, v}_{n+1}`; the image in `St(A)` is `steinbergSymbol u v` of §6.4.
- `Steinberg.finiteRankSymbol_map`: For `f : A →+* B`, Steinberg.map `f {u, v}_n = {f u, f v}_n`.
- `Steinberg.finiteRankSymbol_neg_one_neg_one_int`: Over `ℤ, {−1, −1}_n = w_12(1)⁴`.

**Checks.**

- Over `ℤ, {−1, −1}_3 = h_13(−1)⁻² = w_12(1)⁴`, the element `(x_12 x_21⁻¹ x_12)⁴` of Milnor's Theorem 10.1.
- `{1, v}_n = 1`, because `h_ij(1) = 1`.
- The commutator `[h_12(−1), h_12(−1)]` is trivially 1, whereas `{−1, −1}_3 ≠ 1` in `St_3(ℤ)`, since its stable image is detected by the real sign symbol. A definition by a commutator with a repeated index pair is wrong.
- Under stabilisation, `{u, v}_n` is Layers 5–8's Steinberg symbol `{u, v}`. Over `ℝ, {−1, −1}_3` maps to the class that §12.5 sends to `−1`.
- `φ_n({u, v}_n) = 1`, because the diagonal matrices `diag(u, u⁻¹, 1)` and `diag(v, 1, v⁻¹)` commute.

*Needs:* §0.3; §6.3; §6.4; §6.7; §6.10; §6.11; Mathlib `commutatorElement`; Mathlib `Subgroup.center`.

### 6.13 Steinberg's theorem: the monomial kernel `C_n(A)` is generated by symbols (Milnor 9.11)

Let `A` be a commutative ring and `n ≥ 3`. The monomial kernel `C_n(A) = W_n(A) ∩ ker φ_n` is the subgroup generated by the finite-rank symbols `{u, v}_n, u, v ∈ A^×` (Milnor's Theorem 9.11, due to Steinberg). In particular `C_n(A)` is abelian and central in `St_n(A)`, and the description is compatible with stabilisation and with ring maps. For `A = ℤ, C_n(ℤ)` is generated by `{−1, −1}_n = w_12(1)⁴` and has at most two elements. (Milnor, Theorem 9.11 (statement p. 76, proof pp. 77–78); Milnor, Lemma 9.10, p. 76; Milnor, §9 opening sentence, p. 71.)

`A` is commutative and `n ≥ 3`. The theorem concerns `W_n(A) ∩ ker φ_n` only. That the whole kernel of `φ_n` lies in `W_n` is a separate statement: §6.16 proves it for fields, and §12.8 for `ℤ`.

**Arbitrary-ring word reduction.** Let `S` be the subgroup generated by the symbols of §6.12. Those symbols lie in `C_n` and are central by §6.11, so `S` is normal in `W_n` and contained in `H_n`. Work first with nonzero `A`. In `W_n/H_n` write `q_i` for the class of `w_(i,i+1)(1)`. Since `w_ij(u)=h_ij(u)w_ij(1)`, the unit parameters disappear. Conjugation from §6.11 expresses every `w_ij(1)` through adjacent `q_i`. Distant `q_i` commute, `q_i²=1` since `w_(i,i+1)(1)²=h_(i,i+1)(−1)⁻¹`, and the adjacent conjugations give the braid relation: both `q_i q_(i+1) q_i` and `q_(i+1) q_i q_(i+1)` are the class of `w_(i,i+2)(1)`, with the possible sign parameter absorbed in `H_n`. Thus the Coxeter presentation gives a surjection `S_n→W_n/H_n`. The actual permutation of the monomial elementary image gives an inverse, because each `q_i` has its indicated adjacent transposition. Hence `W_n/H_n≃S_n` and `C_n⊆H_n`.

Next work modulo `S`. The toral-defect formula §6.12(a) makes each `u↦h_ij(u)` multiplicative. Opposite orientations give `h_ji(u)=h_ij(u)⁻¹`: indeed `w_ji(u)=w_ij(−u⁻¹)`, so `h_ji(u)=h_ij(−u⁻¹)h_ij(−1)⁻¹`. For distinct `i,j,k`, conjugating `w_jk(1)` by `w_ij(u)`, and using `w_ij(u)=h_ij(u)w_ij(1)`, gives

`h_ik(u)=h_ij(u)·(w_ik(1)h_ij(u)⁻¹w_ik(1)⁻¹)`
`=h_ij(u)h_kj(u)⁻¹=h_ij(u)h_jk(u)`

in `W_n/S`. For the middle equality, the exact conjugation formula before using multiplicativity is `h_ij(u)h_kj(−1)h_kj(−u)⁻¹`. Thus every diagonal word is generated by adjacent `h_i(u)=h_(i,i+1)(u)`. These adjacent groups commute: disjoint roots commute directly, the same root uses multiplicativity and commutativity of `Aˣ`, and for adjacent roots use `h_jk=h_ij⁻¹h_ik` and `[h_ij(u),h_ik(v)]∈S`. Consequently each element of `H_n/S` has a representative `∏_(i=1)^(n−1)h_i(c_i)`. Its diagonal elementary image has entries `c₁,c₁⁻¹c₂,…,c_(n−2)⁻¹c_(n−1),c_(n−1)⁻¹`. If that image is identity, successive coordinates force every `c_i=1`; the representative is identity modulo `S`. Therefore `C_n⊆S`, proving `C_n=S`. This proof uses only the arbitrary-ring conjugations and finite-rank toral identities, never a field pivot or a semilocal presentation. For the zero ring all root generators are trivial, so `C_n=S=1` without a permutation quotient.

Provide the following API.

- `Steinberg.monomial_mod_diagonal`: For nonzero commutative `A`, the specified permutation map `W_n/H_n≃S_n`, with its adjacent-word inverse.
- `Steinberg.diagonal_mod_symbols`: Modulo `S`, the diagonal subgroup is the determinant-one unit torus, with coordinates `∏h_i(c_i)` and inverse `c_i=d₁⋯d_i`.
- `Steinberg.monomialKernel_eq_symbols`: `C_n=S` for every commutative `A` and `n≥3`, including the zero ring, compatibly with coefficient maps and stabilization.

**Checks.**

- Over `ℤ, C_3(ℤ) ⊆ {1, w_12(1)⁴}`. With §12.8 this bounds `K₂(ℤ)`, which is its use in §12.9.
- Over a finite field, together with §6.12 `(d), (e)` and the cyclic-annihilator argument (§5.11), `C_n(𝔽_q) = 1`: Milnor's Corollary 9.9.
- The reduction modulo `H` uses only the permutation part of `φ_n`: for a nonzero ring `A, W_n(A)/H_n(A)` maps onto the symmetric group, and the word reduction shows that this map has trivial kernel.
- For the zero ring the Steinberg group is trivial; no permutation quotient is asserted in that case.

*Needs:* §0.3; §5.11; §6.3; §6.10; §6.11; §6.12; Mathlib `Subgroup.closure`; Mathlib `Subgroup.center`; Tau Ceti `TauCeti.diagGL`.

### 6.14 The upper unipotent subgroup `T_n(A)` maps isomorphically onto `U_n(A)` (Milnor 9.14)

Let `A` be a commutative ring and `n ≥ 3`, and let `T_n(A) ⊆ St_n(A)` be the subgroup generated by the `x_ij(λ)` with `i < j`. Every element of `T_n(A)` is a product `∏_{i<j} x_ij(λ_ij)`, with the factors in lexicographic order of `(i, j)` and uniquely determined `λ_ij ∈ A`. Consequently `φ_n` restricts to an isomorphism of `T_n(A)` onto the upper unitriangular group `U_n(A)` (Tau Ceti's upperUnitriangularGroup). Moreover, for each `i < n` the subgroup `T′_i` generated by the `x_kl(μ), k < l, (k, l) ≠ (i, i + 1)`, is normal in `T_n(A)`, and `T_n(A) = x_{i,i+1}(A)·T′_i`. (Milnor, Lemma 9.14, pp. 78–79.)

`A` is commutative and `n ≥ 3`; the order on pairs `(i, j), i < j`, is lexicographic.

Provide the following API.

- `Steinberg.upperUnipotent`: `T_n(A)` is the subgroup generated by `x_ij(a)` with `i < j`.
- `Steinberg.upperUnipotentComplement`: For `i < n, T′_i` is generated by all positive roots except `(i, i+1)`; `T′_i` is normal in `T_n(A)`.
- `Steinberg.orderedUpperProduct`: A family `(a_ij)` for `i < j` gives the lexicographically ordered product in `T_n(A)`. Every element is obtained uniquely.
- `Steinberg.toElementary_upperUnipotent`: The restriction of `φ_n` is a group isomorphism `T_n(A) ≃ U_n(A)`, with `U_n(A)` Tau Ceti’s upperUnitriangularGroup.
- `Steinberg.upperUnipotent_ext`: Elements of `T_n(A)` with equal elementary images are equal; their unique ordered coordinates agree.
- `Steinberg.upperUnipotent_map`: A ring map sends ordered coordinates to their images and carries `T_n` and `T′_i` into their counterparts. Identity and composition hold on generators.
- `Steinberg.upperUnipotent_simpleRoot_factor`: For fixed `i`, every `t ∈ T_n(A)` is `x_{i,i+1}(a)t′` with unique `a ∈ A` and `t′ ∈ T′_i`; a is the `(i,i+1)` entry of `φ_n(t)`.

**Checks.**

- Over `ℤ, x_12(1)x_13(0)x_23(1)` has `(1,3)` entry 1. Replacing ordered coordinates by raw matrix entries misses this cross term.
- Over `ℤ, [x_12(1),x_23(1)] = x_13(1) ≠ 1`; the positive-root subgroup is not a product with coordinatewise addition.
- For `n=3` and `i=1, T′_1` consists of `x_13(b)x_23(c)`, with `(1,2)` entry zero. It contains `x_13(1)`, and excludes `x_12(1)` over `ℤ`.
- For the zero ring both `T_n(A)` and `U_n(A)` are trivial, and the unique ordered parameter family is zero.

*Needs:* §0.3; Tau Ceti `TauCeti.upperUnitriangularGroup`; Tau Ceti `TauCeti.UpperUnitriangularGroup.ext`; Tau Ceti `TauCeti.transvectionUnit`; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`; Tau Ceti `TauCeti.commute_transvectionUnit`.

### 6.15 For a field, `St_n(F) = T·W·T` (Milnor 9.15)

Let `F` be a field and `n ≥ 3`. Every element of `St_n(F)` lies in `T_n(F)·W_n(F)·T_n(F)`, where `T_n(F)` is the upper unipotent subgroup of §6.14 and `W_n(F)` the monomial subgroup. (Milnor, Lemma 9.15 and its proof, pp. 79–80.)

`F` is a commutative field and `n ≥ 3`. Milnor states the lemma for skew fields as well; it is used here for fields only.

**Checks.**

- The matrix shadow is the Bruhat decomposition `SL_n(F) = ⋃ U·N·U`, and the upper-triangular monomial matrices are diagonal `(tauceti:TauCeti.UpperTriangularGroup.mem_diagonalTorus_of_mem, over fields with a unit other than 1)`.
- For `n = 3` and `F = 𝔽₂`, every element of `St_3(𝔽₂)` is `t₁ w t₂` with `t₁, t₂` upper unipotent and `w` in the group generated by the `w_ij(1)`.
- Only cases 1–3 occur, and case 2 needs `λ` invertible: the lemma is stated for fields.

*Needs:* §0.3; §6.2; §6.10; §6.11; §6.14.

### 6.16 For a field, the whole Steinberg kernel is monomial and generated by symbols (Milnor 9.12)

Let `F` be a field and `n ≥ 3`. The kernel of `φ_n : St_n(F) → E_n(F)` is contained in `W_n(F)`, hence equals `C_n(F)`. So it is central in `St_n(F)` and is generated by the finite-rank symbols `{u, v}_n` (§6.13): `St_n(F) → E_n(F)` is a central extension whose kernel is generated by symbols, for every `n ≥ 3`. Passing to the colimit, `K₂(F)` is generated by the stable Steinberg symbols `{u, v}` (Milnor's Theorem 9.12 and Corollary 9.13); this is the field clause of §6.18. (Milnor, Theorem 9.12 (statement p. 78, proof p. 80); Milnor, Corollary 9.13 and the remark after it, p. 78; Weibel, Theorem III.5.10.5 and the sentence before it, p. 226; Moreno Ramírez, Theorem 4.3.22 and proof, pp. 108–109, for the finite-rank containment.)

`F` is a commutative field and `n ≥ 3`. For skew fields Milnor proves the containment of the kernel in `W_n` but not generation by symbols, which needs commutativity (§6.13). The field case is stated here; the symbol-generation conclusion is asserted only for commutative fields.

**Checks.**

- For `F = 𝔽_q` every finite-rank symbol is 1, by §6.12 `(d), (e)` and the cyclic-annihilator argument. So `St_n(𝔽_q) → E_n(𝔽_q)` is an isomorphism for `n ≥ 3`, and `K₂(𝔽_q) = 1` (Milnor Corollaries 9.9 and 9.13), with no appeal to Matsumoto's theorem.
- For `F = ℝ` the kernel is nontrivial: `{−1, −1}_3` is a nontrivial central element of `St_3(ℝ)`, detected after stabilisation by the real sign symbol.
- Its stable consequence is the field clause of §6.18.

*Needs:* §0.3; §5.11; §6.10; §6.11; §6.12; §6.13; §6.14; §6.15; Tau Ceti `TauCeti.UpperTriangularGroup.mem_diagonalTorus_of_mem`; Tau Ceti `TauCeti.upperUnitriangularGroup`.

### 6.17 Lifted Bruhat reduction and complete toral relations

The following refines §0.4’s stable field presentation to the specified finite ranks.

For `n≥3` and any field `F`, quotient `St_n(F)` by the normal closure of the defects `h_ij(a)h_ij(b)h_ij(ab)⁻¹`. The map from this quotient to `SL_n(F)` is an isomorphism. In the quotient, Bruhat words reduce to `u·h·w·v`, with ordered positive-root products `u,v`, simple-coroot diagonal word `h`, and a chosen signed permutation representative `w`. An element mapping to the identity reduces to the identity; no uniqueness of both outer unipotent factors is claimed. (Steinberg, §6, Lemmas 36–38 and Theorem 8(b), pp. 66–70; Matsumoto, §5, Lemma 5.3, pp. 24–25.)

**Checks.**

- The result includes `n=3` over `F₂` and `F₃`; it does not assert universal centrality in that rank.
- Injectivity is proved through the Bruhat reduction, not from faithfulness of an already defined matrix action.
- Over `ℝ` the defect `h_ij(−1)²h_ij(1)⁻¹` represents `{−1,−1}_n`: it is nonzero before taking the quotient, by the real sign detector after stabilization, and becomes 1 in the quotient. Omitting the toral relations therefore gives the wrong kernel.

*Needs:* §0.3; §6.5; ReductiveGroups Layer 7; RootSystems Layer 3.

### 6.18 Unit symbols generate `K₂` of a commutative semilocal ring

For a commutative semilocal ring `R`, stable `K₂(R)` is generated by the unit symbols of §6.4, with no lower bound on residue-field cardinalities. The field specialization is supplied by §0.4; the additional local and semilocal assertion is proved below. No symbol-generation theorem for an arbitrary division ring is asserted. (Dennis–Stein, Corollary 2.2, p.287, and Theorem 2.7 with proof, pp.292–293; Weibel, III.5.10.5, p.226.)

`R` is a commutative field or a commutative local or semilocal ring. No lower bound on residue-field cardinalities is imposed.

Use the surjection to the product of residue fields and Corollary 2.2 to reduce to the older relative kernel generated by `P(a,q), q∈Jac(R)`. Modulo unit symbols the relations of Proposition 1.1 give additivity in `a, P(a,q)=0` for a a unit, `P(p,q)=0` for `p∈Jac(R)`, and `P(ab,q)=P(a,bq)+P(b,aq)`. Write `R/Jac(R)=𝔽₂^k×S` with `S` a product of fields different from `𝔽₂`. Adding units reduces a to a lift of `(x,0)`, whence 2a and `a²+a` lie in `Jac(R)`. The relations give `2P(a,aq)=0` and `P(a,q)=−2P(a,aq)=0`. Thus the relative generators vanish modulo unit symbols. This uses the older kernel only as a generation argument for absolute `K₂`; it does not identify the homotopy-fibre relative `K₂` of §13.8.

**Checks.**

- For a field the symbols generate, which Matsumoto's theorem then presents.
- For a general commutative ring generation is not asserted.
- The Dennis–Stein symbols of Layer 13 are introduced because symbols need not generate in general.

*Needs:* §0.3; §6.4.

### Examples

- Over `ℤ, {−1, −1}₃ = w₁₂(1)⁴ = (x₁₂(1)x₂₁(−1)x₁₂(1))⁴`, the generator of `K₂(ℤ)`.
- Over `𝔽₅, h₁₂(2)` maps to `diag(2, 3, 1)`, which is not a signed permutation matrix: `W_n(A)` must be generated by all `w_ij(u)`, not only by `u = ±1`.
- `φ₃(W₃(𝔽₃))` has `3!·2² = 24` elements.

### Dependencies

Layers 2–3 and 5; Tau Ceti `diagGL`, `permutationGL`, `upperUnitriangularGroup`; KTheoryLowDegrees §6.2.

## Layer 7: the native Milnor–classical dictionary

§0.4 supplies field Steinberg symbols, their bilinearity and Steinberg relation, Matsumoto's complete presentation, and the vanishing of classical `K₂` of finite fields. Its Matsumoto theorem includes injectivity, not only generation. This layer identifies that supplied presentation with the actual homogeneous degree-two Milnor group of Layer 5 and then develops rational-function and extension consequences. The lifted torus, Weyl and detecting-extension construction of the supplier's presentation is not planned a second time here. (Weibel, Theorem III.6.1 and Examples III.6.1.1–6.1.3, pp.231–232; Matsumoto, §5, Corollary 5.11, pp.30–31.)

### 7.1 The chosen Milnor-to-classical comparison map

Define `φ_F:Kᴹ₂(F)→Additive K₂(F)` as the unique map taking `{a,b}` to the explicit commutator symbol `s(a,b)`. Construct it via `Kᴹ₂(F)≃P₂(F)` and the tensor-square universal property. It is surjective by stable symbol generation; its injectivity is proved separately. (Weibel, III.6.1 and III.7.1, pp. 231, 245.)

Provide the following API.

- `milnorToClassicalK2`: The map `φ_F` with the specified domain and additive target.
- `milnorToClassicalK2_symbol`: `φ_F({a,b})` is `[h_12(a),h_13(b)]` in the stable kernel, written additively.
- `milnorToClassicalK2_unique`: Any additive map with that generator equation is `φ_F`.
- `milnorToClassicalK2_surjective`: Every element of the classical kernel is the image of an element of the actual Milnor degree-two group.

**Checks.**

- `φ_ℚ({1/2,1/2})=0` by the explicit w-word Steinberg calculation.
- `φ_F₂` is the unique map between zero groups after the two independent finite-field arguments.
- The classical real pairing, obtained by applying the supplied Matsumoto presentation to the sign pairing of §5.9, sends `φ_ℝ({-1,-1})` to 1, so the map is not the zero map over all fields.

*Needs:* §5.2; §5.7; §0.4; §6.18.

### 7.2 The comparison is an isomorphism

For every field `F` the map `φ_F:Kᴹ₂(F)→Additive K₂(F)` of §7.1 is bijective. Apply the supplied Matsumoto presentation to the Steinberg pairing `(a,b)↦{a,b}` in the native group `Kᴹ₂(F)`. Its universal property gives an inverse `ψ_F` on classical `K₂`, with `ψ_F([h₁₂(a),h₁₃(b)])={a,b}`. Both composites fix the generating symbols and are identities. This is an adapter between the supplier's presentation and the tensor-algebra grading of §5.7, not a new proof of Matsumoto's theorem. (Weibel, Theorem III.6.1 and Definition III.7.1, pp.231, 245.)

**Checks.**

- The two composites fix every ordered generator `{a,b}`; an inverse that interchanges `a,b` gives inversion and fails when the symbol is not 2-torsion.
- At `F=𝔽₂`, both sides vanish and the two composites are still identities.
- Over `ℝ` the sign detector of §5.9 evaluates the image of `{−1,−1}` to 1 in `ℤ/2`; the comparison is not identically zero.
- The comparison concerns classical `K₂`; the product comparison with Quillen `K₂` is the separate target §8.1.

*Needs:* §5.2; §5.7; §7.1; §0.4.

### 7.3 Naturality of the field presentation

For a field homomorphism `f:F→E` the square with `φ_F,φ_E, Kᴹ₂(f)` and the classical `K₂(f)` of §0.3 commutes. Both equivalences and their inverses are natural. Different choices of stabilizing coordinates give the same `φ`, because its generator equation uses the coordinate-independent stable symbol. (Weibel, III.6.1 and III.7.1, pp. 231, 245; Matsumoto, §9, functorial observations (a),(b), p. 50.)

**Checks.**

- The identity and composite field-map squares commute.
- Naturality is not promoted to injectivity under arbitrary field extensions.

*Needs:* §§0.3–0.4; §5.8; §7.2.

### 7.4 `K_2` of a field is a direct summand of `K_2` of a rational function field, and the torsion kernel

For a field `F, K2(F) -> K2(F(t))` is a split injection. The retraction sends `{f,g}` to `{lc(f),lc(g)}`, where `lc(p/q)=lc(p)/lc(q)`. (Weibel, III.6.1.2, p. 231.)

**Checks.**

- The map is a left inverse on constant symbols.
- The equal-degree cancellation case `lc(f)=1` is handled separately.
- The conclusion is split injectivity for the specified rational function extension.

*Needs:* §6.8; §7.2.

### 7.5 Torsion in field-extension restriction kernels

For every field extension `F <= L`, the kernel of `K2(F) -> K2(L)` is torsion. (Weibel, III.6.1.3, p. 231.)

*Needs:* §7.4; GeneralAlgebraicKTheory §3.2; GeneralAlgebraicKTheory §7.7.

### Examples

- Over `ℚ(t)`, the symbol `{2,t}` goes to the commutator `[h₁₂(2),h₁₃(t)]`, with the two unit entries in the given order.
- The real diagonal class remains nonzero, whereas both native and classical degree-two groups vanish over finite fields.

### Dependencies

Layer 5; §§0.3–0.4; GeneralAlgebraicKTheory §§3.2, 7.7.

## Layer 8: products and the graded map to Quillen K-theory

The product `θ₁[a]·θ₁[b]` of two unit classes is `θ₂({a,b}⁻¹)` for the fixed bar/Hurewicz comparison `θ₂` (so `ε=−1`); the graded ring map `K_*ᴹ(F) → K_*(F)` is built from products of unit classes, its degree-two component is Matsumoto's isomorphism followed by the sign-normalised comparison, and its degree-three component is passed to the downstream consumer K3BlochGroups.

### 8.1 The product of two unit classes and its numerical sign

Let `R` be commutative, `a,b∈Rˣ, θ₁` the positive unit-class comparison of KTheoryLowDegrees §13.1, and `θ₂=β_R` the bar/Hurewicz comparison of §4.1, transported to the ring K-space by GeneralAlgebraicKTheory §§3.12–3.14. Let the product be precisely its §7.4 double-S biexact tensor product, with the first factor followed by the second. Then

`θ₁[a]·θ₁[b]=θ₂({a,b}⁻¹)`.

Thus the sign `ε` relative to this fixed `θ₂` is **`−1`**. Set `θ₂♮(z)=θ₂(z⁻¹)`; this consequence of the sign computation gives `θ₁[a]·θ₁[b]=θ₂♮({a,b})`. Both formulas hold naturally for unital maps of commutative rings. The product-normalized degree-two comparison is `θ₂♮`, while the raw Hopf/Hurewicz comparison stays `θ₂`. (Loday, §2.1.10, p.335, Lemma 2.2.1, pp.336–337, Proposition 2.2.3 and Lemma 2.2.4 with proofs, pp.337–339; Weibel, Theorem IV.7.9, p.331.)

**Comparing the fixed products.** The split exact category of finite projective right R-modules is the category used by the supplier. Tensor product is biexact there. Its double-S grid has successive bidegree quotients `P_ij⊗Q_kl`. Apply Waldhausen's edgewise S/Q comparison in each simplicial direction, keeping their order. The comparison sends a subdivided flag to its quotient spans; on a tensor grid, composition of these spans is the same grid of tensor quotients. Explicitly the relevant square quotient is

`(P_j⊗Q_l)/(P_i⊗Q_l+P_j⊗Q_k)≃(P_j/P_i)⊗(Q_l/Q_k)`.

For these split admissible inclusions the identity follows by choosing splittings and then is independent of the splittings by the quotient universal property. It identifies the two composites on objects and on all quotient-span maps, and respects the zero rows and columns. Thus the edgewise comparison intertwines the supplier's based double-S product with the `bi-Q` product; no simplicial directions are interchanged. This uses the actual double-S pairing following Waldhausen's Proposition 1.5.3, p.342, and his explicit edgewise S/Q construction in §1.9, pp.375–376. The comparison of the `Q` product with the group-completion/plus product is multiplicative for split exact categories by Weibel's Theorem IV.7.9, p.331; the based comparison argument is given in Weibel 1981, §4, diagrams (4.1)–(4.2) and Theorem 4.3, pp.503–505. Restricting its symmetric monoidal groupoids to cofinal finite free modules gives Loday's tensor-matrix plus product. Under the supplier's right-projective automorphism comparison, multiplication by a unit `a` gives `[a]`, rather than `[a⁻¹]`. The scalar loops and their two ordered tensor directions therefore use the same positive orientation. No inverse-transpose adapter is inserted for the commutative-ring calculation.

**Computing the sign on the fixed Hopf map.** Loday's product torus has commuting elementary images `D_a=diag(a,a⁻¹,1)` and `D′_b=diag(b,1,b⁻¹)`. Their Steinberg lifts can be `h₁₂(a),h₁₃(b)`. The product torus's positive fundamental class is the image of `z=[s|t]−[t|s]`. By §1.1 its Hopf image is `[h₁₂(a),h₁₃(b)]⁻¹={a,b}⁻¹`. Absolute Hurewicz and the cover map in `β_R` preserve that specified class. Hence the compared double-S product is `β_R({a,b}⁻¹)`, proving `ε=−1`. Loday's inverse-commutator fibre calculation and his explicit Schur-multiplier calculation agree with this sign; no equality between the entire fibre comparison `χ` and `β` is inferred from a test on only symbol-generated classes over arbitrary rings.

Provide the following API.

- `K2Product.doubleS_Q_comparison`: The based comparison on tensor grids above, including the quotient-square identity, respects the two ordered directions and the zero rows/columns.
- `K2Product.plusQ_bidegree11`: Under the supplier's positive automorphism-class comparison, the double-S `(1,1)` product is the ordered elementary torus class of `(D_a,D′_b)`.
- `K2Product.raw_hopf_sign`: The displayed equality with `θ₂` and the fixed numerical sign `ε=−1`.
- `K2Product.normalized`: The equality with `θ₂♮` and naturality in commutative `R`.

**Checks.**

- In `R=ℚ(t)`, the inverse of raw `θ₂` sends `θ₁[2]·θ₁[t]` to `{2,t}⁻¹`, whose tame residue at `t=0` is 1/2; the inverse of `θ₂♮` sends it to `{2,t}`, whose residue is 2. These are distinct and detect the sign. These values are consequences of the product comparison, not a definition of `θ₂♮` designed to assume it.
- Reversing the product gives `θ₁[b]·θ₁[a]=−θ₁[a]·θ₁[b]`, matching inversion of the ordered symbol and reversal of the torus fundamental class.
- The `𝔽₃` Heisenberg control of §1.1 gives central coordinate 2 for the lifted bar boundary and 1 for the commutator. It distinguishes the positive boundary from its negative before applying the ring comparison.
- At `a=1` or `b=1` both sides vanish. At `b=1−a` with both units, the supplied Steinberg relation gives zero; these cases alone cannot distinguish `ε`.
- The zero ring gives trivial groups and a based zero product. Finite-field `K₂` vanishing and real 2-torsion also cannot calibrate a sign; the non-2-torsion `ℚ(t)` witness is necessary.

*Needs:* §1.1; §3.3; §4.1; §6.4; §6.7; §0.3; GeneralAlgebraicKTheory §§3.12–3.14, 7.2–7.4; KTheoryLowDegrees §§8.1, 13.1; StableHomotopyKTheory §§1.32, 3.12, 3.31; AlgebraicTopology Stages 5, 8.

### 8.2 The graded map from Milnor to Quillen K-theory

Construct the natural graded ring map from Milnor K-theory of a field to Quillen K-theory, determined by the products of degree-one classes. Its degree-two component is Matsumoto's isomorphism followed by the product-normalized comparison `θ₂♮` of §8.1. No isomorphism is asserted in degree three or above. (Weibel, IV.1.10.1, III.7.1, pp. 245, 266; Weibel, VI.4.3.2, p. 482, and Remark VI.5.2.1, p. 488.)

Provide the following API.

- `milnorToQuillen`: The graded ring map.
- `milnorToQuillen_one`: Degree one is the identity on the unit group.
- `milnorToQuillen_two`: Under product-symbol compatibility and Matsumoto, the component `K2^M(F)->Quillen K2(F)` is an isomorphism.
- `milnorToQuillen_map`: Naturality in the field.
- `milnorToQuillen_graded`: It is a map of graded rings.
- `milnorToQuillen_symbol`: Each n-symbol maps to the ordered product of its `n` unit classes in Quillen `K_n(F)`.
- `milnorToQuillen_unique`: A graded map with the same degree-one unit classes is equal by the Milnor universal property.

**Checks.**

- The degree-zero map `Z->Quillen K0(F)` sends 1 to the class of the one-dimensional vector space.
- For `F=Q`, the unit 2 maps to its K1 unit class, corresponding to 2 under determinant.
- `{a,1-a}` maps to zero, and `{-1,-1}` maps to the classical symbol under the K2 comparison.
- In degree three, for `F=Q` the integral component is injective `Z/2->Z/48` and is not onto; this computation (Weibel VI.5.2.1) is a test, not a target of this roadmap.

*Needs:* §5.4; §7.2; GeneralAlgebraicKTheory §7.4; GeneralAlgebraicKTheory Layer 3; KTheoryLowDegrees §8.1.

### 8.3 Degree-two identification with the classical Matsumoto map

Let `F` be a field. Write `m_F : K₂^M(F) ≃ K₂^cl(F)` for the symbol-preserving Matsumoto equivalence, `{a,b} ↦ {a,b}`, obtained from §7.2 through the degree-two presentation of the Milnor ring (§5.5); `θ₂ : K₂^cl(F) ≃ K₂(F)` for the natural comparison of §4.1 in its Hurewicz normalization `β` (§4.1), transported to the Quillen model; and `θ₂♮ = θ₂ ∘ (x ↦ x^ε)` for its normalization by the torus sign `ε=−1` of §8.1. Then the degree-two component `Φ₂` of the unital graded map of §8.2 equals `θ₂♮ ∘ m_F`. In particular `Φ₂` is an isomorphism, natural in unital field homomorphisms. The identity uses the product-symbol theorem; it does not follow from bilinearity or from Matsumoto's theorem alone. (Weibel, III.6.1, III.7.1, IV.1.10–1.10.1, pp. 231, 245, 266; Loday, §2.2, Proposition 2.2.3 with proof, pp.337–338.)

`F` is a commutative field; every symbol entry is a unit. The degree-(1,1) comparison of the biexact product of GeneralAlgebraicKTheory §7.4 with Loday's plus product is the one made in §8.1. `θ₂` is the Hurewicz normalization of §4.1.

**Checks.**

- The equality is on the actual degree-two homomorphism, not merely an abstract isomorphism of its source and target.
- At `ℚ(t)`, the tame residue at `t = 0` of `(θ₂♮)⁻¹Φ₂{2,t}` is 2 in Layers 9–11's convention; the reversed product or the opposite normalization gives 1/2.
- Only the Matsumoto presentation, `θ₂` and the product-symbol theorem give invertibility; checking relations alone does not.
- For a finite field both sides vanish (Weibel III.6.1.1 and III.7.2(a)), so finite fields test nothing about the sign; the infinite fields carry the content.

*Needs:* §4.1; §5.4; §5.5; §7.2; §8.1; §8.2.

### 8.4 The degree-three component

The degree-three component `K3^M(F)->Quillen K3(F)` sends `{a,b,c}` to the ordered product of their unit classes. Its injectivity theorem and the indecomposable cokernel are developed downstream by the consumer K3BlochGroups; the component is constructed here without them. (Weibel, IV.1.10.1, p. 266, and VI.4.3.2, p. 482.)

**Checks.**

- The component sends a Milnor symbol of three units to the product of their classes.
- For a finite field the source vanishes.
- The injectivity theorem is not proved here; it is cited to the consuming layer.

*Needs:* §8.2.

### Examples

- For `ℚ(t), (θ₂♮)⁻¹(θ₁[2]·θ₁[t]) = {2, t}`, whose tame residue at `t = 0` is 2; the opposite normalisation gives 1/2.
- For `ℚ` the degree-three component `ℤ/2 = K₃ᴹ(ℚ) → K₃(ℚ) = ℤ/48` is injective and not onto (Weibel VI.5.2.1).

### Dependencies

Layers 4–7; GeneralAlgebraicKTheory Layer 7 and §3.12; KTheoryLowDegrees §§8.1 and 13.1; StableHomotopyKTheory Layer 3; AlgebraicTopology Stages 5 and 8.

## Layer 9: tame symbols and Milnor residues

For a discrete valuation `v` with uniformiser `π` and residue field `k`: unit parts, the tame symbol `∂_v{f, g} = (−1)^{v(f)v(g)}(f^{v(g)}/g^{v(f)})‾` with its independence of `π`, bilinearity, Steinberg relation and characterisation, its behaviour under ramified embeddings, Serre's residue algebra `L(k)` and the higher residues and specialisations `K_nᴹ(F) → K_{n−1}ᴹ(k), K_nᴹ(k)`, their product formula, their dependence on `π`, a dictionary between the two normalisations in the literature, rigidity for complete fields and the ramification formula in every degree.

### 9.1 The unit part relative to a uniformizer

For a commutative field `F`, a valuation `v:F→ℤᵐ⁰`, and `t∈Fˣ` with `ord_v(t)=1`, define `unitPart(v,t,f)=f·t^(−ord_v(f))` for every `f∈Fˣ`, as an element of the subgroup v.valuationSubring.unitGroup. It has order zero and `f=t^ord_v(f)·unitPart(v,t,f)`; this property uniquely determines it. No residue is taken in this definition. (Weibel, Lemma III.6.3 and its proof, p. 234; Tau Ceti `TauCeti.NumberTheory.LocalField.UnitsDecomposition`.)

`F` is a commutative field. `v` has integer multiplicative values; `t` is a field unit of order one. Surjectivity need not be supplied separately for this definition. `f` is a field unit, so the junk order at zero is never used.

Provide the following API.

- `TameSymbol.unitPart`: For `t∈Fˣ` with `ord(t)=1` and `f∈Fˣ, unitPart(v,t,f)=f·t^(−ord(f))`, packaged in v.valuationSubring.unitGroup.
- `TameSymbol.coe_unitPart`: The underlying field unit of `unitPart(v,t,f)` is `f·t^(−ord(f))`.
- `TameSymbol.unitPart_decomposition`: `f=t^ord(f)·unitPart(v,t,f)` in `Fˣ`.
- `TameSymbol.unitPart_eq_iff`: For `w` in the valuation-subring unit subgroup, `unitPart(v,t,f)=w` iff `f=t^ord(f)·w`.
- `TameSymbol.unitPart_one`: `unitPart(v,t,1)=1`.
- `TameSymbol.unitPart_uniformizer`: `unitPart(v,t,t)=1`.
- `TameSymbol.unitPart_of_unit`: For `w` in the valuation-subring unit subgroup, `unitPart(v,t,w)=w`. In particular this holds after transporting an `Rˣ` element by unitGroupMulEquiv.symm.
- `TameSymbol.unitPart_mul`: `unitPart(v,t,fg)=unitPart(v,t,f)·unitPart(v,t,g)`.
- `TameSymbol.unitPart_inv`: `unitPart(v,t,f⁻¹)=unitPart(v,t,f)⁻¹`.
- `TameSymbol.unitPart_zpow`: For every integer `n, unitPart(v,t,f^n)=unitPart(v,t,f)^n`, including negative `n`.
- `TameSymbol.unitPart_change`: If `t′=tε` for `ε` in the valuation-subring unit subgroup, then `unitPart(v,t′,f)=unitPart(v,t,f)·ε^(−ord(f))`.
- `TameSymbol.unitPart_localField`: For a nonarchimedean local field `K` with its ValuativeRel and topology, let `v:K→ℤᵐ⁰` satisfy `ord_v(x)=(TauCeti.normalizedValuation K x).toAdd` for every `x∈Kˣ`. If `t` has normalized valuation `ofAdd(1)`, identify its order-one witness by this equality. Then the underlying `Kˣ` element of `unitPart(v,t,x)` equals the underlying `Kˣ` element of (TauCeti.unitsEquivIntProd `K t` ht x).2. Use `TauCeti.unitsEquivIntProd` and `TauCeti.coe_unitsEquivIntProd_apply_snd` for this local-field splitting and its second-coordinate formula.

**Checks.**

- For every allowed `v,t, unitPart(v,t,1)=1`.
- For `w∈Rˣ, unitPart` applied to the ambient field unit of `unitGroupMulEquiv.symm(w)` equals that same subgroup element. This rejects a separate residue-class or quotient carrier.
- `unitPart(v,t,t^(−2))=1`. Using the natural absolute value of the order gives `t^(−4)`, which is not even a unit of the valuation ring.
- For `ℚ` at 5 with `t=5`, the unit parts of 2, 10, and 2/5 are all 2 as rational field units. A constant-one or reduction-only function fails these values.
- For `ℚ` at `5, t′=10` is another order-one parameter and `unitPart(v,10,5)=1/2`, whereas `unitPart(v,5,5)=1`.
- Under the local-field compatibility hypotheses of `unitPart_localField`, both unit components of `x=t^(-2)·u`, for `u∈U(K,0)`, have underlying field unit `u`. Comparing underlying `Kˣ` values avoids an unjustified definitional identification of the two unit subgroups.

*Needs:* Tau Ceti `Valuation.ord`; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Tau Ceti `Valuation.valuation_eq_exp_neg_ord`; Mathlib `Valuation.mem_unitGroup_iff`; Mathlib `ValuationSubring.unitGroupMulEquiv`; LocalFieldsRamification Layer 1.

**Unit parts as units of the valuation ring.** For `π∈Fˣ` with `ord_v(π)=1` and `f∈Fˣ`, define `U_π(f)∈Rˣ` to be the unique unit whose field value is `f·π^(−ord_v(f))`. Obtain its data by choosing the witness in `Valuation.exists_eq_zpow_mul_unit_of_surjective` after installing `Valuation.nontrivial_valueGroup_of_surjective` and translating `ord_v(π)=1` to `v.IsUniformizer(π)`. It realizes the unit decomposition of §9.1 with values in the units of the valuation ring, rather than a new valuation ring or symbol presentation. (Weibel, III.6.3, III.7.3, pp. 234, 246.)

Provide the following API.

- `TameSymbol.ringUnitPart`: `U_π(f)` is an actual unit of `R`, for `π` and `f` in `Fˣ` and `ord_v(π)=1`.
- `TameSymbol.ringUnitPart_coe`: The field value of `U_π(f)` is `fπ^(−ord_v(f))`; equivalently `f=π^ord_v(f) U_π(f)`. This equation uniquely characterizes `U_π(f)`.
- `TameSymbol.ringUnitPart_mul`: `U_π(fg)=U_π(f)U_π(g)`. Together with `unitPart_unit` and `unitPart_zpow` this gives the group-homomorphism laws `Fˣ→Rˣ`.
- `TameSymbol.ringUnitPart_zpow`: `U_π(f^m)=U_π(f)^m` for `f∈Fˣ` and `m∈ℤ`.
- `TameSymbol.ringUnitPart_unit`: For `u∈Rˣ, U_π(u)=u`, where `u` is mapped to `Fˣ` by the subtype homomorphism.
- `TameSymbol.ringUnitPart_uniformizer_zpow`: `U_π(π^m)=1` for every `m∈ℤ`.
- `TameSymbol.ringUnitPart_change_uniformizer`: For `c∈Rˣ, U_(cπ)(f)=c^(−ord_v(f)) U_π(f)`.
- `TameSymbol.ringUnitPart_residue_bridge`: For `z` in R.unitGroup, the `unitGroupToResidueFieldUnits(z)` equals `Units.map(residue)(R.unitGroupMulEquiv(z))`; these are the same residue map.

**Checks.**

- For `F=ℚ, ord=ord_5` and `π=5, U_5(10)=2` and `U_5(1/25)=1`. A function returning `f` itself fails both, and a natural-power-only normalization fails the second.
- For `π′=10` at `ord_5, U_10(5)=1/2`, whose residue in `𝔽_5` is `3`; `U_5(5)=1`. The unit factor itself is not independent of `π`.
- `U_π(u)=u` for every `u∈Rˣ`, and `U_π(π^(−2))=1`. This distinguishes the ring unit from an arbitrary field-unit coercion.

*Needs:* Tau Ceti `Valuation.exists_eq_zpow_mul_unit_of_surjective`; Tau Ceti `Valuation.nontrivial_valueGroup_of_surjective`; Tau Ceti `Valuation.isUniformizer_iff_ord_eq_one_of_surjective`; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Mathlib `Units.map`.

### 9.2 The tame symbol of a discrete valuation

Let `v` be a discrete valuation on the field `F`, taken as a surjective valuation `v : F → ℤᵐ⁰` with additive order `ord_v` (Tau Ceti's Valuation.ord, so a uniformiser has order one), valuation ring `R`, residue field `k` and residue map `R^× → k^×, u ↦ ū`. Fix a uniformiser `t`. Every `f ∈ F^×` is uniquely `f = t^{ord_v f}·u_f` with `u_f ∈ R^×`. For `f, g ∈ F^×` define `∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)} · ū_f^{ord_v(g)} · ū_g^{−ord_v(f)} ∈ k^×`. Since `f^{v(g)}/g^{v(f)} = u_f^{v(g)}·u_g^{−v(f)}`, this is the roadmap's `(−1)^{v(f)v(g)}·(f^{v(g)}/g^{v(f)})‾`, and the residue map is applied only to the units `u_f` and `u_g`. With this convention `∂_v{u,t} = ū` and `∂_v{t,u} = ū^{−1}` for `u ∈ R^×`. The K-book's tame symbol (Lemma III.6.3), `∂_v({r,s}) = (−1)^{v(r)v(s)}·(s^{v(r)}/r^{v(s)})‾`, equals `∂_v{s,r} = ∂_v{r,s}^{−1}` in this notation: it is the inverse of this one. Independence of `t` is §9.3. (Weibel, Lemma III.6.3, p. 234.)

`Suggested.lean` defines `tameUnit` as the field unit `(−1)^{v(f)v(g)}f^{v(g)}g^{−v(f)}` used in the tame-symbol reciprocity statement of §10.30.

`v : F → ℤᵐ⁰` is a surjective (normalised) discrete valuation on the field `F`, with valuation ring `R`, residue field `k` and a chosen uniformiser `t (ord_v t = 1)`. `f` and `g` are nonzero elements of `F`.

Provide the following API.

- `tameSymbol`: For a surjective `v : F → ℤᵐ⁰` and `f, g ∈ F^×, tameSymbol v f g := (−1)^{ord f·ord g}·res(u_f)^{ord g}·res(u_g)^{−ord f} ∈ k_v^×`, with unit parts taken against a uniformiser fixed by choice.
- `tameSymbol_eq_residue`: `tameSymbol v f g = (−1)^{ord f·ord g}·res(f^{ord g}·g^{−ord f})`, the element `f^{ord g}g^{−ord f}` lying in `R^×` (§9.3).
- `tameSymbol_unit_uniformizer`: If `ord u = 0` and `ord t = 1` then `tameSymbol v u t = res u`.
- `tameSymbol_uniformizer_unit`: If `ord u = 0` and `ord t = 1` then `tameSymbol v t u = (res u)^{−1}`.
- `tameSymbol_of_ord_eq_zero`: If `ord f = ord g = 0` then `tameSymbol v f g = 1`.
- `tameSymbol_swap`: `tameSymbol v g f = (tameSymbol v f g)^{−1}`.
- `tameSymbol_self`: `tameSymbol v f f = (−1)^{ord f}`.
- `tameSymbol_neg_self`: `tameSymbol v f (−f) = 1`.
- `tameSymbol_kbook`: The K-book's `∂_v({r,s})` of Lemma III.6.3 is `tameSymbol v s r = (tameSymbol v r s)^{−1}`.
- `tameSymbol_dvr`: For a DVR `R` with fraction field `F` and irreducible `ϖ`, writing `f = u_f·ϖ^{n_f}`, `tameSymbol (the valuation of R) f g = (−1)^{n_f n_g}·ū_f^{n_g}·ū_g^{−n_f}`.
- `tameSymbol_place`: For a place `P` of a function field, a uniformiser `t` at `P` and `f` with `P.ord f = 0`: `tameSymbol P f t = Place.residueUnit P f`.
- `TameSymbol.valuationSubringMap`: For a field embedding `F → E` and discrete valuations with `ord_w(f(r)) = e·ord_v(r), e ∈ ℕ`, the restricted ring map `𝒪_v →+* 𝒪_w` is defined without a finiteness assumption.
- `TameSymbol.residueFieldMap`: For the same embedding, require `he : 0 < e`. The valuation-ring map is local, since `ord_w(f(r)) > 0` iff `ord_v(r) > 0` for `r ≠ 0`, and IsLocalRing.ResidueField.map yields `k_v →+* k_w`. No finite-dimensionality assumption is used.

**Checks.**

- On `ℚ` with the 5-adic valuation: `tameSymbol 2 5 = 2` and `tameSymbol 5 2 = 3` in `F_5^×`.
- On `ℚ` at `5: tameSymbol 5 5 = 4 = −1` and `tameSymbol 10 5 = 3`; a definition without the factor `(−1)^{v(f)v(g)}` gives 1 and 2.
- On `ℚ` at `5: tameSymbol 2 3 = 1`, and `tameSymbol f 1 = 1` for every `f`.
- On `k(t)` at the place `t − b (b ∈ k): tameSymbol a (t − b) = a` for `a ∈ k^×`, whereas the K-book's Weil reciprocity 6.5.3 (PDF p. 244) uses `∂_{t−b}(a, t − b) = a^{−1}` in its normalisation.
- `tameSymbol 5 2 = 3 ≠ 2 = ∂_5(5,2)` of Lemma III.6.3: a silent use of the source's formula fails this.
- For `e > 0` and `a ∈ 𝒪_v`, residueFieldMap `v w e` he hvw `(res_v a) = res_w` (valuationSubringMap `v w e` hvw a).
- For `ℚ → ℚ(u)` with `w` the u-adic valuation, `ord_w` is zero on every nonzero rational `(e = 0)`. The 5-adic nonunit 5 maps to a unit of `𝒪_w`, so the valuation-ring map is not local and no residue-field map `F_5 → ℚ` is asserted.

*Needs:* Tau Ceti `Valuation.ord`; Tau Ceti `Valuation.exists_isUniformizer_of_surjective`; Tau Ceti `Valuation.exists_eq_zpow_mul_unit_of_surjective`; Mathlib `ValuationSubring.unitGroupToResidueFieldUnits`; Mathlib `IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`; Tau Ceti `TauCeti.Place.residueUnit`; Mathlib `Units`; Mathlib `IsLocalRing.ResidueField.map`.

### 9.3 Independence from the uniformiser

For `f, g ∈ F^×` the element `f^{ord_v g}·g^{−ord_v f}` has order zero, hence lies in `R^×`, and `∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)}·res(f^{ord_v g}·g^{−ord_v f})`. The right-hand side involves no uniformiser, so `∂_v` does not depend on the uniformiser `t` used to form the unit parts: this is the displayed formula, with the bar applied to a unit. (Weibel, Lemma III.6.3, proof, p. 234.)

`v` is a surjective discrete valuation on `F` with valuation ring `R` and residue field `k`; `t` and `t′` are uniformisers. `f` and `g` are nonzero elements of `F`.

**Checks.**

- On `ℚ` at 5, computing with `t = 5 (u_{10} = 2, u_5 = 1)` and with `t = 10 (u_{10} = 1, u_5 = 1/2)` both give `∂{10,5} = 3`.
- The sign `(−1)^{ord f·ord g}` depends only on the orders.
- The residue is taken of a unit of `R`, as the definition requires.

*Needs:* §9.2; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Tau Ceti `Valuation.isUnit_iff_ord_eq_zero`; Mathlib `ValuationSubring.unitGroupToResidueFieldUnits`.

### 9.4 The tame symbol is bilinear and satisfies the Steinberg relation

The pairing `∂_v` is bimultiplicative, `∂_v{ff′,g} = ∂_v{f,g}·∂_v{f′,g}` and `∂_v{f,gg′} = ∂_v{f,g}·∂_v{f,g′}`, and satisfies the Steinberg relation `∂_v{r, 1 − r} = 1` for every `r ∈ F` \ `{0,1}`. (The induced homomorphism out of `K^M_2(F)` and `K_2(F)`, and its surjectivity, are §9.5.) (Weibel, Lemma III.6.3, proof, p. 234.)

`v` is a surjective discrete valuation on `F` with valuation ring `R`, maximal ideal `𝔪` and residue field `k`. `f, f′, g, g′ ∈ F^×`; `r ∈ F` with `r ≠ 0, 1`.

**Checks.**

- The four cases are exhaustive because `r ∈ R` forces `1 − r ∈ R`; all four are written out.
- On `ℚ` at 5, with `r = 1/5` and `1 − r = 4/5` (both of order `−1`): `∂{1/5, 4/5} = (−1)^{1}·res((1/5)^{−1}·(4/5)^{1}) = −4 = 1` in `F_5^×`; the formula without the sign factor would give 4.
- The relation holds in both normalisations, each being the other's inverse.

*Needs:* §9.2; §9.3; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.mem_maximalIdeal_iff_ord_pos`; Tau Ceti `Valuation.ord_add_eq_min_of_ord_ne`.

### 9.5 The tame symbol as a homomorphism out of `K₂`

The pairing `∂_v` of §9.4 induces a group homomorphism `∂_v : K^M_2(F) → k^×` (source written additively) with `∂_v{f,g} = tameSymbol v f g`, and, through Matsumoto's isomorphism `K^M_2(F) ≅ K_2(F)`, a homomorphism `K_2(F) → k^×` with the same value on Steinberg symbols. It is surjective: `∂_v{ũ, t} = u` for any lift ũ `∈ R^×` of `u ∈ k^×`. (Weibel, Lemma III.6.3, p. 234; Weibel, III.7.1, p. 245.)

`v` is a surjective discrete valuation on `F` with valuation ring `R`, residue field `k` and uniformiser `t`.

Provide the following API.

- `tameSymbolHom`: The homomorphism `K^M_2(F) →+ Additive k^×` induced by `tameSymbol v`.
- `tameSymbolHom_symbol`: tameSymbolHom `v {f, g} = tameSymbol v f g`.
- `tameSymbolHom_surjective`: tameSymbolHom `v` is surjective.
- `tameSymbolHomK2`: The homomorphism `K_2(F) → k^×` obtained through Matsumoto's isomorphism, with the same value on Steinberg symbols.
- `tameSymbolHom_symbol_units`: tameSymbolHom `v {u, w} = 0` (the trivial unit) for `u, w ∈ R^×`.
- `tameSymbolHom_kbook`: The K-book's `∂_v` on `K_2(F)` equals `−tameSymbolHom v` (additively).

**Checks.**

- On `ℚ` at 5: tameSymbolHom `{5, 2} = 3` and tameSymbolHom `{2, 5} = 2` in `F_5^×`.
- On `ℚ` at 5: tameSymbolHom `{2, 3} = 0`, the trivial unit.
- On `ℚ` at 5: tameSymbolHom `{2, 5} = 2` generates `F_5^×`, so the map is onto.
- The unsigned formula `res(f^{v(g)}g^{−v(f)})` sends the Steinberg element `{1/5, 4/5}` of `K^M_2(ℚ)` to `4 ≠ 1`, so it does not descend; the signed one sends it to 1.
- `{5,5} = {5,−1}` in `K^M_2(ℚ)` and both go to `−1 = 4` in `F_5^×`.

*Needs:* §5.4; §7.2; §9.4; Mathlib `ValuationSubring.surjective_unitGroupToResidueFieldUnits`.

### 9.6 Characterization of the normalized tame symbol

Let `v` be a surjective valuation `F→ℤᵐ⁰, t∈Fˣ` with `ord_v(t)=1, R` its valuation ring, `k` its residue field, and `res:Rˣ→kˣ` the unit residue. If `c:Fˣ×Fˣ→kˣ` is multiplicative in each variable, satisfies `c(a,1−a)=1` for `a≠0,1`, is one on pairs of R-units, and satisfies `c(u,t)=res(u)` for every R-unit `u`, then `c(f,g)=tameSymbol(v,f,g)` for all field units `f,g`. Equivalently the descended Milnor homomorphism is uniquely determined by unit-unit vanishing and its values on `{u,t}`; the `classical-K₂` version uses Matsumoto's isomorphism (§7.2). (Weibel, Discussion after Theorem III.6.1, Definition III.6.2, Lemma III.6.3 and proof, pp. 231, 232, 234.)

`F` is a commutative field and `v` is normalized and surjective. No completeness, finiteness of the residue field or characteristic restriction is imposed. `c` takes values in the actual residue-field unit group; complementary inputs are nonzero. Both the unit-unit and mixed-pair normalizations are required.

**Checks.**

- The constant-one pairing fails `c(2,5)=2` over `ℚ` at 5.
- The inverse K-book pairing fails the same normalization since it sends `(2,5)` to 3.
- The unsigned formula satisfies the mixed values but fails the Steinberg hypothesis on (1/5,4/5), where it is 4 rather than 1 at 5.
- No claim that all of `K₂` is generated solely by `{u,t}` is used: pairs of ring units are killed only after applying this homomorphism.

*Needs:* §5.2; §5.3; §9.1; §9.2; §9.4; §9.5.

### 9.7 Behaviour under a valued field embedding: the ramification formula

Let `F → E` be any field embedding, `v` and `w` normalised surjective discrete valuations with `ord_w(f(r)) = e·ord_v(r)` and `e ≥ 1`; the induced local map of valuation rings gives `k_v → k_w`. No finite-dimensionality assumption is needed. Then `tameSymbol w r₁ r₂ = (tameSymbol v r₁ r₂)^e` in `k_w^×` for `r₁, r₂ ∈ F^×`; equivalently `∂_w ∘ res_{E/F} = (·)^e ∘ ∂_v` on `K^M_2(F)`. For the finite-extension refinement only, if E/F is finite and `w₁`, …, `w_n` are the valuations of `E` over `v` (the primes of the integral closure `S` of `R` over `𝔪_v`) and all `e_i = 1`, the diagonal `k_v^× → ∏_i k_{w_i}^×` carries `∂_v(x)` to `(∂_{w_i}(x))_i`. The formula reads the same in the roadmap's and in the K-book's normalisation, both sides being inverted. (Weibel, Remark III.6.3.1, p. 234; Weibel, Remark III.6.3.1, continued, p. 235.)

`F → E` is a field embedding; `v` and `w` are normalised surjective discrete valuations with `ord_w(f(r)) = e·ord_v(r), e ≥ 1`. For the unramified refinement only: E/F is finite, `w₁`, …, `w_n` are all its valuations over `v` and each `e_i = 1`.

**Checks.**

- `ℚ ⊂ ℚ(√5), v` 5-adic, `w` over 5 with `e = 2` and `k_w = F_5: tameSymbol w 5 5 = 1 = (−1)²` and `tameSymbol w 2 5 = 4 = 2²`.
- `ℚ ⊂ ℚ(i)` at `5 (5 splits, e₁ = e₂ = 1, residue fields F_5)`: both `w_i` give `tameSymbol 2 5 = 2`, the diagonal image of 2.
- The sign transforms uniformly because `e² ≡ e` (mod 2); no case split on the parity of `e` is needed.
- The formula concerns classes from `F`; for classes of `E` the relevant statement is the norm–residue formula (§10.27).
- Infinite example: `ℚ → ℚ(u), v` the 5-adic valuation and `w` its Gauss extension (minimum coefficient order), `e = 1, k_w = F_5(u): ∂_w{2,5} = 2`. The map with `w` the u-adic valuation instead has trivial restriction and is not this positive-e case.

*Needs:* §5.4; §9.3; §9.5; Tau Ceti `Valuation.ord`.

### 9.8 The tame symbol through unit parts

Let `f,g∈Fˣ, a=ord_v(f), b=ord_v(g), π∈Fˣ` of order one, and write `r:Rˣ→kˣ` for `Units.map(IsLocalRing.residue R)`. The expression `T_π(f,g)=(−1)^(ab) r(U_π(f))^b r(U_π(g))^(−a)` equals `tameSymbol_v(f,g)` of §9.2. If `z∈Rˣ` has field value `f^b g^(−a)`, then `T_π(f,g)=(−1)^(ab)r(z)`. Such `z` exists because its field value has order zero. Consequently the expression agrees with the uniformizer-free formula of §9.3 through R.unitGroupMulEquiv and is independent of `π`. This is an equality of pairings on `Fˣ×Fˣ` before any K-group quotient. (Weibel, III.6.3 and III.6.3.1, p. 234.)

**Checks.**

- At `ord_5, T_5(2,5)=2, T_5(5,2)=3, T_5(5,5)=4` and `T_5(10,5)=3` in `𝔽_5ˣ`.
- For `f=1/5` and `g=4/5`, the negative-order Steinberg test gives 1, including the sign.
- Under a field embedding with positive ramification index `e` and the induced residue embedding, the target tame value is the `e-th` power of the mapped source tame value. Finite-dimensionality is not assumed.

*Needs:* §9.1; §9.2; §9.3; §9.4; §9.7; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.ord_zpow`; Tau Ceti `Valuation.isUnit_iff_ord_eq_zero`; Tau Ceti `Valuation.mem_valuationSubring_iff_ord_nonneg`; Mathlib `IsLocalRing.residue`; Mathlib `ValuationSubring.unitGroupMulEquiv`; Mathlib `ValuationSubring.unitGroupToResidueFieldUnits`.

### 9.9 Serre's algebra `L(k)` with the indeterminate `Π`

For a field `k` let `L(k)` be the graded abelian group with `L(k)_n = K^M_n(k) ⊕ K^M_{n−1}(k)`, the second summand written `b·Π`, with multiplication `(a + bΠ)(c + dΠ) = ac + (ad + (−1)^{|c|}bc + (−1)^{|d|}bd·{−1})Π` for homogeneous `a, b, c, d`. It is an associative, unital, graded-commutative ring (`xy = (−1)^{|x||y|}yx`), containing `K^M_*(k)` as the subring `b = 0`, and `Π = (0, 1) ∈ L(k)_1` satisfies `Π·Π = {−1}·Π` and `Π·{c} = −{c}·Π`. The maps `a + bΠ ↦ a` (the `λ-part`) and `a + bΠ ↦ a + b{−1}` (the `ρ-part`) are graded ring homomorphisms `L(k) → K^M_*(k)`, and for `c ∈ k^×` the assignment `Π ↦ Π − {c}` extends to a graded ring automorphism `σ_c` of `L(k)` over `K^M_*(k)`. This is the 'graded `K^M_*(k_v)-algebra` generated by an indeterminate `Π` in L1, with the relation `{Π, Π} = {−1, Π}`' of the source, made explicit. (Weibel, Theorem III.7.3, proof, p. 246.)

`k` is a field; `K^M_*(k)` is the graded ring of §5.4, graded-commutative by §5.10.

Provide the following API.

- `serreAlgebra`: The graded ring `L(k)` with `L(k)_n = K^M_n(k) × K^M_{n−1}(k)`.
- `serreAlgebra.Π`: The element `Π = (0, 1)` of degree one.
- `serreAlgebra.of`: The graded ring embedding `K^M_*(k) → L(k), a ↦ (a, 0)`.
- `serreAlgebra.mul_def`: `(a + bΠ)(c + dΠ) = ac + (ad + (−1)^{|c|}bc + (−1)^{|d|}bd{−1})Π`.
- `serreAlgebra.Π_mul_Π`: `Π·Π = {−1}·Π`.
- `serreAlgebra.Π_mul`: `Π·x = (−1)^{|x|}·x·Π` for `x ∈ K^M_*(k)`.
- `serreAlgebra.gradedComm`: `L(k)` is graded-commutative.
- `serreAlgebra.decompose`: `L(k)_{n+1} ≃ K^M_{n+1}(k) ⊕ K^M_n(k)` for `n ≥ 0`, and `L(k)_0 = K^M_0(k)`.
- `serreAlgebra.lambdaHom`: The graded ring homomorphism `L(k) → K^M_*(k), a + bΠ ↦ a`.
- `serreAlgebra.rhoHom`: The graded ring homomorphism `L(k) → K^M_*(k), a + bΠ ↦ a + b·{−1}`.
- `serreAlgebra.shift`: For `c ∈ k^×`, the graded ring automorphism with `Π ↦ Π − {c}`; `shift c ∘ shift c′ = shift (cc′)`.
- `serreAlgebra.map`: A field homomorphism `k → k′` induces `L(k) → L(k′)` fixing `Π`, with `map_id` and `map_comp`.

**Checks.**

- Over `F_5: Π·Π = {4}·Π`, and `{4} ≠ 0` in `K^M_1(F_5)`.
- Over `F_2` (or any field of characteristic two): `Π·Π = 0`.
- Over `F_5: Π·{2} = {3}·Π` (as `−{2} = {2^{−1}} = {3}`), and `Π·{2} ≠ {2}·Π`.
- `lambdaHom ∘ of = id` on `K^M_*(k)` and `lambdaHom Π = 0`.
- With `Π·Π = 0` instead, the map `d` of §9.10 would send `{5, −5}`, which is 0 in `K^M_2(ℚ)`, to `Π·({−1} + Π) = {−1}·Π ≠ 0` over `F_5`; in `L(k)` it goes to `{−1}Π + {−1}Π = 0`.

*Needs:* §5.4; §5.10.

### 9.10 Serre's map kills the Steinberg elements

For a surjective discrete valuation `v` on `F` with uniformiser `t`, the map `d_t : F^× → L(k)_1, d_t(u·t^i) = {ū} + i·Π (u ∈ R^×, i ∈ ℤ)`, is a group homomorphism with `d_t(r)·d_t(1 − r) = 0` in `L(k)_2` for every `r ∈ F` \ `{0, 1}`. (Weibel, Theorem III.7.3, proof, p. 246.)

`v` is a surjective discrete valuation on `F` with valuation ring `R`, maximal ideal `𝔪`, residue field `k` and uniformiser `t`.

**Checks.**

- The case analysis covers `r ∈ R^×, ord r > 0` and `r ∉ R`, and reduces the last to `d(x)d(−x) = 0`.
- With `Π² = 0` the last step fails: over `F_5, d(5)d(−5) = {−1}Π ≠ 0` (§9.9, non-example).
- The defining values are `d_t(1)=0, d_t(t)=Π` and `d_t(t⁻¹)=−Π`. Thus replacing the integer order by its absolute value fails on the inverse uniformizer.

*Needs:* §5.4; §5.10; §9.2; §9.9; Tau Ceti `Valuation.ord_mul`; Tau Ceti `Valuation.mem_maximalIdeal_iff_ord_pos`.

### 9.11 Higher tame symbols and specialisation maps

For a surjective discrete valuation `v` on `F` with uniformiser `t` and residue field `k`, the homomorphism `d_t` of §9.10 extends uniquely to a graded ring homomorphism `d_t : K^M_*(F) → L(k)`. Writing `d_t(x) = λ_t(x) + ∂_v(x)·Π` with `Π` on the right defines the specialisation `λ_t : K^M_n(F) → K^M_n(k)`, a graded ring homomorphism depending on `t`, and the higher residue `∂_v : K^M_n(F) → K^M_{n−1}(k)`. On symbols, `λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}`, `∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}` and `∂_v{u_1, …, u_n} = 0`; in degree one `∂_v{f} = ord_v f`, and in degree two `∂_v =` tameSymbolHom of §9.5, with no inversion. Both maps are surjective. Theorem III.7.3 reads off the coefficient with `Π` on the left, `∂^{Wb}{t, u_2, …, u_n} = {ū_2, …, ū_n}`; since `Π·y = (−1)^{n−1}y·Π` for `y ∈ K^M_{n−1}(k), ∂^{Wb} = (−1)^{n−1}·∂_v` on `K^M_n(F)`: the two agree in odd degree and differ by a sign in even degree, and in degree two `∂^{Wb}` is the K-book's tame symbol, the inverse of Layers 9–11's. (Weibel, Theorem III.7.3, p. 246; Weibel, Theorem III.7.3, proof, p. 246.)

`v` is a surjective discrete valuation on `F` with valuation ring `R`, residue field `k` and a chosen uniformiser `t`.

Provide the following API.

- `serreMap`: The graded ring homomorphism `d_t : K^M_*(F) → L(k)` with `d_t{f} = {ū_f} + ord(f)·Π`.
- `milnorResidue`: `∂_v : K^M_n(F) → K^M_{n−1}(k)`, the `Π-coefficient` of `d_t` with `Π` on the right.
- `milnorSpecialisation`: `λ_t : K^M_n(F) → K^M_n(k)`, the `Π-free` part of `d_t`.
- `milnorResidue_symbol_units_uniformizer`: `∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}`.
- `milnorResidue_symbol_units`: `∂_v{u_1, …, u_n} = 0` for units `u_i`.
- `milnorSpecialisation_symbol`: `λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}`.
- `milnorSpecialisation_mul`: `λ_t` is a graded ring homomorphism.
- `milnorResidue_one`: In degree one `∂_v{f} = ord_v f`.
- `milnorResidue_two`: In degree two `∂_v =` tameSymbolHom `v`.
- `milnorResidue_kbook`: Theorem III.7.3's residue equals `(−1)^{n−1}·∂_v` on `K^M_n(F)`.
- `milnorResidue_surjective`: `∂_v` is onto.
- `milnorSpecialisation_surjective`: `λ_t` is onto.
- `milnorResidue_indep`: `∂_v` does not depend on `t` (§9.15).
- `milnorResidue_mul`: The product formula (§9.14).

**Checks.**

- Over `ℚ` at 5 with `t = 5: ∂_v{50} = 2` and `λ_5{50} = 2` in `F_5^×`.
- Over `ℚ` at `5: ∂_v{5, 2} = 3 = tameSymbol 5 2` and `∂_v{2, 5} = 2`.
- Over `ℚ(t)` with the t-adic valuation: `∂{t, 5, 2} = {5, 2}` and `∂{5, t, 2} = −{5, 2}` in `K^M_2(ℚ)`; they differ, since the tame symbol at 5 sends `{5, 2}` to 3 and `−{5, 2}` to 2.
- `∂_v{u_1, …, u_n} = 0` for units `u_i`; for `F = ℚ(t)` with the t-adic valuation, `∂_t` vanishes on the image of `K^M_n(ℚ)` and `λ_t` restricts to the identity there.
- Over `ℚ` at `5: λ_5{5} = 1` but `λ_{10}{5} = 3` in `F_5^×`, while `∂_v{5} = 1` for both.
- With `Π² = 0` in place of `Π² = {−1}Π`, `d{5, −5} = {−1}Π ≠ 0` over `F_5` although `{5, −5} = 0` in `K^M_2(ℚ)`: the construction does not descend without the relation.

*Needs:* §5.4; §9.5; §9.9; §9.10; Mathlib `ValuationSubring.surjective_unitGroupToResidueFieldUnits`.

### 9.12 The kernel of Serre's map

For every `n ≥ 1` the kernel of `d_t : K^M_n(F) → L(k)_n` is `U¹·K^M_{n−1}(F)`, the subgroup generated by the products `{a}·y` with `a ∈ U¹ = 1 + 𝔪` (the principal units) and `y ∈ K^M_{n−1}(F)`. (Weibel, Exercise III.7.2, p. 257.)

`v` is a surjective discrete valuation on `F` with valuation ring `R`, maximal ideal `𝔪`, residue field `k` and uniformiser `t`; `n ≥ 1`.

**Checks.**

- `n = 1`: the kernel of `f ↦ ({ū_f}, ord f)` on `F^×` is `U¹`.
- The kernel does not depend on `t`, since `U¹` does not.
- Consequently `ker λ_t = U¹K^M_{n−1}(F) + {t}·K^M_{n−1}(F)`, the second statement of Ex. III.7.2.

*Needs:* §5.4; §5.10; §9.9; §9.11; Mathlib `ValuationSubring.ker_unitGroupToResidueFieldUnits`.

### 9.13 Finite support of the residues

Let `V` be a set of discrete valuations on `F` such that every `f ∈ F^×` has `ord_v f ≠ 0` for only finitely many `v ∈ V` — for instance the places of a function field, or the height-one primes of a Dedekind domain with fraction field `F`. Then for `x ∈ K^M_n(F) (n ≥ 1)` written as a finite sum of symbols `{f_{j,1}, …, f_{j,n}}`, `∂_v(x) = 0` for every `v ∈ V` outside the finite union of the sets `{v : ord_v f_{j,i} ≠ 0}`. In degree two this is the statement for tameSymbolHom; in particular `tameSymbol v f g = 1` whenever `ord_v f = ord_v g = 0`. (Weibel, Localization Theorem III.6.5, p. 236; Weibel, Theorem III.7.4, p. 247.)

`V` is a set of discrete valuations on `F` in which each nonzero element has nonzero order at only finitely many members. `x ∈ K^M_n(F)` is given as a finite sum of symbols.

**Checks.**

- The support of `{f, g}` lies in the union of the supports of `f` and `g`, and can contain points where only one of them has nonzero order `({2,5} at 5)`.
- The support of a finite sum of symbols lies in the union of the supports of the summands.
- For units of a Dedekind domain `R` (order zero everywhere) the symbols are trivial at every height-one prime.
- This is what makes the maps into the direct sums of Theorem III.6.5 and Theorem III.7.4 well defined.

*Needs:* §9.5; §9.11; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`; Mathlib `IsDedekindDomain.HeightOneSpectrum.Support.finite`.

### 9.14 The product formula for the higher residue

For `x ∈ K^M_i(F)` and `y ∈ K^M_j(F): ∂_v(x·y) = λ_t(x)·∂_v(y) + (−1)^j·∂_v(x)·ρ_t(y)`, where `ρ_t : K^M_*(F) → K^M_*(k)` is the graded ring homomorphism rhoHom `∘ d_t`, characterised by `ρ_t{u·t^m} = {(−1)^m ū}`. In particular `∂_v(x·y) = x̄·∂_v(y)` when `x` is a product of symbols of units, so `∂_v` is a homomorphism of left modules over the image of `K^M_*(R^×)`. This is Ex. III.7.10 as printed, which holds for the roadmap's normalisation; for Theorem III.7.3's normalisation the formula is `∂^{Wb}(x·y) = (−1)^i λ_t(x)·∂^{Wb}(y) + ∂^{Wb}(x)·ρ_t(y)`. (Weibel, Exercise III.7.10, p. 258.)

`v` is a surjective discrete valuation on `F` with uniformiser `t` and residue field `k`; `x ∈ K^M_i(F), y ∈ K^M_j(F)`.

**Checks.**

- Over `ℚ` at `5, x = {5}, y = {2}: ∂{5, 2} = 0 − 1·{2} = −{2}`, i.e. 3 in `F_5^×`, matching `tameSymbol 5 2 = 3`.
- `x = {2}, y = {5}: ∂{2, 5} = {2}·1 − 0 = {2}`, i.e. 2.
- Read with Theorem III.7.3's normalisation, the printed formula would give `∂^{Wb}{5, 2} = 3`, contradicting `∂^{Wb}{5, 2} = 2` from Theorem III.7.3.

*Needs:* §9.9; §9.11.

### 9.15 The residue is independent of the uniformiser; the specialisation is not

Let `t′ = c·t` be a second uniformiser `(c ∈ R^×)`. Then `∂_v` computed with `t′` equals `∂_v` computed with `t`, and `λ_{t′}(x) = λ_t(x) − ∂_v(x)·{c̄}` for `x ∈ K^M_n(F)` (product in `K^M_*(k)`). In particular `λ` depends on the uniformiser: in degree one `λ_{t′}{t} = −{c̄}`, i.e. `c̄^{−1}`. This corrects Ex. III.7.1, which asserts that `λ` is independent of `π`; Weibel's errata make the same correction. (Weibel, Exercise III.7.1, p. 257.)

`v` is a surjective discrete valuation on `F` with valuation ring `R` and residue field `k`; `t` and `t′ = c·t` are uniformisers, `c ∈ R^×`.

**Checks.**

- Over `ℚ` at 5 with `t = 5, t′ = 10 (c = 2): λ_5{5} = 1` and `λ_{10}{5} = 3 = 2^{−1}` in `F_5^×`; `∂{5} = 1` for both.
- `∂_v` is independent of the uniformiser, confirming the first half of Ex. III.7.1.
- `λ_t` is unchanged when `c̄ = 1`, i.e. when `t′ ≡ t` modulo `𝔪²`.

*Needs:* §9.9; §9.11; Tau Ceti `Valuation.isUnit_iff_ord_eq_zero`.

### 9.16 Residue convention dictionary

For every `n≥1`, let `∂^last_v:K^M_n(F)→K^M_(n−1)(k)` be the residue of §9.11, normalized by `∂^last{u₁,…,u_(n−1),π}={ū₁,…,ū_(n−1)}` and zero on all-unit symbols. Let `∂^first` be the residue of Weibel III.7.3, normalized with `π` first. As homomorphisms, `∂^first_v=(−1)^(n−1)∂^last_v`. In degree one both are `ord_v`; in degree two, under `K^M_1(k)=kˣ, ∂^last` is tameSymbolHom and `∂^first` is its inverse. If `d_π(x)=λ_π(x)+∂^last_v(x)Π` in the Serre algebra, `Π` is on the right. For homogeneous `x` of degree `i` and `y` of degree `j, ∂^last(xy)=λ_π(x)∂^last(y)+(−1)^j∂^last(x)ρ_π(y)`, where `ρ_π{uπ^m}={(−1)^mū}`. In the first normalization the corresponding law is `∂^first(xy)=(−1)^iλ_π(x)∂^first(y)+∂^first(x)ρ_π(y)`. For `π′=cπ, λ_π′(x)=λ_π(x)−∂^last(x){c̄}`, while `∂^last` does not change. (Weibel, III.7.3, Exercises III.7.1 and III.7.10, pp. 246, 257, 258.)

**Checks.**

- In degree three both residues send `{u₁,u₂,π}` to `{ū₁,ū₂}`; in degree two they take inverse values on `{2,5}` at `ord_5`.
- `λ_5{5}=1` but `λ_10{5}=3` in `𝔽_5ˣ`. Independence of specialization would fail this test.
- For `x={5}, y={2}`, the last-normalization product law gives 3 and the first-normalization law gives 2 in `𝔽_5ˣ`.

*Needs:* §5.4; §5.10; §9.5; §9.9; §9.11; §9.14; §9.15.

### 9.17 Rigidity for a complete discretely valued field

Let `v` be a discrete valuation on `F` with valuation ring `R`, uniformiser `t` and residue field `k`, and suppose `F` is complete with respect to `v (R is 𝔪-adically complete)`. For every integer `q ≥ 1` prime to `char(k)` (any `q ≥ 1` if char `k = 0`) and every `n ≥ 0, (λ_t, ∂_v) : K^M_n(F)/q → K^M_n(k)/q ⊕ K^M_{n−1}(k)/q` is an isomorphism. (Weibel, Corollary III.7.3.1, p. 246; Weibel, Corollary III.7.3.1, proof, p. 247.)

`F` is complete with respect to the discrete valuation `v`, with residue field `k`. `q` is a positive integer prime to the characteristic of `k`.

**Checks.**

- The statement is modulo `q`, not integral: `K^M_1(ℚ_p) = ℚ_p^×` is not `k^× ⊕ ℤ, U¹` being uncountable.
- `n = 1: F^×/q ≅ k^×/q ⊕ ℤ/q`.
- The hypothesis on `q` is needed: for `F = ℚ_p (p odd)`, `n = 1` and `q = p, F^×/p ≅ (ℤ/p)²` while `F_p^×/p ⊕ ℤ/p ≅ ℤ/p`.
- The proof uses only that `R` is Henselian; the source's completeness hypothesis is kept.

*Needs:* §9.9; §9.11; §9.12; Tau Ceti `TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`; Mathlib `HenselianRing`.

### 9.18 Ramification and the higher residue

Let `F → E` be any field embedding and `v, w` normalised surjective discrete valuations satisfying `ord_w(f(r)) = e·ord_v(r), e ≥ 1`, with the induced residue-field embedding `k_v → k_w`. No finite-dimensionality hypothesis is imposed. For `x ∈ K^M_n(F): ∂_w(res_{E/F} x) = e·res_{k_w/k_v}(∂_v x)` in `K^M_{n−1}(k_w)`. In degree two this is §9.7. The statement reads the same in both normalisations, each side changing by `(−1)^{n−1}`. The finite-extension special case is Exercise III.7.8; the same elementary uniformiser/unit proof gives the stated embedding generalisation, one of the elementary Milnor residue identities Kato's proof uses (with Exercises III.7.7 and III.7.9 and Corollary III.7.6.3); this identity is also used in the integral norm construction of §10.24 and the restriction comparison of Layer 11. (Weibel, Exercise III.7.8, p. 257.)

`F → E` is an arbitrary field embedding, `v` and `w` are normalised surjective discrete valuations, `ord_w(f(r)) = e·ord_v(r)`, and `e ≥ 1`. A valuation on `E` trivial on `F` is a separate case, not a positive-e extension of `v`.

**Checks.**

- `n = 1: ord_w(r) = e·ord_v(r)`.
- `n = 2`: the `e-th` power formula of §9.7.
- The residue fields enter only through `res_{k_w/k_v}`; the inertia degree does not appear.
- Infinite constant extension `F(t) → F(u)(t)`: at the place `t, e = 1` and `k_v = F → F(u) = k_w`; `∂_w{a,t}` is the image of a for `a ∈ F^×`. For `F = ℚ` and `a = 2` this is 2, not its inverse.
- Completion `F → F̂_v` has `e = 1` and the same residue field, so the formula gives `∂_{v̂} ∘ res = ∂_v` without requiring the completion to be finite over `F`.
- Trivial-restriction case: the place `t−u` of `F(u)(t)` is trivial on `F(t)`, because every nonzero polynomial `p(t) ∈` F[t] has `p(u) ≠ 0`. Every Milnor symbol from `F` therefore has zero residue there.
- Instantiate `higher_ramification_formula` at `ℚ → ℚ(u)`, the 5-adic valuation and its `e = 1` Gauss extension: the residues commute in every degree, with `k_w = F_5(u)`.
- For any field embedding `F → E` and surjective discrete `w` trivial on `F^×`, the residue of every symbol from `F {a_1,…,a_{n+1}}` is 0. In particular this applies to `F(t) → F(u)(t)` at `t−u`, which has no positive ramification index over a nontrivial place of `F(t)`.

*Needs:* §5.4; §9.7; §9.11; §9.12.

### Examples

- On `ℚ` at `5: ∂{2, 5} = 2, ∂{5, 2} = 3, ∂{5, 5} = 4 = −1, ∂{10, 5} = 3` in `𝔽₅^×`; the unsigned formula sends the Steinberg element `{1/5, 4/5}` to 4 instead of 1.
- With uniformisers 5 and 10 at `5, λ₅{5} = 1` but `λ₁₀{5} = 3`: the residue is independent of the uniformiser, the specialisation is not (correcting Weibel Ex. III.7.1).
- Rigidity needs `q` prime to the residue characteristic: `ℚ_p^×/p ≅ (ℤ/p)²` while `𝔽_p^×/p ⊕ ℤ/p ≅ ℤ/p`.

### Dependencies

Layers 5 and 7; Tau Ceti `Valuation.ord` API and `Place`; Mathlib valuation subrings and residue maps; LocalFieldsRamification Layer 1.

## Layer 10: rational function fields, Milnor norms and reciprocity

The Bass–Tate (Milnor) exact sequence `0 → K_nᴹ(F) → K_nᴹ(F(t)) → ⊕_π K_{n−1}ᴹ(F[t]/π) → 0` through the degree filtration, the simple Milnor transfer defined through the residue at infinity, its projection and degree formulas and Weil reciprocity on `ℙ¹`, Kato's theorem that the composite of simple transfers is independent of the generators, base change of norms with Artinian lengths, the norm–residue square for complete discretely valued fields and for finite normalisations, and Suslin's reciprocity law `Σ_P N_{k(P)/F} ∂_P(x) = 0` for every function field of one variable over any field, with its tame-symbol and disjoint-support forms. The normalized extension of a complete discrete valuation to a finite extension, the integral closure and the norm identities, which no lower roadmap supplies for arbitrary residue fields, are targets here (§10.15 to §10.18). After norms, §§10.32–10.33 compute the high-degree Milnor groups of global fields.

### 10.1 Leading coefficients split `K^M_n(F)` off `K^M_n F(t)` (Example III.7.3.2)

Let `F` be a field and, for nonzero `f ∈ F(t)`, let `lead(f)` be the quotient of the leading coefficients of its numerator and denominator. Let `λ: K^M_n F(t) → K^M_n(F)` be the specialisation map of §9.11 at the place at infinity (order `−deg`, residue field `F`) with respect to the uniformiser `t^{−1}`. Then `λ{f_1, …, f_n} = {lead(f_1), …, lead(f_n)}`, `λ` is the identity on the image of `K^M_n(F)`, so `K^M_n(F) → K^M_n F(t)` is a split injection in every degree, and the residue `∂_∞` vanishes on that image. (Weibel, III.7.3.2, Example 7.3.2, p. 247.)

`F` is a field and `n ≥ 0`. The specialisation is taken with respect to the uniformiser `t^{−1}`; with another uniformiser it changes, so the uniformiser is part of the data.

**Checks.**

- In degree one `λ` is the homomorphism `f ↦ lead(f)` from `F(t)^×` to `F^×`.
- In degree two `λ` is the leading-coefficient map of Example III.6.1.2, which §7.4 treats for `K_2`; the author's errata list corrects that example's three-case check when `lead(f) = 1`, a case this route does not need.
- Non-example: over `ℚ`, with the uniformiser `2t^{−1}` instead of `t^{−1}`, the specialisation sends `{t} ∈ K^M_1` to 2 rather than 1, so the formula is tied to `t^{−1}` (compare the author's erratum to Exercise III.7.1: `λ` depends on the uniformiser).

*Needs:* §5.4; §9.11; Tau Ceti `TauCeti.Place.ord_infty`; Tau Ceti `TauCeti.Place.isUniformizer_infty`; Tau Ceti `TauCeti.Place.inftyResidueFieldEquiv`.

### 10.2 Degree reduction for symbols of polynomials (Exercise III.6.2, corrected)

Let `F` be a field, `d ≥ 1`, and `L_d ⊂ K^M_n F(t)` the subgroup generated by the symbols `{f_1, …, f_n}` whose entries are nonzero polynomials of degree at most `d`. (i) If `e_1 ≠ e_2` are monic polynomials of degree `d` and `h = e_1 − e_2` (nonzero, of degree `< d`), then `{e_1, e_2} = {h, e_2} − {h, e_1} + {e_1, −1}` in `K^M_2 F(t)`. (ii) Consequently `L_d` is generated by `L_{d−1}` together with the symbols `{π, a_2, …, a_n}` with `π` monic irreducible of degree `d` and each `a_i` a nonzero polynomial of degree `< d`. The source's Exercise III.6.2, which allows only `e_1` as an entry of degree `d`, is false as printed; (i) is what the source's proof of Lemma III.7.4.2 uses. (Weibel, Exercise III.6.2, p. 243; Weibel, III.6.1.4, Lemma 6.1.4 and its proof, p. 232; Weibel, III.7.4.2, proof of Lemma 7.4.2, p. 248.)

`F` is a field, `t` an indeterminate, `d ≥ 1` and `n ≥ 1`; `L_0` is the image of `K^M_n(F)`.

**Checks.**

- Over `ℚ(t), {t, t − 2}` has residue 1/2 at the place `t = 2` (K-book normalisation), while every symbol `{t, c}` or `{c, c′}` with `c, c′ ∈ ℚ^×` has trivial residue there; so `{t, t − 2}` is not a product of such symbols, as the printed exercise would require, but (i) writes it as `{2, t − 2} − {2, t} + {t, −1}`.
- For `d = 1`, (i) is Lemma III.6.1.4.
- (ii) is exactly the generation statement that the proof of Lemma III.7.4.2 cites from Exercise III.6.2.

*Needs:* §5.4; §5.10; §6.9.

**Generation of the degree filtration by monic irreducible entries.** For `n≥1` and `d≥1` let `L_d` be generated by n-symbols with nonzero polynomial entries of degree at most `d`. Then `L_d/L_(d−1)` is generated by symbols with exactly one monic irreducible degree-d entry and all other entries of degree `<d`. For distinct monic degree-d `e₁,e₂`, with `h=e₁−e₂, {e₁,e₂}={h,e₂}−{h,e₁}+{e₁,−1}`; for equal entries `{e,e}={e,−1}`. (Weibel, III.6.1.4, Exercise III.6.2, III.7.4.2, pp. 232, 243, 248.)

**Checks.**

- The repeated case is retained over `ℝ(t)`; no exterior-algebra rule is assumed.
- For `e₁=t,e₂=t−2` over `ℚ, h=2`; the identity gives the correct nontrivial residue 2 at `t−2` in the uniformizer-last convention.
- For `n=1` the assertion is polynomial factorization modulo constants; for `d=1` the other entries are constants.

*Needs:* §5.4; §5.10; §6.9.

### 10.3 The section `h_π` on the degree filtration (Lemma III.7.4.1)

Let `π ∈` F[t] be monic irreducible of degree `d ≥ 1, k_π = F[t]/(π)`, and `L_d` as in §10.2. There is a unique homomorphism `h_π : K^M_{n−1}(k_π) → L_d/L_{d−1}` sending `{ā_1, …, ā_{n−1}}` to the class of `{a_1, …, a_{n−1}, π}`, where `a_i ∈` F[t] is the unique representative of `ā_i` of degree `< d`. The source's `h_π` puts `π` first; the two differ by the sign `(−1)^{n−1}`, the same sign by which Theorem III.7.3's residue `∂^{Wb}` differs from the residue `∂` of §9.11, so each is a section of its own residue. (Weibel, III.7.4.1, Lemma 7.4.1 and the paragraph before it, p. 247; Weibel, III.7.4.1, proof of Lemma 7.4.1, p. 247.)

`F` is a field, `n ≥ 1` and `π` is monic irreducible of degree `d`; for `n = 1` the source group is `K^M_0(k_π) = ℤ` and `h_π(1)` is the class of `{π}`.

**Checks.**

- For `n = 1, h_π(1)` is the class of `{π}` and `∂_π{π} = 1` in `ℤ`.
- For `d = 1, π = t − b` and `k_π = F, h_π{c_1, …, c_{n−1}}` is the class of `{c_1, …, c_{n−1}, t − b}`.
- Followed by the residue `∂_π` it is the identity (§10.4), which pins its normalisation.

*Needs:* §5.4; §10.2; Mathlib `Polynomial.modByMonic`; Mathlib `Polynomial.degree_modByMonic_lt`.

### 10.4 The graded pieces of the degree filtration (Lemma III.7.4.2)

For `d ≥ 1` the maps `h_π` of §10.3, over the monic irreducible `π` of degree `d`, induce an isomorphism `⊕_{deg π = d} K^M_{n−1}(k_π) ≅ L_d/L_{d−1}` whose inverse is induced by the residues `∂_π`: each `∂_π` with deg `π = d` vanishes on `L_{d−1}, ∂_π ∘ h_π` is the identity, and `∂_{π′} ∘ h_π = 0` for `π′ ≠ π` of degree `d`. Residues are those of §9.11, `∂_π{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}`, which in degree two is the roadmap's tame symbol; with Theorem III.7.3's `∂^{Wb}` and the source's `h_π (π first)` the statement is the same. (Weibel, III.7.4.2, Lemma 7.4.2, p. 247; Weibel, III.7.4.2, proof of Lemma 7.4.2, p. 248.)

`F` is a field, `n ≥ 1, d ≥ 1`; the residue field of the place of `π` is identified with `F[t]/(π)` by the equivalence.

**Checks.**

- For `d = 1` and `F` algebraically closed, `L_1/L_0 ≅ ⊕_{b ∈ F} K^M_{n−1}(F)`, which in degree two is Example III.6.1.7.
- In degree one `(n = 1)` it says that the monic irreducible polynomials of degree `d` form a basis of the free abelian group `L_d/L_{d−1}`.
- `∂_π` vanishes on `L_{d−1}` but not on `L_d`, which is what drives the induction on `d`.

*Needs:* §9.11; §10.2; §10.3; Tau Ceti `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`; Tau Ceti `TauCeti.Place.isUniformizer_adicOfIrreducible`.

### 10.5 The Bass–Tate (Milnor) exact sequence for a rational function field

For a field `F` and `n ≥ 1` the sequence `0 → K^M_n(F) → K^M_n F(t) −∂→ ⊕_π K^M_{n−1}(F[t]/(π)) → 0`, with `π` over the monic irreducible polynomials (the finite places of `F(t)`) and `∂ = (∂_π)_π` the higher residues of §9.11, is exact, natural in `F`, and split by the leading-coefficient map `λ` of §10.1. The residue `∂_∞` at the place at infinity is not a component of `∂`; since `∂_∞` vanishes on `K^M_n(F)`, exactness makes it factor uniquely through `∂`, which defines the transfers (§10.6) and gives the reciprocity formula for the projective line (§10.10). The K-book proves the sequence (Theorem III.7.4, attributed to Milnor); the roadmap calls it the Bass–Tate sequence. (Weibel, III.7.4, Theorem 7.4, p. 247; Weibel, III.7.4, proof of Theorem 7.4, p. 247; Weibel, III.6.5.2, Application 6.5.2, p. 236.)

`F` is a field, `t` an indeterminate and `n ≥ 1`; for `n = 0` the sequence is `0 → ℤ → ℤ → 0 → 0`. The sum is over the finite places of `F(t)`; the place at infinity is not among them. Residues are those of §9.11; the sequence is the same for the K-book's `∂^{Wb} = (−1)^{n−1}∂`, every residue in a given degree changing by the same sign.

**Checks.**

- In degree one it is `0 → F^× → F(t)^× → ⊕_π ℤ → 0`, the divisor sequence of the affine line.
- In degree two it is the split exact sequence of Application III.6.5.2.
- Non-example: with `∂_∞` added the map is not onto; in degree one its image is the kernel of the degree map on divisors of `ℙ¹`, so the divisor of the single point `∞` is not in the image.

*Needs:* §5.4; §9.11; §9.13; §9.18; §10.1; §10.2; §10.4; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Tau Ceti `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`.

**Bass–Tate exactness with the corrected filtration proof.** For every field `F` and `n≥1, 0→Kᴹ_n(F)→Kᴹ_n(F(t))→⊕_(p monic irreducible)Kᴹ_(n−1)(F[t]/p)→0` is split exact. The last map uses uniformizer-last residues; its kernel is the constant image and leading-coefficient specialization retracts that image. Infinity is excluded from this direct sum. (Weibel, III.7.3.2–7.4.2, p. 247.)

**Checks.**

- For `n=1` this is the divisor factorization `F(t)ˣ/Fˣ≃⊕_pℤ`.
- For a constant `c` and `g=t`, the finite tame residue is `c` and the omitted infinity residue is `c⁻¹`.
- `h_p` uses the unique nonzero polynomial representatives of degree `<deg p`; the Steinberg check is an equality in F[t], not an assertion that those representatives are constants.

*Needs:* §9.13; §10.1; §10.2; §10.3; §10.4.

### 10.6 The Milnor transfer of a simple extension (Definition III.7.5)

Let `E = F(a)` be a finite extension, `π` the minimal polynomial of a, and `E ≅ F[t]/(π)` by `t ↦` a. Since `∂_∞` vanishes on `K^M_{n+1}(F)` and the residue sum is surjective with kernel `K^M_{n+1}(F)` (§10.5), there are unique homomorphisms `N_p : K^M_n(F[t]/p) → K^M_n(F), p` over the monic irreducible polynomials, with `−∂_∞ = Σ_p N_p ∘ ∂_p` on `K^M_{n+1}F(t)`. The transfer `N_{a/F} : K^M_n(E) → K^M_n(F)` is `N_π` transported to `E`; equivalently `N_{a/F}(x) = −∂_∞(y)` for any `y` with `∂_π(y) = x` and `∂_p(y) = 0` for `p ≠ π`. In degree zero it is multiplication by `[E : F]`. The projection formula and the degree formula `N_{a/F} ∘ res = [E : F]` are §10.8 and §10.9. Between the roadmap's normalisation of the residues and Theorem III.7.3's, every residue on `K^M_{n+1}F(t)` changes by the same sign `(−1)^n`, so `N_{a/F}` is the same in both. Independence of the generator a is Kato's theorem (§10.24), not part of this definition. (Weibel, III.7.5, paragraph before Definition 7.5, p. 248; Weibel, III.7.5, Definition 7.5, p. 248; Weibel, III.7.5, after Definition 7.5, p. 248; Weibel, III.7.5.2, Projection Formula 7.5.2, p. 248; Weibel, III.7.5.3, Corollary 7.5.3, p. 248.)

E/F is a finite field extension generated by a; residues are normalised as in §9.11.

Provide the following API.

- `milnorTransferSimple`: For a integral over `F: N_{a/F} : K^M_n(F⟮a⟯) →+ K^M_n(F)`, defined through the residue at infinity.
- `milnorTransferSimple_eq_neg_residueInfty`: If `∂_π(y) = x` and `∂_p(y) = 0` for every monic irreducible `p ≠ π`, then `N_{a/F}(x) = −∂_∞(y)`.
- `residueInfty_eq_neg_sum_transfer`: For `y ∈ K^M_{n+1}F(t), −∂_∞(y) = Σ_p N_p(∂_p y)`, a finite sum (Weil's formula III.7.5.1).
- `milnorTransferSimple_degree_zero`: In degree zero `N_{a/F}(m) = [F⟮a⟯ : F]·m`.
- `milnorTransferSimple_of_mem`: If `a ∈ F` then `N_{a/F}` is the identity of `K^M_n(F)`.
- `milnorTransferSimple_mul_restrict`: Projection formula: `N_{a/F}(res(x)·y) = x·N_{a/F}(y)` for `x ∈ K^M_*(F)` and `y ∈ K^M_*(F⟮a⟯)`. (§10.8)
- `milnorTransferSimple_restrict`: `N_{a/F}(res x) = [F⟮a⟯ : F]·x` for `x ∈ K^M_n(F)`. (§10.9)
- `milnorTransferSimple_one_eq_norm`: In degree one `N_{a/F}` is Algebra.norm `F` on `F⟮a⟯ˣ` (proved in §10.7).
- `milnorTransferSimple_kbook`: `N_{a/F}` is the same whether the residues are normalised as in the roadmap or as in Theorem III.7.3.

**Checks.**

- For `[F⟮a⟯ : F] = d, N_{a/F}(1) = d` in `K^M_0(F) = ℤ`, from `y = π: ∂_π(π) = 1`, the other finite residues vanish, and `∂_∞(π) = −d`.
- If `a ∈ F (π = t − a)` then `N_{a/F} = id`: for `x ∈ K^M_n(F), y = {x, t − a}` has `∂_{t−a}(y) = x`, no other finite residue, and `∂_∞(y) = −x`.
- In degree one `N_{a/F} = Algebra.norm F` on `F⟮a⟯ˣ`; for `ℚ(i)/ℚ, N(1 + i) = 2`.
- The sign is forced: the maps defined by `+∂_∞ = Σ N_p ∂_p` would give `N_{a/F}(1) = −[F⟮a⟯ : F]` in degree zero.
- For `c ∈ F^×` and `d ∈ F, N_{a/F}{c, a − d} = {c, N(a − d)}`, from the projection formula and the degree-one case (the formula of Corollary III.6.1.5 for a quadratic extension).

*Needs:* §9.11; §10.1; §10.5; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Mathlib `IntermediateField.adjoinRootEquivAdjoin`.

### 10.7 The simple transfer in degree one is the field norm (Exercise III.7.5)

For a finite extension `E = F(a)`, the transfer `N_{a/F} : K^M_1(E) = E^× → K^M_1(F) = F^×` of §10.6 is the field norm Algebra.norm `F`. (The degree-zero case, multiplication by `[E : F]`, is part of §10.6.) (Weibel, Exercise III.7.5, p. 257; Weibel, III.7.5, after Definition 7.5, p. 248.)

`E = F(a)` is a finite extension; `π` is the minimal polynomial of a, of degree `d`.

**Checks.**

- For `ℚ(i)/ℚ, N(1 + i) = 2`.
- For `ℚ(∛2)/ℚ` and `b = ∛2 (g = t, d = 3, e = 1)`, the factor at `q = t` is `π(0) = −2` and the sign `(−1)^{de} = −1` gives the norm 2; without the sign the answer would be wrong.
- For a constant `c ∈ F^×, N_{a/F}(c) = c^{[E:F]}`, which is also the projection formula applied to `c` and 1.

*Needs:* §9.11; §10.6; Mathlib `Algebra.norm`; Mathlib `Algebra.norm_eq_prod_roots`; Mathlib `Polynomial.resultant_eq_prod_eval`.

### 10.8 The projection formula for the transfer

For `E = F(a), x ∈ K^M_*(F)` and `y ∈ K^M_*(E): N_{a/F}(res_{E/F}(x)·y) = x·N_{a/F}(y)`. By Definition III.7.6 and Kato's theorem the same holds for `N_{E/F}` for every finite E/F. (Weibel, Projection Formula III.7.5.2, p. 248; Weibel, Projection Formula III.7.5.2, proof, p. 248.)

`E = F(a)` is a finite extension; `x ∈ K^M_i(F), y ∈ K^M_j(E)`.

**Checks.**

- `y = 1 ∈ K^M_0(E)` gives `N_{a/F}(res x) = [E : F]·x` (§10.9).
- Degree one with `y = 1: N_{E/F}(x) = x^{[E:F]}` for `x ∈ F^×`, the field-norm identity.
- The formula holds in both normalisations of the residue.

*Needs:* §9.14; §10.5; §10.6.

### 10.9 Restriction followed by transfer is multiplication by the degree

For `E = F(a)` of degree `d, N_{a/F} ∘ res_{E/F} = d·id` on `K^M_*(F)`; hence the kernel of `res_{E/F} : K^M_*(F) → K^M_*(E)` is killed by `d`. By composition along a generating tower the same holds for `N_{E/F}` and every finite E/F, degrees multiplying. (Weibel, Corollary III.7.5.3, p. 248.)

`E = F(a)` is a finite extension of degree `d`.

**Checks.**

- Degree one: `N_{E/F}(x) = x^d` for `x ∈ F^×`.
- Degree zero: the composite `ℤ → ℤ → ℤ` is multiplication by `d`.

*Needs:* §10.6; §10.8.

### 10.10 Weil reciprocity on the projective line (III.7.5.1 and III.6.5.3)

For a field `F` and `x ∈ K^M_{n+1}F(t): Σ_v N_v ∂_v(x) = 0` in `K^M_n(F)`, the sum over all places `v` of `F(t)` trivial on `F`, where `N_π = N_{t̄/F}` is the simple transfer of `F[t]/(π) = F(t̄)` and `N_∞` is the identity; only finitely many terms are nonzero. In degree two, for `f, g ∈ F(t)^×` and the roadmap's tame symbol, `∏_v N_{k(v)/F}(∂_v{f, g}) = 1` in `F^×` with `N` the field norm. (Weibel, III.7.5.1, Weil Reciprocity Formula 7.5.1, p. 248; Weibel, III.6.5.3, Weil Reciprocity Formula 6.5.3, p. 236; Weibel, III.6.5.3, proof of the Weil Reciprocity Formula, p. 236.)

`F` is a field; residues are normalised as in §9.11. In degree two either normalisation may be used, since inverting every factor does not change a product equal to 1.

**Checks.**

- For `{a, t − b}` the factor at `∞` is a and the factor at `t − b` is `a^{−1}` (K-book normalisation); all other factors are 1.
- The place at infinity is needed: over `ℚ, {2, t}` has factor 1/2 at the place `t` and 2 at `∞` (K-book normalisation), so the finite places alone do not give 1.
- In degree one `(n = 0)` it says that a principal divisor on the projective line has degree zero, `Σ_v deg(v)·ord_v(f) = 0`.
- Roadmap convention check at 5 over `ℚ`: both the degree-two higher residue and `tameSymbol` send `{2,5}` to 2 in `F_5^×`; its inverse is 3. Only the separately named K-book residue is inverse.

*Needs:* §9.11; §9.13; §10.5; §10.6; §10.7; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Tau Ceti `TauCeti.Place.normResidue`.

### 10.11 Passing to a prime-to-p closure (Kato's key trick)

For a field `F` and a prime `p` there is an algebraic extension F′/F that is the union of its finite subextensions of degree prime to `p` and such that every finite extension of `F′` has p-power degree. For such `F′` and every `n`, every element of the kernel of `K^M_n(F) → K^M_n(F′)` is killed by an integer prime to `p`; in particular the kernel has no p-torsion. (Weibel, III.7.6.1, the paragraph after Theorem 7.6.1, p. 249.)

`F` is a field and `p` a prime.

**Checks.**

- If `F` is algebraically closed, `F′ = F`.
- For `F = 𝔽_q, F′` is the union of the `𝔽_{q^m}` with `m` prime to p.
- The kernel need not vanish: for `p` odd the prime-to-p closure of `ℝ` is `ℂ`, and `{−1, −1} ∈ K^M_2(ℝ)` dies in `K^M_2(ℂ)`; it is killed by 2, which is prime to p.

*Needs:* §5.4; §10.6; §10.9; Mathlib `Sylow`.

**Prime-to-p detection on Milnor groups.** Fix a prime `p` and let `F^(p)/F` be a maximal algebraic extension whose finite subextensions all have degree prime to `p`; it exists by Zorn's lemma applied to the algebraic extensions of `F` inside an algebraic closure all of whose finite subextensions have prime-to-p degree, and its construction is part of this target. Every finite extension of `F^(p)` has p-power degree `(a Sylow argument on a normal hull)`. Each element of `ker(Kᴹ_n(F)→Kᴹ_n(F^(p)))` is killed by an integer prime to `p`; in particular restriction is injective on p-primary torsion. (Weibel, III.7.6.1–7.6.2, p. 249.)

**Checks.**

- An element killed by `p^a` and by a prime-to-p integer is zero by Bézout.
- No normalized discrete valuation or completeness is asserted for the infinite field `F^(p)`.

*Needs:* §5.4; §10.9.

### 10.12 Base change of the simple transfer (Exercise III.7.7)

Let `E = F(a)` be finite with minimal polynomial `π`, F′/F any field extension, `π = ∏_i π_i^{e_i}` in F′[t] with distinct monic irreducible `π_i`, and `E_i = F′(a_i)` with `a_i` a root of `π_i`. Then `res_{F′/F} ∘ N_{a/F} = Σ_i e_i · N_{a_i/F′} ∘ res_i` on `K^M_n(E)`, where `res_i` is induced by the F-embedding `E → E_i` sending a to `a_i`. (Weibel, Exercise III.7.7, p. 257.)

F′/F is an arbitrary field extension (finite in the source); the multiplicities `e_i` are those of the factorisation of `π` over `F′`.

**Checks.**

- In degree zero it is deg `π = Σ_i e_i·deg π_i`.
- If `π` stays irreducible over `F′`, it says `res ∘ N_{a/F} = N_{a/F′} ∘ res`.
- For `F′ = E` and E/F normal it expresses `res_{E/F} ∘ N_{a/F}` as a sum over the conjugates of a, which is what Lemma III.7.6.2 uses.
- For `F′ = F(u)` transcendental and `π = t²−2` over `F = ℚ, π` remains irreducible and the residue/transfer comparison is available without finite-dimensionality of `F′(t)/F(t)`. The extra place `t−u` has trivial restriction and zero residue on classes from `F`.
- For `F′ = F̂_v`, use the `e = 1` residue comparison for completion; `F̂_v/F` need not be finite. This supplies the completion input required by Exercise III.7.9.

*Needs:* §9.11; §9.18; §10.5; §10.6.

### 10.13 Generation by symbols with one entry outside the base (Exercise III.7.6)

If every finite extension of `F` has p-power degree and E/F has degree `p`, then for `n ≥ 1` the group `K^M_n(E)` is generated by the symbols `{y, x_2, …, x_n}` with `y ∈ E^×` and `x_2`, …, `x_n ∈ F^×`. (Weibel, Exercise III.7.6, p. 257; Weibel, III.6.1.4, Lemma 6.1.4 and its proof, p. 232.)

Every finite extension of `F` has p-power degree; `[E : F] = p`; `n ≥ 1`.

**Checks.**

- For `F = ℝ` and `E = ℂ (p = 2), K^M_2(ℂ)` is generated by the `{r, z}` with `r ∈ ℝ^×` and `z ∈ ℂ^×`, as in Example III.6.1.6.
- In degree one the statement is trivial.
- The hypothesis on `F` is used in the first step: over `ℚ`, with `E = ℚ(∛2)`, the element `1 + ∛2 + ∛4` is a quadratic polynomial in `∛2` that does not split over `ℚ`, so the argument does not apply.

*Needs:* §5.10; §10.2.

### 10.14 Independence of the generator for a normal extension of prime degree (Lemma III.7.6.2)

If E/F is normal of prime degree `p` and `E = F(a) = F(b)`, then `N_{a/F} = N_{b/F} : K^M_*(E) → K^M_*(F)`. (Weibel, III.7.6.2, Lemma 7.6.2, p. 249; Weibel, III.7.6.2, proof of Lemma 7.6.2, p. 249.)

E/F is normal (separable or purely inseparable) of prime degree p.

**Checks.**

- In degree one it is the independence of the field norm from the generator.
- In degree zero both transfers are multiplication by p.
- It is the base case of Kato's induction over maximal towers.

*Needs:* §10.6; §10.7; §10.8; §10.9; §10.11; §10.12; §10.13.

### 10.15 The normalized extension of a complete discrete valuation to a finite extension

For a field `F` with a surjective `v:F→ℤᵐ⁰` and v-adically complete valuation ring `R`, and any finite E/F, construct the unique normalized discrete valuation `w` on `E` extending the valuation class of `v`. `E` is complete for `w`, and `ord_w(x)=e ord_v(x)` on `F×` for a positive integer `e`. No separability or residue-field finiteness hypothesis. (Gille–Szamuely, Proposition `A.6.8(1)`, p. 313; Stacks, Definition 15.113.1 (Tag 09E4); Remark 15.116.1 (Tag 09EM).)

Provide the following API.

- `finiteExtensionValuation`: The normalized Valuation `E ℤᵐ⁰`, with surjectivity, positive restriction index and no preinstalled valuation on `E`.
- `adicComplete_iff_complete_norm`: The native `π-adic` completeness and completeness for `2^(−ord)` agree; the norm and valuation topologies agree.
- `finiteExtensionValuation_unique`: Any surjective discrete valuation on `E` with positive restriction index is this valuation; compatibility is a named equality, not a second global instance.
- `finiteExtensionValuation_tower`: Restriction indices multiply in a finite tower; compatible embeddings preserve units and induce the native local residue map.
- `finiteExtensionValuation_localField`: Under IsNonarchimedeanLocalField `F`, identify this construction with the Layer 0 valuation class and normalized valuation.

**Checks.**

- `E=F` gives `e=1`, the original valuation and residue map, and the original topology.
- `F=ℚ((t)), E=ℚ((s)), t=s²: ord_E(s)=1, ord_E(t)=2` and `e=2`. No IsNonarchimedeanLocalField instance is assumed.
- `k=F₂(a), F=k((t)), E=F(α), α²+tα+a=0`: E/F is separable, `e=1`, residue `l=k(√a)` has inseparable degree 2. Reject a separable-residue requirement.

*Needs:* LocalFieldsRamification Layer 0; Mathlib `spectralNorm.normedField`; Mathlib `spectralNorm_unique`; Mathlib `spectralNorm.completeSpace`.

### 10.16 The integral closure in a finite extension is a finite free complete DVR

For the preceding finite E/F, `S=integralClosure R E` is the valuation ring of `w`, a complete DVR and a finite free R-module of rank `[E:F]=e[l:k]`, with `l` and `k` the native residue fields. Identify `π_F S=𝔪_S^e`, and the `e` successive quotients with `l` as k-vector spaces. Residue extensions may be inseparable. (Stacks, Lemma 10.119.7 (Tag 00PD); Lemma 10.153.4 (Tag 04GH); Lemma 10.162.8 (Tag 032W); Gille–Szamuely, Propositions A.6.7–A.6.8, p. 313; Lemma 7.3.10, pp. 200–201.)

Provide the following API.

- `valuationSubring_equiv_integralClosure`: A named R-algebra equivalence identifying the ring, its maximal ideal, residue field and units.
- `integralClosure_finite_free`: Module.Finite `R S` and Module.Free `R S`; finrank `F E` equals the R-module rank of `S`.
- `ramification_mul_residueDegree`: `e>0, [l:k]>0` and `[E:F]=e[l:k]`, including purely inseparable E/F.
- `extension_uniformizer_filtration`: Identify `π_F S=𝔪_S^e` and the e-step quotient `S/π_F S`. Reuse TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer for each piece; export the compatibility with the k-vector-space filtration, not a second graded-piece construction.
- `uniformizer_minpoly_eisenstein`: If `e=[E:F]` and `l=k`, every uniformizer `π_E` generates E/F and its minimal polynomial over `F` is Eisenstein over `R`.

**Checks.**

- For `t=s²` over `ℚ, S=ℚ[[s]]` is R-free on `1,s`; S/tS has two residue layers, each `ℚ`.
- `E=ℚ(i)((t))` over `ℚ((t))` has `e=1, [l:k]=2`, basis `1,i`; `t` remains a uniformizer.
- For `α²+tα+a` in characteristic `2, R[α]` is free on `1,α`, local with maximal ideal `(t)` and residue `k(√a)`, hence a DVR and already the integral closure. It has `e=1,f=2`, not `e=2,f=1`.

*Needs:* §10.15; Tau Ceti `TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer`; Mathlib `Ideal.sum_ramification_inertia_eq_finrank`.

### 10.17 Norms of a finite extension: valuation and residue

For every finite extension E/F as in §10.15, `ord_F(N_E/F y)=[l:k]ord_E(y)` for `y≠0`. For `u∈S×, N_E/F(u)∈R×` and `res_k(N_E/F u)=N_l/k(res_l u)^e`. Here norms are the determinant norms, also for inseparable residue extensions. (Stacks, Lemma 10.121.8 (Tag 02MJ); Gille–Szamuely, Lemma 7.3.10, pp. 200–201; Proposition `A.6.8(2)`, p. 313.)

Provide the following API.

- `ord_norm`: The valuation-of-norm identity for all nonzero elements, not just units.
- `residue_norm_unit`: The displayed exponent-e residue identity for `S×→R×`.
- `norm_integral_norm_unit`: Use the integral norm and `Algebra.algebraMap_intNorm` to restrict `S→R`, and restrict the homomorphism to units; do not define a second determinant norm.
- `norm_tower_and_localField`: Reuse `Algebra.norm_norm` for tower maps. Compare the new identities with LocalFieldsRamification Layer 3 norms through the uniqueness statement of §10.15.

**Checks.**

- For `t=s²` over `ℚ, N(s)=−t` and `N(2)=4`. Hence `ord_F N(s)=1`, and residue `N(2)=2²`: both the sign and exponent `e=2` are visible.
- For `ℚ(i)((t))/ℚ((t)), N(t)=t²` and `N(1+i)=2`; the valuation factor is `f=2`, not `e=1`.
- For `α²+tα+a, N(α)=a=N_l/k(√a), N(t)=t², e=1` and `f=2`. A norm defined as a product of distinct residue embeddings gives the wrong answer.

*Needs:* §10.16; Mathlib `Algebra.norm`; Tau Ceti `TauCeti.Algebra.norm_quotient_mk` for the finite-free quotient norm.

### 10.18 Separable base change and residue component lengths

Let E/F be finite SEPARABLE and F′/F any finite extension of complete discretely valued fields. Let R,S,R′ be their valuation rings, k,l,k′ their residues, `e=e(E/F), r=e(F′/F), E⊗F F′=∏E_i` with valuation rings `S_i` and residues `l_i`. Write `l⊗k k′=∏A_j`, with `L_j` the residue of `A_j` and `t_j=length_(A_j)(A_j)`. Put `e_i=e(E_i/F′), e′_i=e(E_i/E)`. The natural residue maps assign each `i` to `j` and inject `L_j` into `l_i`. Then `Σ_(i over j) e_i[l_i:L_j]=e t_j` and `Σ_(i over j) e′_i[l_i:L_j]=r t_j`. No separability of l/k or equality `l_i=L_j` is assumed. (Stacks, Remark 15.116.1 (Tag 09EM), for the complete-DVR normalization input; the componentwise lattice argument is given below.)

Provide the following API.

- `tensor_normalization_lattice`: The canonical inclusion `B⊂∏S_i` is finite, has the stated common fraction algebra, and has finite-length cokernel over `R′`.
- `residue_component_map`: The canonical `A_j→l_i` factors through an injective `L_j→l_i`, with complete assignment of factors and invariance under relabeling.
- `baseChange_component_length`: Both displayed componentwise identities, natural in finite towers and compatible with `e e′_i=r e_i`.
- `separable_scope`: Do not assert `E⊗F F′` is reduced for inseparable E/F. Such E/F is handled by normal prime-degree towers in the K2 consumer; Artinian transfer lengths remain in the arbitrary-field base-change theorem.

**Componentwise lattice calculation.** Since E/F is separable, the generic algebra of `B=S⊗_R R′` is the product of fields `∏E_i`. Its normalization `C=∏S_i` is finite over `R′` by §10.16. The inclusion `B→C` is an inclusion of full R′-lattices, so `Q=C/B` has finite length. The maximal ideals of `B` are indexed by the local factors `A_j` of `l⊗_k k′`: reducing `B` modulo a uniformizer of `R′` first gives `(S/π_F S)⊗_k k′`, whose nilpotent quotient is `l⊗_k k′`. Completeness lifts its orthogonal idempotents to `B`. Thus `B=∏B_j` and `C=∏C_j`, with `C_j=∏_(i over j)S_i`.

For each `j`, multiplication by `π_(F′)` on `0→B_j→C_j→Q_j→0` shows that `B_j/π_(F′)B_j` and `C_j/π_(F′)C_j` have the same R′-length: the finite-length module `Q_j` has equally long kernel and cokernel under multiplication by `π_(F′)`. The `e` successive residue layers of `S/π_F S`, after tensoring with `k′` and taking the j-idempotent, are each `A_j`. Hence the first length is `e·t_j·[L_j:k′]`. The second is `Σ_(i over j)e_i[l_i:k′]`. Dividing this equality of nonnegative integers by the positive integer `[L_j:k′]` proves `Σe_i[l_i:L_j]=e t_j`. The valuation identity `e e′_i=r e_i` then gives `e·Σe′_i[l_i:L_j]=r e t_j`; cancel `e>0` in `ℤ` to obtain the second identity. These cancellations are in integer length calculations, never in a Milnor K-group. This argument also explains why the residue compositum cannot replace `l_i` and why the lengths `t_j` cannot be dropped.

**Checks.**

- `E=ℚ((s)), s²=t, F′=E: r=e=2`; two `E_i=E`, each `e_i=e′_i=1`; `l⊗k k′=ℚ` has `t_j=1`, so the sum is 2.
- `E=ℚ((s)), s²=t` and `F′=ℚ((u)), u²=2t`: one `E_i=ℚ(√2)((u)), e_i=e′_i=1` and `[l_i:L_j]=2` with `L_j=ℚ, t_j=1`. The length sum is 2; replacing `l_i` by the residue compositum gives 1 and fails.
- For `α²+tα+a` over `F₂(a)((t))` and `F′=E`, the separable generic tensor is `E×E` but `l⊗k l≅l[ε]/ε²` has `t_j=2`. Here `e=r=e_i=e′_i=1` and the two residue-degree terms are 1, giving `2=1·2`. Using reduced residue factors with multiplicity 1 fails.

*Needs:* §10.16.

### 10.19 The four residue cases on a symbol with base-field entries

For complete discretely valued `F`, normal E/F of prime degree `p` and `α={y,a₂,…,a_n}` with `y∈E×` and `a_i∈F×` for `i≥2`, one has `∂_F N_(E/F)α=N_(l/k)∂_Eα`, integrally and with possibly inseparable l/k. The simple norm on `E` is generator-independent by §10.14. (Weibel, proof of Corollary III.7.6.3 and Exercise III.7.8, pp.249, 257; the computation is supplied below.)

For `n=1` this is §10.17. For `n≥2`, write base entries as units times powers of `π_F`. Multilinearity and `{π_F,π_F}={π_F,−1}` reduce to symbols `{y,U}` and `{y,U,π_F}`, where `U` is an ordered list of base units, of length `n−1` or `n−2` respectively. Write `e=e(E/F), f=[l:k]`, so `ef=p`; write `y=wπ_E^m` and `π_F=vπ_E^e`, with `w,v` units of `E`. The two possibilities `(e,f)=(1,p),(p,1)`, and the two possibilities for the reduced symbol, give the four cases.

For `{y,U}`, the projection formula gives `N{y,U}={Ny,U}`. The last-uniformizer residue on the left is `(−1)^(n−1)fm{Ū}`; on the right it is `N_(l/k)((−1)^(n−1)m{Ū})` with `Ū` restricted from `k`. The norm–restriction degree identity makes these equal. No unit correction or division is involved.

For `{y,U,π_F}`, put `c=res_k(Nπ_E/π_F^f)`. The needed leading coefficient identity is

`c=(−1)^(p−f)·N_(l/k)(v̄)⁻¹`.

If `e=1, π_E=π_F v⁻¹` and the residue-of-unit-norm formula §10.17 gives it, since `f=p`. If `e=p` and `f=1`, the uniformizer `π_E` generates E/F by §10.16 and has Eisenstein polynomial `X^p+a_(p−1)X^(p−1)+⋯+a₀`. Its constant term satisfies `res(a₀/π_F)=−v̄⁻¹`: divide the polynomial equation by `π_F` and reduce in `E`; all intermediate terms have positive E-order. Since `Nπ_E=(−1)^p a₀`, this gives the displayed identity, also in inseparable characteristic p. This proves its sign without extracting an `e-th` root in `k×`.

The residue on the left is therefore

`{N_(l/k)(w̄)^e·c^m,Ū}+fm{−1,Ū}`
`={N_(l/k)(w̄)^e·N_(l/k)(v̄)^(-m),Ū}+pm{−1,Ū}`.

On the right, expand `{wπ_E^m,U,vπ_E^e}` before taking its residue. The all-unit term vanishes, the single-uniformizer terms give `e{w̄,Ū}−m{v̄,Ū}`, and the repeated-uniformizer term gives `me{−1,Ū}`. Moving `a {−1}` entry changes no sign because it is 2-torsion. Apply `N_(l/k)` and the projection formula for the entries `Ū`: the answer is exactly the same displayed expression since `ef=p`. This handles arbitrary positive and negative `m` and powers of the base uniformizer, without a separable-residue assumption.

**Checks.**

- For `n=1, E=ℚ((s)), t=s²` and `y=s`, both sides are 1, since `N(s)=−t`.
- For `n=2` and `y=π_E`, the leading coefficient `c` and `(−1)^f` on the left must combine to `(−1)^p N(v̄)⁻¹`; dropping the Eisenstein sign fails at `p=2` in characteristic zero.
- For the unit-only symbol the factor is `f`, while the residue of a symbol ending in `π_F` introduces `e` before applying the residue norm. Interchanging `e` and `f` fails for unramified and totally ramified quadratic extensions.
- For `n=2` the list `U` is empty; every displayed remaining symbol is a degree-one class, so its addition is multiplication in the residue units. Higher degrees use the same ordered projection formula.
- Purely inseparable residue degree `p` is retained, with determinant norm rather than a product over distinct conjugates.

*Needs:* §9.14; §10.7; §10.8; §10.9; §10.14; §10.16; §10.17.

### 10.20 Residues commute with the transfer over a complete field (Corollary III.7.6.3)

Let `F` be complete for a discrete valuation `v` with residue field `k_v`, E/F normal of prime degree `p`, and `w` the unique extension of `v` to `E`, with residue field `k_w`. Then `∂_v ∘ N_{E/F} = N_{k_w/k_v} ∘ ∂_w` on `K^M_n(E)`, where `N_{E/F}` is well defined by §10.14 and `N_{k_w/k_v}` is the identity if `k_w = k_v` and otherwise the transfer of the normal extension `k_w/k_v` of degree p. (Weibel, III.7.6.3, Corollary 7.6.3, p. 249; Weibel, III.7.6.3, proof of Corollary 7.6.3, p. 249; Gille–Szamuely, Proposition 7.3.9, pp. 199–202.)

`F` complete for `v`; E/F normal of prime degree `p`; residues normalised as in §9.11.

**Checks.**

- In degree one it is `v(N_{E/F}(y)) = f·w(y)`, with `f = [k_w : k_v]`.
- For E/F unramified and `n = 2` it says that the tame symbol of a norm is the norm of the tame symbol.
- Completeness is used: for a field that is not complete there may be several places above `v`, and the formula becomes the sum of §10.21 or of §10.27.

*Needs:* §9.11; §9.14; §9.18; §10.7; §10.8; §10.9; §10.11; §10.12; §10.13; §10.14; §10.16; §10.19.

**Finite descent in the prime-degree complete residue square.** Here is the integral detection step in Weibel's proof of Corollary III.7.6.3, p.249, and Exercises III.7.7–7.8, p.257. Put `δ=∂_F N_(E/F)α−N_(l/k)∂_Eα`. First `pδ=0`. Indeed, simple-transfer base change for `E⊗_F E` (§10.12) and residue restriction give `e·res_(l/k)δ=0`. In the separable case, the `p` conjugate residues sum each distinct residue embedding `p/[l:k]_sep` times. On the other side `res_(l/k)N_(l/k)` sums each such embedding `[l:k]_insep` times, and multiplying by `e` makes the multiplicities equal because `e[l:k]=p`. In the purely inseparable case the generic tensor has length `p` and the same equality uses its unique residue embedding with multiplicity p. Applying `N_(l/k)` and its degree formula gives `e[l:k]δ=pδ=0`. The residue extension is normal, of degree 1 or `p`, so these simple norms are already generator-independent by §10.14.

For the given `α` choose a finite F′/F of degree `d` prime to `p` so that its restriction to `E′=EF′` is a sum of one-outside-entry symbols, as in Weibel's proof. E′/F′ still has degree `p` and is normal. Put `r=e(F′/F), e′=e(E′/E)`, and let k′,l′ be the residues. Both `r` and `e′` divide `d`, while `e(E′/F′)` is 1 or `p`; the tower equality `e e′=r e(E′/F′)` therefore forces `e(E′/F′)=e` and `e′=r`. The residue degree of E′/F′ is consequently `f=[l:k]`. If `f=p`, then [k′:k] is prime to `p` and `l⊗_k k′` is the field `l′`; if `f=1` the residue norm is the identity. Thus the simple-transfer base-change formula applies to the residue norm as well as the generic norm. The four computations of §10.19 give

`r·res_(k′/k)δ`
`=∂_(F′)N_(E′/F′)res_(E′/E)α−N_(l′/k′)∂_(E′)res_(E′/E)α=0`.

Norming back along any chosen simple generating tower of k′/k and using its degree formula gives `dδ=r[k′:k]δ=0`. Bézout applied to `pδ=0` and `dδ=0` proves `δ=0` integrally. All valuation fields in this calculation are finite over the original complete field; no valuation on an infinite prime-to-p closure is used. This proves the normal prime-degree input before Kato transitivity. The separate arbitrary-degree reduction, including nonreduced residue components, is §10.26.

*Needs:* §9.18; §10.9; §10.11; §10.12; §10.14; §10.16; §10.17; §10.19.

### 10.21 The norm-residue formula for a constant extension of prime degree (Exercise III.7.9)

Let E/F be normal of prime degree `p` and `v` a place of `F(t)` trivial on `F`. Then `∂_v ∘ N_{E(t)/F(t)} = Σ_{w|v} N_{E(w)/F(v)} ∘ ∂_w` on `K^M_{n+1}E(t)`, the sum over the places `w` of `E(t)` above `v`; `N_{E(t)/F(t)}` and the residue-field transfers are well defined by §10.14, each extension involved being normal of degree 1 or p. (Weibel, Exercise III.7.9, p. 258.)

E/F normal of prime degree `p`; `v` a place of `F(t)` trivial on `F`.

**Checks.**

- In degree zero `(n + 1 = 1)` it is `v(N_{E(t)/F(t)}(y)) = Σ_{w|v} f(w|v)·w(y)`.
- If `v` is inert `(a single w with [E(w) : F(v)] = p)` it is the complete formula without completion.
- For `v = ∞` it gives `∂_∞ ∘ N_{E(t)/F(t)} = N_{E/F} ∘ ∂_∞`, the identity used in Proposition III.7.6.4.

*Needs:* §9.11; §10.12; §10.14; §10.20; Tau Ceti `TauCeti.Place.restrict`; Tau Ceti `TauCeti.Place.finite_setOf_restrict_eq`.

**The normal constant-extension residue identity through finite normalization and completion.** For E/F normal of prime degree `p` and any place `v` of `F(t)/F, ∂_v N_(E(t)/F(t))=Σ_(w|v)N_(κ(w)/κ(v))∂_w`. This is the §10.21 target with its finite-normalization and completion supply made explicit before Kato transitivity. (Weibel, Exercise III.7.9, III.7.6.4, pp. 250, 258; Stacks, Lemma 10.153.4 (Tag 04GH); Remark 15.116.1 (Tag 09EM).)

**Checks.**

- Infinity uses the `t⁻¹` chart and is included.
- At a split place the sum has `p` degree-one terms; at a nonsplit place it has one degree-p term.
- This proof does not cite the general norm–residue theorem that will follow Kato transitivity.

*Needs:* §9.18; §10.12; §10.20; AlgebraicCurves Layer 2.

### 10.22 Kato's commuting square (Proposition III.7.6.4)

Let E/F be normal of prime degree `p, F′ = F(a)` finite and `E′ = E(a)`. Then `N_{E/F} ∘ N_{a/E} = N_{a/F} ∘ N_{E′/F′}` on `K^M_*(E′)`, the norms `N_{E/F}` and `N_{E′/F′}` being well defined by §10.14. (Weibel, III.7.6.4, Proposition 7.6.4, p. 250; Weibel, III.7.6.4, proof of Proposition 7.6.4, p. 250.)

E/F normal of prime degree `p`; `F′ = F(a)` a finite simple extension.

**Checks.**

- In degree one both sides are the field norm `N_{E′/F}`.
- If `a ∈ F` both sides reduce to `N_{E/F}`.
- In degree zero both sides are multiplication by `[E′ : F]`.

*Needs:* §10.6; §10.14; §10.21.

### 10.23 Splitting-field comparison of arbitrary transfer towers

Let E/F be finite, M/F a finite normal extension containing a normal hull of `E`, and `N_τ` any composite of simple Bass–Tate transfers along a generating tower `τ` of E/F. Then `res_(M/F) N_τ=[E:F]_insep Σ_(σ:E↪_F M) σ_*` on `Kᴹ_n(E)`. Thus two towers differ by a map whose every value is killed by [M:F]. (Suslin, §1, Corollary 1.10, p.594.)

**Checks.**

- For a separable nonnormal cubic `E/ℚ` use its normal closure, not `E` as a splitting field.
- For a purely inseparable extension of degree `p^a` the sum has one embedding with multiplicity `p^a`.
- No general transfer base-change theorem or Kato transitivity is used in this pre-Kato argument.

*Needs:* §10.6; §10.9; §10.12.

### 10.24 Milnor norms of finite extensions and Kato's transitivity theorem

For a finite extension `E = F(a_1, …, a_r)`, the composite `N_{a_1/F} ∘ N_{a_2/F(a_1)} ∘ ⋯ ∘ N_{a_r/F(a_1, …, a_{r−1})}` of the simple transfers of §10.6 (Definition III.7.6) does not depend on the choice of generators (Kato). Hence the Milnor norm `N_{E/F} : K^M_*(E) → K^M_*(F)` is well defined, `N_{E/F} = N_{F′/F} ∘ N_{E/F′}` for every intermediate field `F′`, it is multiplication by `[E : F]` in degree zero and Algebra.norm `F` in degree one, and for a simple extension `N_{E/F} = N_{a/F}` for every generator a. (Weibel, III.7.6, Definition 7.6, p. 249; Weibel, III.7.6.1, Theorem 7.6.1, p. 249; Weibel, III.7.6.1, proof of Theorem 7.6.1, p. 250.)

E/F is a finite field extension.

**Checks.**

- In degree one `N_{E/F}` is Algebra.norm `F` and transitivity is the `Algebra.norm_norm`.
- For a simple extension `N_{E/F} = N_{a/F}` for every generator a, which is not part of the definition of §10.6.
- Independence is a theorem: the reduction to towers of prime degree and the comparison of two towers are its substance.
- Kato's independence of the chain of generators is stated here, not assumed; the downstream consumer MotivicEtaleKTheory (its M.4) uses the norm with this independence.

*Needs:* §10.6; §10.7; §10.11; §10.12; §10.14; §10.22; Mathlib `Algebra.norm_norm`.

**Generator independence through splitting-field towers.** For every finite E/F, every degree `n≥0` and every generating tower `τ`, the composite `N_τ` is independent of `τ` and of the simple generators. It defines `N_(E/F):Kᴹ_n(E)→Kᴹ_n(F)`, is transitive in every finite intermediate tower, satisfies the projection and degree formulas, is field norm in degree one, and is multiplication by [E:F] in degree zero. This supplies the norm target of this subsection. (Weibel, III.7.6.1–7.6.4, pp.249–250; Suslin, Corollary 1.10, p.594.)

**Checks.**

- A nonnormal cubic uses a normal hull in the annihilator argument.
- A degree `p³` extension with distinct first degree-p subfields is compared through AB and the remaining degree-p extension above it.
- Purely inseparable towers and all integral torsion are retained; no rationalization occurs.

*Needs:* §10.6; §10.7; §10.11; §10.14; §10.21; §10.23; Mathlib `Algebra.norm_norm`.

### 10.25 General finite-transfer base change with Artinian lengths

Let E/F be finite, F′/F arbitrary, and `E⊗_F F′≃∏_i A_i` its decomposition into local Artinian algebras. Put `E_i=A_i/𝔪_i` and `m_i=length_(A_i)(A_i)`. For every `n≥0, res_(F′/F)N_(E/F)=Σ_i m_i N_(E_i/F′)res_(E_i/E)`. The norms are Kato’s generator-independent norms. (Weibel, Exercise III.7.7, III.7.6.1, pp. 249, 257.)

**Checks.**

- For E/F separable the tensor is reduced and every `m_i=1`.
- For `E=𝔽_p(s^(1/p),t^(1/p))` over `F=𝔽_p(s,t)`, base changing to `E` gives `E[ε,η]/(ε^p,η^p)`: its length is `p²` and its maximal-ideal nilpotence index is `2p−1`.
- In degree zero the formula is the vector-space identity `[E:F]=Σ_i m_i[E_i:F′]`; at `p=2` the preceding example requires coefficient 4, not 3.

*Needs:* §10.9; §10.12; §10.24.

<a id="milnor-filtered-colimits"></a>

**Filtered-colimit compatibility.** For every filtered system of fields with field embeddings and colimit `F`, the canonical map from the colimit of the graded Milnor rings to `K⁽M⁾_*(F)` is an isomorphism in every degree. Symbols and relations descend to a finite stage. For compatible surjective discrete valuations with unchanged value group `ℤ` and compatible uniformizers, residues and specializations commute with this map and the induced residue-field colimit. For a filtered system `E_i/F_i` of finite extensions with base-change isomorphisms `E_i⊗_{F_i}F_j≃E_j` for every transition `i→j`, the norms of §10.24 commute with the colimit maps; their construction and identities remain those of Layer 10. This is the export contract for a `milnorResidueNorm` adapter: §§5.4–5.8, 7.2, 9.11–9.18 and 10.5–10.25 supply its ring, last-slot residues and generator-independent finite-extension norms. (Own finite-presentation argument from Weibel, III.7.1, 7.3–7.6.1, pp.245–249.)

**Checks.**

- Every finite tuple of symbol entries, and every finite sum of defining relations, occurs at one stage.
- A union of finite fields has zero Milnor groups in degrees at least two.
- The residue identity retains `∂{u₁,…,uₙ₋₁,π}={ū₁,…,ūₙ₋₁}`; the norm identity retains `N∘res=[E:F]` when the finite extension descends to a stage.

*Needs:* §§5.4–5.8 (presentations and field maps); §§9.11–9.18; §§10.24–10.25; Mathlib `DirectLimit`.

### 10.26 The integral norm–residue square for every finite complete extension

Let `F` be complete for a normalized discrete valuation, E/F any finite extension, and `k,l` their residue fields. For every `n≥1`,

`∂_F N_(E/F) = N_(l/k) ∂_E : K⁽ᴹ⁾_n(E) → K⁽ᴹ⁾_(n−1)(k)`.

There is no separability, perfectness, finite-residue-field or torsion-free hypothesis. Norms are the integral Kato norms of §10.24; residues put the uniformizer last. The following finite descent reduces the assertion to the normal prime-degree square of §10.20. It uses Weibel, Corollary III.7.6.3 and Exercises III.7.7–7.8, pp.249, 257, together with finite-transfer base change (§10.25) and the complete-DVR lattice calculation (§10.18). Gille–Szamuely, Proposition 7.4.1, p.204, states the general result; that book's proof is not an input to the argument below. Suslin's quotient by torsion is not used.

**Finite Sylow descent.** First suppose E/F is separable. Fix a rational prime ℓ, choose a finite Galois normal closure M/F of E/F, choose a Sylow ℓ-subgroup `P` of `Gal(M/F)`, and put `F′=Mᴾ`. Then `d=[F′:F]` is prime to ℓ. Each field factor `E_i` of `E⊗_F F′` embeds in `M` over `F′`. Every subgroup of the finite ℓ-group `P` admits a subnormal chain with successive indices ℓ; reversing its fixed fields writes `E_i/F′` as a tower of normal degree-ℓ extensions. Therefore §10.20 and norm transitivity prove the residue square for every `E_i/F′`. All these valuation fields are finite over `F` and complete. No valuation on an infinite prime-to-ℓ closure enters this reduction.

For `α∈K⁽ᴹ⁾_n(E)`, put `x=∂_Eα` and `δ=∂_F N_(E/F)α−N_(l/k)x`. Use the notation of §10.18: `r=e(F′/F), k′=κ(F′), e′_i=e(E_i/E), l_i=κ(E_i)`, and `l⊗_k k′=∏_j A_j` with residue `L_j` and length `t_j`. Residue restriction, separable generic base change and the residue squares just proved give

`r·res_(k′/k)(∂_F N_(E/F)α)`
`= Σ_i e′_i·N_(l_i/k′) res_(l_i/l)x`.

On the other hand, Artinian base change of the residue norm gives

`r·res_(k′/k)(N_(l/k)x)`
`= r·Σ_j t_j·N_(L_j/k′) res_(L_j/l)x`.

For `i` lying over `j`, transitivity and `N_(l_i/L_j)res_(l_i/L_j)=[l_i:L_j]` identify the corresponding term of the first sum with `e′_i[l_i:L_j]·N_(L_j/k′)res_(L_j/l)x`. The identity `Σ_(i over j)e′_i[l_i:L_j]=r t_j` from §10.18 identifies the two sums, including nonreduced residue components. Thus `r·res_(k′/k)δ=0`. Applying `N_(k′/k)` gives

`d·δ = r[k′:k]·δ = 0`,

because F′/F is complete and defectless (§10.16). This calculation takes place in the integral Milnor group. For this chosen ℓ its annihilator `d` is prime to ℓ, so `δ` vanishes after localization at ℓ. Doing this for every rational prime forces `δ=0`: any nonzero torsion element has a prime dividing its order, and a nontorsion element cannot have even one positive annihilator. In particular, the proof never cancels a possibly noninvertible degree in a torsion group.

For arbitrary E/F, let `E_s` be the maximal separable subextension. The extension `E/E_s` is purely inseparable and admits a tower of degree-p purely inseparable extensions, where `p` is the characteristic; each such extension is normal. Apply §10.20 to these steps, the separable case to `E_s/F`, and transitivity to both the field norms and the residue norms. This proves the displayed square without weakening its scope.

Provide the following API.

- `completeNormResidue_separable_sylow`: For separable E/F and each prime ℓ, the finite fields above give the explicit prime-to-ℓ annihilator of the integral defect `δ`.
- `completeNormResidue`: The displayed equality for every finite E/F and `n≥1`, including purely inseparable extensions and integral torsion classes.
- `completeNormResidue_tower`: Its square for a finite tower is the composite of the two residue squares with the actual residue-field embeddings and norms.

**Checks.**

- For `E=F` the normal closure, Sylow base change and every residue map are identities; `d=r=1` and `δ=0`.
- At `n=1` the formula is `ord_F N(y)=[l:k]ord_E(y)`. For `ℚ((s))/ℚ((t)), t=s², N(s)=−t`, and both sides equal 1. An extra ramification coefficient would give 2.
- For `ℚ(i)((t))/ℚ((t)), e=1,f=2`, and the two sides on `t` are 2. The residue norm on `K⁽ᴹ⁾₀=ℤ` multiplies by the residue degree.
- For `k=𝔽₂(a)` and `E=k((t))(α), α²+tα+a=0`, the extension is separable with `e=1` and inseparable residue degree 2. Taking `F′=E` produces a residue tensor of length 2 although the generic tensor has two reduced factors; discarding `t_j` breaks the calculation.
- For the purely inseparable extension `k((s))/k((t)), t=sᵖ, N(s)=(−1)^(p−1)t` and both degree-one residues equal 1, also at `p=2`. The extension is handled by a normal inseparable prime step, not a Galois normal closure.
- The equation `2δ=0` does not imply `δ=0` in a group with 2-torsion. The Sylow argument at `ℓ=2` instead gives an odd annihilator; together they kill `δ` by Bézout. No rationalization or quotient by torsion is permitted.
- Changing to the uniformizer-first convention multiplies both sides in degree `n` by `(−1)^(n−1)`, preserving the square.

*Needs:* §9.18; §10.9; §10.16; §10.18; §10.20; §10.24; §10.25; Mathlib `Sylow` and finite Galois correspondence.

### 10.27 The norm–residue formula for Milnor norms of a finite extension

Let E/F be a finite extension, `v` a discrete valuation on `F` with valuation ring `R`, and suppose the integral closure `S` of `R` in `E` is a finite R-module (equivalently `Σ_{w|v} e_w f_w = [E : F]`; automatic if E/F is separable or `F` is complete; for arbitrary `K/F(t)` it follows from AlgebraicCurves Layer 2’s finite-normalization milestone). Let `w` run over the valuations of `E` over `v`, with residue fields `k_w ⊇ k_v` (possibly inseparable over `k_v`). Then `∂_v ∘ N_{E/F} = Σ_{w|v} N_{k_w/k_v} ∘ ∂_w` on `K^M_n(E)`, with `N_{E/F}` and `N_{k_w/k_v}` the Milnor norms of §10.24 (Kato's norms, defined for every finite extension, separable or not). In degree one this is `ord_v(N_{E/F} x) = Σ_w f_w·ord_w(x)`; residue degrees enter through `N_{k_w/k_v}`, and the ramification indices do not appear (they enter only the restriction formula §9.18). This norm/residue square is used by §10.29; its comparison with Quillen’s transfer and the localisation boundary is §11.7. (Weibel, Exercise III.7.9, p. 258; Weibel, Corollary III.7.6.3, p. 249; Gille–Szamuely, Corollary 7.4.3, p. 205; Corollary 7.3.11, p. 202; Appendix A.6.4.)

E/F is a finite field extension and `v` a discrete valuation on `F`. The integral closure of the valuation ring of `v` in `E` is a finite module over it `(Σ_w e_w f_w = [E : F])`. Without it the formula fails: in degree one, for `x = π ∈ F`, it would read `[E : F] = Σ_w e_w f_w`.

**Checks.**

- Degree one: `ord_v(N_{E/F}x) = Σ_w f_w ord_w(x)`, e.g. `ℚ(i)/ℚ` at `5: N(2 + i) = 5` and the two places over 5 give `1 + 0`.
- For classes from `F` the formula combines with §9.18 and §10.9 into `[E : F] = Σ e_w f_w`, the finiteness hypothesis.
- The formula is the same in both normalisations of the residue (each side changes by `(−1)^{n−1}`).

*Needs:* §9.11; §10.9; §10.12; §10.16; §10.17; §10.20; §10.24; §10.26; Mathlib `Ideal.sum_ramification_inertia_eq_finrank`; Mathlib `Ideal.relNorm_singleton`; Mathlib `Algebra.norm`; AlgebraicCurves Layer 2.

**The norm–residue formula under finite normalization.** Let E/F be finite, `v` a discrete valuation on `F`, and assume its valuation ring `R` has finite integral closure `S` in `E`. For `n≥1, ∂_v N_(E/F)=Σ_(w|v)N_(κ(w)/κ(v))∂_w` on `Kᴹ_n(E)`. The hypothesis holds for separable E/F, for complete `F`, and for finite extensions of one-variable function fields over any constant field by the AlgebraicCurves finite-normalization contract. (Weibel, Exercise III.7.9, p. 258; Stacks, Remark 15.116.1 (Tag 09EM); Lemma 10.153.4 (Tag 04GH).)


**Completion proof.** Complete `R` at its maximal ideal. Since `S` is finite over `R, S⊗_R` R̂ is the product, over its maximal ideals `w`, of the completed DVRs `Ŝ_w`. Inverting the base uniformizer gives `E⊗_F F̂=∏_w Ê_w`, with the same residue fields `κ(w)`. These are fields even when E/F is inseparable; this follows from the completed finite-normalization decomposition, rather than a general assertion that inseparable tensors are reduced. Apply the arbitrary-base-field formula §10.25 to F̂/F. Every generic factor now has length one. Apply §10.26 to each finite complete extension `Ê_w/F̂`, and use that completion preserves the normalized order and residue map (ramification index one). The resulting sum is exactly the displayed formula over `F`. No injection of a Milnor group into its completion, and no division by a residue or ramification degree, is used.

**Checks.**

- Degree one reads `ord_v N(x)=Σ_w[κ(w):κ(v)]ord_w(x)`; no additional `e_w` multiplies the right hand side.
- For `E=ℚ(i), v=5` and `x=2+i, N(x)=5`; the two places contribute 1 and 0.
- For a base uniformizer the formula recovers `[E:F]=Σ_w e_w f_w`, explaining why finite normalization cannot simply be omitted.

*Needs:* §9.18; §10.16; §10.17; §10.25; §10.26; AlgebraicCurves Layer 2.

### 10.28 Closed points of the regular proper model against places: the AlgebraicCurves dictionary and tame symbols

Let `K` be a function field of one variable over `F` and `X` the proper regular integral curve with function field `K` (the normalisation of `ℙ¹_F` in `K`, AlgebraicCurves Layer 12B; any proper integral curve with function field `K` has `X` as its normalisation). AlgebraicCurves Layer 12 supplies: `ord_x : K^× → ℤ` at each regular closed point through the discrete valuation ring `O_{X,x}` (12A); the bijection `x ↦ P_x` between closed points of `X` and places of K/F, with Scheme.ord at `x` equal to the order at `P_x` and `κ(x) ≃ₐ[F] k(P_x)`, degrees matching (12A–12B); and Weil divisors on `X ≅` Divisor `F K`, matching degrees and principal divisors (12D). `X` is regular but need not be smooth over `F` when `F` is imperfect (Layer 12's 'regular, not smooth' convention, adopted here). What this target adds is the transport of the `K_2` data: the roadmap's tame symbol at `x`, formed with `ord_x` and `κ(x)`, is carried to the tame symbol at `P_x, N_{κ(x)/F} = N_{k(P_x)/F}`, and div `f` on `X` is Tau Ceti's Divisor.principal `f`; so the reciprocity product over `X^{(1)}` is the product over the places of K/F. (Weibel, V.6.12, Smooth Curves 6.12, p. 416; Weibel, III.6.3, p. 234.)

`X` is integral, proper (hence projective, Layer 12B), regular and of dimension one over `F`; no smoothness over `F` is assumed. The dictionary is AlgebraicCurves Layer 12's (12A, 12B, 12D), used as stated there.

**Checks.**

- For `X = ℙ¹_F` the places are those of the ratFuncEquiv, including `∞`.
- On an affine chart Spec `R` the comparison is the correspondence between the places finite on `R` and the height-one primes of `R`.
- The comparison is of discrete valuations together with their residue maps: equality of orders alone would not identify the residues of the tame symbols.
- Regular, not smooth: over `F = 𝔽_p(s), p` odd, the curve `y² = x^p − s` is regular at the closed point `y = 0, x^p = s` (its maximal ideal is generated by `y`) but not smooth there (both partial derivatives vanish), and its residue field `F(s^{1/p})` is purely inseparable over `F`.

*Needs:* §9.2; §9.3; Mathlib `AlgebraicGeometry.Scheme.ord`; Tau Ceti `TauCeti.Place.heightOneSpectrumEquiv`; Tau Ceti `TauCeti.Place.ratFuncEquiv`; Tau Ceti `TauCeti.Divisor.principal`; AlgebraicCurves Layer 12.

### 10.29 Suslin's reciprocity law: Weil reciprocity in every degree for a proper curve over any field

Let `F` be any field and `K` a function field of one variable over `F` (IsFunctionField `F K`), for instance the function field of a proper integral curve `C` over `F`. The places `P` of K/F are the closed points of the normalisation of `C`, which is the regular proper model of K/F (§10.28, importing AlgebraicCurves Layer 12); it is regular but need not be smooth over `F` when `F` is imperfect, and each residue field `k(P)` is a finite extension of `F`, possibly inseparable. For `x ∈ K^M_{n+1}(K)` the residue `∂_P(x)` vanishes at all but finitely many places `P`, and `Σ_P N_{k(P)/F} ∂_P(x) = 0` in `K^M_n(F)`, where `∂_P` is the higher residue of §9.11 and `N_{k(P)/F}` is Kato's Milnor norm (§10.24), defined for every finite extension, separable or not. This is Suslin's reciprocity law in all degrees; its degree-two form with the roadmap's tame symbol and field norms is §10.30. It is stated over places (equivalently over the closed points of the regular model), never over the points of a possibly singular `C` and never under a smoothness hypothesis. The downstream consumer MotivicEtaleKTheory (its M.4) uses it, with the norms of this layer, for the Nesterenko–Suslin/Totaro comparison of Milnor K-theory with the diagonal higher Chow groups. (Weibel, V.6.12.1, Weil Reciprocity Formula 6.12.1, p. 416; Weibel, V.6.12, the paragraph before 6.12.1, p. 416; Weibel, III.7.5.1, Weil Reciprocity Formula 7.5.1, p. 248; Weibel, III.7.6.1, Theorem 7.6.1, p. 249; Gille–Szamuely, Corollary 7.4.3 and Proposition 7.4.4, pp. 205–206; Stacks, Tags 032N, 032L and 032O.)

`F` is a field, of any characteristic and not necessarily perfect, and K/F is a function field of one variable; residues are normalised as in §9.11. The sum is over the places of K/F, the closed points of the regular proper model (the normalisation of any proper model); no smoothness over `F` is assumed, and the residue extensions `k(P)/F` may be inseparable.

**Checks.**

- For `K = F(t)` it is §10.10.
- In degree one `(n = 0)` it says that a principal divisor has degree zero, `Σ_P deg(P)·ord_P(f) = 0`, the Tau Ceti product formula `TauCeti.Divisor.degree_principal`.
- Inseparable residue fields occur and need Kato's norm: for `F = 𝔽_p(s)` and `K = F(s^{1/p})(t)`, every place of K/F has residue field containing `F(s^{1/p})`, purely inseparable of degree `p` over `F`, and in degree one `N_{F(s^{1/p})/F}(α) = α^p`.
- Only finitely many terms are nonzero.
- Downstream consumers: EllipticKTheory E.2 and EllipticRegulators use the degree-two form to construct and descend regulator classes; HigherLocalFields HL.6 uses the relation along a curve; MotivicEtaleKTheory M.4 uses it in every degree to kill the boundaries in the inverse of the diagonal cycle map (edge Layer `10 → M.4`).
- Mixed test: `k=F₃(s), K=k(s^(1/3))(u), t=u²`. `K/k(t)` has inseparable degree 3 and separable degree 2, hence total degree 6; normalization is `k(s^(1/3))[u]`, finite over k[t]. This test is neither a separable extension nor a purely inseparable extension.

*Needs:* §9.11; §9.13; §10.10; §10.24; §10.27; §10.28; Tau Ceti `TauCeti.Place.restrict`; Tau Ceti `TauCeti.Place.finite_setOf_restrict_eq`; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`; Tau Ceti `TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`; Tau Ceti `TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`; AlgebraicCurves Layer 2.

**Integral reduction to the rational line.** Choose a transcendental `t∈K`; `K/F(t)` is finite, and the integral-closure finiteness required by §10.27 is supplied by AlgebraicCurves Layer 2, including mixed inseparable/separable extensions. Apply that norm–residue formula to `x` at every place `q` of `F(t)/F`. Then apply `N_(κ(q)/F)`, sum over `q`, and use transitivity of the actual Kato norms. The right side becomes `Σ_P N_(κ(P)/F)∂_P x`, because every place `P` restricts to exactly one `q`. The left side is zero by integral rational-line reciprocity §10.10 applied to `N_(K/F(t))x`. Finite support justifies regrouping. This proves the integral result in every degree over any `F`. Suslin, §2, Theorem 2.6, p.597, uses the quotient-by-torsion convention introduced on p.594; that argument is not used as a proof of this integral target. The inputs here are Weibel III.7.5.1 and III.7.6.1, pp.248–249, and the integral norm–residue proof of §§10.26–10.27.

**Checks.**

- For `n=0` the equation is `Σ_P[κ(P):F]ord_P(f)=0`, the degree-zero principal-divisor formula.
- For `n=1` write the sum multiplicatively to obtain the product of residue-field norms of tame symbols equal to 1.
- Over an imperfect field use the regular normalization and possibly inseparable `κ(P)/F`; smoothness and separability are not added as hidden hypotheses.

*Needs:* §9.13; §10.10; §10.24; §10.27; §10.28; AlgebraicCurves Layer 2; AlgebraicCurves Layer 12.

### 10.30 Weil reciprocity for the tame symbol on a proper regular curve

Let `X` be a proper regular integral curve over `F` with function field `K`, and `f, g ∈ K^×`. Then `∂_x{f, g} = 1` for all but finitely many closed points `x`, and `∏_{x ∈ X^{(1)}} N_{k(x)/F}(∂_x{f, g}) = 1` in `F^×`, where `∂_x` is the roadmap's tame symbol (§9.2) at the discrete valuation of the local ring at `x` and `N` is the field norm. Equivalently, over the places `P` of K/F: `∏_P N_{k(P)/F}(∂_P{f, g}) = 1`. The disjoint-support case `f(div g) = g(div f)`, and its agreement with EllipticCurves Layer 2's milestone, is §10.31. (Weibel, V.6.12, the paragraph before 6.12.1, p. 416; Weibel, III.6.5.3, Weil Reciprocity Formula 6.5.3, p. 236.)

`X` is integral, proper and regular of dimension one over `F`; `f` and `g` are nonzero rational functions.

`Suggested.lean` states `weil_reciprocity_tameSymbol` over all places of the function field, using Tau Ceti’s residue norms and including finite support.

**Checks.**

- For `X = ℙ¹` it is Weil's formula `(f, g)_∞ · ∏_p N_p(f, g)_p = 1` of III.6.5.3.
- The sign `(−1)^{v(f)v(g)}` matters: on `ℙ¹` over `ℚ` with `f = t` and `g = t − 1` the factors are `−1` at 0, 1 at 1 and `−1` at `∞`, with product 1; dropping the sign changes the factor at `∞`, where `v(f)v(g) = 1`, and gives `−1`.
- Only finitely many factors differ from 1.
- Convention test over `ℚ` at `5: ∂{2,5} = 2` in `𝔽₅ˣ`. Its inverse 3 is the K-book convention, not the residue of this roadmap.

*Needs:* §9.2; §9.11; §10.7; §10.24; §10.28; §10.29; Mathlib `Algebra.norm_norm`; Tau Ceti `TauCeti.Place.normResidue`.

### 10.31 Disjoint supports: `f(div g) = g(div f)`, and EllipticCurves Layer 2's Weil reciprocity

Let `K` be a function field of one variable over `F` and `f, g ∈ K^×` whose principal divisors (Tau Ceti's Divisor.principal) have disjoint supports. At a place `P` in the support of div `g` one has `ord_P f = 0` and the roadmap's tame symbol is `∂_P{f, g} = f(P)^{ord_P g}`; at a place `P` in the support of div `f` it is `∂_P{f, g} = g(P)^{−ord_P f}`; elsewhere it is 1 (§9.2; the sign `(−1)^{ord_P f · ord_P g}` is 1 on both supports). Applying the residue-field norms `N_{k(P)/F}` and taking the product, §10.30 becomes `f(div g)·g(div f)^{−1} = 1`, that is `f(div g) = g(div f)` for Tau Ceti's evaluation Divisor.eval, whose local factors are the norms `N_{k(P)/F}(f(P))`. In particular, for an elliptic curve — a Weierstrass curve `W` over `F` with W.IsElliptic, `K = W.FunctionField`, a function field of one variable by WeierstrassCurve.Affine.isFunctionField — this is the milestone 'Weil reciprocity `f(div g) = g(div f)`' of EllipticCurves Layer 2, a prerequisite of its divisor construction of the Weil pairing: that milestone is the disjoint-support, degree-two special case of Layer 10's theorem, stated with the same evaluation and the same principal divisors, and the two must be stated compatibly. The general theorem, in every degree and for every function field of one variable, stays Layer 10's (§10.29); the elliptic statement is a special case, not a proof of reciprocity for other curves. In the K-book's normalisation every local factor is inverted (`∂^{Wb}_P{f, g} = f(P)^{−ord_P g}` on the support of `div g`) and the identity is unchanged. (Weibel, III.6.5.3, Weil Reciprocity Formula 6.5.3, p. 236.)

`Suggested.lean` states `weil_reciprocity_of_disjoint` on Tau Ceti's divisor evaluation and principal divisors.

K/F is a function field of one variable and `f, g ∈ K^×` have principal divisors with disjoint supports. For the elliptic instance, `W` is a Weierstrass curve over `F` with W.IsElliptic and `K = W.FunctionField`; its places and divisors are those of Tau Ceti's function-field library, on which EllipticCurves Layer 0 builds.

**Checks.**

- On `ℙ¹` over `ℚ` with `f = t` and `g = (t − 1)/(t − 2)`: `f(div g) = f(1)/f(2) = 1/2` and `g(div f) = g(0)/g(∞) = (1/2)/1 = 1/2`.
- On the elliptic curve `y² = x³ − x` over `ℚ`, `f = x/(x − 2)` and `g = (x − 3)/(x − 5)` have `div f = 2(0, 0) − P₂` and `div g = P₃ − P₅`, where `P_c` is the inert place `x = c` of degree two (residue fields `ℚ(√6), ℚ(√6), ℚ(√30)` for `c = 2, 3, 5`). Then `f(div g) = N(3)·N(5/3)^{−1} = 9·(9/25) = 81/25` and `g(div f) = (3/5)²·N(1/3)^{−1} = (9/25)·9 = 81/25`; without the residue-field norms the two sides would be 9/5 and 27/25.
- In the K-book's normalisation each local factor is inverted and the identity still holds.
- A special case, not the theorem: §10.29 is the statement in every degree for every function field of one variable, and this target does not replace it.

*Needs:* §9.2; §10.30; Tau Ceti `TauCeti.Divisor.eval`; Tau Ceti `TauCeti.Divisor.eval_eq_prod_normResidue`; Tau Ceti `TauCeti.Divisor.isUnitAtSupport_iff_disjoint`; Tau Ceti `TauCeti.Divisor.principal`; Tau Ceti `TauCeti.Place.normResidue`; Tau Ceti `WeierstrassCurve.Affine.isFunctionField`; EllipticCurves Layer 2.

**Tame products and divisor evaluation use the curve interfaces.** For a proper regular curve with function field K/F and `f,g∈Kˣ`, the product over closed points of `N_(κ(P)/F)((−1)^(a_P b_P)res_P(f^(b_P)g^(−a_P)))` equals 1, where `a_P=ord_P f` and `b_P=ord_P g`. If principal divisors are disjoint this identity is (Divisor.principal hF g).eval `f=(Divisor.principal hF f).eval g`. On an elliptic Weierstrass function field this is exactly EllipticCurves Layer2’s milestone, using its divisor evaluation. (Weibel, III.7.3, III.7.5.1, pp. 246, 248.)

**Checks.**

- For `f=t,g=t−2` over `ℚ`, the factors at `0,2,∞` are `−1/2,2,−1`, with product 1.
- For `f=t/(t−1),g=(t−2)/(t−3)`, disjoint divisors give both evaluations 4/3.
- At the 5-adic place, `∂{5,2}=3∈𝔽₅ˣ`; the opposite convention gives 2, so the sign/inversion choice is observable.

*Needs:* §10.7; §10.28; §10.29; EllipticCurves Layer 2; Tau Ceti `TauCeti.Divisor.eval_eq_prod_normResidue`; Tau Ceti `TauCeti.Divisor.isUnitAtSupport_iff_disjoint`; Tau Ceti `TauCeti.Divisor.eval`; Tau Ceti `TauCeti.Divisor.principal`; Tau Ceti `TauCeti.Place.normResidue`; Tau Ceti `TauCeti.Place.normResidueOrOne`; Tau Ceti `TauCeti.Place.degree`.

### 10.32 Bass-Tate calculation for number fields

For a number field `F` with r1 real embeddings and `n >= 3, K_n^M(F)` is `(Z/2)^r1` via the symbols at its real places. (Bass–Tate, Chapter II, Theorem 2.1(3), p.396, with proof pp.397–402 and the arithmetic inputs of §§1, 3–5, pp.393–395, 403–427; Weibel, III.7.2(d), p.246.)

`F` is a number field. `n >= 3`.

`Suggested.lean` states `MilnorK.numberField_realSign_equiv`, normalized on symbols by the signs at every real embedding.

For the proof, first obtain finite generation from the finite-exceptional-prime filtration of Chapter II, Theorem 1.1 and Corollary 1.2: the residue targets vanish in degrees at least two over finite fields. For each odd prime ℓ, adjoining roots of unity through an extension of degree prime to ℓ and applying the projection formula makes restriction injective modulo ℓ. The local/global degree-two symbol pairing and the idele pairing of §§3–5 then kill every triple symbol modulo ℓ. In characteristic zero the same argument at two leaves precisely the real sign classes. Weak approximation supplies elements with one chosen negative real signature, and their repeated symbols give a section of the real-sign map with order-two image. Finite generation and the absence of all other primary quotients show that this section exhausts the group. The higher-degree statement follows by multiplying symbols, with the sign classes retained. Each step is needed: a sign detector alone does not prove surjectivity onto all of `K⁽ᴹ⁾_n(F)`.

**Checks.**

- For `F=ℚ` and `n=3` the answer is `ℤ/2`, detected by `{−1,−1,−1}`.
- For a totally imaginary number field it is zero for every `n≥3`.
- Degree two is excluded: `K₂(ℚ)` has nontrivial residues at infinitely many finite primes.

*Needs:* §5.4; §5.12; §5.15; §§10.6–10.9; §10.24; ClassFieldTheory Layers 5–6 and 10–14 (local/global symbol pairing and reciprocity); Mathlib `NumberField.InfinitePlace.nrRealPlaces`.

### 10.32a Local function-field norm-residue symbols

Let `K` be a finite extension of `𝔽_q((t))`, let `ℓ` be a prime different from `char K`, and fix a primitive `ℓ`th root `ζ∈K`. Use Mathlib `BrauerGroup K` with Tau Ceti's commutative-group structure, ClassFieldTheory Layer 5's cohomological Brauer group and `invMap`, and ClassicalArithmeticCompletion §1.14's local symbol in their equal-characteristic prime-to-characteristic scope. Define `[a,b]_K=normResidueSymbol b a`. The supplied pairing is bimultiplicative and Steinberg, perfect on `Kˣ/Kˣℓ`, with `[a,b]_K=1` exactly when `b` is a norm from `K(a^{1/ℓ})`. Construct the cyclic algebra `(a,b)_ζ` with `X^ℓ=a, Y^ℓ=b, YX=ζXY` and its class in `BrauerGroup K`. Reuse `TauCeti.brauerCohomologyEquiv` and its crossed-product evaluation and uniqueness theorems, followed by the inverse explicit/canonical H² comparison and `TauCeti.ClassFieldTheory.unitsRepH2Equiv`. Extend the crossed-product API from `F : Type` to `F : Type u`, retaining those evaluation equations. Prove naturality under field embeddings, including completion, and compatibility with splitting fields on this same comparison; multiplication already becomes addition under the supplied equivalences.

The model transport `cohomologicalBrauerToBr`, the composite `algebraicBrauerToBr` and its evaluation theorem `algebraicBrauerToBr_galoisCocycle` reuse the pinned API for fields in `Type`. The milestone `algebraicBrauer_equiv_cohomologicalBrauer` extends this comparison to every field in `Type u`. These names occur in `Suggested.lean`; the cyclic-algebra normalization below uses the comparison characterized by the supplied crossed-product evaluation, rather than an arbitrary group equivalence.

Prove that its image has invariant `j/ℓ` exactly when `[a,b]_K=ζ^j`. This fixes the algebra and symbol order. Use §9.17’s rigidity and §5.12’s finite-field vanishing to identify `K₂ᴹ(K)/ℓ` with `κˣ/κˣℓ`, where `κ` is the residue field of cardinality `Q`. Raising a residue class to `(Q−1)/ℓ` and inverting reduction `μ_ℓ(K)≃μ_ℓ(κ)` identifies this quotient with `μ_ℓ(K)`. Deduce `K₂ᴹ(K)/ℓ≃μ_ℓ` and the residue-unit formula `[u,π]_K=ū^((Q−1)/ℓ)` in the residue field of cardinality `Q`. (Bass–Tate, Chapter II, proof of Theorem 2.1(3), p.399; Weibel, III.6.2.4, pp.233–234; Milne, *Class Field Theory*, IV §3, Theorem 3.14 and Corollary 3.16, pp.137–138; Gille–Szamuely, §4.4, for the supplied Brauer comparison.)

**Checks.**

- The comparison sends each crossed-product class to its inflated cocycle class, sends the split matrix class to zero, and commutes with extension to a completion; a bare equivalence of groups does not fix the cyclic-algebra invariant.
- Named milestone `localFunctionFieldSymbol_F7_order`: for `K=𝔽₇((t)), ℓ=3, ζ=2`, `[2,t]=4` and `[t,2]=2`. The corresponding cyclic-algebra invariants are `2/3` and `1/3`.
- Named milestone `localFunctionFieldSymbol_F7_units`: `[2,6]=1` while `[2,t]≠1`. Thus the pairing distinguishes a unit from a uniformizer.
- Named milestone `localFunctionFieldSymbol_F7_norm`: the unramified cubic `K(∛2)/K` has no element of norm `t`, since norm valuations are divisible by three. Its scalar `t` has norm `t³`, matching `[2,t]≠1` and `[2,t³]=1`.

*Needs:* §§5.2, 5.7, 5.12; §§9.2, 9.17; ClassFieldTheory Layer 5 (`Br`, `invMap`); ClassicalArithmeticCompletion §1.14 (`normResidueSymbol`, tame formula and norm criterion); LocalFieldsRamification Layer 1; Tau Ceti `TauCeti.BrauerGroup.instCommGroup`, `TauCeti.brauerCohomologyEquiv`, `TauCeti.brauerCohomologyEquiv_crossedProductClass`, `TauCeti.brauerCohomologyEquiv_unique`, `TauCeti.ContCohomology.explicitH2AddEquivContinuousCohomology`, `TauCeti.ClassFieldTheory.unitsRepH2Equiv`; Mathlib `Algebra.norm`; Mathlib `rootsOfUnity`. The universe extension, field-map compatibility, cyclic-algebra realization and its symbol-normalization equations are targets here.

### 10.32b Global function-field pairings and reciprocity

Let `F` be a finite extension of `𝔽_q(t)`, and `ℓ≠char F` a prime with a fixed primitive root `ζ∈F`. Construct its idele group `J_F=∏′_v F_vˣ` relative to the valuation-unit groups, and the pairing `Fˣ/Fˣℓ × J_F/J_F^ℓ→μ_ℓ`, `(a,(b_v))↦∏_v[a,b_v]_v`, using §10.32a’s local symbol and cyclic-algebra normalization. Prove finite support, the diagonal product formula, and the annihilator identity: an idele orthogonal to every `a∈Fˣ` lies in `FˣJ_F^ℓ`. Include weak approximation and the Kummer local-global test used after a finite extension: an element that is an `ℓ`th power in every completion is an `ℓ`th power in the global field. Use §10.32a’s comparison, with its field-map compatibility, for the global cyclic-algebra symbol. Prove the injective local-global Brauer invariant map has image the finite-support families of sum zero. These global function-field inputs are targets here. (Bass–Tate, Chapter II, proof of Theorem 2.1(3), pp.399–401, sequences (3)–(4) and the idele-annihilator argument; the latter cites Weil, *Basic Number Theory*, XIII §5, Proposition 8.)

**Global function-field degree-two norm-residue equivalence** (`globalFunctionFieldNormResidueEquiv`). Under these hypotheses construct the additive equivalence `h_(F,ℓ,ζ):K₂ᴹ(F)/ℓ≃Br(F)[ℓ]`, sending `{a,b}` to the image of `(a,b)_ζ`, with `YX=ζXY`. The Brauer carrier is the supplied cohomological one, using §10.32a’s characterized algebraic comparison. Prove `brRes_v ∘ h_F = h_(F_v) ∘ res_v` for every completion. Here the local `h_(F_v)` is the isomorphism of §10.32a followed by `ζ^j↦inv_v⁻¹(j/ℓ)`. (Tate, *Relations between K₂ and Galois cohomology*, 1976, pp.257–274; Milne, *The Work of John Tate*, §7.2, p.51, equations (33)–(34); Bass, *K₂ des corps globaux*, §9, Theorem 9, pp.249–250; Weibel, III.6.9.2–6.10.4, pp.241–243.)

The Tate/Bass–Tate proof stage has the following intermediate targets on these groups.

- Construct the Kummer description of this particular cyclic-algebra map: take the cup product of the Kummer classes in the order `a,b` and identify `μ_ℓ⊗μ_ℓ` with `μ_ℓ` by `ζ^i⊗ζ^j↦ζ^(ij)`. Prove the cyclic relative-Brauer description `ker(Br(F)→Br(F(a^(1/ℓ))))≃Fˣ/N(F(a^(1/ℓ))ˣ)` when `a` is not an `ℓ`th power, where `a^(1/ℓ)` denotes a chosen `ℓ`th root and the class of `b` maps to `(a,b)_ζ`. Prove restriction and corestriction compatibility with the Milnor restriction and norm of §§10.7–10.9, with the projection and degree identities of those sections. These are the degree-two Kummer and cyclic-descent inputs here, using ClassFieldTheory Layer 5’s Kummer and cyclic-cohomology APIs.
- Prove the global injectivity assertion `globalFunctionFieldNormResidue_injective`: if the cyclic-algebra class of `x∈K₂ᴹ(F)` is zero, then `x∈ℓK₂ᴹ(F)`. This is the injectivity part of Tate’s global-field symbol theorem, on §7.2’s Matsumoto identification, using its Kummer/transfer argument and the preceding cyclic-descent inputs; it is a separate theorem target here. Neither the idele-annihilator assertion nor an equivalence between two Brauer carriers substitutes for it. The source is Milne §7.2, equation (34), Bass §9, Theorem 9, and Tate 1976; no arbitrary-field norm-residue theorem is an input.
- Prove global cyclic realization `globalFunctionFieldNormResidue_surjective`: every `β∈Br(F)[ℓ]` is represented by `(a,b)_ζ`. For nonzero `β`, weak approximation chooses `a` nontrivial in `F_vˣ/F_vˣℓ` at every place in its finite invariant support. The cyclic extension `F(a^(1/ℓ))/F` has local degree `ℓ` there; restriction multiplies those local invariants by `ℓ` and kills `β` by Brauer injectivity. The cyclic relative-Brauer description then supplies `b`. Combine this with the independent injectivity assertion and the field-map compatibility to obtain `h_F`.

**Checks.**

- For `F=𝔽₇(t), ℓ=3, ζ=2`, `h_F({2,t})` has invariant `2/3` at zero and `1/3` at infinity, so `{2,t}` is nonzero modulo three. Swapping the entries negates the class.
- If all local images of `x∈K₂ᴹ(F)` vanish modulo `ℓ`, Brauer injectivity first gives `h_F(x)=0`; `globalFunctionFieldNormResidue_injective` then gives `x∈ℓK₂ᴹ(F)`.
- A Brauer class with invariants `1/3` at zero and `2/3` at infinity over `𝔽₇(t)` is realized by `{t,2}`. A lone invariant `1/3` has nonzero sum and admits no global preimage.
- The prime `ℓ=char F` is excluded; neither the Kummer construction nor the tame local isomorphism is asserted there.

*Needs:* §§5.2, 5.7, 7.2; §§10.7–10.9; §10.32a (the characterized Brauer comparison, completion compatibility and local isomorphisms); ClassFieldTheory Layer 5 (Kummer classes, cup products, cyclic cohomology, `brRes`, `brCor`, local invariants); the weak approximation and Brauer local-global targets of this subsection. The global injectivity theorem and cyclic realization are targets of this subsection.

**Milnor local-global exact sequence** (`globalFunctionFieldMilnor_exact`). For the same `F,ℓ,ζ`, prove `0→K₂ᴹ(F)/ℓ→⊕_v K₂ᴹ(F_v)/ℓ→μ_ℓ→0`. The first arrow is completion and the last arrow takes the product of the local symbols. Transport Brauer exactness only after `globalFunctionFieldNormResidueEquiv`: global injectivity gives injectivity of the first arrow, and global surjectivity realizes every family of total invariant zero. The identification `(1/ℓ)ℤ/ℤ≃μ_ℓ`, `j/ℓ↦ζ^j`, fixes the final map. (Bass–Tate, Chapter II, proof of Theorem 2.1(3), pp.399–401, sequences (3)–(4); Milne, *The Work of John Tate*, §7.2, p.51, equations (33)–(34).)

**Checks.**

- Named milestone `globalFunctionFieldSymbol_F7_places`: for `F=𝔽₇(t), ℓ=3, ζ=2`, the symbol `[2,t]` is 4 at zero, 2 at infinity and 1 elsewhere, with product 1.
- Named milestone `globalFunctionFieldSymbol_F7_idele`: the idele equal to `t` at zero and 1 elsewhere pairs with constant 2 to 4 and lies outside `FˣJ_F³`.
- Named milestone `globalFunctionFieldBrauer_F7_invariants`: a single local invariant `1/3` cannot come from a global Brauer class, whereas the family `1/3` at zero and `2/3` at infinity is represented by `(t,2)_ζ` with `ζ=2`.

*Needs:* §10.32a; `globalFunctionFieldNormResidueEquiv` and the Brauer local-global theorem of this subsection; ClassFieldTheory Layer 5 (`invMap` at the completions); ClassicalArithmeticCompletion §1.14 (local symbols); §§10.7–10.9; AlgebraicCurves Layers 2 and 12; Mathlib `RestrictedProduct`.

### 10.32c Function-field finiteness and the characteristic prime

For every global function field `F/𝔽_q(t)`, enumerate the places `v_i` in increasing residue cardinality, put `S_m={v₁,…,v_m}`, and let `U_m` be the graded subring of Milnor K-theory generated by S-unit classes. Prove Bass–Tate's finite-exceptional-place filtration: for all sufficiently large `m` and every `n≥1`, the residue induces an additive isomorphism `(U_{m+1})_n/(U_m)_n≃K⁽M⁾_{n−1}(κ(v_{m+1}))`. The quotient is of additive groups, not a quotient ring. Prove finite generation of each positive-degree kernel of all finite-place residues, using finite generation of the units of the ring of S-integers for nonempty finite `S` (from the divisor lattice and finiteness of the degree-zero divisor class group over the finite constant field). Thus `Kₙᴹ(F)` is finitely generated for `n≥3`. Prove `[F:Fᵖ]=p` for `p=char F`, using a separating transcendence basis over the perfect constant field, and the Bass–Tate norm argument giving p-divisibility of `Kₙᴹ(F)` for `n≥2`. These arithmetic and field-theoretic inputs are constructed here with the stated finite-generation hypotheses. (Bass–Tate, Chapter II, Theorem 1.1 and Corollary 1.2, pp.394–395, Theorem 3.1, p.403, and proof §§3–5, pp.403–427; Chapter I, Proposition 5.13 and its proof, pp.391–392.)

**Checks.**

- For `F=𝔽_q(t)`, a nonempty finite `S` gives S-unit rank `|S|−1`.
- `K₂ᴹ(F)` is not asserted finitely generated: the residue groups in degree one do not vanish.
- `[F:Fᵖ]=p` is asserted for global function fields; an arbitrary algebraic extension of `𝔽_q(t)` can be perfect and is handled in §10.33 by finite tuples instead.

*Needs:* §§5.4, 5.12; §§10.5–10.9, 10.24; AlgebraicCurves Layers 2 and 12; Mathlib `Algebra.norm`.

### 10.33 Bass-Tate vanishing over positive-characteristic global fields

If `F` has transcendence degree one over a finite field and `n >= 3, K_n^M(F)=0`. (Bass–Tate, Chapter II, Theorem 2.1(3), p.396, proof pp.397–402, using §§1, 3–5; Weibel, III.7.2(a), p.245.)

`F` has transcendence degree one over a finite field. `n >= 3`.

`Suggested.lean` states `MilnorK.transcendenceDegreeOne_vanishing` for every such field, without a finite-generation hypothesis.

Use the published positive-characteristic case of Bass–Tate, Chapter II, Theorem 2.1(3), for global function fields. Its proof uses the finiteness and characteristic-prime inputs of §10.32c and the prime-to-characteristic local/global pairings and reciprocity of §§10.32a–10.32b. The global pairing, the normalized cyclic-algebra adapter, `globalFunctionFieldNormResidueEquiv` and `globalFunctionFieldMilnor_exact` are targets here; the local invariant and symbol are supplied as in §10.32a. The symbol-pairing argument is in Bass–Tate, Chapter II, pp.399–401, while §§3–5 prove the finiteness theorem. ClassFieldTheory’s number-field reciprocity contract in §10.32 does not supply them. For a field of transcendence degree one that is not finitely generated, each finite tuple of symbol entries lies in a global function subfield: adjoining one transcendental element to the finite ground field makes the remaining finitely many entries algebraic, hence gives a finite extension of a rational function field. Functoriality then gives the stated vanishing for the entire field.

**Checks.**

- `K⁽ᴹ⁾₃(𝔽₂(t))=0`, including characteristic two.
- The argument does not kill `K⁽ᴹ⁾₂(𝔽_q(t))`; its residue at an irreducible polynomial may be nontrivial.
- An arbitrary algebraic extension of `𝔽_q(t)` is covered by the finite-tuple argument.

*Needs:* §5.4 and its field-map API; §§10.32a–10.32c; §10.24; Bass–Tate, Chapter II, Theorem 2.1(3), p.396 (the global function-field case).

### Examples

- For `e₁ ≠ e₂` monic of degree `d` and `h = e₁ − e₂, {e₁, e₂} = {h, e₂} − {h, e₁} + {e₁, −1}`; this corrects the sign in Weibel Ex. III.6.2.
- For `E = ℚ((s))` over `F = ℚ((t))` with `s² = t: N(s) = −t` and `N(2) = 4`, so the residue of `N(2)` is `2^e` with `e = 2`.
- For `α² + tα + a` over `𝔽₂(a)((t))`, the residue extension is purely inseparable of degree 2 and `N(α) = a = N_{l/k}(√a)`: norms cannot be computed from distinct residue embeddings.

### Dependencies

Layers 5, 7 and 9; AlgebraicCurves Layers 2 and 12; EllipticCurves Layer 2; Tau Ceti `Place` and `Divisor`; Mathlib `Algebra.norm` and `spectralNorm`; GeneralAlgebraicKTheory §7.7; LocalFieldsRamification Layer 0; ClassFieldTheory Layers 5–6 and 10–14 for §10.32; Bass–Tate, Chapter II, Theorem 2.1(3), for §10.33.

## Layer 11: the localization comparison

The tame symbol is the boundary of the localization sequence of a discrete valuation ring, up to the sign fixed in §11.1; for a Dedekind domain the boundary is the tame symbol at each prime. In every degree the product map from Milnor K-theory intertwines the higher residues with the signed boundary, the total residue is a homomorphism into the direct sum, and the two specialisations are compared. Quillen transfers satisfy the norm–residue square and agree with Milnor norms on `K₂`; the degree-two comparison square records the inversion explicitly.

### 11.1 Identification with the boundary of the localisation sequence

Let `R` be a discrete valuation ring with fraction field `F`, residue field `k` and uniformiser `π`, and let `∂ : K_2(F) → K_1(k) = k^×` be the boundary of the localisation sequence `⋯ → K_2(R) → K_2(F) → K_1(k) → K_1(R) → K_1(F) → K_0(k) → ⋯` (GeneralAlgebraicKTheory Layers 4 and 8: localisation for the torsion modules, dévissage, resolution). With the K-book's normalisation — `∂` right `K_*(R)-linear, ∂(x·y) = ∂(x)·ȳ` for `y ∈ K_*(R)` (GeneralAlgebraicKTheory §8.13 `localizationBoundary_product`, on GeneralAlgebraicKTheory Layer 7's products), and `∂[π] = [R/πR] = 1 ∈ K_0(k)` — one has, on symbols (through `K^M_2(F) → K_2(F)`), `∂{f,g} = tameSymbol v g f = (tameSymbol v f g)^{−1}`: the boundary is the K-book's tame symbol of Lemma III.6.3, the inverse of this roadmap's. With the left-linear normalisation `∂(y·x) = ȳ·∂(x)` instead, `∂{f,g} = tameSymbol v f g`. Both are stated and the sign is fixed here, not in the symbol formula. It builds no localisation sequence; the downstream consumers SchemeKTheoryOperations and EllipticKTheory use this comparison, and §11.2 extends it to a Dedekind domain, prime by prime. (Weibel, V.6.6.1, p. 409; Weibel, V.6.6.1, proof, p. 409; Weibel, Example V.6.1.2, p. 406.)

`R` is a discrete valuation ring with fraction field `F`, residue field `k`, uniformiser `π` and valuation `v`. The localisation sequence and the `K_*(R)-module` structure of its terms are those of GeneralAlgebraicKTheory Layers 4 and 8 and GeneralAlgebraicKTheory Layer 7, with the side of the action fixed.

**Checks.**

- With the K-book's normalisation, on `ℤ_(5) ⊂ ℚ: ∂{5, 2} = 2` whereas `tameSymbol 5 2 = 3`; `∂{2, 5} = 3`.
- `∂{π, π} = −1` in both normalisations.
- Degree one: `∂[f] = ord_v(f)·[k]`, the valuation; this normalisation is GeneralAlgebraicKTheory Layers 4 and 8’s ring boundary contract.
- No second localisation sequence is built.
- The degree-one input is the GeneralAlgebraicKTheory Layers 4 and 8 ring cone/cokernel boundary (GeneralAlgebraicKTheory §8.11 and GeneralAlgebraicKTheory §8.12 `localizationBoundary_DVR_valuation`); the RIGHT module action is GeneralAlgebraicKTheory §8.13 `localizationBoundary_product` on GeneralAlgebraicKTheory Layer 7's products. Neither input comes from SchemeKTheoryOperations, which is a downstream consumer.

*Needs:* §7.2; §8.2; §9.5; GeneralAlgebraicKTheory §8.12; GeneralAlgebraicKTheory §§8.11–8.12; GeneralAlgebraicKTheory §8.13; GeneralAlgebraicKTheory Layer 7.

### 11.2 The localisation theorem for `K₂` of a Dedekind domain: the boundary is the tame symbol at each prime

Let `R` be a Dedekind domain with fraction field `F` and, for each nonzero prime `𝔭`, residue field `k(𝔭) = R/𝔭` and valuation `v_𝔭`. The finitely generated torsion R-modules form a Serre subcategory of the finitely generated R-modules with quotient the finite-dimensional F-vector spaces; Quillen's localisation theorem, dévissage `(K_*(torsion modules) ≅ ⊕_𝔭 K_*(k(𝔭)))` and resolution `(R and F are regular)` give the exact sequence `⊕_𝔭 K_2(k(𝔭)) → K_2(R) → K_2(F) −∂→ ⊕_𝔭 K_1(k(𝔭)) → K_1(R) → K_1(F)`, whose maps out of the residue-field terms are the transfers along `R → k(𝔭)`. The `𝔭-component` of `∂` is the boundary of the discrete valuation ring `R_𝔭`, so on symbols (through the product-normalized Matsumoto comparison of §8.3) `∂{f, g} = (tameSymbol v_𝔭 g f)_𝔭 = ((tameSymbol v_𝔭 f g)^{−1})_𝔭` in the K-book's right `K_*(R)-linear` normalisation, and `(tameSymbol v_𝔭 f g)_𝔭` in the left-linear one (§11.1); the values lie in the direct sum by §9.13. Hence `ker ∂` is the image of `K_2(R)` and `coker ∂ ≅ ker(K_1(R) → K_1(F))`. This is the K-book's Localization Theorem III.6.5, proved in V.6.6: the degree-two boundary comparison used in Layer 12. It builds no sequence beyond GeneralAlgebraicKTheory Layers 4 and 8's. (Weibel, III.6.5, Localization Theorem 6.5, p. 236; Weibel, V.6.6; Weibel, V.6.6.1 and the claim after it; Weibel, V.6.1, p. 406.)

`R` is a Dedekind domain with fraction field `F`; `𝔭` runs over the nonzero primes of `R`. Localisation, dévissage, resolution and transfers are GeneralAlgebraicKTheory Layers 4 and 8's; the `K_*(R)-module` structure used in the discrete-valuation-ring comparison is GeneralAlgebraicKTheory Layer 7's (through §11.1). The sign is the one fixed in §11.1; kernels and cokernels do not depend on it.

**Checks.**

- For `R = ℤ` the segment is `⊕_p K_2(𝔽_p) → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → K_1(ℤ) → K_1(ℚ)`; in the K-book's normalisation `∂{5, 2}` has 5-component 2, where Layers 9–11's `tameSymbol` gives 3.
- For a discrete valuation ring (one prime) it is the degree-two part of the sequence in §11.1.
- `coker ∂` is not zero in general: for the Dedekind domain `ℝ[x, y]/(x² + y² − 1)` it is the nonzero `SK_1` of K-book Example III.1.5.4, although every tame symbol is onto.
- No second localisation sequence is built: the all-degree Dedekind sequence of the downstream consumer ArithmeticKTheory (its N.2) restricts in degrees at most two to this one.

*Needs:* §4.1; §9.13; §11.1; GeneralAlgebraicKTheory §4.14; GeneralAlgebraicKTheory §4.8; GeneralAlgebraicKTheory §4.6; GeneralAlgebraicKTheory §7.7; Mathlib `IsDedekindDomain.HeightOneSpectrum`; GeneralAlgebraicKTheory Layers 4, 7 and 8.

### 11.3 The product map intertwines higher residues with the signed localization boundary

Let `R` be a discrete valuation ring with fraction field `F`, residue field `k` and parameter `π`. Write `r_v,n : K⁽ᴹ⁾_n(F) → K⁽ᴹ⁾_(n−1)(k)` for §9.11 with the parameter LAST; `Φ_n` for §8.2, defined by the ordered product of unit classes; and `D_n : K_n(F) → K_(n−1)(k)` for the actual GeneralAlgebraicKTheory Layers 4 and 8 localization connecting map with `D₁[π]=1` and the RIGHT module convention. For every `n≥1, D_n ∘ Φ_n = (−1)^(n−1) Φ_(n−1) ∘ r_v,n`. Thus `δ_n=(−1)^(n−1)D_n` satisfies `δ_nΦ_n=Φ_(n−1)r_v,n`. In degree two `Φ₂=θ₂♮m` is the product-normalized Matsumoto equivalence, and `D₂Φ₂{f,g}=t_v(f,g)⁻¹`, whereas `δ₂Φ₂=t_v`. If `θ₂♮(z)=θ₂(εz)` for the globally fixed torus sign `ε∈{±1}`, then `D₂θ₂m=−εr_v,2` in additive residue notation, or `t_v^(−ε)` multiplicatively. No value of `ε` is assumed and no higher `Φ_n` is asserted invertible. (Weibel, III.7.3, V.6.6.1, Exercise V.5.3, pp. 246, 405, 409.)

`R` is a commutative DVR; `F` is its fraction field and `k` its residue field. No completeness, finite residue field, coefficient field or characteristic restriction is assumed. GeneralAlgebraicKTheory Layers 4 and 8 supplies the torsion-module localization sequence, dévissage and resolution, and its right product boundary law. `Φ₀` identifies the integer class with rank, and `Φ₁` takes a unit to its `K₁` class. The comparison `θ₂♮`, rather than an unspecified classical-to-Quillen isomorphism, is the one fixed by §8.3.

**Checks.**

- At `ℚ` with the 5-adic valuation: `t₅(2,5)=2, D₂Φ₂{2,5}=3`; `t₅(5,2)=3, D₂Φ₂{5,2}=2`; `D₂Φ₂{5,5}=4` in `𝔽₅ˣ`. These distinguish inversion from the identity.
- `D₁Φ₁{π}=1`. For `k=ℚ(t), R=k[[π]]` and `x={2,t,π}, D₃Φ₃(x)=Φ₂{2,t}`. The t-adic boundary of the right side is `1/2∈ℚˣ`, while that of its negative is 2. This detects the positive degree-three sign; a finite-field `K₂` target cannot do so.
- All-unit symbols have zero boundary. `δ₂` and `D₂` have the same kernel and inverse values, but their map equality is never asserted.
- Transport through `θ₂` carries `ε` explicitly. A finite-field `K₂=0` test cannot determine that sign.

*Needs:* §5.10; §8.1; §8.2; §8.3; §9.11; §11.1; GeneralAlgebraicKTheory §8.12; GeneralAlgebraicKTheory §8.13; GeneralAlgebraicKTheory §7.4; GeneralAlgebraicKTheory Layers 4, 7 and 8; GeneralAlgebraicKTheory Layer 7.

### 11.4 Package the finite-support family as a total Milnor residue homomorphism

Let `V` be an indexed family of normalized discrete valuations on a field `F` of finite character: for each `a∈Fˣ` only finitely many `v∈V` have `ord_v(a)≠0`. For `n≥1` construct `MilnorK.globalResidueHom(V,n) : K⁽ᴹ⁾_n(F) → ⨁_(v∈V) K⁽ᴹ⁾_(n−1)(k_v)`, the unique additive homomorphism with v-coordinate `r_v,n`. The direct sum is the dependent DirectSum, using `Additive k_vˣ` in degree one. It is not the direct sum of the individual homomorphisms: each input has finite support, while infinitely many component homomorphisms may be nonzero. For a Dedekind domain `R` with `F=Frac(R)` and `V` its nonzero primes, the total Quillen boundary satisfies `D⁽ᴿ⁾_n Φ_n = (−1)^(n−1)(⨁_v Φ_(n−1)) globalResidueHom(V,n)`. In particular degree two transports the Dedekind sequence of §11.3 through `Φ₂` and coordinatewise negation/inversion. (Weibel, III.6.5, III.7.4, V.6.6–6.6.1, pp. 236, 247, 409.)

`n≥1, V` is a set-indexed family with the explicit finite-character property, and every residue field is the residue field of its valuation ring. The global Quillen comparison clause uses the height-one-prime family of a Dedekind domain and its actual localization sequence. No full Quillen boundary into a direct sum is postulated for an arbitrary family of DVRs.

Provide the following API.

- `MilnorK.globalResidueHom`: The additive homomorphism to the dependent residue direct sum, constructed with the finite-support proof for each input.
- `MilnorK.globalResidueHom_apply`: For every `v` and `x`, the v-coordinate of `globalResidueHom(V,n)(x)` is `r_v,n(x)`.
- `MilnorK.globalResidueHom_unique`: A homomorphism to this direct sum with all the same residue coordinates equals `globalResidueHom(V,n)`.
- `MilnorK.globalResidueHom_support_subset`: For any finite symbol expression for `x`, the support of `globalResidueHom(V,n)(x)` is contained in the union of the nonzero-order supports of all its entries; equality is not asserted.
- `MilnorK.globalResidueHom_eq_zero_iff`: `globalResidueHom(V,n)(x)=0` iff `r_v,n(x)=0` for every `v`. Thus its kernel is the intersection of the individual residue kernels.
- `MilnorK.globalResidueHom_degree_one`: At `n=1` the coordinates are `ord_v(a)`; for Dedekind primes and for function-field places, compare to the principal divisor by coefficient extensionality.
- `MilnorK.globalResidueHom_degree_two`: At `n=2` its coordinates in `k_vˣ` are `t_v(f,g)`, with addition on `Additive k_vˣ` interpreted multiplicatively.
- `MilnorK.globalResidueHom_quillen`: For a Dedekind `R, D⁽ᴿ⁾_n Φ_n=(−1)^(n−1)DirectSum.map(Φ_(n−1)) globalResidueHom(V,n)`. This compares actual maps, not only groups.
- `MilnorK.globalResidueHom_reindex`: Relabeling `V` by an equivalence, and transporting its valuations and residue fields along that equivalence, reindexes the output. No unrestricted field-extension naturality is claimed.

**Checks.**

- For `V` empty the codomain is trivial and every input maps to zero. For `x=0` all coordinates are zero for any `V`.
- For `F=ℚ` and `V` the rational primes, `globalResidueHom(V,1){25/2}` has coefficient `−1` at 2, coefficient 2 at 5, and zero elsewhere. These are the coefficients of the principal divisor of 25/2; degree zero of each residue group is `ℤ`, not a residue-field unit group.
- For `F=ℚ` and `V` the rational primes, `globalResidueHom(V,2){2,5}` has only its 5-coordinate nontrivial, with value `2∈𝔽₅ˣ`. The coordinate at 2 is 1 because `𝔽₂ˣ` is trivial. The Quillen-boundary coordinate is 3 at 5.
- For the same family, `{2,−1}={2,1−2}` maps to zero at every prime. Its entries have a nonzero-order support at 2, so the support bound can be strict.
- For `ℚ` at the prime `5, {5,2}` has coordinate 3 and `{5,5}` has coordinate 4. Adding a symbol to its additive inverse yields the zero direct-sum element.
- For `k=ℚ(t), F=k((π))` and `V` the singleton `π-adic` family, `globalResidueHom(V,3){2,t,π}` has coordinate `{2,t}∈K⁽ᴹ⁾₂(k)`. Its image under `Φ₂` has t-adic Quillen boundary `1/2∈ℚˣ`. The actual `D₃` has the positive coordinate `Φ₂{2,t}`; negating it would give t-adic boundary 2.
- For `V=ℕ` with every indexed valuation the same 5-adic valuation on `ℚ, {2,5}` has the nontrivial coordinate 2 at every index. Finite character fails, so this input cannot be sent to a dependent direct sum by these coordinates.

*Needs:* §9.13; §11.2; §11.3; Mathlib `DirectSum.mk`; Mathlib `DirectSum.ext`; Mathlib `DirectSum.map`; Mathlib `DirectSum.map_apply`; Mathlib `IsDedekindDomain.HeightOneSpectrum.Support.finite`; Tau Ceti `TauCeti.Place.finite_setOf_ord_ne_zero`; GeneralAlgebraicKTheory Layers 4, 7 and 8.

### 11.5 Compare unit-part specialization with the two Quillen product specializations

With `R,F,k,π,Φ,D` and `r` as in §11.3, let `λ_π,n` be the Milnor unit-part specialization of §9.11 and `n≥1`. Then `λ_π,n(x)=r_v,n+1(x·{−π})` and `Φ_n(λ_π,n(x))=(−1)^n D_(n+1)(Φ_n(x)·[−π])`. For the K-book specialization `q_π,n(z)=D_(n+1)([π]·z)`, one instead has `q_π,n(Φ_n x)=Φ_n(λ_π,n(x)+r_v,n(x)·{−1})`. Equivalently, `q_π,nΦ_n=Φ_nλ_(−π),n`. For `π′=uπ` with `u∈Rˣ`, both these compared specializations change by `−Φ_n(r_v,n(x)·{ū})`; `r_v` and `D` are independent of `π`. These are equalities of homomorphisms; they do not assert an all-degree isomorphism or identify `q_π` with `λ_π`. (Weibel, III.7.3 and its Serre algebra proof, V.6.6.4 and the specialization paragraph immediately following it, pp. 246, 410.)

`n≥1`; `λ_π` is §9.11 in the same parameter-last convention as `r`. `q_π` uses the K-book RIGHT-linear boundary and multiplication by `[π]` on the LEFT. The corrected formula uses `[−π]` on the RIGHT and the degree sign.

**Checks.**

- For `R=ℤ_(5), λ₅,1{5}=0` in additive Milnor notation, but `q₅,1([5])=[−1]`, corresponding to `4∈𝔽₅ˣ`. The corrected expression `−D₂([5]·[−5])=0`.
- For the same `R, λ₁₀,1{5}={3}`, while `q₁₀,1([5])={2}`, because `q₅{5}−{2}={−1/2}={2}` in `𝔽₅ˣ`. A uniformizer-independent specialization fails this test.
- For a unit `u` both specializations take `Φ₁{u}` to `[ū]`. In higher degree every all-unit symbol reduces in its original order.
- For `k=ℚ(s), F=k((t)), x={s,t}, λ_t,2(x)=0` and `q_t,2Φ₂(x)=Φ₂{s,−1}`; the latter is detected by the s-adic residue `−1`. This tests the correction beyond degree one.

*Needs:* §8.2; §9.9; §9.11; §9.14; §9.15; §11.3; GeneralAlgebraicKTheory §8.13.

### 11.6 Quillen transfers and the localisation boundary: the norm–residue square

Let `R ⊆ R′` be Dedekind domains with `R′` finitely generated as an R-module, `F ⊆ F′` their fraction fields (so F′/F is finite), and for a nonzero prime `𝔭` of `R` let `𝔭′` run over the primes of `R′` above `𝔭`. The transfers of GeneralAlgebraicKTheory Layers 4 and 8 along `R → R′, F → F′` and `k(𝔭) → k(𝔭′)` (restriction of scalars; `R′` is finitely generated and torsion-free, hence projective, over `R`) form a morphism from the localisation sequence of §11.2 for `R′` to that for `R`. In particular `∂_𝔭 ∘ N_{F′/F} = Σ_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)} ∘ ∂_{𝔭′}` on `K_n(F′)`: residue degrees enter through the transfers of the residue extensions and no ramification index appears (ramification enters restriction, §9.7). In degree two, the boundaries being the inverse tame symbols and the `K_1-transfer` of a finite field extension the field norm, `tameSymbol_{v_𝔭}(N_{F′/F} x) = ∏_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)}(tameSymbol_{v_𝔭′} x)` for `x ∈ K_2(F′)`, with `N_{F′/F}` Quillen's transfer; the identity holds in both normalisations. Moreover, for a finite field extension E/F restriction followed by transfer is multiplication by `[E : F]` on `K_n(F)`, the projection formula applied to the class `[E] = [E : F]` of `K_0(F) = ℤ`. The Milnor-side statements are Layer 10's (§10.27, §10.9, §10.8); their agreement with these is §11.7. (Weibel, `V.(6.6.3)-(6.6.4)`; Weibel, III.1.7.1 and the paragraph after it, p. 187; Weibel, III.5.6.3, p. 221.)

`R ⊆ R′` are Dedekind domains, `R′` is a finitely generated R-module, and `F ⊆ F′` are their fraction fields. Transfers are those of GeneralAlgebraicKTheory §7.7; for fields they are the finite transfers of the forgetful functor (K-book III.1.7.1 and III.5.6.3).

**Checks.**

- Degree one: `ord_𝔭(N_{F′/F} y) = Σ_{𝔭′|𝔭} f(𝔭′|𝔭)·ord_{𝔭′}(y)`; for `ℚ(i)/ℚ` at the ramified prime `2, N(1 + i) = 2` has `ord_2 = 1 = f·ord_{(1+i)}(1 + i)` with `f = 1`, while a formula with the ramification index `e = 2` would give 2.
- For `x = res(y)` with `y ∈ K_2(F)`, with §9.7 this gives `tameSymbol_{v_𝔭}(y)^{Σ e f} = tameSymbol_{v_𝔭}(y)^{[F′:F]}`, the fundamental identity.
- For fields, restriction followed by transfer on `K_2` is multiplication by `[E : F]` (K-book III.5.6.3).
- The theorem concerns Quillen's transfer; Layer 10's Milnor norm is compared with it in §11.7, not identified with it by definition.

*Needs:* §11.2; GeneralAlgebraicKTheory §7.7; GeneralAlgebraicKTheory §4.8; GeneralAlgebraicKTheory §4.14; Mathlib `Algebra.norm`.

### 11.7 Layer 10's Milnor norm is Quillen's transfer on `K₂`

For a finite field extension E/F, under Matsumoto's isomorphisms `K^M_2(E) ≅ K_2(E), K^M_2(F) ≅ K_2(F)` (§7.2) and the identification of Steinberg with Quillen `K_2` (§4.1), the Milnor norm `N_{E/F}` of §10.24 corresponds to Quillen's transfer of GeneralAlgebraicKTheory Layers 4 and 8. Consequently, in degree two and under the boundary identification of §11.2, the Milnor norm/residue formula §10.27 and the Quillen norm/residue square §11.6 are the same statement, as are §10.9 and the restriction–transfer clause of §11.6. The Milnor norms are those of Layer 10 and the K-theory transfers those of GeneralAlgebraicKTheory §7.7; neither is constructed here. For arbitrary finite extensions the proof uses the common arbitrary-field base-change contract, prime-to-p detection and degree-p symbol generation; quadratic extensions are a separate regression, not the scope of the result. (Weibel, III.6.1.5, Corollary 6.1.5, p. 232; Weibel, Exercise III.5.6, p. 229; Weibel, III.7.6, Definition 7.6 and Theorem 7.6.1, p. 249; Gille–Szamuely, Lemma 7.3.6–7.3.7 and proof of Theorem 7.3.2, pp. 198–203; Weibel, V.1.2/1.2.1; V.3.7.2 and Exercise V.3.11, pp. 366, 390, 398.)

E/F is a finite field extension. The two norms are compared on `K_2 = K^M_2` through Matsumoto's theorem; in degrees zero and one both are the degree and the field norm.

**Checks.**

- For `ℂ/ℝ` both norms send `{r, e^{iθ}}` to 1 and `{r, s}` to `{r, s}²` (K-book Example III.6.1.6 and Corollary III.6.1.5).
- In degree one both are the field norm: `N(1 + i) = 2` for `ℚ(i)/ℚ`.
- The comparison is a theorem, not a definition: Layer 10's norm is defined through the Bass–Tate sequence, Quillen's through restriction of scalars.
- Nonreduced test: `E=F_p(s^(1/p)), F=F_p(s), F′=E` gives `E⊗_F E≅E[ε]/(ε^p)`, one residue field `E` and length p. Both base-change formulas read `res∘N=p·id`, not id.
- A nonquadratic test uses a degree-three extension over a 3-closed field and the symbols `{y,x}` with `x` in the base; a quadratic-only proof fails this case.

*Needs:* §4.1; §7.2; §10.2; §10.8; §10.9; §10.11; §10.12; §10.13; §10.24; GeneralAlgebraicKTheory §7.7; GeneralAlgebraicKTheory §7.8.

### 11.8 The degree-two residue comparison square

Let `R` be the discrete valuation ring, with fraction field `F` and residue field `k`. Write `μ_F:K^M_2(F)≃K₂^St(F)` for the Matsumoto equivalence of §7.2, `c_F:K₂^St(F)≃K₂^Q(F)` for §4.1 followed by the `plus=Q` comparison of GeneralAlgebraicKTheory §3.12, `η_F=c_F∘μ_F, c_F♮=c_F∘(ε·)` for the torus sign of §8.1, `η_F♮=c_F♮∘μ_F=Φ₂` by §8.3, and `det_k:K₁^Q(k)≃kˣ` for the field determinant comparison of KTheoryLowDegrees §8.1. For the actual localization boundary `B^R₂:K₂^Q(F)→K₁^Q(k)`, normalized by `B₁[π]=1` and the right module rule `B(x·j*y)=B(x)·i*y`, the following equalities of homomorphisms hold: `tameSymbolHom^M_v=tameSymbolHom^St_v∘μ_F=inv∘det_k∘B^R₂∘η_F♮`. With the raw Hurewicz comparison, `det_k∘B^R₂∘η_F=(tameSymbolHom^M_v)^(−ε)`. Also `∂^last_v` in degree two agrees with `tameSymbolHom^M_v` under `K^M_1(k)=kˣ`. Setting `B^L₂=−B^R₂` gives `det_k∘B^L₂∘η_F♮=tameSymbolHom^M_v`. Here inv denotes inversion of the abelian group `kˣ`. These equalities concern the actual symbol, product and connecting maps, not arbitrary chosen isomorphisms. The same inversion is applied at every prime in the Dedekind boundary and cancels from either norm/residue square. (Weibel, V.6.1.2, V.6.6–6.6.1; `V.(6.6.3)–(6.6.4)`, pp. 406, 409–410; Weibel, III.6.3, III.7.1 and III.7.3, pp. 234, 245, 246.)

`π∈Fˣ` is a uniformizer of order one. The Milnor, classical, plus and Quillen identifications and the localization/product maps are the specified natural maps.

**Checks.**

- On `{2,5}` over `ℚ` at 5, tameSymbolHom has value 2, whereas `det_k B^R₂ η♮` has value 3. The square commutes only with the displayed inversion.
- On `{5,5}`, both degree-two normalizations give `−1`, which is 4 in `𝔽_5`; diagonal tests alone do not detect inversion.
- For finite integral closure S/R, both the Milnor and Quillen norm/residue squares have residue-field norms and no extra `e_w` factor. The restriction square has `e_w` instead.

*Needs:* §4.1; §7.2; §8.2; §9.5; §9.8; §9.16; §11.1; §11.2; §11.6; §11.7; KTheoryLowDegrees §8.1; GeneralAlgebraicKTheory §3.12; GeneralAlgebraicKTheory §3.14; GeneralAlgebraicKTheory §8.12; GeneralAlgebraicKTheory §8.13; GeneralAlgebraicKTheory Layers 4, 7 and 8; GeneralAlgebraicKTheory Layer 7.

### Examples

- On `{2, 5}` over `ℚ` at 5 the tame symbol is 2 while `det ∘ B ∘ η♮` gives `3 = 2⁻¹`: the square commutes only with the stated inversion; on `{5, 5}` both normalisations give `−1`, so diagonal tests do not detect it.

### Dependencies

Layers 4, 7–10; GeneralAlgebraicKTheory Layers 3, 4, 7 and 8; KTheoryLowDegrees §8.1.

## Layer 12: tame kernels and explicit arithmetic

The unramified subgroup of `K₂` of a field with a family of discrete valuations; the exact sequences `0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0` and `0 → K₂(O_F) → K₂(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0` for a number field; the real sign symbol; and `K₂(ℤ) ≅ ℤ/2` generated by `{−1, −1}`, through Milnor's integer word reduction and the monomial-kernel theorem, and `K₂(ℚ) ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^×`.

### 12.1 The unramified subgroup of `K_2` of a field

Let `F` be a field with a family `(v_i)_{i∈I}` of discrete valuations — in the arithmetic case `R` is a Dedekind domain with fraction field `F`, `I = HeightOneSpectrum R` and `v_𝔭` is the `𝔭-adic` valuation; for a number field `R = O_F` and `I` is the set of finite places. The unramified subgroup `U_I(F) ⊂ K_2(F)` is the intersection over `i` of the kernels of the tame symbols `∂_{v_i} : K_2(F) → k(v_i)^×` of Layers 9–11; for `S ⊂ I` the subgroup unramified outside `S` is the intersection over `i ∉ S`. The definition uses no localisation theorem; for a number field its identification with `K_2(O_F)` is §12.3. (Weibel, III.6.3, Lemma 6.3, p. 234; Weibel, III.6.5, Localization Theorem 6.5, p. 236.)

Each `v_i` is a discrete valuation of `F` with residue field `k(v_i)`. When every element of `F^×` has nonzero valuation at only finitely many `v_i (a Dedekind domain, the places of a function field)`, `U_I(F)` is the kernel of the residue sum `K_2(F) → ⊕_i k(v_i)^×`.

Provide the following API.

- `unramifiedSubgroup`: For a family `v : I →` discrete valuations of `F, ⨅ i, ker(∂_{v i})` as a subgroup of `K_2(F)`.
- `mem_unramifiedSubgroup_iff`: `x ∈ U ↔ ∀ i, ∂_{v i} x = 1`.
- `unramifiedOutside`: For `S ⊆ I, ⨅ i ∉ S, ker(∂_{v i})`; `unramifiedOutside ∅ = unramifiedSubgroup`, and it is monotone in `S`.
- `unramifiedSubgroup_eq_ker_residueSum`: Under finite support, `U = ker(K_2(F) → ⨁ i, k(v i)ˣ)`.
- `symbol_mem_unramifiedSubgroup`: If `u` and `w` are units at every `v_i` then `{u, w} ∈ U`.
- `range_K2_le_unramifiedSubgroup`: For a Dedekind domain `R` with fraction field `F` and `I = HeightOneSpectrum R`, the image of `K_2(R) → K_2(F)` lies in `U`.
- `unramifiedSubgroup_map_le`: Restriction along a finite extension carrying the family into the family maps `U` into `U`.
- `transfer_mem_unramifiedSubgroup`: The transfer of a finite extension of number fields maps the unramified subgroup of the larger field into that of the smaller.
- `unramifiedSubgroup_heightOneSpectrum`: For `I = HeightOneSpectrum R`, `v_𝔭` is Mathlib's HeightOneSpectrum.valuation `F` and `k(v_𝔭)` is identified with `R ⧸ 𝔭`.

**Checks.**

- For `F = ℚ` with the family of all primes, `{−1, −1} ∈ U`, since `−1` is a unit at every prime.
- For an odd prime `p, {−1, p} ∉ U` over `ℚ`: its tame symbol at `p` is `−1 ≠ 1` in `𝔽_p^×`; a definition testing only symbols of units, or only one place, misses this.
- `{3, 3} ∉ U` over `ℚ`: the sign `(−1)^{v(f)v(g)}` makes its tame symbol at 3 equal to `−1`; a symbol without the sign would wrongly put `{3, 3}` in `U`.
- `{2, −1} = 1` by the Steinberg relation `(2 + (−1) = 1)`; correspondingly its tame symbol at 2 is `−1 = 1` in `𝔽_2^×` and all others are 1.
- For the empty family `U = K_2(F)`, and unramifiedOutside `I = K_2(F)`.
- For `ℚ` and the primes, `x ∈ U` exactly when the residue sum of `x` in `⨁_p 𝔽_p^×` vanishes.
- For `R = ℤ` the valuation Mathlib attaches to `(p) ∈` HeightOneSpectrum `ℤ` is the p-adic valuation and `ℤ ⧸ (p) ≅` ZMod `p`, so the tame symbol at `(p)` lands in `(ZMod p)ˣ`.

*Needs:* §0.3; §6.18; §9.4; §9.7; §9.13; §10.27; Mathlib `IsDedekindDomain.HeightOneSpectrum`; Mathlib `IsDedekindDomain.HeightOneSpectrum.valuation`.

### 12.2 The tame-kernel sequence of the S-integers: residues at the primes outside `S`

Let `F` be a number field, `S` a finite set of nonzero primes of `O_F` (`S = ∅` allowed) and `O_{F,S} = Set.integer S F`. The nonzero primes of `O_{F,S}` are the `𝔭O_{F,S}` with `𝔭 ∉ S`, with residue fields `k(𝔭) = O_F/𝔭` (Tau Ceti's IsDedekindDomain.integerHeightOneSpectrumEquiv). Then `0 → K_2(O_{F,S}) → K_2(F) −(∂_𝔭)_{𝔭∉S}→ ⊕_{𝔭∉S} k(𝔭)^× → 0` is exact: the sum is over the finite primes OUTSIDE `S`. Equivalently `K_2(O_{F,S}) → K_2(F)` is injective with image the subgroup unramified outside `S` (§12.1), and the residue sum over the primes outside `S` is onto. The sequence is derived through the actual maps of the Dedekind localisation sequence, whose boundary is the tame symbol at each prime (§11.2, from Layer 11): injectivity because `K_2` of each finite residue field vanishes, surjectivity because the cokernel of the residue sum is `ker(K_1(O_{F,S}) → K_1(F))`, which is zero by the Bass–Milnor–Serre theorem `SK_1(O_{F,S}) = 0` (KTheoryLowDegrees Layers 10–11). The relative sequence comparing `O_F` with `O_{F,S}`, whose residues are at the primes IN `S`, is §12.4. (Weibel, III.6.5, Localization Theorem 6.5, p. 236; Weibel, V.6.8, Theorem 6.8, p. 412; Weibel, V.6.8, proof of Theorem 6.8, p. 412.)

`F` is a number field and `S` a finite set of nonzero primes of `O_F`. `K_2` is the classical group of Layers 1–4, identified with Quillen's `K_2` by §4.1; the sign of the boundary is fixed in §11.1 and does not affect kernels or images.

**Checks.**

- For `F = ℚ` and `S = {p}: 0 → K_2(ℤ[1/p]) → K_2(ℚ) → ⊕_{ℓ≠p} 𝔽_ℓ^× → 0`; the residue at `p` is not in the sum.
- For `S = ∅` it is §12.3.
- Indexing test: `{5, 2} ∈ K_2(ℚ)` has nonzero tame symbol only at 5 (value 3 with Layers 9–11's normalisation), so it lies in the image of `K_2(ℤ[1/5])` and not in that of `K_2(ℤ[1/2])`.

*Needs:* §4.1; §0.4; §11.1; §11.2; §12.1; KTheoryLowDegrees Layers 10–11; Mathlib `Set.integer`; Tau Ceti `IsDedekindDomain.integerHeightOneSpectrumEquiv`.

### 12.3 The tame-kernel exact sequence for the ring of integers

For a number field `F` with ring of integers `O_F` the sequence `0 → K_2(O_F) → K_2(F) −⊕∂_𝔭→ ⊕_𝔭 k(𝔭)^× → 0` is exact, the sum over all nonzero primes of `O_F` and the third map the residue sum of the tame symbols (sign fixed in §11.1): `K_2(O_F) → K_2(F)` is injective with image the unramified subgroup of §12.1, and the residue sum is onto. It is the case `S = ∅` of §12.2: injectivity from `K_2(k(𝔭)) = 0`, surjectivity from `SK_1(O_F) = 0` through the Dedekind localisation sequence (§11.2 and KTheoryLowDegrees Layers 10–11). The downstream consumer ArithmeticKTheory specialises its all-degree localisation sequence to this one; this layer does not use it. Surjectivity does not follow from the surjectivity of the individual tame symbols. (Weibel, III.6.5, Localization Theorem 6.5, p. 236; Weibel, V.6.8, Theorem 6.8, p. 412; Weibel, V.6.8, proof of Theorem 6.8, p. 412; Weibel, III.1.5.4, Example 1.5.4, p. 185.)

`F` is a number field; `𝔭` runs over the nonzero primes of `O_F` and `k(𝔭) = O_F/𝔭`. `K_2` is the classical group of Layers 1–4, identified with Quillen's `K_2` by §4.1.

**Checks.**

- For `F = ℚ` it is `1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1` (Application III.6.5.1).
- The third map is onto, but not because each tame symbol is: Example III.1.5.4 gives surjective tame symbols with a nonzero cokernel.
- The same sequence holds for every Dedekind domain whose fraction field is a global field (Soulé's Theorem V.6.8, `n = 2`).

*Needs:* §0.4; §11.2; §12.1; §12.2; KTheoryLowDegrees Layers 10–11; Mathlib `NumberField.RingOfIntegers`; Mathlib `Set.integer`.

### 12.4 The relative sequence comparing `K₂(O_F)` with `K₂(O_{F,S})`: residues at the primes in `S`

Let `F` be a number field and `S` a finite set of nonzero primes of `O_F`. Then `0 → K_2(O_F) → K_2(O_{F,S}) −(∂_𝔭)_{𝔭∈S}→ ⊕_{𝔭∈S} k(𝔭)^× → 0` is exact, the first map induced by `O_F ⊆ O_{F,S}` and the residues taken at the primes IN `S` (read on the image of `K_2(O_{F,S})` in `K_2(F)`). The tame-kernel sequence of `O_{F,S}` itself, §12.2, has its residues at the primes OUTSIDE `S`; the two are distinct statements. Consequently `#K_2(O_{F,S}) = #K_2(O_F)·∏_{𝔭∈S}(N𝔭 − 1)` whenever `K_2(O_F)` is finite. This is the exact sequence comparing the S-integral tame kernel with the integral one. (Weibel, V.6.8, Theorem 6.8, p. 412.)

`F` is a number field and `S` a finite set of nonzero primes of `O_F`.

**Checks.**

- For `F = ℚ` and `S = {p}: 0 → K_2(ℤ) → K_2(ℤ[1/p]) → 𝔽_p^× → 0`, so `K_2(ℤ[1/p])` has order 2(p − 1); the downstream consumer ArithmeticKTheory uses this sequence.
- Indexing: the residues are at the primes in `S`; for `S = ∅` the sequence is the identity of `K_2(O_F)`.
- The order formula `#K_2(O_{F,S}) = #K_2(O_F)·∏_{v∈S}(Nv − 1)` that the downstream consumer SpecialValuesBirchTate (its B.7) uses follows because `#k(𝔭)^× = N𝔭 − 1`.

*Needs:* §12.1; §12.2; §12.3; Mathlib `Set.integer`.

### 12.5 The real sign symbol (Example III.6.2.1)

For `x, y ∈ ℝ^×` put `(x, y)_∞ = −1` if `x < 0` and `y < 0`, and `+1` otherwise. It is bilinear and `(x, 1 − x)_∞ = 1` for `x ≠ 0, 1`, so by Matsumoto's theorem it defines a homomorphism `K_2(ℝ) → {±1}`, onto because `(−1, −1)_∞ = −1`. For a field `F` with an embedding `σ : F → ℝ (a real place of a number field)` the composite `K_2(F) → K_2(ℝ) → {±1}` is the sign symbol at `σ`. (Weibel, III.6.2.1, Example 6.2.1, p. 232; Weibel, III.6.2.1, Example 6.2.1, continued, p. 232; Weibel, Exercise III.6.4, p. 243.)

The target `{±1}` is `ℤˣ`; `σ` is a ring embedding into `ℝ`.

Provide the following API.

- `realSignSymbol`: The homomorphism `K_2(ℝ) →* ℤˣ` with `{x, y} ↦ −1` if `x < 0` and `y < 0`, and 1 otherwise.
- `realSignSymbol_symbol`: Its value on a symbol `{x, y}`.
- `realSignSymbol_neg_one_neg_one`: realSignSymbol `{−1, −1} = −1`.
- `realSignSymbol_surjective`: It is onto `ℤˣ`.
- `signSymbolAt`: For `σ : F →+* ℝ`, the composite of `K_2(σ)` with realSignSymbol; for a number field one for each real place.
- `realSignSymbol_eq_milnorExamples`: Through Matsumoto's theorem, on `K^M_2(ℝ): {x, y} ↦ −1` exactly when `x < 0` and `y < 0`, which is the degree-two part of the graded map `K^M_*(ℝ) → (ℤ/2)[t]` given by `realGradedSignDetector` of §5.9, through `realSignDetector` and the standard equivalence `Additive ℤˣ ≃+ ZMod 2`.

**Checks.**

- `(−2, −3)_∞ = −1` and `(−2, 3)_∞ = 1`.
- `(x, 1)_∞ = (1, y)_∞ = 1` for all `x, y ∈ ℝ^×`.
- The pairing equal to `−1` when at least one entry is negative is not a Steinberg symbol: it is `−1` at `(2, −1)` although `2 + (−1) = 1`.
- For the real embedding of `ℚ`, signSymbolAt sends `{−1, −1}` to `−1` and `{p, q}` to 1 for positive `p, q`.
- `(x, y)_∞ = 1` exactly when `x·a² + y·b² = 1` has a real solution, the Hilbert symbol of `ℝ`.

*Needs:* §0.4; §5.9; §7.2; Mathlib `NumberField.InfinitePlace.IsReal`.

### 12.6 Finite-rank integer word models for Silvester’s induction

Define an auxiliary family `S_n` over `ℤ: S₀=S₁=1`; `S₂` is Milnor’s rank-two presented group of Definition 10.4; `S_n=St(n,ℤ)` from §0.3 for `n≥3`. In rank two impose `x_ij(a)x_ij(b)=x_ij(a+b)` and `w_ij(u)x_ji(a)w_ij(−u)=x_ij(−u²a), u∈ℤ×`, where `w_ij(u)=x_ij(u)x_ji(−u⁻¹)x_ij(u)`. Let `φ_n` be the elementary-matrix action on row vectors `ℤ^n, W_n` the subgroup generated by `w_ij(1)`, and `|b|₁=Σ_i |b_i|`. Use the standard rank-raising maps `S_n→S_(n+1)` and the map into stable `St(ℤ)`. This auxiliary `S₂` is not the rank-two group with only the usual three-index Steinberg relations. (Milnor, Definition 10.4, p. 82; setup for Lemma 10.6, p. 85; Lemmas 9.2–9.4, pp. 71–72.)

`n∈ℕ`; the integer ring and row-vector action are fixed; finite `St(n,ℤ)` is that of §0.3 for `n≥3`.

Provide the following API.

- `IntegerSteinbergModel`: The auxiliary `S_n` with the explicit rank-two relation and the standard higher-rank carrier.
- `IntegerSteinbergModel.toElementary`: `φ_n:S_n→E(n,ℤ)`, satisfying `φ_n(x_ij(a))=e_ij(a)`.
- `IntegerSteinbergModel.stabilize`: `S_n→S_(n+1)` and compatible maps into stable `St(ℤ)`; no low-rank injectivity is asserted.
- `IntegerSteinbergModel.monomialSubgroup`: `W_n=⟨w_ij(1)⟩`; its row-vector action preserves the integer `ℓ¹` norm.
- `IntegerSteinbergModel.unitWord`: Every element is represented by signed unit generators followed by `a W_n` element; a norm-monotone representation is the next lemma, not part of this definition.

**Checks.**

- `(2,−1)x₁₂(1)=(2,1)` and `(2,−1)x₂₁(1)=(1,−1)`.
- `(2,−1)w₁₂(1)=(1,2)`, and both vectors have `ℓ¹` norm 3.
- The auxiliary `S₂` carries the conjugation relation of Definition 10.4; the ordinary two-index free Steinberg presentation is not substituted for it.

*Needs:* §0.3; §6.2; Mathlib `PresentedGroup`.

### 12.7 Silvester’s monotone integer word lemma

For `n≥2`, a signed standard basis vector `β∈ℤ^n` and `z∈S_n`, there exist signed unit generators `g₁,…,g_r` and `w∈W_n` with `z=g₁⋯g_r w` and `1≤|βg₁|₁≤⋯≤|βg₁⋯g_r|₁`. The word equality holds in `S_n`, not just after elementary matrices. (Milnor, Lemma 10.6 and its seven-case proof, pp. 85–90.)

`S_n, W_n` and the right row action are §12.6; `β=±e_i`; `n≥2`.

**Peak reduction in the presented group.** First write the word with letters `x_ij(±1)`, by additivity. For a word `g₁⋯g_r w` put `τ_j=|βg₁⋯g_j|₁`, including `τ₀=1`. If there is a descent, let `λ` be the greatest HEIGHT `τ_j` at a descent, and `μ` the greatest INDEX `j` with `τ_j=λ>τ_(j+1)`. The pair `(λ,μ)` is ordered lexicographically in `ℕ×ℕ`. One has `μ≥1` and `τ_(μ−1)≤τ_μ`; otherwise an earlier descent would have height greater than `λ`. Conjugate the entire word by a signed monomial lift and change the signed basis vector accordingly, so that `g_μ=x₁₂(1)`. This preserves every height and sends every other letter to a signed unit root. For `n=2` first allow also the presentation automorphism `x₁₂(a)↦x₁₂(−a), x₂₁(a)↦x₂₁(−a)`, induced on matrices by conjugation with `diag(−1,1)`. Substituting `(−u,−a)` in the imposed relation proves that it preserves that relation; it sends `w₁₂(1)` to its inverse, so it preserves `W₂` and every row norm. Together with `W₂-conjugation` it sends either sign and either root to `x₁₂(1)`. The imposed relation of §12.6 supplies the required `W₂-conjugation`: with `X=x₁₂(1), Y=x₂₁(−1)`, it gives `(XYX)Y(XYX)⁻¹=X`, hence `YXY=XYX` and conjugation interchanges `X` and `Y`. No third index is used in that rank.

Write the vectors just before and at the peak as `(a,b−a,c,…)` and (a,b,c,…). Thus `|b−a|≤|b|`; if `a≠0` then `ab>0` and `|a|≤2|b|`. The following replacements are equalities of Steinberg words, using the root relations; a terminal `w₁₂(1)` is pushed to the existing W-tail using its conjugation action. All unmentioned coordinates are unchanged.

1. If the next letter is `x₁j(ε), j≥3`, commute it past `x₁₂`. The newly inserted middle vector has smaller norm than the vector before the peak, since the descending coordinate `j` is unaffected by `x₁₂`.
2. If both indices of the next letter exceed 2, commute the two letters for the same reason.
3. If the next letter is `x₁₂(ε), ε=−1` cancels the pair; `ε=1` cannot decrease `|b|`, by the displayed inequality (including `a=0`).
4. For `x₃₂(ε)`, put `d=εc`. The drop is `|b+d|<|b|`. Choose one of the equal words
   `x₃₂(ε)x₁₂`,
   `x₁₃(ε)x₃₂(ε)x₁₃(−ε)`, or
   `x₃₁(ε)x₁₂x₃₁(−ε)`.
   The respective sufficient inequalities are `|b−a+d|<|b−a|, |c+εa|<|c|`, and `|a+d|<|a|`. If `a=0` use the first. Otherwise a and `d` have opposite signs: use the second when `|a|≤|d|` and the third when `|a|>|d|`. In the second and third words both new intermediate norms are strictly less than `λ`, by comparing the changed coordinate with the corresponding endpoint.
5. For `x₂₁(ε)`, descent forces `ε=−1`. Replace `x₁₂x₂₁(−1)` by `x₂₁(1)w₁₂(1)`. The intermediate vector `(b,b−a,c,…)` has the same norm as the old endpoint `(a−b,b,c,…)`, strictly below `λ`. This identity is valid in the auxiliary `S₂` by the preceding braid calculation.
6. For `x₂₃(ε)`, the drop is `|c+εb|<|c|`. The three equal replacement words are
   `x₁₃(ε)x₂₃(ε)x₁₂`,
   `x₂₃(ε)x₁₃(ε)x₁₂`, and
   `x₂₁(1)x₁₃(ε)x₁₂(−1)w₁₂(1)`.
   If `a=0` choose the second. If `0<|a|<2|c|` choose the first: `εa` has sign opposite to `c`, and its first coordinate-j change strictly decreases `|c|`. If `|a|≥2|c|`, then `|a|>|b|` because descent gives `|b|<2|c|`; choose the third. Its intermediate vectors are `(b,b−a,c), (b,b−a,c+εb)`, and `(b,−a,c+εb)`, each of norm below `λ`. The first two words also have all intermediate norms below `λ`.
7. For `x₃₁(ε)`, the drop is `|a+εc|<|a|`. Use
   `x₃₁(ε)x₁₂x₃₂(−ε)`, or
   `x₃₁(ε)x₁₃(−ε)x₃₂(−ε)x₁₃(ε)`.
   Here `a,b` have the same sign and `εc` the opposite sign. If `|c|≤2|b|` use the first word: `|b+εc|≤|b|`, so both intermediate norms are below `λ`. Otherwise `|c|>2|b|≥|a|` and use the second. Its intermediate vectors are `(a+εc,b−a,c), (a+εc,b−a,−εa)`, and `(a+εc,b,−εa)`. The inequalities `|b−a|≤|b|` and `|a+εc|=|c|−|a|` put all three norms below `λ`.

Indices 3 in these cases stand for any index distinct from `1,2`. Each replacement removes the peak at `μ`, inserts only heights below `λ` between its endpoints, and preserves all later heights (after conjugating the tail when a Weyl word is extracted). If the preceding height equals `λ`, its new descent occurs at `μ−1`; no later `height-λ` descent existed by the choice of `μ`. Consequently the new pair is smaller, even when the word is longer. Lexicographic well-founded induction terminates with no descent. This proves the monotone word statement without a bound on word length. The classical source is Milnor, Lemma 10.6, pp.85–90; Moreno Ramírez, Lemma 4.4.1.5, pp.112–118, provides an accessible exposition. The replacements and strict/non-strict boundary cases above give the proof obligations directly rather than relying on that exposition's sign and inequality slips.

**Checks.**

- The result preserves the Steinberg word, not merely the resulting integer vector.
- At `a=0` in Case 4 the first inequality is required; omitting that branch leaves the argument incomplete.
- In Case `6, (a,b,c)=(4,3,−2), ε=1` has `|a|=2|c|`; the Weyl-tail branch applies, whereas the strict inequality `|c+εa|<|c|` fails.
- In rank two, `x₁₂(−1)` cannot be sent to `x₁₂(1)` by `W₂-conjugation` alone. The diagonal-sign presentation automorphism is necessary and preserves the defining relation and the W-tail.
- The well-founded induction uses the lexicographic pair `(λ,μ)`, with `λ` a height and `μ` an index. Word length need not decrease.

*Needs:* §12.6.

### 12.8 The integer Steinberg kernel is contained in the monomial subgroup

For every `n≥1, ker(φ_n:S_n→E(n,ℤ))⊆W_n` in the auxiliary finite-rank integer models. (Milnor, Lemma 10.7, pp. 90–92; Lemma 9.1, p. 71.)

The auxiliary `S₂` has Milnor’s Definition 10.4; no injectivity of stabilization is assumed.

**Induction through the last column.** The assertion is trivial for `n=1`. For `z∈ker φ_n` apply §12.7 with `β=e_n`. The final norm is 1 because `z` acts trivially, and the W-tail preserves norm. Therefore every prefix has norm 1. Inductively each prefix vector is `e_n`: under this right row action, a signed root `x_nj(±1)` with row index `n` would take `e_n` to a vector of norm 2, so each root letter fixes `e_n`, and the final `w` fixes it too. The word has no root `x_nj`. By the Steinberg relations move all remaining roots with column index `n` to the left, obtaining `z=x·ξ(y)·w`, where `x` is a product of the commuting roots `x_in(a_i), i<n`, and `y∈S_(n−1)`. The auxiliary `S₂` relations map into `S₃` by §6.11, so `ξ` is defined at the induction step `n=3`.

The signed monomial matrix `φ_n(w)` fixes `e_n` and hence has block form `diag(M,1)`. The matrix of `ξ(y)w` has this same block form, while `φ_n(x)` is identity with last-column entries `a_i`. Since their product is identity, every `a_i=0` and `x=1`; this uses the faithful last-column normal form, including its direct two-by-two calculation when `n=2`. For example `e₂x₁₂(1)=e₂` but `e₂x₂₁(1)=(1,1)`, so the eliminated row and retained column are distinct. Choose `w′∈W_(n−1)` with `φ_(n−1)(w′)=M`: determinant-one signed monomial matrices are generated by the coordinate rotations `w_ij(1)`, as follows by moving the unique nonzero entry in each row and then correcting diagonal sign pairs by `w_ij(1)²`. When `n−1=1, M=1` and `w′=1`. Then `w=ξ(w′)c` for `c∈W_n∩ker φ_n` and `φ_(n−1)(yw′)=1`. Induction puts yw′ in `W_(n−1)`, whence `z=ξ(yw′)c∈W_n`. No assertion about the order of the auxiliary rank-two kernel, and no injectivity of `ξ`, is required. (Milnor, Lemma 10.7, pp.90–92; Moreno Ramírez, Lemma 4.4.1.6, pp.118–119.)

**Checks.**

- The induction includes `n=2` using the auxiliary group; omitting this base does not prove the stable bound.
- The `x=1` step uses the injective matrix map on commuting last-column root subgroups, not injectivity of `φ_n` on all `S_n`.
- For `n=1` both groups are trivial; for `n=2` the lower block and `W₁` are trivial, so the same induction has a genuine base rather than assuming a rank-three relation.

*Needs:* §12.6; §12.7.

### 12.9 The upper generation bound for `K₂` of the integers

Every element of classical `K₂(ℤ)` is 1 or `c={−1,−1}`; this is the upper bound alone and does not assume `c≠1`. (Milnor, Theorem 10.1 and Corollary 10.2, p. 81; final proof, p. 92; Theorem 9.11, pp. 77–78.)

`K₂(ℤ)` is the stable Steinberg kernel; `c` is the Steinberg symbol `{−1,−1}` of §6.4.

**Checks.**

- The upper bound is available before the real sign and uses no calculation of `K₂(ℚ)`.
- The rank-two auxiliary kernel is not asserted to have order two; the bound uses `n≥3`.

*Needs:* §0.3; §6.4; §12.8; §6.13.

### 12.10 `K_2` of the integers is cyclic of order two, generated by `{−1, −1}`

`K₂(ℤ)` is cyclic of order two generated by `c={−1,−1}`. The upper generation theorem §12.9 proves every element is 1 or `c` by Silvester’s finite-rank word reduction and monomial-kernel calculation. Independently, the real sign sends `c` to `−1`, so `c≠1`; bimultiplicativity gives `c²=1`. Consequently `K₂(ℤ)→K₂(ℝ)→{±1}` is an isomorphism and splits `K₂(ℤ)→K₂(ℝ)`. (Weibel, III.5.2.2, Example 5.2.2, p. 218; Weibel, III.6.2.1, Example 6.2.1, continued, p. 232; Weibel, III.5.2.2, Example 5.2.2, second paragraph, p. 218; Milnor, Corollary 10.2, p. 81, derived from Theorem 10.1 proved on p. 92.)

`K_2` is the classical `K_2` of Layers 1–4; `{−1, −1}` is the Steinberg symbol of the unit `−1` of `ℤ` with itself.

**Checks.**

- `{−1, −1} ≠ 1` in `K_2(ℤ)`, while `{−1, −1}² = 1`.
- A real place is one way, not the only way, to detect `{−1, −1}`: in `K_2(ℤ[i])` it vanishes `({−1, −1} = {i, −1}² = 1)`, yet `K_2(ℤ[√−7])` is cyclic of order two generated by `{−1, −1}` although `ℚ(√−7)` has no real place (Tate, cited in III.5.2.2).
- Writing `g={−1,−1}`, the presentation has one generator and relation `2g=0`: §12.9 proves generation, and the real sign symbol proves that `g` has order exactly two.

*Needs:* §0.3; §6.4; §12.5; §12.9.

### 12.11 `K_2` of the rationals (Application III.6.5.1)

The residue sum of the tame symbols gives a split exact sequence `1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1`, split by the real sign symbol through the isomorphism `K_2(ℤ) ≅ {±1}` of §12.10; hence `K_2(ℚ) ≅ K_2(ℤ) ⊕ ⊕_p 𝔽_p^× ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^× (𝔽_2^× being trivial)`, and `K_2(ℚ)` is infinite. The downstream consumer ArithmeticKTheory uses this computation rather than repeating it. (Weibel, III.6.5.1, Application 6.5.1, p. 236.)

`p` runs over all primes `(𝔽_2^× is trivial)`; exactness is the tame-kernel sequence for `ℚ`, which uses `K_2(ℤ/p) = 1` and `SK_1(ℤ) = 1`.

**Checks.**

- `{2, 3}` is not in the image of `K_2(ℤ)`: its tame symbol at 3 is `−1 ≠ 1` in `𝔽_3^×`.
- For an odd prime `p, {−1, p}` maps to the element `−1` of `𝔽_p^×` in the p-component and to 1 elsewhere.
- `K_2(ℚ)` is infinite while `K_2(ℤ)` has order two, the check the downstream consumer ArithmeticKTheory (its N.8) asks for; the splitting uses the real place, and `(p, q)_∞ = 1` for positive `p, q`.

*Needs:* §0.3; §12.3; §12.5; §12.10; KTheoryLowDegrees Layers 10–11.

### Examples

- `K₂(ℚ)` is infinite: the residue at each odd prime `p` is onto `𝔽_p^×`.
- The real sign symbol sends `{−1, −1}` to `−1`, which gives the lower bound `c ≠ 1` in `K₂(ℤ)`.

### Dependencies

Layers 2, 6, 7, 9 and 11; KTheoryLowDegrees Layers 10–11 `(SK₁(O_{F,S}) = 0)`; Mathlib number fields; Tau Ceti `IsDedekindDomain.integerHeightOneSpectrumEquiv`.

## Layer 13: Dennis–Stein symbols and relative `K₂`

Dennis–Stein symbols `⟨r, s⟩` for commuting `r, s` with `1 − rs` a unit, their relations (D1)–(D3) over commutative rings, the Dennis–Stein presentation of `K₂` for threefold stable rings (van der Kallen) and for all local rings, through split radical pairs and a residue-isomorphism transfer; relative Steinberg groups and relative `K₂` of an ideal, their description through the double, and their comparison with the homotopy fibre (Keune–Loday), proved here for split radical pairs; the presentation of relative `K₂` of an ideal in the Jacobson radical (Keune), assembled from Dennis–Stein generation, a reduction to the double and the split radical presentation (Maazen–Stienstra); the relative differential to `I ⊗ Ω¹`; van der Kallen's computation of `K₂` of dual numbers over every commutative ring, with the `Ω¹` form when 2 is invertible; and the dyadic examples `K₂(ℤ/2ⁿ) ≅ ℤ/2` for `n ≥ 2`.

The construction order is: the absolute and relative presentation groups and guarded relations; the field presentation; the lift-change sequence; the threefold-stable and DVR base presentations; generation and the split radical presentation; residue-isomorphism transfer; the all-local presentation; and the collected field/local statement. The dual-number module computation uses only generation and the split radical fibre comparison; its compatibility with the general differential follows after that differential is constructed.

### 13.1 Dennis-Stein symbols

For an associative unital ring `R` and commuting elements `r, s` of `R` with `1 − rs` a unit, the Dennis-Stein symbol is `⟨r, s⟩ = x_ji(−s(1 − rs)⁻¹) x_ij(−r) x_ji(s) x_ij((1 − rs)⁻¹ r) (h_ij(1 − rs))⁻¹` in the stable Steinberg group `St(R)`, for distinct indices `i, j`, where `w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u)` and `h_ij(u) = w_ij(u) w_ij(−1)`. Its image in `E(R)` is trivial — in the `2×2` block at `(i, j)` the four elementary factors multiply to `diag(1 − rs, (1 − rs)⁻¹)`, which `h_ij(1 − rs)` cancels — so `⟨r, s⟩` lies in `K_2(R)`. It does not depend on the choice of `i ≠ j`, it is 1 when `r = 0` or `s = 0`, and when `r` is a unit it equals the Steinberg symbol `{r, 1 − rs}`; hence every Steinberg symbol `{u, v}` of commuting units is `⟨u, u⁻¹(1 − v)⟩`. The convention is the modern one of the source. The pre-1980 symbol, defined when `1 + rs` is a unit (the classical `1+ab` hypothesis), is `⟨−r, s⟩` in this notation; it is a different element and is not introduced as a second definition. The relations (D1)–(D3) are stated in §13.2 and the relative symbol is in §13.7. (Weibel, III.5.11, p. 226.)

The displayed word is a README construction target on §0.3’s stable Steinberg carrier.

`R` is an associative unital ring; `r` and `s` commute and `1 − rs` is a unit of `R`. `i ≠ j` are indices; the word is read in the stable Steinberg group `St(R)`, and the element does not depend on `i, j`. The classical `1 + ab` invertibility hypothesis is the pre-1980 convention: for commuting `a, b` with `1 + ab` a unit the old symbol is `⟨−a, b⟩` in the notation used here, so that hypothesis is met through `a ↦ −a`.

Provide the following API.

- `K2.dennisStein`: For commuting `r, s : R` and a proof that `1 − r s` is a unit, the element `⟨r, s⟩ : K₂(R)`.
- `K2.coe_dennisStein`: `(⟨r, s⟩ : St(R)) = x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹` with `u = 1 − r s`, for any `i ≠ j`.
- `K2.dennisStein_index_indep`: The words for `(i, j)` and for `(k, l)` are equal in `St(R)`.
- `K2.phi_dennisSteinWord`: The image in `E(R)` of `x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r)` is `diag(u, u⁻¹)` at `(i, j)`.
- `K2.dennisStein_zero_left`: `⟨0, s⟩ = 1`.
- `K2.dennisStein_zero_right`: `⟨r, 0⟩ = 1`.
- `K2.dennisStein_eq_steinbergSymbol`: For a unit `r, ⟨r, s⟩ = {r, 1 − r s}`.
- `K2.steinbergSymbol_eq_dennisStein`: For commuting units `u, v, {u, v} = ⟨u, u⁻¹ (1 − v)⟩`.
- `K2.map_dennisStein`: For a ring homomorphism `f : R → R', K₂(f) ⟨r, s⟩ = ⟨f r, f s⟩`.
- `K2.dennisStein_plusConvention`: If `1 + ab` is a unit, the older plus-convention word `P(a,b)` equals the modern word `⟨−a,b⟩`, by direct substitution into the displayed words; there is no additional inversion.

**Checks.**

- In `GL₂(R)`, with `u = 1 − r s` a unit and `r s = s r, e₂₁(−s u⁻¹) e₁₂(−r) e₂₁(s) e₁₂(u⁻¹ r) = diag(u, u⁻¹)`; a word with one sign or one factor changed fails this.
- `⟨r, 0⟩ = 1` and `⟨0, s⟩ = 1` for all `r, s`.
- In `K₂(ℤ): ⟨−1, −2⟩ = {−1, 1 − (−1)(−2)} = {−1, −1}`, which is non-trivial because the sign symbol of §12.5 sends it to `−1`.
- At `(−1, −2)` in `ℚ` the pre-1980 symbol is `⟨1, −2⟩ = {1, 3} = 1 (1 + (−1)(−2) = 3 is a unit)`, while the modern `⟨−1, −2⟩ = {−1, −1} ≠ 1` in `K₂(ℚ)`; and over `ℤ` the modern symbol is defined at `(1, 2)` because 1 − `2 = −1` is a unit, where the old hypothesis `1 + 2 = 3` fails. An implementation of the old convention fails both.
- In `K₂(ℚ), {2, 3} = ⟨2, −1⟩`, the case `u = 2, v = 3` of `{u, v} = ⟨u, u⁻¹(1 − v)⟩`.

*Needs:* §0.3; §2.2; §6.2; §6.3; §6.4; §6.13.

**Dennis–Stein convention and stable word.** For a commutative ring `A, r,s∈A` and `u=1−rs∈Aˣ`, the modern symbol `D(r,s)` is the stable Steinberg-kernel element `x_ji(−s/u)x_ij(−r)x_ji(s)x_ij(r/u)h_ij(u)⁻¹`. It is independent of the distinct indices `i,j`. For the older plus-convention word `P(a,b)=x_ji(−b/(1+ab))x_ij(a)x_ji(b)x_ij(−a/(1+ab))h_ij(1+ab)⁻¹`, the exact translation is `D(r,s)=P(−r,s)`. If `r` is a unit, `D(r,s)={r,1−rs}`; if `s` is a unit, `D(r,s)={1−rs,s}`. The translation has no additional inversion. The four elementary factors of `P` have image `diag(1+ab,(1+ab)⁻¹)`, so its final torus factor must be inverted. Morrow’s Remark 3.10, p.8, prints that factor without the inverse; the displayed word there would have image `diag((1+ab)²,(1+ab)⁻²)`. (Dennis–Stein, Proposition 1.1, pp.283–285; van der Kallen 1977, §5.2, pp.488–489; Morrow, §3.3, p.7, for the unit formulas.)

`A` is commutative and unital; `u=1−rs` is a unit. All assertions about centrality and index independence take place after stabilization.

**Checks.**

- In `ℚ(t), D(2,(1−t)/2)={2,t}`, with tame residue 2 at `t=0`; inserting an inverse gives 1/2.
- For the older word at `a=b=1` over `ℚ`, omitting the final inverse leaves elementary image `diag(4,1/4)`, rather than the identity.
- The construction does not imply centrality for `St(2,A)`.
- `D(r,0)=D(0,s)=1` in multiplicative `K₂` (zero in additive notation), and `D(r,s)` need not be alternating.

*Needs:* §2.2; §6.2; §6.3.

### 13.2 The Dennis-Stein relations (D1)–(D3)

For a commutative ring `R` the Dennis-Stein symbols satisfy (D1) `⟨r, s⟩⟨s, r⟩ = 1` when `1 − rs` is a unit; (D2) `⟨r, s⟩⟨r, t⟩ = ⟨r, s + t − rst⟩` when `1 − rs` and `1 − rt` are units, the right side being defined because `1 − r(s + t − rst) = (1 − rs)(1 − rt)`; and (D3) `⟨r, st⟩ = ⟨rs, t⟩⟨tr, s⟩` when `1 − rst` is a unit. Consequently `⟨r, 1⟩ = 1` whenever `1 − r` is a unit (D3 with `s = t = 1`), which the source prints as `⟨r, 1⟩ = 0`. When every entry involved is a unit or zero — in particular over a field — the relations follow from the unit case of the definition together with bilinearity and the Steinberg identity of Steinberg symbols. For a general commutative ring use Dennis–Stein, Proposition 1.1 and its proof, pp.283–285, after the direct change of variables `P(a,b)=D(−a,b)` from §13.1. (Weibel, III.5.11, p. 226; Weibel, Exercise III.5.13, p. 229.)

`R` is a commutative ring. The source displays (D1)–(D3) without hypotheses and cites Dennis–Stein, who work with commutative rings; the relations are not asserted for merely commuting elements of a noncommutative ring. Each symbol written is defined: the relevant `1 − rs`, `1 − rt`, `1 − rst` are units.

**Checks.**

- In `K₂(ℤ/4)`: (D3) with `(r, s, t) = (2, 1, 1)` gives `⟨2, 1⟩ = 1`; (D2) with `(2, 1, 2)` gives `⟨2, 1⟩⟨2, 2⟩ = ⟨2, −1⟩`; (D3) with `(2, −1, −1)` gives `⟨2, −1⟩² = ⟨2, 1⟩ = 1` (since `−2 = 2`); (D1) gives `⟨2, −1⟩ = ⟨−1, 2⟩⁻¹ = ⟨−1, 2⟩`; and `2 = −2`, so `⟨2, 2⟩ = ⟨−1, −2⟩ = {−1, −1}`, the identity of K-book Ex. III.5.13.
- `⟨r, 1⟩ = 1` when `1 − r` is a unit; it is not a separate generator and not '0'.
- Over a field the relations are consequences of the Steinberg relations; no relation beyond (D1)–(D3) is claimed.

*Needs:* §6.4; §6.7; §13.1.

**Dennis–Stein relations over a commutative ring.** The stable symbols satisfy (D1) `D(r,s)=−D(s,r)`; (D2) `D(r,s)+D(r,t)=D(r,s+t−rst)` when `1−rs` and `1−rt` are units; (D3) `D(r,st)=D(rs,t)+D(rt,s)` when `1−rst` is a unit. These hold over every commutative ring, independently of the extra hypotheses needed for a presentation theorem. (Dennis–Stein, Proposition 1.1(H1)–(H5) and proof, pp.283–285; Weibel, III.5.11, p. 226.)

`A` is commutative. Each displayed symbol must be admissible; the stated unit conditions imply this. In the older `P` convention, H1 gives D1 and H5 gives D3. For D2 put `u=1+ab`. H3 gives `P(a,b+uc)=P(a,b)+P(a/u,uc)+{u,1+ac}`, and H5 gives `P(a/u,uc)=P(a,c)+P(ac/u,u)=P(a,c)+{1+ac,u}`. Skew-symmetry cancels the last two unit symbols. Substituting `a=−r, b=s, c=t` yields the modern D2. Both `u` and `1+ac` are units throughout; no division by `a, b` or `c` occurs.

**Checks.**

- The proofs apply to rings with zero divisors, including `ℤ/4`.
- For D2, `1−r(s+t−rst)=(1−rs)(1−rt)`.
- No Matsumoto theorem or local-presentation theorem is used in proving these relations.

*Needs:* §6.9; §13.1.

### 13.3 Threefold stability

A commutative ring `A` is threefold stable if for every three unimodular pairs `(a_i,b_i), i=1,2,3`, there is `t∈A` such that every `a_i+b_i t` is a unit. A pair is unimodular precisely when `a_i A+b_i A=A`. This predicate is a sufficient hypothesis for the stable Dennis–Stein presentation; it is not imposed on the separate all-local-ring theorem. (van der Kallen 1977, §5.2 and §5.4(3), pp.488–489.)

`A` is a commutative unital ring.

Provide the following API.

- `IsThreefoldStable`: The quantified simultaneous-unit predicate on three unimodular pairs.
- `IsThreefoldStable.exists_unit_perturbation`: The definition returns `t` and the three unit proofs for supplied pairs.
- `IsThreefoldStable.ringEquiv`: A ring equivalence preserves and reflects the predicate, compatibly with identity and composition.
- `isThreefoldStable_iff_residue_card_ge_four`: For semilocal `A`, threefold stability is equivalent to cardinality at least four of every residue field.
- For a field, threefold stability is equivalent to cardinality at least four; each unimodular pair excludes at most one `t`.

**Checks.**

- `𝔽₅` and `ℤ/25` are threefold stable, since their residue fields have five elements.
- `𝔽₂` and `𝔽₃` are local but not threefold stable: the pairs `(−c,1)` exclude all `t`.
- `𝔽₅×𝔽₅` is threefold stable although it is not local.

*Needs:* Mathlib `IsUnit`.

### 13.4 Presentation of `K_2` of a field or a commutative local ring by Dennis-Stein symbols

Theorem III.5.11.1(a). Let `R` be a commutative local ring, or a field. Then the homomorphism to `K₂(R)` from the abelian group `D(R)` generated by symbols `⟨r, s⟩ (r, s ∈ R with 1 − rs a unit)` subject only to (D1), (D2) and (D3), sending each generator to the Dennis-Stein symbol, is an isomorphism. For a field this is equivalent to Matsumoto's theorem through `⟨r, s⟩ ↦ {r, 1 − rs}` for `r ≠ 0, ⟨0, s⟩ ↦ 1`, and `{a, b} ↦ ⟨a, a⁻¹(1 − b)⟩`, and it is proved that way. For a commutative local ring that is not a field the source attributes the theorem to Maazen, Stienstra and van der Kallen, with Keune as the historical reference for the relative form; here it is decomposed by residue field: §13.5 when the residue field has at least four elements, and §13.6 when it is `𝔽₂` or `𝔽₃`, through the split radical pairs of §13.9 and the residue-isomorphism transfer of §13.6. The separate §13.5 extends the presentation to threefold stable commutative rings; it uses van der Kallen’s theorem, not an unstated stable-range generalization of III.5.11.1(a). (Weibel, III.5.11.1(a), p. 226; Weibel, III.5.11, p. 226; van der Kallen–Maazen–Stienstra, Theorem 1, §2.4, p.935.)

`R` is a commutative local ring, or a field.

<a id="ds-groups"></a>

The absolute presentation group and its generator map use only §13.2. `Suggested.lean` defines `K2.DSPair`, `K2.dsRel` and `K2.DennisSteinGroup`, and states the field presentation as `K2.dennisSteinGroup_equiv_symbolGroup`.

Provide the following API.

- `K2.DSPair`, `K2.dsRel`, `K2.DennisSteinGroup`: the admissible pairs, the relations D1–D3 imposed exactly when every displayed pair is admissible, and the quotient `D(R)` of the free abelian group.
- `K2.dennisSteinGroup_equiv_symbolGroup`: for a field `F`, an equivalence `D(F)≃K₂ᴹ(F)` sending `D(r,s)` to `{r,1−rs}` for every unit `r`.

**Checks.**

- For a field the Dennis-Stein and Matsumoto presentations correspond under `{a, b} ↔ ⟨a, a⁻¹(1 − b)⟩`, with `⟨0, s⟩ = 1`.
- `ℤ/25` (residue `𝔽₅`) is covered by §13.5, while `ℤ/4` (residue `𝔽₂`, characteristic 4) and `𝔽₃[t]/(t²)` (residue `𝔽₃`, characteristic 3) take the two different routes of §13.6; a proof that only treats residue fields with at least four elements misses both.
- No presentation is asserted outside the stated hypotheses: `ℤ` is neither local nor threefold stable, and the theorem is not invoked for it (Layer 12 computes `K₂(ℤ)` separately).

*Needs (collected field/local statement):* [field presentation](#ds-field); [all-local presentation](#ds-local).

<a id="ds-field"></a>

**Field presentation.** For every field `F`, the defining D1–D3 presentation group `D(F)` maps isomorphically to `SymbolGroup F` by `D(r,s)↦{r,1−rs}` for nonzero `r` and `D(0,s)↦0`; the inverse sends `{a,b}` to `D(a,a⁻¹(1−b))`. This proves `K2.dennisSteinGroup_equiv_symbolGroup` independently of all local-ring and relative presentation theorems. (Weibel, III.5.11.1(a), p.226; III.6.1, p.230.)

**Checks.**

- Both displayed maps preserve the exact admissible domains and the defining relations.
- Over `𝔽₂` and `𝔽₃` the group vanishes.
- Over `ℝ`, `D(−1,−2)` maps to the nonzero diagonal symbol.

*Needs:* [absolute presentation group](#ds-groups); §§5.2, 7.2, 13.2.

### 13.5 Dennis–Stein presentation for threefold stable rings

Let `D(A)` be the abelian group on all admissible pairs `(r,s)`, with relations D1–D3. If `A` is threefold stable, the map `D(A)→K₂(A)` sending a generator to the modern stable word is an isomorphism. More precisely `D(A)≅K₂(n,A)` for `n≥3`, and these isomorphisms commute with stabilization and ring maps between such rings. No corresponding claim is made for `n=2`. (van der Kallen 1977, Theorem 5.3, p.489; §§5.8–5.19, pp.491–495; Theorem 6.2 and §§6.3–6.23, pp.496–506; Theorem 7.1 and §§7.2–7.4, pp.507–508.)

`A` is commutative and threefold stable; `n≥3` in the finite-rank assertion.

**Checks.**

- Both composites are identity, on D-generators and on arbitrary Steinberg-kernel words.
- The finite-rank range starts at three; §5.4(6) warns that the rank-two inverse can have kernel.
- The result covers local rings with residue cardinality `≥4` and nonlocal examples such as `𝔽₅×𝔽₅`.

*Needs:* §0.3; §13.2; §13.3; [absolute presentation group](#ds-groups).

<a id="ds-local"></a>

### 13.6 The local Dennis–Stein presentation, including residue fields `𝔽₂` and `𝔽₃`

For every commutative local ring `A`, the modern generator map `D(A)→K₂(A)` is an isomorphism, including residue fields `𝔽₂` and `𝔽₃`. Surjectivity holds for every commutative semilocal ring: `K₂(n,A)` is generated by the symbols for `n≥3`, and the stable group is the colimit of these images (Dennis–Stein 1973, Corollary 2.2, p.287, with proof pp.290–291). Injectivity is proved according to the residue field `k=A/𝔪`. If `k` has at least four elements, `A` is threefold stable and §13.5 applies. If `k=𝔽_p` with `p∈{2,3}` and `A` has characteristic `p`, the prime field is a ring section of `A→k`, so `(A,𝔪)` is a split radical pair; since `D(𝔽_p)=K₂(𝔽_p)=0`, the lift-change sequence below makes `D(A,𝔪)→D(A)` onto, and the split presentation of §13.9 makes the composite `D(A,𝔪)→D(A)→K₂(A)` injective. If `k=𝔽_p` and `A` has characteristic 0 or `pⁿ` with `n≥2`, the residue-isomorphism transfer below, applied to the unique ring map `ℤ_(p)→A`, reduces the claim to the discrete valuation ring `ℤ_(p)`. Integers prime to `p` are units in `A` because their residues are nonzero, so this map exists. (van der Kallen–Maazen–Stienstra, Theorems 1 and 3, §§2.4 and 2.7, and Remark 2.8(1), p.935; van der Kallen 1977, Introduction, p.474, which attributes the `residue-𝔽_p` case to Maazen and Stienstra; Weibel, III.5.11.1(a), p. 226.)

`A` is a commutative local ring with maximal ideal `𝔪` and residue field `k=A/𝔪`; there is no hypothesis on the cardinality of `k`. The characteristic-p case with `k=𝔽_p` uses only the split presentation of §13.9; the mixed-characteristic case uses both that presentation and the base case `ℤ_(p)`.

**Checks.**

- `ℤ/4` and `ℤ/9` are admissible local examples even though neither is threefold stable.
- Later calculations with the local presentation for residue field `𝔽₂` or `𝔽₃` use the nonfield case of this target.
- The residue maps `ℤ/4→𝔽₂` and `ℤ/9→𝔽₃` have no unital ring sections: such a section would force the characteristic of the source field to annihilate 1 in the target ring. A proof using a split residue pair cannot be applied to either map; this is why `ℤ/4` and `ℤ/9` go through the transfer, while `𝔽₂[t]/(t²)` and `𝔽₃[t]/(t³)` are split.

*Needs (all-local presentation):* [field presentation](#ds-field); §13.5; [lift-change sequence](#ds-lift-change); [split radical presentation](#ds-split); [residue-isomorphism transfer](#ds-residue-transfer); [DVR base presentation](#ds-dvr-base).

<a id="ds-lift-change"></a>

**Lift-change sequence.** For a surjection `g:B→B′` of commutative rings whose kernel `L` lies in `Jac(B)`, the sequence `D(B,L)→D(B)→D(B′)→0` is exact; the first map sends a relative generator to the same pair, and `D(B,L)` is the [guarded presentation group](#ds-relative-groups), independent of its comparison with relative `K₂`. Every admissible pair of `B′` lifts to an admissible pair of `B`, since an element that is a unit modulo `Jac(B)` is a unit. Changing the second entry of a lift by `l∈L` changes the symbol by a relative generator, `D(x,y+l)=D(x,y)+D(x,l(1−xy)⁻¹)`, by D2 with the second and third entries `y` and `l(1−xy)⁻¹`; the first entry is changed in the same way after D1. Lifts of instances of D1–D3 are again instances of D1–D3. These facts give a homomorphism `D(B′)→D(B)/im D(B,L)` inverse to the induced map. A relative generator maps to a pair with a zero entry, and `D(r,0)=0` by D2. (Own argument from the relations of §13.2.)

`B` is commutative and `L⊆Jac(B)`. Both hypotheses are used: the first for the relations, the second for lifting units.

**Checks.**

- In `ℤ/4` with `L=(2)`, D2 and `D(2,1)=0` give `D(2,3)=D(2,1)+D(2,−2)=D(2,2)`, so `D(3,2)=−D(2,2)` is the image of the relative generator `(2,2)` with sign `−1`. It maps to `D(1,0)=0` in `D(𝔽₂)`, and the detector `λ` of §13.14 takes the value 1 on it, so the kernel of `D(ℤ/4)→D(𝔽₂)` is not zero.
- The admissible-pair lifting argument needs `L⊆Jac(B)`: for `ℤ→𝔽₅` the admissible pair `(2,2)` of `𝔽₅ (1−4=2≠0)` has no admissible lift, since lifts `x,y≡2` mod 5 give `xy≡4` mod 5, while `1−xy=±1` needs `xy∈{0,2}`. This tests lifting of individual pairs; `D(𝔽₅)=0`, so it does not show failure of surjectivity of the group map.
- For `L=0` the sequence reduces to the identity of `D(B)`.

*Needs (lift-change sequence):* §13.2; [absolute presentation group](#ds-groups); [relative presentation group](#ds-relative-groups).

<a id="ds-residue-transfer"></a>

**Residue-isomorphism transfer.** Let `f:R→S` be a homomorphism of commutative rings inducing an isomorphism `R/Jac(R)≅S/Jac(S)`. If the generator map `D(R)→K₂(R)` is an isomorphism, so is `D(S)→K₂(S)`. Let `k` be the common quotient and `P=R×_k S`. The first projection `P→R` is onto, split by `r↦(r,f(r))`, with kernel `0×Jac(S)` contained in `Jac(P)`. By §13.9's split presentation and the lift-change sequence, `D(P)→D(R)` is split onto with kernel the injective image of `D(P,0×Jac(S))`, which maps isomorphically onto `ker(K₂(P)→K₂(R))`. Hence `D(P)→K₂(P)` is an isomorphism. The second projection `P→S` is onto, with kernel `L=Jac(R)×0⊆Jac(P)`. An element of `D(S)` killed in `K₂(S)` lifts to `D(P)`, and its image in `K₂(P)` lies in `ker(K₂(P)→K₂(S))`. That kernel is generated by symbols with an entry in `L` (§13.9, generation). Because `D(P)≅K₂(P)`, the lift lies in im `D(P,L)`, and the lift-change sequence makes the element zero. Surjectivity holds because `K₂(P)→K₂(S)` is onto: `K₁(P,L)→K₁(P)` is injective for `L⊆Jac(P)`. (van der Kallen–Maazen–Stienstra, Theorem 3, §2.7, p.935, for the statement; the proof is assembled from §13.9, the lift-change sequence, KTheoryLowDegrees §9.1 and §13.7's relative exact sequence.)

`R` and `S` are commutative; the isomorphism modulo Jacobson radicals is induced by `f`. A homomorphism that is only injective or only surjective on residue rings is not allowed.

**Checks.**

- For `f=id` the transfer is the identity.
- `ℤ_(2)→ℤ/4` and `ℤ_(3)→ℤ/9` satisfy the hypothesis, because the residue rings are `𝔽₂` and `𝔽₃`.
- `ℤ_(2)→𝔽₄` fails it (the residue map `𝔽₂→𝔽₄` is not onto), and `ℤ→ℤ/4` fails it `(ℤ/Jac(ℤ)=ℤ)`. The rings `𝔽₄` and `ℤ/4` are treated by §13.5 and by the transfer from `ℤ_(2)` respectively.

*Needs (residue-isomorphism transfer):* [lift-change sequence](#ds-lift-change); [generation](#ds-generation); [split radical presentation](#ds-split); §§0.2, 13.7; KTheoryLowDegrees §9.1.

<a id="ds-dvr-base"></a>

**Base case `ℤ_(p)`.** For `p=2` and `p=3` the generator map `D(ℤ_(p))→K₂(ℤ_(p))` is an isomorphism. Use the published Dennis–Stein presentation for a discrete valuation ring and its homomorphic images, in every rank `3≤n≤∞`. In the D1–D3 convention of §13.2 this is the discrete-valuation-ring case of Theorem 1 of van der Kallen–Maazen–Stienstra; their §2.2 identifies the equivalent symbol relations used by Dennis and Stein. Weibel states the resulting local presentation directly. The isomorphism sends `D(r,s)` to the explicit Dennis–Stein word, so it identifies the generator map, not an unspecified abstract group isomorphism. No invertibility of 2 or 3, no residue-field size bound, and no ring section of `ℤ_(p)→𝔽_p` is assumed. (Dennis–Stein, *`K₂` of discrete valuation rings*, Theorems 2.3 and 2.5, as reported in their survey, §12, pp.253–254; van der Kallen–Maazen–Stienstra, §2.2 and Theorem 1, pp.934–935; Weibel, Theorem III.5.11.1(a), p.226.)

`ℤ_(p)` is the localization of `ℤ` at `(p)`; its residue field `𝔽_p` has fewer than four elements, so §13.5 does not apply.

**Checks.**

- `D(−1,−2)={−1,−1}≠0` in `K₂(ℤ_(2))`, since the real sign symbol of §12.5 detects it through `ℤ_(2)⊂ℝ`.
- In `K₂(ℤ_(2)), {27,13}=D(−2,13)=3·D(−2,1)=0`, because D2 at `r=−2` makes `s↦D(−2,s)` multiplicative in `1+2s` and `27=3³`. Matsumoto's unit relations cannot reach this identity in a group like `US(ℤ_(2))` (van der Kallen 1977, Remark 8.7, p.512).
- The transfer applies to `ℤ/4` only through this base case, because `ℤ/4` has characteristic 4.

*Needs (DVR base presentation):* [absolute presentation group](#ds-groups); §§0.3, 13.1–13.2.

### 13.7 The relative Steinberg group and relative `K_2` of an ideal

For a ring `R` and a two-sided ideal `I`, let `R ⊕ I` be the double ring with multiplication `(r, x)(s, y) = (rs, ry + xs + xy)`, with `pr(r, x) = r` and `add(r, x) = r + x`. `St′(R, I)` is the normal subgroup of `St(R ⊕ I)` generated by the `x_ij(0, v), v ∈ I`; it is the kernel of `St(pr)`. The relative Steinberg group `St(R, I)` is the quotient of `St′(R, I)` by the normal subgroup generated by the cross-commutators `[x_ij(0, u), x_kl(v, −v)], u, v ∈ I` (Keune and Loday's definition). `St(add)` induces `St(R, I) → St(R)`, whose image is the normal subgroup generated by the `x_ij(v), v ∈ I`, and whose composite with `St(R) → E(R)` lands in `E(R, I)`. `K₂(R, I)` is the kernel of `St(R, I) → E(R, I)`. For `s ∈ I` and `r` commuting with `s` with `1 − rs` a unit, the relative Dennis-Stein symbol `⟨r, s⟩ ∈ K₂(R, I)` is the class of the Dennis-Stein word of `((r, 0), (0, s))` in `St(R ⊕ I)`; it lies in `St′(R, I)` because pr sends it to `⟨r, 0⟩ = 1`, and add sends it to `⟨r, s⟩ ∈ K₂(R)`. `K₂(R, I)` fits into the exact sequence `K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I)` of Theorem III.5.7.1. For `r ∈ I` and `s ∈ R` commuting with `r`, the relative symbol `⟨r, s⟩` is the class of the Dennis–Stein word of `((0, r), (s, 0))`; for commutative `R` with `r` and `s` both in `I` the two definitions agree (§13.9). Its identification with `π₂` of the homotopy fibre of `K(R) → K(R/I)` (GeneralAlgebraicKTheory §8.1) is §13.8. (Weibel, III.5.7, p. 222; Weibel, III.5.7.1, p. 223; Weibel, III.5.11, p. 226; Weibel, IV.1.11, p. 268.)

`R` is an associative unital ring and `I` a two-sided ideal; `E(R, I), GL(I)` and `K₁(R, I)` are those of KTheoryLowDegrees Layer 9. For the relative symbol: `s ∈ I, r ∈ R` commutes with `s`, and `1 − rs` is a unit of `R`.

Provide the following API.

- `K2.RelSteinberg`: `St(R, I)`: the normal closure of the `x_ij(0, v)` in `St(R ⊕ I)`, modulo the cross-commutators `[x_ij(0, u), x_kl(v, −v)]`.
- `K2.RelSteinberg.add`: The homomorphism `St(R, I) → St(R)` induced by add.
- `K2.RelSteinberg.range_add`: Its range is the normal subgroup of `St(R)` generated by the `x_ij(v), v ∈ I`.
- `K2.relK2`: `K₂(R, I)`, the kernel of `St(R, I) → E(R, I)`.
- `K2.relK2.toK2`: The map `K₂(R, I) → K₂(R)`.
- `K2.relK2.exact`: Exactness of `K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I)` (Theorem III.5.7.1).
- `K2.relK2.map`: A ring homomorphism `f : R → R'` with `f(I) ⊆ I'` induces `K₂(R, I) → K₂(R', I')`, with `map_id` and `map_comp`.
- `K2.relK2_bot`: `K₂(R, ⊥)` is trivial.
- `K2.relDennisStein`: For `s ∈ I, r` commuting with `s` and `1 − r s` a unit, the relative symbol `⟨r, s⟩ ∈ K₂(R, I)`.
- `K2.toK2_relDennisStein`: relK2.toK2 `⟨r, s⟩ = ⟨r, s⟩`.

**Checks.**

- For `I = 0`, St′(R, 0) is generated by `x_ij(0, 0) = 1`, so `St(R, 0)` and `K₂(R, 0)` are trivial.
- For `R = ℤ/4` and `I = 2ℤ/4: K₂(ℤ/2) = 1` (§0.4), so by exactness `K₂(ℤ/4, I) → K₂(ℤ/4)` is onto, and the relative symbol `⟨2, 2⟩` maps to `⟨2, 2⟩ = {−1, −1}`.
- For `I = R` the range of `St(R, R) → St(R)` is all of `St(R)`, and for `I = 0` it is trivial.

*Needs:* §0.3; §13.1; KTheoryLowDegrees Layers 9 and 13; GeneralAlgebraicKTheory Layer 8.

**The double-ring description of relative `K₂`.** For every unital ring `R` and two-sided ideal `I`, write `B = R ⊕ I` for the double and `J = 0 ⊕ I = ker(pr)`. The ring map `(a, x) ↦ (a, a + x)` embeds `B` in `R × R`, so a matrix over `B` is the identity exactly when its pr- and add-images are. Hence an element `y` of `St′(R, I)` lies in `K₂(B)` exactly when `add(y)` maps to 1 in `E(R)`. Put `K₂′(R, I) = ker(K₂(pr) : K₂(B) → K₂(R))`, and let `C` be the subgroup generated by the cross-commutators. The cross-commutators lie in `K₂(B)`, which is central in `St(B)`, so the normal subgroup they generate is `C`. Therefore `K₂(R, I) = K₂′(R, I)/C`, the forgetful map `K₂(R, I) → K₂(R)` is induced by `K₂(add)`, and `K₂(B) = K₂(R) ⊕ K₂′(R, I)` because pr is split by `a ↦ (a, 0)`. (Own argument from Weibel, Definition III.5.7, p. 222, and §0.3's stable centrality. For commutative `R` whose double has many units, van der Kallen 1989, §6, p.512, records the symbol form of this description and attributes it to Keune: `K₂(R, I)` is `K₂` of the double modulo the diagonal symbols and the symbols between the two kernels' unit groups.)

`R` is associative and unital and `I` is two-sided; no commutativity and no radical hypothesis is used.

Provide the following API.

- `K2.relK2EquivDoubleQuotient`: `K₂(R, I) ≃ K₂′(R, I)/C`, compatible with `K2.relK2.toK2` and `K₂(add)`.
- `K2.crossCommutator_mem_K2`: every cross-commutator `[x_ij(0, u), x_kl(v, −v)]` lies in `K₂(B)` and in `K₂′(R, I)`.
- `K2.K2Double_split`: `K₂(B) ≃ K₂(R) × K₂′(R, I)` through `K₂(pr)` and the section `a ↦ (a, 0)`.
- `K2.idealDouble`: for commutative `R`, the model `R ×_{R/I} R` of the double as the subring of `R × R` where the coordinates agree modulo `I`; `(r, x) ↦ (r, r + x)` identifies `R ⊕ I` with it.

**Checks.**

- For `I = 0, B ≅ R, K₂′(R, 0) = 0` and `C = 1`.
- For `I = R`, the embedding identifies `B` with `R × R, J` with `0 × R` and the cross elements `(v, −v)` with `(v, 0)`. `St(R × R) = St(R) × St(R)` makes every cross-commutator trivial, and `K₂(R, R) = K₂′(R, R) = 0 × K₂(R) ≅ K₂(R)`.
- The embedding test fails for the first coordinate alone: `x₁₂(0, u)` has trivial pr-image but is not in `K₂(B)` for `u ≠ 0`, since its add-image `e₁₂(u)` is not the identity.
- Dictionary with the symbol form (van der Kallen 1989, §6, p.512), for commutative `R`: under `(a, x) ↦ (a, a + x)` the section `a ↦ (a, 0)` becomes the diagonal `r ↦ (r, r)`, the units `1 + K` become the pairs `(r, 1)` and the units `1 + J` the pairs `(1, s)`, with `r, s ∈ 1 + I`. For `k ∈ K` and `j ∈ J` one has `kj = 0` and `1 + k + j = (1 + k)(1 + j)`, so with `s = −j(1 + k)⁻¹ ∈ J` the unit formula of §13.1, D2 in the first variable (through D1) and `D(1, s) = {1, 1 − s} = 0` give `{1 + k, 1 + j} = D(1 + k, s) = D(k, s)`, a cross symbol. So killing the symbols `{(r, 1), (1, s)}` is the quotient by `C`, and, when `K₂(R)` is generated by Steinberg symbols (as in the many-units setting of the source), killing the diagonal symbols removes the summand `K₂(R)`; killing only one of the two families leaves `K₂′(R, I)` or `K₂(B)/C` instead.

*Needs:* §0.3; KTheoryLowDegrees §9.1.

**Cross classes are Dennis–Stein symbols.** If `a` and `b` in a ring satisfy `ab = ba = 0`, then `[x_ij(a), x_ji(b)] = D(−b, −a)` for all `i ≠ j`, and `[x_ij(a), x_kl(b)] = 1` for every other pair `(k, l)`. In the double, `(0, u)(v, −v) = 0 = (v, −v)(0, u)`. Hence for commutative `R` the group `C` is generated by the symbols `D((0, u), (v, −v))` with `u, v ∈ I`, up to sign. With `rs = 0` the unit `1 − rs` is 1 and `h_ij(1) = 1`, so the word of §13.1 is `D(r, s) = [x_ji(−s), x_ij(−r)]`; index independence then gives the first formula, and the Steinberg relations give the others, whose coefficients are `ab = 0` or `ba = 0`. (Own computation from §13.1.)

`a` and `b` are elements of a ring with `ab = ba = 0`; for the symbol identification the ring is commutative, as in §13.2.

**Checks.**

- In `GL₂, e₁₂(a)e₂₁(b)e₁₂(−a)e₂₁(−b) = 1` when `ab = ba = 0`, while for `a = b = 1` over `ℤ` it is the matrix with rows `(3, −1)` and `(1, 0)`.
- Over `ℤ[ε], [x₁₂(ε), x₂₁(ε)] = D(−ε, −ε) = −D(ε, ε)`, using `D(x, −y) = −D(x, y)` for `xy = 0` (from D2) and D1. By §13.13 this is the nonzero class of `K₂(ℤ[ε], (ε)) ≅ ℤ/2`, so cross-type commutators need not vanish.
- [x₁₂((0, u)), x₂₃((v, −v))] = x₁₃(0) = 1: the configurations sharing one index contribute nothing.

*Needs:* §13.1; §13.2.

### 13.8 Relative Steinberg `K₂` and the homotopy fibre

For an ideal `I` of a unital ring `A`, use the augmented double `A⋉I` with multiplication `(a,x)(b,y)=(ab,ay+xb+xy)`, projections `p(a,x)=a` and `q(a,x)=a+x`. `St(A,I)` is `ker St(p)` modulo the normal closure of the cross-commutators `[x_ij(0,u),x_kl(v,−v)]` with `u,v∈I, i≠j` and `k≠l`. The q-map gives `St(A,I)→E(A,I)`; its kernel is classical relative `K₂(A,I)`. Write `K(A,I)=fib(K(A)→K(A/I))` for GeneralAlgebraicKTheory §8.1's relative space and `Ξ_A:K₂(A)≃π₂K(A)` for the comparison of §4.5. The theorem is the Keune–Loday comparison: a natural isomorphism `Φ:K₂(A,I)≃π₂K(A,I)` under which the forgetful maps to `K₂(A)` correspond through `Ξ_A`. Its inverse composed with the homotopy boundary defines `K₃(A/I)→K₂(A,I)`, so the segment `K₃(A)→K₃(A/I)→K₂(A,I)→K₂(A)→K₂(A/I)→K₁(A,I)` is exact; the last map is the classical boundary with the sign of KTheoryLowDegrees §13.4. The map `Φ` is constructed below for every pair and proved bijective for split radical pairs. For an arbitrary pair, bijectivity is equivalent to the double-excision statement below, whose published Keune–Loday input is stated below. (Weibel, Definition III.5.7, p. 222, and IV.1.11, p. 268; van der Kallen 1978, §1, p.307; Levine, §2.1, pp.289–290.)

`A` is unital and `I` is two-sided. Commutativity is imposed only for the split radical case and the symbol calculations below. The cross-commutator subgroup is normally generated; the four indices need not be pairwise distinct.

Provide the following API.

- `K2.relK2PlusMap`: `Φ`, natural for maps of pairs.
- `K2.relK2PlusMap_forget`: the projection `π₂K(A,I)→π₂K(A)` composed with `Φ` equals `Ξ_A` composed with `K2.relK2.toK2`.
- `K2.relK2PlusEquiv`: `Φ` is bijective (Keune–Loday).
- `K2.relK2_exact_K3`: exactness of the six-term segment above with the transported boundary.

**Checks.**

- For `I=0` the relative Steinberg group and relative `K₂` are zero, and `K(A,0)` is contractible.
- For `I=A` the forgetful map is the identity of `K₂(A)` (§13.7), `K(A,A)=fib(K(A)→K(0))` has `π₂=K₂(A)`, and `Φ` is `Ξ_A`.
- A degree-one fibre comparison or excision claim does not prove this degree-two comparison. For `ℤ/4→𝔽₂` there is no ring section, and the boundary from `K₃(𝔽₂)≅ℤ/3` into `π₂K(ℤ/4,(2))` is not forced to vanish by any degree-one statement.

*Needs:* §4.5; §13.7; KTheoryLowDegrees §9.1; KTheoryLowDegrees §§13.3–13.5; GeneralAlgebraicKTheory §8.1.

**Split radical pairs.** Let `A` be commutative and `I⊆Jac(A)` an ideal such that `π:A→A/I` has a ring section `σ`. Then the forgetful map `K₂(A,I)→K₂(A)` is injective with image `ker(K₂(A)→K₂(A/I))`. The long exact sequence of `K(A,I)` splits, so `π₂K(A,I)→π₂K(A)` is injective with image `ker(π₂K(A)→π₂K(A/I))`, and both boundaries `K₃(A/I)→π₂K(A,I)` and `K₂(A/I)→π₁K(A,I)` vanish. Hence `Φ` is bijective. Proof: `ψ(a)=(σπ(a),a−σπ(a))` is a ring map `A→A⋉I` with `q∘ψ=id` and `p∘ψ=σπ`. It is a map of pairs `(A,I)→(A⋉I,J)`, so `ψ_*` carries `ker K₂(π)` into `K₂′(A,I)` and `q_*∘ψ_*=id`. For the other composite, `K₂′(A,I)=ker(K₂(A⋉I)→K₂(A))` is generated by the symbols `D(b,j)` with `b∈A⋉I` and `j∈J`. This is Dennis–Stein's theorem for the commutative ring `A⋉I` and its ideal `J`, which lies in `Jac(A⋉I)` because `I⊆Jac(A)`. The map `ψ∘q` fixes `J` pointwise and moves `b` by an element `k` of `K=ker(q)`. Since `jk=0`, D2 and D1 give `D(b+k,j)=D(b,j)−D(j,k)`, and `D(j,k)` is a cross class (§13.7). Thus `ψ_*∘q_*` is the identity on `K₂′(A,I)/C=K₂(A,I)`. (Own argument; Dennis–Stein 1973, Theorem 2.1, p.287, with proof pp.287–290; GeneralAlgebraicKTheory §8.1.)

`A` is commutative, `I⊆Jac(A)`, and `σ` is a unital ring homomorphism with `π∘σ=id`. The radical hypothesis is used only through Dennis–Stein's generation theorem.

Provide the following API.

- `K2.relK2.toK2_injective_of_split`: injectivity of the forgetful map.
- `K2.relK2.range_toK2_of_split`: its image is `ker(K₂(A)→K₂(A/I))`.
- `K2.relK2PlusEquiv_of_split`: `Φ` is bijective, with both boundaries zero.

**Checks.**

- For `A=k[ε]` and `I=(ε), σ` is the inclusion `k→k[ε]`. Both groups are van der Kallen's group of §13.13; for `k=ℤ` it is `ℤ/2`, generated by `D(ε,ε)`.
- The image is the kernel, not all of `K₂(A)`: for `A=ℚ[ε]` the class `{−1,−1}`, from `K₂(ℚ)⊂K₂(ℚ[ε])`, maps to `{−1,−1}≠0` in `K₂(ℚ)` (real sign, §12.5), so it is not in the relative image.
- The conclusion does not depend on `σ: Φ` and the forgetful map are defined without `σ`, which enters only the proof. For `A=k[x,y]/(x²,xy,y²)` and `I=(y)`, the maps `x↦x` and `x↦x+y` are two different sections of `A→k[x]/(x²)`; they give different maps `ψ` but the same injective forgetful map and the same image.

*Needs:* §13.7; §4.5; [generation](#ds-generation); GeneralAlgebraicKTheory §8.1; Mathlib `Ideal.jacobson`.

**The comparison map for an arbitrary pair.** For every unital `A` and two-sided `I`, the pair map `q:(A⋉I,J)→(A,I)` induces `π₂K(A⋉I,J)→π₂K(A,I)`. The source is `K₂′(A,I)` through `Ξ`, since `p` is split, and the composite kills `C`. A cross class is the image of the class of `[x_ij(a),x_ji(b)]` for the split pair `(ℤ[a,b]/(ab),(a))` under `a↦(0,u), b↦(v,−v)`. Composed with `q`, this ring map factors through `b↦0`, that is, through the split pair `(ℤ[a],(a))`, where the commutator becomes `[x_ij(a),x_ji(0)]=1`. This defines `Φ` on `K₂′(A,I)/C=K₂(A,I)`. Naturality follows from naturality of `Ξ` and of the double, and compatibility with the forgetful maps follows from `q∘(a↦(a,0))=id`. (Own argument from §13.7 and GeneralAlgebraicKTheory §8.1.)

`A` is associative and unital, `I` is two-sided; the ring `ℤ[a,b]/(ab)` maps to `A⋉I` because `(0,u)` and `(v,−v)` commute with product zero.

**Checks.**

- For `A=ℤ[ε], I=(ε)`, the relative class `⟨ε,ε⟩`, the class of `D((ε,0),(0,ε))`, is sent by `Φ` to a class whose image in `K₂(ℤ[ε])` is `D(ε,ε)≠0` (§13.13), while the cross class `D((0,ε),(ε,−ε))` is sent to zero. `Φ` kills the cross classes, not every double class with both entries over `I`.
- For `I=0` the double is `A` and `Φ` is the zero map between zero groups.
- For a split radical pair, `Φ` is the map of the preceding target.

*Needs:* §13.7; §4.5; GeneralAlgebraicKTheory §8.1.

**Double excision in degree two.** For every unital `A` and two-sided `I`, the map `q_*:π₂K(A⋉I,J)→π₂K(A,I)` is onto, and its kernel is generated by the cross classes. Equivalently, `Φ` is bijective. This is the degree-two case of excision for the double square: the birelative fibre of `A⋉I` over its two ideals `J` and `K` has vanishing `π₁`, and its `π₂` maps onto the subgroup generated by the classes `D(j,k), j∈J, k∈K`. Use the published Keune–Loday identification of the relative Steinberg group with the degree-two homotopy-fibre group, with its natural map from the double; this gives the stated quotient by cross classes. GeneralAlgebraicKTheory §10.12 supplies only the analogous result in degrees at most one and is not the degree-two input. (Weibel, IV.1.11, p.268; van der Kallen 1978, §1, p.307, citing Keune, *The relativization of `K₂`*, J. Algebra 54 (1978), 159–177, and Loday, *Cohomologie et groupe de Steinberg relatifs*, ibid., 178–202.) The split radical case above does not use this input. The rings `k[ε]` and `k[t]/(tⁿ)`, at which the downstream consumer RefinedTraceMethods compares boundary maps, are split radical, so that consumer needs only the split case.

`A` is associative and unital; `I` is two-sided. `J=ker(p)` and `K=ker(q)` satisfy `J∩K=0` and `JK=KJ=0`.

**Checks.**

- For `I=0` and for `I=A` both maps are isomorphisms with trivial kernel, matching `C=1` in both cases (§13.7).
- In degree one the corresponding map is an isomorphism (KTheoryLowDegrees §13.5). In degree two `q_*` kills every cross class, so the statement is a description of the kernel, not injectivity; a proof that ends with injectivity of `q_*` proves too much whenever a cross class is nonzero.
- Surjectivity is the part that sees `K₃(A/I)`: for split pairs `q∘ψ=id` makes it automatic, while for `ℤ/4→𝔽₂` it must account for the image of `K₃(𝔽₂)≅ℤ/3`.
- Degree-two excision is not an injectivity statement, even for an ideal `N` with `N = N²`, the condition for absolute excision in degree one (Weibel, IV.1.11.1, p.268): van der Kallen 1984, §2, p.176, gives a commutative ring `R`, a direct limit of the rings `ℤ[T,ε]/(T^(2^r),ε²)`, with such an ideal `N`, for which `K₂(ℤ⊕N, N) → K₂(R, N)` is not injective; the kernel element is a product of two relative symbols, detected by a Chern class into `Ω²`. A double-excision proof must therefore produce the cross-class description of the kernel, not a vanishing statement.

*Needs:* §13.7; GeneralAlgebraicKTheory §§8.1, 10.12; KTheoryLowDegrees §13.5.

### 13.9 Presentation of relative `K₂` for an ideal in the Jacobson radical

Theorem III.5.11.1(b). Let `I` be an ideal contained in the Jacobson radical of a commutative ring `R`. Then `K₂(R, I)` is the abelian group generated by the relative Dennis-Stein symbols `⟨r, s⟩` with `r ∈ R` and `s ∈ I`, or `r ∈ I` and `s ∈ R`, subject only to (D1), (D2) when `r∈I` or both `s,t∈I`, and (D3) when `r∈I` or `s∈I` or `t∈I`. Every displayed pair must be a relative generator. For such pairs `1 − rs` is automatically a unit, since `rs` lies in `I` and so in the Jacobson radical. A generator `⟨r, s⟩` with `s ∈ I` is the class of `D((r, 0), (0, s))` in the double, and one with `r ∈ I` is the class of `D((0, r), (s, 0))`; when `r` and `s` both lie in `I` the two classes agree. This is Keune's Theorem 15; van der Kallen states it in this form and attributes the split case to Maazen and Stienstra. The proof is assembled below from four targets: the equivalence of the two D3 guards in the literature, generation (Dennis–Stein), the reduction of the presentation to the double, and the split radical presentation (Maazen–Stienstra). (Weibel, III.5.11.1(b), p. 227; Weibel, III.5.11, p. 226; Weibel, Exercise III.5.14(a), p. 229; van der Kallen 1978, §3, p.309; van der Kallen–Maazen–Stienstra, §§2.5–2.6, p.935.)

`R` is a commutative ring and `I ⊆ R` an ideal contained in the Jacobson radical of `R`.

<a id="ds-relative-groups"></a>

The relative presentation group, guarded relations and the guard-equivalence theorem are defined before any presentation isomorphism. The collected isomorphism at the start of this subsection uses [Keune's theorem](#ds-keune); the definitions and generator map below require only §13.2 and §13.7.

Provide the following API.

- `K2.RelDSGen`: The subtype of `R × R` with at least one entry in `I`.
- `K2.relDSRel`: D1 and D2 on relative generators and D3 only for `r ∈ I ∨ s ∈ I ∨ t ∈ I`. The three generator witnesses for D3 are derived from that entry condition, never used as a weaker substitute.
- `K2.relDennisSteinGroup`: FreeAbelianGroup (RelDSGen `I`) modulo AddSubgroup.closure (relDSRel `I`), with the guarded D3 set.
- `K2.relDSRelFirst`, `K2.closure_relDSRelFirst`: the first-input D3 guard and the equality of the two closures (below).
- `K2.subsingleton_relDennisSteinGroup_bot`: `D(R,⊥)` is trivial.
- `K2.relDennisSteinGroup.toRelK2`: For `I ≤` Ideal.jacobson `⊥`, the relative generator map descends through exactly the source-allowed D1–D3 relations.
- `K2.relDennisSteinGroup.toRelK2_surjective`: generation (below), under the standing hypothesis `I⊆Jac(R)`, without a splitting or a residue-field size bound.
- `K2.relDennisSteinGroup.toRelK2_bijective`: Keune's Theorem 15 (below).

**Checks.**

- For `I = 0` the presentation gives the trivial group.
- For `I² = 0` it specialises to §13.12.
- It is asserted for an ideal contained in the Jacobson radical of a commutative ring; scheme-theoretic radicality is not the hypothesis.
- Non-example: `R = F_3[x,y]/(x²,y²), z = xy`, `I = (z), r = x, s = y, t = x+y`. Here `I² = 0` and `I` lies in the Jacobson radical; `rs = st = tr = z` but no entry is in `I`, so this triple is not admitted as relative D3. In the differential detector `I ⊗_R Ω¹_{(R/I)/ℤ} ≅ F_3², ⟨x,z⟩−⟨z,x+y⟩−⟨z,y⟩` has image `(1,1)`, not 0.
- On the actual ring DualNumber (DualNumber (ZMod 3)), use the commutative-ring instances from the regular left and right actions and let `x` be the inner epsilon, `y` the outer epsilon and `I =` (`xy`). The three D3 pairs for `(x,y,x+y)` are admissible but `x, y` and `x+y` are outside `I`; the D3 relation word uses the pairs `(x,xy), (xy,x+y), (xy,y)` and is outside `K2.relDSRel I` as a set of defining relations. Here `y(x+y)=xy`, so the first pair has second entry `xy`.
- For the same ring/ideal, in the basis `xy⊗dx, xy⊗dy` of `I ⊗_R Ω¹_{(R/I)/ℤ}, δ⟨x,xy⟩ = (2,0), δ⟨xy,x+y⟩ = (1,1), δ⟨xy,y⟩ = (0,1)`. This word is outside the additive subgroup generated by the guarded defining relations. The differential proves it: the extra D3 defect is `(1,1) ≠ 0`, while all source-allowed D1/D2/D3 defects vanish.
- For `I = ⊥`, relDennisSteinGroup `I` and relative `K₂` are trivial; the guarded quotient has no spurious nonzero generators.

*Needs (relative definitions and generator map):* §13.2; §13.7; Mathlib `DualNumber`; Mathlib `DualNumber.eps`; Mathlib `Ideal.mul_mem_left`; Mathlib `Ideal.mul_mem_right`.

**Two forms of the D3 guard.** Over a commutative ring `R` with an ideal `I`, let `D₁(R,I)` have the generators, D1 and D2 of `D(R,I)` above, but D3 only when its first input `r` lies in `I`, as in van der Kallen–Maazen–Stienstra. The identity on generators induces `D₁(R,I)≅D(R,I)`. If `s∈I`, D3 with first input `s` reads `D(s,rt)=D(sr,t)+D(st,r)`; applying D1 to `D(rt,s), D(s,rt)` and `D(st,r)` turns it into `D(r,st)=D(rs,t)+D(rt,s)`. The case `t∈I` follows by exchanging `s` and `t`. Every pair that occurs has an entry in `I`. (Own argument; van der Kallen–Maazen–Stienstra, §2.5, p.935; van der Kallen 1978, §3, p.309.)

`R` is commutative; `I` is any ideal, and the equivalence does not use `I⊆Jac(R)`.

**Checks.**

- Over `ℤ[ε]` with `I=(ε)`, the instance `r=1, s=t=ε` gives `D(1,0)=2D(ε,ε)`, that is `2D(ε,ε)=0`. It is listed only in the any-input form, and the equivalence derives it from the first-input form; this matches the order two of `D(ε,ε)` in §13.13.
- The triple `(x,y,x+y)` over `𝔽₃[x,y]/(x²,y²)` with `I=(xy)` has no input in `I` and is excluded by both forms.
- For `I=0` both groups are zero, since `D(r,0)=0` by D2 and `D(0,s)=−D(s,0)` by D1.

*Needs:* §13.2.

<a id="ds-generation"></a>

**Generation.** For commutative `R` and `I⊆Jac(R)`, the relative symbols generate `K₂(R,I)`. By §13.7, `K₂(R,I)=K₂′(R,I)/C`. The ideal `J=0⊕I` of the commutative ring `B=R⊕I` lies in `Jac(B)`, because `1−(a,y)(0,x)=(1,w)` with `w∈I` has inverse `(1,−w(1+w)⁻¹)`. Dennis–Stein's theorem for `B` and `J` shows that `K₂′(R,I)=ker(K₂(B)→K₂(B/J))` is generated by the symbols `D(b,j), b∈B, j∈J`; their symbol `⟨a,q⟩` is `D(−a,q)` in the modern convention of §13.1. For `b=(a,w)` put `k=(−w,w)∈K=ker(q)`, so that `b=(a+w,0)+k`. Since `jk=0`, D1 and D2 give `D(b,j)=D((a+w,0),j)−D(j,k)`, and `D(j,k)` is a cross class. Hence `D(b,j)` is the relative generator `⟨a+w,s⟩` for `j=(0,s)`, modulo `C`. Dennis–Stein prove their theorem in every rank `n≥2` and the stable group is the colimit, so no stability theorem (in particular no Suslin–Tulenbaev surjective stability) is used. (Dennis–Stein 1973, Theorem 2.1, p.287, with Lemma 2.3, pp.288–289, and reductions 2.4–2.6, p.290; own reduction through §13.7.)

`R` is commutative and `I⊆Jac(R)`. The radical hypothesis is used for `J⊆Jac(B)`, which Dennis–Stein's theorem needs.

**Checks.**

- For `I=0` every generator has a zero entry, and `K₂(R,0)=0`.
- Without the radical hypothesis generation fails: for `R=ℤ` and `I=5ℤ`, an admissible relative pair has `1−rs=±1` and `5∣rs`, so `rs=0` and every relative symbol vanishes, while `K₂(ℤ,5ℤ)→K₂(ℤ)≅ℤ/2` is onto because `K₂(𝔽₅)=0`.
- For `ℤ/4` and `I=(2)`, the generator `⟨2,2⟩` maps to `D(2,2)={−1,−1}`, the generator of `K₂(ℤ/4)` (§13.14).

*Needs:* §13.1; §13.2; §13.7; Mathlib `Ideal.jacobson`.

**Reduction of the presentation to the double.** Let `R` be commutative, `I⊆Jac(R), B=R⊕I, J=0⊕I` and `K=ker(q)`, so that `J⊆Jac(B), J∩K=0` and `JK=0`. Let `C_D` be the subgroup of `D(B,J)` generated by the pairs `((0,u),(v,−v)), u,v∈I`. The map `α:D(B,J)→D(R,I)` induced by `q` kills `C_D`, since its image of a cross pair is `D(u,0)=0`. Define `β:D(R,I)→D(B,J)/C_D` by `β⟨r,s⟩=D((r,0),(0,s))` for `s∈I` and `β⟨r,s⟩=D((0,r),(s,0))` for `r∈I`. Then `β` is well defined and inverse to the map ᾱ induced by `α`. The key identity is `D(j,x+k)=D(j,x)+D(j,k)` for `j∈J, k∈K` and any `x`, which is D2 because `jxk=0`. It shows that the two values of `β` agree modulo `C_D` when `r,s∈I`. For D2 with `r∈I`, the lifted relation produces `(s+t,−rst)`, which differs from `(s+t−rst,0)` by an element of `K`. D2 with `s,t∈I`, D1 and D3 lift exactly, with `(0,r),(s,0),(t,0)` for `r∈I`, `(r,0),(0,s),(t,0)` for `s∈I`, and `(r,0),(s,0),(0,t)` for `t∈I`. Finally `β∘ᾱ` is the identity, because `b` and `(q(b),0)` differ by an element of `K`. (Own argument; van der Kallen 1978, §3, p.309, for the generator correspondence; van der Kallen 1989, §6, p.512, makes the same passage from the double for Steinberg-symbol presentations when the double has many units.)

`R` is commutative and `I⊆Jac(R)`; the guards of `D(B,J)` are those of `D(R,I)` with `J` in place of `I`.

**Checks.**

- For `a,b∈I, D((a,0),(0,b))−D((0,a),(b,0))=−D((0,b),(a,−a))−D((0,a),(b,−b))`, a sum of two cross symbols. Without the quotient by `C_D` the two lifts of `⟨a,b⟩` would differ.
- For D2 with `r∈I` and `s,t∉I` the correction `(rst,−rst)∈K` is needed; for `r∉I` and `s,t∈I` the lift is exact.
- For `I=0` both `D(R,0)` and `D(B,J)/C_D` are zero.

*Needs:* §13.2; §13.7; Mathlib `Ideal.jacobson`.

<a id="ds-split"></a>

**Split radical pairs.** Let `B` be commutative, `L⊆Jac(B)` an ideal, and suppose `B→B/L` has a ring section. Then the generator map `D(B,L)→K₂(B), ⟨b,l⟩↦D(b,l)`, is injective with image `ker(K₂(B)→K₂(B/L))`, and `K₂(B)≅K₂(B/L)⊕D(B,L)`; the same holds in every finite rank `n≥3`. The image statement is the generation theorem above; injectivity is the published split-radical-pair theorem of Maazen–Stienstra, with the same guarded generators and relations. Their theorem includes every commutative split radical pair, not only local or nilpotent pairs. (Maazen–Stienstra, *A presentation for `K₂` of split radical pairs*, `J`. Pure Appl. Algebra 10 (1977), 271–294, as stated in van der Kallen–Maazen–Stienstra, §2.6, Theorem 2, p.935; van der Kallen 1978, §3, p.309.)

`B` is commutative, `L⊆Jac(B)`, and the section is a unital ring homomorphism.

**Checks.**

- For `B=k[ε]` and `L=(ε)` the theorem must agree with van der Kallen's computation (§13.13): `D(ℤ[ε],(ε))≅ℤ/2`, generated by `D(ε,ε)`, and `D(𝔽₂[ε],(ε))=0`.
- For `L=0` the statement is `K₂(B)≅K₂(B)⊕0`.
- The splitting is not decorative: for a nonsplit pair the target `ker(K₂(B)→K₂(B/L))` is only the image of `K₂(B,L)`, and the statement to prove is Keune's theorem below. `ℤ/4` with `L=(2)` is such a pair.

*Needs:* [relative presentation group](#ds-relative-groups); [generation](#ds-generation); §13.2; Mathlib `Ideal.jacobson`.

<a id="ds-keune"></a>

**Keune's theorem: relative Dennis–Stein presentation.** For commutative `A` and `I⊆Jac(A)`, the generator map `D(A,I)→K₂(A,I)` is an isomorphism. Here `D(A,I)` is the guarded group above: generators `D(r,s)` with `r∈I` or `s∈I`; D1 and D2 when all displayed symbols are relative, so D2 needs `r∈I` or both `s,t∈I`; D3 when at least one input `r,s,t` lies in `I`. The map is well defined because each guarded relation lifts to the double, where it holds by §13.2, and the lifts of cross pairs are cross classes. It is onto by the generation target. It is injective because `D(A,I)≅D(B,J)/C_D` (reduction), `D(B,J)≅K₂′(A,I)` (split radical pairs, applied to `B=A⊕I` with the section `a↦(a,0)`), `C_D` maps onto `C` (§13.7), and `K₂(A,I)=K₂′(A,I)/C` (§13.7). These are presentations of the relative group, not just of its image in `K₂(A)`. Only the injectivity half depends on the Maazen–Stienstra input; generation and the relations do not. (Keune, Theorem 15, as stated by van der Kallen 1978, §3, p.309, and by Levine, the unnumbered theorem in §2.1, p.290; van der Kallen–Maazen–Stienstra, §2.6, Theorem 2, p.935.)

`I` is contained in the Jacobson radical, not merely a radical ideal in the scheme-theoretic sense. For the eligible symbols `1−rs` is a unit; an element of `I` is not required to be nilpotent.

**Checks.**

- The guard is checked on `r,s,t`, before their products are formed.
- The square-zero calculations use this guarded presentation.
- For `I=0` there are only zero-entry relative symbols, all zero.

*Needs:* [relative presentation group](#ds-relative-groups); [split radical presentation](#ds-split); [generation](#ds-generation); §13.7 and the reduction to the double above; Mathlib `Ideal.jacobson`.

### 13.10 The relative differential symbol

For commutative `A` and `I⊆Jac(A)`, set `B=A/I` and `Ω=Ω¹_{B/ℤ}`. The relative symbol differential `δ:K₂(A,I)→I⊗_A Ω` is the additive homomorphism specified by `δD(x,r)=x⊗d(r̄)` and `δD(r,x)=−x⊗d(r̄)`, for `x∈I`. It is surjective and natural for maps of pairs. If both entries lie in `I` the two formulas both give zero. On the presentation group `D(A,I)` the formulas respect every guarded relation: D1 is immediate; D2 with `r∈I` uses `d(r̄s̄t̄)=0`, since `r̄=0`; D2 with `s,t∈I` uses `rst⊗dr̄=0`, since the image of `I²` in `I⊗_A Ω` is zero; D3 with `r∈I` is the Leibniz rule for `d(s̄t̄)`; and D3 with `s∈I` gives `−st⊗dr̄` on both sides once `d(r̄t̄)=r̄dt̄+t̄dr̄` is expanded, with `t∈I` symmetric. The map is transported to `K₂(A,I)` through Keune's theorem (§13.9), so for a general `I⊆Jac(A)` it depends on the Maazen–Stienstra input there. For `A=k[ε]` and `I=(ε)` it is obtained without that input from van der Kallen's computation (§13.13). (Weibel, Exercise III.5.14(a)–(b), pp. 229–230; van der Kallen 1971, The unnumbered theorem and corollary, p.1204, with proof pp.1205–1207; own verification of the relations.)

`A` is commutative; `I⊆Jac(A)`. The tensor product is over `A` via `A→B` on `Ω`. For `x,y∈I`, `(xy)⊗ω=x⊗(yω)=0` because `I` annihilates `Ω`; thus the image of `I²` in `I⊗_A Ω` vanishes. The abstract tensor product `I²⊗_A Ω` need not vanish. The base of differentials is `ℤ`.

Provide the following API.

- `relativeSymbolDifferential`: The unique additive map with the two displayed generator formulas.
- `relativeSymbolDifferential_left`: `δD(x,r)=x⊗d(r̄)` for `x∈I`.
- `relativeSymbolDifferential_right`: `δD(r,x)=−x⊗d(r̄)` for `x∈I`.
- `relativeSymbolDifferential_surjective`: Every `x⊗d(b)` has a preimage `D(x,lift b)`.
- `relativeSymbolDifferential_natural`: For a ring map `f:A→A′` with `f(I)⊆I′, δ′K₂(f)= (f_I⊗Ω(f̄))δ`, compatibly with identities and composites.

**Checks.**

- For `k=ℚ(t), A=k[ε]/ε³, I=(ε)`, the abstract tensor product `I²⊗_A Ω¹_{k/ℤ}≅k·dt` is nonzero, but its map to `I⊗_A Ω¹_{k/ℤ}` is zero.
- For `A=ℚ[t][ε]/ε², I=(ε), δD(ε,t)=dt≠0` under `I⊗Ω_{ℚ[t]/ℤ}≅Ω_{ℚ[t]/ℤ}`.
- In the same pair, `δD(t,ε)=−dt`; omitting the relative-order sign fails this.
- `δD(aε,bε)=0` for all `a,b`; this does not assert `D(aε,bε)=0`.
- For `A=𝔽₃[x,y]/(x²,y²), I=(xy)`, the output-only D3 guard produces the nonzero defect `(1,1)` described above.

*Needs:* §13.9; Mathlib `KaehlerDifferential`; Mathlib `KaehlerDifferential.D`.

### 13.11 The square-zero kernel of the differential

If `I²=0` in a commutative ring `A`, then `I⊆Jac(A)`, and `ker δ` is exactly the subgroup `S` generated by the symbols `D(x,y), x,y∈I`. Consequently `K₂(A,I)/S≅I⊗_A Ω¹_{(A/I)/ℤ}`. Even when 2 is invertible, `S` need not vanish for a general square-zero ideal. (Weibel, Exercise III.5.14(a)–(b), pp. 229–230.)

`A` is commutative and `I²=0`; no hypothesis on 2 is needed. The inclusion `S⊆ker δ` and the surjectivity of `δ` use only the generator formulas. The inverse `I⊗_A Ω→K₂(A,I)/S, x⊗db̄↦D(x,b)`, is well defined on the presentation group and is transported through Keune's theorem (§13.9), so the equality `ker δ=S` depends on the Maazen–Stienstra input there, except for the dual numbers, where §13.13 gives it directly.

**Checks.**

- For `A=ℚ[t][ε]/ε²` and `I=(ε)`, the inverse sends `ε⊗dt` to `D(ε,t)` modulo `S`. Replacing `t` by `t+cε` changes that symbol by `D(ε,cε)∈S`, so the inverse is independent of this lift. Its `δ-image` remains `dt≠0`.
- For `A=ℚ[ε]/ε²` and `I=(ε)`, the tensor target is zero and §13.13 gives `K₂(A,I)=0`, so `S=0` in this instance.
- For `A=ℚ[x,y]/(x,y)²` and `I=(x,y)`, the tensor target is zero, but `D(x,y)≠0`. Write `r=r₀+rₓx+rᵧy` and define `ΛD(r,s)=rₓsᵧ−rᵧsₓ` in `ℚ` on relative generators. This respects D1; in D2 either `r₀=0` or `s₀=t₀=0`, so the correction term contributes zero; the Leibniz expansion of D3 cancels in pairs. Thus `Λ` is a homomorphism on `D(A,I)`, and `ΛD(x,y)=1` detects a nonzero element of `S` even though 2 is invertible. Square-zero alone cannot replace the principal dual-number hypothesis in §13.13.

*Needs:* §13.2; §13.10; Mathlib `TrivSqZeroExt`.

### 13.12 Square-zero ideals: the simplified relations and the source's test values

Let `A` be a commutative ring and `I` an ideal with `I² = 0`; the test instance is `A = TrivSqZeroExt R M` (`R` commutative, `M` an R-module) with `I = TrivSqZeroExt.kerIdeal R M`, whose square is zero. Then `I` is contained in the Jacobson radical; every `⟨a, s⟩` with `a ∈ A, s ∈ I` is defined, since `1 − as` has inverse `1 + as`; `⟨s, a⟩ = ⟨a, s⟩⁻¹`; and `s ↦ ⟨a, s⟩` is additive on `I`, because the term `ast` of (D2) lies in `I² = 0`. So by §13.9, `K₂(A, I)` is generated by the `⟨a, s⟩` with `a ∈ A` and `s ∈ I`. The source's test values, all stated as exercises, are: a surjection `K₂(A, I) → I ⊗_A Ω¹_{A/I}, ⟨x, r⟩ ↦ x ⊗ dr`, for any ideal contained in the Jacobson radical (Ex. III.5.14(a)); for `I² = 0` its kernel is generated by the `⟨x, y⟩` with `x, y ∈ I` (Ex. III.5.14(b)); for the dual numbers `R[ε]` with `1/2 ∈ R` the map `K₂(R[ε], ε) → Ω¹_R` is an isomorphism (van der Kallen, Ex. III.5.14(c)); and `K₂(ℤ/2ⁿ) ≅ K₂(ℤ/4) ≅ {±1}` for `n ≥ 2`, on `{−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩` (Ex. III.5.13). These test the relative theory, and GeneralAlgebraicKTheory Layer 8's relative `K₂` through §13.8; `TrivSqZeroExt R M→R` is split by `r↦(r,0)` and its kernel is square-zero, so the split radical case of §13.8 applies without the double-excision input. They extend no field presentation to a general ring. (Weibel, III.5.11.1(b), p. 227; Weibel, Exercise III.5.14(a), p. 229; Weibel, Exercise III.5.14(b),(c), p. 230; Weibel, Exercise III.5.13, p. 229.)

`A` is a commutative ring and `I ⊆ A` an ideal with `I² = 0` (Theorem III.5.11.1(b) needs `A` commutative). The test ring is Mathlib's `TrivSqZeroExt R M` with `I = TrivSqZeroExt.kerIdeal R M`, for `R` commutative and `M` an R-module with the central bimodule structure, so that `TrivSqZeroExt R M` is commutative.

**Checks.**

- For `I = 0` the relative group is trivial.
- For `s, t ∈ I, ⟨a, s⟩⟨a, t⟩ = ⟨a, s + t⟩`.
- For `A = ℤ/4` and `I = 2ℤ/4: I² = 0` and `Ω¹` of `𝔽₂` is 0, so by Ex. III.5.14(a),(b) `K₂(ℤ/4, I)` is generated by `⟨2, 2⟩`, which maps to `{−1, −1}` in `K₂(ℤ/4)`.
- For the dual numbers, `K₂(ℚ[ε], ε) ≅ Ω¹` of `ℚ = 0`, while `K₂(ℚ(t)[ε], ε) ≅ Ω¹` of `ℚ(t) ≠ 0 (⟨ε, t⟩ ↦ dt)`, by the van der Kallen isomorphism of Ex. III.5.14(c) as cited.
- No presentation of `K₂` of a general ring is claimed.

*Needs:* §13.2; §13.7; §13.9; Mathlib `TrivSqZeroExt`; Mathlib `TrivSqZeroExt.commRing`; Mathlib `TrivSqZeroExt.kerIdeal`; Mathlib `TrivSqZeroExt.kerIdeal_sq`; Mathlib `TrivSqZeroExt.isUnit_iff_isUnit_fst`; GeneralAlgebraicKTheory Layer 8.

### 13.13 Relative `K₂` of dual numbers: van der Kallen's module and the case of two invertible

For every commutative ring `R`, let `A=R[ε]/ε²` and `I=εR`. Let `M_R` be the quotient of the free R-module on symbols `Db`, `b∈R`, by the R-submodule generated by `D(ab)−aDb−bDa, D(a+b)−Da−Db−F(ab)` and `F(a+b)−Fa−Fb`, where `F(a)=D(1+a)−Da`. Then `K₂(A,I)≅M_R` as abelian groups. The isomorphism sends `aDb` to `N(a,b)=D(−b,aε)+D(−abε,abε)`, and hence `F(c)` to `D(−cε,ε)`; in van der Kallen's notation `N(a,b)=H(a,b)H(ab,−1)` with `H(a,b)=[x_ij(b),x_ji(aε)]x_ij(ab²ε)`. In `M_R` one has `F(c²a)=cF(a)` and `F(2a)=0`. Hence, **when `2∈Rˣ`**, `F=0, M_R≅Ω¹_{R/ℤ}` and the module differential `Db↦db` induces `K₂(A,I)≅Ω¹_{R/ℤ}, D(aε,b)↦a db`. This is the only place in the layer where 2 must be invertible. The proof has two halves. Generation: by rearranging words in `St(A)`, every element equals, modulo the classes `N(a,b)`, a normal form whose membership in `K₂` is decided over `R`, so the `N(a,b)` generate `ker K₂(A→R)`. Inverse: the group `G=T×M_R`, with `T` the trace-zero finite matrices over `R` and multiplication twisted by `F` of a bilinear expression in the entries, carries an action of `St(R)`. The map `x_ij(a+bε)↦(be_ij;0)·x_ij(a)` into the semidirect product restricts to an inverse on the kernel. The splitting `A→R` and §13.8's split radical case identify `ker K₂(A→R)` with `K₂(A,I)` and with `π₂` of the homotopy fibre, without the Maazen–Stienstra or double-excision inputs. (van der Kallen 1971, the theorem, corollary and Examples 1–3, pp.1204–1205, proof pp.1205–1207; Dennis–Stein 1973, Remark 3, p.286, for `N(a,b)` as a product of Dennis–Stein symbols, translated to the modern convention by §13.1; Weibel, Exercise III.5.14(c), p. 230.)

`R` is commutative; the isomorphism with `M_R` has no hypothesis on 2, and its identification with `Ω¹_{R/ℤ}` needs `2∈Rˣ`. `A` and `I` are Mathlib's DualNumber, or the equivalent TrivSqZeroExt carrier, and its augmentation ideal.

Provide the following API.

- `K2.vanDerKallenModule`: `M_R`, a quotient of the free R-module on `R` by the three displayed families.
- `K2.dualNumberRelK2Equiv`: `K₂(R[ε],(ε))≃M_R`, with `aDb↦N(a,b)`.
- `K2.vanDerKallenModule_equiv_kaehler`: for `2∈Rˣ, M_R≃Ω¹_{R/ℤ}, Db↦db`, constructed directly on the module quotient.

**Checks.**

- For `R=ℚ[t]`, the class `D(ε,t)` corresponds to `dt` and is nonzero.
- For an odd finite field `R, Ω_{R/ℤ}=0`, hence the relative group is zero.
- For `R=ℤ, M_ℤ≅ℤ/2`, generated by `F(1)`, so the relative group is `ℤ/2`, generated by `D(−ε,ε)=D(ε,ε)`, rather than `Ω_{ℤ/ℤ}=0` (van der Kallen 1971, Example 1); the hypothesis on two cannot be omitted in the `Ω¹` form. For `R=𝔽₂, F(1)=D(0)−D(1)=0` and `M_{𝔽₂}=0`, so `D(ε,ε)` dies in `K₂(𝔽₂[ε])`; a perfect field of characteristic two has `M_R≅Ω¹_{R/ℤ}=0` (Example 3).
- For a field of characteristic two with p-basis `{x_i}`, the elements `Dx_i` and `F(x_{i₁}⋯x_{iₙ})`, with distinct indices and `n≥1`, form a basis of the R-module `M_R`. For `R=𝔽₂(t)`, with p-basis `{t}`, this gives the basis `Dt`, `F(t)`, while `Ω¹_{R/ℤ}` has the one-element basis `dt`; the extra class `F(t)↦D(−tε,ε)` is invisible to `δ` (Example 3).

*Needs (module computation):* §§13.1–13.2; §13.8 (split radical comparison only); [generation](#ds-generation); Mathlib `DualNumber`; Mathlib `DualNumber.eps_mul_eps`; Mathlib `KaehlerDifferential`.

**Differential compatibility.** For commutative `R`, the map from the independent dual-number module computation to `Ω¹_{R/ℤ}`, `Db↦db`, agrees with the general `δ` of §13.10 under `I⊗_A Ω≅Ω`. Its kernel is the image of the double-ideal symbols of §13.11; when `2∈Rˣ` this kernel is zero and the map is the displayed Kähler equivalence. This corollary is constructed after §§13.10–13.11; the module computation above is their independent input in the dual-number case. (Weibel, Exercise III.5.14(a)–(c), pp.229–230; van der Kallen 1971, theorem and corollary, p.1204.)

**Checks.**

- `D(aε,b)` maps to `a db`, with the relative entry first.
- Over `ℤ`, the nonzero class `D(ε,ε)` is killed by the differential.
- Over `ℚ[t]`, `D(ε,t)` survives and maps to `dt`.

*Needs (compatibility corollary):* the module computation above; §§13.10–13.11.

### 13.14 A detector for `K₂` of `ℤ/4`

For `A=ℤ/4`, define `λ` on admissible pairs by `λ(2,2)=λ(2,3)=λ(3,2)=1` in `ℤ/2`, and `λ=0` on the other admissible pairs. It satisfies D1–D3 and therefore induces `K₂(ℤ/4)→ℤ/2` through the local presentation. Its inverse sends 1 to `g=D(3,2)={−1,−1}`, giving `K₂(ℤ/4)≅ℤ/2`. It uses the local presentation of §13.6 in its `residue-field-𝔽₂`, characteristic-4 case, that is, the transfer from `ℤ_(2)`. (Weibel, Exercise III.5.13, p. 229.)

The ring is `ℤ/4`; admissibility means `rs` is even. The source group is the actual local Steinberg kernel via §13.6.

Provide the following API.

- `zmodFourSymbolParity`: The displayed function on `(ℤ/4)²` with values in `ℤ/2`; only admissible pairs define `K₂` generators.
- `zmodFourSymbolParity_relations`: The table satisfies D1–D3 on their exact admissible domains; in `ℤ/4` a unit `u` is exactly an element with `u·u=1`, so the check is a finite computation.
- `zmodFourK2Equiv`: The induced map `K₂(ℤ/4)≃ℤ/2` has inverse `1↦D(3,2)`.
- `zmodFourK2Equiv_generator`: The equivalence sends `{−1,−1}` to 1 and the zero class to 0.

**Checks.**

- `λ(2,2)=1`, so nilpotent double-entry symbols need not vanish.
- `λ(1,2)=λ(2,1)=0`, agreeing with the unit symbol involving 1.
- `λ(3,2)=1` and `D(3,2)={3,3}`; the zero detector would miss this class.
- `(1,1)` is not admissible since `1−1·1=0` is not a unit; its table value is not `a K₂` generator.

*Needs:* §13.2; §13.6.

### 13.15 The uniform dyadic nilpotent example

For every `n≥2`, reduction `ℤ/2ⁿ→ℤ/4` induces an isomorphism `K₂(ℤ/2ⁿ)≅K₂(ℤ/4)≅ℤ/2`, sending `{−1,−1}` to the nonzero class. In contrast `K₂(𝔽₂)=0`. The argument is uniform and uses only the local presentation, the unit-symbol calculus and ClassicalArithmeticCompletion Layer 1’s explicit unit generators. (Weibel, Exercise III.5.13; III.5.10–5.11, pp. 229, 225; the value `ℤ/2` for the Witt vectors `W_n(𝔽₂)=ℤ/2ⁿ, n≥2`, is recorded in Dennis–Stein survey, §12, p.255, from Dennis–Stein 1975, Theorem 4.3.)

`n` is an integer with `n≥2`. Use the local presentation of §13.6; no separate dyadic computation is assumed.

**Checks.**

- Both the uniform upper bound and the reduction detector are proved.
- The order-two argument is used before concluding `2D(−2,2)=0`; nilpotence alone would not justify that step.
- The exclusion `n=1` is required.

*Needs:* §6.4; §6.9; §0.3; §13.2; §13.6; §13.14; ClassicalArithmeticCompletion §1.1.

### Examples

- For `A = ℤ/4` the function `λ` with `λ(2, 2) = λ(2, 3) = λ(3, 2) = 1` satisfies (D1)–(D3) and detects `g = ⟨3, 2⟩ = {−1, −1}`, so `K₂(ℤ/4) ≅ ℤ/2`, while `K₂(𝔽₂) = 0`.
- For every commutative `R, K₂(R[ε], εR) ≅ M_R` (van der Kallen); with 2 invertible `M_R ≅ Ω¹_{R/ℤ}` and `⟨aε, b⟩ ↦ a db`, while `K₂(ℤ[ε], εℤ) ≅ M_ℤ ≅ ℤ/2` is generated by `D(ε, ε)`.
- For commutative `A` and `I ⊆ Jac(A), K₂(A, I)` is generated by relative Dennis–Stein symbols (Dennis–Stein 1973 through the double); for `R = ℤ` and `I = 5ℤ` every relative symbol vanishes although `K₂(ℤ, 5ℤ)` maps onto `K₂(ℤ) ≅ ℤ/2`.

### Dependencies

Layers 2, 4, 6, 7 and 12; GeneralAlgebraicKTheory §§8.1 and 10.12; KTheoryLowDegrees §9.1 and §§13.3–13.5; Dennis–Stein 1973, Proposition 1.1, Theorem 2.1 and Corollary 2.2; ClassicalArithmeticCompletion §1.1; Mathlib `DualNumber`, `TrivSqZeroExt`, `KaehlerDifferential`.

## Downstream consumers

- **K3BlochGroups** consumes the product-normalized degree-three map (§8.4) and the finite-rank symbol refinements. It obtains generic universal extensions and stable `St` directly from StableHomotopyKTheory §3.29 and §0.3.
- **RefinedTraceMethods** consumes §§13.8–13.11 and 13.13: the relative symbols and their generation (§13.9), the split radical fibre comparison (§13.8) and van der Kallen's computation for `k[ε]` (§13.13), none of which uses the Maazen–Stienstra or double-excision inputs; the differential and square-zero kernel for a general square-zero ideal (§§13.10–13.11) use Keune's theorem.
- **MotivicEtaleKTheory** consumes native Milnor K-groups, residues and norms (Layers 5, 9, 10); its field Matsumoto supplier is §0.4. This roadmap uses nothing from it.
- **K2SymbolsBrauerPartII** consumes the native comparison of §7.2, the tame symbols and residues of Layer 9, the localization comparison of Layer 11, the tame kernels of Layer 12, the unit-symbol generation of §6.18 and the product normalization of §§4.1, 8.1 and 8.3. It consumes the prime-to-characteristic global function-field degree-two norm-residue equivalence and completion compatibility of §10.32b. Beyond the function-field adapters in §§10.32a–10.32b, it owns the Galois symbol in Kummer and cup-product form, twist trivialisations and the change-of-root rule, Brauer-valued and cyclic-algebra symbols, the norm-residue and Hilbert symbols as Steinberg symbols with their local-invariant comparison, global reciprocity for symbols of a number field, the transported Tate comparisons and the degree-two étale Chern comparison.
- **ArithmeticKTheory** consumes tame-kernel sequences, `K₂(ℤ)` and `K₂(ℚ)` (Layer 12); the transported Tate comparisons it uses are in K2SymbolsBrauerPartII.
- **EllipticKTheory** and **SchemeKTheoryOperations** consume tame symbols, integral Weil–Suslin reciprocity and the localization comparison (Layers 9–11).
- **KTheoryFiniteLocalFields** consumes the native Milnor ring, last-slot residues, specializations, Bass–Tate exact sequence and generator-independent norms through the [filtered-colimit export contract](#milnor-filtered-colimits) in §10.25. The consumer interface `milnorResidueNorm` must identify its ring, residue and norm maps with §§5.4–5.8, 7.2, 9.11–9.18 and 10.5–10.25 through an adapter, including filtered-colimit compatibility. These native constructions have a single owner here. Its classical field presentation and finite-field `K₂` come from AlgebraicKTheory A5, with §0.4 identifying the root-word conventions; its local Galois-symbol comparisons come from K2SymbolsBrauerPartII.
- **HigherLocalFieldsAndHigherClassFieldTheory** consumes native Milnor K-theory, residues and norms; **SpecialValuesBirchTate** consumes tame kernels; **KatoEulerSystems** consumes symbols and residue compatibility.

## References

- [Weibel] C. A. Weibel, *The K-book: an introduction to algebraic K-theory*, Graduate Studies in Mathematics 145, AMS, 2013 (cited by theorem number and printed page; printed page = PDF page − 8).
- [Bass–Tate] H. Bass and J. Tate, The Milnor ring of a global field, in *Algebraic K-Theory II*, Lecture Notes in Mathematics 342, Springer, 1973, 349–446.
- [Moreno Ramírez] J. J. Moreno Ramírez, *Algunos cálculos de K-grupos algebraicos*, Universidad de El Salvador thesis, 2017, §4.3, Theorem 4.3.22, pp.108–109, and §4.4.1, Lemmas 4.4.1.5–4.4.1.6, pp.112–119; institutional copy https://repositorio.ues.edu.sv/server/api/core/bitstreams/aa0c56ee-f0fe-4025-8d68-f252459f26d1/content.
- [Bass 1971] H. Bass, K₂ des corps globaux, Séminaire Bourbaki 1970/71, exposé 394, 233–255, §9, Theorem 9, https://www.numdam.org/item/SB_1970-1971__13__233_0/.
- [Tate 1976] J. Tate, Relations between K₂ and Galois cohomology, Invent. Math. 36 (1976), 257–274, https://doi.org/10.1007/BF01390012.
- [Milne Tate survey] J. S. Milne, The Work of John Tate, §7.2, p.51, https://www.jmilne.org/math/xnotes/Tate.pdf.
- [Milnor] J. Milnor, *Introduction to Algebraic K-Theory*, Annals of Mathematics Studies 72, Princeton University Press, 1971.
- [Matsumoto] H. Matsumoto, Sur les sous-groupes arithmétiques des groupes semi-simples déployés, Ann. Sci. ÉNS (4) 2 (1969), 1–62, https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf.
- [Steinberg] R. Steinberg, *Lectures on Chevalley Groups*, Yale University notes, 1967.
- [Löh] C. Löh, *Group Cohomology*, lecture notes, Universität Regensburg, 2019, https://loeh.app.uni-regensburg.de/teaching/grouphom_ss19/lecture_notes.pdf.
- [Waldhausen 1985] F. Waldhausen, Algebraic K-theory of spaces, Lecture Notes in Mathematics 1126, 1985, 318–419; author copy https://www.math.uni-bielefeld.de/~fw/LNM1126_318-419.pdf.
- [Weibel 1981] C. A. Weibel, A survey of products in algebraic K-theory, Lecture Notes in Mathematics 854, 1981, 494–517; author copy https://sites.math.rutgers.edu/~weibel/archive/papers-dir/Survey-K-products.pdf.
- [Loday] J.-L. Loday, K-théorie algébrique et représentations de groupes, Ann. Sci. ÉNS (4) 9 (1976), 309–377, https://www.numdam.org/item/ASENS_1976_4_9_3_309_0.pdf.
- [Suslin] A. A. Suslin, Reciprocity laws and the stable rank of polynomial rings, Math. USSR Izv. 15 (1980), 589–623.
- [Gille–Szamuely] P. Gille and T. Szamuely, *Central Simple Algebras and Galois Cohomology*, Cambridge Studies in Advanced Mathematics 101, 2006.
- [Soulé] C. Soulé, *Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres*, thèse, Paris VII, 1978, https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf.
- [Dennis–Stein survey] R. K. Dennis and M. R. Stein, The functor K₂: a survey of computations and problems, in *Algebraic K-Theory II*, Lecture Notes in Mathematics 342, Springer, 1973, 243–280 (§9(a), p.249: the identities (S1)–(S7); §12, pp.253–255: the presentation for discrete valuation rings and their quotients, and K₂ of Witt vectors of length m).
- [Dennis–Stein] R. K. Dennis and M. R. Stein, K₂ of radical ideals and semi-local rings revisited, in *Algebraic K-Theory II*, Lecture Notes in Mathematics 342, Springer, 1973, 281–303.
- [van der Kallen 1977] W. van der Kallen, The K₂ of rings with many units, Ann. Sci. ÉNS (4) 10 (1977), 473–515, https://www.numdam.org/item/ASENS_1977_4_10_4_473_0.pdf.
- [van der Kallen–Maazen–Stienstra] W. van der Kallen, H. Maazen and J. Stienstra, A presentation for some K₂(n, R), Bull. AMS 81 (1975), 934–936, https://webspace.science.uu.nl/~kalle101/maazenStK.pdf.
- [van der Kallen 1984] W. van der Kallen, A note on excision for K₂, in *Algebraic K-Theory, Number Theory, Geometry and Analysis* (Bielefeld 1982), Lecture Notes in Mathematics 1046, Springer, 1984, 173–177, https://webspace.science.uu.nl/~kalle101/ExcisionK_2.pdf (§2, p.176: an idempotent ideal for which degree-two excision fails).
- [van der Kallen 1989] W. van der Kallen, Presenting K₂ with generic symbols, in *Algebraic K-Theory: Connections with Geometry and Topology* (J. F. Jardine and V. P. Snaith, eds.), Kluwer, 1989, 509–516, https://webspace.science.uu.nl/~kalle101/PresentingK_2.pdf (§6, p.512: Keune's passage from a presentation of K₂ of the double to one of relative K₂).
- [van der Kallen 1978] W. van der Kallen, Generators and relations in algebraic K-theory, Proceedings of the International Congress of Mathematicians, Helsinki 1978, 305–310, https://webspace.science.uu.nl/~kalle101/GeneratorsRelations.pdf (§1, p.307: double and relative Steinberg group; §3, pp.308–309: local and relative presentations).
- [Dennis–Stein 1975] R. K. Dennis and M. R. Stein, K₂ of discrete valuation rings, Adv. Math. 18 (1975), 182–238, https://doi.org/10.1016/0001-8708(75)90157-7 (Theorems 2.3, 2.5 and §1; source of the base case ℤ_(p) in §13.6).
- [Keune] F. Keune, The relativization of K₂, J. Algebra 54 (1978), 159–177, https://doi.org/10.1016/0021-8693(78)90024-8 (Theorem 15; §§13.8–13.9).
- [Loday relative] J.-L. Loday, Cohomologie et groupe de Steinberg relatifs, J. Algebra 54 (1978), 178–202, https://doi.org/10.1016/0021-8693(78)90025-X (relative comparison; §13.8).
- [Maazen–Stienstra] H. Maazen and J. Stienstra, A presentation for K₂ of split radical pairs, J. Pure Appl. Algebra 10 (1977), 271–294, https://doi.org/10.1016/0022-4049(77)90007-X (split radical presentation; §13.9).
- [van der Kallen 1971] W. van der Kallen, Le K₂ des nombres duaux, C. R. Acad. Sci. Paris 273 (1971), 1204–1207, https://webspace.science.uu.nl/~kalle101/K2nd1971Gallica.pdf.
- [Morrow] M. Morrow, K₂ of localisations of local rings, J. Algebra 399 (2014), 190–204; author preprint https://arxiv.org/abs/1205.0860 (preprint page numbers).
- [Levine] M. Levine, The indecomposable K₃ of fields, Ann. Sci. ÉNS (4) 22 (1989), 255–344.
- [Stacks] The Stacks Project, https://stacks.math.columbia.edu, cited by tag.
