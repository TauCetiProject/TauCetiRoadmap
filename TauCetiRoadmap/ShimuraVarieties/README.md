# Roadmap: complex Shimura varieties and canonical models

**Summary.** Construct the complex analytic and algebraic towers attached to pure Shimura data, their Baily–Borel compactifications, and canonical models over their cocharacter reflex fields. The arithmetic input is reduction theory and adelic levels; the geometric input is Hermitian domains, analytification and scheme descent. Complex multiplication first constructs the Siegel model, from which Hodge and abelian-type existence follow. A separate marked-conjugation construction handles general data, including exceptional Hermitian factors. The resulting towers carry finite level maps, right translations, ordered Hecke correspondences, component reciprocity and arithmetic minimal compactifications.

## Scope and ownership

This roadmap owns the passage from an actual Shimura datum to its analytic quotient, its automorphic compactification, and its special-point canonical model. It also owns the CM calculations needed to establish the canonical condition, the connected/full reconstruction, marked conjugation and effective canonical descent. The modular examples identify these constructions with the existing elliptic moduli objects as schemes over their stated fields, including pairing components and cusp parameters.

The datum/domain foundations, cocharacter class and reflex field, special pairs, effective stabilizers and Hodge/abelian-type predicates are constructed in prerequisite §§P.1–P.4 here. General level commensurability, neat-level existence, reduction, strong approximation, local simply connected torsors and class-set abelianization belong to AdelicAlgebraicGroups, §§3–4. The retained stabilizer and component results specialize those contracts to the effective Hermitian action and its positive rational component image.

Structural reductive groups, root subgroups and Weil restriction belong to ReductiveGroups and ReductiveGroupsPartII. ComplexComparisonPartII Layer `C−1` owns the analytic locally ringed category and scheme analytification; §§C0.7 and `C1`.9 supply analytic étale descent and proper coherent GAGA. Its Layers `C0, C2` and `C4` supply coherent analytic modules, the ideal/section/bundle comparisons and ordinary projective Chow. Finite analytic quotients, the quasi-projective scheme quotient extension, continuous field descent and the independent `o`-minimal inputs are targets here. ArithmeticLocallySymmetricSpaces supplies properness and arithmetic quotients; the extra rigidity inputs are constructed here before Layer 7.

Rational polarized Siegel moduli and their analytic families are constructed in §5.0 before canonical existence. The genus-one comparisons and normalized CM action are proved in §§5.11–5.13 and 8.9–8.13. AbelianSchemesAndArithmeticModuli supplies duals, torsion, realizations and the analytic weight-one equivalence; this roadmap owns its algebraization and CM arithmetic application. NeronModelsAndSemistableAbelianVarieties supplies semistable inertia and Néron–Ogg–Shafarevich. This roadmap also owns the CM types, reflex fields and reflex norms of Section 5.1.

ModularCurves owns full ordered-basis, fixed-pairing, fine `Γ₁` and coarse `Γ₀` moduli. ModularCurvesPartII owns their analytic comparison and generalized-elliptic compactifications. ClassFieldTheory owns arithmetic reciprocity and the cyclic Hasse norm theorem. Completed/RestrictedProducts and the Tau Ceti restricted-product library supply adelic carriers; no second restricted-product construction is needed here. Manifold gluing is also imported from Tau Ceti. General analytic spaces with nilpotents use ComplexComparisonPartII §C−1.1; invariant finite analytic quotients and holomorphic bundle descent are constructed in §P.6.

Arithmetic toroidal compactifications, integral and bad-prime models, automorphic bundles, intersection cohomology, and étale cohomology of Shimura varieties are downstream. ShimuraCompactifications supplies no input here: only the independent complex cusp-chart theorem used in the definable argument is required below. Arithmetic minimal descent uses intrinsic logarithmic top differentials and generalized-elliptic curves. The compactification statements use actual auxiliary canonical models; §8.16a constructs the broader finite-domain pure models needed in Pink’s reduction.

## Conventions

All algebraic groups are connected reductive over `ℚ`. A pure datum `D=(G,X)` satisfies the `SV1`–`SV3` axioms of §P.1; `X` is its actual class of homomorphisms from the Deligne torus, with its supplied complex structure. Fix an embedding `E(D)↪ℂ`, a component `X⁺`, and a compact open `K⊂G(𝔸_f)`. Write `G(ℚ)₊` for the inverse image of `Gᵃᵈ(ℝ)⁺`. The component stabilizer `Γₐ=G(ℚ)₊∩aKa⁻¹` may contain central units acting trivially. Freeness, proper discontinuity and covering degrees refer to its effective image on `X⁺`. Compact ineffective adjoint factors are removed only in that image.

The point relation is `[x,a]=[qx,qa k]`, with `q∈G(ℚ), k∈K`. Right translation sends `[x,a]` to `[x,ag]` at level `g⁻¹Kg`; applying `g` and then `h` gives `gh`. For example, with `u=[[1,1],[0,1]]` and `v=[[1,0],[1,1]], uv=[[2,1],[1,1]]` while `vu=[[1,1],[1,2]]`. These matrices distinguish the order. The Hecke apex is `K∩gKg⁻¹`; for `g=diag(p,1)` at maximal `GL₂` level, its mod-`p` reduction is lower triangular and fixes the line `𝔽_p e₂`. Its index is `p+1`, including 3 at `p=2`.

Reciprocity `rec_F` has arithmetic Frobenius normalization. Define `art_F(s)=rec_F(s)⁻¹` in its abelian target. Thus an unramified uniformizer maps to inverse arithmetic Frobenius. For a finite unit `u` in the cyclotomic example, `χ_cyc(rec_ℚ(u))=u⁻¹` and `χ_cyc(art_ℚ(u))=u`. Every reflex norm is a product of conjugate cocharacters. On a split `G_m` with cocharacter `t↦tⁿ` it sends `s` to `sⁿ`: `n=0` gives `1, n=−1` gives `s⁻¹`. Full-idelic formulas retain the real component; finite-idelic formulas alone are insufficient for determinant component reciprocity.

Homology has Hodge types `(−1,0),(0,−1)`. A full CM action may be by a nonempty product CM algebra `E`, of dimension `2 dim A`; a degree-two action on an abelian surface is insufficient. Integral Tate freeness requires the maximal order, or a separately supplied invertible lattice. Polarizations retain their Tate twist. With `α(r_Φ(s)x)=σx` the polarization multiplier is `χ_cyc(σ)/N(s)`. For an elliptic CM type with quadratic reflex field, take the principal finite idele `s=2` and `σ=id`. Its norm is 4, the comparison `α` is multiplication by 1/2, and the pairing multiplier is 1/4.

Canonical automorphic degree `n` means a tensor power of top differentials with the ambient Jacobian pullback. On `ℍ` this is classical weight `2n`. At a genus-two Siegel boundary of genus one the ambient weight is `3n`, rather than the intrinsic boundary weight `2n`; at `n=2` the retained weight is 6, the intrinsic elliptic degree is 3. Admissibility means the transported coefficients extend continuously to the Satake boundary and holomorphically on each stratum. It is not the cusp condition: `E₄` at `Γ(3)` has canonical degree 2 and constant term 1; `j` has a pole and is inadmissible.

The connected datum for a semisimple group is a `Gᵃᵈ(ℝ)⁺`-class of `S→Gᵃᵈ_ℝ` satisfying the connected Shimura conditions `(C1)`–`(C3)` (Milne 1983, Appendix, pp.262–263); this is the standing connected adjoint `S`-map convention of Layers 6–7. It need not lift to the simply connected group. For `SL₂` the fundamental `PGL₂` cocharacter is not an integral `SL₂` cocharacter. Connected canonical objects retain their congruence completion and adelic/Galois extension, not just their complex pro-variety. Identity conjugation is trivial; complex conjugation reverses the upper-half-plane marking even when the group twist remains split.

Full elliptic level uses a row `(P,Q)`. Right multiplication by `[[a,b],[c,d]]` gives `(aP+cQ,bP+dQ)`, with pairing raised to `det`. Thus `[[1,1],[0,1]]` sends `(P,Q)` to `(P,P+Q)`, and `[[0,1],[−1,0]]` sends it to `(−Q,P)`. Full fine level requires `N≥3`, fine `Γ₁` requires `N≥4`, and `Γ₀` is coarse at every positive `N`. Our `K₁` fixes the first column `e₁`. AdelicAlgebraicGroups §5.2 fixes the second row covector instead; only their `SL₂` intersections agree. These full compact opens are not related by basis-swap conjugation.

For `GL₂` the determinant component datum uses `Y=ℝˣ/ℝ_{>0}={±1}`. At principal `N`-level it has `φ(N)` geometric points and model `μ_N^prim`. Replacing `Y` by one point gives the strict torus datum, with `(ℤ/N)ˣ/{±1}` and the maximal-real cyclotomic model. At `N=3` these sets have two and one points respectively; at `N=1,2` the sign quotient has one point and the formula `φ(N)/2` is inapplicable. All isomorphisms and uniqueness statements retain the specified complex comparison. A normal compactification with the same open is not thereby the specified minimal compactification.

## Exact supplier contracts

### From Mathlib

Use `MulAction.orbitRel`, `MulAction.orbitRel.Quotient` and `MulAction.stabilizer` from `Mathlib.GroupTheory.GroupAction.Defs` for the actual orbit relation and subgroup. They supply no quotient topology or analytic structure. The analytic point specialization in Suggested.lean retains the two coordinates through a genuine product-group action.

Use `AlgebraicGeometry.Scheme`, its native morphisms, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.IsProper` and `AlgebraicGeometry.IsOpenImmersion`. Finite means affine with finite ring maps; proper means separated, universally closed and locally of finite type. These predicates do not assert any Shimura comparison. `IntermediateField.LinearDisjoint` is the actual subalgebra-based field relation used in the disjoint-reflex-field argument.

CM types use `NumberField.IsCMField` from `Mathlib.NumberTheory.NumberField.CMField` for the factors of a CM algebra, the conjugate embedding `NumberField.ComplexEmbedding.conjugate φ = star φ` (with `RingHom.involutiveStar`), and `IntermediateField.adjoin` and `IntermediateField.adjoin_le_iff` for the reflex field. `Algebra.norm` and `LinearMap.det` supply the determinants in the reflex norm.

The canonical level tower is a `CategoryTheory.Functor` into `CategoryTheory.Over (Spec E)`. Base change is `CategoryTheory.Over.pullback` under its `HasPullbacksAlong` hypothesis, with `Over.pullbackId` and `Over.pullbackComp` as natural isomorphisms. The Hecke diagram is the native `CategoryTheory.Limits.span`; its ordered arrows are `WalkingSpan.Hom.fst` and `.snd`. `Limits.spanCompIso` supplies the natural comparison after applying a functor. These native category constructions are used directly.

### From Tau Ceti

`TauCeti.Geometry.Manifold.Gluing` supplies `TauCeti.chartedSpaceOfIsOpenEmbedding` and `TauCeti.isManifold_chartedSpaceOfIsOpenEmbedding`. Their inputs are a covering family of open embeddings of charted pieces and locally compatible `ContMDiffAt` deck maps. `TauCeti.contMDiff_chartedSpaceOfIsOpenEmbedding` and `TauCeti.partialDiffeomorphOfIsOpenEmbedding` identify the smooth chart inclusions. Apply them over `ℂ` with analytic regularity once the quotient charts and holomorphic deck maps have been established. This imports manifold atlas transport; locally `ℂ`-ringed finite quotients use §P.6 and nilpotent analytic spaces use the analytic category below.

Tau Ceti's `TauCeti.Topology.Algebra.RestrictedProduct.Basic` supplies `TauCeti.integralSubgroup`, `TauCeti.isOpen_integralSubgroup` and `TauCeti.isCompact_integralSubgroup`: the integral subgroup is open when each reference subgroup is open, and compact when each is compact. `TauCeti.Topology.Algebra.RestrictedProduct.Map` supplies `TauCeti.restrictedProductMap` and `TauCeti.continuous_restrictedProductMap`, assuming coordinate homomorphisms preserve the reference subgroups at almost every index and are continuous. `TauCeti.Topology.Algebra.RestrictedProduct.Diagonal` supplies `TauCeti.rationalDiagonal`; its continuity theorem additionally requires one cofinite set on which every source point is integral, rather than only a separate almost-everywhere condition for each point. `TauCeti.Topology.Algebra.RestrictedProduct.TopologicalSpace`, `TauCeti.isOpen_restrictedProduct_iff`, tests openness on the principal stages. AdelicAlgebraicGroups §§1.1–1.5 adds integral-model and level interpretation to these native restricted-product carriers.

`TauCeti.AlgebraicGeometry.Quotient.Affine` supplies `TauCeti.AffineInvariantQuotient.quotient` and `.projection`, the spectrum of the fixed subring and its affine-target universal property. `TauCeti.AlgebraicGeometry.Quotient.FiniteGroup.Affine` supplies `.isFinite_projection_of_finiteType`, `.isQuotientMap_projection` and `.projection_eq_iff_exists_smul`. For a finite group acting on a commutative algebra of finite type over an invariant base, the projection is finite, integral and surjective; its point fibres are precisely the group orbits. This imports the affine invariant construction. Invariant affine covers, scheme gluing, descended ampleness and the free-action torsor comparison use the roadmap contracts below.

### Analytic category and common arithmetic extensions

Use ComplexComparisonPartII §C−1.1, `ComplexAnalyticSpace` and `complexSchemeAnalytification`, for complex analytic spaces locally presented as `(V(I), O_U/I)`, including nilpotents, open/closed subspaces, gluing and fibre products. Analytification represents locally `ℂ`-ringed morphisms to finite-type complex schemes and preserves products, immersions and étale/smooth charts. The holomorphic vector-bundle dictionary is ComplexComparisonPartII §C0.3. Finite actions with fixed points and bundle descent use §P.6 here; ComplexComparisonPartII §C−1.2 supplies the locally separated algebraic-space analytic quotient, and §C0.7 / `analyticEtaleDescent` supplies coherent analytic gluing along its étale presentation.

For the main CM theorem import GL2AutomorphicRepresentationsAndTransfer §R16.1.7 /` chevalley_finiteIndex_congruence` with its finitely generated subgroup `E=U` and empty excluded-place set. Deduce the global-unit topology comparison and CM `closure` quotient in §5.9a here. Import the cyclic quadratic norm local-global theorem separately from **ClassFieldTheory Layer 13**, `cyclicHasseNorm` and `isGlobalNorm_iff_isLocalNormEverywhere`, with all finite and infinite places retained. Apply these inputs componentwise to product CM algebras.

For marked conjugation import the relative/global Weil extensions from [GL2AutomorphicRepresentationsAndTransfer §R17.5.0](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r17-5-global-weil-group), on its chosen carriers with their projections, fundamental classes, transition maps, local maps and reciprocity comparisons. Generic transfer and field-tower coherence belong to this same supplier contract, using ClassFieldTheory Layer 11’s class formation and norm laws. Section 7.0 here owns the Serre protorus, Serre-torus pushouts, proalgebraic Taniyama extension, finite-adelic section and marked torsors, including the compatibility of these constructions with the imported Weil data. Section 7.5 owns their Shimura marked comparison.

### From the neighbouring roadmap layers

The following contracts specify mathematical inputs, within the scope of their named repository targets. Additional contracts are constructed by the local prerequisite targets below. A roadmap specification supplies a build obligation; the input must be proved before it is used as a theorem.

**[AdelicAlgebraicGroups, Layer 3, reduction and arithmetic quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients).** Import AdelicAlgebraicGroups §3.4 / Reduction.`levelArithmetic_commensurable` for arbitrary compact-open levels and representatives. Section 0.1 constructs the bridge from an integral-model compact level to `G(ℚ)∩GL_n(ℤ)` for every faithful rational embedding, and arithmeticity of the effective domain image after removing compact ineffective factors. Preserve the finite-index rational component subgroup. Import class-number-finite separately; Layer 0 does not replan reduction or pairwise commensurability.

**[AdelicAlgebraicGroups, Layer 4, approximation, neat levels and Hecke maps](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps).** Layers 0–1 specialize the real-stabilizer version of level-covering-map to the Shimura effective-domain quotient: remove the actual central/compact ineffective kernel before asserting freeness or quotient-action degree. Supply finite topological level maps, the effective kernel of a normal `K/K′` action and the generic double-coset combinatorics of Hecke spans. The supplier's single-intersection Cartesian comparison requires both neat `U` and `U′L=U`. Section 1.5 owns the analytic comparison: a literal geometric decomposition requires an effective-free common target; arbitrary coarse targets use the normalization of the reduced fibre product. Arithmetic neatness remains owned by §P.4 / AdelicAlgebraicGroups §4.3. Distinguish the effective normal-level quotient action from the full automorphism group over the base of a disconnected cover. Specialize the existing class-set/Kneser/Hasse theorems for components; import AdelicAlgebraicGroups §4.5 integral almost-all-prime lifts and finite-adelic abelianization, and require only the positive rational component image and local openness specialization of SVI 5.20–5.21.

**[ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action).** Import symmetric-space properness and effective arithmetic quotient/manifold results on their stated domains. Finite normalizer index and ranked `S`-arithmetic rigidity are the local targets §§7.0c–7.0d; neither is inferred from proper discontinuity.

**[ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).** Import rational parabolic/root, maximal-torus, Weyl and reductive structural theory. Real approximation and the real-torus specialization are §P.5; global centre cohomology and adjoint comparison are §7.0e. The restriction-of-scalars classification, CM splitting, root subgroups and root-centre comparisons are constructed in §§7.1–7.4. The norm and approximation steps for the quadratic splitting torus use §7.0f and ClassFieldTheory Layer 13. Section 7.7 owns the marked central adjustment from the Platonov–Rapinchuk perfection theorem.

**[ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus).** Import the existing ReductiveGroups Part II finite-free Weil restriction of affine group schemes and descent/splitting interfaces, applying them to field extensions here. The reflex norm uses its split character/cocharacter products, torus norm, base-change and diagonal-embedding compatibilities; construct the norm/cocharacter specialization in §§P.3, 4.2 and 4.9 without rebuilding general Weil restriction.

**[ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification).** Analytification as locally `ℂ`-ringed spaces, including nilpotents, with products, open/closed immersions, étale local isomorphisms and smooth manifold comparison; faithful comparison of morphisms, with finite invariant quotients constructed in §P.6. ComplexComparisonPartII §§C−1.1–C−1.2 supply the analytic category, locally ringed comparisons and completed analytic stalks; §C0.7 supplies coherent analytic étale descent, and §C1.9 supplies proper coherent GAGA. Finite invariant analytic quotients and equivariant bundle descent are the local target §P.6. At the manifold level use Tau Ceti’s open-embedding gluing with holomorphic deck maps. Apply étale chart comparison to strict-SNC punctured-polydisk coordinates.

**[ComplexComparisonPartII, Layer C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c2-projective-and-proper-consequences-of-coherent-gaga).** Use `projectiveComplexGaga` and `properSchemeGagaEquivalence` from [ComplexComparisonPartII §C1.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c19-projective-and-proper-coherent-gaga) for coherent GAGA, then ComplexComparisonPartII §§C2.1–C2.2 for its coherent ideal, section and bundle comparisons. Apply these to the automorphic compactification constructed in Layer 2.

**[ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison).** Import Chow for closed projective analytic subspaces and graph algebraicity between proper schemes. The independent KUY cusp charts, `R_an,exp o`-minimality, nilpotent-orbit/Hodge-norm estimates, polarized period-map definability and Peterzil–Starchenko definable Chow are constructed in §§3.5a–3.5d here before the alternative Borel argument; they use no arithmetic toroidal model.

**[ModularCurves, layer 0 scheme theoretic prerequisites](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#layer-0-scheme-theoretic-prerequisites).** Import Layer 0D’s already specified equivalence between finite continuous absolute-Galois sets and finite étale field schemes, with products and morphisms. Import Layer 0C’s invariant affine quotient/free-action API directly. The affine invariant quotient is supplied by Tau Ceti as specified above; ModularCurves §0C supplies the invariant-affine-cover free-action quotient and torsor comparison. Section 3.4a here supplies the quasi-projective quotient outside the projective-source domain of SchemeAndStackFoundations §1.17.

**[ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity).** Import ClassFieldTheory Layer 11 arithmetic Artin reciprocity, continuity and kernel, norm/restriction compatibility, and Layers 12–13 ray class fields and generation by good primes. Invert its arithmetic Frobenius convention in `geometricArtin`. Import Layer `13 cyclicHasseNorm` for the quadratic CM norm step; §5.9a deduces the unit-topology and CM `closure`-quotient consequences of GL2AutomorphicRepresentationsAndTransfer §R16.1.7. The CM norm-kernel deduction itself is constructed in Layer 5.

**[AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent).** Import the stated polarized fpqc descent and scheme comparisons. Continuous infinite-transcendence field descent, invariant morphisms and closed subschemes are constructed in §4.9b here. Flat base change of global sections in the consumers of §4.9b, including §8.18, uses [SchemeAndStackFoundations §2.6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#26-quasi-coherent-cohomology), `qcoh_higherDirectImages` in degree zero, with qcqs structure map and quasi-coherent sheaf. Invariant morphisms and closed ideals use §4.9b separately; dense-open equality retains reduced source and separated target.

**[AbelianSchemesAndArithmeticModuli, Layer A2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a2-duality-polarizations-and-ample-classes).** Dual abelian schemes, rational polarizations and Rosati involutions, with `E`-conjugation compatibility and functorial alternating pairings. Separate positive rational similitudes from integral polarization degree.

**[AbelianSchemesAndArithmeticModuli, Layer A3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a3-isogenies-finite-flat-quotients-torsion-and-pairings).** Finite torsion group schemes and finite flat quotients, quasi-isogeny effects on integral and rational Tate modules, and the polarized Weil pairing with its Tate twist and finite-level symplectic comparison.

**[AbelianSchemesAndArithmeticModuli, Layer A4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a4-realizations-and-deformations).** Degree-one Betti/de Rham/étale comparison, rational and integral Tate realizations and `Lie`-eigenspace comparison, including faithful action of quasi-isogenies.

**[AbelianSchemesAndArithmeticModuli, Layer A5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a5-complex-uniformization-and-families).** The analytic equivalence of polarizable integral homological type `(−1,0),(0,−1)` variations with polarized complex abelian families, with morphisms, base change and integral levels. The converse algebraization over algebraic bases is Layer 5 after §5.0 and Borel; `A5` must not use Layer 5 to provide its analytic equivalence.

**[AbelianSchemesAndArithmeticModuli, Layer A6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a6-arithmetic-hom-and-exports).** Endomorphism-algebra semisimplicity, full-CM action/rank-one Betti consequences, and rigidity and number-field spreading of endomorphisms. The Frobenius proof instead imports the existing all-characteristic scalar-extended `Hom` injectivity, finite-rank, characteristic-polynomial and normal-base extension theorems; no stronger positive-characteristic Tate theorem is required.

**[SchemeAndStackFoundations, §§1.17–1.23, quotients and stacks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#117-categorical-and-geometric-quotients-and-artins-bootstrap).** Import §1.17, `finiteGroupQuotient_projective`, only for finite actions on projective schemes over a Noetherian base, with its invariant sheaf, ample-power and flat-base-change laws. The characteristic-zero normal quasi-projective quotient and descended ample power are constructed in §3.4a here from the pinned affine invariants.

**[AlgebraicModuliForArithmeticGeometry, §2.1, Hom and Isom schemes](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#21-hilbert-families-and-graph-parameters).** Import `homAndIsomSchemes` only for its projective flat source and quasi-projective target. The cocharacter incidence of §4.9a is constructed here by splitting the family of tori and selecting a finite Weyl/Galois orbit; `G_m` is not a projective source.

**[AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization).** Use §5.4 for schematic closures and normalization and §5.3 for finite correspondences. Finite group quotients of normal quasi-projective characteristic-zero schemes use §3.4a here; free actions give effective torsor quotients. Descent of finite, surjective and étale morphisms uses ModularCurves §§0C and `0E` and the field-descent contract in Exact supplier contracts. Normal projective curve compactifications use AlgebraicCurves Layer 12. Scheme-theoretic `closure` must commute with extension of fields, retaining the specified ambient scheme.

**[InverseGaloisAndArithmeticFundamentalGroups, §§IG.2.4 and IG.2.7, Hilbert specialization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md#ig27-weak-approximation-local-conditions-and-norm-pullbacks).** Use Hilbert subsets defined by integral finite étale covers and Hilbert specialization with local conditions over `ℚ`. For the incidence `W → V` retain the constant field `E(D)`: its geometric irreducibility is over `E(D)`, so `W×_{E(D)}L` remains integral for each finite `L/E(D)`. Connected specialization of that cover at `v∈V(Q)` in the prescribed real open gives linear disjointness over `E(D)`. No geometric irreducibility of `W/Q` is required.

**[ModularCurvesPartII, §§1.2–1.5, lattice uniformization and the analytic Weil pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#15-the-analytic-weil-pairing-comparison).** Uniformisation `E(ℂ) ≅ ℂ/Λ` with `H₁(E,ℤ) = Λ`, compatible with Tate modules and full level-`N` bases, and the analytic formula for the scheme-theoretic Weil pairing; in particular the reference root `ζ_ref = e_N(τ/N, 1/N)` on `ℂ/(ℤ τ + ℤ), Im τ > 0`, is independent of `τ` (this calibration fixes the root convention of Layer 8).

**[ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level).** Analytic uniformization of the full ordered level `N ≥ 3`, fixed-pairing, `Γ₁ (N ≥ 4)` and coarse `Γ₀` (every `N > 0`) curves as isomorphisms, with the ordered-basis determinant identified with the chosen root of unity. Import [AdelicAlgebraicGroups §5.2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#52-gl₂-over-ℚ-and-principal-levels) separately for its adelic/analytic component calculation. Their comparison is constructed here in §§5.0 and 8.9–8.13, including the genus-one moduli identification, full-level components and determinant/Weil-pairing laws.

**[ModularCurvesPartII, §§6.1–6.2 and 4.8, compact comparison and cusp parameters](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#61-compact-analyticalgebraic-modular-comparison).** Cusp labels, effective stabilizers and widths, analytic parameter `exp(2 π i z/w)` and its transformation under level maps.

**[ModularCurvesPartII, §4.10, geometric connectedness of a fixed-pairing curve](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#410-geometric-connectedness-of-a-fixed-pairing-curve).** Open fixed-pairing fibre geometrically connected and irreducible, deduced from `Γ(N)` quotient without importing arithmetic compactification.

**[ModularCurvesPartII, §§7.1a, 7.3–7.4 and 9.1–9.3, differentials and isogeny correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#71a-kodairaspencer-normalization-r125).** The basic isogeny correspondences on the modular curves (both legs as moduli maps), their description on the upper half-plane, and the pullback and trace normalization of the Hecke action on differentials. Layer 8 supplies the adelic dictionary for nonintegral `g` through its row-basis comparison; ModularCurvesPartII supplies the geometric isogeny legs and their action on differentials.

**[ModularCurvesPartII, §§8.3–8.5, component fields, conjugation and level compatibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#83-component-fields-and-symplectic-descent).** Compatibility of the analytic–algebraic comparison with level changes, diamond operators and complex conjugation; fields of definition of the components and of the canonical cusp. Residue fields of all cusps come from ModularCurvesPartII §§4.1–4.8, 5.11 and 6.3.

**[ModularCurvesPartII, §§5.2, 5.15–5.16 and 5.19, coarse compactifications](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#52-integral-coarse-modular-curves).** Characteristic-zero coarse compactifications for full/composite levels and finite quotients; do not substitute the prime-level diamond quotients of ModularCurves Layer 10.

**[ModularCurvesPartII, §§4.1–4.8, 5.11 and 6.3, formal cusps and cusp fields](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#63-cusp-fields-and-pairing-components).** Normal proper generalized-elliptic compactification, boundary subscheme and formal Tate charts over actual cusp residue fields, compatible with the full/coarse open and all finite legs.

**[ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing).** Existing full ordered-basis scheme for `N ≥ 3` and its row-action/Weil-pairing convention; fixed-pairing model after cyclotomic base change. ModularCurvesPartII §§1.2–1.5 and ModularCurvesPartII §3.14 supply the analytic comparison.

**[ModularCurves, 5a tate normal form and y₁n for n4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5a-tate-normal-form-and-y₁n-for-n4).** Existing fine `Γ₁` moduli scheme for `N ≥ 4` with a point of exact order; the `K₁` stabilizer dictionary uses the first row-basis generator.

**[ModularCurves, 9e the coarse j line and y₀n](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#9e-the-coarse-j-line-and-y₀n).** Existing characteristic-zero coarse `Γ₀` cyclic-subgroup moduli: `Y_0(1)` is the coarse `j`-line and, for `N ≥ 3, Y_full(N)/B` by the coarse Borel-quotient formula. No universal elliptic family is claimed.

**[ModularCurves, 0d finite étale schemes and galois actions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#0d-finite-étale-schemes-and-galois-actions).** The equivalence between finite étale `K`-schemes and finite continuous `Gal(K^s/K)`-sets over a field `K`, used to attach a scheme to the Galois set of formula `(64)`.

**[ModularCurves, 9d coarse moduli schemes and finite quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#9d-coarse-moduli-schemes-and-finite-quotients).** Coarse moduli `M([Γ₀(N)])` as a finite quotient of a rigidified representable cover, for `N = 2`, where `9E`'s Borel-quotient formula is not used.

## How to read the build

Layers 0–3 construct arithmetic components, the complex tower, its minimal compactification and algebraicity. The extension of general datum maps, the codimension-one complex partial extension and its logarithmic section embedding follow the algebraization of maps and finite quotients in Layer 3. The earlier full-ring argument uses its own local cusp/logarithmic calculation on the separating projective realization; it does not invoke that later global linear-system theorem. Layer 4 fixes canonical reciprocity and proves the three foundational descent results—disjoint special reflex fields, descent of translations and uniqueness—conditionally on actual models. They precede the existence constructions, so inheritance and independence do not depend on the final tower theorem. Layer 5 constructs the CM and Siegel instance; Layer 6 gives the Hodge/abelian-type route. Layer 7 supplies a separate general-data route. Layer 8 applies conditional tower and compactification functoriality to whichever existence route supplied the models. Its abelian-type application does not use Layer 7; §8.16a constructs its auxiliary finite-domain models from the abelian-type strict models. Suggested.lean records the point and reciprocity interfaces over native group carriers, the CM types of Section 5.1 over Mathlib's complex embeddings, and representative categorical assembly and ordered-span laws on supplied diagrams. Analytic topology, schemes and the remaining heavy constructions are developed through the targets below.

## Prerequisites constructed here

Sections P.1–P.5 precede Layer 0; P.6 precedes §1.2. These constructions use ReductiveGroups, ReductiveGroupsPartII RG2.0a, RepresentationTheory/LieGroups' Cartan and symmetric-space theory, and the analytic category specified above. The Deligne torus is their actual Weil restriction `S=Res_{ℂ/ℝ}G_m`, with `S(ℝ)=ℂ×` and split coordinates `(z,z̄)`.

### P.1 Pure data and special pairs

**Target.** `TauCeti.Shimura.PureDatum`. Construct the pure datum and its category. A datum consists of a connected reductive `ℚ`-group `G` and a nonempty full `G(ℝ)`-conjugacy class `X` of algebraic `h:S→G_R`. Require `SV1: Ad∘h` has types `(−1,1),(0,0),(1,−1)`; `SV2: Int(h(i))` is Cartan on `G_R^ad`; `SV3: h` is nontrivial on each `ℚ`-simple adjoint factor. Morphisms are rational group maps carrying the actual class into the target class. Construct products and adjoint data, with identity/composition and their point maps. A special pair retains a rational torus immersion `T→G` and `h` factoring through `T_R`; specialness means existence of this factorization. Hodge type means a rational closed immersion into a Siegel datum, and abelian type means a central derived isogeny inducing an isomorphism of the connected adjoint data with a Hodge-type datum. A central isogeny lifts a full datum only when an algebraic `S`-lift is supplied.

The central inverse-diagonal weight is independent of `h`. Rationality of this weight is a separate predicate. Construct the connected adjoint `S`-map convention `(C1)`–`(C3)`, and show that it is invariant under central covers without requiring a lift to the cover. Provide conjugation invariance of all axioms, the special-pair map under datum morphisms and the product/adjoint comparisons. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), Definitions 5.5 and 12.5, §§4–5 and 14, pp.47–57,113,127–128; [Milne 1983](https://jmilne.org/math/articles/1983a.pdf), Appendix, pp.262–263.)

**Checks.**

- Every rational torus with an algebraic `S`-map gives a singleton datum; trivial `h` is permitted for a torus.
- `GL₂` with its usual elliptic `h` has `X=H±`, including both components.
- The fundamental `PGL₂` cocharacter need not lift to `SL₂`; the connected datum still exists.

### P.2 Hermitian components

**Target.** `TauCeti.Shimura.hermitian_components`. Construct the complex structure on `X` and its components from P.1. Identify the tangent space at `h` with `g_R/Lie Z_{G_R}(h)`, using the differential of the actual orbit map. The two nonzero adjoint Hodge types define the complex structure; prove its integrability and `G(ℝ)`-invariance. Identify each component with a Hermitian symmetric domain, give its bounded realization and prove that the action by `G^ad(R)^+` is holomorphic. Construct the finite component set and show that the stabilizer of a chosen `X+` is the inverse image of `G^ad(R)^+`. Record the central and compact ineffective kernel of the domain action. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), Theorem 1.21 and §§4–5, especially 5.7–5.10, pp.17–18,47–56.)

**Checks.**

- The `GL₂` components are the upper and lower half-planes with their holomorphic complex structures.
- A torus has a zero-dimensional component and zero tangent space.
- Compact real adjoint factors have zero tangent contribution; central units can act trivially without being finite.

### P.3 Hodge filtrations and reflex fields

**Target.** `TauCeti.Shimura.hodge_reflex_foundations`. Construct the representation–Hodge dictionary needed for the datum. With homology convention, `h_C(z₁,z₂)` acts on type `(p,q)` by `z₁^(−p)z₂^(−q)`; `μ_h(z)=h_C(z,1)`. Prove conjugation, tensor, dual and Tate compatibilities from split `S`-characters. For an actual datum the complex structure of P.2 makes the Hodge filtration of every rational representation a holomorphic variation; a faithful representation gives the Borel embedding into its compact flag variety. Construct integral lattices stable under an arithmetic subgroup. Under the rational-weight and Cartan-on-`G/weight` conditions, construct the polarized homogeneous variations used in §3.7; for general data use the faithful adjoint representation, which has weight zero and admits such a polarization after passing to effective arithmetic image.

Define the cocharacter conjugacy class and `E(D)` as the fixed field of its open stabilizer in `Gal(ℚ̄/ℚ)`. Prove finite degree, independence of `h`, containment `E(D′)⊂E(D)` under every datum morphism, and equality with the field of definition of the conjugacy class. For tori retain the individual cocharacter. Construct torus norm products and base-change comparisons from RG2.0a's Weil restriction; §§4.2 and 4.9 own their reciprocity specialization. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), §§2 and 4, Proposition 5.9, §12, pp.21–30,47–56,111–114.)

**Checks.**

- Elliptic homology has types `(−1,0),(0,−1)` and `μ` has exponents 1,0.
- The Siegel reflex field is `ℚ`, while the selected Gaussian torus has reflex field `ℚ(i)`.
- Rational weight is not automatic for a torus `S`-map; the adjoint weight-zero variation remains available.

### P.4 Levels and basic examples

**Target.** `TauCeti.Shimura.level_foundations`. Construct the compact-open level interface on the actual finite adelic group supplied by AA.1, with intersections, conjugation and rational component stabilizers. Adopt AdelicAlgebraicGroups §4.3's `Neat.IsNeatLevel` and `Neat.exists_isNeatLevel_le`, including their faithful algebraic representation hypothesis. For the effective domain image of a rationally neat arithmetic subgroup, prove trivial point stabilizers using compactness and neatness; retain the ineffective kernel separately. Construct the `GL₂`, genus-`g` Siegel `(g≥1)`, strict singleton torus and terminal genus-zero examples, with their `S`-maps, domain and reflex-field comparisons. Construct the CM torus from the types of §5.1 when that layer is used; no CM theorem is an input to Layers 0–3. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), Proposition 3.5, §§5–6 and Example 12.4(b), pp.34,57–70,112.)

**Checks.**

- `GL₂` principal level `N≥3` is rationally neat; `N=2` retains `−I`.
- An infinite ineffective central kernel is removed before the effective freeness assertion.
- The terminal genus-zero datum has one point and reflex field `ℚ`.

### P.5 Real approximation and maximal tori

**Target.** `TauCeti.Shimura.real_approximation_tori`. For a connected `ℚ`-algebraic group prove that `G(ℚ)` is dense in `G(ℝ)`; intersecting with the open component stabilizer gives the positive rational approximation used in §4.8. For reductive `G` in characteristic zero, construct the regular semisimple open `V⊂Lie(G)`, its family of centralizer maximal tori and its nonempty real open of tori compact modulo the centre in the Shimura situation. Near a regular element in a given real torus, prove that these real tori are conjugate to it; do not assert conjugacy of all real maximal tori. Also prove connectedness of a cocharacter centralizer and geometric conjugacy of its maximal tori, used in §4.9a. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), revision September 16, 2017, Theorem 5.4, p.54; [Appendix A, “Proof of Theorem 5.4 (real approximation)”](https://jmilne.org/math/xnotes/svi.pdf#page=152), pp.152–154; Lemma 13.3 and footnote 72, pp.117–118; [Deligne 1971](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.1.2, pp.153–154.)

**Checks.**

- `ℚ×` is dense in `ℝ×` and positive rational points are dense in `ℝ>0`.
- Split and compact maximal tori of `SL₂/R` are not conjugate; local conjugacy retains the real component of the torus parameter.
- A regular nilpotent is excluded from `V`; its centralizer need not be a torus.

### P.6 Finite analytic quotients and bundle descent

**Target.** `TauCeti.Shimura.finite_analytic_quotient`. For a finite group `H` acting holomorphically on a Hausdorff complex analytic space `Z` in the supplied nilpotent-sensitive category, construct `q:Z→Z/H` with the orbit topology and `O_{Z/H}=(q_*O_Z)^H`. Give finite local analytic invariant-algebra presentations, the invariant-map universal property, open restriction and uniqueness of gluing. If `Z` is normal, prove normality of the quotient and identify invariant meromorphic function fields on each preserved irreducible component (with component permutations retained). For an `H`-equivariant holomorphic vector bundle, prove descent to a vector bundle on the coarse quotient exactly when every point stabilizer acts trivially on its fibre. Pullback and invariant pushforward give the inverse comparison, also on singular charts. Prove that finite algebraic invariant quotients over `ℂ` analytify to this construction. Build this before §1.2 and use it for boundary sheaves in Layer 2. ([H. Cartan, Quotient d'un espace analytique par un groupe d'automorphismes](https://doi.org/10.1515/9781400879915-007), pp.90–102; invariant fibre averaging in characteristic zero supplies the bundle comparison.)

**Checks.**

- The involution `z↦−z` on `ℂ` has quotient coordinate `z²` and ramifies at zero.
- The trivial line with sign action on its fibre at zero does not descend as a vector bundle; the trivial fibre action does.
- On `C[ε]/(ε²)` with trivial action the quotient retains `ε`; passing to the reduced space loses its structure sheaf.

## Layer 0: Arithmetic stabilizers and components

### 0.1 Arithmetic component stabilizers

Prove `TauCeti.Shimura.stabilizer_arithmetic` as follows. For a pure datum `(G,X)`, component `X⁺`, compact open `K` and `a∈G(𝔸_f), Γ_a=G(ℚ)_+∩aKa⁻¹` is an arithmetic subgroup of `G(ℚ)`, of finite index in `G(ℚ)∩aKa⁻¹`. Its image in the effective real automorphism group of `X⁺` is arithmetic and discrete. `G(ℚ)_+` means the inverse image of `G^ad(R)^+`, with compact adjoint factors removed only in the effective image.

Import AA §3.4 and Reduction.`levelArithmetic_commensurable` for arbitrary compact-open levels and adelic representatives. Identify one integral-model level with the faithful `GL_n(ℤ)` definition of arithmeticity; require that comparison and the algebraic-image/effective-kernel specialization from AA.3. The retained conclusion concerns the component stabilizer and its effective domain image.

Passing to the finite-index component stabilizer preserves arithmeticity. The algebraic image theorem (Milne 3.2) and removal of the compact ineffective factor give a discrete arithmetic domain image.

Distinguish discreteness of `Γ` in all real group points from discreteness of its domain image: the latter is the input to the local datum foundations of §§P.1–P.4.

**Checks.**

- For `GL₂` at principal `N≥3`, the effective stabilizer of `ℍ` is the image of `Γ(N)`.
- A real-quadratic central unit can lie in `Γ_a` and act trivially on `X⁺`; no faithfulness assertion follows.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.2 and 5.13, pp.33,57–58; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §3.4; Suggested.lean, Reduction.`levelArithmetic_commensurable`.)

This uses [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [AdelicAlgebraicGroups, §3.4, arithmetic subgroups attached to a level](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#34-adelic-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, Layer 3, reduction and arithmetic quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory), with the exact supplier contracts above.

### 0.2 Commensurability of stabilizers

Prove `TauCeti.Shimura.stabilizer_commensurable` as follows. For fixed `G` and `X⁺, Γ_{a,K}` and `Γ_{b,L}` are commensurable for arbitrary a,`b∈G(𝔸_f)` and compact open `K,L`, since they are arithmetic in the same rational group. If `b=qak` with `q∈G(ℚ)_+, k∈K` and `L=K`, then `Γ_b=qΓ_aq⁻¹`, and `x↦qx` identifies their effective quotients.

Import Reduction.`levelArithmetic_commensurable` for the two compact-open level arithmetic subgroups; intersect with the same finite-index rational component subgroup. This gives commensurability for arbitrary representatives, without assuming they lie in one double coset.

Compute the conjugation identity for `b=qak`, preserving the chosen component.

**Checks.**

- Commensurability does not require a,`b` to represent the same double coset.
- Representative change uses `q∈G(ℚ)_+` when `X⁺` is fixed.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.13, pp.57–58; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §3.4; Suggested.lean, Reduction.`levelArithmetic_commensurable`.)

This uses [0.1 Arithmetic component stabilizers](#01-arithmetic-component-stabilizers); [Local datum foundations, §P.4](#p4-levels-and-basic-examples), with the exact supplier contracts above.

### 0.3 Shimura specialization of cofinal neat levels

Prove `TauCeti.Shimura.neat_sublevels` as follows. Specialize AdelicAlgebraicGroups §4.3 / `Neat.exists_isNeatLevel_le` to the rational group of a pure Shimura datum: every compact open `K` contains a normal open `K₀` of finite index that is neat in the §P.4 rational-conjugate sense. Apply the same supplier inside every prescribed compact open sublevel for cofinality. The retained result identifies AA.4 rational-conjugate neatness with the §P.4 convention on the Shimura tower.

Import AdelicAlgebraicGroups §4.3 / `Neat.exists_isNeatLevel_le`, including its normality and finite-index conclusions; do not repeat its faithful-representation congruence proof.

Use the AA.4 and §P.4 neat-level predicates: both require rational points in every adelic conjugate to be neat. Representation independence identifies their conventions.

Apply the supplier to each prescribed compact open sublevel. Neatness is stable under subgroups, so these sublevels form a cofinal system for the tower.

**Checks.**

- No assertion that all principal level 2 subgroups are neat.
- For `GL₂` principal `N≥3` use the local datum foundations of §§P.1–P.4; `N=2` retains `−I`.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 3.5 and §5, pp.34,58; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [AdelicAlgebraicGroups, §4.3, neat levels exist](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#43-neat-elements-and-levels); [AdelicAlgebraicGroups, §4.3, neat compact open levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#43-neat-elements-and-levels); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [Local datum foundations, §P.4](#p4-levels-and-basic-examples), with the exact supplier contracts above.

### 0.4 Proper effective arithmetic action

Prove `TauCeti.Shimura.effective_proper_action` as follows. The effective image `Γ_a^eff` acts properly discontinuously on `X⁺`; at rationally neat `K` it acts freely. Thus its orbit projection is a covering map locally biholomorphic once the holomorphic quotient carrier is supplied. No conclusion that `Γ_a` itself acts freely is drawn.

Discreteness from §0.1 combines with the proper symmetric-space action supplied by ALS.0.

Use the local datum foundations of §§P.1–P.4 to exclude effective stabilizers at neat level. Descend charts through disjoint translates, using the manifold gluing of the Tau Ceti supplier contract.

**Checks.**

- Central totally real units survive neatness but disappear in `Γ_a^eff`.
- At non-neat level elliptic fixed points remain; the quotient is an analytic space.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.1, 3.6 and 5.13, pp.32,34–35,57–58.)

This uses [0.1 Arithmetic component stabilizers](#01-arithmetic-component-stabilizers); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action), with the exact supplier contracts above.

### 0.5 Finite analytic component decomposition

Prove `TauCeti.Shimura.component_decomposition` as follows. For every compact open `K`, `G(ℚ)_+ ∖ G(𝔸_f)/K` is finite, and choice of representatives a induces `⨿_a Γ_a ∖ X⁺ ≅ G(ℚ) ∖ (X×G(𝔸_f)/K)`, first as topological spaces and then as complex analytic spaces. Changing `a=qbk` transports the component by `q`, so the decomposition is independent of representatives up to the specified analytic isomorphisms.

Finite index of `G(ℚ)_+` in `G(ℚ)` refines AA.3 class finiteness to the plus double cosets.

Milne 5.11–5.13 identify representatives and stabilizers by the diagonal rational action.

For topology use open finite adelic cosets. For analytic compatibility use the effective quotient charts and representative-change holomorphic maps.

**Checks.**

- For the `GL₂` datum principal `N≥3` yields `φ(N)` components, not `φ(N)/2`.
- For a torus singleton domain the components are the finite torus double quotient.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemmas 5.11–5.13, pp.56–58; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients.)

This uses [AdelicAlgebraicGroups, §3.4, finiteness of class numbers](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#34-adelic-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, §3.4, component decomposition of a level quotient](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#34-adelic-reduction-and-arithmetic-quotients); [0.2 Commensurability of stabilizers](#02-commensurability-of-stabilizers); [0.4 Proper effective arithmetic action](#04-proper-effective-arithmetic-action); [Local datum foundations, §P.2](#p2-hermitian-components), with the exact supplier contracts above.

### 0.6 Abelianized component formula

Prove `TauCeti.Shimura.simply_connected_components` as follows. Assume `G^der` is simply connected. Put `T=G/G^der` and `ν:G→T, T(ℚ)^†=ν(G(ℚ)_+)=T(ℚ)∩ν(Z(G)(R))`. Then `π₀(Sh_K^an(G,X))≃T(ℚ)^†∖T(𝔸_f)/ν(K)`. Apply strong approximation only to the semisimple simply connected derived group, whose `ℚ`-simple factors have noncompact real points by `SV3`; never to `G` or a torus without hypotheses.

Specialize AdelicAlgebraicGroups §4.5, “Class sets of groups with simply connected derived group” (README-only) to the component stabilizer `G(ℚ)_+`. The derived rational subgroup lies in `G(ℚ)_+`; retain the actual image `ν(G(ℚ)_+)`.

Use SVI 5.18–5.20 and AdelicAlgebraicGroups §4.1, “Hasse kernel and injectivity” (README-only) to identify that image with `T(ℚ)∩ν(Z(G)(R))`. Finite-place torsors vanish by AdelicAlgebraicGroups §4.1, “Local `H¹` vanishing” (README-only).

Import AA §4.5 abelianization-integral-lifts and finite-adelic abelianization: smooth reductive models outside finitely many primes, connected-kernel residue-field surjectivity by Lang and integral lifting by Hensel. Restricted products then give adelic surjectivity. Prove the positive rational image identity and local openness specialization here from SVI 5.18–5.21 and these imported torsor and integral-lift targets.

Apply strong approximation to `G^der`, with noncompactness on each `ℚ`-simple real factor supplied by `SV3`, to make the fibres single connected arithmetic quotients. Local openness gives compact open `ν(K)`.

**Checks.**

- For `GL₂, T(ℚ)^†=ℚ_{>0}`; principal level `N` gives `(ℤ/Nℤ)×`.
- A definite quaternion norm-one group fails the real noncompactness condition.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.17, Lemmas 5.18–5.21 and component-fibre argument, pp.59–61; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §§4.1 and 4.5, abelianization-integral-lifts, finite-adelic abelianization and class-set abelianization.)

This uses [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition); [AdelicAlgebraicGroups, §4.2, strong approximation for semisimple groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures); [AdelicAlgebraicGroups, §4.5, class sets of groups with simply connected derived group](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#45-hecke-correspondences-volumes-and-abelianization); [AdelicAlgebraicGroups, §4.1, local H¹ vanishing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#41-weak-approximation-and-torsors); [AdelicAlgebraicGroups, §4.1, Hasse kernel and injectivity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#41-weak-approximation-and-torsors); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs), with the exact supplier contracts above.

### Examples

For `GL₂` and principal `N≥3, Γ(N)` acts freely on `ℍ` after passing to the effective image. At `N=2, −I` remains ineffective. A real-quadratic central unit can fix every domain point, so rational freeness cannot be inferred. At full `N=3` the component set has `φ(3)=2` elements. For a torus the derived group is trivial; all component information remains in the abelianized finite quotient.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, Layer 3, reduction and arithmetic quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, §3.4, arithmetic subgroups attached to a level](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#34-adelic-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, §3.4, finiteness of class numbers](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#34-adelic-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, §3.4, component decomposition of a level quotient](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#34-adelic-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, §4.5, class sets of groups with simply connected derived group](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#45-hecke-correspondences-volumes-and-abelianization); [AdelicAlgebraicGroups, §4.1, Hasse kernel and injectivity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#41-weak-approximation-and-torsors); [AdelicAlgebraicGroups, §4.1, local H¹ vanishing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#41-weak-approximation-and-torsors); [AdelicAlgebraicGroups, §4.3, neat compact open levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#43-neat-elements-and-levels); [AdelicAlgebraicGroups, §4.3, neat levels exist](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#43-neat-elements-and-levels); [AdelicAlgebraicGroups, §4.2, strong approximation for semisimple groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action); [Local datum foundations, §P.2](#p2-hermitian-components); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

## Layer 1: The complex analytic tower

### 1.1 Finite-level analytic Shimura points

Define `TauCeti.Shimura.AnalyticPoints` as follows. For a pure datum and compact open `K, Sh_K^pts` is the orbit set of `X×G(𝔸_f)/K` under `q·(x,aK)=(qx,qaK), q∈G(ℚ)`. Its quotient topology comes from `X` with its domain topology and the discrete coset space `G(𝔸_f)/K`. This defines the carrier; [1.2 Complex analytic structure of the tower](#12-complex-analytic-structure-of-the-tower) equips it with its complex analytic structure.

Form the right `K`-cosets, then the rational diagonal orbit quotient using the baseline orbit setoid.

Use the explicit component equivalence of Layer 0 to specify the quotient topology and map points.

Expose the following named operations and laws.

- `TauCeti.Shimura.AnalyticPoints.mk`: Send `(x,a)` to `[x,a]_K`.
- `TauCeti.Shimura.AnalyticPoints.mk_eq`: `[x,a]_K=[y,b]_K` iff `∃q∈G(ℚ), k∈K` with `y=qx` and `b=qak`.
- `TauCeti.Shimura.AnalyticPoints.lift`: A function on `X×G(𝔸_f)` invariant under the rational diagonal and right `K` actions descends uniquely; evaluation at `[x,a]` recovers its value.
- `TauCeti.Shimura.AnalyticPoints.level`: For `K′⊂K` send `[x,a]_{K′}` to `[x,a]_K`; identity and composition hold.

**Checks.**

- `TauCeti.Shimura.AnalyticPoints.trivial`: The trivial datum has one point at its unique level.
- `TauCeti.Shimura.AnalyticPoints.torus`: For singleton torus datum, `Sh_K^pts=T(ℚ)∖T(𝔸_f)/K`, including the rational quotient. The native singleton-domain example retains the rational element in the equality criterion.
- `TauCeti.Shimura.AnalyticPoints.keep_domain`: For `GL₂` the fibre of one finite component is `Γ_a∖ℍ`, an infinite set, not a singleton finite double coset. The native `trivialDomainAction` fixes an arbitrary domain under the trivial rational group; its point quotient distinguishes every pair of distinct domain points.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, definition before Lemma 5.13, p.57; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [AdelicAlgebraicGroups, §4.4, level quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#44-double-cosets-and-level-topology); `MulAction.orbitRel.Quotient`; [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition), with the exact supplier contracts above.

### 1.2 Complex analytic structure of the tower

Prove `TauCeti.Shimura.analytic_structure` as follows. The carrier `Sh_K^pts` has a canonical normal complex analytic-space structure characterized componentwise by `Γ_a^eff∖X⁺`. If `K` is rationally neat it is a smooth complex manifold. For general `K` choose neat normal `K′⊂K`; the analytic finite quotient by the actual `K/K′` action gives the same space, independently of `K′`.

At neat level glue the quotient local charts using holomorphic transition maps.

For general level take invariant local holomorphic functions under finite effective stabilizers; normality follows from invariants of normal local rings.

Compare normal sublevels through a common neat refinement. Analytic spaces with gluing and finite quotients are required explicitly.

**Checks.**

- Smoothness is asserted at neat level only.
- Infinite ineffective central kernels never enter the local finite stabilizer action.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58.)

This uses [1.1 Finite-level analytic Shimura points](#11-finite-level-analytic-shimura-points); [0.3 Shimura specialization of cofinal neat levels](#03-shimura-specialization-of-cofinal-neat-levels); [0.4 Proper effective arithmetic action](#04-proper-effective-arithmetic-action); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 1.3 Holomorphic finite level maps

Prove `TauCeti.Shimura.holomorphic_level_maps` as follows. For `K′⊂K, Sh_{K′}^an→Sh_K^an` is finite and holomorphic. If `K` is neat it is locally biholomorphic; after algebraization in Layer 3 it is finite étale. For `K′` normal in `K`, the effective image `H` of `K/K′` in `Aut(Sh_{K′}^an)` acts over `Sh_K^an` and its orbit quotient is `Sh_K^an`. `H` is a subgroup of the automorphisms over the base; it need not be the full deck group on a disconnected cover. A full deck-group formula requires the separate connected regular-cover hypotheses. For nonnormal `K′` no such group formula is asserted.

The AA.4 finite topological level map is used within its precise real-stabilizer hypotheses, with the effective-kernel specialization proved here for general data.

Lift through component quotient charts to prove holomorphicity and local biholomorphicity at neat target.

Compute the kernel of `K/K′` on all points; its effective image gives the finite quotient. Do not identify that image with every automorphism over the base of a disconnected cover.

**Checks.**

- The quotient-action group is `H=(K/K′)/ker(action)`; full deck-group equality is asserted only for an appropriate connected regular cover.
- For the one-point torus datum `(G_m,{h})` with `h(z)=z z̄` (the strict torus datum of the Conventions), principal `K(3)` gives one point and `K(21)` gives six points. The effective `K(3)/K(21)` action is the regular `C₆` action; the full automorphism group over the one-point base is `S₆`.
- A neat covering source does not remove ramification over elliptic points of a non-neat target.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, p.58; finite-level consequence of the arithmetic covering supplier; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [1.2 Complex analytic structure of the tower](#12-complex-analytic-structure-of-the-tower); [AdelicAlgebraicGroups, §4.4, covering maps between neat levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#44-double-cosets-and-level-topology); [AdelicAlgebraicGroups, Layer 4, approximation, neat levels and Hecke maps](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps); [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition), with the exact supplier contracts above.

### 1.4 Holomorphic right translations

Prove `TauCeti.Shimura.right_translation` as follows. For `g∈G(𝔸_f), R_g:Sh_K^an→Sh_{g⁻¹Kg}^an` sends `[x,a]` to `[x,ag]`. It is a biholomorphism with inverse `R_{g⁻¹}`; `R_h∘R_g=R_{gh}` with conjugated intermediate levels. It commutes with level projections.

Check `g⁻¹Kg` is the target level by rewriting `akg=ag(g⁻¹kg)`.

On component charts the map uses a rational representative change, hence is holomorphic.

Point formulas prove inverse, composition and commutation with level maps.

**Checks.**

- The conjugated target is `g⁻¹Kg`, not `gKg⁻¹` for this direction.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [1.2 Complex analytic structure of the tower](#12-complex-analytic-structure-of-the-tower); [AdelicAlgebraicGroups, §4.4, level quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#44-double-cosets-and-level-topology), with the exact supplier contracts above.

### 1.5 Holomorphic Hecke correspondences

Prove `TauCeti.Shimura.holomorphic_hecke` as follows. For `K_g=K∩gKg⁻¹`, the Hecke span is `Sh_K^an←Sh_{K_g}^an→Sh_K^an` with arrows `[x,a]↦[x,a]` and `[x,a]↦[x,ag]`. Both are finite holomorphic, and locally biholomorphic at neat `K`. Replacing `g` by `k₁gk₂` gives an isomorphic span. At every level the composite has the actual analytic fibre product as apex, with its full structure sheaf.

Use the AA.4 topological span, then holomorphicity of its two factors.

State the geometric comparison componentwise over a connected common target `B=Γ∖X⁺`. Transport the two source components to `Aᵢ=Γᵢ∖X⁺`, where `Γ` is the effective arithmetic image acting faithfully on `X⁺` and `Γ₁,Γ₂⊂Γ` are finite-index effective images. For `P=A₁×_B A₂`, the natural finite map

`⨿_{γ ∈ Γ₁∖Γ/Γ₂} (Γ₁∩γΓ₂γ⁻¹)∖X⁺ → P`,
`[x] ↦ ([x], [γ⁻¹x])`

identifies its source with the normalization of `P_red`. If `Γ` acts freely on `X⁺`, this map is an isomorphism onto `P` itself; neat common target level is sufficient. Apply this formula to each pair of source components over each target component. Double cosets are taken in the effective images: raw adelic indices can overcount when a central kernel acts trivially. The separate AA.4 assertion that a particular pullback is a single intersection-level space retains both the neat-target hypothesis and `U′L=U`.

The generic combinatorics come from AA.4. This roadmap proves the analytic comparison using the local finite quotient charts of §1.2. They make the displayed map finite and surjective; over the dense open locus of trivial effective stabilizers it is an isomorphism. The source is normal by finite invariants, so it normalizes `P_red` componentwise. Under the free-target hypothesis the quotient maps are local biholomorphisms everywhere and the same local charts give the literal fibre-product decomposition. Layer 3 and §8.4 transport this distinction to complex algebraizations and canonical models. Normalization does not retain nilpotents or identify branches that meet in `P`.

**Checks.**

- Both arrows have target `K` by the chosen `K_g` convention.
- Normality of a sublevel alone does not make every Hecke pullback one intersection-level variety.
- At neat common target, the displayed effective double-coset map is an isomorphism; at `g=1` composition with the identity span leaves both legs unchanged.
- For the forgetful map `f:Y₀(2)_ℂ→Y(1)_ℂ`, write `E:y²=x³+ax²+bx` with `C=⟨(0,0)⟩` and `b(a²−4b)≠0`. The coarse coordinate `t=a²/b−3` ranges over `𝔸¹∖{1}`, and `c₄=16(a²−3b), Δ=16b²(a²−4b)` give `j(t)=256t³/(t−1)`. Thus the composite of the transpose `T₂` span with `T₂` has apex `Z=Y₀(2)_ℂ×_{f,Y(1)_ℂ,f}Y₀(2)_ℂ`, with equation `(t−s)Q(t,s)=0`, where `Q(t,s)=t²s+ts²−t²−ts−s²`. As a quadratic in `s, Q` has discriminant `t²(t−1)(t+3)`, a nonsquare in `ℂ(t)`, and primitive coefficients, so `Q` is irreducible. At `(0,0)`, above `j=0`, its gradient vanishes and its quadratic part is `−(t²+ts+s²)`, with two distinct complex tangent lines. This open irreducible component is nodal and nonnormal; its normalization has two points above the node. Consequently even componentwise isomorphisms with normal Shimura-level spaces fail for the raw coarse fibre product.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.58–59; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), §4.5, Hecke correspondences and Cartesian squares of level maps; the normalization comparison follows from the finite quotient charts and the dense free locus as above; [Stacks, Tag 035Q](https://stacks.math.columbia.edu/tag/035Q), normalization universal property, for the algebraic comparison.)

This uses [1.4 Holomorphic right translations](#14-holomorphic-right-translations); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [AdelicAlgebraicGroups, §4.5, Hecke correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#45-hecke-correspondences-volumes-and-abelianization); [AdelicAlgebraicGroups, §4.5, Cartesian squares of level maps](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#45-hecke-correspondences-volumes-and-abelianization); [AdelicAlgebraicGroups, Layer 4, approximation, neat levels and Hecke maps](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps), with the exact supplier contracts above.

### 1.6 Holomorphic maps of data

Prove `TauCeti.Shimura.datum_analytic_map` as follows. A morphism `f:(G,X)→(H,Y)` and levels `f(K)⊂L` induce a holomorphic map `Sh_K^an(G,X)→Sh_L^an(H,Y), [x,a]↦[f(x),f(a)]`, compatible with levels and translations. An injective subdatum yields a closed immersion at suitable sufficiently small levels after Layer 3 algebraization; no closed-immersion assertion is made at arbitrary coarse levels.

Descend the equivariant map of domain and finite adelic coordinates.

Holomorphicity is inherited from the Hodge-domain map, then checked on component quotient charts.

Retain Milne 5.16 separation of stabilizers for the suitably small-level embedding, used in Layer 6.

**Checks.**

- A noninjective morphism need not be an embedding.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and following clarification, pp.58–59.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [1.2 Complex analytic structure of the tower](#12-complex-analytic-structure-of-the-tower); [1.4 Holomorphic right translations](#14-holomorphic-right-translations), with the exact supplier contracts above.

### 1.7 Compact-open level category

Define `TauCeti.Shimura.Level` as follows. For `D=(G,X), Level(D)` is the poset category of compact open subgroups `K` of `G(𝔸_f)`, with a unique arrow `K → L` exactly when `K` is contained in `L`. Identity and composition are those of inclusion. Finite intersections give common refinements, so this nonempty category is cofiltered. For `g` in `G(𝔸_f)`, conjugation `C_g(K)=g⁻¹Kg` is an automorphism of this index category; `C_1=id` and `C_h` composed after `C_g` equals `C_{gh}`. The analytic and algebraic towers use this same category.

Throughout this result, `G(𝔸_f)` has the topological-group structure imported from AdelicAlgebraicGroups Layer 1 and compact open levels from §P.4. No fixed neat subcategory or arbitrary abstract index category replaces all compact open levels.

Use the existing subgroup inclusion order and its poset category on the subtype of compact open subgroups.

The intersection of two compact open subgroups is compact and open. At least one compact open exists by the adelic integral model; use intersections for the cofiltered cone.

Conjugation is a homeomorphism and an order isomorphism, so it preserves the subtype; multiplication computes the composition order.

Expose the following named operations and laws.

- `TauCeti.Shimura.Level.hom_iff`: An arrow `K → L` exists exactly when `K` is contained in `L`, and then its hom set has one element.
- `TauCeti.Shimura.Level.id_comp`: Identity is reflexive inclusion and composition is transitive inclusion.
- `TauCeti.Shimura.Level.inf_refines`: `K` intersect `L` is a compact open level with arrows to `K` and `L`.
- `TauCeti.Shimura.Level.cofiltered`: `Level(D)` is nonempty and cofiltered; parallel arrows already agree.
- `TauCeti.Shimura.Level.conjugate`: `C_g` sends `K` to `g⁻¹Kg` and inclusion to conjugated inclusion; `C_{g⁻¹}` is its inverse.
- `TauCeti.Shimura.Level.conjugate_comp`: `C_1=id` and `C_h` composed after `C_g=C_{gh}`, on objects and arrows.

**Checks.**

- `TauCeti.Shimura.Level.trivial`: For the trivial group the compact-open level category has one object and its identity arrow.
- `TauCeti.Shimura.Level.nested`: In the additive `p`-adic local model, `p² Z_p → p Z_p → Z_p` composes to `p² Z_p → Z_p`. Forgetting arrows in the opposite direction fails.
- `TauCeti.Shimura.Level.intersection`: The common refinement of `p Z_p` and `p² Z_p` is `p² Z_p`; it maps to both.
- `TauCeti.Shimura.Level.noncompact_top`: For the real additive local model the whole group `ℝ` is an open subgroup but is not compact and is excluded. The adelic analogue likewise excludes the full noncompact `G(𝔸_f)`.
- An arrow goes from the smaller subgroup to the larger one, matching the forgetful map.
- Conjugation changes the index; a general `g` gives no automorphism at a fixed `K`.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, pp.57–58; 5.29(a)–`(b)`, p.65; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [AdelicAlgebraicGroups, §4.4, level quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#44-double-cosets-and-level-topology); `CategoryTheory.Functor`, with the exact supplier contracts above.

### Examples

For the trivial datum the point set is a singleton. For a trivial rational group acting on a two-point domain, the domain points remain distinct: discarding `X` gives the wrong quotient. The torus map from principal level 21 to maximal level is a six-point map; its regular effective `C₆` action is smaller than the full permutation group `S₆` over the point. At `g=1` a Hecke span has two identity legs.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, Layer 4, approximation, neat levels and Hecke maps](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-4-approximation-neat-levels-and-hecke-maps); [AdelicAlgebraicGroups, §4.5, Cartesian squares of level maps](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#45-hecke-correspondences-volumes-and-abelianization); [AdelicAlgebraicGroups, §4.5, Hecke correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#45-hecke-correspondences-volumes-and-abelianization); [AdelicAlgebraicGroups, §4.4, covering maps between neat levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#44-double-cosets-and-level-topology); [AdelicAlgebraicGroups, §4.4, level quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#44-double-cosets-and-level-topology); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); `CategoryTheory.Functor`; `MulAction.orbitRel.Quotient`.

Earlier constructions used here are 0.3 Shimura specialization of cofinal neat levels; 0.4 Proper effective arithmetic action; 0.5 Finite analytic component decomposition.

## Layer 2: Automorphic sections and the complex minimal compactification

### 2.1 Rational boundary components and incidence

Prove `TauCeti.Shimura.rational_boundary` as follows. Let `D` be the effective Hermitian symmetric domain of a rational semisimple adjoint group. A boundary component `F` in its bounded realization is rational precisely when its normalizer `N(F)`, viewed as an algebraic subgroup, is defined over `ℚ`. For a `ℚ`-simple noncompact factor these are the proper maximal rational parabolics; for products take products of boundary components, allowing an interior factor. The image `Γ(F)` of `N(F)∩Γ` in `N(F)/Z(F)`, where `Z(F)` fixes `F` pointwise, is an arithmetic discontinuous group on the Hermitian domain `F`. Construct the standard unbounded realization `S_F` of `D` and the holomorphic projection `π_F:D→F`. In adapted coordinates the ambient Jacobian determinant of each normalizer element is constant on `π_F`-fibres and induces an equivariant boundary line factor. The rational extension `D*=D∪⋃F` uses just these rational components, with their bounded-realization `closure` incidence.

Use BB §§3.5–3.7 to identify rationality by the `ℚ`-defined normalizer and to obtain `Γ(F)`. Relative rational roots and parabolics are imported from the reductive supplier; the complete classification of rational boundary components is a required input of this target.

Construct `S_F` and `π_F` by the adapted Cayley/Siegel realization. BB §§1.8–1.11 and 3.3(ii) show that normalizer Jacobians descend along `π_F`, and that compatible realization changes identify the induced factors.

Use BB §§3.8–3.9 for nested boundary components and their simultaneous standard realizations; use the product decomposition of §§3.3(i), 8.9 for general semisimple domains.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, pp.38–39; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §3.3(ii), pp.470–472; §§3.5–3.7, pp.472–474; §§1.8–1.11, pp.454–457; §8.9, pp.512–514; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients.)

This uses [Local datum foundations, §P.2](#p2-hermitian-components); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [AdelicAlgebraicGroups, §§3.1–3.4, rational parabolics and finite reduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients), with the exact supplier contracts above.

### 2.2 Satake topology and compactness

Prove `TauCeti.Shimura.satake_compactness` as follows. Equip `D*` with the rational Satake topology constructed by transporting the natural closures of arithmetic fundamental sets and their rational translates (BB §§4.8–4.9). It is independent of the chosen reduction fundamental set, restricts to the usual topology on every Hermitian stratum and makes rational domain automorphisms continuous. For `x` in a rational stratum `F`, good neighborhoods `U` form a basis: `U` is `Γ_x`-invariant, `γU∩U` is empty for `γ∉Γ_x`, and a rational stratum `F′` meets `U` precisely when `F` lies in its natural `closure`. For arithmetic `Γ` the quotient `Γ∖D*` is compact Hausdorff with open dense `Γ∖D` and finitely many arithmetic boundary strata; `closure` is given by the rational incidence relation.

Construct the topology from closures of finitely many rationally translated Siegel domains, using AA.3 finite-cover and finite-overlap reduction. BB §4.9 proves independence, rational invariance and orbit separation.

Shrink at each boundary point to obtain the isotropy and incidence conditions of BB §§4.9(iv), 4.10. These good neighborhoods supply the local boundary-extension predicate without an analytic compactification assumption.

Apply BB §4.11 to the finitely many parabolic arithmetic orbits: fundamental-set compactness gives compactness, orbit separation gives Hausdorffness, and boundary incidence gives the `closure` of each quotient stratum. Establish the fundamental-set `closure` and reduction-topology interfaces before applying this compactness argument.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§4.8–4.11, pp.482–484; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients.)

This uses [2.1 Rational boundary components and incidence](#21-rational-boundary-components-and-incidence); [AdelicAlgebraicGroups, §3.6, real Siegel sets and finite cover](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact); [AdelicAlgebraicGroups, §3.6, finite overlap of real Siegel sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact), with the exact supplier contracts above.

### 2.3 Analytic automorphic graded ring

Define `TauCeti.Shimura.AutomorphicRing` as follows. Let `Γ` be a torsion-free effective arithmetic group on `D`, with rational extension `D*` and Satake topology from §§2.1–2.2. For `n≥0, A_n(Γ)` consists of `Γ`-invariant holomorphic sections `ω` of `K_D^⊗n` satisfying the following boundary predicate. Write `ω=f(z)(dz₁∧⋯∧dz_d)^⊗n` in domain coordinates, so `f(γz)det(Dγ_z)^n=f(z)`. For every rational boundary component `F` and every rational domain automorphism `q` carrying `F` to a standard component `F_b`, express the transported `ω` by its scalar coefficient `f_{F,q}` in the standard unbounded realization `S_b` of `D`. Require a holomorphic `f^∂_{F,q}:F_b→C` such that `f_{F,q}` on `D` and `f^∂_{F,q}` on `F_b` together define a continuous function on `D∪F_b` with its subspace Satake topology. Transport uses the canonical-section Jacobian rule, not the unchanged coefficient in a bounded chart. Equivalently, on every good neighborhood of `x∈D*`, an adapted coefficient extends continuously to the whole neighborhood and holomorphically on each rational stratum meeting it (BB §§8.3–8.5). For a product domain use adapted product realizations, with compact factors unchanged. The extension defines `Φ_Fω` in the `n`-th tensor power of the boundary factor `ℰ_F` induced from the ambient Jacobian along `π_F`, not in general `K_F^⊗n`. Define `A(Γ)=⊕_{n≥0}A_n(Γ)`, with pointwise tensor product and constant unit. A cusp form has `Φ_Fω=0` for every proper rational `F`, an additional condition. A positive common tensor power gives a Veronese ring; its projective comparison is proved after finite generation.

Throughout this result, `D` has the rational semisimple effective presentation of Layer 0 and rational boundary data of Layer 2; `Γ` is arithmetic, effective and torsion-free. The Satake topology and adapted unbounded realizations are constructed before this definition. No analytic or algebraic structure on `Γ∖D*` is assumed in its boundary predicate. The convention uses a left domain action and canonical-section pullback; coordinate changes of coefficients include their determinant to the `n`-th power.

Use the derivative cocycle for `K_D` and the adapted `π_F`-fibre-constant determinants of §2.1 to construct `ℰ_F`. BB §8.2 identifies this induced boundary factor under rational and nested realization changes.

Define admissibility by continuous extension in the subspace Satake topology and holomorphy on `F`. BB §8.3 proves independence of `q` and compatible unbounded coordinates; §§8.4–8.5 prove equivalence with the good-neighborhood predicate, including all incident strata.

Uniqueness on the dense interior gives compatible restriction `Φ_F`. Multiplying the extended coefficient functions preserves continuity and stratum holomorphy, hence grading and product restriction. Pullback to finite-index arithmetic subgroups preserves the predicate.

Use BB §8.9 to pass from `ℚ`-simple factors to their products and finite-index arithmetic groups, with compact factors unchanged. Once §2.5 is proved, admissible degree-zero functions are holomorphic on a compact connected normal analytic space, hence constant.

Expose the following named operations and laws.

- `TauCeti.Shimura.AutomorphicRing.degree`: The degree-`n` piece is exactly the admissible analytic section space `A_n(Γ)` defined by the boundary predicate. After §2.5, `A_0=C` on a connected quotient by compactness and the maximum principle.
- `TauCeti.Shimura.AutomorphicRing.mul`: Multiplication `A_m×A_n→A_{m+n}` is pointwise tensor product; unit and associativity hold.
- `TauCeti.Shimura.AutomorphicRing.siegel`: For a rational `F, Φ_F` sends `A_n(Γ)` to `(N(F)∩Γ)`-invariant holomorphic sections of `ℰ_F^⊗n`, the factor induced by the ambient determinant along `π_F`. Retain the normalizer action on the factor; use the `Γ(F)` action when it descends, after a common tensor power if necessary to kill finite characters. It is complex-linear and `Φ_F(ωη)=Φ_F(ω)Φ_F(η)` in the induced grading. Transport and nested restriction commute under the specified factor isomorphisms; no equality with `K_F^⊗n` is asserted.
- `TauCeti.Shimura.AutomorphicRing.level`: For `Γ′⊂Γ`, pullback embeds `A_n(Γ)` into `A_n(Γ′)`; identity and composition hold.
- `TauCeti.Shimura.AutomorphicRing.veronese`: Changing to a positive common tensor power gives the corresponding Veronese ring and the same projective spectrum after finite-generation is established.
- `TauCeti.Shimura.AutomorphicRing.mk`: A holomorphic canonical `n`-section satisfying `Γ`-invariance and continuous, stratum-holomorphic extension in every rational adapted chart defines an element of `A_n`; evaluation returns the supplied section.
- `TauCeti.Shimura.AutomorphicRing.ext`: Two elements of `A_n` are equal if their holomorphic section values agree at every point of `D`.
- `TauCeti.Shimura.AutomorphicRing.eval`: Evaluation on `D` is complex-linear on each degree and carries the graded product to pointwise multiplication.
- `TauCeti.Shimura.AutomorphicRing.integral_iff`: Global boundary admissibility is equivalent to integral local sections on every good neighborhood: one adapted coefficient extends continuously over the whole neighborhood and holomorphically on each incident rational stratum. The rational-chart condition and this local condition use only `D*` topology and the induced factors.
- `TauCeti.Shimura.AutomorphicRing.change_chart`: Changing the rational transport or a compatible unbounded realization carries an admissible coefficient and its boundary limits to the new ones by the canonical Jacobian transition. Thus the extension predicate and induced boundary section are independent of those choices, via the `ℰ_F` factor isomorphism.

**Checks.**

- `TauCeti.Shimura.AutomorphicRing.degree_zero`: On a connected compactification the degree-zero piece consists of constants.
- `TauCeti.Shimura.AutomorphicRing.elliptic_weight`: For `ℍ` the canonical `n`-th automorphy factor corresponds to scalar modular weight `2n`, with holomorphy at cusps.
- `TauCeti.Shimura.AutomorphicRing.not_cusp`: For the torsion-free principal group `Γ(3)⊂SL₂(ℤ)`, the restriction of `E₄` is an allowed weight-4 (degree-two) form, with constant Fourier coefficient 1 at infinity. It is not a cusp form.
- `TauCeti.Shimura.AutomorphicRing.pole_at_cusp`: The modular `j`-function is holomorphic on `ℍ` and `Γ(3)`-invariant in degree zero, but its `q⁻¹` pole at infinity has no continuous finite boundary limit. It is excluded from `A_0`. Holomorphy and the interior transformation law alone are insufficient.
- `TauCeti.Shimura.AutomorphicRing.induced_weight`: For the genus-two Siegel domain, `det(Dγ_Z)=det(CZ+D)⁻³`, so canonical degree `n` has scalar weight `3n`. Restriction to a genus-one rational boundary retains scalar weight `3n`, whereas intrinsic boundary canonical degree `n` has weight `2n`. At `n=2` the induced weight is 6, corresponding to intrinsic boundary degree 3, not degree 2. A `Φ_F` API replacing `ℰ_F^⊗n` by `K_F^⊗n` fails this calculation.
- The predicate quantifies over every rational boundary component and rational adapted chart, uses the previously constructed Satake topology, and is independent of the subsequent analytic/projective compactification.
- Chart changes retain the canonical Jacobian factor; `Φ_F` has values in the ambient-induced boundary factor, with product compatibility. It need not preserve intrinsic boundary canonical weight.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§8.2–8.5, pp.509–511; §8.7, p.512; §8.9, pp.512–514.)

This uses [2.1 Rational boundary components and incidence](#21-rational-boundary-components-and-incidence); [2.2 Satake topology and compactness](#22-satake-topology-and-compactness); [1.2 Complex analytic structure of the tower](#12-complex-analytic-structure-of-the-tower); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 2.4 Automorphic sections separating strata

Prove `TauCeti.Shimura.poincare_eisenstein` as follows. For the analytic automorphy factor above, sufficiently divisible positive weights admit Poincaré–Eisenstein sections with convergent series, prescribed boundary restrictions and enough sections to separate points of `Γ∖D*` and local analytic germs. State and prove the convergence, boundary extension and separation results before using a projective embedding.

Form sufficiently high-weight Poincaré–Eisenstein series in adapted realizations. AA.3 reduction and BB §§6–7 provide the normal majorants on truncated Siegel neighborhoods; the exact majorant inequalities and normal convergence must be proved.

BB §8.6 gives integral boundary extension and surjection to the boundary Poincaré-series space for the induced factor, with vanishing on the specified other strata. BB §§8.7–8.8 give admissible boundary Taylor interpolation and point separation; §8.9 extends this to products and finite-index groups.

Use that interpolation in the local analyticity criterion and projective comparison of §§9–10. Prescribing boundary Poincaré series is not a claim that every arbitrary boundary holomorphic function lifts; the induced factor and high/divisible-weight hypotheses are retained.

**Checks.**

- Point separation alone does not assert an immersion or analytic closed embedding.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12, p.38; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Theorem 8.6, pp.511–512; §§8.7–8.9, pp.512–514; §§7.7–7.9, pp.506–508 (with the normal-convergence proof required); [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients.)

This uses [2.3 Analytic automorphic graded ring](#23-analytic-automorphic-graded-ring); [2.2 Satake topology and compactness](#22-satake-topology-and-compactness); [AdelicAlgebraicGroups, §3.6, real Siegel sets and finite cover](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact), with the exact supplier contracts above.

### 2.5 Normal analytic Baily–Borel quotient

Prove `TauCeti.Shimura.normal_analytic_compactification` as follows. On the compact Satake quotient `Γ∖D*`, let `O(U)` be the continuous complex functions on `U` whose restrictions to every arithmetic Hermitian stratum are holomorphic. This sheaf makes `Γ∖D* a` normal complex analytic space, with its original analytic open stratum `Γ∖D` and the specified holomorphic stratum restriction maps. Its structure agrees with the projective realization by sufficiently high-weight integral automorphic sections.

Define the sheaf by continuity and stratum holomorphy, before projective algebraization. Use local ratios of integral sections with nonzero denominator and the boundary interpolation of §2.4.

Apply BB §9 analyticity criterion to obtain the normal local analytic models; §10.4 verifies its hypotheses for the Satake quotient. Supply the full local analyticity criterion and its normality interfaces.

BB §§10.6–10.11 compare local rings with the section-built projective charts. Finite analytic invariants extend the result to arithmetic groups with torsion; invariants are not replaced by an orbifold point-set carrier.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(a), pp.38–39; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §10.4, p.520; §§10.6–10.11, pp.521–523; §§9.6–9.7, pp.517–518.)

This uses [2.4 Automorphic sections separating strata](#24-automorphic-sections-separating-strata); [2.2 Satake topology and compactness](#22-satake-topology-and-compactness); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 2.6 Finite generation of automorphic forms

Prove `TauCeti.Shimura.automorphic_finite_generation` as follows. The analytic graded `ℂ`-algebra `A(Γ)` is finitely generated (after the chosen common positive tensor power), and sufficiently divisible high-weight sections realize `Γ∖D*` as a closed analytic subspace of projective space. Its graded projective spectrum gives the same compactification.

Use the boundary interpolation and normal analytic compactification to construct high-weight point-separating forms and the holomorphic projective map (BB §§10.6–10.8).

BB §§10.9–10.11 construct a finitely generated integrally closed graded subring from a finite separating system and its normalization, and identify its projective spectrum with the analytic compactification. This subring is not by definition the entire admissible ring A.

In the range with no three-dimensional `ℚ`-normal subgroup, BB Theorem 10.14 identifies the full holomorphic automorphic ring and proves finite generation via algebraic coherent sheaves on the projective realization. For modular-curve factors prove the corresponding identification with cusp-regular logarithmic canonical sections, then handle products and finite arithmetic quotients. Prove these full-ring identifications; existence of a finite separating subring alone does not establish them.

Check `Proj` invariance under positive Veronese and finite arithmetic invariants, retaining the tensor and character conventions fixed in §2.3.

**Checks.**

- The weight-one piece need not itself generate the ring.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.12–3.13(c), pp.38–39; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §§10.6–10.11 and Theorem 10.14, pp.521–524.)

This uses [2.3 Analytic automorphic graded ring](#23-analytic-automorphic-graded-ring); [2.5 Normal analytic Baily–Borel quotient](#25-normal-analytic-bailyborel-quotient); [2.4 Automorphic sections separating strata](#24-automorphic-sections-separating-strata); [ComplexComparisonPartII, Layer C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c2-projective-and-proper-consequences-of-coherent-gaga); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison), with the exact supplier contracts above.

### 2.7 Baily–Borel algebraization

Prove `TauCeti.Shimura.baily_borel` as follows. Every finite-level analytic Shimura variety has a normal quasi-projective `ℂ`-scheme algebraization, smooth at neat level, with open immersion into its normal projective minimal compactification. Analytification identifies the compactification with the compact rational Satake quotient and identifies its algebraic boundary strata with the analytic arithmetic boundary quotients.

Apply Chow to the projective analytic realization and its boundary closed subspaces, importing `C4` rather than reproducing it.

Normality and the open-stratum analytic comparison supply the quasi-projective open scheme.

Use projective GAGA for the coherent ideal and section comparisons; glue the finite components.

**Checks.**

- Projective minimal compactifications may be singular even at neat level.
- The construction uses analytic automorphic forms before automorphic-bundle algebraization.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.12 and Remark 3.13, pp.38–39; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), §10.4, p.520; Theorem 10.11, p.523; §4.11, p.484.)

This uses [2.6 Finite generation of automorphic forms](#26-finite-generation-of-automorphic-forms); [2.5 Normal analytic Baily–Borel quotient](#25-normal-analytic-bailyborel-quotient); [ComplexComparisonPartII, Layer C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c2-projective-and-proper-consequences-of-coherent-gaga); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition); `AlgebraicGeometry.Scheme`, with the exact supplier contracts above.

### 2.8 Koecher principle and boundary codimension

Prove `TauCeti.Shimura.koecher` as follows. If the rational semisimple effective group has no quotient isomorphic over `ℚ` to `PGL₂`, the boundary of the minimal compactification has codimension at least two. In the resulting Koecher range holomorphic canonical-factor automorphic sections have the required boundary growth/extension, yielding the canonical-form section-ring description. In the modular-curve factor case retain cusp conditions and logarithmic canonical forms.

Compute dimensions of boundary strata from rational root data; identify the exceptional rational three-dimensional factor.

Apply the holomorphic Fourier/Koecher extension argument in codimension at least two.

Do not use `ℚ`-rank one alone to decide codimension: ball quotients of dimension at least two are rank-one examples with higher-codimension cusps.

**Checks.**

- Modular curves have codimension-one cusps.
- Rank-one ball quotients need not have divisorial minimal boundary.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(b)–`(c)`, p.39; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Proposition 3.15, p.478; Theorem 10.14, pp.523–524.)

This uses [2.1 Rational boundary components and incidence](#21-rational-boundary-components-and-incidence); [2.3 Analytic automorphic graded ring](#23-analytic-automorphic-graded-ring); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization), with the exact supplier contracts above.

### 2.9 Level maps on minimal compactifications

Prove `TauCeti.Shimura.minimal_level_extension` as follows. Finite analytic level maps and Hecke right translations extend to the minimal compactifications through rational boundary maps and pullback of analytic automorphic forms. After algebraization these are finite algebraic maps for level changes and algebraic isomorphisms for translations, compatible with composition and the open immersion.

Construct the boundary map and compatible graded-ring pullback.

Use `Proj` and the finite/integral ring extension for finite-index arithmetic groups.

Compare analytifications and use proper graph algebraicity; extension is uniquely determined by the dense open. The exact general finite-extension source remains a required proof input.

**Checks.**

- No claim of étaleness at the boundary.
- Reflex-field descent of these extensions belongs to [8.18 Reflex-field descent of the minimal compactification](#818-reflex-field-descent-of-the-minimal-compactification), not this complex construction.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 3.13(c), p.39 and Corollary 3.16 discussion, p.40; the general finite-extension proof is required separately.)

This uses [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [1.4 Holomorphic right translations](#14-holomorphic-right-translations); [2.3 Analytic automorphic graded ring](#23-analytic-automorphic-graded-ring); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison), with the exact supplier contracts above.

### Examples

On a modular curve `E₄` at `Γ(3)` lies in canonical degree 2, is admissible, and is not cuspidal; `j` fails the growth condition. The genus-two induced boundary weight at degree 2 is 6 rather than 4. A Hilbert modular surface over a real quadratic field has point boundary of codimension two: rational rank one alone does not force codimension-one boundary. For compact arithmetic quotients the boundary tests are empty and the usual canonical section ring remains.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, §§3.1–3.4, rational parabolics and finite reduction](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients); [AdelicAlgebraicGroups, §3.6, real Siegel sets and finite cover](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact); [AdelicAlgebraicGroups, §3.6, finite overlap of real Siegel sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification); [ComplexComparisonPartII, Layer C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c2-projective-and-proper-consequences-of-coherent-gaga); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [Local datum foundations, §P.2](#p2-hermitian-components); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); `AlgebraicGeometry.Scheme`; [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

Earlier constructions used here are 0.5 Finite analytic component decomposition; 1.2 Complex analytic structure of the tower; 1.3 Holomorphic finite level maps; 1.4 Holomorphic right translations.

## Layer 3: Algebraicity and complex compactification functoriality

### 3.1 Borel extension across punctured polydisks

Prove `TauCeti.Shimura.borel_extension` as follows. Let `D` be Hermitian symmetric and `Γ^eff` a torsion-free arithmetic subgroup of `Hol(D)^+`. Every holomorphic map `(Δ*)^r×Δ^s→Γ^eff∖D` extends holomorphically to `Δ^{r+s}→(Γ^eff∖D)^min` as a map of complex analytic spaces.

Use arithmetic cusp estimates for the invariant metric to prove the several-variable big-Picard extension criterion, first in one punctured disk and then in the punctured-polydisk charts. The metric extension argument itself is a required proof input, beyond the statement quoted by Milne 3.15.

Choose a projective strict-SNC compactification of the smooth algebraic source. The local punctured-polydisk extension applies in its analytified étale coordinates. The target is the minimal compactification; separatedness and the dense punctured open give uniqueness.

**Checks.**

- For a modular curve this specializes to big Picard into its compact curve.
- Torsion-free effective target is part of the statement.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 3.15, p.39.)

This uses [0.4 Proper effective arithmetic action](#04-proper-effective-arithmetic-action); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 3.2 Borel algebraicity

Prove `TauCeti.Shimura.borel_algebraicity` as follows. For torsion-free arithmetic `Γ^eff` in `Hol(D)^+` and a smooth finite-type `ℂ`-scheme `S`, every holomorphic map `S^an→(Γ^eff∖D)^an` is algebraic. First prove the quasi-projective-source case; then glue over a quasi-projective Zariski open cover. Do not extend this assertion to every coarse torsion target.

Import AlgebraicModuliForArithmeticGeometry §§9.4–9.5 for the quasi-projective source: it preserves `S` and gives a smooth projective compactification with strict-SNC boundary. Its étale coordinate charts become local holomorphic charts by `C0`; the open inclusion is locally a punctured polydisk.

Apply extension, glue by uniqueness, and algebraize the proper graph using `C4`. Restrict to `S`.

For a general smooth separated finite-type source use quasi-projective opens and scheme descent. For nonseparated source the same local gluing works whenever the holomorphic map and analytification are available.

**Checks.**

- `exp:C→𝔸¹=Y(1)` is a counterexample when the arithmetic target has torsion.
- The proper graph step does not by itself establish Borel for nonproper sources.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 3.14 and proof, pp.39–40.)

This uses [3.1 Borel extension across punctured polydisks](#31-borel-extension-across-punctured-polydisks); [AlgebraicModuliForArithmeticGeometry, §§9.4–9.5, resolution and SNC compactification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#95-snc-compactification-and-cartier-separation); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 3.3 Unique algebraization at neat level

Prove `TauCeti.Shimura.unique_algebraization` as follows. Any two smooth finite-type `ℂ`-scheme algebraizations of the same neat arithmetic analytic quotient are uniquely isomorphic through the prescribed analytic identity. This uniqueness concerns algebraization, distinct from reflex-field uniqueness of canonical models in §4.12.

Let `B` be the Baily–Borel algebraization of §2.7. For each proposed algebraization `Yᵢ`, apply §3.2 to the prescribed analytic isomorphism `Yᵢ^an→B^an` to obtain `fᵢ:Yᵢ→B`. Its analytification is that isomorphism.

Prove that each `fᵢ` is an isomorphism on this smooth finite-type complex-scheme domain. The analytic derivative is invertible at every complex point. ComplexComparisonPartII §§C−1.1–C−1.2 identify the algebraic and analytic tangent maps, so the smooth Jacobian criterion makes `fᵢ` étale there. The complement of its étale locus is closed and has no closed complex points, hence is empty. For an étale map the diagonal is an open immersion; any nonempty complement of its image in `Yᵢ×_B Yᵢ` would contain a closed complex point, contradicting injectivity on complex points. Thus `fᵢ` is an étale monomorphism, hence an open immersion. Surjectivity on complex points makes its closed complement in `B` empty. This proves the needed isomorphism detection within the target, using no properness assumption.

Compose the algebraic isomorphisms through `B`. Faithfulness of analytification on finite-type complex schemes gives uniqueness relative to the specified comparison.

**Checks.**

- The isomorphism is unique relative to the chosen analytic comparison.
- For `Y₁=B` with its fixed comparison, the resulting algebraic map is the identity.
- The normalization `𝔸¹_C→{y²=x³}, t↦(t²,t³)`, is bijective on complex points but is not an isomorphism; its singular target and noninvertible analytic tangent map exclude it from the smooth étale argument.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Corollary 3.16, p.40; [Stacks, Tag 02LC](https://stacks.math.columbia.edu/tag/02LC), universally injective étale morphisms are open immersions.)

This uses [3.2 Borel algebraicity](#32-borel-algebraicity); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 3.4 Algebraic maps of Shimura data

Prove `TauCeti.Shimura.algebraic_data_maps` as follows. Holomorphic maps of data between neat-level analytic varieties algebraize, compatibly with levels, translations, identity and composition. An injective subdatum admits a closed immersion at sufficiently small compatible levels. These statements concern complex algebraizations; reflex-field functoriality is Layer 8.

Use Borel into the neat target to algebraize the holomorphic datum map.

Apply the precise small-level separation theorem of Milne 5.16 for closed immersions.

Check functor laws after analytification, which is faithful.

**Checks.**

- An inclusion can identify points at badly chosen larger level.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 5.16 and 3.16, pp.58–59,40.)

This uses [1.6 Holomorphic maps of data](#16-holomorphic-maps-of-data); [3.2 Borel algebraicity](#32-borel-algebraicity); [3.3 Unique algebraization at neat level](#33-unique-algebraization-at-neat-level), with the exact supplier contracts above.

### 3.4a Quasi-projective finite quotients

**Target.** `TauCeti.Shimura.quasi_projective_finite_quotient`. For a finite group `H` acting on a normal quasi-projective `k`-scheme `Z, k` of characteristic zero, construct its normal quasi-projective geometric and categorical quotient `q:Z→Q`. Every finite orbit lies in an affine open; intersect its translates to obtain an invariant affine neighbourhood. Glue the pinned invariant affine quotients and prove that `q` is finite and surjective, with invariant direct-image structure sheaf, compatibly with field extension. For an ample line bundle `L`, tensor its `H`-translates to obtain the canonical linearized ample bundle `M`. A positive power of `M` kills the finite stabilizer characters and descends to an ample line bundle on `Q`; prove this descent and ampleness, rather than inferring projectivity of `Z`. A free action is a finite étale `H`-torsor. The analytification comparison is §P.6. ([Stacks, finite flat affine groupoids](https://stacks.math.columbia.edu/tag/03BE), especially `03BJ, 03BK` and `03BM`; [Rydh, Existence and properties of geometric quotients](https://davidrydh.se/papers/quotients20120504.pdf), Proposition 4.7, case `(B′)`, pp.20–22, and Remark 4.9(4), pp.22–23; the ample-power descent follows by invariant local generation.)

**Checks.**

- `𝔸¹` with `x↦−x` gives `𝔸¹` with coordinate `x²`; this quasi-projective source is not projective over `k`.
- `A²` with scalar `−1` has a normal singular quotient, so smoothness does not descend through stabilizers.
- On `G_m` the same involution is free, and `x↦x²` is a degree-two finite étale torsor.

### 3.5 Algebraic finite quotients and normalization

Prove `TauCeti.Shimura.finite_quotient_algebraization` as follows. For neat normal `K′⊂K`, the finite group `K/K′` acts algebraically on `Sh_{K′,C}`; its geometric quotient exists as a normal quasi-projective `ℂ`-scheme and analytifies to `Sh_K^an`. Quotients through two sublevels agree via common refinement. The source at `K′` is the normalization of the target in its corresponding finite function-field extensions componentwise; finite étaleness holds when the effective target action is free.

At neat source algebraize translations by Borel into another neat source. Apply the local quotient theorem of §3.4a and analytic comparison of §P.6.

Apply §3.4a for scheme existence, invariant affine covers and the free finite étale torsor case. Since the source is quasi-projective over `ℂ`, every finite orbit lies in an affine open. Its descended ample power supplies quasi-projectivity; §P.6 supplies the quotient analytic comparison.

Normality is preserved by finite invariants; characterize normalization componentwise and use common refinement.

**Checks.**

- A quotient with stabilizers is not generally smooth or étale.
- Normalization is in the source field(s), not automatically the target field.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Remark 3.13(a), p.39; neat tower p.58; general finite quotient from §3.4a.)

This uses [3.4 Algebraic maps of Shimura data](#34-algebraic-maps-of-shimura-data); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [3.3 Unique algebraization at neat level](#33-unique-algebraization-at-neat-level); [ModularCurves, layer 0 scheme theoretic prerequisites](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#layer-0-scheme-theoretic-prerequisites); [SchemeAndStackFoundations, §1.17, finite group quotients, on projective sources; local §3.4a on quasi-projective sources](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#117-categorical-and-geometric-quotients-and-artins-bootstrap); [SchemeAndStackFoundations, §§1.17–1.23, quotients and stacks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#117-categorical-and-geometric-quotients-and-artins-bootstrap); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 3.5a The o-minimal structure R_an,exp

**Target.** `TauCeti.Shimura.ran_exp_o_minimal`. Construct the expansion of the ordered real field by real exponential and every restricted real analytic function: use functions analytic on a neighbourhood of `[−1,1]^n` and extended by zero outside that cube. Use Mathlib's formula-with-parameters notion of definable set and graph-definable map. Prove that every definable subset of `ℝ` is a finite union of points and intervals. Construct finite cell decompositions compatible with any finite family of definable sets, definable dimension with its product, projection and fibre-dimension laws, and the finite-atlas/overlap calculus used by §§3.5b–3.5d. This supplies the `o`-minimality hypothesis for definable Chow when the graph is `R_an,exp`-definable. ([van den Dries–Miller, On the real exponential field with restricted analytic functions](https://doi.org/10.1007/BF02758635), Israel `J`. Math. `85 (1994)`, pp.19–56; [erratum](https://doi.org/10.1007/BF02762093), `92 (1995)`, p.427; [BKT](https://benjamin-bakker.github.io/DefArith.pdf), §§1.1–1.2, pp.1–3.)

**Checks.**

- The graphs of real `exp` and its inverse `log` on `ℝ>0` are definable, including on unbounded domains.
- The infinite discrete set `Z` is not definable; a structure naming every real analytic function on its whole domain would fail this test via `sin(πx)`.
- Restricted sine on a compact interval is definable; the graph of real `exp` has dimension one and point fibres under projection to its argument.

### 3.5b Complex cusp charts and the exponential comparison

**Target.** `TauCeti.Shimura.complex_cusp_charts`. For an effective torsion-free arithmetic Hermitian quotient with one fixed maximal compact, construct the complex toroidal cusp charts used in KUY, independently of arithmetic models. Cover each semialgebraic Siegel set by finitely many adapted regions `(x,y,t)`, prove that the adapted coordinate maps are semialgebraic, and prove that their exponential images have compact `closure` in a complex toroidal chart on which the map to Baily–Borel is holomorphic. Bounded real `x` and lower-bounded imaginary `x` give an `R_an,exp`-definable exponential map; compact `closure` gives the restricted-analytic comparison with the algebraic Baily–Borel target. Include chart overlaps and finite-quotient transport. Use §3.5a for the `R_an,exp` structure and its definable-set/map calculus. ([KUY](https://www.numdam.org/item/10.1007/s10240-015-0078-9.pdf), §3.3 and Theorem 1.9, Theorem 4.1, Lemma 4.2 and its exponential argument, pp.336–337,341–346.)

**Checks.**

- In the modular cusp `q=exp(2πiz)`, the unbounded imaginary coordinate uses `R_exp`.
- The exponential image approaches `q=0` inside the compact chart; a chart with no boundary neighbourhood cannot supply the restricted-analytic argument.
- All Siegel sets use the fixed maximal compact; changing it invokes the corrected BKT functoriality conditions.

### 3.5b.1 Nilpotent-orbit factorization

**Target.** `TauCeti.Shimura.nilpotent_orbit_factorization`. Construct the local polarized-variation, horizontal period-domain and monodromy interfaces from §P.3 and ComplexComparisonPartII's complex connection dictionaries. Let a pure rational variation of weight `k` on `(Δ*)^r×Δ^s, r≥1`, have a flat polarization and a monodromy-stable integral lattice. After a finite power cover of the punctured coordinates its commuting monodromies `T_j` are unipotent; construct `N_j=log T_j`. For a horizontal lift `Φ̃` with `Φ̃(z+e_j,w)=T_jΦ̃(z,w), q_j=exp(2πiz_j)`, prove, after shrinking the polydisk,
`Φ̃(z,w)=exp(Σ z_jN_j)Ψ(q,w)`,
where `Ψ` extends holomorphically across `q_j=0` into the compact dual. With `F_∞(w)=Ψ(0,w)`, prove that `exp(Σ z_jN_j)F_∞(w)` is horizontal and lies in the polarized domain when all `Im z_j` are sufficiently large; prove the exponentially decaying distance estimate of Schmid (4.12), locally uniformly in `w`. Construct the monodromy weight filtrations and polarized limiting mixed Hodge structures used in §3.5b.2. The limiting filtration itself need not be a point of the pure period domain. ([Schmid, Variation of Hodge structure: the singularities of the period mapping](https://doi.org/10.1007/BF01389674), (4.12), pp.232–233, and §6; [Cattani–Kaplan–Schmid, Degeneration of Hodge structures](https://doi.org/10.2307/1971333), §§2–3; [BKT](https://benjamin-bakker.github.io/DefArith.pdf), Lemma 4.2, pp.13–14.)

**Checks.**

- For trivial monodromy all `N_j` vanish and the lifted period map extends holomorphically into the pure domain.
- A nodal elliptic degeneration has nonzero `N` with `N²=0`; its logarithmic term survives although `Ψ` extends over `q=0`.
- Finite nontrivial monodromy becomes trivial only after the power cover; no single-valued original lift across the puncture is asserted.

### 3.5b.2 Ordered-sector Hodge norms

**Target.** `TauCeti.Shimura.ordered_sector_hodge_norm`. For the polarized unipotent degeneration of §3.5b.1, fix an ordering of its `N_j` and the limiting filtration `F_∞=Ψ(0)`. Construct the shifted monodromy weight filtrations `W_j=W(N_1+⋯+N_j)`, centered at zero, and a rational simultaneous splitting `V_Q=⊕ J_(s_1,…,s_r)` with `(W_j)_l=⊕_(s_j≤l) J_s`. For each fixed nonzero `u∈J_s⊗C`, the squared Hodge norm `h_z` of the actual period map satisfies
`h_z(u) ≍ (y_1/y_2)^s_1⋯(y_(r−1)/y_r)^s_(r−1)y_r^s_r`,
and the same comparison holds for `h_z(exp(Σ z_jN_j)u)`. Here `0≤Re z_j≤1` and `y_1≥⋯≥y_r≥c>0`, with `c` sufficiently large after shrinking the polydisk; each comparison has positive constants depending on `u` and the fixed degeneration, uniformly on this sector and on compact sets of the unpunctured parameters. Construct also the limiting-filtration-compatible complex splitting and the comparison `h_z(γ(z)u)≍h_z(exp(Σ z_jN_j)u)` on its homogeneous pieces, with `γ(z)=exp(Σ z_jN_j)g(q)` and the negative-Deligne-splitting holomorphic lift `g` of `Ψ` as in BKT §4.4. These estimates require the polarized nilpotent-orbit limiting filtrations; no estimate for arbitrary commuting nilpotents is asserted. Cover the other sectors by permuting the ordered coordinates. ([Cattani–Kaplan–Schmid, Degeneration of Hodge structures](https://doi.org/10.2307/1971333), Theorem 5.21; [BKT](https://benjamin-bakker.github.io/DefArith.pdf), §4.4, Theorem 4.8 and Lemma 4.10, pp.15–17.)

**Checks.**

- A constant variation has only weight index `s=(0,…,0)` and bounded positive norm for a fixed nonzero vector.
- In a one-variable elliptic degeneration the two shifted weight pieces have squared-norm growth `y` and `y⁻¹`, rather than both being bounded.
- The zero vector has zero norm and is excluded from the positive lower bound; a bound on the ordered sector is not claimed on sectors with a different ordering without permuting the filtrations.

### 3.5c Polarized period-map definability

**Target.** `TauCeti.Shimura.polarized_period_definable`. For a polarized variation of pure rational Hodge structures of fixed weight on a smooth quasi-projective complex variety `S`, with its arithmetic monodromy and Hodge domain, prove that its actual holomorphic period map is `R_an,exp`-definable in the Hodge metric's maximal-compact structure. Use the variation and local period-map interfaces of §3.5b.1, with a monodromy-stable lattice after a finite cover. Prove the local punctured-polydisk result using §3.5b.1’s nilpotent-orbit factorization and §3.5b.2’s ordered-sector Hodge estimates to obtain finitely many Siegel sets meeting the image; use §3.5a’s definable calculus and glue through an SNC compactification. For the inverse-image-of-Siegel-sets step use Bakker–Grimm–Schnell–Tsimerman, [Finiteness for self-dual classes in integral variations of Hodge structure](https://arxiv.org/abs/2112.06995v1), Proposition 28.1, pp.14–15. With the Hodge maximal compacts, AdelicAlgebraicGroups §3.7 supplies its forward-containment hypothesis and the ambient compact intersects the subgroup in its maximal compact. The BKT erratum §1.5 substitutes this proposition for Borel–Harish-Chandra 7.5, which concerns real Siegel sets. This statement concerns actual polarized period maps. ([BKT](https://benjamin-bakker.github.io/DefArith.pdf), Theorems 1.3, 1.5 and §§4.1–4.5, pp.5–6,13–18; [BKT erratum](https://benjamin-bakker.github.io/DefArithErr.pdf), §§1.4–1.5, p.3 (canonical Hodge maximal compact and corrected period-map proof).)

**Checks.**

- A constant polarized variation gives a constant definable period map.
- Weight-one elliptic variations retain their integral monodromy and `q`-coordinate.
- An arbitrary holomorphic map to a complex analytic space is not covered by the period-map hypothesis.

### 3.5d Definable Chow

**Target.** `TauCeti.Shimura.definable_chow`. For a smooth complex algebraic variety `S` and a closed complex analytic subset `W⊂S^an` definable in an `o`-minimal expansion of `R_an`, prove that `W` is algebraic. Construct the required local complex definable-analytic dimension and extension arguments and global algebraic `closure` comparison; ordinary projective Chow alone is not the nonproper theorem. Supply the graph application: if the closed analytic graph is definable in the algebraic product's definable structure, its projection comparison algebraizes the represented holomorphic map. ([Peterzil–Starchenko, Complex analytic geometry and analytic-geometric categories](https://doi.org/10.1515/CRELLE.2009.039), Theorem 4.4 and Corollary 4.5; [BKT](https://benjamin-bakker.github.io/DefArith.pdf), Theorem 4.13 and graph argument, p.18.)

**Checks.**

- The graph of a polynomial map on `𝔸¹` is definable and algebraic.
- The complex exponential graph is analytic but is not definable in the required `o`-minimal structure on the whole complex line.
- Closedness is essential: the unit disk inside `𝔸¹(C)` is definable and locally analytic, but is not an algebraic subset.

### 3.6 Definable comparison with the algebraic target

Prove `TauCeti.Shimura.definable_target_comparison` as follows. For a torsion-free effective arithmetic Hermitian quotient `Γ∖D` and a fixed maximal compact `K∞` defining its symmetric realization, the `R_an,exp` structure extending its arithmetic `R_alg` structure, in the `K∞`-dependent form fixed by the BKT erratum, agrees through the Baily–Borel algebraization with the definable structure induced by the `ℂ`-scheme. This comparison is certified independently of Borel algebraicity.

Fix the maximal compact throughout: by the BKT erratum the arithmetic definable atlas depends on `K∞`, and all Siegel sets are taken for the same `K∞`. Pass to a neat finite-index subgroup and remove compact ineffective factors using the existing AA contracts; transport back through the finite quotient.

Apply KUY Theorem 4.1: cover a semialgebraic Siegel set by finitely many cusp regions in adapted coordinates `(x,y,t)`. Lemma 4.2 makes these coordinates semialgebraic. The bounded real parts of `x` make `exp(2 π i Re x)` restricted analytic, while `exp(-2 π Im x)` uses `R_exp`. After this exponential map each region has compact `closure` in a complex toroidal chart, so its holomorphic map into the algebraic Baily–Borel compactification is `R_an`-definable.

The arithmetic quotient atlas and the algebraic-target atlas therefore have a definable comparison in `R_an,exp`. Surjective definable charts give a definable inverse. The argument uses Baily–Borel and independently constructed complex cusp/toroidal charts, not Borel algebraicity. Sections 3.5a–3.5d construct the required charts and `o`-minimal theorems independently of arithmetic toroidal descent.

**Checks.**

- The `q=e^{2πiz}` cusp comparison requires `R_an,exp`, not merely `R_an`.
- Do not assert maximal-compact-independent functoriality for arbitrary `G/M`.

([B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §§1.1–1.2 and §4.6, pp.1–4,18; [B. Bakker, B. Klingler, J. Tsimerman, Erratum](https://benjamin-bakker.github.io/DefArithErr.pdf), §§1.1–1.3 and Theorem 1.2, pp.1–3; [B. Klingler, E. Ullmo, A. Yafaev, The hyperbolic Ax-Lindemann-Weierstrass conjecture](https://www.numdam.org/item/10.1007/s10240-015-0078-9.pdf), Theorem 1.9, pp.336–337; §4, Theorem 4.1 and Lemma 4.2, pp.343–346; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-3-reduction-and-arithmetic-quotients.)

This uses [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [AdelicAlgebraicGroups, §3.6, real Siegel sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact); [AdelicAlgebraicGroups, §3.7, containment of subgroup Siegel sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#37-subgroup-containment-and-orbit-maps); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison), with the exact supplier contracts above.

### 3.7 Definable-graph proof of Borel algebraicity

Prove `TauCeti.Shimura.definable_borel` as follows. For smooth quasi-projective `S` over `ℂ` and a torsion-free effective arithmetic Hermitian quotient `Y`, a holomorphic `S^an→Y^an` is algebraic by the definable-graph argument once the independently proved algebraic-target comparison and period-map definability are supplied.

Pull back a faithful polarized homogeneous Hodge variation so the map is an actual period map; use BKT 1.3 with its hypotheses, not definability of every arbitrary holomorphic map.

Via the independent target comparison, the graph is both closed complex analytic and `R_an,exp`-definable in `(S×Y)^an`.

Apply the Peterzil–Starchenko `o`-minimal Chow theorem, then algebraize the graph projection. Use the period-map and definable Chow theorems of §§3.5c–3.5d, with §3.5a supplying the `o`-minimality of `R_an,exp`.

**Checks.**

- Using the arithmetic definable structure without comparison with the algebraic target does not justify the algebraic graph step.
- The extension proof remains an independent route and does not depend on this alternative.

([B. Bakker, B. Klingler, J. Tsimerman, Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), §4.6, Theorems 4.12–4.13, p.18.)

This uses [3.5a The o-minimal structure R_an,exp](#35a-the-o-minimal-structure-r_anexp); [3.5c Polarized period-map definability](#35c-polarized-period-map-definability); [3.5d Definable Chow](#35d-definable-chow); [3.6 Definable comparison with the algebraic target](#36-definable-comparison-with-the-algebraic-target); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison), with the exact supplier contracts above.

### 3.8 Complex minimal compactification functoriality

Prove `TauCeti.Shimura.minimal_datum_extension` as follows. A morphism of pure data `f:D1 → D2` and compatible compact open levels, with a compatible admissible right translation, induces a unique morphism of their complex Baily–Borel minimal compactifications extending the map of the open algebraic varieties. It sends rational boundary strata by the induced boundary morphisms and respects identity and composition. `Level` maps extend finitely, using the finite-level quotient theorem. No finiteness or boundary étaleness is asserted for an arbitrary datum morphism.

Throughout this result, both complex compactifications are the specified Layer 2 Baily–Borel constructions. For a translated map from `K₁` to `K2`, the translated image of `K₁` lies in `K2`. Use neat normal sublevels and effective finite quotients at non-neat levels.

Use rational boundary-component functoriality and the Satake topology. Pink 6.2, p.95 explicitly extends the maps of 3.4(a)–`(b)` holomorphically between the normal projective compactifications; this is the complex input, independent of 12.3 arithmetic descent.

Algebraize the graph in the projective product by `C4`. Equality on the dense reduced open with separated target proves uniqueness and all functor laws.

For level maps use [2.9 Level maps on minimal compactifications](#29-level-maps-on-minimal-compactifications) and finite quotients; descend from neat normal refinements for the general level.

**Checks.**

- For `g=1` and an inclusion of levels the extension is the existing minimal level map.
- A constant datum morphism is not generally finite.
- At a modular cusp, extended level maps may ramify.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 3.4, pp.42–43; 6.2, pp.94–95 (holomorphic extension at end of p.95); 9.25, p.159; arithmetic consequence 12.3(b), p.197.)

This uses [2.1 Rational boundary components and incidence](#21-rational-boundary-components-and-incidence); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [2.9 Level maps on minimal compactifications](#29-level-maps-on-minimal-compactifications); [3.4 Algebraic maps of Shimura data](#34-algebraic-maps-of-shimura-data); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 3.9 Codimension-one boundary and auxiliary data

Prove `TauCeti.Shimura.codim_one_analytic_extension` as follows. For pure `D=(G,X)` and neat `K`, the codimension-one boundary strata arise from `ℚ`-simple factors of `G^ad` isomorphic to `PGL₂,Q`, through surjections `G → PGL₂,Q`. Their parabolics are inverse images of rational Borels. If such a surjection lifts to `D → (GL₂,H±)`, the derived `SL₂` factor defines `Dprime=D/SL₂` in Pink’s broader datum category and an embedding `D → Dprime × (GL₂,H±)`, with the same reflex field. At compatible sufficiently small levels its corresponding codimension-one partial extension is a closed subspace of the product of the `Dprime` open variety with the `GL₂` minimal compactification, equal to the `closure` of the open image. In general `Gtilde=G ×_{PGL₂} GL₂` has kernel `G_m` over `G`; its compatible partial extension maps finitely and surjectively onto the one for `G`, which is its effective finite quotient. These are complex statements only.

Retain Pink’s finite domain over the homomorphism class for the auxiliary data; a quotient need not be a strict one-point torus datum. The partial extension includes only the boundary strata associated to the chosen `PGL₂` factor. Glue the partial extensions over the common open to include all codimension-one strata. Levels and their images are chosen as in Pink 12.10; arithmetic canonical models of these broader auxiliary data are constructed in §8.16a.

Apply the rational-boundary classification of §2.1 and the codimension calculation to identify the `PGL₂,Q` factors.

When the lift exists, the `SL₂` derived factor and connectedness of `SL₂(ℝ)` give the broader quotient datum and product embedding; boundary functoriality gives its closed extension at small levels.

Without the lift, the fibre-product group has kernel `G_m` and the adelic `H1` vanishing makes the partial map surjective. The boundary quotient comparison makes it finite, and the effective finite group quotient recovers the original partial extension.

**Checks.**

- For `GL₂, Dprime` is `(G_m,{±1})`; replacing it by a one-point domain loses a determinant component.
- For Hilbert data over `F` different from `ℚ` there is no `PGL₂,Q` factor and no codimension-one boundary.
- At intersections of boundary divisors from distinct factors the codimension is at least two, so those intersections are omitted from the partial open.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 2.9, pp.32–33; 8.2, pp.132–133; 12.10, pp.200–201.)

This uses [2.1 Rational boundary components and incidence](#21-rational-boundary-components-and-incidence); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [3.8 Complex minimal compactification functoriality](#38-complex-minimal-compactification-functoriality); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory), with the exact supplier contracts above.

### 3.10 Logarithmic canonical section embedding

Prove `TauCeti.Shimura.log_canonical_section_embedding` as follows. For pure `D` and neat `K`, let `M_C^+` be the open of the normal minimal compactification consisting of `M_C` and all codimension-one boundary strata. It is smooth, its boundary `B` is a smooth divisor and its omitted complement has codimension at least two. Define `ω[dlog]=det Ω¹_{M_C^+}(log B)=ω_{M_C^+}(B)`. Its `n`-th power has sections equal to the holomorphic automorphic forms of the corresponding canonical weight with the boundary growth condition. For some `n0>0` and every positive multiple `n` of `n0`, these sections are finite dimensional, globally generate `ω[dlog]^n` on `M_C^+`, and the evaluation map to `P(H0(M_C^+,ω[dlog]^n)^vee)` extends to a closed embedding of the full minimal compactification. The pullback of `O(1)` restricts to `ω[dlog]^n` on `M_C^+`.

Assume pure data and neat level, with the specified analytic Baily–Borel construction. `PGL₂,Q` factors retain the cusp condition; away from these factors Koecher supplies the extension. This uses the logarithmic line on the partial open, not an intrinsic canonical bundle of a lower-dimensional boundary stratum.

Use the boundary codimension calculation to obtain smoothness and the smooth divisor on `M_C^+`.

On the open, powers of the top differential bundle identify with the canonical-weight automorphic forms. At `PGL₂` cusps, `dq/q` gives the logarithmic trivialization and holomorphy in `q` is exactly the growth condition. Apply Koecher for the other factors.

Apply the separating section system of Baily–Borel 10.11 as formulated in Pink 8.2; high divisible powers extend the evaluation map to the full closed embedding. This is the exact linear-system interface used in Pink 12.12, distinct from unrestricted full-ring finite generation.

**Checks.**

- For modular curves, `f(q)(dq/q)^n` extends precisely when `f` is holomorphic at the cusp; `j(q)`, which has a pole, fails.
- With no `PGL₂,Q` factor, `M_C^+=M_C` and Koecher removes the additional cusp check.
- A sufficiently divisible `n` is required; the degree-one canonical system need not embed the compactification.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, pp.132–133; 12.12, p.202; [W. L. Baily, Jr. and A. Borel, Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), 10.11, pp.522–523.)

This uses [3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data); [2.3 Analytic automorphic graded ring](#23-analytic-automorphic-graded-ring); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [2.8 Koecher principle and boundary codimension](#28-koecher-principle-and-boundary-codimension); [ComplexComparisonPartII, Layer C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c2-projective-and-proper-consequences-of-coherent-gaga); [2.4 Automorphic sections separating strata](#24-automorphic-sections-separating-strata), with the exact supplier contracts above.

### Examples

The smooth source `ℂ` and the coarse torsion target `Y(1)=𝔸¹` admit the nonalgebraic holomorphic map `exp`; this rules out extending Borel algebraicity to every torsion quotient. A constant map into a neat quotient is algebraic. In the independent definable argument, `q=exp(2πiz)` requires the real exponential together with restricted analytic sine/cosine; semialgebraic or `R_an` structure alone does not suffice.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, §3.7, containment of subgroup Siegel sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#37-subgroup-containment-and-orbit-maps); [AdelicAlgebraicGroups, §3.6, real Siegel sets](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#36-cusps-for-one-fixed-maximal-compact); [AlgebraicModuliForArithmeticGeometry, §§9.4–9.5, resolution and SNC compactification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#95-snc-compactification-and-cartier-separation); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification); [ComplexComparisonPartII, Layer C2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c2-projective-and-proper-consequences-of-coherent-gaga); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [SchemeAndStackFoundations, §§1.17–1.23, quotients and stacks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#117-categorical-and-geometric-quotients-and-artins-bootstrap); [SchemeAndStackFoundations, §1.17, finite group quotients, on projective sources; local §3.4a on quasi-projective sources](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#117-categorical-and-geometric-quotients-and-artins-bootstrap); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ModularCurves, layer 0 scheme theoretic prerequisites](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#layer-0-scheme-theoretic-prerequisites); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

Earlier constructions used here are 0.4 Proper effective arithmetic action; 1.3 Holomorphic finite level maps; 1.6 Holomorphic maps of data; 2.1 Rational boundary components and incidence; 2.3 Analytic automorphic graded ring; 2.4 Automorphic sections separating strata; 2.7 Baily–Borel algebraization; 2.8 Koecher principle and boundary codimension; 2.9 `Level` maps on minimal compactifications.

## Layer 4: Reciprocity, canonical models and foundational descent

### 4.1 Milne geometric Artin conversion

Define `TauCeti.Shimura.geometricArtin` as follows. Given the supplier arithmetic reciprocity `rec_F:A_F×→Gal(F^ab/F)` sending a uniformizer to arithmetic Frobenius, define `art_F(s)=rec_F(s)⁻¹`. This is a continuous homomorphism because the target is abelian. Its kernel equals that of `rec_F`; all reflex-norm formulas here use `art_F`.

Throughout this result, the supplied reciprocity homomorphism has abelian target and arithmetic Frobenius normalization.

Invert the arithmetic Artin homomorphism in its abelian target.

Preserve continuity, surjectivity and kernel; compare a local uniformizer and the cyclotomic character before applying CM reciprocity.

Expose the following named operations and laws.

- `TauCeti.Shimura.geometricArtin_apply`: `art_F(s)=rec_F(s)⁻¹`.
- `TauCeti.Shimura.geometricArtin_mul`: `art_F(st)=art_F(s)art_F(t)`.
- `TauCeti.Shimura.geometricArtin_kernel`: `ker art_F=ker rec_F` as closed subgroups.
- `TauCeti.Shimura.geometricArtin_norm`: For `L/F` finite, `art_F(N_{L/F}s)=res(art_L(s))`.

**Checks.**

- `TauCeti.Shimura.geometricArtin_uniformizer`: At an unramified place, `art_F(π_v)` is inverse arithmetic Frobenius.
- `TauCeti.Shimura.geometricArtin_one`: `art_F(1)=1`.
- `TauCeti.Shimura.geometricArtin_cyclotomic`: For `u=χ_cyc(σ)∈ℤ̂×, art_Q(u)=σ` on `Q^ab`; changing to `rec` reverses the action.

([J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), §3, p.21, before Lemma 3.4.)

This uses [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity), with the exact supplier contracts above.

### 4.2 Reflex norm of a special torus

Define `TauCeti.Shimura.ReflexNorm` as follows. For an actual special pair `(T,h)` with cocharacter `μ_h` defined over `E=E(T,h)`, define `r_h:Res_{E/ℚ}G_m→T` by `r_h=Norm_{E/ℚ}∘Res_{E/ℚ}(μ_h)`. `Over` a splitting field its value is the product `∏_{ρ:E→C}ρ(μ_h(s_ρ))`; evaluate it on finite ideles to get `r_h:A_{f,E}×→T(𝔸_f)`. The map is the product of the conjugate cocharacters, not a sum; SVI `(60)`–`(61)` write this product with a summation sign.

Construct restriction of scalars of the cocharacter and the torus norm using the supplier character/cocharacter lattice equivalence.

Check Galois invariance of the product formula and descend the morphism over `ℚ`.

Evaluate on restricted adelic points and prove rational-principal and level compatibility.

Expose the following named operations and laws.

- `TauCeti.Shimura.ReflexNorm.apply_split`: In splitting coordinates `r_h(s)=∏ρ ρ(μ_h(s_ρ))`.
- `TauCeti.Shimura.ReflexNorm.principal`: For `b∈E×, r_h(b)∈T(ℚ)`, hence its action on every torus double quotient is trivial.
- `TauCeti.Shimura.ReflexNorm.map`: For `f:T0 → T, μ=f` composed with `mu0, E0=E(mu0)` and `E=E(μ)`, so `E` is contained in `E0, f` composed with `r(T0,mu0)=r(T,μ)` composed with `Nm_{E0/E}`; this holds on full ideles, and its full statement is [4.9 Reflex norm under a torus morphism](#49-reflex-norm-under-a-torus-morphism).
- `TauCeti.Shimura.ReflexNorm.continuous`: The finite-idelic map is a continuous group homomorphism.
- `TauCeti.Shimura.ReflexNorm.ext`: Two rational torus homomorphisms `Res_{E/ℚ}G_m→T` agreeing on the split cocharacter formula after a splitting-field base change are equal.
- `TauCeti.Shimura.ReflexNorm.mul`: The reflex norm sends 1 to 1 and `r_h(st)=r_h(s)r_h(t)`, as an algebraic group morphism and on finite ideles.

**Checks.**

- `TauCeti.Shimura.ReflexNorm.trivial`: A trivial cocharacter gives the constant identity morphism.
- `TauCeti.Shimura.ReflexNorm.split_power`: For `T=G_m, E=Q` and `μ(t)=t^n, r_h(s)=s^n`, including `n=0` and negative `n`.
- `TauCeti.Shimura.ReflexNorm.aghmp`: For `T=Res_{E/ℚ}G_m/ker(N_{F/Q})` in AGHMP §3.1 and its distinguished cocharacter, `r_h` is the natural quotient map `Res_E G_m→T`.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §12, formulas `(60)`–`(61)`, p.114 (read multiplicatively); [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-1-adelic-points-of-algebraic-groups; [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [AdelicAlgebraicGroups, §1.4, restriction of scalars on adelic points](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#14-restriction-of-scalars-and-concrete-groups), with the exact supplier contracts above.

### 4.3 Finite-level reciprocity and idele independence

Prove `TauCeti.Shimura.reciprocity_finite_action` as follows. For a torus datum `(T,h)` and compact open `K`, the action of `r_h(s)` on the finite set `T(ℚ)∖T(𝔸_f)/K` factors continuously through `Gal(E^ab/E)` via `art_E`. Thus equal Artin lifts act identically at every level. At the full tower the natural reciprocity values lie in `T(𝔸_f)/closure(T(ℚ))`; do not replace the `closure` by `T(ℚ)` without the needed additional CM norm lemma.

Principal ideles act through `T(ℚ)`; infinite connected ideles are killed in the finite quotient. Continuity kills the `closure` of the Artin kernel.

Factor through the finite quotient Galois action, whose point stabilizers are open.

For general special points insert this torus map into the datum and pass through the double-quotient point map.

**Checks.**

- For torus levels, dependence only on Artin follows modulo `T(ℚ)K`; literal equality of reflex-norm ideles is unnecessary.

([J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), §2, pp.3–4, reciprocity map and its finite-level action.)

This uses [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition); [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity), with the exact supplier contracts above.

### 4.4 Canonical-model condition

Define `TauCeti.Shimura.CanonicalModel` as follows. A finite-level canonical model of `(G,X,K)` is a normal quasi-projective scheme `S` over `E(G,X)`, with an isomorphism `S_C^an≅Sh_K^an`, such that for every actual special pair `i:(T,h)→(G,X)` of §P.1 and every `a∈G(𝔸_f)`, the point `[h,a]` is defined over `E(T,h)^ab` and every `σ∈Gal(E(T,h)^ab/E(T,h))` acts by `σ[h,a]=[h,i(r_h(s))a]` for `art_{E(T,h)}(s)=σ`. A canonical tower includes compatible level maps and the right `G(𝔸_f)`-action over `E`, with these conditions at every level.

Take the model over the actual cocharacter reflex field and the analytic comparison; quantify over actual torus subdata, not a free set of points.

Use §4.3 to make the formula independent of the lift.

Record finite-level and compatible-tower variants and compare them via sufficiently small levels.

Expose the following named operations and laws.

- `TauCeti.Shimura.CanonicalModel.scheme`: The underlying scheme is over `Spec E(G,X)`, with normal/quasi-projective structure.
- `TauCeti.Shimura.CanonicalModel.comparison`: The chosen comparison is an isomorphism of complex analytic spaces after base change to `ℂ`.
- `TauCeti.Shimura.CanonicalModel.special_rational`: For every actual special pair and a, the comparison point is `E(T,h)^ab`-rational.
- `TauCeti.Shimura.CanonicalModel.special_action`: Its Galois action is the precise geometric-Artin reflex-norm formula, independent of an Artin lift.
- `TauCeti.Shimura.CanonicalModel.level`: A tower supplies level maps over `E`, with identity/composition and analytic point formula.
- `TauCeti.Shimura.CanonicalModel.baseChange`: For `E⊂L⊂C`, base change retains the same comparison and restricted special-point action; the defining minimal field remains `E`.
- `TauCeti.Shimura.CanonicalModel.ofSpecialAction`: An `E`-scheme with the stated normal/quasi-projective structure, analytic comparison, special-point rationality and the full reciprocity formula defines a finite-level canonical model. Tower construction also requires compatible level maps and translations.
- `TauCeti.Shimura.CanonicalModel.hom_ext`: Two `E`-morphisms between the underlying finite-level models whose complex analytic maps agree are equal, by faithful base change and analytification. This is morphism extensionality; model uniqueness is §4.12.

**Checks.**

- `TauCeti.Shimura.CanonicalModel.trivial`: The trivial datum has canonical model `Spec ℚ` with its one-point comparison.
- `TauCeti.Shimura.CanonicalModel.torus_neat`: The finite étale torus model satisfies this condition using its constructed Galois action.
- `TauCeti.Shimura.CanonicalModel.not_arbitrary_subset`: For `T=G_m, h(z)=z z̄` and principal `K(5)`, the analytic quotient has two points `(ℤ/5ℤ)×/{±1}`. The split model `Spec ℚ ⊔ Spec ℚ` with any two-point comparison satisfies a condition imposed only on an arbitrary (for instance empty) set of special points, but fails canonicity: an automorphism with cyclotomic character 2 modulo 5 must interchange the two classes by reciprocity, whereas the split model fixes both.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 12.8, p.114 and Definition 12.10, p.115.)

This uses [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [4.3 Finite-level reciprocity and idele independence](#43-finite-level-reciprocity-and-idele-independence); `AlgebraicGeometry.Scheme`; `CategoryTheory.Over`, with the exact supplier contracts above.

### 4.5 Finite étale torus canonical models

Construct `TauCeti.Shimura.torusModel` as follows. The finite continuous `Gal(ℚ̄/E)`-set `T(ℚ)∖T(𝔸_f)/K` from reciprocity corresponds to a finite étale `E`-scheme `S_K`. Its complex points identify with `Sh_K(T,{h})`, and the constructed Galois action makes it a canonical model. This is the coarse scheme at every `K`; the AGHMP non-neat quotient stack is a separate object.

Apply the finite-étale-scheme/finite-continuous-Galois-set equivalence with its field/base-change comparison.

Use the actual finite torus double quotient as the Galois set, not just its cardinality.

Transport its complex point equivalence and verify all torus special-pair reciprocity maps by norm functoriality.

Expose the following named operations and laws.

- `TauCeti.Shimura.torusModel.points`: `S_K(ℚ̄)≃T(ℚ)∖T(𝔸_f)/K` as Galois sets, with the prescribed action.
- `TauCeti.Shimura.torusModel.level`: For `K′⊂K` the double-quotient projection induces a finite étale morphism, compatible with identity/composition.
- `TauCeti.Shimura.torusModel.translate`: Right translation by `a∈T(𝔸_f)` is defined over `E` and commutes with reciprocity.
- `TauCeti.Shimura.torusModel.map`: A morphism of torus data gives a map over a common field containing both reflex fields, compatible with the norm on Artin lifts.
- `TauCeti.Shimura.torusModel.finiteEtale`: The resulting scheme is finite étale over `E`, with degree equal to the Galois-set cardinality.
- `TauCeti.Shimura.torusModel.hom_ext`: Two `E`-morphisms between finite étale torus models agreeing on all geometric points are equal under the finite-continuous-Galois-set equivalence.

**Checks.**

- `TauCeti.Shimura.torusModel.maximal_split`: For `T=G_m, h(z)=z z̄, K=ℤ̂×, E=Q`, the coarse scheme is `Spec ℚ`.
- `TauCeti.Shimura.torusModel.split_level_five`: For the same datum and principal `K(5)`, the Galois set is `(ℤ/5ℤ)×/{±1}`; the degree-two model is `ℚ(ζ₅+ζ₅⁻¹)`, not `ℚ(ζ₅)`.
- `TauCeti.Shimura.torusModel.trivial`: For the trivial torus every level gives `Spec ℚ`.

([F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, p.416.)

This uses [4.3 Finite-level reciprocity and idele independence](#43-finite-level-reciprocity-and-idele-independence); [4.4 Canonical-model condition](#44-canonical-model-condition); [ModularCurves, layer 0 scheme theoretic prerequisites](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#layer-0-scheme-theoretic-prerequisites), with the exact supplier contracts above.

### 4.6 AGHMP torus stack and coarse model

Prove `TauCeti.Shimura.aghmp_stack_comparison` as follows. For the specific AGHMP torus `T=Res_{E/ℚ}G_m/ker(N_{F/Q})`, distinguished cocharacter and neat normal `K′⊂K`, the generic CM Shimura stack is `[S_{K′}/(K/K′)]`. Its coarse space is `S_K`, independent of `K′`; at neat `K` it is the finite étale scheme above. At non-neat `K` retain its finite isotropy, rather than identify the stack with its coarse point set. The integral maximal-level model and CM Hodge lattices belong to the CM/integral owners.

Use the §3.1 computation that the reflex norm is the quotient map.

Import SchemeAndStackFoundations §1.21, quotient stacks and quotient-stack-algebraic for the finite constant group action, retaining inertia. SchemeAndStackFoundations §1.23, `finite_quotient_coarse` identifies its coarse scheme with the finite quotient Galois set `S_K`; the finite étale `S_{K′}` is affine, so its orbit-cover hypothesis holds.

At a common neat normal refinement the intermediate free level action is a finite étale torsor. Apply SchemeAndStackFoundations §1.20, `stack_presentation`, or the quotient-stack torsor description, to compare the presentations. Keep stabilizer data at non-neat level; the generic scheme alone cannot encode it.

**Checks.**

- For an imaginary quadratic `E` at maximal units, roots of unity contribute stack inertia even when the coarse scheme has one geometric point.
- Do not claim a finite DM stack for an arbitrary torus with infinite rational central-unit stabilizers.

([F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), §3.1, pp.415–416.)

This uses [4.5 Finite étale torus canonical models](#45-finite-étale-torus-canonical-models); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [SchemeAndStackFoundations, §1.21, quotient stacks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#121-quotient-stacks-line-bundles-with-a-section-root-stacks); [SchemeAndStackFoundations, §1.21, quotientStack_algebraic](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#121-quotient-stacks-line-bundles-with-a-section-root-stacks); [SchemeAndStackFoundations, §1.23, finite_quotient_coarse](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#123-moduli-functors-fine-and-coarse-moduli-spaces-keelmori-tame-stacks); [SchemeAndStackFoundations, §1.20, stack_presentation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#120-inertia-the-setoid-criterion-properties-of-morphisms-and-presentations), with the exact supplier contracts above.

### 4.7 Existence and density of special points

Prove `TauCeti.Shimura.special_existence` as follows. Every pure datum has an actual special point, obtained from a rational maximal torus compact modulo the appropriate centre. Such points are dense in `X` in its real topology, hence their images are Zariski dense in each complex algebraized component.

Choose a regular semisimple `Lie` element in the compact-`mod`-centre real Cartan; approximate by a rational regular semisimple element.

Its rational maximal torus supports the conjugated special homomorphism. Apply the same construction near arbitrary domain points.

**Checks.**

- The rational approximant must remain regular semisimple, not merely a regular nilpotent element.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.3, p.117.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization), with the exact supplier contracts above.

### 4.8 Density of Hecke translates

Prove `TauCeti.Shimura.hecke_density` as follows. For any `x∈X`, the finite-level set `{[x,a]_K:a∈G(𝔸_f)}` is Zariski dense in `Sh_{K,C}`. In particular the Hecke translates of a fixed actual special point are dense. This uses real approximation in `G(ℚ)_+`, not unrestricted strong approximation in `G(𝔸_f)`.

Fix a component representative a. Rational real approximation makes `G(ℚ)_+x` dense in `X⁺` after choosing `x` in that component.

Rewrite rational domain translates through the diagonal equivalence as finite-adelic Hecke translates.

Real analytic density implies algebraic Zariski density on each component.

**Checks.**

- This does not assert that each arithmetic `Γ` orbit in `D` is dense.
- The torus case says its finite Hecke orbit is the entire finite set.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 13.5, p.118.)

This uses [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition); [1.4 Holomorphic right translations](#14-holomorphic-right-translations); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory), with the exact supplier contracts above.

### 4.9 Reflex norm under a torus morphism

Prove `TauCeti.Shimura.ReflexNorm.map_full` as follows. Let `f:T0 → T` be a morphism of `ℚ`-tori and let `mu0` be a cocharacter with `μ=f` composed with `mu0`. Put `E0=E(mu0), E=E(μ)`, so `E` is contained in `E0`. Then `f` composed with `r(T0,mu0)` equals `r(T,μ)` composed with `Nm_{E0/E}`, as `ℚ`-group morphisms `Res_{E0/Q}G_m → T` and on full ideles, including the archimedean factor. Geometric Artin maps obey `art_E(Nm s)=art_{E0}(s)|_{E^ab}`. These identities give special-pair functoriality and the component reciprocity map with its real-domain action.

Throughout this result, the cocharacters and their fields of definition are actual ones, not arbitrary chosen fields. For special-pair application use the local datum foundations of §§P.1–P.4; for zero-dimensional component application retain the full idele and finite real-domain action.

Galois equivariance of `f` makes the stabilizer of `mu0` a subgroup of the stabilizer of `μ`, proving `E` subset `E0`.

After a common splitting-field base change, group the factors of the product formula by embeddings of `E`; the product over embeddings extending one embedding is the field norm. Faithful descent proves equality of group morphisms.

Evaluate on all adelic points. Apply norm/restriction compatibility of arithmetic reciprocity and then invert to the Layer 4 geometric convention.

**Checks.**

- For `T0=T=G_m, mu0(z)=z^m` and `f(z)=z^n` over `ℚ`, both sides send `s` to `s^{mn}`.
- When `μ` is trivial but `mu0` is not, its smaller reflex field must still appear through the norm; dropping that norm gives a wrongly typed formula.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 12.3(c), p.112; `(60)`–`(61)`, p.114, read multiplicatively; 13.8 and `(64)`, p.119; [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.4, pp.155–156; [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus.)

This uses [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity), with the exact supplier contracts above.

### 4.9a Selected cocharacter incidence

**Target.** `TauCeti.Shimura.cocharacter_incidence`. For `D=(G,X)`, let `V` be the regular semisimple `Lie` open of §P.5. Construct the finite étale cover `W→V` of pairs `(v,μ)` with `μ∈X_*(T_v)` whose geometric `G`-conjugacy class lies in the finite Galois orbit of the datum's class. Split `T_v` étale locally, identify its cocharacters with its character-dual lattice, and select the finite Weyl/Galois orbit; descend this selected cover. The full cocharacter `Hom` functor is an étale lattice sheaf and need not be finite. Construct `p:W→Spec E(D)` and prove that its geometric fibres are irreducible: the cocharacter conjugacy orbit is irreducible, its centralizer is connected, and the maximal tori in that centralizer form an irreducible parameter space. `W` is smooth and integral over `ℚ`, and geometrically integral over `E(D)`. Construct its base changes and the real-open special-pair comparison of Deligne 5.1. ([Deligne 1971](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.1 and 5.1.2, pp.153–154.)

**Checks.**

- For `Res_{ℚ(i)/Q}G_m` with one selected CM cocharacter, `W=V×Spec ℚ(i)`; `W/Q` has two geometric components.
- For a split torus, `Hom(G_m,T)` is an infinite lattice in positive rank; only the selected orbit is finite.
- For every finite `L/E(D), W×_{E(D)}L` is integral and its composite map to `V/Q` is finite étale.

### 4.9b Continuous field descent and invariants

**Target.** `TauCeti.Shimura.continuous_field_descent`. Let `Ω` be algebraically closed of characteristic zero, `E⊂Ω` with infinite transcendence degree of `Ω/E`, and `Z` a quasi-projective `Ω`-variety. A semilinear system `f_σ:σZ→Z` for `σ∈Aut(Ω/E)`, with `f_{στ}=f_σ∘σf_τ`, descends effectively to `E` if its restriction to `Aut(Ω/L)` is split by an `L`-model for some finitely generated `L/E`. Prove the finite-rigidification criterion: a finite set of geometric points with trivial pointwise automorphism stabilizer, fixed by that system over such an `L`, forces this splitting. Construct descent of compatible morphisms and towers using faithful field base change and the resulting comparisons. Separately, for `E`-varieties and `Ω` of infinite transcendence degree, an `Ω`-morphism or finite-type closed subscheme invariant under `Aut(Ω/E)` descends uniquely to `E`; retain its scheme structure and coherent ideal. The closed-subscheme assertion uses invariance of the ideal, rather than just of its point set. ([Milne 1999](https://jmilne.org/math/articles/1999cP.pdf), Theorem 1.1, Corollary 1.2 and Remark 1.3, pp.1–2; [Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), Proposition 13.1, p.117; faithfully flat descent of coherent ideals from SchemeAndStackFoundations §1.1.)

**Checks.**

- The system induced by an `E`-model descends to that model, preserving its comparison.
- A discontinuous cocycle on a variety over an algebraic `closure` need not be effective (Milne Remark 1.3(a)); it fails these continuity hypotheses.
- An invariant doubled closed point descends with its doubled ideal; descent of the underlying point alone does not recover it.

### 4.10 Disjoint special reflex fields

Prove `CanonicalModel.disjoint_special_reflex_fields` as follows. For every pure datum `D` and finite extension `L/E(D)` in `ℂ`, there is a special torus subdatum `(T,h)` of `D` such that `E(T,h)/E(D)` is linearly disjoint from `L/E(D)`. The torus-reflex field is used, not the residue field of an arbitrarily chosen level point.

Throughout this result, `G` is connected reductive over `ℚ`; actual special pairs and cocharacter reflex fields are those of §§P.1/P.3. `L/E(D)` is finite.

Use Deligne 5.1: over the regular-semisimple open `V` in `Lie(G)`, the incidence variety `W` of maximal tori, cocharacters in the datum class, and regular `Lie` elements has a finite étale surjective map `f:W → V`. Separately, the cocharacter-class map `p:W → Spec E(D)` has geometrically irreducible fibres by 5.1.2; `p` is not asserted finite étale.

Connected centralizers and conjugacy of maximal tori give geometrically irreducible fibres over `E(D)`. The nonempty real open `U` of tori compact modulo the centre supplies special homomorphisms in `X`.

Form `W_L=W×_{E(D)}L`. Geometric integrality over `E(D)` makes `W_L` integral; its composite map to `V/Q` is finite étale. Apply IG.2.4 and IG.2.7 over `ℚ` to choose `v∈V(Q)` in `U` with connected `W_L`-fibre. If `W_v=Spec F`, then `F⊗_{E(D)}L` is a field. The resulting torus reflex field is an `E(D)`-subfield of `F`, and therefore is linearly disjoint from `L` over `E(D)`.

**Checks.**

- For `GL₂`, take an imaginary quadratic field `ℚ(sqrt(-p))` with `p` an odd prime unramified in `L`; ramification at `p` excludes its inclusion in `L`.
- For `G=Res_{ℚ(i)/Q}G_m` the selected incidence is `V×Spec ℚ(i)`, integral over `ℚ` but not geometrically irreducible over `ℚ`. Hilbert specialization still applies to `W_L` at rational `v`.
- Do not infer the field-disjointness theorem from mere density of special points.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.4, p.118; [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.1, 5.1.2, 5.1.3, pp.153–155.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [InverseGaloisAndArithmeticFundamentalGroups, §§IG.2.4, IG.2.6–IG.2.7, Hilbert specialization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md#ig27-weak-approximation-local-conditions-and-norm-pullbacks); [AlgebraicModuliForArithmeticGeometry, §2.1, Hom and Isom schemes, with local §4.9a cocharacter incidence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#21-hilbert-families-and-graph-parameters); `IntermediateField.LinearDisjoint`, with the exact supplier contracts above.

### 4.11 Hecke translation over the reflex field

Prove `CanonicalModel.translation_defined_over_reflex` as follows. If `g` in `G(𝔸_f)` and `g⁻¹Kg` is contained in `L`, the complex morphism `T_g:[x,a]_K → [x,ag]_L` descends uniquely to an `E`-morphism `M_K → M_L`. This is a conditional functoriality theorem for actual canonical models, with no general existence assumption.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. `K,L` are compact open and `g⁻¹Kg` is contained in `L`.

Layer 1 gives the analytic map and Layer 3 its algebraicity over `ℂ`. For a special pair `(T,h)`, Layer 4 gives `σ[h,a]=[h,r_h(s)a]` for `σ` fixing `E(T,h)`. Left multiplication `r_h(s)` commutes with right multiplication `g`.

Layer 4 density of all Hecke translates of `h` identifies `T_g` with its `σ`-conjugate as algebraic maps (source reduced, target separated).

First descend through `Aut(C/E(T,h))` for one special pair: this gives a finite algebraic field of definition of `T_g`, rather than assuming every complex morphism has one. Apply §4.10 to its finite normal `closure` over `E`. Descent through the second fixing subgroup and linear disjointness force the map to be defined over `E`; faithful base change gives uniqueness.

**Checks.**

- For `g=1` and `K` contained in `L` this is the forgetful level map.
- For `L=g⁻¹Kg` this is an isomorphism, with inverse `T_{g⁻¹}`.
- The inclusion direction must be tested on a changed representative `ak: k g=g(g⁻¹kg)`.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.6, pp.118–119.)

This uses [1.4 Holomorphic right translations](#14-holomorphic-right-translations); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [3.2 Borel algebraicity](#32-borel-algebraicity); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [4.4 Canonical-model condition](#44-canonical-model-condition); [4.8 Density of Hecke translates](#48-density-of-hecke-translates); [4.10 Disjoint special reflex fields](#410-disjoint-special-reflex-fields); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 4.12 Uniqueness of canonical models

Prove `CanonicalModel.unique_iso` as follows. Two canonical `E`-models of the same finite-level Shimura variety have a unique `E`-isomorphism inducing their specified comparison over `ℂ`. These isomorphisms commute with all descended level and translation maps.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane.

Repeat the argument of §4.11 with `g=1, K=L` and the two distinct specified model comparisons; the same special-pair action makes the complex identity descend.

Descend its inverse and verify the inverse identities by faithful base change. Naturality follows by comparing after `ℂ`-base change.

**Checks.**

- An arbitrary automorphism of an `E`-scheme is not the specified unique comparison.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.7(a), p.119.)

This uses [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### Examples

The trivial datum has model `Spec ℚ`. For the strict split torus at principal level 5 the model is `ℚ(ζ₅+ζ₅⁻¹)`, of degree two. The split two-point `ℚ`-scheme has the same number of complex points but fails reciprocity when cyclotomic character 2 exchanges the classes. A torus with two real-domain points instead gives the full primitive-root Galois set. For `GL₂`, choose an imaginary quadratic field ramified at an odd prime unramified in the given finite field extension to witness disjointness.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, §1.4, restriction of scalars on adelic points](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#14-restriction-of-scalars-and-concrete-groups); [AlgebraicModuliForArithmeticGeometry, §2.1, Hom and Isom schemes, with local §4.9a cocharacter incidence](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#21-hilbert-families-and-graph-parameters); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [InverseGaloisAndArithmeticFundamentalGroups, §§IG.2.4, IG.2.6–IG.2.7, Hilbert specialization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md#ig27-weak-approximation-local-conditions-and-norm-pullbacks); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [SchemeAndStackFoundations, §1.23, finite_quotient_coarse](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#123-moduli-functors-fine-and-coarse-moduli-spaces-keelmori-tame-stacks); [SchemeAndStackFoundations, §1.21, quotient stacks](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#121-quotient-stacks-line-bundles-with-a-section-root-stacks); [SchemeAndStackFoundations, §1.21, quotientStack_algebraic](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#121-quotient-stacks-line-bundles-with-a-section-root-stacks); [SchemeAndStackFoundations, §1.20, stack_presentation](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#120-inertia-the-setoid-criterion-properties-of-morphisms-and-presentations); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); `AlgebraicGeometry.Scheme`; `CategoryTheory.Over`; `IntermediateField.LinearDisjoint`; [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ModularCurves, layer 0 scheme theoretic prerequisites](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#layer-0-scheme-theoretic-prerequisites); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

Earlier constructions used here are 0.5 Finite analytic component decomposition; 1.3 Holomorphic finite level maps; 1.4 Holomorphic right translations; 2.7 Baily–Borel algebraization; 3.2 Borel algebraicity; 3.5 Algebraic finite quotients and normalization.

## Layer 5: Complex multiplication and Siegel existence

### 5.0 Rational polarized Siegel moduli

**Target.** `TauCeti.Shimura.rational_siegel_moduli`. Construct the rational polarized moduli input used here, using AbelianSchemesAndArithmeticModuli `A0`–`A6` and SchemeAndStackFoundations' representability and quotient machinery. For `g≥1`, a rational symplectic space `(V,ψ)` of dimension `2g`, an integral symplectic lattice and compact open `K⊂GSp(V,ψ)(𝔸_f)`, specify the moduli functor of polarized abelian schemes up to quasi-isogeny, with positive rational polarization ray and a `K`-orbit of symplectic finite-adelic realization isomorphisms. Include its equivalent integral moduli charts with fixed polarization type and sufficiently small integral level. Construct the smooth quasi-projective `ℚ`-scheme at fine/neat levels, its universal abelian family on fine integral charts, changes of lattice and level, and coarse finite quotients at other levels by §3.4a. A coarse level carries no universal abelian family assertion. These rational Siegel contracts concern the characteristic-zero moduli problem and its complex families. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), §6 and Theorem 8.17 in the symplectic case, pp.66–70,88–91.)

**Checks.**

- Principal full level `N≥3` gives a fine integral chart with its universal polarized abelian scheme.
- At full level 2 the automorphism `−1` survives; only coarse moduli is asserted.
- Changing the integral lattice within the rational symplectic space retains the quasi-isogeny equivalence and its actual level orbit.

**Target.** `TauCeti.Shimura.siegel_moduli_uniformization`. Construct the complex analytic uniformization and universal-family comparison of these charts with the Siegel double quotient of Layers 1–3. Use the Riemann bilinear relations and AbelianSchemesAndArithmeticModuli `A5`, comparing homology, integral lattices, polarizations and finite-adelic levels. Give pullback, morphism and level-change laws. For `g=1` identify this rational Siegel moduli functor with the full ordered-basis elliptic functor of ModularCurves §5b; compare AA.5.2’s adelic/analytic components with the independently supplied ModularCurvesPartII §§1.2–1.5 and §3.14 algebraic-curve uniformization, preserving the ordered basis and pairing value. This identification is constructed here; §§5.11–5.13 and 8.9 verify canonical reciprocity, and §§8.11–8.13 verify the determinant and row-action laws. ([Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), §6, especially Proposition 6.3, pp.70–71, and Theorem 6.11, p.74; [ModularCurvesPartII](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md), §§1.2–1.5,3.14.)

**Checks.**

- At genus one all elliptic curves carry the canonical principal polarization, including the universal full-level family.
- The determinant of a row-basis change raises the Weil pairing to that determinant; a basis swap inverts it.
- The genus-zero terminal datum and `Spec ℚ` are constructed directly, without a nonempty full-CM algebra.

### 5.1 CM types, reflex fields and reflex norms

Define `TauCeti.CM.CMType` as follows. A CM algebra is a finite product `E=E₁×⋯×E_r`, with `r≥1`, of CM fields (`NumberField.IsCMField`), with the involution `ι_E` acting as complex conjugation on every factor; `ι` is complex conjugation on `ℂ`. A CM type on `E` is a subset `Φ⊂Hom_{ℚ-alg}(E,ℂ)` such that `Hom(E,ℂ)` is the disjoint union of `Φ` and `ιΦ={ι∘φ : φ∈Φ}`; equivalently its indicator function `χ` satisfies `χ(φ)+χ(ι∘φ)=1` for every `φ`. Choosing `Φ` amounts to choosing one complex extension of each real embedding of the maximal totally real subalgebra, and gives `E⊗_ℚℝ≅ℂ^Φ` (Milne CM, Definition 1.8 and the paragraph after it, p.11). A type `Φ₀` on a CM subalgebra `E₀⊂E` induces the type `Φ={φ : φ|E₀∈Φ₀}` on `E`. When `E` is a field, the pair `(E,Φ)` is primitive if `Φ` is induced from no proper CM subfield; every such pair is induced from a unique primitive pair, whose field is the fixed field of the right stabilizer of the extended type in a Galois CM `closure` (Milne CM, p.11, and Proposition 1.9, p.12). For `σ∈Aut(ℂ), σΦ={σ∘φ : φ∈Φ}` is again a CM type, because `ι` commutes with `σ` on the image of a CM field (Milne CM, p.13, footnote 3). In Suggested.lean the partition condition is imposed on ring maps `E→ℂ` for any commutative ring `E`, with `ι∘φ` written `star φ`; the results below assume that `E` is a CM algebra.

Expose the following named operations and laws.

- `TauCeti.CM.CMType.ext`: Two CM types with the same embedding set are equal.
- `TauCeti.CM.CMType.mem_conjugate_iff`: `φ∈ιΦ` iff `φ∉Φ`; thus `ιΦ` is the CM type complementary to `Φ`.
- `TauCeti.CM.CMType.conjugate_conjugate`: `ι(ιΦ)=Φ`.
- `TauCeti.CM.CMType.card`: `2|Φ|=[E:ℚ]`.
- `TauCeti.CM.CMType.galois`: `σΦ` is a CM type, `(στ)Φ=σ(τΦ)` and `ι(σΦ)=σ(ιΦ)`.
- `TauCeti.CM.CMType.induced_mem`: `φ` lies in the type induced from `Φ₀` iff `φ|E₀∈Φ₀`.
- `TauCeti.CM.CMType.induced_trans`: Inducing along `E₀⊂E₁⊂E₂` in two steps equals inducing directly.
- `TauCeti.CM.CMType.primitive_core_unique`: For a CM field `E`, the primitive pair inducing `Φ` is unique.

**Checks.**

- `TauCeti.CM.CMType.test_gaussian`: For `E=ℚ(i), Hom(E,ℂ)` consists of `i↦i` and `i↦−i`; each singleton is a CM type, of cardinal one.
- `TauCeti.CM.CMType.test_not_full`: For `E=ℚ(i)` neither the full embedding set nor the empty set is a CM type, and `ℚ` has no CM type at all, since its only embedding is real. The Lean examples prove the rational obstruction and reject the full and empty embedding sets whenever an embedding exists. A condition asking only for at least one embedding from each conjugate pair would accept the full set.
- `TauCeti.CM.CMType.test_product`: CM types on `E₁×E₂` correspond to pairs of CM types, with `|Φ|=|Φ₁|+|Φ₂|`; on `ℚ(i)×ℚ(√−3)` every CM type has cardinal two.
- `TauCeti.CM.CMType.test_zeta8_induced`: On `ℚ(ζ₈)` the type `{ζ₈↦ζ₈, ζ₈↦ζ₈³}` is induced from `ℚ(√−2)`, since both embeddings send `√−2=ζ₈+ζ₈³` to `i√2`; it is not primitive.

Define `TauCeti.CM.CMType.reflexField` as follows. The type trace of `(E,Φ)` is `typeTrace_Φ(a)=Σ_{φ∈Φ}φ(a)`. For this nonzero CM algebra, the reflex field `E*⊂ℂ` is the subfield generated by all `typeTrace_Φ(a), a∈E`. Equivalently, by Dedekind's independence of characters, `σ∈Aut(ℂ)` fixes `E*` pointwise iff `σΦ=Φ` (Milne CM, Proposition 1.16 and Definition 1.17, p.13). `E*` is a CM field of finite degree; the reflex field of a product of CM pairs is the compositum of their reflex fields; inducing a type does not change its reflex field (Milne CM, Proposition 1.18, p.14). For the CM torus datum `(Res_{E/ℚ}G_m,h_Φ)` of the local datum foundations of §§P.1–P.4, whose cocharacter `μ_Φ` has exponent one at the embeddings in `Φ` and zero at those in `ιΦ`, the cocharacter reflex field `E(T,h_Φ)` of §P.3 is `E*` (SVI Example 12.4(b), p.112).

Expose the following named operations and laws.

- `TauCeti.CM.CMType.typeTrace`: `typeTrace_Φ(a)=Σ_{φ∈Φ}φ(a)`; it is `ℚ`-linear in a.
- `TauCeti.CM.CMType.reflexField_le_iff`: `E*⊂F` iff `typeTrace_Φ(a)∈F` for every `a∈E`.
- `TauCeti.CM.CMType.reflexField_stabilizer`: `σ∈Aut(ℂ)` fixes `E*` pointwise iff `σΦ=Φ`.
- `TauCeti.CM.CMType.reflexField_isCMField`: `E*` is a CM number field. The Lean statement treats every nonempty finite product of CM number fields on the native product-ring carrier.
- `TauCeti.CM.CMType.typeTrace_conjugate`: `typeTrace_{ιΦ}=ι∘typeTrace_Φ`.
- `TauCeti.CM.CMType.reflexField_conjugate`: `ιΦ` has the same reflex field as `Φ`. The Lean statement holds for every reduced finite-dimensional `ℚ`-algebra with a CM partition.
- `TauCeti.CM.CMType.reflexField_prod`: The reflex field of a product of CM pairs is the compositum of their reflex fields.
- `TauCeti.CM.CMType.reflexField_induced`: An induced type has the reflex field of the type it is induced from.
- `TauCeti.CM.CMType.reflexField_generic`: `E*` equals the cocharacter reflex field of the CM torus datum, as subfields of `ℂ`.

**Checks.**

- `TauCeti.CM.CMType.test_reflex_quadratic`: For `E=ℚ(i)` and `Φ={i↦i}, typeTrace_Φ(i)=i`, so `E*=ℚ(i)⊂ℂ`.
- `TauCeti.CM.CMType.test_reflex_not_Q`: The same computation gives `E*≠ℚ`. The full trace over all embeddings vanishes at `i`, so a definition using it would give `ℚ`.
- `TauCeti.CM.CMType.test_reflex_induced`: The induced `ℚ(ζ₈)` type above has reflex field `ℚ(√−2)`, of degree two; taking `E*` to be `E` would give `ℚ(ζ₈)`, of degree four. The named Lean theorem uses the native CyclotomicField `8 ℚ` carrier and an actual primitive eighth root, selecting its first/third complex images and asserting these two degrees.

Define `TauCeti.CM.CMType.reflexNorm` as follows. For a number field `k⊂ℂ` there is a finitely generated `E⊗_ℚk`-module `V` with `Tr_k(a|V)=typeTrace_Φ(a)` for all `a∈E` exactly when `k⊇E*`, and `V` is then unique up to isomorphism (Milne CM, Proposition 1.21, p.15, and Corollary 1.22, pp.15–16). For a `ℚ`-algebra `R` and `a∈(k⊗_ℚR)^×` put `N_{k,Φ}(a)=det_{E⊗R}(a|V⊗_ℚR)`. This is a homomorphism `(k⊗R)^×→(E⊗R)^×`, functorial in `R` and independent of `V`, hence a morphism of tori `Res_{k/ℚ}G_m→Res_{E/ℚ}G_m`; write `N_Φ` when `k=E*`. Taking `R` to be the adeles gives the idelic map, and passing to fractional ideals gives the ideal map (Milne CM, p.16, and Remark 1.25, p.17).

Prove `TauCeti.CM.CMType.typeNorm_identities` as follows. `(a)` For `E*⊂k⊂ℂ, N_{k,Φ}=N_Φ∘Nm_{k/E*}` (Milne CM, Proposition 1.23, p.16). `(b) N_{k,Φ}(a)·ι_E(N_{k,Φ}(a))=Nm_{k⊗R/R}(a)` for `a∈(k⊗R)^×`; hence `N_{k,ιΦ}=ι_E∘N_{k,Φ}`, and `N_{k,Φ}` factors through the subtorus of `Res_{E/ℚ}G_m` of elements `x` with `xι_E(x)∈G_m` (Milne CM, Remark 1.24(b), formulas `(8)`–`(10)`, p.16, and Remark 1.25, p.17). `(c)` Assume `E` is a field. If `k` is a finite extension of `E*` containing all conjugates of `E`, then `N_{k,Φ}(a)=∏_{φ∈Φ}φ⁻¹(Nm_{k/φE}a)` for every nonzero element or fractional ideal a of `k` (Milne CM, Proposition 1.26, p.17). `(d)` When `E` is a field, choose `L⊂ℂ` Galois over `ℚ` and containing `E`, put `Φ_L={σ∈Gal(L/ℚ) : σ|E∈Φ}`, and write `Φ_L⁻¹` as a disjoint union of cosets `ψ_jGal(L/E*)`. Then `Φ*={ψ_j|E*}` is the reflex type on `E*`, and `a↦∏_{ψ∈Φ*}ψ(a)` maps `E*` into `E` and equals `N_Φ` (Milne CM, Example 1.28, p.18). For `E=∏E_j`, write `Φ_j` for its component types and `E_j*⊂E*`. Apply the field formula `(c)` separately to each `(E_j,Φ_j)` with the same `k`; the resulting tuple is `N_{k,Φ}`. Thus `(a)`–`(b)` and componentwise `(c)` hold for products; no single reflex pair is claimed.

Prove `TauCeti.Shimura.ReflexNorm.cm_type` as follows. For the CM torus datum `(Res_{E/ℚ}G_m,h_Φ)` of the local datum foundations of §§P.1–P.4, so that `E(T,h_Φ)=E*`, the cocharacter reflex norm `r_{h_Φ}:Res_{E*/ℚ}G_m→Res_{E/ℚ}G_m` of [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus) equals `N_Φ`, as morphisms of tori and on finite ideles. In split coordinates both send a to the element whose `φ`-component is the product of `ρ(a)` over the embeddings `ρ:E*→ℂ` for which `σ⁻¹∘φ∈Φ`, where `σ∈Aut(ℚ̄/ℚ)` extends `ρ`. This condition is independent of the extension: two such `σ` differ on the right by an automorphism fixing `E*`, and that stabilizer preserves `Φ`. Embeddings and compositions here are restricted to `ℚ̄` (SVI Example 12.4(b), p.112, and `(60)`, p.114; Milne CM, Proposition 1.26, p.17).

**Checks.**

- `TauCeti.CM.CMType.test_typeNorm_gaussian`: For `E=ℚ(i)` and `Φ={i↦i}, E*=ℚ(i)` and `N_Φ` is the identity under the selected embedding; `N_Φ(2+i)·ι(N_Φ(2+i))=(2+i)(2−i)=5=Nm(2+i)`.
- `TauCeti.CM.CMType.test_typeNorm_conjugate`: For the same field, `N_{ιΦ}(2+i)=2−i`, not `2+i`: conjugating the type conjugates the norm.
- `TauCeti.CM.CMType.test_typeNorm_transitivity`: For `k=ℚ(i,√2)⊃E*=ℚ(i), N_{k,Φ}(√2)=N_Φ(Nm_{k/E*}√2)=N_Φ(−2)=−2`. Omitting the norm from `k` to `E*` gives `√2`, which is not in `E`.
- For `E=ℚ(i)×ℚ(i)`, embeddings factor through projections and have nonzero kernels. The norm formula gives a pair of Gaussian field norms; no inverse embedding into `E` is used.
- For `E=ℚ(ζ₈)` with induced type `{1,3}` and `E*=ℚ(√−2), φ(E)` cannot lie in the degree-two image `ρ(E*)`. Extending `ρ` to `σ` makes the split-coordinate formula well-defined.
- `TauCeti.Shimura.ReflexNorm.test_cm_gaussian`: For `E=ℚ(i)` and `Φ={φ}`, the special-torus reflex norm `r_{h_Φ}` sends `a∈(E*)^×` to `φ⁻¹(a)`, in agreement with `N_Φ` and not with its inverse or with `N_{ιΦ}`.

([J. S. Milne, Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf), Definition 1.8, p.11; Proposition 1.9, p.12; Proposition 1.16 and Definition 1.17, p.13; Proposition 1.18, p.14; Proposition 1.21 and Corollary 1.22, pp.15–16; Proposition 1.23 and Remark 1.24, p.16; Remark 1.25 and Proposition 1.26, p.17; Example 1.28, p.18; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Example 12.4(b), p.112, and `(60)`, p.114.)

This uses `NumberField.IsCMField`; `NumberField.ComplexEmbedding.conjugate`; `IntermediateField.adjoin`; `IntermediateField.adjoin_le_iff`; `LinearMap.det`; [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [AdelicAlgebraicGroups, §1.4, restriction of scalars on adelic points](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#14-restriction-of-scalars-and-concrete-groups), with the exact supplier contracts above.

### 5.2 Algebraization of polarized weight-one variations

Prove `TauCeti.Shimura.weight_one_algebraization` as follows. `Over` a smooth finite-type `ℂ`-scheme `S`, the relative analytic equivalence between polarized abelian families and polarizable integral variations of homological types `(−1,0),(0,−1)` algebraizes: every such variation gives an abelian scheme, and morphisms correspond to morphisms of variations. Polarization type and actual integral level are retained.

Use `A5` to obtain the analytic family. Add an appropriate level after an étale cover and use the §5.0 algebraic moduli chart.

Borel algebraizes its classifying map into the neat arithmetic quotient. Pull back the universal abelian scheme and descend through the level cover.

Algebraize homomorphisms via the relative moduli/rigidity and proper comparison, not a claim that all holomorphic functions on `S` are algebraic.

**Checks.**

- Homology conventions are `(−1,0),(0,−1)`; the cohomological dual is not identified without dualization.
- The analytic moduli comparison precedes its CM canonical condition.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.8, p.122; algebraization through §5.0 and Layer 3.)

This uses [AbelianSchemesAndArithmeticModuli, Layer A5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a5-complex-uniformization-and-families); [5.0 Rational polarized Siegel moduli](#50-rational-polarized-siegel-moduli); [3.2 Borel algebraicity](#32-borel-algebraicity); [AbelianSchemesAndArithmeticModuli, Layer A3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a3-isogenies-finite-flat-quotients-torsion-and-pairings); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison), with the exact supplier contracts above.

### 5.3 CM abelian varieties with their algebra action

Define `TauCeti.Shimura.CMAbelianVariety` as follows. For an abelian variety `A/C` of dimension `g>0`, a full CM action is an embedding `i:E→End⁰(A)` of a commutative finite étale CM `ℚ`-algebra of dimension `2g`. Its `H₁(A,Q)` is rank one over `E`, its `Lie` eigenspaces specify the actual CM type `Φ`, and a polarization is retained with Rosati acting as complex conjugation on `E` when required. A product CM algebra is allowed; simplicity and maximal integral endomorphism order are separate hypotheses.

Import actual abelian varieties and rational endomorphisms, then embed the full-degree commutative CM algebra.

Identify the eigenspaces through `A5` and apply the CM types of [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms).

Use Rosati positivity for the polarization compatibility; the CM type is the carrier of [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms), not a second one.

Expose the following named operations and laws.

- `TauCeti.Shimura.CMAbelianVariety.action`: The injective `E`-action on the actual abelian variety is part of the data.
- `TauCeti.Shimura.CMAbelianVariety.type`: The type is the subset of embeddings appearing in `Lie(A)`, a CM type in the sense of [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms).
- `TauCeti.Shimura.CMAbelianVariety.homology`: `H₁(A,Q)` is free of rank one over `E`, with eigenspace decomposition `Φ` in `Lie(A)`.
- `TauCeti.Shimura.CMAbelianVariety.transport`: An `E`-linear quasi-isogeny transports the full action and type; identity/composition hold.
- `TauCeti.Shimura.CMAbelianVariety.rosati`: A retained compatible polarization has Rosati restriction equal to the CM conjugation, with positive Riemann form.
- `TauCeti.Shimura.CMAbelianVariety.ofAction`: An actual abelian variety with an injective CM-algebra action of dimension `2 dim A` supplies the full CM object and its `Lie` type; a compatible polarization is included when Rosati data are required.
- `TauCeti.Shimura.CMAbelianVariety.hom_ext`: Two `E`-linear quasi-homomorphisms between full CM objects agreeing on `H₁(-,Q)`, or on a rational Tate module after comparison, are equal.

**Checks.**

- `TauCeti.Shimura.CMAbelianVariety.quadratic`: An elliptic curve with an imaginary quadratic embedding in `End⁰` has a full CM action of degree two.
- `TauCeti.Shimura.CMAbelianVariety.product`: The product of two CM elliptic curves has full action by their product CM algebra; it need not be simple.
- `TauCeti.Shimura.CMAbelianVariety.insufficient_degree`: A scalar `ℚ`-action on a positive-dimensional abelian variety is not full CM, and a degree-two action on dimension two alone is insufficient.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, p.123; field case §10.)

This uses [AbelianSchemesAndArithmeticModuli, Layer A6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a6-arithmetic-hom-and-exports); [AbelianSchemesAndArithmeticModuli, Layer A5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a5-complex-uniformization-and-families); [AbelianSchemesAndArithmeticModuli, Layer A2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a2-duality-polarizations-and-ample-classes); [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms), with the exact supplier contracts above.

### 5.4 Rank-one rational CM Tate module

Prove `TauCeti.Shimura.cm_tate_rank_one` as follows. For a full CM action `(A,E), V_fA` is free of rank one over `E⊗_Q 𝔸_f`, compatibly with `H₁(A,Q)⊗𝔸_f` and with quasi-isogenies. If `End(A)∩E=O_E, T_ℓA` is free of rank one over `O_E⊗Z_ℓ`. For a nonmaximal order only the rational freeness is asserted without additional integral hypotheses. Quasi-isogenies act faithfully on `V_fA`.

Use uniformization and the full-degree `E`-module structure to prove rank-one `H₁`, then the complex torsion/Tate comparison.

At maximal order the integral lattice is locally an invertible `O_E`-module, yielding integral freeness.

Use injectivity of rational `Hom` on Tate modules for uniqueness of a quasi-isogeny.

**Checks.**

- The rational rank statement includes product CM algebras.
- An integral rank-one claim over an arbitrary nonmaximal order needs an invertible lattice hypothesis.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 proof, p.101; main CM proof p.109; integral order comparison `2007c` Remark 1.7, p.6.)

This uses [5.3 CM abelian varieties with their algebra action](#53-cm-abelian-varieties-with-their-algebra-action); [AbelianSchemesAndArithmeticModuli, Layer A4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a4-realizations-and-deformations); [AbelianSchemesAndArithmeticModuli, Layer A3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a3-isogenies-finite-flat-quotients-torsion-and-pairings); [AbelianSchemesAndArithmeticModuli, Layer A6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a6-arithmetic-hom-and-exports), with the exact supplier contracts above.

### 5.5 Number-field models for full CM objects

Prove `TauCeti.Shimura.cm_number_field_model` as follows. A full CM abelian variety over `ℂ`, with its finitely specified endomorphisms, polarization and finite level, admits a model over a number field after replacing its base by a finite extension. This establishes that CM reduction and arithmetic Frobenius arguments apply to actual complex points.

Use the fixed CM action/type locus and rigidity to show its moduli point is algebraic; spread the variety and finitely many structures and descend to a number field.

Extend the field to define the action/polarization/level. Do not assert that every arbitrary complex abelian variety has a number-field model.

The rigidity and descent argument for the CM locus is proved here, as a step separate from the main theorem.

**Checks.**

- The field must define the CM action before the Galois representation is scalar `E`-linear.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.3 and proof, pp.100–101.)

This uses [5.3 CM abelian varieties with their algebra action](#53-cm-abelian-varieties-with-their-algebra-action); [5.0 Rational polarized Siegel moduli](#50-rational-polarized-siegel-moduli); [AbelianSchemesAndArithmeticModuli, Layer A6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a6-arithmetic-hom-and-exports); [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 5.6 Potential good reduction for CM varieties

Prove `TauCeti.Shimura.cm_potential_good_reduction` as follows. A full CM abelian variety over a number field has potentially good reduction at every finite place. With all `E`-endomorphisms defined, the inertia image on `V_ℓA` is finite for `ℓ` different from the residue characteristic, so a finite extension kills it and Néron–Ogg–Shafarevich supplies good reduction.

First pass to a number field over which all `E`-endomorphisms are defined. At the chosen finite place apply NeronModelsAndSemistableAbelianVarieties §3.10 to acquire semistable reduction.

By NeronModelsAndSemistableAbelianVarieties §3.7, `(ρ_ℓ(σ)−1)²=0` for inertia after that extension, with `ℓ` different from the residue characteristic. By rank-one `E`-linearity, `ρ_ℓ(σ)` lies in the commutative finite étale algebra `E⊗ℚ_ℓ`, which is reduced. Thus `ρ_ℓ(σ)=1`. Equivalently its multiplication action is both semisimple and unipotent.

Apply NeronModelsAndSemistableAbelianVarieties §5.1 to get good reduction. The original inertia image is finite since an open inertia subgroup is killed. The extension can be chosen over the number field: the excellent DVR supplier applies to the local number-field ring, or realize a completion extension by Krasner.

Compactness and the Rosati norm constraint alone do not imply finite inertia. In particular, absolute local inertia is not virtually pro-p.

**Checks.**

- This is potential good reduction, not good reduction over the original field.
- The proof is valid in higher dimension.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 10.5 and proof, p.101; [B. Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf), Theorem 4.2, p.9; Remark 5.6, p.18; Proposition 6.5, pp.23–24.)

This uses [5.5 Number-field models for full CM objects](#55-number-field-models-for-full-cm-objects); [5.4 Rank-one rational CM Tate module](#54-rank-one-rational-cm-tate-module); [NeronModelsAndSemistableAbelianVarieties, §5.1, Néron–Ogg–Shafarevich](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#51-néronoggshafarevich); [NeronModelsAndSemistableAbelianVarieties, §3.10, semistable reduction after a finite separable extension](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#310-semistable-reduction-after-a-finite-separable-extension); [NeronModelsAndSemistableAbelianVarieties, §3.7, unipotence of inertia of exponent two](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#37-unipotence-of-inertia-of-exponent-two), with the exact supplier contracts above.

### 5.7 CM Frobenius endomorphism

Prove `TauCeti.Shimura.cm_frobenius` as follows. Let `A/k` have full CM by `O_E` with the action defined over `k`, let `k/Q` be Galois containing all conjugates of `E`, and let `P` be a good reduction prime of residue cardinality `q`. The `q`-power Frobenius of the reduction is represented by `π∈O_E` under the specialized CM action, with `ππbar=q` for a compatible polarization.

Specialize the defined `O_E`-action to the good reduction and use AbelianSchemesAndArithmeticModuli §A4.1 to identify the prime-to-`p` rational Tate module with that of the generic fibre. It remains rank one over `E⊗ℚ_ℓ`; `q`-power Frobenius commutes with the action defined over the residue field.

Let `C` be the centralizer of `E` in `End⁰` of the reduction. AbelianSchemesAndArithmeticModuli §A6.7 gives finite dimension and injects `C⊗ℚ_ℓ` into `End_{E⊗ℚ_ℓ}(V_ℓ)=E⊗ℚ_ℓ`. Thus `dim_Q C≤dim_Q E`; since `E⊂C, C=E` and Frobenius belongs to `E`. Only scalar-extended `Hom` injectivity is used, with `ℓ` different from the residue characteristic; no Tate surjectivity or lifting of all special-fibre endomorphisms is assumed.

AbelianSchemesAndArithmeticModuli §A6.11 makes the Frobenius endomorphism integral over `Z`, so its element of `E` lies in `O_E`. The compatible polarization and Rosati conjugation give `ππbar=q`.

**Checks.**

- The Frobenius is arithmetic `q`-power on the reduction; Layer `4 art` is its inverse on Galois reciprocity.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Lemma 10.8, p.102, and Lemma 10.9 with proof, p.103; [J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 2.1(a) and proof, p.16; Corollary 1.5, p.6.)

This uses [5.4 Rank-one rational CM Tate module](#54-rank-one-rational-cm-tate-module); [5.6 Potential good reduction for CM varieties](#56-potential-good-reduction-for-cm-varieties); [AbelianSchemesAndArithmeticModuli, Layer A3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a3-isogenies-finite-flat-quotients-torsion-and-pairings); [AbelianSchemesAndArithmeticModuli, Layer A2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a2-duality-polarizations-and-ample-classes); [AbelianSchemesAndArithmeticModuli, §A4.1, the integral Tate module](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a41-the-integral-tate-module); [AbelianSchemesAndArithmeticModuli, §A6.25, relative Hom and normal-base extension](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a625-relative-hom-and-normal-base-extension); [AbelianSchemesAndArithmeticModuli, §A6.7, Hom is free of finite rank](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a67-hom-is-free-of-finite-rank); [AbelianSchemesAndArithmeticModuli, §A6.11, the characteristic polynomial on the Tate module](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a611-the-characteristic-polynomial-on-the-tate-module), with the exact supplier contracts above.

### 5.8 Shimura–Taniyama Frobenius calculation

Prove `TauCeti.Shimura.shimura_taniyama` as follows. Under the preceding good-reduction/maximal-order/Galois-field hypotheses, for every `v|p` put `H_v={φ:E→k:φ⁻¹P=v}`. The Frobenius `π` satisfies `ord_v(π)/ord_v(q)=|Φ∩H_v|/|H_v|`. Equivalently the principal ideal `(π)` is the product over `φ∈Φ` of `φ⁻¹(N_{k/φE}P)`, and agrees with the reflex norm of `N_{k/E*}P`. State the ramified-prime formula using normalized valuations; the clean unramified ideal proof suffices for the subsequent prime-generation argument.

Compare the `Lie` eigenspace lengths of the CM action at `P` with the Frobenius kernel length; account for ramification through normalized `ord_v(q)`.

Use type counting to identify the valuation at each CM prime.

Translate the product ideal through the reflex norm. For product algebras use the torus norm; the field reflex-type formula alone is not a product reflex type.

**Checks.**

- For CM elliptic curves an inert prime has slope 1/2; a split prime has slopes 0 and 1.
- Valuations are normalized ratios, not a raw count independent of ramification.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 10.10, p.103 and proof pp.104–105; `2007c` Theorem 2.1.)

This uses [5.7 CM Frobenius endomorphism](#57-cm-frobenius-endomorphism); [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [AbelianSchemesAndArithmeticModuli, Layer A4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a4-realizations-and-deformations), with the exact supplier contracts above.

### 5.9 CM ideal reciprocity with prime generation

Prove `TauCeti.Shimura.cm_ideal_reciprocity` as follows. For `A/C` with CM by `O_E` and type `Φ`, integer `m>0` and `σ` fixing `E*`, there is an ideal multiplication `α:A→σA` acting as `σ` on `A[m]`. Its ray ideal class is determined by `σ` on a sufficiently divisible reflex ray class field and is the reflex-norm ideal class of an ideal `b` whose arithmetic Artin symbol is `σ`. This ideal statement uses arithmetic Artin; [5.10 Main theorem of complex multiplication](#510-main-theorem-of-complex-multiplication) converts it to geometric `art` for ideles.

Same type gives an `E`-linear quasi-isogeny. Approximate its scalar at the finitely many primes dividing `m` to make it agree with `σ` on `m`-torsion.

Compose ideal multiplications to obtain a finite ray-class homomorphism; prove its continuity via finite torsion and a model field.

At almost every suitable good unramified prime use Shimura–Taniyama. Dirichlet/Chebotarev prime generation of ray classes extends equality to every class.

**Checks.**

- Equality only on a few Frobenius elements is insufficient; excluded primes form a finite set and remaining primes generate every ray class.

([J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.2, pp.19–20.)

This uses [5.5 Number-field models for full CM objects](#55-number-field-models-for-full-cm-objects); [5.8 Shimura–Taniyama Frobenius calculation](#58-shimurataniyama-frobenius-calculation); [5.4 Rank-one rational CM Tate module](#54-rank-one-rational-cm-tate-module); [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity); [5.1 CM types, reflex fields and reflex norms](#51-cm-types-reflex-fields-and-reflex-norms), with the exact supplier contracts above.

### 5.9a Global units and the CM closure quotient

**Target.** `TauCeti.Shimura.unit_congruence_topology`. For a number field `F` and a finite-index torsion-free subgroup `U⊂O_F×`, import [GL2AutomorphicRepresentationsAndTransfer §R16.1.7](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md#r16-1-chevalley-congruence), `chevalley_finiteIndex_congruence`, with its finitely generated subgroup `E=U` and empty excluded-place set. Deduce that the finite-idelic subspace topology on `U` equals its full profinite topology: congruence kernels have finite index, and the supplier places one inside every finite-index `U′⊂U`. Identify the `closure` of `U` in the compact integral finite ideles with its profinite completion, hence also its `closure` in `A_{f,F}×`. For a CM field `E` choose such a `U` inside the maximal real subfield's units and prove
`ker(art_E:A_{f,E}×/E×→Gal(E^ab/E))=closure(E×)/E×≅closure(U)/U`.
This quotient is fixed by CM conjugation and uniquely divisible by every positive integer; use the unit rank and the identification with `(ℤ̂/Z)^r`. Apply this componentwise to CM product algebras before §5.10. This target owns these topology and residual-kernel deductions; the generic Chevalley congruence theorem remains with the `GL₂` supplier, while ClassFieldTheory Layer 13 supplies the cyclic Hasse norm theorem separately. ([Serre, Sur les groupes de congruence des variétés abéliennes](https://www.mathnet.ru/php/archive.phtml?jrnid=im&option_lang=eng&paperid=3061&wshow=paper), §3.5, pp.3–20; [Milne 2007c](https://jmilne.org/math/articles/2007c.pdf), Lemma 3.6, p.21.)

**Checks.**

- For `E=ℚ(i)`, a torsion-free finite-index unit subgroup is trivial, so the residual quotient is trivial.
- In unit rank one, `ℤ̂/Z` is nonzero but multiplication by every positive integer is bijective.
- The topology uses all finite congruence moduli; topology from only one prime is not the full profinite topology in unit rank one.

### 5.10 Main theorem of complex multiplication

Prove `TauCeti.Shimura.main_cm` as follows. Let `(A,i:E→End⁰A)` be full CM over `ℂ`, allowing a CM product algebra, with type `Φ` and reflex field `E*`. For `σ∈Aut(C/E*)` and a finite idele `s∈A_{f,E*}×` with `art_{E*}(s)=σ|E*ab`, there is a unique `E`-linear quasi-isogeny `α:A→σA` satisfying `α(r_Φ(s)x)=σx` for every `x∈V_fA`. If `s′` has the same Artin image and `r_Φ(s′)=a r_Φ(s), a∈E×`, replace `α` by `α∘a⁻¹`. The existence of this a is proved by the norm-kernel lemmas in the CM setting, not asserted for arbitrary tori.

Reduce by an `E`-linear quasi-isogeny to maximal integral order. Choose an `E`-linear comparison with `σA` and extract its rank-one Tate scalar `η(σ)`.

The ideal theorem identifies `η(σ)/r_Φ(s)` modulo every finite torsion level. The conjugation/norm-one condition removes the residual `closure` ambiguity (`2007c` 3.6–3.12), using §5.9a and ClassFieldTheory Layer 13’s cyclic Hasse norm theorem.

Faithfulness on the rational Tate module gives uniqueness. Transport back through the chosen `E`-isogeny.

**Checks.**

- The quasi-isogeny is unique for a fixed `s`; changing `s` changes the quasi-isogeny.
- `σ` is required to fix the reflex field, not necessarily the CM field itself as an embedded subfield.

([J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Theorem 3.10 and Lemmas 3.6–3.12, pp.21–24.)

This uses [5.9 CM ideal reciprocity with prime generation](#59-cm-ideal-reciprocity-with-prime-generation); [5.4 Rank-one rational CM Tate module](#54-rank-one-rational-cm-tate-module); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity), with the exact supplier contracts above.

### 5.11 Polarization and level in CM reciprocity

Prove `TauCeti.Shimura.cm_polarization_level` as follows. For `α` from the main CM theorem and a compatible polarization form `ψ` with Rosati conjugation, `ψ_{σA}(αx,αy)=c ψ_A(x,y)` where `c=χ_cyc(σ)/N_{E*/Q}(s)∈ℚ_{>0}`. The actual Tate twist in `ψ:𝔸_f×𝔸_f→𝔸_f(1)` is retained. For an adelic symplectic level representative, `σ` transport equals the reflex-norm action modulo the chosen level and the `E`-linear quasi-isogeny.

Use `ψ_{σA}(σx,σy)=χ_cyc(σ)ψ_A(x,y)`, Rosati conjugation and `r_Φ(s)r_Φ(s)bar=N_{E*/Q}(s)`.

Class field theory identifies the quotient scalar as a positive rational number.

Apply the formula to the actual symplectic Tate trivialization and its `K`-orbit, not a raw matrix without the quasi-isogeny equivalence.

**Checks.**

- The similitude factor is `χ/N`, not `N/χ` in this `α` convention.
- An equality of unpolarized CM isogeny classes does not by itself prove the Siegel canonical condition.

([J. S. Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Remark 3.11(c), pp.22–23.)

This uses [5.10 Main theorem of complex multiplication](#510-main-theorem-of-complex-multiplication); [AbelianSchemesAndArithmeticModuli, Layer A3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a3-isogenies-finite-flat-quotients-torsion-and-pairings); [AbelianSchemesAndArithmeticModuli, Layer A2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a2-duality-polarizations-and-ample-classes); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion), with the exact supplier contracts above.

### 5.12 Siegel special points are full CM

Prove `TauCeti.Shimura.siegel_special_cm` as follows. Assume `g≥1`. For the genus-`g` Siegel datum, a complex abelian variety gives a special point precisely when it has full CM by a commutative CM algebra of degree `2g`. Products are included, so all special points rather than only simple CM fields are covered.

Use the Mumford–Tate torus criterion for a polarized weight-one Hodge structure.

By complete reducibility and positive Rosati involution, a torus Mumford–Tate action gives a full CM algebra in the endomorphisms. Conversely a full CM algebra forces a torus Hodge image.

**Checks.**

- A product of CM elliptic curves is included.
- A degree-two field acting on an abelian surface is insufficient for full CM.
- In genus zero the terminal special point and `Spec ℚ` are constructed directly; no nonempty CM algebra has degree zero.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Definition 14.9, Proposition 14.10 and Corollary 14.11, pp.123–124.)

This uses [5.3 CM abelian varieties with their algebra action](#53-cm-abelian-varieties-with-their-algebra-action); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [AbelianSchemesAndArithmeticModuli, Layer A6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a6-arithmetic-hom-and-exports), with the exact supplier contracts above.

### 5.13 The Siegel canonical model

Prove `TauCeti.Shimura.siegel_canonical` as follows. The rational polarized Siegel moduli model with the actual adelic symplectic level is a canonical model over the Siegel reflex field `ℚ`. Its complex uniformization is the Siegel variety of Layers 1 and 3; for every actual special point its Galois action is precisely Layer 4 reciprocity, including polarization, quasi-isogeny and level.

Construct the rational generic Siegel moduli object from §5.0 and its analytic family comparison.

For every special point use the product-algebra CM criterion and main theorem to identify Galois transport of the represented polarized level object.

Compare its scalar action with the special-pair cocharacter reflex norm. Extend to all levels via finite quotients.

**Checks.**

- This is a constructed instance, not a typeclass assumption that a model exists.
- The genus-one determinant/Weil-pairing identification at full level is exported to Layer 8.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.12 and existence proof, pp.125–126.)

This uses [5.2 Algebraization of polarized weight-one variations](#52-algebraization-of-polarized-weight-one-variations); [5.12 Siegel special points are full CM](#512-siegel-special-points-are-full-cm); [5.11 Polarization and level in CM reciprocity](#511-polarization-and-level-in-cm-reciprocity); [4.4 Canonical-model condition](#44-canonical-model-condition); [5.0 Rational polarized Siegel moduli](#50-rational-polarized-siegel-moduli); [Local datum foundations, §P.4](#p4-levels-and-basic-examples), with the exact supplier contracts above.

### Examples

For `ℚ(i)` with the type `{i↦i}`, the reflex field is `ℚ(i)` itself and the reflex norm is the identity, so `N_Φ(2+i)·(2−i)=5`; the conjugate type has reflex norm `a↦ā`. A product of two CM elliptic curves is full CM by the product algebra even when it is not simple. At an inert elliptic CM prime the Newton slope is 1/2; at a split prime the slopes are 0 and 1. In the square-zero inertia proof, `x²=0` in the reduced algebra `E⊗ℚ_ℓ` forces `x=0`. A positive-dimensional scalar `ℚ`-action is not full CM. The `g=0` Siegel datum is terminal and gives `Spec ℚ` separately from the positive-dimensional CM argument.

### Dependencies

The external inputs are [AbelianSchemesAndArithmeticModuli, Layer A2](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a2-duality-polarizations-and-ample-classes); [AbelianSchemesAndArithmeticModuli, Layer A3](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a3-isogenies-finite-flat-quotients-torsion-and-pairings); [AbelianSchemesAndArithmeticModuli, Layer A4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a4-realizations-and-deformations); [AbelianSchemesAndArithmeticModuli, §A4.1, the integral Tate module](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a41-the-integral-tate-module); [AbelianSchemesAndArithmeticModuli, Layer A5](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a5-complex-uniformization-and-families); [AbelianSchemesAndArithmeticModuli, Layer A6](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#layer-a6-arithmetic-hom-and-exports); [AbelianSchemesAndArithmeticModuli, §A6.11, the characteristic polynomial on the Tate module](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a611-the-characteristic-polynomial-on-the-tate-module); [AbelianSchemesAndArithmeticModuli, §A6.7, Hom is free of finite rank](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a67-hom-is-free-of-finite-rank); [AbelianSchemesAndArithmeticModuli, §A6.25, relative Hom and normal-base extension](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#a625-relative-hom-and-normal-base-extension); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [NeronModelsAndSemistableAbelianVarieties, §3.10, semistable reduction after a finite separable extension](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#310-semistable-reduction-after-a-finite-separable-extension); [NeronModelsAndSemistableAbelianVarieties, §3.7, unipotence of inertia of exponent two](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#37-unipotence-of-inertia-of-exponent-two); [NeronModelsAndSemistableAbelianVarieties, §5.1, Néron–Ogg–Shafarevich](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md#51-néronoggshafarevich); [5.0 Rational polarized Siegel moduli](#50-rational-polarized-siegel-moduli); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [ClassFieldTheory, layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-11-the-global-class-formation-and-global-artin-reciprocity); `NumberField.IsCMField`; `NumberField.ComplexEmbedding.conjugate`; `IntermediateField.adjoin`; `LinearMap.det`; [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [AdelicAlgebraicGroups, §1.4, restriction of scalars on adelic points](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#14-restriction-of-scalars-and-concrete-groups).

Earlier constructions used here are 3.2 Borel algebraicity; 4.1 Milne geometric Artin conversion; 4.2 Reflex norm of a special torus; 4.4 Canonical-model condition.

## Layer 6: Hodge and abelian-type existence

### 6.1 Inheritance by Shimura subdata

Prove `TauCeti.Shimura.hodge_inheritance` as follows. If `i:(G,X)↪(H,Y)` is a Shimura subdatum and `(H,Y)` has a canonical tower, then `(G,X)` has a canonical tower over `E(G,X)`, whose suitable neat levels embed into the ambient tower after base change to a common reflex field. Descent of the image to `E(G,X)` is proved using actual special points and their reciprocity, not by claiming every `ℂ`-subvariety of a model descends.

Use the small-level closed-immersion theorem and transport the ambient Galois action on special points.

Field-disjoint special reflex fields and Hecke density establish invariance and the unique descent maps for the image.

Apply effective quasi-projective descent with continuity supplied by the finite orbit argument; construct all levels and verify reciprocity.

**Checks.**

- Same derived group alone does not identify full Shimura varieties.
- No absolute-Hodge tensors are assumed in this bare-existence route.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127.)

This uses [3.4 Algebraic maps of Shimura data](#34-algebraic-maps-of-shimura-data); [4.4 Canonical-model condition](#44-canonical-model-condition); [4.7 Existence and density of special points](#47-existence-and-density-of-special-points); [4.8 Density of Hecke translates](#48-density-of-hecke-translates); [4.10 Disjoint special reflex fields](#410-disjoint-special-reflex-fields); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 6.2 Canonical models of Hodge type

Prove `TauCeti.Shimura.hodge_canonical` as follows. Every Hodge-type datum of §P.1 has a canonical tower over its reflex field, by choosing its actual embedding into a Siegel datum, applying Siegel existence and subdatum inheritance. The resulting tower is independent of the embedding through canonical-model uniqueness.

Choose the symplectic embedding supplied by the definition of Hodge type.

Apply §6.1 to the constructed Siegel model.

Use §4.12 uniqueness only after both candidate models satisfy the full Layer 4 condition; its proof requires actual models but no general-data existence theorem.

**Checks.**

- No new Hodge-type definition is introduced.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.14, p.127.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [5.13 The Siegel canonical model](#513-the-siegel-canonical-model); [6.1 Inheritance by Shimura subdata](#61-inheritance-by-shimura-subdata); [4.12 Uniqueness of canonical models](#412-uniqueness-of-canonical-models), with the exact supplier contracts above.

### 6.3 Connected Shimura tower with completed symmetry

Construct `TauCeti.Shimura.ConnectedTower` as follows. For the connected derived datum `(G^der,X⁺)`, whose points are `S→G^ad_R` and are not required to lift to `G^der_R`, form the analytic pro-object `M⁰=(Γ∖X⁺)_Γ` and its inverse-limit point set over torsion-free arithmetic subgroups of `G^ad(Q)^+` open in the congruence topology induced by `G^der`. Retain the completion of `G^ad(Q)^+` relative to `G^der` and its action. A connected canonical formulation includes the adelic/Galois extension and its reciprocity on actual maximal special tori, as in Deligne 2.7.13; a bare connected pro-variety over `ℚ̄` is insufficient.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Construct the congruence-indexed inverse system and its compatible symmetry, as in the 1983 appendix.

Use the Deligne completed-symmetry construction to define the connected canonical datum with actual Galois compatibility; its extension and coherence laws are constructed in the next paragraph.

Construct the connected extension as Deligne's pullback of the adelic component extension along global reciprocity and the abelianization map of `Gal(ℚ̄/E)`. Its kernel is the completion of `Gᵃᵈ(ℚ)⁺` relative to the chosen derived cover. The extension acts continuously and semilinearly on the connected `ℚ̄` model: the kernel acts `ℚ̄`-linearly and the quotient acts on the base field. A special adjoint torus gives the extension map whose image fixes its marked point. A change of finite base field pulls back the extension; a central quotient changes the completion kernel. Prove these action and compatibility laws rather than choosing an unsupported splitting. ([Deligne, Variétés de Shimura](https://www.math.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.5.1–2.5.10, pp.280–283; 2.7.10, pp.286–287.)

Expose the following named operations and laws.

- `TauCeti.Shimura.ConnectedTower.level`: The `Γ`-level is the actual algebraized quotient `Γ∖X⁺`.
- `TauCeti.Shimura.ConnectedTower.transition`: Subgroup inclusion gives finite algebraic maps; identity and composition hold.
- `TauCeti.Shimura.ConnectedTower.completedAction`: The completed adjoint rational symmetry acts compatibly on the pro-object; its topology is induced by derived-group congruence subgroups.
- `TauCeti.Shimura.ConnectedTower.canonicalExtension`: The connected canonical version retains the adelic/Galois extension, with its multiplication/coherence and marked-special-torus reciprocity.
- `TauCeti.Shimura.ConnectedTower.hom_ext`: Two morphisms of the congruence-indexed tower diagrams agreeing at each finite level are equal; canonical morphisms additionally commute with the specified completion/Galois extension.
- `TauCeti.Shimura.ConnectedTower.lift`: Compatible holomorphic maps from a test complex analytic space `Y` to every finite `Γ∖X⁺` quotient give a unique morphism from the constant pro-object `Y` to the analytic tower; projections recover those maps. The algebraic tower has the analogous compatible-morphism universal property in its pro-category. No finite-dimensional analytic-space structure is asserted on the inverse-limit point set.

**Checks.**

- `TauCeti.Shimura.ConnectedTower.trivial`: A trivial derived group gives the one-point connected tower.
- `TauCeti.Shimura.ConnectedTower.sl2`: For the `GL₂` datum the connected tower is the congruence tower `Γ∖ℍ` induced by `SL₂`, with effective `±I` removed where present.
- `TauCeti.Shimura.ConnectedTower.not_full`: A singleton connected derived torus tower does not recover the multiple full torus level components without the component/reciprocity extension.

([Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Appendix, pp.263–265; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [1.2 Complex analytic structure of the tower](#12-complex-analytic-structure-of-the-tower); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [4.4 Canonical-model condition](#44-canonical-model-condition); [AdelicAlgebraicGroups, §4.2, strong approximation for semisimple groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs), with the exact supplier contracts above.

### 6.4 Connected and full canonical formulations

Prove `TauCeti.Shimura.connected_full_equivalence` as follows. A pure Shimura datum admits a full canonical model over `E(G,X)` if and only if its connected derived tower admits the connected canonical structure with completed adelic/Galois symmetry of [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry). The comparison reconstructs finite components and their reciprocity, preserving the completion action; forgetting this symmetry invalidates the equivalence.

Use Deligne 2.7.13/Milne 14.15 to restrict and reconstruct the components with the extension action.

Check the Artin action on component classes and the stabilizing completion subgroup.

Construct and verify the connected extension and gluing formulas together with §6.3; the equivalence uses their continuous semilinear action.

For the reconstruction, convert the full right symmetry to a left action of a locally compact totally disconnected group `Λ`. Let `Π` be the transitive profinite component set, with compact-open orbits open and `Λ/Λ_e→Π` a homeomorphism; let `e` be its marked component. For commuting `Λ` and Galois actions on `Π`, the stabilizer `Σ` of `e` in `Λ×Gal(ℚ̄/E)` is an extension of `Gal(ℚ̄/E)` by `Λ_e`; multiply pairs componentwise. The connected fibre has a continuous semilinear `Σ`-action. Conversely induce the fibre from `Λ_e` to `Λ` and descend its commuting Galois action. At a compact open `U⊂Λ` the induced level is the finite disjoint union, indexed by `U∖Λ/Λ_e`, of `(λ⁻¹Uλ∩Λ_e)`-quotients of the fibre. Verify transition maps, the special-torus fixed-point condition and the comparison in both directions. The relevant normal-sublevel finite quotients retain effective action kernels. For a torus the connected fibre is a point; `Π` and its Galois action still reconstruct the full finite levels. ([Deligne, Variétés de Shimura](https://www.math.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), 2.7.1–2.7.9, pp.285–286; Proposition 2.7.13 including the reconstruction formulas, pp.287–288.)

**Checks.**

- The assertion is not an isomorphism between connected and full varieties.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Theorem 14.15, p.127.)

This uses [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry); [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition); [4.5 Finite étale torus canonical models](#45-finite-étale-torus-canonical-models); [4.4 Canonical-model condition](#44-canonical-model-condition), with the exact supplier contracts above.

### 6.5 Products of connected canonical models

Prove `TauCeti.Shimura.connected_products` as follows. The connected canonical construction is compatible with finite products of connected derived data, including the product of their congruence completions and the diagonal Galois action through the required extension. The product model satisfies the connected special-point condition.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Take product inverse systems and product level quotients.

Use reflex-norm functoriality to compare marked tori and the Galois extension.

Apply compatible finite-component descent where the full datum is reconstructed.

**Checks.**

- Product datum reflex field is the compositum, not necessarily either individual field.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(a), p.127.)

This uses [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry); [6.4 Connected and full canonical formulations](#64-connected-and-full-canonical-formulations); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs), with the exact supplier contracts above.

### 6.6 Central-isogeny descent of connected models

Prove `TauCeti.Shimura.central_isogeny_descent` as follows. For a central isogeny `f:G₁→G₂` of semisimple derived groups with compatible connected data and a connected canonical model of `(G₁,X₁⁺)`, the connected tower for `(G₂,X₂⁺)` is the quotient of the source tower by the kernel of the induced map on congruence completions. At each finite level use the finite effective quotient; descend its canonical symmetry and reciprocity. The source in Milne 14.16(b) must be `G₁`, correcting the repeated `G₂` misprint.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Compute the map of completed adjoint rational symmetry and its kernel; finite-level images act on the source quotient.

Construct the effective finite algebraic quotients and descend their Galois symmetry.

Verify reciprocity by central-isogeny compatibility of the cocharacter norm; compare the inverse systems.

Central isogenies identify the adjoint groups and hence the `S`-maps of connected data; no algebraic lift `S→G₁` is required. the local datum foundations of §§P.1–P.4 only treats a given lift of a full datum and does not supply such an existence assertion.

**Checks.**

- This gives a quotient, not an identification of full varieties with the same derived group.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Proposition 14.16(b), p.127.)

This uses [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs), with the exact supplier contracts above.

### 6.7 Canonical models of abelian type

Prove `TauCeti.Shimura.abelian_canonical` as follows. Every abelian-type datum as defined in §P.1 admits a canonical tower over its reflex field. Use the Hodge-type witness, products and central-isogeny descent for the connected derived datum, then §6.4. The full components and reflex-field action are reconstructed rather than identified with those of the Hodge-type witness.

Apply the actual abelian-type central-isogeny relation to the derived connected data.

Descend the Hodge-type connected model through its completion kernel; reconstruct the target full tower.

Check Layer 4 on all special pairs and use uniqueness to remove witness choices.

**Checks.**

- This branch does not depend on Layer 7 general-data conjugation.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §14, pp.127–128.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [6.2 Canonical models of Hodge type](#62-canonical-models-of-hodge-type); [6.5 Products of connected canonical models](#65-products-of-connected-canonical-models); [6.6 Central-isogeny descent of connected models](#66-central-isogeny-descent-of-connected-models); [6.4 Connected and full canonical formulations](#64-connected-and-full-canonical-formulations), with the exact supplier contracts above.

### Examples

For `GL₂` the connected derived tower is the effective congruence tower `Γ∖ℍ` induced by `SL₂`. It has one chosen domain component, while the full principal `N=3` level has two pairing components. A central isogeny changes congruence completions and must be handled as a quotient, not as equality of full varieties. The terminal derived datum has the one-point connected tower.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, §4.2, strong approximation for semisimple groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

Earlier constructions used here are 0.5 Finite analytic component decomposition; 1.2 Complex analytic structure of the tower; 3.4 Algebraic maps of Shimura data; 3.5 Algebraic finite quotients and normalization; 4.10 Disjoint special reflex fields; 4.12 Uniqueness of canonical models; 4.2 Reflex norm of a special torus; 4.4 Canonical-model condition; 4.5 Finite étale torus canonical models; 4.7 Existence and density of special points; 4.8 Density of Hecke translates; 5.13 The Siegel canonical model.

## Layer 7: Conjugation and general canonical existence

### 7.0 Arithmetic and rigidity prerequisites

Construct §§7.0a–7.0b before §7.5, §7.0c before §7.12, §§7.0e–7.0f before §7.7, and §§7.0g–7.0j before §7.6. Section 7.0d uses the conjugate universal cover of §7.6 and precedes §7.7. The classification, CM splitting and root-centre constructions remain the targets of §§7.1–7.4.

### 7.0a Serre protorus

**Target.** `TauCeti.Shimura.SerreProtorus`. For every finite Galois CM extension `L/ℚ` construct the torus `S^L` with character lattice consisting of `χ=Σ n_ρ[ρ]∈Z[Hom(L,ℚ̄)]` such that `(σ−1)(c+1)χ=0` for every `σ`, with `c` complex conjugation. Construct its universal cocharacter `μ^L`, rational weight, conjugation and the norm transition maps `S^{L′}→S^L`. Prove the universal mapping property for a rational torus split by `L` with a cocharacter satisfying this character relation. Form the Serre protorus `S=lim S^L` and its universal cocharacter, with finite-level factorization of torus morphisms. Use the algebraic torus character dictionary of ReductiveGroups and RG2.0a. ([Milne–Shih, Langlands's construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf), §1, equations (1.1)–(1.3), pp.230–232.)

**Checks.**

- For `L=ℚ(i)`, the two character coefficients have constant sum under conjugation; `S^L` is `Res_{L/ℚ}G_m`.
- The relation constrains the sum on each conjugate pair, rather than requiring `χ` itself to be Galois invariant.
- `Norm` transition maps send the universal cocharacter to the smaller field's universal cocharacter and compose transitively.

### 7.0b Taniyama extension and torsors

**Target.** `TauCeti.Shimura.TaniyamaExtension`. For finite Galois CM extensions `L/ℚ`, use GL2AutomorphicRepresentationsAndTransfer §R17.5.0’s relative extensions `1→C_L→W_{L/ℚ}→Gal(L/ℚ)→1` and global Weil group, with their supplied transfer, norm-transition, local-map and reciprocity compatibilities. Use the imported projection and abelianization comparison to lift elements of `Gal(L^ab/ℚ)` as in Milne–Shih (3.2), retaining the class-formation fundamental class represented by the imported extension. Construct the associated Serre-torus extensions over `Gal(L^ab/ℚ)` by Milne–Shih §3’s cocharacter cocycle construction using §7.0a, and pull them back to `Gal(ℚ̄/ℚ)`. Prove that changing a representative cocycle by a coboundary gives an isomorphism of the resulting Serre-torus extensions preserving their finite-adelic sections. Prove that the Serre-level transition maps induce Galois restriction on the quotient and the §7.0a norm on the kernel, and that the imported transfer/reciprocity squares remain commutative after the Serre-torus maps. Use this single Weil-extension system throughout. Construct the compatible extensions by `S^L` and their inverse limit `1→S→𝒯→Gal(ℚ̄/ℚ)→1`, with the norm-compatible continuous finite-adelic homomorphic section. Prove independence from the auxiliary Weil representatives, the transition laws and the extension multiplication. For `σ` construct the actual `S`-torsor `S_σ` above `σ`, its distinguished finite-adelic point and the contracted-product multiplication isomorphisms, with identity, associativity and cocycle laws. Push these torsors along the universal marked cocharacter homomorphism `S→T^ad`; give base-change and torus-morphism compatibility and faithful descent of morphisms. This supplies the arithmetic torsors of §7.5, before their Shimura interpretation. ([Milne–Shih](https://jmilne.org/math/articles/1982c.pdf), §2, especially Corollary 2.8 and Remark 2.9, pp.233–239; §3, diagrams (3.1)–(3.2), pp.242–243, transfer diagram, p.250, Proposition 3.11 and Lemma 3.12, pp.250–256; Remark 3.18, p.259.)

**Checks.**

- The identity fibre is `S` with its identity section, and its pushout gives the untwisted group.
- Multiplying the distinguished finite-adelic points gives the point in the product fibre; arbitrarily chosen torsor points need not satisfy this law.
- Pushing out through a composite torus map equals successive pushout, preserving the distinguished section.
- For `L=ℚ(i)` and a finite Galois CM extension `L′⊃L`, the Serre-level transition square uses the supplier’s actual `W_{L′/ℚ}→W_{L/ℚ}`, induces restriction on Galois quotients and norm on Serre kernels, and respects the cocharacter cocycle construction from the supplied fundamental classes; an abstract isomorphism of the middle groups alone does not supply these compatibilities.

### 7.0c Finite normalizer index

**Target.** `TauCeti.Shimura.finite_normalizer_index`. Let `D` be a positive-dimensional Hermitian symmetric domain with no Euclidean or compact factors and `Γ⊂Aut_hol(D)` a torsion-free arithmetic lattice acting effectively. Prove that `N=Norm_{Aut_hol(D)}(Γ)` is discrete and `[N:Γ]` is finite. Lifting automorphisms of `Γ∖D` to its simply connected domain identifies `Aut_hol(Γ∖D)=N/Γ`; consequently its algebraic automorphism group is finite. Prove countability and closedness of `N` and apply the Baire/`Lie` argument, then use finite covolume for the index. Retain component permutations for a finite disjoint union. ([Milne 1999](https://jmilne.org/math/articles/1999cP.pdf), Lemma 2.2 and its normalizer proof, p.4; Margulis, Discrete subgroups of semisimple `Lie` groups, II §6.3, cited there.)

**Checks.**

- A neat modular arithmetic curve has finite automorphism group, although its open analytic uniformization is noncompact.
- The translation lattice `Z²` on `ℂ` has a continuous normalizer; Euclidean factors are excluded.
- A finite set has its full finite permutation group; zero-dimensional rigidification uses all points rather than this positive-dimensional theorem.

### 7.0d Ranked S-arithmetic reconstruction

**Target.** `TauCeti.Shimura.s_arithmetic_reconstruction`. For the almost `ℚ`-simple simply connected connected datum of §7.1, construct `Γ₀` from the lifted conjugated Hecke correspondences on the Hermitian universal cover of §7.6 as in Milne 3.3–3.4. For a sufficiently large nonempty finite set `S` of finite primes, its subgroup `Γ₀,S^+` is an irreducible lattice in `G′_S=Aut(D′)^+×∏_{p∈S}G(ℚ_p)`. Require the sum of local ranks to be at least two. Prove arithmeticity in this precise setting: recover a `ℚ`-group `G₁` and `ψ_S:(G₁)_R×∏_{p∈S}(G₁)_{ℚ_p}→G′_S` with an `S`-arithmetic subgroup mapping commensurably to `Γ₀,S^+, ψ_∞` surjective with compact kernel and each `ψ_p` an isomorphism. Prove uniqueness and compatibility as `S` grows. Apply superrigidity to the adjoint faithful representations of this lattice, retaining unboundedness and Zariski density, to place `Γ₀` in `ψ(G₁(Q))·Z(G(𝔸_f))`, and identify the compatible finite-local maps. No rank-one lattice rigidity is asserted. ([Milne 1983](https://jmilne.org/math/articles/1983a.pdf), Lemmas 3.5–3.7 and their proofs, pp.248–250, using Margulis's arithmeticity and superrigidity theorems.)

**Checks.**

- `SL₂(ℝ)` alone has rank one and does not meet the rank hypothesis.
- `SL₂(ℝ)×SL₂(ℚ_p)` has total rank two; irreducibility is still required.
- A product of separate lattices in the two factors is reducible and cannot be used in this reconstruction.

### 7.0e Global centre cohomology and adjoint comparison

**Target.** `TauCeti.Shimura.global_centre_adjoint_comparison`. For a semisimple simply connected group `G` over a number field `k` with no simple factor of type `A_n` for `n≥4`, prove injectivity of `H¹(k,Z(G))→∏_{v finite}H¹(k_v,Z(G))`. Construct the centre's finite character/Galois module, reduce by products and Weil restriction, and use the cyclic splitting-field argument in the corrected Lemma 3.8; this is not an assertion about `H¹(k,G)`. Construct twisting compatibility. Separately prove the adjoint Hasse comparison used in Milne p.258: classes of torsors under a semisimple adjoint `k`-group that agree at every place agree globally, with the comparison isomorphism on the represented inner forms. Apply it to the finite-locally trivial marked twists with equal real classes. The exceptional `A_n` central adjustment is the separate §7.7 proof using its rank-one subgroups, rather than an application of the first assertion. ([Milne 1983](https://jmilne.org/math/articles/1983a.pdf), corrected Lemma 3.8, p.250; special-point transition, p.258, citing Kneser's Galois cohomology lectures VII §6; [Platonov–Rapinchuk, Algebraic Groups and Number Theory](https://uva.theopenscholar.com/files/andrei-rapinchuk/files/agnt-english.pdf), Theorem 6.22, p.336, for the adjoint Hasse principle and twisting.)

**Checks.**

- For `SL₂` the centre is `μ₂`, so the first map is the finite-place square-class test.
- Type `A₄` is outside the centre theorem's hypotheses; no unrestricted finite-place assertion is exported.
- Two twists agreeing only at finite places can still differ at a real place, so the adjoint comparison retains all places.

### 7.0f Quadratic splitting-torus norm comparisons

**Target.** `TauCeti.Shimura.quadratic_torus_norms`. For a quadratic CM extension `L/F` with `F` totally real and `T` split by `L` and compact at all real places, conjugation acts by `−1` on `X_*(T)`; identify `T` with a product of `Res¹_{L/F}G_m` using a lattice basis. Construct `H¹(F,T)≅(F×/Nm L×)^r`, with its localization maps. Import the cyclic Hasse norm theorem from ClassFieldTheory Layer 13 and prove the real-localization surjectivity needed to prescribe a single real obstruction: weak approximation chooses representatives with the required signs. A totally positive representative a becomes a norm after the totally real extension `F(√a)`, since `Nm(√a)=a` in the base-changed quadratic algebra. Prove compatibility of these operations with the root-torus inclusions in §7.10 and with successive extensions. ([Milne 1983](https://jmilne.org/math/articles/1983a.pdf), Remark 4.2, p.253, and Weyl-length induction, pp.260–261.)

**Checks.**

- For `ℚ(i)/Q` the real norm image is `ℝ>0`, so `−1` gives a nontrivial real class.
- A totally positive a has only real square roots under every real embedding; the adjoining field is totally real.
- Finite-place norm conditions are not dropped in the global Hasse norm step.

### 7.0g Compact-case metric input

**Target.** `TauCeti.Shimura.compact_negative_ke_metric`. For a smooth projective complex variety `V` with ample canonical bundle, construct the unique Kähler–Einstein metric with usual Ricci form `−ω` and Kähler class `2πc₁(K_V)`. Prove existence by the negative-first-Chern-class complex Monge–Ampère argument and uniqueness by its comparison principle. Prove completeness on `V` and compatibility with finite étale covers: pullback is the normalized metric on each compact cover by uniqueness. Isomorphisms between such covers preserve it, so their lifts give the invariant metric needed for the conjugated arithmetic tower. Use Milne's opposite sign for Ricci of a volume element only when translating to his positive-volume criterion. Apply his Theorem 2.4 to the lifted group action and finite volume to recover the Hermitian symmetric universal cover; a negative Einstein metric alone is insufficient to assert symmetry. This compact-case input precedes §7.6. ([Yau, On the Ricci curvature of a compact Kähler manifold and the complex Monge–Ampère equation, I](https://doi.org/10.1002/cpa.3160310304), §6, Theorems 4–5 and the ample-canonical deduction, pp.383–385; [Milne, Kazhdan's theorem on arithmetic varieties](https://www.jmilne.org/math/articles/1984T.pdf), Theorem 2.4 and Remark 2.7, pp.9–12.)

**Checks.**

- On a compact hyperbolic curve the normalized metric has negative usual Ricci curvature.
- An abelian variety has trivial canonical bundle and fails the ample-canonical hypothesis.
- An ample-canonical variety supplies the metric; the arithmetic tower's lifted symmetry is still required to deduce a symmetric domain.

### 7.0h Clozel multiplicity and holomorphic top-form growth

**Target.** `TauCeti.Shimura.clozel_top_forms_growth`. In the reduced case of §7.1 let `G/ℚ` be connected, simply connected, semisimple and almost `ℚ`-simple, with `G(ℝ)` noncompact and Hermitian domain `D`. Construct the finite-place supercuspidal input of Clozel §3.1: a place `p_0`, a unitary supercuspidal `π_(p_0)`, a compact open `K_(p_0)` with nonzero fixed vectors, and its matrix-coefficient test. Choose a nonempty finite set `S` of primes disjoint from `{p_0}`, a sufficiently small neat factorizable `K_0`, and a nested normal congruence tower `K_i=K_(p_0)×K_(S,i)×K^(S,p_0)`, with `K_(S,i)` tending to 1 and the other factors fixed. Prove that `Γ_i=G(ℚ)∩K_i` have trivial intersection; the adelic `K_i` themselves retain the fixed local factors. For the holomorphic discrete series `W` of square-integrable holomorphic top forms on `D`, prove
`liminf_i m(W,L²_cusp(Γ_i∖G(ℝ)))/[Γ_0:Γ_i]>0`.
Use SmoothRepresentationsOfLocalGroups §SR.`3a`.1 for local matrix coefficients and formal-degree orthogonality, and AutomorphicSpectralTheory §0.48 for real discrete series, §6.18 for pseudo-coefficients, and §§6.12–6.16 for fine expansions and trace distributions. Construct the shrinking-level trace estimates needed for this bound here, as in Clozel §§3,5; these estimates are additional to the supplied trace identities. Identify the `W`-multiplicity with `dim H⁰_(2)(Γ_i∖D,Ω^dim D)`, and deduce a positive normalized lower bound for these `L²` holomorphic top forms, after discarding finitely many levels if necessary. Prove its transport to conjugate varieties by extension to top forms on smooth compactifications and invariance of their algebraic dimensions. This is the congruence-tower bound with fixed supercuspidal place; it assumes no general limit-multiplicity conjecture. ([Clozel, On limit multiplicities of discrete series representations in spaces of automorphic forms](https://doi.org/10.1007/BF01388963), Invent. Math. `83 (1986)`, Theorem `1A`, §3, pp.268–276, and Theorem 1, §5.1, pp.280–281; [Milne, Kazhdan's theorem on arithmetic varieties](https://www.jmilne.org/math/articles/1984T.pdf), p.19 and Lemmas 3.18–3.19, p.20.)

**Checks.**

- Keeping `K_(p_0)` nontrivial is compatible with `∩Γ_i={1}`, but not with `∩K_i={1}`; shrinking at a different finite place kills every nonidentity rational element.
- An eventually constant arithmetic tower fails the shrinking and trivial-intersection hypotheses and supplies no such growth conclusion.
- For torsion-free `SL₂` modular levels, `L²` holomorphic top forms are weight-two cusp forms and regular differentials on the smooth compactified curve; forms with a nonzero constant term at a cusp fail the `L²` condition.

### 7.0i Absolute Hodge tensors on abelian varieties

**Target.** `TauCeti.Shimura.abelian_absolute_hodge`. Let A be an abelian variety over `ℂ`. Use `H_B=H¹(A^an,Q)`, dual to the homological realization of Layer `5, H_dR=H¹_dR(A/C)`, and the rational finite-adelic étale realization `H_et`. Form finite direct sums of tensor powers of these spaces, their duals and Tate twists, with evaluation, contraction, permutation and tensor products. A rational Hodge tensor is an element `t_B` of type `(0,0)` in such a tensor space. Its comparison images `t_dR` and `t_et` determine a compatible realization tuple. Prove Deligne's theorem: for every `τ∈Aut(C)`, the algebraically transported `t_dR` and `t_et` on `τA` are the comparison images of a unique rational Hodge tensor `t_B^τ`. Retain the Tate lines and their comparison maps, including the period `2πi` and the étale cyclotomic twist. This asserts absoluteness, not that every Hodge class is algebraic.

Use AbelianSchemesAndArithmeticModuli §§A4.1, `A4`.3–`A4`.4 and `A5`.6–`A5`.7 for abelian schemes, degree-one realizations, exterior powers and the homology/cohomology conventions. Use ComplexComparisonPartII §§C5.1–C5.3 for the multiplicative Betti/de Rham and relative Hodge comparisons, and §C6.6 for the rational étale comparison. These are the realization carriers of this target. On every tensor expression, if `c_dR,A` is the Betti/de Rham comparison, require `c_dR,τA(t_B^τ)=τ_*c_dR,A(t_B)`, with scalar extension understood. Require the analogous equality for the finite-adelic étale comparison and algebraic base change of étale realizations. Prove compatibility with quasi-isogenies, products, duality, contractions and tensor relations; transport by `τ` followed by `σ` equals transport by `στ`.

Construct the family form as well. For an abelian scheme over a smooth connected finite-type complex base, a rational flat tensor of type `(0,0)` on every fibre has a horizontal algebraic de Rham realization and compatible étale realization, and conjugation transports these to the rational flat Hodge tensor on the conjugate family. Construct those algebraic realizations on the supplied bundles; analytic flatness alone does not assert algebraicity. Prove the deformation principle for compatible horizontal realization sections, then reduce abelian Hodge tensors to CM fibres and the split Weil classes of Deligne's proof. This supplies the absolute-Hodge and family input independently of the general Shimura conjugation theorem. ([Deligne, Hodge cycles on abelian varieties](https://www.jmilne.org/math/Documents/Deligne82.pdf), §2, Theorem 2.11, Theorems 2.12 and 2.15, tensor formulation preceding Example 2.3, p.16, and §§3–6.)

**Checks.**

- For the polarization and an actual endomorphism, transport agrees with algebraic conjugation of that structure, with its dual and Tate twist.
- Every rational `(0,0)` tensor on every power of an abelian variety is included, even without a presentation by endomorphisms and polarizations; preserving those extra structures alone does not discharge this case.
- For `τ=id` the tensor is unchanged; `τ` followed by `τ⁻¹` returns all three realizations, including a nonzero polarization tensor.
- On an elliptic curve a nonzero holomorphic class in `H¹` has type `(1,0)`, so it is not a rational `(0,0)` tensor and gives no instance of the theorem.

### 7.0j Conjugation of tensor moduli and abelian-type quotients

**Target.** `TauCeti.Shimura.hodge_tensor_moduli_conjugation`. Fix a Hodge-type embedding `(G,X)↪(GSp(V,ψ),S±)`, a finite rational defining family of tensors in `V, V^∨` and Tate lines whose common stabilizer inside `GSp` is `G`, a chosen component `X⁺` and neat level `K`. Include the polarization with its Tate line; use the cohomological dual of `V` when applying §7.0i. Construct the tensor-moduli description of the connected algebraization of §§2.7 and 6.2: polarized abelian varieties up to quasi-isogeny, their specified rational Hodge tensors and compatible `K`-orbits of finite-adelic level structures, with Hodge structures in `X⁺`. Prove this description in families, retaining its algebraic de Rham and étale realizations. For every `τ∈Aut(C)`, §7.0i transports this moduli problem and identifies its conjugate with a connected Hodge-type arithmetic quotient. The tensors in a conjugate reference fibre define the rational stabilizer and its Hodge orbit; identify the whole moduli component with that quotient by the polarized Hodge equivalence. Prove the two analytic moduli comparisons inverse by tensor transport under `τ` and `τ⁻¹`. Apply §3.2 only to the map into the established quotient algebraization; §3.3 supplies its algebraic inverse. No identification with the particular marked twist of §7.5 is asserted here.

Retain the finite-adelic realization equality of §7.0i, so that the tensor-preserving level orbits, their inclusions and the ordered translation maps are transported. Use the analytic weight-one equivalence and its algebraization in §5.2 for families, together with §7.0i's additional tensor comparison. Canonical existence over the reflex field alone does not provide this arbitrary-`τ` comparison.

For an abelian-type connected datum, use its actual Hodge-type witness and central derived isogeny. The complex comparisons of §§6.3 and 6.6 give a common sufficiently small finite level and the finite effective quotient maps through the relevant congruence completions. Retain these maps, their kernels and their level indices, rather than identifying full varieties from their derived groups. Conjugation preserves the finite étale common covers and their finite quotient diagrams. At torsion-free effective target levels these are unramified quotient maps; covering-space theory gives the same Hermitian universal domain and a finite-index extension or subgroup of its arithmetic lattice. For an arbitrary arithmetic subgroup commensurable with these congruence groups, use their common finite-index subgroup and ComplexComparisonPartII §C6.2 / `riemannExistence` to algebraize the finite analytic covers before conjugating them. This proves the moduli branch of §7.6 for abelian type. Use the earlier complex quotient comparisons, without the conjugation comparisons of §§7.7–7.11. ([Milne, Kazhdan's theorem on arithmetic varieties](https://www.jmilne.org/math/articles/1984T.pdf), p.2, moduli argument and finite étale reduction; [Milne, SVI](https://jmilne.org/math/xnotes/svi.pdf), §14, especially Proposition 14.16, pp.127–128.)

**Checks.**

- For the Siegel datum, transport of the polarization and level gives the conjugate polarized abelian moduli problem.
- A Hodge-type defining family containing higher tensors must transport those tensors by §7.0i; a comparison of only polarizations and endomorphisms does not identify its conjugate locus.
- For `GL₂` at principal level 3 the full variety has two pairing components, while the chosen connected derived quotient has one; the central-isogeny passage retains that distinction.
- A finite quotient with fixed points does not give the asserted unramified covering comparison; the torsion-free effective target hypothesis is required.

### 7.1 Reduction to simple simply connected data

Prove `TauCeti.Shimura.simple_connected_reduction` as follows. To prove general canonical-model existence it suffices to prove marked conjugation with completed symmetry for connected data whose group is semisimple simply connected and almost `ℚ`-simple. Such a group is `Res_{F/Q}G′` for a totally real number field `F` and an absolutely almost simple simply connected `F`-group `G′`. Products, the derived central cover and Layer 6 reconstruction then restore the original reductive datum.

Use the classification of `ℚ`-simple semisimple groups as restrictions of scalars and the real Cartan condition to force `F` totally real.

Separate the central torus/component reconstruction from the semisimple conjugation assertion.

Use product and central-isogeny descent only with their completed symmetry; do not identify full data by derived groups.

**Checks.**

- Exceptional Hermitian `E₆/E₇` factors remain in scope.
- No Langlands conjugation theorem is imported as an established prerequisite.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 7.1, p.262; SVI §14, p.128; [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus.)

This uses [6.4 Connected and full canonical formulations](#64-connected-and-full-canonical-formulations); [6.5 Products of connected canonical models](#65-products-of-connected-canonical-models); [6.6 Central-isogeny descent of connected models](#66-central-isogeny-descent-of-connected-models); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus), with the exact supplier contracts above.

### 7.2 Auxiliary totally real splitting extension

Prove `TauCeti.Shimura.auxiliary_cm_splitting` as follows. For the simple connected case and a maximal torus `T′⊂G′` whose adjoint image contains the marked `S`-map, choose a finite totally real extension `F′/F` such that the base-changed torus splits over a CM quadratic extension `L′/F′`. The corresponding restriction-of-scalars datum admits the compatible connected embedding of the original datum. Proving the comparison there implies it for the original embedded connected tower.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

The adjoint special torus is compact at every real place by the Cartan condition; since `G′` is semisimple, its preimage `T′` is also compact. Complex conjugation acts as `−1` on its character lattice at every real embedding. In a finite Galois splitting field this involution is central, so the splitting field is CM; take a totally real extension containing its maximal real subfield, making the compositum quadratic CM.

Construct the diagonal inclusion into `Res_{F′/Q}(G′_{F′})` with the induced components.

Apply the subgroup comparison principle of Milne 1.6 and §6.4. Compatibility and choice independence are checked in the marked comparison.

**Checks.**

- The extension need not be chosen canonically.
- Its purpose is splitting the special torus, not turning an exceptional group into abelian type.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, p.253; §6, pp.260–262; SVI §14, p.128; [Tau Ceti Project, Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md), layer-rg20a-weil-restriction-and-the-deligne-torus.)

This uses [7.1 Reduction to simple simply connected data](#71-reduction-to-simple-simply-connected-data); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [3.4 Algebraic maps of Shimura data](#34-algebraic-maps-of-shimura-data); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs), with the exact supplier contracts above.

### 7.3 Root subdata of type A₁

Prove `TauCeti.Shimura.rank_one_subdata` as follows. Assume `T′` splits over a CM quadratic `L/F`. For each root `α` of `(G′,T′)` noncompact at some real place, the `Lie` algebra `Lie(T′)⊕g_α⊕g_{−α}` descends to a reductive `F`-subgroup `H′_α` containing `T′`, whose derived group has type `A₁`. `Res_{F/Q}H′_α` has an induced adjoint `S`-map obtained by projecting `h` through `T^ad→(H′_α)^ad`. After taking the simply connected cover of its derived group and removing compact ineffective factors it gives the required connected rank-one subdatum. No lift of `h` to that cover is required.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

The quadratic CM involution exchanges `α` and `−α`, so the displayed `Lie` algebra is stable under `Gal(L/F)`.

Construct the reductive subgroup generated by `T′` and the `±α` root groups and descend it by quadratic Galois stability. Project the marked `S`-map to its adjoint group, then verify Hodge types and the Cartan condition. The semisimple cover carries the same adjoint `S`-map; do not use a full-datum lift existence assertion.

Use the `A₁` symplectic realization and Layers 5–6 to prove its marked conjugation comparison from CM, not just canonical-model existence. Prove that `A₁` comparison here, with its functoriality for the inclusion (Milne 1983 Remark 1.5, p.242; Milne–Shih, Conjugates of Shimura varieties, §9); canonical-model existence for the `A₁` datum alone does not give it.

**Checks.**

- A root may be compact at some places and noncompact at another.
- No claim that arbitrary `A₁` subgroups generate `G^ad(Q)^+`.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), §4, pp.253–254; Remark 1.5, p.242.)

This uses [7.2 Auxiliary totally real splitting extension](#72-auxiliary-totally-real-splitting-extension); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [6.7 Canonical models of abelian type](#67-canonical-models-of-abelian-type); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs), with the exact supplier contracts above.

### 7.4 Central separation by noncompact roots

Prove `TauCeti.Shimura.rank_one_central_separation` as follows. In the CM-split simple case, let `Z_α=Z(H_α)`, with `α` ranging over roots noncompact at some real place. Then `Z(G)=∩_α Z_α`. Put `Tbar=T/Z(G)` and `Zbar_α=Z_α/Z(G)`. Regard `Zbar_α(𝔸_f)/Zbar_α(Q)` as subgroups of the abelian quotient `Tbar(𝔸_f)/Tbar(Q)`; their intersection is trivial. These identities force the residual adelic central adjustment in the marked comparison to be rational.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Use irreducibility of the absolute root system and Galois action to show the relevant noncompact roots span the root lattice as required by Proposition 4.3.

Compute each subgroup centre by vanishing of its root characters.

Apply Corollary 4.4 to their adelic intersections with the rational quotient retained.

**Checks.**

- The claim is the explicit centre intersection, not a stronger rational-generation theorem.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 4.3 and Corollary 4.4, p.254.)

This uses [7.3 Root subdata of type A₁](#73-root-subdata-of-type-a₁); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory), with the exact supplier contracts above.

### 7.5 Marked conjugated Shimura datum

Construct `TauCeti.Shimura.conjugatedDatum` as follows. Let `G/ℚ` be semisimple simply connected with connected datum `X⁺`, a `G^ad(R)^+`-class of `h:S→G^ad_R` satisfying the connected Shimura conditions. Choose a maximal rational torus `T⊂G` with `h` factoring through `T^ad=T/Z(G)`; this is a §P.1 special pair for the adjoint datum. For `τ∈Aut(C)`, the Taniyama extension `1→S→𝒯→Gal(ℚ̄/ℚ)→1` supplies the Serre-protorus torsor `S_τ` and its distinguished finite-adelic point. The marked cocharacter `μ_h` is in `X_*(T^ad)`, and gives `ρ_h:S→T^ad`. Use this inner action to form `{}^{τ,h}G=S_τ×^S G`. `T` is unchanged, `{}^τh:S→({}^{τ,h}G)^ad_R` factors through `T^ad` with cocharacter `τμ_h`, and `{}^{τ,h}X⁺` is its connected adjoint real class. Retain the distinguished topological isomorphism `G(𝔸_f)≅{}^{τ,h}G(𝔸_f)`. This construction is of connected data, not a full pure datum on the simply connected group.

Throughout this result, `G` is semisimple simply connected over `ℚ`; `h:S→G^ad_R` lies in `X⁺` with the Appendix `(C1)`–`(C3)` conditions. The maximal special torus is read in the adjoint datum and pulled back to `G`. No lift `h:S→G_R` is assumed.

Use the Serre/Taniyama extension and finite-adelic section constructed in §§7.0a–7.0b from the global class formation.

Form the contracted product for `ρ_h:S→T^ad` acting by conjugation. The pulled-back maximal torus `T` is unchanged because this action on `T` is trivial.

Descend `τμ_h` in `T^ad` to `{}^τh:S→({}^{τ,h}G)^ad_R` and verify the connected Shimura conditions. Compute the finite-local trivializations and the real class `τμ_h(−1)/μ_h(−1)` in `H¹(R,T^ad)`; do not demand an `S`-map into the simply connected cover.

Expose the following named operations and laws.

- `TauCeti.Shimura.conjugatedDatum.group`: The rational group is the contracted product inner form `S_τ×^S G`.
- `TauCeti.Shimura.conjugatedDatum.specialTorus`: The unchanged `T` embeds into the twist; the marked `S`-map factors through `T^ad` in the adjoint group and has cocharacter `τμ_h`.
- `TauCeti.Shimura.conjugatedDatum.adelic`: The finite-adelic section induces the specified topological group isomorphism, compatible with embeddings of marked tori.
- `TauCeti.Shimura.conjugatedDatum.localClass`: The inner twist is finite-locally trivial and its real cohomology class is represented by `τμ_h(−1)/μ_h(−1)`.
- `TauCeti.Shimura.conjugatedDatum.map`: An inclusion of connected data preserving the marked adjoint torus/cocharacter induces the compatible inclusion of twists and their adelic trivializations. Identity and composition hold.
- `TauCeti.Shimura.conjugatedDatum.descent_ext`: Two morphisms of contracted-product twists agreeing after a common torsor-trivializing faithfully flat extension are equal; marked isomorphisms also retain the torus and distinguished adelic trivialization.

**Checks.**

- `TauCeti.Shimura.conjugatedDatum.identity`: For `τ=id` the distinguished torsor section gives the original datum and identity adelic map.
- `TauCeti.Shimura.conjugatedDatum.sl2_conjugation`: For `G=SL₂` with the norm-one `ℚ(i)` torus and the standard upper-half-plane adjoint `S`-map, `τ` equal to complex conjugation sends `μ_h` to its inverse and selects the lower-half-plane component. The group twist is split `SL₂`: the real obstruction `μ_h(−1)⁻²` is trivial and all finite local obstructions vanish. The marked adjoint homomorphism changes even though the group remains isomorphic.
- `TauCeti.Shimura.conjugatedDatum.finiteLocal`: For each finite prime `p` and `t∈T(ℚ_p)`, the distinguished local isomorphism sends the embedded `t` to the same `t` in the untwisted marked torus of `{}^{τ,h}G`. An arbitrary unmarked local isomorphism need not have this property.
- For the standard `SL₂` connected datum the Hodge cocharacter lives in `PGL₂`, and need not lift to an integral cocharacter of `SL₂`.

([J. S. Milne and K.-y. Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), Introduction, p.281 (Taniyama torsor and contracted product); [J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Remark 1.4, pp.241–242; Appendix `(C)`, pp.262–263.)

This uses [7.1 Reduction to simple simply connected data](#71-reduction-to-simple-simply-connected-data); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry), with the exact supplier contracts above.

### 7.6 Uniformization of conjugate arithmetic quotients

Prove `TauCeti.Shimura.kazhdan_uniformization` as follows. For a torsion-free arithmetic Hermitian quotient `Γ∖D` and `τ∈Aut(C)`, the universal cover of `τ(Γ∖D)` is a Hermitian symmetric domain `D′`, and its fundamental group acts as a lattice in `Aut(D′)^+`. This is a key theorem to prove, with its exceptional noncompact cases included.

Throughout this result, `Γ` is torsion-free effective arithmetic; `D` is Hermitian symmetric; `τ` is any field automorphism of `ℂ`.

For symplectic/abelian-type quotients use §7.0j: transport all defining tensors by §7.0i, compare the tensor moduli problems with their finite-adelic levels, and pass through the specified finite-level central-isogeny quotients. For compact quotients use the metric and lifted-symmetry criterion of §7.0g.

For the remaining `E₆/E₇` and mixed `D` cases construct the Bergman-form and lower-dimensional arithmetic-subvariety argument of Kazhdan, On arithmetic varieties II, pp.139–159. Use §7.0h’s proved Clozel bound and multiplicity/top-form comparison for the nonzero `L²` top-form input, and Milne’s detailed proof exposition §§2–4 for the finite-volume and Bergman nondegeneracy arguments. Milne 1983 Theorem 3.2 states the conclusion.

Prove that exceptional uniformization argument as an input to the weak comparison; the general conjugation theorem is not a premise.

**Checks.**

- This does not claim `π₁` is unchanged by `τ`.
- A Hodge-type locus with additional rational Hodge tensors uses their absolute-Hodge transport, even when the conjugate polarized abelian family already exists.
- The exceptional noncompact factors use the Bergman and subvariety argument, rather than the compact metric hypothesis.
- The compact case retains ample canonical bundle, complete lifted metric and the arithmetic symmetry criterion.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 3.2, p.246; [D. Kazhdan, On arithmetic varieties II](https://doi.org/10.1007/BF02760617), pp.139–159; [Milne, Kazhdan’s theorem on arithmetic varieties](https://www.jmilne.org/math/articles/1984T.pdf), §§2–4, pp.9–22.)

This uses [7.0i Absolute Hodge tensors on abelian varieties](#70i-absolute-hodge-tensors-on-abelian-varieties); [7.0j Conjugation of tensor moduli and abelian-type quotients](#70j-conjugation-of-tensor-moduli-and-abelian-type-quotients); [7.0g Compact-case metric input](#70g-compact-case-metric-input); [7.0h Clozel multiplicity and holomorphic top-form growth](#70h-clozel-multiplicity-and-holomorphic-top-form-growth); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [3.3 Unique algebraization at neat level](#33-unique-algebraization-at-neat-level); [5.2 Algebraization of polarized weight-one variations](#52-algebraization-of-polarized-weight-one-variations); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action), with the exact supplier contracts above.

### 7.7 Weak connected conjugation comparison

Prove `TauCeti.Shimura.weak_conjugation` as follows. For a semisimple simply connected connected datum and `τ∈Aut(C)`, there exist another connected datum `(G₁,X₁⁺)`, an algebraic tower isomorphism `τM⁰(G,X⁺)≅M⁰(G₁,X₁⁺)`, and a compatible finite-adelic group isomorphism. This assertion does not yet identify `G₁` with the special-torus twist.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Lift the conjugated Hecke correspondences to the universal Hermitian cover to construct `Γ₀` and its compatible finite-adelic map, as in 3.3–3.5.

Use §7.0d’s irreducible `S`-arithmetic reconstruction at sufficiently large nonempty `S`, with total local rank at least two, to recover `G₁` and its compatible local maps (3.6–3.7).

Handle the nonexceptional central obstruction using Lemma 3.8 in its corrected form, which concerns `H¹(k,Z(G))` (§7.0e). In the exceptional `Aₙ` cases §3.10 uses rank-one subgroups after a totally real extension making their semisimple forms isotropic at all finite places. Platonov–Rapinchuk 1979 Theorem 1 proves perfection of `SL₁(D)`, not simplicity; it cannot be applied as a no-noncentral-normal-subgroup theorem to the full reductive `Hα` containing `T`. The exact passage from the semisimple perfection result to the central adjustment on the marked torus must be proved separately. Finite étale comparison rigidity in §§2.1–2.2 then gives the tower isomorphism once this adjustment is justified.

**Checks.**

- The finite adelic map does not identify the real forms.
- Lemma 3.8, as corrected in the author's annotated copy, concerns `H¹(k,Z)`, not `H¹(k,G)`.
- Do not infer simplicity or perfection of a full reductive rank-one group with a positive-dimensional centre from perfection of its simply connected semisimple factor.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 3.1 and §§3.3–3.10, pp.245–252; [V. P. Platonov and A. S. Rapinchuk, On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), Theorem 1, p.279; final discussion, p.282 (Russian published original); [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), layer-4-approximation-neat-levels-and-hecke-maps.)

This uses [7.6 Uniformization of conjugate arithmetic quotients](#76-uniformization-of-conjugate-arithmetic-quotients); [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry); [AdelicAlgebraicGroups, §4.2, strong approximation for semisimple groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action); [7.3 Root subdata of type A₁](#73-root-subdata-of-type-a₁), with the exact supplier contracts above.

### 7.8 Conjugation comparison with a marked special point

Prove `TauCeti.Shimura.marked_conjugation` as follows. For the simple simply connected case, `τM⁰(G,X⁺)≅M⁰({}^{τ,h}G,{}^{τ,h}X⁺)` by an algebraic isomorphism sending `τ[h]` to `[{}^τh]` and equivariant for the distinguished finite-adelic map. The isomorphism is unique with these two conditions and is compatible with the embedded `A₁` subvarieties.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Compare the weak target’s embedded special torus and its tangent characters; the tangent weights recover the transformed cocharacter (5.1–5.2).

At the CM-split auxiliary extension compare both maps on every rank-one subvariety using the established `A₁`/CM comparison.

The centre intersection forces the residual adelic adjustment to be rational. Normalize the marked point and use density of its rational/adelic orbit for uniqueness.

**Checks.**

- No chosen isomorphism or Langlands axiom is an input.
- The construction is valid for exceptional Hermitian types.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 1.1 and uniqueness Remark 1.3, p.241; §§4–5, pp.253–256.)

This uses [7.7 Weak connected conjugation comparison](#77-weak-connected-conjugation-comparison); [7.5 Marked conjugated Shimura datum](#75-marked-conjugated-shimura-datum); [7.3 Root subdata of type A₁](#73-root-subdata-of-type-a₁); [7.4 Central separation by noncompact roots](#74-central-separation-by-noncompact-roots); [4.8 Density of Hecke translates](#48-density-of-hecke-translates); [6.7 Canonical models of abelian type](#67-canonical-models-of-abelian-type), with the exact supplier contracts above.

### 7.9 Equivariance for completed symmetry

Prove `TauCeti.Shimura.completed_conjugation_equivariance` as follows. The marked conjugation comparison is compatible with the completed adjoint rational symmetry of ConnectedTower, not merely `G(𝔸_f)`. Obtain this using compatible maps after finite totally real base extensions and density in the relevant congruence completion; all completion maps and marked-torus trivializations must agree.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Use the finite-base-extension functoriality of the completed groups as in Proposition 6.1 and MS §8.

Prove the precise density and compatibility needed to extend equivariance continuously. The author's annotated copy of Milne 1983 withdraws an additional rank-one generation claim; it is not used.

Compare finite levels to obtain the completed action identity. The precise density statement is a required proof input of this target.

**Checks.**

- Equivariance for `G(𝔸_f)` alone does not establish the connected canonical formulation.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Proposition 6.1, p.257; MS §8, pp.340–341.)

This uses [7.8 Conjugation comparison with a marked special point](#78-conjugation-comparison-with-a-marked-special-point); [6.3 Connected Shimura tower with completed symmetry](#63-connected-shimura-tower-with-completed-symmetry); [7.2 Auxiliary totally real splitting extension](#72-auxiliary-totally-real-splitting-extension); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory), with the exact supplier contracts above.

### 7.10 Independence of the marked special point

Prove `TauCeti.Shimura.special_independence` as follows. For maximal special `h,h′` in `X⁺`, the two marked comparisons are related by the canonical transition between their twisted connected data of Milne 6.3. The transition is transitive for triples and compatible with connected subdata and auxiliary totally real extension. Thus the full construction is independent of the marked point and auxiliary splitting field.

Use the standing connected adjoint `S`-map convention, with a maximal special torus in the adjoint datum pulled back to the semisimple group. No lift of the `S`-map to the simply connected cover is assumed.

Use the Hasse-principle comparison of adjoint inner forms and explicit special-torus transition to define the comparison diagram (6.3–6.5).

After simultaneous CM splitting of the two tori, measure their real discrepancy by the sum of Weyl lengths. At length zero kill the positive torus norm obstruction by a further totally real extension.

For a compact reflection shorten via the real normalizer; for a noncompact reflection use its `A₁` subgroup and weak approximation to localize the change at one real place. Induct on the length and compare common refinements.

**Checks.**

- Point-independence is proved by Weyl-length induction, not asserted from density of one chosen orbit.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorem 6.3 and proof, pp.258–262.)

This uses [7.8 Conjugation comparison with a marked special point](#78-conjugation-comparison-with-a-marked-special-point); [7.9 Equivariance for completed symmetry](#79-equivariance-for-completed-symmetry); [7.3 Root subdata of type A₁](#73-root-subdata-of-type-a₁); [7.5 Marked conjugated Shimura datum](#75-marked-conjugated-shimura-datum); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory), with the exact supplier contracts above.

### 7.11 Reflex-field descent cocycle

Prove `TauCeti.Shimura.conjugation_cocycle` as follows. For `σ` fixing `E(G,X)`, identify the conjugated datum with the original through the transformed cocharacter class and special-point-independent transition. The comparison defines an equivariant algebraic descent system `f_σ:σSh_C→Sh_C` with `f_{στ}=f_σ∘σ(f_τ)`, compatible with levels, right translations and the actual special-pair reciprocity formula.

Reassemble connected comparisons through the central/torus component extension.

Normalize reflex-field-fixing twists using the cocharacter class and prove the same special-point action as Layer 4.

Apply uniqueness of marked comparisons and transitive transitions to identify the two composites. This produces the cocycle law; continuity is a distinct next theorem.

**Checks.**

- A set-theoretic cocycle without continuity is insufficient for effective descent.

([J. S. Milne, The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Theorems 7.1–7.2, p.262; Descent §2.)

This uses [7.1 Reduction to simple simply connected data](#71-reduction-to-simple-simply-connected-data); [7.10 Independence of the marked special point](#710-independence-of-the-marked-special-point); [7.9 Equivariance for completed symmetry](#79-equivariance-for-completed-symmetry); [6.4 Connected and full canonical formulations](#64-connected-and-full-canonical-formulations); [4.4 Canonical-model condition](#44-canonical-model-condition); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus), with the exact supplier contracts above.

### 7.12 Finite rigidifying special points

Prove `TauCeti.Shimura.finite_rigidifying_points` as follows. At a neat effective level, the automorphism group of a positive-dimensional arithmetic Hermitian quotient is finite. A Zariski-dense Hecke orbit of an actual special point contains a finite subset `Σ` whose pointwise stabilizer is trivial. In dimension zero the finite point set itself is a rigidifying set. The constructed descent system fixes `Σ` over a finite extension of the reflex field because each special point has an open reciprocity stabilizer.

Use Milne 1999 Lemma 2.2: the normalizer of the arithmetic group is discrete and finite covolume gives finite index, or apply the `log`-general-type argument. Section 7.0c constructs the normalizer theorem.

For each nonidentity automorphism choose a special orbit point it moves; their finite union rigidifies.

Reciprocity at finite level gives an open Galois stabilizer for each point; take a finite extension fixing all of them. For zero-dimensional levels use the explicit finite étale Galois set.

For a zero-dimensional finite étale level use all geometric points to rigidify its finite permutation group; do not impose positive dimension in the final canonical-model theorem.

**Checks.**

- A finite subset of an arbitrary orbit need not rigidify; density and finite automorphisms are used.

([J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Lemma 2.2 and Theorem 2.3, pp.4–5.)

This uses [7.11 Reflex-field descent cocycle](#711-reflex-field-descent-cocycle); [4.8 Density of Hecke translates](#48-density-of-hecke-translates); [4.3 Finite-level reciprocity and idele independence](#43-finite-level-reciprocity-and-idele-independence); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action), with the exact supplier contracts above.

### 7.13 Continuity of the canonical descent system

Prove `TauCeti.Shimura.continuous_descent` as follows. The canonical descent system at each neat level is continuous: it splits over a finitely generated field extension of `E` inside `ℂ` in the sense of Milne 1999 Theorem 1.1. A finite rigidifying subset fixed over a finite field forces this property by Corollary 1.2. `Level` comparisons then give the required compatible system at all levels.

Spread the variety and the finite rigidifying subset to a finitely generated field `L`.

For automorphisms fixing `L` the canonical comparisons and the split comparisons agree on `Σ` and hence agree globally.

Use the continuity criterion of Milne 1999 Theorem 1.1 and Corollary 1.2; Remark 1.3(c) there records that the earlier Lemma 3.23 of Milne 1994 omits the continuity condition.

**Checks.**

- The infinite-transcendence hypothesis `Ω=C` over a number field satisfies the descent theorem.
- Open stabilizers of individual points alone are not a replacement for the finite rigidification argument.

([J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 1.1, Corollary 1.2, Remark 1.3(c), pp.1–2.)

This uses [7.12 Finite rigidifying special points](#712-finite-rigidifying-special-points); [7.11 Reflex-field descent cocycle](#711-reflex-field-descent-cocycle); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 7.14 Canonical models for every pure datum

Prove `TauCeti.Shimura.general_canonical` as follows. Every pure Shimura datum admits a canonical tower over its reflex field, satisfying Layer 4 at every level and independent of the auxiliary extension and marked special point. Apply effective quasi-projective descent to the continuous cocycle constructed above, descend finite quotients and level actions, and verify special reciprocity by comparison over `ℂ`.

At neat level combine quasi-projectivity from Layers 2–3 with Milne 1999 Theorem 1.1 to obtain an `E`-scheme and complex comparison.

Descend all compatible finite-level maps using the constructed equivariant system; extend to non-neat levels by finite quotients.

The established canonical descent action verifies the exact Layer 4 field of definition and geometric-Artin formula. Compare auxiliary choices through §7.10 and the specified analytic identity.

([J. S. Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Theorem 2.3 and Remark 2.4, pp.4–5; 1983 Theorem 7.2.)

This uses [7.13 Continuity of the canonical descent system](#713-continuity-of-the-canonical-descent-system); [7.11 Reflex-field descent cocycle](#711-reflex-field-descent-cocycle); [7.10 Independence of the marked special point](#710-independence-of-the-marked-special-point); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [4.4 Canonical-model condition](#44-canonical-model-condition); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### Examples

For `τ=id` the marked twist, adelic map and cocycle comparisons are identities. For complex conjugation in the `SL₂` example the group is split but the adjoint marking selects the lower half-plane. A reductive rank-one group with a positive-dimensional centre has a proper noncentral normal derived subgroup; semisimple perfection cannot imply its simplicity. A cocycle that is merely set-theoretic fails the continuity requirement. Dimension-zero levels rigidify with their entire finite point set.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, §4.2, strong approximation for semisimple groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [ArithmeticLocallySymmetricSpaces, §§ALS.0.5–ALS.0.9](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md#als05-the-symmetric-space-is-contractible-with-proper-action); [ReductiveGroupsPartII, Layer RG2.0a](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md#layer-rg20a-weil-restriction-and-the-deligne-torus); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [ReductiveGroups, layer 7 structure theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroups/README.md#layer-7-structure-theory).

Earlier constructions used here are 2.7 Baily–Borel algebraization; 3.3 Unique algebraization at neat level; 3.4 Algebraic maps of Shimura data; 3.5 Algebraic finite quotients and normalization; 4.2 Reflex norm of a special torus; 4.3 Finite-level reciprocity and idele independence; 4.4 Canonical-model condition; 4.8 Density of Hecke translates; 5.2 Algebraization of polarized weight-one variations; 6.3 Connected Shimura tower with completed symmetry; 6.4 Connected and full canonical formulations; 6.5 Products of connected canonical models; 6.6 Central-isogeny descent of connected models; 6.7 Canonical models of abelian type.

## Layer 8: Arithmetic towers and minimal compactifications

### 8.1 Canonical algebraic level tower

Construct `CanonicalTower.ofLevelMaps` as follows. For actual canonical models `M_K`, assemble the unique descended forgetful maps `π_{K,L}` for `K` contained in `L` into the functor `CanonicalTower.ofLevelMaps : Level(D) ⥤ Over(Spec E)`, built with Mathlib's `CategoryTheory.Functor.mk` from the descended transitions, using [1.7 Compact-open level category](#17-compact-open-level-category). Its values are the actual supplied canonical models. Identity and composition follow from their complex counterparts and uniqueness of descent; base change uses the native slice-category pullback.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. Prove the identity and composition laws for the descended transitions by uniqueness before applying the functor constructor.

Apply §4.11 at `g=1` to every inclusion.

The identity and composition equations hold over `ℂ` by Layer 1 and descend by uniqueness. Package these maps with the existing Functor constructor; retain the actual structure morphism in `Over(Spec E)`.

After any extension `E → F`, use `Over`.pullback to base change the entire functor; identity and successive base changes use the native natural isomorphisms.

Expose the following named operations and laws.

- `CanonicalTower.ofLevelMaps_obj`: At level `K` the functor has value `M_K`, with its given map to the base.
- `CanonicalTower.ofLevelMaps_map`: On an inclusion `K → L` the functor evaluates to the unique descended forgetful transition `π_{K,L}`.
- `CanonicalTower.ofLevelMaps_id`: The map of the identity arrow at `i` is the identity of `M(i)`.
- `CanonicalTower.ofLevelMaps_comp`: The map of `f` followed by `g` is `t(f)` followed by `t(g)`.
- `CanonicalTower.ofLevelMaps_baseChange`: Postcomposing with `Over.pullback(b)` sends a transition `f` to the pullback of `t(f)`, on the pulled-back models. This uses native base change rather than a second scheme carrier.

**Checks.**

- `CanonicalTower.test_identity_level`: At any level `K, t(id_K)` is the identity of `M_K`.
- `CanonicalTower.test_nested_levels`: For `K₁` contained in `K2` contained in `K3`, the functor map of the composite inclusion equals `π_{K₁,K2}` followed by `π_{K2,K3}`.
- `CanonicalTower.test_preserves_supplied_arrow`: For a level inclusion `K → L` and an `E`-morphism `u` distinct from the descended forgetful transition `π_{K,L}`, the functor map of the inclusion is not `u`.
- `CanonicalTower.test_base_change`: The base-changed functor map on `f` is exactly `Over.pullback(b).map(t(f))`.
- `CanonicalTower.test_gl2_jline_degree`: For `GL₂` and `N ≥ 3` the tower map from level `K(N)` to `GL₂(ℤ̂)` is identified with the `j`-map `Y_full(N)_Q → 𝔸¹_Q` (§8.10, ModularCurves `9E`); its degree is `|GL₂(ℤ/N)|/2` because -1 acts trivially, so 24 at `N = 3`, and `|GL₂(𝔽_3)| = 48`.
- `CanonicalTower.test_not_constant`: The tower is not constant: for `GL₂, M_{K(N)}` has `φ(N)` geometric connected components (§8.7) while `M_{GL₂(ℤ̂)}` is geometrically connected, so for `N ≥ 3` the transition is not an isomorphism; `φ(3) = 2`.
- All levels retain their given structure morphisms to `Spec E`.
- A composite of three inclusions gives the same map for either parenthesization.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29(a), p.65; 12.10, p.115; 13.7(b), p.119.)

This uses [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [1.7 Compact-open level category](#17-compact-open-level-category); `CategoryTheory.Functor`; `CategoryTheory.Functor.mk`; `CategoryTheory.Over`; `CategoryTheory.Over.pullback`; `CategoryTheory.Over.pullbackId`; `CategoryTheory.Over.pullbackComp`; `AlgebraicGeometry.Scheme`, with the exact supplier contracts above.

### 8.2 Right translation laws on the algebraic tower

Prove `CanonicalTower.translation_comp` as follows. The descended `T_g` obey `T_1=id` at equal levels and `T_h` composed after `T_g` equals `T_{gh}`, whenever `g⁻¹Kg` is contained in `L` and `h⁻¹Lh` is contained in `P`. For `k` in `K` the equal-level `T_k` is the identity. For a fixed `g` the conjugate-level isomorphisms form a natural transformation from the tower to the conjugated-index tower.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane.

Layer 1 proves these identities on the double quotient.

Compare the descended `E`-morphisms after faithful `ℂ`-base change; use uniqueness. The product is `gh` in this right-action convention.

**Checks.**

- For `g,h` represented by noncommuting `GL₂` matrices, check `gh` rather than hg.
- No action of all `G(𝔸_f)` on one finite-level scheme is asserted.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29(b)–`(c)`, p.65; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Discussion before Definition 5.14, p.58.)

This uses [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [8.1 Canonical algebraic level tower](#81-canonical-algebraic-level-tower); [1.4 Holomorphic right translations](#14-holomorphic-right-translations); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 8.3 Finite level maps and effective deck groups

Prove `CanonicalTower.level_map_finite` as follows. For `K₁` contained in `K2, π_{K₁,K2}` is finite and surjective over `E`; when `K2` (hence `K₁`) is neat it is finite étale. If `K₁` is normal in `K2, M_{K2}` is the quotient of `M_{K₁}` by the effective image of `K2/K₁` in automorphisms of `M_{K₁}`; its kernel consists of elements acting trivially on the actual quotient (for `GL₂` and `K(N)` normal in `GL₂(ℤ̂)`, the element -1 acts trivially, so the effective group is `GL₂(ℤ/N)/{±1}`). Write `H` for this effective quotient. It acts over `M_{K2}`, and its orbit quotient is `M_{K2}`; `H` need not be the full automorphism group over the base for a disconnected cover. Full deck-group equality requires a connected regular cover. For a chosen lift `y` of a geometric base point `x`, the set of geometric points of the fibre has cardinality `|H|/|H_y|`. Scheme-theoretic fibre length and finite-map degree retain ramification multiplicities and are computed separately; when the effective quotient action is free, the quotient is an `H`-torsor of degree `|H|`.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane.

Layer 1 supplies finite analytic coverings and the effective stabilizer calculation. Layer 3 supplies finite algebraic maps and finite quotients at non-neat levels.

Finiteness, surjectivity and, for neat `K2`, étaleness descend along `C/E`. Apply the finite quotient universal property to the descended effective action.

**Checks.**

- For torus data the dimension is zero; level morphisms are finite étale.
- For the strict `G_m` datum with trivial `h` and `μ=0`, the `K(21)→K(3)` map is six split `ℚ`-points over `Spec ℚ`. Its effective level action is `C₆`, while its full `ℚ`-automorphism group over the base is `S₆`.
- Non-neat levels retain elliptic stabilizer ramification, so étaleness is not exported there.
- `Y_full(3) → Y(1)` (the `j`-line) has degree `|GL₂(𝔽_3)|/2 = 24`. Above `j=0` its geometric fibre has eight points, each of ramification index three, and scheme-theoretic length 24. It also ramifies over `j=1728`: the target level `GL₂(ℤ̂)` is not neat.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29(c), p.65.)

This uses [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [8.2 Right translation laws on the algebraic tower](#82-right-translation-laws-on-the-algebraic-tower); [1.3 Holomorphic finite level maps](#13-holomorphic-finite-level-maps); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); `AlgebraicGeometry.IsFinite`, with the exact supplier contracts above.

### 8.4 Algebraic Hecke correspondence

Construct `CanonicalHecke.span` as follows. For `D`, actual canonical models and `g` in `G(𝔸_f)`, put `J=K` intersect `gKg⁻¹`. Construct CanonicalHecke.span as the native WalkingSpan diagram in `Over(Spec E)`, with apex `M_J`, first leg `π_{J,K}`, and second leg `T_g:M_J → M_{g⁻¹Jg}` followed by `π_{g⁻¹Jg,K}`. Both legs are finite.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. `g` is a finite-adelic element and `K` is compact open.

Section P.4 and Layer 1 supply `J`, conjugate levels and both inclusion witnesses.

Apply §§4.11 and 8.3 to obtain the two `E`-morphisms.

Use CategoryTheory.Limits.span, preserving the order of the two legs. The complex comparison is the Layer 1 correspondence; applying native `spanCompIso` to `Over`.pullback supplies its base-change isomorphism.

For successive spans `L←A→M` and `M←A′→R`, construct `CanonicalHecke.compose` using the native pullback `P=A×_M A′` in `Over(Spec E)`, with ordered legs `P→A→L` and `P→A′→R`. Analytification after extension to `ℂ` identifies this actual scheme fibre product with the analytic composite of §1.5. If the common target's effective arithmetic groups act freely on their domains, in particular at neat common target level, §1.5 gives its literal geometric double-coset decomposition. At arbitrary coarse levels, instead normalize `P_red` in its component function fields using AlgebraicModuliForArithmeticGeometry §5.4; prove that this finite normal `E`-scheme has the geometric components and comparison maps of §1.5. Establish the comparison after extension to `ℂ` by finiteness, normality and generic isomorphism. Characteristic zero ensures that reduction and normalization commute with field extension here. Individual geometric summands may be permuted by Galois and need not descend separately to `E`. Neither this normalization nor its component list replaces `P` as the composite apex. Both constructions and their specified comparison maps commute with field extension.

Expose the following named operations and laws.

- `CanonicalHecke.span_apex`: The value at WalkingSpan.zero is the supplied apex `M_J`.
- `CanonicalHecke.span_first`: The image of WalkingSpan.`Hom`.fst is exactly `π_{J,K}`.
- `CanonicalHecke.span_second`: The image of WalkingSpan.`Hom`.snd is exactly `T_g` followed by `π_{g⁻¹Jg,K}`.
- `CanonicalHecke.span_baseChange`: Postcomposing the span with `Over.pullback(b)` is naturally isomorphic to native span on the two pulled-back legs, by `spanCompIso`.
- `CanonicalHecke.compose_apex`: The value at WalkingSpan.zero is the actual native pullback of the first span's second leg and the second span's first leg.
- `CanonicalHecke.compose_legs`: The two WalkingSpan arrows are respectively the first pullback projection followed by the first span's first leg, and the second projection followed by the second span's second leg.

**Checks.**

- `CanonicalHecke.test_identity`: For equal apex and endpoints and both supplied legs the identity (the `g=1` case), both WalkingSpan arrows evaluate to the identity.
- `CanonicalHecke.test_ordered_nat_legs`: In Type take apex and endpoints `ℕ`, first leg `n↦2n` and second leg `n↦n+1`. Using `TypeCat.ofHom` for the two functions, at `n=3` the native span evaluates the ordered legs to 6 and 4 respectively. These ordered evaluations distinguish the legs.
- `CanonicalHecke.test_distinct_legs`: For two endomorphisms `p1,p2` of a supplied apex with `p1` distinct from `p2`, the first-leg evaluation is not `p2`. A construction that swaps the two legs fails this test.
- `CanonicalHecke.test_base_change`: After `Over.pullback(b)`, evaluation at the first WalkingSpan arrow is `Over.pullback(b).map(p1)`.
- `CanonicalHecke.test_gl2_Tp_index`: For `GL₂, K = GL₂(ℤ̂)` and `g` equal to `diag(p,1)` at a prime `p` and the identity elsewhere, `J = K ∩ gKg⁻¹` is the preimage of the lower-triangular subgroup `mod p`, which stabilizes the line spanned by `e₂`; its index in `K` is `p+1 = |P¹(𝔽_p)|`, and both legs of the Hecke span have degree `p+1` over the coarse `j`-line, the classical `T_p`.
- `CanonicalHecke.test_gl2_T2_node`: The transpose-`T₂/T₂` composite over `ℂ` is the nodal fibre product of §1.5, whose off-diagonal component has two normalization points above `(0,0)`. Field extension of the actual canonical composite retains this node.
- Under an effective-free common target, `P` is normal and the normalization comparison is an isomorphism. At coarse level the same conclusion is excluded by the preceding `T₂` check.
- `J` is `K` intersect `gKg⁻¹`, not `K` intersect `g⁻¹Kg`.
- For `g=1, J=K` and both legs are the identity.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29, p.65; 13.6, p.118; [Stacks, Tag 035Q](https://stacks.math.columbia.edu/tag/035Q), normalization universal property, and [Tag 0AB1](https://stacks.math.columbia.edu/tag/0AB1), finite birational comparison with a normal target; §1.5 supplies the ramification qualification.)

This uses [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [8.3 Finite level maps and effective deck groups](#83-finite-level-maps-and-effective-deck-groups); [1.5 Holomorphic Hecke correspondences](#15-holomorphic-hecke-correspondences); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification); `CategoryTheory.Limits.span`; `CategoryTheory.Limits.spanCompIso`; `CategoryTheory.Limits.pullback`; `CategoryTheory.Over.pullback`, with the exact supplier contracts above.

### 8.5 Functoriality of canonical models in the datum

Prove `CanonicalModel.datum_map_defined_over_compositum` as follows. For a datum morphism `f:D → Dprime`, compact open `K,Kprime` with `f(K)` contained in `Kprime`, and actual canonical models on both sides, the complex map `[x,a] → [f(x),f(a)]` descends uniquely to a morphism over `E(D)`. Milne states the field as the compositum `E(D)E(Dprime)`; it equals `E(D)`, because `E(Dprime)` is contained in `E(D)` (the argument of Milne 12.3(c) applies to every datum morphism: `f` carries the cocharacter class of `X` into that of `Xprime` Galois-equivariantly). It commutes with admissible level maps and right translations, identity datum maps and compositions after the necessary base changes of the target models to `E(D)`.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. Both data and their reflex fields are specified; the target also has actual canonical models.

Layer 3 gives the complex algebraic map; §P.1 sends special pairs to special pairs.

Functoriality of Layer 4 reflex norms makes the map Galois equivariant on the dense Hecke orbit of each source special pair (special points map to special points by §P.1). Apply the disjoint-field argument of §4.11 over `E(D)`, which contains `E(Dprime)`.

Descend the morphism along `C/E(D)` by §4.9b field descent; identities, compositions and Hecke compatibility follow from their complex formulas and faithful base change.

**Checks.**

- The identity datum map gives the identity scheme morphism.
- For the strict determinant datum morphism `GL₂ → Gm` at principal level `N ≥ 3`, the `ℚ`-map agrees with the Layer 4 one-point torus model, whose geometric set is `(ℤ/N)^×/{±1}`. Under §8.11 it is the Weil-pairing map followed by the quotient `ζ → {ζ,ζ^(-1)}` to the maximal-real cyclotomic model. The full component map to `μ_N^prim` uses §8.7 and `Y={±1}`.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 13.8, p.119; [Pierre Deligne, Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), 5.4, pp.155–156; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 12.3(c), p.112.)

This uses [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [4.10 Disjoint special reflex fields](#410-disjoint-special-reflex-fields); [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [3.4 Algebraic maps of Shimura data](#34-algebraic-maps-of-shimura-data); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [4.4 Canonical-model condition](#44-canonical-model-condition); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [4.8 Density of Hecke translates](#48-density-of-hecke-translates); [4.9 Reflex norm under a torus morphism](#49-reflex-norm-under-a-torus-morphism); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 8.6 Zero-dimensional Shimura varieties and their canonical models

Construct `ZeroDimShimura.shimuraSet` as follows. Let `T` be a `ℚ`-torus, `Y` a nonempty finite set on which `T(ℝ)` acts transitively through `T(ℝ)/T(ℝ)^+` (`T(ℚ)` acting through `T(ℚ) ⊂ T(ℝ)`), and `μ` a cocharacter of `T_C` with field of definition `E ⊂ C`. For compact open `K ⊂ T(𝔸_f)` put `Sh_K(T,Y) = T(ℚ) ∖ (Y × T(𝔸_f))/K`, the finite set of classes `[y,a]_K` with `[y,a]_K = [q·y, q a k]_K` for `q` in `T(ℚ), k` in `K`; the sets form an inverse system with right translations by `T(𝔸_f)`. For `σ` in `Gal(ℚ̄/E)` choose `s` in the ideles of `E` with `art_E(s) = σ` on `E^ab`, let `r(s) = (r(s)_inf, r(s)_f)` be its image under the multiplicative reflex norm `r(T,μ)` of Layer 4, and put `σ[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K` (Milne, formula `(64)`). This is a continuous action independent of `s`, compatible with transitions and translations; the canonical model `M_K(T,Y,μ)` is the finite étale `E`-scheme attached to this Galois set. When `Y` is one point and `μ = μ_h` it is the Layer 4 torus model of the strict torus datum `(T,{h})`; in general it is not: for `T=G_m, E=Q, Y={±1}, μ(t)=t` and `K = ker(ℤ̂^× → (ℤ/N)^×), N > 0`, it is `μ_N^prim`. With the same `μ` and `Y` replaced by a singleton, the strict datum gives `Spec` of the real subfield of `ℚ(ζ_N)`. For `μ(t)=t^n, n` an integer, retain the action through `χ_cyc^n` on `(ℤ/N)^×`; `μ=0` gives the split finite `ℚ`-scheme. The singleton comparison always uses the same `μ`.

Throughout this result, `T` is a `ℚ`-torus; `Y` is a nonempty finite set with a transitive `T(ℝ)`-action factoring through `T(ℝ)/T(ℝ)^+` (Milne, zero-dimensional Shimura varieties, pp.62–63). `μ` is a cocharacter of `T_C` defined over the number field `E ⊂ C`; `r(T,μ)` is the multiplicative reflex norm of Layer 4 (Milne `(60)` with the product convention) and `art_E` is the Artin map in the Layer 4 normalization. `K` ranges over compact open subgroups of `T(𝔸_f)`.

Finiteness: `T(ℚ)∖T(𝔸_f)/K` is finite (Milne 5.22) and `Y` is finite.

Independence of `s`: two choices differ by an element of the kernel of `art_E`, the `closure` of `E^×` times the identity component at infinity; `r(E^×)` lies in `T(ℚ)`, which acts trivially on the double quotient, `r` of the identity component lies in `T(ℝ)^+`, which acts trivially on `Y`, and `K` is open, so the `closure` does not matter. The action factors through `Gal(E^ab/E)` and through a finite quotient.

Transitions `[y,a]_K → [y,a]_K′` for `K ⊂ K′` and translations `[y,a] → [y,ag]` commute with the action because `T` is commutative; apply the ModularCurves `0D` equivalence between finite étale `E`-schemes and finite continuous Galois sets to obtain the models and their `E`-morphisms.

For `Y` a point, `(64)` reduces to `(62)` for the special pair `(T,h)`, because `T(ℝ)` fixes `h`; this is the Layer 4 torus model.

Expose the following named operations and laws.

- `ZeroDimShimura.shimuraSet`: `Sh_K(T,Y) = T(ℚ) ∖ (Y × T(𝔸_f))/K`, the quotient of `Y × T(𝔸_f)` by `(y,a)` ~ (`q·y, q` a `k`), `q` in `T(ℚ), k` in `K`.
- `ZeroDimShimura.mk`: The class `[y,a]_K` of `y` in `Y` and a in `T(𝔸_f)`.
- `ZeroDimShimura.mk_eq_mk`: `[y,a]_K = [y′,a′]_K` if and only if `y′ = q·y` and `a′ = q` a `k` for some `q` in `T(ℚ)` and `k` in `K`.
- `ZeroDimShimura.map`: For `K ⊂ K′` the transition `[y,a]_K → [y,a]_K′`, with `map_id` and `map_comp`.
- `ZeroDimShimura.singletonEquiv`: For `Y` a point, `Sh_K(T,Y)` is `T(𝔸_f)/(T(ℚ)K)`, the finite Shimura set of the Layer 4 torus datum.
- `ZeroDimShimura.galoisAct`: Formula `(64): σ[y,a]_K = [r(s)_inf·y, r(s)_f·a]_K`; independent of `s`, continuous, compatible with map and translations.
- `ZeroDimShimura.canonicalModel`: The finite étale `E`-scheme attached to the Galois set `(Sh_K(T,Y), galoisAct)` by ModularCurves `0D`; its `ℚ̄`-points are `Sh_K(T,Y)` with this action.

**Checks.**

- `ZeroDimShimura.test_gl2_components`: For `T = G_m, Y = ℝˣ/ℝ_{>0} ≅ {±1}` and `K = ker(ℤ̂^× → (ℤ/N)^×), N > 0, Sh_K(T,Y) ≅ (ℤ/Nℤ)^×`, which has `φ(N)` elements (Milne p.63).
- `ZeroDimShimura.test_strict_datum_halves`: With `Y` replaced by one point (the strict datum `(G_m,{det∘h})` of Section P.4) the same level gives `ℚˣ∖𝔸_f^×/K ≅ (ℤ/Nℤ)^×/{±1}`, with `φ(N)/2` elements for `N ≥ 3`; at `N = 3` it is a single point, whereas `μ_3^prim` has two geometric points.
- `ZeroDimShimura.test_singleton`: For `Y` a point, `Sh_K(T,Y)` is `T(𝔸_f)/(T(ℚ)K)`, the set underlying the Layer 4 torus model.
- `ZeroDimShimura.test_maximal_level`: For `T = G_m, Y = {±1}` and `K = ℤ̂^×, Sh_K(T,Y)` is one point `(ℚ_{>0}·ℤ̂^× = 𝔸_f^×)`, with model `Spec ℚ`.
- For `(G_m,{±1})` with `μ(z)=z` and `K = ker(ℤ̂^× → (ℤ/N)^×), N > 0`, the set has `φ(N)` points and Galois acts through the cyclotomic character (Milne p.125): the model is `Spec ℚ[z]/Φ_N(z)`.
- For `μ(t)=t` and `N=3`, complex conjugation interchanges the two points. For `μ=0` at the same level, both points are rational: `Spec ℚ` disjoint union `Spec ℚ`, rather than `Spec ℚ(ζ_3)`. A one-point `Y` has one point in both cases.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, Zero-dimensional Shimura varieties and the `GL₂` example, pp.62–63; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, formula `(64)`, p.119.)

This uses [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [4.3 Finite-level reciprocity and idele independence](#43-finite-level-reciprocity-and-idele-independence); [4.5 Finite étale torus canonical models](#45-finite-étale-torus-canonical-models); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [ModularCurves, 0d finite étale schemes and galois actions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#0d-finite-étale-schemes-and-galois-actions), with the exact supplier contracts above.

### 8.7 Galois action on connected components

Prove `CanonicalModel.component_map_defined_over_reflex` as follows. Let `D=(G,X)` be a pure Shimura datum with `G^der` simply connected, `ν: G → T = G/G^der, T(ℝ)^†` the image of `Z(ℝ)` and `Y = T(ℝ)/T(ℝ)^†` (Milne `(34)`), and `μ = ν∘μ_x`, which is independent of `x` in `X` and defined over `E = E(D)`. For actual canonical models `M_K` over `E`, the complex map `Sh_K(G,X) → Sh_{ν(K)}(T,Y), [x,a]_K → [y(x), ν(a)]`, with `y: π_0(X) → Y` induced by `ν`, descends uniquely to an `E`-morphism `M_K → M_{ν(K)}(T,Y,μ)` into the canonical model of §8.6. For `K` as in Milne 5.17 (in particular every `K(N)` for `GL₂`) its geometric fibres are the connected components, so it identifies `π_0(M_K ⊗_E C)` with `Sh_{ν(K)}(T,Y)` compatibly with the Galois action `(64)`. It commutes with level maps and with right translation by `g` in `G(𝔸_f)`, acting on the target by `ν(g)`.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. `G^der` is simply connected; for the `π_0` bijection `K` is as in Milne 5.17 (sufficiently small, or `K(N)` for `GL₂`).

`Over C` the map is well defined and, for `K` as in Milne 5.17, induces a bijection on connected components (Layer 0's component decomposition).

For a special pair `(T0,x0)` and `σ` fixing `E(x0), (62)` gives `σ[x0,a] = [x0, r_{x0}(s′)a]`. Functoriality of reflex norms (Layer 4) gives `ν∘r(T0,μ_{x0}) = r(T,μ)∘Nm_{E(x0)/E}`, compatible with the Artin maps; `T0(ℝ)` fixes `x0` (Milne 12.6), so the archimedean component of `r(T,μ)(Nm s′)` fixes `y(x0)`. Hence the map commutes with `σ` on the Hecke orbit of `x0`, which is dense (Milne 13.5): it is fixed by `Aut(C/E(x0))` (Milne footnote 73).

Take `x1` with `E(x1)` linearly disjoint from the normal `closure` of `E(x0)` over `E` (§4.10); as in §4.11, the map is defined over `E(x0) ∩ E(x1) = E`, uniquely by faithful base change (§4.9b field descent). Compatibility with level maps and translations holds over `ℂ` and descends.

**Checks.**

- For `GL₂` at `K(N), N ≥ 3`, the target has `φ(N)` points and the fibres are the fixed-pairing curves of §8.12.
- Complex conjugation interchanges the two components `H^+` and `H^`- over a fixed level class: the target must use `Y = {±1}`, not the one-point torus datum.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, `(64)` and footnote 73, p.119; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), `(34)` and Theorem 5.17, p.59.)

This uses [8.6 Zero-dimensional Shimura varieties and their canonical models](#86-zero-dimensional-shimura-varieties-and-their-canonical-models); [4.10 Disjoint special reflex fields](#410-disjoint-special-reflex-fields); [0.5 Finite analytic component decomposition](#05-finite-analytic-component-decomposition); [0.6 Abelianized component formula](#06-abelianized-component-formula); [4.4 Canonical-model condition](#44-canonical-model-condition); [4.2 Reflex norm of a special torus](#42-reflex-norm-of-a-special-torus); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [4.8 Density of Hecke translates](#48-density-of-hecke-translates); [4.9 Reflex norm under a torus morphism](#49-reflex-norm-under-a-torus-morphism); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 8.8 Abelian-type tower from Layer 6

Prove `CanonicalTower.abelian_type` as follows. Applying the preceding canonical-model functoriality theorems to the models constructed by Layer 6 produces the finite-level abelian-type tower, translations, finite maps, Hecke spans and datum functoriality. No premise imports Layer 7 or the general-existence route.

Throughout this result, `D` is of abelian type in §P.1; Layer 6 supplies actual models satisfying Layer 4.

Supply the Layer 6 construction to §§4.11 and 8.1.

Use §4.12 to identify choices of Hodge-type covers and component descent.

Use the same finite-level and datum-morphism statements; do not identify entire varieties merely because derived groups are isogenous.

**Checks.**

- `GL₂` is the genus-one `GSp` case, supplied through Layers 5–6.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 14.15–14.16 and the paragraph after them, p.127; 13.7, p.119.)

This uses [6.7 Canonical models of abelian type](#67-canonical-models-of-abelian-type); [8.1 Canonical algebraic level tower](#81-canonical-algebraic-level-tower); [4.12 Uniqueness of canonical models](#412-uniqueness-of-canonical-models); [8.4 Algebraic Hecke correspondence](#84-algebraic-hecke-correspondence); [8.5 Functoriality of canonical models in the datum](#85-functoriality-of-canonical-models-in-the-datum), with the exact supplier contracts above.

### 8.9 Canonical reciprocity for full elliptic level

Prove `GL2Modular.full_level_is_canonical` as follows. For `N≥3`, the `ℚ`-scheme `Y_full(N)_Q` representing elliptic curves with an ordered full `N`-basis, with the complex identification supplied by ModularCurvesPartII §§1.2–1.5 and ModularCurvesPartII §3.14 and §5.0, satisfies the actual `GL₂` special-pair canonical-model condition of Layer 4. The Galois action includes the Weil pairing and acts on the entire full-level model, not only a chosen cyclotomic fibre.

Throughout this result, `N≥3`; `GL₂` datum is the standard homology-weight minus one datum of §P.4. The fine generic-fibre full-level moduli scheme and analytic comparison are the suppliers' actual constructions.

Identify `GL₂=GSp2` and an elliptic curve with its canonical principal polarization. Prove the genus-one comparison of §5.0 Siegel moduli with ModularCurves's `Y_full(N)`, retaining the determinant/Weil-pairing convention. Section 5.0 and ModularCurvesPartII §§1.2–1.5 compare homology, Tate modules and the ordered level basis with the Layer 3 complex variety.

Apply §§5.11–5.13 to verify the normalized CM action on the represented elliptic special pairs and their Tate levels.

Apply Layer 4 Artin-convention conversion, including the field of definition of each special point. A geometric-point bijection alone is insufficient to identify the `ℚ`-scheme.

**Checks.**

- Use the actual special torus for an elliptic CM curve and compare its normalized Artin action on the ordered basis.
- Full level two is excluded: the residual minus-one automorphism preserves all two-torsion.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; 6.11, p.74; 14.12, p.125.)

This uses [Local datum foundations, §P.4](#p4-levels-and-basic-examples); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [4.4 Canonical-model condition](#44-canonical-model-condition); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [5.10 Main theorem of complex multiplication](#510-main-theorem-of-complex-multiplication); [5.11 Polarization and level in CM reciprocity](#511-polarization-and-level-in-cm-reciprocity); [5.12 Siegel special points are full CM](#512-siegel-special-points-are-full-cm); [5.13 The Siegel canonical model](#513-the-siegel-canonical-model); [5.0 Rational polarized Siegel moduli](#50-rational-polarized-siegel-moduli); [ModularCurvesPartII, §§1.2–1.5, lattice uniformization and the analytic Weil pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#15-the-analytic-weil-pairing-comparison); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing), with the exact supplier contracts above.

### 8.10 Full-level modular curve comparison over Q

Prove `GL2Modular.full_level_iso` as follows. For `N≥3`, there is a unique `ℚ`-isomorphism `Sh_{K(N)}(GL₂,H±) → Y_full(N)_Q` inducing the supplied complex uniformization. Here `K(N)=ker(GL₂(ℤ̂)→GL₂(ℤ/N))`. The source is the actual Layers 5–6 canonical model and the target is the ModularCurves fine full ordered-basis scheme.

Throughout this result, `N≥3`; full `H±` datum and principal adelic level; no chosen primitive root is incorporated into the `ℚ`-scheme.

Use §§8.9 and 4.12 to descend the complex moduli identification to a `ℚ`-isomorphism.

Use the existing AA.5 principal-level component calculation and ModularCurvesPartII §3.14 comparison to identify its complex effect with the double-quotient formula.

Verify compatibility with the universal elliptic family/level interpretation through §5.0.

**Checks.**

- At `N=3` the full curve has two geometric pairing components; it is not identified with a single `Γ(3)` quotient.
- At `N=4` there are `φ(4)=2` pairing components; composite levels are covered without ModularCurves Layer 10.
- Use determinant representatives in `GL₂(ℤ̂)` to obtain literal `Γ(N)` stabilizers, as in AdelicAlgebraicGroups §5.2; arbitrary representatives require the specified conjugating maps.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; 6.11, p.74; 13.7(a), p.119; [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.9, p.175; 12.9, p.200 (author-typeset version); [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), 52-`gl₂`-over-`ℚ`-and-principal-levels.)

This uses [8.9 Canonical reciprocity for full elliptic level](#89-canonical-reciprocity-for-full-elliptic-level); [4.12 Uniqueness of canonical models](#412-uniqueness-of-canonical-models); [8.8 Abelian-type tower from Layer 6](#88-abelian-type-tower-from-layer-6); [AdelicAlgebraicGroups, §5.2, GL₂ over ℚ and principal levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#52-gl₂-over-ℚ-and-principal-levels); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing), with the exact supplier contracts above.

### 8.11 Determinant is the Weil-pairing morphism

Prove `GL2Modular.det_eq_weil_pairing` as follows. Let `ν = det: GL₂ → G_m, T = G_m, Y = ℝˣ/ℝ_{>0} ≅ {±1}` (Milne `(34): T(ℝ)^† = ℝ_{>0}, T(ℚ)^† = ℚ_{>0}`) and `μ = det∘μ_x`. Under `GL2Modular.full_level_iso`, the `ℚ`-morphism of §8.7, `Sh_{K(N)}(GL₂,H±) → Sh_{det K(N)}(G_m,{±1})`, is identified over `ℚ` with the ModularCurves determinant `det_N: Y_full(N)_Q → μ_N^prim, (E,P,Q) → e_N(P,Q)`. Here `det K(N) = ker(ℤ̂^× → (ℤ/N)^×), Sh_{det K(N)}(G_m,{±1}) ≅ (ℤ/N)^×` with Galois acting through the cyclotomic character, and its canonical `ℚ`-model is `μ_N^prim = Spec ℚ[z]/Φ_N(z)`, not the constant disjoint union of `φ(N) Q`-points. The strict one-point torus datum `(G_m,{det∘h})` of Section P.4 is not the target: at this level its Shimura set is `(ℤ/N)^×/{±1}`, with model the spectrum of the real subfield of `ℚ(ζ_N)`.

Throughout this result, `N≥3`; choose the analytic reference basis so that its pairing is the reference primitive root calibrated by ModularCurvesPartII §§1.2–1.5; use the Layer 4 normalization of the Artin map and reflex norm.

Section 8.7 (`G^der = SL₂` is simply connected) gives the `ℚ`-morphism to the canonical model of `Sh_{det K(N)}(G_m,{±1})`; §8.6 identifies that set with `(ℤ/N)^×` (Milne p.63) and its Galois action `(64)` with the cyclotomic character (Milne p.125), so the model is `μ_N^prim`. AA.5 supplies the determinant-indexed components.

For a level `η`, Milne 6.3 sends the moduli object to `[ah, a∘η]`; the determinant records the multiplier of the alternating pairing. ModularCurvesPartII §§1.2–1.5 and ModularCurvesPartII §3.14 and §5.0 identify that multiplier with the exponent of `e_N(P,Q)` relative to the calibrated reference root.

Both are `ℚ`-morphisms `Y_full(N)_Q → μ_N^prim` agreeing on complex points; equality descends by faithful base change (§4.9b field descent).

**Checks.**

- For `N=3` the primitive-root model is `Spec ℚ[z]/(z²+z+1)`, geometrically two points with nontrivial conjugation.
- A determinant-one basis change preserves the pairing; a determinant-`u` change raises it to the `u`-th power.
- With the one-point torus datum the `N = 3` target would be a single `ℚ`-point, since `(ℤ/3)^×/{±1}` is trivial; the correct target has two geometric points.
- Use determinant representatives in `GL₂(ℤ̂)` to obtain literal `Γ(N)` stabilizers, as in AdelicAlgebraicGroups §5.2; arbitrary representatives require the specified conjugating maps.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §13, The Galois action on the connected components, `(64)`, p.119; §14, Siegel proof, p.125; [J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Lemma 8.7, p.100, read with the fixed reference root `ζ_ref` of ModularCurvesPartII §§1.2–1.5; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), §5, Zero-dimensional Shimura varieties, `GL₂` example, p.63; [Tau Ceti Project, Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md), 52-`gl₂`-over-`ℚ`-and-principal-levels.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [8.7 Galois action on connected components](#87-galois-action-on-connected-components); [8.6 Zero-dimensional Shimura varieties and their canonical models](#86-zero-dimensional-shimura-varieties-and-their-canonical-models); [4.1 Milne geometric Artin conversion](#41-milne-geometric-artin-conversion); [AdelicAlgebraicGroups, §5.2, GL₂ over ℚ and principal levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#52-gl₂-over-ℚ-and-principal-levels); [ModularCurvesPartII, §§1.2–1.5, lattice uniformization and the analytic Weil pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#15-the-analytic-weil-pairing-comparison); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [8.9 Full-level modular model is canonical](#89-canonical-reciprocity-for-full-elliptic-level); [ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 8.12 Fixed-pairing fibre over a primitive root

Prove `GL2Modular.fixed_pairing_fibre_iso` as follows. For `N≥3` and a primitive Nth root `ζ` in `ℂ`, base change `GL2Modular.full_level_iso` to `ℚ(ζ)` and take the scheme-theoretic fibre of its determinant/Weil-pairing map at `ζ`. This is an isomorphism to `Y(N,ζ)` over `ℚ(ζ)`. Its complex analytification is `Γ(N)∖H`, and the fibre is geometrically connected and geometrically irreducible using the open comparison ModularCurvesPartII §4.10.

Throughout this result, the fibre is formed after cyclotomic base change; its scalar extension to `ℂ` uses the chosen embedding `ℚ(ζ)→C`.

Use §8.11 and the functoriality of fibre products to restrict `GL2Modular.full_level_iso`.

Apply ModularCurvesPartII §§1.2–1.5 and ModularCurvesPartII §3.14 fixed-pairing uniformization with the calibrated basis: if `ζ=ζ_ref^u`, replace the first standard torsion generator by `u` times it.

Import ModularCurvesPartII §4.10 open connectedness and smooth-curve irreducibility. This has no compactification prerequisite.

**Checks.**

- `Y_full(3)_C` has two components whereas `Y(3,ζ)_C` has one.
- Taking a fibre over `ℚ` without adjoining `ζ` is not a fibre at a `ℚ`-rational primitive root for `N>2`.

([J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.7–8.8, p.100; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.17, pp.59–61; connected components in section 13, p.119.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [8.11 Determinant is the Weil-pairing morphism](#811-determinant-is-the-weil-pairing-morphism); [ModularCurvesPartII, §§1.2–1.5, lattice uniformization and the analytic Weil pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#15-the-analytic-weil-pairing-comparison); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [ModularCurvesPartII, §4.10, geometric connectedness of a fixed-pairing curve](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#410-geometric-connectedness-of-a-fixed-pairing-curve); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification); [ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing); `CategoryTheory.Over.pullback`, with the exact supplier contracts above.

### 8.13 Row-basis and adelic right actions

Prove `GL2Modular.row_basis_right_translation` as follows. For `N≥3` and `u` in `GL₂(ℤ̂)` with reduction `[[a,b],[c,d]]`, right translation `[x,A]→[x,A u]` corresponds under `GL2Modular.full_level_iso` to `(P,Q)→(aP+cQ,bP+dQ)`. The Weil pairing changes by exponent `det(u mod N)`, so this map sends `Y(N,ζ)` to `Y(N,ζ^{det u})`. General finite-adelic `g` is compared through the two isogeny legs at the intersection level, not by pretending `g` has an integral reduction.

Throughout this result, the source `K(N)` is normalized by `GL₂(ℤ̂)`; full-level bases use the ModularCurves row convention.

Write the level as `η:V(𝔸_f)→V_f(E)`. Milne 6.3 identifies it with `[ah,a η]`. Replacing `η` by `η` composed with `u` changes `a η` to `(a η)u`.

Evaluate precomposition on the two standard column generators: columns of `u` give `aP+cQ` and `bP+dQ`. Thus the ordered basis is a row with right multiplication.

Use ModularCurves Weil-pairing bilinearity for the determinant exponent. For nonintegral `g` use ModularCurvesPartII §§7.1a, 7.3–7.4 and 9.1–9.3 isogeny/Hecke comparison and the actual intersection-level span.

**Checks.**

- For `u=[[1,1],[0,1]]` the basis goes to `(P,P+Q)`, not `(P+Q,Q)`.
- For `u=[[0,1],[-1,0]]` the basis goes to `(-Q,P)`; determinant is one and pairing stays fixed.
- For `diag(v,1)`, pairing is raised to `v` and the component changes unless `v=1 mod N`.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 6.3, pp.70–71; [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md), Conventions, item 5: Full level and actions.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [8.11 Determinant is the Weil-pairing morphism](#811-determinant-is-the-weil-pairing-morphism); [8.2 Right translation laws on the algebraic tower](#82-right-translation-laws-on-the-algebraic-tower); [8.4 Algebraic Hecke correspondence](#84-algebraic-hecke-correspondence); [ModularCurvesPartII, §§7.1a, 7.3–7.4 and 9.1–9.3, differentials and isogeny correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#71a-kodairaspencer-normalization-r125); [ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing), with the exact supplier contracts above.

### 8.14 Gamma-one modular curve comparison

Prove `GL2Modular.gamma1_iso` as follows. For `N≥4`, the canonical `ℚ`-scheme at `K₁(N)={u in GL₂(ℤ̂):u e₁=e₁ mod N}` is `ℚ`-isomorphic to the fine curve `Y₁(N)_Q` representing `(E,P)` with `P` of exact order `N`. The comparison is induced by the full-level forgetful map and preserves its specified point and its complex `Γ₁(N)` uniformization.

Throughout this result, `N≥4`; `K₁` fixes `e₁` (first column), so the row convention retains `P`.

Choose a full principal level `M` divisible by `N` with `M≥3` and pass to the finite quotient of its level problem by the stabilizer of the chosen `N`-point.

Use §8.3 and the ModularCurves and ModularCurvesPartII §3.14 fine quotient comparison to descend `GL2Modular.full_level_iso`. Exact moduli representability at `N≥4` eliminates automorphisms.

Use ModularCurvesPartII §§7.1a, 7.3–7.4 and 9.1–9.3 and ModularCurvesPartII §§8.3–8.5 to match forgetful and diamond morphisms over `ℚ`.

**Checks.**

- At `N=4` a point of exact order four excludes the residual minus-one automorphism.
- At `N=1,2` the comparison cannot be labelled a fine universal elliptic scheme.
- AdelicAlgebraicGroups §5.2 uses `c≡0,d≡1`, the stabilizer of the second row covector. Here `a≡1,c≡0` fixes the first column vector. The two intersections with `SL₂` agree as `Γ₁(N)`, so import the identity-component uniformization. For the full adelic moduli dictionary retain this roadmap’s first-column level; basis-swap conjugation does not identify these compact opens.

([Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md), Layer 5A: Tate normal form and `Y₁(N)` for `N≥4`; [J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29 and 13.7, pp.65,119.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [8.3 Finite level maps and effective deck groups](#83-finite-level-maps-and-effective-deck-groups); [8.13 Row-basis and adelic right actions](#813-row-basis-and-adelic-right-actions); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [ModularCurvesPartII, §§7.1a, 7.3–7.4 and 9.1–9.3, differentials and isogeny correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#71a-kodairaspencer-normalization-r125); [ModularCurvesPartII, §§8.3–8.5, component fields, conjugation and level compatibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#83-component-fields-and-symplectic-descent); [ModularCurves, 5a tate normal form and y₁n for n4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5a-tate-normal-form-and-y₁n-for-n4); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization), with the exact supplier contracts above.

### 8.15 Gamma-zero coarse modular curve comparison

Prove `GL2Modular.gamma0_coarse_iso` as follows. For `N>0`, the canonical `ℚ`-scheme at `K₀(N)={u in GL₂(ℤ̂):u preserves the line (ℤ/N)e₁}` is `ℚ`-isomorphic to the coarse curve `Y₀(N)_Q` for elliptic curves with a cyclic order-`N` subgroup. At `N=1` this is the `j`-line. The assertion is an isomorphism of coarse schemes, not fine representability or a bijection with rational isomorphism classes over every field.

Work on the characteristic-zero generic fibre with positive `N`. The cyclic-subgroup problem and its coarse space are the actual ModularCurves constructions.

Choose full `M`-level with `N` dividing `M` and `M≥3`; use the subgroup stabilizer and its finite coarse quotient.

Compare this quotient with the canonical finite-level quotient from §8.3, via §8.10 and the first-column convention.

Use ModularCurves `9E` and ModularCurvesPartII §3.14 and ModularCurvesPartII §§8.3–8.5 to identify the coarse scheme and its analytic quotient.

**Checks.**

- For `N=1` the `j`-line has elliptic objects with automorphisms; it is not a fine scheme with a universal elliptic curve.
- For `N=6` use the general coarse construction, not the prime diamond-quotient theorem of ModularCurves Layer 10.

([J. S. Milne, Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), 8.6, p.100; [Tau Ceti contributors, Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md), Layer 9E: the coarse `j`-line and `Y₀(N)`.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [8.3 Finite level maps and effective deck groups](#83-finite-level-maps-and-effective-deck-groups); [8.13 Row-basis and adelic right actions](#813-row-basis-and-adelic-right-actions); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [ModularCurvesPartII, §§8.3–8.5, component fields, conjugation and level compatibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#83-component-fields-and-symplectic-descent); [ModularCurves, 9e the coarse j line and y₀n](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#9e-the-coarse-j-line-and-y₀n); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization); [ModularCurves, 9d coarse moduli schemes and finite quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#9d-coarse-moduli-schemes-and-finite-quotients), with the exact supplier contracts above.

### 8.16 Minimal compactification of the full modular curve

Prove `GL2Modular.minimal_compact_iso` as follows. For `N≥3` the independently constructed proper normal coarse compact curve `X_full(N)_Q` from ModularCurvesPartII §§5.2, with its specified open `Y_full(N)_Q`, is the `E=Q`-model of the complex Baily–Borel minimal compactification for the `GL₂` principal-level datum, via the open isomorphism `GL2Modular.full_level_iso`. This is the genus-one arithmetic compactification base case, constructed without assuming the general descent theorem of §8.18.

Throughout this result, `N≥3`; the full and composite levels use the ModularCurvesPartII §§5.2, 5.15–5.16 and 5.19 construction. ModularCurves Layer 10 (prime `N≥5` diamond quotients with `H ≤ (ℤ/N)^×/{±1}`) is not used here and supplies no full-level model.

ModularCurvesPartII §§5.2, 5.15–5.16 and 5.19 constructs the proper normal coarse compactification from generalized elliptic curves; ModularCurvesPartII §§6.1–6.2 and 4.8 identifies its `ℂ`-model with the independently constructed analytic modular compactification.

Use the full-level open comparison to specify the complex Baily–Borel identification and hence an actual `ℚ`-model containing the canonical open.

Normal proper-curve extension gives uniqueness. ModularCurvesPartII §§4.1–4.8, 5.11 and 6.3 certifies the generic-fibre component and cusp bookkeeping; it is not the source of ModularCurvesPartII §4.10 open connectedness.

**Checks.**

- The level `N=6` full compact model is supplied by ModularCurvesPartII §§5.2, 5.15–5.16 and 5.19; the prime-level ModularCurves Layer 10 cannot provide it.
- Boundary is the scheme-theoretic complement, not a hand-selected set of complex cusp points.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.9, p.200; [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.20–10.21, pp.183–184.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [ModularCurvesPartII, §§6.1–6.2 and 4.8, compact comparison and cusp parameters](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#61-compact-analyticalgebraic-modular-comparison); [ModularCurvesPartII, §§5.2, 5.15–5.16 and 5.19, coarse compactifications](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#52-integral-coarse-modular-curves); [ModularCurvesPartII, §§4.1–4.8, 5.11 and 6.3, formal cusps and cusp fields](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#63-cusp-fields-and-pairing-components); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison), with the exact supplier contracts above.

### 8.16a Broader pure auxiliary canonical models

**Target.** `TauCeti.Shimura.broader_pure_canonical`. Construct canonical models for the reductive finite-domain auxiliary data occurring in Pink 2.9 and 12.10: retain the finite component labels in `X` and its possibly noninjective map `h:X→Hom(S,G_R)`. Construct their broader datum morphisms, cocharacter reflex fields and special torus domains as in Pink 2.1–2.13. For an irreducible such datum, apply the pure case of Pink 2.26(a): since its unipotent radical is zero, its embedding has only a broader torus factor and a pure factor whose `h`-map is injective. Supply the torus canonical models from §8.6 and the latter factor's strict model from Layer 6 when it is abelian type, or Layer 7 in general. Construct the product model and descend the small-level closed image via Pink 11.9's special-torus criterion, using §4.9b; prove all special-pair reciprocity and translation laws. For reducible data, use the improper-component covering of Pink 2.13 and the finite component quotients of Pink 11.12, with §3.4a. This constructs the actual schemes, complex comparisons and full tower, rather than merely assuming models of the broader quotient. Prove uniqueness and functoriality as in Pink 11.10–11.11. Build this before §8.17; the abelian-type lane uses only its abelian-type strict factors. ([Pink](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 2.9–2.13, pp.32–34; 2.26(a), pp.39–40; 11.4–11.12, pp.186–192; pure case of 11.18, pp.194–195.)

**Checks.**

- Pink's two-point `G_m` domain has two labels over the same `h`; the determinant component model keeps both.
- Quotienting the `GL₂` datum by `SL₂` retains the two signs although its `h`-image is a singleton.
- When `h` is injective, the construction agrees with the strict canonical model through its specified complex comparison.

### 8.17 Arithmetic codimension-one partial compactification

Prove `CanonicalModel.codim_one_extension` as follows. Let `D=(G,X)` be a pure Shimura datum with actual canonical models and `K` neat. Let `M_K(C)^+ ⊂ M_K(C)^min` be the union of `M_K(C)` with the boundary strata of codimension one (Pink 8.2): it is smooth, its boundary is a smooth divisor and its complement in `M_K(C)^min` has codimension at least two. Then `M_K(C)^+` has a normal `E(D)`-model `M_K^+` containing the canonical model `M_K` as a dense open subscheme, with a specified complex comparison extending the open comparison. It is unique up to the `E`-isomorphism inducing that specified complex comparison. The codimension-one strata come from the `ℚ`-simple factors of `G^ad` isomorphic to `PGL₂,Q`, through surjections `G → PGL₂,Q`. When such a surjection lifts to a morphism `(G,X) → (GL₂,H±)`, the corresponding partial extension is the scheme-theoretic `closure` of `M_K` in `M_K′(G′,X′) ×_E (X_full(N)_Q ⊗ E)` for `(G′,X′) = (G,X)/SL₂,Q` (Pink 2.9), using §8.16; otherwise it is the quotient by a finite group of the corresponding extension for `G̃ = G ×_{PGL₂} GL₂`. The construction uses no torus torsor or mixed toroidal input (Pink 12.8 and ShimuraCompactifications `C2` concern mixed data).

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. Section 8.16a constructs the auxiliary models for `(G,X)/SL₂,Q` and `(G̃,X̃)`, retaining their finite domain labels. In the abelian-type lane prove that their strict factors are abelian type by the induced derived central-isogeny witnesses, and apply the Layer 6 branch of §8.16a. `K` is neat and the auxiliary levels satisfy [3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data); their actual auxiliary models and comparisons are those of §8.16a.

[3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data): the codimension-one boundary strata of `M_K(C)^min` belong to the rational boundary components whose parabolic is the preimage of a Borel subgroup under some `G → PGL₂,Q`; `M_K(C)^+` is smooth with smooth boundary divisor (Pink 8.2). The strata of distinct factors are disjoint, so `M_K^+` is glued along `M_K` from one partial extension per factor.

Lifted case (Pink 12.10, first paragraph): `PGL₂,Q` lifts to an almost direct factor `SL₂,Q` of `G^der` and `(G,X)` embeds in `(G′,X′) × (GL₂,H±)`, with `E(G,X) = E(G′,X′)` because `E(GL₂,H±) = Q`. The product of the canonical model of `(G′,X′)` with `X_full(N)_E` (§8.16) is an `E`-model of the corresponding product partial compactification. By the complex closed-immersion statement, `M_K(C)^+` is the `closure` of `M_K(C)` there; take the scheme-theoretic `closure` over `E` of the image of the descended embedding (§8.5); `closure` commutes with the flat base change `E → C` (AlgebraicModuliForArithmeticGeometry §5.4 and the finite-quotient contract in Exact supplier contracts) and closed subschemes descend (§4.9b field descent).

General case (Pink 12.10, second paragraph): `G̃ = G ×_{PGL₂} GL₂` lifts, `E(G̃,X̃) = E(G,X)`, and the complex map `M_K̃(G̃,X̃)(C)^+ → M_K(C)^+` is finite surjective `(H¹(A,G_m) = 0)`; define `M_K^+` as the finite quotient of the lifted extension (§8.3, AlgebraicModuliForArithmeticGeometry §5.4 and the finite-quotient contract in Exact supplier contracts), which exists by quasi-projectivity. For uniqueness, use the specified complex comparison between two models of this same partial compactification. Its conjugates agree on `M_K` and hence on the whole reduced source with separated target. Descend this complex isomorphism and its inverse by §4.9b field descent (Pink 12.6). Normality and a common dense open alone do not identify arbitrary compactifications.

**Checks.**

- For `G = GL₂` itself, `(G′,X′)` is the two-point datum `(G_m,{±1})` and `M_K^+ = X_full(N)_Q`, agreeing with §8.16.
- If no `ℚ`-simple factor of `G^ad` is `PGL₂,Q` (for example Hilbert modular data over `F ≠ Q`), `M_K^+ = M_K`.
- No prerequisite on the torus embeddings of ShimuraCompactifications Layer `C0` or on its Layer `C2` is allowed.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.10, pp.200–201 (author-typeset version); [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, p.132; [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.9, p.200.)

This uses [8.16 Minimal compactification of the full modular curve](#816-minimal-compactification-of-the-full-modular-curve); [8.5 Functoriality of canonical models in the datum](#85-functoriality-of-canonical-models-in-the-datum); [4.12 Uniqueness of canonical models](#412-uniqueness-of-canonical-models); [8.3 Finite level maps and effective deck groups](#83-finite-level-maps-and-effective-deck-groups); [2.1 Rational boundary components and incidence](#21-rational-boundary-components-and-incidence); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [3.8 Complex minimal compactification functoriality](#38-complex-minimal-compactification-functoriality); [3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data); [3.10 Logarithmic canonical section embedding](#310-logarithmic-canonical-section-embedding); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization); `AlgebraicGeometry.IsOpenImmersion`, with the exact supplier contracts above.

### 8.18 Reflex-field descent of the minimal compactification

Prove `CanonicalModel.minimal_defined_over_reflex` as follows. For a pure datum `D` with actual canonical open models, its normal projective complex Baily–Borel compactification `M_K,C^min` has a unique projective normal `E(D)`-model containing `M_K` and inducing the specified complex compactification. The theorem is for the same datum class as the supplied open models. Its construction must exhibit effective descent, not infer it solely from uniqueness of an open model.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. [3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data) and [3.10 Logarithmic canonical section embedding](#310-logarithmic-canonical-section-embedding) apply; the actual auxiliary arithmetic models required by §8.17 are supplied by §8.16a.

At neat level, §8.17 gives the normal `E`-model `M_K^+` of `M_K(C)^+`: the open part with the codimension-one boundary strata, smooth with smooth boundary divisor and complement of codimension at least two in `M_K(C)^min` (Pink 8.2, 12.10).

On `M_K^+` the invertible quasi-coherent sheaf `ω[dlog]` of top differentials with logarithmic poles along the boundary divisor is defined over `E`. The structure map `M_K^+ → Spec E` is qcqs, so the global sections of `ω[dlog]^n` commute with `E → C` by SchemeAndStackFoundations §2.6 /` qcoh_higherDirectImages` in degree zero (Stacks `02KH`). Section 3.10 (Pink 8.2, Baily–Borel 10.11): for a positive sufficiently divisible `n, ω[dlog]^n` is generated by global sections on `M_K(C)^+` and the induced map extends to a closed embedding of `M_K(C)^min`.

Define `M_K^min` as the `closure` of `M_K^+` in the projective space of the dual of `Γ(M_K^+, ω[dlog]^n)` over `E` (Pink 12.12). Closure commutes with `E → C` (AlgebraicModuliForArithmeticGeometry §5.4 and the finite-quotient contract in Exact supplier contracts), so its base change is `M_K(C)^min`; normality and projectivity descend.

Remove neatness by finite quotients (§8.3, AlgebraicModuliForArithmeticGeometry §5.4 and the finite-quotient contract in Exact supplier contracts; Pink 12.6). For uniqueness, the specified complex comparisons supply an isomorphism between the two models of the same Baily–Borel compactification. Its conjugates agree on the dense canonical open, hence on the reduced source with separated target. Descend the isomorphism and its inverse by §4.9b field descent; this does not claim uniqueness among arbitrary normal compactifications of `M_K`.

**Checks.**

- When no codimension-one boundary occurs, `M_K^+ = M_K` and Koecher's principle makes the sections those of automorphic forms without growth condition; the `closure` argument is unchanged.
- For `GL₂` the construction agrees with §8.16.
- No prerequisite on AutomorphicBundles Layer `B1`, on the torus embeddings of ShimuraCompactifications Layer `C0` or on its Layer `C2` is allowed.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(a), p.197; 12.6–12.7, pp.198–199; 12.10, pp.200–201; 12.12, p.202; [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 8.2, pp.132–133.)

This uses [SchemeAndStackFoundations §2.6, qcoh_higherDirectImages](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/SchemeAndStackFoundations/README.md#26-quasi-coherent-cohomology); [8.17 Arithmetic codimension-one partial compactification](#817-arithmetic-codimension-one-partial-compactification); [2.7 Baily–Borel algebraization](#27-bailyborel-algebraization); [2.8 Koecher principle and boundary codimension](#28-koecher-principle-and-boundary-codimension); [3.8 Complex minimal compactification functoriality](#38-complex-minimal-compactification-functoriality); [3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data); [3.10 Logarithmic canonical section embedding](#310-logarithmic-canonical-section-embedding); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [4.12 Uniqueness of canonical models](#412-uniqueness-of-canonical-models); [8.3 Finite level maps and effective deck groups](#83-finite-level-maps-and-effective-deck-groups); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization); `AlgebraicGeometry.IsProper`; `AlgebraicGeometry.IsOpenImmersion`, with the exact supplier contracts above.

### 8.19 Functoriality on minimal compactifications

Prove `CanonicalModel.minimal_map_extension` as follows. Every descended translation `T_g` and every admissible datum morphism has a unique extension between the corresponding minimal models over the same reflex field or specified compositum. The extensions preserve identity and composition and agree with complex Baily–Borel functoriality. In particular level maps and both Hecke legs extend. Extended level maps are finite where the complex finite-quotient theorem proves finiteness; no general étaleness across the boundary is asserted.

Throughout this result, `D=(G,X)` is a pure Shimura datum; `E=E(D)` is embedded in `ℂ`. Each model `M_K` is an actual finite-type normal separated `E`-scheme with a specified complex comparison to Layer 3, satisfying the special-pair reciprocity condition of Layer 4. Existence is supplied by Layer 5 or Layer 6 in the abelian-type lane, or Layer 7 in the general lane. The complex extension theorem is supplied by Layers 2–3 with its applicable level/datum hypotheses.

Use §8.18 for the source and target and Layers 2–3 for the complex extension.

On the schematically dense open, descent agrees with the known arithmetic map. Separatedness and reducedness give equality of conjugates on the whole source.

Apply descent of morphisms and faithful base change; finite level extensions inherit finiteness by descent. The same argument proves coherence of compositions.

**Checks.**

- A level map may ramify at cusps even when its restriction to neat opens is étale.
- Restricting an extended correspondence to the open recovers the same ordered Hecke span.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(b), p.197; 12.6, p.198.)

This uses [8.18 Reflex-field descent of the minimal compactification](#818-reflex-field-descent-of-the-minimal-compactification); [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [8.5 Functoriality of canonical models in the datum](#85-functoriality-of-canonical-models-in-the-datum); [8.2 Right translation laws on the algebraic tower](#82-right-translation-laws-on-the-algebraic-tower); [8.4 Algebraic Hecke correspondence](#84-algebraic-hecke-correspondence); [2.9 Level maps on minimal compactifications](#29-level-maps-on-minimal-compactifications); [3.8 Complex minimal compactification functoriality](#38-complex-minimal-compactification-functoriality); [3.9 Codimension-one boundary and auxiliary data](#39-codimension-one-boundary-and-auxiliary-data); [3.10 Logarithmic canonical section embedding](#310-logarithmic-canonical-section-embedding); [3.4 Algebraic maps of Shimura data](#34-algebraic-maps-of-shimura-data); [3.5 Algebraic finite quotients and normalization](#35-algebraic-finite-quotients-and-normalization); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 8.20 Modular cusp loci and Tate parameters

Prove `GL2Modular.cusp_tate_comparison` as follows. The `GL₂` minimal/modular compact comparison identifies the cusp subschemes, their residue fields and their formal neighborhoods with the generalized-elliptic/Tate charts of ModularCurvesPartII §§6.1–6.2 and 4.8 and ModularCurvesPartII §§8.3–8.5 and ModularCurvesPartII §§4.1–4.8, 5.11 and 6.3. At a chosen complex cusp of width `w`, the local analytic coordinate is `q_c=exp(2 π i z/w)`, with `q=exp(2 π i z)=q_c^w` after a chosen cusp representative. `Over` the supplier's cusp residue field, the completed local ring of the normal curve is `k(c)[[q_c]]`, using its chosen Tate parameter; changes of cusp representative introduce the specified roots of unity.

Throughout this result, `N≥3` for full fine open level; other levels use their stated coarse curve and cusp stabilizers. Choose a cusp label, uniformizer and field embedding; no universal `ℚ`-rationality assertion.

Compare the scheme boundary by extension of the open isomorphism and ModularCurvesPartII §§4.1–4.8, 5.11 and 6.3 boundary identification.

Import ModularCurvesPartII §§6.1–6.2 and 4.8 width/parameter computation and ModularCurvesPartII §§8.3–8.5 cusp Galois fields, then match them with ModularCurvesPartII §§4.1–4.8, 5.11 and 6.3 formal Tate charts.

Use ModularCurvesPartII §§1.2–1.5 normalization to identify the analytic exponential with the chosen Tate parameter, including roots of unity under changed representatives.

**Checks.**

- At the infinity cusp of full principal level `N`, width is `N` and `q=q_c^N`.
- A different cusp label can have a nontrivial residue-field action; replacing the cusp scheme by a constant `ℚ`-set loses this information.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 10.21–10.22, pp.184–185; 12.9, p.200.)

This uses [8.16 Minimal compactification of the full modular curve](#816-minimal-compactification-of-the-full-modular-curve); [8.14 Gamma-one modular curve comparison](#814-gamma-one-modular-curve-comparison); [8.15 Gamma-zero coarse modular curve comparison](#815-gamma-zero-coarse-modular-curve-comparison); [ModularCurvesPartII, §§1.2–1.5, lattice uniformization and the analytic Weil pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#15-the-analytic-weil-pairing-comparison); [ModularCurvesPartII, §§6.1–6.2 and 4.8, compact comparison and cusp parameters](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#61-compact-analyticalgebraic-modular-comparison); [ModularCurvesPartII, §§8.3–8.5, component fields, conjugation and level compatibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#83-component-fields-and-symplectic-descent); [ModularCurvesPartII, §§4.1–4.8, 5.11 and 6.3, formal cusps and cusp fields](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#63-cusp-fields-and-pairing-components); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification), with the exact supplier contracts above.

### 8.21 Compatibility of modular and canonical correspondences

Prove `GL2Modular.tower_compatibility` as follows. The `ℚ`-isomorphisms for full, `Γ₁` and `Γ₀` levels commute with all admissible level maps and the ordered Hecke isogeny correspondences, with the Weil-pairing component transport dictated by §8.13. Their compact extensions commute with the extended finite legs and the cusp/Tate charts. On coefficient sheaves, differential pullback and pull-push normalizations are precisely those of ModularCurvesPartII §§7.1a, 7.3–7.4 and 9.1–9.3.

Throughout this result, only the stated fine/coarse ranges and supplier's actual Hecke isogeny moduli are used; integral bad-prime models are not inferred.

ModularCurvesPartII §§7.1a, 7.3–7.4 and 9.1–9.3 and ModularCurvesPartII §§8.3–8.5 supply the analytic/level/isogeny identities; compare each leg using §§8.10, 8.13 and 8.5.

Faithful `ℂ`-base change gives equality over `ℚ`. Compatibility of successive open Hecke spans uses their actual fibre products; the effective-free decomposition and the separate coarse-level normalization comparison are exactly those of §8.4. Apply §8.19 and uniqueness of dense-open extension for the compact diagram.

Identify cusp formal maps using §8.20 and ModularCurvesPartII §§4.1–4.8, 5.11 and 6.3. Import the supplier normalization for differentials rather than redefining the Hecke operator.

**Checks.**

- For an integral unipotent at principal level the first generator stays `P` and the second becomes `P+Q`.
- For a nonintegral adelic prime isogeny, compare both legs rather than a putative automorphism of `Y_full(N)`.
- For prime `N≥5` diamonds with `H ≤ (ℤ/N)^×/{±1}`, verify the ModularCurves Layer 10 quotient range; use ModularCurvesPartII §§5.2, 5.15–5.16 and 5.19 for full/composite compact levels.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 5.29, pp.65–66; 6.3, pp.70–71; 13.6–13.8, pp.118–119; [Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(b), p.197.)

This uses [8.10 Full-level modular curve comparison over Q](#810-full-level-modular-curve-comparison-over-q); [8.11 Determinant is the Weil-pairing morphism](#811-determinant-is-the-weil-pairing-morphism); [8.12 Fixed-pairing fibre over a primitive root](#812-fixed-pairing-fibre-over-a-primitive-root); [8.13 Row-basis and adelic right actions](#813-row-basis-and-adelic-right-actions); [8.14 Gamma-one modular curve comparison](#814-gamma-one-modular-curve-comparison); [8.15 Gamma-zero coarse modular curve comparison](#815-gamma-zero-coarse-modular-curve-comparison); [8.4 Algebraic Hecke correspondence](#84-algebraic-hecke-correspondence); [8.19 Functoriality on minimal compactifications](#819-functoriality-on-minimal-compactifications); [8.20 Modular cusp loci and Tate parameters](#820-modular-cusp-loci-and-tate-parameters); [ModularCurvesPartII, §§7.1a, 7.3–7.4 and 9.1–9.3, differentials and isogeny correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#71a-kodairaspencer-normalization-r125); [ModularCurvesPartII, §§8.3–8.5, component fields, conjugation and level compatibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#83-component-fields-and-symplectic-descent); [ModularCurvesPartII, §§4.1–4.8, 5.11 and 6.3, formal cusps and cusp fields](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#63-cusp-fields-and-pairing-components); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent), with the exact supplier contracts above.

### 8.22 General-data canonical tower

Prove `CanonicalTower.general_data` as follows. For every pure Shimura datum `D` and every compact open `K`, supply the actual canonical models constructed by Layer 7 to Layer 8's conditional functoriality theorems. Obtain the same canonical `E(D)`-tower, right translations, finite level maps, effective quotients and ordered Hecke correspondences, independent, by the unique comparison of §4.12, of Layer 7's auxiliary extension and special point. For a datum morphism `D → D′, E(D′)` is contained in `E(D)`, so its map is defined over `E(D)`, with the target model extended to that field.

Throughout this result, Layer 7 has proved conjugation, cocycle, continuity and effective descent and has verified Layer 4 on the resulting models. The models are the ones constructed in Layer 7; no existence hypothesis stands in for them.

Apply the Layer 8 translation, tower and datum-map declarations to Layer 7's actual schemes and comparisons.

Apply §4.12 to compare auxiliary choices; use its compatibility with maps to obtain the tower identification.

Use §§8.3 and 8.4 with the effective stabilizers from Layer 1. No second proof of canonical functoriality is introduced.

**Checks.**

- The abelian-type application depends only on its Hodge/abelian-type existence route.
- Choosing a non-abelian-type datum cannot be justified by relabelling a Layer 6 model.

([J. S. Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), 12.10, p.115; 13.6–13.8, pp.118–119.)

This uses [7.14 Canonical models for every pure datum](#714-canonical-models-for-every-pure-datum); [4.11 Hecke translation over the reflex field](#411-hecke-translation-over-the-reflex-field); [8.1 Canonical algebraic level tower](#81-canonical-algebraic-level-tower); [4.12 Uniqueness of canonical models](#412-uniqueness-of-canonical-models); [8.3 Finite level maps and effective deck groups](#83-finite-level-maps-and-effective-deck-groups); [8.4 Algebraic Hecke correspondence](#84-algebraic-hecke-correspondence); [8.5 Functoriality of canonical models in the datum](#85-functoriality-of-canonical-models-in-the-datum), with the exact supplier contracts above.

### 8.23 General-data minimal compactification interface

Prove `CanonicalModel.general_minimal` as follows. Apply §§8.17–8.19 to the Layer 7 models and the corresponding broader auxiliary pure models of §8.16a and Pink 12.10. This gives normal projective minimal compactifications and their functorial maps over reflex fields for all pure data; their open restriction is the general-data tower. Export these objects to the general-data toroidal descent of ShimuraCompactifications (Layer `C2`) and the general infinite-level construction of PerfectoidShimuraVarieties (Layer 0 and Layer 0.general), including the broader auxiliary-model construction of §8.16a.

Throughout this result, Layer 7 supplies the original and auxiliary strict pure-datum models. Section 8.16a constructs the broader finite-domain pure auxiliary models, including their specified complex comparisons and reciprocity. Sections 3.8–3.10 supply the exact complex functoriality and logarithmic-section targets; their full proofs and analytic carriers are required.

Instantiate §§8.17–8.18 with the Layer 7 schemes and all broader auxiliary models constructed in §8.16a; apply the existing argument, with no separate general compactification proof.

Instantiate §8.19 and identify restrictions by §§8.22 and 4.12.

Supply only this arithmetic minimal/open interface to those two downstream consumers; toroidal existence and perfectoid limits remain their own targets.

**Checks.**

- The same construction agrees with the abelian lane via §4.12.
- No dependency imports the consuming toroidal model of ShimuraCompactifications.
- The `GL₂/SL₂` auxiliary domain retains both signs and uses the broader model of §8.16a.

([Richard Pink, Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), 12.3(a)–`(b)`, p.197; 12.10–12.12, pp.200–202.)

This uses [7.14 Canonical models for every pure datum](#714-canonical-models-for-every-pure-datum); [8.22 General-data canonical tower](#822-general-data-canonical-tower); [8.17 Arithmetic codimension-one partial compactification](#817-arithmetic-codimension-one-partial-compactification); [8.18 Reflex-field descent of the minimal compactification](#818-reflex-field-descent-of-the-minimal-compactification); [8.19 Functoriality on minimal compactifications](#819-functoriality-on-minimal-compactifications), with the exact supplier contracts above.

### Examples

At full `N=3` the `j`-map has degree `|GL₂(ℱ₃)|/2=24` and two geometric pairing components; its maximal-level target is not neat and it ramifies at elliptic points. For maximal level and `g=diag(p,1)`, both `T_p` legs have degree `p+1`. Full `N=6` compactification uses generalized elliptic curves rather than prime-only diamond quotients. At the infinity cusp of full `N`-level, `q_c=exp(2πiz/N)` and `q=q_c^N`. Minimal extensions can ramify at cusps even when the open maps are étale.

### Dependencies

The external inputs are [AdelicAlgebraicGroups, §5.2, GL₂ over ℚ and principal levels](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md#52-gl₂-over-ℚ-and-principal-levels); [AlgebraicModuliForArithmeticGeometry, §3.5, polarized descent, with local §4.9b field descent](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#35-geometric-comparisons-and-polarized-descent); [AlgebraicModuliForArithmeticGeometry, §5.4, closures and normalization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#54-closures-and-normalization); [ComplexComparisonPartII, §C−1.1, analytic spaces and analytification](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#c11-analytic-local-models-and-scheme-analytification) and [ComplexComparisonPartII, Layer C0, coherent analytic modules](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c0-coherent-analytic-modules-and-coherent-analytification); [ComplexComparisonPartII, Layer C4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ComplexComparisonPartII/README.md#layer-c4-analytic-images-chow-algebraization-and-morphism-comparison); [ModularCurvesPartII, §§1.2–1.5, lattice uniformization and the analytic Weil pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#15-the-analytic-weil-pairing-comparison); [ModularCurvesPartII, §3.14, open modular uniformization](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#314-open-modular-uniformization-with-the-specified-level); [ModularCurvesPartII, §§6.1–6.2 and 4.8, compact comparison and cusp parameters](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#61-compact-analyticalgebraic-modular-comparison); [ModularCurvesPartII, §4.10, geometric connectedness of a fixed-pairing curve](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#410-geometric-connectedness-of-a-fixed-pairing-curve); [ModularCurvesPartII, §§7.1a, 7.3–7.4 and 9.1–9.3, differentials and isogeny correspondences](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#71a-kodairaspencer-normalization-r125); [ModularCurvesPartII, §§8.3–8.5, component fields, conjugation and level compatibility](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#83-component-fields-and-symplectic-descent); [ModularCurvesPartII, §§5.2, 5.15–5.16 and 5.19, coarse compactifications](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#52-integral-coarse-modular-curves); [ModularCurvesPartII, §§4.1–4.8, 5.11 and 6.3, formal cusps and cusp fields](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurvesPartII/README.md#63-cusp-fields-and-pairing-components); [5.0 Rational polarized Siegel moduli](#50-rational-polarized-siegel-moduli); [8.9 Full-level modular model is canonical](#89-canonical-reciprocity-for-full-elliptic-level); [8.9 Full-level modular model is canonical](#89-canonical-reciprocity-for-full-elliptic-level); [Local datum foundations, §P.3](#p3-hodge-filtrations-and-reflex-fields); [Local datum foundations, §P.1](#p1-pure-data-and-special-pairs); [Local datum foundations, §P.4](#p4-levels-and-basic-examples); `AlgebraicGeometry.IsFinite`; `AlgebraicGeometry.IsOpenImmersion`; `AlgebraicGeometry.IsProper`; `AlgebraicGeometry.Scheme`; `CategoryTheory.Functor`; `CategoryTheory.Limits.span`; `CategoryTheory.Limits.spanCompIso`; `CategoryTheory.Over`; `CategoryTheory.Over.pullback`; `CategoryTheory.Over.pullbackComp`; `CategoryTheory.Over.pullbackId`; [ModularCurves, 0d finite étale schemes and galois actions](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#0d-finite-étale-schemes-and-galois-actions); [ModularCurves, 5a tate normal form and y₁n for n4](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5a-tate-normal-form-and-y₁n-for-n4); [ModularCurves, 5b full ordered bases and fixed pairing](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#5b-full-ordered-bases-and-fixed-pairing); [ModularCurves, 9d coarse moduli schemes and finite quotients](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#9d-coarse-moduli-schemes-and-finite-quotients); [ModularCurves, 9e the coarse j line and y₀n](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md#9e-the-coarse-j-line-and-y₀n).

Earlier constructions used here are 0.5 Finite analytic component decomposition; 0.6 Abelianized component formula; 1.3 Holomorphic finite level maps; 1.4 Holomorphic right translations; 1.5 Holomorphic Hecke correspondences; 1.7 Compact-open level category; 2.1 Rational boundary components and incidence; 2.7 Baily–Borel algebraization; 2.8 Koecher principle and boundary codimension; 2.9 `Level` maps on minimal compactifications; 3.10 Logarithmic canonical section embedding; 3.4 Algebraic maps of Shimura data; 3.5 Algebraic finite quotients and normalization; 3.8 Complex minimal compactification functoriality; 3.9 Codimension-one boundary and auxiliary data; 4.1 Milne geometric Artin conversion; 4.10 Disjoint special reflex fields; 4.11 Hecke translation over the reflex field; 4.12 Uniqueness of canonical models; 4.2 Reflex norm of a special torus; 4.3 Finite-level reciprocity and idele independence; 4.4 Canonical-model condition; 4.5 Finite étale torus canonical models; 4.8 Density of Hecke translates; 4.9 Reflex norm under a torus morphism; 5.11 Polarization and level in CM reciprocity; 5.12 Siegel special points are full CM; 5.13 The Siegel canonical model; 5.10 Main theorem of complex multiplication; 6.7 Canonical models of abelian type; 7.14 Canonical models for every pure datum.

## Downstream consumers

HilbertModularVarietiesAndShimuraCurves specializes the canonical towers, datum functoriality, finite level maps and modular-curve comparisons of Layer 8. PerfectoidShimuraVarieties uses the component and stabilizer results of Layer 0, the analytic points and translations of Layer 1, the Baily–Borel compactification and the towers of Layer 8; HodgeTateAndCanonicalSubgroups uses the general-data minimal compactification. CompletedCohomologyPartII uses the canonical towers and Hecke correspondences of Layer 8, and HeegnerPointEulerSystems the CM theory of Layer 5. ShimuraCompactifications consumes the canonical open, complex minimal boundary, arithmetic minimal model and extended finite legs to build toroidal models; it supplies no prerequisite to this construction. AutomorphicBundles uses the actual canonical tower for its descent. Arithmetic intersection and cohomology developments use normal projective minimal models, component fields and cusp comparisons. ComplexMultiplicationAndExplicitReciprocity uses the CM types, reflex fields and reflex norms of Section 5.1, the main theorem and the polarization formula; its explicit reciprocity applications do not feed back into Layer 5.

## References

Page numbers below are those of the specified editions. The numbered claims above retain the narrower hypotheses used here. Statements drawn from surveys still require their indicated metric, convergence, rigidity or descent arguments to be constructed; a citation of an existence theorem does not supply that construction.

- `J`. `S`. Milne, [Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), Revised 16 September 2017.
- `J`. `S`. Milne, [The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf), Author article `2007c`.
- `J`. `S`. Milne, [Complex Multiplication](https://www.jmilne.org/math/CourseNotes/CM.pdf), course notes, version of 14 July 2020; §1, pp.11–18.
- `J`. `S`. Milne, [The action of an automorphism of C on a Shimura variety and its special points](https://jmilne.org/math/articles/1983a.pdf), Progress in Mathematics `35 (1983)`, pp.239–265; annotated author scan.
- `J`. `S`. Milne, [Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), Michigan Mathematical Journal `46 (1999)`; author version dated 22 September 1998.
- `B`. Bakker, `B`. Klingler, `J`. Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf), Author manuscript of JAMS `(2020)`.
- `B`. Bakker, `B`. Klingler, `J`. Tsimerman, [Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf), Author erratum.
- B. Bakker, T. W. Grimm, C. Schnell, J. Tsimerman, [Finiteness for self-dual classes in integral variations of Hodge structure](https://arxiv.org/abs/2112.06995v1), arXiv:2112.06995v1, Proposition 28.1, pp.14–15.
- `F`. Andreatta, `E`. `Z`. Goren, `B`. Howard, `K`. Madapusi Pera, [Faltings heights of abelian varieties with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Annals of Mathematics `187 (2018)`, pp.391–531.
- `J`. `S`. Milne and `K`.-`y`. Shih, [Langlands’s construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf), LNM `900 (1982)`, pp.229–260; author scan.
- `J`. `S`. Milne and `K`.-`y`. Shih, [Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf), LNM `900 (1982)`, pp.280–356; author scan.
- `B`. Conrad, [Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf), Public Darmon CM notes (2011 directory).
- `V`. `P`. Platonov and A. `S`. Rapinchuk, [On the group of rational points of three-dimensional groups](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), Dokl. Akad. Nauk SSSR `247:2 (1979)`, pp.279–282; Russian published original hosted by the coauthor.
- `D`. Kazhdan, [On arithmetic varieties II](https://doi.org/10.1007/BF02760617), Israel Journal of Mathematics `44 (1983)`, pp.139–159.
- `J`. `S`. Milne, [Kazhdan’s theorem on arithmetic varieties](https://www.jmilne.org/math/articles/1984T.pdf), §§2–4, pp.9–22.
- `S`.-`T`. Yau, [On the Ricci curvature of a compact Kähler manifold and the complex Monge–Ampère equation, I](https://doi.org/10.1002/cpa.3160310304), Communications on Pure and Applied Mathematics `31 (1978)`, pp.339–411.
- `W`. `L`. Baily, Jr. and A. Borel, [Compactification of arithmetic quotients of bounded symmetric domains](https://annals.math.princeton.edu/1966/84-3/p11), Annals of Mathematics `84:3 (1966)`, pp.442–528; published article, OCR reproduction.
- Tau Ceti Project, [Adelic algebraic groups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/AdelicAlgebraicGroups/README.md).
- `J`. `S`. Milne, [Modular Functions and Modular Forms](https://www.jmilne.org/math/CourseNotes/MF.pdf), Version 1.31, 22 March 2017.
- Richard Pink, [Arithmetical Compactification of Mixed Shimura Varieties](https://people.math.ethz.ch/~pink/ftp/phd/PinkDissertation.pdf), Author-typeset dissertation; numbering/pages of this copy.
- Pierre Deligne, [Travaux de Shimura, Séminaire Bourbaki, exposé 389](https://www.numdam.org/item/SB_1970-1971__13__123_0.pdf), Version of record, 1970–1971, pp.123–165.
- Tau Ceti contributors, [Tau Ceti roadmap: Modular curves](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularCurves/README.md).
- `B`. Klingler, `E`. Ullmo, A. Yafaev, [The hyperbolic Ax-Lindemann-Weierstrass conjecture](https://www.numdam.org/item/10.1007/s10240-015-0078-9.pdf), Publications mathematiques de `l`’IHES `123 (2016)`, pp.333–360.
- Tau Ceti Project, [Reductive groups, Part II: local structure and integral Satake theory](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ReductiveGroupsPartII/README.md).
- Pierre Deligne, [Variétés de Shimura: interprétation modulaire, et techniques de construction de modèles canoniques](https://www.math.ias.edu/sites/default/files/34_VarietesdeShimura.pdf), Proceedings of Symposia in Pure Mathematics 33, part `2 (1979)`, pp.247–289; primary IAS scan.
