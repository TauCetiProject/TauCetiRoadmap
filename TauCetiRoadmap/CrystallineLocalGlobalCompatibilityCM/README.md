# Roadmap: potential automorphy over CM fields, Part II

**Summary.** This roadmap develops P-ordinary degree shifting, crystalline local–global compatibility and potentially Barsotti–Tate automorphy lifting over imaginary CM fields. It extends **PotentialAutomorphyInfrastructure, Layers 0–5** beyond its Fontaine–Laffaille and Borel-ordinary results. The first endpoint controls the local deformation conditions of Galois representations valued in integral and torsion Hecke algebras. The second applies that control to two-dimensional automorphy lifting. The crystalline argument allows small residue characteristic, ramification at `p` and regular weights outside a Fontaine–Laffaille interval.

The construction runs through integral Siegel parahorics and their rescaled coefficient actions, derived P-ordinary control, weight independence, Bruhat subquotients, a localized completed-boundary summand, and degree shifting into unitary middle degree. Characteristic-zero unitary eigensystems then supply crystalline Galois blocks, using AG2.6 coefficient-prime comparison; its `allCMCrystallineIwahoriAdmissibility` already supplies spherical crystallinity over CM fields. A separating twist and compatible constituent reconstruction carry the local information to torsion Hecke systems. For the lifting application, a pair of patched complexes with the same residual fiber propagates automorphic support between deformation components.

The potentially Barsotti–Tate endpoint has the explicit restriction

`[F(ζ_p):F] ≠ 3` or `im(ρ̄)^{proj} ≇ A₄`.

This restriction is needed by the finite-image argument specified in Layer CL.9. It holds automatically at `p=3` and `p=5`, the primes used by the elliptic-curve applications. The statement here makes no assertion about the unrestricted cubic-tetrahedral case.

Suggested home: `TauCeti/NumberTheory/Automorphy/CrystallineCM/`. The companion [Suggested.lean](Suggested.lean) records representative definitions and milestone signatures over the available library carriers. This document states every target, including the arithmetic constructions and their required supplier interfaces.

## Scope and ownership

The parent **PotentialAutomorphyInfrastructure, Layers 0–5** supplies its algebraic coefficient dictionary, CTG weight machinery, ordinary tower and Siegel-boundary infrastructure. This extension owns the integral P-ordinary comparison and arbitrary-prime degree-shifting argument, their crystalline and semistable-ordinary local–global consequences, and their two-component patching application. Its constructions retain the parent interfaces and the explicit extensions described below.

The integral coefficient lattices and their Levi splitting belong to **PotentialAutomorphyInfrastructure, Layers 0–5**, §0.4 `IntegralDualWeylModule` and §0.5 `dual_weyl_levi_splitting`; its §0.3 gives the unitary weight dictionary and §0.9 the arithmetic coefficient retract. Reuse the general algebraic-induction target of **IntegralHeckeAndGaloisDeterminants, Layers IHG.1–IHG.5**, §0.7, “Algebraic induction”: the cotensor equalizer for a map of flat commutative Hopf algebras, with its comodule structure, Frobenius reciprocity and counit evaluation. Its inversion comparison gives the left-translation convention of Jantzen I.3.3–3.7, pp.38–41. The integral `GL₂` examples and good-filtration theory of IHG §6.4 are separate specializations. The parent supplies the finite-free `GL_n` and unitary lattices, extension and reduction of scalars, and the integral Levi-equivariant splitting. CL.0, CL.2 and CL.6 use these maps with their prescribed weights and actions; CL.0 proves the additional Siegel evaluation surjectivity and CL.2 controls its kernel after rescaling.

