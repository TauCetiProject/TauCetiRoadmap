# Roadmap: general algebraic K-theory, part II: telescopic purity and redshift

**Summary.** Build the enhanced comparisons, restricted truncating invariants and chromatic arguments needed to prove two-height purity for algebraic K-theory of every associative ring spectrum. GeneralAlgebraicKTheory stops at exact, Waldhausen, Frobenius and differential graded models; RefinedTraceMethods supplies K on arbitrary small stable ∞-categories. This continuation proves Theorem A, the CMNN finite-sphere vanishing theorem and purity in that order, then establishes redshift, rational-transfer Galois descent, the height-one excision and homotopy-invariance theorems, high-height continuity and cyclic assembly. The coefficient examples include nonconnective rings, every prime, iterated K-theory, Morava K-theory, Brown–Peterson truncations, real and modular K-theory, and spherical Thom rings.

## Scope and ownership

This roadmap owns the additive and stable-envelope comparisons, acyclic-domain truncation and excision, continuous Witt operations on all NK degrees, the K-theoretic compact-kernel argument, telescopic purity and its consequences. Its chromatic groundwork extends the supplied p-local theory to the global convention T(0)=S[1/p], and supplies periodic-space detection, telescopic Tate vanishing, Hahn acyclicity and the Tate-height converse. It does not identify telescopic and Morava localizations on arbitrary spectra. Layer 4 §§4.1–4.34 and Layer 6’s Lubin–Tate covers (§6.1a) and chromatic field maps (§6.2) are owned here; ChromaticHomotopyTheory is a downstream consumer of these extensions, retaining its other chromatic developments. StableHomotopyKTheoryPartII §§4.4–4.5 own the general degree-zero power operation and transfer ideal used here.

GeneralAlgebraicKTheory §§3.12–3.14, Layers 5–7, §§9.8–9.17, Layers 10–12 and §13.6 own classical plus/Q/S comparisons, products, transfers, Nil categories, Bass contraction, negative K-theory and enhanced-model invariance. RefinedTraceMethods §4.9 already states exact sequences in Cat∞perf, connective stable S-theory, the nonconnective suspension construction, K(Perf(A)) and global truncating invariants; §4.18 states the correction algebra and global truncating excision, while §4.10 supplies coherent multiplicative K. Their constructions, APIs and boundary tests are supplier obligations. AInfCohomology §AI.7.2 owns the circle Tate construction, Tate-orbit lemma and bounded-below residual comparison; RefinedTraceMethods §2.3 owns the bounded-above Tate fixpoint lemma. The restricted acyclic-domain predicates and consequences here add a condition on every auxiliary ring, rather than another global definition. The compact-kernel target adds its K-theory fiber sequence to EnhancedDerivedSheaves E5:presentability.3's categorical quotient. EnhancedDerivedSheaves E5:descent owns commutative finite-index Amitsur module descent; §8.2 allows associative algebras and proves the rational-unit criterion for ε-nilpotent towers.

BordismFormalGroups F1–F3 and F6.1–F6.4 already state formal-group algebra, complex orientations, MU/BP/Morava coefficients, homological localization, nilpotence, type, periodicity, p-local finite localization and Hopkins–Ravenel smashing. GeneralizedCohomology G2, G4.5 and G5.1–5.4 supply spectra, orientations, finite duality, Thom diagrams and KU/KO models. TopologicalKTheory T4 and T7 own their geometric Bott and coefficient comparisons, using HomotopySpheres §4B's real Bott theorem. The new variants here are the all-spectra finite-localization extension, the truncated-theory Bousfield classes, and their chromatic comparison consequences.

EllipticCohomology E1–E4 and E6 state the generalized elliptic moduli, the height-one and height-two Morava realizations and automorphism actions, the sheaf Otop, tmf/Tmf/TMF, discriminant inversion and level sheaves. Their all-height realization and spectral affineness extensions are exact supplier contracts below. The modular chromatic input comparison and its K-theory applications here use those same spectra. HomotopySpheres §3B owns the James word filtration, connected James equivalence and James–Hopf map; the reduced stable splitting is requested there. EllipticCohomology E5 owns units and coherent Thom orientation data; the relative module-colimit interface is requested there. The characteristic-p Thom theorem and its filtered families here are specializations of that shared construction.

QWittVectors §§1.1–1.6 owns big Witt vectors, including arbitrary truncation sets, their topology and operations; HabiroRings consumes that theory and is not its owner. KTheoryLowDegrees §§1.1–1.3 owns projective K₀, and GeneralAlgebraicKTheory §§13.8a–13.8c owns the ordinary finite-field Brauer–Quillen theorem. KTheoryFiniteLocalFields §§1.1–1.6 supplies its normalized coefficient and completion refinements, and its §0.4 owns the odd-primary height-one functor `heightOneFromZeroSpace` on the pointed homotopy category; §4.11 here is the coherent Bousfield–Kuhn functor for every prime and every height n≥1, which agrees with that functor at n=1 and p odd. SchemeKTheoryOperations Layers 1–5 owns enhanced scheme K-theory, descent geometry and Bass comparisons; its KH and Karoubi–Villamayor extension is requested explicitly. MotivicEtaleKTheory §7.2 concerns a Deligne regulator comparison, not finite-coefficient étale K-descent, so the latter interface is assigned to KTheoryFiniteLocalFields §6.5a.

## Conventions

Fix a rational prime p; none of the conclusions excludes p=2 or p=3. Rings and ring maps are unital, including the zero ring. E₁ means associative and E∞ means coherently commutative. Spectral tensors, fibers, cofibers, quotients and (co)limits are derived. Perf(A) consists of right perfect A-modules, the compact objects of Mod_A. The ordinary finite-projective exact structure uses left modules, so the comparison uses the opposite ring. Extension Perf(A)→Perf(B) along A→B requires no perfectness of B over A; restriction K(B)→K(A) requires B perfect over A. For the identity extension R→R, restriction sends [R²] to 2[R]. For a finite free extension B/R of rank d, transfer sends [B] to d[R], fixing its direction.

Use homological grading: Σ raises the homotopy degree. A spectrum is d-connective if πᵢ vanishes for i<d; a map is d-connective if its fiber is d-connective. A space map is m-connective when each fiber is (m−1)-connected. Thus S¹→* has fiber S¹ and is 1-connective; ΣHℤ→0 has fiber ΣHℤ and is 1-connective. Under a cohomological complex model, ΣHk lies in degree −1. The cofiber sequence k→0→Σk has K₀ relation 0=[k]+[Σk], hence [Σk]=−[k]. Keep this same sign in the heart, localization and transfer comparisons.

Write Hom for the full stable mapping spectrum and hom=τ≥0Hom for the connective additive mapping spectrum. For X=ΣHk and Y=Hk, π₋₁Hom(X,Y)=k while π₋₁hom(X,Y)=0. K means nonconnective K, Kconn its connective version and Kadd direct-sum group completion. The connected positive K-space is Ω∞τ≥1K; for a field K₀=ℤ is not part of that connected space. Universes are fixed before forming small categories, presheaves, Ind or κ-compact objects. A flasque enlargement uses sufficiently large uncountable regular κ in ordinary Ind; κ=ω does not supply the countable sums for the swindle.

For n≥1 use the supplied telescope T(n); put T(0)=S[1/p] and K(0)=Hℚ. Define Lₙ^(p,f)=L_(T(0)∨⋯∨T(n)), Lₙ^f=L_(Hℚ∨T(1)∨⋯∨T(n)) and Lₙ=L_(K(0)∨⋯∨K(n)). The two finite towers agree on p-local spectra. At p=2 the spectrum H𝔽₃ survives T(0) and is killed by Hℚ; on Hℚ both bottom functors act as identity. Use L_(zero spectrum) for the zero reflector, reserving L₀ for rationalization. Height is the first vanishing threshold minus one, with values −1,0,1,…,∞. Redshift at height zero requires a nonzero rational part; p-local nonnegative-height input has this property. Empty support gives height −1, while ∞+1=∞. No theorem of purity at Morava height n≥2 is inferred from telescopic purity.

Nil polynomial variables are central. NKⱼ(A) is the kernel of evaluation at x=0 in every integer degree. Write a(t)=χ(a) for the big Witt characteristic series ∏_(d≥1)(1−a_dt^d), with constant coefficient 1 and ghosts given by −tχ′/χ, in the convention in which its action on [1−νx] is [a(νx)]. For ν²=0 and a(t)=1−rt this gives [1−rνx], with value 1 at x=0. Setting x=1 would leave the NK kernel and is not this action. Division by χ means multiplication by its formal-power-series inverse, which exists because its constant coefficient is the unit 1. Amitsur cobar cofaces insert the unit, and codegeneracies multiply adjacent factors of the specified algebra. Homotopy-fixed-point comparison maps retain their order: L K(A)→L(K(B)^hG)→(L K(B))^hG. The second equivalence is proved by a uniform tower argument.

## Exact supplier contracts

### From Mathlib

Use `SSet.Quasicategory` in `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean` for inner-horn filling, `CategoryTheory.Idempotents.Karoubi` in `Mathlib/CategoryTheory/Idempotents/Karoubi.lean` for ordinary idempotent completion, and `CategoryTheory.Triangulated.TStructure` with `CategoryTheory.Triangulated.TStructure.bounded` in `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` for t-structures on homotopy categories. The bounded predicate has object-dependent upper and lower bounds; it does not choose one common amplitude. Quasicategory supplies no stability or K-spectrum. Karoubi objects have an endomorphism whose square is itself, without automatically carrying an enhanced Verdier quotient. Use native rings, modules, matrices, polynomial rings, formal groups and integer grading for ordinary comparisons.

### From Tau Ceti

Use `TauCeti.ExactStructure` in `TauCeti/CategoryTheory/Exact/ExactStructure.lean`, with the zero-object and binary-biproduct assumptions in its actual signature. Use `TauCeti.finiteProjectiveModulesExactStructure` and `TauCeti.finiteProjectiveModulesExactStructure_eq_split` in `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean`; the induced exact structure on finite projective left modules equals the split one. It is the ordinary comparison input, not a spectral module category. For degree-zero comparisons use `TauCeti.SplitK0` in `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean`, `TauCeti.AbelianK0` in `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean`, and `TauCeti.TriangulatedK0` in `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean`. Their ambient categories carry, respectively, binary biproducts and zero morphisms; an abelian structure; or a preadditive structure with zero object, additive integer shifts and a pretriangulated structure, with essential smallness for the quotient universe. Use `TauCeti.SplitK0.finrankEquiv` in `TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean` for the additive equivalence with ℤ on `FGModuleCat` over a field, retaining its `Small` universe hypothesis; it sends a vector space to its dimension. These ordinary groups do not provide a K-spectrum.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

Consume §§3.12–3.14's positive plus/Q comparison and K₀/K₁ normalization; §§6.9 and 6.19's Gillet–Waldhausen comparison; §§7.1–7.7's products and transfers; §§9.8–9.17's Nil category and positive Fundamental Theorem; §§10.1–10.13's Bass contraction, nonconnective ring spectrum and regular negative vanishing; §§11.15–11.16's localization and exact-model spectra; §13.6's enhancement requirement; and §§13.8a–13.8c's Brauer lift and finite-field groups. On 𝔽_q, K₀=ℤ, and for every r≥1 one has K₂ᵣ=0 and K₂ᵣ₋₁=ℤ/(qʳ−1). At q=2 and r=1 the last group is zero, while at q=3 it has order 2. The value q=1 is excluded because a field has at least two elements; r=0 is excluded from the positive odd-degree formula. These are the finite-field values consumed here.

### From TauCetiRoadmap.StableHomotopyKTheory

Consume Layers 3–4's acyclic plus and group completion, Layer 5's spectrum smash/connectivity/operad comparisons, §§5.18–5.19's delooping recognition, §§6.1–6.3's coherent Waldhausen spectrum, and §§7.1–7.27's Moore coefficients, derived p-completion, filtered spectra and convergence. A mod-m coefficient is a Moore cofiber, not an unproved tensor with an E∞ Hℤ/m-algebra. The relevant plus map carries all local systems pulled back from its target; no plus construction on an arbitrary homotopy fiber is assumed. Space Postnikov towers use §§3.18–3.21 with the twisted local-coefficient clause.

### From TauCetiRoadmap.StableHomotopyKTheoryPartII

Consume §4.4 (Degree-zero power operation) and §4.5 (The transfer ideal for a prime power operation): the natural multiplicative unital operation P_p:π₀R→R⁰(BΣ_p) for every E∞ ring R, its basepoint value x^p, and additivity modulo the Young-subgroup transfer ideal. Restrict along BC_p→BΣ_p; the double-coset formula carries every mixed-summand transfer to a transfer from the trivial subgroup of C_p, giving additivity modulo that transfer ideal. At p=2, res P_p(2)=4, whereas res(P_p(1)+P_p(1))=2.

### From TauCetiRoadmap.EnhancedDerivedSheaves

What EnhancedDerivedSheaves must provide (gap:multiplicative-postnikov): For a connective E₁-ring R and k≥1, supply the E₁-ring structure on τ≤kR natural in R, with E₁ maps R→τ≤kR→τ≤(k−1)R; the derivation of τ≤(k−1)R into the bimodule Σ^(k+1)Hπ_kR whose RefinedTraceMethods §4.14 pullback algebra τ≤(k−1)R×_(τ≤(k−1)R⊕Σ^(k+1)Hπ_kR)τ≤(k−1)R is τ≤kR; and the bound that I⊗_A J is (a+b)-connective for an a-connective right module I and a b-connective left module J over a connective E₁-ring A. The split and derivation-pullback square-zero algebras themselves are RefinedTraceMethods §4.14, and the spectrum-level covers, truncations and the absolute smash bound are GeneralizedCohomology G3 item 8.

Consume E0.4's stable enhancement, E5:abstract.1–4's algebra/module objects, monoidal structures and idempotent completion, E5:presentability.1–3's compact objects, Ind and stable quotients, E0.7's straightening and E3.1's Kan extension comparisons, and E5:presentability.3's coherent finite actions. For the commutative specialization of §8.2 use E5:descent's augmented Amitsur tower with its unit-inserting cofaces and multiplication codegeneracies; the associative ε-nilpotent extension is stated in §8.2. A quotient kernel is a retract closure. A compact-kernel localization gives compacts Idem(D/C), not an uncompleted quotient.

### From TauCetiRoadmap.RefinedTraceMethods

What RefinedTraceMethods must provide (gap:linear-weak-additive-motives): §4.6: For each E∞ ring A and sufficiently large regular κ, supply the stable category Mot_κ(A) and universal functor U_A for weakly additive invariants on κ-compact A-linear perfect categories.

What RefinedTraceMethods must provide (gap:linear-motive-tensor-unit): §4.10: Supply the symmetric monoidal structure on Mot_κ(A) whose unit is the motive of Perf(A), for commutative A and an accessibility cardinal κ as above.

What RefinedTraceMethods must provide (gap:linear-motive-kzero-unit): §4.10: Supply the natural map K₀(C)→π₀Map(U_A(Perf(A)),U_A(C)) for κ-compact A-linear C, sending [A] to the monoidal unit when C=Perf(A).

What RefinedTraceMethods must provide (gap:linear-motive-projection-formula): §4.10: For a map A→B of E∞ rings with B perfect over A, prove that restriction and extension of A-linear perfect-category motives satisfy the tensor projection formula.

What RefinedTraceMethods must provide (gap:tc-z-k1-nonzero): §4.17: Prove L_K(1)TC(ℤ)≠0 for every prime p, including p=2.

What RefinedTraceMethods must provide (gap:tc-z-inverse-p-vanishing): §2.10: Prove TC(ℤ[1/p])^∧p=0 for every prime p.

What RefinedTraceMethods must provide (gap:k1-tc-filtered-colimits): §2.10: Prove that A↦L_K(1)TC(A) preserves filtered colimits of discrete unital rings into K(1)-local spectra.

What RefinedTraceMethods must provide (gap:tc-mod-p-cyclotomic-colimits): §2.10: Prove that TC/p preserves all small colimits of cyclotomic spectra whose underlying spectra are connective.

What RefinedTraceMethods must provide (gap:tc-mod-p-ring-sifted-colimits): §2.10: Prove that A↦TC(A)/p preserves sifted colimits of connective E₁-rings.

What RefinedTraceMethods must provide (gap:thh-all-cyclic-assembly): §2.10: Prove that for every discrete group G and connective E₁-ring R, colim_(G/H∈Or_Cyc(G))THH(R[H])→THH(R[G]) is an equivalence of cyclotomic spectra, with all cyclic subgroups including infinite cyclic ones.

Consume §4.9's concrete connective and nonconnective K, exact sequences and weakly localizing invariants; §4.18's Land–Tamme correction algebra with underlying spectrum A′⊗_A B and its localizing pullback formula; §4.10's coherent multiplicative K; §§2.1–2.5's norms, Tate products and finite-action quotient, including §2.3's bounded-above Tate fixpoint lemma; §§2.7–2.17's THH, cyclotomic TC and genuine/Borel comparison; §§4.11–4.17's trace, stable-K linearization and integral DGM; §4.19's The TC assembly map for C_p, with connective E₁ input, p-completed coefficients and cofiber ΣTHH(R;ℤ_p)_hT_p⊗(C_p,1); and §§4.6 and 4.10's accessible motives and their units. Integral DGM applies to connective rings and a surjective nilpotent-kernel π₀ map; its relative fiber includes rational information. For a correction square with one identity side the correction map is an equivalence. For a zero stable category, both K theories vanish; on bounded free (k×k)-complexes K₀=ℤ maps diagonally into K₀ of its completion, ℤ², so the connective completion comparison requires idempotent completeness. For the §4.19 cofiber, (C_p,1) contributes p−1 summands: one at p=2 and two at p=3. These are the supplied foundational Checks consumed here.

The supplied perfect stable categories and localizing invariants interface guarantees the following (bgt line 1559, §5.1–5.2, Definitions 5.8 and 5.12, pp.775–779; §9.1, pp.806–808; lt line 193, Notation 1.1 and Definition 1.2, manuscript p.5).

- Exactness is equivalent to full faithfulness, a zero composite, and E≃Idem(D/C).

- A localizing invariant carries every exact sequence to a natural cofiber sequence.

- For a split exact sequence C→D→E, F(D)≃F(C)⊕F(E).

- Equivalences of perfect stable categories induce equivalences under F, coherently with composition.

**Checks.**

- C→C→0 with identity first arrow is exact.

- A Verdier quotient by a stable subcategory need not have precisely that subcategory as its kernel before taking its retract closure.

- For a discrete additive category, the homotopy-category idempotent completion agrees with CategoryTheory.Idempotents.Karoubi.

The supplied perfect modules and K-theory of ring spectra interface guarantees the following (bgt line 1352, §4.3, Theorems 4.22–4.23, pp.770–771; §9.1, pp.806–808; lmmt line 610, Notation, p.1015; proof of Proposition 3.6, pp.1023–1024; lt line 366, Lemma 1.10 and proof, manuscript p.9).

- M is perfect exactly when it belongs to the stable retract closure of A.

- A→B yields K(A)→K(B), with identity/composition equivalences from tensor associativity.

- If B is perfect over A, restriction gives K(B)→K(A).

- K(HR) agrees with GeneralAlgebraicKTheory’s nonconnective K-theory of R, naturally in ring maps.

**Checks.**

- Perf(S) is the category of finite spectra; K(S) is its K-theory.

- Perf(0) and K(0) are zero.

- For an ordinary ring R, HR⊕HR corresponds to the rank-two projective module under the comparison.

- For an ordinary ring R, π₀K(HR) is the existing projective K₀(R), with the right/left-opposite convention explicit.

The supplied stable S-construction interface guarantees the following (bgt line 2007, §7.1, pp.788–794; lmmt line 610, Proof of Proposition 3.6, p.1024).

- A filtration determines its compatible subquotients and hence an S_r object.

- S_r(C)≃Fun([r−1],C) for r≥1, naturally in exact functors.

- The three faces of a cofiber sequence X→Y→Z select Z,Y,X in the usual S2 order.

- The S-construction assembles the same connective spectrum as GeneralAlgebraicKTheory’s Waldhausen model.

**Checks.**

- S0(C) is terminal and stable, hence zero.

- An S2 object includes a specified cofiber identification, rather than just an arbitrary composable pair.

- The split sequence X→X⊕Y→Y gives [X⊕Y]=[X]+[Y] in π₀Kconn(C).

The supplied nonconnective K-theory of stable categories interface guarantees the following (bgt line 2664, Definitions 9.1 and 9.6, pp.806–808; Theorems 9.8 and 9.10 with proofs, §§9.2–9.3, pp.808–816).

- τ≥0Knc(C)≃Kconn(C), naturally in exact functors.

- Knc(ΣκC)≃ΣKnc(C).

- Filtered colimits in Cat∞perf are carried to colimits in Sp.

- An exact sequence C→D→E gives Knc(C)→Knc(D)→Knc(E) in all degrees.

**Checks.**

- If C admits an exact endofunctor T with id⊕T≃T, then Knc(C)=0.

- For a field k, π₀Knc(Perf(Hk))=Z and the negative groups vanish by comparison with the parent.

- Localization uses Idem(D/C); replacing it by an arbitrary underived categorical quotient does not give the comparison theorem.

- A flasque stable category has zero Knc, and the suspension quotient deloops it in all integer degrees.

The supplied Land–Tamme replacement algebra interface guarantees the following (lt line 218, Theorem 1.3 and proof, manuscript pp.6–14).

- C→B′ has underlying map A′⊗_A B→B′.

- The underlying (A′,B)-bimodule of C is A′⊗_A B.

- The constructed replacement square is cartesian after any weakly localizing invariant.

- Maps of pullback squares induce the replacement algebra maps coherently.

**Checks.**

- For the identity pullback square on A, C≃A.

- If A′⊗_A B≃B′, the original invariant square is cartesian.

- The construction applies to E₁-rings without an E2 structure on A; an ordinary commutative tensor product cannot be used as its definition.

- If A′⊗_A B→B′ is an equivalence, every such invariant carries the original square to a pullback.

The supplied products and coefficient actions on enhanced K-theory interface guarantees the following (bgt-mult line 1022, Theorem 5.8, Proposition 5.9 and Corollaries 5.10–5.11, manuscript p.23; lmmt line 610, Proof of Proposition 3.6, p.1023; Theorem B discussion, p.1014).

- Connective and nonconnective K carry coherent external pairings K(C)⊗K(D)→K(C⊗D), with their unit and associativity compatibilities.
- For commutative R and an associative R-algebra A, K(A) is a K(R)-module, naturally in R-linear exact functors.
- Restriction along an algebra perfect over its base satisfies the projection formula with extension and the tensor action.

**Checks.**

- For finite projective modules over a discrete commutative ring, the product on K₀ is the existing tensor-product multiplication.

- Over a field, tensoring ranks 2 and 3 gives rank 6, agreeing with 2·3 in K₀.
- For the zero algebra the module K(0) is zero, so every scalar acts by the zero endomorphism.

### From TauCetiRoadmap.AInfCohomology

Consume §AI.7.2's circle norm ΣX_hS¹→X^hS¹, the Tate-orbit lemma for bounded-below C_(p²)-spectra, and the completed circle-Tate comparison (X^tS¹)^∧p≃(X^tC_p)^h(S¹/C_p) for bounded-below X, retaining its residual S¹/C_p action and canonical comparison map. RefinedTraceMethods §2.3 supplies the bounded-above Tate fixpoint lemma (X^hC_p)^t(C_(p²)/C_p)=0 with the induced quotient action. These two bounds are separate hypotheses; the bounded-below circle comparison is not applied to an arbitrary periodic or coconnective spectrum. For the trivial rational spectrum Hℚ every finite C_p Tate spectrum is zero (the norm is multiplication by p on π₀, invertible on ℚ) and so is the p-completed circle Tate spectrum, but the raw circle Tate spectrum is not: π_*(Hℚ^tS¹)=ℚ[t,t⁻¹] with |t|=−2, so π₀=ℚ; only its derived p-completion vanishes, and both sides of the completed comparison are then zero. The sphere's C_p Tate value is S_p^∧.

### From TauCetiRoadmap.BordismFormalGroups

Consume F1–F3's formal groups, orientations and MU/BP/Morava objects and coefficients, F6.1's homological reflector and its cardinal bounds, F6.2's smash/self-map/element nilpotence, F6.3's type classification, periodic self-maps, Bousfield-class independence and the inequality ⟨K(n)⟩≤⟨T(n)⟩, and F6.3–F6.4's p-local finite localization and Hopkins–Ravenel smashing theorem. F6.5 supplies general straightening, pointwise Kan extensions and their composition for arbitrary small quasicategorical bases, coherent stable quotient/Ind theory and K(n)-local finite-action Tate comparisons; the telescopic arbitrary-action theorem here is stronger in its specified local category. The supplied finite kernel is generated by type-(n+1) complexes in p-local spectra. The extension to all spectra here uses finite p-primary generators. F6.3 supplies ⟨BP[v_n⁻¹]⟩=⟨E(n)⟩=⟨K(0)∨⋯∨K(n)⟩, with v₀=p, and the p-local kernel ker(L_n^f)=Ind(C_(n+1)), its smashing property and compact-localization comparison; the BP truncation class with its HF_p summand is proved here.

### From TauCetiRoadmap.GeneralizedCohomology

Consume G2's concrete symmetric spectral model, derived smash and stable mapping objects, G3's integer homotopy and structured connective/Postnikov objects, G4.5's complex orientation, and G5.1–G5.4's finite duality, Thom diagrams, MU and coherent KU/KO. In particular π₀ko=ℤ, π₁ko=π₂ko=ℤ/2, π₃ko=0 and with GeneralizedCohomology's names a (degree 4), b (degree 8) and u for the degree-two complex Bott class, the real coefficients satisfy a²=4b, and complexification gives c(a)=2u² and c(b)=u⁴. The ko→KO map is b-inversion. Comparing the two degree-one sphere factors negates their degree-two class.

### From TauCetiRoadmap.TopologicalKTheory

Consume T4's complex Bott comparison and T7.1's real coefficient and multiplicative comparisons with GeneralizedCohomology G5.4. HomotopySpheres §4B supplies the real Bott loop theorem. In the same names a, b of TopologicalKTheory T7 and u for the complex Bott class, the relation a²=4b and complexification c(a)=2u², c(b)=u⁴ agree with the conventions above; at p=2 the factor 4 is retained.

### From TauCetiRoadmap.HomotopySpheres

What HomotopySpheres must provide (gap:stable-james-splitting): Supply a natural reduced stable equivalence Σ∞ΩΣW≃⋁_(r≥1)Σ∞W^∧r for every connected pointed CW space W, compatible with the word filtration and its smash-power quotients.

Consume §3B's pointed CW James filtration J_rW, quotient J_rW/J_(r−1)W≃W^∧r and connected equivalence J_∞W≃ΩΣW. For W=S² the r-th stage has one cell in each dimension 0,2,…,2r; J₀W=* has zero reduced suspension spectrum. W=S⁰ gives the free monoid ℕ rather than ΩS¹≃ℤ and is excluded from the connected comparison.

### From TauCetiRoadmap.EllipticCohomology

What EllipticCohomology must provide (gap:spectral-units-and-lines): E5: Supply GL₁R as the multiplicative unit components of Ω∞R and BGL₁R as the classifier of R-lines equivalent to R, for every E∞ ring R.

What EllipticCohomology must provide (gap:relative-thom-colimit): E5: For f:X→BGL₁R, supply its Thom R-module as colim_X L_f of the classified R-line local system, naturally in f and commutative R.

What EllipticCohomology must provide (gap:multiplicative-thom-refinement): E5: For n≥1 and an n-fold loop map X→BGL₁R of group-like E_n spaces, prove the Thom colimit has its natural E_n R-algebra structure.

What EllipticCohomology must provide (gap:elliptic-level-three-galois): E6: Supply the faithful GL₂(𝔽₃)-Galois extension TMF[1/3]→TMF(3), with its deck action.

What EllipticCohomology must provide (gap:elliptic-supersingular-at-two): E2: Supply the GL₂(𝔽₃)-equivariant equivalence L_K(2)TMF(3)≃E₂ at p=2 for the supersingular formal group over 𝔽₄, identifying L_K(2)TMF→E₂ with the localized level-three Galois extension.

What EllipticCohomology must provide (gap:elliptic-supersingular-at-three): E2: Supply L_K(2)TMF≃E₂^hG₂₄ at p=3 for the supersingular formal group over 𝔽₉, with G₂₄ the full semilinear automorphism group over 𝔽₃.

What EllipticCohomology must provide (gap:elliptic-spectral-affineness): Prove the symmetric monoidal equivalence QCoh(X,Otop)≃Mod_(Γ(X,Otop)) for X=M̄_ell and M_ell, including colimit preservation of global sections and compatibility with tensoring by every spectrum.

What EllipticCohomology must provide (gap:all-height-morava-realization): Extend the marked Goerss–Hopkins–Miller realization and coherent semilinear automorphism action to every finite height h≥1 over every perfect characteristic-p field, preserving the universal formal-group map and the chosen deformation identification.

Consume E1's generalized elliptic compactification and formal neighborhoods, E2 items 2–3's height-one and height-two Morava E realizations and obstruction machinery, E3's Otop and tmf/Tmf/TMF, E4's surviving Δ²⁴ class of degree 576 and the comparison Tmf[(Δ²⁴)⁻¹]≃TMF, E5's units/Thom orientation data, and E6's level sheaves and deck actions. The full semilinear residue-field actions are retained. Locally π₂ᵣOtop=ωʳ and π₂ᵣ₊₁Otop=0; global Tmf is not required to be even. The all-height and spectral-module refinements are specified below.

### From TauCetiRoadmap.QWittVectors

Consume §1.4a's big Witt power-series comparison γ_∞:(W_(ℕ>0)(R),+)≅U_∞(R), γ_∞((a_d))=∏_(d≥1)(1−a_dt^d)⁻¹, with its coefficient-naturality, restriction (ρ_(N,M)∘γ_N=γ_M∘res), Verschiebung-substitution and Teichmüller (γ_∞(τ(a))=(1−at)⁻¹) laws, together with §1.3's ring structure and inverse-limit topology and §1.4's multiplicative τ. The characteristic series of this roadmap is χ(a)=γ_∞(a)⁻¹, the inverse in R[[t]]; since inversion is an automorphism of the abelian group U_∞(R) commuting with every reduction modulo t^(N+1), χ is again a natural additive isomorphism compatible with the finite restrictions. Transporting §1.3's multiplication along χ gives (1−at)*(1−bt)=1−abt from τ(a)τ(b)=τ(ab), χ(0)=1 and χ(1)=χ(τ(1))=1−t. The ghost identity −tχ′/χ=∑_(n≥1)w_n(a)t^n is proved in §4.36.

Consume §§1.1–1.6's big Witt ring W_S(R) for every divisor-closed positive truncation set S, its ghosts, restrictions, Frobenius, Verschiebung and restriction-limit topology. NK uses S=ℕ>0, with the kernels of initial-segment restriction giving its continuity ideals. The characteristic series χ=γ_∞⁻¹ has χ(0)=1 and χ(1)=1−t; it is the non-inverted series convention of Weibel §1 (weibel line 38, pp.467–468). For a nilpotent ν with ν²=0, the characteristic-series action gives a(νx)=1−a₁νx; its evaluation at x=0 is 1. The empty truncation set gives the zero ring, while W_({1})(R)=R. No p-typical substitution for the big ring is made.

### From TauCetiRoadmap.KTheoryLowDegrees

What KTheoryLowDegrees must provide (gap:nilpotent-kzero): Prove that quotient by any nilpotent two-sided ideal of a unital ring induces an isomorphism on projective K₀ by lifting idempotents and their stable isomorphisms.

Consume §§1.1–1.3's projective K₀ and its quotient-induced comparison, extended as specified below. The nilpotent lifting theorem concerns arbitrary two-sided ideals; no commutativity or regularity of the coefficient ring is added. Only its degree-zero part is imported; the Bass induction to negative degrees is a target here.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

