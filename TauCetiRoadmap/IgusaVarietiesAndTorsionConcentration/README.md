# Roadmap: Igusa varieties, compactified period fibres and torsion concentration

**Summary.** Build `Igusa` towers and their partial compactifications, identify compactified Hodge–Tate period fibres, and prove generic torsion concentration for unitary Shimura varieties. The geometric and coefficient theory connects central leaves and PEL deformation spaces to the two Igusa degree bounds, the trace-formula ordinary criterion and Pink's boundary formula. The final layer gives Caraiani–Scholze vanishing, its integral and middle-degree forms, and Koshikawa's local and global refinement through geometric Hecke actions and excursion parameters.

## Scope and ownership

The owned targets are the datum-specific Hecke comparisons, the geometric extensions of the supplied Newton and central-leaf theory, structured universal-cover automorphisms and PEL deformation spaces; partial compactifications of the supplied Igusa towers; period fibres, degree bounds, ordinary genericity, Pink's formula and torsion concentration. The minimal `B(G)` and invariant carrier is PadicHodgeTheory §5.5. EndoscopicTransferAndUnitaryTraceComparison §§7.2–7.10 supplies its tensor-isocrystal, `J_b`, central-leaf and Igusa-tower interfaces on that carrier. IG.0–IG.1 use specialization aliases for these common objects; the integral and geometric extensions act on the same spaces as the supplied rational trace theorem. IG.F extends the supplied unramified linear curve theory to ramified coefficients and effective `v`-descent, and constructs the `G`-bundle, crystalline, Artin/solid coefficient and geometric Hecke interfaces. Its Satake categories, weight functors, fusion and equivalences are supplied by GeometricSatakeAndFusion GS0–GS4; IG.F.15–IG.F.16 retain application aliases and their comparisons with the Igusa Hecke kernels. IG.4.0a–IG.4.0d construct the valuation-model and two-tower support comparisons. IG.7 also owns supercuspidal support and lifting for inner forms of `GL_m`. Its local vanishing uses mod-`ℓ` coefficients; global integral consequences use IG.7.6.

General group theory, smooth representations, determinants, moduli, compactifications, analytic geometry, cohomology, arithmetic quotients and rational trace comparison are inputs from the named sections in Exact supplier contracts. The roadmap owns their Igusa specializations and the indicated extensions.

The mathematical specification in this README is definitive; [Suggested.lean](Suggested.lean) records the definitions and milestone statements expressible against the pinned carriers. It does not introduce formal geometric carriers for the later layers.

## Conventions

The global datum is the quasi-split unitary similitude group attached to a CM field `F`, its maximal real subfield `F⁺`, and a split skew-hermitian space of dimension `2n`. The rational similitude factor is common to all embeddings. The local geometric results have the broader unramified PEL generality of types `(A)` and `(C)`; they do not include type `(D)`. The Harris–Taylor Drinfeld-level constructions use their own signature `(1, n−1)` datum and are never obtained by silently changing the signature of the balanced global datum.

Write `p` for the geometric prime, `ℓ ≠ p` for the coefficient prime, `k` for an algebraically closed field of characteristic `p`, and `C` for a complete algebraically closed extension of `ℚ_p` with valuation ring `O_C`. For the balanced unitary datum,

`d = [F⁺:ℚ] n²`, `d_b = ⟨2ρ, ν_b⟩`.

Here `d` is the complex dimension of the Shimura variety and `d_b` is the dimension of the central leaf and of the finite-level Igusa varieties of `b`. Use the covariant Dieudonné convention of Caraiani–Scholze for Newton vectors: their slopes lie in `[−1, 0]`. Complete slope divisibility instead uses the nonnegative Frobenius slopes `λ` of IG.0.17. The two multisets are negatives of one another; reorder after negation when choosing a dominant vector. Thus `μ_{p^∞}` has Frobenius slope `1` and covariant Dieudonné slope `−1`, while `ℚ_p/ℤ_p` has slope `0` in both conventions. A Shimura Hodge cocharacter `μ` gives Newton classes in `B(G, μ⁻¹)`, where the dominant representative of `μ⁻¹` is `−w₀μ`. The nonnegative `GL` examples in IG.0.2 and Suggested.lean concern abstract isocrystals and dominance, rather than this negative Shimura normalization. The ordinary class is maximal for the Newton order and its flag stratum has dimension zero. A cyclotomic completed base `K_∞` is chosen once, before infinite-level local period fibres or the product formula are formed.

At finite level the Igusa maps are finite étale. The perfect Igusa variety trivializes the whole `p`-divisible group; Mantovan's tower trivializes liftable truncations of its slope-graded pieces. Mantovan's right action corresponds to the left quasi-isogeny action through inversion. Our left action is `(j, h)·(ρ, η) = (jρ, ηh⁻¹)`. Scalar pairs act trivially, so the action is not asserted to be faithful. Cohomology with `ℤ_ℓ` coefficients takes the derived limit over the coefficients before the colimit over geometric levels. Smooth duals, derived coinvariants and the orientation character `κ` are kept in every equivariant formula.

The notation `C^{X,tor}, C^{X,*}, Ig^{X,tor}` and `Ig^{X,*}` refers to **partial** compactifications inside the ambient compactifications. A partial compactification need not be proper. Finite-level minimal Igusa maps are finite, whereas their inverse limit is integral. At a semi-abelian boundary the torsion `A[p^∞]` need not be `p`-divisible: one uses its connected part and the polarized biconnected quotient. The functor `RΓ_{c−∂}` means `RΓ(Ig^{b,*}, j_!−)`, not compact support on `Ig^b`.

Arithmetic and geometric Frobenius conventions are never mixed. In the Hecke–Galois dictionary `Art_F` sends a uniformizer to a geometric Frobenius, and `|Art_F⁻¹|` takes that Frobenius to `q_v⁻¹`. The dual residual system is `ρ̄^∨` `⊗ |Art_F⁻¹|^{1−2n}`. The local predicate `IsGenericEigenvalues` of AutomorphicGaloisRepresentationsPartII AG2.7 excludes `α_i = q_vα_j` for `i ≠ j` and allows repeated eigenvalues; its `IsStrongGenericEigenvalues` also requires distinct eigenvalues. Its `IsDecomposedGeneric` is the global existence of an all-place split weak-generic witness prime. Residual length at most two is used only on the global trace-and-boundary route.

IG.0.4 defines the full, operator and unitary Hecke algebras. Restriction is an isomorphism only from the operator algebra; IG.0.5 compares its localizations with the full algebra. Each theorem specifies which algebra acts.

For the Satake input to IG.F.15–IG.F.18, let `E` have residue field `𝔽_q`, fix `k = overline(𝔽_q)` with its coefficient embedding, and pull the divisor spaces, Grassmannians and Hecke stacks to `Perf_k`. All leg products and diagonals are relative to `Spd k`, including `(Div¹_E)^∅ = Spd k`. Igusa geometry over a larger algebraically closed characteristic-`p` field uses pullback from this base. Continuous `W_E^I`-descent on the leg base is retained; finite-field Frobenius descent for trace functions is additional data.

The standing settings used in the hypotheses are these.

- **Smooth toroidal setting.** The standing hypotheses of CSnc §§3–4: `p` unramified in `F, N ≥ 3` prime to `p, K = K(N)`, and `Σ` a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); `S = S_K` and `S_k = S ×_ℤ k` for `k` algebraically closed of characteristic `p`.
- **Valued-field fibre setting.** `p` unramified in `F, N ≥ 3` prime to `p, Σ` as in CSnc Remark 2.5.6; `C` a complete algebraically closed nonarchimedean extension of `ℚ_p` with ring of integers `O_C`, residue field `k` and a fixed section `k → O_C/p`.
- **Nearby-cycle setting.** `p` unramified in `F, N ≥ 3` prime to `p, Σ` as in CSnc Remark 2.5.6; `C` complete algebraically closed over `ℚ_p` with residue field `k`; `ℓ ≠ p`; `d = [F⁺:ℚ]n²`.
- **Trace-comparison setting.** The standing assumptions of CSnc §5: `p` unramified in `F`; `F` contains an imaginary quadratic `F₀` in which `p` splits; `F⁺ ≠ ℚ`; a character `ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^×` extending the quadratic character of `F₀/ℚ`; `S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}`; level `N ≥ 3` divisible only by primes in `S^p_f = S_fin ∖ {p}` and by the integer `N₀` of CSnc Remark 5.4.5; `ι_ℓ : ℚ̄_ℓ ≅ ℂ` fixed. Hecke statements in this setting are about `𝕋^S_full`.
- **Boundary tower setting.** `p` unramified in `F`; `X` a `p`-divisible group with `G`-structure over `k` with class `b`; `N ≥ 3` prime to `p`; `ℓ ≠ p`; `Ig^b_∞ = lim_N Ig^b_{K(N)}`, and similarly `Ig^{b,*}_∞` and `Ig^{b,tor}_∞`; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (the colimit over an approximating tower with finite transitions).
- **Global residual-system setting.** `F = F⁺F₀` CM with `F₀` imaginary quadratic and `F⁺ ≠ ℚ`; `G⁰` the quasi-split unitary group of IG.0 with `d = [F⁺:ℚ]n²`; `ℓ` a prime; `S` a finite set of places containing `∞, ℓ`, the primes ramified in `F` and those where `K` is not hyperspecial; `𝔪⁰ ⊂ 𝕋^{0,S}` a maximal ideal in the support of `H^*(X⁰_K, 𝔽_ℓ)`, with `𝔪 = res⁻¹(𝔪⁰) ⊂ 𝕋^S` the corresponding ideal of the operator algebra and `ρ̄_𝔪 = ρ̄_{𝔪⁰} : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ)` its Galois representation.

## Exact supplier contracts

Each input has its stated generality, coefficients and equivariance. In particular, trait exactness does not supply torsion exactness over `O_C`, dimension does not supply an equivariant dualizing object, and a characteristic-zero parameter action does not supply its mod-`ℓ` form.

### From Mathlib (pinned)

Mathlib `6b7abb3`; Tau Ceti `a91d3aa`.

`AlgebraicGeometry.Scheme`, `Scheme.Hom`, `IsAffine`, `IsFinite`, `IsProper`, `ValuationRing`, `PerfectRing`, `WittVector`, the derived categories `DerivedCategory` and localizations. `PerfectRing R p` does not by itself assert characteristic `p`; add `CharP R p`. The small étale topology is `Scheme.smallEtaleTopology`; `AlgebraicGeometry.proetaleTopology` is the big pro-étale topology and `Scheme.ProEt.topology` its small-site counterpart; scheme normalization is `Scheme.Hom.normalization`. The valuative criterion `IsProper.of_valuativeCriterion` needs quasi-compactness, quasi-separatedness and local finite type; neither properness nor finiteness follows from an unrestricted pointwise lifting assertion. For number fields use `NumberField.IsCMField` and `NumberField.maximalRealSubfield`. `Matrix.unitaryGroup` preserves the identity form and is not the split skew-hermitian group used here. Restricted products are `RestrictedProduct` with `RestrictedProduct.coeMonoidHom`; double cosets, `HeckeCoset` and `HeckeRing` are Mathlib's.

### From Tau Ceti (pinned)

The convolution ring structure `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean`) on `HeckeRing Δ H R` for a Hecke triple, and the anti-involution formalism `HeckeAntiInvolution`, `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset` and `HeckeCosetModule.mul_comm_of_antiInvolution` (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`). `TauCeti.ReductiveAffineGroupSchemeCat` (`TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean`) is the category of reductive groups over a field; it supplies the reductive generic fibre, not an integral model over `ℤ`. Local spherical commutativity is a theorem about the chosen datum. The Witt inputs are `WittVector.isAdicComplete_span_p_teichmuller` and `TauCeti.WittVector.completeSpace_and_t2Space_adicTopology_span_p_teichmuller` (`TauCeti/RingTheory/WittVector/Complete.lean`), with `TauCeti.Huber.WittVector.isHuberRing_adicTopology_span_p_teichmuller` (`TauCeti/RingTheory/Huber/WittVector.lean`). For the local nonzero scalar use Mathlib `Nat.cast_ne_zero` and `Nat.Prime.ne_zero`; no separate nonvanishing theory is needed.

### From roadmaps

- **AdelicAlgebraicGroups.** Layer 1 (adelic points as restricted products, with their integral subgroups) for the spherical datum of IG.0, and Layer 4 for the Hasse principle used in IG.0 (Hasse principle for `G`).
- **SmoothRepresentationsOfLocalGroups.** SR.0 (smooth representations; exact invariants of compact open subgroups whose pro-order is invertible in the coefficients, with that hypothesis explicit). SR.0d (the derived smooth category, derived invariants, derived tensor products, and derived smooth duality with biduality for admissible complexes, SR.0d.2). SR.1 (Hecke algebras over rings: the double-coset ring, the anti-involution `[UgU] ↦ [Ug⁻¹U]` of SR.1.2, and the equivalence of SR.1.3 between smooth representations and nondegenerate modules over the convolution algebra for a fixed Haar measure). SR.2 (unnormalized smooth and compact induction, inflation from a Levi, Frobenius reciprocity, for locally profinite groups such as `J_b(ℚ_p) × G(𝔸_f^p)`). SR.4 (the spherical Hecke algebra of `GL_n` and of unramified unitary groups, its commutativity and the Satake isomorphism). SR.6.1–SR.6.3 supply the finite-wild crossed-cocycle parameter schemes, invariant algebra and algebraic excursion relations; IG.F.18–IG.F.22 supply their geometric action and comparisons.
- **IntegralHeckeAndGaloisDeterminants.** Layer 0 (determinants as multiplicative polynomial laws), Layer 1 (Cayley–Hamilton algebras and reconstruction of semisimple representations from determinants), Layer 3a (the `GL_n` Hecke polynomial and its geometric-Frobenius convention) and Layer 4 (interpolation of determinants over integral coefficient rings), for the torsion Galois arguments of IG.5 and IG.6.
- **ClassFieldTheory.** Layer 11: the global Artin map of `F` and its geometric normalization (the composite with inversion, sending uniformizers to geometric Frobenius), used for the twist `|Art_F⁻¹|^{1−2n}` of the dual Hecke ideal. Layer 5: for a finite extension `L/ℚ_p` and finite `l`-primary continuous `G_L`-modules `M` with `l ≠ p`, finiteness of `H⁰, H¹, H²`, the local Euler characteristic formula and local Tate duality, giving `dim H¹(G_L, M) = dim H⁰(G_L, M) + dim H²(G_L, M)`; in particular `H¹(G_L, χ_λ) = 0` for the unramified mod-`l` character with arithmetic Frobenius eigenvalue `λ ∉ {1, q_L}`, compatibly with finite coefficient extension. This is the obstruction-vanishing input to IG.5 (splitting generic local lifts).

### Geometric and arithmetic roadmap inputs

- **PELModuli M0–M3.** Integral PEL data and their local unramified scalar extensions (finite étale `ℤ_p`-orders, decomposition of `B` into matrix algebras over unramified fields, maximal orders, and the equivalence between a `B`-linear isotropic weight-`(0, 1)` projector `P` and the cocharacter `μ(t) = (1 − P) + tP` with `c ∘ μ = id`; CS17 §4.2, pp. 696–697), the moduli problem, the smooth integral model with hyperspecial level, and complex uniformization.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6.** `p`-divisible groups, quotients by finite locally free subgroups over complete mixed-characteristic DVRs (R07.1.20a); the universal cover `X̃ = lim_{×p} X` over a ring on which `p` is nilpotent, its invariance under isogeny, its rigidity under nilpotent thickenings and its representability over perfect bases (CS17 Proposition 4.1.2), and quasi-isogenies as isomorphisms of universal covers; Dieudonné theory, the Dieudonné–Manin classification of isocrystals over `𝔽̄_p`, and the adapter from positive Dieudonné slopes to the covariant `[−1, 0]` normalization used here; Scholze–Weinstein's Theorem A (on an `f`-semiperfect ring such as `O_C/p`, the Dieudonné functor on `p`-divisible groups up to isogeny is fully faithful into `φ`-modules over `B⁺_cris`); the integral Dieudonné equivalence over perfect fields, with exactness and Cartier duality (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.10), and Illusie deformation theory. The simultaneous integral PEL representative is constructed in IG.0.18a below; it is not an application of rational Dieudonné–Manin classification alone.
- **AbelianSchemesAndArithmeticModuli A4.9.** The arbitrary-ring Serre–Tate equivalence `serreTate`: for a nilpotent thickening `S → S′` on which `p` is nilpotent, abelian schemes over `S′` with endomorphisms and polarization correspond to triples `(A_S, 𝒢_{S′}, A_S[p^∞] ≅ 𝒢 ×_{S′} S)`. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.26 (`universalCoverRigidity`) supplies the arbitrary-ring equivalence on `p`-divisible groups up to isogeny. IG.0.26 owns the semi-abelian extension and its structure compatibility.
- **SchemeAndStackFoundations §§1.1, 2.23, 4.7–4.8.** Finite equivariant sheaves and descent, formal schemes, completion and henselian étale invariance in the supplier's stated finiteness range. The perfect Witt extension is IG.3.11/IG.3.15; geometric finite/profinite tower descent with nearby cycles and both level directions is IG.4.0b.
- **AdicSpacesPartII R0; AdicSpacesPartIII F0, R2, R3.5; AdicSpacesPartIV R5; AdicEtaleGeometry A1; PerfectoidSpaces P0–P2, P7; DiamondsAndVStacks D5.** Analytic adic spaces, adic generic fibres of formal schemes over possibly nonnoetherian valuation bases, perfectoid spaces and tilting, preperfectoid spaces and strong completions, diamonds; and the criterion that a map of qcqs diamonds which is bijective on `(C, C⁺)`-points for every complete algebraically closed `C` and every allowed `C⁺` is an isomorphism (Scholze, Étale cohomology of diamonds, Lemma 11.11).
- **ClassicalAdicEtaleCohomology Layers 1, 4–6; DiamondEtaleCohomology C0, C4, C8; DiamondSixOperations S1–S4.** Étale cohomology, overconvergence, canonical compactifications of separated diamonds and their universal property, dimension and representable six operations. ClassicalAdicEtaleCohomology §§4.4–4.5 give the microbial valuation formal–adic comparison with its actual exchange maps; §§5.4 and 6.2–6.3 give valuation nearby base change, constructibility, proper comparison and prime-to-`p` valuation invariance. DiamondSixOperations supplies the support triangle `i_*Ri^!→id→Rj_*j^*`, with `i_*` left adjoint to `Ri^!`, and smooth base change for eligible representable separated cohomologically smooth maps. The Artin-stack extension, full positive-kernel quotient, geometric torsor coinvariants and orientation comparison are IG.F.10–IG.F.14; they are not additional supplier contracts.
- **EtaleCohomologyFoundations §§F.0–F.3, F.5–F.6, F.8; EtaleDualityAndPerverseSheaves §§0.5–0.6, 2.4–2.11.** Scheme étale cohomology and compact support, duality, affine Artin vanishing, finite-type perversity, finite pushforward and its stalk/costalk criteria. Uniform two-level colimits and nonfinite integral pushforward are proved for the Igusa model systems in IG.4.0c, using the pulled-back dimension function. They are not assumed to be in the supplier's constructible finite-type category.
- **LefschetzPencilsAndVanishingCycles LPV.0, LPV.6.** Finite-coefficient perverse `t`-exactness over henselian traits (§6.2) and the conditional uniform filtered-colimit criterion (§6.5). IG.4.0a extends exactness to eligible `O_C` valuation models and IG.4.0c verifies the uniform criterion for the two towers. IG.4.0d supplies the separate ordinary-support derived inverse limit. Illusie's rational Corollary 4.5 is not treated as the torsion `O_C` theorem.
- **AdicCoefficientsAndComparisons L5.** The normal-crossing comparison and branch Kummer generators with their cup-product and residue signs. IG.4.6 applies them to the `ℓ`-power tame tower.
- **PadicHodgeTheory §2.7.** The proper smooth relative primitive comparison and constant-coefficient singular proper extension. IG.3.24 supplies the proper Stein-map application: for the proper toroidal-to-minimal Stein factorization maps of rigid spaces over `C` at finite level, `O⁺ᵃ/p^n → π_*O⁺ᵃ/p^n` is an almost isomorphism when `ℤ/p^n → π_*ℤ/p^n` is an isomorphism.
- **PerfectoidShimuraVarieties Layers 0–4, 6.** Perfectoid Shimura varieties at infinite level at `p` and their minimal and toroidal compactifications, the Hodge–Tate period map `π_HT` and its boundary behaviour, and the flag variety `Fℓ`.
- **HodgeTateAndCanonicalSubgroups §§0.14–0.16, 0.28, 1.2, 1.4, 2.4–2.8.** The general-base quotient by a finite locally free subgroup of the `p`-torsion and its torsion-level identities (§0.28); the `BT₁` Hasse section `det(V)` of the Hodge line to power `p−1`, the Hodge–Tate sequence and its agreement for an abelian variety and its `p`-divisible group (CS17 Remark 4.2.8). The complete integral Scholze–Weinstein equivalence and its PEL tensor transport are IG.F.8.
- **ShimuraCompactifications C0–C5; NeronModelsAndSemistableAbelianVarieties §3.13.** Cusp labels, toroidal and minimal compactifications of `S_K` with their stratifications and formal boundary charts `Ξ_{Z,Σ_Z}`, the splitting of `Z_N`, and Raynaud extensions of degenerating abelian varieties.
- **ArithmeticLocallySymmetricSpaces ALS.0–ALS.2, ALS.4–ALS.6.** Locally symmetric spaces of `GL_r(F)` and unitary groups, the Borel–Serre compactification and its boundary strata, finite-level Poincaré duality, the unnormalized Satake transform `r_M ∘ r_P`, and the boundary exact sequences with integral coefficients and local systems.
- **ArithmeticGaloisDuality R02.4, D7.** Global duality and the derived local duality used with integral coefficients.
- **PadicHodgeTheory §5.5; EndoscopicTransferAndUnitaryTraceComparison §§7.2–7.10.** PadicHodgeTheory owns `sigmaConjugacy`, `B(G)`, the tensor Newton cocharacter, `kottwitzInvariant` and admissibility. EndoscopicTransferAndUnitaryTraceComparison extends that invariant carrier with tensor-isocrystal classification (§7.2), the PEL sign and invariant maps (§7.4), decent representatives, Newton Levi and `J_b` (§7.5), structured Dieudonné comparison (§7.6), central leaves and complete slope divisibility (§7.7), the liftable finite Igusa covers with one common multiplier, deck kernels and transitions, including level zero (§7.8), the level-loss monoid (§7.9), and the perfect isomorphism torsor, perfection map, inversion/action dictionary and rational cohomology (§§7.3, 7.10). At good prime, identify IG.0.9's special fibre with `IgusaPELModel.specialFibre` through their representing PEL functors and universal structured `p`-divisible groups. The two quotient conventions `b′=g⁻¹bσ(g)` and `b′=h b σ(h)⁻¹` agree by `h=g⁻¹`; transport the invariant maps through this quotient identification. Thus `KottwitzSet` and its invariant APIs in IG.0.1–IG.0.2 alias the minimal carrier and its supplied maps; `JGroup` aliases the supplied `J_b`. `centralLeaf`, `IsCompletelySlopeDivisible`, `Igusa`, `MantovanIgusa` and `perfectionOfMantovan` in IG.0.17–IG.1.4 denote those supplied objects and maps, with `ρ_i=j_i⁻¹` for the finite frames. Extend their theory on these carriers, rather than constructing independent spaces. In particular, the rationalization of IG.1.7 and its alternating class IG.1.8 identify equivariantly with the supplied rational object, via the same perfection pullback and inverse-action convention.
- **EndoscopicTransferAndUnitaryTraceComparison Layers 6, 8, 10, 14.** For `𝒢_n⃗ = (Res_{F₀/ℚ}𝔾_m × Res_{F/ℚ}GL_n⃗)` ⋊ `{1, θ}`: the stabilized twisted trace formula with no proper cuspidal subsets when `[F⁺:ℚ] ≥ 2`, base-change transfers and the level `N₀` (§§6.6–6.25; CSnc §§5.2–5.5); Shin's stable trace formula for Igusa varieties with no `ker¹` factor (§§8.21–8.22; Shin `2010` Theorem 7.2, CSnc Theorem 5.3.2); local Langlands for `GL_m` and its inner forms with full Weil–Deligne parameters (Badulescu's Jacquet–Langlands), the semisimple parameters of CSnc Remark 5.1.1, and the nontransfer of generic principal series to nontrivial inner forms of Levi subgroups (§§10.3, 10.26–10.32; CS17 Lemma 5.4.3); the rational Igusa trace comparison with the `Red^b` normalization (`δ̄^{1/2}_{P(ν_b)}` applied once) and `Ξ(φ_n⃗)`-cohomologicality (§§14.1–14.7; CSnc Theorem 5.6.1, Lemma 5.6.2).
- **AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7.** AG2.7 owns the unit-valued local predicates `IsGenericEigenvalues` and `IsStrongGenericEigenvalues`, their scaling, permutation and inversion APIs, and the distinct global existential predicate `IsDecomposedGeneric`. Galois representations attached to regular algebraic cuspidal and isobaric automorphic representations of `GL_m` over CM fields, with local–global compatibility at unramified places, and the decomposed-genericity predicate of a residual representation (AG2.7) with infinitely many witness primes avoiding any finite set.
- **TorsionCohomologyInfrastructure Layers 2–4.** Sections `3b`.2, 4.3 and 4.6 construct the finite-level torsion `GL_r` determinant and residual representation for a CM field containing an imaginary quadratic field, with `S` pulled back from rational primes containing all primes ramified in `F/ℚ`. The nilpotent ideal has a bound independent of level. IG.6.6a converts its Hecke polynomial and cyclotomic normalization; IG.6.7 and IG.7.7 supply the unitary boundary applications. The unitary Pink formula is IG.6.5.

### Additional inputs for IG.F

- **AdicSpaces, Layer 6.** The existing `ℚ_p` period annuli, curve seed and diamond quotient. EndoscopicTransferAndUnitaryTraceComparison §12.1 extends that seed to finite `E/ℚ_p`, ramified Witt annuli, `q`-Frobenius, constant isocrystal bundles and primitive Cartier untilts. IG.F.1 adds the divisor parameter and Frobenius-transport interface; IG.F.2 onward supplies general bundle descent.
- **AlgebraicVectorBundles L0A–L0C, L2B; ReductiveGroups Layers 0–1, 3–8; LocalGaloisGroups Layer 0.** Finite locally free algebraic bundles, determinants, tensor operations and algebraic descent; connected reductive groups, representations, parabolics and root data; the local Galois carrier. ReductiveGroupsPartII RG2.0.4 supplies the completed maximal unramified extension. Analytic Fargues–Fontaine descent is IG.F.2.
- **PadicHodgeTheory §§7.5–7.6.** For unramified `E=ℚ_{p^d}`, the chartwise Proj/adic curve, finite-projective patching and equivalences between Frobenius modules, bundles and B-pairs (§7.5); the all-module derived comparison `relativePeriodDerivedComparison`, including restriction, radius refinement, hypercover descent, cups, twists and boundary maps (§7.6). Its differential `ϕ^d−1` becomes `1−ϕ^d` through the chain isomorphism equal to `id` in degree `0` and `−id` in degree `1`. IG.F.2 owns the ramified extension and effective `v`-descent; IG.F.11 transports linear patching to general `G` and constructs the geometric modification and Schubert interfaces.
- **EnhancedDerivedSheaves E0–E5.** Stable presentable enhancements, coherent adjunctions, tensor operations, descent and derived limits, with E5:abstract used for monoidal coherence. These are the categorical bases of the Artin and solid coefficient extensions.
- **GeometricSatakeAndFusion GS0–GS4.** GS0 supplies ordered Beilinson–Drinfeld Grassmannians, bounded Hecke stacks and Schubert geometry; GS1–GS2 supply relative perversity, flat ULA Satake objects, weight functors and convolution. GS3 supplies diagonal extension, corrected fusion and Weil realization over `Perf_k`, `k = overline(𝔽_q)`; GS4 supplies reconstruction of the pinned dual group, the normalized relative equivalence and its geometric-fibre restriction, coefficient change and the inner Cartan correction. IG.F.15–IG.F.16 use aliases of this package: `satakeCategory`, `heckeConvolution`, `fusionProduct`, `drinfeldFibreRealization`, `normalizedSatakeEquivalence` and `chevalleyInvolution`, with their full finite-set and coefficient comparisons. GS4's `perfectSatakeFunctor` supplies the perfect-representation extension used by IG.F.18. The geometric Hecke action on the Igusa cohomology factors and its torsion-concentration consequences are owned here.
- **EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.1–12.22.** Strict `O`-module Drinfeld deformation rings and regular finite level maps (§10.2); the precise curve seed above; basic formal `O_E`/special `O_D` towers, period maps, universal covers, Weil descent, perfectoid limits and the basic modification functor (§§12.3–12.9); their actual basic tower/Hecke comparison and supercuspidal cohomology, with both action orientations, middle shift and half twist (§§12.17–12.22). These classical targets are imported; IG.F.19 extends the geometric moduli to general `b` and several legs, and IG.F.22a compares the geometric excursion parameter with the classical realization.

### Family quotients by sub-`p`-divisible groups

**Quotients by sub-Barsotti–Tate groups (owned here).** Let `p` be a prime, `S` any scheme, and `H ↪ G` a homomorphism of `p`-divisible groups over `S` whose maps `H[p^r] → G[p^r]` are closed immersions for all `r ≥ 1`. Prove that the fppf quotient `Q = G/H` is a `p`-divisible group, with exact sequences `0 → H → G → Q → 0` and `0 → H[p^r] → G[p^r] → Q[p^r] → 0`. Its formation and these sequences commute with arbitrary base change `S′ → S`, including nonflat base change. The locally constant heights satisfy `ht G = ht H + ht Q`. The quotient is functorial for commutative squares of such inclusions.

The finite locally free quotients `Q_r = G[p^r]/H[p^r]` have rank `p^{r(ht G − ht H)}`. Their transition maps define `Q`; divisibility of `H` identifies `Q_r` with `Q[p^r]` and proves the displayed level exactness. This construction uses neither a perfect base nor nilpotence of `p`.

Source: [Stacks, Proposition 39.23.9, Tag 03BM](https://stacks.math.columbia.edu/tag/03BM), applied over affine opens of `S` to translation by `H[p^r]` on `G[p^r]`; descent and the torsion-level exact sequences give the stated family quotient.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.5–R07.1.6 (torsion levels and divisibility); ModularCurves Layer 0C (finite locally free fppf quotients and descent).

**Checks.**

- For `H = 0`, the quotient is `G`; for `H = G`, it is the height-zero group. The level sequences and height identity include both endpoints.
- Over any `S`, for `G = μ_{p^∞} ⊕ (ℚ_p/ℤ_p)_S` and `H = μ_{p^∞}`, the quotient is `(ℚ_p/ℤ_p)_S`, with heights `2 = 1 + 1` and level quotient `G[p^r]/μ_{p^r} = (ℤ/p^r)_S`.
- Pulling this split family back along the nonflat closed immersion `Spec 𝔽_p → Spec 𝔽_p[ε]/(ε²)` preserves the quotient and every level exact sequence, without any reducedness hypothesis on the original base.
- The finite subgroup `μ_p ⊂ μ_{p^∞}` is not a sub-`p`-divisible group. Its quotient has height one, as does the source; subtracting a supposed positive height of `μ_p` would be incorrect. This is the finite-subgroup quotient supplied by HodgeTateAndCanonicalSubgroups §0.28.

## How to read the build

In a *Needs* line, IG.`k` means the preceding targets of that layer in the displayed build order; references to other layers mean their stated interfaces. Supplier contracts include the full hypotheses listed above. IG.0.2a follows IG.0.2; IG.0.17–IG.0.18a follow IG.0.11, before IG.0.12; IG.0.26–IG.0.27 precede IG.0.22. IG.0.25 proves the leaf dimension, and IG.1.4a proves the Igusa dimension after the towers and their perfection comparison. IG.4.0c has the phase order specified there; IG.4.0d follows IG.4.7 and precedes IG.4.8, using IG.4.3's models and IG.4.7's bound.

IG.0–IG.2 construct the special-fibre geometry; IG.F supplies the curve and coefficient interfaces. IG.3 identifies compactified period fibres. IG.4 proves the two degree bounds, IG.5 the trace-formula ordinary criterion, and IG.6 the boundary obstruction. IG.7 assembles the trace-and-boundary route, then the local spectral route, whose global conclusion requires neither `F⁺ ≠ ℚ` nor residual length at most two.

## Layer IG.0: Unitary data, Hecke algebras, `p`-divisible groups and central leaves

### IG.0.1 Isocrystals with `G`-structure and the set `B(G)`

<a id="ig-0-isocrystals-and-kottwitz-set"></a>

Let `G` be a connected reductive group over `ℚ_p, L = W(𝔽̄_p)[1/p]` and `σ` the Frobenius of `L`. Use `KottwitzSet G` as an alias of PadicHodgeTheory §5.5's `B(G)`, with the tensor and automorphism interfaces of EndoscopicTransferAndUnitaryTraceComparison §§7.2, 7.5. It is the set of `σ`-conjugacy classes of `G(L)`, where `h` acts by `g ↦ hgσ(h)⁻¹`. An isocrystal over `𝔽̄_p` is a finite-dimensional `L`-vector space with a `σ`-linear automorphism; an isocrystal with `G`-structure is an exact tensor functor from `Rep_{ℚ_p}G` to isocrystals, and `b ↦ (V ↦ (V ⊗ L, b σ))` identifies `B(G)` with isomorphism classes of isocrystals with `G`-structure. For `G = GL_n` this is `b ↦ (L^n, bσ)`, and the Dieudonné–Manin classification identifies `B(GL_n)` with Newton polygons: rational slopes `λ` with multiplicities `m_λ ≥ 0` such that `m_λλ ∈ ℤ` and `Σ m_λ = n`. For `b ∈ G(L)` use the supplied algebraic group `J_b` over `ℚ_p` by `J_b(R) = {g ∈ G(L ⊗_{ℚ_p} R) : g b σ(g)⁻¹ = b}`; `J_b(ℚ_p)` is the automorphism group of the isocrystal with `G`-structure of `b`, and `J_b` depends on `b` only up to isomorphism within its class. For a `p`-divisible group `X` with extra structure over `𝔽̄_p, J_b(ℚ_p)` is the group of self-quasi-isogenies of `X` respecting the extra structure.

Here `G` is connected reductive over `ℚ_p`; the identification with self-quasi-isogenies is for the PEL data of type `(A)` or `(C)` of IG.0.

([CS17](#ref-cs17), §3.1, Definition 3.1.1, pp. 675–676. The Newton Levi and inner-form comparison are IG.0.2a.)

The following API names are specialization aliases of the supplied quotient, `GIsocrystal` and `Jb` interfaces:

- `KottwitzSet`: `B(G)` as the quotient of `G(L)` by `σ`-conjugation.
- `KottwitzSet.equivIsocrystal`: The bijection with isomorphism classes of isocrystals with `G`-structure.
- `KottwitzSet.glEquivNewtonPolygon`: For `GL_n`, the Dieudonné–Manin bijection with Newton polygons.
- `KottwitzSet.map`: Functoriality for homomorphisms of reductive groups, and `B(G₁ × G₂) = B(G₁) × B(G₂)`.
- `JGroup`: The `σ`-centralizer `J_b`, with `JGroup.equivAutIsocrystal`. Its inner-form comparison is constructed in IG.0.2a after the Newton map.

*Needs:* PadicHodgeTheory §5.5; EndoscopicTransferAndUnitaryTraceComparison §§7.2, 7.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (Dieudonné–Manin); ReductiveGroupsPartII (reductive groups over `ℚ_p` and Levi subgroups); Mathlib `WittVector`.

**Checks.**

- For `G = 𝔾_m, B(G) ≅ ℤ` by `b ↦ val_p(b)`, and `J_b = 𝔾_m` for every `b`.
- For `G = GL_2` the classes with Newton slopes `{0, 1}` and `{1/2, 1/2}` are distinct, and `{1/2, 0}` is not a Newton polygon of an isocrystal of height `2` (the slope `1/2` needs even multiplicity).
- For `b = diag(1, p)` in `GL_2` (slopes `0` and `1`), `J_b(ℚ_p) = ℚ_p^× × ℚ_p^×`; for `b` basic of slope `1/2, J_b(ℚ_p) = D^×, D` the quaternion division algebra over `ℚ_p`, which is not split.
- `J_b(ℚ_p)` is not the centralizer of `b` in `G(L)`: for `b = p ∈ GL_1(L)` the centralizer is `L^×`, while `J_b(ℚ_p) = ℚ_p^×`.

### IG.0.2 The Newton and Kottwitz maps, the order and `B(G, μ)`

<a id="ig-0-newton-kottwitz-admissible"></a>

Let `G` be connected reductive over `ℚ_p`, with a maximal torus `T` and a Borel subgroup over `ℚ̄_p` fixed, cocharacter lattice `X_*(T)` and Galois group `Γ = Gal(ℚ̄_p/ℚ_p)`, acting through the based root datum (the star action). Use the supplied Newton map `ν : B(G) → (X_*(T) ⊗ ℚ)^Γ_dom`, sending `b` to the conjugacy class of its slope homomorphism (for `GL_n`, the slope decomposition), and the supplied Kottwitz map `κ : B(G) → π₁(G)_Γ`, the unique natural transformation on connected reductive groups normalized by `b ↦ val_p(det b)` for `GL_n`. The two are compatible in `π₁(G)_Γ ⊗ ℚ`, and `(ν, κ) : B(G) → (X_*(T) ⊗ ℚ)^Γ_dom × π₁(G)_Γ` is injective. Order dominant rational cocharacters by `ν ≼ ν′` when `ν′ − ν` is a nonnegative rational combination of positive coroots, and `B(G)` by `b ≼ b′` when `ν_b ≼ ν_{b′}` and `κ(b) = κ(b′)`. For a conjugacy class `μ` of cocharacters with Galois average `μ̄` of its dominant representative and image `μ^♭` `∈ π₁(G)_Γ`, the set of `μ`-admissible classes is `B(G, μ) = {b : ν_b ≼ μ̄, κ(b) = μ^♭}`. An element is basic when `ν_b` is central. Put `d_b = ⟨2ρ, ν_b⟩`. For the unitary datum of IG.0.3 at a prime `p` that splits completely in `F, G_{ℚ_p} ≅ ∏_{w|𝔭} GL_{2n}(ℚ_p) × 𝔾_m` (`𝔭` the prime of `F₀` chosen above `p`), and `B(G_{ℚ_p}, μ⁻¹)` consists of the tuples `(ν_w)_w` of Newton vectors of height `2n` with `ν_w` dominated by the component `μ⁻¹_w` (in particular of the same total slope), together with the similitude component fixed by `μ`; its unique maximal element is the ordinary class `ν_w = μ⁻¹_w` for every `w`, and `d_b = d` exactly for the ordinary class, because `⟨2ρ, ·⟩` is strictly positive on nonzero sums of positive coroots.

Here `G` is connected reductive over `ℚ_p` and `μ` is arbitrary (minuscule in all applications).

([CS17](#ref-cs17), §3.1, pp. 676–677, Definition 3.1.2, p. 677, recalling Kottwitz `1985` and Rapoport–Richartz `1996`, Theorem 1.15; [CSnc](#ref-csnc), §2.7, p. 33 for the ordinary class and `d_b`.)

The invariant and admissibility names below alias PadicHodgeTheory §5.5 and EndoscopicTransferAndUnitaryTraceComparison §7.4. The split `GL_n` coordinates and the unitary dimension and ordinary-class consequences specialize that interface.

The API:

- `KottwitzSet.newton`: The Newton map `ν`, constant on `σ`-conjugacy classes.
- `KottwitzSet.kottwitz`: The Kottwitz map `κ`, natural in `G`.
- `KottwitzSet.newton_kottwitz_injective`: Injectivity of `(ν, κ)`.
- `KottwitzSet.instPartialOrder`: The order `b ≼ b′`.
- `KottwitzSet.admissible`: `B(G, μ)`, with `KottwitzSet.admissible_finite`.
- `KottwitzSet.IsBasic`, `KottwitzSet.dim` `(d_b = ⟨2ρ, ν_b⟩)` and `KottwitzSet.ordinary` for the unitary datum.
- For `GL_n`, already statable at the pins: `NewtonVector` (decreasing slopes with integral multiplicity-weighted slopes), `pairingTwoRho` `(⟨2ρ, ν⟩)`, `DominatedBy` (the dominance order), `IsAdmissible` `(B(GL_n, μ))`, `admissible_finite` (finiteness for every integral cocharacter), `pairingTwoRho_dominance` (dominance bounds the pairing, with equality exactly for equal vectors), `admissible_gl2_eq` (the first check below) and `not_exists_newtonVector_half_zero` (the multiplicity obstruction in IG.0.1).

*Needs:* IG.0; PadicHodgeTheory §5.5; EndoscopicTransferAndUnitaryTraceComparison §7.4; ReductiveGroupsPartII (root data, coroots and `π₁` of reductive groups over `ℚ_p`).

**Checks.**

- For `GL_2` and `μ = (1, 0), B(GL_2, μ)` has exactly two elements, the ordinary class (slopes `1, 0`) and the basic class (slopes `1/2, 1/2`), and the basic class is the smaller one.
- For `GL_n, κ(b) = val_p(det b)` is the total slope: `b = diag(1, p)` has `κ = 1`, the value of `μ = (1, 0)`, while `b = 1` has `κ = 0` and is not `(1, 0)`-admissible. For `GL_n` the order condition already forces equal `κ`; for a group with torsion in `π₁(G)_Γ`, such as a nonsplit torus, `κ` carries information that `ν` does not.
- For imaginary quadratic `F` and `n = 1` with `p` split, `B(G_{ℚ_p}, μ⁻¹)` has two elements, ordinary with `d_b = 1` and basic with `d_b = 0`.
- For `GL_4` with `μ = (1, 1, 0, 0)`, the ordinary class has `⟨2ρ, ν⟩ = 4 = ⟨2ρ, μ⟩` and the basic class (slopes `1/2` four times) has `⟨2ρ, ν⟩ = 0`.

- Every Newton vector is dominated by itself; unequal total slopes fail dominance, including `(0)` versus `(1)`. The empty vector is admissible for the empty cocharacter. The empty `GL_0` vector has `⟨2ρ,ν⟩ = 0`. In the negative Shimura convention the dominant ordinary `GL_2` vector is `(0,−1)`, with `⟨2ρ,ν⟩ = 1`; the unsorted vector `(−1,0)` gives `−1` and is not dominant.

### IG.0.2a Newton Levi subgroups and inner forms

<a id="ig-0-newton-levi-inner-form"></a>

Let `G` be connected reductive over `ℚ_p` and `b ∈ B(G)`. If `G` is quasi-split, choose a decent representative whose Newton cocharacter is defined over `ℚ_p`. Its centralizer `M_b` is a `ℚ_p`-rational Levi subgroup of `G`; the representative is basic in `M_b`, and `J_b` is an inner form of `M_b`. For general `G`, use the dominant Newton class in the common based root datum to form the Newton Levi `M_b^*` in the quasi-split inner form `G^*`. Then `J_b` is an inner form of `M_b^*`; this does not identify a rational Levi subgroup of `G`.

The API: `JGroup.isInnerForm` uses EndoscopicTransferAndUnitaryTraceComparison §7.5's `Jb.innerNewtonLevi` when `G` is quasi-split and extends it to `G^*` in general. It gives the comparison with `M_b^*`, specializing to the Newton Levi in `G` under the quasi-split hypothesis.

Source: [CS17](#ref-cs17), §5.4, pp.738–739, explicitly using quasi-splitness to make the Newton cocharacter rational, following Kottwitz 1985, §4.3, p.219, and Rapoport–Zink 1996, Chapter 1. The general case uses inner twisting of the same Newton centralizer. *Needs:* IG.0.1–IG.0.2; EndoscopicTransferAndUnitaryTraceComparison §7.5; ReductiveGroupsPartII (based root data, inner forms and rational Levi subgroups).

**Checks.**

- For `G=GL₂` and slopes `(1,0)`, `M_b=𝔾_m²` and `J_b=M_b`.
- For basic slope `1/2` in `GL₂`, `M_b=GL₂` and `J_b=D^×` for the quaternion division algebra `D/ℚ_p`; the comparison is an inner form, not an isomorphism.
- For `G=D^×`, identify `G_L` with `GL₂,L` with descent Frobenius `σ_G=Ad(Π)σ`, `Π=[[0,p],[1,0]]`. Take `b=diag(1,p)Π⁻¹`. The equation for `J_b` becomes `g diag(1,p)=diag(1,p)σ(g)`, giving `J_b=𝔾_m²`. The group `D^×` has no proper rational Levi; here the Newton Levi lies in `G^*=GL₂`.

### IG.0.3 Quasi-split unitary similitude data

<a id="ig-0-quasi-split-unitary-datum"></a>

Fix a CM field `F` with maximal totally real subfield `F⁺` and an integer `n ≥ 1`. Let `V = F^{2n}` with the skew-hermitian form `⟨x, y⟩ = Σ_{i=1}^{n} (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i)` and the alternating form `(x, y) = tr_{F/ℚ}⟨x, y⟩`, and fix an `O_F`-lattice `L ⊂ V` that is self-dual for `(·,·)` (for example `L = O_F^n ⊕ 𝔡^{−1,n}, 𝔡^{−1}` the inverse different). The unitary similitude group is the group scheme `G` over `ℤ` with `G(R) = {(g, c) ∈ GL_{O_F}(L)(R) × 𝔾_m(R) : (gv, gw) = c(v, w) for all v, w ∈ L}`, and the unitary group is `G⁰ = ker(c : G → 𝔾_m)`. The symmetric space of `G(ℝ)` is `X = ∏_{τ:F⁺↪ℝ} X_{τ,+} ⊔ ∏_τ X_{τ,−}`, with `X_{τ,±}` the positive (negative) definite `n`-dimensional subspaces of `V ⊗_{F⁺,τ} ℝ ≅ ℂ^{2n}`, and `X⁰ = ∏_τ X_{τ,+}`. For a neat compact open `K ⊂ G(𝔸_f), X_K = G(ℚ) ∖ (X × G(𝔸_f)/K)` is a real manifold of dimension `2d` with `d = [F⁺:ℚ]n²`; `X⁰_{K⁰}` is defined in the same way for `G⁰`. For `N ≥ 3, K(N) = {g ∈ G(ℤ̂) : g ≡ 1 mod N}`. Its spherical Hecke algebras are fixed in IG.0.4.

For a commutative `ℚ`-algebra `R` the points are `G(R) = {(g, c) ∈ GL_{2n}(F ⊗_ℚ R) × R^× : gᵀ J ḡ = c J}`, where `J` is the matrix of `⟨·,·⟩` (antidiagonal, with entries `1` above and `−1` below the antidiagonal midpoint) and `ḡ` applies complex conjugation of `F`; preserving the alternating form up to `c` is equivalent to preserving `⟨·,·⟩` up to `c` because the trace form of `F/ℚ` is nondegenerate. The similitude character is `(g, c) ↦ c`.

Bundle `F, n` and `L` as `UnitarySimilitudeDatum`; require `K` neat (`K(N)` with `N ≥ 3` is neat).

([CSnc](#ref-csnc), §2.1, p. 11.)

The API:

- `UnitarySimilitudeDatum.group`: `G` over `ℤ` and its similitude character `c`.
- `UnitarySimilitudeDatum.unitaryGroup`: The closed kernel `G⁰=ker c`.
- `UnitarySimilitudeDatum.locallySymmetricSpace`: The neat-level real double quotient `X_K`.
- `UnitarySimilitudeDatum.dim_locallySymmetricSpace`: Its real dimension `2d`.
- `UnitarySimilitudeDatum.similitudeGroup`: The points `G(R)` over a commutative `ℚ`-algebra `R` as pairs `(g, c)` with `gᵀJḡ = cJ`, and `UnitarySimilitudeDatum.similitude`; the matrix is `skewHermMatrix`, with `splitTracePairing`, its skew-symmetry theorem `splitTracePairing_skew`, and `UnitarySimilitudeDatum.dim`. The point-group target `similitudeGroup` has signature `similitudeGroup A σ n : Subgroup (GL (Fin (2*n)) A × Aˣ)` with the displayed defining equation and `σ c = c`; `σ` is an involutive ring automorphism. Its character `similitude` is second projection and `unitaryGroup` is its kernel. The theorem `exists_similitudeGroup` characterizes the unique subgroup of `GL (Fin (2*n)) A × Aˣ` by this equation and the fixed-similitude condition, for a commutative ring `A` and an involutive ring automorphism `σ`. The theorem gives the point-group characterization over the existing matrix carrier.
- `UnitarySimilitudeDatum.toPELDatum`: The PELModuli M0 datum `(F,*,V,(·,·),L)`.

*Needs:* PELModuli M0; Tau Ceti `TauCeti.ReductiveAffineGroupSchemeCat`; Mathlib `NumberField.IsCMField`, `NumberField.maximalRealSubfield`, `Matrix.GeneralLinearGroup`; Mathlib `Matrix.unitaryGroup` (only as the non-example below).

**Checks.**

- For `F` imaginary quadratic and `n = 1` the space `X_{K(N)}` has real dimension `2 (d = 1)`.
- The lattice `O_F^n ⊕ 𝔡^{−1,n}` is self-dual for `(x, y) = tr⟨x, y⟩`.
- `G⁰(ℚ) ≠ G(ℚ)`: the scalar `2 ∈ ℚ^× ⊂ F^×` lies in `G(ℚ)` with similitude factor `c = 4 ≠ 1`, so it is not in `G⁰(ℚ)`.
- For a `ℚ`-algebra `R, G⁰(R) = {g ∈ GL_{2n}(F ⊗ R) : gᵀ J ḡ = J}, J` the antidiagonal matrix of `⟨·,·⟩` (signature `(n, n)`); this is not Mathlib's Matrix.unitaryGroup, which preserves the identity form, and over `ℤ` the lattice `L ⊗ R` need not be free over `O_F ⊗ R` unless the different is principal.

- `splitTracePairing` is zero on a zero argument, takes the standard pair `(e₁,e₂)` at `n=1` to `[F:ℚ]`, and changes sign when those arguments are exchanged. Real degree two and `n=3` give `UnitarySimilitudeDatum.dim = 18`. For `n=1` the matrix is `[[0,1],[−1,0]]`; in characteristic two it becomes `[[0,1],[1,0]]` without division by two. Rank zero gives the empty matrix but is excluded from UnitarySimilitudeDatum by `n ≥ 1`.

### IG.0.4 Spherical Hecke algebras of the datum

<a id="ig-0-spherical-hecke-algebras"></a>

Fix an imaginary quadratic subfield `F₀ ⊂ F` and a finite set `S` of rational primes containing the primes ramified in `F` and those where the level is not hyperspecial, and let `Q_S` be the set of primes `q ∉ S` that split in `F₀`. For `q ∈ Q_S` and a prime `𝔮` of `F₀` above `q`, the decomposition of `V ⊗ ℚ_q` along `𝔮` and its conjugate gives a group isomorphism `G(ℚ_q) ≅ ∏_{w|𝔮} GL_{2n}(F_w) × ℚ_q^×` whose last coordinate is the similitude `c`; under it `G⁰(ℚ_q)` is the product of the `GL_{2n}(F_w)` and `G(ℤ_q) = ∏_{w|𝔮} GL_{2n}(O_{F_w}) × ℤ_q^×`. Define three rings.

`(1)` The full similitude algebra `heckeFull` `𝕋^S_full`, the restricted tensor product of the `ℤ[G(ℚ_q)//G(ℤ_q)]` over `q ∈ Q_S`, realised as the double-coset ring `HeckeRing Δ K^S ℤ` of the restricted product `Δ` of the `G(ℚ_q)` with respect to `K^S = ∏_q G(ℤ_q)`, with basis the double cosets `[K^S g K^S]`.

`(2)` For a prime `v` of `F` above `q ∈ Q_S` and `1 ≤ i ≤ 2n`, the operator `heckeOperator` `T_{i,v} ∈ 𝕋^S_full`: the double coset of the element that is `diag(ϖ_v, …, ϖ_v, 1, …, 1)` (`i` entries `ϖ_v`) in `GL_{2n}(F_v)`, the identity in the other factors `GL_{2n}(F_w)`, and has similitude coordinate in `ℤ_q^×`, in the decomposition attached to the prime of `F₀` below `v`. The operator algebra `heckeOperatorSubring` `𝕋^S ⊂ 𝕋^S_full` is the subring generated by all `T_{i,v}, v` running over all primes of `F` above all `q ∈ Q_S`.

`(3)` The unitary algebra `heckeUnitary` `𝕋^{0,S}`, the restricted tensor product of the `ℤ[G⁰(ℚ_q)//G⁰(ℤ_q)]`, with the operators `T⁰_{i,v}` given by the same double cosets in `G⁰` (CSnc §2.1, pp. 11–12); it is generated by the `T⁰_{i,v}`.

Prove: (a) `𝕋^S` is the subring of `𝕋^S_full` of functions supported on the elements whose similitude is a unit at every `q`; `(b)` restriction of functions to `G⁰` is a ring isomorphism `heckeRestrict` : `𝕋^S → 𝕋^{0,S}` with `T_{i,v} ↦ T⁰_{i,v}`; `(c)` for `q ∈ Q_S` let `z_q` be the central element of `G(ℚ_q)` with similitude `q` and identity coordinates in every `GL_{2n}(F_w)`, and `U_q = [K z_q K]`; then `U_q` is a unit of `𝕋^S_full` with inverse `[K z_q⁻¹ K]`, and `𝕋^S_full` is the Laurent polynomial ring `𝕋^S[U_q^{±1} : q ∈ Q_S]`; `(d)` all three rings are commutative; `(e)` the inversion `g ↦ g⁻¹` induces the involution `ι` of `𝕋^S_full`, [KgK] `↦ [Kg⁻¹K]`; `ι` preserves `𝕋^S`, sends `U_q` to `U_q⁻¹`, satisfies `heckeRestrict ∘ ι = ι⁰ ∘ heckeRestrict` for the inversion `ι⁰` of `𝕋^{0,S}`, and `ι(T_{i,v}) = T_{2n,v}⁻¹ T_{2n−i,v}` (with `T_{0,v} = 1`). Restriction of functions on the whole of `𝕋^S_full` is **not** a ring homomorphism, so every comparison with the unitary group goes through `𝕋^S`.

*Proof sketch.* The unit-similitude subgroup `c⁻¹(ℤ_q^×)` is the direct product `G⁰(ℚ_q) × ℤ_q^×`, and `G(ℤ_q) = G⁰(ℤ_q) × ℤ_q^×`. So a `G(ℤ_q)`-bi-invariant function supported there is determined by its restriction to `G⁰(ℚ_q)`, convolution of two such functions is again supported there, and it is computed in `G⁰`; this gives (a) and `(b)`, using that the `T_{i,v}` have unit similitude and the `T⁰_{i,v}` generate `𝕋^{0,S}` (the inverse of `T⁰_{2n,v}` is the operator `T⁰_{2n,v^c}` at the conjugate place). Since `c(z_q) = q` generates `ℚ_q^×/ℤ_q^×` and `z_q` is central, `G(ℚ_q)` is the product of the unit-similitude subgroup and the cyclic group of `z_q`, which gives `(c)`. Commutativity follows from the Satake isomorphism for `GL_{2n}`. Alternatively, transpose on each `GL` factor is an anti-involution fixing each integral double coset; inversion `ι` itself does not fix those cosets. The formula for `ι(T_{i,v})` is the computation of the inverse double coset in `GL_{2n}(F_v)`.

The hypotheses are that each `q ∈ Q_S` splits in `F₀` and lies outside `S`; the operators `T_{i,v}` are not defined at other primes. The split local Lean model assumes a finite set `W` of places. For `W` empty (or `GL-rank` zero) the unitary ring is `ℤ` and the full ring is `ℤ[U_q^{±1}]`. Finiteness is essential: for `W = ℕ, rank 2` and `g_w = diag(q, 1)` at every `w`, the index of `K ∩ gKg⁻¹` in `K` is infinite (already each factor contributes `q + 1`), so that unrestricted product is not a Hecke pair.

([CSnc](#ref-csnc), §2.1, pp. 11–12, for `𝕋^S, 𝕋^{0,S}` and restriction; §5.1, p. 64, for the full algebra, the split decomposition and `T_{i,v}`; §2.8, proof of Theorem 1.1, p. 36, for `ι`; [acc23](#ref-acc23), §2.2.19, pp. 35–36, for the anti-involution.)

The API:

- `heckeFull`: `𝕋^S_full` as `HeckeRing Δ K^S ℤ` for the restricted product, with `heckeFull_mul_comm`.
- `UnitarySimilitudeDatum.heckeOperator` (`heckeOperator`): The operators `T_{i,v}` for `v` above `q ∈ Q_S`.
- `heckeOperatorSubring`: `𝕋^S`, with `mem_heckeOperatorSubring_iff_support` (statement (a)).
- `heckeUnitary`: `𝕋^{0,S}` with its operators `T⁰_{i,v}`.
- `heckeRestrict`: The ring isomorphism `𝕋^S ≃+* 𝕋^{0,S}`, with `UnitarySimilitudeDatum.heckeRestrict_heckeOperator` (`heckeRestrict_heckeOperator`).
- `heckeSimilitudeUnit`: The units `U_q`, with `heckeFull_eq_laurent` (statement `(c)`).
- `heckeInvolution`: `ι` on `𝕋^S_full`, with `heckeInvolution_involutive`, `heckeInvolution_T` (the inverse-double-coset formula above), `heckeInvolution_compat_tauceti` (agreement on basis elements with Tau Ceti's `HeckeAntiInvolution.onHeckeCoset`), `heckeInvolution_mem_operator`, `heckeInvolution_similitudeUnit` and `heckeRestrict_comp_involution`.

At a prime `q` that splits completely in `F` the local coordinates use existing carriers, in the coordinates `G(ℚ_q) = ∏_{w} GL_{2n}(ℚ_q) × ℚ_q^×`: `SplitLocalGroup`, `SplitLocalUnitaryGroup`, `glIntegral`, `unitsIntegral`, `splitIntegralSubgroup`, `splitUnitaryIntegralSubgroup`, `unitSimilitudeSubgroup`, the rings `localHeckeFull` and `localHeckeUnitary` (native `HeckeRings`), the operator subring `localHeckeOperatorSubring`, the elements `similitudeElement` and `localSimilitudeUnit` `(U_q^k)`, the function `restrictValue` (restriction of functions to `G⁰`), and the statements `localHeckeFull_mul_comm`, `localHeckeUnitary_mul_comm`, `exists_localHeckeInvolution` (an involutive ring automorphism sending every double-coset basis vector to the inverse-double-coset basis vector), `localSimilitudeUnit_mul_neg`, `localSimilitudeUnit_not_mem`, `localHeckeFull_eq_laurent`, `exists_heckeRestrict` (statement `(b)`, with the isomorphism given by `restrictValue`) and `not_exists_ringHom_restrict_full` (no ring homomorphism on the full algebra restricts functions).

The local Hecke-pair targets `instIsHeckeTripleSplit` and `instIsHeckeTripleSplitUnitary` assert commensurability for finite `W`. They are stated as theorem milestones; their conclusions are explicit hypotheses of the suggested ring signatures. Construct `localHeckeOperatorSubring` as the subring whose membership is the support condition `∀ D, f D ≠ 0 → D.rep ∈ unitSimilitudeSubgroup`; `exists_localHeckeOperatorSubring` states its existence with precisely this membership condition, including closure under multiplication as part of IG.0.4(a). In the suggested restriction and Laurent statements, take any `A : Subring (localHeckeFull q W m)` with exactly that membership condition. Thus the statements express (a)–`(c)` without assuming a constructed operator-subring carrier.

*Needs:* IG.0; Mathlib `RestrictedProduct`, `HeckeRing`; Tau Ceti `HeckeCosetModule.instRingHeckeRing`, `HeckeAntiInvolution.ofAmbient`; AdelicAlgebraicGroups Layer 1; SmoothRepresentationsOfLocalGroups SR.1, SR.4.

**Checks.**

- For `W` empty or `m=0`, `SplitLocalUnitaryGroup` is trivial, `localHeckeUnitary ≃+* ℤ`, and `localHeckeFull ≃+* LaurentPolynomial ℤ`: the scalar valuation still supplies the Laurent variable. The ring assertions carry the corresponding Hecke-triple hypotheses.
- In split coordinates `(g,1)` always lies in `unitSimilitudeSubgroup`; it lies in `splitIntegralSubgroup` exactly when `g` lies in `splitUnitaryIntegralSubgroup`, that is, every coordinate lies in `glIntegral`. Rank zero makes the `GL` condition vacuous; a nonintegral `GL` coordinate distinguishes the first two subgroups when `m>0`. The scalar `q` is not in `unitsIntegral`, although it is nonzero and integral. `similitudeElement 0` and `localSimilitudeUnit 0` are identities; restriction preserves the identity basis vector.
- `U_q · U_q⁻¹ = 1` in `𝕋^S_full`, but every element in the support of `U_q` or of `U_q⁻¹` has similitude of valuation ±`1`, so restriction of functions sends both to `0` and sends `1` to the identity: restriction of functions on `𝕋^S_full` is not multiplicative, and `U_q ∉ 𝕋^S`. The named boundary statements are `restrictValue_similitudeUnit`, which kills every translate with nonzero integer similitude valuation, and `restrictValue_one`, which preserves the identity basis vector.
- For `F` imaginary quadratic and `n = 1` (so `F₀ = F` and each `q ∈ Q_S` has two places `v, v^c` of `F`), `T_{2,v} · T_{2,v^c} = 1` in `𝕋^S`; a definition of `𝕋^S` using only the places above one prime of `F₀` would miss these inverses and would not be isomorphic to `𝕋^{0,S}`.
- For `2n = 2, ι(T_{1,v}) = T_{2,v}⁻¹ T_{1,v}` and `ι(T_{2,v}) = T_{2,v}⁻¹`; `ι` is not the identity on `𝕋^S`.
- On the native basis, `ι` is the linear extension of `HeckeAntiInvolution.onHeckeCoset` for the `ofAmbient` inversion datum: it sends the basis vector of a double coset `c` to the basis vector of `onHeckeCoset c`; inversion need not fix double cosets.

### IG.0.5 Localization along the operator inclusion

<a id="ig-0-localization-along-operator-inclusion"></a>

Call a `𝕋^S_full`-module `M` locally finite if it is the union of its finite submodules (finite as sets). Examples are the cohomology with `𝔽_ℓ` or `ℤ/ℓ^m` coefficients of a Shimura variety or of a Mantovan Igusa variety at a fixed finite level, and filtered colimits of such along Hecke-equivariant maps, such as Igusa cohomology at infinite `p`-level. Let `𝔪 ⊂ 𝕋^S` be a maximal ideal. Prove: `(1)` every maximal ideal `𝔐` of `𝕋^S_full` in the support of `M` has finite residue field and `𝔐 ∩ 𝕋^S` is maximal; `(2)` the natural map `M_𝔪 → ⊕_𝔐 M_𝔐`, the sum over the maximal ideals `𝔐` of `𝕋^S_full` in the support of `M` with `𝔐 ∩ 𝕋^S = 𝔪`, is an isomorphism, and each finite submodule has only finitely many `𝔐` in its support; `(3)` for a graded locally finite module `M^•`, `M^i_𝔪 = 0` if and only if `M^i_𝔐 = 0` for all `𝔐` over `𝔪`, so if `M^•_𝔪` is nonzero in exactly one degree then each `M^•_𝔐` over `𝔪` is nonzero in at most that degree and at least one is nonzero there; `(4)` if `𝔐` lies over `𝔪` then `ι(𝔐)` lies over `ι(𝔪)`, and a Galois representation whose Frobenius characteristic polynomials are the reductions of the Hecke polynomials of the `T_{i,v}` is the same for `𝔐` and for `𝔪`; `(5)` for a maximal ideal `𝔪⁰ ⊂ 𝕋^{0,S}, 𝔪 = heckeRestrict⁻¹(𝔪⁰)` is maximal with the same residue field, and for a `𝕋^{0,S}`-module `N` viewed as a `𝕋^S`-module through `heckeRestrict, N_𝔪 = N_{𝔪⁰}`.

*Proof sketch.* Localization commutes with filtered colimits, so reduce to a finite module `M`. Then `𝕋^S_full/Ann(M)` embeds in a finite product of copies of `M`, so it is a finite, hence Artinian, ring, and `M` is the direct sum of its localizations at the finitely many maximal ideals of its support (Stacks, Lemma 10.53.6). A finite residue field `𝕋^S_full/𝔐` contains `𝕋^S/(𝔐 ∩ 𝕋^S)`, a finite domain, hence a field. An element `s ∈ 𝕋^S ∖ 𝔪` is a unit on `M_𝔐` when `𝔐 ∩ 𝕋^S = 𝔪`; when `𝔐 ∩ 𝕋^S = 𝔪′ ≠ 𝔪`, an element of `𝔪′ ∖ 𝔪` acts nilpotently on `M_𝔐`, so inverting it kills `M_𝔐`. Statement `(4)` holds because `ι` preserves `𝕋^S` and the `T_{i,v}` lie in `𝕋^S`; statement `(5)` because `heckeRestrict` is an isomorphism.

The hypothesis that `M` is a union of finite submodules is essential. At fixed tame level it holds for the torsion-coefficient cohomology used in Layers IG.4–IG.7: finite-level cohomology is finite and Hecke-stable, and every class comes from a finite level. This argument does not apply to `ℤ_ℓ`- or `ℚ_ℓ`-cohomology. Integral consequences are obtained through their finite torsion coefficients and the stated coefficient-limit arguments; the direct-sum comparison is not asserted for integral or rational modules.

([Stacks, Lemma 10.53.6](https://stacks.math.columbia.edu/tag/00JB); the comparison is the one used implicitly in [CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36, where the operator-algebra ideal of §2.1 is fed into Corollary 5.1.3, p. 66, stated for the full algebra of §5.1.)

The API: `localization_operator_eq_sum` (statement `(2)`), `localization_operator_eq_zero_iff` (statement `(3)`), `dualIdeal_comap` (statement `(4)`), `localization_unitary_eq` (statement `(5)`).

*Needs:* IG.0; Mathlib `LocalizedModule`, `IsArtinianRing`.

**Checks.**

- Toy case: with `𝕋^S = 𝔽_ℓ (ℓ ≥ 3), 𝕋^S_full = 𝔽_ℓ[U^{±1}], 𝔪 = 0` and `M = 𝔽_ℓ[U]/(U − 1) ⊕ 𝔽_ℓ[U]/(U − 2), M_𝔪 = M` is the sum of its localizations at `(U − 1)` and `(U − 2)`.
- Non-example: `M = 𝔽_ℓ[U^{±1}]` is not locally finite; the element `1` has nonzero image in `M_𝔐` for every one of the infinitely many maximal ideals `𝔐`, so there is no map `M → ⊕_𝔐 M_𝔐` and statement `(2)` fails.
- `M = 0` gives the empty sum, and a module on which `𝕋^S` acts through a different maximal ideal `𝔪′ ≠ 𝔪` has `M_𝔪 = 0` although its full-algebra localizations at ideals over `𝔪′` are nonzero.

### IG.0.6 The open and closed unitary component

<a id="ig-0-unitary-subgroup-comparison"></a>

Let `K ⊂ G(𝔸_f)` be neat and `K⁰ = K ∩ G⁰(𝔸_f)`. The inclusion `G⁰ ↪ G` induces an open and closed immersion `X⁰_{K⁰} → X_K`, and the induced maps `H^i(X_K, ·) → H^i(X⁰_{K⁰}, ·)` and `H^i_c(X⁰_{K⁰}, ·) → H^i_c(X_K, ·)` are equivariant for the operator algebra `𝕋^S`, acting on the cohomology of `X⁰_{K⁰}` through `heckeRestrict : 𝕋^S → 𝕋^{0,S}`. Consequently, for a maximal ideal `𝔪⁰ ⊂ 𝕋^{0,S}` and `𝔪 = heckeRestrict⁻¹(𝔪⁰), H^i(X⁰_{K⁰}, ·)_{𝔪⁰}` is a quotient of `H^i(X_K, ·)_𝔪` and `H^i_c(X⁰_{K⁰}, ·)_{𝔪⁰}` is a submodule of `H^i_c(X_K, ·)_𝔪`: restriction to an open and closed subspace is surjective, extension by zero is injective, and localization is exact. The full algebra `𝕋^S_full` is not used here: it acts on the cohomology of `X_K`, but there is no ring map from it to `𝕋^{0,S}` compatible with these maps (IG.0.4, first check).

The map `X⁰_{K⁰} → X_K` is injective because an element `γ ∈ G(ℚ)` relating two points of `X⁰ × G⁰(𝔸_f)` has `c(γ) ∈ ℚ^× ∩ ∏_p ℤ_p^× = {±1}` and `c(γ) > 0`, so `γ ∈ G⁰(ℚ)`.

Assume `K` neat and `K⁰ = K ∩ G⁰(𝔸_f)`.

([CSnc](#ref-csnc), §2.1, Lemma 2.1.1, p. 12.)

*Needs:* IG.0 (IG.0.4 and IG.0.5).

### IG.0.7 The Hasse principle for `G`

<a id="ig-0-hasse-principle"></a>

The map `H¹(ℚ, G) → ∏_v H¹(ℚ_v, G), v` running over all places of `ℚ`, is injective. Equivalently, a `2n`-dimensional `F`-vector space `V′` with an alternating form `(·,·)′` satisfying `(xv, w)′ = (v, x̄w)′` that is isomorphic to `(V, (·,·))` up to a scalar after base change to every completion `ℚ_v` is isomorphic to it up to a scalar over `ℚ`.

Assume `G` is the unitary similitude group of the quasi-split datum.

([CSnc](#ref-csnc), §2.1, Proposition 2.1.2, p. 12.)

*Needs:* IG.0; AdelicAlgebraicGroups Layer 4; PELModuli M3.

### IG.0.8 Abelian and `p`-divisible groups with `G`-structure

<a id="ig-0-g-structure"></a>

`(1)` For a scheme `S` over `ℤ[1/Δ_F]`, an abelian variety with `G`-structure over `S` is a triple `(A, ι, λ)`: an abelian scheme `A/S` of relative dimension `[F:ℚ]n`, an action `ι : O_F → End(A)` such that `Lie A` is a locally free `O_F ⊗_ℤ O_S`-module of `rank n`, and a principal polarization `λ : A ≅ A^∨` whose Rosati involution induces complex conjugation on `O_F`. `(2)` Take `p` unramified in `F` and a scheme `S` with `p` locally nilpotent. The `p`-divisible version consists of `(X, ι, λ)`, where `X/S` is `p`-divisible of height `2[F:ℚ]n` and dimension `[F:ℚ]n, ι : O_F → End(X)` with `Lie X` locally free of `rank n` over `O_F ⊗_ℤ O_S`, and `λ : X ≅ X^∨` a principal polarization whose Rosati involution is complex conjugation via `ι`. Morphisms are `O_F`-linear maps respecting `λ` (isomorphisms may respect `λ` up to `ℤ_p^×` when stated, as in Igusa level structures).

Assume `p` unramified in `F` in `(2)`; the rank condition on `Lie` is the determinant (Kottwitz) condition of the split signature `(n, n)` at every place. Local freeness is taken in the Zariski topology; no global trivialization of the Hodge bundle is part of the datum.

([CSnc](#ref-csnc), §2.1, Definition 2.1.3(2), p. 13.)

The API:

- `PDivGStructure.ofAbelian`: The `p`-divisible group `A[p^∞]` with its induced `G`-structure.
- `PDivGStructure.baseChange`: Base change, compatible with composition.
- `PDivGStructure.height_eq`: Height `2[F:ℚ]n` and dimension `[F:ℚ]n`.
- `PDivGStructure.Iso`: `O_F`-linear isomorphisms preserving polarization up to `ℤ_p^×`; strict ones preserve it exactly.
- `PDivGStructure.cartierDual`: The polarization identification with the conjugate Cartier dual.

*Needs:* IG.0; PELModuli `M1, M0`; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

**Checks.**

- Over `𝔽̄_p` with `p` unramified in `F` (signature `(n, n)` makes the ordinary element admissible for every such `p`), `μ_{p^∞} ⊗ O_F^n ⊕ (ℚ_p/ℤ_p) ⊗ O_F^n` with the standard polarization is a `p`-divisible group with `G`-structure of height `2[F:ℚ]n`.
- `A p`-divisible group with the required height and `O_F`-action whose `Lie` algebra has conjugate embedding ranks `(n+1,n−1)` fails the balanced `Lie-rank` condition; the failure is unequal component ranks, not freeness of a different common rank.
- For an abelian variety with `G`-structure `A`, the height of `A[p^∞]` is `2 dim A = 2[F:ℚ]n`.
- Over an elliptic base in odd characteristic with split `O_F`-action and `n=1`, twist a constant balanced family by a nontrivial `μ₂`-torsor through central `−1`. Each Lie embedding summand becomes the associated nontrivial order-two line bundle. The abelian and `p`-divisible families still satisfy the determinant condition; their Hodge bundles have no global frame.

### IG.0.9 The integral model `S_K`

<a id="ig-0-integral-model"></a>

Fix `N ≥ 3` and `K = K(N)`. The `S`-points of `S^pre_K` over `ℤ[1/Δ_F]` consist of an abelian variety `(A, ι, λ)` with `G`-structure, level data `η : L/N → A[N]` that are `O_F`-linear, and `ζ_N ∈ μ_N^prim(S)`, where `μ_N^prim = Spec ℤ[t]/(Φ_N(t))` is the cyclotomic primitive-root scheme of ModularCurves §5B. Require that `η` carries `(·,·)` mod `N` to the Weil pairing of `λ` via `ζ_N`, and that `η` extends to compatible `O_F`-linear maps `L/Δ_F^m N → A[Δ_F^m N]` for all `m ≥ 1`. It is a Deligne–Mumford stack, representable after base change to `ℤ[1/(Δ_F N)]` and after base change to `ℤ_(p)` whenever the prime-to-`p` part of `N` is at least `3`. `S_K` is the normalization of `S^pre_K` in `S^pre_K × ℤ[1/(Δ_F N)]`. For `p ∤ NΔ_F, S_K ×_ℤ ℤ_(p)` is the smooth PEL integral model of PELModuli M2 with hyperspecial level at `p`; its special fibre `S_{K,k} = S_K ×_ℤ k (k = 𝔽̄_p)` carries the universal `p`-divisible group with `G`-structure `A[p^∞]`. As schemes, `S^pre_K` and `S_K` mean their restrictions to the open base `U_{D,N}` on which `Δ_F` is invertible and the prime-to-`q` part of `N` is at least `3` at every residual prime `q`; the whole normalized Deligne–Mumford stack is not declared to be a Scheme.

This primitive-root condition commutes with arbitrary base change. It agrees with order `N` in the group of geometric sections after inverting `N`; at bad level it is the cyclotomic condition, including nonreduced fibres.

Level-forgetting maps are defined over a common good-prime base for `N|M, p∤MΔ_F`. Complex uniformization commutes with these maps. Prime-to-`p` Hecke correspondences compose compatibly. At a good prime, `IntegralModel.toPELModuli` identifies this representing functor and its universal family with EndoscopicTransferAndUnitaryTraceComparison §7.1's `IgusaPELModel`; hence their special fibres, central leaves and supplied Igusa towers use the same structured universal group.

Assume `N ≥ 3` and `K=K(N)`. The source first defines a Deligne–Mumford moduli stack over `ℤ[1/Δ_F]`. The suggested Scheme carrier is its restriction to the open base `U_{D,N}` where the prime-to-residue-characteristic part of `N` is at least `3`. At `p` unramified in `F` with that tame-level condition, base change to `ℤ_(p)` is defined; smoothness additionally requires `p∤N`.

([CSnc](#ref-csnc), §2.1, Definition 2.1.4, p. 13; §2.1, Definition 2.1.5, p. 13.)

The API: `IntegralModel.moduli`, `IntegralModel.smooth_of_good`, `IntegralModel.universalPDiv`, `IntegralModel.hecke`, `IntegralModel.toPELModuli`, `IntegralModel.transitionAtP`, `IntegralModel.complexTransition`.

*Needs:* IG.0; PELModuli `M1, M0, M2`; ModularCurves §5B (the cyclotomic primitive-root scheme); EndoscopicTransferAndUnitaryTraceComparison §7.1 (the same good-prime PEL model)

**Checks.**

- At a good prime the relative dimension is `d`; imaginary quadratic `F` with `n=1` gives a curve.
- The complex fibre is the Shimura variety `X_K`.
- For `N=p≥3` the tame level is trivial, so the `N^p≥3` representability criterion does not apply.
- For `F=ℚ(i), p=5, N=15`, the tame level is `3` and the integral representable base includes characteristic `5`. Here `Φ₁₅(T) mod 5 = Φ₃(T)^4` and `T¹⁵−1=(T³−1)^5`: a characteristic-zero primitive fifteenth root specializes to a cyclotomic primitive root of pointwise order `3`. Requiring abstract order `15` would remove this special fibre.

### IG.0.10 Complex uniformization

<a id="ig-0-complex-uniformization"></a>

There is a natural isomorphism of complex manifolds `X_K ≅ S_K(ℂ)`, equivariant for the Hecke action of `G(𝔸_f)`.

Assume `K = K(N)` with `N ≥ 3`.

([CSnc](#ref-csnc), §2.1, Proposition 2.1.6, p. 13.)

*Needs:* IG.0; PELModuli M3.

### IG.0.11 Unramified local PEL data of type (A) or (C)

<a id="ig-0-unramified-local-pel-datum"></a>

An unramified local PEL datum `D^int = (B, *, V, (·,·), O_B, Λ, μ, b)` consists of: a finite-dimensional semisimple `ℚ_p`-algebra `B` with anti-involution `*`, which is a product of matrix algebras over unramified extensions of `ℚ_p`; a `*`-stable maximal `ℤ_p`-order `O_B`; a finite left `B`-module `V` with an alternating form `(·,·) : V × V → ℚ_p` such that `(bv, w) = (v, b*w)`; an `O_B`-stable lattice `Λ ⊂ V` self-dual for `(·,·)`, so that `G(R) = {(g, c) ∈ GL_{B⊗R}(V ⊗ R) × R^× : (gv, gw) = c(v, w)}` extends to a reductive group `G` over `ℤ_p`, assumed connected (type `D` excluded); a conjugacy class `μ : 𝔾_m → G_{ℚ̄_p}` of cocharacters with weights `0` and `1` on `V, V_{ℚ̄_p} = V₀ ⊕ V₁` with both summands totally isotropic and `c ∘ μ = id`, with field of definition `E`; and `b ∈ G(L), L = W(𝔽̄_p)[1/p]`, with `[b] ∈ B(G, μ^{−1})`. The slopes of `b` on `V` lie in `[−1, 0]` in the paper's (nonstandard) covariant normalization of the Dieudonné module, so there is a `p`-divisible group `X_b` over `𝔽̄_p` with rational `B`-action on its universal cover and symmetric quasi-polarization, unique up to quasi-isogeny, whose rational covariant Dieudonné module is `V ⊗ L` with Frobenius `b σ`. Global PEL data of type `(A)` or `(C)` unramified at `p` with hyperspecial level give such a datum at every `b ∈ B(G_{ℚ_p}, μ^{−1})`.

Assume `B` is a product of matrix algebras over unramified extensions of `ℚ_p` (unramified datum). `G` connected: data of type `D` are excluded. `p = 2` is allowed in this unramified setting without type `D`.

([CS17](#ref-cs17), §4.2, p. 697; §4.2, p. 696.)

The API:

- `LocalPELDatum.reductiveModel`: The reductive `ℤ_p`-model stabilizing `Λ` up to scalar.
- `LocalPELDatum.pdivOfB`: The rational `B`-framing `X_b` and symmetric quasi-polarization; integral `O_B`-action and principal polarization are separate data.
- `LocalPELDatum.pdivOfB_isocrystal`: The isocrystal `(V⊗L,bσ)` with action and pairing.
- `LocalPELDatum.pdivOfB_unique`: Uniqueness up to structure-preserving quasi-isogeny.
- `LocalPELDatum.ofGlobal`: The unramified type `(A)/(C)` hyperspecial global-to-local construction for `b∈B(G,μ⁻¹)`.
- `LocalPELDatum.J`: Self-quasi-isogenies `J_b(ℚ_p)`, identified with the `σ`-centralizer `JGroup` of IG.0.1.
- `LocalPELDatum.IntegralSlopeRepresentative`: An integral principal-polarized, determinant-compatible, completely slope divisible representative quasi-isogenous to `X_b`, constructed by the normalizer-lattice theorem IG.0.18a. The representative can simultaneously be chosen fundamental, by IG.0.18b.

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; PELModuli M0.

**Checks.**

- For the unitary datum at `p` split in `F` and `b` ordinary, `X_b ≅ (μ_{p^∞} ⊕ ℚ_p/ℤ_p) ⊗_{ℤ_p} O_F^n ⊗ ℤ_p` with the standard polarization.
- For the quasi-split unitary datum and `b` basic, `X_b` is isoclinic of Frobenius slope `1/2` (covariant Dieudonné slope `−1/2`).
- An orthogonal datum (* of type `D, G` disconnected) is not an unramified local PEL datum in this sense.
- `J_b(ℚ_p) = Aut(X_b, extra structures) ⊗ ℚ` equals the `σ`-centralizer of `b` of IG.0.1.

### IG.0.17 Complete slope divisibility

<a id="ig-0-completely-slope-divisible"></a>

The base-change and generic-to-global statements extend the common predicate; they do not define a second slope filtration.

Use the complete slope-divisibility predicate and slope filtration of EndoscopicTransferAndUnitaryTraceComparison §7.7. In explicit Frobenius notation, let `T` be an `𝔽_p`-scheme and `𝒢/T` a `p`-divisible group with relative Frobenius `Frob_𝒢`. `(1) 𝒢` is isoclinic and slope divisible of slope `λ ∈ ℚ_{≥0}` if one can write `λ = a/s` with integers `a ≥ 0` and `s ≥ 1` so that the quasi-isogeny `p^{−a} Frob^s_𝒢 : 𝒢 → 𝒢^{(p^s)}` is an isomorphism. `(2) 𝒢` is slope divisible with respect to `λ = a/s (a ≥ 0, s ≥ 1)` if `p^{−a} Frob^s_𝒢` is an isogeny. `(3) 𝒢` is completely slope divisible if there are rational numbers `λ₁ > … > λ_r ≥ 0` and a filtration `0 = 𝒢₀ ⊂ 𝒢₁ ⊂ … ⊂ 𝒢_r = 𝒢` by `p`-divisible groups such that each `𝒢_i` is slope divisible with respect to `λ_i` and `𝒢_i/𝒢_{i−1}` is isoclinic and slope divisible of slope `λ_i`. Such a filtration is unique and its formation is fpqc local on `T`.

Assume `T` an `𝔽_p`-scheme; `λ` denotes a nonnegative Frobenius slope as in CSnc Definition 2.3.3, not the negative covariant Dieudonné slope used for Newton vectors. A nonzero isoclinic `p`-divisible group has `λ ∈ [0, 1]`.

([CSnc](#ref-csnc), §2.3, Definition 2.3.3, p. 18; §2.3, Lemma 2.3.4, p. 19.)

The API:

- `IsCompletelySlopeDivisible`: Alias of the supplied slope-divisibility predicate; the filtration operations below extend the supplied `SlopeFiltration` interface to the stated bases.
- `IsCompletelySlopeDivisible.slopeFiltration`: The unique slope divisible filtration.
- `IsCompletelySlopeDivisible.baseChange`: Base-change stability of the predicate and filtration.
- `IsCompletelySlopeDivisible.of_generic`: Generic-to-global divisibility over connected regular bases with constant Newton polygon (CSnc Lemma 2.3.4).
- `IsCompletelySlopeDivisible.split_of_perfect`: Canonical splitting over perfect bases (Oort–Zink Proposition 1.3).

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §7.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- `μ_{p^∞} ⊕ ℚ_p/ℤ_p` over `𝔽̄_p` is completely slope divisible with slopes `1 > 0`.
- A nonzero isoclinic slope divisible group is completely slope divisible with `r=1`; the zero group has the empty filtration `r=0`.
- `A p`-divisible group over a nonnormal base that is not isogenous to one with a slope filtration ([OZ02, Ex. 4.2]) is not completely slope divisible.
- For slopes in `{0, 1}` the slope filtration is the multiplicative–étale filtration of the `p`-divisible group.

### IG.0.18 Slope divisible representatives and base change

<a id="ig-0-slope-filtration-existence"></a>

These existence and base-change results use the common slope filtration of EndoscopicTransferAndUnitaryTraceComparison §7.7; IG.0.18a supplies the additional simultaneous integral PEL representative.

`(1)` Every `p`-divisible group over an algebraically closed field of characteristic `p` is isogenous to a completely slope divisible one, which is a direct sum of isoclinic slope divisible groups defined over a finite field, with decreasing slopes; the simultaneous integral PEL assertion is IG.0.18a, using the integral equivalence rather than the rational classification. `(2)` Over a perfect base a completely slope divisible `p`-divisible group is the direct sum of its isoclinic graded pieces [OZ02, Prop. 1.3]. `(3)` If `V` is a valuation ring of characteristic `p` with fraction field `K` and `G/V` has constant Newton polygon with `G_K` completely slope divisible, then `G` is completely slope divisible [OZ02, Prop. 2.3]. `(4)` Over a connected regular characteristic-`p` base with constant Newton polygon, complete slope divisibility at the geometric generic point implies it everywhere [Zin01, Thm `7`].

Assume Characteristic `p` bases; `(3)` needs constant Newton polygon. In `(4)`, the Newton polygon is constant on the base.

([oz02](#ref-oz02), Proposition 1.3, p. 186; Proposition 2.3, p. 189; [CS17](#ref-cs17), §4.3, p. 714.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §7.7; IG.0.17; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

### IG.0.18a Integral PEL representatives from normalizer lattices

<a id="ig-0-integral-pel-normalizer-lattice"></a>

For the unramified type `(A)/(C)` datum of IG.0.11 and every admissible class `b`, construct a self-dual `O_B`-linear Dieudonné lattice whose group `X_b` has the prescribed determinant condition, principal quasi-polarization and complete slope divisibility. Use the contravariant integral module `M(X)`, with nonnegative Frobenius slopes, during this construction. Its rational module is the linear dual of the negative covariant module of IG.0.11; transport the opposite order action through `*`. Thus `μ⁺` is the dual of `μ⁻¹`, with weights `0` and `1`. Convert action, determinant and pairing back by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.10 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20; do not identify the integral covariant Frobenius with the group Frobenius. The lattice is not obtained by averaging rational slope projectors.

First prove `hyperspecialMazurConverse`: let `G/ℚ_p` be unramified connected reductive, let `𝒢/ℤ_p` be its reductive hyperspecial model, put `L=W(𝔽̄_p)[1/p]` and `K=𝒢(W(𝔽̄_p))`, and choose a Borel and maximal torus of `𝒢`. Let `μ` be a dominant minuscule cocharacter of that torus over `L`. Then `[b]∈B(G,μ)` if and only if `[b]∩Kμ(p)K≠∅`. Here numerical admissibility means `κ_G(b)=μ^♮` and `ν_b≤μ̄`, with the Galois average `μ̄`; `K` is the integral subgroup over `L`. Prove the forward implication by the converse to Mazur's inequality and the reverse by Mazur's inequality and the Kottwitz invariant. Source: [Viehmann–Wedhorn](#ref-vw), §7.2, equation (7.6), p.32, and the Rapoport–Richartz, Kottwitz–Rapoport, Lucarelli and Gashi results cited there. This nonemptiness theorem precedes the lattice construction.

*Construction and proof.* Morita equivalence and the embeddings of the unramified coefficient orders decompose the standard self-dual lattice over `W(k)` into the standard type-A or type-`C` weight lines, with the repeated Morita factors retained. The Frobenius on the coefficient embeddings permutes those factors. Apply `hyperspecialMazurConverse` to the dual class and `μ⁺` to obtain an intersection with `Kμ⁺(p)K`. Nie Proposition 1.5 then supplies a fundamental element `x` in `Wμ⁺(p)W` in that class. Lift its finite Weyl factor by the usual signed permutation matrices in the standard self-dual basis and its translation factor by `μ⁺(p)`. These matrices preserve the `O_B` tensors and the alternating form up to multiplier `p`; in the paired type-A factors the second matrix is `p` times the inverse transpose of the first. Thus `F = ẋσ` satisfies `pM ⊂ FM ⊂ M, V = pF⁻¹` is integral, and `⟨Fu,Fv⟩ = pσ⟨u,v⟩`. The minuscule double coset gives exactly the specified Hodge ranks in each embedding, hence the determinant condition. The integral Dieudonné equivalence with duality gives the group, action and principal quasi-polarization simultaneously.

Take `s` divisible by the cycles of the combined weight-line and coefficient-embedding permutation, and even to remove the signs. On each cycle `Fˢ` is `pᵃσˢ`, with `0 ≤ a ≤ s`. Sum the coordinate lattices having the same `a/s`, rather than rational eigenspaces: these are `O_B`-stable integral direct summands, `F`- and `V`-stable, and `p⁻ᵃFˢ` is bijective on each. The form pairs the `a/s` summand with the `(1−a/s)` summand. This is the required compatible complete slope decomposition; it does not require division by `2`, including at `p = 2`. Different choices give representatives of the same rational class, not a canonical integral object.

The API: `hyperspecialMazurConverse`, followed by `integralPELRepresentative`, `integralPELRepresentative_isocrystal`, `integralPELRepresentative_determinant`, `integralPELRepresentative_principal`, `normalizerFrobenius_cyclePower`, `integralPELRepresentative_completelySlopeDivisible`. Each map respects the order action, Cartier duality and the positive/negative slope adapter.

Source: [Nie](#ref-nie15), Proposition 1.5, p.3, with the mixed-characteristic qualification in footnote `1`, p.2; the integral PEL dictionary of [Viehmann–Wedhorn](#ref-vw), §7.2, pp.30–32, and the standard normalizer matrices in §8.2, Remark 8.12, pp.36–37. The cycle-power argument above supplies the integral compatibility beyond their split minimality comparison. *Needs:* IG.0.1–IG.0.2 (numerical admissibility), IG.0.11, IG.0.17; `hyperspecialMazurConverse` above before the normalizer construction; PELModuli M0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.10, R07.2.20; ReductiveGroupsPartII (unramified root data, affine Weyl groups and normalizer lifts).

**Checks.**

- For `GL₂, μ⁺=(1,0)`, the ordinary class meets `Kμ⁺(p)K`: `F = diag(1,p)σ` has `F`-stable integral summands of slopes `0` and `1`, with multiplier `p` and perfect cross pairing. Their negative covariant slopes, after dualizing and reordering, are `0` and `−1`.
- For the same `GL₂, μ⁺`, the basic class also meets `Kμ⁺(p)K`: `F = [[0,−p],[1,0]]σ` has `F² = −pσ²` and `F⁴ = p²σ⁴`; multiplier `p`, slope `1/2`, and the standard alternating pairing is perfect. At `p = 2` the fourth power still works; no alternating idempotent is divided by `2`.
- For `G=𝔾_m` and `μ(t)=t`, the class of `1` has the wrong Kottwitz invariant and does not meet `KpK`; the class of `p` does. Its Newton slope is `0` rather than `1`.
- If two coefficient embeddings are interchanged, include their orbit length in `s`. A coordinate line alone need not be `O_B/F`-stable; the full orbit sum is.
- A rational isocrystal with the wrong Hodge ranks or a non-self-dual lattice is not an input to this construction. Rank zero gives the empty direct sum and does not give a positive-rank Shimura datum.

### IG.0.12 The Newton map and stratification

<a id="ig-0-newton-map"></a>

Let `S` be the special fibre over `k = 𝔽̄_p` of the integral model of a PEL Shimura variety of type `(A)` or `(C)` with hyperspecial level at `p` (for the quasi-split unitary datum: `S_{K,k}` with `p ∤ NΔ_F`). For a point `x ∈ S` with geometric point `x̄`, the rational Dieudonné module of `A_x̄[p^∞]` with its extra structures is an isocrystal with `G`-structure, classified by an element `b_x ∈ B(G_{ℚ_p})`; then `[b_x] ∈ B(G_{ℚ_p}, μ^{−1})` (Rapoport–Richartz), with `μ` the Hodge cocharacter. The Newton stratum `S^b = {x : [b_x] = b}` is locally closed, and `S = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} S^b`. For each `b` fix the completely slope divisible integral PEL representative `X_b` constructed in IG.0.18a, using the definitions and existence results of IG.0.17–IG.0.18 (CS17 §4.3, after [Man05, §3]). The map `x ↦ [b_x]` is the PEL-specific map; `B(G)`, the Newton map `ν`, the Kottwitz map `κ`, the order and `B(G, μ)` are those of IG.0.1–IG.0.2, with the sign of `μ` recorded: the Shimura variety has Hodge cocharacter `μ` and the strata are indexed by `B(G, μ^{−1})`.

Require prime-to-`p` Hecke invariance, invariance under structure-preserving quasi-isogeny, and `closure(S^b)⊆⋃_{b′≤b}S^{b′}`.

Assume PEL datum of type `(A)` or `(C)` unramified at `p` with hyperspecial `K_p`; for the quasi-split unitary datum `p ∤ NΔ_F`.

([CS17](#ref-cs17), §4.3, p. 714.)

The API: `newtonPoint`, `newtonStratum`, `newtonStratum_disjoint_union`, `closure_newtonStratum_subset`, `newtonPoint_hecke`, `newtonPoint_isogeny`.

*Needs:* IG.0.1–IG.0.2, IG.0.9, IG.0.11, IG.0.17–IG.0.18a; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- When `p` splits in `F` the ordinary stratum is open and dense.
- For imaginary quadratic `F, n=1` and split `p` there are two strata; the basic locus is finite.
- For `n≥2`, isogenous but nonisomorphic groups give the same Newton point and different leaves; for imaginary quadratic `F, n=1` and split `p` each stratum is one leaf.
- The Newton class belongs to `B(G,μ⁻¹)`, with the stated cocharacter convention.

### IG.0.13 Splitting symplectic filtrations

<a id="ig-0-splitting-symplectic-filtrations"></a>

Work over an algebraically closed characteristic-`p` field `k` and fix `p`-divisible data `(X, ι, λ)` with `G`-structure. The connected–multiplicative filtration `X^μ ⊂ X° ⊂ X` is `O_F`-stable and symplectic and splits uniquely, `X ≅ X^μ ⊕ X^{(0,1)} ⊕ X^{ét}`, with `λ` decomposing accordingly; `X` is determined up to isomorphism by `X^{(0,1)}` with its `O_F`-action and polarization and by the finite projective `O_F ⊗ ℤ_p`-module `T_p(X^{ét})`. More generally, if `Z_{−2} ⊂ Z_{−1} ⊂ X` is an `O_F`-stable filtration by sub-`p`-divisible groups with `Z_{−2}` multiplicative, `X/Z_{−1}` étale and `λ` identifying `Z_{−2}` with `(X/Z_{−1})^∨`, then there is an `O_F`-linear splitting `X ≅ Z_{−2} ⊕ Z_{−1}/Z_{−2} ⊕ X/Z_{−1}` under which `λ` decomposes as a direct sum.

Assume `k` algebraically closed (perfect suffices for the connected–étale splitting).

([CSnc](#ref-csnc), §2.2, Proposition 2.2.1, p. 14.)

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.0.14 The internal Hom `p`-divisible group

<a id="ig-0-internal-hom-p-divisible-group"></a>

Let `G, G′` be isoclinic `p`-divisible groups over a perfect field `k` of characteristic `p`. For `n ≥ 1, H_n = 𝓗om(G[p^n], G′[p^n])` is a commutative group scheme of finite type over `k`; for `m ≥ n` the restriction `r_{m,n} : H_m → H_n` has closed kernel and `H_n^{(m)} = H_m / ker r_{m,n} ⊂ H_n` is a closed subgroup scheme, decreasing in `m`. (Lemma 4.1.5) `H_n^{(m)}` is constant for `m` ≫ `0`, equal to a finite group scheme `H′_n`. (Lemma 4.1.6) The maps `ι_n : H_n → H_{n+1}` (precompose with `p : G[p^{n+1}] → G[p^n]`, compose with `G′[p^n] ↪ G′[p^{n+1}]`) send `H′_n` into `H′_{n+1}`, and `H_{G,G′} := colim_n H′_n` is a `p`-divisible group over `k` with `H_{G,G′}[p^n] = H′_n`. The construction extends to `O_F`-linear Homs for `p`-divisible groups with an action of the ring of integers `O_F` of an unramified extension `F/ℚ_p`.

The construction is contravariant in `G` and covariant in `G′`, respects composition and isogenies, and has the `O_F`-linear variant for unramified `F/ℚ_p`.

Assume `G, G′` isoclinic over a perfect field `k` of characteristic `p`.

([CS17](#ref-cs17), §4.1, Lemma 4.1.5, p. 693; §4.1, Lemma 4.1.6, p. 694.)

The API: `InternalHom.pdiv`, `InternalHom.torsion_eq`, `InternalHom.tateModule`, `InternalHom.map`, `InternalHom.ofLinear`.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- `𝓗_{μ,μ}=ℚ_p/ℤ_p`: equal slopes give an étale group.
- `𝓗_{μ,ét}=0`, whereas `𝓗_{ét,μ}=μ_{p^∞}` has dimension one.
- At finite level the truncation consists of liftable homomorphisms; all truncated homomorphisms need not lift.

### IG.0.15 Internal Hom: Tate and Dieudonné modules

<a id="ig-0-internal-hom-dieudonne-module"></a>

Let `G, G′` be isoclinic `p`-divisible groups over a perfect field `k`. `(1)` The Tate module `T_p H_{G,G′}` is identified with the sheaf `𝓗om(G, G′)`. `(2)` The rational Dieudonné module satisfies `D(H_{G,G′})[1/p] = Hom(D(G)[1/p], D(G′)[1/p])^{≤0}`, the part of slopes `≤ 0` of the internal `Hom` isocrystal (with the normalization of CS17 §4.1); the statement depends only on `G, G′` up to quasi-isogeny. The analogous statements hold `O_F`-linearly for `F/ℚ_p` unramified, using `D_F(G) = D(G)[1/p]_{τ₀}`, an isocrystal for `φ^{[F:ℚ_p]}`.

Assume `G, G′` isoclinic over a perfect field `k`.

([CS17](#ref-cs17), §4.1, Lemma 4.1.7, p. 695; §4.1, Lemma 4.1.8, p. 695.)

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

### IG.0.16 Internal Hom: slopes and formal structure

<a id="ig-0-internal-hom-slopes"></a>

Let `G, G′` be isoclinic `p`-divisible groups over a perfect field `k`. `(1)` If the slope of `G` is strictly greater than that of `G′`, then `H_{G,G′} = 0`. `(2)` If the slopes are equal, `H_{G,G′}` is étale. `(3)` If the slope of `G` is strictly smaller than that of `G′, H_{G,G′}` is connected; if it has dimension `r`, the sheaf `𝓗om(G, G′)` is representable by `Spec k[[x₁^{1/p^∞}, …, x_r^{1/p^∞}]]/(x₁, …, x_r)`.

Assume `G, G′` isoclinic over a perfect field `k`.

([CS17](#ref-cs17), §4.1, Corollary 4.1.10, p. 696; §4.1, Corollary 4.1.11, p. 696.)

*Needs:* IG.0.

### IG.0.18b Fundamental representatives and realization

<a id="ig-0-fundamental-pel-representative"></a>

The representative of IG.0.18a can be chosen fundamental and minimal with its integral PEL structure. When `b` occurs in the special fibre of the global datum, its isomorphism class occurs there and its central leaf is a minimal EO stratum. Indeed the chosen `x` is fundamental, Nie Theorem 1.4 identifies its `K-σ`-class as minimal, and the integral PEL dictionary identifies this class with the entire structured `p`-divisible group, rather than its underlying unpolarized isocrystal. Starting at an existing point of the Newton stratum, clear denominators in a structure-preserving rational map to this lattice. Write its integral multiplier as `u·pᵉ`, with `u∈ℤ_p^×, e≥0`. Multiplication by `u` does not change a Cartier annihilator, so the kernel is maximal isotropic for the actual `pᵉ`-polarization on the abelian source. Apply the finite-flat quotient and principalization theorem A3.11 over the algebraically closed field `k`; the quotient has an actual principal polarization, whose `p`-divisible pairing matches the framing up to the allowed common unit `u`. The order action and prime-to-`p` level descend. This is the realization argument of Viehmann–Wedhorn Lemmas 8.5–8.6; the common unit and prescribed annihilator are essential, rather than an assertion that an arbitrary rational quasi-polarization is principal. Nie Corollary 1.6 identifies the resulting EO stratum.

Source: [Nie](#ref-nie15), Theorem 1.4 and Proposition 1.5, p.3, Corollary 1.6, p.4; [Viehmann–Wedhorn](#ref-vw), Lemmas 8.5–8.6, p.34. *Needs:* IG.0.18a, IG.0.9; AbelianSchemesAndArithmeticModuli A3.3, A3.11 (finite flat quotients and principal polarization descent over algebraically closed `k`). The construction and realization precede IG.2.12; its EO terminology and the central-leaf identification are applied only after IG.2.12 in IG.2.14.

**Checks.**

- The ordinary signed monomial lattice gives the ordinary minimal EO stratum; the basic rank-two lattice of IG.0.18a gives its distinct supersingular stratum.
- In a nonsplit unramified datum a Newton class can have several minimal integral representatives. The existence statement makes no uniqueness claim.
- A non-self-dual lattice is not principal merely because its rational isocrystal is admissible. The quotient uses the prescribed pairing and its Cartier annihilator.

### IG.0.19 Universal-cover automorphisms

<a id="ig-0-automorphism-group-of-universal-cover"></a>

This formal automorphism extension uses the supplied `J_b` of EndoscopicTransferAndUnitaryTraceComparison §7.5 as its locally profinite quotient.

For an unramified local PEL datum with `p`-divisible group `X_b` over `𝔽̄_p`, let `X̃_b = lim_{×p} X_b` be its universal cover. `Aut_G(X̃_b)` is the sheaf on `Nilp^{op}_{W(𝔽̄_p)}` with `Aut_G(X̃_b)(R) = {(α, β) : α ∈ Aut_{O_B}(X̃_{b,R}), β ∈ Aut(μ̃_{p^∞,R}), α respects the polarization up to β}`. It is representable by a formal scheme over `Spf W(𝔽̄_p)`, locally of the form `Spf W(R)` for a perfect ring `R`. Its group of `𝔽̄_p`-points (equivalently of `W(𝔽̄_p)`-points) is `J_b(ℚ_p)`, the self-quasi-isogenies of `X_b` respecting the extra structures.

Assume Unramified local PEL datum of type `(A)` or `(C)`; `X_b` chosen completely slope divisible.

([CS17](#ref-cs17), §4.2, Lemma 4.2.10, p. 703; §4.2, Definition 4.2.9, p. 703.)

The API:

- `AutUniversalCover`: The sheaf `Aut_G(X̃_b)` on `Nilp^{op}_{W(𝔽̄_p)}`.
- `AutUniversalCover.representable`: Formal representability, locally `Spf W(R)` with `R` perfect.
- `AutUniversalCover.points`: Its geometric points are `J_b(ℚ_p)`.
- `AutUniversalCover.rigid`: Bijective restriction across nilpotent thickenings.
- `AutUniversalCover.toJ`: The map to `J_b(ℚ_p)` of [IG.0.20](#ig-0-structure-of-automorphism-group).

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §7.5; IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; SchemeAndStackFoundations §§4.7–4.8; AdicSpacesPartIII `F0, R2`

**Checks.**

- For `X_b` isoclinic, `Aut_G(X̃_b) = J_b(ℚ_p)` is the constant locally profinite formal scheme `(d = 0)`.
- For the standard rank-two symplectic PEL datum `B=ℚ_p, V=ℚ_p²`, its standard alternating form, `O_B=ℤ_p, Λ=ℤ_p²` and `μ(t)=diag(t,1)`, with ordinary `X_b=μ_{p^∞}⊕ℚ_p/ℤ_p`, the group is `GSp₂=GL₂` and every fibre over `J_b(ℚ_p)=ℚ_p^××ℚ_p^×` is `Spf W(k)[[x^{1/p^∞}]]`.
- `Aut_G(X̃_b)` is not the automorphism group scheme `Aut(X_b)`: its `𝔽̄_p`-points are `J_b(ℚ_p)`, not the compact `Aut(X_b)(𝔽̄_p)`.
- The group of `𝔽̄_p`-points equals `J_b(ℚ_p)` of IG.0.1 for the isocrystal of `X_b`.

### IG.0.20 The automorphism fibres over `J_b`

<a id="ig-0-structure-of-automorphism-group"></a>

Regard the locally profinite set `J_b(ℚ_p)` as a formal scheme over `W(𝔽̄_p)` (sections over `U ⊂ J_b(ℚ_p)` are the continuous maps `U → W(𝔽̄_p)`). For unramified local PEL data of type `(A)` or `(C)` there is a natural map `Aut_G(X̃_b) → J_b(ℚ_p)` all of whose fibres are isomorphic to `Spf W(𝔽̄_p)[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]` with `d = ⟨2ρ, ν_b⟩, ρ` the half-sum of the positive roots.

Assume Unramified local PEL data of type `(A)` or `(C)`; `X_b` completely slope divisible.

([CS17](#ref-cs17), §4.2, Proposition 4.2.11, p. 704.)

*Needs:* IG.0.

### IG.0.21 Liftable automorphisms and finite-level torsors

<a id="ig-0-liftable-automorphisms"></a>

The isoclinic EL/PEL torsor statement extends EndoscopicTransferAndUnitaryTraceComparison §7.8's liftable finite-cover construction to the seminormal families below. On the slope-graded universal PEL family it is that supplied finite-cover functor, with inverse frames and the same deck quotient.

Let `k` be algebraically closed of characteristic `p` and `X/k` an isoclinic `p`-divisible group with extra structures of EL or PEL type. `(1)` For `m ≥ 1` let `Γ_m` be the group of automorphisms of `X[p^m]` commuting with the extra structures that lift to automorphisms of `X[p^{m′}]` for all `m′ ≥ m`; the finite étale group scheme `Γ_{m,k}` represents the functor of `T`-automorphisms of `X_T[p^m]` commuting with the extra structures that lift fppf locally to `X_T[p^{m′}]` for all `m′ ≥ m` (and one `m′` suffices). `(2)` Let `𝒳/k` be a seminormal scheme and `𝒢/𝒳` a `p`-divisible group with the same kind of extra structures, geometrically isomorphic to `X` at every point. Then the functor on `𝒳`-schemes `T` of isomorphisms `ρ_m : 𝒢[p^m] ×_𝒳 T ≅ X[p^m] ×_k T` compatible with the extra structures that lift fppf locally to isomorphisms of `p^{m′}`-truncations for all `m′ ≥ m` is representable by a `Γ_m`-torsor `J_m(𝒢/𝒳) → 𝒳`.

Assume `X` isoclinic; `𝒳` seminormal; `𝒢` geometrically isomorphic to `X` at all points.

([CSnc](#ref-csnc), §2.2, Proposition 2.2.3, p. 15; §2.2, Theorem 2.2.4, p. 15.)

The API: `liftableAutomorphismsPlain`, `liftableAutomorphisms`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §7.8; IG.0.

**Checks.**

- In the EL case with no additional tensors, `X=μ_{p^∞}` gives `Γ_m=(ℤ/p^m)^×`.
- For the unstructured étale group `X=(ℚ_p/ℤ_p)^h`, `Γ_m=GL_h(ℤ/p^m)`.
- For the constant family `𝒢=X×𝒳`, the identity trivializes the `Γ_m`-torsor.
- The ordinary nonisoclinic group `μ_{p^∞}⊕ℚ_p/ℤ_p` has infinitesimal automorphisms. The finite étale assertion here requires the isoclinic hypothesis; its slope pieces are treated separately.

### IG.0.26 Serre–Tate theory without noetherian hypotheses

<a id="ig-0-serre-tate-semi-abelian"></a>

Suppose `S` is a quotient of `S′` by a nilpotent ideal and `p` is nilpotent in `S′`. Use the arbitrary-ring `p`-divisible-group isogeny equivalence `universalCoverRigidity` from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.26 and the arbitrary-ring abelian equivalence `serreTate` from AbelianSchemesAndArithmeticModuli A4.9, including their abelian `p`-power-isogeny consequence. These equivalences are imported without new names.

Prove the semi-abelian extension: `(1)` Base change from `S′` to `S` is an equivalence on semi-abelian schemes that are global extensions of abelian schemes by split tori, with morphisms `Hom ⊗ ℤ[1/p]`. `(2)` Such extensions `G_{S′}` are equivalent to triples `(G_S, 𝒢_{S′}, ρ)` with `G_S` such an extension over `S`, `𝒢_{S′}` a `p`-divisible group over `S′` and `ρ : G_S[p^∞] ≅ 𝒢_{S′} ×_{S′} S`. Prove compatibility with the torus and abelian quotient, endomorphisms and the duality/pairing data on these pieces used in the PEL boundary charts. No noetherian hypothesis is imposed. This target owns the semi-abelian statements and their structure compatibility.

Assume `p` nilpotent in `S′`, kernel of `S′ → S` nilpotent.

([CSnc](#ref-csnc), §2.4, Theorem 2.4.1, p. 20; §2.4, Theorem 2.4.2, p. 21.)

*Needs:* AbelianSchemesAndArithmeticModuli A4.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.26, R07.1.

**Checks.**

- With torus rank zero, the triple equivalence is the imported abelian Serre–Tate equivalence.
- With abelian quotient zero and torus rank `r`, the split torus lifts uniquely and its `p`-divisible group is `μ_{p^∞}^r`.
- Distinct ordinary elliptic deformations over `k[ε]/ε²` have the same special fibre and can become isomorphic up to `p`-power isogeny. Integral reduction alone is not an equivalence: the triple retains the chosen `p`-divisible lift.

### IG.0.27 PEL Rapoport–Zink spaces

<a id="ig-0-pel-rapoport-zink-space"></a>

For an unramified local PEL datum `D^int` with `p`-divisible group `X_b, Ĕ` the completion of the maximal unramified extension of `E` and `O_Ĕ` its ring of integers, `𝔐_{D^int}` is the functor on `Nilp^{op}_{O_Ĕ}` (`O_Ĕ`-algebras `R` on which `p` is nilpotent) sending `R` to the isomorphism classes of pairs `(G, ρ)` with `G` a `p`-divisible group over `R` with `O_B`-action satisfying the determinant condition and a principal polarization whose Rosati involution is compatible with *, and `ρ : X_b ×_{𝔽̄_p} R/p → G ×_R R/p` an `O_B`-linear quasi-isogeny respecting the polarizations up to an automorphism of `μ̃_{p^∞,R/p}`. It is representable by a formal scheme over `Spf O_Ĕ` that locally admits a finitely generated ideal of definition, and it is formally smooth (Rapoport–Zink [RZ96, Thm 3.25, §3.82]). `J_b(ℚ_p)` acts by composition on `ρ`.

The action is `g·(G,ρ)=(G,ρ∘g⁻¹)`. Provide the adic generic fibre and the truncated reduced subspaces whose isogeny kernel lies in `X_b[p^m]`.

Also construct the unstructured deformation functor for an arbitrary `p`-divisible framing `Y/k`: omit the action, determinant and polarization conditions. Its formal representability and bounded-isogeny reduced truncations supply `M_Y^{0,d}` of IG.0.22; imposing compatible extra structures gives the structured loci.

Assume an unramified local PEL datum of type `(A)` or `(C)` (`p = 2` allowed without type `D`) for the structured functor; for the unstructured functor, `Y` is any `p`-divisible group over algebraically closed `k` of characteristic `p`.

([CS17](#ref-cs17), §4.2, Definition 4.2.1, p. 697; §4.2, Theorem 4.2.2, p. 698; [SW13](#ref-sw13), Definition 6.1.1 and Theorem 6.1.2, pp.54–55, for the unstructured formal space; [CSnc](#ref-csnc), §2.2, before Lemma 2.2.5, p.16, for its bounded-isogeny truncations.)

The API: `RZSpace`, `RZSpace.represents`, `RZSpace.formallySmooth`, `RZSpace.jAction`, `RZSpace.genericFibre`, `RZSpace.truncated`.

*Needs:* IG.0.1–IG.0.2a, IG.0.11, IG.0.18a, IG.0.19, IG.0.26; AbelianSchemesAndArithmeticModuli A4.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; SchemeAndStackFoundations §§4.7–4.8; AdicSpacesPartIII `F0, R2`

**Checks.**

- For the paired PEL datum `GL_n×𝔾_m` of type `(1,0,…,0)`, the basic formal space has components indexed by `ℤ×ℤ`, each `Spf W(k)[[u₁,…,u_{n−1}]]`. The EL `GL_n` datum has only the `ℤ` index.
- Multiplication by `p` is a positive-height quasi-isogeny, not an isomorphism; imposing isomorphisms changes the functor.
- For the structured PEL functor the formal dimension is `⟨2ρ,μ⟩`.
- The unstructured functor accepts `Y=μ_{p^∞}`, a height-one framing that has no principal polarization. Its formal dimension is zero.

### IG.0.22 Finite isomorphism loci in truncated RZ spaces

<a id="ig-0-truncated-rz-isomorphism-locus"></a>

Let `Y/k` be a `p`-divisible group with extra structures over an algebraically closed field `k`, and `M^{0,d}_Y` the reduced special fibre of the truncated Rapoport–Zink space of isogenies with kernel contained in `Y[p^d]`; let `H` be the universal `p`-divisible group over it. The subset `Z = {x ∈ M^{0,d}_Y : H_x̄ ≅ Y_x̄ compatibly with extra structures}` consists of finitely many points, all defined over `k`.

Assume `Y` need not be isoclinic.

([CSnc](#ref-csnc), §2.2, Lemma 2.2.5, p. 16.)

*Needs:* IG.0.26–IG.0.27; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.0.23 Isomorphism torsors

<a id="ig-0-isomorphism-torsors"></a>

The perfect-base isomorphism torsor specializes the one in EndoscopicTransferAndUnitaryTraceComparison §7.3. Its all-test-scheme form over regular bases below is an extension on the same isomorphism functor.

Let `X/k` be a `p`-divisible group with EL or PEL extra structure over algebraically closed `k` (not necessarily isoclinic), `Γ = lim_m Γ_m = Aut(X)(k)` the profinite group of its automorphisms with extra structure, and `Aut(X)` the group scheme of automorphisms with extra structure (in general highly non-reduced). Let `𝒢` be a `p`-divisible group with the same extra structure over a scheme `𝒳/k`, geometrically isomorphic to `X` at every point. `(1)` If `𝒳` is perfect, the functor on perfect `𝒳`-schemes `T` of isomorphisms `𝒢 ×_𝒳 T ≅ X ×_k T` is representable by a `Γ`-torsor `J(𝒢/𝒳) → 𝒳`. `(2)` If `𝒳` is regular, the functor on all `𝒳`-schemes `T` of such isomorphisms is representable by an `Aut(X)`-torsor over `𝒳`.

Assume `(1) 𝒳` perfect; `(2) 𝒳` regular; `𝒢` geometrically isomorphic to `X` with extra structures.

([CSnc](#ref-csnc), §2.2, Proposition 2.2.6, p. 17; §2.2, Proposition 2.2.7, p. 17.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.7–7.8; IG.0; Mathlib `PerfectRing`.

**Checks.**

- For the constant family, the isomorphism torsor is the automorphism torsor: `Γ` on perfect test schemes and `Aut(X)` on all test schemes over a regular base.
- For the unstructured ordinary group `X=μ_{p^∞}⊕ℚ_p/ℤ_p`, `Aut(X)` is nonreduced although `Γ=Aut(X)(k)` is profinite.
- A twist by a nontrivial `Γ`-torsor over a perfect base has no global isomorphism with the constant `X`; geometric fibrewise isomorphisms do not choose a section.

### IG.0.24 Central leaves

<a id="ig-0-central-leaf"></a>

Use EndoscopicTransferAndUnitaryTraceComparison §7.7's reduced structured central leaf. The names below alias its geometric-point, Newton-immersion, level and reduced-locus interfaces; IG.0.25 adds the dimension theorem.

Let `X` be a `p`-divisible group with `G`-structure over `k = 𝔽̄_p` (more generally with the extra structures of a PEL datum of type `(A)` or `(C)`, unramified at `p`, hyperspecial level). The central leaf `C^X ⊂ S_{K,k}` is the subset of points `x` such that `A[p^∞]_x̄ ≅ X ×_k k(x̄)` compatibly with the extra structures, for one (equivalently every) geometric point `x̄` over `x`. It is locally closed (closed in the Newton stratum `S^b` of `X`) and, with its reduced structure, a smooth subscheme of `S_{K,k}` (Mantovan [Man05, Prop. `1`]). It is stable under prime-to-`p` Hecke correspondences; unlike the Newton stratum and the Igusa variety, it depends on `X` within its isogeny class.

Assume PEL datum of type `(A)` or `(C)` unramified at `p` with hyperspecial level; `X` over `𝔽̄_p` with extra structures.

([CSnc](#ref-csnc), §2.3, Definition 2.3.1, p. 17; [CS17](#ref-cs17), §4.3, Definition 4.3.6, p. 716.)

The API:

- `centralLeaf`: The reduced locally closed `C^X⊂S_{K,k}`.
- `centralLeaf_smooth`: Smoothness over `k`.
- `centralLeaf_subset_newtonStratum`: `C^X` is closed inside its Newton stratum `S^b`.
- `mem_centralLeaf_iff`: Geometric structure-preserving isomorphism with `X`.
- `centralLeaf_hecke`: Preservation by prime-to-`p` Hecke correspondences.
- `centralLeaf_universal_iso`: Pointwise geometric isomorphisms give the [IG.0.23](#ig-0-isomorphism-torsors) construction.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §7.7; IG.0.

**Checks.**

- For `b` ordinary, `C^{X_b}` equals the ordinary Newton stratum.
- For `F` imaginary quadratic and `n = 1` and `b` basic, `C^{X_b}` is a finite set of supersingular points.
- In general `C^X ⊊ S^b`: for a non-ordinary, non-basic `b` with `d_b < dim S^b` the leaf is a proper closed subset of the stratum.
- `dim C^{X_b} = ⟨2ρ, ν_b⟩`.

### IG.0.25 The dimension of a central leaf

<a id="ig-0-central-leaf-dimension"></a>

For a PEL datum of type `(A)` or `(C)` unramified at `p` with hyperspecial level and `b ∈ B(G_{ℚ_p}, μ^{−1})`, every central leaf `C^{X}` with `X` in the isogeny class `b` is smooth of pure dimension `d_b = ⟨2ρ, ν_b⟩`, where `ν_b` is the Newton point and `ρ` the half-sum of positive roots. The Igusa dimension statement is IG.1.4a, after the tower constructions.

Assume PEL type `(A)` or `(C)`, unramified at `p`, hyperspecial level.

([ham15](#ref-ham15), Corollary 7.8 (2), p. 30 (arXiv:1312.0490v2); [CS17](#ref-cs17), §4.2, Remark 4.2.13, p. 708.)

*Needs:* IG.0.2, IG.0.12, IG.0.24.

**Checks.**

- The ordinary `GL₂` leaf has dimension `1`, from the dominant negative vector `(0,−1)`.
- The basic `GL₂` leaf has dimension `0`, from the vector `(−1/2,−1/2)`.
- For the split `GL₄` factor with Hodge multiplicities `(2,2)`, the ordinary leaf has dimension `4`.

### IG.0.28 Homomorphisms over valuation rings and normal domains

<a id="ig-0-berthelot-without-noetherian"></a>

`(1)` Let `V` be a valuation ring of characteristic `p` with fraction field `K`, and `G, H p`-divisible groups over `V` with constant Newton polygon. Then `Hom(G, H) → Hom(G_K, H_K)` is a bijection. `(2)` The same holds for an integral domain `R` of characteristic `p`, integrally closed in its fraction field `K`, in place of `V` (removing the noetherian hypothesis from Berthelot's theorem).

Assume Constant Newton polygon of `G` and `H` over `Spec V` (resp. `Spec R`).

([CS17](#ref-cs17), §4.2, Lemma 4.2.16, p. 710; §4.2, Remark 4.2.17, p. 710.)

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; Mathlib `ValuationRing`.

### IG.0.29 Constant Newton polygons over perfect rings

<a id="ig-0-constant-newton-polygon-over-perfect-rings"></a>

Let `R` be a strictly henselian perfect `𝔽_p`-algebra with residue field `k`, and choose an embedding `𝔽̄_p → R` for the constant-object assertion. In the isogeny categories, reduction `G ↦ G_k` identifies the constant-Newton-polygon `p`-divisible groups over `R` with all `p`-divisible groups over `k`. Each object `G` on the `R`-side is isogenous to `G₀ ×_{𝔽̄_p} R`, with `G₀` completely slope divisible over `𝔽̄_p`. Moreover there is a constant `c` depending only on the heights such that for every homomorphism `ψ_k : G_k → H_k` of such groups, `p^c ψ_k` lifts uniquely to `G → H`. In particular all automorphisms of `X_R` for `X` over `𝔽̄_p` are constant.

Assume `R` strictly henselian, perfect and of characteristic `p`; constant Newton polygon; a chosen `𝔽̄_p`-algebra structure for `G₀ ×_{𝔽̄_p} R`. Strict henselianity and perfectness allow such a choice, as in the proof of CS17 Lemma 4.3.15.

([CS17](#ref-cs17), §4.3, Lemma 4.3.15, p. 721; §4.3, Remark 4.3.16, p. 721.)

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; Mathlib `PerfectRing`.

### IG.0.30 The quasi-isogeny torsor

<a id="ig-0-quasi-isogeny-torsor"></a>

Let `S` be a scheme over `𝔽̄_p` and `X` a `p`-divisible group with PEL extra structures over `S` such that, for some `b ∈ B(G)`, all geometric fibres of `X` are quasi-isogenous to `X_b` compatibly with extra structures. Then there is a natural `J_b(ℚ_p)`-torsor over `S_proét` (a torsor under the sheaf of groups attached to the topological group `J_b(ℚ_p)`, in the sense of Bhatt–Scholze) whose fibre at a geometric point `x̄` is the set of quasi-isogenies `X_x̄ → X_b` compatible with extra structures; it depends only on `X` up to isogeny. If `S` is connected and locally topologically noetherian, it corresponds to a continuous homomorphism `π₁^proét(S, x̄) → J_b(ℚ_p)`. Applied to `A[p^∞]` over a Newton stratum `S^b`, this gives a `J_b(ℚ_p)`-torsor over `S^b`.

Assume All geometric fibres quasi-isogenous to `X_b` with extra structures.

([CS17](#ref-cs17), §4.3, Proposition 4.3.13, p. 720.)

*Needs:* IG.0; Mathlib `AlgebraicGeometry.Scheme.ProEt.topology`.

**Checks.**

- For the constant ordinary `GL₂` framing, the torsor is trivial under `J_b(ℚ_p)=(ℚ_p^×)^2`.
- For the basic slope-`1/2` framing, it is a torsor under `D^×`, with `D/ℚ_p` the quaternion division algebra.
- An ordinary fibre is not quasi-isogenous to a basic framing. A family changing Newton class does not meet the fixed-`b` hypothesis.

### IG.0.31 Harris–Taylor Newton strata at Drinfeld level

<a id="ig-0-drinfeld-level-newton-strata"></a>

For `n≥1` use the signature-`(1,n−1)` unitary datum, the split distinguished place `v₀` and the CM-type/place matching condition of Rapoport–Smithling–Zhang §4.3. After the indicated étale trivialization of `A₀[w₀^∞], H = Hom_{O_{F,w₀}}(A₀[w₀^∞], A[w₀^∞])` is a strict one-dimensional `O_{F,w₀}`-divisible group of height `n`. Work over an unramified extension of the local reflex base when regularity of the positive-level model is asserted. The signature and matching hypotheses are part of this target, not consequences of the balanced datum used elsewhere.

Define a level-`πᵐ` Drinfeld structure to be an `O_{F,w₀}`-linear map `α:(π⁻ᵐO/O)ⁿ→H[πᵐ]` that is a full set of sections: after every base change, the characteristic polynomial of multiplication by any function on `H[πᵐ]` is the product of its values on these sections, counted with multiplicity. These are norm equations in the finite flat scheme `H[πᵐ]ⁿ`. They define the finite Drinfeld cover `Y_m→Y_0` and recover the principal-congruence generic-fibre cover. They do not require the sections to be distinct in characteristic `p`.

Import the strict formal `O`-module deformation rings, full Cartier-divisor Drinfeld levels and their regular finite flat extensions from EndoscopicTransferAndUnitaryTraceComparison §10.2. Apply this on the connected factor of height `g` and add the `n−g` extension parameters. Serre–Tate identifies these completed local rings with the PEL deformation problems, and formal étale descent glues the local finite covers to the global Drinfeld model. Regularity is checked after the stated unramified reflex base change. This target constructs the global PEL/stratum interface; the local deformation construction is imported.

For `0 ≤ j ≤ n−1` define the reduced closed locus `Y_{m,j}` by formal `O`-height at least `j+1`, equivalently étale `O`-height at most `n−1−j`; put `Y^∘_{m,j}=Y_{m,j}∖Y_{m,j+1}`, with `Y_{m,n}=∅`. Prove `Y^∘_{m,j}` smooth of dimension `n−1−j`, using the deformation parameters with the first `j` coefficients zero and the next invertible. `Y_{m,0}` is the whole reduced special fibre; `Y^∘_{m,0}` is its ordinary open part.

The API includes `DrinfeldStratum`, `DrinfeldStratum.closed`, `DrinfeldStratum.smooth`, `DrinfeldStratum.hecke`, `DrinfeldStratum.levelZero` for the reduced height loci and their open differences. The model construction provides `drinfeldLevel`, `drinfeldLevel.fullSet`, `drinfeldIntegralModel`, `drinfeldIntegralModel_finiteFlat`, `drinfeldIntegralModel_regular`, `HarrisTaylorNewtonStratum`, `HarrisTaylorNewtonStratum.closed`, `HarrisTaylorNewtonStratum.dim`, `HarrisTaylorNewtonStratum.smooth`. Restriction in `m`, change of Drinfeld basis and the tame Hecke correspondences commute with the defining norm equations and the height stratification.

Source: [Mantovan](#ref-man08), §2.1.3, pp.3–4, Definition 2 and Proposition 3, pp.4–5, §2.2.3 and Proposition 4, p.6, Proposition 8, pp.8–9, Proposition 11, pp.10–12; [Rapoport–Smithling–Zhang](#ref-rsz20), §4.3, matching condition (4.19), level datum (4.21) and Theorem 4.5, pp.19–20; [Li–Liu I](#ref-lil21), §7.2, pp.33–35, including footnotes `12`–`14`. Mantovan's deformation calculation supplies the local proof used here. *Needs:* IG.0.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2 (strict formal modules and deformation theory); EndoscopicTransferAndUnitaryTraceComparison §10.2 (Drinfeld deformation rings and regular level maps); AbelianSchemesAndArithmeticModuli A4; PELModuli M0–M3.

**Checks.**

- `n=1` has its sole stratum of dimension `0`. For `n=2` the ordinary open stratum has dimension `1` and the closed supersingular locus `j=1` has dimension `0`. `Y_{m,0}` is not the ordinary open stratum.
- On a geometric connected group all sections can be zero and still form a full set with the required multiplicities. Requiring distinct sections would delete the supersingular fibre.
- At `m=0` the level cover is the identity. At positive `m` its generic fibre is étale, whereas the special-fibre map need not be étale.
- For an unmatched CM type the strict dimension-one module used here is not supplied; for a ramified enlargement of the reflex base regularity is not inferred.

### IG.0.32 Constructibility of isomorphism loci

<a id="ig-0-isomorphism-locus-constructible"></a>

Let `𝒢` be a `p`-divisible group with PEL extra structure over a scheme `T` of finite type over an algebraically closed field `k` of characteristic `p`, and `Y` a `p`-divisible group with the same kind of structure over `k`. The set of points `t ∈ T` with `𝒢_t̄ ≅ Y ⊗ k(t̄)` (compatibly with the extra structure) is constructible, and it is closed in any locally closed subset of `T` on which the Newton polygon of `𝒢` is constant.

Assume `T` of finite type over `k`; extra structures of PEL type.

([CSnc](#ref-csnc), §2.2, proof of Lemma 2.2.5, p. 17; [man05](#ref-man05), Proposition 1, §3, p. 7 of the Caltech preprint (proof p. 8).)

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2

### IG.0.33 Refined Drinfeld strata and their closures

<a id="ig-0-refined-drinfeld-strata"></a>

On the reduced locus of constant étale `O`-height `h=n−1−j`, refine the Drinfeld stratum by the kernel `M` of the induced surjection `(π⁻ᵐO/O)ⁿ→H^ét[πᵐ]`. Here `M` is a free direct summand of `rank n−h`. Define the closed component labelled `M` by the equations `α|_M=0` on the reduced height-at-most-`h` locus. Its open height-`h` part is the corresponding refined stratum. With labels viewed in the same full level module, degeneration enlarges the kernel: the reduced closure is the union of refined strata labelled `M′` with `M⊂M′`. Keep the reduced structure; the unreduced Drinfeld equations can have multiplicities.

The deformation quotient for height at most `h` has the first `n−h` formal coefficients zero. Mantovan's level coordinates then identify the completed local rings of the closed `M`-component as regular power-series rings in `h` variables. Consequently each such reduced closure is smooth of dimension `h`. Under the compact signature-`(1,n−1)` global hypotheses it is also proper, since it is closed in the projective level model. Neither the local deformation theorem nor smoothness alone gives properness in a noncompact model.

The API includes `RefinedStratum`, `RefinedStratum.closure`, `RefinedStratum.closure_eq`, `RefinedStratum.decomp`, `RefinedStratum.hecke`, with reduced closures and the kernel-containment direction just stated. It also provides `refinedDrinfeldStratum`, `refinedDrinfeldStratum_label`, `refinedDrinfeldClosure`, `refinedDrinfeldClosure_eq_union`, `refinedDrinfeldClosure_smooth`, `refinedDrinfeldClosure_proper`. Source: [Mantovan](#ref-man08), §3.1, Proposition 8, pp.8–9; §3.2, Remark 10 and Propositions 11–12, pp.10–12; §4.2.4; [Li–Liu II](#ref-lil22), §4.3, pp.58–59. *Needs:* IG.0.31, IG.0.32; SchemeAndStackFoundations Layer 0 (completed local regularity); PELModuli M3.

**Checks.**

- `h=0` gives `M` equal to the entire `rank-n` level module and a zero-dimensional closed component.
- At `h=n−1` the ordinary kernel has `rank 1`. In its supersingular specialization the kernel grows, so `M⊂M′`, not the reverse.
- Two labels of the same rank that differ give disjoint open refined strata; their closures can meet along a larger kernel.
- Properness requires the compact global model. The open ordinary stratum of a modular curve is not proper.

### Examples

For imaginary quadratic `F, n = 1` and `p` split, `G_{ℚ_p} ≅ GL_2(ℚ_p) × ℚ_p^×` and `B(G_{ℚ_p}, μ⁻¹)` has two classes: the ordinary one, with `d_b = 1`, whose central leaf is the open ordinary stratum of the modular-type curve, and the basic one, with `d_b = 0`, whose leaf is a finite set of supersingular points. In the same case the operator algebra at a split `q` contains `T_{1,v}, T_{2,v}` and the inverse `T_{2,v^c}` of `T_{2,v}`, while the full algebra contains in addition the similitude unit `U_q`, which restriction to `G⁰` cannot see. For the ordinary class the internal `Hom` from `μ_{p^∞}` to `ℚ_p/ℤ_p` vanishes and the one from `ℚ_p/ℤ_p` to `μ_{p^∞}` is `μ_{p^∞}`, so the fibres of `Aut_G(X̃_b)` over `J_b(ℚ_p) = GL_1(F ⊗ ℚ_p) × ℚ_p^×` are one-dimensional perfectoid formal discs `Spf W(k)[[x^{1/p^∞}]]`, matching `d_b = 1`.

### Dependencies

ReductiveGroupsPartII, AdelicAlgebraicGroups (Layers 1 and `4`) and SmoothRepresentationsOfLocalGroups (SR.1, SR.4); Tau Ceti's Hecke rings and anti-involutions; PELModuli M0–M3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6; AbelianSchemesAndArithmeticModuli A4; SchemeAndStackFoundations §§4.7–4.8; AdicSpacesPartIII `F0, R2`.

## Layer IG.1: Igusa towers, actions and cohomology

### IG.1.1 Perfect Igusa varieties

<a id="ig-1-perfect-igusa-variety"></a>

Use the perfect isomorphism torsor of EndoscopicTransferAndUnitaryTraceComparison §7.3 on its central leaf of §7.7. The `Igusa` API below consists of aliases for that common carrier, its quasi-isogeny description and its actions.

Let `X` be a `p`-divisible group with `G`-structure over `k = 𝔽̄_p` (more generally, with the extra structures of a PEL datum of type `(A)` or `(C)`, unramified at `p`, with hyperspecial level), lying in the isogeny class `b`, and `C^X ⊂ S_{K,k}` its central leaf. The Igusa variety `Ig^X → C^X` is the scheme parametrizing isomorphisms `ρ : A[p^∞] ≅ X` of `p`-divisible groups with `G`-structure (respecting the polarizations up to `ℤ_p^×`). `(1)` It is representable by an `Aut(X)`-torsor over `C^X, Aut(X)` the (generally non-reduced) group scheme of automorphisms of `X` with `G`-structure; its restriction to perfect schemes is a pro-étale `Γ_X`-torsor over `(C^X)_perf, Γ_X = Aut(X)(k)` profinite. `(2) Ig^X` is perfect. `(3)` Equivalently (CS17 Lemma 4.3.4), `Ig^X(R)` is the set of pairs `(A, ρ̃)` with A an abelian variety with `G`-structure over `R` up to `p`-power isogeny and `ρ̃ : A[p^∞] → X ×_k R` a quasi-isogeny respecting the extra structures; hence the formal group `Aut_G(X̃)` acts on `Ig^X` through `ρ̃`, extending the action of `Aut(X)`, and in particular `J_b(ℚ_p) = Aut_G(X̃)(k)` acts on `Ig^X`. `Ig^X` depends only on the isogeny class `b (Ig^b := Ig^{X_b})`, and `G(𝔸_f^p)` acts on the tower `(Ig^X_{K^p})_{K^p}` by prime-to-`p` Hecke correspondences, commuting with `J_b(ℚ_p)`.

Assume PEL datum of type `(A)` or `(C)`, unramified at `p`, hyperspecial `K_p` (for the quasi-split unitary datum: `p ∤ NΔ_F`). `K^p` sufficiently small (neat).

([CSnc](#ref-csnc), §2.3, Corollary 2.3.2, p. 18; [CS17](#ref-cs17), §4.3, Corollary 4.3.5, p. 715; §4.3, Lemma 4.3.4, p. 715.)

The API: `Igusa`, `Igusa.isTorsor`, `Igusa.isPerfect`, `Igusa.isoUpToIsogeny`, `Igusa.jAction`, `Igusa.heckeAction`, `Igusa.ofIsogeny`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.7; IG.0; Mathlib `PerfectRing`.

**Checks.**

- For ordinary `b` and `p` split in `F, Γ_b=GL_n(O_F⊗ℤ_p)×ℤ_p^×`.
- For imaginary quadratic `F, n=1` and basic `b`, the tower is a profinite torsor over a finite central leaf.
- An infinite `Γ_b` gives an Igusa variety that is not of finite type.
- Frobenius on `Ig^b` is an isomorphism.

### IG.1.2 Isogeny invariance and leaf correspondences

<a id="ig-1-igusa-isogeny-invariance"></a>

These maps are the isogeny-invariance maps of the supplied perfect torsor, on the same central-leaf system.

An isogeny `φ : X → X′` of `p`-divisible groups with `G`-structure (compatible with the extra structures up to a common similitude scalar) induces an isomorphism `Ig^X ≅ Ig^{X′}`, equivariant for `J_b(ℚ_p) × G(𝔸_f^p)` after identifying `J_b(ℚ_p)` for `X` and `X′` through `φ`. Hence the perfect Igusa variety `Ig^b` depends only on the isogeny class `b`, and there are pro-finite correspondences `C^X ← Ig^X ≅ Ig^{X′} → C^{X′}` between different leaves in the same Newton stratum. This invariance is for the open Igusa variety; the toroidal statement ([IG.2.11](#ig-2-toroidal-isogeny-invariance)) needs separate hypotheses.

Assume `φ` compatible with the extra structures (`O_F`-linear, polarizations up to a scalar).

([CSnc](#ref-csnc), §2.3, after Corollary 2.3.2, p. 18.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.7; IG.1.

### IG.1.3 Mantovan’s finite-level Igusa varieties

<a id="ig-1-mantovan-igusa-variety"></a>

Use the finite covers and transitions of EndoscopicTransferAndUnitaryTraceComparison §7.8, and its monoid and level maps of §7.9. `MantovanIgusa` and its API below are specialization aliases: the displayed frames are `ρ_i=j_i⁻¹`, so the common multiplier is inverted. The same inversion converts the deck action and retains the supplied level kernels.

Let `X = ⊕_{i=1}^r X_i` be completely slope divisible with `G`-structure over `k`, with isoclinic `X_i` of strictly decreasing slopes, and `𝒢 = A[p^∞]|_{C^X}`, which is completely slope divisible with slope filtration `𝒢₁ ⊂ … ⊂ 𝒢_r` and graded pieces `𝒢^i`. The (pro-)Igusa variety `Ig^X_Mant → C^X` parametrizes over a `C^X`-scheme `T` tuples `(ρ_i)_{i=1}^r` of isomorphisms `ρ_i : 𝒢^i ×_{C^X} T ≅ X_i ×_k T` compatible with the `O_F ⊗ ℤ_p`-actions and commuting with the polarizations `𝒢^i → (𝒢^j)^∨` `(λ_i + λ_j = 1)` up to an element of `ℤ_p^×(T)` independent of `i`. For `m ≥ 0, Ig^X_{Mant,m}` parametrizes isomorphisms `ρ_{i,m} : 𝒢^i[p^m] ×_{C^X} T ≅ X_i[p^m] ×_k T` that lift fppf locally to every `m′ ≥ m` and respect the extra structures up to `(ℤ/p^m)^×`. Then `Ig^X_{Mant,m} → C^X` is a finite étale Galois cover with group `Γ_{m,X}` (by [IG.0.21](#ig-0-liftable-automorphisms)), the transition maps are finite étale, and `Ig^X_Mant = lim_m Ig^X_{Mant,m}` is a pro-finite étale `Γ_X`-cover of `C^X`. Each `Ig^X_{Mant,m}` is smooth over `k` of dimension `d_b`. The monoid action in the API uses Mantovan’s right-action convention on the inverse trivializations `X_i→𝒢^i`; the perfect Igusa action `ρ↦jρ` is a left action. Thus source `δ` acts through `j=δ^{-1}` after perfection.

The right-action monoid `S_b` consists of `δ` with `δ⁻¹` an isogeny and `ker[p^{f_i}]⊆ker(δ_i⁻¹)⊆ker[p^{e_i}]` on decreasing slope pieces, with `f_i` maximal, `e_i` minimal and `f_{i−1}≥e_i`. It contains `Γ_b, p⁻¹` and inverse slope Frobenius. Put `e(δ)=e_1(δ)`. For `m≥e(δ)`, construct `r_δ:Ig_{Mant,m}→Ig_{Mant,m−e(δ)}` and prove `proj_{m−e(δ)}∘r_δ^{pro}=r_δ∘proj_m`. This is level loss, not an action on a fixed finite level.

Assume `X` completely slope divisible with `G`-structure; `C^X` the central leaf (smooth, so seminormal).

([CSnc](#ref-csnc), §2.3, Definition 2.3.5, p. 19; [CS17](#ref-cs17), §4.3, Remark 4.3.7, p. 716; [shi09](#ref-shi09), Definition 5.3, §5, p. 16 of the Berkeley preprint; [man05](#ref-man05), Proposition 4, §4, p. 11 of the Caltech preprint; §4, definition of `S_b` on author-copy pp.11–12; Lemma 5 and following paragraph p.12; Lemma 6 p.13.)

The API: `MantovanIgusa`, `MantovanIgusa.finiteEtale`, `MantovanIgusa.transition`, `MantovanIgusa.smooth`, `MantovanIgusa.pro`, `MantovanIgusa.monoidAction`, `MantovanIgusa.levelLoss`, `MantovanIgusa.levelAction`, `MantovanIgusa.monoidAction_toLevel`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.8–7.9; IG.0.

**Checks.**

- For imaginary quadratic `F` and `n=1` the ordinary level-one Igusa curve has group `(O_F/p)^××(ℤ/p)^×`, including the similitude factor.
- Level zero is the central leaf.
- Trivializing all `A[p^m]` gives a different functor: it need not be finite étale.
- The level-`m` group is the image of `Aut(X_b)` on `⊕_i X_i[p^m]`.

### IG.1.4 Perfection of Mantovan’s tower

<a id="ig-1-perfection-of-mantovan"></a>

`perfectionOfMantovan` denotes the supplied `IgusaRational.perfection` map of EndoscopicTransferAndUnitaryTraceComparison §7.3. Its inversion and left/right action dictionary is the one used below and in the rational cohomology of §7.10.

For completely slope divisible `X_b` in the isogeny class `b`, the natural map `P:Ig^b→Ig^b_Mant=lim_m Ig^b_{Mant,m}` identifies the perfect scheme `Ig^b` with the perfection of `Ig^b_Mant`. Consequently `H^i(Ig^b,ℤ/ℓ^n)=colim_m H^i(Ig^b_{Mant,m},ℤ/ℓ^n)` and `H^i_c(Ig^b,ℤ/ℓ^n)=colim_m H^i_c(Ig^b_{Mant,m},ℤ/ℓ^n)` for `ℓ≠p`. Write `a_j` for the perfect left action `ρ↦jρ` and `r_δ` for Mantovan’s source right action of `δ∈S_b`. The geometric compatibility is `P∘a_{δ^{-1}}=r_δ∘P`. Using inverse pullback `a_{j^{-1}}^*` to turn a geometric left action into a left action on cohomology, the resulting `J_b(ℚ_p)`-cohomology action agrees with Mantovan’s action `r_δ^*` on `S_b`.

Assume `X_b` completely slope divisible; `ℓ ≠ p`.

([CS17](#ref-cs17), §4.3, Proposition 4.3.8, p. 717; [CSnc](#ref-csnc), §2.3, Remark 2.3.7, p. 20; [man05](#ref-man05), §4, Lemma 5 p.12 and the cohomology action on pp.13–14 of the author copy.)

The API: `perfectionOfMantovan`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.10; IG.1; IG.0.

### IG.1.4a Dimensions of the Igusa towers

<a id="ig-1-igusa-dimension"></a>

For the unramified PEL datum of type `(A)/(C)` with hyperspecial level, choose a completely slope divisible framing `X_b` in class `b`. Each finite-level Mantovan Igusa variety has pure dimension `d_b=⟨2ρ,ν_b⟩`: its map to the smooth central leaf is finite étale. The inverse-limit tower and its perfection `Ig^b` have the same dimension, by finite surjective transition maps and invariance under perfection. Isogeny invariance gives this dimension for the perfect Igusa variety attached to any structured framing in class `b`.

Source: [CSnc](#ref-csnc), §2.3, Definition 2.3.5, p.19, and §2.7, p.33; [CS17](#ref-cs17), §4.3, Proposition 4.3.8, p.717. *Needs:* IG.0.25, IG.1.1–IG.1.4.

**Checks.**

- The ordinary `GL₂` tower has dimension `1` at every finite level and after perfection.
- A nonempty basic `GL₂` Igusa variety is zero-dimensional, even when its profinite fibre is infinite.
- An infinite profinite level group does not make the Igusa variety finite type; dimension `d_b` is independent of that finiteness property.

### IG.1.5 Faithful flatness of `Ig^b→C^b`

<a id="ig-1-igusa-faithfully-flat"></a>

This extends the supplied perfect-torsor comparison to the fpqc torsor over the unperfected central leaf; the space and its frame functor remain those of IG.1.1.

The map `Ig^b → C^b` is faithfully flat. Since it is a quasi-torsor under the group scheme `Aut(X_b)` of automorphisms of `X_b` respecting the extra structures, it is an fpqc `Aut(X_b)`-torsor. This torsor is distinct from the pro-étale `Γ_X`-torsor `Ig^b → (C^b)_perf: Aut(X_b)` is highly non-reduced (like `Spec k[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]/(x₁, …, x_d)`) when `X_b` is not isoclinic, while `Γ_X = Aut(X_b)(k)` is profinite.

Assume `X_b` completely slope divisible.

([CS17](#ref-cs17), §4.3, Corollary 4.3.9, p. 718.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.7; IG.1; IG.0.

### IG.1.6 Group actions, scalar kernel and stabilizers

<a id="ig-1-igusa-group-actions"></a>

Use the commuting tower actions, deck kernels and scalar kernel of EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.8–7.10, in the inverse-frame convention of IG.1.4. The API below records these actions and their level quotients on that same tower.

Let `Ig^b_{K^p}` be the perfect Igusa variety at prime-to-`p` level `K^p⊂G(𝔸_f^p)` and `Ig^b_∞=lim_{K^p}Ig^b_{K^p}`. Use the geometric left action of `J_b(ℚ_p)×G(𝔸_f^p): (j,h)` sends `(A,ρ̃,η)` to `(A,j∘ρ̃,η∘h^{-1})` in the moduli description up to `p`-power isogeny. The finite Hecke correspondence labelled `g` in [IG.1.1](#ig-1-perfect-igusa-variety) uses `η↦η∘g`; the left tower action at `h` therefore uses the correspondence labelled `h^{-1}`. The action is continuous in the tower sense: for each compact open `K^p` and `m, ker(Γ_{X_b}→Γ_{m,X_b})×K^p` fixes the corresponding finite-level projection. The diagonally embedded scalars `ℤ[1/p]^×={±p^e}` act trivially: `(z,z)` sends `(ρ̃,η)` to `(zρ̃,ηz^{-1})`, and `[z^{-1}]:A→`A identifies this pair with the original one in the moduli problem up to `p`-power isogeny. Thus the action factors through the quotient by this diagonal subgroup; no faithfulness of that quotient action is claimed. On cohomology inverse pullback gives a smooth left `J_b(ℚ_p)×G(𝔸_f^p)`-representation.

Provide the level quotient `Ig^b_{K^p}=Ig^b_∞/K^p`. Projection stabilizers are open; point stabilizers need not be open.

Assume `K^p` neat; `ℓ ≠ p` for the statements on cohomology.

([CS17](#ref-cs17), §4.3, after Proposition 4.3.8, p. 718; [cs17](#ref-cs17), Definition 4.3.1 and Lemma 4.3.4, published pp.715–716; [man05](#ref-man05), §4, prime-to-`p` Hecke action on author-copy p.13.)

The API: `IgusaTower.action`, `IgusaTower.stabilizer_open`, `IgusaTower.levelQuotient`, `IgusaTower.globalUnits_trivial`, `IgusaTower.hecke_compat`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.8–7.10; IG.1.

**Checks.**

- For ordinary `b` and `p` split in `F, J_b(ℚ_p)=GL_n(F⊗ℚ_p)×ℚ_p^×`.
- For neat normal tame `K^p⊂K^{p′}`, the transition is finite étale Galois with group `K^{p′}/K^p`; equal levels give the identity.
- The scalar pair `(p,p)` fixes every point.
- The induced cohomology representation is smooth.

### IG.1.7 Igusa cohomology complexes

<a id="ig-1-igusa-cohomology"></a>

The torsion and integral complexes below extend EndoscopicTransferAndUnitaryTraceComparison §7.10's rational cohomology on its finite covers. After tensoring the integral complex with `ℚ_ℓ` and extending scalars, identify it with that supplied rational complex; the level pullbacks, perfection comparison and inverted action of IG.1.4 give the identification before taking alternating classes. Thus the rational trace input acts on the rationalization of these complexes.

For `ℓ ≠ p` and `Λ ∈ {ℤ/ℓ^n, 𝔽_ℓ, ℤ_ℓ, ℚ_ℓ, ℚ̄_ℓ}`, define `RΓ_c(Ig^b_∞, Λ) := colim_{K^p, m} RΓ_c(Ig^b_{Mant,K^p,m}, Λ)` and `RΓ(Ig^b_∞, Λ) := colim_{K^p, m} RΓ(Ig^b_{Mant,K^p,m}, Λ)` (first define `ℤ_ℓ`-cohomology at each finite level by the derived limit over `n` of the torsion coefficients; for `ℚ_ℓ` then tensor with `ℚ_ℓ`, and for `ℚ̄_ℓ` extend scalars from `ℚ_ℓ`; finally take the geometric-level colimit), with transition maps the pullbacks along the finite étale transition maps. They are complexes of smooth `Λ[J_b(ℚ_p) × G(𝔸_f^p)]`-modules; at each finite level `H^i_c(Ig^b_{Mant,K^p,m}, Λ)` is finitely generated over `Λ` and vanishes outside `[0, 2d_b]`. Coefficient change holds: `RΓ_c(·, ℤ/ℓ^n) ⊗^L_{ℤ/ℓ^n} 𝔽_ℓ ≅ RΓ_c(·, 𝔽_ℓ)`. The integral complex is defined by this colimit; no rational virtual-character formula enters its definition. The full algebra `𝕋^S_full` of IG.0.4 (`S` ⊃ `{p, ℓ} ∪` bad primes) acts through the `G(𝔸_f^S)`-action, hence so does the operator algebra `𝕋^S`, and `H^i(Ig^b, 𝔽_ℓ)_𝔪` denotes the localization at a maximal ideal `𝔪` of either ring at fixed tame level `K^p(N)`. With torsion coefficients the cohomology at fixed tame level is the colimit over `m` of finite Hecke modules, so it is locally finite and IG.0.5 relates the two localizations.

The map `RΓ_c→RΓ` is equivariant for the commuting actions and Hecke localization.

Assume `ℓ ≠ p`; `K^p` neat.

([CSnc](#ref-csnc), §2.8, Proposition 2.8.2, p. 34; [CS17](#ref-cs17), §4.3, after Proposition 4.3.8, p. 718.)

The API: `IgusaCohomology.compactSupport`, `IgusaCohomology.ordinary`, `IgusaCohomology.smooth`, `IgusaCohomology.finite_level`, `IgusaCohomology.changeCoeff`, `IgusaCohomology.heckeAction`, `IgusaCohomology.forgetToCompact`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.8–7.10; IG.1; EtaleCohomologyFoundations §§`F`.0–`F`.3; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.0d

**Checks.**

- Over a finite basic central leaf, `H_c` is zero outside degree zero; `H_c^0` is smoothly induced from the trivial representation.
- For ordinary finite levels of dimension `d, H_c^i=0` for `i>2d`.
- The alternating virtual class does not determine the graded cohomology.
- Perfect Igusa cohomology is the colimit of the Mantovan-level cohomologies.

### IG.1.8 Alternating cohomology and its `S`-unramified part

<a id="ig-1-alternating-igusa-cohomology"></a>

Use the rational alternating class of EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.10, identified with the rationalization of IG.1.7 by its coefficient comparison. `AltIgusaCohomology` and its trace and unramified-part APIs below alias this supplied rational object and its character-theoretic operations.

Fix `b` and `X_b`. Define `[H_c(Ig^b, ℚ̄_ℓ)] := Σ_k (−1)^k colim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ) ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p))`, a virtual admissible representation: every `π ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p))` is a possibly infinite sum `Σ n_i π_i` of irreducibles such that for each compact open `K` only finitely many `i` have `n_i ≠ 0` and `π_i^K ≠ 0`. For a finite set `S` of places containing `p, ∞` and the ramified places and `K^S = ∏_{q∉S} K_q` hyperspecial, `π^{S-ur} := Σ_{i : π_i^{K^S} ≠ 0} n_i π_i`. The trace pairing with `C^∞_c(G(𝔸_f^p) × J_b(ℚ_p))` determines an element of `Groth` by its traces; the `S`-unramified part carries an action of the full algebra `𝕋^S_full` through characters.

Assume `ℓ ≠ p`; each `H^k_c` at each finite level is finite-dimensional, so the limits are admissible.

([CS17](#ref-cs17), §5.2, p. 731.)

The API: `AltIgusaCohomology`, `AltIgusaCohomology.admissible`, `AltIgusaCohomology.trace`, `AltIgusaCohomology.unramifiedPart`, `AltIgusaCohomology.ext_trace`.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.3, 7.10; IG.1; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.0d

**Checks.**

- For a finite basic central leaf the virtual class is the actual `H_c^0` representation.
- Its trace is additive and the zero class has trace zero.
- Equal multiplicities in adjacent degrees cancel in the virtual class.

### IG.1.9 Harris–Taylor Igusa varieties of the first kind

<a id="ig-1-harris-taylor-igusa-varieties"></a>

On the reduced smooth Newton locus of constant étale `O`-height `h=n−1−j` in IG.0.31, define `I_{m,h}^{(1)} = Isom_O((π⁻ᵐO/O)ʰ,H^ét[πᵐ])`. This is the finite étale `GL_h(O/πᵐ)`-torsor of trivializations of the étale quotient. For a fixed kernel label `M` and a chosen quotient map `p_M:(π⁻ᵐO/O)ⁿ→(π⁻ᵐO/O)ʰ`, its map to the corresponding reduced refined Drinfeld component is obtained by composing `p_M`, the trivialization and the relative `q`-Frobenius of exponent `(n−h)m`, where `q` is the residue cardinality of `O`. Writing `F_S` for `q`-Frobenius, it covers `F_S^{(n−h)m}` on the base `S`; it is an isomorphism of `k`-schemes in Mantovan's setting, not an `S`-isomorphism over the identity. Perfection removes this distinction. The finite level and the Frobenius exponent must remain in the comparison before perfection.

*Proof sketch.* Over a reduced base with constant height, the full-set criterion of IG.0.31 says exactly that the kernel on the étale quotient is a direct summand `M` and its restriction is a full generator of the formal part. Frobenius of exponent `(n−h)m` kills that formal part, leaving the displayed étale trivialization after the base Frobenius. The inverse is supplied by Mantovan Proposition 6, rather than a chosen splitting of `H` over `S`. The deeper Mantovan tower trivializes the liftable slope-graded torsion, so forgetting the connected data gives the first-kind tower and the prescribed finite group action.

The API includes `IgusaFirstKind`, `IgusaFirstKind.finiteEtale`, `IgusaFirstKind.stratum_decomp`, `IgusaFirstKind.mantovanCover`; the decomposition includes the base Frobenius. It also provides `FirstKindIgusa`, `FirstKindIgusa.finiteEtale`, `FirstKindIgusa.galois`, `FirstKindIgusa.toRefinedDrinfeld`, `FirstKindIgusa.baseFrobenius`, `FirstKindIgusa.perfectionComparison`, `FirstKindIgusa.fromMantovan`. Source: [Mantovan](#ref-man08), Definition 5, p.7, Proposition 6 and Corollary 7, pp.7–8; §4.2.4; [Li–Liu I](#ref-lil21), §7.2, p.35, footnote `15`. *Needs:* IG.0.31, IG.0.33, IG.1.3–IG.1.4; SchemeAndStackFoundations §1.15 (finite étale isomorphism torsors).

**Checks.**

- `m=0` gives the identity cover and Frobenius exponent `0`.
- `h=0` gives the trivial `GL_0` torsor, although the Drinfeld formal level still has multiplicities before reduction.
- For `n=2,h=1,m=1` the base map is `q`-Frobenius `F_S`, not the identity; the two covers have different degrees over `S` before this Frobenius is included.
- Perfection makes `F_S` invertible. It does not justify identifying the original finite-level `S`-schemes.

### IG.1.10 Smooth closures of refined strata

<a id="ig-1-refined-strata-closures-smooth"></a>

For `m ≥ 1, 0 ≤ h ≤ n − 1` and `M ∈ 𝔖^h_m`, the reduced `closure Y^[M]_m` is smooth over `k` of pure dimension `h`, and proper under the compact global hypotheses of IG.0.33 (Mantovan [Man08, Prop. `12`]), and `Y^(M)_m` is isomorphic as a `k`-scheme (not over `Y^(h)_0`) to the Harris–Taylor Igusa variety of the first kind `I^h_m`. Both `h` here and the second index of `I^(1)_{m,h}` in [IG.1.9](#ig-1-harris-taylor-igusa-varieties) are étale height: `I^h_m ≅ I^(1)_{m,h}`. The separate Newton-stratum index of IG.0.31 is `j=n−1−h`, the formal height minus one. The comparison with the refined Drinfeld component retains the base Frobenius `F_S^{(n−h)m}` of IG.1.9.

Assume Harris–Taylor type datum with Drinfeld level `m ≥ 1` at `u`; the comparison of Mantovan's integral model with Li–Liu'`s X_m` is part of the claim.

([lil22](#ref-lil22), Li–Liu II §4.3, p.60 for the isomorphism with `I^h_m` as a `k`-scheme; proof of Proposition4.25, p.62 for smoothness; proof of Theorem4.21, p.63; introduction p.7; [man08](#ref-man08), Proposition 12, author-copy p.12; §4.2.4, author-copy p.22.)

*Needs:* IG.0; IG.1.

**Checks.**

- For `n=2,h=0`, the tower is over the zero-dimensional étale-height-zero stratum and has trivial `GL₀` deck group; its Newton index is `j=1`.
- For `n=2,h=1`, the ordinary tower has dimension one and deck group `(O/πᵐ)^×`; its Newton index is `j=0`. It is distinct from the preceding tower.
- At `n=2,h=1,m=1`, the refined-component comparison covers `F_S`, as in IG.1.9; reindexing the stratum does not remove that Frobenius.

### Examples

For the ordinary class and `p` split in `F, Γ_b = GL_n(O_F ⊗ ℤ_p) × ℤ_p^×` and the level-one Mantovan Igusa variety over the ordinary leaf is a finite étale Galois cover with group `(O_F/p)^× × (ℤ/p)^×` when `F` is imaginary quadratic and `n = 1`. For the basic class in that case the leaf is finite and `H⁰_c` of the perfect Igusa variety is the smooth induction of the trivial representation, concentrated in degree zero; its virtual class is the actual representation.

### Dependencies

IG.0; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2; EtaleCohomologyFoundations §§`F`.0–`F`.3.

## Layer IG.2: Partial compactifications and cusp geometry

### IG.2.1 Well-positioned subsets

<a id="ig-2-well-positioned-subscheme"></a>

A locally closed subset `Y ⊆ S_k` is well-positioned if there is a family `Y^♮` `= {Y^♮_Z}` indexed by the cusp labels `Z` at level `K` such that `(1)` each `Y^♮_Z` is a locally closed subset of the boundary Shimura variety `S_{Z,k}`, and `(2)` for every complete algebraically closed nonarchimedean `C` over `k` and every `x = (A, ι, λ, η) ∈ S_k(C)` degenerating into the cusp `Z`, with Raynaud extension `0 → T → G → B → 0` over `O_C, x` lies in `Y` if and only if the point `π(x) = (B, …) ∈ S_{Z,k}(C)` lies in `Y^♮_Z`. Equivalently (Lan–Stroh), for every affine open `Spf R` of the formal chart `𝔛°_σ` of the toroidal boundary, `Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰` with `W⁰ ⊂ Spec R` the preimage of the interior. The notion is independent of `Σ`, agrees with Boxer's [Box15, Def. 3.4.1] when good integral models exist, and is preserved by the prime-to-`p` Hecke correspondences that extend to the compactifications.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.1, Definition 3.1.1, p. 37; §3.1, Remark 3.1.2, p. 38.)

The API:

- `IsWellPositioned`: The stated boundary-chart condition.
- `IsWellPositioned.boundaryData`: The unique boundary subsets `Y^♮_Z`.
- `isWellPositioned_iff_chart`: The chart identity `Y×_S W⁰=Y^♮_Z×_{S_Z}W⁰`.
- `IsWellPositioned.indep_cone`: Independence of `Σ`.
- `IsWellPositioned.hecke`: Preservation by prime-to-`p` Hecke images.
- `IsWellPositioned.closure`: Stability under closure and the boundary complement `Y₀`.

*Needs:* IG.0; ShimuraCompactifications `C1, C4, C5, C0, C3`; NeronModelsAndSemistableAbelianVarieties §3.13

**Checks.**

- `S_k` itself is well-positioned, with `Y^♮_Z = S_{Z,k}` for every cusp label `Z`.
- The empty set is well-positioned with all `Y^♮_Z` empty.
- The ordinary locus of `S_k` is well-positioned, with `Y^♮_Z` the ordinary locus of `S_{Z,k}`.
- For `n = 1` and `[F⁺:ℚ] = 2`, let `Y ⊂ S_k` be a closed curve with empty interior whose closure in `S^*_k` meets a proper cusp `Z` (positive torus rank; the open cusp is excluded). Then `Y` is not well-positioned: the boundary Shimura variety at `Z` is zero-dimensional, and the well-positioned condition would require `Y` to contain the full punctured boundary chart whenever its boundary datum there is nonempty.

### IG.2.2 Partial toroidal and minimal compactifications

<a id="ig-2-partial-compactifications"></a>

Let `Y ⊂ S_k` be well-positioned, `Ỹ` its closure in `S_k` and `Y₀ = Ỹ ∖ Y`. Let `Ỹ^*` and `Y^*₀` (resp. `Ỹ^tor, Y^tor₀`) be the closures of `Y` and `Y₀` in the minimal compactification `S^*_k` (resp. in the toroidal compactification `S^tor_{K,Σ,k}`). The partial minimal and partial toroidal compactifications are `Y^* := Ỹ^* ∖ Y^*₀` and `Y^tor := Ỹ^tor ∖ Y^tor₀`, locally closed in `S^*_k` and `S^tor_k` with their reduced structures. They satisfy `Y^* ×_{S^*_k} S_{Z,k} = Y^♮_Z` for every cusp label `Z, Y^tor` is the preimage of `Y^*` under `π : S^tor → S^*`, the map `Y^tor → Y^*` is proper and surjective with `π_*O = O` after normalization, and `Y^tor` (resp. `Y^*`) is stratified by the `(Z, [σ])` (resp. `Z`) as `S^tor` (resp. `S^*`) is.

Prove compatibility with Hecke correspondences and refinements of the cone decomposition.

Work in the smooth toroidal setting. Assume also `Y` well-positioned.

([CSnc](#ref-csnc), §3.1, p. 38; [ls18a-author](#ref-ls18a-author), Theorem 2.3.2 with display (2.3.3), author-copy pp.17–19; Definition 2.3.1, pp.16–17.)

The API: `partialMinimal`, `partialToroidal`, `partialToroidal_eq_preimage`, `partialMinimal_inter_boundary`, `partialToroidal_to_partialMinimal_proper`, `partialCompactification_hecke`.

*Needs:* IG.2; ShimuraCompactifications `C5, C3`

**Checks.**

- For `Y=S` both partial compactifications are the ambient compactifications.
- The ordinary minimal partial compactification is the Hasse nonvanishing locus.
- For nonclosed `Y` one must remove the closure of `Y₀`; the full closure alone is too large. For closed `Y` they agree.
- Intersecting `Y^*` with the interior recovers `Y`.

### IG.2.3 Lan–Stroh boundary charts

<a id="ig-2-lan-stroh-boundary-charts"></a>

Let `Y ⊂ S_k` be well-positioned and `Z` a cusp label. The formal completion of `Y^tor` along its `Z`-stratum is canonically isomorphic to the `Γ_Z`-quotient of the formal completion of `Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z` along its toroidal boundary `∂_{Z,Σ_Z} ×_{S_Z} Y^♮_Z`, compatibly with the corresponding description of `Ŝ^tor_Z` in ShimuraCompactifications C5. If `Y` is smooth (resp. regular), so is `Y^tor`.

Work in the smooth toroidal setting. Assume also `Y` well-positioned; `Σ` smooth with trivial stabilizers.

([CSnc](#ref-csnc), §3.2, p. 41 (citing [LS18a, Thm 2.3.2`(5)`]).)

*Needs:* IG.2; ShimuraCompactifications `C5, C4`; NeronModelsAndSemistableAbelianVarieties §3.13.

### IG.2.4 Closed partial minimal compactifications

<a id="ig-2-partial-minimal-closed"></a>

Let `Y ⊂ Y′ ⊂ S_k` be well-positioned locally closed subsets with `Y` closed in `Y′`. Then `Y^*` is a closed subset of `Y′^*`, and `Y^♮_Z` is closed in `Y′^♮_Z` for every cusp label `Z`.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.1, Proposition 3.1.3, p. 38.)

*Needs:* IG.2.

### IG.2.5 Well-positioned central leaves

<a id="ig-2-leaves-are-well-positioned"></a>

For every `p`-divisible group `X` with `G`-structure over `k`, the central leaf `C^X ⊂ S_k` is well-positioned. For a cusp label `Z = (Z_N, X)` (`X` of `O_F-rank r`), `(C^X)^♮_Z` is the central leaf `C^{X_Z}_Z` of `S_{Z,k}` for the unique `p`-divisible group `X_Z` with `G`-structure (for the group with `n` replaced by `n − r`) such that `X ≅ Hom(X, μ_{p^∞}) ⊕ X_Z ⊕ X ⊗ ℚ_p/ℤ_p`, or empty if no such `X_Z` exists. Writing `C^X_Z := C^{X,*} ×_{S^*} S_Z`, this identifies `C^X_Z = C^{X_Z}_Z`. The partial toroidal compactification `C^{X,tor}` is a smooth variety over `k`.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.1, Proposition 3.1.4, p. 38; §3.1, Lemma 3.1.5, p. 39.)

*Needs:* IG.2; IG.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties §3.13.

### IG.2.6 Connected and biconnected boundary groups

<a id="ig-2-connected-part-at-boundary"></a>

Let `𝒜` be the semi-abelian scheme over `C^{X,tor}` (restriction of the universal one over `S^tor`). For `m ≥ 1` the groups `𝒜[p^m]` are quasi-finite flat; across a nonempty degenerating boundary they are not finite flat and `𝒜[p^∞]` is not a `p`-divisible group. If the boundary is empty, this obstruction does not occur. In either case, its connected part `𝒜[p^∞]°` (the ind-scheme `𝒜̂[p^∞]` of the formal completion along the identity) is a `p`-divisible group over `C^{X,tor}` with `O_F`-action, geometrically isomorphic at every point to `X° = Hom(X, μ_{p^∞}) ⊕ X°_Z`. Its multiplicative part `𝒜[p^∞]^μ` has constant rank, and the biconnected part `𝒜[p^∞]^{(0,1)} = 𝒜[p^∞]°/𝒜[p^∞]^μ` carries a principal polarization extending the one over `C^X`.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.2, Proposition 3.2.1, p. 39; §3.2, Proposition 3.2.2, p. 40.)

*Needs:* IG.2; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties §3.13; AdicSpacesPartIII F0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.2.7 Finite-level toroidal Igusa varieties

<a id="ig-2-toroidal-igusa-finite-level"></a>

Let `X = ⊕ X_i` be completely slope divisible with `G`-structure. `(1)` The finite étale `Γ_{m,X}`-cover `Ig^X_{Mant,m} → C^X` extends uniquely to a finite étale cover `Ig^{X,tor}_m → C^{X,tor}`, Galois with group `Γ_{m,X}`. It represents Igusa level-`p^m` structures on `C^{X,tor}`-schemes `T`: for each `i` with `λ_i > 0`, an isomorphism `ρ_{i,m} : 𝒜[p^∞]_i[p^m] ×T ≅ X_i[p^m] × T` commuting with `O_F` and lifting fppf locally to all `p^{m′}`, together with a scalar in `(ℤ/p^m)^×(T)` such that `ρ_{i,m}, ρ_{j,m}` commute with the polarizations up to that scalar whenever `λ_i + λ_j = 1`. `(2)` With the splitting of `Z_N` of ShimuraCompactifications C5 fixed, for each cusp label `Z` the formal completion of `Ig^{X,tor}_m` along its `Z`-stratum is canonically isomorphic to `𝔜_{Z,Σ_Z}/Γ_Z`, where `𝔜_{Z,Σ_Z}` is the completion along the boundary of the `Γ_{m,X}`-torsor `Ig^X_{Z,Σ_Z} → Ξ_{Z,Σ_Z} ×_{S_Z} C^X_Z` defined by Igusa level structures on the completely slope divisible connected part `H_Z` of the Raynaud extension `G_Z` over `C_Z ×_{S_Z} C^X_Z`.

Work in the smooth toroidal setting. Assume also `X` completely slope divisible with `G`-structure.

([CSnc](#ref-csnc), §3.2.3, Theorem 3.2.4, p. 40; §3.2.3, Theorem 3.2.6, p. 41.)

The API: `ToroidalIgusa`, `ToroidalIgusa.represents`, `ToroidalIgusa.restrict_open`, `ToroidalIgusa.unique`, `ToroidalIgusa.boundaryChart`, `ToroidalIgusa.transition`.

*Needs:* IG.1; IG.2; IG.0.

**Checks.**

- Level zero is `C^{X,tor}`.
- If `X` has no étale part there is no boundary and the tower is Mantovan’s.
- The imaginary quadratic `n=1` ordinary level-one tower is a curve with cusps, finite étale over the compactified leaf.
- At a toric degeneration, trivializing all torsion fails to give this finite étale functor; use connected torsion and a common similitude scalar.

### IG.2.8 Perfect toroidal Igusa varieties

<a id="ig-2-perfect-toroidal-igusa-variety"></a>

For any `p`-divisible group `X` with `G`-structure over `k` (not necessarily completely slope divisible), the pro-finite étale `Γ_X`-cover `Ig^X → C^X_perf` extends uniquely to a pro-finite étale cover `Ig^{X,tor} → C^{X,tor}_perf`, Galois with group `Γ_X`. It represents perfect Igusa level structures on perfect `C^{X,tor}`-schemes `T`: an `O_F`-linear isomorphism `ρ : 𝒜[p^∞]° ×T ≅ X° × T` together with a scalar in `ℤ_p^×(T)` such that the induced isomorphism of biconnected parts `ρ^{(0,1)}` commutes with the polarizations up to that scalar. If `X` is completely slope divisible, `Ig^{X,tor}` is the perfection of `lim_m Ig^{X,tor}_m`. `Ig^X` is an fpqc `Aut(X)`-torsor over `C^X` before perfection, but this fails over the toroidal boundary strata.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.2.7, Theorem 3.2.8, p. 42; §3.2.7, Remark 3.2.10, p. 42.)

The API: `PerfectToroidalIgusa`, `PerfectToroidalIgusa.represents`, `PerfectToroidalIgusa.restrict_open`, `PerfectToroidalIgusa.eq_perf_lim`, `PerfectToroidalIgusa.action`.

*Needs:* IG.1; IG.2; IG.0; Mathlib `PerfectRing`.

**Checks.**

- If `X` has no étale part, `Ig^{X,tor}=Ig^X`.
- At an ordinary modular cusp the `Γ_b`-torsor trivializes the multiplicative connected part and includes the common `ℤ_p^×` scalar.
- With ordinary cusps present, the boundary is not an fpqc `Aut(X)`-torsor trivializing the entire `p`-divisible group.

### IG.2.9 Toroidal Igusa boundary charts

<a id="ig-2-igusa-boundary-charts"></a>

`(1)` The `Γ_X`-torsor `C^{Ig,X}_Z → (C_Z ×_{S_Z} C^X_Z)_perf` parametrizing `O_F`-linear isomorphisms `H_Z ≅ X°` with a `ℤ_p^×`-scalar compatible on biconnected parts is the perfect scheme parametrizing `(B, ι, λ, η) ∈ S_Z`, an extension `0 → T → G → B → 0` by the split torus with cocharacter group `X`, and an `O_F`-linear embedding `ρ : G[p^∞] ↪ X` such that `T[p^∞] ⊂ G[p^∞] ⊂ X` is symplectic and `B[p^∞] = G[p^∞]/T[p^∞] ≅ Gr_{−1}` compatibly with principal polarizations. `(2)` The `𝐒_{Z,perf}`-torsor `Ξ^{Ig,X}_Z → C^{Ig,X}_Z` is the perfection of the `𝐒_Z`-torsor of symmetric lifts `f : X → G` of `f₀ : X → B^∨` `≅ B`; after choosing a symplectic splitting `δ_X` of the filtration of `X`, it parametrizes symmetric lifts `f̃ : X[1/p] → G` of the induced `f̃₀ : X[1/p] → B`. `(3)` With the splitting of `Z_N` fixed, the completion of `Ig^{X,tor}` along its `Z`-stratum is canonically isomorphic to `𝔜_{Z,Σ_Z}/Γ_Z, 𝔜_{Z,Σ_Z}` the completion of `Ξ^{Ig,X}_{Z,Σ_Z} := Ξ^{Ig,X}_Z ×_{Ξ_Z} Ξ_{Z,Σ_Z}` along its toroidal boundary.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.2.7, Proposition 3.2.11, p. 43; §3.2.7, Theorem 3.2.13, p. 44.)

*Needs:* IG.2; IG.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties §3.13.

### IG.2.10 Unit-similitude quasi-isogenies

<a id="ig-2-unit-similitude-quasi-isogeny"></a>

Assume `p` splits in the imaginary quadratic `F₀ ⊂ F`. Let `X, X′` be `p`-divisible groups with `G`-structure over `k` in the same isogeny class `b`. Then there is a `G`-quasi-isogeny `φ : X′ → X` with similitude factor `1` that restricts to isomorphisms `X′^{ét} ≅ X^{ét}` and `X′^μ ≅ X^μ`.

Assume `p` split in `F₀` (so `G_{ℚ_p} ≅ ℚ_p^× × ∏_{v|𝔭} GL_{2n}(F_v)` for `𝔭` a prime of `F₀` above `p`).

([CSnc](#ref-csnc), §3.3.1, footnote `15`, p. 45.)

*Needs:* IG.0.

### IG.2.11 Toroidal invariance under normalized quasi-isogenies

<a id="ig-2-toroidal-isogeny-invariance"></a>

Let `φ:X→X′` be a `G`-quasi-isogeny of multiplier **1** over `k`, inducing isomorphisms on the multiplicative and étale parts. In the smooth toroidal setting, its interior isomorphism `Ig^X≅Ig^{X′}` extends uniquely to the perfect toroidal Igusa varieties, compatibly with tame Hecke correspondences and matching cusp labels/cones. This target exports the multiplier-`1` form needed after IG.2.10. An arbitrary unit multiplier is not an additional export.

*Polarized boundary quotient.* Choose `a≥0` with `pᵃφ` and `pᵃφ⁻¹` integral, and set `ψ=pᵃφ`. On a boundary chart of IG.2.9 write `0→T→G→B→0`. The constant framing filtration identifies the outer maps of `ψ` with `[pᵃ]`; they are not isomorphisms when `a>0`. The finite locally free subgroup `K_G=ρ⁻¹kerψ` has `K_G∩T=T[pᵃ]`. Its image `K_B⊂B[p²ᵃ]` is maximal isotropic for the pairing from `p²ᵃλ_B`. To prove this, use the perfect pairing on the framed middle lattice: `ψ^∨λ′ψ=p²ᵃλ` and the self-duality of the target lattice identify the Cartier annihilator of `K_B` with `K_B` itself. This calculation is over the chart base, not just its geometric points.

Form `B′=B/K_B` and `G′=G/K_G`. There is a unique homomorphism `λ′_B` with `u_B^∨λ′_Bu_B=p²ᵃλ_B`: first factor `p²ᵃλ_B` through the quotient, then through `u_B^∨` using the annihilator equality and Cartier duality. The equality of ranks makes `λ′_B` an isomorphism, and positivity follows fibrewise by pullback along the finite surjection `u_B`. Thus `λ′_B` is a principal polarization. This proves relative polarization descent for this prescribed kernel; the generic principalization statement of AbelianSchemesAndArithmeticModuli A3.11 is not being applied over an arbitrary base. The order action descends because `K_B` is stable under it; the determinant condition follows from the framed target group. Identify `T/T[pᵃ]` with `T` by `[pᵃ]`. Correct the prime-to-`p` level transported by `u_G` by the central factor `p⁻ᵃ`, which is invertible at every tame level.

*Symmetric lifts and cones.* Let `X` denote the cusp lattice, using the symmetric lifts on `X[1/p]` of IG.2.9. The extension relation is `u_B^∨λ′_B f′₀=pᵃλ_Bf₀`, so `f′₀=p⁻ᵃu_Bf₀`. Define the transformed lift by `f̃′(x)=u_G(f̃(p⁻ᵃx))`. Division occurs on `X[1/p]`, not on a point of `B` or a nonperfect torus. The `p²ᵃ` factor in polarization descent and the two `p⁻ᵃ` factors cancel in the symmetry equation. On the perfect difference-torus of lifts, the torus map `[pᵃ]` cancels the change of domain by `p⁻ᵃ`; hence the normalized map identifies the perfect symmetric-lift torsors and their character cones. The cusp lattice and cone decomposition are unchanged by the prescribed outer isomorphisms.

*Independence and gluing.* Replacing a by a`+1` quotients the resulting middle group by its full `p`-torsion and uses `[p]` to identify that quotient with the preceding one. Its polarization rescales by `p²`; the normalized lift and tame level rescale inversely, giving the same map. Common clearing powers therefore prove independence and compatibility with composition. The construction on the generic part of each completed boundary chart is precisely the abelian quotient defining IG.1.2. Algebraize the resulting finite-presentation formal quotient and its symmetric lift using the Mumford boundary-chart algebraization in ShimuraCompactifications C5. To extend the interior map, take its graph closure in the product with a proper ambient toroidal compactification. The formal charts just constructed put every boundary image inside the prescribed partial compactification and identify the completed graph projection with an isomorphism. Thus this projection is proper with finite fibres, hence finite, and is birational onto the normal source; it is an isomorphism. All data descend after a finite Frobenius stage, and the possible purely inseparable change disappears on perfection. This graph argument supplies extension; normality and equality on a dense interior then supply agreement on overlaps. Descend through `Γ_Z` and pass to the perfect inverse limit. Apply the same construction to `φ⁻¹` to obtain the inverse. No assertion that `ψ` has unchanged outer pieces is used.

Source: the moduli and symmetric-lift descriptions of [CSnc](#ref-csnc), Propositions 3.2.11–3.2.12 and Theorem 3.2.13, pp.43–44. The normalized quotient, polarization descent and gluing above are the extra proof steps required to use the intended quasi-isogeny form of its Corollary 3.2.14, pp.44–45.

The API: `boundaryKernel_torus`, `boundaryKernel_middle_annihilator`, `boundaryPrincipalQuotient`, `normalizedSymmetricLift`, `normalizedBoundaryMap_independent`, `toroidalIgusaIsoOfIsometry`, `toroidalIgusaIsoOfIsometry_restrict`, `toroidalIgusaIsoOfIsometry_comp`.

*Needs:* IG.0.13, IG.1.2, IG.2.6–IG.2.9; AbelianSchemesAndArithmeticModuli A3.3, A3.5, A3.9 (finite flat quotients, dual kernels and positivity); NeronModelsAndSemistableAbelianVarieties §3.13; ShimuraCompactifications C5; SchemeAndStackFoundations §§4.7–4.8 for eligible finite-level formal charts.

**Checks.**

- With the alternating form pairing coordinates `1` with `4` and `2` with `3, φ=diag(1,p,p⁻¹,1)` has multiplier `1` and fixes the two outer coordinates. `ψ=pφ=diag(p,p²,1,p)` has multiplier `p²` and outer maps `[p]`. Treating those outer maps as identities gives the wrong torus quotient.
- At `p=2`, clearing `φ=diag(1,4,1/4,1)` by `4` gives `ψ=diag(4,16,1,4): φᵀJφ=J` but `ψᵀJψ=16J`, with outer maps `[4]`. This tests clearing exponent `a=2` as well as `a=1`.
- In the paired middle rank-two module, `diag(p²,1)` has a maximal isotropic kernel in the `p²`-torsion. The quotient is principally polarized after descent, while the naive unchanged polarization would have multiplier `p²`.
- `a=0` and `φ=id` give the identity on `B`, on `X[1/p]`, and on the torus torsor. Increasing a by one still gives the identity after normalization.
- Rank-zero cusps give the interior construction. A group with no outer slope pieces has no nonempty boundary chart. At `p=2` the proof uses Cartier annihilators, not division by `2`.

### IG.2.12 Ekedahl–Oort strata and Hasse sections

<a id="ig-2-ekedahl-oort-stratification"></a>

For the PEL datum of IG.0 at `p` unramified, the `p`-torsion `A[p]` of the universal abelian scheme over `S_k` with its `O_F`-action and polarization defines an `F`-zip with `G`-structure (Moonen–Wedhorn; Pink–Wedhorn–Ziegler), hence a morphism `ζ : S_k → [E_𝒵\G_k]` to the stack of `G`-zips, which is smooth. The Ekedahl–Oort strata `S^w, w ∈ ^JW` (minimal-length coset representatives for the Weyl group of the Levi of `μ`), are the locally closed fibres of `ζ` over the points of `[E_𝒵\G_k]`; `dim S^w = ℓ(w)`. Each stratum closure carries Hasse sections: sections of a power of the Hodge line bundle `ω^{⊗N}` on the closure of `S^w` whose non-vanishing locus is exactly `S^w` (Boxer; Goldring–Koskivirta). EO strata extend to the toroidal and minimal compactifications as well-positioned subsets, and the Hasse sections extend to `S^*` using the ample Hodge line bundle there.

The zip morphism is smooth and each nonempty stratum has dimension `ℓ(w)`. Its Hasse section cuts out the stratum inside its closure; for the ordinary stratum use a matching positive power of the classical Hasse invariant.

Work in the smooth toroidal setting. Assume also PEL datum of type `(A)` or `(C)` unramified at `p` (here the quasi-split unitary datum).

([CSnc](#ref-csnc), §3.3.1, proof of Theorem 3.3.2, p. 45; [box15](#ref-box15), Theorem `C`, p. 17 (§1.5 of the Introduction; with Theorem `B`, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; [ls18a-author](#ref-ls18a-author), Proposition3.5.1`(3)`–`(4)`, p.41; Proposition3.5.5 and Corollary3.5.8, pp.41–42 (`84`-page author copy).)

The API: `ekedahlOortStratum`, `ekedahlOortStratum_dim`, `zipMorphism_smooth`, `hasseSection`, `ekedahlOortStratum_wellPositioned`, `ekedahlOortStratum_ordinary`.

*Needs:* IG.0; IG.2; HodgeTateAndCanonicalSubgroups §§0.14–0.16; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; ShimuraCompactifications C5.

**Checks.**

- For imaginary quadratic `F` and `n=1` the two EO strata have dimensions one and zero.
- The longest label is open and dense.
- Different zip labels give disjoint strata.
- An ordinary Hasse section has weight a positive multiple of `p−1`; its nonvanishing locus is ordinary.

### IG.2.13 Affineness of partial minimal EO strata

<a id="ig-2-eo-strata-minimal-affine"></a>

For every `w ∈ ^JW`, the partial minimal compactification `(S^w)^*` of the Ekedahl–Oort stratum `S^w` (a well-positioned subset) is affine.

Work in the smooth toroidal setting.

([box15](#ref-box15), Theorem `C`, p. 17 (§1.5 of the Introduction; with Theorem `B`, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; [CSnc](#ref-csnc), §3.3.1, proof of Theorem 3.3.2, p. 45.)

*Needs:* IG.2; ShimuraCompactifications C5.

### IG.2.14 A central-leaf EO stratum in each Newton stratum

<a id="ig-2-fundamental-eo-stratum-in-newton-stratum"></a>

For every `b ∈ B(G_{ℚ_p}, μ^{−1})` there is an EO label `w ∈ ^JW` whose associated affine Weyl representative is the fundamental element of IG.0.18a–IG.0.18b such that the Ekedahl–Oort stratum `S^w` is contained in the Newton stratum `S^b`; for such `w`, the `p`-divisible groups with `G`-structure at the points of `S^w` are all isomorphic, so `S^w` is a central leaf `C^{X_w}` with `X_w` the minimal `p`-divisible group with `G`-structure in the class `b`.

Assume PEL datum of type `(A)` or `(C)` unramified at `p` (Nie's results are for unramified groups with minuscule `μ`).

([nie15](#ref-nie15), Proposition 1.5, p. 3 (arXiv:1310.2229v2; proof on p. 12); Corollary 1.6, p. 4 (arXiv:1310.2229v2); Theorem1.4, p.3 (arXiv:1310.2229v2), with Corollary1.6 p.4.)

*Needs:* IG.2; IG.0.

### IG.2.15 Transfer of affineness

<a id="ig-2-affineness-transfer-lemma"></a>

Consider schemes `X ← C → Y` with maps `π₁, π₂`, closed immersions `i : X₀ → X, j : C₀ → C, k : Y₀ → Y`, and maps `π₁₀ : C₀ → X₀` and `π₂₀ : C₀ → Y₀` satisfying `j` ≫ `π₁ = π₁₀` ≫ `i` and `j` ≫ `π₂ = π₂₀` ≫ `k`. Assume the underlying closed subset of `C₀` is the preimage of both `X₀` and `Y₀`; no scheme-theoretic fibre-product equality is required. Assume `X, X₀` and `Y₀` are affine, and `π₁, π₂` are proper, surjective and finite away from `C₀`. Then `Y` is affine.

Assume `π₁, π₂` proper surjective, finite away from `C₀`; `X, X₀, Y₀` affine.

([CSnc](#ref-csnc), §3.3.1, Lemma 3.3.3, p. 46.)

The API: `isAffine_of_transfer`.

*Needs:* Mathlib `AlgebraicGeometry.IsAffine`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.IsFinite`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

### IG.2.16 Affineness of partial minimal leaves

<a id="ig-2-leaf-minimal-compactification-affine"></a>

For the fundamental representative `X_w` constructed in IG.0.18a–IG.0.18b, the partial minimal leaf `C^{X_w,*}` is affine: IG.2.14 identifies its EO stratum and IG.2.13 supplies affineness. For arbitrary `X` in the same class, assume `p` splits in `F₀`. Then IG.2.10 supplies a multiplier-`1` quasi-isogeny `X_w→X` with outer isomorphisms, and IG.2.11 supplies the toroidal comparison. The resulting correspondence between the two partial minimal leaves descends to a finite term of the toroidal Igusa tower, since both projections are finitely presented. Its maps are proper and surjective and finite over the interior. Induct on cusp rank to make both boundary loci affine and apply IG.2.15 with the actual maps on those loci and both commuting squares. This proves `C^{X,*}` affine for every `X` under this split-prime hypothesis. The arbitrary-`X` assertion at an unramified nonsplit `p` is not exported by this route.

Source: [CSnc](#ref-csnc), Theorem 3.3.2 and its transfer proof, pp.45–46, with IG.2.11 supplying the normalized extension. *Needs:* IG.0.18a–IG.0.18b, IG.2.10–IG.2.15.

### IG.2.17 Perfect minimal Igusa varieties

<a id="ig-2-perfect-minimal-igusa"></a>

Define `Ig^{X,*}` as the normalization of `C^{X,*}` in the perfect Igusa variety `Ig^X`. Then `Ig^{X,*} → C^{X,*}` is integral, so `Ig^{X,*}` is affine when `C^{X,*}` is; it agrees with the Stein factorization of `Ig^{X,tor} → C^{X,*}`, so, when `C^{X,*}` is affine, `Ig^{X,*} = Spec H⁰(Ig^{X,tor}, O)`. `A G`-quasi-isogeny `φ : X → X′` as in [IG.2.11](#ig-2-toroidal-isogeny-invariance) induces `Ig^{X,*} ≅ Ig^{X′,*}`.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.3.1, Proposition 3.3.4, p. 46.)

The API: `PerfectMinimalIgusa`, `PerfectMinimalIgusa.integral`, `PerfectMinimalIgusa.eq_spec_H0`, `PerfectMinimalIgusa.isAffine`, `PerfectMinimalIgusa.open`.

*Needs:* IG.2; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

**Checks.**

- If `X` has no étale part, `Ig^{X,*}=Ig^X`.
- At ordinary imaginary quadratic `n=1` cusps the boundary is a profinite set indexed bijectively by the cusp labels.
- For infinite `Γ_b` the integral map need not be finite.

### IG.2.18 Finite-level minimal Igusa varieties

<a id="ig-2-minimal-igusa-compactification"></a>

Fix `b ∈ B(G_{ℚ_p}, μ^{−1})` and choose the fundamental integral representative `X_b=X_w` of IG.0.18a–IG.0.18b and IG.2.14. Its compatible integral slope decomposition was proved by the normalizer-cycle construction, including the coefficient-embedding cycles; the split-case comparison of minimal notions is not being used as a substitute for that construction. Let `C^b = C^{X_b}` and `Ig^b_m = Ig^{X_b}_{Mant,m}`. Define `Ig^{b,*}_m` as the normalization of `C^{b,*}` in `Ig^b_m` and `Ig^{b,*} := lim_m Ig^{b,*}_m`. Then: `(1) h^{b,*}_m : Ig^{b,*}_m → C^{b,*}` is finite and surjective, so `Ig^{b,*}_m` is affine whenever `C^{b,*}` is; `(2) Ig^b_m ↪ Ig^{b,*}_m` is a dense open immersion and `Ig^{b,*}_m` is normal; `(3) Ig^{b,*} → C^{b,*}` is integral (not finite) and `Ig^{b,*}` is affine whenever `C^{b,*}` is; its perfection is `Ig^{X_b,*}` of [IG.2.17](#ig-2-perfect-minimal-igusa).

Extend prime-to-`p` Hecke correspondences and the level-changing Mantovan monoid maps through normalization.

Work in the smooth toroidal setting. Assume also `X_b` completely slope divisible.

([CSnc](#ref-csnc), §3.3.6, Definition 3.3.7, p. 46; §3.3.6, Lemma 3.3.8, p. 47; §2.8, Theorem 2.8.1, p. 33.)

The API: `MinimalIgusa`, `MinimalIgusa.finite`, `MinimalIgusa.normal`, `MinimalIgusa.isAffine`, `MinimalIgusa.lim_integral`, `MinimalIgusa.perf`, `MinimalIgusa.hecke`.

*Needs:* IG.1; IG.2; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; Mathlib `AlgebraicGeometry.IsFinite`.

**Checks.**

- Level zero is the normalization of `C^{X,*}`; it is `C^{X,*}` when that scheme is normal.
- In the ordinary modular level-one case this is a finite curve with cusps.
- For infinite `Γ_b` the inverse-limit map is integral and need not be finite.

### IG.2.19 Igusa cusp labels

<a id="ig-2-igusa-cusp-labels"></a>

An Igusa cusp label is a triple `Z̃ = (Z_b, Z^p, X)` where `(1) Z_b` is an `O_F`-stable filtration `Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b` with `Gr_{−2} = Z_{b,−2}` multiplicative, `Gr_0 = X_b/Z_{b,−1}` étale, identified as Cartier dual by the polarization (so `Gr_{−1}` is principally polarized); `(2) Z^p` is an `O_F`-stable symplectic filtration `Z^p_{−2} ⊂ Z^p_{−1} ⊂ L ⊗ ℤ̂^p`; `(3) X` is a finite projective `O_F`-module with isomorphisms `X ⊗ ℚ_p/ℤ_p ≅ Gr^{Z_b}_0` and `X ⊗ ℤ̂^p ≅ Gr^{Z^p}_0`. `J_b(ℚ_p) × G(𝔸_f^p)` acts on Igusa cusp labels; at level `K` (compact open) an Igusa cusp label is a `K`-orbit, and for `K = Γ_b(p^m)K^p(N)` these are triples `(Z_{m,b}, Z_N, X)` with `Z = (Z_N, X)` a cusp label at level `K(N)` and `Z_{m,b}` an `O_F`-linear symplectic filtration of `X_b[p^m]` with `X/p^m ≅ Gr_0`. Its stabilizer is `Γ_Z̃ = {γ ∈ Aut_{O_F}(X) : γ ≡ 1 mod p^mN}`.

Work in the smooth toroidal setting. Assume also `X_b` completely slope divisible.

([CSnc](#ref-csnc), §3.3.9, Definition 3.3.10, p. 47; §3.3.9, p. 47.)

The API:

- `IgusaCuspLabel`: The stated triples `(Z_b,Z^p,X)`.
- `IgusaCuspLabel.toCuspLabel`: The underlying Shimura label `(Z^p,X)`.
- `IgusaCuspLabel.action`: The `J_b(ℚ_p)×G(𝔸_f^p)`-action.
- `IgusaCuspLabel.atLevel`: The finite-level triples `(Z_{m,b},Z_N,X)`.
- `IgusaCuspLabel.stabilizer`: The level-congruence subgroup `Γ_Z̃`.
- `IgusaCuspLabel.rank`: The `O_F-rank r` of `X`, with `0≤r≤n`.

*Needs:* IG.0; ShimuraCompactifications C1.

**Checks.**

- The label with `X = 0` corresponds to the open stratum `Ig^b_m`.
- At `m = 0` (level `Γ_b K^p(N)`) the filtration `Z_{0,b}` of `X_b[p⁰] = 0` is trivial, so the Igusa cusp labels above a cusp label `Z` of the leaf correspond to `Z` itself; for `n = 1, F` imaginary quadratic and `b` ordinary there is exactly one above each cusp.
- If `X_b^{ét} = 0` there are no Igusa cusp labels with `X ≠ 0`.

### IG.2.20 Toroidal Igusa boundary strata

<a id="ig-2-toroidal-igusa-boundary-strata"></a>

`(1)` The completion of `Ig^{b,tor}_m` along its `Z`-stratum decomposes into open and closed formal subschemes indexed by Igusa cusp labels `Z̃` at level `Γ_b(p^m)K^p(N)` above `Z`. `(2)` Fix a symplectic `O_F`-linear splitting `δ_{m,b}` of `X_b[p^m]` along `Z_{m,b}` and the splitting of `Z_N`. There is an abelian scheme `C_Z̃ = Hom_{O_F}((1/N)X, (B/B[p^m]^μ)^∨)` over the level-`p^m` Igusa variety `Ig^b_{Z,m}` of the boundary leaf `C^b_Z ⊂ S_Z`, mapping to `C_Z` over `S_Z`, such that, with `Ξ_{Z̃,Σ_Z}` the pullback of `Ξ_{Z,Σ_Z} → C_Z` to `C_Z̃` and `𝔛_{Z̃,Σ_Z}` its completion along the toroidal boundary, the `Z̃`-piece is `Γ_Z̃`-equivariantly `𝔛_{Z̃,Σ_Z}/Γ_Z̃`; the moduli interpretation is by Igusa level-`p^m` structures compatible with `Z̃` and `δ_{m,b}` (Definition 3.3.13). The natural map `C_Z̃ → C_Z ×_{S_Z} Ig^b_{Z,m}` is finite étale.

Work in the smooth toroidal setting. Assume also `X_b` completely slope divisible.

([CSnc](#ref-csnc), §3.3.11, Theorem 3.3.12, p. 48; §3.3.11, proof of Theorem 3.3.12, p. 50.)

*Needs:* IG.2; ShimuraCompactifications `C4, C5`; NeronModelsAndSemistableAbelianVarieties §3.13

### IG.2.21 Boundary strata of `Ig^{b,*}_m`

<a id="ig-2-minimal-igusa-boundary-strata"></a>

There is a decomposition into locally closed strata `Ig^{b,*}_m = ⊔_{Z̃} Ig^b_{Z̃}, Z̃` running over Igusa cusp labels at level `Γ_b(p^m)K^p(N)`, with `Ig^b_{Z̃} ≅ Ig^b_{Z,m}`, the level-`p^m` Igusa variety over the boundary leaf `C^b_Z` in `S_Z` (for the smaller unitary group of `rank 2(n − r)`). If the stratum of `Z̃` meets the closure of the stratum of `Z̃′`, the underlying cusp labels satisfy the corresponding closure relation. This necessary condition does not identify all Igusa-level incidence relations from the underlying labels alone.

Work in the smooth toroidal setting. Assume also `X_b` completely slope divisible.

([CSnc](#ref-csnc), §3.3.14, Theorem 3.3.15, p. 50.)

*Needs:* IG.2; ShimuraCompactifications C5.

### Examples

For `F` imaginary quadratic and `n = 1` the two Ekedahl–Oort strata have dimensions one and zero, the ordinary partial minimal compactification is the nonvanishing locus of the Hasse invariant, and at level zero the Igusa cusp labels above a cusp of the ordinary leaf are in bijection with that cusp. The toroidal Igusa tower over the ordinary leaf is a curve with cusps, finite étale over the compactified leaf, and trivializing all of `A[p^m]` at a toric degeneration instead of its connected part would not give a finite étale functor.

### Dependencies

Layers IG.0 and IG.1; ShimuraCompactifications C0–C5; NeronModelsAndSemistableAbelianVarieties §3.13; HodgeTateAndCanonicalSubgroups §§0.14–0.16; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2; AdicSpacesPartIII F0; Mathlib affineness, properness, finiteness and normalization.

## Layer IG.F: Curve geometry, coefficients and the local Hecke action

This layer supplies the geometric inputs to IG.3 and IG.7 in dependency order. Its curve coefficient field `E` is any finite extension of `ℚ_p`, with ring `O_E`, uniformizer `π` and residue cardinal `q`. Its geometric bases are perfectoid spaces over an algebraic closure of `𝔽_q`. The representation-theoretic applications use products of `GL_n` and their inner forms; the geometric classification and charts are stated for connected reductive `G/E`. Fix `ℓ≠p`. Torsion coefficients mean `ℓ`-power-torsion `Λ`; the integral Hecke construction uses `ℤ_ℓ[q^{1/2}]` and its derived coefficient extensions. A chosen square root fixes the half Tate twists. Zero coefficients are allowed, but dimension and rank tests use nonzero coefficients.

The build proceeds through the relative curve, its bundles and section spaces, then `G`-bundles and modifications, then coefficient categories, fusion and the local Hecke action. It imports the parameter algebra from SmoothRepresentationsOfLocalGroups SR.6. It does not assume a geometric spectral action in that supplier.

### IG.F.1 Relative curves and untilt divisors

<a id="ig-f-relative-curve"></a>

Use EndoscopicTransferAndUnitaryTraceComparison §12.1's relative annuli and curve seed for every finite `E/ℚ_p`: `TowerUntiltChart.coefficientFieldAnnuli`, `.qFrobenius`, `.coefficientFieldCurve`, `.closedDivisor`, `.rationalRestriction`, `.frobeniusTransport`. Its constant-isocrystal bundles and primitive Cartier untilts extend AdicSpaces Layer 6. The pinned Witt completeness and Huber inputs are in Exact supplier contracts; general bundle descent starts at IG.F.2.

Construct the divisor parameter `v`-sheaf `Div¹_E` from untilts to `E` with their Frobenius descent. Prove `X_{S,E}^♦≅(S×Spd E)/ϕ_S^ℤ` and identify its relative degree-one Cartier divisors with the pullback of `Div¹_E`. In the notation of FS II.1, `Div¹_E=Spd(E)/ϕ^ℤ` on `Perf_{𝔽_q}`; that notation includes its unramified coefficient base and descent datum. Frobenius acts on the characteristic-`p` factor and its coefficient descent, not as a field automorphism of `E`. Keep the labelled untilt under Frobenius transport; the parameter describes its orbit, rather than forgetting the untilt structure at the outset. The API is `DivOne`, `relativeFFCurve_diamond`, `untiltDivisor_parameterEquiv`, `divOne_frobeniusTransport`, with naturality and unit/counit of the divisor classification. Source: [FS](#ref-fs), Definition II.1.15 and Propositions II.1.16–II.1.22, pp.54–56. *Needs:* EndoscopicTransferAndUnitaryTraceComparison §12.1; DiamondsAndVStacks D3–D6; LocalGaloisGroups (finite local fields and their unramified extensions).

**Checks.**

- `E=ℚ_p` and `S` a perfectoid field recover the existing annuli and quotient, including the chosen plus ring.
- The action is `q`-Frobenius for `E` of residue degree `f`; `p`-Frobenius alone need not preserve the coefficient structure when `f>1`.
- Changing `ϖ` changes neither open complement nor curve. Retaining `V(π)` does not give the analytic curve being classified.
- An untilt defines a Cartier divisor before taking its underlying closed set. For empty `S` every construction is empty.

### IG.F.2 Analytic bundles, descent and the algebraic comparison

<a id="ig-f-bundle-descent"></a>

For unramified `E=ℚ_{p^d}`, use PadicHodgeTheory §7.5's chartwise Proj/adic curve, interval finite-projective modules, bundle equivalences and finite-projective divisor patching. Use its §7.6 all-module `relativePeriodDerivedComparison` for cohomology, with its actual restriction, radius-refinement and boundary maps. These apply to all chartwise bundles, including those of nonzero slope. On a general base the imported objects are compatible chartwise bundles; no global curve scheme is assumed.

For ramified finite `E/ℚ_p`, extend these linear interfaces on the coefficient-field annuli of IG.F.1. An analytic bundle is a finite locally free analytic `O`-module, expressed on intervals by finite projective modules and compatible gluing maps, with pullback, tensor products and duals. Extend finite-projective patching across an untilt divisor and its complement. Construct `O(1)` using the `π⁻¹` Frobenius grading, prove eventual global generation and `H¹`-vanishing for positive twists on affinoid bases, and construct the relative Proj model. Its algebraic and analytic bundle categories are equivalent and have the same cohomology, using AlgebraicVectorBundles' sheaf/module, tensor and determinant APIs.

For every finite `E`, prove effective `v`-descent of these bundles and their complexes. Extend scalars to the completion of `E(π^{1/p^∞})`, use almost acyclicity on the perfectoid Čech nerve, and descend finite projectors and gluing maps back along the faithful coefficient extension. For affinoid `S`, compute `RΓ(X_S,V)` by `[Γ(Y_S,V) → Γ(Y_S,V)]` in degrees `0,1` with differential `1−ϕ`, where `ϕ` denotes the curve's `q`-Frobenius action. Dense annulus restriction maps and completeness remove the interval `R¹lim` obstruction in the ramified extension. In the unramified case `ϕ=ϕ_p^d`; transport the imported `ϕ_p^d−1` complex by `id` in degree `0` and `−id` in degree `1`, and transport connecting maps and products through this chain isomorphism. The equivalences and cohomology comparisons must commute with effective `v`-descent.

The API: `AnalyticFFBundle`, `analyticFFBundle_intervalEquiv`, `analyticFFBundle_vDescent`, `ffBundle_frobeniusComplex`, `ffBundle_twist_generated`, `ffBundle_algebraicEquiv`, including unit, counit and base-change compatibility of the equivalences. Source: [FS](#ref-fs), Proposition II.2.1, p.57, Theorem II.2.6, p.63, and Propositions II.2.7–II.2.9, pp.66–67. *Needs:* IG.F.1; PadicHodgeTheory §§7.5–7.6 (unramified linear equivalences, patching and `relativePeriodDerivedComparison`); AdicSpacesPartIII R3.5 (finite projectives on sheafy interval rings); PerfectoidSpaces P0 (almost module descent), P3 (almost purity); DiamondsAndVStacks D3 (`v`-descent of functions); AlgebraicVectorBundles; EnhancedDerivedSheaves E0–E3 (enhanced descent and derived limits).

**Checks.**

- The zero bundle descends to zero; the identity Čech cover has the identity descent equivalence.
- In the two-term arithmetic control `ϕ=diag(1,2)` on `ℤ², 1−ϕ=diag(0,−1)`. Its fixed first coordinate lies in degree `0`; the degree-one map `−id` sends the `ϕ−1` differential to this `1−ϕ` differential. Degree zero is unchanged. The actual period complex has terms in degrees `0,1`.
- A finite projective module need not be free. Local triviality is the output of descent, not a chosen global basis.
- Negative twists need not have `H¹=0`; eventual vanishing is not asserted for every twist.

### IG.F.3 Bundle slopes and classification

<a id="ig-f-bundle-classification"></a>

For a geometric perfectoid field `C` of characteristic `p`, construct the exact tensor functor `(D,F)↦E(D,F)` by descending `D⊗O_Y` through Frobenius. With the Frobenius convention of IG.0.1, `E(Ĕ,π^{-a}ϕ)=O(a)`; more generally an isocrystal slope `a/h` gives a bundle of slope `−a/h` and `rank h`. Define degree by the determinant and rank on each component. Prove the `H⁰/H¹` computations for `O(a/h)`, the vanishing of `H¹` in nonnegative slope over a geometric point and the vanishing of `H⁰` in negative slope. Use positive twists and nonzero sections to split off the largest-slope summand inductively, obtaining the classification of every bundle as a sum of the stable rational-slope blocks. Multiplicities, slopes and determinant degree determine its isomorphism class; the functor is not asserted to be an equivalence of exact categories on all bundles.

The API: `ffIsocrystalBundle`, `ffIsocrystalBundle_tensor`, `ffIsocrystalBundle_slope`, `ffBundle_degree`, `ffBundle_hom_slope`, `ffBundle_decomposition`, `ffBundle_decomposition_unique`. Source: [FS](#ref-fs), Proposition II.2.5, pp.61–62, Theorem II.2.14, pp.69–70; [Fargues](#ref-fargues), Example 5.2 and Remark 5.3, p.15, for the exactness distinction. *Needs:* IG.F.1–IG.F.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 Dieudonné–Manin; AlgebraicVectorBundles (determinants and finite locally free operations).

**Checks.**

- The scalar Frobenius `π` gives `O(−1)`, while `π⁻¹` gives `O(1)`; the slope sign is reversed.
- A bundle block of slope `1/2` has `rank 2` and degree `1` (its isocrystal slope is `−1/2`). There is no rank-one bundle of degree `1/2`.
- `O⊕O(1)` has `rank 2` and degree `1` and is not semistable. The rank-zero bundle has empty slope multiset.
- A bundle exact sequence can induce a nonexact sequence of the associated integral period modules; no exact inverse functor is claimed.

### IG.F.4 Families, Harder–Narasimhan filtration and local systems

<a id="ig-f-relative-hn"></a>

For a bundle `V` on `X_S`, construct its geometric slope polygon and prove semicontinuity. On a locus where it is constant, construct a global functorial Harder–Narasimhan filtration and prove that its graded pieces become the constant slope blocks after a pro-étale cover. For slope zero, this gives an equivalence with pro-étale `E`-local systems; expose both functors and their unit/counit. Build sections after `v`-covers by using the proper projectivized section spaces, and use them to construct and descend the maximal-slope subbundle. This is a statement on the constant-polygon locus, not a filtration by subbundles across a jumping family.

The API: `ffHNPolygon`, `ffHNPolygon_semicontinuous`, `ffHNFiltration`, `ffHNFiltration_baseChange`, `ffHNGraded_proetaleTrivial`, `slopeZeroBundle_localSystemEquiv`. Source: [FS](#ref-fs), Proposition II.2.16, p.71, Theorem II.2.19, pp.73–74, and Corollary II.2.20, p.74. *Needs:* IG.F.2–IG.F.3; DiamondsAndVStacks (proper diamonds, `v`-covers); DiamondEtaleCohomology (pro-étale local systems).

**Checks.**

- A constant direct sum has its expected slope filtration. A family with a jumping polygon is not an input to the constant-polygon assertion.
- `O^r` corresponds to the trivial `rank-r E`-local system, including `r=0`.
- Local triviality is pro-étale; a local system with nontrivial monodromy need not have a global basis.

### IG.F.5 Section diamonds and positive automorphism pieces

<a id="ig-f-banach-colmez"></a>

For bundles `V` on `X_S` define the section `v`-sheaf `BC(V)(T)=H⁰(X_T,V_T)`. For a two-term complex `[V₁→V₀]`, placed in homological degrees `1,0`, define `BC([V₁→V₀])` by its degree-zero hypercohomology; assume `V₁` has strictly negative slopes. Prove that it is a partially proper locally spatial diamond over the perfectoid base `S`, that its nonzero projectivization by `E^×` is proper, and that it is `ℓ`-cohomologically smooth when `V₀` has strictly positive slopes. Construct presentations by slope ±`1/r` blocks, identify the small positive blocks with universal covers of Lubin–Tate groups, and apply smoothness descent and exact sequences. For a positive bundle the relative dimension is its degree. Do not claim the corresponding absolute functor over `Spd(𝔽̄_q)` is a diamond at its zero section.

The API: `BCSections`, `BCComplex`, `BCComplex_baseChange`, `BCComplex_locallySpatial`, `BCProjective_proper`, `BCComplex_cohomologicallySmooth`, `BCPositive_dimension`. Source: [FS](#ref-fs), Propositions II.3.1–II.3.5, pp.74–79, with the absolute warning in §II.3.3, p.80. *Needs:* IG.F.2–IG.F.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2 (Lubin–Tate universal covers); DiamondSixOperations S4 for representable morphisms.

**Checks.**

- `BC(O)` is the locally profinite `E`, of dimension `0`; slope zero is not a positive connected automorphism piece.
- `BC(O(1))` over a geometric perfectoid base is the appropriate perfectoid open disc/universal cover, of dimension `1`. `BC(O(−1))` has no nonzero sections.
- The zero bundle gives a point over `S` and an empty nonzero projectivization. Do not divide its zero section by `E^×` as though it were a torsor.
- The negative block `BC(O(−1)[1])` has a quotient presentation by `E`; it is not incorrectly replaced by `H⁰(O(−1))`.

### IG.F.6 `G`-bundles and their geometric classification

<a id="ig-f-g-bundles"></a>

Define a `G`-bundle as an étale `G`-torsor on the algebraic curve of IG.F.2, equivalently an exact tensor functor `Rep_E(G)→`finite locally free bundles. Prove the equivalence by a faithful representation with a line/tensor stabilizer and fpqc descent of its reductions of structure group; expose the torsor and tensor functors and their comparison on every representation. Define `Bun_G(S)` to be their groupoid and prove `v`-descent using IG.F.2 and the same tensor-stabilizer presentation.

Over geometric `C` classify isomorphism classes by `B(G), b↦E_b`. Use the reduced henselian period ring `B` of Fargues §5.2.1, with residue field the completed maximal unramified extension of `E`. The tensor-frame torsor is trivial by ReductiveGroupsPartII RG2.1.1 (Steinberg) and henselian lifting of smooth torsors; a frame represents Frobenius by an element of `G(B)`. For quasi-split `G`, the tensor HN filtration gives its canonical parabolic and semistable Levi reduction. Positive-root `H¹` vanishing from IG.F.3 splits its unipotent extension. On the basic Levi apply Lang lifting (RG2.3) and the cyclic-norm calculation to identify its Frobenius module with a constant isocrystal. This proves essential surjectivity; the same Frobenius-conjugacy calculation proves injectivity, not merely a comparison after forgetting tensors.

For general connected reductive `G` choose a finite unramified `E_h/E` over which it is quasi-split, using the same Steinberg theorem. Apply the preceding construction to the `h`-fold Frobenius/norm. Descend the comparison through its full automorphism group: positive HN graded pieces are `E`-vector spaces and have zero higher cohomology for the finite cyclic descent group by averaging in characteristic zero; the remaining obstruction is in `J_b(E_h)` and is exactly the cyclic-norm class defining the original element of `B(G)`. Matching that class gives effective descent and injectivity. This is the descent calculation of Fargues §§5.3–5.4, not an assertion that every nonsplit group is split or every positive-dimensional automorphism group is trivial. Compatibility with representations follows from the tensor construction. The classification is of geometric isomorphism classes, not of all families by constant `b`.

The API: `FFGBundle`, `gBundle_tensorEquiv`, `BunG`, `BunG_vStack`, `gBundleOfIsocrystal`, `gBundle_geometricClassification`, `gBundle_classification_representation`. Source: [FS](#ref-fs), §§III.1–III.2, Theorem III.2.2, pp.85–89; [Fargues](#ref-fargues), Theorems 5.1 and 5.6, pp.14,`16`, Propositions 5.7–5.11, pp.16–17, and §§5.3–5.4, pp.17–21. *Needs:* IG.0.1–IG.0.2a extended to finite `E` by replacing `W(𝔽̄_p)[1/p], p` and `σ` by the completed maximal unramified extension of `E, π` and `q`-Frobenius (same `σ`-conjugacy, Newton and Kottwitz constructions); IG.F.1–IG.F.5; ReductiveGroups (representations, parabolics, unipotent radicals), ReductiveGroupsPartII RG2.1.1 and RG2.3 (Steinberg and Lang); AlgebraicVectorBundles (tensor and torsor descent).

**Checks.**

- `GL_n` recovers IG.F.3; `G=1` has a unique bundle and no nontrivial automorphism group.
- A torus has no positive root pieces; its degree invariants remain and are not all zero.
- Two `GL₂` bundles of `rank 2` and degree `0` with slopes `(0,0)` and `(1,−1)` are not isomorphic.
- The classification is of isomorphism classes, not a claim that the groupoid is the discrete set `B(G)`.

### IG.F.7 Crystalline comparison and residue reduction with tensors

<a id="ig-f-crystalline-comparison"></a>

For a `p`-divisible group over `O_C/p` evaluate its Dieudonné crystal on `A_cris` and invert `p`. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20 supplies the covariant crystalline evaluation, and R07.2.28 (`swDieudonneSemiperfect`) supplies rational full faithfulness on `f`-semiperfect bases. Construct its associated curve bundle by the Frobenius period modules and construct its Frobenius-period sections. Prove the rational functor fully faithful with essential image the bundle slopes `[0,1]`, as in SW13 Theorem 5.1.4; this step uses the geometric bundle classification and period-ring descent, not the later integral classification.

For `G`-structures apply Fargues' additive tensor period-module comparison and reduction to `W(k)[1/p]`, where `k` is the residue field with a chosen embedding into `O_C/p`. His henselian reduction ring and tensor-stabilizer argument identify the resulting `G`-bundle with `E_b` for the reduced `G`-isocrystal. In particular, isomorphic reduced `G`-isocrystals give isomorphic `G`-bundles and hence structured quasi-isogenies on `O_C/p`. The tensor action and pairing are carried through this comparison, so a bare `GL_n` bundle isomorphism is insufficient. No assertion that the period-module inverse preserves every bundle exact sequence is used. This supplies precisely the extra constancy input in IG.3.9 and IG.3.20.

The API: `crystallineCurveBundle`, `crystallineCurveBundle_fullyFaithful`, `crystallineCurveBundle_essentialImage`, `crystallineGBundle_reduction`, `pelQuasiIsogeny_of_reducedIsocrystal`. Source: [SW13](#ref-sw13), Theorem 5.1.4 and its proof, pp.49–50, Proposition 5.1.6, p.50; [Fargues](#ref-fargues), §5.2.1, pp.14–15, Lemma 5.4, Definition 5.5 and Theorem 5.6, pp.15–16, and henselian reduction and descent in §5.2.3 and §§5.3–5.4, pp.16–21; [CSnc](#ref-csnc), proof of Proposition 4.3.1, pp.54–55. *Needs:* IG.F.1–IG.F.3, IG.F.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.20, R07.2.28; PELModuli M0 (tensor data).

**Checks.**

- The étale and multiplicative groups give `O` and `O(1)` in the SW convention, respectively; here `E_SW(G)=E(D_CS(G),ϕ_CS)` with the CS slopes `0,−1`. IG.F.3 reverses those slopes. The positive contravariant Dieudonné module of IG.0.18a is the rational dual, not the same input.
- Trivial `G` tensors reduce to the unstructured comparison. A linear isomorphism that fails a pairing tensor is not a PEL quasi-isogeny.
- The same reduced `b` determines an isomorphism class, not a preferred quasi-isogeny; its automorphisms remain `J_b`.
- Replacing `O_C/p` by an arbitrary characteristic-`p` ring is not an allowed generalization of this geometric theorem.

### IG.F.8 Integral Hodge–Tate classification with PEL structures

<a id="ig-f-integral-hodge-tate"></a>

For algebraically closed complete `C/ℚ_p` prove Scholze–Weinstein's equivalence between `p`-divisible groups over `O_C` and pairs `(T,W), T` finite free over `ℤ_p` and `W⊂T⊗C(−1)` a `C`-subspace. The functor uses `T_p` and the Hodge–Tate sequence; its inverse first forms `V=ker(T⊗O_X(1)→i_{∞*}((T⊗C(−1))/W))`, using the standard residue of `O(1)`. Thus `0→T⊗O_X→V→i_{∞*}W→0` is a specified sub-modification, rather than an unspecified extension. Prove that `V` has slopes in `[0,1]`. For essential surjectivity, construct the rigid analytic group with Tate lattice `T` by pulling back the multiplicative universal cover along `Lie=W`; write it as increasing closed balls and use its bounded cotangent lattice to construct the formal `p`-divisible group over a spherically complete `C`. Full faithfulness of IG.F.7 and surjectivity of the Rapoport–Zink period map then descend the realization to a general algebraically closed complete `C`. Identify its crystalline curve bundle with `V`. This includes the boundedness and effectivity arguments; a rational bundle alone does not supply the integral lattice. The construction of the rational reduction functor in IG.F.7 precedes this integral essential-surjectivity step.

Full faithfulness transports `O_B`-actions, Cartier duality and polarizations. A principal quasi-polarization corresponds to a perfect alternating Tate pairing with `W` its appropriate annihilator after the Tate twist; impose the determinant condition on `W`. The integral lattice `T` is retained. A rational `B`-action alone is not an integral `O_B`-action. This is owned here rather than attributed to HodgeTateAndCanonicalSubgroups §§2.4–2.8.

The API: `pdivHodgeTateEquiv`, `pdivHodgeTateEquiv_tateModule`, `pdivHodgeTateEquiv_lie`, `pdivHodgeTateEquiv_dual`, `pelHodgeTateEquiv`, `pelHodgeTateEquiv_determinant`, `crystallineCurveBundle_HTModification`. Source: [SW13](#ref-sw13), Theorem `B`, p.4, Theorem 5.2.1, pp.51–54, Proposition 5.2.8, pp.54–55, and completion of the proof in §6.2, pp.57–58. *Needs:* IG.F.1–IG.F.3, the rational comparison portion of IG.F.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6; IG.0.27; HodgeTateAndCanonicalSubgroups §§2.4–2.8 for the Hodge–Tate sequence only.

**Checks.**

- `ℚ_p/ℤ_p` has `W=0`; `μ_{p^∞}` has `W=C` after its Tate normalization. The two groups are not interchanged.
- `T=0` forces `W=0` and gives the zero group; no positive-rank PEL datum is obtained.
- Changing `T` inside `T[1/p]` can change the integral group. Forgetting `T` does not give this equivalence.
- Cartier duality sends `W` to its annihilator, rather than preserving `W` in the same ambient space.

### IG.F.9 Newton strata and the full automorphism group

<a id="ig-f-bun-strata"></a>

Define `Bun_G^b` by its geometric class `b`, prove the Newton semicontinuity and locally closed immersion, and identify it with `[*/J̃_b]`. Construct `J̃_b=Aut(E_b)`, its split projection to the locally profinite group `J_b(E)`, and its positive connected kernel `J̃_b^0`. Filter that kernel by the positive slope bundles in the adjoint HN filtration. Their section groups are the Banach–Colmez diamonds of IG.F.5. Thus `J̃_b^0` is cohomologically smooth of dimension `d_b=⟨2ρ,ν_b⟩`, with the dominant/sign adapter fixed by IG.0; `J_b` is dimension zero in this cohomological sense. Prove compatibility with the universal-cover automorphism group for a PEL framing by evaluating every defining tensor in IG.F.8. The full quotient, its connected kernel and its discrete quotient have distinct APIs.

The API: `BunGNewtonStratum`, `BunGNewtonStratum_locallyClosed`, `bundleAutGroup`, `bundleAutGroup_toJ`, `positiveBundleAut`, `positiveBundleAut_filtration`, `BunGNewtonStratum_quotient`, `bundleAut_universalCoverEquiv`. Source: [FS](#ref-fs), Theorem III.2.3, pp.89–91, Propositions III.5.1–III.5.3, pp.101–104; [CS17](#ref-cs17), Proposition 4.3.13, p.720. *Needs:* IG.0.19–IG.0.20, IG.F.4–IG.F.6, IG.F.8; DiamondsAndVStacks D3–D5.

**Checks.**

- A basic class has no positive kernel and `d_b=0`; a nonbasic ordinary `GL₂` class has `d_b=1`.
- `G=1` gives `[*/1]`. For `GL₁` the automorphisms are `E^×`, not the trivial group, although `d_b=0`.
- The quotient by `J_b` alone omits the positive kernel in the nonbasic case and does not define `Bun_G^b`.
- Opposite Newton slope conventions must give the same nonnegative dimension after reordering; no negative-dimensional positive group is produced.

### IG.F.10 Artin v-stacks and cohomologically smooth descent

<a id="ig-f-artin-coefficients"></a>

Define an Artin `v`-stack by a representable diagonal and a separated cohomologically smooth cover by a locally spatial diamond. Impose FS Convention IV.1.12: the locally spatial atlas is locally separated, and the charts used for operations satisfy the stated local compactifiability and finite-dimensional hypotheses. Define its torsion `D_ét` category by descent of enhanced categories on such atlases. Prove independence under refinements, and construct pullback, tensor, internal `Hom`, the closed/open support triangle and its adjunctions by their compatible atlas constructions. For a cohomologically smooth map of Artin `v`-stacks glue the invertible dualizing object from smooth diamond charts; define `f^!=D_f⊗f^*` and its left adjoint `f_!`, with smooth base change, composition and projection formula in the cases used below. For representable eligible maps these agree with DiamondSixOperations S1–S4. This is the extra Artin descent, not a claim that that supplier already treats every stack morphism.

Define ULA objects through the dualizability of their relative cohomological correspondence, and prove the stalk/base-change and duality criterion on compactifiable diamond charts of finite relative dimension; use descent to pass to the Artin charts here. This supplies the ULA input to fusion without imposing a perverse `t`-structure on an arbitrary `v`-stack. Source: [FS](#ref-fs), Definitions IV.1.1, IV.1.11–IV.1.17, pp.105–110; Definitions IV.2.1–IV.2.2 and Theorem IV.2.23, pp.112–126.

The API: `ArtinVStack`, `artinEtaleCategory`, `artinEtaleCategory_descent`, `artinDualizingObject`, `artinSmoothExceptionalPullback`, `artinSmoothBaseChange`, `artinSupportTriangle`, `IsULA`, `ula_dualityCriterion`. *Needs:* DiamondsAndVStacks D4–D5; DiamondEtaleCohomology C2–C4; DiamondSixOperations S0–S4; EnhancedDerivedSheaves E0–`E3, E5`:abstract (stable categorical descent and adjoints).

**Checks.**

- A locally spatial diamond with its identity atlas recovers its existing `D_ét` category and six operations.
- `[*/H]` for a locally profinite `H` has the action groupoid atlas, not the cohomology of a point.
- For the identity morphism `D_f=Λ[0]`; a smooth dimension-one geometric map has `Λ(1)[2]`, in cohomological degree `−2`.
- A positive-dimensional map need not be finite or proper. ULA is not inferred merely from bounded stalk dimensions.

### IG.F.11 Modifications, Grassmannians and smooth charts

<a id="ig-f-modification-charts"></a>

Construct the `B_dR⁺` affine Grassmannian over `Div¹_E` as `G`-torsors with a trivialization off the untilt divisor. Extend the constant-`b` marked modification of EndoscopicTransferAndUnitaryTraceComparison §12.1 to arbitrary bundles. Import finite-projective Beauville–Laszlo patching from PadicHodgeTheory §7.5 for unramified coefficients, with its cohomological comparison from §7.6, and use IG.F.2's extension for ramified coefficients. These identify a bundle with modules off the divisor and on its completed neighborhood, together with their gluing isomorphism on the punctured completion. Transport this linear equivalence through tensor stabilizers to `G`-torsors and descend it over the divisor parameter. Define bounded relative position using the Cartan/Iwahori–Weyl combinatorics of ReductiveGroupsPartII RG2.4, prove bounded Schubert loci spatial and proper, and their open cells cohomologically smooth of dimension `⟨2ρ,μ⟩`. For minuscule `μ` the bounded locus is the flag variety and has no smaller cells in its connected relative-position component.

The maps `[G(E)\Gr_{G,μ}]→Bun_G` are separated cohomologically smooth on their open relative-position loci, and their union covers `Bun_G`. Their fibres are the open loci of modifications with trivial resulting geometric bundle. The diagonal is represented by the open invertible locus in a section diamond of `Hom` bundles. Consequently `Bun_G` is an Artin `v`-stack, smooth of dimension `0`, and `Bun_G^b` has dimension `−d_b`. For a minuscule `μ` and compact open `K⊂G(E)`, the corresponding `q_K:[Fℓ_μ/K]→Bun_G` is cohomologically smooth of relative dimension `⟨2ρ,μ⟩`. Smooth base change is therefore available for its stratum immersions; `q_K` is not assigned dimension zero.

The API: `FFModification`, `BDGrassmannian`, `beauvilleLaszloEquiv`, `SchubertDiamond`, `minusculeGrassmannian_flagEquiv`, `BunG_smoothAtlas`, `minusculeModificationMap`, `minusculeModificationMap_cohomologicallySmooth`, `BunGNewtonStratum_dimension`. Source: [FS](#ref-fs), §§III.3–III.4, pp.92–100; Proposition IV.1.18, Theorem IV.1.19 and Proposition IV.1.22, pp.110–111; Proposition VI.2.4, pp.193–195; [Koshikawa](#ref-kos21), Lemma 6.1, p.8. *Needs:* IG.F.1–IG.F.6, IG.F.9–IG.F.10; PadicHodgeTheory §§7.5–7.6 (unramified linear patching and derived comparison); AdicSpacesPartII (completed tensor products); ReductiveGroupsPartII RG2.4.

**Checks.**

- `GL₂, μ=(1,0)`: the minuscule Grassmannian is `ℙ¹` and `q_K` has relative dimension `1`, while `Bun_GL₂` has dimension `0`.
- `G=1` gives a point and relative dimension `0`. `GL₁` has discrete degree changes and zero-dimensional Schubert cells.
- The ordinary stratum has dimension `−d_b` on `Bun_G`; the flag ordinary stratum can have dimension `0`. These are different spaces.
- An unbounded Grassmannian is a union of proper bounded loci, not itself a proper finite-dimensional diamond.

### IG.F.12 Positive-slope Jacobian criterion

<a id="ig-f-jacobian-criterion"></a>

For a smooth quasi-projective sousperfectoid `Z→X_S`, define the section functor `M_Z` and its open locus where the pulled-back relative tangent bundle has strictly positive HN slopes. Prove `M_Z` locally spatial and compactifiable and this open locus cohomologically smooth, of dimension the degree of that tangent bundle at each geometric point. Construct smooth charts using an embedding in an open part of projective space. Deform the section problem to its normal bundle, compare the positive tangent section spaces by the Banach–Colmez presentations of IG.F.5, and descend duality through that deformation. The required deformation-to-normal-cone and formal lifting statements are part of this target; tangent dimension alone is not a proof of smoothness. This criterion supplies the more refined local charts and finite-dimensional estimates in the later coefficient theory.

The API: `FFSectionModuli`, `positiveTangentSectionLocus`, `ffSectionModuli_locallySpatial`, `positiveTangentSectionLocus_cohomologicallySmooth`, `positiveTangentSectionLocus_dimension`, `ffSectionModuli_formalLifting`. Source: [FS](#ref-fs), Proposition IV.3.8, pp.130–131, Definition IV.4.1 and Theorem IV.4.2, pp.131–132, proof in §§IV.4.1–IV.4.4, pp.133–148. *Needs:* IG.F.2–IG.F.5, IG.F.10; AdicSpacesPartIV R5 (smooth sousperfectoid spaces); AlgebraicVectorBundles (tangent bundles, projective embeddings).

**Checks.**

- `Z` a positive bundle gives its positive Banach–Colmez section space and the same degree/dimension.
- A tangent slope `0` is excluded from the positive criterion; vanishing of a numerical obstruction at one point is insufficient.
- The identity section problem has zero tangent bundle and a point as its section space. Positivity of all slopes is vacuous for rank zero and gives dimension `0`.
- Without the quasi-projective embedding the asserted representability is not exported.

### IG.F.12a Contracting charts and cohomology at a Newton point

<a id="ig-f-contracting-charts"></a>

For each `b` construct `M_b` from tensor-compatible increasing filtrations whose graded pieces are semistable of the prescribed slopes, ordered oppositely to HN. It has a projection `q_b` to `[*/J_b(E)]`, a section given by the split filtration, and `π_b:M_b→Bun_G` forgetting the filtration. Prove `π_b` representable, partially proper and cohomologically smooth by realizing these filtrations as the positive-tangent open in a flag-section problem of IG.F.12. The universal `J_b(E)`-torsor `M̃_b` is built by successive negative Banach–Colmez extension spaces. Its complement of the split point is a spatial diamond; a positive integral power of the Newton cocharacter acts with proper quotient and contracts toward that point. These are relative diamonds after base change to a perfectoid space; no absolute representability at the origin is assumed.

Supply the cohomological contraction needed for the charts. For a partially proper spatial diamond `X` over `Spd(k)` of finite transcendence dimension and a spatial `S`, use rational annuli in pseudouniformizers on quasi-pro-étale covers to define the two functors of compact support toward one end of `X×S→S`. Prove both vanish on `α*A⊗β*B`, for torsion coefficients prime to `p`: reduce by a compactified hypercover to strictly totally disconnected affinoid perfectoids, then to the punctured disc and its localization triangle. Uniform cohomological dimension justifies the descent limit and filtered colimits. The two-end construction, its independence of pseudouniformizers and its base-change maps are part of the target. Applying it to `M̃_b` minus its split point proves `RΓ(M̃_b,A)≅A_0` for every torsion étale complex `A`. For integral lisse coefficients use cofinal qc balls around the point with `RΓ(V,𝔽_ℓ)=𝔽_ℓ` and the solid descent argument, rather than commuting arbitrary inverse limits with filtered colimits. Quotienting by pro-`p K` gives `RΓ(M̃_b/K,A)≅(i_b*A)^K`. This constructs the chart adjunction used in IG.F.17.

The API: `NewtonExtensionChart`, `newtonChart_section`, `newtonChart_smooth`, `newtonChart_negativeBC`, `PartialEndSupport`, `partialEndSupport_externalProduct_zero`, `newtonChart_cohomology_stalk`, `newtonChart_proPInvariants`. Source: [FS](#ref-fs), Definition IV.5.2 and Theorem IV.5.3, pp.150–152; Definition V.3.2, Propositions V.3.5–V.3.6 and Theorem V.3.7, pp.171–174; Proposition V.4.2 and Corollary V.4.4, pp.175–176; the integral neighborhood argument preceding Proposition VII.7.2, p.266. *Needs:* IG.F.4–IG.F.6, IG.F.9–IG.F.12; DiamondEtaleCohomology C2–`C4, C8`; DiamondSixOperations S1–S4; EnhancedDerivedSheaves E0–E3. The integral conclusion is established after the solid category of IG.F.17 is defined, with the torsion construction first.

**Checks.**

- For `GL₂` with graded object `O⊕O(1)`, the chart classifies extensions `0→O→V→O(1)→0` and is governed by `BC(O(−1)[1])`; it does not classify just the split bundle.
- For basic `b` there is no negative root extension, and the chart projection is the identity on its classifying stratum. For `G=1` the contraction comparison is the identity on `Λ`.
- The vanishing concerns compact support toward one end. Ordinary compact support of a punctured disc need not vanish, so it cannot replace this functor.
- An infinite pro-`ℓ` quotient cannot use exact invariants on `𝔽_ℓ`; the chart calculation first uses pro-`p K, ℓ≠p`.

### IG.F.13 Classifying stacks and smooth representation categories

<a id="ig-f-coefficient-equivalence"></a>

For locally profinite `H` with a basis of pro-`p` compact opens, identify `D_ét([*/H],Λ)` with the enhanced derived category of smooth `H`-representations. Use the action Čech nerve and continuous cochains; exact pro-`p` invariants for `ℓ≠p` give left-complete descent. Expose the equivalence, unit/counit, restriction, compact induction, derived invariants and the opposite-action dictionary. For `Bun_G^b=[*/J̃_b]`, prove that pullback from `[*/J_b(E)]` is an equivalence. Filter `J̃_b^0` by IG.F.9's positive pieces and prove their torsor pullbacks fully faithful by the counit `Rf_!f^!≅id`. For essential surjectivity on the classifying quotient use the section `J_b→J̃_b`: the pullback under this section is fully faithful by the same positive-torsor theorem, and its composite with the quotient pullback is the identity. An arbitrary positive torsor only gives full faithfulness. This retains the full automorphism group before passing to the equivalent coefficient category.

The API: `classifyingEtale_smoothEquiv`, `classifyingEtale_smoothEquiv_invariants`, `bunStratum_smoothEquiv`, `positiveTorsor_pullbackFullyFaithful`, `bunStratum_smoothEquiv_baseChange`. Source: [FS](#ref-fs), Theorem V.1.1 and Propositions V.2.1–V.2.2, pp.166–170. *Needs:* IG.F.5, IG.F.9–IG.F.10; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2; DiamondEtaleCohomology C2–C4.

**Checks.**

- `H=1` gives `D(Λ)`; `H` finite gives its smooth group algebra category, including derived invariants when `ℓ` divides `|H|`.
- A pro-`p` compact `H` has exact invariants for `ℓ≠p`; no such conclusion is made for pro-`ℓ H`.
- A nonbasic `b` still has `J̃_b^0`. The equivalence of categories does not identify that group with `1` as a `v`-sheaf.
- The zero representation corresponds to the zero sheaf and is bounded/admissible vacuously.

### IG.F.14 Torsor coinvariants, trace and the orientation character

<a id="ig-f-equivariant-orientation"></a>

For an `H`-torsor `f:Y→X` with `H` unimodular and locally pro-`p`, fixed Haar measure and the eligible quotient geometry above, prove `(Rf_!f^*V)⊗^L_{C_c(H,Λ)}Λ≅V` and `RΓ_c(Y,f^*V)⊗^L_{C_c(H,Λ)}Λ≅RΓ_c(X,V)`. Here `Rf_!f^*V` retains its `H`-action until derived coinvariants are taken; it is not already `V`. Construct it first for compact pro-`p` open torsors, then use compact induction over `H` and the Čech resolution; this proves the geometric comparison missing from an algebraic derived-invariants statement. Keep the right/opposite module convention when pairing two left `H`-actions.

For a `J̃_b^0`-torsor `π_unip`, prove `Rπ_unip^!Λ≅Λ(d_b)[2d_b]` as nonequivariant objects and the trace counit `Rπ_unip,!Rπ_unip^!≅id`. Define `κ_b` by the `J_b(E)`-action on this orientation line. Identify it with the character on the Igusa universal-cover orientation by IG.F.9's tensor-compatible dictionary; the actions on the two local factors cancel in Mantovan's tensor product. On the ordinary stratum this yields the equivariant dualizing object `κ_{b₀}^{−1}[−2d]` on `Bun_G^{b₀}`. Its inverse character and negative shift come from the classifying quotient, not from forgetting equivariance in a dimension formula.

The API: `geometricTorsor_coinvariants`, `geometricTorsor_coinvariants_op`, `positiveAut_dualizing`, `positiveAut_traceCounit`, `igusaOrientationCharacter`, `igusaOrientationCharacter_bundleComparison`, `ordinaryBun_dualizing`. Source: [Koshikawa](#ref-kos21), Lemmas 7.3–7.6, pp.9–12, Lemma 9.1, p.15; [FS](#ref-fs), Proposition V.2.1, pp.169–170. *Needs:* IG.0.19–IG.0.20, IG.F.9–IG.F.10, IG.F.13; DiamondSixOperations S2–S4 on representable torsor charts; SmoothRepresentationsOfLocalGroups SR.0d, SR.1–SR.2.

**Checks.**

- A trivial torsor recovers the usual derived coinvariants of the regular representation; `H=1` gives the identity functor.
- Dimension `0` gives shift `0`. In ordinary dimension `1` the connected torsor has twist `(1)[2]`, whereas its classifying stratum contributes `κ⁻¹[−2]`.
- For a nontrivial orientation character, replacing `κ` by the trivial character is not equivariantly correct even when the underlying line is one-dimensional.
- A Haar-normalized compact pro-`p` calculation is valid with `ℓ≠p`; arbitrary averaging over an `ℓ`-group is not used.

### IG.F.15 Several legs, Schubert sheaves and relative perversity

<a id="ig-f-relative-satake-category"></a>

Use GeometricSatakeAndFusion GS0–GS4 on the pulled-back divisor base `(Div¹_E)^I` over `Perf_k`, `k = overline(𝔽_q)`, with its prime-to-`p` torsion coefficients and compatible `ℓ`-adic extensions. `BDGrassmannianLegs` and `boundedHeckeStack` are aliases of GS0's ordered divisor Grassmannians and bounded local Hecke stacks. `RelativeSatakeCategory` is GS2's `satakeCategory`: bounded-support, coefficient-flat, relative perverse ULA objects, retaining descent along the leg base. `schubertIC` denotes the intermediate-extension object of GS1's standard/costandard theory, with that theory's flatness and coefficient-change hypotheses. Standard and costandard objects use GS1; tilting objects are transported from dual-group tilting representations through GS4's equivalence, retaining their highest-weight filtration hypotheses. The category is exact on flat objects; no abelian-category assertion or unrestricted reduction theorem for integral intermediate extensions is imposed.

`satakeWeightFunctor` and `satakeWeightFunctor_exact` denote GS1–GS2's shifted semi-infinite constant terms in degree `⟨2ρ,λ⟩` and their exactness on flat Satake objects. `satakeULA_diagonalExtension` is GS3's collision comparison: restriction to the blockwise disjoint locus is fully faithful, and external products of Satake objects extend by fusion. It does not assert extension of every perverse family. These aliases carry the supplied equivariance, duality and coefficient comparisons to the kernels used in IG.F.18–IG.F.20. Their total-cohomology realization retains continuous `W_E^I`-action; geometric-fibre restriction forgets this descent.

The supplied API: `BDGrassmannianLegs`, `boundedHeckeStack`, `RelativeSatakeCategory`, `schubertIC`, `satakeWeightFunctor`, `satakeULA_diagonalExtension`, `satakeWeightFunctor_exact`. Source: [FS](#ref-fs), §§VI.1–VI.7, pp.186–218, especially Corollary VI.3.8, p.202, Definition/Proposition VI.7.1, pp.211–212, Proposition VI.7.10, p.217, and Definition VI.9.1/Proposition VI.9.2, pp.221–222; Theorem VI.11.1, pp.230–234, for transport of tilting representations. *Needs:* GeometricSatakeAndFusion GS0 (ordered legs and Schubert bounds), GS1 (relative perversity and shifted constant terms), GS2 (Satake category and cohomology functor), GS3 (collision extension and Weil realization), GS4 (dual-group equivalence); IG.F.1, IG.F.11 for the divisor and modification notation in the application.

**Checks.**

- The empty leg set gives the unit Hecke correspondence over `Spd k`. For a one-leg torus modification the kernel is supported at the cocharacter-labelled point of the Schubert fibre.
- For `GL₂, μ=(1,0)`, the kernel in the local cohomology comparison of IG.F.20 is the constant sheaf on `ℙ¹` shifted by `[1]` and twisted by `(1/2)`, once the square root is chosen.
- Restriction of two Igusa Hecke kernels to distinct divisors gives their external product; their collision comparison uses the supplied convolution.
- A fibrewise perverse, non-ULA family cannot serve as an integral Satake kernel for IG.F.18.

### IG.F.16 Fusion, tensor reconstruction and Cartan duality

<a id="ig-f-geometric-satake"></a>

Use GeometricSatakeAndFusion GS2–GS4 with the coefficient hypotheses of IG.F.15 and a chosen unit square root of `q` for the half twist. `satakeConvolution` and `satakeFusion` denote its `heckeConvolution` and parity-corrected `fusionProduct`; `satakeFiberFunctor` is its total cohomology functor with `drinfeldFibreRealization`. `satakeTensorCoherence` and `satakeBaseChange` retain its coherent tensor, finite-set and coefficient-change comparisons. Reconstruction of the pinned dual group and the normalization from its geometric Weil action to its usual pinned action are supplied by GS4.

`relativeSatakeEquiv` is an alias of GS4's `normalizedSatakeEquivalence` over `Perf_k`, `k = overline(𝔽_q)`, with target `Rep^fp_Λ((Ĝ ⋊ W_E)^I)`: the `Ĝ^I`-action is algebraic and the compatible `W_E^I`-action is continuous. `integralGeometricSatakeEquiv` is its geometric single-divisor restriction with target `Rep^fp_Λ(Ĝ)`. Pairwise distinct geometric divisors give `Rep^fp_Λ(Ĝ^I)` after forgetting descent; partial diagonals give fusion and restriction along the corresponding diagonal homomorphisms. The supplied normalization of the sheaf for `μ` is `[δ_μ](δ_μ/2)`, `δ_μ=⟨2ρ,μ⟩`. `satakeCartanDuality` is GS4's `chevalleyInvolution`: switching modifications induces the Cartan involution followed by conjugation by `ρ̂(−1)` in the adjoint dual group. The inner sign and the internal dual `sw*D` are transported with the equivalence. These are the same kernels and comparisons used by the geometric Hecke action on the Igusa cohomology factors in IG.F.18–IG.F.20 and the torsion-concentration argument in IG.7.

The supplied API: `satakeConvolution`, `satakeFusion`, `satakeFiberFunctor`, `integralGeometricSatakeEquiv`, `relativeSatakeEquiv`, `satakeTensorCoherence`, `satakeBaseChange`, `satakeCartanDuality`. Source: [FS](#ref-fs), §§VI.8–VI.12, pp.219–235, Theorem VI.11.1 and Proposition VI.12.1, pp.230–235. *Needs:* IG.F.15; GeometricSatakeAndFusion GS2 (convolution), GS3 (fusion and Weil realization), GS4 (reconstruction, normalized equivalence, coefficient change and Cartan duality).

**Checks.**

- The zero cocharacter with trivial Weil descent gives the unit kernel `Λ[0]` for the Igusa Hecke action. A nontrivial rank-one local system on the leg base retains its descent in that action.
- In IG.F.20, `GL₂, μ=(1,0)` has `δ_μ=1` and standard dual representation of `rank 2`; the local-cohomology shift is `[1]`, as in the supplied Satake normalization.
- For a torus the Igusa Hecke kernels have `δ_μ=0`, including nontrivial characters; their convolution adds character labels.
- Reducing the Igusa Hecke kernels modulo `ℓ` carries the supplied tensor constraints and chosen square root with it. Changing that root changes odd-component half twists coherently.
- For `G=1, E=ℚ₅, Λ=𝔽₉` and one leg, the unramified rank-one systems with geometric Frobenius `+1` and `−1` give the same geometric-fibre Hecke kernel with different Weil actions. With two legs the two Weil actions remain independent.
- With no legs, the supplied category over `Perf_k` is finite projective `Λ`-modules, and the Igusa Hecke correspondence is the unit. Over `Perf_𝔽_q`, the constant and quadratic rank-one systems can remain distinct even with no legs; thus the geometric coefficient-base pullback is essential to this identification.
- Reversing the Igusa modification correspondence retains the simple-root correction: it sends `1` to `−1`, which is `2≠1` in `𝔽₃` and `1` in `𝔽₂`. It vanishes only after passing to invariant functions or conjugacy classes in odd characteristic.

### IG.F.17 Solid and lisse integral coefficients

<a id="ig-f-solid-coefficients"></a>

Starting with Mathlib's condensed modules and EnhancedDerivedSheaves' stable presentable categories, construct solid `Λ`-modules as the localization generated by completed free modules `Λ[[S]]` for extremally disconnected profinite `S`. Specify the solidification adjunction, derived solid tensor, internal `Hom` and the compact projective generators. On small `v`-stacks form `D_■` by descent. Define `D_lis` as the colimit-closed subcategory generated by `f_♮Λ` for separated representable cohomologically smooth charts `f`, with the smallness and finite-dimensional bounds of FS VII.6. For torsion coefficients prove `D_lis=D_ét` on the stacks used here, which have atlases of locally bounded `ℓ`-cohomological dimension; no assertion is made for every small `v`-stack. Construct pullback, the right adjoint pushforward and the left adjoint relative homology `f_♮` where used here. For torsion coefficients identify `f_♮D(V)^∨` with `Rf_!V` under the dualizability hypotheses. For complexes explicitly defined by `ℓ`-power coefficient systems use `Rlim` and its higher-limit terms. The whole lisse category is not restricted to derived `ℓ`-complete objects: smooth `ℚ_ℓ` representations must remain available.

On `Bun_G` use the charts `π_b:M_b→Bun_G` and `q_b:M_b→[*/J_b(E)]` of IG.F.12a. Prove `π_{b,♮}q_b*` is left adjoint to `i_b*`, using their contraction comparison. The objects `A_{b,K}=π_{b,♮}q_b*(c-Ind_K^{J_b(E)}Λ)`, for pro-`p` compact `K`, are compact generators. Prove compactness is equivalent to finite stratum support and compact restrictions, and prove stability under coefficient change. These are chart homology objects; replacing them by `i_{b!}c-Ind_K` is not the compact-generation theorem. Obtain geometric base-change invariance and the restriction/extension functors by induction on the finitely many strata of each qc open. These constructions supply the integral coefficient category on which the Hecke action will act; no condensed module API is claimed already to be the solid or lisse category.

The API: `SolidModule`, `solidification`, `solidTensor`, `solidSheafCategory`, `LisseSolidCategory`, `torsionLisse_etaleEquiv`, `relativeSolidHomology`, `solidHomology_torsionComparison`, `bunLisse_compactGenerators`, `bunLisse_baseChange`. Source: [FS](#ref-fs), §§VII.1–VII.7, pp.239–270, especially Propositions VII.3.1, VII.5.2, VII.6.6 (p.264) and VII.7.3–VII.7.4. *Needs:* IG.F.10–IG.F.13, including IG.F.12a; EnhancedDerivedSheaves E0–E5 (presentability, localization, monoidal descent and derived completion); Mathlib condensed modules; SmoothRepresentationsOfLocalGroups SR.0d.

**Checks.**

- Over a point and finite discrete `Λ`, the torsion comparison is the ordinary enhanced derived category of discrete `Λ`-modules.
- The free module on an infinite profinite set is completed; replacing `Λ[[S]]` by the finite-support algebraic free module fails its universal property.
- Zero coefficients give the zero category. Inverse limits of `ℤ/ℓ^m` use derived limits and retain possible higher-limit terms.
- Compact induction from a pro-`p` compact open is a compact generator in the stated setting; an arbitrary infinite direct sum of such generators need not be compact.

### IG.F.18 Hecke functors and coherent Weil actions

<a id="ig-f-hecke-action"></a>

Fix a finite quotient `Q` of `W_E` through which its pinned action on `Ĝ` factors, and a coefficient algebra `Λ` with the chosen square root of `q`. On the divisor bases over `Perf_k` of IG.F.15–IG.F.16, for `V ∈ Rep^fp_Λ((Ĝ⋊Q)^I)`, inflate along `W_E→Q` and apply the supplied `relativeSatakeEquiv`. Use GeometricSatakeAndFusion GS4's `perfectSatakeFunctor` for perfect representation complexes, with its enhanced kernel realization `D(S_V)^∨` and coefficient and finite-set comparisons. Define `T_V` by pullback to the bounded Hecke stack, tensor with this Satake kernel and relative solid homology to `Bun_G×(Div¹)^I`. On a geometric fibre it depends only on the restricted `Ĝ^I`-representation. An arbitrary `Ĝ^I`-representation defines that geometric-fibre functor; a coherent Weil action requires compatible descent on the input. Enlarging `Q` and inflating `V` preserves the construction. Prove preservation of lisse objects and compact objects, commutation with colimits and coefficient change, the fusion identities, and the left/right adjunctions for dual representations. Prove the partial Frobenius descent/Drinfeld lemma for these ULA lisse objects, obtaining the coherent action of `W_E^I`, functorial in the leg set and compatible with creation and annihilation of equal legs. This is a theorem on enhanced categories and coherent actions, not a list of endomorphisms of cohomology groups.

The API: `geometricHeckeFunctor`, `geometricHeckeFunctor_fusion`, `geometricHeckeFunctor_compact`, `geometricHeckeFunctor_weilAction`, `geometricHeckeFunctor_adjunction`, `geometricHeckeFunctor_coefficientChange`. Source: [FS](#ref-fs), §IV.7, pp.161–164, Proposition IX.2.1, Theorem IX.2.2 and Corollaries IX.2.3–IX.2.4, pp.311–313. *Needs:* IG.F.15–IG.F.17; GeometricSatakeAndFusion GS4 (perfect-complex Satake extension); EnhancedDerivedSheaves E0–E5; SmoothRepresentationsOfLocalGroups SR.6 for the algebraic parameter and excursion relations used next.

**Checks.**

- The trivial representation of `(Ĝ⋊Q)^I` gives the identity functor with trivial extra Weil action. For `G=1`, a rank-one `Q^I`-character gives the identity on the underlying geometric fibre with that character as its Weil action.
- Two separated legs give commuting Hecke functors; fusion identifies the collision with the tensor product representation.
- A unit followed by a counit is the categorical zigzag identity. Reversing a modification requires the dual/Cartan transform, not the same arbitrary `V`.
- Modulo `ℓ`, the coherent action is the derived coefficient extension of the integral construction, not an unrelated characteristic-zero action.

### IG.F.19 Local shtuka spaces over every finite base field

<a id="ig-f-local-shtukas"></a>

For finite `E/ℚ_p`, connected reductive `G/E, b∈B(G)` and a finite tuple of cocharacters `μ_i` with reflex fields `E_i`, construct the local shtuka tower over `∏Spd(Ĕ_i)`. It classifies modifications of `E_b` into the trivial geometric bundle, with `K`-level on its pro-étale `G(E)`-torsor. For the several-leg version use the Frobenius-twisted convolution Grassmannian and its partial diagonals. Prove local spatiality, the étale period morphism, Weil descent, level-change and commuting `J_b(E)` and `G(E)` actions. For a minuscule single leg this is the smooth partially proper local Shimura space.

Fix the direction: modifications from `E_b` to the trivial bundle in the Berkeley convention use `b∈B(G,μ⁻¹)`. If the notation `M(G,b,μ)` uses `b∈B(G,μ)` as in FS IX.3, invert the cocharacter/direction before comparing. For products of `Res_{E/ℚ_p}GL_n`, prove the field/Weil-restriction dictionary and retain each factor's residue cardinal and reflex field. This gives all finite `E`, not just `E=ℚ_p`. Import the basic formal `O_E`/special `O_D` tower and its basic modification comparison from EndoscopicTransferAndUnitaryTraceComparison §§12.3–12.9 and §12.17. The general local-shtuka construction extends that seed and its action conventions. For an unramified PEL datum identify it with the infinite-level Rapoport–Zink space using the integral classification and deformation functor, as required by IG.3.26.

The API: `LocalShtukaSpace`, `localShtuka_periodMap`, `localShtuka_levelTransition`, `localShtuka_weilDescent`, `localShtuka_actionsCommute`, `localShtuka_cocharacterAdapter`, `localShtuka_restrictionOfScalars`, `localShtuka_rzComparison`. Source: [SW Berkeley](#ref-sw-berkeley), Theorem 23.1.4 and Propositions 23.3.1 and 23.3.3 and Corollary 23.3.2, pp.217–220, §§23.4–23.5, pp.221–223, Lecture 24, §§24.1–24.3, pp.225–231; [FS](#ref-fs), §IX.3, pp.314–316 for general `E` and multiple legs. *Needs:* IG.0.27, IG.F.6–IG.F.8, IG.F.11, IG.F.15; PerfectoidSpaces P1–P3; DiamondsAndVStacks D3–D6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.

**Checks.**

- No legs and trivial `b` give the discrete level set `G(E)/K`; nontrivial `b` gives the empty no-leg moduli space.
- `GL₁` has the Lubin–Tate direction and its correct reflex field. A nontrivial finite `E` is not silently replaced by `ℚ_p`.
- The ordinary minuscule `GL₂` datum has flag dimension `1`; inverse direction replaces `μ` by `μ⁻¹`.
- An empty admissible modification locus gives zero cohomology, without a spurious nonempty local Shimura variety.

### IG.F.20 Local cohomology as a Hecke functor

<a id="ig-f-local-cohomology-realization"></a>

For minuscule single-leg data and pro-`p K`, identify the restriction of `T_{r_μ}(j_{1!}c-Ind_K^{G(E)}Λ)` to `Bun_G^b`, through IG.F.13, with compactly supported local-shtuka cohomology shifted by [δ_μ](δ_μ/2), `δ_μ=⟨2ρ,μ⟩`, after using the direction adapter of IG.F.19. Prove this by identifying the fibre of the Hecke correspondence with the actual modification moduli space and matching its Satake sheaf. It is equivariant for `J_b(E), W_{E_μ}` and the opposite spherical Hecke algebra. For general legs use `f_{K,♮}S′_V` with the ULA Satake coefficient and its partial Weil actions; for torsion coefficients this is `Rf_{K,!}S_V`. Prove compactness at pro-`p K`, finite generation of the smooth cohomology groups, and descent to arbitrary compact open `K`. The construction order is the torsion derived limit on each qc open followed by the colimit over qc opens.

The API: `localShtukaCohomology_heckeRealization`, `localShtukaCohomology_satakeShift`, `localShtukaCohomology_compact`, `localShtukaCohomology_finiteGeneration`, `localShtukaCohomology_weilContinuous`, `localShtukaCohomology_generalLegs`. Source: [FS](#ref-fs), Theorem IX.3.1 and Proposition IX.3.2, pp.314–316; [Koshikawa](#ref-kos21), §4, pp.5–6. In the latter's notation the geometric shift must be `δ_μ`, not the rank of `r_μ`. *Needs:* IG.F.13–IG.F.19; SmoothRepresentationsOfLocalGroups SR.0d, SR.1–SR.2.

**Checks.**

- `GL₂, μ=(1,0)` gives shift [1](1/2), while `dim(r_μ)=2`. A shift by `[2]` is the wrong normalization.
- `GL₁` gives `δ_μ=0`, including a nontrivial character `r_μ` of `rank 1`.
- At the identity datum this is compact induction with no geometric shift; empty spaces give zero complexes.
- Pro-`p` compactness is proved before passing to a larger `K`. No Nakayama conclusion for an arbitrary integral localized smooth representation follows.

### IG.F.21 Geometric excursions and the integral spectral centre

<a id="ig-f-spectral-centre"></a>

Import the finite-wild crossed-cocycle schemes, their invariant rings and the excursion algebra from SmoothRepresentationsOfLocalGroups SR.6.1–SR.6.3. For each compact lisse object prove a common open wild subgroup acts trivially on all its Hecke transforms; this is the finite-wild bound needed to evaluate that algebra. For an excursion tuple `(I,V,α,β,(γ_i))` define its endomorphism by creation using `α`, the `W_E^I`-action on `T_V`, then annihilation using `β`. Prove its word, product and concatenation relations from IG.F.18's coherence, so it factors through the imported excursion algebra.

For general `G` impose that `ℓ` is very good for `Ĝ`, or that `ℓ` is invertible in `Λ`, when identifying the invariant-function spectral centre and asserting its duality compatibility; without that condition retain the excursion-algebra action. For `GL_n`, its inner forms and products, every `ℓ≠p` is very good in the FS sense, so the mod-`ℓ` applications here have no extra prime exclusion. Identify the excursion invariant algebra with the spectral centre at each finite-wild level under the FS very-good-prime theorem, and obtain `Z_spec(G,Λ)→End(id_{D_lis(Bun_G,Λ)})`, commuting with Hecke functors, colimits and derived coefficient change. Pass from compact generators to their `Ind`-category with the correct component product decomposition. Restriction to `[*/G(E)]` gives the usual smooth centre. Evaluation on `c-Ind_K` gives `H_K^op`; convert it to the chosen left spherical Hecke action by [KgK]`↦[Kg⁻¹K]`. Its unramified semisimple parameter is the Satake parameter in IG.0.4's normalization. This is the integral geometric action and its mod-`ℓ` reduction, not a characteristic-zero action followed by a claim of reduction.

The API: `geometricExcursionOperator`, `geometricExcursion_relations`, `geometricExcursion_finiteWildBound`, `integralSpectralCentreAction`, `spectralCentreAction_heckeCommute`, `spectralCentreAction_baseChange`, `spectralCentreAction_sphericalEvaluation`. Source: [FS](#ref-fs), Theorem VIII.4.1, printed pp.284–286, Definition/Proposition IX.4.1, p.317, Proposition IX.5.1 and Theorem IX.5.2, pp.317–319. The parameter-algebra part of those statements is already the SR.6 import. *Needs:* IG.F.13, IG.F.16–IG.F.20; SmoothRepresentationsOfLocalGroups SR.1, SR.4, SR.6.

**Checks.**

- A scalar excursion acts by that scalar; `G=1` supplies only scalars and the trivial parameter.
- For `GL₁` the spherical operator and its inverse are exchanged by the chosen conversion from `H^op`; omitting inversion changes the Frobenius eigenvalue.
- Reducing an integral scalar or excursion modulo `ℓ` agrees with its action on the derived reduction, including at `ℓ=2` when `p≠2`.
- A compact object has a finite-wild bound; no single wild bound is imposed on the whole `Ind`-category.

### IG.F.22 Parameters, induction, reduction and duality

<a id="ig-f-parameter-compatibilities"></a>

Attach to each irreducible smooth representation over an algebraically closed coefficient field its semisimple parameter from the centre of IG.F.21. For `GL_n`, its inner forms and products prove: compatibility with product representations; compatibility of normalized parabolic induction with the untwisted Levi embedding; compatibility with semisimplified mod-`ℓ` reduction of integral characteristic-zero supercuspidal supports; and compatibility with smooth and Bernstein–Zelevinsky duality under the Cartan involution. Construct the parabolic correspondence using reductions to a parabolic on the curve and its constant-term functor. Compare the Hecke correspondence there with the Levi one, calculate the modulus from the adjoint root spaces, and then compare excursion operators. For unnormalized induction the parameter is multiplied by `(2ρ_Ĝ−2ρ_M̂)(√q)^{|w|}`, with `|geometric Frobenius|=1`. Separately, the action on a Newton stratum uses the Newton Levi twist of FS IX.7.2. The two twists must not be conflated. Coefficient change in IG.F.21 identifies their reductions; it does not claim every reduction stays irreducible. Duality follows from the Cartan comparison of IG.F.16 and the Hecke adjunctions.

In characteristic zero identify the `GL_n` and inner-form parameter with semisimplified local Langlands. Use the usual LLC and its normalization from EndoscopicTransferAndUnitaryTraceComparison §§10.3, 10.26–10.32, and the local-shtuka trace comparison specified in IG.F.22a for the supercuspidal case; parabolic compatibility gives the general semisimple case. The comparison with the FS parameter, including inner forms, is this target's new theorem. After reduction this is exactly the input used in IG.7.10, with Mínguez–Sécherre's lifts supplied by IG.7.9.

The API: `fsParameter`, `fsParameter_product`, `fsParameter_parabolic`, `fsParameter_integralReduction`, `fsParameter_smoothDual`, `fsParameter_bzDual`, `fsParameter_llcInnerForm`. Source: [FS](#ref-fs), Proposition IX.5.3, pp.319–320, §IX.6, pp.320–322, Definition IX.7.1, p.324, Theorem IX.7.2, p.325, and Corollary IX.7.3, p.328; [HKW](#ref-hkw21), Theorem 1.0.3, p.5, and its parameter-comparison application recorded in [Koshikawa](#ref-kos21), §3, pp.4–5. *Needs:* IG.F.13–IG.F.21; ReductiveGroupsPartII RG2.5; SmoothRepresentationsOfLocalGroups SR.2–SR.6; EndoscopicTransferAndUnitaryTraceComparison §§10.3, 10.26–10.32; IG.7.9 only for the later mod-`ℓ` lifting application, not for the construction of the centre.

**Checks.**

- `GL₁` gives the local Artin character; duality inverts it. Products retain a parameter for each factor.
- For `GL₂` and `q=9` with `√q=3` in `𝔽₁₁`, the unnormalized Frobenius twist is `diag(3,4)`, determinant `1`, whereas the normalized trivial Levi character has twist `diag(1,1)`. The two embeddings are different.
- A reducible semisimplified mod-`ℓ` reduction yields a sum of parameters, not an assertion of irreducibility.
- A nontrivial division inner form has parameters whose supercuspidal support need not be unramified generic, the obstruction exploited by IG.7.10.

### IG.F.22a Elliptic local trace and the inner-form comparison

<a id="ig-f-elliptic-local-trace"></a>

For the local-shtuka Hecke correspondence of IG.F.19–IG.F.20 and bounded admissible torsion or rational coefficients, construct the dualizable cohomological-correspondence category and its trace maps. Prove the relative Lefschetz–Verdier identity when the fixed-locus trace is proper over the base and the cohomological correspondence is dualizable. In the elliptic regular local-shtuka application, identify the inertia/fixed-locus components by matching elliptic elements of `G(E)` and `J_b(E)`, and compute the local terms by the fixed points of the minuscule flag, with multiplicities the weights of `r_μ` and the normalized Haar factors. The required fixed-locus compactness is proved on the quotient correspondence, not by asserting that the noncompact local-shtuka space is proper. Verdier trace/base change comes from IG.F.10 and the enhanced correspondence construction; the root/Schubert local terms come from IG.F.15–IG.F.16. Carry this through rational coefficient descent from finite extensions of `ℚ_ℓ`.

For inner forms of `GL_n` use the elliptic character relation to show that the virtual local cohomology pairing with a Jacquet–Langlands transfer contains `dim(r_μ)` times the original supercuspidal representation, up to a nonelliptic virtual representation. Use the character/Jacquet–Langlands identities of §§10.3, 10.26–10.32 and the cuspidal quotient of the Grothendieck group (SR.2–SR.3) to detect a nonzero supercuspidal constituent. The excursions commute with the Hecke functor, so that constituent and the transferred representation have the same semisimple parameter. On the split `GL_n` side import the actual supercuspidal Lubin–Tate/Drinfeld realization and both basic Hecke orientations from EndoscopicTransferAndUnitaryTraceComparison §§12.17–12.22, including the source-torsor selectors, contragredients, middle shift and half twist. Compare that actual basic Hecke fibre with IG.F.20 and commute excursions through it. This proves the split parameter agreement used by the inner-form transfer argument. The classical realization is not reconstructed here. Together with IG.F.22's parabolic compatibility it proves `fsParameter_llcInnerForm`.

The API: `localCorrespondenceTrace`, `localTrace_relativeFormula`, `localTrace_ellipticFixedLocus`, `localTrace_weightMultiplicity`, `localTrace_jacquetLanglandsConstituent`, `fsParameter_splitLLC`, `fsParameter_innerTransfer`. Source: [HKW](#ref-hkw21), Theorem 4.3.7, pp.32–33, local-term calculations in §§5.3–5.4, pp.50–53, Theorem 6.5.2 and its proof, pp.69–72, and Theorem 6.6.1, p.73; [FS](#ref-fs), §IX.6, pp.320–324. *Needs:* IG.F.10, IG.F.13–IG.F.21 and the product/parabolic part of IG.F.22; EndoscopicTransferAndUnitaryTraceComparison §§10.3, 12.17–12.22 for the classical LLC, elliptic character identities and actual basic tower realization; SmoothRepresentationsOfLocalGroups SR.2–SR.3 for finite-length representations, characters and the elliptic quotient. The LLC identification is the output of this target; it is not an input to the geometric excursion construction.

**Checks.**

- `GL₁` has a zero-dimensional modification fibre; its trace is the character value and recovers local class field theory with geometric Frobenius.
- For the standard `GL₂` minuscule representation the elliptic multiplicity is `2`, although the Satake shift is `1`. The multiplicity is not substituted for that shift.
- A nonelliptic virtual error has zero elliptic character and need not be the zero virtual representation. Only its image in the elliptic quotient is discarded.
- Noncompact local-shtuka spaces do not satisfy the proper-space trace formula merely because their bounded fixed loci are compact; the relative correspondence hypothesis is retained.

### IG.F.23 Central support and the ordinary comparison

<a id="ig-f-central-support"></a>

For bounded admissible stratum complexes through IG.F.13, define central localization from the action of IG.F.21. On pro-`p` compact invariants the cohomology groups are finite-dimensional; hence their centre images are finite-dimensional algebras. Use their Artinian primary decompositions and the compatible system over compact opens to detect support by irreducible constituents. For a fixed generic unramified central point, IG.7.10 shows that the localized contribution from every non-quasi-split `J_b` is zero. Apply this on the compact invariant pieces and pass through the bounded complex; do not infer the assertion for arbitrary unbounded nonadmissible complexes merely from a list of simple constituents.

Prove vanishing of all derived `Hom` between the resulting disjoint local support factors: a central element invertible on one factor and nilpotent on the other annihilates every Ext, and apply this to the finite central support of each bounded admissible stratum complex and to the corresponding localization of the other object. A separating central function is inverted on one factor and kills a power of the other on each bounded compact-invariant piece. These projectors are natural on the complex, so the acyclicity is established before a derived inverse limit; objectwise vanishing without this compatible central contraction would not suffice. The same central action is natural under stratum extension and exceptional restriction by IG.F.18–IG.F.21. First prove the reflexivity criterion: a torsion object on an open of `Bun_G` is Verdier reflexive exactly when every pro-`p` invariant stratum restriction is reflexive over `Λ`. Use the chart generators of IG.F.12a and the identities `D Rj_*=j_!D` and stratum biduality, inducting over qc opens. Bounded admissible complexes over a finite field satisfy it. Duality then transports support through the Cartan involution, which preserves the generic unramified open set. Combine this with smooth base change along `q_K` and the ordinary dualizing line of IG.F.14 to obtain the precise nonordinary terms used in IG.7.13. This target concerns that localized bounded admissible application, not an unrestricted Ext-vanishing theorem for every pair of set-theoretically disjoint supports on an arbitrary ring.

The API: `bunVerdierReflexive_iff_invariants`, `stratumCentralLocalization`, `stratumSupport_compactInvariants`, `stratumSupport_constituents`, `localizedExt_eq_zero`, `stratumSupport_duality`, `ordinaryComparison_nonordinaryTerm`. Source: [Koshikawa](#ref-kos21), §9, pp.14–16, especially Lemma 9.1, p.15; [FS](#ref-fs), Theorem V.6.2, pp.179–180, Theorem IX.5.2 and Proposition IX.5.3, pp.319–320; Mathlib localization and Artinian module decomposition as in IG.0.5. *Needs:* IG.0.5, IG.F.10–IG.F.14, IG.F.18–IG.F.22a, IG.7.10 for the nonordinary parameter exclusion.

**Checks.**

- The zero complex has empty support and zero Ext. Equal central characters do not give vanishing.
- Over a finite-dimensional centre algebra the distinct primary summands are orthogonal in every Ext degree; a nontrivial self-extension inside one summand is allowed.
- In a two-degree bounded complex the same central projector acts on the differential, so localization does not discard an extension between those degrees.
- Admissibility and boundedness are used before the support test; the claim is not extended to a nonadmissible infinite product by assertion.

### Examples

For `GL₂` with `μ=(1,0)`, the flag is `ℙ¹, δ_μ=1` and `r_μ` has `rank 2`. The ordinary Newton class has `d_b=1`, so its `Bun` stratum has dimension `−1`, its positive automorphism group has dimension `1` and its dualizing line is `κ⁻¹[−2]`. The basic class has `d_b=0` and no positive kernel. These computations fix three distinct dimensions and prevent exchanging the local Satake shift, a group dimension and a stratum dimension.

For `GL₁` over a finite extension `E`, the local classifying category is the smooth representation category of `E^×`, and the excursion/spherical dictionary reduces to the Artin character and inversion of the uniformizer operator. This example is valid in mod-`2` coefficients when `p≠2` and does not require a semisimple reduction of every integral representation to be irreducible.

### Dependencies

Layers IG.0–IG.2; AdicSpaces Layer 6, AlgebraicVectorBundles, ReductiveGroups and ReductiveGroupsPartII RG2.4–RG2.5, LocalGaloisGroups, SmoothRepresentationsOfLocalGroups SR.0–SR.6 and ClassFieldTheory; EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.1–12.22 (only the specified classical and basic tower interfaces); PerfectoidSpaces P0–P3; AdicSpacesPartII R0; AdicSpacesPartIV R5; DiamondsAndVStacks D3–D6; EnhancedDerivedSheaves E0–E5; DiamondEtaleCohomology C2–C4; DiamondSixOperations S0–S4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2, R07.6; PELModuli M0; §§10.3, 10.26–10.32 for the usual LLC. Internal sequencing is rational crystalline comparison before integral essential surjectivity, then geometric Hecke action before parameter exclusion and central-support comparison. The latter two applications do not feed back into construction of the curve, coefficient category or centre.

## Layer IG.3: Hodge–Tate period fibres and the product formula

### IG.3.1 The good-reduction locus and tower

<a id="ig-3-good-reduction-locus"></a>

Inside the adic space `S_{K(N),ℚ_p}` attached to `S_{K(N)} ⊗ ℚ_p`, the good-reduction locus `S°_{K(N),ℚ_p}` is the locus of points where the universal abelian variety has good reduction; it is a Hecke-equivariant quasicompact open subspace, equal for `p ∤ NΔ_F` to the adic generic fibre of the `p`-adic completion of `S_{K(N)} ⊗ ℤ_p`. At infinite level, `S°_{K(p^∞N)} := lim_m S°^◇_{K(p^mN),ℚ_p}` is representable by a perfectoid space (Scholze, Theorem 4.1.1), open in `S^*_{K(p^∞N)}`, and the Hodge–Tate period map restricts to `π°_HT : S°_{K(p^∞N)} → Fℓ`. Here `S^*_{K(p^∞N)} = lim_m S^{*,◇}_{K(p^mN),ℚ_p}` and `S^tor_{K(p^∞N)} = lim_m S^{tor,◇}_{K(p^mN),ℚ_p}` (limits of spatial diamonds), both representable by perfectoid spaces (`S^tor` for a cofinal choice of `Σ`).

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §2.6, p. 31; §2.6, Theorem 2.6.2, p. 30.)

The API: `goodReductionLocus`, `goodReductionLocus_eq_genericFibre`, `goodReductionLocus_hecke`, `goodReductionLocus_infinite`, `goodReductionLocus_piHT`.

*Needs:* IG.0; PerfectoidShimuraVarieties Layer 0, Layer 2, Layer 4, Layer 1, Layer 3; SchemeAndStackFoundations §§4.7–4.8; AdicSpacesPartIII `F0, R2`

**Checks.**

- Supersingular modular residue discs belong to `S°`, so `S°` is larger than the ordinary tube.
- The complementary geometric rank-one points are punctured cusp discs; this alone does not assert an adic open complement.
- For noncompact `S` the good-reduction locus need not be closed.

### IG.3.2 Cohomology of the good-reduction locus

<a id="ig-3-good-reduction-locus-cohomology"></a>

Fix an integral PEL datum of type `(A)` or `(C)` unramified at `p`, its reductive hyperspecial model `𝒢/ℤ_p`, a place `𝔭|p` of the reflex field and sufficiently small neat tame level `K^p`. Let `C` be complete algebraically closed over `E_𝔭` and `ℓ≠p`. At hyperspecial level `K_p=𝒢(ℤ_p)`, let `S°_{K^pK_p,C}` be the adic generic fibre of the `p`-adic completion of the smooth integral PEL model. For every deeper compact open `K_p⊂𝒢(ℤ_p)`, define `S°_{K^pK_p,C}` by inverse image from that hyperspecial level. The natural restriction

`RΓ(S_{K^pK_p,ℚ̄_p},𝔽_ℓ) ≅ RΓ(S°_{K^pK_p,C},𝔽_ℓ)`

is an equivalence for every such `K_p`. Prove compatibility with level pullbacks, finite étale trace and the Hecke correspondences of the tower, including the `p`-adic correspondences after passage to a common deeper level. Taking the geometric-level colimit gives a `G(ℚ_p)×W_{E_𝔭}`-equivariant comparison at infinite `p`-level, with the geometric source base-changed through the fixed embedding into `C`. The balanced unitary comparison at `K(N)` is a specialization. This statement concerns constant `𝔽_ℓ` coefficients.

Source: [Koshikawa](#ref-kos21), §5, Lemma 5.1 and its preceding all-level definition of `S°_K`, p.7; §7, proof of Theorem 7.1, p.10. The balanced unitary specialization is [CSnc](#ref-csnc), Proposition 2.6.4 and its proof, pp.31–32, using [ls18b](#ref-ls18b), Corollary 5.20, p.25 of the authors' compilation. The maps are restrictions on a Hecke-stable tower, so their naturality supplies the stated compatibilities.

*Needs:* PELModuli M0–M3; PerfectoidShimuraVarieties Layers 0–4 (the PEL towers and their Hecke maps); ClassicalAdicEtaleCohomology §§4.4–4.5; ShimuraCompactifications C5; LefschetzPencilsAndVanishingCycles LPV.0.

**Checks.**

- For a proper good-reduction PEL model, `S°=S` at hyperspecial level and at every deeper level; the comparison is the usual algebraic/adic comparison.
- For a nonproper modular curve and a full `p^r`-level above a fixed neat tame level, use the inverse image of the hyperspecial good-reduction locus. The cusp neighbourhoods are excluded without changing ordinary `𝔽_ℓ` cohomology; the assertion is not limited to `r=0`.
- For `K′_p⊂K_p`, the restriction square with the two level pullbacks commutes. A `p`-Hecke correspondence gives the same square at its common refinement, and these squares remain compatible in the infinite-level colimit.
- A type-`C` Siegel datum has the same comparison at all deeper levels; no balanced unitary signature is required.

### IG.3.3 Flag points and `p`-divisible groups

<a id="ig-3-flag-points-and-p-divisible-groups"></a>

Let `Fℓ` be the adic space over `ℚ_p` attached to the flag variety of totally isotropic `F`-linear subspaces of `V`. For `C` as above, points `x ∈ Fℓ(C)` correspond bijectively to isomorphism classes of pairs `(𝒳_{O_C}, α)` with `𝒳_{O_C}` a `p`-divisible group with `G`-structure over `O_C` and `α : T_p𝒳_{O_C} ≅ L ⊗ ℤ_p` an isomorphism compatible with `G`-structures; the subspace is the Hodge–Tate filtration `Lie 𝒳 ⊗ C(1) ⊂ T_p𝒳 ⊗ C`. The special fibre `X_k = 𝒳_{O_C} ⊗ k` is a `p`-divisible group with `G`-structure over `k`, whose isogeny class defines `b(x) ∈ B(G_{ℚ_p}, μ^{−1})`. The filtration `𝒳^μ ⊂ 𝒳° ⊂ 𝒳` transported by `α` is a symplectic `O_F`-linear filtration of `L ⊗ ℤ_p`; fixing a symplectic splitting `δ` gives a splitting `δ_{𝒳}` of `𝒳` and `δ_X` of `X`.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.1, p. 51; §2.7, p. 33.)

*Needs:* IG.0; IG.F.7–IG.F.8 (integral PEL classification and rational crystalline comparison); PerfectoidShimuraVarieties Layer 3.

**Checks.**

- For the minuscule `GL₂` flag variety, a rational line in `ℙ¹(ℚ_p)` gives an ordinary group.
- A nonrational line in `ℙ¹(C)∖ℙ¹(ℚ_p)` gives the basic Newton class.
- Changing the integral Tate framing from `α` to `g∘α`, for `g∈GL₂(ℤ_p)`, transforms the flag by `g` and leaves the underlying `p`-divisible group isomorphic.

### IG.3.4 The Newton stratification of the flag variety

<a id="ig-3-flag-newton-stratification"></a>

Let `G` be connected reductive over `ℚ_p, μ` a minuscule conjugacy class of cocharacters with field of definition `E`, and `Fℓ_{G,μ}` the adic flag variety over `E`. A point `x ∈ Fℓ_{G,μ}(C, C⁺), C` complete algebraically closed over `E`, determines through the Bialynicki-Birula map and Beauville–Laszlo gluing a modification `E(x)` of type `μ` of the trivial `G`-bundle on the Fargues–Fontaine curve `X_{C♭}`; by Fargues' classification its isomorphism class is an element `flagNewtonClass` `b(x) ∈ B(G)`. Define the stratum `Fℓ^b_{G,μ}` as the set of points with `b(x) = b`. Prove: `(1) b(x)` depends only on the image of `x` in `|Fℓ_{G,μ}|`, and a higher-rank point has the class of its rank-one generization; `(2) b(x) ∈ B(G, μ⁻¹)`, that is, `ν_{b(x)} ≼ overline(μ⁻¹)` and `κ(b(x)) = −μ^♭`, taking the dominant representative of `μ⁻¹` before its Galois average as in IG.0.2 (Newton polygon above Hodge polygon for the modification); `(3) x ↦ b(x)` is lower semicontinuous on `|Fℓ_{G,μ}|`; `(4)` every stratum is locally closed, the basic stratum is open, and `Fℓ^{≽b}_{G,μ} = ⊔_{b ≼ b′} Fℓ^{b′}_{G,μ}` is closed. For PEL data the class `b(x)` of a rank-one point agrees with the isogeny class of the special fibre of its `p`-divisible group (IG.3, corresponding Newton strata on rank-one points).

The hypotheses are that `G` is connected reductive over `ℚ_p` and `μ` is minuscule; `(2)` holds for arbitrary `μ` on the `B_dR⁺`-affine Grassmannian.

([CS17](#ref-cs17), §3.5, Proposition 3.5.3 with Lemmas 3.5.4–3.5.5, pp. 687–689; Definition 3.5.6, Proposition 3.5.7 and Corollary 3.5.9, pp. 689–690.)

The API:

- `flagNewtonClass`: `b : |Fℓ_{G,μ}| → B(G)`, constant along generizations.
- `flagNewtonStratum`: The strata `Fℓ^b_{G,μ}`.
- `flagNewtonClass_mem_admissible`: Statement `(2)`.
- `flagNewtonClass_lowerSemicontinuous`: Statement `(3)`.
- `flagNewtonStratum_isLocallyClosed`, `flagNewtonStratum_basic_isOpen`, `flagNewtonStratum_ge_isClosed`: Statement `(4)`.

*Needs:* IG.0 (`B(G)` and `B(G, μ)`); PerfectoidShimuraVarieties Layer 3 (the flag variety); IG.F.6–IG.F.8, IG.F.11 (`G`-bundles, crystalline comparison and modifications).

**Checks.**

- For `G = GL_2` and `μ = (1, 0), Fℓ = ℙ¹`: the basic stratum is Drinfeld's upper half plane `ℙ¹ ∖ ℙ¹(ℚ_p)`, which is open, and the ordinary stratum is `ℙ¹(ℚ_p)`, which is closed of dimension zero.
- For a torus `T` every point has the same class, the unique element of `B(T, μ⁻¹)`, so there is a single stratum.
- For `G=Res_{L/ℚ_p}𝔾_m` with `L/ℚ_p` unramified quadratic and `μ=(1,0)`, the flag variety is a point, `κ(b)=−1` and `ν_b=(−1/2,−1/2)=overline(μ⁻¹)`. Since a torus has no coroots, dominance is equality; `ν_b≼(−1,0)` fails.
- A class outside `B(G, μ⁻¹)`, for example the `GL_2` class with slopes `2` and `−1` against `μ = (1, 0)`, has empty stratum.
- The basic stratum is dense: for `GL_2` its closure is `ℙ¹`, while the ordinary stratum is its own closure.

### IG.3.5 Dimensions of flag Newton strata

<a id="ig-3-flag-newton-strata-dimension"></a>

Let `Fℓ = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} Fℓ^b` be the Newton stratification (`x ∈ Fℓ^b(C)` iff `b(x) = b`), with the strata of the preceding target. Then the Krull dimension of `|Fℓ^b|` is `⟨2ρ, μ⟩ − ⟨2ρ, ν_b⟩ = d − d_b`, where `d = [F⁺:ℚ]n²` and `d_b = ⟨2ρ, ν_b⟩ = dim Ig^b`. Since the reflex field is `ℚ`, the ordinary element is the largest in `B(G_{ℚ_p}, μ^{−1})` and `Fℓ^{ord} = Fℓ(ℚ_p)` is `0`-dimensional; `d_{b′} ≥ d_b` whenever `b′ ≥ b`.

Work in the valued-field fibre setting. Assume also Unramified PEL data of type `(A)` or `(C)` (for the local argument).

([CS17](#ref-cs17), §4.2, Proposition 4.2.23, p. 713; [CSnc](#ref-csnc), §2.7, Theorem 2.7.3, p. 33; §2.7, p. 33.)

*Needs:* IG.3; IG.0; DiamondEtaleCohomology C8; PerfectoidShimuraVarieties Layer 1.

### IG.3.6 The local Hodge–Tate period map

<a id="ig-3-local-hodge-tate-period-map"></a>

For an unramified local PEL datum `D^int`, let `M_{D^int} = (𝔐_{D^int})^ad_η` and, for `n ≥ 0, M_{D^int,n}` the finite étale covers parametrizing `O_B`-linear `Λ/p^n → G[p^n]^ad_η` matching the pairings (with `ζ_{p^n}` fixed). `M_{D^int,∞}` sends a complete affinoid `(Ĕ(ζ_{p^∞}), O)`-algebra `(R, R⁺)` to triples `(G, ρ, α)` with `(G, ρ) ∈ M_{D^int}(R, R⁺)` and `α : Λ → T_pG^ad_η(R, R⁺)` an `O_B`-linear map matching the pairing and an isomorphism at all geometric points. `(1) M_{D^int,∞}` is representable by an adic space, preperfectoid, with `M_{D^int,∞}` ∼ `lim_n M_{D^int,n}`; it depends only on `D` (write `M_{D,∞}`) and is the sheafification of `B`-linear maps `V → (X̃_b)^ad_η(R, R⁺)` matching the polarization, with totally isotropic image in `D(X_b)[1/p] ⊗ R`, locally free quotient `W` locally `≅ V₁ ⊗ R`, and exact `0 → V → X̃_b(C, C⁺) → W ⊗ C → 0` at geometric points. `(2)` There is a `G(ℚ_p)`-equivariant local Hodge–Tate period map `π_HT : M_{D,∞} → Fℓ_{G,μ}` (`Fℓ_{G,μ}` parametrizing `B`-equivariant quotients `V ⊗ R → W′` with totally isotropic kernel, `W′` locally `≅ V₀ ⊗ R`), sending a point to the kernel of `V ⊗ R → D(X_b)[1/p] ⊗ R`. `(3) π_HT` factors through the `b`-stratum: `π^b_HT : M_{D,∞} → Fℓ^b_{G,μ}`.

The `G(ℚ_p)`-action on `α` commutes with the `J_b(ℚ_p)`-action on `ρ`. The period map is invariant under the second action.

Assume Unramified local PEL datum of type `(A)` or `(C)`.

([CS17](#ref-cs17), §4.2, Theorem 4.2.4, p. 699; §4.2, Proposition 4.2.5, p. 702; §4.2, Proposition 4.2.6, p. 702.)

The API: `RZSpaceInfinite`, `RZSpaceInfinite.tilde_lim`, `RZSpaceInfinite.rational_description`, `localHodgeTate`, `localHodgeTate_mem_stratum`, `RZSpaceInfinite.groupActions`.

*Needs:* IG.0; IG.3; PerfectoidShimuraVarieties Layer 3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- `J_b` acts within a period fibre, while `G(ℚ_p)` acts equivariantly on the flag variety.
- For the basic `GL₂` Lubin–Tate datum the period image is the Drinfeld upper half-plane.
- Thus that map is not onto `ℙ¹`: it omits the rational flags.

### IG.3.7 Local period fibres as automorphism orbits

<a id="ig-3-local-period-fibres"></a>

Fix `K_∞ =` the completion of `Ĕ(ζ_{p^∞})`, and take the infinite-level PEL space `M_{D,∞}`, the flag variety `Fl_{K_∞}`, and `Aut_G(X̃_b)^ad_η` after the indicated base changes to `K_∞`. The automorphism action changes the quasi-isogeny and preserves both the Hodge–Tate period and the map to `K_∞`. Its action map `M̂_{D,∞} ×_{Spa K_∞} Aut_G(X̃_b)^ad_{η,K_∞} → (M_{D,∞} ×_{Fl_{K_∞}} M_{D,∞})^∧` is an isomorphism of perfectoid spaces. Here hats denote strong completions of the preperfectoid adic spaces. If the flag variety is kept over the smaller base `Ĕ`, the target also has pairs with different cyclotomic structure maps; the action identifies only the part over the cyclotomic diagonal.

Assume Unramified local PEL datum of type`(A)` or`(C)`; choose the completed cyclotomic base `K_∞` and take the flag fibre product over `Fl_{K_∞}`.

([CS17](#ref-cs17), §4.2, Proposition 4.2.14, p. 709.)

*Needs:* IG.3; IG.0; HodgeTateAndCanonicalSubgroups §§2.4–2.8; PerfectoidSpaces P2; PerfectoidSpaces P7.

### IG.3.8 Extension from rank-one points

<a id="ig-3-integral-extension-lemma"></a>

Let `R⁺` be a `ℤ_p`-algebra integrally closed in `R = R⁺[1/p]`, and `G, H p`-divisible groups over `R⁺` whose Newton polygons at points of `Spec(R⁺/p)` are constant. A morphism `f_R : G_R → H_R` over `R` extends (necessarily uniquely) to `f : G → H` over `R⁺` if and only if for every geometric rank-one point `Spa(C, O_C)` of `Spa(R, R⁺)` the base change `f_C` extends to `O_C`.

Assume `R⁺` integrally closed in `R⁺[1/p]`; constant Newton polygons.

([CS17](#ref-cs17), §4.2, Lemma 4.2.15, p. 709.)

*Needs:* IG.0; Mathlib `ValuationRing`.

### IG.3.9 Period surjectivity on the `b`-stratum

<a id="ig-3-local-period-surjective-on-stratum"></a>

For `C/Ĕ(ζ_{p^∞})` complete algebraically closed, `π^b_HT : M_{D,∞}(C, O_C) → Fℓ^b_{G,μ}(C, O_C)` is surjective.

Assume Unramified local PEL datum of type `(A)` or `(C)`.

([CS17](#ref-cs17), §4.2, Lemma 4.2.18, p. 711.)

*Needs:* IG.3; IG.F.7–IG.F.8 (tensor-compatible crystalline and integral comparisons).

### IG.3.10 Dimension of the adic automorphism group

<a id="ig-3-automorphism-group-dimension"></a>

For every complete nonarchimedean field `K` over `O_Ĕ, Aut_G(X̃_b)^ad ×_{Spa(O_Ĕ)} Spa(K, O_K)` is partially proper over `Spa(K, O_K)`, of dimension `⟨2ρ, ν_b⟩`; each connected component is `Spa(O_Ĕ[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]) ×_{Spa O_Ĕ} Spa(K, O_K)`, after extending `K` to a perfectoid field and tilting, the same dimension is computed on a `d`-dimensional open unit disc.

Assume Unramified local PEL data of type `(A)` or `(C)`; `K` of characteristic `0`.

([CS17](#ref-cs17), §4.2, Proposition 4.2.22, p. 712.)

*Needs:* IG.0; IG.3; DiamondEtaleCohomology C8.

### IG.3.11 The canonical Witt lift

<a id="ig-3-canonical-lift-of-igusa"></a>

For a perfect `k`-scheme `X`, construct `W(X)` by gluing the `p`-adic formal schemes `Spf W(R)` on its affine opens. Witt localization is `p`-adically completed localization at the Teichmüller lift, so these charts glue. This is the unique `p`-torsion-free `p`-adically complete lift with its specified reduction and `W(k)`-structure: recursively lift `p`-power roots to construct the multiplicative Teichmüller section, then the unique `p`-adic Witt expansion. No noetherian hypothesis is imposed on `R`. For a complete extension `K/Ĕ, Ĕ=W(k)[1/p]`, define `W(X)_{O_K}` by completed tensor product. Uniqueness after this base change uses formal étaleness of a perfect characteristic-`p` algebra and successive square-zero thickenings, not the false assertion that `R⊗O_K/p` is perfect. The ideal `ker(O_C/p→k)` is nil, so it does not change the special-fibre étale site; the formal étale site follows by henselian lifting at every finite adic quotient.

The adic generic fibre is perfectoid **when K is perfectoid**: on affine charts the completed tensor algebra is uniform, and Frobenius on its power-bounded reduction modulo `p` is onto, from perfection of `R` and Frobenius surjectivity on `O_K/p`. Establish uniformity on the finite-type perfected approximants and descend the compatible rational localizations. For arbitrary complete `K` the formal lift still exists; perfectoidness is not asserted. In particular `Spa Ĕ` is not perfectoid.

Apply the construction to `Ig^b, Ig^{X,tor}` and `Ig^{X,*}`. On `Nilp_{O_Ĕ}`, the resulting lift parametrizes abelian varieties with `G`-structure up to `p`-power isogeny with an isomorphism of their universal cover with that of `X_b`. After fixing a lift `(X_b)_{O_K}∈𝔐^b(O_K)`, rigidity of the universal cover and semi-abelian Serre–Tate theory identify its points with `(A,ρ), ρ:A[p^∞]≅(X_b)_{O_K}`. For the functor `𝔛^b` of `(A,ρ)` with `ρ:A[p^∞]⊗R/p→X_b⊗R/p` a structured quasi-isogeny, prove `𝔛^b_{O_K}≅Ig^b_{O_K}×_{O_Ĕ}𝔐^b`, with projection `(A,ρ)↦(A[p^∞],ρ⁻¹)` to the RZ convention of IG.0.27. The framing on the product is `X_b→G`; the quasi-isogeny on the auxiliary abelian point is its inverse, composed with its Igusa trivialization. The integral model exists before choosing a perfectoid field for its generic fibre.

Hypotheses: `X` perfect with CharP `p`; for the moduli assertion, unramified PEL type `(A)/(C)`, hyperspecial level and completely slope divisible `X_b`. Source: [CS17](#ref-cs17), Lemmas 4.3.10 and 4.3.12, pp.719–720, and the affine approximation in Lemma 4.4.3, pp.728–729. The arbitrary-perfect-ring Witt/formal-site extension is proved here, beyond SchemeAndStackFoundations §§4.7–4.8's finite-type formal models.

The API: `canonicalLift`, `canonicalLift_unique`, `canonicalLift_affineWitt`, `canonicalLift_completedBaseChange`, `canonicalLift_etaleSite`, `canonicalLift_genericFibre_perfectoid`, `canonicalLift_moduli`, `XbSpace_decomp`. Uniqueness includes the specified reduction map; the perfectoid target includes the perfectoid `K` hypothesis.

*Needs:* IG.0, IG.1; Mathlib Witt vectors and their completeness; SchemeAndStackFoundations §§4.7–4.8 for gluing and henselian étale lifting in finite diagrams; PerfectoidSpaces P0–`P2, P7` for the uniform Frobenius criterion and limit comparison; AbelianSchemesAndArithmeticModuli A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.

**Checks.**

- `W(Spec k)=Spf W(k)`. Its generic fibre over `Ĕ` is discretely valued and fails perfectoidness; base change to `C` gives `Spa C`.
- For `R=𝔽_p[t^{1/p^∞}], W(R)` is the `p`-adic completion of the compatible Teichmüller-root algebra over `ℤ_p`. Over perfectoid `K` its generic fibre is the perfectoid root disc.
- The nonperfect affine line admits the lift automorphism `t↦t+p` reducing to the identity. Perfectness is needed for uniqueness with a fixed reduction.
- `R=0` gives the empty formal scheme. At `p=2` the Witt expansion and lifting still work; a ring with `p` invertible is not a characteristic-`p` input.


### IG.3.12 The infinite-level local Newton space

<a id="ig-3-infinite-level-newton-space"></a>

Let `X^b = (𝔛^b)^ad_η`. `X^b_∞` sends a complete affinoid `(Ĕ(ζ_{p^∞}), O)`-algebra `(R, R⁺)` to triples `(𝒜, ρ, α)` with `(𝒜, ρ) ∈ X^b(R, R⁺)` and `α : Λ → T_p𝒜` an `O_B`-linear map matching the pairings (with the fixed `p`-power roots of unity) and an isomorphism at every geometric point. The map `(𝒜,ρ)↦(𝒜[p^∞],ρ⁻¹)` gives `X^b → M^b` and `X^b_∞ = X^b ×_{M^b} M^b_∞`, representable by an adic space; and `(Ig^b_{O_K})^ad_η ×_{Spa Ĕ} M^b_∞ ≅ X^b_{∞,K}`, so `X^b_∞` is preperfectoid.

Assume PEL data of type `(A)` or `(C)` unramified at `p` with hyperspecial level.

([CS17](#ref-cs17), §4.3, Definition 4.3.17, p. 724; §4.3, Corollary 4.3.19, p. 724.)

The API: `XbInfinite`, `XbInfinite.eq_fibreProduct`, `XbInfinite.product`, `XbInfinite.preperfectoid`.

*Needs:* IG.3.

**Checks.**

- For ordinary `GL₂` the flag stratum is `ℙ¹(ℚ_p)`, of dimension zero; after fixing the cyclotomic base a period fibre has dimension one and its automorphism orbit is not profinite.
- Forgetting the integral trivialization gives a pro-étale `G(ℤ_p)`-torsor.
- The local space `X^b_∞` is distinct from the Shimura Newton stratum; the product formula has the stated product fibres.
- The auxiliary left action is `ρ↦jρ`; inversion gives `(jρ)⁻¹=ρ⁻¹j⁻¹`, exactly the RZ action of IG.0.27. The Tate framing is unchanged.
- For the quasi-isogeny `[p]:A[p^∞]→X_b`, the RZ framing is `[p]⁻¹:X_b→A[p^∞]`, of opposite height; these arrows are distinct even for a height-one group.

### IG.3.13 The infinite-level product formula

<a id="ig-3-product-formula"></a>

Let `X̂^b_∞` be the perfectoid space attached to `X^b_∞` and `𝒮^b_{K^p} ⊂ 𝒮_{K^p}` the locus of the perfectoid Shimura variety (infinite level at `p`) of points `Spa(K, K⁺)` over which the universal abelian variety extends to `K⁺` with reduction in the Newton stratum `S^b` (a locally closed subset, the preimage of `S^b` under specialization). Then `X̂^b_∞` maps to `𝒮^b_{K^p}` by forgetting `ρ` and to `M^b_∞` by `(𝒜, ρ, α) ↦ (𝒜[p^∞], ρ⁻¹, α)`, compatibly with `π_HT` and `π^b_HT`, and the induced map `X̂^b_∞ → (M^b_∞ ×_{Fℓ_{G,μ}} 𝒮^b_{K^p})^∧` is an isomorphism of perfectoid spaces. All objects in this square are taken over the same chosen completed cyclotomic base; the flag fibre product uses its base-changed flag variety, so the two cyclotomic structure maps agree.

Assume PEL data of type `(A)` or `(C)` unramified at `p` with hyperspecial level; no compactness needed.

([CS17](#ref-cs17), §4.3, Lemma 4.3.20, p. 725.)

*Needs:* IG.3; HodgeTateAndCanonicalSubgroups §§2.4–2.8, §§1.2, 1.4; PerfectoidShimuraVarieties Layer 3.

**Checks.**

- An auxiliary identity framing maps to the identity RZ framing; the map to the Shimura variety still forgets that framing.
- For a quasi-isogeny `[p]` the RZ coordinate is `[p]⁻¹`, with opposite height. Under `ρ↦jρ`, this coordinate transforms by right composition with `j⁻¹`.
- At an ordinary rational `GL₂` flag, the product fibre includes the one-dimensional Igusa factor. Its dimension is compatible with the zero-dimensional ordinary flag stratum; it is not a profinite fibre.

### IG.3.14 Cohomology from rank-one points

<a id="ig-3-rank-one-cohomology-lemma"></a>

`(1)` Let `f : Y → X` be a qcqs map of analytic adic spaces, `X` locally strongly noetherian or perfectoid and `Y` perfectoid; for a geometric point `x̄` of `X` the stalk `(R^if_*𝒢)_x̄` is the cohomology of the fibre `f^{−1}(x̄)` (an adic space over `Spa(C(x̄), C(x̄)⁺)`). `(2)` Let `X` be a qcqs analytic adic space (perfectoid, or strongly noetherian) and `U ⊂ X` a quasicompact open containing all rank-one points. Then `H^i(X, 𝒢) → H^i(U, 𝒢)` is an isomorphism for every locally constant `𝒢` and every `i`.

Assume `X` qcqs, `U` quasicompact open containing all rank-one points; `𝒢` locally constant.

([CS17](#ref-cs17), §4.4, Lemma 4.4.2, p. 727; §4.4, Lemma 4.4.1, p. 726.)

*Needs:* ClassicalAdicEtaleCohomology Layer 1; DiamondEtaleCohomology C0; DiamondSixOperations S1; PerfectoidSpaces P2; PerfectoidSpaces P7.

### IG.3.15 Étale comparison for perfect Witt lifts

<a id="ig-3-perfect-scheme-lift-cohomology"></a>

Let `X` be a qcqs perfect scheme over `𝔽̄_p, C` a complete algebraically closed extension of `ℚ_p` with its fixed residue embedding, `ℓ≠p` and `n≥1`. Let `𝔛_{O_C}` be the completed Witt lift of IG.3.11 and `𝒳_C` its perfectoid generic fibre. The canonical pullbacks give

`H^i(X,ℤ/ℓ^n) → H^i(𝔛_{O_C},ℤ/ℓ^n) → H^i(𝒳_C,ℤ/ℓ^n)`

as isomorphisms, equivariantly for the Igusa actions. The first map is base extension to the residue field followed by henselian formal-site comparison; it is not an arbitrary identification of `X` with that special fibre.

*Proof.* On an affine, write `R` as the filtered colimit of perfections of its finite-type `𝔽̄_p`-subalgebras; strict Witt completion and completed `O_C` base change give the corresponding perfectoid tilde-limit of generic fibres. Finite étale covers and their finite Čech diagrams descend, so prime-to-`p` étale cohomology is the filtered colimit on both sides. Thus reduce to `X=X₀^perf` for `X₀` affine of finite type. Perfection preserves its étale topos; the formal site is that of `X₀×k`, whose cohomology agrees with `X₀` by algebraically closed base extension. Tilt the generic fibre to `C♭`. It is the inverse Frobenius limit of the adic generic fibre of the pseudouniformizer-adic formal completion of `X₀×O_{C♭}`. Retain this bounded chart and its plus ring; the full analytification of `X₀×C♭` is a different space. For the algebraic constant model underlying this formal completion, the map `X₀→Spec 𝔽̄_p` is universally locally acyclic for constant prime-to-`p` coefficients, even if `X₀` is singular. Hence its nearby cycles are the constant sheaf. The eligible valuation formal–adic comparison of ClassicalAdicEtaleCohomology §§4.4–4.5 and §5.4 applies to this constant formal model and its supported generic fibre; one does not apply an admissible noetherian theorem directly to `W(R)`. Tilting and Frobenius invariance complete the affine comparison. A finite affine Čech cover and qc intersections give the qcqs result. Every map in the construction is functorial, giving action compatibility and compatibility with level changes.

Source: [CS17](#ref-cs17), Lemma 4.4.3 and its proof, pp.728–729. The construction supplies the nonnoetherian Witt comparison needed here; the subsequent arbitrary Igusa formal diagrams use IG.4.0a–IG.4.0c instead.

The API: `perfectWittLift_cohomologyComparison`, `perfectWittLift_affineApproximation`, `perfectWittLift_tiltComparison`, `perfectWittLift_constantNearby`, `perfectWittLift_comparison_equivariant`.

*Needs:* IG.3.11, IG.3.14; ClassicalAdicEtaleCohomology §§1.2, 4.4–4.5, 5.4; SchemeAndStackFoundations §§4.7–4.8 for henselian étale lifting; PerfectoidSpaces `P1, P7`; AdicCoefficientsAndComparisons L2 (finite-diagram continuity); LPV.0 for constant-family ULA nearby cycles. Equal-characteristic geometry occurs only on the tilted side, using its pseudouniformizer for formal completion.

**Checks.**

- `X=Spec 𝔽̄_p` gives `Λ` in degree `0` on both sides. `X=∅` gives zero; `n=0` is the zero coefficient case.
- For `X₀=𝔸¹`, the tilted generic fibre is the perfectoid closed unit root disc with `|t|≤1`, with its power-bounded plus ring. The full analytic affine line also has points with `|t|>1`; those points do not belong to this generic fibre. The finite-type affine line supplies the constant formal model before nearby cycles are used.
- A singular nodal constant `X₀` remains singular. Local acyclicity over an algebraically closed point does not require `X₀` smooth.
- `ℓ=p` is excluded: tilting of prime-to-`p` étale cohomology does not turn this argument into a `p`-primary formal comparison.


### IG.3.16 Corresponding Newton strata on rank-one points

<a id="ig-3-newton-strata-correspond"></a>

Assume `S_{K^pK_p}` proper over `O_{E,𝔭}` (or replace `𝒮_{K^p}` by the good-reduction locus). `(1)` A rank-one point `y` of `𝒮_{K^p}` lies in `𝒮^b_{K^p}` if and only if `π_HT(y) ∈ Fℓ^b_{G,μ}`. `(2)` For a rank-one point `x ∈ Fℓ^b(C, O_C)`, every geometric rank-one point of the fibre `𝒮_{K^p,x}` lies in `𝒮^b_{K^p}`; hence `𝒮^b_{K^p,x}` is a quasicompact open subset of `𝒮_{K^p,x}` with the same rank-one points, and `(R^iπ_HT* ℤ/ℓ^n)_x = H^i(𝒮^b_{K^p,x}, ℤ/ℓ^n)`.

Assume PEL data of type `(A)` or `(C)` unramified at `p` with hyperspecial level; properness (or restriction to the good-reduction locus).

([CS17](#ref-cs17), §4.2, Proposition 4.2.6, p. 702 (with Remark 4.2.8, p. 703); §4.2, Remark 4.2.8, p. 703.)

*Needs:* IG.3; IG.0; HodgeTateAndCanonicalSubgroups §§1.2, 1.4; PerfectoidShimuraVarieties Layer 3.

### IG.3.17 Compact PEL period fibres and stalks

<a id="ig-3-compact-fibre-theorem"></a>

Assume a PEL datum of type `(A)` or `(C)`, unramified at `p`, with `K_p` hyperspecial, and `S_{K^pK_p}` proper over `O_{E,𝔭}` (equivalently `G^ad` anisotropic over `ℚ`). Let `ℓ ≠ p, K^p` sufficiently small, `π_HT : 𝒮_{K^p} → Fℓ_{G,μ}` and `b ∈ B(G, μ^{−1})`. For every geometric point `x̄` of `Fℓ_{G,μ}` lying in `Fℓ^b_{G,μ}` and all `i` there are isomorphisms `(R^iπ_HT* ℤ/ℓ^n)_x̄ ≅ H^i(Ig^b, ℤ/ℓ^n) ≅ colim_m H^i(Ig^b_{Mant,m}, ℤ/ℓ^n)`, depending only on a lift of `x̄` to `M^b_∞` and compatible with the Hecke action of `G(𝔸_f^p)`.

Assume Proper integral model (compact Shimura variety); `K^p` small; `ℓ ≠ p`.

([CS17](#ref-cs17), §4.4, Theorem 4.4.4, p. 729.)

*Needs:* IG.3; IG.1.

### IG.3.18 Open period fibres

<a id="ig-3-open-fibre-theorem"></a>

For `x ∈ Fℓ(C)` with `p`-divisible group `𝒳_{O_C}` with `G`-structure and special fibre `X_k`, there is a canonical open immersion `Ig^{X_k}_C ↪ (π°_HT)^{−1}(x)` whose image contains all rank-one points, where `Ig^{X_k}_C` is the generic fibre of the canonical lift of the perfect Igusa variety (prime-to-`p` level the part of `N` prime to `p`). Consequently, for `ℓ ≠ p, (R(π°_HT)_*𝔽_ℓ)_x ≅ RΓ(Ig^{X_k}, 𝔽_ℓ)` canonically and Hecke-equivariantly.

Work in the valued-field fibre setting. Assume also The quasi-split unitary datum (non-compact); only the good-reduction locus is used, so no properness is needed.

([CSnc](#ref-csnc), §2.7, Theorem 2.7.2, p. 33.)

*Needs:* IG.3.

### IG.3.19 Period maps on the boundary

<a id="ig-3-period-map-on-boundary"></a>

`(1)` Let `Ŝ^tor_{K(p^∞N),Z,ℤ_p}` be the completion of the infinite-level naive integral model along the `Z`-boundary, with `π₁` to `(G/P_r)(ℚ_p)` (symplectic `O_F`-filtrations `Z_{p^∞,−2} ⊂ Z_{p^∞,−1} ⊂ L ⊗ ℤ_p` with `rk Z_{−2} = r`) and the local system `L_Z = Gr_{−1}` with its perfect form. The Hodge–Tate filtration `Lie B(1) ⊂ L_Z ⊗ O` of the abelian part `B` of the Raynaud extension, pulled back to `Z_{p^∞,−1} ⊗ O`, is a totally isotropic subspace of `L ⊗ O`; the resulting `π_{HT,Z}` agrees with `π^tor_HT` restricted to the generic fibre of `Ŝ^tor_Z`. `(2)` On a boundary stratum `S_{K(p^∞N),Ẑ}` of the infinite-level minimal compactification, `π^*_HT` is the Hodge–Tate period map of the smaller Shimura variety followed by the embedding `Fℓ_Ẑ ↪ Fℓ` (preimage of a totally isotropic subspace of `L_Z ⊗ ℚ_p` in `Z_{p^∞,−1} ⊗ ℚ_p`).

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.2, Theorem 4.2.1, p. 53; §4.2, Corollary 4.2.2, p. 53.)

*Needs:* PerfectoidShimuraVarieties Layer 3; PerfectoidShimuraVarieties Layer 6; ShimuraCompactifications `C4, C5`; NeronModelsAndSemistableAbelianVarieties §3.13; IG.3.

### IG.3.20 Constancy modulo `p^ε`

<a id="ig-3-pdiv-constant-mod-p-epsilon"></a>

For `x ∈ Fℓ(C)` with `(𝒳_{O_C}, α)`, splitting `δ_{𝒳}` and special fibre `X = 𝒳 ⊗ k` with induced `δ_X`, there is `ε ∈ ℚ ∩` (`0, 1`] and an isomorphism `ρ : X ⊗_k O_C/p^ε ≅ 𝒳_{O_C} ⊗ O_C/p^ε` of `p`-divisible groups with `G`-structure lifting the identity, which can be chosen with `δ_{𝒳} ⊗ O_C/p^ε = δ_X ⊗ O_C/p^ε`.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.3, Proposition 4.3.1, p. 54.)

*Needs:* IG.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; IG.F.7–IG.F.8 (tensor-compatible crystalline and integral comparisons).

### IG.3.21 The compactified Igusa-to-Shimura map

<a id="ig-3-compactified-igusa-to-shimura"></a>

Let `Ig^{X,tor}_{O_C} = W(Ig^{X,tor}) ×_{W(k)} O_C`. The map `g : Ig^X_{O_C} → S_{K(p^∞N),O_C}` — Serre–Tate lift of the universal abelian scheme over `Ig^X_{O_C/p^ε}` along `A[p^∞] ≅ 𝒳_{O_C}` ([IG.3.20](#ig-3-pdiv-constant-mod-p-epsilon)), with level structure at `p` from `α` — extends to a morphism of `p`-adic formal schemes `g^tor : Ig^{X,tor}_{O_C} → S^tor_{K(p^∞N),O_C}`, and composing with the projection gives `f^tor : Ig^{X,tor}_{O_C} → S^*_{K(p^∞N),O_C}`. On boundary charts, Igusa cusp labels map to cusp labels and `g^tor` is given by deforming `G[p^∞] ↪ X` (Serre–Tate for Raynaud extensions) and the torus torsor of symmetric lifts.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.3, Theorem 4.3.2, p. 55; §4.3, proof of Theorem 4.3.2, p. 57.)

The API: `igusaToShimura`, `igusaToShimura_open`, `igusaToShimura_cusp`, `igusaToShimura_hecke`, `igusaToShimura_piHT`.

*Needs:* IG.3; IG.2; IG.0; ShimuraCompactifications `C4, C5`; NeronModelsAndSemistableAbelianVarieties §3.13

**Checks.**

- `π^{tor}_{HT}∘g^{tor}` is the constant map with value `x`.
- At a modular rational flag the image includes ordinary canonical-line points and cusps.
- Even at a modular rational flag, the map misses higher-rank adic points supplied by canonical compactification; in the basic proper case it is onto.

### IG.3.22 The canonical compactification criterion

<a id="ig-3-canonical-compactification-criterion"></a>

Suppose `X/Spd C` is a quasicompact separated perfectoid space and `Y/Spd C` is a proper diamond. A morphism `f : X → Y` identifies `Y` with the canonical compactification `X̄` of `X` over `Spd C` whenever it gives a bijection `X(C′, O_{C′}) → Y(C′, O_{C′})` for every complete algebraically closed extension `C′/C`. If `X/Spd C` is compactifiable, this same `f` is an open immersion.

Assume `Y` proper over `Spd C`.

([CSnc](#ref-csnc), §4.4, Lemma 4.4.2, p. 59.)

*Needs:* DiamondEtaleCohomology C4; DiamondsAndVStacks D5.

**Checks.**

- If `X` is already proper over `Spd C`, its canonical compactification is `X`.
- The perfectoid closed unit disc has additional higher-rank boundary points in its canonical compactification, with no new `(C′,O_{C′})`-points.
- At a rational modular flag, cusp points are rank-one points of the toroidal or minimal fibre outside the good-reduction fibre. They enter through the toroidal or minimal Igusa source, not through canonical compactification of the open source.

### IG.3.23 Toroidal period fibres

<a id="ig-3-toroidal-fibre-theorem"></a>

The morphism `g^tor` induces a map of diamonds `Ig^{b,tor}_C → (π^tor_HT)^{−1}(x)` which is an open immersion with the same rank-one points; since the fibre `(π^tor_HT)^{−1}(x)` is proper over `Spd C` (a closed fibre of a proper map), it is the canonical compactification of `Ig^{b,tor}_C`.

Work in the valued-field fibre setting. Assume also `x ∈ Fℓ^b(C)`.

([CSnc](#ref-csnc), §4.4, Theorem 4.4.1, p. 57.)

*Needs:* IG.3; IG.2; DiamondEtaleCohomology C4; DiamondsAndVStacks D5.

### IG.3.24 Minimal period fibres

<a id="ig-3-minimal-fibre-theorem"></a>

`f^tor` induces an open immersion `f^* : Ig^{b,*}_C → (π^*_HT)^{−1}(x)` of affinoid perfectoid spaces with the same rank-one points. Moreover `(1) Ig^{b,tor}_C → Ig^{b,*}_C` induces an isomorphism on global sections, and `(2) F^tor := (π^tor_HT)^{−1}(x) → F^* := (π^*_HT)^{−1}(x)` induces an isomorphism on global sections, via the almost isomorphism `O⁺ᵃ_{F^*}/p^n ≅ π_*O⁺ᵃ_{F^tor}/p^n`.

For the proper finite-level toroidal-to-minimal Stein maps `π` used here, prove `steinPrimitiveComparison`: if `ℤ/p^a → π_*ℤ/p^a` is an isomorphism, then `O⁺ᵃ/p^a → π_*O⁺ᵃ/p^a` is an almost isomorphism. Apply PadicHodgeTheory §2.7's singular proper primitive theorem on geometric fibres, proper base change and finite-coefficient dévissage, then pass through the level system. This supplies the Stein-map specialization used in `(2)`.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.5, Theorem 4.5.1, p. 59; §4.5, proof of Lemma 4.5.2, p. 60.)

*Needs:* IG.3; IG.2; PadicHodgeTheory §2.7; DiamondEtaleCohomology C0; AdicEtaleGeometry A1; PerfectoidSpaces P0; PerfectoidShimuraVarieties Layer 0, Layer 2, Layer 4, Layer 1; PerfectoidSpaces P2; PerfectoidSpaces P7.

### IG.3.25 Compactified fibres and their cohomology

<a id="ig-3-compactified-fibre-theorem"></a>

For `x ∈ Fℓ(C)` with `(𝒳_{O_C}, α)` and special fibre `X`, there are natural maps `Ig^{X,*}_C → (π^*_HT)^{−1}(x)` and `Ig^{X,tor}_C → (π^tor_HT)^{−1}(x)`, open immersions of perfectoid spaces with the same rank-one points, whose targets are the canonical compactifications of the sources. Consequently there are natural Hecke-equivariant isomorphisms `RΓ(Ig^{X,*}, 𝔽_ℓ) ≅ (Rπ^*_HT*𝔽_ℓ)_x` and `RΓ(Ig^{X,tor}, 𝔽_ℓ) ≅ (Rπ^tor_HT*𝔽_ℓ)_x`, and the stalks at higher-rank points agree with those at the corresponding rank-one points. These maps are compatible with the prime-to-`p` Hecke action, with passage between `p`-levels (the transition maps of the towers), with the flag Newton strata (`x ∈ Fℓ^b` iff `X` is in the class `b`) and with the good-reduction open part ([IG.3.18](#ig-3-open-fibre-theorem)).

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.1, Theorem 4.1.1, p. 51; §4.1, Corollary 4.1.2, p. 51.)

*Needs:* IG.3; DiamondEtaleCohomology C4; ClassicalAdicEtaleCohomology Layer 1.

### IG.3.26 Scholze–Weinstein’s infinite-level RZ space

<a id="ig-3-sw-infinite-level-rz-space"></a>

Let `H` be a `p`-divisible group of height `h` and dimension `d` over a perfect field `k` of characteristic `p, M` the Rapoport–Zink space of deformations of `H` up to quasi-isogeny (no extra structure) and `M_n` its level-`p^n` covers. `M_∞` sends a complete affinoid `(W(k)[1/p], W(k))`-algebra `(R, R⁺)` to triples `(G, ρ, α)` with `(G, ρ) ∈ M(R, R⁺)` and `α : ℤ_p^h → T_pG^ad_η(R, R⁺)` an isomorphism at all geometric points. `M_∞` is representable by an adic space, is preperfectoid over `Spa(W(k)[1/p], W(k))`, and satisfies `M_∞` ∼ `lim_n M_n` in the sense of Scholze–Weinstein Definition 2.4.1 (Theorem 6.3.4). Preperfectoidness means that, after any perfectoid characteristic-zero base-field extension, strong completion is perfectoid; it does not assert that `M_∞` itself is perfectoid over `W(k)[1/p]`. Already over `W(k)[1/p], M_∞ ≅ M′_∞`, the functor of `h`-tuples `(s₁, …, s_h) ∈ H̃^ad_η(R, R⁺)` whose quasi-logarithms span a `rank-(h − d)` submodule with finite projective quotient `W` of `rank d` of `M(H) ⊗ R`, and such that `0 → ℚ_p^h → H̃^ad_η(C, O_C) → W ⊗_R C → 0` is exact at every geometric point `Spa(C, O_C) → Spa(R, R⁺)` (Definition 6.3.5, Lemma 6.3.6). The first arrow sends the standard basis to the `s_i`. For an unramified local PEL datum, `M_{D^int,∞}` ([IG.3.6](#ig-3-local-hodge-tate-period-map)) is a closed subspace of `M_∞` for `H = X_b`.

Assume `H` a `p`-divisible group over a perfect field `k`; "∼ `lim`" in the sense of Scholze–Weinstein Definition 2.4.1.

([sw13](#ref-sw13), Theorem 6.3.4, p. 59 (§6.3; Definition 6.3.3 of `M_∞`); proof pp. 59–62; Definition 6.3.5 and Lemma 6.3.6, p. 60; proof pp. 60–62; [CS17](#ref-cs17), §4.2, proof of Theorem 4.2.4, p. 701; [SW13](#ref-sw13), Definition 2.3.9, p. 18; Proposition 2.3.11, p. 19; §6.3, p. 60.)

The API: `SWInfiniteLevel`, `SWInfiniteLevel.preperfectoid`, `SWInfiniteLevel.eq_tuples`, `SWInfiniteLevel.actions`, `SWInfiniteLevel.pel`.

*Needs:* IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2; IG.F.8, IG.F.19 (integral classification and its local modification functor); PerfectoidSpaces P2; PerfectoidSpaces P7

**Checks.**

- Over a chosen geometric `C, H=μ_{p^∞}` has a constant `ℚ_p^×` tower and no deformations.
- For étale `H` of height `h` the geometric tower is constant `GL_h(ℚ_p)`; its original unramified descent need not be split.
- For `h≥1` and `n≥1, M_{n+1}→M_n` is not an isomorphism. The `h=1,p=2,n=0` transition is exceptional.

### IG.3.27 Mantovan’s cohomology filtration

<a id="ig-3-mantovan-formula"></a>

For an integral PEL datum of type `(A)` or `(C)` unramified at `p` with hyperspecial level and `ℓ ≠ p`, there is a filtration of `RΓ(S_{K^p,ℚ̄_p}, 𝔽_ℓ)` by complexes of smooth `G(ℚ_p) × W_{E_p}`-representations whose graded pieces are indexed by `b ∈ B(G_{ℚ_p}, μ^{−1})` (ordered compatibly with the closure relations) and equal to `RΓ(Ig^b, 𝔽_ℓ)^{op} ⊗^L_{C_c(J_b(ℚ_p))} RΓ_c(M_{(G,b,μ),∞}, 𝔽_ℓ(d_b))[2d_b]`, with `Ig^b` the perfect Igusa variety (dimension `d_b = ⟨2ρ, ν_b⟩`) and `M_{(G,b,μ),∞}` the local Shimura variety at infinite level. Here `𝔽_ℓ(d_b)` on `M_{(G,b,μ),∞}` carries the `J_b(ℚ_p)`-equivariant structure induced by the relative dualizing equivalence `Rπ_unip^!𝔽_ℓ ≅ 𝔽_ℓ(d_b)[2d_b]`, where `π_unip : M_{(G,b,μ),∞} → M_{(G,b,μ),∞}/J̃_b^0` is the connected-automorphism-group torsor. This equivariant structure is part of the formula; its smooth character `κ` agrees with the character on the Igusa dualizing twist (Koshikawa Lemmas 7.4 and 7.6).

Assume PEL type `(A)` or `(C)` unramified at `p`, with a chosen hyperspecial model and neat tame `K^p`; the infinite-level complex ranges over all deeper `K_p`. Use the tower comparison of [IG.3.2](#ig-3-good-reduction-locus-cohomology), including for nonproper varieties. At finite level take derived `K_p`-invariants; they are underived for pro-`p K_p` since `ℓ≠p`.

([kos21](#ref-kos21), §7, Theorem 7.1 and Remark 7.2, p. 10; Lemmas 7.3–7.6 and their proofs, pp. 10–12 (arXiv:`2106`.`10602v1`).)

*Needs:* IG.3; IG.1; IG.F.19–IG.F.20; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.0d, SR.1; IG.F.9–IG.F.14; IG.F.13–IG.F.14; DiamondSixOperations `S3, S4, S2`

**Checks.**

- For a proper good-reduction PEL model the comparison of IG.3.2 identifies the full Shimura tower with its good-reduction tower, so the filtration applies to either complex.
- For a nonproper type-`C` datum at `K′_p⊂K_p`, the restrictions of IG.3.2 commute with level pullback and the two legs of every Hecke correspondence at a common refinement. The resulting filtration is therefore a filtration of the all-level Shimura complex.
- For pro-`p K_p`, taking invariants of the tower is exact with `𝔽_ℓ` coefficients. For a trivial `C_ℓ`-action, derived invariants of `𝔽_ℓ` have nonzero `H¹`; an arbitrary finite-level descent cannot replace them by ordinary invariants.

### Examples

For `GL_2` and `μ = (1, 0)` the flag variety is `ℙ¹`, the ordinary stratum `ℙ¹(ℚ_p)` is closed of dimension `0 = d − d_b`, and the basic stratum is the Drinfeld upper half plane of dimension `1`. At a rational flag of the modular curve the open good-reduction fibre is the generic fibre of the canonical Witt lift of the ordinary perfect Igusa variety. Passing to toroidal or minimal Igusa varieties adds cusp points; canonical compactification of each source adds only higher-rank points; in the basic proper case the fibre is a profinite set.

### Dependencies

Layers IG.0–IG.2; PerfectoidShimuraVarieties Layers 0–`4, 6`; PerfectoidSpaces P0–`P2, P7`; DiamondsAndVStacks D5; AdicSpacesPartIII `F0, R2`; AdicEtaleGeometry A1; ClassicalAdicEtaleCohomology Layers `1, 4`–`6`; DiamondEtaleCohomology `C0, C4, C8`; DiamondSixOperations S1–S4; HodgeTateAndCanonicalSubgroups §§1.2, 1.4, 2.4–2.8; PadicHodgeTheory §2.7; LefschetzPencilsAndVanishingCycles LPV.0; ShimuraCompactifications `C4, C5`; NeronModelsAndSemistableAbelianVarieties §3.13; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6; AbelianSchemesAndArithmeticModuli A4; SchemeAndStackFoundations §§4.7–4.8; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.1, SR.2; and, for the flag Newton stratification and Mantovan's filtration, IG.F.6–IG.F.14 and IG.F.19–IG.F.20.

## Layer IG.4: Nearby cycles, semiperversity and degree bounds

### IG.4.0a Valuation models and the finite-level comparison

<a id="ig-4-valuation-model-comparison"></a>

Use ClassicalAdicEtaleCohomology §§4.4–4.5 for algebraic formal completion over a microbial valuation ring, its supported generic fibre and the actual nearby-cycle exchange maps; §§5.4 and 6.2–6.3 supply valuation base change, constructibility and proper comparison. In particular `O_C` is an eligible rank-one nondiscrete base. No expression of `O_C` as a union of DVRs is used. Extend the finite-coefficient perverse exactness of LefschetzPencilsAndVanishingCycles §6.2 from traits to the finite-type `O_C`-models used here. For `X` of finite type over `O_C` and `Λ=𝔽_ℓ, ℓ≠p`, prove `i*Rj*:D^b_c(X_C,Λ)→D^b_c(X_k,Λ)` is perverse `t`-exact, using the absolute fibre perversities with no extra shift. The proof uses the valuative nearby equivalence for an absolutely integrally closed rank-one valuation base, affine Artin vanishing for the upper bound and nearby duality for the lower bound. Construct the duality map by the valuation-base exchange and trace; reduce its verification to constructible finite diagrams by noetherian approximation, retaining those diagrams' universal nearby base-change property. This is the valuation extension, not an assertion that a trait theorem alone applies.

For the cofinal affinoids of IG.4.3, choose an admissible formal model from an algebraization of the étale map to the finite-level minimal Shimura variety, after admissible blowup if necessary. The toroidal proper map, the interior open immersion and both level maps extend to the same finite diagram. Prove its scheme/adic nearby comparison by the preceding ClassicalAdic theorem, including its naturality under the open/closed support triangle. Relate a power-bounded model `Spf B°` to such models by normalization and the filtered system of finite integral subalgebras. Formal étale neighborhoods descend to a finite diagram and have the same strict-local generic fibre. Thus the nearby comparison passes to these models by the continuity in IG.4.0c, rather than applying a noetherian theorem to `B°` without a finiteness check. This constructs `igusaModel_nearbyComparison` and its proper pushforward exchange for the actual `p`-level/`ℓ`-level diagram.

The API: `IgusaValuationModel`, `igusaModel_algebraization`, `igusaModel_nearbyComparison`, `igusaModel_nearbyProperExchange`, `valuationNearby_perverseExact`, `igusaModel_levelCompatibility`. Source: [HS relative](#ref-hs-relative), Theorem 4.1 and Corollary 4.2, pp.16–17, Lemma 6.3, p.28; [CSnc](#ref-csnc), proof of Theorem 4.6.1, pp.61–63. The analytic statement can also be checked by [BH](#ref-bh), Theorem 4.2(8), pp.31–32, for algebraically closed characteristic-zero `K`, prime-to-`p` finite coefficients and a formal model. *Needs:* ClassicalAdicEtaleCohomology §§4.4–4.5, 5.4, 6.2–6.3; LPV.0, LPV.6.1–6.2; EtaleCohomologyFoundations §§`F`.0–`F`.3, `F`.5–`F`.6, `F`.8; EtaleDualityAndPerverseSheaves §2.11; AdicCoefficientsAndComparisons L2 (finite-diagram approximation and continuity); ShimuraCompactifications C5 and PerfectoidShimuraVarieties Layers 0–`4` for the eligible models.

**Checks.**

- For `X=Spec O_C, Λ` goes to `Λ` in degree `0`. For a smooth relative curve, `Λ[1]` stays `Λ[1]` on the two fibres; the total-trait shift is not inserted.
- A nodal curve retains its degree-one nearby class with twist `−1`. Smoothness is not inferred for its singular fibre.
- An affinoid over a nonperfectoid discretely valued field is not declared perfectoid. The base change to `C` and each admissible formal comparison are explicit.
- Raw `B°/p` need not be finite type over `k`; constructible perverse statements are first made on the finite-type residue models and transported as bounds.

### IG.4.0b Geometric Cartan–Leray for the two towers

<a id="ig-4-geometric-tower-descent"></a>

For a finite étale `Q`-torsor `Y→X` in each finite-level diagram, construct the equivalence between sheaves on `X` and `Q`-equivariant sheaves on `Y` by its augmented Čech nerve. Derive it to `RΓ(X,K)≅RΓ(Q,RΓ(Y,K|Y))`, and construct the relative sheaf comparison for the map to the flag/formal chart. For a profinite étale tower `X_∞=lim X_a` with affine transitions, use coherent étale continuity on qc charts: every constructible finite coefficient object and finite covering diagram descends to a stage. The limit Čech nerve and continuous cochains then give `RΓ(X_a,K)≅RΓ_cont(Q_a,RΓ(X_∞,K))`. For noncompact charts use a qc cover and descent. The relative version is an equality in the enhanced derived category before taking cohomology, with both `p`-level and auxiliary `ℓ`-level actions.

Prove compatibility of these comparisons with the valuation-model exchange of IG.4.0a, localization at the commuting away-`p` Hecke algebra, finite étale trace, and restriction to the toroidal boundary charts. All maps are induced from the same Čech diagram, so these compatibilities follow by its base-change maps, rather than by choosing unrelated isomorphisms on cohomology. For pro-`p` subgroups, `ℓ≠p` makes invariants exact. For auxiliary pro-`ℓ` groups retain derived invariants: its nonnegative cochain resolution preserves lower bounds but need not preserve upper ones. This proves the descent from `ℓ^∞` semiperversity and the later finite normal cover reduction in IG.7.4. It does not claim arbitrary costalks commute with infinite limits.

The API: `igusaGeometricCartanLeray`, `igusaRelativeCartanLeray`, `igusaCartanLeray_nearby`, `igusaCartanLeray_boundary`, `igusaCartanLeray_hecke`, `igusaDerivedInvariants_lowerBound`. Source: [CS17](#ref-cs17), proof of Proposition 6.1.3, pp.751–753; [CSnc](#ref-csnc), proof of Theorem 4.6.1, pp.61–62; [Koshikawa](#ref-kos21), §§8–9, pp.13–16. *Needs:* SchemeAndStackFoundations §§1.1, 2.23 for equivariant sheaves and finite descent, ClassicalAdicEtaleCohomology §§1 and 7.2 for étale continuity of perfectoid limits; EnhancedDerivedSheaves E0–E3 for totalizations; SmoothRepresentationsOfLocalGroups SR.0d for continuous derived invariants; IG.4.0a, IG.1–IG.3 for the actual towers.

**Checks.**

- `Q=1` gives the identity comparison. A finite free action recovers the ordinary quotient, not its fixed-point set.
- For the trivial `C_ℓ`-action on a point with `𝔽_ℓ` coefficients, derived invariants have nonzero `H¹`. Replacing them by underived invariants loses this group.
- A pro-`p` compact group acting on a smooth `𝔽_ℓ`-module has exact invariants for `ℓ≠p`; this use of averaging does not apply to pro-`ℓ` groups.
- Restricting the trivial tower to an empty boundary gives zero on both sides of the boundary comparison.

### IG.4.0c Integral pushforward and uniform cosupport continuity

<a id="ig-4-integral-cosupport-continuity"></a>

Let `X` be a finite-type `k`-scheme and `δ(x)=dim closure{x}`. For `f:Y→X` integral use the pulled-back dimension function `δ_Y(y)=δ(f(y))`; integral residue extensions are algebraic and the fibres have dimension zero. On bounded-below étale complexes define the lower bound `C_{≥a}` by `H^i(i_y^!K)=0` for `i<`a`−δ_Y(y)`, using the strict-local closed-support functor. Prove `Rf_*` preserves this bound for the integral maps and continuous coefficient systems arising from the model diagrams. Write an integral algebra as a filtered union of its finite subalgebras, apply finite proper base change on each strict-local chart, and pass through the coherent étale sites. The fibre is a profinite zero-dimensional scheme after geometric localization; its section functor on the corresponding Stone site is exact. This proves the costalk formula and the bound, including for an integral source that is not finite type. Do not identify an arbitrary integral map with a finite map.

For a filtered system `K_a` on the fixed finite-type residue target with common lower bound, prove `C_{≥d}` is preserved by its derived filtered colimit in the tower application. In the strict localization at a geometric point, the complement of its closed support is qcqs and has an `ℓ`-cohomological-dimension bound controlled by the fixed finite-dimensional target. Compute the costalk by the localization triangle and commute its two coherent cohomology terms with the filtered colimit. This verifies the hypotheses of LPV §6.5's filtered-colimit criterion. The same finite diagrams prove the proper-pushforward/nearby exchange after passage to power-bounded formal models in IG.4.0a. The conclusion is a cosupport bound in the enhanced category, not constructibility of the colimit and not a perverse heart on every nonnoetherian scheme.

Apply this to IG.4.3 as follows. At finite `(m₁,m₂)`, algebraize the map to `U′`. The composite of the interior open immersion into the finite-level **minimal** variety with its finite level-change map carries `Λ` into `^pD^{≥d}: Λ[d]` is perverse on the smooth interior, `Rj_*` is left `t`-exact and the finite map is `t`-exact. IG.4.0a preserves that lower bound under nearby cycles. For fixed `m₁`, IG.4.6 kills the difference between toroidal constant coefficients and `Rj_*` after the `m₂`-colimit. The two-level continuity then gives the same bound for the toroidal infinite-level complex. Finally apply the integral raw-special-fibre map of IG.4.3 and IG.4.0b to descend the auxiliary level. The bound `d` is independent of both indices. In the proper compact situation there is no interior-boundary term: the same finite models and finite pushforward give both bounds and yield IG.4.4. This supplies the actual Igusa instance of the supplier criteria.

The API: `IntegralCosupportBound`, `integralPushforward_cosupport`, `igusaTower_costalkColimit`, `igusaTower_uniformLowerBound`, `igusaTower_nearbyExchange`, `compactIgusaTower_twoSidedBound`. Source: [CSnc](#ref-csnc), Theorem 4.6.1 and its proof, pp.60–63; [CS17](#ref-cs17), Proposition 6.1.3 and its proof, pp.751–753; LPV §6.5 for the conditional abstract colimit theorem. *Needs:* EtaleCohomologyFoundations §§`F`.0–`F`.3, `F`.8; EtaleDualityAndPerverseSheaves §2.11 for finite-type costalks and finite pushforward; EnhancedDerivedSheaves E1–E3 for the nonconstructible category; AdicCoefficientsAndComparisons L2 for finite-diagram/coherent étale continuity; IG.4.0a–IG.4.0b and IG.4.3, IG.4.6 for the geometric instance. Establish the general finite/integral continuity first, the model exchange second, and the two-level application after IG.4.6.

**Checks.**

- A finite disjoint union of points over a point has exact pushforward, including when its degree is divisible by `ℓ`. This is not invariants under an `ℓ`-group.
- An infinite integral affine extension can fail finite type; the argument uses finite subalgebras and the limit site, not finite-type constructibility of its source.
- A system with lower bounds tending to `−∞` is excluded. A union of infinitely many point-supported finite sheaves can keep a common bound while ceasing to be constructible.
- On a point `δ=0`, so `C_{≥d}` is the usual `D^{≥d}`. For the zero coefficient complex every asserted bound holds.

### IG.4.1 Equivariant sites and nearby cycles

<a id="ig-4-equivariant-sites-and-nearby-cycles"></a>

For a locally profinite group acting continuously, Scholze's equivariant étale sites give `(Fℓ_{G,μ}/G(ℚ_p))_ét` and `(𝒮_{K^p}/G(ℚ_p))_ét` with `π_HT/G(ℚ_p)` between them; `R(π_HT/G(ℚ_p))_*𝔽_ℓ` pulls back to `Rπ_HT*𝔽_ℓ` along `(Fℓ_{G,μ})_ét → (Fℓ_{G,μ}/G(ℚ_p))_ét` (pass to slice categories to replace `G(ℚ_p)` by a compact open `K_p`, then to the limit). On the cofinal affinoid basis and eligible finite-presentation formal models `𝔘` of IG.4.0a, shrink `K_p ⊂ G(ℚ_p)` so that it acts on the model and trivially on its residue-field reduction. It suffices to control the finitely many model generators modulo the ideal of definition. Henselian lifting then gives the equivariant nearby-cycle morphism `λ_{U/K_p} : (U_η̄/K_p)_ét → 𝔘_k,ét`. The raw power-bounded model is compared by the integral continuity of IG.4.0c; its reduction is not asserted to be finitely generated over `𝔽_p`.

Assume Continuous action of a locally profinite group on an analytic adic space (Scholze, Lubin–Tate paper §2).

([CS17](#ref-cs17), §6.1, p. 751.)

The API: `equivariantEtaleSite`, `equivariantSite.pullback`, `equivariantSite.slice`, `nearbyCyclesEquivariant`.

*Needs:* DiamondEtaleCohomology C0; ClassicalAdicEtaleCohomology §§4.4–4.5; IG.4.0a–IG.4.0c; SchemeAndStackFoundations §§4.7–4.8 (finite formal diagrams); AdicSpacesPartIII `F0, R2`; PerfectoidShimuraVarieties Layer 3.

**Checks.**

- For the trivial group this is the ordinary site.
- A finite free action gives the quotient site.
- For the trivial `C_ℓ`-action on a point, equivariant `H¹` is `𝔽_ℓ` whereas ordinary `H¹` is zero.

### IG.4.2 Finiteness from the rank-one valuative criterion

<a id="ig-4-finiteness-from-rank-one-valuative-criterion"></a>

Let `f : X → Y` be a morphism of affine schemes of finite type over `𝔽_p` such that, for every algebraically closed field `K` with a rank-one valuation ring `V ⊂ K`, every `V`-point of `Y` together with a `K`-point of `X` lifting its generic point extends to a `V`-point of `X`. Then `f` is proper, hence finite.

Assume `X, Y` affine of finite type over `𝔽_p`.

([CS17](#ref-cs17), §6.1, proof of Proposition 6.1.3, p. 753.)

*Needs:* Mathlib `AlgebraicGeometry.IsProper.of_valuativeCriterion`; Mathlib `AlgebraicGeometry.ValuativeCriterion`; Mathlib `AlgebraicGeometry.IsFinite`.

### IG.4.3 Cofinal finite-level formal models

<a id="ig-4-finite-level-formal-models"></a>

Every geometric point `x` of `Fℓ_C` has a cofinal system of affinoid étale neighbourhoods `U = Spa(A) → Fℓ_C` such that: `(1) S^*_{K(p^∞N),U} := S^*_{K(p^∞N),C} ×_{Fℓ_C} U` is affinoid perfectoid, `= Spa(R_{K(p^∞N),U})`, and is the preimage of an affinoid `U′ = S^*_{K(p^mN),U}` étale over `S^*_{K(p^mN),C}` for `m` large; `(2)` with `𝔘 = Spf(A°)`, the reduction modulo `p` of `Spf(R°_{K(p^∞N),U}) → 𝔘` factors over `Spec(R°_{K(p^mN),U}/p) → Spec(A°/p)` for `m` large, and this map of affine schemes is integral (integrality is the asserted property; no finite-type claim over `𝔽_p` is made here); `(3)` the minimal charts and finite-level factorizations admit compatible changes in auxiliary `ℓ`-power tame level; the toroidal compactifications map properly to these minimal charts, with compatible boundary maps. Affinoid perfectoidness is asserted only for the minimal preimages. These formal models, with the transition maps in `p`-level and `ℓ`-level and the boundary maps, are the finite-level geometry from which the semiperverse bound is deduced. Distinguish the raw model `Spec(A°/p)` over `O_C/p` from its residue-field reduction `𝔘_k`. Choose the finite-presentation formal models of IG.4.0a; their residue-field targets are affine of finite type over `k`. The normalization/power-bounded models are compared with these through filtered finite integral subalgebras, as in IG.4.0c. Neither the raw source nor its raw reduction is declared finite type merely because the map is integral. The perverse pushforward and nearby-cycle comparison interfaces using these models belong to [IG.4.7](#ig-4-semiperversity).

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §4.6, proof of Theorem 4.6.1, p. 62; §4.6, proof of Theorem 4.6.1, p. 61.)

The API: `FormalNeighbourhood`, `FormalNeighbourhood.cofinal`, `FormalNeighbourhood.integral`, `FormalNeighbourhood.transition`, `FormalNeighbourhood.factor_modP`.

*Needs:* IG.4; IG.3; PerfectoidShimuraVarieties Layer 3; IG.4.0a–IG.4.0c (first their general model/descent/continuity assertions); SchemeAndStackFoundations §§1.1, 2.23 (finite equivariant descent).

**Checks.**

- The cofinal system is closed under finite étale and rational refinements.
- For `m≥m₀` both the raw mod-`p` map and its residue-field reduction are integral; finite presentation alone does not make them finite.
- For `d_b>0` the generic fibre has positive dimension even though the special-fibre map is integral; the basic case has dimension zero.

### IG.4.4 Compact Hodge-type perversity

<a id="ig-4-compact-perversity"></a>

Let `π_HT : 𝒮_{K^p} → Fℓ_{G,μ}` be the Hodge–Tate period map of a compact Shimura variety of Hodge type, `K^p ⊂ G(𝔸_f^p)` sufficiently small, and `x̄` a geometric point of `Fℓ_{G,μ}`. Then `x̄` has a neighbourhood basis of affinoid étale neighbourhoods `U = Spa(A, A°)` such that, with an eligible finite-presentation formal model `𝔘` of IG.4.0a, `Rλ_{U/K_p*}(R(π_HT/G(ℚ_p))_*𝔽_ℓ)|_{U_η̄/K_p}[⟨2ρ, μ⟩]` is a perverse sheaf on `𝔘_s̄` for every sufficiently small pro-`p` compact open `K_p ⊂ G(ℚ_p)`. This is the compact-case strengthening (full perversity), not merged with the non-compact one-sided bound of [IG.4.7](#ig-4-semiperversity).

Assume Compact Shimura variety of Hodge type (Prop. 6.1.3 is stated for Hodge type; CS17 §6.1).

([CS17](#ref-cs17), §6.1, Proposition 6.1.3, p. 751.)

*Needs:* IG.4; IG.4.0a–IG.4.0c (the compact two-sided case); LefschetzPencilsAndVanishingCycles LPV.6, LPV.0; ClassicalAdicEtaleCohomology §§4.4–4.5; EtaleCohomologyFoundations §`F`.8; EtaleDualityAndPerverseSheaves §2.11; PerfectoidShimuraVarieties Layer 3.

### IG.4.5 Compact minimal-stratum concentration

<a id="ig-4-compact-minimal-stratum-concentration"></a>

Suppose the Shimura variety is compact, of PEL type `(A)` or `(C)` with good reduction at `p` (as in [IG.3.17](#ig-3-compact-fibre-theorem)), `ℓ ≠ p`. Let `S` be a finite set of primes containing `p` with `K^p = K^p_S K^S, K^S` hyperspecial, `𝕋^S = ℤ[G(𝔸_f^S)//K^S]` (or any subalgebra of it acting on `Rπ_HT*𝔽_ℓ`), and `𝔪 ⊂ 𝕋^S` maximal. Among the `b ∈ B(G, μ^{−1})` with `H^i(Ig^b, 𝔽_ℓ)[𝔪] ≠ 0` for some `i`, choose `b` with `d_b = ⟨2ρ, ν_b⟩` minimal. Then `H^i(Ig^b, 𝔽_ℓ)[𝔪]` is nonzero only for `i = d_b`. For `ℚ̄_ℓ`-coefficients use the corresponding eigenideal of the characteristic-zero Hecke algebra; the analogous concentration holds, and (Li–Liu, footnote `16`) the argument is asserted to apply when only one factor of the level at `p` is hyperspecial in their Harris–Taylor type setting.

Assume Compact PEL type `(A)` or `(C)` Shimura variety with good reduction at `p`; `S` ∋ `p`.

([CS17](#ref-cs17), §6.1, Corollary 6.1.4, p. 753; [lil21](#ref-lil21), Proof of Lemma 7.3 and footnote `16`, p. 35.)

*Needs:* IG.4; IG.3; IG.1; EtaleCohomologyFoundations §`F`.8; EtaleDualityAndPerverseSheaves §2.11.

### IG.4.6 Boundary vanishing at `ℓ^∞` tame level

<a id="ig-4-ell-power-boundary-killing"></a>

`(1)` For `j_{Nℓ^∞} : S_{K(Nℓ^∞),ℚ̄} ↪ S^tor_{K(Nℓ^∞),ℚ̄}` (inverse limits over the levels `Nℓ^m` taken in schemes), the natural map `𝔽_ℓ → Rj_{Nℓ^∞,*}𝔽_ℓ` is an isomorphism. `(2)` For any Igusa variety `Ig^X`, the restriction `H^i(Ig^{X,tor}_{K(Nℓ^∞)}, 𝔽_ℓ) → H^i(Ig^X_{K(Nℓ^∞)}, 𝔽_ℓ)` is an isomorphism. Consequently `Rπ^tor_{HT,ℓ^∞,*}𝔽_ℓ → Rπ°_{HT,ℓ^∞,*}𝔽_ℓ` is an isomorphism.

On a normal-crossing boundary chart, the `ℓ`-power tame-level pullback multiplies each positive-degree branch Kummer generator by `ℓ`. AdicCoefficientsAndComparisons L5 identifies these generators and their exterior products on both sides. Their filtered colimit with `𝔽_ℓ` coefficients is zero, while degree zero remains constant. Apply étale continuity and descend the chart comparison to the Igusa boundary.

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §4.6, Lemma 4.6.2, p. 61; §4.6, Lemma 4.6.3, p. 61.)

*Needs:* IG.2; IG.3; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C5.

### IG.4.7 Semiperversity of nearby cycles

<a id="ig-4-semiperversity"></a>

Consider `Rπ°_HT*𝔽_ℓ ∈ D(Fℓ_C, 𝔽_ℓ)` for `π°_HT : S°_{K(p^∞N),C} → Fℓ_C`. Every geometric point `x` of `Fℓ_C` has a cofinal system of affinoid étale neighbourhoods `U = Spa(A) → Fℓ_C` such that, with an eligible finite-presentation formal model `𝔘` of IG.4.0a, the nearby cycles satisfy `Rψ(Rπ°_HT*𝔽_ℓ)|_𝔘 ∈ ^pD^{≥d}(𝔘_k, 𝔽_ℓ), d = [F⁺:ℚ]n²`. The statement is local (for such cofinal `U`), in the scheme-theoretic perverse `t`-structure on the special fibres `𝔘_k`; it is not a statement about a perverse `t`-structure on `Fℓ` itself. Here `^pD^{≥d}` denotes the geometric costalk lower-bound criterion on the finite-type `k`-target and its continuous enlargement for the level complexes; no perverse `t`-structure on all nonnoetherian schemes is assumed.

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §4.6, Theorem 4.6.1, p. 60; §4.6, end of proof of Theorem 4.6.1, p. 63.)

The API: `FormalNeighbourhood.pushforward_ge`, `FormalNeighbourhood.nearbyComparisonCompatibility`.

*Needs:* IG.4; IG.4.0a–IG.4.0c (including the two-level application after IG.4.6); IG.3; LefschetzPencilsAndVanishingCycles LPV.6, LPV.0; ClassicalAdicEtaleCohomology §§4.4–4.5; EtaleCohomologyFoundations §`F`.8; EtaleDualityAndPerverseSheaves §2.11; SchemeAndStackFoundations §§1.1, 2.23; SmoothRepresentationsOfLocalGroups SR.0, SR.0d

### IG.4.0d Ordinary supports under refinement of formal models

<a id="ig-4-ordinary-support-limit"></a>

For the proper flag variety `Fℓ_C` and its compact closed subset `Z₀=Fℓ(ℚ_p)`, construct a cofiltered system of the formal models of IG.4.3 with their admissible refinements such that the specializations `Z_𝔉` of `Z₀` are finite closed sets and their tubes shrink cofinally to `Z₀`. Prove cofinality by separating a point outside `Z₀` from the compact set with rational inequalities and then encoding the finitely many inequalities by an admissible blowup. Use the supported étale topoi when a tube boundary is not an open adic subspace. Identify the filtered union of the complementary qc neighborhoods with `Fℓ_C\Z₀` on its étale site, with all generizations retained. Thus continuity and the finite-model comparison identify `RΓ` of that complement with the inverse limit of the corresponding complement complexes.

For `F=Rπ°_{HT,*}𝔽_ℓ` take the fibre of the restriction to the complement, **before** passing to the limit. Proper formal comparison and the compatible localization triangles give

`RΓ_{Z₀}(Fℓ_C,F) ≅ Rlim_𝔉 RΓ_{Z_𝔉}(𝔉_k,Rψ_𝔉 F)`.

The transition maps are pullbacks for refinement followed by the canonical support maps; replacing this `Rlim` by a filtered colimit changes the statement. Each right-hand complex is in `D^{≥d}`: IG.4.7 gives the lower perverse bound, the finite closed support has dimension zero and its exceptional restriction is left `t`-exact. The connective part `D^{≥d}` is closed under derived limits, so no Mittag–Leffler assertion is needed for this lower bound. Perform the construction equivariantly for a small pro-`p K_p` stabilizing the diagram and use IG.4.0b; enlarging `K_p` retains derived invariants. This proves exactly the ordinary costalk bound of IG.7.12.

The API: `OrdinarySupportModelSystem`, `ordinarySupport_tubesCofinal`, `ordinarySupport_refinementMap`, `ordinarySupport_derivedLimit`, `ordinarySupport_derivedLimit_equivariant`. Source: [Koshikawa](#ref-kos21), Corollary 8.2 and its proof, pp.13–14; Lemma 8.3, pp.13–14, read with the adjunction `i_*⊣Ri^!`; [CSnc](#ref-csnc), Theorem 4.6.1, p.60. *Needs:* IG.4.0a–IG.4.0c and IG.4.7; DiamondSixOperations S3 localization; ClassicalAdicEtaleCohomology §§1.2, 4.5, 6.3 for supported comparisons; AdicSpacesPartIII R2 for admissible formal refinements; EnhancedDerivedSheaves E0–E3 for fibre sequences and derived limits. It is the support comparison added to LPV's tower criterion, not a consequence of filtered-colimit continuity alone.

**Checks.**

- If `Z₀=∅` every support complex and the limit vanish. If `Z₀` is the whole proper zero-dimensional flag, the formula is ordinary proper comparison.
- For `ℙ¹(ℚ_p)⊂ℙ¹_C`, a single special-fibre support set only specifies a union of residue tubes. Refinement is required to recover the rational locus itself.
- A nonproper space cannot use the global proper comparison without support or a compactification. The target concerns the proper flag, although its coefficient complex comes from a nonproper Shimura variety.
- Higher `Rlim` terms are retained; the conclusion is a lower degree bound and does not assert concentration in one degree.

### IG.4.8 Partially compactly supported cohomology

<a id="ig-4-partial-support-cohomology"></a>

For `b ∈ B(G_{ℚ_p}, μ^{−1})` with completely slope divisible `X_b` and `j : Ig^b ↪ Ig^{b,*}` the open immersion into the partial minimal compactification ([IG.2.18](#ig-2-minimal-igusa-compactification)), define `RΓ_{c−∂}(Ig^b, 𝔽_ℓ) := RΓ(Ig^{b,*}, j_!𝔽_ℓ)` and `H^i_{c−∂}(Ig^b, 𝔽_ℓ) := H^i(Ig^{b,*}, j_!𝔽_ℓ)`, at each finite level and in the colimit over levels. It carries the action of `𝕋^S` and the natural map `H^i_{c−∂}(Ig^b, 𝔽_ℓ) → H^i(Ig^b, 𝔽_ℓ)` induced by `j_!𝔽_ℓ → Rj_*𝔽_ℓ`. This is not the ordinary compactly supported cohomology `RΓ_c(Ig^b)` (`Ig^{b,*}` is not proper), and not `RΓ(Ig^b)` unless the boundary is empty.

Work in the nearby-cycle setting. Assume also `X_b` completely slope divisible.

([CSnc](#ref-csnc), §2.8, p. 33.)

The API:

- `partialSupportCohomology`: `RΓ(Ig^{b,*},j_!𝔽_ℓ)`.
- `partialSupportCohomology.toCohomology`: The equivariant forget-support map.
- `partialSupportCohomology.triangle`: The displayed boundary distinguished triangle.
- `partialSupportCohomology.fromCompact`: The map from ordinary compact support.
- `partialSupportCohomology.hecke`: Hecke equivariance.

*Needs:* IG.2; IG.1; EtaleCohomologyFoundations §§`F`.0–`F`.3; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Checks.**

- If `X_b^{ét} = 0` then `RΓ_{c−∂}(Ig^b) = RΓ(Ig^b)`.
- For the modular curve and `b` ordinary at finite level `m, H⁰_{c−∂}(Ig^b_m, 𝔽_ℓ) = 0` (`j_!` kills global sections on the affine curve with cusps added) while `H⁰(Ig^b_m, 𝔽_ℓ) ≠ 0`.
- `RΓ_{c−∂}(Ig^b) ≠ RΓ_c(Ig^b)` in general: `Ig^{b,*}` is affine, not proper, when the leaf is non-proper.

### IG.4.9 The Artin vanishing upper bound

<a id="ig-4-artin-vanishing-upper-bound"></a>

The partial minimal compactification `Ig^{b,*}` is affine (Theorem 2.8.1); consequently, for every `ℓ ≠ p, H^i_{c−∂}(Ig^b, 𝔽_ℓ) = H^i(Ig^{b,*}, j_!𝔽_ℓ)` is nonzero only for `i ≤ d_b = dim Ig^b`.

Work in the nearby-cycle setting.

Choose the fundamental integral representative of IG.0.18a–IG.0.18b in each class. IG.2.14 identifies its central leaf as an EO stratum, IG.2.13 makes its partial minimal compactification affine, and IG.2.18 gives the affine finite-level minimal Igusa varieties. This establishes the geometric input at every unramified `p`. If a different representative is used, apply the multiplier-`1` transfer IG.2.10–IG.2.16 at `p` split in `F₀`; no arbitrary-`X` nonsplit affineness theorem is used.

([CSnc](#ref-csnc), §2.8, Proposition 2.8.2, p. 34.)

*Needs:* IG.4; IG.2; EtaleCohomologyFoundations §§`F`.3, `F`.8.

### IG.4.10 The minimal-stratum lower bound

<a id="ig-4-minimal-stratum-lower-bound"></a>

Let `S` be a finite set of places containing `∞` and all primes dividing `pℓNΔ_F, 𝔪` a maximal ideal containing `ℓ` of the operator algebra `𝕋^S` (or of `𝕋^S_full`), and choose `b ∈ B(G_{ℚ_p}, μ^{−1})` with `d_b` minimal among those with `H^*(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0`. Then `H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0` implies `i ≥ d_b`. (No constructibility of the perverse sheaves is needed; Remark 2.8.5: the dual variant for `Rπ^*_HT*(j_!𝔽_ℓ)` would only reprove the upper bound.)

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §2.8, Lemma 2.8.4, p. 34; §2.8, proof of Lemma 2.8.4, p. 34.)

*Needs:* IG.4; IG.3; IG.1; ClassicalAdicEtaleCohomology Layer 1; EtaleCohomologyFoundations §`F`.8; EtaleDualityAndPerverseSheaves §2.11.

### Examples

For the modular curve and the ordinary class at finite level, `H⁰_{c−∂}` of the Igusa curve vanishes while `H⁰` does not, so the partially compactly supported and ordinary cohomology differ in the lowest degree; the Artin bound places `H_{c−∂}` in degrees at most `d_b = 1` and the minimal-stratum bound places the localized `H` in degrees at least `d_b`. When the two bounds meet, the localized cohomology of the minimal stratum is concentrated in degree `d_b`.

### Dependencies

Layers IG.1–IG.3; LefschetzPencilsAndVanishingCycles LPV.0, LPV.6; EtaleCohomologyFoundations §§`F`.0–`F`.3, `F`.8; EtaleDualityAndPerverseSheaves §2.11; ClassicalAdicEtaleCohomology Layers `1, 4`–`6`; DiamondEtaleCohomology C0; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C5; PerfectoidShimuraVarieties Layer 3; SchemeAndStackFoundations §§1.1, 2.23, 4.7–4.8; AdicSpacesPartIII `F0, R2`; SmoothRepresentationsOfLocalGroups SR.0, SR.0d.

## Layer IG.5: Dual Hecke systems and ordinary genericity

### IG.5.1 Dual Hecke ideals and their Galois systems

<a id="ig-5-dual-hecke-ideal"></a>

Let `ι` be the involution `[K_qgK_q] ↦ [K_qg^{−1}K_q]` of the full algebra `𝕋^S_full` of IG.0.4; it preserves the operator algebra `𝕋^S` and `ι(T_{i,v}) = T_{2n,v}^{−1}T_{2n−i,v}`. For a maximal ideal `𝔪` of `𝕋^S_full` or of `𝕋^S` with finite residue field set `𝔪^∨ := ι(𝔪)`, a maximal ideal with the same residue field; for `𝔐 ⊂ 𝕋^S_full` over `𝔪 ⊂ 𝕋^S, 𝔐^∨` lies over `𝔪^∨` (IG.0.5). if `𝔪` is of Galois type with `ρ_𝔪` (Frobenius polynomial `X^{2n} − T_{1,v}X^{2n−1} + … + q_v^{n(2n−1)}T_{2n,v}`, geometric Frobenius), then `𝔪^∨` is of Galois type with `ρ_{𝔪^∨} ≅ ρ_𝔪^∨` `⊗ |Art_F^{−1}|^{1−2n}, Art_F` sending uniformizers to geometric Frobenius; the Frobenius eigenvalues of `ρ_{𝔪^∨}` at `v` are `q_v^{2n−1}α_{i,v}^{−1}`. Hence `ρ_𝔪 = ρ_{𝔪^∨}^∨` `⊗ |Art_F^{−1}|^{1−2n}`, and unramifiedness at `v`, the length of `ρ_𝔪` and the condition `α_i ≠ q_vα_j (i ≠ j)` are preserved by `𝔪 ↦ 𝔪^∨`.

Work in the trace-comparison setting.

([CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3, p. 66; [acc23](#ref-acc23), §2.2.19 'Duality and twisting', pp. 35–37: anti-involutions `ι, ι̃` (p. 35), `m^∨ := ι(m)` (p. 36), Proposition 2.2.20 and Corollary 2.2.21 (pp. 36–37).)

The API:

- `dualIdeal`: The maximal ideal `ι(𝔪)` with unchanged residue field, for `𝕋^S_full` and for `𝕋^S`, with `dualIdeal_dualIdeal` and `dualIdeal_comap` (compatibility with the inclusion `𝕋^S ⊂ 𝕋^S_full`).
- `dualIdeal_galois`: The contragredient Tate twist and eigenvalues stated above.
- `dualIdeal_preserves`: Invariance of length, unramifiedness away from `ℓ` and weak genericity; no unramifiedness assertion above `ℓ`.
- `dualEigenvalues` and `dualEigenvalues_generic`: for `q∈k×` and `α:Fin m→k×`, the unit-valued tuple `q^{m−1}α_i⁻¹` and preservation and reflection of AG2.7's `IsGenericEigenvalues`. Apply `isGenericEigenvalues_inverse` and `isGenericEigenvalues_smul`; injectivity is also preserved, giving the strong predicate. `genericEigenvalues_iff_crossMultiply` identifies the unit-valued ordered-ratio formula with `α_i≠qα_j`; for a field-valued tuple this conversion requires every entry nonzero. The suggested signatures express the supplied predicates by these formulas.

*Needs:* IG.0 (IG.0.4 and IG.0.5); AutomorphicGaloisRepresentationsPartII AG2.7; IntegralHeckeAndGaloisDeterminants Layer 3a; ClassFieldTheory Layer 11.

**Checks.**

- `(𝔪^∨)^∨` `= 𝔪`.
- For `2n = 2` and eigenvalues `{α, β}` of `ρ_𝔪(Frob_v)`, the eigenvalues for `𝔪^∨` are `{q_v/α, q_v/β}`.
- `𝔪^∨` `≠ 𝔪` in general: for `ρ_𝔪` with eigenvalues `{1, 2}` at `q_v = 7` over `𝔽_ℓ, ℓ = 11`, the dual has eigenvalues `{7, 7/2}`.
- For `𝔐 ⊂ 𝕋^S_full` over `𝔪 ⊂ 𝕋^S, 𝔐^∨` `∩ 𝕋^S = 𝔪^∨`; if `U_q ≡ u` modulo `𝔐` then `U_q ≡ u⁻¹` modulo `𝔐^∨`, so dualizing also inverts the similitude eigenvalues.

### IG.5.2 Hecke-equivariant Poincaré duality

<a id="ig-5-igusa-poincare-duality"></a>

Let `Ig = Ig^b_{Mant,m,K(N)}` be a finite-level Igusa variety (smooth of dimension `d_b` over `k`) and `Λ = ℤ/ℓ^n` or `ℤ_ℓ`. Then `RΓ_c(Ig, Λ) ≅ RHom_Λ(RΓ(Ig, Λ), Λ)`[−2d_b](−d_b), and under this isomorphism `T ∈ 𝕋^S_full` acts on the left through `ι(T)` on the right. Consequently, for a maximal ideal `𝔪` of `𝕋^S_full` or of `𝕋^S, RΓ_c(Ig, Λ)_{𝔪^∨} ≅ RHom_Λ(RΓ(Ig, Λ)_𝔪, Λ)`[−2d_b](−d_b), compatibly with the transition maps: pullback on `RΓ` along a finite étale transition `Ig_{m′} → Ig_m` is dual to the trace on `RΓ_c`. (Since a dual turns colimits into limits, this is not a duality between `colim_m RΓ_c` and `colim_m RΓ`.)

Work in the trace-comparison setting. Assume also `ℓ ≠ p`.

([CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3, p. 66.)

*Needs:* IG.5; IG.1; EtaleCohomologyFoundations §§`F`.5–`F`.6; EtaleDualityAndPerverseSheaves §§0.5–0.6.

### IG.5.3 Galois representations of Igusa constituents

<a id="ig-5-galois-representations-for-igusa-constituents"></a>

Under the standing assumptions of §5 (listed in the hypotheses), write `[H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] := Σ_i (−1)^i [colim_m H^i_c(Ig^b_{m,K(N)}, ℚ̄_ℓ)] = Σ_{j∈J} n_j π_j ⊗ ψ_j` as a virtual representation of `J_b(ℚ_p) × 𝕋^S_full` (`π_j` irreducible smooth, `ψ_j : 𝕋^S_full → ℚ̄_ℓ` characters, `n_j ≠ 0`, pairwise distinct). For each `j` there is a continuous semisimple `ρ_j : Gal(F̄/F) → GL_{2n}(ℚ̄_ℓ)`, almost everywhere unramified, unramified at every `v | q ∉ S` with `q` split in `F₀`, with characteristic polynomial of `ρ_j(Frob_v)` equal to `X^{2n} − ψ_j(T_{1,v})X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}ψ_j(T_{i,v})X^{2n−i} + … + q_v^{n(2n−1)}ψ_j(T_{2n,v})`; and for `v | p` the semisimple Langlands parameter of `π_{j,v}|·|^{1/2−n}` (via Badulescu's Jacquet–Langlands for the inner form `J_{b_v}` of a Levi of `GL_{2n}(F_v)`) equals the semisimple parameter of `ρ_j|_{Gal(F̄_v/F_v)}`.

Work in the trace-comparison setting. Assume also Semisimple Langlands parameters as in CSnc Remark 5.1.1: restriction of a Frobenius-semisimple WD representation along `w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2}))`.

([CSnc](#ref-csnc), §5.1, Theorem 5.1.2, p. 65; §5.1, p. 64.)

*Needs:* IG.1; EndoscopicTransferAndUnitaryTraceComparison §§8.21–8.22, §§6.6–6.25, §§14.1–14.7, §§10.3, 10.26–10.32; AutomorphicGaloisRepresentationsPartII AG2.`1a, AG2`.0, AG2.5

### IG.5.4 A rational constituent from mod-`ℓ` concentration

<a id="ig-5-concentrated-cohomology-gives-constituent"></a>

Under the standing assumptions, let `𝔪 ⊂ 𝕋^S_full` be a maximal ideal and suppose `H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪` is nonzero for exactly one `i`. Then `H^*_c(Ig^b_{K(N)}, ℤ_ℓ)_{𝔪^∨}` is concentrated in one degree and torsion-free, the corresponding `ℚ̄_ℓ`-cohomology is a nonzero lattice-bearing `𝕋^S_full`-module whose eigencharacters lift `𝔪^∨`, and in the decomposition of `[H_c(Ig^b_{K(N)}, ℚ̄_ℓ)]` there is `j ∈ J` with `ψ_j ≡ 𝔪^∨` (mod the maximal ideal of `ℤ̄_ℓ`) and `n_j ≠ 0` (no cancellation, since only one degree contributes). The semisimplified reduction `ρ̄_{𝔪^∨}` of `ρ_j` ([IG.5.3](#ig-5-galois-representations-for-igusa-constituents)) is independent of the choice of `j` and of the lattice.

Work in the trace-comparison setting.

([CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3, p. 66.)

*Needs:* IG.5; IG.1; AutomorphicGaloisRepresentationsPartII AG2.7; SchemeAndStackFoundations §§1.1, 2.23; SmoothRepresentationsOfLocalGroups SR.0, SR.0d

### IG.5.5 Splitting generic local lifts

<a id="ig-5-generic-lift-splits"></a>

Let `L/ℚ_p` be finite with residue cardinality `q, ℓ ≠ p`, and `ρ : Gal(L̄/L) → GL_m(ℚ̄_ℓ)` continuous whose semisimplified reduction `ρ̄` is unramified with Frobenius eigenvalues `α₁, …, α_m` satisfying `α_i ≠ qα_j` for `i ≠ j`. `(1)` If `ρ̄` is moreover decomposed generic at `L` (`α_i/α_j ∉ {1, q}` for `i ≠ j`), then `ρ ≅ ⊕χ_i` is a sum of characters with `χ_a/χ_b` not the cyclotomic character for a `≠ b`, so the corresponding representation of `GL_m(L)` is a generic principal series. `(2)` Without assuming the `α_i` distinct: if `q` ≢ `1` mod `ℓ` then `ρ` is unramified; if `q ≡ 1` mod `ℓ` then `ρ` is a direct sum of characters whose pairwise ratios are not the cyclotomic character (when `q≡1` mod `ℓ` the ratio condition itself forces distinct residual eigenvalues; repetitions are allowed in the `q≠1` branch).

Assume `ℓ ≠ p`; `α_i ≠ qα_j` for `i ≠ j`.

([CS17](#ref-cs17), §6.2, Lemma 6.2.2, p. 756; [CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3 and footnote `17`, pp.66–67 (arXiv `v2`).)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7; ArithmeticGaloisDuality D7.

### IG.5.6 Genericity forces ordinarity

<a id="ig-5-genericity-forces-ordinary"></a>

Assume the standing assumptions and let `𝔪 ⊂ 𝕋^S_full` be a maximal ideal such that `H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0` in exactly one degree. Then there is a continuous semisimple `ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ)`, unramified at every `v | q ∉ S` with `q` split in `F₀`, with `ρ̄_𝔪(Frob_v)` of characteristic polynomial the reduction modulo `𝔪` of `X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v}`; namely `ρ̄_𝔪 := (ρ̄_{𝔪^∨})^∨` `⊗ |Art_F^{−1}|^{1−2n}`. If moreover `p` splits completely in `F` and for all `v | p, ρ̄_𝔪` is unramified at `v` with Frobenius eigenvalues `α_{1,v}, …, α_{2n,v}` satisfying `α_{i,v} ≠ pα_{j,v}` for `i ≠ j` (the residual ratio predicate of AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues allowed), then `b` is ordinary. By IG.0.5 the same two conclusions hold for a maximal ideal `𝔪` of the operator algebra `𝕋^S` such that `H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0` in exactly one degree: apply the theorem to a maximal ideal of `𝕋^S_full` over `𝔪` that occurs in that degree; the Galois representation depends only on `𝔪`.

Work in the trace-comparison setting. Assume also `p` splits completely in `F` for the last assertion.

([CSnc](#ref-csnc), §5.1, Corollary 5.1.3, p. 66; §2.8, Theorem 2.8.6, p. 35.)

*Needs:* IG.5; EndoscopicTransferAndUnitaryTraceComparison §§10.3, 10.26–10.32; AutomorphicGaloisRepresentationsPartII AG2.7.

### Examples

For `2n = 2` and a residual representation with Frobenius eigenvalues `{1, 2}` at a place with `q_v = 7` over `𝔽_11`, the dual ideal has eigenvalues `{7, 7/2}`; the ratio condition `α_i ≠ q_vα_j` holds for both systems, as it must. If the Igusa cohomology of a non-ordinary class were concentrated in one degree for such a generic system, the lifted constituent would give a generic principal series of `J_b(ℚ_p)`, which does not exist for a nontrivial inner form of a Levi subgroup.

### Dependencies

Layers IG.0 and IG.1; EndoscopicTransferAndUnitaryTraceComparison Layers `6, 8, 10, 14`; AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7; EtaleCohomologyFoundations §§`F`.5–`F`.6; EtaleDualityAndPerverseSheaves §§0.5–0.6; ArithmeticGaloisDuality D7; SchemeAndStackFoundations §§1.1, 2.23; SmoothRepresentationsOfLocalGroups SR.0, SR.0d; IntegralHeckeAndGaloisDeterminants Layer 3a; ClassFieldTheory Layers 5 and `11`.

## Layer IG.6: Boundary cohomology and Pink’s formula

### IG.6.1 Parabolic boundary strata and the lower-rank datum

<a id="ig-6-boundary-strata-by-parabolics"></a>

The boundary `∂Ig^{b,*} ⊂ Ig^{b,*}` is stratified by the conjugacy classes `[P]` of maximal rational parabolics of `G_ℚ`, represented by `P_r = Stab(0 ⊂ F^r ⊂ F^{2n−r} ⊂ F^{2n}), r = 1, …, n: Ig^{b,*}_{[P_r]}` is the preimage of the strata `S_Z ⊂ S^*` whose cusp label `Z = (Z_N, X)` has `rk_{O_F} X = r`; the strata are Hecke-equivariant and pass to the limit `Ig^{b,*}_{∞,[P]}`. The Levi of the standard `P = P_r` is `M = Res_{F/ℚ}GL_r × G_{2(n−r)}` (replace `n` by `n−r`; for `r=n, G_0=𝔾_m`). Let `X_r = (∏_{τ:F⁺↪ℝ} M^{herm,>0}_r(ℂ))/ℝ_{>0}` be the symmetric space of `GL_r(F ⊗ ℝ)`. Fix an `O_F`-stable symplectic filtration `Z_b : 0 ⊂ Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b` with `Z_{b,−2} ≅ Hom(O_F^r, μ_{p^∞})`; it defines the parabolic `P_b(ℚ_p) ⊂ J_b(ℚ_p)` of self-quasi-isogenies preserving it and the `p`-divisible group `X_P = Z_{b,−1}/Z_{b,−2}` with `G_{2(n−r)}`-structure, with isocrystal class `b_P ∈ B(G_{2(n−r),ℚ_p}, μ^{−1})`. With `j : Ig^b_∞ ↪ Ig^{b,*}_∞` and `i_{[P]}` the inclusion of the stratum, `RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ)` is a complex of smooth `J_b(ℚ_p) × G(𝔸_f^p)`-representations.

The `rank-r` stratum closure is contained in the union of `rank≥r` strata; do not require equality when some strata are empty.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.1, p. 79; §6.1, p. 80.)

The API: `boundaryStratum`, `boundaryStratum_union`, `levelSubgroup`, `lowerRankDatum`, `levi`, `boundaryStratum_hecke`.

*Needs:* IG.2; IG.0; ArithmeticLocallySymmetricSpaces ALS.2; EtaleCohomologyFoundations §§`F`.0–`F`.3; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Checks.**

- For `n=1` only `r=1` occurs, and the lower-rank datum is trivial.
- If `X` has no étale part all boundary strata are empty.
- `X_P=Z_{−1}/Z_{−2}`, with this order of the graded pieces.

### IG.6.2 Parabolic induction of boundary strata

<a id="ig-6-boundary-parabolic-induction"></a>

There is a natural `J_b(ℚ_p) × G(𝔸_f^p)`-equivariant map `Ig^{b,*}_{∞,[P]} → J_b(ℚ_p)/P_b(ℚ_p) × G(𝔸_f^p)/P(𝔸_f^p)` induced by the cusp labels (the target parametrizes pairs `(Z_b, Z^p)` of `rank r`). With `Ig^{b,*}_{∞,P}` its fibre over the identity, `RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ)` (unnormalized smooth induction).

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.2.1, p. 80.)

*Needs:* IG.6; IG.2; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.0d

### IG.6.3 The boundary cup-product comparison

<a id="ig-6-boundary-comparison-map"></a>

There is a natural `P_b(ℚ_p) × P(𝔸_f^p)`-equivariant map `RΓ(GL_r(F) ∖ (X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ)`, the cup product of `(1) RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ)`, pullback along the profinite map `Ig^{b,*}_{∞,P} → Ig^{b_P}_∞` (limit of [IG.2.21](#ig-2-minimal-igusa-boundary-strata)), and `(2) RΓ(GL_r(F) ∖ (X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) → RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ)`, constructed from a continuous `P_b(ℚ_p) × P(𝔸_f^p)`-equivariant map `f  : |Ig^b_{∞,P}| → GL_r(F) ∖ (X_r × GL_r(𝔸_{F,f}))` on the punctured perfectoid formal neighbourhood (the logarithms of the norms of the sections of the Poincaré bundle of the Raynaud extension give the point of `X_r`, well defined up to `ℝ_{>0}`; the level structures give the adelic component), together with `RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) ≅ colim_{m,N} RΓ(Ig^b_{m,K(N),P}, 𝔽_ℓ)` (Huber, Cor. 3.5.14, at each finite level) and `RΓ(GL_r(F) ∖ (X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ≅ colim_K RΓ(GL_r(F) ∖ (X_r × GL_r(𝔸_{F,f})/K), 𝔽_ℓ)` (Borel–Serre). Both maps are equivariant for `P_b(ℚ_p) × P(𝔸_f^p)` acting through `J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p)`, respectively `GL_r(𝔸_{F,f})`.

The unipotent radicals of `P_b(ℚ_p)` and `P(𝔸_f^p)` act trivially on the source; equivariance factors through the stated Levi projections.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.2.2, p. 81; §6.2.3, p. 83.)

The API: `boundaryComparison`, `igusaFactor`, `lsFactor`, `lsFactor_equivariant`, `boundaryComparison_levi`.

*Needs:* IG.6; IG.2; IG.1; ClassicalAdicEtaleCohomology §§4.4–4.5; ArithmeticLocallySymmetricSpaces ALS.2, ALS.1, ALS.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties §3.13.

**Checks.**

- For imaginary quadratic `F` and `n=1` the cusp factor is functions on `GL₁(F)\GL₁(𝔸_{F,f})`, tensored with degree-zero lower-rank Igusa cohomology.
- For `[F⁺:ℚ]>1` use finite-level unit-group cohomology before taking the colimit.
- If `X` has no étale part both sides vanish.
- The `GL_r` factor map is a continuous map of real manifolds; it is not a morphism of schemes.

### IG.6.4 Local computation on cusp labels

<a id="ig-6-local-boundary-computation"></a>

Decompose `Ig^{b,*}_{∞,P}` by Igusa cusp labels above `P`: finite projective `O_F`-modules `X` of `rank r` with `X ⊗ ℤ̂^p ≅ O_F^r ⊗ ℤ̂^p` and `X ⊗ ℤ_p ≅ O_F^r ⊗ ℤ_p`, giving `⊔_{X/≅} GL_{O_F}(X)\GL_{O_F}(X ⊗ ℤ̂) ≅ GL_r(F)\GL_r(𝔸_{F,f})`, compatibly with `f`. For the closed subset `Ig^{b,*}_{∞,Z̃}` of a fixed label, the map `RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) ⊗ colim_{Γ ⊂ GL_{O_F}(X)} RΓ(Γ, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,Z̃}, i^*_{Z̃}Rj_*𝔽_ℓ)` (`Γ` running over congruence subgroups) is an isomorphism. The same method proves Pink's original formula Hecke-equivariantly (alternative to Pink §4.8). Lan–Stroh supplies the geometric framework, including Assumption 4.3.1, the stratification lemma and the compactification construction. Its Theorem 4.3.10 is stated with rational `ℓ`-adic coefficients; the torsion statement here is CSnc Proposition 6.3.1 and its proof, not a change of coefficients in that rational theorem.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.3, Proposition 6.3.1, p. 84; §6.3, proof of Proposition 6.3.1, p. 84; [ls18a-author](#ref-ls18a-author), §4.3, Assumption 4.3.1 and Lemma 4.3.2, author-copy p.61; Definition 4.3.8 and Theorem 4.3.10, pp.63–64.)

*Needs:* IG.6; IG.2; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties §3.13.

### IG.6.5 Pink's formula for Igusa varieties

<a id="ig-6-igusa-pink-formula"></a>

There is a natural `J_b(ℚ_p) × G(𝔸_f^p)`-equivariant isomorphism `RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} (RΓ(GL_r(F) ∖ (X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ))`, with unnormalized smooth induction and `P_b(ℚ_p) × P(𝔸_f^p)` acting on the tensor product through its Levi quotient (`J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p)` on the Igusa factor, `GL_r(𝔸_{F,f})` on the locally symmetric factor). No Tate twist or cohomological shift enters (`𝔽_ℓ` coefficients, degrees as written). The isomorphism is an equivariant isomorphism of complexes, not only an equality of Euler characteristics.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.1, Theorem 6.1.1, p. 80.)

*Needs:* IG.6.

### IG.6.6 Derived invariants of induced representations

<a id="ig-6-parabolic-induction-derived-invariants"></a>

Let `P = MN` be a standard rational parabolic of `G, K^S = ∏_{v∉S}` hyperspecial, `K^S_P = K^S ∩ P(𝔸^S), K^S_M` its image in `M(𝔸^S), r_P : 𝕋^S → 𝕋^S_P` restriction of functions and `r_M : 𝕋^S_P → 𝕋^S_M` integration along unipotent fibres (so `r_M ∘ r_P` is the unnormalized Satake transform; ArithmeticLocallySymmetricSpaces ALS.4). Then `(1) RΓ_cont(K^S, Ind^{G(𝔸^S)}_{P(𝔸^S)}(−)) ≅ r_P^* RΓ_cont(K^S_P, −)` as functors `D^+_sm(P(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S)`; `(2) r_M^* RΓ_cont(K^S_M, −) ≅ RΓ_cont(K^S_P, Inf^{P(𝔸^S)}_{M(𝔸^S)}(−))` as functors `D^+_sm(M(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_P)`.

Assume `K^S` hyperspecial at every place outside `S` (Iwasawa decomposition `G(𝔸^S) = K^S P(𝔸^S)`); `K^S_N` pro-prime-to-`ℓ`.

([CSnc](#ref-csnc), §6.4, Lemma 6.4.2, p. 85; §6.4, Lemma 6.4.3, p. 86.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.4; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.0d

### IG.6.6a The actual GL torsion input in the boundary normalization

<a id="ig-6-gl-torsion-adapter"></a>

Let `r≥1, F` be the CM field of IG.0, and `S` the places above a finite rational set containing `ℓ` and the ramification of `F/ℚ`. For a neat `GL_r` level hyperspecial outside `S`, a finite coefficient lattice local system, and a maximal ideal in the support of its ordinary cohomology, import TorsionCohomologyInfrastructure §§4.3 and 4.6: a continuous degree-`r` determinant modulo a uniformly nilpotent ideal, and its semisimple residual representation. Use its unconditional CM branch, since `F` contains an imaginary quadratic field. Use §3b.1, `scholzeLeviPolynomial_eq_reverse_comp`, to convert its polynomial

```text
P_Sch(X) = Σ_{i=0}^r (−1)^i q^{i(i+1)/2} U_i X^i = reverse(P_std)(qX),
P_std(Y) = Σ_{i=0}^r (−1)^i q^{i(i−1)/2} U_i Y^{r−i}.
```

Thus if `σ` has `det(1−Xσ(Frob_v))=P_Sch(X)`, set `ρ=σ⊗ε`, where `ε(Frob_v)=q_v⁻¹`. Then `det(Y−ρ(Frob_v))=P_std(Y)`. This is a cyclotomic twist, independently of the choice of geometric Frobenius. The same assertion for compact support follows from ArithmeticLocallySymmetricSpaces ALS.5a finite-level duality, retaining its orientation local system, involution and Tate twist; it is not a new determinant construction.

*Proof sketch.* Apply the imported actual theorem to the finite Hecke image, not to the abstract Hecke algebra with no occurrence hypothesis. A nilpotent ideal maps to zero in a residue field, so determinant reconstruction gives the representation without an irreducibility hypothesis. Perform the displayed coefficient substitution before comparing Satake transforms. For the finite local systems in the boundary calculation, pass to a normal finite level trivializing the coefficients and use the Hecke-compatible derived-invariant filtration (ALS.4 and IG.4.0b); work with its support, without asserting injectivity of pullback in characteristic `ℓ`. The general algebra, polynomial adapter and torsion determinant remain imports.

Source: [Scholze](#ref-sch15), Theorem 5.4.1 and Corollary 5.4.3, pp.1057–1060; [ACC+](#ref-acc23-published), Theorem 2.3.5 and proof, published pp.937–938 (author PDF pp.41–42). *Needs:* TorsionCohomologyInfrastructure §§3b.1, 3b.2, 4.3, 4.6; ArithmeticLocallySymmetricSpaces ALS.4, ALS.5a; IG.4.0b; IntegralHeckeAndGaloisDeterminants Layers 0 and `4`.

The application API is `boundaryGLResidualRepresentation`, `boundaryGLResidualRepresentation.frobenius`, `boundaryGLResidualRepresentation.coefficientCover` and `boundaryGLResidualRepresentation.compactDual`. It uses the imported polynomial definition and theorem.

**Checks.**

- For `r=1, q=3` and `U₁=2, P_Sch=1−6X`, whereas `P_std=Y−2`. Omitting `ε` changes the eigenvalue by `3`.
- For `r=2, q=2, U₁=3, U₂=5`, the two polynomials are `1−6X+40X²` and `Y²−3Y+10`. The coefficient `q` in the latter constant term survives.
- A nilpotent ideal has zero image in every residue field, including characteristic `2`. A general nonzero ideal cannot be discarded in this way.
- If `ℓ` divides the deck group order, replace invariants by derived invariants; no averaging idempotent is available.

### IG.6.6b Residual systems for the lower unitary Levi factors

<a id="ig-6-unitary-residual-systems"></a>

For each balanced unitary group `U(m,m), m≥1`, over `F⁺` and every neat level hyperspecial outside `S` as in IG.6.6a, any maximal ideal in the finite Hecke image on cohomology of a finite algebraic coefficient lattice modulo `ℓ` is of Galois type. More precisely there is a continuous semisimple `ρ̄ : Gal(F̄/F)→GL_{2m}(κ)`, after a finite residue extension if desired, unramified outside `S`, with the monic polynomial of IG.5.6 at split places. Its construction precedes, and uses none of, the Igusa vanishing or boundary-length conclusions. This is the unitary application of the completed-cohomology/classical determinant machinery, rather than an assertion that TorsionCohomologyInfrastructure Layer 4 states a torsion theorem for every unitary group.

*Proof sketch.* Work first with the corresponding Hodge-type similitude Shimura variety and small normal `ℓ`-levels. Import TorsionCohomologyInfrastructure §§2.1, 2.4, 2.6–2.8: the boundary-ideal comparison, bounded completed compact-support complex, classical Hecke topology, continuity and the actual tower descent. Import the continuous classical ambient determinant of §3b.2 in its unconditional CM branch. A finite set of torsion classes in the completed complex is annihilated by a basic open ideal, hence its Hecke support lies in a finite product of classical weight Hecke algebras modulo `ℓ`-powers. Restrict the ambient determinant to this support. Descent uses the common Hecke-equivariant complex: the finite filtration has nilpotent kernel on its Hecke image, which disappears at maximal ideals. This proves a residual determinant for every occurring finite-level compact-support system; finite-level duality gives ordinary cohomology and finite coefficient systems. Restriction to `U(m,m)` uses IG.0.6 and the same derived-invariant support argument, so no injection of torsion cohomology is required.

Check the normalization on the split `GL_{2m}` factor. In TC's normalized Satake coordinates `e_i=q^{-i(2m-i)/2}U_i`, its ambient degree-`2m` determinant has coefficients `(−1)^i q^{i/2}e_i`. Tensor its representation by `ε^{1−m}`: since `ε(Frob_v)=q⁻¹`, the coefficient becomes `(−1)^i q^{i(i−1)/2}U_i`. The calculation uses a temporary square root of `q`; the final polynomial has integral exponents and descends. If an auxiliary smallness prime was introduced, do the construction with two distinct such primes. Chebotarev and determinant uniqueness identify the two laws on the common Galois group, remove the auxiliary ramification, and recover `S`. Reconstruct the residual representation by IntegralHeckeAndGaloisDeterminants Layer 0. A finite residue field realizes it over `κ` by Brauer–Nesbitt and the vanishing of its Brauer group. For `m=0` use the zero-dimensional/trivial remaining factor, not this positive-rank theorem.

Source: [ACC+](#ref-acc23-published), Theorem 2.3.8 and proof, published pp.939–940 (author PDF pp.43–44), including its two-prime argument; [Scholze](#ref-sch15), Theorem 4.3.1, pp.1023–1024, and Corollary 5.1.11, pp.1037–1038. The completed support and classical interpolation are imported from TorsionCohomologyInfrastructure §§2.1, 2.4, 2.6–2.8, 3b.1–3b.2; the unitary specialization and monic normalization are owned here. *Needs:* IG.0.6, IG.4.0b, IG.6.6a; TorsionCohomologyInfrastructure §§2.1, 2.4, 2.6–2.8, 3b.1–3b.2; ArithmeticLocallySymmetricSpaces ALS.5a; IntegralHeckeAndGaloisDeterminants Layers `0, 2, 4` and `5`.

The API is `unitaryTorsionResidual`, `unitaryTorsionResidual.frobenius`, `unitaryTorsionResidual.removeAuxiliaryPrime` and `unitaryTorsionResidual.coefficientChange`.

**Checks.**

- For `m=1` the ambient `ε^{1−m}` twist is trivial; `q^{i/2}e_i` gives coefficients `1, −U₁, qU₂` in the monic `GL₂` polynomial.
- For `m=2`, the untwisted coefficient exponents are `−i(3−i)/2`; tensoring by `ε⁻¹` adds `i` and gives `i(i−1)/2` for `i=0,…,4`.
- Residual reducible systems are included. Absolute irreducibility is unnecessary for reconstruction over a field and is used only in the later boundary exclusion.
- A single auxiliary prime cannot certify unramifiedness there; the two-prime agreement is required.

### IG.6.7 The boundary length obstruction

<a id="ig-6-boundary-length-obstruction"></a>

Assume `p` unramified in `F, F` contains properly an imaginary quadratic `F₀` in which `p` splits, `F⁺ ≠ ℚ, S` and `N ≥ 3` as in §5 (`N` prime to `p`, divisible only by primes of `S^p_f` and by `N₀`), and `𝔪 ⊂ 𝕋^S_full` a maximal ideal containing `ℓ` (by IG.0.5 the statement then also holds for maximal ideals of the operator algebra `𝕋^S`); Igusa varieties at tame level `K^p(N)`. `(1)` If for some `b ∈ B(G_{ℚ_p}, μ^{−1})` one of `H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪, H^i(Ig^b, 𝔽_ℓ)_𝔪` is nonzero, then there is a continuous semisimple `ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ)` with `ρ̄_𝔪(Frob_v)` of characteristic polynomial `X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v}` mod `𝔪` for all `v | q ∉ S` split in `F₀`. `(2)` If moreover `H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪 → H^i(Ig^b, 𝔽_ℓ)_𝔪` is not an isomorphism for some `i` and `b` is not ordinary, then `ρ̄_𝔪` has at least `3` Jordan–Hölder constituents. Both parts are proved together, by induction on `n`, uniformly for all the unitary groups `G_{2m}, m ≤ n`. The hypothesis that `ρ̄_𝔪` has length at most two is not assumed here; it is the hypothesis under which `(2)` is applied in IG.7.

The hypotheses are those stated; the induction uses the theorem for `G_{2(n−r)}, 1 ≤ r ≤ n`, and the torsion Galois determinants for `GL_r` over `F`.

([CSnc](#ref-csnc), §6.4, Theorem 6.4.1, p. 84; §6.4, proof of Theorem 6.4.1, p. 86; §2.8, Theorem 2.8.7, p. 35.)

*Needs:* IG.6; IG.5; IG.4; IG.6.6a–IG.6.6b; IntegralHeckeAndGaloisDeterminants Layer 0, Layer 1, Layer 4; ArithmeticLocallySymmetricSpaces ALS.4.

### Examples

For `F` imaginary quadratic and `n = 1` only the rank-one boundary stratum occurs; its lower-rank Igusa factor is zero-dimensional and the locally symmetric factor is the finite set `GL_1(F)\GL_1(𝔸_{F,f})/K`, so Pink's formula expresses the boundary cohomology as functions on this set tensored with degree-zero Igusa cohomology, induced from the parabolic.

### Dependencies

Layers IG.0–IG.2, IG.4 and IG.5; ArithmeticLocallySymmetricSpaces ALS.0–ALS.2, ALS.4; TorsionCohomologyInfrastructure Layer 4; ClassicalAdicEtaleCohomology Layers 4–`6`; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties §3.13; EtaleCohomologyFoundations §§`F`.0–`F`.3; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2; IntegralHeckeAndGaloisDeterminants Layers `0, 1, 4`.

## Layer IG.7: Generic vanishing and its arithmetic forms

### IG.7.1 Caraiani–Scholze genericity

<a id="ig-7-cs-generic-maximal-ideal"></a>

A maximal ideal `𝔪` of the operator algebra `𝕋^S`, or equivalently `𝔪⁰ = heckeRestrict(𝔪)` of `𝕋^{0,S}`, of Galois type (with semisimple `ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ)` whose Frobenius polynomials are those of [IG.5.6](#ig-5-genericity-forces-ordinary)) is CS-generic if `(i) F⁺ ≠ ℚ`; (ii) `ρ̄_𝔪` has at most two Jordan–Hölder constituents; (iii) some prime `p ≠ ℓ` splits completely in `F` and `ρ̄_𝔪` is unramified at every `v | p` with Frobenius eigenvalues satisfying `α_{i,v} ≠ pα_{j,v}` for `i ≠ j` (a decomposed-generic prime in the sense of AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues are allowed, so the distinctness `α_i ≠ α_j` of CS17 is not required). This is distinct from (a) non-Eisenstein (`ρ̄_𝔪` absolutely irreducible), which is neither implied by nor implies (iii), and `(b)` the stronger local CS17 predicate `IsStrongGenericEigenvalues`, with `α_i/α_j ∉ {1, q}`. The local predicates and the global witness-prime predicate `IsDecomposedGeneric` are those of AutomorphicGaloisRepresentationsPartII AG2.7, on unit-valued eigenvalue tuples. The renaming dictionary for ACC+: the coefficient prime called `ℓ` here is called `p` in ACC+, and the auxiliary split prime called `p` here is called `l` there.

Work in the global residual-system setting.

([CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36; [acc23](#ref-acc23), Definition 4.3.1, pp. 76–77 (recalled from [CS17, Defn. 1.9] with `p` and `l` swapped).)

The API:

- `IsCSGeneric`: Conditions `(i)`–(iii) stated above.
- `IsCSGeneric.dual`: Invariance under dual ideals.
- `IsCSGeneric.of_strong`: CS17 strong genericity with `length≤2` implies CS-genericity.
- `IsCSGeneric.infinitely_many_primes`: Infinitely many witnesses avoiding any finite set (AG2.7).
- `IsCSGeneric.acc_dictionary`: The ACC+ dictionary, exchanging the two primes.
- The local inputs are the supplied `IsGenericEigenvalues` and `IsStrongGenericEigenvalues`; the global witness condition is the supplied `IsDecomposedGeneric`. `IsCSGeneric` adds the stated global field and residual-length hypotheses. The dual-system comparison is `dualEigenvalues_generic` of IG.5.1.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7; IG.0.

**Checks.**

- For `2n = 2, ρ̄ = χ₁ ⊕ χ₂` with `χ₁, χ₂` unramified at all `v | p` (`p` completely split) and `χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p^{−1}}` is CS-generic of length two; `ρ̄ = 1 ⊕ ε̄^{−1}` is not (its eigenvalue ratio at every such `v` is `p`).
- `A ρ̄_𝔪` with three or more Jordan–Hölder constituents (for instance a sum of three nonzero subrepresentations of `GL_{2n}`) is never CS-generic (condition (ii) fails), whatever its eigenvalues.
- CS-generic does not imply non-Eisenstein: the reducible `χ₁ ⊕ χ₂` of IsCSGeneric.reducible`_ok` is CS-generic and Eisenstein.
- Repeated eigenvalues `α_i = α_j` are allowed when `α_i ≠ pα_j` (CSnc Remark 1.4).

- An empty or singleton eigenvalue tuple satisfies both pairwise predicates. At `q=1` repeated eigenvalues fail even weak genericity; for `q=2` over `𝔽_5` the tuple `(1,1)` is weakly generic and fails strong genericity.

### IG.7.2 Cohomologically generic Hecke homomorphisms

<a id="ig-7-cohomologically-generic"></a>

Let `N ≥ 1, Σ⁺` a finite set of nonarchimedean places of `F⁺` containing `Σ⁺_bad`, and `𝕋_N^{Σ⁺}` the abstract spherical Hecke algebra of the unitary groups `U(V)` of `N`-dimensional hermitian spaces over `F`. A homomorphism `φ : 𝕋_N^{Σ⁺} → κ` to a field is cohomologically generic if `H^i_ét(Sh(V, K)_{F̄}, κ)_{𝕋_N^{Σ⁺′} ∩ ker φ} = 0` for every finite `Σ⁺′ ⊇ Σ⁺`, every `i ≠ N − 1`, every standard indefinite hermitian space `V` of dimension `N` and every `K = K_{Σ⁺′} × ∏_{v∉Σ⁺_∞∪Σ⁺′} U(Λ)(O_{F⁺_v})` with `Λ` self-dual. It is the cohomological conclusion of the compact-case concentration theorem, used as a hypothesis by Liu–Tian–Xiao–Zhang–Zhu.

Assume Notation of LTXZZ §3: standard indefinite hermitian spaces have signature `(N − 1, 1)` at one archimedean place and `(N, 0)` at the others.

([ltxzz](#ref-ltxzz), Appendix `D`, §`D`.1 'Vanishing of cohomology off middle degree', Definition `D`.1.1, p. 365; Published Appendix `D`, Proposition `D`.1.3 p.365 and Corollary `D`.1.4 p.368.)

The API:

- `IsCohomologicallyGeneric`: The stated vanishing predicate on `φ`.
- `IsCohomologicallyGeneric.mono`: Stability under enlarging `Σ⁺`.
- `IsCohomologicallyGeneric.field_ext`: Invariance under coefficient-field extension.
- `IsCohomologicallyGeneric.of_decomposedGeneric`: For `φ` with values in `𝔽̄_ℓ` and `F⁺≠ℚ`, an auxiliary split decomposed-generic witness away from `ℓ` and from every prescribed finite enlargement of `Σ⁺` implies cohomological genericity, by repeated application of LTXZZ PropositionD.1.3 as in CorollaryD.1.4. A single witness is insufficient for an arbitrary abstract Hecke character.

*Needs:* IG.7; AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- For `N = 1` every `φ` is cohomologically generic.
- The Eisenstein homomorphism attached to the trivial representation (degree of `H⁰`) is not cohomologically generic for `N ≥ 2`, since `H⁰ ≠ 0` and `0 ≠ N − 1`.
- For `N = 2` (Shimura curves), `φ` is cohomologically generic iff, for every `V` and `K` as in the definition, the localized `H⁰` and `H²` vanish.

### IG.7.3 The ordinary contribution and its lower bound

<a id="ig-7-only-ordinary-contributes"></a>

Assume `p` unramified in `F, N ≥ 3` prime to `p`, divisible only by primes in `S^p_f` and by `N₀, S ⊇ {∞} ∪ {primes dividing pℓNΔ_F} ∪ {ramification of ϖ}`, and `𝔪 ⊂ 𝕋^S` a CS-generic maximal ideal of the operator algebra with witness prime `p` (completely split in `F`). Then `H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0` only if `b` is ordinary, and then only for `i ≥ d`. The trace-formula and boundary inputs (IG.5, IG.6) are statements about maximal ideals of `𝕋^S_full`; they are applied to `𝔪` through IG.0.5. Consequently `(Rπ°_HT*𝔽_ℓ)_𝔪` is concentrated on the ordinary locus `Fℓ(ℚ_p)` and in degrees `≥ d`, and `H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 ≅ H^i(Fℓ, (Rπ°_HT*𝔽_ℓ)_𝔪)` vanishes for `i < d`.

Work in the global residual-system setting. Assume also Witness prime `p ≠ ℓ` completely split in `F`.

([CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36.)

*Needs:* IG.4; IG.6; IG.5; IG.3; IG.7.

### IG.7.4 Level descent

<a id="ig-7-level-descent"></a>

`(1)` If `H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 = 0` for `i < d`, then `H^i(X_{K(N)}, 𝔽_ℓ)_𝔪 = 0` for `i < d`. `(2)` For the unitary group: let `𝔪⁰ ⊂ 𝕋^{0,S}` be maximal and `𝔪 = heckeRestrict⁻¹(𝔪⁰) ⊂ 𝕋^S`. If `H^i(X_{K(N)}, 𝔽_ℓ)_𝔪 = 0` for `i < d`, then `H^i(X⁰_{K⁰}, 𝔽_ℓ)_{𝔪⁰} = 0` for `i < d` at `K⁰ = K(N) ∩ G⁰(𝔸_f)`, because the latter is a quotient of the former (IG.0.6). `(3)` For arbitrary neat `K⁰`, rechoose a good generic auxiliary prime away from its bad level primes, then descend from a normal principal-level cover using continuous étale Cartan–Leray, compatibly with the Hecke localization. The arbitrary-neat-level step uses the actual Hecke-compatible geometric Cartan–Leray isomorphism IG.4.0b and continuous derived invariants (SR.0d). SchemeAndStackFoundations §§1.1, 2.23 provide the finite descent input.

Work in the global residual-system setting.

([CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36.)

*Needs:* IG.7; IG.4.0b; IG.3; IG.0; SchemeAndStackFoundations §§1.1, 2.23; SmoothRepresentationsOfLocalGroups SR.0, SR.0d

### IG.7.5 Caraiani–Scholze vanishing

<a id="ig-7-caraiani-scholze-vanishing"></a>

Let `F` be a CM field containing an imaginary quadratic field with `F⁺ ≠ ℚ, G⁰` the quasi-split unitary group of signature `(n, n)` at each archimedean place, `K ⊂ G⁰(𝔸_f)` neat, `d = [F⁺:ℚ]n²`, and `𝔪 ⊂ 𝕋^{0,S}` a maximal ideal of the unitary algebra in the support of `H^*(X_K, 𝔽_ℓ)` such that (ii) `ρ̄_𝔪` has length at most `2` and (iii) there is a prime `p ≠ ℓ` splitting completely in `F` with `ρ̄_𝔪` unramified at all `v | p` and `α_{i,v} ≠ pα_{j,v}` for `i ≠ j`. Then `(1) H^i(X_K, 𝔽_ℓ)_𝔪 ≠ 0` implies `i ≥ d`, and `(2) H^i_c(X_K, 𝔽_ℓ)_𝔪 ≠ 0` implies `i ≤ d`. It is not asserted that ordinary and compactly supported cohomology are both concentrated in degree `d` (false in the reducible boundary case).

Work in the global residual-system setting. Assume also `𝔪` CS-generic ([IG.7.1](#ig-7-cs-generic-maximal-ideal)).

([CSnc](#ref-csnc), §1, Theorem 1.1, p. 5.)

*Needs:* IG.7; IG.5; ArithmeticLocallySymmetricSpaces ALS.5a.

### IG.7.6 Integral coefficients and local systems

<a id="ig-7-integral-and-local-system-versions"></a>

Under the hypotheses of [IG.7.5](#ig-7-caraiani-scholze-vanishing): `(1) H^i(X_K, ℤ_ℓ)_𝔪 = 0` for `i < d` and `H^i_c(X_K, ℤ_ℓ)_𝔪 = 0` for `i > d`; `(2) H^d(X_K, ℤ_ℓ)_𝔪` is torsion-free; `(3)` the sequence `0 → H^{d−1}(∂X_K, ℤ_ℓ)_𝔪 → H^d_c(X_K, ℤ_ℓ)_𝔪 → H^d(X_K, ℤ_ℓ)_𝔪 → H^d(∂X_K, ℤ_ℓ)_𝔪 → 0` is exact (`∂X_K` the Borel–Serre boundary); `(4)` the same hold for the local systems `V_λ` attached to algebraic representations with `ℤ_ℓ`-lattices (via Hochschild–Serre from a deeper `ℓ`-power level where `V_λ/ℓ^m` is trivial).

Work in the global residual-system setting. Assume also `𝔪` CS-generic.

([CSnc](#ref-csnc), §1, Remark 1.5, pp. 5–6.)

*Needs:* IG.7; ArithmeticLocallySymmetricSpaces ALS.4, ALS.6; ArithmeticGaloisDuality R02.4, D7.5

### IG.7.7 Irreducible middle-degree concentration

<a id="ig-7-irreducible-specialization"></a>

If moreover `ρ̄_𝔪` is absolutely irreducible (so `𝔪` is non-Eisenstein), then `H^i(∂X_K, 𝔽_ℓ)_𝔪 = 0` for all `i`, hence `H^i_c(X_K, 𝔽_ℓ)_𝔪 ≅ H^i(X_K, 𝔽_ℓ)_𝔪` vanish outside `i = d`; integrally, `H^i(X_K, ℤ_ℓ)_𝔪` is concentrated in degree `d` and torsion-free. This target owns the unitary non-Eisenstein boundary exclusion as well as its concentration consequence.

*Proof sketch.* Use the Borel–Serre stratification and the Hecke-equivariant Levi calculation of ALS.4.10–4.11. A proper parabolic has Levi `∏_i Res GL_{r_i} × U(n−s,n−s), s=Σr_i>0`. Its unipotent cohomology is a finite local system; kill its finite monodromy at a normal finite level and use derived invariants to preserve the support assertion. Künneth then reduces an occurring boundary eigencharacter to occurring systems on these factors. Supply their actual residual representations by IG.6.6a and IG.6.6b. With `s_i=r₁+⋯+r_i` and geometric `ε(Frob)=q⁻¹`, its ambient residual representation has semisimplification

```text
⊕_i ((ρ_i ⊗ ε^{s_i−2n}) ⊕ (ρ_i^{c,∨} ⊗ ε^{1−s_i})) ⊕ (ρ_0 ⊗ ε^{−s}).
```

The final summand is omitted when `s=n`. Check the identity by the full unnormalized Satake transform on each split factor; Chebotarev identifies it with `ρ̄_𝔪`. At least the two positive-dimensional summands for one `GL` factor occur, so it cannot be absolutely irreducible. A finite filtration by boundary strata gives total boundary vanishing. Combine with IG.7.5, duality and the finite-level integral argument of IG.7.6. This is different from ALS.4.13's Siegel-only boundary theorem for a `GL_n` non-Eisenstein ideal pulled back to the unitary algebra: that pulled-back unitary system is generally reducible.

Work in the global residual-system setting. Assume also `𝔪` CS-generic and `ρ̄_𝔪` absolutely irreducible.

([CSnc](#ref-csnc), §1, Remark 1.6, p. 6; [acc23](#ref-acc23-published), Theorem 2.4.2 and its Levi/Galois calculation, published pp.941–946 (author PDF pp.45–50), using Theorems 2.3.5 and 2.3.8, pp.937–940.)

*Needs:* IG.7; IG.6.6a–IG.6.6b; ArithmeticLocallySymmetricSpaces ALS.4.10–ALS.4.11.

**Checks.**

- For `n=1` the proper Levi is `GL₁` and the two summands are `ρ₁ε⁻¹` and `ρ₁^{c,∨}`; both have dimension one.
- For `n=2, r₁=1`, the `GL` exponents are `1−4=−3` and `1−1=0`, the dimensions are `1+1+2=4`, and the remaining unitary factor has exponent `−1`. Omitting that factor loses degree two.
- For the Siegel Levi `s=n` there is no residual `U(0,0)` representation to add, and the two `GL` blocks already have total dimension `2n`.
- Reducible length-two systems can occur on the boundary and are not excluded by this proof. Absolute irreducibility is essential.

### IG.7.8 The ACC+ middle-degree export

<a id="ig-7-acc-middle-degree-export"></a>

Assume `[F⁺:ℚ] > 1, F` contains an imaginary quadratic field, and the set `S` satisfies: for every finite place `v ∉ S` of residue characteristic `l`, either `S` contains no `l`-adic place and `l` is unramified in `F`, or `l` splits in an imaginary quadratic subfield of `F`. Let `𝔪̃ ⊂ 𝕋̃^S(K̃, λ̃)` be a maximal ideal of the Hecke algebra of the quasi-split unitary group `G̃` in `2n` variables acting on cohomology with coefficients `V_λ̃` (an `O`-lattice in an algebraic representation, `O` the ring of integers of a finite extension of `ℚ_p, p` the coefficient prime in ACC+ notation) such that `ρ̄_𝔪̃` has length at most `2` and is decomposed generic (ACC+ Definition 4.3.1). Then, with `d = n²[F⁺:ℚ], H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃` is injective and `H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(∂X̃_K̃, V_λ̃)_𝔪̃` is surjective. Renaming dictionary: ACC+'s coefficient prime `p` is `ℓ` here and its auxiliary prime `l` is `p` here.

The hypotheses are those stated (ACC+ §4.3); the level and ramification conditions on `S` are those of ACC+.

([acc23](#ref-acc23), Theorem 4.3.3, p. 77 (§4.3 'Cohomology in the middle degree'); proof pp. 77–78.)

*Needs:* IG.7; ArithmeticLocallySymmetricSpaces ALS.4.

### IG.7.9 Supercuspidal support and lifting for inner forms of `GL_n`

<a id="ig-7-minguez-secherre-lifting"></a>

Let `F/ℚ_p` be finite, `D` a central division algebra over `F, m ≥ 1, G = GL_m(D)` and `ℓ ≠ p`. Prove: `(1)` every irreducible smooth `𝔽̄_ℓ`-representation of `G` has a supercuspidal support, a pair `(M, σ)` of a Levi subgroup and an irreducible supercuspidal representation `σ` of `M(F)` such that `π` is a subquotient of the normalized parabolic induction of `σ`, and this pair is unique up to `G`-conjugacy; `(2)` every irreducible supercuspidal smooth `𝔽̄_ℓ`-representation `ρ` of `G` lifts: there is an integral irreducible cuspidal `ℚ̄_ℓ`-representation `ρ̃` of `G` whose reduction modulo `ℓ` is `ρ` (its semisimplified reduction is `[ρ]`). Statement `(2)` is about supercuspidal representations only: an irreducible cuspidal representation that is not supercuspidal need not have a lift with irreducible reduction, and no lifting of arbitrary irreducible representations is asserted.

The hypotheses are `ℓ ≠ p` and `D` a central division algebra over a finite extension `F` of `ℚ_p`; products of such groups are treated factor by factor.

([ms14a](#ref-ms14a), Théorème `A`, p. 3, for `(1)`; [ms14b](#ref-ms14b), Théorème 3.27, p. 35, with Remarque 3.28, p. 36, which removes the hypothesis on the maximal simple type, for `(2)`; both as used in [kos21](#ref-kos21), §2, Theorem 2.1, p. 4.)

The API: `supercuspidalSupport`, `supercuspidalSupport_unique`, `exists_supercuspidal_lift`.

*Needs:* SmoothRepresentationsOfLocalGroups SR.0 (smooth representations over `𝔽̄_ℓ` and `ℚ̄_ℓ`) and SR.2 (normalized parabolic induction and Jacquet functors); ReductiveGroupsPartII (Levi subgroups of inner forms of `GL_n`).

**Checks.**

- For `D = F` and `m = 1`, every irreducible representation of `F^×` is a character, is supercuspidal, and lifts by Teichmüller lifting of its values.
- For `GL_2(F)` with `q ≡ −1` modulo `ℓ`, the cuspidal non-supercuspidal subquotient of the reduction of a principal series is cuspidal but not supercuspidal, so statement `(2)` does not apply to it; its supercuspidal support is a pair of characters of the diagonal torus.
- In the same case `q ≡ −1` modulo `ℓ`, the cuspidal subquotient has cuspidal support (`GL_2`, itself) while its supercuspidal support lies on the torus and agrees with that of the other subquotients of the same principal series: cuspidal and supercuspidal supports differ, and only the latter is the invariant used here.

### IG.7.10 Parameter irrelevance for nonsplit inner forms

<a id="ig-7-koshikawa-parameter-irrelevance"></a>

Let `G=∏GL_{n_i}` over a finite extension `F/ℚ_p` with residue cardinal `q, b∈B(G)`, and associated `J_b` not quasi-split (an inner form of the Newton centralizer Levi). For every irreducible smooth `𝔽̄_ℓ`-representation `π` of `J_b(F), ℓ≠p`, its Fargues–Scholze semisimple parameter is not a generic unramified parameter of `G`: if it is unramified, the eigenvalues in some factor have `α_{j′}/α_j=q` for `j≠j′`. Apply the twisted Levi inclusion appropriate to `J_b` when viewing its parameter in `G`. The proof reduces to one factor `GL_n`, takes the supercuspidal support `(M, σ)` of `π`, lifts `σ` by the preceding target, and uses that the parameter of the lift factors through `GL_n(ℤ̄_ℓ)` and reduces to the parameter of `π`; a generic unramified parameter is a sum of characters with no ratio equal to the cyclotomic character, which cannot come from `M` when `M` has a factor `GL_m(D)` with `D ≠ F`.

The hypotheses are `G = ∏ GL_{n_i}` over `F, ℓ ≠ p`, and `J_b` not quasi-split.

([kos21](#ref-kos21), §§2–3, Theorem 2.1 and Lemma 3.1, pp.4–5; §3, Lemma 3.1, p.5.)

The API: `koshikawaParameterIrrelevance`.

*Needs:* IG.7 (supercuspidal support and lifting); IG.0 (`J_b` as an inner form of `M_b`); IG.F.21–IG.F.22a.

### IG.7.11 Koshikawa local vanishing

<a id="ig-7-koshikawa-local-vanishing"></a>

Let `F/ℚ_p` be finite with residue field `𝔽_q, (G, b, μ)` a local Shimura datum with `G = ∏_{i∈I} GL_{n_i}, K = ∏GL_{n_i}(O_F)` and `M_{(G,b,μ),K}` the local Shimura variety, `ℓ ≠ p`. Let `𝔪 ⊂ ℤ_ℓ[K\G(F)/K]` be a maximal ideal whose unramified `L`-parameter `ρ̄_𝔪` is generic (the eigenvalues of `ρ̄_𝔪(Frob_F)` in each `GL_{n_i}` satisfy `α_{j′}/α_j ≠ q` for `j ≠ j′`). If `J_b` is not quasi-split, then `H^i_c(M_{(G,b,μ),K}, 𝔽̄_ℓ)_𝔪 = 0` for every `i` (cohomology over the completed algebraic closure). This target has mod-`ℓ` coefficients.

*Proof sketch.* After adjoining `q^{1/2}`, the compactly supported cohomology is identified, up to shift and twist, with `i^{b*}T_μ(i_{1!} c-Ind_K^{G(F)} Λ)`, Hecke-equivariantly, and each `H^i_c` is a finitely generated smooth `J_b(F)`-representation (FS IX.3.1); localization at `𝔪` commutes with these functors. The spectral Bernstein centre acts on `c-Ind_K^{G(F)} Λ` through `End(c-Ind) = H_K^op`, and after composing with the inversion [KhK] `↦ [Kh⁻¹K]` of `H_K` this action is the one compatible with unramified parameters; on the `𝔪`-localization it factors through the localization of the spectral centre at the parameter of `𝔪`, and it commutes with excursion operators. Hence every irreducible subquotient `π` of the mod-`ℓ` localized cohomology has Fargues–Scholze parameter `ρ̄_𝔪`, which is generic, contradicting the parameter-irrelevance target; a nonzero smooth representation contains a nonzero cyclic subrepresentation, which has an irreducible quotient, so the mod-`ℓ` localized cohomology vanishes. This mod-`ℓ` statement is the input to the ordinary costalk–stalk comparison. There is no integral localized local-vanishing export: the cyclic smooth representation `ℤ_ℓ[t,t⁻¹]/(t−ℓ)` of `ℚ_p^×` is `ℚ_ℓ`, with `p` acting by `ℓ`. It is nonzero and `ℓ`-divisible, so its ordinary quotient modulo `ℓ` is zero. Finite generation as a smooth representation does not supply the completeness needed for Nakayama. This counterexample does not affect the finite-level global integral argument IG.7.6, whose modules are finite over `ℤ_ℓ`.

The hypotheses are `G` a product of `GL_{n_i}`, hyperspecial `K, ℓ ≠ p` and `ρ̄_𝔪` generic in Koshikawa's sense.

([kos21](#ref-kos21), Theorem 1.1, p. 1 (§1.1 'Local vanishing'); proof §4; §1.1, p. 1 (definition of 'generic' for the unramified `L`-parameter `ρ_m`); used globally in Conjecture 1.2, p. 2; §4, pp.5–6.)

The API: `koshikawaSpectralSatake` (mod-`ℓ` local vanishing), `koshikawaSpectralSatakeReduction` (compatibility of the spectral action with coefficient reduction, not an integral vanishing theorem).

**Checks.**

- For `GL₁` every `J_b` is quasi-split, so the nonsplit hypothesis is essential and the conclusion does not assert vanishing of all Lubin–Tate cohomology.
- For a nonsplit `GL₂` inner form, two equal nonzero eigenvalues at `q≠1` can be weakly generic; their distinctness is not required.
- If `q=1` in `𝔽_ℓ`, two equal eigenvalues fail genericity. If `ℓ=p`, neither the coefficient formalism nor this theorem applies.
- Multiplication by `ℓ` on the nonzero `ℚ_ℓ` module is surjective, with `x=ℓ·(x/ℓ)`. Its zero mod-`ℓ` quotient does not imply integral vanishing.

*Needs:* IG.7 (parameter irrelevance); IG.F.19–IG.F.20; IG.F.20–IG.F.22; SmoothRepresentationsOfLocalGroups SR.1 (the inversion of `H_K`).

### IG.7.12 The ordinary costalk lower bound

<a id="ig-7-koshikawa-ordinary-costalk-bound"></a>

For the quasi-split unitary datum, `p` completely split, `ℓ≠p`, put `F=Rπ°_{HT,*}𝔽_ℓ` and let `i₀:Fℓ(ℚ_p)→Fℓ_C` be the closed ordinary locus. Then `RΓ_{Fℓ(ℚ_p)}(Fℓ_C,F)=RΓ_c(Fℓ(ℚ_p),Ri₀!F)` lies in `D^{≥d}(𝔽_ℓ)`. The same bound holds for `RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!F)` for the sufficiently small compact opens used at finite level. This is an unlocalized costalk bound, not a stalk bound.

([kos21](#ref-kos21), Corollary 8.2 and Lemma 8.3, pp.13–14.)

The API: `koshikawaOrdinaryCostalkBound`.

*Needs:* IG.4, specifically IG.4.0d (supported derived-limit comparison), IG.4.0b–IG.4.0c (uniform bounds and descent); SchemeAndStackFoundations §§1.1, 2.23; SmoothRepresentationsOfLocalGroups SR.0, SR.0d; EtaleCohomologyFoundations §`F`.8; EtaleDualityAndPerverseSheaves §2.11; LefschetzPencilsAndVanishingCycles LPV.6; DiamondSixOperations S3.

### IG.7.13 Ordinary costalk–stalk comparison

<a id="ig-7-koshikawa-ordinary-costalk-stalk"></a>

With `F=Rπ°_{HT,*}𝔽_ℓ` and `i₀` the closed ordinary locus, let `𝔪_p` be a maximal ideal of the local spherical `ℤ_ℓ` Hecke algebra at `p` with generic unramified parameter. The natural map `RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!F)_{𝔪_p}→RΓ_c([Fℓ(ℚ_p)/K_p],i₀^*F)_{𝔪_p}` is an isomorphism. Localization is at `p` only. No away-`p` minimal-stratum theorem or Pink formula is used.

For this balanced unitary datum the split `p`-adic factors have Hodge slopes `0` and `−1`. Write a Newton slope in lowest terms with denominator `h`; its centralizer factor is `GL_r(D_h)`. If every `h=1` then all slopes are integers between `−1` and `0`, and the Kottwitz invariant forces exactly the ordinary multiplicities. Thus a nonordinary `b` has a non-quasi-split inner-form factor. This conclusion is specific to these split balanced `GL` factors; it is not exported for arbitrary `G`.

Use the finite Newton filtration on the flag variety, or the corresponding finite open of `Bun_G`. Smooth base change along the relative-dimension-`d` map `q_K` of IG.F.11 expresses each nonordinary correction to the displayed map as

`(Ri₀! i_{b!} V_b)^op ⊗^L_{C_c(J_{b₀},𝔽_ℓ)} RΓ_c(M_{b₀,K},𝔽_ℓ(d))_𝔪_p [2d]`,

where `V_b` is the bounded admissible `J_b`-complex supplied by the Igusa fibre and IG.F.13. Here `i_b` denotes the `Bun_G` stratum immersion, and the ordinary stratum `i₀` is interpreted on `Bun_G` after this base change. The Haar/coinvariant adapter is IG.F.14. Its dualizing line `κ⁻¹[−2d]` turns the first factor into the dual of the appropriate ordinary restriction of `D(i_{b!}V_b)`, with `κ` retained; reflexivity is IG.F.23. The local ordinary factor has central support at the chosen generic parameter. By IG.7.10 and the inner-form observation above, `V_b` has no generic unramified support. Duality transports its support by Cartan, which preserves that generic locus. IG.F.23's compatible central localizations therefore make the derived `Hom`, and hence the correction term, zero. The natural projectors act on the complexes before inverse limits or duals, so no unsupported assertion about arbitrary set-theoretically disjoint supports is needed. Induction over the finite Newton filtration gives the asserted isomorphism.

**Checks.**

- In the formal rank-zero control the flag is a point, `d=0` and the comparison is the identity; there are no nonordinary terms. For a split rank-one factor there is likewise no nonsplit inner form to exclude.
- In the balanced `n=1, GL₂` factor, the basic slopes `(−1/2,−1/2)` give the quaternion inner form, while the ordinary slopes `(0,−1)` give the split ordinary Levi. They are not interchanged.
- In that `GL₂` example `d=1`: the ordinary connected group contributes `(1)[2]`, while its `Bun` stratum has `κ⁻¹[−2]`. The opposite action and orientation are retained before coinvariants.
- At `q=1` a repeated pair is not generic, so the central exclusion cannot be invoked. At `ℓ=p` the entire coefficient argument is outside its hypotheses.
- This mod-`ℓ` comparison proves no integral local Nakayama statement. Global integral consequences use the finite-level coefficient bounds of IG.7.6.

([kos21](#ref-kos21), Proposition 1.7, p.3; proof §9, pp.14–16; Lemma 9.1, p.15.)

The API: `koshikawaOrdinaryCostalkStalk`.

*Needs:* IG.7; IG.3; IG.F.9–IG.F.14; IG.F.18–IG.F.23; SmoothRepresentationsOfLocalGroups SR.0d; IG.F.13–IG.F.14; DiamondSixOperations `S3, S4`

### IG.7.14 Koshikawa global vanishing

<a id="ig-7-koshikawa-generic-vanishing"></a>

Let `F` be a CM field, `B = F, V = F^{2n}` with the quasi-split unitary similitude group `G` (the datum of IG.0), `p` a prime splitting completely in `F, K_p` hyperspecial, `K = K_pK^p` sufficiently small, `d = dim S_K` and `ℓ ≠ p`. Let `𝔪_p ⊂ ℤ_ℓ[K_p\G(ℚ_p)/K_p]` be a maximal ideal of the local Hecke algebra at `p` whose unramified parameter `ρ̄_{𝔪_p}` is generic. Then `H^i(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0` only for `i ≥ d` and `H^i_c(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0` only for `i ≤ d`. In particular the conclusion of [IG.7.5](#ig-7-caraiani-scholze-vanishing) and of [IG.7.8](#ig-7-acc-middle-degree-export) holds without the hypotheses `[F⁺:ℚ] > 1` and "`ρ̄_𝔪` of length at most two" (Koshikawa Theorem 1.3; Caraiani–Newton Theorem 2.1.28).

Assume `p` completely split in `F`; `K_p` hyperspecial; `ρ̄_{𝔪_p}` generic `(α_{j′}/α_j ≠ q)`.

([kos21](#ref-kos21), Theorem 1.3, p. 2; proof §9, pp. 14–16; [cn23](#ref-cn23), Proof of Theorem 2.1.28, p. 25.)

*Needs:* IG.7; IG.3; IG.0.

### IG.7.15 The Caraiani–Newton middle-degree export

<a id="ig-7-middle-degree-without-length-hypothesis"></a>

Let `F` be an imaginary CM field containing an imaginary quadratic field, `T ⊇ S_p` a finite set of finite places with `T = T^c` such that every finite `v ∉ T` of residue characteristic `l` either has `T` free of `l`-adic places and `l` unramified in `F`, or `l` split in an imaginary quadratic subfield of `F`. Let `𝔪̃ ⊂ 𝕋̃^T(K̃, λ̃)` be a maximal ideal with `ρ̄_𝔪̃` decomposed generic (Caraiani–Newton Definition 2.1.27: some `ℓ ≠ p` splits completely in `F` with `ρ̄|_{G_{F_v}}` unramified and `α_i/α_j ≠ ℓ` for all `v | ℓ`), and `d = dim_ℂ X̃_K̃`. Then there are `𝕋̃^T`-equivariant maps `H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃` ↩ `H^d(X̃_K̃, V_λ̃)_𝔪̃` ↠ `H^d(∂X̃_K̃, V_λ̃)_𝔪̃`, the first injective and the second surjective.

The hypotheses are those stated; this is the form needed for `F⁺ = ℚ`.

([cn23](#ref-cn23), Theorem 2.1.28 and its proof, p. 25 (§2.1); Theorem 2.1.26, p. 24 (same hypotheses on `F` as Theorem 2.1.20, p. 22); setup §2.1.11, p. 15.)

*Needs:* IG.7; ArithmeticLocallySymmetricSpaces ALS.4.

### Examples

A two-dimensional residual representation `χ₁ ⊕ χ₂` with `χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p⁻¹}` at the places above a completely split `p` is Caraiani–Scholze generic and Eisenstein, so the vanishing theorem applies while the irreducible specialization does not, and ordinary and compactly supported cohomology need not both be concentrated in degree `d`. For imaginary quadratic `F (F⁺ = ℚ)` only Koshikawa's route applies; there, a generic unramified parameter at `p` kills the nonordinary local terms because their `J_b` is not quasi-split.

### Dependencies

Layers IG.0 and IG.3–IG.6; ArithmeticLocallySymmetricSpaces ALS.4–ALS.6; ArithmeticGaloisDuality R02.4, D7.5; TorsionCohomologyInfrastructure Layers `2, 3b, 4` (through IG.6.6a–IG.6.6b); AutomorphicGaloisRepresentationsPartII AG2.7; SchemeAndStackFoundations §§1.1, 2.23; EtaleCohomologyFoundations §`F`.8; EtaleDualityAndPerverseSheaves §2.11; LefschetzPencilsAndVanishingCycles LPV.6; DiamondSixOperations `S3, S4`; SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.1, SR.2; ReductiveGroupsPartII; and, for Koshikawa's route, IG.F.18–IG.F.23, IG.F.19–IG.F.20, IG.F.9–IG.F.14 and IG.F.13–IG.F.14.

## Downstream consumers

Downstream consumers include ModularityAndLanglandsExtensions (generic torsion concentration), CrystallineLocalGlobalCompatibilityCM (middle-degree eigensystems), and EllipticCurveModularityImaginaryQuadratic (the Caraiani–Newton export for imaginary quadratic `F`, with `F⁺ = ℚ`). The ACC+ middle-degree and integral vanishing forms also serve downstream potential automorphy applications. The rational trace inputs used here are independent of these concentration conclusions.

## References

Locators refer to the editions below. For CS17 the printed Annals page is the PDF page plus 648. For the other preprints, page numbers are the displayed preprint pages. Lan–Stroh's published and author copies have different pagination; each locator identifies the edition. The erratum to the compactification paper governs the componentwise lattice exponents. Results used only through the supplier contracts are stated in the generality of the roadmap that supplies them. Kottwitz (Isocrystals with additional structure, Compositio Math. 56, 1985), Rapoport–Richartz (Compositio Math. 103, 1996) and Rapoport–Zink (Period spaces for p-divisible groups, 1996) are cited through the recollections in CS17 §3.1 and §5.4.

<a id="ref-csnc"></a>

**csnc** — Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2). arXiv:1909.01898v2, 22 November 2023, 90 pages. CSnc denotes this edition, not the differently paginated Annals 199 (2024) typesetting.

<a id="ref-cs17"></a>

**cs17** — Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals of Mathematics 186 (2017), 649–766. CS17 denotes the published edition.

<a id="ref-oz02"></a>

**oz02** — Frans Oort, Thomas Zink, [Families of p-divisible groups with constant Newton polygon](https://emis.muni.cz/journals/DMJDMV/vol-07/09.pdf). Documenta Mathematica 7 (2002), 183–201.

<a id="ref-ham15"></a>

**ham15** — Paul Hamacher, [The geometry of Newton strata in the reduction modulo p of Shimura varieties of PEL type](https://arxiv.org/pdf/1312.0490v2). arXiv:1312.0490v2, 12 November 2014.

<a id="ref-lil21"></a>

**lil21** — Chao Li, Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Author version AIPF.pdf, 67 pages, 16 January 2022; the separately indicated published Lemma 7.3 is in Annals 194 (2021), pp. 859–860.

<a id="ref-man05"></a>

**man05** — Elena Mantovan, [On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf). Caltech author preprint, 30 pages; the publication is Duke Mathematical Journal 129 (2005), 573–610.

<a id="ref-lil22"></a>

**lil22** — Chao Li, Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II.](https://par.nsf.gov/servlets/purl/10338691). Forum of Mathematics, Pi 10 (2022), e5, pp. 1–71.

<a id="ref-shi09"></a>

**shi09** — Sug Woo Shin, [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf). Berkeley author preprint, 44 pages, 4 October 2008; publication in Duke Mathematical Journal 146 (2009), 509–568.

<a id="ref-ls18a"></a>

**ls18a** — Kai-Wen Lan, Benoît Stroh, [Compactifications of subschemes of integral models of Shimura varieties](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/E26A33D14B2E77C4962AE761F6403A1C/S2050509418000208a.pdf/compactifications-of-subschemes-of-integral-models-of-shimura-varieties.pdf). Forum of Mathematics, Sigma 6 (2018), e18, 105 pages. Corresponding author-copy locators are distinguished below.

<a id="ref-box15"></a>

**box15** — George Boxer, [Torsion in the coherent cohomology of Shimura varieties and Galois representations](https://arxiv.org/pdf/1507.05922v1). arXiv:1507.05922v1, 21 July 2015, doctoral dissertation.

<a id="ref-nie15"></a>

**nie15** — Sian Nie, [Fundamental elements of an affine Weyl group](https://arxiv.org/pdf/1310.2229v2). arXiv:1310.2229v2, 3 June 2014.

<a id="ref-ls18b"></a>

**ls18b** — Kai-Wen Lan, Benoît Stroh, [Nearby cycles of automorphic étale sheaves](https://web.archive.org/web/2024id_/https://www-users.cse.umn.edu/~kwlan/articles/nearby-aut.pdf). Author compilation incorporating errata, 4 April 2022, 42 pages; publication in Compositio Mathematica 154 (2018), 80–119.

<a id="ref-sw13"></a>

**sw13** — Peter Scholze, Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357v2). arXiv:1211.6357v2, 13 April 2013.

<a id="ref-kos21"></a>

**kos21** — Teruhisa Koshikawa, [On the generic part of the cohomology of local and global Shimura varieties](https://arxiv.org/pdf/2106.10602v1). arXiv:2106.10602v1, 20 June 2021. The quasi-split global vanishing theorem is Theorem 1.3; Theorem 1.4 is the anisotropic case.

<a id="ref-acc23"></a>

**acc23** — Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2). arXiv:1812.09999v2, 16 June 2022. ACC+ denotes this edition.

<a id="ref-ltxzz"></a>

**ltxzz** — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones Mathematicae 228 (2022), 107–375.

<a id="ref-cn23"></a>

**cn23** — Ana Caraiani, James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3, 27 March 2025.

<a id="ref-ls18a-author"></a>

**ls18a-author** — Kai-Wen Lan, Benoît Stroh, [Compactifications of subschemes of integral models of Shimura varieties (author copy)](https://www.kwlan.org/articles/cpt-sub.pdf). 84-page author copy, with the separately linked one-page erratum.

<a id="ref-ls18a-erratum"></a>

**ls18a-erratum** — Kai-Wen Lan, Benoît Stroh, [Errata for Compactifications of subschemes of integral models of Shimura varieties](https://www.kwlan.org/articles/cpt-sub-err.pdf). One-page author erratum; correction to §3.6.

<a id="ref-man08"></a>

**man08** — Elena Mantovan, [A compactification of Igusa varieties](https://www.its.caltech.edu/~mantovan/papers/Igusa.pdf). Caltech author copy, 24 pages; publication in Mathematische Annalen 340 (2008).

<a id="ref-ms14a"></a>

**ms14a** — Alberto Mínguez, Vincent Sécherre, [Représentations lisses modulo ℓ de GL_m(D)](https://arxiv.org/abs/1110.1467v2). arXiv:1110.1467v2; published in Duke Mathematical Journal 163 (2014), 795–887. Locators refer to the arXiv edition.

<a id="ref-ms14b"></a>

**ms14b** — Alberto Mínguez, Vincent Sécherre, [Types modulo ℓ pour les formes intérieures de GL_n sur un corps local non archimédien](https://arxiv.org/abs/1404.0804v1). arXiv:1404.0804v1, with an appendix by Vincent Sécherre and Shaun Stevens; published in Proceedings of the London Mathematical Society 109 (2014), 823–891. Locators refer to the arXiv edition.


<a id="ref-vw"></a>

**vw** — Eva Viehmann, Torsten Wedhorn, [Ekedahl–Oort and Newton strata for Shimura varieties of PEL type](https://arxiv.org/pdf/1011.3230v4). arXiv:1011.3230v4; locators use its numbered author-copy pages.

<a id="ref-rsz20"></a>

**rsz20** — Michael Rapoport, Brian Smithling, Wei Zhang, [Arithmetic diagonal cycles on unitary Shimura varieties](https://arxiv.org/pdf/1710.06962v6). arXiv:1710.06962v6, 26 April 2020; §4.3, pp.19–20.


<a id="ref-fs"></a>

**fs** — Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v1). arXiv:2102.13459v1, February 2021, 350 PDF pages. Locators use the printed page numbers, which agree with PDF page numbers in this edition.

<a id="ref-fargues"></a>

**fargues** — Laurent Fargues, [G-torseurs en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Gtorseurs.pdf). Author version dated 30 November 2020, 27 pages; §§5.2–5.4 give the tensor-period and descent arguments used here.

<a id="ref-hkw21"></a>

**hkw21** — David Hansen, Tasho Kaletha, Jared Weinstein, [On the Kottwitz conjecture for local shtuka spaces](https://www.math.uni-bonn.de/people/kaletha/fp.pdf). Author version dated 7 May 2021; locators refer to its displayed page numbers, not the later journal pagination.

<a id="ref-sw-berkeley"></a>

**sw-berkeley** — Peter Scholze, Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). 2020 edition, Lectures 23–24, pp.217–231. The finite-E curve and basic tower portions already owned by ET are imports; IG.F.19 owns the general local-shtuka extension.

<a id="ref-bh"></a>

**bh** — Bhargav Bhatt, David Hansen, [The six functors for Zariski-constructible sheaves in rigid geometry](https://arxiv.org/pdf/2101.09759v2). arXiv:2101.09759v2, September 2021; Theorem 4.2(8), pp.31–32.

<a id="ref-hs-relative"></a>

**hs-relative** — David Hansen, Peter Scholze, [Relative perversity](https://arxiv.org/pdf/2109.06766v2). arXiv:2109.06766v2, 7 October 2021; Theorem 4.1 and Corollary 4.2, pp.16–17, Lemma 6.3, p.28.

<a id="ref-sch15"></a>

**sch15** — Peter Scholze, [On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf). Annals of Mathematics 182 (2015), 945–1066; locators use published pages.

<a id="ref-acc23-published"></a>

**acc23-published** — The authors of ACC+ above, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113, author-hosted published edition. Locators at IG.6.6a–IG.6.6b and IG.7.7 use these printed pages, distinguished from the arXiv edition.