The characteristic-zero Young-symmetrizer construction [`TauCeti.YoungTableau.weylModule`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean#L130) requires a `ℚ`-algebra. It therefore supplies neither a dual-Weyl lattice over `O` nor its reduction over `O/ϖ^m`. Rational agreement alone does not provide the integral evaluation, kernel weights or splitting used in CN Lemma 2.1.12, pp.17–18, and Lemma 4.2.3, p.60.

Arithmetic locally symmetric spaces, their Borel–Serre compactifications, finite-level local systems, cochain models and finite-cover descent belong to **ArithmeticLocallySymmetricSpaces, Layers ALS.1–ALS.6**. **CompletedCohomologyPartII, Layers 0–2, 4, 6–7** owns assembly of those objects into arithmetic towers, their smooth level colimits, completion, completed equivariant chain models, continuous descent and the completed boundary triangle. Smooth representation categories, general induction, derived invariants and local Hecke algebras belong to **SmoothRepresentationsOfLocalGroups, SR.0, SR.0d, SR.2 and SR.4**. Continuous profinite cohomology belongs to Tau Ceti's **ProfiniteCohomology, Layers 10–11** roadmap. General Koszul complexes belong to **DerivedModuleAlgebra, §0.K.1**; abstract derived patching and length arguments belong to **DeformationAndDerivedPatchingAlgebra, Layers 8–9**. These objects enter here through their supplier interfaces.

**AutomorphicGaloisRepresentationsPartII, AG2.2–AG2.7** owns the characteristic-zero GL constituent representations and their local comparisons; CL.4.4a constructs their unitary transfer assembly and local identification. **IgusaVarietiesAndTorsionConcentration, IG.7** owns the middle-degree concentration result. **IntegralHeckeAndGaloisDeterminants, Layers IHG.1–IHG.5** owns determinants, uniform nilpotent Galois interpolation and compatible local reconstruction. **PadicHodgeTheory, §§3.2–3.6 and 5.3–5.4**, **LocalGaloisDeformationRings, §§3.13–3.14, 4.14–4.15 and 6.6** and **GlobalGaloisDeformations, Layers R04.3 and R04.5** own the p-adic Hodge-theoretic categories, local lifting rings, deformation functors and conditional Taylor–Wiles selection. CL.9.3 proves the CM small-image detection, prime selection and relative presentation needed here. This roadmap applies those theories with the coefficient, weight, determinant and dimension conventions fixed here.

Solvable CM preparation uses **PotentialModularityAndCompatibleSystems, §§2.12–2.16**, and **PotentialAutomorphyInfrastructure, §2.5**; automorphic base change/descent uses **PotentialAutomorphyInfrastructure, §2.3**. This roadmap owns CN Theorem 4.2.15/Corollary 4.2.16, Propositions 5.5.3 and 5.6.1–5.6.3, Lemma 5.6.4 and the qualified lifting endpoint of §9.12. **EllipticCurveModularityImaginaryQuadratic** is a downstream consumer of these integral local deformation, non-neat perfectness and prepared patching exports; it owns independent AKT seeds and elliptic geometry. No elliptic-curve geometry is a target here. For characteristic-zero CM spherical crystallinity, reuse **AutomorphicGaloisRepresentationsPartII, AG2.6**, `allCMCrystallineIwahoriAdmissibility`; §7.7 owns the remaining totally real specialization.

Each layer lists the precise supplier section labels it consumes. An interface described under “Exact supplier contracts” is part of that supplier's mathematics; its use does not authorize a second definition or a weaker substitute here. In particular, an abstract algebraic representation does not supply smoothness, an ordinary derived category does not supply arithmetic towers, and algebraic corner reconstruction requires the actual local corner and generic-fiber identifications, together with continuity for its arithmetic application.

## Conventions

The standing conventions below apply to the layers unless a target explicitly changes its field, rank or coefficient assumptions. Rank-one and empty-rank tests exercise the local algebraic constructions; the arithmetic endpoints have `n≥2`. In the characteristic-zero `GL_n` endpoint, `F` is allowed to be totally real and `F⁺=F`. The non-neat `PGL₂` constructions in CL.8–CL.9 have their own perfectness hypotheses.

1. `F` is an imaginary CM field, `F⁺` its maximal totally real subfield, `n≥2`, `p` a prime; all places of `F⁺` above `p` split in `F` when unitary parahorics are used. The coefficient field `E/Q_p` is finite and contains all relevant embeddings, `O` is its integer ring, `k` its residue field, and `ϖ` its uniformizer. Local uniformizers `ϖ_v` are distinct notation.

2. `G=Res_{F/F⁺}GL_n`; `G̃` is the quasi-split `U(n,n)` with form `J=(0,Ψ_n;−Ψ_n,0)`, `P` its Siegel parabolic, `M≅G` the lower-right Levi; fix split-place identifications `ι_ṽ`. The algebraic coefficient lattice is the integral dual Weyl lattice, not an arbitrary characteristic-zero lattice. Good level means a neat factorizable compact open, with the standard integral p-components; apply the explicit non-neat construction only in CL.8–CL.9.

3. Weights `λ_{τ,1}≥⋯≥λ_{τ,n}`; the unitary dictionary (2.1.4) is `λ̃_τ=(−λ_{τ̃c,n},…,−λ_{τ̃c,1},λ_{τ̃,1},…,λ_{τ̃,n})`. Thus the paper’s abbreviated `(−λ_{τ̃c},λ_{τ̃})` always includes reversal in the first block. Hodge–Tate convention `HT(ε_p^{-1})=+1`; Art sends a uniformizer to geometric Frobenius.

4. For good `v` outside `T, P_v(X)=Σ_{i=0}^n(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i}, T_{v,0}=1`. For `G̃` replace `n` by `2n` and `i` by `j`, including `X^{2n−j}` in every term. `d=n²[F⁺:Q]` is the complex dimension of `X̃; dim_R X_G=d−1`.

5. Whenever the §2.1.20 Galois theorem is invoked: `F` contains an imaginary quadratic field; `T⊇S_p, T=T^c`; for each `v∉T` of residue characteristic `ℓ`, either `T` has no `ℓ`-adic places and `ℓ` is unramified in `F`, or `ℓ` splits in an imaginary quadratic subfield of `F`. A non-Eisenstein `m` means its associated residual n-dimensional representation is absolutely irreducible. Decomposed generic means some rational `ℓ≠p` splits completely in `F`, the residual representation is unramified at all `v|ℓ`, and no ratio of two Frobenius eigenvalues equals `ℓ`. The ambient `2n`-dimensional Satake representation must separately satisfy this condition where specified.

Use `𝔪` for a maximal Hecke ideal and `m` for a coefficient exponent; subscripts `m` on Galois representations and Hecke localizations mean `𝔪`. Let `R_m=O/ϖ^m`. The notation `(−λ_{τ̃c},λ_{τ̃})` includes reversal of the first n-block, as in the displayed unitary weight dictionary. Conjugated and dual comparisons change the block orientation explicitly. Geometric congruence depth uses the local uniformizer `ϖ_v`, while coefficient reduction uses `ϖ∈O`.

POrd inverts the single rescaled Siegel operator `ũ_n` at each selected place. QOrd requires valuation-zero eigenvalues for every rescaled partial block operator. General smooth ordinary localization and finite-module ordinary projectors have distinct interfaces. Integral induction and Satake are unnormalized; the characteristic-zero Jacquet argument uses its separately normalized supplier.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The starting libraries are Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Reuse these declarations in their stated generality:

- [mathlib:DerivedCategory](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean#L87) — Derived category of an abelian category with a chosen localization; does not supply enhanced smooth sheaves or completed arithmetic cohomology.
- [mathlib:Representation](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Basic.lean#L48) — Algebraic monoid representations as monoid homomorphisms to linear endomorphisms; smoothness and continuity must be supplied separately.
- [tauceti:TauCeti.IsSmoothDiscrete](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean#L272) and [SmoothDiscreteTopRep](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean#L618) — A discrete underlying module with open point stabilizers, and the full subcategory of such topological monoid representations. [IsSmoothDiscrete.res](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean#L303) preserves this condition under continuous monoid restriction. The [discreteRepEquivSmoothTopRep](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean#L833) coefficient dictionary assumes a topological group; its inverse is not a monoid interface.
- [mathlib:Representation.dual](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Basic.lean#L670) — Coefficient dual of a group representation, acting through the inverse group element. It does not identify dual-coefficient cohomology with an unshifted linear dual of cohomology.
- [mathlib:Module.Dual.eval](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Dual/Defs.lean#L79) and [eval_naturality](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Dual/Defs.lean#L176) — Natural evaluation into the double dual. Injectivity and reflexivity require their own hypotheses.
- [mathlib:Fin.revPerm](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Data/Fin/Rev.lean#L37) — Order-reversing involution of Fin `n` for the longest `GL_n` Weyl permutation.
- [mathlib:LinearMap.eventually_isCompl_ker_pow_range_pow](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Artinian/Module.lean#L308) — Fitting direct sum for an Artinian and Noetherian module.
- [mathlib:AlgHom.range](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean#L545) — Image subalgebra of an algebra homomorphism, used for Hecke images once their action is constructed.
- [mathlib:AlgHom.mem_range](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean#L549) — Image membership iff existence of a preimage.
- [mathlib:Ideal.exists_pow_inf_eq_pow_smul](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Filtration.lean#L388) — Artin–Rees with a uniform filtration shift for a submodule of a finite module over a Noetherian ring.
- [tauceti:TauCeti.ArtinRees.exists_controlled_lift](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/Ideal/ArtinRees.lean#L78) — One Artin–Rees shift serves all surjections onto the fixed submodule and all depths.
- [mathlib:Matrix.ProjGenLinGroup.mk](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean#L55) and `Matrix.GeneralLinearGroup.center_eq_range_scalar` — The native projective matrix quotient and its ambient scalar kernel, used for the determinant-kernel criterion of CL.9.
- [mathlib:finAddFlip](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Logic/Equiv/Fin/Basic.lean#L305) — Existing equivalence `Fin(m+n)≃Fin(n+m)` exchanging the two blocks. Use its `finAddFlip_apply_mk_left` and `finAddFlip_apply_mk_right` formulas; its inverse exchanges the blocks back. CL.0 identifies this supplied permutation with the relative Siegel Weyl element.

The finite Fitting decomposition assumes both Artinian and Noetherian module conditions. Over a p-adic field it distinguishes zero eigenvalues from nonzero eigenvalues; selecting valuation-zero eigenvalues is the separate construction in §4.3. Algebraic `Representation` has no continuity or smoothness condition. `DerivedCategory` requires an abelian category and its localization construction, and does not create the smooth or arithmetic coefficient category. An `AlgHom` range describes a Hecke image only after its actual action has been built. Artin–Rees controls a filtration shift, which permits increasing `m` to `m′` in CL.3 and CL.6.

### From neighbouring roadmaps

The following exports fix the precise generality of the imported mathematics. Their consuming layers identify where they enter the construction. Each belongs to its named supplier.

**SmoothRepresentationsOfLocalGroups:SR.0** and **SR.0d** (used in CL.0, CL.1, CL.3). The abelian category of smooth representations of the locally profinite groups used here, over `O/ϖ^m`; continuous compact-open invariants, enough injectives, restriction preserving injectives in the stated group cases, and their bounded-below derived functors. Algebraic Representation is only a carrier. Include the coefficient-injective embedding into smooth coinduction `Ind₁^{P(L)}I` and the acyclicity test on these objects used via Emerton Lemma 2.1.10 in CN Lemma 2.3.6.

The group part is supplied by **SR.0** and **SR.0d.1**: `SmoothRep`, `SmoothRep.instAbelian`, `SmoothRep.instIsGrothendieckAbelian` and `SmoothRep.res_preserves_injective`. Their group hypotheses must be retained. For the positive open monoids `Δ̃, Δ⁺` and `Δ`, use **PotentialAutomorphyInfrastructure, Layers 0–5**, §3.2 `SmoothMonoidModules`: smooth vectors are right adjoint to the exact inclusion into all monoid modules, the smooth category is abelian with enough injectives, and restriction to an open or compact subgroup preserves injectives. Compare the existing `TauCeti.SmoothDiscreteTopRep` open-stabilizer condition with this arithmetic smoothness condition before using its carrier. A carrier and preservation of smoothness alone do not supply the derived comparison.

These interfaces are used in CN, §2.1.13, p.19; §2.2.2, Definition 2.2.3, pp.26–27; Lemma 2.3.6, pp.36–37.

**SmoothRepresentationsOfLocalGroups:SR.2** (used in CL.2, CL.3, CL.4, CL.5). Integral unnormalized smooth induction for `P(L)∖G(L)` compact, functions compact modulo `P`, restriction and tensor identity over `O/ϖ^m`; exactness in precisely these compact quotient cases. Do not use characteristic-zero Jacquet exactness for p-torsion coefficients. The separately normalized complex Jacquet/geometric lemma is needed in CN Theorem 3.1.2. Include smooth coinduction from the trivial subgroup of P(L): for coefficient-injective `I`, locally constant I-valued functions on the free right `U₀-space P(L)w₀^P U₀` are injective smooth `U₀-modules`, with evaluation `F(x)=f(x)(1)` identifying them with `I°_{w₀^P}(Ind₁^{P(L)}I)`. This is the precise CN Lemma 2.3.6 input; it is not Borel N(O)-acyclicity. For Theorem 4.1.3, export the derived Mackey decomposition for restriction of this induction to `(K₁⋉U₁)`; the identity double-coset term is a natural Hecke-equivariant summand. For Theorem 3.1.2, include Bernstein–Zelevinsky classification and the identity-only normalized geometric-lemma calculation for strictly ordered block slopes: a nonzero monodromy block has a positive-length Steinberg factor whose maximal-compact invariants vanish. These are separate characteristic-zero statements, not consequences of integral induction exactness.

These interfaces are used in CN, Proposition 2.2.15, p.31; CN, Lemma 2.3.6, pp.36–37.

**ProfiniteCohomology, Layers 10–11** (used in CL.1, CL.3, CL.5). Continuous cochains with finite torsion coefficients, finite-index transfer, comparison to smooth compact invariants and cohomological-dimension theory. **PotentialAutomorphyInfrastructure, §0.12**, `unipotent_exterior_cohomology`, supplies the Siegel abelian computation: for `U₀≅Z_p^r`, `H^i_cont(U₀,R_m)=Hom_cont,Z_p(∧^i_Z_p U₀,R_m)`, with contragredient Levi conjugation action and `H⁰=R_m`. CL.3.4 adds deep-level equivariant splitting. The general Koszul carrier is supplied by its algebraic owner. Hochschild–Serre/derived composition and ordinary open-cell vanishing belong separately to SmoothRepresentationsOfLocalGroups.

These interfaces are used in CN, Definition 2.2.3, pp.26–27; CN, Lemma 2.3.17, p.42.

**ArithmeticLocallySymmetricSpaces:ALS.1, ALS.3, ALS.4, ALS.6** and **CompletedCohomologyPartII, Layers 0–2, 4, 6–7** (used in CL.1, CL.3, CL.5, CL.8). Import the finite-level coefficient complexes from ALS.1, their Hecke/support maps from ALS.3–ALS.4 and finite-cover descent from ALS.6. CompletedCohomologyPartII Layer 0 assembles the actual level-indexed arithmetic towers and conjugation maps; its Layer 1 supplies their smooth level colimits; its Layer 2 constructs completion and the homotopy inverse limit in the coefficient exponent with the required Milnor and reduction comparisons. its Layer 4 supplies completed equivariant chain models and derived finite-level recovery; its Layer 6 supplies continuous completed descent and compact-open derived comparison; its Layer 7 supplies the derived support and boundary triangle. Completion is not identified with ordinary inverse limit without its hypotheses. For Lemma 4.1.6, combine the ALS.2 arithmetic nilmanifold fibration, Leray–Serre and strong approximation with this level colimit to prove that positive integral torsion cohomology dies in the full congruence tower. That arithmetic acyclicity remains an obligation of CL.5; the finite characteristic-zero Lie-algebra formula and generic limit functor alone do not establish it.

These interfaces are used in CN, §2.2.7, p.28.

**SmoothRepresentationsOfLocalGroups:SR.4** (used in CL.0, CL.4, CL.6). Integral unnormalized local Satake map for `GL_n` and split `U(n,n)`, in geometric Frobenius conventions; characteristic polynomials use `q^{i(i−1)/2}`. Supply its Siegel transform and relation with the Levi embedding, with rescaling and conjugation handled by the CL.0 and CL.6 constructions.

These interfaces are used in CN, Lemma 2.1.15, p.20; Remark 2.1.16.

**PadicHodgeTheory, §§3.2–3.6** (used in CL.4, CL.7). Filtered `(φ,N)-modules` for finite extensions `L/Q_p` with E-coefficients, geometric Frobenius slopes `v_p` normalized `v_p(p)=1, t_N=t_H` and subobject inequalities, weak admissibility implies admissibility, functorial crystalline/semistable subrepresentations and finite coefficient base change; inverse cyclotomic Hodge–Tate weight +1.

These interfaces are used in CN, Theorem 3.1.2, pp.43–44.

**PadicHodgeTheory, §§5.3–5.4** (used in CL.4, CL.9). Semistable Weil–Deligne parameters at `p` compatible with geometric Frobenius, coefficient extension and determinant, and crystalline iff semistable with `N=0` (in the stated unramified descent setting).

These interfaces are used in CN, Theorem 3.1.2, pp.43–44.

**AutomorphicGaloisRepresentationsPartII:AG2.4** (used in CL.7) supplies HLTT existence for unpolarized regular algebraic cuspidal `GL_n` over CM and totally real fields. For the unitary representation in CL.4, use **AG2.2** `DiscreteAssembly` and **AG2.3**, “Arbitrary regular conjugate-self-dual existence”, on every cuspidal constituent of the discrete transfer. CL.4.4a constructs `CrystallineCM.unitary_characteristic_zero_comparison`, including the algebraic twists, full rank and labelled weights. Its local identification uses ACC+ Theorem 2.3.3(2) under the hypothesis that the rational prime `p` splits in an imaginary quadratic subfield of `F`; splitting only in `F/F⁺` does not replace this hypothesis. The transfer can have several discrete constituents.

These interfaces are used in CN, Theorem 3.1.2, pp.43–44.

**AutomorphicGaloisRepresentationsPartII:AG2.6–AG2.7** (used in CL.4, CL.7). For every regular algebraic cuspidal representation over a CM field, `allCMCoefficientPrimeComparison` supplies de Rhamness, labelled Hodge weights and semisimplified Weil–Deligne comparison at `p`; `nonselfdualCoefficientPrimeMonodromyBound` supplies the monodromy upper bound; `allCMCrystallineIwahoriAdmissibility` supplies spherical crystallinity and Iwahori semistability. Use their arithmetic wrapper `NonselfdualComparisonExport` from AG2.7, transporting labelled weights to `HT(ε_p⁻¹)=+1`. These exports require no residual irreducibility or decomposed genericity. CL.4.4a applies them to the cuspidal constituents and assembles their special blocks and monodromy bounds; they do not directly assert local comparison for a unitary representation. **AG2.5** separately supplies away-p monodromy/type bounds for the `χ_v` and unipotent deformation conditions in CN Propositions 5.6.2–3; unramified traces alone do not give full monodromy equality.

These interfaces are used in CN, Theorem 3.1.2, pp.43–44.

**PotentialAutomorphyInfrastructure, Layer 0** (used in CL.5, CL.6). The non-Eisenstein Siegel-boundary localization of ACC+ Theorem 2.4.2 (arXiv v2, pp.46–49; published pp.941–945) and Newton–Thorne Corollary 2.11 as a Hecke-equivariant derived retract with the dual Weyl coefficient evaluation map. The residual `2n` representation is `ρ̄_m⊕ρ̄_m^{c,∨}(1−2n)`; irreducibility is imposed on its n-dimensional Levi constituent, not on this sum. Include the integral coefficient retract used in CN Corollary 4.1.9, without a Fontaine–Laffaille restriction. Also the separate coefficient splitting in the proof of ACC+ Theorem 2.4.4 (arXiv v2, pp.49–50; published pp.945–946), after the NT16 Proposition 2.10 Levi splitting and the P-stability argument in CN Lemma 4.2.3, p.60. Do not identify these two retracts.

These interfaces are used in CN, Corollary 4.1.9, p.57; CN, Lemma 4.2.3, p.60.

**IntegralHeckeAndGaloisDeterminants:IHG.5** (used in CL.0, CL.7, CL.8). CN Theorem 2.1.20 (residual), Theorem 2.1.24 (integral uniform nilpotent exponent), and Proposition 5.5.2 uniform-exponent Galois representations for integral derived Hecke images and `O/ϖ^m` cohomology. Reconstruction of a representation takes place in the idempotent local factor whose residual representation is absolutely irreducible. `N` depends only on n,[F:Q], not `m`, weights or levels. Include finite-level idempotent localization and inverse-limit/degree assembly preserving Frobenius characteristic coefficients; arithmetic/geometric Frobenius conversion is explicit. Existing IHG tower algebra alone does not assert this arithmetic export.

These interfaces are used in CN, Theorem 2.1.24, p.23; CN, Proposition 5.5.2, pp.80–81.

**DeformationAndDerivedPatchingAlgebra, §§9.2, 9.4–9.5** (used in CL.8). ACC+ Lemma 6.3.7 localization and derived Euler-length identity for perfect `S∞-complexes` with finite derived Hecke action modulo nilpotents, along `ϖ` and one-dimensional points, plus CG Lemma 6.2 amplitude/depth inequality. No strict `T∞-module` model is assumed. CL.8.3 proves CN Proposition 5.4.2 from these algebraic tools and §8.2's pairwise common-component relation. It does not import the parent GL_n arithmetic support theorem or DP §9.6's globally unique auxiliary component.

These interfaces are used in CN, §5.4, Proposition 5.4.2, pp.78–79.

**DeformationAndDerivedPatchingAlgebra, §§8.1–8.5** (used in CL.8, CL.9). Patch the two families `C_{χ,Q_N}, C_{1,Q_N}` with fixed residual identification, uniformly bounded perfect `O[Δ_Q]-models`, framing variables, `O[[Δ∞]]` action, finite Hecke images, local tensor rings, augmentation recovery and compatibility modulo `ϖ`. The resulting rings have dimension dim `S∞−l₀, l₀=[F⁺:Q], q₀=[F⁺:Q]` in the `GL₂` CM application; proving these arithmetic hypotheses is the CL.9 application.

These interfaces are used in CN, Proposition 5.6.1, p.82.

**PotentialModularityAndCompatibleSystems, §2.15**, `cht_character_extension`, and **ClassFieldTheory, Layers 11–12** (used in CL.7). Use finite local character extension from the former and reciprocity from the latter. CL.7.3 proves the prime-to-p refinement by extending into the divisible subgroup of prime-to-p roots of unity: prescribe unramified local values at the two selected p-adic places and trivial local character at a fixed decomposed-generic split prime. Enlarge the coefficient field and allow the global order to increase; no fixed global exponent is imposed.

These interfaces are used in CN, Sub-lemma 1, pp.70–71.

**PotentialAutomorphyInfrastructure, §2.3** (used in CL.7, CL.9). Solvable CM base change/descent for `PGL₂` with trivial central character and regular algebraic weight `0`; if `ρ|G_{F′}` is irreducible and realized by a cuspidal `Π`, descend to `ρ` over `F`. Also cyclic `GL_n` base change (iterating prime-degree base change where needed) for the crystalline theorem, with irreducibility preserving cuspidality, as in ACC+ Proposition 6.5.13 and CN Theorem 4.3.1.

These interfaces are used in CN, §4.3, Theorem 4.3.1, p.73.

**PotentialModularityAndCompatibleSystems, §§2.12–2.16**, and **PotentialAutomorphyInfrastructure, §2.5** (used in CL.7, CL.9). Solvable Galois CM extensions with prescribed local splitting/trivialization/semistability, degree distribution and disjointness from any fixed finite residual-plus-cyclotomic field; the V-set argument and imaginary-quadratic composita of CN §5.6/AKT Theorem A.14. Supply preparation preserving the full residual image and cyclotomic degree, not only irreducibility. For Theorem 4.3.1, also supply the cyclic CM extension `F₁/F` (allowing `F` totally real) with `[(F₁)⁺:F⁺]≥4`, taking `F⁺=F` in the totally real case, disjoint from the residual field, containing an imaginary quadratic field, with all p-adic `F₁⁺` places split in `F₁` and the selected `v` and `v^c` split completely in `F₁`. Thus the local fields at these places are unchanged; crystallinity is obtained directly, without ramified descent.

These interfaces are used in CN, §4.3, Theorem 4.3.1, p.73.

**ReductiveGroups, Layer 7** (used in CL.3). Generic parabolic double Bruhat decomposition and algebraic closure order for split connected reductive groups; CL.3 compares this decomposition with the p-adic topology. The pinned `GL₂` Bruhat declaration is a rank-one sanity check, not this general supplier.

These interfaces are used in CN, §2.3.1, Lemma 2.3.2, p.33.

**PotentialAutomorphyInfrastructure, §0.3**, **§0.4 IntegralDualWeylModule**, **§0.5 dual_weyl_levi_splitting** and **§0.9 Siegel coefficient splitting** (used in CL.0, CL.2, CL.5, CL.6). The coefficient specialization requires integral algebraic induction/dual Weyl modules with coefficient extension and reduction, Levi evaluation onto `V_{λ_τ̃}⊗V_{−w₀λ_{τ̃c}}`, Schubert evaluation surjectivity after reduction and the positive-root weight description of its kernel. Reuse the “Algebraic induction” target of **IntegralHeckeAndGaloisDeterminants, §0.7**, for the general cotensor construction, its comodule structure, reciprocity and counit evaluation. The parent's integral dual Weyl module supplies finite-freeness, highest weights and coefficient base change; these require its split reductive group scheme and dominant-weight hypotheses. The arithmetic retract is the target of PotentialAutomorphyInfrastructure §0.9; the evaluation surjectivity in the present Siegel specialization remains the target of §0.2. The `GL₂` induced modules of IHG §6.4 do not provide the `GL_{2n}` Siegel evaluation for arbitrary `n≥2`. Export the integral Levi-equivariant splitting `V_{λ̃}=V_λ⊕W` (NT16 Proposition 2.10, pp.13–14); for the conjugated parabolic in §6.3, identify `W⊗E=(1−U) V_{λ̃,E}` as a P-stable subspace, as in CN Lemma 4.2.3 and proof, p.60. Since `W` is a direct summand of the lattice, `W=V_{λ̃}∩(W⊗E)`; rational P-stability then implies integral P(O)-stability before invoking the dual coefficient retract.

These interfaces are used in CN, Lemma 2.1.12, pp.17–18.

**DerivedModuleAlgebra, §0.K.1** (used in CL.3). Finite-sequence Koszul complexes with their exterior-power terms, zero-differential comparison, coefficient base change and weakly regular-sequence resolution. A finite commuting operator family is a module over the polynomial ring in those operators; tensor its coordinate-sequence Koszul complex with that module. Use ProfiniteCohomology for continuous cochains and **PotentialAutomorphyInfrastructure, §0.12**, `unipotent_exterior_cohomology`, for the Siegel abelian cohomology and its Levi action; do not create a second generic Koszul complex here or inside an arithmetic lifting theorem.

These interfaces are used in CN, §2.3.16, pp.41–42; Lemma 2.3.17 on p.42.

**SmoothRepresentationsOfLocalGroups:SR.0d** (used in CL.3). For a profinite `K` with cofinal congruence `K_M`, perfect underlying R-complexes in `D⁺_sm(K,R)` become isomorphic, after sufficiently deep restriction, to the constant action on the underlying complex. Prove `colim_M Hom(B_M,A_M)≅Hom(B,A)` using dualizability, derived tensor/invariants adjunction and smoothness. This is the general categorical step of CN Lemma 2.3.17, not a blanket formality statement for all `U`.

These interfaces are used in CN, §2.3.16, pp.41–42; Lemma 2.3.17 on p.42.

**ArithmeticLocallySymmetricSpaces:ALS.6.1–ALS.6.3** (used in CL.8, CL.9). Supply finite-cover descent, Hochschild–Serre and lowest-degree control. Group-ring perfectness in ALS.6.1 requires neat base level. CL.8.7 proves the additional AKT Theorem 5.11/Proposition 5.18 non-neat localized vanishing and minimal-complex perfectness argument; CL.9.6 proves perfect `O[Δ_Q]` models and derived augmentation at the non-neat p-covers.

These interfaces are used in CN, Proposition 5.5.3, p.81; AKT, Theorem 5.11, pp.46–47, with the boundedness argument concluding in Proposition 5.18, pp.50–51.

**ArithmeticLocallySymmetricSpaces:ALS.5b** (used in CL.9). Supply the automorphic and cuspidal comparison, not the exact PGL₂ degree range. CL.9.10 proves the weight-zero PGL₂ central-character descent and archimedean calculation of AKT Theorem 5.10(2–3), giving rational range `[D,2D]` and cuspidal realization, `D=[F⁺:Q]`. Thus `q₀=l₀=D`; the GL₂ range with `l₀=2D−1` does not suffice.

These interfaces are used in AKT, Theorem 5.10(2–3), p.45.

**SmoothRepresentationsOfLocalGroups:SR.0d** (used in CL.1, CL.3, CL.5, CL.6). Derived invariants for smooth semidirect products compose: `RΓ(K⋉U,−)≅RΓ(K,RΓ(U,−))` with the precise restriction/injectivity and inflation/projection-formula hypotheses, giving the Hecke-equivariant comparison of CN Lemma 4.1.7 and Lemma 4.2.3. Also export the ordinary open-cell quotient vanishing from the contracting, locally nilpotent `ũ-action` used in Lemma 2.3.6 (Hauseux Lemma 3.3.1 argument), including its higher derived cohomology; it does not follow merely from `H⁰-localization`. Preserve the compact determinant-unit orientation in Lemma 2.3.8.

**SR.0d.2** supplies the group-derived framework, including the compact-group comparison `RΓ(U,−)≅RΓ(U/N,RΓ(N,−))` for `N` closed normal in `U`. **PotentialAutomorphyInfrastructure, Layers 0–5**, §3.2 `SmoothMonoidModules`, supplies the smooth monoid categories and their restriction/injective interfaces. The monoid-valued functor restricts from `D⁺_sm(Δ̃^Q,R_m)` to `Δ̃^Q_P=Δ^{Q,+}⋉U₀`, then takes `RΓ(U₀,−)` with its `Δ^{Q,+}` transfer action from §1.2; §1.3 localizes to `D⁺_sm(Δ^Q,R_m)`. The P-ordinary localization of §1.3 takes smooth `Δ⁺-objects` to smooth `Δ-objects` by inverting the chosen `ũ_n`, is exact, and preserves the injectives used for compact Levi invariants. Compact-group composition and a finite-module ordinary projector do not supply that contracting-action comparison.

These interfaces are used in CN, §2.2.2, Definition 2.2.3, pp.26–27; Lemma 4.1.7, p.56; Lemma 2.3.6, pp.36–37.

**ArithmeticLocallySymmetricSpaces:ALS.3** (used in CL.0). The adelic center acts on the localized arithmetic cohomology; ray-class congruence and archimedean connectedness compare the central operator at a p-adic uniformizer with a good-place central Hecke operator. With global class-field reciprocity and Chebotarev, the unique generalized eigenvalue is `ψ(Art_{F_v}(ϖ_v))`, where `ψ=ε̄_p^{n(n−1)/2}detρ̄`. Respect the good-place `q^{n(n−1)/2}T_{w,n}` normalization and the fact that `v` itself may be ramified.

These interfaces are used in CN, Lemma 2.1.21 and its proof, pp.22–23.

**PadicFamilies, §§0a.2–0a.9 and 0a.14–0a.18** (used in CL.1). Finite and adic ordinary projectors, their naturality and exactness, and ordinary direct summands of complexes compatible with cohomology and coefficient towers. The finite module hypotheses and the complete local coefficient hypotheses remain part of their respective interfaces. Valuation-zero selection on an arbitrary finite-dimensional p-adic vector space is the construction of §4.3 here.

**IntegralHeckeAndGaloisDeterminants:IHG.1** (used in CL.7). Reuse [§1.6, Compatible local compression](../IntegralHeckeAndGaloisDeterminants/README.md#16-compatible-local-compression), specifically its target “Local lifts compatible with global quotient reconstruction”. Its coefficient map `B→A` is surjective with `B` local and A henselian local; no flatness assumption on A is imposed. In Proposition 4.2.13 take `B=Ã`, the auxiliary finite flat local O-algebra, and A the torsion Hecke quotient after the uniformly nilpotent ideal. Only `B` is required to be finite flat in this arithmetic application.

The application supplies the following data rather than a second reconstruction theorem:

- The two-block GMA and its selected rank-n corner, obtained from the residual constituent separation and integral projector of CN Lemma 3.2.2, pp.48–49. Global compression modulo the reducibility ideal gives a representation `σ` over A with the same **full determinant law** as the residually absolutely irreducible global `ρ`. This includes polynomial-law equality after coefficient extension, beyond equality of selected characteristic polynomials.
- For `H=G_{F_v},` a B-valued representation `λ` given by that very corner on `H`, with its reduction equal to `σ|_H` in the supplied matrix identification. For every factor `K_i` of B[1/p], provide a basis identifying `λ⊗K_i` with the selected local characteristic-zero constituent. Residual constituent matching is used to construct these projector and generic-fiber data; it does not replace them.
- Applying the upstream theorem gives a lift of `ρ|_H` conjugate over `B` to `λ`. Its reduction equals `ρ|_H` in the fixed basis, and every generic factor remains conjugate to the selected constituent. Thus the semistable/crystalline block properties and labelled weights already proved for those constituents pass to the lift.
- Prove continuity of `λ` for the arithmetic topologies before concluding that the lift is continuous: conjugation by the fixed invertible B-matrix is continuous for the topological coefficient ring. The upstream assembly statement is algebraic and has no continuity premise or conclusion. It also does not construct the finite flat algebra, local projectors or p-adic Hodge-theoretic data. Coefficient changes used in the application must transport the chosen corner and its generic identifications through the corresponding supplier comparisons.

A torsion target such as `A=O/ϖ` with `B=O` illustrates the allowed coefficient boundary. In rank one, `1+ϖ` is a unit of `B` reducing to `1` in A, although A is not flat over `O`. Requiring flatness of the target would discard the coefficient rings of the torsion theorem; allowing torsion does not remove the determinant-law and corner hypotheses above.

These interfaces are used in CN, §3.2, Proposition 3.2.4(1–3) and proof, pp.49–50; Proposition 4.2.13 proof, pp.69–71.

**GlobalGaloisDeformations, §5.6 and §§3.6–3.7** (used in CL.9). Import conditional Chebotarev selection and the general relative-tangent/presentation framework. CL.9.3 constructs AKT Lemma A.5 small-image detection, Proposition A.6 CM prime selection and Proposition A.4's CM relative presentation, including `g=q−3[F⁺:Q]−1+|S|` for framing at `T=S`. Their CM hypotheses and generator count are verified here, rather than imported from the totally real KW/Gee applications.

These interfaces are used in AKT, Propositions A.4, A.6 and Lemma A.5, pp.86–87.

**LocalGaloisDeformationRings, §3.13** and **§3.14 fixed-determinant crystalline and ordinary rings** (used in CL.7). The crystalline and semistable-ordinary quotients of the framed lifting ring are O-flat and reduced, characterized by maps to finite E-algebras with the specified Hodge type. The ordinary quotient selects the appropriate open-and-closed generic components of the semistable ring. For `p∤n` and a crystalline determinant character with the sum of the labelled weights, the fixed-determinant quotient has an unramified-character section, and adjoining one formal variable recovers the unfixed ring. The characterizing property concerns actual finite E-algebra lifts, including nonreduced coefficient algebras; testing only field-valued points does not replace it.

These interfaces are used in CN, Lemma 3.3.2 and Theorem 3.3.3, pp.51–52; Lemma 3.3.6, pp.52–53; Corollary 4.2.16, p.72.

**LocalGaloisDeformationRings, §6.6** and **R08.4/bt-ring-unique-generalisation** (used in CL.8–CL.9). For `p` odd, trivial residual `GL₂` representation and trivial residual cyclotomic character, the fixed inverse-cyclotomic semistable-ordinary ring has dimension `[F_v:Q_p]+4,` a crystalline component and an extension component whose points have shape `(1,*;0,ε_p⁻¹)`. Each special-fibre generic point has a unique generic generalization. The fixed-determinant Barsotti–Tate ring has the same unique-generalization property; when the residual representation is trivial, the local residue field is larger than `F_p` and the ring is nonzero, it has exactly two components, distinguished by ordinary and nonordinary characteristic-zero points. Retain these hypotheses when forming completed tensor products and propagating patched support.

These interfaces are used in CN, Proposition 5.3.2, pp.75–76; Lemmas 5.3.3–5.3.4, pp.76–77.

The local deformation and p-adic Hodge suppliers use `HT(ε_p)=+1`, whereas this roadmap uses `HT(ε_p⁻¹)=+1`. Transport every labelled weight by negation, then reorder its increasing list. Thus the supplier's Barsotti–Tate multiset {0,−1} becomes {0,1} here, and its fixed-determinant sum is negated. This changes the weight dictionary, not the determinant character `ε_p⁻¹` or the orientation of its extension. All local ring names above refer to the transported Hodge type.

**IgusaVarietiesAndTorsionConcentration:IG.7/middle-degree-without-length-hypothesis** (used in CL.6). Under the stated CM, imaginary-quadratic, good-level and `T` hypotheses, decomposed genericity of the ambient `2n`-dimensional residual representation supplies the injective map from integral unitary middle-degree cohomology to its rationalization and the surjection onto localized boundary cohomology. No lower bound on `[F⁺:Q]` or on the length of the residual representation is imposed. This is the exact concentration interface required by degree shifting; irreducibility of the Levi constituent alone does not supply ambient genericity.

This interface is used in CN, Theorem 2.1.28, p.25, with the hypotheses of Theorem 2.1.26, p.24.

**ArithmeticGaloisRepresentations, §5.10** and **LocalGaloisDeformationRings, §F.2.7** (used in CL.8–CL.9). Over complete Noetherian local O-algebras with the fixed residue field and absolutely irreducible residual representation, equal traces identify lifts up to strict conjugacy. A lift with traces in a closed local coefficient subring descends to that subring, provided its maximal ideal is the intersection with the ambient maximal ideal. The universal deformation ring is topologically generated by traces. Apply this to the finite local Hecke images with their actual residue identifications and Frobenius coefficients; it supplies coefficient descent, while the arithmetic generation and local deformation conditions are separate obligations of CL.9.

This interface is used in CN, Proposition 5.5.2, pp.80–81, and Propositions 5.6.2–5.6.3, pp.83–84 (Carayol's trace argument as in Gee, Lemma 3.7, pp.12–13, and Kisin, Lecture `1`, Theorem 1.4.1, pp.3–4).

**ArithmeticGaloisRepresentations, §§4.2–4.7** (used in CL.9). Classify finite subgroups of `PGL₂` over an algebraic closure of characteristic `p` into point stabilizers, dihedral groups, exceptional `A₄, S₄, A₅` groups and finite-field `PSL₂/PGL₂` groups. The alternatives may overlap, and `p` may divide the exceptional orders. The determinant-kernel criterion here uses this classification with `p` odd, without assuming the original representation is irreducible. It retains the order-three tetrahedral exception; a Klein-four projective determinant kernel does not imply an invariant line.

This interface is used in the qualified form of CN, Lemma 5.6.5, pp.85–86; the classification is DDT, Theorem 2.47(b), p.81 of the `2007` McGill copy.


## How to read the build

Layer `k` has the stage identifier CL.k. The sequence follows the mathematics, with independent inputs named at their point of use. The short declaration names below are inside the namespace `TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM`. The companion file retains the `CrystallineCM` subnamespace for those names.

| Layer | Construction and output |
|---|---|
| CL.0 | Integral Siegel parahorics, positive monoids and lowest-weight rescaling |
| CL.1 | Finite-level and completed derived P-ordinary control |
| CL.2 | Independence of selected weights, including dual coefficients |
| CL.3 | Bruhat subquotients, compact unipotent cohomology and deep-level splitting |
| CL.4 | Q-ordinary characteristic-zero automorphic representations and crystalline blocks |
| CL.5 | The localized completed Siegel-boundary summand |
| CL.6 | Integral and torsion degree shifting modulo uniformly nilpotent ideals |
| CL.7 | Crystalline and semistable-ordinary local–global compatibility |
| CL.8 | Common-residual patching and non-neat PGL₂ cohomology |
| CL.9 | Prepared deformation data and qualified potentially Barsotti–Tate lifting |

The integral evaluation map is surjective and its kernel is killed modulo `ϖ^m` by a power of the rescaled Siegel operator. Inverting that operator makes the selected algebraic weight disappear from completed cohomology except for its Levi tensor factor. Taking derived compact Levi invariants recovers the finite-level object and its boundary counterpart. This fixes the actions before any degree comparison.

The Bruhat filtration of unnormalized parabolic induction produces Hecke-equivariant subquotients. Its open stratum exchanges the two Levi blocks; its identity stratum gives a cohomological shift and the determinant-unit orientation character. The filtration must be retained: these conclusions do not identify the whole induced representation with the direct sum of its strata.

On the complementary p-adic places, zero selected weights reduce the unipotent coefficient complex to continuous cochains of `O_L^{n²}`. After sufficiently deep Levi restriction, those cochains split into their cohomology groups, which are coefficient-valued duals of exterior powers. If `D=[F⁺:Q], d=n²D` and `R` is the sum of complementary local degrees, then `2R≥D` and `q≥⌊d/2⌋` imply

`d − q ≤ ⌈d/2⌉ ≤ n²⌈D/2⌉ ≤ n²R`.

Thus unipotent cohomology supplies the degree needed to reach unitary middle degree, including odd `d`. Artin–Rees permits an increase of coefficient exponent and congruence depth to compare torsion subquotients. The nilpotence exponent depends only on `n` and `D`; the auxiliary depth can depend on the input.

The generic middle-degree injection is a statement about the ambient `2n`-dimensional Satake residual representation. It must be checked independently of irreducibility of its n-dimensional Levi constituent. The exact concentration input is **IgusaVarietiesAndTorsionConcentration:IG.7/middle-degree-without-length-hypothesis**. CTG middle-degree eigensystems come from cuspidal Q-ordinary unitary representations. Their crystalline diagonal blocks, determinant formulas and Hodge–Tate lists identify the local conditions through constituent reconstruction. A local finite-flat lift may depend on the selected place, cohomological degree and coefficient exponent; no common globally automorphic lift of every torsion class is asserted.

For `PGL₂` over a CM field, the rational cohomology range is [D,2D], so `q₀=l₀=D`. The two perfect patched complexes carry a fixed identification of their residual fibers. Their finite derived Hecke actions define support modulo nilpotent ideals. The dimension and length identities propagate that support through corresponding special-fiber generic points and their unique generic generalizations. An action on a strict chain model by the entire deformation ring is not an input.

## Layer 0: Siegel parahorics and integral coefficient actions

Fix the lower-right `GL_n` Levi of split `U(n,n)`, descending dual Weyl weights and geometric Frobenius. Construct Siegel block exchange using existing finite permutations; define P(b,c) by `C≡0` mod `ϖ_v^c` and `A,D≡1` mod `ϖ_v^b, c≥b≥0,c≥1`; define positive central block cocharacters and the resulting positive parahoric monoid. Prove positivity and the commutative monoid-Hecke isomorphism. Define separate unitary and Levi lowest-weight characters using their respective longest Weyl elements and the action `α(g)^{-1}ρ(g)`, prove lattice stability and surjective Levi coefficient evaluation, and identify the `U_v` residual determinant eigenvalue.

### 0.1 Siegel block-exchange Weyl element

Use Mathlib's `finAddFlip` on `Fin (n + n)` for the Siegel block-exchange element `w₀^P`. Its block formula and involution are supplied by `finAddFlip_apply_mk_left`, `finAddFlip_apply_mk_right` and the symmetry of this block-exchange equivalence (see Exact supplier contracts).

Prove `CrystallineCM.WeylElements_levi_conjugation`: over any commutative ring, conjugation by this permutation matrix sends `diag(A,D)` to `diag(D,A)`, without transpose or inversion. In the split unitary Weyl group it is `w₀^G w₀^{G̃}`, the longest relative representative in `^PW^P`.

**Checks.**

- At `n=1` block exchange swaps the two coordinates.
- At `n=0` it is the unique permutation of the empty set.
- At `n=2` it sends `(0,1,2,3)` to `(2,3,0,1)`; full reversal gives `(3,2,1,0)`.

(CN, §2.1.11, p.17.)

*Needs:* `mathlib:Fin.revPerm`; **PotentialAutomorphyInfrastructure, Layer 1** (kostant shuffles); **PotentialAutomorphyInfrastructure, Layer 0** (unitary levi weight dictionary); `mathlib:finAddFlip`.

### 0.2 Surjectivity of evaluation at the identity

Prove `CrystallineCM.coefficient_evaluation_surjective`. Let `P_{n,n} ⊂ GL_{2n}` be the block upper-triangular parabolic with Levi `GL_n × GL_n`, so that `V_{λ̃_τ}` is the evaluation of `(Ind_{P_{n,n}}^{GL_{2n}} V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}})_{/O}`. The natural `P_{n,n}(O)-equivariant` morphism `V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}}` given by evaluation of functions at the identity is surjective.

(CN, Lemma 2.1.12, pp.17–18.)

*Needs:* **ArithmeticLocallySymmetricSpaces:ALS.1** (arithmetic local system); **PotentialAutomorphyInfrastructure, Layer 0** (unitary levi weight dictionary); **PotentialAutomorphyInfrastructure, Layer 0**.

### 0.3 Parahoric levels `P_{v̄}(b,c)`, `Q_{v̄}`, the operators `Ũ` and the monoids `Δ̃`

Define `CrystallineCM.ParahoricPVBC`. For `c≥b≥0, c≥1`, under `ι_ṽ` define `P_{v̄}(b,c)⊂GL_{2n}(O_{F_ṽ})` by `C≡0` mod `ϖ_ṽ^c` in `g=(A B;C D), A≡D≡1_n` mod `ϖ_ṽ^b`. `P_{v̄}(0,1)` is the Siegel parahoric. For `Q⊂P` standard, `𝒬` is the inverse image of `Q(k_ṽ)` under reduction; its Levi intersection is `K_Q`. These are integral compact-open subgroups, with `b=0` imposing no diagonal congruence.

The required interface is:

- `CrystallineCM.ParahoricPVBC_mem_iff`: `g=(A` B;C `D`) belongs iff `C` is divisible by `ϖ_v^c` and A−1,D−1 by `ϖ_v^b`.
- `CrystallineCM.ParahoricPVBC_antitone_depth`: For `b′≥b,c′≥c` satisfying validity, `P(b′,c′)⊂P(b,c)`.
- `CrystallineCM.ParahoricPVBC_levi_quotient`: The block-diagonal reduction gives `P(0,c)/P(b,c)≅GL_n(O_v/ϖ_v^b)×GL_n(O_v/ϖ_v^b)`, for `c≥b`.

**Checks.**

- `CrystallineCM.ParahoricPVBC_test_b_zero`: P(0,1) allows arbitrary invertible diagonal blocks and arbitrary upper-right integral block.
- `CrystallineCM.ParahoricPVBC_test_n_one`: For `n=1,b=c=1, (1` 1;0 `1`) belongs while (`1` 0;1 `1`) does not.
- `CrystallineCM.ParahoricPVBC_test_diagonal_not_unipotent`: For residue field `F₃, diag(2,1)` belongs to P(0,1) but not P(1,1).

(CN, §2.1.13, p.19.)

*Needs:* **PotentialAutomorphyInfrastructure, Layer 3** (unitary ordinary tower); **SmoothRepresentationsOfLocalGroups:SR.0**.

### 0.4 The eigenvalue of U_v on localized cohomology

Prove `CrystallineCM.residual_central_hecke_eigenvalue`. Let `m ⊂ T^T(K,λ)` be as in CN, Theorem 2.1.20 with `k =` k(m), and `v` a p-adic place of `F`. Then the Hecke operator `U_v` has a unique eigenvalue on `H^*(X_K, V_λ/ϖ)_m`, equal to `ε̄_p^{n(n−1)/2}(Art_{F_v}(ϖ_v))` · det `ρ̄_m(Art_{F_v}(ϖ_v))`.

(CN, Lemma 2.1.21, pp.22–23.)

*Needs:* **IntegralHeckeAndGaloisDeterminants:IHG.5**; **IntegralHeckeAndGaloisDeterminants:IHG.3** (gln satake coefficients); **ArithmeticLocallySymmetricSpaces:ALS.3** (hecke operator formula); **ArithmeticLocallySymmetricSpaces:ALS.3**.

### 0.5 Positive central cocharacters

Define `CrystallineCM.PositiveCentralCocharacters`. For `Q` with consecutive block sizes `n₁,…,n_t` refining (n,n), `X_Q` consists of central cocharacters constant on each block with integer exponents `a₁≥⋯≥a_t`. Evaluation at `ϖ` gives `diag(ϖ^{a₁}1_{n₁},…,ϖ^{a_t}1_{n_t})`; partial cocharacters have `a₁=⋯=a_k=1` and the rest `0`. Central overall shifts are allowed, including negative shifts.

The required interface is:

- `CrystallineCM.PositiveCentralCocharacters_mem_iff`: A block-central tuple belongs to `X_Q` iff `a₁≥⋯≥a_t`.
- `CrystallineCM.PositiveCentralCocharacters_add`: `X_Q` is closed under addition, and evaluation sends addition to multiplication of diagonal matrices.
- `CrystallineCM.PositiveCentralCocharacters_partial`: The k-th tuple (1,…,1,0,…,0) belongs; `k=t` is the invertible scalar tuple.

**Checks.**

- `CrystallineCM.PositiveCentralCocharacters_test_two_blocks`: For (n,n), exponent tuples (1,0) and (−1,−2) are positive; (0,1) is not.
- `CrystallineCM.PositiveCentralCocharacters_test_central_scalar`: For any allowed `Q⊂P,` a scalar tuple (a,…,a), including a<0, belongs to `X_Q`; this does not require the out-of-scope `Q=GL_{2n}`.
- `CrystallineCM.PositiveCentralCocharacters_test_root_pairing`: For the block boundary simple root `a_k−a_{k+1}` is the pairing, so the cone agrees with the reductive-group dominant cone.

(CN, §2.1.13, p.19.)

*Needs:* §0.3.

### 0.6 Positive parahoric monoid

Define `CrystallineCM.PositiveParahoricMonoid`. `Δ̃^Q=⋃_{ν∈X_Q}𝒬ν(ϖ)𝒬⊂G̃(L); Δ^{Q,+}=Δ̃^Q∩G(L)`, and `Δ^Q` is obtained by adjoining the inverse of `ũ_n` to `Δ^{Q,+}`. The semidirect submonoid acting through `P` is `Δ^{Q,+}⋉U₀`. `Δ^Q` inverts `ũ_n`, not every positive partial block cocharacter.

In the split local matrix model, take a discrete valuation ring `O_v`, its fraction
field `L` and an irreducible local uniformizer `π`. Let `I` index the matrix rows and
let `b:I→{0,…,t−1}` record the consecutive blocks of `Q`. The integral parahoric
consists of the invertible matrices `q` over `O_v` satisfying `q_{ij}∈(π)` whenever
b(j)<b(i). Embed it in `GL_I(L)` by the existing general-linear-group map on the
inclusion `O_v→L`. For `a∈X_Q`, let `d_a` have diagonal entry `π^{a_{b(i)}}` in row `i`.
The carrier of `Δ̃^Q` is exactly the set of `q₁d_aq₂` with both `q_i` in that integral
parahoric and `a∈X_Q`. It is a submonoid with this carrier, rather than the closure
of a larger set that might contain additional double cosets. The identity uses
`a=0`; multiplication uses the Iwahori decomposition and the two root-group
contraction inequalities of CN Lemma 2.1.15(1–2), p.20.

Pull this submonoid back along the fixed Levi homomorphism `ι:G(L)→GL_I(L)`.
Membership is equivalent to membership of `ι(g)` in the displayed matrix monoid;
multiplication is inherited from G(L). Its extension `Δ^Q` is the submonoid of
G(L) generated by `Δ^{Q,+}` and `ũ_n⁻¹`. Centrality of `ũ_n` implies that an element
of this extension can be written `ũ_n^{-k}g` with `k≥0` and `g∈Δ^{Q,+}`. For any
monoid `T` and homomorphism `f:Δ^{Q,+}→T` for which `f(ũ_n)` is a unit, there is
exactly one extension to `Δ^Q`. For a representation, `T` is the monoid of linear
endomorphisms, so the hypothesis requires invertibility of just the selected
operator. The arithmetic specialization supplies the actual split-place Levi
embedding, its central Siegel element and the contracting action on `U₀`. The
DVR matrix formula alone does not assert compactness, openness or smoothness;
those use the topology of the local field and the corresponding supplier APIs.

The required interface is:

- `CrystallineCM.PositiveParahoricMonoid_double_coset`: Each `g∈𝒬ν(ϖ)𝒬` with `ν∈X_Q` maps to `Δ̃^Q`.
- `CrystallineCM.PositiveParahoricMonoid_levi_intersection`: Its intersection with the embedded G(L) is exactly `Δ^{Q,+}`, with the same multiplication.
- `CrystallineCM.PositiveParahoricMonoid_localization`: A `Δ^{Q,+}-action` with `ũ_n` invertible extends uniquely to `Δ^Q`.

**Checks.**

- `CrystallineCM.PositiveParahoricMonoid_test_identity`: The zero cocharacter gives all of `𝒬`, including the identity.
- `CrystallineCM.PositiveParahoricMonoid_test_negative_central`: `ϖ^{-1}1_{2n}` belongs because its block-exponent differences are zero.
- `CrystallineCM.PositiveParahoricMonoid_test_partial_inverse`: For two blocks `diag(1_n,ϖ1_n)` is not positive although it is invertible in `G̃(L)`; positivity is not the whole group.

(CN, §2.1.13, pp.19–20.)

*Needs:* §0.5; §0.3.

### 0.7 Positivity, monoid property and Hecke algebra isomorphism for Δ̃^Q

Prove `CrystallineCM.positive_parahoric_hecke_iso`. `(1)` For `ν ∈ X_{Q_{v̄}}, ν(ϖ_{v̄})` is `𝒬_{v̄}-positive: ν(ϖ)(N_Q ∩ 𝒬)ν(ϖ)^{−1} ⊂ N_Q ∩ 𝒬` and `ν(ϖ)^{−1}(N̄_Q ∩ 𝒬)ν(ϖ) ⊂ N̄_Q ∩ 𝒬`. `(2) Δ̃^{Q}_{v̄}` is a monoid. `(3) [(M_Q ∩ 𝒬)ν(ϖ)(M_Q ∩ 𝒬)] ↦ [𝒬 ν(ϖ) 𝒬]` is a ring isomorphism `H(M_Q ∩ Δ̃^Q, M_Q ∩ 𝒬) ≅ H(Δ̃^Q, 𝒬)`, factoring through an isomorphism to `H(Δ^{Q,+}, G(F⁺_{v̄}) ∩ 𝒬)`; in particular `H(Δ̃^Q, 𝒬)` is commutative.

(CN, Lemma 2.1.15, p.20; Remark 2.1.16.)

*Needs:* §0.3; **SmoothRepresentationsOfLocalGroups:SR.4**; **ArithmeticLocallySymmetricSpaces:ALS.3** (hecke composition); §0.6; §0.5.

### 0.8 Lowest-weight scaling character

Define `CrystallineCM.LowestWeightScalingCharacter`. For the dual Weyl weight `λ̃` and `Q`, define `α̃_λ̃:Δ̃^Q→E×`, trivial on `𝒬`, by `α̃_λ̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀^{G̃}λ̃_τ⟩}`. Separately define `α_λ:Δ^Q→E×`, trivial on `K_Q`, by `α_λ(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀^Gλ̃_τ⟩}`, with `ν` in the actual lower-right/conjugate-dual Levi embedding and `w₀^G` reversing each n-block. Extend the latter to inverse powers of `ũ_n`. The two longest Weyl elements differ; equality of `α̃` restricted to the Levi and `α_λ` is not asserted.

The algebraic construction takes a monoid `D,` a field `E,` a finite set of embeddings, units `π_τ=τ(ϖ)`, integer weight rows `λ_τ` and a central-exponent homomorphism `e:D→(ℤ^r,+)`. For a Weyl permutation `w`, its value at `g` is the product of `π_τ` raised to `Σ_i e(g)_i λ_{τ,w⁻¹(i)}`. Integer exponents include negative central cocharacters. Additivity of `e` gives a monoid character with values in E×. In the split unitary case `r=2n` and `w` reverses all coordinates; in the Levi case `w` reverses the two n-blocks separately. For the latter permutation, compose the full reversal with the Siegel block exchange. The arithmetic monoids supply their own exponent maps and compact submonoids on which `e` vanishes; identifying these maps from the parahoric double cosets and the conjugate-dual Levi embedding is required before applying the construction to either arithmetic character.

For adjoining `ũ_n⁻¹`, take a monoid `H` generated by the image of `D` and the inverse of the selected unit representing `ũ_n`. An exponent map on `H` extending `e` constructs the extended character; generation makes it unique, and its value on this inverse is `α_λ(ũ_n)⁻¹`. This does not require every positive partial-block cocharacter to become invertible. The inverse-rescaling convention then uses `α_λ(g)⁻¹ρ(g)`. The scalar character alone does not identify a coefficient lattice or prove lattice stability: those statements use the integral dual-Weyl evaluation and splitting. In particular, PotentialAutomorphyInfrastructure §3.5’s ACC lowest-weight character, whose uniformizer value is normalized to `1` and whose compact-unit value records the weight, has a different normalization and cannot substitute for this compact-trivial rescaling character.

The required interface is:

- `CrystallineCM.LowestWeightScalingCharacter_compact`: `α̃(q)=1` for `q∈𝒬`.
- `CrystallineCM.LowestWeightScalingCharacter_cocharacter`: `α̃(ν(ϖ))=∏_τ τ(ϖ)^{⟨ν,w₀λ̃_τ⟩}`.
- `CrystallineCM.LowestWeightScalingCharacter_mul`: Each of `α̃` and `α_λ` is multiplicative on its own monoid; the Levi character extends uniquely when `ũ_n` is inverted. Their relation in coefficient comparison uses the explicit `w₀^P` block exchange, rather than equality by restriction.

**Checks.**

- `CrystallineCM.LowestWeightScalingCharacter_test_zero_weight`: For `λ̃=0, α̃` is the trivial character.
- `CrystallineCM.LowestWeightScalingCharacter_test_rank_one`: For `GL₂, λ̃=(a,b)` and `ν=(1,0), α̃(ν(ϖ))=ϖ^b` at the identity embedding.
- `CrystallineCM.LowestWeightScalingCharacter_test_compact_value`: A compact parahoric element has `α̃=1`, agreeing with the original integral lattice action.
- `CrystallineCM.LowestWeightScalingCharacter_test_distinct_weyl`: For `n=2, λ̃=(1,1,0,0)` and `ν=(1,1,0,0), α̃(ν(ϖ))=1` while `α_λ(ν(ϖ))=ϖ²` at one embedding. Equality by restriction would fail this allowed Siegel example.

(CN, §2.1.13, p.20 (unitary character); CN, §2.1.13, p.21 (Levi character).)

*Needs:* §0.7; §0.1; **PotentialAutomorphyInfrastructure, Layer 0** (unitary levi weight dictionary); §0.6.

### 0.9 Rescaled actions of the monoids on coefficient lattices

Define `CrystallineCM.RescaledActions`. For an E-linear representation `ρ` of `Δ̃^Q` and its lowest-weight scaling character `α̃`, define `ρ^{scaled}(g)=α̃(g)^{-1}ρ(g)`. The lattice and integral coefficient sheaf use its restriction provided Lemma 2.1.17 holds. The Levi action similarly uses `α_λ^{-1}`; rescaled `ũ_n` acts as identity on `V_λ`. Multiplying by `α` rather than its inverse gives the wrong integral action.

The required interface is:

- `CrystallineCM.RescaledActions_apply`: `ρ_scaled(g)x=α(g)^{-1}ρ(g)x`.
- `CrystallineCM.RescaledActions_one_mul`: `ρ_scaled` is a monoid representation: its identity is identity and products act by composed operators.
- `CrystallineCM.RescaledActions_intertwiner`: An E-linear `ρ-intertwiner` for the same character `α` remains an intertwiner after rescaling.

**Checks.**

- `CrystallineCM.RescaledActions_test_trivial_character`: If `α=1`, rescaling returns the original representation.
- `CrystallineCM.RescaledActions_test_scalar`: On any vector with `ρ(g)x=α(g)x`, the rescaled operator fixes `x`. On a one-dimensional Q-vector space with `ρ(g)=2` and `α(g)=2`, it is identity.
- `CrystallineCM.RescaledActions_test_inverse_required`: In that scalar example multiplying by `α` gives `4`, which fails the normalization.

(CN, Lemma 2.1.17, p.20; Levi action, p.21.)

*Needs:* §0.3; **PotentialAutomorphyInfrastructure, Layer 0** (unitary levi weight dictionary); `mathlib:Representation`; §0.8.

### 0.10 Stability of the lattice under the rescaled monoid action

Prove `CrystallineCM.rescaled_lattice_stable`. For `v̄ ∈ S̄` and `τ ∈ Hom(F⁺_{v̄},E)`, the lattice `V_{λ̃_τ}` is stable under the rescaled action (2.1.7) of `O[Δ̃^{Q}_{v̄}]`.

(CN, Lemma 2.1.17, p.20.)

*Needs:* §0.9; §0.2; **PotentialAutomorphyInfrastructure, Layer 0**.

### Examples

At `n=2` the permutation sends (0,1,2,3) to (2,3,0,1). For two Levi blocks, (−1,−2) is positive while (0,1) is not. On `GL₂` at weight (a,b), the cocharacter `diag(π,1)` has lowest-weight scalar `π^b`. Thus raw scalar action `π` and scalar character `π` give rescaled action `1`. The single-embedding formula is `lowestWeightScalar`; its full unitary reversal is distinct from reversal within each Levi block.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.1**; **ArithmeticLocallySymmetricSpaces:ALS.3**; **IntegralHeckeAndGaloisDeterminants:IHG.3**; **IntegralHeckeAndGaloisDeterminants:IHG.5**; **PotentialAutomorphyInfrastructure, Layer 0**; **PotentialAutomorphyInfrastructure, Layer 1**; **PotentialAutomorphyInfrastructure, Layer 3**; **SmoothRepresentationsOfLocalGroups:SR.0**; **SmoothRepresentationsOfLocalGroups:SR.4**.

## Layer 1: P-ordinary functors and completed level control

Construct P-ordinary finite-level cohomology using imported ordinary projectors. On smooth `O/ϖ^m` representations define finite-sum contracting transfer, exact monoid localization in `ũ_n` alone, and `POrd=ord RΓ(U₀,−)`. Construct completed interior and boundary objects at fixed tame level. Prove that compact Levi derived invariants recover ordinary finite-level cohomology for `c≥b≥0,c≥1`; increasing `c` with `b` fixed is an isomorphism. Extend this control to `Q⊂P` parahorics without replacing POrd by full QOrd.

### 1.1 P-ordinary part of finite-level cohomology

Define `CrystallineCM.POrdinaryFiniteLevel`. Fix `S̄ ⊂ S̄_p` and good `K̃` with fixed tame level and `K̃_{v̄} = P_{v̄}(b,c) (c ≥ b ≥ 0, c ≥ 1)` for `v̄ ∈ S̄`, written `K̃(b,c), P_{S̄}(b,c) := ∏_{v̄∈S̄} P_{v̄}(b,c)`. The P-ordinary part `RΓ(X̃_{K̃(b,c)}, V_λ̃)^{ord}` is the maximal direct summand of `RΓ(X̃_{K̃(b,c)}, V_λ̃)` on which all `Ũ_{ṽ,n} (v̄ ∈ S̄)` act invertibly; it is an object of `D⁺(P_{S̄}(0,c)/P_{S̄}(b,c), O)` with an action of `T̃^T ⊗ (⊗_{v̄∈S̄} H(Δ̃_{v̄}, K̃_{v̄})[Ũ^{−1}_{ṽ,n}])`; likewise for `∂X̃_{K̃(b,c)}`.

The required interface is:

- `CrystallineCM.POrdinaryFiniteLevel_idempotent`: The finite or adic ordinary projector on the arithmetic complex is idempotent and commutes with the tame Hecke and quotient-group actions.
- `CrystallineCM.POrdinaryFiniteLevel_cohomology`: Its cohomology is the maximal summand of `H^q` on which every chosen `Ũ_n` acts bijectively.
- `CrystallineCM.POrdinaryFiniteLevel_pullback`: Level pullback maps commuting with `Ũ_n` restrict to the ordinary summands; its inclusion is a natural split map.

**Checks.**

- `CrystallineCM.POrdinaryFiniteLevel_test_unit`: For `U=id` the whole arithmetic coefficient complex is ordinary.
- `CrystallineCM.POrdinaryFiniteLevel_test_zero`: For `U=0` the ordinary summand is zero.
- `CrystallineCM.POrdinaryFiniteLevel_test_mixed`: For `T=diag(1,0)` on `F₃²` in degree zero, `T²=T`; for every `m≥1`, `range(T^m)=F₃×0` and `ker(T^m)=0×F₃`. The ordinary part is the first coordinate, in agreement with Mathlib Fitting range/ker and §1.3's localization comparison.

(CN, §2.2.1, pp.25–26.)

*Needs:* §0.3; §0.9; §0.10; **PadicFamilies, Layer 0a** (derived ordinary idempotent); **PadicFamilies, Layer 0a** (ordinary part complexes); **ArithmeticLocallySymmetricSpaces:ALS.1** (finite complex model).

### 1.2 Unipotent transfer action

Define `CrystallineCM.UnipotentTransferAction`. For contracting `g∈Δ⁺` and `π` smooth on `Δ⁺⋉U₀`, act on `Γ(U₀,π)` by `T_g(v)=Σ_{n∈U₀/gU₀g^{-1}}ngv`. This is independent of coset representatives, is integral without averaging denominators, and is multiplicative in `g`. Derive the same action on `RΓ(U₀,π)`.

At degree zero the formula needs a group `U`, its coefficient representation `ρ,` a contraction `c:U→U` with finite-index image, and an R-linear raw operator A satisfying `Aρ(u)=ρ(c(u))A`. The arithmetic dictionary is `c(u)=gug⁻¹` and `A(v)=gv`. For `v∈V^U`, the vector Av is fixed by c(U), so each term `ρ(r)Av` depends only on the left coset `r` c(U). Summing over these cosets gives an R-linear endomorphism of Mathlib's `Representation.invariants`. This formulation permits A to be noninvertible and works integrally without a choice of averaging denominators.

For injective contractions c,d, representatives for U/c(U) and U/d(U) combine as a·c(b), giving representatives for U/cd(U). If A and `B` satisfy the two intertwining equations, this identifies `T_c(A)T_d(B)` with `T_cd(AB)`; the identity contraction with raw identity operator gives the identity transfer. Surjectivity of `c` makes the quotient a singleton and gives `T_c(A)v=Av`. At `U=(Z_p,+), c(z)=pz`, the quotient is the residue field `Z`/pZ; on trivial `F_p` coefficients with `A=id`, all `p` summands are equal, so the resulting operator is zero and differs from the raw identity.

The supplementary compatibility `CrystallineCM.UnipotentTransferAction_intertwiner` fixes the coefficient maps in this formula. Let `ρ` and `σ` be R-linear representations of the same group `U, c:U→U` a homomorphism with finite-index image, and A and `B` raw operators satisfying `Aρ(u)=ρ(c(u))A` and `Bσ(u)=σ(c(u))B`. If `F:ρ→σ` is a Mathlib intertwining map and `FA=BF`, its restriction `F^U` to the invariant submodules satisfies `F^U T_c(A)=T_c(B)F^U`. Push `F` through the finite sum and use its two intertwining identities term by term. This consequence of CN equation (2.2.1), p.26, controls coefficient and level maps when their raw actions are supplied; it asserts no derived comparison. The raw-operator hypothesis matters even for `U=1`: with `V=W=Q, F=id, A=2·id` and `B=3·id, F` is U-equivariant but the two transfers differ.

The smooth positive-monoid action uses the actual contracting elements and their open finite-index images. The general integral trace is supplied by `TauCeti.DiscreteCoind.traceLinear`, with its arbitrary-transversal identity `TauCeti.DiscreteCoind.trace_eq_sum_transversal`; its finite sum applied to the constant c(U)-invariant vector Av gives the displayed degree-zero formula. These declarations belong to `TauCeti.RepresentationTheory.Homological.ContCohomology.Coinduced.Discrete`. **ProfiniteCohomology, Layer 10** supplies continuous restriction, conjugation and all-degree corestriction. The construction here composes those maps with the raw contracting action, retaining the compact-unipotent acyclicity and smoothness statements needed for the derived invariants functor. The algebraic degree-zero formula supplies its normalization check.

The required interface is:

- `CrystallineCM.UnipotentTransferAction_independent`: Replacing any representative `n` by an element of its same left coset does not change `T_g` on `U₀-invariants`.
- `CrystallineCM.UnipotentTransferAction_mul`: `T_{gh}=T_g∘T_h` and `T_1=id`.
- `CrystallineCM.UnipotentTransferAction_compact`: When `g` normalizes `U₀, T_g` is the usual g-action because the quotient has one element.

**Checks.**

- `CrystallineCM.UnipotentTransferAction_test_trivial_u`: For `U₀=1` the transfer action is the original g-action.
- `CrystallineCM.UnipotentTransferAction_test_index_p`: For `U₀=Z_p,g` contracting by `p` and trivial `F_p` coefficients, `T_g=p·id=0`.
- `CrystallineCM.UnipotentTransferAction_test_not_raw`: In this index-p example raw `g=id` would incorrectly make it ordinary.

(CN, §2.2.2, equation (2.2.1), p.26.)

*Needs:* **SmoothRepresentationsOfLocalGroups:SR.0**; **ProfiniteCohomology, Layers 10–11**; §0.3.

### 1.3 Ordinary monoid localization

Define `CrystallineCM.OrdinaryMonoidLocalization`. For smooth `Δ⁺-modules` over `R_m`, ord is the filtered colimit under products of the commuting central operators `ũ_n`, regarded as a smooth `Δ-module`. It is exact and preserves the injectives needed to derive compact invariants. Do not replace it by a finite-projector formula for arbitrary smooth infinite modules.

For the underlying module at a single operator `T`, reuse **SmoothRepresentationsOfLocalGroups:SR.6.5**, [Stable module operators](../SmoothRepresentationsOfLocalGroups/README.md#sr65-stable-module-operators). Its `StableOperator.localization` is Mathlib's `Module.DirectLimit` of the system with transition maps `T^{j−i}`, and `StableOperator.localizationMap` is the structure map from index zero. `StableOperator.invertiblePart` identifies this colimit with `range(T^c)` for some `c≥1` when `T` is stable. The identity, nilpotent and mixed-operator comparisons are supplied there by `localization_identity`, `localization_nilpotent` and `localization_mixed`. These prerequisites concern underlying modules and have no smoothness or group-action hypotheses.

The specialization here must equip those colimits with the actual `Δ-action` extending the supplied `Δ⁺-action`, retain smoothness, and compare successive localizations for the commuting `ũ_n`. Its unit and universal property are morphisms of these representations. The derived comparison additionally uses exactness and preservation of the relevant injectives in the smooth categories. A linear equivalence of underlying modules alone supplies none of those action or injectivity assertions. The localization tests below retain their representation actions when applying the underlying module comparisons.

The required interface is:

- `CrystallineCM.OrdinaryMonoidLocalization_unit`: Every smooth `π` maps naturally to ord `π` by the filtered-colimit structure map.
- `CrystallineCM.OrdinaryMonoidLocalization_universal`: Maps from `π` into a `Δ-module` extend uniquely through ord `π`.
- `CrystallineCM.OrdinaryMonoidLocalization_cohomology`: Exact localization satisfies `H^j(ord C)=ord H^j(C)`, with the same operator action.

**Checks.**

- `CrystallineCM.OrdinaryMonoidLocalization_test_id`: Localization under `U=id` is `π` itself.
- `CrystallineCM.OrdinaryMonoidLocalization_test_nilpotent`: If `U^r=0`, ord `π=0` even when `π` is infinite-dimensional.
- `CrystallineCM.OrdinaryMonoidLocalization_test_finite`: On a finite module it agrees with the imported finite ordinary projector. For `T=diag(1,0)` on `F₃²`, the positive-power ranges and kernels are `F₃×0` and `0×F₃` as in §1.1; localization retains the first coordinate and kills the second.

(CN, §2.2.2, p.26.)

*Needs:* **SmoothRepresentationsOfLocalGroups:SR.0**; **SmoothRepresentationsOfLocalGroups:SR.6.5** (underlying module localization and stable-operator comparison); **IntegralHeckeAndGaloisDeterminants:IHG.2** (ordinary localization comparison). The smooth positive-monoid action, exactness and injective-preservation comparison are the additional supplier contracts specified above.

### 1.4 Functors of P-ordinary parts of smooth representations

Define `CrystallineCM.POrdinaryFunctors`. For `π∈D⁺_sm(Δ̃^Q_{S̄},R_m)` with `R_m=O/ϖ^m`, restrict to `Δ̃^Q_{S̄,P}=Δ^{Q,+}_{S̄}⋉U₀_{S̄}`, take `RΓ(U₀_{S̄},π)` with its `Δ^{Q,+}_{S̄}` transfer action, and apply ord, inverting only the commuting `ũ_n` operators, to obtain `POrd(π)∈D⁺_sm(Δ^Q_{S̄},R_m)`. Products over selected places give this local functor. For `π` in degree zero, `H⁰(POrd π)=ord Γ(U₀_{S̄},π)`.

The required interface is:

- `CrystallineCM.POrdinaryFunctors_degree_zero`: `H⁰(POrd π)=ord Γ(U₀,π)` for `π` in degree zero.
- `CrystallineCM.POrdinaryFunctors_derived_action`: Each contracting element acts by derived restriction/finite-index transfer, not by its raw representation action.
- `CrystallineCM.POrdinaryFunctors_comparison`: For `U₀` trivial, POrd `π` is ordinary monoid localization of `π`, with no cohomological shift.

**Checks.**

- `CrystallineCM.POrdinaryFunctors_test_trivial_u`: If `U₀=1` it equals the ordinary localization with no shift.
- `CrystallineCM.POrdinaryFunctors_test_nilpotent`: If a power of transfer annihilates every `H^j(U₀,π)`, then POrd `π=0`. Nilpotence on `H⁰` alone does not suffice.
- `CrystallineCM.POrdinaryFunctors_test_derived_transfer`: For `U₀=Z_p`, trivial `π=F_p`, contraction `z↦pz` and raw operator identity, transfer is zero on `H⁰` and identity on `H¹`. Thus `H⁰(POrd π)=0` and `H¹(POrd π)=F_p`, as in §3.8.
- `CrystallineCM.POrdinaryFunctors_test_degree_zero`: For `π` in degree zero `H⁰` is ord `Γ(U₀,π)`, while positive cohomology is retained when ordinary transfer permits it.

(CN, Definition 2.2.3, pp.26–27.)

*Needs:* §0.3; **SmoothRepresentationsOfLocalGroups:SR.0**; **ProfiniteCohomology, Layers 10–11**; **IntegralHeckeAndGaloisDeterminants:IHG.2** (ordinary localization comparison); §1.2; §1.3; `mathlib:DerivedCategory`; §0.6.

### 1.5 Ordinary parts commute with K(b)-invariants

Prove `CrystallineCM.ordinary_commutes_compact_invariants`. There is a natural isomorphism `ord_b` ∘ `Γ(K_{S̄}(b),−) ≅ Γ(K_{S̄}(b),−)` ∘ ord of functors `Mod_sm(Δ⁺_{S̄}, O/ϖ^m) → Mod(Δ_{S̄}/K_{S̄}(b), O/ϖ^m)`, extending to derived functors `ord_b` ∘ `RΓ(K_{S̄}(b),−) ≅ RΓ(K_{S̄}(b),−)` ∘ ord.

(CN, Lemma 2.2.4, p.27.)

*Needs:* §1.4; **PadicFamilies, Layer 0a** (ordinary projector natural).

### 1.6 P-ordinary invariants at level P(b,c)

Prove `CrystallineCM.ordinary_parahoric_invariants`. For all `c ≥ b ≥ 0` with `c ≥ 1` there is a natural isomorphism `ord_b` ∘ `Γ(U⁰_{S̄}` ⋊ `K_{S̄}(b)`, −) `≅ ord_b` ∘ `Γ(P_{S̄}(b,c)`, −) of functors `Mod_sm(Δ̃_{S̄}, O/ϖ^m) → Mod(Δ_{S̄}/K_{S̄}(b), O/ϖ^m)`.

(CN, Lemma 2.2.5, p.27.)

*Needs:* §1.4; §0.3.

### 1.7 P-ordinary completed cohomology

Define `CrystallineCM.POrdinaryCompleted`. `π(K̃^{S̄}, λ̃, m) := RΓ(K̃^{S̄}, RΓ(𝔛̄_{G̃}, V_λ̃/ϖ^m)) ∈ D⁺_sm(Δ̃_{S̄}, O/ϖ^m)` with `T̃^T-action` (using CN, Lemma 2.1.8), satisfying `RΓ(P_{S̄}(b,c), π(K̃^{S̄},λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m); π^{ord}(K̃^{S̄},λ̃,m) ∈ D⁺_sm(Δ_{S̄}, O/ϖ^m)` is its P-ordinary part (Definition 2.2.3), and `π^{ord}_∂` the boundary analogue.

The required interface is:

- `CrystallineCM.POrdinaryCompleted_sections`: The underlying completed object is `RΓ(K̃^{S̄},RΓ(𝔛̄_{G̃},V/ϖ^m))`; its POrd is the object defined by the local functor.
- `CrystallineCM.POrdinaryCompleted_tame`: Tame Hecke correspondences act and commute with the local ordinary operators.
- `CrystallineCM.POrdinaryCompleted_boundary`: Restriction to boundary intertwines the two completed POrd objects and the finite-level recovery maps.

**Checks.**

- `CrystallineCM.POrdinaryCompleted_test_empty_places`: With `S̄=∅` no ordinary operators are imposed and the object is the completed tame-level coefficient complex.
- `CrystallineCM.POrdinaryCompleted_test_level_recovery`: For `b=0,c=1`, compact Levi invariants recover Siegel-parahoric ordinary finite-level cohomology.
- `CrystallineCM.POrdinaryCompleted_test_boundary`: Boundary restriction commutes with the same level-recovery square, rather than defining completed boundary cohomology as a quotient of interior cohomology.

(CN, §2.2.7, p.28.)

*Needs:* §1.4; **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 6**; **ArithmeticLocallySymmetricSpaces:ALS.3** (discrete topological comparison).

### 1.8 P-ordinary parts at parahoric level Q

Define `CrystallineCM.ParahoricVariant`. For standard `Q_{v̄}⊂P_{v̄}`, with `𝒬_{v̄}` its integral parahoric and `K_{v̄}=𝒬_{v̄}∩G(F⁺_{v̄})`, define the parahoric P-ordinary invariant functor `π↦RΓ(K_{S̄},ord RΓ(U₀_{S̄},π))`. It takes values in `D⁺(K_{S̄}[ũ_n^{±1}]/K_{S̄},O/ϖ^m)` with `H(Δ^{Q_{S̄}},K_{S̄})` action. Here ord inverts `ũ_n` alone; it does not invert every Q-partial Hecke operator.

The required interface is:

- `CrystallineCM.ParahoricVariant_invariants`: Its value is `RΓ(K_Q,ord RΓ(U₀,π))`, with ord inverting `ũ_n` alone.
- `CrystallineCM.ParahoricVariant_hecke`: `[K_QνK_Q]` acts through finite correspondences even when `K_Q` is not normal in the monoid.
- `CrystallineCM.ParahoricVariant_siegel`: For `Q=P` this specializes to the Siegel P-ordinary invariant functor and Lemma 2.2.6 level comparison.

**Checks.**

- `CrystallineCM.ParahoricVariant_test_siegel`: For `Q=P` the value agrees with Siegel P-ordinary invariants.
- `CrystallineCM.ParahoricVariant_test_finite_level`: At `Q=P,b=0,c=1` its completed-tower value identifies with Siegel-parahoric finite-level ordinary cohomology by Proposition 2.2.8.
- `CrystallineCM.ParahoricVariant_test_not_full_qord`: In the partition (1,1,1,1), inverting `Ũ²` alone does not imply `Ũ¹` and `Ũ³` have unit eigenvalues.

(CN, §2.2.11, p.29.)

*Needs:* §1.4; §0.7; **ProfiniteCohomology, Layers 10–11**; §0.6.

### 1.9 Derived comparison of P-ordinary parts at finite level

Prove `CrystallineCM.derived_ordinary_level_comparison`. For `π ∈ D⁺_sm(Δ̃_{S̄}, O/ϖ^m)` and `c ≥ b ≥ 0, c ≥ 1`, there is a natural isomorphism `RΓ(K_{S̄}(b)`, ord `RΓ(U⁰_{S̄}, π)) ≅ ord_b RΓ(P_{S̄}(b,c), π`) in `D⁺(Δ_{S̄}/K_{S̄}(b), O/ϖ^m)`.

(CN, Lemma 2.2.6, p.28.)

*Needs:* §1.5; §1.6; **ProfiniteCohomology, Layers 10–11**; **SmoothRepresentationsOfLocalGroups:SR.0**.

### 1.10 Finite-level P-ordinary cohomology from completed cohomology

Prove `CrystallineCM.completed_ordinary_finite_level`. For `m ≥ 1` and `c ≥ b ≥ 0, c ≥ 1`, there is a natural `T̃^T-equivariant` isomorphism `RΓ(K_{S̄}(b), π^{ord}(K̃^{S̄},λ̃,m)) ≅ RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord}` in `D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m)`.

(CN, Proposition 2.2.8, p.28.)

*Needs:* §1.9; §1.7; §1.1.

### 1.11 Boundary version of the P-ordinary comparison

Prove `CrystallineCM.completed_boundary_ordinary_finite_level`. For `m ≥ 1` and `c ≥ b ≥ 0, c ≥ 1, RΓ(K_{S̄}(b), π^{ord}_∂(K̃^{S̄},λ̃,m)) ≅ RΓ(∂X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord}, T̃^T-equivariantly`, in `D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m)`.

(CN, Proposition 2.2.10, p.29.)

*Needs:* §1.9; §1.7; **ArithmeticLocallySymmetricSpaces:ALS.4** (boundary triangle).

### 1.12 P-ordinary parts at parahoric level with their Hecke actions

Prove `CrystallineCM.ordinary_parahoric_hecke_comparison`. For `π ∈ D⁺_sm(Δ̃^{Q_S̄}_{S̄}, O/ϖ^m)` there is a natural isomorphism `RΓ(K_{S̄}`, ord `RΓ(U⁰_{S̄}, π)) ≅ ord₀ RΓ(𝒬_{S̄}, π`) in `D⁺_sm(K_{S̄}[ũ^{±1}_{ṽ,n}]/K_{S̄}, O/ϖ^m)`, under which `[K_{v̄} ν(ϖ_{v̄}) K_{v̄}] ∈ H(Δ^{Q_S̄}_{S̄}, K_{S̄})` matches `[𝒬_{v̄} ν(ϖ_{v̄}) 𝒬_{v̄}]`.

(CN, Lemma 2.2.12, pp.29–30.)

*Needs:* §1.8; §1.9; **ArithmeticLocallySymmetricSpaces:ALS.3** (hecke action on invariants).

### 1.13 Independence of level for P-ordinary cohomology

Prove `CrystallineCM.ordinary_independence_level`. For `m ≥ 1` and `c ≥ b ≥ 0, c ≥ 1`, the natural `T̃^T-equivariant` morphism `RΓ(X̃_{K̃(b,max{1,b})}, V_λ̃/ϖ^m)^{ord} → RΓ(X̃_{K̃(b,c)}, V_λ̃/ϖ^m)^{ord}` is an isomorphism in `D⁺(K_{S̄}/K_{S̄}(b), O/ϖ^m)`; the same holds for the Borel–Serre boundary.

(CN, Corollary 2.2.9, p.28.)

*Needs:* §1.10; **ArithmeticLocallySymmetricSpaces:ALS.1** (level pullback).

### Examples

On a degree-zero `F₃²` complex with `U=diag(1,0)`, the ordinary summand is the first coordinate. For `U₀=Z_p` and contraction `z↦pz` on trivial `F_p` coefficients, the transfer is `p·id=0`, although the raw operator is id. Localizing that transfer kills the module. This checks why derived ordinary parts use transfer before localization.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.1**; **ArithmeticLocallySymmetricSpaces:ALS.3**; **ArithmeticLocallySymmetricSpaces:ALS.4**; **ArithmeticLocallySymmetricSpaces:ALS.6**; Layer 0; **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 6**; **IntegralHeckeAndGaloisDeterminants:IHG.2**; **PadicFamilies, Layer 0a**; **SmoothRepresentationsOfLocalGroups:SR.0**; **SmoothRepresentationsOfLocalGroups:SR.0d**; **SmoothRepresentationsOfLocalGroups:SR.6.5**; **ProfiniteCohomology, Layers 10–11**.

## Layer 2: Weight independence and dual ordinary parts

Identify the `GL_n` coefficient tensor through the conjugate-dual Levi embedding. Prove `ũ_n^m` annihilates the evaluation kernel modulo `ϖ^m`, giving ordinary weight independence by removing selected weights and tensoring `V_{w₀^Pλ}`. Prove the boundary analogue. Construct dual ordinary parts using lower-congruence unipotents and `ũ_n^{-1}`, and establish the inverse-coset Hecke-equivariant level comparison.

### 2.1 The Levi coefficient module as a tensor product over the two places

Prove `CrystallineCM.levi_coefficient_tensor`. Under the identification of `K_{S̄}` with the block-diagonal Levi of `∏_{v̄∈S̄} P_{n,n}(O_{F_ṽ})` (via `(A_ṽ, A_{ṽc}) ↦ diag((Ψ_n ᵗA^{−1}_{ṽc} Ψ_n)^c, A_ṽ)), V_{λ_S̄} ≅ ⊗_{v̄∈S̄} ⊗_{τ∈Hom(F⁺_{v̄},E),O} V_{−w_{0,n}λ_{τ̃c}} ⊗ V_{λ_τ̃}`, with both factors acted on through `τ̃`.

(CN, Lemma 2.2.14, p.30.)

*Needs:* **PotentialAutomorphyInfrastructure, Layer 0** (unitary levi weight dictionary); **ArithmeticLocallySymmetricSpaces:ALS.1** (arithmetic local system).

### 2.2 The kernel of evaluation is killed by ũ^m

Prove `CrystallineCM.evaluation_kernel_nilpotent`. Let `τ ∈ Hom(F⁺_{v̄},E)` and `K_{λ̃_τ} := ker(V_{λ̃_τ} → V_{λ_τ̃} ⊗ V_{−w_{0,n}λ_{τ̃c}})` be the kernel of evaluation at the identity. For every `m ≥ 1, (ũ_{ṽ,n})^m (K_{λ̃_τ}/ϖ^m) = 0` (for the rescaled action).

(CN, Lemma 2.2.16, pp.31–32.)

*Needs:* §0.2; §0.9; §0.10; **PotentialAutomorphyInfrastructure, Layer 0**.

### 2.3 Independence of weight for P-ordinary completed cohomology

Prove `CrystallineCM.ordinary_independence_weight`. Given dominant `λ̃` for `G̃` and `S̄ ⊆ S̄_p`, let `λ̃^{S̄}` be `λ̃` with `λ̃_τ` replaced by `0` for `τ` inducing places of `S̄`, and identify `λ̃` with `λ` via (2.1.4). For every `m ≥ 1` there is a natural `T̃^T-equivariant` isomorphism `π^{ord}(K̃^{S̄}, λ̃, m) ≅ π^{ord}(K̃^{S̄}, λ̃^{S̄}, m) ⊗ V_{w₀^P λ_S̄}/ϖ^m` in `D⁺_sm(Δ^{Q_S̄}_{S̄}, O/ϖ^m)`.

(CN, Proposition 2.2.15, p.31.)

*Needs:* §0.2; §2.1; §2.2; §1.7; §1.12; **SmoothRepresentationsOfLocalGroups:SR.2**.

### 2.4 Independence of weight for boundary P-ordinary completed cohomology

Prove `CrystallineCM.boundary_ordinary_independence_weight`. With `λ̃^{S̄}` as in Independence of weight for P-ordinary completed cohomology (CL.2), `π^{ord}_∂(K̃^{S̄}, λ̃, m) ≅ π^{ord}_∂(K̃^{S̄}, λ̃^{S̄}, m) ⊗ V_{w₀^Pλ_S̄}/ϖ^m, T̃^T-equivariantly` in `D⁺_sm(Δ^{Q_S̄}_{S̄}, O/ϖ^m)`.

(CN, Proposition 2.2.17, p.32.)

*Needs:* §2.3; §1.11.

### 2.5 P-ordinary parts for dual coefficients

Define `CrystallineCM.DualPOrdinary`. For `v̄ ∈ S̄, ord^∨` and `ord^∨₀` are defined using the Hecke action of `ũ^{−1}_{ṽ,n}` on invariants under `Ū¹_{v̄}` (the block strictly lower triangular part of the parahoric `P_{v̄}`) and `𝒬_{v̄}`, for representations of the inverse monoid `(Δ̃^{Q}_{v̄})^{−1} = ⊔_ν 𝒬 ν(ϖ)^{−1} 𝒬`; an independence-of-weight statement for dual coefficients follows the proof of Independence of weight for P-ordinary completed cohomology (CL.2) using `0 → V^∨_{w₀^Pλ_S̄} → V^∨_{λ̃_S̄} → K^∨_{λ̃_S̄} → 0` and topological nilpotence of `ũ^{−1}_{ṽ,n}` on `K^∨`.

The required interface is:

- `CrystallineCM.DualPOrdinary_inverse_operator`: The ordinary transition operator is the double coset `ũ_n^{-1}` acting on lower-congruence Ū¹-invariants.
- `CrystallineCM.DualPOrdinary_conjugation`: Conjugation by `ũ_n^{-1}w₀^P` identifies the lower and upper invariants, retaining inverse monoids.
- `CrystallineCM.DualPOrdinary_dual_pairing`: The finite-level coefficient evaluation pairing intertwines [KgK] with `[Kg^{-1}K]`.

**Checks.**

- `CrystallineCM.DualPOrdinary_test_trivial_weight`: At zero weight the inverse-monoid construction still uses Ū¹ and `ũ_n^{-1}`; it does not change to the upper ordinary functor automatically.
- `CrystallineCM.DualPOrdinary_test_lower_congruence`: At `n=1`, Ū¹ consists of (`1` 0;c `1`) with `c` divisible by the local uniformizer.
- `CrystallineCM.DualPOrdinary_test_adjoints`: For an invertible double coset the dual pairing sends its adjoint to `g^{-1}`, as in the ALS Hecke-adjoint declaration.

(CN, §2.2.18, pp.32–33.)

*Needs:* §1.8; §2.3; **ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality** (hecke adjoint duality).

### 2.6 Dual P-ordinary parts at parahoric level

Prove `CrystallineCM.dual_ordinary_parahoric_comparison`. For `π ∈ D⁺_sm((Δ̃^{Q}_{v̄})^{−1}, O/ϖ^m)` there is a natural isomorphism `RΓ(K_{v̄}, ord^∨ RΓ(Ū¹_{v̄}, π)) ≅ ord^∨₀ RΓ(𝒬_{v̄}, π)` in `D⁺_sm(K_{v̄}[ũ^{±1}_{ṽ,n}]/K_{v̄}, O/ϖ^m)`, matching `[K ν(ϖ)^{−1} K]` with `[𝒬 ν(ϖ)^{−1} 𝒬]`.

(CN, Lemma 2.2.19, p.32.)

*Needs:* §2.5; §1.12.

### Examples

For `n=1` the lower congruence group consists of matrices (`1` 0;c `1`) with `c∈π_L O_L`. The dual ordinary comparison inverts the lower-side operator and then conjugates by `ũ_n^{-1}w₀^P`. At zero selected weight the kernel comparison removes no tensor factor, yet this lower-side normalization remains necessary.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.1**; **ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality**; Layer 0; Layer 1; **PotentialAutomorphyInfrastructure, Layer 0**; **SmoothRepresentationsOfLocalGroups:SR.2**.

## Layer 3: Bruhat induction and deep unipotent cohomology

Compare algebraic relative Bruhat closure with the local p-adic topology. Construct unnormalized induction on open length unions, individual strata and open cells, with exact extension/restriction filtration. Prove the cohomological short exact sequences and ordinary open/identity-cell subquotients, retaining the inverse determinant unit character `χ` and rank shift. In the abelian Siegel case split `RΓ(U₀,O/ϖ^m)` after sufficiently deep Levi restriction, at arbitrary `p`. Use the pinned Artin–Rees results to lift finite-module subquotients after increasing the coefficient exponent.

### 3.1 Parabolic Bruhat decomposition and closure relations

Prove `CrystallineCM.relative_bruhat_local_closure`. Let `L` be a p-adic field and `G/O_L` split connected reductive with split maximal torus `T ⊂ B ⊂ P = M` ⋉ `U; W^P ⊂ W` the minimal length representatives of `W_P∖W` and `^PW^P := W^P ∩ (W^P)^{−1}`. Then G(L) `= ⊔_{w∈^PW^P}` P(L)wP(L); the closure of P(L)wP(L) (p-adic topology) is `⊔_{w′≤w}` P(L)w′P(L) for the Bruhat order; and `P(L)ΩP(L)` is open for every upper subset `Ω ⊂ ^PW^P`.

(CN, §2.3.1, Lemma 2.3.2, p.33.)

*Needs:* **PotentialAutomorphyInfrastructure, Layer 3** (relative bruhat cells); **SmoothRepresentationsOfLocalGroups:SR.2**; **ReductiveGroups, Layer 7**.

### 3.2 The modulus-type character χ of M(L)

Define `CrystallineCM.ChiCharacter`. `χ` : M(L) `→ O^×` is `χ(m) = Nm_{L/Q_p} det_L(Ad(m)|_{Lie U(L)})^{−1} / |Nm_{L/Q_p} det_L(Ad(m)|_{Lie U(L)})|_p`.

Write `δ(m)=Nm_{L/Q_p}det_L(Ad(m)|_{Lie U(L)})` and `v_p` for the integer valuation on a nonzero p-adic number. The formula is equivalently `χ(m)=δ(m)^{-1}p^{v_p(δ(m))}`, where the rational value of the absolute value is embedded into `Q_p` before division. This gives a unit of `Z_p` and then a unit of `O` through the coefficient map. Reuse Mathlib's `PadicInt.mkUnits` to package the valuation-zero value. If `δ(m)` is already a p-adic unit, the formula gives precisely its inverse. The norm-determinant character and its interpretation on top continuous cohomology are supplied by the specified Lie-action and orientation interfaces. Normalizing an arbitrary supplied character does not establish that interpretation.


The required interface is:

- `CrystallineCM.ChiCharacter_mul`: `χ(mm′)=χ(m)χ(m′)` and `χ(1)=1`.
- `CrystallineCM.ChiCharacter_unit_value`: The normalization has p-adic valuation zero and therefore lies in `Z_p×⊂O×`.
- `CrystallineCM.ChiCharacter_orientation`: Its restriction to compact Levi is the inverse determinant on top continuous unipotent cohomology; on the torus it agrees with the appropriate PotentialAutomorphyInfrastructure §3.31 orientation character.

**Checks.**

- `CrystallineCM.ChiCharacter_test_identity`: `χ(1)=1`.
- `CrystallineCM.ChiCharacter_test_rank_one_unit`: For `GL₂` over `L=Q_p` and `m=diag(a,d)` with `a/d∈Z_p×`, `χ(m)=d/a`. At `p=5`, `L=Q₅` and `m=diag(2,1)`, its residue is `2⁻¹=3` in `F₅`, whereas the direct adjoint character has residue `2`. For `[L:Q_p]=d_L` and `a/d∈Z_p×`, the norm instead gives `χ(m)=(d/a)^{d_L}`. Over the unramified quadratic extension of `Q₅`, `diag(2,1)` therefore has residue `(2²)⁻¹=4≠3`.
- `CrystallineCM.ChiCharacter_test_uniformizer`: For `L=Q_p` and `m=diag(p,1), χ(m)=1` because the determinant inverse and absolute-value denominator cancel.

(CN, §2.3.1, p.37.)

*Needs:* **PotentialAutomorphyInfrastructure, Layer 3** (bruhat orientation character); **PotentialAutomorphyInfrastructure, §0.12** (`unipotent_exterior_cohomology`).

### 3.3 Cohomology of an induced space is the parabolic induction

Prove `CrystallineCM.induced_space_cohomology`. For `G` split reductive over `O_L, K = G(O_L), K_P = K ∩` P(L), and `X` a compact Hausdorff space with a continuous P(L)-action on which `K_P` acts freely: `X ×^P G` (the quotient of `X ×` G(L) by (x,g)·p `=` (xp, `p^{−1}g`)) is K-equivariantly homeomorphic to `X ×^{K_P} K`, and there is a natural isomorphism `RΓ(X ×^P G, O/ϖ^m) ≅ Ind^{G(L)}_{P(L)} RΓ(X, O/ϖ^m)` in `D⁺_sm(G(L), O/ϖ^m)`.

(CN, §2.3.13, Lemma 2.3.14, pp.39–40.)

*Needs:* **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 6**; **SmoothRepresentationsOfLocalGroups:SR.2**; **ArithmeticLocallySymmetricSpaces:ALS.3** (discrete topological comparison).

### 3.4 Splitting of the U₀-cohomology complex at deep level

Prove `CrystallineCM.deep_unipotent_cohomology_split`. For the Siegel parabolic of split `GL_{2n}/O_L` (so `U₀≅O_L^{n²}` is abelian), let `K = M(O_L)` with congruence subgroups `K_m = {k ≡ 1` mod `ϖ^m_L}`, acting on `U₀` by conjugation. For every `m ≥ 1` there is `M =` M(m) `≥ m` such that `RΓ(U₀, O/ϖ^m) ≅ ⊕_{i=0}^{rk_{Z_p}U₀} H^i(U₀, O/ϖ^m)[−i]` in `D⁺_sm(K_M, O/ϖ^m)`; each `H^i(U₀, O/ϖ^m)` is non-zero, with trivial `K_M-action`. Cohomology is `Hom_cts(∧^i_{Z_p}U₀,O/ϖ^m)`, not `∧^i U₀`. No condition `p>n²` is imposed. The source argument is not exported to arbitrary nonabelian unipotent radicals.

(CN, §2.3.16, pp.41–42 (Lemma 2.3.17 on p.42).)

*Needs:* **PotentialAutomorphyInfrastructure, §0.12** (`unipotent_exterior_cohomology`); **ProfiniteCohomology, Layers 10–11**; **SmoothRepresentationsOfLocalGroups:SR.0**; **DerivedModuleAlgebra, §0.K.1**; **SmoothRepresentationsOfLocalGroups:SR.0d**.

### 3.5 Subquotients modulo p-powers (Artin–Rees)

Prove `CrystallineCM.subquotient_mod_p_pow`. Let `N` be a finitely generated `Z_p-module` and `M` a subquotient of `N`. For every `m ≥ 1` there is `m′ ≥ m` such that `M/p^mM` is a subquotient of `N/p^{m′}N`.

Additional hypotheses and conventions: Here finite `Z_p-module` means finitely generated; choose a submodule `N′ ⊆ N` and a surjective `Z_p-linear` map `f : N′ → M`. This is a quotient of modules, with its chosen maps retained.

**Canonical comparison and coefficient depth.** Put `J=(p) ⊆ Z_p`, write `q_X,e : X → X/J^eX` for the quotient map, and let `T_e` be the image of `N′ → N/J^eN`. Choose `m′ ≥ m` and a surjection `g : T_m′ → M/J^mM` satisfying `g` ∘ (`q_N,m′` ∘ inclusion, with codomain restricted to its image) `= q_M,m` ∘ `f`. Thus the witness is the actual image of the chosen submodule, with the natural square; it is not an unrelated submodule that happens to have an isomorphic quotient. Mathlib's `LinearMap.range`, `rangeRestrict` and `Submodule.mkQ` give the image and its natural map; `adicSubmoduleImage` and `adicSubmoduleImageMap` denote these specializations.

### 3.6 Supplementary comparison API

Prove `CrystallineCM.subquotient_mod_p_pow_uniform`. There is a shift `k₀` depending only on `N′ ⊆ N` such that, for every quotient `f` and every `m ≥ 1`, this same natural surjection exists at `m′=m+k₀`. The choice of `k₀` precedes `f` and `m`. Use Artin–Rees to ensure `N′ ∩ J^(m+k₀)N ⊆ J^mN′`, then descend `q_M,m` ∘ `f` through `T_(m+k₀)`. Its surjectivity follows from those of `f` and `q_M,m`. This is a specialization of the existing generic Artin–Rees supplier, not another plan for that theorem.

The square determines `g` uniquely because `N′ → T_m′` is surjective. Consequently it preserves any supplied endomorphism actions that preserve `N′` and commute with `f` and the quotient maps. This is the map data needed when applying the subquotient lemma to Hecke modules in the proof of CN Proposition 4.2.6, especially p.64. Neither the scalar-linear signature nor its naturality constructs the arithmetic Hecke actions; those remain prerequisites of CL.6.

The signatures `CrystallineCM.subquotient_mod_p_pow_unique` and `CrystallineCM.subquotient_mod_p_pow_equivariant` make these two requirements explicit. At a fixed ambient depth `e`, any two maps `T_e → M/J^mM` satisfying the square coincide. For equivariance, supply representations of the same monoid `H` on `N′`, `T_e` and `M/J^mM`, require the map `N′ → T_e` and `q_M,m` ∘ `f` to intertwine their actions, and prove `g` ∘ `ρ_T(h) = ρ_M/J^mM(h)` ∘ `g` for every `h ∈ H`. Precompose both sides with the surjection `N′ → T_e` and use the two intertwining identities and the comparison square. This applies to the multiplicative monoid of an acting Hecke algebra, retaining its chosen action on each module. The uniqueness and equivariance statements need neither finite generation, surjectivity of `f`, nor positive `e` or `m`: those assumptions enter the existence and coefficient-depth control above. They do require the actual image `T_e` and the commuting square.

**Checks.** The following examples exercise the natural comparison square:

- **Whole ambient submodule:** If `N′=N` and `f` is surjective, the natural comparison works with `m′=m`, without finite-generation or positive-depth assumptions. This detects an unnecessary depth increase in this special case.
- **Depth one fails for a proper submodule** (`CrystallineCM.subquotient_mod_p_pow_test_depth_one`): Take `N=Z_p, N′=pZ_p, M=N′` and `f=id`, with `m=1`. The image `T_1` in `Z_p/pZ_p` is zero, while `N′`/pN′ is nonzero. No map from `T_1` can satisfy the required square. An abstract subquotient statement alone would miss this failure, since `N′`/pN′ is abstractly isomorphic to `Z_p/pZ_p`.
- **Depth two repairs that example** (`CrystallineCM.subquotient_mod_p_pow_test_depth_two`): With the same `N`, `N′` and `f`, the natural image `T_2=pZ_p/p²Z_p` maps bijectively to `N′`/pN′, and the square commutes. This distinguishes the ambient adic filtration from the intrinsic one on `N′`.

(CN, Lemma 2.3.18 and its proof, p.43; consumer Proposition 4.2.6 and proof, pp.63–65. The three examples are authored tests, not examples attributed to CN.)

*Needs:* `mathlib:Ideal.exists_pow_inf_eq_pow_smul`; `tauceti:TauCeti.ArtinRees.exists_controlled_lift`; Mathlib's module quotients and linear-map ranges. Reuse the pinned Tau Ceti import `TauCeti.RingTheory.Ideal.ArtinRees` for the general coefficient-depth control.

### 3.7 The Bruhat filtration functors on parabolic induction

Define `CrystallineCM.InductionFiltrationFunctors`. For a smooth P(L)-module `π`, define `I_{≥i}(π)` as locally constant functions on `G_{≥i}=⋃_{ℓ(w)≥i}P(L)wP(L)`, compactly supported modulo P(L), satisfying `f(pg)=pf(g)`, with right P(L)-translation. This is unnormalized induction on the open Bruhat union. `I_{≥0}` is `Res_P Ind_P^{G̃}`. The individual stratum and open-cell functors are separate declarations.

The required interface is:

- `CrystallineCM.InductionFiltrationFunctors_zero`: `I_{≥0}(π)=Res_P Ind_P^{G̃}(π)` in unnormalized conventions.
- `CrystallineCM.InductionFiltrationFunctors_inclusion`: Extension by zero gives `I_{≥i+1}(π)→I_{≥i}(π)`.
- `CrystallineCM.InductionFiltrationFunctors_restriction`: Restriction to length-i strata gives `I_{≥i}(π)→⊕_{ℓ(w)=i}I_w(π)`.

**Checks.**

- `CrystallineCM.InductionFiltrationFunctors_test_zero_index`: `I_{≥0}` equals unnormalized parabolic induction restricted to `P`.
- `CrystallineCM.InductionFiltrationFunctors_test_above_length`: If `i` exceeds the maximum relative Bruhat length, `I_{≥i}=0`.
- `CrystallineCM.InductionFiltrationFunctors_test_rank_one`: For `GL₂` with Borel `P` the two Bruhat cells give a nonempty open-cell stage and an identity-cell quotient; reversing `≥` to `≤` would reverse these.

(CN, §2.3.1, p.34.)

*Needs:* §3.1; **SmoothRepresentationsOfLocalGroups:SR.2**; **SmoothRepresentationsOfLocalGroups:SR.0**.

### 3.8 P-ordinary part of an inflation from the Levi

Prove `CrystallineCM.ordinary_inflation_orientation_shift`. In the abelian Siegel `GL_{2n}` setting, for `π ∈ D⁺_sm(M(L), O/ϖ^m)` there is a natural isomorphism ord `RΓ(U₀, Inf^{M(L)⁺⋉U₀}_{M(L)⁺} π) ≅ O/ϖ^m(χ) ⊗ π[−rk_{Z_p}U₀]` in `D⁺_sm(M(L)⁺, O/ϖ^m)`. Corollary 2.3.10: for `π ∈ D⁺_sm(M(L), O/ϖ^m)`, ord `RΓ(U₀, I_id(Inf^{P(L)}_{M(L)} π)) ≅ O/ϖ^m(χ) ⊗ π[−rk_{Z_p}U₀]` in `D⁺_sm(M(L)⁺, O/ϖ^m)`, where `I_id` is the identity Bruhat stratum and `I°_id` its restriction to M(L)⁺ ⋉ `U₀` (Remark 2.3.9).

(CN, Lemma 2.3.8, pp.37–38; Remark 2.3.9 and Corollary 2.3.10, p.38.)

*Needs:* §3.2; §1.4; **PotentialAutomorphyInfrastructure, §0.12** (`unipotent_exterior_cohomology`); **ProfiniteCohomology, Layers 10–11**.

### 3.9 Clopen approximations of the Bruhat filtration

Prove `CrystallineCM.bruhat_clopen_approximation`. For each `i ≥ 0` there are decompositions `G_{≥i} = U^m₁` ⊔ `U^m₂` into open and closed subsets, indexed by `m ≥ 1`, left P(L)-invariant and right `P(O_L)-invariant`, with `G_{≥i+1} = ∪_{m≥1} U^m₁`.

(CN, Lemma 2.3.5, pp.35–36.)

*Needs:* §3.1; §3.7.

### 3.10 Bruhat stratum induction

Define `CrystallineCM.BruhatStratumInduction`. For `w∈^PW^P, I_w(π)` consists of locally constant functions `f:P(L)wP(L)→π` compactly supported modulo left P(L), with `f(pg)=pf(g)`; right P(L) acts by translation. It is one summand of the length-`ℓ`(w) quotient `I_{≥ℓ(w)}/I_{≥ℓ(w)+1}`, whose full quotient is the sum over all strata of that length; it retains the local topology.

The required interface is:

- `CrystallineCM.BruhatStratumInduction_equivariance`: Each `f` satisfies `f(pg)=pf(g)` on its stratum.
- `CrystallineCM.BruhatStratumInduction_translation`: Right translation gives the P(L)-action and is compatible with compact-mod-P support.
- `CrystallineCM.BruhatStratumInduction_restriction`: The length-i quotient of `I_{≥i}` restricts to the direct sum of the `I_w` with `ℓ(w)=i`.

**Checks.**

- `CrystallineCM.BruhatStratumInduction_test_identity`: For `w=1` the stratum is P(L), and equivariant functions are determined by their value at `1`.
- `CrystallineCM.BruhatStratumInduction_test_empty_support`: Empty support gives zero. For `GL₂(Q_p)`, Borel `P` and a nonzero trivial coefficient module `R_m`, identify the left-P quotient of the longest stratum with `Q_p`. The characteristic function of `Z_p` belongs to `I_w(R_m)`, whereas the constant function `1` on `Q_p` is excluded because its support is noncompact. These two functions distinguish compact-mod-P support from unrestricted locally constant functions.
- `CrystallineCM.BruhatStratumInduction_test_unnormalized`: For a nontrivial modulus, inserting `δ_P^{1/2}` into `f(pg)=pf(g)` changes the object and fails the integral coefficient definition.

(CN, §2.3.1, p.34.)

*Needs:* §3.7.

### 3.11 Bruhat open-cell induction

Define `CrystallineCM.BruhatOpenCellInduction`. `I°_w(π)` is the submodule of `I_w(π)` with support in `S°_w=P(L)wM(L)U₀`. It has the right-translation action of `M(L)⁺⋉U₀` and extends by zero to `I_w`. For `w=w₀^P` its derived `U₀-invariants` evaluate to `π^{w₀^P}`.

The required interface is:

- `CrystallineCM.BruhatOpenCellInduction_extend_zero`: Extension by zero gives an injective `M⁺⋉U₀-equivariant` map `I°_w→I_w`.
- `CrystallineCM.BruhatOpenCellInduction_support`: An `I_w` function lies in `I°_w` exactly when its support is contained in `S°_w`.
- `CrystallineCM.BruhatOpenCellInduction_evaluate`: At `w₀^P`, evaluation on `U₀-invariants` gives the coefficient module with the `w₀^P-conjugated` Levi action.

**Checks.**

- `CrystallineCM.BruhatOpenCellInduction_test_identity`: `S°_1=P(L)`, so `I°_1=I_1`.
- `CrystallineCM.BruhatOpenCellInduction_test_w0_eval`: At `w₀^P` the evaluated Levi action is conjugated by block exchange, rather than the original action.
- `CrystallineCM.BruhatOpenCellInduction_test_nonopen_support`: For nonzero trivial coefficients on the longest cell, a nonzero locally constant function with compact support in a compact-open neighborhood in left P(L)-quotient of `S_w` outside left P(L)-quotient of `S°_w` is not in `I°_w`. Single-point support is not assumed to be locally constant.

(CN, §2.3.1, p.34; Lemma 2.3.6, pp.36–37.)

*Needs:* §3.10.

### 3.12 Exactness of the Bruhat filtration of parabolic induction

Prove `CrystallineCM.bruhat_filtration_exact`. `(1) I_{≥0} = Res^{G(L)}_{P(L)}` ∘ `Ind^{G(L)}_{P(L)}`. `(2)` Each of `I_{≥i}, I_w, I°_w` is exact. `(3)` For `i ≥ 0` and `π ∈ Mod_sm(P(L), O/ϖ^m)` there is a functorial exact sequence `0 → I_{≥i+1}(π) → I_{≥i}(π) → ⊕_{ℓ(w)=i} I_w(π) → 0`, giving distinguished triangles (2.3.1) in `D⁺_sm(P(L), O/ϖ^m)`.

(CN, Proposition 2.3.3, p.34.)

*Needs:* §3.7; §3.1; **SmoothRepresentationsOfLocalGroups:SR.2**; §3.10; §3.11.

### 3.13 The open cell computes the P-ordinary part of the top Bruhat stratum

Prove `CrystallineCM.ordinary_open_cell_comparison`. For `G = GL_{2n}/L, P` the standard parabolic with Levi `GL_n × GL_n, ũ_L = diag(ϖ_L,…,ϖ_L,1,…,1)` and `w₀^P` the longest element of `^PW^P: (1) I°_{w₀^P}` takes injectives to `Γ(U₀,−)-acyclics; (2)` for `π ∈ D⁺_sm(P(L), O/ϖ^m)` there is a natural isomorphism ord `RΓ(U₀, I°_{w₀^P}(π)) ≅` ord `RΓ(U₀, I_{w₀^P}(π))`, ord inverting `ũ_L`.

(CN, Lemma 2.3.6, pp.36–37.)

*Needs:* §3.7; §1.4; §3.10; §3.11; **SmoothRepresentationsOfLocalGroups:SR.0**; **SmoothRepresentationsOfLocalGroups:SR.2**; **ProfiniteCohomology, Layers 10–11**.

### 3.14 The Bruhat filtration stays exact after taking K ⋉ U₀-cohomology

Prove `CrystallineCM.bruhat_cohomology_exact`. Let `π ∈ D⁺_sm(P(L), O/ϖ^m)` and `V` a finite free `O/ϖ^m-module` with a smooth representation of an open submonoid `Δ⁺ ⊂` M(L) containing an open subgroup `K ⊂ M(O_L)`. For `i ≥ 0` and `j ∈ Z`, `0 → R^jΓ(K` ⋉ `U₀, V ⊗ I_{≥i+1}(π)) → R^jΓ(K` ⋉ `U₀, V ⊗ I_{≥i}(π)) → ⊕_{ℓ(w)=i} R^jΓ(K` ⋉ `U₀, V ⊗ I_w(π)) → 0` is an exact sequence of `H(Δ⁺`, K)-modules.

(CN, Proposition 2.3.4, pp.34–35.)

*Needs:* §3.12; §3.9; **ProfiniteCohomology, Layers 10–11**.

### 3.15 The open-cell summand is the w₀^P-twist

Prove `CrystallineCM.open_cell_evaluation_twist`. For `π ∈ D⁺_sm(P(L), O/ϖ^m)` there is a natural isomorphism `RΓ(U₀, I°_{w₀^P}(π)) ≅ π^{w₀^P}` in `D⁺_sm(M(L)⁺, O/ϖ^m)`, where `m ∈` M(L)⁺ acts on `π^{w₀^P}` through `w₀^P m (w₀^P)^{−1}`.

(CN, Lemma 2.3.7, p.37.)

*Needs:* §3.7; §0.1; **SmoothRepresentationsOfLocalGroups:SR.2**; **ProfiniteCohomology, Layers 10–11**; §3.10; §3.11; §3.13.

### 3.16 P-ordinary cohomology of a parabolic induction

Prove `CrystallineCM.ordinary_induction_subquotients`. For `v̄ ∈ S̄` and `Q_{v̄} ⊂ P_{v̄}` with `K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄})`: let `π ∈ D⁺_sm(G(F⁺_{v̄}), O/ϖ^m)` and `V` a finite free `O/ϖ^m-module` with a smooth `Δ^{Q,+}_{v̄}-action, ũ_{ṽ,n}` acting trivially, inflated to `Δ̃^{Q}_{v̄,P} = Δ^{Q,+}_{v̄}` ⋉ `U⁰_{v̄}`. Then `ord₀ R^jΓ(K_{v̄}` ⋉ `U⁰_{v̄}, Ind^{G̃(F⁺_{v̄})}_{P(F⁺_{v̄})} π ⊗ V`) has `R^jΓ(K_{v̄}, π^{w₀^P} ⊗ V)` and `R^{j−rk_{Z_p}U⁰_{v̄}}Γ(K_{v̄}, π ⊗ O/ϖ^m(χ) ⊗ V)` as `H(Δ^{Q}_{v̄}, K_{v̄})-module` subquotients.

(CN, Proposition 2.3.11, p.38.)

*Needs:* §3.14; §3.13; §3.15; §3.8; §1.12.

### 3.17 Dual version: ordinary part for the opposite parabolic

Prove `CrystallineCM.dual_ordinary_induction_subquotient`. For `π ∈ D⁺_sm(G(F⁺_{v̄}), O/ϖ^m)` and `V` finite free with a smooth `(Δ^{Q,+}_{v̄})^{−1}-action, ũ^{−1}_{ṽ,n}` trivial, inflated to (`Δ̃^{Q}_{v̄,P})^{−1}: ord^∨₀ R^jΓ(K_{v̄}` ⋉ `Ū¹_{v̄}, Ind^{G̃}_{P} π ⊗ V`) has `R^jΓ(K_{v̄}, π ⊗ V)` as an `H((Δ^{Q}_{v̄})^{−1}, K_{v̄})-module` subquotient.

(CN, Corollary 2.3.12, p.39.)

*Needs:* §3.16; §2.6; §2.5.

### Examples

For `GL₂` with its Borel there are an identity cell and an open cell. The open-cell Levi action exchanges the two entries, while inflation from the identity cell contributes the shift by `[L:Q_p]` and `χ`. For `L=Q_p` and `diag(a,d)` with a/d a unit, `χ=d/a`; at `diag(p,1), χ=1`. The submodule `pZ_p⊂Z_p` has zero image modulo `p`, so its intrinsic reduction cannot be recovered at ambient depth one; the natural square becomes an isomorphism at depth two, as in §3.6.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.3**; **ArithmeticLocallySymmetricSpaces:ALS.6**; Layer 0; Layer 1; Layer 2; **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 6**; **DerivedModuleAlgebra, §0.K.1**; **PotentialAutomorphyInfrastructure, Layer 0**; **PotentialAutomorphyInfrastructure, Layer 3**; **SmoothRepresentationsOfLocalGroups:SR.0**; **SmoothRepresentationsOfLocalGroups:SR.0d**; **SmoothRepresentationsOfLocalGroups:SR.2**; **ProfiniteCohomology, Layers 10–11**; **ReductiveGroups, Layer 7**.

## Layer 4: Q-ordinary automorphic representations and Galois blocks

Define rescaled partial Q-Hecke operators for partitions refining (n,n), their polynomial/Laurent algebra and the all-unit generalized-eigenvalue subspace. Define `ι-Q-ordinary` cuspidal representations by cohomological weight and a nonzero unit eigenvector. Prove Newton–Hodge partial-sum inequalities and the equality-induced Galois subrepresentation. Deduce crystalline diagonal blocks, increasing labelled Hodge–Tate weights, a one-dimensional ordinary line and partial determinant reciprocity formulas.

### 4.1 Q-ordinary Hecke operators Ũ^k_v

Define `CrystallineCM.QOrdinaryHecke`. For a standard parabolic `Q_{v̄} ⊂ P_{F⁺_{v̄}}` corresponding under `ι_v` to `P_{n₁,…,n_t} ⊂ GL_{2n} (a` partition of `2n` refining (n,n)), `ν_k ∈ X_{Q_{v̄}}` with `ν_k(ϖ) = ι_v^{−1} diag(ϖ_v,…,ϖ_v,1,…,1) (n₁+…+n_k` entries `ϖ_v`) and `Ũ^k_v := [𝒬 ν_k(ϖ) 𝒬]`, so `H(Δ̃^{Q}_{v̄}, 𝒬_{v̄}) ≅ Z[Ũ¹_v,…,Ũ^{t−1}_v, (Ũ^t_v)^{±1}]`. For dominant `λ̃` and a smooth `Q̄_p-representation σ` of `G̃(F⁺_{v̄})`, the `λ̃-rescaled` action on `σ^{𝒬}` multiplies `[𝒬 g 𝒬]` by `α̃^{Q}(g)^{−1}`.

The required interface is:

- `CrystallineCM.QOrdinaryHecke_partial_operator`: For `1≤k≤t, Ũ^k` is the double coset of the first `n₁+⋯+n_k` diagonal uniformizers.
- `CrystallineCM.QOrdinaryHecke_polynomial_algebra`: The local Hecke algebra is `Z[Ũ¹,…,Ũ^{t−1},(Ũ^t)^{±1}]`, with no inverses of the first t−1 generators before localization.
- `CrystallineCM.QOrdinaryHecke_rescale`: On weight `λ̃` coefficients `[𝒬g𝒬]` is scaled by `α̃(g)^{-1}`, as in the integral action.

**Checks.**

- `CrystallineCM.QOrdinaryHecke_test_siegel`: For partition (n,n), `Ũ¹=Ũ_n` and `Ũ²=Ũ_{2n}`.
- `CrystallineCM.QOrdinaryHecke_test_borel`: For partition (1,…,1), the generators match all standard Borel partial diagonal Hecke operators.
- `CrystallineCM.QOrdinaryHecke_test_central_inverse_only`: The unlocalized polynomial algebra contains `(Ũ^t)^{-1}` but not `(Ũ¹)^{-1}`; making every generator invertible changes it.

(CN, §3.1, p.43.)

*Needs:* §0.7; §0.9; **SmoothRepresentationsOfLocalGroups:SR.4**; §0.6.

### 4.2 Newton above Hodge for semistable representations, and its equality case

Prove `CrystallineCM.newton_hodge_equality_subrepresentation`. Let `r : G_{F_v} → GL_m(Q̄_p)` be semistable, `v₁ ≤ … ≤ v_m` the valuations of the eigenvalues of geometric Frobenius on WD(r), and `h_{τ,1}` < … < `h_{τ,m}` the `τ-Hodge–Tate` weights. Then `Σ_{i≤j} v_i ≥ (1/e_v) Σ_{i≤j} Σ_τ h_{τ,i}` for `0 ≤ j ≤ m (e_v` the ramification degree of `F_v/Q_p`). If `Σ_{i≤j} v_{σ(i)} = (1/e_v) Σ_{i≤j} Σ_τ h_{τ,i}` for some `1 ≤ j ≤ m − 1` and a permutation `σ ∈ S_m`, then `r ≅ (r₁` ∗; `0 r₂`) with `r₁` of dimension `j, τ-Hodge–Tate` weights `h_{τ,1}` < … < `h_{τ,j}`, Frobenius slopes `v₁ ≤ … ≤ v_j`, and `v_j < v_{j+1}`.

(CN, Lemma 3.1.3, pp.44–45.)

*Needs:* **PadicHodgeTheory, §§3.2–3.6**; **PadicHodgeTheory, §§5.3–5.4**.

### 4.3 Q-ordinary local subspace

For commuting operators on a finite-dimensional p-adic E-vector space, decompose into simultaneous generalized eigenspaces after finite splitting-field extension and descend the sum of the pieces where every rescaled eigenvalue has valuation zero. Prove independence of the splitting field, functoriality and equality with the largest stable subspace whose operator eigenvalues are all units. Fitting over an Artinian and Noetherian module detects nonzero eigenvalues, not valuation-zero eigenvalues over `E`.

Define `CrystallineCM.QOrdinaryLocalSubspace`. For an admissible characteristic-zero parahoric invariant space with the `λ̃-rescaled` commuting `Ũ^k` operators, the Q-ordinary subspace is the simultaneous sum of generalized eigenspaces for which every `Ũ^k-eigenvalue` has p-adic valuation zero, after finite coefficient extension. This includes the central invertible `Ũ^t` operator; P-ordinary only inverts `Ũ_n`.

The required interface is:

- `CrystallineCM.QOrdinaryLocalSubspace_unit_eigenspaces`: A simultaneous generalized eigenvector lies in the subspace iff all rescaled eigenvalues have valuation zero.
- `CrystallineCM.QOrdinaryLocalSubspace_scalar_extension`: Formation commutes with finite coefficient extension preserving the p-adic valuation.
- `CrystallineCM.QOrdinaryLocalSubspace_p_comparison`: QOrd is contained in POrd at the same invariant space, and equality is not imposed in a refined partition.

**Checks.**

- `CrystallineCM.QOrdinaryLocalSubspace_test_all_units`: For commuting diagonal scalar operators with all eigenvalues `1`, the whole invariant space is QOrd.
- `CrystallineCM.QOrdinaryLocalSubspace_test_nonunit`: For two scalar operators `1` and `p` on an E-line, POrd for the first is nonzero but QOrd is zero.
- `CrystallineCM.QOrdinaryLocalSubspace_test_zero_space`: For zero parahoric invariants the QOrd subspace is zero.

(CN, §3.1, after Definition 3.1.1, p.43.)

*Needs:* §4.1; Mathlib `Module.End.genEigenspace` and `Module.End.maxGenEigenspace`, in `Mathlib.LinearAlgebra.Eigenspace.Basic`.

### 4.4 `ι`-`Q_{v̄}`-ordinary cuspidal representations

Define `CrystallineCM.IotaQOrdinary`. A cuspidal automorphic representation `π` of `G̃(𝔸_{F⁺})` is `ι-Q_{v̄}-ordinary` of weight `λ̃ (λ̃ ∈ (Z^{2n}₊)^{Hom(F⁺,Q̄_p)}` dominant, `ι : Q̄_p ≅ C`) if `π` is `ιV^∨_λ̃-cohomological` and the `λ̃-rescaled` operators `{Ũ^k_v : 1 ≤ k ≤ t}` have a simultaneous eigenvector with p-adic unit eigenvalues in `ι^{−1}π^{𝒬}`; the `Q_{v̄}-ordinary` subspace of `ι^{−1}π^{𝒬_{v̄}}_{v̄}` is the largest `H(Δ̃^Q, 𝒬)-submodule` on which the rescaled `Ũ^k_v` have only unit eigenvalues.

The required interface is:

- `CrystallineCM.IotaQOrdinary_witness`: Q-ordinarity holds iff `π` is the specified cohomological representation and its parahoric invariants contain a nonzero vector with simultaneous unit rescaled eigenvalues.
- `CrystallineCM.IotaQOrdinary_isomorphism`: An isomorphism of cuspidal automorphic representations preserving the local component and weight preserves Q-ordinarity.
- `CrystallineCM.IotaQOrdinary_p_specialization`: For `Q=P` the condition uses the Siegel `Ũ_n` and central `Ũ_{2n}` operators; for `Q=B` it uses all Borel partial products.

**Checks.**

- `CrystallineCM.IotaQOrdinary_test_no_fixed_vectors`: A local component with `π^{𝒬}=0` cannot be Q-ordinary regardless of its Galois slopes.
- `CrystallineCM.IotaQOrdinary_test_wrong_weight`: A unit eigenvector alone does not make `π` Q-ordinary of a weight for which it is not `V^∨-cohomological`.
- `CrystallineCM.IotaQOrdinary_test_refinement`: At `Q=B` all partial-product unit conditions are imposed, recovering the parent’s Borel definition after the stated normalization.

(CN, Definition 3.1.1, p.43.)

*Needs:* §4.1; **ArithmeticLocallySymmetricSpaces:ALS.5** (automorphic comparison); §4.3.

### 4.4a Characteristic-zero unitary transfer and Galois comparison

Prove `CrystallineCM.unitary_characteristic_zero_comparison`. Let `F` contain a fixed imaginary quadratic subfield `F₀` in which the rational prime `p` splits, and let `π` be a cuspidal representation of the quasi-split `U(n,n)(𝔸_{F⁺})` cohomological for the dominant coefficient weight `λ̃`. Construct the full discrete transfer of ACC+ Theorem 2.3.3, with its cohomological infinitesimal character and local identification with `π_{v̄}` at every `v̄|p`. This identification uses rational splitting in `F₀`. The transfer is a finite isobaric sum of discrete GL representations, each written as its cuspidal constituent with all the shifted copies specified by the residual classification.

Use AG2.2 `DiscreteAssembly`: write `2n=Σ_i a_i b_i`, with conjugate-self-dual cuspidal `Π̃_i` of rank `a_i`, and attach `r_i` to the cohomological twist `Π_i=Π̃_i|det|^{(a_i+b_i−1)/2}` using AG2.3. Form `r_ι(π)=⊕_i⊕_{j=0}^{b_i−1} r_i⊗ε_p^{−n−j}`, in the supplier's normalization. Prove continuity, rank `2n`, the good-place unitary Hecke polynomial and independence up to isomorphism of the attached constituent representatives. Its labelled Hodge multiset is `{λ̃_{τ,i}+2n−i:1≤i≤2n}`, with `HT(ε_p⁻¹)=+1` as here.

Apply AG2.6's de Rham and semisimplified coefficient-prime comparison to each cuspidal constituent, transporting algebraic twists, then assemble the comparisons through direct sums. At a parahoric selected p-place, prove semistability and identify the assembled semisimple Weil parameter with `rec^T(π_{v̄}∘ι_v)`. Assemble the special-block monodromy upper bounds, retaining each shifted copy and each Jordan-block multiplicity; use ACC+ Theorem 2.3.3(c), equivalently CN Theorem 2.1.19(3), for the full Frobenius-semisimple local identification under rational splitting in `F₀`. These comparisons supply the local input to §4.2 before the Q-ordinary block argument. A single cuspidal GL existence theorem does not construct this sum.

**Checks.**

- With one constituent and `b₁=1`, the assembly has rank `a₁=2n` and is `r₁⊗ε_p^{−n}`, with the cohomological twist undone; omitting this twist changes its Frobenius polynomial.
- A rank-one constituent repeated with `b₁=2` at `n=1` contributes `r₁ε_p⁻¹⊕r₁ε_p⁻²`, of rank two and with both labelled weights. Retaining only one copy gives the wrong rank and parameter.
- `F=Q(ζ₅)` has split places over `11` in `F/F⁺` but no imaginary quadratic subfield. Such local splitting alone does not satisfy this adapter's rational splitting hypothesis.

(CN, Theorem 2.1.19, pp.21–22, and proof of Theorem 3.1.2, pp.44–45; ACC+ Theorem 2.3.3 and proof, published pp.935–937; AG2.2 `DiscreteAssembly`, HLTT Proposition 1.2 and Corollary 1.3, p.31.)

*Needs:* **AutomorphicGaloisRepresentationsPartII:AG2.2** (`DiscreteAssembly`); **AutomorphicGaloisRepresentationsPartII:AG2.3** (arbitrary regular conjugate-self-dual existence); **AutomorphicGaloisRepresentationsPartII:AG2.6** (`allCMCoefficientPrimeComparison`, `nonselfdualCoefficientPrimeMonodromyBound`, `allCMCrystallineIwahoriAdmissibility`); **PadicHodgeTheory, §§5.3–5.4**; **SmoothRepresentationsOfLocalGroups:SR.2** (special blocks and normalized induction). The unitary transfer and its local identification with the full discrete sum are targets of this section, using ACC+ Theorem 2.3.3 and its proof.

### 4.5 Galois representations of Q-ordinary automorphic representations

Prove `CrystallineCM.q_ordinary_crystalline_blocks`. Assume the rational prime `p` splits in an imaginary quadratic subfield `F₀⊂F`. Let `π` be cuspidal on `G̃(𝔸_{F⁺}), ι : Q̄_p ≅ C, v̄` a p-adic place of `F⁺` with `π ι-Q_{v̄}-ordinary` of weight `λ̃`, and use the representation `r_ι(π)` of §4.4a. Then: `(1) r_ι(π)|_{G_{F_v}}` is conjugate to a block upper-triangular representation with diagonal blocks `r_j(π) : G_{F_v} → GL_{n_j}(Q̄_p) (j =` 1,…,t), each crystalline (3.1.1); `(2)` the `Q_{v̄}-ordinary` subspace of `ι^{−1}π^{𝒬}_{v̄}` is one-dimensional; `(3)` the `τ-Hodge–Tate` weights of the `r_j(π)` are obtained by decomposing `λ̃_{τ,2n} < λ̃_{τ,2n−1} + 1` < … < `λ̃_{τ,1} + 2n − 1` according to `(n₁,…,n_t); (4) ∏_{j=1}^k det r_j(π)(Art_{F_v}(u)) = ∏_{i=1}^{n₁+…+n_k} ∏_{τ:F_v↪Q̄_p} τ(u)^{−λ̃_{τ,2n−i+1}−i+1}` for `u ∈ O^×_{F_v}`, and `∏_{j=1}^k det r_j(π)(Art_{F_v}(ϖ_v))` equals `ε_p^{Σ_{i=1}^{n₁+…+n_k}(1−i)}(Art_{F_v}(ϖ_v))` times the eigenvalue of `Ũ^k_v` on the `Q_{v̄}-ordinary` subspace.

(CN, Theorem 3.1.2, pp.43–44.)

*Needs:* §4.4; §4.4a; §4.2; **AutomorphicGaloisRepresentationsPartII:AG2.2–AG2.3**; **AutomorphicGaloisRepresentationsPartII:AG2.6–AG2.7** (`allCMCoefficientPrimeComparison`, `nonselfdualCoefficientPrimeMonodromyBound`, `allCMCrystallineIwahoriAdmissibility`, `NonselfdualComparisonExport`); **SmoothRepresentationsOfLocalGroups:SR.2**; **SmoothRepresentationsOfLocalGroups:SR.4**.

### Examples

For the partition (n,n), the partial operators are the Siegel and central operators. Refining to the Borel introduces every partial product. On an E-line with two commuting operators `1` and `p`, localization at the first operator is nonzero but the all-unit Q-ordinary subspace is zero. At `n=2` and zero algebraic weight, the ordered Hodge–Tate list of the rank-four representation is (0,1,2,3); partitioning it into (2,2) yields block lists (0,1) and (2,3).

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.5**; **AutomorphicGaloisRepresentationsPartII:AG2.2–AG2.3**; **AutomorphicGaloisRepresentationsPartII:AG2.6–AG2.7** (`allCMCoefficientPrimeComparison`, `nonselfdualCoefficientPrimeMonodromyBound`, `allCMCrystallineIwahoriAdmissibility`, `NonselfdualComparisonExport`); Layer 0; **PadicFamilies, Layer 0a**; **PadicHodgeTheory, §§3.2–3.6**; **PadicHodgeTheory, §§5.3–5.4**; **SmoothRepresentationsOfLocalGroups:SR.2**; **SmoothRepresentationsOfLocalGroups:SR.4**.

## Layer 5: The localized completed Siegel boundary

Construct the equivariant unipotent coefficient object `V_U=RΓ(U₀,V/ϖ^m)` and its homotopy inverse limit; retain the vanishing bound and the exact nonzero range for trivial selected weights. Identify the localized completed Siegel boundary with induced Levi cohomology, using non-Eisenstein boundary-stratum elimination, topological induction and unipotent descent. Prove the Hecke-equivariant completed boundary summand and its integral coefficient-evaluation retract, with zero weights on the complementary p-places.

### 5.1 The coefficient object V_U(λ̃_S̄, m) on the Levi locally symmetric spaces

Define `CrystallineCM.BoundaryCoefficientObject`. For `S̄⊆S̄_p`, dominant `λ̃, R_m=O/ϖ^m`, put `V_{λ̃_S̄}=⊗_{v̄∈S̄,τ}V_{λ̃_τ}`. `V_U(λ̃_S̄,m)` is the equivariant locally constant derived coefficient object on the `GL_n` adelic tower corresponding to `RΓ(U₀_{S̄},V_{λ̃_S̄}/ϖ^m)`, descended to good `X_K` through the genuine Levi conjugation action. Its cohomology sheaves vanish outside [0,r], `r=n²Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p]`. If `λ̃_S̄=0`, every degree 0,…,r is nonzero and `H^j=Hom_cts(∧^j_{Z_p}U₀_{S̄},R_m)`. Define `V_U(λ̃_S̄)=holim_m V_U(λ̃_S̄,m)`. The exact nonzero range is required for zero selected weights; the general-weight assertion here is the cohomological-dimension bound.

The required interface is:

- `CrystallineCM.BoundaryCoefficientObject_fiber`: Its local derived coefficient fiber is `RΓ(U₀,V_{λ̃_S̄}/ϖ^m)`, with the genuine Levi conjugation action.
- `CrystallineCM.BoundaryCoefficientObject_descent`: Restriction to a good arithmetic level is compatible with the equivariant locally constant coefficient descent.
- `CrystallineCM.BoundaryCoefficientObject_amplitude`: Its cohomology sheaves vanish outside `[0,n²Σ_{v̄∈S̄}[F⁺_{v̄}:Q_p]]`; exact nonvanishing across this range is asserted here only for zero `λ̃` on `S̄`.

**Checks.**

- `CrystallineCM.BoundaryCoefficientObject_test_empty_places`: For `S̄=∅, V_U` is the original coefficient in degree zero with no unipotent shift.
- `CrystallineCM.BoundaryCoefficientObject_test_zero_weight_rank_one`: For `n=1,L=Q_p` and zero selected weights, with the nonzero trivial coefficient line `R_m, H⁰` and H¹ are `R_m`, all other groups vanish; the Levi action on H¹ is the inverse adjoint character. A zero coefficient module would instead have zero cohomology in every degree.
- `CrystallineCM.BoundaryCoefficientObject_test_exterior_dual`: For zero selected weights and trivial coefficient line `R_m`, the fibers agree with PotentialAutomorphyInfrastructure §0.12 as continuous Hom of exterior powers, not the exterior power of `U₀` itself.

(CN, §4.1.1, p.53.)

*Needs:* **ProfiniteCohomology, Layers 10–11**; **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 7**; **ArithmeticLocallySymmetricSpaces:ALS.1** (arithmetic local system); §3.4.

### 5.2 The Siegel boundary stratum and localization

Prove `CrystallineCM.localized_siegel_stratum`. `(1)` There is a `G̃(𝔸_{F⁺,f})-equivariant` closed immersion `(𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}) ↪ ∂𝔛_{G̃}` whose complement is a disjoint union of locally closed `(𝔛_Q × G̃(𝔸_{F⁺,f}))/Q(𝔸_{F⁺,f})` for standard parabolics `Q` ⊄ `P`. `(2)` Under the assumptions of A direct summand of completed boundary cohomology (CL.5), pullback gives a `T̃^T-equivariant` isomorphism `RΓ(K̃^{S̄₂}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃} ≅ RΓ(K̃^{S̄₂}, RΓ((𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}), V_λ̃/ϖ^m))_{m̃}`.

(CN, Proposition 4.1.4, pp.54–55.)

*Needs:* **PotentialAutomorphyInfrastructure, Layer 0**; **ArithmeticLocallySymmetricSpaces:ALS.2** (borel serre bordification); **ArithmeticLocallySymmetricSpaces:ALS.4** (boundary stratum cohomology formula); **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 7**.

### 5.3 Completed cohomology of the Siegel parabolic is inflated from the Levi

Prove `CrystallineCM.parabolic_cohomology_inflation`. Pullback along `𝔛_P ↠ 𝔛_G` gives a natural isomorphism `Inf^{P(𝔸_{F⁺,f})}_{G(𝔸_{F⁺,f})} RΓ(𝔛_G, O/ϖ^m) ≅ RΓ(𝔛_P, O/ϖ^m)` in `D⁺_sm(P(𝔸_{F⁺,f}), O/ϖ^m)`.

(CN, Lemma 4.1.6, pp.55–56.)

*Needs:* **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 6**; **ArithmeticLocallySymmetricSpaces:ALS.4** (levi hochschild serre); **ArithmeticLocallySymmetricSpaces:ALS.2** (stratum nilmanifold fibration).

### 5.4 The Siegel stratum as an induction at S̄₁

Prove `CrystallineCM.siegel_stratum_induction`. With `λ̃` as in A direct summand of completed boundary cohomology (CL.5), `RΓ((𝔛_P × G̃(𝔸_{F⁺,f}))/P(𝔸_{F⁺,f}), V_λ̃/ϖ^m) ≅ Ind^{G̃^{S̄₁}×G̃⁰_{S̄₁}}_{P^{S̄₁}×P⁰_{S̄₁}} RΓ(𝔛_P, V_λ̃/ϖ^m)` in `D⁺_sm(G̃^{S̄₁} × G̃⁰_{S̄₁}, O/ϖ^m)`, where `G̃^{S̄₁}` is the adelic group away from `S̄₁` and `G̃⁰_{S̄₁} = ∏_{v̄∈S̄₁} G̃(O_{F⁺_{v̄}})`.

(CN, Lemma 4.1.5, p.55.)

*Needs:* §5.2; §3.3; **SmoothRepresentationsOfLocalGroups:SR.2**.

### 5.5 Inflation comparison with the U-cohomology coefficient object

Prove `CrystallineCM.unipotent_coefficient_inflation`. With notation as in the proof of A direct summand of completed boundary cohomology (CL.5), `Inf^{P^{T∖S̄₂}}_{G^{T∖S̄₂}} RΓ(K_{T∖S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m))) ≅ RΓ(K_{P,T∖S̄₂}, RΓ(𝔛_P, V_λ̃/ϖ^m))` in `D⁺_sm(P^{T∖S̄₂}, O/ϖ^m)`.

(CN, Lemma 4.1.7, p.56.)

*Needs:* §5.1; §5.3; **SmoothRepresentationsOfLocalGroups:SR.0d**.

### 5.6 Completed P-cohomology through the Levi

Prove `CrystallineCM.completed_parabolic_levi_comparison`. `RΓ(K^{S̄₂}_P, RΓ(𝔛_P, V_λ̃/ϖ^m)) ≅ r^*_G` ∘ `Inf^{P_{S̄₂}}_{G_{S̄₂}} RΓ(K^{S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m))), T^T_P-equivariantly` in `D⁺_sm(P_{S̄₂}, O/ϖ^m)`.

(CN, Proposition 4.1.8, pp.56–57.)

*Needs:* §5.3; §5.5; **ArithmeticLocallySymmetricSpaces:ALS.4** (parabolic hecke maps).

### 5.7 A direct summand of completed boundary cohomology

Prove `CrystallineCM.completed_siegel_boundary_summand`. Let `K̃ ⊂ G̃(𝔸_{F⁺,f})` be good, decomposed with respect to `P`, with `K̃_{U,v̄} = U⁰_{v̄}` for `v̄ ∈ S̄_p; m ⊂ T^T` non-Eisenstein and `m̃ := 𝒮^*(m)`. For a partition `S̄_p = S̄₁` ⊔ `S̄₂` and dominant `λ̃` with `λ̃_{v̄} = 0` for `v̄ ∈ S̄₂: 𝒮^*` ∘ `Ind^{G̃_{S̄₂}}_{P_{S̄₂}} RΓ(K^{S̄₂}, RΓ(𝔛_G, V_U(λ̃_{S̄₁}, m)))_m` is a `T̃^T-equivariant` direct summand of `RΓ(K̃^{S̄₂}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃}` in `D⁺_sm(G̃_{S̄₂}, O/ϖ^m)`.

(CN, §4.1.2, Theorem 4.1.3, p.54.)

*Needs:* §5.2; §5.4; §5.6; **SmoothRepresentationsOfLocalGroups:SR.2**.

### 5.8 Levi cohomology with U-coefficients is a summand of completed boundary cohomology

Prove `CrystallineCM.integral_levi_boundary_retract`. Let `K̃` be good, decomposed with respect to `P, K̃_{U,v̄} = U⁰_{v̄}` for `v̄ ∈ S̄_p; m ⊂ T^T` non-Eisenstein, `m̃ = 𝒮^*(m); S̄_p = S̄₁` ⊔ `S̄₂` ⊔ `S̄₃; λ̃, λ` dominant with `λ̃_τ = (−λ_{τ̃c}, λ_τ̃)` for `τ` inducing `v̄ ∈ S̄₁` and `λ̃_τ = 0` for `v̄ ∈ S̄₂` ⊔ `S̄₃`. Then `𝒮^*` ∘ `Ind^{G̃_{S̄₃}}_{P_{S̄₃}} RΓ(K^{S̄₃}, RΓ(𝔛_G, V_{λ_{S̄₁}}/ϖ^m ⊗ V_U(λ̃_{S̄₂}, m)))_m` is a `T̃^T-equivariant` direct summand of `RΓ(K̃^{S̄₃}, RΓ(∂𝔛_{G̃}, V_λ̃/ϖ^m))_{m̃}` in `D⁺_sm(G̃_{S̄₃}, O/ϖ^m)`.

(CN, Corollary 4.1.9, p.57.)

*Needs:* §5.7; §2.1; **PotentialAutomorphyInfrastructure, Layer 0**.

### Examples

With zero selected weights and `U₀≅Z_p^r`, the coefficient cohomology in degree `j` has rank binomial(r,j) over `R_m` for `0≤j≤r`. In rank one, `H⁰=R_m` and `H¹=Hom_cts(Z_p,R_m)`, with inverse adjoint Levi action. When the selected set is empty, `r=0` and the coefficient object is `R_m` in degree zero; the derived boundary summand still retains its Hecke localization.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.1**; **ArithmeticLocallySymmetricSpaces:ALS.2**; **ArithmeticLocallySymmetricSpaces:ALS.4**; **ArithmeticLocallySymmetricSpaces:ALS.6**; Layer 2; Layer 3; **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 1**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 6**; **CompletedCohomologyPartII, Layer 7**; **PotentialAutomorphyInfrastructure, Layer 0**; **SmoothRepresentationsOfLocalGroups:SR.0d**; **SmoothRepresentationsOfLocalGroups:SR.2**; **ProfiniteCohomology, Layers 10–11**.

## Layer 6: Degree shifting and nilpotent Hecke comparisons

Construct ordinary twisted/dual Satake diagrams and the integral, torsion and unitary middle-degree Hecke images; define the two deep congruence level families. Under ambient decomposed genericity compare middle-degree unitary and Levi derived-coefficient images and their duals. If the complementary local degree sum is at least half `[F⁺:Q]`, prove `d−q≤n²` times that sum for `q≥floor(d/2)`. Produce the torsion degree-shifting squares modulo nilpotent ideals `J` with `J^N=0, N` depending only on `n,[F⁺:Q]`, while the depth and exponent `m′` may increase.

### 6.1 Q-ordinary Hecke algebras, the twisted Satake map and duality involutions

Define `CrystallineCM.OrdHeckeAlgebras42`. `T^{Q_S̄,S̄-ord} := T^T ⊗ (⊗_{v̄∈S̄} H(Δ^{Q_{v̄}}_{v̄}, K_{v̄})), T^{Q_S̄,S̄-ord}_{w₀^P} := T^T ⊗ (⊗ H((Δ^{Q}_{v̄})^{w₀^P}, K^{w₀^P}_{v̄}))` and `T̃^{Q_S̄,S̄-ord} := T̃^T ⊗ (⊗ H(Δ̃^{Q}_{v̄}, 𝒬_{v̄})[Ũ^{−1}_{ṽ,n}]); 𝒮^{w₀^P} : T̃^{Q_S̄,S̄-ord} → T^{Q_S̄,S̄-ord}_{w₀^P}, [𝒬 ν(ϖ) 𝒬] ↦ [K^{w₀^P} ν(ϖ)^{w₀^P} K^{w₀^P}]`, sending `Ũ_{ṽ,n} ↦ U_ṽ` and `Ũ_{ṽ,2n} ↦ U_ṽ U^{−1}_{ṽc}`; the duality involutions `ι[KgK] = [Kg^{−1}K], ι̃[K̃gK̃] = [K̃g^{−1}K̃]` [ACC+18, §2.2.19] with twisted algebras `T^{…,ι}_{w₀^P}, T̃^{…,ι̃}`, the untwisted `T^{Q_S̄,S̄-ord,ι}` and `𝒮^ι : [𝒬 ν(ϖ)^{−1} 𝒬] ↦ [K ν(ϖ)^{−1} K]`.

The required interface is:

- `CrystallineCM.OrdHeckeAlgebras42_local_factor`: The untwisted `GL_n` factor is `H(Δ^Q,K_Q)`; the unitary factor localizes `H(Δ̃^Q,𝒬)` only at `Ũ_n`.
- `CrystallineCM.OrdHeckeAlgebras42_twisted_satake`: `S^{w₀^P}` sends `Ũ_n` to `U_ṽ` and `Ũ_{2n}` to `U_ṽ U_{ṽc}^{−1}`.
- `CrystallineCM.OrdHeckeAlgebras42_dual_satake`: `S^ι` sends inverse local cosets to inverse Levi cosets, with no additional `w₀^P-conjugation` in its untwisted target.

**Checks.**

- `CrystallineCM.OrdHeckeAlgebras42_test_empty`: At `S̄=∅` they reduce to the tame Hecke algebras and the untwisted Siegel Satake map.
- `CrystallineCM.OrdHeckeAlgebras42_test_central_ratio`: `Ũ_{2n}` maps to `U_ṽ/U_{ṽc}`; replacing division by multiplication fails the determinant dictionary.
- `CrystallineCM.OrdHeckeAlgebras42_test_dual_inverse`: `S^ι(Ũ_n^{-1})` is the inverse appropriate Levi coset; its action agrees with the ALS adjoint involution.

(CN, §4.2.1, p.58.)

*Needs:* §0.7; §0.1; **PotentialAutomorphyInfrastructure, Layer 3** (ordinary satake homomorphism); **ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality** (hecke adjoint duality); **SmoothRepresentationsOfLocalGroups:SR.4**.

### 6.2 The dual Levi coefficient module is a summand of the dual U-cohomology

Prove `CrystallineCM.dual_levi_coefficient_summand`. Let `S̄ ⊂ S̄_p` and `λ̃, λ` dominant with `λ̃_τ = (λ_τ̃, −w_{0,n}λ_{τ̃c})` for `τ` inducing `v̄ ∈ S̄` (the `w₀^P-conjugate` of the standard identification). Then for every `m ≥ 1, RΓ(U⁰_{S̄}, V^∨_{λ̃_S̄}/ϖ^m)` has `V^∨_{λ_S̄}/ϖ^m` as a `K_{S̄}-equivariant` direct summand.

(CN, Lemma 4.2.3, p.60.)

*Needs:* §0.2; §2.5; **ProfiniteCohomology, Layers 10–11**; **PotentialAutomorphyInfrastructure, Layer 0**; **SmoothRepresentationsOfLocalGroups:SR.0d**.

### 6.3 Numerical degree bound

Prove `CrystallineCM.degree_shift_bound`. If `S̄ ⊂ S̄_p` satisfies `Σ_{v̄∉S̄}[F⁺_{v̄} : Q_p] ≥ ½[F⁺ : Q]` and `q ∈ [⌊d/2⌋, d − 1] (d = n²[F⁺ : Q]`), then `d − q ≤ Σ_{v̄∉S̄} n²[F⁺_{v̄} : Q_p]`.

(CN, Lemma 4.2.5, p.62.)

*Needs:* the standing dimension conventions and elementary integer arithmetic.

### 6.4 Deep Levi congruence level

Define `CrystallineCM.DeepLeviLevel`. For `e≥1` and `S̄⊂S̄_p, K(e,S̄)_v=K_v∩ker(GL_n(O_{F_v})→GL_n(O_{F_v}/ϖ_v^e))` for `v` above `S̄`, and `K_v` elsewhere. The same depth is imposed at both conjugate places. `K(e′,S̄)⊂K(e,S̄)` for `e′≥e`.

The subgroup construction only needs the given level `K` and its integral component
homomorphisms `K→GL_n(O_{F_v})`. These homomorphisms are defined on `K`: an arbitrary
element of the ambient adelic group need not be integral. Intersect the inverse
images of the reduction kernels inside `K`, then map this subgroup into the ambient
group by K's inclusion. Selection is by the map `v↦v̄` followed by membership in `S̄`,
so it imposes the same depth at both conjugate places. The quotient map and its
matrix-group homomorphism are Mathlib's `Ideal.Quotient.mk` and
`Matrix.GeneralLinearGroup.map`; the construction uses their actual kernels.

For the rank-one test, the two conjugate components over `Z_p` belong exactly when
each has the form `1+p^e` a. The local-uniformizer test can be stated in an integral
local domain of characteristic zero with a nonzero element `π` in the maximal ideal
and `π²=p`: the unit `1+π` is congruent to `1` modulo `π` and fails congruence modulo `p`.
Cancellation would otherwise put `1` in the ideal generated by `π`. This gives a
specific ramified instance of the normalization test without changing the local
integer ring or replacing `π` by the coefficient uniformizer.

The required interface is:

- `CrystallineCM.DeepLeviLevel_mem`: `g∈K(e,S̄)` iff `g∈K` and every selected p-component is identity modulo its local `ϖ_v^e`.
- `CrystallineCM.DeepLeviLevel_antitone`: `e′≥e` implies `K(e′,S̄)⊂K(e,S̄)`.
- `CrystallineCM.DeepLeviLevel_empty`: `K(e,∅)=K`.

**Checks.**

- `CrystallineCM.DeepLeviLevel_test_empty`: `S̄=∅` leaves `K` unchanged.
- `CrystallineCM.DeepLeviLevel_test_scalar`: For `GL₁` over `Z_p` with `K=Z_p×, K(e,{v̄})=1+p^e Z_p` at each conjugate place.
- `CrystallineCM.DeepLeviLevel_test_local_uniformizer`: At ramified `F_v/Q_p`, congruence modulo `ϖ_v^e` differs from congruence modulo `p^e`; the local uniformizer is required.

(CN, §4.2.1, p.61.)

*Needs:* §0.3; **ArithmeticLocallySymmetricSpaces:ALS.0** (standard level subgroups).

### 6.5 Deep unitary congruence level

Define `CrystallineCM.DeepUnitaryLevel`. `K̃(e,S̄)_{v̄}=K̃_{v̄}∩P_{v̄}(e,e)` for `v̄∈S̄` and `K̃_{v̄}` elsewhere; equivalently the reduction modulo `ϖ_ṽ^e` is block unipotent (`1_n` *;0 `1_n`), so `U₀` remains present. This is deeper than diagonal-level control while retaining the unipotent fiber.

Use the split-place integral component maps on `K̃` to pull back the CL.0 subgroup
P(e,e), intersect inside `K̃`, and include the resulting subgroup in the ambient
unitary adelic group. Membership imposes identity on the two diagonal blocks and
zero on the lower-left block modulo the local uniformizer power; the upper-right
block is unrestricted. Any element of `K̃` whose selected components are exactly
upper block unipotent belongs at every depth. This supplies the inclusion of `U₀`
once the original level contains `U₀`. In rank two, the upper unipotent matrix with
upper-right entry `1` lies in this subgroup even when reduction is exact, while
principal congruence would exclude it. Over `F₃` at depth one with zero reduction
ideal, this distinction is already visible.

The required interface is:

- `CrystallineCM.DeepUnitaryLevel_mem`: A selected component lies in `K̃(e,S̄)` iff it lies in the original `K̃` and its diagonal blocks reduce to identity and its lower-left block to zero modulo `ϖ_ṽ^e`.
- `CrystallineCM.DeepUnitaryLevel_unipotent`: `U(O_{F⁺_{v̄}})⊂K̃(e,S̄)` whenever it was contained in `K̃`.
- `CrystallineCM.DeepUnitaryLevel_empty`: `K̃(e,∅)=K̃`.

**Checks.**

- `CrystallineCM.DeepUnitaryLevel_test_empty`: `S̄=∅` leaves `K̃` unchanged.
- `CrystallineCM.DeepUnitaryLevel_test_upper_unipotent`: For `n=1, (1` 1;0 `1`) belongs at every depth when in `K̃`.
- `CrystallineCM.DeepUnitaryLevel_test_not_principal`: The same upper-unipotent matrix need not be identity modulo `ϖ^e`, so replacing this level by a principal congruence subgroup destroys `U₀`.

(CN, §4.2.1, p.61.)

*Needs:* §0.3.

### 6.6 Degree shifting to middle-degree P-ordinary cohomology of G̃

Prove `CrystallineCM.middle_degree_hecke_comparison`. Let `K̃` be good, decomposed with respect to `P, K̃_{U,v̄} = U⁰_{v̄}` for `v̄ ∈ S̄_p; m ⊂ T^T` non-Eisenstein, `m̃ = 𝒮^*(m)` with `ρ̄_{m̃}` decomposed generic; `S̄_p = S̄₁` ⊔ `S̄₂` ⊔ `S̄₃` with standard parabolics `Q_{v̄} ⊂ P_{v̄}` for `v̄ ∈ S̄₃; λ̃, λ` dominant with `(1) λ̃_τ = (−w_{0,n}λ_{τ̃c}, λ_τ̃)` for `τ` inducing `v̄ ∈ S̄₁, (2) λ̃_τ = 0` for `v̄ ∈ S̄₂, (3) K̃_{v̄} = 𝒬_{v̄}` and `λ̃_τ = (−w_{0,n}λ_{τ̃c}, λ_τ̃)` for `v̄ ∈ S̄₃`. Then `𝒮^{w₀^P}` descends to a homomorphism `T̃^{Q_{S̄₃},S̄₃-ord}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) → T^{Q_{S̄₃},S̄₃-ord}_{w₀^P}(H^d(X_{K^{S̄₃}K^{w₀^P}_{S̄₃}}, V_{λ_{S̄₁}} ⊗ V_U(λ̃_{S̄₂}) ⊗ V_{λ_{S̄₃}})_m) (H^d` degree-d hypercohomology), and `T̃^{…}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) ↪ T̃^{…}(H^d(X̃_{K̃}, V_λ̃[1/p])^{ord}_{m̃})`.

(CN, Proposition 4.2.2, pp.58–60.)

*Needs:* §5.8; §3.16; §2.3; §1.12; §6.1; **IgusaVarietiesAndTorsionConcentration:IG.7** (middle degree without length hypothesis).

### 6.7 Hecke images A(K,λ,q), A(K,λ,q,m), Ã(K̃,λ̃,S̄) and deep levels

Define `CrystallineCM.HeckeImagesA`. `A(K,λ,q)=T^{Q^{w₀^P},S̄-ord}_{w₀^P}(H^q(X_K,V_λ)_m)`, the image subalgebra of the displayed actual cohomological Hecke action. All source notations `m, Q` and the chosen ordinary localization are fixed; it is not the whole abstract Hecke algebra.

For the actual action `a:H→End_O(M)`, the defining image has a surjective map `H→im(a)` and an injective tautological map `im(a)→End_O(M)`. A homomorphism `f:H→B` factors uniquely through im(a) exactly when `a(h)=0` implies `f(h)=0` for every `h∈H`. Extending scalars sends a(h) to `1⊗a(h)` on `E⊗_O M`; reuse `Module.End.baseChangeHom` for this algebra map. The induced map between the two images is injective when the canonical map `M→E⊗_O M` is injective. The application must identify rational cohomology with this scalar extension and supply the stated middle-degree injection. No such injectivity follows from the definition of an image algebra alone.


The required interface is:

- `CrystallineCM.HeckeImagesA_mem`: An endomorphism belongs to `A(K,λ,q)` iff it is the action of some element of the specified abstract ordinary Hecke algebra.
- `CrystallineCM.HeckeImagesA_factor`: A map out of the abstract algebra factors through A iff it kills the annihilator of the displayed localized cohomology.
- `CrystallineCM.HeckeImagesA_integral_to_rational`: The map to its rational cohomology image is induced by tensoring the actual coefficient complex; injectivity requires the specified middle-degree input and is not unconditional for `GL_n`.

**Checks.**

- `CrystallineCM.HeckeImagesA_test_zero_cohomology`: For `H^q_m=0,` A is the zero endomorphism algebra; it is not the nonzero abstract Hecke algebra.
- `CrystallineCM.HeckeImagesA_test_scalar_image`: If a polynomial Hecke algebra acts by evaluating `T` at `a∈O` on an O-line, its image is `O` and kernel is (T−a).
- `CrystallineCM.HeckeImagesA_test_range`: For `H=F₃[T]` acting on `F₃²` by `T=diag(0,1)`, polynomial evaluation at this projection has image `A≅F₃×F₃` and kernel `(T(T−1))`. Thus a nonzero Hecke image need not be a scalar field.

(CN, §4.2.1, p.61.)

*Needs:* §6.1; `mathlib:AlgHom.range`; §1.1.

### 6.8 Degree shifting with dual coefficients

Prove `CrystallineCM.dual_middle_degree_hecke_comparison`. Assumptions as in Degree shifting to middle-degree P-ordinary cohomology of `G̃` (CL.6) except: `ρ̄_{𝒮^*(m^∨)}` decomposed generic, and `λ̃_τ = (λ_τ̃, −w_{0,n}λ_{τ̃c})` for `τ` inducing places of `S̄₁` and `S̄₃ (λ̃_τ = 0` on `S̄₂, K̃_{v̄} = 𝒬_{v̄}` on `S̄₃`). Then `𝒮^ι` descends to `T̃^{Q_{S̄₃},S̄₃-ord,ι̃}(H^d(X̃_{K̃}, V^∨_λ̃)^{ord∨}_{𝒮^*(m^∨)}) → T^{Q_{S̄₃},S̄₃-ord,ι}(H^d(X_K, V^∨_{λ_{S̄₁}} ⊗ V_U(λ̃_{S̄₂}) ⊗ V^∨_{λ_{S̄₃}})_{m^∨}); T̃^{…}(H^d(X̃,V^∨)^{ord∨}) ↪ T̃^{…}(H^d(X̃,V^∨[1/p])^{ord∨})`, and by Poincaré duality the rational unitary algebra on the right of this injection is isomorphic to `T̃^{Q_{S̄₃},S̄₃-ord}(H^d(X̃_{K̃}, V_λ̃[1/p])^{ord}_{ι̃^*𝒮^*(m^∨)})`. Here `ρ̄_{ι̃^*𝒮^*(m^∨)} = ρ̄_m(−n) ⊕ ρ̄_m^{∨,c}(1−n)`.

