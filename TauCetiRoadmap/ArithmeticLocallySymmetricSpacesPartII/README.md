# Roadmap: arithmetic locally symmetric spaces, part II — weight multiplicities

**Summary.** This roadmap proves fixed-level weight bounds for SL₂ over a number field F that has a complex place. It continues ArithmeticLocallySymmetricSpaces, which stops at the finite-level arithmetic quotients of a reductive group with their local systems, Borel–Serre boundaries, traces, duality and the cuspidal injection, and it draws on the completed homology of CompletedCohomologyPartII and on the rational Iwasawa algebra and completed enveloping algebra of NoncommutativeAndEquivariantIwasawa and LocallyAnalyticDistributionsPartII. On these it builds an error calculus: nonnegative multiaffine polynomials in the shifted weights with no full product term, which separate the skew rank of an Iwasawa module from its torsion and give a saving by the smallest weight throughout the weight orthant. It proves three headline theorems. Fu's local homology theorem: for p odd, G a product of m first-congruence subgroups of SL₂(ℤ_p) and M a finitely generated module of skew rank a over the rational Iwasawa algebra of G, the deviation of `dim H₀(G, M⊗W_k)` from `a·∏_i(k_i+1)` and every `dim H_i(G, M⊗W_k)`, i ≥ 1, are bounded by one such polynomial in k+1. Fu's sharp fixed-level bound `dim S_κ(K_f) ≤ C Δ(κ)/min_v κ_v` for cusp forms of weight κ on SL₂ over F, together with its form for ordinary group cohomology at every congruence subgroup and every coefficient tuple. And two-sided linear growth `c(n+1) ≤ dim H^i(Γ, E_n) ≤ C(n+1)`, i = 1, 2, for every congruence subgroup Γ of SL₂(O_F), F imaginary quadratic, with its cuspidal, interior and compact-support forms at neat level; its lower bound comes from the Finis–Grunewald–Tirao count of base-change classes.

The README is the roadmap. The companion `Suggested.lean` is its acceptance test: it states the two headline theorems that are statable with Mathlib's group cohomology at the pins, `finrank_groupCohomology_weightRep_le` (the ordinary-cohomology form of §4.2 at every congruence level) and `bianchi_groupCohomology_linear_growth` (the ordinary degree-one and degree-two case of §5.8 at every congruence level), with the two definitions they need, `embeddingStdRep` and `weightRep` (§3.1). Its docstring names the headlines that are not statable at the pins and the carrier each one lacks: the local theorem needs the skew rank of the rational Iwasawa algebra and rational completed Iwasawa homology; the cusp-form bound needs the adelic carrier S_κ(K_f); the cuspidal, interior and compact-support Bianchi bounds need the Borel–Serre support carriers.

| Layer | Title | Headline targets |
| --- | --- | --- |
| 0 | Weights and multiaffine errors | proper-face polynomials, the saving by the smallest coordinate, generic cyclic quotients of Û |
| 1 | Torsion multiplicities | the torsion-module weight bound |
| 2 | Ranks and all homological degrees | Fu's local homology theorem (§2.6) |
| 3 | Arithmetic realization and descent | `weightRep`, `embeddingStdRep`; the global bound for every coefficient tuple (§3.4) |
| 4 | Cuspidal dimensions in weight aspect | the sharp global bound (§4.2), `finrank_groupCohomology_weightRep_le` |
| 5 | Bianchi boundary and sharpness | two-sided Bianchi growth (§5.8), `bianchi_groupCohomology_linear_growth` |

## Scope and ownership

ArithmeticLocallySymmetricSpaces ends at finite-level quotients, local systems, Borel–Serre boundaries, support maps, level traces, finite duality and the cuspidal injection (§§ALS.0–ALS.5b). CompletedCohomologyPartII extends that foundation to towers; its Layers 3–6 supply completed homology, finite chain models, finiteness, the semisimple torsion theorem and rational completed-Tor descent. This Part II is their weight-aspect application.

**Owned here.**

- Nonnegative proper-face polynomials and the saving by the smallest coordinate (§§0.1–0.2), and Fu's growth estimate for cyclic quotients of the completed enveloping algebra Û of sl₂(ℤ_p)^m by generic elements (§0.3), which LocallyAnalyticDistributionsPartII leaves to its applications.
- The identification of Hom into a finite-dimensional representation with the dual of degree-zero completed homology, the cyclic and torsion multiplicity bounds (Layer 1), free approximations, the upper and lower rank estimates, dimension shifting, Fu's local homology theorem and finite multiplicity support at canonical dimension zero (Layer 2).
- The archimedean weight conventions and the coefficient system `weightRep` on subgroups of SL₂(O_F), the auxiliary split prime and neat refinement of a fixed level, the comparison of complex and p-adic coefficient realizations, and the global bound through completed-homology descent (Layer 3).
- The cusp-form spaces S_κ(K_f) with their sign-pattern multiplicities and their injection into the group cohomology of SL₂(F) ∩ K_f at every level, neat or not, the sharp global bound with its ordinary-cohomology form, and the parallel-weight and Bianchi upper bounds (Layer 4).
- The cohomology of a Bianchi cusp torus, the support bridge, the fixed-type multiplicity formula for cusp forms on Γ(N) together with its two group-theoretic inputs (the amalgam structure of SL₂(ℤ) and the low-degree cohomology sequence of an amalgam), the ramified finite types, the specialized SL₂ base-change count, positivity of its linear term, the lower bounds and the two-sided theorem (Layer 5).

**Left to other roadmaps and libraries.**

- NoncommutativeAndEquivariantIwasawa owns the Iwasawa algebras of compact p-adic Lie groups, built on Tau Ceti's completed group algebra: their integral and rational forms with their noetherianity, domain property, Auslander regularity and global dimension, diagonal twists, rational Iwasawa homology as Tor, and exact Ore localisation (§§F.1, 0.5, 0.8, 0.11, 0.12, 0.14, 0.15, 1.12). The skew rank of a module over a noetherian domain and the rational canonical-dimension criterion are stated below as contracts on its §F.1 and §0.12 (gap:skew-rank, gap:canonical-dimension-zero).
- LocallyAnalyticDistributionsPartII owns the first congruence subgroups of SL₂(ℤ_p) and their products (§0.2), the completed enveloping algebra Û (§2.1), the microlocalisation A → Û and its module form (§§3.4, 3.7), the Lie module of a finite-dimensional representation with a stable lattice (§3.9), the comparison of W-isotypic quotients (§3.10), central specialisations (§4.1), Fu's injectivity theorem (§4.14), and the algebraic Peter–Weyl theorem (§5.2): the external tensor family `W_k = ⊠_i Sym^{k_i}(ℚ_p²)` with its stable lattice, its continuous action of the rational Iwasawa algebra A, its dimension `∏_i(k_i+1)`, its absolute irreducibility and self-duality on every open subgroup of G, and `A/Ann_A(W_k) ≅ End_{ℚ_p}(W_k)`. Its Source corrections, items 1 and 3–6, record where Fu's §§4–5 must be corrected (the Banach completion of (16), the denominator set (17) over a ramified ring, the domain property of central reductions of Theorem 5.7 and the separatedness step of its proof, and the characterisation of induced parameters in Remark 5.8); this roadmap uses only the corrected statements through §4.14 there.
- Tau Ceti supplies symmetric powers with their monomial bases and matrix actions, the PBW basis and group-cohomology corestriction.
- AdelicAlgebraicGroups §4.2 supplies strong approximation for connected, absolutely almost simple, simply connected groups with noncompact archimedean points; applied to SL₂ over F it makes every congruence-level SL₂ quotient used here a single arithmetic quotient Γ\X.
- Chebotarev Layer 10 supplies split-completely primes.
- ModularForms §10C supplies classical section spaces and ordinary dimension formulas; ModularSymbolsPadicLFunctions §0.7 supplies Eichler–Shimura for every finite-index Γ, compatible with every normaliser action, which at Γ(N) is the SL₂(ℤ/Nℤ)-action. FreeGroupsAndLimitGroups §§4.5 and 4.8 supply the structure theorem for groups acting on trees and its identification with Mathlib's amalgamated product.
- GL2AutomorphicRepresentationsAndTransfer supplies quadratic transfer and type uniqueness (§§R17.4.2–R17.4.6 and §R16.2.9).
- AutomorphicFormsOnReductiveGroups supplies relative Lie cochains, unitary induction, the discrete series of SL₂(ℝ), the archimedean cohomological computations and the Vogan–Zuckerman exhaustion of the unitary representations with cohomology (§1.1, §§2.3–2.4, §§5.2–5.4).
- BianchiModularForms owns the GL₂ Bianchi cohomology spaces and their weight-two Eisenstein count (§§1.2–1.3); its count of the degree-one boundary image is used here only as a Check (§5.2).

**Variants kept here.** GL2AutomorphicRepresentationsAndTransfer §R16.6.3 constructs the Hilbert weight representation of `Res_{F/ℚ}GL₂` for totally real F, indexed by real embeddings and twisted by determinant powers; `weightRep` (§3.1) differs in being indexed by all complex embeddings of an arbitrary number field, so that a complex place contributes a conjugate pair of factors, and in being restricted to subgroups of SL₂(O_F), where no determinant twist occurs. BianchiModularForms §1.3 defines, for an imaginary quadratic field, the coefficient modules `E_k = Sym^{k−2}(ℂ²) ⊗ conj Sym^{k−2}(ℂ²)` of GL₂ indexed by k ≥ 2: its E_k is the `E_{k−2}` of this roadmap, so that κ = 2k−2, and its H¹_cusp (BianchiModularForms §1.2) is the kernel of restriction to the cusp stabilizers, which at neat level is H¹_! and contains the automorphic cuspidal cohomology used here; `weightRep` differs in covering every number field and every embedding tuple, on subgroups of SL₂(O_F). The Eichler–Shimura–Harder comparison of BianchiModularForms §§3.2 and 3.4 is for the GL₂ component groups Γ₀(𝔫,𝔞), whose determinants range over the units of O_F; the injection of §4.1 differs in being for SL₂ over every number field at every compact open level, so that at the level SL₂(Ô_F) its group is SL₂(O_F).

## Conventions

Fix a number field F of signature (r₁,r₂) and degree d = r₁+2r₂. The global saving assumes r₂ > 0. Each archimedean weight κ_v is an even integer at least 2, and `Δ(κ) = ∏_{v real} κ_v · ∏_{v complex} κ_v²`. For every fixed compact open K_f the upper bound is `dim S_κ(K_f) ≤ C_{F,K_f} Δ(κ)/min_v κ_v`; the minimum is over the r₁+r₂ archimedean places. A congruence subgroup of SL₂(O_F) is a subgroup containing the principal congruence kernel ker(SL₂(O_F) → SL₂(O_F/𝔞)) of a nonzero ideal 𝔞; it has finite index. For such Γ the compact open subgroup K = Γ·ker(SL₂(Ô_F) → SL₂(O_F/𝔞)) satisfies Γ = SL₂(F) ∩ K; strong approximation for SL₂ over F makes SL₂(F)\SL₂(𝔸_F^∞)/K a single point, so the parent's quotient X_K is the one arithmetic quotient Γ\X, and its Betti cohomology with a coefficient system V, in the parent's sense (orbifold cohomology at non-neat level), is the group cohomology H^i(Γ,V). Ordinary-cohomology upper bounds hold at every congruence subgroup and every number field with r₂ > 0; ordinary-cohomology lower bounds hold at every congruence subgroup for F imaginary quadratic; the cuspidal, interior and compact-support forms of the two-sided theorem use neat levels.

Locally p is odd, m ≥ 1, `G = ∏_{i=1}^m ker(SL₂(ℤ_p) → SL₂(𝔽_p))` (LocallyAnalyticDistributionsPartII §0.2), Λ = ℤ_p[[G]] and `A = ℚ_p ⊗_{ℤ_p} Λ`, the bounded-denominator rational algebra: a series whose coefficient denominators are unbounded is not an element of A. Modules are left modules and `rank_A M = dim_{Q(A)}(Q(A) ⊗_A M)`, with the compatible left Ore localisation of gap:skew-rank. Homology is rational completed Iwasawa homology with stable integral lattices (NoncommutativeAndEquivariantIwasawa §0.15), not ordinary discrete group-ring homology. For a finite index set I, write `D(x) = ∏_{i∈I} x_i` with Mathlib's finite product, including D = 1 for I empty. Local coefficient weights are k ∈ ℕ^m, and `W_k = ⊠_i Sym^{k_i}(ℚ_p²)` is the A-module of LocallyAnalyticDistributionsPartII §5.2 (i), the Lie module of §3.9 there, with stable lattice `W_k⁰ = ⊠_i Sym^{k_i}(ℤ_p²)` and dimension D(k+1).

The completed enveloping algebra is LocallyAnalyticDistributionsPartII §2.1's `Û = ℚ_p ⊗_{ℤ_p} lim_n U(sl₂(ℤ_p)^m)/p^n`. Its central reductions use [e,f] = h, [h,e] = 2e, [h,f] = −2f and the Casimirs Δ_i = ½h_i² − h_i + 2e_if_i, whose eigenvalue on `Sym^{k_i}` is ½k_i(k_i+2). Finite ramified coefficient extensions are taken from this ℤ_p construction by scalar extension (LocallyAnalyticDistributionsPartII §3.6); the denominator set of fu24 (17) is never formed over a ramified ring of integers.

In completed-cohomology torsion and descent, apply CompletedCohomologyPartII §5.7 with base field ℚ, group `Res_{F/ℚ}SL₂` and prime ideal (p). At a completely split p the chosen K₀ is the full product `∏_{v|p} G_v`, of analytic dimension 3d.

H_c denotes compact support, H_! the image of H_c → H, and H_cusp the parent's cuspidal carrier at neat level (ArithmeticLocallySymmetricSpaces §ALS.5b.5). At non-neat Bianchi levels ordinary H^i means group cohomology, and the base-change subspace is the image of the actual cuspidal automorphic classes. Dual coefficients are retained until the rational self-duality of W_k or E_n is used. For Bianchi coefficients fix F → ℂ and E_n = Sym^n(ℂ²) ⊗ conjugate Sym^n(ℂ²), with Γ acting through that embedding and its complex conjugate; here κ = 2(n+1). Marshall's subscript c denotes an interior subspace, not compact support. Constants are independent of weights; all coefficient spaces and finite index sets lie in a fixed universe, and dimensions are over the displayed field.

**Checks.**

- For signature (0,1) and κ = 6, k = (2,2), dim E₂ = 9 and Δ/min κ = 36/6 = 6. At signature (1,1), κ = (4,6) gives dim V = 27 and Δ = 144.
- On a highest-weight vector with h-value k, ef has value k, so Δ has value ½k² − k + 2k = ½k(k+2); at k = 0, 1 these are 0 and 3/2.
- For k = (1,2), dim W_k = 2·3 = 6, not 2+3; at k = 0, W_k is the one-dimensional trivial module, not zero.
- The left dual action is (gφ)(w) = φ(g⁻¹w); for g = diag(a,a⁻¹) on ℚ_p², evaluation on the first basis vector acquires a⁻¹. The free diagonal twist sends g⊗w to g⊗g⁻¹w.
- For F imaginary quadratic, K₀ has dimension 6 = 3·2; a single local prime would give 3 and the wrong homological cutoff.
- For F = ℚ(√−5), whose class number is 2, the GL₂ quotient at level GL₂(Ô_F) has two components, indexed through the determinant by the class group, while the SL₂ quotient at SL₂(Ô_F) is the single quotient SL₂(O_F)\ℍ³: the one-component statement uses strong approximation for the simply connected group SL₂ and fails for GL₂.
- At p = 3 take g = (1 3;0 1) and h = (1 0;3 1) in one congruence factor: gh = (10 3;3 1) and hg = (1 3;3 10). The inverse-action untwisting sends g⊗(0,1) to g⊗(−3,1), excluding the same-action formula.

## Exact supplier contracts

### From Mathlib

Declarations are consumed at the Mathlib pinned by the content repository's manifest. Consume `Finset.prod`, `Fintype.prod_equiv`, `Fintype.prod_empty` and `Finset.prod_const_one` in Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean; `Finset.prod_update_of_mem` in Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean; and `Finset.prod_pos` in Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean. The product requires a commutative monoid and supplies neither representations nor a degree-drop theorem.

Use `Finset.powerset` in Mathlib/Data/Finset/Powerset.lean, whose membership means inclusion, and `MvPolynomial` in Mathlib/Algebra/MvPolynomial/Basic.lean, the finitely supported monoid-algebra carrier over a commutative semiring. Use `Module.finrank_tensorProduct` and `Module.finrank_baseChange` in Mathlib/LinearAlgebra/Dimension/Constructions.lean with their free-module and scalar-tower hypotheses, specialized to finite-dimensional vector spaces, and `Basis.piTensorProduct` in Mathlib/LinearAlgebra/PiTensorProduct/Basis.lean, the product basis of a finite tensor product. For the ordinary Bianchi headlines use `groupCohomology` in Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean: it takes an actual `Rep` and returns the homology of the inhomogeneous cochain complex, with no topology or support condition and no automatic finite-dimensionality assertion. The headline coefficient systems use `Matrix.SpecialLinearGroup.map` in Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean, the entrywise image of a ring homomorphism; `Matrix.SpecialLinearGroup.toGL` in Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean; and `Rep.of` in Mathlib/RepresentationTheory/Rep/Basic.lean. The field hypotheses use `NumberField.IsTotallyReal` and `NumberField.IsTotallyComplex` in Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean, defined by the type of every infinite place; a number field is not totally real exactly when r₂ > 0, and an imaginary quadratic field is a totally complex field of degree two over ℚ. For the amalgam inputs of §5.3 use `Monoid.PushoutI` in Mathlib/GroupTheory/PushoutI.lean, the pushout of a family of group homomorphisms out of a common group, with its universal property `Monoid.PushoutI.lift`; it asserts nothing about SL₂(ℤ). Use `ModularGroup.exists_smul_mem_fd` and `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo` in Mathlib/NumberTheory/Modular.lean: every point of the upper half-plane has an SL₂(ℤ)-translate in the closed standard fundamental domain, and two points of its interior in one orbit are equal. Use `groupCohomology.coindIso` in Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean, Shapiro's isomorphism `H^n(G, Coind_S^G A) ≅ H^n(S, A)` for a subgroup S of G.

