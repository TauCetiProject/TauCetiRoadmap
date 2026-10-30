# Roadmap: arithmetic Λ-rings and q-Witt vectors

**Summary.** Build the general arithmetic Λ-ring and q-Witt library from integral Witt polynomials, commutative algebra and derived completion. The endpoints are relative degree-zero q-Witt rings for every Λ-base and algebra, the q-fixed completed relative Frobenius for étale coefficients, positive-degree q-Witt operations, complete framed difference calculus, and integer torsion-freeness and degreewise completion for smooth algebras over perfectly covered bases, together with their functorial p-complete E∞ de Rham comparison. All primes, including 2, and all positive truncation indices are included.

[Suggested.lean](Suggested.lean) is the acceptance test: it states the ghost-image criterion and unique framed coordinate automorphisms against the pinned APIs. Its module docstring lists the other headline theorems and the carriers they require. This README specifies the full library, including every API target and Check.

## Scope and ownership

This roadmap owns the following algebraic library: Layers 1–2 give big Witt rings, the comparison of their coordinates with the power-series group supplied by KTheoryFiniteLocalFields (§1.4a), the Witt-comonad presentation of arithmetic Λ-rings and its equivalence with special λ-rings (§2.1a), prime sets, perfection and perfect coverage; Layers 3–5 give absolute and relative q-Witt rings and their exactness, base change and completions; Layer 6 gives the completed coefficient Frobenius; Layer 7 gives positive-degree q-Witt systems; Layer 8 specializes the supplied framed calculus to power series, equips the finite framed q-de Rham complex with its skew product over an arbitrary base (§8.2a) and constructs its h-scaled model; Layers 9–10 supply the algebraic support and smooth torsion conclusions. Arithmetic perfection is not the characteristic-p perfection stated by SchemeAndStackFoundations §§0.24, 0.29.

The p-typical carriers and operations, including ghosts, Teichmüller maps, Frobenius, Verschiebung and coordinate extensionality, are already in the pinned Mathlib, and their adic topology is already in pinned Tau Ceti. Layer 1 constructs the distinct big Witt object and proves its comparison with those carriers; it does not rebuild p-typical vectors. Cyclotomic divisor products, prime expansion and characteristic-p power identities are already in Mathlib; their declarations are listed in the supplier contract, and the residual cyclotomic ideal and completion theory belongs to HabiroCyclotomicCompletions. Kähler differentials and their universal derivation are already in Mathlib, and transport of their bases along formally étale extensions is already in Tau Ceti. Scalar Koszul complexes, derived tensor, derived limits, finite-ideal completion and complete flatness are stated by DerivedModuleAlgebra §§0.K.1, 0.2, 1.1–1.9; DG signs and carriers by DGAInfinity Layers 0–1; enhancement and algebra objects by EnhancedDerivedSheaves §0.3 and Layer E5:abstract. AInfCohomology §AI.1.7 owns Koszul complexes of arbitrary commuting module endomorphisms, their maps and scalar cochain-dual comparison, and the twisted differential graded product on the Koszul complex of commuting algebra automorphisms over any commutative base; use those constructions throughout. SchemeKTheoryOperations §§6.2.1–6.2.2 owns special λ-rings, their morphisms, integral universal identities and Newton operations; §2.1a gives the Witt-coalgebra equivalence without importing its scheme K-theory applications. Generic ordinary de Rham theory belongs to DerivedDeRhamCohomology §§2.1–2.21, 3.4–3.6. CrystallineCohomology §CR.4.6 owns extension of a differential along an étale degree-zero algebra, and §CR.2.2 owns PD Poincaré and presentation comparison; §9.6a combines these PD foundations with the supplied δ-envelope results for the completed smooth comparison. PrismaticCohomology supplies bounded prisms; PrismaticCohomologyPartII §5.0 owns complete coordinate scaling, divided differences and framed q-de Rham complexes, §5.18 the skew product on framed q-PD envelopes and its intrinsic comparison, and §§3.16, 5.13, 5.19–5.20 the Frobenius and framed comparisons. Sections 8.1–8.4 provide power-series realizations, the skew product on finite framed q-de Rham complexes over an arbitrary base as the restriction of the supplied twisted Koszul product (§8.2a), completed Kähler-form transports and the distinct h-scaled Frobenius; §9.5a verifies the general-base hypotheses and iterates the one-step comparison.

BordismFormalGroups §F6.5 owns the all-prime arithmetic square for spectra and its consequence for detection by rationalization and prime completions. EnhancedDerivedSheaves Layer E5:spectra-comparison transports it to ℤ-module complexes. Section 1.8 keeps the distinct finite-prime square with localization at a specified positive integer N and its coefficient-algebra compatibility.

HabiroCyclotomicCompletions owns integral cyclotomic ideal and completion theory. HabiroRings and HabiroCohomologyFoundations own Habiro rings, gluing, q-Hodge filtrations and descent; RefinedTraceMethods owns refined traces. Intrinsic q-crystalline cohomology and its geometric comparison belong to PrismaticCohomologyPartII §§5.13, 5.18–5.20. Layer 9 constructs framed algebraic cohomology and exports the functorial smooth algebraic de Rham comparison of §9.7. Geometric q-crystalline cohomology remains with PrismaticCohomologyPartII. Filtered-colimit and reflexive-coequalizer preservation are owned once, by §4.5; §5.4 adds only finite-type and Noetherian conclusions. The unbounded cochain-completion interface belongs to DerivedModuleAlgebra, Part II, extending §§1.5 and 1.8; the regular-parameter multiplicative Bockstein and differential-ideal quotient interfaces belong to DGAInfinity, Part II, extending Layer 1. Their exact extension contracts are gap:cohomology-completion, gap:dga-bockstein and gap:dga-quotient below. The arbitrary-base finite framed skew product is §8.2a here, obtained from the twisted Koszul product of AInfCohomology §AI.1.7 by a coordinate rescaling; its intrinsic q-crystalline comparison stays with PrismaticCohomologyPartII §5.18 under that section’s stronger hypotheses. The continuous group-cohomology Bocksteins `TauCeti.explicitBockstein1` and `TauCeti.integralBockstein` are already in the pinned library, in `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean` and `Integral.lean`; they do not provide the regular-parameter DGA theorem. Section 9.3 is its framed specialization, with a different carrier and parameter. Section 9.6 is the simultaneous induction milestone; §9.7 exports Wagner Proposition 4.2 for every smooth A-algebra, prime and positive index.

## Conventions

Rings are commutative; relative algebras and Λ-rings are unital. Absolute big and q-Witt rings also accept nonunital commutative rings, with operations given by integral polynomials or equivalently the unitization kernel. The zero ring and empty truncation set are allowed. Work in arbitrary universes with each small indexing set fixed before taking a product, colimit or diagram category. Big Witt indices are positive integers. W_m means W_Div(m), whereas Mathlib length a+1 corresponds to `W_{p^a}`. Infinite big Witt rings use restriction limits; the ordinary étale preservation statement has finite truncation set.

Write [n]_q for the polynomial `sum_{0 <= j<n}q^j`, including [0]_q=0. Expressions such as (q^m−1)/(q^d−1) mean this polynomial geometric sum, never division in a quotient ring. Let Φ_d be Mathlib's cyclotomic polynomial, and A[ζ_d]=A[q]/Φ_d(q), without choosing a root in an extension field. The prime-generator cyclotomic ideal identity has m>1; m=1 uses Φ_1=q−1 directly. Distinct-factor intersection statements require distinct indices.

The scalar action on `R^(d)=R tensor_{A,psi_d}A` is through the right factor. The ghost `gh_{m/d}` has target R^(d)[ζ_d]; gh_1 is the first ghost at level m, with d=m. The relative truncated `F_{m/d}` and Layer 6 coefficient Frobenius fix q and right-hand A-scalars. Layer 8 framed Frobenius acts on q by q↦q^p and is semilinear over A. No equivalence for smooth coefficient Frobenius is inferred from the étale coefficient theorem.

All hats mean derived completion unless a degreewise ordinary comparison is explicitly proved. Every completion ideal is finitely generated. The comparison of (p,Φ_d) and `(p,Phi_{pd})` uses equal radicals and a common topology; the ideals need not be equal. A[[h]] denotes power series with h=q−1, so q=1+h is a unit. Smooth affine algebras have finite local coordinate covers. A frame consists of a finite list of coordinates and an étale A-algebra map A[T₁,…,T_r]→R; the map need not be finite. The complete framed calculus itself needs no Λ-structure on A; its Frobenius and the smooth q-Witt conclusions use the indicated perfectly covered Λ-base.

Complexes are cochain complexes. Ordinary and q-Witt de Rham algebras are graded commutative with every odd square zero, including at 2. The framed model instead has the skew rule dT_i f=γ_i(f)dT_i. Its differential is ∑D_i(f)dT_i, and the scaled differential is h times this expression. Ordered wedges use d¹(a,b)=D₁b−D₂a. Bockstein has the sign β_f([x])=[dx/f]. The two Frobenius conventions, all polynomial normalizations, this Koszul sign and the Bockstein sign have computed witnesses in Layers 1, 6, 7, 8 and 9; the values are computed in the Checks below.

## Exact supplier contracts

### From Mathlib

The dependency pin is Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

- `WittVector` and `WittVector.ext` in `Mathlib/RingTheory/WittVector/Defs.lean` give the p-typical sequence carrier and coordinate extensionality.
- `WittVector.map`, `WittVector.map_coeff`, `WittVector.ghostMap`, `WittVector.ghostComponent` and `WittVector.ghostComponent_apply` in `Mathlib/RingTheory/WittVector/Basic.lean` give functorial ring maps and the p-typical ghost polynomial. These declarations assume `CommRing R` and `Fact p.Prime` for the ring structure.
- `TruncatedWittVector`, `TruncatedWittVector.instCommRing`, `WittVector.truncate`, `WittVector.coeff_truncate`, and `TruncatedWittVector.truncate` in `Mathlib/RingTheory/WittVector/Truncated.lean` fix length as `Fin n`, including n=0.
- `WittVector.frobenius`, `WittVector.ghostComponent_frobenius` and `WittVector.frobenius_eq_map_frobenius` in `Mathlib/RingTheory/WittVector/Frobenius.lean`; the last assumes characteristic p. `WittVector.frobeniusEquiv` assumes both `CharP R p` and `PerfectRing R p`.
- `WittVector.verschiebung`, `WittVector.verschiebung_coeff_succ` and `WittVector.verschiebung_injective` in `Mathlib/RingTheory/WittVector/Verschiebung.lean`; `WittVector.teichmuller` and `WittVector.ghostComponent_teichmuller` in `Mathlib/RingTheory/WittVector/Teichmuller.lean`. They have p-typical scope only.
- `Algebra.TensorProduct.includeRight` in `Mathlib/RingTheory/TensorProduct/Basic.lean` fixes the right scalar factor of the algebra tensor product; `Algebra.Etale` and `Algebra.FormallyEtale` in `Mathlib/RingTheory/Etale/Basic.lean` fix the étale predicates; `KaehlerDifferential`, `KaehlerDifferential.D`, `KaehlerDifferential.linearMapEquivDerivation` in `Mathlib/RingTheory/Kaehler/Basic.lean` supply degree-one differentials; `PowerSeries`, `PowerSeries.coeff`, `PowerSeries.constantCoeff`, `PowerSeries.algebraPowerSeries` in `Mathlib/RingTheory/PowerSeries/Basic.lean` supply complete series carriers and their scalar action; `PowerSeries.isUnit_iff_constantCoeff` in `Mathlib/RingTheory/PowerSeries/Inverse.lean` supplies the unit criterion used in §9.2; `Polynomial.cyclotomic` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` supplies Φ_n. In the same file, `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` and `Polynomial.prod_cyclotomic_eq_geom_sum` give, for n>0 over every commutative ring, the divisor product q^n−1 and the product with the index 1 omitted equal to [n]_q.

- `Polynomial.cyclotomic_zero` and `Polynomial.cyclotomic_one` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean` give Φ_0=1 and Φ_1=q−1. `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd`, `Polynomial.cyclotomic_mul_prime_dvd_eq_pow`, `Polynomial.cyclotomic_expand_eq_cyclotomic_mul` and `Polynomial.cyclotomic_expand_eq_cyclotomic` in `Mathlib/RingTheory/Polynomial/Cyclotomic/Expand.lean` supply the characteristic-p powers and integral prime-expansion identities. The first pair requires a prime p and characteristic p; the second pair works over any commutative ring. The p-divisibility hypothesis selects the appropriate identity. At d=1 the first identity gives Φ_2=q−1 over 𝔽₂ and Φ_3=(q−1)² over 𝔽₃, the polynomial boundary cases in §6.2.

### From Tau Ceti

The dependency pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The p-typical comparison respects `WittVector.isAdicComplete_span_p_teichmuller` in `TauCeti/RingTheory/WittVector/Complete.lean`: R is characteristic p and perfect, and is complete at (ϖ). `TauCeti.WittVector.continuous_frobenius` and `TauCeti.WittVector.continuous_frobeniusEquiv_symm` in `TauCeti/RingTheory/WittVector/Frobenius.lean` require an adic topology at (p,[ϖ]); the inverse also needs perfectness. They supply compatibility with the existing p-typical topology, not the relative coefficient map of Layer 6. No endpoint depends on strengthening these declarations. `TauCeti.kaehlerBasisOfFormallyEtale` and `TauCeti.kaehlerBasisOfFormallyEtale_apply` in `TauCeti/RingTheory/Kaehler/FormallyEtale.lean` transport an S-basis of Ω[S/A] to a T-basis of Ω[T/A] for a commutative scalar tower A→S→T with T formally étale over S. For S=A[T₁,…,T_r], this supplies the coordinate differential basis used in §§8.3 and 9.1.

### From TauCetiRoadmap.DerivedModuleAlgebra

Import §0.K.1, §0.2, §1.1, §1.2, §1.3, §1.5, §1.7, §1.8, §1.9. Scalar Koszul complexes; derived module tensor and limits; finite-ideal completion, radical invariance and Nakayama; bounded-torsion ordinary comparison; complete flatness and bounded-base complete faithful-flat descent. The base roadmap supplies module completion; its Part II extension supplies the following cochain interface.

**`gap:cohomology-completion` — DerivedModuleAlgebra, Part II: unbounded cochain completion.** Required extension of §§1.5 and 1.8. For every possibly unbounded ℤ[q]-cochain complex M, h=q−1 and prime p, assume that each M^i and H^i(M) has bounded h-power torsion, is p-torsion-free, and has mod-p reduction with bounded h-power torsion; bounds may depend on i. Require that degreewise ordinary h-completion represents derived h-completion, preserves these three conditions, and gives H^i(LΛ_h M)≅LΛ_h H^i(M) and H^i(LΛ_(p,h) M)≅LΛ_(p,h) H^i(M), naturally in M. These are isomorphisms of discrete cohomology modules; the hypotheses make the completions on the right discrete. (Wagner v5 Lemma 4.25 and proof, pp. 64–65, wagner lines 3198–3227.)

- The comparison commutes with the completion units and maps of cochain complexes.
- Reduction modulo p of the h-completion is the h-completion of M/p; the same assertion holds for the cohomology modules.
- Neither boundedness of M nor a uniform torsion bound across all degrees is required.

### From TauCetiRoadmap.DGAInfinity

Import Layer 0, Layer 1. Signed graded modules, Koszul braiding, associative nonunital, unital and augmented DG algebras, maps, opposites, tensors, cycles, boundaries and cohomology multiplication. The multiplication conditions of §7.1 specialize these carriers. The following Part II extensions supply the multiplicative regular-parameter and algebra-ideal interfaces on these carriers; DG-category quotients are a different construction.

**`gap:dga-bockstein` — DGAInfinity, Part II: regular-parameter multiplicative Bocksteins.** Required extension of Layer 1, using AInfCohomology §AI.1.4 for the additive Bockstein. For an associative cochain B-DGA P over a commutative ring B and a scalar f∈B acting injectively on every term, require on H*(P/f) the Bockstein β_f[x]=[y] when dx=fy. Use the additive principal-ideal Bockstein and its line trivialization by f. Require lift independence, square zero, the signed derivation law β_f(xy)=β_f(x)y+(−1)^|x|xβ_f(y), and naturality under B-DGA maps with the same regular parameter. For g,f acting injectively on every term and f=ag, let F:H*(P/f)→H*(P/g) be reduction and V:H*(P/g)→H*(P/f) multiplication by a; require Fβ_fV=β_g. F is a graded algebra map and V a graded additive map. (Wagner v5 §4.16, p. 61, wagner lines 3026–3032; §4.23, p. 64, wagner lines 3178–3194.)

- The source and target of β_f in degree i are H^i(P/f) and H^(i+1)(P/f).
- Reduction and parameter multiplication compose along chains of divisibilities, compatibly with the displayed Bockstein law.
- If P is graded commutative and strictly odd alternating, these properties pass to its cohomology and β_f gives its degree-one DGA differential.

The general associative product law follows by lifting cycles and dividing the DG Leibniz identity by the termwise regular scalar; the cited framed application does not impose commutativity on this extension.

**`gap:dga-quotient` — DGAInfinity, Part II: differential-ideal quotients.** Required extension of Layer 1. For an associative cochain B-DGA P over a commutative ring B and a homogeneous two-sided ideal J with d(J)⊆J, require P/J as an associative B-DGA and its projection P→P/J, initial among B-DGA maps out of P killing J. For any homogeneous relations require their least homogeneous two-sided differential ideal. (Wagner v5 Proposition 3.12 and Definition 3.13, pp. 40–41, wagner lines 1956–2010.)

- The quotient differential takes [x] to [dx], and its square and DG Leibniz rule descend.
- A homogeneous set maps to zero under a DGA map iff its differential ideal does; factorizations through the quotient are unique and compose.
- Graded commutativity and strict odd alternation descend whenever P has them, including in characteristic two.

The general associative statement uses the intersection of homogeneous two-sided differential ideals and degreewise quotient modules; the cited application is the q-Witt differential ideal.

### From TauCetiRoadmap.AInfCohomology

Import §AI.1.7, `Decalage.koszulComplex`, its intertwining maps, cone description, cohomology and scalar cochain-dual comparison. In the convention K(M;D)^k=M⊗∧^k B^r, d⁰(m)=(D₁m,D₂m) and d¹(a,b)=D₁b−D₂a. Import from the same section `AInf.koszul_products_and_cohomology`: for a commutative ring B, a B-algebra E and pairwise commuting B-algebra automorphisms γ_s of E, the Koszul complex K_E(γ_s−1) on the ordered exterior basis x_I is a unital associative differential graded B-algebra with x_sx_u=−x_ux_s, x_s²=0 also in characteristic two, x_sa=γ_s(a)x_s, d(x_s)=0 and d(a)=∑_s(γ_s(a)−a)x_s, satisfying the signed Leibniz law. No flatness, torsion-freeness or regularity hypothesis is part of this import; §8.2a restricts this product along a coordinate rescaling. Import §§AI.1.1–AI.1.6 for principal and derived décalage, multiplicativity, `Decalage.bockstein` and its lift equation dx=fy ⇒ β_f[x]=[y], reduction of décalage to the Bockstein complex, completion and flat/nonflat base-change criteria. The nonflat criterion requires regular f,g and f modulo g and g-torsion-free cohomology of the derived mod-f reduction; completeness alone is insufficient.

### From TauCetiRoadmap.SchemeKTheoryOperations

Import only §§6.2.1–6.2.2: `TauCeti.LambdaRing.PreLambda`, `TauCeti.LambdaRing.Hom`, `TauCeti.LambdaRing.Special`, the integral product/composition polynomials and `TauCeti.LambdaRing.adams`. A special λ-ring is a pre-λ-ring satisfying those integral identities and λⁿ(1)=0 for n≥2. No K₀ carrier or scheme operation is an input to the equivalence of §2.1a.

### From TauCetiRoadmap.KTheoryFiniteLocalFields

Import from its Conventions, for a commutative unital ring R, the multiplicative group `𝕎_N(R)` of units of R[t]/(t^(N+1)) with constant coefficient 1 for N≥1, the group `𝕎(R)` of series in R[[t]] with constant coefficient 1, the Verschiebung `V_n : 𝕎_m(R) → 𝕎_(mn)(R)` induced by t↦tⁿ, and the Teichmüller class (1−at)⁻¹. Only these series-side objects are imported. The coordinate carrier W_(S_N)(R), the map γ_N out of it, its coefficient, restriction, Verschiebung and Teichmüller compatibilities and the restriction limit are §1.4a here, because they need the coordinate big Witt ring of §1.3.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Import §0.3, §E5:abstract and Layer E5:spectra-comparison. Point-site enhancement of derived tensor and coherent limits, stable finite fibre/cofibre calculus and derived commutative algebra objects. The declarations `moduleSpectra_equiv_derived` and `symmetricSpectra_towerComparison` identify ℤ-module complexes and their localization/completion diagrams with Hℤ-module spectra. No animation of the q-Witt functor is required.

### From TauCetiRoadmap.BordismFormalGroups

Import §F6.5, the all-prime arithmetic square for arbitrary spectra, with vertices X, `prod_p X_p^hat`, X_ℚ and `(prod_p X_p^hat)_Q`. Consume its consequence for detection by rationalization and prime completions through EnhancedDerivedSheaves Layer E5:spectra-comparison. Rationalization remains outside the infinite product.

### From TauCetiRoadmap.SchemeAndStackFoundations

Import §0.23a, §0.29, §4.1. Étale topological invariance, affine relative Frobenius isomorphisms for étale maps, polynomial Frobenius ranks, and unique infinitesimal lifts of formally étale morphisms. Characteristic-p perfection is not arithmetic Λ-perfection.

### From TauCetiRoadmap.HabiroCyclotomicCompletions

Import §4.1 for integral distinct-order cyclotomic ideal quotients and comaximality, and §5.2 for comaximal product splitting, as specified by `gap:cyclotomic-contract` below. Section 3.2a derives the prime-generator identity from §4.1 and the pinned divisor factorization.

### From TauCetiRoadmap.DerivedDeRhamCohomology

Import §§2.1–2.21 for exterior de Rham algebras and their universal differential and §§3.4–3.6 for relative polynomial Cartier theory, as specified by `gap:ordinary-derham` below.

### From TauCetiRoadmap.CrystallineCohomology

Import §CR.4.6, “Witt localization and étale descent,” specifically its general differential-extension lemma and mapping property for a commutative DGA E and an étale E⁰-algebra T. Use its relative B-linear, strictly odd-alternating specialization in `gap:ordinary-derham`. Import §CR.2.2, the relative PD Poincaré lemma, crystalline computation by embeddings and independence of presentations; §9.6a supplies their completed δ-presentation adapter.

