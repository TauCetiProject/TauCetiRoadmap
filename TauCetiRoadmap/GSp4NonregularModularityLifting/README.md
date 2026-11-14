# Roadmap: minimal modularity lifting for GSp₄ in nonregular weight

**Summary.** Build ordinary symplectic modularity lifting in singular Siegel weights (a,2). Starting from integral cuspidal coherent sections, construct singular-weight Galois systems through regular weights, prove the two Fourier-doubling injections and the Klingen Taylor–Wiles comparison, and establish balance on the selected patching module. The end results are minimal R=T with positive cuspidal freeness, ordinary p-adic family lifting, and classical weight-two modularity from four higher-Hida multiplicity-one statements. Each implication retains its precise geometric, classification and patching hypotheses. The README is definitive; `Suggested.lean` states no target, because none of the end theorems is statable against the pinned libraries, and its docstring records which carrier each lacks.

## Scope and ownership

This roadmap owns the genus-two lifting application: residual data and levels, selected Hecke actions, singular specialization, corrected cuspidal doubling, level comparison, selected-module balance and the three distinct lifting endpoints.

Generic determinant reconstruction, action images, finite local quotients, factorial projectors, spin polynomials and full multipliers are stated by IntegralHeckeAndGaloisDeterminants §§1.1–1.7, 2.1–2.3 and Layers IHG.3a–IHG.4. Generic induction, Jacquet and Satake theory are stated by SmoothRepresentationsOfLocalGroups SR.2 and SR.4. This roadmap keeps their genus-two arithmetic specializations. The pinned library's generalized eigenspaces, idempotents, matrix groups, local-ring completions and continuous H¹ are imported at their native scope; none is reconstructed here.

Integral coherent complexes, duality, Hochschild–Serre, vanishing, boundary localization, Arthur exclusions and the characteristic-zero dimension equality are stated by AutomorphicBundlesPartII Layers 1–8. All four higher-Hida/Coleman chambers, the completed filtration and the singular classicality criterion are imported from PadicFamiliesPartII E6, S7 and F8. The general analytic Bruhat coefficients belong to OverconvergentAutomorphicForms §§8.6–8.7. §1.1 owns the normalized genus-two H⁰ p-actions, §3.1 owns Hasse lifts and torsion congruences, §3.2 owns secondary Hasse geometry, and §4.2 owns the corrected theta construction and injectivity. Their general coherent-complex carriers remain with AutomorphicBundlesPartII. The selected all-degree p-action extension is the normalized integral p-action contract asked of that roadmap. The regular Galois construction belongs to AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5–AG2.6; §3.5 assembles its selected integral images. The all-degree characteristic-zero interpolation of coherent eigensystems (§2.3) is stated here; ModularityAndLanglandsExtensions §0.4 records only the expected p-adic Hodge properties of its output and constructs nothing. The residual realization of CG Lemma 6.9 with its symplectic pairing is ModularityAndLanglandsExtensions §3.30, and analytic continuation of crystalline periods in families is AutomorphicGaloisRepresentations §0.4; §§3.4 and 2.4 apply them. Frobenius-annihilation isotypy belongs to ArithmeticGaloisRepresentations §7.6, and solvable GSp₄ descent to EndoscopicTransferAndUnitaryTraceComparison §13.2.

The arbitrary-rank dyadic definite-unitary ordinary Hecke algebra and Hida theory, the ordinary global problem and its dimension bound, finiteness and reduced R=T are stated by OrdinaryAutomorphicFormsAndModularityLiftingPartII §§2.1–2.2, 3.1–3.2 and 4.7–4.8; its §§5.4–5.6 and 6.3–6.4 state the seed-selected symplectic ordinary reduced R=T and finiteness for p>2. Near adequacy is its §1.3 and GSp₄-reasonableness its §5.2; strong residual oddness at a real place is PotentialAutomorphyInfrastructurePartII PL.4, and tidiness is ArithmeticGaloisRepresentations §7.11. §11.4 applies these interfaces to the component through the singular point. The rank-two odd-characteristic tower of PotentialModularityAndCompatibleSystems §8.3 is an input to that supplier, rather than a construction here. The six-point even-subset symplectic model and the identification S₆≅Sp₄(𝔽₂) are AbelianSchemesAndArithmeticModuli A3.12; §8.4 uses them in an illustration only. General local deformation and image theories remain with LocalGaloisDeformationRings and ArithmeticGaloisRepresentations, through the exact extensions below. Patching algebra is DeformationAndDerivedPatchingAlgebra §§5.5–5.8; Layer 8, Layer 9 and Layer 10 verify three different arithmetic applications.

## Conventions

Let E/ℚₚ be finite, O its integers, ϖ a uniformizer and k its finite residue field; enlarge E to contain the indicated roots and characters. O/ϖᵐ, E/O and characteristic-zero fibers are distinct coefficient objects; a closed arithmetic fiber is a vector space over its residue field E′=κ(q′), finite over E. An eigenform or eigenclass witnessing occurrence is nonzero. A coherent section is cuspidal when it belongs to the subcanonical coefficient ω(μ)(−D), where X is the supplied toroidal compactification and D its boundary. The notation XΔ(Q) uses the intermediate cover for a quotient Δ of the full diamond group. A superscript “selected” always denotes the simultaneous residual-root summand of two commuting p-actions: the summand on which both T−c and Q−d act topologically nilpotently (§1.2). For the Weil–Deligne convention, geometric Frobenius has norm q⁻¹: with r(F)=diag(1,q) and N=E₁₂ one has r(F)Nr(F)⁻¹=q⁻¹N, giving N/3 at q=3. All geometric constructions are functorial for the specified levels and coefficient maps; thresholds for positive twists may depend on the finite list of levels.

Use geometric Frobenius and ε of Hodge–Tate weight −1, with ε(Frobℓ)=ℓ⁻¹ at ℓ≠p. Local reciprocity sends a uniformizer to geometric Frobenius. CG weights (a,2) have multiplier ε^(1−a) and Hodge–Tate multiset 0,0,a−1,a−1. The BCGP arithmetic weight-two representation has multiplier ε⁻¹; its coherent dual-spin normalization is ρf=ρπ∨ε⁻³. The P12 list iκ=(0,2−k₂,1−k₁,3−k₁−k₂) gives the automorphic cyclotomic exponents in P12 §3.2, so in this Hodge–Tate convention its automorphic Hodge–Tate weights are −iκ. P12 Definition 5.3 instead prescribes deformation characters λr|Ip=ε^(−ir); this opposite sign, as well as its flag-ratio direction, is included in the flag-orientation contract. For κ=(2,2), the automorphic exponents 0,0,−1,−1 give weights 0,0,1,1, while the printed deformation prescription gives exponents 0,0,1,1. No comparison of these prescriptions is assumed without the supplier dictionary (P12 line 639, line 665 and line 987). Full multipliers are carried independently of their determinant squares, including at trace zero.

Write Ω(k,r)=ω(k+r,r), with k≥0 and integral r. Pilloni's infinity parameter is (1−k−r,2−r;k+2r). The bundle is Symᵏ of the rank-two Hodge bundle tensored by detʳ, so negative determinant powers mean dual line bundles, not natural-number subtraction. Weights and cyclotomic exponents are integers. Fourier indices are symmetric matrices Q=[[m,r/2],[r/2,n]], with binary discriminant d(Q)=r²−4mn=−4det(Q); p is odd wherever the half-integral convention is used.

The CG branch requires p≥5, a=2 or 4≤a<p−1, the CG image conditions and the explicit selected-balance and Fourier obligations. Oddness and the full multiplier imply a even; a numerical inequality alone does not supply oddness. Weight (2,2) keeps the uniform coherent H² hypothesis. The P12 branch has its own image, well-ramified and ordered-flag hypotheses. The characteristic-zero BCGP branch allows p=2 and uses integral enormousness and two diamond-torus directions per prime.

For polynomial notation, distinguish the CG monic polynomial det(X−ρ(Frobℓ)) from the reciprocal P20/PS16 polynomial det(1−Xρ(Frobℓ)); their coefficient reversal is part of the spin dictionary. For two eigenvalues 2,3 these are X²−5X+6 and 1−5X+6X², respectively. A coefficient exponent m≥1 is displayed in O/ϖᵐ; an untruncated localized ring uses the separately specified maximal ideal 𝔪, even when a source writes it as a subscript m.

**Normalization checks.** At a=2 and ℓ=3, ε(Frob₃)=1/3 while ε⁻¹(Frob₃)=3, and det ρ(Frob₃)=9. At Ω(0,2), the Pilloni parameter is (−1,0;4); it is not the BCGP parameter (1,1;2) without the separate dictionary. As a formal substitution in the dual-spin dictionary, at w=0 and trivial smooth torus character the p-character exponents are −1,−1,−2,−2, and the corresponding Sen values of the completed four-piece filtration are −1,−1,−2,−2. With Q=diag(1,1) at p=7, d(Q)=−4≡3 is nonsquare, whereas det(Q)=1 is square. The formal trivial-character substitution is not an occurrence assertion: its nonunit uniformizer values need the actual eigenform’s smooth-character normalization to produce a continuous Galois character. These witnesses fix the signs used in the layers and in the supplier comparisons (CG20 pp.812–816, 833–834, 859; P12 p.36; P20 §5.3; BCGP25 §§1.8.12, 4.12).

**Premises carried by the end theorems.** The CG minimal R=T implications use the actual cuspidal selected modules at every auxiliary level and coefficient quotient, the all-index Fourier annihilation and scalar kernel vanishing of Layer 4, and the selected defect inequality of §7.4. The last requires a compatible integral p-idempotent and a rank comparison on that same summand; balance of the full module is insufficient. In weight (2,2) the uniform H² vanishing on X₀(Q) and X₁(Q) is a separate premise. For 4≤a<p−1 the imported small-weight theorem supplies that premise at all the required levels.

The P12 ordinary-family implications retain the strong-ordinary flag/Ext comparison, well-ramified local conditions and horizontal control. They yield ordinary p-adic cusp forms at integral weights; a classicality conclusion requires its own analytic and geometric hypotheses. The BCGP implications retain the marked characteristic-zero patching comparisons of §10.7, all hypotheses of one complete seed alternative, the support contracts from OrdinaryAutomorphicFormsAndModularityLiftingPartII §§4.7–4.8 at p=2 and §§6.3–6.4 at p>2 and the four independent multiplicity equalities. They use the exact singular Sen/Cousin comparison and classification of packets in the supplied classicality theorem. No equality of all reduced global deformation components is required to conclude rank one on the component through q.

Every classification-dependent assertion is an implication from the specified inputs on packets, multiplicities and twisted weighted stabilization. The local adjoint-L assertion for generic packets is an additional local input to the monodromy theorem, rather than a global analytic nonvanishing assumption (BCGP25 Remark 1.8.20, p.14; BCGP25 line 680).

## Exact supplier contracts

### From Mathlib

At the pins, `ZMod` in `Mathlib/Data/ZMod/Defs.lean` supplies residue examples; `Module.End.genEigenspace` and `Module.End.mem_genEigenspace_nat` in `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` supply kernels of powers and their increasing union; `IsIdempotentElem` in `Mathlib/Algebra/Group/Idempotent.lean` is the equation e²=e. No semisimple decomposition is part of the generalized-eigenspace definition.

### From Tau Ceti

`TauCeti.ContCohomology.H1` in `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean` is the continuous cocycle quotient for a continuously acting topological additive group. It supplies the low-degree additive carrier, with its action and continuity hypotheses; its inherited pointwise quotient topology is not asserted to be the discrete arithmetic-cohomology topology; global Selmer conditions, finite-generation and symplectic deformation numerology are supplier contracts rather than consequences of that abbreviation. `Suggested.lean` declares nothing and imports no Tau Ceti module.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

