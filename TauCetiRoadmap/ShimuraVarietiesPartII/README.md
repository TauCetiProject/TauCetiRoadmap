# Roadmap: Shimura varieties, part II — integral models and common Frobenius classes

**Summary.** This roadmap continues ShimuraVarieties from the canonical generic tower to integral models and their special fibres. From the canonical tower, the single-lattice integral Siegel models of PELModuli, the Siegel moduli schemes at the level of a self-dual periodic lattice chain (a contract of ShimuraCompactifications) and the universal abelian scheme it builds normalized integral models of Hodge-type Shimura varieties with parahoric level, their integral stacks at arbitrary prime-to-p level, and the canonical étale and crystalline tensors on them. It proves the local structure of these models (the adapted deformation rings, the local-model diagram, their characterization as canonical integral models in the sense of Pappas–Rapoport, the strict and ordinary henselian comparisons and the extension property over discrete valuation rings), constructs very-good auxiliary Hodge covers and descends to integral models of every abelian-type Shimura variety at p>2 and every connected parahoric level, ramified primes included (KPZ Theorem 7.2.21). On the special fibre it constructs Newton strata, the μ-ordinary locus and the tensor-preserving quasi-isogeny group of a point, and proves density of the ordinary locus, the Tate comparison for that group (HT Corollary 2.1.9), integral functoriality, ordinary special lifts with the full isogeny action (KZ Theorem 4.4.6) and the rational ordinary Frobenius (KZ Corollary 4.4.13). Kottwitz–Rapoport strata and curves over the original residue field (KZ Corollary 5.2.7) then carry the comparison from ordinary points to every point. The end theorem is Kisin–Zhou's: for a strongly acceptable triple and a point of the special fibre over F_q, the geometric q-Frobenius classes of the ℓ-adic local systems, ℓ≠p, are the images of one rational point of the conjugacy quotient Conj(G) (KZ Theorem 5.1.4).

## Scope and ownership

ShimuraVarieties stops at generic canonical models. Its §P.1 (pure data, Hodge type, and abelian type with its Hodge-type witness), §4.5 (canonical models of tori), §5.6 (potential good reduction of CM abelian varieties), §§6.3–6.6 (connected towers, star products and central-isogeny descent), §7.0i (absolute Hodge tensors on abelian varieties, with the p-adic de Rham comparison of its supplier contract), §8.1 (the canonical algebraic tower) and §8.2 (its right-translation laws) are imported. This roadmap begins at integral normalization and owns: normalized Hodge-type integral models, their stacks and canonical tensors (Layer 0); their local geometry and the notion of a canonical integral model in the sense of Pappas–Rapoport for Hodge-type data, with its uniqueness, functoriality and existence (Layer 1); auxiliary Hodge covers (Layer 2); integral component descent to abelian type (Layer 3); Newton strata, the ordinary locus and tensor quasi-isogeny groups on these models (Layer 4); integral functoriality, the Newton strata and isogeny groups of strongly acceptable models through a chosen Hodge embedding, and ordinary special lifts (Layer 5); Kottwitz–Rapoport strata and same-field curves (Layer 6); and the group-valued tower local systems with their Frobenius classes in Conj(G) (Layer 7).

What other roadmaps state is imported by section. PELModuli §§M4.5–M4.6 and §§M6.1–M6.4 state the single-lattice integral Siegel models (polarizations of any degree, and finite normalizations of the good-level model at smaller p-level), their level changes and the universal polarized abelian scheme. A finite normalization over the single-lattice model is not a lattice-chain moduli scheme; the Siegel moduli scheme at the stabilizer level of a self-dual periodic lattice chain, with its universal polarized chain of abelian schemes, is the contract gap:siegel-chain-moduli of ShimuraCompactifications Layer 7. This roadmap owns only the normalization of the Hodge closure inside these Siegel models. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII states goodness (§2.1), very-goodness (§§2.10–2.11), the very-good lattice-chain embeddings (§§3.13–3.17), versal adapted deformations and integral tensor frames (§§4.3–4.4 and 4.12), and ordinary adapted lifts with their σ-centralizer action (§§6.4–6.5); Layers 1, 2 and 5 here specialize these to points of Shimura models. Its §5.15 compares the realization tensors of a given normal Hodge-type model and leaves the existence of the model and the global extension of its tensors to the consumer; Layer 0 and §1.4 here supply both for the models of §0.1. GeometricSatakeAndFusionPartII states the canonical integral local models (§§3.1 and 7.6), the smooth open of maximal admissible orbits (§3.7) and the same-field Schubert curves on them (§5.5); Layers 1 and 6 transport these to Shimura models. It also states the existence of good integral Hodge embeddings for acceptable local Hodge-type data (§7.7) and the trace symplectic form on restrictions of scalars (§2.8), which §5.3 uses for the matched datum. LefschetzPencilsAndVanishingCyclesPartII §2.4 states the curve over the same field through a smooth rational point meeting a dense open; §6.3 applies it to a smooth presentation. ReductiveGroupsPartII §RG2.3 states full fixers, connected parahorics, quasi-tame groups and Lang's theorem. ArithmeticGaloisRepresentations §1.11 (*Reductive quotients over fields and DVRs*) states the conjugacy quotient Conj(G) of a connected reductive group with its quotient map, flat base change and the classification of its geometric points by semisimple classes. ReductiveGroupsPartIII states character separation (§0.5), finiteness of faithful quotient maps (§0.6), the orthogonal outer quotient Conj′ (§0.7), descent from local realizations (§1.2) and algebraicity over rational invariants (§1.3), global tori with elliptic real fibre (§2.3) and the real cocharacter adjustment (§2.5), and cyclic torus closures (§3.5). BunGAndNewtonStrata states B(G), acceptable classes, the ordinary class, its integral conjugacy and torus-special acceptable pairs. HeckeStacksAndLocalShtukas states local shtuka period towers and framed integral-model shtukas; the integral local Shimura varieties of quasi-parahoric models, their formal completions and the local group-sheaf inputs of the connected-level reduction are its contracts gap:integral-local-shimura and gap:general-connected-reduction, while the global statements that use them (canonical integral models, the strict comparison and the connected reduction on Shimura models) are owned here. DiamondsAndVStacksPartII states formal neighbourhoods of v-sheaves and the full faithfulness of the v-sheaf functor on flat normal formal schemes. AdelicAlgebraicGroups §4.3 states neat elements and neat levels, and ShimuraVarieties §0.3 their cofinality; PELModuli §§M2.2–M2.3 state neatness of Siegel levels in Lan's adelic sense and the absence of automorphisms at such levels. IgusaVarietiesAndTorsionConcentration §§0.1–0.2 and §0.12 state the Newton strata of PEL models; the strata here live on normalized Hodge-type models and agree with those in the common hyperspecial Siegel case. PELModuli §M2.16 states Wedhorn's density of the μ-ordinary locus on PEL moduli with good reduction; §4.7 here proves density on normalized Hodge-type models, assuming the ordinary class exists and the special fibre is locally integral, and recovers the hyperspecial Siegel case. ShimuraCompactifications owns compactifications and the lattice-chain Siegel moduli contract above. AbelianSchemesAndArithmeticModuli states Tate modules, de Rham realizations, Serre–Tate theory, Frobenius semisimplicity and twists by torsors.

The abelian-variety application of KZ §6 (Proposition 6.2.4 through Theorem 6.2.7), stated in ReductiveGroupsPartIII Layer 5 (§§5.4–5.9), takes the geometric theorem of Layer 7 as its input through the explicit hypothesis of its §5.5; nothing of that layer is used here. The Honda–Tate classification of isogeny classes (HT §§2.2–2.3), mod-p uniformization of isogeny classes and special cycles on orthogonal Shimura varieties are not part of this roadmap.

The pinned Tau Ceti abelian varieties and their endomorphism rings and Mathlib's pointwise isocrystals are used unchanged. The rank-two multiplier identity is already in Tau Ceti and appears here only as a Check.

`Suggested.lean` states no theorem: every headline of this roadmap (KZ Theorems 5.1.4 and 4.4.6, KPZ Theorem 7.2.21, KZ Corollaries 4.4.13 and 5.2.7, HT Corollary 2.1.9, and the density of the ordinary locus of HT Corollary 1.3.16 and, on strongly acceptable models, of KZ Theorem 4.4.4) is about integral models of Shimura varieties, their special fibres, Newton or Kottwitz–Rapoport strata, tower local systems or conjugacy quotients of reductive groups. None of these carriers exists in Mathlib or Tau Ceti at the pins; Tau Ceti has reductive groups over a field as Hopf algebras together with their conjugation coaction and Hilbert–Nagata finite generation for comodule algebras, but not the conjugacy quotient itself (conjugation is not registered as a comodule algebra) nor the classification of its geometric points by semisimple classes. Its module docstring lists each headline with the carrier it lacks.

## Conventions

Let p>2, fix embeddings of Q̄ into C and into Q̄_p, and take the place of the reflex field induced by the latter. Let k be an algebraic closure of the residue field of that place, W=W(k), L=W[1/p] and σ the p-power Frobenius. All algebraic groups are affine of finite type; reductive means smooth with geometrically connected reductive fibres. Tensor stabilizers are equalities of group functors on every coefficient algebra, including square-zero algebras. Schemes and tensor categories are formed in fixed universes, enlarged together under scalar extension. A prime-to-p level K^p is neat when K_pK^p is a neat level in the sense of AdelicAlgebraicGroups §4.3, that is, every rational intersection G(Q)∩xK_pK^px⁻¹ with x∈G(A_f) consists of neat elements; every compact open subgroup contains a neat normal open subgroup of finite index (ShimuraVarieties §0.3). For a Hodge embedding into GSp(V), a Siegel level K′^p is compatible with K^p when it contains the image of K^p, is neat in the adelic sense of PELModuli §M2.2 (for every element g, no nontrivial root of unity lies in the group generated by the eigenvalues of g_ℓ for every prime ℓ≠p at once), and Sh_K(G,X)→Sh_K′(GSp(V),S^±)⊗E is a closed immersion (KZ §4.1.5, pp.29–30; HT §1.3.2, p.15). At such a level the objects of the Siegel moduli problems of §0.1 have no nontrivial automorphisms (PELModuli §M2.3). Every subgroup of the principal congruence subgroup of level N of a Ẑ^p-lattice in V⊗A_f^p, with N≥3 prime to p, is neat in this sense: for a prime power ℓ^k≥3 exactly dividing N (one exists for every N≥3), the eigenvalues of the ℓ-component are congruent to 1 modulo ℓ^k, and the units of Q̄_ℓ congruent to 1 modulo ℓ^k contain no nontrivial root of unity. No compact open subgroup of GSp(V)(A_f^p) is torsion-free as a group, since it contains −1 at almost every prime. K^p is sufficiently small when it is neat and admits a compatible Siegel level. Every K^p contains a sufficiently small normal open subgroup: shrink K^p to a neat normal open subgroup whose image lies in a principal congruence subgroup of level N≥3 prime to p, take a Siegel level given by KZ §4.1.5 for it and intersect that level with the principal congruence subgroup; the map to the smaller Siegel variety is still a closed immersion, its composite with the finite map to the larger one being one. Conjugation by g∈G(A_f^p) carries a compatible pair (K^p,K′^p) to a compatible pair. Integral models of Hodge type are formed at sufficiently small levels, and at other levels as quotient stacks; in statements about them, neat K^p means sufficiently small. Arbitrary prime-to-p level is treated by the quotient stack of §0.2 for Hodge-type models and by the quotient stack of §3.8, formed in the same way, for abelian-type models.

Write G^fix for the full fixer of a point of the extended building and G° for its connected parahoric. KZ writes these as G-tilde and G-script; KPZ writes G-script and G-script-degree-zero. Good is the notion of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1 (the map of the scheme local model to the Grassmannian is a closed immersion) and very good that of its §2.10; no other tensor-display notion is introduced. A special Hodge model is the normalized model of a good Hodge embedding with G^fix=G°. Pointwise very-goodness is an extra hypothesis where it is stated and a conclusion at ordinary points (§5.7).

A torus over a finite extension F of Q_p is R-smooth when its Zariski closure in the Weil restriction of the locally finite type Néron model over a splitting field is smooth; a reductive group over a p-adic field is R-smooth when the centralizer of a maximal Q̆_p-split torus is an R-smooth torus (KPZ §2.1.4, p.10).

Quasi-tame is the notion of ReductiveGroupsPartII §RG2.3.2 (*quasi-tame-group*): a connected reductive group over a finite extension F of Q_p is quasi-tame when it is isomorphic to a product of Weil restrictions Res_(K_i/F)H_i, with K_i/F finite and each H_i split by a tamely ramified extension of K_i (KPZ Definition 3.1.4, p.16). A group over Q, such as Z_G^c, is called quasi-tame here when its base change to Q_p is.

The very-good Hodge setup (KPZ §7.1.2, p.72, assumptions (A)–(C)) consists of: p>2; G^fix is the stabilizer of a point generic in its facet; K_p=G^fix(Z_p); G_Qp is R-smooth and p does not divide |π₁(G_der,Qp)|; the Hodge embedding extends to a very-good integral embedding G^fix→GL(Λ) with Λ contained in its symplectic dual; prime-to-p levels are sufficiently small and compatible with the Siegel embedding. Condition (D): for C=ker(G_sc→G_der), every class of H¹(Q,C) whose localization is trivial at every finite ℓ≠p has trivial localization at p. Condition (E): Z_G is an R-smooth torus. (D) and (E) are hypotheses on the auxiliary Hodge cover used in descent, not hypotheses that an abelian-type target admits a Hodge embedding (KPZ §§7.1.2, 7.1.10, pp.72, 75).

Use the tower standard representation V=H₁; the coefficient local system is Isom_tensor(V_Qℓ, T_ℓ(A)⊗Q_ℓ), and its dual is H¹. For a symplectic multiplier c, V∨≅V⊗c⁻¹, so the H¹ version is either the contragredient or this multiplier twist. Geometric q-Frobenius has multiplier q⁻¹ on H₁ and q on H¹. On H₁ the Hodge types are (−1,0),(0,−1); on H¹ they are (1,0),(0,1), with h(z) acting by `z^(-a) zbar^(-b)` on type (a,b). Local models use {μ_h} on V. Contravariant Dieudonné modules D and H¹ use the dual representation, so the Newton bound is {μ_h⁻¹}. D(Q_p/Z_p) has F=σ and D(μ_(p^∞)) has F=pσ. A tensor is transported to a dual factor by the inverse dual map (KZ §§4.1.7, 4.4.1, 5.1.1, pp.30–31, 42, 47).

For an abelian fibre over F_q, π_x denotes its algebraic q-power Frobenius and γ_x=π_x⁻¹ the rational quasi-isogeny acting on H₁ as geometric Frobenius; its contragredient on H¹ is inverse pullback by γ_x. Write Q_(q^m)=W(F_(q^m))[1/p] and r=[F_q:F_p]. The crystalline realization D_x and its tensors descend to Q_q, but there the dual tensor frames V∨⊗Q_q≅D_x form a G-torsor that need not be trivial. It is trivial over the maximal unramified extension of Q_q, hence over Q_(q^m₀) for some positive integer m₀, a framing degree of x, and then over Q_(q^m) for every positive multiple m of m₀ (§4.9). In a dual tensor frame over K₀=Q_(q^m₀) write F_D=ρ∨(δ)σ with δ∈G(K₀). Then `N_(rm₀)(δ)=δσ(δ)⋯σ^(rm₀-1)(δ)` is the group norm: its standard realization is γ_x^(m₀) and its dual realization is π_x^(m₀) by pullback on D. Only when a frame exists over Q_q itself (m₀=1) does the length-r norm N_r(δ) realize γ_x and π_x. For the matrix δ_D=ρ∨(δ) the crystalline norm is ρ∨(N_(rm₀)(δ)); conflating δ_D with the standard tower matrix inverts the determinant. Neither norm is in general a power of δ. The framing degree enters only the p-adic norm; γ_x itself and every conclusion about its ℓ-adic realizations concern the exact q-Frobenius.

Conj(G) denotes the affine conjugacy quotient Spec O(G)^G of ArithmeticGaloisRepresentations §1.11 (*Reductive quotients over fields and DVRs*, the case of G acting on itself by conjugation), with quotient map χ_G. Its geometric points classify semisimple geometric conjugacy classes; its rational points need not have rational representatives and do not distinguish rational conjugacy classes. Characteristic polynomials are det(T−g), with constant coefficient (−1)ⁿdet(g). Extending F_q to F_(q^m) replaces Frobenius by its m-th power.

**Checks.**

- On an elliptic H¹, μ_h(z) acts by z⁻¹ on H^(1,0) and by 1 on H^(0,1); on H₁ the weights are z and 1. Its inverse induces Fil¹=H^(1,0) on the contravariant module. In D the ordinary slopes are (0,1) and the supersingular slopes (1/2,1/2), both of determinant valuation 1. Intrinsically for the GL₂ tower, μ_h⁻¹ has determinant exponent −1, ordinary slopes (0,−1) and basic slopes (−1/2,−1/2); the Kottwitz invariant is −1 for both. Evaluating in V∨ reverses the signs.
- For E: y²=x³+x over F₅, the affine point counts at x=0,1,2,3,4 are 1,0,1,1,0; with the point at infinity #E(F₅)=4 and the trace is 2. The H¹ polynomial is T²−2T+5. Inverting the two roots gives the tower polynomial T²−(2/5)T+1/5; twisting by c⁻¹ multiplies the roots by 5 and restores T²−2T+5. The H₁ and H¹ multipliers are 1/5 and 5.
- For a Teichmüller unit ζ of order 24 in W(F₂₅) and G=G_m acting on V by the identity character, the standard element δ=ζ has length-2 group norm δσ(δ)=ζ·ζ⁵=ζ⁶, whereas δ²=ζ². Frames exist over Q₂₅ by Hilbert 90, so the framing degree is 1. In the dual frame F_D=ρ∨(δ)σ=ζ⁻¹σ, so the crystalline linear F₂₅-Frobenius is F_D²=ρ∨(ζ⁶)=ζ⁻⁶=ζ¹⁸: it realizes π_x on D, while the standard norm ζ⁶ realizes γ_x=π_x⁻¹ on V. The two differ by ζ¹²=−1, so the group norm is not the crystalline matrix. This agrees with the Check of §4.9 applied to the crystalline matrix δ_D=ρ∨(δ)=ζ⁻¹. Over F₂₅ the elliptic H¹ polynomial above becomes T²+6T+25 (trace 2²−2·5=−6) and the tower polynomial T²+(6/25)T+1/25.
- For the elliptic point over F₅ above, a dual frame chosen over Q₂₅ (framing degree 2) makes the norm of length 2 realize γ_x², with trace (2/5)²−2/5=−6/25 and determinant 1/25, and its dual realize π_x², with trace −6 and determinant 25. Reading that norm as the F₅-Frobenius would replace the tower coordinates (2/5,1/5) by (−6/25,1/25). Since H¹(Q₅,GL₂)=1, a frame over Q₅ also exists, and its length-1 norm gives (2/5,1/5).
- In SL₂(R), rotations through ±π/2 both have trace 0. A conjugator interchanging them anticommutes with the complex structure and has negative determinant, so they are geometrically conjugate but not SL₂(R)-conjugate; the rational quotient forgets that distinction.
- For p∉{3,7}, the element of GL₂(A_f^p)=GSp₂(A_f^p) equal to −1 at 7 and to 1 at every other prime has order 2 and lies in the principal congruence subgroup of level 3; every compact open subgroup of GSp(V)(A_f^p) contains GSp(Z_ℓ′) for almost every prime ℓ′ (for a lattice of V), hence the element equal to −1 at ℓ′ and to 1 elsewhere, so none is torsion-free. That element is neat in the adelic sense, because its eigenvalue group at 3 is trivial. The scalar −1 at every prime has eigenvalue group {±1} at every ℓ, so it is not neat, and neither is GL₂(Ẑ^p), which contains it.
- At p=3, Res_(Q_9/Q_3)G_m is quasi-tame (one factor, K=Q_9, H=G_m), and so is the norm-one torus of the ramified quadratic extension Q_3(√3), which splits over that tamely ramified field. The norm-one torus T of the non-Galois cubic Q_3(∛3) is not. Its Galois closure is wildly ramified (x³−3 is Eisenstein of degree p) with group S_3, which permutes the three embeddings and so acts faithfully on the rank-two character lattice Z³/Z(1,1,1); hence no tame extension splits T. A Weil restriction of a rank-one torus from a quadratic extension, or a product of two rank-one tori, has Galois image of order dividing 8, not 6. So a torus over Q_p with p odd need not be quasi-tame.

## Exact supplier contracts

### From Mathlib

At 1b1ccf4b088b32fa3f23f2de1127433254a81e1e: `WittVector.Isocrystal` (Mathlib/RingTheory/WittVector/Isocrystal.lean:112) is a class on a module over `K(p, k)`, the fraction field of `W(k)`, with a Frobenius-semilinear automorphism `Isocrystal.frobenius`, for k a perfect domain of characteristic p. It carries no G-structure, no family and no finite-dimensionality hypothesis; §4.1 compares its fibres with it after forgetting tensors.

### From Tau Ceti

At 2fd255d997f47c0b5d834ee416c7015d55444ce5: `TauCeti.AlgebraicGeometry.AbelianVariety` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95) is a proper geometrically integral group object over `Spec K`, with no polarization field. `TauCeti.AlgebraicGeometry.AbelianVariety.End` (TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:74) is `Additive (A ⟶ A)`, with composition as multiplication; §4.8 rationalizes it. `Matrix.transpose_mul_J_mul_eq_det_smul` (TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:63) states `Aᵀ * J l R * A = A.det • J l R` for a rank-two block matrix over a commutative ring; it underlies the multiplier Checks of §5.2. `TauCeti.reductiveCommHopfAlgProperty` (TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:71) selects the reductive finite-type commutative Hopf algebras over a field (smooth, geometrically connected, with no nontrivial connected normal smooth unipotent subgroup geometrically); it is the carrier of the reductive groups whose conjugacy quotients are taken. `TauCeti.HopfAlgebra.conjugationAlgHom` (TauCeti/Algebra/AlgebraicGroup/Hopf/Conjugation.lean:66) is the coordinate algebra map `H → H ⊗ H` of left conjugation, for a commutative Hopf algebra `H` over a commutative semiring, with the conjugating variable in the first factor; `TauCeti.HopfAlgebra.productMap_comp_conjugationAlgHom` (line 107) says that evaluating it at algebra-valued points `g, x` gives `g x g⁻¹` (for g=diag(2,1) and x=[[1,1],[0,1]] this is [[1,2],[0,1]], whereas g⁻¹xg=[[1,1/2],[0,1]]; on a commutative group both actions are trivial and cannot detect the orientation), and `TauCeti.HopfAlgebra.conjugationAlgHom_counit_left`, `TauCeti.HopfAlgebra.conjugationAlgHom_counit_right` and `TauCeti.HopfAlgebra.conjugationAlgHom_coassoc` (lines 176, 196, 248) are the identity, fixed-identity and associativity laws of the action. The class functions of Conj(G) are the elements fixed by this coaction, the equalizer of `conjugationAlgHom` with the inclusion of the second tensor factor. `TauCeti.reductiveCommHopfAlgProperty.linearlyReductive` (TauCeti/Algebra/AlgebraicGroup/Reductive/CompleteReducibility.lean:96) makes a reductive group over a field of characteristic zero linearly reductive, and `TauCeti.ComoduleAlgebra.finiteType_coinvariants` (TauCeti/Algebra/Bialgebra/ComoduleAlgebra/LinearlyReductive.lean:148) is Hilbert–Nagata finite generation for the coinvariants `TauCeti.ComoduleAlgebra.coinvariants` (TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean:136) of a finitely generated right comodule algebra over a linearly reductive Hopf algebra. The pin does not register conjugation as a comodule algebra structure on the coordinate ring, so it neither names the subalgebra of class functions nor states its finite generation, and it does not classify the geometric points of the quotient by semisimple conjugacy classes; ArithmeticGaloisRepresentations §1.11 supplies the quotient with both properties, and the two pinned theorems above are the route to its finite generation.

### From TauCetiRoadmap.ShimuraVarieties

§P.1 (pure Shimura data; Hodge type, a rational closed immersion into a Siegel datum; abelian type, a central derived isogeny inducing an isomorphism of connected adjoint data with a Hodge-type datum, its Hodge-type witness), §0.3 (every compact open level contains a neat normal open subgroup of finite index), §4.5 (finite étale canonical models of tori, with the Galois action of their points given by reciprocity), §5.6 (potential good reduction of CM abelian varieties), §§6.3–6.6 (connected towers with completed symmetry, their canonical formulations, products and central-isogeny descent), §7.0i (absolute Hodge tensors on complex abelian varieties, with their de Rham and finite-adelic étale realizations and the family form), §8.1 (the canonical algebraic level tower) and §8.2 (its right translations T_g: Sh_K→Sh_L, defined when g⁻¹Kg⊂L, with T_h∘T_g=T_(gh); on points [x,a]↦[x,ag]).

What ShimuraVarieties must provide (gap:integral-hodge-realization-extension): §7.0i, p-adic de Rham realization (new target). For a complete discrete valuation ring O_K of mixed characteristic (0,p) with perfect residue field, an abelian scheme A over O_K and an embedding K̄ ↪ ℂ, prove that for every absolute Hodge tensor of A_ℂ, with mixed tensors, duals and Tate twists, the p-adic étale component and the de Rham component, both defined over K̄, correspond under the de Rham comparison `B_dR ⊗ H¹_et(A_K̄, Q_p) ≅ B_dR ⊗_K H¹_dR(A_K/K)` extended to tensor constructions (HT (1.3.4.2), p.16, the theorem of Blasius and Wintenberger used in the proof of HT Proposition 1.3.7, pp.17–18); neither an integral moduli model nor an integral tensor extension is an input. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII asks §7.0i for the same comparison under the same slug.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§4.3 (neat elements of a linear algebraic group over a number field, defined by torsion-freeness of the subgroup generated by the eigenvalues in one faithful representation; neat levels, all of whose rational intersections G(Q)∩xKx⁻¹ are neat; a neat element of finite order is 1). Neatness of a level in this sense concerns its rational intersections only; the Siegel levels of Conventions are required to be neat in the adelic sense of PELModuli §M2.2.

### From TauCetiRoadmap.ShimuraData

Layer 1 (Mumford–Tate groups and Hodge genericity) and Layer 4 (§4.2: a Hodge-type datum satisfies SV2* and hence SV5, so Z_G(Q) is discrete in Z_G(A_f); §§4.3–4.4: the additional axioms and the discreteness criterion for the rational centre; §4.6: lifting connected data to full data). The predicates of Hodge and abelian type are ShimuraVarieties §P.1's.

What ShimuraData must provide (gap:hodge-cover-refinement): Layer 4. Refine the Hodge-type witness (ShimuraVarieties §P.1) of an abelian-type datum by the fundamental type-A and quaternionic-D representations and a CM scalar field split at all prescribed p-places, with Hodge cocharacters in the identity component of the matched-multiplier group, as used in KPZ §7.2.3.

What ShimuraData must provide (gap:multiplier-exact-sequences): Layer 4, Hodge-type multiplier sequences. For a Hodge-type datum (G,X), with no simplicity hypothesis on G^ad, with G^c generated by G^der and the largest compact subtorus Z_(G,0) of Z_G and Z^c_G generated by Z_(G^der) and Z_(G,0), prove that the multiplier c of any Hodge embedding gives exact sequences 1 → G^c → G → G_m → 1 and 1 → Z^c_G → Z_G → G_m → 1, and hence that the common-multiplier subgroup of a finite product of Hodge-type data, itself of Hodge type through the direct-sum embedding, has centre an extension of G_m by the product of the Z^c (KPZ Lemma 7.2.5, p.78, stated there for G^ad Q-simple; its proof uses only that G is generated by G^c and the weight w_h(G_m), which holds for every Hodge-type datum because w_h is the rational scalar cocharacter and Z_G(R)/w_h(R^×) is compact; KZ applies it without simplicity to the matched datum in the proof of Lemma 4.3.8(1), p.40).

