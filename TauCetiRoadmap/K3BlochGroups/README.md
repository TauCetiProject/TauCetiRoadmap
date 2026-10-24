# Roadmap: explicit K₃ and Bloch groups

**Summary.** Build an integral, functorial description of third algebraic K-theory by Steinberg-group homology, isolate the Milnor image, and construct the map from indecomposable K₃ to the Bloch group with its precise enhanced-torsion kernel. The output includes finite-field comparisons, arithmetic quotient examples, and finite witnesses for symbol relations and zero boundaries. Integral conventions are part of the result: the antisymmetric tensor cokernel, the ordinary exterior square and the negative-unit quotient give different kernels, even over small finite fields.

## Scope and ownership

This roadmap owns the degree-three comparisons, the Bloch presentations and their exact convention maps, the frame and projective-configuration calculations needed for the Suslin map, and the finite-witness interfaces built on them. It does not construct general algebraic K-theory or the analytic dilogarithm. Every occurrence of K₃ refers to Quillen K-theory supplied below, and every abstract isomorphism with a cyclic group is distinguished from a natural comparison map.

The stable general linear and elementary groups GL(A)⊃E(A), with Whitehead's lemma, belong to AlgebraicKTheory A1 and are consumed through the aliases and transported theorem of GeneralAlgebraicKTheory §§3.3–3.4; StableHomotopyKTheory §4.14 gives BGL(A)⁺ its block-sum H-space. The stable Steinberg group St(A), its universal central extension onto E(A) and the identification of the central kernel with K₂(A) belong to AlgebraicKTheory A5, as refined in K2SymbolsBrauer Layers 2 and 4; superperfectness of the source of a universal central extension is StableHomotopyKTheory §3.29 (`uce.source_superperfect`). K2SymbolsBrauer owns Milnor K-theory and its symbol presentation (§§5.4, 5.6, 5.12–5.14), Matsumoto's theorem (§7.2), the graded Milnor-to-Quillen map (§§8.1–8.4), the Bass–Tate sequence of a rational function field (§10.5) and the Bass–Tate signature theorem for number fields (§10.32). The degree-three comparison, its ordered-symbol formula and functorial API are consumed from K2SymbolsBrauer §8.4; this roadmap constructs its cokernel and proves integral injectivity.

AlgebraicTopology, Stages 2–5 and 8, owns singular homology, CW pairs, relative homotopy, product homology with the coefficient-sensitive Künneth sequence, Hurewicz and Whitehead. StableHomotopyKTheory §1.17, `classifyingSpace_filteredColimit_homology`, supplies filtered-colimit homology for every unital coefficient ring, fixed left coefficient module and degree n≥0; §§1.30 and 1.32 compare classifying-space and group homology. The completed UniversalCovers roadmap, Stages 2–3, owns based lifts and the higher-homotopy comparison for actual coverings. StableHomotopyKTheory supplies classifying spaces, plus constructions, fibre comparisons and spectra. These general constructions remain at their owners. The narrow Hopf and stable-unit results required below are targets of §1.5 here, not unstated consequences of a covering-space theorem.

GeneralAlgebraicKTheory §§13.8a–c owns Quillen's finite-field computation (Brauer lifting, the Adams fixed fibre and its homotopy groups), and its §§3.2 and 3.12 identify πₙ(BGL(A)⁺) with Kₙ(A) for n≥1. KTheoryFiniteLocalFields §1.5 owns the restriction, transfer and Frobenius maps on the K-groups of finite fields. ArithmeticKTheory §§3.2–3.4, 4.1–4.4, 5.1, 5.3–5.4 and 8.10 supplies the number-field arithmetic; the Milnor-image and quotient consequences belong here.

Layer 3 owns the shared integral pre-Bloch group, antisymmetric tensor cokernel, boundary, Bloch kernel and their field maps. ColemanIntegration §L2.Fb consumes §§3.1, 3.3–3.5 before its p-adic evaluation and branch descent: its PreBlochGroup and AntisymmetricSquare are aliases of P(F) and Qₛ(F), its preBlochSymbol and boundary are the supplied maps, and its BlochGroup is the same kernel B(F). Its reduced free-symbol presentation is the adapter of §3.4, with evaluation transported to P(F); it does not supply another exported Bloch carrier. The p-adic evaluation, branch descent and projective coordinate transport remain in ColemanIntegration. PolylogarithmFunctions supplies analytic functions and cross-ratios, not these algebraic carriers.

PolylogarithmFunctions owns the interval Rogers function and the Bloch–Wigner function with their analytic identities (the interval function and endpoints are §6.1, reflection is §6.3, the exact interval pentagon is §6.4, and the midpoint value is §6.5). Downstream, Polylogarithms Layer 2 constructs the descended real regulator and compares it with the Borel regulator, and its Layer 4 uses the rational-curve presentation of §4.21. No regulator, dilogarithm or Habiro comparison is used to prove anything in this roadmap.

PolylogarithmFunctions §5.8 owns the field-general projective cross-ratio, its homogeneous comparison, Möbius invariance and five-point normalization, building on `TauCeti.crossRatio_comp_eq_of_sub_eq_div` in `TauCeti/Algebra/Field/LinearFractional.lean`. Section 3.2 transports that cross-ratio to the column coordinates here and takes its reciprocal on distinct tuples. It adds the normalization adapter, the GL₂ triple stabilizer and orbit classification, and the deletion-face formulas for the symbol complex. Tau Ceti's `antisymmetricTensors` in `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean` is the negative eigenspace of the tensor flip. The object here is its cokernel analogue over arbitrary commutative rings; the integral diagonal torsion is essential. Those are distinct objects, and their comparison is asserted only where two is invertible. Cyclic norm-complex homology, Shapiro, transfer and connecting maps are consumed through the contracts below; §4.15 adds their power-map action rather than a second cyclic-homology construction.

Tau Ceti also supplies `TauCeti.groupHomology.indIso_inv` in `RepresentationTheory/Homological/GroupHomology/Shapiro`, `TauCeti.groupHomology.transfer`, `transfer_comp_map_subtype_id` and `map_comp_transfer` in `GroupHomology/Transfer/Basic`, `transfer_trans` in `GroupHomology/Transfer/Trans`, and `δ_naturality` in `GroupHomology/LongExactSequence`. These work over a commutative coefficient ring with actual representations; transfer requires finite-index subgroups. They supply the existing Shapiro, transfer and connecting-map interfaces. The finite-field stable-elements and cyclic/quaternion period calculations require additional results; they are not a second transfer construction.

The normalized positive-characteristic integral K₃-torsion comparison is a consequence proved in §2.2, using SchemeKTheoryOperations §3.6’s integral injection and KTheoryFiniteLocalFields §6.5a’s coefficient comparison. RealAlgebraicGeometry Layer 1 owns real closures, with `TauCeti.RealClosure.exists_realClosure` and `RingPreordering.exists_linearOrder` available at the pin; §5.8 owns the first-order real-closed-field transfer theorem needed beyond its real-number quantifier-elimination scope.

This roadmap also owns the following results, which the general roadmaps cited above do not state; each is specified where it is used. They are the low-degree Hopf calculation and the sphere-unit comparison (§1.5); the degree-three injectivity consequence of KTheoryFiniteLocalFields §§3.0, 3.0a and 6.10, the weight-two degree-zero comparison and the all-prime divisibility of K₄ of an algebraically closed field (§2.2); the unstable SL₂ symbol presentation (§4.5); the cyclic homology maps and homological stability of symmetric groups (§4.15); the π^s_*-module structure and unit splitting of the stable Atiyah–Hirzebruch spectral sequence of a classifying space (§4.16); rigidity under purely transcendental extension and the rational specialization of five-term relations (§4.21); and the finite-group stable-elements, duality and period theorems (§5.2).

## Conventions

Rings A are associative and unital; a ring map preserves one, and the zero ring is allowed. Fields F are nontrivial. A field homomorphism is therefore injective. Integral homology has trivial coefficients unless a representation or coefficient ring is displayed. Stable linear and Steinberg groups are directed colimits under block inclusion; no finite-rank stable range is implicit.

Write U(F)=Additive(Fˣ) and T(F)=U(F)⊗ℤU(F). Let τ exchange the two tensor factors and put Qₛ(F)=coker(1+τ). The notation a∧b in Qₛ means the class of a⊗b with the units written multiplicatively. Thus (ab)∧c=a∧c+b∧c, 1∧a=0, a∧b=−b∧a and 2(a∧a)=0; a∧a need not vanish. The ordinary exterior square is written Λ²U(F). The published CGZ target Q₋ is T(F) modulo the subgroup generated by u⊗(−u): the minus is multiplication by the field unit −1. It does not mean u⁻¹ or negation in the additive group U(F).

P(F) denotes Suslin's pre-Bloch group and ∂[x]=x∧(1−x). B(F)=ker ∂. Symbols at 0 and 1 mean zero only when extending the reduced symbol map by convention; they are not free generators of the reduced presentation. A separate unreduced presentation has [1] as a generator and kills it explicitly. The symbols [0] and [∞] in a projective presentation are separate generators with the relations specified in Layer 3. The classes c and h(u)=[u]+[u⁻¹] use |F|≥4 whenever their choice independence or homomorphism property is used.

Use column coordinates x=[1:x], 0=[1:0] and ∞=[0:1], with the left matrix action. Upper triangular matrices then stabilize 0. The projective cross-ratio is normalized by cr(0,∞,1,x)=x. Swapping the first two entries gives x⁻¹. The Bloch boundary has the order x then 1−x; Goncharov's displayed boundary has the opposite order and hence the opposite sign. For example, the alternating valuation pairing (a,b)↦v₂(a)v₃(b)−v₃(a)v₂(b) sends ∂[3]=3∧(−2) over ℚ to −1. This pins the sign independently of a kernel calculation.

K₃^ind(F)=K₃(F)/im(K₃ᴹ(F)→K₃(F)). It is not the quotient by torsion. The natural left term of the Suslin sequence is T̃(F), the enhanced Tor group, not an untwisted root subgroup. Its root-group model μ̃(F) is used only for abstract orders. The second Tate twist is the direct limit of μ_m⊗μ_m with the weight-two transition maps, equivalently Tor₁(μ,μ); it is not the ordinary tensor product of the divisible torsion group μ with itself, which is zero. An automorphism ζ↦ζᵃ acts on weight two by a².

For an abelian group M, M/n means M⊗ℤℤ/n=M/nM; M[n] is its n-torsion subgroup. These are different from K₃(F;ℤ/n) and from group homology with ℤ/n coefficients. A root-of-unity multiple is integral; division by its order is permitted only over a coefficient ring where that order is a unit. All based homotopy comparisons are natural up to based homotopy at the space level and strictly natural on induced group homomorphisms.

## Exact supplier contracts

The target signatures use Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The acceptance file uses only Mathlib; the Tau Ceti interfaces below are consumed by the mathematical development.

### From Mathlib

Use `Rep.trivial`, `groupHomology`, `groupHomology.inhomogeneousChains`, `groupHomology.cycles`, `groupHomology.cyclesMk`, `groupHomology.iCycles`, `groupHomology.toCycles`, `groupHomology.π`, `groupHomology.chainsMap` and `groupHomology.map` from `Mathlib/RepresentationTheory/Homological/GroupHomology/{Basic,LowDegree,Functoriality}.lean`. Use the actual cycles object and homology projection. Degree-n chains are finitely supported functions on `Fin n → G`; the generic differential supplies degree four, beyond the low-degree triple notation. Integral coefficients are `Rep.trivial ℤ G ℤ` in universe zero; for G in universe u transport them to `ULift.{u} ℤ`. Likewise transport localized coefficients to `ULift.{u} (Localization (Submonoid.powers (p : ℤ)))`.

Use `FreeAbelianGroup`, `Finsupp`, `TensorProduct`, `Submodule`, `AddSubgroup`, `QuotientAddGroup`, `⋀[R]^n M`, `exteriorPower.ιMulti`, `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Projectivization`, `Basis`, `LinearMap.toMatrix`, `Algebra.norm`, `Localization` and `ZMod` for the algebraic carriers. `Rep.FiniteCyclicGroup.groupHomologyIsoOdd` and `Rep.FiniteCyclicGroup.groupHomologyIsoEven` in `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean` supply cyclic homology via the norm complex for actual cyclic representations over a commutative coefficient ring. The map calculations are §4.15's additional targets.

Use `IsCoveringMap.existsUnique_continuousMap_lifts`, `IsCoveringMap.liftHomotopy` and `HSpace` for the covering multiplication of §1.5. The pinned `HSpace` gives a continuous multiplication, a unit, its value at the pair of units and unit homotopies relative to the unit; associativity and commutativity are not fields of that class. Mathlib's first-order language, formulas, structure semantics and elementary-embedding carriers support the real-closed-field theorem in §5.8.

### From Tau Ceti

`TauCeti.crossRatio_comp_eq_of_sub_eq_div` in `TauCeti/Algebra/Field/LinearFractional.lean` is the affine cross-ratio comparison used through PolylogarithmFunctions §5.8. `TauCeti.antisymmetricTensors` in `TauCeti/LinearAlgebra/TensorProduct/Symmetric.lean` is the negative eigenspace of the tensor flip; its comparison with the cokernel here requires two invertible.

Use `TauCeti.groupHomology.indIso_inv` in `TauCeti/RepresentationTheory/Homological/GroupHomology/Shapiro.lean`; `TauCeti.groupHomology.transfer`, `TauCeti.groupHomology.transfer_comp_map_subtype_id` and `TauCeti.groupHomology.map_comp_transfer` in `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`; `TauCeti.groupHomology.transfer_trans` in `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Trans.lean`; and `TauCeti.groupHomology.δ_naturality` in `TauCeti/RepresentationTheory/Homological/GroupHomology/LongExactSequence.lean`. These take actual representations over a commutative coefficient ring; transfer requires a finite-index subgroup. `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` in `TauCeti/RepresentationTheory/Homological/GroupCohomology/Sylow.lean` supplies injectivity on the prime-primary subgroup for a finite group. Positive-degree localized cohomology is such torsion; degree zero is handled directly. `TauCeti.ContinuousCohomology.corestriction_mackey` in `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction/Mackey/AllDegrees.lean` supplies the all-degree double-coset identity for an open subgroup U, a closed subgroup V and discrete coefficients on a profinite group. Section 5.2 compares its cochains with ordinary cochains for finite discrete groups before using that identity.

For real closures use `TauCeti.RealClosure.exists_realClosure` in `TauCeti/FieldTheory/RealClosure/Basic.lean`, which constructs an ordered algebraic real closure in the base field's universe, and `RingPreordering.exists_linearOrder` in `TauCeti/Algebra/Order/Ring/Ordering/Extension.lean`, which extends a specified field preordering to a compatible linear order. `IsFormallyReal` excludes a nonzero-square sum equal to zero; adjoining the square 1 shows that −1 is not a sum of squares. Thus the sums-of-squares subsemiring is a `RingPreordering`, and the two pinned declarations supply the ordered real-closure embedding needed in §5.8. That section proves the first-order transfer theorem itself.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

Sections 3.3–3.4 expose AlgebraicKTheory A1's stable GL(A)⊃E(A), entrywise ring maps and finite-stage colimits through their finite-stage identity aliases, and transport A1's Whitehead theorem to them, for associative unital A. Sections 3.2 and 3.12 identify πₙ(BGL(A)⁺) with Kₙ(A) for n≥1. Sections 7.4 and 1.8 supply the external product K₂(A)×K₁(ℤ)→K₃(A⊗ℤ) and its right-unit comparison; commutativity of A is unnecessary. Sections 13.8a–c supply Brauer lifting, the Adams fixed-fibre model and Quillen's finite-field computation, including K₂(𝔽q)=0 and |K₃(𝔽q)|=q²−1, with continuity to algebraic closures of finite fields.

### From TauCetiRoadmap.AlgebraicKTheory

Target A1 supplies the finite block inclusions g↦diag(g,1), stable GL(A), E(A), their ring maps and Whitehead's theorem E(A)=[GL(A),GL(A)] with E(A) perfect, for every associative unital ring A, including the zero ring. Its finite-stage field specialization is the native-carrier map `generalLinearStabilization` in §4.8, after reindexing Fin n ⊕ Fin 1 by finSumFinEquiv; this is an adapter for A1's inclusion. Target A5 supplies St(A)→E(A), its central exact sequence with kernel K₂(A), and its universal property, for every associative unital ring A. K2SymbolsBrauer Layers 2 and 4 fix the corresponding classical and homotopy comparisons.

### From TauCetiRoadmap.K2SymbolsBrauer

Sections 5.4 and 5.6 supply Milnor K-theory and its symbol presentation; §7.2 supplies Matsumoto's theorem; §§8.1–8.4 supply the products and graded comparison mₙ, including the ordered degree-three symbol formula. Section 5.12 supplies finite-field vanishing in degrees n≥2; §§5.13–5.14 supply unique divisibility over algebraically closed fields for n≥2, including repeated-root characteristic. Neither K₁ nor K₀ has that property. Section 10.32 supplies the number-field signature isomorphism K₃ᴹ(F)≃(real places → ℤ/2), where an all-negative triple has coordinate 1.

Section 10.5 supplies the Bass–Tate sequence for F(t); Layer 9 supplies parameter-last Milnor residues. Section 11.3 supplies Dₙmₙ=(−1)ⁿ⁻¹mₙ₋₁rᵥ,ₙ for every DVR and the right-linear Quillen boundary D. Degree three therefore has positive sign. Use the product-normalized θ₂♮ of §8.1 in degree two: the unadjusted bar comparison θ₂ sends a unit product to the inverse Steinberg symbol and cannot replace m₂.

### From TauCetiRoadmap.StableHomotopyKTheory

Layers 1–3 supply classifying spaces, based plus constructions (§§3.26–3.28), their homology and naturality. Section 1.17, `classifyingSpace_filteredColimit_homology`, applies to every unital coefficient ring, a fixed left coefficient module and n≥0; §§1.30 and 1.32 compare classifying-space and group homology. Section 3.29 supplies `uce.source_superperfect` and `plusGroup_fibreUCE`; §3.32 gives BK₂(A)→BSt(A)⁺→BE(A)⁺, and §3.31 identifies BE(A)⁺ under BE(A) with the simply connected covering model of BGL(A)⁺, with its naturality squares. Section 4.14 supplies block-sum H-space structure.

Section 5.19, `picard_self_braiding`, §6.3's Barratt–Priddy comparison and §7.1's stable η and η² are the inputs to the sphere-unit comparison of §1.5. Section 7.27 supplies the Atiyah–Hirzebruch spectral sequence for a spectrum smashed with a CW complex and its convergence. Section 4.16 here supplies its sphere-module structure, bottom-column unit splitting and the free-G-set Barratt–Priddy comparison. Group-module hyperhomology is constructed in §4.1, rather than inferred from a spectrum-only statement.

### From TauCetiRoadmap.AlgebraicTopology

Stages 2–5 and 8 supply singular homology, CW pairs, relative homotopy, the coefficient-sensitive product Künneth sequence, and Hurewicz and Whitehead theorems. Over ℤ the Künneth sequence splits abstractly; its splitting is not natural. The configuration swap uses its canonical cross-product term with the Koszul sign. Section 1.5 here supplies the additional degree-three Hopf calculation.

### From UniversalCovers

The completed UniversalCovers roadmap, Stages 2–3, supplies based lifts, the higher-homotopy comparison for actual coverings and the basepoint compatibility used for the simply connected elementary cover. The cover's lifted H-space multiplication is specified in §1.5.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

Section 3.0a, `motivicCycles` and `motivicToK`, supplies integral cycle complexes, the Milnor diagonal for every field, the convergent motivic-to-K tower with its symbol edge, and ℤ/m(i)≃τ≤i Rε_*μ_m^⊗i when m is invertible. Section 3.0 supplies `milnor_no_p_torsion` and its torsion-divisibility input in characteristic p. Section 6.10 supplies `diagonalChernMilnor`, whose composite with mᵢ is (−1)ⁱ⁻¹(i−1)! for i≥1. Section 5.17, `geisserLevine_fieldComparison`, supplies the defining-characteristic comparison; positive-degree vanishing over algebraically closed fields does not extend to K₀(Ω;ℤ/p)=ℤ/p. Section 6.5a supplies the separably closed Bott coefficient comparison with products, coefficient changes and field maps. Section 2.2 here proves its K₄-divisibility consequence and then the normalized positive-characteristic integral K₃-torsion comparison.

Section 1.5 supplies actual finite-field restriction, transfer and Frobenius. Section 1.8, `earlyChern`, supplies finite Chern operations on Kₙ(A;ℤ/ℓ^ν), for commutative A with ℓ invertible, ν≥1, n=2i−j≥2 and j≥0, and the determinant/Kummer construction at n=1. Finite products of primary coefficients give every invertible modulus. Retain its Moore-product hypotheses. Additivity holds for n≠2 or odd modulus; for n=2 and even m its correction is c(a+b)=c(a)+c(b)+(m/2)c({∂a,∂b}), with integral Chern operation in the last term. In degree three the second Chern operation is additive for every invertible modulus; §6.7 proves the indecomposable isomorphism (Weibel, Étale Chern classes at the prime 2, Proposition 2.4 and Example 2.6.2, pp.10–11; Hutchinson 2024, Theorem 2.10, p.4).

### From TauCetiRoadmap.SchemeKTheoryOperations

Section 3.6 supplies the affine/supported localization comparison, parameter specialization and the integral injection Kₙ(k)→Kₙ(A) for every algebraically closed k, nonzero commutative k-algebra A and degree n. Apply it to k=𝔽̄p and A=Ω in §2.2. Section 4.7 supplies the rational-function localization splitting used in §4.21; §5.2 supplies homotopy invariance for regular Noetherian schemes, §5.5 the projective bundle equivalence, and §6.4 universal higher operations and products. The integral injection and the natural Bott coefficient square prove K₄ divisibility before the positive-characteristic integral torsion comparison is constructed.

### From TauCetiRoadmap.ArithmeticKTheory

Section 5.2 supplies `suslinTorsionComparison` for separably closed characteristic-zero fields at i=2, with degree-four Bott Bockstein normalization, embeddings, automorphisms and coefficient compatibility. Section 4.18 here identifies its compatibility with the specified monomial δ and Chern map; the e-invariant is used only on torsion, with the convention of Weibel VI.2.1.

Sections 3.2–3.4 supply finite generation and rank r₂ for number fields; §§4.1–4.4 supply the primewise formulas for w₂(F)=|H⁰(F,μ(2))|; §§5.1 and 5.3–5.4 supply ambient K₃ structures and ring-to-field isomorphisms; §8.10 supplies ℚ and ℚ(i). For r₁>0 the structure is ℤ^(r₂)⊕ℤ/(2w₂)⊕(ℤ/2)^(r₁−1), and for r₁=0 it is ℤ^(r₂)⊕ℤ/w₂. These are abstract groups, without selected free generators or a splitting of the Milnor-image extension. None of these inputs uses a Bloch comparison.

### From TauCetiRoadmap.HomotopySpheres

Stage 9, item 1 supplies π₃ˢ=ℤ/24 generated by the stabilized quaternionic Hopf class ν.

### From TauCetiRoadmap.FourManifolds

Target F7.0b supplies η³=12ν≠0. Identify its stable η with the stabilization of §1.5's Hopf-invariant +1 generator and StableHomotopyKTheory §7.1. Thus π₃ˢ/⟨η³⟩=ℤ/12; changing ν to −ν leaves 12ν unchanged.

### From TauCetiRoadmap.AlgebraicCurves

Layer 12A supplies the DVR at a regular closed point of a curve and its order of vanishing. At an F-rational smooth point the residue field is F. Section 3.12 here proves the local rational weight-two specialization lemma used by Polylogarithms Layer 4.

### From TauCetiRoadmap.GlobalNumberFields

Layer 1's weak approximation supplies elements with prescribed signs at the real places of a number field; §2.3 uses it for the canonical signature-basis description.

### From TauCetiRoadmap.PolylogarithmFunctions

Section 5.8 supplies field-general crossRatioSphere on OnePoint F, its homogeneous determinant formula, Möbius invariance and normalize_five. Section 3.2 transports x↦[1:x], ∞↦[0:1] and takes the reciprocal on distinct tuples; it adds only the normalization adapter, the GL₂ triple stabilizer/orbit classification and deletion-face calculation.

Sections 6.1 and 6.3–6.5 supply the interval Rogers function L (rogers, there written R), L(1/2)=π²/12, L(1)=π²/6, reflection L(x)+L(1−x)=π²/6 and the exact interval pentagon. Section 5.8 here descends it to the real pre-Bloch group with its specified period. No analytic function, regulator or Habiro comparison is used to prove the Suslin sequence.


## How to read the build

Layer 1 produces the actual homological K₃ map and finite-chain equality witnesses. Layer 2 forms the indecomposable quotient and identifies the number-field decomposable subgroup by signs. Layer 3 constructs the symbolic presentations before comparing them, so torsion lost in a change of convention remains visible. Layer 4 constructs the infinite-field Suslin map, identifies its natural kernel and proves rigidity under purely transcendental extension, with the rational-curve presentation of the Bloch group. Layer 5 supplies the separate finite-field route and tests the integral arithmetic consequences. Layer 6 packages finite witnesses, root multiples and coefficient comparisons for downstream use. `Suggested.lean` records only the definitions and end statements expressible over the pinned carriers; the README specifies the complete construction.

## Layer 1: Homological K₃ of a ring

Start with an associative unital ring A. The targets in this layer apply the stable Steinberg and plus-construction suppliers to identify K₃(A) with actual third group homology. The equality test for representatives is a finite bar-boundary witness; it is stronger than a statement about the existence of an abstract group isomorphism.

### 1.1 The Steinberg plus space

For an associative unital ring A, define bStPlus(A)=BSt(A)⁺ by applying the based plus construction to BSt(A) relative to its entire perfect fundamental group. Write ι:BSt(A)→BSt(A)⁺ and q:BSt(A)⁺→BGL(A)⁺ for the canonical maps. The first induces integral homology isomorphisms, and both commute with ring-induced maps up to based homotopy. The space is two-connected and q induces πₙ(BSt(A)⁺)≅Kₙ(A) for n≥3, through the fibre and covering comparisons in the supplier contracts.

Here, the plus construction is the one of StableHomotopyKTheory §§3.26–3.28, taken relative to the named perfect normal subgroup.

- For a ring A, the space BSt(A)⁺ together with the canonical map ι : B St(A) → BSt(A)⁺.
- ι induces isomorphisms H_n(B St(A); Z) ≅ H_n(BSt(A)⁺; Z) for all n.
- The map q : BSt(A)⁺ → BGL(A)⁺ induced by St(A) → E(A) ⊂ GL(A).

- A ring map A → B induces a map BSt(A)⁺ → BSt(B)⁺ compatible with ι and q up to homotopy.
- The map induced by the identity of A is homotopic to the identity.
- The map induced by g ∘ f is homotopic to the composite of the maps induced by g and f.

- BSt(A)⁺ is 2-connected (§1.1).
- For n ≥ 3, q induces π_n(BSt(A)⁺) ≅ K_n(A), natural in A (§1.1).
- The homotopy fibration B K_2(A) → BSt(A)⁺ → BE(A)⁺ (the supplier contract).

For every associative unital ring A, let X_A = BSt(A)⁺ be the plus model. It is path connected with π₁(X_A)=π₂(X_A)=0. Its degree-three Hurewicz map is an isomorphism π₃(X_A) ≅ H₃(X_A; ℤ), natural for the chosen based ring-induced maps. This is the first nonzero-degree Hurewicz map, not a Hurewicz isomorphism for BGL(A)⁺.

Here A is an associative unital ring; use the stable Steinberg group in the same universe as ℤ. Classifying spaces and plus models have CW homotopy type, with chosen basepoints.

For each ring A the canonical map q_A:BSt(A)⁺→BGL(A)⁺, induced by St(A)→E(A)→GL(A), factors through the simply connected cover Y_A of BGL(A)⁺. Under the imported relative-plus comparison there is a homotopy fibration BK₂(A)→BSt(A)⁺→BE(A)⁺, and BE(A)⁺≃Y_A under BE(A). Thus q_A induces π_n isomorphisms for n≥3 and exhibits BSt(A)⁺ as a two-connected cover of the base component of K(A). Chosen space representatives commute with ring maps up to based homotopy; induced homotopy-group maps commute exactly.

Here A is associative and unital. The central kernel is the stable K₂(A). Use the relative-plus and covering comparisons in the exact supplier contracts.

The source locators for these statements are Weibel, K-book, Ex. IV.1.9 (PDF p. 282); Weibel, K-book IV, IV.1, Exercise 1.9, IV.14–15; Weibel, K-book IV, IV.1, Exercises 1.8–1.9, IV.14–15.

**Checks.**

- For the zero ring, St(0) is trivial and BSt(0)⁺ is contractible.
- π_1(BSt(Z)⁺) = 1 although π_1(B St(Z)) = St(Z) ≠ 1: a definition taking the plus construction relative to the trivial subgroup fails this test.
- ι induces H_3(BSt(A)⁺; Z) ≅ groupHomology (Rep.trivial Z (St A) Z) 3, through the comparison of StableHomotopyKTheory §1.32.
- π_2(BSt(Z)⁺) = 0 whereas π_2(BE(Z)⁺) ≅ K_2(Z) ≅ Z/2, so BSt(A)⁺ is not BE(A)⁺.
- π_1(BGL(Q)⁺) ≅ K_1(Q) ≅ Q^× is nontrivial while π_1(BSt(Q)⁺) = 1, so BSt(A)⁺ is not BGL(A)⁺.

*Needs:* the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.2 The canonical third-homology comparison

For every associative unital ring A, refine the comparison to the canonical additive isomorphism c_A:K₃(A)≅H₃(St(A);ℤ). If q₃:π₃(BSt⁺)≅K₃(A), h₃:π₃(BSt⁺)≅H₃(BSt⁺), j₃:H₃(BSt)≅H₃(BSt⁺) and b₃:H₃(BSt)≅H₃(St(A);ℤ) are the specified supplier maps, define c_A=b₃∘j₃⁻¹∘h₃∘q₃⁻¹. All homology uses trivial integral coefficients. An additive isomorphism is automatically ℤ-linear.

Here A is associative and unital; K₃ is the imported plus/Q K-theory group. Maps q₃, h₃, j₃ and b₃ are the canonical maps indicated, with the agreed basepoints and orientations.

- Given the four canonical isomorphisms, form c_A in the specified order.
- c_A(x)=b₃(j₃⁻¹(h₃(q₃⁻¹(x)))).
- c_A⁻¹(z)=q₃(h₃⁻¹(j₃(b₃⁻¹(z)))).

- c_A(0)=0.
- c_A(x+y)=c_A(x)+c_A(y), hence c_A is ℤ-linear.
- c_A(x)=0 exactly when x=0.

For the composition direction, take all five carriers equal to ℤ/5, q(x)=2x and h,j,b identity. Then comparison(1)=3, since q must be reversed; the unreversed composite gives 2. This algebraic Check pins the order of the four specified topological maps.

The source locators for these statements are Weibel, K-book IV, IV.1, Exercise 1.9, IV.14–15.

**Checks.**

- If all four groups agree and all four imported isomorphisms are identities, c_A is the identity.
- For a subsingleton Steinberg group G and any genuine c:K≅H₃(G;ℤ), K is subsingleton.
- For each x, c_A(x)=0 if and only if x=0; the constant-zero map fails this for every nonzero x.
- For all carriers ℤ/5, q(x)=2x and h,j,b identity, the comparison sends 1 to 3; using q instead of its inverse sends it to 2.

*Needs:* §1.1; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.3 Finite bar cycles and equality witnesses

Present H_3(St(A), Z) through Mathlib's inhomogeneous (bar) chain complex with trivial coefficients Z: a bar 3-chain is a finitely supported function St(A) × St(A) × St(A) → Z (chainsIso₃); it is a bar 3-cycle when d₃₂ vanishes on it, and a bar 3-boundary when it is the image of a 4-chain under the general differential of the inhomogeneous complex. Construct the evaluation sending a bar 3-cycle to the element of K_3(A) that corresponds, under §1.2, to its homology class, and the induced chain map along a ring homomorphism.

Here, coefficients are the trivial representation on Z.

- The type of bar 3-cycles of St(A) with trivial integer coefficients.
- A finitely supported c : St(A) × St(A) × St(A) → Z with d₃₂ c = 0 gives a bar 3-cycle (via chainsIso₃ and cyclesMk).
- The bar 3-boundaries: images of 4-chains under the differential of the inhomogeneous complex.

- A bar 3-cycle determines an element of K_3(A).
- Evaluation is an additive homomorphism from bar 3-cycles to K_3(A).
- evalBarCycle z is the image of groupHomology.π z under the inverse of the isomorphism of §1.2.

- A bar 3-boundary evaluates to zero.
- Every element of K_3(A) is the evaluation of some bar 3-cycle.
- For a ring map A → B, evaluation commutes with the induced chain map.

- Two bar 3-cycles evaluate equally exactly when their difference is a boundary.

For the existing unnormalised integral bar complex C_*(St(A)), let Z₃ be Mathlib’s cycles object and β:C₄→Z₃ its toCycles map. Refine the evaluation to the additive map ev_A:Z₃→K₃(A), ev_A(z)=c_A⁻¹(π(z)). It is surjective and ev_A(z)=ev_A(z′) if and only if there is a finitely supported w∈C₄ with β(w)=z−z′. The underlying chain condition is d₃z=0; no map C₃→K₃ is asserted on arbitrary chains.

Here A is associative and unital; use the canonical comparison c_A. C_n consists of finitely supported integer combinations of Fin n-tuples. Identity entries are retained.

- Compose π:Z₃→H₃(St(A)) with c_A inverse, as an additive map.
- c_A(ev_A(z))=π(z), with the exact pinned groupHomology.π.
- ev_A(0)=0.

- ev_A(z+z′)=ev_A(z)+ev_A(z′).
- ev_A(mz)=m ev_A(z) for each integer m.
- ev_A(β(w))=0 for each 4-chain w.

Provide K3Homological.eval3_eq_iff_certificate (ev_A(z)=ev_A(z′) iff ∃w:C₄, β(w)=z−z′); K3Homological.eval3_surjective (Every element of K₃(A) is ev_A(z) for some cycle z). The named boundary targets K3Homological.bar_four_identity_boundary and K3Homological.bar_noncycle assert d₄[1|1|1|1]=[1|1|1] and d₃[g|1|1]≠0 for g≠1, respectively.

The source locators for these statements are Weibel, K-book, Ex. IV.1.9 (PDF p. 282); Weibel, K-book, Example VI.2.1.2 (PDF p. 478); Weibel, K-book IV, IV.1, Exercise 1.9 and Definition 1.1, IV.2,14–15.

**Checks.**

- The 3-cycle single (1,1,1) 1 is the boundary of single (1,1,1,1) 1, so its evaluation is 0.
- For g = x_12(1) in St(Z), the chain single (g,1,1) 1 is not a bar 3-cycle: its image under d₃₂ is single (1,1) 1 − single (g,1) 1 ≠ 0.
- For the inclusion Z → Q, evaluation commutes with the induced map on K_3.
- The distinct cycles single (1,1,1) 1 and 0 have the same evaluation: evaluation is not injective on cycles.
- The nonzero chain [1|1|1] is a cycle and has evaluation zero, with witness [1|1|1|1].
- Evaluation on cycles is not injective: [1|1|1] and zero are distinct cycles with equal values, even for the trivial group.
- For g≠1 the differential of [g|1|1] is nonzero; the constructor cannot silently treat every 3-chain as a cycle.

*Needs:* §1.2; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.4 Ring maps and finite stages

For a unital ring map f:A→B let s_f:St(A)→St(B), K₃(f):K₃(A)→K₃(B), Z₃(f) and H₃(s_f) be the canonical maps. Then c_B∘K₃(f)=H₃(s_f)∘c_A and K₃(f)(ev_A(z))=ev_B(Z₃(f)z). If β_A(w)=z−z′, tuplewise chainsMap sends w to a certificate β_B(C₄(f)w)=Z₃(f)z−Z₃(f)z′. Identity and composition laws are strict on chains, cycles and groups; the space-level comparison uses based homotopies.