A3.12, “Differences of Weierstrass points in genus two”: the even-cardinality subsets of a six-element set modulo the full set, with the pairing (−1)^|{i,j}∩{k,l}| on two-element classes, as a four-dimensional 𝔽₂-symplectic space on which S₆ acts through S₆≅Sp₄(𝔽₂). A4.3, “First de Rham cohomology”: the relative H¹_dR of an abelian scheme with its Hodge filtration and, over a base smooth over a field, the integrable Gauss–Manin connection with Griffiths transversality.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§§7.3–7.5, 7.9–7.12; §7.6, whose semisimplicity criteria are used. Use continuous symplectic representations with their full multiplier, residual coefficient change, the CG big-image condition, tidiness of a GSp₄ residual image for p≥3 (§7.11, BCGP21 Definition 7.5.11, used in seed alternative B of this roadmap's §11.2), and the two Frobenius-annihilation semisimplicity criteria of BCGP25 Propositions 4.11.1–4.11.2. The latter concern annihilation of the action on a finite-dimensional nonzero representation, rather than equality of characteristic polynomials of semisimplifications. Its §5.11 supplies the passage from a density-one Frobenius set to all group elements.

What ArithmeticGaloisRepresentations must provide (the integral-enormousness contract): Provide BCGP25 integral enormousness (Definition 7.1.1) with its exact adjoint condition, coefficient field and restriction behavior, without identifying it with CG big image or ACC enormousness.

What ArithmeticGaloisRepresentations must provide (the Weil-restriction big-image contract): For an imaginary quadratic K and a non-CM elliptic curve E/K not isogenous over the algebraic closure to its conjugate, prove that the dual mod-p representations of E and its conjugate map the cyclotomic kernel onto SL₂(𝔽_p)² for all sufficiently large p, supplying the induced CG big-image example.

### From TauCetiRoadmap.AutomorphicBundles

Layers 5, 10, 11 and 12, in particular §§10.4 and 10.7–10.8; that roadmap's own letter labels B3, B3.HT, B4 and B5 read Layer 5, Layer 10, Layer 11 and Layer 12. Use canonical and subcanonical automorphic coefficients, the boundary divisor, genus-two Schur weights, classical section comparison, geometric H⁰ Hecke correspondences and the coefficient-valued expansion principle. In the characteristic-zero interpolation route use its full-level Siegel minimal tower and period map (§10.4), the rational Hodge–Tate Levi torsor (§10.7) and the finite-level cohomology of algebraic coefficients (§10.8).

### From TauCetiRoadmap.AutomorphicBundlesPartII

Layers 1–5; Layers 6–8. Use coherent homology and finite-coefficient Serre duality from Layer 1, equivariant perfect models and homological deck descent from Layer 2, proper cohomological correspondences from Layer 3, the arithmetic normalization, the sheaf-level integral divisibility with its unique division and the geometric spin-polynomial dictionary of §§4.1–4.3, and small-weight and large-parallel-twist vanishing from Layer 5. The threshold in “Large parallel twists and reduction of sections” depends on the specified finite collection of levels. Layers 6–8 supply interior comparison, localized boundary vanishing over ℚ, the Arthur-type exclusions and the multiplicity-counted equality dim H¹=dim H⁰, under their hypotheses on packets and classification. 

What AutomorphicBundlesPartII must provide (the normalized integral p-action contract): Construct normalized integral Siegel p-operators Tp,1 and Qp,2 on RΓ(X₁(Q),ω(a,2)(−D)) in degrees zero and one for the CG weights and coefficients O/ϖᵐ, O and E/O, agreeing in degree zero with the q-expansion operators of CG20 §8.4, with commuting idempotents compatible with coefficient change, Serre duality and deck descent.

What AutomorphicBundlesPartII must provide (the selected rank-inequality contract): For neat prime-to-p genus-two levels X₀(Q) over ℚ, non-Eisenstein m, a≥2 and L=ω(1,3−a), prove dim_E eαβH₁(X₀(Q),L)_(m,E)≤dim_E eαβH₀(X₀(Q),L)_(m,E), under the all-weight classification of packets and multiplicity hypotheses of Layers 6–8 and the normalized degree-one p-action, grouping the multiplicity-counted summands by finite part with the Serre-dual transported projector.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

AG2.P, “GSp₄ construction and normalization”; AG2.5; AG2.6, “GSp₄ crystalline Hodge comparison” and “Ordinary GSp₄ triangular shape”. Use the regular cuspidal spin realization, including the full multiplier, crystalline Frobenius polynomial at spherical p, and the ordered ordinary shape of CG20 Proposition 6.8; the crystalline comparison of AG2.6 is stated for good p-level and regular weight (a,b) with a≥b≥3. Use semisimplified ramified local comparison and the pure monodromy upgrade; retain every normalizing twist and classification premise. Family continuation of crystalline periods is not part of this contract; it is AutomorphicGaloisRepresentations §0.4.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

§0.4, “Crystalline periods in families”. Use Kisin’s analytic continuation of crystalline periods for a finite free continuous representation over a reduced Tate algebra, with its smallness, Sen-polynomial, invertibility and injectivity hypotheses, in the `G_{F_v}` version with `φ^{f_v}` for a finite extension F_v/ℚ_p, retaining Q(0) as a nonzerodivisor on the family.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Layer AL.4, local correspondence and local factors. Use the Weil–Deligne/Satake dictionary and the adjoint local L-factor normalization.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

§0.4 records, as a proposition and not a theorem, the expected de Rham and crystalline behaviour of the singular-weight coherent Galois representations of this roadmap's §2.3; §§3.2, 3.9 and 3.26 supply the classification and interpolation interfaces used below; §3.30, “The symplectic pairing through unitary descent”, supplies for weights (a,b) with a≥b≥2 and a non-Eisenstein maximal ideal of the anemic Hecke image the semisimple residual representation of CG Lemma 6.9 and, when it is absolutely irreducible, its nondegenerate alternating pairing, under its classification, unitary-descent, coefficient and polarization hypotheses; §3.5(vii) supplies the equivalence between existence of generic members in local GSp₄ packets and holomorphy at s=1 of its adjoint L-factor. The pure-monodromy uniqueness comparison is the separate SmoothRepresentationsOfLocalGroups contract. With the “GSp4ClassificationInputs” contract, use the classification of GSp₄ packets and multiplicity bookkeeping with its full real-group components, central character and transfer normalization; retain the specified twisted weighted fundamental-lemma/stabilization hypothesis wherever that source route assumes it, since unitary classification alone does not establish the GSp₄ input.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§§3.1–3.3, 5.1–5.9, 6.1–6.7 and 7.6–7.10. Use the Tor defect and balanced-module theorem of §5.5 for the CG branch, the equal-variable free-module criterion of §5.6 for the Pilloni branch, and corrected characteristic-zero patching of §5.8 for the higher-Hida branch. The last retains cofinal open cutoffs, actual ring actions, the uniform cotangent bound, marked coefficient sections and all three image comparisons; it supplies surjectivity of point completions before Noetherianity of the target completion is inferred. Sections 3.1–3.3 provide depth, Auslander–Buchsbaum and projective-to-free comparison; Layer 6 provides component support under its faithfulness hypotheses. Section 5.9 supplies projective finite-group norm/invariant/coinvariant comparison without division by the group order. The present roadmap verifies the arithmetic hypotheses of these three distinct patching applications.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§13.2, “Automorphic inputs to GSp₄ solvable descent”; §11.1. Use BCGP25 Proposition 7.5.3 with its full multiplier ε⁻¹, central character |·|², restriction irreducibility and Tate twist. A regular |·|²-self-dual cuspidal GL₄/ℚ representation is symplectic; an irreducible realization after solvable Galois CM base change as rπ⊗ε, or after solvable totally real base change as a GSp₄ representation, descends to a regular cuspidal GSp₄/ℚ representation. Keep the cyclic-descent character ambiguity until the given Galois representation fixes it.

### From TauCetiRoadmap.GlobalGaloisDeformations

R04.3–R04.6 and Layer G7. Use universal fixed-full-multiplier symplectic deformation rings, their classifying maps, the exact CG Selmer presentation and labelled Taylor–Wiles sets. The CG cardinality equals its dual Selmer dimension and each prime has the requested depth x≡1 modulo pᴺ. A rank-one Klingen diamond and the two torus directions of the characteristic-zero branch are different deformation data.

What GlobalGaloisDeformations must provide (the CG Selmer-presentation contract): Supply the CG fixed-full-multiplier Selmer presentation with qTW≥1 and labelled Klingen Taylor–Wiles sets of cardinality qTW at every requested depth, under CG20 Assumptions 4.1–4.3.

What GlobalGaloisDeformations must provide (the torus Taylor–Wiles contract): Supply the BCGP25 two-torus-direction Taylor–Wiles sets and uniform marked cotangent bounds under integral enormousness, with the weight algebra and marked coefficient sections retained, including p=2.

What GlobalGaloisDeformations must provide (the variable-weight patching contract): Supply the P12 variable-weight ordinary minimal deformation problems with prescribed universal similitude and Taylor–Wiles presentations over the two-weight Borel and one-weight GL₂-parabolic algebras, with the specified ordered flags, tame types and augmentation maps.

### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

§§0.2–0.5 and 0.14–0.15. Use the finite-level and p-divisible Hodge–Tate maps, their linearization, isogeny functoriality and the ordinary-locus Hasse criterion. Actual rational Siegel period covers and coefficient sections are taken from AutomorphicBundles Layer 10, rather than inferred from a pointwise Hodge–Tate map.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§§0.7, 1.1–1.7, 2.1–2.3 and Layers IHG.3a–IHG.4. Use determinant reconstruction and all-characteristic GL coefficient descent/Carayol comparison from §1.5, finite action images and factorial idempotents from Layer 2, spin/dual-spin polynomials with the separate full multiplier from IHG.3a, Galois-type residual ideals from IHG.3b, and compatible continuous integral determinants from IHG.4. Its prescribed-multiplier symplectic descent in §1.5 assumes residue characteristic greater than two. Its §1.6 Cayley–Hamilton isotypy requires annihilation by the entire Cayley–Hamilton ideal; Frobenius-polynomial annihilation in this roadmap's §2.8 instead uses ArithmeticGaloisRepresentations §7.6.

What IntegralHeckeAndGaloisDeterminants must provide (the all-characteristic symplectic-descent contract): Extend symplectic_coefficient_descent to every residue characteristic by removing p>2, keeping the continuous smaller-ring representation with the same nondegenerate alternating form and full multiplier and the similitude conjugator congruent to 1 modulo the larger maximal ideal (BCGP25 Lemma 7.4.8).

**Checks for the all-characteristic symplectic-descent contract.**

- For S=R=𝔽₂ and the standard representation of Sp₄(𝔽₂), the generated matrix algebra has dimension 16 and the identity conjugator has multiplier 1.
- The trivial group on k⁴ generates only the one-dimensional scalar algebra, so residual absolute irreducibility fails.
- For R=k[ε]/(ε²), S=k, the antidiagonal alternating form J₁₄=J₂₃=1 and J₄₁=J₃₂=−1 satisfies CᵀJC=J for C=I+εE₁₄. If ρ=C⁻¹ρ₀C for a constant representation ρ₀, then CρC⁻¹=ρ₀, traces and multiplier descend, and C reduces to I.

What IntegralHeckeAndGaloisDeterminants must provide (the pseudocharacter-reconstruction contract): Reconstruct a continuous semisimple GSp₄-valued representation with its full multiplier from a continuous GSp₄ pseudocharacter over an algebraically closed characteristic-zero field, compatibly with affinoid specialization.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Section 2.7 supplies the residual U/P/H types; §2.25 supplies `GSp4.MinimalAt`, including Artinian nilpotent-orbit membership at U primes and reduction-injective P/H inertia. Section 6.14 supplies `GSp4.SiegelOrdinary`, its split unramified Lagrangian plane, zero (1,2),(3,4) entries, uniqueness and tangent space; §6.26 supplies its tangent dimension and finite-flat comparison. Use §2.17 for ordered distinct-root Taylor–Wiles scalar inertia. For the P12 ordered full-flag functor use §6.3 together with the flag-orientation contract. For the BCGP branch use §6.27 only for the odd-p B/P comparison and §6.29 for the all-p ordinary flag-incidence image with its arithmetic point criterion. Preserve the distinction between the split unramified plane, a full flag, the two Borel orderings and their P intersection. For the BCGP local points use §6.31, which rests on §6.29: at a p-distinguished pure ordinary characteristic-zero point of the flag-incidence image, with the chosen stabilization, the image ring is regular on a unique component of relative dimension sixteen, for every p including p=2. Away from p use §1.22 for regularity at pure points and §2.24 for constancy of the full type, hence of the conductor, between pure points on a common component that lie on no other component; apply §2.24 to the underlying rank-four representation, whose forgetful map carries an irreducible symplectic component into one rank-four component, the pure points being regular there by §1.22.

What LocalGaloisDeformationRings must provide (the flag-orientation contract): Compare P12 automorphic and deformation ordinarity on specified ordered flags and Ext conventions, resolving both the opposite ratio directions of P12 Definitions 3.2 and 5.3 and the exponent prescriptions iκ versus −iκ in P12 §3.2 and Definition 5.3, including the parabolic ratio of P12 §7.4, before transporting representability or Hida control.

### From TauCetiRoadmap.PadicFamiliesPartII

Layers E6, S7 and F8; K2 for the singular Klingen comparison. Use E6/four-pieces for the actual completed-to-coherent filtration, S7/sen-cousin and S7/de-rham-classicality for the singular Sen comparison and BCGP25 Theorem 4.12.4, and F8/four-modules through F8/central-character for the four integral modules, regular and Coleman control, duality, tame group-ring projectivity and partial central specialization. Keep its nonzero singular-overlap comparison and independent four-piece dimension balance as premises. The BCGP torus convention is obtained by the involution [t]↦[t⁻¹]; character evaluation and the algebraic twist are retained. This imports one four-chamber theory.

What PadicFamiliesPartII must provide (the horizontal-control contract): Supply the Borel two-weight and GL₂-parabolic one-weight ordinary Siegel Hida modules, their dual Iwasawa finiteness, arithmetic control and horizontal Λ[Δ]-freeness at the P12 tame levels and ordered flags.

### From TauCetiRoadmap.OverconvergentAutomorphicForms

§§8.6–8.7. Use the analytic Bruhat coefficient and distribution families, their full Weyl/root shifts, radius and coefficient maps, finite-character twists and the stated analytic/étale comparison. The hypotheses include actual finite-flat trivializing covers and finite unions of quasi-Stein opens. Rational local Banach projectivity supplies no integral finite-torus averaging.

### From TauCetiRoadmap.PadicHodgeTheory

§§3.2–3.6, 4.4 and 5.3–5.4. Use coefficient descent, duals, twists, de Rham/crystalline/semistable period functors and their Weil–Deligne comparison. A de Rham finite-dimensional representation has semisimple Sen operator in the stated arithmetic convention; an arbitrary completed representation is outside this assertion.

### From TauCetiRoadmap.ShimuraCompactifications

Layer 4, especially 4.2–4.3 and 4.9–4.10; Layer 7, especially 7.12 and 7.13–7.18. Use the logarithmic Kodaira–Spencer isomorphism Sym²E≅Ω¹(log D) of 7.12 on the neat smooth toroidal model, compatible fans, toroidal level maps, pullback and unnormalized trace, integral genus-two models, the Hodge line and its positivity. Smoothness is used only at the supplied good integral models; higher p-level compactifications carry their own hypotheses. Trace after a selected Klingen projector has the scalar computed in this roadmap's Layer 6, rather than the covering degree.

### From TauCetiRoadmap.ShimuraData

§§5.9–5.10 and 5.18, “Pilloni genus-two convention comparison”. Use the genus-two root/weight and Kostant dictionaries and the change between CG and Pilloni coordinates. This roadmap's §0.2 specializes these dictionaries to the singular bundles used in this roadmap.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.1.4, SR.2.1–SR.2.3, SR.4.1–SR.4.5. Use the positive Klingen Hecke algebra of SR.1.4 for the Klingen parahoric and its U-operators, normalized parabolic induction and Jacquet functors, invariant-vector interfaces, the spherical Satake transform and the GSp₄ spin-polynomial dictionary. The specialized Klingen/newvector and projective finite-group statements required below are separate contracts.

What SmoothRepresentationsOfLocalGroups must provide (the Steinberg eigenvalue contract): Compute the normalized GSp₄ Steinberg Ux,1 eigenvalue x^((j+k−6)/2) in weight (j,k), including finite unramified unit twists, in the Fourier-lattice normalization of CG20 Theorem 5.9.

What SmoothRepresentationsOfLocalGroups must provide (the Klingen level-comparison contract): Prove the Klingen no-newforms result and compute the spherical-to-labelled-refinement pullback/trace constant for the regular residual block in CG20 Theorem 7.3, including its congruence to 1 at x≡1 modulo p.

What SmoothRepresentationsOfLocalGroups must provide (the paramodular newvector contract): For an irreducible admissible generic GSp₄(ℚ_ℓ)-representation over an algebraically closed characteristic-zero coefficient field with unramified central character, prove that its paramodular fixed space at the Artin conductor of its local parameter is one-dimensional and vanishes at smaller levels, with the normalization used in BCGP25 Proposition 7.5.1.

**Checks for the paramodular newvector contract.**

- Every paramodular group K(ℓⁿ) contains the scalars zI₄ with z∈ℤ_ℓ^×. At ℓ=7, twist a generic unramified principal series of trivial central character by χ∘ν with χ tame and χ(3)=ζ₃; then 3I₄ acts by χ(9)=ζ₃²≠1, so every paramodular fixed space is zero. The unramified-central-character hypothesis excludes it.
- The application’s central character |·|² is trivial on ℤ_ℓ^×, so it satisfies the hypothesis.
- An unramified central character ω has an unramified square root χ over an algebraically closed field; ν takes K(ℓⁿ) into ℤ_ℓ^×, where χ is trivial, so twisting by χ⁻¹∘ν preserves every paramodular fixed space and gives central character ωχ⁻²=1, since ν(zI₄)=z². At the uniformizer, ω(ℓ)=2 and χ(ℓ)=√2 give 2·(√2)⁻²=1, whereas twisting by χ∘ν would give ω(ℓ)χ(ℓ)²=4, not 1. This reduces the contract to trivial central character.

What SmoothRepresentationsOfLocalGroups must provide (the refinement-line contract): Prove one-dimensionality of the selected ordinary p-refinement and neat-prime Iwahori refinement lines under the regularity and distinct-root hypotheses in the proof of BCGP25 Lemma 7.5.8, pp.176–177, especially p.177 (BCGP25 line 8119), invoking BCGP21 Propositions 2.4.24 and 2.4.26, pp.26–27.

What SmoothRepresentationsOfLocalGroups must provide (the pure-monodromy uniqueness contract): Prove the local uniqueness of monodromy with the given semisimplification under purity and the adjoint holomorphy condition, in the geometric-Frobenius convention of BCGP25 Remark 1.8.20.

What SmoothRepresentationsOfLocalGroups must provide (the projective Satake contract): Supply the regular residual GSp₄ Satake-block comparison of BCGP25 Lemmas 7.4.11–7.4.12 on projective finite-group modules, compatibly with the partial central condition and diamond augmentation, without dividing by 8.

### From TauCetiRoadmap.OrdinaryAutomorphicFormsAndModularityLiftingPartII

Sections 2.1–2.2 supply the universal ordinary Hecke algebra of a definite unitary group and its Hida theory and arithmetic control at p=2; §§3.1–3.2 supply the ordinary global problem with its ring `R^{T,ord}` and the dimension bound; §4.7 supplies finiteness of `R^{T,ord}` over Λ and §4.8 the dyadic reduced R=T (BCGP25 Theorem 5.7.14, pp.134–135; BCGP25 line 6088). Section 1.3 supplies near adequacy, a weakly adequate image with H¹(H,k)=0 and H¹(H,ad)=0 (BCGP25 Definition 5.3.3, p.120; BCGP25 line 5426). For n≥2 retain a CM field F with F/F⁺ unramified at finite places, splitting of places above 2 and below seed ramification, n[F⁺:ℚ] divisible by 4, an ordinary RACSDC residual seed, nearly adequate residual image containing a regular-semisimple element, and strong residual oddness when n is even. The finite set T consists of split places and contains those above 2 and below seed ramification. Finiteness over Λ=O[[T(2)]] requires no extra tame depth; the nilpotent-kernel Hecke comparison retains sufficiently deep level at T outside 2. The coefficient convention is f(gu)=u⁻¹f(g); use upper-Iwahori levels above 2 and the algebraic weight twist in arithmetic control.

What OrdinaryAutomorphicFormsAndModularityLiftingPartII must provide (the dyadic ordinary-support contract): Supply §§1.3, 2.1–2.2, 3.1–3.2 and 4.7–4.8 at p=2, including near adequacy, the arbitrary-rank definite-unitary ordinary Hecke algebra with Hida theory and arithmetic control, the ordinary global problem with its dimension bound, and the finiteness and sufficiently-deep-level reduced R=T of BCGP25 Theorem 5.7.14 under all six hypotheses.

Sections 5.4–5.6 supply ordinary GSp₄ seed data, the selected ordinary problems S₁ and `S_{1,π}` and the Galois representation over the GSp₄ Hida–Hecke algebra; §6.3 supplies the symplectic ordinary reduced R=T and §6.4 finiteness of `R_{S_{1,π}}` over the weight algebra (BCGP25 Hypothesis 6.3.1 and Theorem 6.3.4, pp.146–148; BCGP25 line 6628 and line 6694). Section 5.2 supplies GSp₄-reasonableness of a residual representation for p≥3, the notion of BCGP25 Proposition 7.5.10(B2) (p.177; BCGP25 line 8147). Retain p>2 split completely in F⁺, an ordinary cuspidal GSp₄ seed of central character |·|² in weight two or regular weight, reasonable and tidy residual image, compatible stabilizations and the unique seed component at each v|p. At tame R require trivial residual restriction, Iwahori seed vectors and q_v≡1 modulo p, strengthened to q_v≡1 modulo 9 at p=3. Use the neat auxiliary place supplied by tidiness and only the seed-selected local components, without imposing residual p-distinction.

What OrdinaryAutomorphicFormsAndModularityLiftingPartII must provide (the symplectic component-support contract): Supply §§5.2, 5.4–5.6 and 6.3–6.4, including GSp₄-reasonableness, the ordinary seed datum, the selected ordinary deformation problem and Hida–Hecke Galois representation, and the reduced R=T and finiteness of BCGP25 Theorem 6.3.4 on the seed-selected components under Hypothesis 6.3.1, retaining q_v≡1 modulo 9 when p=3.

**Checks for the regular ordinary imports.**

- At n=4 and [F⁺:ℚ]=1 the dyadic divisibility test gives 4≡0 modulo 4; n=2 gives 2 and fails it. These are numerical controls, not existence assertions for such CM fields.
- At u=diag(1,3) and n=2, the universal weight factor ∏u_i^(1−i) is 1/3; replacing it by 3 changes arithmetic specialization. For the contragredient coefficient rule, a one-dimensional coefficient action u↦3 gives f(gu)=f(g)/3, whereas u↦1 gives f(gu)=f(g).
- At p=2, n=2, [F⁺:ℚ]=2 and #T=3, the supplier’s polarized strict-conjugacy deformation complex with local classes µ_v has h⁰=0, hⁱ=0 for i≥4, h² equal to the dimension of its dual H¹ Selmer group, and h³=h⁰(F(S)/F⁺, ad r̄(1))=1 (OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.2; Tho17 Lemma 2.15, p.10; Tho17 line 433). At p=2, ad r̄(1)=ad r̄, and an element (B,b)j acts on ad r̄ by X↦−BXᵗB⁻¹, which fixes I₂ because −1=1; absolute irreducibility leaves only this scalar line. With q=5 Taylor–Wiles primes and h²=1, the Euler characteristic is χ=1−#T−q+[F⁺:ℚ]n(n−1)/2=1−3−5+2=−5, so h¹=h²−h³−χ=1−1+5=5, the supplier’s generator count g=q+#T−1−[F⁺:ℚ]n(n−1)/2=5; the value h³=0 would give 6 (Tho17, proof of Proposition 2.21, pp.14–15; Tho17 line 614). Transpose fixes I₂, but Tr(I₂I₂)=Tr(I₂)=1+1=0, so the scalar-class pairing is zero. For T the finite places of S, a scalar-derived class survives in the dual H¹ at every sufficiently deep Taylor–Wiles level; it contributes through H². BCGP25 states vanishing outside degrees 1 and 2, which omits this degree-three scalar invariant (BCGP25 §5.4, pp.122–123, and Lemma 5.5.3, p.125; BCGP25 line 5567 and line 5640).
- At p=3, q_v=7 passes modulo 3 but fails modulo 9; q_v=19 passes both tests.
- In E[x,y]/(xy), the origin lies on two components, so it cannot serve as the unique seed component even though it lies on x=0.
- A nontrivial 2-power tame character ψ reduces to 1 but has inertia eigenvalue ψ(σ)≠1; ψ⊕1^(n−1) fails unipotent ramification. Solvable preparation controls restrictions of original local lifts, rather than all lifts over the larger field.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

PL.4, “Strong residual oddness at a real place (p = 2)”. For a perfect field k of characteristic 2, even n and a polarized pair (ρ̄,µ̄) over a CM field F, extended to r̄:G_F⁺→𝒢_n(k), the pair is strongly residually odd at an infinite place v of F⁺ when r̄(c_v) is GL_n(k)-conjugate to (1_n,1)j rather than to (Ψ_n,1)j with Ψ_n antidiagonal (Tho17 Definition 3.3, p.16; BCGP25 Definition 5.2.1, p.117; BCGP25 line 5249). It is consumed with n=4 in seed alternative A of this roadmap's §11.2 and in the dyadic hypotheses of the OrdinaryAutomorphicFormsAndModularityLiftingPartII contract above.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Sections R07.1–R07.2 supply the multiplicative-connected filtration, invariant differentials and the BT₁ crystal/Hasse–Witt maps used in this roadmap's §3.2, with their exact finite-flat, constant-rank and Cartier-duality hypotheses. The secondary determinant section and its extension are targets here, and the reducedness hypothesis is retained wherever pointwise vanishing is promoted to a sheaf identity.

## How to read the build

Layer 0–Layer 1 fix the data, levels and selected actions. Layer 2 constructs characteristic-zero interpolation independently of minimal patching, using the imported family theory. Layer 3 constructs Hasse lifts and the secondary determinant section and provides regular finite-quotient systems; Layer 4 proves cuspidal doubling; Layer 5 assembles the singular Galois deformation. Layer 6 controls Klingen level, Layer 7 isolates the defect on the selected summand, and Layer 8 applies balanced patching. Layer 9 is the independent ordinary-family branch. Layer 10 proves local freeness with rank allowed to be zero; Layer 11 applies the supplied regular ordinary support, proves positive rank one in each chamber, and applies higher-Coleman classicality. A *Needs* line distinguishes statement carriers from the ingredients of the indicated proof route; another proof may replace that route without changing the statement.

## Layer 0: Conventions, residual data and tame levels

Fix the full multiplier and the weight/Frobenius dictionaries, the four-factor ordinary-root condition, the exact CG residual/local data and the q-enlarged minimal tame level. Specify symplectically labelled Klingen Taylor–Wiles refinements, including their product separation. Generic Galois and deformation objects are imported.

### 0.1 Nondegenerate ordinary roots

For a field k and α,β ∈ k, define the nondegenerate ordinary-root condition by (α²−1)(β²−1)(α−β)(α²β²−1) ≠ 0. In arithmetic uses α,β are specified units, not merely an unordered pair of roots. This is the CG20 condition; it is stronger than α≠β and is unrelated to the regular-semisimple condition at an auxiliary prime.

(CG20, Theorem 1.1(2), p.802; §4, pp.812–813; CG20 line 38.)

Define the product on the existing field carrier; derive the four nonvanishing factors using absence of zero divisors. Show invariance under exchanging the two roots and under injective field extension.

The construction has the following interfaces.

- Over a field the predicate is equivalent to α²≠1, β²≠1, α≠β, and α²β²≠1.
- Exchanging α and β preserves the predicate.
- An injective field map preserves and reflects the predicate.

**Checks.**

- In F₁₁, α=2 and β=3 satisfy the predicate: the product is 7.
- In F₁₁, 2 and 6 are distinct and neither square is 1, but their product is 1; reject them.
- In F₁₁, 1 and 3 are rejected although the roots are distinct.

Expose all four exclusions and preserve the distinction between units at p and four auxiliary eigenvalues.

*Needs:* Mathlib `ZMod`.

### 0.2 Weight and Frobenius dictionary

Use ε of Hodge–Tate weight −1 and geometric Frobenius throughout the CG branch. Its bundle ω(a,b) is the supplied rank-two Hodge bundle representation Sym^(a−b)⊗det^b. Pilloni’s Ω(k,r) is ω(k+r,r), with infinity parameter λ=(1−k−r,2−r;k+2r). In BCGP25, scalar weight two corresponds to λ=(1,1;2) and central character |·|²; its overconvergent Galois convention is dual-spin ρπ∨ε⁻³. Import the good-prime spin/dual-spin and full multiplier conversion from the IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b, preserving every central operator.

(P20, §5.3, author pp.24–25; CG20 Remarks 5.10–5.11, pp.833–834; BCGP25 §1.8.12, p.12, Definition 1.8.16, p.13 and Lemma 4.12.1, p.112; P20 line 1086.)

Compute the highest weight of the Hodge bundle representation and compare each infinity-parameter convention. Use the upstream dual/twist and full multiplier identities rather than rediscover the spin polynomial. Keep the correction to the first infinity-coordinate sign explicit.

**Checks.**

- For k=0,r=2, Ω(0,2)=ω(2,2) and λ=(−1,0;4); for k=2,r=2, Ω(2,2)=ω(4,2) and λ=(−3,0;6). The opposite first-coordinate sign fails both substitutions.
- At a=2, ε⁻¹ has geometric-Frobenius value ℓ and Hodge–Tate weight 1; ε has value ℓ⁻¹ and weight −1.
- Multipliers 1 and −1 have the same square in odd characteristic; determinant data alone cannot fix the central character.

Test Ω(0,2)=ω(2,2) and its λ=(−1,0;4) in the Pilloni convention; it is not literally BCGP’s λ without its separate normalization. Record the precise conversion on polynomials and the full central character, even at trace zero.

*Needs:* IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; AutomorphicBundles Layer 11; ShimuraData §§5.9–5.10, 5.18; PadicFamiliesPartII E6/four-pieces and F8

### 0.3 Nonregular lifting data

A CG lifting datum consists of an odd prime p≥5, a finite extension E/Qp with integers O, uniformizer ϖ and residue field k; an integer a with a=2 or 4≤a<p−1; a continuous absolutely irreducible odd residual representation r̄:GQ→GSp₄(k) with multiplier ε̄^(1−a); chosen nondegenerate roots α,β; and a local basis at p with diagonal λ(α),λ(β),ε̄^(1−a)λ(β⁻¹),ε̄^(1−a)λ(α⁻¹), zero (1,2) and (3,4) entries and an unramified isotropic two-plane. It also records CG20 Assumptions 4.1–4.3, the minimal local deformation conditions and a chosen nonzero cuspidal residual eigensystem. The generic deformation functors, representations and pairings are supplied objects, not new definitions here.

(CG20, §4, Assumptions 4.1–4.3 and Definition 4.6, pp.812–816; Definition 6.15, p.844; CG20 line 519.)

Use the supplier representation, pairing and deformation objects and impose this particular conjunction of conditions. Keep three image conditions separate: Q(ad⁰r̄) excludes ζp; for every m there is σ∈GQ(ζpᵐ) with four distinct roots and eigenvalue 1 on each irreducible adjoint constituent; the images of ad⁰r̄ and ad⁰r̄(1) have no quotient of order p. Record away-p types U₁,U₂,U₃ by unipotent monodromy ranks 1,2,3; P by two isotropic inertia-character planes with x−1 prime to p; H by absolutely irreducible inertia with x⁴−1 prime to p. Under the fixed cyclotomic multiplier the P case is empty. The local minimal functor fixes the full multiplier, preserves those inertia conditions and, at p, has the split unramified two-plane with characters lifting the specified roots, as in Definition 4.6. Representability remains a supplier obligation.

The construction has the following interfaces.

- Extract the specified residual local matrix, pairing and ordered roots.
- Return the supplied fixed-multiplier minimal functor with the exact U/P/H conditions.
- Extend coefficients and transport the basis, pairing and root labels without changing local types.

**Checks.**

- For p=7, a=4 passes the weight range while a=6 fails the strict bound.
- Over A=𝔽₇[η]/(η²), put N₀=E₂₃ and N=N₀+η(E₁₂−E₃₄) for the alternating form J₁₄=J₂₃=1, J₄₁=J₃₂=−1. Both satisfy NᵀJ+JN=0 and reduce to U₁, but N₀²=0 and N²=η(E₁₃−E₂₄)≠0; §2.25 excludes the second lift by Artinian orbit membership.
- The symplectic candidate I+η(E₁₂−E₃₄) preserves the standard full flag and Lagrangian plane; its plane restriction I₂+ηE₁₂ has diagonal (1,1) but (1,2) entry η≠0. A full flag alone does not exclude this entry; §6.14 does and requires the plane itself to split as the two prescribed unramified characters.
- For a=2 the multiplier is ε⁻¹; a representation with multiplier ε has the wrong normalization.
- For p=7,a=5 the numerical inequality holds, but ν(c)=(−1)^(1−5)=1 violates oddness; a=4 gives ν(c)=−1.

Do not replace Assumption 4.1 by adequacy, or the selected ordinary plane by an arbitrary filtration. The multiplier is ε^(1−a), with ε of Hodge–Tate weight −1 and geometric Frobenius ε(Frobℓ)=ℓ⁻¹.

*Needs:* §0.1; ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; GlobalGaloisDeformations G7 (the CG Selmer-presentation contract); LocalGaloisDeformationRings §§2.7, 2.25, 6.14.

### 0.4 Minimal tame levels and the neat auxiliary prime

From a CG lifting datum satisfying Assumption 4.2 choose q≥3, q∉S(r̄)∪{p}, with q≠1 mod p and no ratio of residual Frobenius eigenvalues equal to q. At U₁,U₂,U₃ primes choose respectively paramodular, Klingen and Iwahori level; at P choose strict Klingen level; at H choose full congruence level at x; impose full level q and hyperspecial level elsewhere. For Q disjoint from S(r̄)∪{p,q}, form K₀(Q) and K₁(Q) (Klingen Π(x) and Π(x)⁺ at x∈Q), the group ΔQ=∏x∈Q(Z/xZ)^× of the étale cover X₁(Q)→X₀(Q) (through Π(x)/Π(x)⁺≅(Z/xZ)^×), and the intermediate cover XΔ(Q) for any quotient Δ of ΔQ; the patching argument uses quotients of p-power order. The prime q makes these moduli problems neat.

(CG20, Assumption 4.2, p.813; §§5.1–5.2, pp.820–822; §6.3, pp.840–841; proof of Theorem 6.13, p.843; §7.2, p.851; CG20 line 529.)

Choose the Frobenius class by Chebotarev from the stated neatness witness, then choose a prime outside the finite excluded set. Use the suppliers for integral models, compatible fans and bundles; specify the local compact subgroups and their Klingen-character kernels. The no-eigenvalue-ratio condition gives H²(Qq,ad⁰r̄)=0 and forces every relevant lift to be unramified at q.

The construction has the following interfaces.

- Give the local compact subgroup at each ramification type and at q.
- Identify the deck group with the specified quotient of ΔQ, including the trivial quotient.
- Supply compatible pullback and trace maps on the chosen compactifications and bundles.

**Checks.**

- For Q=∅ the diamond group is trivial and X₀(Q)=X₁(Q)=X.
- At p=11, a=4 and q=5, the multiplier at Frob_q is ε̄(Frob_q)^(−3)=(5⁻¹)⁻³=5³≡4. Scalar residual roots (2,2,2,2) have paired products 4 and ratio set {1}, which avoids q=5, so q is accepted; the roots (1,5,3,4) have the same paired products 1·4=5·3≡4 but the ratio 5/1=q, so q is rejected although q≢1 modulo 11.
- At p=5 and Q={11}, Δ_Q=(ℤ/11)^× has order 10 and its maximal p-power quotient has order 5; X₁(Q)→X₀(Q) has degree 10 and the patching cover X_Δ(Q) for that quotient has degree 5. They are different covers.
- Full level q=3 excludes −I₄, which reduces to 2I₄≠I₄ modulo 3; full level 2 would not, since −I₄≡I₄ modulo 2. The requirement q≥3 is what makes the moduli problems neat.

State the auxiliary-prime unramifiedness for the lift itself, and identify the trivial Q cover with the base level.

*Needs:* §0.3; ShimuraCompactifications 4.9–4.10; ShimuraCompactifications 7.13–7.18; AutomorphicBundlesPartII Layer 5; AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3.

### 0.5 Klingen Taylor–Wiles refinements

A CG Taylor–Wiles refinement at x∉S∪{p} consists of x≡1 mod pᴺ, four distinct residual Frobenius roots (αx,βx,γx,δx), two specified complementary isotropic planes, the pairing labels αxδx=βxγx=ν(Frobx), and the extra separation αxβx≠γxδx. Roots lift uniquely in the appropriate henselian Hecke factor. The pairing labels and product separation are additional requirements, not consequences of the two isotropic planes.

(CG20, §4, p.815; Proposition 4.10, p.818; Assumption 7.1 and Theorem 7.2, pp.846–847; CG20 line 719.)

Use the supplier auxiliary-prime theorem with the precise CG image hypothesis, not a dimension-general theorem with different assumptions. Label roots respecting the symplectic pairing, and exchange βx and γx when necessary to get the product separation. Track the chosen isotropic plane through scalar inertia deformations.

The construction has the following interfaces.

- Extract the multiplier equalities and isotropic-plane labels.
- Return the unique lifted four roots with their reductions.
- Transport the selected refinement under a permitted symplectic relabelling and update the selected projector.

**Checks.**

- In F₁₃ roots (2,4,11,9) have paired products 5 and four distinct entries, but 2·4=11·9; reject this ordering.
- Relabelling (2,4,11,9) as (2,11,4,9), exchanging β and γ, keeps the paired products αδ=18≡5 and βγ=44≡5 in 𝔽₁₃ but gives αβ=22≡9 and γδ=36≡10, so the separation holds for this ordering; a model that paired αβ with γδ would reject both orderings.
- For p=5 and requested depth N=2, x=11 has x−1=10, divisible by 5 but not by 25, and is rejected; x=101 has x−1=100, divisible by 25, and is accepted.

Keep the one-dimensional Klingen diamond factor here distinct from the two-dimensional torus factor in Layer 10.

*Needs:* §0.3; GlobalGaloisDeformations R04.5–R04.6 (the CG Selmer-presentation contract).

### Examples

Take p=11, a=4 and roots α=2, β=3 in 𝔽₁₁. The four-factor product is 7 and 4≤4<10, so the root and numerical weight tests of §§0.1 and 0.3 both pass. The multiplier at complex conjugation is (−1)^(1−4)=−1. These computations specify compatible numerical data; the global image and Katz-occurrence hypotheses still require witnesses.

### Dependencies

ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3; AutomorphicBundles Layer 11; ShimuraData §§5.9–5.10, 5.18; GlobalGaloisDeformations G7 (the CG Selmer-presentation contract); GlobalGaloisDeformations R04.5–R04.6 (the CG Selmer-presentation contract); PadicFamiliesPartII E6/four-pieces and F8; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; LocalGaloisDeformationRings §§2.7, 2.25, 6.14 and §2.17; ShimuraCompactifications 4.9–4.10; ShimuraCompactifications 7.13–7.18; AutomorphicBundlesPartII Layer 5; Mathlib `ZMod`. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 1: Selected cuspidal Hecke images

Construct the specialized anemic, full and p-enlarged Hecke images on the actual cuspidal modules, their invariant-level restrictions and joint residual-root selectors. Define nonzero cuspidal Katz modularity at the prescribed level. The underlying image, determinant and projector theory is imported from the IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b.

### 1.1 The three nonregular Hecke images

For the supplied cuspidal coherent sections H⁰(X₁(Q),ω(μ)(−D)⊗E/O), define Tanμ(Q) as the O-subalgebra image generated by spherical operators away from S∪Q∪{p}; Tμ(Q) adds Ux,i and ΔQ; T̃μ(Q) adds the integral p-operators Tp,1 and Qp,2=(pTp,2+(p+p³)Sp)p^(2−b) for μ=(a,b). Restrict these actual images to the invariant X₀(Q) subspace when that level is used. Define ordinary images by restriction to the invertible Tp,1Qp,2 summand, rather than by simply adjoining inverses to an unrelated ring.

(CG20, Definitions 5.13–5.14, pp.834–835; Lemma 8.8, p.860; CG20 line 1398.)

Import abstract Hecke images, spin-polynomial normalizations and factorial projectors; specify the generating double cosets and their actual action. Construct the normalized integral H⁰ p-operators below before using their images; Fourier identities alone do not define higher-degree actions. Prove the X₀(Q) subspace is stable and that the three ring maps are induced by their common faithful image action.

Define the displayed normalization in characteristic zero and prove that it preserves the integral lattice before reducing it; negative powers of p are never interpreted as division in O/ϖᵐ.

On the formal rank-at-least-one locus, construct the minuscule spherical correspondence and its pullback–differential–trace map T′. For Ω(d,r) with d≥0,r≥2, prove p³-divisibility of T′ on the integral torsion-free canonical and subcanonical coefficients and define T by its unique integral factorization p³T=T′. At ordinary generic points the multiplicative, mixed and étale kernel contributions have differential/trace valuations at least (d+2r,0), (r,1) and (0,3); each total is at least 3. Check horizontal height-one points where p is invertible, use normality for the extension, and then use the codimension-two supersingular Hartogs comparison for H⁰. On the paramodular correspondence construct the two integral normalized factors and their composite, retaining the full central transport, and obtain Qp,2 by the integral central subtraction whose rational expression is the displayed formula. Prove that these actions commute with prime-to-p correspondences, tame diamonds, coefficient reduction, passage to E/O and common toroidal refinement. Construct the integral correspondence before reducing coefficients, so no assertion that every torsion section lifts is used (CG20 Lemmas 8.8 and 8.12, pp.860,864; P20 §§7.1–7.2, pp.37–40, and Lemma 14.9.1 with proof §14.9.2, pp.103–104; P20 line 1721 and line 4751).

The degree-zero construction does not furnish the coherent-complex actions needed by §7.4.

The normalized operator has the following additional interfaces.

- Its integral factorization p³T=T′ is unique on the torsion-free target and agrees with the rational spherical action.
- Its canonical and subcanonical versions preserve the specified cusp ideal and are compatible with fan refinement.
- Its reductions and E/O colimit induce the actual H⁰ action on every coefficient quotient, retaining the full central operator in Qp,2.

**Checks for the integral p-action.**

- At d=0,r=2 the three valuation sums are at least 4,3,3; all permit division by p³ before reduction, while the mixed and étale cases do not permit division by p⁴.
- In weight (2,2), Qp,2 reduces to Z₂+X₂; at a coefficient with discriminant 1 the X₂ contribution is 1 and cannot be deleted.
- Over O/ϖᵐ, multiplication by p³ can kill a nonzero coefficient, so it has no inverse there; the integral factorization, rather than quotient-ring division, defines the reduced action.

The construction has the following interfaces.

- Give the image of every good spherical operator and its spin polynomial.
- Give Ux,i and the homomorphism O[ΔQ]→Tμ(Q).
- Identify Tp,1 and Qp,2 on integral sections with their Fourier formulas.
- Pullback/trace maps intertwine all generators for which the correspondence is defined.

**Checks.**

- For Q=∅ the diamond generators contribute only the identity.
- In weight (a,2), Qp,2=pTp,2+(p+p³)Sp; dropping the central summand is rejected.
- If two abstract operators act identically on the chosen module they have identical elements in its Hecke image.

A relation in an abstract double-coset algebra is transported to the actual image; no faithfulness of that abstract algebra is assumed.

*Needs:* §0.4; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; AutomorphicBundles Layer 12; AutomorphicBundlesPartII §§4.1–4.3 (the arithmetic normalization, the sheaf-level unique integral division and the geometric generators).

### 1.2 Joint ordinary root selectors

On a finite O-Hecke algebra over the finite residue field k, with its adic topology, or compatibly on its finite quotients, use the supplied factorial root selector e(T,c)=1−limn(T−c)^(n!). Define eβ=e(Tp,1,β)e(Qp,2,αβ) in the regular-weight setting used by CG20, and eαβ=e(Tp,1,α+β)e(Qp,2,αβ) in weight (a,2). Over O the selected summand is the simultaneous residual-root factor: on it T−c and Q−d both act topologically nilpotently. Its complement is the direct sum of the factor on which T−c is invertible and the factor on which T−c is topologically nilpotent and Q−d is invertible; on every joint local factor outside the selected summand at least one of the two root differences is invertible, and neither T−c nor Q−d need be invertible on the whole complement. Modulo every ϖᵐ its image is the intersection of the two algebraic generalized root submodules, and over the residue field k it is the intersection of Mathlib’s generalized eigenspaces. No identification with exact generalized eigenspaces on a characteristic-zero fiber is asserted. The two complementary limits are multiplied separately; taking one complement of their product selects an incorrect union.

(CG20, §6.3, p.841; §6.4, p.845, with the joint-selector correction; CG20 line 1640.)

Apply the upstream factorial-powers theorem in each finite quotient and then take the compatible adic limit. Use commuting p-operators to multiply commuting idempotents and identify the image, in each finite quotient, with the intersection of the two Fitting nilpotent parts. The regular β selector uses the regular residual Qp,2 value αβ; retain the source weight and normalization when transferring selectors.

The construction has the following interfaces.

- On a module of finite length over O/ϖᵐ, an element lies in the selected image exactly when both algebraic generalized root conditions hold. Over the residue field k, the singular selected submodule is the intersection of Mathlib’s generalized (α+β)-eigenspace of T and generalized αβ-eigenspace of Q; membership allows separate finite exponents. Over O the selected image is the inverse limit of these finite-level images.
- The product selector squares to itself and commutes with the Hecke algebra.
- Reduction to O/ϖᵐ commutes with the selector and with its image splitting.

**Checks.**

- On k² with T=diag(c,c+1), Q=diag(d+1,d), the joint (c,d) selector is zero and its complement is all of k²: the T-invertible factor is ke₂ and the T-nilpotent, Q-invertible factor is ke₁, on which the respective invertible differences act by 1, while T−c=diag(0,1) and Q−d=diag(1,0) both have determinant 0 on k². The erroneous union formula is the identity, and a model asserting one globally invertible difference on the complement is excluded.
- For T=diag(c,c+1), Q=diag(d,d), the selector is diag(1,0).
- A nonzero nilpotent Jordan block for T−c belongs entirely to the generalized c part; a simple eigenspace would lose vectors.
- Over O=ℤ₁₁ with M=O, α=2, β=3, T=16 and Q=6: T−5=11 and 11^(n!)→0, so e(T,5)=e(Q,6)=1 and the selected image is O, whereas ker(T−5)ⁿ=ker(11ⁿ)=0 for every n≥1. Modulo 11ᵐ, (T−5)ᵐ=0 and the finite-level generalized root submodule is everything; over ℚ₁₁ the exact generalized 5-eigenspace is zero. An algebraic-eigenspace model of the adic selector fails here.

Verify the scalar root pairs directly, including points satisfying exactly one of the two conditions.

*Needs:* §1.1; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; Mathlib `Module.End.genEigenspace`.

### 1.3 Katz modularity in weight (a,2)

For the fixed level from Layer 0, say that r̄ is Katz modular of weight (a,2) with ordered roots α,β when there is a nonzero section η∈H⁰(X,ω(a,2)(−D)k)[m∅] satisfying Tp,1η=(α+β)η and Qp,2η=αβη. The anemic ideal m∅ is of Galois type r̄ using the imported residual-polynomial interface. The cuspidal condition, the actual level and nonzeroness are all part of the predicate.

(CG20, Definition 6.15 and Assumption 6.16, pp.844–845, corrected nonzero cuspidal formulation; CG20 line 1760.)

Specialize the supplied Galois-type maximal-ideal predicate to the coherent cuspidal space and the normalized two p-operators. Relate existence of such η to nonzero residual selected eigenspace, after the coefficient field contains the required eigenvalues.

The construction has the following interfaces.

- Extract a nonzero cuspidal simultaneous eigensection at the specified level.
- Identify Katz modularity with nonvanishing of the selected residual eigenspace under the splitting hypotheses.
- Extend a witness along an injective residue-field extension.

**Checks.**

- A zero selected space has no witness.
- A noncuspidal Eisenstein eigenform with matching p-eigenvalues is not a witness.
- A nonzero class with Tp,1=α+β but Qp,2≠αβ is rejected.

The zero section never witnesses modularity; an eigenclass at an unspecified larger level does not meet the minimal-level hypothesis.

*Needs:* §1.1; §1.2; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b.

### Examples

In a linear-algebra model over 𝔽₁₁ take T=diag(5,0), Q=diag(6,0) and an away-p operator A=diag(7,9). The joint (α+β,αβ)=(5,6) selector is diag(1,0), and restriction of the action image sends A to 7 on the selected line. The vector e₁ is a nonzero simultaneous eigenvector; interpreting it as a Katz witness additionally requires the actual cuspidal section carrier and residual Galois ideal of §1.3.

### Dependencies

AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; Layer 0; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; Mathlib `Module.End.genEigenspace`. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 2: Singular-weight Galois interpolation

Construct number fields for coherent eigensystems and apply the all-degree Pilloni–Stroh interpolation to their characteristic-zero actions. State the precise qualified Mok crystalline specialization, the no-Steinberg scalar-weight obstruction, ordinary weight-two Galois systems, the pure general-type monodromy upgrade, dual-spin overconvergent interpolation and completed-eigenspace isotypy through the GSp₄ semisimplicity criteria. Preserve every classification and local qualification.

### 2.1 Coefficient fields of coherent eigensystems

Let K be neat and Ω(k,r)=ω(k+r,r), k≥0, r∈Z, on the Siegel threefold. Every simultaneous characteristic-zero Hecke character Θ occurring in any finite-dimensional Hⁱ of its canonical or subcanonical extension has values in a number field E. For every λ|p choose an embedding E→Q̄p. Finite-dimensionality is used for this actual Hecke image, so an arbitrary character of a free algebra is not covered.

(P20, Theorem 5.3.1, author p.25; weight convention, author p.24; P20 line 1098.)

Use the rational structure on the algebraic variety and bundle, finite coherent cohomology and the rational Hecke action. The image of the commutative Hecke algebra in EndQ(Hⁱ) is finite-dimensional; the residue field of its characteristic-zero character is finite over Q. Identify all eigenvalues with this common finite field and transport along each chosen p-adic embedding.

**Checks.**

- On a two-dimensional rational Hecke module with generator matrix [[0,2],[1,0]], the eigenvalues are ±√2 and lie in a degree-two field. A free-algebra character sending that generator to a transcendental number does not occur on this module.
- The zero cohomology space has no occurring Hecke character; a zero vector cannot witness occurrence.
- A finite image ℚ×ℚ gives rational characters in either factor, rather than one character mixing the two factors.

Treat both extension conventions and each degree; do not appeal only to a coefficient-field theorem for classical H⁰ forms.

*Needs:* AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3; AutomorphicBundles Layer 11; ShimuraData §§5.9–5.10, 5.18; IntegralHeckeAndGaloisDeterminants §§2.1–2.3.

### 2.2 No Steinberg component in scalar weight two

If π is the cuspidal automorphic representation of a classical Siegel form of weight (2,2), then no finite local component is Steinberg in the source’s normalized central-character convention. At a Steinberg place x, the normalized Ux,1 eigenvalue in weight (j,k) is x^((j+k−6)/2), and in weight (2,2) it is x⁻¹, contradicting integrality of the Fourier-normalized Hecke action. Include any allowed finite unramified unit twist in the local calculation; its valuation does not change the contradiction.

(CG20, Theorem 5.9 and proof, p.832; CG20 line 1304.)

Use the exact supplier contract for the local Steinberg parameter and its U-eigenvalue in the exact geometric normalization from SmoothRepresentationsOfLocalGroups SR.4.5 through the Steinberg eigenvalue contract. Establish integrality of the action on the Fourier lattice and hence integrality of its eigenvalue. At the residue characteristic x that Steinberg eigenvalue has negative valuation; conclude it cannot occur.

**Checks.**

- At weight (2,2) and x=3 the Steinberg eigenvalue is 1/3, of 3-adic valuation −1; multiplying by an unramified integral unit keeps valuation −1.
- At weight (4,2), the same exponent is 0 and the eigenvalue is a unit; the scalar-weight contradiction does not extend to this weight.
- At weight (3,3) the exponent is also 0, detecting a mistaken shift j+k−4 in place of j+k−6.

The proof is an integral Hecke-eigenvalue obstruction, not a consequence of an unproved association of an abelian variety to every weight-two form.

*Needs:* §0.2; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.5; SmoothRepresentationsOfLocalGroups SR.4.5 (the Steinberg eigenvalue contract).

### 2.3 All-degree characteristic-zero interpolation

For the characteristic-zero coherent eigensystems of Layer 2, the away-p Hecke action factors continuously through the inverse limit of finite free integral Hecke images on cuspidal H⁰ at varying p-levels and finite sets of regular weights. The resulting continuous semisimple ρΘ,λ:GQ→GL₄(Q̄p) is unramified outside Np and satisfies det(1−XρΘ,λ(Frobℓ))=Θ(Qℓ(X)) at ℓ∤Np. This applies to every coherent degree and both canonical and subcanonical extensions. It does not identify the unusual integral models in Pilloni–Stroh with a chosen Kottwitz lattice.

(PS16, Theorem 0.1, pp.1–2; Theorem 3.6 and Remark 3.10, pp.16–17; Corollary 3.14, p.19; P20 Theorem 5.3.1, author p.25; PS16 line 896.)

Import the geometric interpolation input for the modified ample Hodge bundle: Hodge–Tate sections give a Hecke-stable cover, and Čech localization modulo pˢ reduces classes to sections. Clear denominators with high powers, use positivity and Serre vanishing to lift regular-weight sections, and pass through the finite integral Hecke images. Use duality for the other extension convention; reconstruct the semisimple representation from the continuous determinant and good-prime identities. Record an independent lattice-comparison obligation before applying this theorem to a specific torsion integral lattice.

The independent finite-lattice comparison with the CG integral model is the target that identifies the Hecke action on that specified cuspidal O/ϖᵐ lattice with the modified-model action, for every m and coefficient transition. Its hypotheses are the supplied comparison morphism of the two models and compatibility with the boundary, coefficient bundle and normalized correspondences. It is not a premise of the characteristic-zero theorem or a replacement for Layer 3–Layer 4.

**Checks.**

- For geometric Frobenius acting by diag(1,2,3,6), det(1−XF)=1−12X+47X²−72X³+36X⁴; using det(X−F) reverses its coefficients.
- The constant term is 1 even at X=0; no division by a Frobenius eigenvalue at a ramified prime is involved.
- A characteristic-zero comparison identifies no reduction lattice: the lattices O and ϖO in E have identical E-span but different embedded modulo-ϖ reductions.

Do not infer CG20 Lemma 6.9 for its torsion lattice solely from this characteristic-zero theorem. Symplectic descent and de Rhamness are separate conclusions requiring their own hypotheses.

*Needs:* §2.1; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; IntegralHeckeAndGaloisDeterminants IHG.4; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; HodgeTateAndCanonicalSubgroups §§0.2–0.5; AutomorphicBundles Layer 10; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26.

### 2.4 Qualified crystalline specialization

For a simple-generic cuspidal GSp₄ representation over a totally real field with archimedean parameter φ(w,m₁,m₂), m₁>m₂≥0 and w+1≡m₁+m₂ mod 2, assume spherical level at every v|p and four distinct inverse Hecke roots there. Under the classification hypotheses, Mok’s associated p-adic representation is crystalline at v|p, hence de Rham, including the stated limit-of-discrete-series cases. This theorem does not assert de Rhamness for every ordinary singular coherent eigensystem; that general expectation is the proposition recorded in ModularityAndLanglandsExtensions §0.4 and is not assumed here.

(M14, §4, Theorem 4.14 and Proposition 4.16, pp.40–42; P20 §5.3, author pp.25–26; M14 line 1677.)

Import the regular-weight crystalline realizations from AutomorphicGaloisRepresentationsPartII AG2.6, which covers good p-level and regular weight (a,b) with a≥b≥3 only, and the analytic continuation of crystalline periods, in its `G_{F_v}` version with `φ^{f_v}`, from AutomorphicGaloisRepresentations §0.4. Construct here the finite-slope family through the given point and verify on that family the smallness, Sen-polynomial, invertibility and injectivity hypotheses of the continuation theorem, for each of the four refinements at v|p. Four distinct specialized Frobenius eigenvalues make the four specialized period lines independent, so the crystalline module has dimension four. Carry the central character and archimedean parity through the weight dictionary. Apply coefficient extension and de Rham descent from the period-functor API.

**Checks.**

- For (m₁,m₂,w)=(1,0,0), the parity equation is 1≡1 modulo 2 and m₂=0 is allowed; w=1 fails that parity.
- Four inverse roots (1,2,3,4) have six nonzero pairwise differences, and the four eigenperiods for distinct eigenvalues span a four-dimensional space; (1,1,2,3) has one zero difference, two continued periods may share an eigenline, and the point is outside the theorem.
- The singular parameter (m₁,m₂,w)=(1,0,0) is not a weight (a,b) with b≥3, so AG2.6 alone does not reach it; the continuation theorem must be applied on a family whose regular members AG2.6 covers.
- The spherical hypothesis is stronger than an arbitrary ordinary stabilization; an Iwahori-invariant Steinberg parameter has N≠0 and supplies no spherical crystalline instance.

A repeated-root ordinary representation is outside this specialization; do not remove the distinct inverse-root condition.

*Needs:* §2.3; PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4; AutomorphicGaloisRepresentationsPartII AG2.6; AutomorphicGaloisRepresentations §0.4; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26.

### 2.5 Ordinary weight-two Galois representation

Let F⁺ be totally real with p completely split, and let π be an ordinary cuspidal weight-two GSp₄(A_F⁺) representation in the BCGP25 convention λ=(1,1;2), with central character |·|². There is a continuous semisimple ρπ:G_F⁺→GSp₄(Q̄p), multiplier ε⁻¹. Away from p its Weil–Deligne semisimplification equals recGT(πv|ν|^(−3/2))ss. At v|p it is upper triangular with diagonal α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹, where α and β are potentially unramified. Neither full monodromy equality nor de Rhamness follows from this basic interpolation statement.

(BCGP25, §1.8.12, p.12; Definition 1.8.16 and Theorem 1.8.17, pp.13–14; BCGP25 line 641.)

Use the ordinary families with dense regular classical points and the fixed central-character identity. Interpolate the symplectic Galois object; at p retain the four ordered ordinary characters and potential unramifiedness. Apply the semisimplified local comparison with its explicit |ν| twist. When ρπ is irreducible, the ε⁻¹-line in ∧²ρπ gives a nondegenerate alternating pairing; in general the GSp₄-valued output comes from GSp₄ pseudocharacters (pseudocharacter supplier contract).

**Checks.**

- For unramified characters α,β the paired diagonal products are ε⁻¹ and ε⁻¹, and the determinant is ε⁻².
- At weight two and geometric Frobenius ℓ=3 the full multiplier is 3 and determinant 9; replacing ε⁻¹ by ε gives 1/3 and 1/9.
- Semisimplification forgets a two-by-two nilpotent block: N=0 and N=[[0,1],[0,0]] both have zero diagonal, so the basic conclusion does not equate monodromy.

The statement is over Q̄p, so no integral descent is involved, also at p=2; the GSp₄-valued interpolation uses Lafforgue's GSp₄ pseudocharacters and their reconstruction over Q̄p.

*Needs:* §2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; IntegralHeckeAndGaloisDeterminants §1.7 (the pseudocharacter-reconstruction contract).

### 2.6 Pure general-type monodromy upgrade

In §2.5, if π is of general type and the corresponding ρπ is pure, upgrade the away-p comparison to an equality of Frobenius-semisimplified Weil–Deligne representations retaining monodromy N. The general-type and purity assumptions are not omitted.

(BCGP25, Remark 1.8.20 and its argument, p.14; BCGP25 line 679.)

General type means the transfer to GL₄ is cuspidal, hence locally generic, so πv⊗|ν|^(−3/2) belongs to one of the generic L-packets; by ModularityAndLanglandsExtensions §3.5(vii) the adjoint L-factor of its parameter is holomorphic at s=1. Purity of ρπ makes its Frobenius-semisimplified Weil–Deligne representation pure; by the pure-monodromy uniqueness contract on SmoothRepresentationsOfLocalGroups SR.4.5 a pure Weil–Deligne representation with the given semisimplification carries the unique monodromy compatible with that holomorphy, which is the monodromy of the automorphic side. Keep the N-bearing comparison distinct from the basic semisimplified interpolation theorem.

**Checks.**

- For r(F)=diag(1,q), the operators N=0 and N=E₁₂ both satisfy r(F)Nr(F)⁻¹=q⁻¹N and have the same r; purity/genericity is needed to choose the permitted monodromy.
- The ranks of those two N are 0 and 1; an equality retaining N must distinguish them.
- For a direct sum of characters the cuspidal GL₄-transfer condition is absent; semisimplified matching alone does not activate this upgrade.

An unramified-trace identity alone cannot certify this target. The adjoint input is local (holomorphy at s=1 of a local adjoint L-factor), not a global analytic statement.

*Needs:* §2.5; AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5; AutomorphicLFunctionsAndLocalFactors AL.4; SmoothRepresentationsOfLocalGroups SR.4.5 (the pure-monodromy uniqueness contract); ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; ModularityAndLanglandsExtensions §3.5(vii).

### 2.7 Dual-spin overconvergent interpolation

For an ordinary overconvergent eigenform f∈H⁰⁰_w(Sh_Kp,ω(2,2;−w),sm), with w even and smooth torus character χ=χ₁⊗χ₂⊗χ₃⊗χ₄, construct its semisimple GSp₄ representation ρf with good-prime polynomial Pℓ in BCGP25’s dual-spin convention: at classical points it is ρπ∨ε⁻³. Under local reciprocity the ordered p-diagonal characters on z∈Qp× are χ₄(z)⁻¹z^(−1−w/2), χ₃(z)⁻¹z^(−1−w/2), χ₂(z)⁻¹z^(−2−w/2), χ₁(z)⁻¹z^(−2−w/2). Specify the reciprocity convention on p as well as Zp×.

(BCGP25, Lemma 4.12.1 and its proof, p.112; Remark 4.12.2, p.112; BCGP25 line 5020.)

Import higher-Hida/overconvergent spaces and their local torus action. Interpolate the dual-spin polynomial with the central operator and compare with the classical dual-and-twist formula. Read the local characters from the ordered torus eigensystem, correcting the double inverse printed in the final two entries of BCGP25 Lemma 4.12.1.

Here Art(p) is geometric Frobenius. The integer exponents require even w; no half-integer character is introduced. The GSp₄-valued interpolation uses the pseudocharacter reconstruction contract, including reducible specializations.

**Checks.**

- At w=0 and all χᵢ=1 the exponents are −1,−1,−2,−2; at w=2 they are −2,−2,−3,−3.
- A smooth χ₂ with χ₂(u)=ζ₃ gives third diagonal value ζ₃⁻¹u^(−2−w/2); a duplicated inverse would give ζ₃ instead.
- At z=p the algebraic factors are p^(−1−w/2) and p^(−2−w/2). With w=0 and trivial χ these are p⁻¹ and p⁻², so this formal torus datum is not asserted to occur as the character of an ordinary eigenform; the actual smooth eigencharacter supplies the normalization required for a continuous compact Galois image.

Never identify this dual-spin representation with the geometric-spin ρπ without the indicated dual and cyclotomic twist.

*Needs:* §2.5; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; IntegralHeckeAndGaloisDeterminants IHG.4; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; IntegralHeckeAndGaloisDeterminants §1.7 (the pseudocharacter-reconstruction contract).

### 2.8 Completed eigenspace isotypy

Let V=H³(RHom_b(λ,RΓ(Sh_Kp^tor,Qp)^la)^ord_mρ̄), λ=(1,1;w), with the algebraic torus character removed as in BCGP25. Assume residual absolute irreducibility, ρf irreducible, and either Zariski image containing Sp₄, or image containing SL₂×SL₂ with ρf becoming reducible on an index-two subgroup. For an occurring eigenform f, the eigenspace V[mf] is nonzero, finite-dimensional and isomorphic to ρf⊗W for a finite-dimensional nonzero multiplicity space W.

(BCGP25, Lemma 4.12.3 and proof, p.113; Propositions 4.11.1–4.11.2, pp.109–110; Theorem 1.8.29, p.17; BCGP25 line 5046.)

Use the four higher-Coleman graded pieces and exactness of χ-isotypic parts for smooth T(Zp)-modules in characteristic zero: (V⊗Cp)[χ] is finite-dimensional, with Gr⁰ the ordinary overconvergent H⁰. The maximal ideal mf lies in the support of the finite-length module (V⊗Cp)[χ], through its quotient Gr⁰, so its mf-torsion is nonzero; no exactness of the eigenspace functor is needed. Each Frobℓ satisfies Pℓ mod mf on V[mf] by the Eichler–Shimura relation. In the index-two case identify the two constituents ϱ and ϱᶜ, and derive det ϱ=ν on that subgroup from the symplectic pairing and the independent SL₂ factors. Apply the GSp₄ semisimplicity criteria for representations annihilated by the Frobenius characteristic polynomials of ρf (BCGP25 Propositions 4.11.1–4.11.2); the Cayley–Hamilton recognition of IntegralHeckeAndGaloisDeterminants §1.6 needs annihilation by the whole Cayley–Hamilton ideal and does not apply directly.

**Checks.**

- With dim W=1 or 2, dim(ρf⊗W)=4 or 8; a nonzero eigenspace of dimension 3 contradicts the annihilation criterion.
- For A=E[t]/(t²), the nonzero quotient A/(t) has dimension 1 and the socle of A is E·t, also dimension 1; this illustrates finite-length support without eigenspace exactness.
- A nonsplit two-dimensional unipotent extension has (g−1)²=0 but g−1≠0; equality of semisimplified characters does not give the full annihilation identity.

The conclusion includes W≠0, not only a multiple-of-four dimension assertion. Only the Frobenius characteristic polynomials are known to annihilate V[mf]; the image hypothesis is what makes this enough.

*Needs:* §2.7; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; ArithmeticGaloisRepresentations §7.6.

### Examples

In scalar weight two, a geometric-spin representation with Hodge–Tate multiset {0,0,1,1} becomes a coherent dual-spin representation with multiset {2,2,3,3}: duality negates the weights and twisting by ε⁻³ adds 3. Its multiplier changes from ε⁻¹ to ε⁻⁵, because duality inverts the multiplier and a rank-four scalar twist squares its character. This checks both normalizations and does not infer de Rhamness from an ordinary filtration.

### Dependencies

ArithmeticGaloisRepresentations §7.6; AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3; AutomorphicBundles Layer 11; ShimuraData §§5.9–5.10, 5.18; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5; AutomorphicGaloisRepresentationsPartII AG2.6; AutomorphicLFunctionsAndLocalFactors AL.4; SmoothRepresentationsOfLocalGroups SR.4.5 (the pure-monodromy uniqueness contract); Layer 0; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; HodgeTateAndCanonicalSubgroups §§0.2–0.5; AutomorphicBundles Layer 10; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; IntegralHeckeAndGaloisDeterminants IHG.4; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; ModularityAndLanglandsExtensions §3.5(vii); PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.5; SmoothRepresentationsOfLocalGroups SR.4.5 (the Steinberg eigenvalue contract); AutomorphicGaloisRepresentations §0.4. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 3: Finite-level Hasse transfer and regular Galois systems

Construct Hasse lifts with finite-level congruences and use the supplied vanishing thresholds to transfer actual selected image quotients. The annihilator belongs to the selected summand. Construct central characters, residual Galois systems and regular Hecke-valued representations with ordered ordinary local characters.

### 3.1 Hasse shifts and the vanishing threshold

For μ=(a,b), use the supplied primary scalar Hasse invariant h of weight (p−1,p−1), construct a characteristic-zero lift A of hʳ with r>0, and choose a threshold N(μ) for higher-cohomology vanishing after a sufficiently positive scalar shift. For coefficients O/ϖᵐ choose s divisible by p^(m−1) with t=rs(p−1)≥N(μ), and set μ′=μ+(t,t). Multiplication by Aˢ is injective on sections and is equivariant for the normalized away-p Hecke action. Equivariance for the normalized p-operators is a separate assertion and is not inferred from this construction.

(CG20, Definition 6.1, Definition 6.3, Lemma 6.4 and Remark 6.5, pp.836–837; CG20 line 1434.)

Use the primary Hasse invariant from HodgeTateAndCanonicalSubgroups §0.14 and construct the lift and finite-level congruences as follows. Choose the shift using the supplied positivity/vanishing theorem, preserving the difference a−b. Prove integral injectivity using that the multiplier is a nonzerodivisor on the appropriate model; identify precisely the operators with which it commutes.

The integer N(μ) is chosen for the finite set of levels used in this comparison; write N(μ,levels) when those levels vary.

Choose a positive determinant power descending to the minimal model and a high Hasse power hʳ there. Use its ample twist and the coefficient reduction sequence to lift it to an integral section A, then pull A back to all tame auxiliary levels. It is a chosen lift. If a and b are two local lifts of the same section modulo ϖ, prove a^(p^(m−1))≡b^(p^(m−1)) modulo ϖᵐ for m≥1; binomial expansion uses p∈ϖO, not vϖ(p)=1. Include line-bundle transition functions in this congruence before gluing. This proves the away-p isogeny equivariance of Aˢ for the prescribed s. Apply the componentwise nonzerodivisor criterion and then the ϖ-filtration to prove injection on all O/ϖᵐ cuspidal sections. The API includes the reduction A mod ϖ=hʳ, pullback and deck invariance of the same chosen A, comparison of two choices after the stated exponent, and arbitrarily large admissible shifts. At p=2 the local congruence (1+2)²≡1 modulo 4 has values 9≡1; for a ramified ϖ with ϖ²=2, (1+ϖ)²−1=2ϖ+ϖ² is divisible by ϖ². The finite-coefficient congruence includes every prime; the CG application keeps its own odd-p range (CG20 Definition 6.1 and Lemma 6.4, pp.836–837; P20 proof of Theorem 11.2.1, p.70; CG20 line 1434 and line 1467).

No bound uniform over all Q is required. The Hasse coefficient is a nonzerodivisor on every relevant connected component.

The construction has the following interfaces.

- Return the exact shifted pair μ′ and preserve a−b.
- The multiplication map on sections has zero kernel under the supplied geometric hypotheses.
- Intertwine the good-prime normalized Hecke operators modulo ϖᵐ.

**Checks.**

- A scalar shift takes (4,2) to (4+t,2+t), preserving difference 2.
- For p=5,m=3 choose s divisible by 25; s=5 alone does not meet this finite-level requirement.
- A nonconstant Hasse shift does not by itself identify the two normalized p-operator eigenvalues.

Track m and the divisibility of s; a lift merely congruent to hʳ modulo ϖ need not have the required equivariance modulo ϖᵐ.

*Needs:* §1.1; AutomorphicBundles Layer 11; ShimuraData §§5.9–5.10, 5.18; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; ShimuraCompactifications 7.13–7.18; AutomorphicBundlesPartII Layer 5; HodgeTateAndCanonicalSubgroups §0.14.

### 3.2 Secondary Hasse geometry

Over a reduced characteristic-p base B, let G be a height-four dimension-two BT₁ whose multiplicative and étale ranks are both constantly one. Use its multiplicative-connected filtration Gᵐ⊂Gᵒ⊂G and put Gᵒᵒ=Gᵒ/Gᵐ. In its rank-two Dieudonné crystal the Hodge subline and quotient have zero induced Verschiebung; reducedness turns pointwise vanishing into vanishing of the sheaf maps. The remaining map v:(ω_((Gᵒᵒ)ᴰ))∨→ω_(Gᵒᵒ)^p is an isomorphism. Define the secondary determinant section from v^(p−1), the determinant comparison under Cartier duality, and the (p+1)st power of the multiplicative Hasse section. It lies in (det ω_G)^(p²−1), is a unit on this rank-one locus, commutes with reduced base change, and obeys Cartier duality through the same determinant comparison. The connected height-three boundary object obtained by deleting the étale quotient has the same differential section; no height-four duality assertion is inferred for it (P20 §6.3.2, pp.30–31; P20 line 1345).

On a normal reduced base with generically these ranks, impose the rank-one Hasse–Witt condition: the kernel in ω_G is a line subbundle and direct factor. Prove extension of the secondary section there. On the actual genus-two compactified nonordinary Cartier divisor, prove its boundary extension, prime-to-p Hecke equivariance and nonvanishing on every irreducible component. Prove the divisor is Cohen–Macaulay and has no embedded associated components; conclude multiplication by this section is injective on its locally free coefficients. On the compactified nonordinary divisor in odd characteristic the secondary section is a unit on the rank-one open and vanishes along the reduced supersingular curve to order two (its square root, of weight (p²−1)/2, vanishes to order one), so its zero scheme is not silently identified with that reduced curve. Here I_(1,1) denotes the height-two dimension-one local-local BT₁ of a supersingular elliptic curve. The theta and level-descent arguments use the resulting geometric section with its actual multiplicity (P20 §§6.3.3–6.4 and Remark 6.4.1, pp.31–37; CG20 proof of Lemma 7.5, pp.849–850; P20 line 1374 and line 1652, CG20 line 1910 and line 1936).

The secondary section has the following interfaces.

- Its determinant exponent is p²−1 and its formation commutes with morphisms of reduced bases preserving the indicated filtration.
- Passing from G to Gᵒ preserves the section under the invariant-differential comparison, and in height four the Cartier-dual determinant isomorphism carries it to the dual section.
- Its extension to the stated compactified Cartier divisor is a nonzerodivisor, and multiplication respects the away-p level correspondences and trace.

**Checks.**

- For μₚ⊕I_(1,1)⊕ℤ/p over an algebraically closed field, the primary Hasse section is 0 while the secondary section is a unit; deleting ℤ/p keeps the same invariant differentials.
- The determinant exponent contributed by the multiplicative factor is (p−1)(p+1)=p²−1: at p=5 it is 24, not 4.
- On k[ε]/(ε²) the endomorphism multiplication by ε is zero at the unique geometric point and is nonzero as a sheaf map. This base is outside the reduced-base pointwise argument.
- In k[x,y]/(xy), x is zero on an entire component and kills y; mere reducedness would not prove the asserted nonzerodivisor property.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1–R07.2 for the multiplicative-connected filtration and BT₁ crystal; HodgeTateAndCanonicalSubgroups §§0.14–0.15 for the primary section; AutomorphicBundles Layers 5, 11–12; ShimuraCompactifications Layer 7 for the actual smooth genus-two and boundary models; §3.1 for primary Hasse normalization. The section and extension theorem, rather than an unrestricted nonreduced BT₁ theory, are the new targets here.

### 3.3 Selected annihilator quotients

For the selected finite-level module Hμ,m^sel specialize the supplied action-annihilator to Jμ,m^sel=Ann(Tμ^sel,Hμ,m^sel), and its enlarged-image counterpart. The regular-weight comparison uses the composite e′β∘Aˢ on the β-part. Once this composite is proved injective, it induces a surjection from the high-weight Hecke image to Tμ^sel/Jμ,m^sel for the operators whose actions intertwine. The target ideal is the annihilator of the selected module, not that of the full coherent module.

(CG20, Remark 6.5, p.837; proof of Theorem 6.13, pp.842–843; selected-annihilator correction; CG20 line 1483.)

Define the annihilator using the actual action on the named summand. For regular β-parts prove injectivity on the socle using the residual p-operator formulas, and then on the finite local module. Factor the intertwining action through the image quotient; show surjectivity on the specified generating operators. In singular weight postpone the corresponding injection until §4.8.

The construction has the following interfaces.

- An operator belongs to J exactly when it annihilates every vector of the selected O/ϖᵐ module.
- Compatible finite-level actions give the correct transition homomorphisms of image quotients.
- An injective intertwiner induces the specified surjection onto the selected image quotient.

**Checks.**

- For T=k×k acting diagonally on k², restriction to the selected first coordinate line ke₁ has kernel Ann_T(ke₁)=0×k and selected image Tsel≅k, on which ke₁ is faithful, so Jsel=Ann_Tsel(ke₁)=0; the full annihilator Ann_T(k²) is also 0. The kernel 0×k is an ideal of T, not of Tsel. For a nonzero finite-level annihilator take Tsel=O acting on Hsel=O/ϖᵐ: then Jsel=ϖᵐO and Tsel/Jsel=O/ϖᵐ.
- For a zero selected module the annihilator is the entire ring and the selected image quotient is the zero ring.
- An injective linear map that does not intertwine a chosen generator supplies no image-algebra surjection for that generator.

Do not claim that Aˢ alone preserves the β-summand, or that the full p-characteristic-polynomial identity descends by away-p equivariance.

*Needs:* §1.2; §3.1; IntegralHeckeAndGaloisDeterminants §§2.1–2.3.

### 3.4 Central characters and residual Galois systems

For every non-Eisenstein maximal ideal of the anemic image in Layer 1, ModularityAndLanglandsExtensions §3.30 supplies a continuous semisimple residual GL₄ representation matching the good-prime spin polynomial, unique up to isomorphism, and, when it is absolutely irreducible, its nondegenerate alternating pairing. The target here is that this pairing carries the full prescribed central multiplier and that the realization transports along the selected and enlarged image maps. Its pullbacks along T→T̃ and ordinary/selected image maps have the same residual representation. The central character is constructed independently from the full spherical central operators, not inferred from the determinant square.

(CG20, Proposition 6.6, pp.837–838; Proposition 6.8 and Lemma 6.9, pp.838–840; Definition 6.11, p.840; CG20 line 1500.)

Import the residual realization and its absolutely irreducible symplectic pairing from ModularityAndLanglandsExtensions §3.30, retaining its classification, coefficient, polarization and unitary-descent hypotheses; its weight lift to (a+t,b+t) with p−1 dividing t is the Hasse transfer of Layer 3. Layer 1 uses the corresponding matching-polynomial ideal only when this existence theorem is invoked. Do not assert that reducibility itself implies symplecticity. Interpolate the full central Hecke character from the spherical central operators and compare it with the multiplier of the imported pairing; transport the realization to the selected and enlarged image rings by the shared good polynomials.

**Checks.**

- For paired roots (1,2,3,6), multiplier 6 has determinant 36; its negative −6 has the same square and is not determined by that determinant.
- Over 𝔽₇, diag(1,2,3,4) has trace 3 and determinant 3. Its three pairings have products (4,6), (3,1) and (2,5), so none defines a common multiplier even after conjugacy; trace and determinant alone do not supply a symplectic pairing.
- The zero action image is the zero ring and has no maximal ideal; existence of a residual representation is quantified over actual maximal ideals.
- Starting at (a,b)=(2,2), a weight shift to (2+t,2+t) multiplies the multiplier by ε^(−2t), whose reduction is trivial exactly when p−1 divides 2t. At p=7 the imported Hasse shift t=6 gives ε̄^(−12)=1, while t=2 gives ε̄^(−4)≠1, so an arbitrary shift does not preserve the residual datum.

Keep Arthur/classification assumptions visible from Lemma 6.9 onward. Absolute irreducibility, not irreducibility over the residue field alone, is required for the integral reconstruction and unique pairing.

*Needs:* §1.1; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; IntegralHeckeAndGaloisDeterminants IHG.4; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; ModularityAndLanglandsExtensions §3.30; §3.3.

### 3.5 Regular-weight Hecke-valued Galois representation

For regular μ=(a,b), a≥b≥3, a non-Eisenstein maximal ideal with residual r̄, the prescribed tame level and labelled auxiliary primes, construct rβμ,m:GQ→GSp₄(Tμ(Q)β_m). It matches every good-prime spin polynomial away from S∪Q∪{p}; has multiplier χμ,0ε^(−(a+b−3)) with χμ,0 finite order and residually trivial; and is upper triangular at p with diagonal λ(dp,1), ε^(−(b−2))λ(dp,2), ε^(−(a−1))λ(dp,3), ε^(−(a+b−3))λ(dp,4), where dp,1≡β and dp,2≡α. After an odd-p square-root character twist it has the required weakly minimal away-p local conditions. The additional equality involving the complete Hecke polynomial at p is not included without a separate proof.

(CG20, Theorem 6.13(1)–(4) and proof, pp.841–844, restricted to the assertions transported by the proof; CG20 line 1652.)

At high regular weight use vanishing, a torsion-free characteristic-zero eigenform decomposition and the supplied regular Galois representations. The Hecke image embeds into the product of their integer rings. Import the regular-weight eigenform representations of CG20 Proposition 6.8 (existence, crystalline at p with Frobenius polynomial Qp, ordinary shape, symplectic pairing, local–global compatibility) from the automorphic Galois suppliers. Descend traces and the full multiplier into the integral image by the IntegralHeckeAndGaloisDeterminants §1.5 odd-p symplectic descent theorem; pass to selected finite-quotient image rings. Obtain the ordered ordinary characters from the regular ordinary theory, carrying their four cyclotomic exponents. Take the compatible inverse limit and use the unique finite-character square root congruent to 1 to fix the multiplier; verify weak minimality prime by prime, including unramifiedness at q.

**Checks.**

- The four cyclotomic exponents at (a,b)=(4,3) are 0,−1,−3,−4; paired sums are −4, as required by ε^(−4).
- At b=2 the first two exponents both become 0, so the regular theorem cannot supply the two independent lines without doubling.
- Over k² let the two named away-p generators act identically in two models but let an extra p-generator be 0 in one and 1 in the other; away-p intertwining proves no equality for the extra generator.

The proof must identify the local characters on the selected quotient; a p-polynomial identity requires more than a good-prime trace descent. Do not use the unproved torsion-freeness expectation of Remark 6.14.

*Needs:* §3.3; §3.4; §2.4; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants IHG.4; LocalGaloisDeformationRings §§2.7, 2.25 and §6.3; AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5; AutomorphicGaloisRepresentationsPartII AG2.6; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26.

### Examples

With p=7, m=2, μ=(4,2) and the chosen lift of hʳ, take s=7t₀ for a positive t₀ large enough for the level-dependent vanishing threshold. The shift is 42rt₀ and μ′=(4+42rt₀,2+42rt₀), of difference 2. On a selected one-dimensional residual action with T=k×k acting through the first factor, the selected image is Tsel=k=(k×k)/(0×k) and its annihilator ideal is 0, so the selected image quotient is k, rather than k×k. Thus the Hasse shift and the selected-image quotient retain different pieces of data.

### Dependencies

AutomorphicBundles Layer 11; ShimuraData §§5.9–5.10, 5.18; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; AutomorphicGaloisRepresentationsPartII AG2.P, AG2.5; AutomorphicGaloisRepresentationsPartII AG2.6; Layer 1; Layer 2; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; IntegralHeckeAndGaloisDeterminants IHG.4; LocalGaloisDeformationRings §§2.7, 2.25 and §6.3; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; ShimuraCompactifications 7.13–7.18; AutomorphicBundlesPartII Layer 5; ModularityAndLanglandsExtensions §3.30. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 4: Cuspidal Fourier doubling

Specialize the formal U,Z,Z₂,X₂ operators and Hasse spaces in characteristic p. Prove ordinary-envelope control and the two kernel systems. Use corrected scalar/vector theta inputs, an all-index contraction obligation and a separately checked scalar recurrence to obtain both root-labelled Hasse-projection injections. Keep all needed weight bounds and restrict the minimal-discriminant argument to cuspidal forms.

### 4.1 Formal operators in the doubling argument

Work over k of odd characteristic p, with tame level prime to p and trivialized auxiliary Nebentypus, in weights (j,2) with j≥4 or j=2. Let q-series have coefficients in Sym^(j−2)(k²), indexed by p-integral positive-semidefinite binary forms Q with bounded tame denominators and the prescribed Γ-equivariance. Set a(UF;Q)=a(F;pQ). For integral representatives M of Γ diag(p,1) Γ, set a(ZF;Q)=ΣM Sym^(j−2)(M)a(F;M⁻¹·Q), interpreting nonintegral indices as zero, where M·Q=det(M)⁻¹MQMᵗ. Put Z₂=UZ and a(X₂F;Q)=(disc(Q)/p)a(F;Q). An integral binary-form index Q is p-primitive when its three coefficients are not all divisible by p; this is a condition on the index, not on a series over k.

(CG20, §§8.1–8.3, Theorem 8.1, Lemmas 8.3–8.6 and Definition 8.7, pp.856–859; CG20 line 2273.)

Import the general Fourier-series, q-expansion and symmetric-power coefficient APIs from AutomorphicBundlesPartII through the Hasse and p-action contracts. Define these specialized operators by the displayed finite sums and coefficient functions, and prove independence of the double-coset representatives. Use the discriminant of the binary form consistently; the Legendre multiplier is zero when p divides the discriminant. Use the Fourier-index formulas to prove Z₂X₂=0, UX₂=0 and X₂³=X₂ in characteristic p.

For Q=[[m,r/2],[r/2,n]], use d(Q)=r²−4mn in every Legendre symbol. The finite-index action and the dual coefficient action are fixed together before taking reduction; a p-divisible discriminant does not mean all three coefficients are divisible by p.

The construction has the following interfaces.

- Give the U,Z,Z₂,X₂ coefficient formulas at each index.
- Prove Z₂=UZ, Z₂X₂=0, UX₂=0 and X₂³=X₂ over k.
- Show Γ-equivariance makes the finite-sum Z action independent of coset representatives.

**Checks.**

- Over F₅, X₂ multiplies a coefficient of discriminant 1 by 1, of discriminant 2 by −1, and of discriminant 0 by 0.
- A series supported at pQ contributes its coefficient to a(UF;Q), not to a(UF;p²Q).
- The binary-form index with coefficients (1,0,p) is p-primitive but has discriminant divisible by p; these conditions must not be conflated.

Do not assert that every formal series is modular. The modularity of T and Q₂ is a separate supplied geometric result.

*Needs:* AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; §1.1.

### 4.2 Theta operators with corrected weights

For p>3 construct the scalar theta operator Θ with Fourier multiplier det(Q) and its injectivity in the range 2≤k≤p+1, p∤k(2k−1), excluding k=p−1. For p>3, j≥k+2≥4 and j−k<p−2, construct the vector operator θ₁ from weight (j,k) to (j+p−1,k+p+1) with coefficient con(a(F;Q)⊗Q), with no extra determinant factor. Its target symmetric degree is j−k−2. Separately prove injectivity at k=2 and p−1>j≥4 for the doubling application. These are geometric operator and injectivity targets of this subsection; the scalar Hasse exception and vector coefficient normalization are part of their statements.

The two characteristic-p operators have the following interfaces.

- In their respective construction ranges they are linear over the residue field and preserve cuspidality, with scalar weight shift (p+1,p+1) and vector shift (p−1,p+1).
- Scalar coefficients are multiplied by det(Q); vector coefficients use the fixed dual-basis contraction, with no additional determinant. The change-of-frame identities put these expressions in the indicated target coefficient bundles.
- Extension of residue fields commutes with both constructions, their Fourier formulas and the stated injectivity comparisons in the same weight ranges.

(CG20, Proposition 8.9 and Theorems 8.10–8.11, pp.861–863, with the scalar Hasse exception and vector-formula correction; CG20 line 2402. Construction: Yam14 §3.3, Propositions 3.5–3.10 and 3.13, pp.17–25, with Proposition 3.8 for the two-derivative scalar operator; Yam14 line 901, line 1164, line 1246 and line 1327. Superspecial restriction: Yam14 Theorem 4.7, p.42; Yam14 line 2205.)

The proof is ordered in three steps, each a target of this subsection.

1. *Ordinary-locus operators.* On the ordinary locus of the smooth genus-two model over k, where the Hasse determinant is a unit, split the rank-four H¹_dR as the rank-two Hodge bundle ℋ plus its unit-root complement, the rank-two Frobenius-stable image. A projected derivative is the Gauss–Manin connection followed by the inverse of the Kodaira–Spencer isomorphism and the projection along the unit-root summand; it carries a section of a bundle built from ℋ into that bundle tensored with Sym²ℋ. The vector operator θ₁ is one projected derivative from Sym^(j−k)ℋ⊗detᵏℋ followed by the contraction Sym^(j−k)ℋ⊗Sym²ℋ→Sym^(j−k−2)ℋ⊗det²ℋ, so its Fourier multiplier is linear in the index. The scalar operator Θ is of second order: the first projected derivative takes detᵏℋ into detᵏℋ⊗Sym²ℋ, the second takes this into detᵏℋ⊗Sym²ℋ⊗Sym²ℋ, and the Schur projection onto the summand detᵏ⁺²ℋ of Sym²ℋ⊗Sym²ℋ, which needs p>3, finishes; normalize so that the Fourier multiplier is det(Q), which is quadratic in the index. Prove the first-order and second-order change-of-frame laws, so that both results are well-defined maps of the indicated automorphic bundles (Yam14 Propositions 3.5, 3.7 and 3.8; Yam14 line 1093, line 1144 and line 1164).
2. *Pole cancellation and extension.* Prove that multiplying by the Hasse invariant cancels the poles of the unit-root projection along the nonordinary divisor, for the one-derivative vector operator and, through the second-order identities for the derivatives of the Hasse determinant, for the two-derivative scalar operator with the same single Hasse factor, and that the product extends holomorphically across the boundary of the toroidal compactification through the logarithmic Kodaira–Spencer isomorphism. Do this by a connection calculation on a smooth formal deformation base before any truncation. The partial derivatives ∂/∂t_ij are not R-valued derivations of R=k[[t₁₁,t₁₂,t₂₂]]/𝔪², since D(t₁₁²)=2t₁₁≠0 there although t₁₁²=0 (Yam14 line 1235); the square-zero shortcut is not used. Then compute the displayed Fourier formulas on the Mumford family, where the Hasse matrix is the identity.
3. *Injectivity.* Prove scalar injectivity from the superspecial restriction of a form not divisible by the Hasse invariant, the restriction bounds along the Hasse strata and the Cartier-divisor description of the supersingular locus inside the nonordinary divisor from §3.2. Prove vector injectivity in the stated range by the same restriction to strata.

Import the Gauss–Manin connection from AbelianSchemesAndArithmeticModuli A4.3 and the logarithmic Kodaira–Spencer isomorphism from ShimuraCompactifications 7.12; the unit-root projection, the theta extension and both injectivity statements are local targets here. Separate the scalar determinant multiplier from the vector contraction; the contraction is a nonzero integral transvectant in the valid coefficient range. Test Θ on the Hasse invariant to exclude the erroneous k=p−1 case; for the scalar-weight argument use precisely k=p+1.

**Checks.**

- On scalar Fourier coefficients, determinant 1 carries coefficient 1 to 1, determinant 0 carries it to 0, and the zero coefficient stays 0; these values distinguish scalar theta from the vector contraction.
- The scalar multiplier is quadratic in the index: at p=7, Q=I gives det(Q)=1 and 2I gives 4, whereas a single projected derivative scales the index linearly and would give 2 at 2I. A one-derivative recipe cannot produce the scalar operator; the vector contraction, whose p=7 model doubles 5 to 3=2·5, is first order.
- In the p=7 contraction model, scaling the input coefficient by 2 changes contraction 5 to 3=2·5, while the zero input gives 0; field extension preserves these values.
- At scalar k=p−1, the nonzero Hasse series 1 has theta equal to 0; this excludes an injectivity statement at that weight.
- At p=7,k=p+1=8, k(2k−1)=120≡1 modulo 7, so the scalar arithmetic exclusion is satisfied.
- At p=7, (j,k)=(2,2) would give target (8,10) of symmetric degree −2, so it is excluded from the vector construction. The input (4,2) satisfies 2<5 and gives (10,10) of symmetric degree 0.
- At p=7, (j,k)=(6,2) satisfies the construction bound 4<5, but fails the separate injectivity bound 6<6.
- On the ordinary locus the Hasse determinant is a unit and the unit-root projection is defined; at a superspecial point it is zero, so step 2 is a genuine extension theorem. At p=7 a rank-one index has contraction 5 and determinant 0, so the Fourier formulas alone cannot supply that geometric extension.
- For (j,k)=(4,2) the vector target weight is (p+3,p+3). With the elementary contraction normalized by con(e₂²⊗f₁²)=−2 in dual bases, a rank-one index f₁² at p=7 gives contraction 5 and determinant 0; the extra determinant factor would change 5 to 0 (CG20 p.877; CG20 line 2951).

The vector contraction has no determinant prefactor, and all stated theta identities are in characteristic p.

*Needs:* §4.1; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; AutomorphicBundles Layers 5, 11–12; AbelianSchemesAndArithmeticModuli A4.3; ShimuraCompactifications 7.12; ShimuraCompactifications 7.13–7.18; §3.1; §3.2.

### 4.3 The source and enlarged q-expansion spaces

Let M be the q-expansions of the localized selected cuspidal weight-(j,2) k-space and let N be its Hasse embedding into a sufficiently regular modular-form space, viewed in the same formal coefficient space because h has expansion 1. Keep the finite-dimensional ambient Hecke-stable space and its U-generalized decomposition N=Nα⊕Nβ⊕N₀. Let πβ be the normalized idempotent projection onto Nβ. A power of U−α can have the same kernel in the relevant subspace, but is not defined to be πβ.

(CG20, §8.6, Theorem 8.13 and Lemmas 8.15–8.17, pp.864–870; CG20 line 2525.)

Use the q-expansion principle to regard Hasse multiplication as an inclusion of the same coefficient vectors. Enlarge to a finite-dimensional U-stable modular space before discussing generalized eigenspaces. Import the ordinary regular root calculation to prove that U(U−α)(U−β) acts nilpotently; use distinct α,β,0 to split N.

The construction has the following interfaces.

- The source coefficient vector equals its Hasse-multiplied vector in N.
- Decompose N as its α, β and zero generalized U-parts, with sum of normalized projections equal to 1.
- Identify ker πβ as Nα⊕N₀ and give the corresponding kernel criterion for powers of U−α on the relevant ordinary subspace.

**Checks.**

- A nilpotent Jordan block for U lies in N₀ even though its nonzero vectors need not be killed by U itself.
- On a β-eigenvector, πβ acts by 1; (U−α)ᵐ acts by (β−α)ᵐ, which need not equal 1.
- The construction records an ambient U-stable envelope instead of asserting U(M)⊂M.

The input M need not be U-stable; every use of U iteration must take place in its finite U-stable envelope.

*Needs:* §1.2; §3.1; §4.1; Mathlib `Module.End.genEigenspace`.

### 4.4 Invertible Q₂ and the U-ordinary envelope

For the spaces M⊂N of Layer 4, use T=U+Z and, in characteristic p and weight (j,2), Q₂=Z₂ for j>2 and Q₂=Z₂+X₂ for j=2. If Q₂ is invertible on M, then for j>2 M is contained in the U-invertible part of N. For j=2, Z₂ is injective on M and its image is contained in the U-invertible part. The proof uses W=Σi≥0UⁱM, which is finite-dimensional and U-stable, and Z₂W⊂UW.

(CG20, Lemma 8.15 and proof, pp.867–868; Lemma 8.16, p.868; CG20 line 2623.)

Enlarge M to W and use UZ=Z₂ with commutation of U and Z₂ to obtain Z₂W⊂UW, then iterate inside W. For j>2 use invertibility of Q₂=Z₂ to place M in ∩nUⁿW. For j=2 use X₂³=X₂, Z₂X₂=0 and the eigenvalue Q₂=αβ with (αβ)²≠1 to deduce injectivity of Z₂, before applying the same envelope argument.

**Checks.**

- On a nilpotent two-dimensional U-block, ∩ UⁿW=0; on an invertible two-dimensional block, that intersection is W.
- If Z₂F=0 in scalar weight, Q₂F=X₂F=cF implies (c³−c)F=0. For c=6 in 𝔽₁₁, c³−c=1, so F=0; c=1 would give 0 and is excluded.
- A space spanned by e₁ with Ue₁=e₂ is not U-stable; its U-stable envelope has dimension 2. Iteration on the first space alone is undefined.

Do not use Q₂-invertibility on a larger unrelated space; the envelope argument repairs the missing stability step.

*Needs:* §4.3; §4.1.

### 4.5 Contraction on all Fourier indices

For j≥4 in the theta range, prove the formal characteristic-p identity θ₁(ZF)=0 for every Γ-equivariant integral q-expansion of weight (j,2), including coefficients whose discriminant is divisible by p. This is the all-index coefficient theorem needed by cuspidal doubling; CG20 Proposition 8.25 motivates the contraction calculation. Its proof obligation is the integral transvectant equivariance identity: contraction of Sym^(j−2)(M)v against M·Q equals det(M) times the transported contraction of v against Q, in the exact dual-form convention, when det(M)=p.

(CG20, Proposition 8.25, contraction claim and proof, pp.876–877; Proposition 8.9, p.861; CG20 line 2925.)

Write the contraction in the chosen binary-form coordinates over Z localized away from the required factorial denominators. Verify the GL₂ covariance with the precise determinant-normalized action on indices and the dual/contraction conventions; reduce modulo p only after clearing justified denominators. Apply the identity term by term to the finite Z sum for every index, not only a minimal-discriminant coefficient. The all-index annihilation is a proof obligation of this subsection, including singular discriminants; §8.2 has §4.5 among its premises.

Retain the exact source and target coefficient representations: θ₁ maps weight (j,2) into (j+p−1,p+3). The intended integral identity is required for the actual transported coefficient in each summand of Z, with all factorial denominators units under p−1>j≥4; it is not a theorem about arbitrary unrelated binary forms and vectors.

**Checks.**

- For det(M)=p, the integral covariance has a factor p, hence its reduction is 0 even at indices with d(Q)≡0 modulo p. A proof dividing by d(Q) cannot handle Q=(1,0,p).
- At Q=(1,0,p), d(Q)=−4p and det(Q)=p; both reduce to 0 although Q remains p-primitive.
- At p=7 the discriminant multipliers for Q=diag(1,1) and Q=diag(1,2) are −1 and −1, while the Legendre symbols (det(Q)/7) are 1 and 1; the same sign convention is required before contraction is reduced.

This target is a proof obligation, not a claimed new proof of Proposition 8.25. A vanishing contraction at one chosen Fourier index does not imply θ₁F=0.

*Needs:* §4.2; §4.1.

### 4.6 The two constrained kernel systems

A nonzero kernel of πβ∘h on the selected source yields a nonzero constrained vector after simultaneous finite-dimensional spectral reduction. For j>2, take F with UF=αF, TF=(α+β)F and hence ZF=βF. For j=2, write F=Fα+F₀ with UFα=αFα, UF₀=0, X₂F=αβF₀ and ZF=βF+αF₀, while Q₂F=αβF. These are consequences for a reduced kernel vector, not equalities asserted on every generalized eigenvector.

(CG20, Lemma 8.17 and proof, pp.868–871; CG20 line 2660.)

Use the commuting selected Hecke action on the nonzero kernel to pass to a simultaneous eigenvector over a splitting field. In j>2 eliminate N₀ with the ordinary-envelope theorem and identify the remaining α-eigenvector. In j=2 retain the zero-root component and derive its X₂ and Z relations from the formal operators; never discard F₀ without proof.

**Checks.**

- For j>2, UF=αF and (U+Z)F=(α+β)F give ZF=βF by subtraction, not αF.
- For the scalar decomposition, UF=αFα and ZF=βFα+(α+β)F₀ give TF=(α+β)(Fα+F₀); deleting F₀ changes the zero-root coordinate.
- On the α-Jordan block [[α,1],[0,α]], the generalized α-vector e₂ has Ue₂=αe₂+e₁, so the eigenvector equalities apply only after spectral reduction.

The scalar-weight system contains the extra αF₀ term; omitting it would falsely simplify the hardest case.

*Needs:* §4.4; §4.3.

### 4.7 Vanishing of constrained cuspidal vectors

Under the root condition and p−1>j≥4, a cuspidal vector satisfying UF=αF and ZF=βF vanishes, using §4.5 and theta injectivity. In weight (2,2), a cuspidal vector satisfying the full scalar system of §4.6 also vanishes. The statement is restricted to cusp forms, so the minimal-discriminant argument starts with a positive-definite coefficient and does not assume a nonzero discriminant for an arbitrary noncuspidal series.

(CG20, Theorem 8.22 and §§8.7–8.9, pp.873–877, with the cuspidal restriction and scalar correction; CG20 line 2818.)

For j>2 use βθ₁F=θ₁ZF=0 and β≠0, then the vector theta injectivity of §4.2. The all-index contraction obligation must be discharged first.

Before the scalar vanishing argument, prove neighbor reciprocity at the actual tame level. For the double coset Δ=Γ diag(p,1) Γ, define the forward neighbor multiset F_Δ([Q]) of Γ-classes of p-integral binary forms, as in CG20 Definition 8.19 with M ranging over Δ, and the reverse multiset F_Δ∨ for Δ∨={pM⁻¹ : M∈Δ}. Prove [P]∈F_Δ([Q]) exactly when [Q]∈F_Δ∨([P]). At a general neat tame level Δ∨=Γ diag(1,p) Γ is a second correspondence. For Γ⊇Γ(N) with p∤N, with H the image of Γ in SL₂(ℤ/N) and N(H) its normalizer, Δ∨ equals nΔn′ for some elements n,n′ of SL₂(ℤ) normalizing Γ exactly when diag(1,p)∈N(H) diag(p,1) N(H) modulo N, because a Γ(N)-double coset of an integral matrix of determinant p is determined by its residue modulo N (the stabilizer SL₂(ℤ)∩M SL₂(ℤ)M⁻¹ of such an M is a conjugate of Γ₀(p) and maps onto SL₂(ℤ/N)); the identifications Δ∨=Δ, Δ∨=nΔ, Δ∨=Δn′ and Δ∨=nΔn⁻¹ are the cases n′=n⁻¹=1, n′=1, n=1 and n′=n⁻¹. The identification holds at principal level by conjugation and at Γ₁(N)-type level by a one-sided diamond composition, and it fails for every n,n′ at a level whose residual group is a nonsplit torus (Checks), so no such identification is assumed. Keep both correspondences. Construct the forward and reverse maps between the Fourier-coefficient spaces of the relevant level and cusp, with their actual tame Hecke and diamond actions, and derive the two-correspondence recurrence for the coefficients of F from the actions of Δ and Δ∨ on the selected eigenspace. Deduce the scalar exclusion that the minimal-discriminant step needs from the stated arithmetic data, the root condition of §0.1 and in particular β²≠1 and (αβ)²≠1, as an explicit premise of the scalar endpoint; the two-correspondence recurrence and this deduction are targets of this subsection. A same-level transport of Δ∨ to Δ by normalizing elements is used only at a level where the double-coset identity Γ diag(1,p) Γ=n Γ diag(p,1) Γ n′ has been proved, as at principal level, where every element of SL₂(ℤ) normalizes Γ(N) and n=[[0,1],[−1,0]], n′=n⁻¹ works, or at Γ₁(N)-type level, where n≡diag(p⁻¹,p) modulo N, n′=1 works. All neat tame levels are retained (CG20 Definition 8.19 and Lemma 8.20, p.872, whose same-correspondence symmetry holds at full level SL₂(ℤ) only; CG20 line 2773 and line 2793).

For the scalar case show coefficients at nonsquare discriminants vanish by the transported neighbor recurrence and β²≠1; handle p-divisible discriminants via a minimal positive discriminant and a p-primitive neighbor argument. Represent the scalar difference F−X₂F in weight (p+1,p+1) by hF−hQ₂F+Q₂(hF), then use the scalar theta injectivity at k=p+1. Do not claim that X₂F is modular of weight (2,2). Conclude F=X₂F; UX₂=0 and the retained scalar kernel relations, together with (αβ)²≠1, force F=0. Neighbor cycles and Lemma 8.24 supply checks on the coefficient recurrence, not a substitute for all-index contraction.

**Checks.**

- With β=3 in 𝔽₁₁, βθ₁F=0 gives θ₁F=0 because 3·4=1; β=0 would not.
- The constant series has only discriminant 0 and no positive-definite leading index; cuspidality excludes it from the minimal-positive-discriminant argument.
- At p=7 the scalar comparison has weight (8,8), rather than (2,2); its Hasse factor has weight (6,6) and expansion 1.
- At Γ(5) and p=7 take Q=7x²+y² and P=x²+7y²=D⁻¹·Q with D=diag(7,1), both positive definite of discriminant −28. Every M∈Γ(5)DΓ(5) is congruent to diag(2,1) modulo 5, so every forward neighbor of P reduces to 3x²+4y² modulo 5; for M=[[2,5],[35,91]] it is 1208x²−930xy+179y². Γ(5)-equivalence preserves coefficients modulo 5 and Q reduces to 2x²+y², so Q is not a forward neighbor of P. The transport by diag(3,2)≡diag(7⁻¹,7) in SL₂(ℤ/5) carries 3x²+4y² to 27x²+16y²≡2x²+y², recovering Q’s residue class; this transport exists because the residual level subgroup of Γ(5) is trivial.
- Let Γ=Γ(3)∩Γ₁(5), neat with tame level 15, and p=7, so that modulo 5 the residual group is the unipotent group H₁ of order five, whose normalizer is the Borel subgroup B. For n̄∈B the conjugate n̄Dn̄⁻¹ of D=diag(2,1) is upper triangular with (1,1) entry 2, hence so is every element of H₁(n̄Dn̄⁻¹)H₁, while D∨=diag(1,2) has (1,1) entry 1: Δ∨ is not nΔn⁻¹ for any n normalizing Γ. Yet n̄=diag(3,2)=diag(7⁻¹,7) modulo 5 normalizes H₁ and n̄D=D∨, so Δ∨=nΔ for n≡I modulo 3, n≡diag(3,2) modulo 5, the diamond action; excluding conjugation alone does not make Δ∨ a second correspondence.
- Let Γ be the subgroup of SL₂(ℤ) of matrices congruent to I modulo 3 whose reduction modulo 5 lies in the cyclic group H of order six generated by A=[[0,1],[4,1]], neat with tame level 15, and p=7, so D=diag(2,1) and D∨=diag(1,2) modulo 5. The six candidates n_j=D∨A^(−j)D⁻¹ conjugate A to [[0,4],[1,1]] for j≡0,3, to [[3,2],[4,3]] for j≡1,4 and to [[4,1],[2,2]] for j≡2,5 modulo 6, none of which is A or A⁻¹=[[1,4],[1,0]], so D∨∉N(H)DH, and likewise D∨∉HDN(H): no one-sided composition identifies Δ∨ with Δ. Yet n̄=[[0,2],[2,0]] has determinant −4≡1 and n̄An̄⁻¹=A⁻¹, so n̄ normalizes H, and n̄Dn̄⁻¹=D∨; hence Δ∨=nΔn⁻¹ for n≡I modulo 3, n≡n̄ modulo 5, and excluding one-sided compositions alone does not make Δ∨ a second correspondence either.
- Let Γ be the subgroup of SL₂(ℤ) of matrices congruent to I modulo 3 whose reduction modulo 13 lies in the nonsplit torus T={[[x,2y],[y,x]] : x²−2y²=1} of order fourteen (2 is a nonsquare modulo 13), neat with tame level 39, and p=7, so D=diag(7,1) and D∨=diag(1,7) modulo 13. The normalizer of T in SL₂(𝔽₁₃) is T together with the fourteen matrices [[x,2y],[−y,−x]] with x²−2y²=−1, so each of its 28 elements has diagonal entries (a,±a). If nDn′=D∨ with n,n′∈N(T), then n′⁻¹=D∨⁻¹nD=[[7a,b],[c,2d]] lies in N(T), so 2d=±7a with d=±a, hence 5a=0 or 9a=0 and a=d=0; then n=[[0,2y],[±y,0]] has determinant ∓2y²=1, so y²∈{6,7}, and neither is a square modulo 13 (the squares are 1,3,4,9,10,12). So D∨∉N(T)DN(T), Δ∨ is not nΔn′ for any n,n′ normalizing Γ, and the two-correspondence recurrence is required at this level; the same computation with determinant ±1 covers the normalizer of Γ in GL₂(ℤ).

The theta weight is exactly p+1 in the scalar step; an arbitrary large Hasse shift is not interchangeable with it. The scalar p-primitive/minimal-discriminant recurrence is part of this vanishing target and a premise of §4.8.

*Needs:* §4.6; §4.5; §4.2.

### 4.8 The two Hasse-projection injections

For cuspidal weight (j,2), j=2 or 4≤j<p−1, residual roots satisfying Layer 0 and the chosen non-Eisenstein eigensystem, the maps from the selected source to the regular β-part given by e′β∘Aˢ are injective, and likewise with α and β exchanged. This holds at the stated finite coefficient quotients after lifting the residual injectivity through the torsion filtration. It is conditional on the corrected Fourier contraction and scalar kernel obligations recorded in Layer 4.

(CG20, Theorem 8.13, pp.864–865; reduction pp.867–873; proof completed pp.874–877; CG20 line 2525.)

Reduce a nonzero kernel modulo ϖ to the constrained systems of §4.6. Apply cuspidal kernel vanishing in the two distinct weight regimes. Lift injectivity using successive ϖ-torsion layers and repeat after exchanging the roots. Use these actual composite injections, rather than bare Hasse multiplication, to obtain the selected image-algebra quotient maps.

**Checks.**

- On the residual roots 2,3 in 𝔽₁₁ the two selected projections have distinct labels; exchanging them exchanges the two injections.
- Over O/ϖ² a nonzero kernel vector divisible by ϖ gives a nonzero residual torsion-layer kernel; it cannot be dismissed merely because its direct reduction is zero.
- A Hasse inclusion followed by the zero projector is zero on a one-dimensional source; injectivity must concern the actual composite.

Both root-labelled injections are required by the unramified-plane argument; a single ordinary line is insufficient.

*Needs:* §4.7; §3.3.

### Examples

At p=11 take α=2, β=3 and j=4. The root product is 7 and 4<10, so vector theta injectivity applies. A constrained kernel vector has UF=2F and ZF=3F. The all-index identity of §4.5 gives 3θ₁F=0, hence θ₁F=0 since 3·4=1 modulo 11; injectivity gives F=0. This combines the constrained system, contraction and theta targets.

### Dependencies

AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; Layer 1; Layer 3; Mathlib `Module.End.genEigenspace`; AbelianSchemesAndArithmeticModuli A4.3; ShimuraCompactifications 7.12. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 5: Nonregular Hecke-valued minimal deformations

Use the two independent ordinary lines in the same reconstructed representation to obtain its invariant unramified isotropic two-plane. Construct compatible selected finite-quotient Galois deformations, normalize the full multiplier and pass to the inverse limit. Verify every minimal local condition before invoking the universal classifying map.

### 5.1 The unramified ordinary two-plane

Over each selected finite Hecke quotient in weight (a,2), the regular α- and β-ordinary constructions yield two unramified rank-one local subrepresentations whose reductions are the two specified independent residual lines. They span a rank-two direct summand, invariant and unramified at p, and the symplectic pairing vanishes on it. Thus the two lines yield the precise ordinary local condition in CG20 Definition 4.6(6), not just two unrelated subquotients.

(CG20, Theorem 6.17 and proof, pp.845–846; CG20 line 1789.)

Use the two selected quotient maps to identify the global Galois representation uniquely, then regard both local lines inside this same representation. Residual independence and Nakayama imply that their sum is a direct summand; verify compatibility with coefficient quotient transitions. Use the fixed symplectic multiplier and the residual tame-character separation ensured by p−1>a to prove isotropy. Identify the quotient characters by the pairing and preserve the source ordinary ordering.

**Checks.**

- Modulo ϖ the vectors e₁,e₂ have two-by-two minor 1; any lifts keep a unit minor and span a rank-two direct summand.
- Two vectors reducing to e₁ and e₁ have minor 0, so the two-line conclusion requires residual independence.
- With cyclotomic exponent 1−a and p−1>a, inertia on the multiplier is nontrivial while it is trivial on the unramified plane; equivariance forces its restricted pairing to be 0.

Two unramified characters appearing only as semisimplified constituents do not suffice; actual stable submodules and their independence are required.

*Needs:* §4.8; §3.5; §0.3; LocalGaloisDeformationRings §6.14; IntegralHeckeAndGaloisDeterminants §§1.1–1.7.

### 5.2 Minimal Galois deformation over the singular Hecke algebra

For a CG lifting datum with a=2 or 4≤a<p−1 and every labelled Q, construct a continuous rσ,m:GQ→GSp₄(Tσ(Q)αβ_m), σ=(a,2), lifting r̄, matching the good-prime spin polynomials and satisfying the fixed-multiplier minimal deformation condition outside Q. This includes the split unramified two-plane at p, weakly minimal inertia away p, unramifiedness at q, and inverse scalar inertia on the two isotropic Q-planes. Consequently the universal minimal-outside-Q ring RQ maps to this Hecke image. The theorem depends on the corrected doubling argument.

(CG20, Theorem 6.17, pp.845–846; Definition 4.6, pp.815–816; CG20 line 1789.)

Construct representations over the selected O/ϖᵐ image quotients by the two regular comparisons and absolute-irreducible reconstruction. Normalize the full multiplier with the compatible finite-character square root, which uses p odd. Check the p-condition via the actual two-plane theorem; check each away-p condition via the regular local representation and the finite scalar twist. Use uniqueness and compatible quotient actions to take the inverse limit, then invoke the supplied universal property of RQ.

**Checks.**

- At Q=∅ the universal classifying map has source Rmin; at one Q-prime it has source RQ and includes auxiliary scalar inertia.
- For the chosen ordering diag(χ,χ,χ⁻¹,χ⁻¹), both paired products are 1.
- At a=2, the unramified plane has rank 2 and both cyclotomic exponents are 0; using one ordinary line gives rank 1 and fails the local functor.

Do not identify a torsion-ring representation merely from a characteristic-zero product embedding. The ring map is not yet an isomorphism.

*Needs:* §5.1; §3.3; §3.4; GlobalGaloisDeformations G7 (the CG Selmer-presentation contract); LocalGaloisDeformationRings §§2.7, 2.25, 6.14 and §2.17; IntegralHeckeAndGaloisDeterminants IHG.4.

### Examples

For roots 2 and 3 over F₁₁, the two residual unramified lines are independent. Lifts of their generators therefore extend to a basis over each local Artin Hecke quotient by Nakayama, so their sum is a rank-two direct summand. Independence is essential: two copies of the same residual line give no such conclusion. Isotropy still uses the multiplier and the nontrivial residual cyclotomic separation, rather than this basis calculation alone.

### Dependencies

Layer 0; Layer 3; Layer 4; GlobalGaloisDeformations G7 (the CG Selmer-presentation contract); IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants IHG.4; LocalGaloisDeformationRings §§2.7, 2.25, 6.14 and §2.17. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 6: Klingen Taylor–Wiles level control

Construct the labelled Klingen block projector. Prove the high-weight integral pullback/trace comparison, with inverse (tr∘pr_Q∘i)⁻¹∘tr rather than the degree-normalized trace, descend through Hasse and secondary-Hasse strata with explicit H¹ reverse induction, and induct over O/ϖᵐ before passing to E/O. Separate this degree-zero comparison from the BCGP21 derived comparison and module-coinvariant supplier interface.

### 6.1 Klingen block projector and trace

For the labelled roots of §0.5, let Rx=(xUx,2−α′xγ′x)(xUx,2−β′xδ′x)(xUx,2−γ′xδ′x), and let prx be the compatible factorial-power projector of Rx onto its unit factors. Put prQ=∏x∈Qprx and define the level-raising map prQ∘i from hyperspecial to Klingen level. Let m be the maximal ideal generated by m∅, xUx,2−α′xβ′x, Ux,1−α′x−β′x and ⟨u⟩−1 for u∈ΔQ; without the diamond generators the quotient is only a finite k[ΔQ]-algebra. Use Rx consistently; an undefined R′x is not a separate operator.

(CG20, Theorem 7.2 and definition of prx, p.847; CG20 line 1843.)

Evaluate each polynomial factor on the possible Klingen Satake blocks using the supplied local calculation. Use the root and product separations to distinguish the desired unit block; apply the upstream factorial-power construction. Prove compatibility with pullback and trace and multiplicativity across different x.

The primes are distinct, the normalized operators commute, and every product separation of §0.5 is retained. The diamond augmentation generators force the residual diamond character to be trivial; a quotient of k[ΔQ] is not automatically a field.

The construction has the following interfaces.

- prQ squares to itself and commutes with good Hecke operators and the diamonds.
- For Q=∅, prQ is the identity.
- The image is exactly the labelled Klingen block, with all other Satake blocks killed.

**Checks.**

- Over 𝔽₁₁ take labelled roots (α,β,γ,δ)=(2,3,4,6), with paired products αδ=βγ=1. The four Klingen blocks have xUx,2 eigenvalues αβ=6, αγ=8, βδ=7 and γδ=2, so with Y=xUx,2 one has R(Y)=(Y−8)(Y−7)(Y−2), R(6)=(−2)(−1)(4)=8≠0 and R(8)=R(7)=R(2)=0. The factorial-power projector is 1 on the desired block and 0 on the other three; the zero projector fails the first value and the identity fails the other three.
- Over 𝔽₁₃ the roots (2,4,11,9) have αδ=βγ=5 but αβ=γδ=8, so R(8)=0 already on the desired block and the projector kills it; this refinement is excluded by the product separation of §0.5.
- For two primes acting on four simultaneous block lines with projectors diag(1,1,0,0) and diag(1,0,1,0), both products equal diag(1,0,0,0), the jointly selected line; a model sending every nonempty-prime projector to zero gives 0 instead.

The ideal m is the labelled block lying over the given residual system, not an arbitrary maximal ideal of the enlarged Hecke algebra. The diamond operators act trivially on H⁰(X₀(Q),·) and unipotently on the p-power covers, so adding ⟨u⟩−1 changes none of the localizations used later.

*Needs:* §0.5; §1.1; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; SmoothRepresentationsOfLocalGroups SR.1.4.

### 6.2 High-weight Klingen level comparison

For sufficiently regular shifted weight and the labelled non-Eisenstein block, prQ∘i is an isomorphism on cuspidal H⁰ at the base and Klingen levels. Its inverse is v_Q⁻¹∘tr, where v_Q=tr∘prQ∘i is a p-adic limit of spherical Hecke operators at the primes of Q and is congruent to 1 modulo m∅ under the Taylor–Wiles labelling; d_Q⁻¹tr, with d_Q=[K:K₀(Q)] the degree of X₀(Q)→X, is not an inverse. At each x the characteristic-zero no-newforms calculation is the Klingen no-newforms result of the Klingen level-comparison contract; its integral extension uses torsion-freeness and cohomology/base-change in the vanishing range.

(CG20, Theorem 7.3 and proof, pp.847–848, with its Klingen no-newforms input in the Klingen level-comparison contract; with inverse as specified in §6.2; CG20 line 1859.)

Use the exact supplier contract for the exact local Klingen invariant-vector and eigenvalue computation, not a general Satake theorem alone. Apply regular-weight cohomological vanishing and identify the integral lattice in the characteristic-zero decomposition. Show that v_Q=tr∘prQ∘i lies in the completed spherical Hecke algebra at Q, compute it modulo m∅ from the regular residual Satake parameters (each prime contributes d_x·(1/4)≡1, using x≡1 mod p), and deduce that v_Q⁻¹∘tr is an O-integral inverse commuting with h.

**Checks.**

- For the GL₂ oldform normalization at q=11 and p=5, take α=(1+δ)/2, β=(1−δ)/2 with δ²=−43, so αβ=11 and the two residual roots are distinct over 𝔽₂₅. The degree-normalized trace composite is (qα−β)/((q+1)(α−β))=1/2−5δ/516, which reduces to 3=1/2 modulo 5, rather than 1. The unnormalized selected composite v=6−5δ/43 reduces to 1 and is a unit. All displayed denominators are nonzero and 5-adic units.
- At x≡1 modulo p the Klingen degree 1+x+x²+x³ is 4 modulo p; the selected residual block contributes 1/4, so v_x≡1.
- For Q=∅, v_Q=1 and the inverse is the identity.

A characteristic-zero isomorphism alone does not give the integral comparison. In the GL₂ analogue (q+1)⁻¹tr(prα f)=(qα−β)f/((q+1)(α−β)), which is not f; the degree-normalized trace is not the inverse.

*Needs:* §6.1; §3.1; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.5; SmoothRepresentationsOfLocalGroups SR.4.5 (the Klingen level-comparison contract); AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4.

### 6.3 Descent through the nonordinary strata

For the same levels and block, the comparison holds on H⁰ over k in all required weights, on the relevant nonordinary divisor sections, and on H¹ over k, with the inverse v_Q⁻¹∘tr of §6.2. Use the h multiplication sequences and a secondary Hasse invariant on the nonordinary locus. Multiplication by h is injective on H⁰ because each connected component of the smooth special fibre is integral and h is nonzero on it; multiplication by the secondary invariant is injective because the nonordinary locus is a Cartier divisor in a smooth threefold, without embedded components, and the invariant is nonzero on each irreducible component. Smoothness alone does not imply irreducibility. The H¹ comparison is proved by reverse induction from the high-weight vanishing range.

(CG20, Lemmas 7.4–7.6 and proofs, pp.848–850; CG20 line 1881.)

Use a cartesian Hasse multiplication square and injectivity of q-expansions to descend the H⁰ comparison. Apply the secondary Hasse multiplier on the nonordinary divisor; verify its nonzerodivisor property component by component. Write the two long exact sequences at consecutive Hasse-shifted weights. With H⁰ and divisor H⁰ comparisons established and high-weight H¹=0, descend the H¹ comparison through the exact sequence; do not assert it directly from H⁰.

**Checks.**

- In k×k multiplication by (1,0) kills (0,1); smooth disconnected components alone do not prove injectivity. A multiplier nonzero on both field components is injective.
- In k[x,y]/(xy), x kills y; this reduced Cartier divisor shows why nonvanishing on every irreducible component matters.
- For a one-step Hasse exact sequence with high-weight H¹=0, the lower H¹ is the cokernel of the H⁰-to-divisor-H⁰ map; comparing H⁰ alone omits that cokernel.

Use the geometric secondary-Hasse input of §3.2. The reverse induction must name the starting vanishing weight and every group used by the five-lemma argument.

*Needs:* §6.2; §3.1; AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; §3.2.

### 6.4 Finite-level Taylor–Wiles comparison

For every m≥1, prQ∘i gives the labelled-block isomorphism on H⁰(X,ω(μ)(−D)O/ϖᵐ) and H⁰(X₀(Q),ω(μ)(−D)O/ϖᵐ), with inverse v_Q⁻¹∘tr (not d_Q⁻¹tr). Passing to the direct limit yields the E/O comparison of CG20 Theorem 7.2. BCGP21 Proposition 7.9.8 supplies a separate ordinary-module coinvariant comparison under its own setup; its proof uses derived cohomological comparisons. Neither that proposition nor this degree-zero theorem is exported here as an unrestricted all-degree isomorphism.

(CG20, Theorem 7.2, p.847; proof pp.850–851; Appendix A.3.2, Lemma A.6, pp.887–888; BCGP21, Hypothesis 7.8.1, pp.211–212; Proposition 7.9.8, pp.222–223; CG20 line 1971.)

For m=1 use the established H⁰ comparison and the H¹ comparison over k. For m>1 use the exact coefficient sequence 0→k→O/ϖᵐ→O/ϖᵐ⁻¹→0 and the two long exact cohomology sequences, with the H¹ control needed to compare the connecting maps. Check compatibility with the transition maps, then pass to E/O and dualize only after recording the direction of the maps.

**Checks.**

- The coefficient lengths at m=2 are 1+1=2 in 0→k→O/ϖ²→k→0; the connecting H¹ map remains part of the comparison.
- At m=1 the asserted comparison is the residual comparison; m=0 has zero coefficients and is not a premise of the induction.
- At Q=∅ pullback, trace and v_Q are all identity, on both k and E/O.

The degree-one input cannot be omitted from the induction. Do not label this result an all-degree isomorphism.

*Needs:* §6.3; §6.1.

### Examples

At one Taylor–Wiles prime x≡1 modulo 7 the Klingen degree reduces to 4 and the selected local factor to 1/4=2 in 𝔽₇, so v_x reduces to 1. The integral inverse is v_x⁻¹∘tr. In the coefficient step from m=1 to m=2 the lengths are 1+1=2; the same unit inverse commutes with both coefficient maps, while the H¹ comparison controls the connecting map.

### Dependencies

AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3; AutomorphicBundles Layer 12; AutomorphicBundlesPartII Layer 4; Layer 0; Layer 1; Layer 3; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.5; SmoothRepresentationsOfLocalGroups SR.4.5 (the Klingen level-comparison contract). The subsection *Needs* lines give the statement and route inputs separately.

## Layer 7: Coherent defect and selected balance

Identify the dual cuspidal module via L=ω(1,3−a) and supplied integral coherent duality. Deduce torsion-freeness from the appropriate H² vanishing and reduce whole-module balance to the supplied localized characteristic-zero dimension equality. The boundary/Arthur argument belongs to AutomorphicBundlesPartII Layers 6–8. State the additional integral p-idempotent and selected-rank obligations needed to prove balance of the αβ summand.

### 7.1 The dual coherent Taylor–Wiles module

For L=ω(1,3−a) and a quotient Δ of ΔQ, define the coherent homology module MΔ=H₀(XΔ(Q),L)m as the compact fraction-quotient O-dual of H⁰(XΔ(Q),ω(a,2)(−D)E/O)m via the supplied integral Serre duality convention. The bundle identity is ω³⊗L∨(−D)=ω(a,2)(−D). Put S=O[Δ]. Keep this full module distinct from its eαβ-summand. Use p>a−2, the bound under which (Sym^(a−2))^∨≅Sym^(a−2)⊗det^(2−a) integrally, with the stronger p−1>a imposed in the final theorem.

(CG20, §7.2, p.851, standing bound p>a−2; Theorem 7.11, p.853; CG20 line 1988 and line 1998.)

Import coherent homology, completed duals and integral Serre duality from AutomorphicBundlesPartII Layers 1–2. Calculate the two weights using the actual duality formula, including the cusp boundary. Transport the Hecke/diamond action with its contragredient convention and preserve the αβ labels.

Here the dual is the compact O-linear fraction-quotient dual HomO(−,E/O), with the supplied topology and Hecke adjoint. It is not HomO(E/O,O), which is zero. Coherent homology in higher degrees is the supplied derived dual construction.

The construction has the following interfaces.

- Identify MΔ with the specified dual cuspidal E/O-section space, including boundary and action conventions.
- Give its finite O[Δ]-module action and its augmentation maps.
- Identify the dual of the selected sections with the transported idempotent summand, after the action comparison is proved.

**Checks.**

- For a=4, L=ω(1,−1), not ω(1,1).
- Replacing subcanonical sections by canonical sections requires the separate localized boundary theorem.
- For Δ=1, S=O and MΔ is the dual module at X₀(Q).
- HomO(E/O,O)=0, while the compact fraction-quotient dual of E/O is O; the latter is the dual required here.

No theorem about balance of MΔ is silently inherited by an idempotent summand.

*Needs:* §0.4; §1.1; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3.

### 7.2 H² vanishing and torsion-free coherent homology

Assume H²(X₀(Q),ω(a,2)(−D)k)m∅=0. Then H₁(X₀(Q),L)m is O-torsion-free by the supplied duality and coefficient sequence. For the balance calculation this vanishing is needed at X₀(Q), not at every intermediate XΔ(Q). For the final minimal theorem retain its stated uniform H² hypothesis for i=0,1 and all required Taylor–Wiles Q. The a≥4 vanishing theorem is imported with its full good-prime and weight hypotheses; in weight (2,2) this remains an assumption.

(CG20, Assumption 7.7, Remark 7.8 and Lemma 7.9, pp.851–852; Theorem 5.1, pp.822–823; Theorem 9.1(6), p.878; CG20 line 2001.)

The coefficient sequence and H² vanishing imply divisibility of H¹ of the E/O-valued dualizing cusp bundle. Duality turns divisibility into absence of ϖ-torsion in H₁. Use the supplier vanishing theorem for a≥4 in its actual range. Do not infer full H² vanishing from an interior-cohomology expectation.

**Checks.**

- For H¹(E/O)=E/O, multiplication by ϖ is surjective and its O-linear divisible dual is O, with no ϖ-torsion.
- A finite summand k is not ϖ-divisible: multiplication by ϖ is zero, so such a summand would invalidate the torsion-free conclusion.
- At a=2 the asserted automatic range 4≤a is false; the H² hypothesis remains present.

The uniform condition used in Layer 8 and the narrower condition used in the balance proof are separately recorded.

*Needs:* §7.1; AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3.

### 7.3 Defect reduction and whole-module balance

For S=O[Δ] and MΔ as in Layer 7, assume the H² vanishing at X₀(Q), the supplied Hochschild–Serre identification (MΔ)Δ≅H₀(X₀(Q),L)m and the surjection H₁(X₀(Q),L)m→Tor₁^S(MΔ,O). Let r=rankO H₀(X₀(Q),L)m. The defect dS(MΔ)=dimk(MΔ/mS MΔ)−dimk Tor₁^S(MΔ,k) is nonnegative if dimE H₁(X₀(Q),L)m,E≤r. The localized boundary/Arthur theorem supplies equality of the characteristic-zero dimensions. Hence the full MΔ is balanced, with all classification assumptions retained.

(CG20, Theorem 7.11 and proof, pp.853–855; Lemma 7.10, pp.852–853; CG20 line 2056.)

CG20 prints Theorem 7.11 with p−2>a (CG20 line 2058); its proof uses only the section's standing bound p>a−2 (CG20 line 1988 and line 1998), which is the range stated here. For an odd residual representation a is even, so for odd p the final bound p−1>a already gives a≤p−3<p−2 and every application in Layer 8 lies inside the printed range.

Use the supplied homological Hochschild–Serre low-degree exact sequence with its actual direction; bound the O-rank of the Tor term by the torsion-free H₁ rank. Reduce the S-module defect to the displayed characteristic-zero inequality using the precise Tor coefficient sequence from §§5.5–5.8. Import localized subcanonical/canonical agreement, exclusion of Arthur types (b)–(f), the general-type limit-of-discrete-series contribution and dim H¹=dim H⁰ from AutomorphicBundlesPartII Layers 6–8. 

**Checks.**

- For S=O[Cp], dimk(S/mS)=1 and Tor₁ˢ(S,k)=0, giving defect 1.
- For its residue module k, the cotangent dimension of S is 2, so dimk Tor₁ˢ(k,k)=2 and defect 1−2=−1.
- Defects add: S⊕k has defect 1+(−1)=0. This full balanced module has an unbalanced direct summand.
- At (p,a)=(7,4) the bounds p−2>a, p>a−2 and p−1>a all hold. At (p,a)=(7,5), p>a−2 holds and the printed p−2>a fails, so the statement here covers a weight the printed theorem omits; there ν(c)=ε̄(c)^(−4)=1, so no odd residual datum has a=5 and Layer 8 never uses it.

Show the exact rank/defect calculation; a qualitative appeal to Hochschild–Serre is insufficient. This conclusion concerns the full module only.

*Needs:* §7.2; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; DeformationAndDerivedPatchingAlgebra §§5.1, 5.5, 7.6–7.10; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26.

### 7.4 Balance of the selected Hecke summand

Under the final lifting hypotheses prove dS(eαβMΔ)≥0. Required additional input: an integral eαβ action on the coherent complex or on H₀ and H₁, commuting with diamonds, duality and the Hochschild–Serre comparison, together with the characteristic-zero rank inequality on this very summand. Whole-module balance alone is insufficient. This is the selected-summand proof obligation in the final patching argument; the endpoint is conditional on it.

(CG20, Theorem 9.1 proof, step (c), p.880; Theorem 7.11, pp.853–855; CG20 line 3076.)

Use the normalized integral p-actions of AutomorphicBundlesPartII §§3.13 and 4.2 (the normalized integral p-action contract) and compare their idempotents through duality and the cover spectral sequence. Apply the rank/defect calculation to the selected exact sequence, not to the full sequence followed by an unsupported inference. Use AutomorphicBundlesPartII §8.9 with the selected rank-inequality contract for dim_E eαβH₁≤dim_E eαβH₀ on L=ω(1,3−a), with the projector transported through Serre duality. Its route groups the multiplicity-counted characteristic-zero summands by finite part; the normalized degree-one p-action is required before making that grouping equivariant. Every minimal lifting implication includes selected balance as an explicit premise.

**Checks.**

- For the projection S⊕k→k, selected defect is −1 while total defect is 0; the whole-module theorem cannot imply this target.
- For the projection onto S the selected defect is 1; compatibility of the projector with the actual comparison is essential to the selected rank calculation.
- The zero projector gives the zero selected module, defect 0 and rank 0; Katz occurrence is needed later for positive rank.

An abstract finite O[Δ]-module may have nonnegative total defect while a direct summand has negative defect. The generic idempotent-splitting theorem does not itself construct a geometric p-action in degree one.

*Needs:* §7.3; §1.2; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; AutomorphicBundlesPartII §§3.13 and 4.2 (the normalized integral p-action contract); AutomorphicBundlesPartII §8.9 (the selected rank-inequality contract).

### Examples

Take a=4 and Δ=C₅, so L=ω(1,−1) and S=O[C₅]. In the algebraic model M=S⊕k, the full defect is 0, the S-projector has defect 1 and the k-projector has defect −1. For the latter coinvariants have O-rank 0, Tor₁ˢ(k,k) has k-dimension 2 and Tor₁ˢ(k,O) has k-dimension 1. The selected rank input and geometric projector comparison are therefore additional hypotheses, even after the dual bundle has been fixed.

### Dependencies

AutomorphicBundles Layer 5; AutomorphicBundlesPartII Layers 1–3; DeformationAndDerivedPatchingAlgebra §§5.1, 5.5, 7.6–7.10; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; Layer 0; Layer 1; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 8: Conditional minimal lifting and examples

Assemble the GSp4 balanced patching datum, including its fixed-multiplier diamond-inertia identity and universal augmentation kernel. Deduce Rmin=T and positive-rank dual cuspidal freeness under the Fourier and selected-balance hypotheses, then the a≥4 and crystalline classical corollaries at the actual minimal level. Keep scalar-weight H² vanishing and the mod-2 illustration conjectural; check the Weil-restriction and local level examples with their exact limitations.

### 8.1 The nonregular balanced patching datum

For qTW=dimk of the dual Selmer group, choose labelled QN of cardinality qTW with x≡1 mod pᴺ and a quotient ΔN≅(Z/pᴺ)^qTW. Let HN be the dual selected cuspidal module at the corresponding ΔN-cover; H is its base-level counterpart. The supplied presentation gives R∞=O[[x₁,…,x_(qTW−1)]]→RQN→Rmin, with qTW≥1 justified by the fixed-multiplier Selmer dimension formula. Equip HN with the compatible S_N=O[ΔN] and R∞ actions. Their augmentations identify (HN)ΔN≅H. The modules are finite balanced by §7.4, conditional on its explicit proof obligation.

(CG20, Theorem 9.1 proof, items (1)–(4), pp.879–880; Proposition 3.3, pp.811–812; CG20 line 3040.)

Take the exact CG fixed-multiplier Taylor–Wiles rings and presentation from the global supplier; do not substitute a GLn polarized problem with different real-place dimensions. For each QN use the nonregular Galois representation and the selected dual module to construct compatible actions. After the fixed-multiplier twist, inertia is diag(χ,χ,χ⁻¹,χ⁻¹) and χ⁻²=⟨u⟩. This proves the diamond action factors through the deformation-ring action. Identify the augmentation kernel using universal inertia matrix entries; scalar identities in the Hecke image alone do not prove the universal-ring assertion. Use the degree-zero level comparison for the coinvariants and the selected balance theorem for the defect condition.

The construction has the following interfaces.

- The two actions coincide via the universal scalar-inertia character with χ⁻²=⟨u⟩.
- Coinvariants of HN are H and the corresponding deformation specialization is Rmin.
- Supply finite presentation and nonnegative defect for every HN, together with the named selected-balance hypothesis.

**Checks.**

- The inertia multiplier of diag(χ,χ,χ⁻¹,χ⁻¹) is 1 in the prescribed paired ordering.
- The untwisted shape diag(1,1,⟨u⟩,⟨u⟩) has multiplier ⟨u⟩ and cannot represent the fixed-multiplier datum.
- At the trivial diamond character χ=1 near the residual identity for p odd, so auxiliary scalar inertia disappears.

Verify the exact diamond-inertia exponent and that augmentation recovers Rmin. The finite modules may have torsion; no unproved global torsion-free Hecke-ring claim is used.

*Needs:* §5.2; §6.4; §7.4; GlobalGaloisDeformations G7 (the CG Selmer-presentation contract); GlobalGaloisDeformations R04.5–R04.6 (the CG Selmer-presentation contract); DeformationAndDerivedPatchingAlgebra §§5.5–5.8.

### 8.2 Conditional minimal R = T and freeness

For a CG lifting datum, the uniform hypothesis H²(Xi(Q),ω(a,2)(−D)k)m∅=0 for i=0,1 and all required labelled Q, the classification input and the corrected doubling and selected-balance proof obligations, the classifying map Rmin→Tσ(∅)αβ_m is an isomorphism. The compact fraction-quotient O-dual of H⁰(X,ω(a,2)(−D)E/O)αβ_m is a finite free module over this Hecke algebra. Its rank is positive because Katz modularity supplies a nonzero residual selected section. All conditional inputs are part of the theorem contract.

(CG20, Theorem 9.1, pp.878–879; proof pp.879–880; CG20 line 2999.)

Apply the imported balanced-module patching theorem with the verified ring-action, augmentation and defect data. Obtain freeness over Rmin; use the nonzero residual module to rule out rank zero. The Hecke image acts faithfully by definition; a positive free Rmin-module has faithful Rmin-action, so the surjective classifying map has zero kernel and Rmin=T.

**Checks.**

- A free module T¹ has annihilator 0, whereas T⁰=0 has annihilator T; positive rank is the faithful-action step.
- A surjection O[ε]/(ε²)→O acting on O is faithful only on the target and has kernel (ε); target faithfulness alone is insufficient.
- For Q=∅ the level still includes q; deleting q changes the defined Hecke space.

The endpoint retains the Fourier, selected-balance and classification premises, and the uniform H² hypothesis in weight (2,2).

*Needs:* §8.1; §1.3; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; DeformationAndDerivedPatchingAlgebra §§5.1, 5.5, 7.6–7.10.

### 8.3 The a≥4 minimal theorem

For 4≤a<p−1 in the same fixed-multiplier residual setting, the supplied coherent vanishing theorem discharges the uniform H² hypothesis. With the corrected doubling, selected-balance and classification inputs, deduce minimal R=T and dual cuspidal freeness at the q-enlarged minimal level of §0.4. Absolute irreducibility and the global cyclotomic multiplier remain hypotheses. Neatness (CG Assumption 4.2) follows for p≥5 when r̄ is surjective onto GSp₄(𝔽_p): the image then contains σ with r̄(σ)=λI₄ for a scalar λ≠±1. Choose q with geometric Frobenius conjugate to σ. Since ν(r̄(σ))=ε̄(σ)^(1−a)=λ²≠1, ε̄(σ)≠1, and therefore q=ε̄(σ)⁻¹≢1 modulo p, while every eigenvalue ratio of a scalar is 1 (CG20 p.813; CG20 line 532). Surjectivity also forces ε̄^(1−a) to be onto 𝔽_p^×, that is gcd(a−1,p−1)=1. Otherwise Assumption 4.2 remains a hypothesis; it does not follow from Assumption 4.1(H1), which only excludes ζ_p from ℚ(ad⁰r̄).

(CG20, Theorem 1.2, p.803; Theorem 9.1, pp.878–880; Assumption 4.2, p.813; CG20 line 76.)

Check that the vanishing range covers both levels and every Q used by the patching construction. Give the scalar neatness witness when r̄ is surjective onto GSp₄(𝔽_p), and retain Assumption 4.2 otherwise. Identify the level of §0.4 and its cuspidal Hecke image with the level and Hecke algebra of CG20 Theorem 1.2.

**Checks.**

- At p=7,a=4, 4≤a<p−1 holds and the imported H² vanishing range applies.
- At p=5,a=4, a<p−1 is false even though the separate vanishing range includes a=4; the lifting range remains stricter.
- At a=2, 4≤a is false, leaving the uniform H² condition in §8.2.
- At p=11 and a=4 the exponent 1−a=−3 is prime to p−1=10. Conditional on surjectivity, λ=2 gives λ²=4≠1; a geometric Frobenius at q with that scalar image has ε̄(Frob_q)=q⁻¹ and q³=4, hence q≡5 modulo 11 (5³=125≡4, and ε̄(Frob_q)=9 with 9⁻³=4), while every eigenvalue ratio is 1≠5. At p=7 and a=4 the multiplier ε̄⁻³ has image {±1}, so no r̄ is surjective onto GSp₄(𝔽₇) and the scalar 3I₄, of multiplier 2, is not in the image; at p=3 every scalar of 𝔽₃^× is ±1 with λ²=1, so no scalar witness exists. For the induced representation r̄=Ind_K^ℚ ϱ̄ of CG20 Example 4.11(1) the restriction to `G_{ℚ(ζ_{p^m})}` has image SL₂(𝔽_p)²⋊ℤ/2 (CG20 line 756), a proper subgroup of Sp₄(𝔽_p), so r̄ is not surjective and Assumption 4.2 stays a hypothesis.

No unspecified level N(r̄) replaces the actual q-enlarged minimal level.

*Needs:* §8.2; §7.2.

### 8.4 Arithmetic examples and excluded conjectures

Check the level recipe on the source genus-two Jacobian example: Iwahori at 5 and paramodular at 3 and 19. Its conjectural nonliftable mod-2 weight-(2,2) class is an illustration of conjectural modularity, outside the odd-p minimal theorem. Import the six-point symplectic model and the S₆≅Sp₄(𝔽₂) identification from AbelianSchemesAndArithmeticModuli A3.12, and use its transposition and three-cycle actions to interpret the mod-2 illustration. For Res_K/Q(E), with K imaginary quadratic and E non-CM, the big-image illustration requires E and its conjugate to be nonisogenous over K̄. Weight-(2,2) interior-H² vanishing and the Hecke-ring torsion-freeness expectation remain unproved and unused.

(CG20, Remark 4.12, pp.819–820; §5.4, pp.831–832; §1.2, p.804; Remark 6.14, p.842; Remark 8.18, p.871; CG20 line 816.)

Separate the arithmetic level calculation from the conjectural existence of a mod-2 modular eigensystem. Use the imported six-point model for the finite-group illustration. Use the Weil-restriction open-image contract of ArithmeticGaloisRepresentations §6.4, with geometric nonisogeny. Use the two regular root lines and the zero-root factor to explain the scalar-weight tripling phenomenon without asserting classicality of every p-adic lift.

The mod-2 class and interior-H² and torsion-freeness expectations are conjectural examples, never conclusions of a lifting implication here.

**Checks for the six-point illustration.**

- In the imported model, the sum-zero hyperplane of 𝔽₂⁶ has dimension 5 and the all-ones vector pairs to 0 with all of it; the quotient has dimension 4 and radical dimension 0, and its order (q⁴−1)q³(q²−1)q at q=2 is 15·8·3·2=720=6!.
- The transposition (12) fixes 8 of the 16 quotient vectors, so its fixed-space dimension is 3 and its deviation from identity has rank 1, a symplectic transvection.
- The cycle (123) fixes 4 quotient vectors and has order 3; it cannot be modeled as a nontrivial characteristic-two unipotent involution.

**Checks.**

- The source Jacobian level has local factors Iwahori at 5 and paramodular at 3 and 19; interchanging 3 and 5 changes the prescribed inertia type.
- The even-subset quotient on six points has 2⁵/2=16 elements and dimension 4; its dot-product pairing is alternating since every vector has even weight.
- A quadratic twist Eχ of E can be nonisogenous over K while becoming isomorphic over K̄; then the pair of geometric Tate modules is diagonal rather than a product, so K-nonisogeny is insufficient.

A mod-2 illustration cannot be used to test a p≥5 lifting theorem.

*Needs:* §0.4; §8.2; AbelianSchemesAndArithmeticModuli A3.12; ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; ArithmeticGaloisRepresentations §6.4 (the Weil-restriction big-image contract).

### 8.5 Classical modularity from the minimal theorem

Let r:GQ→GSp₄(Q̄p) have a stable lattice with a CG residual lifting datum, ordinary crystalline local representation at p with Hodge–Tate multiset [0,0,a−1,a−1], and the corresponding minimal away-p ramification. For 4≤a<p−1 and the corrected theorem inputs, r is the Galois representation of a cuspidal Siegel eigenform of weight (a,2) at the stated minimal level. State the Hodge–Tate convention explicitly: ε has weight −1, so the representation with multiplier ε^(1−a) has weights 0,0,a−1,a−1. The good-prime Euler polynomials agree. Equality of every bad Euler factor requires the separate full local–global compatibility theorem.

(CG20, Theorem 1.1, p.802; Theorem 9.1, pp.878–880, with the crystalline and level qualifications; CG20 line 38.)

Use the classifying O-valued point of Rmin and transport it through R=T. Pass from its characteristic-zero eigensystem to a cuspidal characteristic-zero section using coherent base change in the proved range; identify the attached representation by good-prime uniqueness. Use the assumed crystalline condition where Frobenius unit roots and the classical ordinary comparison require it. State the Euler-factor consequence only at the primes covered by the proved local comparison.

**Checks.**

- At a=4 the Hodge–Tate weights are 0,0,3,3, with paired sums 3, matching ε⁻³.
- At a=2 they are 0,0,1,1; the separate weight-two endpoint is not this a≥4 corollary.
- At a=2 a semistable extension of 1 by ε with N≠0 is not crystalline; its dual has the 0,1 weight convention. For an ordinary semistable lift at a≥4, the Frobenius slopes are 0,0,a−1,a−1. Monodromy lowers slope by 1, so no slope pair supports N≠0 and the lift is crystalline. Semistability remains essential to this inference.

Ordinary plus numerical Hodge–Tate weights is not a replacement for the required crystalline hypothesis.

*Needs:* §8.3; §2.4; AutomorphicLFunctionsAndLocalFactors AL.4.

### Examples

For p=7,a=4 the Hodge–Tate list is 0,0,3,3 and the multiplier ε⁻³ has geometric-Frobenius value 27 at ℓ=3; the determinant is 27²=729. The weight range 4<6 and the a≥4 vanishing condition hold. Under the Fourier, selected-balance and occurrence hypotheses, §8.3 gives positive freeness and §8.5 identifies the resulting crystalline point with a weight-(4,2) cusp form at the q-enlarged minimal level.

### Dependencies

ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; AutomorphicLFunctionsAndLocalFactors AL.4; DeformationAndDerivedPatchingAlgebra §§5.1, 5.5, 7.6–7.10; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; Layer 0; Layer 1; Layer 2; Layer 5; Layer 6; Layer 7; GlobalGaloisDeformations G7 (the CG Selmer-presentation contract); GlobalGaloisDeformations R04.5–R04.6 (the CG Selmer-presentation contract); AbelianSchemesAndArithmeticModuli A3.12. The subsection *Needs* lines give the statement and route inputs separately.

## Layer 9: Ordinary p-adic lifting in families

Specialize Pilloni’s admissibility data, keeping its image conditions distinct and its ordered-flag discrepancy explicit. Import Hida horizontal control and generic deformation/defect-zero patching to prove ordinary variable-weight R=T and integral-weight specialization. Deduce ordinary cuspidal p-adic modularity and the parallel GL2-parabolic variant, without asserting classicality of singular specializations.

### 9.1 Pilloni ordinary admissibility data

An ordinary admissibility datum in the P12 branch consists of p≥5, N prime to p, K⊃K(N), either K neat or p≥7, and an ordinary cuspidal eigenform f of weight κ₀ with its residual Galois system. Require absolute irreducibility (a strengthening of the source’s irreducibility wording), SYMP (the invariant nondegenerate bilinear similitude form is unique up to scalar and alternating), and the exact P12 §5.7 image conditions. These are ζp∉L₀ for the adjoint fixed field; for every m a four-distinct-root σ∈GQ(ζpᵐ) having eigenvalue 1 on every irreducible adjoint constituent; dim H⁰(GQ,gsp₄)=1 and H⁰(GQ,gsp₄(1))=0. Impose the well-ramified χℓ, ε₂, ε, TR local conditions and their chosen tame levels, and strong ordinarity for the ordered four local characters. Fix the flag orientation explicitly before identifying the automorphic and deformation versions.

(P12, Definitions 3.2–3.3, p.14; Definitions 5.1–5.3, pp.19–20; §5.7, pp.23–24; §7.1, pp.35–36 (author pagination); P12 line 1768.)

Specialize the supplier residual pairing, ordinary flags and local deformation conditions; do not identify these image conditions with CG20 H1–H3. At χℓ primes use two isotropic inertia-character planes, χℓ nontrivial and ℓ−1 prime to p, with strict Klingen level; ε₂ uses Klingen and ε uses Iwahori; TR requires irreducible inertia and p∤ℓ⁴−1. The automorphic definition excludes λ̄r/λ̄r′ equal to 1 or ε̄ for r>r′; the deformation paragraph prints the reverse index direction. Record and resolve that orientation discrepancy in the supplier comparison rather than treating the two predicates as identical.

The P12 local weight-label list is ordered in the fixed flag: the automorphic exponents are iκ, whereas the printed deformation exponents of P12 Definition 5.3 are −iκ. For the comparison, the automorphic order r>r′ and the deformation order r<r′ are two explicit predicates related by the supplied flag/Ext dictionary; the theorem assumes that dictionary, rather than assuming both predicates are identical.

The construction has the following interfaces.

- Extract f, its actual level and its residual symplectic Galois representation.
- Extract the inertia type and chosen compact subgroup at each bad prime.
- Give the ordered ordinary characters, their residual exclusions and the verified comparison between the automorphic and deformation orientations.

**Checks.**

- For p=5 retain neatness; for p=7 the source permits the stated alternative.
- CG20’s no-order-p-quotient condition is not substituted for P12’s H⁰ dimension condition.
- If λ̄r/λ̄r′=ε̄ but its inverse differs from ε̄, reversing r and r′ changes the predicate; the comparison must detect this.

This branch has no dyadic case and does not use the CG weight-(a,2) balanced module. Admissibility includes the actual automorphic seed, not only an abstract residual representation.

*Needs:* ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; GlobalGaloisDeformations G7 (the variable-weight patching contract); LocalGaloisDeformationRings §§6.3, 6.27 (the flag-orientation contract); PadicFamiliesPartII F8 (the horizontal-control contract in Layer 9).

### 9.2 Variable-weight ordinary R = T

For a P12 admissibility datum with the flag-orientation comparison established, let R̃ be the supplied universal variable-weight ordinary minimal deformation ring and T̃ the localized ordinary cuspidal Hida Hecke image over its two-weight Iwasawa algebra Λ. The natural map R̃→T̃ is an isomorphism; T̃ is finite flat over Λ and the dual ordinary module M̃ is finite free over T̃. For every integral weight κ lifting the residual weight, T̃⊗Λ,κO→Tκ is an isomorphism. These are p-adic ordinary family conclusions, not a claim of classicality in every specialization.

(P12, Theorems 7.1–7.2 and §7.3, pp.36–37 (author pagination); P12 line 1792.)

Use the supplied horizontal Hida control theorem to build fixed-weight finite free O[ΔQ] modules and identify their augmentation with the base module. Verify the equality of diamond and universal-inertia actions, then apply the defect-zero Taylor–Wiles criterion supplied by the commutative-algebra roadmap. At each integral κ obtain fixed-weight Rκ=Tκ and freeness. Use finiteness, constant rank and density of integral weights over Λ to prove the family isomorphism, flatness and module freeness, without using the singular coherent balance theorem.

**Checks.**

- Specializing Λ=O[[w₁,w₂]] at (0,0) gives O; T̃=Λ and M̃=Λᵈ model flatness and rank d without proving the arithmetic statement.
- Λ/(ϖ) has nonzero ϖ-torsion and is not flat over Λ, so torsion control cannot be omitted.
- For κ=(2,2), the automorphic exponent list is 0,0,−1,−1 and its Hodge–Tate list is 0,0,1,1. P12 Definition 5.3 gives the opposite exponents; the supplied comparison retains this distinction.

The flag/Ext comparison of the flag-orientation contract is a hypothesis of this theorem.

*Needs:* §9.1; PadicFamiliesPartII F8 (the horizontal-control contract in Layer 9); GlobalGaloisDeformations G7 (the variable-weight patching contract); GlobalGaloisDeformations R04.5–R04.6 (the variable-weight patching contract); DeformationAndDerivedPatchingAlgebra §§5.5–5.8; IntegralHeckeAndGaloisDeterminants §§1.1–1.7.

### 9.3 Modularity as an ordinary p-adic form

Let ρ:GQ→GSp₄(O) have the same residual representation as the P12 seed, inertia isomorphic to the seed at every v∤p, and an ordinary local filtration of weight iκ′=(0,2−k₂′,1−k₁′,3−k₁′−k₂′), for integral κ′=(k₁′,k₂′). Under §9.2, ρ is attached to a cuspidal ordinary p-adic eigenform f′ of weight κ′ and level K. Overconvergence, when supplied by ordinary analytic continuation, is recorded separately from classicality.

(P12, Theorem 7.1, p.36; P20 introduction, author pp.5–6; P12 line 1795.)

The local and residual conditions define an O-valued point of R̃ over κ′. Transport the point through R̃=T̃ and use Hida control to obtain the p-adic cuspidal eigenform. Identify the full Galois representation by absolute irreducibility and the good-prime polynomial identities. Use an actual analytic-continuation theorem if overconvergence is claimed.

**Checks.**

- At κ′=(4,2), iκ′=(0,0,−3,−3); at (2,2) it is (0,0,−1,−1).
- At κ′=(1,1), iκ′=(0,1,0,1); this is an integral family weight, without a promised classical holomorphic interpretation.
- Residual equality modulo ϖ allows traces t and t+ϖ; it is not equality of characteristic-zero Hecke systems.

For κ′=(2,2), the conclusion remains p-adic; the BCGP classicality branch needs additional geometric and multiplicity inputs.

*Needs:* §9.2; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; LocalGaloisDeformationRings §§6.3, 6.27 (the flag-orientation contract).

### 9.4 Parallel-weight parabolic ordinary lifting

For a parallel-weight P12 seed and the corresponding GL₂-parabolic ordinary space, let Λ′ be its one-weight Iwasawa algebra and R̃′ the universal well-ramified ordinary deformation ring with its unique ordered flag satisfying λA,0|Ip=1 and λA,2/λA,1=ε. Then R̃′≅T̃′ is finite flat over Λ′ and M̃′ is finite free. A lift with seed inertia and parallel weight (0,2−k′,1−k′,3−2k′) is attached to a GL₂-parabolic ordinary cuspidal p-adic form of weight (k′,k′). Here GL₂ denotes the parabolic in the genus-two construction, not a change to a rank-two Galois representation.

(P12, §7.4 and Theorem 7.3, pp.37–38 (author pagination); P12 line 1887.)

Use the supplied parabolic horizontal-control theorem instead of the Borel Hida theorem. Impose the two explicit inertia-character relations in the same universal ordinary deformation framework. Repeat the fixed-weight and weight-density steps over Λ′, preserving the rank-four symplectic representation and the chosen tame level.

**Checks.**

- At k′=2, (0,2−k′,1−k′,3−2k′)=(0,0,−1,−1).
- At k′=3 the P12 weight-label list is (0,−1,−2,−3). In P12 Definition 5.3 the deformation characters have exponents (0,1,2,3), so λA,2/λA,1=ε; the automorphic list instead gives ε⁻¹ in that displayed order. The flag/sign comparison must identify the two source conventions before transport.
- Λ′=O[[w]] has one weight variable, while the Borel Λ has two; the Galois rank stays 4 in both cases.

Do not transfer a regular-weight classicality assertion to the parallel singular specialization.

*Needs:* §9.1; §9.2; PadicFamiliesPartII F8 (the horizontal-control contract in Layer 9); LocalGaloisDeformationRings §§6.3, 6.27 (the flag-orientation contract).

### Examples

On the Borel weight algebra O[[w₁,w₂]], the parallel specialization sends w₁,w₂ to one variable w and gives O[[w]]. At k′=3 the parabolic weight-label list is 0,−1,−2,−3. In the P12 deformation prescription λr|Ip=ε^(−ir), the middle ratio is ε^(2−1)=ε; the automorphic exponent order gives ε⁻¹ instead, so the supplied flag/sign comparison is part of the specialization. The coefficient algebra loses one weight variable, while the Galois rank remains 4; §§9.2 and 9.4 retain their respective control and flag hypotheses.

### Dependencies

ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; GlobalGaloisDeformations G7 (the variable-weight patching contract); GlobalGaloisDeformations R04.5–R04.6 (the variable-weight patching contract); PadicFamiliesPartII F8 (the horizontal-control contract in Layer 9); PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; LocalGaloisDeformationRings §§6.3, 6.27 (the flag-orientation contract). The subsection *Needs* lines give the statement and route inputs separately.

## Layer 10: Characteristic-zero higher-Hida patching

Fix the distinct BCGP25 weight-two and integral-enormity data, including its dyadic neat-prime condition. Construct four localized higher-Hida modules and their two-direction torus diamonds, prove weight/diamond freeness, construct the full-multiplier deformation action and the projective Satake coinvariant comparison. Apply a corrected open-ideal patching theorem to obtain local freeness at the characteristic-zero point; rank zero remains possible.

### 10.1 Characteristic-zero weight-two patching data

A BCGP characteristic-zero datum consists of p≥2 and ρ:GQ→GSp₄(O), unramified outside finitely many primes, with multiplier ε⁻¹, absolutely irreducible residual representation, pure, ordinary semistable of weight two and p-distinguished at p, with a chosen p-stabilization (αp,βp). Require ρ(GQ(ζp∞)) integrally enormous in Definition 7.1.1, meaning absolute irreducibility on E⁴ and, for every simple E[H]-submodule W⊂E⊗ad⁰ with H=ρ(GQ(ζp∞)), existence of h∈H whose reduction has four distinct roots and whose action on W has eigenvalue 1. For p=2 require ρ̄(GQ(i))=ρ̄(GQ); for odd p require a regular-semisimple element in ρ̄(GQ) outside Sp₄(Fp). Choose the neat prime r>5 with ρ itself unramified at r, residual regular-semisimple Frobenius, r≢1 mod p if p is odd and r≢1 mod 4 if p=2. Order its symplectic Frobenius roots as αr,1,αr,2,rαr,2⁻¹,rαr,1⁻¹.

(BCGP25, Definition 7.1.1, Lemma 7.1.2 and Hypothesis 7.1.3, pp.153–154; Definition 7.4.1, p.167; BCGP25 line 6927 and line 6933.)

Specialize the global and local deformation objects with the exact weight-two ordinary semistable condition and chosen unramified plane. Use the integral enormous-image condition of this source, which is not ACC+ enormous image; the latter has different mod-p adjoint cohomology conditions and cannot be substituted at p=2. Choose the neat r under the appropriate odd/dyadic congruence and verify unramifiedness of ρ, not merely of ρ̄.

The construction has the following interfaces.

- Extract the ordinary semistable weight-two representation and ordered p-stabilization.
- Extract integral enormousness and the separate odd/dyadic residual image condition.
- Return r, the correct congruence, unramifiedness of ρ and the four ordered symplectic roots.

**Checks.**

- For p=2 use r≢1 mod 4, rather than the impossible condition r≢1 mod 2 for an odd r.
- A lift ramified at r is rejected even if its residual representation is unramified there.
- A verification of ACC+ residual enormousness does not establish the integral condition used here.

The definition is independent of CG20’s small-weight and odd-p conditions.

*Needs:* ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; ArithmeticGaloisRepresentations §§7.10–7.11 (the integral-enormousness contract); LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p); GlobalGaloisDeformations G7 (the torus Taylor–Wiles contract); PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4.