For skew ranks use Mathlib's Ore localisation. `OreLocalization.OreSet` in Mathlib/GroupTheory/OreLocalization/OreSet.lean is the left Ore condition (for r and s ∈ S there are r′ and s′ ∈ S with s′r = r′s), and `OreLocalization` in Mathlib/GroupTheory/OreLocalization/Basic.lean forms left fractions s⁻¹r of a ring and s⁻¹x of a left module X. In Mathlib/RingTheory/OreLocalization/Ring.lean, the Ore localisation of a nontrivial ring without zero divisors at its non-zero-divisors R⁰, once R⁰ is known to be an Ore set, carries a division-ring instance, and the localisation of X is a left module over the localised ring. `IsNoetherianRing.strongRankCondition` in Mathlib/LinearAlgebra/InvariantBasisNumber.lean gives the strong rank condition for a nontrivial left noetherian ring, and `nonempty_oreSet_of_strongRankCondition` in Mathlib/LinearAlgebra/Dimension/Localization.lean makes R⁰ a left Ore set in a domain with that condition. Together they give the classical left division ring of a left noetherian domain. Mathlib supplies neither exactness of Ore localisation of modules nor a rank invariant of modules over it.

### From Tau Ceti

Declarations are consumed at the Tau Ceti pinned by the content repository's manifest. Use `TauCeti.symPowerRep` in TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean, the symmetric power of the standard GL(Fin n) representation over a commutative ring. Use `SymmetricPower.finrank_eq` in TauCeti/LinearAlgebra/SymmetricPower/Basis.lean, with finite freeness and the strong rank condition; in dimension two it gives n+1. Neither declaration asserts irreducibility on an arbitrary subgroup. Use `Module.Basis.symmetricPower` in the same file, the basis of the n-th symmetric power of a free module indexed by multisets of size n of basis indices; for K² it is the monomial basis `x^(n−j) y^j`, 0 ≤ j ≤ n. Use `Representation.piTensorProduct` in TauCeti/RepresentationTheory/Tensor/Pi/Basic.lean, the representation of a monoid on the tensor product of a family of representations in which every element acts in each factor, and `Representation.piTensorProduct_apply_tprod` in the same file, its value on a pure tensor. Use `TauCeti.groupCohomology.corestriction` and `TauCeti.groupCohomology.map_subtype_id_comp_corestriction` in TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean: for a finite-index subgroup S of a group G and a representation over a commutative ring, corestriction after restriction is [G:S] times the identity in every degree; over ℂ this makes restriction injective. The ordinary enveloping-algebra interface includes `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration` in TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean and `Module.Basis.pbwBasis` in TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean; the latter uses a linearly ordered Lie-algebra basis over a commutative ring and fixes the increasing order of factors.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

Consume §ALS.0.7 for the decomposition of X_K into the finitely many arithmetic quotients Γ_i\X with Γ_i = G(F) ∩ g_iKg_i⁻¹, one for each double coset; §ALS.0.9 for neat manifolds and their K(Γ,1) components; §ALS.0.11 for the neatness criterion: a product level whose factors at two finite places of distinct residue characteristics q ≠ q′ are pro-q and pro-q′ is neat, applied in §3.2 to the pro-p first-congruence factors at p together with pro-q principal congruence factors at the places above an auxiliary rational prime q ≠ p, and in §5.7 to a principal congruence level divisible by two prime ideals of distinct residue characteristics; §ALS.1.1 for arithmetic local systems; §ALS.1.5 for the identification, at every level, neat or not, of Betti cohomology of X_K with the group cohomology of the Γ_i; §§ALS.1.6–ALS.1.8 for finite complexes, coefficient change, level pullback and translation; §§ALS.2.5 and ALS.2.8 for the boundary stratification and nilmanifold fibrations; §ALS.3.6 for trace, with `π_* π^* = [K:K′]` and, for K′ normal in K, `π^* π_* = Σ_{k∈K/K′} r_k^*`; §ALS.4.1 for the support triangle; §§ALS.4.5–ALS.4.7 for Kostant and boundary Hochschild–Serre; §ALS.5a.2 for duality with dual coefficients and orientation; §ALS.5b.1 for the compatibility of the de Rham comparison with level maps and translations; and §§ALS.5b.4–ALS.5b.5 for automorphic comparison and the injective cuspidal map with image in H_!. The neatness and coefficient hypotheses of each section remain in force.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §4.2's *strong-approximation-sufficiency*: a connected, absolutely almost simple, simply connected group G over a number field F whose archimedean points G(F_∞) are noncompact has strong approximation with respect to the archimedean places; by the strong-approximation bullet of the same section, G(F)\G(𝔸_F^∞)/U is then a single point for every compact open U. It is applied to SL₂ over F, which is absolutely almost simple and simply connected with noncompact archimedean points `SL₂(ℝ)^{r₁} × SL₂(ℂ)^{r₂}` for every number field, never to `Res_{F/ℚ}SL₂` over ℚ, which is not absolutely almost simple when F ≠ ℚ; the two adelic double-coset spaces are the same set. For F = ℚ(i) and U = SL₂(Ẑ[i]) there is one double coset and Γ = SL₂(ℤ[i]). The noncompactness hypothesis holds here for every F; the section's own negative control, a definite quaternion norm-one group, is not used.

### From TauCetiRoadmap.CompletedCohomologyPartII

Consume §3.1 for continuous duals and inverse-action conventions, §4.2 for the completed chain model, §5.1 for finite generation and canonical topology, §5.5 for the rank over the Ore division ring of O[[U]], U torsion-free uniform, in which §5.7 is stated, §5.7 for rank-zero completed homology in the absence of discrete series, and §6.3 for completed homological descent. Section 5.7 is applied over ℚ to `Res_{F/ℚ}SL₂` as specified in the Conventions. The local bound is applied to the constant-coefficient completed modules with one diagonal W_t twist, and the spectral sequence is used only through its finite filtration.

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

Consume §F.1 for integral noetherianity and the canonical finite-module topology, §§0.5 and 0.8 for the domain property in the uniform case (the lift of the domain property from the associated graded ring, applied to the weighted graded ring of the ordered Iwasawa series), §0.11 for the integral global dimension 3m+1 and the integral canonical dimension, §0.12 for rational Auslander regularity and rational global dimension 3m, §0.14 for diagonal twists (the diagonal twist of a free module is free), §0.15 for the rational-homology-as-Tor comparison, the free-twist homology and the vanishing above dim G, and §1.12 for exact Ore scalar extension once an Ore set has been supplied. Inverting p gives the rational finite-module topology; maps to finite-dimensional continuous modules are continuous on integral lattices and then after rationalization. The canonical dimension of §0.11 is defined only over the integral and residual algebras O[[G]] and k[[G]]; the criterion below needs its rational form, normalised by the rational global dimension of §0.12. The two contracts that follow state what this roadmap requires of §F.1 and of §0.12 beyond what those sections state.

What NoncommutativeAndEquivariantIwasawa must provide (gap:skew-rank): For a left noetherian domain R, with Mathlib's left Ore set R⁰, classical division ring Q(R) = R[R⁰⁻¹] and localised modules M[R⁰⁻¹] (From Mathlib), define the skew rank `rank_R M = dim_{Q(R)} M[R⁰⁻¹]` of a finitely generated left R-module M and prove that it is finite, additive on short exact sequences (by the exactness of §1.12), zero exactly when every element of M is killed by a nonzero element of R, and equal to a on R^a. Supplier section: §F.1. (fu24, §6, pp. 21–23, (33)–(34); NoncommutativeAndEquivariantIwasawa §1.12 for exact Ore scalar extension.)

**Checks.**

- For R a division ring, Q(R) = R and rank(R^a) = a, including a = 0.
- For R = ℚ_p[X,Y], the ideal (X,Y) has rank 1, its two-generator presentation has kernel rank 1, and R/(X,Y) has rank 0.
- For R = M₂(ℚ_p), nonzero matrices can multiply to zero (E₁₁E₂₂ = 0); the domain hypothesis excludes a ring with no classical division ring.

What NoncommutativeAndEquivariantIwasawa must provide (gap:canonical-dimension-zero): For p odd, m ≥ 1, `G = ∏_{i=1}^m ker(SL₂(ℤ_p) → SL₂(𝔽_p))`, of dimension 3m, and `A = ℚ_p ⊗_{ℤ_p} ℤ_p[[G]]`, Auslander regular of global dimension 3m by §0.12, define the grade j_A(M) of a nonzero finitely generated left A-module M as the least i with `Ext^i_A(M,A) ≠ 0` and its canonical dimension as 3m − j_A(M), and prove that the canonical dimension of M is 0 if and only if M is finite-dimensional over ℚ_p. Supplier section: §0.12. (aw13, §2.5, Definition, p. 9, for grade and canonical dimension; Lemma 10.13, p. 77, for the equivalence.)

**Checks.**

- For M = W_k, j_A(W_k) = 3m, so the canonical dimension is 0, and `dim_{ℚ_p} W_k = D(k+1)`, not necessarily 1.
- For M = A, Hom_A(A,A) = A ≠ 0 gives j_A(A) = 0 and canonical dimension 3m > 0, and A is infinite-dimensional; rank_A A = 1 is a different invariant.
- For M = A/Aδ with δ a nonzero non-unit, right multiplication by δ gives the resolution 0 → A → A → M → 0; as A is a domain Hom_A(M,A) = 0, and Ext¹_A(M,A) = A/δA ≠ 0, so j_A(M) = 1, the canonical dimension is 3m−1 ≥ 2 and M is infinite-dimensional.
- For the lattice W_k⁰ over ℤ_p[[G]], of global dimension 3m+1 (§0.11), the grade is that of the finite module W_k⁰/p over 𝔽_p[[G]] (§F.1), namely 3m, so the integral canonical dimension of §0.11 is (3m+1) − 3m = 1, while the rational value for W_k is 3m − 3m = 0: the criterion is the rational normalisation, and the integral one never returns 0 for a nonzero lattice.
- The zero module has all multiplicities zero and is excluded from the nonzero canonical-dimension equivalence.

### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII

Consume, for odd p: §0.2 for the first congruence subgroup G₁ of SL₂(ℤ_p) and the product G = G₁^m with its Iwasawa algebra; §2.1 for the completed enveloping algebra Û(h)_K of a free Lie lattice, with the convergent PBW description of its elements and the extension of Lie maps into p-adically complete algebras, applied to h = sl₂(ℤ_p)^m and K = ℚ_p; §3.4 for the microlocalisation A → Û into the rational completed enveloping algebra of sl₂(ℤ_p)^m, flat on both sides; §3.6 for coefficient extension to a ramified field by base change from ℚ_p; §3.7 for M̂ = Û ⊗_A M, exact in the finitely generated A-module M; §3.9 for the Lie module of a finite-dimensional representation with a stable lattice, in which the action of U(sl₂(ℤ_p)^m) on the lattice extends to Û by p-adic completeness and is pulled back to A; §3.10, applied to W = W_k, for the natural isomorphism M/Ann_A(W_k)M → M̂/Ann_Û(W_k)M̂ for every finitely generated A-module M; §4.1 for the central specialisations Û_λ = Û/Û(Δ_i−λ_i)_i, with the Casimirs Δ_i = ½h_i² − h_i + 2e_if_i of the Conventions; §4.14 for injectivity of A → Û_λ at every λ ∈ ℤ_p^m, including parameters that are not induced; and §5.2 (i) and (iii) for W_k with its stable lattice W_k⁰, its continuous A-action and its dimension D(k+1), for the absolute irreducibility and self-duality of W_k on every open subgroup of G, the identification of its differentiated action with the algebraic sl₂^m-action, and `A/Ann_A(W_k) ≃ End_{ℚ_p}(W_k)`, of dimension D(k+1)². The quotient A/Ann_A(W_k) is rational: no equality with all endomorphisms of the integral lattice W_k⁰ is asserted. Its hypotheses (G uniform, congruence depth zero, W_k absolutely irreducible with the stable lattice W_k⁰) hold for the G and W_k of the Conventions.

**Checks.**

- For g = 1+pe in one factor, log g = pe and the image of g in Û is exp(pe) = Σ_n (pe)^n/n!, which is not 1+pe because e² ≠ 0 in Û; on Sym¹, where e acts with square zero, g acts by the matrix 1+pe.
- For M = A, Û ⊗_A M = Û; for M = 0 it is zero. For M = A and k = (1,2) both isotypic quotients are End(W_k), of dimension 6² = 36 by §5.2 (iii); for M = W_k both have dimension D(k+1); for M = A/Aδ the comparison identifies the two Hom multiplicities into W_k, and δ = 1 gives zero on both sides.
- For p = 3 and λ = 1 the equation ½μ(μ+2) = λ has the roots μ = −1 ± √3, so 1+2λ = 3, not a square in ℚ₃, makes λ integral but not induced; §4.14 still applies. For k = 0 and k = 1 the Casimir values on Sym^k are 0 and 3/2, while ½h² − h + 2fe, with the factors reversed and no compensating term, gives ½ − 1 = −½ on the highest-weight vector of Sym¹.
- At p = 3, m = 1, k = 1, the elements 1+3e and 1+3f of G act by I+3e and I+3f; subtracting the identity and dividing by 3 gives e and f, and ef and fe are the two diagonal matrix units, so the span of the image of G is all of M₂(ℚ₃), of dimension 4 = 2², as §5.2 (iii) requires. The diagonal torus, on which the standard representation is reducible, spans only the two-dimensional diagonal algebra.
- At p = 3 and k = 3, rational self-duality holds, while the integral dual of Sym³(ℤ₃²) is a divided-power lattice; integral self-duality is not asserted.

### From TauCetiRoadmap.Chebotarev

Consume Layer 10's identity Frobenius class in a finite normal extension: positive split-completely density supplies primes outside any finite exceptional set.

### From TauCetiRoadmap.ModularForms

Consume §10C's classical congruence-level section spaces, the weight-k automorphy line bundle on X(Γ) and analytic Riemann–Roch. The fixed-type multiplicity formula is §5.3 here.

### From TauCetiRoadmap.ModularSymbolsPadicLFunctions

Consume §0.7's Eichler–Shimura isomorphism `S_{k+2}(Γ) ⊕ S̄_{k+2}(Γ) ≃ H¹_par(Γ, V_k(ℂ))` for finite-index Γ, compatible with every double-coset and normaliser action defined for Γ, with the period identity `ψ_{f|δ}(D) = ψ_f(δD)|δ`. Every γ ∈ SL₂(ℤ) normalises Γ(N) and Γ(N) acts trivially, so this is the SL₂(ℤ/Nℤ)-equivariant comparison used in §5.3.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

Consume §§R17.4.2–R17.4.6 for quadratic base change, all-place compatibility, descent, cuspidality and quadratic-twist fibres, and §R16.2.9 for uniqueness of the supercuspidal type. The finite SL₂ count and the finite type dimensions and S₃/S₄ traces are targets of §§5.4–5.5 here.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §1.1 for relative Lie cochains; §2.3 for normalized unitary induction from a parabolic subgroup of a real reductive group, applied to the Borel subgroup of SL₂(ℂ) and the character `z ↦ (z/|z|)^{κ_v}` of its diagonal torus ℂ^×, trivial on the positive reals, to construct `π_{κ_v,0}`, and for the circle convention that fixes the labels D⁺ and D⁻; §2.4 for temperedness and the discrete series, which for SL₂(ℝ) are the `D_k^±` with k ≥ 2; §5.2 for cohomology with specified coefficients and the real discrete-series degree-one contribution; §5.3 for the tempered range, which for `Res_{F/ℚ}PGL₂`, with the same Lie algebra as `Res_{F/ℚ}SL₂`, gives ℓ₀ = r₂ and q₀ = r₁+r₂; and §5.4 for the Vogan–Zuckerman modules, which exhaust the irreducible unitary representations with nonzero cohomology against a finite-dimensional algebraic coefficient. The SL₂ product calculation with Fu's weight convention is §4.1 here.

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

Consume §4.8, the structure theorem: a group acting on a tree without inversions is the fundamental group of the graph of groups of stabilizers on the quotient graph; and §4.5, which identifies the fundamental group of a segment of groups with Mathlib's `Monoid.PushoutI`. They are applied in §5.3 to the action of SL₂(ℤ) on the tree of translates of one arc in the upper half-plane, whose quotient is one edge.

## How to read the build

Layer 0 fixes the error class: proper-face polynomials, the saving they give at the smallest coordinate, and the growth bound for cyclic quotients of the completed enveloping algebra by generic elements. Layer 1 bounds torsion multiplicities through cyclic quotients, carried to the completed enveloping algebra by microlocalisation. Layer 2 separates the upper and lower rank estimates, cancels their full-product terms in degree one, shifts the finitely many higher syzygies and proves Fu's local homology theorem. Layer 3 fixes the archimedean weights and the coefficient system on arithmetic subgroups, chooses one auxiliary split prime for a fixed level, matches the complex and p-adic coefficient realizations, and bounds Betti numbers for every coefficient tuple through the completed-homology descent filtration, without requiring degeneration. Layer 4 defines the cusp-form spaces, obtains the smallest-weight saving and its parallel and Bianchi consequences. Layer 5 computes the Bianchi boundary error, proves the finite-type and base-change counts, and combines upper and lower estimates in the four support conventions. Layers 0–2 are local and use no arithmetic; §§5.1–5.6 use no completed cohomology.