(CN, Proposition 4.2.4, p.61.)

*Needs:* §6.6; §6.2; §3.17; **ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality** (verdier poincare duality).

### 6.9 Dual Hecke images A^∨ and Ã^∨

Define `CrystallineCM.HeckeImagesDual`. For `S̄_p = S̄₁ ∪ S̄₂ ∪ S̄₃: A^∨(K,λ,q) := T^{Q_{S̄₃},S̄₃-ord,ι}(H^q(X_K, V^∨_λ)_{m^∨}), A^∨(K,λ,q,m)` the same with `V^∨_λ/ϖ^m, Ã^∨(K̃,λ̃,S̄₃) := T̃^{Q_{S̄₃},S̄₃-ord,ι̃}(H^d(X̃_{K̃}, V^∨_λ̃)^{ord∨}_{𝒮^*m^∨})`.

Construct each image from its actual dual-coefficient cohomology module and action, retaining the coefficient ring and localization. Coefficient duality takes place before cohomology. Over `O`, the module `H^q(V^∨)` cannot in general be replaced by `Hom_O(H^q(V),O)`; duality can change the degree, supports and torsion terms. For example, `Hom_ℤ(ℤ/3,ℤ)=0` although `ℤ/3` is nonzero. The source's rational middle-degree Poincaré comparison supplies the particular perfect pairing used to compare the two image algebras.