### 10.2 Four localized higher-Hida multiplicity modules

Let S={r}∪Ram(ρ) and retain its p-part, and choose tame compacts Kℓ (hyperspecial outside S, Iw₁(r) at r). At QN use Iwahori and pro-p-Iwahori levels, with ΔQN=∏ℓ∈QN((Fℓ×)(p))² modulo the fixed center convention. For each of the four genus-two Weyl chambers w separately, construct the higher-Hida dual module M_w and auxiliary M_N,w over ΛGSp₄,Q using (7.4.6), the partial central condition before the full character |·|², and localization at the common anemic ideal, the r-refinement and the p-ideal (Up,0−1,Up,1−αp,Up,2−αpβp). The two torus characters of the ordinary deformation define its Λ action.

(BCGP25, Definitions 7.4.2–7.4.3 and equations (7.4.4)–(7.4.6), pp.167–169; BCGP25 line 7692.)

Use the supplied four higher-Hida complexes and duality; impose exactly the stated central and smooth torus conditions. Localize successively at the good polynomial and central system, at the r-refinement, and at the normalized p-eigenvalues. At each QN identify the rank-two diamond torus per prime; do not reuse the rank-one Klingen diamonds of CG20. Keep all four w modules individually named through base change and patching.

Before arithmetic localization use the four families of PadicFamiliesPartII F8. Lengths 0,1 use cuspidal support and lengths 2,3 canonical support, with the non-Eisenstein boundary comparison applied where needed. The involution [t]↦[t⁻¹] converts BP evaluation −λ to BCGP evaluation +λ. For χ(u)=ζ₃ the two evaluations give ζ₃ and ζ₃⁻¹, so the involution and the E(−λ) twist are visible even on a one-dimensional torus line.