```text
§0.1 ─> §0.2 ────────────────────────────────────────────────┐
§0.1 ─> §0.3 ─> §1.2 ─┐                                       │
§1.1 ─────────────────┼─> §1.4 ─> §2.2 ─> §2.3 ─> §2.4 ─┐     │
gap:skew-rank ─> §1.3 ┘   §2.1 ─────────────────────────┼─> §2.5 ─> §2.6 ─┐
gap:canonical-dimension-zero ─> §2.7                     │                 │
§3.1 ─> §3.2 ─> §3.3 ─────────────────────────────────────┴───────> §3.4 <─┘
§3.4, §4.1, §0.2 ─> §4.2 ─> §4.3 ─> §4.4 ──────────────────────┐
§5.1 ─> §5.2;   §5.4 ─> §5.5 ─> §5.6 <─ §5.3                    │
§5.6 ─> §5.7;   §4.4, §5.7, §5.2 ─> §5.8 <──────────────────────┘
```

## Layer 0: Weights and multiaffine errors

### 0.1 Nonnegative proper-face polynomials

For a finite index set I with m = |I| ≥ 1 and coefficients c_s ≥ 0 indexed by proper subsets s ⊊ I, define `B_c(x) = Σ_{s⊊I} c_s ∏_{i∈s} x_i`. Coefficients for the full subset are excluded, so B_c is multiaffine and has total degree at most m−1. An error function e(k) is controlled by c when |e(k)| ≤ B_c(k+1) for every k ∈ ℕ^I; nonnegative dimension functions may omit the absolute value. Coefficients and inequalities live in ℝ; finite sums and positive rescalings preserve this class. (fu24, Theorem 1.4, p. 3; Theorem 3.2, pp. 8–11; §6, pp. 21–23.)

A proof uses the following route. Express the function as a finite sum over the powerset with the full set omitted. Expand x_i = k_i+1 to compare with a multiaffine polynomial in the unshifted k. Taking absolute values of coefficients gives a nonnegative majorant whenever the source supplies a possibly signed polynomial. For a finite collection, add coefficient vectors; this produces one common bound independent of the weight and homological index.

The API includes the following facts.

- B_c(x) is evaluated by its proper-subset sum.
- `B_{c+d} = B_c + B_d`, and `B_{ac} = a·B_c` for a ≥ 0.
- Transporting the coefficients and x through a bijection of index sets preserves B.
- B_c(x) ≥ 0 when every c_s ≥ 0 and every x_i ≥ 0.
- A single coefficient at s gives exactly `c_s ∏_{i∈s} x_i`; the full subset contributes zero.
- The corresponding MvPolynomial has total degree at most m−1 and degree at most one in each variable.

*Needs:* Mathlib `Finset.prod`; Mathlib `Finset.powerset`; Mathlib `MvPolynomial`.

**Checks.**

- When m = 1, B_c is constant; an error proportional to k+1 is rejected.
- For m = 3, coefficients `c_{∅} = 2` and `c_{{0,2}} = 3` give B(2,5,4) = 2 + 3·2·4 = 26.
- For m = 2, x₀x₁ cannot be bounded on all x_i ≥ 1 by any fixed proper-face polynomial: on (t,t) it is t², while every B_c is at most (Σc_s)t there.
- For m = 2 and `c_{{1}} = 7`, B(1,t) = 7t: keeping one coordinate minimal does not make the error bounded.
- For x = (2,4), D(x) = 8, whereas the sum of the factors is 6.
- For I empty, D(x) = 1, not 0.
- For k = (0,0), D(k+1) = 1; using ∏k_i would incorrectly return 0.
- The full monomial ∏x_i is absent, including after addition; constant errors are admitted for every m ≥ 1.

### 0.2 A missing coordinate gives the saving

Let m ≥ 1, x_i ≥ 1 for every i, and c_s ≥ 0 for proper s ⊊ I. For every a with 1 ≤ a ≤ x_i for every i, B_c(x) ≤ (Σ_s c_s)D(x)/a; in particular for a = min_i x_i. On the diagonal x_i = t ≥ 1, B_c(x) ≤ (Σ_s c_s)t^(m−1). The constants depend on c and m, never on x. (fu24, Theorem 1.2, pp. 2–3; §7, pp. 23–24.)

A proof uses the following route. For each proper s choose j ∉ s. The product of the omitted coordinates is at least x_j ≥ a, since all other omitted factors are at least one; hence `∏_{i∈s} x_i ≤ D(x)/a`. Multiply by c_s and sum. For parallel x, each monomial has degree |s| ≤ m−1.

*Needs:* Mathlib `Finset.prod`; §0.1.

**Checks.**

- For m = 1 the diagonal exponent is zero.
- For x = (1,t), the bound allows size t; it does not claim a saving in a coordinate that stays fixed.
- For B = 2 + 3x₀ + 5x₁ at x = (2,4) and a = 2, B = 28 ≤ 10·8/2 = 40.

### 0.3 Generic cyclic quotients of the completed enveloping algebra

Let p be odd, m ≥ 1 and Û the rational completed enveloping algebra of sl₂(ℤ_p)^m (LocallyAnalyticDistributionsPartII §2.1), and for λ ∈ ℤ_p^m let Û_λ = Û/Û(Δ_i−λ_i)_i be its integral central specialisation (LocallyAnalyticDistributionsPartII §4.1). Call δ ∈ Û generic if its image in Û_λ is nonzero for every λ ∈ ℤ_p^m. Û acts on W_k through the differentiated action, which preserves the lattice W_k⁰ and so extends from U(sl₂(ℤ_p)^m) by p-adic completeness (LocallyAnalyticDistributionsPartII §3.9). Prove that for every generic δ there is α ∈ ℕ^m with every α_i ≥ 1 such that `dim_{ℚ_p} Hom_Û(Û/Ûδ, W_k) ≤ 2 Σ_i α_i ∏_{j≠i}(k_j+1)` for every k ∈ ℕ^m. The right side is B_c(k+1) for the proper-face coefficients `c_(I∖{i}) = 2α_i` of §0.1, so the bound has total degree at most m−1. Fu's argument treats only weights with every k_i ≥ α_i; the weights with some k_i < α_i form infinite coordinate strips, and the common bound covers them as well. (fu24, §3: the definition of generic elements and Lemma 3.1, p. 8; Theorem 3.2, p. 8, with its proof, p. 11; Lemma 3.3, p. 9; Proposition 3.4 and Remark 3.5, pp. 10–11.)

A proof uses the following route. By compactness of ℤ_p^m and upper semicontinuity, a generic δ, scaled into the integral completion, stays nonzero in every integral central specialisation modulo one fixed power `p^(n_δ)` (fu24, Lemma 3.1). Modulo `p^(n_δ)` the completed and the ordinary enveloping algebra agree, so δ lies in a fixed PBW multi-filtration step F_α; use the PBW basis (Tau Ceti `Module.Basis.pbwBasis`) and the basis `e^a f^b h^c` (a, b ≥ 0, c = 0 or 1) of each central quotient U(sl₂)/(Δ−r), whose multi-filtration step d has rank ∏(d_i+1)² (fu24, Lemma 3.3). At λ_i = ½k_i(k_i+2) the step F_k already maps onto the image of the integral enveloping algebra in End(W_k⁰) (fu24, Proposition 3.4 and Remark 3.5), and the reduction of that central quotient modulo a uniformiser is a domain, so right multiplication by δ is injective from `F_(k−α)` into End(W_k) when k ≥ α. Hence the image of Ûδ in End(W_k) has dimension at least ∏(k_i−α_i+1)². Since Hom_Û(Û/Ûδ, W_k) is the kernel of δ on W_k, and the image of Ûδ is End(W_k)·δ, of dimension dim W_k times the rank of δ, the multiplicity is at most `(∏(k_i+1)² − ∏(k_i−α_i+1)²)/∏(k_i+1)`. Telescoping one coordinate at a time, with (k_i+1)² − (k_i+1−α_i)² ≤ 2α_i(k_i+1), bounds this by `2 Σ_i α_i ∏_(j≠i)(k_j+1)`. If some k_i < α_i, use `dim Hom ≤ dim W_k ≤ α_i ∏_(j≠i)(k_j+1)` instead.

The API includes the following facts.

- δ is generic exactly when δ ∉ Û(Δ_i−λ_i)_i for every λ ∈ ℤ_p^m.
- A nonzero ℚ_p-multiple of a generic element is generic; 0 is not generic.
- The image in Û of every nonzero element of A is generic (LocallyAnalyticDistributionsPartII §4.14).
- The exponent α depends on δ, p and m only, and the bound holds for all k ∈ ℕ^m, including the strips where some k_i < α_i.

*Needs:* §0.1; LocallyAnalyticDistributionsPartII §2.1; LocallyAnalyticDistributionsPartII §3.9; LocallyAnalyticDistributionsPartII §4.1; LocallyAnalyticDistributionsPartII §5.2; Tau Ceti `Module.Basis.pbwBasis`.

**Checks.**

- In the PBW multi-filtration of a central quotient at d = (1,2), the step has rank (1+1)²(2+1)² = 36; at d = 0 it has rank 1.
- For α = (3,3) and k = (1,t), the small-coordinate strip has dim Hom ≤ dim W_k = 2(t+1) ≤ 3(t+1), while the stated bound is 2(3(t+1) + 3·2) = 6(t+1) + 12.
- For m = 1 and k ≥ α, ((k+1)² − (k−α+1)²)/(k+1) = 2α − α²/(k+1) ≤ 2α, and the stated bound is the constant 2α; δ = 0 fails genericity and would give k+1, which no constant bounds.
- For m = 2 the element δ = Δ₁−Δ₂ is not generic, since it vanishes in Û_λ for λ = (λ₁,λ₁); at parallel weights k = (n,n) it kills all of `W_(n,n)`, so the multiplicity (n+1)² grows quadratically, beyond any bound of degree m−1 = 1.

### Examples

For m = 1 every proper-face error is constant; for m = 2 the error 7x₁ remains unbounded on (1,t). For δ generic with α = (1,1), the bound is 2(k₂+1) + 2(k₁+1), linear in each weight.

### Dependencies

Mathlib `Finset.prod`; Mathlib `Finset.powerset`; Mathlib `MvPolynomial`; Tau Ceti `Module.Basis.pbwBasis`; LocallyAnalyticDistributionsPartII §2.1; LocallyAnalyticDistributionsPartII §3.9; LocallyAnalyticDistributionsPartII §4.1; LocallyAnalyticDistributionsPartII §5.2.

## Layer 1: Torsion multiplicities

### 1.1 Multiplicity and degree-zero homology

For a finitely generated left A-module M with its canonical finite-module topology and a finite-dimensional continuous G-representation W admitting a stable lattice, evaluation induces a natural isomorphism `Hom_A(M,W) ≃ Hom_{ℚ_p}(H₀(G, M⊗W*), ℚ_p)`. Here the tensor has the diagonal action, W* has the contragredient action, and H₀ is rational completed coinvariants, identified with Tor₀^A(ℚ_p, −) by NoncommutativeAndEquivariantIwasawa §0.15. For W = W_k, the self-duality of LocallyAnalyticDistributionsPartII §5.2 (i) replaces W_k* by W_k. All spaces in the dimension identity are finite-dimensional and the A-linear maps are continuous. (fu24, §6, p. 22, identities in the proof of Theorem 1.4.)

A proof uses the following route. Send f to the functional m⊗φ ↦ φ(f(m)); the G-invariance relation is exactly equivariance of f. Use the canonical finite-module topology and the finite-dimensional continuous Hom comparison so that the functional factors through the completed quotient. Apply the lattice and completed-Tor rational comparison and then finite-dimensional duality. No duality between unrelated Banach categories is substituted for this evaluation map.

*Needs:* LocallyAnalyticDistributionsPartII §5.2; NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.15; CompletedCohomologyPartII §3.1.

**Checks.**

- For M = A, both dimensions are dim W.
- The dual representation is necessary before using self-duality: for a one-dimensional W on which G acts by a character a, the pairing of M⊗W* transforms by a·a⁻¹ = 1, while pairing with M⊗W would transform by a².

### 1.2 Cyclic Iwasawa multiplicity estimate

For every nonzero δ ∈ A there are nonnegative proper-face coefficients c(δ) such that dim Hom_A(A/Aδ, W_k) ≤ B_c(k+1) for every k ∈ ℕ^m. Here Aδ is the left ideal generated by δ. The coefficients depend on δ, p and m, and are independent of k. (fu24, §6, pp. 22–23; Theorem 4.3, p. 15; Theorem 3.2, pp. 8–11; aw14, §4.6, p. 11 and §5.4, p. 16.)

A proof uses the following route. By the isotypic comparison (LocallyAnalyticDistributionsPartII §3.10, with W = W_k), Hom into W_k is unchanged by microlocalisation A → Û, and the cyclic module A/Aδ becomes Û/Ûδ by right exactness of Û ⊗_A − (§3.7 there). Fu's injectivity theorem (LocallyAnalyticDistributionsPartII §4.14), proved there through the faithfulness of Ardakov–Wadsley's affinoid Verma modules, makes the image of every nonzero δ generic in the sense of §0.3. Then §0.3 gives dim Hom_A(A/Aδ, W_k) ≤ B(k+1) with the proper-face polynomial `B(x) = 2Σ_i α_i ∏_{j≠i} x_j`, including the infinite strips where some k_i < α_i.

*Needs:* §0.1; §0.3; LocallyAnalyticDistributionsPartII §3.4; LocallyAnalyticDistributionsPartII §3.7; LocallyAnalyticDistributionsPartII §3.10; LocallyAnalyticDistributionsPartII §4.14; LocallyAnalyticDistributionsPartII §5.2.

**Checks.**

- The bound includes k_i = 0 and m = 1, where it is constant.
- δ = 1 gives the zero module; δ = 0 is excluded, since Hom_A(A, W_k) has dimension D(k+1).

### 1.3 Cyclic control of a finite torsion module

Let T be a finitely generated left A-module of skew rank zero. There is a finite filtration 0 = T₀ ⊂ ⋯ ⊂ T_r = T with cyclic factors Q_j and nonzero δ_j ∈ A such that A/Aδ_j surjects onto Q_j; the factors need not be isomorphic to principal quotients. For every finite-dimensional W, dim Hom_A(T,W) ≤ Σ_j dim Hom_A(A/Aδ_j, W). (fu24, §6, p. 23, torsion case.)

A proof uses the following route. Choose finitely many generators of T and filter by their successive spans. Rank zero localises every cyclic factor to zero. Clearing an Ore denominator gives a nonzero annihilator of its chosen cyclic generator, hence the indicated surjection. Apply left exactness of Hom(−,W) to each short exact filtration sequence, and use the injection induced by the principal-quotient surjection.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8; NoncommutativeAndEquivariantIwasawa §1.12; gap:skew-rank.

**Checks.**

- Over ℚ_p[X,Y], A/(X,Y) is controlled by A/(X) but is not isomorphic to it: with W = A/(X,Y), both Hom spaces are one-dimensional, while the two modules have dimensions 1 and ∞.

### 1.4 The torsion-module weight bound

For every finitely generated A-module T of skew rank zero, there are nonnegative proper-face coefficients c_T such that dim H₀(G, T⊗W_k) = `dim Hom_A(T, W_k) ≤ B_{c_T}(k+1)` for all k. The same conclusion holds for a finite collection of torsion modules with one common coefficient vector. (fu24, §6, pp. 22–23, torsion case of Theorem 1.4.)

A proof uses the following route. Use §1.3 to reduce to its principal cyclic upper bounds. Use §1.2 for each δ_j and add the finitely many proper-face coefficient vectors. Use §1.1 and self-duality of W_k for the equality with H₀.

*Needs:* §1.3; §1.2; §1.1; §0.1.

**Checks.**

- The zero module admits zero coefficients.
- When m = 1 all degree-zero torsion multiplicities are uniformly bounded; for T = W₀ ⊕ W₀ the bound 2 works for every m ≥ 1.

### Examples

The unit δ = 1 gives a zero cyclic quotient; δ = 0 would give the full dimension D(k+1), which cannot be a proper-face error.

### Dependencies

NoncommutativeAndEquivariantIwasawa §0.15; CompletedCohomologyPartII §3.1; LocallyAnalyticDistributionsPartII §3.4; LocallyAnalyticDistributionsPartII §3.7; LocallyAnalyticDistributionsPartII §3.10; LocallyAnalyticDistributionsPartII §4.14; LocallyAnalyticDistributionsPartII §5.2; NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8; NoncommutativeAndEquivariantIwasawa §1.12; gap:skew-rank.

## Layer 2: Ranks and all homological degrees

### 2.1 Free approximations with their ranks

For a finitely generated left A-module M of skew rank a, choose (i) an exact sequence 0 → A^a → M → T → 0 with T finitely generated of skew rank zero, and (ii) an exact sequence 0 → N → A^ℓ → M → 0 with N finitely generated of skew rank ℓ−a. These are choices of actual maps and exact sequences; they are not canonical or functorial in M. Noncommutative localisation is on the left for M; denominator clearing uses the compatible right and left Ore calculus of the noetherian domain A. (fu24, §6, pp. 22–23, equations (33)–(34).)

A proof uses the following route. Choose a basis of Q(A) ⊗_A M, lift its vectors after clearing denominators, and check independence after localisation: a nonzero kernel in the finite free module would remain detectable in the localisation. Choose a finite generating set of M to obtain the second sequence; noetherianity makes N finitely generated. Exact localisation gives rank T = 0 and rank N = ℓ−a. The rank may be smaller than the chosen number of generators.

The API includes the following facts.

- An injection A^a → M with cokernel T of skew rank zero exists.
- A surjection A^ℓ → M exists, and its kernel N is finitely generated.
- The first free rank equals rank_A M, and rank_A N = ℓ−a.
- Kernels, images and quotient identifications are exported for both chosen sequences.

