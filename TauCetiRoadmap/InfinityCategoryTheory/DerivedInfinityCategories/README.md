# Roadmap: derived ∞-categories of abelian categories

**Summary.** This Part builds the derived ∞-categories of an abelian category as stable ∞-categories with
t-structures, starting from Tau Ceti's differential graded nerve.

It builds on the stable ∞-categories and t-structures of Part StableInfinityCategories, the localizations of Part
AdjunctionsAndLocalizations, and the dg categories of DGAInfinity.

- **Dg nerves (Layer 1).** The dg nerve compared with the coherent nerve of the underlying simplicial category.
- **Chain complexes (Layer 2).** The dg nerve of chain complexes in any additive category is stable, with
  cofibers given by mapping cones.
- **Localizations of model categories (Layer 3).** The localization `C[W⁻¹]` and the underlying ∞-category of a
  model category, including the Dwyer–Kan comparison for simplicial model categories.
- **`D⁻(A)` (Layers 4–5).** The right-bounded derived ∞-category of an abelian category with enough projectives,
  and its universal properties.
- **`D(A)` (Layer 6).** The injective model structure, and the unbounded derived ∞-category of a Grothendieck
  abelian category.

**Headline theorems.**
- Functors out of the connective part `D⁻_{≥0}(A)` are described by their restriction to projective objects (HA,
  Thm. 1.3.3.8).
- The universal property of `D⁻(A)` among stable ∞-categories with left complete t-structures (HA, Thm. 1.3.3.2).
- The recognition criterion for `D⁻` (HA, Prop. 1.3.3.7).
- `D⁻(A)` is the localization of bounded complexes at quasi-isomorphisms (HA, Thm. 1.3.4.4).
- The Dwyer–Kan theorem (HA, Thm. 1.3.4.20).
- Existence of the injective model structure on chain complexes in a Grothendieck abelian category (HA,
  Prop. 1.3.5.3).
- `D(A)` is stable (HA, Prop. 1.3.5.9).
- `D(A)` is presentable, with an accessible, right complete t-structure compatible with filtered colimits (HA,
  Prop. 1.3.5.21).
- Comparisons with Mathlib: the homotopy categories of `D⁻(A)` and `D(A)` are Mathlib's bounded-above and unbounded derived categories, as triangulated categories, and the triangulated homotopy category of the dg nerve of chain complexes is
  Mathlib's triangulated homotopy category of complexes, with the shift and the signs of the mapping-cone triangle
  fixed explicitly (§2.4).

## Scope and ownership

Instances of the constructions of this Part for particular abelian categories, such as sheaves of modules, are left to downstream work.

Dg categories, their `Z⁰` and `H⁰` categories, dg functors, full dg subcategories and quasi-equivalences are DGAInfinity's (Layer 1, with Hom complexes and signs in Layer 0); this Part cites them (HA, Def. 1.3.1.1, Remarks 1.3.1.4 and 1.3.1.5, Def. 1.3.1.18, pp. 80–85).

Tau Ceti already has, and this Part cites (see `## Exact supplier contracts`): the implemented part of DGAInfinity, Layer 1; the dg nerve and its quasicategory structure (HA, Construction 1.3.1.6, Prop. 1.3.1.10, pp. 81–82); its homotopy category and right mapping spaces (HA, Remarks 1.3.1.11 and 1.3.1.12, p. 83); the underlying simplicial category with Kan mapping objects (HA, Construction 1.3.1.13, Remark 1.3.1.14, pp. 83–84); Moore's theorem (HA, Cor. 1.3.2.12, p. 90); the K-injective dg model of Mathlib's derived category; and the lifting characterization of injectively fibrant complexes with its reduction to a small set of monomorphic quasi-isomorphisms (with Mathlib, HA, Prop. 1.3.5.6, pp. 124–125).

Mathlib and Tau Ceti already have the acyclicity of Hom complexes into K-injective complexes from acyclic ones and the uniqueness of K-injective replacements. Mathlib already has the 1-categorical derived category with its standard t-structure; Grothendieck abelian categories and their enough injectives (HA, Cor. 1.3.5.7, p. 124); the factorization of maps of complexes into a monomorphism followed by a map lifting against all monomorphisms; the injective model structure on bounded-below complexes; the small object argument; Ind-objects of an abelian category; and the Dold–Kan correspondence.

Stable ∞-categories, t-structures, t-exact functors (HA, Def. 1.3.3.1), left completeness, t-structures compatible with filtered colimits (HA, Def. 1.3.5.20) and the ∞-categorical Dold–Kan correspondence belong to Part StableInfinityCategories (§3.5 and §11.5 for the two definitions). Presentability, `P_Σ` and HA Lemma 1.3.3.10 belong to Part PresentableInfinityCategories (§7.6 for the lemma). This Part cites them. Model categories, Kan–Quillen and simplicial model categories are ModelCategoryTheory's.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.3.2` here and `Part DerivedInfinityCategories §2.3.2`
elsewhere, is one target.

- **∞-categories.** An ∞-category is a quasicategory: an object of `SSet` with Mathlib's `SSet.Quasicategory` instance. Its homotopy category is Mathlib's `SSet.HomotopyCategory`.

  **Check.** For an ordinary category the nerve is a quasicategory whose homotopy category is the category itself, so a convention that used Kan complexes would wrongly exclude the nerve of `[1]`.

- **Grading.** HA writes chain complexes homologically, with differentials of degree −1. Mathlib and Tau Ceti use cochain complexes `CochainComplex A ℤ`. We read HA's chain degree n as cochain degree −n, so `H_n` is `H^{−n}`. An element of HA's degree p in a mapping complex is a Tau Ceti morphism of degree −p.

  **Check.** A chain homotopy in HA's grading lies in degree 1 of `Map(X, Y)`. In Tau Ceti's grading it has degree −1, and Tau Ceti's boundaries in degree 0 are exactly the differentials of degree −1 elements. Using degree +1 would identify cycles modulo the wrong subgroup.

- **Signs in mapping complexes.** HA's differential on `Map_{Ch(A)}(M, N)_p` is `d ∘ f − (−1)^p f ∘ d` (HA, Def. 1.3.2.1, p. 88). Mathlib's differential on the Hom complex `CochainComplex.HomComplex` of a degree n cochain is `d ∘ z + (−1)^(n+1) z ∘ d`. With n = −p, these are the same formula.

  **Check.** In degree 0, both differentials send f to `d ∘ f − f ∘ d`, so the cycles are exactly the chain maps. A sign convention `d ∘ f + f ∘ d` would make the identity of a complex with nonzero differential a non-cycle.

- **Composition order.** HA composes `g ∘ f` with the Leibniz rule carrying the sign of g (HA, Def. 1.3.1.1, p. 80). Tau Ceti's `TauCeti.dgComp f g` is f followed by g, with the sign carried by f. HA's `g ∘ f` is Tau Ceti's Keller-ordered composite, `(−1)^(pq)` times `dgComp f g`, for f of degree p and g of degree q.

  **Check.** For f and g of degree 0 there is no sign. For f and g both of odd degree the two products differ by −1, and the Leibniz rule of HA holds for the Keller-ordered product but fails for the unsigned one on a pair with `d f ≠ 0`.

- **Coefficients and universes.** HA works over ℤ. We work over a commutative ring `R : Type v` and an abelian category `A : Type u` with `[Category.{v} A]` and `[Linear R A]`, as Tau Ceti's enrichment of cochain complexes requires. The dg nerve depends only on the underlying abelian groups of the mapping complexes, so the choice of R does not change any simplicial set built here.

  **Check.** With `v = 0`, R = ℤ and any preadditive A with small Hom sets, this is HA's setting verbatim. For A the category of R-modules over a field R, the R-linear and ℤ-linear dg nerves have the same n-simplices for every n.

- **t-structures.** Following HA, t-structures are homological: `C_{≥0}` is the connective part, and `C_{≥n}` consists of objects whose homology vanishes below n. Mathlib's `Triangulated.TStructure` is cohomological. HA's `C_{≥n}` corresponds to Mathlib's `le (−n)`, HA's `C_{≤n}` to Mathlib's `ge (−n)`, and the hearts agree.

  **Check.** The complex ℤ placed in HA's chain degree 1 has `H_1 = ℤ`. It lies in HA's `D_{≥1}` and in Mathlib's `le (−1)`, and not in `le (−2)`. Reading HA's `≥ n` as Mathlib's `ge n` would exclude it from `D_{≥1}`, since `ge 1` requires `H^{−1} = 0`.

- **Shifts.** HA's `M[1]` has `M[1]_n = M_{n−1}`. This is Mathlib's shift `⟦1⟧` on `CochainComplex A ℤ`, whose degree k term is the degree `k+1` term of M, and it is the suspension in the stable ∞-categories below.

  **Check.** For M = ℤ in degree 0, `M[1]` has ℤ in HA's degree 1, which is cochain degree −1. Mathlib's `M⟦1⟧` has ℤ in degree −1 as well, while `M⟦−1⟧` has it in degree 1.

- **Boundedness.** HA's `Ch⁻(A)` consists of the complexes with `M_n = 0` for n sufficiently negative, which in cochain degrees means `M.X k = 0` for k sufficiently large. These are Mathlib's bounded-above cochain complexes, and the corresponding derived category is Mathlib's `DerivedCategory.Minus`.

  **Check.** A projective resolution `⋯ → P_1 → P_0` lies in `Ch⁻(A)`. An injective resolution placed in degrees `0, −1, −2, …` does not.

- **Localizations.** "Reflective localization" means a full subcategory whose inclusion has a left adjoint (HTT, Def. 5.2.7.2, p. 383, where it is called a localization). "Localization at W" means `C[W⁻¹]` of Part AdjunctionsAndLocalizations §2.4 (HA, Def. 1.3.4.1).

  **Check.** The inclusion of `D(A)` into `N_dg(Ch(A))` is a reflective localization (§6.6) and also a localization at the quasi-isomorphisms (Part AdjunctionsAndLocalizations §2.4 (HA, Example 1.3.4.3)). The inclusion of a non-reflective full subcategory is neither.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib:
- quasicategories: `SSet.Quasicategory`, `SSet.KanComplex`, `SSet.HomotopyCategory` (`AlgebraicTopology/SimplicialSet/HomotopyCat.lean`); nerves `CategoryTheory.nerve` with `CategoryTheory.nerve.homEquiv`, `SSet.uliftFunctor`, `SSet.opFunctor`, `SSet.Subcomplex.homOfLE`, full subcategories `CategoryTheory.ObjectProperty.FullSubcategory`, and precomposition `CategoryTheory.MonoidalClosed.pre` on functor simplicial sets;
- the coherent nerve: `CategoryTheory.SimplicialNerve` and `CategoryTheory.SimplicialThickening` (`AlgebraicTopology/SimplicialNerve.lean`);
- enriched categories and functors: `CategoryTheory.EnrichedCategory`, `CategoryTheory.EnrichedFunctor`;
- cochain complexes: `CochainComplex`, `HomologicalComplex.quasiIso`, the Hom complexes `CochainComplex.HomComplex`, the homotopy category `HomotopyCategory`, and K-injective complexes `CochainComplex.IsKInjective` with `CochainComplex.isKInjective_of_injective` and `CochainComplex.IsKInjective.eq_δ_of_cocycle`, that every cocycle from an acyclic complex into a K-injective complex is a coboundary (`Algebra/Homology/HomotopyCategory/KInjective.lean`);
- mapping cones and the triangulated homotopy category of complexes: `CochainComplex.mappingCone` with `CochainComplex.mappingCone.inr` and `CochainComplex.mappingCone.fst` (`Algebra/Homology/HomotopyCategory/MappingCone.lean`), the triangle `CochainComplex.mappingCone.triangle` and the `Pretriangulated` instance on `HomotopyCategory A (ComplexShape.up ℤ)` (`Algebra/Homology/HomotopyCategory/Pretriangulated.lean`), its `IsTriangulated` instance (`Algebra/Homology/HomotopyCategory/Triangulated.lean`), commutation with shifts `CategoryTheory.Functor.CommShift` (`CategoryTheory/Shift/CommShift.lean`) and triangulated functors `CategoryTheory.Functor.IsTriangulated` (`CategoryTheory/Triangulated/Functor.lean`);
- the derived category `DerivedCategory`, `HasDerivedCategory`, its t-structure `DerivedCategory.TStructure.t` and `DerivedCategory.Minus` (`Algebra/Homology/DerivedCategory/TStructure.lean`), and `Triangulated.TStructure`;
- projective and injective objects: `CategoryTheory.Projective`, `CategoryTheory.EnoughProjectives`, `CategoryTheory.Injective`, `CategoryTheory.EnoughInjectives`;
- Grothendieck abelian categories: `CategoryTheory.IsGrothendieckAbelian`, the instance `IsGrothendieckAbelian.enoughInjectives` (`CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean`), which is HA, Cor. 1.3.5.7, and `IsGrothendieckAbelian.preservesColimit_coyoneda_obj_of_mono` (`CategoryTheory/Abelian/GrothendieckCategory/ColimCoyoneda.lean`);
- Ind-objects: `CategoryTheory.Ind` and its abelian structure (`CategoryTheory/Abelian/Indization.lean`);
- universe enlargement: `CategoryTheory.AsSmall`, a small category equivalent to a given one in a larger universe (`CategoryTheory/Category/ULift.lean`);
- the Dold–Kan correspondence: `CategoryTheory.Abelian.DoldKan.equivalence` and `CategoryTheory.Idempotents.DoldKan.equivalence`; the normalized Moore complex `AlgebraicTopology.normalizedMooreComplex` (HA, Def. 1.2.3.9, p. 56);
- model categories and lifting properties: `HomotopicalAlgebra.ModelCategory` (`AlgebraicTopology/ModelCategory/Basic.lean`), `MorphismProperty.rlp`, `MorphismProperty.HasFactorization`, `MorphismProperty.monomorphisms`, `MorphismProperty.IsStableUnderFilteredColimits` (`CategoryTheory/MorphismProperty/Limits.lean`), and the horn inclusions `SSet.modelCategoryQuillen.J` (`AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`);
- the small object argument: `MorphismProperty.HasSmallObjectArgument` and its functorial factorization (`CategoryTheory/SmallObject/Basic.lean`);
- for the combinatoriality and left properness clauses of the injective model structure: local presentability `CategoryTheory.IsLocallyPresentable` (`CategoryTheory/Presentable/LocallyPresentable.lean`), small classes of morphisms `MorphismProperty.IsSmall` (`CategoryTheory/MorphismProperty/IsSmall.lean`), left lifting classes `MorphismProperty.llp` (`CategoryTheory/MorphismProperty/LiftingProperty.lean`), pushout squares `CategoryTheory.IsPushout` (`CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean`), and the generating monomorphisms `IsGrothendieckAbelian.generatingMonomorphisms` of a Grothendieck abelian category (`CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean`);
- for a Grothendieck abelian category, the instance that cochain complexes form a Grothendieck abelian category (`Algebra/Homology/GrothendieckAbelian.lean`) and the instance `HasFunctorialFactorization (monomorphisms C) (monomorphisms C).rlp` of `CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean`, applied to `C = CochainComplex A ℤ`.

Nothing beyond the stated declarations is assumed of them.

### From Tau Ceti

At the pinned Tau Ceti:
- dg categories (`TauCeti/CategoryTheory/DG/`): `TauCeti.DGCategory`, `TauCeti.dgComp`, `TauCeti.DGHomotopyCategory`, `TauCeti.DGFullSubcategory`; the dg category of cochain complexes in an R-linear category, `TauCeti.linearHomComplexEnrichedCategory` (`TauCeti/Algebra/Homology/LinearHomComplex/Enrichment.lean`), with `TauCeti.homotopyCategoryToDGHomotopyCategory` (`DG/CochainComplex/HomotopyCategory.lean`) comparing its homotopy category with Mathlib's;
- the dg nerve (`TauCeti/AlgebraicTopology/DGNerve/`): `TauCeti.dgNerve` with its vertices `TauCeti.dgNerveEquiv` (HA, Construction 1.3.1.6, p. 81), `TauCeti.dgNerve.quasicategory` (HA, Prop. 1.3.1.10, p. 82), `TauCeti.dgNerve.homotopyCategoryEquiv` (HA, Remark 1.3.1.11, p. 83), `TauCeti.dgNerve.fromNerve` and `TauCeti.dgNerve.nerveIso`, `CategoryTheory.EnrichedFunctor.mapDGNerve`, `TauCeti.DGFullSubcategory.dgNerveIso` (the dg nerve of a full dg subcategory is the full subcategory), `TauCeti.dgNerve.isInitialVertex_cochainComplex_of_isZero` and `TauCeti.dgNerve.isTerminalVertex_cochainComplex_of_isZero` (zero complexes are zero objects), `TauCeti.dgNerve.isEquivalence_edgeMk_iff` (a degree-0 cycle is an equivalence exactly when its class in `H⁰` is invertible);
- right mapping spaces of the dg nerve (HA, Remark 1.3.1.12, p. 83): `TauCeti.dgNerve.rightMappingSpaceIso` and `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`, identifying `Hom^R_{N_dg(C)}(X, Y)` with the Dold–Kan simplicial set of `τ_{≥0} Map_C(X, Y)` (with the sign `(−1)^C(k,2)` on a coherence indexed by a set of size `k+1`), and `TauCeti.dgNerve.rightMappingSpacePiAddEquivHomology`, `π_{n+1}` at the zero morphism as homology of the Hom complex;
- the underlying simplicial category `TauCeti.DGSimplicialCategory` (`DG/Simplicial.lean`), with Kan mapping objects `TauCeti.cochainToSSet` of the Hom complexes (good truncation, Dold–Kan, forgetful functor) and composition through Alexander–Whitney maps (HA, Construction 1.3.1.13, Remark 1.3.1.14, pp. 83–84);
- simplicial sets and quasicategories: `SSet.join`, `SSet.coslice` with `SSet.coslice.objEquiv` and colimit cocones `SSet.coslice.IsColimit`, `SSet.CartesianFibration`, `SSet.fullEnhancedSubcategory`, vertices of functor quasicategories `SSet.ihomObj₀Equiv`, equivalences `SSet.Edge.IsEquivalence`, fully faithful maps `SSet.IsFullyFaithful` and categorical equivalences `SSet.QCat.IsCategoricalEquivalence`;
- Moore's theorem `SSet.kanComplex_of_addGroup` (HA, Cor. 1.3.2.12, p. 90), and homotopy groups of simplicial abelian groups as homology of the normalized Moore complex, `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology` and `CategoryTheory.SimplicialObject.piZeroEquivNormalizedMooreComplexHomology` (HA, Remark 1.2.3.14, p. 58);
- K-injective models: `TauCeti.HasKInjectiveResolutions`, the uniqueness of K-injective replacements up to homotopy equivalence `CochainComplex.IsKInjective.exists_homotopyEquiv` (`TauCeti/Algebra/Homology/DerivedCategory/KInjective.lean`), `TauCeti.KInjectiveDGCategory` and `TauCeti.KInjectiveDGCategory.dgNerveHomotopyCategoryEquiv`, identifying the homotopy category of the dg nerve of K-injective complexes with Mathlib's derived category when K-injective resolutions exist;
- lifting in unbounded complexes (`TauCeti/Algebra/Homology/ModelCategory/`): `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero`, that a complex lifts against monomorphic quasi-isomorphisms exactly when it is a K-injective complex of injectives (no Grothendieck hypothesis); with Mathlib's `CochainComplex.isKInjective_of_injective` this gives HA, Prop. 1.3.5.6, pp. 124–125. For A Grothendieck abelian, the class `CochainComplex.monoQuasiIsoOfCardinalLT κ` of monomorphic quasi-isomorphisms whose target has fewer than κ subobjects, and `CochainComplex.exists_rlp_monoQuasiIsoOfCardinalLT_eq`: for large κ, lifting against this class and against all monomorphic quasi-isomorphisms agree.

