# Roadmap: scheme and stack foundations, part II — flat cohomology

**Summary.** Starting from SchemeAndStackFoundations' ordinary schemes, sites, torsors and cohomology, and from the flat cohomology of animated algebras of PrismaticCohomologyPartIII §6.0 and PurityForFlatCohomology Layer 3 (its sites, flat animated modules, deformation triangle, p-adic continuity, principal and finite-ideal excision, supports, nilpotent invariance and fpqc hyperdescent), this Part II builds the complete and henselian theory of flat cohomology with commutative finite locally free coefficients over an ordinary base: henselianity of derived complete rings, H² invariance over henselian pairs, continuity over derived complete animated rings and its comparison with ordinary quotients, henselian invariance, algebraization over topological rings and on punctured spectra, discreteness of completely flat perfectoid modules and adically faithfully flat descent with supports (Česnavičius–Scholze, *Purity for flat cohomology*, §§5.6–5.7; Bouthier–Česnavičius, *Torsors on loop groups and the Hitchin fibration*, §2.1). Ind-fppf ring maps, perfect-base Dieudonné theory and complete arc descent enter from their earlier owners. The end theorems are complete continuity (§1.5), henselian invariance (§2.2), algebraization (§2.3) and adic descent with supports (§3.2).

## Scope and ownership

SchemeAndStackFoundations stops at the ordinary scheme, site, torsor, Brauer and formal-geometry interfaces of its §§0.12, 0.14–0.15, 0.21, 1.13–1.15, 1.18–1.22, 2.1–2.6, 2.10–2.11, 2.15, 2.22 and Layer 4; its §2.7 owns cohomology with supports of abelian sheaves on a topological space and its §2.9 the big-site sheaves 𝔾_a, 𝔾_m and μ_n. This Part II owns henselianity of derived complete rings, H² invariance over a henselian pair, continuity with a cohomological bound, faithfully flat descent after principal completion, complete continuity and its comparison with ordinary quotients, the failure of full continuity over henselian rings, flat cohomology of ordinary algebras on the pinned carriers, finitary functors under henselian completion, henselian invariance, algebraization over topological rings and on Laurent punctures, the punctured and Noetherian-neighbourhood comparisons, discreteness of completely flat perfectoid modules and adic descent with supports.

PerfectoidQuotientsPartII Layer Q7 owns ind-fppf and ind-syntomic ring maps (§Q7.1, §Q7.2) and their stability under composition, base change, finite products and filtered colimits (§Q7.3). Its ind-fppf maps are imported for the semiperfect covers of §3.2.

PrismaticCohomologyPartIII §6.0 owns the perfect-base classification, the Hom/Ext description, the perfect pro-fppf comparison, the V−1 sequence and the perfect-base cohomology triangle through `Prismatic.FlatCohomology.perfectDieudonneComparison`, as well as p-adic continuity `Prismatic.FlatCohomology.pContinuity` and principal excision `Prismatic.FlatCohomology.excision`. The inputs from which CS24 proves these three theorems belong with them: the pro-fppf topology and the perfection of its covers (CS24 §4.1.5 and Lemma 4.1.6), the animated points of an ordinary group with its identity cotangent complex and the deformation of points (CS24 §§5.1.11–5.1.14), flat animated modules and the étale, fppf and fpqc sites of animated rings (CS24 §§5.2.1–5.2.3), the animated henselization, cohomology along increasingly accurate towers (CS24 Corollary 5.2.7), split fppf refinements, derived Beauville–Laszlo glueing and the square-zero defect of completed π₀ (CS24 Lemmas 5.3.1, 5.3.3 and 5.3.4), and perfection across an unchanged derived divisor (CS24 Lemma 5.4.1), together with the Bégueri resolution, animated fppf cohomology and the cohomology deformation triangle. None of them is planned here; those used here are the supplier contracts below.

PurityForFlatCohomology owns fppf cohomology with supports on schemes (§0.2) and its continuity along cofiltered limits (§0.3); the vanishing of H^i_fppf(A,G) for i≥2 over a perfect 𝔽_p-algebra A and a commutative finite locally free A-group G of p-power order (§2.1); and, for animated algebras, cohomology with supports, the étale equivalence with π₀, fppf hyperdescent and Postnikov convergence (§3.2), invariance under classical truncation and across nil ideals (§3.3), the primary cohomological-dimension bound and invariance under derived mod-p equivalence (§3.4), the derived residue condition, finite-ideal excision and the comparison of a Noetherian local ring with its completion (§3.5), and fpqc hyperdescent with primary descent modulo p (§3.6). It also owns Gabber's comparison Br_Az(X)≃H²_et(X,𝔾_m)_tors for a scheme with an ample invertible sheaf, with its twisted-bundle route (§7.10). These are imported and not restated here.

The flat cohomology of ordinary algebras of §2.0 is the affine model of the fppf cohomology that PurityForFlatCohomology §0.2 takes on Mathlib's big fppf site of schemes: it is built on Tau Ceti's affine fppf site and finite locally free group carrier so that §§2.2–2.3 are statable at the pins, and §2.0 compares the two.

HeightsRationalPointsAndObstructions §2.6c owns Gabber's affine comparison `Brauer.affine_comparison`, used in Layer 1 for H² over a henselian pair.

The pinned libraries provide the ordinary algebraic predicates, the henselization of a pair with Noetherianity and faithful flatness of its completion, Tau Ceti's affine fppf site with its Hopf-algebra point sheaves, the category of finite locally free commutative affine group schemes over an affine base with Cartier duality, Tau Ceti's affine Weil restriction along finite projective algebras with its smoothness, base change and the points of the Weil-restricted multiplicative group, abelian sheaf `Ext` groups, the unitization of a nonunital ring and the separated completion of a topological ring. DerivedModuleAlgebra owns Koszul complexes (§0.K.1) and module completion (§§1.1–1.9); EnhancedDerivedSheaves supplies animated rings and modules, perfection, bounded totalizations and towers. ArcTopologyAndDescent owns complete arc-covers by products of valuation rings (§11.2), completed and punctured étale hyperdescent (§11.5) and integral perfectoid, tilt and A_inf hyperdescent (§12.7), imported through the contracts below. The perfectoid Dieudonné key formula, the purity theorems and their birational applications belong to PurityForFlatCohomology.

## Conventions

Rings are commutative and unital, including the zero ring. A finite ideal means a finitely generated ideal. Unless a statement changes the base, R is an **ordinary** ring and G is an **ordinary** affine commutative R-group. The coefficients of the theorems here are finite locally free G; the imported foundations also allow smooth affine G. These groups are evaluated on animated R-algebras A. No theorem introduces a theory of finite flat group schemes over an arbitrary animated base.

Cohomological indexing is used in D(ℤ): π_i corresponds to H^(−i). An animated module is connective, so it occupies cohomological degrees ≤0. A derived fixed-point expression for V is **fib(V−1)** in D(ℤ); the ordinary fixed subgroup is only its H⁰. Limits of cohomology complexes are derived limits, including hypercover totalizations. Cohomology with supports RΓ_Z(A,G) is the fibre of restriction to the complementary open, as constructed in PurityForFlatCohomology §3.2, and for ordinary schemes in PurityForFlatCohomology §0.2; RΓ_I(A,G) denotes support in V(I). For animated A, its topological spectrum means Spec π₀A, while all algebraic tensor products over A retain higher homotopy.

Finite tuples of π₀-elements are represented by actual elements when forming derived Koszul quotients; every comparison is invariant under the resulting equivalences, and there is no canonical map π₀A→A. Derived completion, animated rings, cotangent complexes and their module categories come from the owners listed below. On an ordinary ring, A/^La is the cone of multiplication by a on the underlying module; it need not equal A/(a).