Here A and B associative unital rings; f preserves the unit. All coefficient maps are the identity of ℤ with trivial actions.

For any ring A and the directed tower St_n(A) defining St(A), every x∈K₃(A) has a representative cycle z_n∈Z₃(St_n(A);ℤ) at some finite rank n. If two finite-stage cycles have the same value in K₃(A), there is a common later rank m and a 4-chain w_m with d₄w_m equal to the difference of their stabilised underlying chains. Conversely any such witness proves equality. Neither injectivity of St_n→St(A) nor a uniform stable range is assumed.

Here A associative unital; use the imported colimit tower and its universal maps. Finite stages need not be superperfect, and are not assigned K₃(A) by a finite-rank Hurewicz theorem.

Provide naturality of the comparison, naturality of cycle evaluation and chainsMap_boundaryWitness for the three squares, and finiteStageCycle_exists and finiteStageBoundary_exists for the two colimit assertions.

**Checks.**

- Over the zero ring every finite-stage group, cycle value and homology class is zero.
- For an identity ring map, tuplewise transport fixes every coefficient and every support tuple.
- For A→B→C, transport of a four-chain along the composite equals successive transport; its boundary is the same finite integer combination of image tuples.

Finite support supplies a common stage for both a cycle and the equations proving it is a cycle; it also supplies a stage for a chosen equality witness.

The source locators for these statements are Weibel, K-book IV, IV.1, Functoriality 1.1.2, IV.3; Weibel, K-book IV, IV.1, stable GL convention, IV.2; Exercise 1.9, IV.15.

*Needs:* §1.2, §1.3; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### 1.5 The elementary cover and the Hopf kernel

Let X_A be a well-pointed CW-type model of BGL(A)⁺ with the block-sum H-space structure of the early plus-construction contract, and p_A:Y_A→X_A a based simply connected covering model, Y_A locally path connected, p_A(y₀)=e_X. Lift μ_X∘(p_A×p_A) uniquely through p_A with value y₀ at (y₀,y₀). This multiplication, y₀, and lifted unit homotopies give Mathlib’s HSpace Y_A. Its multiplication projects exactly to μ_X; under the imported BE(A)⁺≃Y_A it supplies the H-space needed in the η-Hurewicz argument.

Here A associative unital; p_A is an actual covering map of the chosen CW-type K-space model. Y_A is simply connected and locally path connected, with chosen y₀ over the H-space unit. The block-sum H-space has based unit homotopies, as in the pinned HSpace carrier.

For a based simply connected well-pointed CW-type H-space X, composition with the based Hopf generator η:S³→S² gives an additive map η_X:π₂(X)→π₃(X), and π₂(X)→π₃(X)→H₃(X;ℤ)→0 is exact. In particular H₃(X)≅π₃(X)/im(η_X), naturally for based H-maps. The proof uses the elementary degree-three wedge calculation and a relative-Hurewicz consequence with H₃(Y)=0; it does not use Exercise IV.1.25 as printed.

Here X is a based simply connected well-pointed CW-type H-space. Use the targets wedgeTwoSpheres_pi3 and hopfComposition_add below.

For every associative unital ring A, transport π₂(Y_A) and π₃(Y_A) to K₂(A) and K₃(A) through its covering projection and the imported plus model. Then the Hopf composition operation equals α↦α·[−1], the external pairing K₂(A)×K₁(ℤ)→K₃(A⊗ℤ)≅K₃(A). Under the canonical sphere-unit map π₁ˢ→K₁(ℤ), stable η maps to the unit class [−1]. No internal tensor product of two arbitrary A-modules, or commutativity of A, is required.

Here A is associative and unital. Use the external product over ℤ and the specified multiplicative sphere-unit compatibility; no commutativity of A is assumed.

For every associative unital ring A define h_A:K₃(A)→H₃(E(A);ℤ) by h_A=H₃(St(A)→E(A))∘c_A. Then K₂(A) --(α↦α·[−1])→ K₃(A) --h_A→ H₃(E(A);ℤ)→0 is exact and natural for unital ring maps. Equivalently c_A⁻¹ identifies the kernel of H₃(St(A))→H₃(E(A)) with the image of the minus-one product. This is a quotient of K₃, not an isomorphism K₃(A)≅H₃(E(A)).

Here A associative unital; trivial integral homology and the right K₁(ℤ)-scalar convention. Use all canonical comparison maps and the covering H-space structure, rather than arbitrary abstract group isomorphisms.

Provide elementaryCover.mul_project, elementaryCover.unit_left and elementaryCover.unit_right for multiplication and unit homotopies, and elementaryCover.hspace_map for transport under a ring-induced based H-map. Provide hopfHurewicz_exact, hopf_eq_minusOneProduct and elementaryHomology_exact for the three comparisons.

**Checks.**

- The cover over the zero ring is contractible, and its multiplication has one homotopy class.
- For the identity covering of a simply connected H-space the lifted multiplication is the given multiplication; in general projection of a lifted product is exactly the product of the projections.
- For A=ℤ the quotient is ℤ/48→ℤ/24 with an order-two kernel; it has no additive section.
- In characteristic two the minus-one product is zero.
- For X=K(ℤ,2), both π₃ and H₃ vanish; for X=K(ℤ,3), π₃≃H₃≃ℤ and π₂=0.

The topological input consists of the following targets of this roadmap, in this order.

- wedgeTwoSpheres_pi3: for an arbitrary set I, fix the Hopf generators and Whitehead attaching orientations as follows. For W=∨ᵢS², π₂(W)=⊕ᵢℤ and π₃(W) is freely generated by the Hopf composites ιᵢη and the Whitehead products [ιᵢ,ιⱼ], with one generator for each unordered distinct pair. Fix η by the Hopf fibration of Hopf invariant +1 and fix the pair ordering before choosing the Whitehead generators. For finite I, compare W with ∏ᵢS²: its relative 4-cells give precisely those Whitehead attaching maps, and the factor projections recover the Hopf components. Relative Hurewicz in degree four and π₃(S²)=ℤη give the decomposition. For arbitrary I use compactness of sphere maps and homotopies into a CW wedge to pass through finite subwedges. Hatcher Examples 4.51–4.52, pp.380–381, supply these steps; H₃(W)=0 follows directly from its cellular chains.
- hopfComposition_add: for any based H-space, [a,b]=0 for a,b∈π₂, because its multiplication extends the wedge map to S²×S² and thus kills the attaching map of the 4-cell. For the pinch S²→S²∨S², the preceding basis calculation gives Hopf components η,η; the mixed cup product in its mapping cone gives Whitehead coefficient +1 with the chosen attaching orientation. Thus (a+b)η=aη+bη+[a,b], proving additivity, including negatives; postcomposition proves naturality. This uses the based units, not strict associativity or commutativity. Hatcher §4.2, Exercise 37, p.392, gives the Whitehead vanishing route.
- hopfHurewicz_exact: choose W→X onto π₂(X), replace it by its mapping-cylinder inclusion and apply relative Hurewicz to this 2-connected pair. In the relative homotopy/homology diagram π₃(X,W)→H₃(X,W) and π₂(W)→H₂(W) are isomorphisms, and H₃(W)=0. A diagram chase gives surjectivity of π₃(X)→H₃(X) with kernel im π₃(W). The preceding wedge calculation and Whitehead vanishing identify that image with im η_X. This proves exactness for all the stated simply connected CW-type H-spaces without assuming π₂(X) free.
- sphereUnit_eta_minusOne: the finite-set symmetric monoidal unit gives the sphere-to-K(ℤ) map through Barratt–Priddy; the self-braiding of two singleton summands represents η. Its free-module image is the transposition matrix, whose determinant is −1, hence its K₁(ℤ) class is [−1]. Use StableHomotopyKTheory §§5.19 and 6.3 for these comparisons, then GeneralAlgebraicKTheory §7.4, with §1.8, for the external pairing and the unit square K(A)∧𝕊→K(A)∧K(ℤ)→K(A⊗ℤ). The square identifies composition by stable η on π₂K(A) with right multiplication by [−1]. Stabilization of the based Hopf generator agrees with this action. This is hopf_eq_minusOneProduct, for every associative unital A, including the zero ring. Weibel IV.1 Exercises 1.11–1.12(a),(e), pp.14–15, supply the low-degree application.

Additional checks for these targets are π₃(∨∅S²)=0, π₃(S²)=ℤ, π₃(S²∨S²)=ℤ³ (the third generator cannot be omitted), the fold formula (ι₁+ι₂)η=ι₁η+ι₂η+[ι₁,ι₂], and det((0,1),(1,0))=−1 over ℤ but +1 in characteristic two.

The source locators for these statements are Weibel, K-book IV, IV.1, Exercise 1.11 and Corollary 1.20, IV.14–15; Weibel, K-book IV, IV.1, Lemma 1.19 and Remark 1.19.1, IV.13; Hatcher, Algebraic Topology, Section 4.2, Examples 4.51–4.52, printed pp.380–381; Exercise 37, p.392; Weibel, K-book IV, IV.1, Exercise 1.12(a),(e), IV.15; IV.4, Theorem 4.9.3, IV.43; Weibel, K-book IV, IV.1, Corollary 1.20, IV.13–14.

*Needs:* §1.1, §1.2, §1.4; the Steinberg, plus, covering, Hurewicz and external-product contracts; the preceding comparisons in this layer.

### Examples

In the unnormalised bar complex, d₄[1|1|1|1]=[1|1|1]. This nonzero cycle has zero evaluation even for the trivial group. In contrast d₃[g|1|1]=[1|1]−[g|1] is nonzero for g≠1. The cycle equation, the homology projection and evaluation are three separate operations. Over ℤ, passing from St to E then halves the order of the third homology group from 48 to 24.

### Dependencies

Use GeneralAlgebraicKTheory §§3.2–3.4, 3.12 and 7.4 (with §1.8), AlgebraicKTheory A5 with K2SymbolsBrauer Layers 2 and 4, StableHomotopyKTheory Layers 1–3 and §§4.14, 5.19, 6.3 and 7.1, AlgebraicTopology Stage 8 with the Hopf targets of §1.5, and UniversalCovers Stages 2–3. The bar chains, cycles and maps are Mathlib’s. No field stability theorem enters this layer.

## Layer 2: Decomposable and indecomposable K₃

Here F is a field. The degree-three Milnor comparison determines both the subgroup of decomposables and its quotient. Injectivity is integral and requires the motivic argument; rational ranks alone cannot establish it. Number-field signatures make the subgroup explicit without choosing a splitting of K₃(F).

### 2.1 The Milnor image and its cokernel

Specialise the graded ring map K^M_*(F) -> K_*(F) imported from K2SymbolsBrauer §§8.2 and 8.4 to degree three, obtaining a homomorphism K_3^M(F) -> K_3(F) determined by the product of three units. Use that supplier’s ordered-symbol formula and functoriality. The degree-two comparison is an isomorphism by Matsumoto’s theorem; integral injectivity in degree three is proved in §2.2.

Define K_3^ind(F) as the cokernel of the degree-three Milnor-to-Quillen map, together with the quotient map K_3(F) -> K_3^ind(F). The decomposable part is by definition the image of that map; it is a subgroup of K_3(F) isomorphic to K_3^M(F) only once injectivity has been proved, which is a separate theorem.

- The abelian group K_3^ind(F).
- The surjection K_3(F) → K_3^ind(F).
- K3ind.mk is surjective.

- A class dies in the quotient exactly when it lies in the image of the degree-three map.
- K3ind.mk (milnorToQuillen3 x) = 0 for every x in K_3^M(F).
- A homomorphism f : K_3(F) → M with f ∘ milnorToQuillen3 = 0 descends to K3ind F → M.

- K3ind.lift f (K3ind.mk x) = f x.
- Two homomorphisms out of K_3^ind(F) agree when their composites with the quotient map agree.
- A field homomorphism induces a map of indecomposable quotients, compatibly with the quotient maps.

- The map induced by the identity is the identity.
- The map induced by a composite is the composite of the induced maps.
- K3ind.map φ (K3ind.mk x) = K3ind.mk (K_3(φ) x).

- K3ind F is isomorphic to the quotient of K_3(F) by the range of milnorToQuillen3, as a Mathlib QuotientAddGroup.
- The decomposable subgroup, defined as the image, with its inclusion.

The sequence K_3^M(F) -> K_3(F) -> K_3^ind(F) -> 0 is exact and natural in F. Exactness on the left is not asserted here; it is the content of the injectivity theorem.

The source locators for these statements are Weibel, K-book, Example IV.1.10.1 (PDF p. 274); Weibel, K-book, VI.5 opening (PDF p. 495).

**Checks.**

- For a finite field the source vanishes, so the map is zero.
- For F = Q the symbol {−1,−1,−1} has nonzero image, of order two.
- For Q inside R the square with the induced maps commutes.
- For a number field with r_2 > 0 the map is not surjective, since the target has positive rank and the source is torsion.
- For a finite field the quotient map is an isomorphism (K_3^M(F_q) = 0).
- For Q the quotient is cyclic of order 24 while K_3 is cyclic of order 48.
- For a number field the quotient has free rank r_2.
- K_3(Q) modulo its torsion subgroup is 0, but K_3^ind(Q) ≅ Z/24: the indecomposable quotient is not the torsion-free quotient.

*Needs:* Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.2 Injectivity and the motivic edge

For every field F the degree-three map K_3^M(F) -> K_3(F) is injective. In characteristic two use KTheoryFiniteLocalFields §3.0, `milnor_no_p_torsion` (Weibel III.7.8, chapter pp.67–68; VI.4.3.2, p.18). The supplier proves torsion-freeness separately from divisibility of the torsion subgroup. Consequently the decomposable part is isomorphic to K_3^M(F) and the sequence of §2.1 is short exact.

For a field k, the motivic spectral sequence E_2⁽ᵖ,q⁾ = H⁽ᵖ−q⁾(k, Z(−q)) ⇒ K₍−ₚ−q₎(k) yields an exact sequence K_4(k) → H^0(k, Z(2)) → K_3^M(k) → K_3(k) → H^1(k, Z(2)) → 0, in which the middle map is milnorToQuillen3 under the Nesterenko–Suslin–Totaro isomorphism K_3^M(k) ≅ H^3(k, Z(3)), and the map into K_3^M(k) is the differential d_2.

For every field F, twice every element of the kernel of K_3^M(F) → K_3(F) is zero.

For every field F of characteristic different from 2, H⁰(F,Z(2))/2=0. Consequently the integral differential d₂:H⁰(F,Z(2))→K₃ᴹ(F) in the low-degree sequence is zero. This theorem refines the characteristic-not-two branch of the injectivity proof; it does not use that injectivity theorem as an input.

Here char(F)≠2.

For every field F the edge map e_F:K₃(F)→H¹(F,Z(2)) in the low-degree integral sequence induces a natural additive equivalence e_m:K₃^ind(F)≃H¹(F,Z(2)), characterized by e_m(q_F(x))=e_F(x). This is a quotient assertion; it uses right exactness of the sequence and does not need injectivity of m₃.

- e_m:K₃^ind(F)≃+H¹(F,Z(2)).
- e_m(q_F(x))=e_F(x).
- e_m⁻¹(e_F(x))=q_F(x).

- Every additive homomorphism with this evaluation on representatives equals e_m.
- The equivalence commutes with maps induced by every field homomorphism.

The argument first imports KTheoryFiniteLocalFields §6.10, `diagonalChernMilnor`, in degree three, giving the coefficient +2 on Milnor symbols. Its §3.0, `milnor_no_p_torsion`, supplies injectivity of multiplication by p on every Kₙᴹ(F) when char F=p>0, including n=0. Their full-field constructions and proofs remain at that supplier. The two additional targets here are the following.

1. weightTwo_degreeZero_modTwo: for char(F)≠2, the coefficient sequence and the finite motivic-to-étale comparison give an injection H⁰(F,ℤ(2))/2↪H⁰ₑₜ(F,μ₂⊗²)≅ℤ/2, compatible with extension to an algebraic closure Ω. The right-hand comparison to Ω is the identity on μ₂⊗², so the map H(F)→H(Ω) is injective, where H(L)=H⁰(L,ℤ(2))/2. This uses the degree-zero part of the finite motivic-to-étale comparison of KTheoryFiniteLocalFields §3.0a, `motivicToK`, not just the diagonal norm-residue theorem. Over Ω, K₃ᴹ(Ω) is uniquely divisible, so the two-torsion image of d₂ is zero. Right exactness then makes K₄(Ω)→H⁰(Ω,ℤ(2)) onto. The next target makes this source divisible, hence H(Ω)=0 and H(F)=0. This proof does not use m₃ injective.
2. algebraicClosure_K4_allPrimeDivisible: for every algebraically closed Ω and every prime r, multiplication by r on K₄(Ω) is onto. It is proved here from the rigidity and finite-coefficient calculations below, not by an odd-prime shortcut. In characteristic p, KTheoryFiniteLocalFields §5.17 identifies Kₙ(Ω;ℤ/p) with Kₙᴹ(Ω)/p, which vanishes for n≥1: in degree one Ωˣ is p-divisible, and in higher degrees use the imported Milnor divisibility. The coefficient sequences in degrees n and n+1 give unique p-divisibility of Kₙ(Ω) for n≥1. Degree zero instead has K₀(Ω;ℤ/p)=ℤ/p. For r≠p, and for every r in characteristic zero, import the Bott comparison of KTheoryFiniteLocalFields §6.5a. In characteristic zero ArithmeticKTheory §5.2 makes the normalized Bockstein K₄(Ω;ℤ/r)→K₃(Ω)[r] an isomorphism. In characteristic p choose an embedding k=𝔽̄p→Ω. SchemeKTheoryOperations §3.6 gives an injection K₃(k)→K₃(Ω). GeneralAlgebraicKTheory §13.8c and continuity give K₄(k)=0 and identify the Bockstein K₄(k;ℤ/r)→K₃(k)[r] as an isomorphism. The coefficient map K₄(k;ℤ/r)→K₄(Ω;ℤ/r) is an isomorphism by the supplied Bott comparison, compatibly with these Bocksteins. The resulting square makes the Bockstein over Ω injective; the coefficient sequence therefore gives K₄(Ω)/r=0. This argument proves divisibility before using an integral torsion comparison (Weibel VI.1.3–1.7, pp.2–5; weibel line 91). The finite-field computation is GeneralAlgebraicKTheory §§13.8a–c; none of these steps uses unstable finite SL₂ stabilization.

For every algebraically closed Ω of characteristic p>0, construct the natural equivalence K₃(Ω)_tors≃Tor₁^ℤ(μ(Ω),μ(Ω)). For each m≥2 prime to p, its restriction to m-torsion is the inverse of the integral Bockstein K₄(Ω;ℤ/m)→K₃(Ω)[m], followed by the weight-two Bott identification K₄(Ω;ℤ/m)≃μ_m⊗μ_m. The preceding K₄-divisibility result makes this Bockstein injective, and the coefficient exact sequence makes it onto. The defining-characteristic coefficient vanishing excludes p-torsion. Require compatibility with field embeddings, coefficient transitions and automorphisms, with ζ↦ζᵃ acting by a². This is the positive-characteristic torsion target used in §4.18 (Weibel VI.1.3.1 and VI.1.7.1, pp.3–5; weibel line 215).

For the remaining algebraically closed **Milnor** input, import K2SymbolsBrauer §§5.13–5.14, which already give the unique-divisibility theorem in degrees n≥2. Section 5.14 there divides the Steinberg relation subgroup itself by root factorization, so it supplies injectivity as well as divisibility; no new proof of that result belongs here. Its source is Weibel III.6.4.1, printed p.52, and III.7 Exercise 7.3, p.72. These statements apply in characteristic r with repeated roots. K₁(Ω) has root torsion and K₀(Ω)=ℤ, so neither is included.

Together, the diagonal kills the §2.2 kernel by two; characteristic two uses the imported torsion-freeness theorem, and characteristic different from two uses the two local targets to kill d₂. This supplies the stated full-field integral injectivity and the natural quotient edge equivalence in the displayed order.

The source locators for these statements are Weibel, K-book, Proposition VI.4.3.2 (PDF p. 490); Weibel, K-book, Low degree terms VI.4.3.1 (PDF p. 490); Weibel, K-book, Edge Map VI.4.3 (PDF p. 489); Weibel, K-book, Lemma V.11.13 (PDF p. 466); Weibel, K-book VI, VI.4.3.1–4.3.2, chapter PDF pp.17–18; for the K₄-divisibility citation, VI.1.3.1(i), p.3, and VI.1.6(i), pp.4–5; Weibel, K-book V, V.11.3, V.11.11, Lemma 11.13, chapter PDF pp.81–82,85–87; Weibel, K-book VI, VI.4.3.1, chapter PDF p.17.

**Checks.**

- The integral Chern coefficients in degrees 1,2,3 are +1,−1,+2. Over F=ℚ(t₁,t₂,t₃), successive parameter-last Milnor residues at t₃,t₂,t₁ send x={t₁,t₂,t₃} to 1∈K₀ᴹ(ℚ)=ℤ. The degree-three diagonal Chern composite sends x to 2x, whose iterated residue is 2; reversing the first two entries gives −2, whereas the zero composite gives 0. K2SymbolsBrauer Layer 9 supplies these residues. The all-positive symbol {2,3,5} over ℚ is zero and cannot distinguish the three coefficients.
- Over 𝔽₂(t₁,t₂,t₃) the characteristic branch uses injectivity of 2 on Milnor K₃, not the false assertion that a divisible 2-primary group vanishes. The Prüfer 2-group is a negative control for that inference.
- At Ω=𝔽̄₂, K₀(Ω;ℤ/2)=ℤ/2, while every positive-degree defining-characteristic coefficient group vanishes; extending that vanishing to degree zero loses the rank term.
- In the closure argument r=char Ω is included: at Ω=𝔽̄₂ one has K₄=0, while in characteristic zero r=2 uses the same all-prime coefficient theorem. K₁(Ω) is excluded from Milnor unique divisibility.

- Over Ω=𝔽̄₂ with m=3, the normalized Bockstein identifies two groups of order three. Arithmetic Frobenius acts by 2²=1 modulo 3 on the detected torsion, while the ordinary root action is multiplication by 2.
- Over Ω=𝔽̄₂ with m=5, the normalized degree-four coefficient generator maps to a nonzero order-five torsion class, and Frobenius acts by 4 modulo 5, not 2.
- Over Ω=𝔽̄₂ at m=2, both K₄(Ω;ℤ/2) and K₃(Ω)[2] vanish. This does not extend to K₀(Ω;ℤ/2)=ℤ/2.

*Needs:* §2.1; Layer 1; K2SymbolsBrauer §§5.13–5.14 and Layer 9; KTheoryFiniteLocalFields §§3.0, 3.0a, 5.17, 6.5a and 6.10; ArithmeticKTheory §5.2; SchemeKTheoryOperations §3.6.

### 2.3 Real places and the decomposable subgroup

Let R(F) be the finite subtype of real infinite places and σ_F:K₃ᴹ(F)≃⊕₍ᵥ∈R₍F₎₎ Z/2 the imported Bass–Tate signature, written additively with 1 for an all-negative triple. Define b_v=σ_F⁻¹(δ_v), where δ_v is 1 at v and 0 elsewhere. This is canonical; choosing a sign-isolating unit is not part of its data.

Here F is a number field.

- b_v=σ_F⁻¹(δ_v).
- σ_F(b_v)(w) equals 1 if w=v and 0 otherwise.
- b_v≠0 for each real place v.

- 2b_v=0.
- Every x is the sum of b_v over the real places with σ_F(x)(v)=1.
- For an embedding F→L of number fields, restriction sends b_v to the sum over real places w of L restricting to v.

For each real place v of a number field F, there exists u_v∈F× negative at v and positive at every other real place. For every such u_v, b_v={−1,−1,u_v}. Thus the symbol is independent of the chosen sign-isolating unit.

For a number field F the additive homomorphism p_F:K₂ᴹ(F)→K₃ᴹ(F), x↦{−1}·x, is surjective. Under Matsumoto and the imported graded comparison, the image of K₂(F) --[−1]·→ K₃(F) equals the decomposable subgroup D(F)=im(m₃). This statement is about number fields; no all-fields equality of these two images is asserted.

For a number field F, let D(F)=im(m₃)⊆K₃(F), the decomposable subgroup. Integral injectivity gives j:K₃ᴹ(F)≃D(F). Construct s_D:D(F)≃⊕₍ᵥ ᵣₑₐₗ₎ Z/2 as σ_F∘j⁻¹. In particular |D(F)|=2⁽ʳ₁⁾ and every element of D(F) is killed by 2; do not identify D(F) with all torsion in K₃(F).

- The additive equivalence s_D:D(F)≃(R(F)→Z/2).
- s_D(m₃(x), membership in its range)=σ_F(x).
- s_D⁻¹(t) has ambient K₃ class m₃(σ_F⁻¹(t)).

- 2d=0 for d∈D(F).
- The finite cardinality of D(F) equals 2⁽ʳ₁⁾.
- Restriction of D(F)→D(L) corresponds to pulling back sign functions along R(L)→R(F).

The source locators for these statements are Weibel, K-book III, Examples 7.2(c–d), pp. 61–62 (Bass–Tate signs); Weibel, K-book VI, VI.4.3.2, chapter PDF p.18.

**Checks.**

- With the single real coordinate of Q, σ_Q(b)=1.
- When R(F) is empty every x∈K₃ᴹ(F) equals zero.
- For two distinct real places v,w, b_v≠b_w. Defining every generator as {−1,−1,−1} fails this test.
- A class mapping to the unique coordinate 1 is nonzero, so D(Q) is not zero.
- With an empty real-place type every ambient decomposable class is zero.
- For every real place v, the decomposable signature of the ambient Milnor image m₃(b_v) is δ_v. Postcomposing with a nontrivial coordinate permutation or another additive automorphism fails this test.

*Needs:* §2.1, §2.2; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.4 Totally imaginary fields and stable special-linear homology

For a field F, the Hurewicz map K_3(F) → H_3(SL(F), Z) is surjective, and its kernel is the image under milnorToQuillen3 of the subgroup {−1}·K_2^M(F) of K_3^M(F) generated by the symbols {−1, a, b}. Once §2.2 is available, the kernel is that subgroup itself.

If F is a number field with r₁=0, the quotient q_F:K₃(F)→K₃^ind(F) is an additive equivalence e_F. Construct it from q_F and D(F)=0; its inverse is the unique lift of a quotient class. It is natural for embeddings between totally imaginary number fields.

Here F is a number field. F has no real infinite places: r₁(F)=0.

- e_F:K₃(F)≃+K₃^ind(F).
- e_F(x)=q_F(x).
- e_F⁻¹(q_F(x))=x.

- For an embedding of totally imaginary number fields, e_L∘K₃(f)=K₃^ind(f)∘e_F.

For a number field F the stable Hurewicz map h_F:K₃(F)→H₃(SL(F),Z) factors uniquely through an additive equivalence e_h:K₃^ind(F)≃H₃(SL(F),Z). Here SL(F) is the stable special linear group, not SL₂(F). The equivalence is natural under embeddings of number fields.

- e_h:K₃^ind(F)≃+H₃(SL(F),Z).
- e_h(q_F(x))=h_F(x).
- e_h⁻¹(h_F(x))=q_F(x).

- Every additive homomorphism with this evaluation on q_F equals e_h.
- e_h commutes with K₃^ind(f) and stable H₃(SL(f),Z).

The source locators for these statements are Weibel, K-book, VI.5 opening (PDF p. 495); Weibel, K-book III, Examples 7.2(c–d), pp. 61–62 (Bass–Tate signs); Weibel, K-book VI, VI.5 opening, chapter PDF p.23 (definition of the cokernel); Weibel, K-book VI, VI.5 opening paragraph, chapter PDF p.23.

**Checks.**

- Over ℚ the stable Hurewicz map is ℤ/48→ℤ/24, with 1↦1 and 24↦0 under compatible cyclic identifications; its order-two kernel is nonzero.
- Over ℚ(i), D=0 and both a free generator and a torsion generator survive in ℤ⊕ℤ/24; identifying the quotient with the torsion-free quotient would lose the latter.
- Over 𝔽₅, K₂=0 and K₃→H₃(SL) is an isomorphism of groups of order 24, whereas P(𝔽₅) has order 6. Stable H₃(SL) is not the pre-Bloch presentation.

*Needs:* §1.5, §2.1, §2.3; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### 2.5 Information lost over the rationals

For a number field F, the quotient map induces an isomorphism K_3(F) ⊗_Z Q ≅ K_3^ind(F) ⊗_Z Q of rational vector spaces of dimension r_2, and K_3^M(F) ⊗_Z Q = 0.

Here F is a number field.

The source locators for these statements are Weibel, K-book, VI.5.3 (PDF p. 496).

*Needs:* §2.1, §2.3; Layer 1; the graded Milnor, motivic and number-field signature contracts.

### Examples

For ℚ the real-place basis is the single symbol {−1,−1,−1}. Its image is the unique element of order two in K₃(ℚ)=ℤ/48, so the quotient is ℤ/24 and the quotient extension does not split. For ℚ(i) the real-place type is empty; the Milnor image vanishes and the quotient map is an isomorphism. Tensoring either example with ℚ forgets this difference.

### Dependencies

Use Layer 1, K2SymbolsBrauer §§5.4, 5.13–5.14, 7.2, 8.2–8.4 and 10.32 for symbols, Matsumoto and the global sign theorem, KTheoryFiniteLocalFields §§3.0, 3.0a and 6.10, SchemeKTheoryOperations §§5.5 and 6.4, GeneralAlgebraicKTheory §13.8c, and ArithmeticKTheory §§3.2–3.4, 4.1–4.4, 5.1–5.4 and 8.10. The K₄ route also consumes KTheoryFiniteLocalFields §§5.17 and 6.5a and SchemeKTheoryOperations §3.6; the positive-characteristic torsion comparison follows that divisibility proof. GlobalNumberFields Layer 1 supplies weak approximation; Mathlib supplies the real-place subtype and quotient groups. The motivic edge equivalence follows from right exactness before the separate injectivity proof.

## Layer 3: Bloch presentations with integral conventions

All fields are permitted in the basic presentations. Every use of c and the inversion homomorphism states the additional size hypothesis |F|≥4. The main boundary takes values in an antisymmetric tensor cokernel, whose diagonal classes can have order two. Three other tensor targets and two different configuration presentations are compared only by named maps.

### 3.1 The antisymmetric tensor cokernel

For a commutative ring R and an R-module M, antisymSquare R M is the quotient of M ⊗_R M by the submodule LinearMap.range (id + comm), which is the submodule spanned by all a ⊗ b + b ⊗ a; the class of a ⊗ b is written a ∧ b. The roadmap uses R = ℤ and M = Additive Fˣ, which is the K-book's ∧̃²A. It is the cokernel of 1 + τ (τ the flip): it is not Tau Ceti's antisymmetricTensors, which is the kernel of 1 + τ, and it is not the exterior square, since the class a ∧ a need not vanish.

Here R is a commutative ring and M is an R-module; the roadmap uses R = ℤ and M = Additive Fˣ. No hypothesis on 2: the construction is used over ℤ, where 2 is not invertible.

- `antisymSquare`: The R-module antisymSquare R M = (M ⊗[R] M) ⧸ LinearMap.range (id + comm).
- The bilinear map M → M → antisymSquare R M, (a, b) ↦ a ∧ b.
- The kernel of the quotient map M ⊗ M → antisymSquare R M is LinearMap.range (id + comm), which is the span of the a ⊗ b + b ⊗ a.

- a ∧ b + b ∧ a = 0 for all a, b.
- (a + b) ∧ (a + b) = a ∧ a + b ∧ b.
- 2 • (a ∧ a) = 0.

- The additive map M → antisymSquare R M, a ↦ a ∧ a, which vanishes on 2M.
- A bilinear map f : M → M → N with f a b + f b a = 0 factors uniquely through antisymSquare R M.
- lift f (a ∧ b) = f a b.

- Two linear maps out of antisymSquare R M that agree on every a ∧ b are equal.
- A linear map g : M → N induces antisymSquare R M → antisymSquare R N with map g (a ∧ b) = g a ∧ g b, map id = id and map (g ∘ h) = map g ∘ map h.
- The canonical surjection onto Mathlib's exterior square ⋀[R]^2 M, with toExterior (a ∧ b) = exteriorPower.ιMulti R 2 ![a, b].

- When 2 is invertible in R, a ∧ b ↦ ⅟2 • (a ⊗ b − b ⊗ a) is an R-linear equivalence from antisymSquare R M onto TauCeti.antisymmetricTensors R M.
- antisymSquare R M is equivalent to Representation.Coinvariants of the action of Multiplicative (ZMod 2) on M ⊗ M in which the generator acts by −comm.
- antisymSquare R (M × N) ≃ antisymSquare R M × antisymSquare R N × (M ⊗[R] N).

- antisymSquare ℤ (ZMod n) ≃ ZMod (gcd 2 n), and antisymSquare ℤ ℤ ≃ ZMod 2.

For every abelian group A, the canonical surjection toExterior from antisymSquare ℤ A onto the exterior square ⋀[ℤ]^2 A has kernel the subgroup of classes a ∧ a, and a ↦ a ∧ a induces an isomorphism from A/2A onto that kernel. So 0 → A/2A → antisymSquare ℤ A → ⋀[ℤ]^2 A → 0 is exact (`antisymSquare_diagonal_exact`).

Here A is an abelian group.

The source locators for these statements are Weibel, K-book, VI.5, opening of the section (PDF p. 495).

**Checks.**

- For M = ZMod 2 the class 1 ∧ 1 is nonzero, which the exterior square would kill.
- antisymSquare ℤ ℤ ≃ ZMod 2, generated by 1 ∧ 1. This fails for the exterior square (which is zero), for the tensor square ℤ ⊗ ℤ ≅ ℤ, and for TauCeti.antisymmetricTensors ℤ ℤ (which is ⊥).
- antisymSquare ℤ (ZMod 3) = 0, because 1 + τ = 2 is invertible on ZMod 3 ⊗ ZMod 3; the unquotiented tensor square fails this.
- For R with ⅟2 and any R-module M, equivAntisymmetricTensors is an equivalence antisymSquare R M ≃ₗ[R] TauCeti.antisymmetricTensors R M; for R = M = ℤ no such equivalence exists (ZMod 2 against ⊥).
- For M = ZMod 2 the map toExterior is not injective: its source is ZMod 2 and its target is zero.
- For A=ℤ² with ordered basis (e₁,e₂), the cokernel is (ℤ/2)²⊕ℤ; the exterior projection sends (a,b,c) to c. Thus e₁∧e₁=(1,0,0) is nonzero in the kernel, while e₁∧e₂=(0,0,1) maps to +1. For A=0 all three terms are zero.

*Needs:* the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.2 The projective cross-ratio

Import PolylogarithmFunctions §5.8’s field-general crossRatioSphere, homogeneous comparison, Möbius invariance and normalize_five. Transport its OnePoint coordinates along x↦[1:x], ∞↦[0:1]. On four pairwise distinct points define cr as the reciprocal of that cross-ratio; the supplier value and both homogeneous denominators are nonzero there. No reciprocal identity is asserted on totalized coincident tuples. This adapter gives cr(a,b,c,d)=[d,a][c,b]/([d,b][c,a]), where [u,v]=u₀v₁−u₁v₀, and inherits GL₂ invariance. Prove that cr(a,b,c,d)=g(d), for the unique g∈PGL₂(F) sending (a,b,c) to (0,∞,1). The adapter has cr(0,∞,1,x)=x. Prove that cr induces a bijection from the GL_2(F)-orbits of injective 4-tuples onto F − {0, 1}, and the stabiliser in GL_2(F) of every injective triple is the centre.

- cr : (Fin 4 ↪ ℙ¹(F)) → F − {0, 1}, by the reciprocal adapter; its determinant formula and invariance are transported from the supplier.
- cr(g • t) = cr(t) for g ∈ GL_2(F).
- cr(0, ∞, 1, x) = x for x ∉ {0, 1}.