The algebraic descent of adjointness is explicit. Let a commutative R-algebra `H` act on `M` and `N` by a and `b`, let `ι` be an involutive R-algebra automorphism of `H`, and let `N≃Hom_R(M,R)` be a perfect pairing that separates points of `M`. If `⟨a(h)x,y⟩=⟨x,b(ι(h))y⟩`, then `a(h)=0` exactly when `b(ι(h))=0`. This gives an isomorphism `im(a)≃im(b)` carrying a(h) to `b(ι(h))`. Apply it to the arithmetic pairing with its specified degree and support comparison; do not assert an integral pairing merely from the existence of a rational one. Mathlib's `Representation.dual` supplies the coefficient formula `ρ^∨(g)φ=φ∘ρ(g⁻¹)`, and `Module.Dual.eval` supplies the comparison with the double dual without an unconditional reflexivity assertion.

The required interface is:

- `CrystallineCM.HeckeImagesDual_coefficient`: `A^∨` uses the inverse-coset action on `H^q(X_K,V_λ^∨)_{m^∨}`, with the integral and `mod-ϖ^m` variants distinguished.
- `CrystallineCM.HeckeImagesDual_adjoint`: Poincaré pairing identifies dual Hecke operators with the involution `g↦g^{-1}`.
- `CrystallineCM.HeckeImagesDual_unitary`: `Ã^∨` is the image on unitary middle-degree dual POrd, localized at `S^*(m^∨)`.