The construction has the following interfaces.

- Give M_w and M_N,w for every one of the four chambers, with their Hecke and Λ actions.
- Identify the r- and p-localization through the displayed eigenvalue ideals.
- Compare partial central condition followed by full specialization with the module in (7.4.6).
- Give the Λ[ΔQN]-action with two independent torus directions at each auxiliary prime.

**Checks.**

- There are four modules indexed by w; their ranks are not added before the classicality criterion.
- For a single Q-prime with p-part cyclic of order pᴺ, the torus diamond group has order p^(2N), subject to the stated center convention.
- Replacing the intermediate partial-central construction with an unsupported full-center eigenspace is not the same definition.

The fixed-center partial character condition is part of the construction; taking full central eigenspaces too early can destroy the projectivity argument.

*Needs:* §10.1; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; IntegralHeckeAndGaloisDeterminants §§2.1–2.3.

### 10.3 Freeness over weight and diamond algebras

For each w, M_w is finite free over Λ and M_N,w is finite free over Λ[ΔQN]. This uses the projectivity of the higher-Hida module after the partial central condition, and the specified subsequent base changes. It holds for p=2 as well as odd p; no averaging by the genus-two Weyl-group order 8 is used.

(BCGP25, Lemma 7.3.8, p.167; Lemma 7.4.7, p.169; BCGP25 line 7768.)