Consume §0.4 (Height-one localization and realization): for p odd, `heightOneLocalize X` is localization at KU∧M(ℤ/p), hence L_(K(1))X, and `heightOneFromZeroSpace` is a functor Φ_p from the pointed homotopy category of spaces to KU/p-local spectra with Φ_p(Ω∞₀X)≃`heightOneLocalize X` natural in spectra X. It is used only for the n=1, p odd comparison of §4.11.

For these spectral étale contracts use D₀=Hℚ and D_n=T(n) for n≥1; this detector leaves the global convention T(0)=S[1/p] intact.

What KTheoryFiniteLocalFields must provide (gap:spectral-etale-descent): §6.5a: With D₀=Hℚ and D_n=T(n) for n≥1, for every E∞ ring R and n≥0 prove that Y↦L_D(n)K(Perf(Y)) is an étale sheaf on the spectral étale site of R (yuan line 310, Theorem 4.3, manuscript p.8).

What KTheoryFiniteLocalFields must provide (gap:spectral-strict-henselian-detection): §6.5a: With D₀=Hℚ and D_n=T(n) for n≥1, for every E∞ ring R and n≥0 with L_D(n)K(R)≠0 prove that there exists a prime ideal 𝔭⊂π₀R for which L_D(n)K(R_𝔭^sh)≠0 (yuan line 326, Lemma 4.5, manuscript pp.8–9).

What KTheoryFiniteLocalFields must provide (gap:suslin-algebraically-closed-comparison): §6.5a: Identify K(L)^∧p with ku^∧p as homotopy ring spectra, for every algebraically closed field L of characteristic zero and every prime p, by a map sending the §1.2 Bott class of a compatible system of p-power roots of unity to the Bott generator; the coefficient groups π_*K(L)^∧p=ℤ_p[β] in nonnegative degrees follow from §6.5a's separably closed case d=0 and §1.6's completion.

Consume §§1.1–1.6's finite-field coefficient, product, Brauer and completion refinements, and §6.5a's periodic étale K-theory and field descent. The algebraically closed characteristic-zero and spectral strict-Henselian variants below extend those interfaces. Discrete-field descent does not by itself give descent for a periodic spectral ring.

**Checks.**

- At p=3, the finite étale C₂-torsor 𝔽₄/𝔽₂ has K(𝔽₂)^∧₂≃Hℤ₂≃K(𝔽₄)^∧₂: the positive groups have odd order and negative groups vanish. Inverting 3 leaves these completions unchanged. The equivariant rank map gives the trivial action on Hℤ₂, and H²(C₂,ℤ₂)=ℤ/2, so the proposed S[1/3]-descent comparison would have π₋₂ values 0 and ℤ/2. This excludes S[1/p] from the height-zero contract.
- With D₀=Hℚ the same torsor has rational K-spectrum Hℚ on both fields; the cochain differentials alternate 0 and 2, giving H²(C₂,ℚ)=ℚ/2ℚ=0 and π₋₂=0 on both sides. Their derived 2-completions are zero.
- For R=H𝔽₂ at n=0, the unique prime has strict henselization H𝔽̄₂ and both rational K₀ groups are ℚ, so detection is nonvacuous. For R=0 the nonvanishing hypothesis fails and no prime is asserted; at n≥1 the detector is exactly T(n).

### From TauCetiRoadmap.SchemeKTheoryOperations

What SchemeKTheoryOperations must provide (gap:kh-simplicial-model): §5.2: Supply the natural homotopy K-spectrum KH(A)=|K(A[Δ•])| for every associative unital discrete ring A, using central polynomial variables and A[Δ^r]=A[x₀,…,x_r]/(Σx_i−1).

What SchemeKTheoryOperations must provide (gap:kh-regular-comparison): §5.2: Prove K(A)→KH(A) is an equivalence for regular noetherian discrete rings A.

What SchemeKTheoryOperations must provide (gap:kv-relative-comparison): §5.6: Supply the convergent relative Karoubi–Villamayor polynomial-resolution spectral sequence from the simplicial relative K-groups to relative KH whenever the relative K-spectra have a uniform lower bound.

What SchemeKTheoryOperations must provide (gap:kh-nilpotent-invariance): §5.6: Prove KH(A)→KH(A/I) is an equivalence for every nilpotent two-sided ideal I of a discrete associative unital ring A, in all integer degrees.

What SchemeKTheoryOperations must provide (gap:localizing-nisnevich-descent): §4.12: Prove that X↦E(Perf(X)) satisfies Nisnevich descent on qcqs schemes for every localizing invariant E, with value zero on the empty scheme.

What SchemeKTheoryOperations must provide (gap:localizing-derived-blowup): §5.7: Prove that every localizing invariant of perfect categories carries the derived blowup square associated to a finite sequence in a commutative ring to a pullback square (Land–Tamme Lemma A.1(iii)).

What SchemeKTheoryOperations must provide (gap:abstract-blowup-noetherian-approximation): §5.7: Prove that an abstract blowup square of qcqs schemes with finitely presented proper modification and finitely presented center is pulled back from such a square of noetherian schemes.

What SchemeKTheoryOperations must provide (gap:abstract-blowup-platification-domination): §5.7: For a proper modification of noetherian schemes that is an isomorphism on a schematically dense open U, prove domination by a blowup with center supported in the complement of U.

Consume §§1.1–2.7's Perf(X), enhanced scheme K and continuity comparisons, §§3.1–3.5's localization, §§4.1–4.3 and 4.12's Nisnevich squares and descent, and §§5.2–5.9's ordinary homotopy invariance, Bass spectrum and regular blowups. The cdh extension below concerns qcqs schemes and finitely presented abstract blowup data. The KH carrier and relative Karoubi–Villamayor comparison are requested as a precise extension, rather than inferred from its regular-ring A¹ theorem.

## How to read the build

Layers 0–3 compare the supplied enhanced K-theory with compact localization, additive/projective and plus models, restricted truncation, stable envelopes and bounded hearts. Layer 4 first supplies the chromatic interfaces its proofs need, then proves acyclic truncation, categorical vanishing and both forms of Theorem A without using purity. Layer 5 obtains the high-height trace comparison before the CMNN induction and proves purity only after that induction. Its base n=2 uses Mitchell; the high-height trace is used only in positive induction steps. Layer 6 combines the independent upper and lower bounds; the lower-bound route may use the preceding purity theorem. Layers 7–10 give the coefficient examples, descent, height-one structure, additive comparison, continuity and assembly. Within a layer, the explicit Needs lists specify mathematical dependencies rather than imposing one proof route. The target signatures in Suggested.lean use only the pinned carriers; all spectral headline theorems require carriers beyond those pins and are named in its module documentation.

## Layer 0: K-theory on supplied stable categories

### 0.1 Thomason–Neeman localization

For an exact colimit-preserving localization q:D→E between compactly generated presentable stable ∞-categories, whose kernel is generated by objects compact in D, apply the supplied compact-quotient theorem to obtain the fiber sequence K(ker(q)^ω)→K(D^ω)→K(E^ω). The categorical exactness and idempotent completion are the supplier input; this target is its nonconnective K-theory consequence.

Throughout this target, q is an exact colimit-preserving localization between compactly generated presentable stable categories. Its kernel is generated by objects compact in the source.

(bgt line 1622, §5.2, Propositions 5.14–5.15, pp.777–779; lmmt line 645, Lemma 3.7 and its proof, pp.1024–1025.)

A proof route is as follows. Use the right-adjoint characterization of a localization and the compact kernel generators to show the quotient remains compactly generated. Identify its compact objects as retracts of images of compacts of D. Apply the enhanced quotient universal property, then the localizing-invariant axiom for Knc.

**Checks.**

- Localization of Mod_A at a smashing spectral localization gives a K-theory fiber sequence once its finite compact kernel generators have been supplied.
- q=id and q:D→0: fiber(KD→KD)=0; fiber(KD→0)=KD.

*Needs:* RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### Examples

For Mod_A→Mod_A the compact K-theory sequence is 0→K(A)→K(A); for Mod_A→0 it is K(A)→K(A)→0. For A=0 both sequences have three zero terms.

### Dependencies

EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction.

## Layer 1: Additive and connective comparisons

### 1.1 General linear groups of connective ring spectra

For connective E₁-ring A, GL_r(A) is the union of the invertible components of Ω∞Mat_r(A), and GL(A)=colim_r GL_r(A) under block sum with 1. The connected positive K-space is BGL(A)+: Ω∞τ≥1K(A)≃BGL(A)+, with plus taken for the elementary subgroup in π₀GL(A). The comparison BGL(A)→BGL(π₀A) induces the positive K-theory truncation comparison after plus; no fiber-sequence or splitting assertion about these three spaces is included.

Throughout this target, A is connective E1; stabilization is under block sum with 1.

(lmmt line 491, Proof of Proposition 3.1, pp.1021–1022; lt line 689, Lemma 2.4 and proof, manuscript pp.16–17; bgt line 3128, Lemma 9.39 and Proposition 9.40, pp.819–820.)

A proof route is as follows. Define invertibility on π₀ and use matrix multiplication on ring spectra. Compare finite free module automorphisms with their core, stabilize, then apply GeneralAlgebraicKTheory’s plus/group-completion theorem to the connective enrichment. Identify the rank-zero positive component and prove naturality under A→π₀A; use the acyclic-map characterization of plus in relative comparisons.

The interface includes:

- π₀GL_r(A)=GL_r(π₀A).
- Block sum with 1 gives compatible GL_r(A)→GL_(r+1)(A).
- BGL(A)+≃Ω∞τ≥1K(A), naturally in connective A.
- For a π₀-isomorphism A→B, the natural square of BGL spaces and their positive K-space plus comparisons transports relative homology estimates through the acyclic plus maps; no identification of the relative K-space with plus applied to an arbitrary fiber is assumed.

**Checks.**

- GL_r(HR) is the ordinary discrete general linear group GL_r(R).
- For square-zero S⊕ΣM, positive homotopy in Mat_r(ΣM) appears in the identity component of GL_r; taking only GL_r(π₀A) loses it.
- π₀GL_1(Hℤ) consists of 1 and −1.
- For HA the construction recovers the classical GL_r(A) and plus map; higher homotopy of A survives before plus.
- A = Hk; r=1; A = Hk⊕ΣHk: π₀GL₁(Hk)=k×; π₁GL₁(Hk⊕ΣHk)=k; positive K-space has one component while K₀(k)=ℤ.

*Needs:* RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; StableHomotopyKTheory Layers 3–7; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16.

### 1.2 Additive ∞-categories and group-completion K-theory

An additive ∞-category C has finite biproducts and grouplike E∞ mapping spaces compatible with composition. Its connective mapping spectrum hom_C(X,Y) has Ω∞ equal to its mapping space. Define Kadd(C) as the connective spectrum corresponding to the group completion of the E∞ space C≃ under ⊕. If C is stable, hom_C(X,Y)=τ≥0Hom_C(X,Y); the full mapping spectrum Hom may have negative homotopy. For connective A, Kadd(Projω(A))≃τ≥0K(A), where Projω(A) consists of retracts of finite sums of A.

Throughout this target, C is small additive; A is connective for the projective comparison.

(lmmt line 610, Definition and discussion preceding Proposition 3.6, p.1023; hs line 3711, Corollary 8.1.3, manuscript pp.70–71.)

A proof route is as follows. Extract additive enrichment from biproducts and group complete the symmetric-monoidal core. Compare finite free/retract module presentations with the plus construction, retaining the K₀ component. For stable C use the mapping-spectrum lifting from EDS and take its connective cover; do not confuse hom and Hom.

The interface includes:

- Additive functors induce Kadd maps preserving identities and composition.
- Maps from Ω∞Kadd(C) into a grouplike E∞ space are additive maps from C≃.
- For stable C, hom_C(X,Y)≃τ≥0Hom_C(X,Y).
- Kadd(Projω(A))≃τ≥0K(A) for connective A.

**Checks.**

- The zero additive category has Kadd=0.
- π₀Kadd(finite-dimensional k-vector spaces)≃Z, not N.
- For stable C and X,Y with negative full Hom groups, hom_C(X,Y) has no negative groups and cannot equal Hom_C(X,Y).
- For a split additive category of finite-dimensional vector spaces, Kadd has π₀=Z, with its generator the one-dimensional space.
- finite-dimensional k spaces; C=0; X=ΣHk,Y=Hk: π₀Kadd=ℤ, [k]=1; Kadd(0)=0; π₋₁Hom(X,Y)=k but π₋₁hom(X,Y)=0.

*Needs:* RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; §1.1 (General linear groups of connective ring spectra); EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; StableHomotopyKTheory Layers 3–7.

### 1.3 Additive and stable Schwede–Shipley comparison

If C is small additive idempotent-complete and generated under finite sums and retracts by X, then C≃Projω(hom_C(X,X)). If C is stable idempotent-complete and thickly generated by X, then C≃Perf(Hom_C(X,X)). The ring acts on Hom(X,−) by precomposition as a right action. Every small additive category is a filtered colimit of its full finite-generator additive/retract closures, after the required idempotent completion.

Throughout this target, C is idempotent-complete. Additive generation is by sums/retracts; stable generation is by shifts/cofibers/retracts.

(lmmt line 610, Proofs of Proposition 3.6, p.1023, and Corollary 4.31, p.1035; bgt line 1352, §4.3, Theorems 4.22–4.23, pp.770–771.)

A proof route is as follows. Apply enriched Yoneda and identify finite sums/retracts of the representable generator with finite projectives. For the stable statement extend Yoneda across finite cofibers and retracts. Index finitely many objects by their direct sum and use filtered unions; Kadd and Knc commute with these filtered colimits.

**Checks.**

- The one-object generator A recovers Projω(A) and Perf(A), with End(A) rather than its opposite because right modules were chosen.
- X=A in right A-modules; sums A⊕A; C=0: End_A(A)=A via left multiplication; Hom(A,A⊕A)=A²; Hom(0,0)=0.

*Needs:* §1.2 (Additive ∞-categories and group-completion K-theory); RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 1.4 Waldhausen A-theory

For a pointed connected space X define A(X)=K(S[ΩX]) with S[ΩX]=Σ∞_+ΩX, multiplication induced by loop concatenation. Compare τ≥0A(X) with the classical connective K-theory of homotopy-finitely dominated retractive spaces over X (retracts of finite relative cell objects) through the stabilization model. A based map X→Y yields A(X)→A(Y); the unit and augmentation give A(*)→A(X)→A(*) with composite identity. The homotopy-finite variant agrees in positive K-groups, but its K₀ need not agree before retract completion.

Throughout this target, X is pointed connected; the retractive-space comparison uses finitely dominated objects and the connective cover.

(lmmt line 919, Corollary 4.14 and preceding definition, p.1030; cdh line 4319, §4.4, compact parametrized spectra and the comparison preceding Lemma 4.4.11 (v3).)

A proof route is as follows. Construct the associative suspension-spectrum loop algebra and identify its perfect modules with compact parametrized spectra over X. Stabilize finitely dominated retractive objects, retaining all retracts of finite relative cells; apply the Waldhausen stabilization and enhanced-model comparisons. Restricting to finite relative cells alone does not justify the K₀ comparison. Identify the two maps from unit/augmentation and check naturality.

The interface includes:

- Based maps of connected spaces give maps of A-theory spectra with coherent identity/composition.
- A(*)→A(X)→A(*) is the identity.
- A(X) agrees with K(Σ∞_+ΩX).
- The finitely dominated retractive-space Waldhausen model has connective K-theory τ≥0A(X), including its K₀ component.

**Checks.**

- A(*)≃K(S).
- A(S1)≃K(S[Z]), where ΩS1 is the discrete group Z up to equivalence.
- For X with a nontrivial reduced projective class group of Z[π1X], the finite-cell model has K₀=Z whereas the finitely dominated model detects K₀(Z[π1X]); a comparison omitting retracts must fail this test.
- A(*)=K(S), and the augmentation splits the constant-space unit map.
- X=*; X=S¹; finite versus finitely dominated objects: S[Ω*]=S; S[ΩS¹]=S[ℤ]; augmentation∘unit=id on K(S).

*Needs:* RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### Examples

For finite-dimensional k-vector spaces, direct-sum group completion gives π₀=ℤ and [k]=1. On Perf(k), [Σk]=−[k] in stable K₀, whereas direct-sum group completion retains a separate generator in each shift. A(*)=K(S), and A(S¹)=K(S[ℤ]) carries the split augmentation.

### Dependencies

EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; StableHomotopyKTheory Layers 3–7.

## Layer 2: Restricted truncation and excision

### 2.1 Truncating invariants on acyclic rings

For a spectrum M and weakly localizing F:Cat∞perf→V, say F is truncating on M-acyclic connective rings if F(R)→F(Hπ₀R) is an equivalence for every connective E₁-ring R with M⊗R=0. Globally truncating means this for all connective R. Use the induced module action of R to check that its ring Postnikov truncations remain M-acyclic. The definition includes no hypothesis that F commutes with limits or filtered colimits.

Throughout this target, F is weakly localizing; M is a spectrum; the rings in the predicate are connective and unital.

(lt line 1173, Definition 3.1, manuscript p.28; lmmt line 555, Definition before Lemma 3.3, p.1022.)

A proof route is as follows. Define the restricted predicate using the concrete truncation ring map. Prove that M-acyclicity of a unital R forces acyclicity of every R-module, in particular Hπ₀R and τ≤kR. Separate the restricted and global predicates so that global excision is applied only after checking its ring inputs.

The interface includes:

- Restricted truncation gives the specified natural equivalence F(R)→F(Hπ₀R).
- Every τ≤kR is M-acyclic when R is a unital M-acyclic connective ring.
- If every N-acyclic ring is M-acyclic, M-restricted truncation implies N-restricted truncation.
- Global truncation is restricted truncation for M=0.

**Checks.**

- The zero invariant is truncating for every M.
- For discrete R the truncation comparison is the identity.
- The definition imposes no interchange of F with a Postnikov inverse limit; the finite-stage reduction must be proved separately.
- A constant zero invariant is globally truncating; K itself is not globally truncating.
- F=0; R=HA; Postnikov stage k=0: 0→0 is equivalence; HA→Hπ₀HA = id; τ≤₀R=Hπ₀R.

*Needs:* RefinedTraceMethods §4.9, Localizing and truncating small-category invariants; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 2.2 Excision and nilinvariance for truncating invariants

Let F be a weakly localizing invariant which is truncating on connective M-acyclic rings. For a connective homotopy pullback of E₁-rings A→B, A′→B′ with π₀A′⊗_(π₀A)π₀B→π₀B′ an isomorphism, assume A, B, A′, B′ and the Land–Tamme correction algebra are M-acyclic. Then F carries the original square to a pullback. For a discrete M-acyclic ring A and nilpotent ideal I, require the auxiliary rings in the finite square-zero proof to be M-acyclic; then F(A)→F(A/I) is an equivalence. This is the restricted-domain extension of the supplied global truncating-excision theorem.

Throughout this target, F is weakly localizing and truncating on connective M-acyclic rings, and every auxiliary ring belongs to that domain. The general square has connective E₁ vertices and the displayed π₀ tensor isomorphism. A discrete Milnor square with a surjective side is a special case.

(lt line 1197, Theorem 3.3 and Corollary 3.5 with proofs, manuscript pp.29–30.)

A proof route is as follows. Use the replacement-algebra theorem and compare π₀C with π₀B′ under the displayed tensor condition. Replace C and B′ by their discrete π₀ rings under F. Deduce nilinvariance via the cone-ring pullback associated to a nilpotent ideal, as in Land–Tamme Corollary 3.5; verify closure of each restricted domain separately.

**Checks.**

- An ordinary Milnor square with a surjective map is an instance, while an arbitrary square of connective rings is not.
- F=0; A = k[ε]/ε²,I=(ε); Milnor square with identity leg: F(A)=F(k)=0; I²=0; identity-square fiber error=0.

- The identity square on the nondiscrete connective ring Hk⊕ΣHk has π₀ tensor k⊗_k k=k and correction comparison the identity. Its π₁=k is nonzero, so a formulation confined to discrete Milnor squares would omit this instance. With the zero invariant both square errors are zero.

*Needs:* RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; §2.1 (Truncating invariants on acyclic rings).

### 2.3 Rational and p-adic truncation

Let Λ be a localization of Z or Z/m for an integer m≥2. If f:A→B is a map of connective E₁-rings inducing an isomorphism on π₀, and Λ⊗f is n-connective for n≥1, then Λ⊗K(f) is (n+1)-connective. Here tensor with Z/m means Moore coefficients, and Λ-connectivity is measured on the coefficient fiber. In particular a Q- or Z/p-homology equivalence f with π₀f an isomorphism induces the same equivalence on K. Thus K(R)→K(Hπ₀R) is a rational equivalence for rationally discrete R, and a p-adic equivalence whenever R→Hπ₀R is one; this includes every connective Z[1/p]-algebra ring spectrum.

Throughout this target, A→B is connective E1 and induces a π₀-isomorphism. Λ is any localization of Z or Z/m for m≥2; the quantitative version requires n≥1. The rational and mod-p equivalence consequences take Λ=Q and Z/p respectively.

(lt line 689, Lemma 2.4 and proof, manuscript pp.16–17; lmmt line 659, Proof of Theorem 3.8(ii), p.1025.)

A proof route is as follows. Control matrix ring and general-linear relative homology by the map A→B. Use plus invariance of homology and the Serre-class relative Hurewicz/Whitehead argument. Apply the quantitative statement to all finite connectivity levels to obtain rational and mod-p equivalences; retain π₀-isomorphism throughout.

**Checks.**

- For S[1/p]→Hℤ[1/p], K(S[1/p])→K(Z[1/p]) is a p-adic equivalence.
- A = B; Λ=ℤ/2,ℤ/3; S[1/p]→Hℤ[1/p]: fiber(id)=0 in all degrees; mod-p fibers of the p-inverted comparison=0; p-completed K fibers=0.

*Needs:* §1.1 (General linear groups of connective ring spectra); RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 2.4 Nonpositive K-theory of connective rings

For every connective E₁-ring R, the map Kⱼ(R)→Kⱼ(π₀R) is an isomorphism for all j≤0, naturally in ring maps. GeneralAlgebraicKTheory’s Bass–Schlichting comparison identifies the target with its ordinary nonconnective ring K-theory. No nilpotent K₀ theorem is assumed in this foundational comparison.

Throughout this target, R is connective E1 and j≤0.

(bgt line 3363, Theorem 9.53 and proof, pp.825–826.)

A proof route is as follows. Identify K₀ of perfect modules using connective projective retract presentations. Compare the flasque enlargement and suspension used to construct negative K, as in BGT Theorem 9.53. Use GeneralAlgebraicKTheory’s comparison on ordinary rings to retain its existing Bass–Schlichting normalization.

**Checks.**

- For connective R with π₀R=Z, K₀(R)=Z and all negative K groups vanish.
- R=Hℤ and Hk⊕ΣHk; j=0,−1: K₀=ℤ on both sides; K₋₁=0 on both sides.

*Needs:* RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16.

### Examples

A connective square-zero extension Hk⊕ΣHk→Hk is a π₀-isomorphism and a nonpositive K-equivalence. The higher integral comparison requires its stated coefficient/connectivity estimate. A Milnor square with one identity leg gives an identity correction algebra, so the restricted excision conclusion can be tested without a Tor calculation.

### Dependencies

EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16; Layer 1; RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Localizing and truncating small-category invariants; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction.

## Layer 3: Stable envelopes, bounded hearts and regular localization

### 3.1 Bounded t-structures on stable ∞-categories

A t-structure on a small stable ∞-category C is a t-structure on hC with full subcategories C≥0,C≤0 lifted to C; orthogonality and truncation triangles enhance to the truncation adjunctions. It is bounded if every object lies in C≥a∩C≤b for some integers a≤b depending on the object. The heart C♥=C≥0∩C≤0 is an ordinary abelian category. Reuse CategoryTheory.Triangulated.TStructure and its bounded object predicate on hC, with an explicit conversion from Mathlib’s cohomological shift to the homological spectral convention.

Throughout this target, C is small stable with the imported triangulated structure on hC. Bounds are allowed to depend on the object.

(barwick line 820, Theorem 6.1 and preceding conventions, manuscript pp.19–21; agh line 241, §§2.1–2.2, Definitions 2.1, 2.4 and 2.7, manuscript pp.5–7.)

A proof route is as follows. Lift the two full subcategories along C→hC and recover the enhanced truncation adjoints from mapping-space orthogonality. Use the stable/triangulated shift comparison from E0 to fix the index signs. Identify the heart’s mapping spaces as discrete and compare its kernels/cokernels with truncations of fibers/cofibers.

The interface includes:

- The truncation maps realize the appropriate reflection/coreflection onto C≤b and C≥a.
- An object is bounded exactly when its image satisfies the existing bounded predicate on hC, after changing the shift convention.
- The heart is an abelian category with short exact sequences induced by cofiber sequences.
- Σ sends homological amplitude [a,b] to [a+1,b+1].

**Checks.**

- The standard heart of Perf(Hk) for a field k is finite-dimensional k-vector spaces.
- The shifts Σ^rHk are all bounded, although no single interval contains them all.
- The Postnikov t-structure of Sp does not restrict to finite spectra: τ≤0S=Hℤ is not finite.
- Perf(Hk), for a field k, has the bounded standard t-structure with heart finite-dimensional k-vector spaces.
- Hk,ΣHk,ΣʳHk in Perf(k): amplitudes [0,0],[1,1],[r,r]; no fixed finite interval contains all r.

*Needs:* EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; `CategoryTheory.Triangulated.TStructure`; `CategoryTheory.Triangulated.TStructure.bounded`.

### 3.2 Stable envelopes and additive nonconnective K-theory

For a small idempotent-complete additive ∞-category C, put Stab(C)=Funadd(Cop,Sp)^ω, the thick closure of the additive spectral Yoneda objects. This is the idempotent-complete stable envelope. An additive functor from C into a stable idempotent-complete category extends uniquely to an exact functor from Stab(C). Define Kadd,nc(C)=Knc(Stab(C)); prove τ≥0Kadd,nc(C)≃Kadd(C). For stable C, Yoneda uses the connective hom spectrum before stable extension; Stab(C) is not identified with C merely because C is already stable.

Throughout this target, C is small idempotent-complete additive; the extension target is stable and idempotent-complete.

(hs line 3711, §3.1, manuscript pp.17–19; Corollary 8.1.3, pp.70–71; lmmt line 753, Discussion before Proposition 3.12, pp.1026–1027.)

A proof route is as follows. Use additive spectrum-valued presheaves and enriched Yoneda; the representables are compact generators. Take their finite stable retract closure and prove the extension universal property. Apply Hebestreit–Steimle’s group-completion theorem to the finite stable envelope. The assumed idempotent completeness of C makes its bounded weight heart idempotent-complete and hence its stable envelope idempotent-complete; justify this before identifying the thick envelope. Do not invoke invariance of connective K₀ under arbitrary idempotent completion.

The interface includes:

- y:C→Stab(C) is additive and fully faithful with connective mapping spectra.
- Restriction along y is an equivalence from exact functors Stab(C)→D to additive functors C→D for stable idempotent-complete D.
- τ≥0Knc(Stab(C))≃Kadd(C).
- Additive C→D induces exact Stab(C)→Stab(D), compatibly with the Yoneda maps.

**Checks.**

- Stab(Projω(A))≃Perf(A) for connective A.
- Stab(0)=0 and Kadd,nc(0)=0.
- For stable C, y need not preserve C’s cofiber sequences; the comparison Stab(C)→C is a separate exact localization.
- For C=Projω(A) with A connective, Stab(C)≃Perf(A), so Kadd,nc(C)≃K(A).
- C=Projω(Hk); C=0; C=Perf(k) viewed additively: Stab(Projω(Hk))=Perf(k), K₀=ℤ; Stab(0)=0; additive K₀(Perf(k))=⊕_(j∈ℤ)ℤ, stable K₀=ℤ.

*Needs:* §1.2 (Additive ∞-categories and group-completion K-theory); RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 3.3 The theorem of the heart and noetherian extension

If C is small stable with a bounded t-structure, inclusion of the heart gives Kconn(C♥)≃Kconn(C), naturally for t-exact functors. If the heart is additionally noetherian, the same inclusion gives Knc(C♥)≃Knc(C). The latter extra hypothesis is retained; a general bounded heart is not used to assert a full nonconnective equivalence.

Throughout this target, the t-structure is bounded. The full nonconnective comparison additionally requires a noetherian heart.

(barwick line 820, Theorem 6.1 and proof, manuscript pp.19–23; agh line 1227, Theorem 3.18 and proof, manuscript pp.27–29.)

A proof route is as follows. Give the connective aisle its maximal Waldhausen structure and use truncation to compare its K-theory to C. Apply the fibration/additivity argument to the acyclic truncation subcategory, then use the opposite category to isolate the heart. For noetherian hearts apply AGH’s negative-K induction and vanishing argument before promoting the connective comparison to all degrees.

**Checks.**

- For k a field, K(Perf(Hk))≃K(finite-dimensional k-vector spaces); boundedness alone gives only the connective comparison used later.
- Perf(k); heart finite-dimensional k spaces; Σk: K₀(heart)=K₀(Perf(k))=ℤ; [Σk]=−1; Kⱼ=0 for j<0 in this noetherian example.

*Needs:* §3.1 (Bounded t-structures on stable ∞-categories); RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16.

### 3.4 Regular ring-spectrum devissage

Let R be connective, with π₀R right regular noetherian and each πₙR finitely generated as a right π₀R-module. Here right regular for π₀R means that every finitely generated right module has finite projective dimension. Assume every R-module M with ⊕nπₙM finitely presented over π₀R is perfect. Let R→S induce a localization Mod_R→Mod_S whose kernel is generated by a compact object (equivalently a finite set of compact objects). Suppose a perfect M is killed by extension to S exactly when ⊕nπₙM is finitely presented over π₀R. Then K(π₀R)→K(R)→K(S) is a fiber sequence. The first map uses restriction from discrete π₀R-modules, resolution and devissage; it is not generally extension along a ring map π₀R→R.

Throughout this target, π₀R is right regular noetherian; every πₙR is finitely generated over π₀R; R is connective. Every bounded R-module whose homotopy groups are finitely presented over π₀R is perfect. Extension Mod_R→Mod_S is a localization with kernel generated by finitely many compact objects. A perfect module is in that kernel if and only if its total graded homotopy is finitely presented over π₀R.

(agh line 1515, §4.2 definitions and Proposition 4.4, manuscript p.34; Example 4.6, p.35.)

A proof route is as follows. Use compact generation of the localization kernel to identify its compact objects with the bounded coherent R-modules. The finiteness of πₙR and right noetherian π₀R ensure that the standard truncations stay coherent. Its standard t-structure is bounded with noetherian heart the finitely presented π₀R-modules. Right regularity of π₀R identifies the heart’s G-theory with projective K(π₀R); apply the noetherian theorem of the heart. Apply the nonconnective localization fiber sequence.

**Checks.**

- If π∗R=π₀R[u] with u positive even and π₀R regular noetherian, inverting u gives this fiber sequence; verify these conditions before using the example.
- R=Hk[u], |u|=2; u-inversion; zero compact kernel: cofib(Σ²R→R)=Hk, with π₀=k and πᵢ=0 for i≠0; Hk[u±1] kills Hk; zero-kernel fiber=0.

*Needs:* §0.1 (Thomason–Neeman localization); §3.3 (The theorem of the heart and noetherian extension); RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2.

### 3.5 Finite-limit control of the stable envelope

For a small additive ∞-category C with finite limits, define its perfect prestable Freyd envelope A∞ω(C) as the full subcategory of additive presheaves of spaces generated by the space-valued Yoneda objects under finite colimits. Prove that it is closed under finite limits inside additive presheaves of spaces (pp line 1593, Definition 4.19 and Definition 4.20, manuscript p.34; pp line 1651, Theorem 4.26, manuscript pp.35–36). In the bounded-heart kernel of Stab(C)→C for C stable, the standard presheaf t-structure restricts to the kernel and every object has finite amplitude. This is the finite-limit input; closure under finite colimits alone would not establish restriction of truncations.