### From TauCetiRoadmap.DGAInfinity

- Layer 0: the k-linear Hom complex of cochain complexes with its enrichment, graded signs and the Koszul braiding comparing composition orders.
- Layer 1: dg categories as categories enriched in cochain complexes, their `Z⁰` and `H⁰` categories, dg functors, full dg subcategories and quasi-equivalences. Under the Conventions these are HA's dg categories, their underlying and homotopy categories, and dg functors (HA, Def. 1.3.1.1, Remarks 1.3.1.4 and 1.3.1.5, pp. 80–81; Def. 1.3.1.18, p. 85, stated by HA over a field but used here over any commutative ring).

### From TauCetiRoadmap.InfinityCategoryTheory

Earlier Parts of this family, in merge order:
- Definitions, by owner Part: functor ∞-categories and full subcategories (Part InfinityCategoryFoundations §1.2, HTT, §1.2.7, Notation 1.2.7.2, §1.2.11); limits and colimits (Part InfinityCategoryFoundations §1.2, HTT, Def. 1.2.13.4); fully faithful functors (Part InfinityCategoryFoundations §2.1, HTT, Def. 1.2.10.1); smallness (Part InfinityCategoryFoundations §1.1, HTT, §1.2.15); n-categories and truncated objects (Part InfinityCategoryFoundations §10.1, HTT, Def. 2.3.4.1, Def. 5.5.6.1); coCartesian fibrations (Part CartesianFibrations §1.1, HTT, Def. 2.4.2.1); marked simplicial sets (Part CartesianFibrations §5.1, HTT, Def. 3.1.0.1); adjunctions (Part AdjunctionsAndLocalizations §1.1, HTT, §1.2.7 and Def. 5.2.2.1); reflective localizations (Part AdjunctionsAndLocalizations §2.1, HTT, Def. 5.2.7.2); the Yoneda embedding (Part PresheavesAndCompletions §1.1, HTT, §5.1.3); filtered and sifted ∞-categories (Part PresheavesAndCompletions §4.1, §5.1, HTT, Defs. 5.3.1.7, 5.5.8.1); Ind (Part PresheavesAndCompletions §6.1, HTT, Def. 5.3.5.1); accessible and presentable ∞-categories (Part AccessibleInfinityCategories §4.1, Part PresentableInfinityCategories §1.1, HTT, Defs. 5.4.2.1, 5.5.0.1); zero objects (Part InfinityCategoryFoundations §1.2, HTT, Def. 7.2.2.7); triangles, fibers and cofibers, and stable ∞-categories (Part StableInfinityCategories §1.1, HA, Defs. 1.1.1.1, 1.1.1.4, 1.1.1.6, 1.1.1.9).
- Part InfinityCategoryFoundations: essentially surjective functors (§2.4, HTT, §1.2.10); the coherent nerve of a locally Kan category is a quasicategory (§2.6, HTT, Prop. 1.1.5.10); fibrant simplicial categories (§2.7, HTT, Remark 1.1.4.3); colimits in an ∞-category (§5.5, HTT, Remark 1.2.13.5); right mapping spaces and the comparison maps of HTT §2.2.2 (§7.3, HTT, Props. 2.2.2.7, 2.2.2.9, 2.2.2.13); n-categories through their mapping spaces (§10.6, HTT, Prop. 2.3.4.18).
- Part CartesianFibrations: coCartesian edges (§1.5, HTT, §2.4.1) and their criterion (§1.7, HTT, Prop. 2.4.4.3); functor ∞-categories are ∞-categories (§3.4, HTT, Prop. 1.2.7.3); correspondences (§4.1, HTT, Def. 2.3.1.3); the Cartesian model structure on marked simplicial sets over a point (§5.7, HTT, Prop. 3.1.3.7).
- Part LimitsAndKanExtensions: homotopy colimits in simplicial categories versus colimits in the coherent nerve (§3.1, §3.2, HTT, Prop. 4.2.4.4, Thm. 4.2.4.1), applied to large simplicial categories object by object (§3.3, *Size*); Kan extensions along full inclusions (§7.4, HTT, Prop. 4.3.2.15); pointwise limits in functor ∞-categories (§8.2, HTT, Prop. 5.1.2.2); simplicial objects and geometric realizations (§9.4, HTT, Notation 6.1.2.12).
- Part AdjunctionsAndLocalizations: adjunctions (§1.3, HTT, Def. 5.2.2.7); reflective subcategories (§2.2, HTT, Def. 5.2.7.6, Remark 5.2.7.9); reflective localizations (§2.3, HTT, Prop. 5.2.7.8); the localization `C[W⁻¹]` (§2.4, HA, Def. 1.3.4.1, Example 1.3.4.3); the underlying ∞-category of a model category and its invariance (§2.6, HA, Def. 1.3.4.15, Remark 1.3.4.16).
- Part Straightening: limits of ∞-categories (§3.2, HTT, Prop. 3.3.3.1).
- Part PresheavesAndCompletions: sifted colimits and `P_Σ` through simplicial objects (§5.3, HTT, Lemma 5.5.8.4); Ind (§6.5, HTT, Lemma 5.3.5.7).
- Part AccessibleInfinityCategories: accessible subcategories (§7.1, HTT, Prop. 5.4.6.6).
- Part PresentableInfinityCategories: freely adjoining colimits of a given class (§4.7, HTT, Prop. 5.3.6.2); truncation functors, Postnikov towers and Postnikov completeness (§6.2–§6.4, HTT, Prop. 5.5.6.18, Def. 5.5.6.23, Prop. 5.5.6.26; SAG, Def. A.7.2.1); `P_Σ`, its truncated objects and additive presheaves (§7.1, §7.3, §7.5, HTT, Def. 5.5.8.8, Prop. 5.5.8.10, Prop. 5.5.8.15, Rem. 5.5.8.26); colimits in n-categories from coproducts and geometric realizations, and geometric realizations in n-categories as finite colimits (§7.6, HA, Lemma 1.3.3.10, fourth assertion); combinatorial simplicial model categories present presentable ∞-categories (§8.1, HTT, Prop. A.3.7.6); Quillen's model structure on simplicial objects and Bergner's comparison (§9.1, §9.4, HTT, Prop. 5.5.9.1, Cor. 5.5.9.3, Prop. 5.5.9.14).
- Part StableInfinityCategories: suspension and loops (§1.3, HA, §1.1.2, construction following Def. 1.1.2.5); additive categories (§1.4, HA, Def. 1.1.2.1); the additive structure of the homotopy category (§1.5, HA, Lemma 1.1.2.10); distinguished triangles and the triangulation theorem (§1.6, §1.7, HA, Def. 1.1.2.11, Thm. 1.1.2.14); Ext groups (§1.8, HA, Not. 1.1.2.17); stable subcategories (§2.1, HA, Def. 1.1.3.2, Lemma 1.1.3.3); t-structures, truncations and hearts (§3.1–§3.3, HA, Defs. 1.2.1.1, 1.2.1.4, 1.2.1.11, Remark 1.2.1.8, Remark 1.2.1.12, p. 40); t-exact functors (§3.5, HA, Def. 1.3.3.1); chain complexes, Dold–Kan and Alexander–Whitney (§5.1–§5.4, HA, Def. 1.2.3.1, Remark 1.2.3.4, Construction 1.2.3.5, Thm. 1.2.3.7, Notation 1.2.3.10, Remark 1.2.3.11, Lemma 1.2.3.12, Construction 1.2.3.22, Remark 1.2.3.25, Example 1.2.3.26); the pointed stability criterion (§7.5, HA, Cor. 1.4.2.27); bounded t-structures and left completeness (§8.1, HA, Prop. 1.2.1.17, Prop. 1.2.1.19 and the definitions after Props. 1.2.1.16 and 1.2.1.17); accessible t-structures (§11.2, HA, Def. 1.4.4.12); t-structures compatible with filtered colimits (§11.5, HA, Def. 1.3.5.20).
- Part InfinityTopoi: Postnikov sections of Kan complexes are the truncations in S, and truncation preserves finite products (§12.2, HTT, Rem. 5.5.6.4, Lemma 6.5.1.2).
- Part PrestableInfinityCategories: Grothendieck prestable ∞-categories (§4.1, SAG, Prop. C.1.4.1, Def. C.1.4.2), used in the Layer 6 Examples only.

### From TauCetiRoadmap.ModelCategoryTheory

- Part ModelCategories: weakly saturated classes (§1.3, HTT, Def. A.1.2.2); model categories (HTT, Def. A.2.1.1, which is Mathlib's `HomotopicalAlgebra.ModelCategory`); left and right properness and homotopy pushouts (§3.4, §3.5, HTT, Def. A.2.4.1, Remark A.2.4.5, and §A.2.4 after Lemma A.2.4.3, p. 833); Quillen adjunctions and equivalences (§4.1, §4.2, HTT, §A.2.5, p. 835, and Prop. A.2.5.1); combinatorial model categories (§6.1, HTT, Def. A.2.6.1).
- Part KanQuillen: weak homotopy equivalences, Kan fibrations and the Kan–Quillen model structure (§3.1, §3.2, HTT, §A.2.7), its properness (§3.4); Postnikov towers of Kan complexes, with the convergence of a Postnikov tower (§5.1–§5.3).
- Part SimplicialCategories: monoidal and simplicial model categories (§1.2, §1.3, HTT, Defs. A.3.1.2, A.3.1.5); the injective diagram model structure (§2.6, HTT, Prop. A.2.8.2); restriction functors, homotopy Kan extensions and homotopy (co)limits (§3.1, §3.2, HTT, Prop. A.2.8.7 and §A.2.8 after it, p. 851); towers of fibrations (§4.2, HTT, Cor. A.2.9.25) and geometric realization of simplicial objects (§4.4, HTT, Cor. A.2.9.30); the Bergner model structure (§5.4, §5.8, HTT, Prop. A.3.2.4, Thm. A.3.2.24); homotopy colimits in a locally Kan simplicial category (§6.4, HTT, Remark A.3.3.13).
- Part EnrichedLocalization: simplicial categories with a fixed set of objects and their sifted homotopy colimits (§2.4, DK80, §7); Dugger's theorem that a combinatorial model category is Quillen equivalent to a combinatorial simplicial one (§3.4, HTT, §A.3.7), in the form with a left proper combinatorial simplicial model category and the left adjoint on the simplicial side (Dug01b, Cor. 1.2).

## How to read the build

Layer 1 describes the dg nerve in low dimensions and compares it with the coherent nerve of the underlying simplicial category. Layer 2 applies this to chain complexes in an additive category and proves that their dg nerve is stable, with mapping cones as cofibers, and that its triangulated homotopy category is Mathlib's homotopy category of complexes, with explicit signs. Layer 3 is independent of abelian categories. It compares the localization `C[W⁻¹]` of Part AdjunctionsAndLocalizations with the underlying ∞-category of a model category, and proves the Dwyer–Kan theorem, its form for the bifibrant objects of a combinatorial model category, and the basic properties of underlying ∞-categories of combinatorial model categories. Layer 4 defines `D⁻(A)` for an abelian category with enough projectives and gives it a t-structure with heart A. It also exhibits `D⁻(A)` as a localization and its connective part through simplicial objects. Layer 5 proves the universal properties of `D⁻(A)` among right t-exact functors, in the sense of Part StableInfinityCategories §3.5: the flagship description of functors out of `D⁻_{≥0}(A)`, the universal property and the recognition criterion. Layer 6 builds the injective model structure for a Grothendieck abelian category, defines `D(A)`, and proves that it is stable and presentable with an accessible, right complete t-structure compatible with filtered colimits in the sense of Part StableInfinityCategories §11.5. It also embeds `D⁻(A)` into `D(A)`.

## Layer 1: Dg nerves and coherent nerves

### 1.1 Simplices of the dg nerve in low dimensions

The dg nerve `N_dg(C)` of a dg category C (DGAInfinity, Layer 1) is Tau Ceti's `TauCeti.dgNerve R C` (HA, Construction 1.3.1.6, p. 81), an ∞-category by `TauCeti.dgNerve.quasicategory` (HA, Prop. 1.3.1.10, p. 82). Tau Ceti's `TauCeti.dgNerve.homotopyCategoryEquiv` and `TauCeti.dgNerve.rightMappingSpaceIso` describe its homotopy category and right mapping spaces (HA, Remarks 1.3.1.11 and 1.3.1.12). This section adds the low-dimensional description that the comparison of §1.2 and the Checks of later layers use.
- **1.1.1.** Prove that the vertices of `N_dg(C)` are the objects of C, that its edges are the degree-0 cycles, and that a 2-simplex is a triangle of degree-0 cycles f, g, h together with an element z of HA's degree 1 whose differential is `g ∘ f − h` (HA, Example 1.3.1.8, p. 82). The route unwinds the defining equation of an n-simplex for `n ≤ 2`.

  *Needs:* `TauCeti.dgNerve`; DGAInfinity, Layer 1.
- **1.1.2.** Prove that the nerve of the underlying category is isomorphic to the simplicial subset of `N_dg(C)` whose simplices have vanishing coherences on every subset with more than two elements, and that this inclusion is bijective on simplices of dimension at most 1 (HA, Remark 1.3.1.9, p. 82). The route checks that vanishing higher coherences is preserved by the simplicial operators, and that for such simplices the defining equation reduces to composition. Tau Ceti's `TauCeti.dgNerve.fromNerve` is the inclusion, and `TauCeti.dgNerve.nerveIso` gives the isomorphism onto all of `N_dg(C)` when mapping complexes vanish in negative cochain degrees.

  *Needs:* `TauCeti.dgNerve`, `TauCeti.dgNerve.fromNerve`, `TauCeti.dgNerve.nerveIso`.
- **1.1.3.** Prove that a dg functor that is a quasi-isomorphism on all mapping complexes induces a fully faithful functor of dg nerves (HA, proof of Prop. 1.3.1.20, p. 86, through Remark 1.3.1.12, p. 83). The route compares right mapping spaces through their Dold–Kan description, where a quasi-isomorphism of complexes becomes a homotopy equivalence of Kan complexes.

  *Needs:* `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`, `CategoryTheory.EnrichedFunctor.mapDGNerve`; DGAInfinity, Layer 1.

**Checks.**
- For a dg algebra B, viewed as a dg category with one object, `N_dg` has one vertex, its edges are the degree-0 cycles of B, and its homotopy category is the monoid `H_0(B)`.
- For the contractible complex `E(1)` of abelian groups (§2.2), the identity and the zero map are homotopic, so there is a 2-simplex with edges `f = g = id` and `h = 0`, its coherence z a contracting homotopy. A definition requiring `g ∘ f = h` would have no such simplex, and its homotopy category would not be `hC`.
- For the dg category of complexes of ℤ/4-modules, the complex with ℤ/4 in every degree and multiplication by 2 as differential is acyclic but not contractible. Its identity is not a boundary, so it is not a zero object of `N_dg`. A nerve built from quasi-isomorphism classes would make it zero.

*Needs:* for the Checks, `TauCeti.dgNerve`; Part StableInfinityCategories §5.1.1 (HA, Def. 1.2.3.1).

### 1.2 The comparison map with the coherent nerve

**1.2.1.** Define the comparison map `θ : N(C_Δ) → N_dg(C)`, where `C_Δ` is the underlying simplicial category `TauCeti.DGSimplicialCategory R C` and `N(C_Δ)` is Mathlib's `CategoryTheory.SimplicialNerve` of it (HA, Construction 1.3.1.16, p. 84). An n-simplex τ of `Map_{C_Δ}(X, Y)` has an associated n-chain `[τ]` of `Map_C(X, Y)`, the image of the generator of `N_n(ℤΔ[n])` (HA, Construction 1.3.1.13, p. 83). For a subset `I = {i₋ < i_m < ⋯ < i_1 < i₊}` of `[n]` and a permutation σ of `{1, …, m}`, let `τ_{I,σ}` be the m-simplex of `Map_{C[Δ[n]]}(i₋, i₊)`, the nerve of the poset of subsets of `[n]` with least element `i₋` and greatest element `i₊`, given by the chain of subsets obtained from `{i₋, i₊}` by adding `i_{σ(1)}`, then `i_{σ(2)}`, and so on (HA, Notation 1.3.1.15, p. 84). These are simplices of Mathlib's `CategoryTheory.SimplicialThickening`. Then θ sends a simplicial functor `α : C[Δ[n]] → C_Δ` to the n-simplex with vertices `α(i)` and coherences `f_I = Σ_σ (−1)^σ [α(τ_{I,σ})]`. The route is a direct computation that `f_I` satisfies the defining equation of the dg nerve and that the construction is natural in `[n]`.
- For `I = [n]` the `m!` simplices `τ_{I,σ}` are the nondegenerate m-simplices of the cube `Map_{C[Δ[n]]}(0, n)`.
- θ is the identity on vertices, and it is bijective on simplices of dimension at most 2 (HA, p. 85, after Construction 1.3.1.16).

**Checks.**
- For `n = 2` and `I = [2]`, there is one permutation and `τ_{I,σ}` is the edge `{0,2} ⊂ {0,1,2}` of `Map(0, 2) = Δ[1]`. The coherence `f_{[2]}` is the 1-chain of the edge from `h = α({0,2})` to `g ∘ f = α({0,1,2})`, whose differential is `g ∘ f − h`, the equation of §1.1. The opposite orientation would produce `h − g ∘ f` and fail that equation.
- For `n = 3` and `I = [3]`, the two permutations give the two nondegenerate 2-simplices of the square `Map(0, 3) = Δ[1] × Δ[1]`, and their signed sum is its fundamental chain. An unsigned sum would not be a chain whose boundary is the boundary of the square.
- For C concentrated in degree 0, both nerves are the ordinary nerve and θ is the identity.
- θ is generally not an isomorphism in dimension 3: the square `Map(0, 3)` has two nondegenerate 2-simplices, while a 3-simplex of the dg nerve records only their signed sum.

*Needs:* §1.1.1 (HA, Example 1.3.1.8); `TauCeti.dgNerve`, `TauCeti.DGSimplicialCategory`, `TauCeti.cochainToSSet`; `CategoryTheory.SimplicialThickening`, `CategoryTheory.SimplicialNerve`; Part StableInfinityCategories §5.1.1 (HA, Remark 1.2.3.4), §5.2.1 (HA, Notation 1.2.3.10), §5.3.1 (HA, Construction 1.2.3.5) and §5.4.2 (HA, Construction 1.2.3.22, Example 1.2.3.26).

**1.2.2.** Prove that θ is an equivalence of ∞-categories (HA, Prop. 1.3.1.17, p. 85). θ is bijective on vertices, so it suffices that it is fully faithful. One route compares right mapping spaces: the right mapping space of `N(C_Δ)` is `Sing_Q` of `Map_{C_Δ}(X, Y)` (HTT, Prop. 2.2.2.13), and that of `N_dg(C)` is `DK(τ_{≥0} Map_C(X, Y))` (Tau Ceti's `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`). The composite with the canonical map `Z → Sing_Q Z` is an isomorphism, and that map is a homotopy equivalence for a Kan complex Z (HTT, Props. 2.2.2.7, 2.2.2.9).

*Needs:* §1.2.1 (HA, Construction 1.3.1.16); `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`, the Kan instance on mapping objects of `TauCeti.DGSimplicialCategory`; Part InfinityCategoryFoundations §2.7.1 (HTT, Prop. 1.2.4.1, equivalences in a locally Kan simplicial category), §2.6.1 (HTT, Prop. 1.1.5.10), §7.3.2 (HTT, Props. 2.2.2.7, 2.2.2.9), §7.3.3 (HTT, Prop. 2.2.2.13); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1); Tau Ceti `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology` and `CategoryTheory.SimplicialObject.piZeroEquivNormalizedMooreComplexHomology` (HA, Remark 1.2.3.14); `SSet.KanComplex`.

### Examples

- For the dg category of chain complexes of R-modules, the mapping-space description identifies `π_0` of the mapping space from M to N with chain homotopy classes of chain maps.
- For a dg algebra B concentrated in nonpositive HA degrees, `N_dg(B)` is the nerve of the monoid of degree-0 cycles, by `TauCeti.dgNerve.nerveIso`.

### Dependencies

Tau Ceti's dg categories, dg nerve and underlying simplicial category (DGAInfinity, Layer 1); Mathlib's coherent nerve and thickened simplices; Part StableInfinityCategories (§5.1–§5.4) for chain complexes, Dold–Kan and Alexander–Whitney; Part InfinityCategoryFoundations (§2.6, §2.7, §7.3) for the coherent nerve, fibrant simplicial categories and right mapping spaces; Part InfinityCategoryFoundations (§2.1).

## Layer 2: Chain complexes as a stable ∞-category

### 2.1 Mapping spaces between chain complexes

For an additive category A, the dg category `Ch(A)` of chain complexes has as degree p part of `Map_{Ch(A)}(M, N)` the product `∏_n Hom_A(M_n, N_{n+p})`, with the differential of the Conventions and composition of graded maps (HA, Def. 1.3.2.1, p. 88). On `CochainComplex A ℤ` this is Tau Ceti's instance `TauCeti.linearHomComplexEnrichedCategory`, built on Mathlib's `CochainComplex.HomComplex` (DGAInfinity, Layer 0). Its degree-0 cycles are the chain maps and its degree-0 boundaries the null-homotopic ones. `Ch(A)_Δ` denotes `TauCeti.DGSimplicialCategory R (CochainComplex A ℤ)` (HA, Notation 1.3.2.13, p. 90).
- **2.1.1.** Prove that `π_n Map_{N_dg(Ch(A))}(X, Y)`, the homotopy group of the mapping space at the zero map, is the group of chain homotopy classes of chain maps from X to the shift `Y[−n]`, written `Y_{∗+n}` by HA (HA, Remark 1.3.2.3, p. 88). The route combines `TauCeti.dgNerve.rightMappingSpacePiAddEquivHomology` with the identification of degree-n homology of the mapping complex with homotopy classes of maps into the shift.

**Checks.**
- For A the category of abelian groups and `M = N = ℤ` in degree 0, `Map(M, N)` is ℤ in degree 0 and zero elsewhere, so `π_0 = ℤ` and all other homotopy groups vanish.
- For `M = ℤ` in degree 0 and `N = ℤ` in degree 1, `Map(M, N)` is ℤ in degree 1, so `π_1 = ℤ`. Reading HA's shift with the opposite sign would put this in `π_{−1}`, which does not exist.
- For the acyclic, non-contractible complex of ℤ/4-modules of §1.1, `π_0` of its endomorphism mapping space is nonzero, since the identity is not null-homotopic. A dg structure using quasi-isomorphism classes would make it zero.

*Needs:* `TauCeti.linearHomComplexEnrichedCategory`, `CochainComplex.HomComplex`, `TauCeti.dgNerve.rightMappingSpacePiAddEquivHomology`; DGAInfinity, Layer 0; Part StableInfinityCategories §1.4.1 (HA, Def. 1.1.2.1), §5.1.1 (HA, Def. 1.2.3.1).

### 2.2 Kan fibrations of simplicial abelian groups

**2.2.1.** Prove that a map of simplicial abelian groups is a Kan fibration exactly when the induced map of normalized chain complexes is surjective in every positive degree (HA, Prop. 1.3.2.11, pp. 89–90). One route uses the acyclic complex `E(n)`, ℤ in degrees n and `n−1` with the identity differential, which corepresents the degree n term of a complex. For `n > 0` and every i, `N_*(Δ[n])` is the direct sum of `N_*(Λ[n,i])` and `E(n)`. So the lifting property against the horn inclusion is the extension property against `E(n)`, which is surjectivity in degree n. The case of a map to zero is Moore's theorem, `SSet.kanComplex_of_addGroup`. The `Suggested.lean` declaration `rlp_J_iff_surjective_normalizedMooreComplex_map` states this, with Kan fibrations as the right lifting class of Mathlib's horn inclusions `SSet.modelCategoryQuillen.J`.

*Needs:* Part StableInfinityCategories §5.1.1 (HA, Def. 1.2.3.1), §5.2.1 (HA, Notation 1.2.3.10) and §5.3.2 (HA, Lemma 1.2.3.12); Mathlib `AlgebraicTopology.normalizedMooreComplex` (HA, Def. 1.2.3.9); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7, Kan fibrations).