Import the finite projective complex/module theorem with the same torus and central conditions. Carry out the Λ[ΔQN] specialization through the supplied projectivity-compatible maps. Use the relevant complete-local semilocal decomposition to pass from projective to free on each localized coefficient factor.

**Checks.**

- A free Λ[Δ]-module of rank d has Λ-rank d·#Δ; for one rank-two depth-N torus, this is d·p^(2N).
- At p=2, 8 is not a unit in O, so averaging by the Weyl order is undefined integrally.
- A zero module is free of rank 0; this theorem alone establishes no Hecke support.

Finite freeness does not imply positive rank. No division by the Weyl order is valid in the dyadic case.

*Needs:* §10.2; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; DeformationAndDerivedPatchingAlgebra §§3.1–3.3, 5.8.

### 10.4 Characteristic-zero auxiliary Hecke image

Define TSQ as the image of the abstract Hecke generators in EndΛ(M_N,w), using the localizations and full central character just specified; at Q=∅ denote it TS. It is the faithful action image, permitted to be the zero algebra before nonvanishing is proved. Retain the full central operator in the good-prime polynomial system. Compatibility with chamber duality is a comparison theorem, not a definition equating all four modules.

(BCGP25, Definition 7.4.9, p.170; BCGP25 line 7788.)

Take the actual endomorphism image rather than assert injectivity of the abstract Hecke algebra. Keep its Λ[ΔQN] structure and full central system, with zero-ring behavior allowed. Compare compatible changes of coefficients and level through the intertwining maps.