- cr(t) = cr(t′) if and only if t′ = g • t for some g ∈ GL_2(F).
- GL_2(F) is 3-pretransitive on ℙ¹(F), and the stabiliser of (0, ∞, 1) is the centre.
- cr(b, a, c, d) = cr(a, b, c, d)⁽−¹⁾ and cr(a, b, d, c) = cr(a, b, c, d)⁽−¹⁾.

- The five face values of (0, ∞, 1, x, y) in deletion order below.

The five face values of (0,∞,1,x,y), in deletion order, are (1−x)/(1−y), (1−x⁻¹)/(1−y⁻¹), y/x, y and x. Their alternating sum is precisely the five-term expression. For (x,y)=(2,3) over ℚ these are 1/2, 3/4, 3/2, 3 and 2. Distinctness makes both determinant denominators nonzero. Over F₂ there are no injective four-tuples, agreeing with F₂−{0,1} being empty.

The source locators for these statements are Weibel, K-book, Proof of Lemma VI.5.6 (PDF p. 498).

**Checks.**

- Over ℚ the supplier cross-ratio on (0,∞,1,3) is 1/3 and cr is 3; on (∞,0,1,3) they are 3 and 1/3. This distinguishes the reciprocal convention in both orders.
- Over ℚ, z ↦ z + 1 sends (0, ∞, 1, 2) to (1, ∞, 2, 3), and cr(1, ∞, 2, 3) = 2.
- Over F_3, every ordering of the four points of ℙ¹(F_3) has cross-ratio −1.
- cr(0, ∞, 1, x) ≠ cr(∞, 0, 1, x) when x² ≠ 1, so cr is not a function of the underlying set of four points.

*Needs:* PolylogarithmFunctions §5.8 for crossRatioSphere, its homogeneous comparison, Möbius invariance and normalize_five; Mathlib projectivization and general linear groups; §3.1.

### 3.3 Admissible five-term relations

For the unreduced carrier used by the acceptance statement, define `preBlochRawSymbol` on every field element: it is the basis vector of its unit when nonzero, and zero at zero. Its raw value at one is a free generator. This differs from the reduced rawSymbol below, whose value at one is zero.

- The unreduced raw symbol at zero is zero.
- At a nonzero x its value is the basis vector of the unit x, so that basis vector is nonzero.
- A field embedding sends this raw symbol to the raw symbol of the embedded element, with the identity and composition laws inherited from the free-group maps.

For a field F and elements x, y of F with x and y outside the set consisting of 0 and 1 and with x different from y, the five-term element of the free abelian group on the symbols [z], z in F without 0, is [x] - [y] + [y/x] - [(1 - x⁽⁻¹⁾)/(1 - y⁽⁻¹⁾)] + [(1 - x)/(1 - y)]. The five-term subgroup is the subgroup generated by all these elements together with the element [1]. This is Suslin's normalisation, as presented in the K-book; the Calegari-Garoufalidis-Zagier normalisation indexes the same expression over the projective line and is compared in §§3.13–3.16.

Here F is a field; x and y lie in F, are different from 0 and 1, and are different from each other. The five arguments are then all defined and different from 0.

- The five-term element [x] − [y] + [y/x] − [(1 − x⁽⁻¹⁾)/(1 − y⁽⁻¹⁾)] + [(1 − x)/(1 − y)] attached to an admissible pair (x ≠ y, both in F − {0, 1}).
- The subgroup generated by all five-term elements and by [1].
- Membership in the five-term subgroup as a finite integer combination of five-term elements and of [1].

- For an admissible pair, the five arguments are nonzero.
- For an admissible pair, the five arguments are different from 1.
- If (x, y) is admissible then so is (1 − y, 1 − x).

- If (x, y) is admissible then so is (x⁽⁻¹⁾, y⁽⁻¹⁾).
- fiveTerm (1 − y) (1 − x) = [1 − y] − [1 − x] + [(1 − x)/(1 − y)] − [(1 − x⁽⁻¹⁾)/(1 − y⁽⁻¹⁾)] + [y/x].
- fiveTerm x⁽⁻¹⁾ y⁽⁻¹⁾ = [x⁽⁻¹⁾] − [y⁽⁻¹⁾] + [x/y] − [(1 − x)/(1 − y)] + [(1 − x⁽⁻¹⁾)/(1 − y⁽⁻¹⁾)].

- A field homomorphism sends five-term elements to five-term elements.

For the reduced free carrier use RawSymbols F=ℤ[F−{0,1}] and extend its injection by rawSymbol 0=rawSymbol 1=0. Define Admissible x y by x,y≠0,1 and x≠y, and fiveTermRaw by the same five-term expression in this reduced carrier. Killing [1] identifies the unreduced and reduced quotient presentations. Prove that the extended symbol vanishes at zero and one and that reflection gives the displayed difference of universal classes. The checks below also require rawSymbol(2)≠0 over ℚ, the admissible pair (2,3), rejection of a diagonal pair, and fiveTermRaw(2,3)=[2]−[3]+[3/2]−[3/4]+[1/2].

The source locators for these statements are Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- For an admissible pair all five arguments are nonzero elements of F different from 1.
- In the free abelian group, fiveTerm x y − fiveTerm (1 − y) (1 − x) = [x] + [1 − x] − [y] − [1 − y].
- In the free abelian group, fiveTerm x y + fiveTerm x⁽⁻¹⁾ y⁽⁻¹⁾ + fiveTerm y x + fiveTerm y⁽⁻¹⁾ x⁽⁻¹⁾ = 2([y/x] + [x/y]).
- Over F_4 with ω² + ω + 1 = 0, fiveTerm ω ω² = 3[ω] − 2[ω²].
- The defining formula evaluated at x = y equals [1], so a definition that silently admits the diagonal changes nothing, whereas one that admits y = 1 produces a division by zero.
- In RawSymbols(ℚ), rawSymbol(0)=rawSymbol(1)=0, while rawSymbol(2) is nonzero.
- In the unreduced free unit carrier over ℚ, the raw symbols at 0,1,2 are respectively 0,[1],[2]; the latter two are nonzero and distinct. Killing [1] is a quotient relation, not a raw-symbol convention.
- Admissible(2,3) holds over ℚ, whereas Admissible(x,x) and Admissible(x,1) fail for every field element x.
- For the reduced free carrier, fiveTermRaw(2,3)=[2]−[3]+[3/2]−[3/4]+[1/2].

*Needs:* the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

For a field F, a five-term certificate is a pair (a, k) of a finitely supported function a from admissible pairs — (x, y) with x, y in F − {0, 1} and x ≠ y — to Z, and an integer k. Its evaluation is Σ a(x, y) · R(x, y) + k[1] in the free abelian group on F − {0}, where R(x, y) = [x] − [y] + [y/x] − [(1 − x⁽−¹⁾)/(1 − y⁽−¹⁾)] + [(1 − x)/(1 − y)] is the five-term element of §3.3. A certificate is valid for ξ when its evaluation equals ξ; this is equality in the free abelian group on nonzero elements. Certificates form an abelian group under pointwise addition, and evaluation is a homomorphism. The certificate is Suslin's normalisation (K-book VI.5.1); a certificate in CGZ's normalisation over the projective line is a different object, compared through §3.13.

Here, each pair in the list is admissible for the five-term relation.

- A pair (a, k): a finitely supported function a from admissible pairs to Z, and the coefficient k ∈ Z of [1].
- eval (a, k) = Σ a(x, y) R(x, y) + k[1] in the free abelian group on F − {0}.
- eval of the indicator of (x, y) is R(x, y); eval (0, 1) = [1].