Throughout this target, C is small additive with finite limits; the kernel application uses stable C.

(pp line 1627, Lemmas 4.24–4.25 and Theorem 4.26 with proof, manuscript pp.35–36; lmmt line 771, Proof of Proposition 3.12, p.1027.)

A proof route is as follows. Use the finite-presentation description of discrete additive presheaves as cokernels of maps of representables. Apply the finite-limit argument to iterated loops and perfect presheaf presentations; use the representability criterion after sufficiently many loops. Apply this prestable finite-limit closure to the stable finite-cell envelope and to the kernel generators coming from cofiber relations.

Its finite-limit API includes:

- The Yoneda embedding takes every object of C to a perfect additive presheaf and preserves finite limits.
- Every perfect presheaf becomes representable after sufficiently many loops, with the bound depending on the presheaf (pp line 1642, Lemma 4.25).
- A finite limit of perfect presheaves is perfect; in particular their zero object, fibers and finite products agree with those in additive presheaves of spaces.

**Checks.**

- For C=0 the finite-limit closure and kernel are both zero. A merely additive category without kernels does not meet the finite-limit hypothesis.
- C=0; stable C; cofiber relation k→0→Σk: presheaf kernel on 0=0; relation has K₀ value 1+(−1)=0; its amplitude has two adjacent bounds.

- For C finite-dimensional k-vector spaces with its discrete mapping spaces, the suspension of the representable k is a perfect presheaf with π₁ at k equal to k and π₀ zero. It is not represented by an object of C, whose representables are discrete; its first loop is the representable k. Thus finite-colimit closure exceeds the set of representables, while eventual representability under looping has value k in this test.

*Needs:* §3.2 (Stable envelopes and additive nonconnective K-theory); §3.1 (Bounded t-structures on stable ∞-categories).

### 3.6 Levy’s bounded-heart fiber

For every small idempotent-complete stable C, the exact extension Stab(C)→C is a localization with kernel D, and K(D)→Kadd,nc(C)→K(C) is a fiber sequence. The kernel D has a bounded t-structure, with no noetherian-heart assumption. This is the categorical construction underlying Levy’s alternative proof; its chromatic corollaries are separate targets in Layer 10.

Throughout this target, C is small stable idempotent-complete.

(lmmt line 765, Proposition 3.12 and proof, p.1027.)

A proof route is as follows. Extend id_C additively from the stable envelope and identify Funex(Cop,Sp)≃Ind(C) as its localization. Generate its kernel by cofibers of the maps cofib(yA→yB)→yC for cofiber sequences A→B→C in C; these relation objects lie in the heart. Use finite-limit control to restrict the presheaf t-structure, then finite generation by heart objects to obtain boundedness. Apply nonconnective localization to the kernel; use the connective theorem of the heart only when the chromatic additive comparison is proved.

**Checks.**

- The kernel is generated by the specified cofiber-relation objects, not by arbitrary objects of Stab(C). A bounded heart does not by itself imply a full nonconnective heart comparison.
- C=0; C=Perf(k): D=0 and K(D)=0 at C=0; on K₀ the map ⊕_jℤ→ℤ sends e_j↦(−1)^j, killing e₀+e₁.

*Needs:* §3.2 (Stable envelopes and additive nonconnective K-theory); §3.5 (Finite-limit control of the stable envelope); §3.3 (The theorem of the heart and noetherian extension); §0.1 (Thomason–Neeman localization); GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16.

### Examples

In Perf(Hk), k and Σk have amplitudes [0,0] and [1,1], with Euler classes 1 and −1. For R=Hk[u], |u|=2, cofib(Σ²R→R)=Hk and inverting u kills exactly the specified bounded coherent support. The map K(k)→K(R) is restriction along R→Hk, not extension along a map Hk→R in the opposite direction.

### Dependencies

EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16; Layer 0; Layer 1; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; `CategoryTheory.Triangulated.TStructure.bounded`; `CategoryTheory.Triangulated.TStructure`.

## Layer 4: Chromatic foundations and Theorem A

### 4.1 Telescopes

Use the supplied positive-height telescopes T(n), n≥1, defined by a finite type-n p-local complex and a positive-degree periodic self-map. Extend the notation to all spectra by T(0)=S[1/p]. The positive-height construction and independence of its Bousfield class are inputs; the global bottom convention and its comparisons are the variant owned here.

(lmmt line 267, §2.1 and Lemma 2.2(vii), pp.1016–1017.)

A proof route is as follows. Apply the supplier’s sequential homotopy-colimit construction to the desuspended map. Use eventual centrality and the thick theorem, in the separate comparison theorem below, to remove the pair from the Bousfield class.

The interface includes:

- For n≥1 use the supplied telescope unit and the comparison under positive powers.
- For every spectrum X, T(0)⊗X is X[1/p], naturally with its localization unit.
- For p-local X, T(0)⊗X agrees with X⊗Hℚ; without p-locality retain p-inversion.

**Checks.**

- Inverting a nilpotent map gives zero.
- Replacing v_n by a positive power gives an equivalent telescope.
- For q≠p, T(0)⊗S/q≠0 whereas Hℚ⊗S/q=0.
- p=2,q=3; nilpotent self-map 0; positive power v²: T(0)⊗H𝔽₃=H𝔽₃≠0, Hℚ⊗H𝔽₃=0; Tel(0)=0; Tel(v²)≃Tel(v).

*Needs:* BordismFormalGroups F6.2–F6.3; StableHomotopyKTheory Layers 3–7; BordismFormalGroups F6.1.

### 4.2 Periodic homotopy groups

For n≥1 and a fixed unstable representative v:Σ^dV→V, define v_n⁻¹π_k(X;V) as colim_r π_(k+rd)Map_*(V,X) under precomposition with v, taking a tail where k+rd≥2 for spaces. For spectra use the stable mapping spectrum and integer grading. A v_n-periodic equivalence induces isomorphisms in every degree. At height zero, for spectra and simple spaces use π_*(X)[1/p]; it is a separate convention.

(lmmt line 255, Definition 2.1 and Lemma 2.2(i),(ii),(viii), pp.1016–1017.)

A proof route is as follows. Precomposition increases mapping-space homotopy degree by d; the positive degree makes a cofinal abelian tail available. Compare unstable mapping into Ω∞X with the mapping spectrum out of Σ∞V through adjunction. Keep dependence on V in the groups; only the equivalence condition is independent after the telescope comparison.

The interface includes:

- A pointed map induces maps on every periodic homotopy group, preserving identity and composition.
- The groups for a spectrum X and for Ω∞X agree at positive height.
- Shifting the degree by d is an isomorphism induced by the self-map.
- A v_n-periodic equivalence is exactly an isomorphism on all displayed colimits.

**Checks.**

- Periodic groups of a contractible pointed space vanish.
- A bounded Postnikov spectrum has zero positive-height periodic groups.
- The p-inverted groups of S/q with q≠p can be nonzero at height zero.
- X=*; ΣʳH𝔽_p; S/q with q≠p: positive periodic groups of first two=0; π₀(H𝔽_q)[1/p]=𝔽_q.

*Needs:* BordismFormalGroups F6.2–F6.3; §4.1 (Telescopes); StableHomotopyKTheory Layers 3–7; AlgebraicTopology Stages 4 and 8.

### 4.3 Telescope acyclicity criteria

For n≥1, a spectrum X and Ω∞X have the same v_n-periodic groups. Every integer connective cover of a spectrum and finite connected cover of a space is a periodic equivalence. S/p-acyclicity implies T(n)-acyclicity; derived p-completion X→X_p^∧ is a T(n)-equivalence. A spectrum is T(n)-acyclic exactly when all its v_n-periodic groups vanish. The Bousfield-class independence of T(n) and T(n)-acyclicity implying K(n)-acyclicity are supplied by BordismFormalGroups F6.3.

(lmmt line 267, Lemma 2.2(i)–(viii) and proof, pp.1016–1017.)

A proof route is as follows. Use the suspension/loop adjunction to identify the periodic colimits; positive self-map degree makes all finite Postnikov truncations invisible. Use finite duality and a power of p annihilating a finite positive-type complex for the Moore-acyclicity implication. The derived p-completion map is an S/p-equivalence, hence a positive telescopic equivalence. The periodic detection criterion follows by comparing the dual finite telescope with the supplied choice-independent Bousfield class.

**Checks.**

- The p-completion map need not be a T(0)-equivalence.
- The criterion is acyclicity, not an identification of T(n) with K(n) as spectra.
- Hℤ; Hℚ; S/p; n=1: positive periodic groups of Hℤ and Hℚ=0; p-completion of Hℚ=0 yet T(0)Hℚ=Hℚ; positive-height Moore equivalence is retained.

*Needs:* §4.1 (Telescopes); §4.2 (Periodic homotopy groups); BordismFormalGroups F1–F3; GeneralizedCohomology G2 and G5.1; BordismFormalGroups F6.2–F6.3; StableHomotopyKTheory Layers 3–7.

### 4.4 Ring-spectrum acyclicity comparison

For n≥1 and any associative unital ring spectrum R, T(n)⊗R=0 if and only if K(n)⊗R=0. No such comparison is asserted for an arbitrary spectrum or for T(0) versus K(0).

(lmmt line 316, Lemma 2.3 and Remark 2.4, p.1017.)

A proof route is as follows. One direction is telescope detection. For the other replace the finite source by its endomorphism ring D V⊗V and take a central power of the self-map. The resulting telescope can be made a unital ring, so its tensor with R has a unit (hopkins-smith line 89, Theorem 3, p.2; line 129, Theorem 7, p.3; line 166, Theorem 11, p.4). All Morava theories, including HF_p, kill this tensor if K(n) kills R. Nilpotence of the unit forces it to be zero. Retain the ring hypothesis on the object whose unit is tested; an arbitrary module does not acquire such a unit.

**Checks.**

- The criterion applies to E₁ rings at p=2.
- At height zero the ring HF_q, q≠p, separates S[1/p] from Hℚ.
- H𝔽_p; Morava K(n); H𝔽_q at q≠p: T(n)H𝔽_p=K(n)H𝔽_p=0; both detect K(n) nonzero; T(0)H𝔽_q≠0 while K(0)H𝔽_q=0.

*Needs:* §4.3 (Telescope acyclicity criteria); BordismFormalGroups F6.2–F6.3; StableHomotopyKTheory Layers 3–7.

### 4.5 Finite chromatic localizations

Write L_n=L_(K(0)∨⋯∨K(n)). On all spectra write L_n^f=L_(Hℚ∨T(1)∨⋯∨T(n)), so this includes p-localization, and write L_n^(p,f)=L_(S[1/p]∨T(1)∨⋯∨T(n)). For n=0 these are respectively Hℚ-localization and p-inversion. Construct units and tower maps L_n→L_(n−1), L_n^f→L_(n−1)^f and L_n^(p,f)→L_(n−1)^(p,f). The finite kernels and smashing property are theorems, not parts of the notation.

(lmmt line 338, Definition 2.5, p.1017.)

A proof route is as follows. Use the wedge of the indicated detecting spectra to obtain each reflector. The inclusion of acyclic classes gives natural transition maps compatible with the units.

The interface includes:

- Each tower has natural units from X.
- The truncation maps of the detector wedges induce compatible maps down the towers.
- An object is local exactly for the E-equivalences of the displayed wedge.
- For a smashing tower, the localized sphere is an idempotent commutative algebra and L(X)=L(S)⊗X.

**Checks.**

- L_0^fS=Hℚ but L_0^(p,f)S=S[1/p].
- For p-local X the two finite towers agree, by the separate comparison theorem.
- L_n^f kills S/q for q≠p while L_n^(p,f) preserves this spectrum.
- n=0; Hℚ; H𝔽₃,p=2: L₀^fS=Hℚ, L₀^(p,f)S=S[1/p]; both fix Hℚ; only global p-finite tower fixes H𝔽₃.

*Needs:* BordismFormalGroups F6.1; §4.1 (Telescopes); BordismFormalGroups F1–F3; BordismFormalGroups F6.2–F6.3.

### 4.6 Finite localization kernels

For n≥0, on all spectra ker(L_n^(p,f)) is the localizing subcategory generated by finite p-primary-torsion spectra of type at least n+1; this localization is smashing and preserves compact objects into the compact localized category. The kernel of L_n^f on all spectra additionally contains all q-primary finite spectra for q≠p.

(lmmt line 352, Lemma 2.6 and proof, p.1018.)

A proof route is as follows. Apply the supplied p-local finite localization and compactly generated quotient. On all spectra, the p-inverted summand forces the fiber to be p-primary; its compact generators are finite p-primary spectra of type at least n+1. Finite dualizability makes the right adjoint preserve coproducts; tensoring with the local sphere then realizes the reflector.

**Checks.**

- At n=0, the p-finite kernel is generated by S/p.
- On p-local spectra, the n=0 kernel is all rationally acyclic spectra.
- n=0; S/p; S/q,q≠p: p-finite localization kills S/p and fixes S/q; ordinary finite localization kills both torsion spectra.

*Needs:* §4.5 (Finite chromatic localizations); BordismFormalGroups F6.2–F6.3; §4.3 (Telescope acyclicity criteria); EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 4.7 Comparison on p-local spectra

If X is p-local then L_n^(p,f)X≃L_n^fX, naturally and compatibly with tower units and transition maps. Both outputs are p-local. Without p-locality the comparison is false, as S/q with q≠p shows. The functor called finite localization in Clausen–Mathew’s p-local convention is the L_n^f specified here.

(lmmt line 338, Definition 2.5, p.1017; consequence (i) of Lemma 2.8, p.1018.)

A proof route is as follows. On p-local spectra, tensoring with S[1/p] is rationalization. The positive-height detectors are already p-local. Restrict the two localization universal properties to Sp_(p); their acyclics coincide there.

**Checks.**

- Check X=S_(p), including n=0.
- Check X=S/q, q≠p, to disprove an unrestricted comparison.
- X=S_(p),Hℚ; X=H𝔽_q,q≠p: bottom two values Hℚ,Hℚ for first inputs; last has values H𝔽_q and 0.

*Needs:* §4.5 (Finite chromatic localizations); §4.6 (Finite localization kernels).

### 4.8 Chromatic fracture squares

Let E,F be spectra and assume L_E sends F-acyclics to F-acyclics. For every X the natural square L_(E∨F)X→L_FX over L_EX→L_E L_FX is cartesian. The hypothesis holds if L_E is smashing or if L_F kills every E-local spectrum. Apply it for 0≤m<n to E=T(0)∨⋯∨T(m) and F=T(m+1)∨⋯∨T(n), giving the finite-tower fracture square with upper-left L_n^(p,f)X and lower-left L_m^(p,f)X. The analogous p-local Hℚ convention follows by comparison.

(lmmt line 362, Lemmas 2.7–2.8 and proof, p.1018.)

A proof route is as follows. The pullback is local for E∨F because its three other vertices are local for the appropriate detector. Compare its fiber with that of X→L_FX, then use preservation of F-acyclics to see the map from X is also an E-equivalence. Check the two sufficient conditions explicitly; use smashing of the lower finite tower in the application.

**Checks.**

- For m=0 the lower localization is p-inversion, not integral rationalization.
- The condition on L_E is required for the general lemma.
- m=0,n=1; X=0; X=H𝔽_q,q≠p: zero square all entries 0; last square has upper-left and lower-left H𝔽_q and right column 0, hence pullback H𝔽_q.

*Needs:* BordismFormalGroups F6.1; §4.5 (Finite chromatic localizations); §4.6 (Finite localization kernels); §4.7 (Comparison on p-local spectra).

### 4.9 Bottom finite-local comparison

If X is T(1)-acyclic, then L_1^(p,f)X→X[1/p] is an equivalence, without a p-locality assumption on X. In the p-local subcategory this says L_1^fX≃X⊗Hℚ.

(lmmt line 367, Consequences (i)–(ii) of Lemma 2.8, p.1018.)

A proof route is as follows. Use the height-one fracture square with lower detector S[1/p]. The T(1)-local corner of X is zero, so the pullback is X[1/p].

**Checks.**

- For X=S/q with q≠p, the result is X rather than zero.
- p=2; X=H𝔽₃; X=Hℚ: L₁^(p,f)H𝔽₃=H𝔽₃=H𝔽₃[1/2]; L₁^(p,f)Hℚ=Hℚ.

*Needs:* §4.8 (Chromatic fracture squares); §4.5 (Finite chromatic localizations).

### 4.10 Finite telescopic functors

For a finite pointed complex V and a v_n map v:Σ^d V→V with n≥1, construct a spectrum-valued functor Φ_v on pointed spaces by repeating Map_*(V,−) along the v-induced degree-d structure maps. Its integer homotopy groups are v_n⁻¹π_*(−;V). Transport along compatible powers of self-maps and finite maps is coherently functorial, rather than a choice made only in the homotopy category.

(kuhn-guide line 393, §3.1, Lemma 3.1, pp.9–11; Theorem 5.2 and Lemma 5.4, pp.15–17.)

A proof route is as follows. Form the degree-periodic prespectrum on pointed mapping spaces and spectrify. Construct the compatible finite-source system by increasing suspension degrees into the stable range. Replace the transition maps by cofibrations and use the homotopy extension property to make the periodicity and sphere comparison diagrams commute, as in Kuhn Lemma 5.4.

The interface includes:

- π_kΦ_v(X) is the displayed periodic mapping-space colimit.
- Positive powers give canonically compatible equivalent functors.
- Eventually compatible finite maps induce comparison maps, with rigidified composition.
- On Ω∞X, the construction agrees with periodic localization of the mapping spectrum F(V,X).

**Checks.**

- If X is a finite Postnikov space then Φ_v(X)=0.
- Let V be a nonzero finite complex of type n with v_n self-map v and E=v⁻¹Σ∞V its telescope, and put X=Ω∞E. Then π₀Φ_v(X)=colim_r[Σ^(rd)V,E]=[V,E]=[E,E], which contains the nonzero class of the localization map V→E. The zero functor passes the finite-Postnikov test but fails this one.
- In the same example π_(−kd)Φ_v(X)≅π₀Φ_v(X)≠0 for every k>0, by the periodicity of E. A model that outputs a connective spectrum, such as the connective cover of the periodic colimit, has zero groups in negative degrees and fails this test.
- Replacing v by v² in the same example gives the colimit of [Σ^(2rd)V,E] along v², a cofinal subsystem with the same value [V,E]; a construction that depended on the chosen power would distinguish the two.

*Needs:* §4.2 (Periodic homotopy groups); BordismFormalGroups F6.2–F6.3; StableHomotopyKTheory Layers 3–7.

### 4.11 Bousfield–Kuhn functor

For each n≥1 construct Φ_n:Spaces_*→Sp_(T(n)) with natural equivalences F(V,Φ_nY)≃Φ_vY for finite type-n V with self-map v, and Φ_nΩ∞X≃L_(T(n))X. The first comparison uses the finite mapping spectrum; the second is natural in every spectrum X. State uniqueness with the finite-source compatibilities, not merely the equality of homotopy groups. For n=1 and p odd, use KTheoryFiniteLocalFields §0.4's homotopy-category functor `heightOneFromZeroSpace`; what is built here in addition is the prime 2, every height n≥2, the coherent finite-source formula and the uniqueness statement. Prove the comparison: for p odd, Φ₁ induces on pointed homotopy categories a functor naturally equivalent to `heightOneFromZeroSpace`, compatibly with the two equivalences Φ₁Ω∞X≃L_(T(1))X=L_(K(1))X (by §4.20) and Φ_p(Ω∞₀X)≃`heightOneLocalize X`; since Φ₁ inverts maps that are equivalences on connected covers, Ω∞ and Ω∞₀ give the same value.

(kuhn-guide line 113, Theorem 1.1, pp.3–4; Theorem 5.2, Lemmas 5.4–5.5 and Definition 5.6, pp.15–18.)

A proof route is as follows. Choose the finite type-n resolution of the sphere in Kuhn Proposition 2.6. Construct its rigidification using the stable-range periodicity theorem, cofibration replacement and homotopy extension. Take the specified inverse limit of shifted finite telescopic functors. The finite-source mapping formula and the sphere-resolution equivalence identify its value on every infinite loop space with T(n)-localization. Uniqueness retains these natural finite-source comparisons.

The interface includes:

- Every value of Φ_n is T(n)-local.
- The finite-source formula is natural in Y and compatible with powers and finite maps.
- The natural equivalence Φ_nΩ∞≃L_(T(n)) respects maps of spectra.
- T(n)-local-valued functors equipped with the compatible finite-source characterization are equivalent compatibly with that characterization; locality is part of the uniqueness hypothesis.

**Checks.**

- Φ_nΩ∞ of a T(n)-acyclic spectrum is zero.
- Φ_nΩ∞T(n)≃L_(T(n))T(n) is nonzero.
- There is no height-zero functor with this unrestricted comparison on all spectra, since Ω∞ annihilates strictly negative Eilenberg–Mac Lane spectra.
- X=Hℤ; X=T(n); X=Σ^(−1)Hℚ: ΦₙΩ∞Hℤ=0; ΦₙΩ∞T(n)=L_T(n)T(n)≠0; last Ω∞=*, ruling out height-zero analogue.

*Needs:* §4.10 (Finite telescopic functors); BordismFormalGroups F6.1; §4.3 (Telescope acyclicity criteria); GeneralizedCohomology G2 and G5.1; for the n=1, p odd comparison only, KTheoryFiniteLocalFields §0.4 (Height-one localization and realization) and §4.20 (Separation above height one).

### 4.12 Detection by suspension and loops

For n≥1, if Σ∞Ω∞f is a T(n)-equivalence then f is a T(n)-equivalence. Indeed L_(T(n))f is a retract of Φ_nΩ∞Σ∞Ω∞f by the suspension-loop unit and counit. At n=0 the corresponding detection holds for maps of connective spectra with p inverted. The positive-height functor Σ∞Ω∞ does not in general preserve T(n)-equivalences: Hℤ is T(n)-acyclic whereas Σ∞Ω∞Hℤ=Σ∞Z has nonzero sphere summands.

(lmmt line 384, Proposition 2.9 and Remark 2.10, pp.1018–1019.)

A proof route is as follows. Apply Φ_n to the suspension-loop triangle identity, giving a natural retract diagram. For the height-zero connective assertion compare the least nonzero p-inverted homotopy group using Hurewicz, and then the fiber. Use Hℤ and its discrete infinite loop space to test the absent preservation direction.

**Checks.**

- The hypothesis is preservation after applying Σ∞Ω∞; the conclusion does not give the converse.
- A negative Eilenberg–Mac Lane spectrum rules out the unrestricted height-zero detection statement.
- Hℤ→0 at n≥1; Σ^(−1)Hℚ→0 at bottom: Hℤ is T(n)-acyclic but Σ∞ℤ has nonzero sphere summands; negative rational spectrum has Ω∞=* but rationalization nonzero.

*Needs:* §4.11 (Bousfield–Kuhn functor); StableHomotopyKTheory Layers 3–7; §4.3 (Telescope acyclicity criteria).

### 4.13 Postnikov and connected-cover conventions

Import the space Postnikov towers from StableHomotopyKTheory §§3.18–3.21, including nontrivial fundamental-group action; only the comparison and indexing convention are owned here. For a pointed space X, use the supplied τ_≤rX for r≥0 and define the connected-cover indexing by X⟨r⟩=fib(X→τ_≤(r−1)X) for r≥1. Then π_iτ_≤rX agrees with π_iX for i≤r and vanishes for i>r, and X⟨r⟩ has zero π_i for i<r. The tower converges for spaces. For a map, say m-connective when every homotopy fiber is (m−1)-connected, so π_i is an isomorphism for i<m and a surjection for i=m, at compatible components and basepoints.

(lmmt line 267, Lemma 2.2(ii), p.1016; proof of Proposition 2.11, p.1019; bhm line 225, §3, Theorem 3.1, p.5; Lemmas 3.2–3.3, p.6.)

A proof route is as follows. Use the imported tower componentwise; it is principal only under the supplier’s trivial-action hypothesis. Form the fiber of X→τ_≤(r−1)X and read its connectivity from the long exact homotopy sequence. Translate the indexing of connected covers and connective maps to the convention below.

The indexing comparison has the following API.

- The supplied truncation maps induce natural connected-cover maps, compatible with pointed maps and the Postnikov tower.
- The fiber sequence X⟨r⟩→X→τ_≤(r−1)X identifies its homotopy groups with those of X in degrees at least r and with zero below r.
- The space-map connectivity convention is equivalent to the stated isomorphism and surjectivity ranges at all compatible basepoints.

**Checks.**

- τ_≤0X is the discrete component space, not a connected replacement.
- X⟨1⟩ is the basepoint component of X.
- K(A,r)⟨r+1⟩ is contractible, whereas τ_≤rK(A,r)≃K(A,r).
- X=S⁰; X=K(ℤ,1); r=1,2: τ≤₀S⁰=S⁰; base component is one point; K(ℤ,1)⟨2⟩=*.

*Needs:* StableHomotopyKTheory Layers 3–7; AlgebraicTopology Stages 4 and 8.

### 4.14 Fiberwise homology comparison

Let f:X→Y be a map of spaces and E a spectrum. If for every y the augmentation E⊗Σ∞_+fib_y(f)→E is an equivalence, then E⊗Σ∞_+f is an equivalence, with no finiteness hypothesis on Y and no boundedness hypothesis on E. For pointed connected fibers the hypothesis says that their reduced E-homology vanishes.

(lmmt line 409, Proposition 2.11(ii) proof, p.1019.)

A proof route is as follows. Use BordismFormalGroups F6.5 and EnhancedDerivedSheaves E0.7/E3.1 to unstraighten the map as its homotopy-fiber local system and form its pointwise left Kan extension, then compose along Y→*. The augmented fiberwise E-homology equivalences give an equivalence of diagrams. Their colimits are E⊗Σ∞_+X and E⊗Σ∞_+Y, respectively. The supplied general straightening and pointwise Kan extension composition give the space-indexed Fubini comparison.

**Checks.**

- For an identity map, every fiber is a point and its augmented E-homology is E→E.
- For ∅→*, the fiber augmentation is 0→E and fails unless E=0.
- For E=KU and base ℂP∞, the homological filtration is exhaustive and bounded below in filtration degree and converges strongly; the proof can also use colimits of the fiber local system.
- f=id_X for arbitrary X; f:∅→*; E=0: identity fibers are points with augmented E-homology E→E=id; empty fiber gives 0→E, false for E≠0; E=0 always 0→0.

*Needs:* EnhancedDerivedSheaves E0.4, E0.7 (straightening), E3.1 (pointwise Kan extensions and their composition), E5:abstract.1–4 and E5:presentability.1–3; BordismFormalGroups F6.5 (space-indexed coherent diagrams).

### 4.15 Connective periodic vanishing

For every n≥1 there is an integer m≥2 such that an m-connective pointed space whose v_i-periodic homotopy groups vanish for 0≤i≤n is L_n^(p,f)-acyclic after reduced suspension spectrum. Consequently an m-connective map of spaces which is a v_i-periodic equivalence for all 0≤i≤n induces an L_n^(p,f)-equivalence on suspension spectra. One can take m=n+1 using the Carmeli–Schlank–Yanovski height bound; keep this sharpened bound separate from Bousfield’s original dimension-dependent bound.

(lmmt line 409, Proposition 2.11 and Remark 2.12, pp.1019–1020; bhm line 225, §3, Theorem 3.1, p.5; Lemmas 3.2–3.3, p.6; csy line 4036, Theorem 5.4.4 and Remark 5.4.5, pp.83–84.)

A proof route is as follows. First construct the finite-nullification comparison for sufficiently connected periodic equivalences, as stated in Barthel–Heuts–Meier Theorem 3.1. Map into the infinite loop spaces of the supplied finite-local spectra to identify the resulting stable localization (their Lemma 3.3). For the sharp bound, kill the finite Postnikov fibers above degree n using CSY Theorem 5.4.4 and Remark 5.4.5, and use the fiberwise homology comparison. Apply the p-local argument together with the vanishing of the p-inverted homotopy groups to obtain the global p-finite convention. The nullification and Postnikov reductions are parts of this target.

**Checks.**

- n=1 permits m=2 under the sharpened bound.
- No claim is made for arbitrary disconnected fibers.
- n=1,2; contractible X: sharp m=n+1 is 2,3; reduced spectrum of *=0; all periodic groups 0.

*Needs:* §4.13 (Postnikov and connected-cover conventions); §4.2 (Periodic homotopy groups); §4.5 (Finite chromatic localizations); §4.14 (Fiberwise homology comparison); §4.12 (Detection by suspension and loops); §4.4 (Ring-spectrum acyclicity comparison).

### 4.16 Connective preservation by suspension and loops

For n≥1, Σ∞Ω∞ preserves m-connective L_n^(p,f)-equivalences of spectra, where m is the bound of connective periodic vanishing, and in particular m=n+1 using the sharp bound. This does not assert preservation of arbitrary T(n)-equivalences.

(lmmt line 409, Proposition 2.11(iii) and Remark 2.12, pp.1019–1020.)

A proof route is as follows. Apply Ω∞ to the connective map; the periodic groups agree with the stable periodic groups. Use the space comparison at every basepoint and then apply Σ∞.

**Checks.**

- The Hℤ counterexample in the suspension-loop detection section has insufficiently connective fiber and does not contradict this result.
- The conclusion uses the full finite wedge through height n.
- f=id; n=1,m=2; Hℤ→0 negative control: identity fiber 0; sharp bound 2; Hℤ→0 fiber has π₀=ℤ and fails bound.

*Needs:* §4.15 (Connective periodic vanishing); §4.2 (Periodic homotopy groups); §4.3 (Telescope acyclicity criteria); StableHomotopyKTheory Layers 3–7.

### 4.17 Ravenel’s Bousfield class formula

For n≥0, prove ⟨BP⟨n⟩⟩=⟨E(n)∨HF_p⟩; for n≥1 prove ⟨k(n)⟩=⟨K(n)∨HF_p⟩. The formulas are statements of Bousfield classes, not equivalences of spectra.

(ravenel line 401, Theorem 2.1(b),(d),(e),(f), pp.361–363; lmmt line 1002, Proof of Corollary 4.21, p.1032.)

A proof route is as follows. Use the supplied BP quotients, localizations and the E(n) Bousfield class. Prove the truncated-theory identities by Ravenel Theorem 2.1, retaining the residual HF_p class before inversion and the actual regular-generator cofiber maps. The invariant-ideal module comparisons, rather than an equality of coefficient rings alone, give the class calculation.

**Checks.**

- At n=0 the inverted BP class is rational, although BP[p⁻¹] has many rational homotopy groups.
- The HF_p summand is essential before v_n inversion.
- n=0,1; smash HF_p before and after inversion: BP[p⁻¹] has rational class Hℚ; BP⟨1⟩⊗HF_p≠0 whereas E(1)⊗HF_p=0.

*Needs:* BordismFormalGroups F1–F3 and F6.1–F6.3 (including the BP-inversion and E(n) class identity).

### 4.18 Finite-height locality

Let R be a p-local even-periodic oriented homotopy commutative ring with geometric height at most n at every point of Spec π₀R. Then R and every R-module are L_n-local. The graded variant assumes the explicit unit-ideal criterion (p,v₁,…,v_n)=π_*R. The pointwise condition in the even-periodic case implies that criterion after converting the coefficients to degree zero. These statements require a uniform finite bound; no bound is inferred merely from having a one-dimensional law.

(lmmt line 1002, Proof of Corollary 4.21, p.1032; behrens line 861, §1.6, pp.27–29.)