The construction has the following interfaces.

- The image acts faithfully on its module, including the zero-ring/zero-module case.
- Give the complete good-prime polynomial and the full multiplier determined by the central character.
- For a common abstract Hecke algebra acting on two specified modules M and N, a surjective intertwiner M→N induces the surjection from the M-action image onto the N-action image; an injection N→M gives the same direction by restriction. These comparisons require the stated intertwining for every named generator.

**Checks.**

- For M_N,w=0 its endomorphism image is the zero ring; the construction remains defined.
- In odd residue characteristic, multipliers ν and −ν have the same square; a determinant identity alone does not identify the central character.
- Two Hecke generators differing by an element of the action kernel have equal images.

Nonvanishing of this image is a conclusion of §11.4.

*Needs:* §10.2; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b.

### 10.5 Deformation action on the higher-Hida modules

For every N,w construct the Λ[ΔQN]-algebra map RSQN→TSQN. When the localized module is nonzero, this map classifies the interpolated symplectic Galois representation with full multiplier ε⁻¹ and the source’s local ordinary and tame conditions. When its action image is the zero ring, the assertion is the unique algebra map to that ring; the zero ring is not treated as a coefficient object with residue field k. The maps commute with augmentation to RS→TS and with the actions on M_N,w and M_w. The descent step uses IntegralHeckeAndGaloisDeterminants §1.5 with the all-characteristic symplectic-descent contract, retaining the same form and full multiplier also at p=2.