### 2.3 Kan fibrations of mapping spaces and homotopy pushouts

**2.3.1.** Prove the following for a chain map `f : M → M'` and a complex Q in `Ch(A)`. If, for every pair of integers `p < q`, precomposition with f is surjective from `Hom_A(M'_p, Q_q)` to `Hom_A(M_p, Q_q)`, then precomposition with f is a Kan fibration from `Map_{Ch(A)_Δ}(M', Q)` to `Map_{Ch(A)_Δ}(M, Q)` (HA, Cor. 1.3.2.14, p. 90). The route applies §2.2 to the map of Dold–Kan simplicial abelian groups, whose normalized chains are the good truncations of the mapping complexes. The hypothesis holds when f is degreewise split, by a left inverse of each `f_p`, and when A is abelian, f is degreewise a monomorphism and every `Q_q` is injective, by the definition of an injective object (HA, Remark 1.3.2.15, p. 90).

*Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), `TauCeti.DGSimplicialCategory` (HA, Notation 1.3.2.13), §2.2.1 (HA, Prop. 1.3.2.11); `CategoryTheory.Injective`; Part StableInfinityCategories §5.1.1 (HA, Def. 1.2.3.1), §5.3.2 (HA, Remark 1.2.3.11); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7, Kan fibrations).

**2.3.2.** Prove that a pushout square in `Ch(A)` along a degreewise split chain map is a homotopy pushout square in the fibrant simplicial category `Ch(A)_Δ` (HA, Cor. 1.3.2.16, p. 90). For every Q, the square of mapping spaces into Q is a pullback, and one of its maps is a Kan fibration by §2.3.1. A pullback along a Kan fibration is a homotopy pullback, because the Kan–Quillen model structure is right proper.

*Needs:* `TauCeti.DGSimplicialCategory` (HA, Notation 1.3.2.13), §2.3.1 (HA, Cor. 1.3.2.14, Remark 1.3.2.15); the Kan instance on mapping objects of `TauCeti.DGSimplicialCategory`; ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1), §3.5.3 (HTT, Remark A.2.4.5, homotopy pullbacks along fibrations); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7, the model structure and Kan fibrations), §3.4.1 (HTT, §A.2.7, right properness); ModelCategoryTheory, Part SimplicialCategories §6.4.3 (HTT, Remark A.3.3.13).

### 2.4 Stability, mapping cones and the comparison with Mathlib's triangulation

**2.4.1.** Prove that for any additive category A, the ∞-category `N_dg(Ch(A))` is stable, and that for a chain map `f : M → M'` the mapping cone `C(f)`, with `C(f)_n = M'_n ⊕ M_{n−1}`, is a cofiber of f (HA, Prop. 1.3.2.10, pp. 89, 91; Remark 1.3.2.17, p. 91). One route has four steps.
- Pushouts exist: by §1.2 and HTT Thm. 4.2.4.1, applied object by object through small full subcategories when `Ch(A)_Δ` is large (Part LimitsAndKanExtensions §3.3, *Size*), it suffices that `Ch(A)_Δ` has homotopy pushouts. This follows from §2.3, after replacing a map by the degreewise split inclusion into its mapping cylinder, which is chain homotopy equivalent to it.
- The zero complex is a zero object (`TauCeti.dgNerve.isInitialVertex_cochainComplex_of_isZero`, `TauCeti.dgNerve.isTerminalVertex_cochainComplex_of_isZero`).
- The square exhibiting `C(f)` as the pushout of f along `M → E(1) ⊗ M` is a pushout along a degreewise split map, hence a homotopy pushout (§2.3), hence a pushout in the coherent nerve (HTT, Thm. 4.2.4.1) and, through θ, in the dg nerve. Its corner `E(1) ⊗ M` is contractible, hence a zero object. For `M' = 0` this makes the suspension the shift `M[1]`, an equivalence.
- Conclude by the pointed stability criterion (HA, Cor. 1.4.2.27).

The `Suggested.lean` declarations state the two claims as `isStable_dgNerve_cochainComplex` and `exists_isPushoutSquare_mappingCone`, with the stability predicate `IsStable` of Part StableInfinityCategories §1.1 restated there.

*Needs:* §1.2.2 (HA, Prop. 1.3.1.17), `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), `TauCeti.DGSimplicialCategory` (HA, Notation 1.3.2.13), §2.2.1 (the complex `E(1)` of HA, Prop. 1.3.2.11), §2.3.2 (HA, Cor. 1.3.2.16); `TauCeti.dgNerve.homotopyCategoryEquiv`, `TauCeti.dgNerve.isInitialVertex_cochainComplex_of_isZero`, `TauCeti.dgNerve.isTerminalVertex_cochainComplex_of_isZero`; Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*); Part StableInfinityCategories §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part StableInfinityCategories §1.4.1 (HA, Def. 1.1.2.1), §1.3.1 (HA, §1.1.2, construction following Def. 1.1.2.5), §5.1.1 (HA, Def. 1.2.3.1), §7.5.3 (HA, Cor. 1.4.2.27); ModelCategoryTheory, Part SimplicialCategories §6.4.3 (HTT, Remark A.3.3.13).

**2.4.2.** Define the commutation of the comparison functor with shifts, for an additive R-linear category A (not stated in the sources; from HA, Prop. 1.3.2.10 and Remark 1.3.2.17, p. 91, and HA, Thm. 1.1.2.14, p. 27; no source fixes the signs). Let Φ be the composite of `TauCeti.homotopyCategoryToDGHomotopyCategory` with the functor of `TauCeti.dgNerve.homotopyCategoryEquiv`, from Mathlib's `HomotopyCategory A (ComplexShape.up ℤ)` to the homotopy category of `N_dg(Ch(A))`; it is an equivalence. For a complex M, take the strictly commuting square of chain maps with initial corner M, whose first edge is the zero map from M to 0 and whose second edge is `inr` from M to the mapping cone of the identity of M, with final corner M⟦1⟧, reached from 0 by zero and from the cone by the projection `fst`. It is read as a diagram of the shape of Part StableInfinityCategories §1.3, with 0 in the place of the zero object that ends the top row X ⟶ Y ⟶ 0 of Part StableInfinityCategories §1.6 and the cone in the place of 0′. It is a pushout in `N_dg(Ch(A))`: it is a pushout of complexes along a degreewise split map (§2.3). Its corner, the cone of the identity, is contractible, hence a zero object. So it gives an isomorphism `τ_M : Σ(Φ M) ≅ Φ(M⟦1⟧)`, natural in M, where Σ is the suspension of Part StableInfinityCategories §1.3. The commutation is the `Functor.CommShift ℤ` structure on Φ whose isomorphism at 1, from `Φ(M⟦1⟧)` to `Σ(Φ M)`, is minus the inverse of `τ_M`. Its value at 1 determines it, through the additivity isomorphisms of the two shifts.
- The sign is that of the third maps: Mathlib's triangle on a chain map φ ends with minus the projection `fst` (the class of `(−fst φ).rightShift 1 0`), the triangle of Part StableInfinityCategories §1.6 with `fst` followed by the inverse of `τ_M`.
- The orientation matters: the transposed square, with the cone first and 0 second, gives −`τ_M` (Part StableInfinityCategories §1.5), and would reverse the sign of the commutation.

**Checks.**
- For A abelian groups and M = ℤ in degree 0, `τ_M` identifies Σℤ with ℤ⟦1⟧, which is ℤ in cochain degree −1. A comparison landing in M⟦−1⟧ would put it in degree 1, against HA's shift.
- For f = 3 : ℤ → ℤ, the cone C of f has `Hom(C, ℤ⟦1⟧) ≅ ℤ/3`, generated by Mathlib's third map δ, and `Hom(ℤ⟦1⟧, C) = 0`. The triangle (3, inr, −δ) is not distinguished. An isomorphism from it to (3, inr, δ) is ε = ±1 on both copies of ℤ and ε(1 + u ∘ δ) on C for some u : ℤ⟦1⟧ → C. Since u = 0, it would give −δ = δ, that is 2δ = 0. So the comparison without the minus sign, which sends Mathlib's triangle on 3 to a triangle ending in minus HA's third map, is not triangulated.
- For f the identity of M the third object is zero and both signs give distinguished triangles, so the identity does not detect the sign.
- For M = ℤ in degree 0, glue two copies of the cone of the identity along their maps `inr` from M. The pushout is ℤa₁ ⊕ ℤa₂ in degree −1 and ℤ in degree 0, with both aᵢ sent to the generator, so its degree −1 homology is generated by a₁ − a₂, where a₁ lies in the copy in the place of 0′. Collapsing the other copy to 0 maps this square to the square of `τ_M`, and the induced map to ℤ⟦1⟧, `fst` on the first copy and zero on the other, sends a₁ − a₂ to 1; collapsing the first copy instead gives the transposed square and sends it to −1. So the two orientations of the square give values of `τ_M` differing by −1, and a definition leaving the orientation open does not fix the sign.

*Needs:* §2.3.2 (HA, Cor. 1.3.2.16), §2.4.1 (HA, Prop. 1.3.2.10, Remark 1.3.2.17); `TauCeti.homotopyCategoryToDGHomotopyCategory`, `TauCeti.dgNerve.homotopyCategoryEquiv`; Mathlib `CochainComplex.mappingCone`, `CochainComplex.mappingCone.inr`, `CochainComplex.mappingCone.fst`, `CategoryTheory.Functor.CommShift`; Part StableInfinityCategories §1.3.1 (HA, §1.1.2, the suspension functor), §1.5.2 (HA, Lemma 1.1.2.10, transposition), §1.7.2 (HA, Thm. 1.1.2.14, the shift and additive structure on hC); Part StableInfinityCategories §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6).

**2.4.3.** Prove that Φ, with this commutation, is a triangulated functor from Mathlib's triangulated homotopy category of complexes to the homotopy category of `N_dg(Ch(A))` with the triangulation of Part StableInfinityCategories §1.7. Since Φ is an equivalence, a triangle there is distinguished in the sense of HA exactly when it is isomorphic to the image of Mathlib's `CochainComplex.mappingCone.triangle` of a chain map (no source states this; its inputs are HA, Def. 1.1.2.11, p. 26, Thm. 1.1.2.14, p. 27, Prop. 1.3.2.10 and Remark 1.3.2.17, p. 91). The route treats the triangle of a chain map φ : M → M'. Model the two squares of Part StableInfinityCategories §1.6 by strictly commuting squares of chain maps. The first, with top edge φ and left edge `inr` into the cone of the identity of M (in the place of 0′), is the pushout of M' and that cone over M, which is the cone of φ (HA, Remark 1.3.2.17). The second, with top edge `inr` from M' into the cone of the identity of M' (in the place of 0) and left edge `inr` into the cone of φ, is the pushout of these two cones over M'. Both are pushouts along degreewise split maps, hence pushouts in `N_dg(Ch(A))` (§2.3). The chain map from the second pushout to M⟦1⟧, equal to `fst` on the cone of φ and to zero on the cone of the identity of M', is a homotopy equivalence. It carries the outer rectangle to the square defining `τ_M`, sending the cone of the identity of M' to 0 and the cone of the identity of M to itself, so the two squares have the same orientation. So the third map of HA's triangle is `fst` followed by the inverse of `τ_M`, while Mathlib's is −`fst`, and the minus sign in the commutation absorbs the difference. The same statement and proof hold for a full dg subcategory closed under the zero complex, ⟦1⟧, ⟦−1⟧ and mapping cones, such as those of `D⁻(A)` (§4.2) and `D(A)` (§6.5).

*Needs:* §2.3.2 (HA, Cor. 1.3.2.16), §2.4.1 (HA, Prop. 1.3.2.10, Remark 1.3.2.17), §2.4.2 (the commutation); Mathlib `CochainComplex.mappingCone.triangle`, the `Pretriangulated` instance on `HomotopyCategory A (ComplexShape.up ℤ)`, `CategoryTheory.Functor.IsTriangulated`; Part StableInfinityCategories §1.6.1 (HA, Def. 1.1.2.11), §1.7.2 (HA, Thm. 1.1.2.14); Part StableInfinityCategories §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6).

### Examples

- For A the category of finite-dimensional vector spaces over a field, `N_dg(Ch(A))` is stable, and every object is equivalent to its homology with zero differential.
- Under the comparison of §2.4, the triangle `M → M' → C(f) → M[1]` of a chain map corresponds to Mathlib's mapping-cone triangle of f, whose third map is minus the cone projection; for M = M' = ℤ and f = 3 this is the triangle ℤ → ℤ → C(3) → ℤ⟦1⟧ whose last map is −`fst`, a generator of Hom(C(3), ℤ⟦1⟧) ≅ ℤ/3.

### Dependencies

Layer 1; Tau Ceti's dg category of cochain complexes, zero objects of the dg nerve and the comparison of homotopy categories; Mathlib's mapping cones and triangulated homotopy category of complexes; Part InfinityCategoryFoundations (§1.2); Part StableInfinityCategories (§1.1); Part StableInfinityCategories (§1.3–§1.7 additive categories, suspension and the triangulation of the homotopy category; §5.1, §5.3 chain complexes; §7.5 the pointed stability criterion); Part LimitsAndKanExtensions (§3.2) for homotopy colimits in simplicial categories; ModelCategoryTheory (KanQuillen, ModelCategories, SimplicialCategories) for Kan fibrations, properness and homotopy pushouts.

## Layer 3: Localizations and underlying ∞-categories of model categories

### 3.1 Localization at a class of morphisms

The localization `C[W⁻¹]` of an ∞-category at a collection W of morphisms (HA, Def. 1.3.4.1, p. 108), its existence (HA, Remark 1.3.4.2) and the identification of reflective localizations as such localizations (HA, Example 1.3.4.3) are stated in Part AdjunctionsAndLocalizations §2.4, with the invariance of localization under homotopy equivalences of pairs. This layer uses them as stated there.

### 3.2 Simplicial categories as geometric realizations

**3.2.1.** Define, for a simplicial category C and `n ≥ 0`, the ordinary category `C_n` with the objects of C and morphisms the n-simplices of the mapping spaces. Define the translation functor `t_{[n]}` on simplicial sets as `t_{[n]} Y = ∐_{σ : Δ[n] → Y} Y_{σ/}`, a coproduct of Tau Ceti's coslices (HA, Notation 1.3.4.11, p. 112).
- For connected nonempty X, maps `X → t_{[n]} Y` correspond to maps `Δ[n] ⋆ X → Y`, naturally in X. This is how HA's defining formula is read. For `X = ∅` the left side is a single point while the right side is the set of n-simplices of Y, so the formula cannot hold there.
- `t_{[n]}` preserves finite products, so it induces a functor `T_{[n]}` on simplicial categories, with maps `C_n ← T_{[n]} C → C` natural in `[n]`. This gives a simplicial object `T_• C`.

**Checks.**
- For `n = 0`, `t_{[0]} Y` is the coproduct of the coslices `Y_{y/}` over vertices y. For Y = Δ[0] this is `Δ[0]`.
- For Y = ∅, `t_{[n]} Y = ∅`. Reading the formula for `X = ∅` literally would require a bijection between a one-point set and the empty set.
- `C_0` is the underlying category of C, and for C an ordinary category every `C_n` equals `C_0`.

*Needs:* `SSet.join` (HTT, Def. 1.2.8.1), `SSet.coslice`; Mathlib `SimplicialCategory`.