A proof route is as follows. Convert the finite uniform height bound into the unit-ideal condition for the degree-zero forms of p,v₁,…,v_n. On each principal-open coefficient localization, use the supplied inverted BP module action and its free/cofree adjunction to obtain locality for every module. A finite derived Cech diagram reconstructs the ring and each module; local spectra are closed under limits. Repeat with homogeneous coefficients in the graded formulation.

**Checks.**

- An even-periodic elliptic theory has bound two.
- The additive characteristic-p theory has infinite height and does not meet a finite bound.
- multiplicative law; additive law over 𝔽_p; elliptic law: heights 1,∞ and ≤2; additive [p]=0 fails every finite unit-ideal bound.

*Needs:* BordismFormalGroups F1–F3; §4.17 (Ravenel’s Bousfield class formula).

### 4.19 Telescopes on chromatically local spectra

For n≥1, every L_(n−1)-local spectrum is T(n)-acyclic. For every L_n-local X, the canonical comparison L_(T(n))X→L_(K(n))X is an equivalence. Both assertions require the stated chromatic locality and do not prove equality of the two localization functors on all spectra. The p-local chromatic level one agrees with KU_(p)-localization; globally L_KU detects all primes rather than a fixed-p tower.

(lmmt line 1002, Proof of Corollary 4.21, p.1032; behrens line 1048, Proposition 1.6.8 and the chromatic fracture square, pp.28–29.)

A proof route is as follows. Hopkins–Ravenel smashing expresses a lower-local X as L_(n−1)S⊗X. The lower-local sphere is a unital ring which is K(n)-acyclic, hence T(n)-acyclic by the ring comparison. For an L_n-local X apply the height-n fracture square and the same lower-piece vanishing. The remaining height-n comparison uses the finite-local and chromatic fracture comparisons on this local category; it does not identify the two reflectors on all spectra.

**Checks.**

- KU_(p) is L₁-local, but its p-completion must still be distinguished from global KU.
- An arbitrary T(n)-local spectrum at n≥2 need not be K(n)-local.
- n=1,X=Hℚ; n=2,X=L₁S: T(1)Hℚ=0; T(2)L₁S=0; both localized comparison values=0 in these lower-height cases.

*Needs:* BordismFormalGroups F6.4; §4.3 (Telescope acyclicity criteria); §4.17 (Ravenel’s Bousfield class formula); §4.8 (Chromatic fracture squares); §4.4 (Ring-spectrum acyclicity comparison).

### 4.20 Separation above height one

At every prime p, the Bousfield classes of T(1) and K(1) agree. This comparison identifies the two height-one localization functors. Higher-height comparisons used here are only the ring-acyclicity equivalence or the comparison on Lₙ-local spectra.

(At p=2: mah81 line 46, Theorem 1.1, pp.365–366, and mah81 line 633, Theorem 6.3, p.382. At odd p: mil81 line 272, Theorem 4.11 and Corollary 4.12, pp.294–295. Background: lmmt line 71, Introduction, p.1012; bhls line 98, Theorem A, pp.2–4, for the failure at heights at least two.)

A proof route is as follows. At odd p, compute the homotopy of the v₁-telescope of the mod-p Moore spectrum from the localized Adams spectral sequence: it is 𝔽_p[v₁^(±1)]⊗Λ(δv₁) (Miller), which is the homotopy of its K(1)-localization. At p=2, use the bo-resolution: the v₁-periodic classes of the sphere are exactly those detected in the bo-based Adams spectral sequence (Mahowald), which identifies the v₁-telescope of a type-one complex with its K(1)-localization. For a finite type-one complex V this gives v₁⁻¹V≃L_K(1)V; since ⟨T(1)⟩=⟨v₁⁻¹V⟩ and ⟨L_K(1)V⟩=⟨E(1)⊗V⟩=⟨K(1)⟩, the two Bousfield classes coincide. The p=2 argument keeps the real-theory contribution and is not an odd-prime argument; no higher-height counterexample theorem is an input.

**Checks.**

- At p=2 and p=3, Hℤ is acyclic for both height-one detectors.
- KU_p^∧ is detected by both height-one theories.
- The n≥2 comparisons in this roadmap require a ring structure or Lₙ-locality; the height-one theorem has no such restriction.
- p=2,3; Hℤ; KU_p^∧: T(1) and K(1) both kill Hℤ and both detect KU_p^∧; no n≥2 equivalence used.

*Needs:* §4.19 (Telescopes on chromatically local spectra); §4.1 (Telescopes); BordismFormalGroups F1–F3; BordismFormalGroups F6.3 (type, periodic self-maps and Bousfield classes); GeneralizedCohomology G5.1–G5.4 (ko and KU).

### 4.21 Chromatic support of BP truncations

For n≥0 and i>n, BP⟨n⟩ is K(i)-acyclic and T(i)-acyclic. For n≥1 the map BP⟨n⟩→E(n) is a T(n)-equivalence, and is also a T(i)-equivalence for i>n because both objects are acyclic there. It is not an L_n^f-equivalence in general: the rational homotopy of BP⟨n⟩ is connective, whereas E(n) has negative rational classes for n≥1.

(ravenel line 401, Theorem 2.1(d)–(f), pp.361–363; lmmt line 903, Corollary 4.12 and Remark 4.13, p.1030.)

A proof route is as follows. Smash Ravenel’s class formula ⟨BP⟨n⟩⟩=⟨E(n)∨HF_p⟩ with T(i), i>n. The class of E(n) is the join of K(0),…,K(n), and each of those, as well as HF_p, annihilates T(i) by telescope orthogonality. This proves the T(i)-vanishing without choosing a ring structure on BP⟨n⟩; the K(i)-vanishing follows from the same class formula. The successive v_n-cofibers are shifts of BP⟨n−1⟩. They are T(n)-acyclic, so the sequential inversion map is a T(n)-equivalence. At n=1, rationalization preserves the distinction between the connective polynomial coefficient ring and its Laurent localization, disproving the stronger routed assertion.

**Checks.**

- For n=1 the inversion map is a T(1)-equivalence but fails to be a rational equivalence.
- For n=0, BP⟨0⟩=HZ_(p) has no positive finite-height support.
- n=0,1; p=2; rationalized BP⟨1⟩→E(1): HZ_(2) has no positive finite-height support; in degree −2 the rational groups are 0 versus ℚ for BP⟨1⟩ and E(1).

*Needs:* §4.17 (Ravenel’s Bousfield class formula); §4.3 (Telescope acyclicity criteria); BordismFormalGroups F1–F3.

### 4.22 Localized norms and Tate spectra

Import coherent finite-group orbits, fixed points, the normalized norm, its Tate cofiber, and the lax symmetric monoidal Tate functor from RefinedTraceMethods §§2.1–2.5. For an E-local spectrum X with coherent G-action, the norm in Sp_E is L_E(X_hG)→X^hG, and its cofiber is L_E(X^tG). The fixed points are already E-local because local objects are closed under limits. The imported Tate module structure is compatible with this comparison. This node owns only the passage to the homological localization.

(cm-tate line 70, Definition 2.2 and Proposition 2.3, pp.2–3.)

A proof route is as follows. Compute colimits in Sp_E by applying L_E to ambient colimits, and limits by the fully faithful inclusion. Apply the exact functor L_E to the imported norm cofiber sequence; identify its target with X^hG. Transport the imported multiplicative and module structures through the symmetric monoidal localization.

The interface includes:

- The local norm has source L_E(X_hG) and target X^hG, naturally in local G-objects X.
- Its cofiber is L_E(X^tG), with the comparison induced by localization of the ambient norm sequence.
- The comparison respects the imported Tate pairings and, for an equivariant algebra A and equivariant A-module X, the induced action after localization by the Tate algebra.

**Checks.**

- For G trivial both localized norm and ambient norm are identities.
- For rational-local inputs, averaging by |G| gives norm equivalence.
- G=1; rational C₂ action trivial; local spectrum X: norm=id for 1; transfer on trivial π₀ is ×2, invertible over ℚ; local fixed points remain local.

*Needs:* RefinedTraceMethods §§2.1–2.5 (coherent actions, the finite-action quotient, the Tate fixpoint lemma, parametrized Tate constructions and cyclic realization); BordismFormalGroups F6.1.

### 4.23 Localized transfer splitting

For a homological localization L and finite G, these are equivalent: every G-object in LSp has norm equivalence; L((LS)^tG)=0 for the trivial action on LS; the transfer Σ∞_+BG→S admits a section after L. If these properties hold for prime-order groups they hold for every finite group. The transfer Σ∞_+BC_p→S admits a section after Ω^(∞+1), by Kahn–Priddy in its cyclic-group form.

(cm-tate line 62, Lemma 2.1, Proposition 2.3, Lemma 2.4 and Theorem 2.5, pp.2–3.)

A proof route is as follows. Reduce the arbitrary-action criterion to the Tate algebra of the localized sphere through its unital module action. For C_p use the unstable transfer section and the Bousfield–Kuhn comparison. Normalize the resulting norm element at the basepoint to 1; its multiplicative cohomology class is a unit. Pass from prime-order groups to finite groups using restriction, induction and subgroup transfers. These are the transfer-section and finite-group arguments of Clausen–Mathew Lemmas 2.1 and 2.4 and Proposition 2.3.

**Checks.**

- The map is the transfer, not the augmentation whose section exists trivially.
- For rational localization the section follows by dividing by |G|.
- L=Hℚ,G=C₂,C₃; zero localization: transfer∘section=(1/2)·2=1 and (1/3)·3=1; zero category has unique map.

*Needs:* §4.22 (Localized norms and Tate spectra); BordismFormalGroups F6.1; §4.11 (Bousfield–Kuhn functor).

### 4.24 Kuhn’s telescopic Tate vanishing

For n≥1, every finite group G and every T(n)-local spectrum X with coherent G-action, L_(T(n))(X^tG)=0. Equivalently L_(T(n))(X_hG)→X^hG is an equivalence. In particular the norm sequence becomes split after T(n)-localization. A raw Tate spectrum of a T(n)-local object need not vanish.

(cm-tate line 118, Theorem 2.6 and Corollary 2.7, pp.3–4; kuhn-tate line 151, Theorem 1.5 and Corollary 1.7, manuscript pp.4–5.)

A proof route is as follows. Apply the Bousfield–Kuhn functor, with one suspension shift as required, to the unstable Kahn–Priddy section. Obtain a localized stable transfer section at every prime-order group, then use the transfer criterion and finite-group reduction. Use the local-category cofiber convention to state the conclusion; raw Tate vanishing is not inferred.

**Checks.**

- At height zero in a p-local rational category norm equivalence is elementary averaging.
- For X=KU_p^∧ and G=C_p with trivial action, raw Tate can be nonzero while its T(1)-localization vanishes.
- G=1; n=1,X=KU_p^∧ with C_p action trivial: raw Tate for G=1=0; KUp raw Tate has p-inverted part while its T(1)-local value=0.

*Needs:* §4.23 (Localized transfer splitting); §4.11 (Bousfield–Kuhn functor); §4.22 (Localized norms and Tate spectra).

### 4.25 Finite-local Tate blueshift

For n≥1, if X is L_n^(p,f)-local with a coherent C_p-action, then its raw Tate spectrum X^tC_p is L_(n−1)^(p,f)-local. The p-local Hℚ finite convention satisfies the corresponding statement. This lowers the upper finite-height bound by one and permits a further drop; it asserts neither zero Tate nor exact height n−1 for every X.

(cmnn24 line 101, Introduction preceding Theorem C, p.3; proof of Theorem 4.10, p.21; lmmt line 694, Remark 3.9, pp.1025–1026.)

A proof route is as follows. Use finite duality to commute finite type spectra past the finite-group Tate functor. Apply localized Tate vanishing to the periodic pieces of the finite-local sphere and assemble the finite chromatic cofiber decomposition. Prove that the remaining raw Tate module lies in the lower finite-local category, with its actual coherent action; this is the lower-locality statement of CMNN preceding Theorem C and its use in LMMT Remark 3.9.

**Checks.**

- An input of lower height is permitted; exact height loss is not guaranteed.
- The n=1 output is p-inverted, or rational when the input is p-local.
- n=1; X=0; X rational with finite trivial action: target localization is p-inversion; Tate(0)=0; rational Tate=0, so height loss can exceed one.

*Needs:* §4.24 (Kuhn’s telescopic Tate vanishing); §4.6 (Finite localization kernels); §4.22 (Localized norms and Tate spectra); §4.5 (Finite chromatic localizations).

### 4.26 Morava power operations

For height-(h+1) Morava E-theory E with π₀E=W(F_(p^(h+1)))[[u₁,…,u_h]] and a K(h+1)-local E∞ E-algebra R, use the weight-p operation P:π₀R→R⁰(BC_p) imported from StableHomotopyKTheoryPartII §§4.4–4.5 by restriction along BC_p→BΣ_p. The transfer generator in E⁰(BC_p)=E₀[[z]]/([p](z)) is [p](z)/z. For 1≤k<h, after reducing by I_(k+1)=(p,u₁,…,u_k), define g_(k+1) by [p](z)=z^(p^(k+1))g_(k+1)(z). If x maps to zero in π₀ of the iterated module quotient R/(p,u₁,…,u_k), then P(x) maps to zero in π₀ of R^BC_p/(p,u₁,…,u_k,g_(k+1)). These are module cofibers; no identification with ordinary ring quotients for arbitrary R is assumed. For R=E the regular coefficient case gives the quotient ring operation used in the valuation calculation. The k=0 Bockstein case is part of the Hahn proof target, rather than attributed to the printed k≥1 theorem.

(hahn line 62, §2, pp.3–4; Theorem 1.6, p.2; Theorem 3.3, p.5 and proof pp.7–8; Definition 4.1, p.8.)

A proof route is as follows. Use the supplied degree-zero power operation and transfer ideal, and calculate the transfer generator in the chosen complex orientation. Apply Hahn Theorem 3.3 in its range k≥1 to the iterated module cofibers; its equivariant Bockstein section after the g quotient gives the zero-detection assertion. Prove the k=0 reduction directly from additivity modulo (p,transfer), rather than substituting it into the k≥1 theorem.

The interface includes:

- The transfer ideal in E⁰(BC_p) is generated by [p](z)/z in the specified Morava coordinate.
- The quotient operation has the module-cofiber zero-detection property just stated. In the regular even coefficient case it gives the corresponding ring quotient operation; compatibility with the chosen Morava coordinate is explicit.

**Checks.**

- Two plausible wrong models are unital and multiplicative but fail a stated law. The pulled-back identity x↦c(x), c the map induced by BC_p→point, has basepoint restriction res P(2)=2 rather than 2^p=4 at p=2. The pulled-back power x↦c(x^p) is not additive modulo the transfer ideal: at p=2 additivity would force c(4)≡P(1)+P(1)=2, but c(4)−2=c(2) is nonzero in E⁰(BC₂)/([2](z)/z), a free E₀-module of rank 2^(h+1)−1 having 1 as a basis element.
- Additivity is required only after quotienting by the transfer, so P(x+y)=P(x)+P(y) is not imposed in the original target.
- The quotient [p](z)/z^(p^(k+1)) is formed only after reducing by I_(k+1), not as an integral power series in the original ring.
- For scalar 2 in the Morava E coefficient ring, basepoint restriction of P(2) is 4 at p=2 and 8 at p=3, while restriction of P(1)+P(1) is 2. The full cohomology difference belongs to the transfer ideal and has basepoint value 2 or 6, respectively. Those integer restrictions are not themselves identifications of the cohomology transfer with a constant class. At p=2, P(2)=2+tr(1), whereas the constant class c(2) remains nonzero modulo the transfer ideal; replacing tr(1) by c(2) would contradict the first Check (hahn line 53, weight-p operation and transfer quotient; StableHomotopyKTheoryPartII §§4.4–4.5).
- p=2,h=2,k=1; P(2): [2](z) mod2 starts u₁z²+_F u₂z⁴+_F z⁸; mod(2,u₁), g₂ has constant u₂; res P(2)=4 at p=2 and 8 at p=3, versus res(P(1)+P(1))=2; the full transfer differences restrict to 2 and 6.

*Needs:* StableHomotopyKTheoryPartII §§4.4–4.5 (Degree-zero power operation; The transfer ideal for a prime power operation); EllipticCohomology E2, with the all-height extension in the supplier contract; §4.22 (Localized norms and Tate spectra); BordismFormalGroups F1–F3; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 4.27 Hahn’s acyclicity theorem

For a unital H∞ ring spectrum R and h≥0, K(h)⊗R=0 implies K(h+1)⊗R=0; in particular this holds for every E∞ ring. Consequently T(h)⊗R=0 implies T(h+1)⊗R=0 for h≥0, with T(0)=S[1/p]. For h≥1 translate by the ring-spectrum comparison; at h=0 use S[1/p]-acyclicity⇒Hℚ-acyclicity, not the false equality of these acyclic classes on all spectra. The height-zero proof includes the following power-operation input: in a K(1)-local H∞ algebra over height-one Morava E, if p^m x=0 for some m≥0, then x is nilpotent. This estimate is constructed here from the extended-power operations.

(hahn line 19, Theorems 1.1 and 1.3, p.1; §4, Propositions 4.2–4.5 and Theorem 4.6, pp.8–10; may-nilpotence line 107, Theorem 2.1 and Lemma 2.2, pp.3–4.)

A proof route is as follows. After base change to height-(h+1) Morava E and K(h+1)-localization, K(h)-acyclicity gives a nilpotent u_h modulo the lower invariant ideal. Apply the quotient operation and the Weierstrass/Eisenstein valuation descent until the unit vanishes. At h=0 use the height-one power-operation nilpotence estimate of Mathew–Naumann–Noel Theorem 2.1; its extended-power construction is part of this target. Completeness then gives the zero K(h+1)-local algebra. For H∞ input, use its D_p-algebra structure, namely the unital factorization of p-fold multiplication through homotopy C_p-orbits (hahn line 22, Definition 1.2 and Theorem 1.3, p.1); construct the Morava-specific weight-p operation and its module-cofiber compatibility as in Hahn §§2–4. These arguments require only D_p, so the same descent applies. Translate positive telescopes by the ring-acyclicity theorem, whose unit-nilpotence proof also applies to homotopy unital rings (lmmt line 332, Remark 2.4, p.1017).

**Checks.**

- The theorem cannot be extended to an arbitrary E₁ ring by omitting power operations.
- The h=0 implication is valid for HF_p, which is nonzero but acyclic at all finite Morava heights.
- R=H𝔽_p,Hℚ; h=0,1: all finite K(i) of H𝔽_p=0; K(0)Hℚ≠0 but K(1)Hℚ=0; implication is one-way.

*Needs:* §4.26 (Morava power operations); §4.4 (Ring-spectrum acyclicity comparison); EllipticCohomology E2, with the all-height extension in the supplier contract; BordismFormalGroups F6.2–F6.3.

### 4.28 Chromatic height of a commutative ring

For an E∞ ring R define ht_p(R)=inf{n∈Z | n≥−1 and T(n+1)⊗R=0}, valued in {−1,0,1,…,∞}; an empty set has infimum ∞. Hahn’s theorem makes the vanishing heights an upper interval. This definition uses T(0)=S[1/p] at the bottom, even for a ring not p-local; it differs from geometric height of an oriented formal group.

(lmmt line 150, Introduction, chromatic height discussion, pp.1013–1014; hahn line 19, Theorem 1.1, p.1.)

A proof route is as follows. Use the well-order of integers at least −1 and the upward-closed vanishing set. Obtain threshold characterizations and monotonicity under E∞ maps from the induced module action.

The interface includes:

- For n≥−1, ht_p(R)≤n iff T(n+1)⊗R=0.
- An E∞ map R→S implies ht_p(S)≤ht_p(R).
- The height is ∞ iff every finite-height telescope has nonzero tensor with R.
- Height −1 is T(0)-acyclicity, not a criterion that R itself is zero.

**Checks.**

- ht_p(HF_p)=−1 despite HF_p≠0.
- ht_p(Hℚ)=0.
- For q≠p, ht_p(HF_q)=0 with this all-spectra convention, although its p-localization is zero.
- R=0,H𝔽_p,Hℚ,H𝔽_q at q≠p: heights −1,−1,0,0; only the last has zero p-localization but survives global p-inversion.

*Needs:* §4.27 (Hahn’s acyclicity theorem); §4.1 (Telescopes).

### 4.29 Tate height converse

For an E∞ ring R with trivial C_p-action and i≥0, if L_(T(i))(R^tC_p)=0 then L_(T(j))R=0 for every j≥i+1. In particular T(i)-acyclicity of the trivial-action Tate spectrum forces T(i+1)-acyclicity of R. The action and coherent commutative structure are part of the hypotheses; no claim is made for an arbitrary group action on an arbitrary spectrum.

(cmnn24 line 827, Theorem 4.6 and Lemma 4.7, pp.19–20; hahn line 432, Corollary 4.6.1 and Proposition 4.7, pp.9–10.)

A proof route is as follows. Use the ring-acyclicity comparison and Hahn to reduce to a K(i+1)-local Morava E-algebra. Prove the trivial-action base-change identity R^tC_p≃R⊗_E E^tC_p in this case. The coefficient calculation of CMNN Lemma 4.7 makes the Laurent residue-field extension faithfully flat, so its vanishing reflects the K(i)-acyclicity of R. Hahn then forces the K(i+1)-local algebra to be zero; iterate for larger j. The i=0 rational case is retained in the same theorem.

**Checks.**

- At p=2 take R=KU₂^∧ with trivial C₂-action. Then π₀(R^tC₂)=ℤ₂[[x]][x⁻¹]/([2](x))=ℤ₂((x))/(x−2)≅ℚ₂ for the multiplicative formal group law [2](x)=2x−x², so R^tC₂[1/2]≠0 and the i=0 hypothesis fails, consistently with L_(T(1))R≠0. At i=1 the same Tate spectrum is rational, so its T(1)-localization vanishes, and indeed L_(T(j))R=0 for every j≥2: the conclusion starts exactly at height i+1.
- R=0; rational R; i=0: Tate(0)=0 and all T(j)R=0; rational Tate=0 and every positive T(j)R=0.

*Needs:* §4.22 (Localized norms and Tate spectra); §4.27 (Hahn’s acyclicity theorem); EllipticCohomology E2, with the all-height extension in the supplier contract; §4.4 (Ring-spectrum acyclicity comparison); §4.26 (Morava power operations).

### 4.30 Chromatic bounds for modular forms

For each prime, Tmf_(p) and TMF_(p) are L₂-local. The maps tmf→Tmf are T(n)-equivalences for all n≥1, both spectra are T(n)-acyclic for n≥3, and Tmf→TMF is a T(2)-equivalence. Consequently tmf→TMF→L_(K(2))TMF are T(2)-equivalences. These statements concern the input spectra; their algebraic K-theory consequences stay with the purity consumer.

(lmmt line 1002, Corollary 4.21 proof, p.1032; behrens line 1048, Propositions 1.6.8 and 1.6.12; chromatic fracture, pp.29–32.)

A proof route is as follows. Apply the uniform height-two locality theorem to each affine elliptic chart, including the height-one nodal boundary, and use descent. The positive-height connective-cover comparison handles tmf→Tmf. For the periodic open, spectral affineness commutes T(2) with global sections (mm line 1729, Theorem 7.2, pp.35–37); the height-two support misses the nodal boundary, so its restriction to the discriminant open is an equivalence. Use the surviving class Δ²⁴ and compare T(2) with K(2) only on L₂-local spectra.

**Checks.**

- The T(2)-equivalence is not a claim that Tmf and TMF are equivalent spectra.
- There is no assertion that the connective tmf spectrum itself is L₂-local.
- p=2,3; tmf,Tmf,TMF; n=2,3: T(2) comparison goes through compactified and smooth models; T(3) coefficient values=0; Δ²⁴ degree=24·24=576.

*Needs:* EllipticCohomology E1–E4 and E6, with the spectral comparisons in the supplier contract; §4.18 (Finite-height locality); §4.19 (Telescopes on chromatically local spectra); §4.3 (Telescope acyclicity criteria); ModularCurves §7E (p-divisible groups and formal heights).

### 4.31 Hopkins–Mahowald Thom theorem

For a prime p, the double-loop map Ω²S³→BGL₁(S_p^∧) selected by the unit 1−p has Thom E₂-ring HF_p. Restricting to Ω²(S³⟨4⟩), where S³⟨4⟩ is the fiber of the identity-on-π₃ map S³→K(ℤ,3), gives Hℤ_p. The index follows §4.13: S³⟨4⟩ is the 3-connected cover, killing π₃, while S³⟨3⟩=S³. These are Thom colimits of lines over S_p^∧. At p=2 there is also the integral sign map Ω²S³→BO→BGL₁S; its Thom ring is HF₂, and after 2-localization its connected-cover restriction has Thom ring Hℤ_(2). This 2-local connected-cover model gives the James family used below.

(thom line 400, §3, Definition 3.1, Theorem 3.5 and Proposition 3.16; §5, Theorems 5.1 and 5.7 (v4); akq line 186, §2.1, pp.5–6, for the sign construction, with the connected-cover identification taken 2-locally; thom line 847, Theorem 5.7, p.21, for the completed identification.)

A proof route is as follows. Use the module-colimit Thom universal property to identify the double-loop Thom algebra with the versal E₂ algebra of characteristic p. Its mod-p homology, with the actual Dyer–Lashof operations and Bockstein generator, identifies it with HF_p. For the connected-cover restriction, use the intermediate Thom construction over S¹ and the integral characteristic-p quotient calculation. Compare ordinary and p-complete Thom models for these connective finite-type sources by their degreewise finite homotopy and increasing cell connectivity. At 2 the sign construction gives HF₂; its connected-cover restriction gives Hℤ_(2) after 2-localization. Its rational homology is ℚ in degree zero, and its 2-completion is Hℤ₂; these identify the 2-local connective finite-type model.

**Checks.**

- At p=2 the chosen unit 1−p is −1.
- The p-complete-base and unlocalized integral-base connected-cover Thom objects have π₀=ℤ_p and ℤ, respectively; the 2-local sign variant has π₀=ℤ_(2). Equality of π₀ does not identify the unlocalized object with Hℤ.
- At p=3 the sign twist on the connected cover is null after localization: its Thom spectrum retracts onto S_(3), whose π₃=ℤ/3, while π₃Hℤ_(3)=0. This excludes an integral Hℤ equivalence.
- The fiber S³⟨4⟩ of S³→K(ℤ,3), identity on π₃, has zero π₂ and π₃, and π₄=π₄S³=ℤ/2; under §4.13 S³⟨3⟩ is S³ itself with π₃=ℤ, so the cover index 4 is forced. Replacing the target by K(ℤ_p,3) gives π₂=ℤ_p/ℤ.
- p=2; completed and integral cover variants: unit 1−2=−1; π₀ Thom values 𝔽₂,ℤ₂,ℤ; fiber(S³→K(ℤ,3)) has π₂=0, whereas target K(ℤ₂,3) gives π₂=ℤ₂/ℤ.

*Needs:* EllipticCohomology E5, with the module-colimit extension in the supplier contract; §4.13 (Postnikov and connected-cover conventions); HomotopySpheres §3B, with the stable splitting contract; StableHomotopyKTheory Layers 3–7; BordismFormalGroups F6.1; HomotopySpheres §4C; gap:spectral-units-and-lines; gap:relative-thom-colimit; gap:multiplicative-thom-refinement.

### 4.32 James-filtered Thom spectra

For m≥0, restrict Ω²S³→BGL₁(S_p^∧), selected by 1−p, to ΩJ_(p^m−1)S² and call the Thom E₁-ring y(m). Then y(0)=S_p^∧, π₀y(m)=𝔽_p for m≥1, and colim_m y(m)≃HF_p. At p=2 define z(m), m≥1, using the integral sign Thom map Ω²S³→BO→BGL₁S, restricted to Ω(J_(2^m−1)S²⟨3⟩), and then 2-localize. Here J_rS²⟨3⟩ is the fiber of J_rS²→K(ℤ,2), inducing the identity on π₂; in the indexing of §4.13 it is the 2-connected cover, killing π₂, while J_rS²⟨2⟩=J_rS². Thus π₀z(m)=ℤ_(2), colim_m z(m)≃Hℤ_(2), and the integral sign reduction followed by completion gives z(m)→y(m). The y and z families have different coefficient models; both are connective E₁-rings.

(lmmt line 948, Thom construction preceding Lemma 4.15, p.1031; akq line 236, Construction 2.1 and Lemma 2.2, pp.5–6.)

A proof route is as follows. Restrict the unit-classifying loop map to the actual James stages and apply the monoidal Thom colimit, retaining all E₁ maps. Connectivity of the word-length filtration identifies the filtered colimit with the double-loop Thom model. For the integral sign family use the fiber of the identity-on-π₂ truncation J_rS²→K(ℤ,2) before forming the integral Thom object, then localize at 2. This gives colimit Hℤ_(2). Compare the sign map with its 2-complete base change to obtain z(m)→y(m), and compute π₀ from the actual source connected covers.

The interface includes:

- James inclusions induce E₁ maps compatible with the maps to the colimit Thom ring.
- The y(0) object is S_p^∧ by the trivial Thom-line computation.
- For m≥1, π₀y(m)=𝔽_p, while the integral 2-local family has π₀z(m)=ℤ_(2).
- The z(m)→y(m) square agrees with Hℤ_(2)→HF₂ after passing to the colimit.

**Checks.**

- At m=0, y(0)=S_p^∧ has π₀=ℤ_p; the assertion π₀=𝔽_p starts at m=1.
- At p=2,m=1, J₁S²=S²; z(1) uses S²⟨3⟩, the fiber of S²→K(ℤ,2), whose π₂ is 0 and whose π₃ is ℤ (it is S³ via the Hopf map). The cover S²⟨2⟩=S² would keep π₂=ℤ, and its loop space would have π₁=ℤ, so this index matters.
- The integral family has π₀z(m)=ℤ_(2) and colimit Hℤ_(2), while the p-complete y family has π₀=𝔽_p for m≥1.
- m=0,1;p=2; integral z(1): y(0)=S₂^∧, π₀=ℤ₂; J₁S²=S²; π₀y(1)=𝔽₂, π₀z(1)=ℤ_(2).

For every m≥1 prove T(i)⊗y(m)=0 for 0≤i<m. At p=2 prove T(i)⊗z(m)=0 for 1≤i<m; the bottom height is excluded for z(m). These are twisted Thom acyclicity statements, distinct from the untwisted James splitting in §4.33 (lmmt line 948, Lemma 4.15 and proof, p.1031; lmmt line 973, proof of Corollary 4.18, p.1031; akq line 632, Proposition 2.22, manuscript p.15).

For the odd-prime route, prove the following vanishing-line input for these Thom spectra. For odd p, m≥1 and a finite p-local type-i spectrum V_i with 1≤i<m, the mod-p Adams spectral sequence of V_i⊗y(m) converges strongly to its p-completed homotopy groups and has a vanishing line of slope 1/(2p^m−2) in coordinates (t−s,s): above s=(t−s)/(2p^m−2)+c its terms vanish, for some real c≥0 depending on V_i and m. Compare this bound with the v_i-action of slope 1/(2p^i−2); prove that each homotopy class is killed by some iterate of the self-map, so its telescope is zero. All denominators are positive since m,i≥1 and p≥3 (lmmt line 954, proof of Lemma 4.15, p.1031).

A proof route for acyclicity is as follows. The equality π₀y(m)=𝔽_p makes multiplication by p null as a y(m)-module map, so y(m)[1/p]=0. At odd primes apply the vanishing-line input and its strict slope inequality for i<m. At two compute the Q_i-Margolis homology of mod-2 homology: it is zero for y(m) when 0≤i<m and for z(m) when 1≤i<m. Use the convergent localized Adams comparison to obtain K(i)-acyclicity for positive i, then §4.4 to obtain T(i)-acyclicity. Compare the completed AKQ models with these connective finite-type models: p-completion is a T(i)-equivalence for i≥1 by §4.3. This transports positive-height acyclicity, without transporting a completed π₀ assertion to the uncompleted z(m).

**Checks.**