**Checks.**

- `CrystallineCM.HeckeImagesDual_test_zero_cohomology`: All dual Hecke images vanish on the zero module.
- `CrystallineCM.HeckeImagesDual_test_scalar_inverse`: For a single invertible group element acting by a on a coefficient line, the contragredient element acts by `a⁻¹`. General double cosets retain restriction/corestriction multiplicities; inverse-coset eigenvalues need not be reciprocals.
- `CrystallineCM.HeckeImagesDual_test_double_coset_degree`: On the trivial Q₅-line for `GL₂(Q₃)` with `K=GL₂(Z₃)`, both `[K diag(3,1) K]` and its inverse act by `4`, since both indices are `3+1`. These are units but `4≠4⁻¹`.
- `CrystallineCM.HeckeImagesDual_test_involution`: Applying the coefficient dual and Hecke inversion twice recovers the original action and maximal ideal.

(CN, §4.2.1, p.65.)

*Needs:* §6.7; §2.5; §6.1.

### 6.10 Torsion Hecke image

Define `CrystallineCM.TorsionHeckeImage`. `A(K,λ,q,m)=image` of `T^{Q^{w₀^P},S̄-ord}_{w₀^P}` in `End_O(H^q(X_K,V_λ/ϖ^m)_m)`. Integral and torsion Hecke operators agree on the image of integral cohomology in torsion cohomology. A map `A(K,λ,q)/ϖ^m→A(K,λ,q,m)` requires an additional annihilator containment; neither that map nor equality is automatic.