**3.2.2.** Prove that for a simplicial category C, the map `T_• C → C_•` is a levelwise weak equivalence of simplicial objects of simplicial categories, and that the colimit of `T_• C` maps to C by a map exhibiting C as a homotopy colimit of `T_• C` (HA, Prop. 1.3.4.14, p. 113). The maps are bijective on objects, so both claims reduce to mapping spaces, through three steps.
- For a simplicial set X and `m ≥ 0`, the canonical map from `t_{[m]} X` to the discrete simplicial set of m-simplices of X is a homotopy equivalence (HA, Lemma 1.3.4.12, p. 112): each summand `X_{σ/}` is weakly contractible by the classical décalage contraction. This gives the first claim.
- For a simplicial set X, the canonical map from the colimit of `[n] ↦ t_{[n]} X` to X exhibits X as a homotopy colimit of that diagram (HA, Lemma 1.3.4.13, pp. 112–113). The route reduces to finite X, since homotopy colimit diagrams are stable under filtered colimits, then inducts on cells through the homotopy pushout attaching a simplex, and finally treats the diagram `[m] ↦ Hom(Δ[m], Δ[n])`, whose homotopy colimit is contractible (HTT, Cor. A.2.9.30).
- For a diagram `α ↦ C_α` of simplicial categories indexed by a category J with `N(J)` sifted, and a map θ from its colimit to C, suppose each `C_α → C` is bijective on objects and each mapping space of C is the homotopy colimit of the corresponding mapping spaces of the `C_α`. Then θ exhibits C as a homotopy colimit of the diagram in the Bergner model structure (HA, Lemma 1.3.4.10, pp. 111–112). The route works with simplicial categories with a fixed set of objects, where sifted homotopy colimits are computed on mapping spaces, and compares that model structure with the Bergner model structure. Since `N(Δ)^op` is sifted, this and the previous step give the second claim.

*Needs:* §3.2.1 (HA, Notation 1.3.4.11); `SSet.coslice`; Part PresheavesAndCompletions §5.1.1 (HTT, Def. 5.5.8.1); Part PresheavesAndCompletions §5.3.1 (HTT, Lemma 5.5.8.4); ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833, homotopy pushouts), §4.1.1 (HTT, §A.2.5), §6.1.1 (HTT, Def. A.2.6.1); ModelCategoryTheory, Part KanQuillen §3.1.1 (HTT, §A.2.7, weak homotopy equivalences); ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, p. 851, homotopy colimits), §4.4.2 (HTT, Cor. A.2.9.30), §1.2.1 (HTT, Def. A.3.1.2); ModelCategoryTheory, Part EnrichedLocalization §2.4 (DK80, §7: simplicial categories with a fixed set of objects and their sifted homotopy colimits).

### 3.3 Simplicial categories as localizations of their underlying categories

**3.3.1.** Prove the following for a simplicial category C with a collection W of morphisms satisfying four conditions: W contains the isomorphisms; W has the two-out-of-three property; every object X has an interval object `Δ[1] ⊗ X`, which corepresents `Map(Δ[1], Map_C(X, −))`; and the projection `Δ[1] ⊗ X → X` is in W. Let `C_0` be the underlying category and C' a fibrant replacement of C in the Bergner model structure. Then two morphisms in the same component of `Map_C(X, Y)` are both in W or both outside W, and the map of marked simplicial sets `(N(C_0), W) → (N(C'), W)` is a weak equivalence (HA, Prop. 1.3.4.7, pp. 110, 113–114; the first claim opens its proof, which takes for C' the singular complex of the realization of C). The route factors this map through the homotopy colimit of `T_• C`, using §3.2 for one factor. For the other, with `W_n` the n-simplices of mapping spaces whose vertices are in W, each map `(N(C_0), W) → (N(C_n), W_n)` induced by `[n] → [0]` is a weak equivalence of marked simplicial sets: restriction along `[0] ⊆ [n]` is a left inverse G, and the interval objects give a functor `U(X) = Δ[1] ⊗ X` with natural transformations `F ∘ G → U ← id` through `W_n`, by a reparametrization of `Δ[n] × Δ[1]`. Two-out-of-three puts both endpoint inclusions `X → Δ[1] ⊗ X` in W, which gives the claim on components.

*Needs:* §3.2.1 (HA, Notation 1.3.4.11), §3.2.2 (HA, Prop. 1.3.4.14); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2); Mathlib `CategoryTheory.SimplicialNerve`; Part CartesianFibrations §5.7.1 (HTT, Prop. 3.1.3.7); ModelCategoryTheory, Part SimplicialCategories §5.4.2 (HTT, Prop. A.3.2.4), §5.8.4 (HTT, Thm. A.3.2.24); Mathlib `HomotopicalAlgebra.ModelCategory`.

**3.3.2.** Prove the following for an additive category A and a full subcategory `Ch'(A) ⊆ Ch(A)` closed under `M ↦ N_*(Δ[1]) ⊗ M`, the mapping cylinder of the identity. If W is the collection of chain homotopy equivalences in `Ch'(A)`, regarded as an ordinary category, then the inclusion of §1.1 from `N(Ch'(A))` into `N_dg(Ch'(A))` induces an equivalence `N(Ch'(A))[W⁻¹] ≃ N_dg(Ch'(A))` (HA, Prop. 1.3.4.5, pp. 109, 114–115). The theorem of §3.3.1 does not apply directly to the underlying simplicial category (HA, Warning 1.3.4.9, p. 111). The route instead uses the simplicial category C whose level n morphisms are chain maps `N_*(Δ[n]) ⊗ M → M'`. Then `N(C)` is identified with `N_dg(Ch'(A))` through §1.2, and `T_• Ch'(A)` is handled by §3.2. The comparison reduces to the cylinder step, in the proof on pp. 114–115: with `W_n` the morphisms of `C_n` whose vertices are chain homotopy equivalences, `(N(C_0), W_0) → (N(C_n), W_n)` is a weak equivalence of marked simplicial sets for each n. Restriction along `[0] ⊆ [n]` is a left inverse, and an explicit chain map `N_*(Δ[n]) ⊗ N_*(Δ[1]) → N_*(Δ[1]) ⊗ N_*(Δ[n])`, given on generators, defines a cylinder functor `U(M) = N_*(Δ[1]) ⊗ M` with natural transformations through chain homotopy equivalences. That this map is a chain map is checked against the sign and composition conventions of the Conventions section.

*Needs:* §1.1.2 (HA, Remark 1.3.1.9), §1.2.2 (HA, Prop. 1.3.1.17), §3.2.1 (HA, Notation 1.3.4.11), §3.2.2 (HA, Prop. 1.3.4.14), §3.3.1 (HA, Prop. 1.3.4.7, for the classes `W_n`); Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1); Part StableInfinityCategories §5.2.1 (HA, Notation 1.2.3.10); Part CartesianFibrations §5.7.1 (HTT, Prop. 3.1.3.7); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1).

### 3.4 Quillen equivalences and underlying ∞-categories

The underlying ∞-category `N(A^c)[W⁻¹]` of a model category A, with W the weak equivalences between cofibrant objects, is defined in Part AdjunctionsAndLocalizations §2.6 (HA, Def. 1.3.4.15); in the terms of Part AdjunctionsAndLocalizations §2.4 it is the localization of `N(A^c)` at W. That the cofibrant, fibrant, bifibrant or all objects give equivalent localizations when factorizations are functorial is Part AdjunctionsAndLocalizations §2.6 (HA, Remark 1.3.4.16).
- **3.4.1.** Prove that a left Quillen equivalence `F : A → B` of combinatorial model categories induces a weak equivalence of marked simplicial sets `(N(A^c), W_A) → (N(B^c), W_B)`, hence an equivalence of underlying ∞-categories (HA, Lemma 1.3.4.21, pp. 117–118). The route builds a homotopy inverse as functorial fibrant replacement in B, then the right adjoint, then functorial cofibrant replacement in A — a right Quillen functor preserves weak equivalences only between fibrant objects — and checks the units and counits by the derived-unit criterion for Quillen equivalences.

  *Needs:* Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1), §2.6.1 (HA, Def. 1.3.4.15); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, the Quillen adjunctions of §A.2.5), §4.2.1 (HTT, Prop. A.2.5.1), §6.1.1 (HTT, Def. A.2.6.1).

**Checks.**
- For the Kan–Quillen model structure, the underlying ∞-category is equivalent to the coherent nerve of Kan complexes (§3.5). Its homotopy category has `π_0` of mapping spaces as Hom sets, not the plain Hom sets of `SSet`.
- For the injective model structure on `Ch(A)` of §6.2, the homotopy category of the underlying ∞-category is Mathlib's derived category (§6.5). Localizing all of `Ch(A)` at chain homotopy equivalences instead would give the homotopy category of complexes.

*Needs:* for the Checks, Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1), §2.6.1 (HA, Def. 1.3.4.15); ModelCategoryTheory, Part SimplicialCategories §1.2.1 (HTT, Def. A.3.1.2); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

### 3.5 The Dwyer–Kan theorem

**3.5.1.** Define, for a simplicial model category A, the simplicial category M (HA, Construction 1.3.4.18, pp. 116–117). Its objects are pairs `(i, A)` with `i ∈ {0, 1}`, A cofibrant, and A also fibrant when `i = 1`. The mapping space from `(i, A)` to `(j, B)` is `Map_A(A, B)` when `j = 1`, the discrete set `Hom_A(A, B)` when `i = j = 0`, and empty when `j = 0 < 1 = i`. Then `N(M) → Δ[1]` is a correspondence from `N(A^c)` to `N(A°)`.
- The fibers over 0 and 1 are `N(A^c)` and the coherent nerve `N(A°)` of the bifibrant objects.
- The mapping spaces into objects over 1 are Kan complexes, so `N(M)` is an ∞-category.
- Prove that `p : N(M) → Δ[1]` is a coCartesian fibration, and that an edge from `(0, A)` to `(1, B)` is p-coCartesian exactly when `A → B` is a weak equivalence (HA, Lemma 1.3.4.19, p. 117). The route chooses a trivial cofibration `A → B` with B fibrant and shows that the edge is coCartesian, using that in a simplicial model category a weak equivalence of cofibrant objects induces homotopy equivalences of mapping spaces into fibrant objects (HTT, Rem. A.3.1.6, with Ken Brown's lemma). As a consequence, p determines a functor `θ : N(A^c) → N(A°)` up to equivalence.

**Checks.**
- There are no morphisms from an object over 1 to one over 0. Allowing them would make `N(M) → Δ[1]` fail to be a map to `Δ[1]`.
- For A = `SSet` with the Kan–Quillen structure, the fiber over 1 is the coherent nerve of Kan complexes, and the fiber over 0 is the ordinary nerve of `SSet`.
- Over 0 the mapping spaces are discrete. Using simplicial mapping spaces there would make the fiber over 0 the coherent nerve of cofibrant objects, which is not an ∞-category when those mapping spaces are not Kan.

*Needs:* Mathlib `CategoryTheory.SimplicialNerve`; `SSet.CartesianFibration`; Part InfinityCategoryFoundations §2.6.1 (HTT, Prop. 1.1.5.10); Part CartesianFibrations §4.1.1 (HTT, Def. 2.3.1.3), §1.5.1 (HTT, §2.4.1), §1.7.2 (HTT, Prop. 2.4.4.3); Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5; Rem. A.3.1.6); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

**3.5.2.** Prove the Dwyer–Kan theorem: for a simplicial model category A, θ exhibits `N(A°)` as the underlying ∞-category of A, that is, `N(A^c)[W⁻¹] ≃ N(A°)` (HA, Thm. 1.3.4.20, pp. 117, 120). One route applies §3.3 to the simplicial category of cofibrant objects. It uses the cylinders `Δ[1] ⊗ X` as interval objects, and the reflective localization criterion (HTT, Prop. 5.2.7.8) for the inclusion of the bifibrant objects, with fibrant replacement as left adjoint.

*Needs:* §3.3.1 (HA, Prop. 1.3.4.7), §3.5.1 (HA, Construction 1.3.4.18, Lemma 1.3.4.19); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part AdjunctionsAndLocalizations §1.3.1 (HTT, Def. 5.2.2.7), §2.3.1 (HTT, Prop. 5.2.7.8), §2.6.1 (HA, Def. 1.3.4.15); Part CartesianFibrations §5.7.1 (HTT, Prop. 3.1.3.7); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5).

**3.5.3.** Prove that the bifibrant objects of a model category of either kind below, as an ordinary category, also present its underlying ∞-category, through the Dwyer–Kan comparison (not stated in the sources; from HA, Thm. 1.3.4.20 with Remark 1.3.4.16 and Lemma 1.3.4.21, pp. 116–118, and Dug01b, Cor. 1.2; HA combines Dugger's theorem, Lemma 1.3.4.21 and Thm. 1.3.4.20 in the same way before Prop. 1.3.4.22, p. 118). Write `N(A^cf)` for the ordinary nerve of the full subcategory of bifibrant objects and `W^cf` for its weak equivalences.
- Let A be a simplicial model category whose factorizations can be chosen functorially, for example a combinatorial one. The canonical functor from `N(A^cf)` to the coherent nerve `N(A°)`, the identity on objects and the inclusion of morphisms as vertices of mapping spaces, exhibits `N(A°)` as `N(A^cf)[(W^cf)⁻¹]`. Route: for A bifibrant, the edge from `(0, A)` to `(1, A)` given by the identity is p-coCartesian by Lemma 1.3.4.19, so θ restricted to `N(A^cf)` is equivalent to the canonical functor. HA, Remark 1.3.4.16 identifies the localization of the bifibrant objects with that of the cofibrant objects, and the Dwyer–Kan theorem concludes.
- Let A be a combinatorial model category. Then `N(A^cf)[(W^cf)⁻¹]`, which is the underlying ∞-category of A, is equivalent to the coherent nerve `N(B°)` of the bifibrant objects of any combinatorial simplicial model category B with a left Quillen equivalence `B → A`. A left proper such B exists by Dugger's theorem. Route: HA, Lemma 1.3.4.21 for the Quillen equivalence, HA, Remark 1.3.4.16 for A, and the previous bullet for B.

*Needs:* §3.4.1 (HA, Lemma 1.3.4.21), §3.5.1 (HA, Construction 1.3.4.18, Lemma 1.3.4.19), §3.5.2 (HA, Thm. 1.3.4.20); Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1), §2.6.1 (HA, Def. 1.3.4.15), §2.6.2 (HA, Remark 1.3.4.16); Mathlib `CategoryTheory.SimplicialNerve`; ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5); ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1), §6.1.1 (HTT, Def. A.2.6.1); ModelCategoryTheory, Part EnrichedLocalization §3.4.5 (Dug01b, Cor. 1.2).

### 3.6 Underlying ∞-categories of combinatorial model categories

Each entry reduces to the simplicial case through Dugger's theorem, the invariance of §3.4 under Quillen equivalences and the Dwyer–Kan theorem (§3.5).

**3.6.1.** Prove that the underlying ∞-category of a combinatorial model category is presentable (HA, Prop. 1.3.4.22, p. 118). After the reduction, `N(A°)` is presentable for a combinatorial simplicial model category A (HTT, Prop. A.3.7.6).

*Needs:* §3.4.1 (HA, Lemma 1.3.4.21), §3.5.2 (HA, Thm. 1.3.4.20); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part PresentableInfinityCategories §8.1.4 (HTT, Prop. A.3.7.6); ModelCategoryTheory, Part EnrichedLocalization §3.4.5 (Dug01b, Cor. 1.2); ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

**3.6.2.** Prove that for a combinatorial model category A, a small category I and a functor `F : I → A^c`, homotopy colimits in A are colimits in the underlying ∞-category: `α : colim F → X` exhibits X as a homotopy colimit of F exactly when `N(I)^▷ → N(A^c)[W⁻¹]` is a colimit diagram (HA, Prop. 1.3.4.24, p. 119). After the reduction, this is the comparison of homotopy colimits with ∞-categorical colimits (HTT, Thm. 4.2.4.1), applied to the large `A^c` object by object through small full subcategories, as in Part LimitsAndKanExtensions §3.3 (*Size*).

*Needs:* §3.4.1 (HA, Lemma 1.3.4.21), §3.5.2 (HA, Thm. 1.3.4.20), §3.6.1 (HA, Prop. 1.3.4.22); Part AdjunctionsAndLocalizations §2.6.1 (HA, Def. 1.3.4.15); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (*Size*); Part InfinityCategoryFoundations §5.5.4 (HTT, Remark 1.2.13.5); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4); ModelCategoryTheory, Part SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7), §3.2.1 (HTT, §A.2.8 after Prop. A.2.8.7); ModelCategoryTheory, Part EnrichedLocalization §3.4.5 (Dug01b, Cor. 1.2); ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

**3.6.3.** Prove that for A combinatorial and I small, with `A^I` given the injective or the projective model structure, the map `N(I) × N((A^I)^c) → N(A^c)` induces an equivalence from the underlying ∞-category of `A^I` to `Fun(N(I), N(A^c)[W⁻¹])` (HA, Prop. 1.3.4.25, p. 119). After the reduction, this is HTT Prop. 4.2.4.4.

*Needs:* §3.4.1 (HA, Lemma 1.3.4.21), §3.5.2 (HA, Thm. 1.3.4.20); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1 (HTT, §1.2.11); ModelCategoryTheory, Part SimplicialCategories §2.6.2 (HTT, Prop. A.2.8.2); ModelCategoryTheory, Part EnrichedLocalization §3.4.5 (Dug01b, Cor. 1.2); ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

### Examples

- For the Kan–Quillen model structure, the Dwyer–Kan theorem identifies `N(SSet^c)[W⁻¹]` with the ∞-category of spaces, the coherent nerve of Kan complexes.
- For the projective model structure on diagrams `SSet^I`, §3.6 identifies the underlying ∞-category with `Fun(N(I), S)`.
- For the Kan–Quillen model structure, §3.5 also identifies the ordinary nerve of the category of Kan complexes, localized at weak homotopy equivalences, with the ∞-category of spaces.

### Dependencies

Layers 1–2; Part InfinityCategoryFoundations (§1.2); Part CartesianFibrations (§1.1, §5.1); Part AdjunctionsAndLocalizations (§1.1); Part PresheavesAndCompletions (§4.1); Part PresentableInfinityCategories (§1.1); Part InfinityCategoryFoundations (§2.6, §5.5); Part CartesianFibrations (§1.5, §1.7, §3.4, §4.1, §5.7) for coCartesian edges, functor ∞-categories, correspondences and marked simplicial sets; Part LimitsAndKanExtensions (§3.1, §3.2, §3.3) for homotopy (co)limits in simplicial categories; Part AdjunctionsAndLocalizations (§1.3, §2.3, §2.4, §2.6) for adjunctions, reflective localizations, `C[W⁻¹]` and the underlying ∞-category of a model category; Part PresheavesAndCompletions (§5.3) for sifted simplicial sets; Part PresentableInfinityCategories (§8.1) for HTT A.3.7.6; Part StableInfinityCategories (§5.2); ModelCategoryTheory for model, simplicial model and combinatorial model categories, the Bergner model structure and Dugger's theorem.

## Layer 4: The right-bounded derived ∞-category `D⁻(A)`

### 4.1 Projective objects and bounded complexes

**4.1.1.** Define projective objects and enough projectives as Mathlib's `CategoryTheory.Projective` and `CategoryTheory.EnoughProjectives` (HA, Def. 1.3.2.4, p. 88). An object P is projective when `Hom_A(P, −)` carries epimorphisms to surjections, and A has enough projectives when every object receives an epimorphism from a projective object. `A_proj` denotes the full subcategory of projective objects.

**Checks.**
- In the category of abelian groups, ℤ is projective and ℤ/2 is not: the epimorphism `ℤ → ℤ/2` has no section. A definition asking lifts only along split epimorphisms would make ℤ/2 projective.
- ℚ is injective but not projective in the category of abelian groups: `⊕_{q∈ℚ} ℤ → ℚ` has no section. A definition with monomorphisms in place of epimorphisms (injectivity) would make ℚ pass and ℤ fail.
- Over ℤ/4, the module ℤ/4 is projective and ℤ/2 is not, since `ℤ/4 → ℤ/2` has no section. A definition by freeness of the underlying abelian group would fail for ℤ/4 itself.