- For m=1 the positive range 1≤i<m is empty; at p=3 the vanishing-line slope is 1/(6−2)=1/4 but there is no positive i to compare. The value y(1)[1/p]=0 still holds, while π₀(z(1)[1/2])=ℤ_(2)[1/2]=ℚ≠0. A bottom-height assertion for z(1) would fail.
- For m=2,p=2 the positive range consists exactly of i=1: Q₁-Margolis homology vanishes for both families, hence T(1)⊗y(2)=T(1)⊗z(2)=0. In contrast T(0)⊗y(2)=0 and π₀(T(0)⊗z(2))=ℚ.
- For p=3,m=2,i=1 the vanishing-line slope is 1/(18−2)=1/16, whereas the v₁ slope is 1/(6−2)=1/4. The strict difference 3/16 forces each iterated class above the line; at i=m both slopes are 1/16, so this argument asserts no vanishing there.
- For p=5,m=2,i=1 the slopes are 1/(50−2)=1/48 and 1/(10−2)=1/8; their difference is 5/48>0. Both denominators are nonzero, and the positive slope difference gives v₁-power torsion; replacing i<m by i≤m would lose this strict inequality.

*Needs:* HomotopySpheres §3B, with the stable splitting contract; EllipticCohomology E5, with the module-colimit extension in the supplier contract; §4.31 (Hopkins–Mahowald Thom theorem); §4.13 (Postnikov and connected-cover conventions); §4.3 (Telescope acyclicity criteria, including completion invariance); §4.4 (Ring-spectrum acyclicity comparison); BordismFormalGroups F6.3 (periodicity, Margolis homology and Adams comparisons); gap:relative-thom-colimit; gap:multiplicative-thom-refinement.

### 4.33 Acyclicity under the James splitting

For every spectrum E and every connected pointed CW space W, if E⊗Σ∞W=0 then E⊗Σ∞ΩΣW=0. Apply the reduced stable James splitting: each summand E⊗Σ∞W^∧r vanishes for r≥1. In particular take E=T(n−1)∨T(n), n≥1; any connected pointed CW space W whose reduced suspension spectrum is a finite p-local spectrum of type m>n meets this hypothesis; finite p-primary-torsion CW examples are included.

(lmmt line 919, Corollary 4.14 proof, p.1030.)

A proof route is as follows. Smash the stable James splitting with E. Every positive smash power of W is E-acyclic because tensoring is associative. Tensor and coproduct commute; all terms of the wedge vanish.

**Checks.**

- The wedge starts at k=1, so no sphere summand invalidates the vanishing.
- For n=1 the lower detector is S[1/p], with its specified convention.
- At p=2,n=1, adjoining a mod-3 Moore space M(ℤ/3,1) to a 2-primary type-2 example leaves 2-local type unchanged but contributes ΣS/3≠0 after inverting 2. The integral wedge fails the hypothesis. A p-local finite spectrum of type at least 2 instead has p-inversion zero.
- W=*; E=Hℚ; W=S²: reduced James sum of *=0; for S² the summands are S^(2r), r≥1, so rational homology is ℚ in positive even degrees and not acyclic.

*Needs:* HomotopySpheres §3B, with the stable splitting contract; §4.3 (Telescope acyclicity criteria); BordismFormalGroups F6.2–F6.3.

### 4.34 Ordinary-homology detection of the H∞ unit

For a unital H∞ ring spectrum B (in particular an E∞ ring), B=0 if and only if B⊗Hℚ=0 and B⊗H𝔽_q=0 for every rational prime q. The reverse direction is the unit-detection consequence of Hahn acyclicity and Morava-height nilpotence. For a commutative algebra object R in a symmetric monoidal stable category C and a thick tensor ideal J, apply it to B=Hom_(C/J)(1,R), the spectrum of maps from the tensor unit to the image of R. Multiplication on R induces the unital E∞ multiplication on B. If B=0, the unit η:1→R is null and the unital law id_R=μ∘(η⊗id_R) forces R=0. Testing only the fixed chromatic prime p does not suffice.

(may-nilpotence line 47, Theorem B, p.2, unit-detection consequence; cmnn20 line 798, Proof of Theorem 4.2, p.19.)

A proof route is as follows. For each prime q, B⊗Hℚ=0 gives K(0)-acyclicity of B_(q). Apply §4.27 in its H∞ form at q to deduce K(n)⊗B_(q)=0 for every finite n≥1. The hypothesis at q supplies the remaining height ∞, namely H𝔽_q. BordismFormalGroups F6.3 then makes the unit of B_(q) nilpotent, so B_(q)=0. Vanishing at every prime implies B=0, since an abelian group whose localizations at all primes vanish is zero.

**Checks.**

- H𝔽₂ has zero rational and mod-3 homology but nonzero mod-2 homology.
- In Perf(ℚ), with J=0 and R=ℚ×ℚ, B=Hom(ℚ,R)=H(ℚ×ℚ) has product (a,b)(c,d)=(ac,bd). Ambient End_ℚ(R)=M₂(ℚ) instead has E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂, excluding it as a commutative mapping algebra. For R=0, η=0 and id_R=μ∘(η⊗id_R)=0.
- At q=2, H𝔽₂ is killed by every finite K(n), including K(0), but H𝔽₂⊗H𝔽₂ has π₀=𝔽₂; omitting height ∞ would give a false unit-detection criterion.
- R=0,Hℚ,H𝔽₂; coefficient primes 2 and3: all ordinary homologies of 0=0; Hℚ detects itself; H𝔽₂ has H𝔽₂-homology nonzero and rational/H𝔽₃-homology 0.

*Needs:* EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; §4.27 (Hahn’s acyclicity theorem, H∞ form at every prime); BordismFormalGroups F6.2–F6.3 (Morava-height nilpotence including height ∞).

### 4.35 Nonpositive nilpotent invariance

For a discrete unital ring A and nilpotent two-sided ideal I, Kⱼ(A)→Kⱼ(A/I) is an isomorphism for every j≤0. This is the Bass induction extending K₀ nilinvariance, whose owner remains KTheoryLowDegrees §§1.1–1.3; no positive-degree integral nilinvariance is asserted.

Throughout this target, A is discrete unital; I is a nilpotent two-sided ideal; j≤0.

(lmmt line 858, Example 4.8, p.1029.)

A proof route is as follows. Use the imported lifting of idempotents/projectives modulo nilpotent ideals to compare K₀. Apply Bass’s polynomial/Laurent fundamental sequence to A and A/I; their extended ideals remain nilpotent. Induct down all negative degrees and compare the actual quotient-induced maps.

**Checks.**

- For Z/p^r→𝔽_p all negative groups vanish and K₀ identifies with Z.
- A = ℤ/4,ℤ/9; j=0,−1; I=0: K₀=ℤ→ℤ=id; K₋₁=0→0; zero ideal quotient=id.

*Needs:* KTheoryLowDegrees §§1.1–1.3 and 13.1; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16.

### 4.36 Continuous Witt operations on NK

Let R be commutative and A a unital R-algebra. The groups NKⱼ(A)=ker(Kⱼ(A[x])→Kⱼ(A)), j∈Z, carry a natural continuous module action of the existing big Witt ring W_N>0(R), imported from QWittVectors §§1.1–1.6. Each individual element is killed by the kernel of a sufficiently long initial-segment Witt truncation. Construct the action through the reduced endomorphism ring End0(R) and nilpotent endomorphism categories; negative degrees use GeneralAlgebraicKTheory’s Bass contraction, not an invented connective-only NK.

Throughout this target, R is commutative and A is a unital R-algebra; j is any integer.

(weibel line 186, Theorem 2.3, p.473; Theorem 3.1 and Exercise 3.2, pp.474–475.)

A proof route is as follows. Construct the endomorphism-ring pairing with the nilpotent-endomorphism category in the characteristic-series convention. The finite nilpotence filtration forces each positive-degree class to factor through one finite Witt truncation, as in Weibel Theorem 3.1. Extend to negative degrees by Bass contraction: represent a contracted class by finitely many classes over central polynomial and Laurent extensions, choose one truncation annihilating all representatives, and descend along the natural contraction maps. This gives continuity in every integer degree and preserves the symbol law a(νx). The characteristic series is χ=γ_∞⁻¹ for QWittVectors §1.4a's comparison γ_∞. Prove its ghost identity −tχ′/χ=∑_(n≥1)w_n(a)t^n over every commutative ring: over the torsion-free universal coordinate ring, −t d/dt log∏_d(1−a_dt^d)=∑_d∑_(k≥1) d·a_d^k t^(dk), whose t^n coefficient is ∑_(d∣n) d·a_d^(n/d)=w_n(a); both sides have integral coefficients, so the identity specializes along the coefficient naturality of γ_∞.

The interface includes:

- NKⱼ(A) is a continuous W_N>0(R)-module for every integer j.
- For every ξ∈NKⱼ(A), some initial-segment restriction kernel of W(R) annihilates ξ.
- Maps of R-algebras commute with the NK action and the induced Witt-ring map.
- Use the characteristic-series convention det(1−tf). For nilpotent ν the Witt action of a(t) on [1−νx] is the class [a(νx)] in NK1(A); the finite evaluation retains x. In particular the series 1−rt sends this class to [1−rνx].

**Checks.**

- For a regular noetherian A, NKⱼ(A)=0 and the action is the unique module structure on zero.
- In A=𝔽₃[ε]/ε², with ν=ε and Witt unit a=(1,0,…), χ(a)(εx)=1−εx and the action fixes [1−εx]. The competing 1+εx differs by 2εx≠0, while both evaluate to 1 at x=0. Over 𝔽₂ the signs coincide, so the prime-three computation is necessary.
- For A = R[ε]/ε², the series 1−rt sends [1−εx] to [1−rεx], and every series congruent to 1 modulo t² acts as zero on this symbol. Evaluating at ε alone gives a constant unit and must fail the NK1 formula.
- The operation on NK_(−1) agrees with contraction of the operation on NK₀ under the Bass fundamental sequence.
- For an NK1 symbol [1−νx] and a Witt characteristic series a(t), substitute νx into the series, so evaluation at x=0 is the identity automorphism.
- The Witt zero and one have characteristic series 1 and 1−t, respectively; acting on [1−νx] therefore gives the zero NK class and [1−νx]. Over 𝔽₂ the inverse series (1−t)⁻¹ has t² coefficient 1, while χ(1)=1−t has t² coefficient 0.
- Ghost identity at a=τ(c): χ=1−ct gives −tχ′/χ=ct/(1−ct)=∑c^nt^n, matching w_n(τ(c))=c^n. For a=(0,1) over ℤ, χ=1−t² gives −tχ′/χ=2t²+2t⁴+⋯, matching w₁=0, w₂=2; using γ_∞ in place of χ would give the negatives.
- ν=ε in k[ε]/ε²; a(t)=1−rt; ν=0; j=−1 on regular k: a(νx)=1−rεx, value at 0=1; ν=0 gives 1; NK₋₁(k)=0; χ(0)=1, χ(1)=1−t; at p=2 the t² coefficients of χ(1) and its inverse are 0 and 1.

*Needs:* GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16; QWittVectors §§1.1–1.6, including §1.3 (Big Witt rings), §1.4 (Frobenius, Verschiebung and Teichmüller maps) and §1.4a (Big Witt power-series comparison).

### 4.37 Weibel localization and p-power nilpotent invariance

For a unital Z[1/p]-algebra A, multiplication by p is an isomorphism on NKⱼ(A) for every j∈Z; hence the spectrum NK(A)=fib(K(A[x])→K(A)) is uniquely p-divisible and NK(A)^∧p=0. If p^r=0 in A, each NKⱼ(A) is p-primary torsion. If I⊂A is nilpotent and p^r=0 in A, every relative Kⱼ(A,I) is p-primary torsion, so K(A)→K(A/I) is a rational equivalence.

Throughout this target, the unique p-divisibility claim requires p invertible in A. The torsion and relative nilpotent claims instead require p^r=0 in A.

(weibel line 236, Corollary 3.3(a),(d), p.475; Corollary 5.4, p.485 and its preceding comparison argument, pp.482–485.)

A proof route is as follows. For R=Z[1/p], multiplication by p on big Witt vectors is invertible: in the characteristic power-series model it is the pth power map, whose inverse is solved recursively because p is a unit in R. Apply the continuous action to each NK group; multiplication by p on a spectrum is an equivalence exactly when it is so on every homotopy group. When p is nilpotent in A, use the finite Witt-filtration annihilator of each element to obtain a p-power annihilator. For nilpotent I, use the simplicial polynomial/Karoubi–Villamayor comparison: the higher Nil terms are p-primary torsion, and the polynomial-homotopy invariant quotient is nilinvariant. Its relative comparison spectral sequence then makes all relative K groups p-primary; use Bass for nonpositive degrees.

**Checks.**

- For a singular Z[1/p]-algebra NK may be nonzero integrally even though its p-completion is zero.
- A = ℤ[1/2][ε]/ε²; A = 𝔽₂[ε]/ε²; ℤ/9→𝔽₃: ×2 on ε-coefficients has inverse ×1/2 in first case; ×2=0 on 1+εx in second; relative K₁(ℤ/9,(3))=1+3ℤ/9 has order 3.

*Needs:* §4.36 (Continuous Witt operations on NK); GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16; §2.4 (Nonpositive K-theory of connective rings); SchemeKTheoryOperations §§1.1–2.7, 3.1–3.5, 4.1–4.3, 4.12 and 5.2–5.9; gap:kv-relative-comparison; gap:kh-nilpotent-invariance.

### 4.38 Highly connective chromatic invariance

For each n≥1 there is a bound N(n) such that an N(n)-connective map A→B of connective E₁-rings that is an L_n^(p,f)-equivalence induces an L_n^(p,f)-equivalence K(A)→K(B). One may choose N=m−1 from the chromatic fiberwise-detection bound used in LMMT Proposition 3.1. Connectivity is a property of the underlying fiber spectrum.

Throughout this target, n≥1; the ring map is connective E1, N(n)-connective and an L_n^(p,f)-equivalence.

(lmmt line 491, Proposition 3.1 and proof, pp.1021–1022.)

A proof route is as follows. Pass from A→B to the matrix and stabilized general-linear comparison, retaining the connectivity bound. Use generalized fiberwise Serre detection to preserve the finite-localization equivalence on classifying spaces. Use Bousfield–Kuhn to detect positive telescopic equivalences through plus; treat the T(0) part by rational truncation.

**Checks.**

- The bound is uniform over ring maps at fixed n; the theorem does not claim every connective equivalence on telescopes already has this property.
- identity A→A; zero fiber; fixed n=1: fiber=0 is N-connective for every N; localized K(id)=id.

*Needs:* §1.1 (General linear groups of connective ring spectra); §2.3 (Rational and p-adic truncation); §4.12 (Detection by suspension and loops); §4.14 (Fiberwise homology comparison); §4.16 (Connective preservation by suspension and loops).

### 4.39 Connectivity of the replacement algebra

In a homotopy pullback square of E₁-rings A→B, A→A′, B→B′, A′→B′ with A connective, suppose both vertical maps are n-connective and both horizontal maps are m-connective, with m,n≥0. Then A′⊙_A^(B′)B→B′ is (m+n+2)-connective. The estimate concerns this comparison map, not a purported ordinary algebra tensor product.

Throughout this target, the square is a homotopy pullback; A is connective and m,n≥0. Both parallel vertical maps are n-connective and both horizontal maps m-connective.

(lmmt line 531, Lemma 3.2 and proof, p.1022.)

A proof route is as follows. Write I=fib(A→A′) and J=fib(A→B), which are connective A-bimodules in the indicated degrees. Identify the comparison fiber as Σfib(I⊗_A B→I), using the pullback square and its canonical splitting. Use the cofiber sequence for A→B and the connective tensor-product estimate to obtain the sum of the connectivity bounds.

**Checks.**

- If one side is an equivalence, the comparison is an equivalence; the finite estimate specializes accordingly.
- m=n=0; identity-side square: bound m+n+2=2; identity-side correction fiber=0 and is d-connective for every d.

*Needs:* RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; RefinedTraceMethods §4.14 (Square-zero extensions and linearization) for connective bimodules; GeneralizedCohomology G3 item 8 (spectral homotopy limits and Postnikov covers); gap:multiplicative-postnikov for the relative tensor connectivity bound.

### 4.40 One finite Postnikov stage suffices

Let F be weakly localizing and M a spectrum. If there is a fixed k≥0 such that F(R)→F(τ≤kR) is an equivalence for every connective M-acyclic E₁-ring R, then F is truncating on all such rings: F(R)→F(Hπ₀R) is an equivalence. This uses a uniform finite k; it is not an interchange of F with an infinite Postnikov limit.

Throughout this target, F is weakly localizing; k≥0 is uniform over all connective M-acyclic E₁-rings.

(lmmt line 555, Lemma 3.3 and proof, pp.1022–1023.)

A proof route is as follows. For k>0 use the square-zero extension description of the kth Postnikov step as a pullback. Apply the replacement-algebra invariant pullback square and its connectivity estimate to reduce the required cutoff. Iterate the finite reduction to k=0, checking M-acyclicity of the auxiliary unital rings through their module structures.

**Checks.**

- For k=0 the conclusion is precisely the assumption; the induction never assumes continuity of F.
- k=0; k=1; R=HA: τ≤₀R=Hπ₀R; k=1 uses one square-zero step; τ≤₁HA = HA.

*Needs:* §2.1 (Truncating invariants on acyclic rings); §4.39 (Connectivity of the replacement algebra); EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; RefinedTraceMethods §4.14 (Square-zero extensions and linearization); GeneralizedCohomology G3 item 8 (spectral homotopy limits and Postnikov covers); gap:multiplicative-postnikov.

### 4.41 Telescopic K is truncating on finite-acyclic rings

For n≥1 the invariant L_T(n)K is truncating on connective L_n^(p,f)-acyclic E₁-rings. In particular, if R is such a ring, L_T(n)K(R)≃L_T(n)K(π₀R).

Throughout this target, n≥1; R is connective E1 and L_n^(p,f)-acyclic.

(lmmt line 584, Proposition 3.4 and proof, p.1023.)

A proof route is as follows. Choose the uniform bound in highly connective invariance. For L_n^(p,f)-acyclic R, the map to that Postnikov stage has acyclic source and target and meets the connectivity bound. Apply the finite-stage-to-truncating lemma to F=L_T(n)K.

**Checks.**

- For n=1 this is only restricted truncation; the eventual statement for all K(1)-acyclic rings requires the height-one comparison and purity.
- R=H𝔽₂ at p=2; H𝔽₃ at p=3: Lₙ^(p,f)R=0; L_T(i)K(R)=0 for every positive i, by the finite-field completion Hℤ_p.

*Needs:* §4.38 (Highly connective chromatic invariance); §4.40 (One finite Postnikov stage suffices); §2.1 (Truncating invariants on acyclic rings); §4.5 (Finite chromatic localizations).

### 4.42 Finite p-power coefficient vanishing

For every r≥1 and i≥1, L_T(i)K(Z/p^r)=0. For every discrete associative ℤ/pʳ-algebra A and every i≥1, L_T(i)K(A)=0: the central scalar map makes K(A) a module over K(ℤ/pʳ). In the application to endomorphism rings, first reduce π₀R to an 𝔽_p-algebra using the nilpotent ideal generated by p.

Throughout this target, r≥1 and i≥1; A is any discrete unital associative ℤ/pʳ-algebra, with no additional acyclicity hypothesis.

(lmmt line 586, Corollary 3.5 and proof; proof of Proposition 3.6, p.1023.)

A proof route is as follows. Apply restricted truncating nilinvariance to Z/p^r→𝔽_p. The finite-field calculation gives K(𝔽_p)^∧p≃HZp; positive telescopes annihilate it. For every ℤ/pʳ-algebra use its K(ℤ/pʳ)-module structure and the fact that homological acyclicity passes from a ring spectrum to all its modules. The multiplicative interface is supplied explicitly before this consequence is used.

**Checks.**

- Every positive-height telescope kills K(𝔽_p); no vanishing is asserted at T(0).
- For A=𝔽₃[ε]/ε² and i=2, the K(𝔽₃)-module structure gives L_T(2)K(A)=0, independent of any auxiliary n; for A=0 the K-spectrum is zero.
- r=1,2 at p=2,3; j=0: K₀(ℤ/pʳ)=ℤ; K(𝔽_p)^∧p=Hℤ_p; positive-telescope values=0 while bottom rational K₀=ℚ.

*Needs:* §4.41 (Telescopic K is truncating on finite-acyclic rings); §2.2 (Excision and nilinvariance for truncating invariants); KTheoryFiniteLocalFields §§1.1–1.6 and 6.5a; §4.15 (Connective periodic vanishing); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7.

### 4.43 Acyclic additive and stable categories

Let n≥1 and C be small idempotent-complete additive. If every hom_C(X,X) is L_n^(p,f)-acyclic, then Kadd(C) is T(i)-acyclic for 1≤i≤n. If C is stable and every full End_C(X) is L_n^(p,f)-acyclic, then K(C) is T(i)-acyclic in the same range. The stable conclusion follows by the S-construction and does not import Levy’s chromatic additive comparison.

Throughout this target, n≥1; C is small idempotent-complete additive or stable as stated. Use connective hom endomorphisms in the additive case and full End spectra in the stable case.

(lmmt line 610, Proposition 3.6 and proof, pp.1023–1024.)

A proof route is as follows. Reduce additive C to one generator using filtered finite-generator subcategories. Apply additive Morita; the endomorphism ring R is connective and acyclic. Its π₀ has p-power characteristic because T(0)=S[1/p] is included. Apply truncation, nilinvariance and finite-field module vanishing to K(R). For stable C, finite-diagram mapping spectra are finite limits of cross Hom spectra, hence remain acyclic; delooping through S• and positive-height acyclicity of coconnective differences gives the full K statement.

**Checks.**

- The stable part tests all full End spectra; checking only π₀End or only mapping spaces is insufficient.
- C=0; C=Perf(H𝔽_p); additive finite projectives: endomorphism zero=0; H𝔽_p is finite-local acyclic; localized additive and stable K=0 at every i≥1.

*Needs:* §1.3 (Additive and stable Schwede–Shipley comparison); §4.41 (Telescopic K is truncating on finite-acyclic rings); §4.42 (Finite p-power coefficient vanishing); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; §4.15 (Connective periodic vanishing).

### 4.44 Compact chromatic kernel for ring modules

For any E₁-ring A and n≥0, the localization Perf(A)→Perf(L_n^(p,f)A) has compact kernel thickly generated by A⊗F, where F ranges over finite p-primary spectra of type greater than n. Thus K(C>n⊗Perf(A))→K(A)→K(L_n^(p,f)A) is a fiber sequence. The finite p-primary condition retains the correct global T(0)=S[1/p] convention.

Throughout this target, A is any E₁-ring; n≥0; finite kernel generators are p-primary of type >n.

(lmmt line 645, Lemma 3.7 and proof, pp.1024–1025.)

A proof route is as follows. Smashing localization commutes with A-modules and its kernel is generated by these finite tensors. Apply compact localization and identify End_A(A⊗F)≃DF⊗F⊗A. Use duality, thick closure and chromatic acyclicity to show all full mapping spectra in the kernel have the needed finite-localization acyclicity.

**Checks.**

- For n=0 the finite p-torsion generators yield p-inversion; replacing T(0) globally by Hℚ changes the kernel.
- A = S,n=0; A = 0; q≠p: S/p maps to 0 under p-inversion; S/q maps to S/q≠0; zero A gives zero kernel.

*Needs:* §0.1 (Thomason–Neeman localization); RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; §4.6 (Finite localization kernels); GeneralizedCohomology G2 and G5.1.

### 4.45 Mitchell vanishing and the p-inverted sphere

For every i≥2, L_T(i)K(Z)=0 and L_T(i)K(S[1/p])=0. The first follows from Mitchell’s stronger periodic vanishing, not from identifying T(i) with K(i) on all spectra. For the second use the localization K(𝔽_p)→K(Z)→K(Z[1/p]), then Waldhausen’s p-adic comparison K(S[1/p])→K(Z[1/p]).

Throughout this target, p is any prime and i≥2.

(mitchell line 52, Theorems A–B, pp.607–609; Theorem 3.8 and proof, pp.621–622; lmmt line 659, Proof of Theorem 3.8(ii), p.1025.)

A proof route is as follows. Use Mitchell’s factorization of the unit into K(Z) through the image-of-J space and its vanishing vn-periodic homotopy above height one. Apply the finite type-i ring-spectrum test: the image of a vn-element is nilpotent, so the corresponding telescope smash with K(Z) vanishes. Use Quillen localization and K(𝔽_p) positive-height vanishing, then apply the p-inverted sphere comparison.

**Checks.**

- This is a height≥2 theorem: K(Z) need not be T(1)-acyclic.
- i=2; ℤ and S[1/p]; i=1 negative control: L_T(2)K(ℤ)=L_T(2)K(S[1/p])=0; K(ℤ) has nonzero height-one part.

*Needs:* §2.3 (Rational and p-adic truncation); KTheoryFiniteLocalFields §§1.1–1.6 and 6.5a; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §4.2 (Periodic homotopy groups); §4.15 (Connective periodic vanishing).

### 4.46 Theorem A in both forms

For any E₁-ring A and n≥1, A→L_n^(p,f)A induces an equivalence on L_T(i)K for every 1≤i≤n. For n≥2, A→L_(T(1)∨⋯∨T(n))A also induces a T(n)-equivalence on K. The latter removes the T(0) part only after Mitchell vanishing; neither assertion is yet the two-adjacent-height Purity Theorem.

Throughout this target, A is any E₁-ring. Part (i) has n≥1 and 1≤i≤n; part (ii) has n≥2.

(lmmt line 101, Theorem A, pp.1012–1013; Theorem 3.8 and proof, pp.1024–1025.)

A proof route is as follows. Apply localization at the finite chromatic kernel and the acyclic-category theorem to prove the first part. Use the fracture square separating T(0) from T(1)∨⋯∨T(n) and the replacement-algebra pullback theorem. Kill the bottom p-inverted terms by their K(S[1/p])-module structures and Mitchell’s theorem.

**Checks.**

- The comparison is natural for arbitrary nonconnective E₁-rings. The second assertion is used only for n≥2.
- A = 0; A Lₙ^(p,f)-local; n=1,2: 0→0; K(A)→K(A) is id; bottom-removal range begins at 2.

*Needs:* §4.43 (Acyclic additive and stable categories); §4.44 (Compact chromatic kernel for ring modules); RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; §4.45 (Mitchell vanishing and the p-inverted sphere); §4.8 (Chromatic fracture squares).

### Examples

At p=2, H𝔽₃ distinguishes global p-inversion from rationalization: the two values are H𝔽₃ and 0. For k[ε]/ε², the Witt series 1−rt acts on the NK₁ unit 1−εx as 1−rεx, whose value at x=0 is 1. For ℤ/4→𝔽₂ and ℤ/9→𝔽₃, K₀ is ℤ on both sides; only the positive telescopic groups vanish. These examples fix the bottom convention, the polynomial variable and the degree boundary simultaneously.

### Dependencies

AlgebraicTopology Stages 4 and 8; BordismFormalGroups F1–F3; BordismFormalGroups F6.1; BordismFormalGroups F6.2; BordismFormalGroups F6.2–F6.3; BordismFormalGroups F6.4; EllipticCohomology E1–E4 and E6, with the spectral comparisons in the supplier contract; EllipticCohomology E2, with the all-height extension in the supplier contract; EllipticCohomology E5, with the module-colimit extension in the supplier contract; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; GeneralAlgebraicKTheory §§3.12–3.14, 6.9, 6.19, 7.1–7.7, 9.8–9.17, 10.1–10.13 and 11.15–11.16; GeneralizedCohomology G2 and G5.1; HomotopySpheres §3B, with the stable splitting contract; HomotopySpheres §4C; KTheoryFiniteLocalFields §0.4 (Height-one localization and realization); KTheoryFiniteLocalFields §§1.1–1.6 and 6.5a; KTheoryLowDegrees §§1.1–1.3 and 13.1; Layer 0; Layer 1; Layer 2; ModularCurves §7E (p-divisible groups and formal heights); QWittVectors §§1.1–1.6; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Connective K-theory of small stable ∞-categories; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; RefinedTraceMethods §§2.1–2.5; SchemeKTheoryOperations §§1.1–2.7, 3.1–3.5, 4.1–4.3, 4.12 and 5.2–5.9; StableHomotopyKTheory Layers 3–7.

## Layer 5: Trace comparison, CMNN vanishing and purity

### 5.1 High-height connective-cover invariance

For every E₁-ring A and n≥2, K(τ≥0A)→K(A) is a T(n)-equivalence. This follows from the T(0)-removed half of Theorem A and positive-height invariance of connective covers of spectra; it does not use CMNN vanishing or purity.

Throughout this target, A is any E₁-ring and n≥2.

(lmmt line 810, Corollary 4.2 and proof, p.1028.)

A proof route is as follows. The ring map τ≥0A→A is a T(i)-equivalence for every i≥1. Apply Theorem A(ii), so both sides have equivalent T(n)-local K-theory after localization at T(1)∨⋯∨T(n).

**Checks.**

- The height bound n≥2 is essential; no connective-cover invariance for T(1) is asserted.
- A = Hk; periodic A = KU; n=2: τ≥₀Hk=Hk; τ≥₀KU=ku; L_T(2)K(ku)→L_T(2)K(KU) has zero fiber.

*Needs:* §4.46 (Theorem A in both forms); §4.15 (Connective periodic vanishing).

### 5.2 The high-height cyclotomic trace

For any E₁-ring A and n≥2 the natural zigzag K(A)←K(τ≥0A)→TC(τ≥0A) consists of T(n)-equivalences. TC here is the integral theory with its natural trace; the conclusion is telescopic. Its proof uses Theorem A, DGM and Mitchell, and is independent of CMNN vanishing and purity.

Throughout this target, A is any E₁-ring and n≥2; TC is applied to τ≥0A.

(lmmt line 1132, Corollary 4.30 and first proof paragraph, p.1035.)

A proof route is as follows. Reduce to connective A by the preceding comparison. Apply DGM to A→Hπ₀A; the fiber of K→TC is unchanged by the connective truncation map because it is a π₀-isomorphism. For the discrete ring π₀A, both K(π₀A) and TC(π₀A) are modules over K(Z), the latter through the cyclotomic trace and multiplicative TC. Mitchell annihilates both at T(n), n≥2. Thus DGM gives the required K→TC equivalence without a separate TC(Z) calculation.

**Checks.**

- For A = S or a periodic E₁-ring, the comparison still uses TC of the connective cover, rather than TC(A).
- A = 0; A = KU; n=2: K(0)=TC(0)=0; middle coefficient is ku, not KU; both T(2)-localized zigzag fibers=0.

*Needs:* §5.1 (High-height connective-cover invariance); RefinedTraceMethods §4.9 (Localizing and truncating small-category invariants); RefinedTraceMethods §4.11 (The cyclotomic trace and multiplicativity); RefinedTraceMethods §4.17, The Dundas–Goodwillie–McCarthy theorem; RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); §4.45 (Mitchell vanishing and the p-inverted sphere); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7.

### 5.3 The finite-group K-theory transfer comparison

For a stable category C with coherent Cp-action, form the genuine Cp-spectrum of algebraic K-theory of its finite-group action categories using restriction and induction. For C=Perf(R) with trivial action, its underlying spectrum is K(R), its genuine fixed points are K(Fun(BCp,Perf(R))), and the transfer factors as K(R)hCp→K(R[Cp])→K(Fun(BCp,Perf(R))). Its geometric fixed-point cofiber maps to K(R)^tCp through the genuine-to-Borel comparison.

Throughout this target, C is stable with coherent Cp-action; the displayed factorization uses trivial action on Perf(R).

(lmmt line 694, Remark 3.9, pp.1025–1026.)