*Needs:* NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8; NoncommutativeAndEquivariantIwasawa §1.12; gap:skew-rank.

**Checks.**

- For M = A^a, identity maps give T = N = 0 and ℓ = a.
- For M = A/Aδ with δ a nonzero non-unit, a = 0 but one generator suffices: (a, ℓ, rank N, rank T) = (0, 1, 1, 0), so ℓ need not equal a.
- The ideal (X,Y) over ℚ_p[X,Y] has rank one and needs two generators; an assertion that ℓ = a for every module is false.

### 2.2 Upper rank estimate

For a finitely generated A-module M of skew rank a there is a nonnegative proper-face polynomial U_M with dim H₀(G, M⊗W_k) ≤ aD(k+1) + U_M(k+1) for all k. It may be chosen as the §1.4 polynomial of the cokernel T of a free approximation. Applying H₀ to A^a → M need not be injective. (fu24, §6, pp. 22–23, equation (33) and its following inequality.)

A proof uses the following route. Apply the right-exact coinvariant functor to 0 → A^a⊗W_k → M⊗W_k → T⊗W_k → 0. The image of H₀(A^a⊗W_k) has dimension at most aD; bound the quotient by H₀(T⊗W_k). Use NoncommutativeAndEquivariantIwasawa §0.15 and §1.4; no control of H₁(T⊗W_k) is needed.

*Needs:* §2.1; NoncommutativeAndEquivariantIwasawa §0.15; §1.4.

**Checks.**

- For a free M the upper error is zero.
- For ℓ = 1 and k = (1,2), the free twist has H₀ of dimension 6 and all positive homology zero; on g⊗w the untwisting uses g⁻¹w. For M = A² it gives H₀ of dimension 12 = 2·6.

### 2.3 Lower rank estimate

For a finitely generated A-module M of skew rank a and a chosen finite presentation with kernel N of skew rank ℓ−a, dim H₀(G, M⊗W_k) ≥ aD(k+1) − U_N(k+1), where U_N is the upper-error polynomial of §2.2 for N. No higher-homology estimate is used in this step. (fu24, §6, equation (34), p. 22, and the inequalities following it, p. 23.)

A proof uses the following route. Right exactness of H₀(N⊗W_k) → H₀(A^ℓ⊗W_k) → H₀(M⊗W_k) → 0 gives dim H₀(M⊗W_k) ≥ ℓD − dim H₀(N⊗W_k). Use §2.2 for N and rank N = ℓ−a, then cancel the main terms.

*Needs:* §2.1; NoncommutativeAndEquivariantIwasawa §0.15; §2.2.

**Checks.**

- For a = 0 the estimate is a valid lower bound, −U_N ≤ 0 ≤ dim H₀, not a claim of nonzero homology.
- The leading coefficient is a, not ℓ: for ℓ = 2, a = 1 and D = 6, the bound reads 12 − (6 + U_N) = 6 − U_N.

### 2.4 Two-sided degree-zero rank error

For every finitely generated A-module M of skew rank a, there is a nonnegative proper-face polynomial E_M such that |dim H₀(G, M⊗W_k) − aD(k+1)| ≤ E_M(k+1) for every k ∈ ℕ^m. One choice is U_M + U_N for a fixed presentation kernel N. (fu24, Theorem 1.4, p. 3; §6, pp. 22–23.)

A proof uses the following route. Combine §2.2 and §2.3. The sum of the two nonnegative errors dominates each one and keeps proper-face degree at most m−1.

*Needs:* §2.2; §2.3; §0.1.

**Checks.**

- For M = A^a the difference is identically zero.
- For m = 1 the deviation is uniformly bounded.

### 2.5 Syzygy bounds in positive degrees

For an exact sequence 0 → N → A^ℓ → M → 0 and x = k+1, dim H₁(G, M⊗W_k) ≤ U_N(x) + U_M(x), while `H_i(G, M⊗W_k) ≃ H_{i−1}(G, N⊗W_k)` for every i ≥ 2. In the first bound U_N and U_M are upper-error polynomials, and rank N = ℓ − rank M. The bound follows from the exact dimension identity dim H₁(M⊗W_k) = dim H₀(N⊗W_k) − ℓD(x) + dim H₀(M⊗W_k). (fu24, §6, p. 23, last paragraph of the proof of Theorem 1.4.)

A proof uses the following route. Use the long exact Tor sequence and NoncommutativeAndEquivariantIwasawa §0.15. For i = 1 use its four-term exact portion to get the displayed identity, apply §2.2 to N and M, and cancel their main terms. For i ≥ 2 the adjacent free-module homology groups vanish, giving the shift isomorphism.

*Needs:* §2.1; NoncommutativeAndEquivariantIwasawa §0.15; §2.2.

**Checks.**

- The degree-one term is a difference of three dimensions; bounding H₁ by H₀(N) alone would leave a degree-m main term.
- The shift at i = 1 is not an isomorphism with all of H₀(N): for the projection A² → A onto the first factor, H₁(A) = 0 while H₀ of the kernel has dimension D.
- For ℓ = 2, a = 1 and D = 6, the identity gives (6 + U_N) − 12 + (6 + U_M) = U_N + U_M.

### 2.6 Fu's local homology theorem

Let p be odd, m ≥ 1, G the product of m first-congruence subgroups of SL₂(ℤ_p), A = ℚ_p ⊗ ℤ_p[[G]], and M a finitely generated left A-module of skew rank a. There is a single nonnegative proper-face polynomial B_M of total degree ≤ m−1 such that for every k ∈ ℕ^m, |dim H₀(G, M⊗W_k) − aD(k+1)| ≤ B_M(k+1), and dim H_i(G, M⊗W_k) ≤ B_M(k+1) for every i ≥ 1. All dimensions are finite, and homology is zero for i > 3m. The polynomial may depend on M, p and m, but not on i or k. (fu24, Theorem 1.4, p. 3; §6, pp. 21–23.)

A proof uses the following route. Choose finite free presentations recursively for the first 3m syzygies, which remain finitely generated by noetherianity. Use §2.5 and the rank-error estimates on this finite list; add their nonnegative proper-face polynomials together with the degree-zero error. Use the rational Iwasawa global dimension 3m to eliminate every i > 3m. This gives one common polynomial for all positive degrees without an infinite sum.

*Needs:* §2.4; §2.5; NoncommutativeAndEquivariantIwasawa §0.12; NoncommutativeAndEquivariantIwasawa §0.15; §0.1.

**Checks.**

- m = 1 gives constant errors in all degrees.
- At p = 2, −I lies in the first congruence kernel and has order 2; in its rational group algebra (1−g)(1+g) = 0 for g = −I, so the domain and uniform-group hypotheses used here cannot be transferred to that kernel.
- A finite direct sum admits the sum of the individual error polynomials.
- For M = A^a higher homology is zero and the main term is exact; for m = 2, H₇ = 0 since 7 > 3m = 6.

### 2.7 Finite-dimensional multiplicity support

For a nonzero finitely generated A-module M of canonical dimension zero, the canonical-dimension criterion makes M finite-dimensional over ℚ_p. Only finitely many W_k can be simple quotients of M, and `dim Hom_A(M, W_k) ≤ length_A M ≤ dim_{ℚ_p} M` for all k. Thus its degree-zero weight multiplicities admit a constant bound, stronger than degree m−1. This assertion does not classify all finite-dimensional A-modules as algebraic, nor assert that they are all semisimple. (fu24, §1, p. 4, discussion following Theorem 1.4; aw13, §§10.12–10.13, pp. 77–78, Lemma 10.13.)

A proof uses the following route. Use gap:canonical-dimension-zero, sourced at aw13 Lemma 10.13, for the finite-dimensional criterion. Use a finite composition series of the finite-dimensional A-module. The W_k are pairwise nonisomorphic absolutely simple modules, so a nonzero Hom forces W_k to occur as a composition factor. Left exactness of Hom and End_A(W_k) = ℚ_p bound its dimension by the composition length.

*Needs:* LocallyAnalyticDistributionsPartII §5.2; gap:canonical-dimension-zero.

**Checks.**

- The zero module has zero multiplicities and is handled separately from the canonical dimension of a nonzero module.
- For M = W_(1,2), the matching multiplicity is 1 ≤ length 1 ≤ 6; for M = W₀ ⊕ W_(1,2) two weights occur, with length 2 ≤ 7.

### Examples

For a free module A^a the rank term is exactly aD(k+1) and every positive homology group vanishes. For m = 1, M = A² gives H₀ of dimension 2(k+1) with zero error.

### Dependencies

NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8; NoncommutativeAndEquivariantIwasawa §1.12; gap:skew-rank; NoncommutativeAndEquivariantIwasawa §0.15; NoncommutativeAndEquivariantIwasawa §0.12; LocallyAnalyticDistributionsPartII §5.2; gap:canonical-dimension-zero.

## Layer 3: Arithmetic realization and descent

### 3.1 Archimedean weights and split-prime indices

For a number field F of signature (r₁,r₂), d = r₁+2r₂, use an archimedean tuple κ_v of even integers ≥ 2. Set `Δ(κ) = ∏_{v real} κ_v · ∏_{v complex} κ_v²`. The complex coefficient system is `V_κ = ⊠_{real v} Sym^{κ_v−2}(ℂ²) ⊠_{complex v} (Sym^{κ_v/2−1}(ℂ²) ⊗ conjugate Sym^{κ_v/2−1}(ℂ²))`. Index its factors by the d embeddings σ of F: t_σ = κ_v−2 at a real place and t_σ = κ_v/2−1 at each of the two embeddings of a complex place; call t the embedding tuple of κ, and put x_σ = t_σ+1. Then `D(x) = ∏_{real v}(κ_v−1) ∏_{complex v}(κ_v/2)²`, D(x) ≤ Δ(κ), and min_σ x_σ ≥ (min_v κ_v)/2. The tuple κ = (2,…,2) gives exactly the trivial coefficient system. (fu24, §1, pp. 1–2; §7, pp. 23–24; marshall12, §2.1, pp. 3–4.)

On arithmetic subgroups the coefficient system is a concrete representation. For a subgroup Γ ≤ SL₂(O_F) and an embedding σ : F → ℂ, define `embeddingStdRep σ Γ` : Γ → GL₂(ℂ) as the homomorphism applying σ to the entries of a matrix of Γ. For every tuple t : Hom(F,ℂ) → ℕ, define `weightRep Γ t` as the complex representation of Γ on ⊗_σ `Sym^{t_σ}(ℂ²)` in which Γ acts on the factor at σ by `TauCeti.symPowerRep` composed with `embeddingStdRep σ Γ`; the factors are assembled by Tau Ceti `Representation.piTensorProduct`. The tuple t is arbitrary: it need not come from an admissible κ, and conjugate embeddings may carry different exponents. When t is the embedding tuple of κ, `weightRep Γ t` is V_κ restricted to Γ, because the two embeddings of a complex place are complex conjugate. For F imaginary quadratic and the constant tuple n, it is E_n = Sym^n(ℂ²) ⊗ conjugate Sym^n(ℂ²).

A proof of the weight facts uses the following route. Use the coefficient conventions of Fu and Marshall, keeping the place tuple separate from the embedding tuple. Use evenness to make κ_v/2 integral; doubling each complex factor gives d factors. Compute the dimension by the symmetric-power and tensor finrank formulas, and compare each factor with κ_v and κ_v/2.

The API includes the following facts.

- Δ is evaluated on the archimedean tuple with complex factors squared; if all κ_v = κ, then Δ(κ) = κ^d.
- The embedding tuple t of an admissible κ is a d-entry nonnegative integral tuple; changing the ordering of the embeddings permutes t and preserves D and every minimum.
- D(t+1) ≤ Δ(κ) and every t_σ+1 ≥ min_v κ_v/2.
- `embeddingStdRep σ Γ` is a group homomorphism with values of determinant one, and its matrix entries are the σ-images of the entries of the given matrix.
- The underlying space of `weightRep Γ t` has dimension ∏_σ(t_σ+1), by Tau Ceti `SymmetricPower.finrank_eq` and the product basis `Basis.piTensorProduct`.
- An element γ ∈ Γ acts on a pure tensor ⊗_σ v_σ by ⊗_σ `Sym^{t_σ}(σ(γ))v_σ` (Tau Ceti `Representation.piTensorProduct_apply_tprod`); in particular −I acts by `(−1)^{Σ_σ t_σ}`.
- For an admissible κ with embedding tuple t, `weightRep Γ t` is isomorphic to the restriction of V_κ to Γ through the archimedean embedding SL₂(O_F) → ∏_v SL₂(F_v), and dim V_κ = D(t+1).

*Needs:* Mathlib `Finset.prod`; Mathlib `Matrix.SpecialLinearGroup.map`; Mathlib `Matrix.SpecialLinearGroup.toGL`; Mathlib `Rep.of`; Mathlib `Basis.piTensorProduct`; Tau Ceti `TauCeti.symPowerRep`; Tau Ceti `Representation.piTensorProduct`; Tau Ceti `SymmetricPower.finrank_eq`; ArithmeticLocallySymmetricSpaces §ALS.1.1.

**Checks.**

- For (r₁,r₂) = (0,1), κ = 6 gives t = (2,2), dim V = 9, Δ = 36 and min x = 3.
- For signature (1,1) and κ = (4,6), t = (2,2,2), dim V = 27 and Δ = 144.
- At κ = (2,…,2), t = 0 and dim V = 1, even though Δ = 2^d.
- A complex κ_v = 3 is inadmissible: integer division must not manufacture an algebraic weight from this input.
- The number of factors is d, not r₁+r₂.
- For t = 0, `weightRep Γ 0` is the one-dimensional trivial representation, a tensor over the d complex embeddings whose factors `Sym^0(ℂ²)` are each one-dimensional, not the zero representation: for F = ℚ, ℚ(i) and a cubic field there are 1, 2 and 3 factors, of dimension 1, 1·1 and 1·1·1. The index set has d ≥ 1 elements and is never empty; the empty product D = 1 of §0.1 is a different case.
- For F = ℚ(i), γ = (i 1;−1 0) ∈ SL₂(ℤ[i]) has determinant 1 and trace i under one embedding and −i under the other. On E₁ its trace is i·(−i) = 1; a model that used the same embedding on both factors would give i² = −1.
- For F = ℚ(i) and t = (1,0), −I acts on `weightRep` by −1, so every H^i(SL₂(ℤ[i]), ·) vanishes; on E_n it acts by `(−1)^{2n} = 1`.

### 3.2 One auxiliary prime for a fixed level

For a fixed compact open K_f ⊂ SL₂(𝔸_F^∞), choose an odd rational prime p splitting completely in a normal closure of F and outside the finitely many rational primes below a place v at which the factor K_v of a chosen product compact open subgroup ∏_v K_v ⊆ K_f differs from SL₂(O_v). There is a product level K′_f = G K^p ⊂ K_f, neat both for SL₂ over F and for `Res_{F/ℚ}SL₂` over ℚ, with G exactly the product of the d first-congruence SL₂(ℤ_p) groups at the places above p. At neat levels the cohomology pullback has the normalized trace as a left inverse; finite stabilizers at other levels are handled by characteristic-zero invariants. The refinement therefore carries upper bounds from K′_f to K_f, never lower bounds. Every index and resulting dimension constant is fixed independently of κ. Fu chooses p only for the levels used in his theorem; the arbitrary fixed level and the neat refinement are proved here. (fu24, §7, pp. 23–24, before (38); Theorem 1.2, pp. 2–3.)

A proof uses the following route. Use the identity Frobenius class in the normal closure and avoid the finite exceptional prime set; Chebotarev supplies infinitely many such primes. A compact open subgroup of SL₂(𝔸_F^∞) contains a product ∏_v K_v with K_v = SL₂(O_v) for all but finitely many v. At each of the d places above the chosen p the factor is then SL₂(O_v) = SL₂(ℤ_p), which contains the first congruence kernel; replace these factors by G, a pro-p group. Choose a rational prime q ≠ p and, at every place v′ of F above q, intersect the factor with the principal congruence kernel `ker(SL₂(O_{v′}) → SL₂(k_{v′}))`, a pro-q group. All factors above p are then pro-p and all factors above q are pro-q, so ArithmeticLocallySymmetricSpaces §ALS.0.11 makes K′_f neat, for SL₂ over F with its standard representation and for `Res_{F/ℚ}SL₂` over ℚ with the restriction of scalars of that representation; the p-factor stays exactly G. For topological comparison use the parent pullback and trace; the finite degree is invertible in characteristic zero.

*Needs:* Chebotarev Layer 10; ArithmeticLocallySymmetricSpaces §ALS.0.11; ArithmeticLocallySymmetricSpaces §ALS.0.9; ArithmeticLocallySymmetricSpaces §ALS.1.8; ArithmeticLocallySymmetricSpaces §ALS.3.6; NoncommutativeAndEquivariantIwasawa §F.1.

**Checks.**

- The auxiliary prime and refinement are fixed before varying κ. If K′ ⊂ K has index r, trace after pullback is r·id and the normalized composite is the identity; r is independent of κ, so one constant serves the entire weight orthant.
- For F = ℚ(i), p = 5 splits into two places and q = 3 is inert: the factors above 5 are pro-5 and the factor at 3 is pro-3, so a root of unity among the eigenvalues of an element of Γ′ has both 5-power and 3-power order and equals 1.
- One pro-unipotent factor does not suffice: γ = (1 1;−3 −2) ∈ SL₂(ℤ) has trace −1 and order three, and it lies in the pro-3 Iwahori factor at 3. A second factor that is pro-q for q ≠ 3 excludes it, since a nontrivial element of order three cannot lie in a pro-q group.
- A maximal compact factor is not enough: at a split place v | p with O_v = ℤ_p, the conjugate diag(p²,1)SL₂(ℤ_p)diag(p²,1)⁻¹, a maximal compact subgroup since it is conjugate to SL₂(ℤ_p) by diag(p,p⁻¹) ∈ SL₂(ℚ_p), consists of matrices `(a, p²b; p⁻²c, d)` with a, b, c, d ∈ ℤ_p and so does not contain (1 p;0 1) ∈ G; the factor must equal SL₂(O_v).