### From TauCetiRoadmap.PrismaticCohomology

Import §0.6 for p-torsion-free Frobenius reconstruction, §0.77 for the q-de Rham prism and §1.20 for the smooth Hodge–Tate comparison with its finite locally free differential-form cohomology. Import §§0.68–0.69 for the free δ/PD pushout and p-regular, finite mod-p regular-sequence δ-envelopes. Section 9.6a supplies the passage to the δ-compatible PD-presentation interface gap:pd-presentation below.

### From TauCetiRoadmap.PrismaticCohomologyPartII

Import §5.0, `FramedAlgebra.gamma`, `FramedAlgebra.toQFraming`, `QFraming.qDeriv`, `QFraming.qDeRhamComplex` and their coordinate-injective naturality and Frobenius identities. For K=(h), no δ-structure is required; for K=(p,h), retain p-regularity, completeness of P/p and the δ-base with δ(q)=0. Import §5.18, `QDeRham.skewDGA` and its Frobenius-compatible E₁ comparison for framed q-PD envelopes over D flat over ℤ_p[[h]], with (p,h)-completion, §§5.13, 5.19–5.20 for the Frobenius-twisted q-crystalline/prismatic comparison and framing-change cocycles, and §3.16 for the one-step Frobenius/Lη equivalence. Section 5.21 is its smooth ℤ_p specialization. Section 9.5a supplies the distinct arbitrary-perfectly-covered-base specialization and all-α iteration required here. The skew product `QDeRham.skewDGA` is imported only in §5.18’s range; the product on `QFraming.qDeRhamComplex` over an arbitrary base is constructed in §8.2a from the twisted Koszul product supplied by AInfCohomology §AI.1.7.

The following interfaces fix the mathematical contracts and their owners. Each label names the exact supplied interface or local adapter consumed in the build.

**`gap:cyclotomic-contract` — Cyclotomic integer ideals and completion topology.** Import HabiroCyclotomicCompletions §4.1 over ℤ[q]: for distinct positive a,b identify ℤ[q]/(Φ_a,Φ_b) as zero unless max(a,b)/min(a,b)=p^k with p prime and k≥1, and then as 𝔽_p[q]/Φ_min(a,b). Its comaximality and §5.2's product splitting give, for each prime p, α≥0 and n>0 with gcd(n,p)=1 and m=p^αn, `Z_(p)[q]/(q^m-1) ~= prod_{d|n}Z_(p)[q]/Phi_d(q^(p^alpha))`. The factorization `Phi_d(q^(p^alpha))=prod_{j=0}^alpha Phi_{d*p^j}(q)`, for p∤d, follows by iterating the Mathlib expand identities. Section 3.2a derives `([p]_{q^(m/p)} : p prime, p|m)=(Phi_m)` for m>1 from the supplied pairwise comaximality and the pinned divisor factorization; this is a local consequence, rather than an additional supplier export. The equal-radical consequence of the Mathlib identities is §6.2, using DerivedModuleAlgebra §§1.2–1.3. The prime-generator formula excludes m=1, and the intersection formula excludes equal indices. (Wagner v5 Lemmas 2.1–2.3, pp. 8–9, wagner lines 305–371; Lemma 2.30, pp. 24–25, wagner line 1214; Wagner–Habiro v2 §2.7, pp. 15–16, wagner-habiro line 647.)

**`gap:ordinary-derham` — Ordinary de Rham DGA, étale differentials and polynomial Cartier cycles.** Import DerivedDeRhamCohomology §§2.1–2.21, 3.4–3.6 for every commutative unital base B: supply the exterior de Rham DGA `Omega*_{R/B}` for every commutative B-algebra R, with its universal differential, strict odd alternation, base change and localization; for every prime p and arbitrary characteristic-p B supply the relative polynomial Cartier isomorphism for B[T₁,…,T_r], with Frobenius-twisted source and cycle representatives given by B-linear combinations of `T^(pv)prod_{i in I}T_i^(p-1)dT_I` modulo exact forms, without perfectness of B. For the differential-extension step import CrystallineCohomology §CR.4.6: for a nonnegative graded-commutative, strictly odd-alternating DG B-algebra P and étale B-algebra map P⁰→S, use the unique differential on `S tensor_{P^0}P` extending d and its mapping property. It remains B-linear since d kills B; the tensor multiplication preserves every odd square zero, also at 2. Morphisms are B-DGA maps and compatible P⁰-algebra maps from S to degree zero. The exterior algebra starts from Mathlib Kähler differentials; its finite-coordinate basis uses the Tau Ceti formally étale basis interface. (Wagner v5 Definition 3.1, p. 37, wagner line 1822; Lemma 3.32, p. 51, wagner line 2561; the Cartier lifting argument, p. 73, wagner line 3584.)

**`gap:prismatic-frobenius` — Frobenius-compatible framed q-prismatic input.** PrismaticCohomologyPartII §§3.16, 5.13, 5.18–5.20 supplies the one-step and q-PD comparisons; §9.5a specializes and iterates them. For a perfectly covered Λ-ring A, prime p and finite-coordinate étale frame of R/A, set h=q−1, D=Â_p[[h]], I=([p]_q), φ|_Â_p=ψ_p and φ(q)=q^p. The input is `S^(1)=(Rhat_p tensorL_{Ahat_p,psi_p}D/I)^hat_p`, with its right D/I-action, and Δ=Δ_(S^(1)/D). The framed comparison Δ≃C□^∧_p is multiplicative in E₁-D-algebras and identifies the C□ Frobenius of §8.4 with prismatic Frobenius; Δ carries the intrinsic E∞ structure. The algebra map Â_p=D/(h)→D/I is induced by φ, hence acts on coefficients by ψ_p. Section 9.5a proves completed Frobenius base-change compatibility, the all-α décalage formula and its Bockstein reduction; none is inferred from the ℤ_p specialization alone. (Bhatt–Scholze v4 Theorem 15.3, p. 103, bhatt-scholze line 3898; Theorem 16.18, p. 113, bhatt-scholze line 4289; Constructions 16.19–16.20, pp. 114–115, bhatt-scholze line 4316; Theorem 16.22, p. 115, bhatt-scholze line 4378; Wagner v5 Lemma 4.32, p. 70, wagner line 3459.)

**`gap:pd-presentation` — Multiplicative δ-compatible PD-presentation comparison.** Section 9.6a owns the completed adapter for a perfectly covered Λ-ring A, smooth A-algebra R and prime p. It combines PrismaticCohomology §§0.68–0.69's regular δ/PD envelopes with CrystallineCohomology §CR.2.2's PD Poincaré and presentation comparisons, DerivedModuleAlgebra's completion, and EnhancedDerivedSheaves' multiplicative enhancement. Its output is the natural E∞ comparison for every p-completely ind-smooth δ-presentation used in §9.7, including coherent comparison between presentations. (Wagner v5 §4.34, pp. 71–72, wagner lines 3492–3539.)

## How to read the build

Read Layers 1–2 for the integral and arithmetic input and arithmetic fracture detection, Layers 3–4 for the initial absolute and relative systems, Layer 5 for étale and completion comparisons, Layer 6 for the q-fixed overlap used by cyclotomic consumers, and Layers 7–8 for positive-degree and framed calculus. Layer 9 gives the algebraic support of the simultaneous smooth torsion induction and exports the functorial smooth E∞ de Rham comparison for all positive indices. Layer 10 exports smooth integer torsion-freeness and degreewise completion. Every target states its context and source, followed by its public laws, proof route and discriminating checks. The `gap:` labels specify the supplied mathematical interfaces and the PD-presentation adapter; local support results are cited by section.

## Layer 1: Big Witt rings and arithmetic fracture

### 1.1 Truncation sets

Define `BigWitt.TruncationSet`. A truncation set S is a subset of positive integers closed under positive divisors, including the empty set. Put S/n = {e > 0 | ne ∈ S}, Div(m) = {d > 0 | d divides m}, and `BigWitt.ghostPolynomial` by `w_n(x) = sum_{d|n} d*x_d^(n/d)` for x ∈ R^S and n ∈ S. R is a commutative ring, possibly without identity; n > 0. (hesselholt line 205, §1 before Proposition 1.2, lines 205–268; Wagner §2.6, wagner line 435; printed hesselholt v3 pp. 5–7; wagner v5 p. 10).

- Equality is membership equivalence.

- S/n is divisor closed; (S/n)/k = S/(nk).

- w_n commutes with every coefficient ring map.

Bundle a subset of positive integers and a proof of divisor closure; Div(m) is the canonical finite example. In `Suggested.lean`, `BigWitt.TruncationSet` has `carrier : Set ℕ`, `positive : ∀ n ∈ carrier, 0 < n`, and `divisor_closed : n ∈ carrier → 0 < d → d ∣ n → d ∈ carrier`. This realizes the same positive-index notion without requiring a new coordinate carrier. For unital coefficient rings, `BigWitt.ghostPolynomial` is the divisor sum on functions ℕ→R; only the restriction to S enters any theorem. Its nonunital extension uses the same positive-exponent polynomials.

*Construction and proof.* Finite divisor sums define integral polynomials; divisor transitivity gives the closure and evaluation laws.

*Needs:* commutative rings, finite divisor sums and integral polynomial evaluation.

**Checks.**

- For Div(6), w_6 = x_1^6 + 2x_2^3 + 3x_3^2 + 6x_6; omission of mixed prime divisors fails.
- The empty set gives the singleton product and no ghost coordinates; requiring a first coordinate would exclude this truncation set.
- w_1 = x_1, w_2 = x_1^2 + 2x_2; using zero-based p-typical indices fails. The subset {2} is not a truncation set because it omits 1. Div(6) is divisor closed, whereas {2} fails the same field condition.

### 1.2 The ghost image criterion

Prove `BigWitt.ghost_image`. If B has endomorphisms φ_p lifting pth powers modulo p, a sequence b ∈ B^S lies in the ghost image iff b_n ≡ `phi_p(b_{n/p})` modulo p^v_p(n)B for every n ∈ S and prime p dividing n. Ghosts are injective on S-coordinates if multiplication by every n ∈ S is injective on B. The injectivity assertion holds for every commutative B without specifying Frobenius lifts. B is a commutative unital ring; a lift φ_p is specified for every prime appearing in S. Pairwise commutation is unnecessary for the ghost image criterion. (hesselholt line 223, Lemma 1.1, lines 223–267; Proposition 1.2 proof, hesselholt line 277; printed hesselholt v3 pp. 6–7).

- Integer torsion-freeness at all primes occurring in S implies ghost injectivity.

- If all n ∈ S are units, every ghost sequence has a unique coordinate sequence on S. The criterion `BigWitt.ghost_image` uses coordinate functions ℕ→B restricted to S; coordinates outside S carry no uniqueness claim.

*Construction and proof.* Choose Witt coordinates in divisor order; the congruences make the next numerator divisible by n. Uniqueness needs n-torsion-freeness, existence does not require dividing by a unit.

*Needs:* Layer 1.1 `BigWitt.TruncationSet`.

**Checks.**

- Over ℤ with φ_2 = id and S = Div(2), b_2 ≡ b_1 modulo 2 is the image condition. Coordinates (1,1) give ghosts (1,3), while the pair (0,1) has no integral coordinate preimage; replacing the congruence by unrestricted surjectivity fails.
- Over 𝔽₂, (0,1) has both ghost coordinates zero for S = Div(2); injectivity without torsion-freeness fails.
- For S = ∅, the empty sequence is in the image and the map is injective.
- With all coordinates equal to 1 on Div(6), (w₁,w₂,w₃,w₆)=(1,3,4,12). For φ₂=φ₃=id on ℤ, the n=6 differences are 12−4=8∈2ℤ and 12−3=9∈3ℤ; keeping only prime-power indices would miss this coordinate.

### 1.3 Big Witt rings

Construct the big Witt ring W_S(R) as the natural commutative ring on R^S whose ghost polynomials are ring maps. For nonunital R use the same integral operation polynomials. For T ⊆ S, restriction is a ring map; W_S is the inverse limit of its finite subtruncations. S is any truncation set; R is commutative, with or without identity. (hesselholt line 268, Proposition 1.2, lines 268–298; Proposition 1.6 proof, lines 383–397; wagner §2.6; printed hesselholt v3 pp. 7, 10; wagner v5 pp. 10–11).

- Coordinates construct every element; coeff (mk x) d = x_d.

- Elements agree iff all their Witt coordinates agree.

- Ring maps act on coordinates; map_id and map_comp hold.

- Restrictions compose and commute with ghosts and coefficient maps.

- W_S(R) identifies with the kernel for W_S(ℤ ⋉ R) → W_S(ℤ).

*Construction and proof.* Apply 1.2 over the torsion-free polynomial ring in universal coordinates to obtain integral addition, multiplication and negatives. Verify identities there by ghosts and specialize. The kernel model handles nonunital inputs without a fictitious unit.

*Needs:* Layer 1.1 `BigWitt.TruncationSet`; Layer 1.2 `BigWitt.ghost_image`.

**Checks.**

- In W_Div(2)(ℤ), τ(1)+τ(1) has coordinates (2,−1), not (2,0).
- W_∅(R) and W_S(0) are zero rings; `W_{1}(R)` ≅ R.
- For the nonunital ring R=(ℤ,+) with zero multiplication, W_Div(2)(R) has componentwise addition and zero multiplication: (a,b)+(c,d)=(a+c,b+d) and (a,b)(c,d)=(0,0). A spurious unit in R would change these operations.

### 1.4 Frobenius, Verschiebung and Teichmüller maps

For every n > 0 construct F_n : W_S(R) → `W_{S/n}(R)`, additive V_n in the reverse direction, and the multiplicative Teichmüller map τ : R → W_S(R). Ghosts satisfy w_e F_n = `w_{ne}`; `(V_n x)_{ne}` = x_e and other coordinates vanish. S is divisor closed; R is a commutative ring; units are preserved in the unital case. (hesselholt line 301, Lemmas 1.3–1.5, lines 301–371; printed hesselholt v3 pp. 8–9).

- `F_a F_b = F_{ab}`; `V_a V_b = V_{ab}` with the indicated shifted truncations.

- On `W_{S/n}(R)`, F_n V_n = n.

- For c = gcd(a,b), `F_a V_b = c V_{b/c} F_{a/c}` on `W_{S/b}(R)`, with target `W_{S/a}(R)`.

- x V_n(y) = V_n(F_n(x)y).

- w_e(τ(r)) = r^e and F_n τ(r) = τ(r)^n.

- `x = sum_{d in S} V_d tau(x_d)`, converging in the finite-restriction topology.

*Construction and proof.* Construct F by the universal polynomial argument in 1.2; define V and τ on coordinates. Prove all identities on universal torsion-free rings using ghosts, then specialize.

*Needs:* Layer 1.3.

**Checks.**

- For S = Div(2), F_2(x_1,x_2) = x_1^2+2x_2 and V_2(a)=(0,a).
- F_1 and V_1 are identities, including S=∅.
- τ(−1) = −τ(1)+V_2τ(1) in W_Div(2)(ℤ); treating τ as additive fails.

### 1.4a Big Witt power-series comparison

For every commutative unital ring R and integer N≥0, put S_N={d>0 | d≤N} and let U_N(R) be the multiplicative subgroup of units in R[t]/(t^(N+1)) whose constant coefficient is 1; for N≥1 this is the supplied group `𝕎_N(R)` of KTheoryFiniteLocalFields (Conventions), and U_0(R) is trivial. Prove the big Witt power-series comparison: the natural group isomorphism `gamma_N : (W_{S_N}(R), +) ~= U_N(R)` is given by `gamma_N((a_d)) = prod_{d=1}^N (1-a_d*t^d)^(-1) mod t^(N+1)`. Each factor is a unit because a_d t^d is nilpotent in this quotient. Every constant-one truncated series has a unique such factorization. No torsion-freeness or invertibility of positive integers in R is assumed. (Hesselholt v3 Proposition 1.14, pp. 14–15, hesselholt line 589; Addendum 1.16 and Example 1.17, p. 15, hesselholt lines 644–655.)

Taking restriction limits gives the group isomorphism `gamma_infty : (W_{positive integers}(R), +) ~= U_infty(R)`, where U_∞(R) is the supplied multiplicative group `𝕎(R)` of series in R[[t]] with constant coefficient 1 and `gamma_infty((a_d)) = prod_{d>=1}(1-a_d*t^d)^(-1)`. The product means that each coefficient stabilizes in its finite partial products; a factor of index d changes no coefficient of degree less than d. Its reduction to U_N(R) is γ_N of the restriction to S_N. For nonunital R, define U_N(R) as the kernel of U_N(ℤ⋉R)→U_N(ℤ), and similarly U_∞(R); these consist of constant-one truncated or formal series in the unitization with every positive coefficient in R. The comparisons follow by applying the unitization kernel of §1.3. (Hesselholt v3 Proposition 1.14 and proof, pp. 14–15, hesselholt lines 583–628; §1.3.)

- For every coefficient ring map f:R→R′, applying f to the coefficients of γ_N(x) gives `gamma_N(W_{S_N}(f)(x))`; the same identity holds for γ_∞. Identity and composite coefficient maps respect these comparisons.

- For 0≤M≤N, let `rho_{N,M} : U_N(R) -> U_M(R)` be reduction modulo t^(M+1). Then `rho_{N,M}(gamma_N(x)) = gamma_M(x|_{S_M})`; these maps compose and commute with coefficient maps.

- For n>0 and L=⌊N/n⌋, `V_n : W_{S_L}(R) -> W_{S_N}(R)` corresponds to the substitution t↦t^n that defines the supplied series Verschiebung: `gamma_N(V_n(x)) = gamma_L(x)(t^n) mod t^(N+1)`. This substitution is well-defined on the quotient since n(L+1)>N. In particular `V_n : W_{S_m}(R) -> W_{S_{mn}}(R)` has this formula for every m≥0. On full Witt vectors, `gamma_infty(V_n(x)) = gamma_infty(x)(t^n)`.

- For a∈R, γ_N(τ(a))=(1−at)⁻¹ modulo t^(N+1), and γ_∞(τ(a))=(1−at)⁻¹ in R[[t]]. In particular γ_1(a)=1+at modulo t².

The coefficient and restriction laws follow from the product formula (Hesselholt v3 Proposition 1.14 and Addendum 1.16, pp. 14–15, hesselholt lines 598–600 and 644–655); the Verschiebung and Teichmüller laws use their coordinate definitions (Hesselholt v3 §1 before Lemma 1.3, p. 7, hesselholt lines 292–298, and before Lemma 1.5, p. 8, hesselholt lines 338–341).

*Construction and proof.* The coefficient of t^d in the product is a_d plus an integral polynomial in the coordinates of smaller index, so the product determines a bijection over every R. Prove the group law first over the torsion-free universal polynomial ring, where the logarithmic derivative has coefficients w_n, and then specialize the integral identities to R. Restriction gives the finite quotient comparisons, and compatible finite products give the infinite comparison. The coordinate formula for V_n inserts zeros away from multiples of n, which gives substitution directly. Apply the unitization kernel for nonunital coefficients.

*Needs:* Layer 1.3 for the ring, coefficient maps, restrictions, unitization and inverse limits; Layer 1.4 for V_n and τ; KTheoryFiniteLocalFields Conventions for the series groups 𝕎_N(R), 𝕎(R) and their Verschiebung; Mathlib `Polynomial` and `PowerSeries` for the series carriers; Mathlib `PowerSeries.isUnit_iff_constantCoeff` for constant-one series units.

**Checks.**

- Over ℤ at N=2, (1,0)+(1,0)=(2,−1), and γ_2(2,−1)=(1−2t)⁻¹(1+t²)⁻¹=1+2t+3t² modulo t³, equal to (1−t)⁻². Componentwise addition would give (2,0), whose image is 1+2t+4t²; using the non-inverted product gives 1−2t+t² instead.
- Over 𝔽₂ at N=2, (0,1) has ghosts (0,0) but γ_2(0,1)=(1−t²)⁻¹=1+t²≠1 modulo t³. Thus ghost equality in R cannot determine this comparison.
- Over ℤ, γ_1(2)=1+2t modulo t², and γ_2(τ(2))=1+2t+4t² modulo t³. The series 1+2t is a distinct element of U_2(ℤ), with coordinates (2,−4); identifying a Teichmüller class with that linear series fails.
- Over ℤ with N=4,n=2, x=(1,1) on S_2 has V_2(x)=(0,1,0,1) on S_4. Both γ_4(V_2(x)) and γ_2(x)(t²) are 1+t²+2t⁴ modulo t⁵. For N=3,n=2 the source is S_1 and both sides for x=(1) are 1+t² modulo t⁴. If n>N the source is empty and the image is 1; n=0 is excluded because t↦1 does not preserve the truncation ideal over ℤ.
- For x=(1,1) over ℤ, γ_2(x)=1+t+2t² modulo t³; reduction to U_1 gives 1+t, and coefficient reduction to 𝔽₂ gives 1+t. These agree with restricting x to (1) and mapping x to (1,1) over 𝔽₂, respectively; retaining the coefficient 2 after coefficient reduction would fail naturality. The identity coefficient map retains (1,1,2) as the three series coefficients.
- The infinite vector with a_1=1 and all other coordinates zero maps to 1+t+t²+t³+⋯; its reductions at N=1,2,3 are 1+t, 1+t+t², 1+t+t²+t³. Replacing this series by 1+t fails already at N=2. At N=0 the empty vector maps to 1, and for the zero ring both groups have one element.
- For the nonunital ring (ℤ,+) with zero multiplication, positive-coefficient products vanish in the unitization: γ_2(a,b)=1+at+bt² and γ_2(x+y)=γ_2(x)γ_2(y) has coefficients (a+c,b+d). Introducing a nonzero product ac would change the t² coefficient to b+d+ac.

### 1.5 Comparison with p-typical Witt vectors

For prime p and a ≥ 0, coordinate reindexing d=p^i gives W_Div(p^a)(R) ≃+* TruncatedWittVector p (a+1) R; the infinite p-power truncation gives WittVector p R. These equivalences preserve ghosts, τ, V and F with their shifted lengths. R is a commutative unital ring; p is prime. (wagner line 471, Remark 2.7, lines 471–473; printed wagner v5 p. 11).

- Coefficient p^i corresponds to coefficient i.

- Big restrictions correspond to TruncatedWittVector.truncate.

*Construction and proof.* The ghost polynomials agree after reindexing; compare operation polynomials over ℤ and transport. Infinite sequences follow by compatible finite restrictions.