What ShimuraData must provide (gap:matched-fibre-product-centre): Layer 4, matched fibre products. For Hodge-type data (G,X) and (G_2,X_2) with Z^c_G and Z^c_(G_2) tori and G^der → G_2^der a central isogeny inducing (G^ad,X^ad) ≅ (G_2^ad,X_2^ad), let G_3 be the identity component of G ×_(G^ad × G_m) G_2; prove that Z^c_(G_3) ≅ Z^c_(G_2) × Z^c_G, that G_3^der → G^der is an isomorphism with Z_(G_3^der) embedded diagonally, and that 1 → Z^c_(G_2) → Z^c_(G_3)/Z_(G_3^der) → Z^c_G/Z_(G^der) → 1 is exact (KZ Lemma 4.3.8 and its proof, pp.40–41).

What ShimuraData must provide (gap:fundamental-invariant-form): Layer 4, fundamental Hodge embeddings. For a fundamental Hodge embedding (G,X) → (GSp(V),S^±) in the sense of KPZ Definition 7.2.7, p.78, with V an F-vector space for a totally real field F and H′ ⊂ GL_F(V) generated by H^c and F^×, prove that the alternating form can be chosen as Tr_(F/Q) ∘ Ψ with Ψ an F-bilinear alternating form and H′ → GL_F(V) factoring through GSp_F(V,Ψ) (KPZ Lemma 7.2.8, p.79).

### From TauCetiRoadmap.PELModuli

§M2.2 (neat open compact subgroups in Lan's adelic sense, defined by the roots of unity common to the eigenvalue groups of the components at all primes outside the bad set, as opposed to the rational-intersection neatness of AdelicAlgebraicGroups §4.3; principal congruence subgroups of level n≥3 are neat), §M2.3 (no nontrivial automorphisms of the objects of the moduli problem at neat level), §§M4.5–M4.6 (finite normalizations of the good-level Siegel model in its generic covers at smaller p-level, their finiteness, normality and flatness, and changes of p-level; no moduli interpretation at that level) and §§M6.1–M6.4 (finite étale level-forgetting and Hecke maps, the moduli stack at arbitrary level and the stacks of polarized abelian schemes with their universal object, of finite type over Z including the characteristics dividing the degree).

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

§A1.2 (relative rigidity: a homomorphism of abelian schemes that vanishes on one geometric fibre over each connected component of the base is zero), §A4.1 (the integral Tate module), §A4.3 (first de Rham cohomology), §A4.8 (effectivity of polarized formal lifts), §A4.9 (the Serre–Tate equivalence with structures), §A6.7 (Hom is free of finite rank), §A6.14 (positivity of the Rosati involution), §A6.20 (full-level descent of homomorphisms), §A6.21 (Frobenius semisimplicity and centrality of π over F_q), §A6.22 (coefficient Hom spaces and quasi-isogenies), §§A6.28–A6.29 (twists by torsors up to localized isogeny, with their realizations, polarizations and level).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§R07.2 (contravariant Dieudonné theory: R07.2.6–R07.2.7 for the module, base change and descent, R07.2.12 and R07.2.14 for μ_(p^∞), Q_p/Z_p and ordinary and supersingular elliptic curves, R07.2.20 for the comparison with the covariant convention).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII

§2.1 (integral Hodge embeddings and goodness: the map of the scheme local model to the Grassmannian is a closed immersion; KPZ Definition 3.4.4); §§2.10–2.11 (very-goodness at a point, independent of the cutting tensor family); §3.13, §§3.14 and 3.17, §3.15 and §3.16 (very-good periodic lattice chains in the non-exceptional, D^H and wild type-A cases, and with a perfect pairing); §§4.3–4.4 (integral tensor frames and integral crystalline and Witt tensor comparison for crystalline lifts with smooth full fixer, without very-goodness); §4.12 (the versal adapted deformation theorem under very-goodness at the point); §§6.4–6.5 (adapted ordinary lifts with connected fixer, and the lift of all of J_b(Q_p) by quasi-isogenies).

### From TauCetiRoadmap.GeometricSatakeAndFusion

Layer GS0 (Witt affine flag varieties and their components, Schubert cells with Bruhat closure relations, admissible loci, and Galois descent of Galois-stable unions of Schubert strata to their orbit-labelled cells).

### From TauCetiRoadmap.GeometricSatakeAndFusionPartII

§1.4 (adjoint and central derived-isogeny comparisons of local models), §§3.1 and 7.6 (the canonical normal flat projective local model with geometrically reduced special fibre and normal components), §3.4 (the special fibre as the reduced μ-admissible union with its Schubert stratification), §3.7 (the open subscheme smooth over O_E whose geometric special fibre is the dense union of the maximal admissible orbits, for every parahoric and minuscule μ, ramified groups included), §5.5 (curves over F_q through an F_q-point of a lower Schubert stratum, dense in a higher one), §7.7 (KZ Proposition 3.1.9 with Lemma 3.1.10: for p>2 and an acceptable local Hodge-type datum with p∤|π₁(G_der)| and R-smooth centralizer of a maximal Q̆_p-split torus, a good integral Hodge embedding into a single lattice of a stabilizer scheme whose neutral component is the given parahoric, the representation being replaced as in KZ Proposition 3.1.9: by the proof of KZ Proposition 3.1.12, p.21, it is the Q_p-space underlying (V⊗K)^r for a finite splitting field K, which need not be tame, and some r≥1; no non-exceptional hypothesis, the condition of §2.3) and §2.8 (for K/F finite separable and a nondegenerate alternating K-form ψ, the form Tr_(K/F)∘Σψ on V^r is nondegenerate alternating and preserved by the subgroup whose similitude multipliers are one common element of F^×; KZ Proposition 3.1.12). Goodness in §7.7 is that of its §0.6, KPZ Definition 3.4.4: the map of scheme local models to the Grassmannian is a closed immersion, the notion of Conventions. The local model of a datum (G,{μ},G^fix) is written M_loc(G,{μ}).

What GeometricSatakeAndFusionPartII must provide (gap:local-models): §§3.1 and 7.6, very-special special fibre. For a very special parahoric and odd p, prove that the μ-admissible set has a unique maximal element, so that the geometric special fibre of the normal local model of §§3.1 and 7.6 is irreducible, hence integral (KZ Theorem 4.4.4 and its proof, p.43; §5.2.1, p.49). The smoothness of the extremal Schubert stratum is §3.7 and is not part of the gap.

### From TauCetiRoadmap.ReductiveGroupsPartII

§RG2.0 (the point topology on rational points, the topological group of points over a local field and its integral points and congruence subgroups; closures of subgroups of rational and adelic points are taken in these topologies), §RG2.1 (relative roots and valued root data, and Steinberg's theorem *steinberg-quasi-split*: H¹(L,H)=1 for every connected reductive group H over a complete or henselian discretely valued field L with algebraically closed residue field, such as the maximal unramified extension of Q_q), §RG2.3 (full fixers, connected parahorics, quasi-tame groups in §RG2.3.2 (*quasi-tame-group*, with quasi-tameness of a Weil restriction of a quasi-tame group), the very-special connected-fixer criterion of KZ Lemma 4.2.4, central-surjection association, split-kernel exactness, and Lang's theorem for smooth connected groups over finite fields and for the specified pro-connected inverse systems).

What ReductiveGroupsPartII must provide (gap:fixer-stable-lattices): §RG2.3.5, stable lattices for full fixers (new target beside *hodge-type-fixer-immersion*). For a connected reductive group G over a finite extension F of Q_p, a point x of its extended building with full fixer scheme G_x, and a finite-dimensional algebraic representation ρ: G → GL(V), prove that V contains an O_F-lattice Λ for which ρ extends to a morphism of O_F-group schemes G_x → GL(Λ), that is, by the extension principle of §RG2.3.1, a lattice stable under G_x(O_F̆); no tameness, minuscule or closed-immersion hypothesis or conclusion is involved (KZ §4.3.5, p.40, by the G(F̆)- and Galois-equivariant embedding of buildings and the lattice chain of the image point; equally by the stable-lattice argument for V as a comodule over the flat Hopf algebra of G_x).

### From TauCetiRoadmap.ReductiveGroupsPartIII

§0.5 (semisimple geometric classes of a connected reductive group are conjugate exactly when they have the same trace in every finite-dimensional representation), §0.6 (finiteness of Conj(G)→Conj(GL(V)) for a faithful V; injectivity is not claimed), §0.7 (Out′(H), Conj′(H) and Aut′(H) in characteristic zero; two semisimple geometric points have the same image in Conj′(H) exactly when an element of Aut′(H) carries one to the other), §1.2 (a point of an affine finite-type Q-scheme over Q̄ that is Q_ℓ-rational for almost all ℓ is rational), §1.3 (points of a finite morphism over a rational point are algebraic), §2.3 (a global maximal torus with elliptic real fibre and prescribed p-adic conjugacy class), §2.5 (the global twist of a maximal torus T with T_sc anisotropic over R: a Q-defined conjugate T′=gTg⁻¹ with g∈G_sc(Q̄), which carries a cocharacter to a prescribed real Hodge cocharacter while keeping its p-adic fibre and cocharacter up to G_sc(Q_p)-conjugacy; the Remark of §4.5 shows that T′ need not be G(Q)-conjugate to T) and §3.5 (the cyclic closure of a semisimple rational element is a torus exactly when the element is neat, and neatness after a uniform power on a torus).

What ReductiveGroupsPartIII must provide (gap:rg3-cyclic-torus-and-neatness): §3.5, stable centralizers (new target beside §3.5). For a field F of characteristic zero, a connected reductive F-group G and a semisimple γ∈G(F), let S be the Zariski closure of the group generated by γ and e the index of its identity component; prove that for every positive integer n divisible by e the closure of the group generated by γ^n is the torus S°, so that Z_G(γ^n)=Z_G(S°) is connected reductive and independent of n (n=0 is excluded: γ^0=1 has closure 1 and centralizer G), compatibly with field extension (used for F=Q_ℓ and for the finite-period crystalline field in HT §§2.1.5–2.1.7, pp.22–24).

What ReductiveGroupsPartIII must provide (gap:rg3-r-smooth-tori): Layer 2, R-smooth tori (new target). For a torus T over a finite extension F of Q_p, R-smooth as in Conventions, prove that a finite product of Weil restrictions of tori split by tamely ramified extensions is R-smooth and that an extension of an R-smooth torus by an R-smooth torus is R-smooth (KZ Proposition 2.4.6, p.14; KPZ Proposition 2.1.5(1)–(2), p.10).

What ReductiveGroupsPartIII must provide (gap:rg3-r-smooth-abelian-type): Layer 2, R-smooth centralizers (new target). For p>2 and a reductive group G over Q_p whose adjoint group is a product of Weil restrictions of groups split by tamely ramified extensions and whose centre Z_G is an R-smooth torus, prove that the centralizer of a maximal Q̆_p-split torus of G is R-smooth (KPZ Lemma 7.2.11, pp.80–81).

What ReductiveGroupsPartIII must provide (gap:rg3-r-smooth-central-quotient): Layer 2, central quotients of fixers (new target). For a connected reductive group G over a finite extension F of Q_p whose centre Z_G is an R-smooth torus (Conventions), and a point x of its extended building with full fixer scheme G_x and image x_ad in the building of G^ad, prove that the Zariski closure Z of Z_G in G_x is smooth, that G_x/Z is a smooth affine group scheme with generic fibre G^ad, and that its neutral component is the parahoric group scheme of G^ad at x_ad; G_x/Z itself need not be the full fixer of x_ad (KZ Proposition 2.4.13, p.17, for the parahoric of a central extension with R-smooth torus kernel; KPZ §7.1.12, p.75, with KP Lemma 4.6.2(2), p.198, for the full fixer).

What ReductiveGroupsPartIII must provide (gap:rg3-stabilizer-closed-immersion): §5.3a, integral stabilizer schemes (new target extending §5.3a, whose equality of full fixers is the case K̃=K on integral points). For p>2, a closed immersion G → G′ of reductive groups over a finite extension K of Q_p inducing an isomorphism of derived groups with G R-smooth, a finite extension K̃/K and x ∈ B(G,K) with image x′ ∈ B(G′,K̃), prove that G → Res_(K̃/K) G′_K̃ extends to a closed immersion of Bruhat–Tits stabilizer schemes G_x → Res_(O_K̃/O_K) G′_(x′) (KPZ Proposition 2.1.5(3), p.10; KZ Propositions 2.4.8 and 2.4.10, pp.15–16).

What ReductiveGroupsPartIII must provide (gap:compact-quotient-borel): Layer 2, compact homogeneous quotients over local fields (new target). Let F be a nonarchimedean local field of characteristic zero, H a connected split reductive F-group and I⊂H a closed F-subgroup. (a) If I(F)\H(F) is compact, then I contains a Borel subgroup of H. (b) If moreover the identity component of I is reductive, then I=H: H/I is proper because I contains a Borel subgroup, affine because I° is reductive, and geometrically connected because H is, hence a point. (K17 Corollary 2.1.7 and its proof, p.31, which takes (a) from Borel–Tits.) For H=G_m and I=1 the quotient F^× is not compact; for H=GL₂ and I a Borel subgroup the quotient P¹(F) is compact but I° is not reductive, so (b) needs its reductivity hypothesis.

### From TauCetiRoadmap.BunGAndNewtonStrata

§0.6 and §0.8 (point and family G-isocrystals), §1.16 (the finite Frobenius norm centralizer), §§1.22–1.26 (representations detect Newton dominance, acceptable classes B(G,{μ}), the unique maximum, the ordinary class when it exists), §§1.28–1.29 (ordinary classes under a derived isogeny, integral conjugacy of an ordinary admissible element), §1.34 and §1.37 (rational Newton representatives and torus-special acceptable pairs), §1.39 (under a rational Newton witness, a G-minuscule acceptable pair is special for a rational transfer of a maximal torus of J_b into the Newton centralizer; such a transfer exists when G is quasi-split or the torus is elliptic), §2.16 (local constancy of the Kottwitz invariant in families).

### From TauCetiRoadmap.HeckeStacksAndLocalShtukas

Layer HS2 (framed integral-model shtukas for smooth affine group schemes with connected special fibre, HS2.1; local Shimura varieties and their universal torsors, HS2.10–HS2.11; the adjoint-isomorphism comparison of period towers, HS2.13).

What HeckeStacksAndLocalShtukas must provide (gap:integral-local-shimura): §HS2, integral local Shimura varieties of quasi-parahoric models (new targets beside §§HS2.1 and HS2.13). Let G be a connected reductive group over Q_p, 𝒢 a quasi-parahoric model of G (a smooth open subgroup scheme of the full fixer of a point of the extended building containing the connected parahoric; its special fibre may be disconnected), μ a minuscule cocharacter with local reflex field E, and k an algebraic closure of the residue field of E. (i) Extend the framed shtukas of §HS2.1 to 𝒢 and define, for μ-admissible b∈G(Q̆_p), the integral local Shimura variety M^int_(𝒢,b,μ) over Spd O_Ĕ with its base point and universal 𝒢-shtuka (PaRa26 §2.4, Definition 2.4.1, pp.7–8). (ii) Prove purity for 𝒢-torsors: for an algebraically closed nonarchimedean field C of characteristic p with open bounded valuation ring C⁺ and pseudo-uniformizer ϖ, and for products of such points, every 𝒢-torsor over Spec W(C⁺) minus V(p,[ϖ]) extends to Spec W(C⁺) and is trivial (PaRa26 Propositions 3.2.1–3.2.2, pp.12–13). (iii) Attach to a de Rham pro-étale 𝒢(Z_p)-torsor bounded by μ over a smooth E-scheme X its 𝒢-shtuka over X^♢ with one leg bounded by μ, compatibly with change of group, and prove that a pro-étale torsor over a smooth connected X that is de Rham at one classical point is de Rham (PaRa24 §2.6, Proposition 2.6.3, p.40, and Proposition 4.1.2, p.77, with the rigidity theorem of Liu–Zhu cited there). (iv) For X normal, flat, separated and of finite type over O_E, prove that a homomorphism between the restrictions to the generic fibre of two 𝒢-shtukas over X extends uniquely over X (PaRa24 Theorem 2.7.7, p.48, and Corollary 2.7.10, p.50). (v) For p>2 and (G,{μ}) of abelian type, prove that the formal completion of M^int_(𝒢,b,μ) at a k-point x is isomorphic to the v-sheaf of the completed local ring of M_loc(G,{μ}) at a k-point y obtained from a trivialization of the 𝒢-torsor underlying the shtuka at x (PaRa26 Theorem 2.5.5, p.9). (vi) For a homomorphism f:G→G′ carrying centre to centre and inducing an isomorphism of adjoint groups, extended to quasi-parahoric models 𝒢→𝒢′ whose neutral components belong to the same point of the common adjoint building, with b′=f(b) and {μ′}={f∘μ}, prove that f induces an isomorphism from the formal completion of M^int_(𝒢,b,μ) at x onto that of M^int_(𝒢′,b′,μ′) at f(x), after base change of reflex rings (PaRa26 Proposition 5.3.1, p.35, cited in KZ Proposition 4.3.2 as Theorem 5.2 of an earlier version). Formal completions are those of DiamondsAndVStacksPartII §D9.8; no statement about a Shimura model is part of the gap.

What HeckeStacksAndLocalShtukas must provide (gap:general-connected-reduction): §HS2, component groups of full fixers (new target). Let G be a connected reductive group over Q_p, G^fix the full fixer of a point of its extended building, G° its relative identity component, π₀(G^fix) the finite étale component group over F_p, and i the inclusion of the special fibre. (i) Prove that 1→G°→G^fix→i_*π₀(G^fix)→1 is an exact sequence of sheaves of groups on the big étale site of Spec Z_p, and that the corresponding sequence of v-sheaves of groups over Spd Z_p is exact (PaRa26, proof of Proposition 3.2.1, p.12; DvHKZ Lemma 4.3.4, p.39). (ii) For a quasi-parahoric model 𝒢, a minuscule μ and a 𝒢-shtuka with one leg bounded by μ over the v-sheaf of a flat O_E-scheme, construct its v-sheaf local-model map to the quotient of the v-sheaf of M_loc(G,{μ}) by 𝒢^♢, functorial in 𝒢, so that the maps for G° and G^fix are 2-compatible under M_loc(G°,{μ})=M_loc(G^fix,{μ}) (PaRa24 §4.9.1, p.99; DvHKZ diagram (4.3.1), p.37). No statement about a Shimura model is part of the gap.

### From TauCetiRoadmap.DiamondsAndVStacksPartII

§D7.6 (full faithfulness of X↦X^⋄ on perfect schemes, used in §3.9), §D9.8 (formal neighbourhoods of locally closed subsets of the reduction of a prekimberlite, which are the formal completions at points used in §1.7) and §D10.11 (the functor from flat normal formal schemes locally formally of finite type over Spf O_E to v-sheaves over Spd O_E is fully faithful; Scholze–Weinstein).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§F.0.4 (étale topological invariance: a universal homeomorphism of schemes induces an equivalence of étale sites, restricting to an equivalence of finite étale covers), used in §3.9.

### From TauCetiRoadmap.CrystallineCohomology

§CR.7.1 (coefficients with Frobenius, filtration and monodromy) and §CR.7.3 (relative crystalline cohomology and the Gauss–Manin connection).

What CrystallineCohomology must provide (gap:cr-crystalline-parallel-transport): §CR.7.3, rigid-analytic transport. For an abelian scheme over the formal deformation space of A_(s0)[p∞] at a point s0 over a perfect field k of characteristic p, formally smooth over W(k), prove that for any two points s, s′ of its rigid generic fibre over finite extensions of W(k)[1/p] the composite of the Berthelot–Ogus isomorphisms H¹_dR(A_s) ≅ D(A_(s0))[1/p] ≅ H¹_dR(A_(s′)) after scalar extension equals Gauss–Manin parallel transport on the rigid open ball, as used in the proof of HT Proposition 1.3.7, pp.17–18.

What CrystallineCohomology must provide (gap:cr-isocrystal-tensor-descent): §CR.7.1, log coefficients and descent. For a flat normal finite-type W(k)-scheme S with a relative Cartier divisor D, U = S − D, and an abelian scheme over U extending to a semi-abelian scheme over S, prove that every global section s of the tensor algebra of R¹π_*Q_p on the generic fibre of U determines a unique morphism of convergent F-isocrystals 1 → E^⊗ on U, E the isocrystal of the p-divisible group, whose value at every point ξ of U over the ring of integers of a finite extension equals D_cris(ξ*s) (HT Corollary A.7, p.39, by Lemma A.4 and Proposition A.6, pp.38–39).

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

§RD.3.43 (Grothendieck–Katz semicontinuity of Newton polygons for convergent F-isocrystals on schemes of finite type over a perfect field, singular ones included) and §RD.5.116 (Zarhin's trick: (A×A∨)⁴ is principally polarized).

### From TauCetiRoadmap.PadicHodgeTheory

§5.5 (the tensor-isomorphism torsor of an exact faithful tensor functor on Rep(G) over any field, with its Galois class; the local torsor theorem H¹(F,G)≅(π₁(G)_(Γ_F))_tors for every finite extension F/Q_p and connected reductive G, whose right side is nonzero for PGL₂ and for the norm-one torus of a quadratic extension, so that a tensor torsor over Q_q need not be trivial; and the period-torsor class theorem: for a weakly admissible pair (b,μ) the class of Isom^⊗(ω_std,ω_(b,μ)) in H¹(Q_p,G) is κ(b)−μ^♮, so that κ(b)=μ^♮ when that torsor is trivial).

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Layer 6 (Tannakian reconstruction: the group G_ω representing Aut^⊗(ω) for a neutral fibre functor ω, §§6.1–6.2, and the affine tensor-isomorphism torsor Isom^⊗ of two fibre functors, §6.8) and §6.3 (a tensor functor U: D→C induces G_C→G_D, a closed immersion exactly when every object of C is a subquotient of an object in the image; G_ω is of finite type exactly when one object tensor-generates with its dual, so that for a faithful representation V of an algebraic group every representation is a subquotient of a finite sum of tensor products of V and V∨). Applied to the tensor functor Rep(G)→F-Isoc of §0.6, whose image contains D, the criterion makes the Tannakian group of the category generated by D a closed subgroup of G; equality is not asserted.

### From TauCetiRoadmap.AutomorphicBundles

§§3.4–3.8 (Betti, étale and de Rham coefficients of full-group representations on the canonical tower and their tensor comparisons, including the Tate line); H¹ uses the dual representation.

### From TauCetiRoadmap.SchemeAndStackFoundations

§§1.17–1.23 (quotients, algebraic stacks, inertia, quotient-stack presentations and descent). Layer 3 here proves effectiveness for the specific arithmetic Δ-action, whose pro-level kernel need not be finite.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Layer 6 (G-rings, henselian approximation and algebraization). Rational local-model points are an additional input when ordinary henselizations are compared (§1.5).

What AlgebraicModuliForArithmeticGeometry must provide (gap:rational-stack-presentation): Layer 4. For an algebraic stack of finite type over F_q and an F_q-object, supply a smooth scheme presentation with an F_q-rational point over that object, as used in KZ Corollary 5.2.7, without extending F_q.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII

§2.4 (`exists_same_field_curve`, the same-field curve through a smooth rational point: for a scheme Y over a field k, a point y∈Y(k) with an open neighbourhood V smooth over k, and an open U⊆Y with U∩V dense in V, there are an affine curve C, smooth of relative dimension one and geometrically integral over k, a point c∈C(k) and a k-morphism g:C→Y with g(c)=y and g⁻¹(U) nonempty and dense in C; the residue fields at c and y are both k and g induces the identity between them). Nothing is assumed of Y away from V, no projectivity is required, y may lie outside U, and g need not be an immersion: when V is zero-dimensional at y the curve is A¹_k with the constant morphism. §6.3 uses it for k=F_q. The lift of a rational point to a smooth presentation of a stack and the curves through singular points of local models are not part of it.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.11, *Reductive quotients over fields and DVRs*, in its conjugation case (for G connected reductive over a field of characteristic zero, Conj(G)=Spec O(G)^G with the conjugation-invariant quotient map χ_G, finite generation, the invariant-morphism universal property and hence functoriality in G, compatibility with flat base change, and the bijection between the points of Conj(G) over an algebraically closed field and semisimple conjugacy classes, χ_G(g) being the class of the semisimple part of g), §5.1 (density of Frobenius elements, used to choose auxiliary primes) and §5.13 (function fields over finite fields: Chebotarev and recognition of semisimple lisse representations on a smooth open curve by closed-point Frobenius polynomials).

What ArithmeticGaloisRepresentations must provide (gap:noot-coarse-comparison): Layer 6. For the tensor Hodge realization of an abelian special fibre, after an extension defining its geometric endomorphisms and a neat Frobenius power with sufficiently divisible positive exponent, supply equality and rationality of its Conj′ classes at all realizations as used in HT Corollary 2.1.9, independently of the full Conj(G) conclusion of Layer 7.

### From TauCetiRoadmap.GlobalShtukasAndFunctionFieldLanglands

§6.1 (constant twists and coefficient fields) and §6.2 (compatible systems on curves).

What GlobalShtukasAndFunctionFieldLanglands must provide (gap:open-curve-companions): §§6.1–6.2, semisimple form. Let C be a smooth geometrically connected curve over F_q, not assumed proper, ℓ≠p, and L a semisimple lisse Q̄_ℓ-sheaf on C whose Frobenius eigenvalues at every closed point are algebraic numbers that are units at every finite place not above p (algebraic and p-plain, the hypothesis of §6.2, imposed on each irreducible constituent). State that there is a number field F containing the coefficients of all Frobenius characteristic polynomials of L and that, for every prime ℓ′≠p and every embedding F↪Q̄_ℓ′, there is a semisimple lisse Q̄_ℓ′-sheaf on C whose Frobenius characteristic polynomial at every closed point is the image of that of L, namely the direct sum of the companions of the irreducible constituents of L over one common finite coefficient extension. The constant twist of §6.1 and the irreducible companion of §6.2 are supplied and are not part of the gap. The p-plain hypothesis is needed: the constant rank-one Q̄_2-sheaf on A¹ over F_5 with geometric Frobenius 3 is semisimple and lisse, but a 3-adic companion would be a continuous character with Frobenius value 3, which is not a 3-adic unit.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§5.1 (Néron–Ogg–Shafarevich over a henselian discrete valuation ring: good reduction if and only if inertia acts trivially on T_ℓ, ℓ ≠ char k) and §5.2 (isogeny invariance of good reduction and descent of the abelian-scheme model from the henselisation to an arbitrary discrete valuation ring). No excellence hypothesis is assumed of the discrete valuation ring.

### From TauCetiRoadmap.ShimuraCompactifications

Layer 7 (integral PEL compactifications), extended to Hodge type by gap:component-specialization and to lattice-chain Siegel level by gap:siegel-chain-moduli.

What ShimuraCompactifications must provide (gap:siegel-chain-moduli): Layer 7, Siegel lattice-chain moduli (new target). For a symplectic Q-space (V,ψ), a prime p, a self-dual periodic Z_p-lattice chain L in V_Qp with stabilizer K′_p=GSp(L)(Z_p) and a prime-to-p level K′^p neat in the adelic sense of PELModuli §M2.2, pose over Z_(p) the moduli problem of L-indexed chains of abelian schemes up to prime-to-p isogeny, with periodicity isomorphisms, a polarization identifying the chain with its dual chain up to a scalar in Q^× (a Q-homogeneous principal polarization), and K′^p-level structure. Prove that it is represented by a quasi-projective Z_(p)-scheme carrying the universal polarized chain, with generic fibre Sh_(K′)(GSp(V),S^±) for K′=K′_pK′^p, and with finite étale transition maps for open K″^p ⊂ K′^p compatible with prime-to-p Hecke translation; and that when L consists of the lattices p^nΛ, n∈Z, for one self-dual lattice Λ, so that K′_p is hyperspecial, it is the principally polarized Siegel moduli of PELModuli §M2.8 (quasi-projective by ShimuraCompactifications §7.18). This is the Siegel moduli scheme with parahoric level given by L of KPZ Theorem 7.1.8, p.74.

What ShimuraCompactifications must provide (gap:component-specialization): Layer 7, Hodge-type integral extension. For the normal Hodge models S_K of Layer 0 at neat tame level over the completed maximal unramified local reflex ring, assuming their geometric special fibre is locally integral, prove that the special fibre of each connected integral component is geometrically irreducible, compatibly with specialization, as used in the proof of HT Corollary 1.3.16.

### From TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

§§0.1–0.2 and §0.12 (B(G), the Newton and Kottwitz maps and the PEL Newton strata), used only for the comparison Check in §4.3.

## How to read the build

Layer 0 constructs the normalized tower, its integral stacks and the canonical étale and crystalline tensors. Layer 1 proves the local structure: pointwise integral tensor frames and adapted deformation rings under very-goodness, the de Rham frame diagram to the local model, the ordinary henselian comparison, the extension property over discrete valuation rings at pro-level and at finite level, canonical integral models in the sense of Pappas–Rapoport with their uniqueness, functoriality and existence for Hodge type, and the strict henselian comparison that they give. Layer 2 constructs very-good auxiliary Hodge covers of every abelian-type datum and of strongly acceptable triples. Layer 3 descends integral models along these covers, keeping the conjugate parahoric levels of the component pieces, and constructs the adjoint local-model diagrams. Layer 4 defines Newton strata, the ordinary locus and tensor quasi-isogeny groups, and proves density of the ordinary locus and the Tate comparison. Layer 5 proves integral functoriality, carries the Newton strata and isogeny groups of Layer 4 to strongly acceptable models through a chosen Hodge embedding, and constructs ordinary special lifts with the full isogeny action. Layer 6 constructs Kottwitz–Rapoport strata and curves over the original residue field through every point. Layer 7 defines the tower local systems and Frobenius quotient points and proves that they come from one rational point of Conj(G). Each *Needs:* line lists the inputs of a statement and of its indicated proof route; a supplier gap is an obligation of that supplier, not a hypothesis of the theorem.

## Layer 0: Canonical tensors on the integral tower

### 0.1 Integral Hodge data

**Definition.** Fix p>2, a Hodge-type datum (G,X), v|p of E(G,X), and a symplectic embedding with a Z_(p)-lattice Λ or a self-dual periodic Z_p-lattice chain L. Integral Hodge data consist of a point of the extended building, its full fixer G^fix and connected parahoric G°, a closed lattice realization of the required model, a finite tensor family cutting out that model, and compatible sufficiently small prime-to-p Siegel levels. Record whether the embedding is good or very good; neither adjective is implicit. For neat compatible K^p and K_p=G^fix(Z_p), define S as the normalization of the Zariski closure of Sh_K(G,X) in the chosen integral Siegel model after base change to O_(E,v), or to its completion O_E. The Siegel model is one of two moduli problems over Z_(p). For Λ⊗Z_p contained in its ψ-dual, with K′_p its stabilizer in GSp(V_Qp), it is the moduli of abelian schemes up to prime-to-p isogeny with a polarization of the degree fixed by Λ and K′^p-level structure (PELModuli §§M6.1–M6.4). For a lattice chain L with K′_p=GSp(L)(Z_p), it is the chain-level moduli scheme of ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli). A finite normalization of the good-level model at smaller p-level (PELModuli §§M4.5–M4.6) is a different integral model with the same generic fibre and is not substituted for the chain-level one. The generic fibre of S is Sh_K(G,X). The construction retains the actual induced p-level. When Λ⊗Z_p is not self-dual the single-lattice Siegel model is supplied as a separated Deligne–Mumford stack whose neat levels are algebraic spaces (PELModuli §§M6.2–M6.4), and S is first formed as an algebraic space; the Zarhin comparison below makes it a quasi-projective scheme. *Zarhin comparison.* Let Λ_Z⊂(V⊕V^∨)^4 be the self-dual lattice built from four copies of Λ⊕Λ^∨ (Zarhin's trick, PadicDifferentialEquationsAndRigidCohomology §RD.5.116; KZ §4.3.5, p.40), with Siegel levels chosen compatibly for both embeddings (Conventions). The morphism A↦(A×A^∨)^4 from the Siegel model of Λ to the principally polarized Siegel model of Λ_Z, a quasi-projective scheme (ShimuraCompactifications §7.18), is proper, because A has good reduction over a discrete valuation ring when (A×A^∨)^4 has, its Tate modules being direct summands (NeronModelsAndSemistableAbelianVarieties §§5.1–5.2). It is quasi-finite: over a connected base T, a family in the fibre over a point B is cut out of the constant abelian scheme B×T by an idempotent endomorphism which, like the polarization, is constant by rigidity (AbelianSchemesAndArithmeticModuli §A1.2), while the level structure is locally constant, so the family is constant and, the Siegel model of Λ representing its moduli problem at a neat level, the fibres contain no curve. Being proper and quasi-finite, it is finite; it maps the closure of Sh_K for Λ finitely onto the closure for Λ_Z, restricting to the identity of Sh_K, so S is also the normalization of the closure of Sh_K in the Siegel model of Λ_Z, a quasi-projective scheme.

(KZ, §4.1.2–4.1.7, pp.29–31; KPZ §7.1.2, p.72, and Theorem 7.1.8, p.74, for the chain-level model).

*Proof sketch.* Take the scheme-theoretic Zariski closure in the Siegel model and then its normalization in the generic Hodge variety. Retain the full fixer and connected parahoric as distinct data; use the induced lattice or lattice-chain Siegel level.

*Needs:* ShimuraVarieties §P.1; ShimuraVarieties §8.1; PELModuli §§M2.2–M2.3, M4.5–M4.6, M6.1–M6.4; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); ShimuraCompactifications §7.18; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; AbelianSchemesAndArithmeticModuli §A1.2; ReductiveGroupsPartII §RG2.3; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11.

**API.**

- Return S and its generic-fibre identification with Sh_K(G,X).
- Expose G^fix, G°, K_p and their inclusion; translate KZ’s connected G-script to KPZ’s G-script-degree-zero.
- Compatible neat levels give the same normalized tower after finite étale pullback.

**Checks.**

- For GSp₂=GL₂ at hyperspecial p-level and neat tame level, the Siegel modular curve is smooth and normal; its normalization map is the identity. The chain p^nΛ of one self-dual lattice gives the same model at either kind of Siegel level.
- The chain-level model is not a finite normalization of the hyperspecial one. Take G=GSp₄ with the identity Hodge embedding, p=3 and Siegel Iwahori level, and A=E×E with its product principal polarization, where E: y²=x³−x over F₃ has the affine points (0,0),(1,0),(2,0), so #E(F₃)=4 and trace 0: E is supersingular. Then ker F_A≅α_p×α_p is Lagrangian in A[3], and its subgroups of order 3 are the lines in its two-dimensional Lie algebra, a P¹, each isotropic. So the fibre of the chain-level moduli over the point A of the hyperspecial moduli has dimension at least 1, whereas the finite normalization of PELModuli §§M4.5–M4.6 at the same level has finite fibres.
- For a Siegel Iwahori chain the connected model is not relabelled as a hyperspecial stabilizer.
- For GL₂ with empty cutting family, the smooth line local model is P¹ and every good embedding is very good. Over k[ε]/ε² the matrix [[1,ε],[0,1]] conjugates e₁=diag(1,0) to [[1,−ε],[0,0]], so an unmarked linear frame comparison cannot certify tensor preservation for a group cut out by e₁. This tests the extra tensor condition, not the existence of a non-very-good Hodge embedding.
- For a symplectic lattice Λ the lattice in (V⊕V∨)^4 furnished by the Zarhin enlargement is self-dual (KZ §4.3.5, p.40). On an elliptic curve E with principal polarization the enlargement is E⁸, of dimension 8, with product principal polarization; using only E×E∨ would give dimension 2.

*Remark.* A parahoric label alone must not certify the tensor-compatible deformation theorem.

### 0.2 Integral Shimura stacks

**Construction.** For a possibly non-neat K^p, choose neat normal K_1^p inside it and form the quotient stack [S_(K_p K_1^p)/(K^p/K_1^p)]. Comparison through a common neat normal subgroup makes this independent up to canonical equivalence. The generic fibre is the Shimura stack, and the construction carries the compatible prime-to-p Hecke action. A coarse quotient is not substituted for this stack.

(KZ, §4.1.1 and §4.1.5, pp.28–30).

*Proof sketch.* KZ permits arbitrary prime-to-p level by taking a quotient of a neat model. Pull the normalized models to a common finite étale level and apply quotient-stack descent.

*Needs:* §0.1; SchemeAndStackFoundations §§1.17–1.23; ShimuraVarieties §0.3; ShimuraVarieties §8.2; AdelicAlgebraicGroups §4.3.

**API.**

- At neat K^p the stack is represented by the normal scheme S_K of Layer 0.
- A normal refinement realizes the forgetful map as the corresponding finite étale quotient-stack cover.
- Prime-to-p right translations compose with the tower convention and commute with generic-fibre restriction.

**Checks.**

- For K_1^p=K^p neat, quotient by the trivial group returns S_K.
- An automorphism of a polarized abelian point preserving the level occurs in its stack inertia.
- Two neat normal refinements give equivalent quotients via their intersection, including inertia, not just equal coarse point sets.

*Remark.* Stabilizers at non-neat points remain visible.

### 0.3 Prime-to-p integral tower

**Theorem.** For the p-level K_p of integral Hodge data (§0.1) and neat prime-to-p levels K_1^p normal in K_2^p with compatible Siegel levels, the transition S_(K_pK_1^p)→S_(K_pK_2^p) is finite étale, and K_2^p/K_1^p acts on its source over its target, simply transitively on geometric fibres; the pro-object carries a continuous G(A_f^p)-action. On normal components the promoted tensor-compatible level sections are uniquely determined by their generic restrictions.

(HT, §2.1.1–2.1.2, p.21; KZ §4.1.5, p.30).

*Proof sketch.* HT constructs the prime-to-p tower and extends its tensor-compatible sections across the normal model. Use the finite étale Siegel level maps and normalization to transfer the transition maps; extend equality of sections by normality. On the generic fibre K_2^p/K_1^p acts freely, because at neat level the stabilizer of a point is central and, (G,X) being of Hodge type, Z_G(Q) is discrete in Z_G(A_f) (SV5, ShimuraData §4.2) and meets a neat level only in the identity; the action map from the product of the source with the finite group to the fibre product of the source with itself over the target is a map of finite étale covers of the source that is an isomorphism over the dense generic fibre, hence an isomorphism.

*Needs:* §0.1; ShimuraVarieties §8.2; ShimuraData Layer 4; PELModuli §§M6.1–M6.4; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); AdelicAlgebraicGroups §4.3; AbelianSchemesAndArithmeticModuli §A4.1; SchemeAndStackFoundations §§1.17–1.23.