A proof route is as follows. Construct induction/restriction on equivariant perfect categories and verify double-coset/additivity identities, giving a spectral Mackey functor. For Cp identify the proper-orbit term in isotropy separation with K(R)hCp. Identify induction from the free action with the group-ring module functor and compare the genuine fixed-point cofiber to the Tate cofiber.

The interface includes:

- Subgroup inclusions give exact restriction and induction functors, with the double-coset identity.
- The underlying nonequivariant spectrum of genuine K(Perf(R)) is K(R).
- The genuine Cp-fixed spectrum is K(Fun(BCp,Perf(R))).
- The transfer factors through K(R[Cp]) in the stated order and compares to the norm.

**Checks.**

- For G=1 the genuine construction reduces to ordinary K(C).
- Induction on the free Cp-orbit gives extension to R[Cp], not the trivial-action embedding alone.
- Genuine fixed points K(Fun(BCp,Perf(R))) are not by definition K(R)^hCp; the comparison is a separate map.
- For trivial Cp-action, the first assembly map has source K(R)⊗Σ∞_+BCp, and its composite with the quotient comparison is the norm.
- G=1; free C_p orbit; trivial action: norm for 1=id; res∘ind is p copies, giving p on K₀; assembly source=K(R)⊗Σ∞_+BC_p.

*Needs:* RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; RefinedTraceMethods §§2.1–2.2 (coherent actions and the finite-action Verdier quotient); RefinedTraceMethods §§2.11–2.12 (genuine equivariant spectra, Borel completion and geometric localization); §4.22 (Localized norms and Tate spectra).

### 5.4 CMNN finite-sphere vanishing

For n≥2, L_T(n)K(L_(n−2)^(p,f)S)=0. The inductive proof is carried out using only Theorem A and the high-height trace comparison, not purity. Write m=n−2. The Tate-height converse reduces the step to T(m+1)-acyclicity of K(L_m^(p,f)S)^tCp.

Throughout this target, n≥2; the coefficient sphere has finite localization index n−2.

(lmmt line 116, Theorem 1.1, p.1013; Remark 3.9 and proof, pp.1025–1026; cmnn24 line 827, Theorem 4.6 and proof, manuscript pp.19–20; Theorem 4.10 with proof, §4.2, p.21.)

A proof route is as follows. Start the induction at the p-inverted sphere, using Mitchell vanishing. Put R=L_m^(p,f)S. In the transfer factorization, the cofiber of K(R[Cp])→K(Fun(BCp,Perf(R))) is K of the Tate Verdier quotient, a module over K(R^tCp). Kuhn’s finite blueshift gives R^tCp an L_(m−1)^(p,f)S-algebra structure; the induction hypothesis annihilates this cofiber at T(m+1). For the first transfer factor use the high-height trace comparison on connective covers. Hesselholt–Nikolaus identifies the TC assembly cofiber in the localizing subcategory generated by τ≥0R, hence it is T(m+1)-acyclic. Handle the m=0 boundary by the base case. The transfer is now a T(m+1)-equivalence. Geometric-fixed-point comparison annihilates K(R)^tCp at T(m+1), and the commutative-ring Tate-height converse yields the desired T(m+2) vanishing.

**Checks.**

- At n=2 the coefficient sphere is S[1/p]; Mitchell gives zero after T(2), while an attempted use of high trace at m+1=1 is outside its hypotheses.
- For connective coefficients Q, the §4.19 TC assembly cofiber is a wedge of p−1 copies of ΣTHH(Q;ℤ_p)_hT_p: one at p=2 and two at p=3. For m≥1 and Q=τ≥0L_m^(p,f)S, T(m+1)⊗Q=0. The cyclic bar terms, their realization and circle homotopy orbits remain acyclic; §4.3 makes p-completion a positive-height equivalence. Thus each copy and the cofiber have T(m+1)-local value zero.
- n=2,3; m=n−2: m=0,1; L_T(2)K(S[1/p])=0; at m=0 the high-trace index m+1=1 is outside its range.

*Needs:* §5.2 (The high-height cyclotomic trace); §5.3 (The finite-group K-theory transfer comparison); §4.45 (Mitchell vanishing and the p-inverted sphere); RefinedTraceMethods §2.3 (Postnikov bounds and the Tate fixpoint lemma); RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); RefinedTraceMethods §4.19 (The TC assembly map for C_p); §4.3 (Telescope acyclicity criteria); §4.25 (Finite-local Tate blueshift); §4.29 (Tate height converse); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7.

### 5.5 The chromatic purity theorem

For every E₁-ring A, prime p and n≥1, the localization A→L_(T(n−1)∨T(n))A induces an equivalence L_T(n)K(A)≃L_T(n)K(L_(T(n−1)∨T(n))A). Equivalently, any map of E₁-rings which is a T(n−1)∨T(n)-equivalence induces a T(n)-equivalence on K. At n=1 use T(0)=S[1/p], not Hℚ on arbitrary unlocalized spectra.

Throughout this target, A is any E₁-ring and n≥1; the bottom convention is T(0)=S[1/p].

(lmmt line 122, Purity Theorem and proof, pp.1013 and 1025.)

A proof route is as follows. For n=1 the adjacent pair is the first finite localization, so Theorem A suffices. For n≥2 use the chromatic fracture square separating the top adjacent pair from L_(n−2)^(p,f). Apply the replacement-algebra invariant pullback comparison; all lower corners have K-theory modules over K(L_(n−2)^(p,f)S), annihilated by CMNN. Use Theorem A to compare the finite-localized input with A and check functoriality for maps.

**Checks.**

- If A is both T(n−1)- and T(n)-acyclic, L_T(n)K(A)=0.
- A = 0; H𝔽_p; n=1,2: two-height localization of 0 and H𝔽_p=0; positive telescopic K values=0; n=1 lower detector=S[1/p].

*Needs:* §4.46 (Theorem A in both forms); §5.4 (CMNN finite-sphere vanishing); RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §4.8 (Chromatic fracture squares).

### 5.6 Connective nilpotent comparisons for K and TC

If f:A→B is a map of connective E₁-rings, π₀f is surjective with nilpotent kernel, and f is a T(1)∨⋯∨T(n)-equivalence for n≥1, then K(f) and TC(f) are T(1)∨⋯∨T(n)-equivalences. If instead f is a T(0)-equivalence with the same π₀ condition, both K(f) and TC(f) are T(0)-equivalences. Keep these variants separate from the arbitrary-ring purity statement.

Throughout this target, the rings are connective and π₀f is surjective with nilpotent kernel. The positive-height hypothesis has n≥1; the T(0) variant is a separate comparison.

(lmmt line 819, Corollaries 4.4–4.5 and Remark 4.6, pp.1028–1029.)

A proof route is as follows. Use purity height by height and the bottom fracture square to isolate the p-inverted comparison. Apply Waldhausen truncation there and nilpotent invariance after the relevant rational/p-adic passage. Apply the DGM cartesian square to transfer the K equivalence to TC; prove the rational/T(0) variant by the corresponding truncation argument.

**Checks.**

- A π₀-isomorphism is allowed; a general ring map with no nilpotent π₀ condition is not covered by this connective variant.
- f=id; ℤ/4→𝔽₂; ℤ/9→𝔽₃: π₀ kernels 0,(2),(3), each squared=0 in its source; positive-telescope K and TC fibers=0 in the specified range.

*Needs:* §5.5 (The chromatic purity theorem); §2.3 (Rational and p-adic truncation); §2.4 (Nonpositive K-theory of connective rings); RefinedTraceMethods §4.11 (The cyclotomic trace and multiplicativity); RefinedTraceMethods §4.17, The Dundas–Goodwillie–McCarthy theorem; RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); §2.2 (Excision and nilinvariance for truncating invariants).

### Examples

The n=2 CMNN assertion is L_T(2)K(S[1/p])=0; it is the Mitchell base, not an application of a height-one trace comparison. For KU the high-height trace zigzag runs through K(ku) and TC(ku). For the trivial action of the trivial group, genuine and Borel norm comparisons are identities; for a free C_p-orbit, restriction after induction is p copies.

### Dependencies

Layer 2; Layer 4; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; RefinedTraceMethods §4.18, Truncating invariants: nil-invariance and excision; RefinedTraceMethods §4.9, Nonconnective K-theory by the suspension construction; RefinedTraceMethods §§2.1–2.3, 2.9, 2.11–2.12, 4.11 and 4.17; RefinedTraceMethods §4.19 (The TC assembly map for C_p).

## Layer 6: Height bounds, redshift and optimality

### 6.1 Theorem B and vanishing for algebras

For an E∞-ring R, ht(K(R))≤ht(R)+1 in the chromatic height convention ht(R)=inf{h≥−1:T(h+1)⊗R=0}, with infinity allowed. More precisely, if R is T(n)-acyclic for n≥0 and B is any E1 R-algebra, then K(B) is T(n+i)-acyclic for every i≥1. At n=0 the acyclicity hypothesis is R[1/p]=0.

Throughout this target, R is E∞; B is an E1 R-algebra in the refined version; n≥0.

(lmmt line 162, Theorem B, p.1014; Corollary 4.3, p.1028.)

A proof route is as follows. Use Hahn to propagate T(n)-acyclicity of the commutative coefficient ring to every higher height. Every B-module spectrum is R-linear, so B is acyclic at each such height. Apply purity to each pair of adjacent heights of B to annihilate its K-theory; translate the vanishing into the extended-integer height inequality.

**Checks.**

- For an E∞-ring of height n≥0, the conclusion is ht(KR)≤n+1; it does not yet assert nonvanishing at n+1.
- R=H𝔽_p,Hℚ,Eₙ; R=0: heights −1,0,n; upper K bounds 0,1,n+1; K(0)=0 has height −1≤0.

*Needs:* §5.5 (The chromatic purity theorem); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §4.27 (Hahn’s acyclicity theorem); §4.28 (Chromatic height of a commutative ring).

### 6.1a Lubin–Tate theories of perfect algebras and Lubin–Tate covers

Fix n≥1, a perfect field k of characteristic p and a height-n formal group over k, with Morava E-theory E(k) from the all-height realization contract. For every perfect k-algebra A construct the Lubin–Tate ring E(A), an E∞ E(k)-algebra that is complete at the maximal ideal 𝔪=(p,u₁,…,u_(n−1)) of π₀E(k), with π_*E(A)≅W(A)[[u₁,…,u_(n−1)]][u^(±1)], |u|=2, where W(A) is the p-typical Witt ring, naturally in A. Prove that A↦E(A) is fully faithful and left adjoint to the tilt R↦R♭=(π₀R/𝔪)♭ on 𝔪-complete E∞ E(k)-algebras, and that E(A)♭≅A. At height zero put E(A)=HA[u^(±1)], |u|=2, for a reduced commutative ℚ-algebra A.

Then prove the Lubin–Tate cover theorem. Say that a map R→S of E∞ rings in a localized category (T(n)-local spectra, or rational spectra at height zero) detects nilpotence when, for every map f:M→N of compact R-modules in that localized category, f is nilpotent as soon as S⊗_R f is; here a map g is nilpotent when some tensor power g^(⊗k), formed over the base ring in the localized module category, is null. The unit R need not be compact there: in K(1)-local modules over KU_p^∧ the local colimit of multiplication by p on R is zero while the colimit of π₀Map_R(R,R) along it is ℚ_p. For every T(n)-local E∞ ring R there is a perfect algebra A of Krull dimension at most zero over some perfect field of characteristic p and a nilpotence-detecting E∞ map R→E(A). For every rational E∞ ring R there is a reduced ℚ-algebra A of Krull dimension at most zero and a nilpotence-detecting E∞ map R→HA[u^(±1)].

(bsy line 809, Theorem 2.38, p.20; line 2026, Definition 4.29 with Definition 4.11, pp.42 and 46; line 2141, Corollary 4.37, p.49; line 2177, Theorem 4.40, pp.49–50; line 2246, Corollary 4.44, p.51; line 2416, Theorem 5.1, p.55; line 2443, Theorem 5.3, p.55; line 2511, Proposition 5.9, p.57; line 2593, Proposition 5.15, p.59; line 2633, Proposition 5.17, p.60.)

A proof route is as follows. Construct E(A) as the E(k)-linear spherical Witt vectors of A and read its homotopy from the formal-group deformation theory of the perfect base; the colocalization and the tilt identities follow from square-zero invariance of the tilt. For the cover theorem first reduce to an 𝔪-complete E(k)-algebra, using that the unit map of T(n)-local spectra to E(k) detects nilpotence by the nilpotence theorem. Prove the small-object statement: for any set of nilpotence-detecting maps of commutative algebras, every R maps by a nilpotence-detecting map to an R′ having the right lifting property against each of them. Apply it to three nilpotence-detecting maps whose lifting properties say, respectively, that R♭ has Krull dimension zero, that E(R♭)→R is surjective on π₀, and that π₁R=0; then prove that these three conditions characterize the rings E(A) with A perfect of Krull dimension zero. At height zero use the polynomial and degree-one test maps and map the resulting ring to the product of the E-theories of its residue fields, which detects nilpotence because it is surjective on Spec π₀.

The perfect-algebra realization and cover interface includes:

- A map of perfect k-algebras A→B induces an E∞ E(k)-algebra map E(A)→E(B), preserving identity and composition and inducing the coefficientwise Witt map on homotopy.
- Maps E(A)→R into an 𝔪-complete E(k)-algebra correspond naturally to maps A→R♭, with the adjunction unit A≃E(A)♭.
- The homotopy coefficient isomorphism respects the unit, products, the marked E(k)-action and the degree-two periodicity generator.
- Nilpotence detection is preserved by composition and arbitrary base change of commutative algebras in the localized category (bsy line 2028, Lemma 4.30; bsy line 1962, Proposition 4.24).

**Checks.**

- If R≠0 and R→E(A) detects nilpotence then A≠0. For A=0 the identity of every compact localized R-module C becomes null after base change, so it is tensor-nilpotent and some tensor power of C vanishes; C is dualizable, hence a retract of C⊗C⊗C∨, and iterating this gives C=0. Compact generation then forces R=0 (bsy line 2059, Lemma 4.32, gives the equivalent nil-conservativity). The argument does not use compactness of R: for R=KU_p^∧ in K(1)-local modules the unit is not compact, but the compact module R/p is nonzero with nonzero tensor powers, so R→0 is not a cover. For R=0 the cover with A=0 is allowed, which is why §6.2 assumes R nonzero.
- For R=E(L), L algebraically closed of characteristic p, the identity is a cover with A=L, perfect of Krull dimension zero, and π₀E(L)/𝔪=L recovers L as the tilt. A ring with π₁≠0, such as the free E(k)-algebra on a degree-one class, is not of the form E(A), since π_*E(A) is even.
- For the discrete rational ring R=Hℚ[x], the single map to Hℚ(x)[u^(±1)] does not detect nilpotence: the identity of the compact module R/x becomes zero after tensoring with ℚ(x) but is not nilpotent. The product of HF[u^(±1)] over the residue fields F of all primes of ℚ[x] does detect nilpotence, and a product of fields is reduced of Krull dimension zero, while ℚ[x] itself has Krull dimension one.

*Needs:* EllipticCohomology E2, with gap:all-height-morava-realization; BordismFormalGroups F1–F3 (Morava E-theory coefficients) and F6.2 (nilpotence); EnhancedDerivedSheaves E5:abstract.1–4 and E5:presentability.1–3 (commutative algebra and module objects, compact objects, presentability); Mathlib `WittVector` for the p-typical Witt ring.

### 6.2 Chromatic field maps

For n≥1, every nonzero T(n)-local E∞ ring R admits a unital E∞ map to E_n(L) for an algebraically closed field L of characteristic p, with the associated height-n formal group. Every nonzero rational E∞ ring admits a unital map to E₀(L)=HL[u±1], |u|=2, for an algebraically closed characteristic-zero field L. At bottom height apply this to the nonzero rationalization, not to p-inversion alone.

(bsy line 2419, Corollary 5.2 and Theorem D, pp.3 and 55.)

A proof route is as follows. Apply the Lubin–Tate cover theorem of §6.1a to obtain a nilpotence-detecting map R→E(A) with A perfect of Krull dimension zero. Since R is nonzero, nilpotence detection forces A≠0; choose a maximal ideal 𝔪 of A and an algebraic closure L of A/𝔪, which is perfect, and compose R→E(A)→E(L). At height zero apply the rational form of §6.1a to the nonzero rationalization, obtaining a reduced nonzero A and a map to E₀(L) for an algebraic closure L of a residue field of A.

**Checks.**

- For Hℚ the rational field map exists; H𝔽_q, q≠p, survives p-inversion but has no characteristic-zero field map.
- R=E₁(L); R=Hℚ; R=H𝔽_q,q≠p: identity field map in height1; rational case maps to E₀(L); last has rationalization 0 and no characteristic-zero unital field map.

*Needs:* §6.1a (Lubin–Tate theories of perfect algebras and Lubin–Tate covers); EllipticCohomology E2, with the all-height extension in the supplier contract.

### 6.3 Yuan’s Lubin–Tate nonvanishing input

For Lubin–Tate E_n associated to a height-n formal group over a perfect characteristic-p field, n≥1, L_T(n+1)K(E_n)≠0. This is the positive-height lower-bound target; its proof uses the purity theorem of §5.5. The intermediary result says that T(j)⊗E≠0 for E∞ E implies T(j)⊗K(E^tCp)≠0, j≥1.

Throughout this target, n≥1; E_n comes from a finite-height formal group over a perfect characteristic-p field.

(yuan line 58, Theorems A and C, manuscript pp.2–3; §3 proof pp.6–7; §4, Theorem 4.2 and Lemma 4.5, pp.7–9.)

A proof route is as follows. Use the residual circle action on E^tCp and the circle-equivariant THH universal property to map its K-theory into (e^tCp)^h(S1/Cp), where e is the connective cover. Invoke the Tate-orbit comparison and the circle-Tate calculation to preserve T(j)-nonzero targets; use purity to replace E by e at the Cp-Tate step. For E_(n+1)^tCp use telescopic K étale descent to choose a strict henselization with nonzero T(n+1)-local K. Use the Lubin–Tate mapping property over its K(n)-local strict henselian height-n localization to obtain an E_n-algebra with nonzero K; nonvanishing pulls back along the unital K map.

**Checks.**

- For height-one E₁, the theorem gives nonzero T(2)-localized K; the lower-bound proof uses two-height purity, not just the finite-local Theorem A.
- E₁,E₂; p=2,3: height E₁=1, E₂=2; L_T(2)K(E₁)≠0 and L_T(3)K(E₂)≠0.

*Needs:* §5.5 (The chromatic purity theorem); RefinedTraceMethods §2.3 (Postnikov bounds and the Tate fixpoint lemma); RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); EllipticCohomology E2, with the all-height extension in the supplier contract; EllipticCohomology E2 items 2–3 (gap:all-height-morava-realization); KTheoryFiniteLocalFields §§1.6 and 6.5a, with the spectral comparison contract; AInfCohomology §AI.7.2; gap:spectral-etale-descent; gap:spectral-strict-henselian-detection.

### 6.4 The height-zero lower bound

For an algebraically closed characteristic-zero field L, let E₀(L)=HL[u±1] with |u|=2. Then K(E₀(L))^∧p≃ku^∧p⊕Σku^∧p, and in particular L_T(1)K(E₀(L))≠0. This is the height-zero periodic field input needed to include n=0 in redshift; it is not Yuan’s positive-height theorem.

Throughout this target, L is algebraically closed of characteristic zero; u has degree 2.

(bsy line 3901, Proposition 9.12 and proof, manuscript p.89.)

A proof route is as follows. Use Suslin rigidity/comparison to identify K(L)^∧p with ku^∧p. Apply regular localization to HL[u]→HL[u±1]. The first K(L)→K(HL[u]) map is induced by restriction through the u-torsion quotient. By additivity its composite with the connective truncation comparison is id plus an odd suspension, hence zero; split the resulting cofiber sequence after p-completion.

**Checks.**

- E₀(L) has height zero and K(E₀(L)) has nonzero height-one part.
- L algebraically closed characteristic 0; |u|=2: π₀(ku_p^∧⊕Σku_p^∧)=ℤ_p; π₁=ℤ_p; T(1) value nonzero.

*Needs:* §3.4 (Regular ring-spectrum devissage); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §2.3 (Rational and p-adic truncation); KTheoryFiniteLocalFields §§1.2, 1.6 and 6.5a, with the spectral comparison contract; §4.17 (Ravenel’s Bousfield class formula); gap:suslin-algebraically-closed-comparison.

### 6.5 Redshift at nonnegative height

For every p-local E∞-ring R with ht(R)≥0, ht(K(R))=ht(R)+1, allowing infinity+1=infinity. More generally this holds for any E∞ R of positive height, and for a global height-zero R provided R⊗Hℚ≠0. At finite positive height n, the Nullstellensatz gives a map from the nonzero T(n)-localization to E_n(L), L algebraically closed of characteristic p; at height zero it is applied to the nonzero rationalization and L has characteristic zero. The global bottom convention T(0)=S[1/p] alone does not imply that rationalization is nonzero; the height-zero restriction records this restriction. No equality is asserted at ht(R)=−1.

Throughout this target, R is E∞ with ht(R)≥0. At height zero additionally R⊗Hℚ≠0; this follows automatically if R is p-local.

(bsy line 2419, Corollary 5.2 (Theorem D), pp.3 and 55; Theorem 9.11 and Remark 9.13, manuscript pp.88–90; lmmt line 175, Redshift Theorem and following discussion, p.1014.)

A proof route is as follows. At finite positive height apply the chromatic field maps of §6.2 to the nonzero T(n)-local E∞-ring. At height zero apply its n=0 case only to R⊗Hℚ, assumed nonzero, to obtain the characteristic-zero field map. Purity and the lower-bound input give T(n+1)-nonvanishing of K(R); combine with the upper bound. If ht(R)=infinity, apply the same detection to each finite height and use the lower-bound maps to obtain arbitrarily high nonvanishing. Record the negative-height counterexample separately: at p=2, F2^tC2 is 1-periodic, so its K-theory vanishes after inverting 2 by additivity and has height −1 rather than 0.

**Checks.**

- For every n≥0 the periodic field E_n has K-theory of height n+1. The excluded negative-height example prevents an incorrect universal equality.
- R=Hℚ,E₁; R=(HF₂)^tC₂ at an odd p; R=0: heights 0→1 and 1→2; counterexample has height 0, rational part 0 and positive odd-primary K support 0; zero height −1 excluded.

*Needs:* §6.1 (Theorem B and vanishing for algebras); §6.3 (Yuan’s Lubin–Tate nonvanishing input); §6.4 (The height-zero lower bound); §5.5 (The chromatic purity theorem); §§4.27–4.28 (Hahn and height); §6.2 (Chromatic field maps).

### 6.6 Both heights in purity are necessary

For each n≥1 the functor A↦L_T(n)K(A) on E₁-rings does not factor through A↦L_T(n)A and does not factor through A↦L_T(n−1)A. These are assertions that each putative universal factorization fails, rather than that every individual map to a single-height localization fails.

Throughout this target, n≥1; factorization means one valid for every E₁-ring.

(lmmt line 734, Remark 3.11, p.1026.)

A proof route is as follows. To rule out factorization through T(n), choose a height-(n−1) commutative ring with nonzero T(n)-local K: use E_(n−1) for n≥2 and the height-zero input for n=1. For factorization through T(n−1), choose a connective spectrum M that is T(n−1)-acyclic but T(n)-nonzero, and use split square-zero extensions S⊕Σ^rM→S. If all these K comparisons were T(n)-equivalences, their stabilized relative K colimit would vanish. RefinedTraceMethods §4.15 identifies colim_r Ω^r fib(K(S⊕Σ^rM)→K(S)) with ΣTHH(S;M)≃ΣM, whose T(n)-localization is nonzero, a contradiction.

**Checks.**

- The n=1 case uses a height-zero ring rather than an undefined E_(−1); the square-zero argument requires an actual separated telescope input.
- For M=HA with A an abelian group, π₁ΣHA=A and π₀ΣHA=0; ΩHA instead has π₋₁=A. For the ordinary square-zero ring ℤ⊕A, the relative units 1+A give the same degree-one class.
- n=1 with periodic characteristic-zero field; square-zero M with support at n: T(1)R=0 but T(1)K(R)≠0; colim_r Ω^r fib(K(S⊕Σ^rM)→K(S))≃ΣM, with T(n−1)M=0,T(n)M≠0 (RefinedTraceMethods §4.15).

*Needs:* §6.3 (Yuan’s Lubin–Tate nonvanishing input); §6.4 (The height-zero lower bound); RefinedTraceMethods §4.15 (Stable K-theory is THH); RefinedTraceMethods §4.14 (Square-zero extensions and linearization); BordismFormalGroups F3 (Morava coefficient spectra); §4.3 (positive-height invariance under connective cover); §4.20 (Separation above height one).

### 6.7 Redshift in chromatic graded pieces

For an E∞-ring R of nonnegative chromatic height and every n≥1, vanishing of the nth graded piece of its p-primary finite chromatic tower is equivalent to vanishing of the (n+1)st graded piece for K(R). The same vanishing equivalence holds for the corresponding ordinary chromatic tower. On p-local R one may also include n=0, with L0=Hℚ and M0=L0. Globally T(0)=S[1/p] is not replaced by Hℚ in this translation.

Throughout this target, R is E∞ of nonnegative height and n≥1. For the n=0 extension, R is p-local.

(lmmt line 175, Interpretation after the Redshift Theorem, p.1014; Lemma 2.3, p.1017.)

A proof route is as follows. Use the commutative-ring initial-interval height theorem and the ring-spectrum comparison of vanishing at T(n) and K(n) for n≥1. For n≥1 the graded-piece question concerns positive height cutoffs. If ht(R)≥1 use positive-height redshift. If global ht(R)=0, the upper bound makes the (n+1)st piece of K(R) vanish and the nth piece of R already vanishes; no height-zero lower bound is needed. For n=0 restrict to p-local input to compare S[1/p] with Hℚ; record the extra restriction rather than changing the global bottom convention.

**Checks.**

- This is a comparison of vanishing, not an equivalence of the two towers or the telescope conjecture.
- R=Hℚ; n=0 under p-locality; R=E₁,n=1,2: M₀(Hℚ)=Hℚ≠0 and M₁K(Hℚ)≠0; at E₁ nth support is nonzero for n=1 and zero for n=2, shifted K support at 2 and 3 matches.

*Needs:* §6.5 (Redshift at nonnegative height); §4.28 (Chromatic height of a commutative ring); §4.4 (Ring-spectrum acyclicity comparison); §4.7 (Comparison on p-local spectra); §4.19 (Telescopes on chromatically local spectra).

### Examples

For a characteristic-zero algebraically closed field L, E₀(L)=HL[u±1] has height zero and K(E₀(L)) has height one; its p-completion is ku_p^∧⊕Σku_p^∧. At an odd coefficient prime the one-periodic characteristic-two Tate ring has global height zero and zero rationalization. Suspension acts both as identity and as negation on its K-theory, so 2 acts as zero; its positive odd-primary telescopes vanish. It therefore fails the unrestricted height-zero redshift formula and is excluded by the rational-part hypothesis.

### Dependencies

AInfCohomology §AI.7.2; EllipticCohomology E2, with the all-height extension in the supplier contract; KTheoryFiniteLocalFields §§1.6 and 6.5a, with the spectral comparison contract; Layer 2; Layer 3; Layer 4; §§4.27–4.28 and §6.2 (Hahn, height and chromatic field maps); EllipticCohomology E2 items 2–3 (gap:all-height-morava-realization); Layer 5; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; RefinedTraceMethods §§2.3, 2.9 and 4.14–4.15.

## Layer 7: Coefficient examples and iterated K-theory

### 7.1 Nice maps of connective E∞-rings

A map f:R→S of connective E∞-rings is n-nice, n≥0, if π₀R→π₀S is an isomorphism identified with the identity of Z and f is an Hℚ∨T(1)∨⋯∨T(n)-equivalence. It is nice if it is n-nice for every n≥0. The rational summand is Hℚ here by definition; it is not a global replacement of T(0). Record both the chosen identifications with Z and the compatibility of π₀f.

Throughout this target, R,S are connective E∞ with compatible fixed π₀ identifications with Z; n≥0.

(lmmt line 852, Definition before Corollary 4.7, p.1029.)

A proof route is as follows. Define the predicate with actual connective E∞ input rings and fixed π₀ identifications. Separate its rational comparison from the finite list of positive telescopes. Check preservation under identity/composition and under equivalence of the chosen π₀ models.

The interface includes:

- An n-nice map induces the specified identity on π₀=Z.
- An n-nice map is an Hℚ-equivalence.
- For 1≤i≤n an n-nice map is a T(i)-equivalence.
- Composites of n-nice maps are n-nice; nice maps are closed under composition.

**Checks.**

- The identity on any connective E∞-ring with π₀=Z is nice.
- Being 0-nice imposes the rational equivalence and π₀=Z, without any positive-height condition.
- An equivalence on H 𝔽_p is not n-nice, because π₀ is 𝔽_p rather than Z.
- The unital square-zero projection Hℤ⊕ΣHℤ→Hℤ induces the identity ℤ→ℤ on π₀, but on rational π₁ gives ℚ→0, so it is not 0-nice. This tests rational equivalence within the specified input class.
- For id_(Hℤ), π₀ is the identity and every rational or positive telescopic fiber is zero. For id_(H𝔽_p), π₀=𝔽_p excludes the carrier before niceness is tested; a unital map with π₀=ℤ always sends 1 to 1.

*Needs:* §5.6 (Connective nilpotent comparisons for K and TC); §4.1 (Telescopes).

### 7.2 K preserves nice maps

If f:R→S is n-nice, then K(f):K(R)→K(S) is n-nice; therefore K preserves nice maps. Here K(R) and K(S) are connective E∞-rings with π₀=Z: nonpositive comparison and K_i(Z)=0 for i<0, K₀(Z)=Z establish those claims before iterating.

Throughout this target, f is n-nice, with the output ring structure on K supplied by multiplicativity.

(lmmt line 852, Corollary 4.7 and proof, p.1029.)

A proof route is as follows. Use nonpositive comparison to prove the output connectivity and π₀ identifications. Apply the positive-height connective nilpotent comparison, where π₀f is an isomorphism. Use rational Waldhausen truncation for the rational piece; assemble the n-nice predicate.

**Checks.**

- The output is a map of rings, not merely a map of spectra; its π₀ identifications are required for a second application of K.
- f=id_Hℤ; rank input K(𝔽_p)→Hℤ: π₀K(Hℤ)=ℤ; negative groups=0; after another K the compatible π₀ map is id_ℤ.

*Needs:* §7.1 (Nice maps of connective E∞-rings); §2.4 (Nonpositive K-theory of connective rings); §5.6 (Connective nilpotent comparisons for K and TC); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7.

### 7.3 Iterated finite p-power K-theory

For r≥1 the rank map K(Z/p^r)→Hℤ is nice. Consequently for j≥1 the natural iterated map K^j(Z/p^r)→K^(j−1)(Z) is an Hℚ∨T(1)∨⋯∨T(n)-equivalence for every n≥0. The initial map is induced by rank on the connective E∞ K-spectrum; it is not a ring map Z/p^r→Z.

Throughout this target, r≥1, j≥1 and n≥0.

(lmmt line 858, Example 4.8, p.1029; weibel line 469, Corollary 5.4, p.485.)

A proof route is as follows. Use negative-K nilinvariance and the finite-field computation to identify π≤0K(Z/p^r). Use positive telescope vanishing and the rational nilinvariance/p-power relative-K input to show the rank map is nice. Iterate preservation of nice maps, maintaining all connective ring structures and π₀=Z.

**Checks.**

- At r=1, K(𝔽_p)→Hℤ is rationally equivalent and is an equivalence at every positive telescope, although it is not an integral equivalence.
- p=2,3;r=1,2;j=1,2: K₀=ℤ; first target K⁰(ℤ)=Hℤ; j=2 target K(ℤ); no ring hom ℤ/pʳ→ℤ since pʳ·1 is 0 versus pʳ.