*Needs:* Layer 1.4; Mathlib `WittVector`; Mathlib `TruncatedWittVector`; Mathlib `WittVector.ghostComponent_apply`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`.

**Checks.**

- W_Div(1)(R) has length 1 for every p; length 0 is the zero ring.
- At p=2,a=1 the second ghost is x_0^2+2x_1 on both carriers.
- At p=3,a=2 the final ghost is x_0^9+3x_1^3+9x_2.

### 1.6 Étale base change

For an étale map R → R′, a finite truncation set S and n > 0, W_S(R) → W_S(R′) is étale and `W_S(R') tensor_{W_S(R),F_n} W_{S/n}(R) ~= W_{S/n}(R')`. For coprime positive a,b there is a natural W_Div(ab)(R) ≅ W_Div(a)(W_Div(b)(R)). R and R′ are commutative unital rings; S is finite in the étale assertion. (hesselholt line 811, Theorem 1.25, lines 811–827; borger Corollary 5.4, borger line 1323; Theorem 9.2 and Corollary 9.4, borger lines 1995 and 2095; wagner Remark 2.49, wagner lines 1657–1675; printed hesselholt v3 p. 19; borger v6 p. 26).

- The tensor comparison is induced by F_n and the coefficient map, natural in étale squares.

*Construction and proof.* Use prime-set decomposition and the finite p-typical étale lifting argument, reducing the Frobenius square modulo p by relative Frobenius for étale algebras. Iterate and use finite divisor induction as in Hesselholt 1.25.

*Needs:* Layer 1.5; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29.

**Checks.**

- S=∅ gives the unique map of zero rings and a zero tensor product.
- S={1} recovers the original étale map.
- For S={1,2}, R=ℤ and R′=ℤ×ℤ with the diagonal étale map, W_S(R′)=W_S(ℤ)×W_S(ℤ); the F_2 pushout is ℤ×ℤ. Using just one coefficient factor would give ℤ instead.

### 1.8 Arithmetic fracture

For M in the enhanced derived category of ℤ-modules and any positive integer N, the square `M -> prod_{p|N}M^hat_p`, `M[1/N] -> prod_{p|N}M^hat_p[1/p]` is a pullback. Localization at N and p-completion for p|N jointly detect zero objects. N>0; M arbitrary, possibly unbounded; each product indexed by p|N is finite. (wagner line 366, Lemma 2.4, Remark 2.5, lines 366–430; §4.18, lines 3081–3095; printed wagner v5 pp. 9–10, 62).

- The pullback is natural in M and compatible with coefficient algebra objects.

*Construction and proof.* Apply localization and each indicated completion to the fibre of the proposed square; the resulting squares split. Prove conservativity first from derived completeness as RHom of the localization cone. Use the all-prime detection supplier for rational detection.

*Needs:* EnhancedDerivedSheaves §0.3 and Layer E5:spectra-comparison; DerivedModuleAlgebra §1.3; BordismFormalGroups §F6.5.

**Checks.**

- For N=1 the right product is zero and the left vertical map is identity.
- For M=ℤ,N=2 the square is ℤ→ℤ₂ over ℤ[1/2]→ℚ₂.
- p-completion alone kills ℤ[1/p]; joint detection needs the localization term.

### Examples

Divisors of 1, 2, 6 and prime powers distinguish the big indexing from p-typical length. The Checks give the values and their negative controls.

### Dependencies

Layer 1.1 `BigWitt.TruncationSet`; Layer 1.2 `BigWitt.ghost_image`; Layer 1.3; Layer 1.4; KTheoryFiniteLocalFields Conventions; Mathlib `Polynomial`; Mathlib `PowerSeries`; Mathlib `PowerSeries.isUnit_iff_constantCoeff`; Mathlib `WittVector`; Mathlib `TruncatedWittVector`; Mathlib `WittVector.ghostComponent_apply`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.verschiebung`; Mathlib `WittVector.teichmuller`; Layer 1.5; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29; EnhancedDerivedSheaves §0.3 and Layer E5:spectra-comparison; DerivedModuleAlgebra §1.3; BordismFormalGroups §F6.5.

## Layer 2: Arithmetic Λ-rings, prime sets and perfection

### 2.1 Arithmetic Λ-rings

Give the full big Witt functor W = `W_{positive integers}` its comonad structure Δ : W(R) → W(W(R)), counit w_1, characterized by w_n Δ = F_n. An arithmetic Λ-ring is a commutative unital ring A with a ring coaction s : A → W(A) satisfying w_1 s = id and Δs = W(s)s. Define Λ-maps by coaction compatibility and ψ_n = w_n s. A is a commutative unital ring, with torsion allowed. (hesselholt line 711, Proposition 1.19 and Definitions 1.21, 1.23, lines 711–801; printed hesselholt v3 pp. 17–19).

- A coaction and its two coalgebra equations construct the structure.

- Λ-maps are equal when their underlying ring maps are equal.

- ψ_1=id and ψ_a `psi_b=psi_{ab}`.

- ψ_p(a)−a^p belongs to pA for every prime p.

- On ℤ-torsion-free A, commuting prime Frobenius lifts determine a unique Λ-structure.

- Each ψ_n commutes with the coaction and defines a Λ-endomorphism.

*Construction and proof.* Construct Δ by 1.2 on universal coordinates and prove coalgebra laws by ghosts. The coaction equations imply Adams laws. The torsion-free converse is the same ghost congruence criterion, not a definition on torsion rings.

*Needs:* Layer 1.4.

**Checks.**

- The canonical structure on ℤ has ψ_n(k)=k, including ψ_2(2)=2, not 4.
- The toric structure has ψ_2(T)=T² and ψ_3(T)=T³.
- Commuting identity Adams maps on 𝔽₂ do not define an arithmetic Λ-ring: the p-coordinate δ_2(2)=−1 contradicts 2=0. Adams congruences alone lose torsion data.

### 2.1a Equivalence with special λ-rings

For every commutative unital ring A, construct mutually inverse correspondences between the all-prime Witt-coalgebra structures of §2.1 and the special λ-ring structures supplied by SchemeKTheoryOperations §§6.2.1–6.2.2. For a coaction s put σ_t(a)=γ_∞(s(a)) using §1.4a and λ_t(a)=σ_(−t)(a)⁻¹. Conversely λ_t determines σ_t(a)=λ_(−t)(a)⁻¹ and then s(a)=γ_∞⁻¹(σ_t(a)). No torsion-freeness is assumed. Prove that these constructions give an equivalence of categories over commutative rings, with the same underlying ring maps. (Borger v6 §1.17, pp. 12–13, borger lines 615–627; Hesselholt v3 Proposition 1.19, p. 17, hesselholt line 711; §1.4a.)

- The inverse series exist because each constant coefficient is 1. The sum, product, iteration and unit identities correspond integrally to the ring-coaction and coalgebra equations.
- A ring map commutes with s iff it commutes with all λ-coefficients; the correspondence respects identity and composite maps and is inverse on structures.
- For every n≥1, the supplied Newton operation ψ_n equals w_n∘s. In particular the same ψ_p and the same prime-set restrictions are used in §§2.2–2.4.

*Construction and proof.* Transport through γ_∞, keeping the inverse and substitution t↦−t in the displayed order. Compare the product and composition laws on independent universal line alphabets using the supplier's integral identity principle and the integral big Witt operation polynomials. Specialize those polynomial identities to A, rather than dividing the Newton recurrence by n or testing coaction equality on ghosts over A. This retains torsion information.

*Needs:* Layers 1.3–1.4a, 2.1; SchemeKTheoryOperations §§6.2.1–6.2.2.

**Checks.**

- For a toric line element l, s(l)=τ(l), σ_t(l)=(1−lt)⁻¹ and λ_t(l)=1+lt. In particular λ²(l)=0 and ψ_2(l)=l²; omitting inversion would give λ²(l)=l².
- On canonical ℤ, σ_t(2)=(1−t)⁻²=1+2t+3t²+⋯ and λ_t(2)=(1+t)²=1+2t+t², while λ_t(−1)=(1+t)⁻¹=1−t+t²−⋯. Thus λ²(2)=1, λ²(−1)=1 and ψ_2(2)=4−2=2.
- In A=ℤ[ε]/(2ε,ε²), obtained from the toric line structure by its λ-stable ideal (2ε,ε²), λ_t(ε)=1+εt. The nonzero Witt element V_2τ(ε) has all ghosts zero but γ_∞(V_2τ(ε))=1+εt²≠1; a ghost-only proof would lose exactly this coefficient. The ideal is λ-stable since λ_t(2ε)=1+2εt+ε²t² and ε² is a line element before quotienting.
- The zero ring has one series and one coaction, so both constructions are inverse there too. Over nonzero 𝔽₂ no special λ-structure exists: the sum law and λ²(1)=0 would give λ²(0)=λ²(1+1)=1, contradicting λ²(0)=0.

### 2.2 Prime sets

For any set P of primes construct the P-typical Witt comonad and its Λ_P-coalgebras; on P-torsion-free rings these are commuting ψ_p with ψ_p(x) ≡ x^p modulo p. Give change-of-prime-set functors, free Λ_P-rings on sets, and reflexive presentations by free Λ_P-rings. Finite Div(m) q-Witt data require only P={p | p divides m}. P is arbitrary; coalgebras, rather than Adams-only structures, are used on rings with torsion. (borger line 603, §§1.16–1.18, lines 603–638; pridham Definition 2.1, pridham line 506; wagner Remark 2.32, wagner line 1332; Remark 2.43, wagner line 1556; printed borger v6 pp. 12–13; pridham v4 p. 12; wagner v5 pp. 26, 31).

- For P′⊆P restrict the operations and coaction.

- Λ_P-maps from the free ring on I to A correspond naturally to I → A.

- Maps from the free ring agree when they agree on its generators.

- For P={p}, identify the coaction with the usual p-typical Witt-coalgebra notion of δ-ring.

- The free Λ-ring on I has underlying polynomial ring on the universal exterior operations of its generators; Adams operations have faithfully flat underlying maps (Bhatt–Scholze Lemma 2.11, p. 15, bhatt-scholze line 594, for a single prime over ℤ_(p); Wagner–Habiro §1.22(e), p. 12, wagner-habiro line 493, for all primes).

- Filtered colimits are created on underlying rings: every coordinate operation and every defining relation uses finitely many arguments.

*Construction and proof.* Restrict Witt indices to the monoid generated by P; repeat the comonad construction. The free object is represented by symmetric-operation generators and the coalgebra equations. Its polynomial presentation supplies the reflexive coequalizer and faithful-flat Adams property needed in 2.4. The faithful-flat statement uses the free polynomial presentation and prime-set decomposition; it does not identify an Adams operation with a literal permutation of the exterior-operation generators.

*Needs:* Layer 2.1; Layer 1.5.

**Checks.**

- P=∅ gives ordinary commutative rings and the identity Witt comonad.
- P={2} uses infinite 2-typical Witt vectors, not length two.
- The free Λ-ring on no generators is ℤ, with all Adams operations identity.

### 2.3 Arithmetic perfection

Call A perfect if every ψ_n, n>0, is an isomorphism. Construct A^perf as the filtered colimit of A indexed by positive integers under divisibility, with transition A_m → A_n equal to `psi_{n/m}`. The resulting Λ-map A → A^perf is initial among Λ-maps to perfect Λ-rings. A is an arithmetic Λ-ring; colimits are in commutative Λ-rings. (wagner line 1621, Remark 2.47 and footnote 2.3, lines 1621–1643; bhatt-scholze Remark 2.27, bhatt-scholze line 775; printed wagner v5 p. 32; bhatt-scholze v4 p. 20).

- Maps to a perfect B extend uniquely and naturally across A → A^perf.

- Every Adams operation on A^perf has its shift inverse.

- If A is perfect then A → A^perf is an isomorphism.

- Λ-maps induce maps of perfections with identity and composition laws.

- The stage-one map sends a to its colimit class; at stages m|n the class of a equals the class of `psi_{n/m}(a)`.

*Construction and proof.* Adams operations commute with the coaction, so form the directed colimit. Index shifts invert each ψ_n. The universal map sends a at stage m to `psi_m^{-1}(f(a))`.

*Needs:* Layer 2.2.

**Checks.**

- ℤ^perf=ℤ; replacing arithmetic perfection by characteristic-p perfection fails.
- For toric ℤ[T], the perfection is ℤ[T^r | r is a nonnegative rational], with ψ_n(T^r)=T^(nr).
- T has no preimage under ψ_2 on ℤ[T]; ℤ[T] itself is not perfect.

### 2.4 Perfectly covered Λ-rings

A is perfectly covered if there exists a faithfully flat Λ-map A → B with B perfect. This is equivalent to every ψ_n being faithfully flat, and to A → A^perf being faithfully flat. Such A is ℤ-torsion-free; so are its flat algebras. A is an arithmetic Λ-ring; the zero ring is allowed under the usual faithful-flat convention. (wagner line 1621, Remark 2.47 and footnote 2.3, lines 1621–1643; wagner-habiro §1.22(e), wagner-habiro line 493; bhatt-scholze Lemma 2.28, bhatt-scholze line 778; printed wagner v5 p. 32; wagner-habiro v2 p. 12; bhatt-scholze v4 p. 20).

- The three conditions in the statement are equivalent.

- Multiplication by every positive integer is injective on A.

- Toric polynomial algebras over a perfectly covered Λ-base are perfectly covered, for any variable set.

- Every free arithmetic Λ-ring on a set is perfectly covered.

- A perfect Λ-ring B and a faithfully flat Λ-map A→B give a witness of perfect coverage.

*Construction and proof.* Use faithful-flat descent on the ψ_n-twisted tensor functors and filtered colimits of faithful-flat maps. The p-coordinate of a coaction gives px=0 ⇒ ψ_p(x)=0 as in the δ torsion lemma; injective Adams on the cover kill p-torsion, and faithful flatness descends this conclusion. Polynomial monomial bases and 2.2 prove the examples.

*Needs:* Layer 2.3.

**Checks.**

- On ℤ[T], ψ_2 is finite free with basis 1,T and ψ_3 with basis 1,T,T².
- ℤ, every perfect Λ-ring and the free ring on the empty set satisfy the predicate.
- For A=ℤ[ε]/(ε²) with ψ_n(ε)=nε, the torsion-free Frobenius-lift criterion gives a Λ-ring, but ψ_2 is not flat: after reduction modulo 2, ε acts by zero on the nonzero target dual-number ring. Thus A is not perfectly covered, and torsion-freeness alone is insufficient.

### 2.5 Relative perfection

For any A-algebra R define the twist `R^(n)=R tensor_{A,psi_n}A` with its right-hand A-algebra structure. If R is a Λ-A-algebra, define relative perfection by invertibility of `psi_{p/A}:R^(p) -> R`, r⊗a↦ψ_p(r)a, for every prime p; equivalently these maps are invertible for every positive n. A is an arithmetic Λ-ring and R any commutative unital A-algebra; linearized Adams maps and relative perfection additionally require a compatible Λ-structure on R. (wagner line 1573, §2.45 and Remark 2.47, lines 1573–1628; printed wagner v5 pp. 31–32).

- `psi_{n/A}(r tensor a)=psi_n(r)a`; tensor balancing uses ψ_n on A.

- (R^(a))^(b) ≅ R^(ab), naturally and compatibly with linearized Adams.

- If A and R are perfect Λ-rings and A → R is a Λ-map, then R is relatively perfect.

- A-algebra maps out of the twist are determined on pure tensors.

- A compatible Λ-A-algebra and equivalences for every `psi_{p/A}` give relative perfection; these equivalences respect the fixed linearized maps.

*Construction and proof.* The tensor balancing relation is ψ_n-compatible because A → R is a Λ-map. Associativity of scalar extension proves the composite law, and prime factorization reduces all n to primes.

*Needs:* Layer 2.1; Mathlib `Algebra.TensorProduct.includeRight`.

**Checks.**

- For R=A the linearized map is an isomorphism even when ψ_p on A is not surjective.
- ℤ[T] over ℤ is not relatively perfect: T is outside the image of linearized ψ_2.
- For A=ℤ and perfect R the definition reduces to invertibility of ψ_p on R.

### Examples

The toric ring ℤ[T] is perfectly covered but not perfect; ℤ is perfect. Characteristic-p perfection is a different object. The Checks give the values and their negative controls.

### Dependencies

Layer 1.4; Layer 2.1; Layer 1.5; Layer 2.2; Layer 2.3; Mathlib `Algebra.TensorProduct.includeRight`. SchemeKTheoryOperations §§6.2.1–6.2.2; Layer 2.1a.

## Layer 3: Absolute q-Witt rings and exactness

### 3.1 Absolute q-FV systems

For a commutative ring R define a q-FV system to consist of ℤ[q]-rings E_m, m>0, structural maps W_Div(m)(R)[q]/(q^m−1) → E_m, ℤ[q]-linear additive `V_{m/d}:E_d` → E_m and multiplicative ℤ[q]-algebra maps `F_{m/d}:E_m` → E_d compatible with the ordinary Witt maps, and satisfying FV=m/d and `VF=[m/d]_{q^d}`. The unital variant preserves units; the nonunital variant uses nonunital rings with ℤ[q]-action. Morphisms preserve every structure map. R may be nonunital; d divides m and d,m>0. (wagner line 475, Definition 2.8 and Remark 2.12, lines 475–549; printed wagner v5 pp. 11–12).

- Compatible structural, F and V maps with the two composite laws give a system.

- A morphism is determined by its maps on E_m.

- Restrict the system to any divisor-closed set of positive indices.

*Construction and proof.* Specify the category with all structural commutative squares. The polynomial model for ℤ verifies that the two composite laws impose distinct requirements.

*Needs:* Layer 1.4.

**Checks.**

- For R=ℤ, E_m=ℤ[q]/(q^m−1), F is reduction and V is multiplication by `[m/d]_{q^d}`.
- The zero nonunital ring gives the zero system.
- Using V_2=2 in the ℤ example fails VF=1+q at m=2.

### 3.2 Absolute q-Witt rings

Construct the initial q-FV system Q_m(R). It is W_Div(m)(R)[q]/I_m, where I_m is generated by `(q^d-1)V_{m/d}(x)` and `[d/e]_{q^e}V_{m/d}(x)-V_{m/e}(F_{d/e}x)` for e|d|m and x∈W_Div(d)(R)[q]. For m=1, Q_1(R) ≅ R, with q acting as 1. R is any commutative ring, possibly nonunital; m>0. (wagner line 483, Lemmas 2.9–2.10 and Remark 2.12, lines 483–549; printed wagner v5 pp. 11–12).

- Maps to a q-FV system extend uniquely from the structural Witt maps.

- Ring maps induce maps of initial systems; identity and composition hold.

- System maps out of Q agree on the structural polynomial generators.

- F and V compose, commute for coprime indices and satisfy the projection formula.

- τ_m is the multiplicative composite R → W_Div(m)(R) → Q_m(R); `F_{m/d}tau_m(r)=tau_d(r)^(m/d)`.

*Construction and proof.* Verify that F and V preserve I_m using divisibility and coprime interchange in 1.4. The presentation gives the initial property and the remaining identities by descent from ordinary Witt operations.

*Needs:* Layer 3.1.

**Checks.**

- Q_1(R)=R and Q_m(0)=0, including nonunital inputs.
- For Q_2(ℤ), V_2(1)=1+q and F_2(1+q)=2.
- At q=1, V_2F_2=2; this specialization need not be ordinary W_Div(2)(R).

### 3.2a Prime-generator cyclotomic consequence

For every integer m>1, prove in ℤ[q] that the ideal generated by `[p]_{q^(m/p)}` for all prime divisors p of m is (Φ_m). Derive this consequence of HabiroCyclotomicCompletions §4.1 before identifying the absolute ghost quotient. (Wagner v5 Lemmas 2.2–2.3, pp. 8–9, wagner lines 320–371.)

*Construction and proof.* Define the polynomial u_p as the product of Φ_d over proper positive divisors d of m with v_p(d)=v_p(m). The divisor factorization gives `[p]_{q^(m/p)}=Phi_m*u_p`; no division in a quotient ring is used. If a maximal ideal contained all u_p, primality would select a factor Φ_(d_p) from every nonempty product. Two incomparable selected indices give comaximal factors by the supplied §4.1. Otherwise the selected divisors form a chain, whose maximum has the full ℓ-primary part of m for every prime ℓ|m and hence equals m, contradicting properness. An empty product is 1 and already excludes such a maximal ideal. Thus the u_p generate the unit ideal, proving the reverse ideal inclusion as well as the immediate forward inclusion.

*Needs:* HabiroCyclotomicCompletions §4.1; Mathlib `Polynomial.prod_cyclotomic_eq_X_pow_sub_one`; maximal ideals are prime; prime factorization of positive integers.

**Checks.**

- For m=1 the prime-generated ideal is (0), whereas (Φ_1)=(q−1); the formula requires m>1 and does not supply the level-one ghost quotient.
- For m=2 and m=3 the single generators are 1+q=Φ_2 and 1+q+q²=Φ_3. More generally m=p^a with a≥1 gives u_p=1, so a proof requiring every product to have a factor would fail.
- For m=6 put a=1+q³ and b=1+q²+q⁴. Then a=(q+1)Φ_6, b=(q²+q+1)Φ_6 and b−qa=Φ_6. In particular u_3−qu_2=1; keeping only the prime 2 would instead give the strictly smaller ideal ((q+1)Φ_6).
- For m=12 the residual products are u_2=q²+1 and u_3=q⁴+q²+1, with u_3−q²u_2=1. Modulo 2 this remains 1, although u_2=(q+1)²; repeated prime factors and nonreduced reductions do not justify replacing ideal generation by squarefree factor counting.

### 3.3 Absolute ghosts

For d|m define `gh_{m/d}:Q_m(R)` → R[q]/Φ_d(q) as `F_{m/d}` followed by the quotient by all proper-divisor V-images in Q_d. At d=m this is the first ghost; its target is R[q]/Φ_m(q). The Teichmüller image is r^(m/d) in the dth target. R is commutative, possibly nonunital; m>0. (wagner line 552, §2.13, lines 552–580; printed wagner v5 pp. 12–13).

- ker gh_1 is the ideal generated by V_p-images for prime p|m.

- `gh_{m/d}=gh_1 F_{m/d}`.

- `gh_{m/d}` V_n is zero unless n divides m/d; when it does it is n times the appropriate source ghost.

- Ghosts commute with coefficient maps.

*Construction and proof.* First quotient the defining ideal and all prime V-images; the local prime-generator consequence of §3.2a identifies the result for m>1. At m=1 the defining relations already impose (q−1)x=0 for every x, so the quotient is R without any V-images, including for nonunital R. Compose with F for the other ghosts.