*Remark.* Keep pro-level extension statements separate from finite-level statements.

### 0.4 Integral étale Hodge tensors

**Construction.** Pull the universal abelian scheme to a neat Hodge model. Its absolute Hodge tensors give prime-to-p étale tensor sections on H¹ and, by mixed-tensor duality, on H₁=T_ℓ(A)⊗Q_ℓ. They are invariant under the arithmetic fundamental group and compatible with Hecke maps and base change. The tower torsor is Isom_tensor(V_Qℓ,H₁), rather than the frame torsor of H¹. The cohomological realization H¹=H₁∨ is its contragredient; for a symplectic representation of multiplier c, H₁∨≅H₁⊗c⁻¹. Geometric q-Frobenius has multiplier q⁻¹ on H₁ and q on H¹.

(KZ, §4.1.6–4.1.7, pp.30–31; §5.1.1, p.47).

*Proof sketch.* KZ identifies the tower frame torsor with the étale realizations of the defining Hodge tensors. Use the generic absolute-Hodge realization and normal extension of prime-to-p sections, then descend from neat covers.

*Needs:* §0.3; AbelianSchemesAndArithmeticModuli §A4.1; AutomorphicBundles §§3.4–3.8.

**API.**

- A tower tensor frame identifies V_Qℓ with H₁=T_ℓ(A)⊗Q_ℓ; dualizing it identifies V_Qℓ∨ with H¹_ét.
- Étale tensors pull back along prime-to-p Hecke and integral datum maps when those maps are established.
- Transport the alternating pairing H₁×H₁→Q_ℓ(1); the dual pairing on H¹ takes values in Q_ℓ(−1), and H¹≅H₁⊗c⁻¹.

**Checks.**

- For E/F₅ of trace 2, H¹ has polynomial T²−2T+5 and multiplier 5. The tower on H₁ has polynomial T²−(2/5)T+1/5 and multiplier 1/5. Twisting H₁ by c⁻¹ multiplies both eigenvalues by 5, giving the H¹ polynomial again.
- On a product, the projection idempotents are among the tensors; off-diagonal automorphisms fail to be tensor frames.
- Changing a tensor frame conjugates Frobenius in G(Q_ℓ); changing ℓ does not identify the coefficient fields.

*Remark.* The polarization is a similitude tensor with its Tate line; its scalar multiplier is not forced to one.

### 0.5 Lift-independent crystalline tensors

**Theorem.** For a geometric special-fibre point x of the normal Hodge model, every characteristic-zero lift through x gives the same rational Frobenius-invariant tensors in D(A_x[p∞])[1/p]^⊗, under the crystalline–de Rham comparisons. This independence holds across the lifts belonging to that normalization point; equality of underlying Siegel points alone does not identify different normalization branches. Integrality is a separate assertion requiring the integral embedding input.

(HT, Proposition 1.3.7, pp.17–18).

*Proof sketch.* HT uses horizontal transport on the connected normal formal neighbourhood to compare the realizations from different lifts. Apply crystalline–de Rham compatibility for absolute Hodge cycles and uniqueness of parallel sections on the rigid generic fibre.

*Needs:* §0.4; AbelianSchemesAndArithmeticModuli §A4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2; CrystallineCohomology §CR.7.3 (gap:cr-crystalline-parallel-transport); ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension).

*Remark.* Do not deduce integral tensors solely from rational comparison.

### 0.6 Universal crystalline tensor functor

**Construction.** On the geometric special fibre of a neat normal Hodge model, the universal abelian p-divisible group determines a convergent F-isocrystal D together with global Frobenius-invariant defining tensors. Their fibres are the lift-independent tensors. Tensor frames give an exact faithful Q_p-linear tensor functor Rep(G_Qp)→F-Isoc(S_k), sending the dual of the standard tower representation to D, with scalar-extended fibre functors over L=Frac W(k). After scalar extension and choice of fibre functor, the Tannakian group H of the category generated by D is a subgroup of the tensor stabilizer in the cohomological representation; it need not be the full group. Geometric monodromy after forgetting Frobenius is a different subgroup.

(HT, Proposition 1.3.12 and Corollary 1.3.13, p.19; Appendix A.4–A.7, pp.38–39).

*Proof sketch.* HT globalizes the crystalline tensor sections using semistable alterations and proper descent. Import the general log-Dieudonné comparison, alteration descent and convergent-isocrystal full faithfulness; specialize them to the universal Hodge family. Construct the Rep(G)-functor through the tensor frame torsor. Restriction to H explains why generated-category equivalence with all Rep(G) is unnecessary.

*Needs:* §0.5; CrystallineCohomology §CR.7.1 (gap:cr-isocrystal-tensor-descent); MotivesAndAlgebraicCycles Layer 6; BunGAndNewtonStrata §0.8.

**API.**

- The fibre at x is the pointwise G-isocrystal cut out by its canonical rational tensors.
- Preserve unit, duals, tensor products and exact sequences; compare the dual of the standard tower representation with contravariant D.
- Pullback of the universal abelian scheme and of global tensor sections commutes with extension of the residue field.

**Checks.**

- For a constant ordinary elliptic family, D has slopes (0,1) and determinant slope 1. Geometric horizontal monodromy after forgetting Frobenius is 1; the tensor category with Frobenius contains 1(−1) and has a nontrivial slope torus. It cannot have trivial Tannakian group.
- For the contravariant Dieudonné realization, an ordinary elliptic fibre has slopes 0 and 1, with Newton bound from μ_h⁻¹.
- Removing a tensor enlarges the allowed structure group; it cannot create an equivalence of the generated category with the unchanged Rep(G).

*Remark.* For a constant ordinary elliptic family, Frobenius-forgetting geometric monodromy is trivial, but the category generated by D contains its determinant 1(−1), so H has a nontrivial slope-torus quotient.

### Examples

At hyperspecial GL₂ level the normalization is the smooth modular curve. At non-neat level the central automorphism −1 survives as stack inertia. For p∤3 the cover Y(9)→Y(3) has degree 3⁴=81 on the full-level tower.

### Dependencies

*Needs:* ShimuraVarieties §P.1; ShimuraVarieties §8.1; ShimuraVarieties §8.2; ShimuraData Layer 4; PELModuli §§M2.2–M2.3, M4.5–M4.6, M6.1–M6.4; ShimuraCompactifications §7.18; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; AbelianSchemesAndArithmeticModuli §A1.2; ReductiveGroupsPartII §RG2.3; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; SchemeAndStackFoundations §§1.17–1.23; AbelianSchemesAndArithmeticModuli §A4.1; AutomorphicBundles §§3.4–3.8; AbelianSchemesAndArithmeticModuli §A4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2; CrystallineCohomology §CR.7.3 (gap:cr-crystalline-parallel-transport); CrystallineCohomology §CR.7.1 (gap:cr-isocrystal-tensor-descent); MotivesAndAlgebraicCycles Layer 6; BunGAndNewtonStrata §0.8; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11; ShimuraVarieties §0.3; AdelicAlgebraicGroups §4.3.

## Layer 1: Local geometry of Hodge-type models

### 1.1 Pointwise Hodge comparison

**Theorem.** For p>2 and a geometric point x of the normalized Hodge model, choose a lift over O_K, with K a finite totally ramified extension of Q̆_p, and the prescribed smooth full-fixer integral tensor stabilizer. Apply the integral tensor comparison to the abelian fibre: the canonical tensors at x are integral in its contravariant Dieudonné module, the W(k)-frame transports the chosen lattice dual and tensors to that module, and the lift filtration is induced by a G-cocharacter conjugate to μ_h⁻¹. This is the Shimura point specialization of the imported comparison; the general crystalline tensor theorem and torsor triviality are stated in FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4.

(KZ, §4.1.7, pp.30–31, especially (4.1.7.1)).

*Proof sketch.* Identify the p-adic absolute Hodge tensors of the abelian lift and apply the integral tensor comparison. Transport the integral frame to crystalline and de Rham evaluation as in KZ §4.1.7.

*Needs:* §0.5; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4; ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension).

*Remark.* Rationally equal tensors with different integral lattices do not pass this statement.

### 1.2 Adapted normalization branches

**Theorem.** For the good Hodge normalization with G^fix=G°, neat K^p, and x above a point of the Siegel closure, assume the embedding is very good at its corresponding local-model point y. The completion of the chosen normalization component identifies with the versal (G,μ)-adapted deformation ring R_G. An integral lift belongs to this branch exactly when its p-divisible group with the specified tensors is adapted. The condition uses the integral Frobenius tensors and the G-split Hodge filtration, not only the rational Newton class.

(KZ, Proposition 4.1.9, pp.31–32, under §4.1.3 (A′)–(B′)).

*Proof sketch.* Apply the versal adapted deformation theorem at y. Use Serre–Tate and integral point recognition to identify the chosen branch, in both directions.

*Needs:* §0.1; §0.5; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §4.12; AbelianSchemesAndArithmeticModuli §A4.9; AlgebraicModuliForArithmeticGeometry Layer 6; §1.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1.

*Remark.* The adapted-ring comparison must name a particular normalization branch.

### 1.3 Tensors distinguish normalization points

**Theorem.** Suppose two geometric points of the normal Hodge model have the same image in the Siegel closure and the induced identification of their abelian varieties identifies all their crystalline tensors. For a good Hodge normalization with G^fix=G°, neat K^p and very-goodness at the corresponding point y, the two normalization points are equal. No assertion is made from equality of the underlying abelian varieties without the tensors.

(KZ, Proposition 4.1.9(3), pp.31–32).

*Proof sketch.* KZ detects the normalization branch by its adapted tensor deformation ring. The common tensors select the same completed component; use finiteness of normalization and the branch criterion to identify the points.

*Needs:* §1.2; §1.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11.

*Remark.* The identity on a Siegel fibre must still be tested on the complete tensor family.

### 1.4 Hodge local-model diagram

**Construction.** In the very-good Hodge setup, let A be the universal abelian scheme over S, H¹_dR(A/S) its first de Rham cohomology and s_α,dR the de Rham realizations of the defining absolute Hodge tensors, sections of H¹_dR^⊗ over the generic fibre defined over E. These extend to sections of H¹_dR(A/S)^⊗ over S: as S is normal it suffices that their pullback to every O_K-point is integral, and at a point through the special fibre this is the comparison of §1.1 (KP Proposition 4.2.6 and its proof, p.186). The scheme S̃ of integral de Rham tensor frames, the trivializations Hom(Λ,O_S)≅H¹_dR(A/S), Λ the lattice of the very-good integral embedding, carrying each s_α to s_α,dR, is a G^fix-torsor π:S̃→S. Sending a frame to the Hodge filtration gives an equivariant smooth map q:S̃→M_loc(G,{μ_h}) of relative dimension dim G. The local model is the imported canonical flat closure. The smooth action morphism G^fix×M_loc→M_loc is not asserted to be a torsor.

Assume the very-good Hodge setup of Conventions.

(KPZ, Theorem 7.1.3, pp.72–73; §7.3.1(1), p.85; KP Proposition 4.2.6, p.186, for the extension of the de Rham tensors).

*Proof sketch.* KPZ proves the tensor-compatible local-model comparison under very-goodness, with smoothness of the frame-to-filtration map. Glue local tensor frames and identify the deformation map with the local-model action chart using the very-good trivialization.

*Needs:* §1.2; §1.1; §0.4; ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension); AbelianSchemesAndArithmeticModuli §A4.3; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models).

**API.**

- Sections of π are integral tensor-compatible trivializations of H¹_dR.
- q sends a frame to the transported Hodge filtration and is G^fix-equivariant.
- The frame diagram pulls back under residue-field and reflex-base extensions and finite prime-to-p level maps.

**Checks.**

- The standard Siegel frame diagram recovers its usual Lagrangian filtration map.
- The relative dimension of q equals dim G, whereas dim S equals dim M_loc; q is not assigned relative dimension zero.
- In the Siegel case, a frame change outside the filtration stabilizer moves q while fixing π. Thus q is not invariant for the frame-torsor action; smooth equivariance is its correct property.

*Remark.* Separate the torsor map π from the smooth map q.

### 1.5 Same-field henselization comparison

**Theorem.** In the very-good Hodge setup with G^fix=G°, for every x∈S(k′) with k′/k_E a finite residue-field extension there exists y∈M_loc(k′) for which the ordinary henselizations of the local rings at x and y are isomorphic as local base algebras. The residue field remains k′. Strict henselizations alone do not supply this assertion.

Assume the very-good Hodge setup of Conventions.

(KPZ, Theorem 7.1.3(3), p.73).

*Proof sketch.* KPZ gives the henselized comparison with a local-model point over the same residue field when the frame group is connected. Use smoothness and the connected-frame lifting argument in the diagram of §1.4.

*Needs:* §1.4; ReductiveGroupsPartII §RG2.3; AlgebraicModuliForArithmeticGeometry Layer 6.

*Remark.* For finite k′, the local-model comparison point must be k′-rational.

### 1.6 Extension over discrete valuation rings

**Theorem (pro-level).** For the normalized Hodge tower at fixed p-level and every discrete valuation O_E-algebra R of mixed characteristic (0,p), restriction gives a bijection lim_(K^p) S_(K_pK^p)(R)→Sh_(K_p)(R[1/p]). The proof uses the complete prime-to-p level system to force good reduction and then the finite-level criterion below. It does not assert that every finite-level generic point has good reduction.

(KPZ, Theorem 7.1.3(1), p.73; HT, Lemma 1.3.6, p.17, for the finite-level criterion).

*Proof sketch.* HT proves the extension property for the full prime-to-p tower. A point of the pro-tower over R[1/p] has its whole prime-to-p Tate module rational, so inertia acts trivially on it and the abelian variety has good reduction (Néron–Ogg–Shafarevich); apply the finite-level criterion at each level.

*Needs:* §0.1; §0.3; PELModuli §§M2.2–M2.3, M4.5–M4.6, M6.1–M6.4; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); NeronModelsAndSemistableAbelianVarieties §§5.1–5.2.

**Theorem (finite level).** Let K^p be sufficiently small with compatible Siegel level K′^p (Conventions), R a discrete valuation ring of mixed characteristic (0,p) over O_(E,v) with fraction field F, s∈Sh_K(G,X)(F), and A_s the pullback to s of the universal abelian scheme of the Siegel model of §0.1 (at chain level, any member of the universal chain; its members are isogenous). The following are equivalent: (i) s extends to a point of S_K(R); (ii) A_s has good reduction; (iii) A_s has potentially good reduction.

(HT, Lemma 1.3.6, p.17.)

*Proof sketch.* (i)⇒(ii) by pulling back the universal abelian scheme, and (ii)⇒(iii) trivially. (iii)⇒(i), by descent as in HT: let F′/F be a finite Galois extension over which A_s has good reduction (F′=F under (ii)) and R″ the integral closure of R in F′, a semi-local Dedekind ring, finite and faithfully flat over R because F has characteristic zero. The valuations of F′ over R are Galois conjugate and A_s is defined over F, so A_s has good reduction at every maximal ideal of R″; the abelian scheme, its polarization, the isogenies of the chain and the level structure extend over R″ by the Néron mapping property, the prime-to-p Tate module being unramified there (NeronModelsAndSemistableAbelianVarieties §§5.1–5.2). This is an R″-point of the Siegel model. Its two pullbacks to R″⊗_R R″ agree on the generic fibre, which is schematically dense because R″⊗_R R″ is flat over R, and the Siegel model is separated, so they agree; by fppf descent the R″-point comes from an R-point. Here the neatness of K′^p enters: the objects of the Siegel moduli problem at that level have no nontrivial automorphisms (PELModuli §M2.3), so the Siegel model represents the moduli problem and its points descend. The generic point of the R-point lies in the closed subscheme Sh_K, so the R-point lies in the Zariski closure, and it lifts to the normalization S_K because R is normal and S_K is finite over the closure and an isomorphism over Sh_K.

*Needs:* §0.1; PELModuli §§M2.2–M2.3, M6.1–M6.4; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; AdelicAlgebraicGroups §4.3.

*Remark.* A finite-level abelian variety with bad reduction is not a counterexample to the pro-level statement. Neatness of the Siegel level cannot be dropped from the finite-level theorem: at the level GL₂(Ẑ^p) of the modular curve, which is not neat (Checks of Conventions), the point j=0 of the coarse j-line is Q_p-rational and extends over Z_p, while for p≥5 the curve E: y²=x³+p, with j=0, has additive reduction over Q_p (c₄=0 and v_p(Δ)=v_p(−16·27·p²)=2) and only potentially good reduction.

### 1.7 Canonical integral models

**Definition.** Let (G,X) be a Shimura datum of Hodge type, p>2, v|p a place of E=E(G,X) with completed ring of integers O_E, z a point of the extended building of G_Qp with full fixer G^fix and connected parahoric G°, and 𝒢 a quasi-parahoric model at z: a smooth open subgroup scheme of G^fix containing G°, for instance G° or G^fix. Put K_p=𝒢(Z_p) and μ=μ_h. The levels K′_pK^p, with K′_p⊂K_p open, form a pro-étale K_p-torsor over Sh_K(G,X)⊗E; for Hodge type it is the torsor of tensor-preserving trivializations of the p-adic Tate module of the universal abelian scheme (PaRa24 §4.5.2, p.86), and the generic shtuka P_(K,E) is the 𝒢-shtuka with one leg bounded by μ over the v-sheaf of Sh_K(G,X)⊗E attached to it (PaRa24 Proposition 4.1.2, p.77). A canonical integral model of the tower at level 𝒢 is a system (S_K), K=K_pK^p with K^p running over the neat prime-to-p levels, of normal flat separated finite-type O_E-schemes with generic fibres Sh_K(G,X)⊗E, such that:

- (a) for every discrete valuation ring R of mixed characteristic (0,p) over O_E, restriction gives a bijection lim_(K^p) S_K(R)→Sh_(K_p)(R[1/p]);
- (b) for g∈G(A_f^p) and neat K′^p, K^p with g⁻¹K′^pg⊂K^p, the right translation T_g: Sh_(K_pK′^p)(G,X)⊗E→Sh_(K_pK^p)(G,X)⊗E of ShimuraVarieties §8.2, [x,a]↦[x,ag], extends to a finite étale morphism S_(K_pK′^p)→S_(K_pK^p) (PaRa24 writes the same condition for [g]=T_(g⁻¹), with gK′^pg⁻¹⊂K^p; as g runs over G(A_f^p) the two forms of the axiom are equivalent);
- (c) P_(K,E) extends to a 𝒢-shtuka P_K over the v-sheaf of S_K over Spd O_E;
- (d) for every x∈S_K(k), with b_x∈G(Q̆_p) read off from a trivialization of the 𝒢-torsor underlying the fibre of P_K at x (well defined up to σ-conjugation by 𝒢(Z̆_p)), there is an isomorphism Θ_x from the formal completion of the integral local Shimura variety M^int_(𝒢,b_x,μ) at its base point onto the v-sheaf of the completion of S_K⊗O_Ĕ at x, carrying P_K to the universal shtuka.

(PaRa24, Conjecture 4.2.2 with the base point (4.2.1), p.78, for parahoric 𝒢; DvHKZ, Definition 4.1.2, p.28, for quasi-parahoric 𝒢.) PaRa24 states the same axioms for every Shimura datum satisfying its condition (4.1.1); this roadmap states and uses them for data of Hodge type. DvHKZ ask for (d) at the points over every algebraically closed field of characteristic p with an embedding of the residue field of E; the Definition here asks for it at k-points only, as PaRa24 does. The uniqueness and functoriality theorem below uses only k-points, and the Hodge-type theorem below gives the stronger form (DvHKZ Theorem 4.1.8, p.30, and Lemma 4.2.1 with its proof, p.36).

*Needs:* §0.1; §0.4; ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension); HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); DiamondsAndVStacksPartII §D9.8.

**API.**

- The extension P_K of (c) is unique up to unique isomorphism, and the maps of (b) carry P_K to the shtuka of the source level (PaRa24 Corollary 2.7.10, p.50, through gap:integral-local-shimura).
- Condition (d) does not depend on the representative b_x: replacing b_x by gb_xσ(g)⁻¹ with g∈𝒢(Z̆_p) gives an isomorphism of integral local Shimura varieties preserving base points (PaRa24, after Conjecture 4.2.2, p.78).
- Condition (d) at x determines the completed local ring of S_K⊗O_Ĕ at x up to isomorphism, because flat normal formal schemes are determined by their v-sheaves (DiamondsAndVStacksPartII §D10.11).

**Checks.**

- Take the modular curve at hyperspecial level (G=GL₂, 𝒢=GL₂ over Z_p, μ=(1,0)) and delete from its smooth models the supersingular locus, which is finite and stable under the prime-to-p Hecke maps. The result satisfies (b), (c) and (d) but not (a): an elliptic curve over W(k)[1/p] with good supersingular reduction has all its prime-to-p torsion rational, because inertia acts trivially on it, so it gives a point of the pro-tower over W(k)[1/p] with no extension to the deleted model.
- Blow up the same models along the supersingular locus instead. The blow-up is proper, an isomorphism on generic fibres and compatible with the finite étale Hecke maps, so (a)–(c) still hold. Condition (d) fails at the point where the exceptional line meets the strict transform of the special fibre: there the completed local ring is W[[t,v]]/(tv−p), whose special fibre is a node, while the formal completion of M^int at the base point is that of the original model, W[[t]].
- For G=GSp₄ with the identity Hodge embedding, p=3 and Siegel Iwahori level, the finite normalization N of the hyperspecial model in the Iwahori-level generic fibre (PELModuli §§M4.5–M4.6) is not a canonical integral model. The chain-level model S of §0.1 is one, by the Hodge-type theorem below. By uniqueness N would be isomorphic to S over the generic fibre, and by the uniqueness of extended maps the level-change map S→(hyperspecial model) of the functoriality theorem would then be finite. But its fibre over the supersingular point A=E×E of the Check of §0.1 has dimension at least one.
- The single-lattice case needs the Zarhin step of the Hodge-type theorem. Take G=GL₂×_(G_m)GL₂, the pairs of equal determinant, on V=V₁⊕V₂ with V_i=Q² of basis e_i,f_i and the form ψ₁⊕p²ψ₂, ψ_i(e_i,f_i)=1, and Λ the Z_(p)-span of e₁,f₁,e₂,f₂. The stabilizer of Λ⊗Z̆_p in G(Q̆_p) is the hyperspecial G(Z̆_p), so the theorem applies, but Λ^∨/Λ≅(Z/p²)². The lattice M=Λ+pΛ^∨, spanned by e₁,f₁,e₂/p,f₂/p, is self-dual; every element of GSp(V_Qp) stabilizing Λ has unit multiplier, hence stabilizes Λ^∨ and M; and Λ is the inverse image in M of the plane spanned by e₁,f₁ modulo p, which is nondegenerate. So the stabilizer of Λ⊗Z̆_p in GSp(V)(Q̆_p) is the inverse image in the hyperspecial GSp(M)(Z̆_p) of the stabilizer of a nondegenerate plane, a connected reductive group of dimension 7 that is not solvable and so contains no Borel subgroup of GSp₄, which also has dimension 7. Hence it contains no Iwahori subgroup (an Iwahori subgroup inside GSp(M)(Z̆_p) is the inverse image of the k̄-points of a Borel subgroup), it is not quasi-parahoric, and DvHKZ Lemma 4.2.1 says nothing about the Siegel model of Λ. The Zarhin lattice built from four copies of Λ⊕Λ^∨ is self-dual, and its stabilizer in G(Q̆_p) is again G(Z̆_p).

**Theorem (uniqueness and functoriality).** (1) Two canonical integral models of the same tower at the same level 𝒢 are related by a unique system of isomorphisms that restrict to the identity on generic fibres and commute with the maps of (b). (2) Let f:(G,X)→(G′,X′) be a morphism of Hodge-type Shimura data and 𝒢, 𝒢′ quasi-parahoric models at points z, z′ of the extended buildings of G_Qp and G′_Qp such that f extends to a homomorphism 𝒢→𝒢′, and let canonical integral models (S_K) and (S′_K′) at these levels be given. For neat K^p and K′^p with f(K^p)⊂K′^p, the map Sh_K(G,X)→Sh_K′(G′,X′)⊗E extends uniquely to S_K→S′_K′⊗_(O_E′)O_E. These maps commute with the maps of (b), and they pull P′_K′ back to the push-out of P_K along 𝒢→𝒢′.

(PaRa24, Theorem 4.2.4, p.79, and Theorem 4.3.1 with Corollary 4.3.2, pp.82–83, for parahoric levels; DvHKZ, Proposition 4.1.10, p.31, and Corollary 4.1.13, p.34.)

*Proof sketch.* For (2), normalize the closure of the graph of the generic map in S_K×_(O_E)S′_K′. Its projection to S_K is an isomorphism on generic fibres. By the uniqueness of shtuka extensions, the pullback of P_K, pushed out to 𝒢′, agrees on it with the pullback of P′_K′. Then, as in the proof of uniqueness, the torsor of trivializations of the shtuka near a point of the special fibre and axiom (d) for S_K show that the projection induces isomorphisms of completions at geometric points of the special fibre (PaRa24 §4.8; DvHKZ proof of Proposition 4.1.10). So the projection is quasi-finite and birational onto the normal scheme S_K, hence an open immersion by Zariski's main theorem. It is surjective: by flatness a k-point of S_K lifts to a point x̃ over the ring of integers O_F of a finite extension F of Ĕ; the prime-to-p tower of S_K, finite étale by (b), is trivial over the strictly henselian O_F, so the image of the generic point of x̃ in Sh_K′(G′,X′) lifts to the prime-to-p pro-tower over F and extends over O_F by (a) for (S′_K′); the pair of extensions lies in the closure of the graph and lifts to its normalization because O_F is normal. So the projection is an isomorphism (DvHKZ proof of Proposition 4.1.10, pp.31–34). Compose its inverse with the second projection. Uniqueness holds because the models are flat and separated, so a map is determined by its generic fibre. Part (1) is (2) for the identity in both directions.

*Needs:* the Definition above; HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); DiamondsAndVStacksPartII §§D9.8, D10.11.

**Theorem (Hodge type).** Let p>2 and let integral Hodge data as in §0.1 be given, with full fixer G^fix and connected parahoric G°, such that G^fix(Z̆_p) is the stabilizer in G(Q̆_p) of Λ⊗Z̆_p for the single lattice Λ, or of L⊗Z̆_p for the lattice chain L. Then the normalized Hodge models S_K of §0.1, with K_p=G^fix(Z_p), form a canonical integral model at level G^fix. For every quasi-parahoric 𝒢 with G°⊂𝒢⊂G^fix, the relative normalizations of the S_K in Sh_(𝒢(Z_p)K^p)(G,X) form a canonical integral model at level 𝒢, and the maps between these levels are finite étale. In particular the S_K are independent of the Hodge embedding and of the lattice or chain within this scope.

(PaRa24, Theorem 4.5.2, p.87, for G^fix=G° at chain level; DvHKZ, Theorem 4.1.8, p.30, Theorem 4.1.15, p.35, Lemma 4.2.1, p.36, Theorem 4.2.3 and its proof, pp.36–37, and Remark 4.2.4, p.37; KPZ Remark 7.1.9(b), p.74.)

*Proof sketch.* Property (a) is the pro-level theorem of §1.6 and (b) the finite étale transitions of §0.3. In the chain case GSp(L) is a parahoric group scheme of GSp(V_Qp), its Siegel model is a canonical integral model (DvHKZ Lemma 4.2.1), and DvHKZ Theorem 4.1.8, whose hypothesis is the stabilizer equality, gives (c) and (d) for the normalized closure: the generic shtuka of the tensor-frame torsor extends over it by the integral tensors (§0.5, §1.1) and purity for torsors under quasi-parahoric group schemes, and its completions are compared with those of the Siegel model, the Hodge locus being cut out by the tensors (PaRa24 §§4.6–4.7). In the single-lattice case the stabilizer of Λ in GSp(V_Qp) need not be quasi-parahoric (Checks above), so first pass to Zarhin's enlargement (§0.1; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; KZ §4.3.5, p.40): the Hodge embedding of G on (V⊕V^∨)^4 with the self-dual lattice Λ_Z built from four copies of Λ⊕Λ^∨. An element of G(Q̆_p) stabilizing Λ⊗Z̆_p has a unit multiplier, since its determinant on V is a power of the multiplier, so it also stabilizes Λ^∨⊗Z̆_p; hence the stabilizer of Λ_Z⊗Z̆_p in G(Q̆_p) is G^fix(Z̆_p). The stabilizer of Λ_Z in the symplectic similitude group is hyperspecial, so the chain case, for the chain of the multiples p^nΛ_Z, makes the normalized closure S′_K of Sh_K in the Siegel model of Λ_Z a canonical integral model at level G^fix, with Siegel levels chosen compatibly for both embeddings (Conventions). By the Zarhin comparison of §0.1 the two normalizations agree: S_K=S′_K. Smaller quasi-parahoric levels are reached by relative normalization (DvHKZ Theorem 4.1.15).

*Needs:* §0.1; §0.3; §0.4; §0.5; §1.1; §1.6; PELModuli §§M2.2–M2.3, M6.1–M6.4; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension); HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); DiamondsAndVStacksPartII §§D9.8, D10.11; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2.

### 1.8 Strict comparison with lattice-chain level

**Theorem.** Assume p>2 and a Hodge embedding into a Siegel datum with a self-dual periodic lattice chain L such that G^fix(Z̆_p)=G(Q̆_p)∩GSp(L)(Z̆_p). Take K_p=G^fix(Z_p) and the normalized Hodge closure in the Siegel moduli scheme at level GSp(L)(Z_p) (gap:siegel-chain-moduli), not in a finite normalization of the single-lattice model. At every geometric point x of the special fibre there is a geometric local-model point y for which the strict henselizations, and their completions, are isomorphic. No global very-good embedding or R-smoothness hypothesis is imposed on the given datum; very-good embeddings of auxiliary local data enter only through the local representability theorem (KPZ Remark 7.1.9(a), p.74). The result does not yield a rational local-model point over a prescribed finite residue field.

(KPZ, Theorem 7.1.8 and its proof, p.74.)

*Proof sketch.* By Artin approximation it suffices to identify the completions of S_K⊗O_Ĕ at x and of M_loc⊗O_Ĕ at a point y; both rings are normal. By the Hodge-type theorem of §1.7 and its axiom (d), the v-sheaf of the first is the formal completion of M^int_(G^fix,b_x,μ_h) at its base point. By the local representability theorem (gap:integral-local-shimura) this is the v-sheaf of the second, for a point y obtained from a trivialization of the torsor underlying the shtuka at x. Flat normal formal schemes with isomorphic v-sheaves are isomorphic (DiamondsAndVStacksPartII §D10.11). The display-based embedding-independence argument needs a very-good embedding (KPZ §7.3.2, p.87) and is not used. Keep strict and ordinary henselizations distinct.

*Needs:* §0.1; §1.7; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); DiamondsAndVStacksPartII §D10.11; AlgebraicModuliForArithmeticGeometry Layer 6.

### 1.9 Special fibre and very-special geometry

**Theorem.** In the very-good Hodge setup the special fibre of the Hodge model is reduced, and at every geometric point the irreducible components of the strict henselization of its local ring are normal; both properties are transferred from the local model through the diagram of §1.4. When G^fix=G°, every irreducible component of the geometric special fibre is normal. At very special parahoric level the relevant local-model special fibre is geometrically integral, and the Shimura special fibre is locally integral. This does not assert local integrality at an arbitrary parahoric crossing.

Assume the very-good Hodge setup of Conventions.

(KP, Corollary 0.3, p.124; KPZ, Theorem 7.1.3(2), pp.72–73; KZ, Theorem 4.4.4, p.43; KPZ Theorem 7.2.21(2), pp.84–85).

*Proof sketch.* KZ uses the unique extremal Schubert component at very special level to obtain local integrality. Reducedness, and normality of the irreducible components of strict henselizations, are local in the smooth topology on excellent schemes, so they pass from the local model to the frame scheme along q and descend along the surjective smooth π; the very-special integral case passes the same way. When G^fix=G° the torsor group has connected special fibre, so the inverse image under π of an irreducible component Y of the geometric special fibre is irreducible; it is then an irreducible component of the special fibre of the frame scheme, hence a connected component of q⁻¹ of a normal irreducible component of the local-model special fibre, so it is normal, and Y is normal by descent of normality along the smooth surjection π.

*Needs:* §1.4; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); GeometricSatakeAndFusionPartII §3.7; GeometricSatakeAndFusion Layer GS0.

*Remark.* An Iwahori special-fibre crossing must not be declared locally integral. The strictly local form does not by itself give normal global components: a curve with a node has two regular branches in the strict henselization at the node, yet its single irreducible component is not normal there. With a disconnected full fixer the inverse image of a component may consist of several components of the frame scheme meeting each other, and the global form is asserted only for G^fix=G°.

### Examples

For the hyperspecial modular curve, dim GL₂=4, dim S=dim P¹=1 and dim S̃=5; the filtration map is smooth of relative dimension 4. At a Γ₀(p) crossing the completed special local ring k[[u,v]]/(uv) has two components and is not integral.

### Dependencies

*Needs:* §0.5; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4; §0.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §4.12; AbelianSchemesAndArithmeticModuli §A4.9; AlgebraicModuliForArithmeticGeometry Layer 6; AbelianSchemesAndArithmeticModuli §A4.3; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); ReductiveGroupsPartII §RG2.3; HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); §0.3; PELModuli §§M2.2–M2.3, M4.5–M4.6, M6.1–M6.4; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; GeometricSatakeAndFusion Layer GS0; ShimuraCompactifications Layer 7 (gap:siegel-chain-moduli); ShimuraVarieties §7.0i (gap:integral-hodge-realization-extension); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1; §0.4; DiamondsAndVStacksPartII §§D9.8, D10.11; AdelicAlgebraicGroups §4.3; GeometricSatakeAndFusionPartII §3.7; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; AbelianSchemesAndArithmeticModuli §A1.2.

## Layer 2: Auxiliary Hodge covers

### 2.1 Strongly acceptable Shimura triples

**Definition.** A strongly acceptable triple is (G,X,G°) with (G,X) of Hodge type, G_der,Qp a product of restrictions of scalars of split reductive groups over finite extensions of Q_p, and Z_G^c generated by the maximal compact real central subtorus and Z_(G_der), such that Z_G^c,Qp is a product of induced tori. Its level model is the connected parahoric at a very-special building point: after base change to the completed maximal unramified field it is a special parahoric. The group-level adjective alone does not specify a parahoric.

(KZ, Definition 4.2.2, p.34).

*Proof sketch.* KZ isolates these local derived and central conditions for integral functoriality and the ordinary-lifting argument. Package the conditions with the datum and the chosen connected parahoric, exposing each hypothesis separately.

*Needs:* ShimuraVarieties §P.1; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartII §RG2.1.

**API.**

- Expose the split restriction-of-scalars decomposition after Q_p base change.
- Expose Z_G^c and its induced-torus description, retaining its inclusion of the derived centre.
- Return the connected parahoric and its verified very-special building point.

**Checks.**

- For the PEL datum GU(1,1) of an imaginary quadratic field split at p, the local derived group is SL₂ and Z_G^c,Qp is the split norm-one torus G_m. A hyperspecial vertex therefore gives a strongly acceptable triple.
- For GSp_(2g), g≥1, the maximal compact central subtorus is trivial and Z_G^c=μ₂. This finite group is not an induced torus, so a split group and hyperspecial level alone do not establish strong acceptability.
- For the split-at-p unitary example, a hyperspecial vertex supplies a very-special triple, while an Iwahori does not.

*Remark.* A strongly acceptable datum at an Iwahori does not define a strongly acceptable triple.

### 2.2 Reflex splitting for auxiliary covers

**Theorem.** For an abelian-type datum (G_2,X_2) and p>2, the auxiliary Hodge cover can be chosen so that every v_2|p of E_2 splits completely in E E_2/E_2. The CM scalar field is chosen to split at all the prescribed p-adic places while satisfying the archimedean Hodge choices. Consequently a chosen local reflex field for the target is unchanged on passing to the composite cover field.

(KPZ, §7.2.2–7.2.3, pp.77–78; Proposition 7.2.19(2), p.83).

*Proof sketch.* KPZ combines Deligne’s Hodge lifting with prescribed p-adic splitting of the CM scalar field. Import the generic torus approximation and Hodge-cover construction; impose all places over p simultaneously.

*Needs:* ShimuraData Layer 4 (gap:hodge-cover-refinement); ReductiveGroupsPartII §RG2.1.

*Remark.* Specifying one embedding into Q̄_p must not be replaced by an arbitrary place over v_2.

### 2.3 Non-exceptional very-good Hodge cover

**Construction.** Suppose G_2^ad is Q-simple, so that G_2^ad≅Res_(F/Q)H with F totally real and H absolutely simple over F. Write H^♯ for the simply connected cover H^sc of H, except when H is of type D^H at its noncompact real places, where H^♯ is the quotient of H^sc whose fibre at each such place is the image of the simply connected cover in the standard representation of the orthogonal group (KPZ §§7.2.1–7.2.2, pp.76–77). Suppose that the local adjoint pair of G_2 has neither a D^H factor nor a type-A factor Res_(F′/Qp) PGL_m(D), with D a central division algebra over a finite extension F′ of Q_p whose index is divisible by p (the non-exceptional condition, KPZ §6.1, p.62); this excludes type D^H for H, so here H^♯=H^sc. Construct a Hodge cover G with G_der≅Res_(F/Q)H^♯, the same adjoint datum, split local reflex composite, a self-dual very-good lattice embedding for the stabilizer lifting the prescribed target parahoric, R-smooth torus centre, quasi-tame Z_G^c, and torsion-free inertia coinvariants of Z_G^c/Z_(G_der).

(KPZ, Proposition 7.2.10, pp.79–80).

*Proof sketch.* KPZ modifies Deligne’s fundamental Hodge cover by central tori and builds a self-dual very-good embedding. Use the generic fundamental representation and invariant-form inputs, the very-good tensor-lattice theorems, and Zarhin’s imported self-dual enlargement. Check the centre and inertia coinvariants independently of the representation embedding.

*Needs:* §2.2; ShimuraData Layer 4 (gap:hodge-cover-refinement); ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:fundamental-invariant-form); ShimuraData Layer 4 (gap:multiplier-exact-sequences); ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-abelian-type); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.16; PadicDifferentialEquationsAndRigidCohomology §RD.5.116.

**API.**

- Return the isomorphism of adjoint Shimura data and the central isogeny of derived groups.
- Return the chosen self-dual lattice and very-good tensor-compatible embedding, with its stabilizer model.
- Identify the local reflex composite at each target p-place with the target local field.

**Checks.**

- For a split type-A local datum the non-exceptional path is available.
- A local type-A factor PGL_m(D) with p dividing the index of D lies outside the hypotheses of this construction; §2.4 treats it.
- A perfect alternating form on the enlarged lattice must identify Λ with its dual; an arbitrary integral lattice fails.

*Remark.* The cover properties listed in the construction are asserted together, under the non-exceptional restriction of the source.

### 2.4 Exceptional very-good Hodge covers

**Construction.** For a Q-simple abelian-type datum with D^H factors or a type-A local division algebra of index divisible by p, construct the Hodge cover with the properties of §2.3 except that torsion-free coinvariants of Z_G^c/Z_(G_der) are not promised in the exceptional type-A case. Use the appropriate fundamental symplectic representation and the self-dual lattice construction from KPZ §§6.2–6.3. Passing from the enlarged group to GSp requires smoothness of the scheme-theoretic intersection, R-smoothness, equal derived group and a lifting cocharacter.

(KPZ, Proposition 7.2.16 and Lemmas 7.2.13–7.2.14, pp.81–83).

*Proof sketch.* KPZ treats the D^H and wild-index type-A representations separately and identifies the extra smooth-intersection hypotheses. Import the corresponding very-good local lattice theorems and the fundamental invariant-form classification. Use smooth multiplier maps at odd p to verify the intersection hypothesis rather than assuming it for an arbitrary closed subgroup.

*Needs:* §2.2; ShimuraData Layer 4 (gap:hodge-cover-refinement); ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:fundamental-invariant-form); ShimuraData Layer 4 (gap:multiplier-exact-sequences); ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-abelian-type); ReductiveGroupsPartIII §5.3a (gap:rg3-stabilizer-closed-immersion); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.14–3.15 and 3.17; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.16; PadicDifferentialEquationsAndRigidCohomology §RD.5.116.

**API.**

- All cover data of §2.3, except torsion-free coinvariants in the wild type-A branch.
- Return the verified smooth scheme intersection needed to restrict the very-good embedding.
- In the D^H branch the inertia coinvariants of Z_G^c/Z_(G_der) are torsion-free; in the wild-index type-A branch no such conclusion is asserted.

**Checks.**

- For the D^H centre described by the split-at-p CM norm-one torus, its inertia-coinvariant quotient is free.
- At p=3 a local adjoint factor PGL_1(D), with D a central division algebra of index 3 over Q_3, is exceptional because 3 divides the index, and belongs to this construction; for D a quaternion algebra over Q_3 the index 2 is prime to 3, and §2.3 applies.
- Without smoothness of G′∩GSp(Λ), restriction of a very-good embedding is rejected.

*Remark.* In the wild type-A branch no torsion-free-coinvariant conclusion is part of the output.

### 2.5 Auxiliary cover for every abelian-type datum

**Construction.** For any abelian-type (G_2,X_2), p>2 and connected target parahoric, construct a Hodge cover (G,X) with the same adjoint datum and a central derived isogeny, satisfying: π₁(G_der) is a 2-group and is trivial without D^H factors; the local-to-global central-kernel condition (D); all target p-places split in E E_2; the centre is an R-smooth torus; Z_G^c is quasi-tame; and the lifting stabilizer has a self-dual very-good embedding. If no local adjoint factor involves a division algebra of index divisible by p, X_*(G_ab)_I is additionally torsion-free. Combine simple factors with a common similitude multiplier.

(KPZ, Proposition 7.2.19, pp.83–84).

*Proof sketch.* KPZ assembles the simple-factor covers using a fibre product of their multiplier maps. Check the adjoint and derived maps factor by factor; central products control the centre and the 2-primary fundamental group. Retain the stated restriction on the torsion-free conclusion and the splitting at every target p-place.

*Needs:* §2.3; §2.4; ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:multiplier-exact-sequences); ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-abelian-type); ReductiveGroupsPartIII §5.3a (gap:rg3-stabilizer-closed-immersion).

**API.**

- For C=ker(G_sc→G_der), any global H¹(Q,C) class trivial at every finite ℓ≠p is trivial at p.
- The cover and target local models identify through the adjoint minuscule datum using the imported central-isogeny comparison.
- Expose torsion-free X_*(G_ab)_I only under the explicitly verified absence of p-divisible division indices.

**Checks.**

- Two factors with unequal similitude multipliers do not define a symplectic direct-sum similitude.
- Take a target with reflex field E_2=Q and a cover whose reflex field is the CM field Q(i). At p=5 the condition holds: 5=(2+i)(2−i) splits and both completions are Q_5. At p=3 it fails: 3 is inert in Q(i) and the completion is Q_9. There the CM field must be changed, for example to Q(√−2), in which 3 splits because −2≡1 is a square modulo 3.
- The D^H branch permits 2-primary π₁ but cannot claim simply connected derived group.

*Remark.* The output applies to every connected parahoric at odd p, including the exceptional factors, without adding the non-exceptional hypothesis.

### 2.6 Strongly acceptable auxiliary cover

**Theorem.** For a strongly acceptable target triple, choose the KZ auxiliary Hodge cover with derived group mapping centrally to the target, π₁(G_der) a 2-group that is trivial when the target has no D^H factor, the reflex splitting and very-good lattice properties, compact centre Z_G^c a product of restrictions of tame tori, and torsion-free X_*(G_ab)_I. At the corresponding very-special building point the cover fixer is connected. The last coinvariant hypothesis is torsion-free, not torsion.

(KZ, Proposition 4.2.3 and Lemma 4.2.4, pp.34–35).

*Proof sketch.* KZ strengthens the cover for strongly acceptable triples so that the full fixer agrees with the connected parahoric. Use the split restriction-of-scalars derived factors and induced central tori to verify the Kottwitz-kernel and torsion-free-coinvariant criterion.

*Needs:* §2.1; §2.5; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartII §RG2.1.

*Remark.* A zero coinvariant group is allowed; a nonzero finite torsion group cannot satisfy the freeness argument.

### Examples

For split GU(1,1), Z_G^c≅G_m locally and G_der≅SL₂. For GSp_(2g), g≥1, Z_G^c=μ₂ is not a torus, so that group does not satisfy the stated strongly acceptable centre condition without an auxiliary cover.

### Dependencies

*Needs:* ShimuraVarieties §P.1; ShimuraData Layer 4 (gap:hodge-cover-refinement); ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:fundamental-invariant-form); ShimuraData Layer 4 (gap:multiplier-exact-sequences); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-abelian-type); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.13; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §3.16; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; ReductiveGroupsPartIII §5.3a (gap:rg3-stabilizer-closed-immersion); FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.14–3.15 and 3.17.

## Layer 3: Integral component descent

### 3.1 Integral component-action groups

**Definition.** Import the characteristic-zero groups A(G), A(G)° and their actions from ShimuraVarieties §§6.3–6.6. Set A_int(G)=G(A_f^p)/closure(Z(Z_(p))) *_(G°(Z_(p))_+/Z(Z_(p))) G_ad°(Z_(p))_+, where Z is the Zariski closure of the centre Z_G in the full model G_Z(p) and the closure is taken in G(A_f^p), and define A_int(G)° by replacing the adelic numerator with the closure of G°(Z_(p))_+ in G(A_f^p). Here the star denotes the quotient of the semidirect product by the diagonal relation, with the integral adjoint parahoric group used in the gluing theorem. Retain the auxiliary tilde groups that also carry the p-adic parahoric factor when comparing kernels and cosets.

Assume the very-good Hodge setup of Conventions together with conditions (D) and (E).

(KP, §4.5.6 and §4.6.1–4.6.4, pp.195–199).

*Proof sketch.* KP constructs integral analogues of the adelic component symmetries from parahoric arithmetic subgroups. Apply the imported generic star-product construction and topological closure/completion formalism to these specific groups.

*Needs:* ShimuraVarieties §§6.3–6.6; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartII §RG2.0.

**API.**