A henselian pair means Mathlib's `HenselianRing` convention: I⊂Jac(R) and simple roots of monic polynomials lift. Locality, Noetherianity and completeness are separate hypotheses. A nonunital subring B′ of a ring B is **henselian** when it satisfies Gabber's criterion inside B: every x∈B′ has a quasi-inverse y∈B′, (1+x)(1+y)=1, and for every N≥1 and a₀,…,a_N∈B′ the polynomial T^N(T−1)+a_NT^N+…+a₀ has a root in 1+B′. Equivalently B′ is a henselian ideal of its Dorroh unitalization ℤ⊕B′ (Mathlib's `Unitization ℤ B′`), with multiplication (m,x)(n,y)=(mn,my+nx+xy) (BC22 §2.1.1, p.5; SP Tag 09XI, Lemma 15.11.6). §2.0 records this as `IsHenselianNonunitalSubring`.

The three Brauer objects keep distinct names: Br_Az(X), the Morita classes of Azumaya algebras of SchemeAndStackFoundations §2.22; Br′(X)=H²_et(X,𝔾_m)_tors; and the whole group H²_et(X,𝔾_m) (C19 §1.5, p.3). The class map is compared with Br′ only on affine schemes (HeightsRationalPointsAndObstructions §2.6c) or, for a scheme with an ample invertible sheaf, by PurityForFlatCohomology §7.10 (Gabber's theorem; DJ Theorem 1.1, p.1). Kummer exactness with μ_n uses the fppf topology for every n≥1, including n divisible by a residue characteristic.

In the covariant crystalline convention, M(ℤ/p^n) has F=pσ and V=σ⁻¹, whereas M(μ_(p^n)) has F=σ and V=pσ⁻¹ (CS24 §4.1.2, p.36; PrismaticCohomologyPartIII §6.0). The normalization and indexing are fixed by the computed witnesses below.

**Checks.**

- On 𝔽_p with G=ℤ/p, V−1=0 on 𝔽_p, so the fibre has H⁰=H¹=𝔽_p. For μ_p, V−1=−1 and both groups are 0. Taking an ordinary kernel would miss the first H¹; interchanging the covariant and contravariant conventions would interchange the two computations.
- For A=k⊕k[1] and G_a, H^(−1)(A,G_a)=k and H⁰=k. Thus homotopy degree 1 corresponds to cohomological degree −1.
- For A=ℤ/p², multiplication by p has kernel and cokernel 𝔽_p, so A/^Lp has π₁=π₀=𝔽_p. The ordinary quotient has π₁=0.
- With I=(1), supported cohomology is fib(id)=0; with I=(0), it is fib(RΓ(A,G)→0)=RΓ(A,G). These directions are kept in every support comparison.
- The pair (ℤ,2ℤ) is not henselian, since Jac(ℤ)=0; (ℤ₂,2ℤ₂) is henselian. In the Dorroh multiplication, (1,0)(n,y)=(n,y), while (0,x)(0,y)=(0,xy).

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib of the content repository's manifest; file and line numbers are those of that pin.

| Supplier declaration | Pinned file and line | Input consumed |
| --- | --- | --- |
| `HenselianRing` | Mathlib/RingTheory/Henselian.lean:81 | Henselian pairs by Jacobson containment and simple-root lifting; neither locality nor completeness is included. |
| `AdicCompletion.flat_of_isNoetherian` | Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:378 | Flatness of the adic completion of a Noetherian ring, used in §2.1. |
| `CategoryTheory.HasExt` | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:55 | The smallness condition under which `Ext` groups of an abelian category exist in a chosen universe; taken as an instance argument in §2.0. |
| `HasDerivedCategory.standard` | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:81 | A derived category of any abelian category in the universe of its objects and morphisms; with `CategoryTheory.hasExt_of_hasDerivedCategory` (Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:88) it gives a `CategoryTheory.HasExt` instance for the sheaf category of §2.0. |
| `CategoryTheory.Abelian.extFunctor` | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:437 | The bifunctor of `n`-th `Ext` groups; evaluated on fppf sheaves in §2.0. |
| `CategoryTheory.presheafToSheaf` | Mathlib/CategoryTheory/Sites/Sheafification.lean:74 | Sheafification; for `AddCommGrpCat.{u+1}`-valued presheaves on the affine fppf site of a ring in universe `u` it exists at the pin, for `AddCommGrpCat.{u}` it does not. |
| `AddCommGrpCat.free` | Mathlib/Algebra/Category/Grp/Adjunctions.lean:54 | Free abelian groups, applied to representable presheaves. |
| `AddCommGrpCat.uliftFunctor` | Mathlib/Algebra/Category/Grp/Basic.lean:491 | Universe lift of abelian groups (additive form of `CommGrpCat.uliftFunctor`); fully faithful and exact. |
| `CategoryTheory.Sheaf.cohomologyPresheafFunctor` | Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:70 | The `Ext` model of §2.0: the bifunctor sending an abelian sheaf and an object to the `n`-th `Ext` group from the sheafified free abelian sheaf on the representable presheaf into the sheaf, for sheaves valued in abelian groups of the site's morphism universe; §2.0 uses the same formula one universe up. It is only a definition: the comparison with the slice site is the Tau Ceti row `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` below. |
| `UniformSpace.Completion` | Mathlib/Topology/UniformSpace/Completion.lean:291 | Separated completion; with `UniformSpace.Completion.algebra` (Mathlib/Topology/Algebra/UniformRing.lean:198) it is an algebra over a uniform topological ring. |
| `Unitization` | Mathlib/Algebra/Algebra/Unitization.lean:65 | The unitization `R ⊕ A` of a nonunital `R`-algebra, a commutative ring by `Unitization.instCommRing` (line 559) for commutative `A`; with `R = ℤ` it is the Dorroh unitalization of the Conventions. |
| `Unitization.fstHom` | Mathlib/Algebra/Algebra/Unitization.lean:662 | The augmentation `Unitization R A → R`, whose kernel is the image of `A`; used in §2.0 to compare henselian nonunital subrings with henselian pairs. |

### From Tau Ceti

At the pinned Tau Ceti of the content repository's manifest; file and line numbers are those of that pin.

| Supplier declaration | Pinned file and line | Input consumed |
| --- | --- | --- |
| `TauCeti.CommAlgCat.fppfTopology` | TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:61 | The fppf topology on `(CommAlgCat R)ᵒᵖ` induced from schemes over Spec R. |
| `TauCeti.CommAlgCat.isCoverDense_algSpec` | TauCeti/Algebra/Category/CommAlgCat/Fppf.lean:99 | Relative spectra of R-algebras are cover-dense among schemes over Spec R for the fppf topology (an instance), so affine fppf sheaves and their cohomology agree with those on the big fppf site of schemes; used in §2.0. |
| `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf` | TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:57 | The points presheaf of a commutative Hopf algebra is an fppf sheaf. |
| `TauCeti.HopfAlgebra.pointsFppfSheaf` | TauCeti/Algebra/AlgebraicGroup/Fppf/Basic.lean:72 | The group-valued (`GrpCat`) fppf sheaf of points, before an abelian coefficient adapter. |
| `AlgHom.mapValue` | TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:143 | Functoriality of convolution points in the value algebra; `AlgHom.convCommGroupOfSemiring` (line 232) makes the points of a cocommutative Hopf algebra a commutative group. Both live in the root namespace `AlgHom`, not under `TauCeti`. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:122 | Finite locally free commutative affine group schemes over an affine base: finite, flat, locally of finite presentation and commutative. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:298 | The coordinate Hopf algebra, finite projective and cocommutative. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:321 | Finite locally free Cartier duality over an affine base. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeNatIso` | TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/BaseChange.lean:172 | Cartier dualization commutes with arbitrary base change; used by the Bégueri resolution contract. |
| `TauCeti.Henselization.isNoetherianRing` | TauCeti/RingTheory/Henselization/Noetherian.lean:72 | For Noetherian R and any ideal I, the henselization `TauCeti.Henselization.algebra I` is Noetherian (an instance); used in §2.2. |
| `TauCeti.Henselization.faithfullyFlat_adicCompletion` | TauCeti/RingTheory/Henselization/Noetherian.lean:62 | For Noetherian R, the completion of the henselization along the extended ideal is faithfully flat over the henselization (an instance); used in §2.2. |
| `TauCeti.Henselization.completionEquiv` | TauCeti/RingTheory/Henselization/Quotient.lean:155 | The R-algebra isomorphism from the I-adic completion of R to the completion of its henselization along the extended ideal, with no Noetherian hypothesis; used in §2.2. |
| `TauCeti.Algebra.WeilRestriction` | TauCeti/RingTheory/WeilRestriction/Basic.lean:228 | For a finitely generated projective A-algebra B and a finitely presented B-algebra C, the A-algebra representing T↦Hom_B(C,B⊗_A T), with its universal point; it is the coordinate ring of the affine Weil restriction Res_(B/A)Spec C. Used in §1.2 and by the Bégueri resolution contract. |
| `TauCeti.Algebra.WeilRestriction.baseChangeAlgEquiv` | TauCeti/RingTheory/WeilRestriction/Basic.lean:431 | Formation of the Weil restriction commutes with arbitrary base change A→A′, compatibly with the universal points (`TauCeti.Algebra.WeilRestriction.homEquiv_comp_baseChangeAlgEquiv`); used by the Bégueri resolution contract. |
| `TauCeti.Algebra.WeilRestriction.instSmooth` | TauCeti/RingTheory/WeilRestriction/Smooth.lean:60 | For a finitely generated projective A-algebra B and a smooth B-algebra C, the Weil restriction `TauCeti.Algebra.WeilRestriction A B C` is smooth over A (an instance); with `LaurentPolynomial.instSmooth` it makes Res_(B/A)𝔾_m smooth over A. Used in §1.2 and by the Bégueri resolution contract. |
| `LaurentPolynomial.instSmooth` | TauCeti/Algebra/Polynomial/Laurent/Smooth.lean:35 | The coordinate algebra R[T,T⁻¹] of 𝔾_m is smooth over every commutative ring R (an instance in the root namespace `LaurentPolynomial`). |
| `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints` | TauCeti/Algebra/AlgebraicGroup/MultiplicativeGroup/WeilRestriction/Basic.lean:65 | For B finitely generated and projective over A, the points of Res_(B/A)𝔾_m over an A-algebra T form a group isomorphic to (B⊗_A T)^×, naturally in T (`TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints_naturality`, line 89); the Weil-restricted 𝔾_m term of §1.2. |
| `TauCeti.CategoryTheory.cohomologyZeroSectionsEquiv` | TauCeti/CategoryTheory/Sites/SheafCohomology/FreeYoneda.lean:195 | Degree-zero cohomology over an object is the group of sections there, for sheaves valued in abelian groups of the site's morphism universe; §2.0 runs the same argument for its coefficient sheaf, valued one universe up. |
| `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` | TauCeti/CategoryTheory/Sites/SheafCohomology/Over.lean:141 | Hⁿ(U,F) is the n-th cohomology of the restriction of F to the slice site over U, when restriction to the slice and its left adjoint are exact; stated for sheaves valued in abelian groups of the site's morphism universe. §2.0 runs the same argument for its coefficient sheaf, valued one universe up, to identify the value of `flatCohomology G n` at A with fppf cohomology of the big affine site of A. |

`HenselianRing` includes Jacobson containment and simple-root lifting, not locality or completeness. Tau Ceti's points sheaf is group-valued; §2.0 builds the abelian coefficient sheaf from the commutative group structure of points of a cocommutative Hopf algebra. The two henselization instances carry the hypothesis `IsNoetherianRing R`; `completionEquiv` does not. Smoothness of the Weil restriction Res_(B/A)𝔾_m along a finite locally free A-algebra B is `TauCeti.Algebra.WeilRestriction.instSmooth` applied to `LaurentPolynomial.instSmooth`, at an affine base; over a general base it follows Zariski-locally. It is not part of any supplier gap below.

### From TauCetiRoadmap.SchemeAndStackFoundations

§0.12 supplies the henselization of a pair by étale neighbourhoods, on Tau Ceti's `TauCeti.Henselization.algebra`; §0.14 supplies `henselian_pair_characterisations`, `henselian_pair_permanence` and `henselian_smooth_lifting`; §0.15 supplies `popescu_colimit_of_geometricallyRegular` and §0.21 regular maps and G-rings. §§1.13–1.15 supply group algebraic spaces and torsors, §§1.18–1.22 algebraic stacks and quasi-coherent sheaves on them. §§2.1–2.6 supply derived site cohomology, Leray, torsors, slice sites, filtered sheaf colimits and quasi-coherent cohomology; §2.10 the comparison morphisms between topologies, including `smoothGroup_fppf_etale_comparison`; §2.11 `fppf_kummer_sequence` for every n≥1 and `finite_pushforward_exact`; §2.15 `gabber_affine_proper_base_change`. §2.22 supplies `SchemeBrauerGroup` and `CohomologicalBrauer`. Layer 4 supplies formal schemes, adic completion and algebraization interfaces.

What SchemeAndStackFoundations must provide (gap:finite-group-ext): For every commutative finite locally free group X over any scheme, the fppf sheafification of T↦Ext¹_(T_fppf)(X_T,𝔾_m), with Ext classifying commutative group extensions, vanishes. Section: Layer 2 §2.4. (BG80 Proposition 2.2.1, pp.25–27; R70 Lemma 6.2.2, p.51).

What SchemeAndStackFoundations must provide (gap:henselian-stack-lifting): For any henselian pair (A,I) and smooth algebraic A-stack X with quasi-affine diagonal, X(A)→X(A/I) is essentially surjective. Section: Layer 1 §§1.18–1.22. (BC22 Proposition 2.1.4, pp.7–8).

What SchemeAndStackFoundations must provide (gap:henselian-torsor-cohomology): For any henselian pair (A,I), H¹(A,Q)→H¹(A/I,Q) is bijective for smooth affine Q; for flat finitely presented quasi-affine G it is surjective, and for commutative such G the map on H² is injective. Section: Layer 1 §1.15. (BC22 Theorem 2.1.6, pp.7–8). *Needs:* gap:henselian-stack-lifting.

What SchemeAndStackFoundations must provide (gap:cauchy-algebraization): For a topological ring B with an open nonunital henselian subring B′ and a zero-neighbourhood basis of B′-ideals, every set-valued functor F on B-algebras commuting with filtered colimits and invariant under henselian pairs satisfies F(B)≃F(B̂), via the Cauchy-net quotient description of the separated completion, with no first-countability or Noetherian hypothesis. Section: Layer 4. (BC22 §§2.1.12–2.1.15, pp.11–13).

What SchemeAndStackFoundations must provide (gap:punctured-h2-injectivity): For Noetherian R→R′ and a finite ideal I such that both associated pairs are henselian and R/I^n≃R′/I^nR′ for every n>0, every open U containing Spec R minus V(I) and commutative finite locally free R-group G satisfy injectivity of H²(U,G)→H²(U×_R R′,G), without assuming flatness of R→R′. Section: Layer 4. (BC22 Corollary 2.3.5(c), pp.30–31; CS24 Corollary 5.6.13, p.77).

What SchemeAndStackFoundations must provide (gap:complete-torsor-effectivity): For every ordinary ring C that is classically complete and separated for the a-adic topology of an element a∈C, and every finite locally free C-group G, G-torsors and their isomorphisms are equivalent to compatible systems of G-torsors over the C/a^n with transition isomorphisms, without a Noetherian hypothesis; consequently, for commutative G, the sequence 0→lim¹_n G(C/a^n)→H¹(C,G)→lim_n H¹(C/a^n,G)→0 is exact, its first map sending a sequence of transition isomorphisms between trivial torsors, taken modulo change of trivializations, to the torsor it defines. Section: Layer 4. (CS24 Lemma 5.6.4 and its proof, pp.72–73).

What SchemeAndStackFoundations must provide (gap:classical-affine-group-adapter): For ordinary rings, connect the native affine Hopf-algebra group-point functors and finite locally free Cartier duality with the smooth affine commutative group-scheme category. Section: Layer 1 §1.15. (BG80 §§2.1–2.2, pp.22–27; CS24 §1.4, p.8 and §5.1.11, p.52).

What SchemeAndStackFoundations must provide (gap:flat-group-cotangent-amplitude): For every flat affine commutative group G of finite presentation over an ordinary ring R, its linearized cotangent complex C_G=e*L_(G/R) along the identity section e is perfect of amplitude [−1,0], and of amplitude [0,0] when G is smooth. Section: Layer 1 §1.15. (CS24 §5.1.11 and Proposition 5.1.12, p.52).

What SchemeAndStackFoundations must provide (gap:henselized-formal-fibres): For the henselization A of a finite-type ℤ-algebra along a finite ideal I, the map A→lim_n A/I^n is regular, that is, has geometrically regular fibres. Noetherianity of A and faithful flatness of A→Â are Tau Ceti's `TauCeti.Henselization.isNoetherianRing` and `TauCeti.Henselization.faithfullyFlat_adicCompletion`, and `TauCeti.Henselization.completionEquiv` identifies Â with the I-adic completion of the finite-type algebra. Section: §0.21. (CS24 proof of Corollary 5.6.9, p.76; SP Tags 0AH2, 0AH3).

### From TauCetiRoadmap.PerfectoidQuotientsPartII

Layer Q7: §Q7.1 ind-fppf ring maps (filtered colimits of faithfully flat finitely presented algebras, with the factorization criterion and the characterization as faithfully flat filtered colimits of flat finitely presented algebras).

### From TauCetiRoadmap.PrismaticCohomologyPartIII

§6.0: `Prismatic.FlatCohomology.perfectDieudonneComparison` gives covariant crystalline classification over perfect bases, finite projective dimension, F and V with FV=VF=p, perfect base change, and the V−1 fibre on the étale site. `Prismatic.FlatCohomology.pContinuity` applies to p-primary finite locally free coefficients on animated algebras with p-henselian π₀, without completeness. `Prismatic.FlatCohomology.excision` compares supports under a derived principal residue equivalence. The proofs of these three theorems in CS24 use §4.1.5 and Lemma 4.1.6, §§5.1.11–5.2.3, the animated henselization, Corollary 5.2.7 and Lemmas 5.3.1, 5.3.3, 5.3.4 and 5.4.1; these inputs belong to those supplier theorems, and the ones used here are stated in the contracts below.

What PrismaticCohomologyPartIII must provide (gap:begueri-resolution): For every commutative finite locally free G/S, supply a functorial, arbitrary-base-change-compatible fppf-exact sequence 0→G→H→Q→0 with H=Res_(G*/S)𝔾_m, Q the affine symmetric multiplicative two-cocycle group on G*, coboundary H→Q faithfully flat and finitely presented, and H,Q smooth affine commutative S-groups. Section: §6.0. (BG80 Proposition 2.2.1 and proof, pp.25–27). *Needs:* gap:finite-group-ext; gap:classical-affine-group-adapter; `TauCeti.Algebra.WeilRestriction`; `TauCeti.Algebra.WeilRestriction.baseChangeAlgEquiv`; `TauCeti.Algebra.WeilRestriction.instSmooth`.

What PrismaticCohomologyPartIII must provide (gap:animated-flat-cohomology): For an ordinary ring R and an affine commutative R-group G=Spec B that is smooth or finite locally free, supply the fpqc, fppf and étale topologies on animated rings, whose covers are the faithfully flat maps, those of them finitely presented on π₀ and those of them étale on π₀, with their sheaf topoi over an animated R-algebra A formed on the animated A-algebras flat, fppf or étale over A (fpqc below a fixed cardinal bound); the animated point functor A↦G(A)=Map_(AnimAlg_R)(B,A) with the ℤ-module structure induced by the group law; the D(ℤ)-valued fppf and étale sheafifications RΓ(A,G) of that functor with τ≤0RΓ(A,G)≃G(A); and, on ordinary algebras, the comparison with `TauCeti.HopfAlgebra.pointsFppfSheaf` and with classical fppf and étale cohomology. Section: §6.0. (CS24 §5.1.11, p.52; §5.2.3, p.54; §5.2.5 and (5.2.5.1), p.55). *Needs:* gap:flat-animated-modules.

What PrismaticCohomologyPartIII must provide (gap:cohomology-deformation): For an ordinary ring R, an affine commutative R-group G smooth or finite locally free, and a square-zero extension A′→A of animated R-algebras by a connective ideal M, supply the functorial untruncated fibre sequence RΓ(A′,G)→RΓ(A,G)→RHom_R(e*L_(G/R),M[1]) in D(ℤ), where e is the identity section. Section: §6.0. (CS24 Theorem 5.2.8, p.57).

What PrismaticCohomologyPartIII must provide (gap:flat-animated-modules): For an animated ring A, call a connective animated A-module M flat when π₀M is flat over π₀A and every map π_iA⊗_(π₀A)π₀M→π_iM is an isomorphism, faithfully flat when moreover π₀M is faithfully flat over π₀A, and a map of animated rings (faithfully) flat when its target is so as a module; supply π_*(N⊗^L_A M)≃π_*N⊗_(π₀A)π₀M for flat M and connective N, stability of flatness and of faithful flatness under derived base change and composition, and, for a map A→A′ inducing a surjection π₀A→π₀A′ with nilpotent kernel, that M is flat, respectively faithfully flat, respectively zero, exactly when A′⊗^L_A M is. Section: §6.0. (CS24 §5.2.1 and Lemma 5.2.2, pp.53–54).

What PrismaticCohomologyPartIII must provide (gap:animated-henselization): For an animated ring A and an ideal I⊂π₀A, supply the animated A-algebra A^h_I, the filtered colimit of the étale lifts to A of the étale neighbourhoods defining the henselization (π₀A)^h_I of SchemeAndStackFoundations §0.12, with π₀(A^h_I)≃(π₀A)^h_I and π_i(A^h_I)≃π_iA⊗_(π₀A)(π₀A)^h_I, through which every map from A to an animated ring B with π₀B henselian along the image of I factors uniquely up to contractible choice. Section: §6.0. (CS24 Claim 5.3.5.3, p.59, and proof of Lemma 5.6.5, p.74, with Proposition 5.2.4, p.54). *Needs:* gap:flat-animated-modules.

What PrismaticCohomologyPartIII must provide (gap:tower-accuracy): For an ordinary ring R, an affine commutative R-group G that is smooth or finite locally free, an animated R-algebra A and a tower ⋯→A_(n+1)→A_n→⋯→A_0 of animated A-algebras whose structure maps induce τ≤nA≃τ≤nA_n for every n, RΓ(A,G)≃Rlim_n RΓ(A_n,G). Section: §6.0. (CS24 Corollary 5.2.7, p.56). *Needs:* gap:animated-flat-cohomology.

What PrismaticCohomologyPartIII must provide (gap:split-etale-refinements): For every ring R, supply an R-algebra R̃ that is a filtered colimit of faithfully flat étale R-algebras such that, for every ideal J⊂R̃ (including J=0), every faithfully flat étale (R̃/J)-algebra admits an (R̃/J)-algebra section. Section: §6.0. (CS24 Lemma 5.3.1 and Remark 5.3.2, p.58; SP Tag 04D1, Lemma 10.143.10).

What PrismaticCohomologyPartIII must provide (gap:completed-pi0-defect): For an animated ring A and a∈π₀A, the map π₀(Rlim_n A/^La^n)→lim_n π₀A/a^n is surjective and its kernel, lim¹_n π₁(A/^La^n), is an ideal of square zero. Section: §6.0. (CS24 Lemma 5.3.4, pp.58–59).

### From TauCetiRoadmap.PurityForFlatCohomology

§0.2: for a scheme X, a closed Z⊂X and an abelian sheaf F on the big fppf site (in particular a commutative group scheme), RΓ_Z(X,F) is the fibre of restriction to X∖Z, with its long exact sequence, excision for an open containing Z and for an étale X′→X with Z×_X X′→Z an isomorphism of reduced closed subschemes, and agreement with étale supports for smooth F. §0.3: for a cofiltered limit X=lim X_λ of quasi-compact quasi-separated schemes with affine transition maps and a finitely presented commutative group scheme G over X_0, colim_λ H^i_fppf(X_λ,G)≃H^i_fppf(X,G), and the same for supports in a closed Z_0⊂X_0 with quasi-compact complement; affine commutative R-groups that are smooth or finite locally free are finitely presented, so this covers filtered colimits of R-algebras and supports V(I) with I finite. §3.2: for an animated R-algebra A and closed Z⊂Spec π₀A with complement U, RΓ(U_A,G) is the derived limit of RΓ_fppf(A′,G) over fppf A-algebras A′ with Spec π₀A′→Spec π₀A factoring through U, and RΓ_Z(A,G) the fibre of RΓ(A,G)→RΓ(U_A,G), functorial in A, G and Z with its support triangle; base change to π₀ is an equivalence on étale and on finite étale algebras; for G smooth or finite locally free, A↦RΓ_fppf(A,G) satisfies fppf hyperdescent and RΓ(A,G)≃Rlim_n RΓ(τ≤nA,G), and RΓ_et(A,G)≃RΓ_fppf(A,G) for smooth G (CS24 Proposition 5.2.4, Theorem 5.2.6). §3.3: H^i(A,G)→H^i(π₀A,G) is surjective for all i and bijective for i≥0 when G is smooth, for i≥1 when G is finite locally free; for an ideal I⊂R of nilpotent elements, H^i(R,G)→H^i(R/I,G) is surjective for i≥0 (smooth G), resp. i≥1 (finite locally free G), and bijective for i≥1, resp. i≥2 (CS24 Corollaries 5.2.9, 5.2.10). §3.4: for finite locally free G of p-power order and π₀A p-henselian, H^i(A,G)=0 for i≥3, and for i≥2 when (π₀A/p)_red is perfect; for A→A′ of such algebras with A/^Lp≃A′/^Lp and an open U with Spec π₀A[1/p]⊂U⊂Spec π₀A and complement Z, RΓ(U_A,G)≃RΓ(U_(A′),G) and RΓ_Z(A,G)≃RΓ_Z(A′,G) (CS24 Corollaries 5.3.7, 5.3.8). §3.5: for A→A′ and a finite ideal I=(a₁,…,a_r)⊂π₀A, the derived residue condition π₀A/I≃(π₀A/I)⊗^L_A A′ is equivalent to A/^L(a₁^n,…,a_r^n)≃A′/^L(a₁^n,…,a_r^n) for every n>0 and to equivalence after iterated derived a_i-completion; under it RΓ_I(A,G)≃RΓ_I(A′,G) for commutative finite locally free G; and H^i_𝔪(R,G)≃H^i_𝔪(R̂,G) for a Noetherian local ring (R,𝔪) (CS24 Lemma 5.4.3, Theorem 5.4.4, Corollary 5.4.5). §3.6: for commutative finite locally free G, A↦RΓ_fppf(A,G) satisfies fpqc hyperdescent on animated R-algebras; for G of p-power order and closed Z⊂Spec R/pR, A↦RΓ(A^h_(p),G) and A↦RΓ_Z(A,G) satisfy hyperdescent along cosimplicial A-algebras A^• with A/^Lp→A^•/^Lp an fpqc hypercover (CS24 Theorem 5.5.2, Corollary 5.5.3). Assumed as stated there.

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

§2.6c `Brauer.affine_comparison`: for every commutative ring, the Azumaya class map identifies the Brauer group of Azumaya algebras with the torsion of H²_et(Spec R,𝔾_m).

### From TauCetiRoadmap.EnhancedDerivedSheaves

E2:towers.1 supplies the Milnor comparison keeping lim¹; E5:animation.1–.4 supply animation (`animatedAlgebras`), colimit perfection of characteristic-p animated rings, bounded totalizations and animated modules (`animatedModules`). E5:animation.3's `tot_filteredColimit_of_bounded` is used only with a uniform lower cohomological bound.

### From TauCetiRoadmap.DerivedModuleAlgebra

§0.K.1 supplies finite Koszul complexes and §§1.1–1.8 limits, completion, Nakayama, Koszul completion towers and complete flatness. §1.9 supplies p-adic Čech module descent for ordinary p-complete rings with bounded p-power torsion; the finite-tuple animated hypercover extension is a contract below.

What DerivedModuleAlgebra must provide (gap:adic-flat-module-limits): For a finite weakly proregular ideal J⊂C and flat C/J^n-modules M_n with M_(n+1)⊗_(C/J^(n+1))C/J^n≃M_n, their limit M′ is classically J-complete, M′/J^nM′≃M_n and Tor_i^C(N,M′)=0 for i>0 and J-power-torsion N, and completion preserves this adic flatness. Section: §1.7. (Y18 Theorems 1.8, 4.3 and 5.9, pp.5–6, 14, 16–17; published numbering cited by CS24: 2.8, 4.3, 6.9).

What DerivedModuleAlgebra must provide (gap:complete-module-hyperdescent): For a finite tuple in π₀A and a hypercover of animated A-algebras faithfully flat after derived Koszul reduction, connective derived I-complete modules satisfy descent under completed tensor product; include valuation-product perfectoid arc hypercovers when their structural rings and flat Koszul reductions descend. Section: §1.9. (CS24 proof of Lemma 5.7.1 and square-zero step of Theorem 5.7.2, pp.78, 80).

What DerivedModuleAlgebra must provide (gap:koszul-geometric-support): For any ordinary ring T, finite tuple b and N∈D(T), geometric cohomology supported on V(b) is C_b⊗^L_T N≃colim_n RHom_T(K_T(b₁^n,…,b_s^n),N), where C_b=⊗_i[T→T[1/b_i]]; this identification commutes with derived base change and perfect-complex tensor coefficients, without weak proregularity. Section: §0.K.1 and §§1.2–1.4. (SP Tag 0A6R, Lemma 47.9.1; CS24 proof of Theorem 5.7.2, p.81).

### From TauCetiRoadmap.DerivedDeRhamCohomology

§1.22 `DerivedDeRham.completionExchanges` gives the perfect-tensor and bounded-totalization exchanges of completion.

### From TauCetiRoadmap.PerfectoidQuotients

Layer 0 §§0.1, 0.4, 0.6: integral perfectoid rings, reducedness and compatible-root annihilators (§§0.1, 0.4), and `perfectoid_sharp_ideal_completion` (§0.6): for an integral perfectoid ring and finitely many elements of its tilt, the completion along their untilts is integral perfectoid and agrees with the derived completion; for a perfect 𝔽_p-algebra and finitely many of its elements, the completion is again a perfect 𝔽_p-algebra.

### From TauCetiRoadmap.ArcTopologyAndDescent

§11.2: for an ordinary ring A and a finite ideal I, every A-algebra admits an I-complete arc-cover by a product of I-complete absolutely integrally closed valuation domains of rank at most one, and every quasi-compact open of the spectrum of such a product has no nonsplit étale covers; its global sections functor is therefore exact on étale sheaves, so these opens are étale-acyclic. §11.5: for torsion F on Spec A and finite I, each of R↦RΓ(Spec R̂_I,F), R↦RΓ(Spec R^h_I,F), R↦RΓ(Spec R̂_I minus V(I),F) and R↦RΓ(Spec R^h_I minus V(I),F) is a hypercomplete I-complete arc-sheaf. §12.7: for a p-complete arc-hypercover A→B• whose augmentation and all terms are integral perfectoid ℤ_p-algebras, A→Rlim B•, A♭→Rlim (B•)♭ and A_inf(A)→Rlim A_inf(B•) are equivalences. Assumed as stated there.

## How to read the build

Layer 1 proves the complete theory on top of the imported foundations: henselianity of derived complete rings, the independent henselian H² lemma, continuity with a cohomological bound, principal complete descent, full finite-ideal continuity and its comparison with ordinary quotients, in that order, and the failure of full continuity over henselian rings. It uses the deformation triangle, tower accuracy, flat animated modules, the animated henselization, split étale refinements and completed π₀ of PrismaticCohomologyPartIII §6.0, and the truncation, primary comparison and fpqc hyperdescent statements of PurityForFlatCohomology §§3.2–3.4 and 3.6. Layer 2 fixes flat cohomology of ordinary algebras on the pinned carriers, then proves henselian invariance and algebraization through the finitary completion comparison, and the comparisons on punctured spectra. Layer 3 proves discreteness of completely flat perfectoid modules and ends with adic descent with supports, using the finite-ideal excision of PurityForFlatCohomology §3.5. Each *Needs:* line lists both the inputs of the statement and those of the displayed proof route.

## Layer 1: Complete continuity

### 1.1 Derived completeness implies henselianity

Prove the following statement. For an animated ring A and an ideal I⊂π₀A, if A is derived a-complete for every a∈I, then (π₀A,I) is henselian. In particular finite-ideal derived completeness has this consequence; π₀A need not be classically I-complete. (CS24, Lemma 5.6.2, p.71).

**Checks.**

- For A=ℤ_p and I=(p), the pair is henselian with π₀A=ℤ_p.
- For A=𝔽_p⊕𝔽_p[1] and I=0, derived completeness is automatic and the pair is henselian despite higher homotopy.
- For ℤ and I=(p), p-completion is ℤ_p≠ℤ, and p is not in Jac(ℤ)=0; the hypothesis fails.

**Proof route.** Derived completeness is detected on homotopy groups and is preserved by truncation. Replace A by π₀A. For principal a, the completed-π₀ statement of gap:completed-pi0-defect then compares this ring to its ordinary a-completion with square-zero kernel. A classically complete ring is henselian, and henselianity lifts across a nil ideal. Apply the elementwise characterization of henselian pairs to all a∈I.

*Needs:* gap:completed-pi0-defect; DerivedModuleAlgebra §1.6; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; `HenselianRing`.

### 1.2 H² invariance over a henselian pair

Prove the following statement. For any henselian pair (R,I) and commutative finite locally free R-group G, H²_fppf(R,G)→H²_fppf(R/I,G) is an isomorphism. This independent low-degree lemma precedes the general henselian-invariance theorem. (CS24, Lemma 5.6.3, p.71).

**Checks.**

- For ℤ_p and μ_p, H²=Br(ℤ_p)[p]=0=H²(𝔽_p,μ_p), while H¹(ℤ_p,μ_p)≃ℤ/p for p odd.
- For (R,0) the comparison is the identity.
- For R=ℂ[[t]] and μ_n, Pic=0 and Br=0 on both sides, so both H² groups are 0.

**Proof route.** The supplier henselian torsor/gerbe lifting theorem gives injectivity for finite flat G, bijectivity on H¹ and injectivity on H² for smooth affine groups. The Bégueri resolution 0→G→Res_(R′/R)𝔾_m→Q→0, with R′ the coordinate ring of the Cartier dual G*, and the five lemma reduce surjectivity to surjectivity of H²(R,Res_(R′/R)𝔾_m)_tors→H²(R/I,Res_(R′/R)𝔾_m)_tors, since H²(R/I,G) is torsion; by finite pushforward and the smooth fppf–étale comparison this is H²_et(R′,𝔾_m)_tors→H²_et(R′/IR′,𝔾_m)_tors. The pair (R′,IR′) is henselian since R→R′ is finite. The torsion H² classes over R′/IR′ are Azumaya classes by affine Gabber, so lift them through the PGL_n torsor description and henselian smooth torsor lifting over (R′,IR′).

*Needs:* gap:begueri-resolution; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §2.22 `SchemeBrauerGroup`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`; SchemeAndStackFoundations §2.11 `finite_pushforward_exact`; `TauCeti.Algebra.WeilRestriction`; `TauCeti.Algebra.WeilRestriction.instSmooth`; `LaurentPolynomial.instSmooth`; `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints`; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology.

### 1.3 Continuity with a cohomological bound

Prove the following statement. Let R be an ordinary ring, G a commutative finite locally free R-group, A an animated R-algebra and a∈π₀A such that A is derived a-complete. If H^i(A,G)=H^i(A/^La,G)=0 for i≥3 (equivalently, H^i(π₀A,G)=H^i(π₀A/(a),G)=0 for i≥3, by PurityForFlatCohomology §3.3), then RΓ(A,G)≃Rlim_(n>0)RΓ(A/^La^n,G). (CS24, Lemma 5.6.4, pp.72–73).

**Checks.**

- For A=ℤ_p, a=p and G=μ_p, the dimension hypotheses hold and H¹ is the unit quotient ℤ/p for p odd.
- For a=1, derived a-completeness forces A=0 and both sides vanish.
- For the zero coefficient group both complexes vanish for every derived a-complete A.

**Proof route.** Use the bounds, with the comparison with π₀ and invariance across nil ideals, to reduce continuity to H⁰, H¹, H² and the low-degree tower Milnor sequence. The henselian H² lemma identifies the degree-two systems. Classical complete torsor effectivity, with the exact lim¹ sequence of gap:complete-torsor-effectivity, handles H¹; there the perfect amplitude [−1,0] of the group cotangent complex gives the cotangent terms over the derived quotients vanishing lim and lim¹, so lim¹ of H⁰ over the derived quotients A/^La^n equals lim¹ of the points over the ordinary quotients A/a^n; affine point evaluation handles nonpositive degrees. The deformation triangle controls the square-zero completion defect and the animated Postnikov error.

*Needs:* §1.2 H² invariance over a henselian pair; §1.1 derived completeness implies henselianity; gap:cohomology-deformation; gap:flat-group-cotangent-amplitude; gap:completed-pi0-defect; gap:tower-accuracy; PurityForFlatCohomology §3.3 (classical truncation and nil ideals); SchemeAndStackFoundations Layer 4; EnhancedDerivedSheaves E2:towers.1; gap:complete-torsor-effectivity.

### 1.4 Faithfully flat descent after principal completion

Prove the following statement. Fix an ordinary ring R, a commutative finite locally free R-group G, an animated R-algebra A and a∈π₀A. If A→A^• is a cosimplicial animated A-algebra, A and every A^j are derived a-complete, and A/^La→A^•/^La is a faithfully flat hypercover, then RΓ(A,G)→Rlim_Δ RΓ(A^•,G) is an equivalence. (CS24, Lemma 5.6.5, pp.74–75).

**Checks.**

- For R=ℤ, A=ℤ[[t]] and a=t, the identity cosimplicial A-algebra satisfies the statement directly; t need not come from R.
- For a=p coming from R=ℤ and A=ℤ_p, the split cover A→A×A has a contracting Čech object and recovers RΓ(A,G).
- For a=1 derived completeness forces every ring to be 0, hence both cohomology complexes are 0.

**Proof route.** Nilpotent detection of flatness makes A→A^• a faithfully flat hypercover modulo every a^n. Separate primary coefficients and the locus where that prime is invertible. For the primary piece, π₀ of the derived a-adic completion of the animated p-henselization is p-henselian, by the completed-π₀ defect and the permanence of henselian pairs, so prime continuity applies; combine it with fpqc hyperdescent and the restricted complete-continuity lemma, whose required dimension bound holds in characteristic p. Compare the error with the étale extension by zero j_!G from the prime-invertible locus, using excision and henselian étale proper base change. Étale complete-arc hyperdescent handles that error. This order uses no general complete-continuity theorem.

*Needs:* §1.3 continuity with a cohomological bound; §1.1 derived completeness implies henselianity; gap:flat-animated-modules; gap:animated-henselization; gap:completed-pi0-defect; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; PurityForFlatCohomology §3.2 (étale algebras see π₀); PurityForFlatCohomology §3.4 (cohomological dimension in the primary case); PurityForFlatCohomology §3.6 (fpqc hyperdescent); PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5.

### 1.5 Continuity over complete animated rings

Prove the following statement. For animated R-algebra A derived I-complete with I=(a₁,…,a_r)⊂π₀A finite, and commutative finite locally free G/R, RΓ(A,G)≃Rlim_(n>0)RΓ(A/^L(a₁^n,…,a_r^n),G). The quotients are the animated Koszul quotients; they cannot in general be replaced termwise by ordinary quotients. (CS24, Theorem 5.6.6, p.75).

**Checks.**

- For the empty tuple, I=0 and every quotient is A, so the limit is the constant RΓ(A,G).
- For A=ℤ_p, I=(p), G=μ_p and p odd, H¹=ℤ/p agrees with the inverse-limit unit quotient.
- For A=ℤ/p² the derived quotient by p has π₀=π₁=𝔽_p; replacing the tower by ordinary quotients termwise loses π₁.

**Proof route.** Treat one generator. Both sides satisfy hyperdescent along cosimplicial derived a-complete A-algebras that are faithfully flat hypercovers modulo every a^n, by fpqc hyperdescent for the quotients A/^La^n and by principal complete descent. Iterating the split étale refinements gives an ind-étale hypercover of π₀A by rings C none of whose quotients has a nonsplit étale cover; lift it through the étale equivalence with π₀ and complete each term derived a-adically, which gives such a hypercover of A. The derived quotient of a term by a^n has π₀ equal to C/a^nC, so it has no nonsplit étale cover. The π₀ of a term is a square-zero extension of the a-adic completion of C by the completed-π₀ defect, is henselian along a by derived completeness, and is C/aC modulo a; an étale cover of it splits modulo a and therefore splits. The smooth resolution kills H^j for j≥2, so restricted continuity applies. Use the preceding complete-descent theorem to pass from that cover back to A. Iterate generatorwise; commute the resulting finite family of sequential limits and use the diagonal cofinal system.

*Needs:* §1.4 faithfully flat descent after principal completion; §1.3 continuity with a cohomological bound; §1.2 H² invariance over a henselian pair; §1.1 derived completeness implies henselianity; gap:cohomology-deformation; PurityForFlatCohomology §3.2 (fppf hyperdescent, Postnikov convergence and étale algebras over π₀); PurityForFlatCohomology §3.6 (fpqc hyperdescent, for the quotients A/^La^n); DerivedModuleAlgebra §1.6; gap:split-etale-refinements; gap:completed-pi0-defect; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations` (étale covers split over a henselian pair when they split modulo the ideal); gap:begueri-resolution.

### 1.6 Comparison with ordinary quotient cohomology

Prove the following statement. Let an ordinary ring R be derived I-complete for finite I, and G finite locally free commutative over R. Then H^i(R,G)→H^i(R/I,G) is surjective for i≥1 and bijective for i≥2. There is an exact sequence 0→lim¹_n H⁰(R/^L(a₁^n,…,a_r^n),G)→H¹(R,G)→lim_n H¹(R/I^n,G)→0 for any finite generating tuple a of I. If R is also classically I-complete, the lim¹ term is lim¹_n G(R/I^n). (CS24, Example 5.6.7, pp.75–76).

**Checks.**

- For ℤ_p and μ_p with p odd, H¹=ℤ/p→H¹(𝔽_p,μ_p)=0 is surjective, not injective.
- In that example μ_p(ℤ/p^n) has eventually zero transitions towards each fixed level, hence lim¹=0 and the inverse-limit H¹ is ℤ/p.
- For I=0 the tower is constant and lim¹=0.

**Proof route.** Take the tower Milnor exact sequence of the derived continuity formula. Use positive-degree truncation comparison and nil-invariance to identify the quotient cohomology groups. Use cofinality of the tuple-power ideals with I^n, keeping the derived point group in the degree-one kernel.

*Needs:* §1.5 continuity over complete animated rings; PurityForFlatCohomology §3.3 (classical truncation and nil ideals); EnhancedDerivedSheaves E2:towers.1.

### 1.7 Why henselianity does not give full continuity

Prove the following statement. For the henselization R=𝔽_p{t} of (𝔽_p[t],(t)), the map H¹(R,μ_p)→H¹(𝔽_p[[t]],μ_p) is not an isomorphism. The source is countable and the target is uncountable, as follows from units modulo p-th powers. Thus the complete-ring comparison cannot be extended to every henselian ring in degree one. (CS24, Remark 5.6.8, p.76).

**Checks.**

- For R=𝔽_p{t}, Pic(R)=0 and H¹(R,μ_p)=R^×/(R^×)^p is countable.
- For 𝔽_p[[t]], units 1+t·h(t^p) give distinct classes for uncountably many h: a ratio that is a p-th power lies in 𝔽_p[[t^p]], forcing the two h equal.
- Both rings have H²(μ_p)=Br[p]=0; the degree-one failure is consistent with H² invariance.

**Proof route.** The henselization of the countable finitely presented ring is countable. In 𝔽_p[[t]] the p-th-power units have exponents divisible by p; independent infinitely many remaining coefficients give uncountably many quotient classes. Both local rings have zero Picard group, so the Kummer sequence identifies H¹ with units modulo p-th powers.

*Needs:* SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; SchemeAndStackFoundations §0.12.

### Examples

Over ℤ[[t]], t lies in π₀ of the animated ℤ-algebra without lying in the base ℤ. Principal complete descent applies directly. For an empty generating tuple, complete continuity is the constant A-system.

### Dependencies

gap:completed-pi0-defect; DerivedModuleAlgebra §1.6; SchemeAndStackFoundations §0.14 `henselian_pair_permanence`; `HenselianRing`; gap:begueri-resolution; HeightsRationalPointsAndObstructions §2.6c `Brauer.affine_comparison`; SchemeAndStackFoundations §2.22 `SchemeBrauerGroup`; SchemeAndStackFoundations §2.22 `CohomologicalBrauer`; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations §2.10 `smoothGroup_fppf_etale_comparison`; SchemeAndStackFoundations §2.11 `finite_pushforward_exact`; `TauCeti.Algebra.WeilRestriction`; `TauCeti.Algebra.WeilRestriction.instSmooth`; `LaurentPolynomial.instSmooth`; `TauCeti.Algebra.WeilRestriction.multiplicativeGroupPoints`; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; gap:cohomology-deformation; gap:flat-group-cotangent-amplitude; gap:tower-accuracy; PurityForFlatCohomology §3.3; SchemeAndStackFoundations Layer 4; EnhancedDerivedSheaves E2:towers.1; gap:complete-torsor-effectivity; gap:flat-animated-modules; gap:animated-henselization; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; PurityForFlatCohomology §3.2; PurityForFlatCohomology §3.4; PurityForFlatCohomology §3.6; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.excision`; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5; gap:split-etale-refinements; SchemeAndStackFoundations §2.11 `fppf_kummer_sequence`; SchemeAndStackFoundations §0.12.

## Layer 2: Henselian invariance and algebraization

### 2.0 Flat cohomology of ordinary algebras and henselian nonunital subrings

The four definitions below make §2.2 and §2.3 statable on the pinned carriers. Throughout, R is an ordinary ring in the universe `u` and G a commutative finite locally free R-group, an object of `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` over R, with coordinate Hopf algebra H_G given by `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra`; H_G is finite projective over R and cocommutative. (CS24 §5.2.5, p.55, for H^i(A,G) of an ordinary algebra; BC22 §2.1.1, p.5, and SP Tag 09XI for the nonunital criterion.)

**Points.** Define `pointsAddFunctor G`, the functor on commutative R-algebras sending A to the abelian group G(A): the convolution group of R-algebra maps H_G→A, written additively. It is functorial through `AlgHom.mapValue` and commutative because H_G is cocommutative (`AlgHom.convCommGroupOfSemiring`).

- The group law is convolution: for points φ and ψ and an element h of H_G with comultiplication Σh₁⊗h₂, the sum φ+ψ sends h to Σφ(h₁)ψ(h₂); the zero point is the counit followed by the structure map R→A, and the negative of φ is φ composed with the antipode.
- An R-algebra map f:A→A′ acts by post-composition, φ↦f∘φ, and this map is additive; identities and composites are preserved.
- A homomorphism G→G′ of commutative finite locally free R-groups, that is a Hopf algebra map H_(G′)→H_G, induces a natural additive map from the points of G to those of G′ by precomposition, functorially in the homomorphism.
- The underlying set-valued functor is corepresented by H_G, so on the affine site it is the points presheaf that `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf` shows to be an fppf sheaf, and its group-valued form is the presheaf underlying `TauCeti.HopfAlgebra.pointsFppfSheaf`.

**Checks.**

- For μ_n, with H=R[x]/(xⁿ−1) and Δx=x⊗x, the points over A are the n-th roots of unity of A and the sum of two points is their product. Over A=ℤ/p², μ_p(A)=1+pℤ/p²≅ℤ/p, while μ_p(𝔽_p)=0; a points functor read off reduced quotients would lose this group.
- For α_p over 𝔽_p, with H=𝔽_p[x]/(x^p) and Δx=x⊗1+1⊗x, the points over A are the a∈A with a^p=0 and the sum is addition: over 𝔽_p[ε]/(ε²) the group is 𝔽_pε and ε+ε=2ε. The multiplicative rule of the μ_n Check would instead produce ε·ε=0.
- For the constant group ℤ/2, with H=R×R and Δ dual to addition on {0,1}, a point is an idempotent e of A and the sum of e and f is e+f−2ef. Over A=ℚ×ℚ the group has four elements and is (ℤ/2)²; over a connected A it is ℤ/2.
- For the trivial group, whose coordinate Hopf algebra is R, every A has exactly one point, the zero of the group.

**The coefficient sheaf.** Define `coefficientSheaf G` as the sheafification (`CategoryTheory.presheafToSheaf`) for the affine fppf topology `TauCeti.CommAlgCat.fppfTopology` of R of the presheaf Spec A↦G(A), after the universe lift `AddCommGrpCat.uliftFunctor` to abelian groups of the universe `u+1`. Sheafification of presheaves of abelian groups of the universe `u` on this large site is not available at the pins, while for the universe `u+1` it is.

- The universe-lifted points presheaf is already an fppf sheaf, by `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf` and because the forgetful functor from abelian groups reflects the sheaf condition; so the unit of sheafification is an isomorphism, and the sections of `coefficientSheaf G` over Spec A are the universe lift of G(A), naturally in A.
- A homomorphism G→G′ induces a morphism of coefficient sheaves, functorially and additively in the homomorphism.
- If G′→G→G″ are homomorphisms of commutative finite locally free R-groups such that G′(A) is the kernel of G(A)→G″(A) for every A and G→G″ is faithfully flat, then the coefficient sheaves form a short exact sequence in the abelian category of fppf sheaves.

**Checks.**

- For α_p over 𝔽_p, the sections over 𝔽_p[t]/(t^p) are the ideal (t), of dimension p−1 over 𝔽_p, while the sections over every reduced 𝔽_p-algebra vanish; a coefficient sheaf formed from reduced or étale test algebras would be zero.
- The p-th power map μ_(p²)→μ_p over 𝔽_p is faithfully flat with kernel μ_p, since its coordinate map 𝔽_p[v]/(v^p)→𝔽_p[u]/(u^(p²)), v↦u^p (with u=x−1) is free of rank p, so the coefficient sheaves form a short exact sequence. On sections over A=𝔽_p[t]/(t^p) the p-th power map sends 1+m to 1+m^p=1 and is zero, although μ_p(A)=1+(t) is nonzero: exactness holds for sheaves and fails for sections.
- For the trivial group the coefficient sheaf is the zero sheaf.

**Flat cohomology.** Define `flatCohomology G n` as the covariant functor on commutative R-algebras sending A to the n-th `Ext` group, in abelian fppf sheaves on affine R-schemes valued in abelian groups of the universe `u+1`, from the sheafified free abelian sheaf on the representable presheaf of Spec A to `coefficientSheaf G`, as in `CategoryTheory.Sheaf.cohomologyPresheafFunctor`; an R-algebra map A→A′ acts through the induced map of free sheaves, so it gives restriction Hⁿ_fppf(A,G)→Hⁿ_fppf(A′,G). The definition takes an instance of `CategoryTheory.HasExt` on the sheaf category, in the universe chosen for the `Ext` groups; such an instance exists for every abelian category, in the universe of `HasDerivedCategory.standard`, by `CategoryTheory.hasExt_of_hasDerivedCategory`, so the statements of §2.2 and §2.3 are not vacuous.

- In degree zero, `flatCohomology G 0` evaluated at A is isomorphic to G(A), naturally in A, since homomorphisms out of the free sheaf on Spec A are the sections at Spec A; for sheaves valued in abelian groups of the site's morphism universe this is `TauCeti.CategoryTheory.cohomologyZeroSectionsEquiv`, and its argument applies unchanged to the universe-lifted values used here.
- The value of `flatCohomology G n` at A is the n-th cohomology of the restriction of `coefficientSheaf G` to the slice site over Spec A, the big affine fppf site of A, so it is Hⁿ_fppf(A,G_A). Tau Ceti's `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH` proves this comparison for sheaves valued in abelian groups of the site's morphism universe (SchemeAndStackFoundations §2.5); its argument, exactness of restriction to the slice and of its left adjoint, which carries free sheaves on representables of the slice to free sheaves on the underlying representables, applies unchanged to the universe-lifted values used here.
- A sequence G′→G→G″ as in the last law of the coefficient sheaf gives a long exact sequence of the groups Hⁿ_fppf(A,−), natural in A, beginning with the points in degree zero.
- On ordinary R-algebras, `flatCohomology G n` agrees with H^n(A,G) of the animated construction of gap:animated-flat-cohomology and with the cohomology of the abelian sheaf underlying `TauCeti.HopfAlgebra.pointsFppfSheaf` over Spec A.
- For X=Spec A, the value of `flatCohomology G n` at A agrees with Hⁿ_fppf(X,G) as PurityForFlatCohomology §0.2 takes it, on Mathlib's big fppf site of schemes over Spec R (the case of empty support), because relative spectra of R-algebras are cover-dense among schemes over Spec R (`TauCeti.CommAlgCat.isCoverDense_algSpec`) and the coefficient sheaf extends to the fppf sheaf of points of the group scheme Spec H_G.
- For an R-algebra R′ and an R′-algebra A, the theory of G over R evaluated at A agrees with the theory of the base change of G to R′ evaluated at A, by the identification of slice sites.

**Checks.**

- H¹_fppf(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t]^p by the additive Frobenius sequence, with the torsor x^p=t nonzero; étale cohomology of α_p, or of an étale points presheaf, would give 0. In degree zero α_p(𝔽_p[t])=0, since 𝔽_p[t] is reduced.
- For p odd, H¹_fppf(ℤ_p,μ_p)=ℤ_p^×/(ℤ_p^×)^p≅ℤ/p by Kummer theory and Pic(ℤ_p)=0; for p=2 it is (ℤ/2)², generated by the classes of −1 and 5.
- For the trivial group, whose coordinate Hopf algebra is R, every group Hⁿ_fppf(A,G) is zero, including n=0.
- For the zero algebra A=0 every group Hⁿ_fppf(0,G) is zero: the empty family covers Spec 0, so the free sheaf on it is zero.

**Henselian nonunital subrings.** Define `IsHenselianNonunitalSubring B′`, for a nonunital subring B′ of a commutative ring B, as Gabber's criterion of the Conventions: every x∈B′ has a quasi-inverse y∈B′, (1+x)(1+y)=1, and for every N≥1 and a₀,…,a_N∈B′ the polynomial T^N(T−1)+a_NT^N+…+a₀ has a root in 1+B′, the polynomial being evaluated in B.

- A nonunital subring B′ satisfies `IsHenselianNonunitalSubring` exactly when, in Mathlib's unitization `Unitization ℤ B′`, the kernel of the augmentation `Unitization.fstHom` (the image of B′) is a henselian ideal in the `HenselianRing` sense; the condition depends only on the nonunital ring B′, not on the ambient B (BC22 §2.1.1, p.5; SP Tag 09XI).
- For an ideal I of a ring A, the pair (A,I) is henselian exactly when I is henselian as a nonunital subring of A (SP Tag 09XI; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`).
- Every ideal of a henselian nonunital ring is again henselian (BC22 §2.1.1, p.5).

**Checks.**

- The zero subring and pℤ_p⊂ℤ_p are henselian nonunital subrings; for the zero subring both clauses hold with y=0 and the root T=1.
- ℤ⊂ℤ is not, since 1 has no quasi-inverse (2(1+y)=1 has no integer solution).
- 3ℤ_(3)⊂ℤ_(3) has quasi-inverses (ℤ_(3) is local) but is not henselian, since T(T−1)−3 has discriminant 13, not a rational square, so no root in 1+3ℤ_(3). A criterion asking only for quasi-inverses would accept this example.

*Needs:* gap:animated-flat-cohomology; PurityForFlatCohomology §0.2; SchemeAndStackFoundations §2.5; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`; `CategoryTheory.Sheaf.cohomologyPresheafFunctor`; `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH`; `TauCeti.CategoryTheory.cohomologyZeroSectionsEquiv`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra`; `AlgHom.mapValue`; `AlgHom.convCommGroupOfSemiring`; `TauCeti.CommAlgCat.fppfTopology`; `TauCeti.CommAlgCat.isCoverDense_algSpec`; `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`; `TauCeti.HopfAlgebra.pointsFppfSheaf`; `CategoryTheory.presheafToSheaf`; `AddCommGrpCat.free`; `AddCommGrpCat.uliftFunctor`; `CategoryTheory.Abelian.extFunctor`; `CategoryTheory.HasExt`; `HenselianRing`; `Unitization`; `Unitization.fstHom`.

### 2.1 Finitary functors and henselian completion

Prove the following statement. For a Noetherian henselian pair (A,I) whose completion map A→Â has geometrically regular fibres, and a set-valued functor F on A-algebras commuting with filtered colimits, F(A)→F(Â) is injective. An element of F(A/I) lifts to F(A) if and only if it lifts to F(Â). (BC22, Lemma 2.1.3, pp.6–7).

**Checks.**

- For (A,I)=(ℤ_(p)^h,(p)) and F(C)=C, A→ℤ_p is injective; the residue 1∈𝔽_p lifts to 1 in both rings.
- For I=0, Â=A and every comparison is the identity.
- For F the constant two-element set, F(A)→F(Â) is the identity and exactly the same residue elements lift on either side.

**Proof route.** Write Â as a filtered colimit of smooth A-algebras by Popescu. Each stage has an A/I-point inherited from Â; henselian smooth lifting gives an A-retraction. Descend a proposed equality or lift to one smooth stage and apply its retraction.

*Needs:* SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; `AdicCompletion.flat_of_isNoetherian`.

### 2.2 Flat cohomology over henselian pairs

Prove `flatCohomology_henselian_invariance`: for a henselian pair (R,I) in the `HenselianRing` sense and a commutative finite locally free R-group G, the reduction map Hⁿ_fppf(R,G)→Hⁿ_fppf(R/I,G), the image of the quotient map R→R/I under `flatCohomology G n`, is surjective for n≥1 and bijective for n≥2. R and I may be non-Noetherian and I need not be finitely generated. (CS24, Corollary 5.6.9, p.76).

**Checks.**

- For (ℤ_(p)^h,p) and μ_p with p odd, H¹≃ℤ/p maps onto 0 on 𝔽_p, so bijectivity cannot be demanded in degree one.
- For the same pair, H²(μ_p)=0 on both sides.
- For I=0 the comparison is the identity in every degree.
- For the henselian pair (𝔽_p[[t]],(t)) and G=α_p, the additive Frobenius sequence gives H¹=𝔽_p[[t]]/𝔽_p[[t]]^p≠0, which maps onto H¹(𝔽_p,α_p)=𝔽_p/𝔽_p^p=0, and H²=0 on both sides; degree one fails injectivity for infinitesimal coefficients as well as for μ_p.

**Proof route.** Use varying-base continuity to reduce to the henselization of a finite-type ℤ-algebra along a finite ideal; gap:henselized-formal-fibres gives the geometrically regular completion map. Apply the finitary-functor completion comparison of §2.1, proved from Popescu and henselian smooth lifting, to the cohomology functor. Use complete continuity and the independent H² lemma. Descend and lift the finite data, then pass through filtered colimits, where cohomology with commutative coefficients commutes with the colimit; retain surjectivity only in degree one.

*Needs:* §2.0 flat cohomology of ordinary algebras; §1.6 comparison with ordinary quotient cohomology; §1.2 H² invariance over a henselian pair; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations Layer 2 §§2.1–2.6; `TauCeti.Henselization.isNoetherianRing`; `TauCeti.Henselization.faithfullyFlat_adicCompletion`; `TauCeti.Henselization.completionEquiv`; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; §2.1 finitary functors and henselian completion; gap:henselized-formal-fibres; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; PurityForFlatCohomology §0.3.

### 2.3 Algebraization over a topological ring

Prove `flatCohomology_algebraization`: let B be a topological ring, with the uniform structure of its additive group, and B′⊂B an open nonunital subring that is henselian (`IsHenselianNonunitalSubring`) and such that every neighbourhood of zero in B contains an open ideal of B′, equivalently B′ has a neighbourhood basis of zero consisting of ideals of B′. For the separated completion B̂ and every commutative finite locally free B-group G, the map Hⁿ_fppf(B,G)→Hⁿ_fppf(B̂,G) induced by B→B̂ is bijective for n≥2. No first-countability or Noetherian condition is imposed. (CS24, Corollary 5.6.10, p.76).

**Checks.**

- For B=𝔽_p{t} with its t-adic topology, B̂=𝔽_p[[t]] and both H²(μ_p)=0.
- For a discrete topological ring B, B̂=B and every high-degree comparison is the identity.
- The preceding noncomplete example has countable versus uncountable H¹(μ_p), so a degree-one extension would fail.
- For a henselian pair (A,I), take B=A and B′=I with the topology whose neighbourhoods of zero are the subsets containing I; then B̂=A/I and the statement is the degree-≥2 part of §2.2 (CS24 Example 5.6.11, p.77). If B′ were only required to have quasi-inverses, the pair (ℤ_(3),3ℤ_(3)) with this topology would be admitted, with completion 𝔽_3; there the conclusion fails, since H²(ℤ_(3),μ_3) contains Br(ℤ_(3))[3], which contains the class unramified at 3 of a cubic algebra over ℚ with invariants 1/3 at 2 and −1/3 at 5, while H²(𝔽_3,μ_3)=0. The criterion of §2.0 excludes this example.
- On a nonzero ring B with the indiscrete topology the only open subring is B, the completion is the zero ring, and B is not a henselian nonunital subring of itself, since −1 has no quasi-inverse. The hypothesis is needed: for B=ℚ, H²(ℚ,μ₂)=Br(ℚ)[2]≠0 (Kummer, with Pic(ℚ)=0) while H²(0,μ₂)=0.

**Proof route.** Apply the Cauchy-net algebraization criterion to the functor C↦H^i(C,G), i≥2. Its finitary property is the varying-base cohomology-limit theorem; invariance on henselian pairs is the preceding henselian-invariance theorem. Use the nonunital subring hypothesis through Gabber's criterion, equivalently through the Dorroh unitalization ℤ⊕B′ with its actual ring multiplication.

*Needs:* §2.0 flat cohomology of ordinary algebras and henselian nonunital subrings; `UniformSpace.Completion`; §2.2 flat cohomology over henselian pairs; SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations Layer 2 §§2.1–2.6; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; gap:cauchy-algebraization; PurityForFlatCohomology §0.3.

### 2.4 Algebraization on a Laurent puncture

Prove the following statement. For any ring R, let R{t} be the t-henselization of R[t]. For a commutative finite locally free group G over R{t}[1/t], the natural map H^i(R{t}[1/t],G)→H^i(R((t)),G) is an isomorphism for i≥2. (CS24, Example 5.6.11, p.77).

**Checks.**

- For R=𝔽_p and G=μ_p, Br(𝔽_p{t}[1/t])[p]=ℤ/p=Br(𝔽_p((t)))[p], giving H²=ℤ/p.
- For the same fields the unit quotients in H¹(μ_p) are respectively countable and uncountable, so i≥2 is essential.
- For the trivial group both sides vanish in every degree.

**Proof route.** Use the t-adic topological ring B=R{t}[1/t] and open nonunital subring tR{t}. Its completion is R[[t]][1/t]=R((t)); apply topological algebraization.

*Needs:* §2.3 algebraization over a topological ring; SchemeAndStackFoundations §0.12.

### 2.5 Henselian comparison on punctured animated rings

Prove the following statement. Let A→A′ be animated R-algebras and I⊂π₀A finite. Suppose π₀A and π₀A′ are henselian for I and its image, and π₀A/I≃(π₀A/I)⊗^L_A A′. For U=Spec π₀A minus V(I) and commutative finite locally free G/R, H^i(U_A,G)≃H^i(U_(A′),G) for i≥2. (CS24, Corollary 5.6.12, p.77).

**Checks.**

- For ℤ_(p)^h→ℤ_p and I=(p), the generic fields have H²(μ_p)=Br[p]=ℤ/p on both sides.
- For I=(0) the derived residue condition forces A≃A′, and the punctured open is empty.
- For I=(1), henselianity forces the zero ring and both groups are 0.

**Proof route.** Compare the two support localization triangles. The support terms are equivalent by derived excision and the affine high-degree terms by henselian invariance and truncation comparison. Use the long exact sequences, including degree-two injectivity, to identify the punctured terms.

*Needs:* PurityForFlatCohomology §3.5 (finite-ideal derived excision); §2.2 flat cohomology over henselian pairs; PurityForFlatCohomology §3.3 (classical truncation); PurityForFlatCohomology §3.2 (flat cohomology with supports); SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`.

### 2.6 Comparison on Noetherian open neighborhoods

Prove the following statement. Let R→R′ be Noetherian rings, I⊂R an ideal, and both (R,I) and (R′,IR′) henselian. Suppose R/I^n≃R′/I^nR′ for every n>0. For every open U⊂Spec R containing Spec R minus V(I) and every finite locally free commutative R-group G, H^i(U,G)≃H^i(U×_R R′,G) for i≥2. (CS24, Corollary 5.6.13, p.77).

**Checks.**

- For ℤ_(p)^h→ℤ_p and U=D(p), the comparison is ℤ/p→ℤ/p on H²(μ_p).
- For R→R the hypothesis on every quotient holds and the map is the identity for any allowed U.
- For I=0 the equality of quotients already forces R≃R′; no flatness hypothesis has been inserted.

**Proof route.** Use Noetherian formal comparison and excision to compare supports on the complement of U. Use henselian invariance for the affine ambient terms. Use the independent punctured H² injectivity input for the boundary of the long exact sequence; higher degrees then follow.

*Needs:* §2.5 henselian comparison on punctured animated rings; §2.2 flat cohomology over henselian pairs; §1.5 continuity over complete animated rings; PurityForFlatCohomology §0.2 (fppf cohomology with supports on schemes); SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; PurityForFlatCohomology §3.5 (finite-ideal excision); gap:punctured-h2-injectivity.

### Examples

The henselian map ℤ_(p)^h→ℤ_p compares the generic-field groups H²(μ_p)=ℤ/p. In equal characteristic, 𝔽_p{t} has countably many unit classes modulo p-th powers while 𝔽_p[[t]] has uncountably many, so the degree-one completion comparison fails.

### Dependencies

gap:animated-flat-cohomology; SchemeAndStackFoundations §2.5; SchemeAndStackFoundations §0.14 `henselian_pair_characterisations`; `CategoryTheory.Sheaf.cohomologyPresheafFunctor`; `CategoryTheory.Sheaf.cohomologyPresheafObjIsoOverH`; `TauCeti.CategoryTheory.cohomologyZeroSectionsEquiv`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.coordinateHopfAlgebra`; `AlgHom.mapValue`; `AlgHom.convCommGroupOfSemiring`; `TauCeti.CommAlgCat.fppfTopology`; `TauCeti.CommAlgCat.isCoverDense_algSpec`; `TauCeti.HopfAlgebra.pointsPresheaf_isSheaf`; `TauCeti.HopfAlgebra.pointsFppfSheaf`; `CategoryTheory.presheafToSheaf`; `AddCommGrpCat.free`; `AddCommGrpCat.uliftFunctor`; `CategoryTheory.Abelian.extFunctor`; `CategoryTheory.HasExt`; `HenselianRing`; `Unitization`; `Unitization.fstHom`; SchemeAndStackFoundations §0.15 `popescu_colimit_of_geometricallyRegular`; SchemeAndStackFoundations §0.14 `henselian_smooth_lifting`; `AdicCompletion.flat_of_isNoetherian`; §1.6 comparison with ordinary quotient cohomology; §1.2 H² invariance over a henselian pair; SchemeAndStackFoundations Layer 1 §§1.13–1.15; SchemeAndStackFoundations Layer 2 §§2.1–2.6; `TauCeti.Henselization.isNoetherianRing`; `TauCeti.Henselization.faithfullyFlat_adicCompletion`; `TauCeti.Henselization.completionEquiv`; gap:henselized-formal-fibres; gap:henselian-stack-lifting; gap:henselian-torsor-cohomology; PurityForFlatCohomology §0.3; `UniformSpace.Completion`; SchemeAndStackFoundations Layer 4; gap:cauchy-algebraization; SchemeAndStackFoundations §0.12; PurityForFlatCohomology §3.5; PurityForFlatCohomology §3.3; PurityForFlatCohomology §3.2; §1.5 continuity over complete animated rings; PurityForFlatCohomology §0.2; gap:punctured-h2-injectivity.

## Layer 3: Adic descent with supports

### 3.1 Discreteness of completely flat perfectoid modules

Prove the following statement. Let A be an integral perfectoid ring, derived complete for I=(a₁,…,a_r), and M a connective derived I-complete animated A-module. If M/^L(a₁^n,…,a_r^n) is flat over A/^L(a₁^n,…,a_r^n) for all n>0, then M is discrete. The conclusion is not ordinary flatness of M over an arbitrary non-Noetherian A. (CS24, Lemma 5.7.1, p.78).

**Checks.**

- For M=A the reductions are free of rank one and M is discrete.
- For nonzero A=𝔽_p, I=0 and M=A[1], the reduction is still A[1], which is not flat over the discrete A; the hypothesis excludes this nondiscrete module.
- For M=0 every reduction is flat and the conclusion is the discrete zero module.

**Proof route.** Use perfectoid p-complete arc hypercovers by products of complete rank-at-most-one valuation rings and descend M from its flat Koszul reductions. After completing and splitting the valuation products, reduce I to a principal element with compatible p-power roots. Compare M with the ordinary inverse limit of π₀M/a^n; the complete flat-system theorem identifies its reductions. The compatible-root annihilator identity makes (a) weakly proregular; adic flatness gives derived reduction discreteness. Derived Nakayama identifies M with that ordinary limit.

*Needs:* gap:flat-animated-modules; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; ArcTopologyAndDescent §11.2; ArcTopologyAndDescent §12.7; PerfectoidQuotients Layer 0 §0.1; PerfectoidQuotients Layer 0 §0.4; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; gap:adic-flat-module-limits; gap:complete-module-hyperdescent; DerivedModuleAlgebra §§1.7–1.9.

### 3.2 Adically faithfully flat descent with supports

Prove the following statement. Fix ordinary R, commutative finite locally free G/R, animated R-algebra A and I=(a₁,…,a_r)⊂π₀A. If A→A^• is a cosimplicial animated A-algebra whose derived Koszul reduction modulo the tuple is a faithfully flat hypercover, then RΓ_I(A,G)≃Rlim_Δ RΓ_I(A^•,G). Without completeness this is a supported statement. If A and all A^j are derived I-complete, the analogous equivalences also hold for RΓ(A,G) and for RΓ(U_A,G), U=Spec π₀A minus V(I). (CS24, Theorem 5.7.2, pp.78–81; SP, Tag 0A6R (Lemma 47.9.1), 0954 (Lemma 47.8.2), and §47.10; online, no page numbers).

**Checks.**

- For I=(1), both supported complexes vanish; completeness would force the rings to be 0 only for the additional full-cohomology assertion.
- For the empty tuple I=0, supports are full and the statement is fpqc hyperdescent.
- For the split cover A→A×A at I=(a), the localization fibres split with the cover and the totalization equals RΓ_(a)(A,G).
- In the perfection step of the proof route, take A=𝔽_p[t^(1/p^∞)], the tuple (t) and A′=A×𝔽_p with t↦1 in the second factor. Then A→A′ is not flat, its second factor being (t−1)-torsion over the domain A, while A/^Lt→A′/^Lt=A/^Lt×0 is faithfully flat; A′ is already perfect, so its perfection keeps the faithfully flat reduction. A version of the step that demanded faithful flatness of A→A′ itself would not apply to this cover.

**Proof route.** Excision permits completing every term. General continuity and fpqc descent already give full affine descent in the complete case; the support triangle reduces the new assertion to punctured descent. Separate primary coefficients. Étale complete-arc hyperdescent treats the prime-invertible contribution and its j_! error. Prime continuity reduces the remaining punctured functor to characteristic-p quotients. Use complete module descent and the cohomology deformation triangle to make the assertion invariant under square-zero extensions; Postnikov convergence reduces to discrete 𝔽_p-algebras. Use the faithfully flat semiperfect ind-fppf cover A→A[X_a^(1/p^∞) : a∈A]/(X_a−a : a∈A), nilpotent approximation, and completion, which keeps a perfect 𝔽_p-algebra perfect, to reach perfect A. Perfectoid complete-flat discreteness makes the completed cover terms discrete, so cohomological connectiveness reduces hyperdescent to Čech descent. Establish universal Čech descent, allowing refinement of the cover by its perfection. There the cover is a map s:A→A′ of 𝔽_p-algebras with A perfect and A/^L(a₁,…,a_r)→A′/^L(a₁,…,a_r) faithfully flat, while A→A′ need not be flat. The perfection A″=colim_φ A′ is the filtered colimit, along algebra maps, of the A-algebras A′_n equal to A′ with structure map a↦s(a^(p^n)). Through the automorphism φ_A^n of A, the reduction A/^L(a₁,…,a_r)→A′_n/^L(a₁,…,a_r) is A/^L(a₁^(p^n),…,a_r^(p^n))→A′/^L(a₁^(p^n),…,a_r^(p^n)); its base change along A/^L(a₁^(p^n),…,a_r^(p^n))→A/^L(a₁,…,a_r), which is surjective on π₀ with nilpotent kernel, is the faithfully flat A′/^L(a₁,…,a_r), so it is faithfully flat by nilpotent detection. A filtered colimit of faithfully flat animated algebras along algebra maps is faithfully flat, so A/^L(a₁,…,a_r)→A″/^L(a₁,…,a_r) is faithfully flat. Repeat the reductions after arbitrary animated base change. This makes every Čech algebra perfect. Apply the perfect-base Dieudonné fibre formula. Remove V−1 by the fibre triangle and M by its finite projective dimension and base-change compatibility. For J=(p,[a₁],…,[a_r]) in W(A), use geometric supports as colim_n RHom(K_J^n,−), with the finite Koszul complex, instead of ordinary J-power quotients. Each dual Koszul complex on an ordinary Witt ring occupies [0,r+1], so filtered colimits commute with the cosimplicial totalization. Derived complete faithful-flat module descent identifies W(A) with the totalization of its Witt terms. Finite-projective Koszul base change and commutation of RHom with limits prove each fixed-n equivalence, then its filtered colimit. Witt rings are derived J-complete: p is regular, reduction modulo p is the I-complete perfect ring, and complete derived Nakayama lifts completeness along the finite Teichmüller tuple. The same argument applies to every cover term.

*Needs:* PurityForFlatCohomology §3.5 (finite-ideal derived excision); §1.5 continuity over complete animated rings; PurityForFlatCohomology §3.6 (fpqc hyperdescent); PurityForFlatCohomology §3.3 (cohomology across nil ideals); PerfectoidQuotientsPartII §Q7.1 (the semiperfect ind-fppf cover); PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; gap:cohomology-deformation; gap:tower-accuracy; §3.1 discreteness of completely flat perfectoid modules; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; gap:flat-animated-modules; PerfectoidQuotients Layer 0 §0.6 `perfectoid_sharp_ideal_completion`; §1.1 derived completeness implies henselianity; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5; EnhancedDerivedSheaves E5:animation.2; SchemeAndStackFoundations Layer 2 §§2.1–2.6; DerivedModuleAlgebra §§1.2–1.4; DerivedModuleAlgebra §0.K.1; DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges`; PurityForFlatCohomology §0.3; gap:complete-module-hyperdescent; gap:koszul-geometric-support; DerivedModuleAlgebra §1.9; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

### Examples

For I=(1), supported descent compares two zero complexes. For I=(0), support is the whole spectrum and the hypothesis is an fpqc hypercover. For a single nonunit parameter the split cover A→A×A descends the localization fibre directly.

### Dependencies

gap:flat-animated-modules; DerivedModuleAlgebra §1.6; DerivedModuleAlgebra §§1.2–1.4; ArcTopologyAndDescent §11.2; ArcTopologyAndDescent §12.7; PerfectoidQuotients Layer 0 §0.1; PerfectoidQuotients Layer 0 §0.4; DerivedModuleAlgebra §§0.K.1, 1.1–1.9; gap:adic-flat-module-limits; gap:complete-module-hyperdescent; DerivedModuleAlgebra §§1.7–1.9; PurityForFlatCohomology §3.5; §1.5 continuity over complete animated rings; PurityForFlatCohomology §3.6; PurityForFlatCohomology §3.3; PerfectoidQuotientsPartII §Q7.1; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.pContinuity`; gap:cohomology-deformation; gap:tower-accuracy; PrismaticCohomologyPartIII §6.0 `Prismatic.FlatCohomology.perfectDieudonneComparison`; PerfectoidQuotients Layer 0 §0.6 `perfectoid_sharp_ideal_completion`; §1.1 derived completeness implies henselianity; SchemeAndStackFoundations §2.15 `gabber_affine_proper_base_change`; ArcTopologyAndDescent §11.5; EnhancedDerivedSheaves E5:animation.2; SchemeAndStackFoundations Layer 2 §§2.1–2.6; DerivedModuleAlgebra §0.K.1; DerivedDeRhamCohomology §1.22 `DerivedDeRham.completionExchanges`; PurityForFlatCohomology §0.3; gap:koszul-geometric-support; DerivedModuleAlgebra §1.9; EnhancedDerivedSheaves E5:animation.3 `tot_filteredColimit_of_bounded`.

## Downstream consumers

The exports are complete continuity (§1.5) and its comparison with ordinary quotients (§1.6), henselian invariance (§2.2), algebraization over topological rings and on Laurent punctures (§§2.3–2.4), the punctured and Noetherian-neighbourhood comparisons (§§2.5–2.6) and adic descent with supports (§3.2). They are the flat-cohomology inputs for torsors over complete and henselian rings in the setting of BC22 §2 and for flat cohomology of perfectoid and prismatic rings. PurityForFlatCohomology, PrismaticCohomologyPartIII and ArcTopologyAndDescent supply this roadmap and take nothing from it.

## Worked examples

Over 𝔽_p[t], the fppf α_p torsor x^p=t is nontrivial: the additive Frobenius sequence gives H¹(𝔽_p[t],α_p)=𝔽_p[t]/𝔽_p[t]^p. Passing to an étale point presheaf would erase this torsor. Over a perfect 𝔽_p-algebra, Frobenius is surjective and the α_p example behaves differently; the Dieudonné formula still records the correct V−1 fibre, including its possible H¹ for other groups.

For A=ℤ/p², the derived quotient by p has π₀=𝔽_p and π₁=𝔽_p. The ordinary residue does not record π₁. The map ℤ/p²→𝔽_p therefore fails the derived residue condition of PurityForFlatCohomology §3.5, although the ordinary residues agree. By contrast ℤ→ℤ_p is flat and has identical derived reductions modulo p, so it satisfies that condition for I=(p).

For supports, I=(1) gives zero cohomology and satisfies the derived residue condition for every map; I=(0) gives full cohomology. Ideals (t) and (t²) give the same support complex, whereas their Koszul quotients are distinct objects. In §3.2 these two cases are the zero comparison and fpqc hyperdescent.

## References

Page numbers are printed preprint pages. Stable Stacks tags replace pages for the online reference. Statements and proof paths are expressed in this roadmap’s own words.

- **CS24**. Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*. arXiv:1912.10932v3, 26 April 2023; preprint pagination. [Source](https://arxiv.org/pdf/1912.10932v3). Locations used: §1.4 p.8; §4.1.2 p.36; §§4.1.5–4.1.6 pp.37–38; §§5.1–5.7 pp.49–81.
- **BG80**. Lucile Bégueri, *Dualité sur un corps local à corps résiduel algébriquement clos*. Mémoires de la SMF, nouvelle série 4 (1980). [Source](https://www.numdam.org/item/MSMF_1980_2_4__1_0.pdf). Locations used: §§2.1–2.2, pp.22–27.
- **DJ**. Aise Johan de Jong, *A result of Gabber*. author note, nine pages; undated PDF. [Source](https://www.math.columbia.edu/~dejong/papers/2-gabber.pdf). Locations used: Theorem 1.1, p.1.
- **BC22**. Alexis Bouthier and Kęstutis Česnavičius, *Torsors on loop groups and the Hitchin fibration*. arXiv:1908.07480v4; preprint pagination. [Source](https://arxiv.org/pdf/1908.07480v4). Locations used: §§2.1.1–2.1.8 pp.5–8; §2.1.12–2.1.15 pp.11–13; §2.3 pp.29–31.
- **Y18**. Amnon Yekutieli, *Flatness and completion revisited*. arXiv:1606.01832v3, 6 September 2017; numbering differs from published 2018 paper. [Source](https://arxiv.org/pdf/1606.01832v3). Locations used: Theorem 1.8 pp.5–6; §4 pp.12–14; Theorem 5.9 pp.16–17.
- **SP**. The Stacks Project Authors, *The Stacks Project*. online version. [Source](https://stacks.math.columbia.edu/tag/0954). Locations used: Tag 0954, Lemma 47.8.2, statement and proof; stable tag in place of page number; Tag 0A6R, Lemma 47.9.1, geometric localization complex; §47.10, local cohomology for Noetherian rings and comparison map; Tags 0AH2 and 0AH3, regular completion and henselization of G-rings; Tag 09XI (Lemma 15.11.6), Gabber's criterion for henselian pairs; Tag 04D1 (Lemma 10.143.10), lifting étale algebras along a quotient.
- **C19**. Kęstutis Česnavičius, *Purity for the Brauer group*. arXiv:1711.06456v4, 1 December 2018; internal date 4 December 2018; preprint pagination. [Source](https://arxiv.org/abs/1711.06456v4). Locations used: §1.5 p.3.
- **R70**. Michel Raynaud, *Spécialisation du foncteur de Picard*, Publications Mathématiques de l’IHÉS 38 (1970), pp.27–76. [Source](https://www.numdam.org/item/PMIHES_1970__38__27_0/). Lemma 6.2.2, p.51.