*Needs:* Layer 3.2; Layer 3.2a.

**Checks.**

- For m=2 over ℤ, gh_1 evaluates q at −1 and kills V_2(1)=1+q.
- At m=1 there are no proper V-images and Φ_1=q−1; the ghost is id_R.
- Reduction q↦1 from Q_2 to Q_1 does not extend the ordinary restriction W_2→W_1: it sends V_2(1) to 2 whereas ordinary restriction sends it to 0.

### 3.4 The Verschiebung resolution

If p_1,…,p_r are the distinct prime factors of m, put `p_J=prod_{j in J}p_j`. The augmented complex with `directSum_{|J|=k}Q_{m/p_J}(R)` in chain degree k, Q_m(R) in degree 0 and quotient R[q]/Φ_m(q) is exact. Deletion of j∈J has coefficient `(-1)^{#{i in J:i<j}}V_{p_j}`. In particular every `V_n:Q_{m/n}(R)` → Q_m(R) is injective. R may be nonunital; m>0; an ordering of distinct prime divisors is fixed only to write signs. (wagner line 591, Proposition 2.15, Remark 2.16, Lemmas 2.17–2.18 and Corollary 2.19, lines 591–1004; printed wagner v5 pp. 13–19).

- Reordering primes gives the signed permutation chain isomorphism.

- All absolute Verschiebungen are injective without a torsion assumption.

*Construction and proof.* Prove the prime-power short exact sequence from the explicit ideal. For the general complex, use iterated mapping cones of its finite cube; split the prime-to-p V-directions after p-localization and compare the remaining direction with the prime-power case. Rational and prime-completed detection prove exactness; apply the same cube argument to kernels of V. The terminal object removed from the reverse-inclusion cube is ∅.

*Needs:* Layer 3.3; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §0.3; `gap:cyclotomic-contract`; AInfCohomology §AI.1.7; Layer 1.8.

**Checks.**

- For m=6, the first maps are Q_1 → Q_3⊕Q_2 → Q_6, x↦(−V_3x,V_2x), then (a,b)↦V_2a+V_3b; the composite is zero.
- For m=1 the augmentation Q_1(R)→R is an isomorphism.
- For m=2^a with a≥1, the resolution is `0 -> Q_{2^(a-1)} -> Q_{2^a} -> R[zeta_{2^a}] -> 0`; a=0 is the separate m=1 augmentation, not a level with index 2^(−1).

### 3.5 Localization and integer torsion

Q_m commutes with integer localization and with localization R[U⁻¹] at τ_m(U). If R is p-torsion-free, so is Q_m(R); if R has bounded p-primary torsion, so does Q_m(R). If R is p-torsion-free for every p|m, its q-Witt ghosts are jointly injective. R is commutative, possibly nonunital; multiplicative localization at elements uses the corresponding unital algebra or unitization; p is any prime. (wagner line 1006, Corollaries 2.20, 2.22 and Lemmas 2.21, 2.23, lines 1006–1080; printed wagner v5 pp. 19–21).

- Q_m(R)[τ_m(U)⁻¹] ≅ Q_m(R[U⁻¹]).

- A finite bound on p-primary torsion of R gives a bound for each fixed m; no uniform bound in m is asserted.

*Construction and proof.* Induct along 3.4; localize first to ℤ_(p), where prime-to-p V maps split by ℓ⁻¹F_ℓ. Kernels killed by the other F maps and first ghost lie in im V_p. Apply this to torsion elements, bounding the exponents inductively.

*Needs:* Layer 3.4.

**Checks.**

- For R=ℤ and m=2, the ghosts ℤ[q]/(q²−1)→ℤ×ℤ are jointly injective.
- For R=𝔽₂,m=2, V_2(1) is nonzero by 3.4 but both ghosts vanish on it; dropping the torsion hypothesis fails.
- For m=1 the sole ghost is id_R even when R has torsion.

### 3.6 Absolute completion

If the derived p-completion R̂_p is discrete, Q_m(R)^∧_p ≅ Q_m(R̂_p). If this holds for each p|m, then `Q_m(R)^hat_{(q^n-1)}` is discrete for every n>0. If R has bounded p-primary torsion for every p|m, Q_m(R) has bounded (q^n−1)-power torsion. R is commutative, possibly nonunital; m,n>0; p is prime. (wagner line 1083, Corollaries 2.24, 2.26 and Lemma 2.27, lines 1083–1190; printed wagner v5 pp. 21–23).

- Comparisons commute with F, V, ghosts and maps of R.

*Construction and proof.* Complete the finite resolution 3.4 and induct. On R[ζ_d], compare radicals of (q^n−1) with (p) when d/gcd(d,n) is a nontrivial p-power, use the unit ideal for at least two prime factors, and the zero ideal for d|n. The same argument with annihilator bounds gives bounded torsion.

*Needs:* Layer 3.5; DerivedModuleAlgebra §1.1; DerivedModuleAlgebra §1.2; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.5; `gap:cyclotomic-contract`.

**Checks.**

- For R=ℤ,m=2, p-completion gives ℤ_p[q]/(q²−1).
- For m=1, (q^n−1) acts as zero and its derived completion is R.
- For R=ℤ, m=n=2, q²−1 acts as zero on Q_2(ℤ)=ℤ[q]/(q²−1); completion at this parameter leaves the ring unchanged. Completing the ambient polynomial ring without the quotient would give a different ring.

### 3.7 Witt injectivity and exactness

The natural map W_Div(m)(R) → Q_m(R) is injective for every commutative ring R, including nonunital R. For an exact sequence 0→J→R→R′→0 of such rings, 0→Q_m(J)→Q_m(R)→Q_m(R′)→0 is exact as additive groups. m>0; J is the kernel ring, with no unit required. (wagner line 1194, Proposition 2.28, Corollary 2.29 and Lemma 2.30, lines 1194–1303; printed wagner v5 pp. 23–26).

- For R a ℤ_(p)-algebra and m=p^a n with gcd(n,p)=1, Q_m(R) ≅ `prod_{d|n} Q_{p^a}(R) tensor_{Z_(p)[q],q |-> q^d}Z_(p)[q]/Phi_d(q^(p^a))`.

*Construction and proof.* The resolution proves exactness on kernel rings. Prove the displayed p-local decomposition by truncated universal properties and 1.6; reduce injectivity to prime powers, where the explicit ideal in 3.2 and coefficient comparison give injectivity. Localize at every prime to conclude.

*Needs:* Layer 3.6; Layer 1.6.

**Checks.**

- For R=0 the injection and exact sequence are zero maps between zero objects.
- For m=2,R=𝔽₂, the element V_2(1) stays nonzero, despite its zero ghosts.
- For m=1 the assertion is the original short exact sequence.

### Examples

Q_1(R)=R with q=1; Q_2(ℤ)=ℤ[q]/(q²−1); nonunital zero and square-zero rings remain included. The Checks give the values and their negative controls.

### Dependencies

Layer 1.4; Layer 3.1; Layer 3.2; HabiroCyclotomicCompletions §4.1; Layer 3.2a; `gap:cyclotomic-contract`; Layer 3.3; DerivedModuleAlgebra §0.K.1; EnhancedDerivedSheaves §0.3; AInfCohomology §AI.1.7; Layer 1.8; Layer 3.4; Layer 3.5; DerivedModuleAlgebra §1.1; DerivedModuleAlgebra §1.2; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.5; Layer 3.6; Layer 1.6.

## Layer 4: Relative q-Witt rings and Λ comparison

### 4.1 Λ-ring comparisons

For any arithmetic Λ-ring A let s_m:A[q]/(q^m−1)→Q_m(A) be the polynomial extension of the coaction A→W_Div(m)(A). Construct c_m:Q_m(A)→A[q]/(q^m−1) with c_m s_m=ψ_m, c_d `F_{m/d}=reduction` c_m and c_m `V_{m/d}=[m/d]_{q^d}c_d`. If all ψ_n are injective, c_m identifies Q_m(A) with `sum_{d|m}[d]_{q^(m/d)}psi_{m/d}(A)[q]/(q^m-1)`. For perfect A, s_m and c_m are isomorphisms. A is a commutative unital arithmetic Λ-ring; m>0. (wagner line 1348, Lemmas 2.33–2.34, Corollary 2.35, Proposition 2.36 and Corollary 2.37, lines 1348–1468; printed wagner v5 pp. 27–29).

- Every x∈W_Div(m)(A) has a unique expansion `sum_{d|m} V_d s_{m/d}(a_d)`; define ε_d by its final coefficient.

- `c_m(sum V_d s_{m/d}(a_d)) = sum [d]_{q^(m/d)}psi_{m/d}(a_d)`.

- Both comparison maps commute with Λ-maps.

*Construction and proof.* Use triangular Witt coordinates to define ε, first on free torsion-free Λ-rings and then by their reflexive presentations. The displayed formula is multiplicative after cyclotomic projection on a torsion-free universal ring. Descend to Q using 3.2; ghost injectivity and 2.4 give the image assertion.

*Needs:* Layer 2.2; Layer 3.7.

**Checks.**

- For A=ℤ,m=2, c_2 and s_2 are inverse isomorphisms and V_2(1) maps to 1+q.
- For toric ℤ[T], c_2 has image ℤ[T²,q]+(1+q)ℤ[T,q] inside ℤ[T,q]/(q²−1); it is not the whole ring.
- For m=1 both comparisons are identities.

### 4.2 Relative q-FV systems

For a Λ-ring A and unital A-algebra R, a relative q-FV system has A[q]-algebras E_m receiving `Q_m(R) tensor_{Q_m(A),c_m}A[q]/(q^m-1)`, with compatible A[q]-algebra F and A[q]-linear V satisfying FV=m/d and `VF=[m/d]_{q^d}`. Define its morphisms by commutation with these maps. A is any arithmetic Λ-ring; R is any commutative unital A-algebra; d|m. (wagner line 1504, Definition 2.40, lines 1504–1512; printed wagner v5 p. 30).

- Structural maps and compatible F,V satisfying the two relations construct a system.

- Morphisms are determined by their component maps.

- Restriction to any divisor-closed set preserves the notion.

*Construction and proof.* Use c_m to specify the scalar action; requiring compatibility with every V is additional data beyond the tensor product at a single level.

*Needs:* Layer 4.1.

**Checks.**

- For R=A, E_m=A[q]/(q^m−1), reduction F and multiplication V satisfy the definition. At m=2,d=1, F_2V_2(1)=2 and V_2F_2(1)=1+q; replacing the latter q-integer by 2 fails.
- For R=0 all components may be zero rings, over any A.
- For toric A=R=ℤ[T], m=2,d=1, F_2 sends the right-hand scalar T to T in E_1=ℤ[T], whereas a ψ_2-semilinear substitute sends it to T². Thus the relative F is A[q]-linear.

### 4.3 Relative q-Witt rings

The category in 4.2 has initial object Q_m(R/A). It is the tensor product there modulo the ideal generated by `V_{m/d}(xy) tensor 1-V_{m/d}(x) tensor c_d(y)`, for x∈Q_d(R), y∈Q_d(A). Lifts of c_d(y) modulo q^m−1 give the same generator because `V_{m/d}(x)` is killed by q^d−1. It has functorial F,V, multiplicative τ_m and composition, coprime interchange and projection laws. A is any arithmetic Λ-ring; R any commutative unital A-algebra; m>0. (wagner line 1513, Lemmas 2.41–2.42 and Remark 2.43, lines 1513–1559; printed wagner v5 pp. 30–31).

- There is a unique compatible map to any relative q-FV system.

- A-algebra maps give maps of systems, preserving identity and composition.

- Maps of systems agree when their structural maps agree.

- `F_{m/d}tau_m(r)=tau_d(r)^(m/d)`.

- The same initial property holds on every divisor-closed set; Div(m) depends only on `Lambda_{p|m}`.

*Construction and proof.* Check that all F and V preserve the ideal, using the comparison compatibilities in 4.1 and separate cases p|m/d and p∤m/d. The universal property gives maps and laws without requiring flatness of A.

*Needs:* Layer 4.2.

**Checks.**

- Q_1(R/A)=R and Q_m(0/A)=0.
- Q_m(A/A)=A[q]/(q^m−1), even for a nonperfect A.
- Take toric A=ℤ[T], R=A[X], m=2 and d=1. In `B=Q_2(R) tensor_{Q_2(A),c_2}A[q]/(q^2-1)`, the two expressions V_2(TX)⊗1 and V_2(X)⊗T differ. A map B→𝔽₂[ε]/(ε²) sends them to ε and 0: on Q_2(R) use the polynomial image in 4.1 and send b to b(0,0,1) mod 2 plus ε times half the TX-coefficient of b(T,X,1), modulo 2; on A[q] send T to 0 and q to 1. Coefficients of monomials with an odd exponent are even; the cross terms in the TX-coefficient of a product are divisible by 4, so this is a ring map and agrees with c_2 on Q_2(A). The defining ideal contains exactly their difference, from x=X,y=T, so it enforces V-linearity.

### 4.4 Relative ghosts

For d|m construct `gh_{m/d}:Q_m(R/A) -> R^(d) tensor_A` A[q]/Φ_d(q). It factors as `F_{m/d}` then the first ghost of Q_d. The first ghost gh_1 at level m is the quotient by the ideal generated by all proper-divisor V-images. A is any Λ-ring; R is an A-algebra; d|m and d,m>0. (wagner line 1565, §2.44, lines 1565–1572; printed wagner v5 p. 31).

- On structural x⊗a, `gh_{m/d}` sends x to its ordinary (m/d)th Witt ghost in the R factor, and a to the A[q]/Φ_d factor.

- Ghosts commute with maps of A-algebras and Λ-base change.

- `gh_{m/d}(tau_m(r))=r^(m/d) tensor 1`.

*Construction and proof.* Tensor the absolute ghosts with the scalar cyclotomic quotient and verify that every relative generator in 4.3 vanishes. The tensor balancing equation forces ψ_d, with no choice of inverse Adams operation.

*Needs:* Layer 4.3; Layer 2.5; Layer 3.3.

**Checks.**

- At d=m, gh_1(s_m(a))=a⊗1=1⊗ψ_m(a). For toric A=R=ℤ[T] and m=2, the identification r⊗b↦ψ_2(r)b sends both sides to T², also after adjoining ζ_2. The reversed formula would assert T⁴=T, which is false.
- At m=d=1, R^(1)[ζ_1]=R and the map is identity.
- Over A=ℤ the twisted targets identify with the absolute ghost targets.

### 4.5 Relative base change

For any Λ-map A→A′ and A-algebra R there is a canonical A′[q]-algebra isomorphism Q_m(R/A)⊗_A A′ ≅ Q_m(R⊗_A A′/A′), compatible with F,V,τ and twisted ghosts. No flatness is required. A,A′ are arithmetic Λ-rings; R is any A-algebra; m>0. (wagner line 1583, Lemma 2.46, lines 1583–1620; printed wagner v5 pp. 31–32).

- For toric A[T_i], Q_m(A[T_i]/A) identifies with `sum_{d|m}[d]_{q^(m/d)}A[T_i^(m/d),q]/(q^m-1)`.

- Q_m(−/A) preserves reflexive coequalizers and filtered colimits.

*Construction and proof.* First identify the polynomial image using the maps in 4.1 and the relative relations. Prove base change there directly; then use the initial property to preserve reflexive coequalizers of polynomial presentations. A bare appeal to the tensor universal property would omit the Witt structure on the new coefficients.

*Needs:* Layer 4.4.

**Checks.**

- A′=A gives the identity comparison, and A′=0 gives zero.
- For R=A[T], m=2 the polynomial-image formula commutes with any Λ-base map.
- The ring map ℤ[T]→ℤ sending T to 2 is not a Λ-map from the toric structure to the canonical one: it sends ψ_2(T) to 4, whereas ψ_2(2)=2. An arbitrary coefficient map cannot supply Λ-base change.

### 4.6 Perfect-cover comparisons

If A is perfectly covered, all relative V are injective, the relative version of the exact resolution 3.4 has quotient R^(m)[ζ_m], and for a relatively perfect Λ-A-algebra R the maps `s_{m/A}:R^(m)[q]/(q^m-1) -> Q_m(R/A)` and `c_{m/A}:Q_m(R/A) -> R[q]/(q^m-1)` are isomorphisms with composite `psi_{m/A}`. For any Λ-A-algebra R both maps exist with that composite without the perfection hypotheses. A is a Λ-ring; existence of comparisons assumes R is a Λ-A-algebra; injectivity and exactness assume A perfectly covered; isomorphisms also assume R relatively perfect. (wagner line 1573, §2.45 and Remark 2.47, lines 1573–1643; printed wagner v5 pp. 31–32).

- If A is perfect, the natural Q_m(R)→Q_m(R/A) is an isomorphism for every R/A.

- The comparisons commute with Λ-A-algebra maps and Λ-base change.

*Construction and proof.* Use 4.5 and A→A^perf, reduce to the absolute perfect-base case via 4.1, then descend exactness and isomorphisms by faithful flatness. Keep existence separate from the statements requiring descent.

*Needs:* Layer 4.5; Layer 2.4; Layer 2.5.

**Checks.**

- For R=A, `s_{m/A}` is the standard identification even when A is only perfectly covered.
- For toric ℤ[T]/ℤ, relative perfection fails and c_2 misses T.
- For A=ℤ all relative V are injective even on torsion R.

### Examples

Relative constructions exist before perfect coverage is assumed. Twisted ghosts retain the Adams operation of the base. The Checks give the values and their negative controls.

### Dependencies

Layer 2.2; Layer 3.7; Layer 4.1; Layer 4.2; Layer 4.3; Layer 2.5; Layer 3.3; Layer 4.4; Layer 4.5; Layer 2.4.

## Layer 5: Étale base change, finiteness and relative completions

### 5.1 Étale preservation

For every étale A-algebra map R→R′, Q_m(R/A)→Q_m(R′/A) is étale. For d|m its F-square is a pushout: `Q_m(R'/A) tensor_{Q_m(R/A),F_{m/d}}Q_d(R/A)` ≅ Q_d(R′/A). The ordinary tensor is also the derived tensor since the changed factor is étale and flat. A is any arithmetic Λ-ring; R,R′ any A-algebras; m>0. (wagner line 1651, Proposition 2.48 and Lemma 2.50, lines 1651–1712; printed wagner v5 pp. 33–34).

- `W_Div(m)(R') tensor_{W_Div(m)(R)}Q_m(R/A)` ≅ Q_m(R′/A).

- The pushout comparison is natural and compatible with chains of divisors.

*Construction and proof.* Apply ordinary Witt étale base change to the generators and relations in 3.2 and 4.3, giving the displayed Witt-base-change comparison. Étaleness and the F-pushout then follow from 1.6.

*Needs:* Layer 4.5; Layer 1.6.

**Checks.**

- For R′=R the comparison is identity.
- At m=1 it is the original étale algebra R′ over R.
- At m=1 the quotient ℤ→𝔽₂ is not étale: its target is not flat, since Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂. The étale conclusion cannot extend to arbitrary coefficient maps.

### 5.2 Étale ghost pushouts

For d|m and an étale A-algebra map R→R′, the square from Q_m(R/A)→Q_m(R′/A) to R^(d)[ζ_d]→R′^(d)[ζ_d], with vertical maps `gh_{m/d}`, is a pushout of rings and of derived commutative algebras. A any arithmetic Λ-ring; R→R′ étale over A; d|m. (wagner line 1715, Corollary 2.51, lines 1715–1730; printed wagner v5 p. 34).

- The comparison on pure tensors is induced by the coefficient map and the relative ghost.

*Construction and proof.* Reduce to d=m by 5.1 and present the first ghost as the cokernel of all proper V-images. Flatness of the étale Q-map makes the ordinary quotient pushout the derived one.

*Needs:* Layer 5.1; Layer 4.4; EnhancedDerivedSheaves §E5:abstract.

**Checks.**

- At m=d=1 the square is the identity vertical square.
- For R=A it identifies `Q_m(R'/A) tensor_{A[q]/(q^m-1)}A[zeta_d]` with R′^(d)[ζ_d].
- Take A=R=ℤ, R′=𝔽₂ and m=d=2. Put B=Q_2(ℤ)=ℤ[q]/(q²−1). Here Q_2(𝔽₂)=ℤ/4 with q=1, and the first-ghost target for R is ℤ with q=−1. The periodic free resolution with maps q+1 and q−1 gives Tor₁^B(ℤ/4,ℤ)=𝔽₂: after tensoring its maps are 2 and 0, and ker(2)=2ℤ/4. Thus an ordinary pushout along a non-étale map need not be a derived pushout.

### 5.3 Relative torsion and completion

For a perfectly covered A and any R/A, the integer-torsion and joint-ghost-injectivity assertions of §3.5 hold relatively, with ghosts in R^(d)[ζ_d]. The relative coefficient-completion comparison is Q_m(R/A)^∧_p ≅ Q_m(R̂_p/A)^∧_p when R̂_p is discrete, while bounded p-primary torsion of R for every p|m gives bounded (q^n−1)-power torsion of Q_m(R/A) and makes `Q_m(R/A)^hat_{(q^n-1)}` discrete and equal to its ordinary completion. A perfectly covered; m,n>0; p prime. Ghost injectivity assumes R p-torsion-free for all p|m; integer torsion statements keep the same prime-specific hypotheses as 3.5. (wagner line 1621, Remark 2.47, lines 1621–1643, with Corollaries 2.22, 2.24, 2.26; §4.19 proof, lines 3123–3127; printed wagner v5 pp. 20–22, 32, 63).

- A bound on p-primary torsion is preserved by the flat Adams twists and by the faithfully flat perfect cover. These bounds give the relative bounded-torsion and discreteness assertions; discreteness of R̂_p alone is not preserved by an arbitrary flat Adams twist.
- Completed scalar extension to A^perf computes the corresponding completion after perfect-base comparison. The coefficient-completion map becomes an equivalence after p-completion on both sides. No completeness of the uncompleted Q_m(R̂_p/A) is asserted.

*Construction and proof.* Use the faithful-flat perfect cover and 4.5 for torsion and exactness. Flat base change preserves any fixed primary-torsion bound, so 3.6 gives a (q^n−1)-power-torsion bound after the cover; descend that bound and apply the principal bounded-torsion ordinary/derived completion comparison. For coefficient completion compare after p-completion of both q-Witt rings, using completed derived scalar extension and complete faithful-flat descent. This comparison does not require the two completed rings to be discrete.

*Needs:* Layer 4.6; Layer 3.6; DerivedModuleAlgebra §1.5; DerivedModuleAlgebra §1.7; DerivedModuleAlgebra §1.8; DerivedModuleAlgebra §1.9.