- The pairs (γ,φ(γ)⁻¹) act trivially; expose the resulting quotient homomorphism.
- Expose A_int°→A_int and the maps to A(G)°→A(G), with their topologies.
- A_int° is the completion of the integral rational adjoint group for the congruence topology coming from the connected derived parahoric.

**Checks.**

- For a torus the derived congruence completion is trivial; the full adelic component group need not be.
- For G=GL₂ at the hyperspecial point, H¹(Z_(p),G_m)=0 gives GL₂(Z_(p))_+/Z_(p)^×=PGL₂(Z_(p))_+, so the amalgamating subgroup maps isomorphically onto the second factor and A_int(GL₂)=GL₂(A_f^p)/Z_(p)^×. Here Z_(p)^× is already closed in (A_f^p)^×: it is {±1} times the free abelian group on the primes ℓ≠p, and it meets the open subgroup ∏_(ℓ≠p)Z_ℓ^× only in {±1}, so it is discrete.
- For the same G, strong approximation for SL₂ makes SL₂(Z_(p)) dense in SL₂(A_f^p), so the closure of GL₂(Z_(p))_+ in GL₂(A_f^p) is the set of g whose determinant is a positive rational number prime to p. Since (A_f^p)^× is the direct product of these rationals and ∏_(ℓ≠p)Z_ℓ^×, the determinant gives A_int(GL₂)/A_int(GL₂)°≅∏_(ℓ≠p)Z_ℓ^×. This agrees with the set of geometric components of the modular curve tower at level GL₂(Z_p), Q_(>0)∖A_f^×/Z_p^×≅Ẑ^×/Z_p^×.

*Remark.* The groups are topological quotients; the integral and full adelic closures are taken in different ambient groups.

### 3.2 Reflex units and unramified components

**Theorem.** The reflex norm induced by μ_h⁻¹ maps local reflex units to the connected parahoric modulo the simply connected derived image. Together with canonical reciprocity on components this shows that the geometric connected components at fixed connected p-level are defined over the maximal reflex extension unramified above p. Under condition (D), sufficiently small prime-to-p level has rational stabilizers in the connected p-level.

Assume the very-good Hodge setup of Conventions together with conditions (D) and (E).

(KP, Lemma 4.3.2, Lemma 4.3.5 and Corollary 4.3.9, pp.189–191; KPZ §7.1.10–7.1.11, p.75).

*Proof sketch.* KP computes the reflex norm on local units and uses it to control inertia on connected components. Use Néron connected torus units and reciprocity; use condition (D) for the small-level rational-stabilizer assertion.

*Needs:* §3.1; ShimuraVarieties §§6.3–6.6; §2.5; ReductiveGroupsPartII §RG2.3.

*Remark.* Unramified component definition is weaker than a model over the original reflex field without descent data.

### 3.3 Connected-parahoric normalization cover

**Theorem.** For the full-fixer Hodge model satisfying the very-good Hodge setup with condition (D), normalize it in the generic connected-parahoric cover. The resulting morphism is finite étale; at sufficiently small prime-to-p level it splits after an unramified extension. Its component closures are the integral models used for the actual conjugate levels in descent.

Assume the very-good Hodge setup of Conventions together with condition (D).

(KPZ, Proposition 7.1.11, p.75; KP Proposition 4.3.7, pp.190–191).

*Proof sketch.* KPZ proves the finite étale connected-level passage in the very-good Hodge setup. Use the small-level splitting from rational stabilizers, extend over the unramified base, and descend along prime-to-p finite étale level change.

*Needs:* §1.4; §3.2; §0.1; SchemeAndStackFoundations §§1.17–1.23.

*Remark.* Finiteness is obtained from normalization in the finite generic cover, not from étaleness alone.

### 3.4 Integral adjoint twisting action

**Construction.** For γ in the positive integral rational adjoint group, let P_γ be its central torsor. Twist the universal abelian object by P_γ (AbelianSchemesAndArithmeticModuli §§A6.28–A6.29), transport its weak polarization and conjugated prime-to-p level, and use normalization to obtain the integral γ-action. Together with prime-to-p Hecke maps this gives the A_int action; the diagonal rational relation acts trivially. Lift it to the adjoint tensor-frame torsor by quotienting out the central ambiguity of a lift of γ.

Assume the very-good Hodge setup of Conventions together with conditions (D) and (E).

(KP, Lemmas 4.5.2, 4.5.4, 4.5.7 and 4.5.9, pp.194–197).

*Proof sketch.* KP extends the adjoint symmetry by central twisting of the universal abelian moduli point and its tensor frames. Check descent after a finite torsor trivialization, including conjugation of the prime-to-p level. Apply the normalization universal property and verify the diagonal relation on frames.

*Needs:* §3.1; §0.4; AbelianSchemesAndArithmeticModuli §§A6.28–A6.29; §0.1; ShimuraVarieties §§6.3–6.6.

**API.**

- On the generic Shimura tower this agrees with the adjoint action of ShimuraVarieties §§6.3–6.6.
- The contracted-product law P_(γδ) gives the right-action composition law on models and adjoint frames.
- The frame-to-filtration map is invariant under the arithmetic action and equivariant under the adjoint group scheme.

**Checks.**

- If γ lifts to integral g∈G, the twist trivializes and the action is the usual g-action.
- Two lifts differing by the centre yield the same adjoint frame action, not necessarily the same raw G-frame.
- Take γ=diag(ℓ,1), ℓ≠p, and K_ℓ=GL₂(Z_ℓ). Then γK_ℓγ⁻¹ contains [[1,ℓ],[0,1]] and [[1,0],[ℓ⁻¹,1]], whereas K_ℓ does not contain the latter. Thus the transported level is γK^pγ⁻¹; it is not generally K^p. For γ=1 the transport is identity.

*Remark.* A rational adjoint element need not admit a rational lift in G; the central torsor is essential.

### 3.5 Galois component-stabilizer extension

**Construction.** Fix a connected component over the maximal extension unramified at p. Its stabilizer E_int in A_int×Gal(E^p/E) fits into 1→A_int°→E_int→Gal(E^p/E)→1. After restricting to a composite reflex field, a derived cover induces the compatible map of these extensions. The star amalgamation with A_int recovers A_int×Gal(E^p/E), encoding the semilinear descent action on the induced model.

Assume the very-good Hodge setup of Conventions together with conditions (D) and (E).

(KP, §4.6.5, Lemmas 4.6.6 and 4.6.9, pp.199–201).

*Proof sketch.* KP organizes reciprocity on connected components as an extension compatible with central derived covers. Import the generic component torsor, apply the reflex-unit calculation and verify the induced extension maps through the common connected datum.

*Needs:* §3.2; §3.1; ShimuraVarieties §§6.3–6.6.

**API.**

- The kernel of projection to Galois is exactly A_int°.
- A compatible derived cover induces a map after pullback to the common reflex field, preserving kernel and Galois quotient.
- The star product of A_int and E_int over A_int° identifies with the product action group.

**Checks.**

- The identity derived cover gives the identity extension map.
- For G=GL₂ at hyperspecial level (the very-good Hodge setup holds, with (D) because C=ker(SL₂→SL₂) is trivial and (E) because Z_G=G_m) and prime-to-p principal level of level N≥3 with p∤N, the geometric components of Sh_K are Q_(>0)∖A_f^×/det K≅(Z/N)^×, permuted by Gal(Q̄/Q) through the cyclotomic character modulo N. So they are defined over Q(ζ_N), which is unramified above p, as the construction requires. At the p-level ker(GL₂(Z_p)→GL₂(F_p)), which is not parahoric, the same computation gives (Z/Np)^× and the field Q(ζ_(Np)), ramified at p.
- A datum with several components retains the nontrivial A_int/A_int° action; the extension is not replaced by A_int° alone.

*Remark.* The construction keeps the semilinear Galois action; an abstract disjoint union without it is insufficient.

### 3.6 Gluing at conjugate parahoric levels

**Construction.** For a Hodge cover with a central isogeny G_der→G_2,der identifying adjoint data (KPZ §7.3.1(3)), choose coset representatives J in G_2(Q_p) for the image of A_int(G_2) in A(G)°∖A(G_2)/K_2,p°. For each j use the connected component containing (j,X⁺); it is identified with the connected Shimura variety at jK_p°j⁻¹, not uniformly with the component at K_p°. Form the disjoint union over j of [S_(K_p°)^(j,+)×A_int(G_2)]/A_int(G)°. Its generic fibre is Sh_(K_2,p°)(G_2,X_2) and its semilinear action gives descent over the composite reflex field.

Assume the very-good Hodge setup of Conventions together with conditions (D) and (E).

(KPZ, §7.3.1(3), pp.86–87; for KP Lemma 4.6.13 and Corollary 4.6.15, pp.202–203, see Source conventions and corrections).

*Proof sketch.* KPZ §7.3.1(3) glues the connected pieces at the conjugate parahoric levels jK_p°j⁻¹. Use the Cartesian component-group square and its stabilizers to compute each j-piece before taking the quotient. Identify the generic induced variety and descend the semilinear action; apply the freeness argument separately to the integral action.

*Needs:* §3.3; §3.4; §3.5; SchemeAndStackFoundations §§1.17–1.23; ShimuraVarieties §§6.3–6.6.

**API.**

- The generic-fibre identification is equivariant for G_2(A_f^p) and the Galois action.
- Changing J or its representatives induces the canonical equivariant isomorphism through the computed stabilizers.
- Expose the j-indexed component chart together with its conjugated p-level and quotient action.

**Checks.**

- For the identity cover and the trivial coset, recover the original connected model and its component induction.
- If jK_p°j⁻¹ differs from K_p°, the j-piece cannot be identified with a fixed-level piece without a supplied Hecke comparison.
- For the Iwahori I of GL₂(Q_p), the representative w=[[0,1],[p,0]] normalizes I, since conjugation by w sends [[a,b],[c,d]] to [[d,c/p],[pb,a]], so its piece has the same p-level I. The representative diag(p,1) does not normalize I (Examples of this layer), so its piece has a different p-level.

*Remark.* A representative j outside the parahoric normalizer must change the connected piece’s level.

### 3.7 Freeness of the integral descent kernel

**Theorem.** For the cover and small-level conditions used in conjugate-level gluing, Δ=ker(A_int(G)°→A_int(G_2)) acts freely on the relevant integral connected tower pieces. The kernel need not be finite at the full tower; representability of the finite-level quotients and their descent come from the congruence and level conditions, not from finiteness of Δ.

Assume the very-good Hodge setup of Conventions together with conditions (D) and (E).

(KP, Proof of Corollary 4.6.15 and Corollary 4.6.18, pp.203–205; KPZ §7.3.1(3), pp.86–87).

*Proof sketch.* KP’s twisting argument identifies an element fixing a point with a central integral lift and then with the trivial action. Use rigidity at sufficiently small prime-to-p level, the transported level identity and the connected rational stabilizer criterion. Apply the imported quotient/descent theorem at finite levels; work with the conjugate levels jK_p°j⁻¹ throughout.

*Needs:* §3.6; §3.4; §3.2; AbelianSchemesAndArithmeticModuli §A6.29; SchemeAndStackFoundations §§1.17–1.23.

*Remark.* The proof must work with the integral moduli object and level, not only with its rational isogeny class.

### 3.8 Integral models of abelian type

**Theorem.** For every abelian-type datum, p>2 and connected parahoric K_2,p°, the very-good auxiliary cover of §2.5 and the component gluing of §3.6 produce a normal integral pro-prime-to-p tower over the local reflex ring with a continuous G_2(A_f^p)-action extending that of the generic tower. Between sufficiently small prime-to-p levels the transitions are finite étale. The tower has the pro-level DVR bijection, and at sufficiently small level its étale-local singularities are modeled on M_loc(G_2,{μ_h,2}). The cover’s reflex splitting permits descent to the target local reflex field. At a prime-to-p level K_2^p that is not sufficiently small, the model S_(K_2,p°K_2^p) is the quotient stack [S_(K_2,p°K_1^p)/(K_2^p/K_1^p)] for a sufficiently small K_1^p normal in K_2^p, the finite group acting through the G_2(A_f^p)-action. It is formed as in §0.2 and is independent of K_1^p up to canonical equivalence.

(KPZ, Theorem 7.2.21, pp.84–85; Proposition 7.1.14, pp.75–76; KZ §4.1.5, p.30, and §4.3.5, p.40, for levels that are not sufficiently small).

*Proof sketch.* KPZ obtains the model from the very-good Hodge cover of §2.5 by integral component descent. Transfer the local-model and extension properties through the free quotient, identify the intrinsic local model, and use the split local reflex composite. At a level that is not sufficiently small, divide a sufficiently small normal level by the finite quotient group and compare two choices through their intersection, as in §0.2.

*Needs:* §2.5; §3.7; §3.6; §1.6; §0.2; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); SchemeAndStackFoundations §§1.17–1.23.

**Checks.**

- For K_1^p=K_2^p sufficiently small, the quotient is by the trivial group and returns the scheme S_(K_2,p°K_2^p).
- Two sufficiently small normal subgroups K_1^p and K_1′^p of K_2^p meet in a third, K_1″^p. The finite étale transition S_(K_2,p°K_1″^p)→S_(K_2,p°K_1^p) is a K_1^p/K_1″^p-torsor, so both quotient stacks are equivalent to the quotient by K_2^p/K_1″^p, inertia included. A coarse quotient would agree with them only on points.
- For GU(1,1) of Q(i) at p=5 and hyperspecial level (strongly acceptable, §2.1), the centre is Res_(Q(i)/Q)G_m. The scalar i has multiplier i·ī=1 and lies in G(Z_ℓ) for every ℓ, including the hyperspecial level at 5. As a central rational element it acts trivially on every level of the tower. At a sufficiently small level K_1^p, Z_G(Q)∩K_5K_1^p=1, so i, −1 and −i are not in K_1^p. So, at a level K_2^p that contains i, the stack has a cyclic group of order 4 in its inertia at every point, and it is not the scheme quotient.

*Remark.* The theorem covers exceptional type A and D^H; torsion-free coinvariants are not among its hypotheses.

### 3.9 Connected adjoint local-model diagram

**Theorem (connected-level reduction).** In the very-good Hodge setup of Conventions, let S_K be the normalized Hodge model at level K_p=G^fix(Z_p), S_(K°) its normalization in Sh_(K°)(G,X) with K°_p=G°(Z_p) (the relative normalization of the Hodge-type theorem of §1.7, finite étale over S_K; condition (D) of §3.3 is not assumed), and π:S̃→S_K, q:S̃→M_loc(G,{μ_h}) the local-model diagram of §1.4. The pullback of π to S_(K°) has a reduction of structure group to a G°-torsor π°:S̃°→S_(K°), compatible with the prime-to-p Hecke maps, on which q restricts to a G°-equivariant smooth morphism to M_loc(G,{μ_h}) of relative dimension dim G.

(DvHKZ, Proposition 4.3.3, p.38, and Theorem 4.3.6, p.40, with Theorem A.3.3, p.50; KPZ, proof of Corollary 7.2.24, p.85.)

*Proof sketch.* By the Hodge-type theorem of §1.7, S_K and S_(K°) are canonical integral models at levels G^fix and G°. The shtuka of S_(K°) is a G°-shtuka whose push-out to G^fix is the pullback of the shtuka of S_K. The diagram of §1.4 is the scheme-theoretic form of the v-sheaf local-model map defined by the shtuka of S_K (DvHKZ Theorem A.3.3), and that map is 2-compatible with the map of the G°-shtuka (gap:general-connected-reduction). By the exact sequence 1→G°→G^fix→i_*π₀(G^fix)→1 (gap:general-connected-reduction), a reduction of the pulled-back G^fix-torsor P to G° is a section of the i_*π₀(G^fix)-torsor P×^(G^fix)i_*π₀(G^fix). The G°-shtuka gives such a section on v-sheaves. That torsor is supported on the special fibre, so the full faithfulness of the v-sheaf functor on perfect schemes (DiamondsAndVStacksPartII §D7.6) and the topological invariance of the étale site (EtaleCohomologyFoundations §F.0.4) make the section come from a section over S_(K°). The resulting G°-torsor is open in P, so q restricted to it is smooth.

*Needs:* §1.4; §1.7; HeckeStacksAndLocalShtukas §HS2 (gap:general-connected-reduction); DiamondsAndVStacksPartII §D7.6; EtaleCohomologyFoundations §F.0.4.

**Construction.** For every abelian-type datum (G₂,X₂), p>2 and connected parahoric level G₂° at a point x₂ of the building of G₂,Qp with image x_ad in that of G₂_ad, let (G,X) be the auxiliary Hodge cover of §2.5, G^fix the full fixer of a point of the building of G_Qp lifting x_ad, and Z the Zariski closure of Z_G in G^fix. Construct π:S̃_ad→S, a torsor under the quotient G^fix/Z, and an equivariant smooth map q:S̃_ad→M_loc(G₂,{μ_h,2}) of relative dimension dim G₂_ad. As Z_G is an R-smooth torus (condition (E), which the cover of §2.5 satisfies), G^fix/Z is smooth and its neutral component is the connected parahoric of G₂_ad at x_ad; G^fix/Z is not asserted to be the full Bruhat–Tits fixer of x_ad. The torsor reduces to that connected adjoint parahoric under the non-exceptional condition of KPZ Theorem 7.2.21 (§2.3), and in general by the connected-level reduction theorem above, applied to the auxiliary Hodge cover and descended as in KPZ Proposition 7.1.14 (KPZ Corollary 7.2.24).

(KPZ, §7.1.12 and Proposition 7.1.14(3), pp.75–76; Theorem 7.2.21(3), pp.84–85; Corollary 7.2.24, p.85).

*Proof sketch.* Descend the adjoint frame diagram using the auxiliary Hodge cover. For strongly acceptable data use connectedness of that auxiliary fixer; for the unrestricted connected reduction apply the connected-level reduction theorem above to the auxiliary Hodge cover and descend its G°-torsor as in KPZ Proposition 7.1.14.

*Needs:* the connected-level reduction theorem above; §3.8; §3.4; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); §2.5; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-central-quotient).

**API.**

- Return the torsor under G^fix/Z and its reduction to the connected adjoint parahoric under the stated non-exceptional or strongly acceptable route, or in general through the connected-level reduction theorem above, with the corresponding inputs.
- Expose the smooth equivariant map to M_loc(G_2,{μ_h,2}) and its relative dimension.
- Pullback along prime-to-p finite étale level maps preserves the torsor and local-model morphism.

**Checks.**

- For a non-exceptional cover the elementary connected reduction is available without the connected-level reduction theorem.
- An exceptional type-A cover uses the general reduction and cannot cite a missing torsion-free quotient.
- Over F_q a torsor under the connected smooth adjoint parahoric is trivial by Lang; a torsor under G^fix/Z whose special fibre is disconnected cannot use that inference.
- G^fix/Z is not the full fixer of x_ad. Take a cover whose group at p is GL₂, with Z_G=G_m, and a point over the midpoint of an edge of the tree. Its full fixer is the Iwahori group scheme I: the element w=[[0,1],[p,0]] fixes the midpoint, but det w=−p has valuation 1 and moves the central coordinate. So G^fix/Z=I/G_m is the connected Iwahori of PGL₂, of dimension 3. The full fixer of x_ad in PGL₂ also contains the image of w, whose square is the scalar p; it has two components, and a torsor under it would have the wrong structure group.

*Remark.* At a finite-field point the connected structure group is what permits Lang triviality.

### 3.10 Connected adjoint diagram for strongly acceptable triples

**Construction.** For a strongly acceptable triple (G₂,X₂,G₂°), p>2, take the integral model over its completed local reflex ring O_E₂. Construct π:S̃_ad→S as a torsor for the smooth connected adjoint parahoric and an equivariant smooth q:S̃_ad→M_loc(G₂,{μ_h,2}) of relative dimension dim G₂_ad. Prime-to-p Hecke actions commute with q when the local model has trivial Hecke action. The auxiliary Hodge cover has G^fix=G° by KZ Lemma 4.2.4, so KPZ Proposition 7.1.14 already gives the connected reduction; the connected-level reduction theorem of §3.9 is not an input.

(KZ, Theorem 4.2.6(3), Remark 4.2.7(2), pp.35–36; KPZ Proposition 7.1.14(3), pp.75–76).

*Proof sketch.* Use the strongly acceptable auxiliary cover with connected fixer and its Hodge tensor-frame diagram. Apply adjoint descent and reflex splitting to obtain the diagram over O_E₂.

*Needs:* §2.6; §3.8; §1.4; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-central-quotient).

**API.**

- The source of π is the connected adjoint frame space and its target is the integral model; π is a torsor under the specified smooth parahoric, not a disconnected full fixer.
- The map q has the intrinsic local model as target, is equivariant under that connected group and has relative dimension dim G₂_ad.
- Tame level pullback and reflex base change preserve π, q and their equivariance.

**Checks.**

- For the split-at-p GU(1,1) Shimura curve, dim G_ad=3, dim S=dim P¹=1, and dim S̃_ad=4; hence q has relative dimension 3. The full group has dimension 5 and its frame space has dimension 6, so those torsors cannot be interchanged.
- For a CM torus with split p and strongly acceptable centre, G_ad=1 and the local model is a point; π is the identity and q has relative dimension 0.
- Over F_q, a fibre under the connected smooth adjoint parahoric has H¹=1 and a rational frame. A constant Z/2-torsor instead has H¹(F_q,Z/2)=Z/2 and can lack a rational point, so the disconnected replacement cannot feed same-field lifting.

### Examples

For an Iwahori I in GL₂(Q_p), j=diag(p,1) sends [[a,b],[c,d]] to [[a,pb],[c/p,d]]. With c=p this produces c/p=1, so jIj⁻¹ differs from I. Identity conjugation preserves the level.

### Dependencies

*Needs:* ShimuraVarieties §§6.3–6.6; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartII §RG2.0; §2.5; §1.4; §0.1; SchemeAndStackFoundations §§1.17–1.23; §0.4; AbelianSchemesAndArithmeticModuli §§A6.28–A6.29; §1.6; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); HeckeStacksAndLocalShtukas §HS2 (gap:general-connected-reduction); §2.6; §0.2; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-central-quotient); §1.7; DiamondsAndVStacksPartII §D7.6; EtaleCohomologyFoundations §F.0.4.

## Layer 4: Newton strata and tensor isogeny groups

### 4.1 Newton class of an integral point

**Construction.** For x on the geometric special fibre of the Hodge model, a tensor frame V∨⊗L≅D_x writes its semilinear Frobenius as ρ∨(b_x)σ, where ρ is the standard tower representation. Define the intrinsic map x↦[b_x]∈B(G_Qp), independent of frame and compatible with prime-to-p level and residue-field extension. The Hodge bound is {μ_h⁻¹} in the contravariant Dieudonné convention. The pointwise isocrystal specializes to Mathlib’s WittVector.Isocrystal after forgetting its G-tensors; that class alone supplies neither a family nor the B(G) classification.

(HT, §1.3.8, p.18; KZ §4.4.2, p.43).

*Proof sketch.* HT trivializes the tensor frame torsor over L and records the resulting Frobenius up to sigma conjugacy. Changing a frame by g replaces b by g inverse b σ(g); apply the imported B(G) quotient.

*Needs:* §0.6; BunGAndNewtonStrata §0.6; Mathlib `WittVector.Isocrystal`.

**API.**

- Two tensor frames give sigma-conjugate elements and hence the same B(G) class.
- Applying the dual of the standard tower representation gives the contravariant isocrystal H¹_cris, compatible with WittVector.Isocrystal.
- Prime-to-p Hecke pullback and extension of the perfect residue field preserve the class under the canonical base-change maps.

**Checks.**

- An ordinary elliptic fibre has Newton slopes {0,1} on the contravariant module D, whose Frobenius is ρ∨(b_x)σ, and hence slopes {0,−1} for b_x in the standard representation.
- A supersingular elliptic fibre has slopes {1/2,1/2}, distinct from the ordinary class.
- For a torus, the class has the Kottwitz invariant of μ_h⁻¹, not that of μ_h.

*Remark.* The local-model cocharacter is μ_h while the Newton admissibility cocharacter is μ_h⁻¹.

### 4.2 Admissibility of reduction

**Theorem.** Every pointwise class from the Hodge model belongs to B(G_Qp,{μ_h⁻¹}): its integral Kottwitz invariant equals the image of μ_h⁻¹ and its dominant Newton point lies below the Galois average of that class. Both assertions are required. The conclusion follows from the Hodge filtration and crystalline representation of a lift, and is not obtained merely from a rational slope inequality.

(HT, Lemma 1.3.9, p.18).

*Proof sketch.* HT applies the admissibility theorem for the crystalline Hodge realization, including the Kottwitz condition. Use a characteristic-zero lift, the specified comparison tensors and the imported integral admissibility criterion.

*Needs:* §4.1; BunGAndNewtonStrata §1.23; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4; §1.1; PadicHodgeTheory §5.5.

*Remark.* A class with correct Newton slopes but wrong integral Kottwitz invariant must fail admissibility.

### 4.3 Newton strata on the special fibre

**Definition.** For each admissible [b], let S_[b] be the locus of geometric special-fibre points whose canonical class is [b], endowed with its locally closed reduced structure once semicontinuity is proved. Define S_≤[b] using the dominant Newton order, within the fixed Kottwitz fibre. These loci are compatible with prime-to-p level and descent from perfectification. Nonemptiness is a theorem with a rational-Newton witness, not a field of this definition.

(HT, Theorem 1.3.14, pp.19–20).

*Proof sketch.* HT applies Newton semicontinuity to the universal G-isocrystal to construct the strata. Use representation-detection of dominance and the family semicontinuity theorem of PadicDifferentialEquationsAndRigidCohomology §RD.3.43, then equip the strata with reduced locally closed structures.

*Needs:* §4.1; §4.2; §0.6; BunGAndNewtonStrata §§1.22–1.26, 2.16; PadicDifferentialEquationsAndRigidCohomology §RD.3.43.

**API.**

- A geometric point belongs to S_[b] exactly when its canonical B(G) class equals [b].
- The strata pull back under finite étale prime-to-p level transitions.
- The admissible strata form a disjoint partition of the geometric special fibre; the lower locus is the union over smaller classes in the fixed Kottwitz fibre.

**Checks.**

- In the modular case, ordinary and supersingular loci are disjoint and exhaust the special fibre.
- For the modular curve with tower μ_h=(1,0), B(GL₂,{μ_h⁻¹}) has ordinary representative diag(p⁻¹,1)σ and a basic class of tower slopes (−1/2,−1/2), both with κ=−1. In the dual contravariant realization their slopes are (0,1) and (1/2,1/2), and both strata occur. Basicness alone does not define the ordinary stratum.
- In B(PGL₂) the basic classes of slopes (0,0) and (1/2,1/2) before quotient by scalars both have rational Newton point 0, but Kottwitz classes 0 and 1 in Z/2. Only the class with the fixed μ-image belongs to the prescribed B(G,{μ}); equality of rational Newton points alone loses this distinction.
- For the hyperspecial Siegel datum, the genus-one PEL ordinary and supersingular strata have slopes (0,1) and (1/2,1/2), and p-ranks 1 and 0; they agree with the tensor-defined strata here (IgusaVarietiesAndTorsionConcentration §§0.1–0.2 and §0.12).

*Remark.* Closure containment is recorded separately from equality of closures.

### 4.4 Newton specialization and closure containment

**Theorem.** For the universal G-isocrystal on the Hodge special fibre, S_≤[b] is Zariski closed and each Newton stratum is locally closed. The closure of S_[b] is contained in the union of strata with dominant Newton point at most ν_b in the source’s decreasing-slope convention and the same Kottwitz invariant. No converse inclusion or general equality of closures is asserted.

(HT, Theorem 1.3.14(1),(3), pp.19–20).

*Proof sketch.* HT reduces the specialization claim to Newton polygon semicontinuity in faithful representations. Use the Grothendieck–Katz family theorem and the representation-detection criterion; combine the finitely many admissible classes to obtain local closedness.

*Needs:* §4.3; §0.6; BunGAndNewtonStrata §§1.22–1.26, 2.16; PadicDifferentialEquationsAndRigidCohomology §RD.3.43.

*Remark.* No equality of closures is asserted.

### 4.5 Special-point nonemptiness of Newton strata

