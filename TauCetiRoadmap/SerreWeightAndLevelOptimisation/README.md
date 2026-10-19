# Roadmap: weight and level optimisation of residual modular representations

**Summary.** Starting with an already modular two-dimensional residual Galois representation, build the integral level-changing arguments that put its prime-to-coefficient-prime level at its full Artin conductor and its weight at the extension-sensitive Serre weight. The build includes odd-characteristic companion forms, the weight-one and Jacobian multiplicity inputs needed by nonregular modularity lifting, Buzzard's dyadic arguments with their scalar boundary, and the totally real optimisation theorems used inside Khare–Wintenberger. Its elliptic export distinguishes a weight-two reduced level, represented arithmetically by `reducedLevel`, from a prime-to-coefficient-prime Serre level. Global residual modularity is a hypothesis throughout the general optimisation results.

## Scope and ownership

This roadmap owns the applications of integral old/new cohomology to residual level descent, the geometric lowering contradictions, weight optimisation for an existing modular eigensystem, coefficient-prime level removal, and the precise conditional exports. It also owns the concrete totally real optimisation in Khare–Wintenberger II §8: minimal modular witnesses after allowable base change, the parallel weight change, quaternionic raising as used in that argument, and modular lifts with prescribed locally admissible types.

Sections 2.10 and 4.8 own rational weight-two level lowering and finite-flat weight-two optimisation; §4.7 owns the weight-two coefficient-prime bridge. For AutomorphicGaloisRepresentations §6.5, use §§2.10, 2.13 and 4.7–4.8 for the overlapping odd-characteristic lowering, coefficient-prime bridge and `ℓ≥5` finite-flat inputs; its type-Σ packaging and extra characteristic-three character comparison remain there. Its §7.6 squarefree lowering wrapper uses §2.10; the fixed-form deduction from finite newform sets and strong multiplicity one remains there.

ArithmeticGaloisRepresentations Layer 3 owns the full Artin conductor, Swan conductor and invariance under coefficient extension; NeronModelsAndSemistableAbelianVarieties §5.3h owns the elliptic residual conductor formulas. AlgebraicModularFormsAndSerreWeights Layers R15.1–R15.4 owns Katz forms, coherent Hecke modules, Hasse/theta/Frobenius operations and the local weight recipe, including extension classes. This roadmap applies these objects and does not give them new definitions. The analytic old/new decomposition, normalized characteristic-zero newforms, and weight-one lattices belong to Tau Ceti and its ModularForms roadmap. The integral Jacobian and cohomology comparison belongs to ModularCurvesPartII Layers 13–15; analytic orthogonality does not supply it.

IntegralHeckeAndGaloisDeterminants IHG.1 owns the Cayley–Hamilton and reducibility algebra. The augmented-algebra congruence functor requires additional augmentation and generic-rank hypotheses. Section 1.3 constructs the comparison needed for the Hecke application and specifies its localisation and pairing API; it is distinct from the level-change lattice quotient.

Néron character groups and monodromy pairings are imported from NeronModelsAndSemistableAbelianVarieties §§2.4, 4.1–4.6; the discriminant-pq Jacobians and definite quaternionic modules come from HilbertModularVarietiesAndShimuraCurves Layer R18.3 and §§R18.5.15–R18.5.18. GL2AutomorphicRepresentationsAndTransfer owns Jacquet–Langlands, solvable automorphic base change, finite-image induction, local compatibility and Wiese's dihedral Katz realisation. Its §R17.6.12 supplies the characteristic-two realisation used here. This roadmap's quaternionic targets are applications of those modules and comparisons, with their coefficient and saturation hypotheses retained.

The new exact multiplicity-two upper bound in Calegari–Geraghty 2018 Theorem 4.8 belongs to GL2ModularityLiftingDefectOne. Here one builds its previously known multiplicity-one branch, Wiese's scalar lower bound and Gross's ordinary sequence. ClassicalSerreModularity owns the scalar non-dihedral dyadic classical completion and the unconditional Serre statement. Both occur in the final case manifest, without entering an early proof prerequisite. EllipticCurveModularity consumes the large-good-prime export; it cannot supply the premise of that export.

## Conventions

Write p or `ℓ` for the coefficient prime; they denote the same role, with `ℓ` used when an additional geometric bad prime p occurs in the two-prime Jacobian argument. A residual representation is continuous, odd and irreducible over an algebraic closure of a finite field; after a finite coefficient extension it is defined over a finite field k. In geometric and totally real multiplicity arguments use absolute irreducibility with the stated residual-image restrictions. Over a totally real field, odd means totally odd. A modular witness includes the form, weight, level, characteristic-zero or Katz character, coefficient field, chosen coefficient prime and residue embedding.

Use arithmetic Frobenius and the q-expansion Hecke normalization: at a good prime q a weight-k form of character `ε` gives characteristic polynomial `X²−a_q X+ε(q)q^{k−1}`. The mod-p cyclotomic character `χ_p` has `χ_p(Frob_q)=q`. An unramified local character `λ(u)` has `λ(u)(Frob_p)=u`. Thus the ordinary local diagonal characters are `χ_p^{k−1}λ(ε(p)/a_p)` and `λ(a_p)`; their product is `χ_p^{k−1}` times the unramified character with value `ε(p)`. This fixes the direction of the companion twist: `ρ_f=χ_p^{k−1}⊗ρ_g`. Cohomologically normalized sources with an inverse cyclotomic convention must be translated before using these formulas.

O denotes the chosen complete coefficient DVR, `π` its uniformiser, K its fraction field and k its residue field. Integral geometric lattices and pairings retain their particular coefficient rings and duality twists. An eigenvalue lift permits a finite extension of K and a dominating DVR with a compatible residue embedding; neither a chosen lift vector nor uniqueness is part of its conclusion. A finite O-module's torsion-free quotient is indicated by the subscript tf. Jacobian m-torsion is actual torsion in the Jacobian. Residual support of an O-free cohomology lattice H is tested on `H/πH`, rather than on its zero `π`-torsion.

`N(ρ)` is the full prime-to-p Artin conductor, including wild exponents. It is different from its radical and from the elliptic reduced level `M₀`, which can contain p. Here `k(ρ)` denotes the classical Serre weight and `k_ρ` the least Katz weight; these names are opposite to the symbols `k_ρ` and `k(ρ)` in Edixhoven’s author revision. They are different conventions: in the odd-characteristic unramified local branch the former is p and the latter is one. Finite flatness refers to a model of the actual local finite Galois module over `Z_p` and retains extension data; finite image alone does not imply it. Scalar refers to every matrix of the local representation, not just its semisimplification or the roots of a characteristic polynomial.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `6b7abb3` and Tau Ceti at `a91d3aa` for the representative signatures. The existing Tau Ceti roadmaps fix the boundaries: their analytic, lattice and local/profinite constructions are inputs to the residual applications here.

Use `TauCeti.cuspFormsOld` from `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`. The complex old submodule of weight-k `Γ1(N)` cusp forms, using level-raising maps.

Use `TauCeti.cuspFormsNew` from `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`. The complex Petersson-orthogonal new submodule, not an integral residual object.

Use `TauCeti.isCompl_cuspFormsOld_cuspFormsNew` from `TauCeti/NumberTheory/ModularForms/Newforms/Basic.lean`. Complementarity over C; no saturation or mod-`ℓ` statement.

Use `TauCeti.ModularForm.levelRaise` from `TauCeti/NumberTheory/ModularForms/Degeneracy.lean`. For nonzero natural d and a target subgroup with HasDetOne, the conjugation inclusion `G′≤diag(d,1)⁻¹Gdiag(d,1)` gives `V_d f(τ)=f(dτ)`. The diagonal matrix has determinant d; determinant one is a property of the target subgroup, not of this matrix.

Use `HeckeRing.GL2.Newform` from `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`. Normalized characteristic-zero newform whose `EigenformAwayFromLevel` data concern positive indices coprime to the level. The structure provides no bad-prime `U_p` eigenvalue slots.

Use `HeckeRing.GL2.cuspFormsNewEigenspace` from `TauCeti/NumberTheory/ModularForms/Newforms/MultiplicityOne.lean`. Complex new eigenspace; its one-dimensional comparison is not residual multiplicity one.

Use `DirichletCharacter` from `Mathlib/NumberTheory/DirichletCharacter/Basic.lean`. Multiplicative characters of ZMod n with zero, over a commutative monoid with zero.

Use `DirichletCharacter.changeLevel` from `Mathlib/NumberTheory/DirichletCharacter/Basic.lean`. Character pullback for n dividing m; injectivity requires `[NeZero m]` for the target modulus; `changeLevel` itself only requires `n∣m`.

Use `Submodule.mkQ` from `Mathlib/LinearAlgebra/Quotient/Defs.lean`. The linear quotient map `H→H/P`, over a ring and an additive commutative module.

Use `Nat.primeFactors` from `Mathlib/Data/Nat/PrimeFin.lean`. The distinct prime factors of a natural number as a finite set; membership includes `n≠0`.

Use `padicValNat` from `Mathlib/Data/Nat/PadicValNat.lean`. The exponent of the largest dividing p-power for nonzero n and prime p; defaults at zero/base one are excluded by the mathematical input hypotheses.

Suggested.lean states the finite-torsion and lattice-index comparisons in §1.2, the degeneracy matrix factorization in §2.5 and the arithmetic reduced-level comparisons in §6.1.

The gluing comparisons use the existing submodule quotient over a commutative ring and module. The DVR finiteness theorem has the additional finite-free and rational complement assumptions in Layer 1, expressed using Mathlib's `Submodule.localized` at the nonzero elements. The suggested `reducedLevel` is an arithmetic expression in natural-number prime factors and exponent valuations of `|Δ|`; its elliptic interpretation requires the conductor and minimal-discriminant hypotheses in Layer 6. Natural valuation defaults at zero are not used to model a zero minimal discriminant.

For `H ⧸ (P ⊔ Q)`, use `Submodule.Quotient.subsingleton_iff` for the zero criterion, `Submodule.Quotient.mk_eq_zero` for membership, `Submodule.quot_hom_ext` and `Submodule.linearMap_qext` for extensionality, `Submodule.liftQ` with `Submodule.liftQ_mkQ` for descent, and `Submodule.mapQ`, `Submodule.mapQ_id`, `Submodule.mapQ_comp` and `Submodule.Quotient.equiv` for maps and transport. These declarations are in `Mathlib/LinearAlgebra/Quotient/Defs.lean` and `Mathlib/LinearAlgebra/Quotient/Basic.lean`; unique descent follows from the quotient projection's surjectivity `Submodule.mkQ_surjective`. Their ring, module and kernel/image hypotheses are retained. The lattice-specific finite-torsion statement and index-`π` example belong to §1.2.

### From TauCetiRoadmap

The ModularForms layers 3–4 supply the analytic degeneracy and newform theory. Layer 8 supplies modular symbols, integral Hecke algebras and coefficient fields; layer 8W supplies the weight-one q-expansion lattice and integral Hecke/coefficient-field interface, and layer 8G supplies coefficient-Galois stability with conjugate character. These require the stated geometric ModularCurvesPartII Layers 13–15 comparison to pass to integral curve cohomology. The ModularCurves roadmap supplies the curves and Jacobians; its Part II supplies the named integral, bad-fibre and non-Eisenstein comparisons below. ClassFieldTheory layer 7 supplies arithmetic local reciprocity and conductor/unit comparisons, layers 11–12 supply global reciprocity and ray-class existence. Compatible local character prescriptions use ArithmeticGaloisDuality §R02.4.6, with its global and dyadic obstructions. Chebotarev layer 10 supplies positive-density arithmetic Frobenius classes in a finite joint quotient, with a finite set of bad primes excluded. LocalGaloisGroups supplies the basic local/profinite foundations; residual conductors and finite-flat optimisation use their ArithmeticGaloisRepresentations/FiniteFlatGroupsAndIntegralPadicHodgeTheory owners.

### From the neighbouring roadmap suppliers

Each contract fixes the coefficient system, geometric situation and comparison maps that the application consumes. A layer title alone does not supply the stated output. Each contract separates existing objects from the additional comparisons constructed in the consuming sections here: the symmetric-power Ihara and dyadic raising comparisons in §§1.1, 2.4 and 5.5; Gross/Wiese geometric comparisons in §§3.3–3.5, 3.10–3.12 and 5.2; the two-prime sequences in §§2.7 and 5.6; integral congruent-character transfer in §5.8; and definite quaternionic Gram, field and sign comparisons in §§6.6–6.11. These specialisations are targets of this roadmap, with the source and hypotheses below; their statements are not inferred from a supplier’s more general carrier.

The finite-flat augmented congruence comparison in §1.3 is an additional target over the Hecke algebras used here. IntegralHeckeAndGaloisDeterminants IHG.1 supplies Cayley–Hamilton/reducibility algebra, not this augmented functor. Section 1.3 must construct `Ψ_λ(M)=coker(M[ker λ]→(M/(ker λ)M)_tf)`, `η_λ=λ(Ann ker λ)`, and its localisation, finite-torsion and perfect-pairing comparisons under the hypotheses stated there, including the nodal-algebra test of IKM24 Proposition 2.10.

From `ArithmeticGaloisRepresentations:Layer 3`: Artin and Swan conductors, reduction invariance of Swan and conductor inequalities, with all wild terms. NeronModelsAndSemistableAbelianVarieties §5.3h supplies the elliptic residual conductor formula away from the coefficient prime. Section 6.2 constructs the separate `ℓ=3` finite-flat multiplicative coefficient-prime removal needed for the conditional BS20 weight-two `M₀` theorem, without extending the `ℓ≥5` additive formula to 3.

From `ArithmeticGaloisRepresentations:Layer 4`: Finite joint quotients and complex conjugation for Chebotarev; residual-image classification and preservation under linearly disjoint solvable base change. For the dyadic involution auxiliary prime, prove the absolutely irreducible two-dimensional residual image has even order and contains an involution, and apply Chebotarev to that actual matrix class.

From `ArithmeticGaloisRepresentations:§§6.1–6.4`: Tate modules, their elliptic torsion realisation and determinant, and the Tate-curve local representation. The good-reduction finite-flat model is supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.1. Residual irreducibility is a hypothesis of the fixed elliptic export; no eventual-irreducibility theorem follows from the conductor declaration.

From `ArithmeticGaloisDuality:§§R02.4.5b–R02.4.6`: Compatible local character prescriptions, Grunwald–Wang with its dyadic obstruction, and character roots with their local/global obstructions. These supply approximation and root prerequisites, not determinant alignment by themselves.

From `ArithmeticGaloisDuality:§R02.6.2, Finite-order determinant twists`: KWII Lemma 7.10 determinant alignment. Over the totally real field F, the two arithmetic characters have equal reductions, agree on open subgroups of units above p and on all units at the prescribed split finite places, and have equal values at every complex conjugation. Their ratio is finite p-power order and totally even. After coefficient extension and a disjoint totally real solvable change split at those places, a finite p-power-order character ζ, unramified there, satisfies `ζ²ψ=ψ′` after restriction. At p=2 total evenness is an independent hypothesis; local units and dyadic Grunwald–Wang conditions are retained.

From `GlobalGaloisDeformations:§§4.4, 4.8–4.11`: Fixed-determinant lifting data and arithmetic determinant characters `ψχ_p`, transported under allowable changes and residually trivial twists; local square-root compatibility at every special place.

From `LocalGaloisDeformationRings:§§8.2–8.5, 8.13–8.18`: The precise locally admissible A/B/C type conditions in KWII §8.3, crystalline and potentially crystalline fields, noncrystalline semistable branch, and determinant/nonemptiness hypotheses; this roadmap constructs modular witnesses only for these admissible data.

From `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`: Finite étale models of unramified finite local Galois modules over `Z_2` and the implication finite étale `⇒` finite flat.

From `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.1.7–R07.1.9`: Connected–étale p-divisible groups, Tate exactness, Cartier duality and Picard pairing normalization used in Gross/CG’s full-Hecke local factor; no Gorenstein freeness is assumed. Sections 3.10–3.12 here construct the ordinary full-Hecke specialisation, including residue exactness and Cartier/Picard duality in Wiese07 Cor. 2.3 for Situation II at `p=2`. Do not require a Gorenstein Hecke algebra or a free middle Tate module.

From `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`: The extension-sensitive finite-flat/peu-ramifiée criterion. Its §§R07.1.26–R07.1.32 and R07.3.4–R07.3.18 supply Raynaud and the small-weight Fontaine–Laffaille comparisons at their stated endpoint restrictions. The genuine weight-p+1 and elliptic weight-two `ℓ=3` applications are constructed in §§3.3 and 6.2 here.

From `NeronModelsAndSemistableAbelianVarieties:§§2.4, 4.1–4.6`: Integral torus character groups, geometric component groups, monodromy exact sequence and contravariant Picard maps, with their coefficient/dual conventions.

From `ModularCurvesPartII:§§7.1–7.2, 11.1`: Igusa curve and Hodge/Serre–Tate/Kodaira–Spencer comparison used by Coleman–Voloch and the weight-two/small-weight bridge, retaining Hecke compatibility and ordinary/unit-root subspaces. Include Gross90 Proposition 8.18 (p. 477), the genuine filtration-p+1 eigensystem realization in the special-fibre differential space used in Proposition 9.3(2); this is distinct from the Hasse weight-two subspace.

From `ModularCurvesPartII:Layers 11–12`: Actual bad-fibre reduction geometry at a prime exactly dividing level. Combine it with the Néron toric/finite filtration to prove the weight-p+1 finite-flat contradiction of §3.3 here.

From `ModularCurvesPartII:Layers 13–14`: Integral finite-free coefficient cohomology, weight-two Jacobian/Tate comparison, full Hecke action including coefficient-prime operators, and Picard duality conventions; no lattice is inferred from a C-subspace. For Buzzard Proposition 2.4 supply the geometric multiplicity inputs at `p=2`: the Mazur–Ribet argument at level 2N with its Eisenstein component group, the finite-flat odd-level argument and the nonsplit unramified Jordan case. The `p≥3` ordinary sequence alone does not supply this dyadic theorem. For Wiese07 Situations I–II (p. 69), supply the ordinary full-Hecke residue sequence `0→T→G[p]→T^∨→0` (Cor. 2.3, pp. 71–72), its m-torsion exactness, and the geometric `Frobenius/T_p` comparison (Thm. 3.1, pp. 72–75). Situation II includes `p=2` on J1(N), `p∤N`; Situation I uses p odd and nontrivial p-diamonds on J1(Np). This is not supplied by the CG18 `p≥3` minimal-twist Tate sequence.

From `ModularCurvesPartII:§§15.1–15.8`: Compact integral Ihara and saturation after non-Eisenstein localisation with the exact `Γ1/Γ0` and coefficient-system hypotheses. Section 2.4 here also establishes the weight-two Jacobian auxiliary level-raising case at odd `ℓ` with pre-existing `ℓ`-power level, used in Ribet §7; do not substitute a tame-level statement or naked `Γ1(q)` injectivity. The compact-Ihara interface has constant coefficients only. Section 1.1 here establishes the extension to the parabolic `Sym^{k−2}` lattices in Ribet94 Theorem 5.1, `2≤k≤ℓ+1`, `ℓ` odd and `ℓ∤M`, with localized freeness, coefficient duality (including the factorial-unit range), adjoint maps, saturation and precise `Γ1`/fine-cover descent. Section 5.5 here constructs the weight-two dyadic `Γ1(M)∩Γ0(q)` auxiliary level-raising input of Buzzard00 p. 105 at `r∤2Mq` with involution `ρ(Frob_r)`, using full Hecke ideals, global multiplicity one, integral degeneracies and preservation of `a₂`. The odd-`ℓ` Theorem 5.1 and distinct-root Iwahori arguments do not supply it.

From `ModularCurvesPartII:§§12.2–12.4`: The integral degeneracy sequences at p,q and the monodromy/component-group Hecke comparisons; preserve finite exceptional support before localization and Tor before residue reduction. Distinguish two geometric contracts: the `Γ0(pqM)` switch in Ribet94 (6.2)–(6.3), and the `Γ1(M)∩Γ0(qr)` false-point switch in Buzzard00 p. 106. In the latter supply `0→Y_q→L_r→X_r→0`, Eisenstein kernel/cokernel of the component-group comparison, localized exactness and Tor control. The character-degeneracy-sequences interface must supply the geometric sequences themselves; generic linear Tor calculus alone does not deliver either sequence.

From `AlgebraicModularFormsAndSerreWeights:R15.1`: Actual Katz/coherent forms on the tame level stack, Hodge bundle and weight-one Hecke module, with the small-level stack/descent comparison.

From `AlgebraicModularFormsAndSerreWeights:R15.2`: q-expansion principle and integral finite coefficient modules. Section 6.8 here constructs the finite-field Steinberg comparison, with its product over all residue embeddings in KW Lemma 8.3.

From `AlgebraicModularFormsAndSerreWeights:R15.3`: Hasse, theta cycles, inverse coefficient Frobenius/V/U and the characteristic-two/three corrections. Its torsion weight-one `T_p=U_p+〈p〉V` comparison has `p≥3`, `N≥5`; §3.14a here constructs the dyadic comparison at `N≥5` from ModularCurvesPartII §9.11 and the small-prime Hasse lifts.

From `AlgebraicModularFormsAndSerreWeights:R15.5`: Use the existing Deligne–Serre finite-free eigenvalue-lifting contract: finite fraction-field extension, a dominating DVR and residue embedding; no unique or preselected integral eigenvector and no claim that the DVR must be finite over O.

From `GL2AutomorphicRepresentationsAndTransfer:R17.3`: Global Jacquet–Langlands with exact discrete-series local components and matching character/coefficients. For Buzzard’s supercuspidal defect, supply the integral congruent-character transfer input (Diamond–Taylor Theorem 9 cited in Buzzard p. 108), not a deduction from rational JL alone.

From `GL2AutomorphicRepresentationsAndTransfer:R17.4`: Solvable automorphic base change with cuspidality preserved by the residual disjointness/image assumptions, local splitting and determinant transport; no compatible-system existence theorem is consumed.

From `GL2AutomorphicRepresentationsAndTransfer:R17.5`: Finite-image dihedral Artin induction and the classical weight-one witness, including oddness and coefficient descent; only the proved dihedral/solvable base case is used for KW I Lemma 6.2(i).

From `GL2AutomorphicRepresentationsAndTransfer:§§R16.0.1, R16.3.1–R16.3.5, R17.6.4`: At `q≠p`, use three separate interfaces: the Artin/Swan conductor defined from ramification groups in ArithmeticGaloisRepresentations Layer 3 (with the Weil–Deligne monodromy term of §3.3); the comparison `c(π) = a(rec π)` for generic irreducible characteristic-zero π in §R16.3.5, where `c(π)` is defined by newvectors; and the inertial type `(rec π)|I_q` from §R16.0.1 (`r16-0-local-langlands`). Section R17.6.4 supplies the actual residual normalization. The conductor and inertial type are independent of ε-factor comparisons. Section R17.6.12 owns the dyadic dihedral weight-one realization. Import its result, not its construction. In §R17.6.12 the supplied statement is: a continuous odd irreducible dihedral `ρ` in characteristic two, unramified at two, has a Katz weight-one witness of tame conductor `N(ρ)` and character `det ρ`. The odd-characteristic dihedral induction and weight-one comparison are §§R17.5.1, R17.5.9. Wiese 2004 Theorem 9, pp. 130–131, gives the all-characteristic formulation.

From `HilbertModularVarietiesAndShimuraCurves:R18.3`: Definite quaternionic `S_{τ,ψ}(U,O)`, finite-free coefficient spaces with the determinant-covariant pairing of Kisin §3.1.9, stabilizer orders prime to p/neatness, full Hecke modules, KWII Lemma 7.7 for p-local compatibility and Lemmas 7.2/7.10 for square-root signs, and the weight-two Lemma 7.1 at p, including `p=2`. Retain its general `q≠p` version; only the weight-two trivial q-action permits q|p. For KW8.2 import §R18.3.24 (`twTwist_commonLiftableImage`) and §R18.3.32 (`ramifiedSign_independentOfEigenform`); unramified eigenroot and coinvariant control uses §R18.3.31 at auxiliary places with `q_v≡1 mod p`, distinct residual Frobenius roots and the stated characteristic-zero local compatibility for every localized constituent. Section R18.3.32 retains the odd-p residual-sign identifiability hypotheses and, at `p=2`, full division level `D_v×` with its fixed central-compatible coefficient character. The additional field change must enlarge p-parts of residue-unit groups beyond the stabilizer exponent (Lemma 7.3), including characters of order divisible by four at `p=2`. Effective neatness alone gives no such field-degree assertion. Square-root/sign control is Lemma 7.2 and Lemma 7.10; Lemma 7.7 instead supplies p-local Langlands–Fontaine compatibility.

From `HilbertModularVarietiesAndShimuraCurves:R18.4`: Residual injection, integral saturation and the geometric degeneracy Gram identity under their exact hypotheses. Extend the application to definite quaternionic modules with Kisin §3.1.9 determinant-covariant coefficient pairing and Corollary 3.1.11’s nonzero support and full-module defect condition. Its definite non-Eisenstein injection uses Kisin 3.1.8/KWII Lemma 7.1; do not substitute an odd-p large-image Shimura-curve Ihara theorem at `p=2`. The existing geometric-gram-identity is for Shimura-curve coefficient cohomology; §6.9 here constructs the separate definite coefficient-space identity with Kisin’s determinant-covariant pairing. Kisin §3.1 assumes `p>2`. For the weight-two `p=2`, `q ∣ p` branch §6.9 here establishes precisely KW7.1 and the integral argument on pp. 76–78, with trivial q-coefficient action when q|p, rather than extending Kisin’s corollary silently.