(BCGP25, Lemma 7.4.8 and Proposition 7.4.10 with proof, p.170; BCGP25 line 7799.)

If the localized module is zero, use the unique algebra map to its zero image. Otherwise argue as in BCGP21 Theorem 7.9.4: the Hecke image embeds in a product of fields given by dense regular classical points, the product of their GSp₄-valued representations has traces and multiplier in the Hecke image (the central operators lie there), and IntegralHeckeAndGaloisDeterminants §1.5 with the all-characteristic symplectic-descent contract descends it to the Hecke image for every p. Verify ordinary local characters and every tame local deformation condition, then apply the universal property. Check the two diamond actions agree and pass to the full-center specialization.

**Checks.**

- At a zero localized module, the target action ring is the zero ring and there is its unique unital map from the deformation ring.
- On two genuine eigenspaces the product of Hecke evaluations has kernel equal to their common action kernel; a product of unrelated representation rings is not an action image.
- For the same two-dimensional diamond character, deformation inertia and module diamonds must both send a chosen generator to the same unit u; u and u⁻¹ differ unless u²=1.

Dense field-valued points do not automatically provide an integral GSp₄-valued representation over a nonreduced ring.

*Needs:* §10.4; IntegralHeckeAndGaloisDeterminants §1.5 (the all-characteristic symplectic-descent contract); §2.5; GlobalGaloisDeformations G7 (the torus Taylor–Wiles contract); LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p); IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants IHG.4.