**Theorem.** If [b]∈B(G_Qp,{μ_h⁻¹}) has a representative whose Newton cocharacter is defined over Q_p as in HT (1.1.3.1), then S_[b] is nonempty. This holds in particular for quasi-split G_Qp and for basic classes. Use a global special torus realizing the local special pair, its zero-dimensional canonical model, and the place of its reflex field induced by the fixed embedding i_p above v. Reduce that torus point to the normal Hodge model. An arbitrary place above v need not give the prescribed local class.

(HT, Proposition 1.3.10, p.18, with §1.1.3 and §1.2.5).

*Proof sketch.* HT realizes the class through a global special pair and reduces its toric canonical model (HT Proposition 1.2.5 and its proof, pp.14–15). First obtain a maximal torus T_p⊂G_Qp and μ_p∈X_*(T_p) in {μ_h⁻¹} whose class in B(T_p) maps to [b]: this is the transferred-torus specialness theorem (BunGAndNewtonStrata §1.39) under the rational Newton witness (§1.34), with T_p chosen elliptic when G_Qp is not quasi-split so that the transfer exists. Approximate T_p by a global maximal torus T with elliptic real fibre through which some h_y, y∈X, factors up to G(R)-conjugacy (ReductiveGroupsPartIII §2.3). The transported cocharacter μ_T is only Weyl-conjugate over C to μ_(h_y)⁻¹; the real cocharacter twist (ReductiveGroupsPartIII §2.5, applied to μ_T⁻¹) replaces T by the Q-defined torus T′=gTg⁻¹ for some g∈G_sc(Q̄), a geometric conjugate that need not be G(Q)-conjugate to T, and h_y by a G(R)-conjugate h_x, x∈X, factoring through T′_R with μ_(h_x)⁻¹=Int(g_p)(μ_T) for an element g_p∈G_sc(Q_p) carrying T_Qp onto T′_Qp, so the class of B(T′) it defines still maps to [b]. Reduce the zero-dimensional canonical model of (T′,h_x) (ShimuraVarieties §4.5) using potential good reduction of CM abelian varieties (ShimuraVarieties §5.6) and the finite-level extension criterion of §1.6; the unique acceptable torus class identifies the reduction’s Newton class.

*Needs:* §1.6; §4.2; BunGAndNewtonStrata §1.34; BunGAndNewtonStrata §1.37; BunGAndNewtonStrata §1.39; ReductiveGroupsPartIII §2.3; ReductiveGroupsPartIII §2.5; ShimuraVarieties §4.5; PELModuli §§M4.5–M4.6, M6.1–M6.4; ShimuraVarieties §5.6.

*Remark.* For a non-quasi-split nonbasic class, the rational-witness hypothesis cannot be omitted. The adjusted torus is a Q-defined geometric conjugate and need not be G(Q)-conjugate to T: in SL₂ over Q let T be the norm-one torus of Q(i) and T′=dTd⁻¹ with d=diag(3,1); T′ is defined over Q and equals gTg⁻¹ for g=d/√3∈SL₂(Q̄), but a conjugator in SL₂(Q) would give an element of the normalizer of T in GL₂(Q) of determinant 1/3, whereas those determinants are ±(a²+b²), of even 3-adic valuation.

### 4.6 Mu-ordinary locus

**Definition.** Assume there is an ordinary class [b]_μ∈B(G,{μ_h⁻¹}), meaning that its dominant Newton point is exactly the Galois average of μ_h⁻¹. Define the ordinary locus as S_[b]_μ. It is not defined by replacing that equality with the unique maximal acceptable class for an arbitrary inner form. For a strongly acceptable triple the split restriction-of-scalars derived factors provide the required ordinary class.

(KZ, Definition 4.4.3 and its preceding assumption, p.43; HT §1.3.15, p.20).

*Proof sketch.* KZ explicitly assumes the existence of the actual ordinary class before defining its locus. Use the imported ordinary-class criterion and the pointwise Newton stratification.

*Needs:* §4.3; BunGAndNewtonStrata §1.26; §2.1.

**API.**

- x is ordinary exactly when ν_(b_x) equals the Galois average (μ_h⁻¹)◇ in the fixed Kottwitz fibre.
- The ordinary open pulls back along prime-to-p levels and along the proved derived-isogeny maps.
- For the Siegel genus-one datum it agrees with the ordinary elliptic locus, equivalently p-rank one.

**Checks.**

- The slopes 0 and 1 give an ordinary point.
- The supersingular elliptic slope pair is excluded.
- A non-quasi-split inner form whose maximum has ν≠(μ_h⁻¹)◇ has no ordinary locus: maximality alone does not produce the ordinary class.

*Remark.* The ordinary equality and the unique-maximal-class assertion must remain distinct.

### 4.7 Openness and density of the ordinary locus

**Theorem.** Assume an actual ordinary class exists, its rational-Newton witness holds, and the geometric special fibre of the normal Hodge model is locally integral. Then the ordinary locus is nonempty open and dense on every component: semicontinuity gives openness, special reduction gives nonemptiness, and the component theorem plus Hecke transport spreads density. This does not assert density at arbitrary parahoric crossings.

(KZ, Theorem 4.4.4, p.43; HT Corollary 1.3.16, p.20).

*Proof sketch.* Use the component specialization of ShimuraCompactifications (gap:component-specialization) to prove irreducibility of the special fibre of each connected integral component. Apply semicontinuity, special reduction and tensor-compatible Hecke transport to prove density on every component.

*Needs:* §4.6; §4.4; §4.5; §1.9; ShimuraCompactifications Layer 7 (gap:component-specialization).

*Remark.* Local integrality by itself is not silently used as a proof of global component irreducibility.

### 4.8 Tensor-preserving quasi-isogeny group

**Definition.** For x with abelian fibre A_x over F̄_p, define I_x as the closed Q-subgroup of (End⁰(A_x))^× preserving the canonical crystalline tensors and all prime-to-p étale tensors; use the rational realization actions after scalar extension, so the functor is imposed on every Q-algebra. Define I_(x/Fq) similarly using End⁰_(Fq)(A_x). The polarization is included with its similitude/Tate line. Write I_x(Z_(p))=I_x(Q)∩Aut(A_x), where A_x is taken up to prime-to-p isogeny, so that Aut(A_x)=(End(A_x)⊗Z_(p))^×. This extends the pinned TauCeti abelian endomorphism ring by rationalization and tensor conditions.

(HT, §2.1.3–2.1.5, pp.21–22; KZ §4.1.10, p.32).

*Proof sketch.* HT defines the rational algebraic isogeny group through all realizations of the Hodge tensors. Use finite-dimensional End⁰ and the scheme-theoretic tensor stabilizer equations after coefficient extension; Noetherianity reduces the intersection of conditions to finitely many equations. Distinguish geometric endomorphisms, fixed-field endomorphisms and integral automorphisms.

*Needs:* §0.4; §0.5; AbelianSchemesAndArithmeticModuli §A6.21; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.End`; AbelianSchemesAndArithmeticModuli §§A6.7, A6.20, A6.22.

**API.**

- The Q-group maps to each étale tensor stabilizer and to the crystalline twisted centralizer.
- The F_q-defined subgroup consists of tensor automorphisms commuting with the q-Frobenius endomorphism.
- Equivalent generating tensor families with the same realization stabilizers define the same subgroup of End⁰ units.

**Checks.**

- With only the Siegel polarization tensors, recover the Rosati-similitude subgroup of End⁰ units.
- Adding projection tensors on A_1×A_2 excludes off-diagonal quasi-endomorphisms.
- The scalar p⁻¹ lies in I_x(Q), since scalars fix the tensors, and not in I_x(Z_(p)): if p⁻¹=f/n with f∈End(A_x) and p∤n, then [n]=[p]∘f, and the degrees n^(2d) and p^(2d)·deg f disagree for d=dim A_x≥1. A scalar ℓ⁻¹ with ℓ≠p prime lies in I_x(Z_(p)), as ℓ is a unit of Z_(p); at p=5 this is the scalar 1/2. Reading Aut(A_x) as the automorphism group of the abelian variety itself would exclude ℓ⁻¹ and change the quotient I_x(Z_(p))\G(A_f^p) of §4.11.

*Remark.* All-prime tensor preservation is stronger than merely preserving the polarization.

### 4.9 Isogeny-group realization maps

**Construction.** For x/F_q with algebraic q-power Frobenius π_x, set γ_x=π_x⁻¹∈I_(x/Fq)(Q). On H₁ this is geometric q-Frobenius; on H¹ use the contragredient action, namely inverse pullback by γ_x. At ℓ≠p its realization is semisimple Frobenius. At p, D_x and its canonical tensors descend to Q_(q^m)=W(F_(q^m))[1/p] for every m≥1, and the dual tensor frames V∨⊗Q_(q^m)≅D_x form a G-torsor over Q_(q^m). This torsor is trivial over the maximal unramified extension of Q_q. Choose a framing degree m₀≥1, meaning that the torsor has a point over K₀=Q_(q^m₀); it then has one over Q_(q^m) for every positive multiple m of m₀. Over Q_q itself it need not have a point. Choose δ∈G(K₀) with F_D=ρ∨(δ)σ in a dual tensor frame over K₀ and form N_(rm₀)(δ)=δσ(δ)⋯σ^(rm₀−1)(δ), r=[F_q:F_p]. Its contragredient ρ∨(N_(rm₀)(δ)) is π_x^(m₀) by crystalline pullback; the standard representation of N_(rm₀)(δ) realizes γ_x^(m₀). Thus the norm and the crystalline matrix are related by the specified dual representation. When a frame exists over Q_q (m₀=1), the length-r norm N_r(δ) realizes γ_x and its contragredient is π_x. After an extension F_(q^m) with m a positive, sufficiently divisible multiple of m₀, all geometric endomorphisms descend and the stable groups are Z_G(γ_ℓ^m) at ℓ and, at p, the finite-period twisted centralizer I_p of δ over Q_(q^m) inside J_δ. This finite-period subgroup need not equal J_δ.

(HT, §2.1.5–2.1.7, equations (2.1.7.1)–(2.1.7.2), pp.22–24; K17 §2.1.2, p.29, which fixes a frame over W(F_q) itself at hyperspecial level).

*Proof sketch.* HT descends the canonical crystalline tensors to every Q_(q^m), chooses a tensor frame over Q_(q^m) for m sufficiently divisible and identifies the linear Frobenius of length rm with the twisted norm of that length. Use Frobenius invariance and uniqueness of the tensors for descent. The frame scheme over Q_q is a G-torsor because it has a point over L (§4.1). Steinberg's theorem for the maximal unramified extension of Q_q, a henselian discretely valued field with algebraically closed residue field, makes its Galois class trivial there; as the torsor is of finite type, it has a point over some Q_(q^m₀). Apply the imported finite-period norm-centralizer theorem over K₀, which has degree rm₀ over Q_p. Pass to a sufficiently divisible multiple m of m₀ to stabilize the endomorphism field and centralizers.

*Needs:* §4.8; §4.1; PadicHodgeTheory §5.5; ReductiveGroupsPartII §RG2.1; BunGAndNewtonStrata §1.16; AbelianSchemesAndArithmeticModuli §A6.21; ReductiveGroupsPartIII §3.5 (gap:rg3-cyclic-torus-and-neatness).

**API.**

- The rational γ_x acts on the Tate module as geometric q-Frobenius, and its contragredient on H¹ and D is the crystalline linear Frobenius. In a dual tensor frame over Q_(q^m₀) the norm of length rm₀ realizes γ_x^(m₀) in the standard representation and π_x^(m₀) in the dual one; these are compared through the stated dual representation.
- The tensor-frame torsor over Q_q has a class in H¹(Q_q,G); a frame over Q_q, and with it the length-r norm realizing γ_x, exists exactly when this class is trivial.
- Extension F_q→F_(q^m), for m a positive multiple of m₀, replaces the linear Frobenius by γ_x^m and the twisted norm by the product of length rm of the same δ.
- Expose I_p→J_δ, the finite-period centralizer comparison and the maps I_x,Qp→I_p.

**Checks.**

- For the rank-one contravariant realization with crystalline matrix δ_D=ζ of order 24 over F₂₅ (a G_m-frame over Q₂₅ exists by Hilbert 90, so m₀=1), crystalline q-Frobenius is ζσ(ζ)=ζ⁶ while the standard tower scalar is ζ⁻⁶. The expression δ_D²=ζ² gives neither; both the norm and the duality translation are required.
- For the norm-one torus T=ker(N:Res_(Q₂₅/Q₅)G_m→G_m), the T-torsor N(z)=5 has no Q₅-point, since norms from the unramified quadratic extension have even valuation while v₅(5)=1; over Q₂₅ it becomes uv=5, with the point (5,1). A torsor that is trivial over the unramified closure need not be trivial over the base field, so the framing degree cannot be taken to be 1 in general. For GL_n with n≥1 and GSp_(2g) with g≥1, π₁ is Z with trivial Galois action, so H¹(Q_q,G)=1 and m₀=1. For GL₀=1 the cocharacter and coroot lattices are both 0, so π₁=0 rather than Z; H¹(Q_q,G) is still trivial and m₀=1.
- Passing from F_q to F_(q²) squares γ_x; it does not leave the Frobenius element unchanged.
- For E: y²=x³+x over F₅ and ℓ≠5, γ_ℓ has eigenvalues (1∓2i)/5; since 1+2i and 1−2i are non-associate primes of Z[i], these generate a free abelian group of rank 2, so the cyclic closure is the two-dimensional torus of Q(i)^× in GL₂, e=1, and Z_(GL₂)(γ_ℓ^m) is that torus, of dimension 2, for every m≥1. The exponent m=0, divisible by e, gives γ_ℓ^0=1 and centralizer GL₂ of dimension 4: the stable centralizer needs a positive exponent.
- For the supersingular E: y²=x³−x over F₃ (four points, trace 0, π_x²=−3), the cyclic closure of γ_ℓ has two components (e=2) and identity component the scalars. Z(γ_ℓ) is the torus of Q(√−3)^×, of dimension 2, while Z(γ_ℓ²)=GL₂ has dimension 4: m=1 is positive but not divisible by e, and its centralizer is not yet the stable one.
- For the contravariant GL₂ isocrystal over F₅ with matrix δ_D=[[0,−1],[5,0]] (a GL₂-frame over Q₅ exists, so m₀=1), δ_D²=−5. The standard tower matrix is δ_D⁻ᵀ and its square is −1/5. Before extending the residue field, its finite-period automorphisms form Q₅(√−5)^×, whereas J_δ is the quaternion division group. Over F₂₅ the Frobenius square is scalar and the finite-period group enlarges.

*Remark.* Use the iterated twisted product of length rm₀ over a field where a frame exists, and use the same chosen power in each realization.

### 4.10 Rosati compactness of tensor isogenies

**Theorem.** The tensor isogeny group lies in the Rosati-similitude group. Its real points modulo the scalar weight group are compact; its identity component is reductive. After the all-prime comparison establishes connectedness, I_x is a connected reductive Q-group. The compactness assertion concerns a group modulo the weight scalars, not compactness of I_x(R) itself.

(HT, §2.1.3 and Proposition 2.1.6, pp.21–23; K17 Corollary 2.1.7, p.31).

*Proof sketch.* The Rosati positivity argument in HT and Kisin makes the tensor-preserving subgroup compact modulo scalars. Use positive definiteness to exclude a nontrivial real unipotent radical; retain a possible finite component group until the realization comparison.

*Needs:* §4.8; AbelianSchemesAndArithmeticModuli §A6.14; ReductiveGroupsPartII §RG2.1.

*Remark.* Positive scalar quasi-isogenies show why compactness cannot be asserted before quotienting scalars.

### 4.11 Tensor detection on a prime-to-p Hecke orbit

**Theorem.** For the neat integral Hodge tower, let x be a geometric special-fibre point with abelian variety A_x up to prime-to-p isogeny, and let g₁,g₂∈G(A_f^p). If x·g₁=x·g₂, the unique automorphism of A_x relating the two prime-to-p level structures fixes the canonical prime-to-p étale and crystalline tensors, so g₁ and g₂ have the same image in I_x(Z_(p))\G(A_f^p), where I_x(Z_(p))=I_x(Q)∩Aut(A_x). Thus g↦x·g induces a well-defined surjection from the Hecke orbit x·G(A_f^p) onto I_x(Z_(p))\G(A_f^p). Equality of two points is asserted only in this direction: the converse, that g₁ and g₂ with the same class give the same normalization point, needs the very-good hypotheses of §1.3 and is not used here. This is the prime-to-p statement needed in the rank argument; it is not a classification of all geometric isogeny classes or an ADLV uniformization theorem.

(HT, Lemma 2.1.4, p.22; Proposition 2.1.6, p.23, with its setting §2.1.5, pp.22–23).

*Proof sketch.* HT reads the relating automorphism off the Siegel moduli interpretation of x·g₁=x·g₂; it fixes the prime-to-p étale tensors because it intertwines the two level structures, and it fixes the crystalline tensors because these are independent of the lift (§0.5, HT Proposition 1.3.7).

*Needs:* §4.8; §0.3; §0.5.

*Remark.* At hyperspecial GL₂ level with g₂=−g₁ the points agree and the relating automorphism −1 lies in I_x(Z_(p)); the statement never infers equality of normalization points from equality of classes.

### 4.12 Auxiliary-prime comparison and full rank

**Theorem.** Choose ℓ_0≠p where G splits and the characteristic polynomial of γ_x splits. After taking a sufficiently divisible finite-field power so the stable centralizer is connected, I_x,Qℓ0 identifies with that stable Frobenius centralizer, and rank I_x=rank G. The proof uses finiteness of the relevant finite-field Hecke orbit to make the quotient of local centralizer points compact, the split-group compact-quotient criterion, and Rosati reductivity. It uses no common Frobenius class from §7.6.

(HT, Proposition 2.1.6, p.23, with its setting §2.1.5, pp.22–23; K17 Corollary 2.1.7, p.31).

*Proof sketch.* HT generalizes Kisin’s finite-field orbit argument to the normal integral Hodge model. Use the split auxiliary prime to make the stable centralizer a split Levi; compactness forces the subgroup to contain a Borel. The homogeneous quotient is then proper and affine, so the connected centralizer equals the isogeny group after scalar extension.

*Needs:* §4.11; §4.9; §4.10; ReductiveGroupsPartII §RG2.0; ReductiveGroupsPartIII Layer 2 (gap:compact-quotient-borel); ArithmeticGaloisRepresentations §§5.1, 5.13.

*Remark.* The split auxiliary prime comes from ArithmeticGaloisRepresentations §5.1 and the compact-quotient criterion from ReductiveGroupsPartIII (gap:compact-quotient-borel).

### 4.13 Tate comparison with tensors

**Theorem.** After the finite-field extension fixing all geometric endomorphisms and stable centralizers, the natural realization maps identify I_x,Qℓ with Z_G(γ_x,ℓ) for every ℓ≠p and I_x,Qp with the finite-period crystalline group I_p. Hence I_x is connected reductive of full rank. The remaining comparison of centralizer dimensions uses Noot’s coarser Conj′ Frobenius comparison and the type-D outer-orbit analysis, not the full Conj(G) independence theorem being proved here.

(HT, Corollary 2.1.9, p.24, with §2.1.8, p.24, for Conj′ and neatness).

*Proof sketch.* HT compares every realization with the split auxiliary prime using its independently established coarser Frobenius conjugacy theorem. Import Noot’s accommodating-embedding comparison and neat-power step. Equal images in Conj′(G) give centralizers of equal dimension: over an algebraically closed field Ω receiving both coefficient fields (Q_ℓ, or W(F_(q^m))[1/p] with m a multiple of the framing degree m₀ chosen in §4.9 when ℓ=p, and Q_ℓ0) the two semisimple points have the same image in Conj′(G)(Ω), so by ReductiveGroupsPartIII §0.7 some φ∈Aut′(G)(Ω) carries one to the other, and φ maps the centralizer of the first isomorphically onto that of the second. Compare dimensions of the realization inclusions; descend connectedness and reductivity from the identified connected centralizer.

*Needs:* §4.12; §4.9; ArithmeticGaloisRepresentations Layer 6 (gap:noot-coarse-comparison); ReductiveGroupsPartII §RG2.1; ReductiveGroupsPartIII §0.7.

*Remark.* The proof does not use the common Frobenius class of §7.6; only the coarser Conj′ comparison enters.

### Examples

An ordinary elliptic point has slopes (0,1), p-rank 1; a supersingular point has slopes (1/2,1/2), p-rank 0. Their Newton polygons specialize in the stated direction. For a supersingular elliptic curve, I=B× for the quaternion algebra ramified at p and infinity, of rank 2, and I(R)/R×≅SO(3) is compact.

### Dependencies

*Needs:* §0.6; BunGAndNewtonStrata §0.6; Mathlib `WittVector.Isocrystal`; BunGAndNewtonStrata §1.23; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§4.3–4.4; §1.1; PadicHodgeTheory §5.5; BunGAndNewtonStrata §§1.22–1.26, 2.16; PadicDifferentialEquationsAndRigidCohomology §RD.3.43; BunGAndNewtonStrata §1.34; BunGAndNewtonStrata §1.37; BunGAndNewtonStrata §1.39; ReductiveGroupsPartIII §2.3; ReductiveGroupsPartIII §2.5; ShimuraVarieties §4.5; PELModuli §§M4.5–M4.6, M6.1–M6.4; ShimuraVarieties §5.6; BunGAndNewtonStrata §1.26; §2.1; §1.9; ShimuraCompactifications Layer 7 (gap:component-specialization); §0.4; §0.5; AbelianSchemesAndArithmeticModuli §A6.21; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.End`; AbelianSchemesAndArithmeticModuli §§A6.7, A6.20, A6.22; BunGAndNewtonStrata §1.16; ReductiveGroupsPartIII §3.5 (gap:rg3-cyclic-torus-and-neatness); AbelianSchemesAndArithmeticModuli §A6.14; ReductiveGroupsPartII §RG2.1; §0.3; ReductiveGroupsPartII §RG2.0; ReductiveGroupsPartIII Layer 2 (gap:compact-quotient-borel); ArithmeticGaloisRepresentations §§5.1, 5.13; ArithmeticGaloisRepresentations Layer 6 (gap:noot-coarse-comparison); ReductiveGroupsPartIII §0.7; §1.6.

## Layer 5: Functoriality and ordinary special lifts

### 5.1 Integral maps under derived isomorphisms

**Theorem.** Let f:(G₁,X₁)→(G₂,X₂) be a morphism of Hodge data. Suppose both full fixers equal their connected parahorics, f extends to the parahoric group schemes, both Hodge embeddings are good, and f(K₁)⊂K₂ with K_i,p=G_i°(Z_p), as in KZ §4.3.1. Over the common local reflex base the generic Shimura map extends to a map of normalized integral models, compatibly with composition and tame levels. If in addition f induces an isomorphism of derived groups, the parahorics are associated and the levels are neat, its maps on completed local rings at corresponding geometric points are isomorphisms. On the neutral pro-components after maximal unramified reflex base change this is an isomorphism by KZ Corollary 4.3.4. A central derived isogeny alone does not imply this stronger comparison.

(KZ, Proposition 4.3.2 and Corollary 4.3.4, pp.37–40; DvHKZ Proposition 4.1.10, p.31; PaRa26 Proposition 5.3.1, p.35).

*Proof sketch.* Both normalized models are canonical integral models at their connected levels (§1.7, Hodge-type theorem), so the functoriality theorem of §1.7 extends the generic map, compatibly with the shtukas. For the completions, follow the proof of uniqueness in §1.7. The push-out of the shtuka of S_K along G°→G′° is the pullback of the shtuka of S′_K′, so after changing Θ_x by an element of the σ-centralizer of b_x, the identifications of axiom (d) at x and at its image carry the completion map to the map of formal completions of integral local Shimura varieties induced by f. A morphism inducing an isomorphism of derived groups maps centre to centre and induces an isomorphism of adjoint groups, so at associated parahorics that local map is an isomorphism (gap:integral-local-shimura). Flat normal formal schemes are determined by their v-sheaves (DiamondsAndVStacksPartII §D10.11). Then compare the neutral towers using finite étale level normalizations.

*Needs:* §0.1; §0.3; §1.7; HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); DiamondsAndVStacksPartII §D10.11; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1.

*Remark.* An arbitrary pair of models with isomorphic derived groups does not give a chosen integral map without the compatible datum and level data.

### 5.2 Matched-multiplier comparison datum

**Construction.** Let the auxiliary Hodge cover (G_1,X_1) and strongly acceptable target (G_2,X_2) share the adjoint datum and carry symplectic embeddings ι_i:(G_i,X_i)→(GSp(V_i),S_i^±) for alternating forms Ψ_i, with multiplier characters c_1,c_2. Define G_3=(G_1×_(G_ad×G_m)G_2)°, matching both the adjoint image and c_1=c_2, with the induced Shimura conjugacy class. Its direct-sum representation on V_1⊕V_2 is symplectic because the multipliers agree. Write V_3=V_1⊕V_2, Ψ_3=Ψ_1⊕Ψ_2 and ι_3:(G_3,X_3)→(GSp(V_3),S_3^±) for this embedding. The projection to G_1 is derived-isomorphic in the source’s cover setup; the projection to G_2 is the corresponding central derived cover.

(KZ, §4.3.7–Lemma 4.3.8, pp.40–41; §4.4.6–4.4.7, pp.43–44).

*Proof sketch.* KZ uses the common-adjoint, common-multiplier fibre product to compare an arbitrary target Hodge embedding with the auxiliary one. Use the fibre-product centre calculation and the multiplier sequences supplied by ShimuraData; check the Hodge homomorphism factors through the identity component. The block direct-sum form has one similitude factor exactly when the two nonzero blocks have the same multiplier.

*Needs:* §2.6; §2.1; ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:matched-fibre-product-centre); ShimuraData Layer 4 (gap:multiplier-exact-sequences); ShimuraData Layer 4 (gap:hodge-cover-refinement).

**API.**

- Expose the two datum maps, their common adjoint image and their common multiplier.
- For nonzero alternating forms ψ_i and similitudes g_i of factors with c_i, the block operator scales ψ_1⊕ψ_2 by c exactly when c_1=c=c_2.
- The reflex field lies in E_1E_2; at the chosen p-place the auxiliary reflex splitting identifies the composite local field with E_2,v.

**Checks.**

- Two copies of one symplectic similitude with the same multiplier give a direct-sum similitude with that multiplier.
- On two standard symplectic Q-planes, diag(2,1) and diag(3,1) have multipliers 2 and 3; their block sum is not a similitude.
- Projection tensors on V_1⊕V_2 exclude a matrix mixing the two summands, even if it preserves their total symplectic form.

*Remark.* The plain product of two GSp groups does not act by similitudes on the direct-sum form.

### 5.3 Integral geometry of the matched datum

**Theorem.** For the matched datum (G_3,X_3) of the strongly acceptable setup, with G_3° the very-special parahoric associated to G_2°, the compact-centre exact sequences and torsion-free coinvariants give G_3^fix=G_3°, and (G_3,X_3) admits a Hodge embedding that is good with respect to G_3°. Its projection to G_1 gives the integral map and completed-local-ring comparison of the derived-isomorphism theorem. Its map to G_2 is constructed by neutral-component descent. In this setup both comparison maps induce isomorphisms on completed local rings at corresponding geometric special points, and ordinary classes correspond under the derived maps.

(KZ, Lemma 4.3.8, pp.40–41, and the proof of Proposition 4.3.6, pp.41–42; Lemma 4.1.4, p.29, with Propositions 3.1.9 and 3.1.12, pp.19–21, for the good embedding; proof of Theorem 4.4.6, pp.45–46).