- eval 0 = 0.
- eval (c + c') = eval c + eval c'; eval (−c) = −eval c.
- Valid c ξ ⇔ eval c = ξ.

- Valid c ξ and Valid c' ξ' imply Valid (c + c') (ξ + ξ'); Valid c ξ implies Valid (−c) (−ξ).
- Under FreeAbelianGroup.equivFinsupp, Valid c ξ is equality of the integer coefficient at every nonzero field element; only the finite union of the two supports can have a nonzero coefficient.
- ξ lies in the five-term subgroup of §3.3 if and only if some certificate is valid for ξ.

Provide FiveTermCertificate.map (For a field embedding σ: F → K, map σ c has eval (map σ c) = FreeAbelianGroup.map σ (eval c); map id = id and map (τ ∘ σ) = map τ ∘ map σ);

The source locators for these statements are Weibel, K-book, Definition VI.5.1 (PDF p. 495); Weibel, K-book, Lemma VI.5.4(a), proof (PDF p. 497); Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- eval (0, 0) = 0 and eval (0, k) = k[1]; the certificate with no pairs is valid exactly for the multiples of [1].
- Over Q, eval of the indicator of (2, 3) is [2] − [3] + [3/2] − [3/4] + [1/2].
- For x ≠ y in F − {0, 1}, the certificate with coefficient 1 on (x, y) and −1 on (1 − y, 1 − x) is valid for ([x] + [1 − x]) − ([y] + [1 − y]); a five-term formula with [x/y] in place of [y/x] fails this.
- (x, x) and (x, 1) are not admissible pairs; the second would require the symbol of a quotient with zero denominator.

*Needs:* the free-symbol presentation of §3.3 and Mathlib finite supports. The quotient characterization and coefficient and CGZ transports are proved in §6.1.


### 3.4 The pre-Bloch presentation

The native quotient `preBloch` in Suggested.lean is this unreduced presentation. Its symbol map `preBlochSymbol` is the quotient of preBlochRawSymbol; extending it to zero gives zero, while the relation [1]=0 kills its value at one.

For a field F define the pre-Bloch group P(F) as the abelian group presented by generators [x], one for each x in F without 0, subject to [1] = 0 and to all five-term relations. Equivalently it is the quotient of the free abelian group on F without 0 by the five-term subgroup.

Here F is any field. Restrictions to |F|≥4 belong only to the subsequent torsion identities.

- The pre-Bloch group P(F).
- The class [x] of a nonzero element x.
- [1] = 0.

- Every five-term element is zero in P(F).
- A function on nonzero elements killing [1] and all five-term elements extends uniquely to a homomorphism out of P(F).
- lift f [x] = f x.

- Two homomorphisms out of P(F) that agree on every generator [x] are equal.
- P(F) is generated by the classes [x].
- A field homomorphism induces a homomorphism of pre-Bloch groups, with map_id and map_comp.

- The reduced presentation ℤ[F−{0,1}]/R₅ maps isomorphically to P(F) by [x]↦[x]; its inverse kills the unreduced [1] and preserves every other generator. These maps commute with every field embedding. Evaluation defined on the reduced presentation is transported along this isomorphism to P(F).

The source locators for these statements are Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- P(F_2) = 0: its only generator is [1].
- P(F_3) ≅ ℤ, free on [−1], since there is no admissible pair; a definition that forgot [1] = 0 would give ℤ².
- P(F_4) ≅ ℤ/5, from the relations 3[ω] − 2[ω²] and 3[ω²] − 2[ω].
- P(F_5) ≅ ℤ/6 on [3], with [2] = 2[3] and [4] = 0.
- The quotient symbol at 0 and 1 is zero, while over 𝔽₅ its values at 2 and 3 have orders three and six. A symbol map sending every input to zero fails these controls.
- Over ℚ the reduced-to-unreduced adapter sends the relation at (4,2) to [4]−[2]+[1/2]−[3/2]+[3]=0. At F₂ both presentations are zero, and at F₃ both are infinite cyclic on [−1].

*Needs:* §3.3; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.5 The boundary, its kernel and Matsumoto exactness

Construct the homomorphism from P(F) to the antisymmetric tensor quotient of the group of units of F sending [x] to x wedge (1 - x) for x different from 1, and [1] to 0. The sign convention is the one displayed here; the opposite sign gives the same kernel but a different map, and the choice is recorded rather than left implicit.

Here, the target is the antisymmetric tensor quotient of the multiplicative group of F, written additively.

- The homomorphism P(F) → antisymSquare ℤ (Additive Fˣ).
- The boundary of [x] is x ∧ (1 − x) for x ≠ 0, 1.
- The boundary of [1] is zero.

- ∂([x] + [1 − x]) = 0 for x ∈ F − {0, 1}.
- ∂([x] + [x⁽⁻¹⁾]) = x ∧ (−x) for x ∈ Fˣ.
- The boundary commutes with the maps induced by a field homomorphism.

- Composing with antisymSquare.toExterior gives the classical boundary [x] ↦ x ∧ (1 − x) in ⋀[ℤ]^2 (Additive Fˣ).

Define B(F), Suslin's Bloch group, as the kernel of the boundary from P(F) to the antisymmetric tensor quotient of the units of F. It is a subgroup of P(F), not a quotient, and the target of the boundary is the antisymmetric quotient rather than the exterior square.

Here F is any field. Restrictions to |F|≥4 belong only to the subsequent torsion identities.

- The subgroup B(F) of P(F).
- An element lies in B(F) exactly when its boundary vanishes.
- A field homomorphism induces a homomorphism of Bloch groups.

- The inclusion of B(F) into P(F).
- Two elements of B(F) are equal exactly when their images in P(F) are.
- The symbol-preserving isomorphism of §3.4 commutes with the boundaries from the reduced and unreduced presentations into the same Qₛ(F), and restricts to an isomorphism of their kernels, natural for every field embedding. These identifications transport reduced-presentation evaluation to the shared P(F) and B(F).

For every field F the sequence 0 -> B(F) -> P(F) -> antisymSquare of the units of F -> K_2(F) -> 0 is exact. In particular the cokernel of the boundary is Matsumoto's presentation of K_2(F).

The source locators for these statements are Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- The boundary of a five-term element is zero.
- Over ℚ, β(∂[3]) = −1 for the alternating form β(a, b) = v_2(a)v_3(b) − v_3(a)v_2(b), so ∂[3] = 3 ∧ (−2) and not (−2) ∧ 3.
- Over ℚ the reduced-to-unreduced adapter sends [2] to [2] with boundary 2∧(−1). The pairing s(a)v₂(b)−s(b)v₂(a), with s(u)=1 for negative u and 0 otherwise, gives 1 modulo 2 on both sides; an adapter killing [2] fails this boundary square.
- The composite with antisymSquare.toExterior is [x] ↦ x ∧ (1 − x) in ⋀[ℤ]^2 (Additive Fˣ).
- Over F_5, ∂ maps P(F_5) ≅ ℤ/6 onto antisymSquare ℤ (Additive F_5ˣ) ≅ ℤ/2 with kernel ℤ/3: ∂[3] = 3 ∧ 3 ≠ 0 and ∂[2] = 0.
- Over F_5, ∂([2] + [3]) = 2 ∧ 3 ≠ 0, so the angle-bracket element at 2 is not a Bloch element.
- B(F_5) ≅ ℤ/3, generated by c = [2]; [2] ∈ B(F_5) and [3] ∉ B(F_5).
- B(F_7) ≅ ℤ/4, generated by [−1] = 2[3].
- B(F_4) = P(F_4) ≅ ℤ/5, because antisymSquare ℤ (Additive F_4ˣ) = 0.
- B(F_5) has order 3, whereas the kernel of P(F_5) → ⋀²(F_5ˣ) = 0 is all of P(F_5), of order 6; and [−1] ∉ B(F_3). A definition with the exterior square as target fails both.
- The element [x] + [1 - x] lies in B(F) for every admissible x.

*Needs:* §3.1, §3.4; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.6 Universal torsion and inversion symbols

Let F have at least four elements. For x ≠ y in F − {0, 1}, [x] + [1 − x] = [y] + [1 − y] in P(F). The common value c lies in B(F), since ∂c = x ∧ (1 − x) + (1 − x) ∧ x = 0 in the antisymmetric quotient. Define c ∈ B(F) as this element. Part (b) of the source lemma, on the elements ⟨x⟩, is §3.6; those elements need not lie in B(F).

Here F is a field with at least four elements. x lies in F and is different from 0 and 1.

- The element c ∈ B(F), for |F| ≥ 4.
- c = [x] + [1 − x] in P(F) for every x ∈ F − {0, 1}.
- The class [x] + [1 − x] lies in B(F).

- A field homomorphism sends c to c.

Let F have at least four elements and write ⟨x⟩ = [x] + [x⁽⁻¹⁾] ∈ P(F). The map x ↦ ⟨x⟩ is a group homomorphism from Additive Fˣ to P(F). Its image is an elementary abelian 2-group, and it sends squares to zero. ⟨x⟩ lies in B(F) if and only if x ∧ (−x) = 0 in antisymSquare ℤ (Additive Fˣ), because ∂⟨x⟩ = x ∧ (−x). For example ⟨−1⟩ ∈ B(F), but ⟨2⟩ ∉ B(F_5). The K-book states the target as B(F); the correct target is P(F), see the sign conventions below.

Let F have at least four elements and write ⟨x⟩ = [x] + [x⁽⁻¹⁾] ∈ P(F). For x ≠ y in F − {0, 1}, ⟨y⟩ − ⟨x⟩ = ⟨y/x⟩ in P(F). For every x ∈ Fˣ, 2⟨x⟩ = 0 in P(F). These are statements in P(F): ⟨x⟩ need not lie in B(F).

Let F have at least four elements. Then 3c = ⟨−1⟩ in P(F); both sides lie in B(F), and 6c = 0 in B(F).

Let F have at least four elements. (i) If char F = 2 or F contains a square root of −1, then 3c = 0 in B(F). (ii) If F contains a root ζ of t² − t + 1 (of order six when char F differs from 2 and 3, of order three in characteristic 2, and ζ = −1 in characteristic 3), then c = ⟨ζ⟩ and 2c = 0 in B(F). The K-book's '∛−1 ∈ F' means such a ζ: −1 itself is always a cube root of −1. Neither statement says that c = 0; c = 0 when both hypotheses hold.

The source locators for these statements are Weibel, K-book, VI.5.4 (a) (PDF p. 496); Weibel, K-book, Proof of VI.5.4 (PDF p. 497); Weibel, K-book, VI.5.4 (c) (PDF p. 496); Weibel, K-book, Before VI.5.4 (PDF p. 496); Weibel, K-book, VI.5.4 (b) (PDF p. 496); Weibel, K-book, VI.5.4 (d) (PDF p. 496); Weibel, K-book, VI.5.4.1 (PDF p. 497).

**Checks.**

- Over F_5, c = [2] = 2[3], of order 3 in B(F_5) ≅ ℤ/3.
- Over F_7, c = 2[−1] = 2[4] ≠ 0, of order 2 in B(F_7) ≅ ℤ/4; in particular c ≠ [4].
- Over F_11, c has order 6 and generates B(F_11) ≅ ℤ/6.
- Over F_4, a root ω of t²+t+1 has ω³=1 and ω≠1, so its order is three, not six. Here c=⟨ω⟩=0, since both 2c=0 and 3c=0 apply.

*Needs:* §3.3, §3.4, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.7 Small-field calculations

P(F_2) = B(F_2) = 0. P(F_3) is infinite cyclic on [−1], since there is no admissible pair; ∂[−1] = (−1) ∧ (−1) is the generator of antisymSquare ℤ (Additive F_3ˣ) ≅ ℤ/2, so B(F_3) = 2P(F_3) is infinite cyclic, generated by ⟨−1⟩ = 2[−1] = c. For these two fields the |F| ≥ 4 statements of this layer fail: 2⟨−1⟩ ≠ 0 and 3c ≠ ⟨−1⟩ in P(F_3). Directly from the presentation: B(F_4) = P(F_4) ≅ ℤ/5; P(F_5) ≅ ℤ/6 on [3] and B(F_5) ≅ ℤ/3 on c = [2] = 2[3], with [−1] = 0 and [3] ∉ B(F_5); P(F_7) ≅ ℤ/8 on [3] and B(F_7) ≅ ℤ/4 on [−1] = 2[3], with c = 2[−1] = 2[4]. The general formula for q > 3 is §5.5 and is not used here.

Here F is a finite field with 2, 3, 4, 5 or 7 elements.

The source locators for these statements are Weibel, K-book, VI.5.1.1 (PDF p. 495); Weibel, K-book, Exercise VI.5.3 (PDF p. 508).

*Needs:* §3.1, §3.3, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.8 Replacing the target by the exterior square

For a field F let B̃(F) be the kernel of P(F) → ⋀[ℤ]^2 (Additive Fˣ), [x] ↦ x ∧ (1 − x), the composite of the boundary with antisymSquare.toExterior. This is the group CGZ's Definition 2.1 calls Suslin's Bloch group. It contains this layer's B(F), and it is in general larger.

- The subgroup B̃(F) of P(F).
- z ∈ B̃(F) iff toExterior (∂z) = 0.
- B(F) ≤ B̃(F).

- A field homomorphism maps B̃(F) into B̃(E).

For every field F there is an exact sequence 0 → B(F) → B̃(F) → Fˣ/Fˣ² → K_2(F), where ξ maps to the class a with ∂ξ = a ∧ a, and a maps to {−1, a}. Hence B̃(F)/B(F) ≅ {a ∈ Fˣ/Fˣ² : {−1, a} = 0 in K_2(F)}: this is Fˣ/Fˣ² for finite F, and zero when Fˣ is 2-divisible.

The source locators for these statements are CGZ, arXiv v3 (2021), Definition 2.1, §2.1, p. 8; Weibel, K-book, VI.5, opening of the section (PDF p. 495); Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- B̃(F_5) = P(F_5) ≅ ℤ/6, because ⋀² of a cyclic group is zero, while B(F_5) ≅ ℤ/3.
- B̃(F_3) = P(F_3) ≅ ℤ, while B(F_3) = 2P(F_3).
- B̃(ℂ) = B(ℂ), because ℂˣ is 2-divisible, so toExterior is an isomorphism for Additive ℂˣ.
- ⟨2⟩ ∉ B̃(ℚ): its exterior boundary 2 ∧ (−1) is detected by the alternating form (a, b) ↦ s(a)v_2(b) − s(b)v_2(a) mod 2, where s is the sign.

*Needs:* §3.1, §3.4, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.9 The full-tensor lecture kernel

For every field F put A₀(F)=ℤ[F−{0,1}], T(F)=Additive(Fˣ)⊗ℤ Additive(Fˣ), and λ:A₀(F)→T(F), [x]↦(1−x)⊗x. Define B_raw(F)=ker λ as a subgroup of A₀(F), before imposing any five-term relations. Symbols at 0 and 1, when used in formulas, mean zero in A₀. Its inclusion into A₀ is part of the interface. This full-tensor model is distinct from the Suslin kernel inside P(F). It is named after the full-tensor convention of Bloch's lectures (Lecture 6); no statement of those lectures is used, and the construction is specified by the displayed kernel.

Here F is a field; no field-size hypothesis.

- λ([x])=(1−x)⊗x for x≠0,1.
- α lies in B_raw exactly when λ(α)=0; equality in B_raw is equality in A₀.
- The kernel inclusion B_raw→A₀ is injective, using the Mathlib additive-kernel subtype.

- For a field embedding f:F→E, the free map [x]↦[f(x)] commutes with λ via the tensor map of units, restricts to B_raw, and has identity/composition laws.

Let R₅≤A₀ be generated by the admissible five-term elements, q:A₀↠P(F) the reduced-generator presentation map, and π:T↠Q_s the antisymmetric tensor quotient. Then ∂q=−πλ. Hence q restricts to μ:B_raw→B(F). Define K_raw=R₅∩ker λ, regarded as a subgroup of B_raw. The induced map μ_rel:B_raw/K_raw→B(F) is injective and has image μ(B_raw). No quotient A₀/R₅→T with generator assignment λ exists in general.

Here F is a field; all symbols and signs as in §3.9 and §3.5.

- ∂∘q=−π∘λ as homomorphisms A₀→Q_s.
- For α∈B_raw the image of μ(α) in P(F) is q(α).
- μ(α)=0 iff the underlying free element α belongs to R₅.

- μ_rel is the unique map from B_raw/K_raw composing with the quotient map to μ, and is injective.

These are algebraic consequences of the displayed free-group kernel, the five-term presentation of §3.3 and the identities of §3.6 (Weibel VI.5.1–5.2.1, chapter pp.23–24). Bloch's lectures supply only the name of this convention.

**Checks.**

- B_raw(F₂)=0 because A₀(F₂)=0.
- A₀(F₃)≅ℤ on [−1], T(F₃)≅ℤ/2, and λ([−1]) is its nonzero generator; B_raw(F₃)=2ℤ.
- Over F₅ the admissible relation R(2,3) equals [4] in A₀, and λ([4]) is nonzero of order 2. The ordinary relation subgroup is not contained in B_raw.
- The nonzero free element 2[4] in A₀(F₅) is a lecture cycle and maps to zero under μ; K_raw is not finite torsion.
- The lecture cycle 4[3] over F₅ maps to 4[3]=2c, a nonzero generator of B(F₅)≅ℤ/3.
- Over ℚ, 4[−1] is a nonzero lecture cycle in ker μ and has infinite additive order. Thus μ⊗ℚ itself is not injective.

*Needs:* §3.1, §3.3, §3.4, §3.5; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.10 The obstruction to lifting a lecture cycle

For every field F set S=range(1+τ)≤T, E=im λ∩S and L=λ(R₅)≤E. There is a canonical obstruction o:B(F)→E/L: choose α with qα=β and take λ(α) mod L. It is independent of the lift and is surjective. The sequence 0→K_raw→B_raw→B(F)→E/L→0 is exact. In particular ker μ=K_raw and coker μ≅E/L, not merely an unspecified torsion discrepancy.

Here τ is the tensor flip; R₅, q, λ and K_raw are the preceding definitions.

For a field F with at least four elements, 6·(E/L)=0. Consequently μ_rel:B_raw/K_raw→B(F) is injective with cokernel killed by 6, and becomes an isomorphism after tensoring with ℤ[1/6] or ℚ. Explicitly, if qα=β∈B(F), let σ[x]=[1−x], let deg([x])=1, and interpret [−1]=0 in characteristic 2. Then γ=3(α−σα)+deg(α)·2[−1] belongs to B_raw and μγ=6β. No such conclusion identifies B_raw itself rationally with B(F).

Here F is a field with at least four elements.

Provide lectureObstruction, lectureObstruction_surjective, lectureObstruction_exact and lectureObstruction_six for this obstruction, its image and its annihilator.

**Checks.**

- Over F₂, E=L=0.
- Over F₃, R₅=0 and λ surjects onto ℤ/2, so E=0 and μ:2ℤ→2ℤ is the identity.
- Over F₅, 4[3] maps to a generator of B(F₅), while the nonzero lecture cycle 2[4] lies in the kernel.

The displayed γ proves the cokernel bound by a finite lift; it does not make the free-cycle kernel torsion.

These are algebraic consequences of the displayed free-group kernel, the five-term presentation of §3.3 and the identities of §3.6 (Weibel VI.5.1–5.2.1, chapter pp.23–24). Bloch's lectures supply only the name of this convention.

*Needs:* §3.1, §3.6, §3.9; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.11 The generic configuration presentation

For every field F define G₂^gen(F)=A₀(F)/R_conf, where R_conf is generated by ∑₍ᵢ₌₀₎^4(−1)^i[cr(x₀,…,x̂ᵢ,…,x₄)] for pairwise distinct points x₀,…,x₄∈P¹(F). Use exactly the cross-ratio of §3.2, cr(0,∞,1,z)=z. The generators are P¹(F)−{0,1,∞}; degenerate symbols are zero by notation. No relations from coinciding points are imposed. Its boundary δ_gen is [x]↦(1−x)∧x in Q_s, with descent proved in §3.11.

Here F is a field, possibly F₂ or F₃. Only injective five-tuples occur in R_conf.

- For x≠0,1, class(x) is the quotient class of [x]; symbols 0,1,∞ evaluate to zero.
- The classes of α and β agree iff α−β belongs to R_conf.
- Any assignment into an abelian group annihilating all injective five-point relations extends uniquely to G₂^gen.

- A field embedding maps class(x) to class(f(x)); identity and composition maps agree with those on the free symbols.

For every field F the identity on nondegenerate symbols gives e_gen:G₂^gen(F)≃P(F), integrally, and δ_gen=−∂∘e_gen into Q_s. Consequently ker δ_gen≃B(F), with zero kernel and zero cokernel. If one instead composes with the ordinary exterior-square projection, its kernel corresponds to the B̃(F); the exact discrepancy is §3.8. Tensoring with ℚ makes both wedge targets coincide. Neither G₂^gen itself nor a free projective-line presentation is identified with B(F).

Here F is a field; the boundary uses the antisymmetric tensor quotient specified on p. 218.

The source locators for these statements are Goncharov 1995, pp. 202–203 and §2.3 pp. 253–254; Goncharov 1995, §1.8, p. 218, definition before the Bloch–Suslin complex; Goncharov 1995, §1.8 p. 218, displayed Bloch–Suslin complex.

**Checks.**

- G₂^gen(F₂)=0; the projective line has only three points and there are no nondegenerate generators.
- G₂^gen(F₃)≅ℤ on [−1], since its projective line has only four points and no relation five-tuple.
- G₂^gen(F₅)≅ℤ/6 on [3], while its boundary kernel is ℤ/3. In particular G₂^gen is not the Bloch kernel.

*Needs:* §3.1, §3.2, §3.4, §3.5, §3.8; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.12 Rational smooth-curve specialization

For every field F let V_F=ℚ[P¹(F)] and W_F=ℚ⊗ℤ Q_s(F), and define d_F:V_F→W_F by [x]↦1⊗((1−x)∧x) for x≠0,1,∞, with degenerate values zero. For each smooth connected curve X/F and F-rational points u,v, projective specialization sends rational functions in F(X) to F∪{∞}. Let R_curv^ℚ(F) be the ℚ-span of [0], [∞], and sp_u(α)−sp_v(α), for every such curve and every α∈ker d₍F₍X₎₎. Define G₂^curv(F)=V_F/R_curv^ℚ(F). This is the rational version of §1.9, (1.25a), with the rationalization on both sides. Smooth connected curves over a field are integral; use integral schemes smooth of relative dimension one, not arbitrary fields with unexplained evaluation maps.

Here u,v are F-rational points, not geometric points over an unspecified extension. Specializations take zeros to 0 and poles to ∞. All smooth connected curves occur; F(t) alone is a different relation set. Curve has its usual algebraic meaning: separated and of finite type over F; smoothness has relative dimension one. The integral carrier expresses connectedness in this smooth setting.

- class_F(z) is the image of the basis vector [z] under the Mathlib submodule quotient projection.
- class(α)=class(β) iff α−β∈R_curv^ℚ.
- An ℚ-linear map V_F→M annihilating [0], [∞] and every specialized cycle difference factors uniquely through G₂^curv(F).

- For every smooth connected X/F, u,v∈X(F) and α∈ker d₍F₍X₎₎, the quotient classes of sp_u α and sp_v α agree.

For every field F, R_curv^ℚ(F) lies in ker d_F. Thus d_F descends uniquely to δ_curv:G₂^curv(F)→W_F with δ_curv(class(x))=1⊗((1−x)∧x). The input is the following local specialization lemma: if O is a DVR with fraction field K, residue field k, valuation v and the usual specialization sp([f])=[f̄] for v(f)=0, [0] for v(f)>0 and [∞] for v(f)<0, then d_k(sp α)=0 whenever α is a rational finite symbol combination with d_K α=0. The target is rational and the degenerate symbols have zero boundary. Apply the lemma to the DVR at each F-rational point of a smooth connected integral curve. Prove it by writing f=π^v(f)u, splitting units from valuation powers in Kˣ, and specializing the unit-unit component of its tensor boundary; this is an elementary algebraic input here, before the general polylogarithmic applications.

Here F is a field; canonical projective specialization as in §3.12. The scalar field is ℚ: diagonal and sign 2-torsion vanish.

- δ_curv(class(x))=d_F([x]); it is zero on the three degenerate classes.
- δ_curv is the unique linear map whose composite with the quotient projection is d_F.
- For α∈V_F, its quotient class lies in ker δ_curv iff d_F(α)=0.

For every field F the identity on symbols induces a surjection ψ:P(F)⊗ℚ→G₂^curv(F), compatible with δ_curv=−∂_ℚ. Let R_red=spanℚ([0],[1],[∞])+R₅⊗ℚ inside V_F and K_curv=R_curv^ℚ/R_red. Then ker ψ≅K_curv and coker ψ=0. Because K_curv consists of cycles, ψ restricts to a surjection B(F)⊗ℚ→ker δ_curv with the same kernel K_curv. Over F₃, canonical projective-line inversion gives class(−1)+class(−1)=0, so G₂^curv(F₃)=0 and K_curv≅ℚ, whereas P(F₃)⊗ℚ≅ℚ. Over F₂ both groups and K_curv are zero. Thus an all-field isomorphism is false, and any relation-equality theorem must respect small-field exceptions. No bound by 2, 3 or 6 can dispose of a nonzero rational vector-space kernel. For fields with at least four elements, the statement K_curv=0 is the rational weight-two instance of Conjecture 1.20 in the source; it remains conditional here. The rational-curve presentation, using P¹ alone, is the unconditional theorem of §4.21; it is not substituted for the all-curve assertion.

Here, all-curve specializations and the boundary closure are as in the preceding constructions.

The source locators for these statements are Goncharov 1995, §1.9, pp. 221–224, (1.25a) and Corollary 1.19; Goncharov 1995, §1.9 pp. 221–222, Lemma 1.16; Goncharov 1995, §1.9, p. 225, Conjecture 1.20.

**Checks.**

- class(1)=0, using [t]+[1−t] and the points 0,∞ on P¹.
- For x∈Fˣ, class(x)+class(x⁻¹)=0: rationally [t]+[t⁻¹] is a cycle, and specialize at x and 0. The same integral assertion in P(F) is false in general.
- Over ℚ, the (v₂,v₃) alternating pairing evaluates ∂[3] to −1 and δ_curv(class(3)) to +1. Thus this boundary is nonzero, and using the Suslin sign without reversal fails.
- Over ℂ, δ_curv(class(i))=1⊗((1−i)∧i)=0, since i is torsion in ℂˣ; class(i) is a cycle. Replacing the wedge of multiplicative units by the field’s additive vector space would not give this value.

*Needs:* §3.1, §3.5, §3.11; AlgebraicCurves Layer 12A for the local DVR at a rational smooth point; Mathlib finite supports, tensor products and quotient modules.

### 3.13 The older projective exterior convention

Let Z(F) be the free abelian group on P^1(F) = F ∪ {∞}. Let d : Z(F) → ⋀[ℤ]^2 (Additive Fˣ) be [X] ↦ X ∧ (1 − X), with [0], [1], [∞] ↦ 0, and A(F) = ker d. Let ⟨ξ⟩ be the subgroup generated by the elements ξ₍X,Y₎ = [X] − [Y] + [Y/X] − [(1 − X⁽⁻¹⁾)/(1 − Y⁽⁻¹⁾)] + [(1 − X)/(1 − Y)] for X, Y ∈ P^1(F) with no argument of the form 0/0 or ∞/∞. The arithmetic of P^1 is: a/0 = ∞ for a ≠ 0, a/∞ = 0 for a ≠ ∞, 1 − ∞ = ∞, 0⁽⁻¹⁾ = ∞, ∞⁽⁻¹⁾ = 0. Define B_old(F) = A(F)/(A(F) ∩ ⟨ξ⟩), the image of A(F) in Z(F)/⟨ξ⟩. This is CGZ's Definition 1.1 with C(F) read as A(F) ∩ ⟨ξ⟩. As printed, C(F) ⊆ A(F) fails: ξ₍₂,₁₎ = [2] + [1/2] − [1] is allowed and d ξ₍₂,₁₎ = 2 ∧ (−1) ≠ 0 in ⋀²(ℚˣ).

- The group B_old(F).
- The class of an element of A(F).
- [1] = 0.

- [∞] = −[0].
- 3[0] = 0.
- An admissible ξ₍X,Y₎ that lies in A(F) is zero in B_old(F).

- A field homomorphism induces B_old(F) → B_old(E), with map_id and map_comp.

Let F have at least four elements. The kernel of P(F) → Z(F)/⟨ξ⟩, the map induced by the inclusion of generators, is ⟨Fˣ⟩, the image of x ↦ ⟨x⟩. The target is generated by that image together with [0] ≡ c and [∞] ≡ −c. Consequently B̃(F) → B_old(F) is surjective with kernel B̃(F) ∩ ⟨Fˣ⟩, an elementary abelian 2-group. ⟨X⟩ itself lies in B̃(F) only when X ∧ (−1) = 0 in the exterior square.

Here F is a field with at least four elements.

Let F be a field with at least four elements. The inclusion of generators ℤ[F − {0, 1}] ⊂ ℤ[P^1(F)] induces κ : B(F) → B_old(F), from this layer's Bloch group to the CGZ Bloch group of §3.13, with κ(c) = [0]. κ factors as B(F) ⊆ B̃(F) ↠ B_old(F) through the exterior-kernel group B̃(F) of CGZ's Definition 2.1. Hence ker κ = B(F) ∩ ⟨Fˣ⟩ and coker κ ≅ B̃(F)/(B(F) + (B̃(F) ∩ ⟨Fˣ⟩)), where ⟨Fˣ⟩ ⊆ P(F) is the image of x ↦ ⟨x⟩. Both are elementary abelian 2-groups, and κ becomes an isomorphism after ⊗ ℤ[1/2] and after ⊗ ℤ/n for odd n. Neither vanishes in general: over F_11, κ maps B(F_11) ≅ ℤ/6 (generated by c) onto ⟨[0]⟩ ≅ ℤ/3 ⊂ B_old(F_11) ≅ ℤ/6, so ker κ = {0, 3c} ≅ ℤ/2 and coker κ ≅ ℤ/2. In particular B_old(F) is not in general a quotient of this layer's B(F); CGZ's remark that it is a quotient of 'Suslin's Bloch group' concerns B̃(F), whose boundary target is the exterior square.

Here F is a field with |F| ≥ 4. For F_2, B(F_2) = 0 while B_old(F_2) ≅ ℤ/3 on [0]. B_old(F) is read as in §3.13: the image of A(F) in ℤ[P^1(F)] modulo the five-term elements. Both conventions are read in their own sources and neither is adjusted to the other.

The source locators for these statements are CGZ, arXiv v3 (2021), Definition 1.1, §1.1, p. 2; CGZ, arXiv v3 (2021), Lemma 2.2, §2.1, p. 9; CGZ, arXiv v3 (2021), Proof of Lemma 2.2, p. 9; CGZ, arXiv v3 (2021), Definition 1.1 and the remark after it, §1.1, p. 2; CGZ, arXiv v3 (2021), Proof of Theorem 2.11, §2.5, p. 15; Weibel, K-book, VI.5.1 (PDF p. 495).

**Checks.**

- B_old(F_2) ≅ ℤ/3, generated by [0], whereas B(F_2) = 0.
- B_old(F_5) ≅ ℤ/3, with [0] of order 3 and [1] = 0.
- B_old(F_11) ≅ ℤ/6, with [0] of order 3.
- ξ₍₂,₁₎ = [2] + [1/2] − [1] ∉ A(ℚ): d ξ₍₂,₁₎ = 2 ∧ (−1), detected by (a, b) ↦ s(a)v_2(b) − s(b)v_2(a) mod 2. So C(F) := ⟨ξ⟩ taken literally is not a subgroup of A(F).

*Needs:* §3.3, §3.4, §3.5, §3.6, §3.8; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.14 The published negative-unit tensor target

For every field F let N_neg≤T(F) be the subgroup generated by u⊗(−u), u∈Fˣ, and put Q_neg(F)=T(F)/N_neg, where −u means the multiplicative unit −1 times u, not the inverse or the additive negative of Additive Fˣ. Write ρ:T↠Q_neg. Since range(1+τ)≤N_neg, ρ factors uniquely as T↠Q_s --p_neg→Q_neg. The factor is surjective and its kernel is the subgroup generated by the classes u∧(−u), killed by 2. This is not in general the ordinary exterior square.

Here F is a field; no field-size hypothesis for the tensor quotient.

- ρ(u⊗(−u))=0 for every multiplicative unit u.
- The canonical ρ:T→Q_neg is surjective, and p_neg∘π=ρ.
- A ℤ-linear map T→M killing every u⊗(−u) factors uniquely through Q_neg.

- range(1+τ)≤N_neg; the comparison from Q_s is a quotient map, not a projection to the exterior square.

Assume |F|≥4 and let H=im(h:Fˣ→P(F)), h(u)=[u]+[u⁻¹], as in §3.6. Then ker(p_neg:Q_s→Q_neg)=∂H. Equivalently ker(p_neg∘∂:P→Q_neg)=B(F)+H. Here H lies in P(F) and need not be a subgroup of B(F); only B(F)∩H is a Bloch subgroup. Also 2H=0.

Here F is a field with at least four elements.

The source locators for these statements are CGZ 2023, §2.1, p. 391, Definition 2.1; CGZ 2023, §2.1, p. 391, Lemma 2.2 and proof.

**Checks.**

- Q_neg(F₃)≅ℤ/2, whereas ⋀² Additive(F₃ˣ)=0.
- Q_s(F₅)≅ℤ/2 but Q_neg(F₅)=0, since for a generator g of F₅ˣ, g⊗(−g) is 3 times the generator of T≅ℤ/4.
- In the ordinary exterior square of ℚˣ, 2∧(−2)=2∧(−1)≠0, while Q_neg kills it. Thus the ordinary exterior boundary cannot be substituted for the published target.

*Needs:* §3.1, §3.5, §3.6; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.15 The published projective presentation

For every field F define d_new:Z_P¹(F)=ℤ[P¹(F)]→Q_neg(F) by [x]↦ρ(x⊗(1−x)) when x≠0,1,∞ and the three degenerate symbols↦0. Reuse the projective arithmetic and all admissible extended five-term elements ξ₍X,Y₎ of the §3.13, including diagonal X=Y when the displayed fractions are defined. Let C_ext be their generated subgroup, unchanged from the CGZ presentation. Then C_ext≤ker d_new. Thus d_new descends to d_quot:Z_P¹/C_ext→Q_neg. No intersection repair is necessary for this published definition.

Here, admissibility forbids 0/0 and ∞/∞; it does not simply exclude all degenerate points.

- d_new([x])=ρ(x⊗(1−x)) for x≠0,1,∞; d_new([0])=d_new([1])=d_new([∞])=0.
- Every admissible extended ξ₍X,Y₎ belongs to ker d_new; hence C_ext≤ker d_new.
- d_quot is the unique additive map with d_quot∘q_ext=d_new.

- On reduced nondegenerate symbols, d_quot∘j=p_neg∘∂, where j:P(F)→Z_P¹/C_ext is the presentation map.

For any field F define B_new(F)=ker(d_new)/C_ext. The containment C_ext⊂ker(d_new) is essential. Equivalently it is the kernel of d_quot on ℤ[P¹(F)]/C_ext. The equivalence sends the class of a free cycle to its projective-presentation class. For |F|≥4 the extended pre-Bloch group is P(F)/H, and this identifies B_new with (B+H)/H. B_old always denotes the different, intersection-repaired exterior-cycle presentation of §3.13.

Here, the P/H description uses |F|≥4; the free projective presentation itself does not.

- A free projective cycle α∈ker d_new gives cycleClass(α)∈B_new.
- cycleClass(α)=cycleClass(β) iff α−β∈C_ext.
- The map ker(d_new)/C_ext≃ker d_quot sends a cycle class to its class in the extended presentation.

- An additive map ker d_new→M killing C_ext descends uniquely to B_new.

The source locators for these statements are CGZ 2023, §2.1, p. 391, Definition 2.1; CGZ 2023, §2.1, p. 391, Lemma 2.2 and proof.

**Checks.**

- d_new([2]+[3])=0 in Q_neg(F₅), although ∂([2]+[3])≠0 in Q_s(F₅).
- For F=ℚ, ξ₍₂,₁₎=[2]+[1/2]−[1] has d_new boundary zero; its ordinary-exterior boundary is the nonzero 2∧(−1).
- B_new(F₂)≅ℤ/3 on [0], although B(F₂)=0. The unrestricted field version of Lemma 2.2 is false.
- B_new(F₃)=0. The extended presentation is ℤ/2 on [−1], whose d_quot map to Q_neg≅ℤ/2 is an isomorphism.
- B_new(F₁₁)≅ℤ/3 on the image of c, whereas B_old(F₁₁)≅ℤ/6. The two CGZ versions are not interchangeable integrally.

*Needs:* §3.3, §3.5, §3.13, §3.14; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### 3.16 Exact convention maps

For every field F, inclusion of nondegenerate symbols induces κ_new:B(F)→B_new(F), by boundary compatibility. For |F|≥4, identify it with B↪B+H↠(B+H)/H. It sends c to [0], sends h(u) to zero whenever h(u) lies in B, and is natural under field embeddings. Its quotient target does not mean all h(u) are Bloch cycles. Surjectivity and the exact 2-primary kernel are the separate exact comparison below.

Here, statements involving the c and H use |F|≥4.

- The underlying extended-quotient class of κ_new(β) is j(β) for β∈B.
- For |F|≥4, κ_new(c)=[0] in B_new.
- For |F|≥4, if h(u)∈B then κ_new(h(u))=0; the membership hypothesis is required.

- For a field embedding f, the Bloch and modified-CGZ symbol maps commute with κ_new, with identity/composition laws from the free maps.

For |F|≥4, κ_new:B(F)→B_new(F) is surjective, ker κ_new=B(F)∩H and 2·ker κ_new=0. Thus 0→B∩H→B→B_new→0 is exact, and B_new≃B/(B∩H) canonically. The cokernel is zero. This proves the published Lemma 2.2 without importing the nonzero-cokernel statement belonging to the older exterior convention. The |F|≥4 hypothesis is necessary for this theorem as stated: F₂ has a nonzero cokernel, and F₃ has an infinite kernel not killed by 2.

Here F is a field with at least four elements.

For |F|≥4 let B_old be the repaired exterior-kernel group. There is a canonical injection ι_new_old:B_new→B_old, identifying B_new with the image of B inside P/H. Its kernel is zero and its cokernel is B̃/(B+(B̃∩H)), killed by 2. The older comparison factors as κ_old=ι_new_old∘κ_new. The map is defined using the shared extended presentation P/H, not by a nonexistent general projection Q_neg→⋀²Fˣ. Over F₁₁ the inclusion is ℤ/3↪ℤ/6 of index 2. Over F₇ it is ℤ/2↪ℤ/4 of index 2. Hence the source version changes the integral target even though all three groups agree after inverting 2.

Here F is a field with |F|≥4, with B_old defined by its repaired exterior-cycle quotient.

For |F|≥4, tensoring κ_new and ι_new_old with ℤ[1/2] or ℚ gives isomorphisms B→B_new→B_old; κ_old is their composite. Tensoring these maps with ℤ/n gives isomorphisms whenever n>0 is odd. The lecture comparison μ_rel:B_raw/K_raw→B becomes an isomorphism over ℤ[1/6] and ℚ, and modulo n>0 coprime to 6. These are the specified canonical maps, not merely abstract isomorphisms. The integral generic Goncharov comparison already has zero correction. For G₂^curv the exact rational kernel K_curv remains; its vanishing is not a coefficient export. Imposing the further relation [0]=0 on B_new kills its subgroup generated by κ_new(c), of order dividing 3, and the composite B→B_new/⟨[0]⟩ has exact kernel (B∩H)+⟨c⟩, killed by 6, with zero cokernel. This last quotient describes the effect of an extra degenerate-zero relation; it is not the generic Goncharov presentation.

Here, modulo n uses n>0 and the stated coprimality; the 2 and 3 exclusions are mathematical, not blanket algorithmic exclusions.

The source locators for these statements are CGZ 2023, §2.1, p. 391, Lemma 2.2 and proof; CGZ 2023, §2.1, p. 391, Definition 2.1; Bloch, Higher Regulators, Lecture 6 (name of the convention only); Goncharov 1995, §1.9, p. 225, Conjecture 1.20.

**Checks.**

- κ_new:B(F₅)≅ℤ/3→B_new(F₅)≅ℤ/3 is an isomorphism and preserves c.
- κ_new:B(F₇)≅ℤ/4→B_new(F₇)≅ℤ/2 has kernel generated by h(−1)=c, of order 2; κ_new(c)=0.
- κ_new:B(F₁₁)≅ℤ/6→B_new(F₁₁)≅ℤ/3 sends c to a generator and has kernel {0,3c}.

*Needs:* §3.5, §3.6, §3.7, §3.8, §3.10, §3.11, §3.12, §3.13, §3.14, §3.15; the tensor, exterior-power and Matsumoto contracts; the preceding presentations in this layer.

### Examples

For ℚ, ∂([2]+[−1])=2∧(−1)+(−1)∧2=0, while ∂[2] is nonzero of order two. For F₅, P=ℤ/6 on [3], B=ℤ/3 on [2], and the exterior-kernel group is all of P. For F₁₁, B=ℤ/6 on c, B_new=ℤ/3, and B_old=ℤ/6; κ_new is onto while κ_old has an order-two kernel and an order-two cokernel. Abstract equal orders do not identify the maps. The rational all-curve comparison retains the explicit kernel K_curv and its conditional vanishing statement.

### Dependencies

Use Mathlib tensor products, free abelian groups, quotient modules, exterior powers, projectivization and general linear groups, with K2SymbolsBrauer §7.2 for Matsumoto. PolylogarithmFunctions §5.8 supplies the projective cross-ratio foundations used by the normalization adapter of §3.2. Smooth-curve specialization uses AlgebraicCurves Layer 12A for the local DVR dictionary and the local algebraic lemma stated here. No K₃-to-Bloch theorem is used to construct these presentations or their convention maps.

## Layer 4: Configuration homology and the Suslin sequence

The homology arguments up to the infinite-field Suslin sequence assume F infinite unless a statement explicitly says otherwise. Independent vector frames prove the stability and Milnor quotient needed by the projective-configuration construction. The monomial calculation then identifies the integral kernel, including its enhancement at two.

### 4.0 Ordered configurations and augmentation

For a set X let C_n(X) be the free abelian group on the ordered tuples of n + 1 pairwise distinct points of X, with the alternating-sum differential that deletes one entry, and with the augmentation sending each singleton to 1. When a group acts on X this is a complex of modules over the group ring. The tuples are ordered and the entries are required to be distinct; both are part of the definition.

Here X is a set; G is a group acting on X when the equivariant structure is used.

- The chain complex C_*(X) of abelian groups (and of G-modules when G acts on X), indexed by ℕ.
- For an injective tuple x : Fin (n + 1) ↪ X, the basis element [x] of C_n(X).
- d [x] = Σ₍ᵢ₌₀₎⁽ⁿ⁾ (−1)^i [x ∘ Fin.succAbove i].

- The differential squares to zero.
- The augmentation C_0(X) → ℤ with aug [x] = 1.
- aug ∘ d_1 = 0.

- The action of a group acting on X, by acting on every entry; g • [x] = [g • x].
- C_n(X) is Rep.ofMulAction ℤ G (Fin (n + 1) ↪ X) and d is a morphism of representations, so C_*(X) is a ChainComplex (Rep ℤ G) ℕ; Fin (n + 1) ↪ X is the index type of Mathlib's MulAction.IsMultiplyPretransitive.
- An injection f : X ↪ Y induces a chain map, with map id = id and map (g ∘ f) = map g ∘ map f, compatible with the augmentations.

If X is an infinite set, the augmented configuration complex C_*(X) → ℤ is exact; equivalently the augmentation is a quasi-isomorphism. The identification of hyperhomology with group homology that the K-book deduces (Corollary VI.5.5.2) is constructed in §4.1, and the finite-set version below supplies both §4.15 and §5.4.

The infinite-set assertion assumes X infinite. For a finite set X of cardinality m, use augmented length degree: A₀=ℤ and Aₖ=Cₖ₋₁(X) for k≥1. Prove Hₖ(A)=0 for k<m; only degree m can survive. In particular for m=0 the augmentation copy ℤ survives in degree zero. Successive insertion and elimination of letters gives the exactness without requiring a point outside the entire support (Kerz, Theorem 1, pp.1–2; kerz line 22). Section 4.15 consumes this general theorem, while §5.4 specializes it to X=P¹(Fq).

The source locators for these statements are Weibel, K-book, Definition VI.5.5 (PDF p. 497); Weibel, K-book, Lemma VI.5.5.1 and its proof (PDF p. 497); Weibel, K-book, Exercise VI.5.1 (PDF p. 508).

**Checks.**

- d ∘ d = 0 in every degree; the unsigned sum of deletions fails, giving d d (x, y, z) = 2(x) + 2(y) + 2(z).
- For X empty, all C_n(X) are zero and A₀=ℤ survives: the finite theorem does not claim exactness at augmented degree m=0.
- For a one-point set X, C_0(X) = ℤ, C_n(X) = 0 for n ≥ 1, and the augmentation is an isomorphism.
- For X = {x, y}, H_1(C_*(X)) ≅ ℤ, generated by (x, y) + (y, x); a definition admitting repeated entries gives an acyclic complex here.
- For |X| = 3 the groups C_0, C_1, C_2 have ranks 3, 6, 6 (ordered tuples, not the ranks 3, 3, 1 of subsets) and the homology is ℤ, 0, ℤ² in degrees 0, 1, 2.
- For |X|=5, including P¹(𝔽₄), the augmented chain ranks are 1,5,20,60,120,120 and the boundary ranks are 1,4,16,44,76. Homology in ordinary degrees 1,2,3 is zero, while the top ordinary H₄ has rank 44; this pins the q=4 comparison range.
- d(x_0, x_1) = (x_1) − (x_0), and aug(d(x_0, x_1)) = 0.
- For G acting on X, d(g • s) = g • d(s) and aug(g • s) = aug(s) for every chain s.

*Needs:* Mathlib free abelian groups and representations; the infinite-set contraction uses a fresh point outside each finite support, while finite exactness uses successive letter insertion (Kerz, Theorem 1, pp.1–2).

### 4.1 Group-module hyperhomology

For a group G and a bounded-below complex C of integral G-modules, construct Hₙ(G,C) from the total complex of a projective right ℤ[G]-resolution P of ℤ tensored with C. On P_q⊗C_p fix D=1⊗d_C+(−1)ᵖd_P⊗1; the two summands then anticommute. Comparison maps make it independent of the chosen resolution and invariant under equivariant quasi-isomorphisms. Its finite-in-each-total-degree filtration has E¹₍ₚ,q₎=H_q(G,C_p) and converges to H₍ₚ₊q₎(G,C). The augmentation P→ℤ gives a natural map to Hₙ(C_G). Specializing to ordered configurations defines configHyperhomology and its map to the coinvariant complex; for an infinite set X, augmentation identifies it with Hₙ(G,ℤ). This same generic construction is used for the frame spectral sequence, with a finite frame filtration.

Here G is a group acting on the set X. For the identification with H_n(G, ℤ): X is infinite.

- H_n(G, C_*(X)), the homology of the total complex of P ⊗_G C_*(X).
- The canonical map H_n(G, C_*(X)) → H_n(C_*(X) ⊗_G ℤ).
- For X infinite, the augmentation induces H_n(G, C_*(X)) ≅ groupHomology (Rep.trivial ℤ G ℤ) n.

- A G-equivariant quasi-isomorphism of bounded-below complexes induces an isomorphism of hyperhomology.
- Naturality for a group homomorphism with a compatible injection of G-sets, commuting with toCoinvariants and iso_groupHomology.

For C concentrated in degree zero at a module M, this is ordinary Hₙ(G,M). For C=0 it is zero. For the trivial group and any C it is Hₙ(C), with identity comparison to coinvariants. These checks characterize the general construction before specializing C to frames or configurations later in this layer.

The source locators for these statements are Weibel, K-book, Definition VI.5.5, second paragraph (PDF p. 497); Weibel, K-book, Corollary VI.5.5.2 (PDF p. 497).

**Checks.**

- For the trivial group the map H_n(1, C_*(X)) → H_n(C_*(X)) is the identity.
- For G = GL_2(F) acting on ℙ¹(F), H_q(G, C_1(ℙ¹(F))) ≅ H_q(T_2, ℤ) via groupHomology.indIso; the stabiliser of (0, ∞, 1) is the centre, so H_q(G, C_2(ℙ¹(F))) ≅ H_q(F^×, ℤ).
- For G trivial and X = {x, y}, H_1(G, C_*(X)) ≅ ℤ while H_1(G, ℤ) = 0: without acyclicity the identification with group homology fails.
- For X infinite and G transitive on X, H_0(G, C_*(X)) ≅ ℤ ≅ H_0(C_G), and the canonical map is an isomorphism.
- For C concentrated at degree zero at M, the generic hyperhomology is Hₙ(G,M).
- For the zero complex it is zero in every degree.
- For G trivial the augmentation-to-coinvariants map is the identity on Hₙ(C).

*Needs:* §4.0; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.2 Independent-vector chains

For a field F and n,m≥0, C₀ⁿ,ᵐ=Z and C_qⁿ,ᵐ is the free abelian group on ordered q-tuples (vᵢ,wᵢ)∈Fⁿ⊕Fᵐ with the projected family vᵢ linearly independent, q≥1. The boundary is alternating deletion, d(v,w)=1 in degree1. Thus C_q=0 for q>n. This is the shifted augmented complex of Um(Fⁿ,Fᵐ), not the projective configuration complex. It carries the natural action of Aₙ,ₘ={ (g 0;u 1):g∈GLₙ(F),u∈Hom(Fⁿ,Fᵐ)}.

Here F any field, n,m≥0; no infinitude required for construction.

- The complex Cⁿ,ᵐ with the stated augmentation, differential and action.
- An independent ordered q-frame gives a basis chain in degreeq, including the empty frame.
- For q≥1, the boundary of a basis frame is the alternating sum of its q deleted frames.

- The degreeq underlying module is linearly equivalent to the free abelian group on the projected-independent q-frames.
- For m=0 the complex is a complex in Rep Z GLₙ; forgetting the action recovers Cⁿ,⁰.
- A field embedding acts on both coordinate blocks and induces a chain map, commuting with augmentation; identity and composite embeddings induce identity and composite maps.

- The lower block (g 0;u 1) acts by (v,w)↦(gv,uv+w), giving a chain automorphism. Identity and composition follow the actual lower-block multiplication, including the shear when m>0.
- The action sends each independent frame basis chain to the basis chain of its coordinatewise lower-block transform.
- For m=0 the underlying-complex equivalence identifies the GL representation on every basis frame with the coordinatewise g action; merely giving the right underlying module is insufficient.

For infinite F, H_q(Cⁿ,ᵐ)=0 for q≠n. Equivalently Um(Fⁿ,Fᵐ) is (n−2)-acyclic in reduced homology; the only possible homology of the shifted augmented complex is its top group Uₙ,ₘ=H_n(Cⁿ,ᵐ). For n=0 the empty augmentation Z is precisely that top group.

Here F infinite; n,m≥0.

The source locators for these statements are Suslin 1984, §2 definitions, Lemmas2.1–2.2, pp191–192; Suslin 1984, Lemmas2.1–2.2, pp191–192.

**Checks.**

- C⁰,ᵐ has degree0 Z and zero positive terms, even when m>0.
- For n=1,m=0, d(a)=1 for a≠0, so d((2)−(1))=0 over Q; there are no degree2 independent frames.
- For the standard frame (e₁,e₂) in F², d(e₁,e₂)=(e₂)−(e₁); forgetting the order or using an all-positive boundary fails.
- The distinct vectors e₁ and 2e₁ in Q² are not a degree2 generator. Distinctness alone is insufficient.
- For n=m=1 over Q, the block (1 0;1 1) sends the degree-one frame (1,0) to (1,1). A trivial action on the lower coordinates fails.

*Needs:* Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.3 Scalar acyclicity and affine stabilizers

For an infinite field F, an F-vector space V, a prime field k, j>0 and i≥0, Hᵢ(Fˣ,Hⱼ(V_add,k))=0, where Fˣ acts by scalar multiplication on V and hence on its additive-group homology. V need not be finite-dimensional. This is coefficient homology, not the assertion that Hⱼ(V_add,k) itself vanishes.

Here F infinite; k=Q or F_p; j>0.

Let G₁≤GLₙ(F), G₂≤GLₘ(F), and M≤Matₙ,ₘ(F) be an F-linear subspace stable under left G₁ and right G₂ multiplication. If F is infinite and either G₁ or G₂ contains every scalar matrix, the block-diagonal inclusion G₁×G₂→{(g₁ u;0 g₂):u∈M} induces an isomorphism on integral homology in every degree. The stronger all-diagonal hypothesis printed in Su84 implies this sufficient scalar hypothesis.

Here n,m≥1; F infinite; scalar containment in at least one block; M stable.

The source locators for these statements are Suslin 1984, Corollary1.8, p191; Suslin 1984, Theorem1.9 and proof, p191.

*Needs:* Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.4 Top frame coinvariants

Define Sₙ(F)=H₀(GLₙ(F),Uₙ,₀) using integral coefficient homology and the representation on top frame homology. For n≥1, ⟨a₁,…,aₙ⟩ is the coinvariant class of the alternating sum of the n-element faces of (e₁,…,eₙ,Σaᵢeᵢ), aᵢ∈Fˣ. Each face is independent; the (n+1)-tuple itself is not a generator of Cⁿ,⁰. Direct-sum concatenation of independent frames induces associative products Sₙ⊗Sₘ→Sₙ₊ₘ, with S₀=Z as unit. This is Suslin’s frame-homology algebra, not Milnor K-theory itself.

Here F infinite for the generator presentation; the underlying coinvariants are defined for any field.

- The existing H₀ of the top-homology representation.
- For n≥1 and nonzero entries, the specified boundary class ⟨a⟩.
- Two additive homomorphisms out of Sₙ agreeing on every ⟨a⟩ agree, n≥1.

- For pairwise distinct λᵢ∈Fˣ, ⟨λ₁a₁,…,λₙaₙ⟩−⟨a₁,…,aₙ⟩=Σᵢ(−1)ⁱ⁺ⁿ⟨a₁(λ₁−λᵢ),…, omit aᵢ(λᵢ−λᵢ),…,aₙ(λₙ−λᵢ),λᵢ⟩, with indices1,…,n.
- Associative bilinear direct-sum product, with S₀=Z acting by integer multiplication; the product uses ordered concatenation.
- The unique homomorphism Sₙ→Kₙᴹ(F) sends every ⟨a⟩ to {a₁,…,aₙ}, using the Milnor-symbol presentation of K2SymbolsBrauer §5.4.

- The empty-frame augmentation class 1 in S₀=Z is the multiplicative unit.
- Multiplication by that unit on either side is the identity, after transporting 0+n and n+0.
- Multiplication by e=⟨1,1⟩ is the additive map Sₙ→Sₙ₊₂, with the displayed ordered-product formula.

- eMul(x)=mul(⟨1,1⟩⊗x), transporting the codomain index 2+n to n+2.

The source locators for these statements are Suslin 1984, §2.3–2.5, pp192–195.

**Checks.**

- S₀(F) is Z, not the zero group.
- S₁(F)≅Fˣ written additively, and ⟨a⟩ maps to a; in particular ⟨1⟩=0.
- Under S₂(F)≅K₂ᴹ(F)⊕Z, ⟨1,1⟩ maps to (0,1), so S₂ is not just K₂ᴹ and this class is nonzero.
- ⟨a⟩·⟨b⟩=⟨a,b⟩−⟨1,b⟩−⟨a,1⟩+⟨1,1⟩; the Milnor retraction sends it to {a,b}.

*Needs:* §4.2, §4.3; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.5 Connecting homomorphisms and ordered Milnor symbols

For infinite F and n≥1, the exact augmented frame complex defines δₙ:Hₙ(GLₙ(F),Z)→Sₙ(F) by n successive connecting homomorphisms. Its restriction along GLₙ₋₁→GLₙ is zero. With ordered block-sum homology products, δₙ₊ₘ(x×y)=δₙ(x)·δₘ(y). The connecting-map convention is pinned by δ₁([a])=⟨a⟩, so the Milnor symbol comparison has no unspecified sign.

Here F infinite; n≥1; integral homology; stabilization is diag(g,1).

- The homomorphism δₙ defined from the exact augmented complex.
- δₙ vanishes on the image of Hₙ(GLₙ₋₁), not on all of Hₙ(GLₙ).
- δₙ₊ₘ sends the ordered block-sum product to the S-algebra product.

- On H₁(GL₁)=Fˣ written additively, δ₁([a])=⟨a⟩.
- The connecting map commutes with field embeddings and the induced maps on group homology and Sₙ.

For infinite F and n≥1 define θₙ:Kₙᴹ(F)→Hₙ(GLₙ(F),Z)/im Hₙ(GLₙ₋₁(F),Z) by {a₁,…,aₙ}↦the quotient class of the ordered block-diagonal product [a₁]×⋯×[aₙ]. It is the unique homomorphism with this generator formula. Multilinearity and the Steinberg relation make it well-defined before stability is proved.

Here F infinite; n≥1; ordered homology cross products, not Quillen products.

- The symbol-induced additive map θₙ to the quotient by the stabilization image.
- A Milnor symbol maps to the quotient class of the ordered degree-one homology product.
- θ commutes with field embeddings and their maps on Milnor K-theory, GL homology and stabilization quotients.

- Every additive map from Kₙᴹ to the stabilization quotient with the ordered-product formula on symbols equals θₙ.

The composite Kₙᴹ(F)→θₙ Hₙ(GLₙ)/im Hₙ(GLₙ₋₁)→δₙ Sₙ(F)→Kₙᴹ(F) is the identity, for infinite F and n≥1. In particular θₙ and its lift into Sₙ are injective. This statement is established before the stability spectral-sequence induction.

Here F infinite; n≥1; the connecting convention δ₁([a])=⟨a⟩.

For n=2 use the target unstableSL2SymbolCoinvariants of this roadmap. For every infinite field F, conjugation by diag(c,1) makes H₂(SL₂(F);ℤ) an Fˣ-module. Its coinvariants map isomorphically to K₂ᴹ(F) under stabilization to SL∞ and the product-normalized Matsumoto comparison. The contract includes the commuting ordered-torus square: the class [diag(a,1)|diag(1,b)]−[diag(1,b)|diag(a,1)] in H₂(GL₂), after quotient by im H₂(GL₁), corresponds to {a,b}. This is an unstable statement; the stable universal central extension does not supply it.

Its proof has three separate targets. unstableSL2_symplecticPresentation identifies H₂(SL₂) with the symplectic-symbol presentation, including the conjugation action. In additive symbol notation s(a,b), its relations are s(1,b)=s(a,1)=0, s(a,b)=s(b⁻¹,a), s(a,bc)+s(b,c)=s(ab,c)+s(a,b), s(a,b)=s(a,−ab), and s(a,b)=s(a,(1−a)b) for a≠1. The action is c·s(a,b)=s(a,bc)−s(a,c). unstableSL2_coinvariantPresentation then imposes the coinvariant relations. The action formula gives additivity in b; the inverse-swap relation gives additivity in a and skew-symmetry. The last relation, with b=1, gives s(a,1−a)=0. Conversely the Milnor symbols satisfy all five relations and the action formula, so the maps on generators are inverse. Finally unstableSL2_orderedTorus identifies this presentation map with stabilization and with the ordered diagonal bar cycle, by the root-lift commutator calculation, not by an abstract isomorphism of groups. The presentation and action can be read in Hutchinson 2013, Theorem 2.9 and proof, pp.9–10; the ordered torus and retraction comparison is Suslin 1984, §§2.6–2.7, pp.195–196. The stable Milnor K₂ and Matsumoto results of K2SymbolsBrauer §§5.4 and 7.2 are prerequisites of these targets, not substitutes for them.

Given these targets, the split extension SL₂→GL₂→Fˣ and H₁(SL₂)=0 identify H₂(GL₂)/im H₂(GL₁) with the Fˣ-coinvariants of H₂(SL₂). The section makes the possible incoming transgression zero. Thus θ₂ is defined before any degree-three stability claim. For n>2, multiply the rank-two Steinberg-null class by the remaining ordered degree-one classes and stabilize: the relation lands in im Hₙ(GLₙ₋₁). Multilinearity is the cross-product multilinearity. This supplies the prerequisite for the simultaneous induction rather than invoking that induction to define its own retraction.

The source locators for these statements are Suslin 1984, §2.6 and Lemma2.6.1, p195; Suslin 1984, 2.7.1–2.7.4 and Theorem3.4(d), pp195–198; Suslin 1984, Corollary2.7.4, p196.

**Checks.**

- δ₁([2])=⟨2⟩ over Q under the abelianisation identification.
- Every H₃(GL₂) class maps to zero under δ₃ after stabilization.
- The Milnor retraction of δ₃([a]×[b]×[c]) is {a,b,c}, including the order of the three factors.
- θ₁ is Fˣ≅H₁(GL₁) because H₁(GL₀)=0.
- The ordered torus product [a]×[1−a]×[b] has zero class modulo im H₃(GL₂), for a≠0,1 and b≠0.
- Over R, {-1,-1,-1} maps to a nonzero quotient class of order2. An erroneous multiplication-by-2 normalization would kill it.

*Needs:* §4.2, §4.4; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.6 Splitting the frame algebra

For infinite F, S₂(F)≅K₂ᴹ(F)⊕Z with ⟨a,b⟩↦({a,b},1). For n≥2, Sₙ is the internal sum of the embedded Kₙᴹ and the image of multiplication by e=⟨1,1⟩ from Sₙ₋₂; the intersection is zero. Multiplication by e is injective once the stability induction below is established. For n≥3 all Sₙ are generated by products of positive-degree classes.

Here F infinite; use the normalized Milnor section θ through δ and the Milnor retraction.

The source locators for these statements are Suslin 1984, 2.7.4, 3.3.1–3.3.5, pp196–198.

*Needs:* §4.4, §4.5; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.7 Diagonal and monomial subgroups

For a field F and n ≥ 1 let T_n ⊂ GL_n(F) be the diagonal matrices, Σ_n ⊂ GL_n(F) the permutation matrices and M_n = T_n ⋊ Σ_n ≅ F^× ≀ Σ_n the monomial matrices (one nonzero entry in each row and column). Let M = ⋃_n M_n ≅ F^× ≀ Σ_∞ and Σ_∞ = ⋃_n Σ_n inside GL(F), with M_n ⊂ M₍ₙ₊₁₎ by block sum with 1.

Here F is a field; n ≥ 1.

- T_n as a subgroup of GL_n(F).
- Σ_n as permutation matrices in GL_n(F).
- M_n as a subgroup of GL_n(F).

- T_n is normal in M_n with quotient Σ_n, and M_n = T_n ⋊ Σ_n.
- T_n ≅ (F^×)^n.
- The inclusions M_n ⊂ M₍ₙ₊₁₎ by block sum, and M = ⋃ M_n ≅ F^× ≀ Σ_∞ in GL(F).

The source locators for these statements are Weibel, K-book, Before Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Monomial matrices, before Proposition VI.5.15 (PDF p. 503).

**Checks.**

- For F = F_2, M_2 has order two and T_2 is trivial.
- T_n is isomorphic to (F^×)^n.
- For n = 2 and F = F_3, M_2 is a proper subgroup of GL_2(F_3), of order 8 against 48.
- For n = 1, T_1 = M_1 = GL_1(F) = F^×.

*Needs:* Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.8 The stability induction

For infinite F and n≥1, the frame hyperhomology spectral sequence has E¹₍ₚ,q₎=H_p(GLₙ₋q(F),Z), 0≤q≤n, and abuts to H₍ₚ₊q−ₙ₎(GLₙ(F),Uₙ) with the finite frame filtration. The d¹ in odd q is stabilization and in even q is zero. Its dʳ vanish for every r≥2. Multiplication by e:Sₙ₋₂→Sₙ is injective for n≥2. The degree-n edge has kernel im Hₙ(GLₙ₋₁) and its Milnor retraction identifies the quotient with Kₙᴹ. Consequently the finite-step stabilization H_i(GLₙ₋₁)→H_i(GLₙ) is an isomorphism for i≤n−1. Equivalently, for n,i≥0 with i≤n, the actual block inclusion GLₙ(F)→GLₙ₊₁(F) induces a bijection on Hᵢ (`generalLinear_homology_stable`). The simple map `generalLinearStabilization` expresses AlgebraicKTheory A1's inclusion on Mathlib’s native field carriers: it sends g to diag(g,1), with inverse matrix diag(g⁻¹,1), and uses finSumFinEquiv for the finite indices. These assertions are proved simultaneously, rather than invoking the stability theorem to prove itself.

**Checks.**

- At n=0 the empty matrix maps to (1); H₀(GL₀(ℚ))→H₀(GL₁(ℚ)) is the identity ℤ→ℤ. A zero last block would not be a unit.
- At n=1 the matrix (2) maps to diag(2,1), with inverse diag(1/2,1), determinant 2 and product I₂. On H₁, determinant identifies stabilization with the identity on ℚˣ.
- H₁(GL₀(ℚ))→H₁(GL₁(ℚ)) is 0→ℚˣ and fails surjectivity, as the element 2 shows; i=1,n=0 is outside the range.

Here F infinite; GL₀ is the trivial group; homological indexing p=group degree, q=augmented frame length.

For infinite F, θ₃ is an isomorphism with inverse the descended Milnor retraction of δ₃. If t₃:H₃((Fˣ)³)→H₃(GL₃) is induced by diagonal matrices and s₂:H₃(GL₂)→H₃(GL₃) by diag(g,1), then im t₃+im s₂=H₃(GL₃). The quotient sends the ordered degree-one product for (a,b,c) to {a,b,c}, with coefficient +1. This supplies the proof interface of the §4.8; it does not change the ψ₃.

Here F infinite; all homology integral; order of factors fixed.

The source locators for these statements are Suslin 1984, §3.1–3.2 and Theorem3.4(a–d), pp196–198; Suslin 1984, Theorem3.4(d), p198.

*Needs:* §4.2, §4.3, §4.5, §4.6, §4.7; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.10 Projective configuration coinvariants

Let F be a field, G the group of invertible two by two matrices over F acting on the projective line of F, and C_G the coinvariant complex. Then the degree-zero homology is the integers, the homology vanishes in degrees one and two, and the degree-three homology is the pre-Bloch group P(F). The identification sends the class of the tuple consisting of 0, infinity, 1 and x to the generator [x].

Here F is a field (any field: the computation also holds for F_2, where C_3 = 0 = P(F_2), and for F_3, where C_4 = 0 and P(F_3) ≅ ℤ on [−1]); G = GL_2(F) acts on ℙ¹(F).

The source locators for these statements are Weibel, K-book, Lemma VI.5.6 and its proof (PDF p. 498).

*Needs:* §3.2, §3.3, §3.4, §4.0; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.11 The rank-two spectral sequence

Let F be an infinite field and G = GL_2(F) act on X = ℙ¹(F). The hyperhomology spectral sequence E^1₍ₚ,q₎ = H_q(G, C_p(X)) ⇒ H₍ₚ₊q₎(G, ℤ) has E^1₍₀,q₎ = H_q(B, ℤ), E^1₍₁,q₎ = H_q(T_2, ℤ) and E^1₍₂,q₎ = H_q(Δ, ℤ), where B is the upper triangular group (the stabiliser of 0), T_2 the diagonal torus (the stabiliser of (0, ∞)) and Δ = {(a, a)} the centre (the stabiliser of (0, ∞, 1)); its row q = 0 is the coinvariant complex, so E^2₍ₚ,₀₎ = H_p(C_G), which is ℤ, 0, 0, P(F) for p = 0, 1, 2, 3. The differential d^1 : H_q(Δ) → H_q(T_2) is induced by the inclusion and is split injective, so E^2₍₂,q₎ = 0; with the d^1 involution lemma, E^2₍₀,q₎ = H_q(T_2)_σ, E^2₍₁,q₎ = H_q(T_2)^σ / H_q(Δ), E^2₍₀,₁₎ = F^× and E^2₍₁,₁₎ = 0.

Here F is an infinite field. B, T_2 and the centre Δ are the stabilisers named in the statement.

For an infinite field F the inclusion of the diagonal torus T_2 into the upper triangular group B_2 of GL_2(F) induces an isomorphism H_*(T_2, ℤ) → H_*(B_2, ℤ).

Let F be infinite and σ(a, b) = (b, a) on T_2. Under the Shapiro identifications E^1₍₁,q₎ ≅ H_q(T_2, ℤ) and E^1₍₀,q₎ ≅ H_q(B_2, ℤ) ≅ H_q(T_2, ℤ), the differential d^1 : E^1₍₁,q₎ → E^1₍₀,q₎ of the configuration spectral sequence of GL_2(F) on ℙ¹(F) is induced by 1 − σ.

For F infinite, in the configuration spectral sequence of GL_2(F) on ℙ¹(F), E^2₍₀,₂₎ = H_2(T_2)_σ ≅ ∧²F^× ⊕ ∧̃²(F^×) (Künneth: σ exchanges the two copies of H_2(F^×) = ∧²F^× and acts on F^× ⊗ F^× by x ⊗ y ↦ −y ⊗ x), and d^3 : E^3₍₃,₀₎ = P(F) → E^3₍₀,₂₎ is the boundary [x] ↦ x ⊗ (1 − x) of Layer 3 followed by the split inclusion of ∧̃²(F^×). Hence E^∞₍₃,₀₎ = B(F) and E^∞₍₀,₂₎ ≅ ∧²F^× ⊕ K_2(F).

The target rankTwo_d3_boundary uses the following explicit splitting and finite bar calculation. They also specify how to implement the calculation omitted from Suslin, Lemma 2.4, p.222. A readable calculation with a compressed spectral sequence is Mirzaii, arXiv:0807.2039v2, Lemma 4.1, pp.8–10; only that chain computation is used here, not its stronger claims about the torus image.

Fix the Shapiro representatives for columns 0,1,2 as (0), (∞,0), (∞,0,1). Then d(∞,0)=(0)−(∞), giving 1−σ; this avoids an unrecorded sign change from using (0,∞). On H₁(T₂), the class (a,1) maps to (a,a⁻¹) in multiplicative coordinates. The centre is Δ(a)=(a,a), whose image is σ-fixed. On the mixed H₁⊗H₁ Künneth term the swap sends a⊗b to −b⊗a. These pin the antisymmetric cokernel in the d³ target.

For a≠0,1 put A=((0,1),(a−1,1)), B=((1−a,a),(0,a)), C=diag(1,a) and w=((0,1),(1,0)). The matrix family rankTwoFaceMatrices a records A,B,C. Their determinants are 1−a, a(1−a), a. With t=(0,∞,1), the four faces of (0,∞,1,a) are At, Bt, Ct, t, in that order. Thus y=((B,A)−(C,I))⊗t has bar boundary equal to the configuration boundary of that four-tuple. Homogeneous bar tuples have alternating deletion differential and simultaneous right multiplication.

The next lift is the following finite homogeneous 2-chain, where scalar powers multiply the whole matrix:

u = (CA,B,A) − (CB,CA,B) − (a⁻¹B²C²,B²,AB)
    + (a⁻³B²C²,a⁻²B²,I) − (a⁻³B²C²,a⁻¹C²,I)
    + (a⁻¹BA,a⁻¹A²,I) − (A²C⁻¹,aC⁻¹,I) + (C,a⁻¹C²,I).

The target rankTwo_d3_lift is the chain equality d_bar(u)⊗(0,∞)=d_config(y), not merely equality in homology. To check it, expand the eight boundaries and identify tuples differing by a common right diagonal matrix. What remains is (BA,A²)−(CA,A)−(B²,AB)+(CB,B)+(B,A)−(C,I), the six terms obtained by taking the three faces of t in y. Transport to the chosen column-one representative (∞,0) by replacing u by uw. Its boundary to column zero is (uw−u)⊗(0).

Here is a finite reduction of that last cycle. For each matrix g, choose s(g·0)=I at 0, w at ∞, and ((1,0),(z,1)) at z∈Fˣ. Replace g by s(g·0)⁻¹g, project the resulting upper triangular matrix onto its two diagonal entries, and send a homogeneous triple (g₀,g₁,g₂) to [g₀g₁⁻¹|g₁g₂⁻¹]. This is the Shapiro comparison followed by the Borel-to-torus map. Write c(v,v′)=[v|v′]−[v′|v]. Modulo the boundary of [(a⁻¹,a)|(−1,a)|(−a,a⁻¹)], the image of uw−u is the sum of the following commutator cycles:

| v | v′ | coefficient |
| --- | --- | --- |
| (−1,a) | (−a,a⁻¹) | 1 |
| (a⁻¹,a) | (a,1) | 2 |
| (1,a) | (a,a⁻¹) | 1 |
| (a⁻²(1−a)²,1) | (a⁻¹,a) | 1 |
| (a,a⁻¹) | (a⁻¹,−a⁻¹(1−a)²) | 1 |
| (a⁻¹(a−1),a⁻¹(a−1)) | (a,1) | 1 |
| (1,a) | (a⁻¹,−a⁻¹(a−1)²) | 1 |

Multilinearity now gives (a∧(1−a), −a⊗(1−a)) in the raw splitting H₂(T₂)_σ=Λ²U⊕Qₛ. In doing this reduction, retain 2(a⊗a)=0 in Qₛ; setting the diagonal tensor to zero would not be an integral calculation. The total differential fixed in §4.1 uses the successive lifts c, −y, −u, so its d³ is the negative: (−a∧(1−a), a⊗(1−a)). Finally let alt:Qₛ→Λ²U send a⊗b to a∧b and use the invertible change of coordinates (v,t)↦(v+alt(t),t), with inverse (v,t)↦(v−alt(t),t). This gives precisely (0,a⊗(1−a)). The split inclusion in the theorem means this changed splitting; it is not the raw cross-product inclusion. All matrix identities use only inverses of a and 1−a, so they remain valid in characteristic two. The seven-term reduction and this change of coordinates complete the d³ proof dependency.

The additive equivalence rankTwoBoundarySplit alt records this change of splitting on V×T for arbitrary abelian groups and an actual additive map alt:T→V. Its API gives the displayed application formula, its inverse, cancellation of (−alt(t),t), and the identity when alt=0. Provide rankTwo_d3_lift, rankTwo_d3_Shapiro and rankTwo_d3_boundary for these three equalities, with the displayed total differential and representatives. The API of rankTwoFaceMatrices consists of the three determinant formulas, its action on t and the four-face boundary identity.

**Checks.**

- At a=2 over ℚ, A=((0,1),(1,1)) and det A=−1; at a=3 its lower-left entry is 2. These matrices carry t to the first face (∞,1,a).
- For a=0 or a=1 at least one face matrix is singular, so these values cannot enter the lift construction.
- At a=3 the alternating (v₂,v₃) valuation pairing sends the final tensor to −1, agreeing with §3.2; reversing the total-complex sign gives +1.
- The raw first coordinate −a∧(1−a) cancels under the displayed change of coordinates. Omitting that change leaves a nonzero first coordinate over ℚ at a=3. Applying the ordered valuation pairing to both coordinates gives the two-term witness (1,−1)↦(0,−1), the change of splitting in this subsection.
- The determinant-one torus sends a∧b to raw coordinates (2a∧b,−2a⊗b), hence to (0,−2a⊗b) after the same splitting change. The two-term witness (2,−2)↦(0,−2) is the same change of splitting; it fixes the coefficient and sign used in §5.4.
- For any alt and t, the raw pair (−alt(t),t) goes to (0,t), and the inverse returns that exact pair. For alt=0 the equivalence fixes (1,−1), ruling out a projection that loses the first coordinate.

The source locators for these statements are Weibel, K-book, (5.8) and the paragraph after Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Proof of Theorem VI.5.7 (PDF p. 499); Weibel, K-book, Paragraph after Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Lemma VI.5.8.1 (PDF p. 499); Weibel, K-book, Exercise VI.5.2(iii) (PDF p. 508).

*Needs:* §3.1, §3.5, §4.1, §4.3, §4.7, §4.10; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.12 The rank-two Bloch map

For an infinite field F, construct psiGL2:H₃(GL₂(F),ℤ)→B(F) from the configuration edge map. On the second page E²₍₃,₀₎=H₃(C_G)=P(F). There is no incoming higher differential to this position; the remaining outgoing differential is d³=∂, so E∞₍₃,₀₎=ker ∂=B(F). The edge map therefore lands in B(F). Its composite with B(F)⊂P(F) is the canonical augmentation-to-coinvariants map. The first page E¹₍₃,₀₎ consists of coinvariant chains, not P(F).

Here F is an infinite field.

- The homomorphism H_3(GL_2(F), ℤ) → B(F).
- Its composite with B(F) ⊆ P(F) is H_3(GL_2(F), ℤ) → H_3(C_G) ≅ P(F).
- ψ is onto B(F).

- For a field homomorphism F → E, ψ_E ∘ H_3(GL_2(F) → GL_2(E)) = B(F → E) ∘ ψ_F.

For every infinite field F, H_1(GL_2(F), ℤ) ≅ F^×, H_2(GL_2(F), ℤ) ≅ ∧²F^× ⊕ K_2(F), and the sequence H_3(M_2, ℤ) → H_3(GL_2(F), ℤ) −ψ→ B(F) → 0 is exact, where M_2 is the monomial subgroup and ψ is the map of §4.12.

Here F is an infinite field. The K-book's 'For all F' is false even with its standing |F| ≥ 4: the H_2 formula fails for F_4.

The source locators for these statements are Weibel, K-book, Paragraph after Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Theorem VI.5.7 (PDF p. 498); Weibel, K-book, Proof of Theorem VI.5.7 (PDF p. 499).

**Checks.**

- For F=ℚ, c=[2]+[−1] has a preimage under ψ and has order six; a map with image zero fails on c.
- For F = ℚ the image is a proper subgroup of P(ℚ): [2] is not in B(ℚ), since its boundary 2 ∧ (−1) is nonzero in ∧̃²(ℚ^×).
- ψ vanishes on the image of H_3(T_2, ℤ).

*Needs:* §3.5, §4.1, §4.7, §4.10, §4.11; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.13 General position, rotations and the cone

For a field F let GP_n ⊆ C_n(ℙ²(F)) be spanned by the (n + 1)-tuples of points of ℙ²(F) no three of which are collinear. GP_* is a subcomplex of the configuration complex, stable under GL_3(F) and under the rotations t_n. For F infinite, GP_* → ℤ, and hence GP_* → C_*(ℙ²(F)), is a quasi-isomorphism.

Here F is a field; for the acyclicity, F is infinite.

- The subcomplex GP_* of configComplex (ℙ²(F)).
- GP_* is a subcomplex of configComplex (ℙ²(F)), with the induced augmentation.
- The GL_3(F)-action on GP_*.

- The rotations t_n preserve GP_n.
- For F infinite, GP_* → ℤ is a quasi-isomorphism.

Let C_* be the configuration complex C_*(X), or the general-position complex of ℙ²(F). The rotations t_n(x_0, …, x_n) = (x_n, x_0, …, x₍ₙ−₁₎) preserve the generators and satisfy t_n⁽ⁿ⁺¹⁾ = 1, ∂_0 t_n = ∂_n and ∂_i t_n = t₍ₙ−₁₎ ∂₍ᵢ−₁₎ for i ≥ 1: C_* is a precyclic abelian group (faces and rotations, no degeneracies; duplicating an entry leaves the complex). Construct C^a_*, with the same terms and differential d^a = Σ₍ᵢ₌₀₎⁽ⁿ−¹⁾ (−1)^i ∂_i (the last face omitted), the norm N = Σ₍ᵢ₌₀₎⁽ⁿ⁾ ((−1)^n t_n)^i : C_n → C^a_n, which is a chain map, and the mapping cone D_* of the truncated morphism N : C₍≥₁₎ → C^a₍≥₁₎: D_0 = C^a_1 and D_n = C^a₍ₙ₊₁₎ ⊕ C_n for n > 0, with differential (x, y) ↦ (d^a x − N y, −d y). For X infinite (for the general-position complex, F infinite), C^a_* is acyclic and ε : D_0 → ℤ, (x_0, x_1) ↦ 1, induces a quasi-isomorphism D_* → ℤ.

Here X is a set; for the acyclicity statements X is infinite, and for the general-position complex of ℙ²(F), F is infinite.

- The rotations t_n on injective (or general-position) tuples, with t_n⁽ⁿ⁺¹⁾ = 1, ∂_0 t_n = ∂_n and ∂_i t_n = t₍ₙ−₁₎ ∂₍ᵢ−₁₎ for i ≥ 1.
- The complex C^a_* with differential d^a omitting the last face.
- For infinite X (general position: infinite F), C^a_* is exact in every degree, including degree zero.

- N = Σ₍ᵢ₌₀₎⁽ⁿ⁾ ((−1)^n t_n)^i, a chain map C_* → C^a_*.
- The complex D_* with D_0 = C^a_1, D_n = C^a₍ₙ₊₁₎ ⊕ C_n and differential (x, y) ↦ (d^a x − N y, −d y).
- ε : D_0 → ℤ, (x_0, x_1) ↦ 1.

- The shifted cone of N maps quasi-isomorphically to C_* and to D_*, and ε : D_* → ℤ is a quasi-isomorphism for infinite X.
- The action of a group acting on X, commuting with d^a, N and the cone differential.

The source locators for these statements are Weibel, K-book, Example VI.5.9.1 (PDF p. 500); Weibel, K-book, Definition VI.5.9 (PDF p. 500); Weibel, K-book, (5.9.1) (PDF p. 500).

**Checks.**

- GL_3(F) acts transitively on GP_3, and GP_3 ⊗₍GL_₃₍F₎₎ ℤ ≅ ℤ, generated by P = (p_1, p_2, q, p_3).
- ((1 : 0 : 0), (0 : 1 : 0), (1 : 1 : 0)) is a generator of C_2(ℙ²(F)) but not of GP_2.
- t_n(GP_n) = GP_n, and every face map sends GP_n into GP₍ₙ−₁₎.
- Over F_2, GP_n = 0 for n ≥ 4: the largest sets of points of ℙ²(F_2) with no three collinear have four points.
- For X infinite, H_n(C^a_*(X)) = 0 for all n ≥ 0; in degree zero d^a(x_0, x_1) = (x_1) is onto.
- For |X| = 3, H_2(C^a_*(X)) is free of rank 3 (and for |X| = 4, H_3 has rank 8), so the infinite hypothesis is needed.
- On (x, y, z) the norm Σ_i ((−1)^2 t)^i = 1 + t + t² satisfies d^a N = N d, while Σ_i (−1)^i t^i does not.
- D_0 = C^a_1, and d(x, y) = d^a x − N y on D_1 = C^a_2 ⊕ C_1.
- t_n⁽ⁿ⁺¹⁾ = 1 and ∂_0 t_n = ∂_n on injective tuples; for X = {x, y}, t_1(x, y) = (y, x).

*Needs:* §4.0; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.14 The rank-three comparison and coefficient change

Let F be infinite, D_* the cone complex of §4.13 for the general-position complex of ℙ²(F), and D_G = D_* ⊗₍GL_₃₍F₎₎ ℤ. Then (D_G)_3 = ℤP ⊕ ⊕ ℤ[a; x], with P = (p_1, p_2, q, p_3) in the C_3 summand and [a; x] = (p_1, p_2, q, (1 : a : x), p_3) in the C^a_4 summand (a, x ∉ {0, 1}, a ≠ x), and d : (D_G)_3 → (D_G)_2 is zero. Define ψ′ : (D_G)_3 → P(F) by ψ′([a; x]) = [a] (the cross-ratio of the projection from the last point) and ψ′(P) = −2c. Then ψ′ vanishes on d((D_G)_4), so it induces ψ : H_3(GL_3(F), ℤ) ≅ H_3(GL_3(F), D_*) → H_3(D_G) → P(F). The K-book prints ψ′([a; x]) = a and ψ′(P) = 2c; with its displayed cone differential the sign of the P-value must be −2c.

Here F is an infinite field.

- ψ′ : (D_G)_3 → P(F), with ψ′([a; x]) = [a] and ψ′(P) = −2c.
- ψ′ ∘ d = 0 on (D_G)_4.
- The induced homomorphism H_3(GL_3(F), ℤ) → P(F).

- Naturality for field homomorphisms F → E.
- The extension of ψ to H_3(GL(F), ℤ) through H_3(GL_3(F)) ≅ H_3(GL(F)) (Remark VI.5.12.1).

The composite of the map induced by the inclusion of the two by two matrices into the three by three matrices with the map psi of the rank-three construction is the map psi of the rank-two theorem, followed by the inclusion of B(F) into P(F).

Let F be infinite and T_3 ⊂ GL_3(F) the diagonal torus. For n > 0 the map H_n(T_3, ℤ) → H_n(D_* ⊗₍T_₃₎ ℤ) is zero; hence ψ vanishes on the image of H_3(T_3, ℤ) in H_3(GL_3(F), ℤ).

For an infinite field F the image of the map ψ : H_3(GL_3(F), ℤ) → P(F) of §4.14 is B(F), and the sequence H_3(M_2, ℤ) ⊕ H_3(T_3, ℤ) → H_3(GL_3(F), ℤ) −ψ→ B(F) → 0 is exact.

For a field embedding f:F→E and an ordered injective quadruple t in P¹(F), the cross-ratio satisfies cr_E(P¹(f)t)=f(cr_F(t)). It induces the corresponding square between degree-three configuration coinvariants and P(F)→P(E), so the maps ψ₂ and the rank-comparison ψ₃ commute with field embeddings. Use cr(0,∞,1,x)=x, not the reciprocal convention of the polylogarithm cocycle.

Here F,E fields; f a unital field embedding; t consists of four distinct points. Infinitude is needed for ψ from acyclic configurations, not for the cross-ratio identity.

The source locators for these statements are Weibel, K-book, Before Lemma VI.5.10 (PDF p. 501); Weibel, K-book, Lemma VI.5.10 and its proof (PDF p. 501); Weibel, K-book, Lemma VI.5.11 (PDF p. 501); Weibel, K-book, Proposition VI.5.12 and its proof (PDF p. 502); Suslin 1991, Lemma2.2, p221.

**Checks.**

- ψ′([a; x]) = [a], the cross-ratio of the projection of (p_1, p_2, q, (1 : a : x)) from p_3.
- Σ₍ᵢ₌₀₎⁽⁴⁾ ψ′(t^i[a; x]) = 2c in P(F); for F = F_11 this holds for all 72 admissible (a, x), and forces ψ′(P) = −2c.
- ψ′ ∘ d^a vanishes on every general-position 6-tuple (p_1, p_2, q, r, s, p_3).
- ψ′ does not take values in B(F): ψ′([2; x]) = [2] ∉ B(ℚ). Only the induced map on H_3 lands in B(F) (Proposition 5.12).

*Needs:* §3.2, §3.3, §3.4, §3.6, §4.1, §4.7, §4.8, §4.10, §4.12, §4.13; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.15 Permutation classes and the monomial sequence

Let F be a field with at least four elements and x ∈ F − {0, 1, −1}. Then (i) [x²] = 2([x] + [−x] + [−1]) in P(F), and (ii) [x²] + 2[−x⁽−¹⁾] − 2[x − 1] − [(1 − x)⁽−²⁾] = 2c. The K-book's Exercise VI.5.5 prints (ii) as [x²] + 2[−x²] − 2[x − 1] − [1/x²] = 2c, which is false.

Here F is a field with at least four elements; x ∉ {0, 1, −1}; [1] = 0.

Let F be an infinite field and A_3 ⊂ GL_3(F) the even permutation matrices. The image of H_3(A_3, ℤ) ≅ ℤ/3 under H_3(A_3) → H_3(GL_3(F)) −ψ→ B(F) is the subgroup generated by 2c.

Here F is an infinite field (the K-book's |F| ≥ 4 is needed only for the choice of x and y).

Let F be an infinite field and regard Σ_∞ as the group of permutation matrices in GL(F). The image of H_3(Σ_∞, ℤ) −ι_*→ H_3(GL(F), ℤ) −ψ→ B(F) is the subgroup generated by 2c, which is trivial or cyclic of order three.

Here F is an infinite field (ψ on H_3(GL(F), ℤ) needs the stability input).

Let F be an infinite field, M = ⋃_n M_n ⊂ GL(F) the monomial group and ι : Σ_∞ → GL(F) the permutation matrices. The sequence H_3(M, ℤ) → H_3(GL(F), ℤ) ⊕ H_3(Σ_∞, ℤ) −(ψ, −ψι_*)→ B(F) → 0 is exact, where the first map is (inclusion_*, π_*) for the projection π : M = F^× ≀ Σ_∞ → Σ_∞.

Here F is an infinite field.

For an infinite field F the cokernel of π_3(BM^+) → K_3(F) is B(F)/⟨2c⟩, and there is an exact sequence π_3(BM^+) → K_3(F) ⊕ π^s_3 −(ψ, −ψι_*)→ B(F) → 0. The indecomposable reformulation (Corollary 5.16.1) is the separate §4.16.

The monomial proof uses the following intermediate targets, before the homotopy argument of §4.16. Their source is Suslin 1991, Lemmas 4.1–4.4 and Sublemma 4.4.1, pp.227–229. In particular these steps have a proof in the 1991 paper independent of the LNM attribution in the K-book.

- stableMixedHomology_is_diagonal: for m,n≥1, write j:GLₘ×GLₙ→GL for block sum and q₁,q₂ for the two projections followed by stabilization. For every z∈H₃(GLₘ×GLₙ;ℤ), the difference j₍*₎z−q₁₍*₎z−q₂₍*₎z lies in im H₃(T∞). First lift H₁(GLᵣ) and H₂(GLᵣ) from the diagonal torus, using determinant, unstable rank-two symbols and stability in §4.8. This puts the two cross-product terms H₂⊗H₁ and H₁⊗H₂ in the torus image. For the remaining Tor₁(H₁,H₁) term, use determinant and its GL₁ section on each factor: subtracting the two pure-factor terms leaves a class lifted from GL₁×GL₁, hence again from the torus. No natural Künneth splitting is assumed. This is Suslin's Lemma 4.2 and Corollary 4.1, pp.227–228.
- monomialRelativeH3_generators: in the filtered colimit, ker(H₃(M)→H₃(Σ∞)) is generated by the torus image and the stabilized image of ker(H₃(M₂×Σ∞)→H₃(Σ₂×Σ∞)). Here the Σ∞ factor acts on the coordinates after the first two. Compare the two finite-rank Lyndon–Hochschild–Serre sequences and pass to the colimit; no finite-rank stability bound is asserted for this target. In rows 1 and 2, the Σₙ-modules H₁(Tₙ) and H₂(Tₙ) are induced from the stabilizers of one coordinate and of an unordered pair of coordinates. The latter row is the sum of the induced Λ²U and U⊗U terms, with the pair transposition acting by minus flip. Shapiro and symmetric-group stability identify the terms and differentials that meet total degree three. The row-zero section separates the Σₙ term; the remaining row-three filtration piece comes from H₃(Tₙ). Apply stableMixedHomology_is_diagonal to the relative product terms, including their Tor term, before passing to the filtered colimit. This gives im(H₃(M)⁰→H₃(GL))=ker ψ, using §4.14's kernel and §4.12. Source: Suslin, Lemma 4.3, p.228.
- permutationTwoPrimary_vanishes: the 2-primary part of H₃(Σ∞) has zero image under ψ. Use H₃(Σ₆)→H₃(Σ∞), transfer from its Sylow 2-subgroup D₈×C₂, and the preceding mixed-term target to reduce to D₈ acting on four coordinates. The following integral change of basis works in characteristic two as well as in odd characteristic:

  Γ=((1,1,1,0),(1,1,0,0),(1,0,0,1),(1,0,0,0)), with det Γ=1.

  For permutation matrices P₁₂,P₃₄,P₁₃P₂₄, use Γ⁻¹PΓ. The first two upper-left blocks are I₂; the third is ((1,1),(0,−1)). The lower-right blocks are diag(−1,1), diag(1,−1), and ((0,1),(1,0)), respectively. All lower-left blocks vanish. For P₁₂ the only nonzero upper-right entry is at position (2,3), equal to 1; for P₃₄ the entries at (1,4),(2,4) are 1,−1. Thus D₈ lands in the subgroup with upper-left B₂ and lower-right M₂. Scalar acyclicity (§4.3), first for the off-block radical and then inside B₂, identifies its homology with that of T₂×M₂. The two pure-factor images are killed by §4.14 and §4.12, and its mixed image by stableMixedHomology_is_diagonal. Transfer finishes the 2-primary assertion. Source: Suslin, Sublemma 4.4.1, p.229.

The symmetric-group input needed here is integral stability Hᵢ(Σₙ)→Hᵢ(Σₙ₊₁) in the range n≥2i, together with the resulting H₃(Σ₆)≅H₃(Σ∞); the Barratt–Priddy equivalence alone does not assert this range. It and the cyclic map formula used for the 5-primary part are the following targets of this roadmap.

- cyclicHomology_maps: reuse Mathlib's `Rep.FiniteCyclicGroup.groupHomologyIsoOdd` and `groupHomologyIsoEven` in `GroupHomology/FiniteCyclic`, which compute arbitrary cyclic representations over a commutative coefficient ring by the norm complex. For integral trivial coefficients they give H₍₂ⱼ−₁₎(C_m)=ℤ/m for j≥1 and H₍₂ⱼ₎(C_m)=0 for j≥1. Add the map calculation, stated for every m≥1 and every natural a as `cyclicHomology_power_map`: the power-a endomorphism acts by aʲ in degree 2j−1. Prove it using the degree-two carry class (Mathlib’s `GroupCohomology/FiniteCyclic`) and its cup powers, or a comparison of the existing periodic resolutions. For m|n and the inclusion sending a generator to the n/m-th power of a generator, the induced odd-degree map is injective and sends a generator to n/m times a generator, with generators fixed by duality against powers of that carry class. The same-order power formula aʲ cannot be substituted into this different-order inclusion formula. These comparisons commute with composites and coefficient localization.
- `symmetricGroup_homology_stable`: for i≥0 and n≥2i, the standard inclusion Σₙ→Σₙ₊₁ induces an integral Hᵢ isomorphism; include the resulting colimit comparison and naturality for inclusions fixing the first coordinates. Use §4.0’s augmented complex of injective words on n+1 letters and its proved finite exactness, and its action spectral sequence with tuple stabilizers Σ₍ₙ−ₚ₎. Face maps are conjugate standard inclusions, so their alternating sum is either stabilization or zero. Induction on degree, with the last possibly nonzero differential included, gives the range. Moritz Kerz, arXiv:math/0410261v1, Theorems 1–2, pp.1–3, gives this proof with the equivalent indexing Hᵢ(Σₙ₋₁)→Hᵢ(Σₙ) for i<n/2. This is the extra range input above; Barratt–Priddy by itself is not this theorem.

There is no 5-primary contribution: a Sylow C₅⊂Σ₆ has a normalizer inducing the power-two map, which acts by four on H₃(C₅); its stable subgroup is therefore zero. There are no larger prime divisors of |Σ₆|. For the 3-primary part transfer reduces to C₃×C₃⊂Σ₆. Its pure H₃ summands are conjugate. The Künneth Tor₁(H₁(C₃),H₁(C₃)) term need not vanish; stableMixedHomology_is_diagonal puts its block-sum image in the diagonal torus, where ψ is zero. The cyclic configuration calculation already stated above sends the remaining generator to ±2c. These arguments prove the permutation-image target before the enhanced-Tor calculation.

The matrix permutationSylowBasis records Γ over ℤ, with entrywise specialization to every field. Its API is the displayed determinant, its inverse, and the three conjugation identities; it does not define a group or a new representation theory.

**Checks.**

- Γ has determinant +1, so the same basis change is invertible in characteristic two.
- Γ⁻¹P₁₂Γ has entry (2,3)=1 and lower-right diag(−1,1); leaving out that off-block entry gives the wrong action, including over 𝔽₂.
- Conjugating P₁₃P₂₄ gives the nontrivial lower-right swap, so the Levi is T₂×M₂, not T₄.
- The two C₃ factors give the same subgroup ⟨2c⟩; replacing the 3-primary image by ⟨c⟩ would introduce a spurious order-two class when c has order six.
- For C₇, power two acts by four on H₃, while C₂→C₄ sends the H₃ generator to twice a generator and is injective. These distinguish the two map formulas.
- Σ₀→Σ₁ induces the identity ℤ→ℤ on H₀. On H₁, Σ₁→Σ₂ is 0→ℤ/2 and lies outside the range; Σ₂→Σ₃ is ℤ/2→ℤ/2 and is an isomorphism. At i=3 the range includes Σ₆, as required above.

The source locators for these statements are Weibel, K-book, Exercise VI.5.5 (PDF p. 508); Weibel, K-book, Lemma VI.5.14 (PDF p. 502); Weibel, K-book, Proof of Lemma VI.5.14 (PDF p. 503); Weibel, K-book, Proposition VI.5.13 and its proof (PDF p. 502); Weibel, K-book, Proposition VI.5.15 (PDF p. 503) and its proof (PDF p. 504); Weibel, K-book, Theorem VI.5.16 (PDF p. 504).

*Needs:* §1.5, §2.1, §3.2, §3.3, §3.4, §3.6, §4.7, §4.8, §4.0, §4.12, §4.14; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.16 Indecomposable monomial homotopy

For a field F let M = F^× ≀ Σ_∞ be the monomial group and BM^+ its plus construction with respect to the perfect commutator subgroup P = [M, M]. Define π_3^ind(BM^+) as the quotient of π_3(BM^+) by the image of the products π_1(BM^+) ⊗ π_2(BM^+) → π_3(BM^+) in the graded ring π_*(ℤ × BM^+) ≅ π_*K(F^×-Sets_fin), together with the natural maps π_3^ind(BM^+) → π^s_3/(η³) ≅ ℤ/12 and π_3^ind(BM^+) → K_3^ind(F).

- π_3^ind(BM^+) for the monomial group of F.
- The quotient map π_3(BM^+) → π_3^ind(BM^+).
- The natural map to π^s_3/(η³) ≅ ℤ/12, split by the unit π^s_3 → π_3(BM^+).

- The map to K_3^ind(F) induced by the ring map to K_*(F).
- Naturality for field homomorphisms, through F^× ≀ Σ_∞ → E^× ≀ Σ_∞.

For a field F there is a natural exact sequence 0 → μ_2(F) → π_3^ind(BM^+) −γ→ Tor_1^ℤ(μ(F), μ(F)) ⊕ ℤ/12 → 0, where the Tor term is H_3(F^×, ℤ)/∧³F^× (Ex. VI.5.9(a)). The K-book writes μ(F) for that term; the two are isomorphic, but not naturally in F (Ex. VI.5.9(b)).

Identify the stable η in this calculation with §1.5’s Hopf-invariant +1 generator and StableHomotopyKTheory §7.1’s class. HomotopySpheres Stage 9, item 1 gives π₃ˢ=ℤ/24{ν}; FourManifolds F7.0b gives η³=12ν≠0. Therefore the quotient by its subgroup {0,12ν} is ℤ/12.

The proof of the preceding sequence uses the Atiyah–Hirzebruch spectral sequence E²₍ₚ,q₎=H_p(F^×,π^s_q)⇒π₍ₚ₊q₎(ℤ×BM⁺) of StableHomotopyKTheory §7.27 for the sphere spectrum and X=BF^×, together with the Barratt–Priddy identification π^s_*(BG₊)≅π_*(ℤ×B(G≀Σ_∞)⁺)≅π_*K(G-Sets_fin) for free finite G-sets. That identification for an arbitrary group G is the target barrattPriddy_freeGSets here (Weibel IV, Example 4.10.1, PDF p.316); its case G=1 is StableHomotopyKTheory §6.3, and the general case follows the same group-completion argument with the monoid of finite free G-sets. Two properties of the spectral sequence are further targets here: ahss_sphereModule, that it is a spectral sequence of π^s_*-modules (every filtration stage is a spectrum, so the differentials are π^s_*-linear and the module structure on the abutment is the one induced by the ring π_*(ℤ×BM⁺)); and ahss_unitSplitting, that the column p=0, which is π^s_*, survives to E^∞ and is a direct summand of the abutment, split by X₊→S⁰ and the basepoint. With them, the E² page in total degree at most four, the injectivity of E²₍₁,₁₎=F^×/F⁽×²⁾→π₂, the vanishing of d²:E²₍₃,₀₎→E²₍₁,₁₎, and the position of d²:E²₍₄,₀₎→E²₍₂,₁₎ inside (Λ²F^×)/2 give the sequence (Weibel VI, proof of Proposition 5.17, chapter p.33; Suslin 1991, §5).

For an infinite field F the sequence of Theorem 5.16 induces an exact sequence π_3^ind(BM^+) → K_3^ind(F) ⊕ ℤ/12 → B(F) → 0.

Here F is an infinite field.

The source locators for these statements are Weibel, K-book, After Theorem VI.5.16 (PDF p. 505); Weibel, K-book, Proposition VI.5.17 (PDF p. 505); Weibel, K-book, Proof of Proposition VI.5.17 (PDF p. 506); Weibel, K-book, Corollary VI.5.16.1 (PDF p. 505).

**Checks.**

- For F=𝔽₂, Fˣ=1, so π₃(BM⁺)=ℤ/24 and quotienting by ⟨η³⟩={0,12ν} gives ℤ/12. Setting η³=0 instead would give ℤ/24.
- π_3^ind(BM^+) → ℤ/12 is split surjective, split by the unit π^s_3 → π_3(BM^+).
- For F=𝔽₄, the enhanced term is ℤ/3 and π₃^ind(BM⁺)≅ℤ/3⊕ℤ/12 has order 36 and exponent 12; replacing this direct sum by a cyclic group of order 36 fails.
- For F = ℚ, π_3^ind(BM^+) ≅ ℤ/4 ⊕ ℤ/12.

*Needs:* §1.5’s stable Hopf normalization; §2.1, §4.7, §4.15; HomotopySpheres Stage 9, item 1; FourManifolds F7.0b; StableHomotopyKTheory §§7.1 and 7.27; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.17 Cyclic Chern classes, doubling and Bocksteins

Let δ : H_3(μ(F), ℤ) → H_3(P, ℤ) → π_3^ind(BM^+) be induced by x ↦ diag(x, x⁽−¹⁾). Then the μ-component of γ ∘ δ is twice the canonical isomorphism H_3(μ(F), ℤ) ≅ Tor_1(μ(F), μ(F)). The K-book states this as 'μ(F) → μ(F), x ↦ x²' after identifying H_3(μ(F)) with μ(F).

Let Ω be algebraically closed, m≥2 prime to char Ω, and ρ_m:µ_m→SL₂(Ω) be ζ↦diag(ζ,ζ⁻¹). If λ is the tautological character and u=c₁(λ), then c₂(ρ_m)=−u∪u in H⁴(µ_m,µ_m⁽⊗²⁾). Evaluation gives an isomorphism H₄(µ_m,Z/m)→µ_m⁽⊗²⁾. The finite-level cyclic resolution fixes its generator and the negative sign. This evaluates the supplier’s Chern class; it does not construct Chern classes in Layer 4.

Here Ω algebraically closed; m invertible; finite-level coefficient tensor products over Z/m, with the cyclic generator specified.

The source locators for these statements are Weibel, K-book, Lemma VI.5.18 (PDF p. 506); Suslin 1991, Lemma5.7 proof, p236; Weibel, K-book V, Exercise11.5, p89.

*Needs:* §4.7, §4.16; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.18 Detecting ordinary Tor in an algebraic closure

For infinite F choose an algebraic closure Ω and let µ(F) be its roots-of-unity subgroup in Fˣ. The δ:H₃(µ(F),Z)→π₃ⁱⁿᵈ(BM(F)⁺)→K₃ⁱⁿᵈ(F), followed by scalar extension to Ω, lands in the torsion of K₃ⁱⁿᵈ(Ω). Uniquely divisible Milnor K₃ and its split embedding identify that torsion with K₃(Ω)_tors. Compose with e_Ω to obtain D_F:H₃(µ(F),Z)→µ_Ω(2)⁽Aᵘᵗ⁽Ω/F⁾⁾. Here µ_Ω(2) is the second Tate twist, naturally Tor₁^Z(µ(Ω),µ(Ω)); it is not the ordinary tensor product µ(Ω)⊗Zµ(Ω). This construction uses the e-invariant only on torsion.

Here F infinite; Ω algebraically closed over F; roots have order prime to the characteristic. The chosen closure is transported along embeddings, with independence of the transport on the invariant target.

- The additive homomorphism D_F given by this composite through closure torsion.
- On every H₃(µ(F)) class it equals e_Ω of the torsion class obtained from the δ and scalar extension.
- Under F→E and compatible closures, D_E∘H₃(µ(F)→µ(E)) is the Tate-twist restriction of D_F; the equality is independent of the closure embedding on the invariant target.

- Every value is fixed by Aut(Ω/F) under its weight-two action; an automorphism acting on µ_m by ζ↦ζᵃ acts on the detected m-torsion by a².

For algebraically closed Ω and m≥2 invertible with m odd or 8 dividing m, K₄(Ω;Z/m) has generator β², ∂β=ζ, and its Bockstein identifies it with K₃(Ω)[m] and K₃ⁱⁿᵈ(Ω)[m]. Under the early Chern interface c₁,₂(β)=ζ and c₂,₄(β²)=−ζ⊗ζ, so e_Ω=−c₂,₄ after that Bockstein identification. The square from H₄(µ(Ω);Z/m), through the monomial/SL homology maps, to c₂,₄ commutes with its integral Bockstein and the δ arrow to K₃ⁱⁿᵈ(Ω)[m].

Here Ω algebraically closed; m≥2 invertible; m odd or 8|m for the cited Chern product rule Weibel V.11.3.2. This sufficient cofinal set of moduli covers every prime-to-characteristic torsion order. The order-two case is covered at m=8. No mod4 product normalization is assumed.

For every infinite field F the detector D_F is injective. For algebraically closed F it is an isomorphism onto the second Tate twist. In particular the composite H₃(µ(F))→π₃ⁱⁿᵈ(BM(F)⁺)→K₃ⁱⁿᵈ(F) is injective. The assertion concerns ordinary Tor; the enhanced-Tor exact kernel additionally uses its AHSS and extension argument.

Here F infinite; all finite root orders are prime to the characteristic.

For C₇ with generator g, the degree-three power-two action is multiplication by 4. At the finite Chern level, the weights +1 and −1 give first Chern classes u and −u and second Chern class −u². The coefficient −1 remains nonzero at m=2, and m=8 supplies the cited integral product-rule normalization for the two-primary limit. The theorem `cyclicHomology_power_map` of §4.15 gives the map induced by the actual power-a endomorphism, with the identity coefficient map; at C₇, a=2 and degree three it is multiplication by 4.

The source locators for these statements are Weibel, K-book VI, Definition2.1 p6; Lemma5.19 p34; Suslin 1991, Lemma5.7, p236; Weibel, K-book VI, Lemma5.19 proof and diagram, p34; Weibel, K-book V, Finite coefficients 11.3.2, p82; Suslin 1991, Lemma5.7 and Lemma5.8, pp236–237; Weibel, K-book VI, Lemma5.19, p34.

**Checks.**

- For Ω algebraically closed the detector identifies H₃(µ(Ω)) with the entire second Tate twist. The companion tensor-zero test separately excludes the ordinary tensor target.
- For F=Q, H₃(µ(Q))=H₃(C₂)=Z/2 has nonzero detected image; the square of the projection back to Tor multiplies by2 and therefore cannot serve as this detector.
- In characteristic two, K₄(Ω;ℤ/5)=μ₅⊗²≅ℤ/5 and its normalized Bockstein detects order-five K₃ torsion; K₄(Ω;ℤ/2)=0. Under ζ₅↦ζ₅² the detected order-five class is multiplied by 4, whereas an untwisted root action would multiply it by 2.
- For the actual power-two endomorphism of C₇, the induced H₃ map multiplies by4, and its detector image is multiplied by4 rather than2. The example does not assume this homology calculation as a hypothesis.
- For a divisible torsion root group µ, the ordinary tensor product of its underlying additive group with itself is zero. The detector target therefore must be the Tate twist/ordinary Tor, not this tensor product.

*Needs:* §2.1, §2.2, §2.4, §4.16, §4.17; ArithmeticKTheory §5.2; KTheoryFiniteLocalFields §§5.17 and 6.5a; the positive-characteristic torsion target of §2.2; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.19 Enhanced torsion and its root-group model

For a field F define the enhanced torsion term T̃(F) = ker(π_3^ind(BM^+) → ℤ/12), natural for all field homomorphisms. By §4.16 it is an extension 0 → μ_2(F) → T̃(F) → Tor_1^ℤ(μ(F), μ(F)) → 0, and T̃(F) ≅ Tor_1(μ(F), μ(F)) when char F = 2 (μ_2(F) = 1); that the extension does not split when char F ≠ 2 is proved in §4.19. This is Suslin's Tor_1^ℤ(μ(F), μ(F))~ with its characteristic-dependent convention, in a form in which naturality is visible.

- T̃(F) = ker(π_3^ind(BM^+) → ℤ/12).
- The surjection onto Tor_1^ℤ(μ(F), μ(F)), with kernel μ_2(F).
- Naturality for all field homomorphisms, with map_id and map_comp.

- For char F = 2, toTor is an isomorphism.
- For char F ≠ 2 the extension does not split (a consequence of §4.19, stated there).
- An isomorphism T̃(F) ≅ μ̃(F), depending on a choice; no such isomorphism is natural in F.

For a finite cyclic group A of even order there is a unique nontrivial extension Ã of A by ℤ/2 (0 → ℤ/2 → Ã → A → 0, with Ã cyclic of twice the order); for A of odd order set Ã = A. The K-book defines μ̃(F) as the union of the μ̃_n(F). A union needs transition maps, and these are not canonical (an extension of A = ℤ/m, m even, by ℤ/2 has the automorphism x ↦ (1 + m)x over A and ℤ/2), so define μ̃(F) by the choice-free model μ̃(F) = {ζ ∈ F̄^× : ζ² ∈ μ(F)} in a fixed algebraic closure, with the surjection ζ ↦ ζ² onto μ(F). Its kernel is μ_2(F̄) = {±1}, so μ̃(F) is the nontrivial extension when char F ≠ 2 (μ(F) contains −1; when finite it has even order), and squaring is bijective when char F = 2, where μ̃(F) = μ(F). The group μ̃(F) is abstractly isomorphic to Tor_1^ℤ(μ(F), μ(F))~, but not naturally in F (§4.19).

Here F is a field; the roots of unity are those of F.

- μ̃(F) = {ζ ∈ (AlgebraicClosure F)^× : ζ² ∈ μ(F)}.
- The surjection ζ ↦ ζ² onto μ(F), with kernel {±1} (trivial in characteristic two).
- In characteristic two the surjection is an isomorphism.

- For char F ≠ 2 and μ(F) finite of order w, μ̃(F) is cyclic of order 2w, and the extension does not split.
- For A = μ_n(F) of even order the preimage of A is the K-book's Ã.
- A field embedding with a compatible embedding of algebraic closures induces an injection μ̃(F) → μ̃(E) over μ(F) → μ(E).

- μ̃(F) ≅ Tor_1^ℤ(μ(F), μ(F))~ abstractly; no isomorphism is natural in F.

For every field F, π_3^ind(BM^+) ≅ T̃(F) ⊕ ℤ/12, where T̃(F) = ker(π_3^ind(BM^+) → ℤ/12) is the enhanced torsion term (§4.19) and ℤ/12 is the image of the unit π^s_3 → π_3(BM^+); abstractly T̃(F) ≅ μ̃(F), which is the K-book's form π_3^ind(BM^+) ≅ μ̃(F) ⊕ ℤ/12.

Compare the enhanced torsion term T̃(F) = Tor_1^ℤ(μ(F), μ(F))~ (§4.19) with μ̃(F) (§4.19). (i) They are isomorphic as abstract groups: both are locally cyclic, with Tor_1(A, A) ≅ A for a locally cyclic torsion group A, and both are the nontrivial extension by ℤ/2 exactly when char F ≠ 2. (ii) No isomorphism is natural in F: an automorphism acting on μ(F) by ζ ↦ ζ^k acts on Tor_1(μ(F), μ(F)) by k² (Ex. VI.5.9(b)), so Galois groups act on T̃ through the square of the cyclotomic character and on μ̃ through the character itself. (iii) The ordinary Tor group cannot replace T̃: for F = ℚ there is no exact sequence 0 → Tor_1(μ(ℚ), μ(ℚ)) → K_3^ind(ℚ) → B(ℚ) → 0, since 2 · 6 ≠ 24.

The source locators for these statements are Weibel, K-book, Proposition VI.5.17 (PDF p. 505); Weibel, K-book, Proof of Theorem VI.5.2 (PDF p. 507); Weibel, K-book, Remark VI.5.1.2 (PDF p. 495); Weibel, K-book, Corollary VI.5.20 and its proof (PDF p. 507); Weibel, K-book, Exercise VI.5.9 (PDF p. 509); Weibel, K-book, Exercise VI.5.9(b) (PDF p. 509).

**Checks.**

- T̃(ℚ) ≅ ℤ/4, while Tor_1(μ(ℚ), μ(ℚ)) ≅ ℤ/2.
- For char F = 2, T̃(F) → Tor_1(μ(F), μ(F)) is an isomorphism.
- Complex conjugation on F = ℚ(ζ_3) acts trivially on Tor_1(μ_6, μ_6) but by inversion on μ(F) = μ_6, so T̃(F) is not naturally isomorphic to μ̃(F).
- For char F ≠ 2, T̃(F) is locally cyclic, so 0 → μ_2 → T̃ → Tor_1 → 0 does not split.
- In characteristic two, μ̃(F) = μ(F) and the squaring surjection is an isomorphism; over F₄ it exchanges the two primitive cube roots, so it is not the identity.
- For F = ℚ, μ̃(ℚ) = μ_4 is cyclic of order four while μ(ℚ) = {±1} has order two.
- For F = F_5, μ̃(F_5) = μ_8 ⊂ F_25^×, cyclic of order eight.
- For char F ≠ 2 the extension does not split: μ̃(ℚ) = μ_4 is not ℤ/2 ⊕ ℤ/2.
- For F = ℚ, Tor_1^ℤ(μ(ℚ), μ(ℚ)) ≅ ℤ/2 has order two, while μ̃(ℚ) has order four.

*Needs:* §4.16, §4.17, §4.18; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.20 The natural infinite-field Suslin sequence

For every infinite field F there is an exact sequence 0 → T̃(F) → K_3^ind(F) → B(F) → 0 (its naturality is §4.20), where T̃(F) is the enhanced torsion term of §4.19 (Suslin's Tor_1^ℤ(μ(F), μ(F))~) and B(F) is the Bloch group in Suslin's convention of Layer 3. Abstractly T̃(F) ≅ μ̃(F), which is the K-book's form 0 → μ̃(F) → K_3^ind(F) → B(F) → 0; that isomorphism is not natural in F.

Here F is infinite. Finite fields of size at least four use the separate proof in Layer 5. B(F) uses the antisymmetric tensor cokernel, and K₃^ind uses the Milnor-image quotient.

The Suslin sequence 0 → T̃(F) → K_3^ind(F) → B(F) → 0 is natural for all homomorphisms of infinite fields, and the composite K_3(F) → B(F) agrees with h : K_3(F) → H_3(GL(F), ℤ) (the Hurewicz map, equivalently the composite through Layer 1's H_3(St(F), ℤ)) followed by the stable ψ of §4.14, and it vanishes on the image of K^M_3(F), so it factors through K_3^ind(F).

Here F and E are infinite fields and F → E is a field homomorphism.

Since T̃(F) is torsion, tensoring with ℚ gives the natural isomorphism suslin_rational: K₃^ind(F)⊗ℚ≃B(F)⊗ℚ for every infinite field F, induced by the map of the sequence.

The source locators for these statements are Weibel, K-book, Theorem VI.5.2 (PDF p. 495); Weibel, K-book, Proof of Theorem VI.5.2 (PDF p. 507); Weibel, K-book, VI.5.16 proof and VI.5.12.1 (PDF pp. 502, 504-505).

*Needs:* §1.2, §2.1, §3.5, §4.8, §4.14, §4.16, §4.18, §4.19; Layers 1–3; the group-homology, spectral-sequence and stable-homotopy contracts.

### 4.21 Rigidity under purely transcendental extension and the rational-curve presentation

For every field F, the inclusion F⊂F(t) induces an isomorphism K₃^ind(F)≃K₃^ind(F(t)) (k3ind_rationalFunctionField). Quillen's localization sequence for F[t]⊂F(t), with homotopy invariance K(F[t])≃K(F), splits into short exact sequences 0→Kₙ(F)→Kₙ(F(t))→⊕ₚKₙ₋₁(F[t]/p)→0 over the monic irreducible p (Weibel V, Corollary 6.7.1, PDF p.419; the DVR splitting is SchemeKTheoryOperations §4.7, and homotopy invariance is its §5.2). K2SymbolsBrauer §10.5 gives the parallel Milnor sequence 0→K₃ᴹ(F)→K₃ᴹ(F(t))→⊕ₚK₂ᴹ(F[t]/p)→0. Import K2SymbolsBrauer §11.3’s product-normalized residue comparison: with the parameter last and right-linear Quillen boundary D, D₃m₃=m₂rᵥ,₃. Transport D through SchemeKTheoryOperations §3.6’s affine/supported comparison. The right square of these sequences therefore commutes with positive sign; no generic residue comparison is constructed here. Since m₂ is bijective, the snake lemma gives the isomorphism on cokernels of m₃.

For every infinite field F, B(F)→B(F(t)) is an isomorphism (bloch_rationalFunctionField). Both fields are infinite, F is algebraically closed in F(t), so µ(F)=µ(F(t)) and T̃(F)→T̃(F(t)) is an isomorphism; apply the five lemma to the natural sequences of §4.20 (Weibel VI, Exercise 5.8, chapter p.35). The same statement for finite F with |F|≥4 follows from the mixed-embedding compatibility and combined natural sequence of §6.6.

For a DVR O with fraction field K and residue field k with |k|≥4, the rational specialization preBloch_rationalSpecialization: P(K)⊗ℚ→P(k)⊗ℚ, [f]↦[f̄] when f is a unit of O with f̄≠1 and [f]↦0 otherwise, is a well-defined homomorphism. Write a five-term element as the alternating sum of the cross-ratios of the faces of a five-point configuration in P¹(K) (§3.2) and reduce the five points. If the reductions are distinct the image is a five-term element over k. If exactly two points collide, the three faces containing both have reduced cross-ratio 0, 1 or ∞, and the two faces omitting one of them carry the same reduced points in orders differing by a cycle; rationally [x] changes by the sign of the induced permutation of {0,1,∞} (because ⟨x⟩ and c are torsion, §3.6), so these two terms cancel. Two collisions in disjoint pairs give only degenerate cross-ratios. A cluster of three or more colliding points is rescaled at its first separating order: faces meeting the cluster in two points are degenerate, and the remaining faces form either a cancelling pair or the five-term element of the rescaled configuration, by induction on the number of rescalings. The residue field must have at least four elements for the torsion statements of §3.6.

For every infinite field F let R₂⁽P¹⁾(F)⊆ℚ[P¹(F)] be the ℚ-span of [0], [∞] and sp₁α−sp₀α for every α∈ℚ[P¹(F(t))] with rational boundary zero (the rational-curve relations, the special case X=P¹ of §3.12). Then rationalCurve_relations_eq: R₂⁽P¹⁾(F) equals R_red=spanℚ([0],[1],[∞])+R₅⊗ℚ. One inclusion specializes the cycle R(tx,ty) of F(t): at t=1 it is R(x,y), and at t=0 its arguments reduce to 0, 0, y/x, y/x and 1, giving [1]; and [1] lies in R₂⁽P¹⁾(F), since for s=1/(1−t) the cycle [s]+[1−s] has sp₁−sp₀=2[∞]−[1]−[0]. For the other, rigidity writes α as a constant cycle β plus a rational combination of five-term elements over F(t), and preBloch_rationalSpecialization at t=0 and t=1 sends the latter into R_red, while β specializes to itself. Consequently the identity on symbols induces P(F)⊗ℚ≃ℚ[P¹(F)]/R₂⁽P¹⁾(F), compatibly with the boundaries, and B(F)⊗ℚ is the kernel of the induced boundary. This is the weight-two case of the rational-curve presentation; unlike the all-curve statement of §3.12 it is unconditional (Goncharov 1995, §1.9, proof of Proposition 1.22(a), p.225, with X=P¹ and the rigidity above in place of Conjecture 1.21).

Here F is a field (every field for the first assertion, infinite for the second and fourth), t is transcendental over F, and the residue field in the specialization has at least four elements.

**Checks.**

- For k=ℚ(t), O=k[[π]], rᵥ,₃{2,t,π}={2,t} and D₃m₃{2,t,π}=m₂{2,t}; its t-adic Quillen boundary is 1/2, while negation would give 2. In degree two at 5, rᵥ,₂{2,5}=2 but D₂m₂{2,5}=3 in 𝔽₅ˣ, detecting the parity change.
- For F=𝔽₂ or 𝔽₃ the first assertion still holds, although B is pathological there: rigidity concerns K₃^ind, not the Bloch presentation.
- At t=0 the cycle R(tx,ty) specializes to [1], not to zero; omitting the relation [1]=0 from R_red would break the inclusion.
- Over ℚ the rational boundary of [t]+[1−t] is zero, while [t] alone has boundary (1−t)∧t≠0; an arbitrary difference [f(1)]−[f(0)] is not a relation.
- In the colliding-pair case with collision at positions 0 and 2, the two surviving faces are (x₁,a,x₃,x₄) and (a,x₁,x₃,x₄), whose cross-ratios are inverse; their sum ⟨r⟩ is zero only rationally.

The source locators for these statements are Weibel, K-book VI, Exercise 5.8, chapter p.35; Weibel, K-book V, Theorem 6.7 and Corollary 6.7.1, PDF pp.418–419; Goncharov 1995, §1.9, Proposition 1.22 and its proof, p.225.

*Needs:* §3.2, §3.4, §3.6, §3.12, §4.20; K2SymbolsBrauer §§10.5 and 11.3 and Layer 9; SchemeKTheoryOperations §§3.6, 4.7 and 5.2.

### Examples

The smallest frame algebra terms are S₀=ℤ, S₁=Fˣ and S₂=K₂ᴹ⊕ℤ; e=⟨1,1⟩ maps to (0,1). The projective triple stabilizer consists of scalar matrices diag(a,a). It is not diag(a,a⁻¹). On a cyclic root group C₇ the power-two map multiplies H₃ by four, exhibiting the second Tate twist. Over ℚ the enhanced kernel has order four, while ordinary Tor has order two. The equality 4·6=24 is compatible with the Suslin sequence; 2·6=24 is false.

### Dependencies

Use Layers 1–3; the group-homology and algebraically closed K-theory contracts; StableHomotopyKTheory §§6.3, 7.1 and 7.27 for Barratt–Priddy, the first two stable stems and the Atiyah–Hirzebruch spectral sequence, with HomotopySpheres Stage 9 and FourManifolds F7.0b for π₃ˢ and η³; and, for §4.21, SchemeKTheoryOperations §§3.6, 4.7 and 5.2 and K2SymbolsBrauer Layer 9 and §§10.5 and 11.3. The general group-module hyperhomology construction comes first in §4.1. Frame products, the Milnor retraction and the simultaneous stability induction precede the GL₂/GL₃ edge maps. The Chern normalization and closure detector precede the enhanced-Tor identification. The finite-set exactness in §4.0 precedes symmetric-group stability and its finite-field specialization in Layer 5.

## Layer 5: Finite fields and arithmetic examples

Use the separate refined configuration argument over finite fields; the infinite-set contracting homotopy from Layer 4 is unavailable there. All coefficient localizations invert the characteristic. Arithmetic applications use the ambient K-groups in the supplier contracts and compute only their Milnor images, quotient maps and Bloch consequences.

### 5.1 Finite-field indecomposables and transfer

For every finite field F of cardinality q, including q=2,3, the canonical quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. Its group has order q²−1, imported from GeneralAlgebraicKTheory §13.8c; no Quillen model or generator is constructed here.

Here F is a finite field with cardinality q≥2 and prime characteristic ℓ.

Transport the restriction, transfer and Frobenius of KTheoryFiniteLocalFields §1.5 along the canonical quotient isomorphisms. For Fq⊂Fqᵈ: restriction is injective with image the Gal-invariants, transfer is onto, tr∘res=d, res∘tr=(q²ᵈ−1)/(q²−1), and Frobenius acts by q². The same formulas hold on K₃ⁱⁿᵈ and do not specify generators.

Here E/F is an extension of finite fields, |F|=q and [E:F]=d≥1. Restriction, transfer and Frobenius are those maps, transported through the canonical indecomposable quotient isomorphisms.

The source locators for these statements are Weibel, K-book III, III.7.2(a), p61; Weibel, K-book IV, IV.1.13, p10.

*Needs:* §2.1; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

For a quadratic extension E/F of finite fields and a basis e:Fin2→E, let C¹=ker(N:Eˣ→Fˣ). Construct ιe:C¹→SL₂(F) by the matrix in e of multiplication by u. Its determinant is N(u)=1 and it is injective. A basis change conjugates the matrices by the actual change-of-basis element of GL₂(F). The field norm and matrix carriers are Mathlib’s; no second norm or special-linear group is defined.

Here E/F is a quadratic extension of finite fields. e is an F-linear basis of E indexed by Fin 2; C¹ is the kernel of the norm homomorphism on units.

- The multiplication-matrix homomorphism C¹→SL₂(F).
- Its underlying matrix is LinearMap.toMatrix e e of multiplication by u.
- Equality of matrices implies equality of units.

- If U=e′⁻¹∘e in coordinates then ιe′(u)=Uιe(u)U⁻¹.

These multiplication matrices are constructed before the group-homology calculation and use only Mathlib’s norm, basis and matrix APIs (CGZ 2023, §4.2, p.406).

**Checks.**

- Multiplication by 1 has matrix I₂.
- Over 𝔽₄/𝔽₂, for ω²+ω+1=0 and basis (1,ω), multiplication by ω has matrix ((0,1),(1,1)), determinant 1 and trace 1.
- At u=0 multiplication has determinant 0 and is excluded from C¹; a change of basis conjugates, rather than leaving each matrix entry fixed.

*Needs:* Mathlib’s finite-dimensional algebra, field norm, linear maps and matrix groups; no homology input.

### 5.2 Unstable special-linear homology

Let F be finite of characteristic ℓ and cardinality q. H₃(SL₂(F),Z[1/ℓ]) is cyclic of order q²−1. For a subgroup C⊂SL₂(F) of order prime to ℓ the inclusion induces an injection on integral H₃ and H₃(C,Z) is cyclic of order |C|. GL₂(F) conjugation acts trivially on localized H₃. Integral H₃ is not asserted to have order q²−1.

Here F is a finite field with cardinality q≥2 and prime characteristic ℓ. C≤SL₂(F) is a subgroup whose order is prime to ℓ, for the subgroup assertion.

For finite Fq of characteristic ℓ, the ℓ-primary summand of integral H₃(SL₂(Fq),Z) is Z/ℓ exactly for q∈{2,3,4,5,8,9,27}, and is zero otherwise. Thus integral H₃ is abstractly Z/(ℓ(q²−1)) in these exceptional cases, and Z/(q²−1) otherwise (`finite_sl2_integral_homology`). The integral and localized signatures use trivial coefficients transported to the field’s universe as specified in the supplier contracts.

Use `finite_sl2_localized_homology` for the abstract additive equivalence with ℤ/(q²−1); the construction of the canonical stabilization equivalence follows in §5.3. The abstract equivalence here does not choose a natural cyclic generator.

The finite-group calculation uses the following targets of this roadmap, together with cyclicHomology_maps and symmetricGroup_homology_stable of §4.15. They build on the existing Tau Ceti transfer and Mathlib cyclic APIs; they do not replace them.

- finiteGroup_stableElements: for a finite group G, prime r, Sylow r-subgroup P and n≥0, restriction identifies Hⁿ(G,ℤ₍ᵣ₎) with the subgroup of Hⁿ(P,ℤ₍ᵣ₎) satisfying every fusion condition. Explicitly, for g∈G and I=P∩gPg⁻¹, restriction to I equals pullback of restriction to g⁻¹Ig along conjugation by g⁻¹. For positive n this is the usual stable-elements theorem; n=0 is the identity on ℤ₍ᵣ₎. Restriction is injective by the prime-primary theorem `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` and the index formula, with degree zero treated directly. For surjectivity apply corestriction to a stable class. The double-coset formula turns restriction of that corestriction into [G:P] times the original class, and this index is a unit in ℤ₍ᵣ₎. Tau Ceti’s `TauCeti.ContinuousCohomology.corestriction_mackey` in `ContCohomology/Corestriction/Mackey/AllDegrees` supplies that formula for every n, an open U and closed V of a profinite G, and discrete modules. Give finite groups the discrete topology, take U=V=P and the trivial discrete ℤ₍ᵣ₎-module. Continuous and ordinary homogeneous cochains then agree term by term; require compatibility with restriction, conjugation and corestriction under this comparison. This proves the required supplement from existing maps rather than requesting a new Mackey construction. See Hutchinson §3, pp.11–12, for the homological stable-elements formulation.
- finiteGroup_homologyDuality: for finite G and d≥1, H⁽ᵈ⁺¹⁾(G,ℤ)≅Hom(H_d(G,ℤ),ℚ/ℤ), naturally in group homomorphisms. Use 0→ℤ→ℚ→ℚ/ℤ→0, averaging to kill positive rational cohomology and the universal coefficient theorem with the injective group ℚ/ℤ. This identifies restriction with the dual of inclusion-induced homology; it does not confuse corestriction and inclusion. Localize at r when applying stable elements.
- quaternionPeriodicHomology: for Q₍₂ˢ₎, s≥3, the four-periodic resolution gives H₍₄ⱼ₊₃₎=ℤ/2ˢ, H₍₄ⱼ₊₁₎=(ℤ/2)² and H₍₂ⱼ₊₂₎=0, j≥0. Construct the four-periodic free resolution from the presentation `x^(2^(s−2)) = y²`, yxy⁻¹=x⁻¹; verify its augmentation exactness and splice the norm map at the period boundary. Equivalently use the free quaternion action on S³ and the equivariant cellular resolution, then verify that its fundamental period class generates Tate H⁴. The explicit comparison to the homogeneous bar resolution is obtained by recursively applying the standard contracting homotopy to boundaries of the chosen free generators. Hutchinson §6.5, p.33, gives the degree-three comparison cycle: Σ₍ᵢ₌₁₎⁽ᵗ−¹⁾(1,x,x⁽ⁱ⁺¹⁾,x⁽ⁱ⁺²⁾)−(1,x,xy,xy²)−(1,xy,y²,xy²)−(1,xy,y,y²), t=2⁽ˢ−²⁾. Its augmentation represents a generator; even homology vanishes. Degree zero remains ℤ, not ℤ/2ˢ.
- finiteGroup_period_fromSylow: for finite G, an odd prime r dividing |G| and a cyclic Sylow r-subgroup, its r-period is twice the order of the automorphisms of that Sylow subgroup induced by its normalizer. A cyclic 2-Sylow has period two and a generalized quaternion 2-Sylow has period four. These are Swan's Theorems 1–2, cited explicitly in Hutchinson Theorem 3.1, p.12. The proof targets are the stable period class and its restriction: cup product with it is invertible in Tate cohomology, its restriction is the corresponding cyclic/quaternion period class, and its order in degree equal to the period is |G|ᵣ. Build the cyclic class by taking the normalizer-invariant power of the carry class; use stable elements to descend it. Use the quaternion four-period class for the 2-primary branch. Tate periodicity and duality then calculate all positive degrees, and restriction of that period class proves the subgroup-map assertion below. No abstract cyclic equivalence is substituted for that restriction map.

For SL₂(Fq), exhibit the split torus and the norm-one torus in Fq² (the latter via the multiplication matrices of §5.1). Odd-r Sylow subgroups are cyclic in exactly the torus whose order is divisible by r. Their normalizer induces identity and inversion; the elementary matrix computation in Hutchinson Lemmas 3.4–3.5, pp.12–14, proves that there are no other induced automorphisms, including in characteristic two. Thus their period is four. At r=2≠ℓ the Sylow group is generalized quaternion, also of period four. The abelianization is zero except for the characteristic-primary groups at q=2,3, which disappear after ℓ-localization. Periodicity, even-degree vanishing and duality now give H₃(SL₂(Fq),ℤ)ᵣ=ℤ/(q²−1)ᵣ. For any C of order prime to ℓ, restriction of the period class is still a period generator on each primary part of C; on Tate H⁰ it sends 1 mod |G|ᵣ to 1 mod |C|ᵣ. Hence H⁴(G)→H⁴(C) is onto and the actual H₃(C)→H₃(G) is injective. This proves the subgroup assertion with its map. For finite-field embeddings F→E, finiteSL2_extension_h3_injective states that the localized H₃ map is injective. On each r-primary part, r≠ℓ, choose a Sylow r-subgroup P of SL₂(F). Its H₃ has order |P| and maps injectively onto the entire r-primary summand over F; the subgroup theorem makes its map over E injective as well. This proves the claim for the actual inclusion. To prove trivial GL₂(F) conjugation, take E=Fq². Every a∈Fˣ is a square in E, so diag(a,1) is a scalar times an SL₂(E) matrix. Its conjugation over E is inner, hence trivial on homology. The injection just proved descends that equality to F. This is the argument of Hutchinson Lemma 3.8, p.15, and requires no characteristic-zero representation of SL₂(F).

For completeness the separate characteristic-primary summand uses the Borel subgroup B=Fq⋊Fqˣ, transfer and its additive Sylow subgroup. The multiplicative group has order prime to ℓ, so this summand is the coinvariants of H₃((Fq,+),ℤ) under square scalars. Compute that additive homology by tensoring cyclic resolutions, retaining both cross products and Tor, and test trivial characters after extension to 𝔽q. The exceptional zero-weight equations are the ones tabulated in Hutchinson Lemmas 3.10–3.14, pp.15–18. They give precisely q=2,3,4,5,8,9,27, with one ℤ/ℓ each; all other weights are nontrivial. This calculation concerns the integral exceptional summand, not σF's localized domain.

**Checks.**

- The finite-group duality is used only for d≥1; H₀(C_m)=ℤ is not dual to H¹(C_m,ℤ)=0.
- Q₈ has H₁=(ℤ/2)² but H₃=ℤ/8; a cyclic resolution for Q₈ gives the wrong first homology.
- At q=2,3,4,5,7 the integral H₃ orders are 6,24,30,120,48, while localization gives 3,8,15,24,48. This detects the exceptional characteristic-primary summand. The order is also 3 for localized H₃ over ULift (ZMod 2); transport of the coefficient universe changes no group. The value q=1 is excluded by the field hypothesis.

The source locators for these statements are Hutchinson 2013, arXiv v2, §3, Corollaries 3.6–3.7 and Lemma 3.8, pp14–15; Hutchinson 2013, arXiv v2, §3, Lemma 3.14, pp17–18.

*Needs:* Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.3 The finite stabilization equivalence

Construct σF:H₃(SL₂(F),Z[1/ℓ])→K₃(F) from SL₂→SL∞ and the inverse stable Hurewicz identification K₃(F)/(−1·K₂(F))≅H₃(SL∞(F),Z). Finite K₂=0 and K₃ has no ℓ-primary torsion, so the integral map extends uniquely over localization. This is the actual stabilization map, not an arbitrary cyclic isomorphism.

Here F is a finite field with cardinality q≥2 and prime characteristic ℓ.

- The σF homomorphism with the specified stabilization composite.
- For an embedding F→L of finite fields, σL∘H₃(SL₂(f))=K₃(f)∘σF, with the same localized coefficient ring.
- A homomorphism on localized H₃ agreeing on all integral coefficient classes with stabilization equals σF.

- For the actual stable Hurewicz map h and the homology stabilization s, h(σF(loc z))=s(z) for every integral class z. This fixes σF as the stabilization composite, including its normalization.

The map σF is bijective for every finite field, including F₂ and F₃. The following proof uses §4.18's root-cycle detector and avoids assuming an algebraically closed unstable comparison. Put m=q²−1, E=Fq², Ω an algebraic closure of E, and C=Eˣ embedded in SL₂(E) by a↦diag(a,a⁻¹). Then |C|=m. First finiteQuadraticTorus_factorization asserts that the maps

H₃(SL₂(F);ℤ[1/ℓ]) → H₃(SL₂(E);ℤ[1/ℓ]) ← H₃(C;ℤ)

are injective and have the same image. The left injection is finiteSL2_extension_h3_injective from §5.2, proved there using the actual Sylow subgroup maps. For the right injection use that same subgroup theorem with C. Both images have order m in the cyclic group H₃(SL₂(E);ℤ[1/ℓ]), hence coincide. This use of cyclic orders identifies two already specified subgroup images; it does not assert that σF is injective.

Now suppose σF(z)=0. By the factorization, the image of z over E is the image of a unique c∈H₃(C). Extend to Ω. The torus C lies in μ(Ω), its H₃ inclusion into H₃(μ(Ω)) is injective by the finite cyclic transition maps, and its composite to K₃ⁱⁿᵈ(Ω) is exactly the monomial diagonal map detected in §4.18. The detector is injective, so c=0 and then z=0. The vanishing used here follows from σF(z)=0 by naturality of stabilization and of the canonical indecomposable quotient; it uses no abstract identification of cyclic generators. Since |K₃(F)|=m, injectivity finally proves surjectivity.

Provide finiteQuadraticTorus_factorization, finiteStabilization_injective and finiteStabilization_bijective with precisely these maps. The former is a theorem about equal images, not a choice of a root generator. As a subsequent consequence, algebraicClosureStabilization states that H₃(SL₂(Ω);ℤ[1/ℓ])→K₃ⁱⁿᵈ(Ω) is an isomorphism for an algebraic closure of a finite field. Take filtered colimits of the now proved finite comparisons; Kₙᴹ(Ω)=0 for n≥2 by finite-field Milnor vanishing and continuity. Thus this closure result is an output, not an input, of §5.3. All the comparisons are natural in finite fields.

The source locators are Hutchinson 2013, arXiv v2, Corollaries 3.6–3.9, pp.14–15, for the finite homology, subgroup maps and stated comparison; Suslin 1991, Lemma 5.7, p.236, for the injective root-cycle detector, decomposed in §4.18. The quadratic-extension factorization above gives the proof route for the actual map without the Sah input used in Hutchinson's proof.

**Checks.**

- The integral stabilization sends every characteristic-primary class to zero.
- The F₂→F₄ square commutes for the actual entrywise inclusion.
- Integral stabilization at F₅ has a nontrivial kernel; the localized map is bijective.
- For F₂⊂F₄ the two subgroup images have order 3 in H₃(SL₂(F₄);ℤ[1/2]) of order 15. For F₃⊂F₉ they have order 8 in the group of order 80. These test both characteristics and the cofinal modulus 8 in the two-primary Chern detector.

*Needs:* §1.5, §2.4, §4.18, §5.1, §5.2; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.4 The finite cross-ratio homomorphism

For finite F with q≥4 construct λF:H₃(SL₂(F),Z)→Bₛ(F), where Bₛ is precisely the Layer 3 Suslin kernel using the antisymmetric tensor quotient. Use Hutchinson’s refined configuration edge map followed by RB(F)→Bₛ(F). On a cyclic bar class represented by Σᵢ(1,t,tⁱ⁺¹,tⁱ⁺²), evaluate using the augmentation-preserving bar comparison β below and the refined cross-ratio map, then forget square classes. When the subgroup action has more than one orbit, the explicit βx,y of Hutchinson §6.2 supplies the comparison. In a transitive action use the general projective comparison instead. Degenerate tuples are handled by β, not by inserting inadmissible symbols.

Here F is a finite field with cardinality q≥4 and prime characteristic ℓ. Bₛ(F) is the Layer 3 Suslin Bloch kernel in the antisymmetric tensor quotient, with no extra relation.

- The homomorphism λF induced by the refined configuration edge map.
- Bₛ(f)∘λF=λL∘H₃(SL₂(f)) for embeddings between finite fields of cardinality at least4.
- If ℓᵃz=0, λF(z)=0.

- For a cyclic subgroup and the specified bar generator, λ equals the sum of cr(β(1,t,tⁱ⁺¹,tⁱ⁺²)) in Bₛ; the result is independent of the bar comparison, including x,y when that explicit model applies.

The refined construction has the following proof decomposition, with no infinite-set contraction used for a finite projective line. In this paragraph only, write E¹₍ₕ,c₎=H_h(SL₂(F),L_c) (homology index first), where L_c is free on distinct ordered (c+1)-tuples in P¹(F). Its total differential is the convention in §4.1 after exchanging the index names.

- refinedPreBloch: for any field with at least four elements, put GF=Fˣ/(Fˣ)², RF=ℤ[GF], I=ker(RF→ℤ) and ⟪u⟫=⟨u⟩−1. Define RP(F) as the RF-module on reduced generators [x], x≠0,1, with the relations

  [x]−[y]+⟨x⟩[y/x]−⟨x⁻¹−1⟩[(1−x⁻¹)/(1−y⁻¹)]+⟨1−x⟩[(1−x)/(1−y)]=0

  for x,y≠0,1 and x≠y. All displayed arguments are then reduced generators. The API is refinedPreBloch.of, fiveTerm, lift and ext for the quotient universal property, and map, map_id, map_comp for field embeddings and their induced square-class ring maps. refinedPreBloch.forget sends [x] to the ordinary symbol and RF through augmentation; its coinvariant map is an isomorphism RP(F)₍Fˣ₎≅P(F). Define refinedBoundary1 by [x]↦⟪1−x⟫⟪x⟫ in I² and refinedBoundary2 by [x]↦x⊗(1−x) in Qₛ, on which RF acts through augmentation. The latter is the negative of Hutchinson's order convention. These maps respect every refined relation: the first follows either by expanding square classes or by the configuration differential below, and the second by augmentation and §3.5. Define refinedBloch as their simultaneous kernel and RP₁ as the first kernel. Their API has kernel membership, inclusions, induced field maps with identity/composition, and the forgetful map RB→B. This pair-of-maps model has the same kernel as Hutchinson's pullback-valued boundary, without requiring a second tensor quotient. Source: Hutchinson §§2.3–2.4, Lemmas 2.4–2.8, pp.5–9.

  Define refinedCrossRatio on a distinct quadruple by choosing an SL₂ matrix sending its first two points to 0,∞. If the last two images are r,s∈Fˣ, send it to ⟨r⟩[s/r]. A different choice multiplies r,s by the same square, proving independence; its augmentation is §3.2's ordinary cross-ratio. Its API is normalized, sl2_invariant, gl2_equivariant with the determinant square class, fiveFaces giving the displayed relation, and field_map. This is Hutchinson Lemma 2.1, Corollary 2.2 and §6.3, pp.5–7,32.

  **Checks.**

  - Over F₄ every unit is a square, so RF=ℤ, λ₁=0 and RP=P.
  - Over F₅, writing ε for the nonsquare class, λ₁[2]=0 but λ₁[3]=(ε−1)²=2(1−ε)≠0; dropping square-class coefficients changes the kernel.
  - The F₅ relation at (2,3) is (1−ε)[2]+ε[4]=0 and augments to [4]=0. For the refined cross-ratio, (0,∞,1,x) gives [x], (0,∞,a,b) gives ⟨a⟩[b/a], and scaling by a nonsquare changes the coefficient even when it fixes the ordinary cross-ratio. A repeated point lies outside this definition; only the separate bar comparison handles such bar tuples.
- finiteConfiguration_lowDegree_comparison: specialize §4.0’s finite injective-word exactness to |P¹(Fq)|=q+1; its possible top augmented homology is in degree q+1. Thus H_i(L)=0 for 1≤i≤q−1. The other filtration of the double complex identifies hyperhomology with H_i(SL₂(F),ℤ) for i≤q−1, including degree three at q=4. See Hutchinson Lemmas 4.4–4.6, pp.19–21. The top homology is retained; the complex is not globally acyclic.
- finiteConfiguration_barComparison: for any subgroup G≤SL₂(F) and q≥4, construct an augmentation-preserving equivariant chain map β from the homogeneous bar resolution through degree four to L. On each free bar basis element, lift the already determined boundary using H_i(L)=0 for 1≤i≤3 and exactness of the augmentation in degree zero; extend equivariantly. Work through the normalized bar quotient to send adjacent repeated group entries to zero. The same induction constructs a homotopy through degree three between any two choices. Consequently its degree-three coinvariant map is the spectral-sequence edge and is independent of all lifts. Its API is barComparison.aug, barComparison.d, barComparison.homotopy, barComparison.edge and naturality on induced homology. For a nontransitive action, choosing x and y outside G·x gives the explicit βx,y of Hutchinson §6.2, p.31; on four distinct orbit points it is their tuple, and on alternating orbit points it is the two tuples used in §5.5. The refined cross-ratio of Hutchinson §6.3, p.32, adds the SL₂ orbit square-class factor before its reduced symbol. **Checks.**

  - Adjacent repeated entries have zero normalized image; an unnormalized orbit-tuple assignment would retain a repeated tuple.
  - On a distinct orbit quadruple the explicit map gives its cross-ratio, for example ω on (0,∞,1,ω) over 𝔽₄.
  - The norm-one C₅ in SL₂(𝔽₄) acts transitively on all five projective points, so no y outside its orbit exists, yet the general comparison and its edge still exist. This last case rules out using βx,y without its orbit hypothesis.
- refinedConfiguration_page: let RF=ℤ[Fˣ/(Fˣ)²], I=ker(RF→ℤ), and write ⟪u⟫=⟨u⟩−1. Shapiro gives the Borel at c=0, the determinant-one diagonal torus at c=1 and the central µ₂ stabilizer at c≥2, with square-class orbit coefficients. The c=4→3 differential gives the refined five-term relation; the c=3→2 differential on [x] is −⟪1−x⟫⟪x⟫. Consequently E²₍₀,₃₎=RP₁(F)=ker λ₁. If J is the RF-ideal generated by the λ₁[x], then E²₍₀,₂₎=Ī=I/J, the fundamental ideal in RF/J; it is not the free augmentation ideal I. The corresponding E²₍₁,₂₎ is Ī⊗µ₂. The c=1→0 differential is inversion minus identity: it sends a to a⁻² in H₁(T), is zero on H₂(T)=Λ²U, and is zero on its H₃ Tor term. Positive characteristic Borel homology is split off and retained, not declared torus-acyclic integrally. These are Hutchinson §4.4–4.5, pp.22–24.
- refinedConfiguration_d2: d²:Ī→Fˣ/(Fˣ)² sends the class of ⟪u⟫ to ⟨u⟩; the map I→Fˣ/(Fˣ)² kills J, so descends to this source. Here is the lift calculation. For a∈Fˣ−{1} put g=((1,0),(a−1,1)) and h=((1,a⁻¹−1),(0,1)). The former carries (∞,1) to (∞,a), and the latter carries (0,1) to (0,a). For c=(0,∞,a)−(0,∞,1), the homogeneous bar 1-chain y=(I,g)⊗(∞,1)−(I,h)⊗(0,1) satisfies d_bar y=d_config c. Under the total differential, c+y has remaining boundary d_config y. Use sections s(0)=I, s(∞)=((0,−1),(1,0)), s(z)=((1,0),(z,1)). On a point z the Shapiro image uses s(mz)⁻¹m s(z). The four edges of d_config y have first diagonal coordinates 1,1,a,1, with coefficients +1,−1,−1,+1, after converting (I,m) to the inhomogeneous inverse. Their product is a⁻¹, hence the square class ⟨a⟩. This proves the formula, including its total-complex convention, and representative independence follows from changing sections by a stabilizer-valued chain homotopy. This calculation supplies the explicit target underlying the Mazzoleni Lemma 5 citation in Hutchinson §4.6, p.25. The central µ₂ Pontryagin module structure gives d²(⟪u⟫⊗(−1))=u∧(−1): the total-complex module sign is (−1)^degree. Hence E³₍₂,₀₎=Λ²U/(U∧µ₂) on the prime-to-characteristic part. For finite F, the GL₂ comparison is made over ℤ[1/ℓ]: its unipotent Borel radical is an ℓ-group and has zero positive homology over these coefficients. Thus the torus comparison and the finite bar identities of §4.11 apply in the degree-three range q≥4, without an infinite-field acyclicity assertion. For refinedConfiguration_torusComparison, compare the SL₂→GL₂ action spectral sequences using exactly §4.11's splitting. The diagonal D(a)=diag(a,a⁻¹) sends a∧b to raw coordinates (2a∧b,−2a⊗b), so the shear gives (0,−2a⊗b). Thus the injection Λ²U/(U∧µ₂)→Qₛ has coefficient **−2** with these conventions. Together with §4.11's explicit GL₂ differential it identifies the next kernel as RB(F), the simultaneous kernel of λ₁ and the tensor boundary λ₂. When the source orders its boundary as (1−x)⊗x, reverse that order and the matching comparison sign to use this roadmap's x⊗(1−x); their kernels and the normalized λF agree. This is a chain comparison, not an inference from orders.
- refinedConfiguration_edge: for q≥5, the truncation LES identifies the incoming d³ to E³₍₂,₁₎ with H₂(SL₂,W₁)→H₂(SL₂,L₁), W_i=ker(L_i→L₍ᵢ−₁₎). Under Shapiro the remaining map µ:H₂(T)→H₂(SL₂,W₀) sends γ⊗1 to γ⊗((0)−(∞)). Transport by the Weyl element acts trivially on H₂(T) and reverses this point difference. Thus µ=−µ, so E∞₍₂,₁₎ is killed by two. For finite F, Λ²Fˣ=0 and that term is zero. At q=4 that vanishing holds directly on the first page, so the degree-four truncation comparison is unnecessary; the total-degree-three comparison already has the required range. The only other middle filtration term E∞₍₁,₂₎ is a quotient of Ī⊗µ₂, of order at most two; it vanishes in characteristic two. The edge yields 0→H₃(B)→H₃(SL₂)→RB→0, exact except possibly at the middle with precisely that residue. The first injection is §5.2's actual torus injection together with the split characteristic-primary Borel summand. See Hutchinson Lemma 4.7, Corollary 4.8 and §4.8, pp.27–28. This accounts for every total-degree-three filtration term.
- finiteRefined_forget_equiv: the refined-to-ordinary forgetful map induces RB(F)₍Fˣ₎≅B(F) (Hutchinson Lemma 2.12, p.11). Here is the finite algebra needed for that step. In even characteristic GF is trivial and both refined objects equal their ordinary counterparts. In odd characteristic write ε for the nonsquare class. Then I=ℤ(ε−1), I²=2I and I³=4I. A quadratic-character count gives (q−χ(−1))/4>0 elements a with a and 1−a nonsquare; hence λ₁[a]=(ε−1)² generates I², so J=I² and Ī=ℤ/2. Since U is cyclic, Qₛ≅Sym²_F₂(GF)≅ℤ/2, and λ₂ is the reduction of λ₁ in I²/I³. Thus RB=ker λ₁ and 0→RB→RP→I²→0 is exact. The square-class involution acts as −1 on the infinite cyclic I²; its H₁ is zero by the existing cyclic norm resolution. Taking coinvariants therefore identifies RB coinvariants with the kernel of P→I²/I³=Qₛ, which is B. The characteristic-primary summand lies in the Borel image and is killed by the edge, so that edge factors surjectively through localized H₃. Its Fˣ action is trivial by §5.2, hence RB itself has trivial action. This makes RB(F)→B(F) an isomorphism, not the generally false assertion RP(F)→P(F) is an isomorphism (Lemma 7.1 and Remark 7.2, p.34).

Define λF from this edge followed by forgetful comparison. The cyclic and quaternion comparison chains in §5.2, followed by β (by βx,y when its orbit hypothesis holds), compute the actual map. The β chain homotopy makes it independent of auxiliary points, and naturality follows from the tuple complex and the inclusion-induced bar maps. The Borel kernel already kills the entire characteristic-primary summand, and the edge is surjective. Thus λF factors through localization without using the order formula. Section 5.5 determines its exact kernel size and the remaining two-primary filtration term.

The source locators for these statements are Hutchinson 2013, arXiv v2, §4 Theorem 4.3, pp.19–28; §6.1–6.4, pp.30–33; §7 Lemma 7.1.

**Checks.**

- The kernel for F₅ has order40, distinguishing integral H₃ from its order24 localization.
- The kernel for F₇ has order12 and the target has order4.
- The kernel for a field of cardinality4 has order6 and target order5.

*Needs:* §3.2, §3.5, §4.1, §4.0; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.5 The finite Bloch sequence and its orders

For q≥4, Bₛ(Fq) is cyclic of order (q+1)/2 when q is odd, and q+1 when q is even (`finiteBloch_order`). At q=2,3 the unmodified Suslin presentation instead gives Bₛ(F₂)=0 and Bₛ(F₃)=Z; these are separate presentation calculations, not instances of the finite exact sequence. The CGZ convention agrees modulo odd n through §3.16, not integrally.

Here F is a finite field with cardinality q≥4 for the cyclic order formula. The separate small-field assertions use the same Suslin presentation at F₂ and F₃.

For q≥4, factor λF through coefficient localization (its target has order prime to ℓ), obtaining λF,loc. Define bF=λF,loc∘σF⁻¹:K₃(F)→Bₛ(F). It is a natural surjection and satisfies bF∘σF∘localization=λF. The inverse of σ is canonical, so no cyclic generator enters the definition.

Here F is a finite field with cardinality q≥4 and prime characteristic ℓ. σF is the actual stabilization comparison and λF the finite refined edge map followed by RB→Bₛ.

- bF is λF,loc∘σF⁻¹.
- bF(σF(localization(z)))=λF(z).
- Bₛ(f)∘bF=bL∘K₃(f) for finite-field embeddings.

- Every finite Bloch class is the image of an actual K₃ class.

For q≥4, 0→T̃(Fq)→K₃(Fq)−bF→Bₛ(Fq)→0 is natural and exact; T̃ is exactly the enhanced Tor term of Layer 4. It is cyclic of order 2(q−1) for odd q and q−1 for even q. The chosen left arrow is the monomial enhanced-Tor map; its image equals the image of the enhanced-Tor injection in Hutchinson Corollary 7.5. No equality with that corollary's separately constructed left arrow under a fixed enhanced-Tor identification is asserted.

Here T̃(F) and its monomial arrow are the Layer 4 enhanced Tor construction. Its injectivity follows from its algebraic-closure square; the refined edge calculation and cyclic subgroup uniqueness identify its image with ker bF.

Here is the remaining two-primary and left-arrow proof, in the order needed for these assertions.

First, the edge filtration in §5.4 makes B(F) cyclic as a quotient of localized H₃. In even characteristic its kernel is the split torus H₃, of order q−1, so its order is q+1. In odd characteristic the kernel contains that torus and has index at most two over it; thus the possible orders are q+1 and (q+1)/2. To distinguish them, use the **actual β images** (Hutchinson Lemmas 7.3–7.4, pp.34–35). If q≡1 mod 4, choose i²=−1. The quaternion Sylow group is generated by D(z) and w, and w fixes i. With β∞,i every degree-three bar tuple either vanishes or has cross-ratio image h((z₁/z₀)²)=0, where h(u)=[u]+[u⁻¹] and §3.6 proves h(square)=0. Thus λ kills the entire quaternion Sylow H₃; its order has twice the two-primary order of the split torus. If q≡−1 mod 4, use C₄=⟨w⟩. Its periodic generator has β image 2((y,wy,∞,0)+(y,wy,0,∞)), so λ gives 2h(−1/y²)=0. Its H₃ injection from §5.2 forces the extra factor two in the kernel in this case too. This proves the order (q+1)/2, including the residual E∞₍₁,₂₎ calculation. It also proves the stated integral λ kernel orders after restoring the characteristic-primary Borel part.

Next define the left arrow tF:T̃(F)→K₃(F)=K₃ⁱⁿᵈ(F) by the **same monomial plus-space arrow as in §4.19**, defined for every field, before comparing its image with ker bF. This is finiteEnhancedTor_arrow; no choice of a cyclic generator is involved. It is injective: embed F in its infinite algebraic closure Ω. The map T̃(F)→T̃(Ω) is injective by the natural short exact sequences with µ₂ kernels and ordinary Tor quotients; the µ₂ map is injective and the Tor map is injective by the finite cyclic transition formula in §5.2. Section 4.20 gives injectivity T̃(Ω)→K₃ⁱⁿᵈ(Ω). Naturality of the monomial arrow then implies injectivity of tF. This argument does not require σF, and uses no assumed finite Suslin sequence.

Finally K₃(F) is cyclic, tF has image of order 2(q−1) (odd q) or q−1 (even q), and the already constructed bF has a kernel of exactly that order by the preceding refined calculation and §5.3. The two subgroups therefore coincide, proving finiteEnhancedTor_exact with the specified monomial arrow. The same subgroup uniqueness identifies its image with that of Hutchinson's enhanced-Tor injection, without choosing an isomorphism of enhanced-Tor carriers that equates the two injections. Naturality of tF follows from the monomial construction; that of bF follows from σF and the refined edge. The sequence is therefore natural and exact with these chosen arrows.

The source locators for these statements are Hutchinson 2013, arXiv v2, §7 Lemma 7.4 and preceding paragraph, pp34–35; Hutchinson 2013, arXiv v2, §7 Corollary 7.5 and proof, pp35–36; Hutchinson 2013, arXiv v2, §7 Corollary 7.5, p35.

**Checks.**

- Its kernel at F₅ has order8.
- Its kernel at F₇ has order12.
- Its kernel at cardinality4 has order3.
- At q=5, integral H₃(SL₂(F₅),ℤ) has characteristic-primary information that is excluded by ℤ[1/5]; do not identify the integral group with ℤ/24.
- q=2 and q=3 remain outside this Bloch convention’s finite-field order formula.
- In ℤ/24 the injections ℤ/8→ℤ/24 given by x↦3x and x↦15x both have image {0,3,6,9,12,15,18,21}, but send 1 to 3 and 15. The second is the first precomposed with x↦5x on ℤ/8, which fixes its quotient ℤ/4 and its order-two subgroup {0,4}; equality of images and these extension data do not identify the arrows.

*Needs:* §3.4, §3.6, §3.13, §4.19, §5.2, §5.3, §5.4; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.6 Odd coefficients and the norm-one Cartan

Let q≥4 and n>0 be odd with gcd(n,q−1)=1. The actual map bF induces a bijection K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n. Both are cyclic of order gcd(n,q+1), and κ gives the same comparison with B_new. If n|q+1 they have order n. Without the gcd hypothesis this is false (q=7,n=3). These are tensor quotients of integral H₃/K₃, not group homology with Z/n coefficients.

Here F is a finite field with cardinality q≥4 and prime characteristic ℓ. n is a positive odd integer with gcd(n,q−1)=1; modulo n means tensoring the integral groups with Z/n.

Let Fq be finite with q≥4, n>0 odd and n|q+1; q may be even. The maps H₃(C¹,Z)⊗Z/n→H₃(SL₂(Fq),Z)⊗Z/n→K₃(Fq)⊗Z/n→Bₛ(Fq)⊗Z/n→B_new(Fq)⊗Z/n induced by ιe, stabilization, bF and κ are bijective. Since n is odd and divides q+1, gcd(n,q−1)=1 and the first assertion applies; H₃(C¹,Z)=Z/(q+1) maps injectively into the prime-to-ℓ part, by multiplication by q−1 up to a unit, which is invertible modulo n. Their composite is independent of e because GL₂ conjugation acts trivially after inverting the characteristic. The result concerns H₃(C¹), not a claimed canonical identification H₃(C¹)=C¹.

Here F has cardinality q≥4, of either parity; E/F is its quadratic extension, with an F-basis e indexed by Fin 2. n is positive and odd, and n divides q+1; all quotients mean tensoring integral homology with Z/n.

The source locators for these statements are CGZ 2023, §4.2 and Lemma 4.4, pp406–407; Hutchinson 2013, arXiv v2, §7 Corollary 7.5, p35; Hutchinson 2013, arXiv v2, §3 before Lemma 3.5, p13; CGZ 2023, §4.2 p406; CGZ 2023, §4.2 pp406–407.

**Checks.**

- The norm-one unit1 maps to the identity matrix.
- The norm-one unit−1 maps to the scalar matrix−I, including characteristic2.
- For u∈C¹ the matrix trace is u+u⁻¹, viewed in E by algebraMap.
- q=5,n=3 and q=11,n=3 satisfy the hypotheses; q=7,n=3 does not.
- q=4,n=5 satisfies them in characteristic two: C¹ is cyclic of order 5 and all five groups are ℤ/5, since H₃(SL₂(𝔽₄),ℤ)=ℤ/30, K₃(𝔽₄)=ℤ/15 and B(𝔽₄)=B_new(𝔽₄)=ℤ/5.
- A different cyclic generator must transform the bar-cycle image accordingly.

*Needs:* §3.13, §5.1, §5.2, §5.3, §5.5; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.7 Number-field quotient applications

For a number field F, the image of K₃ᴹ(F)→K₃(F) equals the image of multiplication by [−1]:K₂(F)→K₃(F). Via Layer 2 injectivity it is (Z/2)^r₁. In particular it vanishes for totally imaginary F. All degree-three Milnor signs are imported from K2SymbolsBrauer §10.32, not computed in Layer 5.

Here F is a number field; multiplication is the Quillen product with the K₁ class of−1, and the Milnor comparison preserves products.

Import K₃(Z)→K₃(Q) as an isomorphism and K₃(Q)≅Z/48 from ArithmeticKTheory §§5.1, 5.3–5.4 and 8.10. Bass–Tate gives K₃ᴹ(Q)=Z/2 and the Layer 2 degree-three map is injective. Its image is the unique order2 subgroup generated by {−1,−1,−1}; under any cyclic coordinate it is {0,24}. Thus K₃ⁱⁿᵈ(Q)=Z/24. This quotient extension does not split.

Here F=Q; the Milnor comparison and indecomposable quotient are those of Layer 2. The ambient K₃(Z)→K₃(Q) and cyclic structure of order48 are imported from ArithmeticKTheory §§5.1, 5.3–5.4 and 8.10, not recomputed here.

For F=Q(i), use w₂(F)=24 from ArithmeticKTheory §§5.1, 5.3–5.4 and 8.10 to obtain K₃(F)≅Z⊕Z/24. Bass–Tate gives K₃ᴹ(F)=0 since r₁=0; hence the quotient K₃(F)→K₃ⁱⁿᵈ(F) is an isomorphism. The rank1 free generator exists but is not canonical; choosing a basis is distinct from constructing a Bloch-symbol generator with certified index.

Here F=ℚ(i) has r₁=0 and r₂=1. The ambient structure and the value w₂(ℚ(i))=24 are supplied by ArithmeticKTheory §§4.4, 5.3 and 8.10.

The source locators for these statements are Weibel, K-book III, III.7.2(c)–(d), pp61–62; Weibel, K-book VI, VI.2.1.2 p7; VI.2.2–2.3, pp8–11; VI.5.3 p24. The reduction ℤ/48→ℤ/24 pins the quotient: 24 is a nonzero kernel element and the additive quotient map has no section.

*Needs:* §2.1, §2.2; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### 5.8 A real detector for the universal torsion class

Using the interval Rogers function L of PolylogarithmFunctions §§6.1, 6.3–6.5, construct ρ:Pₛ(R)→R/(π²Z). For an admissible real generator x, set ρ([x]) equal modulo π² to L(x)−π²/6 if 0<x<1, π²/6−L(1/x) if x>1, and L(1/(1−x))−π²/3 if x<0. This is the Suslin normalization. Restricting along Bₛ(R)⊂Pₛ(R) gives the Bloch detector. No analytic function is newly defined in Layer 5.

Here Pₛ(R) is the Layer 3 Suslin pre-Bloch group on real symbols x≠0,1. L is the unshifted interval Rogers function with the normalization, reflection and ordered five-term identity of the PolylogarithmFunctions supplier contract above.

- The homomorphism ρ on the exact Suslin real pre-Bloch presentation.
- For 0<x<1, ρ([x])=[L(x)−π²/6].
- For x>1, ρ([x])=[π²/6−L(1/x)].

- For x<0, ρ([x])=[L(1/(1−x))−π²/3].
- A homomorphism agreeing on every admissible symbol with those three formulas equals ρ.

Prove quantifier elimination for the first-order theory of real closed ordered fields in the language of ordered rings. Deduce completeness and model completeness: any two real closed ordered fields satisfy the same sentences with rational constants, and every ordered-field embedding between real closed fields is elementary, including formulas with parameters in its domain. Use Mathlib’s first-order structures, formulas, elementary embeddings and theory semantics, with `TauCeti.RealClosure.exists_realClosure` and `RingPreordering.exists_linearOrder` for ordered real closures; the algebraic back-and-forth proof extends an order-preserving map through real closures of singly generated ordered extensions. This proves the real-closed-field transfer target before its application to symbol relations (Marker, Theorem 3.5, Corollary 3.6 and Proposition 4.1, pp.24–25; marker line 376).

**Checks.**

- The sentence asserting a root of t²−2 is true in the real algebraic numbers and in ℝ, with the positive root squared equal to 2; it is false in ℚ. The real-closed hypothesis cannot be replaced by an ordered-field hypothesis.
- The equation t²+1=0 has no solution in either real closed field, whereas it has a solution in ℂ. Algebraic closure is a different condition.
- In a non-Archimedean real closed extension of ℝ the formula ∃x, x>a has witness a+1, for each parameter a from ℝ, just as in ℝ. With a transcendental parameter t in the extension, ∃x, x²=t holds exactly when t≥0 in both the parameter field's real closure and any ordered real closed extension; rational-parameter transfer alone does not assert an embedding of that whole field into ℝ.

Before proving the order theorem, prove finite certificate transfer: for real closed ordered fields R and S, a fixed finite list of integer coefficients, a fixed integer k and a rational free-symbol expression ξ, there are admissible pairs with evaluation Σ aᵢR(xᵢ,yᵢ)+k[1]=ξ over R if and only if there are such pairs over S. Partition the finitely many symbol occurrences by equality of their field arguments, and require the total coefficient in each class to be zero. A finite disjunction over these partitions expresses free-group equality; admissibility makes every denominator nonzero, so clearing denominators preserves the equations. The preceding completeness theorem for real closed ordered fields then proves the equivalence. This is a mathematical existence theorem, with no search bound.

**Checks.**

- For a list with no pairs, k[1]=0 in the unreduced free group holds exactly when k=0 in either field.
- The single coefficient 1 at (2,3) evaluates to the same five rational arguments over every real closed field.
- With no pairs and k=0, ξ=[2] is nonzero in the free group in both fields. Equality of augmentations alone would wrongly permit ξ=[2]−[3]; the equality-pattern equations exclude it.

The universal class c has exact order6 in Bₛ(F) for every formally real field F (`blochC_order_six`). The real detector sends c=[2]+[−1] to−π²/6 moduloπ², an element of order6, and the Layer 3 relation6c=0 gives the upper bound. Naturality proves the lower bound for every field with a field embedding into R, in particular Q. For any formally real field, its sums-of-squares preordering excludes −1, so `RingPreordering.exists_linearOrder` supplies an order and `TauCeti.RealClosure.exists_realClosure` supplies an ordered algebraic embedding into a real closure R′; no embedding into ℝ is required. For each fixed finite integer coefficient list, the existence of a five-term certificate (§3.3) with that coefficient list for 2c or for 3c is a first-order existential statement with rational parameters, since equality in the free group on the arguments is decided by finitely many equality patterns among them. Such a statement holds in R′ exactly when it holds in the real algebraic numbers, a subfield of R, by the preceding real-closed-field completeness theorem and finite equality-pattern encoding; so neither 2c nor 3c vanishes in R′, hence not in F. Through the infinite Suslin sequence, K₃ⁱⁿᵈ(Q)=Z/24 and T̃(Q) has order4, so Bₛ(Q)=Z/6 and c is a generator.

Here ρ is defined on R; the order statement holds for every formally real field, with the Layer 3 Suslin Bloch group and universal class c=[x]+[1−x]. Its additive order can equivalently be measured in the actual pre-Bloch group P(F), because B(F) is a subgroup. This is the acceptance signature on preBlochSymbol(2)+preBlochSymbol(−1), with the native IsFormallyReal hypothesis; no embedding into ℝ is assumed.

The source locators for these statements are Suslin 1991, §1 Lemma 1.6 and proof, pp219–220; Zagier 2007, II.1.A pp23–24; Suslin 1991, §1 Proposition1.1, p220; Weibel, K-book VI, VI.5.2.1 p24.

**Checks.**

- ρ([1/2])=[−π²/12].
- ρ([2])=[π²/12].
- ρ([−1])=[−π²/4].
- ρ(c)=[−π²/6] has order six in R/π²Z; reducing modulo π²/2 instead would give order three and lose the detector.

*Needs:* §3.3, §3.4, §3.5, §3.6, §4.19, §4.20, §5.7; `TauCeti.RealClosure.exists_realClosure`; `RingPreordering.exists_linearOrder`; Mathlib first-order semantics; Layers 1–4; the finite-field, arithmetic and interval Rogers contracts.

### Examples

At q=5, integral H₃(SL₂) has order 120, its characteristic-localized part has order 24, B has order 3, and the two Bloch-map kernels have orders 40 and 8. At q=4 the corresponding orders are 30,15,5 and kernels 6,3. At q=7,n=3, K₃/n has order three while B/n=0, showing why the root coprimality condition matters. For ℚ, the Rogers values π²/12 and −π²/4 on [2] and [−1] sum to −π²/6, proving exact order six for c.

### Dependencies

Use Layers 1–4, GeneralAlgebraicKTheory §13.8c and KTheoryFiniteLocalFields §1.5 for the finite-field groups and their restriction and transfer, and ArithmeticKTheory §§3.2–3.4, 4.1–4.4, 5.1, 5.3–5.4 and 8.10 for the ambient number-field groups. The refined finite configuration complex, its edge map and compatibility with the monomial torsion arrow are the finite proof obligations here; no contraction by a fresh point is used for a finite set. PolylogarithmFunctions §§6.1, 6.3–6.5 supplies only the interval Rogers function and its analytic identities. Section 5.8 uses Mathlib first-order semantics, `RingPreordering.exists_linearOrder` and `TauCeti.RealClosure.exists_realClosure`; its general real-closed-field theorem precedes finite coefficient-list transfer. Downstream, Polylogarithms Layer 2 consumes these maps for its regulator comparison; PadicHodgeRegulators is an anticipated consumer.

## Layer 6: Finite witnesses and coefficient comparisons

Certificates distinguish two tasks: proving a finite symbolic expression has zero boundary, and proving two expressions agree modulo five-term relations. A lift to K₃ exists in the ranges of Layers 4–5, with its exact ambiguity. Neither a five-term witness nor an abstract surjection supplies an executable chain-synthesis algorithm.

### 6.1 Transport of five-term equality certificates

Use the finite certificate group and evaluation constructed in §3.3. A valid five-term certificate for the difference of two finite combinations proves that they have the same class in P(F). Conversely, if two combinations have the same class in P(F), then some valid certificate for their difference exists. Existence is not effective: no bound on the length of the certificate is claimed. A valid certificate for ξ gives zero in P(F)/nP(F) for every natural n, including n=0 (the integral quotient). Under inclusion of nondegenerate generators it also gives a relation in the extended CGZ presentation; a cycle maps to zero in its cycle quotient (CGZ 2023, Lemma 2.2, p.391).

**Checks.**

- The indicator of (2,3) over ℚ evaluates to [2]−[3]+[3/2]−[3/4]+[1/2] and vanishes in every tensor quotient P(ℚ)/n.
- The certificate evaluating to [1] maps to the zero degenerate class in both CGZ versions; it is not a certificate for [0].
- Over Q no certificate is valid for [2]: the boundary of §3.5 kills every evaluation, but it sends [2] to 2 ∧ (−1) ≠ 0 in the antisymmetric quotient of Q^×.

*Needs:* §§3.3–3.5, §3.13 and §3.15; finite supports and the indicated quotient maps.

### 6.2 Boundary certificates and Bloch elements

Let F be a field and ξ = Σ n_x [x] a finitely supported integer combination of elements x ∈ F − {0, 1}. A vanishing-boundary certificate for ξ consists of a root of unity ζ_0 ∈ F^× with its exact order m_0 ≥ 1, elements g_1, …, g_s ∈ F^×, and for each x in the support exponent vectors e(x), f(x) ∈ Z/m_0 × Z^s with x = ζ_0⁽ᵉ_⁰⁾ ∏ g_j⁽ᵉ_ʲ⁾ and 1 − x = ζ_0⁽ᶠ_⁰⁾ ∏ g_j⁽ᶠ_ʲ⁾ (equalities in F). Its boundary is Σ n_x e(x) ∧ f(x) in ∧̃²(Z/m_0 × Z^s) ≅ Z/gcd(m_0, 2) ⊕ (Z/m_0)^s ⊕ (Z/2)^s ⊕ Z⁽ˢ⁽ˢ−¹⁾/²⁾, with components Σ n_x e_0 f_0 mod gcd(m_0, 2), Σ n_x (e_0 f_j − e_j f_0) mod m_0, Σ n_x e_j f_j mod 2 and Σ n_x (e_j f_k − e_k f_j) for j < k. The certificate is valid when all components vanish. A valid certificate proves ∂ξ = 0 in ∧̃²F^×; if ζ_0 and the g_j generate a direct summand of F^× on which they are a basis, the converse holds.

Here F is a field; ξ is supported on F − {0, 1}. ζ_0 has exact order m_0; the displayed factorisations hold in F.

- The root of unity ζ_0 with its order m_0, the elements g_1, …, g_s, and the exponent vectors e(x), f(x) with their factorisation proofs.
- Σ n_x e(x) ∧ f(x) in ∧̃²(Z/m_0 × Z^s), by the displayed component formula.
- All components of the boundary vanish.

- Validity is equivalent to vanishing of every displayed integral or modular coordinate, including every diagonal coordinate modulo two.
- The induced map ∧̃²(Z/m_0 × Z^s) → ∧̃²F^× sends boundary to the boundary of §3.5 of the class of ξ.
- Valid implies that the boundary of the class of ξ vanishes, so ξ defines an element of B(F).

- If ζ_0, g_1, …, g_s form a basis of a direct summand of F^×, then ∂ξ = 0 implies Valid.
- Certificates over the same generators add, and the boundary is additive in ξ.
- A field embedding transports a certificate, with the same exponent vectors.

- A valid certificate gives vanishing of the boundary in ∧̃²F^× ⊗ Z/n and of d(ξ) in ∧²(F^×/F⁽×ⁿ⁾), CGZ's condition for A(F; Z/nZ): the transport through finite-coefficient reduction.

Construct an element of B(F) from a finitely supported integer combination ξ of elements of F − {0} together with a proof that the boundary of the class of ξ vanishes in the antisymmetric tensor quotient ∧̃²F^×, or together with a vanishing-boundary certificate of §6.2. The construction refuses input whose boundary has not been shown to vanish in ∧̃²F^×; it does not pass to the exterior square or to another quotient where the boundary happens to die. It is Suslin's convention of Layer 3; inputs using the symbols [0] or [∞] of CGZ's convention are not accepted.

Here, the input is a finitely supported integer combination of nonzero elements of F.

- From ξ in the free abelian group on F − {0} and a proof that the boundary of the class of this ξ vanishes in ∧̃²F^×, an element of B(F).
- The image of ofData ξ h in P(F) is the class of ξ.
- Two inputs with equal classes in P(F) give equal elements.

- A valid five-term certificate for ξ − ξ' proves ofData ξ h = ofData ξ' h'.
- ofData 0 _ = 0.
- ofData (ξ + ξ') _ = ofData ξ _ + ofData ξ' _, and ofData (−ξ) _ = −ofData ξ _.

- Every element of B(F) is ofData ξ h for some input.
- The element of B(F) given by ξ and a valid certificate of §6.2; it equals ofData ξ (BoundaryCertificate.sound).
- For x in F − {0, 1}, ofData ([x] + [1 − x]) _ = c when |F| ≥ 4 (§3.6).

- A field embedding σ: F → K carries ofData ξ h to ofData (σξ) (σh); map id = id and map (τ ∘ σ) = map τ ∘ map σ.
- The comparison κ of §3.13 sends ofData ξ h to the CGZ class of ξ, regarded in the free abelian group on the projective line.

The source locators for these statements are Weibel, K-book, §VI.5, before Definition 5.1 (PDF p. 495); Weibel, K-book, Definition VI.5.1 (PDF p. 495); Weibel, K-book, Lemma VI.5.4(a) (PDF p. 496).

**Checks.**

- Over Q with ζ_0 = −1 (m_0 = 2), g_1 = 2: for ξ = [2] + [−1], e(2) = (0; 1), f(2) = (1; 0), e(−1) = (1; 0), f(−1) = (0; 1); the (0, 1) component is (0 − 1) + (1 − 0) = 0 and the others vanish, so the certificate is valid.
- Over Q with the same data, ξ = [2] has (0, 1) component −1 ≢ 0 mod 2, so it is not valid; since ⟨−1, 2⟩ is a direct summand of Q^×, [2] ∉ B(Q).
- Over Q(√−3) with ζ_0 = ω of order 6 and s = 0, ξ = [ω] has e = (1), f = (5) and (0, 0) component 5 ≢ 0 mod 2, so it is not valid, although its image in the exterior square vanishes; ξ = 2[ω] is valid.
- Over Q the input [2] + [−1] is accepted, since 2 ∧ (−1) + (−1) ∧ 2 = 0, and the output is c.
- Over Q the input [2] is rejected: 2 ∧ (−1) has order two in ∧̃²Q^×. The input 2[2] is accepted.
- For x ≠ y in F − {0, 1}, the inputs [x] + [1 − x] and [y] + [1 − y] give the same element, by the reflected-pair certificate of §3.3.
- Over F_5 the input [3] is rejected: 3 ∧ (1 − 3) = 3 ∧ 3 is the nonzero element of ∧̃²F_5^× ≅ Z/2, although its image in the exterior square ∧²F_5^× = 0 vanishes. A constructor testing the exterior square would accept it.
- Over Q, κ(ofData ([2] + [−1])) = [0] in CGZ's B(Q), of order three (CGZ Definition 1.1: [X] + [1 − X] − [0] = 0 and 3[0] = 0; CGZ (34) with n = 3), while c has order six in B(Q).

*Needs:* §3.1, §3.5, §6.1; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.3 Integral multiples of root symbols

Let F be a field and ζ ∈ F a root of unity of exact order m ≥ 2. Then m · ∂[ζ] = 0 in ∧̃²F^×, so m[ζ] ∈ B(F); and [ζ] ∈ B(F) if and only if ζ ∧ (1 − ζ) = 0 in ∧̃²F^×. For a primitive sixth root of unity ω one has 1 − ω = ω⁽−¹⁾ and ∂[ω] = (−1) ∧ (−1), so [ω] ∈ B(F) if and only if −1 is a square in F. All statements are in Suslin's convention of Layer 3; in the exterior-square convention ∂[ω] is always zero.

Here ζ ∈ F is a root of unity of exact order m ≥ 2.

Let F be a field, ζ a primitive m-th root with m≥2, P(F) the pre-Bloch group and ∂ its boundary to Suslin’s antisymmetric square. Define rootMultiple(ζ,m)=(m[ζ], h_m) in B(F)=ker ∂, where h_m is the boundary vanishing supplied by §6.3. The reusable construction takes any abelian groups P,W, homomorphism δ:P→W, x∈P, natural m and proof δ(mx)=0, and returns (mx,h)∈ker δ. The proof is not data on which the resulting element depends. Exact order is needed only for the field specialization, not the generic kernel construction.

Here F is a field, m≥2 and IsPrimitiveRoot ζ m for the field specialization; hence ζ≠0,1. Use the antisymmetric quotient, retaining diagonal two-torsion, throughout the integral construction.

- For δ,x,m,h:δ(mx)=0, return the kernel element with underlying value mx.
- The inclusion of rootMultiple(δ,x,m,h) into P is mx.
- For two proofs h,h′ of δ(mx)=0, the resulting kernel elements are equal.

- rootMultiple(δ,0,m,h)=0; rootMultiple(δ,x,0,h)=0.
- If b∈ker δ has underlying x, rootMultiple(δ,x,m,h)=mb.
- If δ(mx)=0 and δ((mk)x)=0, rootMultiple at mk is k times rootMultiple at m.

- For f:P→P′ and g:W→W′ with δ′f=gδ, the induced kernel map sends rootMultiple(δ,x,m,h) to rootMultiple(δ′,f(x),m,h′).

The source locators for these statements are Weibel, K-book, Definition VI.5.1 (PDF p. 495); Weibel, K-book, §VI.5, before Definition 5.1 (PDF p. 495); CGZ, arXiv v3 (2021), §6, final circular-unit paragraph, p33.

**Checks.**

- For δ:ℤ→ℤ/2 reduction, x=1 and m=2, the underlying rootMultiple is 2, not 1.
- For b in the Mathlib additive kernel of δ and m=3, rootMultiple built from the underlying b equals 3b in that kernel. For reduction δ:ℤ→ℤ/2 and b=2 this has underlying integer 6, not 2.
- For δ:ℤ→ℤ/2 reduction, 1 is not in ker δ although 2 is. A constructor returning the raw symbol fails this test.

*Needs:* §3.1, §3.5; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.4 Dividing root multiples over coefficient rings

Let δ:P→W be an additive homomorphism of abelian groups, B=ker δ, x∈P, m∈ℕ, and h:δ(mx)=0. Let R be a commutative ring and u∈R× with underlying value the image of m. Define rootCoefficient(δ,x,m,h,u)=(mx,h)⊗u⁻¹ in B⊗_ℤ R. Its image under B⊗R→P⊗R is x⊗1. This construction, without any flatness assumption, specializes for x=[ζ] to the rootClassMod (R=ℤ/n, gcd(m,n)=1), rootClassLoc (R=ℤ[1/m]) and rootClassPadic (R=ℤ_p, p∤m). It does not assert that tensoring the kernel identifies it with the kernel of the reduced boundary.

Here δ(mx)=0, R commutative and u a unit whose value is m in R. For the field specialization ζ has exact order m≥2. Coprimality or localization supplies the unit; when m is not invertible no raw coefficient class is constructed by this recipe.

- The pure tensor rootMultiple(δ,x,m,h)⊗u⁻¹ in B⊗R, for the specified unit u.
- Under the tensor of the kernel inclusion, rootCoefficient maps to x⊗1.
- For x=0 and any valid denominator, rootCoefficient=0.

- If b∈B has underlying x, rootCoefficient=b⊗1.
- For two annihilating positive or zero natural numbers m,l with invertible images u,v in R, the divided tensor classes coincide.
- For a ring map ρ:R→S, tensoring id_B with ρ sends the class to the class with unit ρ(u).

- For a commuting boundary square f:P→P′,g:W→W′, tensoring its kernel map with id_R sends the class at x to that at f(x).
- Under B⊗ℤ/n≅B/n this is rootClassMod; for ℤ[1/m] it is rootClassLoc; for ℤ_p with p∤m it is rootClassPadic, with the conventions.

The tensor of the inclusion 2ℤ↪ℤ with ℤ/2 is not injective, and 2 is not a unit in ℤ/2; this is the nonflat control for the construction.

Let ζ ∈ F be a root of unity of exact order m ≥ 2. (i) For n ≥ 1 prime to m, define ⟦ζ⟧_n ∈ B(F)/nB(F) as u · (m[ζ]) with u m ≡ 1 mod n; it does not depend on u and maps to the class of [ζ] in P(F)/nP(F). (ii) Define ⟦ζ⟧[1/m] ∈ B(F) ⊗ Z[1/m] as m[ζ] ⊗ m⁽−¹⁾; it maps to [ζ] ⊗ 1 in P(F) ⊗ Z[1/m]. (iii) For a prime p not dividing m, define the class in B(F) ⊗ Z_p in the same way. When [ζ] ∈ B(F) (§6.3) each class is the image of [ζ]; otherwise none is the image of an element [ζ] of B(F). These are the substitutes the consumers use in place of [ζ].

Here F is a field; ζ ∈ F has exact order m ≥ 2. n is prime to m, respectively p does not divide m.

- ⟦ζ⟧_n = u · ofData (m[ζ]) in B(F)/nB(F), for n prime to m and u m ≡ 1 mod n.
- ⟦ζ⟧_n does not depend on u.
- The image of ⟦ζ⟧_n in P(F)/nP(F) is the class of [ζ].

- If [ζ] ∈ B(F), then ⟦ζ⟧_n is the reduction of [ζ].
- ⟦ζ⟧[1/m] = m[ζ] ⊗ m⁽−¹⁾ in the localisation of B(F) at the powers of m (LocalizedModule).
- The image of ⟦ζ⟧[1/m] in P(F) ⊗ Z[1/m] is [ζ] ⊗ 1.

- For p ∤ m, the class m[ζ] ⊗ m⁽−¹⁾ in B(F) ⊗ Z_p.
- The image of ⟦ζ⟧[1/m] in B(F) ⊗ Z/n, for n prime to m, is ⟦ζ⟧_n.
- A field embedding σ sends ⟦ζ⟧ to ⟦σζ⟧ in each of the three versions.

The source locators for these statements are CGZ, arXiv v3 (2021), §6, final circular-unit paragraph, p33; Weibel, K-book, Definition VI.5.1 (PDF p. 495); CGZ, arXiv v3 (2021), §1.2, equation (14), p. 5.

**Checks.**

- For δ:ℤ→ℤ/2 reduction, x=1,m=2,R=ℤ/5 and u=2, the image in ℤ⊗ℤ/5 is 1⊗1 and the defining tensor in B⊗ℤ/5 is (2,h)⊗3.
- For δ:ℤ→ℤ/2 reduction, x=1,R=ℤ/5, use 2 as generator of ker δ=2ℤ. The annihilator 2 gives coordinate 1·3=3 and annihilator 4 gives coordinate 2·4=8=3, so the classes agree.
- For δ:ℤ→ℤ/2 reduction and R=ℤ/2, there is a nonzero tensor in (ker δ)⊗R whose image in ℤ⊗R is zero. Thus projection to the raw tensor does not characterize an arbitrary class and 2 cannot be used as a unit denominator in this R.
- Over Q, ζ = −1, m = 2, n = 3, u = 2: 2[−1] = ⟨−1⟩ ∈ B(Q) and ⟦−1⟧_3 = 2⟨−1⟩ = 0 in B(Q)/3B(Q).
- Over Q(ζ_12), where [ω] ∈ B(F), ⟦ω⟧_5 is the reduction of [ω].
- Over Q(√−3), ⟦ω⟧_5 is defined but is not the reduction of an element [ω] of B(F), because ∂[ω] = (−1) ∧ (−1) ≠ 0.
- m · ⟦ζ⟧[1/m] equals the image of ofData (m[ζ]) in the localisation of B(F) at the powers of m.
- The choices u and u + n give the same ⟦ζ⟧_n.

*Needs:* §3.4, §3.5, §6.2, §6.3; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.5 Suslin fibres and finite bar witnesses

For an infinite field F write the imported exact sequence as 0→T(F) --i→ K₃^ind(F) --q→ B(F)→0, with T(F) the enhanced Tor term in Layer 4. For β∈B(F), define SuslinLift(q,β)={k∈K₃^ind(F) | q(k)=β}. It is a nonempty fibre; T acts freely and transitively by k↦k+i(t). This is a torsor of witnesses, without a distinguished origin. For the generic API, q:K→B and i:T→K are homomorphisms of abelian groups, q surjective, i injective, and im i=ker q. The fibre definition itself needs only q and β.

Here F infinite for the source cited here; the separately justified finite-field comparisons are reused in their own ranges. The torsor statements use exactness, including the enhanced two-primary extension, not ordinary Tor or a chosen direct sum decomposition.

- The fibre subtype of q at β.
- Given k and q(k)=β, produce a witness.
- Every witness has q(value)=β.

- Two witnesses are equal iff their underlying K-elements are equal.
- Surjectivity of q provides a noncomputable witness for each β; no additivity or naturality of choose is asserted.
- For t∈T and q∘i=0, translate k by i(t) within the same fibre.

- Translation by 0 is the identity and successive translations by t and s equal translation by s+t.
- When i is injective and im i=ker q, for witnesses a,b there is a unique t∈T with b.value=a.value+i(t).
- For f:K→K′,g:B→B′ with q′f=gq, map a witness above β to the witness with representative f(k) above g(β).

- The fibre maps respect identity maps and composition of commuting squares.

Let F be infinite, G=St(F) the imported stable Steinberg group, A the trivial integral representation, and ψ:H₃(G,ℤ)→B(F) the composite H₃(St(F),ℤ)≅K₃(F)→K₃^ind(F)→B(F). For β∈B(F), define BarLiftCertificate(ψ,β)={z∈Z₃(G,ℤ) | ψ(π(z))=β}. Here Z₃ and π are Mathlib’s cycles and their projection to homology. The underlying chain is a finitely supported integral function on triples (equivalently Fin 3→G), with bar boundary [g|h|k]↦[h|k]−[gh|k]+[g|hk]−[g|h]. Its data are a finite chain, proof its boundary vanishes, and proof its homology image is β. This does not include an algorithm producing a chain from a five-term certificate.

Here, the field-specific ψ and its surjectivity come from Layers 1 and 4. The witness type itself is defined for any group G and supplied ψ to any abelian B. Use the unnormalized inhomogeneous bar complex with trivial integral coefficients. A proof that a pre-Bloch symbol combination has boundary zero and a bar cycle are different kinds of certificate.

- The subtype of actual degree-three cycles z with ψπ(z)=β.
- Include the witness cycle into Mathlib’s finite-support chain module.
- The differential of chain(c) is zero.

- The homology representative is π(cycle(c)) in the imported H₃.
- ψ(homology(c))=β.
- Given z∈Z₃ and ψπ(z)=β, construct the witness; the standard cyclesMk constructor accepts a finite chain and its zero-boundary proof.

- Given a finite chain z∈C₃, a proof d₃z=0 and a proof ψπ(cyclesMk(z))=β, construct the witness using Mathlib’s cyclesMk with indices 3,2. No chain synthesis is asserted.
- The chain projection of ofChain(z,h_cycle,h_target) equals z, including its finite support; the constructor does not quotient chains by boundaries.
- Witnesses are equal iff their underlying cycles are equal, equivalently iff their chains are equal.

- For w∈C₄, replacing z by z+d₄w is a witness above the same β and has the same homology representative.
- If ψ is surjective, classical choice and the surjectivity of π provide a witness over every β. This API has no executable or functorial-choice guarantee.
- A map of cycle modules compatible with ψπ maps witnesses over β to witnesses over the image of β; the maps induced by group/field maps are those from Layer 1.

- Maps of witness fibres respect identity and composition.

Let F be an infinite field and β an element of B(F) produced by §6.2. Then there is a class z ∈ H_3(GL_3(F), Z) with ψ(z) = β, and a class k ∈ K_3(F) ≅ H_3(St(F), Z), represented by a bar 3-cycle of the stable Steinberg group, whose image under K_3(F) → K_3^ind(F) → B(F) is β. The class z is determined up to the image of H_3(M_2, Z) ⊕ H_3(T_3, Z), and k up to the kernel of K_3(F) → B(F), which is the inverse image of T̃(F) under K₃(F)→K₃^ind(F), and fits into 0→K₃ᴹ(F)→ker(K₃(F)→B(F))→T̃(F)→0; a five-term certificate relating two inputs changes the lift only within this ambiguity. The assertion is existence of a finite bar representative with this exact kernel ambiguity.

Here F is an infinite field, as in §4.14 and §4.8.

The finite-chain existence theorem uses surjectivity of the specified homology map and of the cycles projection to give a witness. The latter surjectivity is a quotient property, so it neither chooses a natural lift nor supplies a chain-search algorithm. The boundary checks give the empty nonzero fibre for a trivial group and its nonzero chain [1|1|1] above zero; the reduction ℤ/24→ℤ/6 has no additive section.

The source locators for these statements are Weibel, K-book VI, Theorem VI.5.2, p23; Weibel, K-book VI, VI.5.12, p29, together with the Layer 1 homological model; Hutchinson 2024, §2.1, bar resolution and its differential, p2; Weibel, K-book, Proposition VI.5.12 (PDF p. 502); Weibel, K-book, Remark VI.5.12.1 (PDF p. 502); Weibel, K-book, Lemma VI.5.6, proof (PDF p. 498).

**Checks.**

- For q:ℤ/24→ℤ/6 reduction, the fibre over 1 has cardinality 4 and underlying representatives 1,7,13,19.
- For β=0 and q:K→B, the underlying representatives are exactly Mathlib’s additive kernel q.ker. For ℤ/24→ℤ/6 they are 0,6,12,18.
- The reduction ℤ/24→ℤ/6 has no additive section: the four possible values 1,7,13,19 of s(1) have sixfold multiples 6,18,6,18 modulo 24, whereas additivity would require 0.
- For the trivial group and any ψ:H₃(1,ℤ)→B, no witness exists over β≠0, because H₃(1,ℤ)=0.
- For the trivial group, the single chain [1|1|1] with coefficient 1 is a cycle representing zero homology. It is a witness above 0 distinct as a finite chain from the zero witness. Thus equality of homology must not be used as extensionality of witnesses.
- For any group G and g≠1, the single chain [g|1|1] with coefficient 1 is not the chain of any witness, over any β. Its boundary is [1|1]−[g|1]≠0. This catches a constructor that omits the cycle equation.

*Needs:* §1.2, §1.3, §2.1, §4.8, §4.14, §4.20, §6.1, §6.2; Layers 1–5; tensor products, group quotients and the stated finite Chern contracts.

### 6.6 Integral, rational and finite quotients

First prove finite-to-infinite compatibility. For a finite field F with |F|≥4, an infinite field E and an embedding f:F→E, require B(f)∘b_F=suslin_E∘q_E∘K₃(f) as maps K₃(F)→B(E). Compare the refined finite edge of §5.4, after forgetting square classes, with the rank-two edge of §4.12 under SL₂(F)→GL₂(E). Use augmentation-preserving bar comparisons and the cross-ratio cr(0,∞,1,x)=x from §3.2. The comparison identifies the actual right arrows; it uses neither the combined sequence nor finite-field Bloch rigidity as an input (Hutchinson 2013, §§4,7, especially Theorem 4.3 and Corollary 7.5, pp.19,35; Weibel VI.5.6–5.8, pp.498–499).

**Checks.**

- For 𝔽₄→𝔽₄(t), the quadruple (0,∞,1,ω) has cross-ratio ω on both sides; after descending cycles the comparison carries the order-five Bloch image to the same symbol class.
- In 𝔽₄→𝔽₄(t)→𝔽₄(t)(s), both successive transport and direct transport send [ω] to [ω], of order five; [ω²] goes to 4[ω] along both paths. The zero map fails this comparison on the nonzero cycle.
- The opposite cross-ratio normalization would send ω to ω² over 𝔽₄; in P(𝔽₄)=ℤ/5 these classes differ, since [ω²]=4[ω] and [ω]≠0. Comparing orders alone cannot prove this square.

For |F|≥4, use this compatibility, the infinite-field theorem and the separate finite-field theorem to obtain the natural integral sequence 0→T̃(F)→K₃^ind(F)→B(F)→0. Its left term is enhanced Tor, with an abstract root-group model but weight-two naturality. Over ℚ the sequence is 0→ℤ/4→ℤ/24→ℤ/6→0 and does not split. For the published CGZ group use the surjection κ_new:B(F)→B_new(F), whose kernel is B∩H and is killed by two. For the older exterior convention κ_old is the composite B→B_new↪B_old and may fail to be either injective or surjective. Replacing B by one of these groups integrally changes the sequence; there is no universal replacement of its enhanced-Tor kernel by ordinary Tor or by an untwisted root inclusion.

Here F is a field with at least four elements.

With this natural sequence the rigidity B(F)≃B(F(t)) of §4.21 extends to finite F with |F|≥4: K₃^ind(F)→K₃^ind(F(t)) is an isomorphism by §4.21 and T̃(F)→T̃(F(t)) is an isomorphism because µ(F(t))=µ(F).

For |F|≥4, tensoring the integral Suslin sequence with ℚ gives the canonical isomorphism K₃^ind(F)⊗ℚ≃B(F)⊗ℚ. Both κ_new and κ_old become isomorphisms after inverting two and hence over ℚ. For number fields, the Milnor image is finite, so K₃(F)⊗ℚ→K₃^ind(F)⊗ℚ is also an isomorphism, of dimension r₂. For arbitrary fields one must first take the indecomposable quotient; no rational vanishing of K₃ᴹ(F) is assumed.

Let |F|≥4 and n≥1. The snake sequence for multiplication by n is exact: 0→T̃(F)[n]→K₃^ind(F)[n]→B(F)[n]→T̃(F)/n→K₃^ind(F)/n→B(F)/n→0. In particular the last map is onto, with kernel the image of T̃(F)/n. If n is odd and μ(F)⊗ℤ/n=0, that kernel vanishes, giving an isomorphism. For odd n, κ_new and κ_old each give isomorphisms on tensor quotients by n. For a number field, K₃(F)/n→K₃^ind(F)/n is an isomorphism at odd n, since the Milnor image has exponent two. Thus for a number field F and odd n, if F contains no primitive p-th root for each prime p|n, K₃(F)/n≃B(F)/n≃B_new(F)/n≃B_old(F)/n. These are induced maps, not chosen cyclic identifications. They require the root hypothesis; no such identification is asserted for even n.

Here F is a field with at least four elements; n is a positive integer. For the isomorphisms: n odd and µ(F) ⊗ Z/n = 0; for a number field, F contains no primitive p-th root of unity for p | n.

The source locators for these statements are Weibel, K-book, Theorem VI.5.2 (PDF p. 495); Weibel, K-book, Remark VI.5.2.1 (PDF p. 496); CGZ, arXiv v3 (2021), Definition 1.1 and its remarks, p. 2; CGZ, arXiv v3 (2021), §2.5, proof of Theorem 2.11, p. 15; CGZ, arXiv v3 (2021), Lemma 4.4 and its proof, pp. 24-25.

*Needs:* §2.1, §2.3, §2.5, §3.2, §3.13, §4.1, §4.12, §4.19, §4.20, the K₃^ind assertion of §4.21, and §§5.3–5.5, §5.7; tensor products and group quotients. The mixed comparison precedes the finite-field Bloch rigidity consequence of §4.21.

### 6.7 Genuine finite-coefficient comparison

Construct finiteChernIndEquiv for every field E and integer n≥2 invertible in E: the second Chern map induces K₃(E;ℤ/n)^ind≃H¹(E,μ_n^⊗2), where the superscript denotes the quotient by the image of K₃ᴹ(E)/n under the integral comparison followed by the coefficient map. Require its evaluation on representatives and naturality under field embeddings with the same invertible n. The n=1 groups are zero. Degree-three additivity applies at every invertible n, including even n; the degree-two exception does not restrict this theorem. The map is the degree-three second Chern operation `earlyChern 2 1` of KTheoryFiniteLocalFields §1.8; the isomorphism is a target here, following Levine, Theorem 4.12, pp.335–336, as restated in Hutchinson 2024, Theorem 2.10, p.4. Levine reduces to prime coefficients and a field containing the roots of unity, then uses the relative-K₃/Chern ladder and Theorem 4.11 for the degree-two relative term; the general coefficient theorem precedes the number-field specialization. For a number field and odd n, Bass–Tate gives K₃ᴹ(E)/n=0, so this is an isomorphism on the full finite-coefficient group, even when μ_n is not contained in E.

The finite-coefficient group is genuinely larger than the ordinary quotient: the coefficient sequence 0→K₃(E)/n→K₃(E;ℤ/n)→K₂(E)[n]→0 has a nonzero right-hand term in general. For E=ℚ and n=5, K₃(ℚ)/5=0, while the symbol {2,−31} lies in K₂(ℚ)[5]: five times it is {32,−31}=0 by the Steinberg relation, and its tame residue at 31 is 2∈𝔽₃₁ˣ, of exact order five. Hence K₃(ℚ;ℤ/5)≅K₂(ℚ)[5]≠0, and finiteChernIndEquiv identifies it with H¹(ℚ,μ₅^⊗2). For this test use the tame-symbol convention ∂ᵥ{u,π}=ū, which fixes the order of the two entries.

The source locators for these statements are Levine 1989, Theorems 4.11–4.12, pp.334–336; Hutchinson 2024, §2.3, Theorem 2.10 and the universal coefficient sequence, p.4.

**Checks.**

- At n=1 the coefficient and étale groups vanish; no primitive-root choice carries extra data.
- For a number field and odd n, the real-sign Milnor group is killed by tensoring with ℤ/n, so the quotient map to the indecomposable coefficient group is an isomorphism.
- At an even n for a field with real places, this argument does not erase the Milnor image; the general comparison retains its indecomposable domain.
- For E=ℚ and n=5 the domain is K₂(ℚ)[5]≠0 although K₃(ℚ)/5=0; replacing the finite-coefficient group by the ordinary quotient would give the zero group.

**Chern additivity check.** For X=Spec ℝ and m=2, the Bott generator β of K₂(ℝ;ℤ/2)=ℤ/4 satisfies c₂(2β)=1 in H²(ℝ,μ₂^⊗2)=ℤ/2, whereas 2c₂(β)=0. The correction is nonzero here; it does not apply in degree three (Weibel, Étale Chern classes at the prime 2, Example 2.6.2, pp.10–11).

*Needs:* §2.2, §2.3, §6.6; Layers 1–5; KTheoryFiniteLocalFields §1.8.

### Examples

Over ℚ the single five-term relation at (2,3) has arguments 2,3,3/2,3/4,1/2. A boundary certificate accepts [2]+[−1] and rejects [2]. For a primitive sixth root ω in ℚ(√−3), [ω] fails the integral boundary test while 2[ω] passes it. Dividing a root multiple over ℤ/5 is valid only with a unit denominator. The fibre of ℤ/24→ℤ/6 over 1 is {1,7,13,19}; choosing one representative cannot define an additive section. Over ℚ the finite-coefficient group K₃(ℚ;ℤ/5) is nonzero although K₃(ℚ)/5=0.

### Dependencies

Use Layers 1–5 and Mathlib finite supports, kernels, tensor maps and coefficient rings, and KTheoryFiniteLocalFields §1.8 for the finite Chern map in §6.7. The K₂[n] extension of the finite-coefficient group is distinct from the integral Suslin sequence and the ordinary tensor quotient. No regulator or Habiro comparison is used.

## Downstream consumers

ColemanIntegration §L2.Fb takes the integral carriers and their universal properties from §§3.1, 3.3–3.5. Its preBlochMap, antisymmetricMap and blochMap are the field maps of these sections; its tensorClass is the pure-tensor quotient map and its boundary is ∂[x]=x∧(1−x). The symbol-preserving isomorphism of §3.4 transports its reduced free-symbol calculations and scalar five-term evaluation to this same P(F), with the commuting boundary square restricting the transport to B(F). Its p-adic evaluation and branch descent follow these inputs. PolylogarithmFunctions §§5.8 and 6.1–6.5 supplies the analytic cross-ratio and Rogers inputs to this roadmap before those Coleman constructions.

Polylogarithms Layer 2 consumes the normalized K₃-to-Bloch map for its real regulator comparison, and its Layer 4 consumes the rational-curve presentation of §4.21 and the specialization lemma of §3.12; the analytic scalars belong there. PadicHodgeRegulators and HabiroNumberFields are anticipated consumers of the integral maps, finite-field conventions and finite-coefficient comparison; no section-specific contract is asserted for them. EllipticKTheory is an anticipated consumer of the indecomposable quotient (§2.1), the two-torsion kernel bound (§2.2), the rational rank (§2.5) and the Suslin sequence (§4.20). The all-curve Goncharov kernel does not disappear through one of these consumer comparisons.

## References

- Charles A. Weibel, [*The K-book*, combined author draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1 and VI.4–VI.5. “PDF p.” for this volume counts from its first page. Separate author chapters [III](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf), [IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), [V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) and [VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) have their own chapter pagination. The locators distinguish those editions.
- A. A. Suslin, [*Homology of GLₙ, characteristic classes and Milnor K-theory*](https://www.mathnet.ru/eng/tm2280), Trudy Mat. Inst. Steklov. 165 (1984), 188–204, especially §§1–3 and Theorem 3.4. Page numbers refer to the Russian version of record.
- A. A. Suslin, [*K₃ of a field, and the Bloch group*](https://www.maths.dur.ac.uk/users/herbert.gangl/Suslin_K3_Bloch_group.pdf), Proc. Steklov Inst. Math. 183 (1991), 217–239, §§1–5, especially Lemmas 4.1–4.4 and Sublemma 4.4.1, pp.227–229.
- Behrooz Mirzaii, [*Bloch–Wigner theorem over rings with many units*, arXiv:0807.2039v2](https://arxiv.org/abs/0807.2039v2), Lemma 4.1, pp.8–10, for the explicit rank-two bar lift. Only that chain computation is used; stronger torus-kernel claims elsewhere in the paper are not inputs.
- Kevin Hutchinson, [*A Bloch–Wigner complex for SL₂*, arXiv:1107.0264v2](https://arxiv.org/abs/1107.0264v2), §§3–4 and 6–7. All locators to this work use the preprint pagination, not the journal pagination.
- Marc Levine, [*The indecomposable K₃ of fields*](https://numdam.org/item/10.24033/asens.1585.pdf), Ann. Sci. ENS 22 (1989), 255–344, Theorems 4.11–4.12, pp.334–336.
- Kevin Hutchinson, [*The Chern class for K₃ and the cyclic quantum dilogarithm*, arXiv:2104.14413v4 (2024)](https://arxiv.org/abs/2104.14413v4), §2.3, Theorem 2.10, p.4.
- Frank Calegari, Stavros Garoufalidis and Don Zagier, [*Bloch groups, algebraic K-theory, units, and Nahm’s conjecture*, arXiv:1712.04887v3 (2021)](https://arxiv.org/abs/1712.04887v3), Definitions 1.1 and 2.1 and §6. This is the older exterior presentation, read with the explicit intersection repair in §3.13. It differs from the [published author copy](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), Ann. Sci. ENS 56 (2023), 383–426, Definition 2.1 and Lemma 2.2, p.391; §4.2–4.3, pp406–407; §6, pp414–416. Published locators use printed journal pages.
- Alexander B. Goncharov, [*Geometry of configurations, polylogarithms, and motivic cohomology*](https://sasha-goncharov.github.io/Advances1995.pdf), Adv. Math. 114 (1995), 197–318, §§1.8–1.9 and 2.3. The all-curve relation-equality assertion is conditional, as specified at Conjecture 1.20, p.225.
- Spencer Bloch, *Higher Regulators, Algebraic K-Theory, and Zeta Functions of Elliptic Curves*, CRM Monograph Series 11 (2000), Lecture 6, for the name of the full-tensor convention of §§3.9–3.10. The explicit kernel, obstruction and six-torsion comparisons here are algebraic consequences of the displayed definitions and five-term relations; no theorem of the monograph is used.
- Don Zagier, [*The Dilogarithm Function*](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), in *Frontiers in Number Theory, Physics, and Geometry II* (2007), Appendix II.1.A, pp23–24, for the Rogers normalization.
- Moritz C. Kerz, [*The complex of words and Nakaoka stability*, arXiv:math/0410261v1](https://arxiv.org/abs/math/0410261v1), Theorems 1–2, pp.1–3.
- Allen Hatcher, [*Algebraic Topology*](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf), §4.2, Examples 4.51–4.52, pp380–381, and Exercise 37, p392, for the Hopf and Whitehead input at its topological owner.
- David Marker, [*Introduction to Model Theory*](https://library.slmath.org/books/Book39/files/marker.pdf), in *Model Theory, Algebra, and Geometry*, MSRI Publications 39 (2000), Theorem 3.5 and Corollary 3.6, pp.24–25, and Proposition 4.1, p.25, for real-closed-field elementary transfer.
- Charles A. Weibel, [*Étale Chern classes at the prime 2*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chernclass.pdf), author manuscript of the 1993 paper, Proposition 2.4 and Example 2.6.2, pp.10–11.