*Needs:* `CategoryTheory.Projective`, `CategoryTheory.EnoughProjectives`.

**4.1.2.** Define, for an additive category A, the full subcategories `Ch⁻(A)` and `Ch⁺(A)` of `Ch(A)`. The first consists of complexes with `M_n = 0` for all sufficiently negative n, the second of complexes with `M_n = 0` for all sufficiently positive n (HA, Notation 1.3.2.6, p. 89). In cochain degrees `Ch⁻(A)` is Mathlib's bounded-above complexes.
- Both are closed under shifts and under mapping cones.

**Checks.**
- ℤ in every HA degree `n ≥ 0`, with zero differential, lies in `Ch⁻(A)` and not in `Ch⁺(A)`. Swapping the two conventions would put it in `Ch⁺(A)`.
- The complex with ℤ in every degree and zero differential lies in neither. A definition by vanishing of homology instead of terms would put the acyclic unbounded complex of ℤ/4-modules of §1.1 in both.
- The convention is the one of the Conventions section: a projective resolution lies in `Ch⁻(A)`.

*Needs:* Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part StableInfinityCategories §1.4.1 (HA, Def. 1.1.2.1).

### 4.2 The derived ∞-category `D⁻(A)`

**4.2.1.** Define, for an abelian category A with enough projectives, the derived ∞-category `D⁻(A)` as the dg nerve `N_dg(Ch⁻(A_proj))` of the full dg subcategory of `Ch(A)` on complexes of projective objects in `Ch⁻(A)` (HA, Def. 1.3.2.7, p. 89). In Lean it is `TauCeti.dgNerve R` of `TauCeti.DGFullSubcategory` for the predicate "degreewise projective and bounded above in cochain degrees". The `Suggested.lean` declarations give the predicate as `IsBoundedAboveProjective` and the ∞-category as `derivedMinusInfty`.
- It is an ∞-category (`TauCeti.dgNerve.quasicategory`).
- Its homotopy category is the homotopy category of bounded-above complexes of projectives, which is equivalent to the classical bounded-above derived category (HA, Remark 1.3.2.9, p. 89).

**Checks.**
- For A the category of abelian groups, `π_0 Map(ℤ/2, ℤ/2[1]) = ℤ/2`, computed with the resolution `ℤ → ℤ`, multiplication by 2. In `N_dg(Ch(A))` with ℤ/2 placed in degree 0 the same group is 0, so dropping the projectivity condition gives the wrong Ext.
- For A the category of vector spaces over a field, every complex is a complex of projectives, and every object of `D⁻(A)` is equivalent to its homology. The homotopy category is graded vector spaces bounded below in HA's degree.
- An unbounded complex of projectives that is acyclic but not contractible does not lie in `D⁻(A)`. Dropping the boundedness condition would add a nonzero object with zero homology. For A the category of `ℤ/4`-modules, an example is the complex with `ℤ/4` in every degree and multiplication by 2 as differential.

*Needs:* `TauCeti.dgNerve`, `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §4.1.1 (HA, Def. 1.3.2.4), §4.1.2 (HA, Notation 1.3.2.6); `TauCeti.DGFullSubcategory`; Mathlib `SSet.Quasicategory`.

### 4.3 Mapping complexes out of projective complexes

**4.3.1.** Prove that for an abelian category A, a complex P of projectives with `P_n = 0` for n sufficiently negative, and a quasi-isomorphism `Q → Q'`, the induced map `Map_{Ch(A)}(P, Q) → Map_{Ch(A)}(P, Q')` is a quasi-isomorphism (HA, Lemma 1.3.2.20, p. 92). A route: P is K-projective by Mathlib's `CochainComplex.isKProjective_of_projective`, so the cone of `Q → Q'`, which is acyclic, receives only null-homotopic maps from P; that gives the quasi-isomorphism directly.

*Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §4.1.1 (HA, Def. 1.3.2.4); Mathlib `CochainComplex.IsKProjective`, `CochainComplex.isKProjective_of_projective`.

**4.3.2.** Prove the following for an abelian category A and complexes P and Q, where each `P_n` is projective, `P_n = 0` for `n < 0`, and `H_n(Q) = 0` for `n > 0`. The mapping space `Map_{N_dg(Ch(A))}(P, Q)` is discrete, and `Ext^0(P, Q)` is canonically `Hom_A(H_0 P, H_0 Q)` (HA, Lemma 1.3.2.21, pp. 92–93). The route replaces Q by its truncation `⋯ → 0 → coker(Q_1 → Q_0) → Q_{−1} → ⋯`, which is quasi-isomorphic to it by the hypothesis on Q, and uses §4.3. The mapping complex is then zero in positive degrees, and its `H_0` is computed directly. Discreteness follows from `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`.