**Checks.**

- For R=A,m=1, all comparisons reduce to those for A.
- For A=ℤ the statement agrees with 3.6.
- For A=ℤ, R=ℤ/4 and m=1, Q_1(R/A)=ℤ/4 has the nonzero 2-torsion element 2; perfect coverage of A alone does not make the coefficient algebra torsion-free.
- Let A=ℤ[T₁,T₂,…] with ψ_n(T_i)=T_i^n, R=A, p=m=2 and B=Â_2. Each ψ_n is free faithfully flat on the finite-support monomials with exponents below n. The completed source is B[q]/(q²−1). The V_2 sequence for Q_2(B/A) has kernel B and quotient B⊗_(A,ψ_2)A=⊕_e B e, indexed by squarefree monomials. The residues ∑_(1≤i<n)2^i e_(T_i) modulo 2^n are compatible but have no finite-support lift. The quotient is 2-torsion-free and not derived 2-complete, so Q_2(B/A) is not derived 2-complete either. Omitting the right-hand completion would contradict this example.
- For a square-zero negative control, put G=ℤ[1/3], A=ℤ_(2)[t^r | r∈G, r≥0] with ψ_k(t^r)=t^(kr), r_j=(1−3^(−j))/2 and f(r)=1+max{j≥0 | r_j≤r} for r∈G∩[0,1/2). This maximum is finite since r_j increases to 1/2. Let M be the direct sum of (ℤ/2^f(r))e_r, with t^s e_r=2^(f(r+s)−f(r))e_(r+s) if r+s<1/2, and zero otherwise, and R=A⋉M. The exponent differences telescope, so this is an A-module. The perfect cover is the integral inclusion into ℤ_(2)[t^r | r∈ℚ, r≥0], the filtered union of the free rank-u extensions adjoining t^(1/(u3^v)), u>0 prime to 3. Every finite cyclic coordinate of M has zero 2-adic Tate module, hence T₂(R)=0 and R̂_2 is discrete; nevertheless M has unbounded 2-primary torsion.
- For this R, N=M⊗_(A,ψ_2)A contains the direct-limit tower e_(r_j)↦2e_(r_(j+1)), whose orders are 2,4,8,…: r_0=0, r_1=1/3, r_2=4/9 and t^(1/3^(j+1)) gives the displayed transition. This tower lies in the nonzero G/2G exponent component of the right A-factor, whose stage-j generator is t^(3^(−j)). Its colimit is ℤ[1/2]/ℤ, so T₂(N)≠0. At m=2, the presentations of §§3.2, 4.3 identify Q_2(R/A) with `(A[q]/(q^2-1))`⋉(N_(q=−1)⊕M_(q=1)): the proper-V linearity relations affect the second coordinate, while the first satisfies τ_2(am)=ψ_2(a)τ_2(m). Thus q−1 acts as −2 on N, and H⁻¹ of the derived (q−1)-completion contains T₂(N)≠0. Discrete completion of R alone cannot imply the relative conclusion.

### 5.4 Finite type

If R is a finite type ℤ-algebra, Q_m(R) is a finite type ℤ[q]/(q^m−1)-algebra and hence Noetherian. For the toric polynomial ring R₀=ℤ[T_1,…,T_r], R₀[q]/(q^m−1) is finite over the image of c_m. m>0; finite type and finitely many variables are required only for the finiteness statements. (wagner line 1485, Corollary 2.39 and proof, lines 1485–1495; Lemma 2.46 proof, lines 1588–1620; printed wagner v5 pp. 29, 31–32).

- The image contains ℤ[T_1^m,…,T_r^m,q]/(q^m−1), over which R₀[q]/(q^m−1) is finite.

*Construction and proof.* Use the image formula 4.1 and integral monomials for the polynomial case, then descend through a finite presentation.

*Needs:* Layer 4.5; Layer 4.1.

**Checks.**

- With r=0 this is the finite free rank-m algebra ℤ[q]/(q^m−1).
- At m=2,r=1, 1,T generate ℤ[T,q]/(q²−1) over the subring containing T².
- For R=ℤ[T_0,T_1,…] and m=1, Q_1(R)=R is not Noetherian: the ideals (T_0,…,T_n) form a strictly increasing chain. Omitting finite type would give a false conclusion.

### Examples

Identity maps, prime-power indices and a characteristic-two ghost kernel test the limits of étale and torsion claims. The Checks give the values and their negative controls.

### Dependencies

Layer 4.5; Layer 1.6; Layer 5.1; Layer 4.4; EnhancedDerivedSheaves §E5:abstract; Layer 4.6; Layer 3.6; DerivedModuleAlgebra §1.5; DerivedModuleAlgebra §1.7; DerivedModuleAlgebra §1.8; DerivedModuleAlgebra §1.9; Layer 4.1.

## Layer 6: Completed coefficient Frobenius and cyclotomic overlaps

### 6.1 Completed étale Frobenius

For every prime p, a perfectly covered Λ-ring A and étale R/A, the ordinary p-completion R̂_p has a unique continuous ring endomorphism φ_p extending ψ_p:A→A→R̂_p and reducing to x↦x^p on R/p. Its linearization `(Rhat_p tensorL_{A,psi_p}A)^hat_p -> Rhat_p`, r⊗a↦φ_p(r)a, is an equivalence. All rings and completed tensor products in this statement are discrete and agree with ordinary completed tensor products. A perfectly covered; R étale over A; p prime. No Λ-structure or Frobenius lift on uncompleted R is assumed. (wagner-habiro line 647, §2.7, lines 647–658; printed wagner-habiro v2 pp. 15–16).

- φ_p(r) mod p = r^p for r∈R; the map is ψ_p-semilinear over A.

- Let f:A→A′ be a Λ-map between perfectly covered bases and g:R→R′ a ring map with g∘ι_A=ι_A′∘f, where R/A and R′/A′ are étale. For every prime p, its induced map ĝ_p:R̂_p→R̂′_p satisfies `ghat_p phi_{p,R/A}=phi_{p,R'/A'} ghat_p`. This includes fixed-base naturality and requires neither flatness of f nor an additional étaleness hypothesis on g. It follows from the uniqueness in §2.7 (wagner-habiro lines 647–658).

- Write ℓ_p(R/A) for the completed linearization above. The map L_p(f,g) from `(Rhat_p tensorL_{A,psi_p}A)^hat_p` to `(R'hat_p tensorL_{A',psi'_p}A')^hat_p` is induced by r⊗a↦ĝ_p(r)⊗f(a). Prove `ghat_p ell_{p,R/A}=ell_{p,R'/A'} L_p(f,g)`. The vertical maps are f-semilinear on the right scalar factors; tensor balancing uses f∘ψ_p=ψ′_p∘f. Identity pair maps induce identities and composite pair maps induce composites, on completions and on these linearization sources (wagner-habiro §2.7, pp. 15–16, lines 647–658; §2.5).

- For every a≥0, the linearization of φ_p iterated a times, with right scalar twist ψ_(p^a), is an equivalence. The exponent-zero map is the identity; adding exponents composes the linearizations with their indicated scalar twists. The pair maps above intertwine these iterations and their linearizations, with identity and composition laws (wagner-habiro §2.7, pp. 15–16, lines 647–658; §2.5).

- The derived completed tensor equals completion of the ordinary twisted tensor.

*Construction and proof.* Lift the relative Frobenius modulo p uniquely through the nilpotent p-power thickenings using formal étaleness. The inverse limit gives φ_p. For a pair map (f,g), restrict both composites in the naturality equation to R and then to R′/p^n for every n≥1. Their A-actions agree since f∘ψ_p=ψ′_p∘f, and both reduce to r↦g(r)^p modulo p. Formal étaleness of R/A makes their lifts through R′/p^n→R′/p equal. The limit and continuity give the asserted equality on R̂_p. Tensor functoriality gives the linearization square, the pair-map identity and composition laws and their iterated versions. Perfect coverage makes A and R torsion-free and ψ_p flat; completed tensor products are discrete by complete flatness. Modulo p the linearization is étale relative Frobenius, an isomorphism; derived Nakayama gives the equivalence.

*Needs:* Layer 2.4; Layer 2.5 for Adams twists and their composition; Layer 5.3; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29; SchemeAndStackFoundations §4.1; DerivedModuleAlgebra §0.2 for tensor functoriality; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.7.

**Checks.**

- For R=A, the linearization is the canonical equivalence of the ψ_p-twisted base with A after completion. If p is invertible in A, both completions are zero; no prime is discarded.
- For A=ℤ,R=ℤ×ℤ,p=2, φ_2 is identity on ℤ₂×ℤ₂ and reduces to the square map.
- For R=ℤ[T] over A=ℤ, the coordinate lift T↦T² exists but its linearization is not an equivalence modulo 2: T is outside its image. Étaleness cannot be replaced by smoothness.
- For A=R=ℤ[t] with ψ_n(t)=t^n and A′=R′=ℤ, take f=g with t↦0, a Λ-map which is not flat. At p=2, the two naturality paths send t+2 to 2, and the two linearization paths send (t+2)⊗(t+3) to 6. Modulo 4 the first value is 2, whereas literal squaring of g(t+2)=2 gives 0; lifting the mod-2 power map must retain its specified base action through the square-zero thickening ℤ/4→𝔽₂.
- Compose this pair map with ℤ→ℤ[1/3]. At p=2, both the composite and the two successive linearization-source maps send (t+2)⊗(t+3) to 2⊗3, and both linearizations give 6. The identity pair map retains (t+2)⊗(t+3); for a=0 it gives the completed identity, and for a=2 the iterated coefficient Frobenius sends t+2 to t⁴+2 and then to 2. At p=3 the localized completions are zero on both paths.

### 6.2 Cyclotomic completed Frobenius

For A,R,p as in 6.1 and every d>0 there is a natural A[q]-linear equivalence `((Rhat_p tensorL_{A,psi_{pd}}A)[q])^hat_{(p,Phi_{pd})}` ≃ `((Rhat_p tensorL_{A,psi_d}A)[q])^hat_{(p,Phi_d)}`, induced by r⊗a↦φ_p(r)⊗a and q↦q. It agrees with ordinary completed tensor products. Iteration composes these maps for d,pd,…,p^a d. A perfectly covered; R étale over A; p prime; d>0. (wagner-habiro line 647, §2.7 and Theorem 2.9 proof, lines 647–661 and 709–716; printed wagner-habiro v2 pp. 15–17).

- The equivalence fixes q and the right A-factor.

- For every commutative A, prime p and natural number d, including zero, the ideals (p,Φ_d) and `(p,Phi_{pd})` have equal radicals in A[q], giving the same derived completion functor, by Mathlib `Polynomial.cyclotomic_zero`, `Polynomial.cyclotomic_mul_prime_eq_pow_of_not_dvd`, `Polynomial.cyclotomic_mul_prime_dvd_eq_pow` and DerivedModuleAlgebra §1.2 `isDerivedCompleteRadical`, §1.3. At d=0 both ideals are the unit ideal; the coefficient Frobenius equivalence above retains d>0.

- The ideals (3,Φ_3) and (3,q−1) in ℤ[q] are unequal despite their equal radicals. This distinguishes equality of ideals from equality of their radicals (Mathlib characteristic-p cyclotomic identities; Wagner–Habiro §2.7, pp. 15–16, wagner-habiro line 647).

- The equivalence is the ψ_d-base change of 6.1 followed by the common completion. For every pair map (f,g) of §6.1, the maps from the twist of index e over (A,R) to that over (A′,R′), for e=d,pd, are induced by r⊗a↦ĝ_p(r)⊗f(a), q↦q, and extend to the respective (p,Φ_e)-completions. Prove that these f[q]-semilinear maps intertwine the two coefficient-Frobenius equivalences. They preserve identities and composites and intertwine every iteration along d,pd,…,p^a d, including a=0 (wagner-habiro §2.7 and proof of Theorem 2.9, pp. 15–17, lines 647–661 and 709–716; §6.1).

*Construction and proof.* Apply ψ_d scalar extension to 6.1: tensor balancing uses `psi_d psi_p=psi_{pd}`. Extend by q fixed. Equal radicals permit use of one completion topology; flatness of ψ_d and completed base change give the equivalence, without imposing p∤d. For a pair map, f∘ψ_e=ψ′_e∘f balances both twisted tensors, and f[q] preserves p and Φ_e. Extend the naturality square and coherence laws of §6.1 by these tensor and completion maps; this uses no flatness of f.

*Needs:* Layer 6.1; Layer 2.5; Mathlib characteristic-p cyclotomic identities; DerivedModuleAlgebra §§1.2–1.3.

**Checks.**

- For p=2,d=1, Φ_1=q−1 and Φ_2=q+1 become equal modulo 2.
- For p=3,d=1, Φ_3 mod 3=(q−1)²; (3,Φ_3) and (3,q−1) have the same radical but are not equal in ℤ[q].
- For d=0, Φ_0=Φ_(p·0)=1, so both ideals are A[q] and both derived completion functors are zero. With A=ℤ, replacing Φ_0 by Φ_1 would give the proper ideal (p,q−1) instead.
- For R=0 both sides are zero, and for R=A the map is the canonical twisted-base equivalence.
- For the nonflat map ℤ[t]→ℤ, t↦0, with R=A and R′=A′, take p=2,d=1. The two paths on (t+2)⊗(t+3) give 6 and both fix q=1+h. For two coefficient-Frobenius steps, starting at twist 4 and ending at twist 1, the coefficient becomes (t⁴+2)⊗(t+3), again giving 6 after the pair map. The identity pair map retains each tensor and q; composing with ℤ→ℤ[1/3] still gives 6 and 1+h on either path.

### 6.3 Completed ghost Frobenius

For pd|m, the reductions modulo p of `gh_{m/(pd)}` and `gh_{m/d}` commute with the bottom map `R/p tensor_{A/p,psi_{pd}}(A/p)[q]/Phi_{pd} -> R/p tensor_{A/p,psi_d}(A/p)[q]/Phi_d`, r⊗a↦r^p⊗a, q↦q. The deformation of this bottom map on the common (p,Φ_d)-completion is exactly 6.2. A perfectly covered; R étale over A; p prime; pd|m. (wagner-habiro line 679, Theorem 2.9 proof, lines 679–721; printed wagner-habiro v2 pp. 16–17).

- The two paths on τ_m(r) give r^(m/d)⊗1.

- The comparison is characterized by the indicated reduction and unique étale lifting, compatibly with iterations. For every pair map (f,g) of §6.1, the relative q-Witt map Q_m(R/A)→Q_m(R′/A′) and the twisted ghost-target maps r⊗a↦g(r)⊗f(a), q↦q intertwine the mod-p ghost diagram. Their completed maps intertwine its deformation of §6.2. These compatibilities preserve identity and composite pair maps and every prime-power iteration, with exponent zero the identity (wagner-habiro proof of Theorem 2.9, pp. 16–17, lines 679–716; §§4.4–4.5, 6.1–6.2).

*Construction and proof.* The ordinary Witt ghosts in characteristic p satisfy `w_{pn}=w_n^p`. Descend this identity through the relative presentation and the cyclotomic quotient. Use 5.2 for the étale ghost algebras and unique formal lifting to identify the completed map. The ghost naturality of §4.4, the relative base change of §4.5 and the completed pair-map square of §6.2 give naturality of this identification, including identities, composites and iterations.

*Needs:* Layer 6.2; Layer 5.2; Layer 4.4 for relative ghost naturality; Layer 4.5 for Λ-base change.

**Checks.**

- For m=p,d=1, the upper Teichmüller value r maps to r^p, matching the bottom ghost.
- For A=R=ℤ and p=2 this is the q-fixed overlap between q=−1 and q=1 modulo 2.
- For A=R=ℤ,p=2,d=1,m=2, the deformed bottom map sends q=1+h to 1+h in ℤ₂[[h]]. Substitution q↦q² instead gives 1+2h+h², a different value; the deformation must fix q.
- For A=R=ℤ[t]→A′=R′=ℤ with t↦0, take p=2,d=1,m=4. On τ_4(t+2), the top ghost gives (t+2)²⊗1 and the bottom Frobenius gives (t+2)⁴⊗1 modulo 2. After the pair map the unreduced polynomial values are 4 and 16, giving 0 and 0 modulo 2, as for τ_4(2). Its completed deformation sends (t+2)²⊗1 to (t²+2)²⊗1; after the pair map its value is 4, whose reduction is the same 0. Thus the completed lift and the literal square agree modulo 2 without being identical before reduction. Both routes fix q=1+h, also after composition with ℤ→ℤ[1/3].

### Examples

The coefficient map fixes q. For p=3,d=1 its two completion ideals have equal radicals but need not be equal. The Checks give the values and their negative controls.

### Dependencies

Layer 2.4; Layer 2.5; Layer 5.3; SchemeAndStackFoundations §0.23a; SchemeAndStackFoundations §0.29; SchemeAndStackFoundations §4.1; DerivedModuleAlgebra §0.2; DerivedModuleAlgebra §1.2; DerivedModuleAlgebra §1.3; DerivedModuleAlgebra §1.7; Layer 6.1; Layer 6.2; Layer 5.2; Layer 4.4; Layer 4.5.

## Layer 7: Positive-degree q-Witt systems

### 7.1 Differential q-V systems

For A a Λ-ring and R/A define a q-V system of nonnegative differential graded A[q]-algebras P_m: each has xy=(−1)^(ij)yx for homogeneous x∈P_m^i,y∈P_m^j, and x²=0 whenever i is odd, receives Q_m(R/A)→P_m⁰, and has graded A[q]-linear `V_{m/d}` extending degree-zero V, with identity and composition laws, V(ω dη)=V(ω)dV(η), and V(ω)dτ_m(r)=V(ωτ_d(r)^(m/d−1))dV(τ_d(r)). Morphisms preserve all data. A any arithmetic Λ-ring; R any A-algebra; homogeneous ω,η in the indicated source; r∈R; d|m. (wagner line 1822, Definition 3.1, lines 1822–1838; printed wagner v5 p. 37).

- The specified degree-zero map, V and identities construct an object.

- Component DGA maps determine system maps.

- V_n d = n d V_n.

- Restrict to arbitrary divisor-closed positive indices.

*Construction and proof.* Use the associative DG carriers, imposing the displayed graded commutativity and strict odd alternation as conditions on their multiplication. The projection identity with ω=1 and the relation (q^d−1)P_d=0 prove V_n d=n dV_n; no integer is inverted.

*Needs:* Layer 4.3; DGAInfinity Layer 0; DGAInfinity Layer 1; `gap:ordinary-derham`.

**Checks.**

- At level 1, the exterior de Rham algebra `Omega*_{A[T]/A}`, with q=1 and V_1=id, satisfies the multiplication conditions: dT∧dT=0 and d(T²)=2T dT. A symmetric algebra on dT with nonzero square would fail.
- Over 𝔽₂ a graded commutative algebra with a degree-one element u satisfying u²≠0 is excluded by strict alternation.
- For A=R=ℤ and m=1, take P=ℤ[u] with |u|=2 and zero differential. The quotient by (u²) retains u≠0 and has u²=0; it satisfies both multiplication conditions. In `Omega*_{Z[T]/Z}`, the graded ideal (T) is not differential because dT is outside it, so quotienting only by (T) cannot induce a differential.

### 7.2 The initial q-Witt differential system

For every A,R as in 7.1 construct the initial q-V system `Q_m Omega*_{R/A}`. Degree zero is canonically Q_m(R/A), and `Q_1 Omega*_{R/A} ~= Omega*_{R/A}`. The natural de Rham DGA map `Omega*_{Q_m(R/A)/A[q]} -> Q_m Omega*` is surjective. At level m the defining differential ideal is generated by all lifted positive-degree relations (k≥1) `sumV(w_j)dV(x_{j1})...dV(x_{jk})` whenever ∑w_j `dx_{j1}...dx_{jk}=0` at a proper divisor, and the V-Teichmüller relations of 7.1. A any Λ-ring; R any A-algebra; m>0; strict odd alternation including at 2. (wagner line 1956, Proposition 3.12, Definition 3.13 and Remark 3.14, lines 1956–2010; printed wagner v5 pp. 40–41).

- Every q-V system receives a unique system map from QΩ.

- Maps agree on elements x₀dx₁⋯dx_k and the structural data.

- A-algebra maps induce DGA maps; filtered colimits and reflexive polynomial presentations are preserved.

- V(w dx₁⋯dx_k)=V(w)dV(x₁)⋯dV(x_k).

*Construction and proof.* Induct on m through its proper divisors and quotient the supplied de Rham algebra by the stated differential ideal. All generators have positive degree, preserving degree zero. Lifting polynomial differential expressions proves existence of V and initiality.

*Needs:* Layer 7.1; gap:dga-quotient.

**Checks.**

- `Q_1 Omega*_{R/A}=Omega*_{R/A}` and `Q_m Omega*_{0/A}=0`.
- For R=A the complex is A[q]/(q^m−1) in degree zero.
- For m=1,R=A[T], d(T²)=2T dT and dT∧dT=0, also at residue characteristic 2.

### 7.3 Differential q-FV systems

A differential q-FV system is a q-V system with graded A[q]-algebra `F_{m/d}` extending F in degree zero, F_1=id, composition, coprime F/V interchange, FV=m/d, `VF=[m/d]_{q^d}`, F d V=d, V(ωFη)=V(ω)η and F(dτ_m(r))=τ_d(r)^(m/d−1)dτ_d(r). A any Λ-ring; R any A-algebra; d|m. F is not required to commute with d. (wagner line 1893, Definition 3.6 and Lemma 3.7 proof, lines 1893–1929; printed wagner v5 p. 39).

- A q-V system and the displayed graded maps and relations construct an object.

- A morphism is determined by its component graded algebra maps.

- d F_n = n F_n d, derived from F d V=d and `VF=[n]_{q^d}`.

- Forget F to obtain a q-V system; no equivalence of these two categories is asserted.

*Construction and proof.* Store exactly the graded identities and prove the differential formula by FdV and VF; (q^d−1)=0 on the target converts the q-integer to n. The generator calculation fixes the order dF_n=nF_nd.

*Needs:* Layer 7.2.

**Checks.**

- At m=2,R=ℤ[T], F_2(dτ_2(T))=T dT but d(F_2τ_2(T))=2T dT.
- For A=ℤ, R=ℤ[T], m=3 and d=1, F_3(dτ_3(T))=T²dT whereas d(F_3τ_3(T))=3T²dT. Reducing these values modulo 3 gives the nonzero form T²dT and zero, respectively; the scaled differential law cannot be replaced by the chain-map law.
- At m=d=1, F_1=id on `Omega*_{Z[T]/Z}`, so dF_1(T)=F_1d(T)=dT. This boundary has scale factor 1 and requires no prime Frobenius step.