*Needs:* §7.2 (K preserves nice maps); §4.42 (Finite p-power coefficient vanishing); §2.4 (Nonpositive K-theory of connective rings); KTheoryLowDegrees §§1.1–1.3 and 13.1; §4.37 (Weibel localization and p-power nilpotent invariance); §4.35 (Nonpositive nilpotent invariance).

### 7.4 K-theory of Morava K-theory

Let m≥1 and K(m) be the standard E1 Morava K-theory at p, with connective cover k(m) and π∗k(m)=𝔽_p[v_m], |v_m|=2p^m−2. Then L_T(i)K(K(m))=0 for i∉{0,m,m+1}. Separately, after inverting p, K(K(m))[1/p]≃K(𝔽_p)[1/p]⊕ΣK(𝔽_p)[1/p]. The vanishing statement does not assert that each of the three exceptional heights is nonzero.

Throughout this target, m≥1; use the standard E1 coefficient Morava K-theory and connective k(m).

(lmmt line 876, Corollary 4.9 and Remark 4.10, pp.1029–1030.)

A proof route is as follows. Use the known chromatic support of the E1 Morava coefficient ring and purity at all disjoint adjacent pairs. Apply regular devissage to k(m)→K(m); the fiber is K(𝔽_p). Compare K(k(m))[1/p] with K(𝔽_p)[1/p] by the p-power truncation argument. The devissage map composes with this comparison as id plus the odd shift 2p^m−1, hence is zero by additivity; split its cofiber.

**Checks.**

- At m=1 only heights 0,1,2 can remain; the displayed splitting identifies its p-inverted K-spectrum, alongside the positive-height support statement.
- m=1,p=2,3; i=3; p-inverted splitting: remaining possible heights {0,1,2}; L_T(3)K(K(1))=0; rational ranks in degrees (0,1) of the splitting summands are (1,0) and (0,1), giving (1,1) for the sum.

*Needs:* §5.5 (The chromatic purity theorem); §3.4 (Regular ring-spectrum devissage); §2.3 (Rational and p-adic truncation); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; BordismFormalGroups F1–F3; §4.4 (Ring-spectrum acyclicity comparison).

### 7.5 K-theory of truncated spheres

For every r≥0 and i≥2, L_T(i)K(τ≤rS)=0. The input is a connective finite Postnikov truncation of the sphere; this gives no such vanishing claim for K(S) itself.

Throughout this target, r≥0 and i≥2.

(lmmt line 899, Corollary 4.11, p.1030.)

A proof route is as follows. The finite Postnikov ring is acyclic at every positive telescope. For i≥2 both T(i−1) and T(i) annihilate it, so purity applies.

**Checks.**

- At r=0 this recovers the high-height vanishing of K(Z).
- r=0,1;i=2: τ≤₀S=Hℤ; L_T(2)K(τ≤₀S)=L_T(2)K(τ≤₁S)=0.

*Needs:* §5.5 (The chromatic purity theorem); §5.1 (High-height connective-cover invariance); GeneralizedCohomology G3 item 8 (spectral Postnikov truncations); EnhancedDerivedSheaves E5:abstract.2 (multiplicative Postnikov contract).

### 7.6 Truncated Brown–Peterson localization

For n≥0, K(BP⟨n⟩)→K(E(n)) is a T(i)-equivalence for i≥n+1 and these spectra are T(i)-acyclic for i≥n+2. For n≥1 the usual sequence K(BP⟨n−1⟩)→K(BP⟨n⟩)→K(E(n)) is a fiber sequence after L_(⊕i≥n+1 T(i)); the first arrow is the restriction/devissage map through the quotient. It is not asserted to be an unlocalized fiber sequence.

Throughout this target, n≥0; the displayed three-term sequence has n≥1 and is localized.

(lmmt line 903, Corollary 4.12 and Remark 4.13, p.1030.)

A proof route is as follows. Use the chromatic localization behavior of BP⟨n⟩→E(n) and apply the adjacent-pair test. Use support above height n to deduce the higher vanishing. For the localized sequence the low-height term vanishes as required and localization identifies the last two terms; retain the restriction map and do not assert an integral localization theorem without regularity.

**Checks.**

- For n≥2 the corresponding rational/unlocalized fiber sequence can fail; the localized statement must survive that negative control.
- n=0,1,2; i=n+1,n+2: high comparisons at i=1,2,3 respectively; vanishing begins at i=2,3,4; first three-term sequence only n≥1.

*Needs:* §5.5 (The chromatic purity theorem); BordismFormalGroups F1–F3; §4.21 (Chromatic support of BP truncations); §6.1 (Theorem B and vanishing for algebras).

### 7.7 Purity for suspension A-theory

Let W be pointed connected and n≥1. If the reduced suspension spectrum Σ∞W is T(n−1)∨T(n)-acyclic, then A(*)→A(ΣW)→A(*) are T(n)-equivalences. The suspension is reduced and the coefficient ring is Σ∞_+ΩΣW.

Throughout this target, W is pointed connected and reduced Σ∞W is T(n−1)∨T(n)-acyclic; n≥1.

(lmmt line 919, Corollary 4.14 and proof, p.1030.)

A proof route is as follows. Use the James splitting of Σ∞_+ΩΣW as the tensor algebra on the reduced Σ∞W. Its augmentation to S has fiber built from positive tensor powers of Σ∞W, still acyclic at the adjacent pair. Apply purity to the augmentation and use its unit splitting.

**Checks.**

- W contractible gives the identity equivalence A(*)≃A(ΣW).
- W=*; W with reduced suspension spectrum finite p-local of type m>n: Σ∞*=0; A(*)→A(Σ*) is id; every reduced James smash summand has detector value 0.

*Needs:* §1.4 (Waldhausen A-theory); §5.5 (The chromatic purity theorem); HomotopySpheres §3B, with the stable splitting contract.

### 7.8 K-theory of James-filtered Thom spectra

For m≥1, the map y(m)→𝔽_p induces an L_(m−1)^(p,f)-equivalence on K, so K(y(m)) is T(i)-acyclic for 0<i<m. At p=2 the integral analogue z(m)→HZ_(2) induces a T(i)-equivalence on K for 0<i<m. The z(m) statement does not include the bottom T(0) summand.

Throughout this target, m≥1; z(m) is the prime-two integral analogue and its range is 0<i<m.

(lmmt line 960, Corollaries 4.16 and 4.18, p.1031.)

A proof route is as follows. Use §4.32 for connectivity, π₀ and the twisted Thom acyclicity: T(i)y(m)=0 for 0≤i<m and T(i)z(m)=0 for 1≤i<m at p=2. Apply the connective nilpotent comparison and its rational part to y(m). Apply only the positive-height comparison to z(m), and use finite-field K vanishing for the y(m) conclusion.

**Checks.**

- For m=1 the displayed positive-height range is empty; the finite-localization assertion for y(1) still has its bottom-height meaning.
- At m=2,p=2, §4.32 gives T(1)y(2)=T(1)z(2)=0, and §5.6 gives T(1)K(y(2))=T(1)K(𝔽₂)=0 and T(1)K(z(2))≃T(1)K(ℤ_(2)). At height zero, y(2)[1/2]=0 but π₀(z(2)[1/2])=ℚ, so the bottom comparison argument for y does not apply to z.
- m=1,2;p=2; p=3 for y: 0<i<1 has no indices; 0<i<2 means i=1; π₀z(m)=ℤ_(2), π₀y(m)=𝔽_p.

*Needs:* §5.6 (Connective nilpotent comparisons for K and TC); §4.42 (Finite p-power coefficient vanishing); §4.32 (James-filtered Thom spectra, including twisted Thom acyclicity).

### Examples

At j=1 the iterated finite-p comparison has source K(ℤ/pʳ) and target Hℤ, with π₀ the rank identity. At j=2 its target is K(ℤ); no map of coefficient rings ℤ/pʳ→ℤ is used. For Morava K(1), only heights 0,1,2 can remain. At m=1 the range 0<i<m for a James–Thom comparison is empty, while y(1) retains its bottom finite-localization assertion.

### Dependencies

BordismFormalGroups F1–F3; HomotopySpheres §3B, with the stable splitting contract; KTheoryLowDegrees §§1.1–1.3 and 13.1; Layer 1; Layer 2; Layer 3; Layer 4; Layer 5; Layer 6; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7.

## Layer 8: Rational-transfer descent and modular examples

### 8.1 ε-enlargement and descent towers

Let T be a thick subcategory of small stable idempotent-complete C. For finite spectrum F let T_F be the thick closure of T and every F⊗X. For a finite set Σ of primes put T_(ε,Σ)=intersection_F T_F, where F_(q)≠0 for every q∈Σ; put T_ε=union_Σ T_(ε,Σ). An ε-object belongs to 0_ε. A tower is nilpotent if a fixed-length composite of its transition maps is null; it is rapidly convergent if it is in the thick closure of nilpotent and constant towers. An augmented cosimplicial diagram is an ε-nilpotent limit if its cofiber totalization tower lies in the ε-enlargement of the nilpotent towers.

Throughout this target, C is small stable idempotent-complete and T is thick. Σ is finite and F ranges over finite spectra nonzero at each q∈Σ.

(cmnn20 line 300, Definitions 2.1–2.3, pp.7–8; Definitions 2.14–2.16, pp.11–12.)

A proof route is as follows. Define thick closures inside C and inside its tower category, using finite-spectrum tensoring. Prove invariance under exact functors and the Verdier-quotient criterion for ε-enlargement. Compare finite partial totalizations and their cofiber tower with the augmentation.

The interface includes:

- T is contained in T_ε, with T_(ε,∅)=T.
- An exact functor carrying T into U carries T_ε into U_ε.
- X∈T_ε exactly when its image in Idem(C/T) is an ε-object.
- An augmented cosimplicial object gives the tower cofib(X_(−1)→Tot_rX), which tests ε-nilpotent descent.

**Checks.**

- T_(ε,∅)=T because the zero finite spectrum is among the intersection tests.
- A tower of zero objects is nilpotent with transition-length bound 1.
- H(ℚ/ℤ) is annihilated by every ordinary finite chromatic localization L_n^f at every prime but is not an ε-spectrum; pointwise invisibility cannot replace the uniform ε definition.
- The ε condition has a uniform finite set of primes; arbitrary pointwise periodic acyclicity is not its definition.
- Σ=∅; T=0; zero tower; constant tower: F=0 allowed for empty Σ, giving T_(ε,∅)=T; zero tower nilpotence length 1; constant nonzero tower rapid but not nilpotent.

*Needs:* RefinedTraceMethods §4.9, Localizing and truncating small-category invariants; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; GeneralizedCohomology G2 and G5.1.

### 8.2 Rational transfer forces periodic descent

In a symmetric monoidal stable idempotent-complete ∞-category C, let R be commutative, A associative, and M an A-module with a map M→R for which π₀ Map_C(1,M)⊗Q→π₀ Map_C(1,R)⊗Q has the unit of R in its image. Then R lies in the ε-enlargement of the thick tensor ideal generated by A, and CB•aug(A)⊗R is an ε-nilpotent limit. In a presentable stable target, any such diagram satisfies L_n^fX_(−1)≃L_n^fTot(X•)≃Tot(L_n^fX•), and its localized totalization tower is rapidly convergent. The tower conclusion also holds with L_T(i), i≥1, by the same ε argument.

Here CB•aug(A) is the augmented Amitsur cobar diagram of 1→A: its degree −1 term is 1 and degree r≥0 term is A^(⊗(r+1)). Use the associative-algebra version of this construction; the commutative Amitsur specialization is EnhancedDerivedSheaves E5:descent. Its API comprises:

- Every coface from degree r to r+1 inserts the unit 1_A in the specified factor.
- Every codegeneracy from degree r≥1 to r−1 multiplies the specified adjacent A-factors.
- Algebra maps induce maps of augmented diagrams; associativity and the unit laws give the cosimplicial identities, and A=1 gives the constant diagram. Tensoring this specified augmented diagram with R is the diagram in the theorem (cmnn20 line 567, cobar construction and Proposition 2.22, manuscript pp.13–14).

Throughout this target, C is stable symmetric monoidal, R commutative, A associative, and M an A-module mapping to R rationally onto its unit. The totalization conclusion uses a presentable stable target.

(cmnn20 line 798, Theorems 4.2–4.4 with proofs, p.19; Proposition 2.23, pp.13–14; Propositions 2.13 and 2.19, pp.11–13.)

A proof route is as follows. Clear finitely many rational denominators and fix their finite prime set Σ. Let J be the thick tensor ideal generated by M and T⊗1, with T a finite spectrum nonzero at every prime in Σ. In C/J form the E∞ ring B=Hom_(C/J)(1,R), with source the tensor unit and target the image of R, and multiplication induced by R. Clearing denominators gives N^k·1_B=0 for some k, so Hℚ⊗B=0 and H𝔽_q⊗B=0 for q∤N. For q∣N, T⊗B=0 and nonzero H𝔽_q-homology of T give H𝔽_q⊗B=0. Apply §4.34 to B. Its vanishing makes η:1→R null, hence id_R=μ∘(η⊗id_R)=0 and R=0 in C/J. Thus R belongs to the indicated ε-tensor ideal; the thick-ideal cobar argument yields the ε-nilpotent totalization tower. Finite chromatic localization identifies each ε-enlargement with its original thick subcategory; apply this to towers. Both localization-before-limit and limit-before-localization annihilate the cofiber tower, giving the two separate equivalences.

**Checks.**

- Localization commutes with this totalization by the proven uniform tower property; no general commutation with inverse limits is asserted.
- For C=Perf(ℚ), J=0 and R=ℚ×ℚ, the mapping algebra from 1 has coordinatewise product (a,b)(c,d)=(ac,bd); ambient composition instead gives E₁₂E₂₁=E₁₁ and E₂₁E₁₂=E₂₂. If B vanishes in a quotient, the unit law gives id_R=μ∘(0⊗id_R)=0, rather than a conclusion about arbitrary ambient endomorphisms.
- A = R=unit,M=unit; rational torsor of degree 2: unit lifts to 1; cobar error tower=0; degree-two transfer sends 1/2 to 1 after rationalization.

- For A=ℚ×ℚ and e₁=(1,0), the degree-zero cofaces give 1⊗e₁ and e₁⊗1 in A⊗A. In the basis e_i⊗e_j these are e₁⊗e₁+e₂⊗e₁ and e₁⊗e₁+e₁⊗e₂, respectively, so they differ. The multiplication codegeneracy sends both to e₁, giving the two unit identities and distinguishing cofaces from multiplication.

*Needs:* §8.1 (ε-enlargement and descent towers); RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §§4.27–4.28 and §6.2 (Hahn, height and chromatic field maps); §4.5 (Finite chromatic localizations); §4.34 (Ordinary-homology detection of the H∞ unit); gap:linear-weak-additive-motives; gap:linear-motive-tensor-unit; gap:linear-motive-kzero-unit.

### 8.3 Telescopic K-theory Galois descent

Let A→B be a finite-group G-Galois extension of E∞-rings. Suppose B is perfect over A and the transfer K₀(B)⊗Q→K₀(A)⊗Q has 1 in its image. For every prime and finite chromatic localization L_n^f, n≥0, both canonical maps L_n^fK(A)→L_n^f(K(B)^hG)→(L_n^fK(B))^hG are equivalences. Consequently the analogous maps after any positive T(i)-localization are equivalences. The commutation with homotopy fixed points is a conclusion under these hypotheses, not a formal property of localization.

Throughout this target, A→B is finite G-Galois E∞, B is perfect over A, and rational K₀ transfer hits 1.

(cmnn20 line 975, Theorem 5.6 and proof, manuscript p.22; Theorem 5.1 pp.20–21; Proposition 2.19 pp.12–13; Remark 2.9, p.9.)

A proof route is as follows. Use the transfer projection formula to obtain the rational unit-generation condition in the additive motive category of A-linear perfect categories. Apply CMNN’s ε-nilpotent descent argument to the Amitsur augmented cosimplicial object; record the needed weakly additive motive interface as an RefinedTraceMethods §§4.6 and 4.10 supplier request. Its totalization tower becomes rapidly convergent after finite periodic localization, so localization can be moved through this particular totalization. Identify the Galois Amitsur diagram with the G-cobar diagram. Apply the same ε-nilpotent tower argument directly for each T(i), using CMNN Remark 2.9 and Proposition 2.19, to justify both T(i)-localized comparison maps; this is not inferred by commuting a further localization with arbitrary homotopy fixed points.

**Checks.**

- For G=1 all maps are identities. For nontrivial G, a Galois label alone does not discharge the rational-transfer hypothesis.
- G=1; trivial torsor A→A×A: all comparison maps=id for 1; K₀ transfer (a,b)↦a+b sends (1,0) to 1.

*Needs:* RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §0.1 (Thomason–Neeman localization); §4.7 (Comparison on p-local spectra); §4.24 (Kuhn’s telescopic Tate vanishing); RefinedTraceMethods §§2.1–2.2 (coherent actions and the finite-action Verdier quotient); RefinedTraceMethods §4.6 (Relative localizing motives); §8.2 (Rational transfer forces periodic descent); gap:linear-weak-additive-motives; gap:linear-motive-tensor-unit; gap:linear-motive-kzero-unit; gap:linear-motive-projection-formula.

### 8.4 Even finite complexes for semilinear Morava modules

Let E=E(k,G) be Lubin–Tate theory of a finite-height formal group over a perfect characteristic-p field k, and H a finite subgroup of Aut(k,G), including its semilinear field part. There is an even-cell finite p-local complex X for which K(k,G)⁰(X) is nonzero finite free over the twisted group ring k[H]. Consequently E⊗DX is a finite nonzero sum of coinduced semilinear E-H modules, and E^hH⊗DX is the same finite nonzero sum of copies of E.

(cmnn20 line 1651, Theorem B.2, Corollary B.3 and their proofs, pp.37–39.)

A proof route is as follows. Use the equivariant finite-complex construction of CMNN Appendix B, including its representation-theoretic realization and even-cell lifting. Lift the residue-field free generators to semilinear Morava E modules and use even periodicity and derived completeness; finite induction equals coinduction.

**Checks.**

- At H=1 the sphere is a rank-one witness; a free twisted k[H]-module of rank d has k-dimension d|H|.
- H=1; nontrivial finite H; X from even-cell theorem: H=1 admits X=S, rank1; free k[H] rank d has k-dimension d|H|; d≥1 makes d|H| nonzero in ℚ.

*Needs:* EllipticCohomology E2, with the all-height extension in the supplier contract; GeneralizedCohomology G2 and G5.1.

### 8.5 Rational transfer for higher real K-theories

Let E be Lubin–Tate theory of a finite-height formal group over a perfect characteristic-p field k, and H a finite subgroup of the automorphism group of the pair (formal group,k), allowing semilinear field automorphisms. Then K₀(E)⊗Q→K₀(E^hH)⊗Q is surjective. In particular the transfer condition for telescopic K-descent holds for E^hH→E.

Throughout this target, H is finite in the semilinear automorphism group of the formal-group/field pair.

(cmnn20 line 1651, Theorem B.2 and Corollaries B.3–B.4, manuscript pp.37–39.)

A proof route is as follows. Use the even finite equivariant complex of the preceding target. Its semilinear equivalence E⊗DX≃coind_H(E)^d descends to E^hH⊗DX≃E^d. If X has M even cells, its Euler class over E^hH is M times the unit; the displayed descent identifies it with the transfer of a finite multiple of [E]. The transfer image is an ideal by the projection formula, and M>0 is invertible over the rationals, yielding surjectivity.

**Checks.**

- The argument retains the field-automorphism factor; at p=3 it applies to the full order-24 supersingular group.
- H=1; p=2 and p=3 supersingular groups: transfer=id at H=1; finite-group orders 48 and 24; after rationalizing a free rank d|H| class, divide by nonzero d|H|.

*Needs:* RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; §8.3 (Telescopic K-theory Galois descent); EllipticCohomology E2, with the all-height extension in the supplier contract; EllipticCohomology E2 items 2–3 (gap:all-height-morava-realization); §8.4 (Even finite complexes for semilinear Morava modules).

### 8.6 Purity for ko-algebras

For any E1 ko-algebra A at the chosen prime, inverting the central degree-eight Bott class b of GeneralizedCohomology G5.4 induces a T(i)-equivalence K(A)→K(A[b⁻¹]) for every i≥2. For i≥3, L_T(i)K(A)=0. No regularity or connectivity assumption on the ko-algebra A is required.

Throughout this target, A is an E1 ko-algebra; the class b∈π₈ko is the central real Bott class.

(lmmt line 978, Corollary 4.19 and Remark 4.20, pp.1031–1032.)

A proof route is as follows. The ko→KO Bott localization is an equivalence on the adjacent heights relevant for i≥2. Base change to A preserves this equivalence; apply purity. Use the commutative ko coefficient ring’s height-one bound and the algebra-valued vanishing theorem.

**Checks.**

- For A = ko this compares K(ko) with K(KO) at every T(i), i≥2.
- A = ko; A = 0; i=2,3: A[b⁻¹]=KO; localized K comparison at i=2; L_T(3)K(A)=0; zero algebra gives 0→0.

*Needs:* §5.5 (The chromatic purity theorem); §6.1 (Theorem B and vanishing for algebras); GeneralizedCohomology G5.4 and TopologicalKTheory T7.1.

### 8.7 Purity for tmf-algebras

For any E1 tmf-algebra A, K(A) is T(i)-acyclic for i≥4. The map K(A)→K(A⊗tmf Tmf) is a T(i)-equivalence for i≥2, and K(A)→K(A⊗tmf TMF) is a T(3)-equivalence. Here Tmf is the nonconnective compactified global-sections spectrum and TMF the periodic open-moduli spectrum; the two are not identified.

Throughout this target, A is an E1 tmf-algebra; the indicated height ranges differ for Tmf and TMF.

(lmmt line 1002, Corollary 4.21(i)–(iii), pp.1032–1033.)

A proof route is as follows. Import the distinct chromatic comparisons tmf→Tmf and tmf→TMF from the modular homotopy owner. Base change those E∞ coefficient maps to A and apply purity at each stated adjacent pair. Apply the algebra-valued upper bound from the height-two coefficient ring.

**Checks.**

- With A = tmf the T(2) comparison is with Tmf; the displayed periodic TMF comparison is asserted at T(3).
- A = tmf; A = 0;i=2,3,4: height 2 comparison goes to Tmf, height 3 to TMF, height 4 K=0; zero algebra gives all values 0.

*Needs:* §5.5 (The chromatic purity theorem); §6.1 (Theorem B and vanishing for algebras); EllipticCohomology E1–E4 and E6, with the spectral comparisons in the supplier contract; §4.30 (Chromatic bounds for modular forms).

### 8.8 Supersingular fixed-point description

At p=2, L_T(3)K(tmf)≃L_T(3)(K(E₂)^hGL₂(𝔽₃))≃(L_T(3)K(E₂))^hGL₂(𝔽₃). At p=3 replace GL₂(𝔽₃) by the full order-24 supersingular stabilizer G₂₄, including the residue-field Galois action. The intermediate T(3)-localized K(TMF) is equivalent to the same spectra. The raw K(tmf)≃K(E₂)^hG equivalence is not claimed.

Throughout this target, E₂ is the Lubin–Tate spectrum of the formal group of a supersingular elliptic curve over 𝔽₄ at p=2, and over 𝔽₉ at p=3. At 2 the GL₂(𝔽₃)-action is transported through the equivariant equivalence L_K(2)TMF(3)≃E₂ and the Galois extension from L_K(2)TMF. At 3, G₂₄ is the automorphism group of the curve/field pair over 𝔽₃, acting semilinearly by Morava realization, with L_K(2)TMF≃E₂^hG₂₄ (the corresponding EllipticCohomology supplier contracts).

(lmmt line 1002, Corollary 4.21(iv) and proof, pp.1032–1033; goerss line 688, Theorem 3.6 and following paragraph, pp.238–239, for the marked Morava realization and automorphism action.)

A proof route is as follows. Use the modular chromatic comparison to replace tmf by periodic TMF at T3. Identify its relevant completed height-two coefficient ring with E2^hG, retaining the full semilinear stabilizer. Apply the rational-transfer descent theorem, now justified by Lubin–Tate transfer; use its separate fixed-point commutation assertion for the final equivalence.

**Checks.**

- At p=2 the group has order 48; at p=3 the full group has order 24 rather than the order-12 geometric automorphism group.
- p=2,3; full versus geometric groups: |GL₂(𝔽₃)|=(9−1)(9−3)=48; at 3 the semilinear group has 12·2=24 elements.
- At p=3, TMF(3) has 3 inverted and hence K(2)-localization zero; it cannot model the nonzero E₂ used here. The p=3 action instead comes from the supersingular curve over 𝔽₉.

*Needs:* §8.7 (Purity for tmf-algebras); §8.3 (Telescopic K-theory Galois descent); §8.5 (Rational transfer for higher real K-theories); EllipticCohomology E1–E4 and E6, with the spectral comparisons in the supplier contract; gap:elliptic-level-three-galois; gap:elliptic-supersingular-at-two; gap:elliptic-supersingular-at-three.

### 8.9 Classical regular localization checks

For the integral coefficient spectra, prove the connective fiber sequences Kconn(ℤ)→Kconn(ko)→Kconn(KO) and Kconn(ℤ)→Kconn(tmf)→Kconn(Tmf). The first arrows are restriction of scalars along ko→Hℤ and tmf→Hℤ respectively; the last arrows come from ko→KO and tmf→Tmf. Their fiber identifications require the regular/coherent module devissage hypotheses, unlike the general algebra-valued purity comparisons. Record the K(Z)-fiber as the source of high-height equivalence, not as a proof of those sequences for all coefficient algebras.

Throughout this target, ko, KO, tmf and Tmf are the integral spectra. Verify for these coefficients the regularity and coherent-support hypotheses in §3.4; no prime localization is imposed on the displayed fiber sequences.

(barwick-lawson line 207, Proposition 3.1 and Corollary 3.2, p.5, for ko and KO; barwick-lawson line 253, Proposition 4.1, p.6, and line 299, Corollary 4.2, p.7, for tmf and Tmf; agh line 1515, Proposition 4.4, p.34, for the nonconnective extension; lmmt line 987, Remark 4.20, p.1032, and lmmt line 1045, Remark 4.22, p.1033, as background.)

A proof route is as follows. Prove the right-regular noetherian and coherent-support hypotheses for the ko Bott localization and tmf→Tmf coefficient localization. For ko, Wood's cofiber sequence Σko→ko→ku (multiplication by η) and the Bott cofiber sequence Σ²ku→ku→Hℤ show that Hℤ is a perfect ko-module; a perfect ko-module is b-nilpotent, b∈π₈ko, exactly when it is truncated. For tmf, show that Hℤ⊗_tmf Hℤ is truncated: away from 6 by the cofiber sequences of c₄ and c₆ on tmf[1/6], and separately after reduction mod 2 and mod 3, where the relative Tor algebras are finite; then identify Tmf with the localization at the multiplicative sets generated by c₄ and by a surviving power of Δ (Δ²⁴ is a permanent class; Δ itself is not), using the cover of the compactified moduli stack by the loci c₄≠0 and Δ≠0. Apply the regular spectral localization target and its bounded noetherian-heart comparison. Compare the resulting K(ℤ) fibers with the purity conclusions after telescopic localization. These verifications are coefficient-model targets here and do not apply to arbitrary coefficient algebras.

**Checks.**

- The general tmf-algebra case is supplied by purity and does not inherit a K(Z) fiber without regularity.
- ko→KO; tmf→Tmf; i=2: both coefficient fibers have K(ℤ) under the stated regular models; L_T(2)K(ℤ)=0.

*Needs:* §3.4 (Regular ring-spectrum devissage); GeneralizedCohomology G5.4 and TopologicalKTheory T7.1; EllipticCohomology E1–E4 and E6, with the spectral comparisons in the supplier contract; §4.45 (Mitchell vanishing and the p-inverted sphere); §4.30; EllipticCohomology E1–E4 and E6.

### Examples

For the degree-two trivial torsor A→A×A, the transfer on K₀ is (a,b)↦a+b and sends (1,0) to 1. Rational-transfer ε-generation makes both fixed-point comparison maps equivalences. At p=2, |GL₂(𝔽₃)|=(9−1)(9−3)=48; at p=3, adjoining the residue-field involution to the geometric order-12 group gives 24. The same full groups occur in the coefficient and K-theory comparisons.

### Dependencies

EllipticCohomology E1–E4 and E6, with the spectral comparisons in the supplier contract; EllipticCohomology E2, with the all-height extension in the supplier contract; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; GeneralizedCohomology G2 and G5.1; GeneralizedCohomology G5.4 and TopologicalKTheory T7.1; Layer 0; Layer 3; Layer 4; §§4.27–4.28 and §6.2 (Hahn, height and chromatic field maps); EllipticCohomology E2 items 2–3 (gap:all-height-morava-realization); §4.30; EllipticCohomology E1–E4 and E6; Layer 5; Layer 6; RefinedTraceMethods §4.10 and GeneralAlgebraicKTheory §§7.1–7.7; RefinedTraceMethods §4.9, Localizing and truncating small-category invariants; RefinedTraceMethods §§2.1–2.2 and 4.6.

## Layer 9: Height-one structure and its limits

### 9.1 Height-one truncation and p-inversion

If A is a K(1)-acyclic E₁-ring, then K(A)→K(A[1/p]) is a K(1)-equivalence, without a connectivity restriction. If A is additionally connective, K(A)→K(π₀A) is a K(1)-equivalence. The equality of T(1)- and K(1)-localization is the known height-one comparison, not the telescope conjecture at arbitrary height.

Throughout this target, A is K(1)-acyclic E1. Only the comparison with π₀A requires A connective.

(lmmt line 1056, Corollary 4.23 and proof, p.1033.)

A proof route is as follows. Since A is a ring, K(1)-acyclicity of A is T(1)-acyclicity (§4.4, or §4.20 directly). Apply purity to A→A[1/p], since the T(0) comparison is automatic and both T(1) terms vanish; the resulting T(1)-equivalence of K-theory spectra is a K(1)-equivalence because T(1) and K(1) have the same Bousfield class (§4.20). §4.19 does not suffice here: K(A) need not be L₁-local, and A=Hℤ at p=2 is K(1)-acyclic with L₁Hℤ=Hℚ≠Hℤ. For connective A use Waldhausen’s p-adic truncation on A[1/p]. Compare with the discrete π₀ ring, keeping the connective assumption exactly at the truncation step.

**Checks.**

- Every discrete ring is K(1)-acyclic, so its K(1)-local K-theory is unchanged by inverting p.
- A = Hℤ,H𝔽₂ at p=2; A = H𝔽₃ at p=3: π₀ comparisons=id; 𝔽_p[1/p]=0; L_K(1)K(𝔽_p)=0.

*Needs:* §5.5 (The chromatic purity theorem); §2.3 (Rational and p-adic truncation); §4.4 (Ring-spectrum acyclicity comparison); §4.20 (Separation above height one).

### 9.2 Nilinvariance, Milnor excision and cdh-descent

On discrete rings, L_K(1)K is nilinvariant and carries Milnor squares with a surjective side to pullback squares. For a qcqs scheme X, the invariant X↦L_K(1)K(Perf(X)) satisfies cdh-descent, using Nisnevich descent and abstract blowup squares with proper finitely presented modification and finitely presented closed immersion, as in LT Appendix A. Arbitrary closed immersions require the filtered-continuity extension in Remark A.3. The scheme statement is the extension through perfect complexes, not a topology on arbitrary noncommutative rings.

Throughout this target, ring inputs are discrete; scheme inputs are qcqs and evaluated on Perf.

(lmmt line 1065, Corollary 4.24, p.1033; lt line 1197, Theorem 3.3, p.29; Theorem A.2 and proof, manuscript pp.35–37.)