*Proof sketch.* KZ checks the centre of the matched fibre product and uses the resulting integral maps to transport ordinary lifts. The connected fixer follows from the torsion-free coinvariants by the very-special criterion of ReductiveGroupsPartII §RG2.3. For the embedding, G_3,Qp is acceptable, because G_3^ad=G_2^ad is a product of restrictions of scalars of split groups (§2.1), and ι_3⊗Q_p on V_3=V_1⊕V_2 is a local symplectic Hodge embedding. Since π₁(G_3^der)=π₁(G_1^der) is a 2-group (§2.6) and p>2, p does not divide its order. The multiplier sequence of the Hodge-type datum (G_3,X_3) with its embedding ι_3, whose adjoint group G_2^ad need not be Q-simple, makes the centre Z_(G_3) an extension of G_m by Z^c_(G_3)≅Z^c_(G_2)×Z^c_(G_1) (ShimuraData, gap:multiplier-exact-sequences and gap:matched-fibre-product-centre), and that kernel is a product of Weil restrictions of tame tori (§2.1, §2.6); so Z_(G_3) is an R-smooth torus (gap:rg3-r-smooth-tori), and then so is the centralizer of a maximal Q̆_p-split torus of G_3,Qp (gap:rg3-r-smooth-abelian-type). The good-embedding theorem of GeometricSatakeAndFusionPartII §7.7 then gives a good integral Hodge embedding of the stabilizer scheme, which is G_3° by the first step, on the Q_p-space underlying (V_3⊗K)^r, for a finite extension K/Q_p splitting G_3 and some r≥1. G_3 preserves the form Σ Tr_(K/Q_p)∘(Ψ_3⊗K) up to its multiplier, and this form is nondegenerate and alternating (GeometricSatakeAndFusionPartII §2.8), so the embedding is symplectic (KZ Proposition 3.1.12); after scaling, the lattice lies in its dual. This local embedding is the localization at p of the Hodge embedding of (G_3,X_3) on the Q-space (V_3⊗_Q K′)^r with the form Σ Tr_(K′/Q)∘(Ψ_3⊗K′), where K′ is a totally real number field with a single place above p and completion K there. Such a K′ exists by Krasner's lemma and weak approximation, and total reality makes `Ψ′(x, h(i)x)` definite. The non-exceptional chains of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§3.13 and 3.16 are not used, because a strongly acceptable target may have D^H factors. Distinguish the derived-isomorphism projection from the derived-cover projection and apply the appropriate descent comparison.

*Needs:* §5.2; §5.1; §3.6; §2.1; §2.6; BunGAndNewtonStrata §1.28; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-abelian-type); ShimuraData Layer 4 (gap:matched-fibre-product-centre); ShimuraData Layer 4 (gap:multiplier-exact-sequences); GeometricSatakeAndFusionPartII §7.7; GeometricSatakeAndFusionPartII §2.8; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1.

**Checks.**

- For p=5 and K=Q_5(√2), the unramified quadratic extension, K′=Q(√2) qualifies: it is totally real, and 5 is inert in it because 2 is not a square mod 5. Over R the space is two copies of V_3,R, each carrying Ψ_3, so `Ψ′(x, h(i)x)` is a sum of two values of one sign.
- K′=Q(√−2) also has 5 inert, since −2≡3 is not a square mod 5, and its completion is the same K. But it has a complex place: writing x=a+b√−1 with a,b in V_3,R, the traced form gives `2(Ψ_3(a, h(i)a) − Ψ_3(b, h(i)b))`, which is indefinite. So the global form is not a polarization, and total reality is needed.
- K′=Q(i) has 5=(2+i)(2−i) split, so V_3⊗Q(i)⊗Q_5 is V_3,Q5 ⊕ V_3,Q5 over Q_5×Q_5 rather than V_3⊗K; a single place above p is needed. For K=Q_p itself, K′=Q gives r copies of V_3 with r copies of Ψ_3.
- Take for the target G_2 the common-multiplier subgroup of the unitary similitude groups GU(1,1) of Q(i) and of Q(√−11), at p=5 and hyperspecial level. Both fields split at 5 (−1≡4 and −11≡4 are squares mod 5), so G_2^der,Q5≅SL₂×SL₂ and Z^c_(G_2),Q5≅G_m×G_m, and the triple is strongly acceptable; but G_2^ad, the product of the two adjoint unitary groups, has two Q-simple factors, and so has G_3^ad. The centre Z_(G_2)={(a,b): a·ā=b·b̄} has rank 2+2−1=3, the two norm-one tori give Z^c_(G_2)=U(1)×U(1) of rank 2 (containing Z_(G_2^der)=μ₂×μ₂), and (a,b)↦a·ā maps Z_(G_2) onto G_m with kernel U(1)×U(1). So the multiplier sequence, rank 3=2+1, is needed for data whose adjoint group is not Q-simple, which a contract restricted to Q-simple adjoint groups would not cover. Without the common multiplier the centre of GU(1,1)×GU(1,1) has rank 4 and maps onto G_m×G_m, so no sequence with a single G_m exists; and the finite group Z_(G_2^der) alone is too small to be the kernel.

*Remark.* The two projection maps must not be justified by the same derived-isomorphism assertion unless their hypotheses are checked.

### 5.4 Integral Siegel map, Newton strata and isogeny groups for a chosen Hodge embedding

**Theorem.** Let (G_2,X_2,G_2°) be a strongly acceptable triple (§2.1), G_2° the connected parahoric of the very-special point x_2 and G_2^fix the full fixer of x_2. Let ι_2:(G_2,X_2)→(GSp(V_2),S_2^±) be a Hodge embedding and V_2,Zp⊂V_2,Qp a Z_p-lattice that is self-dual for the symplectic form and such that G_2,Qp→GSp(V_2,Qp) extends to a morphism of group schemes from G_2^fix to the stabilizer group scheme of V_2,Zp in GSp(V_2,Qp). Let K′_2,p be the stabilizer of V_2,Zp in GSp(V_2,Qp), which then contains K_2,p=G_2°(Z_p), let K_2^p be a prime-to-p level and K′_2^p a compact open subgroup of GSp(V_2)(A_f^p) containing the image of K_2^p. Then the generic Siegel map Sh_(K_2)(G_2,X_2)→Sh_(K′_2)(GSp(V_2),S_2^±) extends to a map of O_E2-stacks from the integral model of §3.8 to the single-lattice Siegel model of V_2,Zp (§0.1) over O_E2. The extension is not asserted for a self-dual lattice whose stabilizer does not contain the image of G_2^fix. Every strongly acceptable triple admits such data: any Hodge embedding can be replaced by one carrying such a lattice (KZ §4.3.5, p.40). The universal abelian scheme pulled back by this map is therefore available even when ι_2 was not used to define the model.

(KZ, §4.3.5 and Proposition 4.3.6, p.40, with §4.3.7–4.3.8, pp.40–42).

*Proof sketch.* KZ extends the Siegel map of ι_2 by comparison with the very-good auxiliary embedding. Build the matched integral diagram and descend the Siegel map through the integral component action. For the existence of the data, start from any Hodge embedding on V_2^0, take a lattice Λ_0⊂V^0_2,Qp to which G_2,Qp→GL(V^0_2,Qp) extends as a morphism G_2^fix→GL(Λ_0) (ReductiveGroupsPartII, gap:fixer-stable-lattices; KZ obtains it from the equivariant embedding of buildings), and scale the form so that Λ_0 lies in its dual. As G_2^fix is smooth over Z_p and the multiplier takes unit values on the bounded group G_2^fix(Z̆_p), the multiplier extends to a character G_2^fix→G_m, so the dual lattice Λ_0^∨ is G_2^fix-stable too. Zarhin's enlargement (§0.1) then gives a Hodge embedding on eight copies of V_2^0 with a self-dual lattice built from Λ_0 and Λ_0^∨, stable under G_2^fix.

*Needs:* §0.1; §2.1; §2.6; §3.6; §3.7; §3.8; §5.3; PELModuli §§M4.5–M4.6, M6.1–M6.4; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; ReductiveGroupsPartII §RG2.3 (gap:fixer-stable-lattices).

**Construction.** Fix a strongly acceptable triple (G_2,X_2,G_2°), a Hodge embedding ι_2:(G_2,X_2)→(GSp(V_2),S_2^±) with a self-dual lattice V_2,Zp as in the theorem above, so that G_2^fix maps to its stabilizer scheme, and a neat prime-to-p level K_2^p with a Siegel level K′_2^p as there; write S_(K_2) for the model of §3.8 at K_2=K_2,p°K_2^p. Let A_2 be the pullback of the universal abelian scheme along the integral Siegel map of the theorem. As S_(K_2) is normal and flat over O_E2, this map factors through N, the normalization in Sh_(K_2)(G_2,X_2) of the Zariski closure of its image, and A_2 is pulled back from N. N is the normalization of the closure of a Hodge-type Shimura variety in a single-lattice Siegel model, the setting of HT §1.3.5, and §§0.4–0.6 apply to it with their proofs: they give the prime-to-p étale tensors, the lift-independent crystalline tensors and the crystalline tensor functor of the universal abelian scheme on N, and these are pulled back to S_(K_2). Two lifts of one point of S_(K_2) map to two lifts of one point of N, so the crystalline tensors at a point of S_(K_2) do not depend on the lift. For a geometric special-fibre point x of S_(K_2), the class [b_x]∈B(G_(2,Qp),{μ_(h_2)⁻¹}), the Newton strata, the ordinary locus and the groups I_x and I_(x/Fq) are defined as in §§4.1, 4.3, 4.6 and 4.8 for A_2 with these tensors, and §§4.2, 4.4, 4.5 and 4.9–4.13 hold for them with the same proofs, the extension property of §3.8, applied as in the theorem below, taking the place of the finite-level criterion of §1.6 in §4.5. All of these are formed for the fixed ι_2; independence of ι_2 is not asserted. At a level that is not neat they are formed on a neat normal cover and descend. Layers 5, 6 and 7 use the Newton strata, the ordinary locus and the groups I_x of a strongly acceptable model in this sense.

(KZ, §4.4.1–4.4.2, pp.42–43, and §4.4.5, p.43; HT §1.3.5 and Proposition 1.3.7, pp.17–18).

*Needs:* the integral Siegel map above; §0.1; §0.4; §0.5; §0.6; §3.8; §4.1; §4.2; §4.3; §4.4; §4.5; §4.6; §4.8; §4.9; §4.10; §4.11; §4.12; §4.13; ShimuraVarieties §5.6.

**Theorem.** In the setting of the construction, the geometric special fibre of S_(K_2) is normal, in particular locally integral, and its ordinary locus, formed for ι_2, is open and dense.

(KZ, Theorem 4.4.4, p.43; HT Corollary 1.3.16, p.20; KPZ §7.3.1(3), pp.86–87, for the pieces of the model).

*Proof sketch.* At very special level the geometric special fibre of M_loc(G_2,{μ_h,2}) is integral (gap:local-models) and its irreducible components are normal (GeometricSatakeAndFusionPartII §§3.1 and 7.6), so it is normal; normality passes to the geometric special fibre of S_(K_2) through the smooth maps q and π of §3.10. The ordinary class is the unique maximal class of B(G_(2,Qp),{μ_(h_2)⁻¹}), so the ordinary locus is the complement of the closed loci S_≤[b] of the other classes and is open (§4.4). G_2,Qp is quasi-split, its adjoint group being a product of restrictions of scalars of split groups (§2.1), so §4.5 gives a special point s=[h,g] of Sh_(K_2)(G_2,X_2), h∈X_2 special, with ordinary reduction. Over the completed maximal unramified extension of O_E2, each connected component of S_(K_2) is the image of a piece of §3.6, a connected component of the pro-prime-to-p auxiliary Hodge model of §2.6 at its very-special level; at every neat finite level the geometric special fibre of such a component is locally integral (§1.9), hence irreducible (gap:component-specialization), so the piece and its image have irreducible special fibres. For every g′∈G_2(A_f) the special point s′=[h,g′] reduces. Indeed A_(2,s′) has potentially good reduction (ShimuraVarieties §5.6); over a finite extension F′ of a field of definition of s′ it has good reduction, so the inertia group of F′ acts trivially on its prime-to-p Tate module (NeronModelsAndSemistableAbelianVarieties §5.1); since ι_2 is injective on G_2(A_f^p), inertia then acts trivially on the fibre over s′ of the prime-to-p tower, so s′ lifts to the pro-tower over the maximal unramified extension of F′, whose valuation ring is a discrete valuation ring, and the pro-level bijection of §3.8 extends the lift. The abelian variety of s′ is quasi-isogenous to A_(2,s) by a quasi-isogeny matching the étale tensors at all primes, so the reductions carry quasi-isogenous Dieudonné modules with matching crystalline tensors and the same class. As G_2(A_f) permutes the connected components of Sh_(K_2)(G_2,X_2) over Q̄ transitively, the ordinary locus meets the special fibre of every connected component, and is therefore dense in it.

*Needs:* the construction above; §1.9; §2.1; §2.6; §3.6; §3.8; §3.10; §4.4; §4.5; ShimuraVarieties §5.6; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); ShimuraCompactifications Layer 7 (gap:component-specialization).

**API.**

- When ι_2 is a very-good embedding with G_2^fix=G_2° and S_(K_2) is the normalized Hodge model of ι_2 (§0.1), N is S_(K_2) itself and the construction returns the tensors of Layer 0 and the strata and groups of Layer 4.
- The class [b_x], the Newton strata, the ordinary locus and the groups I_x and I_(x/Fq) are compatible with prime-to-p level change, prime-to-p Hecke translation and extension of the residue field.
- For x over F_q, the inverse γ_x=π_x⁻¹ of the q-Frobenius of A_(2,x) lies in I_(x/Fq)(Q), and for ℓ≠p it acts on H₁(A_(2,x))⊗Q_ℓ, with its étale tensors, as geometric q-Frobenius (§4.9).

**Checks.**

- Take GU(1,1) of Q(i) for the hermitian form diag(1,−1), p=5 and hyperspecial level, with ι_2 on V_2=Q(i)² and the self-dual lattice Z[i]²⊗Z_5 (5 is prime to the different 2 of Z[i] and the form is unimodular). The hyperspecial point is the one this lattice defines, so G_2^fix is the stabilizer scheme of the lattice in G_2 and the hypothesis of the theorem holds. As Z[i]⊗Z_5=Z_5×Z_5, A_2[5^∞] splits as H×H′ with H′≅H∨ through the polarization; each factor has height 2 and, the signature being (1,1), dimension 1. So x is ordinary exactly when H has slopes (0,1), and then A_(2,x) has p-rank 2, and basic exactly when H has slopes (1/2,1/2), with p-rank 0. Both occur by §4.5, as G_2,Q5≅GL₂×G_m is split; these are the Newton classes of the Check of §6.1.
- For the torus T=Res_(Q(i)/Q)G_m with ι_2 the inclusion T⊂GL₂=GSp(Q(i)) for the form Tr(i·xȳ/2) (unimodular on Z[i], since its value on (1,i) is 1), the triple is strongly acceptable at p=5: the derived group is trivial and the norm-one torus is split over Q_5. B(T,{μ⁻¹}) is a single class, so every point of the zero-dimensional special fibre is ordinary. This agrees with the abelian fibres, elliptic curves with CM by Z[i] and ordinary at the split prime 5, such as y²=x³+x over F₅, which has the automorphism (x,y)↦(−x,2y) of order 4 and trace 2. At the inert prime 3 the same curve has 4 points over F₃, trace 0, and is supersingular, but there the norm-one torus has H¹(Q_3,T¹)=Q_3^×/N(Q_9^×)≅Z/2, is not induced, and the triple is not strongly acceptable.
- The lattice hypothesis is not implied by self-duality. For the torus T and the form of the previous Check at p=5, write e_1,e_2 for the eigenlines of T(Q_5)=Q_5^××Q_5^× in V_2,Q5=Q(i)⊗Q_5; with α²=−1 in Z_5 the form is u(x_1y_2−x_2y_1), u=α/2 a 5-adic unit. The lattice spanned by f_1=e_1+e_2/5 and f_2=e_2 is self-dual (its Gram determinant is u²), but t=(1,2)∈T(Z_5) sends f_1 to e_1+(2/5)e_2=f_1+(1/5)f_2, outside it. So the fixer T(Z_5) is not in its stabilizer, there is no Siegel map Sh_(K_2)→Sh_(K′_2) at these levels, and the theorem does not apply; the lattice Z[i]⊗Z_5=Z_5e_1⊕Z_5e_2 of the previous Check is stable under every (a,b) with a,b units and satisfies the hypothesis.
- Replacing ι_2 by ι_2⊕ι_2 on V_2⊕V_2, with the self-dual lattice V_2,Zp⊕V_2,Zp, replaces A_2 by A_2×A_2 with its projection tensors. A tensor frame φ of D(A_(2,x)) gives the frame φ⊕φ, whose Frobenius is (ρ∨⊕ρ∨)(b_x)σ with the same b_x, so [b_x] and the ordinary locus are unchanged. Read in the Siegel groups the class would move from B(GSp₄) to B(GSp₈) for GU(1,1); the class lives in B(G_2), which does not see the doubling.

*Remark.* Changing the defining embedding is an asserted comparison theorem, not a redefinition of the integral model.

### 5.5 Product comparison of abelian fibres

**Theorem.** In the matched integral diagram, S_(K_1) is the normalized Hodge model (§0.1) of the auxiliary cover of §2.6 for its very-good embedding ι_1:(G_1,X_1)→(GSp(V_1),S_1^±) with lattice V_1,Zp, S_(K_2) is the model of §3.8 with the Hodge embedding ι_2 and self-dual lattice V_2,Zp of §5.4, S_(K_3) is the normalized Hodge model of (G_3,X_3) for the good embedding of §5.3, at levels K_i=G_i°(Z_p)K_i^p with neat K_i^p and K_3^p mapping into K_1^p and K_2^p, and j_i:S_(K_3)→S_(K_i), i=1,2, are the integral maps of §5.3. The diagram maps to the moduli space of pairs of polarized abelian schemes with a common similitude scalar. Pullback of the universal objects gives A_3≅j_1^*A_1×j_2^*A_2 over the common local base, and identifies the projection tensors, polarizations and all étale and crystalline realizations. This is a product of abelian schemes with specified tensors, not merely an isogeny of unstructured fibres.

With ι_3 on V_3=V_1⊕V_2 as in §5.2, write i_3 for the map of S_(K_3) to the pair moduli followed by the map sending a pair to its product, with product polarization and level structure, into the single-lattice Siegel model of (V_3, V_1,Zp⊕V_2,Zp) (§0.1; the lattice lies in its dual). Then A_3 is the pullback of the universal abelian scheme along i_3, and i_3 is not the embedding that defines S_(K_3). As S_(K_3) is normal and flat, i_3 factors through N_3, the normalization in Sh_(K_3)(G_3,X_3) of the Zariski closure of its image, as in the construction of §5.4. So §§0.4–0.6, applied to N_3 with their proofs and pulled back to S_(K_3), give for A_3, and for a tensor family cutting out G_3 in V_3^⊗ that contains the two projections and the pullbacks of the families of G_1 and G_2, the prime-to-p étale tensors, the lift-independent crystalline tensors and the crystalline tensor functor. For a geometric special-fibre point x_3 of S_(K_3), the class [b_(x_3)]∈B(G_(3,Qp),{μ_(h_3)⁻¹}), the ordinary locus and the group I_(x_3) are those of §§4.1, 4.3, 4.6 and 4.8 for A_3 with these tensors, and §§4.2 and 4.9–4.13 hold for them with the same proofs. At x_1=j_1(x_3) and x_2=j_2(x_3) these objects are those of Layer 4 for ι_1 and of §5.4 for ι_2. At a lift of x_3 the pulled-back tensors of G_1 and G_2 are the étale tensors of A_1 and A_2 at its images, so at x_3 their crystalline tensors are those of x_1 and x_2. A tensor frame of D(A_(3,x_3)) preserves the projections, so it is a pair of tensor frames of D(A_(1,x_1)) and D(A_(2,x_2)); hence [b_(x_3)] maps to [b_(x_i)] under G_3→G_i for i=1,2, and x_3 is ordinary exactly when x_1 is, and exactly when x_2 is (BunGAndNewtonStrata §1.28).

(KZ, Proposition 4.4.8 and equation (4.4.9.1), pp.44–45; §4.4.9, pp.44–45, for A_3 and I_(x_3), and §4.4.1, p.42, for the factorization through the normalized image; proof of Theorem 4.4.6, §4.4.11, p.45, with Lemma 2.2.8, pp.10–11, for the ordinary classes).

*Proof sketch.* KZ realizes the common-multiplier Siegel diagram by the product moduli problem. Apply normalization to the finite map from the common-multiplier moduli model and pull back the universal abelian schemes. Form the tensors and the Layer 4 objects of A_3 through the normalized image of i_3, as §5.4 does for ι_2, and read the frame comparison off the crystalline projection tensors.

*Needs:* §5.4; §5.3; §0.1; §0.4; §0.5; §0.6; §2.6; §4.1; §4.2; §4.3; §4.6; §4.8; §4.9; §4.10; §4.11; §4.12; §4.13; PELModuli §§M4.5–M4.6, M6.1–M6.4; AbelianSchemesAndArithmeticModuli §A4.1; AbelianSchemesAndArithmeticModuli §A4.3; BunGAndNewtonStrata §1.28.

*Remark.* The two projection idempotents must be retained in every realization. The defining embedding of S_(K_3) is not ι_3: when §5.3 takes K=Q_p, K′=Q and r=2, it is ι_3⊕ι_3 on V_3⊕V_3 with Ψ_3⊕Ψ_3, whose abelian scheme is isogenous to A_3×A_3, of twice the dimension of A_3, and Layer 4 read for it would give a group of quasi-isogenies of A_(3,x_3)×A_(3,x_3) rather than a subgroup of Aut_Q(A_(1,x_1)×A_(2,x_2)). Every Layer 4 object on S_(K_3) used in this layer is the one formed for ι_3.

### 5.6 Exact sequences of tensor isogeny groups

**Theorem.** At corresponding geometric points x_i of the matched integral diagram, let C_i=ker(G_3→G_i), with I_(x_3) formed for A_3 and ι_3 as in §5.5, I_(x_1) that of Layer 4 for ι_1, and I_(x_2) formed as in §5.4 for the embedding ι_2 of the matched datum. Then 1→C_i→I_(x_3)→I_(x_i)→1 is an exact sequence of Q-algebraic groups for i=1,2. Projection tensors make the map on abelian products well-defined. Exactness can be checked at a prime using the all-prime tensor Tate theorem and compatible semisimple centralizers; it is not inferred solely from surjectivity of G_3→G_i.

(KZ, Proposition 4.4.10, p.45).

*Proof sketch.* KZ identifies the tensor-isogeny group maps through the product abelian scheme and checks exactness in a realization. Use the projection tensors, realize the central kernels through specialization of their generic actions, and apply the compatible centralizer comparison.

*Needs:* §5.5; §5.4; §4.13; ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:matched-fibre-product-centre).

*Remark.* Omitting projection tensors can allow off-diagonal endomorphisms and invalidates the proposed sequence.

### 5.7 Ordinary points are very good

**Theorem.** For a special Hodge model, meaning a good Hodge normalization with G^fix=G°, an ordinary point lies in the smooth extremal local-model locus and is a very-good point. Consequently the adapted deformation comparison of §1.2 applies to its formal branch even if the embedding has only been assumed good globally. This is a pointwise conclusion on the actual ordinary locus.

(KPZ, Corollary 5.3.16, p.60; KZ Remark 4.1.13, p.33).

*Proof sketch.* KZ locates ordinary points in the top smooth Schubert locus and applies the very-good trivialization criterion there. Use the ordinary integral-conjugacy and local-model smoothness inputs to verify the tensor-compatible first-order condition.

*Needs:* §4.6; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); GeometricSatakeAndFusionPartII §3.7; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11; §0.1; BunGAndNewtonStrata §1.29; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1.

*Remark.* A nonordinary singular local-model point is not certified very good by this theorem.

### 5.8 Ordinary Hodge special lift with isogeny action

**Theorem.** For a special Hodge model, meaning a good Hodge normalization with G^fix=G°, let x be an ordinary point where the embedding is very good. There is a finite extension K/Q̆_p and an integral lift with special generic point such that the entire I_x(Q)-action on A_x lifts in the isogeny category. Apply the ordinary p-divisible-group lifting theorem preserving J_b(Q_p), then Serre–Tate and polarized effectivity. Full rank of I_x forces the lifted Mumford–Tate group into a torus. Existence and the lifted action are asserted; no uniqueness or unramified field of definition is asserted.

(KZ, Theorem 4.1.11 and Remark 4.1.12, pp.32–33).

*Proof sketch.* Apply the ordinary adapted lift of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§6.4–6.5 to the p-divisible group, retaining its entire J_b(Q_p)-action by quasi-isogenies. Use Serre–Tate and polarized effectivity to lift the abelian point on its identified branch; full rank forces a toric Mumford–Tate group.

*Needs:* §5.7; §4.12; §4.9; BunGAndNewtonStrata §1.29; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§6.4–6.5; AbelianSchemesAndArithmeticModuli §A4.9; AbelianSchemesAndArithmeticModuli §A4.8; ShimuraData Layer 1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11.

*Remark.* A lift preserving only one Frobenius endomorphism does not satisfy the full I_x(Q)-action requirement.

### 5.9 Ordinary special lifts for strongly acceptable triples

**Theorem.** For a strongly acceptable triple with a Hodge embedding ι_2 as in §5.4 and every geometric point x of the ordinary locus of its integral model formed for ι_2 (§5.4), there exists an integral lift over a finite extension of Q̆_p whose generic point is special and whose abelian fibre A_2 carries a lift of I_x(Q) in the isogeny category. First transport a Hodge lift through the matched datum and the exact isogeny-group sequences; then reach every component using the conjugate-level gluing of §3.6, prime-to-p quasi-isogenies and the required p-power quasi-isogenies. All defining realizations are preserved.

(KZ, Theorem 4.4.6 and proof §4.4.11, pp.43–46).

*Proof sketch.* KZ carries the ordinary lift and its full isogeny action from the auxiliary model to the target. Use the formal comparison and exact isogeny-group sequences for points in the comparison image (their ordinariness on S_(K_3) is that of §5.5). For other component pieces use the actual conjugated p-level and transport the lift by the tensor-compatible quasi-isogenies.

*Needs:* §5.8; §5.6; §5.5; §5.4; §5.3; §3.6; BunGAndNewtonStrata §1.28.

*Remark.* The construction must preserve the exact finite-field q-Frobenius endomorphism through the lifted rational isogeny action.

### 5.10 Rational Frobenius at an ordinary point

**Theorem.** For a strongly acceptable triple with a Hodge embedding ι_2 as in §5.4 and an F_q-point x in the ordinary locus formed for ι_2 (§5.4), there is γ_0∈G(Q) whose image is G(Q_ℓ)-conjugate to the exact geometric q-Frobenius for every ℓ≠p. Moreover γ_0 is elliptic over R. Realize the rational q-Frobenius γ_x∈I_x(Q) on Betti homology of the special lift preserving I_x(Q); compare with the étale Tate-module realization and use Rosati compactness modulo the weight scalars. No finite power replaces q-Frobenius in the conclusion.

(KZ, Corollary 4.4.13 and Remark 4.4.14, p.46).

*Proof sketch.* KZ embeds the lifted rational isogeny group into the Betti G and sends q-Frobenius to a rational representative. Use Betti–étale tensor comparison for each ℓ, and compactness of a containing torus modulo the weight group for ellipticity.

*Needs:* §5.9; §5.4; §4.10; §4.9; AutomorphicBundles §§3.4–3.8.

*Remark.* The result is for the chosen F_q-point, so replacing it by F_(q^m) would prove a different statement.

### Examples

On the rational symplectic plane, identity has multiplier 1 and diag(2,1) has multiplier 2. The block diagonal sum of diag(2,1) and diag(3,1) has no single multiplier: testing the two planes forces c=2 and c=3. Thus the matched multiplier is essential even though both blocks are similitudes.

### Dependencies

*Needs:* §0.3; HeckeStacksAndLocalShtukas §HS2 (gap:integral-local-shimura); GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); §0.1; §1.7; §2.6; §2.1; ReductiveGroupsPartII §RG2.1; ShimuraData Layer 4 (gap:matched-fibre-product-centre); ShimuraData Layer 4 (gap:multiplier-exact-sequences); ShimuraData Layer 4 (gap:hodge-cover-refinement); §3.6; BunGAndNewtonStrata §1.28; ReductiveGroupsPartII §RG2.3; ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-tori); ReductiveGroupsPartIII Layer 2 (gap:rg3-r-smooth-abelian-type); GeometricSatakeAndFusionPartII §7.7; GeometricSatakeAndFusionPartII §2.8; §3.7; PELModuli §§M4.5–M4.6, M6.1–M6.4; PadicDifferentialEquationsAndRigidCohomology §RD.5.116; AbelianSchemesAndArithmeticModuli §A4.1; AbelianSchemesAndArithmeticModuli §A4.3; §4.13; §4.6; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§2.10–2.11; BunGAndNewtonStrata §1.29; §4.12; §4.9; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§6.4–6.5; AbelianSchemesAndArithmeticModuli §A4.9; AbelianSchemesAndArithmeticModuli §A4.8; ShimuraData Layer 1; §4.10; AutomorphicBundles §§3.4–3.8; FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §2.1; §0.4; §0.5; §0.6; §1.9; §3.8; §3.10; §4.1; §4.2; §4.3; §4.4; §4.5; §4.8; §4.11; ShimuraVarieties §5.6; ShimuraCompactifications Layer 7 (gap:component-specialization); ReductiveGroupsPartII §RG2.3 (gap:fixer-stable-lattices); NeronModelsAndSemistableAbelianVarieties §§5.1–5.2; DiamondsAndVStacksPartII §D10.11.