### 7.4 Prime Verschiebung differential identities

In every q-V system over R/A, for p|m and `x in Q_{m/p}(R/A)`, dV_p(x^p)=V_p(x^(p−1))dV_p(x). On absolute q-Witt vectors the map γ_p on im V_p defined by γ_p(V_p x)=p^(p−2)V_p(x^p) is well-defined and satisfies pγ_p(v)=v^p; the differential of every q-V system is a derivation compatible with this operation after passing from absolute to relative degree zero. A any Λ-ring; R any A-algebra; p prime dividing m; a q-V system as in 7.1 is given. No Frobenius on positive degrees is used. (wagner line 1849, §3.3 and Lemma 3.4, lines 1849–1874; langer-zink Lemma 1.5, langer-zink line 601; printed wagner v5 p. 38; langer-zink July 2003 pp. 19–20).

- The V-Teichmüller identity supplies the relation for scalar multiples of Teichmüller lifts.

- The relation is preserved under addition, using the integral binomial identity.

*Construction and proof.* The identity holds in every q-V system and uses only Verschiebung and the differential. Prove the formula first on Teichmüller generators, then on sums by the integral binomial expansion, and finally on V_ℓ-generators by induction on m, including ℓ=p. This is the V-only adaptation of the three-step argument in langer-zink line 605; it does not use an unconstructed F. Absolute V-injectivity makes γ_p a function on its image; the relative assertion is the displayed identity, not a claim of relative V-injectivity.

*Needs:* Layer 7.2; Layer 3.4.

**Checks.**

- At p=2, γ_2(V_2x)=V_2(x²) and 2γ_2(V_2x)=(V_2x)²; no inverse of 2 occurs.
- For x=0 both sides of the differential identity are zero.
- Use the {1,2}-truncated q-V system with `P_1=P_2=Omega*_{Z[T]/Z}`, q=1, degree-zero structure maps id and gh_2, and V_2 in degree i equal to multiplication by 2^(i+1). For x=T, dV_2(T²)=4T dT=V_2(T)dV_2(T); reversing the sign gives −4T dT, and omitting V_2(T) gives 2dT.

### 7.5 Positive-degree Frobenius

For each p|m define an F_p-semilinear derivation `theta_p:Q_m(R) -> Q_{m/p} Omega^1_{R/Z}` by `theta_ptau_m(r)=tau_{m/p}(r)^(p-1)dtau_{m/p}(r)`, θ_p V_p=d, and, for ℓ≠p prime dividing m, p θ_pV_ℓ=dF_pV_ℓ and ℓ θ_pV_ℓ=V_ℓθ_p. It extends uniquely to graded F_p on the relative Q_mΩ*. These F make QΩ initial among differential q-FV systems. A any arithmetic Λ-ring; R any A-algebra; m>0; p prime dividing m. (wagner line 2053, Proposition 3.17, §§3.20–3.30, lines 2053–2549; langer-zink Proposition 1.3, langer-zink line 453 (July 2003 preprint); printed wagner v5 pp. 42–50; langer-zink July 2003 pp. 14–16).

- θ_p(x+y)=θ_p(x)+θ_p(y), θ_p(xy)=F_p(x)θ_p(y)+F_p(y)θ_p(x).

- F_p(x₀dx₁⋯dx_k)=F_p(x₀)θ_p(x₁)⋯θ_p(x_k).

- The Teichmüller and V formulas determine all F; this is uniqueness on the initial object, not on every q-V system.

*Construction and proof.* Use the exact V-resolution to define θ on the sum of V-images. The cyclotomic quotient gives unique Teichmüller remainder representatives. Prove additivity and the derivation law by finite-type reduction, detection after localization and completion, and the already constructed proper-divisor operations. Check that θ kills the relative scalar and differential ideals, then use the de Rham universal property. Verify the system laws on the generators; no torsion-free assumption on R is used.

*Needs:* Layer 7.3; Layer 5.4; Layer 3.4; DerivedModuleAlgebra §1.3; `gap:cyclotomic-contract`; Layer 7.4; Layer 1.8.

**Checks.**

- For R=ℤ[T] at m=p=2, θ_2(τ_2(T))=T dT without division by 2, and θ_2(V_2(T))=dT rather than 2dT.
- For R=ℤ[T] at m=p=2, F_2(τ_2(T))=T², hence θ_2(τ_2(T)²)=2T³dT. An ordinary derivation with the same value on τ_2(T) would instead give 2T²dT; the F_2-semilinear product rule is essential.
- At m=1 there is no prime step and F_1=id.

### 7.6 Differential ghosts

Construct DGA maps `gh_{m/d}:Q_m Omega*_{R/A} -> Omega*_{R/A} tensor_{A,psi_d}A[zeta_d]`. On a form x₀dx₁⋯dx_k use the corresponding degree-zero ghost and its de Rham differential. In degree i the ghost of V_n has coefficient n^(i+1) on the components whose index divides the smaller level and is zero elsewhere. A any Λ-ring; R any A-algebra; d|m; i≥0. (wagner line 2011, §3.15, lines 2011–2041; printed wagner v5 pp. 41–42).

- Ghosts commute with differential and multiplication.

- For n=m/d and e|d, n^i `gh_{d/e}(F_nomega)=gh_{m/e}(omega)` for a degree-i form ω.

- Ghosts commute with A-algebra maps and Λ-base change.

*Construction and proof.* Give the product of twisted de Rham algebras the q-V system whose degree-i V acts as n^(i+1) on surviving components; apply initiality 7.2. Compatibility with F follows from 7.5 and its Teichmüller and V generators.

*Needs:* Layer 7.5; Layer 4.4.

**Checks.**

- At m=2, the degree-one d=1 component of V_2(dT) is 4dT, not 2dT.
- At m=1 the differential ghost is identity on `Omega*_{R/A}`.
- For A=ℤ,R=ℤ[T],m=2,d=1, gh_2(V_2(T))=2T in degree zero, whereas gh_2(V_2(dT))=4dT in degree one. A degree-independent coefficient 2 fails.

### 7.7 Differential base change

For a Λ-map A→A′, `Q_m Omega*_{R/A} tensor_A` A′ ≅ `Q_m Omega*_{R tensor_A A'/A'}`. If R→R′ is étale over A, `Q_m(R'/A) tensor_{Q_m(R/A)}Q_m Omega*_{R/A}` ≅ `Q_m Omega*_{R'/A}`, with the unique DGA differential extending that on Q_mΩ*. Both comparisons preserve F,V,τ and ghosts. A,A′ any Λ-rings; R any A-algebra; m>0. Étaleness is required in the second assertion only. (wagner line 2044, Lemma 3.16 and Proposition 3.31, Lemma 3.32, lines 2044–2050 and 2552–2595; printed wagner v5 pp. 42, 50–51).

- The degreewise functors on affine étale algebras satisfy faithfully flat étale descent.

- For `P=Q_m Omega*_{R/A}`, B=A[q] and S=Q_m(R′/A) with R→R′ étale, `S tensor_{P^0}P` has the unique B-linear differential extending d, by CrystallineCohomology §CR.4.6, with the relative and strict-alternation specialization in gap:ordinary-derham.

*Construction and proof.* Λ-base change follows from initiality and 4.5. Apply CrystallineCohomology §CR.4.6 through gap:ordinary-derham with B=A[q], `P=Q_m Omega*_{R/A}` and S=Q_m(R′/A); P is nonnegative, graded commutative and strictly odd alternating, and 5.1 makes P⁰→S étale. Transfer F and V using 5.1 and verify the Teichmüller and FdV identities by uniqueness of étale derivations. Module descent gives the degreewise sheaf property.

*Needs:* Layer 7.6; Layer 5.1; `gap:ordinary-derham`; CrystallineCohomology §CR.4.6.

**Checks.**

- A′=A and R′=R give identity isomorphisms.
- At m=1 both results are ordinary de Rham base change.
- For A=ℤ,m=1, the étale localization ℤ[T]→ℤ[T,T⁻¹] has d(T⁻¹)=−T⁻²dT≠0. Defining the extended differential by s⊗ω↦s⊗dω would instead give zero on T⁻¹.
- Over the commutative base ℤ, take the associative square-zero DGA with P⁰=ℤ[x], P¹=ℤ[x]u, d=0 and ub=b(0)u; the étale localization S=ℤ[x,x⁻¹] leaves `S tensor_{P^0}P^1=Su` nonzero, but a compatible multiplication would give u=(ux)x⁻¹=0, so this noncentral-degree-zero DGA is excluded from the supplier contract.

### Examples

Frobenius is a graded algebra map. Its differential relation has a factor n, visible on dτ_2(T) already over ℤ[T]. The Checks give the values and their negative controls.

### Dependencies

Layer 4.3; DGAInfinity Layer 0; DGAInfinity Layer 1; `gap:ordinary-derham`; Layer 7.1; gap:dga-quotient; Layer 7.2; Layer 3.4; Layer 7.3; Layer 5.4; DerivedModuleAlgebra §1.3; `gap:cyclotomic-contract`; Layer 7.4; Layer 1.8; Layer 7.5; Layer 4.4; Layer 7.6; Layer 5.1; CrystallineCohomology §CR.4.6.

## Layer 8: Complete framed difference calculus

### 8.1 Power-series realization of a complete frame

For any commutative unital A and finite-coordinate étale frame □:A[T₁,…,T_r]→R, realize P=R[[h]] over D=A[[h]], q=1+h, as the K=(h) instance of PrismaticCohomologyPartII §5.0's `FramedAlgebra`. Prove that the completed source D[T₁,…,T_r]^∧_h is A[T₁,…,T_r][[h]], the induced frame is h-completely étale, P and P/h and P/(hT_i) have the required completeness, and hT_i is regular. These assertions allow arbitrary A, including zero divisors and characteristic two; r≥0. Identify the supplied γ_i with the continuous A[[h]]-algebra automorphism on this power-series carrier. (Wagner v5 §4.7, p. 57, wagner lines 2830–2848; Pridham v4 Definition 1.22, p. 9, pridham line 371; Scholze v1 §3, pp. 6–7, scholze line 319.)

Prove `QWitt.framedGamma_existsUnique`: on the full `PowerSeries R` carrier there is a unique `PowerSeries A`-algebra equivalence preserving constant coefficients and sending the constant coordinate T_j to `(if j=i then 1+h else 1)*T_j`. Algebra linearity fixes h and preserves every h-power ideal. This is the native-carrier realization of the supplied automorphism.

- The realization is identity on coefficient series and on the constant-coordinate basis; its automorphism is `FramedAlgebra.gamma` with the same ordered coordinate index.
- The quotient P/(hT_i) is described by a constant coefficient in R and positive coefficients in R/(T_i). Its h-adic limit is itself; this verifies actual divisibility rather than membership only in a closure.
- The realization commutes with framing-compatible étale coefficient maps and coordinate injections whose extra target directions fix the image. It carries the supplied inverse and commuting automorphisms to the same series maps.

*Construction and proof.* Use formal étaleness on the nilpotent h-adic quotients to identify the completed frame. T_i is regular on A[T] and remains regular on R by flatness; coefficientwise multiplication then makes hT_i regular on P. The displayed quotient description proves completeness. Specialize the supplier's unique coordinate-scaling automorphisms and compare on each nilpotent quotient to obtain the power-series signature.

*Needs:* PrismaticCohomologyPartII §5.0; SchemeAndStackFoundations §4.1; Mathlib `PowerSeries`.

**Checks.**

- On A[T], γ(T²)=q²T²=(1+2h+h²)T². With no coordinates the realized complex has only its degree-zero coefficient ring and there are no γ_i.
- In ℤ[T][[h]], γ⁻¹(T)=(1−h+h²−⋯)T; in ℤ[T,q], scaling by q has no inverse. Thus the realization requires completion where q is a unit.
- For the localization frame ℤ[T]→ℤ[T,T⁻¹], γ(T⁻¹)=q⁻¹T⁻¹. The identity map reduces correctly modulo h but fails γ(T)=T+hT.
- Over (ℤ/4)[T], γ(T²)=(1+2h+h²)T², and over 𝔽₂[T] it is (1+h²)T². In P/(hT), the coefficient of hT is zero but the constant coefficient T survives; treating this quotient as P/(T) would lose that element.
- The map 𝔽₂[T]→𝔽₂[Z], T↦Z², is not étale: a proposed γ(Z) has square with zero h coefficient, whereas (1+h)Z² has h coefficient Z²≠0.

### 8.2 Divided-difference transport to Kähler forms

For the realization of §8.1, use the supplied `QFraming.qDeriv` as D_i; its defining equation is hT_iD_i(f)=γ_i(f)−f. Identify its reduction modulo h with the coordinate derivation of R/A under the native Kähler basis, and identify its action on series by continuous extension. This is a transport from the shared framing structure, with no second divided-difference carrier. (Wagner v5 §§4.7–4.8, p. 57, wagner lines 2842–2872; Bhatt–Scholze v4 Construction 16.19 and footnote 21, p. 114, bhatt-scholze lines 4324–4343.)

- Under the coordinate basis, ∑D_i(f)dT_i reduces to the universal Kähler differential df.
- The supplier's two product-rule forms D_i(f)g+γ_i(f)D_i(g) and fD_i(g)+γ_i(g)D_i(f) agree on these commutative coefficients: their difference is −hT_iD_i(f)D_i(g)+hT_iD_i(g)D_i(f)=0.
- The comparison intertwines framing-compatible maps and the supplied commuting operators; reindexing preserves the ordered coordinate basis and its exterior signs.

*Construction and proof.* Divide before reducing modulo h, using regular hT_i from §8.1. Formal étaleness identifies the first-order coordinate scaling with T_i∂/∂T_i; the universal property of Kähler differentials identifies the coordinate derivation on all of R. Apply the finite free differential basis and continuity coefficientwise.

*Needs:* Layer 8.1; PrismaticCohomologyPartII §5.0; Mathlib `KaehlerDifferential.D`; Tau Ceti `TauCeti.kaehlerBasisOfFormallyEtale`.

**Checks.**

- D(T²)=(1+q)T and D(T³)=(1+q+q²)T², reducing to 2T and 3T². D(T)=1 fixes the normalization.
- D(1)=0; no expression T^(−1) is used at exponent zero. At q=1 in characteristic two, D(T²)=0.
- On the localization frame ℤ[T]→ℤ[T,T⁻¹], D(T⁻¹)=−q⁻¹T⁻² and its reduction is −T⁻². This frame is étale without being finite; an integral equation for T⁻¹ would imply 1∈(T).
- For A=ℤ[U] and R=A[T], D(U)=0 and D(UT²)=U(1+q)T; differentiating U as a coordinate would give the wrong relative differential.

### 8.2a The skew product on finite framed q-de Rham complexes

For a commutative ring D with a chosen q∈D, h=q−1, and a commutative D-algebra E with a finite ordered `QFraming` as specified in PrismaticCohomologyPartII §5.0, so with pairwise commuting D-automorphisms γ_s satisfying γ_s(X_u)=q^(δ_su)X_u, each hX_s regular on E and each γ_s−1 divisible by hX_s, let C be the supplied `QFraming.qDeRhamComplex`: its terms are E⊗_D∧^kD^S on the ordered exterior basis e_I, and its differential is d(a e_I)=∑_sD_s(a)e_s∧e_I with D_s the supplied `QFraming.qDeriv`, hX_sD_s(f)=γ_s(f)−f. Equip C with the unital associative D-DGA product (a e_I)(b e_J)=aγ_I(b)e_I∧e_J, where γ_I is the composite of the γ_s for s∈I and e_s²=0 in the exterior basis, including in characteristic two. Construct it as the restriction of the twisted Koszul product `AInf.koszul_products_and_cohomology` of AInfCohomology §AI.1.7 on K_E(γ_s−1) along the D-linear coefficient rescaling ρ:C→K_E(γ_s−1), ρ(a e_I)=a(∏_(s∈I)hX_s)x_I. Equivalently, the product is the exterior product with the additional rule e_sa=γ_s(a)e_s. No p-regularity, δ-structure or q-PD datum is required: D is any commutative ring and E any D-algebra with such a framing, including every K=(h) realization of §8.1 over an arbitrary A. (Wagner v5 §4.8, p. 57, wagner lines 2858–2872; the twisted Leibniz rule and the commuting automorphisms are those of PrismaticCohomologyPartII §5.0.)

- The rescaling ρ is injective on every term, because each hX_s is regular on E and the terms are free E-modules on the ordered basis, and it is a chain map: for s∉I, (γ_s−1)(a∏_(u∈I)hX_u)=hX_sD_s(a)∏_(u∈I)hX_u because γ_s fixes h and every X_u with u≠s, while for s∈I the exterior factor e_s∧e_I vanishes on both sides.
- The image of ρ is closed under the supplied twisted product: for disjoint I and J, γ_I fixes every hX_u with u∈J, so ρ(a e_I)ρ(b e_J)=aγ_I(b)(∏_(s∈I∪J)hX_s)x_I∧x_J=ρ(aγ_I(b)e_I∧e_J); when I and J meet, both sides are zero. Hence the displayed product on C is D-bilinear, associative, has unit 1∈E=C⁰, and satisfies d(ωη)=d(ω)η+(−1)^kωd(η) for ω of degree k, all transported along the injective ρ.
- The two twisted Leibniz forms D_s(fg)=D_s(f)g+γ_s(f)D_s(g) and D_s(fg)=fD_s(g)+γ_s(g)D_s(f) agree on the commutative E, their difference being −hX_sD_s(f)D_s(g)+hX_sD_s(g)D_s(f)=0; either gives the Leibniz law directly on C, without passing through ρ.
- For a D-algebra map E→E′ between such framed algebras and an injection ι of coordinate sets intertwining the automorphisms and the divided differences, with the extra target automorphisms fixing the image, the induced map C→C′, e_s↦e′_(ι s), preserves differential, product and unit, compatibly with identity and composition. No map merging coordinate directions is asserted.
- For a framed q-PD envelope in the range of PrismaticCohomologyPartII §5.18, this product is `QDeRham.skewDGA` by the displayed basis formula; the intrinsic E₁ comparison is imported only in that range.

*Construction and proof.* Define the product by the displayed formula on basis forms and extend D-bilinearly. Verify the two closure identities of the first bullets by the coordinate laws γ_s(X_u)=q^(δ_su)X_u and γ_s(h)=h; injectivity of ρ then transports associativity, the unit law, the square-zero relations and the signed Leibniz law from the supplied twisted DGA on K_E(γ_s−1), whose relations x_sa=γ_s(a)x_s and x_s²=0 hold over any commutative base. Alternatively expand d((a e_I)(b e_J)) by the second twisted Leibniz form and use D_sγ_I=γ_ID_s for s∉I, which follows from γ_I fixing hX_s and the regularity of hX_s. For naturality, the map sends hX_s to hX′_(ι s), so it commutes with ρ, and the extra target directions contribute zero to the differential on the image.

*Needs:* PrismaticCohomologyPartII §5.0; AInfCohomology §AI.1.7.

**Checks.**

- On E=𝔽₂[T][[h]] over D=𝔽₂[[h]], q=1+h: eT=qTe and d(T²)=(1+q)Te=hTe. The untwisted graded-commutative rule would give d(T²)=2Te=0. Multiplication by 2 on D has kernel D, so D is not flat over ℤ₂[[h]] and §5.18 does not apply, whereas the supplied twisted Koszul product has no such hypothesis.
- In one coordinate over D=ℤ[[h]], E=ℤ[X][[h]]: ρ(dX)=ρ(e)=hXx and (γ−1)(X)x=hXx agree, and ρ(d(X²))=(1+q)hX²x=(q²−1)X²x=(γ−1)(X²)x. Rescaling by X alone would send dX to Xx, which is not (γ−1)(X)x, so the factor h in ρ is forced.
- For E=ℤ[X,Y][[h]], (e_X·Y)·X=qXYe_X=e_X·(YX), and d(XY)=Ye_X+Xe_Y has d²=−e_X∧e_Y+e_X∧e_Y=0. With no coordinates C=E and its unit and product are those of E; e_X²=0 also after reduction modulo 2.
- The coordinate injection ℤ[X][[h]]→ℤ[X,Y][[h]] sends e_X·X=qXe_X to the same expression and has D_Y(X)=0. Merging X,Y into T would send d(XY) to 2Te but d(T²)=(1+q)Te, so the termwise map is excluded.

### 8.3 Kähler realization and the h-scaled complex

For the frame of §8.1, let C□ be the supplied `QFraming.qDeRhamComplex` with the arbitrary-base skew multiplication of §8.2a, and construct H□ by replacing its differential by h times that differential. Use AInfCohomology §AI.1.7's Koszul carrier for H□=K(R[[h]];hD_i). Prove the termwise identifications C□^k≅H□^k≅Ω^k_(R/A)[[h]] using the finite ordered coordinate basis. All complexes are nonnegative; A is arbitrary, r≥0. (Wagner v5 §§4.7–4.8, p. 57, wagner lines 2849–2872.)

- The term comparison sends the ordered supplier basis to dT_I and carries the supplied product to (f dT_I)(g dT_J)=fγ_I(g)dT_I∧dT_J. It preserves units and products; the differential on H□ is h∑D_i(f)dT_i.
- Reduction modulo h identifies C□ with Ω*_(R/A) with its de Rham differential, and H□ with the same exterior algebra with zero differential. Coordinate one-forms have square zero, including at two; the unreduced product is associative and skew.
- The comparisons commute with framing-compatible étale maps and coordinate injections whose extra directions fix the image, including products and scalar extension when completed. No termwise map merging coordinate directions is asserted.

*Construction and proof.* Apply the finite free Kähler basis transport and its exterior powers to the supplied Koszul complex and skew product. Multiplying a differential by the central scalar h preserves square zero and the DG Leibniz law with the same product. The identifications are on the coefficient ring and the ordered basis, so their product and map compatibilities follow from the displayed transported formula.

*Needs:* Layers 8.1–8.2; Layer 8.2a; AInfCohomology §AI.1.7; PrismaticCohomologyPartII §5.0; gap:ordinary-derham.

**Checks.**

- d_C(T²)=(1+q)T dT while d_H(T²)=(q²−1)T dT; modulo h the values are 2T dT and zero.
- For rank zero, both complexes are R[[h]] in degree zero and the term comparison is identity. For the polynomial rank-two frame, d⁰(XY)=(Y,X) and d¹(Y,X)=1−1=0; on H□ the composite is h²(1−1)=0. A plus in both terms would give 2 on C□ over ℤ.
- In one coordinate, dT·T=qT dT but T·dT=T dT; a central-form product would fail the differential of T². After q=1 both products are T dT.
- The coordinate injection from A[X] into A[X,Y] sends D_X(X)=1 to 1 and D_Y(X)=0. Merging two source coordinates into T would instead compare d(XY)↦2T dT with d(T²)=(1+q)T dT, so this is outside the termwise map contract.

