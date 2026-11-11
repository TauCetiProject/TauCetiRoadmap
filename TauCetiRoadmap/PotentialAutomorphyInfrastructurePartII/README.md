# Roadmap: potential automorphy infrastructure, part II — polarized automorphy lifting and finiteness of deformation rings

**Summary.** This roadmap builds the polarized automorphy lifting theory for Galois representations of CM and totally real fields that are conjugate self-dual up to twist. Its automorphic side is algebraic modular forms on definite unitary groups, with integral coefficients, their spherical, Iwahori and ordinary Hecke algebras and the Galois representations they carry; Taylor–Wiles patching with Thorne's adequacy turns these into `R = T` theorems. On them rest Thorne's minimal lifting and finiteness theorems, the 2-adic lifting theorem of Thorne 2017, ordinary lifting and finiteness with adequacy relaxed to the vanishing of `H¹(H, ad)`, and potential ordinary automorphy with prescribed Steinberg places (with the self-dual Dwork family supplied by PotentialAutomorphyDworkMotivesPartII). It also covers:

- the residually reducible deformation theory of Thorne 2015 and Allen–Newton–Thorne, with the weak primitivity of the sources, and their finiteness theorem and Thorne's lifting theorem for two adequate constituents;
- Newton–Thorne's results on sums of characters, used for symmetric power functoriality;
- adjoint Bloch–Kato Selmer groups and semistable pseudodeformation rings of unitary type, with their tangent comparison;
- the integral `R = T` theorem for rigid residual representations of Liu–Tian–Xiao–Zhang–Zhu;
- the lifting theorem from generic local domains of Le–Le Hung–Levin–Morra.

The lifting theorems of BLGGT14 with adequate image, potential diagonalizability, the vanishing of adjoint Selmer groups (NT23, Theorem A) and the Allen–Newton–Thorne lifting theorem are ModularityAndLanglandsExtensions; this roadmap imports them by section and states only the forms and the general theory that roadmap does not.

## Scope and ownership

This is Part II of PotentialAutomorphyInfrastructure. The parent treats unpolarized representations through the cohomology of locally symmetric spaces of `GL_n` and derived patching. This roadmap treats the polarized case through definite unitary groups, whose arithmetic cohomology is concentrated in degree zero, so that classical patching suffices. From the parent it uses:

- integral dual Weyl modules (§0.4);
- auxiliary soluble and cyclic extensions (§§2.3, 2.5);
- `ι`-ordinary automorphic representations of `GL_n`, the twisted Steinberg criterion, and `ι`-ordinarity under soluble base change (§§3.44–3.48).

From ModularityAndLanglandsExtensions it imports potential diagonalizability with its criteria (§2.1), BLGGT14's lifting and finiteness theorems with adequate image and its potential ordinary automorphy theorem (§§2.2, 2.14), the vanishing of adjoint Bloch–Kato Selmer groups of unitary type (§4.1) and the Allen–Newton–Thorne lifting theorem (§4.2); the targets here that extend those statements say in one clause how they differ.

This roadmap owns:

- the global polarized notions of automorphy, ordinarity of weight `λ`, twisting and soluble descent (Layer 0);
- component deformation problems, and the potential diagonalizability of potentially Barsotti–Tate representations and of symmetric powers (Layer 1);
- the Schur condition and the determinant subring, with its bounded generation and the finiteness of the deformation ring over it (Layer 2);
- the division-algebra variant of the definite unitary group, algebraic modular forms with twisted coefficients and their comparison with automorphic forms, and the integral, Iwahori, ordinary and `Λ`-adic Hecke theory with its Galois representations (Layer 3);
- Taylor–Wiles data and the patching `R = T` theorems (Layer 4);
- Thorne's minimal lifting and finiteness theorems, the 2-adic theorem, relaxed adequacy with the ordinary lifting and finiteness theorems in that form, and characteristic-zero lifts (Layer 5);
- potential ordinary automorphy with prescribed Steinberg places, using the supplied self-dual Dwork family (Layer 6);
- residually reducible deformation theory, the Allen–Newton–Thorne finiteness theorem and Thorne's two-constituent lifting theorem (Layers 7–8); the Allen–Newton–Thorne lifting theorem and its route belong to ModularityAndLanglandsExtensions §4.2, and §§2.2(3), 7.7 and 8.5 state only the forms of three of its ingredients that the theorems of these layers use;
- adjoint Selmer groups, semistable pseudodeformation rings and their tangent comparison (Layer 9);
- rigid `R = T` and lifting from generic local domains (Layer 10).

The general objects have the following owners; each layer names the exact sections it uses.

- **Mathlib** owns absolute Galois groups, CM fields, the cyclotomic character, induced representations, Krull dimension, minimal primes, finite ring maps, normal closures and linear disjointness. It has no automorphic representations, no Galois representations attached to them and no Galois deformation rings, so none of the headline theorems below is statable against it.
- **ArithmeticGaloisRepresentations** owns:
  - induction and lattices, Brauer–Nesbitt, and recognition by Frobenius elements;
  - Weil–Deligne representations;
  - the group `𝒢_n` with polarized representations and their oddness;
  - adequate, Guralnick–Herzig–Tiep adequate and enormous subgroups.
- **LocalGaloisDeformationRings** owns every local lifting ring and condition used here:
  - the Fontaine–Laffaille condition;
  - ordinary representations of weight `λ` of a local Galois group, with their flag rings and Geraghty's ordinary rings;
  - smooth points of generic fibres;
  - Steinberg, minimally ramified, Ihara-avoidance and level-raising rings, and the Taylor–Wiles block condition;
  - rigidity of a residual representation;
  - potentially semistable rings of fixed type, and rank-two Barsotti–Tate components;
  - the relation "connects" between local lifts;
  - continuous pseudodeformation rings.
- **GlobalGaloisDeformations** owns polarized global deformation problems, their representability, tangent and obstruction spaces and presentations, Taylor–Wiles places, restriction and twisting.
- **DeformationAndDerivedPatchingAlgebra** owns relative cotangent spaces, characteristic-zero points from finiteness, module patching, support, connectedness dimension and the descent from patched modules.
- **IntegralHeckeAndGaloisDeterminants** owns continuous determinants, Cayley–Hamilton algebras, reducibility ideals and non-Eisenstein maximal ideals.
- **AutomorphicGaloisRepresentationsPartII** owns polarized automorphic representations, their Galois representations with local–global compatibility, the genericity of Weil–Deligne representations with its local Langlands criterion, and their residual representations.
- **AutomorphicFormsOnReductiveGroups** and **AdelicAlgebraicGroups** own algebraic modular forms with coefficients and the adelic groups behind them.
- **CompletedCohomologyAndLocalGlobalCompatibility** §0.7 owns the rank-`n` unitary group of a CM extension that is compact at infinity and quasi-split at every finite place, with its integral model and split identifications, its forms `S(U, A)` with class-set evaluation, level maps and traces, and the split-place operators `T_w^{(j)}` with the tame Hecke algebra. Layer 3 adds the division-algebra variant, the twisted coefficients at the places of `R` with Thorne's comparison to automorphic forms, the integral structure of the Hecke algebras and the Iwahori, ordinary and `Λ`-adic theory.
- **ModularityAndLanglandsExtensions** owns potential diagonalizability with its ordinary and Fontaine–Laffaille criteria and its operations (§2.1), BLGGT14's minimal and ordinary lifting and finiteness theorems with adequate image (§2.2), potential ordinary automorphy of symplectic residual representations, ordinary lifts with prescribed local components and potentially diagonalizable lifting (§§2.14–2.16), the vanishing of adjoint Bloch–Kato Selmer groups of unitary type (§4.1), and the Allen–Newton–Thorne lifting theorem for residually reducible representations with its route (§4.2): the `µ₂^d`-action on the Schur deformation ring and the invariant pseudodeformation subring with étaleness on the irreducible locus (ANT20, Proposition 3.2), the reducible-locus dimension bound at the Steinberg place (ANT20, Lemma 3.6), and connectedness of the finite ordinary ring with the lifting conclusion drawn from it (ANT20, Theorem 5.1). Here §2.2(3) states the first for every polarized problem with `µ₂^d`-stable local conditions, §7.7 the second for a set of Steinberg places and an arbitrary finite `Λ`-algebra, and §8.5 the propagation of potential pro-automorphy to every minimal prime under bounds one larger than the printed ones; these are the forms that §§7.9, 7.16–7.19 and 8.6–8.16 use, and none of them restates the lifting theorem. Also §§1.4–1.5 add the potentially Barsotti–Tate and symmetric-power cases, §§5.5 and 5.7 the relaxed-adequacy forms, and §6.1 the prescribed Steinberg places.
- **SmoothRepresentationsOfLocalGroups** owns smooth representations and types.
- **EndoscopicTransferAndUnitaryTraceComparison** owns:
  - local Langlands for `GL_n`;
  - Arthur–Clozel base change and automorphic induction;
  - Labesse's comparison between definite unitary groups and `GL_n`.
- **PadicHodgeTheory**, **SelmerIwasawaCohomology** and **ArithmeticGaloisDuality** own period rings, Bloch–Kato local conditions, Selmer groups and Poitou–Tate duality.
- **PotentialModularityAndCompatibleSystems** owns Moret-Bailly's theorem, used here through the symplectic switch of PotentialAutomorphyDworkMotivesPartII §9.4, and the extension of finite local characters.
- **PotentialAutomorphyDworkMotivesPartII** owns the self-dual Dwork family: the pencil and symmetry data (§§1.1–1.4), eigen-local-systems, real forms and pairings (§§2.3–2.7), monodromy and symplectic level-structure torsors (§§4.6, 5.6, 5.10–5.12), compatible Frobenius polynomials (§6.8), local Hodge and Steinberg properties (§§7.4, 7.7–7.10), and the geometric symplectic switch (§9.4). This roadmap adds the automorphic conclusion with prescribed Steinberg places in §6.1.
- **PotentialModularityAndCompatibleSystems** §§8.3–8.6 owns the rank-two definite-unitary ordinary theory. Layers 3–4 here extend its automorphic side and patching to arbitrary rank, with the same rank-two specialization, and Layers 5 and 8 add Thorne's minimal, the dyadic, the relaxed-adequacy and the residually reducible forms. **ClassicalSerreModularity** `R33.1/global-arithmetic-action` owns its rank-two finite-level Hecke action; no second rank-two carrier is constructed.
- The abstract nilpotent-kernel finiteness step in §8.6 uses Mathlib `Module.finite_of_surjective_of_ker_le_nilradical`; §8.6 owns its deformation-ring application and the reduction to minimal-prime quotients.
- The characteristic-zero enormous-image and adequacy predicates are imported by section from ArithmeticGaloisRepresentations §§7.9–7.10; their proposed declaration spellings are not pinned library declarations.

Statements outside this roadmap:

- The final potential automorphy theorems (BLGGT14, Proposition 3.3.1, Theorems 4.3.1–4.5.1 and §5), symmetric power functoriality and Sato–Tate are ModularityAndLanglandsExtensions, as are the lifting theorems listed in its bullet above.
- The unpolarized lifting theorems of Calegari–Geraghty, Caraiani–Newton and Boxer–Calegari–Gee–Newton–Thorne are not treated here.
- The generic Serre weight theorem of Le–Le Hung–Levin–Morra (LLHLM23, Theorem 9.1.6, `W(r̄) = W^?(r̄_p|I)`) and the change-of-weight form of §10.5 that it yields (LLHLM23, Remark 9.2.2(1): the seed `π` with prescribed weight and `K`-type replaced by bare residual automorphy) are not stated here. Both rest on the modularity of the obvious Serre weights of a residually automorphic `r̄` (LLHLM23, proof of Lemma A.1.1(2), through LLHL19, Theorem 4.3.8), a Serre weight result for `GL_n` that this roadmap does not develop; it produces automorphic lifts with prescribed potentially diagonalizable types by change of weight and level (BLGGT14, Theorem 4.4.1; ModularityAndLanglandsExtensions §2.32). §10.5 is stated with the source's seed hypothesis, and no weakened form with an assumed modular weight is stated in its place.

Other roadmaps cite this one by the identifiers of its design. The table gives the section of each.

| Design identifier (earlier numbering) | Section |
|---|---|
| PL.0 | Layer 0 |
| PL.0/soluble-descent | §0.9 |
| PL.0/auxiliary-cm-extensions | PotentialAutomorphyInfrastructure §§2.3, 2.5 |
| PL.0/auxiliary-characters | §0.11 |
| PL.1 | Layer 1 |
| PL.1/potentially-diagonalizable, PL.1/pd-criteria | ModularityAndLanglandsExtensions §2.1 |
| PL.1/potentially-barsotti-tate-diagonalizable | §1.4 |
| PL.1/pd-operations | ModularityAndLanglandsExtensions §2.1; symmetric powers §1.5 |
| PL.2 | Layer 3 |
| PL.3 | Layer 4 |
| PL.4 | Layer 5 |
| PL.4/strongly-residually-odd | §5.2 |
| PL.4/relaxed-adequacy | §5.4 |
| PL.4/ordinary-automorphy-lifting | §5.5; with adequate image ModularityAndLanglandsExtensions §2.2 |
| PL.5 | Layer 6 |
| PL.5/dwork-potential-ordinary-automorphy | §6.1; without the Steinberg places ModularityAndLanglandsExtensions §2.14 |
| PL.5/ordinary-lifts-prescribed-local, PL.5/tensor-product-trick-lifting, PL.5/pd-automorphy-lifting | ModularityAndLanglandsExtensions §§2.15–2.16 |
| PL.6 | Layers 2 and 7 |
| PL.7 | Layer 8 |
| PL.7/residually-reducible-automorphy-lifting, PL.7/source-primitive-ant-lifting | ModularityAndLanglandsExtensions §4.2 |
| PL.8 | Layer 9 |
| PL.8/adjoint-selmer-vanishing | ModularityAndLanglandsExtensions §4.1 |
| PL.9 | Layer 10 |
| §8.17, the ANT lifting theorem with weak primitivity | ModularityAndLanglandsExtensions §4.2 |

## Conventions

Fields and coefficients.

- Ranks `n` are positive unless a statement explicitly says otherwise; `N ≥ 2` in Layer 10. Residue cardinalities `q_v` are integers at least `2`; `q = 1` in an Iwahori Hecke calculation means reduction modulo the coefficient prime, not a residue field with one element. Coefficient fields have characteristic zero and their rings of integers are nonzero complete DVRs.
- `F` is a CM or totally real field with maximal totally real subfield `F⁺` and complex conjugation `c`. Split-place global problems choose one place `ṽ` above each `v ∈ S`. Layer 10 also allows places that do not split in `F`.
- `l` (or `p`) is a prime; it is odd except in §§4.4, 5.2–5.3 and Layer 9. `ι : Q̄_l ≅ ℂ` is fixed. `O` is the ring of integers of a finite `E/ℚ_l` containing the image of every embedding of `F`, with residue field `k` and maximal ideal `λ` (or uniformizer `ϖ`).
- Each datum may be realized only after enlarging `E`. Components of local lifting rings are taken over `Q̄_l`.

Galois-side normalizations.

- Local class field theory `Art_K` sends uniformizers to geometric Frobenius elements, and `ε_l` has Hodge–Tate weight `−1`. LocalGaloisDeformationRings and PadicHodgeTheory use `HT(ε) = +1`, so labelled weights imported from them are negated.
- The Weil–Deligne representation attached to `π_v` is `rec(π_v ⊗ |det|^{(1−n)/2})`.
- `𝒢_n = (GL_n × GL_1) ⋊ {1, j}` with `j(g, µ)j^{−1} = (µ ᵗg^{−1}, µ)` and multiplier `ν` (ArithmeticGaloisRepresentations §7.4).
- A polarized representation `(r, µ)` carries a pairing with `⟨x, y⟩ = −µ(c_v)⟨y, x⟩` when `F` is imaginary. It is totally odd when `µ(c_v) = −1` at every real place.

Automorphic-side normalizations.

- Multipliers follow BLGGT14: `(r, µ)` is automorphic when `(r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n})`, so `µ` is the full multiplier of the `𝒢_n`-valued extension. Thorne 2012 writes `µ` for the character of `χ` alone, with full multiplier `ε^{1−n}µ`; restatements of his theorems are converted.
- Weights are `λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}` with `λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n}`. An automorphic `π` of weight `ι_*λ` has `HT_τ(r_{l,ι}(π)) = {λ_{τ,i} + n − i}`.
- RAECSDC means regular algebraic, essentially conjugate self-dual and cuspidal, with its polarization character. The archimedean sign is AutomorphicGaloisRepresentationsPartII's `χ_v(−1) = (−1)^{n+w}` with purity weight `w`; Thorne's `(−1)ⁿ` is the case `w = 0`. RACSDC means `π^c ≅ π^∨`.

Adequacy and primitivity.

- Adequacy is Thorne's (2012, Definition 2.3) or Guralnick–Herzig–Tiep's (Tho17, Definition 2.20). Both are in ArithmeticGaloisRepresentations §7.9, and they agree when `l ∤ n`. Boxer–Calegari–Gee's relaxation replaces `H¹(H, ad⁰) = 0` by `H¹(H, ad) = 0`.
- A representation over a field is *weakly primitive* (the sources' "primitive") if it is not isomorphic to a representation induced from a proper open subgroup. It is *strongly primitive* if it is semisimple and not the semisimplification of such an induction. Both depend on the coefficient field: the two-dimensional representation of `S₃` is strongly primitive over `𝔽₅` and induced over `𝔽₂₅`. Residual primitivity hypotheses are imposed over `k̄`, or over a splitting field for every subgroup of the residual image (§7.15).

Rings, notation and locators.

- In the level notation of Layer 3, write `𝔩 = ∏_{v|l} v ⊂ O_{L⁺}`. The symbols `U(l^{b,c})`, `T(l^b)` and `O_{L⁺}/l^b` use powers of this radical ideal; thus the last quotient means `O_{L⁺}/𝔩^b`, locally reduction modulo `ϖ_v^b`. The symbol `l` in residue characteristic and Hodge–Tate formulas remains the rational prime.
- `Λ` is the Iwasawa algebra `O⟦T(l)⟧` of the `l`-part of the diagonal torus at the places above `l`, with the twisted diamond action of Thorne 2012.
- In Layers 7–8, `A = k⟦T⟧` and `Frac A` are the equal-characteristic rings at a generic prime. The set-up of ANT20 §4 is fixed in Layer 8.
- Layer 10 keeps the source convention `HT(ε) = +1` of LLHLM23 for its genericity polynomial, types and Serre weights, and converts Galois weights by §10.4.
- Locators cite the version listed under References. Geraghty is cited in the numbering of the 2010 preprint, which BLGGT14 and Thorne use. Tho15 and Tho17 are cited by the pages of their accepted manuscripts. ANT20 is cited by the pages of arXiv v2.

## Exact supplier contracts

### From Mathlib (commit 1b1ccf4)

Use the following, each at its definition in Mathlib:

- `Field.absoluteGaloisGroup` in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`, for the Galois groups `G_F`, `G_{F_v}`.
- `NumberField.IsCMField` in `Mathlib/NumberTheory/NumberField/CMField.lean:70`, for CM fields; it requires total complexity and quadraticity over the maximal real subfield, but not finiteness over `ℚ`, which is supplied separately by the number-field hypothesis.
- `cyclotomicCharacter` in `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:308`, for `ε_l`. It is the arithmetic action on roots of unity; the sign of its Hodge–Tate weight is the convention above.
- `Representation.ind` in `Mathlib/RepresentationTheory/Induced.lean:77`, for induction along a group homomorphism. Continuous induction from open subgroups is ArithmeticGaloisRepresentations §1.3.
- `ringKrullDim` in `Mathlib/RingTheory/KrullDimension/Basic.lean:29`, for the dimension counts of Layers 5, 7, 8 and 10.
- `Ideal.minimalPrimes` and `Ideal.finite_minimalPrimes_of_isNoetherianRing`, for components of complete local Noetherian rings.
- `RingHom.Finite` in `Mathlib/RingTheory/Finiteness/Defs.lean:174` and `Module.finite_of_surjective_of_ker_le_nilradical`, for finiteness of deformation rings over `Λ`.
- `IntermediateField.normalClosure`, `IntermediateField.LinearDisjoint`, `Group.IsSolvable` and `Ideal.primesOver`, for the soluble extensions of Layers 0, 6 and 8.

No Mathlib carrier exists for automorphic representations, Galois representations attached to them, `𝒢_n`-valued representations or Galois deformation rings.

### From Tau Ceti (commit 2fd255d)

Use the following Tau Ceti theorems:

- `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` in `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51`. It gives Frobenius classes of positive density for every Taylor–Wiles and auxiliary-prime choice in Layers 2, 4, 7 and 8; these choices cite Chebotarev Layer 10.
- `NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois` in `TauCeti/NumberTheory/NumberField/SplitsCompletely/Basic.lean:74`. It detects complete splitting in Galois extensions (§8.1).

- `TauCeti.ClassFieldTheory.geometricArtinMap`, in `TauCeti/NumberTheory/ClassFieldTheory/Local/GeometricArtinMap.lean:68`, is the local map `Kˣ → G_K^ab` for a nonarchimedean local field with its valuation topology. Use `continuous_geometricArtinMap` (line 76), `isArithFrobeniusLift_inv_of_mk_eq_geometricArtinMap_uniformizer` (line 112), and `geometricArtinMap_norm` (line 145). Uniformizers map to geometric Frobenius; the norm comparison retains the finite extension, its embedding and compatible valuation. The map alone asserts no Hodge–Tate comparison.

The global class field correspondence is ClassFieldTheory Layer 12. ClassFieldTheory Layer 7 supplies the surrounding local character dictionary with the geometric normalization fixed above.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

Use integral dual Weyl modules (§0.4), auxiliary soluble and cyclic extensions with prescribed local behaviour (§§2.3, 2.5), and `ι`-ordinary automorphic representations of `GL_n`. The last includes the twisted Steinberg criterion and soluble base change (§§3.44–3.48).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Use the following sections:

- §1.3: continuous induction from open subgroups, Frobenius reciprocity and the Mackey decomposition.
- §§1.6, 1.8, 1.12: lattices, Brauer–Nesbitt, restriction and induction.
- §§2.4–2.5: Weil–Deligne representations and Frobenius semisimplification.
- §5.3: recognition of semisimple representations from Frobenius elements.
- §§7.1–7.2: tensor operations, the adjoint and Schur's lemma.
- §7.4: `𝒢_n`, polarized representations and oddness.
- §7.9: adequate and Guralnick–Herzig–Tiep adequate subgroups with their criteria and eigenprojectors.
- §7.10: enormous images in the characteristic-zero sense (the characteristic-zero enormous-image predicate).

What ArithmeticGaloisRepresentations must provide (gap:equal-characteristic-projective-image): Let `k` be finite of characteristic `l > 3`, `A = k⟦T⟧`, `E = Frac A`, `Γ = Δ ⋊ {1, c}` profinite and `r : Γ → 𝒢_n(A)` continuous with `Δ = r^{−1}(𝒢_n⁰(A))`, such that `r|N ⊗_A E` is absolutely irreducible for every open `N ⊂ Δ`, some `σ₀ ∈ Δ` has `r(σ₀)` regular semisimple with eigenvalues in `A^×` satisfying no nontrivial multiplicative relation with integer exponents, `l ∤ n`, and `ν(r(c)) = −1`. Then the image of `r(Δ)` in `PGL_n(E)` is an open compact subgroup of `H(K)` for a closed subfield `K ⊂ E` and a form `H` of `PGL_n` over `K` (Tho15, Proposition 5.1, after Pink). For every closed normal `Δ′ ⊂ Δ` with `Δ/Δ′` abelian: the image of `r(Δ′)` has finite index in that of `r(Δ)`; there is `K₀ ≥ 1` such that for all `a, m ≥ 0` every `A[r(Δ′)]`-submodule of `ad⁰r ⊗_A A/T^m` containing an element of exact order `m − a` contains `T^{a+K₀}(ad⁰r ⊗_A A/T^m)`; and if moreover `ν ∘ r` is trivial on `Δ′` and `c` normalizes `Δ′`, there is `K₁ ≥ 1` with `T^{K₁}H¹(r(Δ′), ad⁰r ⊗_A A/T^m)^{c=−1} = 0` for all `m ≥ 0` (Tho15, Lemma 5.2). Irreducibility on open subgroups alone does not suffice: the standard representation of `Sp₄(𝔽₅⟦T⟧)` is absolutely irreducible on every open subgroup, but its projective Zariski closure is `PSp₄`, of dimension `10` against `15` for `PGL₄`, and its torus eigenvalues `a, b, a^{−1}, b^{−1}` have product `1`.

### From TauCetiRoadmap.LocalGaloisDeformationRings

Use the following sections:

- §§F.0.1, F.1.5, F.1.9–F.1.10, F.2.1–F.2.2, F.2.7, F.2.11, F.3.1: generic deformation foundations and continuous pseudodeformation rings.
- §§0.3, 1.1, 1.3, 1.6–1.9, 1.12–1.14, 1.18, 1.22: framed rings, character coefficient rings, the Fontaine–Laffaille condition, ordinary representations of weight `λ` and their flag rings, odd archimedean rings, and smooth points.
- §§2.2–2.5, 2.12, 2.15, 2.18, 2.20–2.21, 2.23–2.24, 2.26, 2.28: unramified, minimally ramified, Steinberg, level-raising and Ihara-avoidance rings, rigidity of a residual representation, and the Taylor–Wiles block condition.
- §§3.2, 3.4, 3.7, 3.9–3.11, 3.13: semistable and potentially semistable rings of fixed type, their dimension, and `G`-valued variants.
- §§4.10–4.14: rank-two Barsotti–Tate components.
- §§6.8, 6.12, 6.24, 6.30: the relation "connects", Geraghty's ordinary rings and the trivial-residual flag ring.
- §8.7: odd archimedean rings at `p = 2`.

What LocalGaloisDeformationRings must provide (gap:barsotti-tate-components-general-base): For `l > 2` and every finite `K/ℚ_l`, with trivial residual representation and `ζ_l ∈ K`, the rank-two Barsotti–Tate lifting ring has connected non-ordinary locus, and each ordinary component contains a split ordinary lift.

What LocalGaloisDeformationRings must provide (gap:cht-archimedean-ring-two-adic): The `𝒢_n`-valued deformation ring at a real place for `p = 2`, a strongly residually odd complex conjugation and multiplier `−1`, formally smooth with the archimedean local term `n(n + 1)/2` of Thorne 2017's Euler characteristic count.

What LocalGaloisDeformationRings must provide (gap:completed-product-components): For a completed tensor product over `O` of local Ihara-avoidance rings at finitely many places, each minimal prime of the special fibre lies under a unique minimal prime of the ring.

What LocalGaloisDeformationRings must provide (gap:semistable-stable-category), two separate results used by §§9.4 and 9.6:
  1. the finite `ℤ_p[G_{F,S}]`-modules that are, at each `v | p`, subquotients of lattices in semistable representations with Hodge–Tate weights in `[a, b]` form a stable condition in the sense of Wake–Wang-Erickson, so that determinants with a Cayley–Hamilton model in it form a quotient of `R_{D̄,S}` (NT23, Proposition 2.14);
  2. limits of torsion semistable representations with Hodge–Tate weights in `[a, b]` are semistable (Liu's theorem, as used in NT23, proofs of Proposition 2.17 and Lemma 2.19, pp. 17–18).

What LocalGaloisDeformationRings must provide (gap:nonsplit-minimally-ramified): Minimally ramified `𝒢_N`-valued liftings at places of `F⁺` not split in `F`, for `ℓ ≥ N` (LTXZZ, Definition 3.4.8), whose problem is a formally smooth irreducible component of relative dimension `N²` with bounded types (Proposition 3.4.12, Corollary 3.4.10), so that rigidity applies at nonsplit places of `Σ⁺_min`.

What LocalGaloisDeformationRings must provide (gap:generic-tame-pcris-domain): For `K/ℚ_p` unramified, or a finite product of such fields, a tame type with a `P_{λ+η,e}`-generic lowest alcove presentation and a semisimple residual representation, the potentially crystalline lifting ring of type `(λ + η, τ)` is a domain or zero (LLHLM23, Theorem 7.3.2(2), Remark 7.3.4), in the source convention `HT(ε) = +1`.

### From TauCetiRoadmap.GlobalGaloisDeformations

Use polarized deformation problems with representability, tangent and obstruction spaces and presentations (§§8.1–8.4). Also use relative tangent spaces as Selmer groups (§3.6), restriction to finite extensions (§§4.1–4.2) and twisting (§4.4).

What GlobalGaloisDeformations must provide (gap:two-adic-polarized-presentation): Tangent, obstruction and presentation formulas for polarized deformation problems at `p = 2`, with strongly residually odd complex conjugations and `F/F⁺` unramified at every finite place (Tho17, §§2.1–2.15).

What GlobalGaloisDeformations must provide (gap:nonsplit-polarized-problems): Polarized deformation problems whose set of places contains places of `F⁺` not split in `F`, with local conditions on `𝒢_n`-valued lifts there, representability for absolutely irreducible `r̄|G_F`, and the presentation formula with `T = S` and the actual tangent defects at those places, which in the set-up of §10.1 gives `g = b − f − N[F⁺ : ℚ]δ − aκ_µ` generators.

What GlobalGaloisDeformations must provide (gap:square-zero-determinant-cotangent): For a complete equal-characteristic DVR `A` and a polarized ordinary problem with Schur residual representation, the `A`-dual of the relative cotangent module of the deformation ring over its determinant subring at a generic prime is the space of determinant-fixed polarized deformations over `A ⊕ ε(Frac A/A)`, uniformly in the Taylor–Wiles level (Tho15, §3).

What GlobalGaloisDeformations must provide (gap:rank-one-ordinary-finiteness): For `p` odd, `S` finite containing the `p`-adic places and split over `F⁺`, a residual character `χ̄` with `χ̄χ̄^c = µ̄|G_F` and an odd multiplier `µ` unramified outside `S`, the rank-one polarized ordinary deformation ring, with extra Steinberg places read as unramified, is finite over `O⟦∏_{v|p} I^{ab}_{F_ṽ}(p)⟧` with `dim R/(ϖ) ≤ [F⁺ : ℚ]`.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Use relative cotangent spaces and presentations (§1.9) and characteristic-zero points from finiteness and dimension (§§4.1–4.2). Use patching of rings and free modules, balanced patching and patching over `Λ` (§§5.4–5.6, 5.8). Use near faithfulness on support, descent from patched modules, reduced identification, connectedness dimension, and generic and special components (§§6.1, 6.4–6.7).

What DeformationAndDerivedPatchingAlgebra must provide (gap:group-equivariant-patching): Patching that is equivariant for a fixed finite group acting on the rings, modules and character variations, with compact diagonal choices, so that the patched comparison map is equivariant.

### From TauCetiRoadmap.DerivedModuleAlgebra

Use Matlis duality and completion (§§1.M.1–1.M.2) in §7.17: over the complete DVR `A = k⟦T⟧`, duality with the injective hull `Frac A/A` sends a finite free cotangent summand `A^r` to `(Frac A/A)^r` and finite-length modules to finite-length modules. DeformationAndDerivedPatchingAlgebraPartII §K0.7 consumes this duality for a different, local-duality comparison.

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

Use the following sections:

- §§0.2, 0.5: continuous determinants, scalar extension and trace comparisons.
- §§1.1–1.4: Cayley–Hamilton algebras, semisimple reconstruction, generalized matrix algebras and reducibility ideals.
- §3b.1: Galois-type and non-Eisenstein maximal ideals.

What IntegralHeckeAndGaloisDeterminants must provide (gap:bounded-denominator-determinant-lifts): For `ρ : Γ → GL_n(O)` absolutely irreducible over `E`, a constant `k₀` depending only on `ρ(Γ)` such that, after scaling `ε` by `p^{k₀}`, every determinant lift to `O ⊕ ε(E/O)` comes from a lift of `ρ`, lifts with equal determinant are conjugate under `1 + εM_n(E/O)`, and centralizers are scalar (NT23, Proposition 2.7).

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

Use the following layers:

- AG2.0: weights, polarized and RAECSDC representations, the multiplier parity, Hodge–Tate multisets and strong multiplicity one.
- AG2.2: algebraic twisting into unitary type, base change and the assembly of discrete sums from supplied constituents (its own geometric existence theorem keeps Shin's regularity and field restrictions and is not used for existence).
- AG2.3: existence of the Galois representation of every regular algebraic conjugate self-dual cuspidal representation, with no regularity or field restriction (arbitrary regular conjugate-self-dual existence).
- AG2.5–AG2.6: local–global compatibility, including the full polarized comparison at the coefficient prime.
- AG2.6 (generic monodromy orbits and local genericity): the genericity predicate `Hom_{WD}((r, N), (r(1), N)) = 0` for Weil–Deligne representations and the criterion that an irreducible admissible representation of `GL_n(K)` is generic exactly when its parameter is; §9.1 uses them for Galois representations.
- AG2.7: residual representations, finite realization and local residual genericity.

What AutomorphicGaloisRepresentationsPartII must provide (gap:unitary-shimura-integral-cohomology), three separate results used by §10.2:
  1. the étale cohomology of unitary Shimura varieties `Sh(V, K)` of arbitrary signature with `O`-local systems `L_ξ`, with its Hecke and Galois actions, at Taylor–Wiles levels (LTXZZ, §3.6, p. 29, and Lemma 3.6.5);
  2. the base change to `GL_N` of the constituents of its rational cohomology, with local–global compatibility (LTXZZ, Propositions 2.3.3 and 2.3.6);
  3. for `N` even, rank-one monodromy at inert places where `V` is non-split and `K` is special maximal (LTXZZ, Corollary 2.3.7).

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Use highest-weight characters and duals (§5.1), algebraic modular forms with arbitrary continuous coefficient action (§7.4), and finite stabilizers, base change and automorphic realization (§7.5).

What AutomorphicFormsOnReductiveGroups must provide (gap:unitary-dual-conjugate-self-duality): An irreducible unitary `(𝔤, K)`-module of `GL_n(ℝ)` or `GL_n(ℂ)` with half-integral Harish-Chandra parameter satisfies `π^c ≅ π^∨`, by Tadić's classification of the unitary dual (BLGGT14, Lemma 2.2.3).

### From TauCetiRoadmap.CompletedCohomologyAndLocalGlobalCompatibility

Use §0.7 for a CM extension `L/L⁺` and rank `n`: the unitary group that is compact at infinity and quasi-split at every finite place, with its integral model and the split identifications `ι_w`, chosen in conjugate pairs `ι_{w^c}(g) = c(ᵗι_w(g)^{−1})`; its forms `S(U, A)` for a coefficient module with a right action of a submonoid containing `U`, with class-set evaluation, restriction, trace and the diamond action of `U/U′` for normal `U′ ⊂ U`; and the split-place operators `T_w^{(j)}`, the relation `T_{w^c}^{(j)} = (T_w^{(n)})^{−1}T_w^{(n−j)}` and the commutative tame Hecke algebra `𝕋^S(U, A)`, finite over `O` for finite free coefficients and compact open `U`. §§3.1–3.3 use them for `S(B) = ∅`.

### From TauCetiRoadmap.AdelicAlgebraicGroups and TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

Use adelic points and their local and integral projections (AdelicAlgebraicGroups §§1.1, 1.5), and finiteness of class numbers with compactness of anisotropic quotients (§3.4). Use neat levels and double cosets (§§4.3–4.4), and algebraic weights at infinity (ArithmeticLocallySymmetricSpaces §ALS.F.7).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups and TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Use the following:

- SmoothRepresentationsOfLocalGroups §SR.1: Hecke algebras over rings.
- §§SR.2.2–SR.2.3, SR.3.4: Iwahori invariants and the Iwahori block.
- §SR.5.2: types.
- EndoscopicTransferAndUnitaryTraceComparison §§10.23, 10.30: local Langlands for `GL_n` and its segments.
- §§6.24, 6.26: cyclic base change and automorphic induction.
- §6.29, with §4.7a at the places of `S(B)`: Labesse's stable comparison between definite unitary groups and `GL_n`.

### From TauCetiRoadmap.PadicHodgeTheory and TauCetiRoadmap.SelmerIwasawaCohomology

Use the following:

- PadicHodgeTheory §§3.3–3.6: period functors, filtered `(φ, N)`-modules and labelled ordinary flags.
- §5.3: potentially semistable periods.
- §6.3: ordinary filtrations and semistability of de Rham extensions.
- Layer 8: rational geometric comparison.
- SelmerIwasawaCohomology §§2.1, 2.9, 4.9: Selmer data and the Bloch–Kato local condition.

### From TauCetiRoadmap.ArithmeticGaloisDuality

Use the following sections:

- §R02.2.3: Hochschild–Serre and inflation–restriction.
- §§R02.4.2–R02.4.3, R02.4.5a: local Tate duality, the local Euler characteristic, and finite-level Poitou–Tate.
- §R02.5.1: Greenberg–Wiles.
- §D7.4: derived local duality.
- §D8.1: adjoint coefficients and first-order lifts.

### From TauCetiRoadmap.PadicFamilies, TauCetiRoadmap.PotentialModularityAndCompatibleSystems and TauCetiRoadmap.ReductiveGroupsPartII

Use the following:

- PadicFamilies §§0a.2, 0a.4, 0a.14: the finite ordinary projector and its independence of the uniformizer.
- PotentialModularityAndCompatibleSystems §2.15: extension of finite local characters.
- ReductiveGroupsPartII §RG2.2.1: the extended building of `GL_n` as splittable norms, for the selfdual lattice argument of §7.12.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Use the following sections, as stated there:

- §2.1: diagonalizable and potentially diagonalizable representations, their invariance under restriction, coefficient extension and the connects relation, their stability under direct sums, tensor products, duals and twists, and the criteria for full character flags and for the Fontaine–Laffaille range (BLGGT14, Lemmas 1.4.1–1.4.3). §§1.4–1.5 use the notion.
- §2.2: BLGGT14's minimal and ordinary automorphy lifting theorems with adequate image, with their finiteness inputs (Theorems 2.3.1–2.3.2 and 2.4.1–2.4.2). §6.1 applies the ordinary one; §§5.1, 5.5–5.7 state the forms it does not.
- §2.14: potential ordinary automorphy of symplectic residual representations (BLGGT14, Theorem 3.1.2), of which §6.1 is the refinement with prescribed Steinberg places.
- §4.1: the vanishing of adjoint Bloch–Kato Selmer groups of unitary type with enormous image (NT23, Theorem A). §9.7 draws its consequence for pseudodeformation rings.
- §4.2: automorphy lifting for residually reducible representations with a Steinberg place (ANT20, Theorem 6.1), with its route: the `µ₂^d`-invariant pseudodeformation subring and étaleness on the irreducible locus, the reducible-locus dimension bound at the Steinberg place, and connectedness of the finite ordinary ring with the automorphy of its `O`-points (ANT20, Proposition 3.2, Lemma 3.6 and Theorem 5.1). §8.15 applies the theorem; §§2.2(3), 7.7 and 8.5 cite the three ingredients and state the forms the other targets of Layers 7–8 use.

### From TauCetiRoadmap.PotentialAutomorphyDworkMotivesPartII

Use the self-dual family with `N` odd, `n ≥ 2` even and `N > n + 1`: the auxiliary modulus and pencil (§§1.1–1.4), the real eigen-local-systems and their alternating pairing on `V_λ((N−1−n)/2)` with values in `O⁺_λ(1−n)` (§§2.3–2.7), single-block monodromy at infinity (§4.6), full symplectic monodromy and the geometrically irreducible pairing-preserving level torsors at distinct coefficient characteristics (§§5.6, 5.10–5.12), and coefficient-independent Frobenius polynomials (§6.8). Use the consecutive Hodge–Tate weights, crystallinity at good reduction, ordinarity near the Fermat point, Fermat inertial characters and Steinberg fibres (§§7.4, 7.7–7.10). The geometric symplectic switch (§9.4) supplies the simultaneous fibres over a totally real extension with avoidance and the prescribed signs of `v(t)`, including `v(t) < 0` above a prescribed finite set of places prime to `N` and to the auxiliary prime; §6.1 adds automorphy using ordinary lifting (ModularityAndLanglandsExtensions §2.2). The pairing has full multiplier `ε_l^{1−n}`. For `n = 2`, `N = 5` and residue cardinality `11`, geometric Frobenius on the Steinberg fibre has roots `±11, ±121` before twisting and `±1, ±11` on `V_λ(1)`, with products `1331` and `11`, respectively (BLGHT11, Lemma 5.1(2), corrected using the pairing of §4, BLGHT11 lines 1018–1021 and 1269–1273). Only pairing-preserving isomorphisms form the connected symplectic torsor.

## How to read the build

Layer 0 supplies polarized automorphy, ordinarity and transport. Layer 1 builds component conditions and two criteria for potential diagonalizability, while Layer 2 independently supplies Schur residual data and the determinant subring. Layer 3 uses Layers 0 and 2 to build the definite-unitary Hecke modules on the carrier of CompletedCohomologyAndLocalGlobalCompatibility §0.7, and Layer 4 patches them using Layer 1. Layer 5 uses Layers 0–4 for Thorne's minimal lifting and finiteness theorems, the 2-adic theorem and the relaxed-adequacy forms of ordinary lifting and finiteness. Layer 6 uses Layer 0 together with the supplied Dwork geometry and imported ordinary lifting for potential ordinary automorphy with prescribed Steinberg places. Layer 7 uses Layers 0 and 2–4 for residually reducible deformation theory, and Layer 8 uses Layers 0 and 2–7 for its finiteness and lifting theorems. Layer 9 uses Layers 0 and 2 for adjoint Selmer groups, semistable pseudodeformation rings and their tangent spaces. Layer 10 uses Layers 0, 1, 3–5 and §8.16 for rigid integral `R = T` and lifting from generic local domains.

Each target states its hypotheses, gives a route through the sources with locators, lists what it needs, and ends with discriminating checks.

## Layer 0: Polarized automorphy: ordinarity, twisting and soluble descent

This layer fixes what it means for a polarized `l`-adic representation to be automorphic, and proves the formal properties of that notion used by every lifting theorem below: the principal-series description of `ι`-ordinarity, the comparison between `ι`-ordinary automorphic representations and ordinary Galois representations, invariance under algebraic twists, base change and descent along soluble extensions and along inductions, and auxiliary characters with prescribed conjugate norm. The notion of an `ι`-ordinary automorphic representation of `GL_n` itself is PotentialAutomorphyInfrastructure §3.44, and the polarized notions of AutomorphicGaloisRepresentationsPartII Layer AG2.0 are used throughout.

### 0.1 Ordinary Galois representations of weight `λ`

Let `F` be a number field, `l` a prime, `n ≥ 1` and `λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}`, so that `λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n}` for every embedding `τ`. For a place `v | l` write `λ_v` for the family `(λ_τ)` indexed by the embeddings `τ : F → Q̄_l` inducing `v`, viewed as embeddings of `F_v`. Define: a continuous `ρ : G_F → GL_n(Q̄_l)` is *ordinary of weight `λ`* if for every `v | l` the restriction `ρ|G_{F_v}` is ordinary of weight `λ_v` in the sense of LocalGaloisDeformationRings §1.7 (the ordinary flag definitions preceding it): there are continuous characters `ψ_{v,1}, …, ψ_{v,n} : G_{F_v} → Q̄_l^×` and an isomorphism of `ρ|G_{F_v}` with an upper triangular representation with diagonal `ψ_{v,1}, …, ψ_{v,n}`, `ψ_{v,1}` on the invariant line, such that `x ↦ ψ_{v,i}(Art_{F_v}(x))·∏_τ τ(x)^{λ_{τ,n−i+1}+i−1}` has finite order on `O_{F_v}^×` for every `i` (Tho15, Definition 2.5, pp. 11–12; NT26, Definition 2.5(2), p. 12; Ger19, definition before Lemma 5.2.1, p. 63). The local predicate, its restriction and coefficient-change API and its period consequences belong to LocalGaloisDeformationRings §§0.3 and 1.7; this target adds only the global weight indexed by `Hom(F, Q̄_l)` and the place-by-place conjunction.

The local refinements of BLGGT14 §1.4 (p. 25) are the same notion read through a decreasing flag: a local `ρ_v` is ordinary in BLGGT's sense if it has an invariant decreasing full flag whose `i`-th graded character satisfies `χ_i(Art_K(α)) = ∏_τ τ(α)^{b_{τ,i}}` on an open subgroup of `O_K^×` with `b_{τ,1} < ⋯ < b_{τ,n}`; *ss-ordinary* if the open subgroup can be all of `O_K^×`, and *cr-ordinary* if ordinary and crystalline. Reversing the flag identifies `χ_i` with `ψ_{v,n+1−i}`, and the two normalisations match by `b_{τ,i} = −(λ_{τ,i} + n − i)`. An ordinary `ρ_v` is de Rham with `HT_τ(ρ_v) = {λ_{τ,i} + n − i}`, and semistable when ss-ordinary (LocalGaloisDeformationRings §0.3, whose labelled weights are stated with `HT(ε) = +1` and are the negatives of those here).

*Needs:* LocalGaloisDeformationRings §§0.3, 1.7; ClassFieldTheory Layer 7 (local reciprocity).

**API.**

- If `ρ` is ordinary of weight `λ`, then for each `v | l` it carries a `G_{F_v}`-stable full flag of `Q̄_lⁿ` whose graded characters satisfy the finite-order condition with exponents `λ_{τ,n−i+1} + i − 1`.
- `ρ` is ordinary of weight `λ` if and only if, for every `v | l`, `ρ|G_{F_v}` is ordinary in the sense of BLGGT14 §1.4 with `b_{τ,i} = −(λ_{τ,i} + n − i)`.
- For a finite extension `F′/F`, the restriction `ρ|G_{F′}` is ordinary of weight `λ_{F′}`, where `(λ_{F′})_{τ′} = λ_{τ′|F}`.
- For a character `ψ` of `G_F` that is Hodge–Tate above `l` with `HT_τ(ψ) = {h_τ}`, `ρ ⊗ ψ` is ordinary of weight `(λ_{τ,i} + h_τ)_{τ,i}`.
- `ρ^∨` is ordinary of weight `μ` with `μ_{τ,i} = −λ_{τ,n+1−i} − (n − 1)`.
- An ordinary `ρ` is de Rham at every `v | l` with `HT_τ(ρ|G_{F_v}) = {λ_{τ,i} + n − i : 1 ≤ i ≤ n}`, and semistable at `v` when each `ψ_{v,i} ∘ Art_{F_v}` equals the algebraic character on all of `O_{F_v}^×`.
- The weight is determined by `ρ`: if `ρ` is ordinary of weight `λ` and of weight `λ′`, then `λ = λ′`, because `HT_τ(ρ|G_{F_v}) = {λ_{τ,i} + n − i}` determines `λ_τ`.

**Checks.**

- For `F = ℚ` and `n = 1`, the cyclotomic character `ε_l` is ordinary of weight `(−1)`: in the geometric normalisation `ε_l(Art_{ℚ_l}(x)) = x` on `ℤ_l^×`, so `ε_l ∘ Art · x^{−1}` is trivial, and `HT(ε_l) = {−1}`. With the arithmetic normalisation one would get weight `(1)`; this pins the sign convention.
- If `E/ℚ` has split multiplicative reduction at `l`, then `V_l E ≅ (ε_l, ∗; 0, 1)` on `G_{ℚ_l}` is ordinary of weight `(−1, −1)`, with Hodge–Tate weights `{0, −1}` (indeed `λ_{τ,1} + 1 = 0` and `λ_{τ,2} = −1`).
- For `n = 1` a character is ordinary of weight `λ` if and only if it is Hodge–Tate at every `v | l` with `HT_τ = {λ_τ}`; a character of finite order is ordinary of weight `0`.
- If `E/ℚ` has good supersingular reduction at `l`, then `V_l E|G_{ℚ_l}` is crystalline with Hodge–Tate weights `{0, −1}` but is not ordinary of any weight: an invariant line would be a crystalline character with integral Frobenius slope, while both slopes of `D_cris(V_l E)` equal `−1/2`. Their sum `−1` is the slope of `D_cris(det V_l E) = D_cris(ε_l)`, on which `φ` is `l^{−1}`; the dual `H¹` has the slopes `+1/2`. A definition asking only for the Hodge–Tate weights would accept it.
- If `ρ` is ordinary of weight `λ`, then `ρ^∨ ⊗ ε_l^{1−n}` is ordinary of weight `(−λ_{τ,n+1−i})_{τ,i}`; so a conjugate self-dual ordinary `ρ` with `ρ^c ≅ ρ^∨ ε_l^{1−n}` has `λ_{τc,i} = −λ_{τ,n+1−i}`, the condition of NT21, Corollary 5.4. For `n = 2`, `λ_τ = (0, −1)` gives `λ_{τc} = (1, 0)`.

### 0.2 Principal-series characterisation of `ι`-ordinarity

Let `F` be CM or totally real, `l` a prime, `ι : Q̄_l ≅ ℂ`, `λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}` and `π` a regular algebraic automorphic representation of `GL_n(𝔸_F)` of weight `ι_*λ` (AutomorphicGaloisRepresentationsPartII AG2.0, regular algebraic automorphic representations and their weight). `ι`-ordinarity is the notion of PotentialAutomorphyInfrastructure §3.44; it needs neither cuspidality nor a polarization. Suppose `π_v` is generic for every `v | l`, which holds when `π` is cuspidal. Prove that `π` is `ι`-ordinary if and only if for every `v | l` there are smooth characters `χ_{v,1}, …, χ_{v,n} : F_v^× → Q̄_l^×` such that

1. `val_l(χ_{v,i}(ϖ_v)) = e_v^{−1} Σ_{τ : F_v → Q̄_l} (λ_{τ,n+1−i} − (n − 1)/2 + i − 1)` for every uniformizer `ϖ_v` and every `i`, where `e_v` is the absolute ramification index of `F_v` and `val_l(l) = 1`; and
2. `π_v` is the generic irreducible subquotient of the normalised induction `n-Ind_{B_n}^{GL_n(F_v)} (ιχ_{v,1} ⊗ ⋯ ⊗ ιχ_{v,n})`, `B_n` the upper triangular Borel subgroup.

The valuations in (1) increase strictly with `i`. When `π` is `ι`-ordinary the tuple `(χ_{v,1}, …, χ_{v,n})` is determined by `ι` and `ι⁻¹π_v`, and the ordinary part has dimension one (Tho15, Lemma 2.3 and the remark after it, p. 9, proof p. 10, for RAECSDC `π` over a CM field; CT14, Definition 2.4 and Lemma 2.5, p. 5, proof pp. 5–6, for regular algebraic `π`; Ger19, Lemmas 5.1.1 and 5.1.3, pp. 59–60). The genericity hypothesis cannot be dropped: the trivial representation of `GL_n(𝔸_F)`, `n ≥ 2`, has weight `0` and each of its components is a subquotient of an induction with the valuations of (1), but it is not `ι`-ordinary. NT26, Definition 2.5(1) (p. 11) states the same criterion with `ι` written where `ι⁻¹` is meant.

*Route.* By Geraghty's Lemma 5.1.1, for `0 ≤ b ≤ c` with `c > 0` the map from the `Iw(v^{b,c})`-invariants of `π_v` to the `T_n(v^b)`-invariants of the Jacquet module `(π_v)_{N_n}` is surjective, its kernel is the part where some `U^{(j)}_{ϖ_v}` is not invertible, and `U^{(j)}_{ϖ_v}` corresponds to `δ_{B_n}^{−1}(α^{(j)})·(π_v)_{N_n}(α^{(j)})` with `α^{(j)} = diag(ϖ_v 1_j, 1_{n−j})` (the same comparison is used in PotentialAutomorphyInfrastructure §3.46). Hence `π` is `ι`-ordinary at `v` exactly when `(ι⁻¹π_v)_{N_n}` contains a character `χ δ_{B_n}^{1/2}` whose values on the `α^{(j)}`, corrected by the weight factor, are `l`-adic units; unwinding `δ_{B_n}^{1/2}` gives (1), and Frobenius reciprocity puts `π_v` in `n-Ind(ιχ)`. The semisimplified Jacquet module of the full induced representation `n-Ind(χ_1, …, χ_n)` is the sum of the Weyl translates `χ^w δ_{B_n}^{1/2}` (geometric lemma); by exactness of the Jacquet functor, the semisimplified Jacquet modules of its irreducible subquotients partition this multiset, so each subquotient receives only some of the Weyl terms. Strictly increasing valuations single out one `w`, and the classification of generic representations through segments shows that the character with increasing valuations lies in the Jacquet module of the generic subquotient and of no other.

*Needs:* PotentialAutomorphyInfrastructure §§3.44, 3.46; AutomorphicGaloisRepresentationsPartII AG2.0 (regular algebraic automorphic representations and their weight); SmoothRepresentationsOfLocalGroups §SR.2.2 (normalised parabolic induction, Jacquet modules, first adjointness, the geometric lemma and the principal-series Jacquet module), §SR.2.3 (Iwahori invariants and Jacquet modules), §SR.5.2 (segment representations and the genericity of the Langlands quotient of a segment).

**Checks.**

- For `n = 1` condition (1) reads `val_l(ι⁻¹π_v(ϖ_v)) = e_v^{−1} Σ_τ λ_τ`, which holds for every algebraic Hecke character of weight `ι_*λ`.
- If `n ≥ 2` and `π_v` is supercuspidal at some `v | l`, then `π` is `ι`-ordinary for no `ι`: a supercuspidal representation is not a subquotient of a principal series.
- The trivial representation of `GL_n(𝔸_F)`, `n ≥ 2`, is a non-generic subquotient of `n-Ind(|·|^{(n−1)/2} ⊗ ⋯ ⊗ |·|^{(1−n)/2})` at each `v`; `U^{(j)}_{ϖ_v}` acts on its Iwahori invariants by `q_v^{j(n−j)}`, not an `l`-adic unit for `0 < j < n`, so it is not `ι`-ordinary. This is the negative control for the genericity hypothesis.
- For `λ = 0` and `π_v = St_n ⊗ (ψ_v ∘ det)` with `ψ_v` unramified and `ψ_v(ϖ_v)` a root of unity, `π_v` is the generic subquotient of `n-Ind(ψ_v|·|^{(n−1)/2} ⊗ ⋯ ⊗ ψ_v|·|^{(1−n)/2})`, whose characters have valuations `f_v(i − 1 − (n − 1)/2)` at `ϖ_v`, in agreement with (1) since `e_v^{−1}·[F_v : ℚ_l] = f_v`.
- The geometric lemma describes the full induced representation, not each subquotient. For `GL₂(ℚ₃)` and `n-Ind(|·|^{1/2} ⊗ |·|^{−1/2})`, with constituents the trivial character and the Steinberg representation, the Jacquet module of the induced representation has dimension `2`, with characters `δ_{B_2}` and `1`; the Steinberg constituent receives `δ_{B_2}` and the trivial character receives `1`, each a one-dimensional Jacquet module. Asking every subquotient to carry all Weyl terms would give `1 = 2`.

### 0.3 Automorphic polarized representations and their levels

Let `F` be CM or totally real, `l` a prime and `ι : Q̄_l ≅ ℂ`. Let `(r, µ)` be a polarized `l`-adic representation of `G_F` (ArithmeticGaloisRepresentations §7.4; AutomorphicGaloisRepresentationsPartII AG2.0). Define:

- `(r, µ)` is *automorphic* if there is a regular algebraic cuspidal polarized automorphic representation `(π, χ)` of `GL_n(𝔸_F)` with `(r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n})`;
- *automorphic of level prime to `l`* (respectively *of level potentially prime to `l`*) if moreover `π_v` is unramified (respectively becomes unramified after a finite base change) for every `v | l`;
- *ordinarily automorphic* if moreover `π` is `ι`-ordinary (PotentialAutomorphyInfrastructure §3.44).

The same terms apply to `r` alone (`r ≅ r_{l,ι}(π)`) and to a mod `l` pair `(r̄, µ̄)` through the residual representation `r̄_{l,ι}(π)` with its `𝒢_n`-valued extension of multiplier `ε̄^{1−n}r̄_{l,ι}(χ)` (AutomorphicGaloisRepresentationsPartII AG2.7, residual representation of `π`). None of these notions depends on `ι` (BLGGT14 §2.1, definitions after remarks (6)–(7) following Theorem 2.1.1, pp. 34–35, and the sentence invoking Clozel's Theorem 3.13, p. 35; the level of a pair, p. 32).

Finite coefficients. A regular algebraic cuspidal `π` and its Galois representation are realized over some finite extension `E′/E` with an `O_{E′}`-stable lattice and integral multiplier (AutomorphicGaloisRepresentationsPartII AG2.7, finite `p`-adic realization before lattices and residual representation of `π`); automorphy quantifies over such witnessed `π` and does not assert that every `π` is realized over a prescribed `E`. Containing the embeddings of `F` in `E` does not realize a given `π` over `E`. After a coefficient extension `E′/E` the lattice is transported along `O_E → O_{E′}` and the semisimplified residual representation along `k_E → k_{E′}`; the residual representation is independent of the lattice up to isomorphism over `k̄_l`.

*Route.* The Galois representation `r_{l,ι}(π)` exists by AutomorphicGaloisRepresentationsPartII AG2.3 (arbitrary regular conjugate-self-dual existence, after the algebraic twist of AG2.2); its totally odd polarization by `ε_l^{1−n}r_{l,ι}(χ)`, its Hodge–Tate weights and local–global compatibility are AutomorphicGaloisRepresentationsPartII AG2.6 (polarized admissibility and full polarized local–global compatibility at `l`) and AG2.5 (away from `l`); the residual representation and its `𝒢_n`-valued extension come from AG2.7. Independence of `ι` is Clozel's theorem that the `Aut(ℂ)`-conjugate of a regular algebraic cuspidal `π` is automorphic, applied to `ι′ ∘ ι⁻¹`.

*Needs:* ArithmeticGaloisRepresentations §7.4 (polarized representations, `𝒢_n`, multipliers, total oddness); AutomorphicGaloisRepresentationsPartII AG2.0 (polarized automorphic representations; the `l`-adic character of an algebraic Hecke character; the parity of the Galois multiplier), AG2.2–AG2.3 (algebraic twisting and arbitrary regular conjugate-self-dual existence), AG2.5 (Caraiani's away-prime compatibility), AG2.6 (polarized admissibility and full local–global compatibility at the coefficient prime; Aut(ℂ)-conjugates and the compatible system attached to `π`), AG2.7 (finite realization, residual representation, lattice and coefficient-extension independence); PotentialAutomorphyInfrastructure §§3.44–3.45.

**API.**

- `(r, µ)` is automorphic exactly when `(r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n})` for some regular algebraic cuspidal polarized `(π, χ)`; the three refinements add, respectively, that `π_v` is unramified for all `v | l`, unramified after a finite base change for all `v | l`, or that `π` is `ι`-ordinary.
- Each of the four notions is the same for every choice of `ι : Q̄_l ≅ ℂ`.
- If `(r, µ)` is automorphic then so is its residual pair `(r̄^{ss}, µ̄)`, with the same witness `π`.
- An automorphic `(r, µ)` is totally odd: `µ(c_v)` is independent of `v | ∞` and the sign of the pairing is `+1`.
- If `(r, µ)` is ordinarily automorphic, then `r` is `ι`-ordinarily automorphic in the sense of PotentialAutomorphyInfrastructure §3.45, through the same `π` with its polarization forgotten.
- A witnessed `π` gives a continuous `G_F → GL_n(O_{E′})` over a finite `E′/E` whose scalar extension is `r_{l,ι}(π)`; its semisimplified reduction is independent of the lattice and compatible with further coefficient extension.

**Checks.**

- For `n = 1` and `F` imaginary, an algebraic character `ψ` of `G_F` with `ψψ^c = µ|G_F` and `µ(c_v) = −1` for all `v | ∞` is automorphic: `ψ = r_{l,ι}(φ)` for an algebraic Hecke character `φ`.
- A polarized `(r, µ)` with pairing sign `−1` at some real place of `F⁺` is not automorphic, because `(r_{l,ι}(π), ε_l^{1−n}r_{l,ι}(χ))` is totally odd (BLGGT14, Theorem 2.1.1(1)). This rules out a definition that forgets the multiplier.
- If `(r, µ)` is automorphic of level prime to `l`, then `r|G_{F_v}` is crystalline for every `v | l` (BLGGT14, Theorem 2.1.1(4)). For `F = ℚ`, `n = 2` and `E/ℚ` with split multiplicative reduction at `l`, the representation `H¹(E_{Q̄}, Q̄_l)` with multiplier `ε_l^{−1}` is automorphic but not of level potentially prime to `l`: `π_l` is an unramified twist of Steinberg, and base change keeps it a twist of Steinberg, never unramified. The level notions are strictly stronger than automorphy.
- If `(r, µ)` is ordinarily automorphic via `π` of weight `ι_*λ`, then `r` is ordinary of weight `λ` (§0.4).
- Total oddness uses the corrected normalisation `χ_v(−1) = (−1)^{n+w}` of AutomorphicGaloisRepresentationsPartII AG2.0 for `(π, χ)` of weight in `(ℤⁿ)_w`: for `n = 1`, `w = 1` the printed condition `χ_v(−1) = (−1)^n = −1` would give `µ(c_v) = (−1)^{n−1+w}χ_v(−1) = −1·−1 = +1`, an even multiplier, while the corrected `χ_v(−1) = +1` gives `µ(c_v) = −1`.

### 0.4 `ι`-ordinary automorphic representations have ordinary Galois representations

Let `F` be CM or totally real, `ι : Q̄_l ≅ ℂ` and `(π, χ)` a regular algebraic cuspidal polarized automorphic representation of `GL_n(𝔸_F)` of weight `ι_*λ`. Prove that if `π` is `ι`-ordinary then `r_{l,ι}(π)` is ordinary of weight `λ` (§0.1) (Tho15, Theorem 2.4 and Corollary 2.6, pp. 10–12; BLGGT14 §2.1, remark (6) after Theorem 2.1.1, p. 34; Ger19, Propositions 5.3.1 and 5.4.1, pp. 63–66, under additional hypotheses). PotentialAutomorphyInfrastructure §3.48 proves the same conclusion without a polarization but under residual irreducibility and decomposed genericity; the polarized statement here needs no residual hypothesis.

*Route.* If `F` is totally real, choose an imaginary quadratic `M/F` in which every `v | l` splits and with `BC_{M/F}(π)` cuspidal (avoid the finitely many quadratic extensions cut out by characters `η` with `π ≅ π ⊗ (η ∘ det)`); at `w | v | l`, `BC(π)_w ≅ π_v` and `r_{l,ι}(BC π)|G_{M_w} = r_{l,ι}(π)|G_{F_v}`, so both properties can be checked over `M`. For `F` imaginary, local–global compatibility at `v | l` for arbitrary `π_v` (AutomorphicGaloisRepresentationsPartII AG2.6, full polarized local–global compatibility at `l`) identifies the Weil–Deligne representation of the weakly admissible filtered `(φ, N, Gal(L/F_v))`-module `D` of `r_{l,ι}(π)|G_{F_v}` with `rec(ι⁻¹π_v ⊗ |det|^{(1−n)/2})`, with Hodge filtration jumps `λ_{τ,j} + n − j`. By §0.2, `π_v` lies in a principal series with strictly increasing valuations, so the Weil group acts on `D` through `n` distinct characters; the sums `G_i` of the first `i` eigenspaces are stable under `φ`, `N` and `Gal(L/F_v)`, `t_N(G_i)` equals the least value `t_H` can take on a rank-`i` submodule, and weak admissibility forces equality, so each `G_i` is weakly admissible and the representation is upper triangular. The `i`-th graded piece is the module of a character `ψ_i` with `ψ_i(Art_{F_v}(x)) = χ_{v,i}(x)∏_τ τ(x)^{−(λ_{τ,n−i+1}+i−1)}` on `O_{F_v}^×`, which is the finite-order condition.

*Needs:* §§0.1–0.2; PotentialAutomorphyInfrastructure §3.44; AutomorphicGaloisRepresentationsPartII AG2.6 (polarized admissibility and full polarized local–global compatibility at the coefficient prime); PadicHodgeTheory §§3.4–3.5 (filtered `(φ, N)`-modules, weak admissibility and the Colmez–Fontaine theorem), §5.3 (potentially semistable periods and the Weil–Deligne representation); EndoscopicTransferAndUnitaryTraceComparison §6.24 (cyclic base change, for the totally real reduction).

**Checks.**

- For `n = 1` the statement identifies the Hodge–Tate weights of `r_{l,ι}(φ)` with the infinity type of an algebraic Hecke character `φ`, which is AutomorphicGaloisRepresentationsPartII AG2.0.
- For a weight-zero `π` that is a twist of Steinberg at every `v | l` (`ι`-ordinary by §0.6), the conclusion gives a semistable ordinary `r_{l,ι}(π)` with `HT_τ = {0, 1, …, n − 1}`, the shape of the Tate curve for `n = 2`.
- For `E/ℚ` with good ordinary reduction at `l ≥ 3`, the attached `π` of weight `(0, 0)` is `ι`-ordinary at `l` (PotentialAutomorphyInfrastructure §3.45), and `H¹(E)|G_{ℚ_l}` has an unramified invariant line and quotient `ε_l^{−1}` times an unramified character: this is ordinary of weight `(0, 0)` with `HT = {λ_1 + 1, λ_2} = {1, 0}`. Reading the flag in the opposite order (quotient unramified) would give weight `(−1, −1)` shifted, with the wrong Hodge–Tate weights.

### 0.5 Ordinary Galois representations come from `ι`-ordinary automorphic representations

Let `F` be CM or totally real and `(π, χ)` a regular algebraic cuspidal polarized automorphic representation of `GL_n(𝔸_F)` of level potentially prime to `l`. Prove that if `r_{l,ι}(π)|G_{F_v}` is ordinary for every `v | l`, then `π` is `ι`-ordinary (BLGGT14 §2.1, remark (7) after Theorem 2.1.1, p. 34; Ger19, Lemmas 5.1.6 and 5.2.1, pp. 60–63). In particular a polarized `(r, µ)` that is automorphic of level potentially prime to `l` and ordinary at every `v | l` is ordinarily automorphic. Together with §0.4: for `π` of level potentially prime to `l`, `π` is `ι`-ordinary if and only if `r_{l,ι}(π)` is ordinary at every `v | l`.

*Route.* Choose by PotentialAutomorphyInfrastructure §2.5 a soluble Galois `M/F`, CM or totally real, over which `π` becomes unramified at every `w | l`, linearly disjoint from the compositum of the finitely many cyclic extensions of prime degree inside the field cut out by `ad r_{l,ι}(π)`; then no cyclic step of the base change has a self-twist, so `π_M` is cuspidal (PotentialAutomorphyInfrastructure §2.3; irreducibility of `r_{l,ι}(π)` is not available, which is why §0.9 is not what is used). At level prime to `l` (Ger19, Lemma 5.2.1, whose proof is local and applies to `π_M` through local–global compatibility): `r|G_{M_w}` is crystalline, the Frobenius eigenvalues of its Weil–Deligne representation are `q_w^{(n−1)/2}χ_j(ϖ_w)` for the Satake characters of `π_{M,w} = n-Ind(χ_1, …, χ_n)`, and ordinarity of weight `λ` gives them the valuations of §0.2(1) after reordering; `π_{M,w}` is the full induced representation (cuspidal, hence generic) and its Jacquet module contains every Weyl conjugate, so the ordinary part is nonzero. Descent of `ι`-ordinarity from `π_M` to `π` is PotentialAutomorphyInfrastructure §3.47.

*Needs:* §§0.1–0.3; PotentialAutomorphyInfrastructure §§2.3, 2.5, 3.44, 3.47; AutomorphicGaloisRepresentationsPartII AG2.6 (polarized admissibility at the coefficient prime: crystalline at unramified `π_v`).

**Checks.**

- For `n = 1` both sides hold for every algebraic Hecke character.
- The level hypothesis is used: for `n = 2` and the representation attached to an elliptic curve with split multiplicative reduction at `l`, `r|G_{ℚ_l}` is ordinary and `π_l` is an unramified twist of Steinberg, which is `ι`-ordinary by §0.6 although it is not of level potentially prime to `l`; the theorem is silent there, and its converse direction §0.4 still applies.
- Ger19's published Lemma 5.9 (cited in that numbering by later work) is the preprint Lemma 5.2.1, which assumes level prime to `l`; an application to a representation known only to be crystalline at `l` must first show that the automorphic witness is unramified above `l`, from crystallinity and local–global compatibility at `l`.

### 0.6 Weight-zero twisted Steinberg representations are `ι`-ordinary

Let `F` be totally real or CM, `p` a prime and `π` a RAESDC or RAECSDC automorphic representation of `GL_n(𝔸_F)` of weight `0` such that `π_v` is a character twist of the Steinberg representation for every `v | p`. Prove that `π` is `ι`-ordinary for every `ι : Q̄_p ≅ ℂ` (NT26, Lemma 2.6, p. 12; Ger19, Lemma 5.1.5, p. 60, which is the published Lemma 5.6; BLGGT14 §2.1, p. 33). This is the global weight-zero form of the local criterion PotentialAutomorphyInfrastructure §3.46, extended from unramified twists over CM fields to arbitrary character twists over totally real or CM fields. Both weight zero and the condition at every `p`-adic place are needed.

*Route.* A character twist `ψ_v` of `F_v^×` is the product of an unramified character and a finite-order character trivial on `ϖ_v`; twisting by the latter changes the normalised `U`-eigenvalues by roots of unity on deep enough Iwahori invariants (PotentialAutomorphyInfrastructure §3.44, twists by finite-order characters), so it suffices to treat unramified `ψ_v`. Then `St_n ⊗ (ψ_v ∘ det)` is the generic subquotient of `n-Ind(ψ_v|·|^{(n−1)/2} ⊗ ⋯ ⊗ ψ_v|·|^{(1−n)/2})`; weight zero and algebraicity of the central character make `ι⁻¹ψ_v(ϖ_v)^n` an `l`-adic unit, which is the hypothesis of PotentialAutomorphyInfrastructure §3.46 with `c_τ = 0`.

*Needs:* PotentialAutomorphyInfrastructure §§3.44, 3.46; §0.2.

**Checks.**

- For `n = 2` and `F = ℚ`, a weight-two newform of level `Γ₀(pN)` that is new at `p` is `ι`-ordinary at `p`, since `U_p` acts by `±1`.
- A weight-zero `π` that is Steinberg at only some of the places above `p` need not be `ι`-ordinary: at a remaining place `π_v` may be unramified with Satake parameters of valuation `1/2`, as for a supersingular elliptic curve over a field in which `p` splits.
- For `GL₂(ℚ₅)` with `ψ_v(5) = 1`, `U^{(1)}` acts by `1` on the Iwahori-fixed Steinberg line; omitting the factor `δ_B^{−1}(diag(5,1)) = 5` in the Jacquet comparison would give `1/5`, of valuation `−1`, and wrongly exclude this representation.

### 0.7 Ordinarity of a regular algebraic isobaric sum

Let `F` be imaginary CM and `π_1`, `π_2` cuspidal conjugate self-dual automorphic representations of `GL_{n_1}(𝔸_F)` and `GL_{n_2}(𝔸_F)`, `n_1 + n_2 = n`, with `Π = π_1 ⊞ π_2` regular algebraic; then `π_1|det|^{(n_1−n)/2}` and `π_2|det|^{(n_2−n)/2}` are regular algebraic. For `τ : F → ℂ`, with `v` the place of `τ` and `F_v ≅ ℂ` through `τ`, write `rec(π_{1,v})|_{ℂ^×} = ⊕_j (z/z̄)^{b_{τ,j}}` and `rec(π_{2,v})|_{ℂ^×} = ⊕_j (z/z̄)^{c_{τ,j}}` with `b_{τ,1} > ⋯ > b_{τ,n_1}` and `c_{τ,1} > ⋯ > c_{τ,n_2}`; put `d_τ = (b_{τ,1}, …, b_{τ,n_1}, c_{τ,1}, …, c_{τ,n_2})` and let `w_τ ∈ S_n` be the unique permutation for which `(d_{τ,w_τ(1)}, …, d_{τ,w_τ(n)})` is decreasing. Prove that `Π` is `ι`-ordinary (PotentialAutomorphyInfrastructure §3.44, for the non-cuspidal regular algebraic `Π`) if and only if `π_1|det|^{(n_1−n)/2}` and `π_2|det|^{(n_2−n)/2}` are `ι`-ordinary and `w_τ` depends only on the place `v | l` of `F` induced by `ι⁻¹τ` (CT14, Lemma 2.6 and its proof, p. 6; the sums and `w_τ` are introduced in §2.1, p. 3). The statement concerns two cuspidal summands; regularity of `Π` alone does not give the condition on `w_τ`.

*Route.* At `v | l`, `π_{1,v}` and `π_{2,v}` are generic subquotients of principal series with characters `β_1, …, β_{n_1}` and `γ_1, …, γ_{n_2}` ordered by non-decreasing valuation at `ϖ_v`, and `Π_v` is the generic subquotient of the principal series of their union, reordered as `α_1, …, α_n`; by §0.2 a regular algebraic representation with generic component at `v` is `ι`-ordinary at `v` if and only if `val(α_j(ϖ_v)) = −e_v^{−1}Σ_τ a_{τ,j}` for all `j`, the sum over `τ` inducing `v` and `a` the infinity type (CT14, Lemma 2.5(2)). Necessity: the valuations of the `α_i` are distinct, so they define a permutation `w_v` of the concatenated characters; at the first index where `w_v` and some `w_τ` differ, integrality of the summands' `U`-eigenvalues and regularity of `Π` give a contradiction, so `w_τ = w_v`, and the valuations of the `β_j`, `γ_j` are those of `ι`-ordinary shifted summands. Sufficiency: with `w_v` the common value, `val(δ_{w_v(j)}(ϖ_v)) = −e_v^{−1}Σ_τ a_{τ,j}`, strictly increasing in `j`, so §0.2 applies.

*Needs:* §0.2; PotentialAutomorphyInfrastructure §3.44; AutomorphicGaloisRepresentationsPartII AG2.0 (regular algebraic representations and their weight).

**Checks.**

- NT26, proof of Lemma 3.5(2) (p. 17), uses only the sufficiency direction, for `π_1 = BC_{K_1/F}(Sym^r σ) ⊗ XY^{−r}|·|^{(r−1)/2}` on `GL_{r+1}` and `π_2 = BC_{K_1/F}(Sym^{r−2} σ) ⊗ X^{−1}Y^{2−r}|·|^{(r−1)/2}` on `GL_{r−1}`, `n = 2r`: the condition on `w_τ` holds because `σ` has parallel Hodge–Tate weights `{0, 2}` and the weights of `r_ι(X)`, `r_ι(Y)` depend only on the place of the imaginary quadratic field `K_0` below `ι⁻¹τ`; the interleavings over `u_0` and `u_0^c` differ, so `w_τ` is not constant over all `τ`.
- A regular sum whose interleavings differ at two embeddings inducing the same `v | l` fails the criterion even when its shifted summands are `ι`-ordinary.
- For `n_1 = n_2 = 1` and `F_v = ℚ_l`, the criterion reduces to: `Π` is `ι`-ordinary iff the two Hecke characters (both shifted by `|·|^{−1/2}`) have the valuations of their infinity types, the larger infinity type on the character of smaller valuation.

### 0.8 Automorphy is invariant under algebraic twists

Let `F` be CM or totally real and `ψ` an algebraic character of `G_F`. If `F` is imaginary let `φ` be `ψ` composed with the transfer `G_{F⁺}^{ab} → G_F^{ab}`; if `F` is totally real let `φ = ψ²`. Prove that `(r, µ)` is automorphic if and only if `(r ⊗ ψ, µφ)` is automorphic (BLGGT14, Lemma 2.2.1, p. 35). The same equivalence holds for automorphic of level potentially prime to `l` and for ordinarily automorphic (`ι`-ordinarity is invariant under algebraic twists, BLGGT14 §2.1, p. 33, and PotentialAutomorphyInfrastructure §3.44), and for automorphic of level prime to `l` when `ψ` is crystalline at every place above `l`, equivalently when the algebraic Hecke character `ψ_𝔸` with `r_{l,ι}(ψ_𝔸) = ψ` is unramified at every `v | l`. BLGGT14 use this last form, for a character that is crystalline but ramified above `l`, at the end of the proof of Proposition 4.1.1 (p. 53).

*Route.* `ψ = r_{l,ι}(ψ_𝔸)` for an algebraic Hecke character `ψ_𝔸` (AutomorphicGaloisRepresentationsPartII AG2.0; BLGGT14 §A.2, p. 87). If `(r, µ) ≅ (r_{l,ι}(π), r_{l,ι}(χ)ε_l^{1−n})`, put `χ′ = χ·ψ_𝔸|_{𝔸_{F⁺}^×}` for `F` imaginary and `χ′ = χψ_𝔸²` for `F` totally real; then `(π ⊗ (ψ_𝔸 ∘ det), χ′)` is regular algebraic, cuspidal and polarized, since `ψ_𝔸ψ_𝔸^c = ψ_𝔸|_{𝔸_{F⁺}^×} ∘ N_{F/F⁺}`, and restriction of a Hecke character to `𝔸_{F⁺}^×` corresponds to composition with the transfer. For `F` imaginary `φ(c_v) = 1`, so total oddness is preserved in the normalisation of AutomorphicGaloisRepresentationsPartII AG2.0. Levels: each `ψ_{𝔸,v}` is of finite order on `O_{F_v}^×`, so it becomes unramified after a finite base change; for `v | l`, `ψ|G_{F_v}` is crystalline if and only if `ψ_{𝔸,v}` is unramified.

*Needs:* §0.3; AutomorphicGaloisRepresentationsPartII AG2.0 (the `l`-adic character of an algebraic Hecke character, and polarized pairs); PotentialAutomorphyInfrastructure §3.44.

**Checks.**

- For `ψ` of finite order unramified above `l`, and for `ψ = ε_l` (crystalline but ramified at `l`, with `ψ_𝔸 = ‖·‖`), level prime to `l` is preserved.
- For `ψ` of finite order ramified at some `v | l` and `π_v` unramified, `π_v ⊗ (ψ_{𝔸,v} ∘ det)` is ramified: level prime to `l` is lost while level potentially prime to `l` is kept. The Galois character itself need not become unramified after base change (`ε_l` does not), which is why the level is read on `ψ_{𝔸,v}`.
- BLGGT14's printed parity `χ_v(−1) = (−1)^n` is not preserved by twists of odd weight; with the normalisation `χ_v(−1) = (−1)^{n+w}` of AG2.0 the twist by `ψ` of weight `1` changes both `w` and `χ_v(−1)` and preserves total oddness.

### 0.9 Soluble base change and descent of polarized automorphy

Let `M/F` be a soluble Galois extension with `M` CM or totally real, and `(r, µ)` a polarized `l`-adic representation of `G_F` with `r|G_M` irreducible. Prove that `(r, µ)` is automorphic if and only if `(r|G_M, µ|G_{M⁺})` is automorphic (BLGGT14, Lemma 2.2.2, p. 35; Tho15, Lemma 2.7, p. 12; CT14, Theorem 2.7, pp. 6–7). The equivalence holds with automorphic of level potentially prime to `l` on both sides, and level prime to `l` descends from `M` to `F` when every place of `F` above `l` splits completely in `M`. For `F` and `M` imaginary CM and `µ(c_v)` independent of `v | ∞`: if `r|G_M` is automorphic of weight `ν ∈ (ℤⁿ₊)^{Hom(M,Q̄_l)}` then `ν = λ_M` for some `λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_l)}`, `(λ_M)_τ = λ_{τ|F}`, and `r` is automorphic of weight `λ` (Tho12, Lemma 1.2, p. 6). This adds the multiplier and the level conditions to the unpolarized base change and descent of PotentialAutomorphyInfrastructure §2.3.

*Route.* Reduce to `M/F` cyclic of prime degree along a composition series. Base change: the Arthur–Clozel base change of `π` to `M` is cuspidal because `r|G_M` is irreducible (PotentialAutomorphyInfrastructure §2.3(1)). Descent: a cuspidal `π_M` with `r_{l,ι}(π_M) ≅ r|G_M` is `Gal(M/F)`-invariant and descends to some `π` on `GL_n(𝔸_F)`, unique up to twisting by characters of `Gal(M/F)`; comparing Frobenius polynomials at unramified places selects the twist with `r_{l,ι}(π) ≅ r` (PotentialAutomorphyInfrastructure §2.3(2)). The polarization descends: `π^c` and `π^∨ ⊗ (χ ∘ N ∘ det)` have isomorphic base changes and Galois representations, so they agree by the same twist argument, and the multiplier character of `M⁺` descends to `F⁺` by comparing `µ` with its restriction. Levels transfer through the local base change identities at every finite place of PotentialAutomorphyInfrastructure §2.3 and `ι`-ordinarity through §3.47.

*Needs:* §0.3; PotentialAutomorphyInfrastructure §§2.3, 3.47; EndoscopicTransferAndUnitaryTraceComparison §6.24 (all-place compatibility of cyclic base change); ArithmeticGaloisRepresentations §5.3 (recognition of semisimple representations from Frobenius polynomials on a density-one set).

**Checks.**

- For `M = F` the statement is the identity.
- Irreducibility of `r|G_M` is needed: for `M/F` CM quadratic and `π` automorphically induced from `M`, the base change is not cuspidal, and the restriction is the sum of two conjugate characters' representations.
- Level prime to `l` does not descend along an extension ramified above `l`: for `π_v` a ramified quadratic twist of an unramified principal series that becomes unramified over a ramified quadratic `M_w/F_v`, `π_M` is unramified at `w` while `π_v` is not.

### 0.10 Automorphy of an induced representation descends

Let `F` be CM or totally real and `M/F` a soluble Galois CM or totally real extension of degree `m`. Let `r : G_M → GL_n(Q̄_l)` be irreducible and `µ : G_{F⁺} → Q̄_l^×` continuous such that `(Ind_{G_M}^{G_F} r, µ)` is an automorphic polarized `l`-adic representation of `G_F` (induction from an open subgroup, ArithmeticGaloisRepresentations §1.3). Prove that `(r, µ|G_{M⁺})` is automorphic and polarized (BLGGT14, Lemma 2.2.4 and its proof, pp. 36–37). The archimedean input is BLGGT14, Lemma 2.2.3 (p. 36): an irreducible unitary `(𝔤, K)`-module of `GL_n(ℝ)` or `GL_n(ℂ)` with half-integral Harish-Chandra parameter satisfies `π^c ≅ π^∨`.

*Route.* Reduce to `m` prime: for `F ⊂ F_1 ⊂ M` with `F_1/F` cyclic of prime degree, the restriction to `G_M` of the Hodge–Tate regular `Ind_{G_M}^{G_F} r` is the sum of the `Gal(M/F)`-conjugates of `r`, which are therefore pairwise non-isomorphic, so `Ind_{G_M}^{G_{F_1}} r` is irreducible (Mackey); apply the prime case and induct. For `m` prime, with `σ` generating `Gal(M/F)` and `κ` its character group, `r_{l,ι}(Π) ⊗ κ ≅ r_{l,ι}(Π)` gives `Π ⊗ (κ ∘ Art_F ∘ det) ≅ Π`, so there is a cuspidal `π` on `GL_n(𝔸_M)` with `π ⊞ π^σ ⊞ ⋯ ⊞ π^{σ^{m−1}}` the base change of `Π` (EndoscopicTransferAndUnitaryTraceComparison §6.26); `π ⊗ ‖det‖^{n(1−m)/2}` is regular algebraic. Polarization: `π^c ≅ (π^{σ^i})^∨ ⊗ (χ ∘ N_{M/F⁺} ∘ det)` for some `i`; the central character makes `π ⊗ ‖det‖^{−wt(χ)/4}` unitary with half-integral Harish-Chandra parameter at each `v | ∞`, so Lemma 2.2.3 gives `π_v^c ≅ π_v^∨ ⊗ |det|_v^{wt(χ)/2}`, and regularity of the base change forces `i = 0`. Finally `r_{l,ι}(Π)|G_M` is both `⊕_j r_{l,ι}(π ⊗ ‖det‖^{n(1−m)/2})^{σ^j}` and `⊕_j r^{σ^j}`, and irreducibility of `r` identifies `r` with one summand.

*Needs:* §§0.3, 0.9; EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.26 (cyclic base change and automorphic induction); ArithmeticGaloisRepresentations §1.3 (continuous induction from open subgroups, Frobenius reciprocity, the Mackey decomposition), §5.3 (recognition by Frobenius polynomials); AutomorphicFormsOnReductiveGroups Layer 2 (real reductive representations), for the archimedean statement recorded as a supplier gap in the contracts.

**Checks.**

- For `m = 1` the statement is the identity.
- Irreducibility of `r` is needed: for `r = ψ ⊕ ψ^σ` the induction is reducible and is not the induction of either summand.
- The half-integrality hypothesis of the archimedean statement is needed. The unitary character `π(z) = (z/|z|)^k|z|^{it}` of `GL_1(ℂ)`, `k ∈ ℤ`, `t ∈ ℝ`, is `z^{(k+it)/2} z̄^{(−k+it)/2}`, with half-integral parameter exactly when `t = 0`; then `π^c(z) = π(z̄) = (z/|z|)^{−k} = π^∨(z)`. For `t ≠ 0`, `π^c = (z/|z|)^{−k}|z|^{it}` while `π^∨ = (z/|z|)^{−k}|z|^{−it}`.

### 0.11 Algebraic characters with prescribed conjugate norm and local behaviour

Let `l` be a prime, `F` imaginary CM with maximal totally real subfield `F⁺`, `S` a finite set of primes of `F` containing all primes above `l` with `S^c = S`, `χ : G_{F⁺} → Q̄_l^×` a continuous character and, for `v ∈ S`, continuous characters `ψ_v : G_{F_v} → Q̄_l^×` with `(ψ_vψ_{cv}^c)|I_{F_v} = χ|I_{F_v}`. Assume `ψ_v` is de Rham for `v | l`; nothing of the kind is assumed of `χ`, whose algebraicity follows. Prove:

1. if moreover every element of `S` is unramified over `F⁺` and `χ(c_v)` is independent of `v | ∞`, there is a continuous `θ : G_F → Q̄_l^×` with `θθ^c = χ|G_F` and `θ|I_{F_v} = ψ_v|I_{F_v}` for all `v ∈ S`;
2. without the two extra assumptions of (1), if `l > 2` and `θ̄ : G_F → F̄_l^×` is a continuous character with `θ̄θ̄^c` equal to the reduction of `χ|G_F` and `θ̄|G_{F_v}` equal to the reduction of `ψ_v` for every `v ∈ S`, there is a continuous `θ` lifting `θ̄` with `θθ^c = χ|G_F` and `θ|I_{F_v} = ψ_v|I_{F_v}` for all `v ∈ S`

(BLGGT14, Lemma A.2.5, statement pp. 88–89, proof pp. 89–90; (1) is deduced from Lemma A.2.4, p. 88, a restatement of Harris–Shepherd-Barron–Taylor's Lemma 2.2, and (2) from Clozel–Harris–Taylor's Lemma 4.1.6). With finite coefficients, both parts produce `θ` over a finite continuous coefficient extension `E′/E`, with the conjugate-norm and inertial prescriptions transported along `E → E′`; `θ` is not asserted to take values in the input field `E`.

*Route.* The idelic extension lemma (BLGGT14, Lemma A.2.4): continuous characters with algebraic values given compatibly on `F^×`, on the finite ideles of `F⁺` and on `∏_{v∈S} O_{F_v}^×` extend to one continuous character of `𝔸_F^×`; it follows from the finite-order character extension of PotentialModularityAndCompatibleSystems §2.15 applied after removing the algebraic parts, and global class field theory. For (1), replace `χ` by `χδ_{F/F⁺}` if necessary so that `χ(c_v) = 1`; `χ` is algebraic with all Hodge–Tate numbers equal to one integer `w`, and for `v | l`, `ψ_v ∘ Art_{F_v} = ∏_τ τ^{−m_τ}` on an open subgroup with `m_τ + m_{τc} = w`. Twist `χ` and the `ψ_v` by the corresponding algebraic characters to make them of open kernel; because `S` is unramified over `F⁺`, the norm maps `∏_{v∈S} O_{F_v}^×` onto its intersection with `𝔸_{F⁺}^×`, so the local data agree with `χ` there, the extension lemma applies, and untwisting gives `θ`. For (2), the one hypothesis of Clozel–Harris–Taylor's Lemma 4.1.6 is that `m_τ + m_{τc}` is independent of `τ`, which holds because it is the `τ`-Hodge–Tate number of the algebraic character `χ` of the totally real `F⁺`; the lift of `θ̄` uses the Teichmüller lift and `l > 2` to divide the correction by two. Finite realization: the resulting algebraic character is realized over a finite extension of `E` (AutomorphicGaloisRepresentationsPartII AG2.7, finite `p`-adic realization).

*Needs:* ClassFieldTheory Layer 12 (the global correspondence); PotentialModularityAndCompatibleSystems §2.15 (extending finite local characters); AutomorphicGaloisRepresentationsPartII AG2.0 (the `l`-adic character of an algebraic Hecke character), AG2.7 (finite realization); PadicHodgeTheory §3.6 (crystalline and de Rham characters with labelled weights).

**Checks.**

- BLGGT14, proof of Proposition 4.1.1 (p. 51), uses (1) to choose `θ` with `θθ^c = r_{l,ι}(χ)ε_l^{1−n}` and prescribed Hodge–Tate numbers, then (2) to choose `θ′` with `θ̄′ = θ̄` and `θ′θ′^c = µ`; BCG25, proof of Theorem 3.1 (p. 9), uses the same pair of choices.
- The constancy of `χ(c_v)` is necessary for any `θ` to exist. If `θθ^c = χ|G_F`, then `χ` is `θ ∘ V` or `(θ ∘ V)·δ_{F/F⁺}`, where `V : G_{F⁺}^{ab} → G_F^{ab}` is the transfer, and `(θ ∘ V)(c_v) = θ(c_v²) = 1` for every `v | ∞`; so `χ(c_v)` is `1` for all `v` or `−1` for all `v`. A `χ` with `χ(c_{v_1}) = 1` and `χ(c_{v_2}) = −1` admits no `θ`.
- The inertial compatibility `(ψ_vψ_{cv}^c)|I_{F_v} = χ|I_{F_v}` is necessary: restricting `θθ^c = χ|G_F` to `I_{F_v}` gives `θ|I_{F_v}·(θ|I_{F_{cv}})^c = χ|I_{F_v}`. For `S = {v, cv}` with `v` split over `F⁺` and `ψ_v = ψ_{cv} = 1`, the theorem therefore applies only to `χ` unramified at the place below `v`.

### Examples

- The cyclotomic character is ordinary of weight `(−1)` and the Tate-curve representation of weight `(−1, −1)` (§0.1); a supersingular elliptic curve is the non-example.
- A weight-two newform new at `p` is `ι`-ordinary at `p` (§0.6), and its Galois representation is ordinary (§0.4).
- The sufficiency direction of §0.7 is the check made in NT26 for a sum of two twisted symmetric-power base changes.

### Dependencies

PotentialAutomorphyInfrastructure §§2.3, 2.5, 3.44–3.47 (the parent: `ι`-ordinarity, the Steinberg criterion, soluble base change and auxiliary fields); AutomorphicGaloisRepresentationsPartII AG2.0, AG2.5–AG2.7; ArithmeticGaloisRepresentations §§1.3, 5.3, 7.4; LocalGaloisDeformationRings §§0.3, 1.7; PadicHodgeTheory §§3.4–3.6, 5.3; SmoothRepresentationsOfLocalGroups §§SR.2.2, SR.2.3, SR.5.2; EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.26; PotentialModularityAndCompatibleSystems §2.15; AutomorphicFormsOnReductiveGroups Layer 2; ClassFieldTheory Layer 12.

## Layer 1: Component deformation problems and potential diagonalizability

The lifting theorems of Layers 5–8 prescribe local behaviour by irreducible components of local lifting rings over `Q̄_l`. The relation "connects" between local lifts, with its restriction, direct-sum, tensor, dual and symmetric-power operations, is LocalGaloisDeformationRings §6.8. This layer adds what the global arguments use on top of it: the local deformation problem cut out by a set of components, the formal properties of strong connection with Choi's inertia lemma and the filtration lemma, and smoothness at generic points. Diagonalizable and potentially diagonalizable representations, the ordinary and Fontaine–Laffaille criteria and the operations by restriction, sums, tensor products, duals and twists are ModularityAndLanglandsExtensions §2.1; this layer adds the two criteria that section does not state, for potentially Barsotti–Tate representations of rank two and for symmetric powers.

Throughout, `K` is a finite extension of `ℚ_p`, `l` is a prime, and `ρ, ρ₁, ρ₂ : G_K → GL_n(O_{Q̄_l})` are continuous. Following BLGGT14 §§1.3–1.4, write `ρ₁ ∼ ρ₂` for LocalGaloisDeformationRings §6.8's relation: equivalent reductions and points on a common irreducible component of `Spec R^□_{ρ̄₁} ⊗ Q̄_l` when `l ≠ p`; when `l = p`, both potentially crystalline with equal labelled Hodge–Tate weights and points on a common irreducible component of the `K′`-crystalline lifting ring of that Hodge type for every sufficiently large finite `K′/K`. For a global `r : G_F → GL_n(Q̄_l)` with irreducible reduction, statements about `r|G_{F_v}` refer to an integral model, unique up to integral conjugation (BLGGT14 §1.3, p. 24, and §1.4, p. 29).

### 1.1 Strong connection and component deformation problems

Let `l ≠ p`. Define *`ρ₁` strongly connects to `ρ₂`*, written `ρ₁ ⇝ ρ₂`, if `ρ₁ ∼ ρ₂` and `ρ₁` lies on a unique irreducible component of `Spec R^□_{ρ̄₁} ⊗ Q̄_l` (BLGGT14 §1.3, p. 21). Construct, for a residual `ρ̄ : G_K → GL_n(k)` and a nonempty set `C` of irreducible components of `Spec R^□_{O,ρ̄}[1/l]` (for `l ≠ p`), or a nonempty finite set `C` of irreducible components of `lim_{K′} Spec R^□_{O,ρ̄,{H_τ},K′-ss}` for fixed multisets `{H_τ}` (for `l = p`), the ring `R^□_{O,ρ̄,C}`: the maximal reduced `l`-torsion-free quotient of `R^□_{O,ρ̄}` (for `l = p`, of `R^□_{O,ρ̄,{H_τ},K′-ss}` with `K′` large) whose spectrum is supported on `C`. Prove that the lifts whose classifying map factors through `R^□_{O,ρ̄,C}` form a local deformation problem `D_C` (BLGGT14 §1.3, p. 20, and §1.4, p. 26). The components are compared over `Q̄_l`: choose a finite coefficient extension `E′/E` over which every component in `C` is geometrically irreducible and work over `O_{E′}`; the construction does not depend on that choice, on further enlargement, or on the sufficiently large `K′` (LocalGaloisDeformationRings §§1.12, 3.7, 6.8). For `l = p` each component in `C` lies over the fixed-Hodge-type crystalline ideal, which is retained in the quotient.

*Route.* The framed lifting ring and, for `l = p`, its potentially semistable and potentially crystalline quotients of fixed Hodge type are LocalGaloisDeformationRings §§1.1 and 3.4. For `h ∈ GL_n(R^□_{O,ρ̄})` whose reduction centralizes `ρ̄`, the automorphism of `R^□_{O,ρ̄}` carrying the universal lift to its conjugate by `h` fixes every irreducible component of `Spec R^□_{O,ρ̄}[1/l]`: join `ρ` and `h⁻¹ρh` in a one-parameter family over a domain (BLGGT14, Lemma 1.2.2 and proof, p. 15); for `l = p` the same proof applies to the potentially crystalline quotients. This gives stability of the kernel of `R^□ → R^□_C` under strict conjugation, and the remaining axioms of a local deformation problem (LocalGaloisDeformationRings §F.3.1) hold for any reduced `l`-torsion-free quotient defined by a union of components (BLGHT11, Lemma 3.2).

*Needs:* LocalGaloisDeformationRings §§1.1, 1.12, 3.4, 3.7, 6.8, §F.3.1 (local deformation problems).

**API.**

- `⇝` is defined for `l ≠ p` only, and `ρ₁ ⇝ ρ₂` implies `ρ₁ ∼ ρ₂`.
- `∼` and `⇝` are invariant under `GL_n(O_{Q̄_l})`-conjugation of either argument and do not depend on the chosen equivalence of reductions.
- For nonempty `C`, `R^□_{O,ρ̄,C}` is reduced, `l`-torsion free, and its generic fibre is the union of the components in `C`; `D_C` is a local deformation problem.
- For `C ⊂ C′`, `D_C ⊂ D_{C′}`, and `D_{C}` for the set of all components is the problem of all lifts factoring through the maximal reduced `l`-torsion-free quotient.
- A lift `ρ` lies in `D_C` exactly when the point it defines lies on a component in `C`; in particular `ρ ∈ D_C` and `ρ ∼ ρ′` with `ρ` on a unique component imply `ρ′ ∈ D_C`.

**Checks.**

- `C = ∅` gives the zero quotient, which has no augmentation to `O`; this is why `C` is required nonempty.
- For `l ≠ p` and `ρ̄` unramified with `H⁰(G_K, ad ρ̄(1)) = 0`, the unrestricted ring is `O⟦X_1, …, X_{n²}⟧` (LocalGaloisDeformationRings §2.4), with a single component; `D_C` for that component is the problem of all lifts, and every lift strongly connects to every other.
- For `l = p`, if `C = {Q}` with `Q` containing the crystalline ideal of Hodge type `H`, then the component quotient is exactly `R^□/Q`. Dropping the crystalline ideal from the construction would allow a component of a different Hodge type, and two crystalline characters with equal reductions but different labelled weights would land in the same `D_C`.
- Two crystalline characters with equal reductions and equal labelled Hodge–Tate weights connect, since they differ by an unramified character with trivial reduction (BLGGT14 §1.4, remark (6)).

### 1.2 Properties of strong connection; Choi's lemma and the filtration lemma

Prove the following, with `WD(ρ_i) = (r_i, N_i)` (BLGGT14 §1.3, remarks (1)–(12), p. 21; Lemma 1.3.4 (Choi) and proof, pp. 21–23; Lemma 1.3.5 and proof, pp. 23–24; §1.4, remarks (1)–(7), p. 26).

1. For `l ≠ p`: `⇝` is transitive, and `ρ₁ ∼ ρ₂ ⇝ ρ₃` implies `ρ₁ ∼ ρ₃`. Symmetry of `⇝` and transitivity of `∼` are not claimed.
2. For `l ≠ p`: if `ρ₁ ∼ ρ₂` and `H⁰(G_K, (ad ρ₁)(1)) = 0`, then `ρ₁ ⇝ ρ₂`.
3. `ρ₁ ∼ ρ₂` implies `r₁|_{I_K} ≅ r₂|_{I_K}` (for `l = p`, of the Weil–Deligne representations of the potentially crystalline lifts); for `l ≠ p`, `ρ₁ ⇝ ρ₂` together with `ρ₂ ⇝ ρ₁` implies `(r₁|_{I_K}, N₁) ≅ (r₂|_{I_K}, N₂)`, hence equal conductors.
4. Unramified lifts with the same reduction connect (`l ≠ p`); `ρ₁ ∼ ρ₁ ⊗ µ` for `µ` unramified with `µ̄ = 1` (for `l = p`, with `ρ₁` potentially crystalline); `⇝` is preserved by duals and by twisting both sides by one continuous character.
5. (Filtration lemma.) If `ρ̄₁` is semisimple and `ρ₁` preserves a decreasing filtration by `O_{Q̄_l}`-direct summands (for `l = p`, with `ρ₁` potentially crystalline), then `ρ₁` connects to the direct sum of its graded pieces.
6. For `l = p`, `∼` is an equivalence relation.

*Route.* Transitivity for `l = p` holds because each potentially crystalline ring is formally smooth after inverting `l`, so its irreducible components are its connected components (LocalGaloisDeformationRings §3.10; §6.8 records transitivity on points lying on unique components). For (2), local duality gives `H²(G_K, ad ρ₁) = H⁰(G_K, (ad ρ₁)(1))^∨ = 0`, so the generic fibre is formally smooth at `ρ₁` of dimension `n²` by the tangent-space computation (BLGGT14 §1.3, p. 17; LocalGaloisDeformationRings §1.22), and `ρ₁` lies on a unique component. For (3) (Choi): the semisimplified restriction to `I_K` factors through a finite quotient and is locally constant on `Spec R^□ ⊗ Q̄_l`; at a point on a unique component the complete local ring is a power series ring carrying the inertia restriction, which identifies the full restrictions with their monodromy; for `l = p` use Kisin's argument for the potentially semistable rings. For (5), conjugate `ρ₁` by `diag(t^i)` on a filtration-adapted basis: this gives a family over the domain `O⟨t⟩` specializing to `ρ₁` at `t = 1` and to the graded representation at `t = 0`.

*Needs:* §1.1; LocalGaloisDeformationRings §§1.22, 2.4, 3.10, 6.8; ArithmeticGaloisDuality §§R02.4.2, D7.4 (local Tate duality); ArithmeticGaloisRepresentations §2.4 (Weil–Deligne representations and Grothendieck's monodromy theorem).

**Checks.**

- If `ρ₁` is unramified and `χ ≡ 1` modulo the maximal ideal is a character with `χ|I_K` nontrivial of `l`-power order (`l ≠ p`), then `ρ₁` and `ρ₁ ⊗ χ` have equal reductions but do not connect, since connected lifts have isomorphic restrictions to inertia (3). This is the negative control for (4).
- Connection alone does not fix the monodromy. Let `n = 2`, `l ≠ p`, `q ≡ 1 mod l` and `ρ̄` trivial. Let `ρ₁` be unramified with `ρ₁(Frob) = diag(1, q)`, and `ρ₂` the Steinberg lift with the same Frobenius and monodromy `N ≠ 0`. The family with monodromy `sN`, `s ∈ O`, lies on the Steinberg component and specializes to `ρ₁` at `s = 0`, so `ρ₁ ∼ ρ₂`, while `N₁ = 0 ≠ N₂`. `ρ₁` also lies on the unramified component, so `ρ₁ ⇝ ρ₂` fails; this is why (3) asks for strong connection in both directions. The unramified lift `1 ⊕ 1` (Frobenius eigenvalue ratio `1 ≠ q`) is not on the Steinberg component at all.
- NT21B, Lemma 3.5 and its proof (pp. 22–23): purity gives `H⁰(G_{ℚ_l}, (ad ρ)(1)) = 0`, hence strong connection in both directions by (2), and equal conductors by (3).
- For `l = p` and `ρ` ordinary and potentially crystalline: after restriction to `K′` over which `ρ̄` is trivial, (5) shows that `ρ|G_{K′}` connects to the sum of its graded characters; if `K′` also makes `ρ` and the characters crystalline, this is diagonalizability (ModularityAndLanglandsExtensions §2.1).

### 1.3 Generic local representations are smooth points, and smooth points are dense

Let `l ≠ p`. Prove (BLGGT14, Lemmas 1.3.2 and 1.3.3 with proofs, pp. 19–20; definitions of smooth and robustly smooth, p. 17):

1. If `ρ : G_K → GL_n(Q̄_l)` satisfies `ιWD(ρ)^{F-ss} ≅ rec_K(π)` for an irreducible generic smooth representation `π` of `GL_n(K)`, then `H⁰(G_K, (ad ρ)(1)) = 0`; so `ρ` lies on a unique component of `Spec R^□_{ρ̄} ⊗ Q̄_l`, and `ρ ∼ ρ′` implies `ρ ⇝ ρ′`.
2. The closed points of `Spec R^□_{O,ρ̄}[1/l]` that are robustly smooth (`H⁰(G_{K′}, (ad ρ_℘)(1)) = 0` for every finite `K′/K`) are Zariski dense; hence every irreducible component of `Spec R^□_{O,ρ̄}[1/l]` is generically formally smooth of dimension `n²`.
3. For finite Galois `K′/K`, the quotient `R^□_{O,ρ̄,K′-nr}[1/l]` classifying lifts with `ρ(I_{K′}) = 1` is zero or formally smooth of dimension `n²`.

LocalGaloisDeformationRings §1.22 proves the corresponding statement for pure Weil–Deligne representations; (1) is the generic case.

*Route.* (1) `H⁰(G_K, (ad ρ)(1)) = Hom_{G_K}(ρ, ρ(1))`, and Grothendieck's monodromy theorem turns a `G_K`-morphism into a morphism `WD(ρ) → WD(ρ)(1)`, hence one of Frobenius semisimplifications, since an intertwiner commutes with the semisimple parts of Frobenius; the generic local Langlands criterion of AutomorphicGaloisRepresentationsPartII AG2.6 (generic monodromy orbits and local genericity) makes `rec_K(π)` generic, so the space is zero. This is the segment argument of BLGGT14 Lemma 1.3.2, which AG2.6 owns. (2) At a closed point decompose the space into inertia-stable pieces `V_i` of a single type with Galois-stable partial sums (BLGGT14, Lemma 1.3.1, p. 18); over `O′⟦X_1, …, X_u⟧` keep inertia fixed and let a Frobenius lift act by `ρ_℘(φ)·A`, `A` acting on `V_i` by `1 + l^M X_i`. Invariants over some `K′` in `Hom(V_i, V_j(1))`, `i ≠ j`, would force finitely many equations `qαζ(1 + l^M x_i) = β(1 + l^M x_j)`, so a Zariski-generic specialization is robustly smooth. (3) For a maximal ideal `℘` of `R^□_{O,ρ̄,K′-nr}[1/l]`, the cohomology of `Gal(K′^{nr}/K)` with coefficients `ad ρ_℘` is that of the procyclic `G_K/I_K` on invariants of a finite group; so `H² = 0` and `h¹ = h⁰`.

*Needs:* §§1.1–1.2; LocalGaloisDeformationRings §§1.1, 1.18 (completed local rings at points of the generic fibre), 1.22, 2.4; ArithmeticGaloisDuality §D7.4 (local Tate duality and the local Euler characteristic); AutomorphicGaloisRepresentationsPartII AG2.6 (generic monodromy orbits and local genericity: the generic local Langlands criterion); ArithmeticGaloisRepresentations §2.4 (Weil–Deligne representations and Grothendieck's monodromy theorem).

**Checks.**

- For `π_v` generic at every `v ∤ l`, `r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v}` implies `r_{l,ι}(π)|G_{F_v} ⇝ r|G_{F_v}` (used in the proof of BLGGT14 Theorem 2.3.1, p. 38).
- The trivial representation of `GL_2(K)` is not generic. Its parameter is `ρ = ψ ⊕ ψε_l` with `ψ` unramified and `N = 0`, and `Hom(ψε_l, ψ ⊗ ε_l) ≠ 0` is a nonzero invariant of `(ad ρ)(1)`, so (1) cannot hold for it. The unramified point `ρ₁` of the previous Check is of this shape and lies on two components.
- For `n = 1` every character is smooth: `(ad χ)(1) = Q̄_l(1)` has no `G_{K′}`-invariants for any `K′`, since `ε_l` has infinite order.

### 1.4 Two-dimensional potentially Barsotti–Tate representations are potentially diagonalizable

Let `l > 2`, `K/ℚ_l` finite and `ρ : G_K → GL_2(Q̄_l)` potentially Barsotti–Tate, that is potentially crystalline with all labelled Hodge–Tate weights `{0, 1}`. Prove that `ρ` is potentially diagonalizable in the sense of ModularityAndLanglandsExtensions §2.1 (GK14, Lemma 4.4.1 and proof, pp. 19–20; conventions §2, pp. 5–6, with `HT(ε) = −1`; the running assumption that the prime is odd, §3.1, p. 8).

*Route.* After a finite extension `L/K`, make `ρ` crystalline with trivial residual representation and `ζ_l ∈ L`. The trivial residual representation has a split ordinary crystalline lift `1 ⊕ ε_l^{−1}` of the same Hodge type and, after a further extension, a split nonordinary crystalline lift by Lubin–Tate characters with the complementary labelled weights. The components of the rank-two Barsotti–Tate lifting ring over `L` are of two kinds: the nonordinary locus is connected, and each ordinary component contains a split ordinary lift (Kisin, Corollary 2.5.16 of "Moduli of finite flat group schemes and modularity"; Gee, Proposition 2.3 of "Automorphic lifts of prescribed types"). So `ρ|G_L` connects to one of the two split lifts, both sums of crystalline characters.

*Needs:* ModularityAndLanglandsExtensions §2.1 (potential diagonalizability); LocalGaloisDeformationRings §§4.10–4.14 (components of rank-two Barsotti–Tate rings), with the arbitrary-`K` component comparison recorded as a supplier gap in the contracts.

**Checks.**

- NT21B, end of the proof of Theorem 3.1 (p. 27), applies this at a prime `t > 5` to a weight-two form with potentially Barsotti–Tate local representation; NT26, proof of Proposition 6.1 (p. 48), at a prime `q > 2n + 2`.
- The split ordinary lift `1 ⊕ ε_l^{−1}` has labelled weights `{0, 1}` in the convention `HT(ε_l) = {−1}`; with the opposite sign convention the same lift would read `{0, −1}`, and comparing it with a lift of weights `{0, 1}` in that convention would compare different Hodge types.
- An ordinary and a nonordinary crystalline lift of the same Hodge type never lie on a common component (LocalGaloisDeformationRings §4.14: ordinary status is constant on components), which is why both split lifts are needed.

### 1.5 Symmetric powers of potentially diagonalizable representations

Let `K/ℚ_l` be finite and `ρ` a potentially diagonalizable representation of `G_K` in the sense of ModularityAndLanglandsExtensions §2.1. Prove that `Sym^m ρ` is potentially diagonalizable for every `m ≥ 0` (NT21B, end of the proof of Theorem 3.1, p. 27). Restriction to finite extensions, direct sums, tensor products, duals and twists are ModularityAndLanglandsExtensions §2.1; `Sym^m ρ` is only a direct summand of `ρ^{⊗m}`, and BLGGT14 §1.4 (remarks (4)–(5), p. 26) records no statement for direct summands or symmetric powers, so the symmetric power is stated here.

*Route.* Pass to `K′` over which `ρ` is diagonalizable: `ρ|G_{K′} ∼ ⊕χ_i` with crystalline characters `χ_i`. By LocalGaloisDeformationRings §6.8, `∼` is compatible with `Sym^m` (the symmetric power is a morphism of potentially crystalline generic fibres of fixed Hodge types and maps irreducible components into irreducible components); so `Sym^m ρ|G_{K′} ∼ Sym^m(⊕χ_i)`, the sum of the products `χ_{i_1}⋯χ_{i_m}` with `i_1 ≤ ⋯ ≤ i_m`, which are crystalline characters.

*Needs:* ModularityAndLanglandsExtensions §2.1 (potential diagonalizability); LocalGaloisDeformationRings §6.8; ArithmeticGaloisRepresentations §7.1 (symmetric and exterior powers).

**Checks.**

- `Sym^{n−1}` of a two-dimensional potentially Barsotti–Tate representation is potentially diagonalizable, by §1.4 and this target; NT21B uses this in the proof of Theorem 3.1.
- `Sym²` of `1 ⊕ ε_l^{−1}` is `1 ⊕ ε_l^{−1} ⊕ ε_l^{−2}`, a sum of crystalline characters with weights `{0, 1, 2}`: the operation acts on the diagonal witnesses as expected.
- `Sym⁰ ρ` is the trivial character and `Sym¹ ρ = ρ`; for a character `χ`, `Sym^m χ = χ^m`, potentially crystalline with Hodge–Tate weight `m` times that of `χ`.

### Examples

- Potentially Barsotti–Tate representations of rank two and their symmetric powers are potentially diagonalizable (§§1.4–1.5); the Tate curve, which is not potentially crystalline, is the non-example.
- Strong connection in both directions from purity, giving equal conductors (§1.2), as used in NT21B.

### Dependencies

ModularityAndLanglandsExtensions §2.1; LocalGaloisDeformationRings §§1.1, 1.12, 1.18, 1.22, 2.4, 3.4, 3.7, 3.10, 4.10–4.14, 6.8, §F.3.1; ArithmeticGaloisDuality §§R02.4.2, D7.4; ArithmeticGaloisRepresentations §§2.4, 7.1; AutomorphicGaloisRepresentationsPartII AG2.6 (generic monodromy orbits and local genericity).

## Layer 2: Schur residual representations and the determinant subring

Residually reducible deformation theory rests on two objects that use none of the automorphic theory: the Schur condition on a `𝒢_n`-valued residual representation, which makes polarized global deformation functors representable when the residual representation is reducible, and the closed subring of the universal deformation ring generated by characteristic polynomials. Both are needed already in Layer 3, where the ordinary Hecke algebra receives a map from this subring, so they come before the automorphic layers. Polarized global deformation problems, their representability for Schur residual data and their presentations are GlobalGaloisDeformations §§8.1–8.4; that roadmap assumes the Schur condition of Clozel–Harris–Taylor, which is defined here with its consequences.

Throughout, `Γ = Δ ⋊ {1, c}` with `c` of order two, `k` is a field, and `𝒢_n = (GL_n × GL_1) ⋊ {1, j}` with multiplier `ν` is the group of ArithmeticGaloisRepresentations §7.4.

### 2.1 Schur `𝒢_n`-valued residual representations

Define: a homomorphism `r̄ : Γ → 𝒢_n(k)` with `r̄⁻¹(𝒢_n⁰(k)) = Δ` is *Schur* if every irreducible `Δ`-subquotient of `kⁿ` is absolutely irreducible and, for all `Δ`-invariant subspaces `kⁿ ⊃ W₁ ⊃ W₂` with `kⁿ/W₁` and `W₂` irreducible, `(kⁿ/W₁)^c ≇ W₂^∨ ⊗ (ν ∘ r̄)` (Tho15, Definition 3.2, p. 13, after Clozel–Harris–Taylor's Definition 2.1.6). No hypothesis on the characteristic is made. Prove (Tho15, Lemma 3.3, p. 13):

1. if `r̄` is Schur then `r̄|Δ` is semisimple and multiplicity free, and each irreducible constituent `ρ` satisfies `ρ^c ≅ ρ^∨ ⊗ (ν ∘ r̄)`;
2. if `k` is algebraically closed and `r̄′` is another Schur homomorphism with `tr r̄′|Δ = tr r̄|Δ` and `ν ∘ r̄′ = ν ∘ r̄`, then `r̄` and `r̄′` are `GL_n(k)`-conjugate; Tho15 does not print the equality of multipliers, which cannot be dropped;
3. if `char k ≠ 2` then `H⁰(Γ, ad r̄) = 0`.

Conversely (Tho15, Lemma 3.4, p. 13), let `µ : Γ → k^×` be a character and `ρ = ⊕_{i=1}^s ρ_i : Δ → GL_n(k)` with each `ρ_i` absolutely irreducible, carrying a perfect pairing with `⟨x, y⟩_i = −µ(c)⟨y, x⟩_i` and `⟨ρ(δ)x, ρ(δ^c)y⟩_i = µ(δ)⟨x, y⟩_i`, and with `ρ_i ≇ ρ_j` and `ρ_j^c ≇ ρ_i^∨ ⊗ µ` for `i ≠ j`. Prove that `ρ` extends to `r̄ : Γ → 𝒢_n(k)` with `r̄⁻¹(𝒢_n⁰(k)) = Δ` and `ν ∘ r̄ = µ`; writing `r̄(c) = (A, −µ(c))j`, the matrix `A = ⊕A_i` is block diagonal, the `GL_n(k)`-conjugacy classes of such extensions form a principal homogeneous space under `∏_{i=1}^s k^×/(k^×)²` with `(α_i)` acting by `A_i ↦ α_iA_i`, and every such extension is Schur.

*Route.* By the dictionary of ArithmeticGaloisRepresentations §7.4 (Tho15, Lemma 3.1, pp. 12–13), an extension with multiplier `µ` is a perfect pairing on `kⁿ` satisfying the two displayed identities. (1) and (2) follow from Clozel–Harris–Taylor's Lemma 2.1.7 and its proof: a non-split extension or a repeated constituent produces a pair `W₁ ⊃ W₂` violating the condition through the pairing. For (3), by (1) `H⁰(Δ, ad r̄)` is the space `∏_i k` of block scalars, and `r̄(c)` acts on it by `X ↦ −A·ᵗX·A⁻¹ = −X` because `A` is block diagonal; the invariants vanish exactly when `2` is invertible. For the converse, `Hom_Δ(ρ_i^c, ρ_j^∨ ⊗ µ)` vanishes for `i ≠ j` and is a line for `i = j`, so the pairing is an orthogonal sum of nonzero multiples of the `⟨·,·⟩_i`; the centralizer `∏_i k^×` of `ρ` rescales the `i`-th pairing by squares.

*Needs:* ArithmeticGaloisRepresentations §7.4 (`𝒢_n`, the triple correspondence, polarized representations), §1.12 (restriction to normal subgroups and Clifford theory); LocalGaloisDeformationRings §F.1.5 (strict and full conjugacy for Schur residual representations).

**API.**

- A Schur `r̄` has `r̄|Δ` semisimple and multiplicity free, with each constituent conjugate self-dual with multiplier `ν ∘ r̄`.
- Over an algebraically closed `k`, two Schur homomorphisms with the same trace on `Δ` and the same multiplier are `GL_n(k)`-conjugate; over a general field they become conjugate after extending scalars to `k̄`.
- If `char k ≠ 2` and `r̄` is Schur then `H⁰(Γ, ad r̄) = 0`.
- Extensions of a polarized sum `⊕ρ_i` as above with multiplier `µ`, up to conjugacy, form a torsor under `∏_i k^×/(k^×)²`, and every one of them is Schur.
- If `r̄|Δ` is absolutely irreducible then `r̄` is Schur; an absolutely irreducible `ρ̄` with a perfect pairing of sign `−µ(c)` satisfying `⟨ρ̄(δ)x, ρ̄(δ^c)y⟩ = µ(δ)⟨x, y⟩` extends to such an `r̄` with multiplier `µ` (the converse with `s = 1`).

**Checks.**

- For `n = 2`, `char k ≠ 2`, `µ(c) = −1` and characters `χ₁ ≠ χ₂` of `Δ` with `χ_iχ_i^c = µ|Δ`: `χ₁ ⊕ χ₂` extends to `r̄` with multiplier `µ`, every extension is Schur, and the extensions up to conjugacy form a torsor under `(k^×/(k^×)²)²`, four classes when `k` is finite. The condition `χ₂^c ≇ χ₁^{−1}µ` follows from `χ₁ ≠ χ₂`, and `µ(c) = −1` is forced because a nonzero pairing on a line is symmetric, so the sign `−µ(c)` must be `+1`.
- `r̄` with `r̄|Δ ≅ χ ⊕ χ` is not Schur: for a `Δ`-stable line `W₁ = W₂`, `(k²/W₁)^c ≅ χ^c ≅ χ^{−1}(ν ∘ r̄) ≅ W₂^∨ ⊗ (ν ∘ r̄)`; it is not multiplicity free and `H⁰(Γ, ad r̄) ≠ 0`. `End_Δ ≠ k` is not the criterion: a Schur `r̄` with `d ≥ 2` constituents has `End_Δ(r̄|Δ) = k^d`; GlobalGaloisDeformations §8.1's `𝔽₅` example with `ρ(δ) = diag(2, 3)` exhibits a nontrivial strict polarized centralizer for a non-Schur residual pair.
- If `char k ≠ 2` and `r̄` is Schur with `d` constituents, `H⁰(Δ, ad r̄) ≅ k^d`, `r̄(c)` acts by `−1`, and `H⁰(Γ, ad r̄) = 0`; in characteristic `2` the same computation gives `H⁰(Γ, ad r̄) ≅ k^d ≠ 0`, so the hypothesis of (3) cannot be dropped.
- NT21, Theorem 5.2, hypothesis (2) (p. 67): for `r̄` with `r̄|G_F = ⊕χ̄_i`, `χ̄_iχ̄_i^c = µ̄` and `µ(c_v) = −1`, ratios `χ̄_i/χ̄_j|G_{F(ζ_p)}` of order greater than `2n` for `i < j` make `r̄` Schur. Tho15, Theorem 7.1(6) and the discussion after it (pp. 66–67): `ρ̄₁ ≇ ρ̄₂` and `ε^{1−n}ρ̄₁^∨ ≇ ρ̄₂^c` make every `𝒢_n`-valued extension of `ρ̄₁ ⊕ ρ̄₂` Schur.

### 2.2 The subring `P_𝒮` generated by characteristic polynomials

Let `𝒮 = (F/F⁺, S, S̃, Λ, r̄, χ, {𝒟_v})` be a polarized global deformation problem in the sense of GlobalGaloisDeformations §8.1, with `l` odd, the places of `S` split in `F`, `Λ` the ordinary coefficient algebra of Tho15 §3.2 (p. 13; the completed tensor product over the places above `l` of the abelian-inertia algebras of LocalGaloisDeformationRings §1.3), and `r̄` Schur (§2.1). Let `D̄ = det ∘ r̄|G_{F,S}` and let `Q_𝒮` be the continuous pseudodeformation ring of `D̄` for the profinite group `G_{F,S}` (LocalGaloisDeformationRings §F.2.11); it is topologically generated over `O` by the coefficients `Λ_i^univ(Frob_w)`, `w ∈ L`, `0 ≤ i ≤ n`, for any set `L` of places disjoint from `S` of Dirichlet density one (Tho15, Definition 3.25 and Proposition 3.26, p. 23). Construct `P_𝒮` as the image of `Q_𝒮 ⊗̂_O Λ → R^univ_𝒮` classifying the determinant of the universal deformation; equivalently the closed `Λ`-subalgebra of `R^univ_𝒮` topologically generated by the coefficients of characteristic polynomials of elements of `G_{F,S}` (Tho15, Definition 3.27, p. 23; NT26 §3, pp. 23–24). Prove:

1. For `q ≥ 0` there is `C = C(q, r̄, S)` such that for every set `S′ ⊃ S` of finite places of `F⁺` split in `F` with `|S′ − S| ≤ q` and every deformation problem `𝒮′` unramified outside `S′` over the same `Λ`, `P_{𝒮′}` is a quotient of `O⟦X_1, …, X_C⟧` (Tho15, Lemma 3.28 and proof, p. 23). The constant depends on the fixed ordinary coefficient data; it is not uniform in an arbitrary coefficient algebra.
2. If `r̄|G_{F,S}` is absolutely irreducible then `P_𝒮 = R^univ_𝒮`; if `r̄` is Schur then `R^univ_𝒮` is a finite `P_𝒮`-algebra (Tho15, Proposition 3.29(1)–(2) and proof, pp. 24–25).
3. Suppose `r̄ = ⊕_{i=1}^d r̄_i` with `ρ̄_i = r̄_i|G_{F,S}` absolutely irreducible (hence pairwise non-isomorphic), embed `µ₂^d` in `GL_n(O)` as block-diagonal signs, and suppose every `𝒟_v` is stable under conjugation by `µ₂^d` (true for the ordinary, Steinberg, `χ_v`-ramified and unrestricted problems). Then `µ₂^d` acts on `R^univ_𝒮` by conjugating the universal deformation, the diagonal `µ₂` acting trivially, and `P_𝒮 = (R^univ_𝒮)^{µ₂^d}`. For every prime `𝔭 ⊂ R^univ_𝒮` such that `r_𝔭|G_{F,S} ⊗ Frac(R^univ_𝒮/𝔭)` is absolutely irreducible, with `𝔮 = 𝔭 ∩ P_𝒮`, the map `P_𝒮 → R^univ_𝒮` is étale at the primes above `𝔮` and `µ₂^d` permutes them transitively (ANT20, Proposition 3.2, p. 8, proof pp. 9–10; for `d = 2` and dimension-one primes, Tho15, Proposition 3.29(3)). For the ordinary, locally Steinberg problem of the Allen–Newton–Thorne lifting theorem this is an ingredient of ModularityAndLanglandsExtensions §4.2; the form here is for every problem with `µ₂^d`-stable local conditions, which §§7.16 and 7.18–7.19 use for the `χ_v`-ramified problems as well.

*Route.* For (1), it suffices to bound `dim_k` of the tangent space of the pseudodeformation functor: such deformations factor through the Galois group of the maximal pro-`l` extension unramified outside `S′` of the field cut out by `r̄` (Che14, Lemma 3.8), whose number of topological generators class field theory bounds in terms of `|S′ − S|`; the fixed `Λ` adds a fixed number of generators. For (2): `P → R^univ` is surjective on tangent spaces when `r̄|G_{F,S}` is absolutely irreducible, since two liftings to `k[ε]` with equal characteristic polynomials are conjugate and their polarization matrices differ by a scalar in `1 + εk`, which has a square root as `l` is odd. If `R^univ/(m_P)` were not Artinian, a dimension-one prime with normalization `k′⟦T⟧` gives `r` with constant determinant `D̄`; `r ⊗ E` and `r̄ ⊗ E` are semisimple and conjugate, comparing isotypic lattices makes the conjugating matrix integral and `≡ 1 mod T`, and adjusting the polarization by a square root gives `r ≅ r̄ ⊗ k′⟦T⟧`, contradicting universality; Cayley–Hamilton alone does not give integrality. For (3): over `R = R^univ/(m_P)` lift the block idempotents to idempotents fixed by the anti-involution `M ↦ B·ᵗM·B^{−1}` (ANT20, Lemma 3.3, pp. 8–9), so the diagonal blocks are liftings of the `ρ̄_i` with constant determinant and the polarization matrix is residual; `R` is generated by off-diagonal entries with `A_{ij} = A_{ji}` and `A_{ij}² = 0`, every `µ₂^d`-invariant monomial vanishes, and averaging over `µ₂^d` (with `2` invertible) and Nakayama give `P = (R^univ)^{µ₂^d}`. Étaleness: an element of `µ₂^d` fixing `𝔭` and acting trivially on `R^univ/𝔭` gives a block-sign matrix commuting, up to `1 + M_n(m)`, with an absolutely irreducible representation, hence a scalar.

*Needs:* §2.1; GlobalGaloisDeformations §§8.1–8.2 (polarized problems and representability for Schur `r̄`); LocalGaloisDeformationRings §§1.3, F.1.9–F.1.10, F.2.2, F.2.7, F.2.11 (character coefficient rings, determinant deformations, `Φ_p`, Carayol's trace theorem, continuous pseudodeformation rings); IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1 (determinants, continuity, Cayley–Hamilton algebras); Chebotarev Layer 10; ClassFieldTheory Layer 12.

**API.**

- `P_𝒮` is a closed `Λ`-subalgebra of `R^univ_𝒮`, topologically generated by characteristic-polynomial coefficients of Frobenius elements at any density-one set of places outside `S`.
- If `r̄|G_{F,S}` is absolutely irreducible then `P_𝒮 = R^univ_𝒮`.
- If `r̄` is Schur then `R^univ_𝒮` is a finite `P_𝒮`-module.
- Under the block-sign hypotheses of (3), `P_𝒮 = (R^univ_𝒮)^{µ₂^d}` and the action factors through `µ₂^d/µ₂`.
- Under the same hypotheses, for any prime `𝔭` (no condition on dimension or characteristic) with absolutely irreducible generic representation, `P_𝒮 → R^univ_𝒮` is étale at every prime above `𝔭 ∩ P_𝒮`, and `µ₂^d` acts transitively on them.
- Enlarging `S` by at most `q` split places keeps `P` a quotient of a power series ring in `C(q, r̄, S)` variables.

**Checks.**

- For `d = 1`, `P_𝒮 = R^univ_𝒮`.
- For `n = 2`, `l` odd and `r̄|G_F = χ̄₁ ⊕ χ̄₂` Schur, `µ₂²` acts on `R^univ_𝒮` through `µ₂²/µ₂ ≅ µ₂`, the nontrivial element being conjugation by `diag(1, −1)`, which negates the two off-diagonal entries of a block-normalized universal lifting; `P_𝒮` is the subring of invariants, generated over `Λ` by traces and determinants. The product of the two off-diagonal entries is invariant and lies in `P_𝒮`; each entry alone is not.
- `P_𝒮 → R^univ_𝒮` is surjective if and only if `R^univ_𝒮/(m_{P_𝒮}) = k`. A nonconstant polarized lifting of type `𝒮` to `k[ε]` (with `Λ` acting through `k`) whose determinant is the constant `D̄ ⊗ k[ε]` kills `m_{P_𝒮}` without factoring through `k`, so then `P_𝒮 ≠ R^univ_𝒮`. A nonzero class in `Ext¹(ρ̄₂, ρ̄₁)` alone is insufficient: the lifting must be polarized and satisfy the local conditions.
- Tho15, Proposition 4.12 (p. 40): for a residually Schur maximal ideal, `Q_𝒮 ⊗̂_O Λ → T^T_χ(U(l^∞), O)_m` is surjective and factors through `P_{𝒮_χ}` (§3.10 here).
- The constant `C` of (1) is not uniform in the coefficient algebra: replacing `Λ` by `Λ⟦Y_1, …, Y_m⟧` with `Y_i` acting trivially on the universal representation adds `m` generators to `P` for every `m`.

### Examples

- For two characters `χ̄₁ ≠ χ̄₂` with `µ(c) = −1`, the four conjugacy classes of Schur extensions over a finite field (§2.1), and the invariant subring for `diag(1, −1)` (§2.2).
- For an absolutely irreducible residual representation both constructions are trivial: Schur holds and `P_𝒮 = R^univ_𝒮`.

### Dependencies

GlobalGaloisDeformations §§8.1–8.2; LocalGaloisDeformationRings §§1.3, F.1.5, F.1.9–F.1.10, F.2.2, F.2.7, F.2.11; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1; ArithmeticGaloisRepresentations §§1.12, 7.4; Chebotarev Layer 10 and ClassFieldTheory Layer 12. No layer of this roadmap is used.

## Layer 3: Definite unitary groups, algebraic modular forms and their Hecke algebras

This layer builds the automorphic side of every R = T theorem below: a unitary group over a totally real field that is compact at infinity and quasi-split at all finite places, its algebraic modular forms with integral coefficients, the spherical, Iwahori and ordinary Hecke algebras, the Galois representations they carry and the big ordinary Hecke algebra over the Iwasawa algebra Λ. Following Thorne 2012 and Geraghty, the CM field is written `L` in this layer, with maximal totally real subfield `L⁺`; the layers that apply it write `F`. Because the group is compact at infinity, its arithmetic cohomology is concentrated in degree zero and the forms are functions on a finite set; this is why classical patching suffices throughout Layers 4–10. The group with `S(B) = ∅`, its forms with class-set evaluation, level maps and traces, and its split-place Hecke operators with the tame Hecke algebra are CompletedCohomologyAndLocalGlobalCompatibility §0.7; this layer adds the division-algebra variant, the twisted coefficients at the places of `R` with the comparison to automorphic forms, the integral structure of the Hecke algebras, and everything from 3.4 on.

### 3.1 The definite unitary group attached to a CM field

Let `L` be an imaginary CM field with `L/L⁺` unramified at every finite place, and `n ≥ 1`. The unitary group `G` of `L/L⁺` of rank `n` that is compact at infinity and quasi-split at every finite place, with its integral model over `O_{L⁺}` and the split identifications `ι_w : G(L⁺_v) ≅ GL_n(L_w)` carrying `G(O_{L⁺_v})` onto `GL_n(O_{L_w})` for `v = w w^c`, is CompletedCohomologyAndLocalGlobalCompatibility §0.7 for the CM extension `L/L⁺`. Concretely, `G(R) = {g ∈ B ⊗_{L⁺} R : g g* = 1}` for `B = M_n(L)` with the involution `g ↦ ᵗḡ` of the standard hermitian form `Σ x_i x̄_i`; a `*`-stable order `O_B ⊂ B`, maximal at every place split over `L⁺`, gives the integral model, and for `v = w w^c` split `ι_v : O_{B,v} ≅ M_n(O_{L_w}) × M_n(O_{L_{w^c}})` turns `*` into transpose composed with the swap, with first projection `ι_w`. At a finite place inert in `L` the group is unramified and has hyperspecial maximal compact subgroups (Tho12 §6, pp. 30–31; Ger19 §2.1, pp. 4–5; NT21 §1, pp. 8–9; NT23 §4.1, pp. 26–27; CT14 §2.4, p. 7). This target proves two things that section does not: that under the hypothesis on `L/L⁺` the standard form has these localisations with no further parity condition, and the division-algebra variant below.

The hypothesis that `L/L⁺` is unramified at every finite place forces `[L⁺ : ℚ]` to be even: the quadratic character of `L/L⁺` is then unramified at all finite places and nontrivial at every real place, and it is trivial on the global element `−1`. For `n` even the class of `(−1)^{n/2}·det` of a hermitian form in `L⁺_v^×/N(L_w^×)` is trivial at a non-split finite place exactly when the unitary group is quasi-split there, and equals `(−1)^{n/2}` at a real place where the form is definite, so by the product formula a global form with these localisations exists exactly when `(n/2)[L⁺ : ℚ]` is even; for `n` odd the discriminant can be changed by a scalar. Hence the existence of `G` needs no further parity condition. Thorne 2012 §6 assumes `4 | n[L⁺ : ℚ]`: for `n` even this is automatic here, since `[L⁺ : ℚ]` is even; for `n` odd it holds only when `4 | [L⁺ : ℚ]`, but it is not needed for the existence of `G` (ANT20 §4.1, p. 13, makes the same observation). None of the sources writes out this argument: Thorne 2012 refers to Clozel–Harris–Taylor §3.3 with `S(B) = ∅`, Geraghty to Harris–Taylor Lemma I.7.1.

*Division-algebra variant* (Tho15 §4.1, pp. 34–35; ANT20 §4.1, p. 13). Let `S(B)` be a finite set of finite places of `L⁺`, split in `L` and prime to `l`, of even cardinality when `n` is even. There is a central simple `L`-algebra `B` of dimension `n²` with an involution `†` restricting to `c` on `L`, with `B^{op} ≅ B ⊗_{L,c} L`, split outside `S(B)` and a division algebra at every place above `S(B)`, whose unitary group is compact at infinity and quasi-split at every finite `v ∉ S(B)`. A `†`-stable order maximal at the split places gives the integral model; `ι_w` identifies `G(L⁺_v)` with `GL_n(L_w)` (and `G(O_{L⁺_v})` with `GL_n(O_{L_w})`) for split `v ∉ S(B)`, and with `B_w^×` (and `O_{B_w}^×`) for `v ∈ S(B)`. The case `S(B) = ∅` is the group above; Thorne 2015 requires `S(B) ≠ ∅`, Allen–Newton–Thorne allow both. When `S(B)` and the Hecke exceptional set `T` are used to index local factors, one place of `L` is chosen above each of their places; these choices index each local factor once.

*Route.* The existence of the involution is the discriminant argument above; the order and the isomorphisms `ι_v` are chosen locally and glued, since `B_w ≅ M_n(L_w)` at split places. `G` is anisotropic over `L⁺` with compact real points, so it satisfies the hypotheses of the algebraic-modular-form theory of AutomorphicFormsOnReductiveGroups §7.4; its adelic points, integral compact open subgroups and local projections are those of AdelicAlgebraicGroups §§1.1, 1.5, and the finiteness of `G(L⁺)\G(𝔸^∞_{L⁺})/U` is AdelicAlgebraicGroups §3.4 (finiteness of class numbers).

*Needs:* CompletedCohomologyAndLocalGlobalCompatibility §0.7 (the group for `S(B) = ∅`, its integral model and split identifications); AutomorphicFormsOnReductiveGroups §7.4; AdelicAlgebraicGroups §§1.1, 1.5; AdelicAlgebraicGroups §3.4 (finiteness of class numbers); AdelicAlgebraicGroups §3.4 (compact quotients of anisotropic groups); Mathlib `NumberField.IsCMField`.

**API.**

- Under the standing hypothesis on `L/L⁺`, the standard hermitian form gives a unitary group that is compact at infinity and quasi-split at every finite place for every `n ≥ 1`, with no condition on `n[L⁺ : ℚ]` modulo `4`.
- For split `v = w w^c` outside `S(B)`, `ι_w` is an isomorphism `G(O_{L⁺_v}) ≅ GL_n(O_{L_w})` extending to `G(L⁺_v) ≅ GL_n(L_w)`, and the two identifications at `v` are related by `ι_{w^c}(g) = ᵗ(ι_w(g))^{−c}` (transpose-inverse composed with complex conjugation), the conjugate-pair convention of CompletedCohomologyAndLocalGlobalCompatibility §0.7; at `v ∈ S(B)` the target of `ι_w` is `B_w^×` with integral subgroup `O_{B_w}^×`.
- `G(L⁺ ⊗_ℚ ℝ) ≅ ∏_{v | ∞} U_n(ℝ)` is compact.
- `G` is quasi-split at every finite `v ∉ S(B)`; at the inert places, which lie outside `S(B)`, it has hyperspecial maximal compact subgroups.
- For every open compact `U ⊂ G(𝔸^∞_{L⁺})` the double coset space `G(L⁺)\G(𝔸^∞_{L⁺})/U` is finite.

**Checks.**

- For `n = 1`, `G = U_1 = ker(N_{L/L⁺} : Res_{L/L⁺} 𝔾_m → 𝔾_m)`, `G(L⁺) = {x ∈ L^× : x x^c = 1}` and `ι_w` identifies `G(L⁺_v)` with `L_w^×` at a split place; a definition that used `Res_{L/L⁺} 𝔾_m` itself would have non-compact real points.
- At every infinite place `G(L⁺_v)` is the compact group `U_n(ℝ)`; a quasi-split unitary group at infinity (`U(n/2, n/2)`) fails this and has no finite double coset spaces of the required kind.
- At a split place `ι_w(G(O_{L⁺_v})) = GL_n(O_{L_w})` and `ι_{w^c} = ᵗ(ι_w)^{−c}`; identifying `ι_{w^c}` with `ι_w` would make the Hecke operators at `w` and `w^c` equal, while the duality of 3.3 says they differ by inverse transpose.
- Negative control for the unramified hypothesis: for `L⁺ = ℚ`, `L` imaginary quadratic and `n = 2` (so `(n/2)[L⁺ : ℚ]` is odd) there is no involution of the second kind on `M_2(L)` whose unitary group is quasi-split at every finite place and compact at infinity, by the product formula above. Here `L/ℚ` is ramified, so this case is excluded by the standing hypothesis; for `n` odd there is never an obstruction.
- For `n = 1` and `[L⁺ : ℚ] = 2`, `n[L⁺ : ℚ] = 2` is not divisible by `4`, yet `U_1 = ker(N_{L/L⁺})` is compact at infinity and quasi-split at every finite place: Thorne's condition `4 | n[L⁺ : ℚ]` is sufficient for existence, not necessary.

### 3.2 Algebraic modular forms on a definite unitary group

Keep `G` of 3.1. Let `l` be odd with every place of `L⁺` above `l` split in `L`, `S_l` the places above `l` with chosen `ṽ | v`, `K ⊂ Q̄_l` a finite extension with ring of integers `O` containing the images of all embeddings of `L`, and `Ĩ_l` the embeddings `L → K` inducing places of `S̃_l`. For `λ ∈ (ℤⁿ₊)^{Ĩ_l}` let `M_λ = ⊗_{τ ∈ Ĩ_l} M_{λ_τ}`, with `M_{λ_τ}` the `O`-lattice in the algebraic representation of `GL_n` of highest weight `λ_τ` of ArithmeticLocallySymmetricSpaces §ALS.F.7 and PotentialAutomorphyInfrastructure §0.4 (integral dual Weyl lattices), on which `G(O_{L⁺,l})` acts through `τ ∘ ι_{ṽ(τ)}`. Let `R` be a finite set of split places disjoint from `S_l`, with characters `χ_v = χ_{v,1} × ⋯ × χ_{v,n} : Iw(ṽ)/Iw₁(ṽ) ≅ (k(ṽ)^×)ⁿ → O^×` for `v ∈ R`, and `M_{λ,{χ_v}} = M_λ ⊗ ⊗_{v ∈ R} O(χ_v)`. For `U = ∏ U_v` open compact with `U_v ⊂ ι_ṽ^{−1} Iw(ṽ)` for `v ∈ R` and `U_v ⊂ G(O_{L⁺_v})` for `v | l`, and an `O`-module `A`, define `S_{λ,{χ_v}}(U, A)` as the module of functions `f : G(L⁺)\G(𝔸^∞_{L⁺}) → M_{λ,{χ_v}} ⊗_O A` with `f(gu) = u_{S_l ∪ R}^{−1} f(g)` for `u ∈ U` (Tho12 §6, Definition 6.1, pp. 31–32; Ger19 §2.2, Definitions 2.2.1–2.2.4, pp. 6–8). For `S(B) = ∅` this is the module `S(U, M_{λ,{χ_v}} ⊗_O A)` of CompletedCohomologyAndLocalGlobalCompatibility §0.7, with `U` acting on the coefficients through its components at `S_l ∪ R` by `a|u = u_{S_l ∪ R}^{−1}a`, and in general the specialisation of the forms of AutomorphicFormsOnReductiveGroups §7.4 to `G`, the coefficient module `M_{λ,{χ_v}}` and the level `U`; functoriality in `A`, restriction and trace, and the evaluation decomposition over class representatives are imported from there. NT21 §1.23 (pp. 22–23) adds a smooth `O[U_Σ]`-module of extra coefficients, which 3.10 uses. The space `S_{λ,{χ_v}}(Q̄_l) = colim_U S_{λ,{χ_v}}(U, Q̄_l)` carries an action of `G(𝔸^{∞,R}_{L⁺}) × ∏_{v ∈ R} Iw(ṽ)`. Prove that for `ι : Q̄_l ≅ ℂ` there is an `ι`-linear isomorphism, equivariant for this action, between `S_{λ,{χ_v}}(Q̄_l)` and `Hom_{G(L⁺_∞)}((⊗_{v ∈ R} ℂ(ιχ_v^{−1})) ⊗ ξ_{ιλ}^∨, 𝒜(G))`, where `ξ_{ιλ}` is the representation of `∏_{v|∞} U_n(ℝ)` of highest weight `ιλ` (Tho12 §6, Proposition 6.2, p. 33, which takes the proof from the first part of Clozel–Harris–Taylor Proposition 3.3.2).

*Route.* Specialise CompletedCohomologyAndLocalGlobalCompatibility §0.7 (for `S(B) = ∅`) and the general theory of AutomorphicFormsOnReductiveGroups §7.4; functoriality in `A`, restriction and trace for `V ⊂ U`, and the description `S(U, A) ≅ ⊕_j (M ⊗ A)^{t_j^{−1} G(L⁺) t_j ∩ U}` over representatives `t_j` of the finite double coset space come with it (Tho12 §6, proof of Lemma 6.3, p. 33); the automorphic comparison is the structure theorem of AutomorphicFormsOnReductiveGroups §7.5 with the characters `χ_v` at `R`.

*Needs:* 3.1; CompletedCohomologyAndLocalGlobalCompatibility §0.7 (forms, class-set evaluation, level maps); AutomorphicFormsOnReductiveGroups §7.4; AutomorphicFormsOnReductiveGroups §7.5; ArithmeticLocallySymmetricSpaces §ALS.F.7 and PotentialAutomorphyInfrastructure §0.4 (integral dual Weyl lattices).

**API.**

- `M_{λ,{χ_v}} ⊗_O A` is a `U`-stable coefficient module of the kind used in CompletedCohomologyAndLocalGlobalCompatibility §0.7: `U` acts through its components at `S_l ∪ R`, on `M_λ` through `τ ∘ ι_{ṽ(τ)}` and on `O(χ_v)` through `Iw(ṽ)/Iw₁(ṽ)`. Hence the evaluation `S(U, A) ≅ ⊕_j (M_{λ,{χ_v}} ⊗ A)^{Γ_j}` at representatives `t_j` of the class set, with finite `Γ_j = t_j^{−1} G(L⁺) t_j ∩ U`, and the restriction and trace with `tr_{U/V} ∘ res = [U : V]`, hold with the twisted action at `R`.
- For `S(B) ≠ ∅` the same evaluation, restriction and trace hold for the group of 3.1, by AutomorphicFormsOnReductiveGroups §§7.4–7.5.
- The `ι`-linear comparison with automorphic forms of Tho12 Proposition 6.2 is equivariant for `G(𝔸^{∞,R}_{L⁺}) × ∏_{v∈R} Iw(ṽ)`.

**Checks.**

- For `n = 1`, `λ = 0` and `R = ∅`, `S_0(U, O)` is the module of `O`-valued functions on the finite set `G(L⁺)\G(𝔸^∞_{L⁺})/U`; for `λ = 0` and `U` sufficiently small it is free of rank equal to the number of double cosets. A definition with left `U`-invariance instead of right invariance would not be a module over the Hecke operators of 3.3.
- `S_{λ,{χ_v}}(U, 0) = 0`, and `S(U, −)` is additive in `A`; a definition by `M ⊗ A`-valued functions without the equivariance condition would give a module of rank `#(G(L⁺)\G(𝔸^∞)) = ∞`.
- For `S(B) = ∅`, `S_{λ,{χ_v}}(U, A)` agrees with CompletedCohomologyAndLocalGlobalCompatibility §0.7's `S(U, M_{λ,{χ_v}} ⊗_O A)` for the right action `a|u = u_{S_l ∪ R}^{−1}a`. The condition `f(gu) = u f(g)` instead is not a right action: computing `f(guu′)` in two ways gives `uu′f(g) = u′uf(g)`, so every value is fixed by the commutators of `U`; for `n = 2`, `λ_τ = (1, 0)` and `A = O` these contain an open subgroup of `SL_2(O_{L_ṽ})`, which fixes no nonzero vector of `O²`, so that condition admits only `f = 0`.
- Negative control for exactness: with `Γ_j` and `M = M_{λ,{χ_v}}` as above, `S(U, O) ⊗ k → S(U, k)` is injective with cokernel `⊕_j H¹(Γ_j, M)[ϖ]`, which vanishes when `l ∤ #Γ_j` and can be nonzero otherwise. In the abstract model `Γ = ℤ/l` acting on the augmentation ideal `I` of `O[ℤ/l]`, one has `I^Γ = 0` but `(I ⊗ k)^Γ ≠ 0`. An element of order `l` acting nontrivially on `M ⊗ k` is neither necessary nor sufficient for failure of exactness.

### 3.3 Hecke algebras of definite unitary groups

Keep 3.2, and let `T ⊃ S_l ∪ R` be a finite set of places of `L⁺` split in `L` with `U_v = G(O_{L⁺_v})` at split `v ∉ T`. For a place `w` of `L` split over `L⁺` and not above `T`, a uniformizer `ϖ_w` and `1 ≤ j ≤ n`, let `T_w^j = ι_w^{−1}[GL_n(O_{L_w}) diag(ϖ_w 1_j, 1_{n−j}) GL_n(O_{L_w})]` act on `S_{λ,{χ_v}}(U, A)`; it does not depend on `ϖ_w`. Let `𝕋^T_{λ,{χ_v}}(U, A)` be the `O`-subalgebra of `End_O(S_{λ,{χ_v}}(U, A))` generated by the `T_w^j` and `(T_w^n)^{−1}` (Tho12 §6, pp. 32–33; Ger19 §2.3, Definition 2.3.4, pp. 10–11). For `S(B) = ∅` these are the split-place operators `T_w^{(j)}` and the tame Hecke algebra `𝕋^S(U, A)` of CompletedCohomologyAndLocalGlobalCompatibility §0.7, with `S` the archimedean places and the places of `T`; that section proves commutativity, the relation at `w^c` and finiteness over `O` for finite free coefficients. For `S(B) ≠ ∅` the same double cosets act, every place of `S(B)` lying in `T`. Prove that `𝕋^T_{λ,{χ_v}}(U, O)` is free as an `O`-module and reduced, that it is commutative and finite over `O` also when `S(B) ≠ ∅`, and that `𝕋^T_{λ,{χ_v}}(U, A)` is finite over `O` when `A` is finitely generated over `O` or `A = K/O`. The residual Galois representations of its maximal ideals are constructed in 3.7.

*Route.* The operators are the `[U g U]` actions of AutomorphicFormsOnReductiveGroups §7.4 transported by `ι_w`, and commute because the spherical Hecke algebra of `GL_n(L_w)` is commutative; in the coset-sum formula take representatives supported at the Hecke place, so that the coefficient action at `S_l ∪ R` is trivial. Finiteness follows from the double coset description of 3.2 (for `A = K/O` use the Pontryagin dual), and reducedness from semisimplicity of `S_λ(U, Q̄_l)` as a Hecke module (3.2, Proposition 6.2).

*Needs:* 3.2; CompletedCohomologyAndLocalGlobalCompatibility §0.7 (split-place operators and the tame Hecke algebra); AutomorphicFormsOnReductiveGroups §7.4 (double coset operators).

**API.**

- `𝕋^T_λ(U, O)` is a finite free `O`-algebra, hence semilocal and the product of its localisations at its maximal ideals.
- For `V ⊂ U` with the same `T`, restriction `S(U, O) → S(V, O)` is Hecke-equivariant and induces a surjection `𝕋^T(V, O) → 𝕋^T(U, O)`.

**Checks.**

- For `n = 1` the Hecke algebra is generated by the translations `T_w^1 = [ι_w^{−1}(ϖ_w)]` on functions on the finite group `G(L⁺)\G(𝔸^∞)/U`, and its maximal ideals correspond to Galois orbits of mod-`l` characters of that group.
- If `S_{λ,{χ_v}}(U, O) = 0` then `𝕋^T_{λ,{χ_v}}(U, O) = 0`.
- The operators at `w` and `w^c` are related by `T_{w^c}^j = (T_w^n)^{−1}T_w^{n−j}`: an element with `ι_{w^c}`-image `diag(ϖ_{w^c}1_j, 1_{n−j})` has `ι_w`-image `ϖ_w^{−1}diag(1_j, ϖ_w1_{n−j})` (3.1, `ι_{w^c} = ᵗ(ι_w)^{−c}`), whose double coset is that of the central `ϖ_w^{−1}` times `diag(ϖ_w1_{n−j}, 1_j)`. For `n = 1` this reads `T_{w^c}^1 = (T_w^1)^{−1}`; identifying `T_{w^c}^j` with `T_w^j` would contradict it.

### 3.4 Exactness and group-ring freeness at level without `l`-torsion

Keep 3.2. Prove: (1) if `t^{−1} G(L⁺) t ∩ U` contains no element of order `l` for every `t ∈ G(𝔸^∞_{L⁺})`, the functor `A ↦ S_{λ,{χ_v}}(U, A)` on `O`-modules is exact (Tho12 §6, Lemma 6.3, p. 33); (2) if moreover `V ⊂ U` is a normal open subgroup with `U/V` abelian of `l`-power order, acting through the diamond operators `[V u V]`, then `tr_{U/V} : S_{λ,{χ_v}}(V, A)_{U/V} → S_{λ,{χ_v}}(U, A)` is an isomorphism and `S_{λ,{χ_v}}(V, O)` is a free `O[U/V]`-module (Tho12 §6, Lemma 6.4, pp. 33–35). Geraghty's Lemma 2.2.6 (Ger19 p. 9) is the variant for sufficiently small `U` and arbitrary normal `V`; NT23 §4.3, Lemma 4.3 (p. 29) is the instance at Taylor–Wiles level.

*Route.* (1) By the double coset description, `S(U, A)` is a sum of invariants of `M ⊗ A` under finite groups of order prime to `l`. (2) Reduce to `U/V` cyclic with generator `σ` and to `A = O`. Let `S^∨(W, A)` be the forms with values in the dual lattice `M_{λ,{χ_v}}^∨ ⊗ A`, stable in the representation of weight `λ^∨_{τ,i} = −λ_{τ,n+1−i}` with characters `χ_v^{−1}`. The pairing `(f, g)_V = Σ_t ⟨f(t), g(t)⟩ / #(t^{−1} G(L⁺) t ∩ V)` between `S(V, O)` and `S^∨(V, O)` is perfect, satisfies `([V u V] f, g)_V = (f, [V u^{−1} V] g)_V`, and makes `tr_{U/V}` adjoint to the inclusion `S^∨(U, O) ⊂ S^∨(V, O)`; exactness of `0 → (σ − 1)S(V, O) → S(V, O) → S(U, O) → 0` is Pontryagin dual to `S^∨(U, K/O) = S^∨(V, K/O)^{U/V}`. For freeness, let `r = dim_k S(U, k)`; Nakayama gives a surjection `O[U/V]^r → S(V, O)`, which is an isomorphism because `dim_K S(V, K) = #(U/V)·dim_K S(U, K)`: a group of order prime to `l` maps trivially to the `l`-group `U/V`, so `t^{−1} G(L⁺) t ∩ U = t^{−1} G(L⁺) t ∩ V`.

*Needs:* 3.2; AutomorphicFormsOnReductiveGroups §7.5.

**Checks.**

- At Taylor–Wiles level (§4.2), `S(U₁(Q), O)` is free over `O[Δ_Q]` and the trace induces `S(U₁(Q), O)_{Δ_Q} ≅ S(U₀(Q), O)` when no `t^{−1} G(L⁺) t ∩ U₀(Q)` has an element of order `l`.
- Without the hypothesis exactness fails in general: `S(U, O) ⊗ k → S(U, k)` has cokernel `⊕_j H¹(Γ_j, M_{λ,{χ_v}})[ϖ]` (3.2, last Check).
- For `U/V` of order prime to `l` the trace is still surjective after inverting `#(U/V)`, but `S(V, O)` need not be free over `O[U/V]`; for `U/V ≅ ℤ/2`, `l` odd and `S(V, O) = O` with trivial action, the module is the trivial character, not `O[ℤ/2]`.

### 3.5 Base change and descent between definite unitary groups and `GL_n`

Let `L/L⁺` be unramified at all finite places and `G` the group of 3.1. Prove:

(1) *Descent* (Labesse, Théorème 5.4, in the form of Ger19 §2.2, Proposition 2.2.7, p. 9, and CT14 §2.4, Proposition 2.9(2), p. 8). If `π` is a RACSDC automorphic representation of `GL_n(𝔸_L)` of weight `ι_*λ`, there is an automorphic `Π` of `G(𝔸_{L⁺})` with `Π_∞ ≅ ξ_{ιλ}^∨`, `Π_v ≅ π_w ∘ ι_w` at every split `v = w w^c`, and `Π_v` with a nonzero vector fixed by a hyperspecial maximal compact subgroup at every inert `v` at which `π_v` is unramified.

(2) *Base change* (Labesse, Corollaire 5.3, in the form of CT14 Proposition 2.9(1)). Every automorphic `Π` of `G(𝔸_{L⁺})` has a base change `π₁ ⊞ ⋯ ⊞ π_s`, the `π_i` discrete conjugate self-dual automorphic representations of `GL_{n_i}(𝔸_L)` with `Σ n_i = n`, whose component at `w` is `Π_v ∘ ι_w^{−1}` for split `v = w w^c` and the unramified base change of `Π_v` at inert `v` with `Π_v` unramified.

(3) *Division-algebra variant* (Tho15 §4.1, Proposition 4.4, p. 37; `G` the group of 3.1 with `S(B) ≠ ∅`). Let `π` be RACSDC of weight 0 on `GL_n(𝔸_L)`, unramified at every place inert over `L⁺` and an unramified twist of the Steinberg representation at every place above `S(B)`. Then (a) there is an automorphic `σ` of `G(𝔸_{L⁺})` with `σ_∞` trivial, `σ_v` with a hyperspecial-fixed vector at every inert `v`, and `σ_v ≅ π_w ∘ ι_w` at every split `v = w w^c ∉ S(B)`; (b) for every open compact `U = ∏ U_v` with `U_v` hyperspecial at all inert `v` there is such a `σ′` with a nonzero `U_v`-fixed vector at every inert `v`. (In Tho15 Proposition 4.4, items 1(c) and 2(c) should read `σ_v ≅ π_w ∘ ι_w` and `σ′_v ≅ π_w ∘ ι_w`.)

*Route.* (1)–(2) are Labesse's stable comparison between `G` and `Res_{L/L⁺} GL_n`, supplied by EndoscopicTransferAndUnitaryTraceComparison §6.29 (with §4.7a at the places of `S(B)`), read through the dictionary of 3.2. Each discrete `π_i` in (2) is a Speh representation built from a cuspidal one; Tho15 §4.2, Lemma 4.6 (pp. 37–38) records the same description for the division-algebra group. (3)(a) is contained in Clozel–Harris–Taylor Proposition 3.3.2; (3)(b) uses that the distribution `f^∞ ↦ tr R(f^∞ ⊗ 1)` is stable (Labesse 1999, proof of Theorem A.3.1), which allows the hyperspecial subgroups at inert places to be changed. Labesse's Corollaire 5.3 is quoted by Geraghty as weak base change and used by Thorne 2012 §10 as strong base change; what is used is the local matching at every split finite place and every unramified finite place, which EndoscopicTransferAndUnitaryTraceComparison §6.29 states, together with the descent of its Théorème 5.4 for `L/L⁺` unramified at all finite places.

*Needs:* 3.1; 3.2; EndoscopicTransferAndUnitaryTraceComparison §6.29 (with §4.7a at the places of `S(B)`); AutomorphicGaloisRepresentationsPartII AG2.0 (polarized automorphic representations).

**Checks.**

- For `n = 1` the base change of a character `Π` of `U_1(𝔸_{L⁺})` is `x ↦ Π(x/x^c)`; conversely a RACSDC character of `𝔸_L^×` is trivial on norms and on the real points of `𝔸_{L⁺}^×`, hence on `𝔸_{L⁺}^×`, and descends through `x ↦ x/x^c` by Hilbert 90, which is (1).
- Conjugate self-duality is needed in (1): the algebraic character `|·|_{𝔸_L}` satisfies `|·|^c = |·| ≠ |·|^{−1}`, while every base change `x ↦ Π(x/x^c)` of a character of `U_1(𝔸_{L⁺})` has `φ^c = φ^{−1}`; so `|·|_{𝔸_L}` is not a base change from `G`.
- The Steinberg hypothesis in (3) is needed: at `v ∈ S(B)` the group is `B_w^×`, whose irreducible representations correspond only to essentially square-integrable representations of `GL_n(L_w)`; an unramified principal series `π_w` has no partner, so no `σ` with `σ_v` matching `π_w` exists there.

### 3.6 Galois representations attached to constituents of algebraic modular forms

Let `π` be an irreducible `G(𝔸^{∞,R}_{L⁺}) × ∏_{v∈R} Iw(ṽ)`-constituent of `S_{λ,{χ_v}}(Q̄_l)`. Prove that there is a continuous semisimple `r_l(π) : G_L → GL_n(Q̄_l)` such that: (i) for every finite place `v ∉ S_l ∪ R` of `L⁺` split as `w w^c`, `(r_l(π)|G_{L_w})^{ss} ≅ (r_l(π_v ∘ ι_w^{−1})^∨(1 − n))^{ss}`, where `r_l` of a local representation is the Clozel–Harris–Taylor normalisation used by Thorne (for `π_v` unramified with `T_w^j`-eigenvalues `t_j` on its spherical line, the right side has Frobenius polynomial `Σ_j (−1)^j (Nw)^{j(j−1)/2} t_j X^{n−j}`); (ii) `r_l(π)^c ≅ r_l(π)^∨(1 − n)`; (iii) `r_l(π)` is unramified above every inert `v` at which `π_v` has a vector fixed by a hyperspecial maximal compact subgroup; (iv) for `v ∈ R` with `π^{Iw(ṽ)} ≠ 0` and `σ ∈ I_{L_ṽ}`, `det(X − r_l(π)(σ)) = ∏_{j=1}^{n} (X − χ_{v,j}^{−1}(Art_{L_ṽ}^{−1}(σ)))`; (v) for `v ∈ S_l` split as `w w^c`, `r_l(π)|G_{L_w}` is de Rham, crystalline if `π_v` is unramified, with `HT_τ = {λ_{τ,j} + n − j : 1 ≤ j ≤ n}` for each `τ ∈ Ĩ_l`. If `r_l(π)` is irreducible, then the base change of 3.5(2) is a single RACSDC `π₁` with `r_{l,ι}(π₁) ≅ r_l(π)`, and `π_v ∘ ι_w^{−1}` is generic for every place `v ∉ R` split as `w w^c` (Tho12 §6, Theorem 6.5, p. 35; Ger19 §2.7, Proposition 2.7.2, p. 24). Thorne's printed item (i) omits `∨(1 − n)` and the exclusion of `R`; Geraghty's Proposition 2.7.2 has both, and the corrected form is the one stated (and the one used in §4.2). Over a finite coefficient field the representation is used together with a chosen stable lattice realising it over `O_E`; its existence after a finite enlargement of `E`, independence of the lattice after residual semisimplification and compatibility with enlargement are the realisation contract of AutomorphicGaloisRepresentationsPartII AG2.7 (finite realization and residual representation of `π`).

*Route.* By 3.2, `π` is the finite part of an automorphic `Π` of `G(𝔸_{L⁺})` with `Π_∞ ≅ ξ_{ιλ}^∨`, twisted by the `χ_v` at `R`. Labesse's base change (3.5 (2)) gives an isobaric sum `π₁ ⊞ ⋯ ⊞ π_s` of discrete conjugate self-dual automorphic representations of general linear groups over `L`, compatible with `Π` at split places and at unramified inert places; `r_l(π)` is the Galois representation attached to this sum (Thorne uses Guerberoff Theorem 2.3, Geraghty Chenevier–Harris Theorem 3.2.5), which is AutomorphicGaloisRepresentationsPartII AG2.3 (arbitrary regular conjugate-self-dual existence), AG2.2 (discrete sums) and AG2.5–AG2.6 (compatibility), and local–global compatibility away from `l` and the de Rham and crystalline properties at `l` are AutomorphicGaloisRepresentationsPartII AG2.6 (polarized admissibility at the coefficient prime) and AutomorphicGaloisRepresentationsPartII AG2.6 (full polarized local–global compatibility at `l`). If `r_l(π)` is irreducible then `s = 1`, since each `π_i` contributes a summand and a non-cuspidal Speh representation contributes a reducible one, and `π₁` is cuspidal, hence generic everywhere (Shalika).

*Needs:* 3.2; 3.5; AutomorphicGaloisRepresentationsPartII AG2.3 (arbitrary regular conjugate-self-dual existence), AG2.2 (discrete sums) and AG2.5–AG2.6 (compatibility); AutomorphicGaloisRepresentationsPartII AG2.6 (polarized admissibility at the coefficient prime); AutomorphicGaloisRepresentationsPartII AG2.6 (full polarized local–global compatibility at `l`); AutomorphicGaloisRepresentationsPartII AG2.7 (finite realization and residual representation of `π`); EndoscopicTransferAndUnitaryTraceComparison §6.29 (with §4.7a at the places of `S(B)`).

**Checks.**

- For `n = 1`, `r_l(π)` is the character attached to the algebraic Hecke character `x ↦ π(x/x^c)` of `𝔸_L^×`, and (ii) is `r^c = r^{−1}`.
- The local hypothesis of Tho12 Proposition 5.9, `(r_l(π_ṽ)^∨(1 − n))^{ss} ≅ (ρ ⊗ Q̄_l)^{ss}` for `ρ = r_𝔪|G_{L_ṽ}`, is item (i) in its corrected form; with the uncorrected item the Taylor–Wiles eigenvalue at `ṽ` would be matched with the inverse eigenvalue, which is wrong as soon as the Frobenius eigenvalue is not `±(Nw)^{(n−1)/2}`.
- For `π` of weight `λ = 0` unramified at `v ∈ S_l`, (v) gives `HT_τ = {0, 1, …, n − 1}`; the opposite Hodge–Tate convention would give `{0, −1, …, 1 − n}`.

### 3.7 Residual and `𝒢_n`-valued Galois representations of Hecke maximal ideals

Keep 3.3. Prove that for every maximal ideal `𝔪 ⊂ 𝕋^T_λ(U, O)` there is a unique continuous semisimple `r̄_𝔪 : G_L → GL_n(𝕋/𝔪)` with `r̄_𝔪^c ≅ r̄_𝔪^∨(1 − n)` which, for every place `v ∉ T` split as `w w^c`, is unramified at `w` with `det(X − r̄_𝔪(Frob_w)) = Σ_{j=0}^{n} (−1)^j (Nw)^{j(j−1)/2} T_w^j X^{n−j} mod 𝔪` (`T_w^0 = 1`, `Frob_w` geometric), and which is unramified above an inert place `v` at which `U_v` is hyperspecial (Tho12 §6, Proposition 6.6, p. 36; Ger19 §2.7, Proposition 2.7.3, pp. 24–25). Thorne's Proposition 6.6 says "unramified outside `T`" without the hyperspecial condition at inert places; Geraghty's Proposition 2.7.3 and Thorne's own Proposition 6.7(ii) state it with that condition, which is the form used here. Call `𝔪` *non-Eisenstein* if `r̄_𝔪` is absolutely irreducible. Let now `𝔪` be non-Eisenstein, with `U_v = G(O_{L⁺_v})` at split `v ∉ T` and hyperspecial at the inert places considered, and `l` odd. Prove that `r̄_𝔪` extends to a continuous `r̄_𝔪 : G_{L⁺} → 𝒢_n(𝕋/𝔪)` with `r̄_𝔪^{−1}(GL_n × GL_1) = G_L` and `ν ∘ r̄_𝔪 = ε^{1−n} δ_{L/L⁺}^{μ_𝔪}` for some `μ_𝔪 ∈ ℤ/2`, and that `r̄_𝔪` lifts, uniquely up to `1 + M_n(𝔪)`-conjugation, to `r_𝔪 : G_{L⁺} → 𝒢_n(𝕋^T_λ(U, O)_𝔪)` with (i) `r_𝔪` unramified at split `w ∉ T` with `det(X − r_𝔪(Frob_w)) = Σ_j (−1)^j (Nw)^{j(j−1)/2} T_w^j X^{n−j}`, (ii) `r_𝔪` unramified at inert `v` with `U_v` hyperspecial, (iii) `ν ∘ r_𝔪 = ε^{1−n} δ_{L/L⁺}^{μ_𝔪}` (Tho12 §6, Propositions 6.6–6.7, p. 36; Ger19 §2.7, Proposition 2.7.4, pp. 25–26). The parity is `μ_𝔪 ≡ n mod 2`: Thorne proves it from the patching argument (Tho12 Corollary 6.9, p. 40), and independently it follows from Bellaïche–Chenevier's sign theorem (Tho17 §3.1, Theorem 3.2, p. 16).

*Route.* For `r̄_𝔪`, realise `𝕋 ⊗ Q̄_l` on the constituents of `S_λ(Q̄_l)` (3.6), reduce their Galois representations and descend the residual determinant to `𝕋/𝔪` by IntegralHeckeAndGaloisDeterminants §0.2 with Brauer–Nesbitt and Chebotarev; this is the argument of Clozel–Harris–Taylor Proposition 3.4.2, to which Thorne refers. The correspondence between residual representations and Hecke maximal ideals of Galois type is IntegralHeckeAndGaloisDeterminants §3b.1. `𝕋_𝔪 = 𝕋^T_λ(U, O)_𝔪` is reduced and `l`-torsion free, and `𝕋_𝔪 ⊗ Q̄_l` is a product of copies of `Q̄_l` indexed by the Hecke eigensystems in `S_λ(U, Q̄_l)_𝔪`. The representations of the corresponding constituents (3.6) give a `𝕋_𝔪 ⊗ Q̄_l`-valued determinant whose characteristic polynomials at split Frobenius elements are the Hecke polynomials, so by Chebotarev it is `𝕋_𝔪`-valued (IntegralHeckeAndGaloisDeterminants §0.2, IntegralHeckeAndGaloisDeterminants §§1.1–1.3). Absolute irreducibility of `r̄_𝔪` and Carayol's theorem (LocalGaloisDeformationRings §F.2.7) give a `GL_n(𝕋_𝔪)`-valued representation of `G_L`; the extension to `𝒢_n` uses conjugate self-duality and the lemma of Clozel–Harris–Taylor on extending to `𝒢_n` (ArithmeticGaloisRepresentations §7.4), which is where `l > 2` is used.

*Needs:* 3.3; 3.6; LocalGaloisDeformationRings §F.2.7; ArithmeticGaloisRepresentations §7.4; IntegralHeckeAndGaloisDeterminants §0.2 (determinants and scalar extension), §§1.1–1.3 (Cayley–Hamilton algebras), §3b.1 (Hecke maximal ideals of Galois type); AutomorphicGaloisRepresentationsPartII AG2.7 (independence of the residual Hecke ideal).

**API.**

- For a maximal ideal `𝔪`, `r̄_𝔪` is determined up to isomorphism by its Frobenius characteristic polynomials at the split places outside `T` and satisfies `r̄_𝔪^c ≅ r̄_𝔪^∨(1 − n)`.
- For non-Eisenstein `𝔪` and `l` odd, `r_𝔪` is unique up to `1 + M_n(𝔪)`-conjugation, and composing it with `f : 𝕋_𝔪 → O` gives an integral model of the Galois representation of the constituent of `f` (3.6).

**Checks.**

- `r_𝔪` is of type `𝒮` for the deformation problem of §4.5 (Tho12 §6, Theorem 6.8, first assertion, p. 37).
- If `𝔪` is the maximal ideal of an eigenform in `S_λ(U, O)` with `T_w^j`-eigenvalues `t_{w,j} ∈ O` (`t_{w,0} = 1`), then `det(X − r̄_𝔪(Frob_w)) = Σ_j (−1)^j (Nw)^{j(j−1)/2} t̄_{w,j} X^{n−j}`; dropping the factor `(Nw)^{j(j−1)/2}` gives the wrong polynomial already for `n = 2`, where the constant term must be `Nw · t̄_{w,2}`.
- For `n = 2` and `λ = 0`, the maximal ideal of the constant functions has `r̄_𝔪 ≅ 1 ⊕ ε̄^{−1}` up to twist, which is reducible, so it is not non-Eisenstein.
- Composing `r_𝔪` with a homomorphism `f : 𝕋_𝔪 → O` gives an integral model of `r_l(π)` for the corresponding constituent `π`; for `n = 1` this is the character of 3.6 with multiplier `ε^0 δ^{μ}`, `μ ≡ 1`.
- The uniqueness is up to `1 + M_n(𝔪)`, not up to `GL_n(𝕋_𝔪)`. In `𝒢_n`, `(aI, 1)(A, b)j(aI, 1)^{−1} = (a²A, b)j`: conjugating by a scalar `a ∈ 𝕋_𝔪^×` rescales the polarization matrix of `r_𝔪(c)` by `a²` and leaves the multiplier `ν` unchanged (for `a = 2`, `A = I`, `b = 1` the result is `(4I, 1)j`, not `(I, 4)j`). If `ā² ≠ 1` the conjugate lifts the different residual representative `(ā²Ā, b)j` of `r̄_𝔪(c)`, so it is not a lift of the fixed `r̄_𝔪`; if `a ≡ 1 mod 𝔪` it is a strict equivalence, the ambiguity the deformation problem of §4.5 allows.

### 3.8 Iwahori levels at `l`, the `U`-operators and ordinary parts

Keep 3.2, with `U_v = G(O_{L⁺_v})` for `v ∈ S_l`. For `0 ≤ b ≤ c` and `v ∈ S_l`, let `Iw(ṽ^{b,c}) ⊂ GL_n(O_{L_ṽ})` be the matrices upper triangular modulo `ṽ^c` and unipotent upper triangular modulo `ṽ^b`, and `U(l^{b,c}) = U^l × ∏_{v∈S_l} ι_ṽ^{−1} Iw(ṽ^{b,c})`. Let `c ≥ 1`. For a uniformizer `ϖ_ṽ` put `α^j_{ϖ_ṽ} = diag(ϖ_ṽ 1_j, 1_{n−j})` and `(w₀λ)(α^j_{ϖ_ṽ}) = ∏_{τ ∈ Ĩ_l, τ ↦ ṽ} τ(ϖ_ṽ)^{λ_{τ,n} + ⋯ + λ_{τ,n+1−j}}`. Define the operator `U^j_{λ,ϖ_ṽ}` on `S_{λ,{χ_v}}(U(l^{b,c}), A)`, for every `O`-module `A`, by `f ↦ (w₀λ)(α^j_{ϖ_ṽ})^{−1} Σ_i (x_i α^j_{ϖ_ṽ})·f`, where `U(l^{b,c}) α^j U(l^{b,c}) = ⊔_i x_i α^j U(l^{b,c})` and `(g·f)(h) = g_{S_l ∪ R} f(hg)`; when `A` is a `K`-vector space it is `(w₀λ)(α^j)^{−1}[U(l^{b,c}) ι_ṽ^{−1}(α^j_{ϖ_ṽ}) U(l^{b,c})]`, and for general `A` only the rescaled operator is defined. Define the diamond operators `⟨u⟩ = [U(l^{b,c}) ι^{−1}(u) U(l^{b,c})]` for `u ∈ T(O_{L⁺,l})`, `T` the diagonal torus; they factor through `T(O_{L⁺}/l^b)`. Let `A` be `O`, `K/O`, `O/ϖ^γ` or `ϖ^{−γ}O/O`, and `𝕋̃^T_{λ,{χ_v}}(U(l^{b,c}), A)` the `O`-subalgebra of `End_O(S(U(l^{b,c}), A))` generated by all `T_w^j`, `(T_w^n)^{−1}`, `⟨u⟩` and `U^j_{λ,ϖ_ṽ}`; it is a finite `O`-algebra. Define the *ordinary idempotent* `e ∈ 𝕋̃^T` as the idempotent cutting out the localisations at the maximal ideals containing no `U^j_{λ,ϖ_ṽ}`; equivalently `e = lim_r U(l)^{r!}` with `U(l) = ∏_{v∈S_l} ∏_{j=1}^{n} U^j_{λ,ϖ_ṽ}`. Prove that the operators `T_w^j`, `U^j_{λ,ϖ_ṽ}`, `⟨u⟩` commute with each other and with the inclusions `S(U(l^{b,c}), A) ⊂ S(U(l^{b′,c′}), A)` for `b ≤ b′`, `c ≤ c′`; that `S^{ord} = eS` is the largest `O`-submodule on which every `U^j_{λ,ϖ_ṽ}` is bijective, with `U(l)` topologically nilpotent on `(1 − e)S`; that `eS` does not depend on the uniformizers; and that on `S(U(l^∞), K/O) = colim_c S(U(l^{c,c}), K/O)` there is a unique idempotent restricting to `e` at each level, with `eS(U(l^∞), K/O) = colim_c eS(U(l^{c,c}), K/O)` (Tho12 §8, pp. 44–45; Ger19 §2.3, Definition 2.3.1 and Lemma 2.3.3, pp. 10–11, and §2.4, Definitions 2.4.1–2.4.2, pp. 12–14; NT21 §1.23, pp. 22–23; Tho15 §4.1, pp. 35–36, in weight 0 on the division-algebra group; CT14 §2.4, p. 8).

*Route.* `M_λ` is the sum of its weight spaces, all weights `μ` satisfy `w₀λ ≤ μ ≤ λ` and the lowest weight space has rank one (Ger19 Lemma 2.2.2), so `(w₀λ)(α^j)^{−1} ξ_λ(α^j)` acts on the `μ`-weight space by a non-negative power of the uniformizers, preserves `M_λ` and is the identity on the lowest weight line. Commutativity and compatibility with change of level hold because the unipotent matrices with upper right block running through representatives modulo `ϖ_ṽ` are coset representatives for the double coset of `α^j` at every level `(b, c)` (Ger19 Lemma 2.3.3, after Hida). On finite coefficient modules `e` is the ordinary projector of PadicFamilies §§0a.2, 0a.14 for `U(l)`, and the bijectivity statement is PadicFamilies §0a.4. Replacing `ϖ_ṽ` by `ϖ_ṽ u` multiplies `U^j_{λ,ϖ_ṽ}` by a unit of `O` and the diamond operator of `diag(u 1_j, 1_{n−j})`, both invertible and central, so `eS` is unchanged.

*Needs:* 3.2; PadicFamilies §§0a.2, 0a.14; PadicFamilies §0a.4.

**API.**

- `e² = e`, and `e` commutes with all Hecke and diamond operators.
- `eS` does not depend on the uniformizers `ϖ_ṽ`.
- For `b ≤ b′` and `c ≤ c′` the inclusion `S(U(l^{b,c})) ⊂ S(U(l^{b′,c′}))` commutes with `e`.
- The diamond operators give an action of `Λ⁺ = O⟦T(O_{L⁺,l})⟧` on `eS(U(l^∞), K/O)`.

**Checks.**

- For `n = 1`, `U^1_{λ,ϖ}` is translation by `ι_ṽ^{−1}(ϖ_ṽ)`, hence invertible, and `e = 1`.
- If `S_{λ,{χ_v}}(U(l^{b,c}), A) = 0` then `eS = 0`.
- On each finite `S(U(l^{b,c}), O/λ^m)`, `e` agrees with the ordinary projector of PadicFamilies §§0a.2, 0a.14 for `U(l)`.
- A `U(l)`-eigenform with eigenvalue in `λO` (for instance a form of weight `λ` whose Hecke parameters at `ṽ` have positive slope) lies in `(1 − e)S`, not in `eS`; the weight factor is essential. For `n = 2` and `λ = (1, 1)` at one embedding of `ℚ_l`, `U^1_{λ,ϖ} = ϖ^{−1}[Uα¹U]`, so a normalized eigenvalue `1` becomes the positive-slope eigenvalue `ϖ` if the factor is omitted. For `λ = (−1, −1)` it instead becomes `ϖ^{−1}`, of negative slope; nonzero weight alone does not determine the sign.
- For `n = 2` and `λ = 0`, `S^{ord}` is the part on which the operators `U^1_{0,ϖ_ṽ}` have unit eigenvalues, `U^2` being invertible already; `U(l) = (w₀λ)(α)^{−1}[U(l^{b,c}) α U(l^{b,c})]` for `α` with component `diag(ϖ_ṽ^n, ϖ_ṽ^{n−1}, …, ϖ_ṽ)` at `v` (Ger19, proofs of Lemmas 2.4.3 and 2.5.2).

### 3.9 The big ordinary Hecke algebra over `Λ`

Keep 3.8, with `U_v = G(O_{L⁺_v})` for `v ∈ S_l` and for split `v ∉ T`, and `U_v = ι_ṽ^{−1} Iw(ṽ)` for `v ∈ R`. For `c ≥ 1`, let `𝕋^T_{λ,{χ_v}}(U(l^{b,c}), A)` be the `O`-subalgebra of `End_O(S(U(l^{b,c}), A))` generated by the `T_w^j`, `(T_w^n)^{−1}` and the `⟨u⟩`, and `𝕋^{T,ord}_{λ,{χ_v}}(U(l^{b,c}), A)` its image in `End_O(eS)` (Tho12 §8, Definition 8.1, p. 45). Define `𝕋^{T,ord}_{λ,{χ_v}}(U(l^∞), O) = lim_c 𝕋^{T,ord}_{λ,{χ_v}}(U(l^{c,c}), O)`, the inverse limit along the surjections induced by the inclusions of forms; prove it is naturally isomorphic to `lim_c 𝕋^{T,ord}_{λ,{χ_v}}(U(l^{c,c}), K/O)`, which acts faithfully on `eS(U(l^∞), K/O)` and on its Pontryagin dual (Ger19 §2.4, Definition 2.4.5, Remark 2.4.6, Lemma 2.4.7, pp. 14–15; Tho12 §8, p. 46). Let `T(l^b) = ker(T(O_{L⁺,l}) → T(O_{L⁺}/l^b))`, `T(l) = T(l¹)`, `Λ = O⟦T(l)⟧`, `Λ_b = O⟦T(l^b)⟧` and `Λ⁺ = O⟦T(O_{L⁺,l})⟧ ≅ Λ[T(O_{L⁺}/l)]`. For `λ = 0`, the homomorphism `T(l) → 𝕋^{T,ord}_{0,{χ_v}}(U(l^∞), O)^×`, `u ↦ (∏_{τ ∈ Ĩ_l} ∏_{i=1}^{n} τ(u_i)^{1−i}) ⟨u⟩ = (w₀ν)(u)^{−1} ⟨u⟩` with `ν_τ = (n − 1, …, 1, 0)`, defines a second `Λ`-algebra structure; `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O)` denotes the weight-0 algebra with this structure, the *universal ordinary Hecke algebra* of level `U` (Tho12 §8, Definition 8.3, p. 46; Ger19 §2.6, Definition 2.6.2, pp. 20–21, which keeps the untwisted action of `T(O_{L⁺}/l)`). Its finiteness over `Λ` is 3.11, and the comparison with other weights is 3.12. The variants used later are the algebra `𝕋^T_χ(U(l^∞), O)` of Tho15 §4.1, Definition 4.2 (p. 36) and ANT20 §4.1 (weight 0, defined directly on ordinary forms, division-algebra group allowed; NT26 §3, p. 23, calls two instances `𝕋_{F₂}`, `𝕋_{F₃}`), and the algebra `𝕋^{ord}(D)` of a deformation datum `D` (3.10).

*Route.* The `Λ⁺`-action is continuous because `⟨u⟩` acts trivially at level `U(l^{c,c})` for `u ∈ T(l^c)`. For `c` large `U(l^{c,c})` is sufficiently small, so `S(U(l^{c,c}), K/O) = S(U(l^{c,c}), O) ⊗ K/O`, and the `O`-dual of `S(U(l^{c,c}), O)` is the Pontryagin dual of `S(U(l^{c,c}), K/O)`, compatibly with Hecke operators; this identifies the two limit algebras. The twist by `∏ τ(u_i)^{1−i}` makes the universal characters of the local ordinary lifting rings (LocalGaloisDeformationRings §1.3) match the diamond action: at the arithmetic prime of weight `λ` the `j`-th diagonal character of the Galois representation is, on inertia, `x ↦ ∏_τ τ(x)^{1−j−λ_{τ,n+1−j}}` composed with the inverse Artin map (Ger19 Corollary 2.7.8 and Definition 2.6.3).

*Needs:* 3.3; 3.8; LocalGaloisDeformationRings §1.3.

**API.**

- The `Λ`-algebra structure on `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O)` is given by the twisted diamond operators `u ↦ (∏ τ(u_i)^{1−i}) ⟨u⟩`.
- `𝕋^{T,ord}(U(l^∞), O)` acts faithfully on `eS(U(l^∞), K/O)`.
- For each `c` there is a surjection `𝕋^{T,ord}(U(l^∞), O) → 𝕋^{T,ord}(U(l^{c,c}), O)`.

**Checks.**

- For `n = 1` and `λ = 0`, `𝕋^{T,ord}_0(U(l^∞), O) = O⟦C_∞⟧` with `C_∞ = lim_c G(L⁺)\G(𝔸^∞_{L⁺})/U(l^{c,c})`; it is finite over `Λ = O⟦T(l)⟧`, and free over `Λ` of rank `#G(L⁺)\G(𝔸^∞_{L⁺})/U(l^{1,1})` exactly when `G(L⁺) ∩ U(l^{1,1}) = 1`, equivalently when `G(L⁺) ∩ U` has no element of order `l`.
- The tame quotient uses the radical ideal `𝔩`: for `l = 5` and `L⁺_v = ℚ₅(√5)`, reduction modulo `ϖ_v = √5` gives `𝔽₅^×` of order `4`, whereas reduction modulo the rational ideal `(5) = (ϖ_v²)` gives `20` units, including a pro-`5` factor. The latter cannot be the tame factor in the displayed Teichmüller splitting.
- If `eS(U(l^{1,1}), k) = 0` then `𝕋^{T,ord}(U(l^∞), O) = 0`.
- For `n = 2` and one embedding `τ`, `ν_τ = (1, 0)`, `w₀ν = (0, 1)` and the twisted structure sends `u = diag(u₁, u₂) ∈ T(l)` to `τ(u₂)^{−1}⟨u⟩`, in agreement with `∏_i τ(u_i)^{1−i}`; the untwisted `u ↦ ⟨u⟩` is a different `Λ`-algebra structure, differing from it by the character `(w₀ν)^{−1}`, and does not match the universal inertial characters of the local ordinary rings described in the route.

### 3.10 Ordinary deformation data and their Hecke comparison

In the setting of NT21 §6 (pp. 77–82), fix residual polarized Schur data with multiplier `δ^n ε^{1−n}`, continuous, unramified away from a finite set `X` and `p`, with ordinary local residual representation trivial at `p`, and a fixed auxiliary place with a sufficiently small level. Construct the category of *ordinary deformation data*: a datum `D` consists of an admissible soluble CM extension `L/F` split at the prescribed places, and a finite set `X` away from `p` with a choice of local ring at each `v ∈ X`: the supercuspidal-type ring `R(ṽ, Θ_ṽ, r̄_ṽ)` at a place split over `F`, the unipotent ring `R_v¹`, or the Steinberg ring `R_v^{St}` (the last two require `r̄_ṽ` trivial and `q_v ≡ 1 mod p`). Define the level `U(D, c)` (`Iw(c, c)` at `p`, the type compact subgroup at a supercuspidal place, Iwahori level at unipotent and Steinberg places, `K_v(1)` at the auxiliary place, hyperspecial elsewhere) and the coefficient module `M_D`, the tensor product of integral lattices in the contragredient supercuspidal types and `O` at the other places. Define `S(U(D, c), M_D)`, its ordinary part, the finite-level Hecke algebras generated by the `T_w^j` and the diamond operators, `𝕋^{ord}(D) = lim_c 𝕋^{ord}(D, c)` with the twisted `Λ_L`-structure of 3.9, and `H^{ord}(D) = lim_c Hom_O(S^{ord}(U(D, c), M_D), O)`. Let `𝔪_D` be the ideal generated by `𝔪_Λ` and the `T_w^j − q_w^{−j(j−1)/2} tr ∧^j r̄(Frob_w)` (`Frob_w` geometric), which with the Hecke polynomial of 3.7 selects `r̄`; NT21 prints the exponent `+j(j−1)/2`, which selects the eigensystem with `T_w^j` multiplied by `q_w^{j(j−1)}`. It is maximal or the unit ideal, since `𝕋^{ord}(D)/𝔪_D` is generated over `k` by the images of the diamond operators, which lie in the image of `Λ_L`; `𝕋_D`, the completed localization at `𝔪_D`, is a local `Λ_L`-algebra or zero. Let `R_D` represent the ordinary polarized global problem `𝒮_D` of GlobalGaloisDeformations §8.1 with these local conditions, `P_D ⊂ R_D` the subring of §2.2. Prove that when no local choice is Steinberg there is a natural surjection of `Λ_L`-algebras `P_D → 𝕋_D`, and that its kernel `J_D` is proper exactly when `𝕋_D ≠ 0` (NT21 §6, definition after Lemma 6.3, p. 78; Proposition 6.5 and Lemma 6.6, pp. 79–80; proof of Lemma 6.7, pp. 81–82).

*Route.* Use 3.1 and the local identifications. The auxiliary local subgroup has no nontrivial element of finite order and lies outside the ramification and `p`-adic set; the projection of `U(D, c)` into it lies in that subgroup, so `U(D, 1)` is sufficiently small. Build `M_D` from the type lattices of SmoothRepresentationsOfLocalGroups §SR.5.2 (types), with their residual local rings matched with `r̄_ṽ` by LocalGaloisDeformationRings §§2.5, 2.24, 2.26; reuse 3.2 and 3.8 with this coefficient module (for `X = ∅`, `M_D = O`). For the comparison (NT21 Lemma 6.6), at each `c` choose a finite `E_c/E` realising the finitely many automorphic constituents, construct their compatible polarized lattice-valued representations (3.6, AutomorphicGaloisRepresentationsPartII AG2.7 (finite realization and residual representation of `π`)) and compare their determinants with `P_D`; the values descend to `𝕋^{ord}(D, c)_{𝔪_D}` and pass to the limit. No single finite field realising every level is asserted, and Steinberg choices are excluded from this map. For an admissible change of datum `D₁ → D₀`, the arithmetic restriction maps `R_{D₁} → R_{D₀}`, `P_{D₁} → P_{D₀}` and the Hecke transfer `𝕋_{D₁} → 𝕋_{D₀}` intertwine the comparisons (NT21 proof of Lemma 6.7); their existence uses the type comparisons of SmoothRepresentationsOfLocalGroups §SR.5.2 (types) and the restriction maps of GlobalGaloisDeformations §§4.1, 8.1.

*Needs:* §2.2; 3.1; 3.2; 3.6; 3.7; 3.8; 3.9; LocalGaloisDeformationRings §§2.5, 2.24, 2.26; SmoothRepresentationsOfLocalGroups §SR.5.2 (types); GlobalGaloisDeformations §§4.1, 8.1; AutomorphicGaloisRepresentationsPartII AG2.3 (arbitrary regular conjugate-self-dual existence), AG2.2 (discrete sums) and AG2.5–AG2.6 (compatibility); AutomorphicGaloisRepresentationsPartII AG2.7 (finite realization and residual representation of `π`).

**API.**

- For `c ≥ 1` the projection of `U(D, c)` at the auxiliary place lies in the torsion-free auxiliary subgroup, and `U(D, 1)` is sufficiently small.
- `M_D` is a finite free `O`-module with an action of the compact level; at a supercuspidal place it is a lattice in the dual type.
- `S(U(D, c), M_D)` consists of functions `G(𝔸^∞_{L⁺}) → M_D`, left invariant under `G(L⁺)`, with `f(gu) = u^{−1} f(g)`; its ordinary part is the image of the commuting ordinary idempotents.
- `𝕋^{ord}(D)` is the inverse limit of the finite-level ordinary Hecke images, a `Λ_L`-algebra; `H^{ord}(D)` is the inverse limit of the `O`-duals of ordinary forms along the ordinary trace tower.
- `P_D` is the characteristic-polynomial subring of `R_D` of §2.2, not a second construction.
- `𝔪_D` may be the unit ideal; `𝕋_D` is the completed localisation at `𝔪_D`, possibly zero.
- For supplied arithmetic arrows `f_P : P_{D₁} → P_{D₀}` and `f_𝕋 : 𝕋_{D₁} → 𝕋_{D₀}` intertwining the comparison maps, `f_P(J_{D₁}) ⊂ J_{D₀}`.

**Checks.**

- For `X = ∅`, `M_D ≅ O` and the datum has no Steinberg choices; a normalisation with the type lattices themselves rather than their duals would give the contragredient Hecke eigensystems.
- If `𝔪_D` is the unit ideal, `𝕋_D = 0` and `J_D = P_D`.
- The normalization of the generators is pinned in rank two over `𝔽₇` with `q_w = 2` and `det r̄(Frob_w) = 1`: the Hecke polynomial of 3.7 has constant term `q_w T_w^2`, so `2T_w^2 = 1` and `T_w^2 ≡ 4`, which is the generator `T_w^2 − q_w^{−1} tr ∧^2 r̄(Frob_w) = T_w^2 − 4`. The printed `T_w^2 − q_w tr ∧^2 r̄(Frob_w)` gives `T_w^2 ≡ 2` and determinant `q_wT_w^2 = 4 ≠ 1`.
- A Steinberg choice at some `v ∈ X` violates the hypothesis of NT21 Lemma 6.6, and the construction of `P_D → 𝕋_D` does not apply under it; the datum category allows the choice, the comparison does not.
- The inverse-limit coefficients are kept distinct from a common finite field realising every level: coefficient enlargement is level by level.

### 3.11 Ordinary forms are finite free over `Λ`

Let `𝒮 = S^{ord}_{λ,{χ_v}}(U(l^∞), K/O)^∨` and `𝕋^{ord} = 𝕋^{T,ord}_{λ,{χ_v}}(U(l^∞), O)`, which acts faithfully on `𝒮`. Prove:

(a) (Tho12 §8, Proposition 8.2, p. 46.) If `t^{−1} G(L⁺) t ∩ U` contains no element of order `l` for every `t ∈ G(𝔸^∞_{L⁺})`, then `𝒮` is a free `Λ`-module of rank `r = dim_k S^{ord}_{λ,{χ_v}}(U(l^{1,1}), k)`; so `𝕋^{ord}` is a finite `Λ`-algebra, faithful over `Λ` when `r > 0`.

(b) (Ger19 §2.5, Proposition 2.5.3 and Corollary 2.5.4, pp. 16–17.) Without that hypothesis, let `b₀ ≥ 1` be such that `U(l^{b₀,b₀})` is sufficiently small (its projection to some `G(L⁺_v)` has no nontrivial element of finite order; such `b₀` exists). Then `𝒮` is free over `Λ_{b₀}` of rank `dim_k S^{ord}_{λ,{χ_v}}(U(l^{b₀,b₀}), k)`, and `𝕋^{ord}` and `𝕋̃^{ord}` are finite `Λ_{b₀}`-algebras, faithful when this rank is positive (Ger19 Lemma 2.4.3, p. 13, proves positivity when `U` is sufficiently small).

(c) (Tho15 §4.1, Proposition 4.3, pp. 36–37; division-algebra group, weight 0.) If some `U_v` with `v ∉ S_l` has no nontrivial element of finite order, `𝕋^T_χ(U(l^∞), O)` is a finite faithful `Λ`-algebra and `S_χ(U(l^∞), K/O)^∨` is a faithful module over it, finite free over `Λ`.

(d) (NT21 §6, Proposition 6.5, p. 79.) For a deformation datum `D` (3.10) with `U(D, 1)` sufficiently small (`G(L⁺) ∩ g U(D, 1) g^{−1} = 1` for all `g`), `H^{ord}(D)` is finite free over `Λ_L` and `𝕋^{ord}(D)` is a finite `Λ_L`-algebra, faithful when it is nonzero; so `𝕋_D` is a finite local `Λ_L`-algebra or zero.

Consequently the universal ordinary Hecke algebra `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O)` of 3.9 is finite over `Λ`, and, when nonzero, a finite faithful `Λ_{b₀}`-algebra for every `b₀ ≥ 1` with `U(l^{b₀,b₀})` sufficiently small, hence the finite product of its localisations `𝕋_𝔪` at its maximal ideals, each a complete local `Λ`-algebra.

*Route.* Lowering the level (Ger19 Lemma 2.5.2, pp. 15–16): for `c > b ≥ 1` the double cosets `U(l^{b,c}) α U(l^{b,c})` and `U(l^{b,c−1}) α U(l^{b,c})` coincide for `α = ∏_v ∏_j α^j_{ϖ_ṽ}`, so `S^{ord}(U(l^{b,b}), A) = S^{ord}(U(l^{b,c}), A)`. Control: with `𝔞_b = ker(Λ → O[T(l)/T(l^b)])`, `𝒮/𝔞_b 𝒮 ≅ S^{ord}(U(l^{b,b}), K/O)^∨ = Hom_O(S^{ord}(U(l^{b,b}), O), O)` by 3.4 (1). Freeness at finite level: 3.4 (2) for `U(l^{b,b}) ⊴ U(l^{1,b})`, whose quotient `T(l)/T(l^b)` is an abelian `l`-group, shows that `S^{ord}(U(l^{b,b}), O)` is free over `Λ/𝔞_b` of rank `r`. Topological Nakayama over `Λ` gives a surjection `Λ^r → 𝒮` whose kernel lies in `∩_b 𝔞_b Λ^r = 0`; and `𝕋^{ord}` embeds in `End_Λ(𝒮)`. In (b) use `Λ_{b₀}` and Ger19 Lemma 2.2.6 with `U(l^{b₀,b})` in place of `U(l^{1,b})`; (d) is the same argument for the type coefficients of 3.10.

*Needs:* 3.4; 3.8; 3.9; 3.10.

**Checks.**

- For `n = 1`, `𝒮 ≅ O⟦C_∞⟧` with `C_∞ = lim_c G(L⁺)\G(𝔸^∞_{L⁺})/U(l^{c,c})`, free over `Λ` of rank `#G(L⁺)\G(𝔸^∞_{L⁺})/U(l^{1,1})` when `T(l) → C_∞` is injective, which holds when `G(L⁺) ∩ U` has no element of order `l`; when `G(L⁺) ∩ U` contains `ζ_l` the map `T(l) → C_∞` has a kernel of order `l` and `𝒮` is not free over `Λ`.
- Under the hypothesis of (a), `b₀ = 1` is allowed in (b) and the two statements agree.
- If `S^{ord}_{λ,{χ_v}}(U(l^{1,1}), k) = 0` then `r = 0`, `𝒮 = 0` and faithfulness is vacuous; (a) then asserts nothing about `Λ`.
- If `S^{ord}_{λ,{χ_v}}(U(l^{1,1}), k) ≠ 0`, then `𝕋^{T,ord}(U(l^∞), O)` is not finite over `O`: it is a finite faithful algebra over `Λ_{b₀}`, a ring of Krull dimension `1 + n[L⁺ : ℚ]`.

### 3.12 Hida classicality and independence of the characters `χ_v` modulo `λ`

Prove:

(1) *Weight independence* (Ger19 §2.6, Proposition 2.6.1, pp. 18–20). Let `λ` be dominant, `r ≥ 1`, `A = O/ϖ^r` or `ϖ^{−r}O/O`, and `c ≥ r`. Composing forms with the `B_n(O)`-equivariant projection of `M_λ` onto its lowest weight line `O(w₀λ)` gives an isomorphism `λ_* : S^{ord}_{λ,{χ_v}}(U(l^{c,c}), A) ≅ S^{ord}_{0,{χ_v}}(U(l^{c,c}), A)` which commutes with the `T_w^j`, carries `U^j_{λ,ϖ_ṽ}` to `U^j_{0,ϖ_ṽ}` and satisfies `λ_*(⟨u⟩ f) = (w₀λ)(u) ⟨u⟩ λ_*(f)`; in the limit, `λ_* : S^{ord}_{λ,{χ_v}}(U(l^∞), K/O) ≅ S^{ord}_{0,{χ_v}}(U(l^∞), K/O)`. No hypothesis on `U^l` is needed. Transporting the Hecke action along `λ_*` gives an `O`-algebra isomorphism `φ_λ` from the weight-0 algebra `𝕋̃^{T,ord}_{0,{χ_v}}(U(l^∞), O)` to `𝕋̃^{T,ord}_{λ,{χ_v}}(U(l^∞), O)` with `φ_λ(T_w^j) = T_w^j`, `φ_λ(U^j_{0,ϖ_ṽ}) = U^j_{λ,ϖ_ṽ}` and `φ_λ(⟨u⟩) = (w₀λ)(u)^{−1}⟨u⟩`, so weight 0 loses nothing.

(2) *Arithmetic primes* (Ger19 §2.6, Definition 2.6.3, p. 21). For `λ` dominant and `α : T(l) → Q̄_l^×` of finite order, define `℘_{λ,α} ⊂ Λ` as the kernel of the `O`-algebra map `Λ → Q̄_l` induced by `u ↦ α(u)(w₀ν)(u)^{−1}(w₀λ)(u)^{−1} = α(u) ∏_{τ ∈ Ĩ_l} ∏_{i=1}^{n} τ(u_i)^{1−i−λ_{τ,n+1−i}}`, and `℘_λ = ℘_{λ,1}`. For `r ≥ 1` with `T(l^r) ⊂ ker α`, define `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, A)` as the submodule on which `⟨u⟩ = α(u)` for all `u ∈ T(l)` (the `α`-isotypic part for `T(l)/T(l^r)`, not the whole space of level `r` unless `r = 1`), and `𝕋^{T,ord}_{λ,{χ_v}}(U(l^{r,r}), α, A)` the image of the Hecke algebra on it.

(3) *Classicality* (Ger19 §2.6, Lemma 2.6.4, pp. 21–22). Let `𝒮 = S^{ord}_{0,{χ_v}}(U(l^∞), K/O)^∨` with the `Λ`-structure of 3.9, `℘ = ℘_{λ,α}` and `K′ = Frac(Λ/℘)`. Then `𝒮_℘/℘𝒮_℘ ≅ Hom_{K′}(S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, K′), K′)` compatibly with `φ_λ`, and `φ_λ` induces a surjection of finite `K′`-algebras `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O) ⊗_Λ Λ_℘/℘ → 𝕋^{T,ord}_{λ,{χ_v}}(U(l^{r,r}), α, K′)` with nilpotent kernel (likewise for the algebras `𝕋̃` containing the `U`-operators). On the quotient where `T(O_{L⁺}/l)` acts through a character `γ`, the target is the part of level `U(l^{r,r})` on which `T(O_{L⁺,l}) = T(O_{L⁺}/l) × T(l)` acts through `(γ·ω^{w₀λ}) α`, with `ω^{w₀λ}` the Teichmüller lift of `w₀λ` modulo `l`. No smallness hypothesis is needed. Consequently every `O`-algebra homomorphism `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O) → Q̄_l` whose restriction to `Λ` has kernel `℘_{λ,α}` is the eigensystem of an irreducible constituent of `S_{λ,{χ_v}}(Q̄_l)` with a nonzero vector in `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), Q̄_l)` on which `T(l)` acts through `α`.

(3′) *Integral form.* After enlarging `O` to contain the values of `α`, `𝒮/℘𝒮 ≅ S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, K/O)^∨`; if moreover no `t^{−1} G(L⁺) t ∩ U` contains an element of order `l`, this is `Hom_O(S^{ord}_{λ,{χ_v}}(U(l^{r,r}), α, O), O)`. This is assembled from the proofs of Ger19 Propositions 2.5.3 and 2.6.1 and is not stated there.

(4) *Independence of the `χ_v` modulo `λ`* (Ger19 §2.2, remark before Lemma 2.2.6, p. 8, and §4.1, p. 41; Tho12 §8, p. 48). If `χ_v ≡ χ′_v mod λ` for every `v ∈ R`, then `S_{λ,{χ_v}}(U, A) = S_{λ,{χ′_v}}(U, A)` for every `k`-vector space `A`, compatibly with all Hecke operators. Hence, when all `χ_v ≡ 1`, a maximal ideal `𝔪_{{1}}` of `𝕋^{T,ord}_{{1}}(U(l^∞), O)` determines a maximal ideal `𝔪_{{χ_v}}` of `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O)` with the same residual representation.

*Route.* (1) Let `v_λ ∈ M_λ` be the lowest weight vector mapping to 1; for coefficients killed by `ϖ^r` and level `c ≥ r`, `φ : f ↦ U(l)^r(v_λ ⊗ f)` from weight 0 to weight `λ` is well defined, and `λ_* ∘ φ = U(l)^r = φ ∘ λ_*` because `(w₀λ)(α^r)^{−1} ξ_λ(α^r)` is the identity on the lowest weight line and kills every other weight space modulo `ϖ^r`; `U(l)` is bijective on ordinary parts. (3) `𝒮/℘𝒮` is the Pontryagin dual of the `℘`-torsion of `S^{ord}_0(U(l^∞), K/O)` for the twisted action, which by (1) is the part of `S^{ord}_λ(U(l^∞), K/O)` where `⟨u⟩ = α(u)`; it lies in the `T(l^r)`-invariants, equal to `S^{ord}_λ(U(l^{r,r}), K/O)` (Ger19 Lemma 2.5.2). `𝒮_℘` is finite free over `Λ_℘` (3.11) and `𝕋_℘` acts faithfully, so `𝒮_℘/℘` is a nearly faithful `𝕋_℘/℘`-module (in Taylor's sense), which gives the surjection with nilpotent kernel. (4) `M_{λ,{χ_v}} ⊗ k = M_{λ,{χ′_v}} ⊗ k` as representations of `U`, and the maximal ideals of the big algebra are those of its action on `S^{ord}_0(U(l^{1,1}), k)` (Ger19, proof of Proposition 2.7.3).

*Needs:* 3.8; 3.9; 3.11; PotentialAutomorphyInfrastructure §3.44.

**Checks.**

- An ordinary constituent with a nonzero vector in `S^{ord}_{λ,{χ_v}}(U(l^{r,r}), Q̄_l)` on which `T(l)` acts through `α` gives a point of the big ordinary Hecke algebra above `℘_{λ,α}`; in particular the descent (3.5) of an `ι`-ordinary RACSDC `π` of weight `λ` unramified above `l` gives a point above `℘_λ`.
- Part (4) is what allows the characters `χ_v` to be varied in Taylor's Ihara avoidance argument (§4.6; Tho12 §8, Theorem 8.6 and its proof, pp. 49–53). It identifies spaces with residue-field coefficients only: in `O = ℤ₅[ζ₅]` with uniformizer `ϖ = ζ₅ − 1`, the characters with values `1` and `ζ₅` on a generator differ by `ϖ`, so they are congruent modulo `λ` and not modulo `λ²`; (4) gives equal spaces with `k`-coefficients, while with `O/λ²`-coefficients the two characters differ and (4) asserts nothing.
- For `n = 1`, `λ = (a)` at one embedding and `α = 1`, `℘_λ` is the kernel of `[u] ↦ u^{−a}`; the classical forms of weight `a` and level `U(l^{1,1})` are the `℘_λ`-specialisation. The untwisted rule `[u] ↦ u^{a}` would give weight `−a`.
- (3) asserts nothing at a non-arithmetic prime: for `α` of infinite order the fibre need not be classical.
- For `λ` dominant, `α` a finite-order character of `T(l)` trivial on `T(l^r)` and `℘ = ℘_{λ,α}`, `φ_λ` induces a surjection `𝕋^{T,ord}_{{χ_v}}(U(l^∞), O) ⊗_Λ Λ_℘/℘ → 𝕋^{T,ord}_{λ,{χ_v}}(U(l^{r,r}), α, K′)` with nilpotent kernel, with no smallness hypothesis; integrally, for each `c ≥ 1` the weight-0 big algebra surjects onto `𝕋^{T,ord}_{λ,{χ_v}}(U(l^{c,c}), O)` through `φ_λ`, killing the kernel of `Λ → O[T(l)/T(l^c)]`, `u ↦ (w₀ν)(u)^{−1}(w₀λ)(u)^{−1}[u]`. Using the untwisted diamond action instead would match weight `λ` with the prime of weight `λ − ν`.

### 3.13 The `Λ`-adic Galois representation on the big ordinary Hecke algebra

Let `𝕋^{ord} = 𝕋^{T,ord}_{{χ_v}}(U(l^∞), O)` (3.9), with `U_v = G(O_{L⁺_v})` at split `v ∉ T` and at `v ∈ S_l`, in weight 0 (weights are carried by `Λ`). Prove:

(1) (Tho12 §8, Proposition 8.4, p. 47; Ger19 §2.7, Proposition 2.7.3.) For every maximal ideal `𝔪` of `𝕋^{ord}` there is a unique continuous semisimple `r̄_𝔪 : G_L → GL_n(𝕋^{ord}/𝔪)` with `r̄_𝔪^c ≅ r̄_𝔪^∨(1 − n)`, unramified at `w, w^c` with `det(X − r̄_𝔪(Frob_w)) = Σ_j (−1)^j (Nw)^{j(j−1)/2} T_w^j X^{n−j}` for every `v ∉ T` split as `w w^c`, and unramified above inert `v` with `U_v` hyperspecial.

(2) (Tho12 Proposition 8.5, p. 47; Ger19 Proposition 2.7.4, pp. 25–26.) If `𝔪` is non-Eisenstein and `l` is odd, `r̄_𝔪` extends to `r̄_𝔪 : G_{L⁺} → 𝒢_n(𝕋^{ord}/𝔪)` with `r̄_𝔪^{−1}(GL_n × GL_1) = G_L` and `ν ∘ r̄_𝔪 = ε^{1−n} δ_{L/L⁺}^{μ_𝔪}`, and it has a continuous lift `r_𝔪 : G_{L⁺} → 𝒢_n(𝕋^{ord}_𝔪)`, unique up to conjugation by elements of `GL_n(𝕋^{ord}_𝔪)` trivial modulo `𝔪`, such that (i) `r_𝔪` is unramified at `w, w^c` for split `v = w w^c ∉ T` with the same Frobenius polynomials; (ii) `r_𝔪` is unramified above inert `v` with `U_v` hyperspecial; (iii) if `U_v = ι_ṽ^{−1} Iw(ṽ)` for `v ∈ R`, then `det(X − r_𝔪(σ)) = ∏_{j=1}^{n} (X − χ_{v,j}^{−1}(Art^{−1}_{L_ṽ}(σ)))` for `σ ∈ I_{L_ṽ}`; (iv) `ν ∘ r_𝔪 = ε^{1−n} δ_{L/L⁺}^{μ_𝔪}`.

(3) *Ordinarity at `l`* (Ger19 §3.1.1, Corollary 3.1.4, pp. 32–33). For `v ∈ S_l` let `Λ_ṽ = O⟦(I^{ab}_{L_ṽ}(l))^n⟧`, mapped into `Λ` through the inverse Artin map `(I^{ab}_{L_ṽ}(l))^n ≅ (1 + ϖ_ṽ O_{L_ṽ})^n ⊂ T(l)`, and let `R^△_{Λ_ṽ}` be the quotient of `R^□_ṽ ⊗̂_O Λ_ṽ` cut out by the ordinary flag scheme (LocalGaloisDeformationRings §§1.9, 6.12). The homomorphism `R^□_ṽ ⊗̂_O Λ_ṽ → 𝕋^{ord}_𝔪` given by `r_𝔪|G_{L_ṽ}` and the `Λ`-structure of 3.9 factors through `R^△_{Λ_ṽ}`. In particular (Ger19 Lemma 3.1.3), for every `O`-algebra homomorphism `ζ : 𝕋^{ord}_𝔪 → O_E` with `E/K` finite, after a finite coefficient extension `E′/E`, `ζ ∘ r_𝔪|G_{L_ṽ} ⊗ O_{E′}` is `GL_n(O_{E′})`-conjugate to an upper triangular representation whose `j`-th diagonal character, restricted to inertia, is the push-forward by `ζ` of the `j`-th universal character. This is the geometric-point conclusion of properness for the ordinary flag scheme; it does not assert a flag over `E` when only the inertial characters have been specified (Ger19, proof of Lemma 3.1.3, Ger19 lines 1434–1437). No filtration of `𝕋^{ord}_𝔪`-modules is asserted.

(4) (Ger19 §3.4, Corollary 3.4.8, and §4.1, Lemma 4.1.7, pp. 39–45; Tho12, proof of Theorem 8.6, p. 49.) If `r̄_𝔪|G_{L_ṽ}` is trivial for all `v ∈ S_l`, the map of (3) factors through the quotient `R^{△,ar}_{Λ_ṽ}` of LocalGaloisDeformationRings §6.24; under the hypotheses listed before Tho12 Theorem 8.6 the lifting `r_𝔪` is of type `𝒮_{{χ_v}}` for the ordinary deformation problem of §4.6.

*Route.* `𝕋^{ord}` is finite over `Λ`, and `𝕋^{ord}/𝔪_Λ` maps onto the Hecke algebra of `S^{ord}_{0,{χ_v}}(U(l^{1,1}), k)` with kernel in the radical, so `𝔪` comes from a maximal ideal of a finite-level algebra with sufficiently small level; `r̄_𝔪` then comes from 3.7. For `c ≥ c₀` the transition maps induce bijections on maximal ideals and `𝕋^{ord}_𝔪 = lim_c 𝕋^{T,ord}_{0,{χ_v}}(U(l^{c,c}), O)_{𝔪_c}`; 3.7 applies to each finite-level localisation, and the lifts can be chosen compatibly. For (3), let `γ` be the character of `T(O_{L⁺}/l)` attached to `𝔪`; for regular dominant `λ` with `γ·ω^{w₀λ} = 1` the primes above `℘_λ` are classical of level `U(l^{0,1})` (3.12), the local components at `l` are unramified, and the Galois representations are crystalline and upper triangular with the predicted diagonal characters (Ger19 Lemma 2.7.5 to Corollary 2.7.8, pp. 26–29; compare §0.4); these `℘_λ` are Zariski dense in `Spec Λ` and the Hecke algebra is reduced. For (4), every `Q̄_l`-point of a finite-level localisation restricts to an arithmetic point of `Λ_ṽ`, and such points of `R^△` lie on `R^{△,ar}` (Ger19 Lemma 3.4.7).

*Needs:* 3.3; 3.7; 3.9; 3.11; 3.12; §0.4; LocalGaloisDeformationRings §§1.9, 6.12; LocalGaloisDeformationRings §6.24; LocalGaloisDeformationRings §1.3.

**Checks.**

- Specialising at an arithmetic point of weight `λ` gives `r_{l,ι}(π)` of an `ι`-ordinary `π` of weight `λ`; at the trivial character `α = 1` and `λ = 0` the diagonal characters on inertia are `1, ε^{−1}, …, ε^{1−n}`, matching §0.1 with `λ = 0`.
- For `n = 1` the lift is the universal character `G_{L⁺} → 𝒢_1(O⟦C_∞⟧)`, and (3) says that its restriction to `I_{L_ṽ}` is the tautological character through `Λ_ṽ`.
- The coefficient extension in (3) is essential: over `ℤ₃`, an unramified representation with Frobenius matrix `(1, 6; 3, 1)` has trivial reduction and characteristic polynomial `(X − 1)² − 18`. Its roots are `1 ± 3√2`, so it lies in the ordinary image ring with inertial characters `(1, 1)` but has no invariant line over `ℚ₃`; over `ℚ₃(√2)` it has two. An integral triangularization over `O_E` alone would falsely require `√2 ∈ ℚ₃`.
- (3) is a statement about points after finite coefficient extension; asserting a `𝕋^{ord}_𝔪`-module filtration would fail when the residual characters coincide, since the ordinary flag is not unique over Artinian coefficients (LocalGaloisDeformationRings, ordinary flag definitions for §1.7: flag uniqueness over Artinian coefficients needs pairwise distinct residual inertial characters).

### 3.14 From Hecke eigensystems to automorphic representations of `GL_n`

Keep 3.3, 3.7 and 3.12. Prove: (a) Every `O`-algebra homomorphism `f : 𝕋^T_λ(U, O) → Q̄_l` is the eigensystem of an irreducible constituent of `S_λ(U, Q̄_l)`, hence of some `Π` as in 3.5(2); if the maximal ideal below `f` is non-Eisenstein then `f ∘ r_𝔪|G_L ≅ r_{l,ι}(π)` for a RACSDC `π` whose weight is `ι_*λ` extended to all embeddings by `λ_{τc,i} = −λ_{τ,n+1−i}`. (b) (Ger19 §2.6, Lemma 2.6.4, pp. 21–22; Lemma 2.25 of the published numbering.) Let `f : 𝕋^{T,ord}_{{χ_v}}(U(l^∞), O) → Q̄_l` be an `O`-algebra homomorphism whose restriction to `Λ` has kernel an arithmetic prime `℘_{λ,α}` (3.12). Then `f` factors through the classical algebra `𝕋^{T,ord}_{λ,{χ_v}}(U(l^{r,r}), α, Q̄_l)`, so it is the eigensystem of a constituent of `S_{λ,{χ_v}}(Q̄_l)` with an ordinary vector of level `U(l^{r,r})`; if the attached Galois representation is irreducible it is `r_{l,ι}(π)` for a RACSDC `π` (NT26 §3, p. 25, concludes this way).

*Route.* (a): `𝕋 ⊗ Q̄_l` acts semisimply, so `f` is an eigensystem; apply 3.5(2), compare Frobenius polynomials at split places outside `T` (3.6 (i), 3.7 (i)) by Chebotarev, and use 3.6 for the irreducible case. (b): by 3.12 (3) the big ordinary Hecke algebra, localised and reduced at `℘_{λ,α}`, maps onto the classical ordinary algebra with nilpotent kernel; then argue as in (a).

*Needs:* 3.3; 3.6; 3.7; 3.5; 3.12; ArithmeticGaloisRepresentations §5.3 (recognition of semisimple representations from Frobenius polynomials).

**Checks.**

- In the proof of Tho12 Theorem 10.1 (pp. 55–56): after twisting to a conjugate self-dual `π` and a soluble extension `L`, `π_L` is the strong base change of some `Π` on `G` (3.5), which produces the maximal ideal `𝔪` with `r̄_𝔪 ≅ r̄|G_{L⁺}`; the maximal ideal attached to a RACSDC `π` at a level `U` with `(ι^{−1}Π^∞)^U ≠ 0` for its descent `Π` has `r̄_𝔪 ≅ r̄_{l,ι}(π)`.
- A constituent whose base change is a sum `π₁ ⊞ π₂` with `n₁, n₂ ≥ 1` has reducible Galois representation, so the non-Eisenstein and irreducibility hypotheses in (a) and (b) cannot be dropped.
- For `n = 1` every `f` is a character of the finite group `G(L⁺)\G(𝔸^∞_{L⁺})/U`, and `f ∘ r_𝔪|G_L` is the `l`-adic character of the Hecke character `x ↦ f(x/x^c)`, which is RACSDC with `λ_{τc,1} = −λ_{τ,1}`.

### Examples

- For `n = 1` every construction of this layer is explicit: `G = U_1`, forms are functions on the finite group `G(L⁺)\G(𝔸^∞)/U`, every form is ordinary, the big ordinary Hecke algebra is `O⟦C_∞⟧`, and the `Λ`-adic Galois representation is the universal character (3.1, 3.9, 3.13).
- For `n = 2`, `λ = 0`: `S^{ord}` is cut out by unit eigenvalues of `U^1_{0,ϖ_ṽ}`; the Eisenstein maximal ideal of the constant functions has residual representation `1 ⊕ ε̄^{−1}` up to twist (3.7, 3.8).
- The descent of an `ι`-ordinary RACSDC `π` of weight `λ` unramified above `l` gives a classical point of the big ordinary Hecke algebra above `℘_λ`, whose specialisation of `r_𝔪` is `r_{l,ι}(π)` (3.5, 3.12, 3.13, 3.14).

### Dependencies

Layer 0 (§0.4 for the ordinary comparison at classical points); Layer 2 (§2.2 for `P_D` in 3.10). Suppliers: CompletedCohomologyAndLocalGlobalCompatibility §0.7 (the group, forms and split-place Hecke algebra for `S(B) = ∅`), ArithmeticLocallySymmetricSpaces §ALS.F.7 and PotentialAutomorphyInfrastructure §0.4 (integral dual Weyl lattices), AutomorphicFormsOnReductiveGroups §7.4, AutomorphicFormsOnReductiveGroups §7.5; AdelicAlgebraicGroups §§1.1, 1.5, AdelicAlgebraicGroups §3.4 (finiteness of class numbers); IntegralHeckeAndGaloisDeterminants §§0.2, 1.1–1.3, 3b.1; LocalGaloisDeformationRings §F.2.7; ArithmeticGaloisRepresentations §§5.3, 7.4; GlobalGaloisDeformations §8.1; AutomorphicGaloisRepresentationsPartII AG2.0 (polarized automorphic representations), AutomorphicGaloisRepresentationsPartII AG2.3 (arbitrary regular conjugate-self-dual existence), AG2.2 (discrete sums) and AG2.5–AG2.6 (compatibility), AutomorphicGaloisRepresentationsPartII AG2.6 (polarized admissibility at the coefficient prime), AutomorphicGaloisRepresentationsPartII AG2.6 (full polarized local–global compatibility at `l`), AutomorphicGaloisRepresentationsPartII AG2.7 (finite realization and residual representation of `π`); EndoscopicTransferAndUnitaryTraceComparison §6.29 (with §4.7a at the places of `S(B)`); SmoothRepresentationsOfLocalGroups §SR.5.2 (types); LocalGaloisDeformationRings §§2.5, 2.24, 2.26; LocalGaloisDeformationRings §§1.9, 6.12, LocalGaloisDeformationRings §6.24, LocalGaloisDeformationRings §1.3; PadicFamilies §§0a.2, 0a.14, PadicFamilies §0a.4.

## Layer 4: Taylor–Wiles primes under adequacy and the patching `R = T` theorems

This layer patches the modules of Layer 3. It defines Thorne's Taylor–Wiles data, in which a residual Frobenius eigenvalue of any multiplicity is singled out, builds the corresponding level structures on the definite unitary group with the parahoric projection of Thorne 2012 §5, proves the existence of Taylor–Wiles data under adequacy (in the corrected form of Thorne 2017, including `p = 2` when `F` contains `ζ_p`), and proves the minimal and ordinary `R = T` theorems with Taylor's Ihara avoidance, and the Ihara-avoidance theorem with a fixed potentially crystalline type at `l`. Polarized global deformation problems, their presentations over the local rings and the tangent and obstruction calculations are GlobalGaloisDeformations §§8.1–8.4; the abstract patching and support theorems are DeformationAndDerivedPatchingAlgebra Layers 5–6. Adequacy is ArithmeticGaloisRepresentations §7.9 (Thorne adequacy for Thorne 2012 Definition 2.3, Guralnick–Herzig–Tiep adequacy for Thorne 2017 Definition 2.20).

### 4.1 Taylor–Wiles data with a residual eigenspace

Let `𝒮 = (F/F⁺, S, S̃, O, r̄, χ, {D_v}_{v∈S})` be a polarized global deformation problem (GlobalGaloisDeformations §8.1) with residue field `k` of characteristic `l` and `r̄|G_F` absolutely irreducible. Define a *Taylor–Wiles datum* for `𝒮` as `(Q, Q̃, {ψ̄_ṽ}_{v∈Q})`: `Q` a finite set of places `v ∉ S` of `F⁺` that split in `F` and have `Nv ≡ 1 mod l`; `Q̃` one place `ṽ | v` for each `v ∈ Q`; and for each `v ∈ Q`, at which `r̄|G_{F_ṽ}` is unramified, a decomposition `r̄|G_{F_ṽ} = s̄_v ⊕ ψ̄_v` in which `ψ̄_v` is the generalized eigenspace of `Frob_ṽ` for an eigenvalue `α_v ∈ k` on which `Frob_ṽ` acts semisimply, and `s̄_v` is the sum of the other generalized eigenspaces. The augmented problem `𝒮_Q` adds, for `v ∈ Q`, the local deformation problem of lifts conjugate to `s_v ⊕ ψ_v` with `s_v` unramified and inertia acting on `ψ_v` through scalars (Tho12, Definition 4.1 and Lemma 4.2, pp. 15–16): this is the Taylor–Wiles block condition of LocalGaloisDeformationRings §2.23. Say the datum has level `N` if `Nv ≡ 1 mod l^N` for every `v ∈ Q`. When `dim ψ̄_v = 1` this is Clozel–Harris–Taylor's Definition 2.5.7; Tho17 §2.3.2, Definition 2.18 (pp. 12–13) uses the case in which `v` splits in `F(ζ_{p^N})` and the block is the whole `α_v`-eigenspace. GlobalGaloisDeformations §8.5 constructs the different Taylor–Wiles places of Allen et al., at which all lifts are allowed and the diamond group is `(k(v)^×(l))^n`; the block condition here keeps `s_v` unramified and has diamond group `k(ṽ)^×(l)`.

Prove: `R^univ_{𝒮_Q}` is an `O[Δ_Q]`-algebra, `Δ_Q = ∏_{v∈Q} k(ṽ)^×(l)`, through the inertia character on `ψ_v`, with `R^univ_{𝒮_Q} ⊗_{O[Δ_Q]} O = R^univ_𝒮`; and the annihilator `L_v^⊥ ⊂ H¹(G_{F_ṽ}, ad r̄(1))` of the local tangent space under the trace pairing is the space of unramified classes `[φ]` with `tr e_{Frob_ṽ,α_v} φ(Frob_ṽ) = 0`, `e_{Frob_ṽ,α_v}` the Frobenius-equivariant projection onto `ψ̄_v`; in this form the statement holds also when `l | dim ψ̄_v` (Tho12, proof of Proposition 4.4, pp. 17–18; Tho17, Lemma 2.19, p. 13).

*Route.* By Hensel's lemma for the characteristic polynomial of a Frobenius lift, a lift splits uniquely as `s ⊕ ψ` lifting `s̄ ⊕ ψ̄`; this gives the local deformation problem and the `O[Δ_v]`-structure (LocalGaloisDeformationRings §2.23). The tangent space `L_v` consists of classes unramified on the `s̄`-block with inertia acting through scalars on the `ψ̄`-block, and local duality computes its annihilator. The `O[Δ_Q]`-structure on the global ring uses a diagonal entry of inertia on the `ψ`-block (Tho12, proof of Theorem 6.8, p. 39).

*Needs:* GlobalGaloisDeformations §§8.1–8.3; LocalGaloisDeformationRings §2.23 (the Taylor–Wiles block condition), §F.3.1; ArithmeticGaloisDuality §R02.4.2 (local Tate duality).

**API.**

- The level-`N` condition is a predicate on a datum, satisfied by `Q = ∅` for every `N`; it is not a largest integer.
- The augmented problem `𝒮_Q` agrees with `𝒮` at `S` and has the block condition at `Q`.
- `R^univ_{𝒮_Q}` is an `O[Δ_Q]`-algebra with augmentation quotient `R^univ_𝒮`.
- `L_v^⊥` is the kernel of `[φ] ↦ tr e_{Frob_ṽ,α_v}φ(Frob_ṽ)` on unramified classes.

**Checks.**

- For `Q = ∅`, `𝒮_∅ = 𝒮`, `Δ_∅` is trivial and the datum has every level.
- If `dim ψ̄_v = 1` for every `v ∈ Q`, the condition is Clozel–Harris–Taylor's Definition 2.5.7. It is not the condition of GlobalGaloisDeformations §8.5, which allows every lift so that all `n` characters may ramify: for `n = 2`, `p = 5`, `q_v = 11`, Frobenius `diag(1, −1)` and inertia `(1 + ε)I` over `𝔽₅[ε]` is allowed there and excluded here, since the `s`-block ramifies.
- Every unramified lift of `r̄|G_{F_ṽ}` satisfies the block condition.
- A lift whose `ψ`-block has inertia acting through a nonscalar unipotent matrix (possible when `dim ψ̄_v ≥ 2`) does not.

### 4.2 Taylor–Wiles level structures and the parahoric projection

Keep Layer 3 with `R = ∅`, `U_v = G(O_{L⁺_v})` at `v ∈ S_l` and at split `v ∉ T`, hyperspecial at inert `v`; let `𝔪 ⊂ 𝕋^T_λ(U, O)` be non-Eisenstein and `(Q, Q̃, {ψ̄_ṽ})` a Taylor–Wiles datum for `r̄_𝔪` (§4.1), `d_ṽ = dim ψ̄_ṽ`. Construct for `v ∈ Q` the parahoric `𝔭_ṽ ⊂ GL_n(O_{L_ṽ})` of matrices reducing into the standard block upper triangular parabolic of type `(n − d_ṽ, d_ṽ)`, and `𝔭_{ṽ,1}` the kernel of `𝔭_ṽ → k(ṽ)^×(l)`, `g ↦` the class of the determinant of the lower right `d_ṽ × d_ṽ` block of `g mod ṽ`; so `𝔭_ṽ/𝔭_{ṽ,1} ≅ Δ_ṽ`. Let `U₀(Q)` and `U₁(Q)` agree with `U` away from `Q` and equal `ι_ṽ^{−1}𝔭_ṽ`, `ι_ṽ^{−1}𝔭_{ṽ,1}` at `v ∈ Q`; `U₁(Q)` is normal in `U₀(Q)` with quotient `Δ_Q`, which acts on `S_λ(U₁(Q), A)` by diamond operators. Define the Hecke operators `V^j_ṽ = ι_ṽ^{−1}[𝔭 diag(1_{n−d_ṽ}, ϖ_ṽ1_j, 1_{d_ṽ−j}) 𝔭]` (`1 ≤ j ≤ d_ṽ`) and the operator `pr_{ϖ_ṽ} = ∏_{j=1}^{d_ṽ} Q_j(V^j_ṽ)`: here `P` is the characteristic polynomial of `r_{𝔪_Q}(φ_ṽ)` for a Frobenius lift `φ_ṽ`, `P_j` the monic polynomial whose roots are `(Nṽ)^{j(1−j)/2}e_j(α_S)` over the `d_ṽ`-element subsets `S` of the roots of `P` (`e_j` the elementary symmetric function), and `P_j = Q_jR_j` the Hensel factorization with `R_j ≡ (X − C(d_ṽ, j)α_ṽ^j)^{k_j}` and `Q_j(C(d_ṽ, j)α_ṽ^j)` a unit (Tho12 §5, pp. 19–23, Proposition 5.8). `pr_{ϖ_ṽ}` is not an idempotent: it vanishes on `Σ_j ker Q_j(V^j_ṽ)` and is an automorphism of its image `∩_j ker R_j(V^j_ṽ)`, a direct summand. Put `H = S_λ(U, O)_𝔪`, `H_i = (∏_{v∈Q} pr_{ϖ_ṽ}) S_λ(U_i(Q), O)_{𝔪_Q}`. Prove (Tho12, proof of Theorem 6.8, pp. 37–39):

1. `𝕋^{T∪Q}_λ(U, O)_𝔪 → 𝕋^T_λ(U, O)_𝔪` is an isomorphism;
2. `∏_{v∈Q} pr_{ϖ_ṽ} : H → H₀` is an isomorphism (Tho12, Proposition 5.9 and Lemma 5.10, pp. 24–27);
3. if no `t^{−1}G(L⁺)t ∩ U₀(Q)` contains an element of order `l`, `H₁` is free over `O[Δ_Q]` and the trace induces `H₁/𝔞_Q ≅ H₀`;
4. for each `v ∈ Q` there is a character `V_ṽ : O_{L_ṽ}^× → 𝕋₁^×` agreeing with the diamond operators on `H₁`, and `(r_{𝔪_Q} ⊗ 𝕋₁)|G_{L_ṽ} ≅ s ⊕ ψ` with `s` unramified lifting `s̄_ṽ`, `ψ` lifting `ψ̄_ṽ`, and inertia acting on `ψ` through `V_ṽ ∘ Art_{L_ṽ}^{−1}` (Tho12, Lemma 5.11 and Proposition 5.12, pp. 28–30).

NT23 §4.3 (Lemma 4.3, pp. 28–29) uses instead Iwahori level at `Q` with `Δ_Q = ∏_{v∈Q} (k(v)^×(p))^n` and proves freeness of all of `S_λ(U₁(Q), O)` over `O[Δ_Q]` for sufficiently small `U`, with no projection.

*Route.* (1) holds because `r̄_𝔪` is absolutely irreducible, so the Hecke operators at `Q` are determined by those away from `Q` through the Galois representation. Local input (Tho12 §5): for a smooth `R[GL_n(L_ṽ)]`-module `Π` with finite free invariants under every compact open subgroup, generic semisimple constituents and a matching Galois representation, a generic constituent with `𝔭`-invariants is induced from unramified characters and twists of the two-dimensional Steinberg representation; `V^j` has characteristic polynomial dividing `P_j` on its `𝔭`-invariants, so `Π^𝔭 = ker Q_j(V^j) ⊕ ker R_j(V^j)`; only unramified constituents survive `pr_ϖ`, and injectivity modulo `λ` on spherical vectors uses the Iwahori Hecke algebra in characteristic `l` with `q = 1`. At level `𝔭₁`, a generic constituent with `𝔭₁`- but no `𝔭`-invariants is a principal series with `n − d` unramified and `d` tamely ramified characters of equal inertial restriction. Globally, constituents are generic by §3.6 because `r̄_𝔪` is irreducible; (3) is §3.4(2) for `U₁(Q) ⊴ U₀(Q)`. In the coset-sum formula use representatives supported at the Hecke place, so the coefficient action at `l` is trivial.

*Needs:* §§3.2–3.4, 3.6–3.7, 4.1; EndoscopicTransferAndUnitaryTraceComparison §§10.23, 10.30 (local Langlands and segments for the generic constituents); SmoothRepresentationsOfLocalGroups §§SR.2.3, SR.3.4 (Iwahori invariants, the Iwahori block), §SR.1 (Hecke algebras over rings).

**API.**

- `U₁(Q) ⊂ U₀(Q)` are open compact, `U₁(Q)` is normal with `U₀(Q)/U₁(Q) ≅ Δ_Q`; this uses that `U` is a product of local factors and spherical at `Q`.
- `O[Δ_Q]` acts on `S(U₁(Q), O)` by diamond operators commuting with `𝕋^{T∪Q}`.
- `pr_{ϖ_ṽ}` is a polynomial in the `V^j_ṽ` with coefficients in the Hecke algebra; the operators for different `v` commute with each other and with `𝕋^{T∪Q}`.
- `pr S(U₁(Q), O)_{𝔪_Q}` is free over `O[Δ_Q]` with coinvariants `pr S(U₀(Q), O)_{𝔪_Q} ≅ S(U, O)_𝔪`.
- On `pr S(U₁(Q), O)_{𝔪_Q}`, `r_{𝔪_Q}|G_{L_ṽ} ≅ s ⊕ ψ` with inertia on `ψ` through the diamond operators.

**Checks.**

- For `Q = ∅`, `U₀(∅) = U₁(∅) = U`, `Δ_∅ = 1` and `pr` is the identity.
- For `d_ṽ = 1`, `𝔭_ṽ` is the group of matrices with last row `≡ (0, …, 0, ∗) mod ṽ`, `Δ_ṽ = k(ṽ)^×(l)`, and `pr_ϖ = Q(V^1)` for `P(X) = Q(X)(X − A)` (Ger19 §4.2, Lemmas 4.2.2–4.2.3, pp. 47–50).
- If `Q = {v}` and `S(U, O)_𝔪` is free of rank `r` over `O`, then `pr S(U₁(Q), O)_{𝔪_Q}` is free of rank `r` over `O[Δ_ṽ]`, hence of `O`-rank `r·#Δ_ṽ`.
- Without the projections only `S_λ(U₁(Q), O)_{𝔪_Q} ⊗_{O[Δ_Q]} O ≅ S_λ(U₀(Q), O)_{𝔪_Q}` holds, and the right side is in general larger than `S_λ(U, O)_𝔪`: an Iwahori-spherical Steinberg constituent at `v` contributes to level `𝔭_ṽ` but not to level `U`.
- If some `t^{−1}G(L⁺)t ∩ U₀(Q)` contains an element with nontrivial image in `Δ_Q`, then `Δ_Q` does not act freely on `G(L⁺)\G(𝔸^∞_{L⁺})/U₁(Q)` and `S_0(U₁(Q), O)` is not free over `O[Δ_Q]`; this is why Thorne 2012 §8 adds a place `v₁` with Iwahori level and `Nv₁ ≢ 1 mod l`.

### 4.3 Taylor–Wiles primes for adequate residual image

Let `l` be odd and `𝒮` a polarized global deformation problem with `ρ̄ = r̄|G_F` absolutely irreducible, `k` containing the eigenvalues of every element of `ρ̄(G_F)`, and `T ⊂ S` such that `dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄)` equals `[F⁺_v : ℚ_l]n(n−1)/2` for `v ∈ S − T` above `l` and `0` for `v ∈ S − T` not above `l`. Assume either (a) `r̄(G_{F⁺(ζ_l)}) ⊂ 𝒢_n(k)` is adequate in the `𝒢_n`-form of Tho12 Definition 2.3 (Tho12, Proposition 4.4, pp. 17–18), or (b) `ζ_l ∉ F` and `ρ̄(G_{F(ζ_l)})` is adequate in the sense of Tho17 Definition 2.20 (Tho17, Proposition 7.1, p. 31, proof pp. 31–32). Let `q₀ ≥ 0` and `q = max(dim_k H¹_{L^⊥,T}(G_{F⁺,S}, ad r̄(1)), q₀)`. Prove that for every `N ≥ 1` there is a Taylor–Wiles datum of level `N` with `#Q = q` such that `R^T_{𝒮_Q}` is topologically generated over `R^loc_{𝒮,T}` by `#Q − Σ_{v∈T, v|l}[F⁺_v : ℚ_l]n(n−1)/2 − nΣ_{v|∞}(1 + χ(c_v))/2` elements. Version (a) cannot apply when `F ⊂ F⁺(ζ_l)`: then `r̄(G_{F⁺(ζ_l)})` lies in `𝒢_n⁰(k)` and fixes the scalars of `ad r̄`, so the `H⁰` condition of adequacy fails; version (b) is the form used in the proofs of the `R = T` theorems below (Tho17 §7, pp. 30–31).

*Route.* The generator count over `R^loc` is the dual Selmer dimension plus `#Q` minus the `l`-adic and archimedean terms and minus `h⁰(G_{F⁺,S}, ad r̄(1))` (Tho12, Lemma 4.3, pp. 16–17; GlobalGaloisDeformations §8.4). That last term vanishes: in (a) by the `H⁰` condition of adequacy; in (b) because the invariants lie in the scalar line, on which `G_{F⁺}` acts through `ε̄δ_{F/F⁺}`, nontrivial as `F ≠ F⁺(ζ_l)`. So it suffices to choose `Q` killing `H¹_{L(Q)^⊥,T}`, the kernel of `[φ] ↦ (tr e_{Frob_ṽ,α_v}φ(Frob_ṽ))_v` (§4.1). By Chebotarev it is enough to find, for each nonzero `[φ]`, `σ ∈ G_{F(ζ_{l^N})}` and an eigenvalue `α` of `ρ̄(σ)` with `ρ̄(σ)` semisimple on its `α`-eigenspace and `tr e_{σ,α}φ(σ) ≠ 0`. In (b): with `L` cut out by `r̄` over `F⁺(ζ_{l^N})` and `H = ρ̄(G_{F(ζ_l)})`, inflation–restriction gives `H¹(Gal(L/F⁺), ad r̄(1)) = 0` (`H` has no quotient of order `l`; the scalar part dies because `ε̄δ_{F/F⁺} ≠ 1`; `H¹(H, ad) = 0`), so `[φ]|G_L` is a nonzero equivariant homomorphism; the trace condition of adequacy gives `σ₀`, and `σ = σ₀` or `τσ₀` by the cocycle relation.

*Needs:* §4.1; ArithmeticGaloisRepresentations §7.9 (adequate and GHT-adequate subgroups); GlobalGaloisDeformations §§8.3–8.4 (tangent, obstruction and presentation of polarized problems); ArithmeticGaloisDuality §§R02.4.3, R02.5.1 (Poitou–Tate and Greenberg–Wiles); Chebotarev Layer 10.

**Checks.**

- For `n = 2`, `l ≥ 7`, `ζ_l ∉ F` and `SL₂(𝔽_l) ⊂ ρ̄(G_F)`, `ρ̄(G_{F(ζ_l)})` contains `SL₂(𝔽_l)` and is adequate (the criterion `l ≥ 2(n + 1)` of ArithmeticGaloisRepresentations §7.9), so (b) applies; `l = 5` is outside that criterion and is not claimed.
- If `l | n`, Tho12 Definition 2.3 for subgroups of `GL_n(k)` never holds (the scalars lie in `ad⁰`), while Tho17 Definition 2.20 can hold (Tho17 §7, p. 32).
- For `F = F⁺(ζ_l)`, `n = 2`: `r̄(G_{F⁺(ζ_l)}) = r̄(G_F) ⊂ 𝒢_2⁰(k)` acts trivially on the scalar line of `ad r̄`, so `H⁰(r̄(G_{F⁺(ζ_l)}), ad r̄) ≠ 0` and (a) fails, whatever the image.

### 4.4 Taylor–Wiles data when `F` contains `ζ_p`, including `p = 2`

Let `p` be any prime and `𝒮 = (F, r̄, O, χ, S, {D_v}_{v∈S})` a global deformation problem in the sense of Tho17 §2.1 (p. 6): `F/F⁺` unramified at every finite place, every place of `F⁺` above `p` split in `F`, `S ⊃ S_p ∪ S_∞`, `r̄ : G_{F⁺,S} → 𝒢_n(k)` with `r̄⁻¹(𝒢_n⁰(k)) = G_{F,S}` and `ρ̄ = r̄|G_{F,S}` absolutely irreducible, `χ` lifting `ν ∘ r̄`. Let `T = S − S_∞` and assume (i) `χ(c_v) = −1` and `D_v` is all liftings for every `v ∈ S_∞`; (ii) `F = F⁺(ζ_p)` if `p ≠ 2` and `F = F⁺(√−1)` if `p = 2`; (iii) if `p = 2` and `n` is even, `r̄(c_v)` is `GL_n(k)`-conjugate to `(1_n, 1)j` for some `v ∈ S_∞` (Tho17 Definition 3.3 calls this strong residual oddness); (iv) `ρ̄(G_F)` is GHT-adequate. Let `q = h¹_{𝒮^⊥,T} − 1` and `g = q + |T| − 1 − [F⁺ : ℚ]n(n−1)/2`. Prove that for each `N ≥ 1` there are Taylor–Wiles data `(Q, (α_v)_{v∈Q})` of level `N` (Tho17, Definition 2.18) with `#Q = q` and a surjection `R^loc_{𝒮,T}⟦X_1, …, X_g⟧ ↠ R^T_{𝒮_Q}` When `q > 0`, there are infinitely many such data, chosen outside any fixed finite set of places; when `q = 0`, the datum is `Q = ∅`. (Tho17, Proposition 2.21, p. 14, proof pp. 14–15; the source prints `µ(c_v)` in (i), a misprint for `χ(c_v)`).

*Route.* `R^T_{𝒮_Q}` is generated over `R^loc` by `h¹_{𝒮_Q,T}` elements (Tho17, Lemma 2.12). The Euler characteristic with archimedean tangent dimension `n(n+1)/2` and `ℓ¹_v = n² + 1` at `v ∈ Q` gives `χ_{𝒮_Q,T} = 1 − |T| − |Q| + [F⁺ : ℚ]n(n−1)/2`; with `h⁰ = 0`, `h² = h¹_{𝒮_Q^⊥,T}` and `h³ = h⁰(ad r̄(1)) = 1` (by (ii) the scalars of `ad r̄(1)` are `G_{F⁺}`-invariant), the target is `h¹_{𝒮_Q^⊥,T} = 1` (Tho17, Corollary 2.14, Lemma 2.15, pp. 9–10). Kill dual Selmer classes with nonzero restriction to `F(ζ_{p^N})` one at a time as in §4.3(b). What remains lies in `H¹(F(ζ_{p^N})/F⁺, k)`: one-dimensional for `p` odd; for `p = 2` two-dimensional, cut down to one by local triviality at the infinite places and injectivity of `H¹(F⁺_v, k) → H¹(F⁺_v, ad r̄(1))` at the place of (iii) (Tho17, Lemmas 2.16–2.17, p. 11): with `r̄(c_v) = (1_n, 1)j` and `p = 2`, `1 + c_v` acts on `ad r̄` by `X ↦ X + ᵗX`, whose image consists of alternating matrices and so misses the scalar `1`, while for `(Ψ_n, 1)j` and `n = 2` it contains `1`.

*Needs:* §4.1; ArithmeticGaloisRepresentations §§7.4, 7.9; GlobalGaloisDeformations §§8.3–8.4, with the extension to `p = 2` recorded as a supplier gap in the contracts; LocalGaloisDeformationRings §§1.14, 8.7 (odd archimedean rings at `p = 2`), with the `𝒢_n`-valued archimedean ring recorded as a supplier gap; ArithmeticGaloisDuality §§R02.4.3, R02.5.1; Chebotarev Layer 10.

**Checks.**

- For `n = 2` and `ρ̄ = σ|G_F ⊗ ψ^{−1}` with `σ : G_{F⁺} → GL₂(k)` as in Tho17 Lemma 3.5, (iii) holds if and only if `σ(c_v) ≠ 1` for some `v | ∞`, which is Dickinson's condition; `r̄(c_v)` itself lies outside `𝒢_n⁰(k)` and is never trivial.
- For `p` odd and `F = F⁺(ζ_p)`, the term `h³ = 1` replaces the vanishing used in §4.3: the scalar line of `ad r̄(1)` is invariant, because `ε̄δ_{F/F⁺}` is trivial on `G_{F⁺}` exactly when `F = F⁺(ζ_p)`. This is why `q` is one less than the dual Selmer dimension.
- For `n = 1` and `p = 2`, the archimedean local term is `n(n+1)/2 = 1`, and `g = q + |T| − 1`.

### 4.5 The minimal `R = T` theorem on definite unitary groups

Let `L`, `G`, `l`, `λ` be as in Layer 3, with `L/L⁺` unramified at all finite places, `l` odd and every place above `l` split in `L`; let `R = ∅` and `T = S_r ⊔ S_l` a finite set of places of `L⁺` split in `L`. Let `U = ∏U_v` with `U_v = G(O_{L⁺_v})` for `v ∈ S_l` and for split `v ∉ T`, hyperspecial at inert `v`, arbitrary for `v ∈ S_r`, and `t^{−1}G(L⁺)t ∩ U` trivial for all `t`. Let `𝔪 ⊂ 𝕋^T_λ(U, O)` be non-Eisenstein and `𝒮 = (L/L⁺, T, T̃, O, r̄_𝔪, ε^{1−n}δ_{L/L⁺}^{µ_𝔪}, {R̄^□_ṽ}_{v∈S_r} ∪ {R^{λ,cr}_ṽ}_{v∈S_l})`, `R̄^□_ṽ` the maximal reduced `l`-torsion-free quotient of the lifting ring and `R^{λ,cr}_ṽ` the crystalline lifting ring of weight `λ`. Prove that `r_𝔪` (§3.7) is of type `𝒮`, and, assuming `r̄_𝔪(G_{L⁺(ζ_l)})` adequate in the sense of Tho12 Definition 2.3 or the hypotheses of §4.7: if `r : G_{L⁺} → 𝒢_n(O)` is a lift of `r̄_𝔪` of type `𝒮` and `f′ : 𝕋^T_λ(U, O)_𝔪 → O` satisfies (i) for `v ∈ S_l`, `(f′ ∘ r_𝔪)|G_{L_ṽ}` and `r|G_{L_ṽ}` lie on a common irreducible component of `Spec R^{λ,cr}_ṽ ⊗ Q̄_l`, and (ii) for `v ∈ S_r`, `(f′ ∘ r_𝔪)|G_{L_ṽ} ⇝ r|G_{L_ṽ}` (§1.1), then `r ≅ f ∘ r_𝔪` for some `f : 𝕋^T_λ(U, O)_𝔪 → O` (Tho12, Theorem 6.8, p. 37, proof pp. 37–40). Moreover `µ_𝔪 ≡ n mod 2`, and if `𝒮′` replaces each local ring by its quotient for the unique component through `(f′ ∘ r_𝔪)|G_{L_ṽ}`, then `R^univ_{𝒮′}` is a finite `O`-algebra (Tho12, Corollary 6.9, p. 40). Thorne 2012 §6 also assumes `4 | n[L⁺ : ℚ]`; it is used only for the existence of `G` (§3.1).

*Route.* Type `𝒮`: `𝕋_𝔪` is reduced and `l`-torsion free and its `Q̄_l`-points are crystalline of weight `λ` at `l` (§3.6). For each `N` choose a Taylor–Wiles datum `Q_N` of level `N` with `#Q_N = q` by §4.3 with `q₀ = [L⁺ : ℚ]n(n−1)/2 + [L⁺ : ℚ]n(1 − (−1)^{µ_𝔪−n})/2`, so `R^T_{𝒮_{Q_N}}` is generated over `R^loc` by `g = q − q₀` elements. By §4.2 the modules `H_{i,Q_N}` are free over `O[Δ_{Q_N}]` with the right coinvariants and inertia at `Q_N` acts through Hecke operators; patch (Tho12, Lemma 6.10, pp. 40–41) to `H_∞`, finite free over `S_∞ = O⟦x_1, …, x_{n²#T}, y_1, …, y_q⟧`, with the action factoring through `R_∞ = R^loc⟦X_1, …, X_g⟧` and `H_∞/𝔞 ≅ H`. Then `depth_{R_∞} H_∞ ≥ dim S_∞ = 1 + n²#T + q` while `R_∞` is equidimensional of dimension `1 + n²#T + q − [L⁺ : ℚ]n(1 − (−1)^{n−µ_𝔪})/2`; so `µ_𝔪 ≡ n mod 2` and the support of `H_∞` is a union of irreducible components. By (i) and (ii) the point of `f′` lies on exactly one component (smoothness of the crystalline generic fibre at `S_l`, the definition of `⇝` at `S_r`); that component is in the support and contains `Spec R^univ_{𝒮′}`, so `H ⊗ R^univ_{𝒮′}` is nearly faithful and, `𝕋_𝔪` being reduced, `r` factors through `𝕋_𝔪`.

*Needs:* §§1.1, 1.3, 3.4, 3.6–3.7, 4.1–4.3; LocalGaloisDeformationRings §§3.4, 3.10 (crystalline rings and the regularity of their generic fibre); GlobalGaloisDeformations §§8.1–8.4; DeformationAndDerivedPatchingAlgebra §§5.4–5.6 (patched modules, balanced patching, patching a ring and a free module), §§6.1, 6.4, 6.5 (support on top components, descent from a patched module, reduced identification).

**Checks.**

- For `n = 1` the theorem reduces to class field theory: `r` is a character of the same local type as `f′ ∘ r_𝔪`, and both are characters of the finite group of §3.9's first Check twisted by a fixed crystalline character.
- The parity `µ_𝔪 ≡ n mod 2` is forced by the depth count: for `n = 1` and `[L⁺ : ℚ] = 2` the wrong parity would make `dim R_∞` drop by `[L⁺ : ℚ]·n = 2` below `dim S_∞`, impossible for a module of depth `dim S_∞`.
- Dropping (ii) at a place `v ∈ S_r` where `(f′ ∘ r_𝔪)|G_{L_ṽ}` lies on two components (a point on the intersection of the unramified and Steinberg components, §1.2) leaves the component of `r` undetermined, and the support argument fails.

### 4.6 The ordinary `R = T` theorem with Taylor's Ihara avoidance

Keep `L`, `G`, `l` as in §4.5 and let `T = R ∪ S_l ∪ {v₁}` be places of `L⁺` split in `L`, `v₁ ∤ l`. Assume (i) `r̄_𝔪(G_{L_ṽ})` is trivial for `v ∈ R ∪ S_l`; (ii) for `v ∈ R`, `Nv ≡ 1 mod l`, and if `l^N ∥ Nv − 1` then `l^N > n` and `O` contains the `l^N`-th roots of unity; (iii) `r̄_𝔪` is unramified above `v₁` and `Nv₁ ≢ 1 mod l`; (iv) the characters `χ_{v,j} : O_{L_ṽ}^× → O^×` (`v ∈ R`) are trivial modulo `λ`. Let `U_v = G(O_{L⁺_v})` for `v ∈ S_l` and split `v ∉ T`, hyperspecial at inert `v`, `U_v = Iw(ṽ)` for `v ∈ R ∪ {v₁}`; let `𝔪` be a non-Eisenstein maximal ideal of `𝕋^{T,ord}_{{1}}(U(l^∞), O)` and `𝔪_{{χ_v}}` the corresponding ideal for the characters `χ_v` (§3.12(4)). Let `𝒮_{{χ_v}} = (L/L⁺, T, T̃, Λ, r̄_𝔪, ε^{1−n}δ^{µ_𝔪}_{L/L⁺}, {R^{χ_v}_ṽ}_{v∈R} ∪ {R^{△,ar}_{Λ_ṽ}}_{v∈S_l} ∪ {R^a_{ṽ₁}})`, with `R^{χ_v}_ṽ` classifying lifts with `char r(σ)(X) = ∏_j (X − χ_{v,j}(Art_{L_ṽ}^{−1}(σ))^{−1})` for `σ ∈ I_{L_ṽ}` (LocalGaloisDeformationRings §2.15), `R^{△,ar}_{Λ_ṽ}` Geraghty's ordinary ring for trivial residual representation (LocalGaloisDeformationRings §6.24) and `R^a_{ṽ₁}` classifying lifts with unipotent inertia. Prove that `r_{𝔪_{{χ_v}}}` (§3.13) is of type `𝒮_{{χ_v}}`; and, under adequacy as in §4.5, that if `r` is a lift of `r̄_𝔪` of type `𝒮_{{1}}` (for some `Λ`-algebra structure on `O`) unramified above `v₁`, and some `f′` has `f′ ∘ r_𝔪` unramified above `v₁`, then `r ≅ f ∘ r_𝔪` for some `f : 𝕋^{T,ord}_{{1}}(U(l^∞), O)_𝔪 → O` (Tho12, Theorem 8.6, p. 49, proof pp. 49–53; hypotheses p. 48). Moreover `µ_𝔪 ≡ n mod 2`, and for `𝒮′_{{1}}`, which replaces `R^a_{ṽ₁}` by the unramified ring, `R^univ_{𝒮′_{{1}}}` is a finite `Λ`-module (Tho12, Corollary 8.7, p. 53).

*Route.* Type: Ger19, Lemma 4.1.7 (p. 45), as in §3.13(4). Choose Taylor–Wiles data as in §4.5; the modules are Pontryagin duals of projected ordinary forms, free over `Λ[Δ_{Q_N}]` by §3.11 and §4.2. Patch simultaneously for `{1}` and for characters `χ_v` with pairwise distinct `χ_{v,j}` (they exist because `l^N > n`), over `S_∞ = Λ ⊗̂ O⟦x_1, …, x_{n²#T}⟧⟦Δ_∞⟧`, `Δ_∞ = ℤ_l^q`, with all `{χ}`- and `{1}`-objects identified modulo `λ` (§3.12(4); Ger19, Theorem 4.3.1, p. 51). The depth count gives `µ_𝔪 ≡ n mod 2` and supports that are unions of components of `Spec R_∞/Q` for every minimal prime `Q` of `Λ`. For distinct `χ_{v,j}`, `R^{χ_v}_ṽ` is irreducible (LocalGaloisDeformationRings §2.15) and `R^{△,ar}_{Λ_ṽ}/Q` is irreducible (LocalGaloisDeformationRings §6.24, after Ger19 Lemma 3.4.6), so the components of the `{χ}`-problem correspond to those of `R^a_{ṽ₁}`. Ihara avoidance: `f′` puts a component with unramified `v₁`-factor in the support for `{1}`; reducing modulo `λ`, using that for `χ = 1` every prime minimal over `λ` contains a unique minimal prime, transfers it to `{χ}` and back, so for every minimal prime `Q` of `Λ` the `{1}`-support contains every component with unramified `v₁`-factor. The support is not shown to be everything, which is why `r` must be unramified above `v₁`. Conclude by near faithfulness and reducedness of the Hecke algebra.

*Needs:* §§3.11–3.13, 4.1–4.3; LocalGaloisDeformationRings §§1.3, 1.9, 2.5, 2.15, 6.24 (character coefficient rings, ordinary flag rings, Steinberg rings, Ihara-avoidance components, trivial-residual flag rings); DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 5.8 (patching, including over `Λ`), §§6.1, 6.4, 6.7 (support, descent, generic and special components).

**Checks.**

- With `R = ∅` it is the ordinary analogue of §4.5.
- The condition `Nv₁ ≢ 1 mod l` excludes elements of order `l` from the arithmetic stabilizers at the Iwahori level `U_{v₁}`, giving the freeness of §4.2(3); a place `v₁` with `Nv₁ ≡ 1 mod l` would not.
- At `v ∈ R` with `n = 2` and characters `χ_{v,1} ≠ χ_{v,2}`, `R^{χ_v}_ṽ[1/l]` is irreducible, while `R^1_ṽ[1/l]` has the unramified and Steinberg components; this asymmetry is the whole content of the comparison modulo `λ`.

### 4.7 The `R = T` theorems under Guralnick–Herzig–Tiep adequacy

Prove that §§4.5 and 4.6 hold with the hypothesis that `r̄_𝔪(G_{L⁺(ζ_l)})` is adequate in the sense of Tho12 Definition 2.3 replaced by: `ζ_l ∉ L` and `ρ̄ = r̄_𝔪|G_L` has `ρ̄(G_{L(ζ_l)})` adequate in the sense of Tho17 Definition 2.20 (Tho17, Proposition 7.2, p. 32). When `l ∤ n` the two notions coincide for subgroups of `GL_n(k)`, so this repairs the case `L ⊂ L⁺(ζ_l)` of Thorne 2012; when `l | n` it is a new result (Tho17 §7, pp. 30–32).

*Route.* The adequacy hypothesis of Thorne 2012 is used only to invoke §4.3(a); replace it by §4.3(b) in both proofs. For `l ∤ n` the comparison of the two adequacy notions is ArithmeticGaloisRepresentations §7.9.

*Needs:* §§4.3, 4.5, 4.6; ArithmeticGaloisRepresentations §7.9.

**Checks.**

- Tho17, Corollary 7.3: Thorne 2012's Theorems 7.1 and 9.1 hold with GHT-adequacy (§§5.1, 5.5).
- For `l = n = 3`, the identity matrix has trace `3 = 0` in `𝔽₃`, so the scalar line lies in `ad⁰ = 𝔰𝔩₃` and is fixed by every subgroup `H ⊂ GL₃(𝔽₃)`: `H⁰(H, ad⁰) ≠ 0`, and Tho12 Definition 2.3 fails for every `H`. Tho17 Definition 2.20 asks instead for `H¹(H, ad/scalars) = 0` and the trace condition, which do not involve `H⁰(H, ad⁰)`.
- When `L ⊂ L⁺(ζ_l)` only this form applies (§4.3, third Check).

### 4.8 The Ihara-avoidance `R = T` theorem with a fixed potentially crystalline type at `l`

Keep `L`, `G`, `l` odd and the adequacy hypotheses of §4.7, with every place above `l` split in `L`. Let `T = R ∪ S_l ∪ {v₁}` as in §4.6, with, for `v ∈ R`, `r̄_𝔪|G_{L_ṽ}` trivial, `Nv ≡ 1 mod l`, and, if `l^N ∥ Nv − 1`, `l^N > n` and `O` containing the `l^N`-th roots of unity (§4.6(ii)), and with `v₁` as in §4.6. For `v ∈ S_l` fix a dominant weight `λ_ṽ` and an inertial type `τ_v` of `I_{L_ṽ}`, and let `σ(τ_v)` be an `O`-lattice in a smooth irreducible representation of `GL_n(O_{L_ṽ})` attached to `τ_v` (an inertial type for `τ_v` in the sense of SmoothRepresentationsOfLocalGroups §SR.5.2). Define the algebraic modular forms of weight `λ` and type `τ` as the forms of §3.2 with coefficient module `M_λ ⊗ ⊗_{v∈S_l} σ(τ_v)^∨` at `S_l`, Iwahori level at `R ∪ {v₁}`, and their Hecke algebra `𝕋^T_{λ,τ}(U, O)`. Let `𝒮_τ` be the polarized problem with the unipotent rings `R^1_ṽ` at `v ∈ R`, the potentially crystalline lifting ring `R^{λ_ṽ,τ_v}_ṽ` of Hodge type `λ_ṽ` and inertial type `τ_v` at `v ∈ S_l` (LocalGaloisDeformationRings §3.4), and unipotent ramification at `v₁`. Prove: for a non-Eisenstein `𝔪 ⊂ 𝕋^T_{λ,τ}(U, O)`, `r_𝔪` is of type `𝒮_τ`; and if `r` is a lift of `r̄_𝔪` of type `𝒮_τ`, unramified above `v₁`, and some `f′ : 𝕋^T_{λ,τ}(U, O)_𝔪 → O` has `f′ ∘ r_𝔪` unramified above `v₁` and `(f′ ∘ r_𝔪)|G_{L_ṽ}` on a common irreducible component of `Spec R^{λ_ṽ,τ_v}_ṽ[1/l]` with `r|G_{L_ṽ}` for every `v ∈ S_l`, then `r ≅ f ∘ r_𝔪` for some `f`. In particular, if every `R^{λ_ṽ,τ_v}_ṽ` is a domain, every lift of type `𝒮_τ` unramified above `v₁` is automorphic as soon as `𝕋^T_{λ,τ}(U, O)_𝔪 ≠ 0`. This is the `R^{red} = 𝕋` input of LLHLM23, Theorem 9.2.1 (whose proof refers to the proof of LLHLM20, Proposition 6.0.2, pp. 98–99), and it combines the component condition at `l` of §4.5 with Taylor's Ihara avoidance at `R` of §4.6.

*Route.* The coefficient module is a finite free `O`-module with a continuous action of the level at `l`, so §§3.2–3.4, 3.6–3.7 apply with it (AutomorphicFormsOnReductiveGroups §7.4 allows arbitrary such coefficients); constituents with nonzero forms of type `τ` have Galois representations potentially crystalline of type `τ_v` and Hodge type `λ_ṽ` at `v ∈ S_l` by local–global compatibility at `l` and the inertial local Langlands correspondence for `σ(τ_v)`. Patch exactly as in §4.6 at fixed weight and type, simultaneously for the unipotent rings and for the rings `R^{χ_v}_ṽ` with pairwise distinct characters at `R`, which exist because `l^N > n` there; the local rings at `S_l` enter only through their components, and the comparison modulo `λ` at `R` is Taylor's argument of §4.6. The support of the `{1}`-patched module then contains every component whose `S_l`-factors are those through `f′ ∘ r_𝔪` and whose `v₁`-factor is unramified, which gives the conclusion; when the local rings at `S_l` are domains there is a single factor at each `v ∈ S_l`.

*Needs:* §§3.2–3.4, 3.6–3.7, 4.1–4.3, 4.5–4.7; AutomorphicFormsOnReductiveGroups §7.4 (forms with arbitrary continuous coefficient action); SmoothRepresentationsOfLocalGroups §SR.5.2 (types); LocalGaloisDeformationRings §§2.5, 2.15, 3.4, 3.9 (unipotent and Ihara-avoidance rings, potentially semistable rings of fixed type and their dimension); AutomorphicGaloisRepresentationsPartII AG2.6 (full polarized local–global compatibility at `l`); DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 6.1, 6.4–6.5, 6.7.

**Checks.**

- For trivial `τ_v` and `R = ∅` the statement is §4.5 with `σ(τ_v) = O`, except that §4.5 also allows the strong-connection condition at places of `S_r` where the residual representation is ramified.
- If `R^{λ_ṽ,τ_v}_ṽ[1/l]` has several components, the conclusion is claimed only for lifts on the components through `f′ ∘ r_𝔪`. In rank two with `τ_v` trivial and Hodge–Tate weights `{0, 1}`, a trivial residual representation over `L_ṽ ∋ ζ_l` with ramification index larger than `l − 1` can have both ordinary and nonordinary Barsotti–Tate components, and ordinary status is constant on components (LocalGaloisDeformationRings §4.14): an automorphic ordinary point says nothing about a nonordinary lift. (Over `ℚ_l` with `l` odd the trivial residual representation has no such lift at all, since the determinant would reduce to the nontrivial `ω`.)
- The type lattice enters dually: a normalization with `σ(τ_v)` instead of `σ(τ_v)^∨` would give Galois representations of type `τ_v^∨`; for `n = 1` and `τ_v` a character `θ` of `O_{L_ṽ}^×`, forms with coefficients `θ^{−1}` have Galois characters whose inertial restriction is `θ ∘ Art^{−1}`.
- For `l = 5`, `n = 6` and `v ∈ R` with `Nv = 11`: `5 ∥ Nv − 1` and `5 < 6`, and the `5`-part of `k(ṽ)^×` has order `5`, so there are only five characters `χ_{v,j}` trivial modulo `λ` and no six pairwise distinct ones; the condition `l^N > n` excludes this place. With `Nv = 251` (`250 = 2·5³`), `5³ = 125 > 6` and the place is allowed.

### Examples

- The minimal and ordinary theorems with `n = 1` reduce to class field theory (§§4.5–4.6).
- For `d_ṽ = 1` the level structures are those of Clozel–Harris–Taylor §3.4 and Geraghty §4.2 (§4.2).
- `F = F⁺(ζ_l)` is the case in which only the GHT form of adequacy can be used (§§4.3, 4.7).

### Dependencies

Layer 1 (§§1.1–1.3), Layer 3 (§§3.2–3.4, 3.6–3.7, 3.11–3.13); GlobalGaloisDeformations §§8.1–8.4; LocalGaloisDeformationRings §§1.3, 1.9, 1.14, 2.5, 2.15, 2.23, 3.4, 3.9–3.10, 4.14, 6.24, 8.7, §F.3.1; DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 5.8, 6.1, 6.4–6.5, 6.7; ArithmeticGaloisRepresentations §7.9; ArithmeticGaloisDuality §§R02.4.2–R02.4.3, R02.5.1; AutomorphicFormsOnReductiveGroups §7.4; AutomorphicGaloisRepresentationsPartII AG2.6; EndoscopicTransferAndUnitaryTraceComparison §§10.23, 10.30; SmoothRepresentationsOfLocalGroups §§SR.1, SR.2.3, SR.3.4, SR.5.2; Chebotarev Layer 10.

## Layer 5: Minimal and ordinary automorphy lifting and finiteness with adequate and relaxed-adequate image

This layer turns the `R = T` theorems of Layer 4 into the automorphy lifting and finiteness theorems for residually irreducible polarized representations with adequate image: Thorne's minimal lifting theorem, the `2`-adic lifting theorem of Thorne 2017 with strong residual oddness, the relaxation of adequacy used by Boxer–Calegari–Gee with ordinary automorphy lifting and ordinary finiteness in that relaxed form, Thorne's finiteness theorem for fixed components, characteristic-zero lifts from finiteness and the dimension bound, and the extension of finiteness to places not split in `F`. BLGGT14's forms of the minimal and ordinary theorems with adequate image (Theorems 2.3.1–2.3.2 and 2.4.1–2.4.2) are ModularityAndLanglandsExtensions §2.2. In each theorem below, adequacy may be taken in either sense of §4.7 (Tho17, Corollary 7.3, p. 32), and §5.4 relaxes it further. Polarized pairs, automorphy and its refinements are §0.3, with the full-multiplier convention of the Conventions.

### 5.1 Minimal automorphy lifting with adequate residual image

Let `F` be imaginary CM, `l` odd with `ζ_l ∉ F`, `O` the integers of a finite extension of `ℚ_l` with residue field `k`, `ρ : G_F → GL_n(O)` and `µ : G_{F⁺} → O^×` continuous (the Hecke multiplier of Thorne 2012), with (i) `ρ^c ≅ ρ^∨ε^{1−n}µ|G_F`; (ii) `µ(c_v)` independent of `v | ∞`; (iii) `ρ` ramified at finitely many places; (iv) `ρ̄` absolutely irreducible and `ρ̄(G_{F(ζ_l)})` adequate; (v) a RAECSDC `(π, χ)` of `GL_n(𝔸_F)` of level potentially prime to `l`, with a lattice `ρ′` in `r_{l,ι}(π)` and `µ′` with `µ′ ⊗ Q̄_l = r_{l,ι}(χ)`, `(ρ̄′, µ̄′) = (ρ̄, µ̄)`, such that for every `v ∤ l` either `π_v` and `ρ|G_{F_v}` are both unramified or `ρ′|G_{F_v} ⇝ ρ|G_{F_v}`, and `ρ′|G_{F_v} ∼ ρ|G_{F_v}` for every `v | l`. Prove that the polarized pair `(ρ, ε^{1−n}µ)` is automorphic in the sense of §0.3, through some RAECSDC `(π₁, χ₁)` with `ρ ⊗ Q̄_l ≅ r_{l,ι}(π₁)` and `µ = r_{l,ι}(χ₁)`; and if moreover `π` is unramified above `l` and `ρ` is crystalline above `l`, `π₁` can be taken unramified above `l` (Tho12, Theorem 7.1). BLGGT14's form of this theorem (Theorem 2.3.1, pp. 38–39), with connection at every finite place and the full multiplier, is ModularityAndLanglandsExtensions §2.2(1).

*Route.* Twist (§§0.8, 0.11) to reduce to the Hecke multiplier `µ = δ^n_{F/F⁺}`. Make a soluble base change `L/F` (PotentialAutomorphyInfrastructure §2.5), linearly disjoint from `F̄^{ker ρ̄}(ζ_l)` so that adequacy is preserved, with `L/L⁺` unramified at finite places, the ramification set split, `ρ` crystalline and `π_L` of level prime to `l` above `l`. Descend `π_L` to the definite unitary group (§3.5), take the maximal ideal at a level with an auxiliary place making the stabilizers trivial, and apply §4.5 with §4.7; at `v ∤ l` the strong connection gives the component condition, at `v | l` the connection. Descend by §0.9; the level-prime-to-`l` statement follows by choosing `L` in which the places above `l` split completely.

*Needs:* §§0.3, 0.8–0.9, 0.11, 1.1–1.3, 3.5, 4.5, 4.7; PotentialAutomorphyInfrastructure §2.5.

**Checks.**

- For `n = 1` the theorem is class field theory: an algebraic character with the residual reduction and local types of an algebraic Hecke character is itself the character of an algebraic Hecke character.
- For a cuspidal seed, `π_v` is generic at every `v ∤ l`, so by §1.3 its local point lies on a unique component and `r_{l,ι}(π)|G_{F_v} ∼ r|G_{F_v}` upgrades to `⇝`; this is how BLGGT14's form follows from Thorne's. An unramified point with Frobenius eigenvalue ratio `q_v` (on two components, §1.2) never occurs as a seed: its `π_v` would be the non-generic unramified subquotient of a reducible principal series.
- BCG25, proof of Theorem 3.1 (p. 10), cites "[Tho17, Thm. 7.1]", which does not exist; the intended result is this theorem in the form of Tho17 Corollary 7.3 (`ζ_l ∉ F` holds there) or §5.3, and under §5.4 both are available.

### 5.2 Strong residual oddness at a real place (`p = 2`)

Let `k` be a perfect field of characteristic `2`, `n` even, `F` imaginary CM and `(ρ̄, µ̄)` a polarized pair with `ρ̄ : G_F → GL_n(k)` absolutely irreducible, so that `ρ̄` extends to `r̄ : G_{F⁺} → 𝒢_n(k)` with `ν ∘ r̄ = µ̄`, unique up to `𝒢_n⁰(k)`-conjugacy (Tho17, Lemmas 2.1–2.2, pp. 5–6). For an infinite place `v` of `F⁺` with complex conjugation `c_v`, `r̄(c_v) = (A, 1)j` with `A` symmetric, and `r̄(c_v)` is `GL_n(k)`-conjugate to exactly one of `(1_n, 1)j` and `(Ψ_n, 1)j`, according as the symmetric form `A` is not or is alternating (Tho17, Lemma 2.16, p. 11; `Ψ_n` is the standard alternating matrix). Define `(ρ̄, µ̄)` to be *strongly residually odd at `v`* if `r̄(c_v)` is `GL_n(k)`-conjugate to `(1_n, 1)j` (Tho17, Definition 3.3, p. 16). Prove that this does not depend on the extension `r̄` or on the chosen conjugate of `c_v`, and that if `r : G_{F⁺} → 𝒢_n(O)` lifts `r̄` with `ρ̄` absolutely irreducible and `(ρ̄, µ̄)` is strongly residually odd at `v`, then `ν(r(c_v)) = −1` (Tho17, Lemma 3.4, p. 16).

*Route.* `r̄(c_v)² = 1` forces `A` symmetric; conjugation by `g ∈ GL_n(k)` replaces `A` by `gA ᵗg`, and conjugation by `(1, λ)` replaces it by `λ^{−1}A`; whether `A` is alternating is invariant under both, and over a perfect field of characteristic `2` a nondegenerate symmetric form of even rank is isometric to `1_n` or `Ψ_n`. `Ψ_n` admits skew-symmetric lifts to `GL_n(W(k))` and `1_n` does not, which gives the sign of any lift.

*Needs:* ArithmeticGaloisRepresentations §7.4 (`𝒢_n`, polarized representations, the oddness of a similitude-valued representation); AutomorphicGaloisRepresentationsPartII AG2.0 (polarized pairs).

**API.**

- Strong residual oddness at `v` depends neither on the extension `r̄` with the given multiplier nor on the conjugate of `c_v`; absolute irreducibility of `ρ̄` is what makes the extension unique up to `𝒢_n⁰(k)`.
- For `n` even, `r̄(c_v)` is conjugate to exactly one of `(1_n, 1)j` and `(Ψ_n, 1)j`; for `n` odd a nondegenerate symmetric form is never alternating and `r̄(c_v)` is conjugate to `(1_n, 1)j`.
- A lift of a strongly residually odd pair has multiplier `−1` at `c_v`.
- For `σ : G_{F⁺} → GL₂(k)` with `σ|G_F` absolutely irreducible, `ψ` with `ψψ^c = det σ` and `ρ̄ = σ|G_F ⊗ ψ^{−1}`, the pair `(ρ̄, ε̄^{−1})` is polarized and strongly residually odd at `v` if and only if `σ(c_v) ≠ 1` (Tho17, Lemma 3.5, p. 16).

**Checks.**

- `n = 2`, `k = 𝔽₂`, `σ(G_F) = GL₂(𝔽₂)`, `ψ = 1` and `σ(c_v) = (1 1; 0 1)`: `A = σ(c_v)J^{−1} = (1 1; 1 0)` is symmetric and not alternating (its diagonal is not zero), so the pair is strongly residually odd at `v`.
- With `σ(c_v) = 1`: `A = J^{−1} = Ψ₂` is alternating, and the pair is not strongly residually odd at `v`; a definition by "`A` symmetric" alone would accept it.
- In characteristic `2`, `ε̄ = 1`, so the condition `ψψ^c = ε̄ det σ` reads `ψψ^c = det σ`; with the cyclotomic character omitted in characteristic `0` the multiplier of the lift would be off by `ε`.

### 5.3 Automorphy lifting for every prime `p`, including `p = 2` and `p | n`

Let `n ≥ 2`, `F` imaginary CM, `p` any prime, `ι : Q̄_p ≅ ℂ` and `ρ : G_F → GL_n(Q̄_p)` continuous with (i) `ρ^c ≅ ρ^∨ε^{1−n}`; (ii) `ρ̄(G_{F(ζ_p)})` GHT-adequate; (iii) `ρ` almost everywhere unramified; (iv) a RACSDC `π` with `r̄_ι(π) ≅ ρ̄` and `r_ι(π)|G_{F_v} ∼ ρ|G_{F_v}` at every finite place (automatic where both are unramified); (v) if `p = 2` and `n` is even, `(ρ̄, ε^{1−n}δ^n_{F/F⁺})` strongly residually odd at some `v | ∞`. Prove that `ρ ≅ r_ι(Π)` for a RACSDC `Π` (Tho17, Theorem 5.1, p. 23). No hypothesis `ζ_p ∉ F` is needed.

*Route.* Replace `F` by `F(ζ_p)` (`p` odd) or `F(√−1)` (`p = 2`) by §0.9: for `p` odd adequacy is already about `G_{F(ζ_p)}`; for `p = 2` an adequate group has no subgroup of index `2`, so `ρ̄(G_{F(√−1)}) = ρ̄(G_F)`. Choose a further soluble `L/F` with `L/L⁺` everywhere unramified, `ρ̄(G_L) = ρ̄(G_F)`, the places above `p` split over `L⁺` with `ρ` crystalline there, and unipotent ramification, Iwahori-fixed vectors and splitting elsewhere; descend `π_L` (§3.5). Run §4.5 with the Taylor–Wiles data of §4.4, for the problem with crystalline rings above `p`, maximal reduced `p`-torsion-free rings at the other places and all liftings at the infinite places (Tho17, Theorem 4.2 and Corollary 4.3, pp. 20–22). Representability holds for every `p` because lifts are `𝒢_n`-valued with fixed multiplier, taken up to the kernel of `𝒢_n(R) → 𝒢_n(k)`, whose quotient by a central `GL_1` acts freely (Tho17, Lemma 2.8). The infinite places contribute tangent dimension `n(n+1)/2` and, for `p = 2` and `n` even, use (v).

*Needs:* §§0.9, 1.1, 3.5, 4.4–4.5, 5.2; ArithmeticGaloisRepresentations §7.9; GlobalGaloisDeformations §§8.1–8.4, with the `p = 2` extension recorded as a supplier gap; LocalGaloisDeformationRings §§1.14, 8.7, with the `𝒢_n`-valued archimedean ring at `p = 2` recorded as a supplier gap.

**Checks.**

- Tho17, Theorem 6.1 (p. 24): a variant of Kisin's `2`-adic modularity lifting for `GL₂` over totally real fields, trading Kisin's hypothesis above `2` for one at an infinite place, obtained by applying this theorem with `n = 4`.
- For `p = 2`, `n = 2` and `σ(c_v) = 1` at every infinite place (§5.2, second Check), hypothesis (v) fails and the theorem says nothing; this is Dickinson's condition in the form of §4.4.
- For `p | n` with `p` odd, Tho12 adequacy never holds (§4.7, second Check), so this theorem with GHT-adequacy is the only available form.

### 5.4 Adequacy relaxed to the vanishing of `H¹(H, ad)`

Define a finite subgroup `H ⊂ GL_n(k)`, `k` containing the eigenvalues of its elements, to be *relaxed-adequate* if `H¹(H, k) = 0`, `H¹(H, ad) = 0`, and every simple `k[H]`-submodule `W ⊂ ad` has `tr e_{σ,α}W ≠ 0` for some semisimple `σ ∈ H` and eigenvalue `α ∈ k`: this is Tho17 Definition 2.20 (ArithmeticGaloisRepresentations §7.9, Guralnick–Herzig–Tiep adequacy) with `H¹(H, ad₀) = 0` weakened to `H¹(H, ad) = 0`. Given `H¹(H, k) = 0`, the exact sequence `H¹(H, k) → H¹(H, ad) → H¹(H, ad₀)` shows that GHT-adequate implies relaxed-adequate. Prove that §§4.3(b), 4.4, 4.7, 5.3 and, in its GHT form, 5.1 hold with relaxed-adequate in place of adequate; §§5.5–5.7, which use adequacy only through §4.7, state their relaxed forms with this section as input. Boxer–Calegari–Gee assert this relaxation in the proof of Theorem 3.1 (BCG25, p. 10), giving as reason only that the proof of Tho17 Proposition 2.21 uses the weaker condition; their finiteness input goes through Tho17 Proposition 7.2, which rests on Proposition 7.1, so the complete argument checks both.

*Route.* Every use of adequacy in Tho17, Propositions 2.21 and 7.1 (pp. 14–15, 31–32) is one of: (1) `H` has no quotient of order `p`, i.e. `H¹(H, k) = 0`; (2) `H` acts absolutely irreducibly, a consequence of the trace condition; (3) `H¹(H, ad) = 0` (in Proposition 2.21 only for the image of `H` in `PGL_n`); (4) the trace condition on simple submodules of `ad`. Theorem 4.2, Corollary 4.3 and the proof of Theorem 5.1 use adequacy only through Proposition 2.21, absolute irreducibility and, for `p = 2`, (1) when passing to `F(√−1)`; Proposition 7.2 and Corollary 7.3 only through Proposition 7.1. The condition `H¹(H, ad₀) = 0` is never used on its own.

*Needs:* §§4.3–4.4, 4.7, 5.1, 5.3; ArithmeticGaloisRepresentations §7.9.

**API.**

- GHT-adequate implies relaxed-adequate.
- For `p ∤ n`, `ad = k ⊕ ad⁰` and `ad₀ ≅ ad⁰`, so given `H¹(H, k) = 0` the two conditions coincide, and both agree with Tho12 Definition 2.3.
- The Taylor–Wiles existence theorems §§4.3(b) and 4.4 hold for relaxed-adequate images.

**Checks.**

- For `p ∤ n` the relaxation changes nothing (API); for `n = 2`, `p = 2` and `H = SL₂(𝔽₄)`, `ad = M₂(𝔽₄)` contains the scalars `k·1 ⊂ ad⁰`, and `H¹(H, ad)` and `H¹(H, ad₀)` are compared through `H¹(H, k) = 0`: the sequence `0 = H¹(H, k) → H¹(H, ad) → H¹(H, ad₀)` shows that GHT-adequacy of `SL₂(𝔽₄)` (ArithmeticGaloisRepresentations §7.9, Checks) implies relaxed adequacy.
- The trivial group in rank `n ≥ 2` is not relaxed-adequate: `H¹(1, k) = 0` and `H¹(1, ad) = 0`, but `ad` is a sum of trivial lines and the trace condition fails for the trace-zero lines (`tr(e_{1,1}W) = tr W = 0`).
- BCG25 assert that the reduction of `Ind_{G_M}^{G_F}(θ ⊗ ρ|G_F)` has relaxed-adequate image on `G_{F(ζ_p)}` by the argument of Barnet-Lamb–Gee–Geraghty's Lemma A.3.1; that lemma is the adequacy criterion for induced representations of ArithmeticGaloisRepresentations §7.9, and the claim is used as theirs.

### 5.5 Ordinary automorphy lifting with relaxed-adequate image

Let `F` be CM or totally real, `l` odd with `ζ_l ∉ F`, and `(r, µ)` an `n`-dimensional algebraic polarized `l`-adic representation of `G_F` with (1) `r̄` irreducible and `r̄(G_{F(ζ_l)})` relaxed-adequate (§5.4); (2) `r` ordinary at every place above `l` (§0.1); (3) `(r̄, µ̄)` ordinarily automorphic. Prove that `(r, µ)` is ordinarily automorphic, and, if `r` is crystalline (respectively potentially crystalline) at every place above `l`, ordinarily automorphic of level prime to `l` (respectively potentially prime to `l`). With `r̄(G_{F(ζ_l)})` adequate this is ModularityAndLanglandsExtensions §2.2(2) (BLGGT14, Theorem 2.4.1, pp. 39–40; for `F` imaginary, Tho12 Theorem 9.1 after Ger19 Theorem 5.3.2); adequate images are relaxed-adequate (§5.4), and adequacy enters the proof only through §4.7.

*Route.* Totally real `F` reduces to imaginary `F` by a quadratic CM base change, linearly disjoint from the field cut out by `r̄` over `F(ζ_l)`, and §0.9. For `F` imaginary, twist to the Hecke multiplier `δ^n_{F/F⁺}` (§0.8) and make soluble base changes `L/F` (PotentialAutomorphyInfrastructure §2.5), disjoint as before, so that `L/L⁺` is unramified at finite places, the places above `l` and the set `R` of other ramified places are split with `r̄` trivial there, `Nv ≡ 1 mod l` with `l^N > n` at `v ∈ R`, `π_v` has Iwahori-fixed vectors, and a split place `v₁` with `Nv₁ ≢ 1 mod l` is unramified for `r` and `π`. Apply §4.6 (with §4.7) to the descent of `π_L`: `π` gives `f′` on the `Λ`-adic ordinary Hecke algebra, `r` gives a point of type `𝒮_{{1}}` for the `Λ`-structure of its weight, and `f` factors through a classical quotient of that weight (§3.12). Descend by §0.9, `ι`-ordinarity by PotentialAutomorphyInfrastructure §3.47. Level: if `r` is crystalline above `l`, use the fixed-weight ordinary `R = T` at hyperspecial level (the second isomorphism of Ger19 Theorem 4.3.1, p. 51), and §0.5 makes the characters at `l` unramified; the potentially crystalline case follows after one more soluble base change.

*Needs:* §§0.1, 0.3, 0.5, 0.8–0.9, 3.5, 3.12, 4.6–4.7, 5.4; PotentialAutomorphyInfrastructure §§2.5, 3.44, 3.47.

**Checks.**

- BCG25, Theorem 2.1 (p. 6): applied with `F = ℚ`, `l = p`, `n = p − 1` or `p − 2` and `µ = ε^{1−n}δ^n`; the level-prime-to-`l` clause makes `π_p` unramified.
- The ordinarity hypothesis is on `r` itself: a residually ordinary, non-ordinary crystalline lift of Hodge–Tate weights `{0, 1}` (on a nonordinary Barsotti–Tate component, LocalGaloisDeformationRings §4.14) is excluded, and the theorem says nothing about it; ordinarity of `r̄` does not give ordinarity of `r`.
- For `n = 1` the conclusion is the statement that every algebraic character is ordinarily automorphic (PotentialAutomorphyInfrastructure §3.45, first Check).

### 5.6 Finiteness of polarized deformation rings for fixed components

Let `F` be imaginary CM, `l` odd with `ζ_l ∉ F`, `S` a finite set of places of `F⁺` containing those above `l`, all split in `F`, with chosen places `S̃`, and `(π, χ)` a RAECSDC representation of weight `ι_*λ`, unramified outside `S` and unramified above `l`, with `ρ̄ = r̄_{l,ι}(π)` absolutely irreducible and `ρ̄(G_{F(ζ_l)})` adequate. Let `ρ` be a lattice in `r_{l,ι}(π)`, `µ = r_{l,ι}(χ)` (Thorne's Hecke multiplier) and `r̄ : G_{F⁺} → 𝒢_n(k)` an extension of `ρ̄` with `ν ∘ r̄ = µ̄ε̄^{1−n}δ^κ_{F/F⁺}`, `κ ∈ ℤ/2`. For `v ∈ S` let `C_v` be the irreducible component of `Spec R̄^□_ṽ ⊗ Q̄_l` (`v ∤ l`) or of `Spec R^{λ,cr}_ṽ ⊗ Q̄_l` (`v | l`) containing `ρ|G_{F_ṽ}`, assumed to be the only component containing it, and let `𝒮` be the polarized problem with the corresponding component quotients (§1.1). Prove that `κ = 0` and `R^univ_𝒮` is a finite `O`-module (Tho12, Theorem 10.1, p. 55). The proof takes hyperspecial level at `l`, so `π` must be unramified above `l`. BLGGT14's version for `(π, χ)` of level potentially prime to `l` (Theorem 2.3.2, p. 39), with `C_v` at `v | l` a component of the direct limit of the crystalline rings over finite extensions, is the finiteness input of ModularityAndLanglandsExtensions §2.2. The statement here holds with `ρ̄(G_{F(ζ_l)})` relaxed-adequate (§5.4), since adequacy enters only through §§4.5 and 4.7.

*Route.* Twist to `χ = δ^n_{F/F⁺}`; choose a soluble CM `L/F` disjoint from the field cut out by `ρ̄` over `F(ζ_l)`, with `L/L⁺` unramified at finite places and `S` split completely in `L⁺`. Let `𝒮^L` be the problem over `L` with the induced components and the unramified ring at an auxiliary place `v₁`. Restriction makes `R^univ_𝒮` finite over `R^univ_{𝒮^L}` (GlobalGaloisDeformations §4.2; BLGGT14, Lemma 1.2.3(1)). Descend `π_L` (§3.5), choose `v₁` split, unramified for `π`, with residue characteristic prime to the orders of the finite-order elements of `G(L⁺)`, and apply §4.5 with its Corollary 6.9: the multiplier of `𝒮^L` is `ε^{1−n}δ^{κ+n}_{L/L⁺}`, so `µ_𝔪 = κ + n` and `µ_𝔪 ≡ n mod 2` gives `κ = 0`.

*Needs:* §§1.1, 3.5, 4.5, 4.7, 5.4; PotentialAutomorphyInfrastructure §2.5; GlobalGaloisDeformations §§4.1–4.2, 8.1–8.2.

**Checks.**

- BCG25 use this theorem (cited as Tho12 Theorem 10.1 with Tho17 Proposition 7.2) for the finiteness of `R_F` in Theorem 3.1.
- `κ = 1` is impossible for `n = 1`: after twisting the Hecke multiplier to `δ_{F/F⁺}`, `κ = 1` gives `ν = δ·δ = 1` and `ν(c_v) = 1`, so the pairing on the line would satisfy `⟨x, y⟩ = −⟨y, x⟩`, forcing it to vanish in characteristic `≠ 2`; with `κ = 0`, `ν(c_v) = δ(c_v) = −1` and the pairing is symmetric.
- The uniqueness of the component through `ρ|G_{F_ṽ}` is needed: through a point on two components (§1.2, second Check) the problem `𝒮` is not defined by this recipe.

### 5.7 Finiteness of ordinary polarized deformation rings with relaxed-adequate image

Let `F` be imaginary CM, `l` odd with `ζ_l ∉ F`, `S` as in §5.6, and `(π, χ)` an `ι`-ordinary RAECSDC representation unramified outside `S` with `r̄_{l,ι}(π)(G_{F(ζ_l)})` relaxed-adequate (§5.4). Let `µ : G_{F⁺} → Q̄_l^×` be an algebraic character with `µ̄ = r̄_{l,ι}(χ)ε̄_l^{1−n}` (the full multiplier) and `HT_τ(µ) = {w}`, and for each `τ` let `H_τ` be a set of `n` distinct integers with `H_{τ∘c} = {w − h : h ∈ H_τ}`. Let `𝒮` be the problem with multiplier `µ`, all lifts at `v ∤ l` and, at `v | l`, lifts factoring through the semistable ordinary ring of Hodge type `{H_τ}` (LocalGaloisDeformationRings §3.13). Prove that `R^univ_𝒮` is a finitely generated `O`-module. With adequate image this is BLGGT14, Theorem 2.4.2 (p. 40), the ordinary finiteness input of ModularityAndLanglandsExtensions §2.2; Tho12, Theorem 10.2 (p. 56), is its form in the Hecke-multiplier convention with the conclusion `κ = 0`, generalizing Gee–Geraghty's Corollary 4.3.3. The weights `H_τ` need not be those of `π`. Adequacy enters the proof only through §§4.6–4.7.

*Route.* Twist to `χ = δ^n_{F/F⁺}` and choose soluble CM extensions over which the hypotheses of §4.6 hold: `S` splits completely, `π` is unramified outside the places above `S` with Iwahori-fixed vectors, `r̄` is trivial at the places above `S`, `Nv ≡ 1 mod l` with `l^N > n` away from `l`, every lift is unipotently ramified there, and an auxiliary `v₁` gives level without `l`-torsion. Restriction gives a finite map to `R^univ_𝒮` from the ring of the problem with unipotent rings away from `l`, semistable ordinary rings of weight `λ_M` at `l` (a union of components of the semistable ring, of dimension `1 + n² + [M_ṽ : ℚ_l]n(n−1)/2`; LocalGaloisDeformationRings §§3.13, 6.12) and the unramified ring at `v₁`. That ring is a quotient of the `Λ`-adic ring of §4.6's `𝒮′_{{1}}` modulo the arithmetic prime of weight `λ_M`, finite over `Λ` by §4.6.

*Needs:* §§3.12, 4.6–4.7, 5.4, 5.6; LocalGaloisDeformationRings §§3.13, 6.12; GlobalGaloisDeformations §4.2; PotentialAutomorphyInfrastructure §3.44.

**Checks.**

- BCG25, proof of Theorem 2.1: `R_F` is a quotient of this ring for `S = {p}` (cited there as Tho12 Theorem 10.1), hence finite over `O`.
- The relation `H_{τc} = w − H_τ` is forced by the polarization: for `n = 2`, `H_τ = {0, 1}` and `w = 1` give `H_{τc} = {1, 0}`; with `w = 2` they would give `{2, 1}`, incompatible with a pairing of multiplier of weight `1`.
- The relaxation matters only when `l | n`: for `l ∤ n` relaxed adequacy, GHT-adequacy and Thorne's adequacy agree (§5.4, API), and the statement is BLGGT14's.

### 5.8 Characteristic-zero lifts from finiteness and the dimension bound

Let `l` be odd, `O` the integers of a finite extension of `ℚ_l` with residue field `𝔽`, `F` imaginary CM with every place of `F⁺` above `l` split in `F`, `S` a finite set of places of `F⁺` split in `F` containing those above `l`, `r̄ : G_{F⁺} → 𝒢_n(𝔽)` unramified outside `S` with `r̄⁻¹(𝒢_n⁰(𝔽)) = G_F` and `r̄|G_F` absolutely irreducible, `µ` a de Rham lift of `ν ∘ r̄` with `HT_τ(µ) = {w}`, `H_τ` multisets of `n` integers with `H_{τ∘c} = {w − h}`, and `𝒮` the problem with `D_v` given by a nonempty set of components of `Spec R^□_ṽ[1/l]` for `v ∤ l` and by a nonempty finite set of components of the potentially semistable rings of Hodge type `{H_τ}` for `v | l` (§1.1). Prove: if `µ(c_v) = −1` for all `v | ∞`, each `H_τ` has `n` distinct elements and `H⁰(G_{F⁺,S}, ad r̄(1)) = 0`, then `R^univ_𝒮` has Krull dimension at least `1` (BLGGT14, Proposition 1.5.1, from Clozel–Harris–Taylor's Proposition 2.2.9 and Corollary 2.3.5); and if moreover `R^univ_𝒮` is a finite `O`-module, there is a lift `r : G_{F⁺} → 𝒢_n(O_{Q̄_l})` of `r̄` of type `𝒮`. The vanishing of `H⁰` is not printed in BLGGT14 and is needed; it holds when `r̄|G_{F(ζ_l)}` is absolutely irreducible and `ζ_l ∉ F` (BG19, paragraph before Corollary 5.1.1 and Corollary 5.1.1, pp. 38–39).

*Route.* GlobalGaloisDeformations §8.4 gives `dim R^univ_𝒮 ≥ 1 + Σ_{v∈S}(dim R_v − n² − 1) − h⁰(G_{F⁺,S}, ad r̄(1)) − Σ_{v|∞} n(n + µ(c_v))/2`. With `dim R_v = 1 + n² + [F_ṽ : ℚ_l]n(n−1)/2` at `v | l` (regular Hodge type; LocalGaloisDeformationRings §3.9), `dim R_v = 1 + n²` at `v ∤ l` (§1.3(2)) and `µ(c_v) = −1`, the right side is `1 − h⁰`. If `r̄|G_{F(ζ_l)}` is absolutely irreducible, the `G_{F(ζ_l)}`-invariants of `ad r̄(1)` are the scalars, on which `G_{F⁺}` acts through `ε̄δ_{F/F⁺}`, nontrivial exactly when `ζ_l ∉ F`. A finite `O`-algebra of Krull dimension at least one has a characteristic-zero point (DeformationAndDerivedPatchingAlgebra §4.2), continuous because the topology is `l`-adic; it is defined over a finite extension of the coefficient field.

*Needs:* §§1.1, 1.3; GlobalGaloisDeformations §§8.2, 8.4; LocalGaloisDeformationRings §§3.4, 3.9; DeformationAndDerivedPatchingAlgebra §§4.1–4.2.

**Checks.**

- BLGGT14, Proposition 3.2.1 (pp. 45–48; ModularityAndLanglandsExtensions §2.15) obtains its lift exactly this way, with finiteness from BLGGT14 Theorem 2.4.2 over an auxiliary field and BLGGT14 Lemma 1.2.3.
- When `F = F⁺(ζ_l)` the scalar matrices give `H⁰(G_{F⁺,S}, ad r̄(1)) ≠ 0` and the bound reads `dim ≥ 0`, which gives no point: for `n = 1`, `F = ℚ(ζ_3)` and `l = 3`, `ad r̄(1) = 𝔽₃(1)` is invariant under `G_{ℚ}` acting through `ω·δ_{F/ℚ} = 1`.
- For `n = 1`, `S = {v | l}` and `H_τ = {h_τ}`, the bound is `1 + Σ_{v|l}[F_ṽ : ℚ_l]·0 − 0 − Σ_{v|∞}(1 − 1)/2 = 1`, and the point is a crystalline conjugate-self-dual character with the prescribed weights.

### 5.9 Finiteness and characteristic-zero lifts with places not split in `F`

Keep the hypotheses of §5.6 (respectively §5.8) except that `S` may contain places of `F⁺` inert or ramified in `F`, the places above `l` remaining split. At a place `v ∈ S` not split in `F`, the local condition is a nonempty set of irreducible components of the generic fibre of the `𝒢_n`-valued lifting ring of `r̄|G_{F⁺_v}` with fixed multiplier (LocalGaloisDeformationRings §2.28); for the finiteness statement it is the unique component through `r_{l,ι}(π)|G_{F⁺_v}`. Prove that `R^univ_𝒮` is a finite `O`-module, and that under the hypotheses of §5.8 it has Krull dimension at least one, hence a characteristic-zero point (BG19, Proposition 4.2.6 and Corollary 5.1.1, pp. 36–39, for the dimension bound without the splitting condition; LTXZZ, proof of Theorem 4.2.6, uses both statements with nonsplit places of `S`).

*Route.* Choose a soluble CM extension `L/F`, linearly disjoint from the field cut out by `r̄` over `F(ζ_l)`, such that for every place `w` of `L⁺` above a nonsplit `v ∈ S` the completion `L⁺_w` contains `F_v` (PotentialAutomorphyInfrastructure §2.5, with prescribed local extensions); then every place above `S` splits in `L`. `π_L` is cuspidal, hence generic everywhere, so `r_{l,ι}(π_L)|G_{L_w}` is a smooth point at `w ∤ l` (§1.3) and lies on a unique component; at `w | l` the crystalline generic fibre is regular. Restriction is a morphism of generic fibres, so the irreducible `C_v` maps into the unique component through the restricted automorphic point. Hence the restriction map `R^univ_{𝒮^L} → R^univ_𝒮` makes `R^univ_𝒮` finite over the ring of a split problem of §5.6, which is finite over `O`. The dimension bound is GlobalGaloisDeformations §8.4's bound for `𝒢_n`-valued local conditions at nonsplit places, with the local dimensions of LocalGaloisDeformationRings §2.28 (`dim G^der` plus one for fixed multiplier) and the archimedean term as in §5.8.

*Needs:* §§1.1, 1.3, 5.6, 5.8; PotentialAutomorphyInfrastructure §2.5; LocalGaloisDeformationRings §§2.28, 3.11 (`G`-valued generic fibres away from `p` and `G`-valued potentially semistable rings); GlobalGaloisDeformations §§4.2, 8.1–8.4, with polarized problems at nonsplit places recorded as a supplier gap in the contracts.

**Checks.**

- If every place of `S` splits in `F`, the statement is §§5.6 and 5.8.
- For `v` inert in `F/F⁺` and `L⁺_w ⊇ F_v`, the place `w` splits in `L = L⁺F`: `L_w = L⁺_w ⊗_{F⁺_v} F_v ≅ L⁺_w × L⁺_w`. Without the local prescription `L⁺_w ⊇ F_v` the place stays inert and the reduction to §5.6 fails.
- For `n = 1` the fixed-multiplier `𝒢_1`-valued lifting ring at an inert place has framed generic fibre of dimension `1 = n²` (LocalGaloisDeformationRings §2.28: `dim G^der = 0` plus the free determinant direction), the same as at a split place; the bound of §5.8 is unchanged in rank one.

### Examples

- `n = 1`: every theorem of this layer reduces to class field theory for conjugate self-dual characters.
- The `2`-adic theorem with `n = 4` gives a `GL₂` lifting theorem over totally real fields under a hypothesis at an infinite place (§5.3).
- The finiteness theorems feed the Khare–Wintenberger construction of lifts with prescribed local behaviour (§5.8; ModularityAndLanglandsExtensions §2.15).

### Dependencies

Layers 0, 1, 3 and 4 (§§0.1, 0.3, 0.5, 0.8–0.9, 0.11, 1.1–1.3, 3.5, 3.12, 4.4–4.7); PotentialAutomorphyInfrastructure §§2.5, 3.44, 3.47; GlobalGaloisDeformations §§4.1–4.2, 8.1–8.4; LocalGaloisDeformationRings §§1.14, 2.28, 3.4, 3.9, 3.11, 3.13, 6.12, 8.7; DeformationAndDerivedPatchingAlgebra §§4.1–4.2; ArithmeticGaloisRepresentations §§7.4, 7.9; AutomorphicGaloisRepresentationsPartII AG2.0.

## Layer 6: Potential ordinary automorphy with prescribed Steinberg places

Potential ordinary automorphy of symplectic residual representations over totally real fields (BLGGT14, Theorem 3.1.2) is ModularityAndLanglandsExtensions §2.14. This layer states the refinement used by the residually reducible applications of Layer 8: the automorphic witnesses can be chosen self-dual and Steinberg at every place above the coefficient prime and above a prescribed finite set of places. The geometric input is the self-dual Dwork family of PotentialAutomorphyDworkMotivesPartII, through the exact supplier contract above; the automorphic conclusion uses ordinary automorphy lifting (ModularityAndLanglandsExtensions §2.2(2)).

### 6.1 Potential ordinary automorphy with Steinberg places above a prescribed set

Let `F/F₀` be a finite Galois extension of totally real fields, `I` a finite set, and for each `i ∈ I` let `n_i` be a positive even integer, `l_i` an odd prime, `ι_i : Q̄_{l_i} ≅ ℂ` and `r̄_i : G_F → GSp_{n_i}(F̄_{l_i})` a representation with open kernel and multiplier `ε̄_{l_i}^{1−n_i}`; let `F^{(avoid)}/F` be finite Galois and `Σ` a finite set of finite places of `F`. Prove that there are a finite totally real extension `F′/F` and, for each `i`, a regular algebraic cuspidal polarized `(π_i, 1)` of `GL_{n_i}(𝔸_{F′})` such that (1) `F′/F₀` is Galois; (2) `F′` is linearly disjoint from `F^{(avoid)}` over `F`; (3) `(r̄_{l_i,ι_i}(π_i), ε̄_{l_i}^{1−n_i}) ≅ ((r̄_i|G_{F′})^{ss}, ε̄_{l_i}^{1−n_i})`; (4) `π_i` has weight `0` and is `ι_i`-ordinary; (5) `π_{i,w}` is an unramified twist of the Steinberg representation at every place `w` of `F′` above `l_i` or above `Σ`. With an unrestricted polarization character and without (5) this is ModularityAndLanglandsExtensions §2.14 (BLGGT14, Theorem 3.1.2, pp. 41–44). The last paragraph of BLGGT14's proof gives the trivial polarization character and (5) above `l_i`, and NT21, proof of Theorem 5.2 (pp. 68–69), obtains (5) above `Σ` by adding the condition `v(t(P)) < 0` at the places above `Σ` to the local conditions of that proof. No irreducibility of `r̄_i` is assumed; since `r̄_{l,ι}(π)` denotes a semisimplified reduction, (3) reads `r̄_{l_i,ι_i}(π_i) ≅ r̄_i|G_{F′}` when `r̄_i` is semisimple, which holds in every use.

*Route.* Choose `N` odd, prime to `∏l_i` and to the residue characteristics of `Σ`, with `N > n_i + 1`, divisible by no prime ramified in `F^{(avoid)}`, such that the finite field of definition of each `r̄_i` embeds in `ℤ[ζ_N]⁺/λ_i` for a prime `λ_i | l_i` (PotentialAutomorphyDworkMotivesPartII §1.1). For each `i` choose an imaginary CM field `M_i` cyclic of degree `n_i` over `ℚ`, a prime `q` split in every `M_i`, and an algebraic Hecke character `φ_i` of `M_i` with infinity type of exponents `0, …, n_i − 1` and `φ_iφ_i^c = ∏_{v∤∞}|·|_v^{1−n_i}`, ramified above `q` with order divisible by `q` (§0.11; PotentialAutomorphyInfrastructure §2.5); choose `l′` split completely in the field generated by the `M_i`, `ζ_N` and the values of the `φ_i`, prime to `6qN∏l_in_i` and to the residue characteristics of `Σ`, and unramified in `F`. Then `r′_i = Ind_{G_{M_i}}^{G_ℚ} θ_i` (`θ_i` the `l′`-adic character of `φ_i`) has multiplier `ε_{l′}^{1−n_i}`, residual image adequate on `G_{ℚ(ζ_{l′})}` and unchanged over `F(ζ_{Nl′})` (ArithmeticGaloisRepresentations §7.9). The symplectic switch PotentialAutomorphyDworkMotivesPartII §9.4, applied with the finite set `Σ` and an avoidance field containing `F^{(avoid)}·F̄^{∩ker r̄′_i}(ζ_{Nl′})`, gives a totally real `F′`, Galois over `F₀` and linearly disjoint from that field over `F`, and parameters `t_i` with symplectic identifications of the residual representations of the Dwork fibres with `r̄_i|G_{F′}` and `r̄′_i|G_{F′}`, `v(t_i) < 0` at the places above `l_i` and above `Σ`, and `v(t_i) > 0` at the places above `l′`. Over `F′`, `(r′_i|G_{F′}, ε_{l′}^{1−n_i})` is automorphic by automorphic induction (EndoscopicTransferAndUnitaryTraceComparison §6.26) and ordinary above `l′`, hence ordinarily automorphic (§0.5); ordinary automorphy lifting (ModularityAndLanglandsExtensions §2.2(2)) applied to the `l′`-adic realization of the fibre at `t_i`, ordinary of weight `0` above `l′` by PotentialAutomorphyDworkMotivesPartII §7.8, gives `(π_i, 1)` of weight `0`. At the places above `l_i` and above `Σ`, PotentialAutomorphyDworkMotivesPartII §7.10 and local–global compatibility (AutomorphicGaloisRepresentationsPartII AG2.6) make `π_{i,w}` an unramified twist of Steinberg, so `π_i` is `ι_i`-ordinary (§0.6); compatibility of the system (PotentialAutomorphyDworkMotivesPartII §6.8) gives (3).

*Needs:* §§0.5–0.6, 0.11; ModularityAndLanglandsExtensions §2.2 (ordinary automorphy lifting) and §2.14 (the statement without (5)); PotentialAutomorphyDworkMotivesPartII §§1.1, 6.8, 7.8, 7.10, 9.4; PotentialAutomorphyInfrastructure §2.5; EndoscopicTransferAndUnitaryTraceComparison §6.26 (cyclic automorphic induction); ArithmeticGaloisRepresentations §7.9; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 (local–global compatibility).

**Checks.**

- For `I` a singleton, `n = 2` and `Σ = ∅`, the statement is potential modularity in ordinary form: a representation `G_F → GL₂(F̄_l)` with determinant `ε̄_l^{−1}` becomes, over a totally real Galois extension, the semisimplified reduction of the representation of an `ι`-ordinary Hilbert modular form of parallel weight `2` (weight `0` in the present normalization), Steinberg at the places above `l`.
- The multiplier must be `ε̄^{1−n_i}`: for `n_i = 2` a residual `r̄` of determinant `ε̄^{−1}·ψ` with `ψ` nontrivial of finite order is not of this form, and twisting to remove `ψ` needs a square root of `ψ`, available only after a further extension.
- Condition (5) above `Σ` is not automatic: at a place `v` prime to `N` a parameter `t` with `v(t) ≥ 0` and `t^N − 1` a unit gives a fibre with good reduction, hence an unramified local representation (PotentialAutomorphyDworkMotivesPartII §7.10(1)); the condition `v(t) < 0` is what produces maximal unipotent monodromy, and NT21, proof of Theorem 5.2, needs the Steinberg places above its set `Σ` to apply §8.7.

### Examples

- Potential modularity of a mod `l` representation with determinant `ε̄^{−1}` over a totally real field, with an `ι`-ordinary parallel weight two witness that is Steinberg above `l` and above a prescribed finite set of places (§6.1).
- The doubled representation of a sum of characters in NT21 §5 is made residually automorphic with Steinberg places above the auxiliary set `Σ` (§§6.1, 8.9).

### Dependencies

Layer 0 (§§0.5–0.6, 0.11); ModularityAndLanglandsExtensions §§2.2, 2.14; PotentialAutomorphyDworkMotivesPartII §§1.1, 6.8, 7.8, 7.10, 9.4; PotentialAutomorphyInfrastructure §2.5; EndoscopicTransferAndUnitaryTraceComparison §6.26; ArithmeticGaloisRepresentations §7.9; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6.

## Layer 7: Residually reducible deformation rings: primitivity, pseudodeformations and generic primes

This layer develops the commutative algebra and Galois theory behind automorphy lifting for residually reducible representations. It defines weak and strong primitivity and proves the comparisons between them used by the applications (sums of characters, small rank, image invariance, splitting coefficient fields); it proves finiteness of restriction for pseudodeformation rings, constructs the split and determinant reducibility ideals and bounds the reducible locus in the presence of Steinberg places; it defines generic primes, shows that large quotients contain them and that absolute irreducibility at a generic prime survives restriction; and it proves the generic `R_𝔭 = T_𝔭` theorem of Thorne 2015 and Allen–Newton–Thorne with the weak primitivity of the sources, through a selfdual midpoint lattice that turns the semisimplified induction of a reduction into an actual induction, for any number of Schur constituents and with `S(B)` allowed empty; under strong primitivity a shorter route avoids that lattice. The Schur condition and the determinant subring `P_𝒮` are Layer 2; the connectedness dimension and arithmetic rank, with the bound `c(R/I) ≥ c(R) − r(I) − 1`, are DeformationAndDerivedPatchingAlgebra §6.6; partition reducibility ideals of determinants are IntegralHeckeAndGaloisDeterminants §1.4.

Notation. In this layer `A = k⟦T⟧` and `E = Frac A` denote the equal-characteristic rings at a generic prime, not the `l`-adic coefficient field. The arithmetic set-up of ANT20 §4 is `T = S_l ⊔ R ⊔ S(B) ⊔ S_a`. Tho15 writes `q` both for a prime and for the number of Taylor–Wiles primes; the number is `q_TW` here.

### 7.1 Weakly and strongly primitive representations

Let `Γ` be a profinite group, `k` a field and `ρ̄ : Γ → GL_n(k)` continuous. Define `ρ̄` to be *weakly primitive* if it is not isomorphic to `Ind_{Γ′}^Γ σ̄` for any proper open subgroup `Γ′ ⊂ Γ` and continuous `σ̄ : Γ′ → GL_{n/[Γ:Γ′]}(k)` (the sources' "primitive": NT21 §5; ANT20, Theorem 1.1(7); Tho15, Theorem 7.1(5)); and *strongly primitive* if `ρ̄` is semisimple and is not isomorphic to the semisimplification of `Ind_{Γ′}^Γ τ̄` for any proper open `Γ′` and any continuous `τ̄`. Induction from open subgroups is ArithmeticGaloisRepresentations §1.3. Both notions depend on `k`: the two-dimensional representation of `S₃` is strongly primitive over `𝔽₅` and induced over `𝔽₂₅` (§7.15). For the residual representation of a `Q̄_l`-valued representation the hypotheses below are imposed over `F̄_l`, and then hold over every subfield on which the representation is defined; for coefficients in a finite extension of `ℚ_l` they are imposed over the residue field `k`.

*Needs:* ArithmeticGaloisRepresentations §§1.3 (induction from open subgroups and Frobenius reciprocity), 1.8 (Brauer–Nesbitt).

**API.**

- Strong primitivity implies weak primitivity: if a semisimple `ρ̄` were `Ind_{Γ′}^Γ σ̄`, it would be its own semisimplification.
- Every one-dimensional `ρ̄` is weakly and strongly primitive.
- `Ind_{Γ′}^Γ σ̄` with `[Γ : Γ′] > 1` is not weakly primitive.
- A sum of characters with pairwise ratios of order greater than `n` is weakly primitive (§7.2); for semisimple `ρ̄` of rank `0 < n < char k` the two notions agree (§7.3).
- Weak primitivity depends only on the image (§7.14); strong primitivity depends only on the image when `char k ∤ n` (§7.4).

**Checks.**

- For `k = 𝔽₇`, `n = 2` and characters `χ₁, χ₂` with `χ₁/χ₂` of order `3 > 2`, `χ₁ ⊕ χ₂` is weakly primitive (§7.2), and strongly primitive since `2 < 7` (§7.3).
- For `n = 2` and `χ₁/χ₂ = η` of order `2` with kernel `Γ′`, `χ₁ ⊕ χ₂ ≅ Ind_{Γ′}^Γ(χ₁|Γ′)` is not weakly primitive, so the order bound of §7.2 is sharp at `2 = n`.
- Over `k = 𝔽₂`, the trivial two-dimensional representation of `C₂` is weakly primitive (the only proper subgroup is trivial, and `Ind_1^{C₂} k = k[C₂]` is an indecomposable Jordan block, not `k ⊕ k`) but not strongly primitive (the semisimplification of `k[C₂]` is `k ⊕ k`). This distinguishes the notions; it does not satisfy the multiplicity-free Schur hypotheses of the lifting theorems.

### 7.2 Sums of characters with large ratios are primitive

Let `ρ̄ = χ₁ ⊕ ⋯ ⊕ χ_n` with continuous characters `χ_i : Γ → k^×` such that `χ_i/χ_j` has order greater than `n` for `i ≠ j`. Prove that `ρ̄` is weakly primitive (NT21, Lemma 5.1, p. 66).

*Route.* If `ρ̄ ≅ Ind_{Γ′}^Γ σ̄`, Frobenius reciprocity puts each `χ_i|Γ′` in `σ̄`; they are distinct, since `χ_i|Γ′ = χ_j|Γ′` would give `(χ_i/χ_j)^{[Γ:Γ′]} = 1` with `[Γ : Γ′] ≤ n`. So `dim σ̄ ≥ n` and `Γ′ = Γ`.

*Needs:* §7.1; ArithmeticGaloisRepresentations §1.3.

**Checks.**

- NT21, proof of Theorem 5.2 (p. 68): applied to the `2n`-dimensional `(ρ̄ ⊗ ψ̄) ⊕ (ρ̄^c ⊗ ψ̄^c)`, whose characters have pairwise ratios of order greater than `2n`, by hypothesis for the `χ̄_i/χ̄_j` and because a prime `q > 2n` divides the order of `ψ̄/ψ̄^c` on inertia at an auxiliary place for the mixed ratios.
- With ratio orders exactly `n` the statement fails: for `n = 3` and `χ₂ = χ₁η`, `χ₃ = χ₁η²` with `η` of order `3` and kernel `Γ′`, `ρ̄ ≅ Ind_{Γ′}^Γ(χ₁|Γ′)`.
- For `n = 1` the hypothesis is empty and every character is weakly primitive.

### 7.3 Primitivity below the characteristic

Let `k` be a discrete field of prime characteristic `p` and `ρ : Γ → GL_n(k)` continuous and semisimple with `0 < n < p`. Prove that `ρ` is weakly primitive if and only if it is strongly primitive. This comparison is not stated in the sources; it lets the character applications of Layer 8 use either form, and in NT21's Theorem 5.2 it applies to the doubled representation of rank `2n < p` and to every residual character block.

*Route.* Suppose `ρ` is the semisimplification of `Ind_H^Γ τ`, `H` proper open, `d = [Γ : H]`, `m = dim τ`; then `n = dm` and `1 < d ≤ n < p`. The normal core `N` of `H` has `Γ/N ↪ S_d`, so `[Γ : N]` divides `d!` and is invertible in `k`. Replacing `τ` by its semisimplification keeps the semisimplified induction; Clifford theory makes `τ^{ss}|N` semisimple, and Mackey makes `(Ind_H^Γ τ^{ss})|N` semisimple; averaging an `N`-linear projection onto a `Γ`-submodule over `Γ/N` makes it `Γ`-linear, so `Ind_H^Γ τ^{ss}` is semisimple and isomorphic to `ρ`, contradicting weak primitivity.

*Needs:* §7.1; ArithmeticGaloisRepresentations §§1.3 (Mackey decomposition), 1.12 (Clifford theory).

**Checks.**

- The `𝔽₇` rank-two example of §7.1 is strongly primitive.
- The `𝔽₂` rank-two trivial representation of `C₂` is weakly but not strongly primitive and has `n = 2 = p`: the strict bound `n < p` is needed.
- For `n = 1 < p` both notions hold for every character.

### 7.4 Strong primitivity depends on the residual image in rank prime to `p`

Let `k` be a discrete field of prime characteristic `p` and `ρ : Γ → GL_n(k)` continuous and semisimple with `p ∤ n`. Prove that if `Γ₁ ⊂ Γ` is open with `ρ(Γ₁) = ρ(Γ)`, then `ρ|Γ₁` is strongly primitive if and only if `ρ` is; more precisely, semisimplified induction giving `ρ` can be tested in the finite image `ρ(Γ)`. This does not identify weak and strong primitivity for arbitrary `n` prime to `p`. The sources use the corresponding step for their primitivity without proof (Tho15, proof of Theorem 7.1, p. 67; ANT20, Lemma 5.2 and its proof, p. 16); this target is its form for strong primitivity, which they do not state.

*Route.* Let `N = ker ρ`. If `ρ` is the semisimplification of `Ind_H^Γ τ`, in a basis adapted to a composition series `N` acts through upper triangular unipotent matrices, a finite `p`-group. `N` permutes the summands of `Ind_H^Γ τ` indexed by `Γ/H` in orbits of equal size (it is normal and `Γ` is transitive), a power of `p`; as `[Γ : H]` divides `n` and is prime to `p`, the orbits are points and `N ⊂ H`. Then `τ^{ss}` factors through `H/N` and the induction descends to `Γ/N`; conversely inflate. Apply this to `Γ` and `Γ₁`, which have the same finite image. The good extensions of §8.1 preserve the residual image by their disjointness condition, so with `l ∤ n` they preserve strong primitivity.

*Needs:* §7.1; ArithmeticGaloisRepresentations §§1.3, 1.12.

**Checks.**

- Let `p = 5`, `n = 2` and `ρ : Γ → GL₂(𝔽₂₅)` with image `S₃` acting by the standard representation. Then `ρ ≅ Ind` from the preimage of `C₃` of a character of order `3` (which exists over `𝔽₂₅`), so `ρ` is not strongly primitive, and for every `Γ₁` with `ρ(Γ₁) = S₃` the same holds for `ρ|Γ₁`; the decision is made in `S₃`. Over `𝔽₅` the same image gives a strongly primitive `ρ` and `ρ|Γ₁` (§7.15, first Check).
- The characteristic-two rank-two `C₂` example of §7.1 has `p | n` and is outside the statement.
- Image equality is essential: restricting the standard `S₃` representation to `C₃` changes the image and the answer (§7.14, Checks).

### 7.5 Restriction of pseudodeformations to a finite-index subgroup is finite

Let `Γ` be profinite satisfying Mazur's condition `Φ_p` (every open subgroup has finitely many continuous homomorphisms to `ℤ/p`; LocalGaloisDeformationRings §§F.2.1–F.2.2, which give it for `G_{F,S}`), `Σ ⊂ Γ` a closed subgroup of finite index, and `t̄` a continuous determinant of `Γ` of dimension `n` over the finite field `k`. Let `Q_t̄` and `Q_{t̄|Σ}` be the pseudodeformation rings classifying continuous determinants lifting `t̄` and `t̄|Σ` (LocalGaloisDeformationRings §F.2.11). Prove that the map `Q_{t̄|Σ} → Q_t̄` classifying restriction to `Σ` is finite (NT21, Lemma 5.3, p. 70, stated there for topologically finitely generated `Γ`; Che14, Lemma 3.8 and Proposition 3.7 extend it to `Φ_p`). GlobalGaloisDeformations §4.2 proves the corresponding statement for deformation rings of representations; this is the determinant form.

*Route.* Both rings are Noetherian under `Φ_p`; by complete Nakayama it suffices that `Q_t̄/(m_{Q_{t̄|Σ}})` is Artinian. Otherwise take a dimension-one prime, with residue ring `A` a one-dimensional complete local domain over `k` and determinant `t_A` whose restriction to `Σ` is constant. With `N = [Γ : Σ]`, `γ^{N!} ∈ Σ` for every `γ`; writing the characteristic polynomial of `γ` under `t_A` as `∏(X − α_i)`, that of `γ^{N!}` is `∏(X − α_i^{N!})` with coefficients in `k` (Che14, Theorem 2.12), so each `α_i`, hence each coefficient, is algebraic over `k` and lies in `k`. By Che14, Corollary 1.14, `t_A` is defined over `k`, a contradiction.

*Needs:* LocalGaloisDeformationRings §§F.2.1–F.2.2, F.2.11; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5 (determinants and their characteristic coefficients).

**Checks.**

- NT21, proof of Theorem 5.2 (p. 69): finiteness of `Q_{t̄₂|G_L}/(ϖ) → Q_{t̄₂|G_F}/(ϖ)`, used to pass finiteness over `Λ` from the `2n`-dimensional problem over `L` back to the original ring.
- For `Σ = Γ` the map is the identity.
- For `n = 1`, `Q_t̄ = O⟦Γ^{ab}(p)⟧` (the completed group algebra of the maximal abelian pro-`p` quotient) and the map from `O⟦Σ^{ab}(p)⟧` is finite because the image of `Σ^{ab}(p)` has finite index in `Γ^{ab}(p)`.

### 7.6 Split deformation ideals and determinant reducibility ideals

Construct the following. (a) (Tho15 §3.5, Definition 3.31, Proposition 3.32, Lemma 3.33, pp. 26–27.) Let `𝒮` be a polarized problem with `r̄` Schur and `r̄|G_{F,S} = ρ̄₁ ⊕ ρ̄₂`, `ρ̄_i` absolutely irreducible, and `r̄_i` the `𝒢_{n_i}`-valued extensions given by the diagonal blocks of `r̄(c)`. A deformation of `r̄` is *reducible* if its class contains a lifting `r₁ ⊕ r₂` with `r_i` lifting `r̄_i`. Prove that reducible deformations form a closed subfunctor represented by `R^univ_𝒮/I_split`, and that a dimension-one prime `𝔭 ⊅ I_split` has `r_𝔭|G_{F,S} ⊗ Frac` absolutely irreducible. (b) (ANT20 §§2, 3.2, Lemmas 3.4–3.5, p. 10.) Let `r̄` be Schur with `r̄|G_{F,S} = ⊕_{i=1}^d ρ̄_i` and `D^univ = det ∘ r^univ|G_{F,S}`, valued in `P_𝒮` (§2.2). For a partition `𝒫` of `{1, …, d}` let `I_𝒫 ⊂ P_𝒮` be the partition reducibility ideal of `D^univ` (IntegralHeckeAndGaloisDeterminants §1.4), and put `I^red_𝒮 = ∏ I_{(𝒫₁,𝒫₂)}`, the product over partitions into two nonempty blocks (the unit ideal when `d = 1`). Prove: for every prime `𝔭 ⊂ R^univ_𝒮` with `𝔮 = 𝔭 ∩ P_𝒮`, `r_𝔭|G_{F,S} ⊗ Frac(R^univ_𝒮/𝔭)` is absolutely irreducible if and only if `I^red_𝒮 ⊄ 𝔮`; and if it is not, `r_𝔭` is strictly equivalent to a type-`𝒮` lifting `r₁ ⊕ r₂` with `r_i : G_{F⁺,S} → 𝒢_{m_i}(R^univ_𝒮/𝔭)`, `m₁m₂ ≠ 0`. (c) The sources claim no equality of `I_split` with `I^red_𝒮R^univ_𝒮`; for `d = 2` they have the same radical. The image in `P_𝒮` of the partition ideal of the restricted universal determinant to an open `Σ` (with the `ρ̄_i|Σ` absolutely irreducible and pairwise non-isomorphic) lies in `I_𝒫`, by the formula `I_𝒫 = Σ A_{ij}A_{ji}` and base change of determinants.

*Route.* (a) Relative representability reduces to the fibre-product condition for Artinian rings, which holds because a conjugation `≡ 1` between two split liftings is block diagonal; over a discrete valuation ring a lifting with reducible generic fibre is strictly equivalent to `r₁ ⊕ r₂`. (b) If `I^red ⊂ 𝔮`, some `I_{(𝒫₁,𝒫₂)} ⊂ 𝔮`, the determinant over `R^univ/𝔭` factors (IntegralHeckeAndGaloisDeterminants §1.4) and `ρ_𝔭` is not absolutely irreducible (Che14, Corollary 2.13). Conversely a proper invariant subspace forces, after permuting blocks, `E_{ij} = 0` for `i > s ≥ j` in the generalized matrix algebra, so the corresponding `I_𝒫` vanishes in the domain. Conjugate self-duality gives the opposite blocks vanishing too, and the Schur property makes the two summands orthogonal.

*Needs:* §§2.1–2.2; IntegralHeckeAndGaloisDeterminants §§1.1–1.4 (Cayley–Hamilton algebras, generalized matrix algebras, partition reducibility ideals); GlobalGaloisDeformations §§8.1–8.2.

**API.**

- `I_split ⊂ R^univ_𝒮` represents the split polarized subfunctor for a two-block residual decomposition.
- `I^red_𝒮 ⊂ P_𝒮` is the product of the partition ideals over nontrivial two-block partitions; for an `R^univ_𝒮`-algebra `A`, the extension `I^red_𝒮 A` is used in dimension bounds.
- A prime has absolutely irreducible generic representation exactly when it does not contain `I^red_𝒮` (on `P_𝒮`).
- Restriction to an open subgroup preserving the absolute irreducibility and distinctness of the constituents maps the partition ideals into the corresponding ones.

**Checks.**

- For `d = 1`, `I^red_𝒮 = P_𝒮`: every prime has absolutely irreducible `ρ_𝔭`.
- For `n = 2` and `r̄|G_F = χ̄₁ ⊕ χ̄₂`, `I^red_𝒮 = A₁₂A₂₁`, generated by products `b·c` of off-diagonal entries of the generalized matrix algebra; vanishing of the product does not force each off-diagonal block to vanish (an upper triangular lifting has `c = 0`, `b ≠ 0`).
- An allowed polarized split lift factors through `R^univ/I_split`, and its determinant annihilates `I^red_𝒮`; these two assertions concern different rings. A characteristic-zero absolutely irreducible point does not annihilate `I^red_𝒮`.

### 7.7 The reducible locus is small in the presence of Steinberg places

Let `S = S_l ⊔ S(B) ⊔ R ⊔ S_a` with `q_v ≡ 1 mod l` and `r̄|G_{F_ṽ}` trivial for `v ∈ S(B) ∪ R`, and `q_v ≢ 1 mod l`, `r̄|G_{F_ṽ}` unramified with scalar Frobenius for `v ∈ S_a`; let `𝒮` have ordinary conditions at `S_l`, Steinberg at `S(B)`, unipotent ramification at `R` and unrestricted conditions at `S_a`, with `r̄` Schur (ANT20 §3.3). Let `Δ` be the Galois group of the maximal abelian pro-`l` extension of `F` unramified outside `l`, `Δ₀` its quotient for the maximal subextension in which every place of `S(B)` splits completely, `d₀ = dim_{ℚ_l} ker(Δ[1/l] → Δ₀[1/l])^{c=−1}` (the `ℤ_l`-rank of the subgroup of `Δ/(c + 1)` generated by the `Frob_ṽ`, `v ∈ S(B)`), and `d_l = inf_{v∈S_l}[F⁺_v : ℚ_l]`. Prove: if `d_l > n(n − 1)/2 + 1`, `A ∈ C_Λ` is a finite `Λ`-algebra and `r : G_{F⁺,S} → 𝒢_n(A)` is of type `𝒮`, then `dim A/(I^red_𝒮A, λ) ≤ n[F⁺ : ℚ] − d₀` (ANT20, Lemma 3.6, p. 11). ModularityAndLanglandsExtensions §4.2 owns this bound for the single Steinberg place `v₀` of the lifting theorem; the form here, for a set `S(B)` of Steinberg places with the rank `d₀` and an arbitrary finite `Λ`-algebra `A`, is what §§7.9, 8.5 and 8.12 use.

*Route.* Reduce to `A` a domain killed by `λ` on which `I^red_𝒮` vanishes; by §7.6, `r = r₁ ⊕ r₂` with `n₁n₂ ≠ 0`. At `v ∈ S_l` the ordinary flag (Tho15, Corollary 3.12; LocalGaloisDeformationRings §§1.9, 6.12) induces flags on `r₁`, `r₂`, a shuffle `σ_v` and isomorphisms `Λ_{v,1} ⊗̂ Λ_{v,2} ≅ Λ_v`, with each `r_i` ordinary for the induced structure. The characters `χ_i = χ̄_i^{−1} det r_i|G_F` are unramified outside `l` (the determinants of these local problems are unramified away from `l`) and define `k⟦Δ/(c+1)⟧ ⊗̂ k⟦Δ/(c+1)⟧ → A`. At `v ∈ S(B)` the Steinberg condition gives `χ₁(Frob_ṽ)^{n₂} = χ₂(Frob_ṽ)^{n₁}`, so the map factors through `k⟦E⟧`, `E` the quotient of `(Δ/(c+1))²` by the `(n₂Frob_ṽ, −n₁Frob_ṽ)`, of rank `2 rk(Δ/(c+1)) − d₀`; so `Λ → A` factors through a ring of dimension `n[F⁺ : ℚ] − d₀`, and finiteness gives the bound.

*Needs:* §7.6; LocalGaloisDeformationRings §§1.3, 1.9, 2.5, 2.26, 6.12; ClassFieldTheory Layer 12.

**Checks.**

- With `S(B) = ∅`, `d₀ = 0` and the bound is `dim Λ/(λ) = n[F⁺ : ℚ]`, no improvement.
- ANT20, proof of Theorem 6.1: for `L = F·M₀·M₁` with `M₀/F⁺` cyclic of odd degree `δ`, `d₀ = 2δ`.
- For `n = 2` and `n₁ = n₂ = 1` the Steinberg relation reads `χ₁(Frob_ṽ) = χ₂(Frob_ṽ)`, one relation per place of `S(B)`.

### 7.8 Generic primes of an ordinary deformation ring

Let `𝒮` have ordinary conditions at `S_l` (ANT20 §3.3), `A ∈ C_Λ` and `r : G_{F⁺,S} → 𝒢_n(A)` of type `𝒮`; for `v ∈ S_l` write `ψ^v_1, …, ψ^v_n : I^{ab}_{F_ṽ}(l) → A^×` for the push-forwards of the universal characters of `Λ_v` (LocalGaloisDeformationRings §1.3). Define `r` to be *generic at `l`* if (i) for each `v ∈ S_l` the `ψ^v_i` are pairwise distinct, and (ii) for some `v ∈ S_l` and `σ ∈ I^{ab}_{F_ṽ}(l)` the elements `ψ^v_1(σ), …, ψ^v_n(σ)` satisfy no nontrivial multiplicative relation `∏_i ψ^v_i(σ)^{a_i} = 1`, `a ∈ ℤⁿ − {0}`; and *generic* if moreover `A` is a domain and `r|G_F ⊗_A Frac(A)` is absolutely irreducible (ANT20, Definition 3.7, p. 12). A prime `𝔭 ⊂ R^univ_𝒮` of dimension one and characteristic `l` is a *generic prime* if `r_𝔭 = r^univ mod 𝔭` is generic (NT21 §5; NT26, Proposition 3.10; Tho15 §6 for two constituents). The definition imposes no condition on `dim A` or `char A`; dimension one and characteristic `l` are imposed where the notion is used.

*Needs:* LocalGaloisDeformationRings §§1.3, 1.9; §7.6.

**API.**

- At a generic prime the universal characters at each `v ∈ S_l` are pairwise distinct modulo `𝔭`.
- There is a countable family of ideals `I_i ⊂ Λ/(λ)` with `dim Λ/I_i ≤ n[F⁺ : ℚ] − d_l` such that every type-`𝒮` lifting over an `A` killed by `λ` that is not generic at `l` satisfies `I_iA = 0` for some `i` (§7.9(1)).
- If `r_𝔭` is generic at `l` and `[F_ṽ : ℚ_l] > n(n − 1)/2 + 1`, a lift `σ̃ ∈ I_{F_ṽ}` of the witness `σ` has `r_𝔭(σ̃)` regular semisimple over the fraction field with independent eigenvalues `ψ^v_i(σ)` (the ordinary flag); this is hypothesis (4) of Tho15 §5.2, used in §7.13.

**Checks.**

- Over `A = k` every `ψ^v_i` is trivial (`I^{ab}_{F_ṽ}(l)` is pro-`l` and `k^×` has order prime to `l`), so the closed point is never generic at `l`.
- For `n = 2`, `A = k⟦T₁, T₂⟧`, `ψ₁(σ) = 1 + T₁`, `ψ₂(σ) = 1 + T₂`: `(1 + T₁)^a(1 + T₂)^b = 1` forces `a = b = 0`, so `σ` is a witness; with `ψ₂(σ) = 1` the relation `ψ₂(σ)¹ = 1` shows `σ` is not.
- For `n = 1` condition (i) is empty and `r` is generic at `l` exactly when some `ψ^v_1(σ)` has infinite order; over a domain of characteristic `l` a finite-order value in `1 + m_A` is `1`.

### 7.9 Large quotients contain generic primes

Prove: (1) (ANT20, Lemma 3.8, p. 12) in the set-up of §7.7 there is a countable family of ideals `I_i ⊂ Λ/(λ)` with `dim Λ/I_i ≤ n[F⁺ : ℚ] − d_l` such that for every `A ∈ C_Λ` with `λA = 0` and every lifting `r` of type `𝒮` not generic at `l`, `I_iA = 0` for some `i`. ANT20 states this for all `A ∈ C_Λ`; since the `I_i` are ideals of `Λ/(λ)` it is meaningful only for `A` killed by `λ`, which is how it is used. (2) (Tho15, Lemma 1.9, p. 8) If `R` is a complete Noetherian local `k`-algebra with residue field `k` of dimension `d ≥ 1` and `I₁, I₂, …` are countably many ideals with `dim R/I_i ≤ d − 1`, there is a prime `𝔭 ⊂ R` of dimension one containing none of them. (3) (ANT20, Lemma 3.9, p. 13) If `d_l > n(n − 1)/2 + 1`, `A ∈ C_Λ` is finite over `Λ` with `dim A/(λ) > sup(n[F⁺ : ℚ] − d₀, n[F⁺ : ℚ] − d_l)` and `r` is of type `𝒮`, then `A` has a prime `𝔭` of dimension one and characteristic `l` with `r_𝔭` generic.

*Route.* (1) With `σ_{v,1}, …, σ_{v,d_v}` lifting a `ℤ_l`-basis of the torsion-free quotient of `I^{ab}_{F_ṽ}(l)`, take the ideals `(λ, ψ^v_i(σ_{v,k}) − ψ^v_j(σ_{v,k}))_k` (quotient dimension `n[F⁺ : ℚ] − d_v`) and `(λ, ∏_i ψ^v_i(σ_{v,j})^{A_{v,i,j}} − 1)_{v,j}` for integer matrices with no zero column (quotient dimension `(n − 1)[F⁺ : ℚ]`). (2) For `d ≥ 2`, Noether normalization reduces to `R = k⟦x₁, …, x_d⟧` and principal `I_i = (f_i)`; there are uncountably many pairwise non-associate primes `g ∈ m_R − m_R²` (Weierstrass preparation), choose one prime to every `f_i` and induct. (3) Apply (2) to `A/(λ)` with `I₀ = I^red_𝒮A` (bounded by §7.7) and the `I_iA` of (1); the prime is generic at `l` by (1) and absolutely irreducible by §7.6.

*Needs:* §§7.6–7.8; Mathlib `ringKrullDim`, `Ideal.minimalPrimes`; DeformationAndDerivedPatchingAlgebra §4.1 (finiteness from a residual fibre).

**Checks.**

- NT21, Theorem 5.7, and NT26, Propositions 3.10–3.11, are applications; ANT20, proof of Theorem 5.1, applies (3) twice.
- In (2) countability is needed: for `R = k⟦x, y⟧` (`d = 2`) the family of all dimension-one primes `𝔭`, each with `dim R/𝔭 = 1 = d − 1`, is uncountable (it contains `(x − f(y))` for every `f ∈ yk⟦y⟧`), and no dimension-one prime avoids it, since each contains itself.
- For `d = 1` every ideal with `dim R/I ≤ 0` is primary to the maximal ideal, so the unique dimension-one minimal prime (for a domain) works.

### 7.11 Twisting and soluble base change for residually reducible rings and Hecke algebras

Prove the following (Tho15, Lemmas 3.36, 3.38, 3.40, Corollary 4.14, Propositions 4.17–4.18, pp. 28–45).

1. Let `r̄` be Schur, `l ∤ n`, and `𝒮` a problem whose local conditions are among those of Tho15 §3.3 and for which the determinant of every type-`𝒮` lifting is unramified at the places of `S` not above `l` (true for Steinberg and unipotent conditions and for unrestricted conditions where all liftings are unramified; Tho15 does not print this restriction, and it is needed). Let `µ` be the multiplier of `𝒮`, `Δ` as in §7.7, and `d₀ : G_{F,S} → O^×` a continuous character lifting `det r̄|G_{F,S}`, unramified at the places of `S` not above `l`, with `d₀d₀^c = µ^n|G_{F,S}`; let `R^univ_{𝒮,d₀}` be the quotient with determinant `d₀`. Then there is an isomorphism `R^univ_𝒮 ≅ R^univ_{𝒮,d₀} ⊗̂_O O⟦Δ/(c + 1)⟧`, canonical once `d₀` is fixed. Such a `d₀` exists when `µ^n|G_F` is unramified at the places of `S` not above `l`: with `ψ₀` the Teichmüller lift of `det r̄|G_{F,S}`, the character `χ = µ^n|G_{F,S}·(ψ₀ψ₀^c)^{−1}` is residually trivial and `c`-invariant, and `d₀ = ψ₀χ^{1/2}`, with `χ^{1/2}` the unique residually trivial square root (`l` odd), has `d₀d₀^c = ψ₀ψ₀^cχ = µ^n`. The Teichmüller lift itself qualifies only when `ψ₀ψ₀^c = µ^n|G_F`; otherwise the fixed-`ψ₀` quotient is killed by a power of `ϖ` and the splitting fails in characteristic zero (Tho15, Lemma 3.36, prints the Teichmüller form). Modulo `ϖ` the same twisting argument gives `R^univ_𝒮/(ϖ) ≅ R^univ_{𝒮,ψ₀}/(ϖ) ⊗̂_k k⟦Δ/(c + 1)⟧` with no condition on `µ`, since `µ^n` and `ψ₀ψ₀^c` agree modulo `ϖ`; the dimension argument of §8.12 uses this characteristic-`l` form, and §8.8, whose multiplier `ε^{1−n}δ^n_{F/F⁺}` is unramified outside `l`, uses `d₀`.
2. Let `𝔭 ⊂ R^univ_𝒮` be a prime of dimension one and characteristic `l`, `A ≅ k⟦T⟧` the normalization of `R^univ_𝒮/𝔭` (after enlarging `k`), and `ψ : Δ/(c + 1) → 1 + m_A` continuous; let `𝔭_ψ`, `𝔮_ψ` be the kernels of the maps from `R^univ_𝒮`, `P_𝒮` given by `r_𝔭 ⊗ ψ`. Then (a) a minimal prime of `R^univ_𝒮` lies in `𝔭` if and only if it lies in `𝔭_ψ`; (b) `ψ` can be chosen with `Frac(P_𝒮/𝔮_ψ) = Frac(R^univ_𝒮/𝔭_ψ) = Frac A`; (c) in the setting of Tho15 §4.3, if `J_{𝒮_χ}R^univ_{𝒮_χ} ⊂ 𝔭` then `J_{𝒮_χ}R^univ_{𝒮_χ} ⊂ 𝔭_ψ`.
3. (With the erratum of ANT20 §3.1, p. 7.) For Tho15's problem (3.2), with `[F_ṽ : ℚ_l] > n(n − 1)/2 + 1` at `S_l`, `Λ → A` finite, `R^∞ = (R^loc_{𝒮,S} ⊗_Λ Λ̃)⟦x₁, …, x_{q′}⟧` and `P^∞` the kernel of `R^∞ → A`: if the `ψ^v_i mod 𝔭` are pairwise distinct at `S_l`, `r_𝔭` is unramified with scalar Frobenius in `1 + m_A` at `S(B)` and trivial at `R`, then for each minimal prime `Q ⊂ Λ`, `Spec R^∞_{P^∞}/(Q)` is irreducible of dimension `n(n + 1)[F⁺ : ℚ]/2 + n²|S| + q′` with characteristic-zero generic point when the `χ_{v,i}` are pairwise distinct, and equidimensional of that dimension with characteristic-zero generic points and a unique minimal prime above each minimal prime of the special fibre when the `χ_{v,i}` are trivial.
4. For a soluble CM `M/L`, linearly disjoint from the field cut out by `r̄_𝔪|G_{L(ζ_l)}` and split above `S_l ∪ S_a ∪ R`, restriction gives a finite map `R^univ_{𝒮_{χ,M}} → R^univ_{𝒮_χ}` and a commutative diagram `R^univ ← P → 𝕋` over `L` and over `M`; in particular `J_{𝒮_{χ,M}}P_{𝒮_χ} ⊂ J_{𝒮_χ}`.

*Route.* (1) The map classifies `r_{𝒮,d₀} ⊗ Ψ`, which has multiplier `µ` because `ΨΨ^c = 1`; its inverse uses the `n`-th root (`l ∤ n`) of the residually trivial character `det r^univ d₀^{−1}`, which is unramified outside `l` and anticyclotomic because `det r^univ (det r^univ)^c = µ^n = d₀d₀^c` (GlobalGaloisDeformations §4.4). (2a) Both primes lie on the image of `R^univ/Q → A ⊗̂ k⟦Δ/(c+1)⟧/P₀`; (2b) choose `ψ(σ)` an `n`-th root of `(1 + T)/α` for a generator; (2c) twisting is compatible with the Hecke algebra (Tho15, Proposition 4.13). (3) Twist at `S(B)` to reduce to trivial restriction; the ordinary and `S_a` factors are formally smooth at the point; connectedness and regularity of the Steinberg and Ihara-avoidance factors (LocalGaloisDeformationRings §§2.15, 2.26) with the unipotent ring replaced by its nilreduction. (4) `R^univ_{𝒮_χ}/(m_{R^univ_{𝒮_{χ,M}}})` is Artinian since characteristic polynomials take finitely many values and `R^univ` is finite over `P` (§2.2); both Hecke algebras are images of `P` in products over `ι`-ordinary RACSDC representations, compatible with soluble base change (§0.9, §3.5).

*Needs:* §§0.9, 2.2, 3.5, 3.9, 7.8; GlobalGaloisDeformations §§4.2, 4.4; LocalGaloisDeformationRings §§2.15, 2.26, F.0.1.

**Checks.**

- Tho15, proof of Theorem 7.1, and NT21, Proposition 5.6, use (1) for the two blocks to bound the reducible locus.
- (1) needs the restriction on determinants: an unrestricted condition at a place `v ∤ l` where liftings can ramify allows `det r^univ` to ramify at `v`, and then `det r^univ d₀^{−1}` is not a character of `Δ` (unramified outside `l`).
- The determinant lift must have the prescribed conjugate norm. For `n = 1`, `l = 5`, `F = ℚ(i)`, `ρ = ε₅^{−1}` and `µ = δ_{F/ℚ}ε₅^{−2}`, the Teichmüller lift `ψ₀ = ω^{−1}` has `ψ₀ψ₀^c(g) = 1` at `g ∈ G_F` with `ε₅(g) = 6`, while `µ(g) = 1/36`; since `1 − 1/36 = 35/36` has `5`-adic valuation `1`, the fixed-`ψ₀` quotient is killed by `5`, whereas `R^univ_𝒮` has the `ℤ₅`-point `ρ`. The corrected `d₀ = ψ₀χ^{1/2} = ε₅^{−1}` has `d₀d₀^c(g) = 1/36` and recovers `ρ`.
- For `n = 1`, (1) reads `R^univ_𝒮 ≅ O⟦Δ/(c+1)⟧`: deformations of a conjugate self-dual character are its twists by anticyclotomic pro-`l` characters.

### 7.12 Schur reduction detects polarized imprimitivity

Let `k` be finite of odd characteristic, `A = k⟦T⟧`, `E = k((T))`, `Γ = Δ ⋊ ⟨c⟩` profinite and `r : Γ → 𝒢_n(A)` continuous with `r⁻¹(𝒢_n⁰) = Δ`, `n > 0`, multiplier `µ` with `µ(c) = −1`, and Schur reduction `r̄`. Let `N ⊂ Δ` be open and normal in `Γ`, and suppose `ρ_E = r|Δ ⊗ E` restricts to `N` as a direct sum of `t` pairwise non-isomorphic absolutely irreducible subspaces `V_i`, permuted transitively by `Δ`. Prove that if `t > 1` then `ρ̄ = r̄|Δ` is isomorphic to an actual induction from the proper open block stabilizer `H = {δ : δV₁ = V₁}`. In particular weak primitivity of `ρ̄` forces `t = 1`. This is the deduction that turns Thorne's argument, which only gives a semisimplified induction, into an actual induction in the polarized setting; it is not stated in the sources.

*Route.* The perfect symmetric form `B` of the polarization pairs each `N`-block with exactly one `c`-dual block. Take an integral `Δ`-fixed norm `α` adapted to the blocks (stable lattices transported along `Δ/H`) and its `B`-dual `α#(v) = inf_{w≠0}(v_T(B(v, w)) − α(w))`; `(α#)# = α`, duality is affine on segments, and `α#` is `Δ`-fixed because `µ(δ)` is a unit. In the building of `GL_n` over `E` (ReductiveGroupsPartII §§RG2.2.1, RG2.2.4: norms, apartments through two points, affine segments; Sk13, Remark 3.2, p. 519, for the common splitting basis and interpolation) take the midpoint `γ` of `α` and `α#`: it is self-dual and block-adapted with weights in `(1/2)ℤ`. After the totally ramified extension `A′ = k⟦u⟧`, `T = u²` (same residue field), the zero ball of `2γ` is a `Δ`-stable selfdual lattice split across the blocks, so its reduction is an actual induction from `H`. All stable integral models have the same semisimplification (Brauer–Nesbitt), the new polarized reduction is again Schur, and Schur semisimplicity makes it isomorphic to `ρ̄`.

*Needs:* §§2.1, 7.1; ArithmeticGaloisRepresentations §§1.3, 1.6, 1.8, 7.4; ReductiveGroupsPartII §§RG2.2.1, RG2.2.4.

**Checks.**

- The coefficient extension `k⟦T⟧ → k⟦u⟧` is totally ramified with residue field `k`, so no change of residue field (and no change of primitivity) occurs.
- A decomposition must be permuted transitively to give proper induction: an invariant orthogonal sum `V₁ ⊕ V₂` with `Δ` stabilizing each `V_i` is reducibility, not imprimitivity, and weak primitivity does not exclude it.
- A residual Jordan block with repeated trivial factors fails the Schur hypothesis: for `n = 2`, `r̄|Δ = (1, ∗; 0, 1)` nonsplit, the semisimplified induction `1 ⊕ 1` is not upgraded to an actual induction, and the argument does not apply.

### 7.13 Absolute irreducibility at a generic prime survives restriction

Let `l > 3`, `k` finite of characteristic `l`, `A = k⟦T⟧`, `E = Frac A`, `F` CM, `S` split in `F` containing the places above `l`, and `r : G_{F⁺,S} → 𝒢_n(A)` with (1) `r|G_{F,S} ⊗ E` absolutely irreducible; (2) `ζ_l ∉ F`, `r̄|G_{F⁺(ζ_l)}` Schur and `r̄|G_F` weakly primitive; (3) `r̄(G_{F(ζ_l)})` without nontrivial quotient of `l`-power order; (4) `σ₀ ∈ G_{F,S}` with `r(σ₀)` regular semisimple with eigenvalues in `A^×` satisfying no nontrivial multiplicative relation; (5) `l ∤ n`; (6) `ν(r(c)) = −1`. Prove that for every open `N ⊂ G_F`, `r|N ⊗ E` is absolutely irreducible (Tho15, Proposition 5.3, p. 58, as printed). The proof does not use hypothesis (3). Consequence: if `M/L` is a finite CM extension in which every place above `l` splits and `𝔭` is a generic prime over `L` whose normalized `r_𝔭` satisfies (2)–(6), the pullback of `𝔭` over `M` is generic (Tho15, proof of Proposition 6.2; NT26 §3, p. 23); in the trivial-residual ordinary set-up of ANT20 §4.2 a generic prime stays generic after an allowed finite field restriction. Tho15's printed proof uses that `r̄|G_F` is not the semisimplification of an induction, which is strong primitivity (§7.1); with weak primitivity the argument rests on §7.12.

*Route.* Replace `N` by an open `N₀` normal in `G_{F⁺}`. A power of `σ₀` lies in `N₀`; multiplicative independence makes its eigenvalues distinct and in `E`, so every `N₀`-simple constituent is defined over `E` and absolutely irreducible, without coefficient extension. The cyclotomic index of `G_{F⁺(ζ_l)}` is prime to `l`, so semisimplicity of the restricted residual representation descends by averaging; choosing `τ` in the odd coset of the cyclotomic subgroup shows that each original constituent is individually polarized, and `r̄` is Schur. If there are `t > 1` constituents, §7.12 gives an actual residual induction, contradicting weak primitivity. For genericity, the inertial characters take values in the torsion-free group `1 + TA`, so distinct characters stay distinct on finite-index subgroups and independent values stay independent after a positive power.

*Route under strong primitivity.* If `r̄|G_F` is strongly primitive, Tho15's argument applies without §7.12. Shrink `N` to be normal in `G_F`. `r|N ⊗ E` is semisimple (Clifford) and multiplicity free (a power of `σ₀` in `N` has distinct eigenvalues). For a simple `ρ ⊂ r|N ⊗ E` with stabilizer `N′`, `r|G_F ⊗ E ≅ Ind_{N′}^{G_F} ρ` with `N′` proper if `r|N` is reducible. Reducing an `N′`-stable lattice gives a lattice whose reduction is `Ind_{N′}^{G_F}` of the reduction of `ρ`; Brauer–Nesbitt identifies `r̄|G_F` with its semisimplification, contradicting strong primitivity. Absolute irreducibility is reached without enlarging `k`: every `N`-invariant subspace over `Ē` is a sum of `E`-rational eigenlines of a power of `σ₀`. For the consequence, the inertial characters at places of `M` above `l` are those below, so genericity at `l` persists.

*Needs:* §§7.1, 7.8, 7.12 (not used by the strong-primitivity route); ArithmeticGaloisRepresentations §§1.6 (stable lattices), 1.8, 1.12.

**Checks.**

- Tho15, Proposition 6.2, and ANT20, Proposition 5.3: used to keep a prime generic after passing to a good extension (§8.1) in which the Steinberg places become scalar.
- Primitivity cannot be dropped: if `r` is induced from an index-two subgroup `G_{F′}`, then `r|G_{F′} ⊗ E` is reducible.
- Multiplicative independence, not mere regular semisimplicity, is needed: eigenvalues `1 + T` and `−(1 + T)` are distinct, but their squares coincide, so `σ₀²` does not separate eigenlines.
- No rank bound `n < l` is used; strong primitivity implies the hypothesis (§7.1), and in the range `0 < n < l` the two notions agree for semisimple representations (§7.3).
- `1 + TA` is torsion free in characteristic `l`: `(1 + Tf)^{l^m} = 1 + T^{l^m}f^{l^m}`, which is `1` only when `f = 0`; a character with values in it that is trivial on a finite-index subgroup has finite image and is trivial.

### 7.14 Weak primitivity is invariant under image-preserving restriction

Let `k` be any field, `Γ` profinite and `ρ : Γ → GL_k(V)` continuous with finite image and `0 < dim V < ∞`. Prove that for open `Γ₁ ⊂ Γ` with `ρ(Γ₁) = ρ(Γ)`, `ρ` is weakly primitive if and only if `ρ|Γ₁` is (used without proof in Tho15, proof of Theorem 7.1, p. 67, and ANT20, Lemma 5.2 and its proof, p. 16, for the residual representation over a disjoint soluble extension). There is no semisimplification and no condition on characteristic or rank.

*Route.* If `ρ ≅ Ind_H^Γ U`, the kernel `K = ker ρ` fixes every coset block, so `K ⊂ ∩_γ γHγ^{−1} ⊂ H` and acts trivially on `U`; the induction descends to the finite image `Γ/K`. Conversely inflate. Since `Γ₁` has the same image representation, apply this to `Γ` and `Γ₁`. In particular the disjoint good CM extensions of §8.1 preserve weak primitivity.

*Needs:* §7.1; ArithmeticGaloisRepresentations §1.3.

**Checks.**

- The trivial one-dimensional representation is weakly primitive in every characteristic (an induction from a proper subgroup has dimension at least the index, at least `2`).
- Image equality is essential: over an algebraically closed field of characteristic zero, the standard two-dimensional representation of `S₃` is `Ind_{C₃}^{S₃}χ`, while its restriction `χ ⊕ χ^{−1}` to `C₃` is weakly primitive, since `C₃` has no subgroup of index `2`.
- The proof uses that kernel elements act as the identity on the whole induced representation, not only on its semisimplification; for the `𝔽₂` regular `C₂`-module the kernel of the trivial representation is all of `C₂`, which does not act trivially on `k[C₂]`.

### 7.15 Weak primitivity over a splitting coefficient field

Let `k` be finite, `G` a finite group and `V` a nonzero finite-dimensional semisimple `k[G]`-module such that for every subgroup `H ⊂ G` all simple `k[H]`-modules are absolutely irreducible. Prove that for every field extension `K/k`, `V` is weakly primitive over `k` if and only if `K ⊗_k V` is weakly primitive over `K`; and that weak primitivity over `k̄` is equivalent to weak primitivity after every finite extension of `k`. A finite common splitting field for all subgroups of a finite group exists, so this is a legitimate coefficient convention to fix before testing primitivity; it cannot be imposed after assuming primitivity over a smaller field. This comparison is not stated in the sources, which test primitivity over the residue field only (ANT20, Theorem 6.2(5); Tho15, Theorem 7.1(5)).

*Route.* Scalar extension of an induction is the induction of the scalar extension. Conversely if `K ⊗ V ≅ Ind_H^G U`, then `U` is semisimple (a `G`-retraction of `Ind W ⊂ Ind U` restricts to an `H`-retraction at the identity coset), its simple summands are scalar extensions of simple `k[H]`-modules by the splitting hypothesis, and descending multiplicities gives `U₀` with `Ind_H^G U₀ ⊗ K ≅ K ⊗ V`; semisimplicity and Brauer–Nesbitt descend the isomorphism to `k`. With §7.14 the continuous profinite form reduces to this finite statement.

*Needs:* §§7.1, 7.14; ArithmeticGaloisRepresentations §§1.3, 1.8.

**Checks.**

- Over `k = 𝔽₅`, the absolutely irreducible two-dimensional standard representation of `S₃` is not induced: only `C₃` has index dividing `2`, and `𝔽₅^×` (of order `4`) has no character of order `3`. Over `𝔽₂₅` (`24` divisible by `3`) it is `Ind_{C₃}^{S₃}χ`. So coefficient invariance fails without the splitting hypothesis, even for semisimple rank `n < l`; here `𝔽₅` does not split `C₃`.
- The zero representation is excluded, so a proper induction cannot be manufactured from a zero inducing module.
- Over `𝔽₂₅`, which splits every subgroup of `S₃`, weak primitivity over `𝔽₂₅` and over `𝔽₆₂₅` agree, as the theorem predicts: the standard representation is induced over both.

### 7.16 Generic relative cotangent control for Schur deformations

Let `F/F⁺` be CM with `[F⁺ : ℚ] > 1` and `𝒮` the polarized ordinary problem of Tho15 §3.7 with a Schur residual representation having any number `d ≥ 1` of absolutely irreducible constituents and local conditions invariant under `H = µ₂^d`; put `R = R^univ_𝒮` and `P = P_𝒮 = R^H` (§2.2). Let `𝔭 ⊂ R` have dimension one and characteristic `l > 2` with absolutely irreducible generic representation, `𝔮 = 𝔭 ∩ P`, and `A` the normalization of `R/𝔭`, a complete equal-characteristic DVR. Assume `Λ → A` finite, enlarge `O` so its residue field equals that of `A`, and make the finite faithfully flat coefficient change `Λ → Λ̃` of Tho15 Proposition 3.37 (geometrically integral component rings and a surjection `Λ̃ → A`). Prove: for every fixed-order Taylor–Wiles extension `𝒮_N` and compatible primes, the `A`-module `𝔭̃_N/(𝔮̃_N + 𝔭̃_N²)` is finite of cardinality bounded independently of `N` and of the auxiliary data; and if `Frac(R/𝔭) = Frac(P/𝔮)`, the primes of `R ⊗_Λ Λ̃` above the chosen `𝔮̃` correspond to those of `R` above `𝔮`, and `P̃^∧_{𝔮̃} → R̃^∧_{𝔭̃}` is an isomorphism (Tho15, Proposition 3.37, pp. 28–30, for `d = 2`; ANT20, proof of Theorem 4.1, indicates the extension).

*Route.* `R^H = P`, generic étaleness and transitivity on primes above `𝔮` are §2.2(3). The dual relative cotangent is identified with determinant-fixed polarized square-zero deformations over `A ⊕ ε(E/A)`. For the order `B = A[ρ(G_F)] ⊂ M_n(A)`, absolute irreducibility gives `T^sM_n(A) ⊂ B`; equal determinants give zero infinitesimal trace, and the trace pairing against `T^sM_n(A)` and the matrix-unit calculation make the derivation inner after multiplying by `T^{3s}`, uniformly in the torsion level and the auxiliary primes; a cocycle factoring through `Γ/Δ` is a coboundary because `2` is invertible. After tensoring with `E` the relative cotangent vanishes; with equal fraction fields complete Nakayama gives surjectivity and finite étaleness with faithful flatness gives injectivity. These are the only places the two-block group of Tho15 is used.

*Needs:* §§2.1–2.2; GlobalGaloisDeformations §§3.6, 8.3, with the square-zero coefficient identification recorded as a supplier gap in the contracts; DeformationAndDerivedPatchingAlgebra §§1.9, 5.6 (relative cotangent and Nakayama, patching).

**Checks.**

- For `d = 2` the statements are Tho15 Proposition 3.37 with the same coefficient-change and fixed-order hypotheses.
- For `d = 3` the acting group has eight elements and acts through a quotient of order four; the Reynolds denominator `2^d` is a fixed unit, independent of `N`.
- The fraction-field equality is not automatic; it is arranged by the twist of §7.11(2) before the completed-isomorphism part is used.

### 7.17 Taylor–Wiles cotangent control with weak primitivity

Retain the set-up and the six hypotheses of §7.13, with `n ≥ 2`. Put `a = n(n − 1)[F⁺ : ℚ]/2` and take the ordinary problem of Tho15 §4.6 with `T = S`. Prove that there are `q_TW ≥ a` and `C > 0` such that for each `N ≥ 1` there are Taylor–Wiles data `Q_N` (§4.1) of cardinality `q_TW` and level `N` with: for every `m ≥ 1`, `H¹_{𝒮_N^⊥,T}(G_{F⁺,S_N}, ad r(1) ⊗_A A/T^m)` finite of cardinality at most `C`; and `H¹_{𝒮_N,T}(G_{F⁺,S_N}, ad r ⊗_A E/A) ≅ (E/A)^{q_TW − a} ⊕ T(N)` with `T(N)` finite of cardinality at most `C`. This module is `Hom_A(𝔭̃_N/(P̃^loc + 𝔭̃_N²), E/A)`, so the framed relative cotangent is `A^{q_TW − a}` plus a finite module of uniformly bounded cardinality: hypothesis (1) of Tho15 Theorem 4.19 (Tho15, Propositions 5.4, Lemmas 5.5–5.6, Corollary 5.7, pp. 59–63). A second form replaces the cyclotomic no-`l`-power-quotient hypothesis by an element `η ∈ G_F` with `ε̄_l(η) ≠ 1` and `ρ̄(η)` scalar; this is the form supplied by an auxiliary place of `S_a`.

*Route.* §7.13 supplies absolute irreducibility on every open subgroup. The equal-characteristic image theory of Tho15 (Proposition 5.1, after Pink: the projective image is open in the points of a form of `PGL_n` over a closed subfield; Lemma 5.2: uniform adjoint saturation and cohomology bounds) gives constants uniform in the cyclotomic layer and in `m`. Poitou–Tate with the framed local conditions at finite level (ArithmeticGaloisDuality §§R02.4.5a, R02.5.1) gives the Euler correction `a` and one unit per auxiliary prime; pass to the direct limit over `A/T^m`. Choose auxiliary Frobenius elements by Chebotarev whose generalized eigenprojector (ArithmeticGaloisRepresentations §7.9, over `k` when the eigenvalue lies in `k`) detects classes of high `T`-order; in the scalar-detection variant, conjugation by `η` acts trivially on `W = φ(D)/φ(K)` but by `ε̄_l(η) ≠ 1` through cocycle equivariance, so `W = 0`. Write a square-zero lifting as `(1 + εφ)r` with framings `α_v + εψ_v` to identify the cotangent on the direct union of finite square-zero modules (`A ⊕ ε(E/A)` is not an object of the coefficient category). Matlis duality over `A` identifies free cotangent summands with divisible summands.

*Needs:* §§4.1, 7.13; ArithmeticGaloisRepresentations §7.9 (eigenprojectors), with the equal-characteristic image theory recorded as a supplier gap in the contracts; ArithmeticGaloisDuality §§R02.4.5a, R02.5.1, D8.1; GlobalGaloisDeformations §§3.6, 8.3–8.4, with the square-zero identification recorded as a supplier gap; DerivedModuleAlgebra §§1.M.1–1.M.2 (Matlis duality); Chebotarev Layer 10.

**Checks.**

- The same constant bounds every `m` and `N`; an existence theorem for auxiliary primes only modulo `T` does not give this.
- The corank is `q_TW − a`, not `q_TW` and not zero.
- The scalar-detection variant needs `ε̄_l(η) ≠ 1`, not merely `η` outside some subgroup: for `η` with `ε̄_l(η) = 1` and `ρ̄(η)` scalar, conjugation by `η` acts trivially on both sides and `W` need not vanish. A Frobenius at a place of `S_a` not split in `L(ζ_l)` has `ε̄_l ≠ 1`.

### 7.18 Block-sign equivariant patched comparison

For the polarized ordinary deformation rings and Hecke modules of Tho15 §4.6, replace the two-block residual representation by a Schur representation with `d ≥ 1` constituents and `µ₂²` by `H = µ₂^d`, keeping the other hypotheses of Tho15 Theorem 4.19 (the cotangent condition of §7.17, local genericity, trivial or scalar conditions at the auxiliary places, equal residue fraction fields). Prove: patching the `P_N ⊂ R_N` diagrams and framed modules `H`-equivariantly at fixed Taylor–Wiles order gives `S_∞ → A_∞ → P̃_𝒮` and `R_∞ → B_∞ → R̃_𝒮` with `B_∞` finite over `A_∞` and `A_∞ → B_∞` of nilpotent kernel; for compatible generic primes `(A_∞)^∧_{𝔮_∞} → (B_∞)^∧_{𝔭_∞}` is surjective with nilpotent kernel; the patched ordinary module has full support after the distinct-character patching and special-fibre transfer; and the completed `P̃_𝒮`-to-Hecke map at `𝔮̃` has nilpotent kernel (Tho15, Theorem 4.19 and Lemma 4.22, pp. 47–51, for `d = 2`). No map `R^univ_𝒮 → 𝕋` is asserted.

*Route.* Patch all rings, modules and character variations simultaneously, making compact diagonal choices for every element of the fixed finite `H` (DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 5.8, with the finite-group-equivariant form recorded as a supplier gap); the identification `B_∞/𝔮_∞ ≅ R̃_𝒮/𝔮̃` is equivariant, which transports the transitivity of §2.2(3). The finite maps `P_N → R_N` are faithful with uniformly bounded generators, so the Fitting ideal vanishes in the limit and `(Ann B_∞)^r ⊂ Fitt = 0`. §7.16 makes the relative cotangent vanish after inverting `T`; complete Nakayama and transitivity give surjectivity with nilpotent kernel at every factor. For pairwise distinct characters at `R` the local generic ring is geometrically irreducible of the right dimension, so the `S_∞`-free patched module has full support (DeformationAndDerivedPatchingAlgebra §6.1); identify the character choices modulo `λ` and transfer full support to the trivial-character problem through the special fibre (§6.7 there), using the unique characteristic-zero component above each special-fibre minimal prime (LocalGaloisDeformationRings §2.15, with the completed-product statement recorded as a supplier gap). Generic reducedness of the unipotent ring is not used (ANT20 §3.1 corrects the older statement).

*Needs:* §§2.2, 3.4, 3.11, 7.16–7.17; GlobalGaloisDeformations §8.4; LocalGaloisDeformationRings §§2.15, 2.26, 6.24, F.0.1; DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 5.8, 6.1, 6.5, 6.7.

**Checks.**

- For `d = 3` all eight sign actions are patched simultaneously; transitivity is needed on the whole generic fibre, not only at the chosen prime.
- A maximal Cohen–Macaulay module supported on one of several components is not enough: full support comes from irreducibility for distinct characters and the special-fibre transfer.
- An inverse limit with unbounded numbers of generators cannot justify the Fitting step: for `B_N = A[x]/(x^N)` over `A = k`, each `B_N` is faithful over `A` with `N` generators, but the limit `k⟦x⟧` is not finite over `k`.

### 7.19 The weak-primitive generic `R = T` theorem

Set-up (ANT20 §§4.1–4.2, after Tho15 §4): `l` odd, `n ≥ 2`, `L` CM with `L/L⁺` everywhere unramified (so `[L⁺ : ℚ]` is even, §3.1), `T = S = S_l ⊔ S(B) ⊔ R ⊔ S_a` split in `L`; `B` central simple over `L` of dimension `n²` with involution of the second kind, split outside `S(B)` and a division algebra above `S(B)` (`|S(B)|` even if `n` is even; `S(B)` may be empty), `G` its definite unitary group (§3.1); `q_v ≡ 1 mod l` at `S(B) ∪ R`; `S_a` nonempty, absolutely unramified, of odd residue characteristic, not split in `L(ζ_l)`; `[L⁺_v : ℚ_l] > n(n − 1)/2 + 1` at `S_l`; `U` hyperspecial at `S_l`, at split places outside `T` and at inert places, maximal at `S(B)`, Iwahori at `R`, principal congruence at `S_a`; `𝔪` a maximal ideal of the trivial-character ordinary Hecke algebra `𝕋^T_1(U(l^∞), O)` (§3.9) with `ρ̄_𝔪` unramified with scalar Frobenius at `S_a`, trivial at `S_l ∪ R ∪ S(B)`, and `ρ̄_𝔪 = ⊕_{i=1}^d ρ̄_i` with `ρ̄_i` absolutely irreducible, pairwise non-isomorphic, `ρ̄_i^c ≅ ρ̄_i^∨ ⊗ ε^{1−n}`, with no bound on `d`. Then `ρ̄_𝔪` extends to a Schur `r̄_𝔪` with multiplier `ε^{1−n}δ^n_{L/L⁺}` (§2.1); let `𝒮₁` be the problem with ordinary conditions at `S_l`, unipotent at `R`, Steinberg at `S(B)`, unrestricted at `S_a`, and `J_{𝒮₁} = ker(P_{𝒮₁} → 𝕋_𝔪)`. No map from `R^univ_{𝒮₁}` to the Hecke algebra is constructed. Prove: if `𝔭 ⊂ R^univ_{𝒮₁}` is a prime of dimension one and characteristic `l` with (1) `J_{𝒮₁}R^univ_{𝒮₁} ⊂ 𝔭`; (2) `r_𝔭` generic (§7.8); (3) `r_𝔭` trivial at `R` with `l^N > n` for `l^N ∥ q_v − 1`, and unramified with scalar Frobenius at `S(B)`; (4) `ρ̄_𝔪` is weakly primitive over `k`, and `k_𝔭 ⊗_k ρ̄_𝔪` is weakly primitive over the residue field `k_𝔭` of the normalization of `R^univ_{𝒮₁}/𝔭`; (5) `ζ_l ∉ L`, `r̄_𝔪|G_{L⁺(ζ_l)}` Schur and `r̄_𝔪(G_{L,S})` without quotient of order `l`; (6) `l > 3` and `l ∤ n` — then every prime `Q ⊂ 𝔭` of `R^univ_{𝒮₁}` contains `J_{𝒮₁}R^univ_{𝒮₁}`, equivalently the extension of `J_{𝒮₁}` to the localization at `𝔭` is nilpotent; after the twist arranging equal fraction fields and the coefficient change `Λ → Λ̃`, the completed map `P̃^∧_{𝔮̃} → 𝕋̃^∧_{𝔮̃}` has nilpotent kernel (ANT20, Theorem 4.1, p. 15; for `d = 2`, Tho15, Theorem 4.19 and Corollaries 4.20, 5.7, pp. 47–62). Hypothesis (4) is automatic when `ρ̄_𝔪` is weakly primitive over `k̄`, or when `k` splits every subgroup of its image (§7.15), and it holds when `ρ̄_𝔪` is strongly primitive over `k_𝔭` (§7.1). The literal statement of ANT20 with weak primitivity over the finite `k` alone is not claimed: weak primitivity over `k` does not pass to `k_𝔭` in general (§7.15, first Check), and no argument from the arithmetic set-up forcing it is known. No global `R = T` equality or global map `R^univ_{𝒮₁} → 𝕋` is asserted. NT26, Proposition 3.13, uses the variant with `r_𝔭` scalar rather than trivial at `R` and `S(B) = ∅`.

*Route.* `G(L⁺_∞)` compact makes `G` anisotropic; AdelicAlgebraicGroups §3.4 gives finite double quotients, and at `S_a` the principal congruence level is neat by the one-prime criterion of AdelicAlgebraicGroups §4.3 (absolute unramifiedness and odd `p`), so stabilizers are trivial even when `S(B) = ∅`, and §3.4 applies. Twist by §7.11(2) to arrange `Frac R^univ_{𝒮₁}/𝔭 = Frac P_{𝒮₁}/𝔮`; `Λ → R^univ_{𝒮₁}/𝔭` is finite. Normalize `R^univ_{𝒮₁}/𝔭` as `k_𝔭⟦T⟧`; the Schur and constituent conditions survive the scalar extension. At `v ∈ S_a` a Frobenius `η` has scalar residual image and `ε̄_l(η) ≠ 1`, so the scalar-detection form of §7.17 applies with §7.13. §7.18 gives the nilpotent completed `P`-to-Hecke kernel, §7.16 transfers it to `R^univ_{𝒮₁}`, and faithful flatness descends it to the localization at `𝔭`.

*Route under strong primitivity.* If `ρ̄_𝔪|G_{L,S}` is strongly primitive over `k_𝔭`, the normalized `r_𝔭` over `k_𝔭⟦T⟧` satisfies the hypotheses of the strong-primitivity route of §7.13, so its restriction to every open subgroup is absolutely irreducible without §7.12, and the Taylor–Wiles cotangent control of §7.17 gives hypothesis (1) of Tho15 Theorem 4.19. Patch the rings `P̃ ⊂ R̃` with their `µ₂^d`-action and the Hecke modules, for trivial characters and for pairwise distinct characters at `R`, identified modulo `λ` (§7.18): the patched `P`-algebra maps onto the patched `R`-algebra with nilpotent kernel after localization and completion (§7.16), the components are controlled by §7.11(3), and a depth argument makes the patched module nearly faithful. Hence the extension of `J_{𝒮₁}` to the completion at `𝔭` is nilpotent, and by faithful flatness so is its extension to the localization, so it lies in every prime `Q ⊂ 𝔭`.

*Needs:* §§2.1–2.2, 3.1, 3.4, 3.9, 3.11, 3.13, 4.1, 7.8, 7.11, 7.13, 7.15–7.18; LocalGaloisDeformationRings §§2.15, 2.26, 6.24; DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 5.8, 6.4–6.5; AdelicAlgebraicGroups §§3.4, 4.3–4.4; EndoscopicTransferAndUnitaryTraceComparison §§6.29, 4.7a; Mathlib `Ideal.minimalPrimes`, `ringKrullDim`.

**Checks.**

- ANT20, Proposition 5.3, and Tho15, Proposition 6.2: a generic, potentially pro-automorphic prime with trivial restriction at `R` has all minimal primes below it potentially pro-automorphic (§8.4).
- The conclusion concerns `J_{𝒮₁}` extended from `P_{𝒮₁}` to `R^univ_{𝒮₁}`; replacing it by the kernel of a map `R^univ_{𝒮₁} → 𝕋` presupposes a map this residually reducible set-up does not construct.
- Primitivity over `k` alone does not give (4): the `S₃` standard representation over `𝔽₅` is strongly, hence weakly, primitive, and over `𝔽₂₅` it is induced (§7.15).
- For `d = 2` the conclusion is Tho15 Corollary 4.20 with its Galois cotangent hypotheses supplied by §7.17.
- For `d ≥ 3` and `n ≥ l` with `l ∤ n` the same conclusion holds; no small-rank comparison (§7.3) is used.
- Nilpotence of the extension of `J_{𝒮₁}` to the localization at `𝔭` is equivalent to `J_{𝒮₁}R^univ_{𝒮₁} ⊂ Q` for every prime `Q ⊂ 𝔭`: the primes of the localization are those `Q`, and an ideal of a Noetherian ring lies in every prime exactly when it lies in the nilradical, which is nilpotent.

### Examples

- Sums of characters with ratios of large order are weakly primitive, and strongly primitive in rank below the characteristic (§§7.2–7.3).
- The node `k⟦x, y⟧/(xy)` (connectedness dimension zero, DeformationAndDerivedPatchingAlgebra §6.6) is the local model of a reducible locus meeting the irreducible one in a point.
- The `S₃` standard representation over `𝔽₅` and `𝔽₂₅`: strongly primitive over the first, induced over the second (§7.15), the reason for the coefficient condition in §7.19.
- The `𝔽₂` regular `C₂`-module separates weak from strong primitivity (§7.1).
- For `n = 2` and two residual characters, `I^red = A₁₂A₂₁` and `P_𝒮` is generated by traces and determinants (§§2.2, 7.6).

### Dependencies

Layers 2, 3 and 4 (§§2.1–2.2, 3.1, 3.4, 3.5, 3.9, 3.11, 3.13, 4.1); Layer 0 (§0.9). Suppliers: ArithmeticGaloisRepresentations §§1.3, 1.6, 1.8, 1.12, 7.4, 7.9; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1–1.4; LocalGaloisDeformationRings §§1.3, 1.9, 2.5, 2.15, 2.26, 6.12, 6.24, F.0.1, F.2.1–F.2.2, F.2.11; GlobalGaloisDeformations §§3.6, 4.2, 4.4, 8.1–8.4; DeformationAndDerivedPatchingAlgebra §§1.9, 4.1, 5.4–5.6, 5.8, 6.1, 6.4–6.7; DerivedModuleAlgebra §§1.M.1–1.M.2; ArithmeticGaloisDuality §§R02.4.5a, R02.5.1, D8.1; ReductiveGroupsPartII §§RG2.2.1, RG2.2.4; AdelicAlgebraicGroups §§3.4, 4.3–4.4; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 6.29; Chebotarev Layer 10 and ClassFieldTheory Layer 12.

## Layer 8: Residually reducible automorphy lifting

This layer proves the finiteness and automorphy lifting theorems for residually reducible ordinary representations: finiteness over `Λ` of ordinary, locally Steinberg deformation rings (ANT20, Theorem 6.2) and Thorne's automorphy lifting theorem for two adequate constituents (Tho15, Theorem 7.1); the results of NT21 §5 on sums of characters (finiteness, ordinary lifts of every weight, dimension bounds, smallness of the reducible locus, generic primes in large quotients, automorphic lifts of prescribed type); and the connectedness argument of ANT20 §5 made explicit through good CM extensions and potentially pro-automorphic primes. Automorphy lifting for a residual representation that is a sum of distinct conjugate self-dual constituents with a Steinberg place (ANT20, Theorem 1.1 = 6.1) is ModularityAndLanglandsExtensions §4.2, applied in §8.15; that section owns the theorem's route as well, including the conclusion of ANT20 Theorem 5.1 for `O`-valued lifts, and §§2.2(3), 7.7 and 8.5 here state the forms of its ingredients that the other theorems of this layer use. Each theorem is stated with the weak primitivity of the sources, through §7.19; under strong primitivity a shorter route, recorded with it, avoids §7.12. A theorem with `Q̄_l` coefficients tests primitivity over `F̄_l` and needs nothing more; a theorem with a finite coefficient field `K` imposes primitivity over `k̄` or assumes that `k` splits every subgroup of the residual image (§7.15), since weak primitivity over `k` alone does not pass to the residue fields met in the proof. The character applications have the source rank bounds (`2n < p` in NT21 Theorem 5.2, `p > n` in Proposition 5.8), so strong primitivity follows from the source hypotheses by §§7.2–7.3 and the shorter routes apply there.

Numerical bounds. The connectedness argument uses `d₀, d_l > |R|n(n + 1) + 3`, one more than the bound printed in ANT20 Theorem 5.1, and `d_l > n(n − 1)/2 + 1`; the final dimension estimate in the two-constituent proof is `n[L⁺ : ℚ] − |R|n(n + 1) − 5`, without the factor `1/2` in the display at the end of the proof of Theorem 7.1 (Tho15, p. 70, Tho15 line 3371). Propagation keeps `l^{v_l(q_v − 1)} > n` at the places of `R`.

### The ANT set-up

Sections 8.2–8.6 work in the following set-up (ANT20 §§4.1–4.2, 5). `L` is CM with `L/L⁺` unramified at finite places, `l` odd, `n ≥ 2`, and `K/ℚ_l` contains the images of all embeddings of `L`, enlarged so that every component of the unipotent rings `R¹_v` (`v ∈ R`) and of the Steinberg special fibres (`v ∈ B`) is geometrically irreducible (LocalGaloisDeformationRings §§2.15, 2.26). `T = S_l ⊔ B ⊔ R ⊔ A` is a finite set of places of `L⁺` split in `L`, with one lift `ṽ` each; `B` and `R` are prime to `l` with `q_v ≡ 1 mod l`, `|B|` even if `n` is even; the central simple algebra of degree `n` with involution of the second kind is division at `B` and split elsewhere, with definite unitary group (§3.1); `A` is nonempty, of odd residue characteristic, absolutely unramified and not split in `L(ζ_l)`; the level is hyperspecial away from `T` and at `S_l`, maximal compact at `B`, Iwahori at `R`, principal congruence at `A`. `𝔪` is a maximal ideal of the ordinary Hecke algebra (§3.9) with residue field `k` and `ρ̄ = ⊕ρ̄_i`, distinct absolutely irreducible, `ρ̄_i^c ≅ ρ̄_i^∨ε̄^{1−n}`, trivial at `S_l ∪ B ∪ R`, unramified with scalar Frobenius at `A`; `r̄` is its Schur extension with multiplier `ε̄^{1−n}δ^n_{L/L⁺}`; `𝒮₁` has ordinary conditions at `S_l`, unipotent at `R`, Steinberg at `B`, unrestricted at `A`; `R₁ = R^univ_{𝒮₁}`, `P₁ ⊂ R₁` its determinant subring (§2.2), `θ : P₁ → R₁`, `η : P₁ → 𝕋₁` the ordinary Hecke map and `J₁ = ker η`. All local degrees at `l` exceed `n(n − 1)/2 + 1`. Assume `l > 3`, `l ∤ n`, `ζ_l ∉ L`, `r̄|G_{L⁺(ζ_l)}` Schur, `ρ̄(G_L)` without quotient of order `l`, and `ρ̄` weakly primitive over `k̄` (strongly primitive over `k̄` for the shorter routes).

### 8.1 Good CM extensions

Fix a CM field `L`, a finite Galois `E/L` containing `L(ζ_l)`, and a finite set `X` of finite places of `L`. Define a finite extension `M/L` to be *good relative to `(E, X)`* if `M` is CM, the Galois group of the normal closure of `M` over `L` is soluble, `M` and `E` are linearly disjoint over `L`, and every place of `X` splits completely in `M` (ANT20 §5, Lemma 5.2, p. 16). In the applications `E` is the extension of `L(ζ_l)` cut out by `ρ̄|G_{L(ζ_l)}` and `X` the places above `S_l ∪ A ∪ R`; there is no splitting condition at `B`. Complete splitting of a nonzero prime `𝔓` means that the number of primes of `O_M` above `𝔓` is `[M : L]`, equivalently every completion of `M` above `𝔓` is `L_𝔓`. Existence of good extensions with prescribed local behaviour is PotentialAutomorphyInfrastructure §2.5.

*Needs:* Mathlib `NumberField.IsCMField`, `IntermediateField.normalClosure`, `IntermediateField.LinearDisjoint`, `Group.IsSolvable`, `Ideal.primesOver`; Tau Ceti `NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois` (complete splitting in a Galois extension through the number of primes above); PotentialAutomorphyInfrastructure §2.5.

**API.**

- `L` itself is good relative to every `(E, X)`.
- A good `M` is linearly disjoint from `E` over `L`, and every `𝔓 ∈ X` has exactly `[M : L]` primes of `O_M` above it.
- Goodness for `(E, X)` implies goodness for `(E, X′)` whenever `X′ ⊂ X`.
- If `M/L` is good for `(E, X)` and `N/M` is good for `(EM, X_M)`, `X_M` the primes above `X`, then `N/L` is good for `(E, X)`.

**Checks.**

- If `[M : L] > 1`, `M` is not good relative to `E = M`: `M` is not linearly disjoint from itself.
- If some `𝔓 ∈ X` has fewer than `[M : L]` primes above it, `M` is not good; for `L = ℚ(i)`, `M = ℚ(i, √2)` and `X = {(1 + i)}`, the prime above `2` is ramified in `M`, so `M` is not good for any `E`.
- For `X = ∅` goodness is the conjunction of the CM, soluble-normal-closure and linear-disjointness conditions; for `M/L` Galois, complete splitting of `𝔓 ∈ X` is equivalent to ramification index and inertia degree one (by the Tau Ceti criterion above).

### 8.2 Potentially pro-automorphic primes

In the ANT set-up, for each good `M/L` let `P_M` be the determinant subring over `M`, `η_M : P_M → 𝕋_M` its ordinary Hecke map and `α_M : P_M → P₁` restriction (§7.11(4)), and put `J_M = α_M(ker η_M)P₁`. Define a prime `𝔭 ⊂ R₁` to be *potentially pro-automorphic* if `θ(J_M)R₁ ⊂ 𝔭` for some good `M` (ANT20 §5, p. 16; Tho15 §6). The definition constructs no map `R₁ → 𝕋₁` and does not assert automorphy of every point of `R₁/𝔭`.

*Needs:* §§2.2, 7.11, 8.1; Mathlib `Ideal.map`, `Ideal.comap`, `PrimeSpectrum`.

**API.**

- `𝔭` is potentially pro-automorphic exactly when `ker η_M ⊂ (θ ∘ α_M)^{−1}(𝔭)` for some good `M`.
- If `𝔭 ⊂ 𝔮` and `𝔭` is potentially pro-automorphic, so is `𝔮`.
- A larger good extension has a smaller ideal (`J_N ⊂ J_M` for `N ⊃ M`, §7.11(4)), so it witnesses the same primes.
- Primes containing `J₁R₁` are potentially pro-automorphic, with witness `M = L`.

**Checks.**

- With every `J_M` the unit ideal no prime is potentially pro-automorphic; with some `J_M = 0` every prime is.
- For `P = ℤ`, `R = ℤ/2`, `θ` the quotient and a single `J = (2)`, the zero prime of `R` is potentially pro-automorphic although `J ≠ 0` in `P`: the condition is on the extension of `J` to `R`.
- The witness may depend on the prime: two minimal primes of `R₁` can be witnessed by different good extensions, which is why §8.5 partitions minimal primes.

### 8.3 Residual invariants under good extensions

In the ANT set-up with `ζ_l ∉ L`, `r̄|G_{L⁺(ζ_l)}` Schur and `ρ̄(G_L)` without quotient of order `l`, prove that for good `M/L` the residual image over `M` equals that over `L`, `ζ_l ∉ M`, `M ⊄ M⁺(ζ_l)`, `r̄|G_{M⁺(ζ_l)}` is Schur, weak primitivity is preserved, and, if `l ∤ n`, strong primitivity is preserved (ANT20, Lemma 5.2, p. 16).

*Route.* Linear disjointness from the residual-cyclotomic field gives equality of residual images, preserves the distinct absolutely irreducible constituents over the cyclotomic subgroup and excludes `ζ_l` from `M`. The CM quadratic character remains nontrivial on the cyclotomic subgroup, so the polarized representation still meets both components of `𝒢_n`. Weak primitivity depends only on the image (§7.14), strong primitivity too when `l ∤ n` (§7.4).

*Needs:* §§2.1, 7.4, 7.14, 8.1.

**Checks.**

- No new quotient of order `l` appears: the image is unchanged.
- Strong primitivity is inherited without identifying the two notions; for `l | n` §7.4 does not apply and only weak primitivity is inherited.
- If `M` were not disjoint from `E`, the image could shrink: for `M ⊂ E` cutting out a quotient of order `2` of the image, `ρ̄(G_M)` is an index-two subgroup and primitivity can fail (§7.14, second Check).

### 8.4 Propagation below a generic prime

In the ANT set-up with `[L⁺ : ℚ] > |R|`, let `𝔭 ⊂ R₁` be a generic (§7.8) potentially pro-automorphic prime of dimension one containing `ϖ`, with `r_𝔭` trivial on `G_{L_ṽ}` for `v ∈ R` and `l^{v_l(q_v−1)} > n` there. Prove that every minimal prime `Q ⊂ 𝔭` of `R₁` is potentially pro-automorphic (ANT20, Proposition 5.3, p. 16; Tho15, Proposition 6.2, p. 64). The proof uses weak primitivity of `ρ̄` over the residue field of the normalization of `R₁/𝔭`, which the assumption over `k̄` of the set-up provides (§7.15).

*Route.* Choose a witness `M₀` and a further good `M₁/M₀` making `r_𝔭` unramified with scalar Frobenius above `B` (unipotent inertia and the unipotent part of Frobenius have finite `l`-power order in characteristic `l`). Contract `𝔭` and `Q` to `M₁`; §7.13 keeps absolute irreducibility, and splitting at `l` keeps the inertial conditions. Twist by §7.11(2) to equalize fraction fields, the twist trivial at `R` because `[M₁⁺ : ℚ] > |R_{M₁}|`. Apply §7.19 over `M₁` to a minimal prime below the contracted `Q`; `J_{M₁}` is the witness.

*Needs:* §§7.8, 7.11, 7.13–7.15, 7.19, 8.1–8.3; PotentialAutomorphyInfrastructure §2.5.

**Checks.**

- The conclusion concerns minimal primes below `𝔭`, not primes above it.
- `[L⁺ : ℚ] > |R|` is used to choose the equalizing twist trivial at `R`: with `|R_{M₁}| = [M₁⁺ : L⁺]|R|` and `[M₁⁺ : ℚ] = [M₁⁺ : L⁺][L⁺ : ℚ]`, the inequality `[M₁⁺ : ℚ] > |R_{M₁}|` (Tho15 p. 65) follows; for `L⁺ = ℚ` and `|R| = 1` it fails.
- The places of `B` need not split in `M₁`; this freedom is what allows Frobenius there to become scalar.

### 8.5 Connectedness: every minimal prime is potentially pro-automorphic

In the ANT set-up, let `D = [L⁺ : ℚ]`, `d₀` the `ℤ_l`-rank lost in the anti-invariant abelian pro-`l` quotient when all places above `B` split, and `d_l = min_{v|l}[L⁺_v : ℚ_l]`. Assume `l^{v_l(q_v−1)} > n` for every `v ∈ R`, `d₀ > |R|n(n + 1) + 3` and `d_l > max(|R|n(n + 1) + 3, n(n − 1)/2 + 1)`. Prove that every minimal prime of `R₁` is potentially pro-automorphic (the connectedness step in the proof of ANT20, Theorem 5.1, pp. 16–17). The conclusion of that theorem, that every `O`-valued type-`𝒮₁` lift ordinary of weight `λ` comes from an ordinary RACSDC representation of `GL_n(𝔸_L)` of weight `λ`, is the last route ingredient of the Allen–Newton–Thorne lifting theorem and belongs to ModularityAndLanglandsExtensions §4.2 (connectedness of the finite ordinary ring); it is not a target here. This section states what the finiteness theorems of §§8.6–8.7 and 8.16 and the two-constituent theorem of §8.8 use, which involves no `O`-valued lift. These bounds are one larger than the printed ones: the special-fibre step costs one dimension that the printed estimate does not charge; the printed `+2` bound would need a sharper mixed-characteristic estimate that the characteristic-`l` argument does not give.

*Route.* For a good `M`, `R₁/(ϖ, J_MR₁)` is finite over `Λ/(ϖ)` (Hecke finiteness §3.11 and finite restriction §7.11(4)); §7.9(3) gives a generic prime in any quotient of dimension greater than `max(nD − d₀, nD − d_l)`. Imposing triviality at `R` costs at most `|R|n²` dimensions; the base witness `J_L` gives a generic potentially pro-automorphic prime and §8.4 a potentially pro-automorphic minimal prime. Partition the minimal primes into witnessed and unwitnessed classes; the connectedness bound `c(R₁) ≥ nD − |R|n − 2` (Tho15, Lemma 3.21, p. 22, from the local and global presentations, with DeformationAndDerivedPatchingAlgebra §6.6) gives `Q₁, Q₂` in the two classes with `dim R₁/(Q₁ + Q₂)` at least that. Passing to the special fibre and imposing triviality at `R` gives `nD − |R|n(n + 1) − 3`, larger than both bad-locus bounds by hypothesis; the quotient is finite over `Λ/(ϖ)`, so it contains a generic prime witnessing both, and §8.4 contradicts the partition.

*Needs:* §§2.2, 3.11, 7.7, 7.9, 7.11, 8.4; DeformationAndDerivedPatchingAlgebra §6.6; GlobalGaloisDeformations §8.4; Mathlib `Ideal.minimalPrimes`, `ringKrullDim`.

**Checks.**

- For `n = 2` and `|R| = 1` the bounds are `d₀, d_l > 9`; no factor `1/2` enters.
- Potential pro-automorphy of a minimal prime is a containment of a Hecke kernel over a good extension; it is not automorphy of a lift, which needs an `O`-point, classicality at an algebraic weight and descent, and is ModularityAndLanglandsExtensions §4.2.
- The special-fibre step is charged one dimension before the characteristic-`l` estimate is used: `nD − |R|n − 2 − 1 − |R|n² = nD − |R|n(n + 1) − 3`.

### 8.6 Finiteness after component propagation

Under the hypotheses of §8.5, prove that `R₁` is a finite `Λ`-algebra; no `O`-valued lift is needed. For this application use the following reduction: if `R` is a Noetherian algebra over Noetherian `Λ` and every minimal-prime quotient `R/Q` is finite over `Λ`, then their finite product contains `R/√0` as a `Λ`-submodule, so `R/√0` is finite over `Λ`; apply Mathlib `Module.finite_of_surjective_of_ker_le_nilradical` to `R → R/√0`, whose kernel is finitely generated because `R` is Noetherian (ANT20, Corollary 5.4, p. 17).

*Route.* By §8.5 each minimal `Q` contains some `J_MR₁`; `R₁/J_MR₁` is finite over `P_M/J_M`, a quotient of the ordinary Hecke algebra over `M`, finite over `Λ_M` (§3.11), with its action on `R₁/J_MR₁` factoring through `Λ`: since the good extension splits the places above `l`, each local inertial factor of `Λ_M` acts through the corresponding factor of `Λ`. Thus this quotient is finite over `Λ`. There are finitely many minimal primes; the reduced quotient embeds in their product, and the nilradical is nilpotent with finitely generated successive quotients.

*Needs:* §§2.2, 3.11, 7.11, 8.5; Mathlib `Ideal.finite_minimalPrimes_of_isNoetherianRing`, `Module.finite_of_surjective_of_ker_le_nilradical`, `RingHom.Finite`.

**Checks.**

- The conclusion includes nilpotents: for `R = Λ[x]/(x²)`, `R/(x)` is finite over `Λ` and so is `R`.
- It is module finiteness, not finite type: `Λ[x]` has the single minimal prime `0` with `Λ[x]` not finite over `Λ`, consistent with the hypothesis failing.
- §8.7 uses it without producing an ordinary lift of a specified weight.

### 8.7 Finiteness of ordinary locally Steinberg deformation rings

Let `F` be CM, `l` a prime, `ι : Q̄_l ≅ ℂ`, `S` a finite set of finite places of `F⁺` containing those above `l`, all split in `F`, with lifts `S̃`. Let `π` be a RACSDC automorphic representation of `GL_n(𝔸_F)`, `K` a coefficient field over which `r_ι(π)` takes values in `GL_n(O)`, and `r : G_{F⁺} → 𝒢_n(O)` an extension with `ν ∘ r = ε^{1−n}δ^n_{F/F⁺}`. Assume (1) `π` is `ι`-ordinary and `r̄|G_{F_ṽ}` is trivial for `v ∈ S_l`; (2) `π` is unramified outside `S`; (3) there is `v₀ ∈ S`, `v₀ ∤ l`, with `π_{ṽ₀}` an unramified twist of Steinberg, `q_{v₀} ≡ 1 mod l` and `r̄|G_{F_{ṽ₀}}` trivial; (4) `ρ̄^{ss} ≅ ρ̄₁ ⊕ ⋯ ⊕ ρ̄_d` with each `ρ̄_i` absolutely irreducible and `ρ̄_i^c ≅ ρ̄_i^∨ε^{1−n}`; (5) `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` and `F ⊄ F⁺(ζ_l)`, each `ρ̄_i|G_{F(ζ_l)}` absolutely irreducible and pairwise non-isomorphic, `ρ̄^{ss}` weakly primitive over `k̄` (or over `k` when `k` splits every subgroup of `ρ̄^{ss}(G_F)`), and `ρ̄(G_F)` without quotient of order `l`; (6) `l > 3` and `l ∤ n`. Let `𝒮` be the problem with multiplier `ε^{1−n}δ^n_{F/F⁺}`, ordinary conditions at `S_l`, unrestricted conditions at `S − (S_l ∪ {v₀})` and the Steinberg condition at `v₀`. Prove that `R^univ_𝒮` is a finite `Λ`-algebra (ANT20, Theorem 6.2, p. 19, printed with weak primitivity over `k`). The literal statement with weak primitivity over an arbitrary finite `k` is not claimed: the proof applies §7.19 at generic primes whose normalizations can have residue fields larger than `k`, and weak primitivity over `k` does not pass to them in general (§7.15). The variant with the first clause of (5) replaced by an unobstructed auxiliary place is §8.16.

*Route.* Put `R = S − (S_l ∪ {v₀})` and `S(B) = {v₀}`. For a CM `L/F` over which `r̄|G_{L⁺}` is Schur, `q_v ≡ 1 mod l` and `r̄|G_{L_ṽ}` is trivial above `R`, define `𝒮_L` with ordinary conditions above `S_l`, unipotent above `R` and Steinberg above `v₀`; restriction gives a finite map `R^univ_{𝒮_L} → R^univ_𝒮` (§§7.5, 2.2). Choose `L = F·M₀·M₁` (PotentialAutomorphyInfrastructure §2.5) with `M₀/F⁺` cyclic totally real of odd degree `δ`, inert at a finite set `Y₀` and split at `X₀ ∪ {v₀}`, and `M₁/F⁺` real quadratic split at `X₀ ∪ {v₀} ∪ Y₀`; `X₀` keeps (5) valid over `L` and contains a place `v₁` with scalar residual Frobenius and `q ≢ 1 mod l`, providing `S_a` (the only use of the first clause of (5)). Then `d_{L,0} = 2δ`, `d_{L,l} ≥ δ` and `|R_L| ≤ 2|Y₀|`; choosing `δ` prime to the finitely many absolute residue degrees and larger than `max(2|Y₀|n(n + 1) + 3, n(n − 1)/2 + 1)` makes the bounds of §8.5 hold. Residual automorphy over `L` comes from the base change of `π`, Steinberg above `v₀`, transferred to the unitary group of the algebra ramified at the places above `v₀` (§3.5(3)). §8.6, with §§7.13 and 7.19 at the generic primes it meets, makes the ring over `L` finite over `Λ_L`, so `R^univ_𝒮` is finite over `Λ`. Good extensions preserve the residual image and hence weak primitivity (§7.14), and primitivity over `k̄`, or over a `k` splitting every subgroup of the image, passes to the residue fields of the normalizations met in §7.19 (§7.15).

*Route under strong primitivity.* If `ρ̄^{ss}` is strongly primitive over `k̄`, the same construction runs §8.6 through the strong-primitivity routes of §§7.13 and 7.19, and good extensions preserve strong primitivity because `l ∤ n` (§7.4); this route does not use §7.12.

*Needs:* §§2.2, 3.5, 7.4–7.5, 7.13–7.15, 7.19, 8.1–8.6; PotentialAutomorphyInfrastructure §§2.5, 3.44; LocalGaloisDeformationRings §§2.5, 2.26; AdelicAlgebraicGroups §1.1.

**Checks.**

- NT21, proof of Theorem 5.2: the ring of the doubled problem over `L` is finite over `Λ_{L,2n}` by this theorem applied to `π_L` (§8.9).
- Without the Steinberg place (3) the argument has no `S(B)`, `d₀ = 0`, and §7.7 gives no bound below `n[F⁺ : ℚ]`: the reducible locus is not small and the connectedness argument has nothing to compare.
- For `d = 1` the residual representation is absolutely irreducible; when its image on `G_{F(ζ_l)}` is moreover adequate, finiteness already follows from §5.7 with Ihara avoidance. The residually reducible machinery is needed for `d ≥ 2`.
- A residual image like the `S₃` example of §7.15 shows the coefficient condition: over `k = 𝔽₅` the standard representation is weakly primitive, but it is induced over `𝔽₂₅ ⊂ k̄`, and `𝔽₅` does not split `C₃`; so the hypothesis of this target fails while the hypothesis printed in ANT20 holds.
- Strong primitivity over `k̄` implies weak primitivity over `k̄` (§7.1), so the strong form is the case with the shorter route. The conclusion is ring finiteness, not an assertion that all points are classical.

### 8.8 Thorne's automorphy lifting for two adequate constituents

Let `l > 3`, `K ⊂ Q̄_l` finite over `ℚ_l`, `F` imaginary CM, `n ≥ 2` and `ρ : G_F → GL_n(K)` continuous semisimple with (1) `ρ^c ≅ ρ^∨ε^{1−n}`; (2) finitely many ramified places; (3) `ρ` ordinary of weight `λ`; (4) `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}`; (5) `ρ̄^{ss} ≅ ρ̄₁ ⊕ ρ̄₂` with `ρ̄_i|G_{F(ζ_l)}` adequate in the sense of Tho12 (so absolutely irreducible of dimension `n_i` prime to `l`), `ρ̄^{ss}` weakly primitive over `k̄` (or over `k` when `k` splits every subgroup of the residual image), `l ∤ n`; (6) `ρ̄₁ ≇ ρ̄₂` and `ε^{1−n}ρ̄₁^∨ ≇ ρ̄₂^c`; (7) a place `ṽ₀ ∤ l` with `(ρ|G_{F_{ṽ₀}})^{ss} ≅ ⊕ψε^{n−i}`; (8) an `ι`-ordinary RACSDC `π` with `r̄_ι(π)^{ss} ≅ ρ̄^{ss}`, Steinberg at `ṽ₀`; (9) a CM extension `F₀/F` linearly disjoint from the field cut out by `ρ̄^{ss}|G_{F(ζ_l)}` and `ι`-ordinary RAECSDC `(π_i, χ_i)` of `GL_{n_i}(𝔸_{F₀})` with `r̄_ι(π_i) ≅ ρ̄_i|G_{F₀}`. Prove that `ρ` is automorphic (Tho15, Theorem 7.1, pp. 66–70, printed with weak primitivity over the residue field). No hypothesis `F ⊄ F⁺(ζ_l)` is added. As in §8.7, the literal form with weak primitivity over an arbitrary finite `k` is not claimed.

*Route.* Choose a self-dual lattice and make the preliminary soluble base change (Tho15, conditions 10–13 of the proof), with `X̃₀` preserving adequacy, (6) and primitivity, and the scalar place from (4). Choose `L = F·M₀·M₁` with `[L_w : ℚ_l] > sup(rn(n + 1) + 5, n(n − 1)/2 + 1)`, `r = |R|`, `|S(B)|` even and `d₀ = 2d > 6 + rn(n + 1)`. Every extension of `ρ|G_{L,S}` is Schur by (6) (§2.1). For a minimal prime `Q` of `R^red`, write the lifting as `r₁ ⊕ r₂`; the ordinary flags split, so the two block rings surject onto `R^red/Q`; each block ring is finite over `Λ_i` of dimension `1 + n_i[L⁺ : ℚ]` by the `Λ`-adic clause of §4.6 (Tho12, Corollary 8.7) with (9), adequacy and restriction finiteness (§5.7); the existence of a characteristic-zero lift alone would not give this. §7.11(1), with the determinant lift `d₀` there (in the fixed-determinant twist factor the determinants are unramified outside `l`), and the Steinberg relations cut the dimension by at least `6 + rn(n + 1)`, so `dim R^red/Q ≤ n[L⁺ : ℚ] − rn(n + 1) − 5`. The connectedness argument of §8.5 with two constituents, using §§7.13 and 7.19 for `d = 2` and good extensions preserving weak primitivity (§7.14), makes the minimal prime below the point defined by `ρ|G_L` potentially pro-automorphic; for a witness `M` the induced point kills `J_{𝒮_{1,M}}`, so the characteristic-polynomial map factors through the ordinary Hecke algebra over `M`. Classicality (§3.12), base change from the unitary group (§3.5) and soluble descent (§0.9) give automorphy of `ρ|G_L`, which is irreducible by local–global compatibility at the Steinberg place, and soluble descent gives the result over `F`.

*Route under strong primitivity.* If `ρ̄^{ss}` is strongly primitive over `k̄`, use the strong-primitivity routes of §§7.13 and 7.19 for `d = 2`; good extensions preserve strong primitivity since `l ∤ n` (§7.4), and §7.12 is not used.

*Needs:* §§0.9, 2.1, 3.5, 3.12, 4.6, 5.7, 7.4, 7.11, 7.13–7.14, 7.19, 8.1–8.5; ArithmeticGaloisRepresentations §7.9.

**Checks.**

- ANT20, Theorem 1.1 (ModularityAndLanglandsExtensions §4.2), allows `d` constituents and removes adequacy and (9), adding `F ⊄ F⁺(ζ_l)`, irreducibility and distinctness over `F(ζ_l)`, and no quotient of order `l`.
- CT14, Proposition 5.1 (p. 13), applies the theorem to a symmetric power of an `ι`-ordinary Hilbert modular form with a Steinberg place.
- (6) is what makes every extension Schur: for `n₁ = n₂ = 1` and characters with `χ̄₂^c = ε̄^{−1}χ̄₁^{−1}` (that is, `ε^{1−n}ρ̄₁^∨ ≅ ρ̄₂^c` with `n = 2`), the configuration `W₂ = ρ̄₁`, `k²/W₁ = ρ̄₂` satisfies `(k²/W₁)^c ≅ W₂^∨ ⊗ (ν ∘ r̄)`, which the Schur condition of §2.1 forbids.
- Adequacy of each constituent is not replaced by adequacy of the reducible sum, which is never adequate (its image fixes the block idempotents in `ad`).

### 8.9 Finiteness of ordinary deformation rings of sums of characters

Let `F` be CM with `F/F⁺` everywhere unramified, `p` a prime, `S ⊃ S_p` a finite set of finite places of `F⁺` split in `F` with chosen `ṽ`, and `E ⊂ Q̄_p` a coefficient field. Let `µ : G_{F⁺,S} → O^×` be de Rham with `µ(c_v) = −1` at every real place, `n ≥ 2`, and `χ̄₁, …, χ̄_n : G_{F,S} → k^×` with `χ̄_iχ̄_i^c = µ̄|G_{F,S}`; let `r̄` be the extension of `⊕χ̄_i` with `r̄(c) = (1_n, 1)j`, so `ν ∘ r̄ = µ̄`, trivial at `ṽ` for `v ∈ S_p`. Let `Σ` be a finite set of places split in `F`, disjoint from `S`, with `q_v ≡ 1 mod p` and `r̄|G_{F_ṽ}` trivial, and `𝒮_Σ` the problem with multiplier `µ`, ordinary conditions at `S_p`, unrestricted at `S − S_p` and Steinberg at `Σ`, over `Λ = ⊗̂_{v∈S_p} O⟦I^{ab}_{F_ṽ}(p)ⁿ⟧`. Assume (1) `p > 2n`; (2) `χ̄_i/χ̄_j|G_{F(ζ_p)}` has order greater than `2n` for `i < j` (so `r̄` is Schur); (3) `[F(ζ_p) : F] = p − 1`; (4) `Σ ≠ ∅`. Prove that `R_{𝒮_Σ}` is a finite `Λ`-algebra (NT21, Theorem 5.2, pp. 67–69). The case `n = 1` is needed by §8.12, where it is recorded as a supplier gap on GlobalGaloisDeformations.

*Route.* Choose a place `v_q` above a rational prime `q > 2n` split in `F` and, after enlarging `k`, `ψ̄ : G_F → k^×` with `ψ̄ψ̄^c = ε̄^{1−2n}µ̄^{−1}|G_F`, unramified above `S ∪ Σ`, with `q` dividing the order of `(ψ̄/ψ̄^c)(I_{F_{v_q}})` (§0.11). Put `r̄₁ = I(r̄ ⊗ (ψ̄, ε̄^{1−2n}µ̄^{−1}δ_{F/F⁺})) : G_{F⁺} → GSp_{2n}(k)` and `r̄₂` its `𝒢_{2n}`-form, with `ρ̄₂ = r̄₂|G_F ≅ ρ̄ ⊗ ψ̄ ⊕ ρ̄^c ⊗ ψ̄^c` (ArithmeticGaloisRepresentations §7.4); `ρ̄₂` is weakly primitive by §7.2 and strongly primitive by §7.3 (`2n < p`). Apply §6.1 to `r̄₁` with the finite set `Σ` to get a totally real `L⁺` and a weight-zero self-dual `π`, Steinberg above `p` and above `Σ`. After a soluble base change §8.7 applies to `π_L`, so `R_{𝒮′}` is finite over `Λ_{L,2n}`. Modulo `ϖ` (where the twist by `ψ̄` exists) `r ↦ I(r ⊗ ψ̄)|G_{L⁺}` gives `R_{𝒮′}/(ϖ) → R_{𝒮_Σ}/(ϖ)`, finite because each deformation ring is finite over its pseudodeformation ring (§2.2), restriction of pseudodeformations is finite (§7.5), and `t ↦ t ⊗ ψ̄ + t^c ⊗ ψ̄^c` is surjective on pseudodeformation rings since `ρ̄₂` is multiplicity free. Completeness gives finiteness of `R_{𝒮_Σ}` over `Λ`.

*Needs:* §§0.11, 2.2, 6.1, 7.2–7.3, 7.5, 8.7; ArithmeticGaloisRepresentations §7.4.

**Checks.**

- NT21 uses the theorem for Corollaries 5.4–5.5 (§§8.10–8.11), for the two blocks in Proposition 5.6 (§8.12), and in §6 (p. 82) to show that every minimal prime of `R_{D_{1,a}}` has dimension `dim Λ_{L₁}`.
- The bound `p > 2n` is used twice: for `ρ̄₂` of rank `2n` to be strongly primitive (§7.3) and for `q > 2n` to make the mixed ratios large.
- `Σ ≠ ∅` is needed: with `Σ = ∅` the ring has dimension up to `n[F⁺ : ℚ] + n` (§8.11), larger than `dim Λ/(ϖ) = n[F⁺ : ℚ]`.

### 8.10 Ordinary lifts of every weight

Under the hypotheses of §8.9, assume also that `µε^{n−1}` has finite order (as for `µ = ε^{1−n}δ^n_{F/F⁺}`), let `λ ∈ (ℤⁿ₊)^{Hom(F,Q̄_p)}` with `λ_{τc,i} = −λ_{τ,n+1−i}`, and suppose `[F_ṽ : ℚ_p] > n(n − 1)/2 + 1` for `v ∈ S_p`. Prove that there is a lift `r : G_{F⁺,S∪Σ} → 𝒢_n(ℤ̄_p)` of `r̄` with `ν ∘ r = µ`, of Steinberg type at `Σ`, with `r|G_{F,S∪Σ}` ordinary of weight `λ` (NT21, Corollary 5.4, p. 70). NT21 prints `G_{F⁺,S}` for `G_{F⁺,S∪Σ}`, and the weight of `µ` must be `n − 1` for the symmetric condition on `λ` to be compatible with `ν ∘ r = µ`, since the proof prescribes weights only at the places `ṽ`.

*Route.* The presentation of GlobalGaloisDeformations §8.4, with `H⁰(G_{F⁺,S∪Σ}, ad r̄(1)) = 0` (Schur over `F⁺(ζ_p)`), and the local dimensions (LocalGaloisDeformationRings §6.24, needing `[F_ṽ : ℚ_p] > n(n − 1)/2 + 1`) give `dim R_{𝒮_Σ}/Q ≥ dim Λ` for every minimal prime `Q`; with §8.9, `Λ/Q_Λ → R_{𝒮_Σ}/Q` is finite and injective for a minimal prime `Q_Λ`. Choose a maximal ideal of `Λ/Q_Λ[1/p]` above the arithmetic prime `℘_{λ,α}` (§3.12) and a prime above it by lying over; the lift is ordinary of weight `λ_ṽ` at each `ṽ`, and at `ṽ^c` it is `(r|G_{F_ṽ})^{c,∨} ⊗ µ`, with weights `w − (λ_{τ,j} + n − j)`, which are those prescribed by `λ_{τc,i} = −λ_{τ,n+1−i}` exactly when `w = n − 1`.

*Needs:* §§0.1, 3.12, 8.9; GlobalGaloisDeformations §8.4; LocalGaloisDeformationRings §§1.3, 6.24.

**Checks.**

- For `n = 1`, a lift `χ` with `χχ^c = µ` has `HT_τ(χ) + HT_{τc}(χ) = w`, so `λ_{τc} = −λ_τ` forces `w = 0 = n − 1`.
- For `n = 2`, `λ_τ = (0, 0)` and `λ_{τc} = (0, 0)`: the weights at `ṽ^c` are `w − {1, 0} = {0, 1}` with `w = 1`, matching `λ_{τc,i} + 2 − i = {1, 0}`; with `w = 3` they would be `{2, 3}`.
- Without `[F_ṽ : ℚ_p] > n(n − 1)/2 + 1` the ordinary ring of LocalGaloisDeformationRings §6.24 may fail to have the dimension used, and the lower bound fails.

### 8.11 A dimension bound for the ring without Steinberg conditions

Under hypotheses (1)–(3) of §8.9, let `v₀ ∉ S` be split in `F` with `q_{v₀} ≡ 1 mod p` and `r̄|G_{F_{ṽ₀}}` trivial. Prove that `A = R_{𝒮_∅}/(ϖ, {tr r(Frob^i_{ṽ₀}) − n}_{i=1,…,n})` is a finite `Λ`-algebra and `dim R_{𝒮_∅}/(ϖ) ≤ n[F⁺ : ℚ] + n` (NT21, Corollary 5.5, p. 70).

*Route.* The quotient of the unramified lifting ring at `v₀` on which Frobenius has characteristic polynomial `∏(X − q_{v₀}^{1−i})` is `O`-flat and a quotient of the Steinberg ring (LocalGaloisDeformationRings §§2.5, 2.26: unramified lifts with Frobenius eigenvalues in ratio `q_{v₀}` are of Steinberg type), so the corresponding quotient of `R_{𝒮_∅}` is a quotient of `R_{𝒮_{{v₀}}}`, finite over `Λ` by §8.9. Since `q_{v₀} ≡ 1 mod p` and `p > n`, modulo `ϖ` the condition "characteristic polynomial `(X − 1)ⁿ`" is equivalent to `tr(Frob^i) = n` for `i = 1, …, n` (Newton's identities). `A` is cut out by `n` elements, so Krull's height theorem gives the bound.

*Needs:* §8.9; LocalGaloisDeformationRings §§2.2, 2.5, 2.26.

**Checks.**

- Newton's identities need `p > n`: for `n = p = 2` the condition `tr(Frob) = 2 = 0` and `tr(Frob²) = 2 = 0` does not determine `det(Frob)`, while `(X − 1)²` needs `det = 1`.
- For `n = 1` the bound reads `dim R/(ϖ) ≤ [F⁺ : ℚ] + 1`, and `A` imposes `Frob_{ṽ₀} ↦ 1`.
- The device (an auxiliary place and the `n` coefficients of its Frobenius polynomial) is reused in the proof of §8.12.

### 8.12 The reducible locus is small

Let `R_𝒮/(ϖ) → A` be a surjection onto a domain with `r = r₁ ⊕ r₂` over `A`, `r_i : G_{F⁺,S} → 𝒢_{n_i}(A)`, `𝒮 = 𝒮_∅`, and `R ⊂ S − S_p` a set of places of odd residue characteristic with the level-raising data of NT21 §1.17 (`n_ṽ`, `q_ṽ` a primitive `n_ṽ`-th root of unity modulo `p`, `r̄|G_{F_ṽ} = σ̄_{ṽ,1} ⊕ σ̄_{ṽ,2}`, `Θ_ṽ` of order `p`). Prove that if (1) `p > 2n`; (2) `χ_i/χ_j|G_{F(ζ_p)}` has order `> 2n`; (3) `[F_ṽ : ℚ_p] > n(n − 1)/2 + 1` for `v ∈ S_p`; (4) `[F(ζ_p) : F] = p − 1`; (5) for `v ∈ R` both `r̄₁|G_{F_ṽ}` and `r̄₂|G_{F_ṽ}` have nontrivial unramified subquotients and `R^□_v → A` factors through the level-raising ring `R(ṽ, Θ_ṽ, n)` (LocalGaloisDeformationRings §2.18), then `dim A ≤ n[F⁺ : ℚ] + n − d_R`, `d_R` the `ℤ_p`-rank of the subgroup of `Δ = Gal(L_{S_p}/F)/(c + 1)` generated by the `Frob_ṽ`, `v ∈ R` (NT21, Proposition 5.6, pp. 71–72, with the set-up preceding it on pp. 70–71).

*Route.* With an auxiliary `ṽ₀` as in §8.11, reduce to `r(Frob_{ṽ₀})` unipotent at the cost of `n` dimensions. As in §7.7 the ordinary flags split, giving `R_{𝒮₁} ⊗̂ R_{𝒮₂} → A` with Steinberg conditions at `v₀`. For blocks of rank `n_i ≥ 2`, §8.9 gives `dim R_{𝒮_i}/(ϖ) ≤ n_i[F⁺ : ℚ]`; for a block of rank one this is the rank-one polarized ordinary finiteness recorded as a supplier gap on GlobalGaloisDeformations (NT21's reference to Theorem 5.2 covers only rank at least two). With the characteristic-`l` splitting `R_{𝒮_i}/(ϖ) ≅ R_{𝒮_i,ψ_i}/(ϖ) ⊗̂_k k⟦Δ⟧` for the Teichmüller lift `ψ_i` of `det r̄_i` (§7.11(1)), it remains to bound the quotient of `k⟦Δ × Δ⟧`. At `v ∈ R`, the level-raising ring gives `Ψ₁(Frob_ṽ)^{n_ṽ} = Ψ₂(Frob_ṽ)^{n_ṽ}` (NT21, Proposition 1.22(3)); `Δ` is pro-`p` and `n_ṽ` is prime to `p`, so `Ψ₁(Frob_ṽ) = Ψ₂(Frob_ṽ)`, and the map factors through a quotient of dimension `2[F⁺ : ℚ] − d_R`.

*Needs:* §§7.6–7.7, 7.11, 8.9, 8.11; LocalGaloisDeformationRings §§2.18, 2.24; GlobalGaloisDeformations §8.1, with rank-one finiteness recorded as a supplier gap.

**Checks.**

- The analogue of §7.7 with level-raising places in place of Steinberg places; with `R = ∅`, `d_R = 0` and the bound is `n[F⁺ : ℚ] + n`, that of §8.11.
- `n_ṽ` prime to `p` is used to take `n_ṽ`-th roots in the pro-`p` group `Δ`: for `n_ṽ = 2` and `p = 5`, `x² = y²` in a pro-`5` group gives `x = y`.
- For `n = 2` and `n₁ = n₂ = 1` both blocks are characters: this is exactly the case requiring the rank-one finiteness input.

### 8.13 Generic primes in large quotients

In the set-up of NT21 §5 before Theorem 5.7 (`F/F⁺` everywhere unramified, `S ⊇ S_p` split, `[F(ζ_p) : F] = p − 1`, `µ` de Rham odd, `2 ≤ n < p/2`, characters with ratios of order `> 2n` on `G_{F(ζ_p)}`, `r̄` trivial at `S_p` with `[F_ṽ : ℚ_p] > n(n − 1)/2 + 1`, `R = R₁ ⊔ R₂ ⊂ S − S_p` with the level-raising data, and `𝒮` with ordinary conditions at `S_p`, level-raising rings at `R` and unrestricted conditions elsewhere), let `R_𝒮 → B` be a surjection in `C_Λ` with `B` finite over `Λ/(ϖ)`. Prove: if (1) every irreducible component of `Spec B` has dimension `> sup({n[F⁺ : ℚ] + n − d_{R_i}}_{i=1,2}, {n[F⁺ : ℚ] − [F_ṽ : ℚ_p]}_{v∈S_p})` and (2) for every decomposition `r̄ = r̄₁ ⊕ r̄₂` with `n₁n₂ ≠ 0` there is `i` such that at every `v ∈ R_i` both `r̄_j|G_{F_ṽ}` have a nontrivial unramified subquotient, then there is a generic prime `𝔭 ⊂ R_𝒮` (§7.8) of dimension one and characteristic `p` containing `ker(R_𝒮 → B)` (NT21, Theorem 5.7, pp. 72–73; the printed domain `G_{F,S}` of `r̄` is a slip for `G_{F⁺,S}`).

*Route.* Pass to a minimal-prime quotient of `B`. §7.9(1) bounds the non-generic-at-`p` locus by `sup_v(n[F⁺ : ℚ] − [F_ṽ : ℚ_p])`; on each component of `Spec R_𝒮/(I^red, ϖ)` the representation splits (§7.6), hypothesis (2) selects `i`, and §8.12 bounds its dimension by `n[F⁺ : ℚ] + n − d_{R_i}`. §7.9(2) gives a dimension-one prime avoiding all these ideals, generic by §7.8.

*Needs:* §§7.6, 7.8–7.9, 8.12.

**Checks.**

- NT21 §6 (proof of Lemma 6.7, p. 81) applies it to `B = R_{D₀}/(J_{D₀}, 𝔪)` to find a generic prime of dimension one.
- Hypothesis (2) is needed: if a decomposition has, at every place of both `R₁` and `R₂`, a block with no unramified subquotient, §8.12 gives no bound below `n[F⁺ : ℚ] + n`, and that reducible component may be all of `B`.
- With `R₁ = R₂ = ∅`, `d_{R_i} = 0`, and hypothesis (1) asks for components of dimension `> n[F⁺ : ℚ] + n`, impossible for `B` finite over `Λ/(ϖ)` of dimension `n[F⁺ : ℚ]`: level-raising places are what make the statement non-vacuous.

### 8.14 Global lifts with prescribed local components (Schur form)

Let `p > 2`, `F₀` imaginary CM with `F₀ ⊄ F₀⁺(ζ_p)`, `S₀` a finite set of finite places of `F₀⁺` containing those above `p`, and `r̄ : G_{F₀⁺,S₀} → 𝒢_n(k)` with `r̄⁻¹(𝒢_n⁰(k)) = G_{F₀,S₀}`, `ν ∘ r̄ = ε̄^{1−n}δ̄^n_{F₀/F₀⁺}` and `r̄|G_{F₀⁺(ζ_p)}` Schur. Put `µ = ε^{1−n}δ^n_{F₀/F₀⁺}`. For each `v ∈ S₀` fix an inertial type and, if `v | p`, a regular Hodge type, and a quotient `R̄_v` of the `µ`-polarized framed ring of `r̄|G_{F⁺_{0,v}}` that is a nonempty union of irreducible components of the generic fibre of the ring of that type; then `dim R̄_v = 1 + n²` if `v ∤ p` and `1 + n² + n(n − 1)[F⁺_{0,v} : ℚ_p]/2` if `v | p`. Prove that the functor of `µ`-polarized deformations unramified outside `S₀` and of type `R̄_v` at each `v ∈ S₀` is represented by a ring of Krull dimension at least one (BG19, Corollary 5.1.1, pp. 38–39, with absolute irreducibility of `r̄|G_{F₀(ζ_p)}` replaced by the Schur property over `F₀⁺(ζ_p)`, as NT21, proof of Proposition 5.8, observes: the proof uses irreducibility only for `H⁰(G_{F₀⁺,S₀}, ad r̄) = 0` and `H⁰(G_{F₀⁺,S₀}, ad r̄(1)) = 0`). At an inert `v` with `r̄(I_{F⁺_{0,v}})` of order prime to `p`, the lifts on which reduction is injective on the image of inertia form a component of this kind.

*Route.* For Schur `r̄` and `p > 2`, `H⁰(G_{F₀⁺,S₀}, ad r̄) = 0` (§2.1(3)), which gives representability (GlobalGaloisDeformations §8.2; conjugation preserves each component). `H⁰(G_{F₀⁺,S₀}, ad r̄(1))` injects into the invariants over `F₀⁺(ζ_p)`, where it is `H⁰(ad r̄) = 0` by the Schur property, the scalar line being acted on by `δ_{F₀/F₀⁺}ε̄ ≠ 1` exactly when `ζ_p ∉ F₀`. The presentation (GlobalGaloisDeformations §8.4; BG19, Proposition 4.1.1) and the local dimensions give `dim ≥ 1 + [F₀⁺ : ℚ]n(n − 1)/2 − [F₀⁺ : ℚ]n(n − 1)/2 = 1`, oddness giving `n(n − 1)/2` at each real place. At an inert place with inertia of order prime to `p`, the obstruction lies in `H²` of the unramified quotient, which vanishes, so the quotient is formally smooth of relative dimension `n²`, hence a component.

*Needs:* §2.1; GlobalGaloisDeformations §§8.2, 8.4, with nonsplit places recorded as a supplier gap; LocalGaloisDeformationRings §§2.5, 2.26, 2.28, 3.4, 3.11.

**Checks.**

- If `ζ_p ∈ F₀`, the scalar line of `ad r̄(1)` is `G_{F₀⁺}`-invariant and the count only gives dimension at least `0`.
- BG19, Theorem 5.2.1, is the same argument with potentially diagonalizable components and adequate image, finiteness coming from §5.6.
- For `n = 1` the count is `1 + 0 − 0 = 1`, and the ring is the completed group algebra of the relevant anticyclotomic quotient twisted by the fixed types.

### 8.15 Automorphic lifts of prescribed type from residual automorphy over a soluble extension

Let `p` be a prime, `F₀` imaginary CM with `F₀/F₀⁺` everywhere unramified, `S₀ ⊇ S_{0,p}` a finite set of finite places of `F₀⁺` with the `p`-adic places split in `F₀`, `n ≥ 2`, and `ρ̄ ≅ ⊕_{i=1}^r ρ̄_i : G_{F₀,S₀} → GL_n(k)` with `ρ̄_i` absolutely irreducible, `ρ̄_i^c ≅ ρ̄_i^∨ ⊗ ε^{1−n}`, pairwise non-isomorphic. Fix disjoint `T₀, Σ₀ ⊂ S₀` of prime-to-`p` split places, with `q_ṽ ≡ 1 mod p` and `ρ̄|G_{F_{0,ṽ}}` trivial at `Σ₀`; for `v ∈ T₀` a nonempty union `R̄_v` of components of `Spec R^□_v[1/p]`; assume `ρ̄(I_{F_{0,ṽ}})` has order prime to `p` at every `v ∈ S₀` inert in `F₀`; and fix `λ` with `λ_{τc,i} = −λ_{τ,n+1−i}` such that `ρ̄|G_{F_{0,ṽ}}` has an ordinary lift of weight `λ_ṽ` at each `v ∈ S_{0,p}`. Suppose there is a soluble CM `F/F₀` with (1) `p > max(n, 3)`, `[F_v : ℚ_p] > n(n − 1)/2 + 1` and `ρ̄|G_{F_v}` trivial above `p`; (2) `F(ζ_p) ⊄ F̄^{ker ad ρ̄}`, `F ⊄ F⁺(ζ_p)`, each `ρ̄_i|G_{F(ζ_p)}` absolutely irreducible and pairwise non-isomorphic, `ρ̄|G_F` weakly primitive over `F̄_p`, `ρ̄(G_F)` without quotient of order `p`; (3) an `ι`-ordinary RACSDC `π` of `GL_n(𝔸_F)` with `r̄_{π,ι} ≅ ρ̄|G_F`, an unramified twist of Steinberg at some place above `Σ₀`; (4) every place of `F⁺` above `S₀` splits in `F`. Prove that there is a RACSDC `π₀` of `GL_n(𝔸_{F₀})`, unramified outside `S₀`, with `r̄_{π₀,ι} ≅ ρ̄`, `ι`-ordinary of weight `ιλ`, with `r_{π₀,ι}|G_{F_{0,ṽ}}` a point of `R̄_v` for `v ∈ T₀`, an unramified twist of Steinberg for `v ∈ Σ₀`, and with reduction an isomorphism on the image of inertia at inert places (NT21, Proposition 5.8, pp. 73–74, proof pp. 74–75, modelled on BG19, Theorem 5.2.1). Since `p > n`, §7.3 gives strong primitivity from weak; split prime-to-`p` places of `S₀` outside `T₀ ∪ Σ₀` are treated as places of `T₀` with `R̄_v` the whole reduced `p`-torsion-free lifting ring.

*Route.* Above `p` take `R̄_v` a minimal prime of the potentially semistable ring of Hodge type `λ_ṽ` and inertial type `τ_ṽ` (read off from the given ordinary lift) through that lift, all of whose points are ordinary of weight `λ_ṽ` (LocalGaloisDeformationRings §§3.4, 3.13, 6.12). §8.14 gives a ring of dimension at least one. Restriction to `F` maps it finitely to the ordinary Steinberg ring over `F` (§§7.5, 2.2; GlobalGaloisDeformations §4.2), finite over `Λ_F` by §8.7; the `Λ_F`-structure factors through `O`, so the ring is finite over `O` and has a point (§5.8). Its restriction to `F` is automorphic by ModularityAndLanglandsExtensions §4.2, and soluble descent (§0.9) gives `π₀`; the local properties follow from local–global compatibility.

*Needs:* §§0.9, 2.2, 5.8, 7.3, 7.5, 8.7, 8.14; ModularityAndLanglandsExtensions §4.2; LocalGaloisDeformationRings §§3.4, 3.13, 6.12; GlobalGaloisDeformations §4.2; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6.

**Checks.**

- NT21 uses it in §6 (p. 78, with Lemma 6.2) and in §7 (proof of Proposition 7.4, p. 88) to produce automorphic lifts Steinberg at `Σ₀`.
- `p > max(n, 3)` gives `p > 3` and `p ∤ n` for ModularityAndLanglandsExtensions §4.2 and §8.7, and `p > n` for §7.3; for `n = 3` it excludes `p = 3`, where `p | n` as well.
- At `v ∈ T₀` the conclusion places the local representation on `R̄_v`, not equal to a prescribed `ρ_v`: the component condition is the most a global lift can achieve.

### 8.16 Finiteness with an unobstructed auxiliary place

Keep the hypotheses of §8.7 with the first clause of (5) (`F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}`) replaced by: there is a place `w ∤ l` of `F` at which `ρ̄` is unramified and `H⁰(G_{F_w}, ad ρ̄(1)) = 0`; and add: `ρ̄(G_{F(ζ_l)})` has no nontrivial quotient of `l`-power order. Prove that `R^univ_𝒮` is finite over `Λ`. For an unramified residual local representation with arithmetic Frobenius matrix `Φ`, the vanishing condition says that `X ↦ q_w ΦXΦ^{−1} − X` is invertible on `M_n(k)`. Tho24, Theorem 7.5 (pp. 44–45), states the lifting variant and indicates in one paragraph that the old clause is used only to choose an auxiliary place; NT26, proof of Proposition 3.9 (pp. 20–21), uses the finiteness variant. The added cyclotomic hypothesis replaces the scalar Frobenius element that the old clause provides for the Taylor–Wiles argument (§7.17, second form); the variant without it is not claimed.

*Route.* (1) At a place above `w` split over `F⁺`, chosen by Chebotarev absolutely unramified of odd residue characteristic, every lift of `ρ̄|G_{F_w}` is unramified: the framed lifting ring is formally smooth of relative dimension `n²` because `H²(G_{F_w}, ad ρ̄) = H⁰(G_{F_w}, ad ρ̄(1))^∨ = 0` (LocalGaloisDeformationRings §2.4), the unramified quotient is formally smooth of the same relative dimension `n²` (LocalGaloisDeformationRings §2.2), and a surjection between such power series rings over `O` is an isomorphism; so the unrestricted condition there agrees with the unramified one, which is what the places of `A` provide in ANT20 §3.3. (2) Take at `w` a principal congruence level deep enough to be torsion free, so the level is neat (AdelicAlgebraicGroups §4.3); every automorphic point in the `𝔪`-localization has Galois representation lifting `ρ̄`, hence unramified at `w`, so the Hecke-algebra comparison `P → 𝕋_𝔪` of §§3.10–3.13 holds at this level with the same deformation problem, and `𝕋_𝔪` is finite over `Λ` (§3.11). (3) The cotangent control of §7.17 in its first form applies by the added cyclotomic hypothesis; §§7.19, 8.4–8.6 then go through with `A` replaced by the places above `w`, and the extension construction of §8.7 descends finiteness.

*Needs:* §§3.10–3.11, 7.17, 7.19, 8.4–8.6, 8.7; LocalGaloisDeformationRings §§2.2, 2.4; AdelicAlgebraicGroups §4.3; ArithmeticGaloisDuality §R02.4.2 (local duality); Chebotarev Layer 10.

**Checks.**

- The condition retains the Tate twist: for `n = 1` and `ρ̄` unramified at `w`, `H⁰(G_{F_w}, k(1)) = 0` exactly when `q_w ≢ 1 mod l`; without the twist `H⁰(G_{F_w}, k) = k ≠ 0` always.
- The auxiliary place need not have scalar residual Frobenius: for `n = 2`, `Φ = diag(1, a)` with `a ∉ {1, q_w^{±1}}` and `q_w ≢ 1 mod l`, the eigenvalues of `X ↦ q_w ΦXΦ^{−1}` on `M₂(k)` are `q_w, q_wa, q_wa^{−1}, q_w`, none equal to `1`, so the condition holds while `Φ` is not scalar.
- Unramified residual data alone do not force lifts to be unramified (LocalGaloisDeformationRings §2.2): for `n = 1`, `O = ℤ_l[ζ_l]`, `ϖ = ζ_l − 1` and `q_w ≡ 1 mod l`, the tame character sending an inertia generator to `ζ_l = 1 + ϖ` and arithmetic Frobenius to `1` lifts the trivial character and is ramified (`ζ_l^{q_w} = ζ_l`), and `H⁰(G_{F_w}, k(1)) = k ≠ 0`.

### Examples

- For two characters with ratio of large order and a Steinberg place, §8.9 gives finiteness and §8.10 ordinary lifts of every weight (NT21 §5).
- The symmetric power of an `ι`-ordinary Hilbert modular form with a Steinberg place is automorphic by §8.8 (CT14, Proposition 5.1).
- For `n = 2` and `|R| = 1`, the connectedness argument needs extension degrees with `d₀, d_l > 9` (§8.5).

### Dependencies

Layers 0, 2, 3, 4, 5, 6 and 7 (§§0.1, 0.9, 0.11, 2.1–2.2, 3.5, 3.9–3.13, 4.6, 5.7–5.8, 6.1, 7.2–7.19); ModularityAndLanglandsExtensions §4.2; PotentialAutomorphyInfrastructure §§2.5, 3.44; GlobalGaloisDeformations §§4.2, 8.1–8.4; LocalGaloisDeformationRings §§1.3, 2.2, 2.4–2.5, 2.15, 2.18, 2.24, 2.26, 2.28, 3.4, 3.11, 3.13, 6.12, 6.24; DeformationAndDerivedPatchingAlgebra §6.6; ArithmeticGaloisRepresentations §§7.4, 7.9; ArithmeticGaloisDuality §R02.4.2; AdelicAlgebraicGroups §§1.1, 4.3; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6; Chebotarev Layer 10; Mathlib and Tau Ceti as in §§8.1, 8.6.

## Layer 9: Adjoint Bloch–Kato Selmer groups and semistable pseudodeformation rings of unitary type

This layer builds the objects around the vanishing of adjoint Bloch–Kato Selmer groups of unitary type and draws its consequences for semistable pseudodeformation rings; the vanishing theorem for automorphic Galois representations with enormous image (NT23, Theorem A) is ModularityAndLanglandsExtensions §4.1. The layer transports the genericity of Weil–Deligne representations of AutomorphicGaloisRepresentationsPartII AG2.6 to Galois representations and compares the Bloch–Kato `f` and `g` conditions at generic places, constructs the adjoint Selmer groups of a conjugate self-dual representation and the conjugate self-dual semistable pseudodeformation ring, compares the tangent space of that ring with the Selmer group integrally up to bounded denominators and rationally exactly, and deduces that the ring is its residue field at an automorphic point with enormous image. Selmer groups with local conditions and the Bloch–Kato `f` condition are SelmerIwasawaCohomology §§2.1, 2.9, 4.9; continuous determinants and pseudodeformation rings are IntegralHeckeAndGaloisDeterminants Layer 0 and LocalGaloisDeformationRings §F.2.11.

### 9.1 Generic Galois representations

Use the genericity of Weil–Deligne representations of AutomorphicGaloisRepresentationsPartII AG2.6 (generic monodromy orbits and local genericity): a Weil–Deligne representation `(r, N)` of `W_K`, `K/ℚ_p` finite, over a field of characteristic zero is generic when `Hom_{WD}((r, N), (r(1), N)) = 0`, where `r(1)` is the twist by the character of `W_K` corresponding to `|·|_K` under `Art_K` (geometric normalization), and an irreducible admissible representation of `GL_n(K)` is generic exactly when its Weil–Deligne parameter is. That predicate and that criterion are AG2.6's and are not restated here. Define: a continuous `ρ : G_K → GL_n(Q̄_l)` (de Rham when `l = p`) is *generic* if `WD(ρ)` is generic in that sense (NT23, Definition 1.1, p. 5, after Allen's Definition 1.1.2). Prove the following transport statements, which AG2.6 does not contain: (1) if `WD(ρ)^{F-ss}` is generic then `ρ` is generic; (2) if `WD(ρ)^{F-ss} ≅ rec^T_K(π)` for a generic irreducible admissible `π` of `GL_n(K)`, then `ρ` is generic (Allen, Lemma 1.1.3); (3) if `WD(ρ)` is pure then `ρ` is generic; (4) if `ρ|G_{K′}` is generic for a finite `K′/K` then `ρ` is generic. AutomorphicGaloisRepresentationsPartII AG2.7 (local residual genericity) is the residual, unramified notion of Allen et al., distinct from this one.

*Route.* (1) A morphism `f : (r, N) → (r(1), N)` intertwines `r(Frob)` with `q^{−1}r(Frob)`, hence their semisimple parts, so it is a morphism of the Frobenius semisimplifications. (2) AG2.6's criterion makes `rec_K(π)` generic; `rec^T_K(π) = rec_K(π ⊗ |det|^{(1−n)/2})` differs by a character twist, which does not change the Hom space; then apply (1). (3) A morphism between pure representations of weights differing by `2` vanishes. (4) Restriction to `W_{K′}` is injective on morphisms, and `|·|_{K′}` is `|·|_K ∘ N_{K′/K}`.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.6 (generic monodromy orbits and local genericity: the predicate and the generic local Langlands criterion); ArithmeticGaloisRepresentations §§2.4–2.5 (Weil–Deligne representations, Frobenius semisimplification and purity).

**API.**

- If `WD(ρ)^{F-ss}` is generic then `ρ` is generic.
- A `ρ` whose Frobenius-semisimplified Weil–Deligne representation is `rec^T_K` of a generic representation is generic; a `ρ` with pure Weil–Deligne representation is generic.
- Genericity after restriction to a finite extension implies genericity.

**Checks.**

- A character `ρ` with `WD(ρ) = (1, 0)` is generic: `Hom_{W_K}(1, |·|) = 0` since `q ≠ 1`.
- A `ρ` with `WD(ρ) = (1 ⊕ |·|, 0)` is not generic: the summand `|·|` of `r` maps isomorphically onto the summand `1(1) = |·|` of `r(1)`, a one-dimensional Hom space. The Tate-curve representation, with `WD(ρ) = (1 ⊕ |·|, N)` and `N` nonzero linking the two summands, is generic: the Hom space is zero. A Galois-side definition through `ρ|W_K` alone would not see `N` and would get the second case wrong.
- If `WD(ρ) = (r, 0)` with `r` irreducible, `ρ` is generic: `r ⊗ |·| ≇ r` because their determinants differ by `|·|^{dim r}`.

### 9.2 Bloch–Kato local conditions at generic places

Let `K/ℚ_l` be finite (`l` any prime), `E/ℚ_p` finite and `ρ : G_K → GL_n(E)` continuous, de Rham if `l = p`. Define `H¹_f(K, ad ρ)` and `H¹_g(K, ad ρ)` as the kernels of the maps to `H¹(K, ad ρ ⊗ B_cris)` and `H¹(K, ad ρ ⊗ B_dR)` if `l = p`, and as `H¹_ur` and `H¹` if `l ≠ p` (SelmerIwasawaCohomology §4.9 for the `f` condition; PadicHodgeTheory §3.3 for the period rings). Prove that `H¹_f(K, ad ρ) = H¹_g(K, ad ρ)` if and only if `ρ` is generic; in particular, for generic `ρ`, every de Rham self-extension of `ρ` lies in `H¹_f` when `l = p`, and `H¹(K, ad ρ) = H¹_ur(K, ad ρ)` when `l ≠ p` (NT23 §1, after Allen's Remark 1.2.9; NT21, proof of Proposition 2.11).

*Route.* For `l ≠ p`: `dim H¹_ur = h⁰`, the local Euler characteristic is zero and local duality gives `h² = dim Hom_{G_K}(ρ, ρ(1))`, so `h¹ − h⁰` is the dimension of the space of morphisms `WD(ρ) → WD(ρ)(1)`. For `l = p`: `dim H¹_g − dim H¹_f = dim D_cris((ad ρ)^∨(1))^{φ=1}` (Bloch–Kato), which is the dimension of the space of morphisms of `(φ, N, Gal)`-modules `D_pst(ρ) → D_pst(ρ(1))`, equal to that of morphisms `WD(ρ) → WD(ρ)(1)`.

*Needs:* §9.1; SelmerIwasawaCohomology §4.9; PadicHodgeTheory §§3.3, 5.3; ArithmeticGaloisDuality §§R02.4.2, D7.4 (local duality and the local Euler characteristic).

**Checks.**

- For `ρ` unramified at `l ≠ p` with Frobenius eigenvalues `α_i`, the condition is `α_i ≠ qα_j` for all `i, j`; for `n = 2` and `(α₁, α₂) = (1, q)`, `H¹(K, ad ρ)` is strictly larger than `H¹_ur`.
- For `n = 1` and `K = ℚ_p = l`, `ad ρ = E` and the trivial parameter is generic. Correspondingly `H¹_f(ℚ_p, E) = H¹_g(ℚ_p, E)` is the unramified line in the two-dimensional `H¹(ℚ_p, E)`: `D_cris(E(1))^{φ=1} = 0`, and the ramified class `log ∘ ε` gives an extension that is not Hodge–Tate.
- The Tate-curve parameter `(1 ⊕ |·|, N ≠ 0)` is generic, so a semistable Steinberg-type local representation has `H¹_f = H¹_g` for its adjoint.

### 9.3 The adjoint Bloch–Kato Selmer group of a conjugate self-dual representation

Let `F` be CM, `E/ℚ_p` finite with ring `O`, `S` a finite set of finite places of `F⁺` containing those above `p`, and `r : G_{F⁺,S} → 𝒢_n(O)` continuous with `ρ = r|G_{F,S}`, de Rham above `p`. `G_{F⁺}` acts on `ad ρ = 𝔤𝔩_n(E)` through `ad ∘ r` (`(g, µ)` by conjugation, `j` by `X ↦ −ᵗX`), so complex conjugation acts by `X ↦ −X^*`, the adjoint for the perfect pairing specified by `r(c_v)`; this pairing is symmetric when `r` is totally odd. Construct `H¹_f(F⁺, ad ρ) ⊂ H¹_{g,S}(F⁺, ad ρ) ⊂ H¹(G_{F⁺,S}, ad ρ)`, the first cut out by the local `f` conditions at every `v ∈ S` (it does not change when `S` grows), the second by the `g` conditions at the places above `p` only (it depends on `S`) (SelmerIwasawaCohomology §§2.1, 2.9). Construct the integral versions (NT23 §2.4, pp. 16–17): for `S` split in `F` and `ρ ⊗ E` absolutely irreducible and semistable with Hodge–Tate weights in `[a, b]`, with `W = ad ρ` over `O`, `W_m = W ⊗ O/ϖ^m`, `W_E = W ⊗ E`, `W_{E/O} = W_E/W`, let `H¹_{𝓛_S}(F⁺, W_m)` be cut out by the unramified classes outside `S`, all classes at `S − S_p`, and at `v ∈ S_p` the classes of self-extensions of `ρ|G_{F_ṽ} ⊗ O/ϖ^m` that are subquotients of lattices in semistable representations with weights in `[a, b]`; `H¹_{𝓛_S}(F⁺, W_E) = (lim H¹_{𝓛_S}(F⁺, W_m)) ⊗ E` and `H¹_{𝓛_S}(F⁺, W_{E/O}) = colim H¹_{𝓛_S}(F⁺, W_m)`.

*Route.* Hochschild–Serre for `F/F⁺` identifies rational `H¹` over `F⁺` with the invariants of the twisted `c`-action over `F`, since `2` is invertible in `E` even at `p = 2` (ArithmeticGaloisDuality §R02.2.3); integral versions need separate torsion control. The local conditions are §9.2.

*Needs:* §9.2; SelmerIwasawaCohomology §§2.1, 2.9, 4.9; ArithmeticGaloisRepresentations §§7.2, 7.4 (adjoint representations, `𝒢_n`); ArithmeticGaloisDuality §R02.2.3; PadicHodgeTheory §3.3.

**API.**

- `H¹_f(F⁺, ad ρ) ⊂ H¹_{g,S}(F⁺, ad ρ)`, with equality when `ρ|G_{F_ṽ}` is generic for every `v ∈ S` (§9.2; NT23, Proposition 2.17(3)).
- `H¹_{g,S}(F⁺, ad ρ)` is the tangent space at `r` of polarized deformations with fixed multiplier, unramified outside `S` and de Rham above `p` (their `E[ε]`-points); `H¹_f` is the subspace cut out by the `f` conditions.
- Twisting `r` by a `𝒢_1`-valued character of `G_{F⁺}` does not change `ad ρ` or the Selmer groups.
- The involution induced by `G_{F⁺}` on the integral Selmer groups does not depend on the lift of `c`.
- `H¹_f(F⁺, ad ρ)` is SelmerIwasawaCohomology's Selmer module for the Bloch–Kato local conditions.

**Checks.**

- For `n = 1`, `ad ρ = E(δ_{F/F⁺})` (`j` acts by `−1`) and `H¹_f(F⁺, E(δ_{F/F⁺})) ⊂ H¹_f(F, E)^{c=−1} = 0`: an everywhere unramified homomorphism `G_F → E` factors through the finite class group. The same argument with a ray class group gives `H¹_{g,S}(F⁺, E(δ_{F/F⁺})) = 0`.
- The conditions are not vacuous: for `n = 1`, `H¹(G_{F⁺,S}, E(δ_{F/F⁺}))` has dimension at least `[F⁺ : ℚ]` by the global Euler characteristic formula (`δ_{F/F⁺}(c_v) = −1` at every real place), while `H¹_f = 0`.
- For odd `r` the ambient group never vanishes: `dim H¹(G_{F⁺,S}, ad ρ) ≥ [F⁺ : ℚ]·n(n + 1)/2`, because `c_v` fixes a subspace of `ad ρ` of dimension `n(n − 1)/2`; for `n = 1` this is the previous bound.

### 9.4 Semistable conjugate self-dual pseudodeformation rings

Let `F` be a number field, `S ⊇ {v | p}` finite, `ρ̄ : G_{F,S} → GL_n(k)` with group determinant `D̄`, and `a ≤ b`. The ring `R_{D̄,S}` of continuous determinants lifting `D̄` is LocalGaloisDeformationRings §F.2.11; for `q ≥ 0` there is `g₀ = g₀(S, D̄, q)` with `R_{D̄,S∪Q}` a quotient of `O⟦X₁, …, X_{g₀}⟧` whenever `|Q| ≤ q` (NT23, Lemma 2.13, p. 13). Let `𝓔^{[a,b]}_{F,S}` be the category of finite `ℤ_p[G_{F,S}]`-modules that are, at each `v | p`, subquotients of lattices in semistable representations with Hodge–Tate weights in `[a, b]` (`ε` of weight `−1`). Construct `R^{[a,b]}_{D̄,S}`, the quotient of `R_{D̄,S}` representing determinants with a Cayley–Hamilton model `(B, D′)` all of whose finite quotients lie in `𝓔^{[a,b]}_{F,S}` (NT23, Proposition 2.14, p. 13, from Wake–Wang-Erickson's Theorem 2.5.5). In the conjugate self-dual case (`F` CM, `S` the places above a set of places of `F⁺` split in `F`, `χ : G_{F⁺,S} → O^×` continuous with `χε^w` of finite order and unramified above `p`, `D̄^{c,∨} ⊗ χ̄ = D̄`, `a + b = w`), construct `R_S`, the quotient representing the determinants fixed by `D′ ↦ (D′)^{c,∨} ⊗ χ|G_{F,S}`. The ring `P` of NT21B §2 is `R_S` for `t̄ = det Sym^{n−1} r̄|G_K`, `[a, b] = [0, n − 1]` and multiplier `ε^{1−n}`. The constrained quotient can be zero when `D̄` has no Cayley–Hamilton model in the stable category; it is an object of `C_O` only when it is nonzero, which NT23's statement of Proposition 2.14 omits.

*Route.* `𝓔^{[a,b]}_{F,S}` is a stable condition in the sense of Wake–Wang-Erickson (closed under subquotients, finite products and the inverse limits involved), so the subfunctor is represented by a quotient (the stable category and its determinant quotient are recorded as a supplier gap on LocalGaloisDeformationRings; its bounded-height lattice theory is LocalGaloisDeformationRings §§1.8, 3.2). `D′ ↦ (D′)^{c,∨} ⊗ χ` is an involution (`c²` acts trivially on determinants, `χ^c = χ`) preserving the condition exactly because `a + b = w`: duality sends `[a, b]` to `[−b, −a]` and the twist shifts by `w`. Lemma 2.13: deformations factor through the Galois group of the maximal pro-`p` extension unramified outside `S ∪ Q` of the field cut out by `ρ̄` (Che14, Lemma 3.8), generated by a bounded number of elements.

*Needs:* §2.2; LocalGaloisDeformationRings §§1.8, 3.2, F.2.11, with the stable category recorded as a supplier gap; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1.

**API.**

- `R_{D̄,S∪Q}` is a quotient of a power series ring in `g₀(S, D̄, q)` variables when `|Q| ≤ q`.
- A map `R_{D̄,S} → O_{E′}` factors through `R^{[a,b]}_{D̄,S}` if and only if the associated semisimple representation is semistable at every `v | p` with Hodge–Tate weights in `[a, b]`.
- For absolutely irreducible `ρ̄`, `R^{[a,b]}_{D̄,S}` is the quotient of the unframed deformation ring classifying deformations all of whose finite quotients lie in `𝓔^{[a,b]}_{F,S}`; no reducedness or `O`-flatness is asserted, so it need not be Kisin's ring.
- `R_S` is the coinvariant quotient `R^{[a,b]}_{D̄,S}/(x − c·x)` for the involution.

**Checks.**

- For `n = 1` and `D̄ = ψ̄`, `R_{D̄,S} ≅ O⟦G^{ab}_{F,S}(p)⟧`, with universal character the Teichmüller lift of `ψ̄` times the tautological one. The `O_{E′}`-points of `R^{[a,a]}_{D̄,S}` are the lifts `ψ` with `ψ|I_{F_v} = ε^{−a}|I_{F_v}` at every `v | p`, and the ring is zero unless `ψ̄ε̄^a` is unramified above `p`.
- If `a > b`, `𝓔^{[a,b]}` contains only the zero module, no determinant of dimension `n ≥ 1` over a nonzero ring satisfies the condition, and the subfunctor is empty, with no representing object in `C_O`.
- For `p > 2`, `a = b = 0`, `F = ℚ` and `ρ̄ = ω` (residual cyclotomic), every semistable weight-zero representation is unramified (weak admissibility forces `N = 0`), so its lattice subquotients are unramified and cannot realize the ramified `ω`: the quotient is zero although `[a, b]` is nonempty.

### 9.5 Tangent spaces of semistable pseudodeformation rings

Prove (NT23, Proposition 2.15, p. 14, proof pp. 14–16): for a number field `F`, `S ⊇ {v | p}` and a lift `ρ : G_{F,S} → GL_n(O)` of `ρ̄` with `ρ ⊗ E` absolutely irreducible and semistable with Hodge–Tate weights in `[a, b]` at every `v | p`, with point `𝔮` of `R^{[a,b]}_{D̄,S}` and `W_m = ad ρ ⊗ O/ϖ^m`, the map `tr_m : H¹_𝓔(F, W_m) → Hom_O(𝔮/𝔮², O/ϖ^m)` sending `[φ]` to the determinant of `ρ_φ` over `O ⊕ εϖ^{−m}O/O` (with `H¹_𝓔` the classes whose restriction above `p` lie in `𝓔^{[a,b]}`) has kernel and cokernel killed by `p^c`, `c` depending only on `ρ`.

*Route.* The input is NT23 Proposition 2.7: for `ρ : Γ → GL_n(O)` absolutely irreducible over `E` there is `k₀` depending only on `ρ(Γ)` such that every lift of the determinant of `ρ` to `O ⊕ εE/O` becomes, after multiplying `ε` by `p^{k₀}`, the determinant of a lift of `ρ`, lifts with equal determinant become conjugate under `1 + εM_n(E/O)` after scaling, and the centralizer of a lift is scalar after scaling (supplier gap on IntegralHeckeAndGaloisDeterminants). Kernel of `tr_m`: if `tr ρ_φ = tr ρ`, `p^{k₀}φ` is a coboundary in `H¹(F, W_{E/O})`, and the kernel of `H¹(F, W_m) → H¹(F, W_{E/O})` is `H⁰(F, W_{E/O}) ⊗ O/ϖ^m`, of bounded exponent. Cokernel: a determinant with a Cayley–Hamilton model in `𝓔^{[a,b]}` comes from `ρ_φ` after scaling, and with `p^{k₁}M_n(O) ⊂ ρ(O[G_{F,S}])` its finite quotients lie in `𝓔^{[a,b]}` (Chenevier's description of the kernel of a determinant, Che14 Lemma 1.19).

*Needs:* §9.4; IntegralHeckeAndGaloisDeterminants §§0.2, 1.1–1.3, with the bounded-denominator comparison recorded as a supplier gap; LocalGaloisDeformationRings §F.2.11.

**Checks.**

- For `n = 1` the comparison is exact (`c = 0`): `R_{D̄,S} = O⟦G^{ab}(p)⟧` and both sides are `Hom(G^{ab}_{F,S}(p), O/ϖ^m)` with the same local conditions.
- Absolute irreducibility of `ρ ⊗ E` is needed: for `ρ = χ₁ ⊕ χ₂` the determinant does not see the extension classes in `H¹(F, χ₁χ₂^{−1})`, and `tr_m` has unbounded kernel as `m` grows when that group has positive rank.
- The source of `tr_m` is `H¹_𝓔`, not all of `H¹`. For `n = 1`, `F = ℚ`, `p` odd, `S = {p}`, `[a, b] = [0, 0]` and `ρ` trivial, `H¹(G_{ℚ,S}, O/ϖ^m) = Hom(Gal(ℚ(ζ_{p^∞})/ℚ)(p), O/ϖ^m) ≅ O/ϖ^m` is the cyclotomic direction, ramified at `p`; a semistable weight-zero character is unramified, so `H¹_𝓔 = 0` and `R^{[0,0]}_{D̄,S} = O` has zero cotangent space. On all of `H¹` the map would have kernel `O/ϖ^m`, killed by no fixed `p^c`.

### 9.6 Integral polarized trace equivariance and the self-dual Selmer comparison

In the conjugate self-dual set-up of §9.4, let `r : G_{F⁺,S} → 𝒢_n(O)` restrict to `ρ` with `ρ ⊗ E` absolutely irreducible and semistable at every place above `p` with Hodge–Tate weights in `[a, b]`, `S` split in `F`, `χ = ν ∘ r` crystalline of weight `w` and `a + b = w`. Prove: (1) at the determinant point of `ρ` and for every `m ≥ 1`, the `O`-linear trace map `tr_m : H¹_𝓔(F, ad ρ ⊗ O/ϖ^m) → Hom_O(𝔮/𝔮², O/ϖ^m)` of §9.5 commutes with the involution induced by `ad r` on the source and by `D′ ↦ (D′)^{c,∨} ⊗ χ` on the target, before inverting `p`; both involutions square to the identity and the action on `H¹` does not depend on the lift of `c` (NT23, proof of Proposition 2.16, p. 17); (2) `tr_m` induces `tr_{m,S} : H¹_{𝓛_S}(F⁺, W_m) → Hom_O(𝔮_S/𝔮_S², O/ϖ^m)` with kernel and cokernel killed by `p^d`, `d` depending only on `r` (NT23, Proposition 2.16, pp. 16–17); (3) after taking limits and inverting `p`, `H¹_{𝓛_S}(F⁺, W_E) ≅ Hom_O(𝔮_S/𝔮_S², E)`, the image of `H¹_{𝓛_S}(F⁺, W_E)` in `H¹(G_{F⁺,S}, W_E)` is `H¹_{g,S}(F⁺, W_E)`, and if `ρ|G_{F_ṽ}` is generic for every `v ∈ S` then `H¹_{g,S}(F⁺, W_E) = H¹_f(F⁺, W_E)` (NT23, Proposition 2.17, p. 17).

*Route.* At torsion level `m` a cocycle gives `(1 + εφ)ρ` over `O ⊕ εϖ^{−m}O/O`, whose determinant gives `tr_m`. Conjugating this lift and then dualizing and twisting by `χ` agrees with the cocycle action of `ad r`; naturality of the determinant classifying map gives integral equivariance. The bounded-denominator determinant comparison over `O ⊕ ε(E/O)` with its `ε`-scaling maps is the input recorded as a supplier gap on IntegralHeckeAndGaloisDeterminants (NT23, Proposition 2.7, pp. 7–9). (2) follows from (1) by taking `c`-invariants in §9.5. (3): Liu's theorem identifies the limit of the torsion semistable classes with semistable self-extensions (part of the LocalGaloisDeformationRings gap of §9.4); a de Rham extension of semistable representations is semistable (PadicHodgeTheory §6.3), so the image is `H¹_{g,S}`; at generic places `f = g` (§9.2).

*Needs:* §§9.2–9.5; IntegralHeckeAndGaloisDeterminants §§0.2, 1.1, with the bounded-denominator comparison recorded as a supplier gap; ArithmeticGaloisDuality §R02.2.3; PadicHodgeTheory §6.3; LocalGaloisDeformationRings §§3.2, F.2.11, with Liu's theorem recorded in the stable-category supplier gap.

**Checks.**

- The semistability hypothesis places the determinant point in `R_S`: for `n = 1`, a character of weight `1` with `[a, b] = [0, 0]` has no such point, so no cotangent space at it is defined.
- For `n = 1` both involutions are `φ ↦ −φ(c · c⁻¹)` on `Hom(G_F, O/ϖ^m)`. On the source this is the cocycle action of `ad r(c)`, with `j` acting by `−1`. On the target, `ψ(1 + εφ)` goes to `ψ^{c,−1}χ(1 − εφ^c)`. The two agree integrally, at every `m`.
- The condition `a + b = w` is what makes the involution preserve the semistable condition. For `n = 1` and `[a, b] = [a, a]`, it sends a lift of weight `a` to one of weight `w − a`, so it preserves the condition exactly when `w = 2a`.
- Changing the lift `c` of complex conjugation by `g ∈ G_F` changes the action by the inner automorphism `ad ρ(g)`, which acts trivially on `H¹`.
- For `n = 1`, rationally both sides of (3) vanish. `H¹_{g,S}(F⁺, E(δ_{F/F⁺})) = 0` by §9.3's first Check, and the cotangent space of `R_S` at the point, tensored with `E`, is zero: the anti-invariant part of `G^{ab}_{F,S}(p)` with weight fixed above `p` is finite.

### 9.7 The pseudodeformation ring is its residue field at an automorphic point

Let `K/F` be a CM extension of a totally real field, `S` a finite set of places of `F` containing those above `p`, all split in `K`, and `P = R_S` the conjugate self-dual semistable pseudodeformation ring of §9.4 for `t̄`, `[a, b]` and `χ` with `a + b = w`. Let `𝔭′` be the point of the determinant of `r_{Π′,ι}`, `Π′` a regular algebraic cuspidal polarized automorphic representation of `GL_n(𝔸_K)` with multiplier `χ`, unramified outside `S`, semistable with Hodge–Tate weights in `[a, b]` above `p`, with `r_{Π′,ι}(G_{K(ζ_{p^∞})})` enormous. Prove that `P_{(𝔭′)} = E` (NT21B, proof of Theorem 2.1, p. 13, citing NT23 Theorem A; NT26, proof of Theorem 4.1, p. 35). Genericity at the places of `S` is automatic for cuspidal `Π′` (§9.1, local–global compatibility).

*Route.* By §9.6(3), `Hom_O(𝔭′/𝔭′², E) ≅ H¹_{g,S}(F, ad r_{Π′,ι}) = H¹_f(F, ad r_{Π′,ι})`, which vanishes by ModularityAndLanglandsExtensions §4.1 applied to a twist of `Π′` of unitary type: the twist changes neither the adjoint representation nor enormity, which concerns only the adjoint action and the eigenprojectors of elements with distinct eigenvalues (NT23, Definition 2.23, p. 20, and proof of Theorem 5.2, p. 40); the cotangent space of the Noetherian local ring `P_{(𝔭′)}` is zero, so it equals its residue field by Nakayama.

*Needs:* §§9.1, 9.4, 9.6; ModularityAndLanglandsExtensions §4.1; ArithmeticGaloisRepresentations §7.10 (enormous image); AutomorphicGaloisRepresentationsPartII AG2.2 (twisting into unitary type), AG2.5–AG2.6.

**Checks.**

- NT21B (p. 13) uses it to show that the patched ring is regular of dimension `q + 4|S ∪ S_∞| − 1` at the point, so a unique irreducible component passes through it; NT26 (p. 35) likewise.
- NT21B and NT26 cite NT23 in an earlier numbering in which subsections share the counter with statements: "Proposition 2.21", "Example 2.34" and "Theorem 4.32" there are Proposition 2.17, Example 2.29 and Theorem 4.28 of arXiv v3.
- `P_{(𝔭′)} = E` makes `𝔭′` a minimal prime of `P`, so the irreducible component of `Spec P` through `𝔭′` is `Spec P/𝔭′`, which has dimension one. Every characteristic-zero deformation of the determinant of `r_{Π′,ι}` that is conjugate self-dual and semistable with weights in `[a, b]` is therefore trivial to first order.

### 9.8 Ordinary tangent vectors of trivial weight lie in `H¹_g`

Let `r : G_{F⁺,S} → 𝒢_n(E)` be continuous with `ρ = r|G_{F,S}` ordinary of weight `λ` above `p` (§0.1), and `r_ε` a deformation to `𝒢_n(E[ε])` with the same multiplier, unramified outside `S`, such that at each `v ∈ S_p` the flag lifts to a stable flag of `ρ_ε` with graded characters lifting those of `ρ`. Prove that if the image of `r_ε` in the tangent space of weight space vanishes (the graded characters are constant on `O^×_{F_ṽ}`), then `ρ_ε|G_{F_ṽ}` is ordinary of weight `λ_ṽ` over `E[ε]`, hence potentially semistable, and the class of `r_ε` lies in `H¹_{g,S}(F⁺, ad ρ)` (Ger19, Lemma 3.3.2(1) of the preprint, Lemma 3.9 of the published version, with `B = E[ε]`; NT21, Lemma 2.7 and proof of Theorem 2.27, pp. 26–27, 43). If moreover `ρ` is generic at the places of `S` and `H¹_f(F⁺, ad ρ) = 0` (for automorphic `ρ` of unitary type with enormous image, ModularityAndLanglandsExtensions §4.1), the map from the ordinary tangent space to the tangent space of weight space is injective.

*Route.* With constant inertial characters, `ρ_ε|G_{F_ṽ}` is upper triangular over `E[ε]` with diagonal characters agreeing with the algebraic characters on an open subgroup of inertia, i.e. ordinary of weight `λ_ṽ` over the finite local `E`-algebra `E[ε]`; the ordinary period comparison (LocalGaloisDeformationRings §0.3, which applies over finite local `E`-algebras) makes it potentially semistable, hence de Rham over `E`, so the class lies in `H¹_g` above `p`; away from `p` there is no condition in `H¹_{g,S}`. At generic places `H¹_{g,S} = H¹_f` (§9.2).

*Needs:* §§0.1, 9.2–9.3; LocalGaloisDeformationRings §§0.3, 1.7; PadicHodgeTheory §3.3.

**Checks.**

- NT21 §2.18.1 (proof of Theorem 2.27, p. 43): with adjoint Selmer vanishing the ordinary locus is smooth at the classical point and the eigenvariety is locally isomorphic to it there.
- The weight must not move. Take `n = 1` and `F_ṽ = ℚ_p`. The tangent space of weight space is `Hom(ℤ_p^×, E)`, so the hypothesis says that `ψ` in `ρ_ε = ρ(1 + εψ)` is unramified, and the unramified line is `H¹_g(ℚ_p, E)` (§9.2). The weight direction `ψ = log ∘ ε` gives an extension that is not Hodge–Tate, so it is not in `H¹_g`.
- Dominance of `λ` is used: the labelled Hodge–Tate weights `λ_{τ,i} + n − i` are pairwise distinct, so the flag is unique and lifts uniquely to `E[ε]`.

### Examples

- For `n = 1` every construction is explicit: `ad ρ = E(δ_{F/F⁺})`, `H¹_f = 0` by finiteness of class groups, and the pseudodeformation ring is a completed group algebra (§§9.3–9.4).
- A twist of Steinberg at one place gives enormous image (NT23, Example 2.30), hence vanishing (ModularityAndLanglandsExtensions §4.1) and, for the semistable pseudodeformation ring at such an automorphic point, the residue-field conclusion of §9.7.

### Dependencies

Layers 0 and 2 (§§0.1, 2.2); ModularityAndLanglandsExtensions §4.1; SelmerIwasawaCohomology §§2.1, 2.9, 4.9; IntegralHeckeAndGaloisDeterminants §§0.2, 0.5, 1.1–1.3; LocalGaloisDeformationRings §§0.3, 1.7–1.8, 3.2, F.2.11; PadicHodgeTheory §§3.3, 5.3, 6.3; ArithmeticGaloisRepresentations §§2.4–2.5, 7.2, 7.4, 7.10; ArithmeticGaloisDuality §§R02.2.3, R02.4.2, D7.4; AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5–AG2.6, including AG2.6 (generic monodromy orbits and local genericity).

## Layer 10: Integral `R = T` for rigid residual representations and lifting from generic local domains

This layer proves the almost minimal integral `R = T` theorem of Liu–Tian–Xiao–Zhang–Zhu for rigid conjugate self-dual residual representations on unitary Shimura varieties of arbitrary signature, together with the multiplier parity it forces and rigidity for almost all primes. It then proves the modularity lifting theorem of Le–Le Hung–Levin–Morra for potentially crystalline representations of polynomially generic tame type, after fixing the dictionary between their Hodge–Tate convention and ours. Rigidity of a residual representation for `(Σ⁺_min, Σ⁺_lr)` and the level-raising local problems `𝒟^mix ⊃ 𝒟^unr, 𝒟^ram`, for both parities of the multiplier, are LocalGaloisDeformationRings §§2.20 and 2.12; this layer uses them as defined there.

The set-up throughout §§10.1–10.3: `F/F⁺` is CM, `N ≥ 2`, `ℓ` is an odd prime unramified in `F`, `E/ℚ_ℓ` is finite with ring `O` and residue field `k`, and `r̄ : Γ_{F⁺} → 𝒢_N(k)` has `r̄^{−1}(GL_N(k) × k^×) = Γ_F` and multiplier `η^µ ε_ℓ^{1−N}` with `µ ∈ ℤ/2` (`η = δ_{F/F⁺}`). `Σ⁺_min ⊇ Σ⁺_bad` (the places above primes ramified in `F`), `Σ⁺_lr` (inert in `F`, with `ℓ ∤ ‖v‖² − 1`) and `Σ⁺_ℓ` are pairwise disjoint, and `Σ⁺_lr = ∅` when `N` is odd. For rigid `r̄` (LocalGaloisDeformationRings §2.20), its global problem `𝒮` is the polarized problem with all liftings at `Σ⁺_min`, `𝒟^ram` at `Σ⁺_lr` and the Fontaine–Laffaille condition (LocalGaloisDeformationRings §1.6) above `ℓ` (LTXZZ, §3.6, after Definition 3.6.1, p. 29). The places of `Σ⁺_min ∪ Σ⁺_lr` need not split in `F`: minimal ramification at nonsplit places and polarized problems with nonsplit places are recorded as supplier gaps on LocalGaloisDeformationRings and GlobalGaloisDeformations.

### 10.1 Multiplier parity from patching dimensions

Let `r̄` be rigid for `(Σ⁺_min, Σ⁺_lr)` with global problem `𝒮` on `S = Σ⁺_min ∪ Σ⁺_lr ∪ Σ⁺_ℓ`, and `d = [F⁺ : ℚ]`. Put `A = |S|N²`, `f = Σ_{v∈Σ⁺_ℓ} [F⁺_v : ℚ_ℓ]·N(N − 1)/2`, `a = |Σ⁺_lr|`, `κ_µ = 0` for even `µ` and `κ_µ = −1` for odd `µ`, and `δ = 0` if `µ ≡ N mod 2`, `δ = 1` otherwise. Prove: with `T = S`, and for `b` large enough that `b` auxiliary Taylor–Wiles places kill the dual Selmer group, the polarized presentation needs `g = b − f − Ndδ − aκ_µ` generators over the local product. That product has relative dimension `A + f + aκ_µ` over `O`. The patched ring `R_∞` therefore has dimension `1 + A + b − Ndδ`. A nonzero patched module, finite free over `S_∞` of dimension `1 + A + b`, then forces `δ = 0`, that is `µ ≡ N mod 2` (LTXZZ, Lemma 3.6.6, pp. 32–33, and the proof of Theorem 3.6.3, p. 35, with the odd-multiplier correction below).

*Route.* Local terms: at `v ∈ Σ⁺_min` the minimal component is formally smooth of relative dimension `N²`. At `v ∈ Σ⁺_ℓ` the Fontaine–Laffaille ring has relative dimension `N² + [F⁺_v : ℚ_ℓ]N(N − 1)/2` (LocalGaloisDeformationRings §1.13). At `v ∈ Σ⁺_lr`, `𝒟^ram` has relative dimension `N² + κ_µ` and tangent defect `dim L_v − h⁰(ad r̄) = κ_µ` (LocalGaloisDeformationRings §2.12). For odd `µ`, the rank-two relation `((1 + x) + (−1)^{µ+1}(1 + y))z = 0` reads `(2 + x + y)z = 0`, and `2 + x + y` is a unit because `ℓ` is odd. Global term: the presentation formula (GlobalGaloisDeformations §8.4) has archimedean contribution `Σ_{v|∞} N(N + χ(c_v))/2`, with `χ(c_v) = (−1)^{µ+N+1}`. This is `dN(N − 1)/2 + Ndδ`. Each odd-`µ` level-raising place therefore adds one generator, cancelling its one-dimensional loss in the local product. Patching gives depth `≥ 1 + A + b`, and depth is at most the dimension of the support; since `N, d > 0`, `δ = 1` is impossible. The even-`µ` geometry of `𝒟^ram` (two components of `𝒟^mix`) may be used only after this step.

*Needs:* LocalGaloisDeformationRings §§1.13, 2.12, 2.20; GlobalGaloisDeformations §8.4, with presentations of polarized problems at nonsplit places recorded as a supplier gap; §4.3; DeformationAndDerivedPatchingAlgebra §§5.4–5.6; Mathlib `ringKrullDim`.

**Checks.**

- With `a = 0` the count is LTXZZ's Lemma 3.6.6, and no assumption that `µ` is even enters the parity deduction.
- At an odd-`µ` level-raising place both corrections are needed. The local product loses one dimension and the presentation gains one generator; using only the even-`µ` generator count would give `R_∞` of dimension `1 + A + b − Ndδ − a`, and the comparison with depth would no longer isolate `δ`.
- For `N = 2`, `d = 1` and `µ` odd, `χ(c_v) = +1`, so `δ = 1` and the archimedean term is `N(N + 1)/2 = 3` instead of `1`. The patched ring is `Nd = 2` dimensions short of the depth `1 + |S|N² + b` of `S_∞`, so `T_𝔪 = 0`.

### 10.2 The almost minimal integral `R = T` theorem for rigid residual representations

In the set-up above, let `ι_ℓ : ℂ ≅ Q̄_ℓ`. Let `ξ = (ξ_τ) ∈ (ℤ^N_≤)^{Σ_∞}` satisfy `ξ_{τ,i} = −ξ_{τ^c,N+1−i}`, with `a_ξ = min_τ ξ_{τ,1}` and `b_ξ = max_τ ξ_{τ,N} + N − 1`, and with its algebraic representation defined over `ι_ℓ^{−1}E`. Let `V` be a hermitian space of rank `N` over `F`, non-split at every `v ∈ Σ⁺_lr`, of signature `(p_τ, q_τ)` and `d(V) = Σ_τ p_τ q_τ`. Let `K` be a neat level, self-dual-lattice hyperspecial outside `Σ⁺_min ∪ Σ⁺_lr` and special maximal at `Σ⁺_lr`. Let `L_ξ` be the `O`-local system on the Shimura varieties `Sh(V, K′)`, `K′ ⊆ K`. Let `Σ⁺ ⊇ S` be finite and `𝔪 ⊂ T^{Σ⁺}_N` the maximal ideal attached to `r̄^♮` through the Frobenius eigenvalues at `v ∉ Σ⁺`. Assume:

- (D0) `ℓ > (b_ξ − a_ξ) + 2`;
- (D1) `ℓ > 2(N + 1)`;
- (D2) `r̄^♮|Gal(F̄/F(ζ_ℓ))` is absolutely irreducible;
- (D3) `r̄` is rigid for `(Σ⁺_min, Σ⁺_lr)`;
- (D4) for every finite `Σ⁺′ ⊇ Σ⁺` and every `K′ ⊆ K` equal to `K` outside `Σ⁺′`, `H^i_ét(Sh(V, K′), L_ξ ⊗_O k)_{𝔪} = 0` for `i ≠ d(V)`.

Let `T` be the image of `T^{Σ⁺}_N` in `End_O(H^{d(V)}_ét(Sh(V, K), L_ξ))`. Prove that if `T_𝔪 ≠ 0` then:

1. there is a canonical isomorphism `R^univ_𝒮 ≅ T_𝔪` of local complete intersections over `O`;
2. `H^{d(V)}_ét(Sh(V, K), L_ξ)_𝔪` is finite free over `T_𝔪`;
3. `µ ≡ N mod 2`.

This is LTXZZ, Theorem 3.6.3, p. 30. (D4) is automatic when `d(V) = 0` and follows from (D2) when `d(V) = 1`.

*Route.* (D1) and (D2) give adequacy of `r̄^♮(Γ_{F(ζ_ℓ)})` by the Guralnick–Herzig–Taylor–Thorne criterion (ArithmeticGaloisRepresentations §7.9), and (D0) gives `ζ_ℓ ∉ F`; Taylor–Wiles primes then come from §4.3. By (D4), `H^{d(V)}_𝔪` is `O`-torsion free, so `T_𝔪` is reduced and finite flat. Each point of `T_𝔪[1/ℓ]` gives a RACSDC base change of weight `ξ` whose Galois representation lifts `r̄^♮`; gluing gives `r_𝔪 : Γ_{F⁺} → 𝒢_N(T_𝔪)` of type `𝒮`. It is Fontaine–Laffaille above `ℓ` by local–global compatibility. At `Σ⁺_lr` it lies in `𝒟^ram`, because non-split `V_v` with special maximal `K_v` forces a single monodromy block of size two; this needs `N` even, which is the only reason for `Σ⁺_lr = ∅` when `N` is odd. The map `R^univ_𝒮 → T_𝔪` is surjective because `T_𝔪` is generated by traces. At Taylor–Wiles level the localized cohomology is free over `O[Δ_Q]` by (D4) and neatness (LTXZZ, Lemma 3.6.5). Patching with the dimensions of §10.1 gives (3) first, then the even-`µ` geometry at `Σ⁺_lr`, a regular `R_∞` and freeness by Auslander–Buchsbaum. This gives (1) and (2); `R^univ_𝒮` is a regular ring modulo `dim S_∞ − 1` elements and finite flat over `O`, hence a complete intersection. The integral cohomology of `Sh(V, K)` with its Hecke and Galois actions, the base change of its constituents and the monodromy at inert places are recorded as a supplier gap on AutomorphicGaloisRepresentationsPartII.

*Needs:* §§4.2–4.3, 10.1; LocalGaloisDeformationRings §§1.6, 1.13, 2.3, 2.12, 2.20, with minimal ramification at nonsplit places recorded as a supplier gap; GlobalGaloisDeformations §§8.1–8.4, with polarized problems at nonsplit places recorded as a supplier gap; ArithmeticGaloisRepresentations §§7.4, 7.9; AutomorphicGaloisRepresentationsPartII AG2.1a (compact-unitary geometry), AG2.2 (base change), AG2.3 (arbitrary regular conjugate-self-dual existence) and AG2.6, with the integral cohomology of unitary Shimura varieties of arbitrary signature recorded as a supplier gap; DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 6.4–6.5.

**Checks.**

- With `Σ⁺_lr = ∅` and `d(V) = 0` this is a minimal `R = T` theorem on a definite unitary group, like §4.5, but without requiring the places of `Σ⁺_min` to split in `F`.
- Conclusion (3) is consistent with §10.3, whose residual representations have multiplier `η^N ε_ℓ^{1−N}`.
- LTXZZ, Theorem 1.0.1: for `d(V) ≤ 1` and `Π` with a supercuspidal component, (D4) holds and §10.3 supplies (D2)–(D3) for almost all `ℓ`, so `R = T` and freeness hold unconditionally for almost all `ℓ`.
- For `N = 2`, `ξ_τ = (0, 4)` and `ξ_{τc} = (−4, 0)`: `a_ξ = −4`, `b_ξ = 4 + 1 = 5` and `(b_ξ − a_ξ) + 2 = 11`, a prime; (D0) is strict, so `ℓ = 11` is excluded and the first admissible prime is `13`. For odd `ℓ` the strict (D1) says the same as `ℓ ≥ 2(N + 1)`, since `2(N + 1)` is even.

### 10.3 Rigidity and residual irreducibility for almost all primes

Prove (LTXZZ, Corollary 4.1.2, Proposition 4.2.3, Theorem 4.2.6, pp. 36–40):

1. Let `A/F⁺` be an elliptic curve, `N ≥ 2`, and `r_{A,ℓ} : Γ_{F⁺} → 𝒢_N(ℤ_ℓ)` the extension of `Sym^{N−1}H¹_ét(A_{F̄}, ℤ_ℓ)|Γ_F` with multiplier `η^N ε_ℓ^{1−N}`. Let `Σ⁺ ⊇ Σ⁺_bad` be finite with `A` of good reduction outside `Σ⁺`. Then `r̄_{A,ℓ}` is rigid for `(Σ⁺, ∅)` for all but finitely many `ℓ`.
2. Let `Π` be RACSDC of `GL_N(𝔸_F)` with strong coefficient field `E`, and suppose `Π_w` is supercuspidal at some finite `w`. Then `ρ_{Π,λ}` is residually absolutely irreducible outside a finite set `Λ₁` of primes of `E` depending only on `Π_w`. Its restriction to `Gal(F̄/F(ζ_ℓ))` is residually absolutely irreducible outside a finite `Λ₂ ⊇ Λ₁`.
3. Under the same hypothesis, for every finite `Σ⁺ ⊇ Σ⁺_Π` and all but finitely many `λ`, the residual `𝒢_N`-extension `r̄_{Π,λ}` with multiplier `η^N ε_ℓ^{1−N}` is rigid for `(Σ⁺, ∅)`, in addition to the conclusions of (2).

*Route.* (1): each condition of rigidity excludes finitely many `ℓ`. At `v ∈ Σ⁺`, pass to a totally ramified extension over which `A` has good or split multiplicative reduction, and take `ℓ` larger than its degree and prime to `∏_{i≤N}(qⁱ − 1)`. In the multiplicative case, tame inertia acts on `Sym^{N−1}` through one unipotent Jordan block for `ℓ` prime to `v(j(A))`, so every lift is minimal (LocalGaloisDeformationRings §2.21). In the good case, with `α, β` the Frobenius eigenvalues of `A` at `v`, the eigenvalues of `Sym^{N−1}` are `α^{N−1−i}β^i` and their ratios are the `(α/β)^j` with `−(N − 1) ≤ j ≤ N − 1`; every lift is unramified once no such ratio reduces to `q` (LocalGaloisDeformationRings §2.20; §8.16). Each `(α/β)^j` has complex absolute value `1` and `q > 1`, so `(α/β)^j − q` is nonzero. For `j ≥ 0`, clear the denominator using the nonzero algebraic integer `α^j − qβ^j`; for `j < 0`, writing `h = −j > 0`, use `β^h − qα^h`. Exclude primes above the residue characteristic as well as prime divisors of the nonzero norms of these finitely many algebraic integers. This ensures the ratios are defined on reduction and none reduces to `q`. Testing only the exponents `N − 1 − 2i` is not enough (LTXZZ prints that test). Above `ℓ`, the Fontaine–Laffaille weights are `0, …, N − 1`, each once, for `ℓ ≥ N + 1`. (2): the Weil parameter of `Π_w` is `Ind_{W^b}^{W}(τ ⊗ χ)` with `τ` an irreducible representation of inertia. Its restriction to inertia can be reducible, so irreducibility must be read on the full Weil group. Excluding the primes below `w`, those dividing `b·#τ(I_{F_w})`, and those where `τ̄` becomes reducible or `b` drops, the reduction stays irreducible; local–global compatibility at `w` (AutomorphicGaloisRepresentationsPartII AG2.6) transfers this to `ρ̄_{Π,λ}`. For the restriction to `F(ζ_ℓ)`: excluding also `ℓ ≤ N(b_ξ − a_ξ) + 1` and `ℓ` below `Σ⁺_Π`, a reducible restriction would make `ρ̄` induced from some `F ⊆ F′ ⊆ F(ζ_ℓ)`. Fontaine–Laffaille with regular small weights forces `F′/F` unramified above `ℓ` (LTXZZ, Lemmas 4.2.4–4.2.5), and `F(ζ_ℓ)/F` is totally ramified there, so `F′ = F`. (3): minimal ramification is proved globally. For every choice of components `D_v` at `v ∈ Σ⁺`, the global ring with the Fontaine–Laffaille condition above `ℓ` is finite over `O` (§5.9) of dimension at least one (§5.8), hence has a `Q̄_ℓ`-point. Its automorphic `Π(D)` has bounded level, bounded weight and is congruent to `Π`; by finiteness and strong multiplicity one, `Π(D) ≅ Π` for large `ℓ`. Different components give non-isomorphic `Π(D)`, since a generic parameter is a smooth point of the generic fibre (§1.3). So each lifting space at `Σ⁺` has a single component, the minimal one.

*Needs:* §§1.3, 5.8–5.9, 8.16; LocalGaloisDeformationRings §§1.6, 2.3, 2.20–2.21, with minimal ramification at nonsplit places recorded as a supplier gap; AutomorphicGaloisRepresentationsPartII AG2.0 (strong multiplicity one), AG2.6 (local–global compatibility at the coefficient prime), AG2.7 (residual representation of `π`); EndoscopicTransferAndUnitaryTraceComparison §§10.23, 10.30.

**Checks.**

- For `N = 2`, (1) is the rank-two case, and rigidity for `(Σ⁺, ∅)` says that `r̄_{A,ℓ}` is unramified outside `Σ⁺ ∪ Σ⁺_ℓ`, Fontaine–Laffaille with weights `{0, 1}` above `ℓ` and has only minimal lifts at `Σ⁺`.
- A supercuspidal parameter induced from an unramified extension of degree `b > 1` has reducible restriction to inertia. The argument for (2) must use the full Weil-group parameter.
- The multiplier `η^N ε_ℓ^{1−N}` has `µ = N`, so §10.2(3) imposes no further condition on these examples.
- The ratios need not be algebraic integers: for Frobenius roots of `X² − X + 5`, the conjugate ratios have sum `(1² − 2·5)/5 = −9/5`. Thus `α/β` is not integral, although `α − 5β` is integral and nonzero; the denominator-cleared test in the route excludes only finitely many primes.
- Negative control for the ratio test: `y² = x³ + 3x + 2` over `𝔽₅` has `5` points, so its Frobenius polynomial is `X² − X + 5`, with roots `2, 6` modulo `7` and `α/β ≡ 5 = q`. For `N = 3` and `ℓ = 7` the exponents `N − 1 − 2i` give the ratios `{4, 1, 2}`, which miss `5`, and `7` divides none of `5 − 1`, `5² − 1`, `5³ − 1` (their product is `11904`); yet the residual symmetric square of `H¹` has geometric Frobenius eigenvalues `4, 5, 1` (arithmetic `2, 3, 1`), with the ratio `5 = q`. The matrices `Φ = diag(2, 10, 1)`, for arithmetic Frobenius, and `τ = I + 7E₂₁`, for a generator of tame inertia, satisfy `ΦτΦ^{−1} = I + 35E₂₁ = τ⁵`, so they define a `ℤ₇`-valued lift that reduces to the unramified residual data and is ramified. The full ratio test excludes `ℓ = 7`.

### 10.4 Source weights and the common Hodge–Tate convention

Let `λ^s` be a dominant (descending) weight in the convention of Le–Le Hung–Levin–Morra, with `η = (n − 1, …, 1, 0)` and `HT(ε) = +1` (LLHLM23, §1.9.2, p. 20). Define `λ^c_i = −λ^s_{n+1−i} − (n − 1)` at each embedding. This roadmap's common convention has `HT(ε) = −1` (AutomorphicGaloisRepresentationsPartII AG2.0). A representation with source labelled Hodge–Tate weights `λ^s + η` then has common weights `λ^c + η`. Prove that `λ^c` is dominant, that `λ ↦ λ^c` is an involution, that `λ^c_i + η_i = −(λ^s_{n+1−i} + η_{n+1−i})`, and that `V(λ^c) ≅ V(λ^s)^∨ ⊗ det^{1−n}` over a field of characteristic zero (AutomorphicFormsOnReductiveGroups §5.1). For integral coefficients use the dual-twist image of the source lattice; residual Jordan–Hölder factors transform by `σ ↦ σ^∨ ⊗ det^{1−n}`, by exactness of `O`-duality. Changing only the Hodge–Tate sign leaves the Galois representation, the tame type `τ`, its lowest alcove presentation and the `K`-type `σ(τ)` unchanged. Applying the dual-twist functor to the whole coefficient `V(λ^s) ⊗ σ(τ)` is a different operation, which also dualizes `σ(τ)`.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.0 (the common Hodge–Tate convention and weights); AutomorphicFormsOnReductiveGroups §5.1 (highest-weight characters and duals); ArithmeticLocallySymmetricSpaces §ALS.F.7 and PotentialAutomorphyInfrastructure §0.4 (integral dual Weyl lattices, for the transported lattice and its reduction).

**API.**

- The conversion `λ^s ↦ λ^c`, per embedding, and its inverse (itself).
- The converted `λ^c + η` is the negative of the reversed `λ^s + η`.
- Dominant source weights give dominant common weights.
- The coefficient comparison `V(λ^c) ≅ V(λ^s)^∨ ⊗ det^{1−n}`, with the transported lattice and the residual comparison.

**Checks.**

- For `n = 1`, source cyclotomic weight `1` becomes common weight `−1`.
- For `n = 2`, `λ^s = (0, 0)` becomes `λ^c = (−1, −1)`, with common Hodge–Tate multiset `{0, −1}`; keeping `λ = (0, 0)` in both conventions would give `{1, 0}`, the wrong sign.
- For `n = 3`, `λ^s = (2, 1, 0)` gives `λ^c = (−2, −3, −4)`. Source `λ^s + η = (4, 2, 0)` and common `λ^c + η = (0, −2, −4)` are negatives of each other after reversal, and `V(2, 1, 0)^∨ = V(0, −1, −2)` twisted by `det^{−2}` is `V(−2, −3, −4)`.

### 10.5 Modularity lifting from polynomially generic local domains

Let `p` be a prime unramified in the CM field `F` and `E/ℚ_p` finite with ring `O` of ramification index `e` and residue field `𝔽`. Let `r : G_F → GL_n(E)` be continuous with:

- (i) `r` unramified almost everywhere;
- (ii) at each place above `p`, `r` potentially crystalline of type `(λ^s + η, τ)` in the source convention of §10.4, with `τ` a tame inertial type admitting a lowest alcove presentation `(s, µ − η)` in which `µ` is `P_{λ^s+η,e}`-generic;
- (iii) `r^c ≅ r^∨ ε^{1−n}`;
- (iv) `r̄` semisimple at each place above `p`;
- (v) `r̄(G_{F(ζ_p)})` adequate and `ζ_p ∉ F̄^{ker ad r̄}`;
- (vi) `r̄ ≅ r̄_ι(π)` for a RACSDC `π` of common weight `λ^c` with `σ(τ)` a `K`-type for `π` at the places above `p`.

Prove that `r ≅ r_ι(π′)` for a RACSDC `π′` of common weight `λ^c` with `K`-type `σ(τ)` above `p` (LLHLM23, Theorem 9.2.1, p. 137). Here `P_{λ^s+η,e} ∈ ℤ[X₁, …, X_n]` is the polynomial of LLHLM23, Theorem 7.3.2(2), p. 111. It depends only on the weights `{λ^s_j + η_j}` and on `e`, not on `p`, and `µ` is `P`-generic when `P(µ_j)` is a unit modulo `p` for every embedding `j` (Definition 2.1.10(5), p. 25). "`K`-type `σ(τ)`" means that `π_w|GL_n(O_{F_w})` contains the inertial local Langlands type `σ(τ_w)` (Theorem 2.5.4, p. 36). The standing assumptions `F⁺ ≠ ℚ` and splitting above `p` of LLHLM23 §9.1 belong to its Serre weight theorem and are not hypotheses of this one.

*Route.* Local input: for `K/ℚ_p` unramified, a tame type with `P_{λ^s+η,e}`-generic lowest alcove presentation and semisimple residual representation, the potentially crystalline lifting ring of type `(λ^s + η, τ)` is a domain or zero. This also holds for finite products of such fields (LLHLM23, Theorem 7.3.2(2), Remark 7.3.4, pp. 111–112) and is recorded as a supplier gap on LocalGaloisDeformationRings. These rings need not be normal or Cohen–Macaulay; only irreducibility is used. Base change: choose a soluble totally real `L⁺/F⁺` with `4 | [L⁺ : ℚ]` and `L = L⁺F` linearly disjoint from the field cut out by `r̄` and `ζ_p`. Choose it so that `L/L⁺` is unramified at all finite places and `p` is unramified in `L⁺`, every place of `L⁺` above `p` splits in `L`, and away from `p` the base change of `π` has Iwahori-fixed vectors and inertia acts unipotently through `r` (§0.9). At each place `w ∤ p` of `L` where `r` or the base change of `π` is ramified, choose it also so that `r̄|G_{L_w}` is trivial, `Nw ≡ 1 mod p` and `p^{v_p(Nw − 1)} > n`, and replace `E` by `E′ = E(ζ_{p^M})`, `M` the largest `v_p(Nw − 1)` over these places, with ring of integers `O′`: these are the conditions of §4.8 at its set `R`, and a local extension containing the field cut out by `r̄|G_{F_v}` whose residue degree is divisible by the order of `Nv` modulo `p` and by a power `p^k` with `p^{k+1} > n` gives them, since `v_p(q^{ap^k} − 1) ≥ k + 1` when `p` is odd and `q^a ≡ 1 mod p`. At an inert place `v | p`, prescribe `L⁺_w ⊇ F_v` using PotentialAutomorphyInfrastructure §2.5; since `F_v/F⁺_v` is unramified quadratic, this prescription keeps `L⁺_w/ℚ_p` unramified and makes `F_v ⊗_{F⁺_v} L⁺_w ≅ L⁺_w × L⁺_w`. Semisimplicity at `p`, the generic tame type and adequacy are preserved, and `π_L` stays cuspidal. Coefficients: genericity is for the ramification index `e` of `O`, so the lifting rings over `O′` are not claimed to be domains, and the component form of §4.8 is used instead of its domain corollary. At a place `w | p` of `L` let `R_w` be the lifting ring over `O`, a domain by the local input; the lifting ring over `O′` is `R_w ⊗_O O′` (LocalGaloisDeformationRings §3.7). Write `A = R_w[1/p]` and `B = A ⊗_E E′`. `B` is free over the domain `A`, so every minimal prime of `B` lies over `(0)`, and `B^G = A` for `G = Gal(E′/E)`, so `G` permutes the minimal primes of `B` transitively. The kernel of the `E′`-point of `B` defined by the `E`-point `r|G_{L_w}` of `A` is extended from `A`, hence `G`-stable; it contains one minimal prime, so all of them, and `r|G_{L_w}` lies on every irreducible component of `Spec B`. The same argument with any finite Galois extension of `E` in place of `E′` gives every geometric component. So the component hypothesis of §4.8 holds for `r` and every `f′`. Over `L`, take the polarized problem over `O′` with these rings above `p` and unipotent conditions elsewhere. Apply the Ihara-avoidance `R = T` theorem with fixed potentially crystalline type (§4.8) in its component form, with coefficients a lattice in `σ(τ) ⊗ V(λ^s)` in the source labels of §10.4; `f′` comes from the base change of `π`. This is the route of the proof of LLHLM20, Proposition 6.0.2 (pp. 98–99), to which the one-line proof in LLHLM23 points. Then `r|G_L` is automorphic, soluble descent (§0.9) gives `π′`, and local–global compatibility at `p` gives the weight and `K`-type.

*Needs:* §§0.9, 3.2, 3.5, 4.2–4.3, 4.8, 10.4; PotentialAutomorphyInfrastructure §2.5 (extensions with prescribed local behaviour); LocalGaloisDeformationRings §§3.4, 3.7, 3.9, with the generic tame potentially crystalline domain theorem recorded as a supplier gap; AutomorphicGaloisRepresentationsPartII AG2.0, AG2.6; SmoothRepresentationsOfLocalGroups §SR.5.2 (types); DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 6.1, 6.4–6.5, 6.7.

**Checks.**

- The hypothesis is residual automorphy with the same weight and the same `K`-type; `r` itself is not assumed automorphic. A residually automorphic `r̄` with no RACSDC seed of weight `λ^c` and `K`-type `σ(τ)` is outside the theorem: producing that seed is the change of weight of LLHLM23 Remark 9.2.2(1), whose obvious-weight input is recorded under Scope and ownership.
- For `n = 2` and `λ^s = 0`, the types `(η, τ)` are tame potentially Barsotti–Tate, and the genericity condition can be made explicit (LLHLM23, §1.3, p. 6).
- If a place `v | p` is inert in `F/F⁺`, the local prescription `L⁺_w ⊇ F_v` gives `F_v ⊗_{F⁺_v} L⁺_w ≅ L⁺_w × L⁺_w`; the place splits over `L⁺`, as §4.8 requires. An unramified extension of odd degree would leave it inert and would not supply that hypothesis.
- The polynomial is indexed by the source `λ^s + η`. Substituting `λ^c + η` changes the genericity condition: for `n = 2`, `λ^s = 0` the index is `(1, 0)`, while `λ^c + η = (0, −1)`.
- For `E = ℚ_p` the enlarged field `E′ = ℚ_p(ζ_{p^M})` has ramification index `e′ = p^{M−1}(p − 1) ≠ 1 = e`, and the polynomial for `e′` is a different one: the domain statement is used only over `O`, and a route that asked the rings over `O′` to be domains would need genericity for `e′`, which is not a hypothesis.
- A domain can split after the extension without affecting the route: `A = ℚ_p[x, y]/(x² − p y²)` is a domain, `A ⊗ ℚ_p(√p)` has the two components `x = ±√p·y`, exchanged by the Galois group, and the `ℚ_p`-point `x = y = 0` lies on both. A point that is rational only over `ℚ_p(√p)`, such as `(√p, 1)`, lies on one of them; this is why the argument is applied to `r`, which is defined over `E`, and not to `f′`.

### Examples

- Symmetric powers of an elliptic curve over `F⁺`, restricted to a CM extension: for almost all `ℓ` they are rigid for `(Σ⁺, ∅)` (§10.3(1)). For `d(V) ≤ 1` and a supercuspidal component, §10.2 then applies unconditionally for almost all `ℓ`.
- For `n = 2`, `λ^s = 0` and a generic tame principal-series type, §10.5 is a potentially Barsotti–Tate modularity lifting theorem over unramified `p` with an explicit genericity condition.

### Dependencies

Layers 0, 1, 3, 4, 5 and 8 (§§0.9, 1.3, 3.2, 3.4, 3.5, 4.2–4.3, 4.8, 5.8–5.9, 8.16); LocalGaloisDeformationRings §§1.6, 1.13, 2.3, 2.12, 2.20–2.21, 3.4, 3.7, 3.9; GlobalGaloisDeformations §§8.1–8.4; ArithmeticGaloisRepresentations §§7.4, 7.9; AutomorphicGaloisRepresentationsPartII AG2.0, AG2.1a–AG2.3, AG2.6–AG2.7; AutomorphicFormsOnReductiveGroups §5.1; ArithmeticLocallySymmetricSpaces §ALS.F.7 and PotentialAutomorphyInfrastructure §§0.4, 2.5; EndoscopicTransferAndUnitaryTraceComparison §§10.23, 10.30; SmoothRepresentationsOfLocalGroups §SR.5.2; DeformationAndDerivedPatchingAlgebra §§5.4–5.6, 6.1, 6.4–6.5, 6.7.

## Downstream consumers

- ModularityAndLanglandsExtensionsPartII uses Layers 0–5 and 7–9 for symmetric power functoriality: polarized automorphy and its transport, component conditions, Schur data, the definite-unitary and ordinary Hecke theory, the residually reducible finiteness theory and the semistable pseudodeformation rings.
- GlobalGaloisDeformationsPartII uses the primitivity comparisons of §§7.3, 7.4 and 7.14, with the Allen–Newton–Thorne lifting theorem from ModularityAndLanglandsExtensions §4.2.
- AbelianSurfacesModularity uses soluble base change and descent (§0.9), strong residual oddness at a real place (§5.2) and relaxed adequacy (§5.4); GSp4NonregularModularityLifting uses strong residual oddness (§5.2).
- HilbertModularVarietiesAndShimuraCurvesPartII uses the potential diagonalizability of potentially Barsotti–Tate representations (§1.4).

The geometric switch of PotentialAutomorphyDworkMotivesPartII §9.4 is consumed by §6.1; it uses its own local ordinary predicate from LocalGaloisDeformationRings §1.7 and does not depend on the global automorphy predicates here.

The integral `R = T` theorem of Layer 10 is the input of the Beilinson–Bloch–Kato arguments for unitary Shimura varieties.

## References

All locators use the version listed here, by theorem, section and page. Every description of a source is a paraphrase. Some results of other authors are mentioned by name: Clozel–Harris–Taylor, Clozel, Harris–Shepherd-Barron–Taylor, Gee–Geraghty, Kisin, Gee, Pink, Allen, Wake–Wang-Erickson, Liu and Tadić. Each is cited through the registered source that invokes it, at the locator given in the text, and no statement here rests on a reading of those works beyond that source.

- **BLGGT14.** Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, *Potential automorphy and change of weight*, Annals of Mathematics 179 (2014), 501–609; arXiv:1010.2561v4. [Open preprint](https://arxiv.org/abs/1010.2561v4). Layers 0, 1, 5 and 6.
- **BLGHT11.** Thomas Barnet-Lamb, David Geraghty, Michael Harris and Richard Taylor, *A family of Calabi–Yau varieties and potential automorphy II*, Publications of the Research Institute for Mathematical Sciences 47 (2011), 29–98; author copy. [Author copy](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf). The supplied Dwork family and Layer 1.
- **Tho12.** Jack Thorne, *On the automorphy of l-adic Galois representations with small residual image*, Journal of the Institute of Mathematics of Jussieu 11 (2012), 855–920; arXiv:1107.5989v1. [Open preprint](https://arxiv.org/abs/1107.5989v1). Layers 0, 3–5 and 8.
- **Tho17.** Jack A. Thorne, *A 2-adic automorphy lifting theorem for unitary groups over CM fields*, Mathematische Zeitschrift 285 (2017), 1–38; accepted manuscript of 16 March 2016. [Institutional repository](https://www.repository.cam.ac.uk/handle/1810/254922). Layers 3–5.
- **Tho15.** Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations*, Journal of the American Mathematical Society 28 (2015), 785–870; accepted manuscript of 16 April 2014. [Institutional repository](https://www.repository.cam.ac.uk/items/2796d161-598e-44da-83fd-2015c26f1dbc). Layers 0, 2, 3, 7 and 8.
- **ANT20.** Patrick B. Allen, James Newton and Jack A. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*, Compositio Mathematica 156 (2020), 2399–2422; arXiv:1912.11269v2. [Open preprint](https://arxiv.org/abs/1912.11269v2). Layers 2, 3, 7 and 8.
- **NT21.** James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms*, Publications mathématiques de l'IHÉS 134 (2021), 1–116; arXiv:1912.11261v3. [Open preprint](https://arxiv.org/abs/1912.11261v3). Layers 0, 2, 3, 6–9.
- **NT21B.** James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*, Publications mathématiques de l'IHÉS 134 (2021), 117–152; arXiv:2009.07180v2. [Open preprint](https://arxiv.org/abs/2009.07180v2). Layers 1, 6 and 9.
- **NT23.** James Newton and Jack A. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, Journal of the European Mathematical Society 25 (2023), 1919–1967; arXiv:1912.11265v3. [Open preprint](https://arxiv.org/abs/1912.11265v3). Layer 9, and Layers 3 and 4 for its Taylor–Wiles variant.
- **NT26.** James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*, Annals of Mathematics 203 (2026); arXiv:2212.03595v2. [Open preprint](https://arxiv.org/abs/2212.03595v2). Layers 0–3 and 7–9.
- **BCG25.** George Boxer, Frank Calegari and Toby Gee, *Cuspidal cohomology classes for GL_n(Z)*, Journal of the American Mathematical Society 38 (2025), 509–520; arXiv:2309.15944v3. [Open preprint](https://arxiv.org/abs/2309.15944v3). Layers 0, 5 and 6.
- **LTXZZ.** Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, *Deformation of rigid conjugate self-dual Galois representations*, Acta Mathematica Sinica, English Series 40 (2024); arXiv:2108.06998v1. [Open preprint](https://arxiv.org/abs/2108.06998v1). Layers 5 and 10.
- **LLHLM23.** Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Local models for Galois deformation rings and applications*, Inventiones mathematicae 231 (2023), 1277–1488; arXiv:2007.05398v2. [Open preprint](https://arxiv.org/abs/2007.05398v2). Layers 4 and 10.
- **LLHLM20.** Daniel Le, Bao V. Le Hung, Brandon Levin and Stefano Morra, *Serre weights and Breuil's lattice conjecture in dimension three*, Forum of Mathematics, Pi 8 (2020), e5; arXiv:1608.06570v4. [Open preprint](https://arxiv.org/abs/1608.06570v4). The base change and patching route of §§4.8 and 10.5.
- **LLHL19.** Daniel Le, Bao V. Le Hung and Brandon Levin, *Weight elimination in Serre-type conjectures*, Duke Mathematical Journal 168 (2019), 2433–2506; arXiv:1610.04819v4, whose numbering is used. [Open preprint](https://arxiv.org/abs/1610.04819v4). Scope and ownership (modularity of obvious weights).
- **CT14.** Laurent Clozel and Jack A. Thorne, *Level-raising and symmetric power functoriality, I*, Compositio Mathematica 150 (2014), 729–748; author manuscript. [Author copy](https://www.dpmms.cam.ac.uk/~jat58/lrspi.pdf). Layers 0, 3 and 8.
- **GK14.** Toby Gee and Mark Kisin, *The Breuil–Mézard conjecture for potentially Barsotti–Tate representations*, Forum of Mathematics, Pi 2 (2014), e1; arXiv:1208.3179v5. [Open preprint](https://arxiv.org/abs/1208.3179v5). §1.4.
- **Che14.** Gaëtan Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*, in Automorphic Forms and Galois Representations, vol. 1, LMS Lecture Note Series 414 (2014), 221–285; arXiv:0809.0415v2. [Open preprint](https://arxiv.org/abs/0809.0415v2). Layers 2, 7 and 9.
- **Ger19.** David Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Mathematische Annalen 373 (2019), 1341–1427; author preprint of 12 March 2010, whose numbering is used. [Author copy](https://web.archive.org/web/2id_/https://www2.bc.edu/david-geraghty/files/oml.pdf). Layers 0, 3–5 and 9.
- **Tho24.** Jack A. Thorne, *A p-adic approach to the existence of level-raising congruences*, Proceedings of the London Mathematical Society (3) 128 (2024), e12584; arXiv:2212.03591v2. [Open preprint](https://arxiv.org/abs/2212.03591v2). §8.16.
- **BG19.** Rebecca Bellovin and Toby Gee, *G-valued local deformation rings and global lifts*, Algebra & Number Theory 13 (2019), 333–378; arXiv:1708.04885v3. [Open preprint](https://arxiv.org/abs/1708.04885v3). §§5.8–5.9 and 8.14–8.15.
- **Sk13.** Daniel Skodlerack, *The centralizer of a classical group and Bruhat–Tits buildings*, Annales de l'Institut Fourier 63 (2013), 515–546. [Version of record](https://www.numdam.org/article/AIF_2013__63_2_515_0.pdf). The selfdual midpoint lattice of §7.12.