## Layer 6: Curves without residue extension

### 6.1 Kottwitz–Rapoport strata at very special level

**Construction.** For the strongly acceptable very-special model, pull back the Schubert stratification of the intrinsic local model through the connected adjoint frame diagram. The index set is the dominant inertia-coinvariant coweights λ≤μ_h, with Bruhat closure order and unique extremal index μ_h. The extremal KR stratum is open dense and smooth. Each stratum descends over the finite residue extension given by the Frobenius orbit of its index; do not assign all geometric strata individually to the base residue field.

(KZ, §5.2.1, pp.48–49).

*Proof sketch.* KZ identifies the very-special admissible Schubert indices and transfers them through the adjoint diagram. Use the imported affine flag closure and descent results; equivariance makes the inverse-image stratification independent of a frame.

*Needs:* §3.10; §2.1; GeometricSatakeAndFusion Layer GS0; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); GeometricSatakeAndFusionPartII §3.7.

**API.**

- A framed point lies in index λ exactly when its local-model image lies in the corresponding Schubert orbit.
- The closure is the union of strata with indices below λ in the very-special Bruhat order.
- Residue Frobenius sends index λ to σλ; an orbit descends over its orbit field.

**Checks.**

- The index μ_h gives the unique dense open Schubert stratum at very special level.
- On the split-at-p GU(1,1) hyperspecial curve, the minuscule local model has one KR stratum, while both ordinary and basic Newton classes (§5.4, for the embedding on Q(i)²) occur. A basic point is therefore top KR and nonordinary.
- A non-fixed geometric index is transported to a different index by residue Frobenius; individual descent requires its orbit field.

*Remark.* The KR extremal stratum and the ordinary Newton locus are different stratifications.

### 6.2 Rational lifting to the local-model diagram

**Theorem.** For x∈S(F_q), a fibre of the connected adjoint tensor-frame torsor has an F_q-point by Lang’s theorem for its smooth connected special-fibre group. Its image is a local-model point over the same F_q in the corresponding KR stratum. The statement uses the actual connected reduction of the diagram; it does not follow from a torsor under a group G^fix/Z with disconnected special fibre (§3.9) or from strict-henselian comparison.

(KZ, Proof of Corollary 5.2.7, pp.52–53).

*Proof sketch.* KZ trivializes the connected adjoint frame torsor over the finite field before constructing the comparison curve. Apply Lang to the fibre, then the equivariant local-model map.

*Needs:* §3.10; §6.1; ReductiveGroupsPartII §RG2.3.

*Remark.* Both the framing point and its local-model image must be defined over F_q.

### 6.3 Curves over the original residue field

**Construction.** For x∈S_(K,λ)(F_q) with λ below the top KR index, construct a smooth geometrically connected curve C/F_q, a rational point c∈C(F_q), and a map f:C→S with f(c)=x such that a dense open of C maps into a strictly higher KR stratum. Use the same-field local-model root-curve theorem, pull it through a smooth stack presentation retaining the rational point, and apply the same-field curve theorem of LefschetzPencilsAndVanishingCyclesPartII §2.4 to the presentation, its rational point and the dense inverse image of the higher stratum. For a point already in the top stratum, apply the same theorem to a smooth presentation of the smooth top KR stratum with a rational point over x and to the dense inverse image of the ordinary open (§5.4, for a chosen Hodge embedding). Throughout the residue field stays F_q.

(KZ, Proposition 5.2.3 and Corollary 5.2.7, pp.49–53; proof of Proposition 5.3.5, p.54, for a point of the top stratum).

*Proof sketch.* KZ first supplies local-model curves through rational points with a dense higher-stratum intersection, then transports them to the Shimura stack. Import the same-field Schubert curves of GeometricSatakeAndFusionPartII §5.5, including the ramified rank-one cases and the Lang argument for orbit representatives. Use the rational-point smooth stack presentation, then the same-field curve of LefschetzPencilsAndVanishingCyclesPartII §2.4 on that smooth scheme, with the inverse image of the higher stratum as the dense open: it is dense because the presentation and the base change of the local-model map are smooth, hence open, and the inverse image of a dense set under an open map is dense. The curve is geometrically integral, hence geometrically connected, and no projectivity of the presentation is needed.

*Needs:* §6.2; §6.1; §5.4; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); AlgebraicModuliForArithmeticGeometry Layer 4 (gap:rational-stack-presentation); LefschetzPencilsAndVanishingCyclesPartII §2.4; GeometricSatakeAndFusionPartII §5.5.

**API.**

- Return c, f and the equality f(c)=x over F_q.
- Return the nonempty dense open meeting a higher KR stratum, or the ordinary open in the top-stratum step.
- Pullback of every tower representation is lisse on C and has the original q-Frobenius at c.

**Checks.**

- If the marked point c had residue field F_(q²) instead of F_q, the Frobenius at c would be the square of that at x. For the CM point of the torus Check of §5.4, whose abelian fibre is y²=x³+x over F₅ with q-Frobenius polynomial T²−(2/5)T+1/5 on H₁, a marked point of degree two would give T²+(6/25)T+1/25.
- At a lower-stratum x, a constant map C→{x} fails the required dense higher-stratum condition.
- At a top-KR basic point on the split-at-p GU(1,1) hyperspecial curve, the comparison curve must meet ordinary points; top-KR membership alone cannot be the induction base.

*Remark.* The q-Frobenius at c is the same q-Frobenius as at x, not a power coming from field extension.

### Examples

For split-at-p GU(1,1) at hyperspecial level the KR index set has one element while the Newton stratification has ordinary and basic parts. For a zero-dimensional torus component already in the ordinary locus, the constant map A¹→{x} with marked point 0 supplies the top-stratum curve; at neat level the component through x is Spec F_q, and this is the zero-dimensional case of LefschetzPencilsAndVanishingCyclesPartII §2.4.

### Dependencies

*Needs:* §3.10; §2.1; GeometricSatakeAndFusion Layer GS0; GeometricSatakeAndFusionPartII §§3.1 and 7.6 (gap:local-models); ReductiveGroupsPartII §RG2.3; §5.4; AlgebraicModuliForArithmeticGeometry Layer 4 (gap:rational-stack-presentation); LefschetzPencilsAndVanishingCyclesPartII §2.4; GeometricSatakeAndFusionPartII §5.5.

## Layer 7: Geometric Frobenius classes

### 7.1 Intrinsic group-valued tower local systems

**Construction.** Let (G,X,G°) be a strongly acceptable triple (§2.1) with its integral model S_K (§3.8), let ℓ≠p, and let K^p be any prime-to-p level. Write K_ℓ for the image of K^p under the projection G(A_f^p)→G(Q_ℓ), a compact open subgroup onto which K^p surjects, and K^(ℓ) for the kernel of K^p→K_ℓ, the elements of K^p with trivial ℓ-component. At neat K^p the pro-prime-to-p tower over S_K is a pro-étale K^p-torsor: its transitions are finite étale (§3.8), and K^p acts freely, because at neat level the stabilizer of a point is central and, (G,X) being of Hodge type, Z_G(Q) is discrete in Z_G(A_f) (SV5, ShimuraData §4.2) and meets a neat level only in the identity; freeness on the generic fibre extends to the normal integral tower. Its quotient by K^(ℓ) is a pro-étale K_ℓ-torsor over S_K; extend its structure group along K_ℓ⊂G(Q_ℓ). Equivalently, push the K^p-torsor out along the projection K^p→G(Q_ℓ). When K^p=K_ℓK^ℓ is a product, the quotient is the limit of the S_(K_pK′_ℓK^ℓ) over open K′_ℓ⊂K_ℓ, the cover of KZ §5.1.1, which assumes that product form. On the special fibre this defines a G(Q_ℓ)-local system L_ℓ. At neat level it agrees with the tensor-frame torsor of the abelian H₁=T_ℓ(A)⊗Q_ℓ realization, A the pullback of the universal abelian scheme by the integral Siegel map of §5.4; it descends as a local system on the integral stack of §3.8 at a level that is not neat (the quotient stack formed as in §0.2), where the K^p-torsor is formed over the stack and K_ℓ is again the image of K^p. A path or frame changes the associated fundamental-group homomorphism only by G(Q_ℓ)-conjugation.

(KZ, §5.1.1–5.1.2, p.47).

*Proof sketch.* KZ defines the group-valued local system from the integral tower at levels that are products at ℓ and identifies its tensor-frame realization. Form the K^p-torsor at neat level, divide by K^(ℓ), extend structure group from K_ℓ to G(Q_ℓ), and descend along a neat normal quotient; at a product level this returns KZ's cover.

*Needs:* §2.1; §3.8; §0.3; §0.2; §0.4; §5.4; ShimuraData Layer 4; AutomorphicBundles §§3.4–3.8.

**API.**

- A Hodge embedding identifies L_ℓ with Isom_tensor(V_Qℓ,H₁(A)); the dual representation gives H¹_ét(A).
- An algebraic G-representation gives a lisse coefficient sheaf, preserving tensor, dual and coefficient extension.
- Prime-to-p level maps and Hecke translations pull back the local system compatibly with the pro-étale tower; for K′^p⊂K^p the pullback is the local system built from K′^p, whose group K′_ℓ, the image of K′^p, lies in K_ℓ.

**Checks.**

- The trivial representation gives the constant rank-one sheaf with Frobenius 1.
- A new frame conjugates the fundamental-group image; character values remain unchanged.
- The construction does not present the characteristic-p p-divisible group’s geometric points as an étale rank-2g local system.
- Take E=Q(i), p=5 (split in E), G=GU(1,1) for the hermitian form diag(1,−1) on E² with similitude ν and hyperspecial level at 5, a strongly acceptable triple by §2.1. Let K^p be the subgroup of a product level, with components G(Z₃) and G(Z₇) (the stabilizers of O_E²) at 3 and 7, cut out by χ₃(ν(k₃))χ₇(ν(k₇))=1, where χ_v is the quadratic character of Z_v^×. As 3 and 7 are inert, ν(G(Z_v)) contains the norms of local units, which are all of Z_v^×. So K_3=G(Z₃) and K^p/K^(3)≅G(Z₃), whereas K^p∩G(Q₃)=ker(χ₃∘ν) has index 2 in G(Z₃). The level is not a product at 3: (K^p∩G(Q₃))·K^(3) is cut out by χ₃(ν(k₃))=1=χ₇(ν(k₇)) and has index 2 in K^p, so a cover built from the intersection lies over a degree-two cover of S_K, not over S_K.
- For the Hilbert modular datum G=Res_(F/Q)GL₂, F real quadratic, which is of abelian but not Hodge type, and K the principal congruence level N≥3, the units of O_F congruent to 1 modulo N form an infinite subgroup of Z_G(Q)∩K. Each acts trivially on every Sh_(K′), K′⊂K, because a central rational element moves (x,g) to an equivalent pair. The tower over Sh_K is then a torsor only under K modulo the closure of these units, whose ℓ-component is a nontrivial central subgroup of K_ℓ, so the push-out along K→G(Q_ℓ) is not defined; the Hodge-type condition of §2.1 excludes this.

*Remark.* The local system is defined before choosing an auxiliary Hodge embedding.

### 7.2 Frobenius point in the conjugacy quotient

**Construction.** For an F_q-point y on the special-fibre Shimura stack, define γ_(y,ℓ)=χ_G(ρ_ℓ(Frob_q,geom))∈Conj(G)(Q_ℓ), where the conjugacy quotient χ_G is imported from ArithmeticGaloisRepresentations §1.11. The point is independent of paths, frames and the chosen neat cover. For every algebraic representation its characteristic polynomial is that of geometric Frobenius on the associated local-system fibre. A Q-rational quotient point is not by definition represented by an element of G(Q).

(KZ, §5.1.2–5.1.3, p.47).

*Proof sketch.* KZ sends the Frobenius of the intrinsic group-valued local system to the conjugacy quotient. Apply the imported quotient universal property and tensor-frame comparison to remove the choices.

*Needs:* §7.1; ArithmeticGaloisRepresentations §1.11; AbelianSchemesAndArithmeticModuli §A6.21.

**API.**

- Evaluation by a representation’s invariant characteristic-polynomial map gives its Frobenius characteristic polynomial.
- Extension from F_q to F_(q^m) gives the quotient of the m-th power of the original Frobenius.
- Changing a path or tensor frame gives the same quotient point.

**Checks.**

- For GL_n the coordinates are coefficients of det(T−g), with constant term (−1)ⁿdet(g) nonzero. For g=diag(1,1/5), the rank-two polynomial is T²−(6/5)T+1/5; using det(1−gT) as a monic polynomial would reverse these coordinates.
- Take the torus T=Res_(Q(i)/Q)G_m at p=5 with ι_2:T⊂GL₂, a strongly acceptable triple (§5.4), and the point y whose abelian fibre is E: y²=x³+x over F₅. Then Conj(T)=T and γ_(y,ℓ) is the image of π_y⁻¹=(1∓2i)/5∈T(Q)=Q(i)^×, where π_y=1±2i is the q-Frobenius of E (the sign depends on the place above 5). Its image in Conj(GL₂) has trace 2/5 and determinant (1+4)/25=1/5, so the standard tower polynomial is T²−(2/5)T+1/5; its contragredient H¹ polynomial is T²−2T+5. The constants are 1/5 and 5.
- For the same torus point over F₂₅, γ_y²=((1∓2i)/5)²=(−3∓4i)/25 has trace −6/25 and norm 1/25, so the tower polynomial becomes T²+(6/25)T+1/25; H¹ has trace 2²−2·5=−6 and determinant 25. Both differ from the polynomials over F₅.

*Remark.* Use geometric Frobenius consistently, with multiplier q in the H¹ convention.

### 7.3 Unit eigenvalues in every representation

**Theorem.** For every finite-dimensional algebraic representation θ of G over an algebraic coefficient field of characteristic zero and every special-fibre F_q-point, all Frobenius eigenvalues of θ are algebraic numbers that are units at every finite place away from p. The faithful abelian H₁ realization has reciprocals of the H¹ Weil eigenvalues and these are such units; θ occurs as a subquotient of sums of tensor products of H₁ and H₁∨, so the unit property persists. No finite-order determinant hypothesis is imposed on θ itself.

(KZ, Lemma 5.3.3, pp.53–54).

*Proof sketch.* KZ propagates the prime-to-p unit property from the faithful abelian realization to all algebraic representations. Use the abelian Weil polynomial and its integral roots, duality, tensor products and the tensor-generator theorem for algebraic representations.

*Needs:* §7.2; AbelianSchemesAndArithmeticModuli §A4.1; AbelianSchemesAndArithmeticModuli §A6.21; ReductiveGroupsPartII §RG2.1; MotivesAndAlgebraicCycles §6.3.

*Remark.* A determinant with nonzero Weil weight must be handled by coefficient twisting in the companion theorem, not falsely declared finite order.

### 7.4 Representation-wise Frobenius independence

**Theorem.** Fix y/F_q, primes ℓ,ℓ′≠p, algebraic closures and embeddings of a common algebraic coefficient field into them. For every algebraic representation θ of G over a number field large enough for the two algebraic Frobenius classes, the characteristic polynomials of θ(γ_(y,ℓ)) and θ(γ_(y,ℓ′)) agree under these embeddings. On a comparison curve use companions of the semisimplification of the pulled-back sheaf, a semisimple lisse sheaf on a smooth open curve whose Frobenius eigenvalues are algebraic and units at every finite place away from p (§7.3), allowing a constant twist and finite coefficient extension, and Chebotarev on its dense open. Start with ordinary points, then the top-KR curve meeting the ordinary locus, and descend through the finite KR order. Never extend F_q in this comparison.

(KZ, Proposition 5.3.5 and proof, p.54).

*Proof sketch.* KZ uses companions and Chebotarev on same-field curves to move the ordinary Frobenius equality down the KR order. Use the unit-eigenvalue lemma to check the open-curve companion hypotheses, allowing coefficient extension without residue-field extension. Identify the companion with the other pulled-back local system by equality on the dense higher-stratum open, then specialize to the rational marked point.

*Needs:* §5.10; §6.3; §7.3; GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 (gap:open-curve-companions); ArithmeticGaloisRepresentations §§5.1, 5.13; ReductiveGroupsPartIII §§0.6 and 1.3.

*Remark.* The companion input must cover smooth nonproper curves and semisimplifications; the projective finite-determinant statement alone is insufficient.

### 7.5 A common algebraic conjugacy class

**Theorem.** For a strongly acceptable triple and y/F_q, all representation characters identify the semisimple Frobenius quotient points over algebraic closures with one point in Conj(G)(Q̄). Algebraicity of each local quotient point follows from the faithful abelian characteristic polynomial and the finite map of conjugacy quotients; equality follows from all algebraic characters, not the faithful characteristic polynomial alone.

(KZ, §5.3.2, p.53, for algebraicity; proof of Theorem 5.1.4, §5.3.6, p.55, for equality).

*Proof sketch.* KZ combines representation-wise equality with invariant characters to identify the algebraic semisimple class. Use the finite faithful-quotient map of ReductiveGroupsPartIII §0.6 with the algebraicity of finite fibres (§1.3) for algebraicity, and character separation (ReductiveGroupsPartIII §0.5) for equality.

*Needs:* §7.2; §7.4; ReductiveGroupsPartIII §0.5; ReductiveGroupsPartIII §§0.6 and 1.3.

*Remark.* A faithful representation alone can merge distinct orthogonal conjugacy classes; all characters remove that ambiguity.

### 7.6 Rational common Frobenius class

**Theorem.** Let p>2, let (G,X,G°) be a strongly acceptable triple (so K_p=G°(Z_p) is a very-special connected parahoric), let K^p be any prime-to-p level, and let y∈S_K(F_q) be a point of the integral model of §3.8 (its quotient stack, formed as in §0.2, when K^p is not neat), where F_q is a finite extension of the residue field k_E of the reflex place. There is a unique γ_y∈Conj(G)(Q) whose image in Conj(G)(Q_ℓ) is γ_(y,ℓ) for every ℓ≠p. Descend the common algebraic point using its rational local realizations at almost all primes and the degree-one-residue criterion of ReductiveGroupsPartIII §1.2. This theorem supplies a quotient point; a rational representative in G(Q) requires additional group hypotheses and belongs to the downstream KZ §6 arithmetic application.

(KZ, Theorem 5.1.4, p.48; proof §5.3.6, p.55).

*Proof sketch.* KZ descends the common algebraic class to Q by using its realization in Q_ℓ for every ℓ≠p. Apply the imported degree-one residue-field descent theorem to the field of definition of the common quotient point; separatedness gives uniqueness.

*Needs:* §7.5; §3.8; ReductiveGroupsPartIII §1.2.

*Remark.* The exact q-Frobenius is retained throughout; uniqueness is in the conjugacy quotient, not in G(Q).

### Examples

For the torus point of the Checks of §7.2 (T=Res_(Q(i)/Q)G_m at p=5, abelian fibre y²=x³+x over F₅), γ_y=(1∓2i)/5 has image in Conj(GL₂) with coordinates (2/5,1/5); over F₂₅, γ_y² gives (−6/25,1/25). For the trivial representation, Frobenius is 1 over both fields. These are different points of Conj(T)(Q)=T(Q), although the geometric abelian fibre is the same.

### Dependencies

*Needs:* §2.1; §3.8; §0.3; §0.2; §0.4; §5.4; ShimuraData Layer 4; AutomorphicBundles §§3.4–3.8; ArithmeticGaloisRepresentations §1.11; AbelianSchemesAndArithmeticModuli §A6.21; AbelianSchemesAndArithmeticModuli §A4.1; ReductiveGroupsPartII §RG2.1; MotivesAndAlgebraicCycles §6.3; §5.10; §6.3; GlobalShtukasAndFunctionFieldLanglands §§6.1–6.2 (gap:open-curve-companions); ArithmeticGaloisRepresentations §§5.1, 5.13; ReductiveGroupsPartIII §§0.6 and 1.3; ReductiveGroupsPartIII §0.5; ReductiveGroupsPartIII §1.2.

## Downstream consumers

- The abelian-variety form of independence of ℓ (KZ §6, Proposition 6.2.4 through Theorem 6.2.7) takes §7.6 as its geometric input, through an auxiliary Hodge-type group whose integral model has a point with the same residue field; ReductiveGroupsPartIII Layer 5 states that application, taking §7.6 as the hypothesis of its §5.5. Passing to the H¹ convention uses the contragredient representation, equivalently inversion on Conj(G): for the torus point of the Checks of §7.2, the coordinate pair (2/5,1/5) in Conj(GL₂) becomes (2,5), the trace and determinant of 1±2i.
- Integral models of abelian type (§3.8), their adjoint local-model diagrams (§§3.9–3.10), the extension property over discrete valuation rings (§1.6), canonical integral models (§1.7) and the Newton stratification (§§4.3–4.4) are the integral input for the geometry of special fibres of abelian-type Shimura varieties beyond the PEL case.
- Integral datum maps (§5.1) and ordinary special lifts (§§5.8–5.10) give special lifts and rational Frobenius representatives without extension of the residue field.

## References

- KZ: Mark Kisin; Rong Zhou. Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties. arXiv:2103.09945v2; printed preprint pagination, 63 pages; not collated with Annals 202 (2025). [Legal text](https://arxiv.org/pdf/2103.09945v2).
- HT: Mark Kisin; Keerthi Madapusi Pera; Sug Woo Shin. Honda–Tate theory for Shimura varieties. Author PDF dated 27 January 2021, 41 pages; published Duke Math. J. 171 (2022); author pagination. [Legal text](https://math.berkeley.edu/~swshin/HT.pdf).
- KPZ: Mark Kisin; Georgios Pappas; Rong Zhou. Integral models of Shimura varieties with parahoric level structure, II. Published Forum Math. Pi 14 (2026), e14; 89-page publisher PDF. [Legal text](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6C2640CC5856BDF975AF97EE30CA7906/S2050508626100316a.pdf/div-class-title-integral-models-of-shimura-varieties-with-parahoric-level-structure-ii-div.pdf).
- KP: Mark Kisin; Georgios Pappas. Integral models of Shimura varieties with parahoric level structure. Published Publ. Math. IHÉS 128 (2018), 121–218; journal pagination. [Legal text](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf).
- K17: Mark Kisin. Mod p points on Shimura varieties of abelian type. Author manuscript dated 27 August 2016; published J. Amer. Math. Soc. 30 (2017); internal pagination. [Legal text](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf?download=1).
- PaRa24: Georgios Pappas; Michael Rapoport. p-adic shtukas and the theory of global and local Shimura varieties. arXiv:2106.08270v6; published Cambridge J. Math. 12 (2024), 1–164; arXiv pagination. [Legal text](https://arxiv.org/pdf/2106.08270v6).
- PaRa26: Georgios Pappas; Michael Rapoport. On integral local Shimura varieties. arXiv:2204.02829v4; published J. Inst. Math. Jussieu 25 (2026), 375–443; arXiv numbering and pagination, in which the comparison of completions under ad-isomorphisms is Proposition 5.3.1. [Legal text](https://arxiv.org/pdf/2204.02829v4).
- DvHKZ: Patrick Daniels; Pol van Hoften; Dongryul Kim; Mingjia Zhang. On a conjecture of Pappas and Rapoport. arXiv:2403.19771v4; published Math. Ann. 395 (2026); arXiv pagination. [Legal text](https://arxiv.org/pdf/2403.19771v4).

### Source conventions and corrections

- KZ, arXiv v2 Proposition 4.2.3(5), p.34, compared with Lemma 4.2.4 and its use on p.41: The intended assertion is torsion-free inertia coinvariants. The proof excludes the wild-index factor to invoke freeness, and the immediately following connected-fixer criterion requires torsion-free coinvariants. KPZ 7.2.19 supplies the free condition.
- KZ, arXiv v2 §5.1.3, p.47: Geometric points classify semisimple geometric conjugacy classes. Rational quotient points encode Galois-stable geometric classes; they need not classify rational conjugacy or have an F-rational representative. In SL₂(R), rotations by θ and −θ with sin θ nonzero have the same characteristic polynomial and geometric semisimple class, but no determinant-one real conjugator. A conjugator reverses the complex structure and has negative determinant.
- HT, Author PDF Corollary 1.3.13 proof, p.19: Use its actual Tannaka group H and its inclusion into G. Restriction of G-representations followed by the generated-category equivalence gives the required exact faithful functor. No equality H=G is required. Extra horizontal/Frobenius-invariant tensors may shrink H. For a trivial rank-two isocrystal with no imposed extra tensors, its generated category has trivial group while the unconstrained tensor stabilizer is GL₂. The same formal issue persists for families with proper monodromy.
- KP, Theorem 4.2.7 and its proof, pp.186–187; corrected in KPZ §7.3.1(1), p.85: It is a smooth group-action map. The frame projection is the torsor; the filtration map is smooth of the stated relative dimension. For the natural action on tensor frames, q_loc transports the filtration and is not invariant, whereas the frame projection is invariant. The action map is smooth by composing (g,m)↦(g,gm) with projection; this is exactly the property needed.
- KP, Published KP Lemma 3.1.17 argument, corrected in published KPZ §7.3.1(2), p.86: Prove that the existing ring W-hat(A)[1/p] is already complete and separated for its p-adic topology. Use Zink logarithmic coordinates to prove the shifted tails tend to zero in that topology. Convergence in a noncomplete τ-topology does not justify the limit. The correction proves p-adic completeness and uses divisibility plus the logarithmic tail shift to establish the required convergence.
- KP, Lemma 4.6.13 and Corollary 4.6.15, pp.202–203; formula (4.6.20) repeated in Corollary 4.6.18, p.205; corrected in KPZ §7.3.1(3), pp.86–87: The component associated with j has p-level jK_p°j^(-1). Glue the corresponding conjugated-level connected pieces with the transported actions. Changing the p-component of a double-coset representative conjugates its stabilizer. The original identification only works uniformly if those representatives normalize the level.
- KPZ, Published KPZ §7.3.2, p.87, correcting the cited Pappas embedding-independence proof: Use the theorem only for very-good embeddings in the stated local-model scope, unless a stronger independent canonical-model theorem is supplied. The integral tensor/display comparison needs the first-order tensor-compatible trivialization; a closed good lattice embedding alone does not provide it.
- KP, Published KP local-model theorem and earlier KZ versions, as corrected by published KPZ Remark 7.1.4(1), p.73: For that display-based local-model diagram require a very-good embedding, including the first-order tensor trivialization. Keep KPZ 7.1.8’s separate modern shtuka proof for the broader strict-henselian result. The display comparison needs its canonical first-order identification to fix the defining tensors. A closed Grassmannian embedding alone does not establish that equality.
- DvHKZ, arXiv v4 proof of Theorem 4.2.3, p.36: The stabilizer in GSp(V_Qp) of a single lattice on which ψ is Z_p-valued need not be parahoric or quasi-parahoric (Checks of §1.7), so Lemma 4.2.1 does not apply to its Siegel model directly. Pass first to Zarhin's self-dual lattice, whose stabilizer in G is the same; the normalized closures agree because the Zarhin morphism of Siegel models is finite (§1.7, Hodge-type theorem).
- HT, Author PDF §1.3.15 and Corollary 1.3.16, p.20; compare KZ Definition 2.2.4 and Remark 2.2.5, p.10: Define the ordinary locus only after specifying an actual class with Newton point equal to the averaged inverse Hodge cocharacter. Quasi-splitness guarantees existence; general inner forms need not have such a class. Keep the separate local-integrality hypothesis for density. For the quaternion division group, transfer to GL₂ over the unramified completion shifts both slopes by one half. Putative ordinary slopes (0,−1) would yield slopes (1/2,−1/2), each once, contradicting the denominator-divisibility constraint for isocrystals. This diagnoses a missing existence premise, not a counterexample to density under local integrality.
