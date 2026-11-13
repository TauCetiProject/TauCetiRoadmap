# Roadmap: p-adic families, part II — higher coherent cohomology in PEL, singular and Hilbert weights

**Summary.** A p-adic family in one cohomological degree does not see singular coherent weights: classes move between adjacent degrees, and the obstruction to classicality can be a differential between supported cohomology groups. This roadmap extends PadicFamilies, and builds on the general higher Hida and higher Coleman machinery of HigherHidaAndColemanTheory, in five directions taken from the work of Bijakowski–Pilloni–Stroh, Pilloni, and Boxer–Calegari–Gee–Pilloni. (1) Small-slope classicality for overconvergent forms on unramified PEL Shimura varieties of type A and C, by analytic continuation along the dynamics of the normalized U operators. (2) The action of Pilloni's integral spherical operator on singular genus-two weights on the integral and special-fibre complexes, its ordinary amplitude on the p-rank-at-least-one special fibre and the vanishing of the localized Euler characteristic of the Klingen family. (3) Partial-ordinary Hida complexes for `Res_{F/ℚ}GSp₄` over a totally real field in which p splits completely, with derived control, the weight-two doubling injection and the one-Klingen-place comparison with higher Coleman theory. (4) The completed-cohomology Eichler–Shimura spectral sequence on the BGG coefficient category, its genus-two four-piece ordinary filtration, the singular Sen–Cousin comparison and classicality of de Rham ordinary eigenforms of weight (2,2). (5) Four finite projective genus-two Hida modules over the full torus Iwasawa algebra, with classical and higher Coleman specialization, perfect duality and tame group-ring projectivity. The end theorems are the PEL small-slope classicality theorem (§2.9), the Klingen Euler characteristic theorem (§3.5), Hilbert derived ordinary control (§4.7), the doubling injection (§5.8), the one-place rational comparison (§6.7), the four-piece filtration (§7.8), de Rham ordinary classicality (§8.6) and the four projective modules (§9.2–§9.7).

## Scope and ownership

PadicFamilies stops at ordinary modular-curve families, the Fredholm and eigenvariety machine and compact-complex slope charts (PadicFamilies Layers 0a, 0, 2a). HigherHidaAndColemanTheory stops at the general supported theory: the weight dictionary and slope regions (its §§1.1–1.2), dynamical ordinary localization (§2.3), integral Siegel strata and regular control (§3.7), the universal Iwasawa complexes, derived control, duality and genus-at-most-two integral amplitudes (§§4.5, 4.6, 4.8, 4.9), geometric higher Coleman cohomology with algebraic coefficients, its Bruhat–Cousin spectral sequence and interior Cousin subquotients (§§5.1–5.6, 5.8), analytic families with perfect slope blocks and automorphic BGG (§§6.1–6.3, 6.6), ordinary/finite-slope comparison and sharp Siegel bounds (§§8.3, 8.5), and the genus-two checks: the four C₂ weights (§9.1), the singular Klingen complex (§9.4), the isolated spherical Klingen refinement (§9.5), the Klingen analytic family with its relative BGG comparison (§9.6), small-slope extension from the Klingen neighbourhood with threshold `k+2r−3` (§9.7) and two-term Klingen control (§9.8). None of these is restated here: in particular the Klingen extension threshold, the exact two-term Klingen BGG sequence with its comparison ranges `s<k−2` and `s<k+1`, and the torsion continuation from the Klingen tube are HigherHidaAndColemanTheory §§9.6–9.7. The intertwining from which those ranges follow is not imported: for the Klingen BGG differential `d₁ : F^{(k,w)} ⊗ ω^r → F^{(−2−k,w)} ⊗ ω^{k+r+1}`, with U normalized alike on both terms, `d₁ ∘ U = p^{k+1} U ∘ d₁`, so that the action making `d₁` equivariant on the last term is `p^{k+1}U` (AIP15 Proposition 7.2.3, p. 34, and the proof of Proposition 7.3.1, p. 35). §6.4 states this identity at each place of the Hilbert setting (`p > 2`), `F = ℚ` and `I = {p}` included. HigherHidaAndColemanTheory §9.6, item 4, words it with `p^{−k−1}U` on the last term, the printed reading of P20 Proposition 13.3.3.1 (Source issues).

Pilloni's integral spherical operator on singular genus-two weights (P20 §7), its two integrally normalized factors, their divisibilities by `p^{2+r}` and p and its generic-fibre formula are AlgebraicModularFormsAndSerreWeightsPartII §7.5 (written `C_r` there); §3.1 imports it and adds only the independence of its action on the integral and special-fibre complexes from the cone decompositions and its reduction modulo p, which §§3.2–3.3 use. The integrality of the Siegel-type operator `T_{p,2}` on the formal p-rank-at-least-one locus over ℚ at hyperspecial level is AlgebraicModularFormsAndSerreWeightsPartII §7.3; §4.4a differs in proving it for a totally real F, at Klingen as well as hyperspecial level, together with the Katz–Mazur inequality it implies. General toroidal analytic coefficient sheaves, built from the Hodge–Tate period torsor, are OverconvergentAutomorphicForms §8.6; the Hilbert–Siegel coefficient sheaf of §6.1 differs in being built on the integral modified-lattice frame torsor of the formal mixed-level model, with the radius parameters that §§6.2–6.3 use.

This roadmap owns: the BPS degree dynamics and Kassaei continuation on unramified type A/C PEL varieties and the resulting classicality theorem in every dimension (Layers 1–2); the cohomological action of Pilloni's spherical operator `T` on the integral and special-fibre complexes, its rank-zero vanishing and the special-fibre amplitude theorem, the away-from-p Hecke action on the Klingen family and the localized Euler characteristic theorem (Layer 3); the Hilbert–Siegel partial-ordinary Hida complexes, the integrality of Klingen Satake parameters (the Katz–Mazur inequality of §4.4a, in which `F = ℚ` is a case), the weight-two doubling theory, and the Hilbert–Siegel higher Coleman families with their comparison to the partial-ordinary complexes at at most one Klingen place (Layers 4–6); the BGG coefficient category `O(𝔤,𝔟)_{λ-alg}` with its analytic realization, the higher Coleman sheaves and higher Coleman functors with coefficients in the Levi BGG categories `O(𝔪_w,𝔟_{M_w})_{λ-alg}`, analytic localization, the coherent completed-cohomology functor and its Eichler–Shimura spectral sequence, genus-two boundary vanishing and the four-piece filtration (Layer 7); the singular Sen–Cousin comparison and de Rham ordinary classicality (Layer 8); and the four finite projective genus-two Hida modules over the full torus Iwasawa algebra (Layer 9).

The generic inputs of §7.1 are imported: the Arens–Michael envelope `𝒰(𝔤) = lim_r U(𝔤)_r` (written `Û(𝔤)` by Boxer–Calegari–Gee–Pilloni), its Fréchet–Stein structure with noetherian Banach stages, its coadmissible and admissible modules and the exact completion `M ↦ 𝒰(𝔤) ⊗_{U(𝔤)} M` of finitely generated modules are LocallyAnalyticDistributionsPartII §2.5; the parabolic BGG categories `O(𝔤, 𝔮)` and their algebraic subcategories are LocallyAnalyticRepresentationsOfLocalGroups §4.2 (written there `O^p` and `O^p_alg` for a standard parabolic 𝔭); integrable LB representations of 𝔤 are LocallyAnalyticRepresentationsOfLocalGroups §3.10; Fréchet–Stein algebras over a complete discretely valued field and their coadmissible modules in general are LocallyAnalyticDistributionsPartII §1.4. What §§7.1–7.2 own is what none of these states: the λ-algebraic subcategories `O(𝔤, 𝔮)_{λ-alg}` for a character λ of the Levi of 𝔮 and the integration of their twists, the equivalence of `O(𝔤, 𝔮)` with its completed counterpart, the exact contravariant realization `M ↦ M̂^∨` in integrable LB representations, and the localization on the flag variety. The higher Coleman sheaves and functors with BGG coefficients (§§7.1a–7.1b) are owned here for the same reason: HigherHidaAndColemanTheory §§5.2–5.5 and 6.2 define finite-slope higher Coleman cohomology with algebraic coefficients and with analytic characters, which are the finite-slope values of these functors on finite-dimensional and on Verma coefficients (§7.1b (2)–(3)), but not a contravariant functor on all of `O(𝔪_w,𝔟_{M_w})_{λ-alg}`, on its bounded derived category or before slope extraction, all of which §§7.2 and 7.5 use. Boundary vanishing for the genus-two completed tower (§7.7) is owned here: CompletedCohomologyPartII §7.8 states the generic implication from boundary vanishing and assigns the `GSp₄` vanishing to its arithmetic consumer.

Left to other roadmaps, by section: PEL data, moduli and normalized higher-level models (PELModuli §§M0–M5); finite flat degrees, Hasse invariants, canonical subgroups and Igusa torsors (HodgeTateAndCanonicalSubgroups §§0.6–0.8, 0.14–0.16, 0.28, 3.6, 5.1, 5.5, 5.8); toroidal and minimal compactifications, normalized models and Koecher principles (ShimuraCompactifications §§4.1, 4.3, 4.10, 6.12, 6.16–6.17, 7.16–7.26); coherent automorphic coefficients, traces and Hecke operators (AutomorphicBundles §§3.3, 5.3, 5.4, 11.16, 12.1, 12.11, 12.15); Pilloni's integral spherical operator on genus-two coherent cohomology (AlgebraicModularFormsAndSerreWeightsPartII §7.5); the formal chart criterion on normalized p-level models and toroidal-to-minimal relative vanishing of formally subcanonical coefficients and the localized comparison of Hilbert–Siegel coherent cohomology in degrees 0 and 1 with cuspidal representations (AutomorphicBundlesPartII §§5.1–5.2, 8.8); λ-smooth solid representations, integrable LB representations of a Lie algebra, the Harish-Chandra isomorphism for split reductive Lie algebras, the BGG category O and its parabolic subcategories and Kostant homology of nilradicals on finite-dimensional representations (LocallyAnalyticRepresentationsOfLocalGroups §§3.5, 3.10, 4.1, 4.2, 4.6); the Arens–Michael envelope of a Lie algebra and its coadmissible modules (LocallyAnalyticDistributionsPartII §2.5); proper GAGA and quasi-Stein cohomology (AdicSpacesPartIII §§R3.4, R3.6, R3.7); depth, local cohomology, Grothendieck duality and the upper shriek functor (SchemeAndStackFoundations §§0.17, 2.7, 2.19–2.20); GSp₄ Satake and spin polynomials (SmoothRepresentationsOfLocalGroups §SR.4.5; IntegralHeckeAndGaloisDeterminants §3a.2); coherent multiplicities of GSp₄ limits of discrete series and the large-weight classifications (AutomorphicFormsOnReductiveGroups §§6.4–6.6); the GSp₄/GL₄ transfer (EndoscopicTransferAndUnitaryTraceComparison §11.1); the derived completed tower, its support triangle and derived locally analytic recovery (CompletedCohomologyPartII §§2.2, 6.7, 7.1, F.4); Sen operators (PadicHodgeTheory §4.4); the Nekovář multiplicity argument (ArithmeticGaloisRepresentations §§5.11, 7.6); complete group algebras (PadicMeasuresIwasawaAlgebras §§1.1, 1.7); Fréchet–Stein algebras and their coadmissible modules (LocallyAnalyticDistributionsPartII §1.4); residual detection of perfect amplitude and Sylow projectivity (DeformationAndDerivedPatchingAlgebra §§5.9, 7.1, 7.3). Potential modularity, Taylor–Wiles patching, the stronger Hilbert vanishing of BCGP21 §5.9 and torsion conjectures for the Klingen family are not targets of this roadmap.

Citations in the former design numbering of this roadmap resolve as follows; the Klingen items of K2 that are imported resolve to their supplier sections.

| Former design numbering | Section |
| --- | --- |
| K2 | Layer 3, with HigherHidaAndColemanTheory §§9.6–9.7 |
| K2/spherical | §3.1, with AlgebraicModularFormsAndSerreWeightsPartII §7.5 |
| K2/rank-zero | §3.2 |
| K2/spherical-amplitude | §3.3 |
| K2/away-hecke | §3.4 |
| K2/euler-zero | §3.5 |
| K2/extension-bound | HigherHidaAndColemanTheory §9.7 |
| K2/bgg-scaling | §6.4 (compared with HigherHidaAndColemanTheory §9.6 in its last Check) |
| K2/torsion-continuation | HigherHidaAndColemanTheory §9.7 |
| E6 | Layer 7 |
| E6/completed-functor | §7.3 |
| E6/localization-comparison | §7.4 |
| E6/spectral-sequence | §7.5 |
| E6/ordinary-degrees | §7.6 |
| E6/boundary | §7.7 |
| E6/four-pieces | §7.8 |
| S7 | Layer 8 |
| S7/cousin-complex | §8.1 |
| S7/sen-block | §8.2 |
| S7/rank-one-localization | §8.3 |
| S7/sen-cousin | §8.4 |
| S7/multiplicity-balance | §8.5 |
| S7/de-rham-classicality | §8.6 |
| F8 | Layer 9 |
| F8/four-modules | §9.1 |
| F8/projectivity | §9.2 |
| F8/classical-specialization | §9.3 |
| F8/coleman-specialization | §9.4 |
| F8/perfect-pairing | §9.5 |
| F8/tame-projectivity | §9.6 |
| F8/central-character | §9.7 |

## Conventions

Cohomological grading: `Hⁱ(C[r]) = H^{i+r}(C)`. Perfect amplitude `[a,b]` means a finite projective representative in degrees `a,…,b`. Derived fibres are derived tensor products until concentration or flatness is proved; ordinary cohomology tensored with a character is never substituted for a derived fibre. Valuations are normalized by `v_p(p) = 1`. A finite-slope block is the generalized eigenspace of a finite set of nonzero eigenvalues (equivalently the direct factor cut out by a polynomial `P` with `P(0) ≠ 0`); multi-place operators act jointly on such a block, and compactness on the full complex is asserted only where a radius-improvement argument proves it.

A boundary divisor is written D, so the subcanonical coefficient is `ω^κ(−D)`. Cuspidal and canonical support have different amplitude bounds and are never interchanged. Neatness, fan refinements, polarization elements and finite-character components are part of every correspondence.

For Siegel coherent weights use the dictionary of HigherHidaAndColemanTheory §1.1: `κ_w(ν) = −w_{0,M} w(ν+ρ) − ρ` and `ν_w(κ) = −w⁻¹w_{0,M}(κ+ρ) − ρ`, with the genus-two coordinates `ρ = (−1,−2)` and the four minimal representatives of lengths 0, 1, 2, 3 of HigherHidaAndColemanTheory §9.1. The Boxer–Pilloni families specialize at `−ν`; Layer 9 transports coefficients along the ring involution `ι([t]) = [t⁻¹]` to compare with the `+λ` convention of BCGP25 and keeps the twist `E(−λ)`. A finite-order character acts through the level and diamond action.

The arithmetic Sen convention: `ℚ_p(1)` has Hodge–Tate weight −1 and Sen eigenvalue +1 (PadicHodgeTheory §4.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2, whose cyclotomic Sen operator is 1). Frobenius elements in Hecke polynomials are geometric.

Each layer states its own standing hypotheses. The PEL layers use unramified type A/C data; the Hilbert layers use `p > 2` split completely in a totally real field; Layer 9 allows every prime. A hypothesis of one layer does not propagate to another.

**Checks.**