From `HilbertModularVarietiesAndShimuraCurves:§§R18.5.15–R18.5.18`: The discriminant-pq Shimura curve/Jacobian, integral Hecke action and Čerednik–Drinfeld toric reduction used by the two character-group sequences. Section 5.6 here constructs the false-point `Γ1(M)` discriminant-qr Shimura Jacobian in Buzzard00 p. 106, with full Hecke normalization, integral torus character sequence and component-group support. This is distinct from the `Γ0`-level Ribet specialization.

From `AlgebraicModularFormsAndSerreWeights:R15.5A.2–R15.5A.3, R15.6`: Classical and residual newform representations with the actual coefficient place and trace/determinant comparison. From `HilbertModularVarietiesAndShimuraCurves:§R18.3.29`: The early rank-two quaternionic attachment and its local compatibility at its geometric hypotheses. The A/B/C compatibility specialization of KW Lemma 7.7 is part of §6.6 below, with those field and weight restrictions retained.

From `ModularForms:Layers 8, 8W`: Integral symbol Hecke algebra and number fields for eigenvalues, and the  weight-one q-expansion lattice/Hecke interface in layer 8W. Symbols alone do not supply integral curve cohomology; the weight-one lattice is imported from layer 8W.

From `Chebotarev:Layer 10`: Arithmetic Frobenius Chebotarev in the finite joint representation `(ρ,χ_p)`, positive density and exclusion of finitely many bad primes; the dyadic auxiliary class additionally uses Q(i). Also use the dyadic nontrivial-involution conjugacy class, excluding 2Mq.

From `ClassFieldTheory:Layer 7`: Local Artin normalization, conductor and inertia/unit comparison; scalar odd-order characters of `G_Q2` kill inertia. Global extension of local characters uses the existing global reciprocity layer, specified below.

From `ClassFieldTheory:Layers 11–12`: Global reciprocity and ray-class existence. Use `ArithmeticGaloisDuality:§R02.4.6` for compatible local character prescriptions and their obstructions, and `ArithmeticGaloisDuality:§R02.6.2, Finite-order determinant twists` for KW determinant alignment. Rational one-prime twists in §§2.11 and 4.3 are explicit Dirichlet characters, with no ramification away from that prime.

From `ModularForms:Layer 3`: Import the Petersson pairing, degeneracy maps, fixed-character global old/new theory and the bad-prime trace/adjoint milestones. Layer 2.2 here identifies the quotient relative to just the two level-M degeneracies at Mq; it is not the globally new cuspFormsNew at all level primes. Layer 4.6 here proves the `Γ1(N)∩Γ0(ℓ)` trace specialization `Tr(F)=F+ε(ℓ)^{-1}ℓ^{1−w/2}F|W|U_ℓ` in Ribet’s partial-W convention (Ribet94 Step 4, p. 6). Neither specialization is an explicitly stated target of the supplier.

From `ModularForms:Layer 0`: Import primitive Eisenstein series, character transport, generalized-Bernoulli constant terms, twisted divisor sums and the exceptional-weight corrections. Layer 4.4 here specializes these to G of type `(i,ω^{-i})` and proves the Kummer/von Staudt valuation `v_λ(L(1−i,ω^{-i})/2)<0` needed for `E≡1` (Ribet94 Step 2, author p. 5). Choose `i≥3` in its residue class; if `ω^{-i}` is imprimitive, retain its missing Euler factor instead of substituting the primitive L-value. Layer 4.6 here proves the integral level-one `E_{ℓ−1}≡1` for `ℓ>3` and `E4≡1` at `ℓ=3`. The supplier’s series construction does not itself assert these residual valuation congruences.

From `ModularForms:Layer 2`: Import the Hecke correspondence and the coefficient-extraction formula for `U_ℓ` at bad primes. Layer 4.5 here proves that, for `r>1`, this correspondence maps `(σ^{-1}f)^ℓ` on `Γ0(ℓ^r)∩Γ1(N)` to the preceding `Γ0` depth, with its weight and character (Ribet94 Step 3, p. 5). The same-level `U_ℓ` API alone is not this level-decreasing statement.

From `ModularForms:Layer 6`: Import the partial Atkin–Lehner slash operators and character transport. Layer 4.6 here compares the supplier’s arithmetic normalization to Ribet’s W, proves `W²=ε(ℓ)` and `G|W=ℓ^{w/2}ε(ℓ)G|V_ℓ` for level-N G, and checks multiplication across weights. Its calculation `v_ℓ(g|W)≥1+a/2` for `g=E−ℓ^aE|V_ℓ` belongs to this residual application (Ribet94 Step 4, p. 6), rather than to the supplier’s sign theory.

From `ModularForms:Layer 8G`: Import the Galois stability of normalized newforms and their coefficient fields, together with the degeneracy/newform decomposition from layers 3–5. Layer 4.5 here extends this to the algebraic cusp form used in Ribet94 Step 3 by decomposing it into degeneracy images of newforms and conjugating the algebraic coefficients; it proves independence of this expansion and the resulting conjugate character at the same weight and level. Choose `σ` in the `λ`-decomposition group inducing `a↦a^ℓ`. This characteristic-zero extension is not the supplier’s newform-only statement and is not supplied by a characteristic-p V operator.

### Full odd-characteristic descent and its proof requirement

The general-character descent uses Diamond’s refined Serre theorem, Theorem 1.1, *The refined conjecture of Serre*, Hong Kong proceedings (1995), pp. 22–37, as identified by Wiese 2004 Theorem 10 (odd-characteristic case), pp. 131–132. Ribet’s report supplies the weight-two trivial-character lowering argument; it does not supply the full general-character theorem. Establish the Diamond input with its precise character, conductor-exponent and characteristic-three hypotheses before applying the full conductor-level export. In particular, arbitrary character, higher conductor exponents and characteristic three require this additional proof input. The minimal weight-one, finite-flat weight-two and large-good-prime elliptic exports retain that dependency. The separately stated trivial-character theorem has its own proof.

The general-character, higher-exponent and characteristic-three branches require a proof of Diamond Theorem 1.1 as part of §2.13. Wiese Theorem 10 supplies a public statement and identifies that input; Ribet’s trivial-character argument does not establish those branches.

## How to read the build

Layer 1 establishes integral quotients and the supported eigencharacter needed to descend. Layer 2 removes level-exponent defects away from the coefficient prime, while Layer 3 optimises weight using the actual local restriction and characteristic-p operations. Layer 4 removes coefficient-prime level and fixes character in the ranges where that can be done. Layer 5 treats dyadic optimisation and marks its precise scalar boundary. Layer 6 gives the elliptic and Serre consumer contracts and builds the totally real optimisation used inside Khare–Wintenberger. The dependencies are a graph: the tame-weight theorem uses the coefficient-prime operations, and the dyadic boundary uses the independent scalar local calculation. The end statements always carry the modularity witness they consume.

## Layer 1: Level-changing algebra and cohomology

The integral argument starts with actual geometric coefficient lattices. A characteristic-zero decomposition explains the rational quotient, but residual support depends on its integral index and on a common Hecke eigencharacter. Keep the lattice gluing quotient, the augmented-algebra congruence functor and the residual support test as three separate objects.

<a id="integral-old-new-exact-sequence"></a>

### 1.1 Localised integral degeneracy sequence

Let O be a complete DVR of residue characteristic `ℓ` and `q∤Mℓ`. Let `H_M,H_Mq` be finite free parabolic cuspidal lattices with coefficient system `Sym^{k−2}`, fixed compatible diamond data, and adjoint degeneracy pairing. Under the precise localized integral Ihara and pairing hypotheses, `δ:H_M²→H_Mq` is injective with O-free cokernel Q, giving `0→H_M²→H_Mq→Q→0`. Over `K=Frac(O)`, `Q_K` identifies with the q-new quotient, relative to the two maps from level M. Away-q Hecke actions descend. ModularCurvesPartII §15.7 supplies compact Ihara in the constant-coefficient weight-two branch. Establish here its parabolic `Sym^{k−2}` version for the `2≤k≤ℓ+1` branch of Ribet Theorem 5.1, with the coefficient duality, localised freeness and fine-cover descent specified below. No integral complementary new summand is asserted. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §5, (5.2)–(5.3), author pp. 15–16; §6, author pp. 18–19. Integral degeneracy and its characteristic-zero quotient; injectivity and saturation are the separately imported Ihara input.)

`q∤Mℓ`; actual finite free parabolic lattices, not complex subspaces. Weight two uses ModularCurvesPartII §15.7 with its `Γ1(M)` fine-level or `Γ0(M)` Eisenstein-kernel hypotheses; small levels use the supplied auxiliary fine-level descent. For `2≤k≤ℓ+1`, `ℓ` odd and `ℓ∤M`, require the `Sym^{k−2}` integral Ihara extension, localized freeness and perfect coefficient/diamond duality; these are separate from constant-coefficient Ihara. Apply pairing after localization, with the contragredient character on the dual lattice.

Apply the integral saturation clause of compact Ihara after excluding Eisenstein support. Form the actual cokernel; torsion-free finite O-modules are free. Use adjoint degeneracy over K to compare its quotient with the analytic q-new factor, tracking contragredient diamond action.

*Needs:* `ModularCurvesPartII:§15.7`, `ModularCurvesPartII:§§13.2–13.5, 14.8`, `ModularCurvesPartII:§14.1`, `ModularCurvesPartII:§§14.2–14.3`, `ModularCurvesPartII:§§14.4–14.4a`, `ModularCurvesPartII:§14.11`, `ModularCurvesPartII:§§15.1–15.8`, `ModularForms:Layer 3`.

**Checks.**

- A complex Petersson decomposition alone cannot prove saturation.

- A map multiplying one basis vector by a uniformiser has free source and target but torsion cokernel and fails the Ihara hypothesis.

- Hecke equivariance is stated away from q; `U_q` uses the explicit degeneracy matrix in Layer 2.

<a id="level-change-gluing-module"></a>

### 1.2 Level-change gluing module

For a finite free O-module H with Hecke-stable K-decomposition `H_K=P_K⊕Q_K`, put `P=H∩P_K` and `Q=H∩Q_K` and define `C_level(H;P,Q)=H/(P+Q)`. It is finite O-torsion and records the failure of this particular integral old/new splitting. The same quotient construction makes sense for arbitrary submodules; finiteness requires the stated rational complement hypothesis. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §5, (5.3), author pp. 14–16; §7, author pp. 22–27. The level-specific integral quotient used by the old/new descent argument; the quotient formula is the lattice formulation of this application.)

O a DVR, H finite free, `P_K` and `Q_K` complementary K-subspaces. P and Q are intersections with H, not arbitrary unsaturated images. Hecke stability when a Hecke action on the quotient is claimed.

Take the existing submodule quotient by `P⊔Q`. After tensoring with K the quotient vanishes, so finite generation gives torsion. The zero criterion is `P+Q=H`; no augmentation is inferred from this lattice data.

The gluing object is the existing quotient `H ⧸ (P ⊔ Q)`, with its existing quotient map and instances. Its generic zero, kernel, extensionality, lift, map and transport APIs are the Mathlib declarations listed in the exact supplier contracts; no parallel quotient API is required. The finite-torsion milestone `levelChange_finite_torsion` states that for O a DVR, H finite free and P,Q with complementary localizations at the nonzero elements, `H ⧸ (P ⊔ Q)` is a finitely generated torsion O-module. Saturated intersections give the old/new application; this finite-torsion conclusion holds for any submodules with the displayed complementary localizations. It uses finite generation and vanishing after extension to K, beyond the general quotient interface. The lattice-index comparison `levelChange_index_quotient` identifies `R²/(R(1,0)+R(1,a))` with `R/(a)` over any commutative ring R. A unit a, a uniformiser and `a=0` give respectively zero, a nonzero torsion quotient and a free quotient.