*Needs:* `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`, `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §4.1.1 (HA, Def. 1.3.2.4), §4.3.1 (HA, Lemma 1.3.2.20); Tau Ceti `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology` and `CategoryTheory.SimplicialObject.piZeroEquivNormalizedMooreComplexHomology` (HA, Remark 1.2.3.14).

### 4.4 Stability of `D⁻(A)`

**4.4.1.** Prove that for an abelian category A with enough projectives, `D⁻(A)` is stable (HA, Cor. 1.3.2.18, p. 92). `Ch⁻(A_proj)` is closed under shifts and mapping cones, so by §2.4 its dg nerve is a full subcategory of the stable `N_dg(Ch(A))` closed under cofibers and translations, hence a stable subcategory (HA, Lemma 1.1.3.3). The `Suggested.lean` declaration states this as `isStable_derivedMinusInfty`.

*Needs:* §2.4.1 (HA, Prop. 1.3.2.10, Remark 1.3.2.17), §4.1.2 (HA, Notation 1.3.2.6), §4.2.1 (HA, Def. 1.3.2.7); Part StableInfinityCategories §2.1.2 (HA, Lemma 1.1.3.3); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9).

### 4.5 Projective resolutions, the t-structure and the heart

**4.5.1.** Prove the following for an abelian category A with enough projectives (HA, Prop. 1.3.2.19, pp. 92–94).
- **Projective resolutions** (construction (∗) in the proof, p. 93). Every complex `A_*` receives a chain map `f : P → A_*` from a complex of projectives with `P_n = 0` for `n < 0` that induces isomorphisms on `H_k` for all `k ≥ 0`. If `A_*` lies in `D⁻(A)` and `H_n(A_*) = 0` for `n < 0`, then f is a chain homotopy equivalence. The route constructs `P_n`, `d_n` and `f_n` by induction on n, at each step choosing a projective with an epimorphism onto the fiber product of `A_n` and the cycles of `P_{n−1}` over the cycles of `A_{n−1}`. The final claim holds because a quasi-isomorphism between complexes of projectives in `Ch⁻(A)` is a chain homotopy equivalence, by §4.3 and the Yoneda lemma in the homotopy category. The `Suggested.lean` declaration `exists_connective_projective_resolution` states this item.
- **The t-structure.** The full subcategories `D⁻_{≥0}(A)` and `D⁻_{≤0}(A)` of `D⁻(A)`, on complexes with `H_n = 0` for `n < 0` and for `n > 0` respectively, form a t-structure. Closure under the appropriate shifts is immediate. Orthogonality, `Ext^0(X, Y) = 0` for X in `D⁻_{≥0}(A)` and Y in `D⁻_{≤−1}(A)`, follows from §4.3 after replacing X by its projective resolution. For the truncation triangle of X, the resolution `f : P → X` has cofiber in `D⁻_{≤−1}(A)`, by the mapping cone description of cofibers (§2.4).
- **The heart** (last paragraph of the proof, pp. 93–94). `H_0` induces a functor from `N_dg(Ch(A))` to the nerve `N(A)`, which restricts to an equivalence from the heart of `D⁻(A)` to `N(A)`. By the resolutions, the heart is equivalent to the full subcategory of complexes of projectives in nonnegative degrees with homology concentrated in degree 0. There `H_0` is fully faithful by HA Lemma 1.3.2.21 (§4.3), and it is essentially surjective by resolving objects placed in degree 0. `H_0` factors through the homotopy category (`TauCeti.dgNerve.homotopyCategoryEquiv`), on which quasi-isomorphisms of projective complexes are invertible.

*Needs:* §2.4.1 (HA, Prop. 1.3.2.10, Remark 1.3.2.17), §4.1.1 (HA, Def. 1.3.2.4), §4.2.1 (HA, Def. 1.3.2.7), §4.3.1 (HA, Lemma 1.3.2.20), §4.3.2 (HA, Lemma 1.3.2.21), §4.4.1 (HA, Cor. 1.3.2.18); `CategoryTheory.EnoughProjectives`, `TauCeti.dgNerve.homotopyCategoryEquiv`; Part StableInfinityCategories §3.1.1 (HA, Def. 1.2.1.1), §3.1.2 (HA, Def. 1.2.1.4), §3.3.3 (HA, Def. 1.2.1.11); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.6; Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11) and §2.1.8 (HTT, Def. 1.2.10.1); Part InfinityCategoryFoundations §2.4.1 (HTT, §1.2.10, essentially surjective functors).

**4.5.2.** Prove that for an abelian category A with enough projectives, the homotopy category of `D⁻(A)` is equivalent to Mathlib's `DerivedCategory.Minus A` as a triangulated category: the equivalence commutes with the shifts — that of §1.7 of Part StableInfinityCategories on the left, Mathlib's on the right — and carries distinguished triangles to distinguished triangles in both directions. A bare equivalence of categories would not pin the comparison down. The route identifies the homotopy category with chain homotopy classes (`TauCeti.dgNerve.homotopyCategoryEquiv`) of bounded-above complexes of projectives. Quasi-isomorphisms between such complexes are homotopy equivalences (§4.3), and every bounded-above complex receives a quasi-isomorphism from one by construction (∗) of §4.5.1 (HA, Remark 1.3.2.9, p. 89). The `Suggested.lean` declaration `nonempty_homotopyCategory_derivedMinusInfty_equiv` states the underlying equivalence of categories; the compatibility with the shift and the triangles is not statable at the pins, for want of the triangulated structure on the homotopy category of a stable quasicategory (see the module docstring).

*Needs:* `TauCeti.DGHomotopyCategory`, `TauCeti.dgNerve.homotopyCategoryEquiv`, §4.2.1, §4.3.1 (HA, Lemma 1.3.2.20), §4.5.1 (HA, Prop. 1.3.2.19, construction (∗)); `TauCeti.homotopyCategoryToDGHomotopyCategory`; Mathlib `DerivedCategory.Minus`, `HasDerivedCategory`.

### 4.6 `D⁻(A)` as a localization

**4.6.1.** Prove that for an abelian category A with enough projectives, the inclusion `D⁻(A) ⊆ N_dg(Ch⁻(A))` has a right adjoint G, that `G(α)` is an equivalence exactly when α is a quasi-isomorphism, and hence that `N_dg(Ch⁻(A))[W⁻¹] ≃ D⁻(A)` for W the quasi-isomorphisms (HA, Prop. 1.3.4.6, pp. 109–110). The route has three steps.
- Every N in `Ch⁻(A)` receives a quasi-isomorphism `M → N` with M in `D⁻(A)`, by construction (∗) of §4.5 applied to a shift. Maps out of objects of `D⁻(A)` see it as an equivalence, by §4.3 and the mapping-space description `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`.
- The coreflection criterion (HTT, Prop. 5.2.7.8, dual form) gives G.
- An equivalence `G(f)` in `D⁻(A)` is a chain homotopy equivalence (`TauCeti.dgNerve.isEquivalence_edgeMk_iff`), so f is a quasi-isomorphism by two-out-of-three. The last claim then follows from HA Example 1.3.4.3 (Part AdjunctionsAndLocalizations §2.4).

*Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §4.1.1 (HA, Def. 1.3.2.4), §4.1.2 (HA, Notation 1.3.2.6), §4.2.1 (HA, Def. 1.3.2.7), §4.3.1 (HA, Lemma 1.3.2.20), §4.5.1 (construction (∗)); `TauCeti.dgNerve.isEquivalence_edgeMk_iff`, `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`; Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.8), §2.4.4 (HA, Example 1.3.4.3); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.7).

**4.6.2.** Prove that for an abelian category A with enough projectives and W the quasi-isomorphisms in `Ch⁻(A)`, regarded as an ordinary category, there is a canonical equivalence `N(Ch⁻(A))[W⁻¹] ≃ D⁻(A)` (HA, Thm. 1.3.4.4, p. 109). `Ch⁻(A)` is closed under `N_*(Δ[1]) ⊗ −`. So HA Prop. 1.3.4.5 (§3.3) identifies `N_dg(Ch⁻(A))` with the localization of `N(Ch⁻(A))` at chain homotopy equivalences. Chain homotopy equivalences are quasi-isomorphisms, so localizing further at W gives `D⁻(A)` by §4.6.1. The `Suggested.lean` declaration states this as `exists_isLocalizationAt_quasiIso_derivedMinusInfty`, with `Ch⁻(A)` given by the predicate `IsBoundedAbove` and the localization predicate `IsLocalizationAt` of Part AdjunctionsAndLocalizations §2.4 restated there.

*Needs:* §3.3.2 (HA, Prop. 1.3.4.5), §4.1.2 (HA, Notation 1.3.2.6), §4.2.1 (HA, Def. 1.3.2.7), §4.6.1 (HA, Prop. 1.3.4.6); Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1); Mathlib `SSet.Quasicategory`.

### 4.7 The connective part through simplicial objects

**4.7.1.** Prove that for an idempotent complete additive category A, the Dold–Kan functor `Ch(A)_{≥0} → Fun(Δ^op, A)` is a weak equivalence of simplicial categories, that is, a Dwyer–Kan equivalence (HA, Prop. 1.3.2.23, pp. 94–96). Here `Ch(A)_{≥0}` has the simplicial structure induced from `Ch(A)_Δ`, `Fun(Δ^op, A)` has the simplicial structure through Alexander–Whitney maps, and DK is a simplicial functor between them. It is essentially surjective by the Dold–Kan correspondence (HA, Thm. 1.2.3.7; Mathlib `CategoryTheory.Idempotents.DoldKan.equivalence`). For full faithfulness, write `A[n]` for an object A of A in degree n, and call P good, for a fixed Q, when the map `θ_P` of mapping spaces from P to Q and from `DK P` to `DK Q` is a weak homotopy equivalence. The route has two steps.
- Generators (steps (1) to (3) of the proof, p. 95): `A[0]` is good, `θ_{A[0]}` being an isomorphism; `E(n) ⊗ A[0]` is good, both mapping spaces being contractible; and for `n ≥ 1`, restriction along `A[n−1] → E(n) ⊗ A[0]` is a Kan fibration on the Dold–Kan side, as a pullback of `Fun(Δ[n], X) → Fun(∂Δ[n], X)` for a Kan complex X. This is a direct computation through Alexander–Whitney and the description of `π_n` of mapping spaces as chain homotopy classes (§2.1).
- Cell attachment (steps (4) to (6), p. 96): good complexes are closed under pushouts along `A[n−1] → E(n) ⊗ A[0]`, so every `A[n]`, every bounded complex in `Ch(A)_{≥0}`, and every complex in `Ch(A)_{≥0}` is good. The attaching maps are degreewise split, so the pushouts are homotopy pushouts on both sides (§2.3), and the fibration step makes them homotopy pullbacks of mapping spaces. Bounded complexes are built by finitely many attachments. A general complex is the colimit (union) of the sequence of its brutal truncations, so its mapping spaces are the limit of a tower of Kan fibrations (§2.3), and a limit of such towers along levelwise weak homotopy equivalences is a weak homotopy equivalence.

*Needs:* §2.1.1 (HA, Remark 1.3.2.3), §2.2.1 (HA, Prop. 1.3.2.11), §2.3.1 (HA, Cor. 1.3.2.14, Remark 1.3.2.15), §2.3.2 (HA, Cor. 1.3.2.16); `TauCeti.DGSimplicialCategory`; Part StableInfinityCategories §5.3.2 (HA, Thm. 1.2.3.7), §5.4.2 (HA, Construction 1.2.3.22, Remark 1.2.3.25); Part InfinityCategoryFoundations §2.4.1 (HTT, §1.2.10); ModelCategoryTheory, Part KanQuillen §3.1.1 (HTT, §A.2.7, weak homotopy equivalences), §3.2.1 (Kan fibrations); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); ModelCategoryTheory, Part SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7), §3.2.1 (HTT, §A.2.8 after Prop. A.2.8.7).

**4.7.2.** Prove that for an abelian category A with enough projectives, `D⁻_{≥0}(A)` is equivalent to the underlying ∞-category (the coherent nerve) of the simplicial category `Fun(Δ^op, A_proj)` (HA, Prop. 1.3.2.22, pp. 94, 97). On finite K, its mapping spaces are given by `Hom(K, Map(P, P')) = Hom(ℤK ⊗ P, P')`. The route is a zigzag of equivalences:
- `D⁻_{≥0}(A)` is equivalent to `N_dg(Ch(A_proj)_{≥0})`, by construction (∗) of §4.5;
- `N_dg(Ch(A_proj)_{≥0})` is equivalent to `N(Ch(A_proj)_{≥0, Δ})`, by §1.2;
- the last is equivalent to `N(Fun(Δ^op, A_proj))`, by §4.7.1.

*Needs:* §1.2.2 (HA, Prop. 1.3.1.17), §4.1.1 (HA, Def. 1.3.2.4), §4.5.1 (HA, Prop. 1.3.2.19: construction (∗) and the definition of `D⁻_{≥0}(A)`), §4.7.1 (HA, Prop. 1.3.2.23); `TauCeti.dgNerve.homotopyCategoryEquiv`, `TauCeti.DGSimplicialCategory`; Part StableInfinityCategories §1.4.1 (HA, Def. 1.1.2.1), §5.3.2 (HA, Thm. 1.2.3.7), §5.4.2 (HA, Construction 1.2.3.22); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Mathlib `CategoryTheory.SimplicialNerve`.

### Examples

- For A the category of modules over a ring R, `D⁻(A)` is the ∞-category of bounded-below (homologically) complexes of projective R-modules. `Ext^i_{D⁻(A)}(M, N)` is the classical `Ext^i_R(M, N)` for modules M and N.
- For A the category of vector spaces over a field, `D⁻_{≥0}(A)` is equivalent to the coherent nerve of simplicial vector spaces, by §4.7.

### Dependencies

Layers 1–3; Part InfinityCategoryFoundations (§1.2, §2.1); Part StableInfinityCategories (§1.1); Part AdjunctionsAndLocalizations (§2.3, §2.4); Part StableInfinityCategories (§1.4, §2.1, §3.1, §3.3, §5.3, §5.4) for additive categories, stable subcategories, t-structures and Dold–Kan; Mathlib's projective objects and bounded-above derived category; ModelCategoryTheory (SimplicialCategories, KanQuillen) for homotopy limits, Kan fibrations and towers.

## Layer 5: Universal properties of `D⁻(A)`

### 5.1 Right exact functors and projective objects

**5.1.1.** Prove that for an abelian category A with enough projectives and an ordinary category B with finite colimits, restriction is an equivalence from right exact functors `A → B` to functors `A_proj → B` that preserve finite coproducts (HA, Lemma 1.3.3.9, p. 102). One route constructs the inverse explicitly. An object with projective presentation `P_1 → P_0 → A` goes to the coequalizer of `f(d)` and the zero map `f(0)` from `f(P_1)` to `f(P_0)`. The zero map exists because f preserves the empty coproduct. Comparison of projective resolutions makes this independent of choices. The `Suggested.lean` declarations state the restriction functor as `restrictToProjectives` and the claim as `full_restrictToProjectives`, `faithful_restrictToProjectives` and `essImage_restrictToProjectives`.

*Needs:* §4.1.1 (HA, Def. 1.3.2.4); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); `CategoryTheory.EnoughProjectives`.

**5.1.2.** Prove that for a small abelian category A with enough projectives, the category `A^∧` of product-preserving presheaves of sets on `A_proj` is the category of Ind-objects of A, is abelian, and has enough projectives (HA, Prop. 1.3.3.13, pp. 105–106). The first claim is §5.1.1 with B the opposite of the category of sets. Abelianness then follows from Mathlib's abelian structure on `CategoryTheory.Ind`. For projectives, the representables on projectives are projective in `A^∧`, and every object is a quotient of a coproduct of them. The `Suggested.lean` declarations `nonempty_ind_equiv_finiteProductPreservingPresheaves` and `enoughProjectives_ind` state the first and third claims; abelianness of `CategoryTheory.Ind` is Mathlib's.

*Needs:* §4.1.1 (HA, Def. 1.3.2.4), §5.1.1 (HA, Lemma 1.3.3.9); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4; §1.2.11); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def. 5.3.5.1); Mathlib `CategoryTheory.Ind`.

### 5.2 The connective part as `P_Σ`, and left completeness

**5.2.1.** Prove that for a small abelian category A with enough projectives, there is an equivalence `ψ : D⁻_{≥0}(A^∧) → P_Σ(N(A_proj))` whose composite with `N(A_proj) ⊆ D⁻(A^∧)^♥` is the Yoneda embedding (HA, Prop. 1.3.3.14, p. 106). Simplicial objects of `A^∧` carry Quillen's simplicial model structure (HTT, Prop. 5.5.9.1), in which every object is fibrant (`SSet.kanComplex_of_addGroup`) and the cofibrant objects are the degreewise projective ones. Then §4.7 identifies `D⁻_{≥0}(A^∧)` with its underlying ∞-category, and HTT Cor. 5.5.9.3 identifies that with `P_Σ(N(A_proj))`.

*Needs:* §4.2.1 (HA, Def. 1.3.2.7), §4.5.1 (HA, Prop. 1.3.2.19: the heart), §4.7.2 (HA, Prop. 1.3.2.22), §5.1.2 (HA, Prop. 1.3.3.13); `SSet.kanComplex_of_addGroup`; Part PresentableInfinityCategories §7.1.1 (HTT, Def. 5.5.8.8), §9.1.1 (HTT, Prop. 5.5.9.1), §9.4.1 (HTT, Cor. 5.5.9.3); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3); Mathlib `SSet.Quasicategory`.

- **5.2.2.** Prove that for a small abelian category A with enough projectives, `D⁻(A)` is a full subcategory of `D⁻(A^∧)`, and that an object of `D⁻(A^∧)` lies in the essential image exactly when all its homology objects lie in A (HA, Remark 1.3.3.15, p. 106). Full faithfulness holds because projectives of A stay projective in `A^∧` and the mapping complexes agree. The embedding `A → A^∧`, sending X to the restriction of `Hom_A(−, X)` to `A_proj`, is exact: it preserves kernels because each `Hom_A(P, −)` does, and cokernels because each `Hom_A(P, −)` with P projective is exact and cokernels in `A^∧` are computed objectwise, an objectwise cokernel of finite-product-preserving presheaves of abelian groups preserving finite products. So the homology objects of a complex of A, computed in `A^∧`, are those computed in A, and every object of `D⁻(A)` has its homology in A. For the essential image, let X have all its homology in A and, after a shift, `X_n = 0` for `n < 0`. Build a complex P of projectives of A with `P_n = 0` for `n < 0` and a chain map `f : P → X` by induction on n, as in construction (∗) of §4.5 but killing homology. At stage n, cover by a projective of A both `H_n(X)` and the kernel of the map on `H_{n−1}` from the complex built in the earlier stages to X, and lift the covering maps to the cycles of `X_n` and to the fiber product of the cycles of `P_{n−1}` with `X_n` over `X_{n−1}`. Both objects covered lie in A, because A is closed under kernels and homology in `A^∧`, and the lifts exist because projectives of A stay projective in `A^∧`. Then f induces isomorphisms on all homology: onto `H_n(X)` through the first cover, and injectively because stage n + 1 kills the kernel at stage n. A quasi-isomorphism of complexes of projectives in `Ch⁻(A^∧)` is a chain homotopy equivalence (§4.5).

  *Needs:* §4.1.1 (HA, Def. 1.3.2.4), §4.2.1 (HA, Def. 1.3.2.7), §4.5.1 (HA, Prop. 1.3.2.19: construction (∗)), §5.1.2 (HA, Prop. 1.3.3.13).

**5.2.3.** Prove that for an abelian category A with enough projectives, the t-structure on `D⁻(A)` is right bounded and left complete (HA, Prop. 1.3.3.16, pp. 106–107). Right boundedness holds by definition of `Ch⁻`. For left completeness, right boundedness reduces the claim to the connective part: for a compatible tower `(X_k)` in `lim_k D⁻(A)_{≤k}`, the terms have a common bound below, so it suffices that `D⁻_{≥0}(A) → lim_k D⁻_{≥0}(A) ∩ D⁻_{≤k}(A)` is an equivalence, the limit taken in `Ĉat∞` along the truncations τ≤k. Pass to a larger universe in which A is small (HA's reduction; Mathlib `CategoryTheory.AsSmall`): `D⁻(A)`, its t-structure and the limit of its truncation tower are unchanged, so left completeness does not depend on the universe. The route then has four steps.

1. **From A to `A^∧`.** The t-structures on `D⁻(A)` and `D⁻(A^∧)` are both defined by homology (§4.5), and homology of complexes of A is the same in A and in `A^∧` (Remark 1.3.3.15, §5.2.2). So the embedding `D⁻(A) ⊆ D⁻(A^∧)` is t-exact and its essential image, the objects with all homology in A, is closed under τ≤k, since `H_n(τ≤k X)` is `H_n(X)` for n ≤ k and 0 otherwise. Mapping spaces in a limit of ∞-categories are the limits of the mapping spaces (Part Straightening §3.2), so `lim_k D⁻_{≥0}(A) ∩ D⁻_{≤k}(A)` is the full subcategory of `lim_k D⁻_{≥0}(A^∧) ∩ D⁻_{≤k}(A^∧)` on the towers with every term in the image. If the comparison functor for `A^∧` is an equivalence, such a tower is the tower of truncations of some X in `D⁻_{≥0}(A^∧)`, and `H_n(X) = H_n(τ≤n X)` lies in A for every n, so X lies in `D⁻_{≥0}(A)`. Hence the comparison functor for A is an equivalence when the one for `A^∧` is.
2. **Truncated parts through ψ.** For a t-structure on a stable C, an object X of C≥0 is k-truncated as an object of the ∞-category C≥0 (Part InfinityCategoryFoundations §10.1) exactly when X lies in C≤k, for k ≥ −1. Indeed, if X is in C≤k and Y in C≥0, then `π_n Map(Y, X) = Ext^{−n}(Y, X) = Hom(Y[n], X)` vanishes for n > k, since Y[n] lies in C≥k+1, at every base point because Map(Y, X) is an infinite loop space (Part StableInfinityCategories §1.8; the orthogonality axiom of Part StableInfinityCategories §3.1). Conversely, if every Map(Y, X) with Y in C≥0 is k-truncated, write `τ≥k+1 X = Z[k+1]` with Z in C≥0. Then `Map(τ≥k+1 X, τ≥k+1 X) ≃ Map(Z[k+1], X)` (τ≥k+1 is right adjoint to the inclusion), whose π₀ is `π_{k+1} Map(Z, X) = 0`. So τ≥k+1 X ≃ 0, and X lies in C≤k by the fiber sequence τ≥k+1 X → X → τ≤k X (Part StableInfinityCategories §3.2). The functor τ≤k carries C≥0 into C≥0 ∩ C≤k (Part StableInfinityCategories §3.2), so on C≥0 it is a left adjoint to the inclusion of the k-truncated objects, that is, the truncation functor of C≥0 (Part PresentableInfinityCategories §6.2). The equivalence ψ therefore carries `D⁻_{≥0}(A^∧) ∩ D⁻_{≤k}(A^∧)` onto the k-truncated objects `τ≤k P_Σ(N(A_proj))` and commutes with the truncation functors, and the claim for `A^∧` becomes the statement that `P_Σ(N(A_proj))` is Postnikov complete (Part PresentableInfinityCategories §6.4).
3. **Truncation in `P_Σ` and in S.** Limits in `P_Σ(N(A_proj))` are computed objectwise, because `P_Σ ⊆ P` is a reflective localization (Part PresentableInfinityCategories §7.1, item 1), hence closed under limits, and limits in P are pointwise (Part LimitsAndKanExtensions §8.2). The k-truncated objects are the presheaves with k-truncated values, and τ≤k is computed objectwise (Part PresentableInfinityCategories §7.5, HTT, Rem. 5.5.8.26). In S, the ∞-categorical τ≤k of a Kan complex K is Moore's Postnikov section K(k), which commutes with finite products (Part InfinityTopoi §12.2, Postnikov sections are truncations, and its finite-product statement, HTT, Lemma 6.5.1.2). Consequently a map Y → Z of Kan complexes with Z k-truncated and bijective on π_i for i ≤ k exhibits Z as τ≤k Y: the induced map Y(k) → Z is a map of k-truncated Kan complexes bijective on all homotopy groups, hence an equivalence by Whitehead's theorem (ModelCategoryTheory, Part KanQuillen §1.3).
4. **Postnikov completeness.** By Part PresentableInfinityCategories §6.3 (HTT, Prop. 5.5.6.26) and §6.4, it suffices that a tower in `P_Σ(N(A_proj))` is a Postnikov tower exactly when it is a limit diagram whose pretower is a Postnikov pretower. By step 3 both conditions are objectwise, so it suffices to prove this in S. A tower in S is modeled by a tower of Kan fibrations whose strict limit is the ∞-categorical limit (ModelCategoryTheory, Part SimplicialCategories §4.2; Part LimitsAndKanExtensions §3.2, dually). If its pretower is a Postnikov pretower, each `X_n` is n-truncated and each `X_{n+1} → X_n` is bijective on π_i for i ≤ n (step 3), so the limit X has `X → X_n` bijective on π_i for i ≤ n (ModelCategoryTheory, Part KanQuillen §5.3), and `X → X_n` exhibits `X_n` as τ≤n X by step 3. Conversely, a Postnikov tower of X is, by step 3, equivalent to Moore's tower of X, whose limit is X (Part KanQuillen §5.2, §5.3).

*Needs:* §4.2.1 (HA, Def. 1.3.2.7), §4.5.1 (HA, Prop. 1.3.2.19), §5.1.2 (HA, Prop. 1.3.3.13), §5.2.1 (HA, Prop. 1.3.3.14), §5.2.2 (HA, Remark 1.3.3.15); Mathlib `CategoryTheory.AsSmall`; Part StableInfinityCategories §1.8.1 (HA, Not. 1.1.2.17), §3.1.1 (HA, Def. 1.2.1.1), §3.2.1 (HA, Prop. 1.2.1.5, Not. 1.2.1.7, Rem. 1.2.1.8; the k-truncated objects of C≥0, HA, Warn. 1.2.1.9, by the argument of step 2) and §8.1 (HA, §1.2.1, the definitions after Props. 1.2.1.16 and 1.2.1.17); Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1, limits of ∞-categories); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4) and §10.1.3 (HTT, Def. 5.5.6.1); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1) and §8.2.2 (HTT, Prop. 5.1.2.2); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.3.1 (HTT, Def. 5.5.6.23), §6.3.2 (HTT, Prop. 5.5.6.26), §6.4.1 (SAG, Def. A.7.2.1), §7.1.1 (HTT, Def. 5.5.8.8), §7.1.2 (HTT, Prop. 5.5.8.10 (1)) and §7.5.1 (HTT, Rem. 5.5.8.26); Part InfinityTopoi §12.2.1 (Postnikov sections are truncations) and §12.2.2 (HTT, Lemma 6.5.1.2); ModelCategoryTheory, Part KanQuillen §1.3.3 (Whitehead's theorem), §5.1.1 (Postnikov sections), §5.2.1 (HTT, §A.2.7, Postnikov towers), §5.3.1 (convergence of towers); ModelCategoryTheory, Part SimplicialCategories §4.2.1 (HTT, Cor. A.2.9.24, Cor. A.2.9.25, towers of fibrations).

### 5.3 Right exact functors on connective parts

This section uses HA, Lemma 1.3.3.10 as stated in Part PresentableInfinityCategories §7.6: an ∞-category with finite coproducts and geometric realizations has finite colimits; an n-category with finite colimits has geometric realizations; in such an n-category the realization of a simplicial object is the colimit of its restriction to `N(Δ≤n)^op`, a finite colimit (its fourth assertion); and a functor between such ∞-categories that preserves finite coproducts and geometric realizations is right exact, with the converse for n-categories. Its dual for totalizations is stated in Part PresentableInfinityCategories §7.6 as well. The statements below are its consequences for t-structures.

**5.3.1.** Prove that, for stable ∞-categories C and C' with t-structures and C right bounded, restriction is an equivalence from the right t-exact functors `C → C'` to the right exact functors `C_{≥0} → C'_{≥0}` (HA, Lemma 1.3.3.11 (1), pp. 103–104). The route is Lurie's: `Fun(C, C')` is the limit of the tower of `Fun(C_{≥−n}, C')` (HTT, Prop. 3.3.3.1), and each stage is determined by the previous one through translation, `F ↦ Σ⁻¹ ∘ F ∘ Σ`, so the tower of right exact functors is essentially constant.

*Needs:* Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1), §3.1.2 (HA, Def. 1.2.1.4), §3.2.1 (HA, Remark 1.2.1.8), §8.1.1 (HA, §1.2.1, the definition after Prop. 1.2.1.16); Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4; §1.2.11) and §10.1.2 (HTT, Def. 2.3.4.1); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3).

**5.3.2.** Prove that, for stable ∞-categories C and C' with left complete t-structures, `C_{≥0}` and `C'_{≥0}` have geometric realizations of simplicial objects, and a functor `C_{≥0} → C'_{≥0}` is right exact exactly when it preserves finite coproducts and geometric realizations (HA, Lemma 1.3.3.11 (2), p. 104). The route is Lurie's: `C_{≥0}` is the limit of its truncations `C_{≥0} ∩ C_{≤n}`, which are `(n+1)`-categories, along right exact truncation functors, so the criterion for (n+1)-categories of HA, Lemma 1.3.3.10 (Part PresentableInfinityCategories §7.6) applies stagewise.

*Needs:* Part PresentableInfinityCategories §7.6.1 (HA, Lemma 1.3.3.10); Part StableInfinityCategories §3.1.2 (HA, Def. 1.2.1.4), §8.1.3 (HA, §1.2.1, the definition after Prop. 1.2.1.17); Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4; §1.2.11); Part LimitsAndKanExtensions §9.4.2 (HTT, Notation 6.1.2.12).

### 5.4 Functors out of the connective part

**5.4.1.** Prove the flagship theorem (HA, Thm. 1.3.3.8, pp. 101, 107). Let A be an abelian category with enough projectives and C an ∞-category with geometric realizations of simplicial objects. Restriction along `N(A_proj) ⊆ D⁻_{≥0}(A)` is an equivalence from the full subcategory of `Fun(D⁻_{≥0}(A), C)` on functors preserving geometric realizations to `Fun(N(A_proj), C)`. Moreover, such a functor preserves finite coproducts exactly when its restriction to `N(A_proj)` does.
- After passing to a larger universe in which A is small (HA's reduction; the statement does not depend on the universe), present `D⁻_{≥0}(A)` as a closure of the representables (HA, Lemma 1.3.3.17, p. 107): the image of `D⁻_{≥0}(A)` under ψ (§5.2) is the smallest full subcategory of `P(N(A_proj))` that contains the representables and is closed under geometric realizations. Closure holds because `D⁻_{≥0}(A)` is closed under geometric realizations in `D⁻_{≥0}(A^∧)`, by §5.3 (HA, Lemma 1.3.3.11 (2)), both being left complete (§5.2). Generation holds because every object of `D⁻_{≥0}(A)` is the geometric realization of the simplicial object of `A_proj` given by Dold–Kan (§4.7), computed by HTT Thm. 4.2.4.1 and Prop. 5.5.9.14.
- So this image is `P^𝒦_R(N(A_proj))` of Part PresentableInfinityCategories §4.7 with R empty and 𝒦 = {N(Δ)^op}, and its universal property there (HTT, Prop. 5.3.6.2), with HTT Prop. 4.3.2.15, identifies realization-preserving functors with their restrictions.
- For the second part, the "only if" direction is clear. For the "if" direction, extend to `P_Σ(N(A_proj))` through ψ and use that a functor out of `P_Σ` preserving sifted colimits preserves finite coproducts exactly when its restriction does (HTT, Prop. 5.5.8.15, Lemma 5.3.5.7).

The `Suggested.lean` declarations state the two parts as `exists_isCategoricalEquivalence_restrict_projectivesInDegreeZero` and `preservesFiniteCoproducts_iff_restrict`. There `D⁻_{≥0}(A)` is the full subcategory `connectiveDerivedMinusInfty` of `N_dg(Ch(A))` on `IsConnectiveBoundedAboveProjective`, and `N(A_proj)` is the full subcategory `projectivesInDegreeZero` on `IsProjectiveInDegreeZero`, which is the nerve of `A_proj` by §1.1 (HA, Remark 1.3.1.9). Colimits are expressed through `IsColimitDiagram` (Part InfinityCategoryFoundations §1.2), the indexing simplicial set `simplexOp` of `N(Δ)^op` (restated from Part PresentableInfinityCategories's `Suggested.lean`), `HasGeometricRealizations` and `PreservesGeometricRealizations` (geometric realizations in the sense of Part LimitsAndKanExtensions §9.4, stated here), `PreservesFiniteCoproductDiagrams` (preservation of colimit diagrams indexed by finite discrete simplicial sets, including the empty one) and the full subcategory `realizationPreservingFunctors`.

**Checks.**
- For n = 0 the indexing set is empty, so `PreservesFiniteCoproductDiagrams F` includes preserving initial objects. The constant functor at the vertex 1 on `Δ[1]`, the nerve of the poset 0 < 1 in which coproducts are maxima, preserves binary coproducts but not the initial object 0; a definition over nonempty finite sets would accept it.
- The nerve of the category of nonempty finite sets has geometric realizations: a simplicial object in the nerve of a category has as colimit the coequalizer of `d₀, d₁ : X₁ ⇉ X₀`, a nonempty quotient of `X₀`. It lacks the limit of the cosimplicial object `[n] ↦ {0, …, n}`, whose limit in sets is the empty equalizer of the two maps from a point to a two-element set. A definition indexed by `N(Δ)` (totalizations) would reject it.
- Every map out of `Δ[0]` preserves geometric realizations, since the colimit of a constant diagram indexed by the weakly contractible `N(Δ)^op` is its value. The inclusion of the vertex 1 into `Δ[1]` does not preserve the empty colimit, so a definition requiring all colimits to be preserved would reject it.

*Needs:* §4.1.1 (HA, Def. 1.3.2.4), §4.2.1 (HA, Def. 1.3.2.7), §4.7.2 (HA, Prop. 1.3.2.22), §5.2.1 (HA, Prop. 1.3.3.14), §5.2.2 (HA, Remark 1.3.3.15), §5.2.3 (HA, Prop. 1.3.3.16), §5.3.2 (HA, Lemma 1.3.3.11 (2)); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1), §7.4.6 (HTT, Prop. 4.3.2.15); Part PresheavesAndCompletions §6.5.1 (HTT, Lemma 5.3.5.7); Part LimitsAndKanExtensions §9.4.2 (HTT, Notation 6.1.2.12); Part PresentableInfinityCategories §4.7.2, §4.7.5 (HTT, Prop. 5.3.6.2), §7.1.1 (HTT, Def. 5.5.8.8), §7.3.1 (HTT, Prop. 5.5.8.15), §9.4.2 (HTT, Prop. 5.5.9.14); Mathlib `CategoryTheory.AsSmall`; Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3), §4.1.1 (HTT, Defs. 5.3.1.7, 5.5.8.1) and §5.1.1; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4; §1.2.11); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part StableInfinityCategories §5.3.2 (HA, Thm. 1.2.3.7).

### 5.5 The universal property of `D⁻(A)`

**5.5.1.** Prove that for an abelian category A with enough projectives and a stable ∞-category C with a left complete t-structure, restriction induces an equivalence. It goes from the right t-exact functors `D⁻(A) → C` to the functors `N(A_proj) → C_{≥0}` that preserve finite coproducts (HA, Prop. 1.3.3.12, p. 105). By the first part of HA Lemma 1.3.3.11 (§5.3), since `D⁻(A)` is right bounded (§5.2), right t-exact functors are right exact functors between connective parts. By its second part, these are the functors preserving finite coproducts and geometric realizations, as both sides are left complete. The flagship theorem (§5.4) then identifies them with coproduct-preserving functors on `N(A_proj)`.

*Needs:* §4.1.1 (HA, Def. 1.3.2.4), §4.2.1 (HA, Def. 1.3.2.7), §4.5.1 (HA, Prop. 1.3.2.19), §5.2.3 (HA, Prop. 1.3.3.16), §5.3.1 (HA, Lemma 1.3.3.11 (1)), §5.3.2 (HA, Lemma 1.3.3.11 (2)), §5.4.1 (HA, Thm. 1.3.3.8); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1), §3.1.2 (HA, Def. 1.2.1.4), §8.1.3 (the definition after HA, Prop. 1.2.1.17); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part LimitsAndKanExtensions §9.4.2 (HTT, Notation 6.1.2.12).

**5.5.2.** Prove the universal property of `D⁻(A)` (HA, Thm. 1.3.3.2, p. 97). Let A be an abelian category with enough projectives, C a stable ∞-category with a left complete t-structure, and E the full subcategory of `Fun(D⁻(A), C)` on right t-exact functors carrying projectives of A into the heart. Then `F ↦ τ_{≤0} ∘ F`, restricted to `D⁻(A)^♥ ≃ N(A)`, is an equivalence from E to the nerve of the category of right exact functors `A → C^♥`. One route: by §5.5.1, restriction identifies E with the coproduct-preserving functors `N(A_proj) → C^♥`. Since `C^♥` is the nerve of an abelian category, HA Lemma 1.3.3.9 (§5.1) identifies those with right exact functors `A → C^♥`. Finally `τ_{≤0} ∘ F` agrees with F on projectives.

*Needs:* §4.1.1 (HA, Def. 1.3.2.4), §4.2.1 (HA, Def. 1.3.2.7), §4.5.1 (HA, Prop. 1.3.2.19, the heart), §5.1.1 (HA, Lemma 1.3.3.9), §5.5.1 (HA, Prop. 1.3.3.12); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1), §3.1.2 (HA, Def. 1.2.1.4), §8.1.3 (the definition after HA, Prop. 1.2.1.17); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3).

- **5.5.3.** Prove that for F in E with underlying right exact functor `f : A → C^♥`, these are equivalent: F is left t-exact; F carries `N(A) ⊆ D⁻(A)` into the heart; f is exact (HA, Remark 1.3.3.6, pp. 98–99). The first implies the second trivially. The second implies the first by induction on the amplitude of an object of `D⁻(A)_{≤0}`, through its truncation fiber sequences. The second and third are equivalent by comparing the long exact sequence of homotopy objects of F applied to a short exact sequence in A, using the kernel and cokernel description in the heart.

  *Needs:* §4.2.1 (HA, Def. 1.3.2.7), §4.5.1 (HA, Prop. 1.3.2.19, the heart); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1), §3.1.2 (HA, Def. 1.2.1.4), §3.2.1 (HA, Remark 1.2.1.8), §3.3.1, §3.3.3 (HA, Def. 1.2.1.11, Remark 1.2.1.12, p. 40, on kernels and cokernels in the heart); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4; Def. 1.1.1.9); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1).

### 5.6 Recognizing `D⁻`

**5.6.1.** Prove the recognition criterion for `D⁻` (HA, Prop. 1.3.3.7, pp. 99–101). Let C be a stable ∞-category with a left complete t-structure whose heart `A = h(C^♥)` has enough projectives. There is an essentially unique t-exact functor `F : D⁻(A) → C` extending the inclusion `N(A) ≃ C^♥ ⊆ C`. These are equivalent: (i) F is fully faithful; (ii) `Ext^i_C(P, Y) = 0` for `i > 0`, P projective and Y in A; (iii) for P projective, every Y in A embeds in some Z in A with `Ext^i_C(P, Z) = 0` for `i > 0`. When they hold, the essential image of F is the right-bounded part `⋃_n C_{≥−n}`. One route has four steps.
- Existence and uniqueness of F come from §5.5, with exactness of the inclusion of the heart and HA Remark 1.3.3.6 for t-exactness (p. 99).
- (i) ⇒ (ii) ⇔ (iii) (pp. 99–100): `Ext^i_{D⁻(A)}(P, Y)` vanishes for `i > 0` (§4.3), and the equivalence of the last two goes by induction on i, through the Ext sequence of `0 → Y → Z → Z/Y → 0`, projectivity of P giving the case `i = 1`.
- (ii) ⇒ (i) (pp. 100–101), by dévissage. Both sides are left complete (§5.2), so mapping spaces are limits over the truncations of the target, and it suffices to treat bounded targets, then by translations and extensions targets in the heart. On the source side, truncating a projective resolution changes nothing in the relevant degrees, which reduces to finite complexes of projectives and then to a single projective, where (ii) and §4.3 apply.
- The essential image (pp. 99, 101). F lands in the right-bounded part, so one may replace C by it. Then F is the limit of the functors `F_n : D⁻(A)_{≤n} → C_{≤n}`, since both sides are left complete. Each `F_n` is essentially surjective, by descending induction on connectivity: an object is the fiber of a map `A[m] → X[1]` with A in the heart and X already in the image, and the map lifts by full faithfulness.

*Needs:* §4.1.1 (HA, Def. 1.3.2.4), §4.3.2 (HA, Lemma 1.3.2.21), §4.5.1 (HA, Prop. 1.3.2.19), §5.2.3 (HA, Prop. 1.3.3.16), §5.5.2 (HA, Thm. 1.3.3.2), §5.5.3 (HA, Remark 1.3.3.6); Part StableInfinityCategories §8.1.1 (the definition after HA, Prop. 1.2.1.16), §8.1.2 (HA, Prop. 1.2.1.17), §3.3.1, §3.3.3 (HA, Remark 1.2.1.12, p. 40, on kernels and cokernels in the heart); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1); Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essentially surjective functors); ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, p. 851, homotopy limits), §4.2.2 (HTT, Cor. A.2.9.25, towers of fibrations).

### Examples

- For C = `D⁻(A)` itself, F is the identity, condition (ii) is the vanishing of §4.3, and the essential image is all of `D⁻(A)`, which is right bounded (§5.2).
- For A the category of modules over a ring R, the universal property sends a right exact functor `A → B` into the heart of a stable ∞-category to its left derived functor, for instance `− ⊗_R N`.

### Dependencies

Layer 4; Part InfinityCategoryFoundations (§1.1, §1.2, §2.1, §10.1); Part PresheavesAndCompletions (§4.1, §6.1); Part StableInfinityCategories (§1.1); Part InfinityCategoryFoundations (§2.4) for essential surjectivity; Part CartesianFibrations (§3.4); Part LimitsAndKanExtensions (§3.2, §7.4, §9.4) for homotopy colimits, Kan extensions and simplicial objects; Part Straightening (§3.2) for limits of ∞-categories; Part PresheavesAndCompletions (§6.5) for Ind; Part PresentableInfinityCategories (§4.7, §6.2–§6.4, §7.1, §7.3, §7.5, §7.6, §9.1, §9.4) for adjoining colimits, truncation and Postnikov completeness, `P_Σ`, HA Lemma 1.3.3.10 and Bergner's comparison; Part StableInfinityCategories (§1.8, §3.1–§3.3, §3.5, §5.3, §8.1) for Ext groups, t-structures, t-exact functors, Dold–Kan and left completeness; Part InfinityTopoi (§12.2) for truncation in S; Part LimitsAndKanExtensions (§8.2) for pointwise limits; ModelCategoryTheory (KanQuillen, SimplicialCategories) for Postnikov towers and homotopy limits.

## Layer 6: The injective model structure and `D(A)`

### 6.1 Grothendieck abelian categories

**6.1.1.** Define a Grothendieck abelian category as Mathlib's `CategoryTheory.IsGrothendieckAbelian`: locally small, with small filtered colimits that are exact, and a generator. HA's form is presentable, with monomorphisms closed under small filtered colimits (HA, Def. 1.3.5.1, p. 121). Prove that for an abelian category the two agree, with "presentable" read for the nerve (HTT, Def. 5.5.0.1), which for an ordinary category is local presentability (no source states this; comparing HA, Def. 1.3.5.1 with Mathlib's definition). One route: a presentable abelian category has a generator, the coproduct of a generating set, and its filtered colimits, which are right exact, are exact once they preserve monomorphisms. Conversely, for a generator G and a regular cardinal κ above the cardinality of the subobjects of G, the quotients of coproducts of fewer than κ copies of G form a small set of κ-presentable objects (Mathlib's `IsGrothendieckAbelian.preservesColimit_coyoneda_obj_of_mono` treats κ-filtered diagrams of monomorphisms), and every object is the κ-filtered union of its subobjects of this form. The `Suggested.lean` declaration `isGrothendieckAbelian_iff_isLocallyPresentable` states this, with closure of monomorphisms under filtered colimits as Mathlib's `MorphismProperty.IsStableUnderFilteredColimits`.

**Checks.**
- The category of abelian groups is Grothendieck, with generator ℤ. Its opposite is not: filtered colimits in the opposite are cofiltered limits, which are not exact in abelian groups. A definition without exactness of filtered colimits would accept the opposite.
- The category of finitely generated abelian groups is abelian with generator ℤ, but it lacks the coproduct of countably many copies of ℤ, so it is not Grothendieck. A definition asking only for an abelian category with a generator would accept it.
- Sheaves of abelian groups on [0, 1] form a Grothendieck abelian category, as Mathlib's instance for sheaves says, with no nonzero projective object. A definition asking for a projective generator would exclude it.

*Needs:* Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4); `CategoryTheory.IsGrothendieckAbelian`, `CategoryTheory.IsLocallyPresentable`, `IsGrothendieckAbelian.preservesColimit_coyoneda_obj_of_mono`.

### 6.2 The injective model structure

**6.2.1.** Prove that for a Grothendieck abelian category A, `Ch(A)` has a left proper combinatorial model structure whose cofibrations are the degreewise monomorphisms, whose weak equivalences are the quasi-isomorphisms, and whose fibrations are the maps with the right lifting property against monomorphic quasi-isomorphisms (HA, Prop. 1.3.5.3, pp. 121–123). The `Suggested.lean` declaration states the model structure, with left properness and combinatoriality, as `exists_modelCategory_injective`. Combinatorial is stated as local presentability together with small sets I and J whose left-lifting closures of their right-lifting classes are the cofibrations and the trivial cofibrations. One route builds the two factorizations from library results and checks the remaining axioms directly.
- Trivial fibrations. A chain map with the right lifting property against every monomorphism is a quasi-isomorphism (HA, Prop. 1.3.5.3, hypothesis (3) of Smith's theorem, p. 123): surjectivity on `H_n` comes from lifting against `0 → Z[n]`, with Z the n-cycles of the target, and injectivity from lifting against `E(0 → Z'', n+1) → E(id, n+1)` for a suitable fiber product `Z''`. Here `E(u, n)`, for a monomorphism `u : X' → X`, is the complex with u from degree n to degree `n−1`. Hence the maps lifting against all monomorphisms are exactly the fibrations that are quasi-isomorphisms: given such a fibration p, factor it as a monomorphism i followed by a map q lifting against all monomorphisms; q is a quasi-isomorphism, so i is one by two-out-of-three, p lifts against i, and p is a retract of q.
- Saturation. A pushout of a quasi-isomorphism along a degreewise monomorphism is a quasi-isomorphism (HA, Prop. 1.3.5.3, hypothesis (2), pp. 122–123), by the five lemma applied to the long exact sequences of the two short exact sequences, whose quotients agree. Since filtered colimits in A are exact, monomorphic quasi-isomorphisms are also closed under transfinite compositions, coproducts and retracts, so they form a weakly saturated class.
- The factorization into a monomorphism followed by a trivial fibration is Mathlib's instance `HasFunctorialFactorization (monomorphisms C) (monomorphisms C).rlp` for the Grothendieck abelian category `C = CochainComplex A ℤ`. It takes the place of HA's generation of the degreewise monomorphisms by the maps `E(u, n) → E(id_X, n)` for a generator X (HA, Prop. 1.3.5.3, first step of the proof, pp. 121–122).
- The factorization into a monomorphic quasi-isomorphism followed by a fibration comes from small generating trivial cofibrations. For large κ, Tau Ceti's `CochainComplex.exists_rlp_monoQuasiIsoOfCardinalLT_eq` makes the fibrations the maps lifting against `CochainComplex.monoQuasiIsoOfCardinalLT κ`. That class has a small set J of representatives up to isomorphism, since each target is degreewise a quotient of a coproduct of fewer than κ copies of a generator. The small object argument (`MorphismProperty.HasSmallObjectArgument` for J, whose domains are presentable in the locally presentable `Ch(A)`) factors every map as a map lifting against all maps that lift against J, followed by a fibration. By saturation the first factor is a monomorphic quasi-isomorphism. This replaces HA's appeal to Smith's theorem through the perfect class of quasi-isomorphisms (HA, Prop. 1.3.5.3, hypothesis (1), p. 122; HTT, Example A.2.6.13, Cor. A.2.6.14, Prop. A.2.6.15).
- The lifting axioms hold by the definition of the fibrations and by the description of trivial fibrations. Left properness is the pushout step of saturation. The structure is combinatorial, with generating cofibrations Mathlib's `IsGrothendieckAbelian.generatingMonomorphisms` of `CochainComplex A ℤ` and generating trivial cofibrations J.

*Needs:* §6.1.1 (HA, Def. 1.3.5.1); `CochainComplex.monoQuasiIsoOfCardinalLT`, `CochainComplex.exists_rlp_monoQuasiIsoOfCardinalLT_eq`, `MorphismProperty.HasSmallObjectArgument`, `IsGrothendieckAbelian.generatingMonomorphisms`, `MorphismProperty.HasFunctorialFactorization`, `HomotopicalAlgebra.ModelCategory`, `MorphismProperty.rlp`, `MorphismProperty.llp`, `MorphismProperty.IsSmall`, `IsLocallyPresentable`, `IsPushout`, `HomologicalComplex.quasiIso`; Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4); Part StableInfinityCategories §5.1.1 (HA, Def. 1.2.3.1); ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §3.4.1 (HTT, Def. A.2.4.1), §6.1.1 (HTT, Def. A.2.6.1).