### 3.3 Coefficient realizations over a number field

Let E be the normal closure of F in ℂ, with ι_∞ : E → ℂ the inclusion, and choose an embedding ι_p : E → ℚ_p, which exists because the auxiliary prime p of §3.2 splits completely in E. Every embedding F → ℂ has image in E, so composition with ι_∞ and with ι_p identifies Hom(F,E) with Hom(F,ℂ) and with Hom(F,ℚ_p), hence with the d places of F above p. For every tuple t : Hom(F,ℂ) → ℕ, admissible or not, construct the algebraic representation `V_{t,E} = ⊗_σ Sym^{t_σ}(E²)` of the base change of `Res_{F/ℚ}SL₂` to E, on which SL₂(F) acts on the factor at σ through σ, and its local system on the arithmetic quotient at a neat level from the parent's coefficient functor. Its complex scalar extension is `weightRep Γ t`, which is V_κ when t is the embedding tuple of κ (§3.1), and its p-adic scalar extension is W_t, the external tensor indexed by the places above p. Finite chain models and flat coefficient change identify the corresponding homology and cohomology after these scalar extensions; their dimensions over ℂ and ℚ_p agree degree by degree. For any finite extension L/ℚ_p, the dimensions over L agree with those over ℚ_p; as ℚ_p-dimensions they are multiplied by [L:ℚ_p]. (fu24, §7, p. 23, equation (37); marshall12, §2.2, equation (7), p. 4; §5, equation (29) and Lemma 11, pp. 15–16.)

A proof uses the following route. Use the restriction-of-scalars algebraic representation over E, with one factor for each embedding. The split-prime indexing identifies its matrices over ℚ_p with W_t. Apply the finite-complex and coefficient-change theorems of ArithmeticLocallySymmetricSpaces Layer 1 to the same E-linear cellular differentials; flat scalar extension commutes with homology. For cohomology and homology dimension comparisons keep the dual local system until self-duality is used. No topological or field isomorphism ℂ ≃ ℚ_p is invoked.

The API includes the following facts.

- The E-linear algebraic local system has a finite complex whose two scalar extensions are identified with the complex and p-adic complexes.
- A finite extension E′/E with compatible embeddings gives the scalar extension of the same complex.
- In each degree the cohomology, and the homology, have equal dimension over the two realization fields.
- The comparisons commute with pullback and trace along level changes.

*Needs:* §3.1; §3.2; ArithmeticLocallySymmetricSpaces §ALS.1.6; ArithmeticLocallySymmetricSpaces §ALS.1.7; ArithmeticLocallySymmetricSpaces §ALS.1.1; Mathlib `Module.finrank_baseChange`.

**Checks.**

- At t = 0, the embedding tuple of κ = (2,…,2), this is the constant E-local system, not a zero coefficient space.
- For F = ℚ(i) and t = (3,0), the embedding tuple of no admissible κ since a complex place forces equal exponents at its two embeddings, `V_(t,E)` is Sym³(E²) through one embedding tensored with a trivial factor, of dimension 4 in both realizations; −I acts by −1 in both. A comparison built only for admissible κ would give no coefficient system here, although the ordinary-cohomology bound of §4.2 quantifies over every t.
- A one-dimensional ℚ_p-cohomology group stays one-dimensional over L and has ℚ_p-dimension [L:ℚ_p].
- At Bianchi κ = 6 the chain coefficient in both realizations has dimension 9.
- For the integral complex O --p→ O, homology over the fraction field is (0,0) while mod-p base change has homology (1,1); flat field comparison must not be generalized to arbitrary reduction.

### 3.4 Weight bounds through completed-homology descent

For F with r₂ > 0 and the fixed split auxiliary level of §3.2, let M_j = ℚ_p ⊗ H̃_j be the completed ordinary homology modules of CompletedCohomologyPartII. They are finitely generated A-modules of skew rank zero. The completed homological descent sequence `E²_{i,j} = H_i(G, M_j⊗W_t) ⇒ H_{i+j}(Y(K′_f), W_t)` yields one proper-face polynomial `Q_{F,K′}` in d variables such that `dim H_n(Y(K′_f), W_t) ≤ Q_{F,K′}(t+1)` for every n and every t ∈ ℕ^d, in particular for the embedding tuple of every admissible κ. The same bound holds for complex ordinary cohomology with the dual coefficient, and self-duality removes the dual. The polynomial is independent of n and t. CompletedCohomologyPartII §5.7 is applied over base field ℚ to `Res_{F/ℚ}SL₂` and the prime ideal (p), so its compact local group is `K₀ = ∏_{v|p} G_v = G`, of analytic dimension 3d. (fu24, §7, pp. 23–24, equation (38) and the unnumbered bound following it.)

A proof uses the following route. The real group `SL₂(ℝ)^{r₁} × SL₂(ℂ)^{r₂}` has no discrete series when r₂ > 0, so CompletedCohomologyPartII §5.7 makes every M_j of skew rank zero. Here §5.7 there gives rank zero of H̃_j over ℤ_p[[G]] in the sense of its §5.5, with the uniform open subgroup taken to be K₀ = G itself, which is uniform and torsion-free for p odd. By the criterion of gap:skew-rank for the noetherian domain ℤ_p[[G]], every element of H̃_j is killed by a nonzero element of ℤ_p[[G]]; that element stays nonzero in A because ℤ_p[[G]] has no p-torsion, and p is central, so every element of M_j is killed by a nonzero element of A and rank_A M_j = 0 by the same criterion over A. Use CompletedCohomologyPartII §5.1 finite generation and §6.3 rational homological descent with its completed-Tor convention. The lifted finite complex bounds the possible j; local homology vanishes above 3d. For each of the finitely many M_j apply §2.6 with rank zero. For a fixed total degree, E^∞ terms are subquotients of E² terms and the abutment has a finite filtration; sum their dimensions, then sum a finite envelope over j and 0 ≤ i ≤ 3d to obtain one Q. Use §3.3 and duality between homology and cohomology of a finite complex over a field. Degeneration of the spectral sequence is not used.

*Needs:* §2.6; §3.3; CompletedCohomologyPartII §4.2; CompletedCohomologyPartII §5.1; CompletedCohomologyPartII §5.5; CompletedCohomologyPartII §5.7; CompletedCohomologyPartII §6.3; NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8; gap:skew-rank; §0.1.

**Checks.**

- Every E² term on a total-degree diagonal contributes to the upper bound: in total degree 2 the terms (0,2), (1,1) and (2,0) all enter.
- For F imaginary quadratic, d = 2 and dim K₀ = 6 = 3d, rather than the dimension 3 of a single prime of F; the local homology cutoff is 6.

### Examples

At signature (1,1) and κ = (4,6), the complex and p-adic coefficient dimensions both equal 27. For F = ℚ(i), p = 5 and q = 3 give a neat auxiliary level whose local group is the product of two first-congruence subgroups of SL₂(ℤ₅).

### Dependencies

Mathlib `Finset.prod`; Mathlib `Matrix.SpecialLinearGroup.map`; Mathlib `Matrix.SpecialLinearGroup.toGL`; Mathlib `Rep.of`; Mathlib `Basis.piTensorProduct`; Mathlib `Module.finrank_baseChange`; Tau Ceti `TauCeti.symPowerRep`; Tau Ceti `Representation.piTensorProduct`; Tau Ceti `SymmetricPower.finrank_eq`; Chebotarev Layer 10; ArithmeticLocallySymmetricSpaces §ALS.0.9; ArithmeticLocallySymmetricSpaces §ALS.0.11; ArithmeticLocallySymmetricSpaces §ALS.1.1; ArithmeticLocallySymmetricSpaces §ALS.1.6; ArithmeticLocallySymmetricSpaces §ALS.1.7; ArithmeticLocallySymmetricSpaces §ALS.1.8; ArithmeticLocallySymmetricSpaces §ALS.3.6; NoncommutativeAndEquivariantIwasawa §F.1; NoncommutativeAndEquivariantIwasawa §0.5; NoncommutativeAndEquivariantIwasawa §0.8; gap:skew-rank; CompletedCohomologyPartII §4.2; CompletedCohomologyPartII §5.1; CompletedCohomologyPartII §5.5; CompletedCohomologyPartII §5.7; CompletedCohomologyPartII §6.3.

## Layer 4: Cuspidal dimensions in weight aspect

### 4.1 SL₂ cuspidal dimensions and support conventions

Put q = r₁+r₂. For a real place v and even κ_v ≥ 2 let `D⁺_{κ_v}` and `D⁻_{κ_v}` be the holomorphic and antiholomorphic discrete series of SL₂(ℝ) of weight κ_v, whose SO(2)-weights are κ_v, κ_v+2, … and −κ_v, −κ_v−2, … respectively (AutomorphicFormsOnReductiveGroups §2.4, with the circle convention of its §2.3). For a complex place v let `π_{κ_v,0}` be the unitary principal series of SL₂(ℂ) induced from the character `z ↦ (z/|z|)^{κ_v}` of the diagonal torus ℂ^× (AutomorphicFormsOnReductiveGroups §2.3); by the Vogan–Zuckerman exhaustion (AutomorphicFormsOnReductiveGroups §5.4) it is the only infinite-dimensional irreducible unitary representation with nonzero degree-one (𝔤,K)-cohomology against `Sym^{κ_v/2−1}(ℂ²) ⊗ conjugate Sym^{κ_v/2−1}(ℂ²)`. For a sign pattern ε, a choice of sign ε_v at every real place v, put `π^ε_κ = ⊠_{v real} D^{ε_v}_{κ_v} ⊠_{v complex} π_{κ_v,0}`, a representation of SL₂(F_∞); write + for the pattern that is holomorphic at every real place and −ε for the pattern opposite to ε at every real place. For a compact open K_f ⊂ SL₂(𝔸_F^∞) let `m_ε(κ,K_f) = dim Hom_{SL₂(F_∞)}(π^ε_κ, L²_cusp(SL₂(F)\SL₂(𝔸_F))^{K_f})`, with the cuspidal spectrum of ArithmeticLocallySymmetricSpaces §ALS.5b.5, and define the space of cusp forms of weight κ and level K_f as `S_κ(K_f) = Hom_{SL₂(F_∞)}(π^+_κ, L²_cusp(SL₂(F)\SL₂(𝔸_F))^{K_f})`, so that dim S_κ(K_f) = m_+(κ,K_f).

For a neat level K_f of the SL₂/F quotient and V_κ in Fu's weight convention with dim V_κ > 1, the comparison of ArithmeticLocallySymmetricSpaces §§ALS.5b.4–ALS.5b.5 gives `dim H_cusp^q(Y(K_f), V_κ) = Σ_ε m_ε(κ,K_f)`, and `m_ε = m_{−ε}` for every ε. Hence dim S_κ(K_f) ≤ dim H_cusp^q(Y(K_f), V_κ), with equality when r₁ = 0, and dim H_cusp^q(Y(K_f), V_κ) = 2 dim S_κ(K_f) when r₁ = 1. For r₁ ≥ 2 the equality `dim H_cusp^q(Y(K_f), V_κ) = 2^{r₁} dim S_κ(K_f)` is asserted only when K_f is normalised by diag(u,1) for units u ∈ O_F^× realising every sign pattern at the real places. Use the parent's injective H_cusp^q → H^q, with image in H_!^q = im(H_c^q → H^q). The symbol H_c^q always means compact support; Marshall's subscript c denotes the interior subspace. The trivial-coefficient case κ = (2,…,2) is treated separately, by finite-dimensionality at that one tuple. (fu24, §1, equation (2), p. 2; Theorem 1.2, pp. 2–3; marshall12, §2.1, equation (4), pp. 3–4, for cusp forms on GL₂, where all sign patterns carry one multiplicity; fgt10, §1, (1.6)–(1.8), pp. 4–5, and §3.3, (3.9), p. 17, for `π_{κ_v,0}`.)

At every level, neat or not, the multiplicity spaces inject into group cohomology. For a compact open K_f ⊂ SL₂(𝔸_F^∞) put Γ = SL₂(F) ∩ K_f; strong approximation (AdelicAlgebraicGroups §4.2) and ArithmeticLocallySymmetricSpaces §ALS.0.7 make Y(K_f) the single quotient Γ\X, whose Betti cohomology is H^q(Γ, V_κ) by §ALS.1.5. Prove that for every admissible κ there is an injective linear map `ι_{K_f}` from `⊕_ε Hom_{SL₂(F_∞)}(π^ε_κ, L²_cusp(SL₂(F)\SL₂(𝔸_F))^{K_f})` to H^q(Γ, V_κ) such that, for every neat open subgroup K′_f normal in K_f, its composite with restriction to Γ′ = SL₂(F) ∩ K′_f is the parent's injective cuspidal map at K′_f (§ALS.5b.5) on the K_f-fixed part of the π^ε_κ-summands. Hence Σ_ε m_ε(κ,K_f) ≤ dim H^q(Γ, V_κ), and for F imaginary quadratic S_κ(K_f) injects into H¹(Γ, E_n), κ = 2(n+1). (fgt10, §3.3, (3.9), p. 17, states the comparison for every lattice of SL₂(ℂ).)

A proof uses the following route. Import the parent's cuspidal decomposition and its injection into ordinary cohomology. For each contributing archimedean type, use AutomorphicFormsOnReductiveGroups §1.1 relative Lie cochains, §§5.2–5.3 coefficient and tempered-range computations and the exhaustion statement of §5.4: at a real place the unitary representations in the cuspidal spectrum with nonzero cohomology against `Sym^{κ_v−2}(ℂ²)` are `D⁺_{κ_v}` and `D⁻_{κ_v}`, each with one-dimensional cohomology in degree one; at a complex place it is `π_{κ_v,0}`, with one-dimensional cohomology in degrees one and two. A one-dimensional local component cannot occur in the cuspidal spectrum of SL₂, so the trivial representation does not contribute at a place with κ_v = 2. Take the relative-Lie Künneth product in degree q: it forces degree one at every complex place, so each π^ε_κ contributes its multiplicity once. Complex conjugation of automorphic forms is an antilinear isometry of L²_cusp commuting with right translation and preserving K_f-invariance; it carries the π^ε_κ-isotypic part to the part of the contragredient, which is `π^{−ε}_κ` because D⁺ and D⁻ of the same weight are contragredient and `π_{κ_v,0}` is self-contragredient. Under the unit hypothesis, conjugation by diag(u,1) ∈ GL₂(F) preserves SL₂(F) and K_f, is inner at every complex place and at every real place where u is positive, and exchanges D⁺ and D⁻ where u is negative; it therefore carries m_ε to `m_{ε·sign(u)}`, where ε·sign(u) changes ε at the real places where u is negative. The support interpretation is fixed by Marshall §2.1 (4), which defines the subspace by vanishing near the cusps. Keep compact support separate through the parent support triangle.

A proof of the injection at every level uses the following route. Intersect the finitely many K_f-conjugates of the neat level of §3.2 inside K_f: the result K′_f is open, normal in K_f and neat, since neatness of a level passes to its subgroups and conjugates. Put Γ′ = SL₂(F) ∩ K′_f and Q = K_f/K′_f; strong approximation makes Γ → Q surjective with kernel Γ′. Write `ι_{K′_f}` for the parent's cuspidal map at K′_f on the π^ε_κ-summands, each of which has one-dimensional cohomology in degree q as above. It is the inclusion of cusp forms followed by the comparison of §ALS.5b.1, which is compatible with translations, so it intertwines right translation by Q on K′_f-fixed vectors with the translations r_k^* of §ALS.1.8; the Q-invariants of `⊕_ε Hom(π^ε_κ, L²_cusp^{K′_f})` are `⊕_ε Hom(π^ε_κ, L²_cusp^{K_f})`. By §ALS.3.6 the pullback π^* and the trace π_* between the two levels satisfy `π_* π^* = [K_f:K′_f]` and `π^* π_* = Σ_{k∈Q} r_k^*`, so over ℂ restriction H^q(Γ, V_κ) → H^q(Γ′, V_κ) is an isomorphism onto the Q-invariants. Put `ι_{K_f} = [K_f:K′_f]⁻¹ π_* ∘ ι_{K′_f}`; then `π^* ∘ ι_{K_f} = ι_{K′_f}` on K_f-fixed vectors, which is injective. Another choice of K′_f gives the same map, by comparison with the intersection of the two and the compatibility of the parent's map with pullback along level maps (§ALS.5b.4).

The API includes the following facts.

- dim S_κ(K_f) = m_+(κ,K_f), and it is finite.
- For compact opens K′_f ⊆ K_f, S_κ(K_f) ⊆ S_κ(K′_f), since K_f-invariant vectors are K′_f-invariant.
- At neat K_f with dim V_κ > 1, dim H_cusp^q(Y(K_f), V_κ) = Σ_ε m_ε(κ,K_f) and `m_ε = m_{−ε}`.
- dim S_κ(K_f) ≤ dim H_cusp^q(Y(K_f), V_κ) ≤ dim H^q(Y(K_f), V_κ) at neat K_f with dim V_κ > 1.
- At every compact open K_f, neat or not, and every admissible κ, the map `ι_{K_f}` injects `⊕_ε Hom(π^ε_κ, L²_cusp^{K_f})` into H^q(Γ, V_κ), Γ = SL₂(F) ∩ K_f, compatibly with restriction to every neat open normal subgroup of K_f; hence Σ_ε m_ε(κ,K_f) ≤ dim H^q(Γ, V_κ).