The required interface is:

- `CrystallineCM.TorsionHeckeImage_mem`: `b` belongs iff `b` is the specified ordinary Hecke action on `H^q(X_K,V_λ/ϖ^m)_m`.
- `CrystallineCM.TorsionHeckeImage_faithful`: Its tautological action on this module is injective as a map of algebras.
- `CrystallineCM.TorsionHeckeImage_image_reduction`: An integral Hecke operator and its induced torsion operator agree on the image of `H^q(V_λ)→H^q(V_λ/ϖ^m)`.

**Checks.**

- `CrystallineCM.TorsionHeckeImage_test_zero`: Zero torsion cohomology gives the zero image algebra.
- `CrystallineCM.TorsionHeckeImage_test_scalar_mod`: For a scalar O-action on `R_m`, its torsion image is `R_m`.
- `CrystallineCM.TorsionHeckeImage_test_new_torsion`: Torsion `H^{q+1}(V)` may contribute to `H^q(V/ϖ^m)`; the definition cannot identify the latter image with `A(K,λ,q)/ϖ^m` without extra hypotheses.

A concrete instance is the two-term complex `O --ϖ--> O` in degrees zero and one for a nonzero uniformizer in a DVR. Its integral `H⁰` is zero and its H¹ is `O/ϖ`. After derived reduction modulo `ϖ` the differential is zero, so `H⁰` becomes `O/ϖ`. Thus its scalar Hecke image in degree zero changes from zero to `O/ϖ`. There can be no unital map from that zero integral image to the nonzero torsion image. Equivariance of the coefficient map still compares operators on the image of integral `H⁰`, which is zero here; it does not identify the whole torsion cohomology with a reduction of integral `H⁰`. Specializing to `O=ℤ₃` and `ϖ=3`, `PadicInt.toZMod` is the residue homomorphism. The degree-zero kernels and their scalar endomorphism images give a subsingleton integral image and a nontrivial residue image, so every unital `ℤ₃-algebra` map from the former to the latter is excluded. This tests the image-algebra obstruction as well as the change in cohomology.


(CN, §4.2.1, p.61, for the integral and torsion image definitions. The two-term complex is an authored test of their distinction.)

*Needs:* §6.7; `mathlib:AlgHom.range`.

### 6.11 Unitary middle-degree Hecke image

Define `CrystallineCM.UnitaryMiddleHeckeImage`. `Ã(K̃,λ̃,S̄)=image` of `T̃^{Q^{w₀^P},S̄-ord}` in `End_O(H^d(X̃_{K̃},V_λ̃)^{P-ord}_{m̃})`. Under the generic middle-degree injection this is a finite torsion-free O-algebra inside its rational image. Q-unit eigensystems are selected by the maximal ideal, not by redefining POrd.

Use the actual middle-degree action `a:H→End_O(M)` and its image, as for A. Tensoring `M` with `E` gives the image homomorphism into the rational action. Its injectivity follows from the supplied middle-degree injection `M→E⊗_O M`; it is not a property of every integral Hecke image. In particular, if `r∈O` has nonzero image in `E` and `r` annihilates an image endomorphism, that endomorphism is zero. Finiteness comes from the arithmetic middle-degree module, separately from this range argument.

Evaluate a character `χ` on the image of every rescaled partial block operator through `H→im(a)→E`. Equal Siegel values alone do not determine this character: in the faithful regular action of `ℚ×ℚ` on itself, the two projection characters both send (1,1) to `1` but send (1,2) to `1` and `2`. All those displayed eigenvalues are units. The cuspidal realization of the character uses the CTG and all-partial-unit hypotheses of Proposition 4.2.11, p.67, as specified in CL.7.

The required interface is:

- `CrystallineCM.UnitaryMiddleHeckeImage_mem`: `b∈Ã` iff it is an ordinary abstract Hecke action on the indicated integral unitary `H^d`.
- `CrystallineCM.UnitaryMiddleHeckeImage_rational_injective`: Under the decomposed-generic middle-degree injection, the natural map `Ã→Ã[1/p]` is injective.
- `CrystallineCM.UnitaryMiddleHeckeImage_character`: A characteristic-zero algebra character is evaluated on all rescaled partial operators, not only `Ũ_n`.

**Checks.**

- `CrystallineCM.UnitaryMiddleHeckeImage_test_zero`: Vanishing ordinary `H^d` gives the zero image.
- `CrystallineCM.UnitaryMiddleHeckeImage_test_torsion_free`: Under ambient genericity, a nonzero `ϖ-torsion` Hecke endomorphism is impossible because its action embeds in rational `H^d`.
- `CrystallineCM.UnitaryMiddleHeckeImage_test_characters`: Its characteristic-zero characters match the cuspidal Q-ordinary eigensystems in Proposition 4.2.11 when CTG and all-unit hypotheses hold.

(CN, §4.2.1, p.61.)

*Needs:* §6.7; §6.6; `mathlib:AlgHom.range`.

### 6.12 Degree shifting for torsion coefficients at deep auxiliary level

Prove `CrystallineCM.torsion_degree_shifting`. Let `v̄ ≠ v̄′ ∈ S̄_p, S̄₁ = {v̄′}, S̄₃ = {v̄}, S̄₂` the rest; `λ ∈ (Zⁿ₊)^{Hom(F,E)}, m ≥ 1, K̃` good. Assume `(1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2)` for each p-adic `v̄″ ≠ v̄` (including `v̄′), U(O_{F⁺_{v̄″}}) ⊂ K̃_{v̄″} = K̃(m, S̄₁ ∪ S̄₂)_{v̄″}`, and `K̃_{v̄} = 𝒬^{w₀^P}_{v̄}` for the standard parabolic with Levi `Q^{w₀^P}_{v̄} ∩ G(F⁺_{v̄}); (3) −λ_{τc,1} − λ_{τ,1} ≥ 0` for `τ` inducing `v̄` or `v̄′; (4) m ⊂ T` non-Eisenstein with `ρ̄_{m̃}` decomposed generic. Put `λ̃_τ = 0` for `τ` not inducing `v̄, v̄′` and `λ̃_τ = (−λ_{τ̃c}, λ_τ̃)` otherwise, and `K = (K̃^{v̄} ∩ G(𝔸^{v̄}_{F⁺,f}))` · `(𝒬_{v̄} ∩ G(F⁺_{v̄}))`. For `q ∈ [⌊d/2⌋, d − 1]` there are `m′ ≥ m` (allowed to depend on the input) and `N ≥ 1` depending only on `n` and `[F⁺ : Q]`, an ideal `J ⊂ A(K,λ,q,m)` with `J^N = 0` and a commutative square `T̃^{Q^{w₀^P}_{v̄},{v̄}-ord} → Ã(K̃(m′, S̄₂), λ̃, v̄)` over `𝒮^{w₀^P} : T̃^{…} → T^{…}_{w₀^P} → A(K,λ,q,m)/J`.

(CN, Proposition 4.2.6, pp.62–65.)

*Needs:* §6.6; §6.8; §6.3; §3.4; §3.5; §6.7; **IntegralHeckeAndGaloisDeterminants:IHG.2** (ghost nilpotence); **ArithmeticLocallySymmetricSpaces:ALS.6** (finite cover hochschild serre); **ArithmeticLocallySymmetricSpaces:ALS.4** (gln boundary eisenstein); §6.10; §6.11; §6.4; §6.5.

### 6.13 Dual degree shifting for torsion coefficients

Prove `CrystallineCM.dual_torsion_degree_shifting`. As Degree shifting for torsion coefficients at deep auxiliary level (CL.6) with: `K̃_{v̄} = 𝒬_{v̄}` for the standard parabolic `Q_{v̄} ⊂ P_{F⁺_{v̄}}`; condition `(3)` replaced by `λ_{τc,n} + λ_{τ,n} ≥ 0` for `τ` inducing `v̄` or `v̄′; ρ̄_{𝒮^*(m^∨)}` decomposed generic; `λ̃_τ = (λ_τ̃, −λ_{τ̃c})` for `τ` inducing `v̄, v̄′; K = K̃ ∩ G(𝔸_{F⁺,f})`. Then for `q ∈ [⌊d/2⌋, d − 1]` there are `m′ ≥ m, N` (depending only on `n`, `[F⁺ : Q]`), `J ⊂ A^∨(K,λ,q,m)` with `J^N = 0` and a commutative square `T̃^{Q_{v̄},{v̄}-ord,ι̃} → Ã^∨(K̃(m′,S̄₂), λ̃, v̄)` over `𝒮^ι : T̃ → T^{Q_{v̄},{v̄}-ord,ι} → A^∨(K,λ,q,m)/J`.

(CN, Proposition 4.2.8, pp.65–66.)

*Needs:* §6.12; §6.9; §6.8.

### Examples

Take `n=3,D=3,R=2` and `q=⌊27/2⌋=13`. Then `d−q=14≤18=n²R`: using floor(d/2) as the remaining degree would incorrectly give `13`. For the deep unitary level at `n=1, (1` 1;0 `1`) remains present at every depth, distinguishing it from principal congruence. The two-term complex `O —ϖ→ O` in degrees zero and one has zero integral `H⁰` but nonzero reduced `H⁰`; its image-algebra obstruction is worked out in §6.10.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.0**; **ArithmeticLocallySymmetricSpaces:ALS.4**; **ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality**; **ArithmeticLocallySymmetricSpaces:ALS.6**; Layer 0; Layer 1; Layer 2; Layer 3; Layer 5; **IgusaVarietiesAndTorsionConcentration:IG.7**; **IntegralHeckeAndGaloisDeterminants:IHG.2**; **PotentialAutomorphyInfrastructure, Layer 0**; **PotentialAutomorphyInfrastructure, Layer 3**; **SmoothRepresentationsOfLocalGroups:SR.0d**; **SmoothRepresentationsOfLocalGroups:SR.4**; **ProfiniteCohomology, Layers 10–11**.

## Layer 7: Crystalline local–global compatibility

For all-unit Q-localized non-Eisenstein torsion Hecke systems, produce local finite-flat characteristic-zero lifts with crystalline blocks, labelled weights and determinant characters. Use CTG perturbation and a separating character twist, then import compatible local reconstruction. Assemble a global Hecke-valued representation modulo a uniformly nilpotent ideal factoring through crystalline/semistable-ordinary local deformation rings in the three specified partitions. Export fixed-determinant compatibility for `p∤n`. Reuse AG2.6 spherical crystallinity over CM fields, and prove the totally real specialization under residual irreducibility and decomposed genericity. Reuse IHG.1, §1.6, whose compatible local reconstruction allows a henselian local target with torsion. Supply its corner identifications and prove continuity of the resulting local lift. In the characteristic-zero endpoint, choose a cyclic CM extension where the selected p-places split completely, so their local fields are unchanged.

### 7.1 Residual determinants of the blocks of a Q-ordinary Galois representation

Prove `CrystallineCM.residual_block_determinants`. Assume `p` splits in an imaginary quadratic subfield of `F`, as in §4.4a–§4.5. Let `v̄` be p-adic, `m ⊂ T^{Q^{w₀^P}_{v̄},v̄-ord}_{w₀^P}` non-Eisenstein in the support of some `H^*(X_K, V_λ), m̃ := (𝒮^{w₀^P})^*(m), v | v̄` with `Ũ^k_v ∉ m̃ (1 ≤ k ≤ t)`. Let `π` be cuspidal on `G̃(𝔸_{F⁺}), ι-Q^{w₀^P}_{v̄}-ordinary` of weight `λ̃`, whose Hecke eigenvalues on `(ι^{−1}π^∞)^{K̃, Q^{w₀^P}-ord}` come from `f : T̃^{Q^{w₀^P}_{v̄}-ord}_{m̃} → Q̄_p`; with `r_ι(π)|_{G_{F_ṽ}} ≅ (R₁(π)` ∗; `0 R₂(π)`) the two rank-n Siegel blocks grouping respectively the first and second size-n segments of the refined flag in §4.5 (whose individual rank-`n_j` blocks remain `r_j`) and `R̄_i(π)` the semisimplified reductions: det `R̄₁(π)(Art_{F_v}(ϖ_v)) = det ρ̄_m(Art_{F_v}(ϖ_v))` and det `R̄₂(π)(Art_{F_v}(ϖ_v)) = det(ρ̄_m^{∨,c}(1−2n))(Art_{F_v}(ϖ_v))`.

**Checks.**

- For the GL₄ Borel refinement, `R₁` groups the first two rank-one `r_j` and `R₂` the last two; no single rank-one determinant is identified with a rank-two residual determinant.
- For the Siegel partition `(n,n)`, each `R_i` is already one refined block.
- Semisimplified reduction preserves determinants; the identities here are at `Art(ϖ_v)`, with the normalization of §0.4.

(CN, Proposition 4.2.9, pp.66–67.)

*Needs:* §4.5; §0.4; §6.1.

### 7.2 Semisimplicity and automorphy of Q-ordinary middle-degree cohomology

Prove `CrystallineCM.q_ordinary_automorphic_characters`. Assume `p` splits in an imaginary quadratic subfield of `F`, as in §4.5. Let `m ⊂ T^T` be non-Eisenstein, `v̄ ∈ S̄_p, Q_{v̄} ⊂ P_{v̄}, m̃` a maximal ideal of `T̃^{Q_{v̄},{v̄}-ord}` extending `𝒮^*(m), K̃` good with `m̃` in the support of `H^*(X̃_{K̃}, V_λ̃)^{ord}` for a CTG weight `λ̃`, and `Ũ^k_v ∉ m̃` for `1 ≤ k ≤ t; d = n²[F⁺ : Q]`. Then `H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}[1/p]` is a semisimple `T̃^{Q_{v̄},{v̄}-ord}[1/p]-module`, and for every `f : T̃^{Q_{v̄},{v̄}-ord}(H^d(X̃_{K̃}, V_λ̃)^{ord}_{m̃}) → Q̄_p` and `ι` there is a cuspidal `π` of `G̃(𝔸_{F⁺}), ι-Q_{v̄}-ordinary` of weight `λ̃`, whose eigenvalues on `(ι^{−1}π^∞)^{K̃,Q_{v̄}-ord}` give `f`.

(CN, Proposition 4.2.11, p.67.)

*Needs:* §4.5; **PotentialAutomorphyInfrastructure, Layer 1** (ctg weight); **ArithmeticLocallySymmetricSpaces:ALS.5** (automorphic comparison).

### 7.3 A twisting character separating local constituents

Prove `CrystallineCM.local_constituent_separating_twist`. Here `R₁,R₂` denote the two rank-n Siegel blocks of §7.1 in each generic factor. In the proof of Torsion local–global compatibility at a Q-ordinary place (CL.7), possibly after enlarging `O`, there is a continuous character `ψ̄ : G_F → k^×`, unramified at `S_p` and with `ρ̄_{m̃(ψ)}` decomposed generic, such that `(1)` the irreducible constituents of `ρ̄_{m(ψ)}|_{G_{F_ṽ}}` are disjoint from those of `ρ̄^{∨,c}_{m(ψ)}(1−2n)|_{G_{F_ṽ}}; (2)` for every factor `i` of `Ã(ψ)[1/p] = ∏_{i=1}^{r} E` (p.69; this `r` is not the `r` of `n = n₁ + ⋯ + n_r`) the irreducible constituents of `R̄^i_{1,ψ}` coincide with those of `ρ̄_{m(ψ)}|_{G_{F_ṽ}}`.

Extend the finite local prescriptions into prime-to-p roots of unity, using divisibility as in **PotentialModularityAndCompatibleSystems, §2.15**, `cht_character_extension`. The extension has finite image but may have larger order. Impose triviality at the generic split prime to preserve genericity.

**Checks.**

- An unramified local value is prescribed at both selected p-places; a prescription at only one does not control the conjugate constituent.
- For a forbidden finite set of determinant ratios, values in sufficiently large prime-to-p roots of unity avoid every ratio.
- Trivial local character at the chosen generic split prime leaves its Frobenius eigenvalues unchanged.

(CN, Sub-lemma 1, pp.70–71; CHT, Lemma 4.1.1, p.116, via the cited character-extension target.)

*Needs:* §7.1; **PotentialModularityAndCompatibleSystems, §2.15** (`cht_character_extension`); **ClassFieldTheory, Layers 11–12**; **ArithmeticLocallySymmetricSpaces:ALS.3** (character twist); **PotentialAutomorphyInfrastructure, Layer 1** (genericity making character twist).

### 7.4 Torsion local–global compatibility at a Q-ordinary place