### 6.3 Fibrant complexes and K-injective resolutions

The fibrant complexes are the K-injective complexes of injectives (`CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero`), so they are degreewise injective, and degreewise injective complexes bounded below in cochain degrees are fibrant (HA, Prop. 1.3.5.6, pp. 124–125; see the contracts). All complexes are cofibrant.

**6.3.1.** Prove that a Grothendieck abelian category has K-injective resolutions: every unbounded complex admits a quasi-isomorphism into a K-injective complex. This is Tau Ceti's class `TauCeti.HasKInjectiveResolutions` (a consequence of HA, Props. 1.3.5.3 and 1.3.5.6, pp. 121–125). Factor `K → 0` as a monomorphic quasi-isomorphism followed by a fibration (§6.2). The intermediate complex is fibrant, hence K-injective. The `Suggested.lean` declaration states this as `hasKInjectiveResolutions_of_isGrothendieckAbelian`.

*Needs:* §6.2.1 (HA, Prop. 1.3.5.3); `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero`, `TauCeti.HasKInjectiveResolutions`.

### 6.4 Mapping complexes into fibrant complexes

**6.4.1.** Prove the following for a Grothendieck abelian category A and a fibrant complex Q (HA, Lemmas 1.3.5.11 and 1.3.5.12, Prop. 1.3.5.14, pp. 126–127).
- For an acyclic complex M, the mapping complex `Map_{Ch(A)}(M, Q)` is acyclic (HA, Lemma 1.3.5.11, p. 126). Fibrant complexes are K-injective (§6.3). The claim then follows from Mathlib's `CochainComplex.IsKInjective.eq_δ_of_cocycle`: every cocycle from an acyclic complex into a K-injective complex is a coboundary.

  *Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §6.3.1 (`CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero`); `CochainComplex.IsKInjective.eq_δ_of_cocycle`; Part StableInfinityCategories §5.1.1 (HA, Def. 1.2.3.1).
- For a trivial cofibration `M' → M`, the restriction `Map(M, Q) → Map(M', Q)` is a quasi-isomorphism (HA, Lemma 1.3.5.12, p. 126). Each `Q_n` is injective (§6.3), so the restriction is degreewise surjective. Its kernel is `Map(M/M', Q)`, which is acyclic by the previous item.

  *Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §6.3.1 (HA, Prop. 1.3.5.6), the previous item (HA, Lemma 1.3.5.11).
- A quasi-isomorphism `M → M'` induces a quasi-isomorphism `Map(M', Q) → Map(M, Q)`. Consequently a quasi-isomorphism between fibrant complexes is a chain homotopy equivalence, and hence an equivalence in `D(A)` (HA, Prop. 1.3.5.14, p. 127). For the first claim, factor the map as a trivial cofibration followed by a trivial fibration. The first is handled by the previous item. The second has a section, since all objects are cofibrant, and the section is a trivial cofibration. For the consequence, fibrant complexes are K-injective (§6.3.1), and Tau Ceti's `CochainComplex.IsKInjective.exists_homotopyEquiv`, applied to `𝟙 K` and a quasi-isomorphism `f : K → L`, gives a homotopy equivalence homotopic to f; so f is a chain homotopy equivalence, and an equivalence in `D(A)` by §2.1.1.

  *Needs:* §2.1.1 (HA, Remark 1.3.2.3), §6.2.1 (HA, Prop. 1.3.5.3), §6.3.1 (`CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero`), the previous item (HA, Lemma 1.3.5.12); `CochainComplex.IsKInjective.exists_homotopyEquiv`; Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

### 6.5 The derived ∞-category `D(A)` and its stability

**6.5.1.** Define, for a Grothendieck abelian category A, the derived ∞-category `D(A)` as the dg nerve `N_dg(Ch(A)°)` of the full dg subcategory of `Ch(A)` on fibrant complexes, which are automatically cofibrant (HA, Def. 1.3.5.8, p. 125). In Lean it is `TauCeti.dgNerve R` of `TauCeti.DGFullSubcategory` for the predicate "has the right lifting property against monomorphic quasi-isomorphisms, as a map to the zero complex". The `Suggested.lean` declarations give the predicate as `IsInjectivelyFibrant` and the ∞-category as `derivedInfty`.
- Its objects are, by §6.3, the K-injective complexes of injectives.
- It is an ∞-category, it is a full subcategory of `N_dg(Ch(A))` (`TauCeti.DGFullSubcategory.dgNerveIso`), and its mapping spaces are computed by mapping complexes (`TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`).