### 10.6 Projective Satake comparison and diamond coinvariants

On the regular residual Satake block, use the projective finite-group module comparison of Lemmas 7.4.11–7.4.12 to identify spherical and selected Iwahori invariants without dividing by 8. After partial-central specialization and then the full central character, (M_N,w)ΔQN≅M_w equivariantly for RSQN→RS. This is the exact augmentation comparison required in Hypothesis 7.2.1(4).

(BCGP25, Lemmas 7.4.11–7.4.12, pp.171–172; Lemma 7.4.15, p.173; BCGP25 line 7869.)

Apply the norm/invariants/coinvariants comparison only to the supplied projective finite-group module. Calculate the regular Satake block at each auxiliary prime and verify that the selected character factor is the spherical one. Impose the central conditions in the order used by the projectivity theorem, then identify the augmented Hecke and Galois actions.

**Checks.**

- On the regular k[C₂]-module in characteristic 2, coinvariants have basis [1] and invariants have basis 1+g; norm sends [1] to 1+g and is an isomorphism.
- On the trivial k[C₂]-module in characteristic 2, norm is 1+1=0 although invariants have dimension 1; projectivity is essential.
- For Δ=1, the augmented module is M_w itself and the norm is identity.

A blanket assertion that invariants commute with quotient or base change is not valid here.

*Needs:* §10.3; §10.5; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.5; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; SmoothRepresentationsOfLocalGroups SR.4.5 (the projective Satake contract); DeformationAndDerivedPatchingAlgebra §5.9.

### 10.7 Characteristic-zero local freeness

Let q⊂RS be the characteristic-zero prime defined by ρ. For each w, (M_w)q is a finite free (RS)q-module, with rank possibly zero. Apply the abstract characteristic-zero patching theorem to the finite Λ[ΔN]-free modules with compatible augmentation. Its proof must use a cofinal system of open ideals suitable for both the weight variables and diamond variables, a constructed compatible action of the patched deformation ring, the cotangent bound, and a justified lift through the completed regular local ring. These extra proof obligations are recorded explicitly; the printed assertion that powers of the augmentation ideal alone form the needed cofinal system is insufficient.

(BCGP25, Hypothesis 7.2.1, Lemma 7.2.2 and Proposition 7.2.3, pp.161–163; Proposition 7.4.16, p.174; BCGP25 line 7435.)

Use the exact supplier contract for the corrected abstract patching construction from the commutative-algebra owner, with open ideals containing weight/maximal-ideal powers and large enough diamond kernels. Construct the ring action before using the patched module; compare the quotient topology with the module topology. At q invert p, use the bounded relative cotangent module to get the completed-ring surjection. Justify the S∞-algebra lift and the dimension/depth calculation with the same coefficient ring. Apply Auslander–Buchsbaum and specialize the augmentation to obtain finite local freeness. Do not infer automorphy, positive support, global freeness or rank one at this stage.

In applying §5.8 of DeformationAndDerivedPatchingAlgebra, prove the uniform bound on valuations of the inverted marked-point elements, a uniform number of generators for the marked point ideals, and preservation of the diagonal O-section in the finite-module comparison. Then check the images of products, point ideals and their squares, and the completed coefficient diagram. These are explicit arithmetic comparison targets of this subsection, with source and target the marked global deformation rings and the patched Hecke action ring; uniform cotangent annihilation alone supplies none of them.

**Checks.**

- For (1+t)^(pᴺ)−1, the t coefficient is pᴺ≠0 over characteristic-zero O; hence the diamond relation is not in (t²), for any N.
- A free local module of rank 0 remains zero after localization; local freeness permits zero support.
- The quotient E[[x]]→E[[x]]/(x²) has zero relative cotangent yet kernel (x²)≠0; a cotangent surjection alone proves no isomorphism.

The patched ring action and lift are supplied by DeformationAndDerivedPatchingAlgebra §5.8; this target retains their hypotheses.

*Needs:* §10.6; DeformationAndDerivedPatchingAlgebra §§3.1–3.3, 5.8; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; DeformationAndDerivedPatchingAlgebra §§6.1–6.7; LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p).

### Examples

For p=2, N=1 and a single two-direction auxiliary torus, Δ≅C₂² has order 4. A free Λ[Δ]-module of rank d has Λ-rank 4d, and its augmentation has Λ-rank d by the projective norm comparison. Localizing the patched module at the target point keeps rank d, with d=0 still allowed. Support in Layer 11 is needed to exclude that value.

### Dependencies

ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; ArithmeticGaloisRepresentations §§7.10–7.11 (the integral-enormousness contract); DeformationAndDerivedPatchingAlgebra §§3.1–3.3, 5.8; DeformationAndDerivedPatchingAlgebra §§5.5–5.8; DeformationAndDerivedPatchingAlgebra §§6.1–6.7; Layer 2; GlobalGaloisDeformations G7 (the torus Taylor–Wiles contract); PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; IntegralHeckeAndGaloisDeterminants §§1.1–1.7; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; IntegralHeckeAndGaloisDeterminants IHG.3a–IHG.3b; IntegralHeckeAndGaloisDeterminants IHG.4; LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p); PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.5; SmoothRepresentationsOfLocalGroups SR.4.5 (the projective Satake contract). The subsection *Needs* lines give the statement and route inputs separately.

## Layer 11: Rank one and classical weight-two lifting

Define the two-wall R-regular weight condition and compute multiplicity one only at nonzero regular points on the relevant component. Retain all five conditions of each dyadic/odd automorphic-seed alternative. Prove support through the singular point using the appropriate regular ordinary lifting and solvable descent suppliers, then rank one separately in all four chambers. Apply the image/de Rham/four-multiplicity higher-Coleman criterion to deduce classical weight-two modularity, retaining all explicit proof premises.

### 11.1 R-regular classical weights

For an integer parameter R≥1 and ordered integral Hodge–Tate weights h₁,h₂ of the two ordinary torus characters, define R-regular numerical weight by h₂−h₁≥R and 1−2h₂≥R. For a weight-space point also require that the two inertia characters are algebraic with these weights. The light numerical predicate is separate from the existence of those algebraic characters.

(BCGP25, Definition 7.5.7, p.176; BCGP25 line 8091.)

Use a positive natural bound R and the existing integer carrier for the two inequalities; transport the resulting condition to the supplied weight-space characters. Derive monotonicity in R and preserve the order of the two characters.

The construction has the following interfaces.

- Unfold the predicate into its two exact integer inequalities.
- If 1≤R′≤R then R-regular implies R′-regular.
- A supplied algebraic weight-space point is R-regular precisely when its ordered Hodge–Tate pair satisfies the numerical predicate.

**Checks.**

- For R=3, h₁=−4,h₂=−1 satisfy both inequalities with equality.
- For R=3, h₁=0,h₂=3 satisfies the first inequality but fails the second.
- Swapping (−4,−1) to (−1,−4) fails the first inequality for R=3.
- At R=0 both inequalities can hold at (0,0), but the definition requires R≥1; arithmetic regularity has a positive gap.

Do not replace the second inequality by a difference of the weights, or apply the predicate to arbitrary smooth characters.

*Needs:* §10.1; PadicFamiliesPartII E6/four-pieces and F8; ShimuraData §§5.9–5.10, 5.18.

### 11.2 The dyadic and odd-prime automorphic seeds

For Layer 10 data require one of two seed alternatives. A: p=2, a solvable CM extension F/Q and ordinary RACSDC π on GL₄/F with r̄π,2≅ρ̄|GF, nearly adequate residual image over F, a residual regular-semisimple element there, a strongly residually odd polarized pair (ρ̄|GF,1) at an infinite place of F⁺, and ρ̄(GQ(i))=ρ̄(GQ). B: p>2, an ordinary cuspidal GSp₄/Q seed π with central |·|² and ρ̄π,p≅ρ̄, GSp₄-reasonable and tidy residual representation, a regular-semisimple element outside Sp₄(Fp), and compatible p-stabilizations such that the seed local representation lies on a unique ordinary component and ρ lies on that same component. The initial matching is residual, not equality of the target p-adic representation with an automorphic one.

(BCGP25, Proposition 7.5.10, hypotheses (A1)–(A5) and (B1)–(B5), p.177; BCGP25 line 8129.)

Use the residual image and polarized-oddness notions from their supplier APIs with their actual coefficient fields. Record all five conditions in each alternative and the exact residual restriction field. In alternative B include the unique-component property for the seed local representation in addition to shared component membership.

The construction has the following interfaces.

- Expose exactly the dyadic A or odd-prime B alternative, retaining all five conditions.
- Return the specified residual isomorphism over GF or GQ, as appropriate.
- In B return the unique seed ordinary component and membership of the target point on it.

**Checks.**

- A seed with matching residual system but different characteristic-zero Hecke eigenvalues may satisfy the initial matching condition.
- Shared membership on one of several seed components does not meet B5’s unique-component clause.
- At n=4, a seed whose r̄(c_v) is GL₄(k)-conjugate to (Ψ₄,1)j at every real place of F⁺ is strongly residually odd at no real place, so A4 fails and the seed is rejected although A1–A3 and A5 may hold; in the supplier’s deformation complex its local classes µ_v vanish at every real place. One real place with r̄(c_v) conjugate to (1₄,1)j restores A4.

Do not strengthen residual matching to p-adic matching in a way that would assume the conclusion. Near adequacy (A2) is OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3, strong residual oddness (A4) is PotentialAutomorphyInfrastructurePartII PL.4, GSp₄-reasonableness (B2) is OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2 and tidiness (B3) is ArithmeticGaloisRepresentations §7.11; each is a separate imported predicate with one supplier.

*Needs:* §10.1; ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3 (the dyadic ordinary-support contract); OrdinaryAutomorphicFormsAndModularityLiftingPartII §5.2 (the symplectic component-support contract); PotentialAutomorphyInfrastructurePartII PL.4; LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p).

### 11.3 Multiplicity one at a nonzero regular point

Choose Kℓ=Par(ℓ^a(ρ|GQℓ)) at ℓ∉{p,r}. Let q′ be a closed arithmetic point of RS[1/p], with finite residue field E′=κ(q′) over E, on a common irreducible component with q. For sufficiently large R and every chamber w, if q′ has R-regular classical weight and (M_w)q′≠0, then dim_E′(M_w ⊗_RS E′)=1. The nonzero hypothesis is essential; this theorem does not construct a classical point in the support.

(BCGP25, Proposition 7.5.1 and Lemma 7.5.2, pp.174–175; equation (7.5.5) and Lemma 7.5.8, pp.176–177; BCGP25 line 8103.)

Apply the source after a finite coefficient extension L/E containing E′ and the point’s refinements, with integers O_L, so the point is represented by RS→O_L. Carry the chosen component, conductor, stabilization and nonzero-support hypotheses through coefficient change. Arithmetic control and field base change identify the resulting fiber with (M_w ⊗_RS E′) ⊗_E′ L; its L-dimension equals the original E′-dimension. The source’s E-dimension formula is its O-valued-point case (BCGP25 line 8085 and line 8096). Use regular arithmetic control to identify this fiber with the sum of cuspidal automorphic representations having the same Galois point and the specified refinements. Use localized boundary/interior comparison and global multiplicity one for general-type packets; these are supplier inputs, not new classification theorems here. At ℓ≠p,r use the unique generic paramodular newvector at the conductor and constancy of the relevant pure local conductor on the component. At p use the one-dimensional simultaneous ordinary refinement eigenspace of the regular principal series; at r use the one-dimensional selected Iwahori block and residual regular semisimplicity.

**Checks.**

- An E-rational nonzero rank-one fiber has E-dimension 1; a zero fiber has dimension 0 over its residue field and is excluded from this assertion.
- For E=ℚ₇, A=E[t] and M=A, the closed point (t²−3) has residue field E′=ℚ₇(√3): the squares modulo 7 are 0,1,2,4, so [E′:E]=2. Its fiber has E′-dimension 1 and E-dimension 2. In general restriction of scalars gives dim_E(M_w ⊗_RS E′)=[E′:E] for a rank-one E′-fiber.
- After a common splitting extension L of the point’s residue field E′, each unique selected local line has L-dimension 1, so their tensor product has L-dimension 1; two p-refinement lines would instead contribute 2. Field base change preserves the fiber’s E′-dimension.
- At R=3 the weight (−4,−1) has gaps 3 and 3, whereas (0,3) has gaps 3 and −5 and is not regular.

A point on another local deformation component is not covered by the conductor/refinement argument.

*Needs:* §11.1; §10.2; §2.6; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p); SmoothRepresentationsOfLocalGroups SR.4.5 (the paramodular newvector contract); SmoothRepresentationsOfLocalGroups SR.4.5 (the refinement-line contract).

### 11.4 Support through the singular point

With Layer 10 data and one seed alternative, prove (M_w)q≠0 for all four w by exhibiting a deformation component through q contained in Hecke support. The dyadic route uses ordinary unitary deformation finiteness and regular automorphy lifting after solvable CM base change, followed by solvable descent. The odd-prime route uses the component selected by B5 and regular GSp₄ ordinary automorphy lifting. Only the component through q is required; no global identification of all reduced deformation components with the Hecke algebra is asserted.

(BCGP25, Proposition 7.5.10 proof, pp.177–179; Lemma 7.5.4, p.176; Proposition 7.5.3, p.175; Theorems 5.7.14 (p.134) and 6.3.4 (p.148) as imported inputs; BCGP25 line 8169.)

Apply OrdinaryAutomorphicFormsAndModularityLiftingPartII §§4.7–4.8 at p=2 (the dyadic ordinary-support contract), or §§6.3–6.4 at p>2 (the symplectic component-support contract), under the full hypotheses in the exact supplier contracts. In the dyadic alternative, make the source’s solvable CM preparation so places above 2 and below ramification split, F/F⁺ is unramified at finite places and 4[F⁺:ℚ] is divisible by 4; retain near adequacy, regular semisimplicity and strong residual oddness. In the odd-prime alternative retain the unique seed component and the tame q_v≡1 modulo 9 condition when p=3. Use finiteness and the dimension lower bound to make a component through q dominate the relevant weight component, then prove density of regular arithmetic points there. Apply the appropriate regular automorphy theorem at those points and the source’s solvable descent Proposition 7.5.3 to put them in Hecke support. Pass from dense supported points to support of the selected component; since M_w is finite and locally free at q, infer its positive local rank.

Use the finiteness of §4.7 and the reduced R=T of §4.8 at p=2, and the reduced R=T of §6.3 and the finiteness of §6.4 at p>2, through those same contracts. The solvable-descent hypotheses include irreducibility of the restricted representation and the ε twist in the CM alternative. A dense subset is taken inside the same component through q and inside the neighborhood where the module is free.

**Checks.**

- In the dyadic restriction step n=4, so n[F⁺:ℚ]=4[F⁺:ℚ] is divisible by 4. The n=2, [F⁺:ℚ]=1 control gives 2 and cannot use that imported theorem.
- In the odd-prime preparation at p=3, q_v=7 fails the tame hypothesis while q_v=19 passes; seed and target must remain on the same chosen ordinary component.
- For A=E×E and M=E×0, support is precisely the first component; a point on the second has zero fiber despite the existence of an automorphic point on the first.
- A finite module has closed support; if its annihilator vanishes at a dense subset of a component, the entire component lies in its zero locus. On A=E[x], a polynomial vanishing on infinitely many E-points is 0.
- A nilpotent thickening A=E[ε]/(ε²), M=E has full set-theoretic support but nonzero annihilator (ε); support does not imply a global reduced R=T comparison on unrelated components.

This is the nonvanishing proof; local freeness alone gives no support. The regular ordinary support is OrdinaryAutomorphicFormsAndModularityLiftingPartII §§4.7–4.8 and 6.3–6.4 and the solvable descent is EndoscopicTransferAndUnitaryTraceComparison §13.2.

*Needs:* §11.2; §10.7; GlobalGaloisDeformations G7 (the torus Taylor–Wiles contract); LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p); PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; EndoscopicTransferAndUnitaryTraceComparison §13.2; OrdinaryAutomorphicFormsAndModularityLiftingPartII §§4.7–4.8 (the dyadic ordinary-support contract) and §§6.3–6.4 (the symplectic component-support contract).

### 11.5 Rank one at the weight-two point

Under the running Layer 10 data, the complete seed alternative and the corrected patching/supplier proof obligations, (M_w)q is finite free of rank one over (RS)q for every one of the four w. The deduction combines local freeness, positive support through q and a sufficiently regular nonzero classical point on a relevant component; it does not equate total rank across the four chambers with one.

(BCGP25, Proposition 7.5.10 conclusion and final proof paragraph, pp.177–179; BCGP25 line 8232.)

Use finite local freeness at q to obtain a neighborhood on which each module has constant rank. Choose a closed R-regular arithmetic point q′ on the supported component in that neighborhood, from the dense set supplied by §11.4, and put E′=κ(q′). Apply regular multiplicity one at this nonzero point and identify dim_E′(M_w ⊗_RS E′) with the constant rank. Repeat for each w, retaining all four one-dimensional fibers over E′.

**Checks.**

- Over the same residue field E′, four free fibers of dimension 1 have individual rank 1 and direct-sum dimension 4. If [E′:E]=2, their individual E-dimensions are 2 and their direct-sum E-dimension is 8; the individual local ranks remain 1.
- On a neighborhood where a finite module is free of rank d, its fiber at a closed point q′ has dimension d over κ(q′); one nonzero regular fiber of κ(q′)-dimension 1 forces d=1.
- A rank-zero module has fiber dimension 0 over every nearby point’s residue field and fails the nonvanishing input.

The argument needs the regular point in the free neighborhood and in support, not merely somewhere on the deformation space.

*Needs:* §11.4; §11.3; §10.7.

### 11.6 Ordinary weight-two modularity lifting

Assume Layer 10 data, the full dyadic or odd seed alternative, the explicit corrected patching and interpolation proof obligations, and either Zariski image containing Sp₄ or image containing SL₂×SL₂ with ρ irreducible and becoming reducible over an index-two subgroup. Then ρ is the representation of a classical cuspidal Siegel modular form of weight (2,2). Use the local semistable weight-two hypothesis to supply de Rhamness and the four rank-one multiplicities to verify the higher-Coleman classicality criterion. The theorem is not obtained by removing the H² hypothesis from CG20’s integral R=T theorem.

(BCGP25, Theorem 7.5.11, p.179; Theorem 4.12.4 and Remarks 4.12.5–4.12.6, pp.113–114; BCGP25 line 8241.)

At the E-rational point q use the arithmetic specialization/control theorem to obtain the ordinary overconvergent eigensystem with the same full good-prime data. Use isotypy to identify its completed eigenspace with ρ⊗W, not just an unspecified four-dimensional representation. The four rank-one graded pieces give equal multiplicities n=1 and total dimension 4. Semistability gives de Rhamness and semisimplicity of the required Sen operator. Apply the imported classicality theorem; retain the classification input on packets used to pass from higher-degree classicality to the degree-zero cusp form. Compare the geometric and dual-spin conventions before concluding that the form realizes the original ρ.

**Checks.**

- At q the four graded E-dimensions are 1, with sum 4; isotypy gives total E-dimension 4n with n≥1, hence n=1.
- For a repeated Sen block [[a,1],[0,a]], the nilpotent part has rank 1; de Rham semisimplicity forces rank 0, killing the singular differential.
- The two weights at a=2 are 0 and 1, each repeated twice; replacing the four chamber multiplicities by one total bound does not verify four equal graded dimensions.

Classicality requires both de Rhamness and the four matching multiplicities. All source and supplier proof premises of Layer 10–Layer 11 propagate to this endpoint.

*Needs:* §11.5; §2.8; §2.7; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4; ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26.

### Examples

Choose a regular supported point with R=3 and (h₁,h₂)=(−4,−1); its two gaps are 3 and 3. If each of the four modules is free in a neighborhood containing that point and the weight-two point, regular multiplicity one over the regular point’s residue field forces each local rank to be 1. At the E-rational weight-two point their four singular graded E-dimensions sum to 4, so completed isotypy 4n=4 gives n=1; de Rhamness then supplies the independent Sen hypothesis for classicality.

### Dependencies

ArithmeticGaloisRepresentations §§7.3–7.5, 7.9–7.12; EndoscopicTransferAndUnitaryTraceComparison §13.2; Layer 10; Layer 2; GlobalGaloisDeformations G7 (the torus Taylor–Wiles contract); PadicFamiliesPartII E6/four-pieces and F8; ShimuraData §§5.9–5.10, 5.18; PadicFamiliesPartII E6, S7 and F8; OverconvergentAutomorphicForms §§8.6–8.7; LocalGaloisDeformationRings §§6.29 and 6.31 (ordinary points) and §§1.22 and 2.24 (pure points away from p); ModularityAndLanglandsExtensions §§3.2, 3.9, 3.26; PadicHodgeTheory §§3.2–3.6, 4.4, 5.3–5.4; OrdinaryAutomorphicFormsAndModularityLiftingPartII §§1.3, 4.7–4.8 (the dyadic ordinary-support contract) and §§5.2, 6.3–6.4 (the symplectic component-support contract); PotentialAutomorphyInfrastructurePartII PL.4. The subsection *Needs* lines give the statement and route inputs separately.

## Downstream consumers

AbelianSurfacesModularity consumes the ordinary weight-two Galois representation and its pure monodromy upgrade (§§2.5–2.6) and the seeds, support, four-chamber rank one and classical weight-two lifting of §§11.2–11.6, with all of their integral-enormousness, seed and patching hypotheses. The odd-p CG theorem and the all-p characteristic-zero theorem have distinct conclusions and premises.

## References

All statements are phrased independently; the locators refer to the exact versions listed here. Source-line references identify the numbered extraction of the same file. Bibliographic publication dates do not change the version used for a theorem number.

- **CG20.** Frank Calegari and David Geraghty, *Minimal modularity lifting for nonregular symplectic representations* (2020). Author-hosted published typeset text; PDF page n is published page 800+n. [Legal source](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf).
- **P20.** Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights* (2020). 17 June 2019 author version, 113 pages; numbering and pagination refer to this version. [Legal source](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf).
- **P12.** Vincent Pilloni, *Modularité, formes de Siegel et surfaces abéliennes* (2012). September 2009 author version, 39 pages; locators refer to this version rather than the 2012 publication. [Legal source](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Mod.pdf).
- **PS16.** Vincent Pilloni and Benoît Stroh, *Cohomologie cohérente et représentations galoisiennes* (2016). Author text, 30 pages; locators use this version. [Legal source](https://www.imo.universite-paris-saclay.fr/~pilloni/koko.pdf).
- **M14.** Chung Pang Mok, *Galois representations attached to automorphic forms on GL_2 over CM fields* (2014). arXiv:1109.5392v4; §4 treats GSp4; use v4 numbering. [Legal source](https://arxiv.org/abs/1109.5392v4).
- **BCGP25.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces* (2025). arXiv:2502.20645v1; all numbering and pagination refer to v1. [Legal source](https://arxiv.org/abs/2502.20645v1).
- **BCGP21.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular* (2021). arXiv:1812.09269v3; all numbering and pagination refer to v3. [Legal source](https://arxiv.org/abs/1812.09269v3).
- **Tho17.** Jack A. Thorne, *A 2-adic automorphy lifting theorem for unitary groups over CM fields* (2017). Author manuscript of 16 March 2016 from the Cambridge institutional repository, 34 pages; numbering and pagination refer to this version. [Legal source](https://api.repository.cam.ac.uk/server/api/core/bitstreams/9bca3a85-7db2-4da6-b8cb-b91c54ee9620/content).
- **Yam14.** Takuya Yamauchi, *The weight reduction of mod p Siegel modular forms for GSp4 and theta operators* (2014). arXiv:1410.7894v8 of 18 October 2022; numbering and pagination refer to v8, in which the scalar and vector theta operators cited by CG20 as Propositions 3.9 and 3.12 are Propositions 3.10 and 3.13. [Legal source](https://arxiv.org/abs/1410.7894v8).
