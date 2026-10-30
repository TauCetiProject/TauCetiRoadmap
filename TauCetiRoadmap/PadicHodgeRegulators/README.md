# Roadmap: p-adic regulators and the local K₃ calculation

**Summary.** Build normalized regulators from algebraic K-theory and local Iwasawa cohomology to de Rham periods, with integral and analytic control. The local summit is the isomorphism from completed K₃ of a finite unramified étale ℚₚ-algebra to p² times its integers when p > 3. Other summits compare curve regulators with Bloch–Kato logarithms and give Coleman/Perrin–Riou images, elementary divisors and character specializations.

## Scope and ownership

This roadmap owns the normalization and comparison of regulators, the finite-residue dilogarithm argument for the local K₃ theorem, the explicit curve regulator interfaces, and the linear algebra of Coleman images. In particular it is the single owner of the weight-two comparison of de Jeu's classes with Suslin's Bloch group (§4.7), together with the two complex regulator evaluations it rests on, that of de Jeu's classes and the Suslin–Bloch–Wigner evaluation on Suslin's Bloch classes with its scalar κ₂, the completed root classes, the normalized local K₃ regulator with its naturality and transfer, its lattice isomorphism, root generation and finite root presentations (§§5.6–5.9); HabiroNumberFields §§3.0a–3.0b and HabiroNahmSeries §6.3 consume these rather than construct them, and Polylogarithms §2.3 consumes the Suslin–Bloch–Wigner evaluation and the computation of κ₂; the conversion to its Borel and Tate coordinates and its analytic Bloch–Wigner cocycle (Polylogarithms §2.2) are Polylogarithms' own. KTheoryFiniteLocalFields §§1.8,3.0a,6.6–6.7 supply algebraic K-groups, motivic cycle complexes and finite/continuous étale comparisons. K3BlochGroups Layer 3 (§§3.1,3.3–3.6) is the single owner of the integral pre-Bloch group, the antisymmetric-square boundary, the Bloch kernel and their field maps; its §§4.20,6.3–6.6 supply the Suslin exact sequence, integral root multiples, coefficient-localized root classes and finite Bloch quotients. ColemanIntegration §L2.Fb supplies only the p-adic evaluation of these carriers and its branch descent, transported through K3BlochGroups §§3.4–3.5's symbol-preserving equivalence and boundary square. KTheoryFiniteLocalFields §§3.5,6.2,6.8–6.10 supply the Milnor divisibility and completion inputs. Generic classical syntomic, relative open-curve and semistable comparison carriers are required inputs from **CohomologyComparisonsPartII**; their regulator-specific identifications are stated here. ColemanIntegration owns Coleman integration; **ColemanIntegrationPartII** supplies the required Vologodsky integration and double/triple indices. This roadmap identifies their values on regulator classes.

Submodule inverse images and preservation of dimension by linear equivalences use Mathlib `Submodule.comap` and `LinearEquiv.finrank_eq`; they are not separate transport constructions here. Reconstruction through a coordinate equivalence uses `LinearEquiv.symm_apply_apply`. The ordinary-to-indecomposable quotient and completed-to-inverse-limit identifications use KTheoryFiniteLocalFields §§3.5,6.2,6.8–6.10 together with K3BlochGroups §6.6. The regulator lattice theorem and its root-value normalization are the additional arithmetic assertions of Layer 5.

PadicPeriodRings §§1.5,4.1–4.3 own the period rings, invariant functors and underlying fundamental sequence. FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 supply finite-K comparison contracts, continuous sections and additional sequences. SelmerIwasawaCohomology §4.9 owns the finite Bloch–Kato condition on representations, lattices and discrete quotients, with its local duality. NoncommutativeAndEquivariantIwasawa §F.6 owns the normalized finite Bloch–Kato complex, its cohomology comparison, period boundaries, dual exponential, adjunction and functoriality; PhiGammaModulesAndIwasawaCohomology §5.7 reexports its exponential. These generic constructions are consumed here. The additional condition g, logarithm specializations and regulator-specific comparisons are the outputs here. SelmerIwasawaCohomology §4.26’s elliptic Kummer comparison is also consumed. The extension to abelian varieties is stated for the functorial logarithm, without identifying a chosen differential with a minimal differential through an unproved scalar.

PhiGammaModulesAndIwasawaCohomology §5 supplies Fontaine's integral Iwasawa comparison and its coefficient, character and generator compatibilities. Its §§5.7 and 6 supply the local exponential, H¹_e, ψ-fixed Wach containment and good Wach bases with integral congruence. The present roadmap adds regulator normalization, image formulas and particular Coleman coordinates. These exponentials, §5.6a's differential module and NoncommutativeAndEquivariantIwasawa §F.6's maps are stated only for Galois representations. This roadmap therefore owns, in §9.30a, the differential module N_rig(D) of an arbitrary de Rham (φ,Γ)-module over the Robba ring, together with its Bloch–Kato exponential and dual exponential, their étale comparison and their differential interpolation. These are built from PadicHodgeTheory §§4.2, 4.5 and 5.2 (localization, B-pairs and Berger's modification) and from PhiGammaModulesAndIwasawaCohomology §§3.1–3.2, 3.4a and 5.3 (Herr complexes, the Herr–Galois comparison and the cyclotomic deformation). LocalGaloisGroups Layer 7 owns the completed multiplicative carrier, its Galois action and torsion/free quotient. LocalFieldsRamification owns the unit filtration and the deep-unit logarithm; the full local unit-log kernel and semilocal norm–trace of §§3.5(a),3.6 extend that interface. IntegralIwasawaTheory §§2.2 and 4.1 own the global unit localization, `leopoldtDefect`, `LeopoldtConjecture`, `leopoldtLogMap`, the all-embeddings logarithm matrix and its full-rank criterion; §3.5(b) consumes them and adds only the rank abbreviation rr_p in the row convention.

AbelianSchemesAndArithmeticModuli §A4.3 owns degree-one de Rham cohomology and its Hodge sequence; NeronModelsAndSemistableAbelianVarieties §5.3 owns the filtered homological period comparison. Section 1.9 adds the Bloch–Kato logarithm identification on the abelian Kummer image.

The Tau Ceti local-field library supplies Teichmüller lifting and the residue-field equivalence for tame roots of unity. Mathlib supplies finite fields, polynomials, finite-dimensional linear algebra, submodules and matrix determinants. EffectiveBounds owns real regulators and unit-lattice bounds. ArithmeticKTheory §§3.2–3.4 supply global K₃ finite generation and ranks. Global signed Selmer structures and main conjectures are outside this roadmap’s scope; its output is the specified Coleman kernel. HabiroNahmSeries consumes the local K₃ output, and GrossZagierAndArithmeticHeights consumes the good-reduction Kummer logarithm of §1.9. Global injectivity in positive K₃ rank remains conjectural.

## Conventions

A local field K is a finite extension of ℚₚ, K₀ its maximal unramified subfield, N = [K:ℚₚ], and σ is arithmetic Frobenius on K₀. A finite étale algebra is a finite product of such fields; the empty product is the zero ring when that category allows it. A formulation requiring a nontrivial algebra treats the empty case separately. Products of cohomology groups and regulators use the same indexing set.

Choose compatible p-power roots ε and write vᵣ = ε^⊗r for the representation basis, t = log[ε] for the period, and dᵣ = t⁻ʳ ⊗ vᵣ for the invariant de Rham basis. Thus φ(dᵣ) = p⁻ʳdᵣ, Fil⁻ʳ is the whole Tate period line, and Fil⁻ʳ⁺¹ is zero. A formula below writing e_r for an invariant de Rham Tate vector means dᵣ; a twist formula writing e_j for a representation vector means vⱼ. Our Hodge–Tate weight of ℚₚ(1) is +1. A source using weight −1 has its numerical weights negated before applying a formula; the actual filtration is unchanged. The finite local condition supplier uses that other weight convention.

The exponential is the boundary for a cochain differential with boundary g ↦ (g−1)b. We use the supplier's crystalline exact-sequence arrow x ↦ ((1−φ)x, x mod Fil⁰); replacing it by φ−1 changes one coordinate and must change the boundary comparison too. For local class field theory use geometric reciprocity, the inverse of the arithmetic reciprocity of KTheoryFiniteLocalFields §3.2: a uniformizer maps to geometric Frobenius; for K=ℚₚ a unit u acts on p-power roots by ζ ↦ ζᵘ, and for general K by the norm N_(K/ℚₚ)(u). Choose the invariant H²(K,ℚₚ(1))→ℚₚ so that the ordered pairing satisfies ⟨κ(u),ψ⟩=ψ(rec_K(u)). The arithmetic convention requires the corresponding sign conversion in this identity. Cup products are ordered as written. Interchanging two degree-one entries changes the sign; evaluating a degree-zero dual pairing does not.

The Iwasawa logarithm has logₚ(p)=0. Coleman dilogarithms use Dₚ(z)=Li₂(z)+½logₚ(z)logₚ(1−z), and Bernoulli polynomials use B₁=−½. Regulators on K_(2n−1) are normalized by the Chern character, as are the supplied regulator of ColemanIntegration §L3.Fb.2 and the symbol maps of §§7.3–7.11: they are ring homomorphisms, and in weight one they are the logarithm and the Kummer map. The ordinary Chern classes cₙ induced by the same universal classes are kept as separate maps. On K_m with m≥1 the decomposable terms of Newton's identity vanish, so cₙ=(−1)ⁿ⁻¹(n−1)!·chₙ there: c₁=ch₁, c₂=−ch₂ and c₃=2ch₃. Integral étale statements use the ordinary Chern classes. The local K₃ regulator is normalized once by the universal Suslin–de Jeu constant c₂ of §4.7, so that the tame root class [ζ] maps to Li₂(ζ); no sign or scalar is chosen again at each prime or on each symbol. Complex regulator values are those of the Beilinson regulator reg_∞ of ColemanIntegration §L3.Fc.1 in the point coordinate of BorelRegulators §6.0a; the Borel regulator is r_Bo = −2·reg_∞ (BorelRegulators §6.2), so over ℚ(i) the de Jeu class of [i]_2 has reg_∞ value P₂(i) and Borel value −2P₂(i). Gros depletion in weight n is 1−σ/pⁿ, applied to the syntomic coordinate.

Cyclotomic layers assume p odd, E/ℚₚ finite with integers 𝒪_E, G∞=Δ×Γ₁, Λ_E=𝒪_E[[G∞]][1/p], and analytic distribution algebra ℋ_E(G∞). At a fixed Δ-character we use X=γ−1 and xᵢ=χ(γ)ⁱ−1. Twisting an algebra element by η means g ↦ η(g)⁻¹g; sources using η(g)g require the inverse character. All Coleman vectors are rows. The right action cM, the coefficient embedding Λ_E→ℋ_E and the order of all basis changes are part of the notation.

## Exact supplier contracts

### From Mathlib

Use `Polynomial`, `Polynomial.eval`, `Polynomial.aeval`, `ZMod`, `GaloisField`, `GaloisField.finrank` and `GaloisField.card`. The last two require a nonzero extension degree; a degree-zero finite field is never used as a residue field. Use `Submodule.comap` from `Mathlib/Algebra/Module/Submodule/Map.lean` and `LinearEquiv.finrank_eq` from `Mathlib/LinearAlgebra/Dimension/Finrank.lean` for row-map inverse images and their dimension under invertible transport. Use native `Submodule`, `LinearMap`, `LinearEquiv`, `Module.Basis`, `Matrix.det`, `Matrix.det_mul` and `Matrix.det_fin_two`. Evaluation constraints are submodules obtained through algebra homomorphisms, rather than a new notion of module. Generic coordinate reconstruction uses `LinearEquiv.symm_apply_apply` in `Mathlib/Algebra/Module/Equiv/Defs.lean`; the arithmetic identification of the Wach equivalence and 1−φ belongs to §9.16. Finite-field polynomials are polynomial identities first and functions only after evaluation; equality as functions does not imply equality of polynomials without a degree bound.

### From Tau Ceti

Use `TauCeti.teichmuller 𝒪[K]`, `TauCeti.unitsMap_residue_teichmuller` and `TauCeti.rootsOfUnityAlgebraMulEquivUnitsResidueField 𝒪[K] K` from `TauCeti/RingTheory/Henselian/Teichmuller.lean`. `TauCeti.unitFiltrationZeroEquivProd` in `TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean` supplies the entire tame/principal-unit decomposition. LocalFieldsRamification Layers 1–2 supplies principal units, convergence, the deep-unit exponential/logarithm equivalence. LocalGaloisGroups Layer 7 supplies the inverse-limit multiplicative carrier. ProfiniteArithmetic §§0.2,1.1–1.3 supplies compatible finite quotients and completion infrastructure, without a regulator identification.

### From TauCetiRoadmap.PadicPeriodRings and the local cohomology suppliers

From PadicPeriodRings §§1.5,4.1–4.3 consume B_cris, B_dR, B_e, D_cris, D_dR and the underlying fundamental exact sequence. From FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 consume the finite-K comparison contracts, continuous nonequivariant sections and additional period sequences; continuous cohomology comes from ArithmeticGaloisDuality §R02.1.2. From NoncommutativeAndEquivariantIwasawa §F.6 consume the normalized finite complex, its H⁰ and H¹_f comparisons, the exponential kernel sequence, dual exponential, ordered adjunction, coefficient change and restriction/corestriction functoriality. Its crystalline exact fragment is

```text
0 → H⁰(K,V) → D_cris(V)
  → D_cris(V) ⊕ D_dR(V)/Fil⁰ → H¹_f(K,V) → 0,
x ↦ ((1−φ)x, x mod Fil⁰).
```

SelmerIwasawaCohomology §4.7 supplies the small-weight crystalline realization; §4.9 supplies `blochKatoCondition`, `blochKatoCondition_T`, `blochKatoStructure` and propagation to discrete quotients. SelmerIwasawaCohomology §4.26 supplies the elliptic tangent/exponential/Kummer comparison used by §1.9. AbelianSchemesAndArithmeticModuli §A4.3 supplies H¹_dR(A/K), its Hodge sequence and duality; NeronModelsAndSemistableAbelianVarieties §5.3 supplies the natural filtered comparison D_dR(VₚA)≃H¹_dR(A/K)* and crystallinity for good reduction. Its homological dual Hodge sequence identifies the tangent quotient with Lie(A/K); §1.9 compares the Kummer and logarithm maps on that same quotient. Local Tate duality includes the invariant H²(K,ℚₚ(1))→ℚₚ, compatibility with restriction/corestriction and the ordered degree-one pairing. The finite-condition duality and exponential adjunction are imports from NoncommutativeAndEquivariantIwasawa §F.6; the e/g comparison and regulator normalization use these supplied maps. The integral Tate rank and torsion calculations also require KTheoryFiniteLocalFields Layer 6. A torsion class maps to zero on rationalization; the map from integral H¹ to rational H¹ is not called an inclusion in general.

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology and the distribution suppliers

From PhiGammaModulesAndIwasawaCohomology §§5–6, consume the integral D(T)^ψ=1 ≃ H¹_Iw(T), its normalization, Herr cocycles, exact twist and coefficient squares, the Wach lattice and a good basis. ColemanPowerSeries Layers 1–2 supplies norm-compatible units, their Coleman series, the norm operator and the logarithmic derivative. PadicMeasuresIwasawaAlgebras §§1.7,2.1–2.6,3.1–3.3,4.3–4.5 supplies Λ, finite-character idempotents, bounded Amice transforms and Weierstrass preparation. LocallyAnalyticDistributions §§1.1,1.4–1.5 supplies unbounded Amice, convolution, ∂ and its ψ-zero inverse; §§2.1,2.3 supplies order-r growth and locally algebraic determination. Its §3.3 supplies the unbounded Mellin Fréchet isomorphism with ℋ, bounded-measure criterion, character evaluation, convolution, generator change, weight differentiation, twists, pushforward and finite coefficient extension. Logarithmic factors below use these exact conventions.

For §9.30a, consume the following from PhiGammaModulesAndIwasawaCohomology: from §§3.1–3.2, the signed Herr complexes C_(φ,γ) and C_(ψ,γ), with `d0(x) = ((phi-1)x, (gamma-1)x)`, and the φ/ψ comparison (id,(−ψ,id),−ψ); from §3.4a, the field Herr–Galois comparison, Euler characteristic and duality; from §5.3, the cyclotomic deformation and its specialization at η, which lands in M(η⁻¹). From PadicHodgeTheory §4.2, consume the localization maps ι_n on the Robba ring and their coefficientwise extension to finite free modules. From §4.5, consume the B-pair equivalence for arbitrary coefficient-valued Robba (φ,Γ)-modules, with W⁺_dR and D⁺_dR=Fil⁰D_dR, and `herrBPairDerived` with its étale specialization. From §5.2, consume Berger's modification and its equivalence between filtered (φ,N,G_K)-modules with finite descent and the Robba (φ,Γ)-modules whose connection is locally trivial, which are the de Rham ones.

### From TauCetiRoadmap.KTheoryFiniteLocalFields and the K-theory suppliers

From KTheoryFiniteLocalFields §§1.8,6.6–6.7 consume the universal finite-coefficient Chern maps `earlyChern i j`, completed étale edge maps, weight-two Chern comparison and transfer. From K3BlochGroups §§3.1,3.3–3.6 consume the integral pre-Bloch group P(F) with its five-term relations, the antisymmetric square, the boundary ∂[x]=x⊗(1−x), the Bloch kernel B(F), the inversion symbols ⟨x⟩=[x]+[x⁻¹] of P(F) and their field maps; from its §§4.20,6.3–6.6 consume the natural Suslin sequence with enhanced Tor kernel and its rational isomorphism suslin_rational, integral root multiples, denominator-independent coefficient-localized root classes and the finite-quotient snake sequence. ColemanIntegration §L2.Fb supplies the p-adic evaluation dilogEvaluation and its branch independence on Bloch kernels; it is applied to the K3BlochGroups carriers through the symbol-preserving equivalence and boundary square of K3BlochGroups §§3.4–3.5. KTheoryFiniteLocalFields §6.10 supplies unique divisibility of local Milnor K₃, so its image has zero quotient modulo p^ν. Its §§3.5,6.2,6.8–6.9 supply TₚK₂(L)=0 and the natural identification K₃(L;ℤₚ)≃lim_ν K₃(L)/p^ν, including restriction, transfer and finite-product compatibility. The compatible inverse limit, not an uncompleted rational map, defines the integral regulator. From PadicHodgeTheory §§6.1–6.2 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3 consume the integral period comparison; the precise finite small-weight range is always displayed below.

From SchemeKTheoryOperations, consume the following, retaining its regular ample-family scope:
- proper and finite flat K-theory transfers (§2.3) and the projection formula f_*(x·f^*y)=f_*x·y (§2.4);
- the projective bundle decomposition (§5.5);
- Adams operations, with products of n units of weight n and ψ^k[L]=[L^⊗k] (§6.4), their compatibility with products (§6.8), and the rational weight decomposition of K_m(X)⊗ℚ (§6.9);
- the commutation of finite étale transfers with ψ^k (§6.11);
- Adams–Riemann–Roch ψ^k(f_*x)=f_*(θ^k(−T_f^∨)ψ^k x) for projective morphisms of smooth quasi-projective schemes over a regular base (§7.5).

Sections 7.3 and 7.6 use these for the domain of the curve regulator and its transfers. The smooth projective curves over 𝒪_K of Layer 7 lie in that scope.

From ArithmeticKTheory §§3.2–3.4 consume finite generation of K₃(𝒪_F), the actual rational localization K₃(𝒪_F)⊗ℚ≃K₃(F)⊗ℚ and Borel’s formula dim_ℚ(K₃(F)⊗ℚ)=r₂(F). Its §2.1 and KTheoryFiniteLocalFields §1.5 give localization and K₂(𝔽_q)=0: K₃(𝒪_F)→K₃(F) is surjective, so K₃(F) is finitely generated. These inputs apply throughout Layer 6 without assuming p-adic regulator injectivity.

From BorelRegulators §§2.1–2.3 consume the Borel class, the Borel regulator r_Bo on K₃(F) through the Hurewicz map, its real isomorphism and rational injectivity for number fields, and its restriction square; from §6.0a the identification of ColemanIntegration §L3.Fc.1's complex Beilinson regulator reg_∞ with the shared regulator r_Be in its point coordinate; from §6.2 the conversion r_Bo = −2r_Be. Section 4.7 evaluates every class with reg_∞, so the injectivity it uses is that of r_Be = −½r_Bo, and a Borel value is −2 times the stated value. PolylogarithmFunctions §§5.1–5.2,5.7–5.8 supply the Bloch–Wigner function D_BW, the identity L₂ = D_BW, its continuity on ℙ¹(ℂ), its five-term relation and its cross-ratio form.

### From TauCetiRoadmap.IntegralIwasawaTheory

From IntegralIwasawaTheory §2.2 consume the localization ι_F : O_F^× ⊗ ℤ_p → `∏_{v|p} U¹(F_v)`, with p-power torsion retained, `leopoldtDefect` F p = rank ker ι_F and `LeopoldtConjecture` F p with its equivalence to injectivity of ι_F; from §4.1 consume `leopoldtLogMap`, `leopoldtDefect_eq_logKernel`, the [F:ℚ]-by-r logarithm matrix over ℂ_p on a unit basis and `leopoldt_iff_logMatrix_fullRank`; from §4.4 consume `abelianLeopoldt`. Section 3.5(b) uses the transpose of that matrix and defines no second localization, logarithm map or Leopoldt predicate.

### From TauCetiRoadmap.ColemanIntegration

From ColemanIntegration §L3.Fa.1 consume rational localization, `KTheoryQ.localization`, `noLowWeightKTheory_of_algebraic_over_Fp` and `KTheoryQ.dvr_localization_iso` on their stated domains. Its §§L3.Fa.4,L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.14–L3.15 supply the oriented de Jeu map, the syntomic Chern-character regulator, special-unit and cyclotomic formulas and Gros depletion. Retain the fixed raw-symbol coefficient (−1)ⁿ(n−1)! and the distinction between reduced and unreduced hypotheses. That coefficient belongs to the Chern-character regulator, which is reg_syn of §4.1; for the ordinary Chern-class regulator of §4.1 the same raw symbol has coefficient −((n−1)!)². Sections 4.1–4.5 identify these imported maps with the étale/Bloch–Kato normalization; they do not construct those formulas again. Its §L3.Fc.1 supplies the complex Beilinson regulator reg_∞, and §L3.Fc.3 the function P_n = zagierPolylog n (P₂ = i·D_BW) with the cyclotomic value Φ_∞([ζ]_n) = (−1)ⁿ(n−1)!·P_n(φ_∞ζ); at n = 2 this fixes the normalization of the de Jeu evaluation in §4.7. No supplier compares de Jeu's map with Suslin's Bloch group or evaluates the regulator on Suslin's Bloch classes; both are §4.7.

### From TauCetiRoadmap.CohomologyComparisonsPartII

**Required classical and relative inputs.** CohomologyComparisonsPartII supplies the following sections on the base, coefficient and geometric domains stated there. Section citations identify the mathematical contracts; no additional declaration names are presumed.

| Supplier sections | Content and consumers |
|---|---|
| CohomologyComparisonsPartII §§2.1–2.3 | Compactification-filtered rigid syntomic fibre, its specialization diagram and long exact sequence for nonnegative weights. Used by Layers 4–5 and §§7.1–7.6. |
| CohomologyComparisonsPartII §§3.1–3.4 | Divided and undivided log-syntomic fibres, directed ω/τ, products and derived completion on their log-syntomic domain; rational quotient presentation on its log-smooth arithmetic pairs. |
| CohomologyComparisonsPartII §§4.1–4.4 | Modified Tate lattices, directed Fontaine–Messing maps, exact divided small-weight comparison and bounded undivided comparison, retaining each section's geometric and weight hypotheses. |
| CohomologyComparisonsPartII §§5.1–5.3 | Hyodo–Kato adapter, semistable total fibre, monodromy convention and compatibility with the base h-realization; used by §§4.6,7.7,7.10–7.11. |
| CohomologyComparisonsPartII §§1.1–1.6,6.1–6.7,7.1–7.5 | Filtered F-isocrystal category, Yoneda extensions, filtered realization, relative residue/Gysin sequence, extension coordinates and Frobenius-compatible specialization. Retain algebraic finiteness, actual filtered realization, compactification and evaluation hypotheses; Milnor-symbol and tame-kernel comparisons belong to §§7.8–7.9 here. |

What CohomologyComparisonsPartII must provide (gap:dagger-syntomic-filtration): for smooth affine schemes over a complete mixed-characteristic DVR with perfect residue field, the Huber–Kings dagger-tube-filtered syntomic complex for every integer weight, its Chern-compatible map from compactification-filtered rigid syntomic cohomology, and the normalized equivalence at a point and on smooth proper models via derived analytic descent; no general affine equivalence is asserted.

What CohomologyComparisonsPartII must provide (gap:rigid-negative-weights): extend its compactification-filtered rigid syntomic fibre and functorial product/comparison diagram to every integer weight by Fⁿ=F⁰ for n<0, retaining the factor p⁻ⁿφ and finite-field scalar conventions.

What CohomologyComparisonsPartII must provide (gap:normalized-syntomic-boundary): on quasi-compact formal semistable schemes over 𝒪_K, r≥1, identify the divided rational de Rham boundary with the Bloch–Kato sign and the normalized undivided boundary p⁻ʳδ_U, including the isomorphism for i≤r−1, injection for i=r and proper exponential square used in §4.6.

What CohomologyComparisonsPartII must provide (gap:semistable-period-descent): identify the semistable extension complex and its uniformizer-change maps over every finite semistable realization field with the base-field potentially semistable coordinates, compatibly with restriction and normalized trace; this is the cohomological descent input for §§7.7,7.10–7.11 in arbitrary reduction.

### From TauCetiRoadmap.ColemanIntegrationPartII and the curve suppliers

**Required integration inputs.** ColemanIntegration supplies branch-aware Coleman primitives, constant terms, residues and traces. ColemanIntegrationPartII §§1.1–1.3 and 3.0a–3.0c supply geometric node identities, loops, parallel edges and curve graph/cohomology carriers; §§4.0c,4.2–4.4 supply natural single integration, harmonic realization and the corrected double pairing; §§5.1–5.5 and 6.1–6.4 supply annular double indices and global Coleman-wide-open triple sums with actual global compatible auxiliary primitives. Its §§7.1–7.6 supply branch, coefficient-trace, closed-point trace and arbitrary-reduction descent, on precisely those integration domains. No dependence of ColemanIntegrationPartII on CohomologyComparisonsPartII is required: both supply this roadmap independently. Section 7.11 owns the regulator-specific cancellation and comparison of component triple sums; wide-open choice independence alone does not imply that comparison.

AlgebraicCurves Layers 0,3,6,9,12 supply function-field places, divisors, regular projective models, differentials and pull/push. K2SymbolsBrauer §§9.2–9.4 supply the tame symbol, bilinearity and Steinberg relation; its §§9.11,9.13 supply the higher residues and finite support used for the tame kernels in §§7.3,7.8,7.11. Smooth proper curve and finite étale boundary hypotheses are retained on the geometric carriers of ColemanIntegration §L1.1. All uses of an extra supplier gap are conditional on that precise contract.

### Supplier: The fundamental exact sequences used by the Bloch–Kato maps

Consume the fundamental period sequences from PadicPeriodRings §4.3, with `B_e=B_cris^{φ=1}.` They are 0→ℚₚ→B_e→B_dR/B_dR⁺→0 and its equivalent presentation using B_e⊕B_dR⁺→B_dR. The crystalline presentation uses (1−φ, mod Fil⁰), consistently with the supplier contract. Fontaine's twisted sequence is 0→ℚₚ(r)→FilʳB_cris→B_cris→0 with arrow p⁻ʳφ−1, for integral r. Tensoring a rational sequence with V preserves exactness; taking invariants produces `D_cris(V)^{φ=1}` and D_dR(V)/Fil⁰ when V is de Rham. Integrally, the undivided period arrow is pʳ−φ and uses the modified Tate lattice; its bounded cokernel is part of the divided/undivided integral comparison supplier contracts, with its stated geometric and weight hypotheses. It is not an integral rescaling isomorphism.

See FO, author-hosted 303-page version, Theorem 7.26(3), Theorem 7.28(4) and Remark 7.29, printed pp.169–171; CN2017 §2.4.3, p. 23.

**Checks.**

- For V = Q_p(r), r ≥ 1: H^0(K, B_e(r)) = `D_cris(Q_p(r))^{φ=1}` = 0, so the connecting map of the exponential period sequence ⊗ V is injective on D_dR/Fil^0.
- For V = Q_p: H^0(K, B_e) = `K_0^{φ=1}` = Q_p and D_dR(Q_p)/Fil^0 = 0.
- For V=ℚₚ, the fixed crystalline line survives and maps to zero in D_dR/Fil⁰; deleting it would make the exponential injective for the wrong reason.

### Supplier: Integral comparison interface for small weights

For p odd, K/ℚₚ unramified and a crystalline lattice T whose weights lie in [0,p−2], consume the Fontaine–Laffaille correspondence with a strongly divisible W(k)-lattice in D_cris(V∨). On T=ℤₚ(r), 0≤r≤p−2, that lattice is W(k)d₋ᵣ. The integral Tate logarithm in §1.10 and the divided period comparison in the divided-comparison supplier contract use this convention. This is the integral interface of SelmerIwasawaCohomology §4.7 and FiniteFlatGroupsAndIntegralPadicHodgeTheory, with no new period-ring construction.

See BNQD2002 §1.3, p. 647.

**Checks.**

- T = Z_p(2) with p ≥ 5 lies in the Fontaine–Laffaille range [0, p − 2].
- T = Z_p(p − 1) is outside the range; the integral statements of Layer 1 are not asserted there.
- At p=3 the interval contains weights 0 and 1, and excludes weight 2; the weight-two lattice theorem therefore starts at p=5.

### Supplier: Fontaine's isomorphism h_Iw : `D(T)^{ψ=1}` ≅ H¹_Iw

Let D(T) be the étale (φ, Γ)-module of T over O_E ⊗ `A_{Q_p}` with the operator ψ (PhiGammaModulesAndIwasawaCohomology Layers 1 and 4). Define `h_{Iw,T}` : `D(T)^{ψ=1}` → H^1_Iw(Q_p, T) as the H^1-comparison of the ψ-complex [D(T) --(ψ − 1)--> D(T)] with the inverse-corestriction Iwasawa complex (PhiGammaModulesAndIwasawaCohomology Layer 5, SelmerIwasawaCohomology L3). Then: (a) `h_{Iw,T}` is a Λ-linear bijection; (b) for n ≥ 1, a topological generator γ_n of `Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^n}))` and ℓ_n(γ_n) := log_p χ(γ_n)/p^n, pr_n(h(y)) is the class of σ ↦ ℓ_n(γ_n)((σ − 1)/(γ_n − 1)·y − (σ − 1)b), where the rational x_n ∈ `D(V)^{ψ=0}` solves (γ_n − 1)x_n = (φ − 1)y and b in the enlarged rational period module tensored with V solves (φ − 1)b = x_n; (c) cor ∘ `pr_{n+1}` = pr_n and pr_0 = `cor_{Q_p(μ_p)/Q_p}` ∘ pr_1; (d) `h_{Iw,V}` := h ⊗ Q is independent of the lattice; (e) the Λ_E-torsion of `D(V)^{ψ=1}` is `V^{H_{Q_p}}` and maps onto the torsion of H^1_Iw(Q_p, V); H^1_Iw(Q_p, T) has no Z_p-torsion. Formula (b) is a rational representative: integrality is supplied by the finite-torsion exact-sequence construction and its lattice limit, not by an inverse to γ_n−1 on every integral ψ-zero lattice.

- fontaineIwasawaEquiv T : `D(T)^{ψ=1}` ≃ₗ[Λ] H1Iw T.
- pr_n (fontaineIwasawaEquiv T y) is the class of the explicit cocycle of (b).
- cor ∘ `pr_{n+1}` = pr_n; pr_0 = cor ∘ pr_1.
- The rationalisation is independent of T ⊂ V.
- Torsion of `D(V)^{ψ=1}` = `V^{H_{Q_p}}` ↦ torsion of H1Iw V.
- H1Iw T has no ℤ_p-torsion.

See CC99 Théorème II.1.3, p. 12; Berger2003 Theorem II.8, p. 118.

**Checks.**

- For V = Q_p, the class h(1) is nonzero and fixed by G_∞.
- For V = E(μ) with μ unramified nontrivial, H^1_Iw(Q_p, V) is torsion-free `(Q_p(μ_{p^∞}) ∩ Q_p^ur = Q_p).`
- `cor_{Q_p(μ_{p^2})/Q_p(μ_p)}` ∘ pr_2 ∘ h = pr_1 ∘ h, matching SelmerIwasawaCohomology's inverse system.
- h is defined on `D(T)^{ψ=1},` not on `D(T)^{φ=1}:` for V = Q_p(1), (1 + π)/π ⊗ e_1 lies in `D^{ψ=1}` but not in `D^{φ=1}.`

### Supplier: Twisting local Iwasawa cohomology by characters of G_∞

For a continuous character η : G_∞ → O_E^×, choose n(k) ≥ k with η ≡ 1 mod p^k on `Gal(Q_p(μ_{p^∞})/Q_p(μ_{p^{n(k)}}));` using H^1_Iw(Q_p, T) = lim_k `H^1(Q_p(μ_{p^{n(k)}}), T/p^k)` define Tw_η := lim_k (x ↦ x ∪ ē_η) with ē_η ∈ `H^0(Q_p(μ_{p^{n(k)}}), (O_E/p^k)(η)).` Then Tw_η : H^1_Iw(Q_p, T) → H^1_Iw(Q_p, T(η)) is a well-defined O_E-linear bijection, independent of the choices, with Tw_1 = id, Tw_η ∘ Tw_η' = `Tw_{ηη'},` and Tw_η(λx) = Tw_η(λ)Tw_η(x) where Tw_η(σ) = `η(σ)^{−1}σ` on Λ (SelmerIwasawaCohomology's convention Tw_k for η = χ^k). For ω of finite order trivial on `G_{Q_p(μ_{p^n})}:` pr_n(Tw_ω x) = pr_n(x) ⊗ e_ω.

- iwasawaTwist η : H1Iw T ≃+ H1Iw (T(η)).
- iwasawaTwist η (λ • x) = Tw_η(λ) • iwasawaTwist η x.
- iwasawaTwist 1 = id.
- iwasawaTwist η ∘ iwasawaTwist η' = iwasawaTwist (η * η').
- For ω of finite order trivial on level n, pr_n ∘ iwasawaTwist ω = (· ⊗ e_ω) ∘ pr_n.
- For η = χ^j, iwasawaTwist agrees with the Shapiro-lemma twist of SelmerIwasawaCohomology.

See CC99 Proposition II.1.2, p. 12; LZ2014 Lemma 2.4, p. 7.

**Checks.**

- iwasawaTwist η⁻¹ (iwasawaTwist η x) = x.
- iwasawaTwist 1 x = x.
- For η = χ^j and n ≥ 1, `pr_n(Tw_{χ^j}x)` ≡ pr_n(x) ∪ `ε_n^{⊗j}` modulo p^n.
- For a nonzero class x in the rational torsion-free quotient, and σ with χ(σ)≠1, the twist satisfies Twχ(σx)=χ(σ)⁻¹σTwχ(x), which differs from σTwχ(x) for the unchanged action. With the transported action it is linear. At x=0 both expressions are zero.

### Supplier: Compatibility of h_Iw with twists

(i) D(T(η)) = D(T) ⊗ e_η with φ, ψ acting on the first factor and g(x ⊗ e_η) = η(g)g(x) ⊗ e_η, so ⊗e_η : `D(T)^{ψ=1}` → `D(T(η))^{ψ=1}` is Tw_η-semilinear. (ii) `h_{Iw,T(η)}(y ⊗ e_η)` = `Tw_η(h_{Iw,T}(y)).` (iii) For η = χ^j the level-n cocycle of h(y ⊗ e_j) is σ ↦ ℓ(γ_n)((σ − 1)/(γ_n − 1)·y(j) − (σ − 1)b) with y(j) the image of y in `D(V(j))^{ψ=1}` (Cherbonnier–Colmez, proof of Theorem IV.2.1). (iv) For crystalline V, N(T(j)) = `π^{−j}N(T)` ⊗ e_j.

See CC99 Proof of Théorème IV.2.1, p. 21; Berger2003 Appendix A, p. 124.

**Checks.**

- η = χ: h(y ⊗ e_1) = Tw_χ h(y).
- For V = Q_p, N(Z_p(1)) = `π^{−1}N(Z_p)` ⊗ e_1 = `π^{−1}A^+` ⊗ e_1.

- At η=1 and y=0, both comparisons give 0; at η=χ and the Tate-root vector v₁, the nonzero image is κ_Iw(ε), so a zero comparison map fails.

### Supplier: Berger: ψ-fixed vectors lie in the Wach module

Let V be E-linear crystalline with Hodge–Tate weights in [a; b], T ⊂ V a G-stable O_E-lattice and N(T) its Wach module (PhiGammaModulesAndIwasawaCohomology Layer 6). (i) `D(T)^{ψ=1}` ⊂ `π^{a−1}N(T).` (ii) If V has no quotient isomorphic to E(a), then `D(T)^{ψ=1}` ⊂ π^a N(T). (iii) In particular, if a ≥ 0 and V has no quotient isomorphic to E (equivalently, as a Q_p-representation, no quotient Q_p), then ψ(N(T)) ⊂ N(T), `N(T)^{ψ=1}` = `D(T)^{ψ=1},` `N(V)^{ψ=1}` = `D(V)^{ψ=1},` and h_Iw restricts to Λ-isomorphisms `N(T)^{ψ=1}` ≅ H^1_Iw(Q_p, T) and `N(V)^{ψ=1}` ≅ H^1_Iw(Q_p, V).

See Berger2003 Theorem A.3, p. 124; LLZWach §1, p. 4.

**Checks.**

- V = E(1) (a = 1): (1 + π)/π ⊗ e_1 ∈ `D(V)^{ψ=1}` ∩ N(V).
- V = E (a = 0, quotient E): 1/π ∈ `D(E)^{ψ=1}` ∖ A^+, so the hypothesis of (ii) and the exponent a − 1 in (i) are sharp.

- For V=0, `D(V)^(psi=1) = N(V)^(psi=1) = 0` and h_Iw is the unique map 0→0; the containment includes rank zero.

### Supplier: Lattice and coefficient-change squares

(a) For lattices U ⊂ T ⊂ V: D(U) ⊂ D(T) ⊂ D(V) compatibly with φ, ψ, G_∞ and h_Iw; H^1_Iw(Q_p, T) → H^1_Iw(Q_p, V) is injective with image `h(D(V)^{ψ=1} ∩ D(T));` N(U) = N(V) ∩ D(U), and U ↦ N(U) is an inclusion-preserving bijection between G-stable lattices and Wach lattices in N(V); under the supplier contract “Berger: ψ-fixed vectors lie in the Wach module” (iii), H^1_Iw(Q_p, T) = `h(N(T)^{ψ=1}).` (b) For E'/E finite, D, N, ψ, H^1_Iw, h, Λ and the Mellin transform commute with `O_{E'}` `⊗_{O_E}` −; restriction of scalars to Z_p changes none of D, ψ, h.

See LLZWach §2.2, p. 8; Limites2004 Proposition III.4.2, p. 21.

**Checks.**

- For T = Z_p(1) ⊂ V: H^1_Iw(Q_p, Z_p(1)) = `h(N(Z_p(1))^{ψ=1}).`
- Changing T to pT multiplies `h(D(T)^{ψ=1})` by p.

- For T=0, coefficient extension gives 𝒪_E′⊗0=0 and every comparison remains 0; for pT⊂T the corresponding images are pH¹_Iw(T)⊂H¹_Iw(T).

### Supplier: Teichmüller decomposition of the units of a local field

Let L be a nonarchimedean local field with valuation ring O_L, maximal ideal m_L and residue field F_q, q = p^f. Write ω = TauCeti.teichmuller 𝒪[L] : F_q^× → O_L^× for the Teichmüller lift and U^1_L = 1 + m_L for the principal units. Then every u ∈ O_L^× factors uniquely as u = ω(ū)·⟨u⟩ with ū the residue of u and ⟨u⟩ := `u·ω(ū)^{-1}` ∈ U^1_L, so that O_L^× = `μ_{q-1}(O_L)` × U^1_L is an internal direct product; u ↦ ⟨u⟩ is a continuous group homomorphism onto U^1_L. The decomposition is natural for continuous field embeddings L → L' of local fields and for automorphisms of L, and, if L is a finite extension of Q_p, for every branch log_a of the p-adic logarithm (ColemanIntegration §L0.15) one has log_a(u) = log(⟨u⟩), the series logarithm of the principal-unit part, because log_a vanishes on roots of unity.

See `TauCeti/RingTheory/Henselian/Teichmuller.lean` and `TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean`; GSWZ2024 §3.1, (176), p. 38.

**Checks.**

- For L = Q_5 and u = 7: ū = 2, ω(2) is the unique 4th root of unity ≡ 2 mod 5, and ⟨7⟩ = `7·ω(2)^{-1}` ≡ 1 mod 5.
- `μ_{q-1}(O_L)` ∩ U^1_L = {1}: a decomposition with a nontrivial root of unity in the principal-unit factor is rejected.
- For p = 2 and L = Q_2 the first factor is trivial (q − 1 = 1) and −1 lies in `U^1_{Q_2}:` the factor of order prime to p does not contain the 2-power roots of unity.

### Supplier: Frobenius on the roots of unity of an unramified field

Let L be a finite unramified extension of Q_p with residue field F_q and let φ_L be its arithmetic Frobenius, the unique field automorphism of L over Q_p whose reduction is x ↦ x^p on F_q (an arithmetic Frobenius in the sense of IsArithFrobAt for the extension O_L/Z_p). Then φ_L(ω(α)) = ω(α^p) for every α ∈ F_q^×, hence φ_L(ζ) = ζ^p for every ζ ∈ `μ_{q-1}(L);` for p odd μ(L) = `μ_{q-1}(L),` so φ_L(ζ) = ζ^p for every root of unity of L. For a finite product L = ∏_i L_i of such fields put φ_L := ∏_i `φ_{L_i};` then φ_L(ζ) = ζ^p componentwise for tame ζ (all roots if p odd). This is GSWZ (176).

This is `TauCeti.frobeniusAlgEquiv_teichmullerLift` and `TauCeti.frobeniusAlgEquiv_rootsOfUnity` in `TauCeti/NumberTheory/LocalField/Frobenius.lean`, with K=ℚₚ; finite products use the componentwise automorphism. The full root group assertion remains restricted to odd p.

See GSWZ2024 §3.1, (176), p. 38; `TauCeti/NumberTheory/LocalField/Frobenius.lean`, `TauCeti.frobeniusAlgEquiv_rootsOfUnity`.

**Checks.**

- L = `Q_{25}` (p = 5): φ_L has order 2 and fixes exactly μ_4 ⊂ `μ_{24}.`
- For p = 2 and L = Q_2, −1 ∈ μ(L) is not of order prime to 2; the identity φ(ζ) = ζ^2 fails for ζ = −1, so the odd-p hypothesis is needed for the full μ(L).

- For L=ℚ₅, φ_L fixes ω(2), and ω(2)⁵=ω(2). On the zero algebra the componentwise Frobenius is its unique automorphism; its action on the zero element is 0.

### Supplier: Soulé's étale regulator to continuous Galois cohomology

Let F be a characteristic-zero field (a number field or a finite extension of ℚ_p), or a finite product of such fields. For n≥1 define r^et_n:K_(2n−1)(F)→H¹(F,ℤ_p(n)) by reduction modulo p^ν, the compatible Soulé classes c_(n,1), and inverse limit. It factors through K_(2n−1)(F;ℤ_p); rationalization gives K_(2n−1)(F)⊗ℚ_p→H¹(F,ℚ_p(n)). Weight one is Kummer. These are ordinary Chern classes. The Chern-character étale regulator is r^(et,ch)_n:=((−1)ⁿ⁻¹/(n−1)!)·(r^et_n⊗ℚ), with values in H¹(F,ℚ_p(n)); it is the étale counterpart of reg_syn in §4.1. In weight two r^(et,ch)_2=−r^et_2 is still integral. For local F, KTheoryFiniteLocalFields §§6.6–6.7 supplies a completed étale edge isomorphism for n≥2. Ordinary Chern operations require a factorial comparison with that edge; here the Chern isomorphism is needed only in weight two.

- etaleRegulator F p n : `K_{2n−1}(F)` →+ H^1(F, ℤ_p(n)).
- The Chern-character normalization r^(et,ch)_n=((−1)ⁿ⁻¹/(n−1)!)·r^et_n after rationalization; in weight one both are Kummer, in weight two they differ by the sign −1.
- The factorisation through `K_{2n−1}(F; ℤ_p),` a ℤ_[p]-linear map.
- For n = 1, etaleRegulator F p 1 is the Kummer map F^× → H^1(F, ℤ_p(1)).
- For a field embedding F → F', res ∘ etaleRegulator F = etaleRegulator F' ∘ `K_{2n−1}(ι).`
- For F'/F finite, cor ∘ etaleRegulator F' = etaleRegulator F ∘ `N_{F'/F}` (transfer).
- For F/ℚ_p finite, the completed weight-two Chern map is an isomorphism. For general n≥2 keep the separate `etaleEdgeOne` isomorphism and its Chern normalization comparison.
- For a number field F and v | p, res_v ∘ etaleRegulator F = etaleRegulator F_v ∘ c_v.

See HK2011 §1.3, p. 8; NN2016 §5.2, p. 59; KTheoryFiniteLocalFields §§1.8,6.6–6.7. WeibelChern Proposition 5.1, p.24 distinguishes the ordinary Chern operation from the edge.

**Checks.**

- For F = Q_p, n = 1 and u ∈ Z_p^×, etaleRegulator F p 1 u is the image of u under lim_ν of Tau Ceti's kummerClassMap.
- For F = Q_5, n = 2, the completed etaleRegulator is a ℤ_5-linear isomorphism between free modules of rank 1.
- Over 𝔽₃ in weight 3 modulo 2, K₅ and H¹ both have order 2, but c_(3,1) is zero: its factorial multiplier is 2. Equal group sizes do not identify the ordinary Chern map with the edge.
- In weight three r^et_3=2·r^(et,ch)_3 after rationalization. A comparison that treats the two normalizations as equal is off by the factor 2, which no choice of sign absorbs.
- For F = `Q_{p²}` and p > 3, a ℤ_p-isomorphism K_3(F; ℤ_p) ≅ ℤ_p² chosen from bases is not etaleRegulator: etaleRegulator commutes with the Frobenius automorphism of F, while a generic basis isomorphism does not.

### Supplier: Rigid syntomic cohomology of smooth schemes over a p-adic integer ring

Consume the compactification-filtered theory of CohomologyComparisonsPartII §§2.1–2.3 for n≥0, and gap:rigid-negative-weights for n<0. Let R be a complete mixed-characteristic DVR with perfect residue field k, K=Frac(R), K₀=Frac(W(k)), and X smooth separated of finite type over R. The filtered algebraic term FⁿRΓ_dR(X_K) is obtained from logarithmic forms on a smooth proper normal-crossings compactification, with its Hodge filtration. Besser's rigid syntomic complex is the ℚₚ-linear homotopy fibre of (a,b) ↦ (a−bc(b),(1−φ/pⁿ)b), from FⁿRΓ_dR⊕RΓ_rig(K₀) to RΓ_rig(K)⊕RΓ_rig(K₀), where the first a is sent by specialization. This fixes the order and sign of the two target components. Its cohomology is functorial and independent of the chosen compactification and frame (Besser2000 Definition 5.1, Definition 6.1 and Proposition 6.3, author pp.17,19–20).

- Pullback commutes with specialization, Frobenius and products.
- The fibre triangle gives the long exact sequence using Hⁱ(FⁿRΓ_dR), with this compactification filtration.
- For X=Spec R and n≥1, the de Rham coordinate η identifies H¹ with K; all other degrees vanish. With the displayed component order, η([(0,c)])=(1−σ/pⁿ)⁻¹c.
- Presentation refinements give compatible equivalences and homotopic chain maps induce the same cohomology map.

Separately use the dagger syntomic complex of Huber–Kings on a smooth affine weak formal completion, with filtration by the tube ideal and form degree (HK2011 Definition 2.2.1, p.14). It is not defined by algebraic stupid truncation on X_K. Gap:dagger-syntomic-filtration supplies this carrier, its Chern-compatible comparison and the equivalence for a point and for smooth proper models using derived analytic descent. On general affine schemes a comparison map is retained without an equivalence assertion. Sections 4.1–4.2 use the dagger regulator at Spec R, identified there with Besser's point target. Sections 7.1–7.6 use the compactification-filtered rigid theory on the smooth proper curve and its modified open-curve model. The relative and semistable theories in §§7.7–7.11 have their own explicitly stated filtered carriers.

**Checks.**

- For R=ℤₚ,n=2, the class [(0,c)] has η-value c/(1−p⁻²), distinguishing the two cone coordinates.
- At n=0, X=Spec ℤₚ, the fibre has H⁰=H¹=ℚₚ; the positive-weight vanishing statement does not apply.
- For A¹_K compactified by (ℙ¹,∞), H¹(F¹RΓ_dR)=H⁰(ℙ¹,Ω¹(log∞))=0. Algebraic stupid truncation instead gives K[x]dx, while H¹_dR(A¹)=0. These complexes cannot be silently identified.
- For G_m, compactification-filtered H¹ in weight one is K·dlog t, and φ(dlog t)=p·dlog t; 1−φ/p kills it.
- For X=Spec R,n≥1, the dagger point calculation and the compactification-filtered one both give H¹=K with the stated η (HK2011 Example 2.2.4, pp.14–15).

### Supplier: Log-syntomic complexes S_n(r)

Consume CohomologyComparisonsPartII §§3.1–3.4: its divided and undivided complexes, error maps, products and derived completion, on each section’s stated domain.

For an fs log-smooth X/O_K^× (mixed characteristic, perfect residue field), r≥0 and m≥1, distinguish U_m(r)=Fib(p^r−φ:J_m^[r]→O_cr,m) from D_m(r)=Fib(1−φ_r:J_m^<r>→O_cr,m). Here J_m^<r> is obtained by lifting to level m+s, s≥r, imposing φ(x)∈p^r O_cr,m+s, then reducing modulo p^m; φ_r is the resulting divided Frobenius. For 0≤r≤p−1 the two domain ideals agree, but the two differentials and complexes still differ. There are directed maps ω_r:U_m(r)→D_m(r), with legs (p^r,id), and τ_r:D_m(r)→U_m(r), with legs (id,p^r). Both composites are p^r; their cohomological kernels/cokernels are p^r-torsion. ω preserves products; τ generally does not. Étale sheafification, derived global sections and derived m-limits are imported. Derived reduction and the rational quotient-fibre presentation retain CohomologyComparisonsPartII §3.4’s arithmetic-pair hypotheses: a dense open K-variety in a reduced proper flat 𝒪_K-scheme, fine integral quasi-coherent boundary log structure, log smoothness over the canonical log trait, Cartier type and local exact log-PD presentations. CN S_m(r) denotes U_m(r), whereas EN S_m(r) denotes D_m(r) and EN S′_m(r) denotes U_m(r). After rationalization ω and τ/p^r are inverse comparisons; integral equality is not asserted.

- logSyntomicComplex X r m is the imported undivided complex U_m(r), not the divided D_m(r).
- logSyntomicSheaf X r m is the étale undivided sheaf complex U_m(r); its derived global sections give logSyntomicComplex.
- On the log-smooth arithmetic-pair domain of CohomologyComparisonsPartII §3.4, logSyntomicCompleted X r ⊗^L Z/p^n ≃ logSyntomicComplex X r n.
- On that arithmetic-pair domain, logSyntomicCompleted X r ⊗ Q is Fib((1−φ/p^r,can):RΓ_cr,Q→RΓ_cr,Q⊕RΓ_dR/F^r), with the derived filtered quotient retained.
- Morphisms of fs log-smooth O_K^×-schemes induce maps, with map_id and map_comp; base change along O_K → `O_{K'}.`
- Cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
- The imported D_m(r) with the Frobenius-divisible ideal, distinct from U_m(r).
- ω_r:U_m(r)→D_m(r) has legs (p^r,id); τ_r has legs (id,p^r), and both composites equal p^r. Only ω is asserted multiplicative.

See CN2017 §5.1.1, pp. 52–53; NN2016 Introduction, (1), p. 2; EN2016 §2.1 and §2.1.2, pp. 4–6.

**Checks.**

- For X = Spec O_K (log structure of the closed point), r = 2: H^1(logSyntomicCompleted X 2) is `p^{N}-isomorphic` to O_K and H^2 to 0.
- For r = 0, `J^{[0]}` = O and S_n(0) is the fibre of 1 − φ on `A_{cr,n};` on X = Spec O_K its H^0 is Z/p^n.
- For Y/W(k) smooth projective and D a relative normal-crossings divisor, CohomologyComparisonsPartII §7.4 identifies the syntomic complex with log structure from D alone over the trivially logged base with rigid syntomic cohomology of Y−D (AM2022 Lemma 3.10, pp.29–30). For Y=Spec ℤₚ, D empty and r=1, both have H¹=ℚₚ. Adding the canonical vertical log gives H¹=ℚₚ²: the complex ℚₚ→ℚₚ³→ℚₚ has maps x↦((1−p⁻¹)x,x,0) and zero, so the extra uniformizer Kummer direction survives.
- At r=p−1 the chosen Euclidean decomposition gives a(r)=1 and `Z_p(r)′=p^{-1}Z_p(r),` whereas at r=p−2 it gives a(r)=0 and the ordinary twist. Replacing all modified lattices by the ordinary lattice loses this normalization.
- At m=1 and r≥1, p^r is zero. The identity ωτ=p^r supplies no inverse; for zero Frobenius and identical Z/p domains, Fib(0) and Fib(id) already have different cohomology. This algebraic test detects invalid rescaling.

### Supplier: The Fontaine–Messing–Kato period morphism

Consume CohomologyComparisonsPartII §§4.1–4.2 for ordinary/modified Tate lattices and the divided and undivided Fontaine–Messing morphisms.

Use the imported divided complex D_m(r). Its integral Fontaine–Messing period map α_div:D_m(r)→i*Rj*(Z/p^m(r)′) is a directed morphism. For 0≤r≤p−2 it lands in the ordinary twist. In all weights EN uses Z_p(r)′=(p^a a!)^−1 Z_p(r), r=(p−1)a+b, 0≤b<p−1. On the syntomic–étale site the map goes from D_m(r) to i_se* j_se* j′*G(Z/p^m(r)′), with G the Godement resolution. Exactness of the special-fibre pushforward and the topos comparison induce the stated étale map after derived pushforward. Define α_und=α_div∘ω_r on U_m(r); this is multiplicative and reduction-compatible. This construction inverts no p^r-exact arrow. CN uses p^−a Z_p(r). The lattices coincide exactly when v_p(a!)=0, equivalently a<p. Otherwise transport the period map by the explicit change of lattice: multiplication by a! sends EN’s generator (p^a a!)⁻¹ to CN’s generator p^−a. Layer 4 uses weights outside this equality range; the p>3, weight-two calculation in Layer 5 has a=0.

- fmkPeriodMap X r m := α_div∘ω_r : U_m(r)→i*Rj*(Z/p^m(r)′); the divided map is a separate imported interface.
- The divided map comes from the canonical syntomic–étale-site map to a Godement resolution and derived pushforward. The undivided map is its composition with ω_r; no bounded quasi-isomorphism is inverted.
- fmkPeriodMap is compatible with cup products S_n(r) ⊗ S_n(s) → S_n(r + s).
- Compatible with the reduction maps n → n − 1 and with the completed versions.
- On the divided weight-one unit class α_div equals the Kummer map; on the undivided unit class α_und equals p times Kummer, because ω sends that class to p times the divided one.
- α_div:D_m(r)→i*Rj*(Z/p^m(r)′), with EN’s (p^a a!)^−1 twist.

See CN2017 §1, p. 2; EN2016 §2.2–§2.2.1, pp. 7–8; EN2016 §2.1.3, the first Chern class maps and their compatibility diagram, pp. 5–6; §2.2.1, pp. 7–8.

**Checks.**

- For a unit u, the divided class maps to κ_m(u); the undivided class maps to p·κ_m(u). At m=1 the latter can vanish despite κ_m(u)≠0. Exactness belongs to the divided map.
- For r = 0, `α^FM_{0,n}` is the identification of S_n(0) with i^*Rj_*Z/p^n in degree 0 (both are Z/p^n on a connected X).
- For r < p − 1, a(r) = 0 and Z_p(r)' = Z_p(r), so the Colmez–Nizioł and Nekovář–Nizioł normalisations coincide.
- At r=p−1, `Z_p(r)′=p^{-1}Z_p(r)` and its prescribed period generator has p-adic valuation one less than the ordinary generator; an ordinary generator cannot be silently substituted in the same normalized map.
- At p=2,r=2, a=2: EN’s lattice is ⅛ℤ₂(2), CN’s is ¼ℤ₂(2), and multiplication by 2 carries the first generator to the second. At p=3,r=6, a=3, the change is multiplication by 6. At p=5,r=2, a=0 and both lattices are ℤ₅(2).

### Supplier: The divided small-weight comparison and the undivided bounded comparison

Consume CohomologyComparisonsPartII §§4.3–4.4, with the exact divided and bounded undivided domains kept separate.

For fs log-smooth X/𝒪_K^× of Cartier type, and 0≤i≤r≤p−2, the divided period morphism induces Hⁱ(D_m(r))≃i*Rⁱj*(ℤ/pᵐ(r)). Equivalently, τ≤rD_m(r)≃τ≤r i*Rj*(ℤ/pᵐ(r)). This is the small-weight theorem in EN2016 Theorem 2.2, p. 7, attributed there to Tsuji. For a semistable scheme or semistable base change and 0≤i≤r, the undivided morphism, after the factorial lattice conversion above, has kernel and cokernel killed by p^(Nr+cₚ) when K has enough roots of unity in the following precise sense: if i is maximal with ζ_(pⁱ)∈K, F_i=K₀(ζ_(pⁱ)), δ_K=e·vₚ(Different(K/F_i)) and vₚ(p)=1, then δ_K+[K:F_i]<e/(2p). Here N is universal; cₚ depends only on p for odd p, and also on chart dimension d for p=2. The sharper bound is uniform in m and in X at fixed d when p=2. Separately, the general bound is p^N(e,p,r), uniform in m and X, where e is the absolute ramification index. Rationalization gives the comparison in degrees ≤r. The exact assertion is restricted to the divided complex and has no r=p−1 endpoint.

See CN2017 §1, (1.3), p. 2; CN2017 Theorem 1.1, p. 2; EN2016 Theorem 2.2, p. 7; §2.1, pp. 4–5.

**Checks.**

- At r=1 and p≥3 the divided map computes H¹(K,Z/p^m(1)); the undivided map remains bounded and must not inherit this exact conclusion.
- At r=2 and p≥5 the divided exact comparison uses the ordinary twist, but U_m(2) and D_m(2) are still different integral complexes.
- At p=2,r=1, chart dimensions 1 and 2 give sharper exponents N+c₂(1) and N+c₂(2); no equality is inferred. At p=3,r=1 both dimensions use N+c₃. The separate general exponent N(e,p,1) applies in either dimension.

### Supplier: Finite unramified étale Q_p-algebras

A finite unramified étale Q_p-algebra is a Q_p-algebra L isomorphic to a finite product `∏_{i∈I}` L_i of finite unramified field extensions L_i/Q_p; equivalently L ≅ W(k)[1/p] for a finite reduced F_p-algebra k = ∏_i `F_{q_i}` (Witt vectors of a finite product of finite fields), with k ≅ O_L/pO_L. Its ring of integers is O_L = ∏_i `O_{L_i}` = W(k), the integral closure of Z_p in L; its rank is [L : Q_p] = Σ_i [L_i : Q_p] = `dim_{F_p}` k; its Frobenius φ_L = ∏_i `φ_{L_i}` is the Witt-vector Frobenius W(Frob_k)[1/p]. For a number field F and a prime p unramified in F, F ⊗_Q Q_p ≅ `∏_{v|p}` F_v is such an algebra, with O_F ⊗ Z_p = ∏_v O_v.

- IsUnramifiedEtaleAlgebra p L : L is a finite product of finite unramified field extensions of ℚ_[p] (data: the factor decomposition up to isomorphism).
- L ≃ₐ[ℚ_[p]] Localization.Away (p : WittVector p k) for k := O_L ⧸ p, a finite reduced 𝔽_p-algebra.
- Module.finrank ℚ_[p] L = Module.finrank (ZMod p) k.
- The Frobenius φ_L : L ≃ₐ[ℚ_[p]] L induced by WittVector.frobenius on W(k); it fixes exactly `ℚ_[p]^{#π_0}` componentwise.
- Finite products of unramified étale algebras are unramified étale.
- For a number field F and p unramified in F, F ⊗[ℚ] ℚ_[p] is unramified étale.

See GSWZ2024 §3.1, paragraph before Theorem 9, p. 39.

**Checks.**

- For F = Q(α), α³ − α² + 1 = 0 and p = 5, F ⊗ Q_5 is unramified étale of rank 3 with factors of residue degrees 2 and 1.
- The zero algebra (empty product, k = 0) is unramified étale of rank 0.
- For k = F_q, the algebra W(F_q)[1/p] is the unramified extension Q_q of degree log_p q, and its Frobenius is Mathlib's WittVector.frobenius after inverting p.
- For p odd, Q_p(ζ_p) is finite étale but not unramified: its residue field is F_p while its degree is p − 1, so it is not of the form W(k)[1/p].

### Supplier: Completed K₃ of a finite unramified étale algebra

For a finite unramified étale Q_p-algebra L = ∏_i L_i put K_3(L; Z_p) := π_3 K(L; Z_p), the p-completed K-theory of KTheoryFiniteLocalFields §1.6. The projections induce K_3(L; Z_p) ≅ ∏_i K_3(L_i; Z_p) (finite products commute with K-theory and with derived p-completion), and K_3(O_L; Z_p) → K_3(L; Z_p) is an isomorphism. The étale Chern classes give c_L : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) := ∏_i H^1(L_i, Z_p(2)). For p > 3, K_3(L; Z_p) is a free Z_p-module of rank [L : Q_p]; for p ∈ {2, 3} it has the nonzero torsion `Z/w_2^{(p)}(L_i)` on each factor.

- completedK3 p L := π_3 K(L; ℤ_p), a ℤ_[p]-module.
- completedK3 p (∏ i, L i) ≃ₗ[ℤ_[p]] ∏ i, completedK3 p (L i).
- completedK3 p O_L ≃ₗ[ℤ_[p]] completedK3 p L, induced by O_L → L.
- completedK3 p L ≃ₗ[ℤ_[p]] H^1(L, ℤ_p(2)), componentwise étale Chern class `c_{2,1}.`
- For p > 3, Module.Free ℤ_[p] (completedK3 p L) and Module.finrank = [L : ℚ_[p]].
- A ℚ_[p]-algebra map f : L → L' induces completedK3 p L → completedK3 p L', with map_id and map_comp; the Frobenius φ_L acts by functoriality.
- For L → L' finite free, a transfer completedK3 p L' → completedK3 p L, corresponding to corestriction under the Chern isomorphisms.
- The completed module is imported from p-completed K-theory. Equality of induced maps is pointwise, and product maps are determined by all factor projections. Inherit Module and map_zero/map_add/map_smul rather than define a new completion carrier.

See GSWZ2024 Proof of Theorem 9, p. 39.

**Checks.**

- For p = 5 and L = `Q_{25}` × Q_5, completedK3 5 L is free of rank 3.
- completedK3 p 0 = 0 for the zero algebra.
- For L = Q_p the Chern isomorphism agrees with KTheoryFiniteLocalFields §§6.6–6.7 at i = 2.
- For p = 3, completedK3 3 Q_3 has torsion Z/3 `(w_2^{(3)}(Q_3) = 3),` so it is not free and no injective map to a torsion-free lattice exists.

### Supplier: Completed K₃ of an unramified field is the completed Bloch group

K3BlochGroups §6.6 supplies K₃^ind(L)/p^ν≃B(L)/p^ν when p is odd and μ(L)⊗ℤ/p^ν=0, retaining the kernel image of T̃(L)/p^ν before this root hypothesis. KTheoryFiniteLocalFields §§3.5,6.2,6.8–6.10 supply the ordinary-to-indecomposable and completed-to-inverse-limit steps: the local Milnor K₃ image is divisible, and TₚK₂(L)=0 because K₂(L) is a uniquely divisible group plus finite torsion. Composing these inputs gives the following contract.

Let L be a finite unramified extension of Q_p with p ≥ 3. For every ν ≥ 1 the natural maps K_3(L)/p^ν → K_3^ind(L)/p^ν → B(L)/p^ν are isomorphisms (B(L) Suslin's Bloch group), and the completion map identifies K_3(L; Z_p) with lim_ν K_3(L)/p^ν ≅ lim_ν B(L)/p^ν =: B(L)^∧_p. In particular the image of B(L) — more precisely of K_3(L), which surjects onto every B(L)/p^ν — is dense in K_3(L; Z_p), and the kernel of K_3(L) → K_3(L; Z_p) is ⋂_ν p^ν K_3(L). For a finite product L = ∏ L_i the statements hold factorwise.

See GSWZ2024 Proof of Theorem 9, p. 39.

**Checks.**

- For L = Q_5: K_3(Q_5; Z_5) ≅ Z_5 ≅ lim_ν B(Q_5)/5^ν.
- For ramified L=Q_p(ζ_p), retain the term im(μ̃(L)/p→K_3^ind(L)/p) in the kernel of K_3^ind(L)/p→B(L)/p. The argument that this term vanishes for unramified L no longer applies. No nonzero injection of μ̃(L)/p, or ramified isomorphism, is inferred from tensoring Suslin’s exact sequence.

- At L=ℚ₃ the completed group is ℤ₃⊕ℤ/3, so the completed Bloch comparison retains the order-three summand; it does not imply torsion-freeness.

### Supplier: Good Wach basis coordinate interface

Consume the integral, rational and analytic good-basis comparisons from PhiGammaModulesAndIwasawaCohomology §6.2, including the choice congruent modulo π to a prescribed integral Wach basis (LLZWach Theorem 3.5). For b_i=(1+π)φ(n_i), its ψ-zero coordinates identify the bounded coefficient row with Λ_E(G∞)^d and the analytic extension with ℋ_E(G∞)^d. A constant basis change acts by inverse right multiplication. A nonconstant matrix in GL_d(Λ_E(G∞)) transports coordinates but need not preserve the property of being a good Wach basis.

See LLZWach Theorem3.5, Lemmas3.7-3.10, Proposition3.11, Lemma3.15, pp.10-13; LLZ2011 Proposition2.11, Theorem2.12, Corollary2.13, Remark2.14, pp.1115-1116.

**Checks.**

- Changing by a constant GL_d(O_E) matrix preserves goodness. An arbitrary power-series change does not follow from this theorem.
- In rank one the bounded coordinate of b₁ is 1, whereas p⁻¹b₁ has nonintegral coordinate and is not an integral good basis.
- For U=diag(2,1) over ℤ₅, coordinates (a,b) become (a/2,b); multiplication by U would give the wrong first coordinate.

## How to read the build

Layers 0–2 fix the cohomological interfaces; Layers 3–6 build the local K₃ theorem and global regulator. Layer 7 treats curves, retaining continuous and discrete semistable coordinates. Layers 8–9 build cyclotomic regulators, interpolation, Coleman images and de Rham domains.

## Layer 0: period and integral comparison interfaces

This layer fixes the regulator’s common period and weight conventions. The fundamental exact sequences and small-weight integral comparison are listed only in the supplier contracts.

### 0.1 Hodge–Tate, twist and period conventions for the regulator

Use t=log[ε], g(t)=χ(g)t, φ(t)=pt and FilⁱB_dR=tⁱB_dR⁺. The invariant Tate vector is dᵣ=t⁻ʳ⊗vᵣ, independent of rescaling ε. It spans K₀dᵣ in D_cris and Kdᵣ in D_dR, with φ(dᵣ)=p⁻ʳdᵣ. Twisting D by r sends Filʲ to Filʲ⁺ʳ and φ to p⁻ʳφ. The filtration definition of weight gives ℚₚ(1) weight +1 and the Tate module of an abelian variety weights 0 and 1. Crystalline inputs have N=0; monodromy appears only for semistable inputs.

See Berger2003 §I.2, pp. 4–6; BNQD2002 §1.3, p. 646.

*Needs:* PadicPeriodRings §§1.5,4.1–4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P5.

**Checks.**

- D_cris(Q_p(2)) = K₀·d₂ with φ(d₂) = p⁻²d₂ and D_dR(Q_p(2))/Fil⁰ = K·d₂: the target of the weight-two regulator.
- D_dR(Q_p)/Fil^0 = 0 and D_dR(Q_p(−1))/Fil^0 = 0.
- A source stating 'Q_p(1) has Hodge–Tate weight −1' is translated by h ↦ −h before use.

### Examples

For ℚₚ(2), the de Rham quotient is Kd₂ and Frobenius is p⁻². For ℚₚ and ℚₚ(−1) the quotient is zero. These three cases fix the numerical weight sign before any exponential is evaluated.

### Dependencies

PadicPeriodRings §§1.5,4.1–4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5; SelmerIwasawaCohomology §4.7; PadicHodgeTheory Layers 0,3,6; FiniteFlatGroupsAndIntegralPadicHodgeTheory small-weight comparison.

## Layer 1: Bloch–Kato exponential and logarithms

Let V be a finite-dimensional continuous ℚₚ-representation of G_K; de Rham or crystalline hypotheses are imposed at the points that use them. For a lattice T write A=V/T. Local cohomology is continuous, and integral conditions are preimages while discrete conditions are images.

### 1.1 The Bloch–Kato local conditions H¹_e, H¹_f, H¹_g

Let K/Q_p be finite and V a p-adic representation of G_K. Use PhiGammaModulesAndIwasawaCohomology §5.7’s H^1_e(K, V) = ker(H^1(K, V) → H^1(K, B_e ⊗ V)), SelmerIwasawaCohomology §4.9’s H^1_f(K, V) = ker(H^1(K, V) → H^1(K, B_cris ⊗ V)) and define the additional condition H^1_g(K, V) := ker(H^1(K, V) → H^1(K, B_dR ⊗ V)), so H^1_e ⊆ H^1_f ⊆ H^1_g. For a G_K-stable Z_p-lattice T ⊂ V and W = V/T, H^1_f(K, T) is the preimage of H^1_f(K, V) and H^1_f(K, W) the image of H^1_f(K, V); these are the finite local conditions. For ℓ ≠ p (K/Q_ℓ finite) H^1_f := H^1_ur. The singular quotient is H^1_s := H^1/H^1_f.

The new carrier here is blochKatoG; blochKatoE and blochKatoF denote the supplied conditions. The new comparison API places them in a common exact-sequence and regulator convention. Away from p the unramified equality is rational; a finite-coefficient unramified subgroup need not equal the propagated condition.

- blochKatoE K V : Submodule ℚ_p (H^1(K, V)).
- blochKatoF K V : Submodule ℚ_p (H^1(K, V)).
- blochKatoG K V : Submodule ℚ_p (H^1(K, V)).
- blochKatoE K V ≤ blochKatoF K V ≤ blochKatoG K V.
- blochKatoF K T := preimage under H^1(K, T) → H^1(K, V); blochKatoF K (V/T) := image.
- For a G_K-map V → V', H^1(K, V) → H^1(K, V') maps blochKatoF into blochKatoF (same for e, g).
- For L/K finite, restriction maps blochKatoF K V into blochKatoF L V and corestriction maps back.
- For ℓ ≠ p, blochKatoF := H^1_ur.
- Two Bloch–Kato submodules agree iff their membership predicates agree on every class, by Submodule.ext. Each inherits the ambient Q_p-module operations; membership is stable under zero, addition and scalar multiplication.

See BK1990 §3.7, equations (3.7.1)–(3.7.3), Proposition 3.8 and Corollary 3.8.4, pp. 353–355; Rubin2000 Remark I.3.6, p. 7.

*Needs:* PhiGammaModulesAndIwasawaCohomology §5.7; SelmerIwasawaCohomology §4.9; ArithmeticGaloisDuality §R02.1.2.

**Checks.**

- For V = Q_p and K = Q_p, blochKatoF = H^1_ur(Q_p, Q_p) = Hom(Gal(Q_p^ur/Q_p), Q_p), of dimension 1, while H^1(Q_p, Q_p) has dimension 2.
- For V = Q_p(−1), H^1_e = H^1_f = H^1_g = 0 although H^1(K, Q_p(−1)) has dimension [K : Q_p].
- For V = Q_p(1), blochKatoF agrees with Rubin's `U_{L,v}` ⊗ Φ condition (Euler Systems, §I.6.3, (7)) and with the Kummer image of the completed units.
- For V = Q_p, H^1_g(K, Q_p) = H^1_f(K, Q_p) ≠ H^1(K, Q_p): the de Rham condition is a proper subspace (the ramified homomorphisms are excluded).

### 1.2 Exact sequences and normalization of the supplied exponential

For K/Q_p finite and V a de Rham representation, use the supplied exponential of PhiGammaModulesAndIwasawaCohomology §5.7, `exp_{K,V}` : D_dR(V)/Fil^0 D_dR(V) → H^1(K, V) is the connecting homomorphism of 0 → V → B_e ⊗ V → (B_dR/B_dR^+) ⊗ V → 0 (the exponential period sequence ⊗ V). Import NoncommutativeAndEquivariantIwasawa §F.6’s normalized kernel and crystalline exact sequences 0 → H^0(K, V) → `D_cris(V)^{φ=1}` → D_dR(V)/Fil^0 → H^1_e(K, V) → 0 and 0 → H^0(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil^0 → H^1_f(K, V) → 0 (the middle arrow x ↦ ((1−φ)x, x̄)); in particular `im(exp_{K,V})` = H^1_e(K, V) and `ker(exp_{K,V})` is the image of `D_cris(V)^{φ=1}.` Explicitly, exp(x) is the class of g ↦ (g − 1)b for any b ∈ B_e ⊗ V with b − x ∈ B_dR^+ ⊗ V.

- blochKatoExp K V : D_dR(V) ⧸ Fil^0 →ₗ[ℚ_p] H^1(K, V).
- LinearMap.range (blochKatoExp K V) = blochKatoE K V.
- ker (blochKatoExp K V) = image of `D_cris(V)^{φ=1}` in D_dR(V)/Fil^0.
- blochKatoExp K V is injective iff `D_cris(V)^{φ=1}` = H^0(K, V).
- blochKatoExp K V x is represented by g ↦ (g − 1)b for b ∈ B_e ⊗ V lifting x.
- Natural in V for G_K-equivariant maps of de Rham representations.
- The exact sequence 0 → H^0 → D_cris → D_cris ⊕ D_dR/Fil^0 → H^1_f → 0.

See BK1990 §3.7, equations (3.7.1)–(3.7.3), Proposition 3.8 and Corollary 3.8.4, pp. 353–355; Berger2003 Introduction, p. 2.

*Needs:* §0.1; NoncommutativeAndEquivariantIwasawa §F.6; PhiGammaModulesAndIwasawaCohomology §5.7.

**Checks.**

- For K = Q_p and V = Q_p(2), blochKatoExp is an isomorphism Q_p·e_2 ≅ H^1(Q_p, Q_p(2)) ≅ Q_p.
- For V = Q_p, D_dR(Q_p)/Fil^0 = 0, so blochKatoExp = 0 and H^1_e(K, Q_p) = 0.
- For V = Q_p(1) and u ∈ 1 + p^c O_K (c > 1/(p − 1)), blochKatoExp(log u · e_1) = κ(u), the Kummer class (Bloch–Kato 3.10.1).
- For V = Q_p(1), H^1_e = H^1_f has dimension [K : Q_p] but H^1(K, Q_p(1)) has dimension [K : Q_p] + 1: the exponential does not reach the valuation direction.

### 1.3 The Bloch–Kato logarithm

Let K/Q_p be finite and V de Rham with `D_cris(V)^{φ=1}` = H^0(K, V) (so `exp_{K,V}` is injective). The Bloch–Kato logarithm is log_BK := `exp_{K,V}^{−1}` : H^1_e(K, V) → D_dR(V)/Fil^0 D_dR(V). For V = Q_p(r), r ≥ 2, H^1_e = H^1(K, Q_p(r)) and log_BK : H^1(K, Q_p(r)) ≅ K·e_r ≅ K; for V = Q_p(1), log_BK ∘ κ = log_p on O_K^× (Iwasawa branch), with κ the Kummer map.

There is also an unconditional quotient logarithm for every de Rham V: the exponential induces an isomorphism D_dR(V)/(Fil⁰D_dR(V)+image `D_cris(V)^{φ=1})` ≃ H¹_e(K,V), whose inverse is blochKatoLogQuotient. Its target becomes D_dR(V)/Fil⁰ precisely when the fixed crystalline subspace maps to zero there. This is the logarithm convention of LZ2014 §2.4, p. 5.

- The quotient logarithm followed by the induced quotient exponential is the identity on H¹_e.
- Applying the quotient logarithm to exp(x) gives the class of x modulo Fil⁰ and the image of the fixed crystalline term.
- The quotient logarithm is natural for equivariant maps of de Rham representations and specializes to the ordinary logarithm when the fixed crystalline term maps to zero.

- blochKatoLog K V : blochKatoE K V →ₗ[ℚ_p] D_dR(V) ⧸ Fil^0 (under the injectivity hypothesis).
- blochKatoLog (blochKatoExp x) = x.
- blochKatoExp (blochKatoLog y) = y for y ∈ blochKatoE K V.
- For r ≥ 2, blochKatoLog K (ℚ_p(r)) : H^1(K, ℚ_p(r)) ≃ₗ K·e_r.
- For r = 1 and u ∈ 𝒪_Kˣ, blochKatoLog (κ u) = log_p u · e_1.
- Natural for G_K-maps between representations satisfying the hypothesis.

See HK2011 Remark 1.3.3, p. 9; HK2011 §1.3, p. 8.

*Needs:* §§1.1–1.2; LocalFieldsRamification Layers 1–2 for the unit logarithm.

**Checks.**

- For K = Q_p (p odd), blochKatoLog (κ(1 + p)) = log(1 + p)·e_1 = (p − p²/2 + p³/3 − …)·e_1.
- For a Teichmüller unit ω, blochKatoLog (κ ω) = 0 (κ(ω) is torsion in H^1(K, Z_p(1)) and log_p(ω) = 0).
- blochKatoLog ∘ κ = ColemanIntegration's Iwasawa logarithm on 𝒪_Kˣ (ColemanIntegration §L0.18).
- For V = Q_p, `D_cris^{φ=1}` = Q_p = H^0 but D_dR/Fil^0 = 0 and H^1_e = 0, so blochKatoLog has zero source: H^1_f(K, Q_p) ≠ 0 is not in its domain.
- For the quotient logarithm, V=ℚₚ gives target 0 and V=ℚₚ(2) gives Kd₂. In the linear quotient model D=ℚₚ², Fil⁰=ℚₚe₁ and fixed-term image ℚₚe₂, the quotient target has dimension 0, whereas quotienting by Fil⁰ alone has dimension 1.

### 1.4 Kato's dual exponential

Use NoncommutativeAndEquivariantIwasawa §F.6’s dual exponential and ordered adjunction for K/Q_p finite and V de Rham. In this normalization the dual exponential `exp*_{K,V^*(1)}` : H^1(K, V) → Fil^0 D_dR(V) is the composite H^1(K, V) → H^1(K, B_dR ⊗ V) ≅ D_dR(V), the isomorphism being x ↦ (g ↦ log χ(g)·x) (Kato); its image lies in Fil^0 D_dR(V) and its kernel is H^1_g(K, V). For W=V*(1), write P_W:H^1(K,W)×H^1(K,W*(1))→Q_p for the ordered cup-product pairing, and Q_W:D_dR(W)×D_dR(W*(1))→Q_p for its de Rham pairing followed by trace. The adjunction is `Q_W(x,exp*_{K,W}(y))=P_W(exp_{K,W}(x),y),` with x∈D_dR(W)/Fil^0 and y∈H^1(K,V), identifying W*(1)=V. Reversing both pairings requires the corresponding graded-commutativity sign; their order is part of the convention. This is the positive adjunction of LZ2014 §2.4. With the V-argument first it reads Q_V(exp* x,a)=−P_V(x,exp_W a): a degree-zero swap and a degree-one swap have different signs. The complete cocycle and ordered-pairing transport is regulatorNormalizationComparison in §2.4; §8.18 uses the resulting plus reciprocity sign.

- dualExp K V : H^1(K, V) →ₗ[ℚ_p] Fil^0 D_dR(V).
- ker (dualExp K V) = blochKatoG K V.
- deRhamPairing x (dualExp K V y) = tatePairing (blochKatoExp K V^*(1) x) y.
- dualExp K V is H^1(K, V) → H^1(K, B_dR^+ ⊗ V) ≅ Fil^0 D_dR(V) via ∪ log χ.
- Natural in V; compatible with corestriction and trace (§1.7).

See Berger2003 Introduction, p. 2; Berger2003 §II, p. 13; LZ2014 §2.4, p.5; Theorem B.6 and proof, pp.39–40.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.6; §1.2; ArithmeticGaloisDuality local Tate duality.

**Checks.**

- For K = Q_p and V = Q_p, dualExp (log χ) = 1.
- For V = Q_p(r) with r ≥ 1, dualExp = 0.
- For V = Q_p and x ∈ D_dR(Q_p(1))/Fil^0 = K·e_1: [x, dualExp y] = `⟨exp_{Q_p(1)}(x),` y⟩, matching the Kummer/local class field theory pairing.
- For V = Q_p(1), ker dualExp = H^1_g = H^1 ≠ H^1_f: the kernel is H^1_g, not H^1_f.

### 1.5 Dimensions of the Bloch–Kato subspaces

Let K/Q_p be finite and V a de Rham representation. Then dim H^1_f(K, V) = `dim_{Q_p}` D_dR(V)/Fil^0 + dim H^0(K, V); dim H^1_f/H^1_e = dim `D_cris(V)^{φ=1};` dim H^1_g(K, V) = dim H^1_f(K, V) + dim `D_cris(V^*(1))^{φ=1};` and dim H^1(K, V) = [K : Q_p]·dim V + dim H^0(K, V) + dim H^0(K, V^*(1)).

See BK1990 Corollary 3.8.4 and equation (3.8.5), pp. 355–356; Benois2014 Proposition 2.8.2(i), p. 44; BK1990 §3.7, equations (3.7.1)–(3.7.3), Proposition 3.8 and Corollary 3.8.4, pp. 353–355.

*Needs:* §§1.1–1.2,1.4; NoncommutativeAndEquivariantIwasawa §F.3 local Euler characteristic.

**Checks.**

- V = Q_p(2), K = Q_p: dim H^1_f = 1 = dim H^1.
- V = Q_p(1): dim H^1_f = [K : Q_p] and dim H^1 = [K : Q_p] + 1.
- V = Q_p: dim H^1_f = 1 and dim H^1_g = 1 + dim `D_cris(Q_p(1))^{φ=1}` = 1.

### 1.6 Local duality of the Bloch–Kato conditions

Let K/Q_p be finite and V de Rham. Under the perfect cup-product pairing H^1(K, V) × H^1(K, V^*(1)) → H^2(K, Q_p(1)) = Q_p: H^1_f(K, V^*(1)) = H^1_f(K, V)^⊥, H^1_e(K, V^*(1)) = H^1_g(K, V)^⊥ and H^1_g(K, V^*(1)) = H^1_e(K, V)^⊥. For a G_K-stable lattice T, H^1_f(K, T) and H^1_f(K, V^*(1)/T^*(1)) (propagated conditions; V^*(1)/T^*(1) = Hom(T, `μ_{p^∞}))` are exact annihilators under the induced pairing H^1(K, T) × H^1(K, V^*(1)/T^*(1)) → Q_p/Z_p. For a finite extension K_ℓ/Q_ℓ with ℓ ≠ p and a finite unramified p-primary `G_{K_ℓ}-module` M, H¹_un(K_ℓ,M) and H¹_un(K_ℓ,M^D) are exact annihilators under finite local Tate duality; no unrestricted ramified torsion-module assertion is made.

See BK1990 Proposition 3.8 and its proof, pp. 354–359; Corollary 3.8.4, p. 355; BK1990 §3.7, equations (3.7.1)–(3.7.3), Proposition 3.8 and Corollary 3.8.4, pp. 353–355; Rubin2000 Remark I.7.1, p. 17.

*Needs:* §1.1; NoncommutativeAndEquivariantIwasawa §F.6; SelmerIwasawaCohomology §4.9.

**Checks.**

- V = Q_p: H^1_f(Q_p) = H^1_ur is the annihilator of H^1_f(Q_p(1)) = Kummer image of units, which is local class field theory's statement that units are the norms killing unramified characters.
- V = Q_p(2), V^*(1) = Q_p(−1): H^1_f(Q_p(2)) = H^1 and H^1_f(Q_p(−1)) = 0 are annihilators.
- Restriction to a ramified field where V becomes semistable is not an equality test for H_f(K,V); the direct proof must work before that restriction.

### 1.7 Twists, restriction and corestriction for the Bloch–Kato maps

Let L/K be a finite extension of finite extensions of Q_p and V de Rham over K. (a) Restriction: `res_{L/K}` ∘ `exp_{K,V}` = `exp_{L,V}` ∘ ι, with ι : D_dR,K(V) → L ⊗_K D_dR,K(V) = D_dR,L(V) the inclusion. (b) Corestriction: `cor_{L/K}` ∘ `exp_{L,V}` = `exp_{K,V}` ∘ `Tr_{L/K},` and `Tr_{L/K}` ∘ exp*_L = exp*_K ∘ `cor_{L/K}.` (c) Twisting: for i ∈ Z, D_cris(V(i)) = D_cris(V) ⊗ e_i and D_dR(V(i)) = D_dR(V) ⊗ e_i with Fil^j shifted by i and φ multiplied by `p^{−i};` a chosen basis of Q_p(i) does not induce a canonical finite-level cohomology isomorphism H^1(K, V) ≅ H^1(K, V(i)), and twisting enters the exponentials only through Iwasawa cohomology (the supplier contract “Twisting local Iwasawa cohomology by characters of G_∞”). (d) Shapiro: for V a representation of G_L, H^1(K, Ind_L^K V) ≅ H^1(L, V) carries H^1_f to H^1_f and `exp_{K, Ind V}` to `exp_{L, V}` under D_dR,K(Ind V) = D_dR,L(V).

See Berger2003 Proof of Theorem II.2, p. 11; Rubin2000 Appendix B, Corollary 5.2, p. 157.

*Needs:* §§0.1,1.2–1.4; ArithmeticGaloisDuality restriction, corestriction and Shapiro maps.

**Checks.**

- For L/K unramified of degree f and V = Q_p(2): cor ∘ exp_L = exp_K ∘ Tr, so log_BK on H^1(K, Q_p(2)) of a corestricted class is the trace.
- Although H^1(Q_p,Q_p) and H^1(Q_p,Q_p(1)) both have dimension 2, their geometric subspaces H^1_g have dimensions 1 and 2 respectively. A choice of representation basis does not supply a Galois-equivariant finite-level twisting isomorphism compatible with these conditions.

- For the identity extension K/K, trace and corestriction are identity; at V=ℚ₅(2), log_BK(exp(25d₂))=25d₂ on either side.

### 1.8 The Bloch–Kato conditions for Tate twists

Let K/Q_p be finite. (i) V = Q_p: H^1_e = 0, H^1_f = H^1_g = H^1_ur (dimension 1). (ii) V = Q_p(1): H^1_e = H^1_f = κ((O_K^×)^∧ ⊗ Q_p) of dimension [K : Q_p], H^1_g = H^1 (dimension [K : Q_p] + 1); exp_BK(log_p u·e_1) = κ(u) for u ∈ O_K^× and log_BK ∘ κ = log_p. (iii) V = Q_p(r), r ≥ 2: H^1_e = H^1_f = H^1_g = H^1(K, Q_p(r)) of dimension [K : Q_p], and exp : K·e_r ≅ H^1(K, Q_p(r)). (iv) V = Q_p(r), r ≤ −1: H^1_e = H^1_f = H^1_g = 0 while dim H^1 = [K : Q_p]. Integrally: H^1_f(K, Z_p(1)) = (O_K^×)^∧ and H^1_f(K, Z_p(r)) = H^1(K, Z_p(r)) for r ≥ 2.

See HK2 Appendix A, p. 46; HK2011 §1.3, p. 8.

*Needs:* §§1.2–1.7; LocalGaloisGroups Layer 7; KTheoryFiniteLocalFields Layer 6.

**Checks.**

- K = Q_5, r = 2: H^1(Q_5, Q_5(2)) ≅ Q_5 via log_BK.
- K = Q_p, V = Q_p(−1): H^1 ≠ 0 but H^1_g = 0 (a non-split extension 0 → Q_p(−1) → E → Q_p → 0 is never de Rham).

- For K=ℚ₅ the dimension tuple (H¹_e,H¹_f,H¹_g,H¹) at r=0,1,2 is respectively (0,1,1,2), (1,1,2,2), (1,1,1,1).

### 1.9 The Bloch–Kato logarithm of Kummer classes of abelian varieties

Let K/Q_p be finite and A/K an abelian variety with good reduction, V = V_pA. Then H^1_e(K, V) = H^1_f(K, V) = H^1_g(K, V) = κ(A(K) ⊗ Q_p), with κ the Kummer map; D_dR(V)/Fil⁰ ≅ Lie(A/K) as K-vector spaces; and log_BK ∘ κ = log_A on A(K) ⊗ Q_p, where log_A : A(K) → Lie(A) is the logarithm of the formal group (extended to A(K) by finite index). For an isogeny or a quotient map π : A → B of abelian varieties with good reduction, log_BK is natural: log_B(π(x)) = dπ(log_A(x)). Pairing with an invariant differential ω ∈ Fil^0 D_dR(V^*(1)) = H^0(A, Ω^1) gives ⟨log_BK κ(P), ω⟩ = log_ω(P).

See Berger2003 Introduction, p. 2; Rubin2000 §I.6.4, (9), p. 16.

*Needs:* §§1.2–1.7; SelmerIwasawaCohomology §4.26; AbelianSchemesAndArithmeticModuli §A4.3; NeronModelsAndSemistableAbelianVarieties §5.3.

**Checks.**

- For an elliptic curve E/Q_p with good reduction and P ∈ E_1(Q_p) (kernel of reduction), log_BK κ(P) = `log_{Ê}(P)` ∈ Lie(E/Q_p).
- For a quotient π : J_0(N) → E, `log_{E,ω_E}(π(x))` = c_π·AJ_dR(x)(ω_f) when π^*ω_E = c_π ω_f; c_π is not assumed to be 1.
- For a torsion point P, both κ(P) after rationalization and log_A(P) vanish; a map sending every point to its chosen affine coordinate fails this test.

### 1.10 The integral Bloch–Kato logarithm for unramified fields

Let p be odd, L/Q_p finite unramified and 2 ≤ r ≤ p − 2. Then H^1(L, Z_p(r)) is torsion-free of rank [L : Q_p], H^1_f(L, Z_p(r)) = H^1(L, Z_p(r)), and log_BK(H^1(L, Z_p(r))) = (r − 1)!·p^r·O_L·e_r = p^r·O_L·e_r. For r = 1, log_BK(H^1_f(L, Z_p(1))/tors) = p·O_L·e_1. For 2≤r≤p−2, equivalently, Fontaine's map ∂^r : L → H^1(L, Q_p(r)), the connecting map for that supplier contract's twisted arrow p⁻ʳφ−1, equals `+exp_BK ∘ (1 − p^{−r}σ)^{−1}` and maps O_L isomorphically onto H^1(L, Z_p(r)), because `(1 − p^{−r}σ)^{−1}O_L` = p^r O_L. The statement is not asserted for ramified L, for r ≥ p − 1, or for p = 2.

To prove an equality of lattices, use the trace construction in BNQD2002 §2.2.2–§2.3.2, pp. 649–652, as well as its index formula. At the first cyclotomic level the trace of Ξᵣ,₁(a(1+X)) is

```text
−pʳ(1−pʳ⁻¹σ⁻¹)(1−pʳσ⁻¹)⁻¹σ⁻¹(a).
```

For r≥2 the three operators after pʳ are automorphisms of 𝒪_L. The torsion obstruction H⁰(L,ℚₚ/ℤₚ(r−1)) vanishes in the displayed range. The source's comparison diagram therefore gives exactly (r−1)!·pʳ𝒪_L after taking the Bloch–Kato logarithm. An index computation alone would not identify this sublattice. The sign follows from a comparison of lifts. For a∈L choose b∈FilʳB_cris with (p⁻ʳφ−1)b=a, and put c=b·t⁻ʳ⊗vᵣ. Then (φ−1)c=a·dᵣ and c has zero image in (B_dR/B_dR⁺)⊗ℚₚ(r). Put q=(1−p⁻ʳσ)⁻¹(a)·dᵣ. Since (1−φ)q=a·dᵣ, c+q is φ-fixed, lifts q in the de Rham quotient and has coboundary (g−1)c. Thus ∂ʳ(a)=exp_BK(q), with a plus sign for the prescribed positive boundary. Equivalently, in the crystalline cokernel the pair (−a·dᵣ,0) is congruent to (0,q). This compares the actual arrows; it does not infer a sign from equality of their lattice images.

See BNQD2002 Lemme 1.3.2, p. 647; BNQD2002 Théorème 2.1, p. 648; source FontaineBPR1994, §2.1, p. 153.

*Needs:* §§0.1,1.3,1.8; SelmerIwasawaCohomology §4.7; KTheoryFiniteLocalFields Layer 6.

**Checks.**

- L = Q_5, r = 2: log_BK(H^1(Q_5, Z_5(2))) = 25Z_5·e_2; consistent with Li_2(ω(2)) ≡ 25 mod 125.
- Index check: `q^r·|(r−1)!|^{−N}` equals [O_L : p^r O_L] = q^r for r ≤ p − 2.
- For p = 3 and r = 2 the range 2 ≤ p − 2 fails and H^1(Q_3, Z_3(2)) has torsion Z/3.
- For L=ℚ₅,r=2,a=1, ∂²(1)=exp_BK((25/24)d₂). Replacing the arrow p⁻²φ−1 by 1−p⁻²φ while keeping the same input would give its negative.

### 1.11 Semilocal Bloch–Kato maps

For a finite étale Q_p-algebra A = ∏_v K_v (for instance F ⊗ Q_p = `∏_{v|p}` F_v for a number field F) and a p-adic representation V of `G_{Q_p}` (or a family V_v of de Rham representations of the `G_{K_v}),` put H^1(A, V) := ⊕_v H^1(K_v, V), H^1_*(A, V) := ⊕_v H^1_*(K_v, V) for * ∈ {e, f, g}, D_dR(A, V) := ⊕_v D_dR,K_v(V), and define `exp_{A,V}` and `exp*_{A,V}` componentwise. Define `log_{A,V}` on ⊕_v H^1_e(K_v,V_v) only when `D_cris,K_v(V_v)^{φ=1}` = H^0(K_v,V_v) for every v. Under Shapiro's isomorphism H^1(Q_p, `Ind_{K_v}^{Q_p}` V) ≅ H^1(K_v, V) these are the Bloch–Kato maps of the induced representation (§1.7 (d)). For a number field F the semilocal Kummer map E_F ⊗ Q_p → H^1_f(F ⊗ Q_p, Q_p(1)) composed with log is the unit regulator of §3.5.

- semilocalBlochKatoF A V : Submodule ℚ_p (⨁ v, H^1(K_v, V)).
- semilocalBlochKatoExp A V := ⨁ v, blochKatoExp K_v V.
- The componentwise logarithm on ⨁ v, blochKatoE K_v V. It requires injective exp at every factor, and is its inverse on the direct sum of the images.
- Under Shapiro's isomorphism, semilocalBlochKatoExp A V = blochKatoExp ℚ_p (Ind_A V).
- For A = A' × A'', the semilocal maps are the direct sums of those of A' and A''.

See Rubin2000 Chapter II §2, p.25; HK2 §2.3, discussion following Proposition 2.3.2, p.21.

*Needs:* §§1.1–1.3,1.7; NumberFieldArithmetic Layer 5 for the semilocal decomposition.

**Checks.**

- For F = Q(√2), p = 7: `dim_{Q_7}` semilocalBlochKatoF (F ⊗ Q_7) Q_7(1) = 2.
- For A = 0 all semilocal groups are 0.
- For A = K a field, the semilocal maps are the local maps of Layer 1.
- For p odd and A = Q_p × Q_p, let c = κ(1+p) ≠ 0 in H^1_f(Q_p,Q_p(1)). Both (c,0) and (0,c) belong to semilocalBlochKatoF A Q_p(1) and are independent; replacing this group by the one-dimensional diagonal {(x,x)} fails. The two-factor group agrees with H^1_f(Q_p,Q_p(1) ⊕ Q_p(1)).

### Examples

For K=ℚ₅ and r=2, the rational logarithm identifies all H¹ with ℚ₅d₂, but the integral lattice maps to 25ℤ₅d₂. For r=1 only the finite unit subspace is identified with the de Rham line; a uniformizer Kummer class is outside that subspace. For F=ℚ(√2), p=7 splits and the semilocal target has two independent ℚ₇ coordinates.

### Dependencies

Layer 0; NoncommutativeAndEquivariantIwasawa §F.6; PhiGammaModulesAndIwasawaCohomology §5.7; SelmerIwasawaCohomology §4.9 and local Tate duality; SelmerIwasawaCohomology §4.26; KTheoryFiniteLocalFields Layer 6; LocalGaloisGroups Layer 7 for local units; AbelianSchemesAndArithmeticModuli §A4.3; NeronModelsAndSemistableAbelianVarieties §5.3.

## Layer 2: Iwasawa comparison and choices

Use the odd-prime cyclotomic conventions above. The canonical comparison itself is supplied by PhiGammaModulesAndIwasawaCohomology; this layer exposes exactly which choices the regulator formulas depend on.

### 2.1 Independence of the generator of Γ

For generators γ, γ' = γ^a (a ∈ Z_p^×) of Γ_n, u := (γ − 1)/(γ' − 1) is a unit of Λ, and the cochain map `ι_{γ,γ'}` := (u, u ⊕ id, id) : `C_{φ,γ}` → `C_{φ,γ'}` is an isomorphism with `ℓ(γ)[c_{x,y}]` = `ℓ(γ')[c_{ux,y}]` in H^1. Hence the level-n formula of the Fontaine-isomorphism supplier contract (b) does not depend on γ_n, and replacing γ by γ^a only changes the variable X = γ − 1 of Λ to (1 + X)^a − 1. For γ' = γ^m with p ∤ m, PhiGammaModulesAndIwasawaCohomology Layer 3's generator map equals `Q_m·ι_{γ,γ^m}` on H^1.

See CC99 Lemme I.4.2, p. 7; Berger2003 Proposition I.8, p. 110.

*Needs:* PhiGammaModulesAndIwasawaCohomology Layers 3,5; PadicMeasuresIwasawaAlgebras completed group algebras.

**Checks.**

- γ' = `γ^{−1}:` u = −γ, X ↦ (1 + `X)^{−1}` − 1.
- The independence statement in Berger's Proposition I.8 is an exercise there; this comparison supplies it.
- With γ′=γ² at odd p, u=(1+γ)⁻¹ has augmentation 1/2, while ℓ(γ′)=2ℓ(γ); the normalized cohomology class is unchanged.

### 2.2 Changing the compatible system of roots of unity

Let a ∈ Z_p^×, σ_a ∈ G_∞ with χ(σ_a) = a, ε' = σ_a(ε) = ε^a. (i) The embeddings ι_ε : `A_{Q_p}` → Ã (π ↦ [ε] − 1) satisfy `ι_{ε'}` = ι_ε ∘ γ_a on A, A^+ and B^+_rig; D(T), N(T), ψ, the G_∞-action and `h_{Iw,T}` are unchanged. (ii) t' = a·t, e'_j = a^j e_j, ∂' = `a^{−1}∂;` the localisation maps ι_n are unchanged as maps (coordinates ζ' = ζ^a). (iii) For the Mellin transform M_ε(λ) = λ·(1 + π_ε): `M_{ε'}(λ)` = M_ε(λσ_a), so `M_{ε'}^{−1}` = `[σ_a]^{−1}M_ε^{−1}.` (iv) Twisting by e'_j is a^j times twisting by e_j. (v) Coleman power series: `f^{ε'}_u(π_{ε'})` = f^ε_u(π_ε) in A^+ and `Δ(f^{ε'}_u)` ⊗ e'_1 = Δ(f^ε_u) ⊗ e_1.

See LZ2014 Remark 4.16, p. 20.

*Needs:* §0.1; PhiGammaModulesAndIwasawaCohomology §§5–6; ColemanPowerSeries Layers 1–2; LocallyAnalyticDistributions §3.3.

**Checks.**

- The regulator distribution changes by `[σ_a]^{−1}` (Loeffler–Zerbes 2014, Remark 4.16), as §8.17 records.
- a = −1: t' = −t and e'_1 = −e_1, so ⊗e_1 changes sign while h_Iw does not.
- For a=2 at odd p, v′₁=2v₁ and t′=2t, so d′₁=d₁; changing only the Tate vector would give 2d₁.

### 2.3 Specialisation of Iwasawa classes at characters

For x ∈ H^1_Iw(Q_p, T) and a continuous character η of G_∞, put x_η := `Tw_{η^{−1}}(x)` ∈ H^1_Iw(Q_p, `T(η^{−1}))` and `x_{η,n}` := pr_n(x_η) ∈ `H^1(Q_p(μ_{p^n}), T(η^{−1})).` (a) `(λx)_{η,0}` = `η(λ)x_{η,0}` for λ ∈ Λ. (b) If x = h_Iw(y) and η = χ^jω with ω of conductor p^m, then for n ≥ max(m, 1): `x_{η,n}` = `pr_n(h_{Iw,T(η^{−1})}(y ⊗ e_{−j} ⊗ e_{ω^{−1}}))` and `x_{η,0}` = `cor_{Q_p(μ_{p^n})/Q_p}(x_{η,n}),` independent of n. (c) With T' = `T(η^{−1}):` 0 → `(H^1_Iw(T')_{Γ_1})^Δ` → H^1(Q_p, T') → `(H^2_Iw(T')^{Γ_1})^Δ` → 0.

- charSpecialization η : H1Iw T →ₗ[O_E] H^1(ℚ_p, T(η⁻¹)).
- charSpecialization η (λ • x) = η(λ) • charSpecialization η x.
- charSpecialization η (h y) = cor (pr_n (h (y ⊗ `e_{−j}` ⊗ `e_{ω⁻¹})))` for n ≥ max(m,1).
- The descent exact sequence (c).

See LZ2014 Definition 4.14, p. 20; Berger2003 §II, p. 118.

*Needs:* PhiGammaModulesAndIwasawaCohomology §§5.1–5.4; SelmerIwasawaCohomology Iwasawa descent and twists.

**Checks.**

- charSpecialization 1 = pr_0.
- charSpecialization η 0 = 0.
- For ω of conductor p, the formula of (b) gives the same class for n = 1 and n = 2.
- Character specialization at η is Λ-linear when the target action is λ·y=η(λ)y; relative to its scalar-only description it is η-semilinear. At η=χ the element σ₋₁ acts by −1, exactly as this linearity requires. At zero both scalar expressions vanish.

### 2.4 Kummer classes and Coleman power series

Take T=ℤₚ(1). For a norm-compatible principal unit system u∈U_∞ with Coleman series f_u, let Δf_u=(1+π)f′_u/f_u. The fixed cocycle normalization gives

```text
fontaineIwasawaEquiv_kummer:
  h_Iw(Δf_u ⊗ v₁) = κ_Iw(u).
kummerColemanSign = +1.
```

Here κ uses τ(α)/α. The vector lies in `N(ℤₚ(1))^{ψ=1},` and §2.2(v) makes it independent of ε.

**Comparison of cocycles.** Put y=(log f_u)d₁ in B⁺_rig⊗D_cris(ℚₚ(1)). Coleman norm compatibility gives ψy=y and ∇₀y=t∂y=Δf_u⊗v₁. Berger2003 TheoremII.3 with h=1, applied to the explicit Fontaine cocycle, gives pr_n h(Δf_u⊗v₁)=exp_BK(log(u_n)d₁)=κ(u_n) with §1.2's positive boundary. This determines the sign on the nontorsion quotient, but does **not** yet prove the full Iwasawa equality: a Tate-root system survives in H¹_Iw even though all its finite-level rational Kummer classes vanish.

Retain the actual compatible cocycles to finish the comparison. If `α_{n,m}^{pᵐ}=u_n` and `τ(α_{n,m})/α_{n,m}=ε_m^{c_n(τ)},` the period lift b_n=log[α_n]·t⁻¹⊗v₁ has (τ−1)b_n=c_n(τ)v₁. Use these positive lifts in the period limit of CC99 §IV.3, and denote that limit by L⁺; its logarithm uses (τ−1)b_n, so L⁺ is the negative of the transform defined there using (1−τ)b_n. The multiplicative-limit calculation of CC99 LemmaV.3.1 and PropositionV.3.2(i)–(ii), pp.26–27, now gives

```text
L⁺(κ(u)) = t⁻¹ log[ι(u)] ⊗ v₁,
T_n L⁺(κ(u)) = (log φ⁻ⁿ(f_u)) d₁.
```

Here T_n is CC's normalized period trace, not the ordinary field trace. For a class c whose finite-level projections lie in H¹_e, and n sufficiently large as in CC99 TheoremIV.3.3, recompute that theorem with these positive lifts: expand the normalized Herr cocycle of §II.1 in K_n((t)), apply the logχ description of the dual exponential to each χ⁻ᵏ twist (CC99 TheoremIV.2.1, pp.20–22), and collect its Laurent coefficients. Explicitly, if T_nL⁺(c)=Σ_k `a_{k,n}tᵏ,` its derivative has coefficient k `a_{k,n};` the positive logχ formula identifies k `a_{k,n}tᵏ` with the dual-exponential coordinate of `pr_n(Tw_{χ⁻ᵏ}c).` The all-twist expansion of h_Iw⁻¹(c) in CCIV.2.1 has these same coefficients. Differentiation fixes D_dR(V), so d₁ is constant and v₁=t d₁ is not. The result is

```text
p⁻ⁿ φ⁻ⁿ(h_Iw⁻¹(c)) = t(d/dt) T_n L⁺(c).
```

The positive sign also follows by substituting the positive exponential lift from BergerII.3 into that cocycle; the logχ terms are computed explicitly in BergerII.6. With CC's (1−τ) definition of L instead, this comparison has a minus sign. Thus CC's printed IV.3.3 and the isolated (1−τ) lift in V.3.2 cannot both be carried unchanged to the positive convention. Substituting the preceding unit formula and φ⁻ⁿ∂=pⁿ(d/dt)φ⁻ⁿ gives h_Iw⁻¹κ(u)=Δf_u⊗v₁ in the full rational Iwasawa module. The computation takes place on cocycles before the period limit, so it retains the Tate-root component. Finally H¹_Iw(T) has no ℤₚ-torsion, and its injection into H¹_Iw(T)[1/p] gives the integral equality. No integral inverse to γ_n−1 is used.

For the Tate-root system itself f=1+π, b_n=p⁻ⁿv₁, pⁿb_n=v₁ and T_nL⁺=p⁻ⁿt d₁. Its t-derivative is nonzero, giving h_Iw⁻¹κ(ε)=v₁. There is also a direct integral check: put a=χ(γ_n)∈1+pⁿℤₚ. The fixed Herr cocycle for v₁ is (log(a)/(a−1))p⁻ⁿ(χ(τ)−1)v₁, whereas the compatible-root Kummer cocycle is p⁻ⁿ(χ(τ)−1)v₁. Since log(a)/(a−1)−1∈pⁿℤₚ for odd p, their difference is an integral coboundary. Thus they agree at every integral level, not only after rationalization. These sign conversions agree with the derivative conclusion of CC99 PropositionV.3.2(iii); they do not change the fixed h_Iw cocycle. Berger2003 RemarkII.17 explicitly warns about the different logarithm signs in CC99 IV.3.1 and the earlier literature.

**regulatorNormalizationComparison.** Transport LZ2014's formulas using the following dictionary, with representation vectors vⱼ and invariant vectors dⱼ kept distinct.

| Object/formula | Dictionary to this roadmap |
|---|---|
| Fontaine h_Iw, normalized Herr cocycle | The cocycle in the supplier contract, unchanged; the unit comparison has sign +1. |
| Bloch–Kato exp and its inverse on H¹_e | Positive boundary (g−1)b, as explicitly computed in Berger2003 TheoremII.3, pp.114–115; exp/log in the interpolation formulas have no extra scalar. |
| Dual exponential | Kato's logχ cocycle, as in Berger2003 TheoremII.6, pp.116–117; unchanged in LZ PropositionsB.1–B.2 and TheoremB.5. Its ordered adjunction is Q_W(a,exp*_W b)=P_W(exp_W a,b). |
| Degree-zero de Rham/crystalline evaluation | `Q_W(a,b)=Q_{W*(1)}(b,a);` no sign from this swap. |
| Degree-one Tate cup | `P_W(a,b)=−P_{W*(1)}(b,a).` In particular Q_V(exp* x,log y)=−P_V(x,y), not +P_V(x,y). |
| Iwasawa pairing | lim_n Σ_g P_V(x_n,g y_n)[g], linear in the first input, inverse-linear in the second. This is the ordered construction in LZ §2.6, equation(1). Reversing inputs also applies the group-ring involution and a minus sign. |
| LZ TheoremB.5 interpolation | The displayed exp*/log, Gamma, Euler, conductor and Gauss factors are unchanged (§§8.13–8.15). |
| LZ TheoremB.6 calculation | Its step from Q(exp* x,log y) to the Tate pairing uses an ungraded transpose. For the ordered cup above that step has a minus sign. Consequently its displayed regulator reciprocity sign becomes **+σ₋₁ℓ₀** in §8.18. One cannot keep both that step and the positive adjunction of LZ §2.4 unchanged. Berger TheoremII.16 independently gives the plus sign after converting from Ω to L. |

The local sign discrepancies just identified are recorded at their precise source locations; they do not alter the interpolation maps or permit an unspecified normalization parameter.

See CC99 §II.1, ThéorèmeII.1.3, p.12; TheoremIV.2.1, pp.20–22, §IV.3, p.23, LemmaV.3.1/PropositionV.3.2, pp.26–27; Berger2003 TheoremsII.3,II.6, pp.114–117, and TheoremII.16/RemarkII.17, pp.122–123; LZ2014 §2.4, p.5, §2.6, pp.6–7, AppendixB, pp.36–40.

*Needs:* §§1.2,1.4,2.1–2.3; PhiGammaModulesAndIwasawaCohomology §§5.1–5.7; ColemanPowerSeries Layers 1–2; LocalGaloisGroups Layer 7.

**Checks.**

- For a=1+p, f_u(π)=((1+π)ᵃ−1)/π and Δf_u=a(1+π)ᵃ/((1+π)ᵃ−1)−(1+π)/π. The cocycle calculation sends this nonconstant derivative to +κ(u).
- The source's (1−τ) lift by itself represents −κ(u) under the fixed positive Kummer convention; using it without the conversion fails the preceding comparison. The derivative identity alone is insufficient to select a sign.
- Under ε↦εᵃ, the derivative acquires a⁻¹ and v₁ acquires a; Δf_u⊗v₁ is unchanged.
- For f=1+π, Δf=1 and h_Iw(v₁)=κ_Iw(ε)≠0, although each finite-level rational Kummer class is zero. A proof using only those rational classes fails this Check.
- At p=5, `P_{ℚ₅(1)}(κ(6),logχ)=log₅(6)≠0` (geometric reciprocity normalization), whereas `P_{ℚ₅}(logχ,κ(6))=−log₅(6).` After division by log₅(6), this is the alternating two-coordinate model det[[1,0],[0,1]]=1 and det[[0,1],[1,0]]=−1. The model checks the arithmetic sign; the cohomological identification is the positive adjunction above.
- Over the unramified quadratic extension K/ℚ₅, the same unit 6 has norm 36, so logχ(rec_K(6))=log₅(36)=2log₅(6). Using exponent 6 instead of its norm would incorrectly give log₅(6).

### Examples

Replacing γ by γᵃ rescales the explicit cocycle and its logarithmic normalizer in opposite directions. Replacing ε by εᵃ changes both v₁ and the differential: their product remains intrinsic. The explicit unit series for a=1+p below tests the positive Kummer comparison and the ordered pairing sign.

### Dependencies

Layer 1; PhiGammaModulesAndIwasawaCohomology §§5–6; ColemanPowerSeries Layers 1–2; SelmerIwasawaCohomology local Kummer and Iwasawa modules; LocalGaloisGroups Layer 7.

## Layer 3: local logarithms and dilogarithms

Fix the Iwasawa logarithm. The local constructions extend over a finite étale ℚₚ-algebra component by component; a nonzero element of a product algebra need not be a unit.

### 3.1 Coleman's p-adic dilogarithm on a finite étale Q_p-algebra

Let A be a finite étale Q_p-algebra, with its canonical decomposition A = `∏_{i∈I}` A_i into finite field extensions A_i/Q_p (the primitive idempotents). Put A^adm := {z ∈ A : z_i ∉ {0, 1} for every i}. For a finite extension M/Q_p and x ∈ M ∖ {0, 1} define D_M(x) := `ι^{-1}(D^0(ι(x)))` for any Q_p-embedding ι : M → C_p, where D^0(z) = Li_2(z) + ½·log_p(z)·log_p(1 − z) is Coleman's dilogarithm for the Iwasawa branch log_p(p) = 0 (ColemanIntegration §L2.18 with a = 0); it lies in M and does not depend on ι. Define D_A : A^adm → A by D_A(z) := `(D_{A_i}(z_i))_{i∈I},` and extend it additively to D_A : Z[A^adm] → A on the free abelian group of formal symbols [z]. This is GSWZ's D_p of (174) applied factor by factor.

- etaleDilog A : A → A is a componentwise total extension of the map on A^adm, assigning 0 at 0 and 1 in each field factor. Only its restriction to A^adm has mathematical content; it is not required to be zero as an entire vector whenever one component is inadmissible.
- etaleAdmissible z : every component of z differs from 0 and 1 (the domain A^adm).
- For A = ∏_i A_i and admissible z, (etaleDilog A z)_i = etaleDilog A_i z_i.
- For a finite field extension M ⊂ C_p of Q_p and x ∈ M ∖ {0,1}, etaleDilog M x = D^0(x), Coleman's D for the Iwasawa branch.
- For a Q_p-algebra homomorphism f : A → B of finite étale algebras with f(A^adm) ⊆ B^adm, etaleDilog B (f z) = f (etaleDilog A z).
- etaleDilog A (1 − z) = −etaleDilog A z for admissible z.
- etaleDilog A z⁻¹ = −etaleDilog A z for admissible z.
- For x, y ∈ A^adm with x − y a unit, D(x) − D(y) + D(y/x) − D((1 − x⁻¹)/(1 − y⁻¹)) + D((1 − x)/(1 − y)) = 0 componentwise (ColemanIntegration §L2.Fb).
- For ζ ∈ A with ζ^m = 1 and all components ≠ 1, etaleDilog A ζ = (Li_2(ζ_i))_i, since log_p vanishes on roots of unity.
- The additive extension FreeAbelianGroup A^adm →+ A, [z] ↦ etaleDilog A z.
- Two dilogarithm values in a finite product agree iff all component values agree. The additive extension is determined by its values on admissible FreeAbelianGroup generators; it preserves zero and addition, whereas D_A on admissible points is not an additive map.
- etaleDilogHom D (FreeAbelianGroup.of z) = etaleDilog D z.val for z∈A^adm.

See GSWZ2024 §3.1, (174), p. 37; GSWZ2024 §3.1, paragraph after (174), p. 38; BdJ2003 §1, sentence on Galois equivariance immediately before Remark 1.5, p. 3.

*Needs:* ColemanIntegration §§L0.15,L2.18,L2.Fb; NumberFieldArithmetic Layer 5 for finite-product coordinates.

**Checks.**

- For p odd, etaleDilog Q_p (−1) = 0: the inversion relation gives D(−1) = −D(−1).
- For p = 5 and ω=ω(2) (a primitive 4th root of unity), etaleDilog Q_5 ω ∈ 25·Z_5 and etaleDilog Q_5 ω ≡ 25 mod 125 (by §5.3, since `li_{2,5}(2)` = 1 in F_5); this is the Q_5-component of D_5(ζ_24) in GSWZ (273).
- For the zero algebra A = 0 (empty product), A^adm = {0} and etaleDilog A 0 = 0.
- For the diagonal Q_p → Q_p × Q_p and x ∉ {0,1}, etaleDilog (Q_p × Q_p) (x, x) = (D^0(x), D^0(x)), agreeing with ColemanIntegration's D^0.
- With the branch log_1 (log_1(p) = 1) instead of the Iwasawa branch, D^1(p) − D^0(p) = ½·log_p(1 − p) ≠ 0 (ColemanIntegration §L2.18 (d)); a definition with an unpinned branch is wrong at z = p ∈ Q_p^adm.

### 3.2 Frobenius and extension-of-scalars squares for the p-adic dilogarithm

Let A → B be an injective homomorphism of finite étale Q_p-algebras (for instance K ⊗ Q_p → K' ⊗ Q_p for an extension of number fields K ⊂ K', or the inclusion of a factor-wise extension of local fields). (a) Extension of scalars: for z ∈ A^adm, D_B(ι z) = ι(D_A(z)). (b) Automorphisms: for every Q_p-algebra automorphism τ of A, D_A(τ z) = τ(D_A(z)); in particular, for a finite unramified product A with Frobenius φ_A (the arithmetic-Frobenius supplier contract), D_A(φ_A z) = φ_A(D_A(z)) and D_A(ζ^p) = φ_A(D_A(ζ)) for every root of unity ζ of order prime to p with all components ≠ 1. (c) Trace: if B is free over A, then `Tr_{B/A}(D_B(ι z))` = [B : A]·D_A(z) for z ∈ A^adm. (d) Frobenius-modified value: for A unramified and ζ ∈ μ(A) of order prime to p with all components ≠ 1, (1 − `p^{-2}φ_A)(D_A(ζ))` = ℓ_2(ζ), the integral modified dilogarithm of ColemanIntegration §L2.13, which lies in O_A. (e) Frobenius behaviour on residue discs of special units: for p odd, A unramified and z ∈ O_A with z and 1 − z units in every factor, D_A(z) − `p^{−2}D_A(z^p)` = `Li^{(p)}_2(z)` − `½·log_p(z)·Li^{(p)}_1(z)` componentwise, and this lies in O_A `(Li^{(p)}_k = ℓ_k is bounded by 1 off the residue disc of 1, and log_p(z) ∈ pO_A).`

See GSWZ2024 §3.1, (176), p. 38; BdJ2003 Remark 1.13, p. 6.

*Needs:* §3.1; Tau Ceti Frobenius and Teichmüller supplier contracts; ColemanIntegration §L2.13.

**Checks.**

- In the cubic example, modulo 5, α⁵=4α+4 and φ(4α²+4α+2)=4α²+4α+2. Thus p⁻²D(ζ₂₄⁵) has that same leading coefficient. The second row of GSWZ (273), with leading coefficient 2α²+3α+1, belongs to ζ₂₄². On the quadratic factor α²+α+2=0 these coefficients are 4 and α+2; on the linear factor α=2 they are 1 and 0. The second row cannot test the Frobenius identity.
- For p>3, (1−p^(−2)φ)D(ζ)=ℓ_2(ζ) exactly and D(ζ)∈p²O_A. When ℓ_2(ζ) is a unit, the two values generate lattices differing by p²; no unit claim is made for every ζ.

- For A=ℚ₅ and ζ=−1, D(ζ)=D(ζ⁵)=0 and (1−5⁻²)D(ζ)=0; integrality does not mean that every root value is a unit.

### 3.3 The combined p-adic dilogarithm of a number field

Let K be a number field, p a prime and K_p := K ⊗_Q Q_p, a finite étale Q_p-algebra identified with `∏_{v|p}` K_v by Tau Ceti's semilocal equivalence (NumberFieldArithmetic layer 5). Define `D_{K,p}` on the free abelian group Z[K^×] by [z] ↦ `D_{K_p}(z ⊗ 1)` for z ≠ 1 (§3.1; z ⊗ 1 is admissible) and [1] ↦ 0. Its v-component is D_σ([z]) = D^0(σ_v(z)) for the embedding σ_v : K → K_v ⊂ C_p, as in GSWZ §3.1. `D_{K,p}` kills the five-term relations, hence factors through the pre-Bloch group P(K) of K3BlochGroups §3.4, and restricts to `D_{K,p}` : B(K) → K_p on Suslin's Bloch group B(K)=ker ∂ of K3BlochGroups §3.5. This is ColemanIntegration §L2.Fb's evaluation transported to those carriers. On B(K) the map does not depend on the branch of the logarithm used to define D. The inversion symbols ⟨x⟩=[x]+[x⁻¹] generate a subgroup of P(K) killed by two, which need not lie in B(K) (K3BlochGroups §3.6); the inversion law D(x⁻¹)=−D(x) makes preBlochDilog vanish on it.

- combinedDilog K p : FreeAbelianGroup Kˣ →+ K ⊗[ℚ] ℚ_[p], with [1] ↦ 0.
- combinedDilog K p [z] = etaleDilog (K ⊗ ℚ_[p]) (z ⊗ 1).
- Under K ⊗ Q_p ≅ `∏_{v|p}` K_v, the v-component of combinedDilog K p [z] is D^0(σ_v z).
- combinedDilog vanishes on the five-term subgroup, giving preBlochDilog K p : P(K) →+ K ⊗ Q_p.
- blochDilog K p : B(K) →+ K ⊗ Q_p, the restriction of preBlochDilog to Suslin's Bloch group.
- For any branch parameter a ∈ Q_p, the Bloch-group map built from D^a equals blochDilog K p.
- For a field embedding K → K', blochDilog K' p ∘ B(ι) = (ι ⊗ 1) ∘ blochDilog K p.
- For τ ∈ Aut(K), blochDilog K p ∘ B(τ) = (τ ⊗ 1) ∘ blochDilog K p.

See GSWZ2024 §3.1, paragraph after (174), p. 38; GSWZ2024 Example 4.3, (270)–(271), p. 54; BdJ2003 Remark 1.15, p. 6.

*Needs:* §3.1; ColemanIntegration §L2.Fb for the evaluation and branch descent; K3BlochGroups §§3.4–3.6; NumberFieldArithmetic Layer 5.

**Checks.**

- For K = Q, combinedDilog Q p [z] = D^0(z) ∈ Q_p, the ColemanIntegration value.
- combinedDilog K p 0 = 0, and preBlochDilog vanishes on the subgroup of P(K) generated by ⟨x⟩ = [x] + [x⁻¹] for x ≠ 0, 1. This subgroup is not inside B(K) in general: over ℚ, ∂⟨2⟩ = 2⊗(−1) + 2⊗2 = 2⊗(−2) in the antisymmetric square, and the biadditive symmetric pairing (u,v) ↦ v₂(u)s(v) + s(u)v₂(v) mod 2, with s(u)=1 exactly for negative u, kills every u⊗v+v⊗u but sends 2⊗(−2) to 1. So the vanishing statement belongs to preBlochDilog, not to blochDilog; with odd-primary coefficients the subgroup disappears because 2⟨x⟩=0.
- For K = Q(α), α³ − α² + 1 = 0, ξ = 2[1 − α²] + [1 − α] ∈ B(K) and p = 5, blochDilog K 5 ξ = (3·5² + 5³ + 2·5⁴ + …)α² + (5² + 3·5³ + …)α + (2·5² + 3·5³ + …), GSWZ (271).
- On the pre-Bloch group the map depends on the branch: for p odd the symbol [p] ∈ P(Q) has D^1([p]) − D^0([p]) = ½·log_p(1 − p) ≠ 0, so branch independence is not asserted off B(K) ([p] ∉ B(Q) since p ∧ (1 − p) ≠ 0).

### 3.4 Dictionary of dilogarithm and regulator normalisations

Fix the Iwasawa branch. On C_p ∖ {0,1}: (i) GSWZ's D_p(z) = Li_2(z) + ½ log(z) log(1 − z) (GSWZ (174)) equals Coleman's D(z) (ColemanIntegration §L2.18 with a = 0), Besser–de Jeu's L_mod,2(z) = L_2(z) + ½ log(z) L_1(z) = Li_2(z) − ½ log(z) Li_1(z) (BdJ §1, the unique choice for n = 2), and the n = 2 case L^mod_2 = Li_2 + B_1 Li_1 log of ColemanIntegration §L3.14 padicRegulatorPolylog (B_1 = −1/2, Li_1(z) = −log(1 − z)). (ii) Besser–de Jeu's regulator formula carries the factor ±(n − 1)!, which is ±1 for n = 2; BdJ Remark 1.7 records an orientation ambiguity, while ColemanIntegration §L3.Fb.5 fixes the raw coefficient as (−1)ⁿ(n−1)! for the oriented de Jeu map and the Chern-character regulator. The ordinary Chern-class regulator multiplies it by (−1)ⁿ⁻¹(n−1)! (Conventions). Section 4.7 compares the oriented de Jeu classes with Suslin's Bloch classes, and §5.7 transports the result once to the normalized root classes. (iii) Gros's syntomic regulator on an unramified field satisfies reg^Gros = (1 − Frob/p²)·reg^Besser in weight two (BdJ Remark 1.13); on a root of unity ζ of order prime to p it takes the value ℓ_2(ζ) = Li_2(ζ) − `p^{-2}Li_2(ζ^p)` ∈ O, while for p>3 the Besser value Li_2(ζ) lies in p²O (§3.2 (d)). (iv) Forward comparison, established at §4.2 rather than used to prove Layer 3: the Bloch–Kato normalisation: under D_dR(Q_p(2)) = L·e_2, e_2 = `t^{-2}⊗ε^{⊗2},` with t = log[ε] the period of Q_p(1), the regulator of GSWZ is c₂·(log_BK∘r^(et,ch)_2) = −c₂·(log_BK∘c_(2,1)), with c₂ ∈ ℚˣ the universal Suslin–de Jeu constant of §4.7 (§§4.2, 5.7). (v) On roots of unity ζ ≠ 1 every branch gives the same value D(ζ) = Li_2(ζ), and on special units (|z| = |1 − z| = 1) D is branch independent.

See BdJ2003 §1, after (1.4) and before Remark 1.5, p. 3; BdJ2003 Remark 1.13, p. 6; GSWZ2024 §1.5, (19), p. 9.

*Needs:* §§0.1,3.1–3.2; ColemanIntegration §§L2.18,L3.Fb.5–L3.Fb.6,L3.14; §§4.2,4.7,5.7 supply the stated forward comparison.

**Checks.**

- L_mod,2 = D on every z ∈ C_p ∖ {0,1}, checked symbolically from the definitions.
- For p = 5 and ζ = ω(2) ∈ Q_5: Li_2(ζ) ≡ 25 mod 125 while ℓ_2(ζ) = (1 − `5^{-2})Li_2(ζ)` ≡ −1 mod 5 is a unit.

- At z=−1, Li₂(−1)=D(−1)=0, and both the Besser value and its Gros depletion are 0. The nonzero ω(2) Check distinguishes these maps.

### 3.5 Kernel of the logarithm on local units and the p-adic regulator matrix

(a) Let L/Q_p be finite. The Iwasawa logarithm restricts to a continuous homomorphism log_p : O_L^× → L whose kernel is the finite group μ(L) of all roots of unity in L (including those of p-power order, and ±1 when p = 2) and whose image is an open Z_p-submodule of L; hence log_p induces an isomorphism (O_L^×)^∧_p `⊗_{Z_p}` Q_p ≅ L, and for L unramified and p odd it maps U^1_L = 1 + pO_L isomorphically onto pO_L. (b) Let F be a number field with unit rank r = r₁+r₂−1, E_F its unit group and ε_1, …, ε_r a basis of E_F modulo torsion. The global objects are those of IntegralIwasawaTheory: its §2.2 supplies the localization ι_F : E_F ⊗ Z_p → `∏_{v|p}(O_v^×)^∧_p` (the pro-p completion of each local unit group is its principal-unit group), the defect `leopoldtDefect` δ(F,p) = rank ker ι_F and the predicate `LeopoldtConjecture` (δ(F,p) = 0), and its §4.1 supplies `leopoldtLogMap` on O_F^× ⊗ Q_p, `leopoldtDefect_eq_logKernel`, the [F:Q]-by-r logarithm matrix over C_p on a unit basis and `leopoldt_iff_logMatrix_fullRank`. Coleman vectors are rows here, so the matrix used below is its transpose, the r-by-[F:Q] matrix `(log_p σ_j(ε_i))_(i≤r, j≤[F:Q])`, which has the same rank. Define padicUnitRegulatorRank as the abbreviation rr_p(F) := r − δ(F,p). By the two supplied theorems it is the rank over C_p of this r-by-[F:Q] matrix, the Q_p-rank of the image of the unit logarithm (E_F/μ(F)) ⊗_Z Q_p → F ⊗_Q Q_p, and the Z_p-rank of the image of ι_F, and rr_p(F) = r exactly when `LeopoldtConjecture` F p holds.

- padicUnitRegulatorRank F p = r − `leopoldtDefect` F p, a natural number between 0 and r.
- It equals the rank over C_p of the transposed logarithm matrix, independently of the unit basis and of the order of the embeddings, and the Z_p-rank of ι_F(E_F ⊗ Z_p).
- padicUnitRegulatorRank F p = r if and only if `LeopoldtConjecture` F p; this is conjectural in general and holds for every abelian F/Q (IntegralIwasawaTheory §4.4).

See GSWZ2024 §3.1, p.37; Rubin2000 I, Corollary 6.4 and proof, p.16.

*Needs:* LocalFieldsRamification Layers 1–2; LocalGaloisGroups Layer 7; NumberFieldArithmetic unit and semilocal interfaces; IntegralIwasawaTheory §§2.2,4.1,4.4 for the global localization, defect, logarithm matrix and Leopoldt predicate; §1.8.

**Checks.**

- For L = Q_p (p odd), log_p(Z_p^×) = pZ_p and the kernel is `μ_{p−1}.`
- For F=ℚ the unit rank, the defect and padicUnitRegulatorRank are all 0, and the 0-by-1 matrix has rank 0; a zero matrix for a field of positive unit rank has rank 0<r and does not satisfy Leopoldt’s predicate.
- For p = 2 and L = Q_2 the kernel is {±1}: the torsion kernel must include 2-power roots of unity.
- For F = Q(√2), p = 7 and ε = 1 + √2, the 1 × 2 matrix (log_7(1 + √2), log_7(1 − √2)) is the transpose of the supplier's 2 × 1 matrix and has rank 1 by (a), because ε is not a root of unity; so δ(F,7) = 0 and rr_7(F) = 1, as IntegralIwasawaTheory §4.4 requires for this abelian field.

### 3.6 The logarithm takes norms to traces

Let A → B be a finite free extension of finite étale Q_p-algebras (for instance an extension of finite products of p-adic fields, or K ⊗ Q_p → K' ⊗ Q_p for number fields K ⊂ K'). For every u ∈ B^× with log_p defined componentwise, `log_p(N_{B/A}(u))` = `Tr_{B/A}(log_p(u)).` In particular, for an extension of p-adic fields L'/L, log_p ∘ `N_{L'/L}` = `Tr_{L'/L}` ∘ log_p on L'^×, and the same holds on the completed unit groups.

See BdJ2003 §1, sentence on Galois equivariance immediately before Remark 1.5, p. 3.

*Needs:* §3.5; NumberFieldArithmetic Layer 5 norm and trace; ColemanIntegration §L0.18.

**Checks.**

- For L' = `Q_{p²},` L = Q_p and u = ω(α) a Teichmüller unit, both sides vanish.
- Field preservation matters: take L=Q_p, L′/L unramified quadratic and `a∈L′\Q_p.` The C_p-valued branch log_a(p)=a has `log_a(N_{L′/L}p)=2a` but `Tr_{L′/L}(log_a p)=Tr(a)∈Q_p;` these differ. Such a branch does not define an L-valued logarithm on L and is outside the theorem’s hypotheses.

- For L′/ℚ₅ unramified quadratic and u=6, N(u)=36 and both sides equal 2log₅6; the identity extension instead gives log₅6.

### Examples

At a tame root logₚζ=0, so Dₚ(ζ)=Li₂(ζ). Over ℚ₅ the root ω(2) gives Li₂(ω(2))≡25 mod 125. In a product algebra a tuple with one coordinate 1 is outside the special-unit domain even if all other coordinates are admissible. The total componentwise extension still has a value there.

### Dependencies

Layer 0; LocalFieldsRamification Layers 1–2; Tau Ceti Teichmüller API; IntegralIwasawaTheory §§2.2,4.1,4.4 for the global unit logarithm and Leopoldt predicate of §3.5(b); ColemanIntegration polylogarithms and functional equations; K3BlochGroups Layer 3's Bloch presentation with ColemanIntegration §L2.Fb's p-adic evaluation of it.

## Layer 4: Chern classes and syntomic comparisons

The étale Chern map, the syntomic Chern map and their de Rham coordinates are separate maps. This layer states the comparison and the changes of normalization before taking integral completions.

### 4.1 Besser's syntomic regulator

For a smooth R-scheme X (R as in the supplier contract “Rigid syntomic cohomology of smooth schemes over a p-adic integer ring”) and i≥1, j≥1, the additive syntomic Chern classes `c^syn_{i,j}` : K_j(X) → `H^{2i−j}_syn(X, i)` use universal syntomic Chern classes c_i ∈ `H^{2i}_syn(B_•GL_N, i)` — characterised by mapping to the de Rham Chern classes in Fil^i `H^{2i}_dR` — through Gillet's formalism. The syntomic Chern character `ch^syn_{i,j}` is formed from the same universal classes by Newton's identity; it is a ring homomorphism for cup products (Besser2000 Definition 7.6 and Proposition 7.7, author p. 24; BdJ2003 Appendix A, final paragraph, p. 52). On K_j with j≥1 the decomposable universal classes induce zero, so `ch^syn_{i,j}` = ((−1)^(i−1)/(i−1)!)·`c^syn_{i,j}`. On ColemanIntegration §L3.Fb.2’s residue-field domain its regulator is this Chern character; compare it with the compactification-filtered target, and extend that comparison to general perfect residue fields through the universal-class characterization above. In degree j=0 retain ordinary Chern functions on K₀ with Whitney sum, rather than an additive c_i; the total Chern series is multiplicative for direct sum. For X = Spec R and n ≥ 1 the syntomic regulator is the Chern-character regulator reg_syn := η ∘ `ch^syn_{n,2n−1}` : `K_{2n−1}(R)` → K, and the Chern-class regulator is reg^c_syn := η ∘ `c^syn_{n,2n−1}` = (−1)ⁿ⁻¹(n−1)!·reg_syn. Both factor through `K_{2n−1}(R)` ⊗ Q. For general R retain the localization sequence K_(2n−1)(R)⊗ℚ→K_(2n−1)(K)⊗ℚ→K_(2n−2)(k)⊗ℚ. If k is algebraic over 𝔽ₚ and n≥2, both adjacent positive-degree rational residue groups vanish, so localization is an isomorphism and extends the regulator to K. This includes every finite extension of ℚₚ (ColemanIntegration §L3.Fa.1). Both are compatible with finite extensions R → R' (reg_syn,R' ∘ K(ι) = ι ∘ reg_syn,R) and with automorphisms of R, and for n = 1 both are log_p on R^×.

- syntomicChernClass X i j : K_j(X) →+ `H^{2i−j}_syn(X, i),` for i,j≥1. Degree zero uses Whitney sum with ordinary c₀=1; rank is separate, and c_(0,j)=0 for j>0.
- syntomicChernCharacter X i j : K_j(X) →+ `H^{2i−j}_syn(X, i)` for i,j≥1, equal to ((−1)^(i−1)/(i−1)!)·syntomicChernClass X i j; it sends cup products of K-classes to cup products.
- syntomicRegulator R n := η ∘ syntomicChernCharacter (Spec R) n (2n−1) : `K_{2n−1}(R)` → K, ℚ-linear on `K_{2n−1}(R)` ⊗ ℚ; on ColemanIntegration §L3.Fb.2's domain it is that supplier's regulator.
- syntomicChernRegulator R n := η ∘ syntomicChernClass (Spec R) n (2n−1) = (−1)ⁿ⁻¹(n−1)! • syntomicRegulator R n.
- syntomicRegulator R 1 u = syntomicChernRegulator R 1 u = log_p u for u ∈ Rˣ (Iwasawa branch).
- For a finite extension R → R' with fraction fields K ⊂ K', syntomicRegulator R' n ∘ K(ι) = ι ∘ syntomicRegulator R n.
- For an automorphism τ of R, syntomicRegulator R n ∘ K(τ) = τ ∘ syntomicRegulator R n.
- The image of the universal class in Fil^i `H^{2i}_dR(B_•GL_N)` is the de Rham Chern class.

See HK2011 Definition 2.3.3, p. 16; BdJ2003 §1, p. 1; NN2016 Proposition 5.6, p. 57; Besser2000 §§7,9,10; Proposition 8.8 and Proposition 10.3.

*Needs:* KTheoryFiniteLocalFields §§1.8,3.0a; ColemanIntegration §§L3.Fa.1,L3.Fb.2; CohomologyComparisonsPartII §§2.1–2.3; dagger-syntomic-filtration; K2SymbolsBrauer §§9.11,11.1,11.3 for the localization Check.

**Checks.**

- For R = Z_p (p odd) and u = 1 + p, syntomicRegulator Z_p 1 u = log(1 + p) = p − p²/2 + p³/3 − … .
- On ℙ²_R, h=c₁(𝒪(1)) has h²≠0: c₂([𝒪(1)]+[𝒪(1)])=h², although each c₂([𝒪(1)])=0. Degree-zero c₂ is not additive.
- For R = Z_p[ζ_m] with p ∤ m and ζ ≠ 1, syntomicRegulator R 2 [ζ]_2 = Li_2(ζ) in the supplier’s raw convention, the value of ColemanIntegration §L3.15 at n = 2, while syntomicChernRegulator R 2 [ζ]_2 = −Li_2(ζ).
- At n = 3 the same raw cyclotomic class has syntomicRegulator value −2Li_3(ζ) and syntomicChernRegulator value 2·(−2Li_3(ζ)) = −4Li_3(ζ). A change of sign alone does not convert one normalization into the other.
- For units f, g the Chern character sends {f, g} to ch₁(f)∪ch₁(g), whereas the second Chern class sends it to −c₁(f)∪c₁(g). A symbol formula written as the cup product of two weight-one classes is therefore a Chern-character formula (§7.3).
- For R = Z_p, the Gros normalisation (1 − Frob/p²)·syntomicRegulator differs from syntomicRegulator by the factor 1 − `p^{−2}` ≠ 1, so the two are not interchangeable in integrality statements.
- For k=𝔽ₚ(s,t)^perf, R=W(k), K=Frac(R), the localization boundary sends the product-normalized symbol {[s],[t],p} to {s,t}≠0 in K₂(k)⊗ℚ. Over 𝔽ₚ(s,t) its t-residue is s, of infinite order; restriction–norm multiplies by the finite purely inseparable degree, so its rational class survives in the perfect closure. Thus rational localization is not onto here. For k=𝔽_q and n≥2 the adjacent rational residue groups are both zero. These residue and norm conventions are K2SymbolsBrauer §§9.11,11.1,11.3.

### 4.2 The syntomic regulator is the Bloch–Kato logarithm of the étale regulator

Let R be the integer ring of a finite extension K of Q_p and n ≥ 1. The natural map ρ_syn : H^1_syn(Spec R, n) → H^1(K, Q_p(n)) (compatible with Chern classes) equals exp_BK ∘ η, where exp_BK : K = D_dR(Q_p(n))/Fil^0 → H^1(K, Q_p(n)) is the Bloch–Kato exponential (§1.2, with D_dR(Q_p(n)) = K·e_n `(e_n=t^{−n}⊗ε^{⊗n})).` Consequently, on `K_{2n−1}(R):` r^et_n ⊗ Q = exp_BK ∘ reg^c_syn when both regulators use Chern classes, and r^(et,ch)_n = exp_BK ∘ reg_syn when both use Chern characters; each of the two identities follows from the other by the factor (−1)ⁿ⁻¹(n−1)!, applied on both sides. For n ≥ 2, exp_BK is an isomorphism and reg_syn = log_BK ∘ r^(et,ch)_n, reg^c_syn = log_BK ∘ r^et_n; for n = 1 this is ∂ = exp_BK ∘ log_p on R^× (Bloch–Kato 3.10.1). For a smooth variety X over K the same Chern-class compatibility holds for the Nekovář–Nizioł syntomic regulator: ρ_syn ∘ `c^syn_{i,j}` = `c^et_{i,j},` and the syntomic boundary followed by the arithmetic edge map H^q_dR(X)/F^r → H^1(G_K, H^q_et(X_K̄, Q_p(r))) is the Bloch–Kato exponential of H^q_et(X_K̄, Q_p(r)).

See HK2011 Proposition 2.3.4, p. 16; Tamme2014 Proof of Corollary 5.19, p. 20; NN2016 Proposition 5.7, p. 58; Besser2000 Corollary 9.10 and Proposition 9.11, author preprint p. 32.

*Needs:* §§1.2–1.3,4.1; CohomologyComparisonsPartII §§2.1–2.3,5.3; dagger-syntomic-filtration; KTheoryFiniteLocalFields §§6.6–6.7.

**Checks.**

- n = 1, K = Q_p, u = 1 + p: exp_BK(log_p(1 + p)) is the Kummer class of 1 + p.
- n = 2, K = Q_5: for ζ = ω(2), log_BK(r^(et,ch)_2([ζ]_raw)) = Li_2(ζ) and log_BK(r^et_2([ζ]_raw)) = −Li_2(ζ), consistent with §4.3. Both values have valuation 2.
- The Huber–Kings p-adic Borel regulator satisfies r^et_n = exp_BK ∘ b_p (Huber–Kings Theorem 1.3.2); Tamme's Corollary 5.21 and the remark after it write this with the factor (−1)^n/(n−1)! for his Chern-character étale regulator. A formula imported from Tamme is converted by that printed factor, which includes his comparison with the Huber–Kings normalization; it is not re-derived from the Newton factor of §4.1.

### 4.3 Bloch–Kato comparison on the supplied weight-two symbols

Let F be a field of characteristic 0, O ⊂ F a discrete valuation ring with residue field κ, and σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R (so κ is algebraic over F_p). Let ξ ∈ K_3(O) ⊗ Q be the image, under de Jeu's map `H^1(M̃^{(2)}(O))` → `K^{(2)}_3(O),` of an element Σ_i n_i [x_i]_2 with n_i ∈ Q, x_i ∈ O^♭ special units (x_i, 1 − x_i ∈ O^×) and Σ_i n_i (1 − x_i) ∧ x_i = 0 in ∧²(O^×) ⊗ Q. ColemanIntegration §§L3.Fa.4,L3.Fb.5,L3.15 supply this symbol comparison and reg_syn(σ_*ξ_raw)=Σ_i n_i D(σx_i) for the Chern-character regulator reg_syn of §4.1 in their fixed raw convention, since (−1)²(2−1)!=1; the Chern-class regulator gives reg^c_syn(σ_*ξ_raw)=−Σ_i n_i D(σx_i). The de Jeu map is the supplier’s oriented one; another orientation changes the sign of both formulas once, not separately on each symbol. Here D=L_mod,2 is §3.4’s dilogarithm. For F a number field and O its localisation at a prime above p the same holds without further hypotheses, and for every root of unity ζ ≠ 1 of F (of any order) the cyclotomic element [ζ]_2 satisfies reg_syn(σ_*[ζ]_raw) = Li_2(σζ). When K/ℚ_p is finite, §4.2 converts these into Bloch–Kato logarithms: log_BK(r^(et,ch)_2(σ_*ξ_raw)) = Σ_i n_i D(σx_i) and log_BK(r^et_2(σ_*ξ_raw)) = −Σ_i n_i D(σx_i). For K complete discretely valued but infinite over ℚ_p only the syntomic identity is asserted. For arbitrary elements of B(F) ⊗ Q (symbols that are not special units of O) the identity is Besser–de Jeu's Conjecture 1.14 and is not asserted.

See BdJ2003 Theorem 1.6(2), p. 4; BdJ2003 Theorem 1.12, p. 6; BdJ2003 Conjecture 1.14, p. 6.

*Needs:* §3.4, and §4.2 for the Bloch–Kato conclusion; ColemanIntegration §§L3.Fa.4,L3.Fb.5,L3.15.

**Checks.**

- F = Q(ζ_m), p>3 and p ∤ m, σ an embedding into Q_p(ζ_m): reg_syn([ζ_m]_raw) = Li_2(σζ_m) ∈ p²Z_p[ζ_m].
- For K the completion of the maximal unramified extension of ℚ_p inside ℂ_p, K is complete and discretely valued with residue field 𝔽̄_p, so the syntomic identity applies, but K/ℚ_p is infinite and outside the Bloch–Kato logarithm of §1.3; no étale conclusion is drawn there.
- GSWZ Example 4.3: all symbols 1 − α², 1 − α of ξ = 2[1 − α²] + [1 − α] and their complements are global units (norm ±1), so the theorem gives Layer 4's regulator of ξ at both places above 5 as D_5(ξ) of GSWZ (271) in that raw convention.
- The symbol [p] ∈ P(Q) is not a special unit at p; no statement is made for presentations containing it.

### 4.4 Higher-weight comparison with the supplied symbol regulator

Let F be a number field, O the localisation of O_F at a prime above p, σ : F → K an embedding into a complete discretely valued subfield K ⊂ C_p with σ(O) ⊂ R, and n ≥ 2. Use ColemanIntegration §§L3.Fa.4,L3.Fb.5,L3.14–L3.15. On the supplied de Jeu `H^1(M̃^{(n)}(O))` → `K^{(n)}_{2n−1}(O)` ≅ `K^{(n)}_{2n−1}(F),` the composite with σ_* and the Chern-character regulator reg_syn has the supplied raw-symbol coefficient (−1)ⁿ(n−1)! on L_mod,n(σx) for special-unit symbols, and on Li_n(σζ) for cyclotomic classes ζ≠1 of any order; with the Chern-class regulator reg^c_syn the coefficient is (−1)ⁿ⁻¹(n−1)!·(−1)ⁿ(n−1)! = −((n−1)!)². When K/ℚ_p is finite the target here identifies the first composite with log_BK∘r^(et,ch)_n and the second with log_BK∘r^et_n by §4.2; for infinite K only the syntomic formula is asserted. The symbol formula itself is imported. For a field F of characteristic 0 and a discrete valuation ring O ⊂ F, the same holds on special units under Beilinson–Soulé vanishing for every characteristic-zero field and for the residue field of O (n≥3), as required for the reduced comparison in ColemanIntegration §L3.Fa.4. With vanishing only for F and its residue field use the imported unreduced comparison. The number-field and weight-two cases are unconditional. L_mod,n is the modified polylogarithm of ColemanIntegration §L3.14 padicRegulatorPolylog. For n = 2 this is §4.3.

See BdJ2003 Theorem 1.10(2), p. 5; BdJ2003 Theorem 1.12, p. 6.

*Needs:* §4.2; ColemanIntegration §§L3.Fa.4,L3.Fb.5,L3.14–L3.15, retaining the reduced and unreduced hypotheses separately.

**Checks.**

- In the supplier’s raw convention the Chern-character coefficients at n=2 and n=3 are respectively +1 and −2, and §4.2 gives the same coefficients for log_BK∘r^(et,ch)_n. The Chern-class coefficients are −1 and −4, those of reg^c_syn and log_BK∘r^et_n. Any chosen de Jeu orientation is converted once; it cannot turn −2 into −4.
- At n=3 over a general F, vanishing for F and its residue field licenses only the unreduced comparison, not its reduced quotient. For F=ℚ(ζ_N), the reduced comparison is unconditional.
- At p=3 and ζ a primitive cube root, the imported cyclotomic formula applies although |1−ζ|₃=3^(−1/2)<1; its distribution argument is part of ColemanIntegration §L3.15.

### 4.5 Bloch–Kato comparison with the supplied Gros normalization

Let K/Q_p be finite unramified with arithmetic Frobenius σ and n≥1. Import ColemanIntegration §L3.Fb.6’s Gros normalization reg^Gros_n=(1−σ/p^n)∘reg_syn of the Chern-character regulator. Here compare it with (1−σ/p^n)∘log_BK∘r^(et,ch)_n using §4.2; the Chern-class version (1−σ/p^n)∘reg^c_syn is (−1)ⁿ⁻¹(n−1)! times it. For n≥2 and a cyclotomic class [ζ]_n normalized by the de Jeu map, with ζ≠1 of order prime to p, its supplied raw value is (−1)ⁿ(n−1)!·Li_n^(p)(ζ), where Li_n^(p)(ζ)=Li_n(ζ)−p^(−n)Li_n(ζ^p) in the supplier’s fixed symbol convention. A change of de Jeu orientation transports this identity once; it creates no additional regulator construction. For n=2 and p>3, the raw values are ℓ_2(ζ)∈O_K and Li_2(ζ)∈p²O_K respectively; the normalized root convention uses the Suslin–de Jeu constant of §4.7 and §5.7.

See BdJ2003 Remark 1.13, p. 6.

*Needs:* §4.2; ColemanIntegration §L3.Fb.6; the arithmetic-Frobenius supplier contract.

**Checks.**

- For K=ℚ₅ and ζ=ω(2), the raw Gros value is a unit congruent to −1 mod 5; the Besser value is in 25ℤ₅.
- On a raw weight-three root class the coefficient is −2!, and depletion applies to that full value. A formula using a differently normalized symbol must first identify that symbol.
- In weight two the factorial is 1, so the sole remaining changes are the Chern-class sign −1 and the operator 1−σ/p². In weight three the Chern-class Gros value of the raw root class is −4·Li_3^(p)(ζ), not −2·Li_3^(p)(ζ).

### 4.6 The syntomic exponential and the Bloch–Kato exponential

Consume CohomologyComparisonsPartII §§3.1–3.4,4.1–4.4,5.1–5.3 and gap:normalized-syntomic-boundary. The following comparison is conditional on that precise boundary contract.

Let X be a quasi-compact formal semistable scheme over O_K and r≥1. Write U for the undivided complex and D for the divided complex of the supplier contract “Log-syntomic complexes S_n(r)”. Fix the rational comparison ω_Q:U_Q≃D_Q with α_U^FM=α_D^FM∘ω_Q, as in EN §2.2. Let δ_D be the de Rham boundary in the divided rational model, with the Bloch–Kato sign convention of NN Proposition 4.13 and Remark 2.14, and define `α^norm_{r,i}:=ω_Q⁻¹∘δ_D:H^{i−1}_dR(X_{K,tr})→H^i(U_Q).` It is an isomorphism for i≤r−1 and injective for i=r, by the rational de Rham comparison of CN Corollary 3.16. For X proper semistable and 1≤i≤r−1, the composite `α_U^FM∘α^norm_{r,i}` is exp_BK of `V_{i−1}:=H^{i−1}_et(X_K̄,Q_p(r)),` with `D_dR(V_{i−1})=H^{i−1}_dR(X_K)` and Fil^0=0 in this range. In the explicit rational triple-cone presentation `[A→A⊕A/J^{[r]}],` ω acts by (p^r,id,p^r); hence the unscaled quotient-coordinate boundary δ_U satisfies ω_Qδ_U=p^rδ_D. In these EN period conventions α^norm=p^(−r)δ_U and α_U^FMδ_U=p^r exp_BK. No inverse to ω is asserted integrally. For X=Spec O_K, r≥2 and i=1 the normalized composite K→H^1(U_Q)→H^1(K,Q_p(r)) is exp_BK.

See CN2017 Corollary 3.16, p. 37; CN2017 §1, p. 3; EN2016 §§2.1–2.2, pp. 4–8; NN2016 Proposition 4.13 and its displayed square, pp. 53–54; Remark 2.14, p. 14.

*Needs:* §1.2; CohomologyComparisonsPartII §§3.1–3.4,4.1–4.4,5.1–5.3; normalized-syntomic-boundary.

**Checks.**

- For X=Spec O_K, r=2 and i=1, `α^norm_{2,1}:K→H^1(U_Q)` is an isomorphism and α_U^FMα^norm=exp_BK. At p=5 the unscaled triple-cone boundary instead gives 25·exp_BK; multiplying it by 1/25 restores the square.
- At r=0, ω=τ=id. At r=2 modulo p, ω and τ have zero composite p², so neither is an integral inverse.
- At i=r only injectivity is asserted, even for dim X_K≥1.

### 4.7 de Jeu's weight-two classes and Suslin's Bloch group

Let F be a number field. Write dJ_F : H¹(M̃•(2)(F)) → K_3^(2)(F) = K_3(F)⊗ℚ for the oriented de Jeu map of ColemanIntegration §L3.Fa.4, and s_F : K_3(F)⊗ℚ ≃ B(F)⊗ℚ for Suslin's rational isomorphism of K3BlochGroups §§4.20,6.6, which applies because the Milnor image in K₃ of a number field is finite. For an embedding σ : F → ℂ write reg_σ := reg_∞∘σ_* : K_3(F)⊗ℚ → ℝ(1) = iℝ, where reg_∞ is the complex Beilinson regulator of ColemanIntegration §L3.Fc.1, identified by BorelRegulators §6.0a with the shared regulator r_Be in its point coordinate. Every complex regulator value in this section is a reg_σ value. The Borel regulator of BorelRegulators §2.2 is r_Bo = −2·r_Be (BorelRegulators §6.2), so the Borel value of a class is −2 times the value written here, and the family (reg_σ)_σ is injective on K_3(F)⊗ℚ because r_Bo,ℚ is (BorelRegulators §2.3). Rationally the antisymmetric square is the exterior square and ∂[x]=x⊗(1−x) becomes −(1−x)∧x, de Jeu's differential up to sign; so Σ_i n_i[x_i] lies in B(F)⊗ℚ exactly when Σ_i n_i[x_i]_2 is a cocycle. The symbol map ψ_F : P(F)⊗ℚ → M̃_2(F), [x] ↦ [x]_2, kills the five-term relations of K3BlochGroups §3.3 and the inversion symbols, and carries B(F)⊗ℚ isomorphically onto H¹(M̃•(2)(F)). The argument is de Jeu's (dJ1995 §5, printed pp. 239–240): the image of a five-term relation is a cocycle whose regulator vanishes at every σ by the de Jeu evaluation below, because P₂ = i·D_BW satisfies the five-term relation, D_BW being the Bloch–Wigner function (PolylogarithmFunctions §§5.1–5.2,5.7), so it is zero by injectivity of the regulator and of dJ_F. The cocycle conditions agree, so the induced map B(F)⊗ℚ → H¹(M̃•(2)(F)) is onto; both spaces have dimension r₂(F) (K3BlochGroups §4.20, ColemanIntegration §L3.Fa.4, ArithmeticKTheory §§3.2–3.4), so it is bijective.

De Jeu evaluation. For every embedding σ and every cocycle Σ_i n_i[x_i]_2, reg_σ(dJ_F(Σ_i n_i[x_i]_2)) = Σ_i n_i P₂(σx_i), where P₂ = zagierPolylog 2 is ColemanIntegration §L3.Fc.3's weight-two function. De Jeu's regulator is the Deligne–Beilinson regulator of his §§2.4–2.5 (dJ1995, printed pp. 212–213 and 218–219), and he computes its value on [x]_2 as P₂(σx) (dJ1995 Proposition 4.1, printed p. 235, and Remark 5.2, printed pp. 238–239). Another orientation of the de Jeu map or another sign of the point coordinate multiplies the whole formula by one universal nonzero factor; ColemanIntegration §L3.Fc.3's cyclotomic value Φ_∞([ζ]_2) = P₂(φ_∞ζ), nonzero at ζ = i, fixes that factor as 1 in the supplier's normalization. The Borel value of the same class is −2·Σ_i n_i P₂(σx_i).

Suslin–Bloch–Wigner evaluation. There is a real number κ₂ ≠ 0, the same for every number field F and every embedding σ, such that reg_σ(s_F⁻¹ b) = κ₂·Σ_i n_i P₂(σx_i) for every b = Σ_i n_i[x_i] ∈ B(F)⊗ℚ; in the Borel coordinate the scalar is −2κ₂. Route: s_F is the Hurewicz map into H₃(GL(F),ℤ) followed by the configuration map of K3BlochGroups §§4.12–4.14 (K3BlochGroups §4.20), and r_Bo evaluates the Borel class on the same Hurewicz image (BorelRegulators §§2.1–2.2); both factor through σ_* into GL(ℂ). The Bloch–Wigner function of the cross-ratio of four points of ℙ¹(ℂ) is a group cocycle on GL₂(ℂ), bounded because D_BW is continuous on ℙ¹(ℂ), and the class of the composite of the configuration map with D_BW is a nonzero multiple of the Borel class; a convention change in the cross-ratio or in the configuration map changes only that multiple (G1995 §2, the cocycle (2.12) and the paragraph after it, printed p. 256, and (2.23), printed p. 261). De Jeu records the resulting statement on Ker ∂ ⊂ B₂(F) up to an unspecified nonzero factor (dJ1995, printed pp. 239–240). The value of κ₂ is not part of this statement.

The target is the comparison: there is a single rational number c₂ ≠ 0, the same for every number field, such that s_F(dJ_F(ψ_F b)) = c₂·b for every b ∈ B(F)⊗ℚ, and c₂ = κ₂⁻¹. Proof from the two evaluations: at every σ, reg_σ(dJ_F ψ_F b) = Σ_i n_i P₂(σx_i) = κ₂⁻¹·reg_σ(s_F⁻¹ b), and the real extension of the regulator is an isomorphism (BorelRegulators §2.3), so dJ_F ψ_F b = κ₂⁻¹·s_F⁻¹ b in K_3(F)⊗ℝ. Both classes are rational and s_F⁻¹ b ≠ 0 for b ≠ 0, so κ₂⁻¹ ∈ ℚ as soon as one B(F)⊗ℚ is nonzero, as for F=ℚ(√−3). This is de Jeu's statement that the two regulator factorizations differ by a nonzero factor (dJ1995, printed p. 240). Independence of F also follows from naturality of dJ (ColemanIntegration §L3.Fa.4, map_of_extension) and of s (K3BlochGroups §4.20) under embeddings, rational injectivity of restriction, and the fact that two number fields embed in a common one; fields with B(F)⊗ℚ=0 impose no condition. With the supplier's orientation, c₂ is a definite rational number; another de Jeu orientation replaces it by −c₂.

Consequences, by §4.3 and §4.2. Let v | p be a prime of F, σ_v : F → F_v, and b=Σ_i n_i[x_i] ∈ B(F)⊗ℚ with every x_i and 1−x_i a unit at v. Then

```text
log_BK(r^(et,ch)_2(σ_v,* s_F⁻¹ b)) = c₂⁻¹·Σ_i n_i D(σ_v x_i),
log_BK(r^et_2(σ_v,* s_F⁻¹ b))      = −c₂⁻¹·Σ_i n_i D(σ_v x_i).
```

For a root of unity ζ ≠ 1 of order m prime to p, the integral class m[ζ] ∈ B(F) (K3BlochGroups §6.3) gives c₂⁻¹·m·Li₂(σ_v ζ) in the first line.

Calibration: c₂ is a unit at every prime p > 3. Half of this follows from Layer 5. For L unramified over ℚ_p, the integral Chern/Bloch–Kato image of K₃(L;ℤ_p) is p²𝒪_L (§§1.10,5.8, first statement). The root classes lie in K₃(L;ℤ_p), so their values c₂⁻¹Li₂(ζ) lie in that image; since the values Li₂(ζ) span p²𝒪_L (§5.5), this gives c₂⁻¹p²𝒪_L ⊆ p²𝒪_L, that is v_p(c₂) ≤ 0. The inequality v_p(c₂) ≥ 0 is equivalent, given those sections, to the root generation of §5.9 (GSWZ Theorem 9). The two evaluations determine c₂ only as κ₂⁻¹, and κ₂ is known only up to an unspecified nonzero factor (dJ1995, printed p. 240; G1995, printed p. 256); neither K3BlochGroups nor ColemanIntegration fixes it, so this calibration is part of the present target: it is the computation of κ₂ in the reg_∞ coordinate. Because κ₂ is one universal number, one evaluation of reg_σ on one Suslin class with nonzero regulator determines it. For instance, over F=ℚ(√−3), ω a primitive sixth root of unity and σ a complex embedding, compute reg_σ(s_F⁻¹(2[ω])) and compare it with 2·P₂(σω) = reg_σ(dJ_F ψ_F(2[ω])). The comparison can equally be made with Borel values on both classes, −2·reg_σ(s_F⁻¹(2[ω])) against −4·P₂(σω); comparing a Borel value on one class with a reg_∞ value on the other introduces a spurious factor −2.

- For every cocycle Σ_i n_i[x_i]_2 of H¹(M̃•(2)(F)) and every σ : F → ℂ, reg_∞(σ_* dJ_F(Σ_i n_i[x_i]_2)) = Σ_i n_i P₂(σx_i), and its Borel regulator is −2 times this value.
- There is κ₂ ∈ ℝ, nonzero and independent of F and σ, with reg_∞(σ_* s_F⁻¹ b) = κ₂·Σ_i n_i P₂(σx_i) for every b = Σ_i n_i[x_i] ∈ B(F)⊗ℚ; the corresponding Borel scalar is −2κ₂.
- suslinDeJeuConstant : ℚ, nonzero, with suslin_F (deJeu_F (ψ_F b)) = suslinDeJeuConstant • b for every number field F and b ∈ B(F)⊗ℚ; suslinDeJeuConstant = κ₂⁻¹.
- ψ_F is well defined on P(F)⊗ℚ, kills inversion symbols and restricts to an isomorphism from B(F)⊗ℚ onto H¹(M̃•(2)(F)).
- The constant does not depend on F, on the prime p or on the embedding σ_v; it changes sign with the de Jeu orientation.
- On special-unit Bloch elements at v, log_BK∘r^(et,ch)_2∘s_F⁻¹ equals suslinDeJeuConstant⁻¹ times the combined dilogarithm of §3.3 in its v-component.
- For every prime p > 3, suslinDeJeuConstant is a p-adic unit.

See dJ1995 §2.4, printed pp. 212–213, and §2.5, printed pp. 218–219; Proposition 4.1, printed p. 235; Remark 5.2, printed pp. 238–239; §5, the regulator on Ker d, printed p. 239, and the construction of ψ₂ and its diagram, printed p. 240; G1995 §2, cocycle (2.12) and the paragraph after it, printed p. 256, and (2.23), printed p. 261; BdJ2003 Theorem 1.10, p. 5; GSWZ2024 Theorem 9, p. 39.

*Needs:* §§3.3,4.2–4.3; ColemanIntegration §§L3.Fa.4,L3.Fc.1,L3.Fc.3; K3BlochGroups §§3.3–3.6,4.12–4.14,4.20,6.3,6.6; BorelRegulators §§2.1–2.3 for the Borel class, the real isomorphism and injectivity, §6.0a for reg_∞ = r_Be and §6.2 for r_Bo = −2r_Be; PolylogarithmFunctions §§5.1–5.2,5.7–5.8 for D_BW, its continuity on ℙ¹(ℂ), its five-term relation and cross-ratios; ArithmeticKTheory §§3.2–3.4; §§1.10,5.5,5.8 for the inequality v_p(c₂) ≤ 0.

**Checks.**

- Over ℚ and every totally real F, B(F)⊗ℚ=0 and the identity holds for every value of c₂; such fields cannot calibrate the constant.
- Over F=ℚ(i) with σ the identity embedding, [i]_2 is a cocycle because i is torsion. Its de Jeu class has reg_σ value P₂(i) = i·D_BW(i) ≈ 0.91597i (Catalan's constant) and Borel value −2P₂(i) ≈ −1.83193i. Calling P₂(i) its Borel value is off by the factor −2.
- Over ℚ(√−3) with σω = e^(iπ/3), the de Jeu class of 2[ω] has reg_σ value 2P₂(σω) = 2i·D_BW(e^(iπ/3)) ≈ 2.02988i, nonzero because D_BW attains its maximum 1.01494… there, and Borel value ≈ −4.05977i. A calibration that compares the Borel value of one class with the reg_∞ value of the other changes the computed c₂ by the factor −2 or −1/2. Both are p-adic units for p > 3, so the unit calibration cannot detect the mixed coordinate; the statement fixes it.
- Over ℚ(√−3), ω=(1+√−3)/2 has 1−ω=ω⁻¹ torsion, so [ω]_2 is a cocycle and 2[ω] ∈ B(F) (K3BlochGroups §3.6). Its image under s_F∘dJ_F∘ψ_F is 2c₂[ω]; replacing c₂ by −c₂ or 2c₂ changes this nonzero element of the one-dimensional space B(F)⊗ℚ.
- For F=ℚ(i), p=5, σ_v(i)=ω(2) ∈ ℚ₅ and b=4[i] ∈ B(F), the Chern-character line gives 4c₂⁻¹Li₂(ω(2)), of 5-adic valuation 2−v₅(c₂) because Li₂(ω(2)) ≡ 25 mod 125, and the Chern-class line gives its negative. A comparison that ignores the Newton factor of §4.1 reverses this sign.
- The comparison is a statement about the rational groups. The torsion class {−1,−1,−1} ∈ K₃(ℚ) of order two (K3BlochGroups §2.3) has zero image in B(ℚ)⊗ℚ and zero regulator, and is invisible to it.

### Examples

For Spec 𝒪_K in positive weight n, the syntomic coordinate is a single K. In weight 1 the regulator is the local logarithm; in weight 2 it is the logarithm of the étale Chern character, the negative of the Chern class. In weight 0 the Frobenius-fixed term survives, and the positive-weight identification must not be used. A raw de Jeu root class over ℚ₅ has Chern-character regulator Li₂(ω(2)); the Suslin root class has c₂⁻¹ times that value.

### Dependencies

Layers 0–3; KTheoryFiniteLocalFields §1.8 finite Chern maps and §§6.6–6.7; ColemanIntegration §§L3.Fa.1,L3.Fa.4,L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.14–L3.15; K3BlochGroups §§3.3–3.6,4.12–4.14,4.20,6.3,6.6, ColemanIntegration §§L3.Fc.1,L3.Fc.3, BorelRegulators §§2.1–2.3,6.0a,6.2, PolylogarithmFunctions §§5.1–5.2,5.7–5.8 and ArithmeticKTheory §§3.2–3.4 for §4.7; K2SymbolsBrauer §§9.11,11.1,11.3; CohomologyComparisonsPartII §§2–5 and gaps: dagger-syntomic-filtration, rigid-negative-weights, normalized-syntomic-boundary. Layer 4's comparisons are conditional on those inputs with the individual subsection hypotheses.

## Layer 5: the unramified local K₃ isomorphism

Throughout the local isomorphism argument p>3 and A=∏Lᵥ is finite unramified étale over ℚₚ, with integers 𝒪_A=∏𝒪_Lᵥ and residue algebra `k_A=∏𝔽_{pˢᵥ}.` All sᵥ are positive. Definitions that make sense for other primes are given more generally; the isomorphism retains its strict prime and ramification hypotheses.

### 5.1 Kontsevich's finite polylogarithm

For a prime p and n ∈ Z, the finite polylogarithm is the polynomial `li_{n,p}(x)` := `Σ_{k=1}^{p−1}` x^k / k^n ∈ F_p[x] (equivalently its lift with coefficients in Z_(p)). It has degree p − 1 (for p > 2), constant term 0, and satisfies `x·li'_{n,p}(x)` = `li_{n−1,p}(x);` `li_{n,p}(1)` = `Σ_{k=1}^{p−1}` `k^{−n}` ≡ 0 mod p exactly when (p − 1) ∤ n. In particular for p > 3: `li_{2,p}(1)` ≡ 0 and `li'_{2,p}(1)` = `li_{1,p}(1)` ≡ 0 mod p, so (x − 1)² divides `li_{2,p}(x)` in F_p[x].

- `finitePolylog`: finitePolylog p n : Polynomial (ZMod p) := `Σ_{k=1}^{p−1}` C ((k : ZMod p)^n)⁻¹ * X^k.
- (finitePolylog p n).eval 0 = 0.
- X * derivative (finitePolylog p n) = finitePolylog p (n − 1).
- (finitePolylog p n).eval 1 = 0 ↔ ¬ (p − 1 ∣ n).
- For 5 ≤ p, (X − 1)² ∣ finitePolylog p 2.
- For 2 < p, (finitePolylog p n).natDegree = p − 1.
- Equality of finite polylogarithm polynomials is determined coefficientwise by Polynomial.ext; coeff k = `(k^n)^{-1}` for 1≤k<p and 0 otherwise.

See GSWZ2024 §3.1, (177), p. 38; GSWZ2024 Proof of Proposition 3.3, (180), p. 38.

*Needs:* Mathlib `Polynomial`, `ZMod` and finite-field power sums.

**Checks.**

- (finitePolylog 5 2).eval 2 = 1 in ZMod 5.
- finitePolylog p 0 = `Σ_{k=1}^{p−1}` X^k, the truncated geometric series.
- For ζ ∈ `μ(Q_{p^s})` ∖ {1} of order prime to p, the reduction of `p^{−2}Li_2(ζ^p)` is `−li_{2,p}(ζ̄)/(1 − ζ̄)^p,` the form of ColemanIntegration §L2.25.
- (finitePolylog 3 2).eval 1 = 2 ≠ 0 in ZMod 3, so the factorisation `li_{2,p}` = (x − 1)² g_p fails at p = 3.
- (finitePolylog 5 2).eval 3 = 3 in ZMod 5; hence f_5(3)=3/(3−1)^5=4.
- (finitePolylog 5 2).eval 4 = 0 in ZMod 5, so f_5(−1)=0.

### 5.2 Finite residue dilogarithm function

For p prime and an F_p-algebra field F, define `f_p(x)=li_{2,p}(x)/(x-1)^p` on F^× minus {1}. Its total algebraic extension uses field inverse 0 inverse = 0, hence f_p(1)=0; this convention supplies no dilogarithm value or regulator class at the excluded root 1. For p>3 write `li_{2,p}=(X-1)^2` g_p with deg g_p=p-3; then f_p(x)=g_p(x)/(x-1)^(p-2) for x≠1.

- `residueDilogValue`: The total field expression `li_{2,p}(x)/(x-1)^p,` with the admissible domain specified separately.
- For p>3 and x≠1, f_p(x)=g_p(x)/(x-1)^(p-2). No cancellation at x=1 is used.
- For a field embedding over F_p, the image of f_p(x) equals f_p of the image of x; admissible points remain admissible.
- In F_5 the values at 2,3,4 are respectively 1,4,0.

See GSWZ2024 §3.1, equations (178)–(182), Propositions 3.2–3.3, pp.38–39.

*Needs:* §5.1; Mathlib field division and `Polynomial.aeval`.

**Checks.**

- The values (1,4,0) at (2,3,4) span F_5; their differences also span.
- The total extension has f_p(1)=0, but 1 is excluded from the regulator and fibre-count domains.
- The total extension has f_p(0)=0; zero is not a root of unity, so the admissible domain has q-2 elements.
- For admissible tame zeta, p^-2 D(zeta^p) mod p equals f_p(zeta bar), with arithmetic Frobenius on the argument.

### 5.3 Reduction of the p-adic dilogarithm at roots of unity

Let p be odd, L an unramified extension of Q_p and ζ ∈ μ(L) ∖ {1}. Then D_L(ζ) = Li_2(ζ) ∈ p²O_L and `p^{−2}D_L(ζ^p)` ≡ `li_{2,p}(ζ̄)/(ζ̄ − 1)^p` mod p, where ζ̄ ∈ k_L^× is the residue of ζ. Equivalently, with σ(ζ) the root of unity with σ(ζ)^p = ζ, `p^{−2}D_L(ζ)` ≡ `li_{2,p}(σ(ζ)‾)/(σ(ζ)‾ − 1)^p.` Componentwise the same holds for a finite unramified product L and ζ ∈ μ(L) with all components ≠ 1.

See GSWZ2024 Proposition 3.2, (178), p. 38.

*Needs:* §§3.1–3.2,5.1–5.2; ColemanIntegration §L2.25; the tame-root Frobenius supplier.

**Checks.**

- p = 5, ζ = ω(2) ∈ Q_5 (so ζ^5 = ζ): `25^{−1}D(ζ)` ≡ `li_{2,5}(2)` = 1 mod 5, matching the Q_5-component of D_5(ζ_24) in GSWZ (273).
- For p = 2 and ζ = −1, ζ^p = 1 and D(1) is undefined: the printed statement of GSWZ Proposition 3.2 needs ζ^p ≠ 1.

- At p=5 and ζ=−1, ζ̄=4, li₂,₅(4)=0 and (4−1)⁵=3 in 𝔽₅; both the quotient and 25⁻¹D(−1) reduce to 0.

### 5.4 p²-integrality of the dilogarithm on special units

Let p > 3 and let L be a finite unramified étale Q_p-algebra. If z ∈ O_L satisfies z ∈ O_L^× and 1 − z ∈ O_L^× in every factor (z is a special unit), then D_L(z) ∈ p²O_L. This is GSWZ Lemma 3.1 for R^∧_p = `O_{K_p}.`

See GSWZ2024 Lemma 3.1 and proof, (175), p. 38.

*Needs:* §§3.1–3.2; ColemanIntegration special-unit polylogarithms.

**Checks.**

- z = ω(2) ∈ Z_5 (a special unit): D(z) ∈ 25Z_5.
- z = p is not a unit and D^0(p) = Li_2(p) ≡ p mod p², so the unit hypothesis cannot be dropped.
- z = 1 + p has 1 − z = −p not a unit; the lemma does not apply there.

### 5.5 Dilogarithms of roots of unity span the residue space

Let p > 3. (a) For every s ≥ 1, `Span_{Z_p}{p^{−2}D(ζ) : ζ ∈ μ(Q_{p^s}) ∖ {1}}` = `Z_{p^s}.` (b) For every s ≥ 1 also `Span_{Z_p}{p^{−2}(D(ζ) − D(ζ')) : ζ, ζ' ∈ μ(Q_{p^s}) ∖ {1}}` = `Z_{p^s}.` (c) Consequently, for a finite unramified product L = ∏_i `Q_{p^{s_i}},` `Span_{Z_p}{p^{−2}D_L(ζ) : ζ ∈ μ(L) with every component ≠ 1}` = O_L. The finite-field headline `residueDilogValue_spans` asserts that the values of `residueDilogValue` and their pairwise differences, on 𝔽_(pˢ)× excluding 1, both span 𝔽_(pˢ) over 𝔽ₚ, for p>3 and s>0. Nakayama and §5.3 lift these to the integral p-adic spans. Statement (a) is GSWZ Proposition 3.3 with ζ = 1 excluded; (b) and (c) are needed for products once components equal to 1 are excluded.

See GSWZ2024 Proposition 3.3 and proof, (179)–(182), pp. 38–39; GSWZ2024 Proof of Proposition 3.3, (182), p. 39.

*Needs:* §§5.1–5.3; Mathlib `GaloisField.finrank`, `GaloisField.card`, polynomial root bounds, submodule span and Nakayama.

**Checks.**

- p=5,s=1: μ_4\{1} has three elements. The residue values f(2)=1,f(3)=4,f(4)=0 generate F_5, and their differences also generate; f(4)=f(−1)=0 handles the s=1 count.
- p = 5 and L = `Q_{25}` × Q_5: the three values `p^{−2}D_L(ζ_24),` `p^{−2}D_L(ζ_24²),` `p^{−2}D_L(ζ_24⁶)` of GSWZ (273) (second label corrected to ζ_24²) form a Z_5-basis of O_L, as (274) presupposes.
- At p = 3 the factorisation of `li_{2,3}` fails `(li_{2,3}(1) = 2),` so the fibre bound and the proof do not apply.

### 5.6 Root-of-unity classes in completed K₃

Let p be odd, L a finite unramified étale Q_p-algebra and ζ ∈ μ(L) a root of unity of order m (prime to p) all of whose components are ≠ 1. Define [ζ]_L ∈ K_3(L; Z_p) as the image, under B(L) ⊗ Z_p → lim_ν B(L)/p^ν ≅ K_3(L; Z_p) (the completed-Bloch-group supplier contract, factorwise), of the Z_p-coefficient class ⟦ζ⟧ = `m^{−1}` ⊗ m[ζ] supplied by K3BlochGroups §6.4 as rootClassPadic (componentwise; its §6.3 supplies m[ζ]∈B(L)). This is the class GSWZ denote [ζ]: if ζ ∧ (1 − ζ) already vanishes integrally, the integral symbol [ζ] lies in B(L) and has this image; otherwise use the displayed Z_p-coefficient class, whose boundary vanishes because m is a p-unit, and GSWZ's ord(ζ)·D_p(ζ) is the regulator of the integral multiple m[ζ].

- rootClassK3 L ζ : completedK3 p L, for ζ a root of unity of L with all components ≠ 1.
- rootClassK3 L ζ is the image of K3BlochGroups §6.4’s coefficient-localized class m⁻¹⊗m[ζ] under B(L) ⊗ ℤ_p → completedK3 p L.
- For L = ∏ L_i, rootClassK3 L ζ = (rootClassK3 L_i ζ_i)_i.
- For a ℚ_p-algebra map f : L → L', completedK3 map sends rootClassK3 L ζ to rootClassK3 L' (f ζ); in particular φ_L(rootClassK3 ζ) = rootClassK3 (ζ^p).
- rootClassK3 L ζ⁻¹ = −rootClassK3 L ζ.
- ord(ζ) • rootClassK3 L ζ is the image of the integral Bloch element m[ζ].
- In a finite product, two rootClassK3 values are equal iff all factor projections agree; the construction is invariant under equality of admissible root arguments. It is a function of roots, not asserted to be additive in the multiplicative root argument.

See GSWZ2024 Theorem 9 and proof, p. 39.

*Needs:* K3BlochGroups §§3.5,4.20,6.3–6.6; KTheoryFiniteLocalFields §§3.5,6.2,6.8–6.10; the completed-Bloch supplier contract.

**Checks.**

- For p > 3, rootClassK3 Q_p (−1) = 0.
- For L = Q_p × Q_p and ζ = (−1, −1), rootClassK3 L ζ = 0, the product of two zero classes.
- When ζ ⊗ (1 − ζ) = 0 in Suslin's antisymmetric square (K3BlochGroups §3.5's boundary), rootClassK3 L ζ is the image of [ζ] ∈ B(L).
- For p = 5, L = `Q_{25}` × Q_5 and ζ = ζ_24^4 (Q_5 component 1), the class is not defined: the raw symbol [1] is not a Bloch-group generator and D(1) is undefined.

### 5.7 The p-adic regulator on completed K₃

For a finite étale Q_p-algebra L = ∏ L_i (any p; L_i/Q_p finite) let λ_L : K_3(L; Z_p) → L be the composite of the integral étale Chern isomorphism c_(2,1) : K_3(L; Z_p) ≅ H^1(L, Z_p(2)) (componentwise, the supplier contract “Soulé's étale regulator to continuous Galois cohomology”), the rationalization map into H^1(L, Q_p(2)) and the Bloch–Kato logarithm log_BK : H^1(L, Q_p(2)) ≅ D_dR(Q_p(2)) = L·e_2 ≅ L (§1.3, e_2 = `t^{−2}` ⊗ `ε^{⊗2}).` Define D_L := −c₂·λ_L = c₂·(log_BK∘r^(et,ch)_2), with c₂ ∈ ℚˣ the universal Suslin–de Jeu constant of §4.7. By §4.7 this one normalization gives D_L([ζ]_L)=Li_2(ζ) for every admissible prime-to-p root of §5.6, at every odd p and every unramified L, with no further choice of sign or scalar. The same composite is defined for every finite local extension and every p; this defines no additional integral root classes. By §4.2, D_L = c₂·reg_syn for the Chern-character syntomic regulator of §4.1 on the image of K_3(O_L), and by §4.7 D_L(s⁻¹b) = Σ n_i D(x_i) for Bloch elements b = Σ n_i[x_i] of a number field F ⊂ L whose arguments are special units at the prime of L. This is GSWZ's D_p of (19) and (183), defined on the completed group.

- localRegulator L : completedK3 p L →ₗ[ℤ_[p]] L.
- localRegulator L = (−suslinDeJeuConstant) • (logBK ∘ chernEquiv), where chernEquiv is the integral weight-two Chern isomorphism; equivalently suslinDeJeuConstant • (logBK ∘ the Chern-character isomorphism).
- For odd p, unramified L and the admissible prime-to-p roots of §5.6, localRegulator L (rootClassK3 L ζ) = etaleDilog L ζ (= (Li_2(ζ_i))_i).
- On the image of a Bloch element Σ n_i [x_i] of a number field F ⊂ L, with every x_i and 1 − x_i a unit at the prime of L, localRegulator = Σ n_i etaleDilog L x_i.
- For a ℚ_p-algebra map f : L → L', localRegulator L' ∘ completedK3.map f = f ∘ localRegulator L; in particular it commutes with φ_L when L is unramified.
- For L → L' finite free, localRegulator L ∘ transfer = `Tr_{L'/L}` ∘ localRegulator L'.
- On L = ∏ L_i, localRegulator is the product of the factor regulators.

See GSWZ2024 §1.5, (19), p. 9; HK2011 Theorem 1.3.2 and Proposition 2.3.4, pp. 9 and 16.

*Needs:* §§1.3,4.2–4.3,4.7,5.6; KTheoryFiniteLocalFields §§6.6–6.7 and transfer; §1.7 for trace.

**Checks.**

- localRegulator Q_5 (rootClassK3 Q_5 (teichmuller 2)) ≡ 25 mod 125.
- localRegulator 0 = 0.
- At p=5, L=ℚ₅(ζ₅), the Chern/logarithm composite is defined, but 5 is not invertible in ℤ₅ and §5.6 supplies no integral rootClassK3 L ζ₅. The general regulator does not require that argument.
- On the image of K_3(O_L), localRegulator = c₂·syntomicRegulator (§4.1, Chern character) = −c₂·syntomicChernRegulator with n = 2.
- For L = ℚ₅ the raw de Jeu class [ω(2)]_raw has λ_L-value −Li₂(ω(2)) and syntomicRegulator value Li₂(ω(2)). The Suslin root class is c₂⁻¹ times that class rationally (§4.7), so λ_L([ω(2)]_L) = −c₂⁻¹Li₂(ω(2)) and localRegulator([ω(2)]_L) = Li₂(ω(2)). Dropping either the Chern sign −1 or the constant c₂ breaks the root normalization.
- For L = Q_5, the Gros-normalised map (1 − `5^{−2})·localRegulator` sends rootClassK3 (teichmuller 2) to a unit, so it is not localRegulator and does not have image 25Z_5.

### 5.8 The unramified p > 3 theorem

Let p > 3 and let L be a finite unramified étale Q_p-algebra (for instance K_p = K ⊗ Q_p for a number field K in which p is unramified). Then the Chern–Bloch–Kato composite λ_L of §5.7 is a Z_p-linear isomorphism K_3(L; Z_p) ≅ p²O_L, and so is the p-adic regulator D_L = −c₂·λ_L. The first statement is §1.10 at r = 2, where (r−1)! = 1, transported by the integral weight-two Chern isomorphism; it involves no normalization constant. The second follows because c₂ is a p-adic unit for p > 3 (§4.7). The statement is not asserted for p ∈ {2, 3}, for ramified L, or for the uncompleted group K_3(L).

GSWZ's route instead shows that the root values span p²O_L (§5.5) and applies Nakayama over ℤₚ: a map between free modules of the same finite rank whose reduction is surjective is bijective. That route needs the root normalization of §5.7, hence §4.7, and an a priori containment of the image in p²O_L. Rank zero is included, and multiplication by p fails the residue hypothesis. The regulator theorem concerns the actual completed K₃ map, with its Chern, logarithm and tame-root normalization.

See GSWZ2024 Theorem 9, (183), p. 39; BNQD2002 Lemme 1.3.2, p. 647.

*Needs:* §§1.10,5.7, and §4.7 for D_L; KTheoryFiniteLocalFields §§6.6–6.7; Mathlib Nakayama only for the alternative route.

**Checks.**

- L = `Q_{25}` × Q_5 (p = 5, GSWZ Example 4.3): K_3(L; Z_5) ≅ `25·(Z_{25} × Z_5).`
- L = Q_5: λ_L maps K_3(ℚ₅; ℤ₅) ≅ ℤ₅ onto 25ℤ₅. The root class [ω(2)] has D-value Li₂(ω(2)) ≡ 25 mod 125, of valuation exactly 2, so it is a generator (§5.9).
- If c₂ were divisible by p, D_L would map onto c₂p²O_L, a proper sublattice of p²O_L; the unnormalized λ_L is unaffected. The two statements of the theorem are therefore separate.
- p = 3, L = Q_3: K_3(Q_3; Z_3) ≅ Z_3 ⊕ Z/3 has torsion, so no injection into 9Z_3 exists; the theorem does not apply.
- L = Q_p(ζ_p), p odd (ramified): K_3(L; Z_p) has torsion Z/p, so the theorem does not apply.

### 5.9 Completed K₃ is generated by roots of unity

Let p > 3 and L a finite unramified étale Q_p-algebra. Then K_3(L; Z_p) is generated as a Z_p-module by the classes [ζ]_L, ζ ∈ μ(L) with every component ≠ 1; every ξ ∈ K_3(L; Z_p) has a finite presentation ξ = Σ_ζ a_ζ[ζ]_L with a_ζ ∈ Z_p, and for any such presentation D_L(ξ) = Σ_ζ a_ζ Li_2(ζ). Presentations are not unique; D_L(ξ) is. Proof: D_L is injective with image p²O_L (§5.8), it sends [ζ]_L to Li_2(ζ) (§5.7), and these values span p²O_L (§5.5). Without the calibration of §4.7 the same argument shows only that the root classes span D_L⁻¹(p²O_L), a sublattice of index p^(−v_p(c₂)[L:ℚ_p]); generation is equivalent to v_p(c₂)=0.

See GSWZ2024 Theorem 9, p. 39.

*Needs:* §§4.7,5.5–5.8; finite-product root classes.

**Checks.**

- p = 5, L = `Q_{25}` × Q_5: [ζ_24], [ζ_24²], [ζ_24⁶] form a Z_5-basis, as GSWZ (274)–(275) use.
- For L = Q_5 the single class [ω(2)] generates K_3(Q_5; Z_5) ≅ Z_5.

- For the zero algebra the completed group and the regulator target are 0; the empty linear combination equals its unique class.

### Examples

For p=5, f₅(2)=1, f₅(3)=4 and f₅(4)=0. The first two values differ, and one value is zero. The difference argument isolates a single coordinate of a residue product while every input coordinate remains admissible. Nakayama lifts these residue generators to p²𝒪_A, and equal ranks turn surjectivity into an isomorphism.

### Dependencies

Layers 1, 3–4; KTheoryFiniteLocalFields §§3.5,6.2,6.6–6.10; K3BlochGroups §§3.5,4.20,6.3–6.6; finite fields and Nakayama; the unramified Tate lattice calculation.

## Layer 6: global K₃ regulators and arithmetic applications

Let F be a number field and `Fₚ=F⊗ℚℚₚ=∏_{v|p}Fᵥ.` The global regulator has algebraic source K₃(F), while the integral local theorem has a completed source. Passing between them uses localization and completion, not an identification of the two groups.

### 6.1 The global p-adic K₃ regulator

Let F be a number field and p a prime. The global p-adic regulator is `D_{F,p}` := `D_{F⊗Q_p}` ∘ `λ_{F,p}` : K_3(F) → F ⊗_Q Q_p ≅ `∏_{v|p}` F_v, where `λ_{F,p}` : K_3(F) → `∏_{v|p}` K_3(F_v; Z_p) = K_3(F ⊗ Q_p; Z_p) is the semilocal completed map of KTheoryFiniteLocalFields §7.6 and `D_{F⊗Q_p}` is the regulator of §5.7. It kills the torsion subgroup of K_3(F) and induces `D_{F,p}` ⊗ Q : K_3(F) ⊗ Q → F ⊗ Q_p; for p > 3 unramified in F its image lies in p²(O_F ⊗ Z_p).

- globalPadicRegulator F p : K_3(F) →+ F ⊗[ℚ] ℚ_[p].
- Its v-component is localRegulator F_v ∘ c_v.
- globalPadicRegulator F p x = 0 for every torsion x.
- For 3 < p unramified in F, its range lies in p² • (𝓞_F ⊗ ℤ_p).
- The extension K_3(F) ⊗ ℚ →ₗ[ℚ] F ⊗ ℚ_[p].
- For τ ∈ Aut(F), globalPadicRegulator F p ∘ K_3(τ) = (τ ⊗ 1) ∘ globalPadicRegulator F p.

See GSWZ2024 §1.5, (19), p. 9.

*Needs:* §5.7; KTheoryFiniteLocalFields §7.6; ArithmeticKTheory §§2.1,3.2–3.4.

**Checks.**

- globalPadicRegulator ℚ p = 0, since K_3(ℚ) is torsion (ArithmeticKTheory §§3.2–3.4). For F=ℚ(i), the rational source has dimension 1, independently of whether this p-adic regulator is injective.
- For F totally real, K_3(F) ⊗ Q = 0 (Borel: rank r_2 = 0), so globalPadicRegulator F p ⊗ Q = 0.
- For ξ ∈ K_3(F) whose Bloch image is presented by special units at p, globalPadicRegulator F p ξ = blochDilog F p (presentation) (§6.2).
- For F imaginary quadratic and p split, K_3(F) ⊗ Q has rank 1 while F ⊗ Q_p has rank 2; injectivity of globalPadicRegulator ⊗ Q is a separate proposition (§6.7), not a consequence of the ranks.

### 6.2 The global regulator on special-unit presentations

Let F be a number field, p a prime, and let ξ ∈ K_3(F) have image in B(F) ⊗ Q presented as Σ_i n_i[z_i] (n_i ∈ Q) with z_i and 1 − z_i units at every prime of F above p. Then `D_{F,p}(ξ)` = Σ_i n_i `D_{F,p}^{dil}([z_i]),` where `D^{dil}_{F,p}` is the combined dilogarithm of §3.3. There is no residual sign: the Chern factor of §4.1 and the Suslin–de Jeu constant c₂ of §4.7 are both absorbed once in the definition of D_L in §5.7, and torsion in K_3(F) has zero regulator. In particular: (a) for every root of unity ζ ≠ 1 of F, `D_{F,p}([ζ])` = Li_2(ζ ⊗ 1) componentwise; (b) for a fixed presentation the hypothesis holds for all but finitely many p; (c) when R = O_F[1/Δ] and all z_i, 1 − z_i ∈ R^×, the formula holds at every p ∤ Δ. For presentations by symbols that are not special units at p the formula is Besser–de Jeu's Conjecture 1.14 (conjectural in this generality).

See BdJ2003 Theorem 1.10(2) and Remark 1.11, p. 5; GSWZ2024 Lemma 3.1, p. 38.

*Needs:* §§3.3,4.3,4.7,5.7,6.1; ColemanIntegration §§L3.Fa.4,L3.Fb.5,L3.15.

**Checks.**

- F = Q(α), α³ − α² + 1 = 0: ξ = 2[1 − α²] + [1 − α] with 1 − α², α², 1 − α, α global units, so the formula holds at every p (§6.8).
- F = Q(ζ_m), p ∤ m: `D_{F,p}([ζ_m])` = (Li_2(σ_v `ζ_m))_{v|p}.`

- The empty presentation gives zero image of ξ in B(F) ⊗ Q and regulator 0; it does not force ξ=0. Over ℚ the Milnor class {−1,−1,−1} is a nonzero element of K_3(ℚ) of order two (K3BlochGroups §2.3) with empty presentation and zero regulator. Changing a valid presentation by a five-term relation adds 0 to its dilogarithm value.

### 6.3 Restriction and transfer for the global regulator

Let E/F be a finite extension of number fields and p a prime. (a) Restriction: `D_{E,p}(res_{E/F} ξ)` = `ι(D_{F,p}(ξ))` for ξ ∈ K_3(F), ι : F ⊗ Q_p → E ⊗ Q_p. (b) Transfer: `D_{F,p}(N_{E/F} η)` = `Tr_{E⊗Q_p/F⊗Q_p}(D_{E,p}(η))` for η ∈ K_3(E). (c) Consequently `D_{F,p}(N_{E/F} res_{E/F} ξ)` = [E : `F]·D_{F,p}(ξ).` The same holds for the local regulators of Layer 5 along finite extensions of finite étale Q_p-algebras.

See GSWZ2024 §3.1, paragraph after (174), p. 38.

*Needs:* §§1.7,5.7,6.1; KTheoryFiniteLocalFields §7.6.

**Checks.**

- F = Q, E = Q(ζ_3), p = 7: `D_{Q,7}(N[ζ_3])` = `Tr(D_{E,7}([ζ_3]))` = Li_2(ζ_3) + `Li_2(ζ_3^{−1})` = 0, consistent with K_3(Q) being torsion.
- Transfer is not multiplicative on sections: the HabiroNumberFields norm of sections corresponds to this additive trace on degrees, not to a product of regulators.

- For E=F the degree is 1 and both restriction–transfer and trace are identity; the zero class gives 0 on both sides.

### 6.4 Frobenius compatibility of the p-adic regulator

Let p be unramified in the number field F and let φ_p be the Frobenius of the unramified étale algebra F ⊗ Q_p ≅ `∏_{v|p}` F_v (the product of the arithmetic Frobenii). Then φ_p acts on K_3(F ⊗ Q_p; Z_p) by functoriality and `D_{F⊗Q_p}(φ_p x)` = `φ_p(D_{F⊗Q_p}(x));` in particular D_p(φ_p ξ) = φ_p D_p(ξ) for ξ ∈ K_3(F), with φ_p ξ := φ_p `λ_{F,p}(ξ).` On root-of-unity classes, φ_p[ζ] = [ζ^p] and D(ζ^p) = φ_p D(ζ).

See GSWZ2024 §3.1, (176), p. 38.

*Needs:* §§3.2,5.6–5.7,6.1; Tau Ceti arithmetic Frobenius.

**Checks.**

- In the cubic example, modulo 5, α⁵=4α+4 and φ(4α²+4α+2)=4α²+4α+2. Thus p⁻²D(ζ₂₄⁵) has that same leading coefficient. The second row of GSWZ (273), with leading coefficient 2α²+3α+1, belongs to ζ₂₄². On the quadratic factor α²+α+2=0 these coefficients are 4 and α+2; on the linear factor α=2 they are 1 and 0. The second row cannot test the Frobenius identity.
- With the geometric Frobenius in place of the arithmetic one the identity reads `D(ζ^{p^{-1}})` = `φ^{−1}D(ζ);` the convention is pinned to the arithmetic Frobenius (Huber–Kings warn about this choice).

- For F=ℚ and p=5, φ₅=id on ℚ₅ and on its tame roots, so D(ω(2)⁵)≡25≡φ₅D(ω(2)) modulo 125.

### 6.5 Torsion classes and controlled denominators

Let F be a number field and p > 3 unramified in F. (a) Every torsion element of K_3(F) has `D_{F,p}` = 0. (b) If β ∈ K_3(F) ⊗ Q satisfies Nβ ∈ image(K_3(F)) for a nonzero integer N, then `D_{F,p}(β)` ∈ `p^{2 − v_p(N)}(O_F ⊗ Z_p).` (c) For a root of unity ζ ∈ μ(F) ∖ {1} of order m, the coefficient-localised class ⟦ζ⟧ ∈ B(F) ⊗ Z[1/m] of K3BlochGroups §6.4 has `D_{F,p}(⟦ζ⟧)` = Li_2(ζ ⊗ 1), which lies in p²(O_F ⊗ Z_p) when p ∤ m. (d) The image `D_{F,p}(K_3(F))` is a finitely generated Z-submodule of rank at most r_2(F) inside p²(O_F ⊗ Z_p); its Z_p-span need not be all of p²(O_F ⊗ Z_p).

See GSWZ2024 Proof of Theorem 9, p. 39; ArithmeticKTheory §§2.1,3.2–3.4 for finite generation and the rank bound.

*Needs:* §§5.8,6.1–6.2; K3BlochGroups §6.4; ArithmeticKTheory §§2.1,3.2–3.4.

**Checks.**

- F = Q(√−3), p = 7 (split): `D_{F,7}` kills the finite torsion subgroup Z/w_2(F); the non-torsion part has rank r_2 = 1 inside a rank-2 target.
- If N=p and pβ is integral, the bound places its regulator in p(O_F⊗Z_p). This is an upper bound on denominators; it does not establish that a global class attains the bound.

- At N=p² the lattice bound is p⁰(𝒪_F⊗ℤₚ); at N=1 it is p²(𝒪_F⊗ℤₚ). For β=0 both values are 0, without asserting that either bound is attained.

### 6.6 The regulator exported to Habiro-module gluing

Let K be a number field, Δ a positive integer divisible by disc(K) and by 6, R = O_K[1/Δ], and p ∤ Δ (so p > 3 is unramified in K). The p-adic regulator used to define invertible L_p(ξ)-sections (GSWZ Definition 1.3, (22)) is D_p := `D_{K,p}` : K_3(K) → p²R^∧_p ⊂ K_p = R^∧_p[1/p] = K ⊗ Q_p, with: (i) the Iwasawa branch and D_p([ζ]) = Li_2(ζ) on roots of unity; (ii) D_p(φ_p ξ) = φ_p D_p(ξ); (iii) D_p(ξ) = Σ n_i D(z_i) for presentations by Δ-special units z_i, 1 − z_i ∈ R^×; (iv) every ξ has a Z_p-presentation `λ_{K,p}(ξ)` = Σ a_ζ `[ζ]_{K_p}` by roots of unity of order prime to p with all components ≠ 1, and D_p(ξ) = Σ a_ζ Li_2(ζ); (v) scalar dictionary: D_p = −c₂·log_BK∘r^et_2 = c₂·log_BK∘r^(et,ch)_2 (Bloch–Kato, e_2-basis) and D_p = c₂·reg_syn for the Chern-character syntomic regulator of §4.1, with c₂ the universal Suslin–de Jeu constant of §4.7; the Gros normalisation is (1 − φ_p/p²)·D_p, which maps p²R^∧_p onto R^∧_p. No injectivity of `λ_{K,p}` ⊗ Q is asserted (§6.7).

See GSWZ2024 Definition 1.3, (20)–(22), p. 9; GSWZ2024 Theorem 1, p. 9.

*Needs:* §§3.2–3.4,4.7,5.8–5.9,6.1–6.5; KTheoryFiniteLocalFields §7.6.

**Checks.**

- GSWZ Example 4.3 at p = 5 (Δ = 6·23): §6.8.
- With the Gros normalisation in (22) the integrality condition (21) would change by the factor (1 − φ_p/p²); the export pins Besser's normalisation.

- For K=ℚ the global regulator is 0, although the completed local regulator has image p²ℤₚ. Thus this export does not identify a global image with the local lattice.

### 6.7 The p-adic K₃ regulator injectivity proposition

For a number field F and prime p, use ArithmeticKTheory §§3.2–3.4’s finite generation and Borel formula dim_ℚ(K₃(F)⊗ℚ)=r₂(F) in every rank equivalence and totally-real consequence below. Inj(F,p) means injectivity of the Q-linear map `D_{F,p}⊗Q:K_3(F)⊗Q→F⊗Q_p.` Since the source has Q-dimension r_2(F), this is equivalent to Z-rank r_2(F) of the finitely generated integral image. Separately, StrongInj(F,p) means injectivity of the Q_p-linear extension K_3(F)⊗Q_p→F⊗Q_p, equivalently Q_p-dimension r_2(F) of its span, or Z_p-rank r_2(F) of the Z_p-span. StrongInj implies Inj; the converse is not a formal equivalence. Neither assertion for positive r_2 follows from Borel’s rank formula or the local Layer 5 isomorphism.

- PadicK3RegulatorInjective F p : Prop := Function.Injective (globalPadicRegulator_rat F p).
- If F is totally real, PadicK3RegulatorInjective F p holds.
- PadicK3RegulatorInjective F p ↔ the integral image has Z-rank r_2(F), equivalently the rational image has Q-dimension r_2(F). This is not a Q_p-span criterion.
- For E/F finite, PadicK3RegulatorInjective E p implies PadicK3RegulatorInjective F p (restriction is injective rationally and compatible with §6.3).
- Function.Injective of the Q_p-linear extension of globalPadicRegulator_rat; equivalent to Q_p-span dimension r_2(F).
- StrongPadicK3RegulatorInjective F p implies PadicK3RegulatorInjective F p; no converse from linear algebra.
- The injectivity predicates depend only on the specified Q-linear or Q_p-linear map respectively: pointwise equal maps give equivalent predicates. Proof witnesses are unique by proof irrelevance; scalar extension is not an extensionality equivalence.

See GSWZ2024 §1.5, (19), p.9 for the global map; the rank equivalences use linear algebra and the imported Borel rank theorem. GSWZ Theorem 9, p.39 is a local theorem and supplies no global injectivity.

*Needs:* §§6.1,6.3; ArithmeticKTheory §§3.2–3.4; Mathlib tensor products and rank.

**Checks.**

- PadicK3RegulatorInjective ℚ p holds, since K_3(ℚ) ⊗ ℚ = 0.
- For F totally real (r_2 = 0) the source is zero and the proposition holds.
- For F imaginary quadratic, the proposition is equivalent to `D_{F,p}(ξ_0)` ≠ 0 for a generator ξ_0 of K_3(F) modulo torsion.
- A zero map from a nonzero Q-vector space into a larger Q_p-vector space is not injective. The inequality r_2≤[F:Q] alone supplies no information about the regulator’s kernel.
- For α∈Q_p outside Q, (a,b)↦a+αb on Q² is injective, while the Q_p-linear map with the same formula has nonzero kernel (−α,1). Thus rational injectivity alone does not imply full Q_p-span rank.

### 6.8 GSWZ Example 4.3: the class of 5₂ at p = 5

Let K = Q(α), α³ − α² + 1 = 0 (discriminant −23), z_1 = z_3 = 1 − α², z_2 = z_1² − z_1 + 2 = 1 − α, and ξ = [z_1] + [z_2] + [z_3] = 2[1 − α²] + [1 − α] ∈ B(K) (the class of the knot 5_2). All of 1 − α², α², 1 − α and α are units of O_K (norm ±1). At p = 5, K_5 ≅ `Q_{25}` × Q_5, μ(K_5) ≅ μ_24 × μ_4, and ζ_24 := lim_s `α^{5^{2s}}` has order 24 with Q_5-component the Teichmüller lift of 2 (order 4). Then D_5(ξ) = c_1D_5(ζ_24) + c_2D_5(ζ_24²) + c_3D_5(ζ_24⁶) with c_1 = 1 + 4·5 + 3·5² + ⋯, c_2 = 3 + 5 + ⋯, c_3 = 1 + 5 + 4·5² + ⋯, hence `λ_{K,5}(ξ)` = c_1[ζ_24] + c_2[ζ_24²] + c_3[ζ_24⁶] in K_3(K_5; Z_5). The second line of GSWZ (273) is the value D_5(ζ_24²), misprinted there with the label ζ_24^5.

See GSWZ2024 Example 4.3, (270)–(275), p. 54; GSWZ2024 Example 4.3, (274), p. 54.

*Needs:* §§3.3,5.5–5.9,6.2,6.4; NumberFieldArithmetic splitting and unit interfaces.

**Checks.**

- Modulo 5, X³−X²+1=(X−2)(X²+X+2); the quadratic discriminant is 3, a nonsquare, giving residue degrees 1 and 2.
- The three leading coefficient rows (2,4,4), (1,3,2), (2,3,3), in the order (1,α,α²), have determinant 3 in 𝔽₅; they therefore give three independent local residue values.
- Their coefficients (c₁,c₂,c₃) reduce to (1,3,1); the resulting row is (2,1,3), the leading coefficient 2+α+3α² of D₅(ξ)/25.

### Examples

For the cubic field of discriminant −23 at p=5, the completion has factors of residue degrees two and one. Three tame-root classes form a basis of its completed local K₃. A global class is then expanded with coefficients in ℤ₅; it is not thereby expressed as a unique integral combination in algebraic global K₃.

### Dependencies

Layers 3–5; KTheoryFiniteLocalFields §§1.5,3.5,6.2,6.8–6.10,7.6; ArithmeticKTheory §§2.1,3.2–3.4; K3BlochGroups §§6.3–6.4,6.6. HabiroNumberFields §§3.0a–3.0b and HabiroNahmSeries consume the resulting contract.

## Layer 7: curve regulators in good and semistable reduction

For good reduction let K/ℚₚ be finite unramified, k=𝔽_q with q=pᶠ, and 𝒳/𝒪_K a smooth proper geometrically connected relative curve with generic fibre X. Write H=H¹_dR(X/K), φₚ for semilinear crystalline Frobenius, and Φ=φₚᶠ for its K-linear q-power. The later relative and semistable subsections state their own broader hypotheses.

### 7.1 The weight-two syntomic target of a curve and its two identifications

Let K/Q_p be finite unramified of degree f, q=p^f, and 𝒳/O_K a smooth proper geometrically connected curve, X=𝒳_K. Set H=H¹_dR(X/K)=H¹_rig(𝒳_k/K), Φ=φ_p^f (K-linear), P=φ_p/p² (Q_p-linear), A=1−P, Q=Φ/q²=P^f, B=1−Q, and `N_f=Σ_{j=0}^{f−1}P^j,` so B=N_f A. The rigid syntomic complex is Besser’s full filtered homotopy fibre product, not a single cone on H. Map its Frobenius-cone component to the fixed-q modified model by (id,N_f), with identity on the other fibre-product legs. This induces β:H²_syn,rig(𝒳,2)→H²_ms,q(𝒳,2). Let j_q:H→H²_ms,q be the raw boundary [(0,ε)], and j_p:H→H²_syn,rig the raw boundary in the collapsed unramified model. Curve weights and Fil²H¹=Fil²H²=0 give isomorphisms β,j_p,j_q,A,B, with βj_p=j_qN_f. The normalized identification is Θ=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹. Transport the K-module structure on the initially Q_p-linear rigid target through Θ. The fixed-q canonical boundary is ι=β⁻¹j_q, a K-linear equivalence with this transported structure, and Θ=B⁻¹ι⁻¹. For f>1, ι need not equal j_p. The alternating trace pairing on H satisfies B_cup(Φa,Φb)=q B_cup(a,b) and its second-kind residue formula.

- curveSyntomicTarget 𝒳 := H^2_syn(𝒳, 2).
- ι=β⁻¹j_q:H≃ₗ[K]H²_syn,rig, with K-scalars transported by Θ; it is the fixed-q raw boundary, not necessarily j_p.
- Θ=B⁻¹ι⁻¹=B⁻¹j_q⁻¹β=A⁻¹j_p⁻¹; it is the inverse normalized boundary.
- cupTrace X : LinearMap.BilinForm K (H1dR X), alternating.
- The K-linear q-power Frobenius Φ satisfies cupTrace(Φa,Φb)=q·cupTrace(a,b).
- For second-kind forms, cupTrace [dF] [dG] = Σ_x Res_x(F dG).
- If Φv=γv with γ≠0, its q-similitude identity gives cupTrace(Φa,v)=(q/γ)·cupTrace(a,v).
- The canonical/normalized equivalences are determined by their values on cohomology classes, and cupTrace by its values on pairs. Require the explicit comparison maps before transporting the K-module structure.
- β is induced by (id,N_f) on the Frobenius cone and identity on the other homotopy-fibre-product legs.
- βj_p=j_qN_f; βδ_rig=δ_ms for δ_rig=j_pA and δ_ms=j_qB.
- Θ=A⁻¹j_p⁻¹ as a Q_p-linear map; this determines the transported K-module structure.

See BdJ2003 Definition 4.6, p. 24; Ara2003 Lemma 3.3, p. 8; Besser2000 Proposition 8.6(3), Remark 8.7(3) and Proposition 10.1(3), author preprint pp. 26–28,34.

*Needs:* CohomologyComparisonsPartII §§2.1–2.3; §0.1; AlgebraicCurves de Rham cohomology; ColemanIntegration good-reduction comparison.

**Checks.**

- For 𝒳 = `P^1_{O_K},` curveSyntomicTarget 𝒳 = 0.
- In weight one for Spec O_K (i = n = 1), the normalised class of a unit u is log u while the canonical class is (1 − 1/q)·log u.
- If φv = γv then B(φa, v) = (q/γ)B(a, v); for p = q = 5 and γ = 2, (1 − 1/(pγ)) = 9/10 is the factor between canonical and normalised pairings.
- For H^3_syn(𝒳, 1) the operator 1 − φ/q on H^2_rig(𝒳_k) is zero (φ = q there), so no normalised identification exists; Besser–de Jeu Definition 4.6 requires n ≥ i > dim.
- For f=2, N_f=1+P, B=1−P²=(1+P)A, βj_p=j_q(1+P); substituting j_p for ι omits a norm operator.
- For f>1 and a∈K with σ(a)≠a, P(av)=σ(a)P(v), so A(av) need not equal aA(v); K-linearity is obtained by Θ-transport, not by calling A K-linear.

### 7.2 The Frobenius splitting for an open curve

Under §7.1’s good-reduction hypotheses, write φ=Φ for q-power Frobenius. Let (𝒳, D) be a good-reduction pair (ColemanIntegration §L1.1) with D finite étale over O_K and Y = 𝒳 ∖ D. Define the splitting on H¹_rig(Y_k/K), with its de Rham comparison, for every finite étale D including D=∅. For nonempty D the open curve is affine and this cohomology is computed by Ω¹(A†(Y))/dA†(Y); for D=∅ use derived global de Rham cohomology and put p_D=id. In the modified model H̃²_ms(Y,2) identifies with this cohomology. The restriction res : H^1_dR(X) → H^1_dR(Y) is φ-equivariant and injective, and there is a unique φ-equivariant retraction p_D : H^1_dR(Y) → H^1_dR(X) (H^1(X) has Frobenius weight 1 and the cokernel of res, spanned by residues, weight 2). p_D does not depend on the Frobenius lift and is compatible with enlarging D.

- openCurveSplitting 𝒳 D : H1dR (Y) →ₗ[K] H1dR X.
- openCurveSplitting 𝒳 D ∘ res = id.
- openCurveSplitting commutes with φ and is the unique such retraction.
- For D ⊆ D', openCurveSplitting 𝒳 D' ∘ `res_{Y,Y'}` = openCurveSplitting 𝒳 D.

See BdJ2012 §1, pp. 4–5.

*Needs:* §7.1; CohomologyComparisonsPartII §6.6; ColemanIntegration §L1.1; Frobenius weights of smooth proper curves.

**Checks.**

- For P^1 and D = {0, ∞}, openCurveSplitting = 0.
- For an elliptic curve X with good reduction and D=∅, p_D=id on a two-dimensional H¹; global functions A†(X)=K give a zero differential quotient, which cannot compute this group.
- openCurveSplitting 𝒳 D ∘ res = id on H1dR X.
- For X=P¹ and D={0,∞}, dlog(t) has nonzero boundary residues and projects to 0, while residue-free cohomology is the image of H¹(X), not a proposed complementary subspace. A rule equating the complementary summand with residue-free cohomology is therefore wrong.

### 7.3 The degree-two syntomic regulator of a curve

Under §7.1’s good-reduction hypotheses, write φ=Φ for q-power Frobenius. For u ∈ K_2(𝒳) ⊗ Q define reg_syn(u) ∈ H^2_syn(𝒳, 2) by the syntomic Chern character `ch^syn_{2,2}` of §4.1. That character is defined on all of K_2(𝒳), and AM18 §1, p.1, uses this domain. Its restriction to the weight-two summand `K_2(𝒳)^{(2)}` ⊗ Q of SchemeKTheoryOperations §6.9 is the motivic regulator. The larger domain is needed because a K-theory transfer along a ramified finite morphism need not preserve that summand (§7.6). On this domain put regSynCan(u) := `ι^{−1}(reg_syn(u))` and regP(u) := Θ(reg_syn(u)) = (1 − `φ/q²)^{−1}regSynCan(u)` in H^1_dR(X/K). If the restriction of u to Y = 𝒳 ∖ D is a finite sum Σ n_i{f_i, g_i} of symbols with f_i, g_i ∈ O(Y)^×, then regSynCan(u) = p_D[Σ_i n_i ε(f_i, g_i)] with ε(f, g) := `q^{−2}·log(f_0)·φ^*dlog` g − `q^{−1}·log(g_0)·dlog` f, f_0 := f^q/φ^*f (a class in H̃²_ms(Y,2)=H¹_rig(Y_k/K), computed by the global dagger differential quotient only when D is nonempty), and regP(u) = p_D((1 − `φ^*/q²)^{−1}[Σ_i n_i ε(f_i, g_i)]).` This gives the full 2g-coordinate regulator vector, not only its pairing with holomorphic forms. Here ε(f,g) is the cup product of the weight-one classes of f and g (BdJ2003 Lemma 4.7 and (4.8); AM18 Proposition 6.4 uses the same symbol map), so the formula is the Chern-character one; the second Chern class `c^syn_{2,2}` = −`ch^syn_{2,2}` sends the same symbol to −p_D[ε(f,g)]. The same Chern-character normalization is used in §§7.4–7.11.

- curveSyntomicRegulator 𝒳 : K_2(𝒳)_ℚ →ₗ[ℚ] curveSyntomicTarget 𝒳 is given by `ch^syn_{2,2}`. Its restriction to `K_2(𝒳)^{(2)}_ℚ` is the weight-two regulator.
- regSynCan := canIso⁻¹ ∘ curveSyntomicRegulator.
- regP := normIso ∘ curveSyntomicRegulator.
- regSynCan u = (1 − q⁻² • φ) (regP u).
- On a symbol presentation on Y, regP u = openCurveSplitting ((1 − φ^*/q²)⁻¹ [Σ n_i ε(f_i, g_i)]).
- For φ v = γ v: cupTrace (x − `q^{−2}φ` x) v = (1 − 1/(qγ))·cupTrace x v, the pairing form of regSynCan = (1 − φ/q²)·regP.
- The weight-three Chern character `ch^syn_{3,2}` of a class in K_2(𝒳) ⊗ Q lands in H^4_syn(𝒳, 3), which is zero for a curve: H³_rig of the special fibre and H⁴_dR of the generic fibre vanish.
- `ch^syn_{0,2}` = 0, and `ch^syn_{1,2}` lands in H⁰_syn(𝒳, 1) = 0 because Fil¹H⁰_dR = 0. Hence, by multiplicativity, reg_syn(u·w) = rank(w)·reg_syn(u) for u ∈ K_2(𝒳) and w ∈ K_0(𝒳).

See AM18 Proposition 6.4, p. 34; BdJ2003 Lemma 4.7, p. 24; Besser2000 Proposition 10.3, author preprint p. 35.

*Needs:* §§4.1,7.1–7.2; K2SymbolsBrauer §§9.2–9.4; ColemanIntegration logarithms.

**Checks.**

- For c ∈ `μ_{q−1},` regSynCan {f, c} = 0.
- regSynCan {f, f} = 0.
- For the Chern-class normalization the symbol formula changes sign: `c^syn_{2,2}{f,g}` restricts to −p_D[ε(f,g)]. On a curve and symbol with p_D[ε(f,g)] ≠ 0, keeping +p_D[ε(f,g)] with the Chern class is wrong by the factor −1.
- If φv = γv, B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v) for K = Q_p.
- Feeding regSynCan instead of regP into the Coleman symbol formula is off by (1 − φ/q²); on an eigen-pairing by the factor (1 − 1/(pγ)).

### 7.4 Besser's Coleman-integral formula for the regulator of a symbol

Under §7.1’s good-reduction hypotheses, write φ=Φ for q-power Frobenius. Let u ∈ `K_2(𝒳)^{(2)}` ⊗ Q restrict on Y = 𝒳 ∖ D to Σ_i n_i{f_i, g_i} with f_i, g_i ∈ O(Y)^× and (𝒳, D) a good-reduction pair containing all supports, and let ω ∈ H^0(X, Ω^1). Then B(regP(u), [ω]) = Σ_i n_i `Σ_{x ∈ |D_K|}` `ord_x(f_i)·Tr_{K(x)/K}(CT_x(∫ log(g_i)·ω)),` where ∫ log(g_i)ω is the Coleman integral (ColemanIntegration §L1.19) and CT_x the log-free constant term at x in a local parameter (after a finite extension, descending by Galois equivariance). The value is independent of the branch of the logarithm and of the constant of integration. Equivalently Tr_X(Θ(reg_syn{f, g}) ∪ [ω]) = `∫_{(f)}` log(g)ω (Coleman–de Shalit's p-adic regulator). The formula holds for Θ = regP, not for the canonical regSynCan.

See AM18 Theorem 9.1, p. 45; BdJ2012 Remark 1.10, p. 4.

*Needs:* §§7.1–7.3; ColemanIntegration §L1.19, constant terms and closed-point traces; AlgebraicCurves divisors.

**Checks.**

- For a genus-zero proper curve the target H¹_dR is zero.
- Adding a constant C to the primitive adds C·deg(div f)=0.
- In the scalar pairing model p=5, γ=2, regSynCan gives 9/10 of the regP pairing (§7.3).

### 7.5 The curve regulator and the Bloch–Kato logarithm

Under §7.1’s good-reduction hypotheses, write φ=Φ for q-power Frobenius. Put V = H^1_et(X_K̄, Q_p(2)), a crystalline representation with D_cris(V) = H^1_dR(X/K) ⊗ e_2 and `V^{G_K}` = 0. For u ∈ K_2(𝒳) ⊗ Q (the domain of §7.3) the étale regulator r^et(u) ∈ H^1(K, V), normalized like reg_syn by the Chern character (§4.1; the Chern-class normalization negates both sides), lies in H^1_f = H^1_e, and regP(u) = log_BK(r^et(u)) under D_dR(V)/Fil^0 = H^1_dR(X/K); equivalently regSynCan(u) = (1 − Φ/q²)·log_BK(r^et(u)) for every such K, where Φ=φ_p^f and regSynCan uses the fixed-q boundary ι=β⁻¹j_q. For K=Q_p this is 1−φ_p/p². For K=Q_p, if φ_p v = γv then B(regSynCan u, v) = (1 − 1/(pγ))·B(regP u, v).

See AC20 Footnote 4, p. 43; NN2016 Proposition 1.1, p. 3; Besser2000 Proposition 9.11, author preprint p. 32; Besser2000 Proposition 8.6(2),(3), Remark 8.7(3), Proposition 9.11 and Proposition 10.1(3), author pp. 26–28,32,34.

*Needs:* §§1.3,4.2,7.1,7.3; CohomologyComparisonsPartII §§2–5; the good-reduction crystalline realization.

**Checks.**

- For E/Q_p with good reduction and v a φ-eigenvector with eigenvalue γ: Tr(regSynCan(z) ∪ v) = (1 − `p^{−1}γ^{−1})Tr(log` reg_f(z) ∪ v) (Asakura–Chida footnote 4).
- For X=ℙ¹, both H¹_dR and the regulator vector vanish.

- At K=ℚ₅ and a Frobenius test eigenvalue γ=2, the canonical pairing is (1−1/10)=9/10 times the logarithmic pairing; the normalized factor is 1.

### 7.6 Pullback, pushforward and base change of the curve regulator

Under §7.1’s good-reduction hypotheses, write φ=Φ for q-power Frobenius. Let π : 𝒳' → 𝒳 be a finite flat morphism of good-reduction curves. (a) Pullback: regP(π^*u) = π^*regP(u), and B'(π^*a, π^*b) = deg(π)·B(a, b). (b) Pushforward: for u′ ∈ K_2(𝒳′) ⊗ Q, regP(π_*u′) = π_*regP(u′). Here π_* on the left is the K-theory transfer of SchemeKTheoryOperations §2.3, regP is §7.3's map on all of K_2 ⊗ Q, and π_* on the right is the de Rham trace, characterised by B(π_*a', b) = B'(a', π^*b). The transfer of a weight-two class need not have weight two. Adams–Riemann–Roch (SchemeKTheoryOperations §7.5) gives ψ^k(π_*x) = π_*(θ^k(−T_π^∨)ψ^k x), and for ramified π the correction θ^k(−T_π^∨) is not 1 (Checks). Pullback preserves the weight-two summand, and so does the finite étale transfer of (c) (SchemeKTheoryOperations §6.11). At the level of symbols, `∫_{(π^*f)}` log(g)·π^*ω = `∫_{(f)}` log(N g)·ω. (c) Base change: for K'/K finite unramified, `regP(u|_{𝒳_{O_{K'}}})` = regP(u) ⊗ 1, and the transfer `N_{K'/K}` corresponds to `Tr_{K'/K}.` These base-change and transfer assertions use the normalized regP. If d=[K′:K], q′=q^d and Φ′=Φ^d on the base-changed cohomology, the raw fixed-Frobenius coordinate instead satisfies regSynCan,K′(u|K′)=N_d·(regSynCan,K(u)⊗1), with `N_d=Σ_{j=0}^{d−1}(Φ/q²)^j.` This is the identity 1−(Φ/q²)^d=N_d(1−Φ/q²); raw transfer likewise requires normalization. Prove pushforward through the étale comparison §7.5 on all of K_2 ⊗ Q and the corestriction compatibility of r^et. On the image of pullback, use the projection formula π_*π^*u = u·[π_*𝒪_𝒳′] (SchemeKTheoryOperations §2.4) and §7.3's rank formula, which give regP(π_*π^*u) = deg(π)·regP(u) = π_*π^*regP(u).

See Ara2003 Lemmas 3.6–3.7, p. 8; Besser2000 Proposition 8.6(2),(3) and Remark 8.7(3), author pp. 26–28.

*Needs:* §§1.7,7.1,7.3,7.5; SchemeKTheoryOperations §§2.3–2.4 for the transfer and projection formula, §7.5 for Adams–Riemann–Roch and §6.11 for finite étale transfers; for the Checks, §5.5 for the projective bundle and §§6.4, 6.8–6.9 for Adams weights; AlgebraicCurves finite flat pullback and de Rham trace.

**Checks.**

- For π multiplication by a nonzero integer n on an elliptic curve: regP(π^*u) = π^*regP(u) and π^* acts on H^1_dR by n.
- For a Fermat-curve quotient the symbol identity `∫_{(π^*f)}` log(g)π^*ω = `∫_{(f)}` log(Ng)ω holds.
- For an unramified quadratic base change, regSynCan,K′=(1+Φ/q²)·regSynCan,K after scalar extension. A proposed raw-coordinate equality without this factor fails on a nonzero Φ-eigenvector unless Φ/q² acts by zero on it.
- Transfer leaves the weight-two summand. Let π:ℙ¹_ℤ₅→ℙ¹_ℤ₅ be [u:v]↦[u²:v²], a finite flat ramified morphism of degree 2 between good-reduction curves. Then π_*𝒪=𝒪⊕𝒪(−1). Put h=[𝒪(−1)]−1, so that h²=0 and ψ^k(h)=kh. Take a∈K_2(ℤ₅)^(2)⊗ℚ, viewed on the target. The projection formula gives π_*π^*a=a·(2+h)=2a+ah, and ψ^k(ah)=k²a·kh=k³ah, so ah has weight three. By the projective bundle formula ah≠0 whenever a≠0, and a nonzero a exists: for units x,y∈1+5ℤ₅ algebraically independent over ℚ, the symbol {x,y} has weight two and dlog{x,y}=dx/x∧dy/y≠0 in the ℚ-vector space Ω²_(ℚ₅/ℚ). So the transfer of the weight-two class π^*a is outside `K_2(𝒳)^{(2)}_ℚ`, and a regulator defined only there could not be applied to it.
- Adams–Riemann–Roch in the same example. On the source write h′=[𝒪(−1)]−1. Then T_π^∨=[𝒪(−2)]−[𝒪(−4)] and θ²(−T_π^∨)=(1+[𝒪(−4)])/(1+[𝒪(−2)])=(2+4h′)/(2+2h′)=1+h′. Using π_*h′=[π_*𝒪(−1)]−[π_*𝒪]=(2+2h)−(2+h)=h, this gives ψ²(π_*π^*a)=π_*((1+h′)·4π^*a)=4(2a+ah+ah)=8a+8ah. That is ψ² applied directly to 2a+ah, with eigenvalues 4 and 8 on the two summands. Omitting the correction would give 8a+4ah, a false weight-two transfer.
- With §7.3's extension, regP(ah)=rank(h)·regP(a)=0, and both sides of (b) for u′=π^*a equal 2·regP(a)=deg(π)·regP(a). Here this value is 0 because H¹_dR(ℙ¹)=0. The rank formula, not the target, is what kills the weight-three term in general.

### 7.7 What bad or semistable reduction requires beyond good reduction

For a smooth proper semistable curve X/K, NN Theorems A,B provide rational syntomic cohomology and compatible Chern classes; the arithmetic regulator factors through H¹_st(G_K,H¹_et(X_K̄,Q_p(2))). The semistable comparison imports the Hyodo–Kato (φ,N) structure from CohomologyComparisons §§4.2–4.5. Besser–Zerbes Theorem 1.1 identifies Vologodsky integration with appropriately corrected/glued Coleman primitives on semistable curves. These two results alone do not give the weight-two symbol formula. The regulator-specific continuous/discrete coordinates and full second-kind pairing are specified by §7.10 and §7.11, using Besser2025 and BR2019. Those targets pair the continuous component with ker N and determine its class modulo im N; ker N is a restriction on test forms, not the regulator domain. The conclusions in §§7.7,7.10–7.11 use CohomologyComparisonsPartII §§3–5 and gap:semistable-period-descent, and ColemanIntegrationPartII §§1.1–1.3,3.0a–3.0c,4.2–4.4,5–7. The regulator comparison and cancellation of compatible component auxiliary choices are owned here.

Retain also the general theorem curveVologodskyPairing: for a smooth proper curve over any finite K/ℚₚ, with arbitrary reduction, fixed uniformizer π, a rational K₂ class represented by Σnᵢ{fᵢ,gᵢ}, and holomorphic ω with [ω]∈ker N, the continuous regulator pairing is `Σnᵢ∫^Vol_{(fᵢ)}log(gᵢ)ω,` using π’s branch. Besser2025 Theorem 3.10, p.9 supplies this statement. This general theorem uses gap:semistable-period-descent and ColemanIntegrationPartII §§7.3–7.6 on their period/integration domains. Those inputs identify restriction and trace over a finite semistable extension with the base-field coordinates and integral; the period-coordinate descent is exactly that supplier contract. For arbitrary reduction the coordinates are obtained by Galois-invariant potentially semistable descent from a realization field; D_st(V) over K is not presumed to have full dimension. The split-model formulas below are explicit realizations of that descended theorem.

See NN2016 Theorem B, p. 7; BZ2017 Theorem 1.1, p. 2.

*Needs:* CohomologyComparisons §§4.2–4.5; CohomologyComparisonsPartII §§3–5; semistable-period-descent; ColemanIntegrationPartII §§1.1–1.3,3.0a–3.0c,4.2–4.4,5–7; §§7.10–7.11 specify the regulator comparison.

**Checks.**

- Tate curve: the Coleman integrals become branch dependent, and the Vologodsky integral selects log_q (Besser–Zerbes §3).
- The good-reduction formula of §7.4 is not asserted for any semistable curve.

- For a split Tate graph with one loop, graph H¹ has dimension 1; for a good-reduction graph with one vertex and no edges it has dimension 0. The discrete coordinate cannot be erased from the first model.

### 7.8 The relative symbol regulator of a smooth curve family

Consume CohomologyComparisonsPartII §§1.1–1.6,6.1–6.7,7.1–7.5 for the filtered category, extension coordinates, relative comparison, residue sequence and compatible evaluations, retaining the following open-family hypotheses and the supplier’s independent algebraic finiteness and actual filtered-realization assumptions. The Milnor-symbol residue comparison and tame-kernel lifting are regulator targets here.

Under the stated compactification, coherence and filtration assumptions, construct `[−]_{U/S}:K²_M(A)→Ext¹_{Fil-F-MIC(S,σ)}(O_S,H¹(U/S)(2)).` It factors the cup-symbol extension through Milnor bilinearity and Steinberg relations. Its Frobenius coordinate R_σ takes values in `B†_K⊗_{B_K}H¹_dR(U/S);` its Gauss–Manin coordinate is σ-independent, while R_σ depends on σ. For a smooth proper curve family X/S, classes in `K²_M(A)_{∂=0}` uniquely lift to extensions by H¹(X/S)(2). With the extra truncated-complex hypotheses, R_σ[ξ] is the NEGATIVE of the relative syntomic-symbol de Rham coordinate (AM Theorems 3.7 at n=1 and 4.5). The generic category of filtered F-isocrystals, connection, Ext, relative de Rham/rigid and relative syntomic carriers are imports, not definitions owned here.

W=W(k) with k perfect of characteristic p≥3, K=Frac W; S=Spec B smooth affine over W, U=Spec A smooth affine over S. Use AM Theorem 3.7’s projective compactification Y→Q, boundary D∪f⁻¹(T) relative simple normal crossings, log-smooth (Y,M)→(Q,L), and a compatible system σ of p-Frobenius lifts on Q. AM Assumption 2.20: relative overconvergent rigid cohomology is coherent and compares to algebraic relative de Rham cohomology. Fil²H²_dR(U/S)=0; for the comparison, H¹ and H² of the truncated relative log de Rham complex ≥2 vanish modulo every p^m. For the proper refinement use exactly AM §4.1: Q is a smooth affine curve over W, T⊂Q is finite étale over W, `S=Q\T,` Y is a smooth quasi-projective surface over W, and f:Y→Q is projective and surjective with connected fibres. The deleted divisor `D_X⊂X=Y\f⁻¹(T)` is finite étale over S; `U=X\D_X` is affine. The vertical and horizontal boundary has relative simple normal crossings, the family is smooth over S, and every irreducible component of a singular fibre has multiplicity prime to p. The domain is ker ∂⊂K²_M(A), not all proper K₂ classes.

- The symbol-extension homomorphism into imported Ext¹, with proper refinement on ker ∂.
- R_σ on the extension in B†_K⊗H¹_dR; the Gauss–Manin coordinate is separately σ-independent.
- `[f,1−f]_{U/S}=0` where both functions are units.
- The proper extension maps to the open extension and is unique on ker ∂.
- R_σ[ξ]=−coord_syn,σ(ξ) under Theorem 4.5’s hypotheses.
- Two homomorphisms agree if they agree on every admissible Milnor symbol in their specified domain.

See AM2022 Theorem 2.23 and §2.7, pp. 18–20; Theorem 3.7, pp. 27–31; Proposition 4.3, Lemma 4.4, Theorem 4.5, pp. 34–36.

*Needs:* CohomologyComparisonsPartII §§1.1–1.6,6.1–6.7,7.1–7.5; K2SymbolsBrauer §§9.2–9.4,9.11,9.13; §4.1.

**Checks.**

- {t,1−t} on Spec W[t,(t−t²)⁻¹] has zero extension.
- The zero Milnor class gives the split extension and zero Frobenius/connection coordinates.
- At S=Spec W the tame-kernel symbol agrees with the absolute syntomic regulator; R_σ carries the negative relative-coordinate convention.
- A symbol with a nontrivial tame symbol at D_X gives no proper extension via this construction; retaining its open regulator does not justify a proper one.
- At n=1, replacing (−1)^n with +1 in the syntomic-coordinate square reverses a nonzero Frobenius coordinate.

### 7.9 Specialization of the regulator to a smooth fibre

This result uses the CohomologyComparisonsPartII sections of §7.8, especially §§7.1–7.5’s Frobenius-compatible evaluation; its absolute normalized coordinate also uses gap:normalized-syntomic-boundary and the rigid point comparison.

For the preceding relative symbol extension and a W-valued smooth point α:S(W), require ev_α∘σ=F_W∘ev_α at every finite level. Pullback to α sends the Milnor symbol extension to the absolute extension of its specialized symbol ξ_α, and evaluates its R_σ coordinate to the absolute Frobenius coordinate. When k is finite, after the signed syntomic comparison and normalized boundary identification, this yields `regP_{X_α}(ξ_α)=the` normalized evaluated relative syntomic class in H¹_dR(X_α/K). For the proper refinement require ∂ξ=0 and the boundary remains étale at α. A fixed σ has only its Frobenius-compatible lifts; arbitrary α is handled by a σ adapted to that point where one exists, not by treating every evaluation as a Frobenius morphism.

Use all the hypotheses of §7.8, including coherence and the truncated log-de Rham vanishing conditions. For α:Spec W→S require ev_α∘σ=F_W∘ev_α at every infinitesimal level, the smooth-fibre condition, specialization of each symbol function, and the tame-kernel condition. The absolute identification with regP additionally requires k finite. Over an arbitrary perfect k only the extension class and its Frobenius-coordinate specialization are asserted.

See AM2022 Theorem 2.23 and §2.7, pp. 18–20; Theorem 3.7, pp. 27–31; Proposition 4.3, Lemma 4.4, Theorem 4.5, pp. 34–36; Asakura2023 Theorem 4.9 and Corollary 4.10, p. 435.

*Needs:* §7.8; CohomologyComparisonsPartII §§7.1–7.5; §4.6 and normalized-syntomic-boundary for the absolute coordinate.

**Checks.**

- For the zero symbol, the extension, R_σ, its evaluated coordinate and regP are all 0.
- For σ(t)=tᵖ over ℤₚ, evaluation at t=0 satisfies 0ᵖ=0; evaluation at t=1+p fails since (1+p)ᵖ≠1+p, so it is not an allowed Frobenius point.
- For the specialized Steinberg symbol {t,1−t} at t=2 over ℤ₅, the symbol is {2,−1}=0, giving zero extension and zero regulator.

### 7.10 Continuous and discrete regulators of semistable curves

The imported semistable cohomology is H¹ of D→D⊕D⊕H→D with d(w)=((φ−1)w,Nw,−I_πw) and d(x,y,z)=Nx+(1−pφ)y. Use the Besser-coordinate monodromy N=N_c=−eN_b, where N_b is the base-normalized monodromy of CohomologyComparisonsPartII §5.2 and e is the ramification index. Transport the complex and I_π through that section’s chain equivalence before forming these coordinates; its base change law exp(−eλN_b) is exp(λN_c). For a cocycle choose w=(φ−1)⁻¹x and set ρ[(x,y,z)]=y−Nw∈ker(1−pφ), β_π[(x,y,z)]=z+I_πw∈H. Both descend to classes and give a Q_p-linear isomorphism H¹_st(K,V)≃H⊕ker(1−pφ). Define reg^c,π=β_π∘reg_syn and reg^d=ρ∘reg_syn. The discrete carrier is the fixed-eigenvalue kernel ker(1−pφ), contained in twisted weight −2, not automatically the whole weight −2 space. Under a uniformizer change, the branch derivative of the continuous component is −I_π reg^d (Besser Theorem 3.8); for curve N²=0 and λ=log(π′/π), the source period-change law yields reg^c,π′−reg^c,π=−λI_π reg^d−(λ²/2)I_πN reg^d. It reduces to the linear law when N reg^d=0; N²=0 alone does not give this additional vanishing. reg^c alone does not determine the full semistable class.

K/ℚₚ finite; X/K smooth proper semistable. Use the nodal/cohomological carriers of ColemanIntegrationPartII §§1.1,3.0a–3.0c, retaining every geometric node identity, including loops and parallel edges. Nonsplit components, nodes and poles are treated after finite splitting extension with full residue-field traces and Galois descent (§§7.5–7.6). Fix a uniformizer π and its logarithm branch. The regulator comparison here extends the simple split-model calculation to these carriers by common refinement and restriction/normalized trace; it is not supplied by the integration theorem alone. V=H¹_et(X_Kbar,Q_p(2)), D=D_st(V), H=D_dR(V)=H¹_dR(X/K), Fil⁰D_dR(V)=Fil²H=0; import φ,N and I_π. Twisted Frobenius weights are −4,−3,−2, so φ−1 is invertible; N²=0. Domain is the weight-two geometrically trivial motivic/K₂ regulator domain, with reg_syn the Chern-character regulator of §4.1 as in §7.3; symbol evaluations use a finite presentation on the function field with trivial total tame symbols.

- β_π∘reg_syn:M→H, ℚ-linear on the rational motivic domain M=K₂^(2)⊗ℚ; its ℚₚ-linear extension has source M⊗_ℚℚₚ.
- ρ∘reg_syn:M→ker(1−pφ), ℚ-linear; extend ℚₚ-linearly on M⊗_ℚℚₚ. The coordinate isomorphism is applied to this extended regulator when asserting ℚₚ-linearity.
- H¹_st≃H⊕ker(1−pφ), using w=(φ−1)⁻¹x.
- Adding ((φ−1)a,Na,−I_πa) changes neither coordinate.
- dβ/dlogπ=−I_πρ; for λ=log(π′/π) and curve N²=0, β_π′−β_π=−λI_πρ−(λ²/2)I_πNρ. The linear formula needs Nρ=0.
- Equal continuous AND discrete components imply equality of the H_st regulator class.

See Besser2025 §3, equations (3.5)–(3.11), Proposition 3.3, proof of Proposition 3.5, Remark 3.6, Definition 3.7 and Theorem 3.8, pp. 6–9.

*Needs:* §4.1; CohomologyComparisonsPartII §§5.1–5.3; semistable-period-descent; ColemanIntegrationPartII §§1.1,3.0a–3.0c,7.5–7.6.

**Checks.**

- N=0 and the smooth-curve twist give ρ=0; β equals the normalized crystalline coordinate.
- The zero cocycle gives β=ρ=0.
- Adding d(a) replaces w by w+a, cancelling the changes in y and z.
- (0,y,0) for nonzero fixed y has zero continuous coordinate and a nonzero discrete coordinate.
- For a semilinear weight−2 block without eigenvalue p⁻¹, ker(1−pφ)=0 although the block is nonzero; the weight space cannot replace the fixed kernel.
- In the abstract coordinate-change test N(a,b)=(b,0), ρ=(0,1), I=id, λ=2 gives (−2,−2), not (0,−2); this tests the exponential law and is not asserted to be a realizable curve weight datum.
- A split Tate model of type I₁ has one loop, hence graph H¹ of dimension 1; type I₂ has two vertices and two distinct edges, again graph H¹ of dimension 1. Collapsing parallel edges to a simple graph gives dimension 0.
- A local index 1 at a quadratic closed point contributes trace 2, not 1; this fixes nonsplit descent in the full second-kind formula.
- On M the coefficients 1 and 1/2 act rationally. After tensoring, a class ξ⊗a with a∈ℚₚ has continuous/discrete value a times the value of ξ; aξ on M itself is undefined for a∉ℚ.

### 7.11 The full semistable symbol formula on the monodromy kernel

Let u have a tame-trivial function-field presentation Σ_i n_i{f_i,g_i}, and let ω be a meromorphic form of the second kind whose de Rham class lies in ker N (N transported by I_π). Choose Z containing the singular supports, a semistable wide-open cover U_v, and the local Coleman primitives `F_{ω,v}` corrected so their annular differences `c_ω(e)=F_{ω,head}−F_{ω,tail}` are harmonic, giving the Vologodsky primitive. Then ⟨reg^c,π(u),[ω]⟩=Σ_i n_i(Σ_v ⟨log f_i,F_ω;log `g_i⟩_{(U_v−Z)†}−Σ_{e∈E⁺}c_ω(e)⟨log` f_i,log g_i⟩_e). Here the first bracket is the GLOBAL triple index on each wide open and the second is the oriented annular double index; E⁺ contains one orientation of each geometric edge. Equivalently the last sum is one half of the sum over both orientations. This formula computes the continuous regulator paired with ker N; by nondegenerate cup pairing and skew-adjointness of N it determines its image in H/(ker N)^⊥=H/im N. It does not compute reg^d or an unrestricted pairing on H. For holomorphic ω∈ker N it simplifies to Σ_i `n_i∫^Vol_{(f_i)}log(g_i)ω,` with local constant terms and traces. The logarithm branch and uniformizer are fixed throughout; changing them is governed by the preceding comparison. The totally degenerate toric quotient H/(Fil⁰+T⁰⊗Q_p) in Besser Theorem 7.6 is a separate comparison, not a replacement for this monodromy quotient.

This comparison holds for every smooth proper semistable curve, with loops and parallel edges retained. Each component triple sum uses global compatible Coleman auxiliary primitives on that wide open; prove cancellation of changes in the entire displayed regulator expression, not by presuming a whole-curve triple pairing. For nonsplit data take the residue-field trace of the full local index and descend in a common finite splitting field. Extend continuous/discrete coordinates and this monodromy-kernel second-kind formula to arbitrary reduction through gap:semistable-period-descent and ColemanIntegrationPartII §7.6, proving the regulator comparison commutes with restriction, normalized trace and metric refinement. The form has zero residues and class in ker N; retain that condition.

See Besser2025 Theorem 3.10, p. 9; §4, pp. 11–14; §7, p. 28; BR2019 §3, equations (3.1)–(3.5), pp. 10–11; Theorem 4.7 proof, pp. 19–20.

*Needs:* §§7.4,7.10; ColemanIntegrationPartII §§4.2–4.4,5–7; K2SymbolsBrauer §§9.11,9.13; semistable-period-descent.

**Checks.**

- On a loop with chosen orientation, c_ω=2 and annular index 3 give correction 6. Reversal gives (−2)(−3)=6; the half-sum over both flags is (6+6)/2=6, including p=2 since the coefficients have characteristic zero.
- Two parallel edges with (c_ω,index)=(2,3),(−2,5) contribute 6−10=−4. Merging their geometric identities loses this value; the same one-orientation rule is used on each edge.
- On a quadratic closed-point annulus the scalar contribution 1 has trace 2; tracing inputs separately is invalid, since Tr(α²)=2π but Tr(α)²=0 when α²=π.
- In good reduction N=0 and there are no node edges, so the correction sum is 0. For holomorphic test forms the formula reduces to §7.4; for a second-kind class the full global-primitive triple term remains.

### Examples

If f=1 then A=1−φₚ/p²=B. If f>1, the change from the p-Frobenius cone to the q-Frobenius cone contains the norm sum N_f. The normalized de Rham regulator is unchanged by this representation of the cone. For a semistable curve, evaluating the symbol against monodromy-kernel forms determines only the stated quotient of the continuous coordinate and does not recover the discrete coordinate.

### Dependencies

Layers 1,4; AlgebraicCurves; K2SymbolsBrauer §§9.2–9.4,9.11,9.13; SchemeKTheoryOperations §§2.3–2.4,5.5,6.4,6.8–6.9,6.11,7.5 for transfers, Adams weights and Adams–Riemann–Roch (§§7.3,7.6); ColemanIntegration; CohomologyComparisons §§4.2–4.5’s proper Hyodo–Kato comparison and CohomologyComparisonsPartII §§2–7 with gaps: normalized-syntomic-boundary and semistable-period-descent; ColemanIntegrationPartII §§1.1–1.3,3.0a–3.0c,4.2–4.4,5–7. Every corresponding assertion in this layer is conditional on those named inputs. The supplier roadmaps precede this one and never import its regulator comparisons.

## Layer 8: Perrin–Riou regulators and interpolation

Assume the odd-prime cyclotomic setting. For a crystalline E-representation V put D=D_cris(V). The intrinsic range means nonnegative weights r₁≤⋯≤r_d and no trivial quotient, with a stable 𝒪_E-lattice T. Set r_max=s_max=0 for empty weight tuples, and otherwise use their respective largest entries; the individual indexed weights retain their indices. Condition NC adds that no φ-eigenvalue belongs to p^ℤ; whenever an elementary-divisor argument needs a refinement, require a noncritical refinement after a finite coefficient extension. The Wach-image condition (†) means that h_Iw⁻¹(z) belongs to the analytic scalar extension of `N(V)^{ψ=1};` all classes in the intrinsic range satisfy it. The regulator, interpolation, growth, lattice and scalar-projection statements below use this intrinsic range unless another domain is specified. The obstruction, big exponential, meromorphic extension and reciprocity statements permit arbitrary crystalline V on their stated domains. The bounded coefficient algebra and the locally analytic distribution algebra are distinct.

### 8.1 Quadratic Frobenius inverse

Let E be a field and Φ a finite square matrix over E. Define P(a,b,Phi)=-b^(-1)(Phi+aI) as an explicit matrix expression. It is an inverse only under the separately stated quadratic relation and b nonzero.

- P=-b^(-1)(Phi+aI).
- Under Phi^2+aPhi+bI=0 and b nonzero, Phi P=I and P Phi=I.
- A field embedding applied to all entries and scalars commutes with P.

See LLZ2011 Section 5A, Lemma 5.6 and proof, pp. 1126-1127.

*Needs:* Mathlib matrices and field scalars.

**Checks.**

- For Φ=(2), a=−5,b=6 over ℚ, P=(1/2).
- For Φ=(−1), a=0,b=−1 over ℚ, P=(−1).
- For Φ=(0), a=b=0, P=(0), so ΦP=0≠I in rank one.

### 8.2 Frobenius inverse identities

If Phi^2+aPhi+bI=0 and b is nonzero, then Phi P=P Phi=I.

See LLZ2011 §5A, Lemma 5.6 and proof, pp. 1126–1127.

*Needs:* §8.1; Mathlib matrix algebra.

**Checks.**

- For Φ=[[2,1],[0,3]], a=−5,b=6, P=[[1/2,−1/6],[0,1/3]] and ΦP=PΦ=I. The transposed candidate gives ΦPᵀ=[[5/6,1/3],[−1/2,1]], which is not I.

- In rank zero all products are the unique empty matrix I; the determinant is 1.
- At Φ=(0), a=b=0 the total inverse candidate is 0 and ΦP=0 rather than 1, exhibiting the excluded denominator.

### 8.3 Quadratic Euler inverse

Let E be a field and Φ a finite square matrix over E. Define Q(a,b,Phi)=(1+a+b)^(-1)(Phi+(1+a)I). This is the inverse candidate for I-Phi, not an unqualified inverse at singular Euler factors.

- Q=(1+a+b)^(-1)(Phi+(1+a)I).
- Under the quadratic relation and 1+a+b nonzero, (I-Phi)Q=Q(I-Phi)=I.
- A field embedding commutes with Q.

See LLZ2011 Section 5A, Lemma 5.6 and proof, pp. 1126-1127.

*Needs:* Mathlib matrices and field scalars.

**Checks.**

- For Phi=(2), a=-5, b=6 over Q, Q=(-1).
- For Phi=(0), a=b=0 over Q, Q=I: invertibility of I-Phi does not require invertibility of Phi.
- For Phi=(1), a=-3, b=2, Q=0 and (I-Phi)Q is not I, since 1+a+b=0.

### 8.4 Euler inverse identities

If Phi^2+aPhi+bI=0 and s=1+a+b is nonzero, then (I-Phi)Q=Q(I-Phi)=I.

See LLZ2011 §5A, Lemma 5.6 and proof, pp. 1126–1127.

*Needs:* §8.3; Mathlib matrix algebra.

**Checks.**

- For Φ=[[2,1],[0,3]], a=−5,b=6, Q=[[-1,1/2],[0,−1/2]] and (I−Φ)Q=Q(I−Φ)=I. For Φ=(1), a=−3,b=2, s=0 and the total inverse expression is Q=0; its product with I−Φ is 0, not 1.

- For Φ=(0) and a=b=0, Q=1 and (1−Φ)Q=1; invertibility of Φ is unnecessary here.
- In rank zero the product is the empty identity with determinant 1.

### 8.5 Quadratic Euler-operator formula

Let E be a field, Φ a finite square matrix satisfying Φ²+aΦ+bI=0, and let p,b and s=1+a+b be nonzero in E. With P and Q the certified inverse candidates of §§8.1–8.4, prove

```text
Q(I−p⁻¹P) = [(1+a+pb)Φ + (a(1+a+pb)+b(p−1))I] / [pb(1+a+b)].
```

This is a polynomial calculation in Φ; the full matrix algebra is not assumed commutative.

See LLZ2011 Section 5A, Lemma 5.6, p. 1126.

*Needs:* §§8.1–8.4; the stated nonzero denominators.

**Checks.**

- For Φ=2,a=−5,b=6,p=5, P=1/2 and Q=−1; both sides are −9/10. The exclusions on Φ and the denominators remain in force.

- For Φ=(−1), a=2,b=1,p=5, Q=1/2 and P=−1; both sides are 3/5.
- At p=0 the displayed total fraction is 0 and need not equal a genuine Euler inverse; p≠0 is part of the hypotheses.

### 8.6 Leading Gamma factor

For j in Z define Gamma*(1+j)=j! if j>=0 and (-1)^(-j-1)/(-j-1)! if j<=-1, as a nonzero rational number, then map it into E. This is the leading Laurent coefficient of the classical Gamma function; it is not the p-adic Gamma function.

- For n in N its value at j=n is n!.
- Its value at j=-n-1 is (-1)^n/n!.
- It is nonzero for every integral j.

See LZ2014 Appendix B before Proposition B.1, PDF p.37.

*Needs:* Mathlib integer signs and rational factorials; characteristic-zero coefficient embedding.

**Checks.**

- At j=0 the factor is 1.
- At j=-2 it is -1.
- At j=-3 it is 1/2, not 2.

### 8.7 Logarithmic factors

In each H_E(Gamma_1) component set ell_i=log(1+X)/log(chi(gamma))-i for i in Z, lambda_k=product_(0<=i<k) ell_i for k>=0, and delta_i=ell_i/(X+1-chi(gamma)^i). The apparent pole of delta_i is removable at x_i=chi(gamma)^i-1; its value there is 1/(chi(gamma)^i log(chi(gamma))). Put n_k=log(chi(gamma))^k lambda_k/product_(0<=i<k)(X-x_i).

- ell_i(chi^j eta)=j-i for any finite-order eta on Gamma_1.
- lambda_(k+1)=lambda_k ell_k, lambda_0=1.
- (X-x_i)delta_i=ell_i, including the removable point.
- log(gamma)/log(chi(gamma)) is independent of the chosen topological generator under the group-algebra change of variable.

See LLZ2011 Section 1C2, definitions of ell_i, delta_i and n_k and Proposition 1.6, pp.1101-1102; Section 2A, p.1108; Theorem 4.16, p.1124.

*Needs:* LocallyAnalyticDistributions §§1.4–1.5,3.3; PadicMeasuresIwasawaAlgebras analytic characters.

**Checks.**

- ell_0 at the trivial character is 0, whereas ell_1 there is -1.
- delta_0 at X=0 is 1/log(chi(gamma)), not zero or an undefined inverse.
- lambda_0=n_0=1; lambda_2 at chi^3 is 6.

### 8.8 Crystalline Perrin–Riou regulator

Define L_V=(Mellin_inverse tensor 1) composed with (1-phi) composed with h_Iw^(-1), from H^1_Iw(Q_p,V) to H_E(G) tensor_E D_cris(V). Here h_Iw:N(V)^(psi=1)~=H^1_Iw is the actual Layer 2 comparison, and the Wach embedding takes (1-phi)x into (B_rig^+)^(psi=0) tensor D_cris(V). This is a Lambda_E-linear continuous map; its analytic scalar extension is H_E-linear.

- Mellin(L_V(z))=(1-phi)h_Iw^(-1)(z) in the specified period module.
- L_V(a z+b w)=a L_V(z)+b L_V(w) for a,b in Lambda_E, acting by convolution.
- The Mellin identity determines the map uniquely.
- The map commutes with finite coefficient extension using the supplier comparison squares.

See LLZ2011 Section 3A, Definition 3.4, pp.1116-1117.

*Needs:* §§2.1–2.4; PhiGammaModulesAndIwasawaCohomology §§5–6; LocallyAnalyticDistributions §3.3.

**Checks.**

- The zero Iwasawa class has zero regulator.
- An actual phi-fixed psi-one class is killed by 1-phi; for E(1) this kills the Kummer Tate tower.
- In the finite linear-map model h(x)=2x, boundary(x)=3x, Mellin_inverse(x)=5x, L(2)=15; using h instead of h inverse would give 60.

### 8.9 Derivative obstruction module

For h>=1 with Fil^(-h)D_cris(V)=D_cris(V), define Delta_h on (B_rig^+)^(psi=0) tensor D_cris(V) by the derivative values partial^k f(0) modulo (1-p^k phi)D_cris(V), 0<=k<=h, with their k twists. The admissible source is ker Delta_h. The kernel of 1-phi on the psi-one period module is direct_sum_(0<=k<=h)t^k D_cris(V)^(phi=p^(-k)).

- f is admissible iff partial^k f(0) lies in image(1-p^k phi) for every indicated k.
- If all these Euler maps are invertible, Delta_h=0 and its kernel is the whole source.
- An admissible f has a psi-one lift y with (1-phi)y=f; any two lifts differ in the displayed kernel.

See Berger2003 Section II.5, exact sequence and Definition II.12, p.120.

*Needs:* PhiGammaModulesAndIwasawaCohomology crystalline period modules and ψ; LocallyAnalyticDistributions §§1.4–1.5.

**Checks.**

- For rank-one phi=1, k=0 forces f(0)=0, so a nonzero constant derivative is inadmissible.
- For phi=2 over Q_5 and h=1, both 1-2 and 1-10 are invertible; no derivative obstruction remains.
- At phi=1 two lifts differing by a constant have the same boundary; no unique inverse is inferred.

### 8.10 Perrin–Riou big exponential

For admissible f in ker Delta_h choose a psi-one lift y with (1-phi)y=f and define Omega_(V,h)(f)=nabla_(h-1)...nabla_0(y), with nabla_i=t partial-i. Its value is well-defined in D_rig^+(V)^(psi=1)/V^(H_Qp). The eigencondition D_cris(V)^(phi=p^(-h))=0 suffices for an unquotiented value (Definition II.12). More generally, absence of an E(h) subrepresentation suffices by Remark II.14, after using Theorem II.13 to identify the remaining lift ambiguity with invariants. Map to H_E tensor_Lambda H^1_Iw using the established comparison.

- Every valid lift gives the stated differential product in the quotient.
- Omega_(V,h) is H_E-linear in the specified Mellin convention.
- If no E(h) lies in V, the differential lift is independent in the unquotiented psi-one module.
- nabla_h Omega_(V,h)=Omega_(V,h+1) with the natural obstruction-source comparison.

See Berger2003 Definition II.12, Theorem II.13 and Remark II.14, pp.120-121.

*Needs:* §§8.7,8.9; PhiGammaModulesAndIwasawaCohomology §§5–6; LocallyAnalyticDistributions §§1.4–1.5,3.3.

**Checks.**

- Omega_(V,h)(0)=0 in the quotient.
- For a lift difference t^k v with 0<=k<h, the differential product is zero.
- For k=h the product is h! t^h v, nonzero before passing to invariants; the quotient cannot be dropped.

### 8.11 Auxiliary weight and twist comparison

Under NC, with h≥max(1,r_max), over Frac(H_E) one has Omega_(V,h) L_V(z)=lambda_h z after identifying its Mellin source, for this h. Omega_(V,h+1)=ell_h Omega_(V,h); twisting sends Omega_(V,h)(f) tensor e_j to Omega_(V(j),h+j)(partial^(-j)f tensor t^(-j)e_j), on the common domain. Thus the intrinsic L_V is independent of h.

See LLZ2011 Theorem4.6, p.1120; Berger2003 RemarkII.15, p.121.

*Needs:* §§8.7–8.10; the character and differential twists of §2.2.

**Checks.**

- h=0/r_max=0 is compared using h=1 and localization, never a nonexistent unqualified inverse.

- For h=1 the factor is λ₁=ℓ₀; at χ² it is 2, whereas λ₂(χ²)=2·1=2, consistent with the extra ℓ₁ factor 1.
- For the zero representation all source and target modules vanish and the composition equals λ_h·0=0.

### 8.12 Crystalline twist extension

For arbitrary E-linear crystalline V choose m>>0 so V(m) has nonnegative weights and no trivial quotient. Define L_V(z)=(ell_-1...ell_-m)^(-1) Tw_(chi^(-m))(L_(V(m))(z tensor e_m)) tensor t^m e_-m. The value lies in the total fraction algebra of H_E(G), component by component; it is independent of m. No general H_E-valued assertion follows without proving cancellation of these factors.

The external twist is the inverse one. Write T_k=Tw_(chi^k), so T_k(g)=chi(g)^(-k)g on group elements. By the supplier contract “Compatibility of h_Iw with twists” (i), z ↦ z⊗e_m is T_m-semilinear, and L_(V(m)) is linear; when V is itself in the positive range, §8.11's twist law for Ω gives L_(V(m))(z⊗e_m)=λ_m T_m(L_V(z))⊗t^(-m)e_m. Since T_(-m)(ell_i)=ell_(i−m), applying T_(-m) turns λ_m into ell_(−m)⋯ell_(−1), which is exactly the denominator, and returns L_V(z). With T_m in place of T_(-m) the right side would be T_(2m)-semilinear: its value on λz would be T_(2m)(λ) times its value on z, so it could not be the linear intrinsic regulator, and its values for two admitted twists would differ.

- The value is independent of every admitted twist m.
- Multiplication by ell_-1...ell_-m gives the stated twisted positive-range map, after applying T_(-m).
- For V in the intrinsic range it equals L_V after localization.
- The extended map is Λ_E-linear: z⊗e_m is T_m-semilinear, and T_(-m) undoes that twist.

See LZ2014 Section4.4 and AppendixB equation(10), pp.21,39.

*Needs:* §§2.2,8.7–8.11; componentwise fraction algebras of analytic distributions.

**Checks.**

- An admitted m=0 recovers the intrinsic positive-range regulator.
- The m=1 and m=2 formulas agree by the one-step ell_-2 relation: T_(-2)(ell_0)=ell_(-2) cancels the extra denominator factor.
- At χ^j with j ≥ m, λ_m(χ^j)=j(j−1)⋯(j−m+1)=Γ*(1+j)/Γ*(1+j−m), the ratio of the Gamma factors of §8.14 for V(m) at χ^j and for V at χ^(j−m)=χ^j·χ^(−m), the point at which T_m evaluates.
- Evaluation pins the direction: T_k(f)(κ)=f(κχ^(−k)), so T_(-m)(ell_i)(χ^j)=ell_i(χ^(j+m))=j+m−i=ell_(i−m)(χ^j). At m=1 the denominator ell_(−1) has value j+1 at χ^j.
- For V=ℚ₅(1), both m=0 and m=1 are admitted. For the f₆ class of §8.21 the intrinsic value at χ² is −70/3·d₁ ≠ 0. With T_1 in place of T_(−1) the m=1 formula would be T_2-semilinear, and agreement with m=0 would force (χ(γ)^(−2)−1)γL_V(z)=0, which fails for this nonzero value.
- In a scalar analytic model a nonzero numerator at the zero of ell_-1 gives a pole, so localization alone is not an H-valued result.

### 8.13 Ramified character interpolation

Let eta=chi^j omega, j in Z, omega finite order of conductor p^n, n>=1; extend coefficients to contain omega. Write z_(eta,0) for the actual specialization in H^1(Q_p,V(eta^(-1))). Then L_V(z)(eta)=Gamma*(1+j) tau(omega)^(-1) p^(n(1+j)) phi^n (B_(j)(z_(eta,0)) tensor t^(-j)e_j), with the finite-character de Rham descent understood. B_j=exp*_(Q_p,V(eta^(-1))*(1)) for j>=0 and the Bloch–Kato logarithm on the finite part for j<=-1. The log is the inverse of exp only on its isomorphism range; source condition (†) supplies the finite-part class for this formula.

See LZ2014 AppendixB PropositionsB.1-B.2, LemmaB.4 and TheoremB.5, pp.36-39.

*Needs:* §§1.3–1.4,2.3,8.6,8.8; finite-character Gauss sums and Tate descent.

**Checks.**

- At j=−1, Γ*(0)=1 and the conductor power is p⁰=1; at j=1, Γ*(2)=1 and the conductor power is p^(2n).

- At j=−1 the conductor power is p⁰=1 and Γ*(0)=1; at j=0 it is pⁿ and Γ*(1)=1.
- At z=0 the specialized class and both sides of the interpolation identity are 0, since every primitive Gauss sum in its denominator is nonzero.

### 8.14 Unramified character interpolation

For eta=chi^j and j in Z put A_j=1-p^j phi and B_j=1-p^(-1-j)phi^(-1) on D_cris(V). If B_j is invertible then L_V(z)(chi^j)=Gamma*(1+j) A_j B_j^(-1) b_j(z_(chi^j,0)), where b_j is the exp*/log value with its Tate descent from the preceding theorem. No invertibility of A_j is required for this direction.

See LZ2014 AppendixB TheoremB.5 and the parenthesis immediately following it, pp.39-40.

*Needs:* §8.13; invertibility of the specified B_j only.

**Checks.**

- When phi=1,j=0, A_j=0 while B_j=1-p^-1 is invertible; a vanishing specialization is valid.

- For φ=2,p=5,j=0, A_j=−1 and B_j=9/10, so A_jB_j⁻¹=−10/9; using the reversed Euler ratio would give −9/10.
- For a zero specialized class the output is 0 whenever the stipulated B_j is invertible.

### 8.15 Specialization with singular Euler operators

For every integral j under (†), with no Euler invertibility assumption, B_j L_V(z)(chi^j)=Gamma*(1+j) A_j b_j(z_(chi^j,0)). More precisely, if u_j is the constant coefficient of partial^j h_Iw^(-1)(z) after Tate descent, the unsimplified identities are L_V(z)(chi^j)=A_j u_j and B_j u_j=Gamma*(1+j)b_j. They determine a relation, including the image of A_j(ker B_j); replacing B_j^(-1) by a total inverse is not a formula. For the big-exponential inverse keep ker Delta_h and the invariant quotient.

See LZ2014 AppendixB PropositionsB.1-B.2, pp.37-38; Berger2003 SectionII.5 exact sequence, p.120.

*Needs:* §§8.9–8.10,8.13–8.14; the actual period lift and cleared Euler identities.

**Checks.**

- For rank-one phi=p^(-1),j=0, B_j=0 and A_j=1-p^-1; the cleared equality gives no unique output. An exceptional derivative formula requires separate input.

- At φ=2,p=5,j=0, take u_j=10/9 and Γ*b_j=1. Then L=−10/9, B_jL=−1 and Γ*A_jb_j=−1.
- At u_j=0 both unsimplified identities have value 0; at singular B_j one cannot infer uniqueness from this example.

### 8.16 Regulator growth on Frobenius quotients

Let W subset D_cris(V) be phi-stable and h>=0. If every phi eigenvalue on Q=D_cris(V)/W has v_p(alpha)>=-h, the projection of L_V(z) to Q belongs to distributions of order h on the cyclotomic group, with the LAD C^h-dual convention. In particular take h=max(0,-min v_p(alpha)). State the seminorm bound on each finite-character component; no universal bounded (order zero) assertion is made.

See LZ2014 Proposition4.8 and AppendixC, pp.17,41-43.

*Needs:* §8.8; LocallyAnalyticDistributions §§2.1,2.3; the specified Frobenius-stable quotient.

**Checks.**

- A slope -1 gives order 1, not a bounded measure; a scalar projection inherits a slope bound only from its admitted quotient.

- For a quotient with slopes (−2,0), the stated nonnegative order bound is 2; replacing it by 0 would discard the slope −2 direction.
- For Q=0 every projected distribution is 0 and its seminorm bound is 0 at every order.

### 8.17 Regulator naturality and integral lattice

For finite E extensions and equivariant morphisms of crystalline representations in the intrinsic range, L commutes with the actual D_cris and Iwasawa comparison maps. For a G-stable T its image lies in the Mellin inverse of (phi*N(T))^(psi=0) embedded in the analytic period target. It need not lie in Lambda_O tensor an arbitrary D_cris lattice. Changing gamma only changes X by (1+X)^a-1; changing roots zeta to sigma_a zeta multiplies the regulator distribution by [sigma_a]^(-1). These assertions compose and respect identities.

See LLZ2011 Section3A, pp.1116-1117; LZ2014 Remark4.16, p.20.

*Needs:* §§2.1–2.2,8.8; PhiGammaModulesAndIwasawaCohomology coefficient and lattice squares.

**Checks.**

- Root changes by a and then b multiply by [σ_a]⁻¹[σ_b]⁻¹=[σ_ab]⁻¹; at a=b=−1 the multiplier is 1.

- Root changes a=2 then b=3 at p=5 give [σ₆]⁻¹; in the Dirac model their product is δ_(1/6), rather than δ₆.
- The identity coefficient extension and the zero class give L(0)=0; changing the lattice to pT multiplies its actual lattice image by p.

### 8.18 Perrin–Riou explicit reciprocity formula

With the crystalline pairing extended linearly in the first and via ι(g)=g⁻¹ in the second variable, and the **ordered** cup-product Iwasawa pairing of §2.4,

```text
[L_V(x), L_(V*(1))(y)]_cris = +σ₋₁ ℓ₀ ⟨x,y⟩_Iw.
```

This is an equality in the total fraction algebra of ℋ_E(G), with σ₋₁ the inertia element χ(σ₋₁)=−1; the dual regulator uses the admitted meromorphic twist extension. The plus sign is part of the target.

To verify it without an implicit pairing transpose, use BergerII.16 in its Ω-form: (−1)ʰ⟨Ω_(V,h)(f),[−1]Ω_(V*(1),1−h)(g)⟩=−[f,ι(g)]. In the fraction algebra take h=1, f=L_V(x), g=L_(V*(1))(y). The defining Ω-identities give Ω_(V,1)(f)=ℓ₀x and Ω_(V*(1),0)(g)=y, modulo the invariant torsion killed in that algebra. Both sides of the Ω-form then have a minus sign, giving the displayed plus sign. For representations outside that intrinsic range apply the admitted twists before this calculation. Equivalently the interpolation proof uses Q_V(exp* x,log y)=−P_V(x,y); this is exactly the graded sign missing from the transposition step of LZ2014 TheoremB.6. Keeping LZ's printed negative regulator sign with the present ordered cup would contradict its positive exponential adjunction and the Ω-form. The dictionary in §2.4 specifies the conversion.

See LZ2014 AppendixB equation(10) and TheoremB.6, pp.39-40; Berger2003 TheoremII.16 and RemarkII.17, pp.122-123.

*Needs:* §§1.4,2.4,8.10–8.13; PhiGammaModulesAndIwasawaCohomology §5.5; local Tate duality.

**Checks.**

- Changing the second variable by g multiplies the pairing by g^-1.
- Reversing the two degree-one inputs gives ⟨y,x⟩_(V*(1))=−ι⟨x,y⟩_V, while reversing crystalline inputs gives ι without a minus. Since ι(ℓ₀)=−ℓ₀ and ι(σ₋₁)=σ₋₁, the displayed formula respects both laws.
- The nonzero p=5 test P(κ(6),logχ)=log₅(6) in §2.4 distinguishes an ordered cup from an ungraded transpose; a zero class cannot detect this normalization.

### 8.19 Determinant of the crystalline regulator

Under NC, for each Delta component the determinant ideal of the H_E-linear scalar extension of L_V, with actual rank-d Iwasawa source, is generated up to H_E-unit by product_(i=0..r_max-1) ell_i^(d-n_i), where n_i=dim_E Fil^(-i)D_cris(V)=#{j:r_j<=i}. The determinant is an ideal in the analytic algebra, not a chosen equality of basis determinants.

See LLZ2011 Corollary4.7 and proof, p.1120.

*Needs:* §§8.7–8.11,8.18; the rank-d Iwasawa comparison and NC.

**Checks.**

- Weights (0,2) give ell_0 ell_1, whereas (1,1) give ell_0^2; these cases discriminate a rank-only formula.
- For V=0 the weight tuples and elementary-divisor lists are empty, r_max=s_max=0, Iwasawa source and regulator target are zero, the constraint module in rank zero is zero, and every determinant product is 1. The range 0≤i<r_max is empty.

- For weights (0,0), n₀=d and the determinant product is 1; for a single weight 2 it is ℓ₀ℓ₁, with value 2 at χ².

### 8.20 Scalar projection of a regulator

Given an explicitly chosen E-linear functional ell:D_cris(V)->E, define scalarRegulator_(V,ell)=(1 tensor ell) L_V. A differential or refinement supplies ell only after its pairing and period normalization are proved. The vector regulator is canonical with its cyclotomic choices; this scalar projection is not chosen from V alone.

- The output is (1 tensor ell)(L_V(z)).
- Projection for ell1+ell2 is the sum of the two projections; scaling ell scales the output.
- Finite coefficient extension commutes after transporting ell.
- The vector seminorm bound gives the projected bound times the functional norm; a stronger eigenline bound needs the specified phi-stable quotient.

See LLZ2011 Section3 equation(2), p.1117; Section1C6 modular bases.

*Needs:* §§8.8,8.16; a specified linear functional on the actual crystalline carrier.

**Checks.**

- The zero functional gives the zero map.
- For vector (2,3), first projection gives 2 and second gives 3.
- Replacing a functional by twice itself doubles every value; it cannot be silently treated as the same normalized scalar regulator.

### 8.21 Rank-one Tate and Coleman comparison

Let V=E(1), d=t⁻¹v₁ and let u be an actual principal norm-compatible unit system. Define the raw map Col₀ by Mellin(Col₀(u))=(1−φ/p)log f_u, and put Col=−Col₀. The differential identity ∂((1−φ/p)log f_u)=(1−φ)Δf_u determines its comparison with the crystalline regulator. By the proved positive comparison in §2.4, the equality is `L_{E(1)}(κ_Iw(u))=+ℓ₀Col₀(u)⊗d=−ℓ₀Col(u)⊗d.` There is no remaining sign parameter. On ψ=0, ∂⁻¹ corresponds under Amice to multiplication by x⁻¹, so there is no integration-constant choice. The Tate-root tower is killed, and the coefficient-extended Coleman sequence retains its moment cokernel.

See LZ2014 Section6.4.2 diagram and text, pp.28-29.

*Needs:* §§2.4,8.7–8.8; ColemanPowerSeries Layers 1–2; LocallyAnalyticDistributions §§1.4–1.5,3.3.

**Checks.**

- For f_u=1+π (the Tate-root tower), (1−φ/p)log f_u=(1−φ/p)t=0, so Col₀ and the regulator vanish.
- For the cyclotomic unit series f₆=((1+π)⁶−1)/π at p=5, Δf₆(0)=5/2 and the mass of Col₀ is (4/5)log₅(6)≠0; hence Col=−Col₀ changes a nonzero value.
- For that f₆, Col₀(χ²)=(1−5)(6²−1)/12=−35/3 and `**L_{ℚ₅(1)}(κ(u))(χ²)=−70/3·d₁**.` Thus ℓ₀ is essential, and the negative Kummer comparison would fail this nonzero value.

For the explicit check, f₆=6+15π+20π²+15π³+6π⁴+π⁵. If a=f₆(0), b=f′₆(0), c=f″₆(0), then Δf₆(0)=b/a=5/2 and ∂²log f₆(0)=(c+b)/a−(b/a)²=35/12, with ∂=(1+π)d/dπ. Frobenius sends t to 5t, so ∂²(1−φ/5)log f₆=(1−5)∂²log f₆ at zero. This gives the stated χ² moment. Its mass is (1−1/5)log₅(f₆(0)); log₅ is injective on 1+5ℤ₅ and 6≠1, proving nonvanishing rather than assuming it. The rational polynomial second logarithmic jet used in this Check is for f∈ℚ[π] with f(0)≠0 it is (f″(0)+f′(0))/f(0)−(f′(0)/f(0))². It is zero for a nonzero constant, invariant under multiplication by a nonzero rational scalar, and additive on products with nonzero constant terms. For f=1 it is 0; for f₆ it is 35/12; for f=1+π it is 1−1=0. These are README Checks of the arithmetic normalization.

### 8.22 Ordinary and multiplicative Coleman map

For an elliptic curve A/Q with good ordinary or multiplicative reduction at odd p, T=T_p A, let alpha in Z_p^times be the ordinary root and beta=p/alpha. In split multiplicative reduction set (alpha,beta)=(1,p), in nonsplit (-1,-p). Let omega_A be the Néron differential of A, the invariant differential of a minimal Weierstrass model of A over ℤ, as fixed in Rubin2000 III §5.2. On the actual inverse-corestriction singular quotients H^1_(infty,s)(Q_p,T) define Col_infty into the integral Iwasawa algebra Lambda of the Z_p-extension, with its injection and Rubin III.5.14 normalization. For nontrivial finite chi of conductor p^k its value is alpha^-k tau(chi) sum_(g in G_n)chi(g)^-1 exp*_(omega_A)(g z_n). At chi=1 it is (1-alpha^-1)(1-beta^-1)^-1 exp*_(omega_A)(z_0). The integral codomain belongs to this differential: replacing omega_A by c·omega_A with c ∈ ℤ_pˣ preserves it, whereas for an arbitrary c ≠ 0 the rescaled map has values in c^-1 Lambda ⊂ Lambda[1/p].

- Finite-character values are exactly the displayed Gauss-sum/differential formulas, with the Néron differential.
- Its kernel on the singular inverse-limit module is zero.
- It is Lambda-linear on that actual source, with values in Lambda.
- Rescaling the differential by c ≠ 0 rescales its scalar dual-exponential coordinate by c^-1, and hence the map by c^-1; the rescaled map lands in c^-1 Lambda, which is Lambda exactly when c is a p-adic unit.

See Rubin2000 III §5.2, choice of the minimal Weierstrass differential, printed p.47; III Section5.8, Proposition5.14, printed p.52.

*Needs:* §§1.4,2.3; SelmerIwasawaCohomology singular Iwasawa quotients; the Néron differential of a minimal Weierstrass model.

**Checks.**

- Col_infty(0)=0.
- At split multiplicative alpha=1 the trivial specialization is zero.
- At p=5 and alpha=-1,beta=-5 the trivial Euler multiplier is 5/3, so it is not automatically zero.
- If Col_infty(z) has a coefficient of valuation 0, then with the differential 5^N·omega_A, N ≥ 1, the map is 5^(−N)·Col_infty and that coefficient becomes 5^(−N) ∉ ℤ₅; with 2·omega_A at p=5 it is multiplied by the unit 1/2 and stays integral.

### Examples

On a one-dimensional D with φ=2, the quadratic relation with a=−5 and b=6 gives φ⁻¹=1/2 and (1−φ)⁻¹=−1. On φ=1 the latter inverse is undefined. At negative interpolation weight j=−3 the leading Gamma factor is 1/2, rather than 2.

### Dependencies

Layers 0–2; PhiGammaModulesAndIwasawaCohomology §§5–6; PadicMeasuresIwasawaAlgebras §§1.7,2.1–2.6,4.3–4.5 for bounded coefficients; LocallyAnalyticDistributions §§1.4–1.5,2.1,2.3,3.3 for distributions and unbounded Mellin; NoncommutativeAndEquivariantIwasawa §F.3 local duality; ColemanPowerSeries Layers 1–2.

## Layer 9: Coleman images and de Rham interpolation

Work first with elementary evaluation constraints over a coefficient field E, a commutative E-algebra R and E-algebra evaluations. Their Wach applications fix a Δ-character component, R=𝒪_E[[X]][1/p] and ℋ_E, with the intrinsic range and NC defined in Layer 8 when stated. Row vectors determine every transport and matrix formula. The final de Rham construction allows p=2, using q=4 there, and has its own domain.

### 9.1 Specialization-constraint module

For a finite set J of evaluation indices, define `evaluationConstraints` as the R-submodule S_J(V) of R^d by F in S_J(V) iff ev_j(F) is in V_j for every j in J, with componentwise evaluation.

For all basis and division statements in §§9.2–9.11, add the following evaluation hypotheses: R is a domain, J is finite, t∈R, the scalars x_j∈E are pairwise distinct for j∈J, and for each j∈J only, ev_j(t)=x_j, q_j=t−x_j is nonzero in R, and ker(ev_j) is the principal ideal (q_j). Unused indices impose no hypotheses. The definition of the submodule itself needs none of these extra assumptions. The determinant theorem uses d−dim_E V_j, with all dimensions finite because V_j⊂Eᵈ.

- F is in S_J(V) iff for every j in J, ev_j(F) is in V_j.
- S_empty(V)=R^d.
- If J is contained in J' then S_J'(V) is contained in S_J(V).

See LLZ2011 Section 4A, Lemma 4.1 and Proposition 4.2, p. 1118.

*Needs:* Mathlib `Submodule`, `Algebra`, `AlgHom` and finite coordinate modules.

**Checks.**

- An empty set of conditions gives the full module.
- Over E[X], d=1, evaluation at 0 and V=0: 1 is excluded and X is included.
- Over Q[X], one condition V={(a,a)} at 0: (1,1) is included and (1,0) is excluded.
- For m=2,J={0},x₀=x₁=0 and both evaluations at zero, only j=0 is constrained; V₀=0 in rank one gives basis X, determinant X and coordinate image XR. The unused repeated index is harmless.
- For J=∅, the determinant and every coordinate-image generator are 1, without assumptions on any unused ev_j or x_j; for d=0 the constraint carrier is the zero module.

### 9.2 Division by distinct evaluation factors

In the evaluation context, ev_j(f)=0 for all j in J iff the product of q_j over J divides f. Repeated points are not allowed.

See LLZ2011 Section 4A, Lemma 4.3, first inclusion, pp. 1118-1119.

*Needs:* §9.1; the separated evaluation kernels and nonzero factors.

**Checks.**

- A repeated evaluation point does not imply a double zero.

- Over ℚ[X], f=X(X−5) has evaluations 0 at 0 and 5 and is divisible by their product; f=X has values 0 and 5 and is not.
- With J empty the product is 1 and divides every f; for a repeated point at 0, f=X vanishes twice as a listed condition but X² does not divide X.

### 9.3 Single-condition basis

For J={j}, S_J(V) has an R-basis with row matrix diag(1,...,1,q_j,...,q_j)C, where C is an E-basis of E^d adapted to V_j and q_j occurs codim(V_j) times. Its determinant is a nonzero E-scalar times q_j^codim(V_j).

See LLZ2011 Section 4A, Lemma 4.1, p. 1118.

*Needs:* §§9.1–9.2; an E-basis adapted to V_j; Mathlib basis extension.

**Checks.**

- Do not drop the domain or nonzero-factor assumptions; nonzero zero-divisors do not give free principal summands.

- Over ℚ[X], V=ℚ(1,0) at 0 has basis (1,0),(0,X) and determinant X; V=ℚ² gives I and determinant 1.
- Over ℚ[ε]/(ε²), the nonzero factor ε generates a module killed by ε, so it cannot be a free rank-one summand. This excludes zero divisors.

### 9.4 Invertibility at a new point

Let B be a row-basis matrix for previous constraints with det(B)=epsilon times the product over i in J of q_i^n_i, epsilon a unit in R. For a new j∉J, impose the evaluation hypotheses of §9.1 on J∪{j}, including x_j≠x_i for every i∈J. Then ev_j(B) is invertible over E: its determinant is ev_j(epsilon) times ∏_(i∈J)(x_j−x_i)^n_i, a product of nonzero scalars.

See LLZ2011 Section 4A, Proposition 4.2, induction step, p. 1118.

*Needs:* §9.3; Mathlib `Matrix.det_mul`; separation also at the new point.

**Checks.**

- In rank one over ℚ[X], J={0}, x₀=0, V₀=0 and B=(X): a new point x₁=5 gives ev₁(B)=5 with inverse 1/5.
- If instead x₁=0 and both evaluations are at zero, ev₁(B)=0 is singular. This datum is permitted by §9.1 for J={0}, but not by the separated new-point hypotheses here.
- With J=∅, B=I specializes to I at any new point; at d=0 its determinant is the empty product 1.

### 9.7 Basis for simultaneous constraints

The headline `constraint_basis_and_determinant` constructs an R-basis of S_J(V), indexed by Fin d, by successively imposing each evaluation condition. This extends the one-point construction and does not claim an integral basis for constraints over O_E.

- Every row of the constructed basis belongs to S_J(V).
- Each F in S_J(V) has unique R-coordinates in the constructed basis.
- The determinant is associated to the product of q_j^codim(V_j).

See LLZ2011 Section 4A, Proposition 4.2 and proof, p. 1118.

*Needs:* §§9.1–9.4; Mathlib `Submodule.comap` and `LinearEquiv.finrank_eq` for invertible row transport.

**Checks.**

- For R=Q[X], d=1, x=0 and V=0, S has the one-element basis X.
- For d=1 with V=0 at 0 and 5, S has a basis associated to X(X-5), not X squared.
- For d=2, V_0=span(e1) at 0 and V_1=span(e2) at 5, rows (X-5,0),(0,X) form a basis with determinant X(X-5).

### 9.8 Determinant ideal of the constraint module

For the constructed basis and for any other R-basis of S_J(V), the determinant of its inclusion into R^d is associated to the product of q_j^(d-dim_E V_j). This is equality of principal determinant ideals, not canonical equality of generators.

See LLZ2011 Section 4A, Proposition 4.2, p. 1118.

*Needs:* §9.7; Mathlib determinant multiplicativity and invertible change of basis.

**Checks.**

- A rescaling of one basis vector by a nontrivial unit must not change the ideal statement.

- For the basis diag(X−5,X), the determinant is X(X−5); multiplying the first row by 2 gives 2X(X−5), the same principal ideal over ℚ[X].
- At d=0 the determinant is 1; with no conditions in positive rank the identity basis also gives 1.

### 9.9 Coordinate-image generator

For coordinate k define `coordinateImageGenerator` by g_k=∏_(j∈J)(t−x_j if every v∈V_j has v_k=0, otherwise 1). Equivalently, define J_k={j in J: every v in V_j has v_k=0}; define g_k as the product over J_k of t-x_j. Empty products are one.

- g_k is exactly the product over forced-zero indices.
- If no V_j forces coordinate k to vanish, g_k=1.
- With distinct points and ev_j(t)=x_j, ev_j(g_k)=0 iff j belongs to J_k, for j in J.

See LLZ2011 Section 4A, Lemma 4.3 and proof, pp. 1118-1119.

*Needs:* §9.1; finite products of the forced-zero factors.

**Checks.**

- With J empty, g_k=1.
- For d=1 and V_j=0 at 0 and 5, g_0=X(X-5).
- For V_0=span(e1) at 0 and V_1=span(e2) at 5, g_0=X-5 and g_1=X.

### 9.10 Polynomial witness for the image generator

In the evaluation context construct F in S_J(V) whose k-th coordinate is exactly g_k. Other coordinates can be chosen as polynomials in t with E-coefficients.

- The k-th coordinate is g_k.
- The resulting vector belongs to S_J(V).
- For r in R, rF belongs to S_J(V) and has k-th coordinate rg_k.

See LLZ2011 Section 4A, Lemma 4.3, interpolation step, p. 1119.

*Needs:* §§9.1,9.9; Lagrange interpolation over E at the distinct constrained points.

**Checks.**

- With no conditions the standard e_k has the required coordinate one.
- For R=Q[X] and V={(a,a)} at 0, (1,1) witnesses that the first coordinate image contains one.
- Interpolation of 0 and 1 at 0 and 5 is X/5. No polynomial over Z_5 has those two values, so the E-polynomial argument cannot be asserted integrally.

### 9.11 Exact coordinate image

The headline `evaluationConstraints_coordinate_image` states that for k∈Fin d and r∈R, there exists F∈`evaluationConstraints` J ev V with F_k=r if and only if `coordinateImageGenerator` J t x V k divides r. Here `coordinateImageGenerator` has the real finite-product definition g_k=∏_(j∈J)(q_j if every v∈V_j has v_k=0, otherwise 1). Thus the k-th coordinate image of S_J(V) is exactly g_kR. If each V_j has a nonzero k-coordinate somewhere, this projection is surjective; this does not say the whole inclusion S_J(V) into R^d is surjective.

See LLZ2011 Section 4A, Lemma 4.3, pp. 1118-1119.

*Needs:* §§9.2,9.9–9.10; the kernel hypotheses only at imposed indices.

**Checks.**

- The proper submodule F(0)=G(0) has both coordinate images equal to R.
- Over ℚ[X] in rank one, zero conditions at 0 and 5 give generator X(X−5): the row F=X(X−5) witnesses membership of the generator, while r=1 is excluded both by evaluation and by divisibility.
- With J empty and d>0, g_k=1 and the row r·e_k realizes every r; with d=0 there is no coordinate k and the image theorem has no instance.

### 9.12 Coleman coordinates

For a genuine R-linear map f:H to W and coordinate equivalence e:W to R^d, define Col_e=e composed with f. In LLZ, f is 1-phi on the actual psi=1 module and e is the good psi=0 Wach-basis coordinate map. This generic definition alone does not construct either input.

- Col_e(z)=e(f(z)).
- e inverse applied to Col_e(z) equals f(z).
- Col_e(f composed with g)=Col_e(f) composed with g.

See LLZ2011 Section 3A, displayed definition Col=J composed with (1-phi), Remark 3.1 and Lemma 3.3, pp.1116-1117.

*Needs:* PhiGammaModulesAndIwasawaCohomology §§5–6; the good Wach basis supplier; Mathlib `LinearEquiv.symm_apply_apply`.

**Checks.**

- f=0 gives the zero coordinate map.
- f=id and e=id on R^d give the identity coordinate map.
- For U=[[1,1],[0,1]] over Q, c=(1,0) changes to cU inverse=(1,-1), not cU=(1,1).

### 9.14 Logarithmic matrix

Let R to A be a homomorphism of commutative rings, e:W to R^d and b:Y to A^d coordinate equivalences, and j:W to Y an R-linear map. Define M_ik=b(j(e inverse(e_i)))_k. This is an A-matrix encoding j, not an R-matrix asserted integral without proof.

- M_ik=b(j(e inverse(e_i)))_k.
- b(j(w))=algebraMap(e(w)) times M, using row multiplication.
- For j=0, M=0.

See LLZ2011 Section 3, equation (1), pp. 1116-1117.

*Needs:* §9.12; §8.8; the Wach-to-crystalline inclusion; row coordinates over the analytic coefficient algebra.

**Checks.**

- For R=A and all maps identity, M=I.
- For standard Q-coordinates and j with row matrix [[1,2],[3,4]], M is that matrix, not its transpose.
- For j with row matrix diag(1,0), det M=0; the construction does not imply invertibility.

### 9.15 Expansion in the logarithmic matrix

For w in W, b(j(w))=algebraMap(e(w)) times M. Map the input row from R to A before multiplying.

See LLZ2011 Section 3, equation (1) and Lemma 3.3.

*Needs:* §9.14; extension of the bounded coefficient row to the analytic coefficient algebra.

**Checks.**

- Over Q, use M=[[1,2],[3,4]] and row c=(5,7): cM=(26,38), whereas cM^t=(19,43).

- For c=0, cM=(0,0); for M=I and c=(5,7), cM=(5,7).
- For R=ℚ and A=ℚ₅, the embedded row (1/2,1/3) multiplied by diag(2,3) is (1,1); the scalar map precedes the multiplication.

### 9.16 Vector-regulator coordinate decomposition

For the preceding actual maps, b(j(f(z)))=algebraMap(Col_e(z)) times M. With the independently constructed Iwasawa and Mellin comparison maps this gives LLZ's decomposition of the vector regulator. Without those maps it is only the stated linear algebra theorem.

See LLZ2011 Section 3, Lemma 3.3, Definition 3.4 and equation (2), p. 1117.

*Needs:* §§8.8,9.12,9.14–9.15; the actual Iwasawa and Mellin comparisons.

**Checks.**

- With the preceding row c=(5,7), M=[[1,2],[3,4]] and z chosen with Col(z)=c, the reconstructed regulator is (26,38). If f(z)=0 both sides vanish.

- For the Tate-root tower, (1−φ)v₁=0 and both the Coleman reconstruction and L vanish.
- In rank one with Col(z)=3 and M=2, the reconstructed period coordinate is 6; replacing M by M⁻¹ would give 3/2.

### 9.17 Constant basis covariance

With column basis vectors n'=Un and nu'=Bnu, U in GL_d(R), B in GL_d(A), the coordinate row changes by c'=cU inverse and the matrix by M'=algebraMap(U) M B inverse. Hence c'M'=cM B inverse, so the vector in Y is unchanged. Fixing the crystalline basis means B=I.

See LLZ2011 Section 3, equation (1); section 5C, Remark 5.12, p. 1129.

*Needs:* §§9.14–9.16; Mathlib matrix multiplication and inverses of the specified basis matrices.

**Checks.**

- Take c=(1,0), U=[[1,1],[0,1]], M=I and B=I. Then c′=(1,−1), M′=U and c′M′=(1,0). With B=diag(2,3) the same vector has coordinates (1/2,0).

- For U=B=I, c′=c and M′=M.
- In rank one take c=3,U=2,M=5,B=7 over ℚ; c′=3/2, M′=10/7 and c′M′=15/7=cM/B.

### 9.18 Integral shear matrix

Define A(e1,e2)=[[1,e2],[e1,1]], with row action (F,G)A=(F+e1G,G+e2F). Over a commutative ring it is invertible precisely when 1-e1e2 is a unit, not merely nonzero.

- (F,G)A=(F+e1G,G+e2F).
- det A=1-e1e2.
- If 1-e1e2 is a unit, A has a two-sided inverse over the same ring.

See LLZ2011 Section 5C, Proposition 5.11, proof, p. 1129.

*Needs:* Mathlib `Matrix.det_fin_two` and invertibility over a commutative ring.

**Checks.**

- e1=e2=0 gives I.
- For e1=2,e2=3 and (F,G)=(7,11), the output is (29,32).
- Over Z_5, e1=1,e2=-4 give nonzero determinant 5 but a matrix not invertible over Z_5.
- Over ℤ, e₁=2,e₂=3 give determinant −5; e₁=1,e₂=−4 give determinant 5, a nonunit.

### 9.19 Transformation of specialization lines

Over a field, assume 1-e1e2 nonzero and (F',G')=(F,G)A. Then F=0 iff F'=e1G'; G=0 iff G'=e2F'; and F=rG iff (1+e2r)F'=(e1+r)G'. If e1+r and 1+e2r are nonzero, the latter line has both coordinate projections nonzero.

See LLZ2011 Section 5C, Proposition 5.11, proof, p. 1129.

*Needs:* §9.18; row multiplication over E; nonvanishing of 1−e₁e₂.

**Checks.**

- With e₁=2,e₂=3 and (F,G)=(7,11), (F′,G′)=(29,32) and (1+3·7/11)29=(2+7/11)32=928/11. The axes F=0 and G=0 become respectively F′=2G′ and G′=3F′.

- For e₁=2,e₂=3 and (F,G)=(0,1), (F′,G′)=(2,1), so F′=2G′; for (1,0) the output (1,3) satisfies G′=3F′.
- At e₁=e₂=1, det A=0 and both axes map to the same line, so the reverse implications require invertibility.

### 9.20 Integral shear avoiding finitely many slopes

Let O embed in a field E, with O a commutative local domain and its maximal ideal infinite. For finitely many nonzero slopes r_i in E, choose nonzero e1,e2 in that maximal ideal such that e1+r_i and 1+e2r_i are nonzero for every i. Then det A is a unit in O. Finite extensions of Q_p satisfy the infinite-ideal hypothesis via distinct positive powers of a uniformizer.

See LLZ2011 Section 5C, Proposition 5.11, p.1128, and its proof, p.1129; compare LLZ2011 preprint arXiv:1006.5163v2 Section 5.3, Proposition 5.11 and Remark 5.12, p.25.

*Needs:* §§9.18–9.19; the infinite maximal ideal and finite forbidden sets.

**Checks.**

- In Z_2 avoid the single slope r=−2 by choosing e₁=4,e₂=2: e₁+r=2, 1+e₂r=−3 and det A=−7 is a unit. The choice e₁=2 is forbidden. An infinite maximal ideal excludes a field with zero maximal ideal.

- For an empty slope set in ℤ₅, e₁=e₂=5 gives determinant −24, a unit.
- For O a field the maximal ideal is {0}; it supplies no nonzero e₁,e₂, so the infinite-ideal condition is essential.

### 9.21 Rational surjectivity after integral basis change

In the two-dimensional evaluation context, suppose each V_j is a one-dimensional E-subspace of E^2. A constant integral shear chosen as above makes both projections of S_J(V)A equal to R. For R=O_E[[X]][1/varpi] this is rational surjectivity, not an assertion that integral Coleman images equal O_E[[X]].

See LLZ2011 Section 5C, Proposition 5.11 and Remark 5.12, pp. 1128-1129; section 4A, Lemma 4.3.

*Needs:* §§9.11,9.19–9.20; all constrained subspaces are lines.

**Checks.**

- The proper ideal (5,X) in Z_5[[X]] becomes the full ring after inverting 5; rational surjectivity does not remove the integral correction.

- For the diagonal condition F(0)=G(0), both coordinate images are already R, using (r,r), while (1,0) is outside the module.
- In the single axis condition V=E(1,0), the shear e₁=e₂=5 over ℤ₅ sends the allowed line to E(1,5), whose two projections are E.

### 9.22 Noncritical crystalline refinement

A refinement is a full phi-stable flag 0=Y_0 subset Y_1 subset ... subset Y_d=D_cris(V), dim Y_i=i. It is noncritical if each Y_i has the i smallest filtration weights in LLZ’s positive representation convention (weights -s_1>=...>=-s_d with 0<=s_1<=...<=s_d); Equivalently dim Fil^j(Y_i)=max(0,dim Fil^j(D_cris(V))-d+i), for every j, with multiplicities retained. On W=V(m) nonnegative weights are r_1<=...<=r_d with s_i=m-r_(d+1-i). Existence after finite E extension is a separate hypothesis.

- Every step is phi-stable and has dimension i.
- The induced filtration on Y_i has weights -s_1,...,-s_i.
- Finite field extension transports a noncritical flag and its filtration dimensions.

See LLZ2011 Section1C5, pp.1104-1105; Section2C before Proposition2.7, p.1112.

*Needs:* PhiGammaModulesAndIwasawaCohomology crystalline filtered modules; a specified Frobenius-stable full flag.

**Checks.**

- The unique flag of a rank-one filtered phi module is noncritical.
- For weights 0,-2 with Fil^1 the second eigenline, the flag starting in that line is critical in the LLZ positive convention.
- With scalar phi any flag is stable, but only flags with the required filtration dimensions are noncritical.

### 9.23 Saturated Wach flag comparison

For a noncritical refinement of a positive V, put mathcalY_i=B_rig^+ tensor Y_i and X_i=N_rig(V) intersect mathcalY_i[(t/pi)^(-1)]. Then X_i is saturated, rank i, and has weights -s_1,...,-s_i. For m>=s_max put A_i=pi^-m X_i e_m and B_i=t^-m mathcalY_i e_m. B_i is the saturation of A_i; A_d/A_(i-1) embeds in B_d/B_(i-1), with quotient annihilated by (t/pi)^(m-s_i). Passing to phi* and psi-zero gives cyclic successive quotients Btilde_i/(Btilde_(i-1)+Atilde_i) with exact annihilator n_(m-s_i); n_(m-s_i) annihilates the remaining quotient.

See LLZ2011 Propositions2.4-2.5, Lemma2.6, Proposition2.7, Lemma2.9, pp.1110-1114.

*Needs:* §9.22; PhiGammaModulesAndIwasawaCohomology Wach modules; §8.7.

**Checks.**

- In rank one the exact annihilator is n_r, not ell_0...ell_(r-1); its removable weight-zero factors have been divided out.

- At rank zero the flag, successive quotients and annihilator lists are empty and the determinant product is 1.
- In rank one with r=0, n₀=1 and the quotient is 0; at r=1, n₁=log(χγ)ℓ₀/X has value 1 at X=0.

### 9.24 Elementary divisors of the logarithmic matrix

For W with nonnegative weights r_1<=...<=r_d admitting a noncritical refinement after finite coefficient extension, the H_E(Gamma_1) elementary divisors of (B_rig^+)^(psi=0) tensor D_cris(W)/(phi*N_rig(W))^(psi=0), and hence of the row-oriented logarithmic matrix M, are the list (n_(r_i)) indexed by 1≤i≤d. Consequently det M is associated to their product. In particular M(x_i) is invertible for x_i=chi(gamma)^i-1, 0<=i<r_max, since n_r has a removable nonzero value there.

See LLZ2011 Corollary1.12, Theorem2.10 and Corollary3.2, pp.1107,1114,1117.

*Needs:* §§9.14,9.22–9.23; analytic elementary divisors and finite coefficient descent.

**Checks.**

- Weights (0,2) give (1,n_2); the matrix has nonzero determinant but is not an analytic isomorphism everywhere.

- In rank one with r=1, n₁(0)=1, but n₁ vanishes at X=ζₚ−1 because log ζₚ=0 and ζₚ−1≠0; special-weight invertibility is not global invertibility.
- In rank zero the elementary-divisor list is empty and det M=1.

### 9.25 Coleman specialization subspaces

Under NC define V_(i,eta) in D_cris(V) as (1-p^i phi)(1-p^(-1-i)phi^-1)^(-1) Fil^(-i) if eta=chi_0^i, and phi Fil^(-i) otherwise, for 0<=i<r_max. Identify D_cris with row coordinates through the chosen ordered nu basis. The constraint on Coleman rows is W_(i,eta)={v in E^d: v M(x_i) belongs to V_(i,eta)}=V_(i,eta) M(x_i)^(-1). It has codimension d-dim Fil^(-i).

- v is in W_(i,eta) iff v M(x_i) is in V_(i,eta).
- codim W_(i,eta)=d-dim Fil^(-i).
- If M becomes U M B^-1 then W becomes W U^-1, with the period subspace transported by B^-1.

See LLZ2011 Proposition4.8, Corollaries4.9-4.10 and Proposition4.11, pp.1120-1123.

*Needs:* §§8.13–8.15,9.24; Mathlib `Submodule.comap` and `LinearEquiv.finrank_eq`; NC.

**Checks.**

- For V=span(1,0) and M=[[0,1],[1,0]], W=span(0,1), so the first Coleman coordinate is forced zero.
- If Fil^(-i) is full and both Euler maps invertible then W=E^d.
- A phi eigenvalue p^-1 at i=0 violates NC and forbids using the displayed inverse.

### 9.26 Image of the Coleman vector map

Under NC, in each eta component the image of the actual Col:N(V)^(psi=1)->Lambda_E(Gamma_1)^d is exactly S={F:F(x_i) belongs to W_(i,eta),0<=i<r_max}. Its determinant ideal is product_i(X-x_i)^(d-n_i). Each coordinate image equals product_(i: W_(i,eta) subset {v:v_j=0})(X-x_i) Lambda_E. The kernel of 1-phi is zero under the excluded Frobenius eigenvalues, giving a bounded Lambda_E exact sequence with quotient direct_sum_i E^d/W_(i,eta), with Gamma action evaluated at x_i. Analytic scalar extension gives the corresponding H_E exact sequence.

A bounded descent step is necessary in the determinant argument. In R=𝒪_E[[X]][1/ϖ], Weierstrass preparation implies that an element invertible in ℋ_E is already a unit of R: after multiplying by a power of ϖ, a nonzero bounded series is a unit times a distinguished polynomial, and every root of a nonconstant distinguished polynomial has |X|<1. It would obstruct invertibility in ℋ_E. Apply this to the determinant of the inclusion of the actual free rank-d image in the free constraint module. Its analytic determinant is a unit by the regulator/logarithmic-matrix determinant comparison, so the bounded inclusion is an isomorphism. This argument requires bounded entries and the finite free actual image supplied by the Wach comparison; equality of ideals after an arbitrary scalar extension would not suffice. Name the step boundedUnitReflection and its consequence colemanImage_boundedDescent.

See LLZ2011 Theorem4.12, Corollaries4.13-4.15, pp.1123-1124.

*Needs:* §§8.19,9.7–9.11,9.16,9.24–9.25; PadicMeasuresIwasawaAlgebras Weierstrass preparation; finite freeness of the actual Wach image.

**Checks.**

- In rank one over E[X], one constraint V₀=0 at x₀=0 gives coordinate image XE[X]: X evaluates to 0 and is admitted; 1 evaluates to 1 and is excluded. Taking V₀=E instead gives image E[X], showing that the factor is determined by the transported subspace.

- For a single diagonal allowed line at 0, S={(F,G):F(0)=G(0)} has both coordinate images R but excludes (1,0).
- With no constraints and no weights above 0, S=R^d, its determinant ideal is (1) and the evaluation quotient is 0.

### 9.27 Elementary divisors of the regulator

Under NC the H_E(G)-module cokernel of the H_E-linear extension of the actual L_V has elementary divisors the list (lambda_(r_i)) indexed by 1≤i≤d. These are analytic cokernel invariants, not bounded Coleman coordinate images. For each component the determinant specializes to the L3 formula.

See LLZ2011 Theorem4.16 and proof, p.1124.

*Needs:* §§8.19,9.24,9.26; analytic elementary divisors.

**Checks.**

- Weights (0,2) give (1,ell_0 ell_1), not (1,(X-x_0)(X-x_1)) and not two identical factors.

- Weights (1,1) give (ℓ₀,ℓ₀) and determinant ℓ₀²; at χ² its value is 4.
- In rank zero the cokernel is 0, the divisor list is empty and the determinant ideal is (1).

### 9.28 Rank-two modular specialization relation

For the nonordinary modular representation V=V_(fbar)(k-1) in LLZ Section1C6 (p odd, weight k>=2, p not dividing N, coefficient E containing eigenvalues, source Frobenius exclusions), retain arbitrary nebentypus. The general target modularSpecialization_general is the specialization-line condition of §§9.25–9.26 with the actual Frobenius Φ on D_cris(V) and actual ordered matrix M: in the trivial Delta component,

```text
Col(z)(0) M(0) ∈ (1−Φ)(1−p⁻¹Φ⁻¹)⁻¹ Fil⁰ D_cris(V).
```

For nontrivial eta replace the period subspace on the right by Φ Fil⁰, as in §9.25. These matrix conditions, imposed at all weights 0≤i≤k−2 with their corresponding Φ-operators and Δ-character, give the exact rational image by §9.26. They use the actual characteristic polynomial Z²−a_p(f̄)Z+ε_f̄(p)p^(k−1) before twisting; neither the determinant character nor the ordered basis may be suppressed.

In the **trivial-nebentypus specialization** of LLZ §1C6, p.1106, use its prescribed ordered bases and M(0)=[[0,p^(k-1)],[-1,a_p]]. Then at the trivial Delta component (1-a_p+p^(k-2)) Col_2(z)(0)=p^(k-2)(p-1) Col_1(z)(0); at nontrivial eta, Col_2(z)^eta(0)=0. For k=2 the quotient functional on the ordered pair (Col_1,Col_2) is rho(g,h)=(p-1)g(0)-(2-a_p)h(0), valued in E. Its kernel is the actual rational image, and it is surjective when the coefficients are not both zero. The arbitrary-nebentypus matrix target remains alongside this explicit case.

See LLZ2011 §1C6, pp.1105–1106 (including its standing trivial-nebentypus convention); Proposition4.8, Corollaries4.9–4.10 and Theorem4.12, pp.1120–1123 (general matrix form); Lemma5.6, Corollary5.7, text before Proposition5.9 and Proposition5.9, pp.1126–1127 (the displayed scalar specialization).

*Needs:* §§9.25–9.26; PhiGammaModulesAndIwasawaCohomology modular crystalline realization; the actual nebentypus and ordered bases.

**Checks.**

- At p=5,k=2,a_p=0 the vector (1,2) satisfies 2 h=4 g and our rho=0, while the printed rho is -6.
- With nontrivial ε_f̄(p), the untwisted Frobenius determinant is ε_f̄(p)p^(k−1). Substituting the trivial-nebentypus companion matrix would change that determinant; use the actual Φ and M in modularSpecialization_general.

- For p=5,k=2,aₚ=0, ρ(1,0)=4≠0 and ρ(0,1)=−2≠0, so the functional is onto and its kernel is a proper line.

### 9.29 Integral Coleman image has finite cokernel

Use the actual modular lattice T=T₀(h), T₀=T_f̄ and h=k−1≥1, and the prescribed integral good Wach basis of LLZ2011 §5. Assume p odd, p∤N and f nonordinary at p, with the Frobenius/refinement exclusions of §§9.25–9.28 wherever their rational image theorem is used. There is **no** hypothesis p≥k−1 or v_p(a_p)>⌊(k−2)/(p−1)⌋. The lower inclusion is the target theorem

```text
integralWachLowerInclusion:
  (φ(π)^h φ*N(T))^{ψ=0} ⊂ (1−φ)N(T)^{ψ=1}.
```

**Integral convergence on the actual lattice.** Write R=𝒪_E[[π]], 𝔪=(ϖ_E,π), M=N(T₀). Its Wach structure gives φM⊂M and N(T)=π⁻ʰM⊗v_h. For any R-basis of M let P be the integral Frobenius matrix and P₀=P mod π. The reduction M/πM is an actual 𝒪_E-lattice in D_cris(V_f̄). Its Frobenius characteristic polynomial is Z²−a_p(f̄)Z+ε_f̄(p)pʰ. Since h≥1 and a_p(f̄)∈ϖ_E𝒪_E, Cayley–Hamilton gives P₀²≡0 mod ϖ_E. Frobenius fixes 𝒪_E, so its second iterate has matrix P·φ(P) (or the reversed product in row coordinates), reducing to P₀² mod 𝔪. Hence φ²M⊂𝔪M. Also φ(𝔪)⊂𝔪. Inductively `φ^{2n}M⊂𝔪ⁿM,` and the odd iterates satisfy the same convergence bound. This proves φⁿm→0 in the complete 𝔪-adic module M for every m∈M, with no eigenbasis or rational coefficient division.

For `y∈(φ(π)ʰφ*N(T))^{ψ=0},` the twist identity identifies φ(π)ʰφ*N(T) with φ*M⊗v_h⊂M⊗v_h; φ acts trivially on the representation vector v_h in the étale module. Thus `x=Σ_{n≥0}φⁿy` converges in M⊗v_h⊂N(T), **over the original 𝒪_E**. Telescoping gives (1−φ)x=y. Continuity of ψ in the weak topology of D(T), ψφ=id and ψy=0 give ψx=x. The finite free 𝔪-adic topology on M embeds in that weak topology. Consequently x belongs to the actual D(T), not merely D(V), proving the lower inclusion. It also proves uniqueness within M⊗v_h, since a φ-fixed vector in this contracting module is zero. This is the integral geometric-series argument suggested by LLZWach Proposition4.6 and the first paragraph of Proposition4.11's proof, with contraction proved here for every nonordinary modular lattice. Their special-basis restrictions (C),(D) are not imported into this proof. Neither are their later cyclic-quotient or surjectivity assertions extended by it.

**From the lower inclusion to the coordinate ideal.** Let F=φ*N(T) and u=χ(γ). If G is γ's Wach matrix, G≡1 mod π, so its matrix on F is φ(G)≡1 mod φ(π). Also γ(φ(π))/φ(π)≡u mod φ(π). Since γ∈Γ₁, u∈1+pℤₚ and γ acts trivially on R/(φ(π)): modulo (1+π)ᵖ−1, raising 1+π to u leaves it unchanged. Together with φ(G)≡1 this includes the coefficient action, not just the basis matrix. Thus γ acts on `φ(π)ⁱF/φ(π)^{i+1}F` by uⁱ, and `∏_{i=0}^{h−1}(γ−uⁱ)F⊂φ(π)ʰF.` This argument is integral; the factors commute, and all modules and ψ-zero submodules are Γ-stable. In the integral good-basis isomorphism `F^{ψ=0}≃Λ_𝒪(G∞)²` it sends X_k times each coordinate basis vector into the proved lower submodule, where `X_k=∏_{i=0}^{k−2}(X−χ(γ)ⁱ+1).` Applying the lower inclusion and then a coordinate projection gives X_kΛ_𝒪⊂Im Col_j^η for every Δ-character η.

Let `X_j^η=∏_{i∈I_j^η}(X−χ(γ)ⁱ+1)` be the rational image generator of §9.28/LLZ Corollary5.3. Integral Weierstrass division by this monic distinguished polynomial gives (X_j^ηΛ_E)∩Λ_𝒪=X_j^ηΛ_𝒪: the integral remainder is zero if it vanishes after inverting ϖ_E. Hence

```text
X_kΛ_𝒪 ⊂ Im Col_j^η ⊂ X_j^ηΛ_𝒪,
length_𝒪(X_j^ηΛ_𝒪 / Im Col_j^η) < ∞.
```

Indeed X_j^η divides X_k, so X_j^ηΛ_𝒪/X_kΛ_𝒪 is finite free over 𝒪_E. The quotient by the actual image is finitely generated over 𝒪_E, and rational image equality makes it ϖ_E-power torsion; it therefore has finite length. This uses rational equality only **after** proving the integral lower inclusion. A finite coefficient extension commutes with the Wach and good-basis constructions; faithful flatness reflects these inclusions, but no such extension or descent is needed for the proof above.

After the integral shear of Proposition5.11 all X_j^η=1, so each coordinate cokernel is finite, hence pseudo-null over 𝒪_E[[X]]. The shear has unit determinant and preserves the actual lattice. Integral surjectivity does not follow.

See LLZWach §2.2, p.8 (integral Wach lattice, φ-stability, reduction and coefficients), Proposition4.6, pp.24–25 and Proposition4.11 and proof, pp.26–27 (the series argument is in the first paragraph on p.26); LLZ2011 §1C4, pp.1103–1104, §1C6, pp.1105–1106, Theorem5.10, p.1128 and Theorem5.13/Proposition5.11/Remark5.12, pp.1128–1129; the maximal-ideal selection is in LLZ2011 §5.3, Remark5.12, p.25 (LLZ2011 preprint arXiv:1006.5163v2). The complete-lattice contraction, quotient-filtration and Weierstrass arguments above discharge the wider range; they are not assertions that Proposition4.11 itself states that range.

*Needs:* §§9.12,9.18–9.21,9.26,9.28; PhiGammaModulesAndIwasawaCohomology integral Wach lattices and good bases; PadicMeasuresIwasawaAlgebras integral Weierstrass division.

**Checks.**

- The proper ideal (ϖ_E,X) becomes the full ring after inverting ϖ_E but is not integrally surjective.
- At p=5,h=9, a local Frobenius matrix with trace 5 and determinant 5⁹ still has P₀²≡0 mod 5. Both restrictions (C),(D) from Proposition4.11 fail, but integral contraction holds. This checks the argument's range without asserting the existence of a global eigenform with these prescribed coefficients.
- A rank-one unit-Frobenius block φ=1 does not contract: Σφⁿ(1) does not converge 𝔪-adically. Nonordinary positive slopes are used at the precise Cayley–Hamilton step.
- For a ramified coefficient field use ϖ_E rather than p in 𝔪. The proof already gives x over 𝒪_E and permits no hidden p⁻¹ coefficient in x.
- If X_j^η=1 after shearing, the conclusion is finite length of Λ_𝒪/Im Col_j^η. The ideal (ϖ_E,X) is still a counterexample to replacing this conclusion by zero cokernel.

### 9.30 Signed local conditions from Coleman maps

For a specified actual good integral Wach basis and coordinate j, export the closed Lambda_O-submodule ker Col_j of H^1_Iw(Q_p,T) via the proved h_Iw comparison. The exported datum is this specified closed kernel; forming a global signed Selmer structure from it is outside this target. Under basis n prime=U n its row maps become Col prime=Col U^-1; the new kernel need not equal the old kernel. A basis or named signed normalization is part of the input.

- A class lies in the condition iff its specified Col_j value is zero.
- The kernel is a closed Lambda_O submodule.
- Its transported description is {z:(Col(z) U^-1)_j=0}.

See LLZ2011 Section3A and Section1A applications, pp.1096-1097,1116.

*Needs:* §§9.12,9.17,9.29; the continuous integral Iwasawa comparison and specified coordinate.

**Checks.**

- The zero class lies in every condition.
- For Col(z)=(1,0) and U^-1=[[1,1],[0,1]], the second new coordinate is 1, so the second condition changes.
- Multiplying a coordinate by an O_E unit leaves its kernel unchanged; a noninvertible operation is not a basis change.

### 9.30a Differential module and Bloch–Kato maps of a de Rham (φ,Γ)-module

Sections 9.31–9.35 apply to every de Rham (φ,Γ)-module over the Robba ring, étale or not, so they need the differential module and the Bloch–Kato maps of such a module. Section 1.2's exponential and §1.4's dual exponential are defined only for Galois representations. This section constructs the general maps and identifies them with those of §§1.2 and 1.4 on étale modules.

Let E/ℚₚ be finite, R_E the Robba ring of ℚₚ with coefficients in E, Γ=Gal(ℚₚ(μ_p∞)/ℚₚ), F_n=ℚₚ(μ_pⁿ) and Γ_n=Gal(ℚₚ(μ_p∞)/F_n), with Γ_0=Γ. Let Δ_n be the p-primary torsion of Γ_n and γ_n a topological generator of Γ_n/Δ_n. Let D be a (φ,Γ)-module over R_E of rank d. The Herr cohomology H^i(F_n,D) is that of PhiGammaModulesAndIwasawaCohomology's signed complex C_(φ,γ_n) on D^(Δ_n), with `d0(x) = ((phi-1)x, (gamma_n-1)x)` and `d1(a,b) = (gamma_n-1)a - (phi-1)b`. The ψ-complex is identified with it by the signed comparison of that roadmap's §3.2.

Differential realization. For n at least the overconvergence threshold n(D), apply the localization ι_n=φ^(−n) of PadicHodgeTheory §4.2 coefficientwise to the radius-r_n model of D. This gives D⁺_dif,n(D)=(E⊗F_n)[[t]]⊗D^(r_n) and D_dif,n(D)=D⁺_dif,n(D)[1/t], and their unions over n are D⁺_dif(D) and D_dif(D), with semilinear Γ. Put D_dR(D)=D_dif(D)^Γ and Fil^i D_dR(D)=(t^i D⁺_dif(D))^Γ. Then dim_E D_dR(D)≤d, and D is de Rham when equality holds (RJ2018 §§IB1–IB2, Definitions 1–2, pp.898–900). Under the B-pair equivalence of PadicHodgeTheory §4.5, D⁺_dif(D) generates W⁺_dR of the B-pair W(D), so D_dR(D) and Fil⁰ are that section's de Rham realization and D⁺_dR. For D=D_rig(V) they are D_dR(V) and its Hodge filtration.

Differential module. Let D be de Rham. Then N_rig(D) is the unique (φ,Γ)-submodule of D[1/t] that is free of rank d, satisfies N_rig(D)[1/t]=D[1/t], and has D⁺_dif,n(N_rig(D))=(E⊗F_n)[[t]]⊗_E D_dR(D) for all n≥n(D) (Nakamura2014 Theorem 3.5, p.34; RJ2018 Proposition I.3, p.900). It satisfies ∇N_rig(D)⊆tN_rig(D), so ∂=t⁻¹∇ acts on it with ∂φ=pφ∂. If the Hodge–Tate weights lie in [a,b], then t^(−a)D⊆N_rig(D)⊆t^(−b)D (RJ2018, paragraph after Proposition I.3, p.900). Existence is supplied by PadicHodgeTheory §5.2: take Berger's modification of the filtered (φ,N,G_ℚₚ)-module of D with its filtration replaced by the trivial one (Fil⁰ everything, Fil¹ zero). The localized lattices of that modification are exactly (E⊗F_n)[[t]]⊗D_dR(D). For D=D_rig(V), uniqueness identifies N_rig(D) with PhiGammaModulesAndIwasawaCohomology §5.6a's N_dR(V).

Exponential. Let D be any (φ,Γ)-module and n≥0. The exponential exp_(F_n,D):F_n⊗D_dR(D)→H¹(F_n,D) is the connecting map of the long exact sequence attached to the exact sequence of complexes D→D[1/t]⊕D⁺_dif(D)→D_dif(D) (Nakamura2014 Theorem 2.8, p.15, and Definition 2.10, p.18). Explicitly, given x, choose m≥n(D) and x̃∈(D^(r_m)[1/t])^(Δ_n) with ι_k(x̃)−x∈D⁺_dif,k(D) for every k≥m. Then exp_(F_n,D)(x) is the class of the cocycle ((φ−1)x̃,(γ_n−1)x̃). The class does not depend on m or x̃, and it is zero on F_n⊗Fil⁰D_dR(D) (Nakamura2014 Lemma 2.12(1) and Remark 2.11, p.18; RJ2018 §IB9, p.908).

Dual exponential. Let D be de Rham. In the indexing of §1.4, exp*_(F_n,D^∨(1)):H¹(F_n,D)→F_n⊗Fil⁰D_dR(D) is defined in three steps. First send the class of (a,b) to the class of ι_m(b), m≫0, in H¹ of γ_n−1 on D⁺_dif(D). Then map it to H¹ of γ_n−1 on D_dif(D). Finally apply the inverse of the isomorphism F_n⊗D_dR(D)→H¹(Γ_n,D_dif(D)), y↦[log χ(γ_n)·y], which does not depend on γ_n (Nakamura2014 §2.4, pp.19–22; RJ2018 §IB9, p.908). The two maps are adjoint: ⟨exp_(F_n,D)(x),y⟩=Tr_(F_n/ℚₚ)[x,exp*_(F_n,D)(y)]_dR for y∈H¹(F_n,D^∨(1)), with the ordered Tate pairing of Herr cohomology on the left (Nakamura2014 Proposition 2.16, p.23). This is the positive adjunction of §1.4.

Both sources put the γ_n-coordinate first: Nakamura's complex has d⁰x=((γ−1)x,(φ−1)x) (Nakamura2014 §2.2, p.12), and RJ2018 §IB9 follows that order. RJ2018 §IB7, p.906, displays the φ-first order used here. The formulas above have been transported to the φ-first order.

Étale comparison. Let V be an E-representation of G_ℚₚ and D=D_rig(V). The comparison between Herr cohomology and Galois cohomology over F_n (PhiGammaModulesAndIwasawaCohomology §3.4a, and PadicHodgeTheory §4.5's `herrBPairDerived` on étale objects) carries exp_(F_n,D) to the Bloch–Kato exponential exp_(F_n,V) of §1.2. When V is de Rham, it also carries exp*_(F_n,D^∨(1)) to §1.4's dual exponential. The reason is that Nakamura2014 Theorem 2.21, p.27, identifies the long exact sequence above with the B-pair sequence of W(D), which for étale D is Bloch–Kato's fundamental sequence tensored with V. The two adjunctions then identify the dual maps.

Specialization. For z∈D^(ψ=1), let μ_z∈H¹_Iw(D)=H¹(C_ψ(D)) be its class. RJ2018 §IB8, p.907, writes ∫_(Γ_n)η·μ∈H¹(F_n,D(η)) for the base change along [γ]↦η(γ)⁻¹. This is PhiGammaModulesAndIwasawaCohomology §5.3's specialization at η⁻¹, which lands in D(η) by that section. Every integral ∫η·μ in §§9.30a–9.35 has this meaning.

Differential interpolation. Let D be de Rham and h≥1 with Fil^(−h)D_dR(D)=D_dR(D). Put ∇=log γ/log χ(γ) and ∇_h=(∇−h+1)∘⋯∘(∇−1)∘∇. Then ∇_h maps N_rig(D)^(ψ=1) into D^(ψ=1) (Nakamura2014 Lemma 3.6, p.35; RJ2018 Lemme I.9, p.909). For y∈N_rig(D) and m≫0, write [φ^(−m)y]_0∈F_m⊗D_dR(D) for the constant term of ι_m(y)∈(E⊗F_m)((t))⊗D_dR(D). Fix z∈N_rig(D)^(ψ=1) and n≥0, and let m≫0.

- Case (i). Suppose −(h−1)≤j≤0 and z_j=∂^(−j)z, or j≥1 and z_j∈N_rig(D)^(ψ=p^(−j)) with ∂^j z_j=z. Then `int_(Gamma_n) chi^j . mu_(nabla_h z) = p^(m(j-1)) Gamma*(1-j-h)^(-1) exp_(F_n,D(j))(Tr_(F_m/F_n)[phi^(-m) z_j]_0 (x) t^(-j) e_j)`.
- Case (ii). Suppose j≥h. Then `exp*(int_(Gamma_n) chi^(-j) . mu_(nabla_h z)) = p^(-m(j+1)) Gamma*(1+j-h)^(-1) Tr_(F_m/F_n)[phi^(-m) partial^j z]_0 (x) t^j e_(-j)`, where exp* is the dual exponential of D(−j).

Here Γ* is §8.6's leading Gamma coefficient, so the two factors are (−1)^(h+j−1)(h+j−1)! in case (i) and 1/(j−h)! in case (ii). Sources: Nakamura2014 Theorem 3.10, pp.36–37, normalized there with |Γ_(L,tor)| and p^(m(L)), and RJ2018 Théorème I.10, p.909, in the trace normalization used here. RJ2018 prints the factor of case (ii) as Γ*(1−j−h)⁻¹. The factor 1/(j−h)! stated here is the one in Nakamura2014 Theorem 3.10(2), in Berger2003 Theorem II.10, p.119 (for étale crystalline D), and in RJ2018's own Théorème I.15, p.914, whose interpolation factor is Γ*(j−h+1). The Checks below fix it.

- D_dR(D) has E-dimension at most rank D, with equality exactly when D is de Rham. Fil is decreasing, exhaustive and separated. For D_rig(V) these are D_dR(V) and its Hodge filtration.
- N_rig(D) is characterized by N_rig(D)[1/t]=D[1/t] and its localizations. It is ∂-stable, lies between t^(−a)D and t^(−b)D, and on D_rig(V) it equals N_dR(V).
- exp_(F_n,D) is well defined, E-linear and natural in D, and kills F_n⊗Fil⁰. Its image is the kernel of H¹(F_n,D)→H¹(F_n,D[1/t])⊕H¹(F_n,D⁺_dif(D)). The square with Tr_(F_(n+1)/F_n) and cor_(F_(n+1)/F_n) commutes.
- For de Rham D, exp* takes values in F_n⊗Fil⁰D_dR(D), does not depend on γ_n, and is adjoint to exp as stated.
- On D=D_rig(V) the two maps are those of §§1.2 and 1.4, through the Herr–Galois comparison.
- RJ's integral ∫η·μ is PhiGammaModulesAndIwasawaCohomology §5.3's specialization at η⁻¹, valued in D(η).
- The two interpolation formulas hold with the factors Γ*(1−j−h)⁻¹ and Γ*(1+j−h)⁻¹.

See Nakamura2014 §2.2, p.12; Theorem 2.8, p.15; Definition 2.10, Remark 2.11 and Lemma 2.12(1), p.18; §2.4, pp.19–22; Proposition 2.16, p.23; Theorem 2.21, p.27; Theorem 3.5, p.34; Lemma 3.6, p.35; Theorem 3.10, pp.36–37. See also RJ2018 §§IB1–IB3, pp.898–900; §IB7, p.906; §§IB8–IB9, pp.907–908; Lemme I.9 and Théorème I.10, p.909; Théorème I.15, p.914; and Berger2003 Proposition II.5, p.116, and Theorems II.3 and II.10, pp.114 and 119.

*Needs:* PadicHodgeTheory §4.2 for ι_n and its coefficientwise extension, §4.5 for B-pairs, D⁺_dR and `herrBPairDerived`, and §5.2 for Berger's modification; PhiGammaModulesAndIwasawaCohomology §§3.1–3.2 for the signed Herr complexes and the φ/ψ comparison, §3.4a for the field Herr–Galois comparison and duality, §5.3 for the cyclotomic deformation and its specialization, and §5.6a for N_dR(V); §§1.2 and 1.4 for the étale comparison; §8.6 for Γ*.

**Checks.**

- Coordinate order. Take p odd, D=R_E and n=0. Here D_dR(D)=E=Fil⁰, so exp_(ℚₚ,D)=0. The cyclotomic class (0,log χ(γ_0)) is a cocycle and exp* sends it to 1, as §1.4's dual exponential sends log χ to 1. The unramified class (c,0), c≠0, is a cocycle with zero second coordinate, so exp* sends it to 0. Reading the sources' γ-first coordinates into the φ-first complex would exchange these two values. In the scalar model φ=2, γ_n=3, x̃=1, the vector ((φ−1)x̃,(γ_n−1)x̃)=(1,2) satisfies d¹(1,2)=2·1−1·2=0, whereas the transposed (2,1) gives d¹(2,1)=2·2−1·1=3≠0.
- A non-étale module. Take E=ℚ₅(√5) and D=R_E·d with φ(d)=5^(−1/2)d and γ(d)=d. Then D_dR(D)=E·d=Fil⁰D_dR(D), so D is de Rham (indeed crystalline) of Hodge–Tate weight 0, and N_rig(D)=D. Its slope is −1/2, so D is not étale and is not D_rig(V) for any V. Its Herr cohomology has h⁰=0, because φ acts on the Γ-invariants E·d by 5^(−1/2)≠1. It has h²=0, because the dual twist would need a Γ-eigenvector with character χ⁻¹ in R_E, and c·t⁻¹ is not in R_E for c≠0. Hence h¹=1 by the Euler characteristic −1. Here exp_(ℚ₅,D)=0 and exp* maps this line to E·d, while §§1.2 and 1.4 have no input for this D. Section 9.35's first Check uses modules of this kind.
- The Tate twist. For D=R_E(1)=D_rig(E(1)), one has D_dR(D)=E·t⁻¹e₁, Fil⁰=0 and weights [a,b]=[1,1], so N_rig(D)=t⁻¹D=R_E·t⁻¹e₁ and ∇(t⁻¹e₁)=0. Imposing the filtered lattice Fil⁰ in place of all of D_dR(D) would give D back, and D is not ∂-stable, since ∂e₁=t⁻¹e₁∉D.
- Gamma factors. On étale crystalline D with h=3 and j=0, case (i) gives Γ*(−2)⁻¹=2, which is the factor (−1)^(h−1)(h−1)!=2 of Berger2003 Theorem II.3. Using Γ*(−2)=1/2 instead would be off by 4. In case (ii) with j=h=1, the constant term of φ^(−n)(∇z⊗e_(−1)) is j!/(j−h)!=1 times d₁. Since d₁=p^(−n)[φ^(−n)∂z]_0, the factor is 1=Γ*(1)⁻¹. The printed Γ*(−1)⁻¹=−1 has the wrong sign, and at j=2, h=1 the printed Γ*(−2)⁻¹=2 is off by 2 from 1/(j−h)!=1.
- Specialization side. Let η have order 4, at p=5 for instance. RJ's ∫η·μ lies in H¹(D(η)), whereas PhiGammaModulesAndIwasawaCohomology §5.3's specialization at η lies in H¹(D(η⁻¹)). For D=R_E these are cohomologies of the non-isomorphic modules R_E(η) and R_E(η⁻¹), so a conflated convention evaluates the regulator on the wrong twist.
- For D=0 every group, map and interpolation value is 0.

### 9.31 Admitted de Rham character domain

Let D be a de Rham (phi,Gamma)-module over R_E, not necessarily étale, Delta=N_rig(D) its differential module (§9.30a), and m(Delta) an overconvergence/localization threshold. On a torsion weight component write a character kappa by z_kappa=kappa(exp(q)), q=p for odd p and q=4 for p=2. If the torsion components differ set v_p(z_kappa-z_eta)=-infinity. For a primitive finite character eta of conductor p^c set B(eta,N)={kappa:v_p(z_kappa-z_eta)>p^(N-c)}. Choose the source threshold N(D); put U_D=union_(c>m(Delta)) B(eta,N(D)). Since eta ↦ eta^-1 permutes the primitive characters of each conductor, U_D is also the union of the balls B(eta^-1,N(D)); §9.33 uses this second description for its charts. Balls of the same conductor can overlap: Rodrigues Jacinto's Remark I.18 shows they are disjoint only when the centres are far apart, so the values on overlaps must be compared. Enlarge N(D) if necessary so that N(D)≥2 for odd p and N(D)≥3 for p=2; a larger threshold shrinks every ball, so this keeps an admissible domain. Then balls of different conductors are disjoint. For centres of conductor exponents c<c′ on one torsion component, z_eta′/z_eta is a primitive root of unity of order p^(c′−1) for odd p and 2^(c′−2) for p=2, so v_p(z_eta′−z_eta) is 1/(p^(c′−2)(p−1)) ≤ p^(N(D)−c′), respectively 2^(3−c′) ≤ 2^(N(D)−c′); a common point would force v_p(z_eta′−z_eta)>p^(N(D)−c′). Hence each theta in U_D has a conductor exponent c(theta), that of every admitted centre whose ball contains theta, and U_D is the disjoint union of the conductor strata U_(D,c)=union_(cond eta=p^c) B(eta,N(D)). Choices give admissible domains with compatible restriction, not a maximal canonical domain or all weight space. N(D) can be bounded in terms of the conductor of an extension where D becomes semistable.

- Membership is existence of an admitted primitive eta with the stated coordinate valuation inequality.
- U_D is an admissible open of character space.
- Two valid threshold choices define compatible restrictions of the same regulator on their common admitted domain.
- With N(D)≥2 for odd p and N(D)≥3 for p=2, balls of different conductors are disjoint, so the conductor exponent c(theta) is a locally constant function on U_D and the strata U_(D,c) are open and pairwise disjoint.

See RJ2018 Section 0E3 and IA, Theorem I.1; Sections IC4-IC5, equation(3), Theorem I.15, Lemma I.17 and Remark I.18, pp.896-898,910-916.

*Needs:* §9.30a for N_rig(D); PhiGammaModulesAndIwasawaCohomology §1.0; LocallyAnalyticDistributions §3.3 character space.

**Checks.**

- Each admitted eta has infinite valuation difference from itself and lies in its ball.
- A character on another torsion component has valuation difference -infinity and lies outside this ball.
- A character with valuation difference exactly p^(N-c) is excluded by the strict inequality; the trivial character is not supplied by a high-conductor center argument.
- At p=5 let eps have conductor 25, be trivial on the tame part and satisfy eps(6)=ζ₅; since exp(5) ≡ 6 mod 25, v₅(z_(eta·eps)−z_eta)=v₅(ζ₅−1)=1/4. For eta primitive of conductor 5^m with 5^(N(D)−m) < 1/4, the centre eta·eps lies in B(eta,N(D)), so two charts of the same conductor overlap.
- Threshold bound at p=5: a centre eta of conductor 25 has z_eta a primitive 5th root of unity, and a centre eta′ of conductor 125 on the same torsion component has z_eta′ a primitive 25th root, so v₅(z_eta−z_eta′)=1/(5·4)=1/20. With N=1 this exceeds 5^(1−3)=1/25, so eta lies in B(eta′,1) and charts of conductors 25 and 125 meet; with N=2 the bound 1/20 ≤ 5^(−1) separates them. At p=2 with N=2 the conductor-4 centre (z=1) lies in a conductor-8 ball (z=−1), since v₂(2)=1>2^(2−3); with N=3, 1 ≤ 2^0 separates them.

### 9.32 Analytic powers of the differential operator

On Delta^(psi=0), for a sufficiently small weight affinoid and N large define kappa(partial) by the convergent series sum_(i in (Z/p^N)^times) sum_(j>=0) binom(omega_kappa,j) kappa(i) i^-j (1+T)^i p^(Nj) phi^N(partial^j z_i), where z_i=psi^N((1+T)^(-i)z). The value is independent of large N and representatives and is rigid analytic in kappa; for kappa=x^k, k in Z, it equals partial^k on psi-zero (negative powers use its inverse there).

- At x^k the operator is partial^k for every integer k.
- It is E-linear in z and analytic in kappa on the specified affinoid.
- Changing N or residue representatives preserves the value on the common annulus.

See RJ2018 SectionIC2, PropositionI.13 and proof, pp.911-913.

*Needs:* §§9.30a–9.31; LocallyAnalyticDistributions §§1.4–1.5.

**Checks.**

- At k=0 the operator is the identity on psi-zero.
- At k=1 it is partial, not t partial.
- At k=-1, partial composed with the operator is identity on psi-zero; no inverse is asserted on all Delta.

### 9.33 Rodrigues Jacinto de Rham regulator

For z in Delta^(psi=1) and primitive finite eta of conductor exactly p^m with m>m(Delta), define on the chart B(eta^-1,N(D))

```text
Lambda_(D,z)(eta^-1 kappa) = G(eta)^(-1) sum_(a in (Z/p^m)^times) eta(a) sigma_a [phi^(-m) kappa(partial)(1-phi)z]_0,
```

with kappa trivial on the torsion of ℤ_pˣ and in the weight affinoid of §9.32. This is Rodrigues Jacinto's formula (3), whose printed argument is eta·kappa; the Gauss sum combines eta^-1 with kappa, so the formula is a function of eta^-1·kappa and the point is labelled accordingly. The exponent m is the conductor exponent of eta, not a freely enlargeable localization index. The constant term is taken in E_m tensor D_dR(D) after localization at that conductor; the sum descends to D_dR(D).

Overlap identity: if a point theta of U_D has two admitted decompositions theta=eta^-1 kappa=eta'^-1 kappa', the two chart values agree; by §9.31 eta and eta' then have the same conductor p^m, so both charts use the same phi^(-m) and residue modulus. Route: write kappa(partial) by its residue-class expansion of §9.32; on the summand of residue class i the operator contributes kappa(i), the Gauss sum contributes eta(i)^-1, and their product is theta(i); the analytic remainder depends only on the weight of kappa, which theta determines. Only after this identity do the charts glue to a rigid analytic D_dR(D)-valued function on U_D. With the printed labelling eta·kappa the identity fails (Checks). For positive-weight D and z in D^(psi=1), use its actual inclusion in Delta; an Iwasawa version is through the proved PhiGammaModulesAndIwasawaCohomology Layer 5/L2 map.

- Its value on an admitted ball is the displayed localized constant-term Gauss sum, at the point eta^-1·kappa.
- Two admitted decompositions of the same point give the same value; this overlap identity is what makes the glued function well defined.
- It is E-linear in z; the Gamma action induces the source character-equivariance convention.
- The conductor-m expression descends to D_dR(D). Embedding it in a larger coefficient field preserves its value while phi^(-m), the residue modulus and G(eta) remain at cond(eta)=p^m.
- Two admitted thresholds give equal functions on their common domain.

See RJ2018 Equation(3), TheoremI.15, LemmaI.17, RemarkI.18 and proofs, pp.914-916.

*Needs:* §§9.30a–9.32; PhiGammaModulesAndIwasawaCohomology §§1.0,5.1–5.4; finite-character Gauss and Tate bases.

**Checks.**

- The zero psi-one vector gives the zero analytic function.
- A psi-one vector fixed by phi is killed by 1-phi and gives zero.
- Replacing G(eta) by G(eta)^-1 would multiply the expression by G(eta)^2; the stated denominator is essential.
- In the Gauss-sum model at p=5, let eta be the quadratic character of conductor 5. For primitive compatible roots zeta_5=zeta_25^5, sum_(a mod 5, 5 not dividing a) eta(a) zeta_5^a=G(eta) is nonzero, whereas sum_(a mod 25, 5 not dividing a) eta(a) zeta_25^a=0. Thus the normalized conductor-5 value is 1 and the imprimitive modulus-25 replacement is 0.
- Overlap test for the trivial module D=ℛ at p=5: z=Σ_(r≥0)((1+T)^(6·5^r)−(1+T)^(5^r)) has integral coefficients, converges on the open disc, and telescoping gives (1−φ)z=(1+T)^6−(1+T) and ψz=z. Since kappa(partial)(1+T)^b=kappa(b)(1+T)^b and sum_a eta(a)zeta^(ab)=eta(b)^-1 G(eta) for a unit b, the chart value is eta(6)^-1 kappa(6)−1=theta(6)−1 at theta=eta^-1 kappa. With eps as in §9.31 and eta'=eta·eps, the point eta'^-1 lies on the eta-chart with kappa=eps^-1 and on the eta'-chart with kappa=1; both give eta(6)^-1 ζ₅^-1−1. Under the printed labelling eta·kappa, the point eta·eps lies on the eta-chart with kappa=eps and on the eta'-chart with kappa=1, and would receive eta(6)^-1 ζ₅−1 and eta(6)^-1 ζ₅^-1−1, which differ.

### 9.34 De Rham interpolation and convergence bound

For D with nonnegative Hodge–Tate weights, z in D^(psi=1), and eta^-1 x^j in U_D with eta primitive of conductor p^n, RJ I.27 gives Lambda_(D,z)(eta^-1 x^j)=Gamma*(j+1) p^(n(j+1)) exp*(integral_G eta chi^(-j) mu_z) tensor e_(eta,-j)^(dR,dual) for j>=0, and the analogous exp^(-1) value for j sufficiently negative that the indicated Bloch–Kato exponential is bijective. D need not be étale. The integral is §9.30a's specialization and lies in H¹(ℚₚ,D(ηχ^(−j))), and exp and exp* are the maps of §9.30a for that module. They agree with §§1.2 and 1.4 only when D=D_rig(V). RJ's proof uses the differential interpolation of §9.30a, with its corrected factor Γ*(1+j−h)⁻¹. RJ print the point as eta x^j; the formula is the value of the chart of §9.33 centred at eta^-1, so the integrand eta chi^(-j) is the inverse of the point. Gauss bases are e_(eta,j)^dR=G(eta)t^-j e_(eta,j), dual=G(eta)^-1 t^j e_(eta^-1,-j). For general z in Delta use TheoremI.15 after nabla_h, with Gamma*(j-h+1) and j>=h or j sufficiently negative. Its growth statement is the local Robba annulus convergence estimate of LemmaI.17; it is not a global finite-order distribution bound.

See RJ2018 Lemme I.17, p.914; Propositions I.22–I.23, pp.917–918; Lemmes I.24–I.26, p.919; Théorème I.27, pp.919–920; footnote 10, p.898; footnote 25, pp.914–920.

*Needs:* §9.30a for exp, exp*, the specialization convention and the differential interpolation; §8.6; §§9.31–9.33; §§1.2–1.4 through §9.30a's étale comparison for the representation Check; the stated exponential isomorphism range and localization threshold.

**Checks.**

- For V=ℚₚ and j=−1, V(−j)=ℚₚ(1); exp has the unit Kummer line as image, while the uniformizer class has valuation 1 and is outside it. Thus Γ*(0)=1 alone does not license an inverse on all H¹. For j=−2 the twist is ℚₚ(2), whose exponential is bijective.

- For the zero ψ-one vector every interpolation value is 0; the Gauss-basis conversion sends 0 to 0.
- At j=−2 the Gamma factor is −1 and the conductor multiplier is p⁻ⁿ; at j=0 they are 1 and pⁿ. This distinguishes the two integer ranges.

### 9.35 Crystalline comparison of the de Rham regulator

Let D be crystalline and z ∈ N_rig(D)^(psi=1) with (1−phi)z ∈ (ℛ⁺)^(psi=0) ⊗ D_cris(D). This holds when z ∈ ℛ⁺ ⊗ D_cris(D), in particular for every z when the phi-slopes on D_cris(D) are negative (RJ2018 §IC9, p. 920), and on the Wach range of Layer 8 (§8.8). Let 𝔐_z ∈ ℋ_E(ℤ_pˣ) ⊗ D_cris(D) be the distribution whose Amice transform is (1−phi)z; it is a rigid analytic D_cris(D)-valued function on all of weight space. The target is the chart-by-chart comparison

```text
Lambda_(D,z)(eta^-1 kappa) = phi^(-n)(𝔐_z(eta^-1 kappa))
  for eta primitive of conductor p^n, n > m(Delta), and eta^-1 kappa in the chart B(eta^-1,N(D)) of §9.33,
```

in D_cris(D) = D_dR(D). By §9.31 the exponent n is the conductor exponent c(theta) of theta = eta^-1 kappa, so the comparison says Lambda_(D,z)(theta) = phi^(-c(theta))(𝔐_z(theta)) on U_D; no finite-order part is extracted from a general locally analytic character, and on overlaps of charts of one conductor both sides are compared by the overlap identity of §9.33. Route: in the chart formula, phi^(-n) acts on both factors of ℛ⁺ ⊗ D_cris(D); on (1+T)^b with b a unit the constant term of phi^(-n) is zeta_(p^n)^b, kappa(partial) multiplies by kappa(b), and the Gauss sum turns eta(b)^-1 kappa(b) into theta(b). In an eigenbasis phi(e_i)=alpha_i e_i, z=sum A_lambda_i tensor e_i, this is RJ Proposition I.28: Lambda_(D,z) equals sum_i alpha_i^-n (integral_Zp^times theta lambda_i) e_i at theta=eta^-1 x^j, the point printed there as eta x^j. The basis-free form needs no eigenbasis and covers nonsemisimple Frobenius.

The global rigid analytic object is 𝔐_z. On the common crystalline range of Layer 8 it is the regulator L_V of §8.8 at the corresponding Iwasawa class, so the map-level comparison with the LLZ/LZ regulator is Lambda_(D,z)(theta)=phi^(-n)(L_V(theta)) on the conductor stratum U_(D,n), after the Amice/Mellin and Gauss/Tate period conventions of §§8.13 and 9.34 are matched. Lambda_(D,z) itself is not in general the restriction of a function on all of weight space, because of the factor phi^(-n): RJ Corollary I.29 asserts that extension for Lambda_(D,z), and the first Check is a counterexample to it. The global extension asserted here is that of 𝔐_z. For z with (1−phi)z outside (ℛ⁺)^(psi=0) ⊗ D_cris(D) no comparison is asserted.

- On each chart B(eta^-1,N(D)) with cond(eta)=p^n, Lambda_(D,z) = phi^(-n) ∘ 𝔐_z; these charts make up the stratum U_(D,n) of §9.31, so the identity holds on U_(D,n).
- 𝔐_z is E-linear in z and rigid analytic on all of weight space.
- On the Layer 8 range, 𝔐_z is L_V of the corresponding Iwasawa class.

See RJ2018 TheoremI.15, p.914; SectionIC9, PropositionI.28, CorollaryI.29, p.920.

*Needs:* §9.30a for N_rig(D); §§8.8,8.13,9.33–9.34; LocallyAnalyticDistributions §3.3 for the Amice transform on ℤ_pˣ; crystalline differential realizations and finite coefficient descent.

**Checks.**

- Rank one, p=5, D unramified crystalline of Hodge–Tate weight 0 with phi(d)=2d, so N_rig(D)=ℛd. Put A(T)=−1+Σ_(r≥0)2^r((1+T)^(5^r)−1) ∈ ℤ₅[[T]], convergent on every closed subdisc, and z=A·d. Then (1−phi)z=(1+T)d and psi z=z, so 𝔐_z=δ₁⊗d is the constant d on weight space. The chart value is Lambda_(D,z)(theta)=2^(−n)d on the conductor-5^n stratum. The disjoint balls of conductors 5^n and 5^(n+1) on one component receive the constants 2^(−n)d and 2^(−n−1)d; by the identity theorem no rigid function on that connected component restricts to both. The same computation with phi(d)=alpha·d, −1<v_5(alpha)<0, gives alpha^(−n)d inside RJ's negative-slope hypothesis.
- For V=ℚ₅(1), phi(d₁)=5⁻¹d₁, so on the conductor-5^n stratum the chart value is 5^n times 𝔐_z there. For the f₆ class of §8.21, 𝔐_z is L_(ℚ₅(1))(κ(u)), with value −70/3·d₁ at χ²; omitting phi^(-n) would be off by 5^n on every conductor-5^n ball.
- A de Rham D that is not crystalline has D_cris(D) of smaller rank, so 𝔐_z is not defined; only the charts of §9.33 are asserted.
- For a zero vector, 𝔐_z=0 on weight space and Lambda_(D,z)=0 on U_D.

### 9.36 Split multiplicative Coleman augmentation

For an elliptic curve A/ℚ with split multiplicative reduction at odd p, the actual Col_infty:H^1_(infty,s)(Q_p,T_p A)->Lambda of §8.22, normalized by the Néron differential, is injective and its image is contained in the augmentation ideal ker(Lambda->Z_p). Containment in the augmentation ideal survives any rescaling of the differential, but the integral codomain Lambda requires the Néron differential up to a p-adic unit. This is containment, not image equality or an exceptional-zero derivative formula.

See Rubin2000 III Section5.8, Proposition5.14, final assertion, printed p.52.

*Needs:* §8.22; PadicMeasuresIwasawaAlgebras augmentation.

**Checks.**

- Nonsplit alpha=-1 does not force augmentation zero. A derivative or L-invariant theorem needs its own additional input.

- At split multiplicative α=1 and p=5, the trivial Euler multiplier is (1−1)/(1−1/5)=0.
- At nonsplit multiplicative α=−1,β=−5 the same multiplier is 2/(6/5)=5/3≠0; the augmentation containment is confined to the split case.

### Examples

For d=1 and evaluation at 0 and 5, simultaneous vanishing gives X(X−5)R. For d=2 with allowed lines E(1,0) at 0 and E(0,1) at 5, rows (X−5,0) and (0,X) form a basis. The determinant has one factor at each point. A shear with determinant 5 is invertible over ℚ₅ but not over ℤ₅, which distinguishes rational coordinate surjectivity from an integral image equality.

### Dependencies

Layers 1–2,8; PhiGammaModulesAndIwasawaCohomology §§1.0,3.1–3.2,3.4a,5.3,5.6a,6.2 for Robba realizations, Herr complexes, specialization and good Wach bases; PadicHodgeTheory §§4.2,4.5,5.2 for the differential realization, B-pairs and Berger's modification used by §9.30a; PadicMeasuresIwasawaAlgebras §§3.1–3.3,4.3–4.5 for evaluation and Weierstrass preparation; LocallyAnalyticDistributions §3.3 for analytic characters.

## Downstream consumers

HabiroNahmSeries (its local-K₃ supplier contract and §6.3) uses §§3.2–3.6, 4.7 and 5.4–5.9’s natural completed regulator isomorphism, tame-root generation and p² lattice without requiring global regulator injectivity. HabiroNumberFields §§3.0a–3.0b use the same completed root classes, normalized local regulator, lattice isomorphism, root presentations, naturality and transfer (§§4.7, 5.6–5.9, 6.3); they are owned here and imported there, not constructed a second time. Polylogarithms §2.3 is supplied with §4.7's Suslin–Bloch–Wigner evaluation, its scalar κ₂ (−2κ₂ in the Borel coordinate) and the computation of κ₂. The conversion of that evaluation to the Borel and Tate coordinates of its descended Bloch–Wigner regulator is Polylogarithms' own, as is the analytic cocycle of its §2.2. The de Jeu–Suslin comparison, the two complex evaluations and the computation of κ₂ belong to §4.7. GrossZagierAndArithmeticHeights uses §1.9’s abelian-variety logarithm comparison with §0.1’s twist and de Rham conventions. Signed Selmer applications use the specified Coleman maps, their rational images, finite integral indices where proved and closed kernels. Euler-system applications use character specialization and explicit reciprocity with their Gauss and Gamma factors. Curve and family computations use the normalized syntomic/de Rham comparison and must supply Frobenius-compatible specialization points. Semistable applications retain both continuous and discrete coordinates. The injectivity predicates above are explicit hypotheses for applications needing them.

## References

Page numbers refer to the linked versions: journal numbering for journal PDFs, preprint numbering otherwise. Formulas use the conventions above.

- **GSWZ2024**: Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier, [The Habiro ring of a number field](https://arxiv.org/abs/2412.04241v2). arXiv:2412.04241v2 (27 August 2025); no journal version.
- **BdJ2003**: Amnon Besser, Rob de Jeu, [The syntomic regulator for the K-theory of fields](https://arxiv.org/abs/math/0110334v2). arXiv:math/0110334v2 (15 December 2001); published Ann. Sci. École Norm. Sup. (4) 36 (2003), 867–924.
- **HK2011**: Annette Huber, Guido Kings, [A p-adic analogue of the Borel regulator and the Bloch–Kato exponential map](https://arxiv.org/abs/math/0612611v1). arXiv:math/0612611v1 (20 December 2006); published J. Inst. Math. Jussieu 10 (2011), 149–190.
- **Tamme2014**: Georg Tamme, [Karoubi's relative Chern character, the rigid syntomic regulator, and the Bloch–Kato exponential map](https://arxiv.org/abs/1111.4109v4). arXiv:1111.4109v4 (21 July 2014).
- **NN2016**: Jan Nekovář, Wiesława Nizioł (appendix by Laurent Berger), [Syntomic cohomology and p-adic regulators for varieties over p-adic fields](https://arxiv.org/abs/1309.7620v5). arXiv:1309.7620v5 (22 September 2016).
- **CN2017**: Pierre Colmez, Wiesława Nizioł, [Syntomic complexes and p-adic nearby cycles](https://arxiv.org/abs/1505.06471v4). arXiv:1505.06471v4 (29 May 2016); published Invent. Math. 208 (2017).
- **Berger2003**: Laurent Berger, [Bloch and Kato's exponential map: three explicit formulas](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/berger.dm.pdf). Documenta Mathematica, Extra Volume Kato (2003), 99–129; also arXiv:math/0209283v1. Roman theorem labels are retained; page locators below 99 refer to arXiv v1 and locators from 99 onward to the journal version.
- **CC99**: Frédéric Cherbonnier, Pierre Colmez, [Théorie d'Iwasawa des représentations p-adiques d'un corps local](https://webusers.imj-prg.fr/~pierre.colmez/CCjams.pdf). J. Amer. Math. Soc. 12 (1999), 241–268; author's recompiled PDF (28 pp.), page numbers of that PDF.
- **Limites2004**: Laurent Berger, [Limites de représentations cristallines](https://perso.ens-lyon.fr/laurent.berger/articles/article06.pdf). Compos. Math. 140 (2004) 1473–1498; author PDF.
- **LLZWach**: Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3). arXiv:0912.1263v3 (18 October 2010); published Asian J. Math. 14 (2010).
- **LZ2014**: David Loeffler, Sarah Livia Zerbes, [Iwasawa theory and p-adic L-functions over Z_p^2-extensions](https://arxiv.org/pdf/1108.5954v3). arXiv:1108.5954v3 (22 April 2014); accepted version of Int. J. Number Theory 10(8) (2014).
- **FO**: Jean-Marc Fontaine, Yi Ouyang, [Theory of p-adic Galois representations](http://staff.ustc.edu.cn/~yiouyang/galoisrep.pdf). Author-hosted 303-page version; printed pp.169–171, Theorems 7.26(3),7.28(4), Remark 7.29. The same work circulated as a 2006 draft with different numbering.
- **Rubin2000**: Karl Rubin, [Euler Systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Annals of Mathematics Studies 147 (2000); author PDF of 4 August 1999.
- **HK2**: Annette Huber, Guido Kings, [Bloch–Kato conjecture and main conjecture of Iwasawa theory for Dirichlet characters](https://arxiv.org/abs/math/0101071v2). arXiv:math/0101071v2; published Duke Math. J. 119 (2003).
- **BNQD2002**: Denis Benois, Thong Nguyen Quang Do, [Les nombres de Tamagawa locaux et la conjecture de Bloch et Kato pour les motifs Q(m) sur un corps abélien](https://www.numdam.org/item/ASENS_2002_4_35_5_641_0.pdf). Ann. Sci. École Norm. Sup. (4) 35 (2002), 641–672 (numdam).
- **FontaineBPR1994**: Jean-Marc Fontaine, [Appendice: Sur un théorème de Bloch et Kato (lettre à B. Perrin-Riou)](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0115/LOG_0015.pdf). Invent. Math. 115 (1994), 151–161; author PDF.
- **Benois2014**: Denis Benois, [p-adic heights and p-adic Hodge theory](https://arxiv.org/abs/1412.7305v1). arXiv:1412.7305v1.
- **AM18**: Masanori Asakura, Kazuaki Miyatani, [F-isocrystal and syntomic regulators via hypergeometric functions](https://arxiv.org/abs/1711.08854v2). arXiv:1711.08854v2 (8 April 2018).
- **AC20**: Masanori Asakura, Masataka Chida (Appendix B by François Brunault), [A numerical approach toward the p-adic Beilinson conjecture for elliptic curves over Q](https://arxiv.org/pdf/2003.08888v2). arXiv:2003.08888v2 (8 September 2020).
- **BdJ2012**: Amnon Besser, Rob de Jeu, [The syntomic regulator for K4 of curves](https://arxiv.org/pdf/1208.0516v1). arXiv:1208.0516v1 (2 August 2012).
- **Ara2003**: Amnon Besser, [p-adic Arakelov theory](https://arxiv.org/abs/math/0301029v1). arXiv:math/0301029v1; published J. Number Theory 111 (2005).
- **BZ2017**: Amnon Besser, Sarah Livia Zerbes, [Vologodsky integration on curves with semi-stable reduction](https://arxiv.org/abs/1711.06950v1). arXiv:1711.06950v1 (19 November 2017).
- **Besser2000**: Amnon Besser, [Syntomic regulators and p-adic integration I: rigid syntomic regulators](https://www.math.bgu.ac.il/~bessera/reg/reg.ps.gz). Public author PostScript; Israel J. Math. 120 (2000), 291–334.
- **BK1990**: Spencer Bloch and Kazuya Kato, [L-functions and Tamagawa numbers of motives](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf). Public seminar scan; Grothendieck Festschrift I (1990), 333–400.
- **EN2016**: Veronika Ertl and Wiesława Nizioł, [Syntomic cohomology and p-adic motivic cohomology](https://arxiv.org/pdf/1603.01705v2). arXiv:1603.01705v2; locators use this version.
- **AM2022**: Masanori Asakura and Kazuaki Miyatani, [Milnor K-theory, F-isocrystals and syntomic regulators](https://arxiv.org/pdf/2007.14255v2). arXiv:2007.14255v2; published JIMJ 23 (2024), 1357–1415.
- **Asakura2023**: Masanori Asakura, [New p-adic hypergeometric functions and syntomic regulators](https://numdam.org/item/10.5802/jtnb.1250.pdf). Journal de Théorie des Nombres de Bordeaux 35 (2023), 393–479; published PDF.
- **Besser2025**: Amnon Besser, [Regulators and derivatives of Vologodsky functions with respect to log(p)](https://arxiv.org/pdf/2502.16738v1). arXiv:2502.16738v1; all locators use this version.
- **BR2019**: Amnon Besser and Wayne Raskind, [Toric regulators](https://arxiv.org/pdf/1910.06877v1). arXiv:1910.06877v1; locators use this version.
- **LLZ2011**: Antonio Lei, David Loeffler, Sarah Livia Zerbes, [Coleman maps and the p-adic regulator](https://msp.org/ant/2011/5-8/ant-v5-n8-p06-s.pdf). Algebra & Number Theory 5(8) (2011), 1095–1131; version of record. The same work has preprint arXiv:1006.5163v2; its §5.3, Proposition 5.11 and Remark 5.12, p.25 correspond to journal §5C, pp.1128–1129.
- **WeibelChern**: Charles Weibel, [Étale Chern classes at the prime 2](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/chernclass.pdf), Proposition 5.1, p.24.
- **dJ1995**: Rob de Jeu, [Zagier's conjecture and wedge complexes in algebraic K-theory](https://www.numdam.org/item/CM_1995__96_2_197_0/). Compositio Math. 96 (1995), 197–247 (numdam); printed page numbers.
- **G1995**: A. B. Goncharov, [Geometry of configurations, polylogarithms, and motivic cohomology](https://sasha-goncharov.github.io/Advances1995.pdf). Adv. Math. 114 (1995), 197–318; author-hosted scan of the journal pages, printed page numbers.
- **RJ2018**: Joaquín Rodrigues Jacinto, [(phi,Gamma)-modules de de Rham et fonctions L p-adiques](https://msp.org/ant/2018/12-4/ant-v12-n4-p04-p.pdf). Algebra & Number Theory 12(4) (2018), 885–934; version of record.
- **Nakamura2014**: Kentaro Nakamura, [Iwasawa theory of de Rham (φ,Γ)-modules over the Robba ring](https://arxiv.org/abs/1201.6475v2). arXiv:1201.6475v2 (2 December 2012); published J. Inst. Math. Jussieu 13(1) (2014), 65–118. Locators use the arXiv version.