*Needs:* §3.1; §3.2; ArithmeticLocallySymmetricSpaces §ALS.0.7; ArithmeticLocallySymmetricSpaces §ALS.1.5; ArithmeticLocallySymmetricSpaces §ALS.1.8; ArithmeticLocallySymmetricSpaces §ALS.3.6; ArithmeticLocallySymmetricSpaces §ALS.5b.1; ArithmeticLocallySymmetricSpaces §ALS.5b.4; ArithmeticLocallySymmetricSpaces §ALS.5b.5; AdelicAlgebraicGroups §4.2; AutomorphicFormsOnReductiveGroups §1.1; AutomorphicFormsOnReductiveGroups §§2.3–2.4; AutomorphicFormsOnReductiveGroups §§5.2–5.4.

**Checks.**

- At signature (0,1) there is one sign pattern, and dim H¹_cusp(Y(K_f), E_n) = dim S_κ(K_f) is the multiplicity of `π_{2n+2,0}` with κ = 2n+2, as in fgt10 (3.9).
- At F = ℚ, signature (1,0) and q = 1, take K_f = ker(SL₂(Ẑ) → SL₂(ℤ/3)), whose quotient is Γ(3)\ℍ with Γ(3) torsion-free and −I ∉ Γ(3), so the level is neat. S₄(K_f) is the classical space S₄(Γ(3)), of dimension 1 (§5.3); m_− = m_+ = 1 and dim H¹_cusp(Γ(3), Sym²(ℂ²)) = 2, the Eichler–Shimura dimension of ModularSymbolsPadicLFunctions §0.7. A definition of S_κ admitting every sign pattern would give 2 here, not 1, and would remove the factor two.
- At r₁ = 2, complex conjugation pairs (+,+) with (−,−) and (+,−) with (−,+) only; with no unit of mixed sign normalising K_f, nothing equates `m_{(+,+)}` with `m_{(+,−)}`, so only the inequality is asserted there.
- On the genus-zero modular curve with four cusps, ordinary H¹ has dimension 3 and cuspidal H¹ is zero, so ordinary cohomology cannot be identified with cuspidal cohomology.

### 4.2 The fixed-level sharp global bound

For a fixed number field F with r₂ > 0 and every fixed compact open K_f ⊂ SL₂(𝔸_F^∞), there is `C_{F,K_f} > 0` such that `dim_ℂ S_κ(K_f) ≤ C_{F,K_f} Δ(κ)/min_v κ_v` for every tuple of even archimedean weights κ_v ≥ 2. The minimum runs over the r₁+r₂ archimedean places; Fu's Theorem 1.2 writes the minimum over d coordinates, and the place weights are the ones meant. The constant is uniform over the whole weight orthant. At any fixed neat level, the same size bound holds for ordinary Betti dimensions in every degree, and for cuspidal and interior dimensions by inclusion. No leading constant or asymptotic equality is asserted. (fu24, Theorem 1.2, pp. 2–3; §7, pp. 23–24.)

The ordinary-cohomology form holds at every congruence level and for every embedding tuple. Prove `finrank_groupCohomology_weightRep_le`: for a number field F that is not totally real, a nonzero ideal 𝔞 of O_F and a subgroup Γ ≤ SL₂(O_F) containing ker(SL₂(O_F) → SL₂(O_F/𝔞)), there is a constant C such that for every t : Hom(F,ℂ) → ℕ, every degree i ≥ 0 and every integer a with 1 ≤ a ≤ t_σ+1 for all σ, the group cohomology H^i(Γ, `weightRep Γ t`) is finite-dimensional and a·dim_ℂ H^i(Γ, `weightRep Γ t`) ≤ C ∏_σ(t_σ+1). Taking a = min_σ(t_σ+1) at the embedding tuple of κ, where a ≥ min_v κ_v/2 and ∏_σ(t_σ+1) ≤ Δ(κ) by §3.1, gives the Betti bound C′Δ(κ)/min_v κ_v. (fu24, Theorem 1.2, pp. 2–3; §7, pp. 23–24, equation (38) and the unnumbered bound following it; fgt10, §3.2, pp. 16–17, for restriction and corestriction.)