A proof route is as follows. Every connective Hℤ-algebra is K(1)-acyclic as an Hℤ-module. Thus §9.1 makes L_K(1)K globally truncating on connective Hℤ-algebras. Apply the Hℤ-linear correction-algebra construction and truncating excision to ordinary ring squares; the nilinvariance proof uses Hℤ-linear auxiliary rings in the same domain (lt line 1201, Remark 3.4 and Corollary 3.5, manuscript pp.29–30). No truncation assertion on arbitrary connective ring spectra is used. Use the perfect-complex extension and Nisnevich descent, then Land–Tamme’s truncating-invariant blowup argument with the noetherian approximation/pro-descent input supplied by scheme K-theory.

**Checks.**

- A nilpotent thickening has the same K(1)-local K-theory; a Milnor square without a surjective side requires additional hypotheses.
- k[ε]/ε²→k; empty qcqs scheme; identity blowup: I²=0; localized fiber=0; K(∅)=0; blowup square with identity modification gives equal values.

- The connective Hℤ-algebra Hℤ⊕ΣHℤ has π₁=ℤ but K(1)-local underlying spectrum zero, since it is an Hℤ-module. This tests the nondiscrete auxiliary domain in the excision proof; it does not declare L_K(1)K truncating on all connective E₁-rings.

*Needs:* §9.1 (Height-one truncation and p-inversion); §2.2 (Excision and nilinvariance for truncating invariants); SchemeKTheoryOperations §§1.1–2.7, 3.1–3.5, 4.1–4.3, 4.12 and 5.2–5.9; gap:localizing-nisnevich-descent; gap:localizing-derived-blowup; gap:abstract-blowup-noetherian-approximation; gap:abstract-blowup-platification-domination.

### 9.3 Flat and smooth spectral affine lines

For an E₁-ring A define the flat polynomial algebra A[x]=A⊗Σ∞_+N. Define the smooth polynomial algebra A{x}=A⊗Sym_S(S), with Sym_S(S) the free E∞ sphere algebra on one degree-zero generator. The canonical A{x}→A[x] is a π₀-isomorphism for connective A, but the two algebras need not be equivalent. Both retain an augmentation at x=0.

Throughout this target, A is E1; the π₀ comparison requires A connective.

(lmmt line 1068, Definition in Corollary 4.25 and Remark 4.26, pp.1033–1034.)

A proof route is as follows. Construct the monoid algebra and the free commutative sphere algebra, keeping their different symmetric-power constructions. Define the comparison by the generator and compute π₀ for connective A. Compare augmentations and extension of scalars; identify the flat construction on HA with H(A[x]) for an ordinary ring A.

The interface includes:

- The chosen degree-zero generator induces Sym_S(S)→Σ∞_+N and hence A{x}→A[x].
- For connective A, both π₀ affine lines identify with π₀(A)[x] and their comparison is the identity.
- The inclusion A→A[x] followed by x=0 is id, and likewise for A{x}.
- A→B induces the two base-change maps compatibly with the generator and augmentation.

**Checks.**

- For an ordinary ring R, HR[x]≃H(R[x]).
- Both affine-line constructions on the zero ring are zero.
- For A = S, the smooth algebra’s degree-d symmetric piece is Σ∞_+BΣd rather than a single sphere; thus the comparison is not generally an equivalence.
- The distinction is visible on the sphere: the degree-d piece of the smooth free algebra contains Σ∞_+BΣd.
- A = Hk; A = 0; degree d=0,1,2 over S: π₀A{x}=π₀A[x]=k[x]; zero algebra stays zero; smooth summands at d=0,1 are S and at d=2 are Σ∞_+BC₂.

*Needs:* RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3.

### 9.4 Height-one homotopy invariance

For connective K(1)-acyclic E₁-ring A, the maps K(A)→K(A[x]), K(A)→K(A{x}), and K(A{x})→K(A[x]) are K(1)-equivalences. The result includes all discrete rings, with no regularity assumption. Flatness or the π₀-isomorphism alone does not assert integral K-equivalence.

Throughout this target, A is connective K(1)-acyclic E1.

(lmmt line 1068, Corollary 4.25 with proof and Remark 4.26, pp.1033–1034.)

A proof route is as follows. The two affine lines are connective and K(1)-acyclic as A-modules. First use height-one truncation to replace the flat input by its ordinary π₀ polynomial ring, then use p-inversion to reduce to a Z[1/p]-algebra. Weibel’s NK result makes multiplication by p invertible on every homotopy group of fib(K(A[x])→K(A)), so its p-completion, hence K(1)-localization, vanishes. Apply height-one truncation to the smooth-to-flat π₀-isomorphism and use composition to obtain the other comparisons.

**Checks.**

- For a singular ring such as 𝔽_p[ε]/ε², this holds after K(1)-localization although integral polynomial invariance fails.
- A = 𝔽_p[ε]/ε²; x=0; A = 0: unit/evaluation composite=id; L_K(1) fibers=0; integral unit 1+εx has evaluation 1 but is nonconstant.

*Needs:* §9.3 (Flat and smooth spectral affine lines); §9.1 (Height-one truncation and p-inversion); §4.37 (Weibel localization and p-power nilpotent invariance).

### 9.5 Comparison with homotopy K-theory

For every discrete ring A, K(A)→KH(A) induces L_K(1)K(A)≃L_K(1)KH(A). Import KH(A)=|K(A[Δ•])| and its simplicial structure from SchemeKTheoryOperations §5.2 (gap:kh-simplicial-model), with A[Δr]=A[x0,…,xr]/(Σxi−1).

Throughout this target, A is a discrete ring; KH is the supplier’s simplicial polynomial model.

(lmmt line 1089, Remark 4.27, p.1034.)

A proof route is as follows. Each simplex algebra is a polynomial algebra in r variables, so its K(1)-local K agrees with that of A by repeated homotopy invariance. Use the coherent augmented simplicial map, then the fact that localization is a left adjoint and preserves this realization. Compare with the supplier’s specified KH model and its normalization maps.

**Checks.**

- For regular noetherian A this agrees with the imported integral K≃KH comparison; singular A is allowed only in the localized assertion here.
- A = k regular field; A = 𝔽_p[ε]/ε²: K(k)=KH(k); singular unit 1+εx is nontrivial NK₁ but its localized NK₁ value is 0.

*Needs:* §9.4 (Height-one homotopy invariance); SchemeKTheoryOperations §§1.1–2.7, 3.1–3.5, 4.1–4.3, 4.12 and 5.2–5.9; gap:kh-simplicial-model; gap:kh-regular-comparison.

### 9.6 The height-one TC obstruction

The p-completion of TC(Z[1/p]) is zero, whereas L_K(1)TC(Z) is nonzero. Thus the map TC(Z)→TC(Z[1/p]) is not a K(1)-equivalence, and the arbitrary-ring high-height comparison K(A)←K(τ≥0A)→TC(τ≥0A) cannot be extended to height one. The nonzero height-one TC(Z) calculation, including p=2, is requested from RefinedTraceMethods §4.17 (gap:tc-z-k1-nonzero) and the p-inverted vanishing from §2.10 (gap:tc-z-inverse-p-vanishing).

Throughout this target, p is fixed; the odd-prime decomposition and the prime-two calculation are separate supplier inputs.

(lmmt line 1097, Remark 4.28, p.1034.)

A proof route is as follows. Use the p-inverted discrete input to compute TC(Z[1/p])^∧p=0. At odd p the known K(1)-local TC(Z) decomposition includes L_K(1)S and a suspended p-complete KU summand; at p=2 use its separately computed filtered analogue. Compare with height-one p-inversion invariance for K and deduce failure of a height-one version of the high trace comparison.

**Checks.**

- A nonzero direct summand at odd p, and the separately proved nonzero prime-two calculation, detect the obstruction.
- p=2,3; ℤ→ℤ[1/p]: L_K(1)TC(ℤ)≠0; TC(ℤ[1/p])^∧p=0; source and target differ.

*Needs:* §9.1 (Height-one truncation and p-inversion); RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); gap:tc-z-k1-nonzero; gap:tc-z-inverse-p-vanishing.

### 9.7 TC does not preserve filtered category colimits

Although L_K(1)TC commutes with filtered colimits of discrete rings, it does not commute with filtered colimits of small stable categories. The filtered colimit of Mod_(Z/p^r)(Perf(Z)) identifies with the p-power-torsion perfect Z-modules and sits in an exact sequence with Perf(Z) and Perf(Z[1/p]). Each stage has zero L_K(1)TC, while the colimit has nonzero L_K(1)TC.

Throughout this target, the diagram is a filtered system of enhanced perfect categories, not a filtered system of rings.

(lmmt line 1110, Remark 4.29, pp.1034–1035.)

A proof route is as follows. Construct the filtered system of module categories with their compatible forgetful functors; every compact p-power-torsion perfect Z-complex belongs to a stage. Each stage’s TC is a module over TC(Z/p^r). The multiplicative unital cyclotomic trace K(Z/p^r)→TC(Z/p^r) makes this a module over K(Z/p^r), whose K(1)-localization vanishes by §4.42 and §4.20. Acyclicity passes from that ring spectrum to its modules, so the stage has zero K(1)-local TC. Use localizing TC on the p-inversion exact sequence: its fiber identifies with TC(Z) at K1 because TC(Z[1/p]) vanishes. This gives nonzero TC of the colimit and contradicts preservation of this category colimit, without contradicting the separate ring-colimit theorem.

**Checks.**

- The counterexample’s objects are enhanced perfect categories; replacing its colimit by a colimit of the coefficient rings changes the assertion.
- r=1,2 in p-power-torsion categories; union: each stage localized TC=0; union localized TC≠0 from the ℤ localization fiber.

*Needs:* §9.6 (The height-one TC obstruction); §4.42 (Finite p-power coefficient vanishing); RefinedTraceMethods §4.9, Localizing and truncating small-category invariants; RefinedTraceMethods §2.10 (Spherical group rings and categorical THH); RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); gap:k1-tc-filtered-colimits; RefinedTraceMethods §4.11 (multiplicative unital cyclotomic trace); §4.20 (height-one comparison).

### Examples

The singular ring 𝔽_p[ε]/ε² has the nonconstant polynomial unit 1+εx in NK₁; evaluation gives 1. Integral polynomial invariance therefore fails, while the K(1)-localized fiber vanishes. TC(ℤ[1/p]) has zero p-completion and L_K(1)TC(ℤ) is nonzero, so the arbitrary-ring high-height trace comparison has no height-one extension.

### Dependencies

EnhancedDerivedSheaves E0.4, E5:abstract.1–4 and E5:presentability.1–3; Layer 2; Layer 4; Layer 5; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §4.9, Localizing and truncating small-category invariants; RefinedTraceMethods §§2.9–2.10; SchemeKTheoryOperations §§1.1–2.7, 3.1–3.5, 4.1–4.3, 4.12 and 5.2–5.9.

## Layer 10: Additive comparison, colimits and cyclic assembly

### 10.1 Chromatic consequences of the bounded-heart fiber

For small stable idempotent-complete C, Kadd(C)→K(C) is a T(i)-equivalence for i≥2. If End_C(X)[1/p]=0 for every X, it is also a T(1)-equivalence. More generally, for a full additive subcategory A⊂C which thickly generates C, Kadd(A)→K(C) is a T(i)-equivalence for every i≥2. A need not itself be closed under every retract; the positive comparison is enough.

Throughout this target, C is small stable idempotent-complete; A is full additive and thickly generates C. The height-one conclusion requires End_C(X)[1/p]=0 for every X.

(lmmt line 765, Proposition 3.12, p.1027; Corollary 4.31 and proof, p.1035.)

A proof route is as follows. For A = C use the bounded-heart fiber; connective K(D♥) is K(Z)-linear and Mitchell kills its heights≥2. Coconnective discrepancies are also acyclic there. Under p-inverted endomorphism vanishing, devissage of the torsion heart reduces its connective K to K(𝔽_p) at height one. For a general additive generator subcategory pass to finite sets of generators and their direct sum X. Compare the positive Kadd-space with K(τ≥0End_C(X)) and use stable Morita plus high-height connective-cover invariance.

**Checks.**

- No integral equivalence Kadd(C)≃K(C) is asserted, since cofiber relations are absent from additive group completion.
- C=0; C=Perf(k); i=2: 0→0; additive K₀=⊕_jℤ maps e_j↦(−1)^j to stable ℤ; after T(2) comparison fiber=0.

*Needs:* §3.6 (Levy’s bounded-heart fiber); §4.45 (Mitchell vanishing and the p-inverted sphere); §4.42 (Finite p-power coefficient vanishing); §5.1 (High-height connective-cover invariance); §1.3 (Additive and stable Schwede–Shipley comparison); §4.15 (Connective periodic vanishing).

### 10.2 Sifted colimits of high-height K-theory

For n≥2, A↦L_T(n)K(A) from all E₁-rings to T(n)-local spectra preserves sifted colimits. The same is true on the full subcategory of T(n−1)-local E₁-rings, whose colimits are formed by localizing ambient ring colimits. No analogous statement for arbitrary filtered colimits of stable categories under L_K(1)TC is inferred.

Throughout this target, n≥2; the diagram is sifted in E₁-rings or in the specified localized full subcategory.

(lmmt line 1162, Corollary 4.32 and proof, pp.1035–1036.)

A proof route is as follows. Import TC/p preservation of sifted colimits on connective E₁-rings. For a sifted diagram Ai compare colim τ≥0Ai→τ≥0(colim Ai); its positive telescope localizations agree, so Theorem A compares their K-theories. Use the high trace equivalence and mod-p detection of telescopic equivalences to move K through the colimit. On the T(n−1)-local ring subcategory, its ambient colimit→localized colimit is an adjacent-height equivalence because T(n−1)-local spectra are T(n)-acyclic; apply purity.

**Checks.**

- Both a filtered diagram and a geometric realization are covered. The subcategory’s colimit is not silently identified with the ambient colimit.
- constant filtered diagram; constant simplicial A; localized subcategory: colim const A = A and realization const A = A; local subcategory colimit=L_(T(n−1))(ambient colim).

*Needs:* §5.2 (The high-height cyclotomic trace); §5.5 (The chromatic purity theorem); §4.46 (Theorem A in both forms); RefinedTraceMethods §4.11 (The cyclotomic trace and multiplicativity); RefinedTraceMethods §4.17, The Dundas–Goodwillie–McCarthy theorem; RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); §4.15 (Connective periodic vanishing); gap:tc-mod-p-ring-sifted-colimits.

### 10.3 Cyclic orbit diagrams and assembly

For a discrete group G, let Or_Cyc(G) be the full subcategory of the G-orbit category on G/H for all cyclic H≤G, including infinite cyclic H. For an E₁-ring R put R[H]=R⊗Σ∞_+H. Use the action-groupoid construction and induction of perfect modules to give a coherent functor G/H↦K(R[H]) and the analogous TC diagram. The collapse G/H→G/G gives assembly colim_OrCyc K(R[H])→K(R[G]).

Throughout this target, G is any discrete group; the family contains every cyclic subgroup, finite or infinite.

(lmmt line 1197, Definition preceding Proposition 4.33, p.1036.)

A proof route is as follows. Construct the transport groupoid of a G-set, then its R-linear perfect-module category; this avoids noncanonical choices of conjugating elements in orbit morphisms. Apply the invariant and identify transitive orbits with the group-ring value. Use the terminal orbit in Or(G) to define the natural cocone and its assembly map.

The interface includes:

- R[H] is the associative monoid algebra with group multiplication.
- Orbit morphisms induce the transport/induction maps, coherently with composition and conjugation.
- The collapse cocone gives the canonical map from the orbit colimit to the value at R[G].
- If G is cyclic, the colimit over Or_Cyc(G) evaluates at G/G.

**Checks.**

- For G=1, assembly is the identity on K(R).
- For G=Z, the family includes G itself and assembly has a terminal indexing orbit.
- For G=Z the family of finite cyclic subgroups contains only 1 and has no orbit G/G; it cannot replace the stated indexing family.
- For cyclic G, G/G belongs to Or_Cyc(G) and is terminal, so assembly is an equivalence before localization.
- G=1,C₂,ℤ,S₃,Q₈: terminal orbit exists for first three; S₃ and Q₈ are noncyclic; omitting ℤ excludes its terminal orbit.

*Needs:* RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §2.10 (Spherical group rings and categorical THH); RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); §1.4 (Waldhausen A-theory).

### 10.4 p-adic TC assembly for cyclic subgroups

For a connective E₁-ring R and any discrete group G, colim_(G/H∈Or_Cyc(G))TC(R[H])→TC(R[G]) is a p-adic equivalence. The colimit is formed before p-completion. This does not assert that uncompleted p-typical TC assembly is always an equivalence.

Throughout this target, R is connective E1; G is any discrete group; completion is after the orbit colimit.

(lmmt line 1197, Proposition 4.33 and proof, p.1036.)

A proof route is as follows. Import the all-cyclic THH assembly equivalence for arbitrary G, with its compatible cyclotomic structure. Import TC/p preservation of all small colimits of connective cyclotomic spectra; all group-ring THH inputs satisfy connectivity. Apply TC/p to the THH assembly equivalence and use mod-p detection of p-complete equivalences.

**Checks.**

- If G is cyclic the assertion is the terminal-orbit identity; arbitrary noncyclic and infinite groups are allowed.
- G=1,ℤ,S₃; R=0: assembly=id for 1 and ℤ; p-completed fiber=0 for S₃; TC(0)=0.

*Needs:* §10.3 (Cyclic orbit diagrams and assembly); RefinedTraceMethods §2.10 (Spherical group rings and categorical THH); RefinedTraceMethods §2.9 (TC, its fiber formula and arithmetic completion); gap:tc-mod-p-cyclotomic-colimits; gap:thh-all-cyclic-assembly.

### 10.5 Telescopic Farrell–Jones assembly

For every E₁-ring R, every discrete group G and every n≥2, the assembly map colim_(G/H∈Or_Cyc(G))K(R[H])→K(R[G]) is a T(n)-equivalence. There is no connectivity requirement on R and the family includes infinite cyclic subgroups.

Throughout this target, R is any E₁-ring, G any discrete group and n≥2.

(lmmt line 1208, Corollary 4.34 and proof, p.1036.)

A proof route is as follows. Use the natural high-height comparison on every group ring to replace K(R[H]) by TC(τ≥0R[H]). Identify τ≥0(R[H])≃(τ≥0R)[H], since the group ring is a direct sum of copies of R as a spectrum. Apply connective p-adic TC assembly, then positive telescopic localization; naturality identifies its map with the K assembly map.

**Checks.**

- The proof covers periodic coefficient rings and infinite G; it does not claim the integral Farrell–Jones conjecture.
- G=1,ℤ,S₃,Q₈; n=2; R=KU: cyclic cases identity; T(2)-localized fibers=0 for nonabelian groups too; τ≥₀KU=ku supplies trace middle term.

*Needs:* §10.4 (p-adic TC assembly for cyclic subgroups); §5.2 (The high-height cyclotomic trace); §10.3 (Cyclic orbit diagrams and assembly); §4.15 (Connective periodic vanishing).

### Examples

For G=1, C₂ or ℤ the cyclic orbit family contains G/G as a terminal object and assembly is an identity before localization. S₃ and Q₈ are nonabelian controls for coherence: their cyclic subgroups do not supply a terminal orbit, but the high-height assembly theorem applies. Removing infinite cyclic subgroups would remove the terminal orbit when G=ℤ.

### Dependencies

Layer 1; Layer 3; Layer 4; Layer 5; RefinedTraceMethods §4.9 and EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.1–2; RefinedTraceMethods §§2.9–2.10, 4.11 and 4.17.

## Downstream consumers

ChromaticHomotopyTheory Layers 3–6 and 8–10 must import §§4.1–4.29 for global finite localization, periodic detection, Hahn acyclicity and telescopic Tate theory; its Layers 12–13 must import §§4.30–4.34 for modular and Thom comparisons and ordinary-homology unit detection. Its chromatic field-map applications must import §6.2. The generic Morava realization, units/Thom colimit and James splitting retain the named supplier owners in Exact supplier contracts. Arithmetic K-theory and regulator developments consume purity and the height-one KH/cdh comparison through the named suppliers. Galois descent for Lubin–Tate and modular coefficients consumes Layer 8, with all equivariant structure retained. Iterated and assembled K-theory use Layers 7 and 10. These consumers do not enter the proof of Theorem A or the CMNN induction.

## Worked examples

For a nonzero algebraically closed characteristic-zero field L, set R=HL[u±1], |u|=2. The cofiber of multiplication by u on HL[u] is HL. Its class as an HL[u]-module is [HL[u]]−[Σ²HL[u]]=0, because two shifts act by +1 on K. Thus the localization map from K(L) into K(HL[u]) is null after the stated comparison. Its p-completed cofiber is ku_p^∧⊕Σku_p^∧, fixing the shift and yielding the height-zero redshift witness (bsy line 3901, Proposition 9.12, pp.89–90).

For a prime p and r≥1, first use the quotient ℤ/pʳ→𝔽_p, whose nilpotent ideal is generated by p. K₀ is ℤ and the negative groups vanish by Bass induction. Positive finite-field groups are of order pʲ−1 in odd degree and zero in positive even degree, so their p-completion has only π₀=ℤ_p. The rank map K(ℤ/pʳ)→Hℤ is rationally and positively telescopically an equivalence. Iterating K preserves the specified π₀=ℤ identifications and gives the comparisons in Layer 7 (lmmt line 858, Example 4.8, p.1029; weibel, Corollary 5.4, p.485).

For the bottom-height boundary, take p odd and R=(HF₂)^tC₂. Its invertible degree-one class makes suspension of perfect modules equivalent to identity. Since suspension acts by −1 on K, multiplication by 2 on K(R) is zero. Hence every positive p-telescope kills K(R), while R[1/p]=R≠0 and R⊗Hℚ=0. This is the precise reason for the rationalization hypothesis at global height zero (bsy line 3929, Remark 9.13, p.90, evaluated at a different coefficient prime; lmmt line 175, Redshift Theorem, p.1014).

For cyclic assembly take G=ℤ and R=KU. The object G/G is terminal in the family of all cyclic subgroups, so assembly is an identity. For G=S₃, the order-two and order-three cyclic subgroups and their conjugation maps form a coherent diagram without a terminal orbit; the theorem gives a T(n)-equivalence for every n≥2. Taking only finite cyclic subgroups would fail the ℤ terminal-object Check (lmmt line 1197, Proposition 4.33 and Corollary 4.34, p.1036).

## References

- **agh**: Benjamin Antieau, David Gepner and Jeremiah Heller, *[K-theoretic obstructions to bounded t-structures](https://arxiv.org/pdf/1610.07207v4)*. Theorem and section numbering of arXiv:1610.07207v4. Locators use this edition; source-line numbers identify its extraction.

- **akq**: Gabriel Angelini-Knoll and J. D. Quigley, *[A homological approach to chromatic complexity of algebraic K-theory](https://arxiv.org/pdf/1908.09164v3)*. Theorem and section numbering of arXiv:1908.09164v3. Locators use this edition; source-line numbers identify its extraction.

- **barwick-lawson**: Clark Barwick and Tyler Lawson, *[Regularity of structured ring spectra and localization in K-theory](https://arxiv.org/abs/1402.6038v2)*. Theorem numbering and manuscript pages of arXiv:1402.6038v2; in the proof of Corollary 4.2 the multiplicative set written as generated by Δ must be read as generated by a power of Δ that survives to π_*tmf. Locators use this edition; source-line numbers identify its extraction.

- **barwick**: Clark Barwick, *[On exact infinity-categories and the theorem of the heart](https://arxiv.org/pdf/1212.5232v4)*. Theorem and section numbering of arXiv:1212.5232v4. Locators use this edition; source-line numbers identify its extraction.

- **behrens**: Mark Behrens, *[Topological modular and automorphic forms](https://arxiv.org/pdf/1901.07990v2)*. Theorem and section numbering of arXiv:1901.07990v2. Locators use this edition; source-line numbers identify its extraction.

- **bgt**: Andrew J. Blumberg, David Gepner and Gonçalo Tabuada, *[A universal characterization of higher algebraic K-theory](https://www.math.columbia.edu/~thaddeus/blumberg/3.pdf)*. Numbering of the author-hosted published text. Locators use this edition; source-line numbers identify its extraction.

- **bgt-mult**: Andrew J. Blumberg, David Gepner and Gonçalo Tabuada, *[Uniqueness of the multiplicative cyclotomic trace](https://arxiv.org/pdf/1103.3923v3)*. Theorem and section numbering of arXiv:1103.3923v3. Locators use this edition; source-line numbers identify its extraction.

- **bhls**: Robert Burklund, Jeremy Hahn, Ishan Levy and Tomer M. Schlank, *[K-theoretic counterexamples to Ravenel’s telescope conjecture](https://arxiv.org/pdf/2310.17459v1)*. Theorem and section numbering of arXiv:2310.17459v1. Locators use this edition; source-line numbers identify its extraction.

- **bhm**: Tobias Barthel, Gijs Heuts and Lennart Meier, *[A Whitehead theorem for periodic homotopy groups](https://arxiv.org/pdf/1811.04030v2)*. Theorem and section numbering of arXiv:1811.04030v2. Locators use this edition; source-line numbers identify its extraction.

- **bsy**: Robert Burklund, Tomer M. Schlank and Allen Yuan, *[The Chromatic Nullstellensatz](https://arxiv.org/pdf/2207.09929v1)*. Theorem and section numbering of arXiv:2207.09929v1. Locators use this edition; source-line numbers identify its extraction.

- **cdh**: Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, *[Hermitian K-theory for stable infinity-categories I: Foundations](https://arxiv.org/pdf/2009.07223v3)*. arXiv:2009.07223v3, §4.4; compact parametrized/retractive comparison at lines 4319–4346. Locators use this edition; source-line numbers identify its extraction.

- **cm-tate**: Dustin Clausen and Akhil Mathew, *[A short proof of telescopic Tate vanishing](https://arxiv.org/pdf/1608.02063v2)*. Theorem and section numbering of arXiv:1608.02063v2. Locators use this edition; source-line numbers identify its extraction.

- **cmnn20**: Dustin Clausen, Akhil Mathew, Niko Naumann and Justin Noel, *[Descent in algebraic K-theory and a conjecture of Ausoni–Rognes](https://www.nullplug.org/publications/GeneralLemma.pdf)*. Numbering of the author-hosted manuscript, pages 1–43. Locators use this edition; source-line numbers identify its extraction.

- **cmnn24**: Dustin Clausen, Akhil Mathew, Niko Naumann and Justin Noel, *[Descent and vanishing in chromatic algebraic K-theory via group actions](https://arxiv.org/pdf/2011.08233v2)*. Theorem and section numbering of arXiv:2011.08233v2. Locators use this edition; source-line numbers identify its extraction.

- **csy**: Shachar Carmeli, Tomer M. Schlank and Lior Yanovski, *[Ambidexterity in chromatic homotopy theory](https://arxiv.org/pdf/1811.02057v3)*. Theorem and section numbering of arXiv:1811.02057v3. Locators use this edition; source-line numbers identify its extraction.

- **hahn**: Jeremy Hahn, *[On the Bousfield classes of H-infinity ring spectra](https://arxiv.org/pdf/1612.04386v2)*. Theorem and section numbering of arXiv:1612.04386v2. Locators use this edition; source-line numbers identify its extraction.

- **hs**: Fabian Hebestreit and Wolfgang Steimle, *[Stable moduli spaces of hermitian forms](https://arxiv.org/pdf/2103.13911v5)*. Theorem and section numbering of arXiv:2103.13911v5. Locators use this edition; source-line numbers identify its extraction.

- **kuhn-guide**: Nicholas J. Kuhn, *[A guide to telescopic functors](https://arxiv.org/pdf/0802.0510v1)*. Theorem and section numbering of arXiv:0802.0510v1. Locators use this edition; source-line numbers identify its extraction.

- **kuhn-tate**: Nicholas J. Kuhn, *[Tate cohomology and periodic localization of polynomial functors](https://arxiv.org/pdf/math/0307173v1)*. Theorem and section numbering of arXiv:math/0307173v1. Locators use this edition; source-line numbers identify its extraction.

- **lmmt**: Markus Land, Akhil Mathew, Lennart Meier and Georg Tamme, *[Purity in chromatically localized algebraic K-theory](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/LMMT2a.pdf)*. Published JAMS 37 (2024), pp.1011–1040; journal theorem numbering and pagination, compared with the preprint. Locators use this edition; source-line numbers identify its extraction.

- **lt**: Markus Land and Georg Tamme, *[On the K-theory of pullbacks](https://arxiv.org/pdf/1808.05559v3)*. Theorem and section numbering of arXiv:1808.05559v3. Locators use this edition; source-line numbers identify its extraction.

- **may-nilpotence**: Akhil Mathew, Niko Naumann and Justin Noel, *[On a nilpotence conjecture of J. P. May](https://arxiv.org/pdf/1403.2023v3)*. Theorem and section numbering of arXiv:1403.2023v3. Locators use this edition; source-line numbers identify its extraction.

- **mah81**: Mark Mahowald, *[bo-resolutions](https://msp.org/pjm/1981/92-2/pjm-v92-n2-p11-s.pdf)*, Pacific Journal of Mathematics 92 (1981). Theorem 1.1, pp.365–366, and Theorem 6.3, p.382, in the publisher's open archive.

- **mil81**: Haynes R. Miller, *[On relations between Adams spectral sequences, with an application to the stable homotopy of a Moore space](https://math.mit.edu/~hrm/papers/miller-relations-between-adams-spectral-sequences.pdf)*, Journal of Pure and Applied Algebra 20 (1981). Theorem 4.11 and Corollary 4.12, pp.294–295, of the author-hosted published text.

- **mitchell**: Stephen A. Mitchell, *[The Morava K-theory of algebraic K-theory spectra](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Mitchell-KK.pdf)*. Numbering of the author-hosted published text. Locators use this edition; source-line numbers identify its extraction.

- **pp**: Irakli Patchkoria and Piotr Pstrągowski, *[Adams spectral sequences and Franke’s algebraicity conjecture](https://arxiv.org/pdf/2110.03669v1)*. Theorem and section numbering of arXiv:2110.03669v1. Locators use this edition; source-line numbers identify its extraction.

- **ravenel**: Douglas C. Ravenel, *[Localization with respect to certain periodic homology theories](https://www.sas.rochester.edu/mth/sites/doug-ravenel/mypapers/loc.pdf)*. Numbering of the author-hosted published text. Locators use this edition; source-line numbers identify its extraction.

- **thom**: Omar Antolín-Camarena and Tobias Barthel, *[A simple universal property of Thom ring spectra](https://arxiv.org/pdf/1411.7988v4)*. Theorem and section numbering of arXiv:1411.7988v4. Locators use this edition; source-line numbers identify its extraction.

- **weibel**: Charles A. Weibel, *[Mayer–Vietoris sequences and module structures on NK_*](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/MV-NK-854.pdf)*. Numbering of the author-hosted published text. Locators use this edition; source-line numbers identify its extraction.

- **yuan**: Allen Yuan, *[Examples of chromatic redshift in algebraic K-theory](https://arxiv.org/pdf/2111.10837v1)*. Theorem and section numbering of arXiv:2111.10837v1. Locators use this edition; source-line numbers identify its extraction.

- **hopkins-smith**: Michael J. Hopkins and Jeffrey H. Smith, *[Nilpotence and stable homotopy theory II](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/HS.pdf)*. Theorems 3, 7 and 11, pp.2–4 of the author-hosted text.

- **mm**: Akhil Mathew and Lennart Meier, *[Affineness and chromatic homotopy theory](https://arxiv.org/abs/1311.0514v5)*. Theorem 7.2, pp.35–37, and Theorem 7.6, p.38, arXiv:1311.0514v5.

- **goerss**: Paul G. Goerss, *[Topological modular forms [after Hopkins, Miller, and Lurie]](https://numdam.org/item/AST_2010__332__221_0.pdf)*. Theorem 3.6 and following paragraph, pp.238–239, for Morava realization and its automorphisms.