Prove `CrystallineCM.torsion_local_crystalline_block_lift`. Assume `p` splits in an imaginary quadratic subfield of `F; K ⊂ GL_n(𝔸_{F,f})` good; `v̄ ≠ v̄′ ∈ S̄_p; λ` dominant for `G; m ≥ 1; Q_{v̄} ⊂ P_{v̄}` standard with `K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄})`, identified via `ι_ṽ` with the block parabolic of a partition `(n₁,…,n_t)` of `2n` with `n = n₁ + … + n_r; m ⊂ T^{Q_{v̄},{v̄}-ord}` maximal in the support of `H^*(X_K, V_λ/ϖ^m)`. Assume `(1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) m` non-Eisenstein with `ρ̄_m` decomposed generic; `(3)` the condition on `T` of CN, Theorem 2.1.20; `(4) [K_{v̄} ν(ϖ) K_{v̄}] ∉ m` for all `ν ∈ X_{Q_{v̄}}`. Then for each `q ∈ [0, d − 1]` there are `N` depending only on `n` and `[F⁺ : Q]`, `J ⊂ T^{Q_{v̄},{v̄}-ord}(H^q(X_K, V_λ/ϖ^m)_m)` with `J^N = 0`, and `ρ_m : G_{F,T} → GL_n(T^{…}(H^q(X_K, V_λ/ϖ^m)_m)/J)` such that: `(1)` char `ρ_m(Frob_v) = P_v(X)` for `v ∉ T; (2)` for `v | v̄, ρ_m|_{G_{F_v}}` lifts to `ρ̃_v : G_{F_v} → GL_n(Ã)` for a finite flat local O-algebra `Ã` with `f : Ã → T^{…}/J; (3) ρ̃_v[1/p]` is semistable with labelled Hodge–Tate weights (`λ_{τ,n}` < … < `λ_{τ,1} + n − 1); (4) ρ̃_ṽ[1/p] ≅` upper triangular with diagonal blocks `ρ̃_{ṽ,r+1},…,ρ̃_{ṽ,t}` and `ρ̃_{ṽc}[1/p] ≅` upper triangular with diagonal blocks `ρ̃_{ṽc,r},…,ρ̃_{ṽc,1}`, each `ρ̃_{v,j} : G_{F_v} → GL_{n_j}(Ã[1/p])` crystalline with labelled Hodge–Tate weights increasing from top left to bottom right; `(5)` for `j =` r+1,…,t, det `ρ̃_{ṽ,j}` is `Ã`-valued with image `ψ_j` under `f`, where `∏_{j=r+1}^k ψ_j(Art(u)) = ∏_{i=1}^{n_{r+1}+…+n_k} ∏_τ τ(u)^{−λ_{τ,n−i+1}−i+1}` for `u ∈ O^×_{F_ṽ}` and `∏_{j=r+1}^k ψ_j(Art(ϖ_ṽ)) = ε_p^{Σ_i(1−i)}(Art(ϖ_ṽ)) Ũ^{k−r}_v`. The ordered Hodge–Tate list is `h_{τ,i}=λ_{τ,n−i+1}+i−1` for `1≤i≤n`. The local finite-flat algebra and lift may depend on `v, q` and `m`; the nilpotence exponent does not. No globally automorphic lift of the torsion representation is claimed.

(CN, Proposition 4.2.13, pp.67–71.)

*Needs:* §6.12; §6.13; §7.1; §7.2; §7.3; **PotentialAutomorphyInfrastructure, Layer 1** (ctg one embedding perturbation); **IntegralHeckeAndGaloisDeterminants:IHG.1**; **IntegralHeckeAndGaloisDeterminants:IHG.5**; **LocalGaloisDeformationRings, §3.13** (semistable ordinary quotient).

### 7.5 Local–global compatibility at p via deformation rings

Prove `CrystallineCM.integral_local_global_deformation_factorization`. Let `F` be an imaginary CM field containing an imaginary quadratic field, `p` a prime split in an imaginary quadratic subfield of `F, T ⊇ S_p` finite with `T = T^c` and the condition of CN, Theorem 2.1.20; `K ⊂ GL_n(𝔸_{F,f})` good with `K_v = GL_n(O_{F_v})` for `v ∉ T; v̄ ≠ v̄′ ∈ S̄_p; λ` dominant for `G; Q_{v̄} ⊂ P_{v̄}` in one of the cases (cr-ord) `ι_ṽ(Q_{v̄})` the parabolic of the partition (n,1,…,1) of `2n`; (ord) `ι_ṽ(Q_{v̄}) = B_{2n}`; (cr) `Q_{v̄} = P_{v̄}; K_{v̄} = 𝒬_{v̄} ∩ G(F⁺_{v̄}); m ⊂ T^{Q_{v̄},{v̄}-ord}` maximal in the support of `H^*(X_K, V_λ)`. Assume `(1) Σ_{v̄″≠v̄,v̄′}[F⁺_{v̄″} : Q_p] ≥ ½[F⁺ : Q]; (2) m` non-Eisenstein with `ρ̄_m` decomposed generic; `(3) [K_{v̄} ν(ϖ) K_{v̄}] ∉ m` for `ν ∈ X_{Q_{v̄}}`. Then there are `N ≥ 1` depending only on `n` and `[F⁺ : Q]`, `J ⊂ T^{Q_{v̄},{v̄}-ord}(RΓ(X_K, V_λ)_m)` with `J^N = 0` and `ρ_m : G_{F,T} → GL_n(T^{…}(RΓ(X_K, V_λ)_m)/J)`, unramified with char `ρ_m(Frob_v) = P_v(X)` for `v ∉ T`, such that the induced `t_{ρ_m} : R^□_{ρ̄_m} → T^{…}/J` satisfies: (cr-ord) its restriction to `R^□_{ρ̄_m|G_{F_ṽ}}` factors through `R^{△,λ_ṽ}` and to `R^□_{ρ̄_m|G_{F_{ṽc}}}` through `R^{cris,λ_{ṽc}}`; (ord) for `v | v̄` it factors through `R^{△,λ_v}`; (cr) for `v | v̄` it factors through `R^{cris,λ_v}`.

(CN, Theorem 4.2.15, pp.71–72.)

*Needs:* §7.4; **IntegralHeckeAndGaloisDeterminants:IHG.5**; **IntegralHeckeAndGaloisDeterminants:IHG.2** (ghost nilpotence); **LocalGaloisDeformationRings, §3.13** (semistable ordinary quotient).

### 7.6 Fixed-determinant refinement

Prove `CrystallineCM.fixed_determinant_factorization`. In the setting of Local–global compatibility at `p` via deformation rings (CL.7), assume `p` ∤ `n` and `f : T^{Q_{v̄},{v̄}-ord}(RΓ(X_K, V_λ)_m)/J →` A with `det(f_*(ρ_m)) = ψ` for a character `ψ : G_{F,T} → O^×` crystalline at all places of `S_p` with `τ-labelled` Hodge–Tate weights `Σ_{i=1}^n λ_{τ,i} + (n − i)`. Then for `v | v̄` the induced map `R^{△,λ_v}_{ρ̄_m|G_{F_v}} →` A or `R^{cris,λ_v}_{ρ̄_m|G_{F_v}} →` A factors through the corresponding fixed-determinant `ψ` lifting ring.

(CN, Corollary 4.2.16, p.72.)

*Needs:* §7.5; **LocalGaloisDeformationRings, §3.14** (fixed determinant pst rings).

### 7.7 Crystallinity at p over totally real fields and the CM export

For CM `F`, reuse **AutomorphicGaloisRepresentationsPartII:AG2.6**, `allCMCrystallineIwahoriAdmissibility`, and `allCMCoefficientPrimeComparison` for the labelled weights. For every regular algebraic cuspidal `π`, spherical `π_v` implies crystallinity at `v|p`, without residual irreducibility or decomposed genericity.

Prove `CrystallineCM.unramified_automorphic_crystallinity` for the remaining totally real specialization. Let `F` be totally real, `n≥2`, `p` any prime, `π` regular algebraic cuspidal on `GL_n(𝔸_F)` of weight `λ`, `v|p` spherical, and `ι:Q̄_p≅C`. Let `r_ι(π)` be its attached representation. If its semisimplified residual reduction is irreducible and decomposed generic, then `r_ι(π)|G_{F_v}` is crystalline with labelled weights `h_{τ,i}=λ_{ιτ,n−i+1}+i−1`, `1≤i≤n`. Set `F⁺=F`. Pass to a cyclic CM extension preserving residual irreducibility and cuspidality and split completely at `v`, compare the attached representations, then apply the CM export at the unchanged completion. Enlarge the finite coefficient field to contain the embeddings.

**Checks.**

- In the CM case the supplied theorem applies even when the residual representation is reducible; no residual hypothesis is added to that export.
- Complete splitting at the selected totally real place identifies its local Galois group with that of the CM extension, so crystallinity descends through that identification.
- A ramified local extension cannot replace complete splitting: a potentially crystalline representation need not be crystalline over the original local field.

(CN, §4.3, Theorem 4.3.1 and proof, p.73; AG2.6, the two named coefficient-prime targets.)

*Needs:* **AutomorphicGaloisRepresentationsPartII:AG2.4**; **AutomorphicGaloisRepresentationsPartII:AG2.6–AG2.7** (`allCMCrystallineIwahoriAdmissibility`, `allCMCoefficientPrimeComparison`, `NonselfdualComparisonExport`); **PadicHodgeTheory, §§3.2–3.6**; **PotentialAutomorphyInfrastructure, §2.3**; **PotentialModularityAndCompatibleSystems, §§2.12–2.16**; **PotentialAutomorphyInfrastructure, §2.1** (genericity normal closure restriction).

### Examples

For `n=2` and `λ_τ=(0,0)`, the list `h_{τ,i}=λ_{τ,n−i+1}+i−1` is (0,1), and its sum gives determinant weight `1`. At `p=3` or `p=5`, `p∤n`, so the fixed-determinant refinement applies when its remaining hypotheses hold. A local coefficient map `O→O/ϖ` illustrates that the torsion target need not be flat; finite flatness is required of the auxiliary lifting algebra.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.3**; **ArithmeticLocallySymmetricSpaces:ALS.5**; **AutomorphicGaloisRepresentationsPartII:AG2.4**; **AutomorphicGaloisRepresentationsPartII:AG2.6–AG2.7**; Layer 0; Layer 4; Layer 6; **IntegralHeckeAndGaloisDeterminants:IHG.1**; **IntegralHeckeAndGaloisDeterminants:IHG.2**; **IntegralHeckeAndGaloisDeterminants:IHG.5**; **LocalGaloisDeformationRings, §§3.13, 6.6**; **LocalGaloisDeformationRings, §3.14**; **PotentialAutomorphyInfrastructure, §2.3**; **PadicHodgeTheory, §§3.2–3.6**; **PotentialAutomorphyInfrastructure, Layer 1**; **PotentialAutomorphyInfrastructure, §2.1**; **PotentialModularityAndCompatibleSystems, §§2.12–2.16**; **PotentialModularityAndCompatibleSystems, §2.15** (`cht_character_extension`); **ClassFieldTheory, Layers 11–12**.

## Layer 8: Two-component patching and PGL₂ cohomology

Package common-residual perfect complexes, finite derived Hecke images modulo nilpotents, equidimensional local rings and unique generic generalizations. Prove two-system automorphic component propagation and pointwise augmentation support. Import exact BT and semistable-ordinary local component results from LocalGaloisDeformationRings. Construct non-neat `PGL₂` equivariant cohomology by homotopy limits, identify it with the AKT complex, and obtain its finite Hecke Galois representation; under `p` odd, `ζ_p∈F` and trivial residual coefficients, prove localized vanishing and perfectness.

### 8.1 Cohomology of PGL₂ locally symmetric spaces at non-neat level

Define `CrystallineCM.Pgl2Cohomology`. For `F` imaginary CM, `G = PGL_{2,F}, K = ∏K_v ⊂ PGL₂(Ô_F)` (not necessarily neat), `S ⊇ S_p` with `K_v = PGL₂(O_{F_v})` for `v ∉ S, R = O` or `O/ϖ^m` and `V` an `R[K_S]-module` finite free over `R` with `V/ϖ^r` smooth: C•(K,V) `:= holim_r RΓ(K, RΓ(𝔛_G, V/ϖ^r)) ∈ D⁺`(R) and C•(K/`K′`,V) `∈ D⁺`(R[K/`K′`]) for open normal `K′` with `K′^S = K^S`, with `H(G^S,K^S)-actions (T_{v,i}` images of `GL₂` operators, `T_{v,2} = 1, P_v(X)); RΓ(K/K′`, C•(K/`K′`,V)) `=` C•(K,V); cohomology finitely generated, Hecke algebras `T^S_G(C•(K/K′,V))` O-finite, localizations cut out by idempotents `e_m`.

The required interface is:

- `CrystallineCM.Pgl2Cohomology_quotient_descent`: For `K′`⊴K with unchanged tame level, `RΓ(K/K′,C•(K/K′,V))≅C•(K,V)`.
- `CrystallineCM.Pgl2Cohomology_coefficient`: Finite-free coefficient maps induce morphisms compatible with derived reduction and the Hecke action.
- `CrystallineCM.Pgl2Cohomology_central_operator`: `T_{v,2}=1` and `P_v(X)=X²−T_{v,1}X+q_v` on this `PGL₂` complex.

**Checks.**

- `CrystallineCM.Pgl2Cohomology_test_trivial_quotient`: When `K′=K`, the equivariant complex reduces to the ordinary non-neat coefficient complex.
- `CrystallineCM.Pgl2Cohomology_test_central_scalar`: The scalar `GL₂` double coset maps to identity in `PGL₂`, giving `T_{v,2}=1`.
- `CrystallineCM.Pgl2Cohomology_test_nonneat`: A finite p-stabilizer can have unbounded mod-p group cohomology before localization; the definition cannot declare the non-neat complex perfect unconditionally.

(CN, §5.5, pp.79–80.)

*Needs:* **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 4**; **CompletedCohomologyPartII, Layer 6**; **ArithmeticLocallySymmetricSpaces:ALS.3** (derived hecke action).

### 8.2 Two-system patching data

Define `CrystallineCM.TwoSystemPatchingData`. Let `S∞=O[[X₁,…,X_r]]` with augmentation `a∞=(X₁,…,X_r), C∞` and `C′∞` perfect `S∞-complexes`, and fix an isomorphism `C∞⊗ᴸS∞/ϖ≅C′∞⊗ᴸS∞/ϖ`. Let `T∞⊂End_D(S∞)(C∞)` and `T′∞⊂End_D(S∞)(C′∞)` be finite `S∞-algebras` whose images coincide in the endomorphism algebra of that residual complex. Let `R∞,R′∞` be complete Noetherian local `S∞-algebras` surjecting onto `T∞/I∞,T′∞/I′∞` for nilpotent ideals, and identify `R∞/ϖ≅R′∞/ϖ` compatibly with `S∞` and the actions on the common residual cohomology modulo `Ī∞+Ī′∞`. Choose `q₀∈Z,l₀≥0`. Assume dim `R∞=dim R′∞=dim S∞−l₀, dim(R∞/ϖ)=dim(R′∞/ϖ)=dim S∞−l₀−1`; both R-spectra are equidimensional with characteristic-zero generic points; each special generic point has a unique generic generalization in each R-spectrum. The augmentation fiber `C∞⊗ᴸS∞/a∞` has nonzero rational cohomology concentrated in `[q₀,q₀+l₀]`. Fix a characteristic-zero prime `x` of `T∞/a∞T∞`. Support is defined through the finite Hecke action modulo nilpotents; no honest `R∞-module` chain model is postulated.

The required interface is:

- `CrystallineCM.TwoSystemPatchingData_residual_identification`: The chosen isomorphism of residual perfect complexes identifies the two finite derived Hecke images and the cohomology actions modulo `Ī∞+Ī′∞`.
- `CrystallineCM.TwoSystemPatchingData_support`: Support over `R∞` is the closed subset induced from the finite `T∞` action modulo nilpotents, independent of the chosen nilpotent exponent.
- `CrystallineCM.TwoSystemPatchingData_specialization_relation`: A pair of components `C,C_a` is related when chosen special generic points have the same unique generic generalization in Spec `R′∞` under the fixed residual ring isomorphism.

**Checks.**

- `CrystallineCM.TwoSystemPatchingData_test_same_system`: If both systems and residual identifications coincide, the relation pairs a component with itself and propagation preserves its existing support.
- `CrystallineCM.TwoSystemPatchingData_test_crossing_reject`: For `R=O[[x,y]]/(xy−ϖ²)`, the special generic points are `(ϖ,x)` and `(ϖ,y)`, while `(ϖ,x,y)` is a closed intersection point. The latter cannot be used as a special generic point in the specialization relation, even though it lies on both special components.
- `CrystallineCM.TwoSystemPatchingData_test_nilpotents`: Replacing an action by a larger nilpotent quotient does not change its closed support, matching the IHG ghost/maximal-ideal interface.

(CN, §5.4, Assumption 5.4.1, pp.77–78.)

*Needs:* `mathlib:DerivedCategory`; **DeformationAndDerivedPatchingAlgebra, §§9.2, 9.4–9.5**; **DeformationAndDerivedPatchingAlgebra, §§8.1–8.5**.

### 8.3 Automorphic components propagate through the special fibre

Prove `CrystallineCM.two_system_automorphic_component_propagation`. Under Assumption 5.4.1, with `Supp_{R_∞}(H^*(C_∞)) =` Spec `T_∞: (1)` there is an irreducible component `C_a ⊂` Spec `R_∞` containing the automorphic point `x` with `C_a ⊂` Spec `T_∞; (2)` if `C_a ⊂` Spec `T_∞` is an irreducible component of Spec `R_∞` which contains `x` and `C ⊂` Spec `R_∞` is an irreducible component such that `C ∩ Spec(R_∞/ϖ)` and `C_a ∩ Spec(R_∞/ϖ)` contain generic points `x_C, x_a` generalizing to the same generic point `x′` of Spec `R′_∞`, then `C ⊂` Spec `T_∞`.

Prove this using DP §§9.2, 9.4–9.5: local concentration and nonzero Euler length at the automorphic point, specialization to `x_a`, transport through the common auxiliary component `x′`, and return through `x_C`. The auxiliary ring may have several components; the two specified special-fibre points must lie under the same one. This pairwise relation replaces DP §9.6's global uniqueness hypothesis.

**Checks.**

- For the same component on both sides, propagation recovers its existing automorphic support.
- Two special-fibre generic points lying under different auxiliary components do not satisfy the relation.
- Nilpotent Hecke error ideals preserve reduced prime support; they need not vanish as ideals.

(CN, §5.4, Proposition 5.4.2 and proof, pp.78–79.)

*Needs:* §8.2; **DeformationAndDerivedPatchingAlgebra, §§9.2, 9.4–9.5**.

### 8.4 Comparison with the Allen–Khare–Thorne complexes