Its applications are [Residual support and eigenvalue descent](#eigensystem-level-descent): Measure which integral comparison can contribute residual support. [Ribet lowering at an unramified prime](#level-lowering-unramified-prime): Keep integral index data through the dimension contradiction.

*Needs:* `Submodule.mkQ`, `ModularCurvesPartII:§§13.2–13.5, 14.8`, [Localised integral degeneracy sequence](#integral-old-new-exact-sequence).

**Checks.**

- In `H=O²`, `P=O(1,0)`, `Q=O(0,1)`, the quotient is zero. `(gluing_split.)`

- For `P=O(1,0)`, `Q=O(1,π)`, both saturated and K-complementary, the quotient is `O/(π)`. `(gluing_index_pi.)`

- For `P=Q=O(1,0)`, the quotient is O and is not torsion; the rational complement hypothesis fails. `(gluing_missing_complement.)`

- Test actual saturated rank-one intersections in `O²`.

- Separate the lattice quotient from the augmented-algebra congruence functor.

- Functorial transport requires an isomorphism carrying both named submodules.

<a id="congruence-module"></a>

### 1.3 Hecke congruence-module application

Construct the codimension-zero augmented-algebra congruence comparison for the Hecke situation. For a finite flat generically étale local O-Hecke algebra A, a chosen augmentation `λ:A→O` with `p=ker λ`, and a finite Hecke module M, use `Ψ_λ(M)=coker(M[p]→(M/pM)_tf)`; `η_λ=λ(Ann_A p)`. Require that `λ` identifies one rank-one generic factor of `A⊗K` with K and that the canonical map `M[ker λ]⊗K→(M/(ker λ)M)⊗K` is an isomorphism. The target before taking the cokernel is a finite torsion-free O-module; under this generic-isomorphism hypothesis the cokernel is finite torsion. The source may contain O-torsion when M does. The algebra ideal `η_λ` is nonzero because `A⊗K` is étale and the chosen factor is K. This roadmap identifies the relevant Hecke module and augmentation in its level-change situation and proves the specialised localisation and pairing comparisons. No isomorphism with `C_level` is asserted without the extra Hecke, eigenline and pairing hypotheses. ([Srikanth B. Iyengar, Chandrashekhar B. Khare and Jeffrey Manning](https://par.nsf.gov/servlets/purl/10585269), §2.2, Proposition 2.10, p. 786; §3.8. Augmented-algebra congruence functor, congruence ideal and its Hecke application.) ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §7, author pp. 22–27. The level-change application, rather than a second definition of generic congruence algebra.)

The chosen eigenform determines `λ` after extending the DVR if necessary. A is finite flat and generically étale; the module map uses its torsion-free quotient. Any comparison to the level-change gluing quotient must specify the eigenline projector and perfect pairing.

Check finite flatness and generic étaleness on the local Hecke algebra using the supplied integral module. Choose the augmentation belonging to the lifted eigenform and apply this augmented comparison. Prove each specialized pairing comparison with all denominators and torsion-free quotients retained. Expose the kernel submodule `M[ker λ]`, the canonical map to the torsion-free quotient, its cokernel `Ψ_λ(M)`, and `η_λ` as an ideal of O. Their API includes invariance under augmented algebra/module isomorphisms, compatibility with localisation that preserves the augmentation and the chosen factor, the generic-vanishing and finite-torsion theorem under the displayed generic-isomorphism hypothesis, and the identification `Ψ_λ(A)≅O/η_λ` for a rank-one generic augmentation. For the comparison `Ψ_λ(M)≅(O/η_λ)^r` require that M is free of rank r over A; a perfect Hecke-equivariant pairing can be used to identify its `λ`-torsion and `λ`-quotient lattices only after its adjoint augmentation and integral duality have been identified. No freeness or self-duality is inferred from the existence of an eigencharacter.

*Needs:* Mathlib module quotients and annihilator ideals, [Level-change gluing module](#level-change-gluing-module), `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- For `A=O`, `λ=id` and `M=O`, `Ψ` vanishes.

- For `A={(a,b)∈O²:a≡b mod π}`, `λ(a,b)=a` and `M=A`, `η=(π)` and `Ψ≅O/(π)`.

- For the same nodal algebra and M=O acted on through λ, the defining map is the identity of O and Ψ_λ(M)=0. If O′ is O with the second-coordinate action, O⊗_A O′≅O/(π) is nonzero, so that tensor product cannot define the congruence functor for arbitrary M.

<a id="eigensystem-level-descent"></a>

### 1.4 Residual support and eigenvalue descent

Let A act on a finite free O-module H and let the lower-level Hecke action factor through A/I. A residual character `φ:A→k` can occur at lower level only if `I⊆ker φ`. Conversely, for the actual lower-level module L, `(L/πL)_m≠0` and a common eigencharacter `φ` in its residue fibre give, after a finite extension of Frac(O) and a dominating DVR with compatible residue embedding, an integral characteristic-zero eigenform with the same good-prime eigenvalues. The geometric level-lowering arguments must establish this support condition; neither unramifiedness alone nor `Ψ=0` supplies it. ([Kenneth A. Ribet and William A. Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §3.6, author pp. 39–40. Descent is factorisation of a residual Hecke character through the lower-level Hecke quotient.) ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §5 and §7, author pp. 13–16, 22–27. Geometric support calculation before eigenvalue lifting.)

A and L finite over O; L is torsion-free and the commuting Hecke operators preserve it. `m=ker φ`, the lower-level action factors through the stated quotient. Deligne–Serre is applied to a nonzero residual eigenvector, without prescribing its integral lift.

Use localisation and Nakayama on `L/πL`, rather than the zero `π`-torsion of the O-free module L. Triangularise the finite commuting residue algebra to obtain a common eigencharacter over a finite residue extension. Apply exactly the supplier’s eigenvalue-lifting contract, and compare Galois representations by good-prime traces.

*Needs:* [Localised integral degeneracy sequence](#integral-old-new-exact-sequence), [Hecke congruence-module application](#congruence-module), `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- The notation H[m] is not used for `π`-torsion in an O-free H.

- If I is not killed by `φ`, lower-level factorisation is impossible.

- Different characteristic-zero lifts may share the same residual character; no uniqueness is claimed.

### Examples

For `H=O²`, `P=O(1,0)`, `Q=O(0,1)`, the two lattices span and `C_level=0`. Replace Q by `O(1,π)`. Both lines are saturated intersections with their rational spans, but the determinant of the two generators is `π`. The quotient is `O/(π)`. Finally take `Q=P`: the quotient is O, so rational complementarity is necessary for the finite-torsion conclusion.

For the augmented-algebra comparison take `A={(a,b)∈O²:a≡b mod π}`, `λ(a,b)=a`. Its kernel consists of `(0,πb)`, whose annihilator consists of `(πa,0)`, so `η_λ=(π)`. With `M=A` the image of `M[ker λ]` in `A/(ker λ)=O` is `πO` and `Ψ_λ(A)=O/(π)`. The numerical agreement with the preceding lattice example does not identify the two constructions for arbitrary Hecke modules.

### Dependencies

The external inputs are `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ModularCurvesPartII:§§13.2–13.5, 14.8`, `ModularCurvesPartII:§§14.4–14.4a`, `ModularCurvesPartII:§§14.2–14.3`, `ModularCurvesPartII:§14.11`, `ModularCurvesPartII:§14.1`, `ModularCurvesPartII:§§15.1–15.8`, `ModularCurvesPartII:§15.7`, `Submodule.mkQ`, `ModularForms:Layer 3`. Their exact contracts are stated above; each target specifies the comparisons it uses.

## Layer 2: Lowering level away from p

Lowering is an induction on conductor-exponent defects. Its easy geometric branch is Mazur's principle; the `q≡1` branch needs the two-prime character-group argument. The auxiliary prime is chosen in the joint cyclotomic/residual quotient, so its congruence and trace hold simultaneously. Principal-series, special and supercuspidal defects are dispatched by their precise local types, with the full general-character proof boundary stated above.

<a id="serre-level"></a>

### 2.1 Prime-to-ℓ conductor interface

Use ArithmeticGaloisRepresentations Layer 3’s prime-to-`ℓ` Artin conductor `N(ρ)=∏_{q≠ℓ}q^{n_q(ρ)}`. For a finite quotient with lower ramification groups `G_i`, `n_q=∑_{i≥0}(|G_i|/|G_0|)codim(V^{G_i})`; the `i≥1` terms are the Swan conductor. For an irreducible residual modular representation at prime-to-`ℓ` level M, `N(ρ)` divides M. Scalar extension does not change N. Apply this conductor and its vanishing tests with the full exponents. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §2, conductor definition preceding Theorem 2.1, author p. 4; §4, Theorem 4.2, author pp. 8–9. Full conductor with wild part and the inequality between residual and automorphic exponents.)

Continuous finite-image representation; `q≠ℓ`. Local compatibility and conductor comparison for the modular witness are supplied by GL2AutomorphicRepresentationsAndTransfer Layer R17.6/ArithmeticGaloisRepresentations Layer 3.

Import the conductor and coefficient-extension invariance. Apply local compatibility prime by prime to obtain divisibility. Retain exact exponents in the lowering induction.

*Needs:* `ArithmeticGaloisRepresentations:§§3.1–3.2`, `ArithmeticGaloisRepresentations:§3.3`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`.

**Checks.**

- Tame nontrivial inertia with one-dimensional fixed space has exponent one.

- A Swan contribution of one and no inertia invariants gives exponent three, not exponent one.

- Unramified away from `ℓ` gives `N=1`; this is distinct from a reduced elliptic level retaining `ℓ`.

<a id="q-new-subspace"></a>

### 2.2 Integral q-new support interface

Using ModularForms layer 3’s pairing and degeneracies, identify the characteristic-zero quotient by the two level-M images with their Petersson-orthogonal complement in `S_k(Γ1(M)∩Γ0(q))`. The characteristic-zero character is pulled back from modulo M, so its q-component is trivial. This relative q-new factor need not be globally new at primes dividing M; the single-prime comparison is the specialization owned here. Under Layer 1’s precise integral hypotheses, q-new residual support means support on its finite free quotient Q. A character on `Q/πQ` lifts to a characteristic-zero q-new eigensystem by the supplied eigenvalue-lifting lemma. Reduction of a complex orthogonal complement alone does not define this support. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §5, (5.3), author pp. 14–16. Old/new support on the integral quotient that enters Diamond’s criterion.)

`q∤Mℓ`, exact integral sequence and pairing from Layer 1. Use a coefficient DVR and the compatible diamond action modulo M, pulled back to the mixed level with trivial q-character in characteristic zero. Localizing at a residual M-character permits its congruent characteristic-zero lifts.

Compare `Q_K` to the relative analytic factor by the adjoint pairing and finite-dimensional orthogonal decomposition, not by the global-new definition. Localise and reduce the actual integral quotient. Apply the finite-free eigenvalue lifting contract only to a nonzero residual support space.

*Needs:* [Localised integral degeneracy sequence](#integral-old-new-exact-sequence), [Residual support and eigenvalue descent](#eigensystem-level-descent), `ModularForms:Layer 3`.

**Checks.**

- A purely old characteristic-zero eigenline need not exclude residual new support at a congruence prime.

- A nonintegral Petersson projector cannot be reduced modulo `π`.

- The q-new witness has good-prime residual traces equal to the original witness.

<a id="auxiliary-prime"></a>

### 2.3 Complex-conjugation auxiliary prime

For odd `ℓ`, an auxiliary prime for `(ρ,N)` is a prime `r∤Nℓ` such that the Frobenius conjugacy class of `(ρ,χ_ℓ)` equals that of complex conjugation. Consequently `r≡−1` mod `ℓ`, tr `ρ(Frob_r)=0` and det `ρ(Frob_r)=−1`. Chebotarev for the joint representation gives infinitely many such r. A prime matching `ρ` alone need not satisfy `r≡−1`. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §7, choice of q preceding (7.1), author pp. 22–23. Auxiliary Frobenius and the congruence `r≡−1` are used together in the level-raising contradiction.)

`ρ` continuous, odd, irreducible over a finite extension of `F_ℓ`; `ℓ` odd. N contains all ramified primes away from `ℓ`; use arithmetic Frobenius.

Form the finite joint Galois quotient of `ρ` and `χ_ℓ`. Apply Chebotarev to the conjugacy class of complex conjugation, excluding finitely many bad primes. Read trace, determinant and cyclotomic congruence from that class.

For an arithmetic Frobenius representative conjugate to complex conjugation, the eigenvalues are 1 and `−1`. This yields trace zero, determinant `−1` and the cyclotomic congruence `r≡−1` mod `ℓ`. The normalisation is a witness for the joint-quotient requirement, not an independent congruence imposed after choosing the prime.

The definition has the following named operations and comparisons, under these hypotheses:

- `complexConjugationAuxiliaryPrime`: The prime/Frobenius condition on the joint representation `(ρ,χ_ℓ)`.

- `complexConjugationAuxiliaryPrime_residue`: `r≡−1` mod `ℓ`.

- `complexConjugationAuxiliaryPrime_trace_det`: Trace zero and determinant `−1`.

- `complexConjugationAuxiliaryPrime_infinite`: There are infinitely many auxiliary primes outside a prescribed finite set.

- `complexConjugationAuxiliaryPrime_ext`: The predicate depends only on the prime, the isomorphism class of the joint representation and its designated conjugation class; no choice of a Frobenius representative matters.

- `complexConjugationAuxiliaryPrime_simp`: A prime dividing `Nℓ` fails the predicate; conjugating either Frobenius matrix leaves it unchanged.

- `complexConjugationAuxiliaryPrime_baseChange`: An injective finite coefficient extension preserves and reflects the joint conjugacy-class condition; identity and composed extensions agree.

- `complexConjugationAuxiliaryPrime_chebotarev`: Its primes are exactly the specified Chebotarev conjugacy-class set away from `Nℓ`. This is a proposition, so there is no quotient or free-object universal property.

- `complexConjugationAuxiliaryPrime_five`: At `ℓ=5` the joint class has matrix diag(1,4) and cyclotomic value 4, yielding trace 0, determinant 4 and `r≡4`.

Its applications are [Ribet lowering at an unramified prime](#level-lowering-unramified-prime): Raise at r and compare the two bad-fibre character sequences.

*Needs:* `ArithmeticGaloisRepresentations:Layer 4`, `Chebotarev:Layer 10`.

**Checks.**

- At `ℓ=5` the conjugation matrix `diag(1,−1)` has trace 0 and determinant 4. `(aux_trace.)`

- A match in the `ρ` quotient without a match in `χ_ℓ` is rejected, even if its trace is zero. `(aux_joint.)`

- A ramified r or r dividing `Nℓ` is rejected even if an accidentally chosen matrix has trace zero. `(aux_bad_prime.)`

- The cyclotomic component is an explicit field of the condition.

- Oddness makes the trace zero and determinant `−1` at complex conjugation.

- The dyadic auxiliary prime of Buzzard has a different condition.

<a id="level-raising-diamond"></a>

### 2.4 Diamond’s level-raising criterion

Let `ℓ≥3`, `2≤k≤ℓ+1`, `ℓ∤N`, and f a normalised eigenform of character ε in `S_k(Γ1(N))` with irreducible residual representation. For `q∤Nℓ`, there is a q-new eigenform in `S_k(Γ1(N)∩Γ0(q))`, with characteristic-zero character pulled back from modulo N and congruent to ε modulo the coefficient prime, and with the same residual good-prime eigensystem, exactly when the residual characteristic polynomial of `ρ(Frob_q)` is `(X−a)(X−qa)` for some a. Equivalently `a_q(f)²≡ε(q)q^{k−2}(q+1)²` modulo the coefficient prime. A coefficient extension and a prime above `ℓ` are part of the conclusion. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Theorem 5.1 and its proof, author pp. 12–16. The odd-characteristic statement of Theorem 5.1, including its small-weight coefficient hypotheses; do not infer an unrestricted coefficient-system Ihara theorem.)

The q-character is trivial in characteristic zero throughout the equivalence; no prescribed characteristic-zero lift of the character modulo N is asserted. All operators, weights and diamond character use the arithmetic normalisation. The integral coefficient cohomology and Ihara input at this weight are supplied by ModularCurvesPartII §15.7 and the coefficient comparison of §1.1 here, with explicit coefficient hypotheses.

Use the degeneracy relation and `η=U_q²−q^{k−2}〈q〉` on the old factor. The imported integral Ihara/saturation input transfers the vanishing determinant into residual new support with the residual N-diamond character. Lift the new eigensystem and translate determinant/trace into the polynomial factorisation.

*Needs:* [Integral q-new support interface](#q-new-subspace), `ModularCurvesPartII:§§15.1–15.8`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- At `k=2`, `ε=1` the criterion becomes `a_q²=(q+1)²`.

- At `q≡−1` mod `ℓ` it becomes trace zero and does not require distinct roots.

- A q with nonzero determinant defect has no congruent q-new witness with trivial q-character.

- For `E:y²+y=x³−x²−10x−20`, `ℓ=7`, `q=29`, the counts at 2 and 29 are 5 and 30, giving `a₂=−2`, `a₂₉=0`. The discriminant at 2 is 3 modulo 7, so irreducibility and oddness give absolute irreducibility. An even order-seven character modulo 29 reduces to one; Ribet Theorem 1.3 gives a congruent form at level 319 with that character, necessarily 29-new. But the quadratic criterion is `0≠4` in `F₇`. This witness lies at full `Γ1(319)` and fails the trivial q-character hypothesis.

<a id="degeneracy-map-and-eta"></a>

### 2.5 Degeneracy matrix and the η operator

For weight two and trivial character, let `δ:J0(N)²→J0(Nq)` be the two degeneracy maps, `q∤N`. On the source, `U_qδ=δU` with `U=[[T_q,q],[-1,0]]`, and put `η=U²−1`. Construct the unique Hecke-equivariant `σ:J0(Nq)→J0(N)²` with `σ∘δ=η`. If δ′ is the pair of norm maps, then `δ′δ=[[q+1,T_q],[T_q,q+1]]` and `σ=[[-1,T_q],[0,-1]]∘δ′`. Thus η annihilates the entire finite kernel of δ. On contravariant torus character groups the matrix is `[[T_q,-1],[q,0]]`. In the general-weight coefficient module the corresponding `η` is `U_q²−q^{k−2}〈q〉`, not `U_q²−1`. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Theorem 6.1, author pp. 17–18; §5, author pp. 13–15. Two degeneracy matrix conventions and the general-weight factor.)

Integral maps, Hecke correspondences and duality conventions from ModularCurvesPartII Layers 13–14. `q∤N`; the Jacobian formula is weight two with trivial character.

Compose the two finite maps with the `U_q` correspondence. Compute the matrix on Picard varieties, then transpose under the character-group functor. Compute σδ from the norm/pullback matrix. Using the component and degeneracy geometry of ModularCurvesPartII §§12.2–12.4, identify the q-new quotient’s reduction at q as toric and that of J0(N) as good. Uniqueness follows because the q-new quotient has no nonzero homomorphism to J0(N)². The same vanishing proves Hecke equivariance. Retain diamond factors for nontrivial coefficients.

Fix the two old-coordinate vectors in the displayed order. The matrix U sends the first to `(T_q,−1)` and the second to (q,0); its characteristic polynomial is `X²−T_q` X+q. Passing to contravariant character groups transposes the off-diagonal entries. This two-vector computation fixes both the sign and the variance. The matrix identity `degeneracy_eta_factorization` holds over any commutative ring; its Jacobian interpretation retains the weight-two and trivial-character hypotheses above. In nontrivial character or higher weight, the central term `q^{k−2}〈q〉` must be restored before taking `η`.

*Needs:* `ModularCurvesPartII:Layers 13–14`, `ModularCurvesPartII:§§12.2–12.4`, [Localised integral degeneracy sequence](#integral-old-new-exact-sequence).

**Checks.**

- At `T_q=0` the two off-diagonal entries retain signs and factors q.

- Contravariant character groups use the transpose convention.

- Setting `k=2` and `ε=1` recovers `η=U²−1`.

- The kernel of δ is finite, so annihilating its connected abelian-variety kernel would be vacuous. Multiplying the two displayed matrices gives `[[T_q²−q−1,qT_q],[-T_q,−q−1]]=U²−1`, which kills the full finite kernel.

<a id="character-group-of-bad-fibre"></a>

### 2.6 Bad-fibre torus character interface

For J0(pqM), p and q distinct primes not dividing M, use NeronModelsAndSemistableAbelianVarieties §§2.4, 4.1–4.6’s character group X*(T) for the toric part of the Néron special fibre. Write `L_p` for that of J0(pqM) at p, `X_p` for that of `J0(pM)²` at p, and `Y_p` for that of the discriminant-pq Shimura Jacobian at p; interchange p,q for the other three groups. All are integral Hecke modules. The functor is contravariant, so a Jacobian degeneracy map gives `L_p→X_p`. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §6, (6.2)–(6.3), author pp. 18–19. Names and variance of the specialized character groups used by the lowering argument.)

Bad-fibre geometry ModularCurvesPartII Layers 11–12/ModularCurvesPartII §§12.2–12.4 and the geometric sequence of §2.7 here, Néron models NeronModelsAndSemistableAbelianVarieties §§2.4, 4.1–4.6, Shimura curves R18.6. The modular and quaternionic Jacobians have the specified semistable reduction; no generic character-group definition is owned here.

Import the toric character functor and identify each geometric fibre. Check the induced Hecke matrices and the ordered primes in each notation. Use the supplied semistable and Čerednik–Drinfeld descriptions to identify Y.

*Needs:* `NeronModelsAndSemistableAbelianVarieties:§§2.4, 4.1–4.6`, `ModularCurvesPartII:§§12.2–12.4`, `HilbertModularVarietiesAndShimuraCurves:§§R18.5.15–R18.5.18`.

**Checks.**

- `X_p` contains two copies, not one.

- `Y_p` belongs to the quaternionic Jacobian, not J0(pM).

- Reversing covariance would reverse the exact-sequence arrows.

<a id="ribet-exact-sequence"></a>

### 2.7 Ribet’s two character-group sequences

With the previous notation there are integral Hecke-compatible exact sequences `0→Y_q→L_p→X_p→0` and `0→Y_p→L_q→X_q→0`. Their good-prime Hecke actions agree with the discriminant-pq quaternionic action; `T_p` and `T_q` on the quaternionic side are involutions. After localisation at the specified non-Eisenstein maximal ideal the finite exceptional geometric terms vanish, and these exact sequences provide the residue-space comparisons in Ribet’s §7. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), (6.2)–(6.3), author pp. 18–19; (7.2)–(7.3), author p. 24. Both sequences with the correct swapped Y subscripts and the localized residue consequences.)

`p≠q`, `p∤M` and `q∤M`; exact integral character modules of the named Jacobians. Non-Eisenstein residual ideal only for subsequent localization and residue statements.

Use the supplied bad-fibre degeneracy sequence and identify its kernel with the opposite-prime Shimura character group. Swap p and q for the second sequence. Localise first; justify any reduction exactness from freeness or the stated vanishing of Tor.

*Needs:* [Bad-fibre torus character interface](#character-group-of-bad-fibre), `ModularCurvesPartII:§§12.2–12.4`, `HilbertModularVarietiesAndShimuraCurves:§§R18.5.15–R18.5.18`.

**Checks.**

- The kernel in `L_p` is `Y_q`, not `Y_p`.

- Integral exactness is not inferred solely from rational Jacquet–Langlands.

- The quaternionic bad-prime Hecke actions square to one.

<a id="monodromy-pairing-component-group"></a>

### 2.8 Monodromy comparison for lowering

On each semistable Jacobian’s torus character lattice, use the imported integral monodromy map `X→X∨`; its finite cokernel is the geometric component group. Degeneracy maps and their adjoints preserve the monodromy comparison with their actual indices. Use §2.5’s map σ and `σ∘δ=η` on abelian varieties; contravariance gives `δ*∘σ*=η*` on `X_p`. On component groups use the corresponding covariant identity, retaining the primed dual Hecke actions in the monodromy diagram. Localising at the residual ideal and using the two character-group sequences gives the length/dimension relations used in Ribet’s contradiction, with Rosati and diamond twists retained. The statement is an application of NeronModelsAndSemistableAbelianVarieties §§2.4, 4.1–4.6, not a second construction of a Néron pairing. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §6, author pp. 19–21; §7, (7.6)–(7.10), author pp. 24–27. Component-group and monodromy calculations in the multiplicity-free odd-characteristic proof.)

The semistable fibres and polarization comparison are supplied. The residue-characteristic torsion and component-group exceptional support are accounted for before reduction.

Identify the finite cokernels using the geometric monodromy theorem. Apply the two exact sequences to compare lengths after localisation. Derive the two inequalities with all factors of two, noting the odd-`ℓ` splitting used in (7.10).

*Needs:* [Degeneracy matrix and the η operator](#degeneracy-map-and-eta), [Ribet’s two character-group sequences](#ribet-exact-sequence), `NeronModelsAndSemistableAbelianVarieties:§§2.4, 4.1–4.6`, `ModularCurvesPartII:§§12.2–12.4`.

**Checks.**

- A finite-index lattice inclusion can contribute nonzero residue torsion.

- The two dimension inequalities are not both valid at `ℓ=2` without an extra input.

- A rational pairing comparison does not discard a component-group factor.

- With `δ*:L_p→X_p` and `σ*:X_p→L_p`, `δ*∘σ*` acts on `X_p`; the reversed composite acts on `L_p` and cannot equal this `η*`.

<a id="mazur-principle"></a>

### 2.9 Mazur’s principle

If `ℓ≥5`, `q∤Mℓ`, an irreducible residual representation occurs at level Mq and is unramified at q, and q≢1 mod `ℓ`, then it occurs at level M in some weight, using the prime-to-`ℓ` character normalisation of Ribet (4.7). The weight-two case with character modulo M also holds for odd `ℓ≥3` as proved in §8. This is the q≢1 branch of lowering, not the theorem covering every removed prime. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), (4.7), author p. 12; Theorem 8.1 and proof, author pp. 27–30. General normalized branch and the independently proved weight-two odd-characteristic branch.)

A modular witness and coefficient prime; `q∤Mℓ`; `ρ` unramified at q. q≢1 mod `ℓ`; the general-weight branch uses `ℓ≥5` and the source’s character convention. The independently proved §8 weight-two branch permits odd `ℓ≥3` and tame character modulo M.

Assume no lower-level support and force residual torsion into the toric part of the bad fibre. Unramifiedness and Frobenius on the torus force `q≡1` mod `ℓ`. Contradict the residue congruence, then apply the lower-level eigenvalue lifting contract.

*Needs:* [Residual support and eigenvalue descent](#eigensystem-level-descent), [Bad-fibre torus character interface](#character-group-of-bad-fibre), `ModularCurvesPartII:Layers 11–12`, [Prime-to-ℓ conductor interface](#serre-level).

**Checks.**

- Reject a ramified residual representation at q.

- The `q≡1` case must route to Ribet’s different argument.

- At `ℓ=3` the assertion is the §8 weight-two branch, with character modulo M, and not arbitrary-weight fixed-character lifting.

<a id="level-lowering-unramified-prime"></a>

### 2.10 Ribet lowering at an unramified prime

For `ℓ≥3`, `q∤Mℓ`, and an irreducible residual representation arising from a weight-two eigenform on `Γ0(Mq)`, if `ρ` is unramified at q then a weight-two eigenform on `Γ0(M)` has the same residual representation at a suitable coefficient prime. M may contain powers of `ℓ`. There is no q≢1 or residual multiplicity-one hypothesis; trivial nebentypus and weight two are essential to this stated branch. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Theorem 1.5, author p. 3; proof §7, author pp. 22–27. The full weight-two `Γ0` statement and the dimension contradiction that removes multiplicity one.)

`ℓ` odd, `q∤Mℓ`, irreducible residual representation, unramified at q. Weight two, trivial character, actual integral Jacobian modules.

Choose the joint complex-conjugation auxiliary prime r and raise there using the weight-two branch of Theorem 5.1; when M contains `ℓ`-power level use the separate weight-two Jacobian level-raising argument invoked in §7, not the tame-level general-weight cohomology statement. Localise both bad-fibre sequences at the common residual ideal and assume no descent at q. Compare monodromy/component lengths to obtain `2μ≤λ` and `2λ≤2μ` for positive `λ,μ`; odd-`ℓ` splitting supplies the second inequality. Conclude lower-level support and lift its eigenvalues.

*Needs:* [Complex-conjugation auxiliary prime](#auxiliary-prime), [Diamond’s level-raising criterion](#level-raising-diamond), [Ribet’s two character-group sequences](#ribet-exact-sequence), [Monodromy comparison for lowering](#monodromy-pairing-component-group), [Residual support and eigenvalue descent](#eigensystem-level-descent), `ModularCurvesPartII:§§15.1–15.8`.

**Checks.**

- The proof records precisely where odd characteristic is needed.

- The coefficient field may enlarge.

- Do not claim this theorem alone treats arbitrary nebentypus or higher conductor defects.

<a id="twist-away-ramified-character"></a>

### 2.11 Removing a residually trivial special twist

In the special local case at `q≠ℓ`, suppose `π_q=St⊗α` with `α` ramified of `ℓ`-power order and hence residual `α` trivial. A global finite-order character agreeing with `α^{-1}` on q-inertia and unramified at the other controlled primes twists the witness to the same residual representation, removes this ramified twist and reduces its q-level exponent from two to one. The availability and other local conductors of the global character are checked, rather than inferred from local twisting alone. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), (4.5), author pp. 10–11. Special ramified-character case; normalization can make the branch vacuous.)

Special local component with the indicated tame residually trivial character. Under arithmetic local reciprocity, write `α|I_q=ω_q^i` for the Teichmüller character of `(Z/qZ)×`. Take the global Dirichlet character `φ=ω_q^{−i}`, of conductor q and ℓ-power order. It is unramified at every other finite prime; no extra auxiliary ramification enters the lowering induction. For odd `ℓ` with prime-to-`ℓ` normalized nebentypus this ramified `ℓ-primary` case is empty.

Use the local special conductor formula. Use this explicit inverse inertial Dirichlet character, with the conductor/unit comparison of ClassFieldTheory Layer 7. Reduction of the twisting character is trivial, so good-prime residual traces are unchanged.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `ArithmeticGaloisRepresentations:Layer 3`, `ClassFieldTheory:Layer 7`, `ClassFieldTheory:Layers 11–12`.

**Checks.**

- A twist of order prime to `ℓ` generally changes the residual representation.

- The endpoint is special of exponent one, not automatically exponent zero.

- The explicit conductor-q character is unramified at every other finite prime, so the induction introduces no new ramified prime.

<a id="principal-series-conductor-defect"></a>

### 2.12 Principal-series conductor defect

For `q≠ℓ`, let a characteristic-zero modular witness of weight `k≥2` have a principal-series local component whose residual conductor exponent is smaller. Carayol–Livné’s defect classification identifies a tamely ramified character with trivial residual restriction. Character replacement and a controlled global twist remove this factor; a remaining unramified-special component is routed to the one-prime lowering theorem. More generally the conductor drop is the change in the inertia-fixed-space codimension: the wild Swan contribution does not change under residual reduction at `q≠ℓ`. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §4, (4.2)–(4.4), author pp. 8–11. Conductor defect and principal-series reduction after character normalization.)

Local compatibility and the defect classification imported from R17.6. Compare the same stable lattice; residual representation is globally irreducible. Fixed-weight character replacement requires `ℓ≥5` and `2≤k`; the other characteristic branches retain their separate inputs. All residue-trivial characters and global twists are tracked at the actual coefficient prime.

Separate the invariant-dimension defect from the common wild term. Dispatch one or two ramified principal-series characters by character replacement or twisting. Reapply the special unramified lowering step only once its hypotheses hold.

*Needs:* `ArithmeticGaloisRepresentations:§3.6`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, [Removing a residually trivial special twist](#twist-away-ramified-character), [Congruent nebentypus at fixed level](#nebentypus-congruent-character).

**Checks.**

- A conductor exponent three is retained when one of its contributions is wild.

- A reduction which changes nebentypus is checked at the coefficient prime.

- The `ℓ=3` general-character case is not proved by the `ℓ≥5` character theorem.

<a id="descend-to-serre-level"></a>

### 2.13 Conditional descent to the full Serre level

For every odd prime `ℓ` and every continuous odd irreducible already modular `ρ:G_Q→GL2(F̄_ℓ)`, there is a modular witness of prime-to-`ℓ` level exactly `N(ρ)`, with some weight. Once weight optimisation has been applied the witness has Serre weight as well. For `ℓ≥5` its character can be chosen as the canonical prime-to-`ℓ` lift of det `ρ·χ_ℓ^{1−k}`. At `ℓ=3` no unconditional prescribed characteristic-zero nebentypus is claimed. The descent removes exponent defects to the full conductor, including nonsquarefree conductors. ([Gabor Wiese](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Theorem 10 (odd-characteristic case) and proof, pp. 131–132. A precise restatement of the full odd-characteristic level/weight result, explicitly citing Diamond Theorem 1.1 for level.) ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §4 and §7, author pp. 8–11, 22–27. The proved local cases and weight-two core; these are not misrepresented as the entire general-character proof.)

Already modular; conductor and weight recipe imported. The general-character argument requires Diamond 1995 Theorem 1.1, with the low-characteristic and nonsquarefree hypotheses retained; the weight-two trivial-character argument alone is insufficient.

Remove coefficient-prime powers using Layer 4. Compare each local exponent to `n_q(ρ)`, dispatching principal-series, special and supercuspidal defect cases. In every lowering step ensure the resulting exponent remains at least `n_q` and decreases the sum of excess exponents. Apply Diamond’s full general-character theorem in the cases beyond the weight-two trivial-character core; then apply weight optimisation.

*Needs:* [Prime-to-ℓ conductor interface](#serre-level), [Mazur’s principle](#mazur-principle), [Ribet lowering at an unramified prime](#level-lowering-unramified-prime), [Principal-series conductor defect](#principal-series-conductor-defect), [Stripping coefficient-prime powers from level](#strip-ell-power-from-level), [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem).

**Checks.**

- A level `q³` with `n_q=2` ends at `q²`, not q.

- The proof contains a conductor-divisibility lower bound and a strictly decreasing integer measure.

- The general-character proof requires its separate Diamond input; the final Serre modularity theorem is not a proof input.

### Examples

Suppose a local two-dimensional representation at `q≠ℓ` has no inertia-fixed vectors and Swan contribution one. Its Artin exponent is `2+1=3`, so the global conductor contains `q³`. An optimisation replacing it by q or erasing q would fail the conductor interface. If inertia instead acts tamely with a one-dimensional fixed space, the exponent is one. Vanishing of the full exponent is the unramified case used in the one-prime lowering theorem.

For the auxiliary class at odd `ℓ`, the eigenvalues 1 and `−1` give trace zero and `r≡−1` modulo `ℓ`. The raising criterion at weight two and trivial character is then satisfied with roots 1 and r. At `ℓ=2` this trace becomes zero for a different reason and does not serve as Buzzard's trace-nonzero auxiliary class.

### Dependencies

The external inputs are `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ArithmeticGaloisRepresentations:Layer 3`, `ArithmeticGaloisRepresentations:§§3.1–3.2`, `ArithmeticGaloisRepresentations:§3.3`, `ArithmeticGaloisRepresentations:§3.6`, `ArithmeticGaloisRepresentations:Layer 4`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `HilbertModularVarietiesAndShimuraCurves:§§R18.5.15–R18.5.18`, `ModularCurvesPartII:Layers 11–12`, `ModularCurvesPartII:Layers 13–14`, `ModularCurvesPartII:§§15.1–15.8`, `ModularCurvesPartII:§§12.2–12.4`, `NeronModelsAndSemistableAbelianVarieties:§§2.4, 4.1–4.6`, `Chebotarev:Layer 10`, `ClassFieldTheory:Layers 11–12`, `ClassFieldTheory:Layer 7`, `ModularForms:Layer 3`. Their exact contracts are stated above; each target specifies the comparisons it uses.

## Layer 3: Weight optimisation at p

Weight optimisation uses more than the inertial semisimplification. Ordinary extension classes distinguish finite-flat and weight-p+1 cases, while equal-character and distinct-character companions have different consequences. The weight-one applications keep coherent forms, full and anemic Hecke ideals, and Jacobian multiplicities separate. The general weight recipe and its operations are supplied by AlgebraicModularFormsAndSerreWeights; these targets prove the realisations and comparisons needed by the consumers.

<a id="local-form-of-ordinary-eigenforms"></a>

### 3.1 Ordinary residual local form

Let `p∤N` and f be a Katz cuspidal eigenform of weight `2≤k≤p+1` and character `ε`, with `a_p≠0`. With arithmetic Frobenius and `λ(u)(Frob_p)=u`, its local residual representation has a stable line and shape `[[χ_p^{k−1}λ(ε(p)/a_p), *],[0,λ(a_p)]]`. The extension is retained; the theorem does not identify this representation with its semisimplification or make tame ramification automatic. ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 2.5, author p. 5. Ordinary shape including the extension and the `ε/a_p` quotient.) ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Propositions 12.8–12.9, pp. 490–493. The local-form proof, with the Picard/dual normalization translated to arithmetic Frobenius.)

All Hecke normalisations are the q-expansion normalisation T*_q used by Edixhoven. Finite coefficient extension contains all eigenvalues; `ρ_f` is the actual local restriction.

Realise the eigensystem in the supplied ordinary p-divisible group. Identify the connected and étale characters with the Hecke eigenvalues. Transport the normalization to the arithmetic residual representation, preserving the extension.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `AlgebraicModularFormsAndSerreWeights:R15.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

**Checks.**

- Determinant is `εχ_p^{k−1}`.

- Changing the extension class can change Serre weight while preserving both diagonal characters.

- `a_p=0` is excluded and goes to the supersingular branch.

<a id="local-form-of-supersingular-eigenforms"></a>

### 3.2 Supersingular residual local form

Under the same tame-level hypothesis, if `2≤k≤p+1` and `a_p=0`, the local representation is irreducible and its inertial semisimplification is `ψ_2^{k−1}⊕ψ_2^{p(k−1)}`, where `ψ_2` is a niveau-two fundamental character. The recipe and twisting of these characters are imported from R15.4. A form of filtration p+1 cannot supply this `a_p=0` branch; a Hasse multiple must be treated at its true filtration. ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 2.6, author p. 6; proof §6, author pp. 20–22; Proposition 3.3, author pp. 7–9. Irreducible local branch and the filtration exclusion at p+1.)

`p∤N`, Katz eigenform, `a_p=0`; local irreducibility is the conclusion. Weight and filtration are kept distinct.

Use the supplied finite-flat/Fontaine–Laffaille comparison in the small-weight range. Identify the two niveau-two characters and descend their conjugate pair. Apply the imported filtration result to the boundary weight.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4, Tame inertia alternatives`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

**Checks.**

- The product of the two inertial characters is `χ_p^{k−1}`.

- Do not replace the niveau-two pair by two niveau-one characters.

- A weight-p+1 Hasse multiple has the same q-expansion but can have smaller filtration.

<a id="weight-p-plus-one-and-finiteness"></a>

### 3.3 Weight p+1 and finite-flatness

If an irreducible Katz eigensystem at `p∤N` has weight p+1 and is not the Hasse multiple of a weight-two form of the same type, then `a_p²=ε(p)` and its local representation is not finite flat over `Z_p`. Equivalently, the finite-flat branch at this filtration is detected by passage to weight two. Finite-flat means the given local finite Galois module extends to a finite flat `Z_p-group` scheme, not merely that its image is finite. ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 2.8, author pp. 6–7; proof §8, author pp. 26–28. Mazur’s p+1 boundary and the explicit `p=2` adaptation.)

Actual weight-p+1 filtration condition, irreducible representation, `p∤N`. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 and AlgebraicModularFormsAndSerreWeights Layer R15.4 supply the finite-flat/peu-ramifiée equivalence.

Use the geometric weight-two/weight-p+1 sequence to identify the non-Hasse eigensystem in toric support. Compute its `U_p` eigenvalue relation. A finite-flat extension would force incompatible connected/étale support, giving the contradiction.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4, The weight-two criterion`, `AlgebraicModularFormsAndSerreWeights:R15.3, The elliptic Hasse invariant`, `ModularCurvesPartII:Layers 11–12`.

**Checks.**

- At `p=2` the two weights are 2 and 3, while classical even Serre weight can be 4.

- Every residual representation has finite image; this alone is not the finite-flat criterion.

- The Hasse multiple of a finite-flat weight-two form is excluded from the nonfinite conclusion.

<a id="weight-one-forms-unramified-at-p"></a>

### 3.4 Weight-one unramifiedness

For `p>2`, a Katz cuspidal eigenform g of weight one and level N prime to p has unramified `ρ_g` at p, with arithmetic Frobenius characteristic polynomial `X²−a_p(g)X+ε(p)`, including repeated roots and scalar Frobenius. At `p=2` the assertion here is proved for distinct Frobenius roots, and for forms admitting a characteristic-zero weight-one lift; it does not claim the general nonliftable scalar dyadic Katz case. ([Robert F. Coleman and José Felipe Voloch](https://www.math.canterbury.ac.nz/~f.voloch/Pdfs/comp2.pdf), Corollary 0.2, author p. 3; proof end of §6, author pp. 24–25. The complete `p>2` result including repeated roots.) ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition 2.7, author p. 6. Distinct-root or characteristic-zero-lift branches, including `p=2`).

Weight one is Katz/coherent weight one; it need not lift to characteristic zero. For the full `p>2` result use Coleman–Voloch Corollary 0.2. The `p=2` distinct-root and liftable branches retain their explicit extra hypotheses.

Embed the doubled weight-one q-expansion system into weight p with Hasse and V. Apply the `p>2` companion result to show local tameness, including the equal-root branch. Read the trace/determinant from `T_p` and the diamond action; use the classical weight-one representation for a liftable dyadic form.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.1`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, [Coleman–Voloch companion theorem](#companion-forms), `AlgebraicModularFormsAndSerreWeights:R15.3, Coefficient-linear U and V`.

**Checks.**

- Repeated characteristic-polynomial roots do not by themselves distinguish a scalar matrix from a Jordan block.

- A general `p=2` scalar nonliftable form is outside the cited proof.

- Arithmetic Frobenius, rather than its inverse in Picard cohomology, appears in the stated polynomial.

<a id="companion-forms"></a>

### 3.5 Coleman–Voloch companion theorem

For `p>2`, `p∤N` and an ordinary Katz cuspidal eigenform f of weight `2<k≤p`, its representation is tamely ramified at p exactly when there is a cuspidal companion g of weight `k′=p+1−k` and the same character, with `a_q(f)=q^{k−1}a_q(g)` for `q≠p`. Thus `ρ_f≅χ_p^{k−1}⊗ρ_g`. At `k=p` this theorem includes equal unramified characters, where tameness does not imply that the local extension splits. The two-sided theorem stated here deliberately uses Coleman–Voloch’s proved range; Gross’s reverse implication at `k=2` and at `p=2` is not asserted without its compatibility input. ([Robert F. Coleman and José Felipe Voloch](https://www.math.canterbury.ac.nz/~f.voloch/Pdfs/comp2.pdf), Theorem 0.1, author pp. 1–3; proof §6, author pp. 21–25. The stronger proved `p>2` range, including the previously excluded equal-character `k=p` case.) ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Theorem 13.10, pp. 498–499; introduction pp. 445–446. Historical narrower result and its compatibility caveat; the compatibility-dependent reverse implication is not consumed.)

`a_p(f)≠0`, `2<k≤p`, `p>2`, tame level and actual Katz forms. The companion relation is on good-prime Hecke eigenvalues; `T_p` values need their separate ordinary normalization.

Use the Igusa/Serre–Tate comparison and Kodaira–Spencer pairing supplied by ModularCurvesPartII §§7.1–7.2, 11.1/FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5. Identify vanishing of the unit-root cohomology obstruction with tame local ramification. Solve the theta companion equation and identify the good-prime eigensystem, then reverse the obstruction calculation.

The companion weight k′ satisfies `(k′−1)+(k−1)=p−1`. Twisting its determinant by `χ_p^{2(k−1)}` therefore gives `εχ_p^{k−1}`, as required for f. At `k=p` both inertial characters are trivial and a tame unramified extension can be nonsplit. At `2≤k<p` their distinct inertial characters force a tame extension to split, giving the one-way criterion in the next subsection.

*Needs:* [Ordinary residual local form](#local-form-of-ordinary-eigenforms), `AlgebraicModularFormsAndSerreWeights:R15.3, Theta and filtration`, `ModularCurvesPartII:§§7.1–7.2, 11.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

**Checks.**

- At `p=107`, `k=26` the companion has weight 82.

- At `k=p` the companion has weight one, even in the equal-character tame branch.

- A nontrivial unramified extension of equal characters is tame and need not be split.

<a id="companion-forces-local-splitting"></a>

### 3.6 Companion criterion for ordinary splitting

For `p>2`, `2≤k<p`, `p∤N`, and ordinary f, a Katz companion of weight `p+1−k` with the good-prime relation in [Coleman–Voloch companion theorem](#companion-forms) forces `ρ_f|G_Qp` to be the direct sum `χ_p^{k−1}λ(ε(p)/a_p)⊕λ(a_p)`. This one-way criterion includes `k=2`. The two diagonal inertia characters differ in this range, so tame ramification gives actual local splitting. The `k=p` equal-character case is excluded. ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Proposition 13.8, pp. 497–498. The proved easy direction and its `k=p` qualification.) ([George Boxer, Frank Calegari and Toby Gee](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf), §2.3, proof of Theorem 2.4, printed p. 515. Application to the weight-26 form at 107; Theorem 2.4 itself is a downstream higher-rank automorphic result.)

Ordinary form and actual companion; this is a sufficient criterion, not Gross’s converse requiring its compatibility input. `2≤k<p` ensures different inertia characters.

Use both ordinary triangular descriptions related by the companion twist. Their distinct inertia characters force complementary stable lines. Identify the unramified characters from `T_p` and determinant.

For the application in Boxer–Calegari–Gee, use `f=ΔE₄²E₆` of weight 26 at `p=107`. Its `a₁₀₇` is `−1` modulo 107, and the companion has weight `108−26=82`. Gross's Proposition 13.8 gives local splitting since `26<107`. Boxer–Calegari–Gee's arithmetic translation is `ρ_f=χ₁₀₇²⁵ρ_g`; their cohomological normalization writes the inverse cyclotomic twist. Their Theorem 2.4 itself constructs higher-rank automorphic representations, so its statement is not relabelled as a companion theorem.

*Needs:* [Ordinary residual local form](#local-form-of-ordinary-eigenforms), [Coleman–Voloch companion theorem](#companion-forms).

**Checks.**

- The weight-26/weight-82 pair at `p=107` gives the split local residual representation used downstream.

- A weight-p pair with equal unramified characters cannot be certified by this argument.

- The claim uses an existing companion, not a converse existence theorem.

<a id="edixhoven-weight-theorem"></a>

### 3.7 Edixhoven’s conditional weight optimisation

Let `ρ` be continuous odd irreducible and already represented by a Katz eigenform of tame level N, `p∤N`. Then it occurs at that same N in classical Serre weight `k(ρ)`. Its least Katz weight is the imported Edixhoven weight `k_ρ` when `ρ` is not exceptional; for `p>2` Coleman–Voloch removes the exceptional restriction. For unramified `ρ_p` and `p>2` one has `k_ρ=1` while the classical convention has `k(ρ)=p`. The exceptional scalar dyadic minimum-one assertion is not part of this theorem. ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Remark 4.4, author p. 10, and Theorem 4.5, author pp. 11–12; introductory Coleman–Voloch update, author pp. 2–3. Classical Serre-weight existence, minimum Katz weight, and the precise exceptional self-extension definition.) ([Robert F. Coleman and José Felipe Voloch](https://www.math.canterbury.ac.nz/~f.voloch/Pdfs/comp2.pdf), Theorem 0.1 and Corollary 0.2, author pp. 1–3, 21–25. Removal of the `p>2` exceptional restriction.)

A modular witness at tame level; no modularity is proved here. Import the extension-sensitive weight recipe, theta/Hasse operations and small-characteristic tables from AlgebraicModularFormsAndSerreWeights Layer R15.3–R15.4. Edixhoven Remark 4.4 calls a local representation exceptional when it is an extension of an unramified character by the same unramified character. The extension can be ramified or unramified and need not be split. For `p>2` the Coleman–Voloch update removes this restriction; no general dyadic exceptional minimum-Katz-weight assertion is inferred.

Reduce filtration using AlgebraicModularFormsAndSerreWeights’s theta-cycle and Hasse interfaces while retaining the actual residual twist. Read the local ordinary/supersingular characters and extension to choose the imported recipe branch. For unramified `p>2` representations use companions to reach weight one; recover classical weight p with the Hasse invariant. For minimality compare every candidate small weight against the local characters, nonfinite p+1 extension and twist normalization; keep the dyadic scalar Katz exception.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4, Edixhoven and classical weights`, `AlgebraicModularFormsAndSerreWeights:R15.3, Theta cycles`, [Ordinary residual local form](#local-form-of-ordinary-eigenforms), [Supersingular residual local form](#local-form-of-supersingular-eigenforms), [Weight p+1 and finite-flatness](#weight-p-plus-one-and-finiteness), [Coleman–Voloch companion theorem](#companion-forms), [Weight-one unramifiedness](#weight-one-forms-unramified-at-p).

**Checks.**

- Do not identify classical `k=p` with minimum Katz weight one.

- The très-ramifiée extension can give `k=p+1` with the same semisimple inertia as `k=2`.

- `p=2` nonfinite gives classical even weight four; the weight-three lift can have a 2-primary character.

<a id="ribet-twist-to-small-weight"></a>

### 3.8 Twisting to small weight

For an already modular residual representation in characteristic `ℓ≥3`, some cyclotomic twist `χ_ℓ^iρ` occurs in weight k with `2≤k≤ℓ+1` and prime-to-`ℓ` level. Untwisting preserves its prime-to-`ℓ` conductor because `χ_ℓ` is unramified away from `ℓ`, but the Serre weight must be recomputed using the imported twisting recipe. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Corollary 3.2, author p. 8. A small-weight modular twist, not a weight-preserving operation on `ρ` itself.)

Modularity witness and the coefficient-prime stripping theorem. Track the twist exponent modulo `ℓ−1` and all good-prime eigenvalues.

Strip coefficient-prime level. Apply the imported theta weight-reduction cycle. Record the cyclotomic twist and compare conductor at every `q≠ℓ`.

*Needs:* [Stripping coefficient-prime powers from level](#strip-ell-power-from-level), `AlgebraicModularFormsAndSerreWeights:R15.3, Weight reduction to at most p+1`, `AlgebraicModularFormsAndSerreWeights:R15.4, Invariance and renormalized twists`.

**Checks.**

- A twist can change `a_q` by `q^i`.

- The prime-to-`ℓ` level is preserved, not necessarily the local weight at `ℓ`.

- Small weights include the boundary `ℓ+1`.

<a id="ribet-four-level-sets"></a>

### 3.9 Ribet’s four sets of levels

For `ℓ≥5` and an odd irreducible modular `ρ`, the following sets of positive integers N prime to `ℓ` agree: occurrence in `S_{k(ρ)}(Γ1(N))`; occurrence in some weight at level N; occurrence in some weight at a level `Nℓ^a`; and occurrence in weight two at level `Nℓ²`. This is equality of occurrence sets, with coefficient extensions and changed characters allowed, not a bijection of forms or a common choice of lift. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Theorem 3.3 and proof, author p. 8. The four occurrences and the characteristic restriction; twisting of level imported with its local conductor bound.)

`ℓ≥5`; original `ρ`, not an unrecorded cyclotomic twist. The conductor condition is prime-to-`ℓ` N.

Two implications are inclusions by level raising. Strip `ℓ-powers` and optimise the original weight for the reverse prime-to-`ℓ` implications. Twist to small weight, use the `weight-two-at-Nℓ` result and undo the twist at cost at most `ℓ²`, using the local conductor bound from R17.6.

*Needs:* [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem), [Stripping coefficient-prime powers from level](#strip-ell-power-from-level), [Weight two at level Nℓ](#weight-two-at-level-n-ell), [Twisting to small weight](#ribet-twist-to-small-weight).

**Checks.**

- No equality of the characteristic-zero nebentypus of the four witnesses is claimed.

- The equality is not asserted at `ℓ=2` or 3.

- The fourth set uses `Nℓ²`, not always `Nℓ`.

<a id="gross-ordinary-tate-sequence"></a>

### 3.10 Ordinary connected and étale Tate sequence

In CG18’s weight-two Jacobian J1(N*) at the residual ideal m, with `p≥3`, local ordinary p-divisible group G and full Hecke algebra `T_m`, there is a `T_m-stable` exact sequence `0→T_pG⁰→T_pG→T_pGᵉ→0`. In the Picard/Hecke normalization used in CG18, `T_pG⁰` is free of rank one over `T_m` and `T_pGᵉ≅Hom_Zp(T_pG⁰,Z_p)`. This does not assert that `T_pG` is free of rank two over `T_m`, nor that `T_m` is Gorenstein. ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Propositions 12.9–12.10, pp. 492–493. Ordinary p-divisible group and Hecke action.) ([Frank Calegari and David Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), Proof of Theorem 4.8, author pp. 65–66. The exact Tate sequence, rank-one connected part and `Z_p-dual` étale part in the consumer’s normalization.)

CG18 §4.1 hypotheses: `ρ` absolutely irreducible, minimal conductor among twists; `p≥3`; `N*=N` if `k(ρ)=2` and Np otherwise. Full Hecke algebra includes `T_p`; ordinary local factor and the Picard duality convention are fixed.

Take the ordinary connected–étale decomposition from the supplied p-divisible theory. Identify the connected Tate module through q-expansion duality. Use the Jacobian pairing to identify its `Z_p-dual`, rather than infer a free `T_m-dual`.

Ordinarity is a hypothesis of this sequence, including when the source first reduces its argument to the scalar unramified ordinary branch. The dual `Hom_Zp(T_pG⁰,Z_p)` need not be free of rank one over `T_m`. A rank-two free `T_m-module` conclusion would impose a self-duality/Gorenstein input absent here. The ramified nonordinary multiplicity-one branch uses the imported geometric multiplicity result instead of this ordinary sequence.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.1.7–R07.1.9`, `ModularCurvesPartII:§§13.5, 14.13–14.15`, [Ordinary residual local form](#local-form-of-ordinary-eigenforms).

**Checks.**

- For non-Gorenstein `T_m` its `Z_p-dual` need not be free rank one over `T_m`.

- The connected/étale distinction is not changed by dropping the Picard twist.

- The full middle Tate module is not assumed to split as a `T_m-module`.

<a id="known-multiplicity-one"></a>

### 3.11 Known nonexceptional multiplicity one

Under CG18 §4.1’s `p≥3` minimal-among-twists setup and full Hecke algebra on J1(N*), if `ρ` is ramified at p, or is unramified with nonscalar arithmetic Frobenius, the residual representation occurs with multiplicity one in J1(N*)[m]. Equal polynomial roots with a nontrivial Jordan block count as nonscalar. This is the known nonexceptional branch; CG18’s scalar upper bound is an input of GL2ModularityLiftingDefectOne. ([Frank Calegari and David Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), Theorem 4.8 and Remark 4.9, author p. 65. The known nonexceptional branch separated from the new scalar upper bound.) ([Gabor Wiese](https://msp.org/ant/2007/1-1/ant-v1-n1-p04-p.pdf), Lemma 4.3, p. 77; Theorem 4.4, pp. 77–78; Corollary 4.5, pp. 78–79. Nonscalar Frobenius and multiplicity in the full Hecke factor.)

`p≥3`, `2≤k(ρ)≤p+1`, absolute irreducibility and minimality of conductor among twists. `N*=N` when `k=2`, Np otherwise; T contains all Hecke operators including p.

Use the geometric multiplicity-one results on the ramified branch. On the unramified branch use the weight-one realisation and ordinary connected/étale argument. Normalize the residual multiplicity through the Picard representation and the full Hecke ideal.

*Needs:* [Ordinary connected and étale Tate sequence](#gross-ordinary-tate-sequence), `ModularCurvesPartII:§§13.5, 14.13–14.15`, [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem).

**Checks.**

- An anemic ideal omitting `T_p` can have a different multiplicity.

- Nonscalar is a matrix property, not a discriminant-nonzero test.

- Minimality among twists is part of the statement.

<a id="scalar-multiplicity-at-least-two"></a>

### 3.12 Scalar Frobenius has multiplicity at least two

Assume Wiese’s Situation I (p odd, J1(Np), ordinary full ideal with nontrivial p-diamond character) or Situation II (any p, J1(N), ordinary full ideal), with `p∤N` and absolutely irreducible `ρ_m`. Assume explicitly that `ρ_m` is unramified at p and Frobenius is scalar. At `p=2` also supply an actual Katz weight-one cusp form of tame level N giving `ρ_m`. Then its full-factor multiplicity r is at least two, and `r=(dim_k T[m]+1)/2` for the residual localized full Hecke algebra T. This is a lower bound, not CG18’s scalar upper bound. ([Gabor Wiese](https://msp.org/ant/2007/1-1/ant-v1-n1-p04-p.pdf), Situations I–II, p. 69; Corollary 2.3, pp. 71–72; Theorem 3.1, pp. 72–75; Corollary 4.2, p. 77; Corollary 4.5, pp. 78–79. Multiplicity formula and scalar lower bound, with the `p=2` existence assumption.) ([Frank Calegari and David Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), Remark 4.9, author p. 65. Explicit separation of Wiese’s lower bound from CG18’s new upper bound.)

Precisely Wiese Situation I or II, printed p. 69; residue field extended to contain the required characters. Unramifiedness and scalar arithmetic Frobenius are hypotheses on the actual local representation; weight-one existence at `p=2` is an additional hypothesis. Use Wiese’s Picard/dual normalization and the full ideal m, distinct from its away-p contraction m′.

Use the connected/étale residue exact sequence to compute `2r=dim_k T[m]+1`. Wiese’s equivalence excludes multiplicity one when Frobenius is scalar. Positive integral multiplicity then gives `r≥2`.

*Needs:* `ModularCurvesPartII:§§13.5, 14.13–14.15`, `ModularCurvesPartII:Layers 13–14`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.1.7–R07.1.9`.

**Checks.**

- A full-factor socle of dimension three gives multiplicity two.

- The `p=2` claim cannot be applied without a Katz weight-one witness.

- Equal roots with a Jordan block are not scalar and are outside this lower-bound branch.

<a id="minimal-weight-one-ideal"></a>

### 3.13 Minimal weight-one Hecke ideal

Given an actual Katz weight-one eigenform for an odd absolutely irreducible `ρ` at tame level N, form the coherent away-p Hecke algebra `T_empty` acting on `H⁰(X1(N),ω)` with the supplied integral or torsion-coefficient model. Its residual maximal ideal `m_empty` is the kernel defined by the coefficient uniformiser, `T_q−tr ρ(Frob_q)` for `q∤Np` and diamonds minus det `ρ` at tame units. A `T_p-root` choice is separate. For `p>2`, an already modular `ρ` unramified at p has such a witness with `N=N(ρ)` by level and minimum-weight optimisation; at `p=2` the weight-one witness is an input, with no general existence claim. If auxiliary tame level is required for a scheme presentation at small N, use the supplied stack/descent comparison, retaining the specified N. ([Frank Calegari and David Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), §3.2.4, author pp. 20–22. Minimal coherent weight-one Hecke ideal and the distinction from the ordinary weight-two algebra.) ([Robert F. Coleman and José Felipe Voloch](https://www.math.canterbury.ac.nz/~f.voloch/Pdfs/comp2.pdf), Corollary 0.2 and following paragraph, author p. 3. Conditional weight-one realisation in odd characteristic.)

An actual weight-one tame-level eigensystem and coefficient model; for the conductor-level existence branch require `p>2`, residual modularity and unramifiedness at p. Do not identify `T_empty` with the weight-two Hecke algebra. The coherent torsion Hecke algebra need not be O-flat or generically étale. The weight-one determinant/diamond and residue-embedding normalization is fixed.

For a given weight-one witness take its actual away-p eigencharacter. In the `p>2` conductor-level existence branch first optimize level and apply the minimum Katz weight theorem. Use AlgebraicModularFormsAndSerreWeights Layer R15.1’s coherent weight-one module and Hecke algebra, including torsion coefficient models. The characteristic-zero liftable branch also uses ModularForms layer 8W’s q-expansion lattice; that lattice alone does not realize a nonliftable torsion weight-one form. Form the kernel of its residual away-p eigensystem; use trace/determinant comparison for representation independence.

The operator at p in weight one records the sum of the two Frobenius roots, rather than selecting one ordinary refinement. The full weight-two ideal used in a Jacobian uses its own p-operator. Conflating those two ideals would identify different local factors and corrupt both nilpotence and multiplicity calculations.

The definition has the following named operations and comparisons, under these hypotheses:

- `minimalWeightOneIdeal`: The away-p kernel in the coherent weight-one Hecke algebra.

- `minimalWeightOneIdeal_residue`: Its residue character has good-prime traces tr `ρ` and diamonds det `ρ`.

- `minimalWeightOneIdeal_support`: The weight-one module localised at this ideal is nonzero.

- `minimalWeightOneIdeal_transport`: Isomorphic representations and transported coefficient embeddings give the corresponding ideal.

- `minimalWeightOneIdeal_ext`: Two residual away-p Hecke characters agreeing on its Hecke and diamond generators have the same kernel; changing `ρ` by isomorphism changes neither generator values nor the ideal.

- `minimalWeightOneIdeal_membership`: `T_q−trρ(Frob_q)` and `〈q〉−detρ(Frob_q)` lie in the kernel for `q∤Np`, when those scalars are in the chosen residue field. No chosen `T_p` root is imposed.

- `minimalWeightOneIdeal_residue_quotient`: The algebra quotient by the kernel maps isomorphically to the image of its residual character. It has the standard quotient factorization/uniqueness property; equality with the full chosen residue field requires surjectivity.

- `minimalWeightOneIdeal_localisation`: Use the existing ideal/localization construction on the supplied coherent Hecke algebra. Finiteness over O does not imply flatness for nonliftable torsion weight one.

- `minimalWeightOneIdeal_transport_comp`: Kernel transport along compatible coefficient algebra isomorphisms and residue embeddings respects identity and composition; extension may require selecting the prime determined by the residue embedding.

- `minimalWeightOneIdeal_two_roots`: Two ordinary refinements with roots `α` and `β` contract to this same away-p ideal; their full ideals can differ.

Its applications are [Localised Hasse injection](#hasse-localised-injection): At tame `N≥5`, the Hasse map is localized at this away-p ideal. [Hecke congruence-module application](#congruence-module): Identify the weight-one localization; a congruence-functor application additionally requires the finite-flat, augmentation-factor and generic-isomorphism hypotheses of §1.3, which are not automatic for a nonliftable torsion weight-one space.

*Needs:* [Conditional descent to the full Serre level](#descend-to-serre-level), [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem), `AlgebraicModularFormsAndSerreWeights:R15.1`, `ModularForms:Layers 8, 8W`.

**Checks.**

- An ideal with `T_q` mapped to a scalar different from tr `ρ(Frob_q)` at a good q is not `m_empty`. `(weight_one_bad_trace.)`

- Matching traces but replacing the determinant character by an incompatible diamond character is rejected. `(weight_one_diamond.)`

- For distinct p-Frobenius roots `α,β` the two ordinary refinements contract to the same away-p ideal. `(weight_one_no_p_root.)`

- The ideal is independent of a basis of `ρ`.

- It is unaffected by a residue-field embedding once all characters are transported.

- Adjoining a `U_p/T_p` root refines this ideal and is not part of its definition.

- A nonliftable torsion weight-one localization is not treated as a finite-flat generically étale O-algebra without another comparison.

<a id="hasse-localised-injection"></a>

### 3.14 Localised Hasse injection

Let a weight-one modular `ρ` at tame `N≥5` have distinct nonzero p-Frobenius roots `α,β`. Localise the coherent weight-one space M at its away-p ideal, with `T_p−(α+β)` and `〈p〉−αβ` nilpotent on the whole localised module. For a suitable positive power A of the Hasse invariant, of weight h divisible by `p−1` and `h+1≥2`, with the torsion-coefficient sufficient-power conditions below, the composite `M→H⁰(ω^{h+1})_m→H⁰(ω^{h+1})_{β,m}` is injective. The second map is projection to the generalized `U_p=β` summand. The assertion holds with torsion `O/π^a` coefficients and for either root; away-p Hecke actions commute with it. ([Frank Calegari and David Geraghty](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), Lemma 8.14 and proof, pp. 865–866. The GL2 injection and torsion/socle reduction, with full localized nilpotence retained.)

`p∤N`, `N≥5`; actual tame coherent coefficient modules and q-expansion principle on this fine level. `α≠β` and `αβ≠0`; the source operators `T_p−(α+β)` and `〈p〉−αβ` are nilpotent on the entire localized module. Over `O/π^a` choose a lift A of a Hasse power, weight h divisible by `p−1`, q-expansion 1 modulo `π^a`, and `p^h=0` in `O/π^a`. Ensure the away-p cyclotomic weight factor is trivial modulo `π^a` on the relevant Hecke indices. For `p≥3`, `N≥5`, these hypotheses and the operator comparison come from AlgebraicModularFormsAndSerreWeights R15.3, “Weight-one T_p with torsion coefficients”. At `p=2`, use the [Dyadic torsion Hasse comparison](#dyadic-torsion-hasse-comparison) constructed here; no weight-one theta injectivity is used. The non-Eisenstein localization makes the source cuspidal; target `T_p=U_p` follows from `p^h=0`, rather than from `h+1≥2` alone.

Reduce injectivity on torsion coefficients to injectivity on the local socle over k. Use Hasse’s unchanged q-expansion and split the ordinary target into `α` and `β` generalized summands. A kernel element can be moved down the nilpotent filtration to satisfy `UF=αF` and `VF=α^{-1}F`: from `T_p=U_p+〈p〉V`, `T_pF=(α+β)F` and `〈p〉F=αβF` one gets `αβVF=βF`. The smallest nonzero exponent of a cuspidal q-expansion contradicts `VF=α^{-1}F`.

The target weight is h+1 with h a positive multiple of `p−1`, not a weight congruent to `−1` modulo `p−1`. Let V send an expansion F(q) to `F(q^p)`. On the residue socle, a hypothetical kernel gives `UF=αF` and `VF=α^{-1}F`. If the first nonzero cuspidal exponent is `n>0`, the first exponent in VF is pn, whereas `α^{-1}F` has first exponent n. Since `α≠0` these cannot agree. Generalized-eigenspace projection and the nilpotent filtration are needed to reduce to these equalities; knowledge of a characteristic polynomial on the socle alone does not give the required nilpotence on the entire source.

*Needs:* [Minimal weight-one Hecke ideal](#minimal-weight-one-ideal), [Dyadic torsion Hasse comparison](#dyadic-torsion-hasse-comparison), `AlgebraicModularFormsAndSerreWeights:R15.3, The elliptic Hasse invariant`, `AlgebraicModularFormsAndSerreWeights:R15.3, Weight-one T_p with torsion coefficients`, `AlgebraicModularFormsAndSerreWeights:R15.3, Coefficient-linear U and V`.

**Checks.**

- A zero root prevents inversion of `U_p`.

- Equal roots prevent the two-projector argument.

- Multiplication by Hasse is not confused with the projection; both arrows appear.

- Weight two by itself does not kill `p^{weight−1}` on `O/π^a` when a is large; a sufficient Hasse power is required.

- With `α=2`, `β=3` in `F₇`, the diamond value is 6 and the socle calculation gives `VF=4F`, since `α^{-1}=4`. Writing `VF=βF` would give 3F and is incompatible with `UVF=F`.

<a id="dyadic-torsion-hasse-comparison"></a>

### 3.14a Dyadic torsion Hasse comparison

For odd `N≥5`, a coefficient DVR O of residue characteristic two and `a≥1`, construct the weight-one `T₂` and high-weight Hasse comparison on the actual cuspidal `O/π^a` section modules. ModularCurvesPartII §9.11 supplies the integral normalized Hecke operator and its base change. Its weight-one expansion is `U+〈2〉V`. Choose `A=E₄^{2^s}` of weight `h=4·2^s` large enough that its expansion is 1 modulo `π^a`, `2^h=0` in `O/π^a`, and the away-two weight factors are trivial on the relevant indices. Multiplication φ by A lands in weight h+1, where the Hecke operator is U. Construct the second section map `D=φT₂−Uφ`; its expansion is `〈2〉V`, and `UD=φ〈2〉`. In particular `U²φ−UφT₂+φ〈2〉=0`. These identities give the ordinary two-root comparison used in §3.14, including coefficients, level, diamond and away-two Hecke compatibility. ([Frank Calegari and David Geraghty](https://math.uchicago.edu/~fcale/papers/Siegel.pdf), Lemma 8.14 and proof, pp. 865–866. The U,V projection and socle argument.)

Use the small-prime `E₄` Hasse-power lift from AlgebraicModularFormsAndSerreWeights R15.3. The integral coherent operator constructs D as a section map; q-expansion injectivity proves the identities, so V is not presumed to preserve the original weight-one section space. On the local residue socle with distinct nonzero roots α,β, the quadratic relation puts φ(M) in the ordinary α/β factors. A kernel of projection to β reduces along the nilpotent filtration to `UF=αF` and `VF=α^{-1}F`. The first positive cuspidal exponent contradicts the latter identity. The torsion-section socle criterion then proves injectivity on `O/π^a`; this argument does not require injectivity of theta in characteristic two.

*Needs:* `ModularCurvesPartII:§9.11`, `AlgebraicModularFormsAndSerreWeights:R15.3, Deligne congruence and small-prime lifts`, `AlgebraicModularFormsAndSerreWeights:R15.3, Socles of torsion section modules`, `AlgebraicModularFormsAndSerreWeights:R15.3, Coefficient-linear U and V`.

**Checks.**

- At `p=2` the interval `1≤k≤p−2` is empty; the projection proof uses U,V and the first positive exponent instead of weight-one theta injectivity.

- Over `Z₂/8`, E₄ has weight 4 and expansion 1, `2⁴=0`, and every odd integer has fourth power 1. Thus h=4 and target weight 5 meet the sufficient-power tests.

- Distinct nonzero roots can occur over `F₄`, although `F₂` has only one nonzero element. Equal roots or a zero root fail the projector hypotheses.

- Levels below five are outside this torsion comparison; no small-level descent is inferred.

### Examples

The weight-26, `p=107` example gives companion weight 82 and distinct inertia characters, hence a split local restriction. At the boundary `k=p` the same formal weight relation gives companion weight one, but a nonsplit unramified extension with equal diagonal characters is still tame. The stronger splitting conclusion must fail there.

In a two-dimensional ordinary extension with determinant `χ_p` and trivial quotient character, the inertial semisimplification `χ_p⊕1` does not identify its extension class. A finite-flat class lies in the weight-two branch; a très-ramifiée class can have Serre weight p+1. The extension-sensitive AlgebraicModularFormsAndSerreWeights/FiniteFlatGroupsAndIntegralPadicHodgeTheory recipe must distinguish them. A nontrivial Jordan Frobenius with repeated roots is nonscalar and belongs to the nonscalar multiplicity branch, while the scalar Wiese branch needs the entire Frobenius matrix to be scalar.

### Dependencies

The external inputs are `AlgebraicModularFormsAndSerreWeights:R15.1`, `AlgebraicModularFormsAndSerreWeights:R15.3, Coefficient-linear U and V`, `AlgebraicModularFormsAndSerreWeights:R15.3, The elliptic Hasse invariant`, `AlgebraicModularFormsAndSerreWeights:R15.3, Theta cycles`, `AlgebraicModularFormsAndSerreWeights:R15.3, Theta and filtration`, `AlgebraicModularFormsAndSerreWeights:R15.3, Weight-one T_p with torsion coefficients`, `AlgebraicModularFormsAndSerreWeights:R15.3, Weight reduction to at most p+1`, `AlgebraicModularFormsAndSerreWeights:R15.4, Edixhoven and classical weights`, `AlgebraicModularFormsAndSerreWeights:R15.4, The weight-two criterion`, `AlgebraicModularFormsAndSerreWeights:R15.4, Invariance and renormalized twists`, `AlgebraicModularFormsAndSerreWeights:R15.4, Tame inertia alternatives`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:§§R07.1.7–R07.1.9`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `ModularCurvesPartII:§§7.1–7.2, 11.1`, `ModularCurvesPartII:Layers 11–12`, `ModularCurvesPartII:Layers 13–14`, `ModularCurvesPartII:§§13.5, 14.13–14.15`, `ModularForms:Layers 8, 8W`, `ModularCurvesPartII:§9.11`, `AlgebraicModularFormsAndSerreWeights:R15.3, Deligne congruence and small-prime lifts`, `AlgebraicModularFormsAndSerreWeights:R15.3, Socles of torsion section modules`. Their exact contracts are stated above; each target specifies the comparisons it uses.

## Layer 4: Coefficient-prime level and character

Removal of coefficient-prime level preserves the residual representation while changing weight and potentially its characteristic-zero character. The proof proceeds through a controlled square-root twist, an Eisenstein multiplication, depth reduction and a trace. Character replacement at fixed level and weight is a different theorem requiring `ℓ≥5` and `2≤k`. Each use of these operations must establish Hecke support before lifting a characteristic-zero eigenform.

<a id="nebentypus-congruent-character"></a>

### 4.1 Congruent nebentypus at fixed level

Let `ℓ≥5`, `2≤k` and f be a normalized cuspidal eigenform of weight k and level `Γ1(N)`, with irreducible residual representation at `λ`. If `ε′` is a characteristic-zero character modulo N congruent to `ε` modulo `λ` and with `ε′(−1)=(−1)^k`, then a weight-k eigenform of the same level and character `ε′` gives the same residual representation after coefficient extension. In particular one can replace `ℓ-primary` character factors by their canonical prime-to-`ℓ` lift in this range. The fixed-level fixed-character conclusion is not extended to `ℓ=2` or 3, or to weight one. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §1, Theorem 1.3, author pp. 1–3. The fixed weight/level character replacement with `ℓ≥5` and the standing hypothesis `k≥2`.) ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Proposition 9.3 and following remarks, pp. 478–479. The low-characteristic lifting/character obstruction.)

`ℓ≥5`, `2≤k`, irreducible residual representation, compatible parity and congruent characters. Coefficient fields and `λ` are retained throughout; characters of `ℓ`-power order are not themselves trivial in characteristic zero.

Use integral character eigenspaces and the supplied Hecke-localisation comparison. Compare their residual support using congruence of characters. Lift a common residual eigencharacter in the required characteristic-zero character component.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `DirichletCharacter.changeLevel`.

**Checks.**

- A character of order `ℓ` reduces to one but can be nontrivial before reduction.

- At `ℓ=3` the level-13 weight-two character obstruction is retained.

- Parity is a hypothesis rather than a consequence of arbitrary residual congruence.

- At `N=23`, `ℓ=11`, `k=1`, the form `f(τ)=η(τ)η(23τ)` has character `ε=(−23/·)` and absolutely irreducible reduction. Its Artin representation is induced from a nontrivial order-three class character of `Q(√−23)` and has image `S₃`; modulo 11 the two order-three eigenlines are distinct and interchanged by an involution. If θ modulo 23 has order 11, then `ε′=εθ` is odd and congruent to ε, but no classical cuspidal weight-one form of level 23 has character `ε′`. Conductor exponent one would force projective inertia of order 22. The finite-projective-image classification then forces a dihedral image, whose quadratic quotient is unramified at every finite prime, impossible over Q. Thus congruent Katz characters do not supply the asserted characteristic-zero weight-one witness.

<a id="strip-ell-power-from-level"></a>

### 4.2 Stripping coefficient-prime powers from level

For `ℓ≥3`, an irreducible residual representation occurring at level `Nℓ^r` with `ℓ∤N` occurs in some weight at level N. The conclusion preserves the residual representation and the prime-to-`ℓ` level, while allowing weight, characteristic-zero nebentypus, coefficient field and coefficient prime to change. Dyadic stripping is supplied by the separate Buzzard weight/level bridge, not by this theorem. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Theorem 2.1 and proof, author pp. 4–6. Complete odd-characteristic stripping argument.)

`ℓ` odd, N positive prime to `ℓ`, `r≥0`, modular witness and irreducible residual representation. No fixed weight or fixed characteristic-zero character conclusion.

Normalize the coefficient-prime character by an `ℓ-primary` square-root twist. Remove the Teichmüller part with an Eisenstein multiplier congruent to one. Reduce `ℓ-depth` using `U_ℓ` and inverse coefficient Frobenius. Use the trace construction to descend the final `Γ0(ℓ)` factor and lift the residual eigensystem.

*Needs:* [First character normalization](#strip-ell-step1), [Teichmüller character removal](#strip-ell-step2), [Reducing coefficient-prime depth](#strip-ell-step3), [The trace step at coefficient-prime level](#strip-ell-step4).

**Checks.**

- The result cannot be substituted for a weight-two fixed-level theorem.

- At `ℓ=3` use the source’s E4 adjustment in the trace step.

- No step treats an `ℓ-primary` characteristic-zero character as literally trivial.

<a id="strip-ell-step1"></a>

### 4.3 First character normalization

For odd `ℓ` write the coefficient-prime nebentypus as `ηω^i` with `η` of `ℓ`-power order. Choose `ξ` of `ℓ`-power order with `ξ²=η^{-1}`. The twist `f⊗ξ` gives the same residual representation and character `εω^i`. Choose `r′≥r` so that `cond(ξ)²` divides `ℓ^{r′}`; the twisted witness is on `Γ0(ℓ^{r′})∩Γ1(ℓN)`. The twist can increase the initial `ℓ-depth`, which subsequent steps then remove. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Proof of Theorem 2.1, Step 1, author p. 5. The indicated operation and its coefficient and level conditions.)

`ℓ` odd, `ε` has conductor dividing N, `ℓ∤N`. Regard η as a Dirichlet character modulo a power of ℓ. If its order is `ℓ^a`, choose t with `2t≡−1` modulo `ℓ^a` and take `ξ=η^t`. The global Dirichlet twist has only `ℓ`-power conductor; its level bound includes the square of that conductor.

Check the character or q-expansion operation in the indicated step. Verify good-prime residual Hecke support and the coefficient embedding before passing to an eigenform.

For a character `θ` of odd `ℓ`-power order, multiplication by two is invertible on its character group, so choose `ζ` with `ζ²=θ` and twist by `ζ⁻¹`. The twist changes the determinant by `ζ⁻²` and is trivial residually. At `ℓ=2` this square-root step is unavailable; the dyadic build uses its own geometry.

*Needs:* `ArithmeticGaloisRepresentations:Layer 3`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `ClassFieldTheory:Layers 11–12`.

**Checks.**

- At `ℓ=2` squaring is not invertible on 2-primary characters.

- The residual twist is trivial, but the new characteristic-zero character changes.

<a id="strip-ell-step2"></a>

### 4.4 Teichmüller character removal

Choose an exponent `i≥3` representing the Teichmüller character, increasing it by a multiple of `ℓ−1` if necessary. The Eisenstein form G of type `(i,ω^{-i})` at `Γ0(ℓ)` has constant term `c=L(1−i,ω^{-i})/2` with negative `λ-valuation`. Kummer congruences and the von Staudt calculation give this valuation, while the positive coefficients are integral. Thus `E=c^{-1}G` is integral and `E≡1` modulo `λ`. Multiplication by E removes `ω^i` and preserves the residual q-expansion at `Γ0(ℓ^{r′})∩Γ1(N)`, in increased weight. Lift the resulting good-prime residual eigencharacter; the product need not be a characteristic-zero eigenform. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Proof of Theorem 2.1, Step 2, author p. 5. The indicated operation and its coefficient and level conditions.)

Compatible parity and the Eisenstein congruence of Ribet’s proof.

Specialize the supplied Eisenstein-series normalization, including the Euler factor for an imprimitive `ω^{-i}`, and prove the special L-value valuation congruence by the Kummer/von Staudt argument cited in Ribet’s Step 2. Negative valuation implies `c≠0` and makes every positive coefficient of `c^{-1}G` vanish modulo `λ`. Use the q-expansion principle to identify the product’s residual good-prime Hecke support. Apply the finite-free eigenvalue-lifting contract, allowing coefficients and weight to change.

*Needs:* [First character normalization](#strip-ell-step1), `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ModularForms:Layer 0`.

**Checks.**

- Multiplication changes the weight.

- At `ℓ=3` and trivial `ω^{-i}`, choose `i=4` rather than the exceptional weight two. The constant uses `L(1−i,1 modulo 3)=(1−3^{i−1})ζ(1−i)`; losing this Euler factor changes the normalization.

- Congruence of q-expansions is not an automatic assertion about all bad-prime Hecke operators.

<a id="strip-ell-step3"></a>

### 4.5 Reducing coefficient-prime depth

For r′>1, take a finite Galois coefficient field K and `σ` in its `λ`-decomposition group inducing residue Frobenius `a↦a^ℓ`. The characteristic-zero form `σ^{-1}f` is of the same weight and level, with its character conjugated. Then `g=(σ^{-1}f)^ℓ|U_ℓ` is a cusp form on `Γ0(ℓ^{r′−1})∩Γ1(N)`; modulo `λ` its q-expansion equals that of f. Iterate to depth one, retaining the original residue embedding and good-prime eigencharacter. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Proof of Theorem 2.1, Step 3, author p. 5. The indicated operation and its coefficient and level conditions.)

A finite Galois coefficient field containing f’s coefficients and a Frobenius lift in the decomposition group at `λ`. Use ModularForms layer 8G’s newform stability and the algebraic newform/degeneracy expansion to prove coefficient conjugation for this f. Prove the source’s level-depth `U_ℓ` property at r′>1 from its correspondence; a characteristic-p V operator alone does not supply it.

Expand f in degeneracy images of normalized newforms, conjugate its algebraic coefficients and those newforms, and use q-expansion injectivity to make `σ^{-1}f` independent of the expansion. Raise that actual form to the `ℓth` power. Compute the `U_ℓ` correspondence’s transformation law to prove descent from `Γ0(ℓ^{r′})` to `Γ0(ℓ^{r′−1})`; same-level Hecke stability is insufficient. In the residue q-expansion use `characteristic-ℓ` Frobenius and `U_ℓ` extraction; `σ^{-1}` cancels coefficient Frobenius. Lift residual Hecke support when selecting the next eigenform.

*Needs:* [Teichmüller character removal](#strip-ell-step2), `ModularForms:Layer 8G`, `ModularForms:Layer 2`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- Raising coefficients to `ℓ` alone applies Frobenius to eigenvalues.

- The inverse Frobenius is necessary to recover the original residual character.

<a id="strip-ell-step4"></a>

### 4.6 The trace step at coefficient-prime level

At depth one and tame character `ε`, use the partial Atkin–Lehner operator W with `W²=ε(ℓ)`. On weight-w forms the trace is `Tr(F)=F+ε(ℓ)^{-1}ℓ^{1−w/2}F|W|U_ℓ`. Let `E≡1` be the level-one Eisenstein form of weight `a=ℓ−1` for `ℓ>3`, or `a=4` for `ℓ=3`. Put `g=E−ℓ^{a/2}E|W=E−ℓ^aE|V_ℓ`. Then `g≡1` and `v_ℓ(g|W)≥1+a/2`. For sufficiently large i the nonidentity trace term of f `g^i` has positive `λ-valuation`, so `Tr(f g^i)` is a level-N cusp form congruent to f. Lift its residual good-prime eigencharacter. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Proof of Theorem 2.1, Step 4, author p. 6. The indicated operation and its coefficient and level conditions.)

The source’s partial W at `Γ1(N)∩Γ0(ℓ)`, with tame character `ε`, `W²=ε(ℓ)`, and the normalized V/U operators. Integral q-expansions and bounded denominators of f|W; choose i so `1−(k+ia)/2+v_ℓ(f|W)+i(1+a/2)>0`.

Use ModularForms layers 3 and 6’s slash and trace constructions to prove the displayed formulas with Ribet’s matrix `W=[[ℓx,y],[Nℓz,ℓ]]`, where `ℓx−Nyz=1`. Compare its normalization across weights before multiplying forms. Construct g using layer 0 Eisenstein forms, prove `E≡1` by the level-one constant-term congruence, and compute its positive W-valuation. Here `v_ℓ` is normalized by `v_ℓ(ℓ)=1`, including in a ramified coefficient DVR; extend the coefficient field for the slash scalars when necessary. The displayed exponent tends to infinity with i, so the nonidentity trace term vanishes modulo `λ`. Use the q-expansion principle and eigenvalue lifting on the level-N cusp lattice.

*Needs:* [Reducing coefficient-prime depth](#strip-ell-step3), `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ModularForms:Layer 0`, `ModularForms:Layer 3`, `ModularForms:Layer 6`.

**Checks.**

- At `ℓ=5`, `a=4` and `E=E₄`, the q coefficient of g is 240 and that of `g|W=25(E(q⁵)−E(q))` is `−6000`. Their 5-adic valuations are one and three; the latter equals 1+a/2 and fixes the sign and scaling of W.

- Choosing i too small can leave a nonzero Fricke contribution.

- The target weight and character may change.

<a id="weight-two-at-level-n-ell"></a>

### 4.7 Weight two at level Nℓ

Let `ℓ≥3`, `ℓ∤N`, `2≤k≤ℓ+1` and `ρ` an irreducible eigensystem at tame level N. If `ℓ>3` or `N>3`, it occurs in weight two at level `Nℓ`. The geometric bridge uses coefficient-prime character `ω^{k−2}` and a tame characteristic-zero character reducing to the original `ε`; at `ℓ≥5` the canonical prime-to-`ℓ` lift of `ε` can be prescribed using Carayol. At `ℓ=3` no unconditional fixed characteristic-zero tame character is asserted. At `k=ℓ+1` distinguish genuine filtration `ℓ+1`, realized by the special-fibre differential bridge with trivial `ℓ-character`, from a Hasse multiple of weight two, lifted first at N and included as an oldform at `Nℓ`. Occurrence is the conclusion, not universal exact newness at `ℓ`. ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), Theorem 2.2, author p. 6. Weight-two occurrence with Teichmüller character and small-level exception.) ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Proposition 8.18, p. 477; Proposition 9.3 and proof, pp. 478–479. Weight-two lifting and the p+1/Hasse boundary.)

`2≤k≤ℓ+1`, irreducible `ρ`, `ℓ∤N`. `ℓ>3` or `N>3`; coefficient field enlarged to contain `ω`.

For `3≤k≤ℓ` apply the small-Katz-weight/weight-two geometric bridge with its Teichmüller and residue character. For genuine filtration `ℓ+1` use Gross Proposition 8.18’s special-fibre differential realization and Proposition 9.3(2); do not deduce a tame-level weight-two witness in this nonfinite branch. For weight two or a weight-`ℓ+1` Hasse multiple of it, lift at tame level and include it at `Nℓ`. Lift eigenvalues without fixing a characteristic-zero tame character at `ℓ=3`; at `ℓ≥5` use the separate character-replacement theorem at output weight two.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ModularCurvesPartII:§§7.1–7.2, 11.1`, `AlgebraicModularFormsAndSerreWeights:R15.3`, [Congruent nebentypus at fixed level](#nebentypus-congruent-character), `TauCeti.ModularForm.levelRaise`.

**Checks.**

- For `k=2` the coefficient-prime character is trivial.

- For `k=ℓ+1` the exponent `ℓ−1` is trivial, but the Hasse boundary is still checked.

- Do not assert exact new level `Nℓ`.

- At `ℓ=3` only reduction of the tame character is prescribed; Gross’s level-13 obstruction prevents an arbitrary fixed characteristic-zero lift.

<a id="finite-flat-weight-two-optimisation"></a>

### 4.8 Finite-flat weight-two optimisation

Let `ℓ≥5` and `ρ` be continuous odd irreducible and already modular, finite flat over `Z_ℓ` at `ℓ`, with det `ρ` on inertia equal to `χ_ℓ`. If the imported extension-sensitive recipe gives `k(ρ)=2`, there is a weight-two witness at tame level `N(ρ)`, with the canonical prime-to-`ℓ` lift of its predicted character. The recipe implication from finite-flatness and determinant is supplied by AlgebraicModularFormsAndSerreWeights Layer R15.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5; the application here combines it with level and character optimisation. ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 4.5 and §8, author pp. 11–12, 26–28. Conditional weight-two application through the finite-flat recipe.) ([Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/motives.pdf), §1–§4, author pp. 1–11. Level and character choices after modularity is known.)

`ℓ≥5`, modularity witness, finite-flat extension of the actual local representation, not only semisimplification. Use the supplier’s recipe comparison; no arbitrary finite-image implication. The character at tame level is predicted by det `ρ·χ_ℓ^{-1}`.

Apply the supplied finite-flat local recipe to certify `k=2`. Lower the prime-to-`ℓ` level to the full conductor. Replace the character by its prime-to-`ℓ` lift at weight two within the `ℓ≥5` theorem.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.4, The weight-two criterion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, [Conditional descent to the full Serre level](#descend-to-serre-level), [Congruent nebentypus at fixed level](#nebentypus-congruent-character).

**Checks.**

- The very ramified extension with the same semisimple diagonal data fails finite-flatness.

- If det inertia is not `χ_ℓ` the claimed weight-two recipe is not applied.

- No `ℓ=2` or 3 fixed-character conclusion is inferred.

### Examples

Let `θ` have order `ℓ` with `ℓ` odd. Its square root `θ^a` is found from `2a≡1` mod `ℓ`, and the twist `θ^{−a}` reduces to one. The analogous choice for a character of order two has no solution, showing why this coefficient-prime removal step is restricted to odd characteristic.

At `ℓ=3,N≤3` the stated `weight-two-at-Nℓ` theorem excludes the small-level case. The coefficient-prime stripping theorem still supplies a tame-level witness in some weight. These are different assertions and cannot be combined into a fixed-weight small-level conclusion without an additional input.

### Dependencies

The external inputs are `AlgebraicModularFormsAndSerreWeights:R15.3`, `AlgebraicModularFormsAndSerreWeights:R15.4, The weight-two criterion`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ArithmeticGaloisRepresentations:Layer 3`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `ModularCurvesPartII:§§7.1–7.2, 11.1`, `DirichletCharacter.changeLevel`, `TauCeti.ModularForm.levelRaise`, `ClassFieldTheory:Layers 11–12`, `ModularForms:Layer 0`, `ModularForms:Layer 2`, `ModularForms:Layer 3`, `ModularForms:Layer 6`, `ModularForms:Layer 8G`. Their exact contracts are stated above; each target specifies the comparisons it uses.

## Layer 5: Combined classical optimisation and exceptions

Dyadic lowering uses a universal multiplicity condition across the relevant weight-two Jacobians. Buzzard's auxiliary class has nonzero trace, unlike the odd-characteristic complex-conjugation class. The Q(i)-induced construction and the scalar dihedral Katz construction have their own inputs; neither is silently included in a geometric theorem whose hypotheses exclude it.

<a id="buzzard-multiplicity-one"></a>

### 5.1 Buzzard’s global multiplicity-one condition

For a dyadic irreducible modular `ρ`, Buzzard multiplicity one means the following universal condition. For every `Γ` with `Γ1(M)⊆Γ⊆Γ0(M)` and every full weight-two Picard Hecke ideal m giving `ρ`, `dim_{T/m}J(Γ)[m]=2`, where M is odd if `ρ` is finite flat at 2 and `v_2(M)=1` otherwise. The universal quantification is over all these levels and groups, not one optimal level. The Hecke algebra includes all `T_n` and diamonds, and the residual Picard representation is identified with `ρ` using its actual dual/twist normalization. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Definitions 2.1–2.2, Lemma 2.3 and Proposition 2.4, pp. 100–101. Universal multiplicity condition, reduction to `Γ1(M)` and the nonscalar implication.)

Irreducible modular `ρ` in characteristic two; finite-flat branch fixed. Jacobian torsion, full integral Hecke algebra and residue embedding are supplied by ModularCurvesPartII Layers 13–14. J[m] is actual residue torsion of the Jacobian, unlike an O-free cohomology lattice.

Use the supplied full Hecke action and Picard residual normalization. Define the all-level condition with the correct parity of M. Prove `Γ1(M)` suffices because the intermediate-Jacobian map has only abelian kernel action, hence no irreducible `ρ` contribution.

The definition has the following named operations and comparisons, under these hypotheses:

- `buzzardMultiplicityOne`: The universal full-Hecke dimension-two condition at the permitted levels.

- `buzzardMultiplicityOne_at_level`: Specialization gives dimension two at every permitted pair `(Γ,m)`.

- `buzzardMultiplicityOne_gamma1_iff`: It is enough to check `Γ1(M)` for all permitted M.

- `buzzardMultiplicityOne_local_nonscalar`: A nonscalar decomposition-group restriction at 2 implies this condition, by Proposition 2.4.

- `buzzardMultiplicityOne_congr`: Isomorphic residual representations with matching finite-flat type satisfy the same universal predicate; preserve the Picard dual/twist convention.

- `buzzardMultiplicityOne_simp`: At any permitted pair, one full-Hecke copy of `ρ` has dimension two and two copies have dimension four. The allowed level test is oddness or `v₂(M)=1` according to its finite-flat type.

- `buzzardMultiplicityOne_scalar_extension`: A compatible finite extension of the residue field and corresponding ideal preserves full-factor dimension and the predicate, with identity/composition laws.

- `buzzardMultiplicityOne_picard`: Dimension is computed on actual `J(Γ)[m]` using the supplied Picard representation comparison. It is not characteristic-zero complex newspace multiplicity; as a proposition it has no object universal property.

- `buzzardMultiplicityOne_counterexample`: A permitted full-Hecke factor containing two copies of `ρ` disproves the universal condition even if another level has one copy.

Its applications are [Buzzard’s mod-two lowering theorem](#buzzard-mod-two-level-lowering): The dimension contradiction uses `λ=1`. [Buzzard’s combined weight and level theorem](#buzzard-weight-and-level-mod-two): Iterate lowering over the admissible levels, not only the starting level.

*Needs:* `ModularCurvesPartII:§§13.5, 14.13–14.15`, `ArithmeticGaloisRepresentations:§§1.7–1.8`.

**Checks.**

- A full-Hecke Jacobian factor isomorphic to one copy of a two-dimensional `ρ` has dimension two. `(buzzard_full_factor.)`

- Two copies give dimension four and fail the condition at that pair. `(buzzard_double_factor.)`

- A finite-flat `ρ` tested only at even levels has not been checked on the odd levels required by the definition. `(buzzard_level_parity.)`

- One tested pair of dimension two and another permitted pair of dimension four fails the universal condition. `(buzzard_universal.)`

- A single m with dimension two does not establish the global condition.

- Omitting `T_2` can increase the isotypic multiplicity.

- Scalar local Frobenius may violate this condition.

<a id="nonscalar-dyadic-multiplicity-one"></a>

### 5.2 Nonscalar dyadic multiplicity one

Let `ρ` be an irreducible modular representation in characteristic two. If its restriction to a decomposition group at two is not contained in the scalar matrices, then it satisfies Buzzard’s global multiplicity-one condition at every permitted level and intermediate group. The hypothesis concerns the whole local representation: it includes an unramified nontrivial Jordan block even when the two Frobenius roots coincide. The finite-flat branch uses odd levels; the nonfinite branch uses levels exactly divisible by two. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Proposition 2.4 and proof, p. 101; scalar boundary p. 102. The dyadic theorem, including the nonfinite adaptation and the unramified Jordan-block case.) ([Bas Edixhoven](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 9.2, parts (2)–(3), and proof, author pp. 28–30. The finite-flat multiplicity proof used by Buzzard, with Buzzard’s separate extension to unramified nondiagonalisable Frobenius.)

An actual modularity witness and irreducibility in characteristic two. The full local restriction at two is nonscalar, without replacing it by its semisimplification. Full Picard Hecke ideals and the finite-flat/nonfinite level convention of the preceding definition.

Reduce every intermediate group to `Γ1(M)` by Lemma 2.3; keep the quantification over all permitted M. For nonfinite `ρ` and `M=2N`, adapt Mazur–Ribet’s weight-two argument using the odd-index Hecke ring and `w_2`; `w_2=−U_2` on the two-new part and the Eisenstein component-group input supply its required axioms. For finite-flat `ρ` at odd M, use the finite-flat local filtration and the multiplicity argument of Edixhoven Theorem 9.2(2)–(3). Buzzard treats the remaining unramified nondiagonalisable case using the nonsplit sequence (9.2.1); do not discard that extension by semisimplifying. Transport the resulting two-dimensional full-Hecke Picard torsion to each permitted intermediate group with the imported residual normalization.

*Needs:* [Buzzard’s global multiplicity-one condition](#buzzard-multiplicity-one), `ModularCurvesPartII:Layers 13–14`, `ModularCurvesPartII:§§12.2–12.4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`.

**Checks.**

- An unramified Jordan matrix with repeated nonzero root satisfies the nonscalar hypothesis.

- A scalar unramified local restriction has no conclusion from this theorem.

- A dimension-two factor at one level alone does not establish the universal conclusion.

<a id="auxiliary-character-replacement"></a>

### 5.2a Auxiliary-level character replacement

Let M be positive and `r>3` prime to 2M. For an irreducible residual representation in characteristic two, unramified at r and arising from a normalized characteristic-zero weight-two eigenform f of level `Γ1(Mr)`, write its character as `χ_Mχ_r`. Given a characteristic-zero character ψ modulo M congruent to `χ_M` at the chosen dyadic prime, construct a normalized weight-two eigenform f′ at `Γ1(Mr)` whose M-character is ψ, with the same residual representation and `a₂(f′)≡a₂(f)`. The r-character is allowed to change: the product character must be even. Unramifiedness of ρ at r makes the r-character reduce to one. No parity condition is imposed on ψ alone at this auxiliary stage. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), proofs of Corollaries 2.6–2.7, p. 103, invoking Diamond, *The refined conjecture of Serre*, Lemma 2.2 with m=r>3.)

Construct the integral character-component support comparison at this auxiliary level using the weight-two parabolic cohomology and diamond action. After localization at the irreducible residual system, show that replacing `χ_M` by ψ retains nonzero support with the specified full-Hecke residual `a₂`. Keep the residual M-character, auxiliary r-character and even total parity in this comparison. Only then apply Deligne–Serre to a finite-free integral realization of that support, allowing coefficient extension. The statement does not follow from eigenvalue lifting without the support comparison.

*Needs:* `ModularCurvesPartII:Layers 13–14`, `DirichletCharacter`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- If ψ is the odd-order lift of the residual M-character, then ψ is even. For `r≡3 mod 4`, the even r-character has odd order; if its reduction is trivial, it is trivial.

- In the application of §5.4, ψ is already even, and the r-character must absorb no odd parity. An arbitrary preassigned trivial r-character is not part of the auxiliary comparison.

- The common residual away-two character alone does not specify `a₂`; localization retains the full coefficient-prime operator before lifting.

<a id="buzzard-auxiliary-prime"></a>

### 5.3 Buzzard’s auxiliary-prime removal

If an irreducible mod-two `ρ` is not induced from Q(i), there are primes `r∤2M` with `r≡3` mod 4 and tr `ρ(Frob_r)≠0`. For a weight-two witness at level Mr whose r-component character reduces trivially, character normalization and the parity at r make that character odd-order and hence trivial. An unramified-special r-component would have scalar semisimplification and trace zero in characteristic two; therefore the witness is old at r and descends to M while preserving `a_2` modulo the coefficient prime. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Lemma 2.5 and Corollary 2.6, pp. 102–103. Auxiliary trace-nonzero condition and preservation of `a_2` after its removal.)

`ρ` not Q(i)-induced; r unramified for `ρ` and prime to 2M. Weight two and the source’s congruent-character setup; all coefficient primes tracked.

Use the finite-image argument and Chebotarev to find r in the non-Q(i)-induced case. Apply [Auxiliary-level character replacement](#auxiliary-character-replacement) to make the M-character odd-order while preserving the residual `a₂`; then use `r≡3` mod 4 and even weight. Exclude the special local type by its trace-zero reduction, then remove the old prime.

*Needs:* [Auxiliary-level character replacement](#auxiliary-character-replacement), `ArithmeticGaloisRepresentations:Layer 4`, `Chebotarev:Layer 10`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, [Residual support and eigenvalue descent](#eigensystem-level-descent).

**Checks.**

- This auxiliary prime has nonzero trace, unlike Ribet’s odd-characteristic auxiliary prime.

- The Q(i)-induced case needs a different argument.

- `a_2` is preserved as well as the away-2 residual representation.

<a id="buzzard-carayol-lemma-mod-two"></a>

### 5.4 Carayol’s character lemma mod two

Let `ρ` be irreducible mod two and not induced from Q(i), arising from a weight-two characteristic-zero form at level M and character `χ`. For any character `ψ` modulo M congruent to `χ` with `ψ(−1)=1`, there is a weight-two form of the same level and character `ψ` giving `ρ`, and its `a_2` is congruent to the original `a_2`. The parity and non-Q(i)-induced hypotheses are essential parts of this dyadic character-replacement statement. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Corollary 2.7 and proof, p. 103. Dyadic fixed-level character replacement with `a_2` control.)

Actual characteristic-zero weight-two witness; `ψ` and `χ` congruent at the chosen dyadic prime. `ρ` not Q(i)-induced; `ψ(−1)=1`.

Add the auxiliary prime `r>3`, prime to 2M, and apply [Auxiliary-level character replacement](#auxiliary-character-replacement) to prescribe ψ at M while retaining the residual `a₂`. The new r-character has odd order and trivial reduction. Remove r by the auxiliary-prime lemma, preserving `a_2`.

*Needs:* [Auxiliary-level character replacement](#auxiliary-character-replacement), [Buzzard’s auxiliary-prime removal](#buzzard-auxiliary-prime), `AlgebraicModularFormsAndSerreWeights:R15.5`, `DirichletCharacter`.

**Checks.**

- Congruence alone does not force `ψ(−1)=1` in characteristic zero.

- A 2-primary character can reduce to one without being trivial.

- Do not apply this lemma to the Q(i)-induced branch.

<a id="dyadic-involution-level-raising"></a>

### 5.5 Dyadic auxiliary level raising with a₂ control

In the weight-two dyadic setup of Buzzard Theorem 2.8, let `r∤2Mq` with `ρ(Frob_r)` of order exactly two. Under the full-Hecke integral multiplicity and degeneracy hypotheses, there is an r-new form at `Γ1(M)∩Γ0(qr)` giving `ρ`, with `a₂` congruent to the starting form. The required input is the dyadic `Γ1` integral level-raising argument described on p. 105, including preservation of the coefficient-prime operator; the odd-`ℓ` small-weight theorem does not supply it. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Proof of Theorem 2.8, p. 105; Remark (b), p. 104. The auxiliary involution, `Γ1` level-raising input and explicit `a₂` preservation used by the proof.)

Absolutely irreducible modular `ρ` in characteristic two, full-Hecke weight-two witness at `Γ1(M)∩Γ0(q)`, and Buzzard’s global multiplicity-one condition. `r∤2Mq` and the actual Frobenius matrix has nontrivial order two; it is a Jordan involution, not a scalar matrix. The localized dyadic `Γ1` degeneracy/saturation and full-Hecke `a₂` comparison are supplied by the ModularCurvesPartII §15.7 and the coefficient comparison of §1.1 here extension.

Use the even order of the absolutely irreducible residual image and Chebotarev to choose r with involution Frobenius. Apply the dyadic integral level-raising argument on the full-Hecke lattice, retaining `T₂`. Lift the r-new support with its prescribed residual `a₂` eigenvalue.

*Needs:* [Buzzard’s global multiplicity-one condition](#buzzard-multiplicity-one), `ArithmeticGaloisRepresentations:Layer 4`, `Chebotarev:Layer 10`, `ModularCurvesPartII:§§15.1–15.8`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- In characteristic two a nontrivial involution has trace zero but one-dimensional eigenspace; distinct-root arguments do not apply.

- Dropping `T₂` loses the stated `a₂` conclusion.

- No claim that the odd-characteristic Theorem 5.1 applies at `ℓ=2`.

<a id="buzzard-mod-two-level-lowering"></a>

### 5.6 Buzzard’s mod-two lowering theorem

Let `q∤2M` and f be a normalized weight-two form on `Γ1(M)∩Γ0(q)`, with absolutely irreducible residual `ρ`. Assume `ρ` is unramified at q, satisfies Buzzard’s global multiplicity-one condition, and is not induced from Q(i). Require M odd when `ρ` is finite flat at 2 and `v_2(M)=1` otherwise. Then `ρ` arises from a weight-two form at level M, with `a_2` congruent to that of f. The unramifiedness hypothesis is added explicitly: it is used by the published proof but omitted from the printed statement of Theorem 2.8. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Theorem 2.8, p. 103; proof pp. 104–107, especially p. 105. Unramifiedness is required by the proof.) ([Kenneth A. Ribet and William A. Stein](https://wstein.org/papers/serre/ribet-stein.pdf), Theorem 3.19 and proof, author pp. 49–51. Later statement explicitly includes unramifiedness at the removed prime.)

`q∤2M`; `ρ` unramified at q; absolute irreducibility. Global multiplicity one; correct dyadic level parity; non-Q(i)-induced representation. Coefficient DVR extension and residue embedding are allowed.

Normalize characters with the dyadic Carayol lemma, preserving `a₂`. If Frobenius at the removed q is nonscalar, use the `Γ1(M)∩Γ0(q)` bad-fibre torus and Eisenstein component-group comparison; unramifiedness identifies the residual torsion with its reduction. In the scalar-q case, raise at an auxiliary r with involution Frobenius using the dyadic `a₂-preserving` milestone. Assuming no descent at q forces qr-new support. Use the `Γ1` false-point discriminant-qr Shimura Jacobian and the integral sequence `0→Y_q→L_r→X_r→0`. Absence of descent gives `(X_r)_m=0`. Global multiplicity one and the involution Frobenius at r bound `dim(L_r/mL_r)≤1`. Unramifiedness, nonzero quaternionic support and Eisenstein component terms give `dim(Y_q/mY_q)≥2`. Exact localization identifies these residue spaces, a contradiction. Lift the lower-level full-Hecke support, retaining `a₂`; no odd-characteristic splitting inequality is reused.

The corrected hypothesis is part of the mathematical target. Buzzard's published Theorem 2.8, p. 103 omits unramifiedness at q; the proof, p. 105 uses it. Ribet–Stein Theorem 3.19, author pp. 49–51 includes it explicitly. If `ρ` were ramified at q, its prime-to-two conductor would contain q, making a level-M conclusion with `q∤M` impossible. Use the corrected formulation in every application.

*Needs:* [Buzzard’s global multiplicity-one condition](#buzzard-multiplicity-one), [Carayol’s character lemma mod two](#buzzard-carayol-lemma-mod-two), [Monodromy comparison for lowering](#monodromy-pairing-component-group), [Residual support and eigenvalue descent](#eigensystem-level-descent), [Dyadic auxiliary level raising with a₂ control](#dyadic-involution-level-raising), `ModularCurvesPartII:§§12.2–12.4`, `HilbertModularVarietiesAndShimuraCurves:§§R18.5.15–R18.5.18`.

**Checks.**

- A residual representation ramified at q is rejected, since its conductor cannot divide M.

- The `ℓ=2` proof does not assume +1 and `−1` are distinct.

- The output preserves `a_2` modulo the coefficient prime.

<a id="buzzard-removing-two-from-the-level"></a>

### 5.7 Dyadic level and weight bridge

For odd N, a weight-two eigenform at level 2N yields, modulo 2, a weight-three Katz eigensystem at level N, and the reverse weight-three-to-weight-two passage is available with the character and `U_2` data of Buzzard Lemma 1.2. More generally Proposition 1.3 removes arbitrary 2-power level and gives weight two at N when `ρ` is finite flat at 2, and weight two at 2N (or weight three at N) when it is not. This is a classical/Katz comparison with changed weight and potentially 2-primary characteristic-zero character. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Proposition 1.1, Lemma 1.2 and Proposition 1.3, pp. 96–100. Removal of powers of two and the weight-two/weight-three comparison.) ([Benedict H. Gross](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf), Proposition 8.18, p. 477; Proposition 9.3, pp. 478–479. Exact small-weight geometric sequence and lifting.)

`ρ` irreducible modular mod two, N odd; source geometric weight-two/weight-three sequence. The finite-flat distinction and Gross’s lifting boundary are applied before selecting the final weight.

Use the dyadic twisting/Eisenstein/trace construction with its actual character parity. Apply the geometric sequence comparing weight two at 2N and weight three at N. Use the nonfinite weight-three boundary and Hasse comparison to distinguish the finite-flat branch. Lift the resulting residual eigensystem without demanding a trivial characteristic-zero 2-primary character.

*Needs:* `AlgebraicModularFormsAndSerreWeights:R15.3`, `ModularCurvesPartII:§§7.1–7.2, 11.1`, [Weight p+1 and finite-flatness](#weight-p-plus-one-and-finiteness), `AlgebraicModularFormsAndSerreWeights:R15.5`.

**Checks.**

- Finite image is insufficient for the finite-flat branch.

- Odd weight three can have a characteristic-zero character nontrivial at `−1` whose reduction is trivial.

- The weight-two at 2N conclusion in the nonfinite branch does not assert tame level N in weight two.

<a id="buzzard-level-lowering-to-the-conductor"></a>

### 5.8 Dyadic lowering to the conductor

If an irreducible modular mod-two `ρ` satisfies Buzzard multiplicity one and is not Q(i)-induced, then it has a weight-two characteristic-zero witness of level N if finite flat at 2 and level 2N otherwise, where N is its full prime-to-two conductor. If the initial witness has odd level, `a_2` can be preserved modulo the coefficient prime. The proof treats principal-series, unramified-special, residually trivial ramified-special twists and the tame supercuspidal defect separately. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Theorem 3.1 and proof, pp. 107–108. Four local defect cases and the full-conductor induction; supercuspidal character replacement is the separate integral quaternionic transfer input.)

Already modular, global multiplicity one and non-Q(i)-induced. N is the full conductor, including wild exponents at odd primes.

First normalize the 2-power level. For each odd q with excess exponent dispatch the four local defect cases. In the supercuspidal case transfer to the quaternion algebra ramified at q and infinity, replace the congruent local character with the exact lower-level type, and transfer back; retain the coefficient field and integral character input in the supplier contract. Repeat until the excess-exponent measure is zero, preserving `a_2` wherever the theorem specifies.

*Needs:* [Buzzard’s mod-two lowering theorem](#buzzard-mod-two-level-lowering), [Dyadic level and weight bridge](#buzzard-removing-two-from-the-level), [Carayol’s character lemma mod two](#buzzard-carayol-lemma-mod-two), [Removing a residually trivial special twist](#twist-away-ramified-character), `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`.

**Checks.**

- A wild conductor factor cannot be removed merely because q divides the level.

- The theorem excludes Q(i)-induced representations.

- The separate integral transfer contract is stronger than a rational Jacquet–Langlands correspondence alone.

<a id="buzzard-weight-and-level-mod-two"></a>

### 5.9 Buzzard’s combined weight and level theorem

For irreducible modular mod-two `ρ` satisfying Buzzard multiplicity one, there is a characteristic-zero normalized eigenform at its prime-to-two conductor N in weight two if `ρ` is finite flat at 2 and weight three otherwise. In the Q(i)-induced case lift the inducing odd-order character to a classical weight-one form of level 4N and apply the dyadic bridge directly; this does not invoke Theorem 2.8 on a representation it excludes. In the other case apply conductor lowering and the bridge. Classical even Serre weight four in the nonfinite branch is obtained by a Hasse-weight change, with its character conventions retained. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Theorem 3.2 and proof, pp. 108–109. Separate Q(i) induction and weight-three branch, with the character qualification.)

Modularity witness and global multiplicity one. The character of the weight-three characteristic-zero witness is not required to have odd order. Canonical character replacement in the finite-flat branch is asserted by Corollary 2.7 only when not Q(i)-induced.

Recognize Q(i)-induction and lift its finite odd-order character for the independent weight-one construction. In the remaining case lower to N or 2N by Theorem 3.1. Use the weight-three/weight-two bridge and Hasse comparison to translate into the chosen classical convention.

*Needs:* [Dyadic lowering to the conductor](#buzzard-level-lowering-to-the-conductor), [Dyadic level and weight bridge](#buzzard-removing-two-from-the-level), `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `AlgebraicModularFormsAndSerreWeights:R15.4, The dyadic weight dichotomy`.

**Checks.**

- Q(i)-induced is a distinct proof branch.

- Weight three and classical weight four are not identified.

- No universal Katz weight-one minimum is inferred.

<a id="wiese-dihedral-weight-one"></a>

### 5.10 Dihedral weight-one witness and classical export

Import Wiese’s dihedral weight-one realisation from GL2AutomorphicRepresentationsAndTransfer §R17.6.12 in characteristic two and GL2AutomorphicRepresentationsAndTransfer Layer R17.5’s finite-image weight-one induction in odd characteristic.  This roadmap uses this witness in the scalar dyadic conductor/weight export; it does not reconstruct the odd-lift trick or the auxiliary-prime descent owned by R17.6. A characteristic-zero lift is not required in the dyadic Katz branch. ([Gabor Wiese](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Theorem 9 and proof, pp. 130–131; Proposition 7 and Corollary 8, pp. 128–130. All-characteristic dihedral weight-one result, including the nonliftable branch.)

Odd irreducible dihedral representation; unramified at p. Character det `ρ` with the actual Katz normalization; no global residual modularity input for this proved dihedral base case.

Apply GL2AutomorphicRepresentationsAndTransfer §R17.6.12’s weight-one theorem in the appropriate characteristic. Match its conductor and determinant normalization to this roadmap’s imported conductor and recipe. Use Hasse and eigenvalue lifting for the classical weight-two export, leaving the Katz witness intact.

*Needs:* `GL2AutomorphicRepresentationsAndTransfer:§R17.6.12`, `GL2AutomorphicRepresentationsAndTransfer:§R17.5.9`, `AlgebraicModularFormsAndSerreWeights:R15.3, The elliptic Hasse invariant`.

**Checks.**

- The nonliftable mod-two real-quadratic example of conductor 229 is admitted.

- A non-dihedral representation is not certified by this theorem.

- The conclusion is Katz weight one, not necessarily a characteristic-zero weight-one lift.

<a id="dyadic-scalar-multiplicity-one-obstruction"></a>

### 5.11 Scalar dyadic boundary of multiplicity one

The decomposition-group restriction at two is scalar exactly in the remaining local branch not certified by Buzzard Proposition 2.4. It is unramified and finite flat. If a tame Katz weight-one witness is known, Wiese’s scalar result gives multiplicity at least two in the indicated full Hecke factor; thus the multiplicity-one method cannot be assumed there. Dihedral representations have Wiese’s independent weight-one witness. The non-dihedral scalar classical level/weight completion is assigned to ClassicalSerreModularity, scalar dyadic completion and appears only in the export manifest, not as an early prerequisite. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Proposition 2.4, pp. 101–102; remarks to Theorem 3.1, p. 107. Boundary of the nonscalar and multiplicity-one method.) ([Gabor Wiese](https://msp.org/ant/2007/1-1/ant-v1-n1-p04-p.pdf), Corollary 4.5, pp. 78–79; Corollary 4.2, p. 77. Conditional failure of multiplicity one in the scalar branch.) ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, author pp. 1–2. KW identifies this remaining non-dihedral scalar level-control case.)

Irreducible modular dyadic `ρ`; actual scalar local representation, not simply repeated characteristic-polynomial roots. The multiplicity lower bound needs Wiese’s precise Jacobian/full-Hecke setup and weight-one witness.

Prove scalar local restrictions unramified by local reciprocity and odd-order image. Separate dihedral weight-one realisation from the general dyadic Katz refinement outside this scope. The classical non-dihedral scalar completion is an output interface for ClassicalSerreModularity, as recorded in §6.12; it is not a hypothesis of the results here.

*Needs:* [Scalar Frobenius has multiplicity at least two](#scalar-multiplicity-at-least-two), [Dihedral weight-one witness and classical export](#wiese-dihedral-weight-one), [Scalar dyadic local restrictions](#scalar-dyadic-restriction-is-unramified).

**Checks.**

- This comparison records the scope of multiplicity one; the scalar calculation alone proves no nonexistence of an optimised classical witness.

- A Jordan block with equal roots is nonscalar.

- Every early optimisation argument is independent of the ClassicalSerreModularity’s scalar dyadic completion scalar completion.

### Examples

For `r≡3` mod 4, the even weight-two character has `ψ_r(−1)=1`. An r-character congruent to one has 2-power order; the parity condition removes the only possible factor of two because `r−1` has exactly one such factor. It is therefore trivial. An unramified-special two-dimensional component has trace `(r+1)a=0` modulo two, which contradicts the chosen nonzero auxiliary trace and permits removal of r.

If the entire `G_Q2` restriction is scalar, its scalar character has odd-order finite image. Local reciprocity's pro-two inertia image is killed, giving an unramified, finite-flat restriction. A nonsplit upper-triangular extension of the same character by itself is a negative control: its matrices are not all scalar, and this argument does not apply to it.

### Dependencies

The external inputs are `AlgebraicModularFormsAndSerreWeights:R15.3`, `AlgebraicModularFormsAndSerreWeights:R15.3, The elliptic Hasse invariant`, `AlgebraicModularFormsAndSerreWeights:R15.4, The dyadic weight dichotomy`, `AlgebraicModularFormsAndSerreWeights:R15.5`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ArithmeticGaloisRepresentations:Layer 4`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `GL2AutomorphicRepresentationsAndTransfer:§R17.5.9`, `GL2AutomorphicRepresentationsAndTransfer:§§R16.3.1–R16.3.5, R17.6.4`, `GL2AutomorphicRepresentationsAndTransfer:§R17.6.12`, `HilbertModularVarietiesAndShimuraCurves:§§R18.5.15–R18.5.18`, `ArithmeticGaloisRepresentations:§§1.7–1.8`, `ModularCurvesPartII:§§7.1–7.2, 11.1`, `ModularCurvesPartII:Layers 13–14`, `ModularCurvesPartII:§§13.5, 14.13–14.15`, `ModularCurvesPartII:§§15.1–15.8`, `ModularCurvesPartII:§§12.2–12.4`, `DirichletCharacter`, `Chebotarev:Layer 10`. Their exact contracts are stated above; each target specifies the comparisons it uses.

## Layer 6: Exports for Serre and elliptic curves

The rational exports make their input modularity explicit. The elliptic weight-two result may retain coefficient-prime level; its large-good-prime counterpart is the version EllipticCurveModularity can consume from residual modularity alone. The totally real targets then specify the data, determinant choices, allowable fields and local types of Khare–Wintenberger II §8. This optimisation precedes the modularity-lifting theorems that consume it.

<a id="reduced-level-of-elliptic-curve"></a>

### 6.1 Reduced elliptic level M₀

For an elliptic curve E/Q with conductor `M>0` and nonzero minimal discriminant `Δ`, and prime `ℓ≥3`, set `M₀=M/∏q`, where q runs through primes with `v_q(M)=1` and `ℓ∣v_q(Δ)`. The prime `q=ℓ` is included if it meets the conditions; `M₀` can therefore retain or remove `ℓ`. It divides M and removes only primes occurring to exponent one in M. At `ℓ≥5`, away from `ℓ`, the imported residual conductor formula identifies its prime-to-`ℓ` part with `N(E[ℓ])` when `E[ℓ]` is irreducible. `M₀` itself is not defined as that prime-to-`ℓ` conductor. ([Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Equation (3), p. 358. The exact removed-prime set, including the coefficient prime.)

`M>0`, `Δ≠0`, `ℓ` prime at least three. `v_q` is the exponent valuation, not the prime power `q^{v_q}`. Residual-conductor comparison at `ℓ≥5` uses NeronModelsAndSemistableAbelianVarieties §5.3h’s actual elliptic-torsion theorem; no naive additive formula at `ℓ=3`.

Define the finite product by filtering M’s distinct prime factors. Its factors each occur exactly once, so the product divides M. Apply the supplied local elliptic conductor comparison only away from `ℓ` and in its valid characteristic range.

For the arithmetic representative signature use the finite set of prime divisors of M, retain those satisfying `v_q(M)=1` and `ℓ∣v_q(|Δ|)`, and divide by their product. `reducedLevel_pos` is the positive-input part of the API; `reducedLevel_prime_removed_iff` and `reducedLevel_retains_higher_exponent` are the corresponding prime tests. Its value at `M=1` is one. These computations only test the arithmetic definition: they do not certify that a chosen discriminant model comes from an elliptic curve or that its torsion representation is irreducible.

The definition has the following named operations and comparisons, under these hypotheses:

- `reducedLevel`: M divided by the product of primes `q∥M` with `ℓ∣v_q(Δ)`.

- `reducedLevel_dvd`: `M₀` divides M. The separate `reducedLevel_pos` gives positivity when `M>0`.

- `reducedLevel_prime_removed_iff`: For `q∥M`, `q∤M₀` exactly when `ℓ∣v_q(Δ)`.

- `reducedLevel_retains_higher_exponent`: For `v_q(M)>1` the exponent of q in `M₀` equals its exponent in M.

- `reducedLevel_away_conductor`: At `ℓ≥5` and irreducible `E[ℓ]`, the prime-to-`ℓ` part of `M₀` is the imported `N(E[ℓ])`.

- `reducedLevel_ext`: Replacing `Δ` by another nonzero integer with identical valuations at primes `q∥M` leaves `M₀` unchanged; in particular changing the sign of `Δ` does not change it.

- `reducedLevel_simp`: For `M=1` the removed product is empty and `M₀=1`. The exponent-divisibility test at `q∥M`, including `q=ℓ`, is `reducedLevel_prime_removed_iff`.

- The arithmetic implementation uses Mathlib `Nat.primeFactors` and `padicValNat` on `Δ.natAbs` at prime q, `M>0` and `Δ≠0`; these are exponent valuations, not the largest prime power.

- `reducedLevel_isomorphic_model`: Transport by an elliptic-curve isomorphism preserves conductor and minimal discriminant valuations, hence `M₀`. Arbitrary nonminimal coordinate changes are excluded; the arithmetic function has no universal-property construction.

- `reducedLevel_coefficient_prime_example`: For `M=33`, `ℓ=3` and `Δ=3⁶·11²`, `M₀=11`, so the coefficient prime itself can disappear.

Its applications are [Elliptic residual weight-two newform](#weight-two-newform-at-reduced-level): The optimized weight-two level. [Trace congruences at good and removed primes](#removed-prime-trace-congruence): Select removed multiplicative primes with `q≠ℓ`. EllipticCurveModularity, large-good-prime application: Obtain a bounded list of levels for large good coefficient primes.

*Needs:* `Nat.primeFactors`, `padicValNat`, `NeronModelsAndSemistableAbelianVarieties:§5.3h`.

**Checks.**

- `M=33`, valuations `v_3(Δ)=6` and `v_11(Δ)=2`, `ℓ=3` gives `M₀=11`. `(reduced_33.)`

- `M=141`, valuations `v_3(Δ)=7` and `v_47(Δ)=1`, `ℓ=3` gives `M₀=141`. `(reduced_141_keep_three.)`

- For the same M and valuations, `ℓ=7` gives `M₀=47`. `(reduced_141_seven.)`

- `M=3²·5` and `v_3(Δ)=v_5(Δ)=7`, `ℓ=7` gives `M₀=9`, retaining the higher conductor exponent at 3. `(reduced_higher_exponent.)`

- For `E=141a1`, with equation `y²+y=x³+x²−12x+2`, conductor 141 and minimal discriminant `3⁷·47`, `ℓ=3` gives `M₀=141`, `N(E[3])=47` and classical Serre weight four. ([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §1.4, author pp. 12–13.)

- A higher conductor exponent is never stripped by this formula.

- The analytic newform at `M₀` is not automatically a form at the prime-to-`ℓ` Serre conductor.

<a id="weight-two-newform-at-reduced-level"></a>

### 6.2 Elliptic residual weight-two newform

If E/Q is supplied with a weight-two trivial-character modularity witness at its conductor M, and `E[ℓ]` is irreducible for a prime `ℓ≥3`, there is a normalized cuspidal newform f of weight two, trivial character and level `M₀`, and a prime `λ|ℓ` in its coefficient field with `ρ_{f,λ}≅E[ℓ]` after scalar extension. For trivial character the coefficient field is totally real. The modularity of E is an input, rather than imported from the downstream all-elliptic-curves theorem. ([Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Theorem 3 and surrounding explanation, p. 359. Stated elliptic result made conditional on the already supplied modularity witness, preventing a circular import.)

An actual modularity witness for E at M; `ℓ≥3` and irreducible `E[ℓ]`. `M₀` is the definition above, retaining coefficient-prime level when needed. The newform and `λ` may have nonrational coefficient field.

Use the Tate-curve local criterion at multiplicative `q∥M` with `ℓ∣v_q(Δ)` and `q≠ℓ`. Iterate weight-two trivial-character lowering at these primes. Handle a removed coefficient prime with the exact finite-flat elliptic local weight-two input; the `ℓ=3` variant is a separate supplier contract rather than inferred from the `ℓ≥5` recipe. Take the source’s normalized newform at `M₀` and compare the residual representations at `λ`.

*Needs:* [Reduced elliptic level M₀](#reduced-level-of-elliptic-curve), [Ribet lowering at an unramified prime](#level-lowering-unramified-prime), [Finite-flat weight-two optimisation](#finite-flat-weight-two-optimisation), `AlgebraicModularFormsAndSerreWeights:R15.5A.2–R15.5A.3, R15.6`, `HeckeRing.GL2.Newform`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `ArithmeticGaloisRepresentations:§6.3`.

**Checks.**

- The elliptic residual representation must be irreducible.

- For `E=141a1`, given by `y²+y=x³+x²−12x+2`, conductor 141 and minimal discriminant `3⁷·47`, `ℓ=3` gives a weight-two witness at `M₀=141`, whereas `N(E[3])=47` has classical Serre weight four. ([Ribet–Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §1.4, author pp. 12–13.)

- The proof does not cite the final EllipticCurveModularity modularity theorem.

<a id="removed-prime-trace-congruence"></a>

### 6.3 Trace congruences at good and removed primes

With `E,f,λ,M` and `M₀` as above, if `q∤ℓMM₀` then `a_q(E)≡a_q(f)` mod `λ`. If `q∤ℓM₀` and `q∥M`, then `a_q(f)≡±(q+1)` mod `λ`. The sign is the split/non-split multiplicative local sign, not a freely chosen equality at each prime. The removed-prime congruence is not asserted at `q=ℓ`. ([Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Lemma 2.1(i)–(ii), p. 359. Good-prime trace and removed-prime special trace, retaining `q≠ℓ`).

The modular f and coefficient prime of the previous theorem. Good-prime or removed-multiplicative-prime hypotheses as stated, respectively.

At good q compare both characteristic polynomials by the residual isomorphism. At removed multiplicative q use the Tate-curve special local shape and take its unramified residual trace. Identify the local sign and transport the congruence to the chosen residue embedding.

*Needs:* [Elliptic residual weight-two newform](#weight-two-newform-at-reduced-level), `ArithmeticGaloisRepresentations:§6.3`, `AlgebraicModularFormsAndSerreWeights:R15.5A.2–R15.5A.3, R15.6`.

**Checks.**

- The residue embedding is part of the congruence when f has nonrational coefficients.

- The condition `q∤ℓM₀` excludes `q=ℓ`.

- A prime of additive reduction with `v_q(M)>1` is not in the second branch.

<a id="large-good-prime-elliptic-optimisation"></a>

### 6.4 Large good-prime elliptic optimisation

For a fixed elliptic curve E/Q of conductor M and every sufficiently large good prime `ℓ` for which `E[ℓ]` is irreducible and already modular, there is a weight-two trivial-character newform giving `E[ℓ]` at level `N(E[ℓ])=M₀` dividing M. Here `ℓ∤M` and `ℓ≥5`, so the residual elliptic conductor formula and finite-flat recipe apply. The hypothesis is residual modularity of `E[ℓ]`, not characteristic-zero modularity of E. Consequently, if residual modularity is supplied for infinitely many sufficiently large good `ℓ`, all witnesses lie in a finite set of weight-two trivial-character newforms of divisor levels of M, as needed by EllipticCurveModularity’s characteristic-zero deduction. ([Michael A. Bennett and Samir Siksek](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Equation (3), Theorem 3, pp. 358–359. Bounded weight-two trivial-character residual witnesses.) ([Kenneth A. Ribet and William A. Stein](https://wstein.org/papers/serre/ribet-stein.pdf), §2.4, author pp. 30–31; §§1–3 character conventions. Elliptic optimization and the distinction from an unconditional modularity input.)

Fixed E/Q, M its conductor, `ℓ≥5` of good reduction; `E[ℓ]` irreducible and already modular. For an infinitely-many-primes export, supply residual modularity and irreducibility for infinitely many good primes; the proof does not assume modularity of E. Bounded-level character orders are finite; character replacement uses the `ℓ≥5`, weight-two case and predicted residual trivial character.

At a good `ℓ` use the finite-flat elliptic torsion model and determinant `χ_ℓ`. Apply Layer 4 to the already modular residual representation, obtaining weight two at its full tame conductor. Since the predicted residual nebentypus is one, its canonical prime-to-`ℓ` lift is the trivial character. Use NeronModelsAndSemistableAbelianVarieties §5.3h’s `ℓ≥5` formula to identify the conductor with `M₀` and obtain `M₀∣M`; bounded divisor levels and finite-dimensional newform spaces give a finite set of witnesses.

*Needs:* [Finite-flat weight-two optimisation](#finite-flat-weight-two-optimisation), [Reduced elliptic level M₀](#reduced-level-of-elliptic-curve), [Congruent nebentypus at fixed level](#nebentypus-congruent-character), `NeronModelsAndSemistableAbelianVarieties:§5.3h`, `ArithmeticGaloisRepresentations:§§6.1–6.4`, `HeckeRing.GL2.Newform`.

**Checks.**

- The export requires only modularity of `E[ℓ]`.

- A coefficient prime `ℓ` dividing M is excluded from this good-prime statement.

- The finite newform set includes all divisor levels, retaining higher prime exponents.

<a id="scalar-dyadic-restriction-is-unramified"></a>

### 6.5 Scalar dyadic local restrictions

A continuous scalar two-dimensional representation of `G_Q2` over a finite field of characteristic two is unramified: its scalar character has odd-order image, whereas local reciprocity identifies inertia’s abelian image with `Z_2×`, a pro-two group. It also has a finite étale, hence finite-flat, local model. Therefore the scalar dyadic branch has classical Serre weight two under the imported recipe. ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, author pp. 1–2. The scalar dyadic finite weight-two case singled out for classical completion.) ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Introduction and Proposition 2.4, pp. 95, 101–102. Scalar local branch boundary; unramifiedness here follows from the stated local reciprocity argument.)

The entire local representation is scalar, not merely its semisimplification. Finite coefficient field and continuity.

Factor the scalar character through local abelianization. Kill the pro-two unit group in its odd-order target. Extend the resulting unramified finite Galois module étale over `Z_2` and apply the local recipe.

*Needs:* `ClassFieldTheory:Layer 7`, `AlgebraicModularFormsAndSerreWeights:R15.4, The dyadic weight dichotomy`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

**Checks.**

- A nonsplit upper triangular extension of a character by itself is not scalar.

- The odd-order finite target is essential.

- The assertion concerns `Q_2`, not arbitrary ramification conditions at every finite place.

<a id="kw-optimisation-data"></a>

### 6.6 KW optimisation data

For an S-type residual `ρ:G_Q→GL2(k)`, p odd with `2≤k(ρ)≤p+1` and cyclotomic absolute irreducibility, or `p=2` with nonsolvable image, choose the KWII §8.1 totally real solvable field F/Q of even degree, unramified at p, split at p if `ρ_p` is irreducible or `k(ρ)=p+1`, preserving the required image and cyclotomic irreducibility. Require `ρ_F` unramified away from p and locally trivial at p when `ρ_p` was unramified. Fix an arithmetic character `ψ`, unramified outside p, with det lift `ψχ_p` and unit restriction (i) `Norm^{2−k(ρ)}`, (ii) `ω_p^{k(ρ)−2}`, or (iii) `Norm^{1−p}` when `k(ρ)=2`; `p=2` uses only (ii). Include `β` (weight two, `conductor≤v` at p) in every case, and `α` (parallel `k(ρ)`, spherical at p) when `p>2` or `p=2`, `k(ρ)=2`. The dyadic weight-four data have no α field. Include the prescribed local lifting data A/B/C of §8.3. Allowable changes F′/F are totally real solvable of even degree, unramified at p, split where required, and preserve image and the appropriate cyclotomic irreducibility; odd-p constructions below can require complete splitting at p. ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Definition 7.9 and Lemma 7.10, author pp. 68–69; §8.1 and Lemma 8.1, author p. 70; §8.2 and Theorem 8.2, author pp. 70–71; §8.3 lifting data, author pp. 74–75. The concrete field, determinant, witnesses and local-type package for optimization, including disjointness and prescribed square-root adjustment.)

S-type means continuous, absolutely irreducible and totally odd, with the image restrictions above. The field, `ψ`, residual scalar extensions, β and the conditionally required α are input data to Theorems 8.2 and 8.4, actual modular representations. At `p=2` require nonsolvability of the residual image; at `p>2` retain cyclotomic absolute irreducibility. Local lifting data specify at each place its ramification, determinant and unramified square-root `γ` where a special type is requested. The p-local A/B/C choice is simultaneous at all p-places: A has a common crystalline weight k, B and C have weight two, and B has a fixed inertial exponent in all embeddings. The determinant character is the corresponding type in §8.3.

Use the supplied solvable-field approximation and disjointness input to remove outside-p residual ramification without losing image. Choose `ψ` with its exact arithmetic unit type; align determinants using ArithmeticGaloisDuality §R02.6.2, Finite-order determinant twists (KWII Lemma 7.10). The compared characters have equal reductions, agree on open p-local units and all units at the prescribed split places, and have totally even ratio; retain all these hypotheses for the residually trivial twist and disjoint solvable change. Record β, α in its required branches, and local type choices with the actual restrictions in §8.3, rather than assuming existence of a global modular lift of every type.

Use the following determinant choices on each p-local unit group. In the source, the lift has determinant `ψχ_p`. Keep this arithmetic determinant normalization when transferring between Galois and automorphic descriptions.

| Choice | Unit restriction of `ψ` | Weight application |
| --- | --- | --- |
| (i) | `Norm^{2−k(ρ)}` | Parallel weight `k(ρ)` |
| (ii) | `ω_p^{k(ρ)−2}` | Weight two with the prescribed tame p-type |
| (iii), `k(ρ)=2` | `Norm^{1−p}` | Parallel weight p+1 |

Here `ω_p` denotes the Teichmüller character in the source's local reciprocity convention. At `k(ρ)=2`, (i) and (ii) both have trivial unit restriction; these labels record two constructions rather than disjoint mathematical cases. At `p=2` use (ii). ArithmeticGaloisDuality §R02.6.2, Finite-order determinant twists (KWII Lemma 7.10), aligns the determinant after a residually trivial twist and a controlled extension, with the equal-reduction, total-evenness, local-unit and dyadic Grunwald–Wang conditions retained. It also retains the chosen unramified square root at special places, rather than just its square.

The definition has the following named operations and comparisons, under these hypotheses:

- `kwOptimisationData`: The field, determinant character, witnesses and local lifting choices satisfying §8’s hypotheses.

- `kwOptimisationData_allowable_comp`: Allowed solvable changes compose, preserving image, p-local requirements and determinant.

- `kwOptimisationData_det_restriction`: The transported determinant is `ψ|G_F′·χ_p` and reduces to det `ρ_F′`.

- `kwOptimisationData_type_constraints`: A is crystalline weight `2≤k≤p+1` with p+1 only in the split `k(ρ)=p+1` case; B is weight-two potentially crystalline over `Q_p^nr(μ_p)` with WD inertia `ω_p^{k−2}⊕1`; C is noncrystalline semistable weight two with diagonal `γχ_p,γ` and `γ²=ψ_v`.

- `kwOptimisationData_ext`: Equal underlying field/character/module choices and witness identifications determine the same data, with proof fields irrelevant; transported field data are compared by the designated field isomorphism.

- `kwOptimisationData_projections`: Expose F, residual restriction, `ψ`, β in every branch, α only for `p>2` or dyadic weight two, local types and selected square roots; projection formulas hold for the constructor.

- `kwOptimisationData_restrict_simp`: Restriction leaves `ψχ_p` as the determinant and sends each chosen local `γ_v` to its restriction, rather than merely preserving `γ_v²`.

- `kwOptimisationData_coeff_transport`: Compatible coefficient extensions transport all witnesses, residual embeddings and chosen roots; field/base-change and coefficient transport obey identity and composition.

- `kwOptimisationData_suppliers`: Use HilbertModularVarietiesAndShimuraCurves coefficient modules, LocalGaloisDeformationRings locally admissible types, GlobalGaloisDeformations determinants and GL2AutomorphicRepresentationsAndTransfer base change. This is a bundle of constrained choices, not a free object, so no independent universal-property theorem is applicable.

- `kwOptimisationData_dyadic_example`: At `p=2` the recipe-weight-four branch has a weight-two special lift with its selected unramified square root; it is not a crystalline weight-four choice.

Its applications are [KW minimal modular lifts](#kw-minimal-modular-lifts): Fix hypotheses, `Σ` and determinant for Theorem 8.2. [KW prescribed-local-type modular lifts](#prescribed-local-type-lifts): State exactly which local data Theorem 8.4 realizes. `GlobalGaloisDeformations:§§4.4, 4.8–4.11`: The optimization witness must land in the intended fixed-determinant quotient.

*Needs:* `ArithmeticGaloisRepresentations:Layer 4`, `GlobalGaloisDeformations:§§4.4, 4.8–4.11`, `ArithmeticGaloisDuality:§§R02.4.5b–R02.4.6`, `ArithmeticGaloisDuality:§R02.6.2, Finite-order determinant twists`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `ClassFieldTheory:Layers 11–12`.

**Checks.**

- At `k(ρ)=2` the unit restrictions (i) and (ii) both equal one. `(kw_k2_overlap.)`

- An even totally real solvable extension intersecting the residual kernel field and shrinking image is rejected. `(kw_bad_image.)`

- At `p=2`, `k(ρ)=4` the data require β and have no α field. They require the weight-two semistable C branch rather than the `k(ρ)=2` crystalline A branch. `(kw_p2_type.)`

- A special local `γ` with `γ²≠ψ_v` fails the fixed determinant, even if its reduction is correct. `(kw_wrong_square_root.)`

- At `p=2`, `F=Q`, `ψ=1`, `ψ′` the character of Q(i), and prescribed split place 3, reductions and local-unit conditions agree but the ratio is odd. No totally real base change admits `ζ²ψ=ψ′`, since a character square has value 1 at complex conjugation.

- The determinant choice is preserved under field restriction and the specified twist.

- A field killing the residual image fails the allowable condition even if totally real.

- Cases (i) and (ii) coincide at `k(ρ)=2`; they are not disjoint tags.

- F/F has degree one and is not an allowable change under the even-degree definition. Restriction along the identity still preserves the data; its identity law does not assert an allowable degree-one extension.

<a id="kw-minimal-modular-lifts"></a>

### 6.7 KW minimal modular lifts

Under the KW optimisation setup, assume both `α` and `β` for `p>2`; for `p=2` assume `β` and `α` when `k(ρ)=2`. Let `Σ` be a subset of the Steinberg places of the chosen witness `π`, with no p-place in the `α` branch; in the `β` branch with `k(ρ)=2` it contains every Steinberg p-place. After allowable base change F″/F, split at p for `p>2`, there is `π″` lifting `ρ_F″`, spherical outside `Σ∪{p}`, Steinberg over `Σ`, and with the exact p-local and determinant cases listed below: `p=2` weight two crystalline if `k(ρ)=2` away from `Σ` or Steinberg at every p-place if `k(ρ)=4`; odd-p case (i) weight `k(ρ)` spherical outside `Σ` at p, case (ii) weight two with U1(v) invariants when `k(ρ)<p+1` and U0(v) invariants at `k(ρ)=p+1`. The `k(ρ)=2`, `Σ∩{v|p}=∅` case also admits parallel weight p+1 with determinant choice (iii). ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Theorem 8.2 and proof, author pp. 71–74. All determinant, p-local, `Σ` and base-change branches, including `p=2` square-root control.)

KW data, β and the conditionally required α, precise permitted initial `π` and `Σ` from Theorem 8.2. At `p=2` use `ψ` of type (ii); the `k(ρ)=4` Steinberg `U_v` eigenvalue is the chosen unramified square-root `ψ′_v` after restriction. Case (i) can use `α`, or `β` when `k(ρ)=2`; cases (ii) use `β`.

By allowable changes make unwanted away-p ramification Steinberg and arrange the p-part of residue-unit orders to dominate the stabilizer bounds of KW Lemma 7.3 (at `p=2` with order divisible by four). Choose the characters killing stabilizers and apply the HilbertModularVarietiesAndShimuraCurves §R18.3.24 contract (KW Lemma 7.4). It identifies the same liftable residual Hecke image for the two integral coefficient spaces; it does not identify arbitrary mod-p invariant spaces or give a Hecke-equivariant integral isomorphism. Lift residual eigenvalues in the twisted coefficient space; its nontrivial local characters force principal-series lifts at the unwanted places. A further allowable change removes that ramification while preserving `Σ` and the p-local data. Align `ψ` using ArithmeticGaloisDuality §R02.6.2, Finite-order determinant twists (KWII Lemma 7.10), with the equal-reduction, total-evenness and local-unit hypotheses of §6.6. Use HilbertModularVarietiesAndShimuraCurves §R18.3.32 for ramified signs and §R18.3.31 for unramified eigenroots/coinvariants; use Lemma 7.7 for local–global compatibility and Lemma 8.3 for the p+1 alternate branch.

The exact p-local alternatives are as follows. The modular witness chosen for each branch, its allowed `Σ`, the determinant choice and the output local invariants are joint data. Write `U₀(v)` for the upper-triangular congruence subgroup and `U₁(v)` for its subgroup with the specified lower-right residue entry equal to one, as in KW §8.

| Branch | Initial witness and `Σ` restriction | Output at p outside the required Steinberg places |
| --- | --- | --- |
| `p=2`, `k(ρ)=2` | `α` or `β`; both are assumed; `Σ` avoids p for `α` and includes the initial Steinberg p-places for `β` | Parallel weight two, spherical away from `Σ` at p |
| `p=2`, `k(ρ)=4` | `β` and choice (ii) | Weight two, Steinberg at every p-place, with the prescribed `ψ′_v U_v` eigenvalue |
| `p>2`, (i) | `α`, or `β` when `k(ρ)=2`; in the `α` branch `Σ` avoids p | Weight `k(ρ)`, spherical at p outside `Σ` |
| `p>2`, (ii), `k(ρ)<p+1` | `β`; when `k(ρ)=2`, `Σ` contains its Steinberg p-places | Weight two, `U₁(v)` invariants with the required determinant character |
| `p>2`, (ii), `k(ρ)=p+1` | `β` | Weight two, `U₀(v)` invariants |
| `p>2`, (iii), `k(ρ)=2`, `Σ` avoids p | The weight-two spherical output | Parallel weight p+1, spherical at p |

In every row the away-p output is spherical outside `Σ` and Steinberg at the places over `Σ`. The field change is allowable and is split at p when `p>2`. This table does not assert a lift over the original field or a type for arbitrary `Σ`. Use the coefficient-space residual Hecke-image comparison of HilbertModularVarietiesAndShimuraCurves §R18.3.24, with the stabilizer bounds and determinant/sign control. The dyadic argument does not follow from an odd-characteristic large-image Ihara theorem.

*Needs:* [KW optimisation data](#kw-optimisation-data), `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, [Weight-two to parallel p+1 change](#weight-two-to-p-plus-one), `HilbertModularVarietiesAndShimuraCurves:§R18.3.24`, `HilbertModularVarietiesAndShimuraCurves:§§R18.3.18, R18.3.25–R18.3.27, R18.3.31–R18.3.32`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`.

**Checks.**

- `Σ` is a subset of the initial Steinberg set and has its required p-place inclusion.

- The base change is part of the conclusion; no lift over the original F is asserted.

- Odd-characteristic large-image Ihara is not reused at `p=2`.

<a id="weight-two-to-p-plus-one"></a>

### 6.8 Weight-two to parallel p+1 change

In KWII Lemma 8.3’s setup with `p>2`, a parallel-weight-two cuspidal representation spherical at every p-place and with the prescribed weight-two determinant gives a residual modular witness of parallel weight p+1 spherical at all p-places, with unit determinant type `Norm^{1−p}`. On a p-place with residue field `k_v` of degree f over `F_p`, the coefficient decomposition uses `F[P1(k_v)]=1⊕V` and `V=⊗_{τ:k_v→F̄_p}Sym^{p−1}F̄_p²`, with the required determinant normalization. It is not a single `Sym^{p−1}` over `F_p` when `f>1`. ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 8.3 and proof, author pp. 73–74. Finite permutation module decomposition and repeated p-place weight change.)

`p>2`, spherical initial p-components, irreducible residual eigensystem and KW coefficient/neatness setup. All p-places and residue embeddings are included; coefficient extension allowed.

Pass at one p-place to Iwahori invariants and decompose the permutation module into the trivial and Steinberg coefficient factors. Use the exact residual Hecke support calculation to obtain a nonzero V-factor. Iterate over all p-places and identify the resulting parallel weight and determinant.

*Needs:* [KW optimisation data](#kw-optimisation-data), `HilbertModularVarietiesAndShimuraCurves:R18.3`, `AlgebraicModularFormsAndSerreWeights:R15.2`.

**Checks.**

- For residue degree `f=1` the Steinberg dimension is p.

- For residue degree `f=2` the tensor has dimension `p²`, not p.

- The determinant unit type changes from weight two to `Norm^{1−p}`.

<a id="quaternionic-level-raising"></a>

### 6.9 Quaternionic level raising

For `p>2`, in Kisin §3.1’s totally definite `S_{τ,ψ}(U,O)`, assume `U_v=GL2(O_v)` at v|p, finite free coefficients with the determinant-covariant perfect pairing, stabilizer orders prime to p, and a non-Eisenstein residual ideal m with `S_m≠0`. For `q∤p·disc(D)·level(U)`, assume `(T_q²−(Nq+1)²ψ(π_q))S_m⊆mS_m`. Then the two degeneracy maps to q-Iwahori level are injective with nonzero O-free cokernel after localization, and the pairing comparison gives q-new residual support and a lifted q-new witness. The weight-two KW branch uses Lemma 7.1 plus the paired argument in its Theorem 8.4 proof, including `p=2`; q|p is allowed only with trivial coefficient action at q. Neither `p=2` nor q|p follows from Kisin Corollary 3.1.11. ([Mark Kisin](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf), §3.1 standing `p>2` assumption, p. 1145; §3.1.1–3.1.3, pp. 1146–1147; Lemmas 3.1.8–3.1.10 and Corollary 3.1.11, pp. 1150–1152. Exact coefficient, stabilizer, degeneracy and Gram setup, and the resulting free quotient.) ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 7.1, author pp. 60–61; proof of Theorem 8.4, author pp. 76–78. Separate weight-two at-p variant and its use in the optimization tower.)

Kisin branch: `p>2` (standing assumption at §3.1, p. 1145); definite D/F and exact stabilizer/coefficient-pairing conditions. `q∤p·disc(D)·level(U)`, `S_m≠0` and the defect annihilates the whole residual localized module. KW weight-two branch: non-Eisenstein support, weight-two coefficient space and the integral pairing/saturation in the Theorem 8.4 proof; at q|p the coefficient action at q must be trivial. The definite Gram identity is `[[Nq+1,T_q],[T_q,ψ(π_q)(Nq+1)]]` in Kisin’s pairing normalization. A curve-cohomology Gram identity is not this theorem.

Apply the supplied residual injection/saturation theorem under the exact stabilizer hypotheses. Compute the paired Gram matrix `[[Nq+1,T_q],[T_q,ψ(π_q)(Nq+1)]]`. Its residual determinant vanishes, so the paired integral comparison leaves nonzero free new support. Lift the supported eigensystem and distinguish the `q≠p` result from the separate KW at-p argument.

For the two old-coordinate vectors, the paired Gram operator has columns `(Nq+1,T_q)` and `(T_q,ψ(π_q)(Nq+1))`. Its determinant is `(Nq+1)²ψ(π_q)−T_q²`; the residual defect condition is its negative. A singular Gram matrix alone does not supply a free new quotient. The perfect pairing, residual injection and integral saturation together identify the free quotient in Kisin's argument. The q|p weight-two operation in KW Lemma 7.1 is a separate supplier contract.

*Needs:* `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:§R18.4.17`, `AlgebraicModularFormsAndSerreWeights:R15.5`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `HilbertModularVarietiesAndShimuraCurves:§R18.3.5`.

**Checks.**

- A determinant-zero matrix without a perfect pairing and saturation is insufficient.

- A stabilizer with p-torsion fails the exactness hypothesis.

- A residue-degree-two norm uses Nq, not the rational prime p.

<a id="quaternionic-base-change-tower"></a>

### 6.10 Quadratic base-change optimization tower

Given KW data and an even set of primes `v_1,…,v_r` whose prescribed special local types must be realized, choose successive totally real quadratic changes `F_i/F_{i−1}`, with `v_i` split and the other named places inert as in KW’s proof; preserve residual image, determinant and the required p-local splitting. At the ith step quaternionic level raising changes the requested local type at `v_i` while preserving the choices already made. Add an auxiliary Steinberg place `r_0` when needed for the definite discriminant/neatness argument, then remove it by Theorem 8.2. The final modular lift realizes all requested types after an allowable composite change. ([Mark Kisin](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf), Proof of Lemma 3.5.3, pp. 1168–1169. Quadratic tower method and its local preservation inputs.) ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Proof of Theorem 8.4, author pp. 76–78. Specific tower, auxiliary `r_0` and final removal by Theorem 8.2.)

KW’s even-discriminant setup, actual initial optimized modular witness, and locally admissible type choices. Field choices satisfy the disjointness, splitting and neatness requirements; introduced auxiliary ramification is removed. At p-places use only the exact weight-two variant; general-weight p-local raising is not inferred.

Construct each quadratic extension with the prescribed split/inert pattern and linear disjointness. Transfer to the definite quaternion algebra at the even set and perform one local raising step. Repeat, verifying the earlier local types and determinant under restriction. Use Theorem 8.2 to remove `r_0`. Determinant alignment uses ArithmeticGaloisDuality §R02.6.2, Finite-order determinant twists, with §6.6’s total-evenness and local-unit hypotheses. The first local comparison realizes the requested special type only up to unramified order-two twist; a further allowable change kills these twists, preserving the specified square-root restrictions. In case C with `k(ρ)=2`, or `p=2` with `k(ρ)=4`, this final extension may be unramified rather than split at p.

*Needs:* [KW optimisation data](#kw-optimisation-data), [KW minimal modular lifts](#kw-minimal-modular-lifts), [Quaternionic level raising](#quaternionic-level-raising), `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `ArithmeticGaloisDuality:§§R02.4.5b–R02.4.6`, `ArithmeticGaloisDuality:§R02.6.2, Finite-order determinant twists`.

**Checks.**

- Total reality alone does not certify image preservation.

- The auxiliary `r_0` cannot remain in the final ramification set.

- The final field extension is reported, rather than described as a theorem over the initial F.

<a id="prescribed-local-type-lifts"></a>

### 6.11 KW prescribed-local-type modular lifts

Under KW optimisation data with β in every case and α for `p>2` or dyadic weight two, after allowable base change F′/F there is a cuspidal modular lift of `ρ_F′` with determinant `ψ_F′χ_p` realizing each prescribed lifting datum. At `p>2`: A is crystalline of weight `2≤k≤p+1` (with `k=p+1` only when F′ is split at p and `k(ρ)=p+1`), B is weight-two crystalline over `Q_p^nr(μ_p)` with the prescribed WD inertial parameter, and C is noncrystalline semistable weight two with diagonal `γ_vχ_p,γ_v` and `γ_v²=ψ_v`. At `p=2`: `k(ρ)=2` gives crystalline weight two and `k(ρ)=4` gives semistable noncrystalline weight two with the specified `γ_v`. Away from p the lift is unramified where required and special upper triangular with unramified `γ_v` at the prescribed ramified places. ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Theorem 8.4, author pp. 75–76; proof pp. 76–78. All p-local A/B/C and dyadic branches, prescribed outside-p ramification and fixed determinant.)

`p>2` requires `α` and `β`; `p=2` requires `β` and `α` when `k(ρ)=2`; image assumptions from §8.1. The specified local type must be among the locally admissible data in §8.3. The determinant and chosen local unramified square roots are part of the conclusion after restriction. Choose the same A/B/C branch simultaneously at all places over p, with common weight k in A and weight two in B/C; the inertial parameter in B is fixed across embeddings. A uses `ψ` of type (i); B and C use type (ii). No mixed A/B/C assignment is asserted.

Use the minimal modular lift with the appropriate determinant branch. Apply the quadratic tower to impose each ramified local datum. Remove the temporary auxiliary place; compare by local–global compatibility and KW Lemma 7.7. Kill the remaining unramified quadratic local twists by a further allowable change, so the chosen `γ_v` restrictions, and not only their squares, are realized.

The admissible p-local lifting data fix more than a Hodge–Tate weight:

| Datum | Odd-characteristic requirement | Dyadic requirement |
| --- | --- | --- |
| A | Crystalline weight `2≤k≤p+1`; the p+1 endpoint requires splitting at p and `k(ρ)=p+1` | `k(ρ)=2`: crystalline weight two |
| B | Weight two, crystalline over `Q_p^nr(μ_p)`; WD inertial parameter `ω_p^{k(ρ)−2}⊕1` and zero monodromy | No added B branch |
| C | Noncrystalline semistable weight two, diagonal `γ_vχ_p` and `γ_v`, `γ_v` unramified and `γ_v²=ψ_v` | `k(ρ)=4`: this weight-two semistable branch |

Choose one A/B/C branch simultaneously at all places above p: the crystalline weight in A is one common k, and the weights in B and C are two in every embedding. A requires determinant character of type (i), and B/C require type (ii). In B the fixed tame parameter `ω_p^{k−2}` is compatible with that determinant character; the displayed `k(ρ)` exponent describes the same character in the fixed setup. Mixed assignments of different branches or different weights are not claimed.

At a prescribed ramified place away from p require the special upper-triangular type with unramified `γ_v` and the fixed determinant. At an unramified place require an unramified lift. The output realizes the restrictions of these data after an allowable field change. It does not assert that every A/B/C label is locally nonempty: the local admissibility and image hypotheses are part of the inputs. The distinction between crystalline over `Q_p^nr(μ_p)` and crystalline over the original field is essential in B.

After the tower and removal of `r₀`, local–global compatibility with KW Lemma 7.7 initially gives the prescribed special type up to unramified quadratic twist. Make a further allowable change that kills these twists to realize the specified `γ_v` after restriction. Fixed determinant alone cannot distinguish `γ_v` from `−γ_v`. In odd-characteristic case C with `k(ρ)=2`, and in the dyadic `k(ρ)=4` case, this final extension need not split at p; it remains unramified there.

*Needs:* [KW optimisation data](#kw-optimisation-data), [KW minimal modular lifts](#kw-minimal-modular-lifts), [Quadratic base-change optimization tower](#quaternionic-base-change-tower), `AlgebraicModularFormsAndSerreWeights:R15.5A.2–R15.5A.3, R15.6`, `LocalGaloisDeformationRings:§§8.2–8.5, 8.13–8.18`, `HilbertModularVarietiesAndShimuraCurves:R18.3`.

**Checks.**

- A potentially crystalline B lift is not asserted crystalline over the original field.

- For `p=2` the `k(ρ)=4` branch is noncrystalline weight two, not crystalline weight four.

- Neither GL2ModularityLifting’s modularity lifting theorem nor final ClassicalSerreModularity Serre theorem is a proof prerequisite.

<a id="strong-form-case-table"></a>

### 6.12 Classical optimisation case manifest

Export the seven-case manifest separating `p≥5`, `p=3`, dyadic nonscalar, Q(i)-induced, scalar dihedral, scalar non-dihedral and the full unconditional statement. Every early optimisation result consumes a modularity witness, except the independently proved dihedral weight-one base case. The scalar non-dihedral classical completion is supplied downstream by ClassicalSerreModularity’s scalar dyadic completion and unconditional modularity by ClassicalSerreModularity’s unconditional theorem; these are manifest references, not prerequisites of this roadmap. Final consumers must select a row and discharge its local and character hypotheses. ([Kevin Buzzard](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf), Theorems 3.1–3.2, pp. 107–109. Nonscalar and Q(i) dyadic branches.) ([Gabor Wiese](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf), Theorems 9–10, pp. 130–132. Dihedral weight-one and the odd-characteristic conductor/weight branches.) ([Chandrashekhar Khare and Jean-Pierre Wintenberger](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1 and Lemma 6.2(i), author pp. 1–3, 11. Precise scalar completion and separation of dihedral modularity from optimization.)

Case tests refer to the actual local representation and its projective image. The odd-characteristic rows retain the separate general-character Diamond input. No universal abbreviation hides the characteristic or character restrictions.

Identify residue characteristic and local scalarity first. Route the dihedral and Q(i) cases to their proved independent constructions. Use the unconditional final Serre statement only at the downstream manifest boundary.

| Case | Output | Mathematical input |
| --- | --- | --- |
| `p≥5`, already modular | Tame conductor `N(ρ)`, classical Serre weight `k(ρ)≥2`, canonical prime-to-p character lift | [Conditional descent to the full Serre level](#descend-to-serre-level) + [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem) + [Congruent nebentypus at fixed level](#nebentypus-congruent-character) |
| `p=3`, already modular, any conductor | Tame conductor `N(ρ)`, classical Serre weight; prescribed characteristic-zero character not claimed | [Conditional descent to the full Serre level](#descend-to-serre-level) (Diamond’s general-character theorem) + [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem) |
| `p=2`, local restriction nonscalar and not Q(i)-induced | Weight two if finite flat, weight three otherwise at N; translate to classical even weight four in the latter case | Buzzard Proposition 2.4 + [Buzzard’s combined weight and level theorem](#buzzard-weight-and-level-mod-two) |
| `p=2`, Q(i)-induced | Classical conductor-level witness by the independent induced weight-one/bridge argument | [Buzzard’s combined weight and level theorem](#buzzard-weight-and-level-mod-two), separate Q(i) proof |
| `p=2`, scalar local restriction, dihedral projective image | Katz weight one at N by Wiese, hence classical weight two via the dyadic Hasse bridge | [Dihedral weight-one witness and classical export](#wiese-dihedral-weight-one) + AlgebraicModularFormsAndSerreWeights Layer R15.3 |
| `p=2`, scalar local restriction, non-dihedral projective image | Remaining classical weight-two conductor-level completion; no general Katz weight-one refinement | ClassicalSerreModularity, scalar dyadic completion — downstream manifest only |
| Any p, full unconditional classical statement | First supply global residual modularity; then choose the applicable conditional row and final scalar completion | ClassicalSerreModularity, unconditional classical theorem — downstream manifest only |

*Needs:* [Conditional descent to the full Serre level](#descend-to-serre-level), [Edixhoven’s conditional weight optimisation](#edixhoven-weight-theorem), [Nonscalar dyadic multiplicity one](#nonscalar-dyadic-multiplicity-one), [Buzzard’s combined weight and level theorem](#buzzard-weight-and-level-mod-two), [Dihedral weight-one witness and classical export](#wiese-dihedral-weight-one), [Scalar dyadic boundary of multiplicity one](#dyadic-scalar-multiplicity-one-obstruction).

**Checks.**

- All seven rows are present with their suppliers.

- This roadmap has no proof edge to ClassicalSerreModularity’s scalar dyadic completion or ClassicalSerreModularity’s unconditional theorem.

- KW I Lemma 6.2(i) is discharged by GL2AutomorphicRepresentationsAndTransfer Layer R17.5 finite-image induction, ArithmeticGaloisRepresentations Layer 4 image control, this roadmap optimization and AlgebraicModularFormsAndSerreWeights Layer R15.4’s bad-dihedral recipe, not by the final Serre theorem.

### Examples

The arithmetic input `M=33`, `Δ=3⁶·11²` and `ℓ=3` selects only `q=3`, so `M₀=11`. For `M=141` and `Δ=3⁷·47`, `ℓ=3` selects neither prime and `M₀=141`; with `ℓ=7` it selects 3 and gives `M₀=47`. For `M=3²·5` and both discriminant valuations seven, `ℓ=7` removes 5 and retains `3²`, giving `M₀=9`. These are tests of the arithmetic definition, independent of an elliptic modularity or irreducibility assertion.

For KW's weight change with residue degree `f=2`, `P¹(k_v)` has `p²+1` points. Its permutation module decomposes into a one-dimensional trivial part and a Steinberg part of dimension `p²`. The tensor of two `Sym^{p−1}` factors has that dimension; a single p-dimensional factor would fail the test. In the determinant package, choices (i) and (ii) both have trivial unit restriction at `k(ρ)=2`, while choice (iii) has `Norm^{1−p}`. Its weight-p+1 use must retain that changed determinant type.

### Dependencies

The external inputs are `AlgebraicModularFormsAndSerreWeights:R15.2`, `AlgebraicModularFormsAndSerreWeights:R15.4, The dyadic weight dichotomy`, `AlgebraicModularFormsAndSerreWeights:R15.5`, `AlgebraicModularFormsAndSerreWeights:R15.5, Deligne–Serre eigenvalue lifting`, `ArithmeticGaloisDuality:§§R02.4.5b–R02.4.6`, `ArithmeticGaloisDuality:§R02.6.2, Finite-order determinant twists`, `ArithmeticGaloisRepresentations:§6.3`, `NeronModelsAndSemistableAbelianVarieties:§5.3h`, `ArithmeticGaloisRepresentations:Layer 4`, `ArithmeticGaloisRepresentations:§§6.1–6.4`, `HilbertModularVarietiesAndShimuraCurves:§R18.3.29`, `AlgebraicModularFormsAndSerreWeights:R15.5A.2–R15.5A.3, R15.6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GlobalGaloisDeformations:§§4.4, 4.8–4.11`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:§R18.3.5`, `HilbertModularVarietiesAndShimuraCurves:§§R18.3.18, R18.3.25–R18.3.27, R18.3.31–R18.3.32`, `HilbertModularVarietiesAndShimuraCurves:§R18.3.24`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `HilbertModularVarietiesAndShimuraCurves:§R18.4.17`, `LocalGaloisDeformationRings:§§8.2–8.5, 8.13–8.18`, `Nat.primeFactors`, `padicValNat`, `HeckeRing.GL2.Newform`, `ClassFieldTheory:Layers 11–12`, `ClassFieldTheory:Layer 7`. Their exact contracts are stated above; each target specifies the comparisons it uses.

## Downstream consumers

ClassicalSerreModularity consumes the conditional conductor/weight cases and supplies global modularity and the scalar non-dihedral dyadic classical completion at its own final boundary. The case manifest is a consumer interface: it does not invoke that completion to prove a result needed earlier inside the same argument.

EllipticCurveModularity uses the large-good-prime theorem when infinitely many residual representations `E[ℓ]` are already known to be modular and irreducible. The finite set of weight-two newforms at divisor levels of the fixed conductor gives a repeated witness; trace agreement at infinitely many coefficient primes is then the downstream characteristic-zero step. The conditional reduced-level theorem starts instead with an actual weight-two modularity witness for E and is suitable for applications such as Bennett–Siksek's congruences.

GL2ModularityLiftingDefectOne consumes the coherent weight-one ideal, ordinary Tate sequence, known multiplicity-one cases and Wiese's lower bound, then proves its own exact scalar multiplicity upper bound. GSp4NonregularModularityLifting consumes the distinct-root localized Hasse injection at tame `N≥5` as the `GL₂` model for its own nonregular theorem. Weight-zero higher-rank automorphy consumes the one-way companion splitting criterion; its higher-rank lifting theorem is outside this roadmap. GL2ModularityLifting consumes the KW minimal and prescribed-type modular witnesses after allowable totally real base change, together with their actual determinant and local types.

AutomorphicCongruences Layer 0, PadicFamilies Layer 1 and IntegralIwasawaTheory §I.5 use the augmented-algebra congruence comparison with their own Hecke modules. The level-changing application here retains the augmentation and generic-rank hypotheses of §1.3.

## References

- Kenneth A. Ribet, [Report on mod ℓ representations of Gal(Q̄/Q)](https://math.berkeley.edu/~ribet/Articles/motives.pdf). Motives, Proc. Sympos. Pure Math. 55, Part 2 (1994), 639–676; author PDF, 31 pages. All locators use author PDF pages.

- Kevin Buzzard, [On level-lowering for mod 2 representations](https://intlpress.com/api/bgcloud-front/resource/pdf/volume/1806606767503077378-1806606767503077378-04d9b46249cfb494c852bbd118844447.pdf). Mathematical Research Letters 7 (2000), 95–110; publisher PDF.

- Bas Edixhoven, [The weight in Serre’s conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi). Inventiones Mathematicae 109 (1992), 563–594; author revision dated 24 December 1998, 32 pages, with author pagination; the [author PostScript](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.ps.gz) gives the same revision. The Coleman–Voloch update is cited from this revision, separately from the original printing.

- Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), 355–392; published PDF.

- Benedict H. Gross, [A tameness criterion for Galois representations associated to modular forms (mod p)](https://www.math.purdue.edu/~tongliu/seminar/Mlift/Gross.pdf). Duke Mathematical Journal 61 (1990), 445–517; scan of published paper.

- Robert F. Coleman and José Felipe Voloch, [Companion forms and Kodaira–Spencer theory](https://www.math.canterbury.ac.nz/~f.voloch/Pdfs/comp2.pdf). Inventiones Mathematicae 110 (1992), 263–281; author manuscript dated 21 May 1992, 29-page PDF (main text pp. 1–26, Gross’s errata and references pp. 27–28, author address p. 29), author pagination.

- Gabor Wiese, [Dihedral Galois representations and Katz modular forms](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-09/07.pdf). Documenta Mathematica 9 (2004), 123–133; publisher PDF.

- Gabor Wiese, [Multiplicities of Galois representations of weight one](https://msp.org/ant/2007/1-1/ant-v1-n1-p04-p.pdf). Algebra & Number Theory 1 (2007), 67–85; published pagination.

- Frank Calegari and David Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://math.uchicago.edu/~fcale/papers/CG.pdf). Inventiones Mathematicae 211 (2018), 297–433; author PDF, author pagination.

- Frank Calegari and David Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Mathematical Journal 169 (2020), 801–896; author PDF.

- George Boxer, Frank Calegari and Toby Gee, [Cuspidal cohomology classes for GLn(Z)](https://math.uchicago.edu/~fcale/papers/WeightZero.pdf). Journal of the American Mathematical Society 38 (2025), 509–520; publisher offprint. The companion calculation occurs inside the proof of Theorem 2.4, not as its statement.

- Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Inventiones Mathematicae 178 (2009), 505–586; author manuscript dated 30 May 2009, author pagination.

- Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre’s modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Inventiones Mathematicae 178 (2009), 485–504; author manuscript, author pagination.

- Mark Kisin, [Moduli of finite flat group schemes, and modularity](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf). Annals of Mathematics 170 (2009), 1085–1180; publisher PDF.

- Kenneth A. Ribet and William A. Stein, [Lectures on Serre’s conjectures](https://wstein.org/papers/serre/ribet-stein.pdf). Author draft dated 23 November 2010, 95 pages; published in Arithmetic Algebraic Geometry, IAS/Park City Math. Ser. 9 (2001). Author pagination used.

- Srikanth B. Iyengar, Chandrashekhar B. Khare and Jeffrey Manning, [Congruence modules and the Wiles–Lenstra–Diamond numerical criterion in higher codimensions](https://par.nsf.gov/servlets/purl/10585269). Inventiones Mathematicae 238 (2024), 769–864; published PDF.