- The shift convention: for the complex `ℤ` concentrated in degree 0, `C[1]` has `H^{−1} = ℤ` and `H^0 = 0`; reading the shift the other way would put it in degree 1.
- Rescaling a nonzero eigenvalue by `p^{−a}` changes its slope from s to `s−a`: at `p = 3`, the eigenvalue 9 (slope 2) rescaled by `3^{−3}` is `1/3` (slope −1).
- The cyclotomic witness: `ℚ_p(1)` has Sen eigenvalue `+1`, its dual `ℚ_p(−1)` has `−1`; a convention with Hodge–Tate weight `+1` for `ℚ_p(1)` would flip every Sen value of Layer 7.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib use `Module.End` (Mathlib/Algebra/Module/LinearMap/End.lean:33) for endomorphisms; `LinearMap.prod` (Mathlib/LinearAlgebra/Prod.lean:95) and `LinearMap.coprod` (Mathlib/LinearAlgebra/Prod.lean:199) for the companion operator of §5.6; `Module.End.genEigenspace` (Mathlib/LinearAlgebra/Eigenspace/Basic.lean:72) for generalized eigenspaces and finite-slope blocks; `Polynomial.aeval` (Mathlib/Algebra/Polynomial/AlgebraMap.lean:259) for polynomial inverses on blocks; `Module.Projective` (Mathlib/Algebra/Module/Projective.lean:71), the splitting property, for projectivity; and `DerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87). `LinearMap.eventually_isCompl_ker_pow_range_pow` (Mathlib/RingTheory/Artinian/Module.lean:307) is the Fitting decomposition of an endomorphism of a module that is both Artinian and Noetherian; it does not supply a derived ordinary projector, which is HigherHidaAndColemanTheory §2.3.

### From Tau Ceti

At the pinned Tau Ceti, `TauCeti.VermaModule` (TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195) is the Verma module `U(L)/vermaIdeal`, for a finite-dimensional Lie algebra with nondegenerate Killing form over a field of characteristic zero, a splitting Cartan subalgebra and a base of its roots. It does not cover reductive Lie algebras with a centre or the BGG category; for the reductive `𝔤` of Layer 7 a Verma module is that of the derived algebra extended by the central character, and the category `O(𝔤, 𝔮)_{λ-alg}` is a target (§7.1). In the same setting `TauCeti.vermaCentralCharacter` (TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Basic.lean:174) is the central character of a Verma module and `TauCeti.harishChandraIso` (TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:106) the Harish-Chandra isomorphism of the centre of `U(L)` with the dot-invariants; the reductive form used for the infinitesimal characters of §7.2 is LocallyAnalyticRepresentationsOfLocalGroups §4.1, which builds on them. Shimura varieties, toroidal models, supported coherent cohomology, analytic coefficient complexes and completed cohomology are supplied by the roadmaps below or are targets here.

### From TauCetiRoadmap.HigherHidaAndColemanTheory

- §1.1: the cohomological weight dictionary `κ_w`, `ν_w` and Serre-dual weights.
- §1.2: relative slopes and geometric classicality regions.
- §2.3: supported ordinary localization (the derived ordinary direct factor).
- §3.7: regular global ordinary control for integral Siegel strata.
- §4.5, §4.6: the perfect universal Iwasawa coefficient complexes `M_w` and derived arithmetic control.
- §4.8, §4.9: integral Iwasawa Serre duality and integral amplitudes in genera one and two.
- §5.1, §5.2, §5.3, §5.4, §5.5, §5.6, §5.8: finite-level Bruhat geometry, supported finite-slope higher Coleman cohomology with algebraic coefficients, its independence of the allowed support pair and its level and character control, the finite-slope Bruhat–Cousin spectral sequence, cuspidal vanishing by Bruhat length and interior Cousin subquotients.
- §6.1, §6.2, §6.3, §6.6: normalized analytic torus action, supported analytic family cohomology, finite perfect family slope blocks and the automorphic analytic BGG spectral sequence.
- §8.3, §8.5: ordinary comparison in weight families and sharp Siegel bounds.
- §9.1, §9.4, §9.5, §9.7, §9.8: the four genus-two weights, the singular Klingen complex `M_Kli` over `Λ₁ = ℤ_p[[ℤ_p^×]]`, the isolated spherical Klingen refinement, small-slope extension from the Klingen neighbourhood and two-term Klingen control. §9.6, the Klingen analytic family with its relative BGG comparison, is not a prerequisite of any target of this roadmap: its exact two-term BGG sequence (item 4) and its slope ranges `s<k−2` (every degree) and `s<k+1` (isomorphism on `H⁰`, injection on `H¹`) are what the last Check of §6.4 compares with the case `F = ℚ`, `I = {p}` of that target. The intertwining of the differential with U from which these ranges follow is not taken from §9.6, whose item 4 words it with `p^{−k−1}U` on the last term; it is §6.4 of this roadmap (Scope and ownership; Source issues).

### From TauCetiRoadmap.PadicFamilies

- Layer 0a: ordinary projectors on finite, profinite and locally finite complexes (§§0a.22, 0a.25).
- §2a.15, §2a.16: compact-representative slope charts and spectral varieties of compact complexes.

### From TauCetiRoadmap.PELModuli

- §M0.21: constancy of the Morita-reduced signature over the embeddings above a prime, under BPS Hypothesis 1.1.1.
- §M0.27: τ-parts at an unramified prime.
- §M1.13: level change and the Hecke action.
- §M2.8, §M2.9, §M2.10: representability and smoothness at good primes, the universal family and the Kodaira–Spencer isomorphism.
- §M4.5, §M4.6: normal integral models at higher p-level.
- §M5.1, §M5.4: Siegel PEL data and the principal Hilbert datum.

What PELModuli must provide (gap:pel-iwahori-complements): §M4.5 — For unramified type A and C PEL data satisfying BPS Hypothesis 1.1.1, the Iwahori-level moduli of Morita-reduced isotropic flags with their complement correspondences, quotient isogenies, polarization transport by totally positive elements and compatibility with fan refinement.

What PELModuli must provide (gap:hilbert-siegel-models): §M5.4 — The Hilbert–Siegel datum `Res_{F/ℚ}GSp₄` for totally real F with p split, its moduli with Klingen or Iwahori level at each place above p and the normalized integral models of §M4.5 at that level; these models are flat, normal and local complete intersections over `ℤ_(p)`, hence Cohen–Macaulay, and smooth outside codimension two (BCGP21 Proposition 3.4.1, p. 50), and at a place v with hyperspecial or Klingen level the locus of p-rank zero at v has codimension two in the special fibre (P20 Lemma 14.9.2, p. 103, for `F = ℚ`).

What PELModuli must provide (gap:kodaira-spencer-isogeny): §M2.10 — The `O_F`-linear Kodaira–Spencer isomorphism for Hilbert–Siegel moduli and its compatibility with prime-to-p quasi-isogenies over `ℤ_(p)`, including the polarization factor (BCGP21 Proposition 5.5.1).

### From TauCetiRoadmap.HodgeTateAndCanonicalSubgroups

- §0.6, §0.7, §0.8: Fargues degree, additivity, duality, extreme values and increase along generic isomorphisms with the equality case.
- §0.14, §0.15, §0.16: the Hasse invariant and its extension to compactifications.
- §0.28: quotients of truncated Barsotti–Tate groups by subgroups of the p-torsion.
- §5.1, §5.5, §5.8: Igusa torsors, the modified Hodge bundle and the Andreatta–Iovita–Pilloni torsor.

What HodgeTateAndCanonicalSubgroups must provide (gap:hilbert-siegel-partial-igusa): §5.1 — For the Hilbert–Siegel datum, the height-one multiplicative subgroup on the p-rank-at-least-one locus at the places of I, the selected multiplicative and ordinary flags, and the partial Igusa torsor with group `∏_{v∈I}ℤ_p^× × ∏_{v∉I}(ℤ_p^×)²`, with affine étale non-finite transitions and toroidal quotients.

What HodgeTateAndCanonicalSubgroups must provide (gap:hilbert-siegel-frame-torsor): §5.8 — For the Hilbert–Siegel datum at mixed Klingen/Iwahori level, the canonical-subgroup Hodge–Tate frame torsor, the modified lattice with `p^{1/(p−1)}ω ⊂ ω^mod ⊂ ω` and its radius-change estimates, compatible with determinants and the boundary.

### From TauCetiRoadmap.AdicSpacesPartIII

- §R2.10: fractional bounds, section domains and Hasse domains.
- §R3.4: quasi-Stein spaces.
- §R3.6: Kiehl's proper mapping theorem and completely continuous restrictions.
- §R3.7: proper GAGA.

What AdicSpacesPartIII must provide (gap:bounded-section-gluing): §R2.10 — On a normal rigid space, completeness of bounded sections of a coherent integral lattice and gluing of sections modulo `p^A` for growing A over admissible strict-neighbourhood covers, as used in BPS Proposition 4.1.2.

### From TauCetiRoadmap.ShimuraCompactifications

- §4.1, §4.3, §4.10: refinement maps, toroidal Hecke correspondences and independence of coherent cohomology from the cone system.
- §6.16, §6.17: the compactified Klingen correspondence and acyclicity of its first projection.
- §7.16, §7.19, §7.20, §7.21, §7.22: the minimal compactification, normalized models at higher p-level (including the Bijakowski–Pilloni–Stroh model), their charts, formally canonical coefficients and the Koecher principle with its dimension-one exception.
- §7.25, §7.26: codimension of the Hilbert–Siegel minimal boundary and the formal Hilbert–Siegel Koecher principle.

What ShimuraCompactifications must provide (gap:partial-hasse-regularity): §7.20 — On the Hilbert–Siegel and Siegel normalized models, regularity of the partial Hasse invariants after arbitrary powers of the others on the supported special-fibre strata; on the mixed Klingen/Iwahori Hilbert–Siegel normalized models, the formal chart criterion of §7.21 for the cuspidal coefficients `ω^κ(−D)`, also after base change to `ℤ/p^n`, which is the hypothesis under which AutomorphicBundlesPartII §5.2 gives their toroidal-to-minimal relative vanishing; and the two-affine cover of the p-rank-at-least-one minimal special fibre (P20 Lemma 8.2.1, BCGP21 Theorem 4.2.12). Relative vanishing itself is AutomorphicBundlesPartII §5.2 and is not part of this contract; nothing here concerns canonical coefficients without the boundary twist.

What ShimuraCompactifications must provide (gap:mixed-cube-cover): §7.25 — For rationals `ε_v > 0` and levels `n_v ≥ sup_{v′} n(ε_{v′})`, where `n(ε)` is, for a rational `ε > 0`, the level above which the Hodge–Tate wedge products lift modulo `p^ε` to sections of the ample `det ω^mod` on the Hodge–Tate model of the minimal compactification (BCGP21 §6.2, p. 145), the cover of the image `X^*_{K(p^n)}(ε)` of the Hodge–Tate neighbourhood `X_{K(p^n)}(ε)` in the minimal compactification by the `2^{|I|}` opens indexed by the vertices of the cube `[2,3]^I`, each isomorphic on generic fibres to an affine formal open of the Hodge–Tate model, the intersections along its faces being acyclic for the toroidal-to-minimal pushforward of the analytic coefficients (BCGP21 Lemma 6.2.3 and Theorem 6.2.6 with its proof, pp. 145–146).

What ShimuraCompactifications must provide (gap:tame-boundary-stabilizers): §4.3 — For normal neat tame levels `K₁ ⊂ K₂` of the Siegel threefold, the action of `K₂/K₁` on a common toroidal model with stabilizers of order prime to p and the identifications `O_{X₂} = RΓ(K₂/K₁, Rπ_*O_{X₁})`, also with −D and for traces (BCGP25 proof of Theorem 7.3.1(5)).

### From TauCetiRoadmap.AutomorphicBundles

- §3.3: highest weights and coefficient conventions.
- §5.3, §5.4: canonical and subcanonical extensions.
- §11.16: Siegel coefficients `Sym^kω ⊗ det(ω)^r`.
- §12.1, §12.11, §12.15: finite locally free traces, geometric Hecke operators and Fourier–Jacobi expansions.

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII

- §7.3: for `d ≥ 0` and `r ≥ 2`, the integral normalized Siegel-type operator `p^{−3}T′_{p,2}` (the operator of Lagrangian kernels in `G[p]`, Pilloni's `T_{p,2}`, written `T_{v,1}` in §4.4) on `RΓ(𝔛^{≥1}, Ω(d,r)(−D))` over the formal p-rank-at-least-one locus of the genus-two Siegel threefold at hyperspecial level, fan-independent and compatible with finite coefficients; this is the case `F = ℚ`, hyperspecial level, of the integrality step of §4.4a.
- §7.5: Pilloni's operator on the spherical, Klingen and paramodular lci models: the differential maps of the degree-`p³` and degree-p isogeny correspondences, tensored with the fundamental classes, factor through `p^{r+2}` and p for `r ≥ 2`; the normalized factors compose to an operator `C_r` on integral coherent cohomology, with and without the boundary ideal and compatibly with finite coefficients, equal over the generic fibre to `p^{3−r}(T_{p,1} + (1+p+p²+p³)T_{p,0})`. Its weight `(j, k)` with `j ≥ k ≥ 2` is the weight of `Ω(j−k, k)`; §3.1 writes `T` for `C_r` and `T₁`, `T₂` for its two normalized factors.

### From TauCetiRoadmap.AutomorphicBundlesPartII

- §5.1: the formally canonical and formally subcanonical chart criterion of ShimuraCompactifications §7.21 verified on the compactified p-level spans and the Hilbert–Siegel `G₁` quotient, with its compatibility with base change.
- §5.2: toroidal-to-minimal relative vanishing: for a normalized PEL toroidal-to-minimal map π and a quasi-coherent extension E satisfying the chart criterion, `R^iπ_*(E(−nD′)) = 0` for `i > 0` and `n ≥ 0` when E is formally subcanonical (`n > 0` when formally canonical), also over an open of the minimal model and over finite coefficient algebras on which the criterion holds; canonical coefficients at `n = 0` are not covered.
- §8.8: for F totally real, p totally split, a neat level that is hyperspecial, paramodular, Siegel parahoric, Klingen parahoric or Iwahori at each place above p (its §8.5), weights `k_v ≥ l_v ≥ 2` with `k_v ≡ l_v mod 2`, the `|·|²` central-diamond subspace and a non-Eisenstein residual ideal m: for `i = 0, 1` a Hecke-equivariant injection of the multiplicity-counted sum of `π_f^K` over cuspidal π congruent to m, holomorphic at the real places with `l_v > 2` and nonholomorphic at exactly i of those with `l_v = 2`, into `H^i(X, ω^κ(−D))_m`; equality in degree 0, and in degrees 0 and 1 when `k_v − l_v > R_gap` and either `l_v = 2` or `l_v > R_gap` at every real place, for an absolute constant `R_gap` (BCGP21 Theorem 3.10.1). Used at the witness weights of §6.6 only.

### From TauCetiRoadmap.SchemeAndStackFoundations

- §0.17, §2.7: depth and Cohen–Macaulay rings, cohomology with supports and the vanishing of local cohomology below the depth, used for restriction across a closed subset of codimension two in §4.4a.
- §2.19, §2.20: the right adjoint of pushforward, the upper shriek functor and relative dualizing complexes.

What SchemeAndStackFoundations must provide (gap:lci-fundamental-class): §2.19 — For a proper lci morphism between normal flat lci `ℤ_p`-schemes that is not finite flat, the fundamental class `p^*O → p^!O`, its compatibility with base change along the generic and ordinary loci, and extension of divisibilities across closed subsets of codimension two (P20 §4.2 and §7.1).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

- §SR.1.4: Iwahori decompositions and positive Hecke algebras.
- §SR.4.5: GSp₄ spin polynomials with Pilloni's normalization.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

- §2.3: operator localization and ordinary parts.
- §3a.2: spin, dual spin and full multiplier.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- §6.4, §6.5, §6.6: components of GSp₄ and coherent multiplicities, coherent cohomology of discrete series and their limits, and the large-weight classifications (including the `Res_{F/ℚ}GSp₄` large-weight theorem and the sign-corrected Pilloni Theorem 15.2.2.1(2)).

What AutomorphicFormsOnReductiveGroups must provide (gap:gsp4-singular-balance): §6.6 — For a non-Eisenstein prime-to-p Hecke eigensystem of GSp₄ and a sufficiently large singular weight, equality of the localized coherent multiplicities of the holomorphic and generic limits of discrete series at the same finite representation (P20 Proposition 15.2.4.1).

What AutomorphicFormsOnReductiveGroups must provide (gap:gsp4-weight-two-stability): §6.6 — Stability of the coherent multiplicity at weight (2,2) along the stable Arthur parameter: for an eigensystem `m_f` as in BCGP25 Theorem 4.12.4, `dim H^0(Sh, ω^{(2,2;−w)})[m_f]` equals `dim H^2(Sh, ω^{(1,1;−w)})[m_f]`.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §11.1: transfer between GSp₄ and GL₄ for general-type representations.

### From TauCetiRoadmap.CompletedCohomologyPartII

- §2.2: the derived completed tower.
- §6.7: derived locally analytic recovery, including the GSp₄ instance of BCGP25 Theorem 4.8.3.
- §7.1, §7.8: the derived completed support triangle and the boundary-vanishing support comparison.
- §F.4: locally analytic vectors and their derived functor.

### From TauCetiRoadmap.PerfectoidShimuraVarieties

- §3.6: the perfectoid incarnation of the Levi torsor and automorphic-bundle pullback.
- §6.3: the Hodge–Tate period map on the toroidal tower.

What PerfectoidShimuraVarieties must provide (gap:solid-vb-sen): §3.6 — The derived functor `VB_red`, from the derived category of solid 𝔤-equivariant sheaves on opens of the flag variety to the derived category of `O^sm`-modules on the toroidal Shimura tower, defined as the derived pullback-and-invariants functor `VB` tensored down along the augmentation of the de Rham algebra `VB(O_FL)`; its degree-zero functor `VB⁰` on 𝔤-equivariant LB-sheaves, exact on the subcategory of those killed by `𝔲⁰_P`, on which `VB_red = VB⁰[0]`, with `VB⁰(C^la) = O^la`; the (𝔤,B)-equivariant version `VB⁰` on LB-sheaves over the Bruhat tubes `C_w^†` killed by `𝔲⁰_P`, also exact; the Chevalley–Eilenberg compatibility `VB⁰(H^i(𝔲⁰_P, F)) = H^i(VB(F))` whenever every `H^i(𝔲⁰_P, F)` is an LB-sheaf; and the identification of the horizontal action of the centre of `𝔪` with the arithmetic Sen operator (BCGP25 Theorem 4.5.4, pp. 73–74; Definition 4.5.17 and Remark 4.5.18, p. 78; Theorem 4.5.20, pp. 79–80; Theorem 4.5.23, p. 81).

### From TauCetiRoadmap.PadicHodgeTheory

- §4.4: Sen operators; a representation is Hodge–Tate exactly when its Sen operator is semisimple with integral eigenvalues.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §5.11: characteristic polynomials annihilating a second representation.
- §7.6: Zariski closures, strong irreducibility and the GSp₄ semisimplicity criteria (BCGP25 Propositions 4.11.1–4.11.2).

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

- §1.1: coefficient Eichler–Shimura relations.

What AutomorphicGaloisRepresentations must provide (gap:gsp4-eichler-shimura): §1.1 — The Eichler–Shimura relation for the étale cohomology of Siegel threefolds with prime-to-p level, annihilating Frobenius at good primes by the spin Hecke polynomial, compatibly with completed cohomology (BCGP25 Theorem 1.8.29).

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

- §1.1, §1.7: finite coefficient coordinates and completed group algebras of profinite abelian groups, including the finite torsion part.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

- §5.9: Sylow projectivity: for a Noetherian local ring of residue characteristic p and a finite group, projectivity over the group ring is detected by the derived residue over a Sylow p-subgroup.
- §7.1, §7.3: Tor comparison, minimal finite free representatives and residual detection of perfect amplitude.

### From TauCetiRoadmap.LieHighestWeight

- Layer 3: the enveloping algebra, Verma modules and `L(λ)` for a finite-dimensional Lie algebra.

### From TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups

- §3.5: λ-smooth solid representations of a locally profinite group (here `B(ℚ_p)` and `T(ℚ_p)`), the values of the higher Coleman functors of §7.1b.
- §3.10: integrable LB representations of the Lie algebra of an analytic group germ (Boxer–Calegari–Gee–Pilloni's category `LB_𝔤(E)`), a continuous `𝒰(𝔤)`-module presented by 𝔤-stable Banach subspaces whose actions integrate to shrinking analytic subgroups; the target of the realization functor of §7.1, applied to 𝔤 and to the Levi algebras `𝔪_w`.
- §4.1: highest-weight theory for split reductive Lie algebras over a field of characteristic zero, including the Harish-Chandra isomorphism and the infinitesimal characters of Verma modules, used for the infinitesimal-character hypothesis of §7.2.
- §4.2: the BGG category O of a split reductive Lie algebra over a field of characteristic zero and, for a standard parabolic subalgebra containing 𝔟 (written 𝔭 there), the parabolic category of modules in O that are direct sums of finite-dimensional simple modules for its Levi and locally finite under its nilradical (written `O^p` there), abelian, noetherian and artinian, closed under subquotients and finite direct sums; `O(𝔤, 𝔮)` of §7.1 is this category for the parabolic 𝔮, applied to 𝔤 and to the Levi algebras `𝔪_w` with their parabolics `𝔮_{M_w}`.
- §4.6: Kostant homology `H_q(𝔫, V) ≅ H^q(𝔫, V^∨)^∨` of nilradicals on finite-dimensional algebraic representations, the finite-dimensional case of the Lie homology coefficients of §7.2.

### From TauCetiRoadmap.LocallyAnalyticDistributions

- §0.0, §0.3: nonarchimedean locally convex categories, completed tensors, polydiscs and compact p-adic manifolds.
- §4.16: Banach complexes, compact operators and finite-slope decompositions.

### From TauCetiRoadmap.LocallyAnalyticDistributionsPartII

- §1.4: for a complete discretely valued field K, K-Fréchet–Stein algebras, not necessarily commutative (a sequence of continuous algebra seminorms defining the topology with left noetherian Banach completions, each flat over the next), and their coadmissible modules, given by compatible finitely generated modules over the Banach stages and recovered by the inverse limit: independence of the defining sequence, exactness of the inverse limit, and the abelian category of coadmissible modules with its closedness and strictness properties (Schneider–Teitelbaum 2003, §3). §2.5 applies it to `𝒰(𝔤)`.
- §2.5: for the Lie algebra 𝔤 of a linear algebraic group over a finite extension E of `ℚ_p` with an integral lattice and a PBW basis, the Banach completions `U(𝔤)_r` for the norms `|Σ a_n xⁿ|_r = sup |a_n| r^{|n|}` and the Arens–Michael envelope `𝒰(𝔤) = lim_{r ≥ 1} U(𝔤)_r`; that `𝒰(𝔤)` is a Fréchet–Stein algebra with noetherian stages `U(𝔤)_r`, flat over `U(𝔤)`; the cofinal comparison `lim_r U(𝔤)_r = lim_r D(G_r)` with the distribution algebras of the congruence subgroups `G_r`; coadmissible `𝒰(𝔤)`-modules with transition isomorphisms `U(𝔤)_r ⊗_{U(𝔤)_{r+1}} M_{r+1} ≅ M_r`; admissible modules as continuous duals of coadmissible ones; and exactness of `M ↦ 𝒰(𝔤) ⊗_{U(𝔤)} M` from finitely generated `U(𝔤)`-modules to coadmissible modules (BCGP25 §2.2.29, Remark 2.2.30, Definitions 2.2.31 and 2.2.33, Proposition 2.2.35, pp. 23–24). Used for 𝔤 and for the Levi algebras `𝔪_w` in §§7.1–7.1a.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

- §R07.P7.2: labelled Sen operators; the cyclotomic Sen operator is 1.

## How to read the build

Layers 1–2 are the PEL continuation: Layer 1 fixes the Morita degree coordinates and the normalized U operators and proves that iterates push degree bands uniformly toward the multiplicative locus; Layer 2 builds the Kassaei path sums, glues bounded sections across every integral wall and algebraizes, giving small-slope classicality. Layer 3 adds to the imported Klingen theory the action of the imported integral spherical operator on the integral and special-fibre complexes, its special-fibre amplitude and the Euler characteristic of the localized Klingen family. Layers 4–6 treat `Res_{F/ℚ}GSp₄`: Layer 4 constructs partial-ordinary Hida complexes in `|I|+2|Iᶜ|` variables with derived control and proves the integrality of the Klingen Satake parameters; Layer 5 proves the weight-two doubling injection on the special fibre; Layer 6 constructs the analytic families and the geometric dagger complexes and proves the one-Klingen-place comparison. Layer 7 builds the higher Coleman functors with BGG coefficients, binds completed cohomology to analytic localization of the BGG category through them and computes the genus-two ordinary part; Layer 8 identifies the singular Sen obstruction with the Cousin differential and proves classicality; Layer 9 extracts the four projective modules from the imported integral complexes. Layers 1–2, 3, 4–6, 7–8 and 9 are independent of each other except where a *Needs* line says otherwise. Layer 3 holds for every prime p, while the Hilbert layers assume `p > 2`; within the Hilbert layers, Layer 4 supplies both Layer 5 and Layer 6, which do not use each other.

The headline theorems require Shimura varieties, toroidal models, supported coherent cohomology, analytic coefficient complexes and completed cohomology, none of which exists at the pinned libraries; they are targets of this README, and numerical normalizations serve as Checks.

## Layer 1: PEL degrees and normalized correspondences

Standing hypotheses of Layers 1–2. Let `(B, *, O_B, U, ⟨·,·⟩, h)` be a PEL datum of type A or C whose prime p satisfies BPS Hypothesis 1.1.1 (HAL p. 5): p is unramified in the totally real field `F₀`, and in type A every place of `F₀` above p splits in the CM field F; `B ⊗ ℚ_p` is a product of matrix algebras over unramified extensions of `ℚ_p`; `O_B` is maximal at p; the pairing is perfect at p; p splits completely in the reflex field E. Write `π₁,…,π_h` for the places of `F₀` above p, `d_i` for the residue degree of `π_i`, and `(a_i, b_i)` (type A) or `a_i` (type C) for the Morita-reduced signature at `π_i`, constant over the embeddings above `π_i` (PELModuli §M0.21). Fix a finite extension K of `ℚ_p` containing the images of the embeddings, a neat prime-to-p level, compatible smooth toroidal fans, and totally positive `x_i ∈ O_{F₀}` with `π_j`-adic valuation 1 if `j = i` and 0 otherwise. `X_Iw` is the Iwahori-level Shimura variety at p, with rigid generic fibre `X_Iw^rig`.

### 1.1 Morita degrees

At a point x of `X_Iw^rig` with values in `O_C`, let `H_{i}` be the Morita component at `π_i` of the distinguished maximal totally isotropic subgroup of the Iwahori flag (in type A, one member of the polarization-paired pair of factors), a finite flat group of height `d_i a_i`. Define the degree coordinate `δ_i(x) = deg H_i`, the Fargues degree of HodgeTateAndCanonicalSubgroups §0.6, and `δ = (δ_1,…,δ_h) : X_Iw^rig → ∏_i [0, d_i a_i]` (BPS §1.5, HAL p. 11; recalled in §3.2, HAL p. 16). The coordinate measures the distance to the multiplicative-ordinary locus `X_Iw(0) = δ^{−1}(∏_i {d_i a_i})`.

*Needs:* gap:pel-iwahori-complements; PELModuli §M4.5; HodgeTateAndCanonicalSubgroups §0.6, §0.7.

The basic properties are:

- `0 ≤ δ_i ≤ d_i a_i`, with `δ_i = 0` exactly when `H_i` is étale and `δ_i = d_i a_i` exactly when it is multiplicative.
- `δ_i` is unchanged by extension of the complete valued field.
- For a short exact sequence of finite flat groups the degrees add.
- Each `δ_i` is the valuation of an analytic function locally on `X_Iw^rig`, so the preimage of a closed rational box is a quasi-compact open.

**Checks.**

- An étale component has `δ_i = 0` and a multiplicative component of height `d_i a_i` has `δ_i = d_i a_i`; for the modular curve (`d = a = 1`) the canonical subgroup of a point near the multiplicative locus has degree close to 1, and an anticanonical one degree close to 0.
- For a supersingular elliptic curve over `W(F̄_p)`, every subgroup of order p has degree `1/(p+1)` (HodgeTateAndCanonicalSubgroups §0.6), strictly between the two extremes.
- Morita reduction removes matrix multiplicity: for `B ⊗ ℚ_p = M_m(ℚ_{p^d})` the coordinate is the degree of the reduced component, not m times it; a definition using the unreduced group would have range `[0, m d a]`.

### 1.2 Normalized U operators

For each i let `C_i` be the correspondence of complements: pairs (x, L) with `L ⊂ A[π_i]` a finite flat subgroup of the type complementary to `H_i`, `p₁(x, L) = x` and `p₂(x, L) = A/L` with the polarization descended from `x_i λ` and the induced level and flag. Set `n_i = d_i a_i b_i` in type A and `n_i = d_i a_i(a_i+1)/2` in type C, and define `U_i = p^{−n_i} Tr_{p₁} ∘ (π_i^*)^{−1} ∘ p₂^*` on sections of `ω^κ` over opens of `X_Iw^rig`, and on classical and overconvergent forms (BPS §2.2–§2.3 and Remark 2.3.1, HAL pp. 13–15). The definition depends on `x_i` through the polarization; it is canonical on forms invariant under the totally positive units (BPS Remark 2.3.2, HAL p. 15).

*Needs:* §1.1; gap:pel-iwahori-complements; PELModuli §M1.13; ShimuraCompactifications §4.1, §4.3; AutomorphicBundles §12.1, §12.11.

The basic properties are:

- `U_i(f)` at a point is `p^{−n_i}` times the sum of the values of f at the quotients `A/L` over the complements L, with differentials transported by the isogeny.
- `U_i U_j = U_j U_i` for `i ≠ j`.
- `U_i` preserves `δ_j` for `j ≠ i`.
- The operator is unchanged under a common refinement of the fans.

**Checks.**

- Type C with `d = a = 1` (modular curve) gives `n = 1`: `U = p^{−1}Tr`, the standard `U_p` on q-expansions.
- Type C with `d = 1, a = 2` (Siegel threefold) gives `n = 3`; type A with `d = a = b = 1` gives `n = 1`.
- Replacing `x_i` by `u x_i` for a totally positive unit u changes the polarization on `A/L`; equality of the two operators holds only after the induced identification of the polarization data, so an unadorned equality is not part of the definition.

### 1.3 Degree monotonicity and rigidity

Prove: if y lies in `U_i({x})` then `δ_i(y) ≥ δ_i(x)` and `δ_j(y) = δ_j(x)` for `j ≠ i`; if `δ_i(y) = δ_i(x)` then `H_i` is a truncated Barsotti–Tate group of level one, `A[π_i]` splits as the direct sum of `H_i` and a totally isotropic truncated Barsotti–Tate group, and `δ_i(x)` is an integer (BPS Propositions 3.1.1–3.1.3, HAL pp. 15–16).

A proof route: the isogeny induces a generic isomorphism `H_{i,x} → H_{i,y}`, so the degree increases with equality only for an isomorphism (HodgeTateAndCanonicalSubgroups §0.8); in the equality case compare `deg H_i` with `f l − deg L` and conclude by the splitting criterion.

*Needs:* §1.2; HodgeTateAndCanonicalSubgroups §0.7, §0.8, §0.28.

**Checks.**

- For the generic isomorphism `ℤ/p → μ_p` over `ℤ_p[ζ_p]` the degree jumps from 0 to 1, and the map is not an isomorphism.
- At a non-integral degree, equality is impossible: for the modular curve a point of degree `1/(p+1)` is moved strictly.
- The multiplicative endpoint is fixed: at `δ_i = d_i a_i` the inequality forces equality.

### 1.4 Uniform progress on degree bands

Prove: for integers `0 ≤ n ≤ d_i a_i − 1` and rationals `0 < η ≤ ν < 1` there is an integer N with `U_i^N(δ_i^{−1}([d_i a_i − n − ν, d_i a_i])) ⊂ δ_i^{−1}([d_i a_i − n − η, d_i a_i])`, the other coordinates being preserved; and the analogous statement for `∏_i U_i` on products of bands (BPS Proposition 3.2.1 and Corollary 3.2.2, HAL pp. 16–17).

A proof route: on the quasi-compact band `V = δ_i^{−1}([d_i a_i − n − ν, d_i a_i − n − η])` the increment `δ_i(p₂(u)) − δ_i(p₁(u))` is the valuation of an analytic function on `p₁^{−1}(V)`, hence attains a minimum ε, which is positive by §1.3 because V contains no integral degree; take N larger than `(ν − η)/ε`.

*Needs:* §1.3; AdicSpacesPartIII §R2.10.

**Checks.**

- The band must be closed: on a half-open strip `]d a − n − ν, d a − n[` the minimum of the increment can tend to 0 at the integral wall, and no uniform N exists from compactness alone.
- For the modular curve with `n = 0`, `ν = 1/2`, `η = 1/4`, the band `[1/2, 3/4]` of degrees is pushed into `[3/4, 1]` by a fixed power of U.
- With `η = ν` the statement is trivial with `N = 0`.

### Examples

For the modular curve, `n = 1`, the degree is the valuation coordinate of Buzzard's analytic continuation, and §1.4 is the statement that iterates of U accumulate the supersingular region onto arbitrarily small strict neighbourhoods of the multiplicative tube. For the Siegel threefold, `n = 3` and `δ ∈ [0, 2]`.

### Dependencies

AdicSpacesPartIII §R2.10; AutomorphicBundles §12.1, §12.11; HodgeTateAndCanonicalSubgroups §0.6, §0.7, §0.8, §0.28; PELModuli §M0.21, §M1.13, §M4.5; ShimuraCompactifications §4.1, §4.3; gap:pel-iwahori-complements.

## Layer 2: PEL analytic continuation and classicality

The standing hypotheses of Layer 1 hold. Write `κ` for a dominant weight of the Levi `M = ∏_i Res_{ℤ_{p^{d_i}}/ℤ_p} GL_{a_i}` (times `GL_{b_i}` in type A), with terminal entries `k_{i,j,a_i}` and `l_{i,j,b_i}` (`1 ≤ j ≤ d_i`) as in the introductory paragraph of BPS §4, before §4.1 (HAL p. 17). Put `c_i = min_j (k_{i,j,a_i} + l_{i,j,b_i})` in type A and `c_i = min_j k_{i,j,a_i}` in type C.

### 2.1 The strict slope region

For a simultaneous eigenform f with `U_i f = α_i f`, `α_i ≠ 0`, put `s_i = v_p(α_i)`. The small-slope region is `s_i ≥ 0` and `s_i + n_i < c_i` for every i (BPS Hypothesis 4.5.1, HAL p. 25). Equivalently there is a rational `ε ∈ (0,1)` with `n_i + s_i − (1−ε)c_i < 0` for every i. The normalization of §1.2 makes every slope of an overconvergent eigenform nonnegative (BPS §4, introductory paragraph before §4.1, HAL p. 17), and the region forces `c_i > n_i ≥ 0`.

*Needs:* §1.2.

The basic properties are:

- The inequality is strict; the boundary `s_i + n_i = c_i` is excluded.
- Increasing `c_i` or decreasing `s_i` preserves the region.
- If the region holds then `c_i > 0`, which is what makes multiplication of a degree lower bound by `c_i` legitimate in §2.5.

**Checks.**

- `n = 3`, `c = 4`, `s = 0` lies in the region, and any `ε < 1/4` works: `3 − 4(1 − ε) < 0` exactly when `ε < 1/4`.
- `n = 3`, `c = 3`, `s = 0` does not: `3 < 3` fails, and no ε gives `3 − 3(1−ε) < 0`.
- `n = 3`, `c = 4`, `s = 1/2` lies in the region with `ε < 1/8`.
- For the modular curve (`n = 1`, `c = k`) the region is `v_p(α) < k − 1`, Coleman's bound for the standard `U_p`.

### 2.2 Finite-slope first extension

Prove: a simultaneous eigenform with every `α_i ≠ 0`, defined on a strict neighbourhood of `X_Iw(0)`, extends uniquely to `δ^{−1}(∏_i ]d_i a_i − 1, d_i a_i])` (BPS Proposition 4.2.1, HAL p. 19). No slope bound is needed.

A proof route: by §1.4 every closed band `δ_i^{−1}([d_i a_i − ν, d_i a_i])` with `ν < 1` is carried by some `U_i^N` into the original domain; define the extension there by `α_i^{−N}U_i^N f`; two choices of N agree by the eigenrelation; extend one place at a time, using commutation of the `U_j`.

*Needs:* §1.4.

**Checks.**

- For `α_i = 0` the formula `α_i^{−N}U_i^N f` is undefined; the nonzero-eigenvalue hypothesis cannot be dropped.
- Changing N to `N+1` after the image lies in the original domain gives `α_i^{−N−1}U_i^{N+1}f = α_i^{−N}U_i^N(α_i^{−1}U_i f) = α_i^{−N}U_i^N f`.
- The region reached is bounded by the first integral wall `δ_i = d_i a_i − 1`, where §1.3 allows a fixed point and progress stops.

### 2.3 The bad-complement filtration

On a quasi-compact degree box `V` and for rational `β > 0` let `N(x, β)` count the complements L at x (for the place i) whose Morita degree is at least `1 − β`, and `V_k = {N(x,β) ≥ k}`. Let `B_k` parametrize ordered k-tuples of distinct complements, with finite étale projection `p_k : B_k → X` and quotient coordinates `q_j : B_k → X`. Prove that the `V_k` form a finite decreasing sequence of quasi-compact opens with `V_0 = V`; the bad locus `B_{k,β} ⊂ B_k` is quasi-compact open with image `V_k`; and over `V_k ∖ V_{k+1}` the bad and good first projections are finite étale (BPS Definitions 4.3.2–4.3.5, Lemma 4.3.6, Proposition 4.3.7, HAL pp. 20–21; Lemma 4.4.3, HAL p. 24). Each coordinate `q_j` is used separately; the product map `B_k → X^k` is not finite étale.

*Needs:* §1.1; §1.2; AdicSpacesPartIII §R2.10.

The basic properties are:

- `V_{k+1} ⊂ V_k` and `V_0 = V`; `V_k` is empty for k larger than the number of complements.
- Each coordinate `q_j` gives a quotient point with its degree.
- Enlarging β gives strict neighbourhoods of the strata.

**Checks.**

- If no complement is bad then `V_1 = ∅` and `U_i` is entirely good.
- A point with exactly one bad complement lies in `V_1 ∖ V_2`.
- The differences `V_k ∖ V_{k+1}` are not open in general, so they do not form the admissible cover used for gluing; the strict neighbourhoods of §2.6 do.
- For `k = 2` on the modular curve, `B_2` is finite étale over X and has dimension one while `X²` has dimension two, so `B_2 → X²` is not finite étale; only the coordinates `q_j` are used.

### 2.4 First-good path decomposition

For `N ≥ 1` partition the length-N paths of the correspondence by their first good step: `T_j` is j bad steps followed by one good step (`0 ≤ j < N`) and `R_N` is N bad steps. Prove `U_i^N = Σ_{j=0}^{N−1} U_i^{N−1−j} ∘ T_j + R_N` in the correspondence-composition order, where the left factor carries the remaining arbitrary steps; after contravariant pullback the terms become the bad-then-good section operators of §2.6 (BPS Theorem 4.4.1, HAL p. 22; Proposition 4.3.10, HAL p. 21).

*Needs:* §2.3; §2.2.

**Checks.**

- At `N = 2` the four words GG, GB, BG, BB occur exactly once: GG and GB in `U_i ∘ T_0`, BG in `T_1`, BB in `R_2`.
- At `N = 1` the identity is `U_i = T_0 + R_1`, the decomposition into good and bad parts.
- Dropping the left factors `U_i^{N−1−j}` loses every word whose good step is not the last one; at `N = 2` the word GB would be missing.

### 2.5 Bad-path contraction

Prove: on a region where the bad complements have degree at least `1 − ε`, the normalized bad operator has norm at most `p^{n_i − (1−ε)c_i}`, so that `α_i^{−1}U_i^bad` has norm at most `q_i = p^{n_i + s_i − (1−ε)c_i} < 1` in the region of §2.1 (BPS Lemma 4.4.5, HAL p. 25; Lemmas 4.5.3 and 4.5.5, HAL p. 27).

A proof route: bound each weight component through the coefficient representation; insert the degree lower bound, which needs `c_i > 0` (§2.1); apply the nonarchimedean trace bound and the scalar `p^{−n_i}`.

*Needs:* §2.1; §2.4.

**Checks.**

- Genus two (`n = 3`), `c = 4`, `s = 0`, `ε = 1/8`: the exponent is `3 − 4·7/8 = −1/2 < 0`.
- With `c = 3`, `s = 0` the exponent `3 − 3(1−ε)` is positive for every `ε ∈ (0,1)`.
- With a negative terminal weight `c < 0` the inequality `ν ≥ 1 − ε` multiplied by c reverses, so the bound cannot be inserted as stated; §2.1 excludes this case.

### 2.6 Kassaei path sums

Define `f_N = Σ_{j=0}^{N−1} α_i^{−j−1} (bad^j ∘ good)(f)` on the strict neighbourhoods of the bad strata. Prove that the `f_N` are uniformly bounded, that their differences on overlaps have norm at most `M q_i^N`, and that for integers `A_N → ∞` below the resulting valuation bound (reduced by the fixed loss `n_i + s_i`) the reductions modulo `p^{A_N}` glue and are compatible from `N+1` to N (BPS Definition 4.5.2, Lemmas 4.5.3 and 4.5.5, Propositions 4.5.6–4.5.7, HAL pp. 27–29).

*Needs:* §2.5; gap:bounded-section-gluing.

The basic properties are:

- A uniform bound independent of N.
- Differences on admissible overlaps of norm at most `M q_i^N`.
- Refining the neighbourhoods preserves the reductions at every common precision.

**Checks.**

- When the bad part is zero, `f_1 = α_i^{−1}U_i f` and all `f_N` with `N ≥ 1` coincide.
- The `N = 1` term is `α_i^{−1}U_i^good f`.
- A fixed precision A is not enough: the inverse-limit section requires `A_N → ∞`.

### 2.7 Bounded continuation across all walls

Prove: the compatible path sums give a unique bounded section on each closed rational degree box; exhausting the half-open auxiliary conditions by closed rational boxes and gluing by uniqueness, the eigenform extends at place i from `δ_i ∈ ]d_i a_i − 1, d_i a_i]` to `δ_i ∈ [0, d_i a_i]`, the other coordinates being fixed, and, iterating over the places, to all of `X_Iw^rig` with its eigenrelations (BPS Proposition 4.1.2, HAL p. 18; §4.5, HAL p. 26; Propositions 4.5.7–4.5.8, HAL p. 29).

*Needs:* §2.6; §2.2; gap:bounded-section-gluing; AdicSpacesPartIII §R3.4.

**Checks.**

- Two continuations agree on overlapping closed boxes by the contraction of §2.5, so the exhaustion changes neither the section nor its eigenvalues.
- Quasi-compactness is applied to closed rational boxes only; a half-open strip of valuations is not a quasi-compact domain.
- At place i the continuation passes in one step from `δ_i ∈ ]d_i a_i − 1, d_i a_i]` to `δ_i ∈ [0, d_i a_i]`, so a point of the étale-ordinary tube `δ = 0` is reached after h steps, one per place (BPS §4.5, HAL p. 26). For the Siegel threefold (`h = 1`, `d a = 2`) that is one step, not one per integral wall below `δ = 2`, which would be two.

### 2.8 The dimension-one case

Prove: under the standing hypotheses, when the symmetric space of G is the Poincaré half-plane, so that BPS Hypothesis 1.4.2 fails and the Koecher principle of ShimuraCompactifications §7.22 has its dimension-one exception, every overconvergent form f of dominant weight κ at Iwahori level which is a simultaneous `U_i`-eigenform with eigenvalues in the region of §2.1 is the analytification of a section of `ω^κ` on `X_Iw × Spec K`, and a cuspidal f gives a cuspidal form (BPS Theorem 5.3.1 and Remark 5.3.2, HAL p. 31). If `X_Iw` is proper, §2.7 and proper GAGA conclude without a boundary. Otherwise each geometric connected component is a congruence quotient of the upper half-plane, a modular curve; carry out the continuation of §§2.2–2.7 on its smooth compactification, the cusps lying in the multiplicative tube where the Tate curve describes the complements, so that the continued section is a section of `ω^κ` over the compactified rigid curve, and conclude by proper GAGA.

*Needs:* §2.7; ShimuraCompactifications §6.12, §7.22; AdicSpacesPartIII §R3.7.

**Checks.**

- The Koecher principle fails in dimension one: the modular curve has meromorphic sections of `ω^k` with poles at cusps that are holomorphic on the open curve (ShimuraCompactifications §7.22), so the boundary must be treated inside the continuation.
- A compact Shimura curve has no cusps, so `X_Iw` is proper and the boundary-free case applies without the Koecher principle.
- On the modular curve the region of §2.1 is `s < k − 1`, agreeing with §2.9's first Check.

### 2.9 Small-slope classicality

Prove: under the standing hypotheses, let κ be dominant and f an overconvergent form of weight κ at Iwahori level which is a simultaneous `U_i`-eigenform with eigenvalues in the region of §2.1. Then f is classical: it is the analytification of a section of `ω^κ` on `X_Iw × Spec K`; a cuspidal f gives a cuspidal form (BPS Theorem 5.3.1, HAL p. 31). This holds for every datum: when the symmetric space has complex dimension greater than one (BPS Hypothesis 1.4.2, HAL p. 10) by the route below, and in dimension one it is §2.8.

A proof route in dimension greater than one: §2.7 gives a section on `X_Iw^rig`; the Koecher principle on the normalized model (ShimuraCompactifications §7.22, in which the Bijakowski–Pilloni–Stroh model is included) extends the bounded integral section across the boundary of the normal toroidal model; pass through the formal model and apply proper GAGA (BPS Propositions 5.2.1 and 5.2.4, Corollaries 5.2.2–5.2.3, HAL pp. 30–31). Normality is that of the actual normalized model, not of a modification with different sections.

*Needs:* §2.7; §2.8; ShimuraCompactifications §7.19, §7.20, §7.21, §7.22; AdicSpacesPartIII §R3.7.

**Checks.**

- For the modular curve, `n = 1` and `c = k`: forms of slope `< k − 1` for the standard `U_p` are classical, which is Coleman's theorem; slope exactly `k − 1` lies outside the statement.
- For the Siegel threefold (`n = 3`) with `κ = (k₁, k₂)`, `k₁ ≥ k₂`, `c = k₂`: slope `< k₂ − 3` is classical; at `k₂ = 3` no slope qualifies.
- The algebraic section analytifies to f and preserves vanishing along −D.

### Examples

On the Siegel threefold at Iwahori level with `κ = (6, 6)` (`c = 6`, `n = 3`), an overconvergent eigenform of `U` slope `< 3` is classical by §2.9; the contraction constant of §2.5 is `p^{3 + s − 6(1−ε)}`.

### Dependencies

AdicSpacesPartIII §R2.10, §R3.4, §R3.7; ShimuraCompactifications §6.12, §7.19, §7.20, §7.21, §7.22; gap:bounded-section-gluing; Layer 1.

## Layer 3: Singular Siegel weight: the spherical operator, amplitude and Euler characteristic

Standing hypotheses. X is the genus-two Siegel threefold over `ℤ_p` with neat prime-to-p level `K^p` and hyperspecial level at p, with compatible toroidal and minimal compactifications and boundary D; `X_Kli(p)` and `X_par` are the Klingen and paramodular-type models of Pilloni §6, normal and lci over `ℤ_p` (P20 §7.1, p. 38). The coefficient is `Ω(k,r) = Sym^k ω ⊗ det(ω)^r` (AutomorphicBundles §11.16), `k ≥ 0`. `X₁` is the special fibre and `X₁^{≥1}` its p-rank-at-least-one open. The singular Klingen family `M_Kli` over `Λ₁ = ℤ_p[[ℤ_p^×]]` and its control are HigherHidaAndColemanTheory §§9.4 and 9.8. In §§3.4–3.5 the level is a product `K^p = ∏_{ℓ≠p} K_ℓ`, and N is the product of the primes `ℓ ≠ p` with `K_ℓ ≠ GSp₄(ℤ_ℓ)` (P20 §15.2, p. 107).

### 3.1 The spherical operator on the integral and special-fibre complexes

Over `X_Kli(p)` the universal isogenies `G → G′ → G` have degrees `p³` and p with composite multiplication by p, and the projections `p₁ : X_Kli(p) → X`, `p₂ : X_Kli(p) → X_par` are not finite flat over the p-rank-zero loci. For `k ≥ 0` and `r ≥ 2` let `T₁ = p^{−2−r}T₁′ : p₂^*Ω(k,r) → p₁^!Ω(k,r)` and `T₂ = p^{−1}T₂′ : p₁^*Ω(k,r) → p₂^!Ω(k,r)` be the integrally normalized cohomological correspondences of AlgebraicModularFormsAndSerreWeightsPartII §7.5, with their cuspidal versions on `Ω(k,r)(−D)`, and `T = T₁ ∘ T₂` their composite (written `C_r` there, at the weight `(k + r, r)`); over the generic fibre `T = p^{3−r}(T_{p,1} + (1+p+p²+p³)T_{p,0})`, with `T_{p,1}` the double coset of `diag(1, p, p, p²)` and `T_{p,0}` that of the central element `p`. Prove: the maps `T₁ : RΓ(X_par, Ω(k,r)) → RΓ(X, Ω(k,r))` and `T₂ : RΓ(X, Ω(k,r)) → RΓ(X_par, Ω(k,r))` they induce, and their cuspidal analogues, do not depend on the choice of cone decompositions of X, `X_Kli(p)` and `X_par`: for refinements the pullback isomorphisms on the three complexes intertwine them (P20 Proposition 7.2.1 and Lemma 7.3.1, pp. 41–42); T commutes with the prime-to-p Hecke operators; and the reductions of `T₁` and `T₂` modulo p are cohomological correspondences `p₂^*(Ω(k,r)|_{X_par,1}) → p₁^!(Ω(k,r)|_{X₁})` and `p₁^*(Ω(k,r)|_{X₁}) → p₂^!(Ω(k,r)|_{X_par,1})` on the special fibres, whose composite T acts on `RΓ(X₁, Ω(k,r))` and `RΓ(X₁, Ω(k,r)(−D))` compatibly with reduction (P20 §7.4, p. 42).

A proof route: for two choices of cone decompositions both correspondences are, after adjunction, maps between the same locally free sheaves, and they agree outside the boundary, hence everywhere; the subcanonical versions use that the fundamental class carries the boundary ideal; the reduction uses the base change of the fundamental class to the special fibre.

*Needs:* AlgebraicModularFormsAndSerreWeightsPartII §7.5; gap:lci-fundamental-class; SchemeAndStackFoundations §2.19, §2.20; ShimuraCompactifications §4.1, §4.10, §6.16, §6.17; AutomorphicBundles §11.16, §12.11.

The basic properties are:

- The action of T on `RΓ(X, Ω(k,r))` and on `RΓ(X, Ω(k,r)(−D))` is independent of the cone decompositions and is the composite of the actions of `T₁` and `T₂`.
- Reduction modulo p carries the action of T on the integral complexes to that of the reduced T on the special-fibre complexes.
- T commutes with the prime-to-p Hecke operators, on the integral and on the special-fibre complexes.

**Checks.**

- The weight dictionary with AlgebraicModularFormsAndSerreWeightsPartII §7.5: `Ω(k, r)` has weight `(j, k′) = (k + r, r)` there, so `(k, r) = (0, 2)` is its weight `(2, 2)` and the generic scalar `p^{3−r}` is p; reading its weight `(j, k′)` as `(k, r)` would place `Ω(0, 2)` at `(0, 2)`, outside its range `j ≥ k′`. At `r = 3` the scalar is 1.
- The special-fibre operator is the reduction of the normalized correspondence, not a normalization of the reduced raw one: `T₁′` is divisible by `p^{2+r}`, so its reduction modulo p is zero and `p^{−2−r}` cannot be applied to it on the special fibre.
- A finite-flat trace on all of `X_Kli(p)` does not exist: `p₁` has infinite fibres over p-rank zero (at a superspecial point the order-p subgroups of `α_p²` form `ℙ¹(k)`), so the correspondences pass through the fundamental class and `p₁^!`, and the fan comparison is one of maps into `p₁^!`, not of traces.
- The double coset `T_{p,1}` has `p + p² + p³ + p⁴` single cosets; at `p = 2` that is 30, and the generic formula at `r = 2`, `p = 2` is `2(T_{p,1} + 15T_{p,0})`.

### 3.2 Rank-zero vanishing

Prove: there is a constant C, independent of the prime-to-p level, such that for `k ≥ C` and `r ≥ p² + p` the correspondence `T₁` restricted to the p-rank-zero loci `p₂^*Ω(k,r)|_{X_par,1^{=0}} → p₁^!Ω(k,r)|_{X₁^{=0}}` is zero (P20 Proposition 7.4.2.2, p. 49; Lemma 7.4.2.6, p. 50). Consequently suitable powers of T are nilpotent on the infinitesimal thickenings of the rank-zero locus.

A proof route: on p-rank zero every subgroup of rank `p³` contains the Frobenius kernel, so the isogeny factors through Frobenius and the coefficient map gains divisibility; Artin–Rees on the fundamental-class lattice and a finite cover make C independent of the level.

*Needs:* §3.1.

**Checks.**

- The conclusion is for `k ≥ C`; at `k = 0` no vanishing is asserted.
- On a thickening the conclusion is nilpotence of a fixed power, not vanishing of T itself.
- The bound on r is `p² + p`: at `p = 2` it is 6, at `p = 3` it is 12.

### 3.3 Ordinary amplitude on the p-rank-at-least-one special fibre

Prove: for `k > p + 1` and `r ≥ 2` the action of T on `RΓ(X₁^{≥1}, Ω(k,r)(−D))` is locally finite (P20 Lemma 8.2.1, p. 52); for `k ≥ C` and `r ≥ 2` its ordinary part `e RΓ(X₁^{≥1}, Ω(k,r)(−D))` is a perfect complex of `𝔽_p`-vector spaces of amplitude `[0,1]`; for `r ≥ 3` restriction `e RΓ(X₁, Ω(k,r)(−D)) → e RΓ(X₁^{≥1}, Ω(k,r)(−D))` is a quasi-isomorphism; for `r = 2` it is an isomorphism on `H⁰` and injective on `H¹` (P20 Proposition 8.2.1, p. 53).

A proof route: the Hasse resolution `Ω(k,r)(−D) → colim_{×Ha} Ω(k, r+(p−1)n)(−D) → colim Ω(k, r+(p−1)n)(−D)/Ha^n` is acyclic relative to the minimal compactification, whose rank-two and rank-one strata are affine; remove the rank-zero contribution with §3.2 and the support sequence.

*Needs:* §3.2; HigherHidaAndColemanTheory §2.3; PadicFamilies §0a.22; HodgeTateAndCanonicalSubgroups §0.14, §0.16; AutomorphicBundlesPartII §5.1, §5.2; gap:partial-hasse-regularity; ShimuraCompactifications §7.16.

**Checks.**

- At `r = 2` the global-to-open map is only injective on `H¹`; the conclusion `[0,1]` for the global special fibre is asserted only for `r ≥ 3`.
- The amplitude statement is for the special fibre `X₁^{≥1}`; no integral global amplitude follows from it.
- `H⁰(X₁^{≥1}, Ω(k,r)(−D)) = H⁰(X₁, Ω(k,r)(−D))` unconditionally, because `X₁^{=0}` has codimension two in the smooth `X₁`.
- The relative vanishing used is that of the cuspidal coefficient `Ω(k,r)(−D)`, formally subcanonical, with `n = 0` in AutomorphicBundlesPartII §5.2: there `R^iπ_*` vanishes for every `i > 0`. For the canonical `Ω(k,r)` at `n = 0` that theorem asserts nothing, and no amplitude statement is made here for canonical coefficients.

### 3.4 The away-from-p Hecke action on the Klingen family

For `ℓ ∤ Np` and the three spherical double cosets `T_{ℓ,i}` of `GSp₄(ℚ_ℓ)`, the universal isogeny is étale over the height-one tower and gives a canonical isomorphism of the coefficient sheaves of `M_Kli`. Define `T_{ℓ,2} = ℓ^{−3}T′_{ℓ,2}` and `T_{ℓ,i} = ℓ^{−6}T′_{ℓ,i}` for `i = 0, 1` from the raw cohomological correspondences, and prove that they act on `M_Kli`, commute with each other, with the ordinary projector and with derived character specialization, and that `T_{ℓ,0}` acts invertibly (P20 Proposition 15.1.1, p. 106).

*Needs:* HigherHidaAndColemanTheory §9.4; ShimuraCompactifications §4.3; AutomorphicBundles §12.11; IntegralHeckeAndGaloisDeterminants §3a.2.

The basic properties are:

- The three normalized operators act on the perfect complex `M_Kli`.
- They commute with the ordinary projector and with specialization at every character of `ℤ_p^×`.
- With these normalizations, the spin polynomial of SmoothRepresentationsOfLocalGroups §SR.4.5 at `q = ℓ` is the Hecke polynomial `Q_ℓ` used in §3.5.

**Checks.**

- The raw scalars are `ℓ^{−3}` for `T_{ℓ,2}` and `ℓ^{−6}` for `T_{ℓ,0}` and `T_{ℓ,1}`; at `ℓ = 2` these are `1/8` and `1/64`.
- At `(q, T₀, T₁, T₂) = (1, 1, 4, 4)` the spin polynomial is `(1 − X)⁴` (SmoothRepresentationsOfLocalGroups §SR.4.5), the trivial-parameter witness.
- `T_{ℓ,0}` is the central element `ℓ`, invertible on the family because ℓ is a unit in `Λ₁`.

### 3.5 The localized Euler characteristic of the Klingen family

Let `ρ̄ : G_ℚ → GSp₄(𝔽̄_p)` be absolutely irreducible and unramified outside `Np`, and m the maximal ideal of the prime-to-`Np` Hecke algebra with `Θ_m(Q_ℓ(X)) = det(1 − X ρ̄(Frob_ℓ))`. The Hecke algebra generated in `End(M_Kli)` is finite over `Λ₁`, so `M_Kli,m` is a direct factor. Prove: the Euler characteristic of the perfect `Λ₁`-complex `M_Kli,m` is zero on each connected component of `Spec Λ₁` (P20 Theorem 15.2.1, p. 107; the proof in §15.2.5, p. 109). The conclusion is equality of the alternating ranks; it does not assert that the cohomology modules are torsion.

A proof route: choose in each component a sufficiently large weight `k`; at that weight compare, by the isolated spherical refinement and control, the specialization with spherical ordinary cohomology in degrees 0 and 1; at the same finite representation the holomorphic and generic limits of discrete series contribute equal localized multiplicities; derived base change transports the zero virtual rank to the component. At `p = 2` use the full local algebra rather than a semisimple splitting of the finite characters.

*Needs:* HigherHidaAndColemanTheory §9.5, §9.8; §3.3; §3.4; AutomorphicFormsOnReductiveGroups §6.5, §6.6; gap:gsp4-singular-balance; EndoscopicTransferAndUnitaryTraceComparison §11.1; DeformationAndDerivedPatchingAlgebra §7.3.

**Checks.**

- The complex `Λ₁ --0--> Λ₁` in degrees 0 and 1 has Euler characteristic zero and non-torsion cohomology: zero virtual rank does not give torsion.
- For odd p, `Λ₁` has `p − 1` components; one arithmetic weight determines the virtual rank only on its own component, so a witness is needed in every component.
- The high-weight specialization uses the singular parameter `λ = (−k−1, 0; c)` with negative first coordinate; changing its sign changes the chamber and the comparison (AutomorphicFormsOnReductiveGroups §6.6).

### Examples

At `p = 5`, `k = 0`, `r = 2`: the Klingen family `M_Kli` is perfect of amplitude `[0,1]` (HigherHidaAndColemanTheory §9.8), and at a non-Eisenstein m its two cohomology modules have equal generic rank on each of the four components of `Spec Λ₁` by §3.5. The spherical operator at `r = 2` has generic scalar `p = 5`.

### Dependencies

AlgebraicModularFormsAndSerreWeightsPartII §7.5; AutomorphicBundles §11.16, §12.11; AutomorphicBundlesPartII §5.1, §5.2; AutomorphicFormsOnReductiveGroups §6.5, §6.6; DeformationAndDerivedPatchingAlgebra §7.3; EndoscopicTransferAndUnitaryTraceComparison §11.1; HigherHidaAndColemanTheory §2.3, §9.4, §9.5, §9.8; HodgeTateAndCanonicalSubgroups §0.14, §0.16; IntegralHeckeAndGaloisDeterminants §3a.2; PadicFamilies §0a.22; SchemeAndStackFoundations §2.19, §2.20; ShimuraCompactifications §4.1, §4.3, §4.10, §6.16, §6.17, §7.16; SmoothRepresentationsOfLocalGroups §SR.4.5; gap:gsp4-singular-balance; gap:lci-fundamental-class; gap:partial-hasse-regularity.

## Layer 4: Hilbert partial-ordinary Hida complexes

Standing hypotheses of Layers 4–6. F is a totally real field of degree d, `p > 2` splits completely in F, `S_p = I ⊔ Iᶜ` is a partition of the places above p, and `G₁ = Res_{F/ℚ}GSp₄` with the Hilbert–Siegel moduli of gap:hilbert-siegel-models. The level at p is Klingen at `v ∈ I` and Iwahori at `v ∈ Iᶜ`; the tame level is neat, the compactifications are compatible and polarization elements `x_v` are fixed. Weights are `κ = (k_v, l_v)_v` with `k_v ≥ l_v`, `k_v ≡ l_v mod 2`, and `ω^κ = ⊗_v Sym^{k_v−l_v}(ω_v) ⊗ det(ω_v)^{l_v}`. For descent to the common-similitude group G, the order of the finite unit/deck quotient Δ is prime to p; statements for `G₁` do not need this. Hecke-localized statements use a non-Eisenstein maximal ideal of the prime-to-p Hecke algebra, as in BCGP21 Theorem 3.10.1 (p. 70).

### 4.1 Mixed ordinary loci and partial Igusa towers

For `I ⊂ S_p` let `X^{≥1,I}` be the spherical locus of p-rank at least one at `v ∈ I` and ordinary at `v ∈ Iᶜ`. At the mixed level select the open subscheme on which the distinguished subgroup `H_v` is multiplicative for `v ∈ I` and the specified flag is ordinary for `v ∈ Iᶜ`; it is strictly smaller than the full inverse image of the rank locus. The partial Igusa tower trivializes `T_p(H_{∞,v}^D)` at every v and additionally `T_p((G_v^m/H_{∞,v})^D)` at `v ∈ Iᶜ` (BCGP21 §4.1, pp. 73–74; §4.3.4, pp. 96–97).

*Needs:* gap:hilbert-siegel-models; gap:hilbert-siegel-partial-igusa; HodgeTateAndCanonicalSubgroups §5.1.

The basic properties are:

- The Igusa group is `∏_{v∈I} ℤ_p^× × ∏_{v∈Iᶜ} (ℤ_p^×)²`.
- The locus and tower commute with complete extension of the coefficients.
- The pulled-back toroidal divisor defines the subcanonical ideal.
- The tower maps are affine étale; on the full p-rank-at-least-one locus they are not finite.

**Checks.**

- `I = S_p` gives one character coordinate per place, `d` in all; `I = ∅` gives two per place and the fully ordinary flag locus.
- A point of p-rank one at `v ∈ I` whose distinguished Klingen subgroup is not multiplicative is excluded.
- For `F = ℚ`, `I = {p}` the locus is the Klingen p-rank-at-least-one locus of HigherHidaAndColemanTheory §9.4.

### 4.2 Universal coefficients

Write `T_I = T_fin × T₀` with `T₀` pro-p of rank `|I| + 2|Iᶜ|` and `Λ_I = ℤ_p[[T₀]]`. Define the universal sheaf as the `T_I`-diagonal invariants of `π_*O_Igusa ⊗̂ Λ_I` twisted by `⊗_v det(ω_v)²`. Its specialization at a classical κ evaluates `x_v^{k_v−2}` and, for `v ∈ Iᶜ`, `y_v^{l_v−2}`; classical weights in the component have `l_v = 2` for `v ∈ I` and `k_v ≡ l_v ≡ 2 mod p−1`. The highest-weight map `ω^κ → Ω^{κ_I}` is a projection. For descent from `G₁` to G modify the action of the positive units by `d(x) = [√x₀]`; square roots exist on the pro-p part because `p > 2`; when `p ∤ |Δ|` take the deck invariants as a direct factor (BCGP21 §§4.3–4.4, pp. 95–99; Proposition 4.4.3, p. 99).

*Needs:* §4.1; gap:hilbert-siegel-partial-igusa; PadicMeasuresIwasawaAlgebras §1.7.

The basic properties are:

- The diagonal-equivariant sheaf with the determinant-square twist.
- At κ the universal character evaluates to `x^{k−2}y^{l−2}` on the stated coordinates.
- The highest-weight functional maps `ω^κ` to the specialized sheaf.
- The corrected unit action is the tautological one multiplied by `d(x)`.

**Checks.**

- At `(k_v, l_v) = (2, 2)` for every v the pro-p character is trivial.
- Two split places with `|I| = 1` give character dimension `1 + 2 = 3`.
- For `k_v > l_v` the coefficient `Sym^{k_v−l_v}ω_v` has rank `k_v − l_v + 1 > 1` and is not identified with the rank-one highest-weight quotient.
- If `p | |Δ|` the deck invariants need not be a direct factor: for `Δ = ℤ/p` acting on the regular representation `𝔽_p[Δ]`, the invariants are the line of the norm element, which is not a summand of the indecomposable module `𝔽_p[Δ]`; so the descent statement keeps `p ∤ |Δ|`.

### 4.3 Commuting U operators

On the universal coefficient complex use `U_{v,1}` at Iwahori places, normalized by `p^{−3}`, and `U_{v,2}` as the product of its two quotient and dual factors with raw divisors `p²` and p; the determinant coefficient contributes `p^{−l_v}` at κ. Put `U^I = ∏_{v∈I} U_{v,2} ∏_{v∈Iᶜ} U_{v,1}U_{v,2}`. Prove that all these operators commute as maps of the enhanced complex, specialize to the weight-normalized geometric traces, are intertwined by common fan refinement, and preserve the integral cohomology lattices at classical weights (BCGP21 §4.5, pp. 100–105; Lemmas 4.5.15 and 4.5.17, pp. 104–105). The Klingen operator `U_{v,1}` and the Iwahori operator `U_{v,1}` are different operators.

A proof route: construct the coefficient pullback on each primary quotient; check the two-factor normalization of `U_{v,2}` on integral highest-weight lattices; descend commutation of the correspondences through the faithful injection of the Hasse Čech/Cousin terms into the interior localization. Commutation on cohomology alone does not give commutation on the complex.

*Needs:* §4.2; gap:hilbert-siegel-partial-igusa; ShimuraCompactifications §4.1, §4.3; AutomorphicBundles §12.1, §12.11.

The basic properties are:

- `U^I` is the stated mixed product.
- The local factors commute on the enhanced coefficient complex.
- The universal action specializes to the weight-normalized geometric trace.
- Each `U_{v,1}` and `U_{v,2}` preserves the integral ordinary cohomology lattice, so at `v ∈ Iᶜ` a unit eigenvalue of `U_{v,1}U_{v,2}` on a simultaneous eigenvector forces unit eigenvalues of both factors. At a Klingen place `v ∈ I` only `U_{v,2}` enters, with eigenvalue `α_vβ_v`, and its being a unit says nothing about `α_v` and `β_v` separately; that is §4.4a.

**Checks.**

- `I = ∅` gives `∏_v U_{v,1}U_{v,2}`; `I = S_p` gives `∏_v U_{v,2}`.
- The normalization of `U_{v,2}` is `p^{−2} · p^{−1} = p^{−3}` before the determinant factor, the same as that of `U_{v,1}`.
- In the doubling of Layer 5 the Iwahori first operator is never substituted for the Klingen first operator; at `l = 3` they differ by `p Z` (§5.1).

### 4.4 Fixed-weight amplitude

Let `X_{G₁,1}^I` be the special-fibre open of p-rank at least one at `v ∈ I` and ordinary at `v ∈ Iᶜ`, and `T_I = ∏_{v∈I} T_v ∏_{v∈Iᶜ} T_{v,1}`. Prove: there is C depending only on p and F, not on the tame level, such that if `l_v ≥ 2` for all v, `k_v − l_v ≥ C` for `v ∈ I` and `l_v ≥ C` for `v ∈ Iᶜ`, then `T_I` acts locally finitely on `RΓ(X_{G₁,1}^I, ω^κ(−D))`; `e(T_I)RΓ(X_{G₁,1}^I, ω^κ(−D))` is a perfect complex of amplitude `[0, |I|]`; the restriction from the full special fibre is an isomorphism on `H⁰` and injective on `H¹`; and it is a quasi-isomorphism when `l_v ≥ 3` for every `v ∈ I` (BCGP21 Theorem 4.2.1, p. 77). The generalized partial strata of Theorem 4.2.12 (p. 81) have the perfectness and endpoint comparisons stated there, without a uniform numerical amplitude.

A proof route: partial Hasse invariants and their companion sections give an `(|I|+1)`-term supported resolution; relative minimal-compactification acyclicity and affineness of the rank strata compute it; rank-zero contributions are eliminated by local nilpotence as in §3.2 (BCGP21 §4.2.30, Lemma 4.2.31, Proposition 4.2.33, p. 93).

*Needs:* §4.3; §3.2; AutomorphicBundlesPartII §5.1, §5.2; gap:partial-hasse-regularity; ShimuraCompactifications §7.16, §7.25; HodgeTateAndCanonicalSubgroups §0.14, §0.16.

**Checks.**

- `I = ∅` gives amplitude `[0, 0]`: ordinary cuspidal cohomology of the ordinary locus is concentrated in degree 0.
- For `F = ℚ`, `I = {p}` the statement is §3.3 with `T_I = T`.
- At `l_v = 2` for some `v ∈ I` only the `H⁰`/`H¹` endpoints hold; higher global cohomology is not discarded.

### 4.4a Integrality of Klingen Satake parameters

Let `v | p`, let κ = `(k_w, l_w)_w` be a weight as in the standing hypotheses with `l_v = 2`, and let K be a neat level whose component at v is hyperspecial or Klingen and whose components at the other places above p are among the levels of gap:hilbert-siegel-models. Let π be a cuspidal automorphic representation of `G₁(𝔸)` of weight κ and central character `|·|²` such that `(π_f)^K` occurs in `H^i(X_{G₁,K}, ω^κ(−D)) ⊗ ℂ_p` for some `i ∈ {0, 1}`. Then `π_v` has nonzero Iwahori-fixed vectors, so it is a constituent of an unramified principal series; write its Hecke parameters as `[α_v p^{1−k_v/2}, β_v p^{1−k_v/2}, β_v^{−1}p^{k_v/2}, α_v^{−1}p^{k_v/2}]`, labelled so that ordinarity makes `α_vβ_v` a p-adic unit (BCGP21 proof of Proposition 2.4.24, p. 26; Remark 6.6.3, p. 166). Prove the Katz–Mazur inequality for the ordinary contributions: if π contributes to the ordinary part for the Klingen-type spherical operator `T_v` of §4.4 (BCGP21 §3.9.20, pp. 68–69; K_v hyperspecial, `k_v ≥ 4`) or for `U_{v,2}` of §4.3 (K_v Klingen, `k_v ≥ 2`), then `v_p(α_v) ≥ 0` and `v_p(β_v) ≥ 0`, hence both are units; equivalently, the Newton polygon of the four parameters multiplied by `p^{k_v/2−1}` equals the Hodge polygon with slopes `(0, 0, k_v − 1, k_v − 1)` (BCGP21 Remark 6.6.3, pp. 166–167). For `F = ℚ` this is P20 Corollary 14.9.1 (p. 102), whose k is `k_v − 2`; BCGP21 Remark 6.6.3 records that the argument extends to F, and this target is that extension. A unit product alone does not suffice.

A proof route (P20 §14.9, pp. 102–104): at Klingen level twist the coefficient by `I_v^{−3}`, where `I_v = det ω_{G_v} ⊗ det ω_{G′_v}^{−1}` is the invertible ideal of the differential of the second isogeny of the chain `G → G′ → G` at v, an integral structure on `ω^κ(−D)[1/p]`. Show that the normalized Hecke operators at v attached to Lagrangian subgroups of `G_v[p]` (the Siegel-type spherical operator `T_{v,1}` of §4.4 at hyperspecial level, BCGP21 §3.9.19, p. 68, and its Klingen-level counterpart on the twisted coefficient) act integrally on the formal locus of p-rank at least one at v, from the trace and differential divisibilities on the multiplicative, mixed and étale components at ordinary points (P20 Lemma 14.9.1 and §14.9.2, pp. 103–104). Restriction from the integral model to that locus is an isomorphism on `H⁰` and injective on `H¹` modulo every `p^n`, its complement having codimension two in the Cohen–Macaulay special fibre (P20 Lemma 14.9.2, p. 103); so an eigenclass of negative slope dies modulo every `p^n` and vanishes, and these operators have only eigenvalues of nonnegative valuation on `H⁰` and `H¹` (P20 Proposition 14.9.1, p. 102). A Newton-polygon computation with the Hecke polynomial at v then gives the inequality (P20 Corollary 14.9.1 and its proof, pp. 102–103).

*Needs:* §4.3; §4.4; gap:hilbert-siegel-models; gap:lci-fundamental-class; SchemeAndStackFoundations §0.17, §2.7; ShimuraCompactifications §4.3; AutomorphicBundles §12.1; HodgeTateAndCanonicalSubgroups §0.14, §0.16; SmoothRepresentationsOfLocalGroups §SR.4.5.

**Checks.**

- Unit product without integrality: at `p = 3` and `k_v = 4`, `(α_v, β_v) = (1/3, 3)` has `α_vβ_v = 1`, but the normalized parameters `[α_v, β_v, β_v^{−1}·27, α_v^{−1}·27]` have valuations `(−1, 1, 2, 4)`, whose Newton polygon starts with slope `−1 < 0`, below the Hodge polygon `(0, 0, 3, 3)`. The inequality excludes this pair; integrality of the `U_{v,2}`-eigenvalue `α_vβ_v` alone admits it.
- With `a = v_p(α_v) ≥ 0`, `b = v_p(β_v) ≥ 0` and `a + b = 0` (ordinarity), `a = b = 0`; with `a + b = 0` alone, `(a, b) = (−1, 1)` is possible.
- The endpoints do not detect the failure: both `(0, 0, 3, 3)` and `(−1, 1, 2, 4)` sum to `6 = 2(k_v − 1)`, the valuation of the product `p^{2(k_v−1)}` of the normalized parameters; only the first slope separates them.
- For `F = ℚ` and `κ = (k + 2, 2)` the Hodge slopes are `(0, 0, k + 1, k + 1)`, as in P20 Corollary 14.9.1; that corollary needs `k ≥ 1` at hyperspecial level, which with `k_v ≡ l_v mod 2` is `k_v ≥ 4`, and allows `k ≥ 0`, that is `k_v ≥ 2`, at Klingen level.

### 4.5 The Hida family complex

Define `M_I = e(U^I) RΓ(𝔛_I, Ω^{κ_I}(−D))` on the formal mixed-level infinite height-one tower, as a derived `Λ_I`-module, where the limit and completion are those of the equivariant integral sheaf (BCGP21 Theorem 4.6.1 and §4.6.1, pp. 105–108). At a classical character use the derived tensor product with `Λ_I/ker δ_κ`.

*Needs:* §4.2; §4.3; HigherHidaAndColemanTheory §2.3; PadicFamilies §0a.25.

The basic properties are:

- `M_I` is the `U^I`-ordinary derived formal global section complex.
- There is a derived character-specialization map to formal fixed-weight cohomology.
- Prime-to-p Hecke operators and all commuting U factors act.
- Pullback and trace along compatible tame levels intertwine the coefficient action.

**Checks.**

- `I = ∅` has amplitude `[0, 0]` in §4.7.
- For `F = ℚ`, `I = {p}`, base change of the Klingen complex of HigherHidaAndColemanTheory §9.4 from `ℤ_p[[ℤ_p^×]]` to the component `ℤ_p[[1 + pℤ_p]]` of the trivial finite character recovers `M_I`, with the same determinant and character convention.
- Before flatness, `H^j(M_I) ⊗ κ` is not the derived fibre: for `M = [Λ --T--> Λ]` over `Λ = ℤ_p[[T]]`, the fibre at `T = 0` has cohomology `ℤ_p` in both degrees while `H^0(M) ⊗ Λ/T = 0`.

### 4.6 Trace congruence and Hasse dévissage

Fix `J ⊂ I` and write `Jᶜ = S_p ∖ J`, which contains `Iᶜ`. Let `X_1^{I,=J1}` be the closed subscheme cut out by the partial Hasse invariants `Ha_w`, `w ∈ J`, in the open of the spherical special fibre `X_{G₁,1}^I` of §4.4 on which `G_v` is ordinary for every `v ∈ Jᶜ`; its points have p-rank exactly one at the places of J and are ordinary at those of `Jᶜ`. Let `X_{1,mix}^{I,=J1}` be its inverse image in the mixed-level special fibre of §4.1, which carries at every `v | p` a multiplicative subgroup `H_v ⊂ G_v[p]` of order p (at `v ∈ Iᶜ` extended to the ordinary flag `H_v ⊂ G_v[p]^m`). The forgetful map `π_J : X_{1,mix}^{I,=J1} → X_1^{I,=J1}` is finite étale of degree `(p+1)^{|Jᶜ|}`: at `v ∈ J` the multiplicative part of `G_v[p]` has order p and is `H_v`, while at `v ∈ Jᶜ` it is étale locally `μ_p × μ_p`, which has `p + 1` subgroups of order p (BCGP21 §4.6.8, p. 109). Throughout, κ satisfies the weight hypotheses of BCGP21 §4.6.8 (p. 109): `l_v ≥ 3` for `v ∈ Iᶜ`; `k_v ≥ 3` and `l_v ≥ 2` for `v ∈ I`; and in addition `l_v ≥ p + 1` and `k_v ≥ 2p + 3` for `v ∈ J`. The operators `T_w` (`w | p`) and `T_{w,1}` (`w ∈ Iᶜ`) of §4.4 act on `H⁰(X_1^{I,=J1}, ω^κ(−D))`, and `U_{w,2}` (`w | p`) and `U_{w,1}` (`w ∈ Iᶜ`) of §4.3 on `H⁰(X_{1,mix}^{I,=J1}, ω^κ(−D))`, because all of them commute with the partial Hasse invariants (BCGP21 §4.6.8, p. 109). Write `T_I′ = ∏_{w|p} T_w ∏_{w∈Iᶜ} T_{w,1}`, the operator `T_I` of §4.4 multiplied by `T_w` for `w ∈ Iᶜ`; its factors commute, at the places of `Iᶜ` by BCGP21 Lemma 4.2.36 (p. 94).

Let `𝔛^{I,=J1}` and `𝔛_mix^{I,=J1}` be the formal completions, along `X_1^{I,=J1}` and `X_{1,mix}^{I,=J1}`, of the opens of the spherical and mixed-level integral models (gap:hilbert-siegel-models, with compatible toroidal compactifications) in which these strata are closed: the loci of p-rank at least one at I, ordinary at every `v ∈ Jᶜ` and, at mixed level, with every `H_v` multiplicative. Their ideal of definition 𝓘 contains p, and `𝓘/p` is generated locally by the `Ha_w`, `w ∈ J`, each read as a function through a local trivialization of `det(ω_w)^{p−1}`, that is, by the images of `Ha_w : det(ω_w)^{1−p} → O` (BCGP21 p. 111). Define the integral section modules

    A_κ = H⁰(𝔛^{I,=J1}, ω^κ(−D)),    B_κ = H⁰(𝔛_mix^{I,=J1}, ω^κ(−D)),

`ι : A_κ → B_κ` the pullback along the finite étale lift `𝔛_mix^{I,=J1} → 𝔛^{I,=J1}` of `π_J`, and `Tr : B_κ → A_κ` the coefficient trace of that lift (AutomorphicBundles §12.1, on each thickening modulo a power of 𝓘 and then in the limit). For `w ∈ Jᶜ` let `𝔛_w` be the correspondence over `𝔛^{I,=J1}` parametrizing finite flat totally isotropic subgroups `L_w ⊂ G_w[p²]` with multiplicative part of order p and étale part of order `p³` (so of order `p⁴`, étale locally an extension of `ℤ/p ⊕ ℤ/p²` by `μ_p`), with first projection `x₁`, the forgetful map, and second projection `x₂ : (G, L_w) ↦ G/L_w` with its induced polarization and level, defined after refining the fan (ShimuraCompactifications §4.3). Define `T̃_w : A_κ → A_κ` by `T̃_w f = p^{−(l_w+3)} Tr_{x₁}(φ_w(x₂^*f))`, where `φ_w : x₂^*ω^κ(−D) → x₁^*ω^κ(−D)` is induced by the differential of the universal isogeny `G → G/L_w` and `Tr_{x₁}` is the coefficient trace of the finite flat `x₁` (BCGP21 pp. 109–110 and p. 112). For `w ∈ Jᶜ` the correspondence of `U_{w,2}` (§4.3) is finite flat over the w-ordinary locus, so `U_{w,2}` acts on `B_κ`.

Prove the trace congruence: if `Jᶜ ≠ ∅` and `r = min_{w∈Jᶜ}(k_w − l_w)`, then for every `n ≥ 1` and every `f ∈ A_κ`

    Tr((∏_{w∈Jᶜ} U_{w,2})^n ι(f)) − p^{|Jᶜ|} (∏_{w∈Jᶜ} T̃_w)^n f  ∈  p^r A_κ

(BCGP21 Lemma 4.6.16, p. 112). If `Jᶜ = ∅`, then `J = I = S_p`, `π_J` is an isomorphism, `Tr ∘ ι` is the identity, and pullback along `π_J` intertwines `T_w` with `U_{w,2}` at every place (BCGP21 Lemma 4.6.13, p. 110), so the stratum comparison below holds on this stratum without any congruence; no minimum is formed.

Prove the stratum comparison: there is a constant C depending only on p and F, not on the tame level, such that if κ satisfies the hypotheses above, `l_w ≥ 2` and `k_w − l_w ≥ C` for every `w | p`, and `l_w ≥ C` for `w ∈ Iᶜ`, then `U^I` acts locally finitely on `H⁰(X_{1,mix}^{I,=J1}, ω^κ(−D))`, `T_I′` acts locally finitely on `H⁰(X_1^{I,=J1}, ω^κ(−D))`, and pullback followed by the ordinary projector, `e(U^I) ∘ ι : e(T_I′)H⁰(X_1^{I,=J1}, ω^κ(−D)) → e(U^I)H⁰(X_{1,mix}^{I,=J1}, ω^κ(−D))`, is an isomorphism intertwining `T_{w,1}` with `U_{w,1}` for `w ∈ Iᶜ` and `T_w` with `U_{w,2}` for `w ∈ J` (BCGP21 Proposition 4.6.9, p. 109; Lemma 4.2.37, p. 95; Corollary 4.6.15 and Lemma 4.6.17, pp. 110–113).

Prove the ordinary comparison: with the same constant C, if `l_w ≥ 2` and `k_w − l_w ≥ C` for every `w | p` and `l_w ≥ C` for `w ∈ Iᶜ`, then `U^I` acts locally finitely on `RΓ(X_{G₁,1,mix}^I, ω^κ(−D))`, where `X_{G₁,1,mix}^I` is the mixed-level special fibre of §4.1 over `X_{G₁,1}^I`, and pullback followed by `e(U^I)` is a quasi-isomorphism `e(T_I′)RΓ(X_{G₁,1}^I, ω^κ(−D)) → e(U^I)RΓ(X_{G₁,1,mix}^I, ω^κ(−D))` (BCGP21 Proposition 4.6.19, pp. 113–114). No hypothesis `l_w ≥ p + 1` is imposed here: the stratum comparison is applied to twists of κ that satisfy it.

A proof route for the congruence: expand both sides as sums over composite isogenies. On the left each kernel `L ⊂ G_w[p^{2n}]` that is étale locally an extension of `ℤ/p^n ⊕ ℤ/p^{2n}` by `μ_{p^n}` occurs once for each of the p multiplicative lines `H_w` meeting it trivially, at every `w ∈ Jᶜ`; on the right it occurs once, and the remaining kernels contain the multiplicative part of `G_w[p]`, so their coefficient maps are divisible by `p^{k_w−l_w}`; the normalizations agree, `p^{−n Σ_{w∈Jᶜ}(l_w+3)}` on both sides.

A proof route for the stratum comparison: the map is first shown to be bijective on the ordinary parts of `A_κ` and `B_κ` and the result is then reduced modulo 𝓘 (BCGP21 proof of Lemma 4.6.17, p. 113). Surjectivity comes, by 𝓘-adic approximation, from the special fibre, where the lift `T̃_w″` of `T̃_w` to the mixed-level stratum, defined by sending `(G, L_w)` to `G/L_w` with the multiplicative subgroup `(G_w[p] + L_w)/L_w` of order p, satisfies `U_{w,2} ∘ T̃_w″ = U_{w,2}²`, and where `T̃_w = T_w` when `k_w − l_w ≥ 1` (BCGP21 Lemma 4.6.12 and Corollary 4.6.15, pp. 110–111). For injectivity, the ordinary projectors are the 𝓘-adic limits of the `k!`-th powers of the operators, so applying the congruence along `n = k!` as `k → ∞` gives `Tr ∘ e(∏_{w∈Jᶜ}U_{w,2}) ∘ ι ≡ p^{|Jᶜ|} e(∏_{w∈Jᶜ}T̃_w)` modulo `p^r A_κ`. If f lies in the ordinary part of `A_κ` and `e(∏U_{w,2})ι(f) = 0`, then `p^{|Jᶜ|}f ∈ p^r A_κ`, so `f ∈ p^{r−|Jᶜ|}A_κ` by `ℤ_p`-flatness; when `r > |Jᶜ|` the kernel is therefore p-divisible, `B_κ` being flat, and it vanishes because `A_κ` is p-adically separated. The source assumes `k_w − l_w > p^{|Jᶜ|}` for `w ∈ Jᶜ`, which implies `r > |Jᶜ|`; C absorbs both.

A proof route for the ordinary comparison: both sides are computed by Hasse–Cousin complexes whose terms, indexed by the subsets J of I, are colimits over n, along multiplication by `∏_{w∈J}Ha_w`, of `H⁰`, over the locus ordinary at `Jᶜ`, of `ω^κ(−D) ⊗ ⊗_{w∈J} det(ω_w)^{n(p−1)}` modulo `(Ha_w^n)_{w∈J}` (BCGP21 §4.2.30 and the proof of Proposition 4.6.19, pp. 113–114); the operators commute with the Hasse invariants, so it suffices to compare, for every exponent vector `(n_w)_{w∈J}` with all `n_w ≥ 1`, the quotients of `ω^κ(−D) ⊗ ⊗_{w∈J} det(ω_w)^{n_w(p−1)}` by `(Ha_w^{n_w})_{w∈J}`. Lower one exponent at a time: for `w₀ ∈ J`, multiplication by `Ha_{w₀}` embeds the quotient with exponent `n_{w₀} − 1` at `w₀` into the quotient with exponents `(n_w)`, with cokernel the quotient with exponent 1 at `w₀` and `n_w` elsewhere; the sequence is exact because `Ha_{w₀}` is regular after arbitrary powers of the other partial Hasse invariants (gap:partial-hasse-regularity), and its terms are acyclic. When every exponent is one the term is `H⁰(X_1^{I,=J1}, ω^{κ′}(−D))` for the twist κ′ of κ by `det(ω_w)^{n_w(p−1)}` at `w ∈ J`, which has the same differences `k′_w − l′_w`, `l′_w ≥ 2 + (p − 1) = p + 1` and `k′_w ≥ 2p + 3` once `C ≥ p + 2`, so the stratum comparison applies; the five lemma, filtered colimits and exactness of ordinary projectors on locally finite actions finish. Lowering all exponents simultaneously does not give an exact sequence when `|J| ≥ 2` (Source issues).

*Needs:* §4.1; §4.3; §4.4; gap:hilbert-siegel-models; gap:hilbert-siegel-partial-igusa; gap:partial-hasse-regularity; AutomorphicBundles §12.1; AutomorphicBundlesPartII §5.1, §5.2; HodgeTateAndCanonicalSubgroups §0.14, §0.16; ShimuraCompactifications §4.3, §7.16.

The basic properties are:

- `π_J` is finite étale of degree `(p+1)^{|Jᶜ|}`, and the map `𝔛_mix^{I,=J1} → 𝔛^{I,=J1}` forgetting the `H_v` is its unique finite étale lift, of the same degree, so `Tr ∘ ι = (p+1)^{|Jᶜ|}` on `A_κ` (AutomorphicBundles §12.1, unit law).
- `A_κ` and `B_κ` are 𝓘-adically complete and separated and `ℤ_p`-flat; reduction modulo 𝓘 maps them onto `H⁰(X_1^{I,=J1}, ω^κ(−D))` and `H⁰(X_{1,mix}^{I,=J1}, ω^κ(−D))` and carries ι to the pullback along `π_J`, because these strata have affine image in the minimal compactification, so the higher cohomology of the cuspidal coefficient on them and on their thickenings vanishes (BCGP21 p. 111).
- `ι : A_κ → B_κ` is injective, the lift of `π_J` being finite étale and surjective, and `ι` and `Tr : B_κ → A_κ` are linear over the functions on `𝔛^{I,=J1}`.
- `T̃_w` preserves `A_κ`; the `T̃_w` for distinct `w ∈ Jᶜ` commute; and when `k_w − l_w ≥ 1` the reduction of `T̃_w` modulo 𝓘 is `T_w` (BCGP21 Lemma 4.6.12(1), p. 110).
- The ordinary projectors `e(∏_{w∈Jᶜ}T̃_w)` on `A_κ` and `e(∏_{w∈Jᶜ}U_{w,2})` on `B_κ` exist, as inverse limits of the projectors of the locally finite actions on the thickenings modulo powers of 𝓘, and commute with reduction modulo 𝓘.

**Checks.**

- Counts at `p = 3`: one place in `Jᶜ` gives a cover of degree 4, `Tr ∘ ι = 4` and leading factor 3; two places give 16 and 9. At `n = 0` the left side of the congruence would be `Tr ∘ ι(f) = 4f`, and `4f − 3f = f` is not in `3A_κ` for `f ∉ 3A_κ`: the congruence holds for `n ≥ 1` only, and fails at `n = 0` whenever `r ≥ 1`.
- The leading factor counts lines: at an ordinary place the multiplicative part of `G_w[p]` has `p + 1` lines, the multiplicative part of `L_w` is one of them, and `L_w` meets `H_w` trivially exactly for the other p; so each `L_w` occurs p times on the left and once on the right, and the factor is `p^{|Jᶜ|}`. Counting all `p + 1` lines would give `(p+1)^{|Jᶜ|}`, the value at `n = 0`.
- The congruence lives on the flat modules: at `p = 3`, one place in `Jᶜ`, `r = 2` and `n = 1` it says that `Tr U ι f − 3T̃f` lies in `9A_κ`; in `ℤ₃` the congruence `0 ≡ 3 mod 9` is false, so a composite killing f forces `T̃f ∈ 3A_κ`. On the special fibre, an `𝔽₃`-vector space, 3 and 9 act as zero: the witness `0 ≡ 3·1 mod 9` becomes `0 = 0`, and the reduced congruence only says `Tr ∘ U ∘ ι = 0` there, which says nothing about f; the injectivity argument cannot be run there.
- The threshold `r > |Jᶜ|` is needed: with one place in `Jᶜ` and `r = 1`, the conclusion `p T̃^n f ∈ p A_κ` holds for every f and gives nothing, while `r = 2` gives `T̃^n f ∈ pA_κ`. The source bound `k_w − l_w > p^{|Jᶜ|}` (greater than 3 at `p = 3`, one place) implies it.
- The empty complement: `Jᶜ = ∅` forces `J = I = S_p`, since `Iᶜ ⊂ Jᶜ`; the cover has degree `(p+1)^0 = 1`, `Tr ∘ ι` is the identity and the empty products are the identity. The minimum over the empty set is never formed: a convention `min ∅ = 0` would make the congruence vacuous and `min ∅ = +∞` would turn it into an equality; neither is used.
- Normalization: both sides carry `p^{−n Σ_{w∈Jᶜ}(l_w+3)}`; for one place with `l_w = 2` and `n = 1` this is `p^{−5}`, the normalization of `U_{w,2}` in §4.3 (`p^{−3}` times the determinant factor `p^{−l_w}`). An operator normalized by `p^{−3}` alone is `p^{l_w}T̃_w`; with it the right side changes by `(9 − 1)·3T̃f = 24T̃f` at `p = 3`, of valuation 1 when `T̃f ∉ 3A_κ`, so the congruence modulo 9 fails.
- The dévissage twist: twisting by `det(ω_w)^{p−1}` at `w ∈ J` raises `l_w = 2` to `p + 1` (4 at `p = 3`) and `k_w` by `p − 1`, leaving `k_w − l_w` unchanged; this is why the ordinary comparison needs only `l_w ≥ 2` at J while the stratum comparison needs `l_w ≥ p + 1` there.
- The simultaneous-powers recursion fails for two parameters: in `k[x,y]` the length of `k[x,y]/(x^n,y^n)` is `n²`, while a recursion `(n−1)² + 1` gives 2 at `n = 2` instead of 4.

### 4.7 Derived ordinary control

Prove: `M_I` is perfect over `Λ_I` of amplitude `[0, |I|]`; for every classical κ in the component, pullback to the height-one tower followed by the highest-weight projection `ω^κ → Ω^κ` of §4.2 is a quasi-isomorphism from `e(U^I)RΓ` of the formal mixed-level variety with the full coefficient `ω^κ(−D)` to the derived `δ_κ`-fibre of `M_I` (BCGP21 Theorem 4.6.1(3), p. 105; Lemma 4.6.25, p. 115); and for `k_v − l_v` large at all v and `l_v` large on `Iᶜ`, the spherical comparison is an isomorphism on `H⁰` and injective on `H¹` (BCGP21 Theorem 4.6.1, pp. 105–106; Lemmas 4.6.22–4.6.27, pp. 114–116). No classical quasi-isomorphism for arbitrary `|I|` is asserted.

A proof route: compare at one witness weight large at all places; show the product `U^I` is divisible by p on the highest-weight kernel; apply §4.6 and residual detection of perfect amplitude; transport to all characters by derived control.

*Needs:* §4.6; §4.5; DeformationAndDerivedPatchingAlgebra §7.1, §7.3.

**Checks.**

- `I = ∅` gives amplitude `[0, 0]`, so `M_∅` is a finite projective `Λ_∅`-module in degree 0.
- `F = ℚ`, `I = {p}` gives amplitude `[0, 1]`, agreeing with HigherHidaAndColemanTheory §9.8.
- Divisibility of `U^I` by p on the kernel is needed for the product only; for an individual factor at a single place it can fail and is not used.

### Examples

For `F` real quadratic with `p` split, `S_p = {v₁, v₂}` and `I = {v₁}`: `Λ_I` has three variables, `U^I = U_{v₁,2}U_{v₂,1}U_{v₂,2}`, and `M_I` is perfect of amplitude `[0, 1]`.

### Dependencies

AutomorphicBundles §12.1, §12.11; AutomorphicBundlesPartII §5.1, §5.2; DeformationAndDerivedPatchingAlgebra §7.1, §7.3; HigherHidaAndColemanTheory §2.3, §9.4, §9.8; HodgeTateAndCanonicalSubgroups §0.14, §0.16, §5.1; PadicFamilies §0a.25; PadicMeasuresIwasawaAlgebras §1.7; SchemeAndStackFoundations §0.17, §2.7; ShimuraCompactifications §4.1, §4.3, §7.16, §7.25; SmoothRepresentationsOfLocalGroups §SR.4.5; gap:hilbert-siegel-models; gap:hilbert-siegel-partial-igusa; gap:lci-fundamental-class; gap:partial-hasse-regularity; §3.2.

## Layer 5: Hilbert weight-two doubling

The standing hypotheses of Layer 4 hold. The geometric statements of §§5.2–5.5 and 5.7–5.8 concern the special fibre in characteristic p, after the normalized correspondences are constructed integrally; write `X₁` for special fibres, `Y₁^I` for the interior of the mixed multiplicative-flag special fibre and, for `w ∈ I`, `D_w = Y₁^{I,=w1}` for its non-ordinary rank-one divisor at w. In this layer `ω_v` denotes the determinant of the Hodge bundle at the place v, a line bundle, `ω = ⊗_{v|p} ω_v`, and `ω²` the scalar-weight-two line bundle `⊗_v det(ω_v)²` of §4.2; the partial Hasse invariant `Ha_w` is a section of `ω_w^{p−1}` whose zero locus on `Y₁^I` is `D_w`. The companion calculation of §5.6 works over any commutative ring.

### 5.1 Klingen and Iwahori first operators

At `w ∈ I` let `U_Kli = p^{−min(3, l_w+1)}` times the raw first trace, `U_Iw = p^{−3}` times its étale part and `Z = p^{−l_w−1}` times its multiplicative–étale part. Prove `U_Kli = U_Iw + p^{l_w−2}Z` for `l_w ≥ 2` and `U_Kli = p^{2−l_w}U_Iw + Z` for `l_w ≤ 2` (BCGP21 §§5.2–5.4, pp. 119–122; the two identities on p. 121).

*Needs:* §4.3; SmoothRepresentationsOfLocalGroups §SR.1.4.

**Checks.**

- At `l_w = 2` both formulas give `U_Kli = U_Iw + Z`.
- At `l_w = 3` the first gives `U_Kli = U_Iw + pZ`; at `l_w = 1` the second gives `U_Kli = pU_Iw + Z`.
- The scalar arithmetic: for `l_w ≥ 2`, `p^{−3}(raw_et + raw_me) = U_Iw + p^{−3}p^{l_w+1}Z`.

### 5.2 Partial Frobenius on the rank-one divisor

Define `F_w : Y₁^I → Y₁^I` as the quotient by `ker(Frob)` of `G_w` at w and by `A[v]` at `v ≠ w`, with polarization descended from `p² x_w λ` and tame marking `p^{−1}πη` for the quotient isogeny π. Prove that `F_w` is finite flat of degree `p³` on `Y₁^I` and of degree `p²` on `D_w`, and `F_w^*ω_w ≅ ω_w^p` (BCGP21 Definition 5.6.2 and Proposition 5.6.3, p. 126). Nothing is asserted on the toroidal boundary.

*Needs:* §4.1; gap:hilbert-siegel-models.

The basic properties are:

- The polarized partial-primary quotient with its level transport.
- Degrees `p³` on `Y₁^I` and `p²` on `D_w`.
- `F_w^*ω_w ≅ ω_w^p`.
- For `v ≠ w`, `F_w^*ω_v ≅ ω_v` through the canonical identification `A[v^∞]/A[v] ≅ A[v^∞]`.

**Checks.**

- For `F = ℚ` this is the rank-one Siegel partial Frobenius with the stated polarization.
- The degree on the divisor is `p²`, not the ambient `p³`.
- The tame marking includes the transport `p^{−1}π`; it is not the identity on markings.

### 5.3 Kodaira–Spencer scaling and the first boundary trace

On `D_w` write `L = ω²|_{D_w}` and `A = ω_w|_{D_w}`, both line bundles. The Kodaira–Spencer isomorphism `K_{Y₁^I} ≅ ω³` (BCGP21 Proposition 5.5.3, p. 124) and the adjunction formula, with `O(D_w)` identified with `ω_w^{p−1}` through `Ha_w`, give `K_{D_w} ≅ ω³ ⊗ ω_w^{p−1}|_{D_w}`, hence `L ≅ K_{D_w} ⊗ ω^{−1} ⊗ A^{1−p}` and `L ⊗ A^{p−1} ≅ K_{D_w} ⊗ ω^{−1}`. For a line bundle 𝓛 on `D_w`, the twisted trace of the finite flat `F_w : D_w → D_w` of §5.2 is the map `F_{w,*}(K_{D_w} ⊗ F_w^*𝓛) → K_{D_w} ⊗ 𝓛` obtained from the trace `F_{w,*}K_{D_w} → K_{D_w}` on dualizing sheaves by the projection formula (SchemeAndStackFoundations §2.19–§2.20; BCGP21 p. 127). Since `F_w^*ω^{−1} ≅ ω^{−1} ⊗ ω_w^{1−p}` (§5.2), the twisted trace for `𝓛 = ω^{−1}` has source `F_{w,*}L` and target `L ⊗ A^{p−1}`; define `γ₁ : F_{w,*}L → L ⊗ A^{p−1}` as `Norm(x_w)³/p³` times it (BCGP21 (5.6.6), p. 128).

Prove: the `O_F`-linear Kodaira–Spencer identification of the canonical sheaf with the product of the cubes of the determinant Hodge bundles is compatible with prime-to-p quasi-isogenies over `ℤ_(p)`; for the first p-correspondence form the normalized cohomological trace integrally, the factor `Norm(x_w)³/p³` being an integral unit; the map `Ha_w U_Iw : F_{w,*}ω² → ω² ⊗ ω_w^{p−1}`, defined on the w-ordinary locus `Y₁^{I,=w2}` through the identification of the Iwahori correspondence with that locus (second projection an isomorphism, first projection `F_w`), extends to `Y₁^I`, and its restriction to `D_w` is γ₁: `(Ha_w U_Iw f)|_{D_w} = γ₁(f|_{D_w})` for `f ∈ H⁰(Y₁^I, ω²)` (BCGP21 Propositions 5.5.1–5.5.3, pp. 123–124; Proposition 5.6.1, p. 125; Propositions 5.6.4–5.6.7, pp. 127–128).

*Needs:* §5.2; §5.1; gap:kodaira-spencer-isogeny; gap:lci-fundamental-class; SchemeAndStackFoundations §2.19, §2.20.

The basic properties are:

- `γ₁ : F_{w,*}L → L ⊗ A^{p−1}` is `O_{D_w}`-linear, and on global sections it is a map `H⁰(D_w, L) → H⁰(D_w, L ⊗ A^{p−1})`.
- Under the Kodaira–Spencer and adjunction identifications, γ₁ is `Norm(x_w)³/p³` times the twisted trace of `F_w` for `ω^{−1}`.
- Restriction to the divisor: `(Ha_w U_Iw f)|_{D_w} = γ₁(f|_{D_w})` for `f ∈ H⁰(Y₁^I, ω²)`.

**Checks.**

- The quasi-isogeny compatibility and the integral p-correspondence are separate steps; a raw inseparable differential is not substituted into the prime-to-p statement.
- The factor `Norm(x_w)³/p³` is a unit because `x_w` has valuation one at w and zero elsewhere above p, so `Norm(x_w)` has p-adic valuation one; without the denominator `p³` the factor `Norm(x_w)³` has valuation 3, vanishes on the special fibre and would make γ₁ zero.
- On `D_w` the composite `Ha_w U_Iw` is computed; `U_Iw` alone is not.
- γ₁ changes the coefficient: at `p = 3` it lands in `L ⊗ A²`, not in L, as the weight `ω² ⊗ ω_w^{p−1}` of `Ha_w U_Iw` requires; a γ₁ with target L would contradict the restriction identity, and γ₁ cannot be composed with itself.
- The trace is the trace on dualizing sheaves, not the trace of functions: for the local model `f ↦ f³` of Frobenius on `k[x, y]` in characteristic 3, finite flat of degree 9 like `F_w` on `D_w` at `p = 3`, the trace on two-forms sends `x²y² dx∧dy` to `dx∧dy` and kills `x^a y^b dx∧dy` unless `a ≡ b ≡ 2 mod 3`, whereas the trace of functions of the purely inseparable extension `k(x, y)/k(x³, y³)` is zero; a γ₁ built from the function trace would vanish identically.

### 5.4 The second operator on the rank-one divisor

Let `p₁, p₂ : C_{w,2}^I → Y^I` be the two projections of the `U_{w,2}` correspondence, whose points are isogenies `p₁^*G → p₂^*G` with kernel a totally isotropic subgroup of `G_w[p²]` meeting `p₁^*H_w` trivially. Pullback of differentials along the universal isogeny gives `δ₀ : p₂^*ω_w → p₁^*ω_w`. On `D_w`, where `p₂` is an isomorphism and `p₁` is `F_w²` (both proved below), the map `δ = p^{−1}δ₀`, an isomorphism by the statement below, restricts to an isomorphism `δ_D : A → (F_w²)^*A ≅ A^{p²}`, that is a nowhere-vanishing section of `A^{p²−1}`; its inverse `δ_D^{−1} : A^{p²} → A` is a nowhere-vanishing section of `A^{1−p²}` (BCGP21 Proposition 5.7.4 and the paragraph after it, p. 130, where the restriction of δ itself is labelled `δ⁻¹`; see Source issues). Since `F_w^*(ω^{−1} ⊗ ω_w^{1−p}) ≅ ω^{−1} ⊗ ω_w^{1−p²}`, define `γ₂ : F_{w,*}(L ⊗ A^{p−1}) → L` as `Norm(x_w)³/p³` times the composite of the identification `F_{w,*}(L ⊗ A^{p−1}) ≅ F_{w,*}(K_{D_w} ⊗ ω^{−1})` of §5.3, multiplication by `δ_D^{−1}` into `F_{w,*}(K_{D_w} ⊗ ω^{−1} ⊗ A^{1−p²})`, and the twisted trace of `F_w` for `𝓛 = ω^{−1} ⊗ A^{1−p}` into `K_{D_w} ⊗ ω^{−1} ⊗ A^{1−p} ≅ L` (BCGP21 (5.7.7), pp. 131–132).

Prove: on the interior formal locus `p₁` is finite flat of degree `p⁴`; on `D_w` the projection `p₂` is an isomorphism and `p₁` identifies with `F_w²`; `δ₀` is divisible by p and `δ = p^{−1}δ₀ : p₂^*ω_w → p₁^*ω_w` is an isomorphism; and the restriction of `U_{w,2}` to `D_w` is the map of sheaves `γ₂ ∘ F_{w,*}γ₁ : (F_w²)_*L → L`, so that `(U_{w,2}f)|_{D_w} = γ₂(γ₁(f|_{D_w}))` for `f ∈ H⁰(Y₁^I, ω²)` (BCGP21 Lemma 5.7.2 and Proposition 5.7.3, p. 129; Proposition 5.7.4, p. 130; Propositions 5.7.6, 5.7.8 and 5.7.9, pp. 131–132).

A proof route: describe `U_{w,2}` in scalar weight two through the trace of `p₁` on dualizing sheaves, multiplied by the inverse of δ and of the pullback isomorphisms `δ′ : p₂^*ω_v ≅ p₁^*ω_v` at the places `v ≠ w` (BCGP21 p. 130), and restrict it to `D_w` by adjunction (Proposition 5.7.6); rewrite `γ₂ ∘ F_{w,*}γ₁` as multiplication by `δ_D^{−p}` followed by the twisted trace of `F_w²` for `ω^{−1} ⊗ A^{1−p}`, normalized by `Norm(x_w)⁶/p⁶`, using `tr_{F_w}(F_w^*s · y) = s · tr_{F_w}(y)` and `F_w^*δ_D = δ_D^p` (Proposition 5.7.8).

*Needs:* §5.3; §5.2; §4.3; gap:lci-fundamental-class; SchemeAndStackFoundations §2.19, §2.20.

The basic properties are:

- `δ : p₂^*ω_w → p₁^*ω_w` is an isomorphism of line bundles with `pδ = δ₀`.
- On `D_w`, `δ_D : A → A^{p²}` is a nowhere-vanishing section of `A^{p²−1}`, with inverse a section of `A^{1−p²}`, and `F_w^*δ_D = δ_D^p`.
- `γ₂ : F_{w,*}(L ⊗ A^{p−1}) → L` is `O_{D_w}`-linear, and on global sections a map `H⁰(D_w, L ⊗ A^{p−1}) → H⁰(D_w, L)`.
- `γ₂ ∘ F_{w,*}γ₁ : (F_w²)_*L → L`, and `(U_{w,2}f)|_{D_w} = γ₂(γ₁(f|_{D_w}))`.

**Checks.**

- The composite is typed: at `p = 3`, `γ₁ : F_{w,*}L → L ⊗ A²`, `F_{w,*}γ₁ : (F_w²)_*L → F_{w,*}(L ⊗ A²)` and `γ₂ : F_{w,*}(L ⊗ A²) → L`; `F_w` has degree 9 on `D_w` and `F_w²` degree 81, the ambient degree `p⁴` of `p₁`.
- The multiplier in γ₂ is `δ_D^{−1}`, a section of `A^{1−p²}`, not δ_D and not a scalar: at `p = 3` the twisted trace for `ω^{−1} ⊗ A^{−2}` needs source `F_{w,*}(K_{D_w} ⊗ ω^{−1} ⊗ A^{−8})`, while `L ⊗ A² ≅ K_{D_w} ⊗ ω^{−1}` has A-exponent 0; `δ_D^{−1}` supplies −8, whereas `δ_D` would give +8 and a scalar unit 0.
- The rewriting of the composite: `F_w^*δ_D` has A-exponent `p(p² − 1)`, that of `δ_D^p`, and `δ_D^{−p}` moves `K_{D_w} ⊗ ω^{−1} ⊗ A^{1−p}` to A-exponent `1 − p − p³ + p = 1 − p³`, the exponent of `(F_w²)^*(ω^{−1} ⊗ A^{1−p})`; at `p = 3` these are 24 and −26.
- A coefficient of weight `(4, 2)` at w has `Sym²` of the Hodge bundle in it, of rank 3, and is not L; γ₁ and γ₂ are defined in scalar weight two only.
- Nothing is asserted on the toroidal boundary.

### 5.5 The quadratic relation

Prove: on the scalar-weight-two ordinary locus `U_Iw Z = U_{w,2}` (BCGP21 Lemma 5.8.1, p. 133); with `U_Kli = U_Iw + Z` (§5.1 at `l_w = 2`) and commutation this gives `U_Iw² − U_Kli U_Iw + U_{w,2} = 0` and the analogous relation for Z. The operators on the three domains involved are linked by restriction maps, not identified as endomorphisms of one space.

*Needs:* §5.1; §5.4; SmoothRepresentationsOfLocalGroups §SR.1.4.

**Checks.**

- Substituting `Z = U_Kli − U_Iw` into `U_Iw Z = U_{w,2}` gives `U_Iw U_Kli − U_Iw² = U_{w,2}`, the quadratic with positive constant term.
- On an eigenvector with `U_Iw = α` and `U_{w,2} = αβ` the relation gives `U_Kli = α + β`.
- With `α = 2`, `β = 3`: `4 − 5·2 + 6 = 0`.

### 5.6 The doubling companion operator

For linear endomorphisms T, U of a module M over a commutative ring define `C_{T,U}(x, y) = (Tx + Uy, −x)` on `M ⊕ M`, built from `LinearMap.prod` and `LinearMap.coprod`. Prove `C² − diag(T)∘C + diag(U) = 0`, with `diag(T)` applied after C, and that if U is invertible then `(x, y) ↦ (−y, U^{−1}x + U^{−1}Ty)` is a two-sided inverse of C (BCGP21, the matrix before Lemma 5.8.2, p. 133, and its inverse in the proof of Lemma 5.8.3, pp. 133–134). In the geometric application `T = U_Kli` and `U = U_{w,2}` act on global sections, and the doubling map `(f, g) ↦ f + Zg` has target the sections over the w-ordinary open.

*Needs:* Mathlib `LinearMap.prod`, `LinearMap.coprod`, `Module.End`; §5.5.

The basic properties are:

- `C_{T,U}(x, y) = (Tx + Uy, −x)`.
- `C² − diag(T)∘C + diag(U) = 0` for all T and U; no commutation is needed in this order of composition.
- For invertible U the stated map is a two-sided inverse; again no commutation is needed.
- On an eigenvector `(f, −ξ^{−1}f)` of C with eigenvalue ξ, `Tf = ξf + ξ^{−1}Uf`.

**Checks.**

- Over ℤ with `T = 5`, `U = 6`, `C(2, 3) = (28, −2)`, and the characteristic polynomial is `X² − 5X + 6` with roots 2 and 3.
- `T = U = 0` gives `C(x, y) = (0, −x)` and `C² = 0`.
- Replacing `−x` by `x` gives `C′² − diag(T)∘C′ − diag(U) = 0`, the polynomial `X² − TX − U`; the sign is essential.
- On a common module the map `(f, g) ↦ f + Zg` has the large kernel `{(−Zg, g)}`; the geometric injectivity of §5.8 rests on the different source and target spaces.

### 5.7 No everywhere-regular simultaneous eigenvector

Prove: in scalar weight two, a form `f ∈ H⁰(X_{G₁,1}^I, ω²(−D))` with `U_Kli f = (α + β)f`, `U_Iw f = αf`, `U_{w,2} f = αβ f` and `αβ ≠ 0` is zero (BCGP21 Theorem 5.8.4, p. 134; Proposition 5.4.3 and Corollary 5.4.5, pp. 121–122).

A proof route: if f restricts to zero on `D_w`, write `f = Ha_w g` with g a section of `ω²(−D) ⊗ ω_w^{1−p}`; then `Zg = βg` and Corollary 5.4.5 forces `g = 0`. Otherwise §§5.3–5.4 give `(U_{w,2}f)|_{D_w} = γ₂(γ₁(f|_{D_w})) = γ₂((Ha_w U_Iw f)|_{D_w}) = α γ₂((Ha_w f)|_{D_w}) = 0`, since `Ha_w` vanishes on `D_w`, whereas `(U_{w,2}f)|_{D_w} = αβ f|_{D_w} ≠ 0`, a contradiction.

*Needs:* §5.5; §5.3; §5.4.

**Checks.**

- The two cases, vanishing and nonvanishing restriction to `D_w`, exhaust the possibilities.
- The hypothesis `αβ ≠ 0` is used in the second case; for `β = 0` the form `U_{w,2} f = 0` gives no contradiction.
- The stronger vanishing of BCGP21 §5.9 (Remark 5.8.5) is not used.

### 5.8 The weight-two doubling injection

Prove: the map `Δ(f, g) = f + Zg` from `e(U_{w,2})H⁰(X_{G₁,1}^I, ω²(−D))^{⊕2}` to `e(U_Iw U_{w,2})H⁰(X^{I,=w2}_1, ω²(−D))` is injective and intertwines `C_{U_Kli, U_{w,2}}` with `U_Iw` (BCGP21 Theorem 5.8.6, p. 135).

A proof route: `U_{w,2}` is invertible on its ordinary part, so by §5.6 the companion operator C is invertible on the source, and Δ carries it to `U_Iw`; hence `ker Δ` is stable under C and under `U_{w,2}` (acting diagonally), which commute and act on it locally finitely and invertibly. Were `ker Δ` nonzero, after extending scalars it would contain a line on which `U_{w,2}` is a scalar u and C a scalar ξ, both nonzero. For a generator `(f, g)` the second coordinate of `C(f, g) = ξ(f, g)` reads `f = −ξg`, the first then reads `U_Kli f = (ξ + u/ξ)f`, and `Δ(f, g) = 0` reads `Zf = ξf`, so `U_Iw f = (u/ξ)f` on the w-ordinary open by §5.1. With `β = ξ` and `α = u/ξ` these are the eigen-equations that §5.7 excludes, so `f = 0` and then `g = 0`.

*Needs:* §5.1; §5.6; §5.7.

**Checks.**

- Equivariance: `U_Iw(f + Zg) = U_Iw f + U_{w,2} g = (U_Kli − Z)f + U_{w,2}g`, which is `Δ(C(f, g)) = (U_Kli f + U_{w,2}g) + Z(−f)`.
- The source is global sections and the target sections over the w-ordinary open; on one common module the map has a kernel.
- A generalized-eigenspace kernel is reduced to a genuine eigenvector after extending the coefficients.

### 5.9 Two unit-root refinements

Let M be a finite-dimensional subspace of `e(U_{w,2})H⁰(X_{G₁,1}^I, ω²(−D)) ⊗ 𝔽̄_p` stable under `U_Kli` and `U_{w,2}`, on which `U_Kli − (α + β)` and `U_{w,2} − αβ` are nilpotent for distinct `α, β ∈ 𝔽̄_p^×`. Prove: the algebra E generated by the two operators is local Artinian and contains lifts `α̃, β̃` with `(C − α̃)(C − β̃) = 0` on `M ⊕ M`; the maps `ι_ξ(f) = (f, −ξ̃^{−1}f)` for `ξ ∈ {α, β}` give `M ⊕ M ≅ M ⊕ M`, and the composite with Δ is `(f₁, f₂) ↦ (1 − β̃U_Iw^{−1})f₁ + (1 − α̃U_Iw^{−1})f₂`, so each component is injective into the `(U_Iw − ξ̃)`-part (BCGP21 Remark 5.8.7, p. 135).

*Needs:* §5.8; §5.6; Mathlib `Polynomial.aeval`, `Module.End.genEigenspace`.

**Checks.**

- `T = 5`, `U = 6`: the roots are 2 and 3, and `ι_2` has doubling image `(1 − 3U_Iw^{−1})f`: the formula uses the opposite root, since `α^{−1}Z = α^{−1}αβ U_Iw^{−1} = βU_Iw^{−1}`.
- Integral projectors need `α − β` to be a unit, not only nonzero; this is why the residual roots are assumed distinct.
- On a length-two Jordan block for `U_Kli` the nilpotent part is kept; no semisimplicity is assumed.

### Examples

At `F = ℚ`, `I = {p}`, scalar weight `(2, 2)`: an ordinary form of `U_{p,2}`-eigenvalue `αβ` with `α, β` distinct units produces two independent `U_Iw`-ordinary refinements, of eigenvalues α and β, on the p-ordinary open.

### Dependencies

Mathlib `LinearMap.prod`, `LinearMap.coprod`, `Module.End`, `Module.End.genEigenspace`, `Polynomial.aeval`; SchemeAndStackFoundations §2.19, §2.20; SmoothRepresentationsOfLocalGroups §SR.1.4; gap:hilbert-siegel-models; gap:kodaira-spencer-isogeny; gap:lci-fundamental-class; Layer 4.

## Layer 6: Hilbert higher Coleman families and the one-place comparison

The standing hypotheses of Layer 4 hold.

### 6.1 The analytic family complex and the geometric dagger complex

The parameters. An admissible tuple `(n, ε, w) = (n_v, ε_v, w_v)_{v|p}` consists of integers `n_v ≥ 1` and rationals `0 < w_v ≤ ε_v ≤ n_v − 1/(p−1)` at every place v above p; the radii are strictly positive, the closed intervals starting at 0 printed in BCGP21 §§6.1.4–6.1.7 being read as open at 0 (Source issues). The level at v is `p^{n_v}`. The parameter ε cuts out a Hodge–Tate neighbourhood of the multiplicative locus: `X_{K(I,p^n)}(ε)` is the quotient by `∏_{v∈Iᶜ}B(ℤ/p^{n_v}) ∏_{v∈I}Kli(ℤ/p^{n_v})` of the open of the normalized formal model of full level `p^n` on which the Hodge–Tate image of `e_{v,1}` lies in `p^{ε_v}ω^mod_{G_v}` modulo `p^{n_v−1/(p−1)}` at every v, and that of `e_{v,2}` as well at `v ∈ Iᶜ`; here `p^{1/(p−1)}ω ⊂ ω^mod ⊂ ω` is the modified lattice of gap:hilbert-siegel-frame-torsor. The parameter w is the radius of analyticity: `FL_{n,ε,w} → X_{K(p^n)}(ε)` parametrizes rank-one direct summands of `ω^mod_{G_v}` congruent to the canonical one modulo `p^{w_v}` (BCGP21 §§6.1.4–6.1.7, pp. 141–142). Larger parameters give smaller neighbourhoods and smaller discs.

The coefficients. Let A be a normal admissible `O_{ℂ_p}`-algebra and `κ_A : ∏_{v∈I} ℤ_p^× × ∏_{v∈Iᶜ} (ℤ_p^×)² → A^×` a character (`O_{F_v} = ℤ_p` because p splits completely). For rationals `0 < u_v ≤ w_v`, κ_A is u-analytic if it extends to a pairing `T_u × Spf A → 𝔾_m`, where `T_u(R) = ∏_{v∈I} ℤ_p^×(1 + p^{u_v}R) × ∏_{v∈Iᶜ} (ℤ_p^×(1 + p^{u_v}R))²` (BCGP21 §§6.1.7 and 6.1.9, pp. 142–143). For a u-analytic κ_A, take the invariants `L^{κ_A} = ((π₁)_*O ⊗̂ A)^{T⁰_u}`, for the diagonal action, on the frame torsor `FL⁺_{n,ε,w,u} → FL_{n,ε,w}` of bases congruent modulo `p^{u_v}` to the Hodge–Tate images of `e_{v,4}` (and of `e_{v,3}` at `v ∈ Iᶜ`); push forward to `X_{K(p^n)}(ε)`, take invariants under the group `T_{n,u}` and pass to the generic fibre over `Spa(A[1/p], A)`. The result is the Banach sheaf `F^{κ_A,w}` on `X_{K(I,p^n)}(ε)` (BCGP21 §6.1.9, p. 143; §6.3.3, pp. 147–148). It does not depend on u: for `u ≤ u′ ≤ w` the torsor for u is induced from the one for `u′` along `T⁰_{u′} ⊂ T⁰_u`, and κ_A is defined on `T_u`, so restriction of equivariant functions is an isomorphism. The admissible tuples for κ_A are therefore those for which κ_A is w-analytic. On a quasi-compact open of the weight space of `ℤ_p[[T_I]]` (`T_I` as in §4.2), after base change to `ℂ_p` and the choice of a normal admissible model A, the universal character is u-analytic as soon as every `u_v` is large enough (AIP15 Proposition 2.2.2, p. 7, stated for a product of copies of `ℤ_p^×`), hence on the admissible tuples of large level.

The analytic complex. Put `C_cusp(n, ε, w, κ_A) = RΓ(X_{K(I,p^n)}(ε), F^{κ_A,w} ⊗ det(ω_G)²(−D))`, with the determinant square and the transported ideal of D (written `C_cusp(n, ε, w, κ_A ⊗ (2,2))` in BCGP21 §6.3.4, p. 148); for a classical weight κ the input character is `κ_A = κ − (2, 2)`. If `(n, ε, w)` and `(n′, ε′, w′)` are admissible with `n′_v ≥ n_v`, `ε′_v ≥ ε_v` and `w′_v ≥ w_v` at every v, the forgetful map `X_{K(I,p^{n′})}(ε′) → X_{K(I,p^n)}(ε)` and restriction of w-analytic to w′-analytic sections give a map `C_cusp(n, ε, w, κ_A) → C_cusp(n′, ε′, w′, κ_A)`. These maps compose, the admissible tuples form a directed set under this order, and `H^†_{κ_A}` is the filtered colimit of the complexes `C_cusp(n, ε, w, κ_A)` over it, so that `H^i(H^†_{κ_A}) = colim H^i(C_cusp(n, ε, w, κ_A))` (BCGP21 §6.3.4, p. 148). For a classical κ write `H^†_κ` for the case `A = O_{ℂ_p}`, `κ_A = κ − (2, 2)`.

The geometric dagger complex. On the analytic mixed-level variety `X_{K_p(I)K^p}` of §4.1 let `deg_v ∈ [0, 1]` be the Fargues degree of the order-p subgroup `H_v` for `v ∈ I`, and `deg_v ∈ [0, 2]` that of the order-`p²` subgroup `L_v` for `v ∈ Iᶜ`; for rationals `ε_v` let `X((ε_v)_v)` be the quasi-compact open on which `deg_v ≥ 1 − ε_v` for `v ∈ I` and `deg_v ≥ 2 − ε_v` for `v ∈ Iᶜ`. At `ε = 0` it is the multiplicative locus `X^mult`, and the `X((ε_v)_v)` with every `ε_v → 0⁺` form a fundamental system of strict neighbourhoods of it (BCGP21 §6.5.2, pp. 154–155). For a dominant algebraic weight κ define the geometric dagger complex `G^†_κ = colim_{ε → 0⁺} RΓ(X((ε_v)_v), ω^κ(−D))`, the cohomology of the dagger space `X^{mult,†}` with the classical coefficient `ω^κ(−D)` (BCGP21 (6.5.5), p. 156). Restriction from the whole mixed-level variety is a Hecke-equivariant map `res^†_κ : RΓ(X_{K_p(I)K^p}, ω^κ(−D)) → G^†_κ` (BCGP21 §6.5.7, p. 156).

The comparison map. For a classical κ and every admissible tuple, the first map of the relative BGG resolution of §6.4, the inclusion of the highest-weight algebraic coefficient into the analytic one (HigherHidaAndColemanTheory §6.6), is a Hecke-equivariant map of sheaves `ω^κ(−D) → F^{κ−(2,2),w} ⊗ det(ω_G)²(−D)` on `X_{K(I,p^n)}(ε)`, compatible with the transition maps (BCGP21 Proposition 6.4.2, p. 153). For rationals `0 < ε_v ≤ 1/p` at every v, so that `X((ε_v)_v)` lies in the locus where `deg_v ≥ 1 − 1/p` at `v ∈ I` and `deg_v ≥ 2 − 1/p` at `v ∈ Iᶜ`, the product `∏_{v∈I}U_{v,2} ∏_{v∈Iᶜ}U_{v,1}` is compact on `RΓ(X((ε_v)_v), ω^κ(−D))`, and the canonical map to `RΓ(X_{K(I,p)}(ε₁), ω^κ(−D))`, `ε₁ = (1 − 1/(p−1))_v`, is a quasi-isomorphism on finite-slope parts, and the finite-slope part of `G^†_κ` is that of any such `RΓ(X((ε_v)_v), ω^κ(−D))` (BCGP21 Lemma 6.5.4 and the definition following it, pp. 155–156, with the range of radii read as under Source issues; at a Klingen place the inclusion into the Hodge–Tate neighbourhood is P20 Lemma 14.1.2, p. 92). Composing with the inclusion at the admissible `(n, ε) = ((1)_v, ε₁)` and with the colimit map defines `β_κ : G^†_κ → H^†_κ` on finite-slope parts. The two complexes have different coefficients, the line bundle `ω^κ(−D)` and the analytic sheaf of infinite rank, and are compared only through `β_κ` and the slope ranges of §6.4.

*Needs:* §4.1; §4.2; §4.3; HigherHidaAndColemanTheory §6.1, §6.2, §6.6; gap:hilbert-siegel-frame-torsor; HodgeTateAndCanonicalSubgroups §0.6, §5.5, §5.8; AdicSpacesPartIII §R2.10.

The basic properties are:

- For every admissible tuple and every w-analytic κ_A, `C_cusp(n, ε, w, κ_A)` is represented by a bounded complex of projective Banach `A[1/p]`-modules (BCGP21 Proposition 6.3.6, p. 148).
- The transition maps go from a tuple to a componentwise larger one, compose, and have `H^†_{κ_A}` as their colimit.
- `F^{κ_A,w}` is independent of the auxiliary radius u.
- For a classical κ the highest-weight algebraic map uses `κ_A = κ − (2, 2)`, and the coefficient includes `det(ω_G)²` and the transported ideal of D.
- `G^†_κ` carries the operators `U_{v,1}` (`v ∈ Iᶜ`) and `U_{v,2}` (every v) of §4.3, and `e(U^I)G^†_κ` is a perfect complex in degrees `[0, |I|]` (BCGP21 Lemma 6.5.6, p. 156).
- `res^†_κ` and `β_κ` are Hecke-equivariant; `res^†_κ` keeps the classical coefficient on both sides.

**Checks.**

- At scalar weight `(2, 2)` the analytic character `κ_A` is trivial.
- The modified lattice need not equal ω integrally; it contains `p^{1/(p−1)}ω`.
- The parameter bound: at `p = 3` and `n_v = 1` the bound `n_v − 1/(p−1)` is `1/2`; `(ε_v, w_v, u_v) = (1/4, 1/8, 1/16)` is admissible for the trivial character, which is u-analytic for every u, while `ε_v = 3/4` is excluded because `3/4 > 1/2`. A definition letting ε run up to `n_v` would admit it.
- Analyticity: at `p = 3` a character χ of `ℤ₃^×` of order 3, at one coordinate and trivial at the others, is u-analytic exactly when `u_v > 1`. For `u_v > 1` the subgroup `ℤ₃^× ∩ (1 + 3^{u_v}O_{ℂ_p}) = 1 + 9ℤ₃` lies in its kernel and χ extends by constancy on cosets; for `u_v ≤ 1` an analytic extension equals 1 on the infinite set `1 + 9ℤ₃`, hence on the connected disc `1 + 3^{u_v}O_{ℂ_p}`, which contains 4, while `χ(4) ≠ 1` since 4 generates `1 + 3ℤ₃`. No admissible tuple with `n_v = 1` (where `u_v ≤ w_v ≤ 1/2`) carries χ; `(n_v, ε_v, w_v, u_v) = (2, 3/2, 3/2, 3/2)` does, since `3/2 ≤ 2 − 1/2`.
- The direction of the transitions: at `p = 3` the tuples `(n, ε, w) = (1, 1/4, 1/8)` and `(2, 1/2, 1/4)` are admissible (`1/2 ≤ 3/2`), the first precedes the second, and there is a map `C_cusp(1, 1/4, 1/8, κ_A) → C_cusp(2, 1/2, 1/4, κ_A)`. No map goes the other way: in a flag coordinate z, the function `(1 − 3^{−1/8}z)^{−1}` is analytic on the disc `|z| ≤ |3|^{1/4}` but has a pole at `z = 3^{1/8}`, which lies in the disc `|z| ≤ |3|^{1/8}`.
- The radii are positive: at `u_v = 0` the set `1 + p⁰R = 1 + R` contains 0, so `T_u` is not a group and there is no torsor and no u-analytic character; for `u_v > 0` the set `1 + p^{u_v}R` is a group, the inverse of `1 + p^{u_v}x` being the geometric series. At `p = 3` the tuple `(n_v, ε_v, w_v, u_v) = (1, 1/4, 1/8, 1/16)` is admissible and `(1, 0, 0, 0)` is not.
- Classical against analytic coefficients: at `F = ℚ`, `I = {p}` and weight `(2, 2)`, `G^†_κ` has the line-bundle coefficient `det(ω)²(−D)`, while `H^†_κ` has the analytic sheaf of the trivial character twisted by `det(ω_G)²(−D)`, whose fibres are infinite-dimensional. A statement about `G^†_κ` is not one about `H^†_κ`; §6.5 records the slopes at which `β_κ` identifies them.
- The degree radius is measured from the multiplicative end, so `X((ε_v)_v)` grows with ε. At `p = 3` and `v ∈ I`, `ε_v = 1/3` gives `deg_v ≥ 2/3 = 1 − 1/p`, the hypothesis of P20 Lemma 14.1.2, whose radius is the lower bound of the degree itself; `ε_v = 2/3` gives `deg_v ≥ 1/3`, a larger set that the lemma does not cover. Reading the lemma's range `≥ 1 − 1/p` as a range of ε would admit the second.

### 6.2 Mixed Coleman amplitude

For a rational `ε > 0` let `n(ε)` be the level of gap:mixed-cube-cover above which the Hodge–Tate wedge products lift modulo `p^ε` to sections of the ample `det ω^mod`, and for a tuple put `n(ε) = sup_v n(ε_v)` (BCGP21 §6.2, p. 145). Prove: for every admissible tuple `(n, ε, w)` of §6.1 with `n_v ≥ n(ε)` at every v, and every w-analytic κ_A, the cuspidal analytic complex `C_cusp(n, ε, w, κ_A)` has cohomology concentrated in `[0, |I|]`; it is computed by the cubical Čech complex of the cover of `X^*_{K(p^n)}(ε)` by the `2^{|I|}` opens indexed by the vertices of `[2,3]^I`, whose face intersections are acyclic after toroidal-to-minimal pushforward (BCGP21 Lemma 6.2.3 and Theorem 6.2.6 with its proof, pp. 145–146). These tuples are cofinal among the admissible tuples (given `(n, ε, w)`, raise every `n_v` to `max(n_v, n(ε))`), so `H^†_{κ_A}` has cohomology in `[0, |I|]` (BCGP21 Proposition 6.3.7, p. 148).

*Needs:* §6.1; gap:mixed-cube-cover; ShimuraCompactifications §7.16; AutomorphicBundlesPartII §5.2.

**Checks.**

- `|I| = 1` gives a two-term complex from two opens and their intersection, amplitude `[0, 1]`.
- `|I| = 0` gives a single affine neighbourhood of the image of the multiplicative locus, not the whole minimal compactification (which is proper of dimension `3[F:ℚ]` and not affine), and amplitude `[0, 0]`.
- The level bound is part of the hypothesis: the affine charts are the non-vanishing loci of lifts of the Hodge–Tate wedge products to sections of an ample sheaf, which exist only for `n_v ≥ n(ε)`; at `ε = 0` no such neighbourhood is defined, which §6.1 excludes.
- The number of charts alone does not bound the amplitude: a Čech complex on `2^{|I|}` charts has length `2^{|I|} − 1` in general; the cubical structure gives length `|I|`.

### 6.3 Compact mixed U action

Prove: `U_{v,2}` improves analytic radii for `v ∈ I`; for `v ∈ Iᶜ` the composite `U_{v,1}U_{v,2}`, not `U_{v,2}` alone, improves radii, its kernels having type `(p, p², p³)` against `(p, p, p²)` for the second operator at I; the raw trace factors are `p^{−6}` and `p^{−3}`; hence `U^I` is compact on a projective Banach complex and its finite nonzero slope blocks are perfect over A (BCGP21 §6.3, pp. 147–152, especially Lemma 6.3.14, p. 152).

*Needs:* §6.2; §4.3; HigherHidaAndColemanTheory §6.3; LocallyAnalyticDistributions §4.16; gap:hilbert-siegel-frame-torsor.

**Checks.**

- At an Iwahori place, `U_{v,2}` alone does not improve the radius in the direction moved by `U_{v,1}`; replacing the composite by it fails the kernel-type check.
- The trace factor of `U_{v,1}U_{v,2}` is `p^{−3}·p^{−3} = p^{−6}`.
- A finite slope block of a compact operator on a Banach complex over a field is finite-dimensional.

### 6.4 The relative BGG comparison

On germs of analytic radii use the product over v of the relative GL₂ BGG sequences of HigherHidaAndColemanTheory §6.6. For the reflection at v the differential `θ_v`, from the term indexed by a set J of places with `v ∉ J` to the term indexed by `J ∪ {v}`, has order `m_v = k_v − l_v + 1`. With `U_{v,2}` the standard operator of §4.3 on both terms (normalized by `p^{−3}`, so that its slopes are at least −3 in every degree and at least 0 on `H⁰`; BCGP21 Proposition 6.4.1, p. 153), prove `θ_v ∘ U_source = p^{m_v} U_target ∘ θ_v`, where `U_source` and `U_target` are `U_{v,2}` on the two terms; equivalently, the product spectral sequence is Hecke-equivariant once the standard action of `U_{v,2}` on the term indexed by J is multiplied by `p^{m_v}` for each `v ∈ J` (BCGP21 §6.4, p. 154, the twisting statement in the proof of Corollary 6.4.3). Hence the twisted slopes on the reflected terms are at least `−3 + m_v` in every degree and at least `m_v ≥ 1` on `H⁰`, so the map `β_κ : e(U^I)G^†_κ → e(U^I)H^†_κ` of §6.1, from the geometric dagger complex to the analytic one, is an isomorphism on `H⁰` and injective on `H¹`, and an isomorphism on `H¹` when every gap `k_v − l_v ≥ 3`; higher-degree exclusions use the degree-dependent gaps of the product spectral sequence (BCGP21 Corollary 6.4.3, pp. 153–154). On a joint finite-slope block on which `U_{v,2}` has slope `s_v` at every `v | p`, the same spectral sequence shows that `β_κ` is a quasi-isomorphism if `s_v < m_v − 3 = k_v − l_v − 2` for every v, and an isomorphism on `H⁰` and injective on `H¹` if `s_v < m_v = k_v − l_v + 1` for every v: on a term indexed by `J ≠ ∅` the twisted `U_{v,2}`-slopes for `v ∈ J` are at least `−3 + m_v` in every degree and at least `m_v` on `H⁰`. The identity is stated in the direction that gives this twist and these conclusions; the direction printed in the sources is discussed under the source issues.

A proof route: the pullback along the `U_{v,2}` isogeny acts on the unipotent coordinate z of the analytic flag variety of `ω_G` by `z ↦ pz` up to a translation and the weight factor, and the trace along the correspondence commutes with the fibrewise derivative, so `θ_v` of order `m_v` picks up `p^{m_v}` after `U_source` (BCGP21 §6.4, p. 154, and the reference it gives for the relation).

*Needs:* §6.1; §4.3; HigherHidaAndColemanTheory §6.6.

**Checks.**

- Two eigenlines: `θe = f`, `U_source e = αe`, `U_target f = βf`. The identity forces `β = p^{−m_v} α`, so an ordinary e (`v(α) = 0 < m_v`) cannot have `θe ≠ 0` when the standard slopes on the reflected `H⁰` are `≥ 0`: e lies in the kernel, which is `H⁰(ω^κ)`. The reversed identity `U_target ∘ θ = p^{m_v} θ ∘ U_source` forces `β = p^{m_v} α`, which is compatible with `θe ≠ 0` for ordinary e; it makes the equivariant twist on the reflected term `p^{−m_v}`, its twisted slopes `≥ −3 − m_v`, and excludes nothing, so the conclusions of this target would not follow.
- At gap `k_v − l_v = 3`, `m_v = 4`: the twisted slopes on the reflected `H¹` are `≥ −3 + 4 = 1 > 0`, so the ordinary projector kills the reflected terms in every degree and the map is an isomorphism on `H¹`. At gap 2, `m_v = 3`, the bound is `≥ 0` and an ordinary class on the reflected `H¹` may survive: only injectivity on `H¹` is claimed.
- Differentiating `f(pz)` m times gives `p^m f^{(m)}(pz)`, with z the unipotent flag coordinate; this is not the relation of the q-expansion operator `θ = q d/dq`, for which `U(Σ a_n qⁿ) = Σ a_{pn} qⁿ` gives `Uθ = pθU` (θ raises the slope by 1): that θ maps into a space of forms of weight `k + 2` and is not the BGG differential, whose source contains `ω^κ` as its kernel. Using the q-expansion relation for `θ_v` reverses the identity and loses the corollary.
- For `F = ℚ`, `I = {p}` and `Ω(k, r)` the order is `m_v = k + 1`, and the identity yields the Klingen slope ranges of HigherHidaAndColemanTheory §9.6: at `k = 3` the reflected lower bound in every degree is `−3 + 4 = 1 = k − 2`, the all-degree threshold there, and on `H⁰` it is `0 + 4 = k + 1`. The exponent `−k − 1`, the wording of item 4 of HigherHidaAndColemanTheory §9.6 and of P20 Proposition 13.3.3.1, would give `−3 − 4 = −7` and exclude no slope.

### 6.5 Multi-place small-slope continuation

Prove: on a joint finite nonzero slope block, the restriction `res^†_κ : RΓ(X_{K_p(I)K^p}, ω^κ(−D)) → G^†_κ` of §6.1, from the whole mixed-level variety to the dagger neighbourhood of the multiplicative locus with the same classical coefficient, is a quasi-isomorphism if `v_p(U_{v,2}) < k_v + l_v − 3` for `v ∈ I` and `v_p(U_{v,1}) < l_v − 3` for `v ∈ Iᶜ`, using the commuting local operators on the block without asserting that each is compact on the full complex (BCGP21 Theorem 6.5.8 and Remark 6.5.9, p. 156; Lemmas 6.5.12–6.5.28, pp. 157–164).

The restriction to the analytic complex is the composite `β_κ ∘ res^†_κ`, about which the range above says nothing. On a joint block on which, in addition, `U_{v,2}` has slope `s_v < k_v − l_v − 2` at every `v | p`, the composite is a quasi-isomorphism; if instead `s_v < k_v − l_v + 1` at every v, it is an isomorphism on `H⁰` and injective on `H¹` (§6.4). At `v ∈ I` the two conditions on `U_{v,2}` combine to `s_v < min(k_v + l_v − 3, k_v − l_v − 2)`, respectively `s_v < min(k_v + l_v − 3, k_v − l_v + 1)`.

A proof route: use the untruncated finite flat degree for monotonicity and equality at the integral walls (as in §1.3); uniform progress on closed bands (as in §1.4); on each block with annihilating polynomial P, `P(0) ≠ 0`, use `Q(X) = −(P(X) − P(0))/(X P(0))`, a polynomial with `U Q(U) = 1` on the block; construct compatible torsion sections at cofinal precision; complete with a continuous bounded block projection; extend one place at a time, preserving the other degree coordinates and eigenrelations.

*Needs:* §6.1; §6.3; §6.4; §1.3; §1.4; HigherHidaAndColemanTheory §9.7; HodgeTateAndCanonicalSubgroups §0.6, §0.8; Mathlib `Polynomial.aeval`.

**Checks.**

- For `P = X² + 2X + 1` and `U = −1`: `R = −(P − P(0))/P(0) = −X² − 2X` has `R(−1) = 1`, and `Q = R/X = −X − 2` has `U Q(U) = (−1)(−1) = 1`; replacing the coefficient 2 by 1 gives `R(−1) = 0`.
- For `F = ℚ`, `I = {p}` and `Ω(k, r)` (weight `(k_v, l_v) = (k + r, r)`) the threshold `k_v + l_v − 3 = k + 2r − 3` is that of HigherHidaAndColemanTheory §9.7.
- The inequalities are strict; at `v_p(U_{v,1}) = l_v − 3` the statement says nothing.
- Weight `(2, 2)` at `F = ℚ`, `I = {p}` (`k = 0`, `r = 2`): the geometric threshold `k_v + l_v − 3 = 1` contains slope 0, so ordinary classes restrict isomorphically to `G^†_κ`; the all-degree threshold `k_v − l_v − 2 = −2` excludes slope 0, and the degree-zero threshold `k_v − l_v + 1 = 1` contains it. On the ordinary block the composite to `H^†_κ` is therefore an isomorphism on `H⁰` and injective on `H¹`, and no all-degree statement is made; taking `H^†_κ` as the target of the first statement would assert one.
- Weight `(5, 2)` (`k = 3`, `r = 2`): the thresholds are 4 (geometric) and `5 − 2 − 2 = 1` (all-degree), and `min(4, 1) = 1` contains slope 0, so on the ordinary block the composite to `H^†_κ` is a quasi-isomorphism; this is the first k at which the combined bound `min(k + 2r − 3, k − 2)` of HigherHidaAndColemanTheory §9.7 admits slope 0.

### 6.6 Ordinary Euler characteristics in families

Let `W_cl` be the set of classical weights κ with `l_v = 2` on I and `k_v ≡ l_v ≡ 2 mod p−1` at every v, with the p-adic topology. For κ in `W_cl` write `χ^an(κ)`, `χ^geo(κ)` and `χ^M(κ)` for the alternating sums `Σ_i (−1)^i dim` of the cohomology of `e(U^I)H^†_κ` and of `e(U^I)G^†_κ` (§6.1), and of `M_I ⊗^L_{Λ_I,κ} ℂ_p` (§4.7), the last being `e(U^I)RΓ(X^mult, ω^κ(−D))` (BCGP21 Theorem 4.6.1(3), p. 105). Prove:

1. `κ ↦ χ^an(κ)` is locally constant on `W_cl` (BCGP21 Theorem 6.3.16, p. 152), and so is `κ ↦ χ^M(κ)`, the Euler characteristic of the fibres of the perfect complex `M_I` (§4.7).
2. If `|I| ≤ 1`, the restriction `r : e(U^I)G^†_κ → M_I ⊗^L_{Λ_I,κ} ℂ_p` from the dagger neighbourhoods to the multiplicative locus is injective on `H⁰` and surjective on `H¹` (BCGP21 Proposition 6.6.1, pp. 164–165). With §6.4 this gives `χ^an(κ) ≤ χ^geo(κ) ≤ χ^M(κ)`, the first inequality being an equality when `k_v − l_v ≥ 3` at every v (BCGP21 proof of Proposition 6.6.2, pp. 165–166).
3. If `|I| ≤ 1`, after localization at a non-Eisenstein maximal ideal m of the prime-to-p Hecke algebra, `χ^an(κ) = χ^geo(κ) = χ^M(κ)` for every κ in `W_cl` (BCGP21 Proposition 6.6.2 and Remark 6.6.3, pp. 165–167).

A proof route. For (1), finite perfect block base change for the analytic complexes and derived control for `M_I`. For (2), both sides of r are computed from the two-affinoid cover of the image of `X^mult` in the minimal compactification (§6.2, with the relative vanishing of AutomorphicBundlesPartII §5.2); injectivity on `H⁰` is restriction of sections, and on `H¹` the dagger classes are dense, `U^I` is continuous and the ordinary part of the target is finite-dimensional, so the ordinary image is everything. The inequalities are dimension counts: `β_κ` is an isomorphism on `H⁰` and injective on `H¹` (§6.4), r is injective on `H⁰` and surjective on `H¹`, and both complexes have amplitude `[0, 1]` (§6.2, §6.1). For (3), by (1) and (2) it suffices to prove `χ^geo(κ) ≥ χ^M(κ)` and `χ^an(κ) = χ^geo(κ)` at witness weights with `k_v − l_v ≥ C` at every v and `l_v ≥ C` on `Iᶜ`, since every κ in `W_cl` is a p-adic limit of such weights (add to `k_v` and `l_v` multiples of `(p − 1)p^N` with N large, keeping `l_v = 2` on I and making every gap and, on `Iᶜ`, every `l_v` large); here C is at least 4, at least the constant of §4.7 and larger than the constant `R_gap` of AutomorphicBundlesPartII §8.8. At a witness weight `χ^an = χ^geo` by (2). Slope 0 lies in the range of §6.5 (`0 < k_v − 1` at `v ∈ I`, `0 < l_v − 3` on `Iᶜ`), so `res^†_κ` identifies `e(U^I)G^†_κ` with `e(U^I)RΓ(X_{K_p(I)K^p}, ω^κ(−D))`. Pullback followed by `e(U^I)` is a quasi-isomorphism from `e(T_I′)RΓ(X_{G₁,K^pG₁(ℤ_p)}, ω^κ(−D))_m` (`T_I′` of §4.6) to `e(U^I)RΓ(X_{K_p(I)K^p}, ω^κ(−D))_m`: in degrees 0 and 1 both sides are the multiplicity-counted cuspidal sums of AutomorphicBundlesPartII §8.8 at these weights; every local component `π_v` at `v | p` contributing to either ordinary part is ordinary, at `v ∈ Iᶜ` because both local operators enter the projectors, at `v ∈ I` by the Katz–Mazur integrality of §4.4a, the unit eigenvalue `α_vβ_v` alone not sufficing; and for ordinary `π_v` the two ordinary parts of invariants are one-dimensional (BCGP21 Propositions 2.4.24 and 2.4.26, pp. 26–27; at `v ∈ I` this is the isolated spherical Klingen refinement of HigherHidaAndColemanTheory §9.5, the chosen pair product of parameters having valuation `2 − k_v` against `1, 1, k_v` for the other three once `α_v` and `β_v` are units). Finally §4.7 gives an isomorphism on `H⁰` and an injection on `H¹` from the spherical ordinary complex to `M_I ⊗^L ℂ_p`, so `χ^geo ≥ χ^M`. With (2) this is an equality at the witness weights, hence `χ^an = χ^M` on `W_cl` by (1), and the inequalities of (2) give `χ^geo`.

*Needs:* §6.1; §6.2; §6.3; §6.4; §6.5; §4.4a; §4.6; §4.7; AutomorphicBundlesPartII §5.2, §8.8; HigherHidaAndColemanTheory §6.3, §9.5.

**Checks.**

- Only the alternating rank is constant: a block with `H⁰ = H¹ = E` at one weight and `0` nearby has constant Euler characteristic 0 while the dimensions jump.
- At `|I| = 0` both complexes are in degree 0 and the statement is equality of dimensions.
- Without localization the cuspidal description of AutomorphicBundlesPartII §8.8 is not available at the witness weights; the hypothesis is used in (3), while (1) and (2) hold without it.
- The two inequalities of (2) come from different maps and do not by themselves identify the three numbers: dimensions `(h⁰, h¹) = (1, 2)`, `(1, 1)` and `(1, 1)` for `e(U^I)H^†_κ`, `e(U^I)G^†_κ` and the fibre of `M_I` are compatible with `β_κ` (isomorphism on `H⁰`, injection on `H¹`) and with r (injection on `H⁰`, surjection on `H¹`), and give `χ^an = −1 < χ^geo = 0 = χ^M`. The gap condition of (2) or the localized equality (3) excludes this; the maps alone do not.
- A unit product does not make `π_v` ordinary: at `p = 3`, `(α_v, β_v) = (1/3, 3)` has `α_vβ_v = 1` and valuations `−1, 1`. The witness-weight comparison uses §4.4a, which excludes it; an argument resting on the integral action of `U_{v,2}` (§4.3) alone would admit it.

### 6.7 The ordinary comparison with at most one Klingen place

Assume `|I| ≤ 1`, `l_v = 2` on I, `k_v ≡ l_v ≡ 2 mod p−1`, and localize at a non-Eisenstein ideal. Prove: the restriction `r : e(U^I)G^†_κ → M_I ⊗^L_{Λ_I, κ} ℂ_p` from the geometric dagger complex `G^†_κ = RΓ(X^{mult,†}, ω^κ(−D))` of §6.1, which is injective on `H⁰` and surjective on `H¹` by §6.6(2), between complexes of amplitude `[0, |I|]` with equal Euler characteristic (§6.6(3)), is a quasi-isomorphism (BCGP21 Theorem 6.6.4, p. 167). If moreover `l_v ≥ 4` on `Iᶜ`, the global classical ordinary complex `e(U^I)RΓ(X, ω^κ(−D))[1/p]` is quasi-isomorphic to `M_I ⊗^L_{Λ_I,κ} ℚ_p` (BCGP21 Theorem 6.6.5, p. 167). The conclusion is rational, not integral at every tame level.

A proof route: for `|I| = 1`, with `a = dim coker H⁰(r)` and `b = dim ker H¹(r)`, `χ(source) − χ(target) = −a − b` with `χ = dim H⁰ − dim H¹`, so equality forces `a = b = 0`. For `I = ∅` both complexes are concentrated in degree 0, r is injective there and the dimensions agree by §6.6(3), so r is an isomorphism. For the global statement compose with `res^†_κ`, a quasi-isomorphism on the ordinary block by §6.5, since slope 0 is below `k_v − 1` at `v ∈ I` and below `l_v − 3` on `Iᶜ` exactly when `l_v ≥ 4`; pass to the algebraic classical complex by proper GAGA. The analytic complex `H^†_κ` is not used.

*Needs:* §6.1; §6.5; §6.6; §4.7; AdicSpacesPartIII §R3.7.

**Checks.**

- The Euler identity: for `h⁰`, `h¹` of source and target, `(h⁰_s − h¹_s) − (h⁰_t − h¹_t) = −(h⁰_t − h⁰_s) − (h¹_s − h¹_t) = −a − b`.
- For a four-term complex (`|I| = 3`) one Euler identity does not control the defects in four degrees, so the statement is not extended to larger I.
- At `I = ∅` there is no `H¹` defect: `b = 0`, `χ(source) − χ(target) = −a`, and equality gives `a = 0`; the global statement then needs `l_v ≥ 4` at every place above p.
- At `l_v = 3` on `Iᶜ` the hypothesis `l_v ≥ 4` of the global statement fails, slope 0 not being below `l_v − 3 = 0`; only the comparison of `e(U^I)G^†_κ` with the fibre of `M_I` holds there. The analytic complex `H^†_κ` enters neither statement.

### Examples

For `F = ℚ`, `I = {p}` and `κ = (k + 2, 2)`, §6.7 is the comparison of Pilloni Lemma 14.8.2 between the Klingen family and overconvergent cohomology with the classical coefficient `Ω(k, 2)(−D)` on the strict neighbourhoods of the multiplicative locus, that is `G^†_κ`; the edge maps are an injection on `H⁰` and a surjection on `H¹`.

### Dependencies

AdicSpacesPartIII §R2.10, §R3.7; AutomorphicBundlesPartII §5.2, §8.8; HigherHidaAndColemanTheory §6.1, §6.2, §6.3, §6.6, §9.5, §9.7; HodgeTateAndCanonicalSubgroups §0.6, §0.8, §5.5, §5.8; LocallyAnalyticDistributions §4.16; Mathlib `Polynomial.aeval`; ShimuraCompactifications §7.16; gap:hilbert-siegel-frame-torsor; gap:mixed-cube-cover; Layers 1, 4 (including §4.4a).

## Layer 7: Completed cohomology and Eichler–Shimura

Standing hypotheses of Layers 7–8. `(G, X)` is a Shimura datum of Hodge type with `G_{ℚ_p}` quasi-split; `B ⊂ P = P_µ` with Levi `M` (the Shimura Levi) and torus T; E is a finite extension of `ℚ_p` containing the reflex and splitting fields; `𝔤`, `𝔟`, `𝔭`, `𝔪` are the Lie algebras of G, B, P, M over E, and a general standard parabolic Q ⊇ B, with Levi `M_Q ⊇ T` and Lie algebras `𝔮 ⊇ 𝔪_Q`, is named where it is used (`M_P = M`, `M_B = T`); the tame level `K^p` is neat and the compactifications compatible. Completed cohomology is the derived completed tower of CompletedCohomologyPartII §2.2 and its derived locally analytic vectors (CompletedCohomologyPartII §F.4); locally analytic vectors of individual completed cohomology groups are not substituted for them. Bruhat geometry at finite level, support orders, the normalized torus action and finite-slope higher Coleman cohomology with algebraic coefficients and analytic characters are those of HigherHidaAndColemanTheory §§5.1–5.5 and 6.2; the higher Coleman sheaves `HCS_{w,λ}` and functors `HC_{w,λ}`, `HC_{cusp,w,λ}` with coefficients in the Levi BGG categories, defined before slope extraction, are §§7.1a–7.1b, and they agree with the imported theory on finite slopes for finite-dimensional and Verma coefficients (§7.1b). For `w ∈ ^M W` write `𝔪_w = w⁻¹𝔪w`, `𝔟_{M_w} = 𝔟 ∩ 𝔪_w` and `𝔲_{P_w}` for the nilradical of `𝔭_w = w⁻¹𝔭w`; `C_w = P\PwB` is the Bruhat cell of the flag variety `FL = P\G` and `C_w^†` its germ of analytic neighbourhoods. A weight `λ ∈ X^*(T)_E` is non-Liouville when `⟨λ + ρ, α^∨⟩` is p-adically non-Liouville for every positive root α (BCGP25 Definition 2.3.30, p. 30).

### 7.1 The BGG coefficient category and its analytic realization

Let Q ⊇ B be a standard parabolic of `G_E` with Levi `M_Q ⊇ T` and Lie algebras `𝔮 ⊇ 𝔪_Q`, and `O(𝔤, 𝔮)` the parabolic BGG category of LocallyAnalyticRepresentationsOfLocalGroups §4.2 for the parabolic 𝔮. For `λ ∈ X^*(M_Q)_E`, a character of `M_Q` with coefficients in E, viewed in `X^*(T)_E` by restriction and as a character of `𝔮` through `Q → M_Q → M_Q^ab`, let `O(𝔤, 𝔮)_{λ-alg}` be the full subcategory of `O(𝔤, 𝔮)` of modules all of whose `𝔥`-weights ν satisfy `ν − λ ∈ X^*(T)` (BCGP25 §3.4.1 and Definition 3.4.5, p. 53); write `O(𝔤,𝔟)_{λ-alg}` for `Q = B`, where `M_B = T` and λ ranges over all of `X^*(T)_E`. The condition `λ ∈ X^*(M_Q)_E` is what makes `E(λ)` a one-dimensional `𝔮`-module: a character of `𝔮` vanishes on `[𝔮, 𝔮] ⊇ [𝔪_Q, 𝔪_Q]`. Let `𝒰(𝔤) = lim_r U(𝔤)_r` be the Arens–Michael envelope of LocallyAnalyticDistributionsPartII §2.5 (written `Û(𝔤)` in BCGP25 §2.2.29), a Fréchet–Stein algebra with stages `U(𝔤)_r` and equal to the inverse limit of the distribution algebras of the congruence subgroups `G_r`; for a finitely generated `U(𝔤)`-module M write `M̂ = 𝒰(𝔤) ⊗_{U(𝔤)} M`, its coadmissible completion (same section). Prove: `O(𝔤,𝔮)_{λ-alg}` is abelian and for V in it the `𝔮`-action on the twist `V(−λ) = V ⊗ E(−λ)` integrates to Q (BCGP25 Lemma 3.4.6, pp. 53–54); `M ↦ M̂` is an equivalence of `O(𝔤, 𝔟)` with its completed counterpart `Ô`, the coadmissible `𝒰(𝔤)`-modules on which `𝒰(𝔥)` acts diagonalizably with finite-dimensional weight spaces and weights in finitely many sets `ν + ℕ[Φ⁻]`, a quasi-inverse being the direct sum of the weight spaces (BCGP25 Definition 2.2.38 and Theorem 2.2.39, p. 25, after Schmidt); and `M ↦ M̂^∨`, the continuous dual of `M̂`, is an exact contravariant functor from `O(𝔤, 𝔟)` to the integrable LB representations of 𝔤 of LocallyAnalyticRepresentationsOfLocalGroups §3.10, whose Banach stages `(D(G_r) ⊗_{U(𝔤)} M)^∨` carry compatible actions of the `G_r` (BCGP25 Definition 3.4.2 and Proposition 3.4.3, p. 53).

*Needs:* LocallyAnalyticDistributionsPartII §1.4, §2.5; LocallyAnalyticRepresentationsOfLocalGroups §3.10, §4.2; LieHighestWeight Layer 3; Tau Ceti `TauCeti.VermaModule`; LocallyAnalyticDistributions §0.0, §0.3; CompletedCohomologyPartII §F.4.

The basic properties are:

- `O(𝔤,𝔮)_{λ-alg}` is an abelian full subcategory of `O(𝔤,𝔮)`, closed under subquotients and extensions; it depends on λ only through its class modulo `X^*(T)`.
- `M̂^∨` is exact and contravariant in M, and commutes with finite direct sums.
- For a Verma module `M = U(𝔤) ⊗_{U(𝔟)} λ`, `M̂^∨` is the space of germs at the identity of functions f on G with `f(gb) = λ(b)f(g)` (BCGP25 Remark 3.4.4, p. 53).
- For finite-dimensional algebraic `M = W^∨`, `M̂^∨ = W`.

**Checks.**

- The zero module gives zero, and a weight ν with `ν − λ ∉ X^*(T)` (for instance `λ + 1/2` on `GL₂` at an algebraic λ) excludes the module from the category.
- The character space depends on Q: for `G = GL₂` and `Q = G`, `M_Q = GL₂` and `X^*(M_Q)_E = E·det`; `ε₁` is excluded, since `[e₁₂, e₂₁] = diag(1, −1)` while `ε₁(diag(1, −1)) = 1 ≠ 0`, so `E(ε₁)` is not a `𝔤𝔩₂`-module and `V(−ε₁)` is undefined, whereas `det = ε₁ + ε₂` takes the value `1 − 1 = 0` there and is admitted. For `Q = B`, `ε₁ ∈ X^*(T)` is admitted.
- For `𝔤 = 𝔤𝔩₂`, `𝔲 = 𝔫` one-dimensional and M the standard two-dimensional representation with basis `e₁, e₂`, `𝔫e₂ = e₁`: `H⁰(𝔫, M)` is spanned by `e₁` and `H¹(𝔫, M) = M/𝔫M ⊗ 𝔫^∨` is one-dimensional, so the total dimension is `|W| = 2`, as Kostant's theorem predicts. This is Lie algebra cohomology of M; the coefficients of §§7.2 and 7.5 are Lie algebra homology, with different Levi weights (§7.2, second Check).
- The completion is needed: a Verma module is infinite-dimensional, and its algebraic dual is not an LB-space with Banach stages; the continuous dual of the completion is.

### 7.1a Higher Coleman sheaves

Fix `w ∈ ^M W`, a standard parabolic `Q ⊇ B` with Levi `M_Q ⊇ T` (not to be confused with the Shimura Levi M; `M_Q = M` only for `Q = P`), and `λ ∈ X^*(M_Q)_E`, a character of `M_Q` with coefficients in E, inflated to Q through `Q → M_Q → M_Q^ab` and restricted to T (BCGP25 §3.4.7, p. 54); for `Q = B` this is any `λ ∈ X^*(T)_E`. Let `Q_{M_w}` be the image of `P_w ∩ Q` in `M_w`, a parabolic subgroup of `M_w` containing `B_{M_w}` with Lie algebra `𝔮_{M_w}` (BCGP25 Lemma 3.4.8, p. 54), and `C_{w,Q} = P\PwQ` with its germ `C_{w,Q}^†`. Define the higher Coleman sheaf functor `HCS_{Q,w,λ} : O(𝔪_w, 𝔮_{M_w})_{λ-alg} → LB_{(𝔤,Q)}(C_{w,Q}^†)^{𝔲⁰_P}`, contravariant, with values in (𝔤,Q)-equivariant LB-sheaves on `C_{w,Q}^†` killed by the horizontal nilradical `𝔲⁰_P`, as the composite of three functors: `V ↦ V̂^∨(λ)`, the continuous dual of the completion of §7.1 for `𝔪_w`, with the action of `𝔮_{M_w}` twisted by λ so that it integrates to `Q_{M_w}` (BCGP25 Proposition 3.4.13, p. 55); the fully faithful embedding of these admissible `𝒰(𝔪_w)`-modules into LB-representations of the stabilizer `Stab_Q(w)` on which `(U_{P_w})_e` acts trivially and `(M_Q^ab)_e` acts through λ (BCGP25 Proposition 3.4.12, p. 55); and the equivalence between such representations and `LB_{(𝔤,Q)}(C_{w,Q}^†)^{𝔲⁰_P}` whose inverse is the fibre at w (BCGP25 Propositions 3.3.11 and 3.3.14, p. 52). (BCGP25 Definition 3.4.17, p. 56.) Write `HCS_{w,λ} = HCS_{B,w,λ}`, defined on `O(𝔪_w, 𝔟_{M_w})_{λ-alg}` for every `λ ∈ X^*(T)_E`. Prove that `HCS_{Q,w,λ}` is exact; that `HCS_{Q,w,λ}(V) ⊗ E(µ) = HCS_{Q,w,λ+µ}(V)` for `µ ∈ X^*(M_Q)`, the Q-action being twisted by µ through `M_Q^ab` (BCGP25 Remarks 3.3.15 and 3.4.15, pp. 52 and 56); that `HCS_{w,λ}(M) ⊗ E(µ) = HCS_{w,λ+µ}(M)` for `µ ∈ X^*(T)`, the categories `O(𝔪_w,𝔟_{M_w})_{λ-alg}` and `O(𝔪_w,𝔟_{M_w})_{(λ+µ)-alg}` being equal (BCGP25 Remark 3.4.15 and Proposition 3.4.18, p. 56); and that `HCS_{w,λ}(z) = Θ_hor(ι(wz))` for `z ∈ Z(𝔪_w)`, where `wz ∈ Z(𝔪)` is the conjugate, ι is induced by inversion on M and `Θ_hor` is the horizontal action of `Z(𝔪)` (BCGP25 Proposition 3.4.19, p. 56).

*Needs:* §7.1; LocallyAnalyticDistributionsPartII §2.5; LocallyAnalyticRepresentationsOfLocalGroups §3.10, §4.2; LocallyAnalyticDistributions §0.0, §0.3; LieHighestWeight Layer 3.

The basic properties are:

- `HCS_{Q,w,λ}` is contravariant and exact and commutes with finite direct sums.
- The fibre at w of `HCS_{Q,w,λ}(V)` is `V̂^∨(λ)` with its `Stab_Q(w)`-action, on which `(M_Q^ab)_e` acts through λ.
- Twisting by an algebraic character µ of `M_Q`: `HCS_{Q,w,λ}(V) ⊗ E(µ) = HCS_{Q,w,λ+µ}(V)`; for `Q = B` this is `HCS_{w,λ}(M) ⊗ E(µ) = HCS_{w,λ+µ}(M)` for every `µ ∈ X^*(T)`.
- The central action: an element `z ∈ Z(𝔪_w)` acting on M corresponds to `Θ_hor(ι(wz))` on `HCS_{w,λ}(M)`.

**Checks.**

- The zero module gives the zero sheaf; a finite-dimensional M gives a sheaf whose fibre at w, `M̂^∨(λ) = M^∨(λ)`, has dimension `dim M`, whereas a Verma module gives an infinite-dimensional fibre, the germs of §7.1's description.
- The twist is not invisible: for `µ ∈ X^*(T)` the source category is unchanged but `B(ℚ_p)` acts on `HCS_{w,λ+µ}(M)` through the extra factor µ; at `t = diag(p, 1)` in `GL₂` and `µ = ε₁` the action of t is multiplied by `µ(t) = p`. A definition that ignored λ would give the same sheaf for λ and `λ + µ`.
- The sign of the central action: if `M = E(ν)` is one-dimensional for the torus `𝔪_w = 𝔱` of the modular curve and z is the scalar matrix, z acts on M by `ν(z)` and so, through ι, `Θ_hor(z)` acts on `HCS_{w,λ}(M)` by `−ν(z)`; for `ν = (1, 1)` this is −2, the value used in the infinitesimal-character Check of §7.2.
- A general Q needs a character of its Levi: for the modular curve (`G = GL₂`, `P = B`, `M = T`), `w = 1` and `Q = G`, the image `Q_{M_w}` is T, and the trivial `𝔱`-module E satisfies the weight condition for `λ = ε₁` (`0 − ε₁ ∈ X^*(T)`); but `HCS_{G,1,ε₁}` is not defined, since `G_e` would have to act through `G^ab = GL₂/SL₂` by `ε₁`, and the differential of such an action kills `diag(1, −1) = [e₁₂, e₂₁]`, whereas `ε₁(diag(1, −1)) = 1`. For `λ = det` the value there is `1 − 1 = 0` and the sheaf exists; for `Q = B` the weight `ε₁` is allowed and `diag(p, 1)` acts through it by p. The weight condition on the source category alone does not detect the failure.

### 7.1b Higher Coleman functors with BGG coefficients

For `w ∈ ^M W` and `λ ∈ X^*(T)_E` let `j_w : π_HT⁻¹(C_w) → Sh^tor_{K^p}` be the inclusion of the Hodge–Tate preimage of the Bruhat cell into the toroidal tower and `RΓ_w(Sh^tor_{K^p}, F) = RΓ(Sh^tor_{K^p}, (j_w)_!F)`, with `(j_w)_!` extension by zero (BCGP25 Definition 4.6.11 and Lemma 4.6.12, p. 83). Define the contravariant higher Coleman functors `HC_{w,λ}, HC_{cusp,w,λ} : O(𝔪_w, 𝔟_{M_w})_{λ-alg} → D(Mod^{λ-sm}_{B(ℚ_p)}(E))`, with values in the derived category of solid E-vector spaces with a λ-smooth action of `B(ℚ_p)` (LocallyAnalyticRepresentationsOfLocalGroups §3.5), by `HC_{w,λ}(M) = RΓ_w(Sh^tor_{K^p}, VB⁰(HCS_{w,λ}(M)))` and `HC_{cusp,w,λ}(M) = RΓ_w(Sh^tor_{K^p}, VB⁰(HCS_{w,λ}(M))(−D))`, D the boundary (BCGP25 Definition 4.6.35, p. 88). Extend both to the bounded derived category `D^b(O(𝔪_w, 𝔟_{M_w})_{λ-alg})` by `HC_{w,λ}(M) = RΓ_w(Sh^tor_{K^p}, VB_red(HCS_{w,λ}(M)))`, and likewise with `(−D)`. Because `HCS_{w,λ}` is exact and contravariant (BCGP25 Definition 3.4.17, p. 56) and `VB⁰` is exact and covariant on the (𝔤,B)-equivariant LB-sheaves on `C_w^†` killed by `𝔲⁰_P` (BCGP25 Theorem 4.5.20(5), p. 79), their composite `VB⁰ ∘ HCS_{w,λ}` is exact and contravariant, and `VB_red(HCS_{w,λ}(M))` is computed by applying `VB⁰ ∘ HCS_{w,λ}` termwise to a bounded complex representing M with the degrees reversed: its term in degree i is `VB⁰(HCS_{w,λ}(M^{−i}))`, its differential from degree i to degree `i + 1` is the image of `M^{−i−1} → M^{−i}`, and its i-th cohomology sheaf is `VB⁰(HCS_{w,λ}(H^{−i}(M)))` (BCGP25 Definition 4.6.35 and the paragraph after it, p. 88, where the cohomology index is printed without the reversal; see Source issues). In particular `HC_{w,λ}(M[n]) = HC_{w,λ}(M)[−n]`, and likewise for the cuspidal functor. These functors are defined before any slope extraction.

Slope parts. Let Z be the character space of `T(ℚ_p)`, the product of the weight space of `ℤ_p[[T(ℤ_p)]]` and a power of `𝔾_m^an`, exhausted by affinoids (BCGP25 §4.6.46, pp. 93–94). For N in `D(Mod^{λ-sm}_{B(ℚ_p)}(E))` and a compact open `K_U ⊂ U(ℚ_p)` with an Iwahori factorization, the `K_U`-invariants `N^{K_U}` are a direct summand through the normalized trace, and `t ∈ T⁺(ℚ_p)` acts on them by t followed by the normalized trace from `tK_Ut⁻¹` to `K_U`; this is an action of the monoid `T⁺(ℚ_p)` (BCGP25 §4.6.50 and Lemma 4.6.51, p. 95). The finite-slope part `N^fs`, an object of `D(Mod^{λ-sm}_{T(ℚ_p)}(E))`, is the localization `f_*f^*N^{K_U}`, where `f^*` is the derived base change from the solid group algebra of `T⁺(ℚ_p)` to the functions on the affinoids exhausting Z and `f_*` forgets back to `T(ℚ_p)`-representations (BCGP25 §4.6.46, p. 94), and it does not depend on `K_U` (BCGP25 Lemma 4.6.53, p. 96). Composing the valuation with the characters on Z gives the slope map `s : Z → X^*(T_d)_ℝ`; restricting to the closures of the rational opens on which `s ≤ λ′`, `s = λ′` or `s ≥ λ′` gives the slope-`≤ λ′`, slope-`λ′` and slope-`≥ λ′` parts, and the ordinary part `N^{=0}` is the slope-0 part (BCGP25 §§4.6.47–4.6.48, pp. 94–95). The finite-slope higher Coleman functors `HC^fs_{w,λ}`, `HC^fs_{cusp,w,λ}` are `(−)^fs` applied to `HC_{w,λ}`, `HC_{cusp,w,λ}` (BCGP25 §4.6.54, p. 96), and likewise `HC^{=0}`, and the functors `CC^fs_λ`, `CC^{=0}_λ` of §§7.3 and 7.6 are these slope parts of `CC_λ`; on the Banach models of the supported cohomology `(−)^fs` is computed by the compact action of a strictly dominant `t ∈ T^{++}(ℚ_p)` (BCGP25 Remark 4.6.49, p. 95, and the proof of Theorem 4.6.56, pp. 96–97). Prove:

1. For every object M of `O(𝔪_w, 𝔟_{M_w})_{λ-alg}`, viewed as a complex concentrated in degree 0, the complexes `HC_{cusp,w,λ}(M)` and `HC^fs_{cusp,w,λ}(M)` have cohomology only in degrees `[0, ℓ(w)]`, and `HC_{w,λ}(M)` and `HC^fs_{w,λ}(M)` only in degrees `[ℓ(w), d]`, `d = dim Sh` (BCGP25 Theorem 4.6.45, p. 93; Theorem 4.6.58, p. 98).
2. For κ ∈ `X^*(T)^{M,+}` and `L(𝔪_w)_{−w⁻¹w_{0,M}κ}` the finite-dimensional simple `𝔪_w`-module of highest weight `−w⁻¹w_{0,M}κ`, `HC^fs_{cusp,w,0}(L(𝔪_w)_{−w⁻¹w_{0,M}κ}) ⊗ ℚ̄_p` is the direct sum, over the finite-order characters χ of `T(ℤ_p)`, of the cuspidal finite-slope higher Coleman cohomology with algebraic coefficient κ and character χ of HigherHidaAndColemanTheory §§5.2–5.4, and likewise without the boundary ideal (BCGP25 Theorem 4.6.56, p. 96).
3. For an analytic character ν of `T(ℤ_p)` with differential dν, and κ defined by `dν = −w⁻¹w_{0,M}(κ + ρ) − ρ`, `HC^fs_{w,dν}(M(𝔪_w)_{−w⁻¹w_{0,M}κ})` is the direct sum, over the analytic characters ν′ with `dν′ = dν`, of the finite-slope analytic family cohomology at ν′ of HigherHidaAndColemanTheory §6.2, and likewise for the cuspidal functors (BCGP25 Theorem 4.6.57, p. 98).

*Needs:* §7.1a; gap:solid-vb-sen; HigherHidaAndColemanTheory §5.1, §5.2, §5.3, §5.4, §6.2; PerfectoidShimuraVarieties §6.3; LocallyAnalyticRepresentationsOfLocalGroups §3.5; LocallyAnalyticDistributions §4.16.

The basic properties are:

- A short exact sequence `0 → M₁ → M₂ → M₃ → 0` in `O(𝔪_w, 𝔟_{M_w})_{λ-alg}` gives a distinguished triangle `HC_{w,λ}(M₃) → HC_{w,λ}(M₂) → HC_{w,λ}(M₁) → HC_{w,λ}(M₃)[1]`, and likewise for the cuspidal and finite-slope functors.
- For `η ∈ X^*(T)`, `HC_{w,λ+η}(M) = HC_{w,λ}(M) ⊗ E(η)`, the `B(ℚ_p)`-action twisted by η (BCGP25 Remark 4.1.4, p. 68).
- On the bounded derived category the functors reverse degrees: `HC_{w,λ}(M[n]) = HC_{w,λ}(M)[−n]`, and a bounded complex M with `H^j(M) = 0` for `j ∉ [a, b]` has `HC_{cusp,w,λ}(M)` with cohomology only in degrees `[−b, ℓ(w) − a]` and `HC_{w,λ}(M)` only in degrees `[ℓ(w) − b, d − a]`, by (1) and induction on `b − a` along the truncation triangles `τ^{≤b−1}M → M → H^b(M)[−b]`.
- The inclusion of the boundary ideal gives a natural map `HC_{cusp,w,λ} → HC_{w,λ}`.
- The prime-to-p Hecke action and the `B(ℚ_p)`-action commute with the functorial maps, and the finite-slope part does not depend on the choice of `K_U` (BCGP25 Lemma 4.6.53, p. 96).
- `(−)^{K_U}` and `(−)^fs` are triangulated functors, so the slope parts of a distinguished triangle of `HC` or `CC` are distinguished triangles.

**Checks.**

- The zero module gives the zero complex.
- A Verma-to-simple quotient: when `𝔪_w` has a factor `𝔰𝔩₂` (for instance the Siegel Levi of `GSp₄`), the nonsplit sequence `0 → M(−2) → M(0) → E → 0` of `𝔰𝔩₂`-modules (the Verma module of highest weight 0, its submodule `M(s·0) = M(−2)`, infinite-dimensional, and the one-dimensional trivial quotient) gives a triangle `HC(E) → HC(M(0)) → HC(M(−2)) → HC(E)[1]`. All three terms are defined here, whereas comparison (2) accepts only E and comparison (3) only the two Verma modules; the map `HC(E) → HC(M(0))` induced by `M(0) → E` comes from the injective map of sheaves from the classical to the overconvergent coefficient obtained by applying `VB⁰ ∘ HCS` to that surjection (BCGP25 Proposition 4.6.9, p. 82).
- Slopes need the `B(ℚ_p)`-action: on a line on which `T⁺(ℚ_p)` acts through a character χ, the slope is `v_p ∘ χ`; for `χ(t) = p` at `t = diag(p, 1)` in `GL₂` the line has slope 1 at t and is not ordinary, while for χ unramified it is ordinary. With only an action of the torus `T(ℤ_p)` there is no `K_U` and no Hecke action of `T⁺(ℚ_p)`, and none of the slope parts is defined.
- Finite slope does not determine the functor: on a one-dimensional space with `U = 0` the finite-slope part has dimension 0 while the space has dimension 1, so passing to finite slopes can lose a nonzero part of a complex; comparisons (2)–(3), which concern `HC^fs` only, therefore do not define `HC`, which keeps the infinite-slope part.
- The two support amplitudes are opposite: for the modular curve (`d = 1`, `^M W = {1, s}`, `ℓ(1) = 0`, `ℓ(s) = 1`) the cuspidal functors have amplitudes `[0, 0]` at `w = 1` and `[0, 1]` at `w = s`, the others `[0, 1]` at `w = 1` and `[1, 1]` at `w = s`; interchanging the cuspidal and full bounds would put `HC_{cusp,s,λ}` in degree 1 only.
- Shifted coefficients reverse their degree: for a nonzero object V and the complex `V[1]`, which by the Conventions has `H^{−1} = V`, the sheaf complex `VB_red(HCS_{w,λ}(V[1])) = VB⁰(HCS_{w,λ}(V))[−1]` has its only nonzero cohomology sheaf in degree 1, equal to `VB⁰(HCS_{w,λ}(H^{−1}(V[1])))`; the unreversed formula `VB⁰(HCS_{w,λ}(H¹(V[1]))) = 0` would make it vanish. Only `HCS_{w,λ}` reverses arrows: `VB⁰` keeps the direction of the dual map `(E²)^∨ → E^∨`, `(a, b) ↦ a`, of the first-factor inclusion `E → E²`, `x ↦ (x, 0)` (the dual of the diagonal would be `(a, b) ↦ a + b`), and a second reversal by `VB⁰` would move the class back to degree −1. For `V[−1]` the nonzero degree is −1, and the zero complex gives zero on both readings. For the modular curve at `w = 1`, `HC_{cusp,1,λ}(V[1])` has cohomology only in degree 1, the bound `[−b, ℓ(w) − a] = [1, 1]` at `a = b = −1`, not `[0, 0]`.
- The reversal is the grading the spectral sequences of §§7.5–7.6 need: for the modular curve (`P = B`), `𝔤 = 𝔤𝔩₂` with e spanning `𝔲_{P_1} = 𝔲_B` and f spanning `𝔲_{P_s}`, and the Verma module `M = M(𝔤)_λ = U(𝔤) ⊗_{U(𝔟)} λ` with basis `v_k = f^k v₀`, the operator e acts by `e v_k = k(⟨λ, α^∨⟩ − k + 1) v_{k−1}`, so when `⟨λ, α^∨⟩ ∉ ℤ_{≥0}` it is surjective with kernel `Ev₀`. At `w = 1` the complex `E ⊗^L_{U(𝔲_{P_1})} M` is `N[1]` with `N = 𝔲_{P_1} ⊗ Ev₀` one-dimensional, so the term `E₁^{0,q}` of §7.5 is `H^q(HC_{1,λ}(N)[−1]) = H^{q−1}(HC_{1,λ}(N))`, the index `2p + q − d` of §7.6 at `p = 0`, `d = 1`; the unreversed formula would give `H^{q+1}(HC_{1,λ}(N))`. At `w = s` the module is free over `U(𝔲_{P_s}) = E[f]` and the coefficient `M/fM = Ev₀` sits in degree 0, where the two readings agree.

### 7.2 Analytic localization on the flag variety

Define the localization functor `Loc : D⁻(U(𝔤)) → D(D̃^la)`, `Loc(M) = RHom_{𝔤,∗₂}(M, C^la)`, with values in the derived category of solid modules over the sheaf `D̃^la` of locally analytic differential operators on FL, where `C^la` is the (𝔤,G)-equivariant sheaf of BCGP25 §3.2.37 with its second 𝔤-action `∗₂` (BCGP25 §3.5.1, p. 56). Loc is contravariant and triangulated, and `Loc(M)` is a complex, not a sheaf. For finitely generated M it is computed by the continuous dual of the completion: `Loc(M) = RHom_{𝔤,∗₂}(E, M̂^∨ ⊗ C^la)`, represented by the Chevalley–Eilenberg complex of LB-sheaves `C^la ⊗ M̂^∨ ⊗ Λ^i𝔤^∨` in degrees `[0, dim 𝔤]` (BCGP25 Lemma 3.5.2, p. 57; complex (3.5.6), p. 58). For `M ∈ O(𝔤,𝔟)_{λ-alg}` the twist `M(−λ)` carries the B-action of §7.1, and the complex computing `Loc(M(−λ))` is a complex of (𝔤,B)-equivariant LB-sheaves (BCGP25 §3.5.8, p. 58); no G-action on M is assumed. Prove:

1. If M has infinitesimal character λ, that is `Z(𝔤)` acts on M through the Harish-Chandra character of λ (λ taken up to the dotted Weyl action), then the horizontal action of `Z(𝔪)` on `Loc(M)` factors through the finite E-algebra `Z(𝔪) ⊗_{Z(𝔤)} (−w₀λ)`, whose characters form the set `{−w_{0,M}(w·λ + 2ρ_M) : w ∈ ^M W}`, and `Loc(M)` is the direct sum of the direct factors `Loc(M)_χ` cut out by the idempotents of this algebra, one for each distinct character χ of that set (BCGP25 Corollary 3.5.4 and Remark 3.5.5, p. 57). At singular λ distinct w can give the same χ and the algebra is not reduced, so `Loc(M)_χ` is a generalized eigen-factor on which `Z(𝔪)` need not act semisimply.
2. If λ is non-Liouville and `M ∈ O(𝔤,𝔟)_{λ-alg}`, the cohomology sheaves of `Loc(M(−λ))` restricted to each Bruhat germ are higher Coleman sheaves (§7.1a) of Lie algebra homology: `H^i(Loc(M(−λ)))|_{C_w^†} = HCS_{w,λ}(H_i(𝔲_{P_w}, M))`, where `H_i(𝔲_{P_w}, M) = H^{−i}(E ⊗^L_{U(𝔲_{P_w})} M)` with its `𝔪_w`-action is an object of `O(𝔪_w, 𝔟_{M_w})_{λ-alg}` (BCGP25 §2.3.1, p. 25; Theorem 2.3.13, p. 27; Theorem 3.5.11, p. 58). The identification passes through the duality `Ĥ_i(𝔲_{P_w}, M)^∨ = H^i(𝔲_{P_w}, M̂^∨)` between the homology of M and the cohomology of its completed dual (BCGP25 Corollary 2.3.33, p. 30); the Lie algebra cohomology of M itself, computed in the Checks of §7.1, is not the coefficient.

Statement (1) uses the infinitesimal character, not membership in `O(𝔤,𝔟)_{λ-alg}`; the functor and statement (2) are for every object of that category.

*Needs:* §7.1; §7.1a; LocallyAnalyticRepresentationsOfLocalGroups §4.1, §4.6; HigherHidaAndColemanTheory §5.1; PerfectoidShimuraVarieties §6.3; LieHighestWeight Layer 3.

The basic properties are:

- Loc is contravariant and triangulated: a short exact sequence `0 → M₁ → M₂ → M₃ → 0` of finitely generated `U(𝔤)`-modules gives a distinguished triangle `Loc(M₃) → Loc(M₂) → Loc(M₁) → Loc(M₃)[1]`.
- For finitely generated M, `Loc(M)` is represented by the Chevalley–Eilenberg complex `C^la ⊗ M̂^∨ ⊗ Λ^i𝔤^∨` in degrees `[0, dim 𝔤]`.
- For M with infinitesimal character λ, the direct-sum decomposition over the distinct generalized eigencharacters of `Z(𝔪)`.
- For non-Liouville λ, the stratum-wise identification of the cohomology sheaves with higher Coleman sheaves of the `𝔲_{P_w}`-homology of M.

**Checks.**

- An integral algebraic λ is non-Liouville: every `⟨λ+ρ, α^∨⟩` is an integer.
- Homology, not cohomology: for `𝔤 = 𝔤𝔩₂`, `𝔲 = 𝔫 = E·x` and M the standard representation with `x e₂ = e₁` (weights `ε₁` on `e₁`, `ε₂` on `e₂`), `H₀(𝔫, M) = M/𝔫M` is spanned by the class of `e₂` (weight `ε₂`) and `H₁(𝔫, M) = 𝔫 ⊗ ker x = 𝔫 ⊗ Ee₁` (weight `2ε₁ − ε₂`), whereas `H⁰(𝔫, M) = Ee₁` (weight `ε₁`) and `H¹(𝔫, M) = 𝔫^∨ ⊗ M/𝔫M` (weight `2ε₂ − ε₁`). The element `diag(2, 1)` acts on `H₀, H₁` by 1 and 4 and on `H⁰, H¹` by 2 and 1/2: the dimensions agree and the Levi weights do not, so cohomology on the right of (2) changes the higher Coleman sheaves. The homology weights `(0, 1)` and `(2, −1)` are those of LocallyAnalyticRepresentationsOfLocalGroups §4.6 for `L(1, 0)` and the upper radical.
- Infinitesimal character is needed in (1): for `GL₂` (modular curve, `M = T`, `ρ_M = 0`), λ = 0 and the module `det`, the weight `(1, 1)` lies in `X^*(T)`, so `det ∈ O(𝔤,𝔟)_{0-alg}`, but its infinitesimal character is that of `(1, 1)`. The scalar matrix acts on `det` by 2, hence horizontally on `Loc(det)` by −2, while every character `−w_{0,M}(w·0 + 2ρ_M) = −(wρ − ρ)` takes the value 0 on it. So (1) fails for `det` at λ = 0; at `λ = (1, 1)` every character `−(w·(1,1))` takes the value −2 on the scalar matrix, and `det` is covered.
- Loc is not a sheaf: for `GL₂`, λ = 0 and the trivial module E, `H₀(𝔲_{P_w}, E) = E` and `H₁(𝔲_{P_w}, E) = 𝔲_{P_w}` are both one-dimensional for each `w ∈ ^M W`, so by (2) `Loc(E)` has nonzero cohomology sheaves in degrees 0 and 1 on each Bruhat germ; a definition of Loc as a sheaf in degree 0 loses the second.
- The stratum-wise identification is asserted only for non-Liouville λ; for a weight with some `⟨λ + ρ, α^∨⟩` a p-adic Liouville number it is not part of the statement.

### 7.3 The coherent completed-cohomology functor

Define the contravariant functors `CC_λ, CC_{cusp,λ} : O(𝔤,𝔟)_{λ-alg} → D(Mod^{λ-sm}_{B(ℚ_p)}(E))` by `CC_λ(M) = RHom_𝔤(M, RΓ̃^{la})`, Lie-algebra derived Hom into the derived locally analytic vectors of the completed tower, and `CC_{cusp,λ}(M)` the same with the compact-support tower (BCGP25 §4.7, p. 99; the analytic realization of M is that of §7.1). The group `B(ℚ_p)` acts through its action on the tower and through the integrated action on `M(−λ)` of §7.1, so that the values are λ-smooth `B(ℚ_p)`-representations, the category of §7.1b (LocallyAnalyticRepresentationsOfLocalGroups §3.5); their slope parts `CC^fs_λ`, `CC^{=0}_λ` are those of §7.1b. The arithmetic Galois action and the prime-to-p Hecke action are inherited from the tower.

*Needs:* §7.1; §7.1b; CompletedCohomologyPartII §2.2, §6.7, §7.1, §F.4; LocallyAnalyticRepresentationsOfLocalGroups §3.5.

The basic properties are:

- A map `M → N` gives `CC_λ(N) → CC_λ(M)`, with identity and composition laws, `B(ℚ_p)`-equivariantly.
- The values are λ-smooth `B(ℚ_p)`-representations and the functorial maps are `B(ℚ_p)`-equivariant, so they pass to the slope parts of §7.1b.
- The compact-support tower gives `CC_{cusp,λ}` and a map to `CC_λ`.
- Galois and prime-to-p Hecke actions commute with the functorial maps.
- A short exact sequence `0 → M₁ → M₂ → M₃ → 0` gives a distinguished triangle `CC_λ(M₃) → CC_λ(M₂) → CC_λ(M₁) → CC_λ(M₃)[1]`.

**Checks.**

- For finite-dimensional algebraic `M = W^∨` the functor recovers classical cohomology with coefficients W through derived locally analytic recovery (CompletedCohomologyPartII §6.7).
- The zero module gives the zero complex.
- The connecting map of the triangle is induced by the Yoneda class of the extension; a split sequence gives the zero connecting map.
- The target carries `B(ℚ_p)`, not only the torus: the ordinary part of §7.6 is computed on `K_U`-invariants with the Hecke action of `T⁺(ℚ_p)` (§7.1b), which a functor with values in torus representations could not define.

### 7.4 The completed-to-coherent comparison

Prove: for `M ∈ O(𝔤,𝔟)_{λ-alg}`, `CC_λ(M) ⊗ ℂ_p ≅ RΓ(Sh^tor_{K^p}, VB_red(Loc(M)))` and the cuspidal analogue with the ideal of the boundary; the horizontal action of the centre of `𝔪` on `Loc(M)` induces the arithmetic Sen operator (BCGP25 Theorem 4.7.1, p. 99; Theorem 4.5.20, p. 79; Theorem 4.5.23, p. 81).

Here `VB_red` is applied to the complex `Loc(M)` of §7.2, not to a sheaf. A proof route: the Chevalley–Eilenberg resolution computes `RHom_𝔤(M, O^la)` as the complex `M^∨ ⊗ O^la ⊗ Λ^i 𝔤^∨`; apply `VB⁰` termwise to the Chevalley–Eilenberg complex `C^la ⊗ M̂^∨ ⊗ Λ^i𝔤^∨` representing `Loc(M)`, using `VB⁰(C^la) = O^la` and that `VB_red` is computed termwise on LB-sheaves killed by `𝔲⁰_P` (gap:solid-vb-sen), and compare the two complexes; the Sen statement is the comparison of horizontal and arithmetic actions.

*Needs:* §7.2; §7.3; gap:solid-vb-sen; PerfectoidShimuraVarieties §3.6, §6.3; HigherHidaAndColemanTheory §5.1.

**Checks.**

- The comparison is functorial in M and preserves Hecke actions.
- The Sen normalization is pinned by `ℚ_p(1)`, of Sen eigenvalue `+1`.
- No non-Liouville hypothesis is needed for the comparison itself; it enters in §7.5.
- The comparison uses all of `Loc(M)`: replacing `VB_red(Loc(M))` by `VB⁰` of the degree-zero cohomology sheaf `H⁰(Loc(M))` would drop `H¹(Loc(E)) ≠ 0` of the trivial module (§7.2, fourth Check), which `VB_red` retains.

### 7.5 The higher Eichler–Shimura spectral sequence

Prove: for non-Liouville λ and `M ∈ O(𝔤,𝔟)_{λ-alg}` there is a spectral sequence `E₁^{p,q} = ⊕_{ℓ(w)=p} H^{p+q}(HC_{w,λ}(E ⊗^L_{𝔲_{P_w}} M)) ⇒ H^{p+q}(CC_λ(M)) ⊗ ℂ_p`, and the cuspidal analogue; here `HC_{w,λ}` is the functor of §7.1b on the bounded derived category, applied to the complex `E ⊗^L_{U(𝔲_{P_w})} M`, whose cohomology in degree `−i` is the Lie algebra homology `H_i(𝔲_{P_w}, M)` of §7.2; the action of `wµ ∈ Z(𝔪_w)` on `H_*(𝔲_{P_w}, M)` induces the arithmetic Sen operator; and the cohomology sheaves satisfy `H^i(VB_red(Loc(M))) = VB⁰(H^i(Loc(M)))` (BCGP25 Theorem 4.7.2, pp. 99–100). The spectral sequences are of λ-smooth `B(ℚ_p)`-representations, through §7.1b on the `E₁` terms and §7.3 on the abutment, so they pass to the slope parts of §7.1b, as §7.6 uses (BCGP25 the paragraph after Theorem 4.7.2, p. 100). The coefficient Lie homology is derived and its higher terms are kept; Lie algebra cohomology of M is not substituted for it.

*Needs:* §7.4; §7.2; §7.1b; HigherHidaAndColemanTheory §5.5.

**Checks.**

- The abutment is indexed by total degree `p + q`.
- For proper Shimura varieties and antidominant λ the sequence degenerates and `CC_λ(M(𝔤)_λ)` is concentrated in degree `d = dim Sh` (BCGP25 Corollary 4.7.3, p. 100).
- For the modular curve (`d = 1`, two strata) the filtration has two steps, in degrees 0 and 1 of the Bruhat length.
- For the trivial module and one-dimensional `𝔲_{P_w}`, `E ⊗^L_{U(𝔲_{P_w})} E` has `H⁰ = E` and `H^{−1} = 𝔲_{P_w}`: the coefficient is a two-term complex in degrees `[−1, 0]`, which the degree reversal of §7.1b turns into higher Coleman sheaves in degrees 0 and 1, where §7.2 (2) puts the cohomology sheaves of `Loc(E)` (§7.2, fourth Check); and the Sen action of `wµ` is read on the torus weights 0 and that of the root line `𝔲_{P_w}`, not on those of `H⁰` and `H¹(𝔲_{P_w}, E) = 𝔲_{P_w}^∨`.

### 7.6 Ordinary Eichler–Shimura degrees

Let λ be non-Liouville and `M(𝔤)_λ` the Verma module. Prove: if the Shimura variety is proper or Siegel, the finite-slope functors `CC^fs_λ(M(𝔤)_λ)` and `CC^fs_{cusp,λ}` have slopes `≥ 0`, and the ordinary part has a spectral sequence `E₁^{p,q} = ⊕_{ℓ(w)=p} H^{2p+q−d}(HC^{=0}_{w,λ}(M(𝔪_w)_{λ + w^{−1}w_{0,M}ρ + ρ})) ⇒ H^{p+q}(CC^{=0}_λ(M(𝔤)_λ)) ⊗ ℂ_p` (BCGP25 Theorem 4.7.5, p. 100); if the variety is proper, the ordinary part is concentrated in degree d with the associated filtration (BCGP25 Corollary 4.7.6, p. 100), with no antidominance hypothesis.

*Needs:* §7.5; §7.1b; HigherHidaAndColemanTheory §5.6, §8.5.

**Checks.**

- The ordinary degree index is `2p + q − d`, not `p + q`: at `p = 0`, `q = d` the contribution is `H⁰`.
- Properness is used for middle-degree concentration; the Siegel case gets only the spectral sequence, and §7.7 supplies the localized version.
- The coefficient on the w-stratum is the Levi Verma module of weight `λ + w^{−1}w_{0,M}ρ + ρ`.

### 7.7 Genus-two boundary vanishing

For `G = GSp₄` and an absolutely irreducible residual `ρ̄ : G_ℚ → GSp₄(𝔽̄_p)` with associated prime-to-p Hecke ideal `m_ρ̄`, prove: `RΓ_c(Sh^tor_{K^p}, ℚ_p)_{m_ρ̄} → RΓ(Sh^tor_{K^p}, ℚ_p)_{m_ρ̄}` is a quasi-isomorphism (BCGP25 Theorem 4.9.4, p. 104), and the maps `RΓ_w(ω^{†,κ_w}(−D))^{ord}_{m_ρ̄} → RΓ_w(ω^{†,κ_w})^{ord}_{m_ρ̄}` are quasi-isomorphisms (BCGP25 Corollary 4.9.5 and Lemma 4.9.6, p. 104).

A proof route: the boundary of the completed tower has Hecke eigensystems of Eisenstein type, whose Hecke polynomials are reducible, so they vanish at `m_ρ̄`; apply the support triangle and the boundary-vanishing comparison.

*Needs:* §7.3; CompletedCohomologyPartII §7.1, §7.8; AutomorphicBundles §5.3, §5.4; IntegralHeckeAndGaloisDeterminants §3a.2.

**Checks.**

- A residual representation `χ₁ ⊕ χ₂ ⊕ ρ₂`, reducible, does not satisfy the hypothesis; its Hecke polynomial factors as boundary ones do.
- The statement is after localization; without it the boundary contributes.
- The cuspidal and full ordinary higher Coleman complexes agree after localization in each of the four Bruhat degrees.

### 7.8 The genus-two four-piece filtration

Specialize to `GSp₄/ℚ`, `d = 3`, `ρ = (−1, −2; 0)`, the four representatives `i_w` of lengths `i = 0, 1, 2, 3`, a non-Liouville `λ = (λ₁, λ₂; w)` (with `λ₁ + λ₂ ≡ w mod 2` when λ is integral), and an absolutely irreducible residual ρ̄. Prove: `V = RHom_𝔟(λ, RΓ̃^{la})^{ord}_{m_ρ̄}` is concentrated in degree 3 and `V ⊗ ℂ_p` has a filtration whose graded pieces are `Gr^i = (H^i_{i_w}(ω^{†, −w_{0,M}(i_w·λ + 2ρ_M)}) ⊗ ℂ_p(−i_w^{−1}w_{0,M}ρ − ρ))^{ord}_{m_ρ̄}`, on which the Sen operator acts by the scalars `(−λ₁−λ₂−w)/2`, `(−2+λ₁−λ₂−w)/2`, `(−4+λ₂−λ₁−w)/2`, `(−6+λ₁+λ₂−w)/2` for `i = 3, 2, 1, 0` (BCGP25 Theorem 4.9.9, pp. 105–106).

*Needs:* §7.6; §7.7; HigherHidaAndColemanTheory §9.1, §4.9.

**Checks.**

- At `λ = (1, 1; 2)` the four values in descending degree are `−2, −2, −3, −3`.
- At `λ = (1, 1; −2)` they are `0, 0, −1, −1`; a sign error in the central coordinate exchanges these two lists.
- The four values sum to `−(12 + 4w)/2 = −6 − 2w`, independent of `λ₁, λ₂`.

### Examples

At the singular weight `λ = (1, 1; w)`, `w` even, the four pieces have coherent weights `(1,1), (1,1), (2,2), (2,2)` in descending degree and Sen values `−1−w/2, −1−w/2, −2−w/2, −2−w/2`; Layer 8 studies the repeated value.

### Dependencies

AutomorphicBundles §5.3, §5.4; CompletedCohomologyPartII §2.2, §6.7, §7.1, §7.8, §F.4; HigherHidaAndColemanTheory §1.1, §4.9, §5.1, §5.2, §5.3, §5.4, §5.5, §5.6, §6.2, §8.5, §9.1; IntegralHeckeAndGaloisDeterminants §3a.2; LocallyAnalyticDistributions §0.0, §0.3, §4.16; LocallyAnalyticDistributionsPartII §1.4, §2.5; LocallyAnalyticRepresentationsOfLocalGroups §3.5, §3.10, §4.1, §4.2, §4.6; PerfectoidShimuraVarieties §3.6, §6.3; LieHighestWeight Layer 3; Tau Ceti `TauCeti.VermaModule`; gap:solid-vb-sen.

## Layer 8: The singular Sen operator and classicality

Standing hypotheses: those of Layer 7 specialized as in §7.8 to `GSp₄/ℚ` with `λ = (1, 1; w)`, w even, localized at a prime-to-p Hecke maximal ideal with absolutely irreducible residual representation. Multiplicity statements concern finite-dimensional eigenspaces after this localization.

### 8.1 The singular two-term Cousin complex

Prove: the ordinary part of `RΓ(Sh^tor, ω^{(1,1;−w),sm})` is computed by `RΓ_c` of the union of the Bruhat strata of lengths 2 and 3, and is represented in degrees 2, 3 by `Cous : H²_{2_w}(ω^{(1,1;−w),sm})^{ord} → H³_{3_w}(ω^{(1,1;−w),sm})^{ord}`, induced by the class of the extension of sheaves along the two strata; the strata of lengths 0 and 1 have no ordinary part, their slopes being at least `−(2,2;w)` and `(0,−2;−w)` against the ordinary slope `−(1,1;w)` (BCGP25 Proposition 4.10.3, p. 106; Proposition 4.10.6, p. 107).

*Needs:* §7.8; HigherHidaAndColemanTheory §5.5, §5.8.

**Checks.**

- The two terms are in degrees 2 and 3.
- In the identification with the graded pieces of §7.8, the degree-two term carries the twist `ℂ_p(2, 0; 0)` and the degree-three term `ℂ_p(0, 0; 0)`.
- The Serre-dual complex in degrees `[0, 1]` has weights `(2, 2; −w)` in both degrees (BCGP25 Remark 4.10.7 and §4.10.8, p. 107).

### 8.2 The repeated Sen block

Put `a = −1 − w/2`. Let `V_a` be the generalized a-eigenspace of the Sen operator Θ on `V ⊗ ℂ_p`. Prove: `(Θ − a)² = 0` on `V_a`; `V_a` sits in `0 → Gr³ → V_a → Gr² → 0`; and `Θ − a`, which vanishes on both pieces, induces `N_a : Gr² → Gr³` (BCGP25 §4.10.8, pp. 107–108). The other repeated value `−2 − w/2` occurs on `Gr¹` and `Gr⁰`.

*Needs:* §7.8; Mathlib `Module.End.genEigenspace`.

The basic properties are:

- `(Θ − a)² = 0` on `V_a`.
- `N_a` is the unique map `Gr² → Gr³` through which `Θ − a` factors.
- Hecke-compatible maps preserve the block and `N_a`.

**Checks.**

- At `w = 2`, `a = −2`, and the scalar values are `−2, −2, −3, −3`.
- If Θ is semisimple on `V_a`, then `N_a = 0`.
- The Jordan block `[[a, 1], [0, a]]` has `N_a ≠ 0` with the same two graded scalars, so scalar values on the graded pieces do not determine `N_a`.

### 8.3 The rank-one singular localization comparison

Let Q be the Klingen parabolic, `C_{3_w,Q}` the union of the Bruhat strata of lengths 2 and 3, which is one Q-orbit, and `C_{3_w,Q}^†` its germ. The restriction of `Loc(M(𝔤)_λ(−λ))` (§7.2) to `C_{3_w,Q}^†` is a complex, in a triangle whose outer terms are the extension by zero of the higher Coleman sheaf (§7.1a) of the open stratum and the higher Coleman sheaf of the closed stratum shifted by one (BCGP25 Proposition 3.6.6, p. 63). The horizontal operator `µ − µ₀`, `µ₀ = −1 − w/2`, acts by zero on both outer terms without splitting the triangle; the first cohomology `Ext¹` of its derived invariants is an extension of (𝔤,B)-equivariant sheaves of the closed-stratum higher Coleman sheaf by the extension by zero of the open-stratum one (BCGP25 (3.6.7)–(3.6.8), pp. 63–64). Prove: this extension agrees with the extension of the same two sheaves given by the Klingen higher Coleman sheaf `HCS_{Q,3_w,η}(M(𝔪_{3_w})_λ)` of §7.1a, up to twisting the B-action by the character `λ − η`, `η = (0, −1; 1)`, and multiplication by a nonzero scalar (BCGP25 (3.6.5) and Theorem 3.6.9, pp. 63–64; Proposition 3.6.15, p. 66); this extension class is the one that induces the Cousin map of §8.1. The statement includes nonvanishing of the comparison on both strata and on the overlap.

A proof route: use the two-step Chevalley–Eilenberg complex for the root subalgebra of the Klingen root β. At the closed orbit the relevant operator is `x∂_x + 1`, injective on power-series germs in characteristic zero. At the overlap the operator `(x+1)∂_x + 1` kills the germ `1/(1+x)`; the route must therefore identify the constrained fibre on which the comparison is computed and show that this germ is not in it, or construct the nonzero comparison by another argument. Once nonvanishing is known, the comparison is a nonzero scalar because the endomorphisms of the extension are scalars.

*Needs:* §7.2; §7.1a; §8.2; §8.1.

**Checks.**

- The Klingen sheaf is indexed by a character of the Klingen Levi `M_Q`, as §7.1a requires: with `s_β(k₁, k₂; w) = (−k₁, k₂; w)`, so `⟨χ, β^∨⟩ = −k₁`, the weight `η = (0, −1; 1)` has `⟨η, β^∨⟩ = 0` and lies in `X^*(M_Q)` (the derived group of `M_Q` being `SL₂`), whereas `λ = (1, 1; w)` has `⟨λ, β^∨⟩ = −1` and does not; `λ − η = (1, 2; w − 1)` lies in `X^*(T)` (`1 + 2 ≡ w − 1 mod 2` for w even), so the Verma module `M(𝔪_{3_w})_λ` lies in `O(𝔪_{3_w}, 𝔟_{M_{3_w}})_{η-alg}`, the image of `Q ∩ P_{3_w}` in `M_{3_w}` being its Borel (BCGP25 §3.6.2, Proposition 3.6.3 and §3.6.4, p. 63).
- `(x∂_x + 1)(Σ a_n x^n) = Σ (n+1)a_n x^n`, zero only when every `a_n = 0`.
- `((x+1)∂_x + 1)(1/(1+x)) = −1/(1+x) + 1/(1+x) = 0`: injectivity on all analytic germs fails at the overlap.
- Equality of eigenvalues on the two strata does not give equality of extensions; the comparison is of extension classes.
- The compared object is a cohomology sheaf of a derived object: derived invariants of an operator acting by zero on X are `X ⊕ X[−1]`, so each outer term of the triangle appears twice, in adjacent degrees, and `Ext¹` takes the shifted copy of the open-stratum term and the unshifted copy of the closed-stratum term (which was already shifted by one). Reading `Loc` as a sheaf in degree 0 would leave no closed-stratum term in degree 1 and no extension to compare.

### 8.4 The Sen–Cousin comparison

Prove: under the identification of the graded pieces, `N_a` and the Cousin map of §8.1 agree up to a nonzero scalar (BCGP25 Theorem 4.10.12, p. 108). The scalar does not affect kernel, image or vanishing.

A proof route: represent the block by the cone of `Θ − a`; compare its two exact triangles through §8.3 and `VB_red`; transport to ordinary cohomology and the Cousin boundary with the B-twists kept.

*Needs:* §8.3; §8.1; §8.2; §7.4; PadicHodgeTheory §4.4.

**Checks.**

- The comparison is of extension classes: a Jordan block and a semisimple block have the same graded scalars and different `N_a`.
- Under the comparison, `ker N_a` is the space of classical classes `H²(Sh^tor, ω^{(1,1;−w),sm})^{ord}`.
- The scalar is nonzero; a zero comparison would make every ordinary class of degree two classical, which §8.2's Jordan example excludes.

### 8.5 Balanced eigenspace exactness

Let `f ∈ H⁰_{0_w}(ω^{(2,2;−w),sm})^{ord}` be an ordinary overconvergent eigenform with irreducible `ρ_f : G_ℚ → GSp₄(ℚ̄_p)`, whose Zariski image contains `Sp₄`, or contains `SL₂ × SL₂` with `ρ_f` reducible on an index-two subgroup, and `m_f` its maximal ideal. Prove: `V[m_f] ≅ ρ_f ⊗ W` with `n = dim W > 0`, so `dim V[m_f] = 4n` (BCGP25 Lemma 4.12.3, p. 113). Assume further that `dim_{ℂ_p} Gr^i(V ⊗ ℂ_p)[m_f] = n` for each `i = 0, 1, 2, 3` (BCGP25 Theorem 4.12.4(3), p. 113). Prove that the sequence `0 → Gr³[m_f] → V_a[m_f] → Gr²[m_f] → 0` stays exact.

A proof route: the Eichler–Shimura relation and the Nekovář argument identify `V[m_f]`; the filtration on `V[m_f]` injects on each graded piece into `Gr^i[m_f]`, and the total `4n` equals the sum of the four upper bounds, forcing equality at every step. If separately each `Gr^i[m_f]` has dimension at most one, `4n ≥ 4` forces `n = 1` and the balance (BCGP25 Remark 4.12.5, p. 114).

*Needs:* §7.8; §8.2; gap:gsp4-eichler-shimura; ArithmeticGaloisRepresentations §5.11, §7.6.

**Checks.**

- Taking `m`-torsion is not exact: for `M = E[T]/(T − a)²` with sub `S = (T − a)M ≅ E` and quotient `M/S ≅ E`, the `(T − a)`-torsion gives `0 → S → S → E` with zero last map; the balance hypothesis is what restores exactness.
- The image hypotheses give the total `4n`; they do not give the four graded dimensions, which are a separate hypothesis.
- With `n = 1` and graded dimensions `(2, 0, 1, 1)` the total is still 4 but the balance fails, and exactness of the block is not asserted.

### 8.6 De Rham ordinary classicality

In the setting of §8.5, assume the balance `dim Gr^i(V ⊗ ℂ_p)[m_f] = n` for every i with `dim V[m_f] = 4n`, and that `ρ_f|_{G_{ℚ_p}}` is de Rham. Prove that f is classical (BCGP25 Theorem 4.12.4, pp. 113–114).

A proof route: on `V[m_f] = ρ_f ⊗ W` the arithmetic Sen operator is that of `ρ_f`, semisimple because `ρ_f|_{G_{ℚ_p}}` is de Rham, hence Hodge–Tate; so `N_a` vanishes on the eigenspace; by §8.4 the Cousin map vanishes and every ordinary degree-two class of eigensystem `m_f` is classical; stability of the coherent multiplicity along the stable Arthur parameter gives `dim H⁰(ω^{(2,2;−w),sm})[m_f] = n`, so the classical eigenspace is the whole ordinary eigenspace and contains f.

*Needs:* §8.4; §8.5; PadicHodgeTheory §4.4; gap:gsp4-weight-two-stability; AutomorphicFormsOnReductiveGroups §6.5.

**Checks.**

- A non-de Rham ordinary `ρ_f|_{G_{ℚ_p}}` (an extension of the two potentially unramified planes with nonzero nilpotent Sen operator) has `N_a ≠ 0`, and the argument gives nothing.
- de Rham here means: the Sen operator of `D_Sen(ρ_f|_{G_{ℚ_p}})` is semisimple with eigenvalues `−1 − w/2` and `−2 − w/2` (BCGP25 before Theorem 4.12.4, p. 113).
- Semisimplicity is applied to the finite-dimensional eigenspace `V[m_f]`, not to the infinite-dimensional completed space.

### Examples

At `w = 0`, `a = −1`: an ordinary weight-(2,2) eigenform with Sp₄ Zariski image, de Rham at p and with each `Gr^i[m_f]` one-dimensional, is classical by §8.6.

### Dependencies

ArithmeticGaloisRepresentations §5.11, §7.6; AutomorphicFormsOnReductiveGroups §6.5; HigherHidaAndColemanTheory §5.5, §5.8; Mathlib `Module.End.genEigenspace`; PadicHodgeTheory §4.4; gap:gsp4-eichler-shimura; gap:gsp4-weight-two-stability; Layer 7.

## Layer 9: Four integral projective Hida modules

Standing hypotheses. `G = GSp₄/ℚ`, p any prime, O a complete discrete valuation ring finite over `ℤ_p` with field of fractions E, `Λ = O[[T(ℤ_p)]]` the full torus Iwasawa algebra including its finite torsion (PadicMeasuresIwasawaAlgebras §1.7), `Λ₀ = ℤ_p[[T(ℤ_p)]]` the coefficient ring of the imported complexes, so that `Λ = Λ₀ ⊗_{ℤ_p} O` because O is finite free over `ℤ_p`, neat tame level `K^p`, and the four Weyl strata of HigherHidaAndColemanTheory §9.1. The integral amplitude theorem in genus two is HigherHidaAndColemanTheory §4.9. Imported complexes are transported along `ι([t]) = [t⁻¹]`, so that specialization is at `+λ` with the twist `E(−λ)`.

### 9.1 The four modules

Let `M_w^•` be the supported integral Iwasawa complexes of HigherHidaAndColemanTheory §4.5 after base change along ι, cuspidal for `ℓ(w) = 0, 1` and canonical for `ℓ(w) = 2, 3`. Define `𝓜_w = H^{ℓ(w)}(M_w^•) ⊗_{ℤ_p} O` (BCGP25 §7.3, p. 163). Neither flatness nor projectivity is part of the definition.

*Needs:* HigherHidaAndColemanTheory §4.5, §4.6, §4.9; PadicMeasuresIwasawaAlgebras §1.1, §1.7.

The basic properties are:

- `𝓜_w` is the length-degree cohomology of the transported complex after extension of scalars along `Λ₀ → Λ`: O is finite free, hence flat, over `ℤ_p`, so `M_w^• ⊗^L_{Λ₀} Λ = M_w^• ⊗_{ℤ_p} O` and `H^{ℓ(w)}(M_w^• ⊗_{ℤ_p} O) = H^{ℓ(w)}(M_w^•) ⊗_{ℤ_p} O = 𝓜_w`.
- Cuspidal support for lengths 0, 1 and canonical support for lengths 2, 3.
- Evaluation at `+λ` after ι equals evaluation at `−λ` before it.
- The Λ-linear Hecke and `T(ℚ_p)` actions are inherited.

**Checks.**

- The length-zero module is `H⁰` of the cuspidal complex; the length-three module is `H³` of the canonical complex.
- For a character χ of `T(ℤ_p)` with `χ ≠ χ^{−1}` (for instance of order 3 when `3 | p − 1`), evaluation at χ and at `χ^{−1}` differ, so omitting ι changes the specialization.
- The amplitude of the cuspidal complex is `[0, ℓ(w)]` and of the canonical complex `[ℓ(w), 3]` (HigherHidaAndColemanTheory §4.9), so `𝓜_w` is the extreme cohomology in each case.

### 9.2 Concentration and projectivity

Prove: for each w the transported complex after extension of scalars to Λ is quasi-isomorphic to its length-degree module, `M_w^• ⊗^L_{ℤ_p} O ≃ 𝓜_w[−ℓ(w)]` in `D(Λ)`, equivalently `H^i(M_w^•) = 0` for `i ≠ ℓ(w)` (O being faithfully flat over `ℤ_p`), and `𝓜_w` is finite projective over Λ, for every prime p including `p = 2` (BCGP25 Theorem 7.3.1(1) and its proof, pp. 163–164).

A proof route: the amplitude bounds leave one extra degree only for lengths 1 and 2; for length one, `H⁰` with the length-one support condition vanishes, and duality gives the complementary length-two statement; residual detection then gives concentration and projectivity, over the full torus without splitting its finite part.

*Needs:* §9.1; HigherHidaAndColemanTheory §4.8, §4.9; DeformationAndDerivedPatchingAlgebra §7.1, §7.3.

**Checks.**

- Amplitude alone does not suffice for length one: the cuspidal complex has amplitude `[0, 1]`, and the vanishing of supported `H⁰` is what removes degree 0.
- At `p = 2` the finite torus quotient is a 2-group and cannot be split off by averaging; the residual criterion works over the local ring directly.
- For length 0, amplitude `[0, 0]` already gives concentration.
- Coefficients: for O the unramified quadratic extension of `ℤ_p` and the one-term complex `C = ℤ_p[0]`, `H⁰(C)` has `ℤ_p`-rank 1 while `H⁰(C) ⊗_{ℤ_p} O` has `ℤ_p`-rank 2 and O-rank 1; so the unextended complex cannot be quasi-isomorphic to the module over Λ, while `C ⊗_{ℤ_p} O = O[0]` has `ℤ_p`-rank 2 and O-rank 1 on both sides. For `O = ℤ_p` the extension is the identity and the statement is the concentration of the imported complex itself.

### 9.3 Classical specialization

Prove: for dominant algebraic λ and `κ = −w_{0,M}w(λ + ρ) − ρ` there are Hecke-equivariant isomorphisms `𝓜_w ⊗_{Λ,λ} E(−λ) ≅ H^{ℓ(w)}(Sh^tor_{Iw(p)K^p}, ω^κ(−D))^{ord}` for `ℓ(w) = 0, 1` and with `ω^κ` for `ℓ(w) = 2, 3`; the other cohomology of the derived fibre vanishes; `t ∈ T^+(ℚ_p)` corresponds to the double coset `[Iw(p) t Iw(p)]` (BCGP25 Theorem 7.3.1(2) and Remark 7.3.3, pp. 164–165).

*Needs:* §9.2; HigherHidaAndColemanTheory §3.7, §4.6, §9.1.

**Checks.**

- With `ν = (0, −2)`, the four weights are `(5,3), (5,1), (2,−2), (0,−2)` in lengths 0, 1, 2, 3 (HigherHidaAndColemanTheory §9.1).
- A character with `χ ≠ χ^{−1}` distinguishes evaluation at λ and at −λ.
- The `E(−λ)` twist makes `T(ℚ_p)` act through a smooth character trivial on `T(ℤ_p)`.

### 9.4 Higher Coleman specialization

Prove: for algebraic λ with `κ = −w_{0,M}w(λ+ρ) − ρ` only M-dominant, `𝓜_w ⊗_{Λ,λ} E(−λ)` is the `T(ℤ_p)`-invariant ordinary higher Coleman group `H^{ℓ(w)}_w(Sh^tor_{K^p}, ω^{κ,sm}(−D))^{ord, T(ℤ_p)}` for `ℓ(w) = 0, 1`, and without −D for `ℓ(w) = 2, 3` (BCGP25 Theorem 7.3.1(3), p. 164). No classical identification is asserted at such weights.

*Needs:* §9.2; HigherHidaAndColemanTheory §8.3, §5.5.

**Checks.**

- A weight M-dominant but not G-dominant still has a higher Coleman fibre.
- The support convention (cuspidal for lengths 0, 1) is retained.
- At a G-dominant weight §9.3 and §9.4 agree by the classicality comparison of HigherHidaAndColemanTheory §8.5.

### 9.5 Integral duality

Prove: for `w^* = w_{0,M} w w₀` there is a perfect Λ-bilinear pairing `𝓜_w ⊗_Λ 𝓜_{w^*} → Λ` interpolating Serre duality, with the torus action transposed and the Hecke action adjoint (BCGP25 Theorem 7.3.1(4), p. 164).

*Needs:* §9.2; HigherHidaAndColemanTheory §4.8.

**Checks.**

- Lengths 0 and 3, and lengths 1 and 2, pair: `ℓ(w) + ℓ(w^*) = 3`.
- The shift `[−3]` of the complex pairing becomes the complementary degrees; no further shift is attached to the modules.
- At a classical weight the specialized pairing is Serre duality between `H⁰(ω^κ(−D))` and `H³(ω^{κ^∨})`, with `κ^∨ = (3 − κ₂, 3 − κ₁)`.

### 9.6 Tame group-ring projectivity

Prove: for normal neat tame levels `K₁^p ⊂ K₂^p` with `Δ = K₂^p/K₁^p`, `𝓜_{w,K₁^p}` is finite projective over `Λ[Δ]`, and pullback and trace give `𝓜_{w,K₂^p} ≅ 𝓜_{w,K₁^p}^Δ` and `(𝓜_{w,K₁^p})_Δ ≅ 𝓜_{w,K₂^p}`; p may divide `|Δ|` (BCGP25 Theorem 7.3.1(5), p. 164; Lemma 7.3.2, p. 165).

*Needs:* §9.2; gap:tame-boundary-stabilizers; DeformationAndDerivedPatchingAlgebra §5.9.

**Checks.**

- For `Δ = ℤ/p`, invariants are not a direct factor of a general module (the regular representation of `𝔽_p[ℤ/p]` has invariants the line of the norm element, not a summand); projectivity over `Λ[Δ]` is what makes invariants and coinvariants agree.
- The residual test of DeformationAndDerivedPatchingAlgebra §5.9 is over a Sylow p-subgroup of Δ.
- For `p ∤ |Δ|` the statement reduces to taking a direct factor.

### 9.7 Fixed central character

Let `Λ_{GSp₄,ℚ} = O[[(ℤ_p^×(p))²]]` and `ψ(z) = diag(χ₁(z), χ₂(z), z^{−1}χ₂(z)^{−1}, z^{−1}χ₁(z)^{−1})`. Prove: there is a unique algebra map `f : ℤ_p[[T(ℤ_p)]] → Λ_{GSp₄,ℚ}` with `f ∘ χ^un ρν^{−3/2} = ψ`, the half-integral notation being read through the identification `Hom(T(R), S^×) = Hom(R^×, T̂(S))` for split tori (BCGP25 Lemmas 7.3.5–7.3.6, p. 166). Choose a prime `r > 5`, `r ≠ p`, with `r ≢ 1 mod p` when p is odd and `r ≢ 1 mod 4` when `p = 2`, and level `Iw₁(r)` at r. Prove: for compatible tame levels with r-component `Iw₁(r)`, the modules `(𝓜_{w,K₁^p} ⊗ Λ_{GSp₄,ℚ})^{|·|²}` on which the centre acts by `|·|²` are finite projective over `Λ_{GSp₄,ℚ}[Z K₂^p/Z K₁^p]` (BCGP25 Lemma 7.3.8, p. 167, and the choice of r before it; Remark 7.3.7, p. 167).

*Needs:* §9.6; §9.5; PadicMeasuresIwasawaAlgebras §1.7.

**Checks.**

- At `p = 2` take `r = 7`: `r > 5`, `r ≡ 3 mod 4`, and `(𝔽₇^×)/{±1}` has odd order 3, so its invariants are a direct factor.
- At `p = 3`, `r = 7` fails (`7 ≡ 1 mod 3`), while `r = 11` works and `(𝔽₁₁^×)/{±1}` has order 5, prime to 3.
- Read literally, the odd-prime condition `r ≢ 1 mod p` at `p = 2` has no solution, since every odd prime is `1 mod 2`; the conditions are by cases.

### Examples

At `p = 2`, the four modules are projective over `O[[T(ℤ₂)]]`, whose finite part `T(ℤ₂)_tors` is a 2-group; the length-zero and length-three modules are dual, and their specialization at `ν = (0, −2)` gives ordinary cuspidal `H⁰` of weight `(5, 3)` and ordinary `H³` of weight `(0, −2)`.

### Dependencies

DeformationAndDerivedPatchingAlgebra §5.9, §7.1, §7.3; HigherHidaAndColemanTheory §3.7, §4.5, §4.6, §4.8, §4.9, §5.5, §8.3, §8.5, §9.1; PadicMeasuresIwasawaAlgebras §1.1, §1.7; gap:tame-boundary-stabilizers.

## Downstream consumers

Siegel and Hilbert–Siegel modularity lifting consume the Hilbert family complexes and their control (Layer 4), the doubling injection and the two refinements (Layer 5), the one-place comparison (Layer 6), the four projective modules with duality, tame group-ring projectivity and fixed central character (Layer 9), and de Rham ordinary classicality in weight (2,2) (Layer 8). Classicality on PEL varieties (Layer 2) is consumed wherever overconvergent eigenforms on unitary or symplectic PEL varieties are shown classical. GSp4NonregularModularityLifting consumes the four-piece filtration (§7.8), the Sen–Cousin comparison and de Rham classicality (§§8.4–8.6), the four modules (Layer 9) and the singular Klingen comparison (Layer 3). Each consumer specifies its Hecke localization, support variant, p-normalization and character convention.

## Worked examples

- The modular curve is the common degenerate case of the first two layers: `n = 1`, `δ ∈ [0, 1]`, `c = k`, and §2.9 is Coleman's bound `v_p(α) < k − 1` for the standard `U_p`; the dimension-one case §2.8 applies.
- For the Siegel threefold at Iwahori level with `κ = (6, 6)`: `n = 3`, `c = 6`, slopes `< 3` are classical; with `κ = (6, 3)`, `c = 3` and no slope is admitted.
- The singular weight `Ω(k, 2)` has spherical scalar `p^{3−2} = p`, and Klingen extension threshold `k + 1` (HigherHidaAndColemanTheory §9.7); at `k = 0` it is 1.
- The companion operator with `T = 5`, `U = 6` sends `(2, 3)` to `(28, −2)`; its eigenvalues 2 and 3 give doubling images `(1 − 3U_Iw^{−1})f` and `(1 − 2U_Iw^{−1})f`.
- At `λ = (1, 1; 2)` the four Sen values are `−2, −2, −3, −3`, the repeated value −2 sits on `Gr³ ⊕ Gr²` and its nilpotent part is the Cousin map up to a nonzero scalar.

## References

- **BPS.** Stéphane Bijakowski, Vincent Pilloni and Benoît Stroh, *Classicité de formes modulaires surconvergentes*, Annals of Mathematics 183 (2016), no. 3, 975–1014, DOI 10.4007/annals.2016.183.3.5. Locators are statement numbers, which agree with the published version, and page numbers of the HAL deposit hal-01409534.
- **P20.** Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke Mathematical Journal 169 (2020), no. 9, 1647–1807, DOI 10.1215/00127094-2019-0075. Locators use the author PDF dated 17 June 2019 (113 pages).
- **BCGP21.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, Publ. Math. IHÉS 134 (2021), 153–501, DOI 10.1007/s10240-021-00128-2. Locators use the printed pages of arXiv:1812.09269v3.
- **BCGP25.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1 (2025). Locators use its printed pages.
- **AIP15.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, *p-adic families of Siegel modular cuspforms*, arXiv:1212.3812v1; published in Annals of Mathematics 181 (2015). Locators use the arXiv v1 numbering and pages.
- **BP26.** George Boxer and Vincent Pilloni, *Higher Hida theory for Siegel modular forms*, Inventiones mathematicae 244 (2026), 45–141, DOI 10.1007/s00222-025-01393-2; author version. Its results enter through HigherHidaAndColemanTheory and BCGP25 §7.3.

### Source issues and conventions

The statements above use the following corrections, each in this roadmap's own words.

- **BPS Lemma 4.4.3 (HAL p. 24).** The quasi-compactness argument uses the product map `B_k → X^k` as if finite étale; it is not, since source and target have different dimensions for `k > 1`. Each coordinate quotient map is used separately, which suffices (§2.3).
- **BPS Lemma 4.4.5 (HAL p. 25).** Multiplying the degree lower bound by the terminal weight requires `c_i ≥ 0`; the region of §2.1 forces `c_i > 0` (§2.1, §2.5).
- **BPS §§4.5–5.1 (HAL pp. 27–30).** A half-open interval of valuations is not a quasi-compact domain; the continuation exhausts it by closed rational boxes (§1.4, §2.7).
- **P20 Proposition 13.3.3.1 (p. 90) and BCGP21 §6.4 (p. 154).** The printed diagram intertwines U on the middle term of the BGG sequence with `p^{−k−1}U` on the reflected term, and BCGP21 prints `U_{v,2} ∘ θ = p^{k_v−l_v+1} θ ∘ U_{v,2}`; read with the usual order of composition, both say that the differential raises the slope of the standard operator by `k + 1`. Under that reading the equivariant twist on the reflected term is `p^{−k−1}`, its twisted slopes are `≥ −3 − (k + 1)`, and neither the thresholds `k − 2` and `k + 1` of Corollary 13.3.3.1 nor Corollary 6.4.3 follows. Those corollaries, and BCGP21's own statement that the twist on the term indexed by J is `p^{k_v−l_v+1}` for `v ∈ J`, require `θ ∘ U_source = p^{k+1} U_target ∘ θ`, the differential lowering the slope by `k + 1`, which is the relation of AIP15 Proposition 7.2.3 (p. 34) for the Siegel BGG differentials, used in the proof of its Proposition 7.3.1 (p. 35); §6.4 and the Scope paragraph use that direction. HigherHidaAndColemanTheory §9.6, item 4, keeps the printed wording; no target of this roadmap uses §9.6 (supplier contract). The first Check of §6.4 computes both readings on two eigenlines.
- **P20 Corollary 14.6.2, proof (p. 99).** The displayed continuation polynomial omits a coefficient in its linear term; the polynomial inverse `Q = −(P − P(0))/(X P(0))` is used (§6.5).
- **P20 Proposition 15.2.4.1 (p. 109).** Its hypothesis reads `λ₁ > 0`; the singular parameters of §§15.2.1–15.2.3 have `λ₂ = 0`, `λ₁ < 0` and `k = −λ₁ − 1 ≥ 0`, so the hypothesis is read as `λ₁ < 0`, as in §3.5's specialization `λ = (−k−1, 0; c)`. The proof of Theorem 15.2.1 (§15.2.5, p. 109) specializes at one large weight; a witness is needed in every component of `Spec Λ₁`, including the full local algebra at `p = 2` (§3.5).
- **BCGP21 Proposition 4.6.19, proof (pp. 113–114).** The simultaneous-powers recursion fails for two parameters (`n²` against `(n−1)² + 1`); the dévissage is one exponent at a time (§4.6).
- **BCGP21 Lemma 4.6.16, proof (p. 112).** The subgroups `L_{w,n} ⊂ G_w[p^{2n}]` are called of order `p^{3n}` (and the `L_w` of order `p³`), while the same sentences describe them as extensions of `ℤ/p^n ⊕ ℤ/p^{2n}` by `μ_{p^n}`, of order `p^{4n}`; the latter agrees with the correspondence of p. 109 (étale part `p³`, multiplicative part p) and with the `U_{w,2}` correspondence (BCGP21 Lemma 4.5.17, p. 105), and is the one used (§4.6).
- **BCGP21 Proposition 4.4.3 (p. 99).** Direct-factor descent of deck invariants needs `p ∤ |Δ|`, which neatness does not imply; §4.2 keeps that hypothesis for the common-similitude group.
- **BCGP21 Theorem 6.6.4, proof (p. 167).** The two dimension defects are those of the actual restriction map r, and `χ(source) − χ(target) = −a − b` forces both to vanish (§6.7).
- **BCGP21 Proposition 6.6.2 and Theorem 6.6.4 (pp. 165–167).** The proposition states the equality of Euler characteristics for the geometric dagger complex `e(U^I)RΓ(X^{mult,†}, ω^κ(−D))`, whose coefficient is classical, and its proof gives it also for the analytic complex, which is the one Theorem 6.6.4 uses; the proof rests on Theorem 3.10.1(2), which needs a non-Eisenstein localization the proposition does not state. §6.6 keeps the three Euler characteristics apart and the localization among its hypotheses, and §6.5 states the classicality theorem with the geometric target.
- **BCGP21 §§6.1.4–6.1.7 (pp. 141–142).** The radii ε, w and the torsor radius are taken in closed intervals starting at 0; at radius 0 the set `1 + p⁰R` contains 0 and is not a group, and the amplitude theorem (Theorem 6.2.6, p. 145) assumes `ε > 0` and a level at least `n(ε)`; §6.1 takes the radii strictly positive and §6.2 states those hypotheses.
- **BCGP21 §6.5.3 and Lemma 6.5.4 (p. 155).** The inclusion of the degree neighbourhoods into the Hodge–Tate neighbourhood of radius `1 − 1/(p−1)` is taken from P20 Lemma 14.1.2 together with that lemma's range, radius at least `1 − 1/p`, and extended to `v ∈ Iᶜ` with radius at least `2 − 1/p`. P20 measures a neighbourhood by the lower bound of the degree, whereas BCGP21 §6.5.2 measures it from the multiplicative end, `deg_v ≥ 1 − ε_v` (respectively `2 − ε_v`); in the latter parametrization the range is `0 < ε_v ≤ 1/p`, which is the one §6.1 uses.
- **BCGP21 §6.5.1 (p. 154).** Finite flat degrees are computed with the untruncated determinant valuation before passing to bounded Hasse coordinates (§6.5).
- **BCGP25 Definition 4.6.35, following paragraph (p. 88).** The cohomology sheaves of a contravariant exact functor applied termwise to a complex are printed with the index unchanged; the degrees reverse, and the i-th cohomology sheaf is `VB⁰(HCS_{w,λ}(H^{−i}(M)))`. The reversed index is the one under which Theorem 4.7.5 has its index `2p + q − d` (§7.1b).
- **BCGP21 Proposition 5.7.4, following paragraph (p. 130).** The restriction of δ to `D_w` is labelled `δ⁻¹` there; it is δ itself, the isomorphism `ω_w → ω_w^{p²}`, a section of `ω_w^{p²−1}`, and its inverse, a section of `ω_w^{1−p²}`, is the multiplier of (5.7.7) (§5.4).
- **BCGP25 Remark 4.10.7 (p. 107).** The degree-zero piece has weight `(2, 2; −w)`, as in §4.10.8 (§8.1).
- **BCGP25 Proposition 3.6.15, proof (pp. 66–67).** Injectivity of `(x+1)∂_x + 1` on all analytic germs fails, the germ `1/(1+x)` being in its kernel; the comparison must be shown nonzero on the actual constrained fibre (§8.3). No counterexample to the proposition is claimed.
- **BCGP25, choice of r before Lemma 7.3.8 (p. 167).** The conditions on r are read by cases: `r ≢ 1 mod p` for p odd and `r ≢ 1 mod 4` for `p = 2` (§9.7).