A proof of the ordinary-cohomology form uses the following route. Apply §3.2 to the compact open closure K_f(𝔞) of the principal congruence kernel in SL₂(Ô_F): it gives an odd split prime p and a neat auxiliary level K′_f = G·K^p ⊆ K_f(𝔞), with G the product of the d first-congruence factors at p. Put Γ′ = SL₂(F) ∩ K′_f, a neat subgroup of finite index in Γ. Strong approximation for SL₂ over F (AdelicAlgebraicGroups §4.2, *strong-approximation-sufficiency*, whose hypotheses hold because SL₂ over F is connected, absolutely almost simple and simply connected with noncompact archimedean points `SL₂(ℝ)^{r₁} × SL₂(ℂ)^{r₂}`) makes SL₂(F)\SL₂(𝔸_F^∞)/K′_f a single point. By ArithmeticLocallySymmetricSpaces §ALS.0.7 the adelic quotient Y(K′_f) is then the single quotient Γ′\X, a manifold and an Eilenberg–MacLane space K(Γ′,1) by §ALS.0.9, with a finite Borel–Serre model by §ALS.1.6; by §ALS.1.5, H^i(Γ′,V) is the finite-dimensional Betti cohomology of the local system V on it. Apply §3.4 for every t ∈ ℕ^d, the realization comparison of §3.3, and §0.2 with the given a. Restriction H^i(Γ,V) → H^i(Γ′,V) is injective because corestriction after restriction is multiplication by [Γ:Γ′] (Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`), which is invertible in ℂ; this needs neither neatness nor normality. The constant depends on F, Γ and the chosen Γ′, never on t, i or a; the finitely many degrees i ≤ 3d are covered by one constant, and the higher ones vanish.

A proof of the cusp-form bound uses the following route. At the auxiliary level use §3.4 and the inequality dim S_κ ≤ dim H_cusp^q ≤ dim H^q of §4.1 for nontrivial coefficients. Set x = t+1. By §3.1, D(x) ≤ Δ and min x ≥ min κ/2. Apply §0.2 to Q to obtain Q(x) ≤ 2(Σc_s)Δ/min κ. Use the inclusion S_κ(K_f) ⊆ S_κ(K′_f) of §4.1 to pass the bound from K′_f to K_f. Increase the constant to include κ = (2,…,2) using finite-dimensionality; this is one tuple, not an infinite exceptional family.

*Needs:* §3.4; §4.1; §3.2; §3.3; §3.1; §0.2; Mathlib `groupCohomology`; Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`; AdelicAlgebraicGroups §4.2; ArithmeticLocallySymmetricSpaces §ALS.0.7; ArithmeticLocallySymmetricSpaces §ALS.0.9; ArithmeticLocallySymmetricSpaces §ALS.1.5; ArithmeticLocallySymmetricSpaces §ALS.1.6; ArithmeticLocallySymmetricSpaces §ALS.3.6.

**Checks.**

- No r₂ = 0 instance is produced by this proof, and none exists: for F = ℚ and Γ = SL₂(ℤ), dim H¹(Γ, Sym^k(ℂ²)) = `2 dim S_{k+2}(SL₂(ℤ)) + 1` for even k ≥ 2, which is 3 at k = 10, 5 at k = 22 and grows like k/6, while the right side with a = k+1 is the constant C.
- For F = ℚ(i), Γ = SL₂(ℤ[i]) and t = (n,n), the choice a = n+1 gives dim H^i(Γ, E_n) ≤ C(n+1); the choice a = 1 only gives C(n+1)², so the saving comes from the minimum.
- For t = (n,0) over an imaginary quadratic field, min_σ(t_σ+1) = 1 and the bound is C(n+1); the statement claims no saving when one coordinate stays fixed.
- At t = 0 the bound reads dim H^i(Γ, ℂ) ≤ C, a fixed Betti number.
- The ideal 𝔞 must be nonzero: for 𝔞 = 0 the kernel is trivial and Γ could be any subgroup, of infinite index; for 𝔞 = O_F the kernel is all of SL₂(O_F).

### 4.3 Parallel weights and the degree drop

Under §4.2, if κ_v = κ at every archimedean place, κ even and ≥ 2, then `dim S_κ(K_f) ≤ C_{F,K_f} κ^{d−1}`, d = [F:ℚ]. The exponent is d−1, with no ε loss. This follows from Δ(κ) = κ^d and min_v κ_v = κ, not from a separate limit theorem. (fu24, Theorem 1.2, p. 3, parallel-weight assertion.)

A proof uses the following route. Apply the parallel-size identity and the global inequality, keeping the same level-dependent constant.

*Needs:* §4.2; §3.1.

**Checks.**

- For signature (1,1), d = 3 and the exponent is 2, not 1: there are two place weights and three embedding weights, and at parallel κ = 4 the upper size is 4³/4 = 16.

### 4.4 The Bianchi linear upper bound

For imaginary quadratic F and every fixed compact open K_f, `dim S_κ(K_f) = O_{F,K_f}(κ)` for even κ ≥ 2. At every congruence level Γ ≤ SL₂(O_F), `dim H^i(Γ, E_n) = O_{F,Γ}(n+1)` for i = 1, 2, where E_n = Sym^n(ℂ²) ⊗ conjugate Sym^n(ℂ²) and n = κ/2−1. Cuspidal and interior dimensions satisfy the same bound by inclusion. (fu24, Theorem 1.2 and Corollary 1.3, p. 3; §7, p. 24.)

A proof uses the following route. Use d = 2 in §4.3 for cusp forms. Use the ordinary-cohomology form of §4.2 with t = (n,n) and a = n+1; E_n is `weightRep Γ` at the constant tuple n. Convert κ = 2(n+1).

*Needs:* §4.3; §4.2; §3.1.

**Checks.**

- κ = 6 corresponds to E₂, of dimension 9.

### Examples

For parallel weights at signature (1,1), Δ/min κ = κ³/κ = κ². For F imaginary quadratic, Δ/min κ = κ²/κ = κ, and the bound is linear in n+1.

### Dependencies

ArithmeticLocallySymmetricSpaces §ALS.5b.1; ArithmeticLocallySymmetricSpaces §ALS.5b.4; ArithmeticLocallySymmetricSpaces §ALS.5b.5; AutomorphicFormsOnReductiveGroups §1.1; AutomorphicFormsOnReductiveGroups §§2.3–2.4; AutomorphicFormsOnReductiveGroups §§5.2–5.4; AdelicAlgebraicGroups §4.2; ArithmeticLocallySymmetricSpaces §ALS.0.7; ArithmeticLocallySymmetricSpaces §ALS.0.9; ArithmeticLocallySymmetricSpaces §ALS.1.5; ArithmeticLocallySymmetricSpaces §ALS.1.6; ArithmeticLocallySymmetricSpaces §ALS.1.8; ArithmeticLocallySymmetricSpaces §ALS.3.6; Mathlib `groupCohomology`; Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`.

## Layer 5: Bianchi boundary and sharpness

### 5.1 Cohomology of a Bianchi cusp torus

Let Γ be a neat Bianchi congruence subgroup and T one torus component of its Borel–Serre boundary. With E_n, n ≥ 0, as above, dim H^j(T, E_n) is 1, 2, 1 for j = 0, 1, 2 and zero otherwise. These dimensions use complex coefficients and unipotent cusp monodromy, not a trivial rank-(n+1)² local system. For c cusp components the boundary dimensions are c, 2c, c. At a non-neat cusp with a finite stabilizer acting through a nontrivial unit, the boundary cohomology is the invariants of this computation, and these equalities are not asserted. (fu24, Corollary 1.3 and equation (2), pp. 2–3; fgt10, §1, pp. 3–4, equations (1.2)–(1.8).)

A proof uses the following route. Import the boundary stratum and its arithmetic unipotent group from ArithmeticLocallySymmetricSpaces Layers 2 and 4. At a neat Bianchi cusp this group is a lattice in ℂ ≃ ℝ². Two lattice generators z₁, z₂ give commuting nilpotent logarithms z_i e⊗1 + conjugate(z_i) 1⊗e on E_n. Real linear independence makes the 2×2 coefficient matrix invertible over ℂ. The Koszul complex of exp(N_i)−1 is isomorphic to that of N_i, since (exp(N_i)−1)/N_i is an invertible polynomial in N_i. Change generators to e⊗1 and 1⊗e. On Sym^n the raising operator has kernel and cokernel of dimension one, including n = 0: in the monomial basis of Tau Ceti `Module.Basis.symmetricPower` it sends `x^(n−j) y^j` to `j·x^(n−j+1) y^(j−1)`, so its kernel is the line of x^n and its image is spanned by every monomial except y^n. The tensor product of the two one-operator complexes has cohomology dimensions 1, 2, 1 by the Künneth formula over a field. Sum over the c tori.

*Needs:* §3.1; ArithmeticLocallySymmetricSpaces §ALS.0.7; ArithmeticLocallySymmetricSpaces §ALS.2.5; ArithmeticLocallySymmetricSpaces §ALS.2.8; ArithmeticLocallySymmetricSpaces §§ALS.4.5–ALS.4.7; Tau Ceti `TauCeti.symPowerRep`; Tau Ceti `Module.Basis.symmetricPower`.

**Checks.**

- For n = 0 the two operators vanish on a one-dimensional space, giving 1, 2, 1.
- For n = 2, H¹(T, E₂) has dimension 2, not 18.
- For z₁ = 1 and z₂ = i, the change-of-logarithms matrix (1 1; i −i) has determinant −2i ≠ 0. For n = 2 the Koszul complex has dimensions (9,18,9), differential ranks (8,8) and cohomology (1,2,1); for n = 1 and n = 3 the ranks are (3,3) and (15,15), again with cohomology (1,2,1).

### 5.2 The bounded-boundary support bridge

For a neat Bianchi quotient Y with c cusps and E_n, n ≥ 0, write H_!^i = im(H_c^i → H^i). The support triangle gives 0 ≤ dim H^i − dim H_!^i ≤ b_i and `0 ≤ dim H_c^i − dim H_!^i ≤ b_{i−1}`, where (b₀,b₁,b₂) = (c,2c,c). Hence |dim H_c^i − dim H^i| ≤ 3c for i = 1, 2, uniformly in n. The cuspidal cohomology H_cusp^i injects into H_!^i (ArithmeticLocallySymmetricSpaces §ALS.5b.5); only this inclusion is used. Poincaré–Lefschetz duality pairs the two interior degrees with the dual coefficients. For n = 0, the degree-two restriction to the boundary has a one-dimensional cokernel on a connected quotient; for n > 0 the degree-three compact-support term vanishes. The nontrivial-coefficient surjectivity statement is not asserted at n = 0. Fu's equation (2) and Corollary 1.3 write compact-support cohomology where the comparison with cusp forms needs cuspidal or interior cohomology; the compact-support growth is derived here through the bounded boundary maps. (fu24, §1, equation (2), p. 2; Corollary 1.3, p. 3; fgt10, §1, pp. 3–4, equations (1.3)–(1.6) and the discussion of degree two.)

A proof uses the following route. Take the long exact sequence of the parent support triangle. The kernel of H_c^i → H^i is an image of `H^{i−1}(∂)`, and the cokernel of H_c^i → H^i is a subspace of H^i(∂). Insert §5.1 and subtract the two nonnegative errors; their difference lies in `[−b_i, b_{i−1}]`, so 3c is a safe bound. The kernel of the restriction H^i → H^i(∂) is H_!^i by the same long exact sequence; fgt10 (1.3) calls this kernel the cuspidal cohomology, and the automorphic cuspidal cohomology of ArithmeticLocallySymmetricSpaces §ALS.5b.5 is a subspace of it. Keep the ordinary, interior and compact-support maps as distinct objects. Import the parent finite-level duality before the automorphic interpretation. H_c³ is dual to H⁰ with dual coefficients; the latter is zero for n > 0 and one-dimensional in the connected trivial case.

*Needs:* §5.1; ArithmeticLocallySymmetricSpaces §ALS.4.1; ArithmeticLocallySymmetricSpaces §ALS.5a.2; ArithmeticLocallySymmetricSpaces §ALS.5b.5; §4.1.

**Checks.**

- At n = 0 a connected quotient has H_c³ ≃ ℂ; a proof that deletes it would give a false boundary surjectivity statement.
- At a neat Bianchi level and n = 0, degree-one boundary restriction has image of dimension c, half of b₁ = 2c, as in the weight-two Eisenstein count of BianchiModularForms §1.2; hence dim H¹ − dim H¹_! = c ≤ 2c, and compact support cannot be identified with the interior image merely by notation.

### 5.3 Classical fixed-type dimension estimate

Fix N ≥ 1 and a finite-dimensional complex representation σ of G_N = SL₂(ℤ/Nℤ) with σ^ι ≃ σ, where ι = diag(−1,1) and σ^ι = σ∘Ad ι; this holds for the restriction to G_N of every representation of GL₂(ℤ/Nℤ). G_N acts on S_k(Γ(N)) by g·f = f|_kγ⁻¹ for any lift γ ∈ SL₂(ℤ) of g. Let U_N be the upper unipotent subgroup and S₃ = (0 −1;1 −1), S₄ = (0 −1;1 0). For every k ≥ 2 with σ(−I) = (−1)^k on σ, `dim Hom_{G_N}(σ, S_k(Γ(N))) = (k−1)dim σ/12 − ½ dim σ^{U_N} + ε_k tr σ(S₄) + μ_k tr σ(S₃) + δ_{k,2} dim σ^{G_N}`, where `ε_k = (−1)^{k/2}/4` for k even and 0 for k odd, and μ_k is 0, −1/3, 1/3 for k ≡ 1, 2, 0 mod 3. In particular the multiplicity is `(k−1)dim σ/12 + O_{N,σ}(1)`, uniformly in k along the admitted parity classes, and for a fixed finite collection of σ one error constant works for all of them. FGT's Proposition 4.18 states the formula without the hypothesis σ^ι ≃ σ, which is needed (Checks). (fgt10, §4.3, Proposition 4.18, pp. 25–26; serre77, I §1.5.3, p. 20 and I §4.2 Example (c), p. 52, for the amalgam; II §2.8, p. 169, for the cohomology exact sequence of an amalgam.)

A proof uses the following route. Use ModularSymbolsPadicLFunctions §0.7 at Γ(N): its compatibility with the normaliser action of SL₂(ℤ) makes `S_k ⊕ S̄_k ≃ H¹_par(Γ(N), V_{k−2}(ℂ))` an isomorphism of G_N-representations for every N ≥ 1. Since f ↦ f^c(z) = overline(f(−z̄)) is antilinear and intertwines γ with ιγι, S̄_k is S_k twisted by conjugation by ι; hence `dim Hom_{G_N}(σ, H¹_par) = m(σ) + m(σ^ι)`, where m(σ) = `dim Hom_{G_N}(σ, S_k(Γ(N)))`. ModularForms §10C supplies the classical spaces, the automorphy line bundle and Riemann–Roch. Apply the genus-zero modular-orbifold cohomology calculation: the cusp stabilizer contributes its unipotent-invariant term and the two elliptic stabilizers contribute finite-order character traces. The amalgam `SL₂(ℤ) ≅ ℤ/4 ∗_{ℤ/2} ℤ/6` and its cohomology exact sequence give `dim H¹(SL₂(ℤ), W) = dim W − dim W^{ℤ/4} − dim W^{ℤ/6} + dim W^{SL₂(ℤ)}` when −I acts trivially on W; applied to the induced coefficient system, they compute m(σ) + m(σ^ι), hence 2m(σ) under the hypothesis σ^ι ≃ σ. Passing from Γ(N) to SL₂(ℤ) with the induced coefficient system is Shapiro's isomorphism (Mathlib `groupCohomology.coindIso`). The hypothesis σ^ι ≃ σ is used exactly here: without it the cohomology computes only m(σ) + m(σ^ι). This explicit calculation is the fixed-type refinement owned here; ordinary dimension formulas alone do not identify isotypic multiplicities. Separate the linear term (k−1)dim σ/12. The elliptic coefficients range over finitely many residue classes modulo twelve, all fixed-type traces and invariant dimensions are constant, and the k = 2 correction is bounded.

The API includes the following facts; the first two are the group-theoretic inputs of the route.

- SL₂(ℤ) is the amalgamated product of ⟨S₄⟩, cyclic of order 4, and ⟨−S₃⟩, cyclic of order 6, over their intersection ⟨−I⟩, of order 2: the map to SL₂(ℤ) from Mathlib's `Monoid.PushoutI` of the two inclusions of ⟨−I⟩ is an isomorphism (serre77, I §1.5.3, p. 20, and I §4.2 Example (c), p. 52). A proof lets SL₂(ℤ) act on the graph X formed by the translates of the arc of the unit circle from `e^{πi/3}`, fixed by S₃, to i, fixed by S₄; that X is a tree on which SL₂(ℤ) acts without inversion with this arc as fundamental domain follows from the standard fundamental domain (Mathlib `ModularGroup.exists_smul_mem_fd` and `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo`); the stabilizers of the two endpoints and of the arc are ⟨−S₃⟩, ⟨S₄⟩ and ⟨−I⟩; FreeGroupsAndLimitGroups §4.8 then gives the graph of groups on one edge, and §4.5 identifies its fundamental group with `Monoid.PushoutI`.
- For an amalgam G = G₁ ∗_H G₂ of groups along injective maps from H and a representation W of G over a commutative ring, the sequence `0 → W^G → W^{G₁} ⊕ W^{G₂} → W^H → H¹(G,W) → H¹(G₁,W) ⊕ H¹(G₂,W)` is exact, where the second map is (a,b) ↦ a−b and the third sends u ∈ W^H to the class of the crossed homomorphism equal to g ↦ gu−u on G₁ and to 0 on G₂ (serre77, II §2.8, example after Proposition 13, p. 169, which gives the sequence in all degrees). A proof uses only the universal property `Monoid.PushoutI.lift`, applied to sections of W⋊G → G: a crossed homomorphism on G is the same as a pair of crossed homomorphisms on G₁ and G₂ agreeing on H. When G₁ and G₂ are finite and their orders are invertible in the coefficient ring, the last term vanishes by averaging.
- Hence, for a finite-dimensional complex representation W of SL₂(ℤ) on which −I acts trivially, `dim H¹(SL₂(ℤ), W) = dim W − dim W^{⟨S₄⟩} − dim W^{⟨−S₃⟩} + dim W^{SL₂(ℤ)}`; if −I acts by −1, then `W^{⟨−I⟩} = 0` and H¹(SL₂(ℤ), W) = 0.
- For σ ι-stable and k with σ(−I) = (−1)^k, the multiplicity formula above holds; for σ(−I) = −(−1)^k the multiplicity is zero.

*Needs:* ModularForms §10C; ModularSymbolsPadicLFunctions §0.7; Mathlib `groupCohomology`; Mathlib `groupCohomology.coindIso`; Mathlib `Monoid.PushoutI`; Mathlib `Monoid.PushoutI.lift`; Mathlib `ModularGroup.exists_smul_mem_fd`; Mathlib `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo`; FreeGroupsAndLimitGroups §4.5; FreeGroupsAndLimitGroups §4.8.

**Checks.**

- Taking the trivial type recovers the admitted-parity leading term for level-one cusp forms.
- Opposite central parity gives zero multiplicity and is excluded from the linear estimate.
- For N = 1, σ = 1 and k = 12, the periodic expression is 11/12 − 1/2 + 1/4 + 1/3 = 1; at k = 2 it is 1/12 − 1/2 − 1/4 − 1/3 + 1 = 0.
- At N = 3, k = 4: X(Γ(3)) has genus 0 and four regular cusps, so dim S₄(Γ(3)) = 3·(0−1) + (4/2−1)·4 = 1. Since S₄(SL₂(ℤ)) = 0, SL₂(𝔽₃) acts on this line by a nontrivial character, one of the two order-three characters ω, ω̄ (trivial on −I ∈ Q₈, as k is even); so m(ω) and m(ω̄) are 1 and 0 in some order. Conjugation by ι inverts T = (1 1;0 1), so ω^ι = ω̄, and H¹_par(Γ(3), V₂(ℂ)) ≃ ω ⊕ ω̄ gives 1 for both: a route through the cohomology character alone cannot separate them. This is the negative control for the hypothesis σ^ι ≃ σ: for σ = ω (`dim σ^{U_3} = 0`, σ(S₄) = 1 as S₄ ∈ Q₈, μ_4 = 0) the periodic expression gives 3/12 + 1/4 = ½, not an integer, whereas for the ι-stable σ = ω ⊕ ω̄ it gives 6/12 + 2/4 = 1 = m(ω) + m(ω̄).
- For W = ℂ the amalgam formula gives 1−1−1+1 = 0, as it must since the abelianisation of SL₂(ℤ) is ℤ/12. For W = Sym²(ℂ²), on which −I acts trivially, S₄ has eigenvalues −1, 1, −1 and −S₃ has eigenvalues `e^{∓2πi/3}`, 1, `e^{±2πi/3}`, so the formula gives 3−1−1+0 = 1 = 2 dim S₄(SL₂(ℤ)) + 1; for W = Sym¹⁰(ℂ²) it gives 11−5−3+0 = 3, the value of the Check of §4.2. For W = ℂ², on which −I acts by −1, H¹ = 0, whereas the formula without the hypothesis on −I would give 2−0−0+0 = 2.
- In the amalgam, ⟨S₄⟩ ∩ ⟨−S₃⟩ = ⟨−I⟩, since S₄² = (−S₃)³ = −I: amalgamating over the trivial group instead would make S₄² and (−S₃)³ distinct, and the resulting group would have abelianisation ℤ/4 × ℤ/6 of order 24 rather than ℤ/12.
- At N = 2, G₂ ≅ S₃ and every type is ι-stable (ι ≡ I mod 2). Γ(2) has genus 0, three cusps and no elliptic points, so dim S_k(Γ(2)) = k/2 − 2 for even k ≥ 4. At k = 6 the trivial, sign and two-dimensional types (U₂-invariants 1, 0, 1; S₄-traces 1, −1, 0; S₃-traces 1, 1, −1) give 5/12 − 1/2 − 1/4 + 1/3 = 0, 5/12 + 1/4 + 1/3 = 1 and 10/12 − 1/2 − 1/3 = 0, total 0 + 1 + 2·0 = 1; at k = 8 they give 0, 0 and 1, total 2. A formula with the sign of ε_k reversed gives 1/2 for the trivial type at k = 6.

### 5.4 Ramified finite local types

Fix imaginary quadratic F, the set R of rational primes ramified in F, ν_ℓ = v_ℓ(disc F), and the quadratic local character ω_ℓ. For ℓ ∈ R use the three local classes of fgt10 Definition 4.3: unramified principal series, PS(α, ω_ℓβ) with α, β unramified, and `AI_{F_ℓ/ℚ_ℓ}(θ_ℓ)` up to unramified twist with θ_ℓ/θ_ℓ^c unramified quadratic. For the supercuspidal class choose the minimal model of Lemma 4.19: a character θ′_ℓ of the unramified quadratic extension with θ′_ℓ/(θ′_ℓ)^τ = ω_ℓ∘N and conductor exponent ν_ℓ, and choose θ_ℓ giving the same induction. Construct the finite `GL₂(ℤ/ℓ^{ν_ℓ}ℤ)` types of these fixed classes and restrict them to SL₂. With S₃ = (0 −1;1 −1) and S₄ = (0 −1;1 0) the order-three and order-four elements, prove the following dimensions, invariant dimensions, traces and central parities, including ℓ = 2 with ν₂ = 2 or 3. (fgt10, Definition 4.3, p. 20; discussion following Proposition 4.18 and Lemma 4.19, pp. 25–26.)

A proof uses the following route. Construct the principal-series type by finite Borel induction and use the uniqueness of the supercuspidal type (GL2AutomorphicRepresentationsAndTransfer §R16.2.9) to identify its explicit finite model. Compute characters by the action on lines for principal series and by the finite cuspidal or dyadic type model for supercuspidals, as in fgt10 Lemma 4.19. Unramified twists are trivial on GL₂(ℤ_ℓ).

The API includes the following facts.

- The unramified type is trivial, of dimension 1, with one unipotent invariant, both traces 1 and central parity +1.
- The principal-series type has dimension `ℓ^{ν_ℓ−1}(ℓ+1)`, two upper-unipotent invariants and parity ω_ℓ(−1); its S₃ trace is 0 for ℓ ≡ 2 mod 3, 1 for ℓ = 3 and 2 for ℓ ≡ 1 mod 3, and its S₄ trace is `2(−1)^{(ℓ−1)/4}` for ℓ ≡ 1 mod 4 and zero otherwise.
- The supercuspidal type has dimension `ℓ^{ν_ℓ−1}(ℓ−1)` and no upper-unipotent invariants; its S₃ trace is 0 for ℓ ≡ 1 mod 3, −2 for odd ℓ ≡ 2 mod 3 or (ℓ,ν_ℓ) = (2,3), −1 for ℓ = 3 and 2 for (ℓ,ν_ℓ) = (2,2).
- The supercuspidal S₄ trace is `2(−1)^{(ℓ−3)/4}` for ℓ ≡ 3 mod 4 and zero otherwise; its parity is −ω_ℓ(−1), except at (ℓ,ν_ℓ) = (2,2), where it is −1.
- For tensor products, dimensions, central signs and character values multiply, and upper-unipotent invariants vanish as soon as a supercuspidal factor occurs.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §R16.2.9.

**Checks.**

- At ℓ = 2, ν₂ = 2, the principal-series type has dimension 6 and traces (S₃,S₄) = (0,0); the supercuspidal type has dimension 2 and traces (2,0), with central parity −1.
- At ℓ = 2, ν₂ = 3, the corresponding dimensions are 12 and 4, while the supercuspidal traces are (−2,0).
- At ℓ = 3 the principal-series type has dimension 4, two unipotent invariants and traces (1,0); the supercuspidal type has dimension 2, no unipotent invariants and traces (S₃,S₄) = (−1,2), since the S₄ formula gives 2(−1)^0 = 2 at ℓ = 3, and central parity −ω₃(−1) = +1. Independently, this type factors through GL₂(𝔽₃)/Q₈ ≅ S₃, whose kernel contains S₄, so σ(S₄) = 1; a sign slip giving −2 would force σ(S₄) = −1 although S₄ lies in the kernel. At ℓ = 7 the same formula gives 2(−1)^1 = −2.
- A twist by a character of conductor beyond ν_ℓ changes the compact type and is excluded by the fixed minimal model; an unramified twist has compact character 1.

### 5.5 The SL₂ base-change multiplicity count

For imaginary quadratic F and n ≥ 0, let 𝒜_ℚ(n) consist of the cuspidal GL₂/ℚ classes with holomorphic weight n+2, unramified outside R and with the three ramified local classes of §5.4, and let R(π) ⊆ R be the primes where π is ramified. Put `Z_F(n) = Σ_{π∈𝒜_ℚ(n)} 2^{−|R(π)|}`. Write h_L for the class number of an imaginary quadratic field L, and `ν_{L,n} = 1` except that `ν_{ℚ(i),n}` is 1 exactly for n odd and `ν_{ℚ(√−3),n}` is 1 exactly for n ≡ 2 mod 3 (and 0 otherwise). Let ℒ(F) be the set of imaginary quadratic fields L ≠ F with LF/F unramified, and R_L the ramified primes of L. For a finite-index open determinant subgroup 𝒟 ⊆ Ô_F^× with 𝒟 ∩ O_F^× = {1}, let X(𝒟) be the characters of the finite quotient `𝔸_{F,f}^×/(F^×𝒟)`, with |X(𝒟)| ≥ 1 since it contains the trivial character, and `𝒜_F^{bc}(n,𝒟)` the cuspidal twisted-base-change classes of infinity type corresponding to E_n with K(𝒟)-fixed vectors, where K(𝒟) = {g ∈ GL₂(Ô_F) : det g ∈ 𝒟}. Prove `|𝒜_F^{bc}(n,𝒟)|/|X(𝒟)| = Z_F(n) − ν_{F,n} h_F/2 − Σ_{L∈ℒ(F)} ν_{L,n} 2^{|R|−|R_L|−2} h_L` and that the normalized number of classes fixed by the twist `ω_L∘N_{F/ℚ}` is `ν_{L,n} 2^{|R|−|R_L|−2} h_L`. Define H_bc¹ as the image in ordinary group cohomology of these cuspidal base-change classes, restricted to SL₂(𝔸_F), under the injection `ι_{K_f}` of §4.1 at the level K_f = SL₂(Ô_F), which is not neat; taking the principal ideal component gives `dim H_bc¹(SL₂(O_F), E_n) = Z_F(n) − ν_{F,n} h_F/2`. This is the specialized finite-level count, including the CM correction. (fgt10, §3.3, (3.9)–(3.10), p. 17; §4.1, (4.4), pp. 18–19; Definition 4.3, p. 20; Propositions 4.10–4.11, pp. 22–23.)

A proof uses the following route. Use quadratic base-change cuspidality and descent fibres (GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.6), then identify the admissible local classes with the finite types of §5.4. Count non-CM fibres with weight `2^{−|R(π)|}`; count the quadratic self-twist exceptions by their ideal classes and the unit constraints encoded in ν. Apply character orthogonality to the X(𝒟)-action on normalized eigenforms: traces are fixed-class counts; in the principal ideal component all the quadratic characters evaluate to +1, cancelling the displayed ℒ(F) corrections.

The API includes the following facts.

- Z_F(n) is a finite sum of the weights `2^{−|R(π)|}`, and the normalized count `|𝒜_F^{bc}(n,𝒟)|/|X(𝒟)|` is given by the displayed formula for every admissible 𝒟.
- The normalized number of classes fixed by `ω_L∘N_{F/ℚ}` is `ν_{L,n} 2^{|R|−|R_L|−2} h_L` for L ∈ ℒ(F).
- `dim H_bc¹(SL₂(O_F), E_n) = Z_F(n) − ν_{F,n} h_F/2`, and H_bc¹ lies in the image of the cuspidal classes.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.6; §5.4; §4.1.

**Checks.**

- A non-CM fibre with |R(π)| = 2 has four descents, each weighted 1/4, so its total normalized contribution is 1, not 4.
- For F = ℚ(i), ℒ(F) is empty (h_F = 1, so F has no unramified quadratic extension) and the principal-component correction is `ν_{F,n}/2`: it is 0 at n = 0 and 1/2 at n = 1.
- For F = ℚ(√−3), `ν_{F,n}` at n = 0, 1, 2 is (0,0,1); the CM correction is therefore (0,0,1/2), not a constant in n.

### 5.6 Positive linear base-change contribution

For imaginary quadratic F, let R be the set of rational primes ramified in F, s = |R|, and ν_ℓ = v_ℓ(disc F). Put `A_F = (1/24) ∏_{ℓ∈R} (ℓ^{ν_ℓ}+1)`, and put `B_F = 2^{s−4}` if every odd ℓ ∈ R is 1 modulo 4, otherwise B_F = 0. The base-change subspace at SL₂(O_F) has dimension `(A_F + B_F(−1)^{n+1})(n+1) + R_F(n)`, where R_F(n) is bounded independently of n. Moreover A_F > B_F ≥ 0, so this cuspidal subspace has dimension ≥ c_F(n+1) for all sufficiently large n. The specialized multiplicity count, the finite types and positivity are proved here, using the general transfer, descent fibres and type uniqueness. FGT state nonnegativity of the leading coefficient; strict positivity follows from the displayed coefficients and is what the lower bound needs. (fgt10, §4.3, Theorem 4.17, pp. 24–25; Proposition 4.18 and Lemma 4.19, pp. 25–26; §4.4, Corollary 4.20, p. 27; fu24, §1, pp. 2–3, base-change discussion.)

A proof uses the following route. Use the SL₂ base-change multiplicity count of §5.5 and the ramified finite types of §5.4. Use the equivariant classical modular-form dimension calculation of §5.3 (FGT Proposition 4.18), whose hypothesis σ^ι ≃ σ holds because every summed type is a tensor product of §5.4 types and so the restriction of a GL₂(ℤ/Nℤ)-representation: its leading term is (k−1)dim σ/12, while the unipotent invariant, elliptic trace and weight-two terms are bounded for the fixed finite types. Sum the finitely many admitted local types with the base-change fibre multiplicities, as in FGT Theorem 4.17. Their leading coefficients are A_F ± B_F; the class-number and exceptional CM corrections are bounded. B_F ≠ 0 forces 2 ∈ R: write F = ℚ(√−u) with u > 0 squarefree (u is a radicand, not the degree d = 2); if every odd ramified prime, that is every odd prime dividing u, is 1 modulo 4, then u is 1 or 2 modulo 4, so disc(F) = −4u and 2 ramifies. Then `(2^{ν₂}+1)/2 ≥ 5/2` and each odd factor (ℓ+1)/2 ≥ 3 give `A_F/B_F ≥ (5/3)·3^{s−1} > 1`. If B_F = 0, positivity is immediate. Take a positive fraction of A_F − B_F and absorb the bounded R_F(n) by choosing one threshold. No asymptotic leading constant is inferred for the entire cuspidal space.

*Needs:* §5.5; §5.4; §5.3.

**Checks.**

- For F = ℚ(i), s = 1 and ν₂ = 2, so A_F = 5/24, B_F = 1/8 and A_F − B_F = 1/12 > 0.
- The radicand u of F = ℚ(√−u) is not the degree d: for u = 1, 2, 5 the discriminants are −4, −8, −20, with ν₂ = 2, 3, 2, and A_F/B_F = (5/24)/(1/8) = 5/3, (3/8)/(1/8) = 3 and (5/4)/(1/4) = 5, all greater than 1 and at least `(5/3)·3^{s−1}`; reading −4d with d = 2 would give −8 for ℚ(i). For u = 3 and u = 7 the discriminants are −3 and −7, 2 is unramified, and B_F = 0, with A_F = 1/6 and 1/3.

### 5.7 Lower bounds at the admitted levels

Let F be imaginary quadratic and Γ any congruence subgroup of SL₂(O_F). There exist `c_{F,Γ} > 0` and n₀ such that `dim H^i(Γ, E_n) ≥ c_{F,Γ}(n+1)` for i = 1, 2 and all n ≥ n₀; the injected base-change subspace is represented by cuspidal automorphic forms. Restriction from SL₂(O_F) is injective because corestriction after restriction is the nonzero scalar [SL₂(O_F):Γ]. At neat Γ this subspace lies in H_cusp¹, which is contained in H_!¹, and gives the same lower bound for both. Also dim H_cusp² = dim H_cusp¹: in the decomposition of ArithmeticLocallySymmetricSpaces §ALS.5b.5 every cuspidal π contributing in degree one or two has archimedean component `π_{2n+2,0}`, whose (𝔤,K)-cohomology against E_n is one-dimensional in both degrees (§4.1), so each π contributes m(π)dim(π^∞)^K to both. Finally dim H_!² = dim H_!¹ by self-dual interior duality, so H_cusp² and H_!² satisfy the same lower bound. At a non-neat Γ the degree-two bound is obtained from a neat normal subgroup by taking invariants. The cusp-form interpretation at the corresponding level follows by inclusion of fixed vectors, including at non-neat level. (fgt10, Theorem 4.17, pp. 24–25; Corollary 4.20, p. 27; §1, pp. 3–4; fu24, Corollary 1.3, p. 3.)

A proof uses the following route. Apply the maximal-level base-change count and finite-index restriction and corestriction in ordinary group cohomology (Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`); this step needs no neatness (fgt10, §3.2, pp. 16–17). Restrict the cuspidal automorphic forms to the smaller level; at neat Γ identify their cohomological images with the parent's cuspidal carrier. At neat levels apply the self-dual interior pairing for degree two; for cusp-form dimensions use κ = 2(n+1). For degree two at an arbitrary congruence Γ containing the principal congruence kernel of 𝔞, choose prime ideals 𝔭 and 𝔮 of O_F of distinct residue characteristics p ≠ q and let Γ′ be the principal congruence subgroup of level 𝔞𝔭𝔮, normal in SL₂(O_F) and contained in Γ. Its adelic level is a product whose factors at 𝔭 and 𝔮 are pro-p and pro-q, so it is neat by ArithmeticLocallySymmetricSpaces §ALS.0.11; by strong approximation (AdelicAlgebraicGroups §4.2) and §ALS.0.7 its parent quotient is the single quotient Γ′\X, whose Betti cohomology is H^i(Γ′,·) by §ALS.1.5. Put Q = Γ/Γ′. In characteristic zero H²(Γ,E_n) = H²(Γ′,E_n)^Q, and H_!²(Γ′,E_n) is a Q-stable subspace. The interior pairing H_!¹(Γ′,E_n) × H_!²(Γ′,E_n^*) → H_c³(Γ′\X, ℂ) = ℂ is perfect and Q-equivariant, since Q acts on the connected oriented 3-manifold Γ′\X by orientation-preserving isometries and hence trivially on H_c³. Because E_n ≅ E_n^* (the symplectic form on ℂ² and its conjugate) and invariants of a finite group in characteristic zero have the same dimension in a representation and its dual, dim H²(Γ,E_n) ≥ dim H_!²(Γ′,E_n)^Q = dim H_!¹(Γ′,E_n)^Q. The base-change classes restricted from SL₂(O_F) are Q-invariant, interior at Γ′ and of dimension at least c(n+1).