### 8.4 Frobenius transport and the scaled model

For perfectly covered A, prime p and the finite-coordinate étale frame of §8.1, realize P=R̂_p[[h]] over D=Â_p[[h]] as the K=(p,h) frame of PrismaticCohomologyPartII §5.0. Verify its δ-base, p-regularity and quotient-completeness hypotheses. Transport its coordinate Frobenius φ□, with φ□|_A=ψ_p, φ□(T_i)=T_i^p and φ□(q)=q^p, and its chain map on C□^∧_p. Construct on H□^∧_p the semilinear DGA map with the same coefficient map and φ□(dT_i)=T_i^(p−1)dT_i. This scaled map is distinct from the supplied C□ map, which sends dT_i to [p]_qT_i^(p−1)dT_i. (Wagner v5 §4.9, p. 58, wagner lines 2882–2891; §4.28, p. 67, wagner lines 3292–3332; §4.31, p. 70, wagner lines 3452–3458.)

- The Kähler-term comparison intertwines these maps with the stated semilinear maps on completed forms, respects the skew product, and commutes with framing-compatible maps and coordinate injections.
- The scaled chain equation is φ□(hD_i f)T_i^(p−1)=hD_i(φ□f), since φ□(h)=h[p]_q; the coefficient and coordinate formulas determine it.
- The coefficient lift on R̂_p is injective: R/p is reduced, and R̂_p is p-torsion-free and separated. This does not make its smooth relative Frobenius linearization surjective.

*Construction and proof.* Perfect coverage gives p-torsion-freeness and reduced A/p; these pass to the étale polynomial frame. The series quotient descriptions of §8.1 and their mod-p analogues verify completeness of P/p, P/h and P/(hT_i). Continuous formal étale lifting and torsion-free Frobenius reconstruction give the supplied δ-frame. Transport the C□ map and use its divided-difference Frobenius identity to prove the scaled chain equation; γ_iφ□=φ□γ_i verifies the skew products. These arguments use no q-Witt torsion theorem.

*Needs:* Layers 8.1–8.3, 8.2a, 2.4; PrismaticCohomology §0.6; PrismaticCohomologyPartII §5.0; SchemeAndStackFoundations §§0.29, 4.1.

**Checks.**

- At p=2, φ□(h)=2h+h² and φ□(dT)=T dT on H□; both chain paths on T give (q²−1)T dT. On C□ the corresponding value on dT is (1+q)T dT, as forced by d_C(T²).
- For A=ℤ[U] toric and R=A[T], φ□(U dT)=U²T dT on H□, and (1+q)U²T dT on C□ at p=2. Fixing U would violate semilinearity.
- In rank zero the coefficient lift agrees with §6.1, but still sends q to q^p. For R=A[T], modulo p the linearization misses T; a smooth frame does not supply the étale equivalence of §6.1.
- In the square-zero quotient h²=0 at p=2, φ□(h)=2h; reducing further modulo two gives zero, while φ□(T)=T². Treating framed Frobenius as q-fixed would give h instead.

### Examples

For T² the Jackson derivative is (1+q)T; the scaled differential is (q²−1)T dT. At q=1 the two complexes have different differentials. The Checks give the values and their negative controls.

### Dependencies

AInfCohomology §AI.1.7; SchemeAndStackFoundations §4.1; Mathlib `PowerSeries`; Layer 8.1; Layer 8.2; Layer 8.2a; `gap:ordinary-derham`; Layer 8.3; Layer 2.4. PrismaticCohomology §0.6; PrismaticCohomologyPartII §5.0. Mathlib `KaehlerDifferential.D`; Tau Ceti `TauCeti.kaehlerBasisOfFormallyEtale`.

## Layer 9: Algebraic support for the smooth torsion induction

### 9.1 Framed Frobenius decomposition

Under 8.4 and for α≥0 put `B_alpha=(phi_frame^alpha(Rhat_p) tensor_{psi_p^alpha(Ahat_p)}Ahat_p)^hat_p`. Its map to R̂_p is injective and R̂_p is free over B_α with basis T^v, 0≤v_i<p^α. After adjoining h, the p-completed H□ decomposes as a finite direct sum by v, with degree-k basis T^v times the wedges of T_j^(−1)dT_j, interpreted as T_j^(p^α−1)dT_j when v_j=0. After reduction q^(p^α)−1, the v-summand is a tensor product of two-term factors with differential q^(v_i)−1 (zero for v_i=0). A perfectly covered; étale framing with finitely many coordinates; p prime; α≥0; inverse powers in the notation are replaced by the explicit nonnegative monomials. (wagner line 2892, §§4.10–4.12, lines 2892–2972; printed wagner v5 pp. 58–60).

- There are p^(αr) basis vectors and the expansion in them is unique.

- On the v_i factor, hD_i sends T_i^(v_i) to (q^(v_i)−1)T_i^(v_i−1)dT_i.

- The zero exponent in the one-form basis means T_i^(p^α−1)dT_i, not T_i⁻¹dT_i.

*Construction and proof.* Reduce the framed Frobenius square modulo p and use étale relative Frobenius to transport the polynomial monomial basis; complete flatness lifts it to R̂_p. Expand the exterior basis and calculate hD_i on monomials. Before the cyclotomic quotient the v=0 summand has coefficient differential on B_α; the two-term scalar description is asserted only after reduction.

*Needs:* Layer 8.4; SchemeAndStackFoundations §0.29; DerivedModuleAlgebra §1.7.

**Checks.**

- For r=1,p=2,α=1, the ring basis is 1,T; the one-form basis is T dT,dT, respectively.
- For r=0 there is exactly one summand, in degree zero; no minimum over an empty index set is taken.
- For α=0 there is one ring basis vector and the one-form basis is dT_i.

### 9.2 Two-term framed cohomology

Let S_α=ℤ_p[[h]]/(q^(p^α)−1), q=1+h. For 0≤e≤α, let `K_{alpha,e}` be S_α→S_α in degrees 0,1 with differential q^(p^e)−1. Its H⁰ is `[p^(alpha-e)]_{q^(p^e)}S_alpha ~= Z_p[[h]]/(q^(p^e)-1)`, and H¹ is that same quotient. If e₁≥e₂, the ordinary tensor complex `K_{alpha,e1} tensor_{S_alpha}K_{alpha,e2}` is `K_{alpha,e2} directSum K_{alpha,e2}[-1]`. Thus every summand of 9.1 has p-torsion-free cohomology, and so does H*(H□^∧_p/(q^(p^α)−1)). p prime; α≥0; 0≤e_i≤α; H□ has the hypotheses of 9.1; rank zero handled separately. (wagner line 2950, Lemmas 4.13–4.14 and Corollary 4.15, lines 2950–3012; printed wagner v5 pp. 59–60).

- For every prime p and 0≤e≤α, the annihilator of q^(p^e)−1 in S_α is the ideal generated by `[p^(alpha-e)]_{q^(p^e)}`. In particular, the annihilator of h in ℤ₂[[h]]/(h(h+2)) is (h+2), and its cokernel under multiplication by h is ℤ₂, as in the first Check (Wagner Lemmas 4.13–4.14 and Corollary 4.15, pp. 59–60, wagner lines 2973–3012).

- For v=p^e u, p∤u, `[u]_{q^(p^e)}` is a unit already in ℤ_p[[h]], hence also in S_α; the differential q^v−1 is unit-equivalent to q^(p^e)−1.

- The two-factor isomorphism uses the polynomial quotient (q^(p^e₁)−1)/(q^(p^e₂)−1); no division by zero in S_α is used.

*Construction and proof.* Compute kernel and cokernel by polynomial divisibility in the torsion-free power-series coefficient ring. Triangularly change the two degree-one basis vectors using the integral polynomial quotient to split the tensor. Repeated splitting and p-completely flat extension to B_α give the cohomology formula without imposing a perfect field base.

*Needs:* Layer 9.1; `gap:cyclotomic-contract`.

**Checks.**

- For p=2,α=1,e=0, S_α=ℤ₂[[h]]/(h(h+2)); H⁰=(h+2)S_α and H¹=S_α/(h) are both ℤ₂.
- For e=α the differential is zero, H⁰=H¹=S_α, including α=0.
- At p=2, α=0, S_0=ℤ₂[[h]]/(h). `Tor_1^{Z_2[[h]]}(S_0,S_0)=S_0`, whereas `S_0 tensor_{S_0} S_0=S_0` has no negative cohomology. Even degree-zero terms acquire an extra degree if derived tensor is taken over the ambient series ring.

### 9.3 Framed Bocksteins

For a perfectly covered Λ-ring A and étale framing with finitely many coordinates □ of R/A, put f_m=q^m−1 and E_m=H*(H□/f_m). Since f_m is injective in every term of H□, specialize the generic DGA Bockstein to β_m:E_m^i→E_m^(i+1), with β_m([x])=[d_H(x)/f_m]. It is independent of the cycle lift, squares to zero and is a degree-one derivation. For d|m the reduction F and multiplication `V=[m/d]_{q^d}` satisfy Fβ_mV=β_d. A perfectly covered; R has a specified étale framing with finitely many coordinates; m,d>0 and d divides m. (wagner line 3026, §4.16 and §4.23, lines 3026–3032 and 3178–3194; printed wagner v5 pp. 61, 64).

- If d_H(x)=f_m y, then β_m([x])=[y].

- Framing-compatible étale maps commute with β_m.

- At m=1, β_1(T_i)=dT_i, fixing the plus connecting-map sign.

*Construction and proof.* Perfect coverage makes R integer torsion-free; the first h-coefficient of f_m is m, so f_m acts injectively on R[[h]] and all finite free differential terms. Apply the generic Bockstein supplier to H□ and f_m. Its cycle-lift equation fixes the sign, and its change-of-parameter identity for f_d dividing f_m gives Fβ_mV=β_d. This specializes the generic theorem rather than constructing a second DGA Bockstein theory.

*Needs:* Layer 8.3; DGAInfinity Layer 1; EnhancedDerivedSheaves §0.3; gap:dga-bockstein.

**Checks.**

- For the one-variable frame, d_H(T)=h dT and β_1(T)=dT.
- For a zero-variable frame H□ is concentrated in degree zero and β_m=0.
- For A=ℤ,R=ℤ[T] with its one-variable frame and m=2, d_H(T²)=(q²−1)T dT, so β_2([T²])=[T dT]≠0. Specialization of H□/(q²−1) at q=1 has zero differential and sends this class to the nonzero form T dT. Using the quotient differential in place of the Bockstein would give zero.

### 9.4 Product homotopy for framed cochains

For a commutative ring A and an ordered finite-coordinate étale frame □ of R/A, put H□=K(R[[h]];hD_i), with its skew product from §§8.2a and 8.3, and e_i=dT_i. Construct a continuous A[[h]]-bilinear map H of total degree −1 such that for homogeneous α of degree k and β of degree ℓ, αβ−(−1)^(kℓ)βα=d_H H(α,β)+H(d_Hα,β)+(−1)^k H(α,d_Hβ). The same identity holds after quotienting by q^m−1 for every m>0; consequently every signed commutator of closed forms is a boundary. A any commutative ring; R has a specified ordered finite-coordinate étale frame; h=q−1; k,ℓ≥0; m>0 for the quotient identity; no perfect-coverage or torsion hypothesis. (wagner line 2858, §4.8, pp. 57, lines 2858–2872; Lemma 4.17, p. 61, lines 3033–3052 (cohomology conclusion); the product homotopy follows from the skew rules by the displayed telescoping proof).

- On ordered basis forms a e_I,b e_J, set H=∑_i H_i, where H_i=0 unless i∈I∩J, and H_i(a e_I,b e_J)=(−1)^|I| T_i `gamma_{J<i}(a)gamma_{I>i}(b)` e_I∧ι_i(e_J); here `gamma_U=prod_{j in U}gamma_j`, J<i={j∈J:j<i}, I>i={j∈I:j>i}, and ∧ and ι_i are the ordinary exterior-basis wedge and signed contraction, with all coefficients on the left.

- For every form ω, H(e_i,ω)=K_iω with K_i=−T_i(e_i∧ι_i), so e_iω−(−1)^|ω|ωe_i=d_HK_iω−K_i d_Hω.

- The A[[h]]-bilinearity makes H descend to H□/(q^m−1) for every positive m, and the product-homotopy identity descends without a torsion assumption or a choice of prime.

*Construction and proof.* For 0≤s≤r define `mu_s(a e_I,b e_J)=gamma_{J <= s}(a)gamma_{I>s}(b)e_I wedge e_J`, with ordinary exterior-basis wedge. The two equivalent twisted Leibniz formulas for hD_j show that every μ_s is a chain map. The displayed H_i satisfies μ_(i−1)−μ_i=d_H H_i+H_i(d_H⊗1+1⊗d_H), with the tensor differential carrying its cochain sign: in coordinate i use γ_i−id=T_i hD_i, and in each other coordinate use the twisted Leibniz rule and γ_jT_i=T_i for j≠i. Sum over i; μ_0 is the skew product and μ_r is its signed opposite. This proves the identity for all forms before any quotient, not just for degree-zero cocycles.

*Needs:* Layer 8.3; Layer 8.2a.

**Checks.**

- For A=ℤ,R=ℤ[X,Y],m=2 and ω=YdX+XdY, d_Hω=0 but (γ_X−id)ω=hXdY≠0 modulo h(h+2); H(dX,ω)=−XYdX and dX·ω+ω·dX=hX dX∧dY=d_H(−XYdX)≠0 as a cochain. Cancelling h would make vanishing imply X=2a₀ in ℤ[X,Y], which is impossible, so coefficientwise invariance cannot replace the boundary identity.
- For rank zero H=0 and both products agree; for rank one H(a dT,b dT)=−Tab dT, and the homotopy identity on (a dT,b) reads a(γ(b)−b)dT=Ta(hD b)dT, fixing the contraction sign.
- For A=ℤ,R=ℤ[X,Y,Z], α=dX∧dY and β=ZdX+XdZ are closed in H□; H(α,β)=XZ dX∧dY and αβ−βα=hX dX∧dY∧dZ=d_H(XZ dX∧dY), testing closed inputs of degrees two and one.

### 9.5 The framed cohomology system

For A perfectly covered and an étale framing with finitely many coordinates □, put E_m=H*(H□/(q^m−1)) with β_m from §9.3. Then E_m is ℤ-torsion-free, strictly alternating and graded commutative. Give it its canonical Q_m(R/A)→E_m⁰ map, `F_{m/d}` induced by quotient reduction and `V_{m/d}` induced by multiplication `[m/d]_{q^d}`. This is a differential q-FV system. Its canonical Q_mΩ*→E_m map is induced by initiality. A perfectly covered; R has a specified étale framing with finitely many coordinates; m>0; all quotients are degreewise ordinary since q^m−1 is regular on the terms. (wagner line 3022, §§4.16–4.26, lines 3022–3277; printed wagner v5 pp. 61–66).

- For polynomial R the degree-zero map is `c_{m/A}`; for framed R it is its arithmetic fracture extension using coordinate lifts on p-completions.

- At m=1 the Bockstein DGA is `Omega*_{R/A}`.

- FβV=β, FV=m/d and `VF=[m/d]_{q^d}`; the Teichmüller relation holds by torsion-freeness.

*Construction and proof.* Construct the degree-zero map by the finite arithmetic fracture square, using the polynomial comparison and the framed p-adic lifts on each completed factor. The DerivedModuleAlgebra, Part II contract gap:cohomology-completion supplies the cohomology/completion comparison. Reduce ℤ-torsion-freeness to 9.2 by finite-type and flat étale base change; graded commutativity follows from §9.4: the signed commutator of any two closed forms is d_H H(α,β), hence a boundary modulo q^m−1. Torsion-freeness forces odd squares to zero, including at 2, and proves the Teichmüller relation. All constructions remain dependent on the specified frame.

*Needs:* Layer 1.8; Layer 9.2; Layer 9.3; Layer 9.4; Layer 5.4; Layer 7.7; gap:cohomology-completion.

**Checks.**

- For m=1, β_1(T_i)=dT_i, although the differential of H□/h is zero.
- For A=ℤ,R=ℤ[T],m=2, T² is a degree-zero cocycle and dT·T²=q²T²dT=T²dT modulo q²−1. In contrast, dT·T=qT dT differs from T dT and T is not a cocycle. Commutativity on cohomology does not imply commutativity of H□.
- For zero variables E_m=R[[h]]/(q^m−1) in degree zero and β_m=0.

### 9.5a General-base prismatic specialization and iteration

Let A be perfectly covered, p any prime and □ a finite-coordinate étale frame of R/A. Put D=Â_p[[h]], I=([p]_q), φ|_Â_p=ψ_p, φ(q)=q^p, P=R̂_p[[h]], `S^(1)=(Rhat_p tensorL_{Ahat_p,psi_p}D/I)^hat_p`, and Δ=Δ_(S^(1)/D). Prove that (D,(h)) is the required q-PD pair, (D,I) is bounded, P is its framed lift, and S^(1) is discrete and p-completely smooth over D/I. Specialize the E₁, Frobenius-compatible framed q-PD and twisted prismatic comparisons to obtain Δ≃C□^∧_p. (Bhatt–Scholze v4 Theorems 16.18 and 16.22, pp. 113, 115, bhatt-scholze lines 4289 and 4378.)

For every α≥0 set J_α=Iφ(I)⋯φ^(α−1)(I)=([p^α]_q), with J_0=(1), and prove the equivalence `(Delta tensorL_{D,phi^alpha}D)^hat_(p,I) ~= Leta_{J_alpha}Delta`. It is induced by the α-fold coordinate Frobenius, with the same ordered one-form factors as §8.4. Prove compatibility with iteration and the completed scalar maps, rather than treating décalage as commuting with arbitrary base change. (Bhatt–Scholze v4 Theorem 15.3, p. 103, bhatt-scholze line 3898; Wagner v5 §4.31 and Lemma 4.32 with proof, p. 70, wagner lines 3441–3474.)

- For the objects Δ and Lη_(J_α)Δ above and j≥0, establish completed φ^j-base change of décalage with ideal φ^j(J_α). Verify complete flatness of φ on D: p,φ(h) is a regular sequence, and its derived reduction along D→D/(p,h) is (A/p)[h]/h^p with coefficient action ψ_p, flat over A/p. Use the smooth Hodge–Tate cohomology from PrismaticCohomology §1.20 to control the finite regular reductions; verify the completion and regularity conditions on the finite framed Koszul models before applying the flat-base-change and completion criteria of AInfCohomology §§AI.1.5–AI.1.6. Compose the one-step equivalence, transport its ideal by φ, and use the termwise identity η_fη_g=η_(fg) on the regular models to obtain the displayed formula. No q-Witt torsion assertion from §9.6 is an input.
- With f_α=q^(p^α)−1=h[p^α]_q, multiplication by h^k in degree k identifies η_(J_α)(C□^∧_p) with η_(f_α)(H□^∧_p). Reducing this identity modulo f_α and applying the principal Bockstein comparison gives a quasi-isomorphism `(Omega*_{R/A} tensor_{A,psi_{p^alpha}}A[q]/f_alpha)^hat_p -> (H*(Hframe^hat_p/f_alpha), beta_{f_alpha})`. Use the completed right scalar factor; the source follows from φ^α(h)=f_α and φ^α|_A=ψ_(p^α). This is a comparison of complexes; the functorial E∞ refinement is §9.7.
- The Bockstein in that reduction is the plus convention dx=f_αy ⇒ β[x]=[y]. The E₁ comparisons respect products and Frobenius and their frame-change maps have the supplier's cocycle compatibility; no unproved termwise map between arbitrary frames is used.

*Construction and proof.* Â_p is p-regular, so D is completely flat over ℤ_p[[h]], D/I is finite free of rank p−1 over Â_p and p-regular, and D/(h)=Â_p has the required finite Tor-amplitude. Section 8.4 verifies the complete δ-frame; the q-PD envelope of hP is P. Apply PrismaticCohomologyPartII §§5.13, 5.18–5.20 to this datum with its ψ_p-twisted reduction. Prove the stated completed base-change compatibility on the regular models and induct from §3.16, starting with the identity at α=0. For the reduction use the explicit η identity and AInfCohomology's Bockstein comparison, rather than interchanging décalage with the nonflat quotient D→D/f_α. In degree zero the comparison is the linearization of φ□^α, so it has exactly the right-factor ψ_(p^α) twist used in §9.6(c).

*Needs:* Layers 8.4, 9.2–9.3, 9.5; DerivedModuleAlgebra §§1.3, 1.7–1.9; AInfCohomology §§AI.1.1–AI.1.6; PrismaticCohomology §§0.77, 1.20; PrismaticCohomologyPartII §§3.16, 5.0, 5.2, 5.13–5.15, 5.18–5.20.

**Checks.**

- At α=0, J_0=(1), f_0=h, the décalage equivalence is identity and the reduced map is Ω*→(H*(H□/h),β_h), with β_h(T)=dT. At α=1,p=2, J_1=(h+2), f_1=h(h+2), and φ_C(dT)=(h+2)T dT.
- At p=2, δ(h)=h and the q-PD operation γ(h)=h−δ(h)=0; at p=3, δ(h)=h+h² and γ(h)=−h²∈(h). Also δ([2]_q)=−q≡1 modulo [2]_q. These values distinguish the q-PD ideal (h) from the prism ideal ([p]_q).
- At α=2,p=2, J_2=((q+1)(q²+1))=(1+q+q²+q³), and φ_C²(dT)=[4]_qT³dT. The source scalar map sends U to U⁴ on the toric base A=ℤ[U]; retaining only the first twist would give U².
- Take p=2, A=ℤ[U] toric and R=A[T,(T²−U)⁻¹]. Here D/I≅Â_2, and S^(1) is the p-completion of Â_2[T,(T²−U²)⁻¹]. Over k=𝔽₂(U), its reduction is k[Y,(Y²−U²)⁻¹]=k[Y,(Y−U)⁻¹]. The framed de Rham H⁰ is k[X,(X−U)⁻¹], X=T², identified by the relative Frobenius Y↦X. The untwisted algebra k[T,(T²−U)⁻¹] is not isomorphic to it: its units generate only k[T²,(T²−U)⁻¹], whereas the displayed Laurent algebra is generated by units. Thus an untwisted input cannot satisfy the multiplicative comparison.
- In rank zero with R=A=ℤ[U], S^(1)=D/I with its right D/I-action, and every iterated one-form term is zero. If p is invertible in A, D=P=0 and both sides are zero for every α; no prime is excluded.