Prove `CrystallineCM.pgl2_akt_complex_comparison`. There are natural Hecke-equivariant quasi-isomorphisms A(K/`K′`, `V) ≅` C•(K/`K′`, `V`), where A(K/`K′`, `V`) are the complexes of [AKT23, §5.1] built from singular chains of `𝔛̄^{dis}_G`.

(CN, Lemma 5.5.1, p.80.)

*Needs:* §8.1; **ArithmeticLocallySymmetricSpaces:ALS.3** (discrete topological comparison).

### 8.5 Support of patched cohomology at points of automorphic components

Prove `CrystallineCM.augmented_automorphic_support`. Let `C` be an irreducible component of Spec `R_∞` satisfying the hypothesis of Automorphic components propagate through the special fibre (CL.8)(2) for some automorphic `C_a, x ∈ C` and y its contraction to `S_∞`. Then the support of `H^*(C_∞ ⊗^L S_∞/y)_y` over Spec `R_∞` contains `x`; if y is one-dimensional of characteristic `0, x` lies in the support of `H^*(C_∞ ⊗^L S_∞/y)[1/p]`.

(CN, Corollary 5.4.3, p.79.)

*Needs:* §8.3; **DeformationAndDerivedPatchingAlgebra, §§9.2, 9.4–9.5**.

### 8.6 Galois representations for PGL₂ over CM fields

Prove `CrystallineCM.pgl2_hecke_galois_representation`. Suppose `p` is odd, `S = S^c, F` contains an imaginary quadratic field and every finite `v ∉ S` of residue characteristic `l` has: `S` contains no l-adic place and `l` unramified in `F`, or `l` splits in an imaginary quadratic subfield of `F`. Set `T=T^S_G(C•(K/K′,V))`. For every maximal ideal `𝔪⊂T` there is a continuous semisimple `ρ̄_𝔪 : G_{F,S} → GL₂(T/𝔪)` with `det(X − ρ̄_𝔪(Frob_v)) = P_v(X)` mod `𝔪` for `v ∉ S`.

If `ρ̄_𝔪` is absolutely irreducible, set `T_𝔪=e_𝔪T=T^S_G(C•(K/K′,V)_𝔪)`, the complete local O-algebra cut out by §8.1's idempotent. There are `N≥1` depending only on `[F : Q]`, an ideal `J⊂T_𝔪` with `J^N=0` and a continuous lift `ρ_𝔪 : G_{F,S} → GL₂(T_𝔪/J)` of `ρ̄_𝔪`. For every `v ∉ S`, `det(X − ρ_𝔪(Frob_v))` is the image of the full polynomial `P_v(X)=X²−T_{v,1}X+q_v` under `T→T_𝔪→T_𝔪/J`; in particular `det ρ_𝔪=ε_p⁻¹` with values in `(T_𝔪/J)×`.

**Checks.**

- If `T=T₁×T₂` and `𝔪` selects `T₁` with absolutely irreducible residual representation while `T₂` has reducible residual representation, reconstruction applies to `T_𝔪` alone; it imposes no irreducibility hypothesis on `T₂`.
- The same bound `N` works for integral coefficients and for every coefficient depth `O/ϖ^m`, independently of `K`, `K′`, `V` and `𝔪`.
- The scalar `GL₂` Hecke operator acts as identity on the `PGL₂` complex, so the constant term remains `q_v` in `T_𝔪/J`; together with the trace coefficient this gives the full Frobenius polynomial and, by Chebotarev, `det ρ_𝔪=ε_p⁻¹`.

(CN, Proposition 5.5.2, pp.80–81.)

*Needs:* §8.1; §8.4; **IntegralHeckeAndGaloisDeterminants:IHG.5**; **ArithmeticGaloisRepresentations, §5.10**; **LocalGaloisDeformationRings, §F.2.7**.

### 8.7 Vanishing above the real dimension and perfectness

Prove `CrystallineCM.nonneat_localized_perfectness`. Let `m ⊂ T^S_G(C•(K,V))` be maximal with residue field `k`; take `R=O` or `O/ϖ^a` with `a≥1`, `V` finite free over R, and assume `V ⊗_R k ≅ k` with trivial `K_S-action, p` odd with `ρ̄_m` absolutely irreducible, and `ζ_p ∈ F`. Then `H^i(C•(K,V))_m = 0` for `i > dim_R X_G`; in particular `C•(K,V)_m` is a perfect complex of R-modules.

Prove the AKT Theorem 5.11/Proposition 5.18 argument: control elementary abelian p-stabilizers and their centralizers, then use an auxiliary ray-class-split Hecke operator whose eigenvalue contradicts an irreducible residual trace to kill cohomology above the real dimension. Apply the minimal-complex criterion of AKT Lemma 3.2 to finite cohomology with bounded derived residue reduction; bounded cohomology alone over `O/ϖ^m` is insufficient. ALS §§6.1–6.3 supply descent and lowest-degree control only.

**Checks.**

- A point with stabilizer `C_p` and F_p coefficients has unbounded cohomology before non-Eisenstein localization.
- At neat level this agrees with the usual finite free-cell model.
- At non-neat level with p-torsion stabilizers, no averaging by their order is available; bounded derived residue reduction is required even when R is not regular.

(CN, Proposition 5.5.3, p.81; AKT, Theorem 5.11, pp.46–47, Proposition 5.18, pp.50–51, and Lemma 3.2.)

*Needs:* §8.6; §8.4; **ArithmeticLocallySymmetricSpaces:ALS.6** (finite-level descent); **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 4**; **CompletedCohomologyPartII, Layer 6**.

### Examples

At `PGL₂` level, the scalar `GL₂` Hecke coset acts as identity, giving `X²−T_{v,1}X+q_v`. For a finite p-stabilizer, positive-degree mod-p group cohomology can persist indefinitely before localization, so boundedness and perfectness require §8.7. In `O[[x,y]]/(xy−ϖ²), (ϖ,x)` and `(ϖ,y)` are special-fiber generic points, whereas `(ϖ,x,y)` is an intersection point and cannot replace either in the component relation.

### Dependencies

**ArithmeticLocallySymmetricSpaces:ALS.3**; **ArithmeticLocallySymmetricSpaces:ALS.6**; **CompletedCohomologyPartII, Layer 0**; **CompletedCohomologyPartII, Layer 2**; **CompletedCohomologyPartII, Layer 4**; **CompletedCohomologyPartII, Layer 6**; **DeformationAndDerivedPatchingAlgebra, §§8.1–8.5**; **DeformationAndDerivedPatchingAlgebra, §§9.2, 9.4–9.5**; **ArithmeticGaloisRepresentations, §5.10**; **LocalGaloisDeformationRings, §F.2.7**; **IntegralHeckeAndGaloisDeterminants:IHG.5**.

## Layer 9: Barsotti–Tate automorphy lifting and solvable descent

State the fifteen prepared CM lifting hypotheses, define fixed-determinant `χ-type` and Taylor–Wiles deformation problems, and construct deformation-to-derived-Hecke surjections and diamond-compatible perfect complexes. Use AKT small-image Taylor–Wiles prime selection with its `p=5` exception, check `q₀=l₀=[F⁺:Q]` and patch the two coefficient systems to prove prepared BT lifting. Prove solvable preparation and descent preserving the full residual/cyclotomic field. Export potentially BT automorphy under the original hypotheses plus `d_cyc≠3` or projective residual image not `A₄`; retain the cubic-tetrahedral limitation of the finite-image argument. Construct the prepared `PGL₂` level with pro-v Iwahori auxiliary components, choose the three unitary parabolic branches and the residual ordinary Hecke ideal. CL.9.3 constructs the non-enormous AKT Selmer detection and CM relative generator count from the conditional selection and general presentation framework of GlobalGaloisDeformations. Construct §9.8 immediately after §9.5, before §9.6, so that the ordered eigenline, diamond group and Taylor–Wiles level datum precede the perfect homology model.

### 9.1 The data and hypotheses (1)–(15) of the special case of Theorem 5.2

Define `CrystallineCM.Setup56`. Data: `F` imaginary CM, `p` odd, `ι : Q̄_p ≅ C; S ⊇ S_p` finite; `R ⊂ S` prime to `p` and `S_p = S^cr_p` ⊔ `S^st_p; π` cuspidal on `PGL₂(𝔸_F)`, regular algebraic of weight `0`. Hypotheses: `(5)` every prime below `S` or ramified in `F` splits in an imaginary quadratic subfield of `F` (so `S` is split over `F⁺` and F/`F⁺` unramified); `(6)` for `v ∈ S_p` there is a p-adic `v′ ≠ v̄` of `F⁺` with `Σ_{v″≠v̄,v′}[F⁺_{v″} : Q_p] > ½[F⁺ : Q]`, and the residue field of `v̄` is bigger than `F_p; (7) π_v` unramified for `v ∉ R ∪ S^st_p; (8) π^{Iw_v}_v ≠ 0` for `v ∈ R ∪ S^st_p; (9)` for `v ∈ S^st_p, π` is `ι-ordinary` of weight `0` at `v` and `r_ι(π)|_{G_{F_v}}` is non-crystalline ordinary; `(10) ζ_p ∈ F` if `S = S_p ∪ R; (11)` otherwise `S − (S_p ∪ R)` contains two places of distinct residue characteristics; `(12) v ∉ R^c` and `H²(F_v, ad⁰r̄) = 0` for `v ∈ S − (R ∪ S_p); (13) r̄_{π,ι}` decomposed generic with `r̄|_{G_{F(ζ_p)}}` irreducible; `(14) r̄_{π,ι}|_{G_{F_v}}` trivial for `v ∈ S_p ∪ R; (15)` if `p=5` and the projective image of `r̄_{π,ι}(G_{F(ζ₅)})` is conjugate to `PSL₂(F₅)`, the extension of `F` cut out by the projective image of `r̄_{π,ι}` does not contain `ζ₅`.

The required interface is:

- `CrystallineCM.Setup56_local_branch`: The data remembers the partition `S_p^{cr} ⊔ S_p^{st}`. PreparedPGL2Level chooses the unitary split-place orientation and its corresponding parabolics.
- `CrystallineCM.Setup56_auxiliary`: It remembers either `ζ_p∈F` with `S=S_p∪R`, or two auxiliary places of distinct residue characteristics satisfying `H²(ad⁰r̄)=0`.
- `CrystallineCM.Setup56_residual`: The residual representation is decomposed generic, irreducible on `G_{F(ζ_p)}`, locally trivial at `S_p∪R`, with the exact `p=5` exceptional-field condition.

**Checks.**

- `CrystallineCM.Setup56_test_weak_degree`: A complementary degree sum equal to half violates the strict `>½` condition in this prepared setup, although it suffices for Theorem 4.2.15.
- `CrystallineCM.Setup56_test_two_auxiliary`: Two auxiliary places of the same residue characteristic violate condition `(11)`.
- `CrystallineCM.Setup56_test_small_residue`: A p-place with residue field `F_p` violates condition `(6)`, even if the residual representation there is trivial.

(CN, §5.6, pp.81–82.)

*Needs:* §7.5; §8.1; **LocalGaloisDeformationRings, §§4.14–4.15** (bt ring unique generalisation); **LocalGaloisDeformationRings, §6.6** (snowden ordinary ring trivial residual).

### 9.2 A reducibility criterion for mod-p representations (variant of DDT 4.11)

Prove `CrystallineCM.determinant_kernel_reducible_except_tetrahedral`. Let `G` be finite, `p` odd, `ρ : G → GL₂(F̄_p)` with det `ρ` of order `d > 1`, and suppose (tr `ρ(g))² = (1 + det ρ(g))²` whenever det `ρ(g) ≠ 1`. Then `ρ|_{ker(det ρ)}` is reducible, unless `d = 3` and the projective image of `ρ` is `A₄`; in that case `ρ|_{ker(det ρ)}` has projective image `Z`/2 `× Z`/2 and is absolutely irreducible.

Reducibility here means that the determinant kernel fixes a one-dimensional subspace of the two-dimensional vector space over the algebraically closed coefficient field. Use Mathlib's `Matrix.ProjGenLinGroup.mk` to map the ambient `GL₂` to `PGL₂` and take the range of its composite with `ρ`, denoted `projectiveMatrixImage`. The kernel is the scalar subgroup of the ambient `GL₂`, as expressed by `Matrix.GeneralLinearGroup.center_eq_range_scalar`. The predicate `determinantKernelHasLine` asks for an invariant submodule of dimension one on the determinant kernel. Conjugation on the ambient `GL₂` gives an equivalent description of the projective image. Quotienting by the centre of `ρ(G)` would instead remove every element of an abelian image, including nonscalar projective elements, and would change the criterion. In the exceptional branch, the determinant image has order three, the projective image is `A₄`, the determinant kernel has projective image `(Z/2)²`, and it fixes no line. The non-exceptional branch supplies a fixed line without assuming that `ρ` itself is irreducible.

The two light specializations also apply to a general group and field: `projectiveMatrixImage` is the range of the composite with the ambient projective quotient, and `determinantKernelHasLine` requires a rank-one invariant submodule. Their API consists of `projectiveMatrixImage_mem_iff` (membership has a preimage under `ρ`), `projectiveMatrixImage_scalar_kernel` (an element maps to identity precisely when its matrix is scalar), `projectiveMatrixImage_restrict_le` (restriction has image contained in the full projective image), `determinantKernelHasLine_fixed_line` (equivalence with a nonzero vector whose span is preserved by every determinant-one element), `determinantKernelHasLine_of_invariant_line` (a line invariant under the whole group is sufficient), and `determinantKernelHasLine_conjugate` (change of basis transports the line).

**Checks.** These authored controls distinguish the projective quotient and the line predicate:

- For the trivial representation on a two-dimensional space, the projective image has one element and the determinant kernel preserves a coordinate line. The zero submodule is insufficient because its dimension is zero.
- For the inclusion of the cyclic diagonal subgroup generated by `diag(2,1)` over `Q`, the projective image is nontrivial, and a coordinate line is invariant. Quotienting by the subgroup's own centre would incorrectly give a trivial projective image.
- `CrystallineCM.quaternion_no_common_eigenline`: For the characteristic-seven quaternion matrices `i` and `j` displayed in the references, `i²=j²=−1` and `ij=−ji`. They have no common eigenline even after extending to an algebraic closure: two putative eigenvalues would be nonzero, while anticommutation would force their product to be its own negative. The determinant-kernel line predicate fails, and the projective quaternion image is Klein four.

(CN, Lemma 5.6.5, pp.85–86.)

*Needs:* **ArithmeticGaloisRepresentations, Layer 4** (dickson classification and the dyadic refinement).

### 9.3 Taylor–Wiles data for GL₂ over CM fields without enormous image (Allen–Khare–Thorne)

Prove `CrystallineCM.small_image_taylor_wiles_prime_selection`. Fix an imaginary quadratic subfield `F₀⊂F` of the imaginary CM field `F`, and write `F=F⁺F₀`. Let `p` be odd, and `ρ̄ : G_F → GL₂(k)` continuous with `ρ̄|_{G_{F(ζ_p)}}` absolutely irreducible and, if `p = 5` and the projective image of `ρ̄(G_{F(ζ₅)})` is `PSL₂(F₅)`, the field cut out by the projective image of `ρ̄` not containing `ζ₅`. Then for every `N ≥ 1` there is a Taylor–Wiles datum `(Q_N, (α_v)_{v∈Q_N})` of level `N` (Definition 5.3.5) of size `q` independent of `N`, killing the relevant dual Selmer group ([AKT23, Prop. A.6]), used with [ACC+18, §6.4] as in the proof of [AKT23, Thm. A.7]. Fix `T=S`, choose `q≥dim_k H¹_{S⊥,S}(ad⁰ρ̄(1))` with `g=q−3[F⁺:Q]−1+|S|≥0`; then there is a surjection `A_S^S[[X₁,…,X_g]]→R_{S_{Q_N}}^S`, and the places can have degree one over `Q` with underlying rational primes split in the chosen imaginary quadratic subfield. The local deformation datum is that of AKT Appendix A.2. The standing local deformation datum is AKT A.2: determinant lifting `detρ̄`, specified local deformation quotients `R_v` over `Λ_v, Λ=completed` tensor of `Λ_v`, nonempty `S⊇S_p`, and the finite coefficient field large enough for all residual eigenvalues. Degree-one places have underlying rational primes split in the quadratic field `F₀`, after excluding its ramified primes.

Construct the following inputs in this section:

- `CrystallineCM.small_image_dual_selmer_detection`: Under the residual and local-datum hypotheses above, for every `N≥1` and cocycle κ representing a nonzero dual-Selmer class, find `σ∈G_{F(ζ_{p^N})}` with distinct residual eigenvalues and `κ(σ)∉(σ−1)ad⁰ρ̄(1)`. Also construct a nonempty admissible distinct-eigenvalue class for padding when the dual Selmer group is zero. These are the detection and padding inputs in AKT Lemma A.5, pp.86–87.
- `CrystallineCM.small_image_taylor_wiles_prime_selection`: Apply conditional Chebotarev selection of GlobalGaloisDeformations §5.6 using that detection, producing exactly q degree-one primes away from the fixed bad set, of level N, whose underlying rational primes split in the fixed imaginary quadratic field `F₀`. This is AKT Proposition A.6, p.87.
- `CrystallineCM.cm_taylor_wiles_relative_presentation`: For `T=S`, compute the relative tangent dimension using GlobalGaloisDeformations §§3.6–3.7 and dual-Selmer vanishing. Each complex place contributes three, each selected prime contributes one, and `H⁰(F,ad⁰ρ̄(1))=0`. Obtain the displayed surjection with `g=q−3[F⁺:Q]−1+|S|`, as in AKT Propositions A.4 and A.6, pp.86–87.

**Checks.**

- At `p=3` detection uses AKT Lemma A.5 under its hypotheses; an argument requiring `p>3` is insufficient.
- The exceptional `p=5`, projective `PSL₂(F₅)` case retains the projective-field exclusion; irreducibility alone does not discharge detection there.
- If the dual Selmer group is zero, its detection condition is vacuous but a padding class is still required. For q above its dimension, padding gives exactly q primes for every N; the count and g are independent of N.
- For `[F⁺:Q]=1`, `|S|=1`, `q=3`, the CM formula gives `g=0`, rather than the totally real Gee count.
- `F=Q(ζ₅)` has only the real quadratic subfield `Q(√5)` and is outside this selection target, even at `p=7` for the standard `S₃` representation from `x³−2`, which remains absolutely irreducible over `F(ζ₇)`. Residual irreducibility does not supply `F₀`.

(AKT, Proposition A.6, p.87; Lemma A.5 and Proposition A.4, p.86; CN, Proof of Proposition 5.6.1, p.85.)

*Needs:* **GlobalGaloisDeformations, §5.1** (Taylor–Wiles datum); **GlobalGaloisDeformations, §5.6** (conditional Chebotarev selection); **GlobalGaloisDeformations, §§3.6–3.7** (relative tangent and presentation framework); **ArithmeticGaloisRepresentations, Layer 4** (dickson classification and the dyadic refinement); **GlobalGaloisDeformations:R04.3** (global framed ring).

### 9.4 Prepared PGL₂ level and unitary parabolic branches

Define `CrystallineCM.PreparedPGL2Level`. Under Setup56, define `K=∏_v K_v⊂PGL₂(Ô_F): K_v=PGL₂(O_{F_v})` for `v∉S` or `v∈S_p^{cr}, K_v=Iw_v` for `v∈R∪S_p^{st}`, and `K_v=Iw_{v,1}`, the pro-v Iwahori, for `v∈S−(S_p∪R)`. In the auxiliary-place case `K` is neat; otherwise `ζ_p∈F` and localized perfectness uses Proposition 5.5.3. Put `T=S∪S^c`. For every `v̄|p` choose `ṽ|v̄` in `S_p^{st}` whenever that set meets `{ṽ,ṽ^c}`. The unitary parabolic `Q_{v̄}` has partition (2,1,1) if ṽ is st and `ṽ^c` is cr, (1,1,1,1) if both are st, and (2,2) if both are cr. Choose the maximal ideal `𝔪` of the corresponding Q-ordinary derived Hecke algebra from `π; U_v∉𝔪` for `v∈S_p^{st}`. Enlarge `E` so `k=k(𝔪)` contains every eigenvalue of the residual representation. The selected characteristic-zero representation has dimension two.

The required interface is:

- `CrystallineCM.PreparedPGL2Level_level_components`: Membership is componentwise membership in the specified maximal, Iwahori or pro-v Iwahori subgroup; the auxiliary level is preserved.
- `CrystallineCM.PreparedPGL2Level_unitary_partitions`: The chosen lift ṽ and the cr/st flags determine exactly the displayed three partitions; a lone st branch is placed second in the split Levi dictionary.
- `CrystallineCM.PreparedPGL2Level_residual_hecke_ideal`: The `π` eigencharacter selects `𝔪; U_v` is a unit after localization at every st place, and `k` contains the residual eigenvalues.
- `CrystallineCM.PreparedPGL2Level_localized_perfectness`: The localized coefficient complex is perfect at this `K`, using neatness in the auxiliary case and Proposition 5.5.3 with `ζ_p∈F` otherwise.

**Checks.**

- `CrystallineCM.PreparedPGL2Level_test_auxiliary_level`: At `v∈S−(S_p∪R)`, the selected level is pro-v Iwahori; replacing it by maximal compact loses the specified neatness construction.
- `CrystallineCM.PreparedPGL2Level_test_mixed_orientation`: With exactly one st place over `v̄`, choose it as ṽ; the partition is (2,1,1), with the ordinary branch in the lower-right block.
- `CrystallineCM.PreparedPGL2Level_test_three_branches`: Both st gives the Borel (1,1,1,1); both cr gives Siegel (2,2); exactly one st gives (2,1,1).
- `CrystallineCM.PreparedPGL2Level_test_non_neat`: For `S=S_p∪R` there is no auxiliary neatness argument. The `ζ_p∈F` hypothesis and localized perfectness input are required.

The local-level formula takes the integral groups `PGL₂(O_{F_v})` and their Iwahori and pro-v Iwahori subgroups as inputs. Its product is a subgroup of `∏_v PGL₂(O_{F_v})`, the compact integral part of the adelic group. Membership is checked componentwise. A component outside `S`, or in `S_p^{cr}`, is the entire integral group; otherwise a component in `R` or `S_p^{st}` is Iwahori, and the remaining component is pro-v Iwahori. Keeping a proper pro-v Iwahori at an auxiliary place is essential to the specified level. This component calculation does not supply the neatness theorem or localized perfectness.

For the unitary choice, put `st=1` when `ṽ∈S_p^{st}` and `stᶜ=1` when `ṽᶜ∈S_p^{st}`. The orientation policy is `stᶜ≤st`. Thus the admissible flags are (0,0), (1,0) and (1,1), giving respectively (2,2), (2,1,1) and (1,1,1,1). Every partition has total rank four and refines the two size-two Siegel blocks. In the mixed case the first block stays size two and the second becomes (1,1). The flags (0,1) violate the choice policy; switching the chosen place is required before using the mixed formula. The formula `preparedUnitaryPartition` records these rank-four partitions. The subgroup, residual Hecke and derived-cohomology constructions retain the full requirements above.

(CN, Proof of Proposition 5.6.1, pp.82–83; CN, Unitary parabolic cases and residual Hecke ideal, p.83.)

*Needs:* §9.1; §8.1; §8.7; §4.1; **ArithmeticLocallySymmetricSpaces:ALS.0** (standard level subgroups); **ArithmeticLocallySymmetricSpaces:ALS.3**; **ArithmeticLocallySymmetricSpaces:ALS.5**; **ArithmeticLocallySymmetricSpaces:ALS.0** (neatness iwahori criterion).

### 9.5 The global deformation problem 𝒮_χ and its coefficient line

Define `CrystallineCM.DeformationProblemsSChi`. For `χ = ∏_{v∈R} χ_v`, with `χ_v:k_v×→O×` trivial mod `ϖ` and inflated to `O^×_{F_v}: 𝒮_χ = (ρ̄, ε^{−1}_p, S, {R^{ε^{−1},BT}_v}_{v∈S^cr_p} ∪ {R^△_v}_{v∈S^st_p} ∪ {R^{ε^{−1},χ_v}_v}_{v∈R} ∪ {R^{ε^{−1}}_v}_{v∈S−(S_p∪R)})`, with the `O[K_S]-module O(χ^{−1})` via `Iw_v → O^×, (a b; c d) ↦ χ_v(a/d)`. The coefficient `O(χ^{-1})` uses `χ_v(a/d)^{-1}` at Iwahori `v∈R`, trivial outside `R`; each `χ_v` factors through the residue field `k_v×` and is trivial modulo `ϖ`; a/d is reduced to `k_v×`.

The required interface is:

- `CrystallineCM.DeformationProblemsSChi_p_local`: The p-place ring is fixed-determinant BT for `S_p^{cr}` and semistable-ordinary for `S_p^{st}`.
- `CrystallineCM.DeformationProblemsSChi_tame_local`: At `v∈R` choose the fixed-determinant `χ_v` local type; at the auxiliary smooth places choose the unrestricted fixed-determinant ring.
- `CrystallineCM.DeformationProblemsSChi_residual_character`: Since each `χ_v≡1 modϖ`, the `χ` and trivial-character coefficient modules and residual local problems coincide modulo `ϖ`.

**Checks.**

- `CrystallineCM.DeformationProblemsSChi_test_chi_one`: For `χ_v=1` at every `v∈R`, the coefficient line is the trivial O-module with its trivial Iwahori character.
- `CrystallineCM.DeformationProblemsSChi_test_chi_inverse`: If `χ_v(a/d)=u`, then `O(χ^{-1})` acts by `u^{-1}`, not `u`.
- `CrystallineCM.DeformationProblemsSChi_test_mod_p`: For `χ_v≡1 modϖ, O(χ^{-1})/ϖ` is the trivial coefficient line, giving the common residual patching complex.

(CN, §5.6, pp.83–84.)

*Needs:* §9.1; **GlobalGaloisDeformations:R04.3** (global deformation type); **GlobalGaloisDeformations:R04.3** (global framed ring); **LocalGaloisDeformationRings, §3.14** (fixed determinant pst rings); **LocalGaloisDeformationRings, §6.6** (snowden ordinary ring trivial residual); §9.4; **LocalGaloisDeformationRings, §§4.14–4.15** (bt ring unique generalisation).

### 9.6 Patching complexes of homology

Prove `CrystallineCM.taylor_wiles_perfect_dual_augmentation`. `C_{χ,Q} := RHom_{O[Δ_Q]}(C•(K₀(Q)/K₁(Q), O(χ^{−1}))_{n_Q}, O[Δ_Q])` is a perfect complex of `O[Δ_Q]-modules` with a canonical isomorphism `C_{χ,Q} ⊗^L_{O[Δ_Q]} O ≅ C_χ := RHom_O(C•(K, O(χ^{−1}))_m, O)` in D(O).

Under §9.4's level hypotheses and §9.8's distinct-eigenvalue datum, construct the residual-matching localization at the abelian p-cover. In the non-neat branch retain `p` odd, `ζ_p∈F` and absolutely irreducible residual representation, with coefficient line trivial modulo `ϖ`. Prove the perfect group-ring homology model by the second part of AKT Theorem 5.11 and its minimal-complex argument, then dualize over `O[Δ_Q]` and apply derived augmentation. ALS finite-cover descent identifies the augmented complex but does not provide non-neat group-ring perfectness.

**Checks.**

- For `Q=∅`, the diamond group is trivial and the model recovers `C_χ`.
- For nontrivial p-group `Δ_Q`, use derived augmentation, which may have higher Tor; ordinary coinvariants do not replace it.
- For non-neat base level the hypotheses of §8.7 and AKT Theorem 5.11 remain necessary; neatness of a covering level alone does not prove group-ring perfectness.

(CN, Lemma 5.6.4, pp.84–85; AKT, Theorem 5.11(2), pp.46–47, and Lemma 3.2.)

*Needs:* §9.8; §9.4; §8.7; **ArithmeticLocallySymmetricSpaces:ALS.6** (finite level descent); **DeformationAndDerivedPatchingAlgebra, §§8.1–8.5**.

### 9.7 Hecke-valued Galois representations satisfy the deformation problem 𝒮_χ

Prove `CrystallineCM.deformation_to_hecke_surjection`. There are `N` depending only on `[F : Q]`, `J ⊂ T^{S,Q_{S̄_p},S̄_p-ord}_G(C•(K, O(χ^{−1}))_m)` with `J^N = 0` and a continuous surjection `f_{𝒮_χ} : R_{𝒮_χ} → T^{S,Q_{S̄_p},S̄_p-ord}_G(C•(K, O(χ^{−1}))_m)/J` with `char(f_{𝒮_χ}` ∘ `ρ^{univ}_{𝒮_χ}(Frob_v)`) the image of `P_v(X)` for `v ∉ S`.

(CN, Proposition 5.6.2, pp.83–84.)

*Needs:* §9.5; §8.6; §7.6; **AutomorphicGaloisRepresentationsPartII:AG2.5**; **ArithmeticGaloisRepresentations, §5.10**; **LocalGaloisDeformationRings, §F.2.7**; §9.4.

### 9.8 Taylor–Wiles deformation problem

Define `CrystallineCM.TaylorWilesDeformationProblem`. `S_{χ,Q}` is the fixed-determinant problem obtained from `S_χ` by adjoining the Taylor–Wiles places `Q` and the unrestricted fixed-determinant local rings `R_v^ψ`, with `ψ=ε_p^{-1}`. Fix the ordered distinct residual Frobenius eigenvalues. The corresponding universal unframed global deformation ring `R_{S_{χ,Q}}` (framing at `T` gives the separate ring `R^T_{S_{χ,Q}}`) has the `O[Δ_Q]-structure` from inertia on the selected lifted eigenline, `Δ_Q=∏_{v∈Q}k_v×(p)`. This follows the unrestricted-ring definition in CN Definition 5.3.5; the selected eigenline specifies the diamond action, rather than replacing the local problem by the unramified quotient.

The required interface is:

- `CrystallineCM.TaylorWilesDeformationProblem_forget`: Away from `Q` the local conditions agree with `S_χ`. Killing the `Δ_Q` augmentation ideal enforces unramifiedness at `Q` and gives a quotient `R_{S_{χ,Q}}→R_{S_χ}`; allowing Q-ramification does not define an unrestricted forgetting map of deformation functors.
- `CrystallineCM.TaylorWilesDeformationProblem_diamond`: The `O[Δ_Q]-action` is the universal inertia character on the selected residual Frobenius eigenline.
- `CrystallineCM.TaylorWilesDeformationProblem_augmentation`: Augmenting `Δ_Q` kills that inertia character and recovers the unramified chosen-eigenline quotient.

**Checks.**

- `CrystallineCM.TaylorWilesDeformationProblem_test_empty_q`: For `Q=∅, Δ_Q=1` and the problem reduces to `S_χ`.
- `CrystallineCM.TaylorWilesDeformationProblem_test_two_eigenvalues`: Equal residual Frobenius eigenvalues do not give the chosen-eigenline Taylor–Wiles datum.
- `CrystallineCM.TaylorWilesDeformationProblem_test_augmentation`: After `Δ_Q-augmentation` the selected inertia character is trivial, matching the finite-cover augmentation in Lemma 5.6.4.

(CN, §5.6, p.84.)

*Needs:* §9.5; **GlobalGaloisDeformations:R04.5** (taylor wiles datum); **GlobalGaloisDeformations:R04.5** (taylor wiles inertia action).

### 9.9 The same at Taylor–Wiles level

Prove `CrystallineCM.taylor_wiles_deformation_to_hecke_surjection`. There are `N` depending only on `[F : Q]`, `J ⊂ T_{χ,Q}` with `J^N = 0` and a continuous surjective `O[Δ_Q]-algebra` homomorphism `f_{𝒮_{χ,Q}} : R_{𝒮_{χ,Q}} → T_{χ,Q}/J` with char(f ∘ `ρ^{univ}(Frob_v)) = P_v(X`) for `v ∉ S ∪ Q`, where `T_{χ,Q}` is the image of `T^{S∪Q,…}_G ⊗ O[Δ_Q]` in `End_{D(O[Δ_Q])}(C•(K₀(Q)/K₁(Q), O(χ^{−1}))_{n_Q})`.

(CN, Proposition 5.6.3, p.84.)

*Needs:* §9.7; **GlobalGaloisDeformations:R04.5** (taylor wiles inertia action); **ArithmeticLocallySymmetricSpaces:ALS.6** (finite level descent); §9.8.

### 9.10 Automorphy lifting in the special case

Prove `CrystallineCM.pgl2_weight_zero_rational_comparison`. Let F be CM, `D=[F⁺:Q]`, K a factorizable PGL₂ level hyperspecial outside S, and `𝔪` a Galois-type non-Eisenstein ideal with absolutely irreducible residual representation. For trivial algebraic coefficients, localized rational cohomology vanishes outside `[D,2D]`; if one degree in this interval is nonzero then all are. Every characteristic-zero Hecke character is realized by a cuspidal weight-zero regular algebraic PGL₂ representation with K-fixed vectors. Prove the central-character descent and archimedean calculation from ALS.5b's automorphic comparison and §8.1's equivariant level model, giving `q₀=l₀=D`. This rational comparison is an input to patching, not a consequence of the lifting conclusion.

**Checks.**

- For D=1 the range is `[1,2]`, including its two endpoints.
- For D=2 the PGL₂ range is `[2,4]`; the GL₂ range `[2,5]` cannot replace it.
- A GL₂ representation with nontrivial central character does not descend to the PGL₂ eigensystem here.

(AKT, Theorem 5.10(2–3) and proof, pp.45–46.)

*Needs:* §8.1; §8.4; **ArithmeticLocallySymmetricSpaces:ALS.5b** (automorphic and cuspidal comparison).

Prove `CrystallineCM.prepared_barsotti_tate_lifting`. With the data and hypotheses (1)–(15), let `ρ : G_F → GL₂(Q̄_p)` be continuous with `(1) ρ̄ ≅ r̄_{π,ι}` and det `ρ = ε^{−1}_p; (2) ρ|_{G_{F_v}}` Barsotti–Tate for `v ∈ S^cr_p; (3) r_ι(π)|_{G_{F_v}}` ordinary iff `ρ|_{G_{F_v}}` ordinary, for `v ∈ S^cr_p; (4) ρ|_{G_{F_v}}` a non-crystalline extension of `ε^{−1}_p` by the trivial character for `v ∈ S^st_p; (5) ρ` unramified at `v ∉ S; (6) ρ|_{G_{F_v}}` unipotently ramified for `v ∈ R`. Then `ρ ≅ r_ι(Π)` for a cuspidal `Π` of `PGL₂(𝔸_F)` of weight `0`.

(CN, Proposition 5.6.1, p.82.)

*Needs:* §9.1; §9.7; §9.9; §9.6; §9.3; §8.3; §8.5; **LocalGaloisDeformationRings, §§4.14–4.15** (bt ring unique generalisation); **LocalGaloisDeformationRings, §6.6** (snowden ordinary ring trivial residual); `CrystallineCM.pgl2_weight_zero_rational_comparison`; **DeformationAndDerivedPatchingAlgebra, §§8.1–8.5**; §9.4.

### 9.11 Reduction of Theorem 5.2 to Proposition 5.6.1 by solvable base change

Prove `CrystallineCM.solvable_preparation_and_descent_qualified`. Under the hypotheses of the qualified potentially Barsotti–Tate lifting theorem in CL.9, including `d_cyc≠3` or projective image not `A₄`, Theorem 5.2 follows from Automorphy lifting in the special case (CL.9): choose a finite set `V` of auxiliary places as in the proof of [AKT23, Thm. A.14]; a solvable Galois CM extension `F₀/F` in which `V` splits, `π_{F₀}` has Iwahori-fixed vectors everywhere, bad places become unipotent with `q_w ≡ 1` mod `p` and trivial `ρ̄`, every p-adic place of `F₀⁺` splits with residue field bigger than `F_p` and the degree condition holds, potentially crystalline places become crystalline with `π` unramified (and `r_ι(π)` crystalline by the CM spherical export `allCMCrystallineIwahoriAdmissibility` recalled in §7.7, ordinary iff `ρ` is), and non-potentially-crystalline places become non-crystalline extensions of `ε^{−1}_p` by `1;` a further composite `F₁` with three imaginary quadratic fields; if `ζ_p ∉ F`, two auxiliary degree-one places `v₀, v₀′` from A reducibility criterion for mod-p representations (variant of DDT 4.11) (CL.9) and Chebotarev; then solvable descent [ACC+18, Prop. 6.5.13]. Choose the preparation linearly disjoint from the full residual-plus-cyclotomic field, so both the projective image and `d_cyc` are preserved and the corrected finite-image criterion applies.

(CN, End of the proof of Theorem 5.2, pp.85–87.)

*Needs:* §9.10; §7.7; §9.2; **PotentialModularityAndCompatibleSystems, §§2.12–2.16**; **PotentialAutomorphyInfrastructure, §2.3**; **PotentialAutomorphyInfrastructure, §2.1** (genericity normal closure restriction).

### 9.12 Potentially Barsotti–Tate automorphy lifting over imaginary CM fields

Prove `CrystallineCM.potentially_barsotti_tate_lifting_qualified`. Let `F` be an imaginary CM field, `p` an odd prime and `ρ : G_F → GL₂(Q̄_p)` continuous with: `(1) ρ` unramified almost everywhere and det `ρ = ε_p^{−1}; (2)` for each `v | p, ρ|_{G_{F_v}}` potentially semistable with all labelled Hodge–Tate weights (0,1); `(3) ρ̄` decomposed generic and `ρ̄|_{G_{F(ζ_p)}}` irreducible; `(4)` if `p = 5` and the projective image of `ρ̄(G_{F(ζ₅)})` is conjugate to `PSL₂(F₅)`, the extension of `F` cut out by the projective image of `ρ̄` does not contain `ζ₅; (5)` there are a cuspidal `π` of `PGL₂(𝔸_F)` and `ι : Q̄_p ≅ C` with `(a) π` regular algebraic of weight `0, (b)` for `v | p` with `ρ|_{G_{F_v}}` potentially crystalline: `r_ι(π)|_{G_{F_v}}` is potentially ordinary of weight `0` ([Ger19, §5.2]) iff `ρ|_{G_{F_v}}` is, and `rec_{F_v}(π_v)` has monodromy `0, (c)` for `v | p` with `ρ|_{G_{F_v}}` not potentially crystalline: `π` is `ι-ordinary` of weight `0` at `v` and `r_ι(π)|_{G_{F_v}}` is not potentially crystalline, `(d) ρ̄ ≅ r̄_ι(π)`. Assume in addition `d_cyc=[F(ζ_p):F]≠3` or the projective image of `ρ̄(G_F)` is not `A₄`. Then `ρ` is automorphic: `ρ ≅ r_ι(Π)` for a cuspidal `Π` of `PGL₂(𝔸_F)`, regular algebraic of weight `0`.

(CN, §5.1, Theorem 5.2, pp.73–74.)

*Needs:* §9.10; §9.11; §9.2; **PotentialAutomorphyInfrastructure, §2.3**.

### Examples

For the prepared local flags `(st,stᶜ)=(1,0)`, the partition is (2,1,1); (0,0) gives (2,2), and (1,1) gives (1,1,1,1). At an auxiliary place the level is pro-v Iwahori. At `p=3` or `p=5, [F(ζ_p):F]` divides p−1 and cannot equal three, so the extra cubic-tetrahedral restriction is automatic. The characteristic-seven quaternion matrices in the references provide the finite-group negative control; a cyclic diagonal subgroup generated by `diag(2,1)` also has a nontrivial projective image despite being abelian, which detects quotienting by the centre of the image rather than by ambient scalars.

### Dependencies

**ArithmeticGaloisRepresentations, Layer 4**; **ArithmeticLocallySymmetricSpaces:ALS.0**; **ArithmeticLocallySymmetricSpaces:ALS.3**; **ArithmeticLocallySymmetricSpaces:ALS.5**; **ArithmeticLocallySymmetricSpaces:ALS.6**; **AutomorphicGaloisRepresentationsPartII:AG2.5**; Layer 4; Layer 7; Layer 8; **DeformationAndDerivedPatchingAlgebra, §§8.1–8.5**; **ArithmeticGaloisRepresentations, §5.10**; **LocalGaloisDeformationRings, §F.2.7**; **GlobalGaloisDeformations:R04.3**; **GlobalGaloisDeformations:R04.5**; **LocalGaloisDeformationRings, §§3.13, 6.6**; **LocalGaloisDeformationRings, §3.14**; **LocalGaloisDeformationRings, §§4.14–4.15**; **PotentialAutomorphyInfrastructure, §2.3**; **PadicHodgeTheory, §§5.3–5.4**; **PotentialAutomorphyInfrastructure, §2.1**; **PotentialModularityAndCompatibleSystems, §§2.12–2.16**.

## Downstream consumers

The crystalline and semistable-ordinary statements feed the local deformation conditions in the Barsotti–Tate lifting theorem of Layer 9. The integral and torsion Hecke comparisons also provide the local conditions needed when automorphic classes are propagated between the two patched systems.

## References

**CN** means Ana Caraiani and James Newton, *On the modularity of elliptic curves over imaginary quadratic fields*, [arXiv:2301.10509v3](https://arxiv.org/pdf/2301.10509v3), `27` March `2025`. All CN theorem numbers and printed pages refer to this version. The owned arguments use §§2.1–2.3, 3.1, 4.1–4.3 and 5.4–5.6; §§3.2–3.3 and 5.3 identify imported determinant and deformation interfaces. The elliptic-curve and modular-curve applications in §§6–7 belong to the sibling roadmap.

**AKT** means Patrick `B`. Allen, Chandrashekhar Khare and Jack A. Thorne, *Modularity of `GL₂(F_p)-representations` over CM fields*, [arXiv:1910.12986v2](https://arxiv.org/pdf/1910.12986v2), `2` September `2022`; the PDF title page is dated `5` September `2022`. Its bibliographic journal reference is *Cambridge Journal of Mathematics* `11 (2023)`, 1–124, DOI [10.4310/CJM.2023.v11.n1.a1](https://doi.org/10.4310/CJM.2023.v11.n1.a1). The AKT numbering and PDF pages here refer to the preprint, including the `PGL₂` cohomology interfaces and Appendix A. No identification of every preprint statement with the version of record is asserted.

**ACC+18** denotes *Potential automorphy over CM fields*: [arXiv:1812.09999v2](https://arxiv.org/pdf/1812.09999v2), and the published author's copy in *Annals of Mathematics* `197 (2023)`, pp.897–1113. The two page conventions are stated where needed. The Siegel localization is Theorem 2.4.2 and the coefficient Satake descent is Theorem 2.4.4; the latter's proof contains the integral coefficient splitting. **NT16** is Newton–Thorne, *Torsion Galois representations over CM fields and Hecke algebras in the derived category*, [arXiv:1511.04913](https://arxiv.org/pdf/1511.04913), §2.2.7, Proposition 2.10 and Corollary 2.11, pp.13–14. **CG** is Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, [arXiv:1207.4224](https://arxiv.org/pdf/1207.4224), Lemma 6.2, p.65.

The P-stability supplier is stated directly in CN Lemma 4.2.3 and proof, p.60, which cites the main theorem of **Cab84**, Cabanes, *Irreducible modules and Levi supplements*, J. Algebra `90 (1984)`, pp.84–97. The potentially ordinary convention in the final theorem is the one used in CN Theorem 5.2(5b), p.74, referring to **Ger19**, Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Math. Ann. `373 (2019)`, pp.1341–1427, §5.2. The required P-stability statement and the final theorem’s ordinary hypothesis use these exact CN locators. CN's reference list is on pp.102–106.

The coefficient rescaling uses the inverse character evaluated at the acting element (CN (2.1.7), p.20). The unitary Hecke polynomial includes the term `X^{2n−j}` (CN (2.1.6), p.18). Compact unipotent cohomology is the coefficient-valued dual of the exterior power (CN Lemma 2.3.17, p.42), with contragredient conjugation action. In the degree-shifting proof the incoming differential is `d_r:E_r^{q−r,d−q+r−1}→E_r^{q,d−q}` (CN Proposition 4.2.6, p.64). These conventions are built into the targets.

The finite-image exception in CN Lemma 5.6.5, p.86, controls the scope of the final lifting theorem. Over `F₇`, take `i=((0,1),(−1,0)), j=((2,3),(3,−2))` and `h=(−1+i+j+ij)/2`. The generated binary tetrahedral group has quaternion subgroup `Q₈` and an order-three quotient generated by `h`. Twisting its inclusion by the character `χ(h)=2, χ(Q₈)=1` gives determinant of order three. Outside the determinant kernel the squared trace is `(1+det)²`, yet the kernel acts absolutely irreducibly. Thus the trace condition alone does not give reducibility in the cubic-tetrahedral case. CL.9 states the qualified criterion and preserves the full residual image and cyclotomic degree during preparation. It makes no assertion that the unrestricted lifting theorem is false.

For CN §4.1.1, p.53, the unipotent coefficient object has a general cohomological-dimension bound. Exact nonvanishing in every degree is specified here for zero selected weights. The degree-shifting argument uses that case, rather than an unproved general-weight nonvanishing assertion.