*Needs:* §5.6; Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`; ArithmeticLocallySymmetricSpaces §ALS.1.8; ArithmeticLocallySymmetricSpaces §ALS.3.6; ArithmeticLocallySymmetricSpaces §ALS.0.11; AdelicAlgebraicGroups §4.2; ArithmeticLocallySymmetricSpaces §ALS.0.7; ArithmeticLocallySymmetricSpaces §ALS.1.5; ArithmeticLocallySymmetricSpaces §ALS.5b.5; §4.1; §5.2 and ArithmeticLocallySymmetricSpaces §ALS.5a.2 for the interior and degree-two conclusions.

**Checks.**

- For Γ = SL₂(O_F), the index is 1 and restriction followed by corestriction is the identity; the lower bound applies despite torsion in Γ.
- For Γ = SL₂(O_F), −I ∈ Γ acts on E_n by (−1)^n(−1)^n = 1, so the central character does not kill the cohomology; on Sym^n(ℂ²) ⊗ conjugate Sym^m(ℂ²) with n+m odd every H^i(Γ,·) vanishes.
- If Q acted on Γ′\X reversing orientation, the dual of H_!¹ would be H_!² twisted by the orientation character and its Q-invariants could be smaller; for the trivial Q-module the invariants have dimension 1, while a sign twist would give 0. The orientation-preserving action of the connected group SL₂(ℂ) is what makes the degree-two invariant count equal.

### 5.8 Bianchi growth in four support conventions

Let F be imaginary quadratic. For every congruence subgroup Γ ≤ SL₂(O_F), prove `bianchi_groupCohomology_linear_growth`: there exist c > 0, C and n₀ such that for n ≥ n₀ and i ∈ {1,2} the ordinary group cohomology H^i(Γ, E_n), with E_n = `weightRep Γ` at the constant tuple n, is finite-dimensional and c(n+1) ≤ dim H^i(Γ, E_n) ≤ C(n+1). For neat congruence Γ, there exist 0 < c ≤ C and n₀ such that for n ≥ n₀ and i = 1, 2, c(n+1) ≤ dim H_cusp^i(Γ, E_n) ≤ dim H_!^i(Γ, E_n) ≤ C(n+1), and the same two-sided inequalities, after changing c, C and n₀, hold for H_c^i. Equivalently these dimensions have two-sided linear growth in even κ = 2(n+1). At an arbitrary fixed adelic level the roadmap asserts the upper bound alone for cusp forms. All constants depend on the field and the fixed level. There is no claim of a ratio tending to a limit; Fu's Corollary 1.3 is the two-sided growth order, not an asymptotic. (fu24, Corollary 1.3, p. 3; fgt10, Theorem 4.17, pp. 24–25 and Corollary 4.20, p. 27.)

A proof uses the following route. For ordinary cohomology at every congruence level combine the upper bound of §4.4 with the lower bound of §5.7 in degrees one and two. At neat levels combine §4.4 and §5.7 for the cuspidal and interior spaces in degrees one and two; ordinary cohomology contains the interior subspace and has the linear upper bound. Compact-support cohomology surjects onto the interior image, and §5.2 supplies a uniform upper discrepancy; equivalently use its 3c bound with ordinary dimensions. Absorb the fixed boundary constants by enlarging the threshold and the upper constant.

*Needs:* §4.4; §5.7; §5.2.

**Checks.**

- For F = ℚ(i) and Γ = SL₂(ℤ[i]), the base-change part of H¹ has dimension `(5/24 + (−1)^{n+1}/8)(n+1) + O(1)` by §5.6; at n = 99 the leading term is (1/3)·100 ≈ 33.3 and at n = 100 it is (1/12)·101 ≈ 8.4. The lower-bound constant obtained from base change alone is therefore at most 1/12, and the parity oscillation shows why the statement asserts two constants rather than a limit of dim/(n+1).
- The threshold n₀ is necessary: H¹(SL₂(ℤ[i]), ℂ) = 0 because the abelianization of SL₂(ℤ[i]) is finite, so no c > 0 works at n = 0.

### Examples

For F = ℚ(i), the base-change slopes are 5/24 ± 1/8, hence 1/3 and 1/12; the full cusp space can be larger. For F = ℚ(√−2) they are 3/8 ± 1/8, hence 1/2 and 1/4.

### Dependencies

ArithmeticLocallySymmetricSpaces §ALS.0.7; ArithmeticLocallySymmetricSpaces §ALS.0.11; ArithmeticLocallySymmetricSpaces §ALS.1.5; ArithmeticLocallySymmetricSpaces §ALS.1.8; ArithmeticLocallySymmetricSpaces §ALS.2.5; ArithmeticLocallySymmetricSpaces §ALS.2.8; ArithmeticLocallySymmetricSpaces §ALS.3.6; ArithmeticLocallySymmetricSpaces §§ALS.4.5–ALS.4.7; ArithmeticLocallySymmetricSpaces §ALS.4.1; ArithmeticLocallySymmetricSpaces §ALS.5a.2; ArithmeticLocallySymmetricSpaces §ALS.5b.5; AdelicAlgebraicGroups §4.2; Tau Ceti `TauCeti.symPowerRep`; Tau Ceti `Module.Basis.symmetricPower`; Tau Ceti `TauCeti.groupCohomology.map_subtype_id_comp_corestriction`; ModularForms §10C; ModularSymbolsPadicLFunctions §0.7; Mathlib `groupCohomology`; Mathlib `groupCohomology.coindIso`; Mathlib `Monoid.PushoutI`; Mathlib `Monoid.PushoutI.lift`; Mathlib `ModularGroup.exists_smul_mem_fd`; Mathlib `ModularGroup.eq_smul_self_of_mem_fdo_mem_fdo`; FreeGroupsAndLimitGroups §4.5; FreeGroupsAndLimitGroups §4.8; GL2AutomorphicRepresentationsAndTransfer §R16.2.9; GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.6.

## Downstream consumers

Fixed-level automorphic multiplicity applications consume §4.2 through Δ and the minimum place weight. Completed-module applications consume §2.6 through skew rank and a single weight-and-degree-uniform proper-face polynomial. Bianchi cohomology applications consume §5.8 with its neatness, congruence and support hypotheses. These estimates supply a growth order, not a leading constant for the full cuspidal space.

## References

Locators use the versions below; journal information identifies the work rather than changing its pagination.

- **fu24.** Weibo Fu, [Sharp bounds for multiplicities of Bianchi modular forms](https://arxiv.org/pdf/2201.11190v2), arXiv:2201.11190v2, pp. 1–25; published Annals of Mathematics 200 (2024), 123–152. The local estimates use §§3–4 and §6; the global estimate uses §7.
- **aw14.** Konstantin Ardakov and Simon Wadsley, [Verma modules for Iwasawa algebras are faithful](https://www.dpmms.cam.ac.uk/~sjw47/VermaIwasawa.pdf), author version, pp. 1–19; published Münster Journal of Mathematics 7 (2014), 5–26. Theorems 4.6 and 5.4, pp. 11 and 16: §5.4 assumes `p^n 𝔤 = (1/p)R⊗L_G` for an integer n ≥ 0, which covers the congruence kernels `ker(G(O_L) → G(O_L/p^(n+1)))` for every n ≥ 0, the first congruence kernel being the case n = 0; every odd p is very good for type A₁. These theorems reach the first congruence kernel through LocallyAnalyticDistributionsPartII §§4.13–4.14.
- **aw13.** Konstantin Ardakov and Simon Wadsley, [On irreducible representations of compact p-adic analytic groups](https://people.maths.ox.ac.uk/ardakov/Smith.pdf), author preprint; published Annals of Mathematics 178 (2013), 453–557. §2.5, Definition, p. 9, for grade and canonical dimension; §§10.12–10.13, pp. 77–78, and Lemma 10.13, p. 77, for canonical dimension zero; the microlocalisation of its §10 enters through LocallyAnalyticDistributionsPartII §3.4.
- **marshall12.** Simon Marshall, [Bounds for multiplicities of automorphic forms of cohomological type on GL₂](https://arxiv.org/pdf/1103.2472v1), arXiv:1103.2472v1, pp. 1–19. The published work is titled *Bounds for the multiplicities of cohomological automorphic forms on SL₂*, Annals of Mathematics 175 (2012), 1629–1651, as in fu24's bibliography entry [Mar12], p. 24; these locators use v1: §2.1, (4), pp. 3–4; §2.2, (7), p. 4; §5, (29) and Lemma 11, pp. 15–16.
- **serre77.** Jean-Pierre Serre, [Arbres, amalgames, SL₂](https://www.numdam.org/item/AST_1983__46__1_0.pdf), rédigé avec la collaboration de Hyman Bass, Astérisque 46 (1977), Numdam; page numbers are the printed pages. I §1.5.3, p. 20 and I §4.2 Example (c), p. 52, for `SL₂(ℤ) ≅ ℤ/4 ∗_{ℤ/2} ℤ/6`, and II §2.8, p. 169, for the cohomology exact sequence of an amalgam.
- **fgt10.** Tobias Finis, Fritz Grunewald and Paulo Tirao, [The cohomology of lattices in SL(2,C)](https://arxiv.org/pdf/0808.1204v1), arXiv:0808.1204v1; published Experimental Mathematics 19 (2010), 29–63. §1, pp. 3–5; §3.2, pp. 16–17; §3.3, (3.9)–(3.10), p. 17; §4.1, (4.4), pp. 18–19; Definition 4.3, p. 20; Propositions 4.10–4.11, pp. 22–23; Theorem 4.17, pp. 24–25; Proposition 4.18 and Lemma 4.19, pp. 25–26; Corollary 4.20, p. 27.

Where a target differs from its source, the target is the corrected statement:

- fu24, Theorem 1.2, pp. 2–3: the minimum in the saving is over the r₁+r₂ archimedean place weights, not over d coordinates (§4.2); a two-sided bound does not imply an asymptotic equivalent (§§4.3, 5.8).
- fu24, §1, equation (2), p. 2, and Corollary 1.3, p. 3: the dimension comparison with cusp forms uses cuspidal or interior cohomology; compact-support growth follows through the bounded boundary maps (§5.2). Marshall §2.1 defines the relevant subspace inside ordinary cohomology, and FGT §1 keeps a boundary contribution.
- fu24, Theorem 3.2 and its proof, pp. 8–11: the weights with some k_i < α_i form infinite coordinate strips, not finitely many exceptions, and are covered by `D(k+1) ≤ α_i ∏_{j≠i}(k_j+1)` (§0.3).
- fu24, Proposition 3.4, proof, p. 10: e raises and f lowers the h-weights, the reverse of the printed assignment; the basis is ordered decreasingly for the tail argument (§0.3).
- fu24, Theorem 1.2 and §7, pp. 2–3 and 23–24: for an arbitrary fixed compact open level the auxiliary prime is chosen outside the primes below the places where a chosen product subgroup has a factor other than SL₂(O_v), and the level is refined to a neat product level (§3.2).
- fgt10, Proposition 4.18, p. 25: the multiplicity formula needs σ∘Ad(diag(−1,1)) ≃ σ; without it the Eichler–Shimura route computes only m(σ) + m(σ^ι), and an order-three character of SL₂(𝔽₃) at k = 4 gives ½ (§5.3). Theorem 4.17 uses restrictions of GL₂-types only and is unaffected.
- fgt10, §3.3, before (3.9), p. 17: the characterization of `π_{2n+2,0}` by nonzero (𝔤,K)-cohomology against E_n concerns irreducible unitary representations; a direct sum of copies of `π_{2n+2,0}` also has nonzero cohomology (§4.1).
- fgt10, after Corollary 4.20, p. 27: positive linear growth needs a strictly positive leading coefficient, which A_F > B_F supplies (§5.6).
- The corrections to fu24 §§4–5 (equations (16)–(17), Theorem 5.7 and its proof, Remark 5.8) are LocallyAnalyticDistributionsPartII, Source corrections, items 1 and 3–6.