### 9.6 The simultaneous prime-power induction

For a perfectly covered A and every prime p, establish simultaneously for all α≥0: (a) `Q_{p^alpha} Omega*_{R/A}` is degreewise p-torsion-free for smooth R/A; (b) for framed R the canonical map `(Q_{p^alpha} Omega*)^hat_p -> H*(Hframe^hat_p/(q^(p^alpha)-1))`, with Bockstein differential, is an isomorphism; (c) for framed R there is an explicit quasi-isomorphism `(Omega*_{R/A} tensor_{A,psi_{p^alpha}}A[q]/(q^(p^alpha)-1))^hat_p -> (Q_{p^alpha} Omega*)^hat_p` induced in degree zero by `s_{p^alpha/A}` of the coordinate Frobenius lift; (d) for polynomial R and dξ≡0 mod p at level p^α, ξ=F_p(ω)+pη for some ω at level p^(α+1) and η at level p^α, in the same form degree. A perfectly covered; p any prime including 2; α≥0; R smooth, framed or polynomial as specified separately in (a)–(d). Statement (c) is an equivalence of complexes, not a degreewise isomorphism. (wagner line 2703, §4.3, lines 2703–2720; Lemma 4.5, lines 2756–2808; §§4.29–4.33 and §4.4 proof, lines 3341–3608; printed wagner v5 pp. 54–56, 67–73).

- `Q_{p^alpha} Omega*/(im V_p+im dV_p) ~= Omega*_{R/A} tensor_{A,psi_{p^alpha}}A[zeta_{p^alpha}]` for α≥1.

- The induction proceeds (d at α−1)⇒(a at α)⇒(b at α)⇒(c at α)⇒(d at α).

- At α=0 use `Omega*_{R/A}`, the h-Bockstein identity and the polynomial Cartier cycle decomposition; the α=−1 premise is empty.

*Construction and proof.* Treat (a)–(d) as one simultaneous induction, not four circular prerequisites. For (a), use the first-ghost quotient and (d at α−1) to kill a putative p-torsion form; extend from polynomial to smooth by 7.7. For (b), compare the short exact sequences with kernel im V_p+im dV_p using 9.2 and the zero-index Frobenius summand. For (c), apply §9.5a with Δ=Δ_(S^(1)/D), its ψ_p-twisted input, and its iterated ψ_(p^α) scalar map; the Bockstein reduction there gives the framed cohomology comparison, which (b) identifies with q-Witt forms. Keep the completed right scalar factor throughout. For (d), decompose polynomial de Rham cycles modulo p into Cartier monomials and exact forms; Teichmüller identities and FdV=d lift both. The functorial comparison of §9.7 extends this framed milestone by PD presentations and étale descent.

*Needs:* Layer 9.5; Layer 9.5a; Layer 7.7; PrismaticCohomologyPartII §3.16; `gap:ordinary-derham`.

**Checks.**

- At α=0, Q_1Ω*=Ω*, and the framed cohomology comparison is β_h=d.
- For R=A[T], p=2, the cycle T dT modulo 2 lifts under F_2 to dτ_2(T).
- For A=ℤ, R=ℤ[T], m=p=2, dV_2(T) is not in `V_2(Omega^1_{R/Z})`: F_2dV_2(T)=dT, whereas F_2V_2(ω)=2ω and dT is not divisible by 2. Killing im V_2 alone therefore does not produce a differential quotient.

### 9.6a Completed δ-compatible PD-presentation adapter

For a perfectly covered Λ-ring A, smooth A-algebra R and any prime p, put B=Â_p and give B its ψ_p-induced δ-structure. For every surjection π:P↠R̂_p of B-algebras with P a p-completely ind-smooth δ-B-algebra, use the supplied PD envelope D(π) of ker π. Prove that its δ-structure extends that of P and that the augmentation gives a natural equivalence `(PDOmega*_{D(pi)/B})^hat_p -> (Omega*_{R/A})^hat_p` of E∞-B-algebras. Here PD forms are the supplied PD de Rham algebra, interpreted through its p-completed differential modules. Naturality includes every δ-B-algebra map of presentations over R̂_p. No finite-generation or Noetherian hypothesis is imposed on the presentation. (Wagner v5 §4.34, pp. 71–72, wagner lines 3492–3539; Bhatt–Scholze v4 Corollary 2.39, p. 25, bhatt-scholze lines 968–1001.)

- Extend the finite mod-p regular-sequence δ-envelope construction to these smooth-quotient presentations by regular models and filtered colimits before p-completion. Prove that D(π) is p-regular and that the resulting δ-extension is compatible with presentation maps and with the PD relations; a choice of generators does not enter the output.
- Lift the supplied crystalline PD Poincaré and embedding comparisons to the multiplicative enhancement, then derive p-completion. This gives the stated E∞ equivalence, rather than only an additive quasi-isomorphism.
- Construct the diagram of these equivalences coherently in the enhanced category. Completed tensor coproducts of presentations give a nonempty weakly contractible presentation category; its arrows become equivalences under the PD de Rham comparison. The functorial free δ-B-presentation on the set of p-typical Witt vectors of R̂_p gives comparisons natural in every A-algebra map between smooth algebras, with identity and composition coherences.

*Construction and proof.* Use PrismaticCohomology §§0.68–0.69 only on the p-regular finite regular-sequence models to which they apply. Prove passage to p-completely ind-smooth presentations with smooth quotient by étale-local regular models, filtered colimits and completion. Apply CrystallineCohomology §CR.2.2 to the PD polynomial models and to their common presentations, retaining its explicit contractions and multiplicative maps. EnhancedDerivedSheaves §E5:abstract and DerivedModuleAlgebra's completion transport this natural diagram to p-complete E∞ algebras. The completed tensor coproducts and the functorial Witt-vector presentation give the coherent choice comparisons. This stage uses no q-Witt torsion assertion.

*Needs:* Layer 2.4; Layer 1.5; PrismaticCohomology §§0.6, 0.68–0.69; CrystallineCohomology §CR.2.2; DerivedDeRhamCohomology §§PD.5–PD.6; DerivedModuleAlgebra §§0.2, 1.1, 1.3, 1.8–1.9; EnhancedDerivedSheaves §E5:abstract; `gap:ordinary-derham`.

**Checks.**

- For R=A and π=id_B the kernel is zero, D(π)=B and both de Rham algebras are B in degree zero; the comparison is identity. If p is invertible in A both are zero.
- For R=A=ℤ and P=ℤ_p[x]^∧_p with x↦0 and δ(x)=0, D(π)^∧_p is the completed PD polynomial algebra. Here d(x^[n+1])=x^[n]dx and the contraction sends x^[n]dx to x^[n+1], giving dh+hd=id−ev_0. At p=2, δ(x^[2])=3x^[4]. This value lies in the PD envelope and fixes the induced δ-operation; replacing it by zero violates the Frobenius equation.
- For two free δ-presentations with extra variables x and y mapping to zero, their completed tensor coproduct has both directions. The two augmentations send x,y,dx,dy to zero and send 1 to 1; both induce id on H⁰=B and zero on the contractible positive-degree directions. Ordinary polynomial forms over 𝔽₂ would instead retain the nonzero class x dx, since d(x²)=0; the PD relations are essential.

### 9.7 Functorial smooth de Rham comparison

For a perfectly covered arithmetic Λ-ring A, every smooth A-algebra R, every prime p and every positive integer m=p^αn with α≥0 and gcd(n,p)=1, construct a natural equivalence of p-complete E∞-A[q]-algebras `prod_{d|n}(Omega*_{R/A} tensorL_{A,psi_{(p^alpha)*d}}A[q]/Phi_d(q^(p^alpha)))^hat_p` ≃ `(Q_m Omega*_{R/A})^hat_p`. The tensor is derived and uses `psi_{(p^alpha)*d}` on the right A-factor; Ω* denotes the ordinary de Rham algebra viewed in the enhanced derived category. The equivalence is functorial for every A-algebra map between smooth A-algebras, without a framing choice. A perfectly covered; R smooth over A; p any prime, including 2; m>0; α=v_p(m); n=m/p^α; gcd(n,p)=1. No Noetherian, perfectness or global framing hypothesis is imposed on R. (wagner line 2692, Proposition 4.2, p. 54, lines 2692–2702; §§4.34–4.35 and proof of (bα)⇒(cα), pp. 71–73, lines 3491–3583; Lemma 4.36 and proof of Proposition 4.2, pp. 74–75, lines 3644–3697 (arXiv v5)).

- For n=1, the sole d=1 factor is `(Omega*_{R/A} tensorL_{A,psi_{p^alpha}}A[q]/(q^(p^alpha)-1))^hat_p`, and on an étale frame with finitely many coordinates its equivalence agrees with §9.6(c).

- Every A-algebra map R→S between smooth A-algebras gives a commuting square of equivalences in the ∞-category of p-complete E∞-A[q]-algebras, coherently with identities and composition.

- For every A-algebra R and m=p^αn with gcd(n,p)=1, put C_α=A[q]/(q^(p^α)−1). Then (Q_mΩ*)_(p) ≅ `prod_{d|n}(Q_{p^alpha} Omega* tensor_{C_alpha,sigma_d}A_(p)[q]/Phi_d(q^(p^alpha)))` as DG A_(p)[q]-algebras, where σ_d(a)=ψ_d(a) and σ_d(q)=q^d. For perfectly covered A these maps out of C_α are flat, so the ordinary tensors agree with derived tensors over C_α.

*Construction and proof.* For a prime power choose a surjection P→R̂_p with P p-completely ind-smooth over Â_p and carrying a compatible δ-structure. Apply §9.6a to its supplied PD envelope D(P→R̂_p), obtaining the δ-extension, completed PD de Rham algebra and multiplicative Poincaré equivalence to `(Omega*_{R/A})^hat_p`. The relative comparison of §4.6 induces a map from the PD de Rham complex after killing p-primary torsion on the q-Witt side. Section 9.6(a) allows descent to `Q_{p^alpha} Omega*`. Use §9.6a’s enhanced presentation diagram and functorial free δ-presentation for coherent naturality. On an étale frame this map is §9.6(c), so §7.7 and ordinary de Rham étale descent prove equivalence for arbitrary smooth R. For general m, construct the displayed p-local product by the differential q-FV universal property, as in §3.7; flat Adams twists and cyclotomic scalar maps identify ordinary and derived tensors over C_α=A[q]/(q^(p^α)−1). Apply the prime-power comparison to its factors and p-complete.

*Needs:* Layer 9.6; Layer 9.6a; Layer 7.7; Layer 3.7; Layer 4.6; `gap:ordinary-derham`; `gap:pd-presentation`; `gap:cyclotomic-contract`; EnhancedDerivedSheaves §E5:abstract; DerivedModuleAlgebra §0.2.

**Checks.**

- For m=1, α=0 and n=1, the equivalence is `(Omega*_{R/A})^hat_p ~= (Q_1 Omega*_{R/A})^hat_p` with q=1. For R=0 it is the zero algebra equivalence.
- For p=2,m=6, the factors d=1,3 use ψ_2 with Φ_1(q²)=q²−1 and ψ_6 with Φ_3(q²)=q⁴+q²+1. For A=R=ℤ[U] with toric structure, U⊗1 in the second factor equals 1⊗U⁶; using ψ_2 in both factors would give U² instead.
- For p=3,m=2, α=0 and n=2, the factors are Φ_1(q)=q−1 with ψ_1 and Φ_2(q)=q+1 with ψ_2. For A=R=ℤ their product is ℤ_3[q]/(q²−1) by Chinese remainders; at p=2 the two factors are not comaximal, so m=2 instead has the single prime-power factor q²−1. In the intermediate decomposition use derived tensor over C_α: for n=1,A=R=ℤ, replacing it by tensor over ℤ[q] with C_α produces the extra Tor₁=C_α, since q^(p^α)−1 is regular in ℤ[q].

### Examples

Local framed cohomology is used only as an algebraic tool. Filtered q-Hodge descent and geometric comparisons remain with consumers. The Checks give the values and their negative controls.

### Dependencies

Layer 8.4; SchemeAndStackFoundations §0.29; DerivedModuleAlgebra §1.7; Layer 9.1; `gap:cyclotomic-contract`; Layer 8.3; Layer 8.2a; DGAInfinity Layer 1; EnhancedDerivedSheaves §0.3; gap:dga-bockstein; Layer 1.8; Layer 9.2; Layer 9.3; Layer 9.4; Layer 5.4; Layer 7.7; gap:cohomology-completion; Layer 9.5; Layer 9.5a; PrismaticCohomologyPartII §3.16; `gap:ordinary-derham`; Layer 9.6; Layer 9.6a; Layer 3.7; Layer 4.6; `gap:pd-presentation`; CrystallineCohomology §CR.2.2; PrismaticCohomology §§0.6, 0.68–0.69; DerivedDeRhamCohomology §§PD.5–PD.6; EnhancedDerivedSheaves §E5:abstract; DerivedModuleAlgebra §0.2. PrismaticCohomology §§0.77, 1.20; PrismaticCohomologyPartII §§5.0, 5.2, 5.13–5.15, 5.18–5.20; AInfCohomology §§AI.1.1–AI.1.6; DerivedModuleAlgebra §§1.3, 1.8–1.9.

## Layer 10: Smooth q-Witt torsion and completion exports

### 10.1 Smooth integer torsion-freeness

If A is perfectly covered and R is smooth over A, `Q_m Omega*_{R/A}` is degreewise ℤ-torsion-free for every m>0. Consequently every positive-degree V_n is injective and the initial q-V system is also initial among degreewise ℤ-torsion-free q-V systems. A perfectly covered; R smooth over A; m>0; no Noetherian assumption on A. (wagner line 2690, Proposition 4.1, line 2690 and proof, lines 3613–3643; printed wagner v5 pp. 54, 73–74).

- F_nV_n=n and integer torsion-freeness imply V_n injective.

- The initial map into every torsion-free q-V system is still unique.

*Construction and proof.* Work étale locally on a smooth algebra, reduce polynomial bases to ℤ by flat Λ-base change, and use finite generation over the Noetherian Q-ring from 5.4. Detect p-torsion after localization at p, the (p,q^(m/ℓ)−1)-completions for ℓ≠p and their complementary localization. F_ℓ and V_ℓ remove prime-to-p factors on the completed pieces; the remaining localization is a flat base change of the p-power case 9.6. This covers every p and m.

*Needs:* Layer 9.6; Layer 7.7; Layer 5.4; `gap:cyclotomic-contract`.

**Checks.**

- For R=A, all positive degrees vanish.
- For m=1 it is torsion-freeness of the exterior powers of the smooth differential module over the torsion-free ring R.
- For R=ℤ[x]/(x²), Ω¹ has the nonzero 2-torsion class x dx; smoothness cannot be omitted even at m=1.

### 10.2 Bounded difference torsion and completion

For perfectly covered A, smooth R/A, m>0 and every degree i≥0, `Q_m Omega^i_{R/A}` has bounded (q−1)-power torsion. Its degreewise ordinary (q−1)-completion is canonically its derived completion. Both comparisons are natural and compatible with F,V,ghosts and Λ-base change in the appropriate completed sense. A perfectly covered; R smooth over A; m>0; the torsion bound is for a fixed degree and index, not a global uniform bound. (wagner line 2810, Lemma 4.6, lines 2810–2822; printed wagner v5 p. 56).

- The completed degree-i module is discrete and computes LΛ_(q−1) of that module.

- For the bounded smooth de Rham degrees of a fixed smooth R, degreewise completion represents derived completion of the complex.

*Construction and proof.* For ℤ-polynomial R use the surjection from the de Rham algebra and 5.4 to get finite generation in each degree, hence bounded torsion. Flat Λ-base change transfers the same bound to a polynomial ring over A. Étale base change and a finite affine cover of a smooth affine algebra transfer a common finite bound. The principal bounded-torsion completion contract identifies ordinary and derived completions.

*Needs:* Layer 10.1; Layer 5.4; Layer 7.7; DerivedModuleAlgebra §1.5.

**Checks.**

- For m=1, q−1=0 on Q_1Ω^i and its torsion has bound 1; completion is the identity.
- For R=A,m=2, (q−1)(q+1)=0 in A[q]/(q²−1); nonzero (q−1)-torsion is compatible with integer torsion-freeness.
- For A=R=ℤ, m=2 and degree zero, reduction modulo 2 is 𝔽₂[h]/(h²). Its h-power torsion has bound 2; h≠0 excludes bound 1. The mod-2 bound differs from the bound 1 before reduction.

### Examples

Every positive index and prime is covered. The auxiliary comparisons retain their frame, while the torsion conclusions do not. The Checks give the values and their negative controls.

### Dependencies

Layer 9.6; Layer 7.7; Layer 5.4; `gap:cyclotomic-contract`; Layer 10.1; DerivedModuleAlgebra §1.5.

## Downstream consumers

- **HabiroCohomologyFoundations**: Layers 2–6 supply relative arithmetic Λ and degree-zero q-Witt theory, especially the completed overlap in Layer 6; Layers 7–10 supply positive-degree operators, complete framed calculus, the functorial smooth de Rham comparison and smooth completion.
- **HabiroRings**: Layers 1–6: arithmetic Λ-perfection and perfect coverage, relative degree zero, ghosts, base change and q-fixed completed Frobenius overlap, including naturality and linearization coherence under a Λ-map of perfectly covered bases and a compatible map of their étale algebras (§§6.1–6.3). Habiro rings and cyclotomic gluing stay there.
- **RefinedTraceMethods**: Layers 7–10 provide the q-Witt operations and framed difference algebra needed for trace/cohomology comparisons; no trace invariant is constructed here.
- **HabiroCohomologyFoundationsPartII**: Imports the same named algebraic interfaces for its extended cohomology constructions; no reverse dependency.

Consumers use the exported algebraic interfaces. Their constructions supply no prerequisites to QWittVectors.

## References

- **pridham**: J. P. Pridham, *On q-de Rham cohomology via Λ-rings* (2016), [arXiv v4](https://arxiv.org/abs/1608.07142v4). Definition 1.22 (p. 9, pridham line 371); Definition 2.1 (p. 12, pridham line 506); Lemma 2.9 (p. 15, pridham line 635), arXiv v4.
- **wagner**: Ferdinand Wagner, *q-Witt vectors and q-Hodge complexes* (2024), [arXiv v5](https://arxiv.org/abs/2410.23078v5). Sections 2.1–2.6 and 3.1–3.4; Propositions 4.1–4.2; Lemma 4.6; Sections 4.7–4.36; Theorem 4.27 and its simultaneous induction proof (v5 lines 305, 475, 1194, 1504, 1621, 1651, 1822, 1956, 2053, 2552, 2690, 2810, 2830, 2950, 3022, 3198, 3292, 3341, 3459, 3584, 3613); Proposition 4.2 (p. 54, wagner lines 2692–2702); §§4.34–4.35 (pp. 71–73, wagner lines 3491–3583); Lemma 4.36 and proof of Proposition 4.2 (pp. 74–75, wagner lines 3644–3697); Lemma 4.25 (pp. 64–65, wagner lines 3198–3227); Proposition 3.12 and Definition 3.13 (pp. 40–41, wagner lines 1956–2010); Lemma 3.32 (p. 51, wagner lines 2561–2572); Lemma 4.17 (p. 61, wagner lines 3033–3052); Lemma 2.30 (pp. 24–25, wagner lines 1214–1282).
- **scholze**: Peter Scholze, *Canonical q-deformations in arithmetic geometry* (2016), [arXiv v1](https://arxiv.org/abs/1606.01796v1). Section 3, v1 pp. 6–7, lines 296–340 (framed construction; Conjecture 3.1 remains distinguished).
- **bhatt-scholze**: Bhargav Bhatt, Peter Scholze, *Prisms and Prismatic Cohomology* (2019), [arXiv v4](https://arxiv.org/abs/1905.08229v4). Lemma 2.11 (v4 p. 15, bhatt-scholze line 594); Remark 2.27 (v4 p. 20, bhatt-scholze line 775); Lemma 2.28 (v4 p. 20, bhatt-scholze line 778); Corollary 2.39 (v4 p. 25, bhatt-scholze lines 968–1001); Theorem 15.3 (p. 103, bhatt-scholze line 3898); Theorem 16.18 (p. 113, bhatt-scholze line 4289); Constructions 16.19–16.20 and Theorem 16.22 (v4 pp. 114–115, bhatt-scholze lines 4316 and 4378).
- **wagner-habiro**: Ferdinand Wagner, *q-Hodge complexes over the Habiro ring* (2025), [arXiv v2](https://arxiv.org/abs/2510.04782v2). Section 1.22(e), v2 p. 12, line 493; Section 2.7, pp. 15–16, lines 647–658; proof of Theorem 2.9, pp. 16–17, lines 679–723, with standing etale hypothesis from Section 2.2.
- **hesselholt**: Lars Hesselholt, *The big de Rham-Witt complex* (2010), [arXiv v3](https://arxiv.org/abs/1006.3125v3). Section 1: Lemma 1.1 (line 223); Proposition 1.2; Lemmas 1.3–1.5 and 1.9; Proposition 1.14, Addendum 1.16 and Example 1.17 (pp. 14–15, hesselholt lines 589, 644, 652); Proposition 1.19; Definitions 1.21 and 1.23; Lemma 1.24; Theorem 1.25 (v3 lines 268, 301, 315, 354, 711, 753, 787, 798, 811); printed v3 pp. 6–11, 14–15, 17–19.
- **borger**: James Borger, *The basic geometry of Witt vectors, I: The affine case* (2008), [arXiv v6](https://arxiv.org/abs/0801.1691v6). Sections 1.16–1.18 (v6 pp. 12–13, lines 603–638); Corollary 5.4 (p. 26, line 1323); Theorem 9.2 (p. 39, borger line 1995); Corollary 9.4 (p. 40, borger line 2095).
- **langer-zink**: Andreas Langer, Thomas Zink, *De Rham-Witt cohomology for a proper and smooth morphism* (2003), [July 2003 author-hosted preprint; Proposition 1.3, lines 453–525; Lemma 1.5, lines 601–645 numbering checked](https://www.math.uni-bielefeld.de/~zink/dRW.pdf). Proposition 1.3 (July 2003 pp. 14–16, langer-zink lines 453–525) and Lemma 1.5 (pp. 19–20, langer-zink lines 601–645).

Printed pages refer to the stated versions linked above. Source-line pointers supplement the theorem, section and printed-page locators.