**Checks.**
- For A the category of abelian groups, `π_0` of the mapping space in `D(A)` between fibrant replacements of ℤ/2 and of ℤ[1] is ℤ/2, computed with the fibrant replacement `ℚ → ℚ/ℤ` of ℤ. Taking all complexes, as in `N_dg(Ch(A))`, gives 0 for ℤ/2 and ℤ[1] placed in single degrees.
- For A the category of vector spaces over a field, every complex of vector spaces is fibrant, and `D(A)` is `N_dg(Ch(A))`.
- The acyclic complex of `ℤ/4`-modules of §1.1 is degreewise injective, since `ℤ/4` is self-injective, but it is not K-injective, since its identity is not null-homotopic. So it is not fibrant, and `D(A)` has no nonzero acyclic objects. Using "degreewise injective" alone would add a nonzero acyclic object.

*Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §6.2.1 (HA, Prop. 1.3.5.3); `TauCeti.dgNerve`, `TauCeti.DGFullSubcategory`, `TauCeti.DGFullSubcategory.dgNerveIso`; Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

**6.5.2.** Prove that for a Grothendieck abelian category A, `D(A)` is stable (HA, Prop. 1.3.5.9, pp. 125–126). By §2.4 it suffices that `D(A)` is a stable subcategory of `N_dg(Ch(A))`. It is closed under translation, so by HA Lemma 1.1.3.3 it suffices that the mapping cone of a map between fibrant complexes is fibrant. This holds by the lifting characterization, since cones are built from fibrant complexes by degreewise split extensions. The `Suggested.lean` declaration states this as `isStable_derivedInfty`.

*Needs:* §2.4.1 (HA, Prop. 1.3.2.10, Remark 1.3.2.17), §6.2.1 (HA, Prop. 1.3.5.3, the fibrations), §6.5.1 (HA, Def. 1.3.5.8); Part StableInfinityCategories §2.1.2 (HA, Def. 1.1.3.2, Lemma 1.1.3.3), §5.1.1 (HA, Def. 1.2.3.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.6; Def. 1.1.1.9); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Mathlib `SSet.Quasicategory`.

**6.5.3.** Prove that for a Grothendieck abelian category A, the homotopy category of `D(A)` is equivalent to Mathlib's `DerivedCategory A` as a triangulated category: the equivalence commutes with the shifts and carries distinguished triangles to distinguished triangles in both directions, so that the comparison respects the structure both sides carry. The fibrant complexes are K-injective (§6.3). Every K-injective complex is homotopy equivalent to a fibrant one, through the factorization of §6.2 and §6.4. So the inclusion of fibrant complexes into Tau Ceti's `TauCeti.KInjectiveDGCategory` induces an equivalence of homotopy categories. Tau Ceti's `TauCeti.KInjectiveDGCategory.dgNerveHomotopyCategoryEquiv`, with §6.3, concludes (HA, Props. 1.3.5.14 and 1.3.5.15, p. 127). The `Suggested.lean` declaration `nonempty_homotopyCategory_derivedInfty_equiv` states the underlying equivalence of categories; as in §4.5.2 the triangulated compatibility is not statable at the pins.

*Needs:* §6.2.1 (HA, Prop. 1.3.5.3), §6.3.1, §6.4.1 (HA, Prop. 1.3.5.14), §6.5.1 (HA, Def. 1.3.5.8); `TauCeti.KInjectiveDGCategory.dgNerveHomotopyCategoryEquiv`, `TauCeti.dgNerve.homotopyCategoryEquiv`; Mathlib `DerivedCategory`.

### 6.6 `D(A)` as a localization and as an underlying ∞-category

**6.6.1.** Prove that for a Grothendieck abelian category A, the inclusion `D(A) ⊆ N_dg(Ch(A))` has a left adjoint, given by fibrant replacement (HA, Prop. 1.3.5.13, p. 127). For each complex M, choose a trivial cofibration `M → Q` with Q fibrant. By §6.4 and `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`, it induces equivalences of mapping spaces into every fibrant complex. So it is a `D(A)`-localization of M, and the reflection criterion (HTT, Prop. 5.2.7.8) applies. The `Suggested.lean` declaration `isReflectiveSubcategory_isInjectivelyFibrant` states that `D(A)` is reflective, with Part AdjunctionsAndLocalizations' `IsReflectiveSubcategory` (§2.2), restated there.

*Needs:* §6.4.1 (HA, Lemma 1.3.5.12), §6.5.1 (HA, Def. 1.3.5.8); `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`; Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2), §2.2.1 (HTT, Def. 5.2.7.6, Remark 5.2.7.9); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.8); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1); Mathlib `SSet.Quasicategory`.

**6.6.2.** Prove that for a Grothendieck abelian category A, the composite `N(Ch(A)) → N_dg(Ch(A)) → D(A)` of the inclusion and the left adjoint L exhibits `D(A)` as the underlying ∞-category of the model category `Ch(A)` (HA, Prop. 1.3.5.15, p. 127). Fibrant complexes are closed under `N_*(Δ[1]) ⊗ −`. So HA Prop. 1.3.4.5 (§3.3) identifies `D(A)` with the localization of the ordinary category of fibrant complexes at chain homotopy equivalences. By §6.4 these are the weak equivalences between fibrant objects. HA Remark 1.3.4.16 (§3.4) compares the fibrant and the cofibrant variants, all objects being cofibrant. The `Suggested.lean` declaration `exists_isLocalizationAt_quasiIso_derivedInfty` states this as a localization of `N(Ch(A))` at the quasi-isomorphisms.

*Needs:* §3.3.2 (HA, Prop. 1.3.4.5), §6.4.1 (HA, Prop. 1.3.5.14), §6.5.1 (HA, Def. 1.3.5.8), §6.6.1 (HA, Prop. 1.3.5.13); Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1), §2.6.1 (HA, Def. 1.3.4.15), §2.6.2 (HA, Remark 1.3.4.16); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.7, §1.2.11); Part StableInfinityCategories §5.1.1 (HA, Def. 1.2.3.1); ModelCategoryTheory, Part ModelCategories §4.1.1 (the Quillen adjunctions of HTT, §A.2.5); Mathlib `HomotopicalAlgebra.ModelCategory`.

### 6.7 The t-structure on chain complexes

**6.7.1.** Define, for a Grothendieck abelian category A and an integer n, the full subcategories `N_dg(Ch(A))_{≥n}` and `N_dg(Ch(A))_{≤n}` of `N_dg(Ch(A))` on complexes with `H_k = 0` for `k < n`, resp. `k > n`, in HA's grading. Set `D(A)_{≥n}` and `D(A)_{≤n}` to be their intersections with `D(A)` (HA, Def. 1.3.5.16, p. 128). In cochain degrees, the first condition is the vanishing of cohomology in degrees above −n.
- Both are full subcategories closed under equivalence, since equivalences in the dg nerve are chain homotopy equivalences, hence quasi-isomorphisms.
- Prove that every M in `D(A)_{≤n}` is equivalent in `D(A)_{≤n}` to some `M'` with `M'_k = 0` for `k > n` (HA, Remark 1.3.5.17, p. 128). The map from M to its truncation `⋯ → 0 → M_n/d(M_{n+1}) → M_{n−1} → ⋯` is a quasi-isomorphism. Using enough injectives (`IsGrothendieckAbelian.enoughInjectives`), the dual of the projective resolutions of §4.5 gives a quasi-isomorphism from the truncation to a degreewise injective complex vanishing above degree n. That complex is fibrant (§6.3), and quasi-isomorphisms between fibrant complexes are equivalences (§6.4).

**Checks.**
- The complex ℤ in HA's degree 0 lies in `D(Ab)_{≥0} ∩ D(Ab)_{≤0}`, the heart. The complex ℤ in degree 1 lies in `D(Ab)_{≥1}`, and in Mathlib's `le (−1)`.
- An acyclic complex lies in every `N_dg(Ch(A))_{≥n}` and every `N_dg(Ch(A))_{≤n}`. A definition by vanishing of the terms, not the homology, would exclude contractible complexes with nonzero terms.
- For `n = 0` these are HA's connective and coconnective parts. Reading them as Mathlib's `ge 0` and `le 0` would swap them.

*Needs:* `TauCeti.linearHomComplexEnrichedCategory` (HA, Def. 1.3.2.1), §4.5.1 (HA, Prop. 1.3.2.19, construction (∗), dualized), §6.3.1 (HA, Prop. 1.3.5.6), §6.4.1 (HA, Prop. 1.3.5.14), §6.5.1 (HA, Def. 1.3.5.8); `IsGrothendieckAbelian.enoughInjectives`; Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Mathlib `HomologicalComplex.homology`.

**6.7.2.** Prove that for a Grothendieck abelian category A, `N_dg(Ch(A))_{≥0}` and the essential image of `D(A)_{≤0}` in `N_dg(Ch(A))` form a t-structure on the stable ∞-category `N_dg(Ch(A))` (HA, Prop. 1.3.5.18 and its proof, pp. 128–129). The coconnective part consists of the complexes chain homotopy equivalent to fibrant complexes with `H_k = 0` for `k > 0`, that is, of the K-injective complexes with `H_k = 0` for `k > 0`.
- Truncation triangles. For M in `Ch(A)`, let X be the truncation `⋯ → 0 → M_{−1}/d(M_0) → M_{−2} → ⋯`. Choose a quasi-isomorphism `X → M''` with `M''` degreewise injective and vanishing in nonnegative degrees, as in §6.7.1, so that `M''` lies in `D(A)_{≤−1}`. The shifted mapping cone `M'` of the composite `M → M''` sits in a degreewise split sequence, hence a fiber sequence `M' → M → M''`, and has `H_k = 0` for `k < 0`.
- Orthogonality. For M in `N_dg(Ch(A))_{≥0}` and Q in `D(A)_{≤−1}`, the mapping space is contractible. By §6.7.1 one may take `Q_k = 0` for `k ≥ 0`. The subcomplex `⋯ → M_1 → ker(d : M_0 → M_{−1}) → 0` of M is a monomorphic quasi-isomorphism into M, so §6.4 replaces M by it, and the mapping complex from it into Q vanishes in nonnegative degrees.

**Checks.**
- The acyclic complex of ℤ/4-modules of §1.1 lies in `N_dg(Ch(A))_{≥0}` and in `N_dg(Ch(A))_{≤−1}`, and its identity is nonzero in the homotopy category. So `N_dg(Ch(A))_{≥0}` and `N_dg(Ch(A))_{≤0}` fail orthogonality and are not a t-structure. The complex is not K-injective, so it is not in the essential image of `D(A)_{≤−1}`.
- For A the category of vector spaces over a field, every complex is fibrant, and the two coconnective parts agree: the essential image of `D(A)_{≤0}` is `N_dg(Ch(A))_{≤0}`.
- ℤ in HA's degree 0 lies in `N_dg(Ch(Ab))_{≤0}` but not in the essential image of `D(Ab)_{≤0}`. In the dg nerve the maps from ℤ/2 to `ℤ[1]` vanish up to homotopy, while into a K-injective model of ℤ they compute `Ext^1(ℤ/2, ℤ) = ℤ/2`. So ℤ is not K-injective and the two candidate coconnective parts differ; the first Check shows that only the second is orthogonal to the connective part.

*Needs:* §2.4.1 (HA, Prop. 1.3.2.10, Remark 1.3.2.17), §6.3.1 (HA, Prop. 1.3.5.6), §6.4.1 (HA, Lemma 1.3.5.12), §6.7.1 (HA, Def. 1.3.5.16, Remark 1.3.5.17); `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`, `IsGrothendieckAbelian.enoughInjectives`; Part StableInfinityCategories §3.1.2 (HA, Def. 1.2.1.4), §5.1.1 (HA, Def. 1.2.3.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4; Def. 1.1.1.9); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11).

### 6.8 Presentability of `D(A)` and its accessible t-structure

Compatibility of a t-structure with filtered colimits is that of Part StableInfinityCategories §11.5 (HA, Def. 1.3.5.20).

In §6.8.1–§6.8.3, A is a Grothendieck abelian category.

**6.8.1.** Prove that `D(A)` is presentable (HA, Prop. 1.3.5.21 (1), p. 129). The route is Lurie's: combine §6.6 (HA, Prop. 1.3.5.15) with §3.6 (HA, Prop. 1.3.4.22).

*Needs:* §3.6.1 (HA, Prop. 1.3.4.22), §6.5.1 (HA, Def. 1.3.5.8), §6.6.2 (HA, Prop. 1.3.5.15); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1).

**6.8.2.** Prove that `(D(A)_{≥0}, D(A)_{≤0})` is a t-structure on `D(A)` (HA, Prop. 1.3.5.21 (2), p. 129). The route: apply the left adjoint L of §6.6, which preserves homology up to quasi-isomorphism, to the truncation triangles of §6.7; orthogonality is inherited from §6.7.

*Needs:* §6.5.1 (HA, Def. 1.3.5.8), §6.6.2 (HA, Prop. 1.3.5.15), §6.7.1 (HA, Def. 1.3.5.16), §6.7.2 (HA, Prop. 1.3.5.18); `TauCeti.dgNerve.homotopyCategoryEquiv`; Part StableInfinityCategories §3.1.2 (HA, Def. 1.2.1.4).

**6.8.3.** Prove that the t-structure of §6.8.2 is accessible, right complete and compatible with filtered colimits (HA, Prop. 1.3.5.21 (3), p. 129). The route is Lurie's. An object lies in `D(A)_{≤0}` exactly when its homology vanishes in positive degrees. By §3.6 (HA, Props. 1.3.4.24, 1.3.4.25) and exactness of filtered colimits in A, homology commutes with filtered colimits. So `D(A)_{≤0}` is closed under filtered colimits and, by HTT Prop. 5.4.6.6, accessible, so the t-structure is accessible (HA, Prop. 1.4.4.13, (4) ⇒ (1)). Right completeness follows from the dual of the left completeness criterion (HA, Prop. 1.2.1.19), since `D(A)_{≤0}` is closed under countable coproducts and an object in every `D(A)_{≤−n}` has zero homology.

*Needs:* §3.6.2 (HA, Prop. 1.3.4.24), §3.6.3 (HA, Prop. 1.3.4.25); §6.8.1, §6.8.2 (HA, Prop. 1.3.5.21 (1), (2)); Part StableInfinityCategories §11.5.1 (HA, Def. 1.3.5.20), §3.1.2 (HA, Def. 1.2.1.4), §8.1.5 (HA, Prop. 1.2.1.19), §11.2.1 (HA, Def. 1.4.4.12), §11.2.2 (HA, Prop. 1.4.4.13); Part AccessibleInfinityCategories §7.1.4 (HTT, Prop. 5.4.6.6); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4).

**6.8.4.** Prove that, under the triangulated equivalence of §6.5.3, the subcategories `D(A)_{≥n}` and `D(A)_{≤n}` of §6.7 (HA, Def. 1.3.5.16), which form a t-structure by §6.8.2 (HA, Prop. 1.3.5.21 (2)), correspond to Mathlib's `DerivedCategory.TStructure.t` through the Conventions' dictionary: HA's `D(A)_{≥n}` to Mathlib's `le (−n)`.

*Needs:* §6.5.3 (the homotopy category of `D(A)`), §6.7.1 (HA, Def. 1.3.5.16), §6.8.2 (HA, Prop. 1.3.5.21 (2)); Mathlib `DerivedCategory.TStructure.t`.

### 6.9 `D⁻(A)` inside `D(A)`

**6.9.1.** Prove that for a Grothendieck abelian category A with enough projectives, the composite `D⁻(A) ⊆ N_dg(Ch(A)) → D(A)` of the inclusion and the left adjoint L is fully faithful, with essential image `⋃_{n ≥ 0} D(A)_{≥−n}` (HA, Prop. 1.3.5.24, p. 130). For M, M' in `D⁻(A)`, the map `M' → L M'` is a quasi-isomorphism into a fibrant complex. Mapping out of the projective complex M preserves it (§4.3), and the Dold–Kan description of mapping spaces turns this into an equivalence of mapping spaces. For the essential image, a right-bounded object of `D(A)` receives a quasi-isomorphism from a bounded-above complex of projectives (§4.5), which L carries to it (§6.4).

*Needs:* §4.1.1 (HA, Def. 1.3.2.4), §4.2.1 (HA, Def. 1.3.2.7), §4.3.1 (HA, Lemma 1.3.2.20), §4.5.1 (HA, Prop. 1.3.2.19, construction (∗)), §6.4.1 (HA, Prop. 1.3.5.14), §6.6.1 (HA, Prop. 1.3.5.13), §6.7.1 (HA, Def. 1.3.5.16); `TauCeti.dgNerve.rightMappingSpaceIsoCochainToSSet`; Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions).

### Examples

- For A the category of modules over a ring R, `D(A)` is presentable and stable with heart A. Its homotopy category is the classical unbounded derived category of R, and §6.9 recovers the bounded-above part as `D⁻(A)`.
- For A the category of sheaves of abelian groups on a topological space, `D(A)` is the presentable stable ∞-category of complexes of sheaves, with the standard t-structure.
- For A Grothendieck abelian, `D(A)_{≥0}` is presentable, since the t-structure is accessible, and the t-structure is compatible with filtered colimits (§6.8). So `D(A)_{≥0}` is a Grothendieck prestable ∞-category in the sense of Part PrestableInfinityCategories §4.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2), with heart A.

### Dependencies

Layers 1–5; Mathlib's Grothendieck abelian categories, injectives, small object argument and derived categories; Tau Ceti's lifting characterization, small generating trivial cofibrations and K-injective dg model; Part InfinityCategoryFoundations (§1.1, §1.2, §2.1); Part AdjunctionsAndLocalizations (§1.1, §2.1); Part PresheavesAndCompletions (§4.1); Part AccessibleInfinityCategories (§4.1); Part PresentableInfinityCategories (§1.1); Part StableInfinityCategories (§1.1); Part AdjunctionsAndLocalizations (§2.3, §2.4, §2.6); Part AccessibleInfinityCategories (§7.1); Part StableInfinityCategories (§2.1, §3.1, §5.1, §8.1, §11.2, §11.5) for stable subcategories, t-structures, chain complexes, the completeness criterion, accessible t-structures and compatibility with filtered colimits; ModelCategoryTheory (ModelCategories) for model categories, properness and combinatorial model categories; Part PrestableInfinityCategories (§4.1) for the Examples.

## Downstream consumers

No later member of the InfinityCategoryTheory family uses this roadmap.

## References

- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  - Dg categories and dg nerves: §1.3.1, pp. 80–85.
  - D⁻(A): §1.3.2, pp. 88–97.
  - Universal properties: §1.3.3, pp. 97–107.
  - Localizations and model categories: §1.3.4, pp. 108–120.
  - D(A): §1.3.5, pp. 121–130.
  - Used from §§1.1–1.2 and §1.4: Def. 1.1.2.11 and Thm. 1.1.2.14 (§2.4), Cor. 1.4.2.27, Def. 1.4.4.12.
  - Cited from other Parts of this family: Def. 1.3.3.1 (Part StableInfinityCategories §3.5), Lemma 1.3.3.10 (Part PresentableInfinityCategories §7.6), Def. 1.3.5.20 (Part StableInfinityCategories §11.5).
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Prop. C.1.4.1 and Def. C.1.4.2 (pp. 1952–1953), through Part PrestableInfinityCategories §4.1, in the Layer 6 Examples only.
- **Dug01b.** Daniel Dugger, *Combinatorial model categories have presentations*, Adv. Math. 164 (2001), 177–201, [arXiv:math/0007068](https://arxiv.org/abs/math/0007068). Cor. 1.2 (§3.5: a combinatorial model category is Quillen equivalent to a left proper combinatorial simplicial one, with the left adjoint on the simplicial side).
- **DK80.** W. G. Dwyer and D. M. Kan, *Simplicial localizations of categories*, J. Pure Appl. Algebra 17 (1980), 267–284. §7 (§3.2: simplicial categories with a fixed set of objects, through Part EnrichedLocalization §2.4).
- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited for the inputs of the proof routes, by theorem number and PDF page as given at each claim: §2.2.2, §2.3.4, §4.2.4, §5.1.2, §5.2.7, §5.5.6–5.5.9, App. A.2–A.3.
