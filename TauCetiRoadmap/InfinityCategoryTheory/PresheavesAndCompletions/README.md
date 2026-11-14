# Roadmap: presheaves, idempotent completions, filtered and sifted colimits, and Ind-objects

**Summary.** This Part constructs the free completions of an ∞-category under classes of colimits, and the shape
theory that controls each class.

It builds on Parts InfinityCategoryFoundations, CartesianFibrations, LimitsAndKanExtensions,
AdjunctionsAndLocalizations and Straightening.

- **Presheaves (Layer 1).** The Yoneda embedding and corepresented functors are defined in §1.1. Yoneda's lemma
  makes `j : C ⟶ P(C)` fully faithful, every presheaf is a colimit of representables, and restriction along `j`
  identifies colimit-preserving functors out of `P(C)` with all functors out of `C`.
- **Idempotent completions (Layers 2–3).** Idempotents and idempotent completeness are defined in §2.1. The
  idempotent completion, built from retracts of representables, is the free completion under splitting
  idempotents.
- **Filtered ∞-categories (Layer 4).** κ-filtered ∞-categories (defined in §4.1), their reduction to filtered
  partially ordered sets, and κ-right exact functors.
- **Sifted colimits (Layer 5).** Sifted simplicial sets (defined in §5.1): `N(Δ)^op` and every filtered
  ∞-category are sifted, sifted simplicial sets are weakly contractible, and every presheaf is the geometric
  realization of a simplicial object whose terms are coproducts of representables (HTT, Lemma 5.5.8.13).
- **Filtered colimits and `Ind_κ` (Layer 6).** κ-compact objects and `Ind_κ` (defined in §6.1); the closure
  properties of κ-compact objects; `Ind_κ(C)`, the presheaves classifying κ-filtered right fibrations, is the free
  completion under κ-filtered colimits, and for the nerve of an ordinary category `Ind` agrees with Mathlib's
  Ind-completion (HTT, Remark 5.3.5.6).

**Headline theorems.**
- Yoneda's lemma (HTT, Prop. 5.1.3.1).
- `P(C)` is the free cocompletion of `C` (HTT, Thm. 5.1.5.6).
- Idempotent completions are unique (HTT, Prop. 5.1.4.9).
- Filtered and sifted simplicial sets are weakly contractible (HTT, Lemma 5.3.1.20, Prop. 5.5.8.7).
- Sifted colimits commute with finite products in spaces (HTT, Lemma 5.5.8.11).
- κ-filtered colimits commute with κ-small limits in spaces (HTT, Prop. 5.3.3.3).
- The universal property of `Ind_κ` (HTT, Prop. 5.3.5.10).

## Scope and ownership

- **From the earlier Parts of this family.** The presheaf ∞-category is Part LimitsAndKanExtensions' (§8.1) and
  retracts are Part AdjunctionsAndLocalizations' (§2.1). The Yoneda embedding and corepresented functors (§1.1),
  idempotents and idempotent completeness (§2.1), κ-filtered ∞-categories (§4.1), sifted simplicial sets (§5.1),
  κ-compact objects and `C^κ`, κ-compact left fibrations and `Ind_κ` (§6.1) are defined here, at the start of the
  layer that first uses them. Colimits in section and functor ∞-categories, colimits in `S` and Kan extensions
  are Part LimitsAndKanExtensions' (Layers 7 and 8); the adjoint functor theory is Part
  AdjunctionsAndLocalizations'. This Part proves the theory of these notions.
- **Already in the library.** Mathlib has the 1-categorical counterparts: the Yoneda lemma, filtered and sifted
  categories (`CategoryTheory.IsFiltered`, `CategoryTheory.IsSifted`), the Ind-completion
  (`CategoryTheory.Ind`) and the Karoubi envelope (`CategoryTheory.Idempotents.Karoubi`). Nothing here
  restates them; §6.4 proves that `Ind` of the nerve of a small category is the nerve of
  `CategoryTheory.Ind`, and that κ-compact objects of a nerve are Mathlib's `IsCardinalPresentable` objects. Tau Ceti has κ-filtered simplicial sets (`SSet.IsCardinalFiltered`), which is HTT's
  κ-filteredness for ∞-categories, and joins (`SSet.join`).
- **Owned by other Parts.** The ∞-category `P_Σ(C)` of product-preserving presheaves, the free completion under
  sifted colimits, together with projectively generated ∞-categories, is built in Part PresentableInfinityCategories from
  the sifted-colimit layer here. Accessibility, presentability and κ-compactness in presentable
  ∞-categories belong to Parts AccessibleInfinityCategories and PresentableInfinityCategories. The ∞-topos form of the free resolution of
  presheaves (through effective epimorphisms and hypercoverings) is not used here: §5.5 proves it with
  strict Reedy models.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part PresheavesAndCompletions §2.1.2`
elsewhere, is one target.

- **∞-categories.** An ∞-category is a quasicategory: a simplicial set `C` with Mathlib's
  `SSet.Quasicategory C`. Functor ∞-categories are `Fun(K, C) = (ihom K).obj C`, with Mathlib's
  quasicategory instance. Adjunctions are those of Part AdjunctionsAndLocalizations §1.1, adjunctions in Mathlib's `SSet.QCat.bicategory`,
  which agree with HTT's correspondences (Part AdjunctionsAndLocalizations §1.3 (HTT, Prop. 5.2.2.8)).
  - *Check.* The nerve of a category is an ∞-category. A notion of ∞-category requiring all horns, not just
    inner ones, to fill would exclude the nerve of `[1]`: the outer horn `Λ[2, 0]` with edges `0 → 1` and
    `0 → 0` has no filler there.
- **Mapping spaces.** `Map_C(x, y)` is the right mapping space, Tau Ceti `SSet.rightMappingSpace`,
  regarded as an object of the homotopy category `H` of spaces. Fully faithful functors are Tau Ceti's
  `SSet.IsFullyFaithful`.
  - *Check.* In `S`, `Map(∗, X)` is equivalent to `X`. For `X` a circle, a mapping "space" made of the
    edges `∗ ⟶ X` up to homotopy would be the one-point set `π₀ X` and would lose the loop.
- **Limits and colimits.** A colimit of `p : K ⟶ C` is an initial vertex of the coslice `C_{p/}`, Tau
  Ceti's `SSet.coslice.IsColimit p`, and a limit is a terminal vertex of `C_{/p}`, Tau Ceti's
  `SSet.slice.IsLimit p`. Relative colimits (`q`-colimits along an inner fibration `q`) and Kan extensions
  are Part LimitsAndKanExtensions §7.1 (HTT, Defs. 4.3.1.1, 4.3.2.2, 4.3.3.2).
  - *Check.* In the nerve of `[1]` the colimit of the empty diagram is `0` and the limit is `1`. In a Kan
    complex with one vertex `x` modeling `K(ℤ, 2)`, `x` is initial in the homotopy category but is not an
    initial vertex, since `Map(x, x)` is a circle. A definition through the homotopy category would accept it.
- **Spaces and presheaves.** `S` is the ∞-category of spaces of Part InfinityCategoryFoundations §7.1 (HTT, Def. 1.2.16.1,
  p. 69). `Ŝ` is the same construction one universe up. `P(S) = Fun(S^op, S)` is the ∞-category of presheaves
  on a simplicial set `S` (HTT, Def. 5.1.0.1, p. 333), and `j : S ⟶ P(S)` is the Yoneda embedding (HTT,
  §5.1.3, p. 337); `P(S)` is defined in Part LimitsAndKanExtensions §8.1 and `j` in §1.1. Colimits and limits in
  `P(S)` are computed pointwise
  (Part LimitsAndKanExtensions §8.2 (HTT, Prop. 5.1.2.2, Cors. 5.1.2.3, 5.1.2.4)); every use here is for a
  product projection, a categorical fibration, so the form of HTT Prop. 5.1.2.2 for categorical fibrations
  stated there applies.
  - *Check.* For `S = Δ[0]`, `P(S)` is `S` itself and `j` picks out the contractible space. A presheaf
    ∞-category built from the 1-category of simplicial sets, without inverting weak equivalences, would make
    `Δ[0]` and `Δ[1]` different objects. In `S` they are equivalent.
- **Size.** "Small" means in the base universe `u`; κ is a regular cardinal and "κ-small" means fewer than κ
  nondegenerate simplices. Large ∞-categories (`S` itself, `P(S)`) live in universe `u + 1`. Filtered means
  ω-filtered.
  - *Check.* `Δ[n]` is κ-small for every infinite κ; `∂Δ[1]` is ω-small. `N(ℕ)` is ℵ₁-small but not
    ω-small. A count of all simplices instead of nondegenerate ones would make `Δ[0]` infinite.
- **Filtered simplicial sets.** For an ∞-category, κ-filteredness is §4.1 (HTT, Def.
  5.3.1.7, p. 400), Tau Ceti's `SSet.IsCardinalFiltered`. An arbitrary simplicial set `S` is called
  κ-filtered when there is a categorical equivalence `S ⟶ C` to a κ-filtered ∞-category; by the invariance
  proved in §4.2 this does not depend on `C` (HTT, Remark 5.3.1.13, p. 401). Off ∞-categories this differs
  from `SSet.IsCardinalFiltered S κ`.
  - *Check.* The horn `Λ[2, 1]` is categorically equivalent to `Δ[2]`, which has a final object, so it is
    κ-filtered as a simplicial set for every κ. The literal cone condition, tested on `Λ[2, 1]` itself,
    fails: the map from `∂Δ[1]` onto the vertices `0` and `2` has no cone inside `Λ[2, 1]`, which has no edge
    `0 ⟶ 2`. A definition through the literal condition would reject it.
  - *Check.* The empty simplicial set is not κ-filtered: the empty diagram has no cone. A definition through
    diagrams of nonempty shape only would accept it.
- **Sifted simplicial sets.** Sifted simplicial sets and sifted colimits are those of §5.1 (HTT,
  Def. 5.5.8.1, p. 524): a nonempty `K` whose diagonal `K ⟶ K × K` is cofinal, and colimits indexed by one.
  - *Check.* The parallel pair `• ⇉ •` is not sifted: the colimit over it of the constant diagram at the
    point is the circle, and the product of two such colimits is the torus rather than the circle, so
    colimits over it do not commute with binary products in `S` (§5.3).
- **Joyal model structure.** Categorical equivalences are Part InfinityCategoryFoundations §2.1 (HTT, Def. 1.1.5.14), the
  weak equivalences of the Joyal model structure (Part InfinityCategoryFoundations §9.5 (HTT, Thm. 2.2.5.1)); homotopy
  pushouts in Layer 5 are taken there.
  - *Check.* `Λ[2, 1] ⊆ Δ[2]` is a categorical equivalence (it is inner anodyne), while `Λ[2, 0] ⊆ Δ[2]` is
    not: `Λ[2, 0]` is categorically equivalent to the nerve of the poset with `0 < 1` and `0 < 2`, which has
    no morphism `1 ⟶ 2`. Both inclusions are weak homotopy equivalences, so a notion through weak homotopy
    equivalences would accept both.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory`, `SSet.QCat`, `SSet.QCat.bicategory` (`Mathlib/AlgebraicTopology/Quasicategory/`
  `Basic.lean`, `StrictBicategory.lean`): ∞-categories, bundled, and their bicategory.
- `CategoryTheory.Bicategory.Adjunction.comp` (`Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean`):
  the composite of adjunctions.
- The instance `Quasicategory ((ihom K).obj C)` for a quasicategory `C`
  (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`).
- `SSet.KanComplex`, `CategoryTheory.nerve`, `CategoryTheory.nerveAdjunction`
  (`Mathlib/AlgebraicTopology/SimplicialSet/NerveAdjunction.lean`: the nerve is right adjoint to
  `SSet.hoFunctor`), `SSet.hoFunctor`, `CategoryTheory.SimplicialNerve`, `SimplicialThickening`,
  `CategoryTheory.yoneda`, `HomotopicalAlgebra.ModelCategory`, `SSet.opFunctor`.
- `CategoryTheory.IsFiltered`, `CategoryTheory.Ind`, `CategoryTheory.Ind.inclusion`, `CategoryTheory.Ind.yoneda`,
  `CategoryTheory.Ind.yonedaCompInclusion` (`Mathlib/CategoryTheory/Limits/Indization/Category.lean`),
  `CategoryTheory.Limits.IsIndObject`, `CategoryTheory.Limits.isIndObject_iff`
  (`Mathlib/CategoryTheory/Limits/Indization/IndObject.lean`), `CategoryTheory.CostructuredArrow`,
  `CategoryTheory.Idempotents.Karoubi`, `CategoryTheory.IsSifted` (`Mathlib/CategoryTheory/Limits/Sifted.lean`),
  `CategoryTheory.Groupoid`, `CategoryTheory.MonoidalCategory`: the 1-categorical notions met in nerve
  comparisons and in the coherence lemma of §6.6.
- `SSet.rlp_monomorphisms` (`Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`): trivial
  fibrations are the maps with the right lifting property against monomorphisms; `SSet.anodyneExtensions`
  (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Basic.lean`) and `SSet.innerAnodyneExtensions`:
  the anodyne and inner anodyne maps.
- `SSet.Edge`, `SSet.Edge.CompStruct`, `SSet.Edge.id` (`Mathlib/AlgebraicTopology/SimplicialSet/CompStruct.lean`):
  edges of a simplicial set and 2-simplices witnessing a composite.
- 1-categorical comparison notions, used only in Checks and as later comparison targets: `CategoryTheory.IsIdempotentComplete`, `Cardinal.IsRegular`.
- κ-filtered categories and κ-presentable objects, for the comparison of compact objects of nerves in §6.4:
  `CategoryTheory.IsCardinalFiltered`, `CategoryTheory.isCardinalFiltered_iff`,
  `CategoryTheory.IsCardinalFiltered.of_equivalence`, `CategoryTheory.IsCardinalFiltered.exists_max`,
  `CategoryTheory.IsCardinalFiltered.multicoequalizer` (`Mathlib/CategoryTheory/Presentable/IsCardinalFiltered.lean`);
  `CategoryTheory.IsCardinalPresentable`, `CategoryTheory.HasCardinalFilteredColimits`
  (`Mathlib/CategoryTheory/Presentable/Basic.lean`); `CategoryTheory.IsFinitelyPresentable`
  (`Mathlib/CategoryTheory/Presentable/Finite.lean`); `CategoryTheory.uliftFunctor` (`Mathlib/CategoryTheory/Types/Basic.lean`),
  with its preservation of colimits (`Mathlib/CategoryTheory/Limits/Preserves/Ulift.lean`); the instance
  `CategoryTheory.Nerve.quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean`).

### From Tau Ceti

- `SSet.coslice`, `SSet.slice` (`TauCeti/AlgebraicTopology/SimplicialSet/Coslice.lean`, `Slice.lean`),
  `SSet.coslice.IsColimit`, `SSet.slice.IsLimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`).
- `SSet.join`: joins of simplicial sets (HTT, Def. 1.2.8.1).
- `SSet.fullEnhancedSubcategory` (`Quasicategory/FullSubcategory.lean`), `SSet.IsFullyFaithful`
  (`Quasicategory/FullyFaithful.lean`), `SSet.rightMappingSpace` (`Quasicategory/RightMappingSpace.lean`),
  `SSet.IsLocallySmall` (`Quasicategory/LocallySmall.lean`).
- `SSet.LeftFibration`, `SSet.RightFibration` (`SimplicialSet/AnodyneExtensions/LeftRight/`),
  `SSet.CartesianFibration`, `SSet.Edge.IsCartesian` (`Quasicategory/Cartesian.lean`).
- `SSet.IsCardinalFiltered` and `SSet.isCardinalFiltered_nerve_iff` (`SimplicialSet/CardinalFiltered.lean`):
  κ-filtered simplicial sets, and their agreement with directedness for nerves of preorders.
  **Checks** (`SSet.IsCardinalFiltered`, `SSet.isCardinalFiltered_nerve_iff`).
  - ∅ is not filtered (K = ∅ asks for a vertex); Δ[0] and every Δ[n] are.
  - Δ[0] ⊔ Δ[0] is not filtered; the nerve of a preorder is κ-filtered exactly when every subset of fewer than
    κ elements has an upper bound.
  - The nerve of the group ℤ/2 is not filtered: the map from two copies of Δ[1] glued along their
    boundaries, sending the edges to 1 and to the generator, has no extension to the cone (it would force the
    generator to be 1), in agreement with Mathlib's notion of a filtered category.
  - The class alone is weaker than HTT's notion, which also asks for an ∞-category (§4.1).
- `SSet.IsWeaklyContractible` (`SimplicialSet/WeaklyContractible.lean`): defined through constant maps into
  Kan complexes, so that weak contractibility is tested with `Ex^∞` rather than geometric realization.
- `SSet.IsWeakHomotopyEquivalence`, `SSet.IsWeakHomotopyEquivalence.of_homotopy`
  (`SimplicialSet/WeakHomotopyEquivalence.lean`): weak homotopy equivalences, through homotopy classes of maps
  into Kan complexes, and the fact that simplicial homotopy equivalences are ones.
- `SSet.rlp_monomorphisms_iff` (`SimplicialSet/TrivialFibration.lean`).
- `SSet.catInfty` (`Quasicategory/CatInfty.lean`): HTT's `Cat∞`, the simplicial nerve of `SSet.CatInftyΔ`.
- `SSet.QCat.IsCategoricalEquivalence` (`Quasicategory/CategoricalEquivalence.lean`): categorical
  equivalences, the equivalences of the bicategory of ∞-categories.
- `SSet.IsTerminalVertex` (`Quasicategory/TerminalVertex.lean`), `SSet.ihomOver`, `SSet.ihomObj₀Equiv`
  (`SimplicialSet/InternalHom.lean`), `SSet.rightAnodyneExtensions_pushoutObjObjι'`
  (`SimplicialSet/AnodyneExtensions/LeftRight/PushoutProduct.lean`): final vertices,
  functor ∞-categories over a base and their vertices, and right anodyne pushout-products.

### From TauCetiRoadmap.InfinityCategoryTheory

Cited in `*Needs:*` lines by Part folder and section.

- **InfinityCategoryFoundations:** categorical equivalences (§2.1: HTT, Def. 1.1.5.14), cones and colimit diagrams (§1.2),
  size (§1.1: HTT, §1.2.15), spaces, the universal left fibration and classifying maps (§7.1: HTT,
  Def. 1.2.16.1, §3.3.2), n-categories (§10.1: HTT, Def. 2.3.4.1), joins and slices (Layer 4), terminal and initial objects (§5.5), the covariant and
  contravariant model structures (§6.2–§6.4), straightening of right fibrations (§7.3, §7.5, §7.6), the
  mapping-space comparison theorem (§8.1), inner anodyne maps, categorical fibrations and the Joyal model
  structure (§9.2, §9.4, §9.5), minimal models and the truncation criterion for n-categories (§10.3, §10.6).
- **CartesianFibrations:** Cartesian edges and right fibrations (§1.3, §2.2), fiberwise equivalence criteria
  (§2.5), invariance of slices and lifting equivalences along categorical fibrations (§3.1, §3.3), Cartesian
  fibrations over `Δ[1]` and comma fibrations (§4.1, §4.4), Cartesian equivalences and the Cartesian model
  structure (§5.7, §5.8), base change of categorical equivalences along right fibrations over an ∞-category
  (§7.2: HTT, Prop. 3.3.1.3 over an ∞-category base).
- **LimitsAndKanExtensions:** colimits through mapping spaces and colimits in nerves of categories (§1.4: HTT,
  Lemma 4.2.4.3), cofinal maps (§2.1: HTT, Def. 4.1.1.1), relative colimits and Kan extensions (§7.1:
  HTT, Defs. 4.3.1.1, 4.3.2.2, 4.3.3.2), presheaves (§8.1: HTT, Def. 5.1.0.1), cofinal reindexing (§7.2: HTT,
  Prop. 4.3.1.7), representability of the universal right fibration by the point (§4.1: HTT,
  Cor. 3.3.2.7), fat joins and fat slices (§1.1, §1.2), cofinality, its invariance, smooth maps
  and Theorem A (Layers 2, 4 and 5), rectification, representable presheaves and tensors (§3.1–§3.5), `N((Set⁺_Δ)°) ≃ Cat∞` (§3.8), the cofinal
  maps from nerves of posets and the decomposition of diagrams (Layer 6), relative colimits and Kan
  extensions (§7.3–§7.5), colimits in functor ∞-categories and in `S` (§8.2, §8.3).
- **AdjunctionsAndLocalizations:** adjunctions (§1.1), retracts (§2.1: HTT, §4.4.5), the agreement of the definitions of adjunction and unit transformations
  (§1.3: HTT, Prop. 5.2.2.8), the preservation of limits and colimits by adjoints (§1.5: HTT, Prop. 5.2.3.5),
  the representability criterion (§1.6: HTT, Prop. 5.2.4.2), adjunctions from simplicial Quillen
  adjunctions (§1.7: HTT, Prop. 5.2.4.6), left Kan extension as left adjoint to restriction (§1.8: HTT,
  Prop. 4.3.3.7).
- **Straightening:** the Quillen adjunction of marked straightening (§1.5: HTT, Prop. 3.2.1.13), classifying
  maps of (co)Cartesian fibrations (§2.1: HTT, Def. 3.3.2.2), the
  restriction `q'` of the universal Cartesian fibration to spaces (§2.5: HTT, Warning 3.3.2.4), limits in `S` as section spaces (§3.2: HTT,
  Cor. 3.3.3.4), and Kan extensions along coCartesian fibrations (§4.1: HTT, Prop. 4.3.3.10).

### From TauCetiRoadmap.ModelCategoryTheory

- **ModelCategories:** the homotopy category of a model category (§3.1: HTT, §A.2.2), homotopy extension
  (§3.2: HTT, Prop. A.2.3.1), proper model categories and homotopy pullback and pushout squares (§3.4,
  §3.5: HTT, §A.2.4), Quillen adjunctions and equivalences (§4.1, §4.2: HTT, §A.2.5), the projective model
  structure (§7.2: HTT, Prop. A.2.8.2), Reedy categories, latching and matching objects, good filtrations
  and the Reedy model structure (§7.4–§7.7: HTT, §A.2.9).
- **KanQuillen:** homotopy groups, the long exact sequence of a Kan fibration and Whitehead's theorem
  (§1.1–§1.3), `Ex^∞` (§2.2), weak homotopy equivalences and the Kan–Quillen model
  structure (§3.1, §3.2), filtered colimits of Kan complexes (§3.3), right properness (§3.4), homotopies
  of nerves from natural transformations and weakly contractible categories of factorizations (§3.6; for
  adjoints, Kerodon, Prop. 3.1.7.9; HTT, Lemma A.2.9.17).
- **SimplicialCategories:** the product of simplicial sets as a monoidal model structure (§1.2: HTT,
  Ex. A.3.1.4), homotopy limits and colimits of enriched diagrams (§3.2: HTT, §A.2.8), the realization of
  augmented Reedy fibrant simplicial Kan complexes (§4.5), Quillen equivalences of simplicial model
  categories (§5.9: HTT, Prop. A.3.1.10).

## How to read the build

Layer 1 proves the theory of presheaves: the models of `P(S)`, Yoneda's lemma, the free cocompletion,
adjunctions between presheaf ∞-categories, completely compact objects and the recognition of presheaf
∞-categories. Layer 2 treats idempotents: retraction diagrams, effective idempotents, retracts as sequential
colimits. Layer 3 uses presheaves to
build idempotent completions and prove their universal property. Layer 4 studies filtered ∞-categories: tests
for κ-filteredness, their weak contractibility, the reduction to filtered partially ordered sets and κ-right
exact functors; it uses the colimits of idempotents of Layer 2. Layer 5 does the same for sifted shapes: it
proves the two-variable colimit lemma, shows that `N(Δ)^op` and filtered ∞-categories are sifted, that sifted
simplicial sets are weakly contractible and that sifted colimits commute with finite products, then proves the
categorical equivalence for joins over a weakly contractible simplicial set that drives the ∞-categorical Reedy
extension step, and resolves every presheaf by a simplicial object of coproducts of representables. Layer 5
also proves, separately from the Reedy step, the equivalence for nerves of a linear order with a cofinal subset. Layer 6 combines Layers 1, 2 and 4: filtered colimits
of spaces and their commutation with κ-small limits, κ-compact objects, `Ind_κ` with its universal property and
its agreement with Mathlib's `CategoryTheory.Ind` on nerves, the lifting of idempotents from the homotopy category,
and idempotent completeness of filtered colimits of ∞-categories. Layers 5 and 6 are independent of each
other.

Layers 1, 2, 4, 5 and 6 open with the basic definitions that they use first and that later Parts cite: §1.1,
§2.1, §4.1, §5.1 and §6.1.

## Layer 1: Presheaves, Yoneda's lemma and the free cocompletion

### 1.1 The Yoneda embedding and corepresented functors

**1.1.1.** Define the Yoneda embedding `j : K ⟶ P(K)` of a simplicial set `K` as the transpose of the map
`K^op × K ⟶ S` that corresponds under `C[−] ⊣ N` to the simplicial functor
`C[K^op × K] ⟶ C[K]^op × C[K] ⟶ Kan`, `(x, y) ↦ Ex^∞ Map_{C[K]}(x, y)`, through the opposite comparison of Part
InfinityCategoryFoundations §2.1 and the product comparison of §7.1 (HTT, §5.1.3, pp. 337–338). Lurie uses `Sing |−|` as the Kan replacement; `Ex^∞`
preserves finite products, so the composite is a simplicial functor. Any functor equivalent to `j` is also
called a Yoneda embedding.

- Each `j(x)(y) = Ex^∞ Map_{C[K]}(y, x)` is a Kan complex, so `j(x)` is a functor `K^op ⟶ S`.
- `j_{K^op}` and `j_K` are the two transposes of one functor `K^op × K ⟶ S`, through `C[K^op] ≅ C[K]^op`.
- A map `f : K ⟶ L` induces, through the simplicial functor `C[f]`, maps `j_K(x)(y) ⟶ j_L(f x)(f y)`
  compatible with the simplicial structure.

**Checks.**
- For `K = Δ[2]`, `j(1)` takes the values `Δ[0]`, `Δ[0]`, `∅` at `0`, `1`, `2`; with the variables exchanged it
  would take the values `∅`, `Δ[0]`, `Δ[0]`.
- For `K = Δ[1]`, `j(0)` takes the value `Δ[0]` at 0 and `∅` at 1, and `j(1)` is `Δ[0]` at both. A
  definition with the variables exchanged, `y ↦ Map(x, y)`, would give `j(0)` the value `Δ[0]` at both.
- For `K` the nerve of a category, `j(x)(y)` is equivalent to the discrete set of morphisms from `y` to `x`.

*Needs:* Part LimitsAndKanExtensions §8.1.1 (P); Part InfinityCategoryFoundations §2.1.2, §2.1.5 (the adjunction and the opposite comparison) and §7.1.1, §7.1.2 (the product comparison and `Kan`);
ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7: `Ex^∞`).

**1.1.2.** Define, for a vertex `s` of a simplicial set `K`, the functor corepresented by `s`, `j_s : K ⟶ S`, as the
Yoneda embedding followed by evaluation at `s`, so that `j_s(x) = j(x)(s) = Map(s, x)`; for `K` large it takes
values in `Ŝ` (HTT, §5.1.6, p. 346).

- `j_s` and `j(s)` are the two partial evaluations at `s` of the functor `K^op × K ⟶ S` transposed to `j`.
- `j_s(s)` contains the identity of `s` and so is nonempty.

**Checks.**
- For `K` the nerve of a category, `j_s(x)` is equivalent to the set of morphisms from `s` to `x`.
- In `Δ[1]`, `j_1(0)` is empty and `j_0(1)` is a point: `j_s` is covariant, unlike `j(s)`.
- In `Δ[2]`, `j_0` is a point everywhere and `j_2` is empty at `0` and `1`, whereas `j(0)` is empty at `1` and
  `2`.

*Needs:* §1.1.1 (the Yoneda embedding).

### 1.2 Three models for presheaves

**1.2.1.** Prove that presheaves have three equivalent models (HTT, Prop. 5.1.1.1, p. 334). Let `S` be a simplicial
set and `φ : C[S]^op ⟶ C` a Dwyer–Kan equivalence of simplicial categories. Let `P'(S)` be the simplicial
nerve of the full simplicial subcategory of `SSet/S` on the right fibrations. Let `P''(φ)` be the simplicial
nerve of the fibrant-cofibrant objects of `SSet^C` with the projective model structure. Then there are
equivalences of ∞-categories `P(S) ⟵ P''(φ) ⟶ P'(S)`.

*Proof route.* Lurie's. The left map is the comparison of diagram ∞-categories with diagrams in a
combinatorial simplicial model category. On the right, `P'(S)` is the nerve of the fibrant-cofibrant
objects of the contravariant model structure, which is simplicial with fibrant objects the right
fibrations. Straightening is a Quillen equivalence compatible with tensors up to equivalence, and the
enriched Quillen equivalence criterion makes unstraightening an equivalence on fibrant-cofibrant objects.

*Needs:*
- Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4);
- Part InfinityCategoryFoundations §6.3.1, §6.3.2 (HTT, Prop. 2.1.4.8 and §2.1.4, the covariant model structure), §6.4.1 (HTT, Remark
  2.1.4.12, the contravariant model structure), §7.5.2 (HTT, Thm. 2.2.1.2 and §2.2.1, straightening) and §7.6.1 (HTT, Cor. 2.2.3.12);
- Part Straightening §1.5.1 (HTT, Prop. 3.2.1.13);
- Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §2.1.2 (HTT, §5.1.3, `C[S^op] ≅ C[S]^op`);
- Mathlib `CategoryTheory.SimplicialNerve`;
- ModelCategoryTheory, Part SimplicialCategories §5.9.1 (HTT, Prop. A.3.1.10);
- ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, the projective model structure) and
  §4.2.1 (HTT, Prop. A.2.5.1, Quillen equivalences).

### 1.3 Yoneda's lemma; presheaves as colimits of representables

**1.3.1.** Prove Yoneda's lemma (HTT, Prop. 5.1.3.1, p. 338): for every simplicial set `K`, the Yoneda embedding
`j : K ⟶ P(K)` is fully faithful.

*Proof route.* Lurie's, with `Ex^∞` as the Kan replacement. The map `j` factors through the nerve of the
fibrant-cofibrant projective presheaves on `C' = Ex^∞ C[K^op]`, followed by the equivalence of Prop.
4.2.4.4. The first map is fully faithful by the simplicial Yoneda lemma, which in each degree is the
ordinary Yoneda lemma (Mathlib `CategoryTheory.yoneda`). It is composed with the Dwyer–Kan equivalence
`C[K] ⟶ C'^op`.

*Needs:*
- §1.1.1 (HTT, §5.1.3, the Yoneda embedding); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1, fully faithful maps, and HTT, §5.1.3, `C[K^op] ≅ C[K]^op`), Tau Ceti `SSet.IsFullyFaithful`;
- Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4);
- ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective model structures);
- Mathlib `CategoryTheory.SimplicialNerve`, `CategoryTheory.yoneda`, instance
  `Quasicategory ((ihom K).obj C)`.

**1.3.2.** Prove that the Yoneda embedding preserves limits (HTT, Prop. 5.1.3.2, p. 338): for a small ∞-category `C`,
`j : C ⟶ P(C)` preserves every small limit that exists in `C`.

Both statements apply to a large, locally small ∞-category `C` by passing to the next universe, in which `C`
is small: the Yoneda embedding then takes values in `Fun(C^op, Ŝ)`, and local smallness makes each `j(x)` take
values in essentially small spaces.

*Proof route.* Lurie's. Reduce to diagrams indexed by nerves of categories through a cofinal map from a
nerve, and rectify the diagram. Limits in a locally Kan simplicial category are homotopy limits detected
by mapping spaces. Conclude pointwise by the dual of Prop. 5.1.2.2.

*Needs:*
- §1.3.1 (HTT, Prop. 5.1.3.1); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, dual form);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15);
- Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8), §6.4.1 (HTT, Prop. 4.2.3.14), §3.2.1 (HTT, Thm. 4.2.4.1, applied to the large `A°` of projective presheaves object by object through small full subcategories, as in its §3.3 (*Size*))
  and §3.1.2 (HTT, Cor. 4.2.4.7);
- ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8, homotopy limits);
- Tau Ceti `SSet.slice.IsLimit`.

**1.3.3.** Prove that evaluation at a vertex is corepresented by its representable (HTT, Lemma 5.1.5.2, p. 342): for a
small simplicial set `S` and a vertex `s`, the left fibration classified by evaluation at `s`,
`e_s : P(S) ⟶ S`, is corepresented by `j(s)`.

*Proof route.* Lurie's, through the right-fibration model `P'(S)` of Prop. 5.1.1.1. The left fibration
corepresented by `s` has an initial object over `s`, whose inclusion is left anodyne and hence a covariant
equivalence. The simplicial structure of the covariant model structure then identifies the section spaces.

*Needs:*
- §1.2.1 (HTT, Prop. 5.1.1.1);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §7.1.6 (HTT, §3.3.2, the universal left fibration);
- Part LimitsAndKanExtensions §3.4.2, §3.4.3 (HTT, Def. 4.4.4.4, Prop. 4.4.4.5);
- Part InfinityCategoryFoundations §6.2.2 (HTT, Def. 2.1.4.5, covariant equivalences) and §6.3.1, §6.3.2 (HTT, Prop. 2.1.4.8 and
  §2.1.4);
- Tau Ceti `SSet.LeftFibration`.

**1.3.4.** Prove that every presheaf is canonically a colimit of representables (HTT, Lemma 5.1.5.3, p. 343): for a
small simplicial set `S`, the identity of `P(S)` is a left Kan extension of `j` along `j`. Equivalently,
each presheaf `X` is the colimit of the projection `C_{/X} ⟶ P(S)`, where `C` is the essential image of
`j`.

*Proof route.* Lurie's. By Prop. 5.1.2.2, test after evaluation at each vertex `s`. By Lemma 5.1.5.2 and
Yoneda's lemma, the diagram becomes the left fibration classified by `X(s)`, whose colimit in `S` is its
total space, weakly equivalent to `X(s)`.

*Needs:*
- §1.3.1 (HTT, Prop. 5.1.3.1; Lemma 5.1.5.2); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- Part LimitsAndKanExtensions §8.3.1 (HTT, Prop. 3.3.4.5, colimits in `S`);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §7.1.2, §7.1.4 (HTT, Defs. 4.3.2.2, 4.3.3.2) and §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, colimit diagrams) and §7.1.6, §7.1.8 (HTT, §3.3.2);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (weak homotopy equivalences).

### 1.4 The free cocompletion

**1.4.1.** Define the ∞-category of colimit-preserving functors out of a presheaf ∞-category (HTT, Notation 5.1.5.1,
p. 342): for an ∞-category `C` and a simplicial set `S`, `Fun^colim(P(S), C)` is the full subcategory of `Fun(P(S),
C)` on the functors that preserve small colimits. (§1.5.1's `Fun^L(C, D)` is the subcategory of left adjoints, a
different condition: `S ⊆ Ŝ` out of `P(Δ[0]) = S` preserves small colimits and has no right adjoint.)

- It is a full subcategory of a functor ∞-category, hence an ∞-category.
- It contains every functor equivalent to one of its members.
- Every left adjoint out of `P(S)` lies in it (Part AdjunctionsAndLocalizations §1.5 (HTT, Prop. 5.2.3.5)).

**Checks.**

- For `S` empty, `P(S) = Δ[0]`, and a functor `Δ[0] ⟶ C` preserves small colimits exactly when it picks an
  initial object of `C`. For `C` the nerve of `[1]`, `Fun^colim(P(∅), C)` is the single object `0`. A definition
  through nonempty colimits only would also admit `1`, since in a poset every nonempty constant diagram has
  its value as colimit.
- For `S = Δ[0]` and `C = S`, `Fun^L(S, S)` is equivalent to `S` by Thm. 5.1.5.6, through evaluation at the
  point. The functor `X ↦ X × X` preserves filtered colimits but not coproducts, so it lies outside
  `Fun^L(S, S)`. A definition through filtered colimits would admit it.
- For `C = Δ[0] ⊔ Δ[0]`, which has no initial object, `Fun^colim(P(∅), C)` is empty.

*Needs:*
- Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2) and §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11), Tau Ceti `SSet.fullEnhancedSubcategory`,
  `SSet.coslice.IsColimit`;
- Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5), for the third item.

**1.4.2.** Prove that colimit-preserving functors out of presheaves are Kan extensions (HTT, Lemma 5.1.5.5, p. 344).
Let `S` be a small simplicial set, `C` the full subcategory of `P(S)` on the representables, and `D` an
∞-category.

- A functor `f : P(S) ⟶ D` is a left Kan extension of `f|C` exactly when `f` preserves small colimits.
- If `D` has small colimits, every `f₀ : C ⟶ D` has a left Kan extension to `P(S)`.

*Proof route.* Lurie's. The second claim is the existence of Kan extensions into ∞-categories with
colimits. For the first, "if" is Lemma 5.1.5.3. For "only if", given a colimit cocone in `P(S)`, compare
two left Kan extensions along the coCartesian fibrations of comma ∞-categories, and reduce, by the dual of
the following criterion for colimits, to a contravariant equivalence. The criterion is that a map
`f : A ⟶ B` over `S` is a covariant equivalence exactly when restriction along `f^◁` preserves limits
of diagrams `B^◁ ⟶ C` induced from `S`, for every ∞-category `C`, equivalently for `C = S` (HTT, Lemma 5.1.5.4, p. 344), because limits in `S` are section spaces of the
classified left fibration and corepresented functors jointly detect limits. Check the equivalence fiberwise
using smooth maps, and identify it through Lemma 5.1.5.2 and colimits in `S`.

*Needs:*
- §1.3.1, §1.3.2, §1.3.3, §1.3.4 (HTT, Props. 5.1.3.1, 5.1.3.2; Lemmas 5.1.5.2, 5.1.5.3); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §7.1.2, §7.1.4 (HTT, Defs. 4.3.2.2, 4.3.3.2) and §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1 (HTT, §1.2.11);
- Part LimitsAndKanExtensions §7.4.2 (HTT, Lemma 4.3.2.13), Part Straightening §4.1.2 (HTT, Prop. 4.3.3.10), Part LimitsAndKanExtensions §8.3.1 (HTT, Prop. 3.3.4.5) and
  Part Straightening §3.2.3 (HTT, Cor. 3.3.3.4, limits in `S`);
- Part LimitsAndKanExtensions §5.1.2 (HTT, Def. 4.1.2.9, smooth maps), §5.2.3 (HTT, Prop. 4.1.2.16) and §5.3.1 (HTT,
  Prop. 4.1.2.18);
- Part InfinityCategoryFoundations §6.2.2 (HTT, Def. 2.1.4.5);
- Part CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (weak homotopy equivalences);
- Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.CartesianFibration`.

**1.4.3.** Prove that `P(S)` is the free cocompletion of `S` (HTT, Thm. 5.1.5.6, p. 345): for a small simplicial set
`S` and an ∞-category `C` with small colimits, restriction along `j` is an equivalence of ∞-categories
`Fun^colim(P(S), C) ⟶ Fun(S, C)`.

*Proof route.* Lurie's. By Lemma 5.1.5.5, `Fun^colim(P(S), C)` is the full subcategory of left Kan extensions
of functors on the representables. Restriction from left Kan extensions is a trivial fibration. By Yoneda's
lemma, the representables are equivalent to `S` through `j`.

*Needs:*
- §1.4.1 (HTT, Notation 5.1.5.1; Lemma 5.1.5.5);
- §1.3.1 (HTT, Prop. 5.1.3.1);
- Part LimitsAndKanExtensions §7.4.6 (HTT, Cor. 4.3.2.16);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15).

**1.4.4.** Define stability under colimits and generation (HTT, Def. 5.1.5.7, p. 345). A full subcategory `C⁰ ⊆ C` of an
∞-category is stable under colimits when, for every small diagram `p : K ⟶ C⁰` that has a colimit in `C`,
every colimit of `p` in `C` lies in `C⁰`. For `C` with small colimits, a collection `A` of objects generates
`C` under colimits when the only full subcategory containing `A` and stable under colimits is `C`. A map
`f : S ⟶ C` generates `C` when the images of the vertices of `S` do.

- The intersection of full subcategories stable under colimits is stable under colimits, so every
  collection generates a smallest such subcategory.
- A full subcategory stable under colimits of an ∞-category with small colimits has small colimits, and its
  inclusion preserves them.
- Generation depends only on the equivalence classes of the objects of `A`.

**Checks.**

- In `S`, the full subcategory on the point generates `S` under colimits: every space is the colimit of
  the constant diagram at the point indexed by itself. The full subcategory of discrete spaces is not
  stable under colimits: the pushout of two points along the two-point space is a circle. A definition
  through coproducts only would call it stable.
- The empty collection generates the full subcategory of initial objects, since the empty diagram lies in
  every full subcategory; in `S` this is the full subcategory on the spaces equivalent to `∅`. A definition
  reading "stable" as closure under nonempty colimits would make the empty subcategory stable, so the empty
  collection would generate nothing.
- In the lattice ⊥ < a, b < c < ⊤, the full subcategory {⊥, a, b, ⊤} has its own joins, but a ∨ b = c
  lies outside it, so it is not stable. A definition asking only that `C⁰` have colimits would accept it.

*Needs:*
- Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1 (HTT, §1.2.11);
- Tau Ceti `SSet.coslice.IsColimit`, `SSet.fullEnhancedSubcategory`.

**1.4.5.** Prove that the representables generate `P(S)` (HTT, Cor. 5.1.5.8, p. 346): for a small simplicial set `S`,
`j : S ⟶ P(S)` generates `P(S)` under small colimits.

*Proof route.* Lurie's. The smallest full subcategory `C` containing the image of `j` and stable under
colimits has small colimits (Cor. 5.1.2.4), so Thm. 5.1.5.6 extends `j` to a colimit-preserving functor
`P(S) ⟶ C`. Its composite with the inclusion restricts to `j`, so by Thm. 5.1.5.6 again it is equivalent
to the identity. Hence every object of `P(S)` is equivalent to one of `C`.

*Needs:*
- §1.4.3 (HTT, Thm. 5.1.5.6; Def. 5.1.5.7);
- Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.4);
- §1.1.1 (HTT, §5.1.3); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11).

### 1.5 Adjunctions between presheaf ∞-categories

**1.5.1.** Define the ∞-categories of left and right adjoints (HTT, Def. 5.2.6.1, p. 378): for ∞-categories `C` and
`D`, `Fun^L(C, D)` and `Fun^R(C, D)` are the full subcategories of `Fun(C, D)` on the functors that are left
adjoints and on those that are right adjoints.

- Both contain every functor equivalent to one of their members (adjoints transport along equivalences).
- Composition restricts to `Fun^L(D, E) × Fun^L(C, D) ⟶ Fun^L(C, E)` (Mathlib
  `CategoryTheory.Bicategory.Adjunction.comp`).
- Equivalences of ∞-categories lie in both.

**Checks.**

- For `C = Δ[0]` and `D = Δ[0] ⊔ Δ[0]`, `Fun^L(C, D)` and `Fun^R(C, D)` are empty: no vertex of `D` is initial
  or final. A definition admitting all functors would give two objects.
- For `C = Δ[0]` and `D` the nerve of `[1]`, `Fun(C, D)` has the two objects `0` and `1`: `0` lies in
  `Fun^L` only, `1` in `Fun^R` only (an object is a left adjoint exactly when it is initial). A definition
  that ignored which side the adjoint is on would put both in both.
- For `C = D = Δ[0] ⊔ Δ[0]`, the swap and the identity lie in both, while the functor constant at one
  point lies in neither, since it has no adjoint.

*Needs:*
- Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11), Tau Ceti `SSet.fullEnhancedSubcategory`.

**1.5.2.** Prove that left and right adjoints are dual (HTT, Prop. 5.2.6.2, p. 378): for ∞-categories `C` and `D`,
there is a canonical equivalence between `Fun^L(C, D)` and `Fun^R(D, C)^op`, sending a left adjoint to its
right adjoint.

*Proof route.* Lurie's. Embed both into `Fun(C × D^op, S)` through the Yoneda embedding (Prop. 5.1.3.1) as
the functors that are representable in each variable separately (Prop. 5.2.4.2), a condition symmetric in
the two variables.

*Needs:*
- Part AdjunctionsAndLocalizations §1.6.1 (HTT, Prop. 5.2.4.2);
- §1.3.1 (HTT, Prop. 5.1.3.1); §1.5.1 (HTT, Def. 5.2.6.1);
- Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4, representable functors);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §1.2.1 (HTT, §1.2.11) and §2.1.8 (HTT, Def. 1.2.10.1).

**1.5.3.** Prove that restriction of presheaves is a right adjoint (HTT, Prop. 5.2.6.3, p. 379): for a functor
`f : C ⟶ C'` of small ∞-categories, restriction `G : P(C') ⟶ P(C)` along `f^op` is right adjoint to the
colimit-preserving extension `P(f)` of `j ∘ f` given by Thm. 5.1.5.6.

*Proof route.* Lurie's. `G` preserves small colimits (pointwise, Prop. 5.1.2.2). By Prop. 5.2.4.2, `G` has a
left adjoint `F` if for each presheaf `X` on `C` the relevant right fibration is representable. Check this
for representables through Lemma 5.1.5.2 and extend by colimits (Cor. 5.1.5.8). The counit is built from a
unit transformation (Prop. 5.2.2.8), and `F` preserves colimits (Prop. 5.2.3.5) and restricts to `j ∘ f`,
so `F` is equivalent to `P(f)` by Thm. 5.1.5.6.

*Needs:*
- Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8), §1.5.1 (HTT, Prop. 5.2.3.5) and §1.6.1 (HTT, Prop.
  5.2.4.2);
- Part LimitsAndKanExtensions §8.2.2, §8.2.3 (HTT, Prop. 5.1.2.2, Cor. 5.1.2.4); §1.3.2 (HTT, Prop. 5.1.3.2; Lemma 5.1.5.2);
  §1.4.3, §1.4.5 (HTT, Thm. 5.1.5.6, Cor. 5.1.5.8);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2 (HTT, Notation 1.2.7.2; §1.2.11).

**1.5.4.** Prove that restriction followed by a colimit-preserving functor is a left Kan extension (HTT, Lemma 5.2.6.7,
p. 382). For a functor `f : C ⟶ C'` of small ∞-categories, an ∞-category `X` with small colimits, and a
colimit-preserving `H : P(C) ⟶ X` with `h = H ∘ j_C`, the composite of `j_{C'}`, restriction
`P(C') ⟶ P(C)` along `f` and `H` is a left Kan extension of `h` along `f`.

*Proof route.* Lurie's. Restriction is right adjoint to `P(f)` (Prop. 5.2.6.3). For an adjunction `f ⊣ g`
with `f : C ⟶ D` and any `T : C ⟶ X`, the functor `T ∘ g` is a left Kan extension of `T` along `f` (HTT,
Lemma 5.2.6.6, p. 381): through the correspondence `M` of the adjunction and a Cartesian retraction
`r : M ⟶ C`, `T ∘ r` is a left Kan extension from the fiber over `0`, since a colimit over an ∞-category with
a final object is the value there. By transitivity of Kan extensions it suffices that `H ∘ G` is a left Kan
extension of `h` along `j_{C'} ∘ f`, where `G` is restriction. Lemma 5.1.5.5 makes `P(f)` a left Kan
extension of `j_{C'} ∘ f` along `j_C`, so by transitivity again it suffices that `H ∘ G` is a left Kan
extension of `H` along `P(f)`, which is Lemma 5.2.6.6 for the adjunction `P(f) ⊣ G` with `T = H`.

*Needs:*
- §1.5.3 (HTT, Prop. 5.2.6.3); §1.4.2 (HTT, Lemma 5.1.5.5; Thm. 5.1.5.6);
- Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8, the agreement of the definitions);
- Part LimitsAndKanExtensions §7.5.2 (HTT, Prop. 4.3.2.8, transitivity);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §7.1.2, §7.1.4 (HTT, Defs. 4.3.2.2, 4.3.3.2) and §8.1.1 (HTT, Def.
  5.1.0.1); Part AdjunctionsAndLocalizations §1.1.2, §1.1.3 (HTT, Defs. 5.2.1.1, 5.2.2.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §8.2.1 (HTT, Cor. 1.2.12.5) and §2.1.8 (HTT, Def. 1.2.10.1);
- Part CartesianFibrations §4.1.1 (HTT, Def. 2.3.1.3);
- Tau Ceti `SSet.Edge.IsCartesian`, `SSet.coslice.IsColimit`.

**1.5.5.** Prove that colimit-preserving functors out of `P(C)` have explicit right adjoints (HTT, Cor. 5.2.6.5, p. 381).
For a small ∞-category `C`, a locally small ∞-category `D` with small colimits and a colimit-preserving
`F : P(C) ⟶ D` with `f = F ∘ j`, let `G : D ⟶ P(C)` be the Yoneda embedding `D ⟶ Fun(D^op, Ŝ)` followed by
restriction along `f^op`; local smallness makes it land in presheaves of essentially small spaces, and
`G(d) ≃ Map_D(f(−), d)`. Then `G` is right adjoint to `F`, and the map `f ⟶ (F ∘ G) ∘ f` exhibits `F ∘ G` as
a left Kan extension of `f` along itself.

*Proof route.* Build a comparison map, then check it objectwise. The action of `f` on mapping spaces, through
the simplicial functor `C[f]`, is a transformation `j ⟶ G ∘ f = (G ∘ F) ∘ j` of functors `C ⟶ P(C)`. By
Lemma 5.1.5.3 the identity of `P(C)` is a left Kan extension of `j` along `j`, so this transformation extends
to `u : id ⟶ G ∘ F` (Prop. 4.3.3.7). Fix `d`. The full subcategory of `X` for which the composite
`Map(F X, d) ⟶ Map(G F X, G d) ⟶ Map(X, G d)`, apply `G` and then precompose with `u_X`, is an equivalence is
stable under colimits: both sides carry colimits in `X` to limits, the first because `F` preserves colimits,
and both by Prop. 5.1.3.2 for `D^op` and for `P(C)^op`. It contains every `j(c)`: there the composite is the
equivalence `Map(f c, d) ≃ (G d)(c)` of Lemma 5.1.5.2 at the single vertex `c`. So it is all of `P(C)`
(Cor. 5.1.5.8), and `u` is a unit transformation, which exhibits `G` as right adjoint to `F` (Prop. 5.2.2.8).
For the Kan extension, replace `D` by a minimal model, a union of small full subcategories `D_α`; for each
`D_α` through which `f` factors, Lemma 5.2.6.7 applies to `C ⟶ D_α`.

*Needs:*
- §1.5.4 (HTT, Lemma 5.2.6.7); §1.3.2 (HTT, Prop. 5.1.3.2; Lemmas 5.1.5.2, 5.1.5.3); §1.4.5 (HTT, Cor. 5.1.5.8);
- Part AdjunctionsAndLocalizations §1.3.2 (HTT, Prop. 5.2.2.8) and §1.8.2 (HTT, Prop. 4.3.3.7);
- Part LimitsAndKanExtensions §7.1.4 (HTT, Def. 4.3.3.2) and §8.1.1 (HTT, Def. 5.1.0.1); §1.1.1 (HTT, §5.1.3);
  Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §1.2.1 (HTT, §1.2.11) and §2.1.1 (`C[−]`, Mathlib `SimplicialThickening`);
- Part InfinityCategoryFoundations §10.3.1 (HTT, Def. 2.3.3.1);
- Tau Ceti `SSet.IsLocallySmall`.

### 1.6 Completely compact objects are retracts of representables

**1.6.1.** Define completely compact objects (HTT, Def. 5.1.6.2, p. 346): in an ∞-category `C` with small colimits, an
object `X` is completely compact when the functor `j_X : C ⟶ Ŝ` corepresented by `X` preserves small
colimits.

- The condition is invariant under equivalence of objects and passes to retracts (Lemma 5.1.6.4, §1.6.2).
- Representables of `P(S)` are completely compact (Prop. 5.1.6.8, §1.6.5).

**Checks.**

- In `S`, the point is completely compact: `j_∗` is equivalent to the identity. The empty space is not,
  since `Map(∅, −)` is constant at the point and does not preserve the empty colimit. It does preserve
  filtered colimits, so a definition through filtered colimits (compactness) would accept it.
- In `S`, the two-point space is not completely compact: `Map(∗ ⊔ ∗, −)` is `X ↦ X × X`, which does not
  preserve coproducts. It preserves sifted colimits, so a definition through sifted colimits would accept it.
- In `Δ[0] = P(∅)`, the unique object is not completely compact: `Map(∗, −)` sends the coproduct `∗ ⊔ ∗ = ∗`
  to the point rather than to two points. This matches Prop. 5.1.6.8, since `∅` has no vertices. A definition
  through colimits indexed by weakly contractible simplicial sets would accept it.

*Needs:*
- §1.1.2 (HTT, §5.1.6, corepresented functors); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §7.1.2 (`Ŝ`);
- Tau Ceti `SSet.coslice.IsColimit`.

**1.6.2.** Prove that retracts of colimit diagrams are colimit diagrams, and hence that retracts of completely compact
objects are completely compact (HTT, Lemma 5.1.6.3, p. 347; Lemma 5.1.6.4, p. 347): for cocones `p, q : K^▷ ⟶ C` with
`q` a colimit and `p` a retract of `q` in `Fun(K^▷, C)`, `p` is a colimit; and in an ∞-category with small colimits, a
retract of a completely compact object, in particular any object equivalent to one, is completely compact. The
`Suggested.lean` declaration is `isColimitDiagram_of_isRetract`.

*Proof route.* Lurie's. The restriction map of coslices for `p` is a retract, in the homotopy category of
the Joyal model structure, of the one for `q`. That one is a categorical equivalence, weak equivalences are
closed under retracts, and a left fibration that is a categorical equivalence is a trivial fibration. For
objects, the Yoneda embedding of `C^op` carries the retraction to a retraction of corepresented functors,
and the first claim applies to the images of each colimit cocone.

*Needs:*
- §1.6.1 (HTT, Def. 5.1.6.2);
- Part CartesianFibrations §2.5.3 (HTT, Cor. 2.4.4.6) and Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, the Joyal model structure);
- ModelCategoryTheory, Part ModelCategories §3.1.2 (HTT, §A.2.2, the homotopy category of a model category);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2);
- §1.1.1 (HTT,
  §5.1.3); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, colimit diagrams); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts);
- Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`.

**1.6.3.** Define completely compact left fibrations (HTT, Def. 5.1.6.5, p. 348): for an ∞-category `C` with small
colimits, a left fibration `C̃ ⟶ C` is completely compact when it is classified by a functor `C ⟶ Ŝ` that
preserves small colimits.

- The condition is invariant under covariant equivalence of left fibrations, since classifying functors
  are determined up to equivalence.
- For an object `X`, the left fibration `C_{X/} ⟶ C` is completely compact exactly when `X` is.
- Completely compact left fibrations are stable under homotopy base change along maps of spaces (Lemma
  5.1.6.6, §1.6.4).

**Checks.**

- The identity `C ⟶ C` is the left fibration classified by the constant functor at the point. That functor
  sends an initial object to the point rather than to the empty space, so the identity is not completely
  compact for any `C` with small colimits. A definition through filtered colimits would accept it.
- For `C = S`, the left fibration `S_{∗/} ⟶ S` is completely compact (it is classified by the identity),
  while `S_{∅/} ⟶ S`, classified by the constant point, is not.
- The empty left fibration `∅ ⟶ C` is classified by the constant functor at the empty space, which
  preserves all small colimits, so it is completely compact. A definition asking the classifying functor to
  be corepresentable would reject it, since `Map(X, X)` is never empty.

*Needs:*
- §1.1.2 (HTT, §5.1.6); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §7.1.2, §7.1.8 (HTT, §3.3.2, classifying left fibrations; `Ŝ`);
- §1.6.1 (HTT, Def. 5.1.6.2);
- Part InfinityCategoryFoundations §6.3.1 (HTT, §2.1.4, the covariant model structure);
- Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`.

**1.6.4.** Prove that completely compact left fibrations are stable under homotopy base change along maps of spaces
(HTT, Lemma 5.1.6.6, p. 348): for an ∞-category `C` with small colimits, a map `X' ⟶ X` of Kan complexes and
a homotopy pullback square, in the covariant model structure over `C`, of left fibrations from `F' ⟶ F` to
`X' × C ⟶ X × C`, if `F ⟶ C` is completely compact then so is `F' ⟶ C`.

*Proof route.* Lurie's. Replace the square by a strict pullback with `X' ⟶ X` a Kan fibration. A cocone
`K^▷ ⟶ C` is carried to a colimit by the classifying functor of `F` exactly when the inclusion
`K ×_C F ⟶ K^▷ ×_C F` is a weak homotopy equivalence (Prop. 3.3.4.5). The corresponding inclusion for `F'`
is its pullback along a Kan fibration, hence also a weak homotopy equivalence by right properness of the
Kan–Quillen model structure.

*Needs:*
- §1.6.3 (HTT, Def. 5.1.6.5);
- §1.1.2 (HTT, §5.1.6); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §7.1.2, §7.1.8 (HTT, §3.3.2, classifying left fibrations; `Ŝ`);
- Part LimitsAndKanExtensions §8.3.1 (HTT, Prop. 3.3.4.5);
- Part InfinityCategoryFoundations §6.3.1 (HTT, §2.1.4, the covariant model structure); Mathlib `SSet.anodyneExtensions`
  (HTT, Example 2.0.0.1);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pullbacks);
- ModelCategoryTheory, Part KanQuillen §3.4.1 (HTT, §A.2.7, right properness);
- Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`.

**1.6.5.** Prove that the completely compact presheaves are the retracts of representables (HTT, Prop. 5.1.6.8,
p. 349): for a small simplicial set `S`, an object of `P(S)` is completely compact exactly when it is a
retract of `j(s)` for some vertex `s`.

*Proof route.* Lurie's. Representables are completely compact: their corepresented functors are
evaluations (Lemma 5.1.5.2), which preserve colimits (Prop. 5.1.2.2). Retracts follow by Lemma 5.1.6.4.
Conversely, write a completely compact `C` as a colimit of representables (Lemma 5.1.5.3). The identity of
`C` lies in the image of `Map(C, j(s̃))` for some `s̃`, because `π₀` of a colimit of spaces is a quotient of
the `π₀` of its terms. So `C` is a retract of `j(s)`.

*Needs:*
- §1.6.1 (HTT, Def. 5.1.6.2; Lemma 5.1.6.4);
- §1.3.3, §1.3.4 (HTT, Lemmas 5.1.5.2, 5.1.5.3); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §1.1.1, §1.1.2 (HTT, §5.1.3; §5.1.6); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4,
  colimit diagrams).

### 1.7 Recognition of presheaf ∞-categories

**1.7.1.** Prove the recognition principle for presheaf ∞-categories (HTT, Prop. 5.1.6.10, p. 350; Cor. 5.1.6.11,
p. 351). Let `S` be a small simplicial set, `C` an ∞-category with small colimits, `F : P(S) ⟶ C` a functor
preserving small colimits and `f = F ∘ j`.

1. If `f` is fully faithful and every `f(s)` is completely compact, then `F` is fully faithful.
2. `F` is an equivalence exactly when `f` is fully faithful, every `f(s)` is completely compact, and the
   objects `f(s)` generate `C` under colimits.

*Proof route.* Lurie's. For (1), fix `s`. The objects `Y` with `Map(j s, Y) ⟶ Map(f s, F Y)` an equivalence
form a full subcategory stable under colimits, since both sides preserve colimits. It contains the
representables, hence everything, by Cor. 5.1.5.8. Repeat in the first variable. For (2), `F` is fully
faithful by (1); its essential image is stable under colimits and contains the `f(s)`, so it is all of `C`.
Conversely, an equivalence carries the representables, which have these properties (Prop. 5.1.3.1, Prop.
5.1.6.8, Cor. 5.1.5.8), to objects with them.

*Needs:*
- §1.6.1 (HTT, Def. 5.1.6.2; Prop. 5.1.6.8);
- §1.3.1, §1.3.2 (HTT, Props. 5.1.3.1, 5.1.3.2); §1.4.4, §1.4.5 (HTT, Def. 5.1.5.7, Cor. 5.1.5.8);
- Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential-surjectivity half);
- §1.1.1, §1.1.2 (HTT, §5.1.3; §5.1.6); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §1.2 (HTT, Notation 1.2.7.2) and §2.1.8 (HTT, Def. 1.2.10.1);
- Tau Ceti `SSet.IsFullyFaithful`, `SSet.coslice.IsColimit`.

### Examples

- `P(Δ[0])` is `S`, and Thm. 5.1.5.6 says a colimit-preserving functor out of `S` is determined by its value
  on the point.
- For `S` the nerve of a small category `A`, Prop. 5.1.3.1 restricts on `π₀` of mapping spaces to the
  Yoneda lemma for `A`.
- `P(∂Δ[1])` is `S × S`, and its completely compact objects are the two representables `(∗, ∅)` and
  `(∅, ∗)` (Prop. 5.1.6.8); `(∗, ∗)` is not completely compact, since it is a coproduct of the two.

### Dependencies

Layer 1 uses Part LimitsAndKanExtensions (colimits in functor ∞-categories and in `S`, rectification,
representable presheaves, cofinality, smooth maps and Kan extensions), Part AdjunctionsAndLocalizations (the
agreement of the definitions of adjunction, preservation of colimits by adjoints, Kan extensions as left
adjoints to restriction, the representability
criterion), the definitions of presheaves, Kan extensions and cofinality (Part LimitsAndKanExtensions), retracts (Part
AdjunctionsAndLocalizations) and spaces (Part InfinityCategoryFoundations), Part InfinityCategoryFoundations (the covariant, contravariant and Joyal model structures,
straightening of right fibrations, minimal models), Part CartesianFibrations (fiberwise equivalence criteria,
Cartesian fibrations over `Δ[1]`, comma fibrations), Part Straightening (the marked straightening Quillen
adjunction, limits in `S` as section spaces, Kan extensions along coCartesian fibrations) and
ModelCategoryTheory (projective structures, homotopy limits, Quillen equivalences, right properness).

## Layer 2: Idempotents and their splittings

### 2.1 Idempotents and idempotent completeness

**2.1.1.** Let `R` be the category with objects `X` and `Y`, non-identity morphisms `e : X ⟶ X`, `r : X ⟶ Y` and `i :
Y ⟶ X`, and relations `r ∘ i = id_Y`, `i ∘ r = e`. Define `Idem⁺ = N(R)`, `Idem ⊆ Idem⁺` its full subcategory on `X`,
and `Ret ⊆ Idem⁺` the image of the 2-simplex `Y ⟶ X ⟶ Y` (HTT, Def. 4.4.5.2, p. 322). `R` is the Karoubi envelope of
the one-object category of the monoid `{1, e}` (Mathlib `CategoryTheory.Idempotents.Karoubi`), with `X` the idempotent
`1` and `Y` the idempotent `e`. `Suggested.lean` declarations: `idem`, `idemPlus`, `idemToIdemPlus` and `ret`. The
`Suggested.lean` declaration is `innerAnodyneExtensions_ret_ι`.

- `Idem` has one vertex and is the nerve of a monoid; it has a nondegenerate simplex `(e, …, e)` in every
  dimension.
- `Ret` and `Idem⁺` have the two vertices `X` and `Y`, and `Idem ⊆ Idem⁺` is the full simplicial subset on `X`.

**Checks.**
- `Idem` is not `N(ℤ/2)`: its 2-simplex `(e, e)` has long edge `e`, not `1`.
- `Ret` is `Δ[2]` with its long edge collapsed. It is not an ∞-category: the inner horn `X ⟶ Y ⟶ X` has no
  filler in `Ret`, which has no edge `e`. `Idem⁺` is an ∞-category, as a nerve.
- `R` has exactly five morphisms (the two identities, `e`, `r` and `i`), since `e ∘ e = e`, `r ∘ e = r` and
  `e ∘ i = i`.

*Needs:* Mathlib `CategoryTheory.nerve`.

**2.1.2.** Define an idempotent in an ∞-category `C` as a map `Idem ⟶ C` (HTT, Def. 4.4.5.4 (1), p. 322), and `C` to be
idempotent complete when every idempotent has a colimit (HTT, §5.1.4, p. 339, recalling §4.4.5). §2.3 shows that
this is equivalent to every idempotent having a limit, and to every idempotent extending to `Idem⁺`.

- A functor `F : C ⟶ D` carries idempotents of `C` to idempotents of `D` by composition.
- Idempotent completeness is invariant under equivalence of ∞-categories: an equivalence and its inverse carry
  idempotents to idempotents and colimit cocones to colimit cocones.

**Checks.**
- An ∞-category with small colimits is idempotent complete; `Δ[1]` is.
- The nerve of the category of finitely generated free modules over `ℤ × ℤ` is not idempotent complete: the
  idempotent `(1, 0)` has no colimit, since a colimit would split it with image the non-free module `ℤ × 0`.
  This matches Mathlib's `CategoryTheory.IsIdempotentComplete`.
- `∂Δ[1]`, the nerve of a discrete category with two objects, is idempotent complete: every idempotent is
  constant at an identity, and its colimit is that object. It has no initial object and no coproduct of its
  two objects, so idempotent completeness does not need finite colimits; the converse also fails: finite
  spaces have finite colimits but are not idempotent complete.
- Idempotent completeness is not a condition on the homotopy category (HTT, Counterexample 4.4.5.19, p. 327; this
  Check uses §2.2 and §2.4 below). Let `G` be the discrete group of homeomorphisms of `[0, 1]` fixing the endpoints,
  and `λ : G ⟶ G` the injective, non-surjective homomorphism that compresses `g` into `[0, 1/2]` and is the identity
  on `[1/2, 1]`. Conjugation by a suitable `h ∈ G` relates `λ` and `λ²`, so the induced map `e : BG ⟶ BG` is
  idempotent in `hS`. It lifts to no idempotent `Idem ⟶ S`: otherwise the colimit of `BG ⟶ BG ⟶ ⋯` along `e` would be
  a retract, up to homotopy, of `BG`, the map from the first stage having a right homotopy inverse (HTT, Rem.
  4.4.5.18), and on fundamental groups `G` would surject, up to conjugacy, onto the colimit of `G ⟶ G ⟶ ⋯` along `λ`.
  So `e` does not split in `hS` either, since a splitting would give a weak retraction diagram extending to `Idem⁺`
  (HTT, Cor. 4.4.5.7). Yet `S` is idempotent complete (first Check), so a definition through idempotents of `hC`
  disagrees with this one on `S`.

*Needs:* §2.1.1 (`Idem`); Part InfinityCategoryFoundations §1.2.4 (colimits); Mathlib `CategoryTheory.IsIdempotentComplete`
for the comparison; Mathlib `SSet.hoFunctor` (`hS`), for the fourth Check.

### 2.2 Weak and strong retraction diagrams

**2.2.1.** For an ∞-category C, `Fun(Idem, C)` is the ∞-category of idempotents of §2.1. Define a weak retraction diagram as a map `Ret ⟶ C`, and a strong retraction diagram as a map `Idem⁺ ⟶ C` (HTT, Def. 4.4.5.4 (2), (3), p. 322), with `Ret ⊆ Idem⁺` as in §2.1.

- Restriction along `Idem ⊆ Idem⁺` sends a strong retraction diagram to its idempotent; `Fun(Idem, C)`, `Fun(Ret, C)` and `Fun(Idem⁺, C)` are ∞-categories by Mathlib's instance.

**Checks.**

- For C the nerve of an ordinary category, `Fun(Idem, C)` is the nerve of the category of pairs `(X, e)` with `e ∘ e = e`.
- For C the nerve of a partially ordered set, every idempotent is constant at an identity, since all endomorphisms are identities.
- In the nerve of sets, a strong retraction diagram for `Y ⊆ X`, with inclusion i and retraction r, restricts to the idempotent `i ∘ r` on X and to `r ∘ i = id_Y` on Y. A definition of retraction diagrams as maps from `Idem` would lose the object Y.

*Needs:* §2.1.1, §2.1.2 (HTT, Defs. 4.4.5.2, 4.4.5.4 (1)); Mathlib instance `Quasicategory ((ihom K).obj C)`.

**2.2.2.** Prove that `Ret ⊆ Idem⁺` is inner anodyne (HTT, Prop. 4.4.5.6, p. 323), so that `Fun(Idem⁺, C) ⟶ Fun(Ret, C)` is a trivial fibration for every ∞-category C and every weak retraction diagram extends to a strong one (HTT, Cor. 4.4.5.7, p. 323). A route: filter `Idem⁺` by its simplices; each step is a pushout of an inclusion `K ⊆ Δ[n]`, with K spanned by the nondegenerate simplices not containing `Δ^J` for some `J ⊆ [n]` having `i < j < k` with `i, k ∈ J`, `j ∉ J`. Such an inclusion is inner anodyne, by filling inner horns at j in order of dimension (HTT, Lemma 4.4.5.8, p. 323). Then apply HTT 2.3.2.5.
*Needs:* §2.2.1; §2.1.1 (HTT, Def. 4.4.5.2); Mathlib `SSet.innerAnodyneExtensions`; Part InfinityCategoryFoundations §9.2.2 (HTT, Cor. 2.3.2.5).

### 2.3 Effective idempotents: colimits, limits and splittings

**2.3.1.** Prove that a strong retraction diagram `Idem⁺ ⟶ C` is both a left and a right Kan extension of its
restriction to `Idem` (HTT, Prop. 4.4.5.12, p. 325, and its dual, Rem. 4.4.5.13, p. 325). A route: `Idem ⊆ Idem⁺` is
cofinal (HTT, Lemma 4.4.5.11, p. 325) by Theorem A (Part LimitsAndKanExtensions §5.4). Its fiber product over the
object X has an initial object, and over Y it is isomorphic to `Idem`, which is weakly contractible (HTT, Lemma
4.4.5.10, p. 325) as a retract of `Idem^▷` (HTT, Lemma 4.4.5.9, p. 325), whose cone point is final. So the restriction
to `Idem_{/Y}` reindexes cofinally, and the condition at Y is a colimit condition (Part LimitsAndKanExtensions §2.5).
For the right Kan extension, reversing all morphisms identifies `Idem⁺` with its opposite, fixing both objects and
exchanging the section and the retraction, compatibly with `Idem ⊆ Idem⁺`; so the left Kan extension statement for
`Cᵒᵖ` applies. The `Suggested.lean` declaration is `isLeftKanExtension_idemPlus`. *Needs:* Part LimitsAndKanExtensions
§2.5.2 (HTT, Prop. 4.1.1.8) and §5.4.2 (HTT, Thm. 4.1.3.1); Mathlib `SSet.Quasicategory`, `SSet.opFunctor`; Tau Ceti
`SSet.IsWeaklyContractible`; §2.1.1 (HTT, Def. 4.4.5.2); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1) and
§7.1.2 (HTT, Def. 4.3.2.2, and its dual form); Part InfinityCategoryFoundations §1.2 (cones, HTT §1.2.8; HTT,
§1.2.12); Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5); ModelCategoryTheory, Part KanQuillen §3.2.1
(HTT, §A.2.7).

**2.3.2.** Prove that for an idempotent F in C the following are equivalent: F extends to `Idem⁺`; F has a colimit; F
has a limit (HTT, Cor. 4.4.5.14, p. 325). Call F effective when these hold. Consequently C is idempotent complete,
that is every idempotent has a colimit (§2.1), exactly when every idempotent has a limit, exactly when every
idempotent is effective (HTT, Cor. 4.4.5.15, p. 326); HTT takes the last condition as the definition (introduction to
§4.4.5). A route: an extension is a left and a right Kan extension by §2.3.1, so its value at Y is a colimit and a
limit. Conversely, a colimit of F gives an extension by left Kan extension along `Idem ⊆ Idem⁺`: the diagram to extend
over X has the final object `id_X` and over Y it is F itself, so the pointwise colimits exist; dually for a limit. The
statement on C follows idempotent by idempotent. The `Suggested.lean` declarations are
`tfae_exists_idemPlus_extension` and `tfae_isIdempotentComplete`. *Needs:* §2.3.1 (HTT, Prop. 4.4.5.12; Rem.
4.4.5.13); §2.1.2 (HTT, §5.1.4, idempotent completeness); Part LimitsAndKanExtensions §7.4.2 (HTT, Lemma 4.3.2.13,
existence of Kan extensions, and its dual); Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`.

### 2.4 Retracts as sequential colimits

**2.4.1.** Prove that for a nonempty linearly ordered set A with no largest element, the map `N(A) ⟶ Idem` sending
nondegenerate simplices to nondegenerate simplices is cofinal (HTT, Prop. 4.4.5.17, p. 326; the source omits
nonemptiness, without which the statement fails: for A empty the fiber product is empty, hence not weakly
contractible). A route: by Theorem A (Part LimitsAndKanExtensions §5.4) the fiber product over the object of `Idem`
must be weakly contractible; it is the nerve of the poset `A × {0, 1}` in which `(α, i) < (α′, j)` exactly when `j =
1` and `α < α′`. Since A is nonempty with no largest element, this nerve is the nonempty filtered union of its parts
over the subsets `A_{<α}`, and each such inclusion factors through the nerve of a poset with a largest element, so it
is nullhomotopic. So for an idempotent `(X, e)`, the retract it determines is the colimit of `X ⟶ X ⟶ ⋯` with every
map e, when that colimit exists (HTT, Rem. 4.4.5.18, p. 326): take `A = ℕ` and transfer colimits by §2.3 and Part
LimitsAndKanExtensions §2.5. The `Suggested.lean` declaration is `isCofinal_nerveMap_toIdemMonoid`. *Needs:* §2.3.2
(HTT, Cor. 4.4.5.14); Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8) and §5.4.2 (HTT, Thm. 4.1.3.1); Mathlib
`SSet.Quasicategory`; Tau Ceti `SSet.coslice.IsColimit`; §2.1.1 (HTT, Def. 4.4.5.2; introduction to §4.4.5); Part
LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### Examples

- In the nerve of abelian groups, a coordinate projection e of `ℤ²` is an effective idempotent: its colimit
  is the image of e, a copy of ℤ.
- In the nerve of sets, the colimit `colim(X ⟶ X ⟶ ⋯)` of §2.4 is the image of e.
- The nerve of free abelian groups of finite rank is idempotent complete, since direct summands are free.
  For a ring R with a finitely generated projective module P that is not free, with `P ⊕ Q` free, the
  projection onto P is an idempotent in the nerve of finitely generated free R-modules with no colimit
  there, since a colimit would split it and make P free (§2.3).

### Dependencies

Layer 2 uses Part LimitsAndKanExtensions (cofinal maps preserve colimits, Theorem A, existence of Kan extensions),
the definitions of cones (Part InfinityCategoryFoundations), Kan extensions and cofinality (Part
LimitsAndKanExtensions), Part InfinityCategoryFoundations (restriction along inner anodyne maps, terminal objects),
ModelCategoryTheory Part KanQuillen (weak homotopy equivalences, for the weak contractibility of `Idem` and of the
posets of §2.4 of this Part), the opposite of a simplicial set in Mathlib, and Tau Ceti
`SSet.IsWeaklyContractible`.

## Layer 3: Idempotent completions

### 3.1 Idempotent completions and slices

**3.1.1.** Define idempotent completions (HTT, Def. 5.1.4.1, p. 339): a functor `f : C ⟶ D` of ∞-categories exhibits
`D` as an idempotent completion of `C` when `f` is fully faithful, `D` is idempotent complete, and every object of `D`
is a retract of an object in the image of `f`. The `Suggested.lean` declaration is `IsIdempotentComplete.slice`.

- The identity of an idempotent complete ∞-category is an idempotent completion.
- The condition is invariant under replacing `f` by an equivalent functor or `D` by an equivalent
  ∞-category.
- If `C` is itself idempotent complete, an idempotent completion `f : C ⟶ D` is an equivalence: a retract of
  `f(c)` is the colimit of an idempotent on `f(c)`, which comes from an idempotent on `c` by full faithfulness,
  and colimits of idempotents are preserved by every functor (§2.3).

**Checks.**

- For the nerve of a category `A`, the nerve of the inclusion of `A` into its Karoubi envelope is an
  idempotent completion. The Yoneda embedding of `A` into presheaves of sets is fully faithful with
  idempotent complete target, but not every presheaf is a retract of a representable; a definition without
  the retract condition would accept it.
- The functor `Δ[0] ⊔ Δ[0] ⟶ Δ[0]` has idempotent complete target, and every object of `Δ[0]` is in its
  image, but it is not fully faithful. A definition without full faithfulness would accept it.
- The identity of `S` is an idempotent completion. The identity of the nerve of the category of free
  modules of finite rank over a ring with a non-free finitely generated projective module is not, since an
  idempotent with a non-free image has no colimit there.

*Needs:*
- §2.1.2 (idempotent completeness); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1, fully faithful maps); Part
  AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts);
- §2.3.1, §2.3.2 (HTT, Prop. 4.4.5.12, Cor. 4.4.5.14), for the third item;
- Tau Ceti `SSet.IsFullyFaithful`.

**3.1.2.** Prove that idempotent completeness and idempotent completions pass to slices (HTT, Lemma 5.1.4.3, p. 340;
Lemma 5.1.4.4, p. 340): The `Suggested.lean` declarations are `IsIdempotentComplete.coslice` and
`IsIdempotentCompletion.pullback_slice`.

- if `C` is idempotent complete, so are `C_{/p}` and `C_{p/}` for every diagram `p : K ⟶ C`;
- if `f : C ⟶ D` exhibits `D` as an idempotent completion of `C`, then for every `p : K ⟶ D` the projection
  `C ×_D D_{/p} ⟶ D_{/p}` exhibits `D_{/p}` as an idempotent completion of `C ×_D D_{/p}`.

*Proof route.* Lurie's. An ∞-category is idempotent complete exactly when every idempotent has a limit, and
limits along the right fibration `C_{/p} ⟶ C` are computed from limits in `C` with the join description of
slices. For the second item, retractions lift along the right fibration `D_{/p} ⟶ D`, whose edges are all
Cartesian, and full faithfulness follows from that of `f`, because mapping spaces in the slices are homotopy
fibers of mapping spaces in `C` and `D`.

*Needs:*
- §3.1.1 (HTT, Def. 5.1.4.1);
- §2.3.2 (HTT, Cor. 4.4.5.15), §2.2.1 (HTT, Def. 4.4.5.4) and Part LimitsAndKanExtensions §7.3.5 (HTT, Prop. 4.4.2.9, Lemma
  4.2.3.6);
- Part CartesianFibrations §1.3.1 (HTT, Prop. 2.4.1.5) and §2.2.1 (HTT, Prop. 2.4.2.4);
- Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts);
- Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2);
- Tau Ceti `SSet.slice.IsLimit`, `SSet.RightFibration`, `SSet.Edge.IsCartesian`.

### 3.2 Existence of idempotent completions

**3.2.1.** Prove that every ∞-category has an idempotent completion (HTT, Prop. 5.1.4.2, p. 339): for a small `C`, the
full subcategory of `P(C)` on the retracts of representables, with the Yoneda embedding, is an idempotent completion;
a large `C` is handled in the next universe. The `Suggested.lean` declaration is `exists_isIdempotentCompletion`.

*Proof route.* Lurie's. `P(C)` has small colimits (Cor. 5.1.2.4), so it is idempotent complete. A full
subcategory closed under retracts inherits this. The Yoneda embedding is fully faithful (Prop. 5.1.3.1).

*Needs:*
- Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.4); §1.3.1 (HTT, Prop. 5.1.3.1);
- §3.1.1 (HTT, Def. 5.1.4.1);
- §2.3.2 (HTT, Cor. 4.4.5.15);
- §1.1.1 (HTT, §5.1.3); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §1.2.1 (HTT,
  §1.2.11) and §2.1.8 (HTT, Def. 1.2.10.1);
- Tau Ceti `SSet.coslice.IsColimit`.

### 3.3 Cofinality and uniqueness of idempotent completions

**3.3.1.** Prove that every idempotent completion is cofinal (HTT, Lemma 5.1.4.6, p. 341): if `f : C ⟶ D` exhibits `D`
as an idempotent completion of `C`, then `f` is cofinal. The `Suggested.lean` declaration is
`IsIdempotentCompletion.isCofinal`.

*Proof route.* Lurie's. By Theorem A it suffices that `C ×_D D_{d/}` is weakly contractible for every
object `d` of `D`. By Lemma 5.1.4.4 (dual form) it is the source of an idempotent completion of `D_{d/}`,
which has the initial object `id_d`. The source of an idempotent completion with initial target is weakly
contractible (HTT, Lemma 5.1.4.5, p. 340): with `C` a full subcategory of `D`, some object `c` of `C` maps to
the initial object by a morphism `u`; the projection from the ∞-category of objects of `C` under `u` to `C`
is a trivial fibration, since the target of `u` is initial, and it factors through `C_{c/}`, which has an
initial object and so is weakly contractible.

*Needs:*
- §3.1.1 (HTT, Def. 5.1.4.1; Lemma 5.1.4.4);
- Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1, Theorem A);
- Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.1, initial objects; HTT,
  §1.2.11);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5) and §5.5.2 (HTT, Prop. 1.2.12.4, initial objects through
  trivial fibrations of slices); Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (weak homotopy equivalences), Tau Ceti
  `SSet.IsWeaklyContractible`.

**3.3.2.** Prove that idempotent completions are unique (HTT, Prop. 5.1.4.9, p. 341): if `f : C ⟶ D` exhibits `D` as
an idempotent completion of `C` and `E` is idempotent complete, then restriction
`f^* : Fun(D, E) ⟶ Fun(C, E)` is an equivalence of ∞-categories. Hence any two idempotent completions of
`C` are equivalent under `C`, and the idempotent completion of a small ∞-category is essentially small: it is
locally small and has a small set of equivalence classes of objects (HTT, Remark 5.1.4.10, p. 342).
`Suggested.lean` declarations: `isCategoricalEquivalence_pre` for the equivalence, with `idem` and
`IsIdempotentComplete` (§2.1), `IsIdempotentCompletion` (§3.1), and `IsRetract` (a 2-simplex composing
`y ⟶ x ⟶ y` to the identity, the retracts of Part AdjunctionsAndLocalizations §2.1).

*Proof route.* Lurie's. Replace `f` by the inclusion of a full subcategory `C⁰ ⊆ C`. Every functor
`F : C ⟶ E` is a left Kan extension of `F|C⁰` (HTT, Lemma 5.1.4.7, p. 341): for each object `c`, the
inclusion `C⁰_{/c} ⊆ C_{/c}` is an idempotent completion (Lemma 5.1.4.4), hence cofinal (Lemma 5.1.4.6), and
`C_{/c}` has the final object `id_c`. Every functor `F⁰ : C⁰ ⟶ E` extends to `C` (HTT, Lemma 5.1.4.8,
p. 341): left Kan extend `j ∘ F⁰` into `P(E)`, whose values are retracts of representables and so lie in the
essential image of `j`, since `E` is idempotent complete; homotopy extension replaces the result by a functor
into `E`. Restriction from left Kan extensions is a trivial fibration. For the size statement, by Prop.
5.1.4.2 and uniqueness the completion is a full subcategory of `P(C)`, and its objects are images of
idempotents of `hC`.

*Needs:*
- §3.1.1 (HTT, Def. 5.1.4.1; Lemma 5.1.4.4); §3.2.1 (HTT, Prop. 5.1.4.2); §3.3.1 (HTT, Lemma 5.1.4.6);
- Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.4); §1.3.1 (HTT, Prop. 5.1.3.1);
- Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8); Part LimitsAndKanExtensions §7.4.2, §7.4.3 (HTT, Lemma 4.3.2.13, Prop.
  4.3.2.15);
- §1.1.1 (HTT, §5.1.3); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1), §7.1.2 (HTT, Def. 4.3.2.2) and §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1, §1.2.4 (HTT, §1.2.11; Def. 1.2.13.4, colimit diagrams);
- Mathlib `SSet.rlp_monomorphisms` and Tau Ceti `SSet.rlp_monomorphisms_iff` (HTT, Example 2.0.0.2);
- ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1);
- Tau Ceti `SSet.coslice.IsColimit`, `SSet.IsLocallySmall`.

### Examples

- For the nerve of a category, the idempotent completion is the nerve of its Karoubi envelope (§3.1, §3.3).
- `P(C)` and every ∞-category with small colimits is idempotent complete, so the idempotent completion of
  `C` sits inside `P(C)` (§3.2).
- The idempotent completion of the nerve of the monoid `{1, e}` with `e² = e` is the nerve of its Karoubi
  envelope, with two objects, the original one and the image of `e`, related by a retraction (§3.1).

### Dependencies

Layer 3 uses Layers 1 and 2 (Yoneda's lemma; effective idempotents and retraction diagrams), Part
LimitsAndKanExtensions (colimits in functor ∞-categories, Theorem A, cofinal maps preserve colimits, relative
colimits, Kan extensions as a trivial fibration), Part CartesianFibrations (Cartesian edges of right
fibrations), Part InfinityCategoryFoundations (slices, initial objects), the definitions of
retracts (Part AdjunctionsAndLocalizations), Kan extensions and cofinality (Part LimitsAndKanExtensions) and homotopy extension from ModelCategoryTheory Part ModelCategories.

## Layer 4: Filtered ∞-categories and κ-right exact functors

### 4.1 κ-filtered ∞-categories

**4.1.1.** Define, for a regular cardinal κ, a simplicial set `C` to be a κ-filtered ∞-category when it is an
∞-category and satisfies Tau Ceti's `SSet.IsCardinalFiltered` for κ: every map from a κ-small simplicial set `K` to
`C` extends to `K^▷`. It is filtered when it is ω-filtered (HTT, Def. 5.3.1.7, p. 400). The Conventions extend
κ-filteredness to arbitrary simplicial sets through categorical equivalences. `Suggested.lean` declaration:
`IsFiltered`, the case κ = ω. The `Suggested.lean` declarations are
`isCardinalFiltered_iff_of_isCategoricalEquivalence` and `isCardinalFiltered_of_isTerminalVertex`.

- A κ-filtered ∞-category is κ′-filtered for every regular κ′ ≤ κ, since κ′-small simplicial sets are κ-small.
- An ∞-category with a final object `z` is κ-filtered for every κ: a map `K ⟶ C` lifts along the trivial
  fibration `C_{/z} ⟶ C` and so extends to `K^▷` with cone point `z` (Part InfinityCategoryFoundations §5.5; HTT, Remark
  5.3.1.17, p. 404).

**Checks.**
- `∅` is not filtered, since the empty diagram has no cone, and every `Δ[n]` is; the supplier contract of
  `SSet.IsCardinalFiltered` has further Checks of the extension condition.
- `Λ[2,1] ⋆ Δ[0]`, the right cone on `Λ[2,1]`, satisfies the extension condition: a map
  `f : K ⟶ Λ[2,1] ⋆ Δ[0]` extends to `K ⋆ Δ[0]` as `f ⋆ id : K ⋆ Δ[0] ⟶ (Λ[2,1] ⋆ Δ[0]) ⋆ Δ[0]` followed by the
  collapse `Δ[1] ⟶ Δ[0]` in the join variable. It is not a filtered ∞-category, since it is not an
  ∞-category (the horn `0 ⟶ 1 ⟶ 2` has no filler), although it is κ-filtered as a simplicial set in the
  sense of the Conventions, being categorically equivalent to `Δ[3]`. A definition through Tau Ceti's class
  alone would accept it.
- The nerve of a category `I` is filtered exactly when `I` is filtered in Mathlib's sense
  (`CategoryTheory.IsFiltered`): its conditions are the extension conditions along `K ⊆ K^▷` for `∅`, `∂Δ[1]`
  and two parallel edges, and conversely a map from a finite `K` to `N(I)` involves finitely many objects and
  morphisms, which have a common cocone. The nerve of the group ℤ/2 is an ∞-category that is not filtered: the
  two parallel edges `id, σ` have no coequalizing cone.

*Needs:* Tau Ceti `SSet.IsCardinalFiltered`; Mathlib `SSet.Quasicategory`, `CategoryTheory.IsFiltered`; Part
InfinityCategoryFoundations §1.2.2 (cones) and §5.5.2 (HTT, Prop. 1.2.12.4, final objects).

### 4.2 Testing κ-filteredness

**4.2.1.** Prove two reformulations of κ-filteredness for an ∞-category C (HTT, Remarks 5.3.1.11 and 5.3.1.12, p.
401). First, C is κ-filtered exactly when `C_{p/}` is nonempty for every `p : K ⟶ C` with K κ-small; hence, for a
categorical equivalence `C ⟶ C'` of ∞-categories, C is κ-filtered exactly when C' is. Second, C is κ-filtered exactly
when every map `N(A) ⟶ C` from the nerve of a κ-small partially ordered set extends along `N(A) ⊆ N(A)^▷`. A route: a
vertex of `C_{p/}` is an extension of p to `K^▷`, and a categorical equivalence induces categorical equivalences of
undercategories. For the second statement, precompose a κ-small p with a cofinal map `N(A) ⟶ K` from a κ-small poset
(HTT, Variant 4.2.3.15 for κ uncountable, Variant 4.2.3.16 for κ = ω); the undercategories of p and of the composite
are equivalent. The `Suggested.lean` declaration is `isCardinalFiltered_iff_nerve`. *Needs:* §4.1.1 (HTT, Def.
5.3.1.7); Part InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4, cones) and §2.1.6 (HTT, Def. 1.1.5.14); Part
LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Tau Ceti `SSet.IsCardinalFiltered`, `SSet.coslice`; Part
CartesianFibrations §3.1.2 (HTT, Prop. 1.2.9.3, second part); Part LimitsAndKanExtensions §6.4.2, §6.4.3 (HTT,
Variants 4.2.3.15, 4.2.3.16) and §2.5.2 (HTT, Prop. 4.1.1.8).

**4.2.2.** Prove the boundary test for filteredness (HTT, Lemma 5.3.1.14, p. 401): an ∞-category C is filtered exactly
when every map `∂Δ[n] ⟶ C`, `n ≥ 0`, extends along `∂Δ[n] ⊆ Λ[n+1, n+1]`, the latter identified with the cone
`(∂Δ[n])^▷`. A route: extend a map from a finite K to `K^▷` by induction on the dimension and the number of
nondegenerate simplices of K, filling a boundary and then an inner horn with the pushout-join lemma. The
`Suggested.lean` declaration is `isCardinalFiltered_aleph0_iff_boundary`. *Needs:* §4.1.1 (HTT, Def. 5.3.1.7); Part
InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4, cones); Tau Ceti `SSet.join`, `SSet.IsCardinalFiltered`;
Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3).

**Checks.**

- For n = 0 the test asks for a vertex, so the empty ∞-category is not filtered; for n = 1 it asks for a cone on every pair of objects. A test using only `n ≥ 1` would accept the empty ∞-category.
- `∂Δ[1]` is not ω-filtered: it is the two-object discrete ∞-category, where the two objects have no common cone point. A definition testing only diagrams of vertices that are already connected would accept it.
- The nerve of a directed preorder is filtered as a simplicial set, and the nerve of a partially ordered set with two distinct maximal elements is not, in agreement with the order-theoretic notion.

### 4.3 Weak contractibility and cofinal diagonals

**4.3.1.** Prove that an ∞-category C such that the inclusion `C ⊆ C^▷` has a retraction is κ-filtered for every κ
(HTT, Example 5.3.1.9, p. 401); in particular the ∞-category `Idem` is. A route: for a diagram `p : K ⟶ C`, compose
`p^▷ : K^▷ ⟶ C^▷` with the retraction; for `Idem` the retraction is HTT, Lemma 4.4.5.9 (§2.3). A consequence used
later (the final-object case is the §4.1 bullet): since `Idem` is κ-filtered, in an ∞-category admitting small
κ-filtered colimits every idempotent has a colimit, so it is idempotent complete (HTT, Remark 5.3.1.10, p. 401; §2.3).
The `Suggested.lean` declarations are `isCardinalFiltered_idem` and
`isIdempotentComplete_of_cardinalFiltered_colimits`. *Needs:* §2.1.1 (HTT, Def. 4.4.5.2; introduction to §4.4.5) and
§4.1.1 (HTT, Def. 5.3.1.7); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.2 (HTT, Notation 1.2.8.4;
§1.2.12); §2.3.1 (HTT, Lemma 4.4.5.9; Cor. 4.4.5.15); Part InfinityCategoryFoundations §5.5.2 (HTT, Prop. 1.2.12.4);
Tau Ceti `SSet.coslice.IsColimit`.

**4.3.2.** Prove that filtered ∞-categories are weakly contractible (HTT, Lemma 5.3.1.20, p. 406). `Suggested.lean` declaration: `isWeaklyContractible_of_isCardinalFiltered`. A route, with `Ex^∞` in place of geometric realization: C is nonempty; `Ex^∞` commutes with filtered colimits, so every class in a homotopy group of `Ex^∞ C` at a vertex c comes from a finite simplicial subset `K ⊆ C` containing c. It dies in `K^▷ ⟶ C`, and `K^▷` is weakly contractible. Conclude with the combinatorial Whitehead theorem.
*Needs:* §4.1.1 (HTT, Def. 5.3.1.7); Part InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4); Tau Ceti `SSet.IsCardinalFiltered`, `SSet.IsWeaklyContractible`; ModelCategoryTheory, Part KanQuillen §2.2.1 (`Ex^∞`), §1.1 (homotopy groups) and §1.3.3 (Whitehead's theorem).

**4.3.3.** Prove that undercategories of κ-filtered ∞-categories are κ-filtered (HTT, Lemma 5.3.1.21, p. 406): if C is
κ-filtered and `p : K ⟶ C` has κ-small source, then `C_{p/}` is κ-filtered. A route: for a κ-small `p' : K' ⟶ C_{p/}`,
the slice `(C_{p/})_{p'/}` is `C_{q/}` for the induced `q : K ⋆ K' ⟶ C`; `K ⋆ K'` is κ-small, so this slice is
nonempty (§4.2). The `Suggested.lean` declaration is `isCardinalFiltered_coslice`. *Needs:* §4.2.1 (HTT, Remark
5.3.1.11); §4.1.1 (HTT, Def. 5.3.1.7); Tau Ceti `SSet.join`, `SSet.coslice`; Tau Ceti `SSet.slice.homEquiv`,
`SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2).

**4.3.4.** Prove that C is κ-filtered exactly when, for every κ-small simplicial set K, the diagonal `C ⟶ Fun(K, C)` is cofinal (HTT, Prop. 5.3.1.22, p. 406). `Suggested.lean` declaration: `isCardinalFiltered_iff_forall_isCofinal_diagonal`. A route: by Theorem A the diagonal is cofinal exactly when each `C ×_{Fun(K, C)} Fun(K, C)_{p/}` is weakly contractible, and this ∞-category is equivalent to `C_{p/}` through the fat slice of p. If C is κ-filtered, `C_{p/}` is κ-filtered (Lemma 5.3.1.21) and so weakly contractible (Lemma 5.3.1.20). Conversely, a weakly contractible simplicial set is nonempty, and a vertex is an extension of p over the fat cone `K ⋄ Δ[0]`, which is categorically equivalent to `K^▷`, so p extends over `K^▷` (HTT, Prop. A.2.3.1).
*Needs:* §4.3.2 and §4.3.3; Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1), §1.1.1, §1.1.2 and §1.2.1 (HTT, Prop. 4.2.1.5, fat joins and slices); §4.1.1 (HTT, Def. 5.3.1.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Mathlib instance `Quasicategory ((ihom K).obj C)`; ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1).

### 4.4 Cofinal maps from filtered posets

**4.4.1.** Prove that every κ-filtered ∞-category receives a cofinal map from the nerve of a κ-filtered partially ordered set (HTT, Prop. 5.3.1.18, p. 404). `Suggested.lean` declaration: `exists_isCofinal_nerve_of_isCardinalFiltered`. A route: replace C by `C × N(X)` for a contractible groupoid on a set X of size at least κ; the projection is a trivial fibration and hence cofinal. Take A to be the poset of κ-small simplicial subsets with a final vertex; it is κ-filtered, and its union is `C × N(X)`, because C is κ-filtered. Build a retraction of the decomposition cylinder `K_F` and get cofinality from the decomposition results for colimits. Cofinal maps compose.
*Needs:* §4.1.1 (HTT, Def. 5.3.1.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12; Notation 1.2.8.4); Part LimitsAndKanExtensions §6.1.1 (HTT, Notation 4.2.3.1), §6.2.2 (HTT, Prop. 4.2.3.4), §6.3.2 (HTT, Prop. 4.2.3.8), §2.3.1 (HTT, Prop. 4.1.1.3) and §2.6.1 (HTT, Cor. 4.1.1.9 for targets that are ∞-categories: categorical equivalences, in particular trivial fibrations, are cofinal); Mathlib `SSet.KanComplex`.

**4.4.2.** Prove the characterizations of κ-filtered simplicial sets (HTT, Prop. 5.3.1.19, p. 405): for a simplicial set S the following are equivalent: (1) S is κ-filtered; (2) there is a categorical equivalence from S to the colimit, in simplicial sets, of a κ-filtered diagram of κ-filtered simplicial sets indexed by a κ-filtered category; (3) there is a categorical equivalence from S to an ∞-category that is a κ-filtered union of simplicial subsets, each an ∞-category with a final object. A route, with a fibrant replacement T of simplicial sets that preserves inclusions and filtered colimits and comes with a natural categorical equivalence `X ⟶ T(X)` onto an ∞-category, such as the coherent nerve of a Kan replacement of `C[X]` (HTT, Thm. 2.2.0.1). For (1) ⇒ (3), replace S by `T(S)`; the proof of Prop. 5.3.1.18 writes `S × N(X)` as the κ-filtered union of its κ-small simplicial subsets with a final vertex, and T of that union satisfies (3). (3) ⇒ (2) holds by Remark 5.3.1.17. For (2) ⇒ (1), apply T to the diagram: a filtered colimit of ∞-categories is an ∞-category, and a κ-small diagram in the colimit factors through a stage, where it extends over the cone.
*Needs:* §4.2.1 (HTT, Remark 5.3.1.11); Conventions (HTT, Remark 5.3.1.13); §4.4.1; §4.1.1 (HTT, Def. 5.3.1.7; Remark 5.3.1.17, final objects); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12; Notation 1.2.8.4) and §2.1.6 (HTT, Def. 1.1.5.14); Part InfinityCategoryFoundations §8.1.2 (HTT, Thm. 2.2.0.1); ModelCategoryTheory, Part KanQuillen §2.2.1 (`Ex^∞`, for the Kan replacement); Mathlib `SimplicialNerve`, `SimplicialThickening`.

### 4.5 κ-right exact functors

**4.5.1.** Define κ-right exact functors (HTT, Def. 5.3.2.1, p. 407): a functor `F : A ⟶ B` of ∞-categories is κ-right
exact when, for every right fibration `B' ⟶ B` with B' κ-filtered, the fiber product `A ×_B B'` is κ-filtered. Right
exact means ω-right exact. `Suggested.lean` declaration: `IsCardinalRightExact`. The `Suggested.lean` declarations are
`IsCardinalRightExact.comp` and `IsCardinalRightExact.of_iso`.

- κ-right exact functors compose, and the identity, an equivalence, is κ-right exact (HTT, Prop. 5.3.2.4 (1), (2), p. 407).
- κ-right exactness is invariant under equivalence of functors (HTT, Prop. 5.3.2.4 (3), p. 408), by base change of categorical equivalences along right fibrations (HTT 3.3.1.3).
- κ-right exactness can be tested on the overcategories `B_{/b}` alone (§4.5.2).

**Checks.**

- The functor `Δ[0] ⟶ C` picking an object c is κ-right exact exactly when c is initial: by §4.5.2 it suffices that each `Δ[0] ×_C C_{/d}`, a model of `Map(c, d)`, be κ-filtered, and a Kan complex is filtered exactly when it is contractible. For C a Kan complex with one vertex modeling the circle, `Map(c, c)` is the discrete space ℤ, so c is not right exact. A definition asking only that the fiber products be nonempty would accept it.
- The functor from the empty ∞-category to Δ[0] is not right exact, since `∅ ×_{Δ[0]} Δ[0] = ∅` and filtered ∞-categories are nonempty (the empty diagram must extend to a cone). A definition that allowed the empty ∞-category as filtered would accept it.
- `∂Δ[1] ⟶ Δ[0]` preserves every finite colimit existing in `∂Δ[1]` (those of nonempty diagrams at a single object), yet is not right exact, since `∂Δ[1] ×_{Δ[0]} Δ[0]_{/∗}` is equivalent to `∂Δ[1]`, which is not filtered. A definition through the colimits that exist in the source would accept it.

*Needs:* §4.1.1 (HTT, Def. 5.3.1.7); Tau Ceti `SSet.IsCardinalFiltered`, `SSet.RightFibration`; Part CartesianFibrations §7.2.1 (HTT, Prop. 3.3.1.3), for the invariance bullet.

**4.5.2.** Prove the test on overcategories (HTT, Prop. 5.3.2.5, p. 408): a functor `F : A ⟶ B` of ∞-categories is
κ-right exact exactly when `A ×_B B_{/b}` is κ-filtered for every object b of B. A route, with a right-fibrant
replacement on `SSet/B` that commutes with filtered colimits (HTT, Prop. 5.3.2.5, step of the proof, p. 408): a
functor `T : SSet/B ⥤ SSet/B` with a natural contravariant equivalence `X ⟶ T(X)` onto a right fibration. Take `T = Un
∘ Ex^∞ ∘ St` in place of Lurie's `Sing |−|`: straightening is a left adjoint, `Ex^∞` commutes with filtered colimits
and gives projectively fibrant replacements, and unstraightening commutes with filtered colimits because it is
computed by maps out of straightenings of simplices, which are finite. Call X good when `T(X) ×_B A` is κ-filtered.
Good objects are invariant under contravariant equivalence and closed under κ-filtered colimits. Overcategories are
good by hypothesis, hence so are ∞-categories with a final object, since right anodyne maps are contravariant
equivalences, and then all κ-filtered ∞-categories (Prop. 5.3.1.19). The `Suggested.lean` declaration is
`isCardinalRightExact_iff_slice`. *Needs:* §4.5.1; §4.2.1 (HTT, Remark 5.3.1.11); §4.1.1 (HTT, Remark 5.3.1.17);
§4.4.2 (HTT, Prop. 5.3.1.19); Part CartesianFibrations §7.2.1 (HTT, Prop. 3.3.1.3); Part InfinityCategoryFoundations
§9.5.2 (HTT, Thm. 2.4.6.1); Part LimitsAndKanExtensions §2.2.1 (HTT, Prop. 4.1.2.1); Part InfinityCategoryFoundations
§7.5.2 (HTT, Thm. 2.2.1.2) and §7.6.1 (HTT, Cors. 2.2.3.12, 2.2.3.13); ModelCategoryTheory, Part KanQuillen §2.2.1
(`Ex^∞`), §3.1.1 (weak homotopy equivalences) and §3.3.1 (filtered colimits).

**4.5.3.** Prove that κ-right exactness is preservation of κ-small colimits (HTT, Prop. 5.3.2.9, p. 410): a κ-right exact functor preserves every κ-small colimit that exists in its source; conversely, if A has κ-small colimits and f preserves them, f is κ-right exact. `Suggested.lean` declarations: `isColimitDiagram_comp_of_isCardinalRightExact` for the first part and `isCardinalRightExact_iff` for the equivalence, for A with κ-small colimits, with colimit cocones as the colimit diagrams `IsColimitDiagram` of Part InfinityCategoryFoundations §1.2. A route for the forward direction: a colimit cocone is an initial object of the undercategory, so it suffices that `A_{p/} ⟶ B_{fp/}` preserves initial objects. Three inputs give this.

- **Fibers over initial objects** (HTT, Lemma 5.3.2.6, p. 410). For a Cartesian fibration with filtered total space over an ∞-category with an initial object, the fiber over it is weakly contractible, and a contractible Kan complex when the fibration is a right fibration: the opposite of the fiber inclusion is cofinal by smoothness, hence a weak homotopy equivalence, and filtered ∞-categories are weakly contractible.
- **Initial objects** (HTT, Lemma 5.3.2.7, p. 410). Right exact functors preserve initial objects: for an object b, `A ×_B B_{/b}` is filtered (§4.5.2), and its fiber over an initial a models `Map_B(f a, b)`.
- **Undercategories** (HTT, Lemma 5.3.2.8, p. 410). κ-right exactness passes to `A_{p/} ⟶ B_{fp/}` for κ-small p, by testing overcategories of `B_{fp/}`, identified through joins with undercategories in `A ×_B B_{/b}`.

For the converse, show that `A ×_B B_{/b}` is κ-filtered (§4.5.2): a κ-small diagram in it gives a diagram in A whose colimit exists and maps to a cone point over b.
*Needs:* §4.5.1 and §4.5.2; §4.3.2 (HTT, Lemma 5.3.1.20); Part LimitsAndKanExtensions §5.2.2 (HTT, Prop. 4.1.2.15), §5.1.2 (HTT, Def. 4.1.2.9) and §2.3.1 (HTT, Prop. 4.1.1.3); Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2) and §4.3.1 (HTT, Cor. 2.1.2.2); §4.1.1 (HTT, Def. 5.3.1.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2 (HTT, §1.2.12; Def. 1.2.13.4, colimit diagrams); ModelCategoryTheory, Part KanQuillen §3.2.1 (weak homotopy equivalences); Tau Ceti `SSet.coslice.IsColimit`, `SSet.RightFibration`.

**4.5.4.** Dually, a functor G is called κ-left exact when `Gᵒᵖ` is κ-right exact; when the source has κ-small limits
this is preservation of κ-small limits, and for κ = ω and a source with finite limits it is left exactness in the
sense of Part InfinityCategoryFoundations §1.2 (HTT, Remark 5.3.2.10, p. 411). This follows from §4.5.3 applied to
`Gᵒᵖ`. The `Suggested.lean` declaration is `isCardinalLeftExact_iff`. *Needs:* §4.5.3; Part
InfinityCategoryFoundations §1.2.4 (HTT, Remark 5.3.2.10, left exact functors); Tau Ceti `SSet.slice.IsLimit`; Mathlib
`SSet.opFunctor`.

**Checks.**

- The functor `Δ[0] ⟶ C` picking c is κ-left exact exactly when c is final. For C a Kan complex with one vertex modeling the circle, `Map(c, c)` is ℤ, so c is not left exact. A definition asking only that the fiber products be nonempty would accept it.
- The functor from the empty ∞-category to Δ[0] is not left exact, since the empty ∞-category is not filtered. A definition allowing the empty ∞-category as filtered would accept it.
- `∂Δ[1] ⟶ Δ[0]` preserves every finite limit existing in `∂Δ[1]`, yet is not left exact, since `∂Δ[1]ᵒᵖ = ∂Δ[1]` is not filtered. A definition through the limits that exist in the source would accept it.

### Examples

- The nerve of a filtered poset, such as `N(ℕ)`, is filtered, and every filtered ∞-category receives a
  cofinal map from one (§4.4).
- An ∞-category with a final object is κ-filtered for every κ (§4.1); a nonempty Kan complex is filtered
  exactly when it is contractible, by Lemma 5.3.1.20 and the cone condition.
- The functor `S ⟶ S`, `X ↦ X × X`, is not right exact: it sends the coproduct `∗ ⊔ ∗` to a four-point space
  instead of a two-point space (§4.5). It preserves the initial object and filtered colimits.

### Dependencies

Layer 4 uses Layer 2 (the weak contractibility of `Idem` and the colimits of idempotents), Part
LimitsAndKanExtensions (fat joins and slices, right anodyne maps as contravariant equivalences, cofinality of
categorical equivalences, smooth maps and Theorem A, cofinal maps from nerves of posets and the decomposition of
diagrams), Part CartesianFibrations (invariance of slices, categorical fibrations over an ∞-category, base
change of categorical equivalences along right fibrations), the definitions of cones and left exact functors
(Part InfinityCategoryFoundations) and of cofinality (Part LimitsAndKanExtensions), Part InfinityCategoryFoundations (joins, slices, initial and final objects,
straightening of right fibrations, the mapping-space comparison theorem), ModelCategoryTheory Parts
ModelCategories and KanQuillen (homotopy extension, `Ex^∞`, homotopy groups and Whitehead's theorem, filtered
colimits) and Tau Ceti `SSet.IsCardinalFiltered`, `SSet.IsWeaklyContractible`.

## Layer 5: Sifted colimits and free resolutions of presheaves

### 5.1 Sifted simplicial sets

**5.1.1.** Define a simplicial set `K` to be sifted when it is nonempty and the diagonal `K ⟶ K × K` is cofinal (HTT,
Def. 5.5.8.1, p. 524). A sifted colimit is a colimit indexed by a sifted simplicial set. `Suggested.lean` declaration:
`IsSifted`. The `Suggested.lean` declaration is `isRelativeColimit_of_two_variables`.

- Siftedness is invariant under isomorphism of simplicial sets.
- An ∞-category with a final object `z` is sifted: the inclusions of `z` and of `(z, z)` are cofinal (Part
  InfinityCategoryFoundations §5.6 and Part LimitsAndKanExtensions §2.3), and the diagonal carries one to the other, so it
  is cofinal by two-out-of-three for cofinal maps (Part LimitsAndKanExtensions §2.3, HTT, Prop. 4.1.1.3).

**Checks.**
- `Δ[0]` is sifted and `∅` is not. A definition dropping nonemptiness would accept `∅`, whose diagonal is an
  isomorphism.
- `∂Δ[1] = Δ[0] ⊔ Δ[0]` is not sifted: cofinal maps are weak homotopy equivalences (Part
  LimitsAndKanExtensions §2.3), and the diagonal `∂Δ[1] ⟶ ∂Δ[1] × ∂Δ[1]` is not one (two components against
  four).
- `N(Δ)^op` is sifted (this Check uses §5.3, HTT, Lemma 5.5.8.4, below) but not filtered: the pair
  `d⁰, d¹ : [1] ⟶ [0]` of `Δ^op` has no coequalizing cone, since the composites `[m] ⟶ [0] ⟶ [1]` with `d⁰` and
  `d¹` are constant at 1 and at 0 respectively, so no map `[m] ⟶ [0]` coequalizes them. So sifted is weaker than filtered; the nerve of
  `[1]` is both.

*Needs:* Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1, cofinal maps) and §2.3.1 (HTT, Prop. 4.1.1.3, for
the second API bullet and the second Check); Part InfinityCategoryFoundations §5.6.1 (the inclusion of a final object is right
anodyne).

### 5.2 Colimits in two variables

**5.2.1.** Prove that colimits in two variables can be computed one variable at a time (HTT, Lemma 5.5.2.3, p. 481).
Let `X` and `Y` be simplicial sets, `q : C ⟶ D` a categorical fibration of ∞-categories and
`p : X^▷ × Y^▷ ⟶ C`. Suppose that for every vertex `x` of `X^▷` the restriction `p_x : Y^▷ ⟶ C` is a
`q`-colimit diagram, and that for every vertex `y` of `Y` the restriction `p_y : X^▷ ⟶ C` is one. Write `∞₀`
for the cone point of `X^▷` and `∞` for that of `Y^▷`. Then:

1. the restriction of `p` to `X^▷ × {∞}` is a `q`-colimit diagram;
2. the restriction of `p` to `(X × Y)^▷ ⊆ X^▷ × Y^▷`, the cone on `X × Y` with cone point `(∞₀, ∞)`, is a
   `q`-colimit diagram (HTT, Lemma 5.5.2.3, proof).

*Proof route.* Lurie's. First reduce to the case where `X` and `Y` are ∞-categories. Choose inner anodyne
inclusions `X ⊆ X'` and `Y ⊆ Y'` into ∞-categories. They add no vertices, the inclusions `X^▷ ⊆ X'^▷` and
`Y^▷ ⊆ Y'^▷` are inner anodyne pushout-joins, and so is their product. Since `C` is an ∞-category, `p` extends
along it. Inner anodyne maps are cofinal, so by cofinal reindexing the extension satisfies the hypotheses, and
the conclusions, exactly when `p` does. Now `X × Y` is a full subcategory of the ∞-category `X^▷ × Y^▷`, and the
hypotheses say that `p|X^▷ × Y` is a `q`-left Kan extension of `p|X × Y` and that `p` is one of `p|X^▷ × Y`, so
by transitivity `p` is one of `p|X × Y` (HTT, Props. 4.3.2.8, 4.3.2.9). The inclusion `X × {∞} ⊆ X × Y^▷` is
right anodyne, as the product of `X` with the right anodyne `{∞} ⊆ Y^▷` (`∞` is final in `Y^▷`), hence
cofinal. So (1) amounts to `p|(X × Y^▷)^▷` being a `q`-colimit diagram. Since `p|X × Y^▷` is a `q`-left Kan
extension of `p|X × Y`, this is equivalent to (2), and by the same argument for `p|X^▷ × Y` both are equivalent
to `p|(X^▷ × Y)^▷` being a `q`-colimit diagram (HTT, Lemma 4.3.2.7). The inclusion `{∞₀} × Y ⊆ X^▷ × Y` is
cofinal in the same way, which reduces that to hypothesis (1) at the vertex `∞₀`.

*Needs:*
- Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5, categorical fibrations), §4.1.1 (HTT, Lemma 2.1.2.3, pushout-joins)
  and §5.6.1 (the inclusion of a final object is right anodyne);
- Tau Ceti `SSet.rightAnodyneExtensions_pushoutObjObjι'` (HTT, Cor. 2.1.2.7, dual: products of right anodyne
  maps with simplicial sets); Mathlib `SSet.innerAnodyneExtensions`;
- Part LimitsAndKanExtensions §7.5.2 and §7.5.3 (HTT, Props. 4.3.2.8, 4.3.2.9), §7.4.1 (HTT, Lemma 4.3.2.7), §7.2.3 (HTT,
  Prop. 4.3.1.7, cofinal reindexing) and §2.3.1 (HTT, Prop. 4.1.1.3, right anodyne maps are cofinal);
- Part LimitsAndKanExtensions §7.1.1, §7.1.2 (HTT, Defs. 4.3.1.1, 4.3.2.2).

### 5.3 Sifted colimits commute with finite products

Natural transformations of functors give homotopies of nerves, so a functor with a left or a right adjoint
induces a weak homotopy equivalence of nerves, and a category with a zigzag of natural transformations from the
identity to a constant functor has weakly contractible nerve: ModelCategoryTheory, Part KanQuillen §3.6, first
statement, (2) and (3) (for (2), Kerodon, Prop. 3.1.7.9). This section cites them there.

**5.3.1.** Prove that `N(Δ)^op` is sifted in the sense of §5.1 (HTT, Lemma 5.5.8.4, p. 524). The `Suggested.lean`
declaration is `isSifted_nerve_simplexCategory_op`.

*Proof route.* Lurie's. `N(Δ)^op` is nonempty. By Theorem A, cofinality of the diagonal amounts to the weak
contractibility, for all `[m]` and `[n]`, of the nerve of the category of simplices of `Δ[m] × Δ[n]`, the
category of pairs of maps `[k] ⟶ [m]`, `[k] ⟶ [n]`. Its full subcategory on the injective maps
`[k] ⟶ [m] × [n]` is reflective (take the image), so by Part KanQuillen §3.6 (2) the two nerves are weakly
homotopy equivalent. That full subcategory is the poset `P` of nonempty chains of `[m] × [n]`, ordered by
inclusion. Its nerve is weakly contractible by Part KanQuillen §3.6 (3): `σ ↦ σ ∪ {(m, n)}` is a functor
`H : P ⟶ P` with natural transformations `id ⇒ H ⇐ const_{{(m, n)}}`.

*Needs:*
- ModelCategoryTheory, Part KanQuillen §3.6.1 (first statement, (2) and (3); for (2), Kerodon, Prop. 3.1.7.9);
- Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1);
- §5.1.1 (HTT, Def. 5.5.8.1); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (weak homotopy equivalences);
- Mathlib `CategoryTheory.nerve`; Tau Ceti `SSet.IsWeaklyContractible`.

**5.3.2.** Prove that every filtered ∞-category is sifted (HTT, Example 5.5.8.3, p. 524). The `Suggested.lean`
declaration is `IsFiltered.isSifted`.

*Proof route.* A filtered ∞-category is nonempty, and its diagonal `C ⟶ C × C = Fun(∂Δ[1], C)` is cofinal by
the cofinality criterion for κ-filtered ∞-categories (HTT, Prop. 5.3.1.22) with `K = ∂Δ[1]`.

*Needs:*
- §4.3.4 (HTT, Prop. 5.3.1.22);
- §4.1.1 (HTT, Def. 5.3.1.7) and §5.1.1 (HTT, Def. 5.5.8.1).

**5.3.3.** Prove that functors of two variables preserving sifted colimits in each variable preserve them jointly
(HTT, Prop. 5.5.8.6, p. 525): for a sifted simplicial set `K` and ∞-categories `C`, `D`, `E` with `K`-indexed
colimits, a functor `F : C × D ⟶ E` that preserves `K`-indexed colimits separately in each variable preserves
`K`-indexed colimits. The `Suggested.lean` declaration is `isColimitDiagram_comp_of_isSifted`.

*Proof route.* Lurie's. Colimits in `C × D` are computed componentwise: `(C × D)_{(c,d)/} ≅ C_{c/} × D_{d/}`,
since a map `K ⋆ Δ[n] ⟶ C × D` is a pair of maps, and an object of a product is initial exactly when both
components are; so `C × D` has `K`-indexed colimits, and a colimit cocone of `(c, d)` is a pair of colimit
cocones `c̄`, `d̄`. A diagram `(c, d) : K ⟶ C × D` is the restriction along the diagonal of
`c × d : K × K ⟶ C × D`, and the diagonal is cofinal, so colimits over `K` and over `K × K` of the composites
with `F` agree. Extend `c` and `d` to colimit cocones and apply §5.2, with `q : E ⟶ Δ[0]`, to the composite
`K^▷ × K^▷ ⟶ C × D ⟶ E`: the hypotheses on `F` in each variable are the hypotheses of §5.2, so by its
assertion (2) `F(colim c, colim d)` is the colimit over `K × K` of `F ∘ (c × d)`.

*Needs:*
- §5.2.1 (HTT, Lemma 5.5.2.3, assertion (2));
- Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8);
- Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5, colimits as initial objects of coslices); Tau Ceti
  `SSet.coslice`;
- §5.1.1 (HTT, Def. 5.5.8.1); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, colimit diagrams); Part LimitsAndKanExtensions §7.1.1 (HTT, Def.
  4.3.1.1); Tau Ceti `SSet.coslice.IsColimit`.

**5.3.4.** Prove that every sifted simplicial set is weakly contractible (HTT, Prop. 5.5.8.7, p. 525). The
`Suggested.lean` declaration is `IsSifted.isWeaklyContractible`.

*Proof route.* Cofinal maps are weak homotopy equivalences (HTT, Prop. 4.1.1.3), so the diagonal
`K ⟶ K × K` is one. Apply `Ex^∞`, which preserves finite products and gives Kan complexes: the diagonal of the
Kan complex `Ex^∞ K` is a weak homotopy equivalence, so at every base point and for every n ≥ 0 the diagonal
`π_n ⟶ π_n × π_n` is a bijection. A set, or group, whose diagonal is a bijection has at most one element; `K`
is nonempty, so every homotopy set of `Ex^∞ K` is a point, and Whitehead's theorem makes `Ex^∞ K ⟶ Δ[0]`, hence
`K ⟶ Δ[0]`, a weak homotopy equivalence.

*Needs:*
- Part LimitsAndKanExtensions §2.3.1 (HTT, Prop. 4.1.1.3);
- §5.1.1 (HTT, Def. 5.5.8.1);
- ModelCategoryTheory, Part KanQuillen §2.2.1 (`Ex^∞` and its preservation of finite limits), §1.1 (homotopy
  groups, and their compatibility with products) and §1.3.3 (Whitehead's theorem);
- Tau Ceti `SSet.IsWeaklyContractible`.

**5.3.5.** Prove that sifted colimits commute with finite products (HTT, Lemma 5.5.8.11, p. 526): for a sifted
simplicial set `K` and an ∞-category `X` with finite products and `K`-indexed colimits, such that the product
functor `X × X ⟶ X` preserves `K`-indexed colimits separately in each variable, the colimit functor
`Fun(K, X) ⟶ X` preserves finite products.

*Proof route.* Lurie's. Binary products: the product `Fun(K, X) × Fun(K, X) ⟶ Fun(K, X)` is computed
pointwise, so the claim is HTT Prop. 5.5.8.6 for the product functor of `X`. The final object: `K` is weakly
contractible, and the colimit of a constant diagram indexed by a weakly contractible simplicial set is its
value (HTT, Cor. 4.4.4.9).

*Needs:*
- §5.3.3 and §5.3.4 (HTT, Props. 5.5.8.6, 5.5.8.7);
- Part LimitsAndKanExtensions §3.5.1 (HTT, Cor. 4.4.4.9) and §8.2.2 (HTT, Prop. 5.1.2.2, limits in functor
  ∞-categories computed pointwise);
- §5.1.1 (HTT, Def. 5.5.8.1); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.1, final objects; Def. 1.2.13.4).

**5.3.6.** Prove that the hypotheses hold for `X = S` (HTT, Remark 5.5.8.12, p. 526): for every Kan complex `Z`, the
functor `Z × − : S ⟶ S` preserves small colimits; so sifted colimits in `S` commute with finite products.

*Proof route.* `Z × −` and `Fun(Z, −)` form a simplicial Quillen adjunction for the Kan–Quillen model
structure, which is a cartesian monoidal simplicial model category. So `Z × −` underlies a left adjoint of
∞-categories on `S` (HTT, Prop. 5.2.4.6), which preserves colimits (HTT, Prop. 5.2.3.5). The route uses no
universality of colimits in `S`.

*Needs:*
- Part AdjunctionsAndLocalizations §1.7.1 (HTT, Prop. 5.2.4.6) and §1.5.1 (HTT, Prop. 5.2.3.5);
- ModelCategoryTheory, Part SimplicialCategories §1.2.2 (HTT, Ex. A.3.1.4) and Part KanQuillen §3.2.1 (the
  Kan–Quillen model structure);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1), for colimits in `S` as homotopy colimits, applied to the large `Kan` object by object through small full subcategories, as in its §3.3.1 (*Size*);
- Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1).

### 5.4 Categorical equivalences for joins and for linear orders

**5.4.1.** Prove that for simplicial sets A, B and C with B weakly contractible, the inclusion
`(A ⋆ B) ⊔_B (B ⋆ C) ⊆ A ⋆ B ⋆ C` is a categorical equivalence (HTT, Lemma 5.4.5.10, p. 457).

*Proof route.* Lurie's: both
sides commute with filtered colimits and homotopy pushouts in each variable, which reduces A and C to
simplices. Call B good when the inclusion is then a categorical equivalence. Simplices are good,
because the inclusions of spines into simplices are inner anodyne and the corresponding square of
spines is a homotopy pushout; good simplicial sets are closed under
pushouts along monomorphisms, filtered colimits and retracts; horns are good, by induction on n from simplices
and pushouts; hence good simplicial sets are closed under anodyne extensions; and a
weakly contractible B is good, since the inclusion of one of its vertices is anodyne.

*Needs:*
- Tau Ceti `SSet.join` (HTT, Def. 1.2.8.1, p. 58);
- Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, p. 43);
- Part InfinityCategoryFoundations §7.3.2 (HTT, Prop. 2.2.2.7, p. 94; Example 2.0.0.1, p. 71); Part InfinityCategoryFoundations §4.1.1
  (HTT, Lemma 2.1.2.3, p. 80);
- Part LimitsAndKanExtensions §1.1.2 (HTT, Cor. 4.2.1.3, p. 258);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833, homotopy pushout squares);
- ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7: a monomorphism that is a weak homotopy
  equivalence is anodyne);
- Tau Ceti `SSet.IsWeaklyContractible`.

**5.4.2.** Prove that for a linearly ordered set `A = A₀ ∪ {∞}` with largest element ∞ and a cofinal subset
`B ⊆ A₀`, the inclusion `N(A₀) ⊔_{N(B)} N(B ∪ {∞}) ⊆ N(A)` is a categorical equivalence (HTT,
Lemma 5.4.6.2, p. 462).

*Proof route.* If `A₀` is empty, both sides are `N({∞})`. Otherwise the inclusion is the filtered colimit,
over β ∈ B, of the same inclusions with `A₀` and B cut down to their elements at most β, and categorical equivalences are
stable under filtered colimits; so assume that β ∈ B is the largest element of `A₀`. Gluing the edge
`N({β, ∞})` at the largest vertex β gives inner anodyne inclusions `N(B) ⊔_{β} N({β, ∞}) ⊆ N(B ∪ {∞})`
and `N(A₀) ⊔_{β} N({β, ∞}) ⊆ N(A)`, because `{β}` is right anodyne in each nerve. The second is the
inclusion of the statement precomposed with a pushout of the first, and two-out-of-three concludes.

*Needs:*
- Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3, p. 80), §9.1.1 (inner anodyne maps) and §9.5.1 (HTT, Thm. 2.2.5.1,
  p. 107, categorical equivalences are stable under filtered colimits and satisfy two-out-of-three);
- Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, p. 43).

### 5.5 The Reedy extension step and free resolutions of presheaves

**5.5.1.** Prove that iterated joins with weakly contractible pieces are categorically equivalent to their "missing a
vertex" part (HTT, Lemma A.2.9.18, p. 857). Let `A₁, …, A_n` (n ≥ 1) be weakly contractible simplicial sets,
`L` the iterated join `{J₀} ⋆ A₁ ⋆ {J₁} ⋆ ⋯ ⋆ A_n ⋆ {J_n}`, and `K ⊆ L` the simplicial subset of simplices that
miss some vertex `J_i`. Then `K ⊆ L` is a categorical equivalence.

*Proof route.* Lurie's. The case n = 1 is §5.4.1. For n > 1, let `X` be the inner join
`A₁ ⋆ {J₁} ⋆ ⋯ ⋆ {J_{n−1}} ⋆ A_n` and `X' ⊆ X` the union of the simplicial subsets missing some inner vertex
`J_i`. Then `X'` is a homotopy colimit, over the nonempty subsets of `{1, …, n−1}` (a poset with a largest
element), of joins of weakly contractible simplicial sets; a join `X ⋆ Y` is categorically equivalent to the fat
join, a homotopy pushout of `X ⟵ X × Y ⟶ Y` (HTT, Prop. 4.2.1.2), so these joins, and `X'`, are weakly
contractible. That `K ⊆ L` is a categorical equivalence amounts to a square comparing `{J₀} ⋆ X' ⋆ {J_n}`
with `{J₀} ⋆ X ⋆ {J_n}` being a homotopy pushout in the Joyal model structure (HTT, Prop. A.2.4.4), and its
vertical maps are categorical equivalences by §5.4.1.

*Needs:*
- §5.4.1 (HTT, Lemma 5.4.5.10);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1);
- Part LimitsAndKanExtensions §1.1.2 (HTT, Prop. 4.2.1.2);
- ModelCategoryTheory, Part ModelCategories §3.5.2 (HTT, Prop. A.2.4.4);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (weak homotopy equivalences); Tau Ceti `SSet.join`,
  `SSet.IsWeaklyContractible`.

**5.5.2.** Prove the ∞-categorical Reedy extension step (HTT, Prop. A.2.9.14, p. 855, proof pp. 857–859; Rem. A.2.9.16,
p. 856). Let `J` be a Reedy category with a good filtration and `J_β` a stage obtained from `J_{<β}` by
adjoining one object `J`. Then:

1. the square with corners `N(J_{<β})_{/J} ⋆ N(J_{<β})_{J/}`, `N(J_{<β})`, `N(J_{<β})_{/J} ⋆ {J} ⋆ N(J_{<β})_{J/}`
   and `N(J_β)` is a homotopy pushout in the Joyal model structure, and the inclusion of the strict pushout
   of the other three corners into `N(J_β)` is a categorical equivalence (HTT, proof of Prop. A.2.9.14);
2. for an ∞-category `C` with small limits and colimits and a diagram `X : N(J_{<β}) ⟶ C`, the ∞-category of
   extensions of `X` to `N(J_β)` is equivalent to the ∞-category of factorizations of the map
   `α : L_J(X) ⟶ M_J(X)` from the ∞-categorical latching object `L_J(X)`, the colimit of `X` over
   `N(J_{<β})_{/J}`, to the matching object `M_J(X)`, the limit over `N(J_{<β})_{J/}`. The ∞-category of
   factorizations of `α` is `(C_{L_J(X)/})_{/α}`.

*Proof route.* Lurie's. For (1), filter the nerve of the stage by the composable chains of non-identity
endomorphisms of `J`, shorter chains first (the chain filtration of ModelCategoryTheory, Part ModelCategories
§7.6). Adjoining one chain `f₁, …, f_n` is a homotopy pushout along
`N(J_{<β})_{/J} ⋆ K ⋆ N(J_{<β})_{J/} ⊆ N(J_{<β})_{/J} ⋆ L ⋆ N(J_{<β})_{J/}`, with `A_i` the nerve of the
category of factorizations of `f_i` through objects of `J_{<β}`, which is weakly contractible (HTT, Lemma
A.2.9.17). Joins preserve categorical equivalences (HTT, Cor. 4.2.1.3), and `K ⊆ L` is one by §5.5.1. The filtration
starts at the strict pushout of the three corners (no chains), and each step is a pushout along a monic categorical equivalence, so the inclusion of the strict pushout into `N(J_β)` is a
categorical equivalence. For (2), since the Joyal model structure is Cartesian closed and that inclusion is a
monic categorical equivalence, restriction from `Fun(N(J_β), C)` to the fiber product of `Fun(N(J_{<β}), C)` and `Fun(N(J_{<β})_{/J} ⋆ {J} ⋆ N(J_{<β})_{J/}, C)`
over `Fun(N(J_{<β})_{/J} ⋆ N(J_{<β})_{J/}, C)` is a trivial fibration. So an extension of `X` is the same as a
filling of the join with `{J}` inserted. By the join–slice adjunction such a filling is an object `c` of `C`
with a cocone from `X` on `N(J_{<β})_{/J}` and a cone to `X` on `N(J_{<β})_{J/}`, compatible on the join.
The universal properties of the colimit `L_J(X)` and the limit `M_J(X)` turn these into a factorization
`L_J(X) ⟶ c ⟶ M_J(X)` of the canonical map, and morphisms of extensions into morphisms of factorizations:
for the colimit cocone `p̄` of `X` on `N(J_{<β})_{/J}` the restriction `C_{p̄/} ⟶ C_{p/}` is a trivial
fibration, and dually for the limit cone, so the double slice of `C` under the cocone and over the cone is
equivalent to `(C_{L_J(X)/})_{/α}`.

*Needs:*
- §5.5.1 (HTT, Lemma A.2.9.18);
- Part InfinityCategoryFoundations §9.5.1, §9.5.3 (HTT, Thm. 2.2.5.1, and the Cartesian closedness of the Joyal model structure,
  HTT, Cor. 2.2.5.4), Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2, joins and slices) and §5.5.4 (HTT, Prop. 1.2.12.9, Rem. 1.2.13.5:
  for a colimit cocone `p̄` the restriction `C_{p̄/} ⟶ C_{p/}` is a trivial fibration, and dually);
- Part LimitsAndKanExtensions §1.1.2 (HTT, Cor. 4.2.1.3);
- Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, colimit and limit diagrams) and §2.1.6 (HTT, Def. 1.1.5.14);
- ModelCategoryTheory, Part ModelCategories §7.5.1 (HTT, Notation A.2.9.7, latching and matching objects) and
  §7.6.2 (the chain filtration in the proof of HTT Prop. A.2.9.14);
- ModelCategoryTheory, Part KanQuillen §3.6.2 (HTT, Lemma A.2.9.17);
- Tau Ceti `SSet.join`, `SSet.coslice`, `SSet.slice`.

**5.5.3.** Prove that every presheaf is the geometric realization of a simplicial object of coproducts of
representables (HTT, Lemma 5.5.8.13, p. 527): for a small ∞-category `C` and `X` in `P(C)`, there is a
simplicial object `Y_• : N(Δ)^op ⟶ P(C)` with colimit `X` and each `Y_n` a small coproduct of representables.

*Proof route.* Build `Y_•`, augmented to `X`, skeleton by skeleton along the good filtration of `Δ^op` by
dimension, with §5.5.2, making each map to the matching object objectwise
`π₀`-surjective. At stage n, adjoin a small coproduct `Z_n` of representables with an objectwise
`π₀`-surjective map to the matching object; it exists because every presheaf `F` receives such a map from the
coproduct of the representables `j(c)` over the points of the spaces `F(c)`, by Yoneda's lemma (Lemma 5.1.5.2).
Then `Y_n` is the coproduct of the `Z_k` over the surjections `[n] ⟶ [k]`, a small coproduct of
representables. Lurie concludes with ∞-topos results (HTT, Lemma 6.5.3.11, Rem. 6.5.4.7); the route uses only their case
for Kan complexes (ModelCategoryTheory, Part SimplicialCategories §4.5), not ∞-topoi. Strictify the augmented simplicial object to a Reedy fibrant augmented simplicial object of
simplicial presheaves (HTT, Prop. 4.2.4.4, Prop. A.2.9.19). Colimits in `P(C)` are computed objectwise, and at
each object of `C` the result is a Reedy fibrant augmented simplicial Kan complex with `π₀`-surjective matching
maps, whose realization is the augmentation.

*Needs:*
- §5.5.2 (HTT, Prop. A.2.9.14, Rem. A.2.9.16);
- §1.3.3 (HTT, Lemma 5.1.5.2);
- Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1, applied to the large `A°` of simplicial presheaves object by object through small full subcategories, as in its §3.3 (*Size*)) and §8.2.2, §8.2.3 (HTT, Prop. 5.1.2.2,
  Cor. 5.1.2.4);
- §1.1.1 (HTT, §5.1.3); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1);
- ModelCategoryTheory, Part ModelCategories §7.4, §7.4.1 (the Reedy category `Δ^op` and its filtration by dimension),
  §7.5.1 (HTT, Notation A.2.9.7) and §7.7.1 (HTT, Prop. A.2.9.19);
- ModelCategoryTheory, Part SimplicialCategories §4.5.4 (the realization of a Reedy fibrant augmented
  simplicial Kan complex with `π₀`-surjective matching maps, as used in the proof of HTT Lemma 5.5.8.13).

### Examples

- For an ordinary category `A` with finite coproducts, the diagonal `A ⟶ A × A` is right adjoint to the
  coproduct, hence cofinal, so `N(A)` is sifted. For any ordinary category `A`, siftedness of `N(A)`
  implies siftedness of `A` in the 1-categorical sense of Mathlib's `CategoryTheory.IsSifted`, but not
  conversely (HTT, Warning 5.5.8.2, p. 524).
- `N(Δ)^op` is sifted (§5.3) but not filtered (§5.1). So by §5.3 geometric realizations in `S` commute with finite products, while colimits over the
  parallel pair do not (Conventions).
- The equivalence of §5.4 with `A` and `C` empty is the identity of `B`. For `B = ∂Δ[1]`, which is not weakly
  contractible, and `A = C = Δ[0]`, the right side is the nerve of the poset `a < b₁, b₂ < c`, with one
  morphism from `a` to `c`, while the left side has the two composites through `b₁` and `b₂` as distinct
  morphisms from `a` to `c`; the inclusion is not a categorical equivalence.
- For `C = Δ[0]`, §5.5 resolves a space `X` by a simplicial object of sets, each `Y_n` a coproduct of
  points, whose realization is `X`: a simplicial set weakly equivalent to `X`.

### Dependencies

Layer 5 uses Layer 1 (presheaves and the Yoneda embedding, for §5.5) and Layer 4 (the cofinality criterion
for filtered ∞-categories, for §5.3), Part LimitsAndKanExtensions (fat joins, cofinality and Theorem A,
rectification and homotopy colimits, tensors with simplicial sets, transitivity of Kan extensions, colimits in
functor ∞-categories), Part AdjunctionsAndLocalizations (preservation of colimits by left adjoints and
adjunctions from simplicial Quillen adjunctions), Part InfinityCategoryFoundations (joins, straightening over a point,
categorical fibrations and the Joyal model structure), the definition of categorical
equivalences (Part InfinityCategoryFoundations), ModelCategoryTheory (homotopy pushouts, weak homotopy equivalences, `Ex^∞`, Whitehead's theorem, Reedy
structures and good filtrations, the realization of Reedy fibrant augmented simplicial Kan complexes), Mathlib
nerves and Tau Ceti `SSet.join`, `SSet.coslice`, `SSet.IsWeaklyContractible`, `SSet.IsWeakHomotopyEquivalence`.

## Layer 6: Filtered colimits of spaces, κ-compact objects and `Ind_κ`

### 6.1 κ-compact objects and `Ind_κ`

**6.1.1.** Define, for an ∞-category `C` with small κ-filtered colimits, a functor out of `C` to be κ-continuous when
it preserves small κ-filtered colimits; an object `c` to be κ-compact when its corepresented functor `j_c : C ⟶ Ŝ`
(§1.1) is κ-continuous, and compact when it is ω-compact; and a left fibration over `C` to be κ-compact when it is
classified by a κ-continuous functor `C ⟶ Ŝ` (HTT, Def. 5.3.4.5, p. 414). `C^κ` denotes the full subcategory of
κ-compact objects (HTT, Notation 5.3.4.6, p. 414). The source and target may be large, as `Ŝ` is; the index diagrams
are small. `Suggested.lean` declaration: `IsCardinalContinuous`, for κ-continuity. The `Suggested.lean` declaration is
`isCardinalContinuous_limit_π`.

- κ-compactness is invariant under equivalence of objects, since equivalent objects have equivalent
  corepresented functors.
- Composites of κ-continuous functors are κ-continuous.
- In an ∞-category with small colimits, completely compact objects (§1.6) are κ-compact for every κ.

**Checks.**
- κ-compact implies κ′-compact for κ ≤ κ′ (κ′-filtered diagrams are κ-filtered).
- In the nerve of the poset `ℕ ∪ {∞}`, the object 0 is compact and `∞` is not: the colimit of the diagram
  `n ↦ Map(∞, n)` is empty while `Map(∞, ∞)` is a point.
- Over `C = Δ[0]` every left fibration is κ-compact, whatever the size of the Kan complex: compactness of the
  fibration is not compactness of the fiber as an object of `S`.
- On `ℕ ∪ {∞}`, the monotone map sending every `n` to 0 and `∞` to `∞` is not ω-continuous: it sends the
  colimit `∞` of the chain `ℕ` to `∞`, not to the colimit 0 of the image chain; the identity is ω-continuous.

*Needs:* §1.1.2 (corepresented functors); §1.6.1 (HTT, Def. 5.1.6.2, for the third API bullet); §4.1.1 (κ-filtered
∞-categories); Part InfinityCategoryFoundations §1.2.4 (colimits)
and §7.1.2, §7.1.8 (classifying maps of left fibrations; `Ŝ`).

**6.1.2.** Define, for a small ∞-category C and a regular cardinal κ, `Ind_κ(C) ⊆ P(C)` as the full subcategory of
presheaves that classify right fibrations `C̃ → C` with `C̃` κ-filtered, and `Ind(C) = Ind_ω(C)` (HTT, Def.
5.3.5.1, p. 421).

- `Ind_κ′(C) ⊆ Ind_κ(C)` for κ ≤ κ′, by the first API bullet of §4.1.
- Every representable `j(c)` lies in `Ind_κ(C)`: it classifies `C_{/c} ⟶ C`, and `C_{/c}` has the final
  object `id_c`, so it is κ-filtered by the second API bullet of §4.1.

**Checks.**
- `Ind(∅)` is empty: the only presheaf classifies ∅ → ∅, and ∅ is not filtered.
- `Ind(Δ[0])` is the contractible Kan complexes, equivalent to Δ[0], not all of S.
- `Ind(Δ[0] ⊔ Δ[0])` is equivalent to Δ[0] ⊔ Δ[0], not to `P(Δ[0] ⊔ Δ[0]) = S × S`: for a right fibration
  `C̃ → Δ[0] ⊔ Δ[0]` with `C̃` filtered, `C̃` is weakly contractible (HTT, Lemma 5.3.1.20, p. 406, proved in
  §4.3), hence connected, so it lies over one vertex and only the two representables survive.

*Needs:* Part LimitsAndKanExtensions §8.1.1 (P); Part InfinityCategoryFoundations §7.1.8 (classification of right fibrations); §4.1.1; §1.1.1 (the Yoneda embedding); Tau Ceti `SSet.fullEnhancedSubcategory`, `SSet.slice`.

### 6.2 κ-filtered colimits commute with κ-small limits in spaces

**6.2.1.** Prove that filtered colimits of Kan complexes preserve homotopy pullbacks and κ-small homotopy products (HTT,
Prop. 5.3.3.3, step of the proof, p. 413). Let `A` be a partially ordered set.

- If `A` is filtered, the colimit in simplicial sets of an `A`-indexed diagram of homotopy pullback squares of
  Kan complexes is a homotopy pullback square.
- If `A` is κ-filtered, then for a κ-small family `{X_i}` of `A`-indexed diagrams of Kan complexes, the map
  `colim_A ∏_i X_i ⟶ ∏_i colim_A X_i` is an isomorphism of simplicial sets; so κ-filtered colimits of Kan
  complexes preserve κ-small homotopy products.

*Proof route.* Classical. For the first claim, replace the cospans functorially by Kan fibrations through
path objects. Filtered colimits preserve Kan fibrations and weak homotopy equivalences and commute with
homotopy groups, and the fibers compare through the long exact sequence. For the second, κ-filtered
colimits of sets commute with κ-small products, degree by degree, and products of Kan complexes are
homotopy products.

*Needs:*
- ModelCategoryTheory, Part KanQuillen §3.3.1 (HTT, §A.2.7, combinatorial generation and filtered colimits) and
  §1.1–§1.3 (homotopy groups, the long exact sequence of a Kan fibration, Whitehead's theorem);
- ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1) and §3.5.1 (HTT, §A.2.4, homotopy pullbacks).

**6.2.2.** Prove that `I` is κ-filtered exactly when `colim_I : Fun(I, S) ⟶ S` preserves κ-small limits (HTT, Prop.
5.3.3.3, p. 412), for κ regular and `I` a small ∞-category.

*Proof route.* Lurie's. "Only if": reduce to `I = N(A)` for a κ-filtered poset `A` (Prop. 5.3.1.18, and
restriction along the cofinal map). The diagonal `S ⟶ Fun(N(A), S)` is the right derived functor of the
constant-diagram functor on projective diagrams `A ⥤ SSet`, so `colim_I` is the left derived functor of the
strict colimit, which preserves homotopy pullbacks and κ-small homotopy products by §6.2.1;
κ-small limits are built from these. "If": suppose a κ-small `p : K ⟶ I` has no extension to a cone. The limit
of the corepresentable functors `Map(p(k), −)` is then initial in `Fun(I, S)` (Lemma 5.1.5.2 and pointwise
limits), so its colimit is initial in `S`, since `colim_I` is a left adjoint. But colimits of corepresentable
functors are contractible (HTT, Lemma 5.3.3.2, p. 412), as the total space of the classified left fibration
has an initial object, so this colimit is a limit of contractible spaces, hence final, a contradiction.

*Needs:*
- §6.2.1 (filtered colimits of Kan complexes);
- §4.4.1 (HTT, Prop. 5.3.1.18) and §4.2.1 (HTT, Remark 5.3.1.11);
- Part LimitsAndKanExtensions §8.2.2, §8.2.3 (HTT, Prop. 5.1.2.2, Cor. 5.1.2.3); §1.3.1 (HTT, Prop. 5.1.3.1; Lemma 5.1.5.2);
- Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*)), §3.1.1 (HTT, Prop. 4.2.4.4), §6.5.4 (HTT, Prop. 4.4.2.6),
  §2.5.2 (HTT, Prop. 4.1.1.8) and §3.4.3 (HTT, Prop. 4.4.4.5); Part LimitsAndKanExtensions §8.3.2 (HTT, Cor. 3.3.4.6);
- §1.1.1 (HTT, §5.1.3) and §4.1.1 (HTT, Def. 5.3.1.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.2 (HTT,
  Def. 1.2.12.1; Notation 1.2.7.2);
- Part InfinityCategoryFoundations §5.5.2 (HTT, Prop. 1.2.12.4);
- ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, the projective structure) and §4.1.1 (HTT,
  §A.2.5, Quillen adjunctions);
- Tau Ceti `SSet.slice.IsLimit`, `SSet.LeftFibration`.

### 6.3 Closure properties of κ-compact objects

**6.3.1.** Prove the left-fibration description of κ-compactness (HTT, Lemma 5.3.4.8, p. 414), for κ regular and the
notions of §6.1.

1. For `C` with small κ-filtered colimits, an object `X` is κ-compact exactly when the left fibration
   `C_{X/} ⟶ C` is κ-compact.
2. For a κ-continuous functor `f : C ⟶ D` between ∞-categories with small κ-filtered colimits and a
   κ-compact left fibration `D̃ ⟶ D`, the pullback `C ×_D D̃ ⟶ C` is κ-compact.
3. For `C` with small κ-filtered colimits, the κ-compact left fibrations over `C` are closed under κ-small
   homotopy limits in the covariant model structure: homotopy pullbacks, κ-small products and, for κ
   uncountable, homotopy limits of towers.

*Proof route.* Lurie's. (1) holds because `C_{X/} ⟶ C` is classified by the functor corepresented by `X`.
(2) holds because the pullback is classified by the composite. For (3), reduce to colimits indexed by
κ-filtered posets (Prop. 5.3.1.18) and, through straightening, to the statement that κ-filtered colimits
of Kan complexes commute with homotopy pullbacks and κ-small homotopy products (§6.2), which generate κ-small
homotopy limits (Prop. 4.4.2.6).

*Needs:*
- §6.2.1 (filtered colimits of Kan complexes); §4.4.1 (HTT, Prop. 5.3.1.18);
- §6.1.1 (HTT, Def. 5.3.4.5); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1 (HTT, §1.2.11);
- Part InfinityCategoryFoundations §7.5.2 (HTT, Thm. 2.2.1.2) and §6.3.1 (HTT, §2.1.4, the covariant model structure);
- Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8), §3.2.1 (HTT, Thm. 4.2.4.1, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*)), §6.5.4 (HTT, Prop. 4.4.2.6) and
  §3.4.3 (HTT, Prop. 4.4.4.5);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, homotopy pullbacks);
- ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8, homotopy limits);
- Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`.

**6.3.2.** Prove that κ-compact objects are closed under the following constructions, for κ regular and ∞-categories
with small κ-filtered colimits:

- morphisms between κ-compact objects are κ-compact objects of `Fun(Δ[1], C)` (HTT, Lemma 5.3.4.9, p. 415);
- for a κ-small family of ∞-categories `C_α`, the product `∏ C_α` has small κ-filtered colimits, and an
  object whose components are κ-compact is κ-compact (HTT, Lemma 5.3.4.10, p. 416);
- for κ uncountable and a tower `⋯ ⟶ C₁ ⟶ C₀` of categorical fibrations preserving κ-filtered colimits, the
  limit `C` has small κ-filtered colimits, the projections `C ⟶ C_n` are κ-continuous, and an object whose
  images are κ-compact is κ-compact (HTT, Lemma 5.3.4.12, p. 416).

*Proof route.* Lurie's. In each case the left fibration corepresented by the object is a κ-small homotopy
limit of pullbacks of κ-compact ones, so Lemma 5.3.4.8 (2) and (3) apply: for arrows, a homotopy pullback of
the fibrations of `X` and `Y` along evaluations, which are κ-continuous since colimits in `Fun(Δ[1], C)` are
pointwise; for products, the product of the pullbacks along projections; for towers, the inverse limit of the
pullbacks, which is a homotopy limit because an inverse limit of a tower of left fibrations is a homotopy
limit in the covariant model structure (HTT, Lemma 5.3.4.11, p. 416), colimits in the limit being built
stagewise by lifting equivalences along the categorical fibrations. The same corepresented-functor argument
shows that `C^κ` is closed under retracts (HTT, Remark 5.3.4.16, p. 419): a retract of `X` gives a retract of
corepresented functors, and a retract of a colimit cocone is a colimit cocone (Lemma 5.1.6.3).

*Needs:*
- §6.3.1 (HTT, Lemma 5.3.4.8); §1.6.2 (HTT, Lemma 5.1.6.3);
- Part LimitsAndKanExtensions §8.2.2, §8.2.3 (HTT, Prop. 5.1.2.2, Cor. 5.1.2.3);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2), §4.2.1 (HTT, Prop. 2.1.2.1), §4.3.2
  (HTT, Prop. 2.1.2.5), §5.3.1 (HTT, Lemma 2.1.3.3), §6.2.2 (HTT, Def. 2.1.4.5), §6.3.1 (HTT, §2.1.4) and §7.6.1 (HTT,
  Cor. 2.2.3.13, dual form); Mathlib `SSet.anodyneExtensions`, `SSet.rlp_monomorphisms` (HTT, Examples 2.0.0.1,
  2.0.0.2);
- Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5, categorical fibrations) and §10.2.4 (HTT, Cor. 2.4.6.5, lifting
  equivalences along categorical fibrations);
- §1.1.1 (HTT, §5.1.3) and §6.1.1 (HTT, Def. 5.3.4.5); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT,
  §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4, colimit diagrams);
- Mathlib `HomotopicalAlgebra.ModelCategory`, `SSet.KanComplex`;
- Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`.

### 6.4 Ind-objects and the comparison with Mathlib's `Ind`

**6.4.1.** Prove that `Ind_κ(C)` is stable under κ-filtered colimits in `P(C)` (HTT, Prop. 5.3.5.3, p. 421): for a
small ∞-category `C`, a κ-filtered colimit in `P(C)` of objects of `Ind_κ(C)` lies in `Ind_κ(C)`.

*Proof route.* Lurie's. First, the Yoneda embedding factors through `Ind_κ(C)` (HTT, Remark 5.3.5.2, p. 421):
`j(c)` classifies the right fibration `C_{/c} ⟶ C` (Lemma 5.1.5.2), whose total space has a final object and
so is κ-filtered (Remark 5.3.1.17). For stability, through the right-fibration model of
Prop. 5.1.1.1, reduce to κ-filtered posets (Prop. 5.3.1.18) and strict diagrams (Prop. 4.2.4.4). There
homotopy colimits are computed by Thm. 4.2.4.1, κ-filtered colimits of contravariant equivalences are
contravariant equivalences, and a κ-filtered colimit of κ-filtered ∞-categories is κ-filtered (Prop.
5.3.1.19, Remark 5.3.1.11).

*Needs:*
- §1.2.1 (HTT, Prop. 5.1.1.1); §1.3.3 (HTT, Lemma 5.1.5.2);
- §4.2.1 (HTT, Remark 5.3.1.11), §4.1.1 (HTT, Remark 5.3.1.17) and §4.4.1, §4.4.2 (HTT,
  Props. 5.3.1.18, 5.3.1.19);
- Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4) and §3.2.1 (HTT, Thm. 4.2.4.1, applied to the large `A°` of the contravariant model structure object by object through small full subcategories, as in its §3.3 (*Size*));
- Part InfinityCategoryFoundations §6.4.1 (HTT, Remark 2.1.4.12, the contravariant model structure) and §7.6.1 (HTT, Cor.
  2.2.3.12);
- ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8, homotopy colimits);
- §1.1.1 (HTT,
  §5.1.3), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def. 5.3.5.1); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2 (HTT, §1.2.11; Def. 1.2.12.1);
- Mathlib `CategoryTheory.SimplicialNerve`; Tau Ceti `SSet.RightFibration`.

**6.4.2.** Prove the characterization of Ind-objects (HTT, Cor. 5.3.5.4, p. 422). For a presheaf `F` on a small
∞-category `C`, the following are equivalent (the third only when `C` has κ-small colimits):

1. `F` is a colimit of `j ∘ p` for some `p : I ⟶ C` with `I` small and κ-filtered;
2. `F` lies in `Ind_κ(C)`;
3. when `C` has κ-small colimits, `F : C^op ⟶ S` preserves κ-small limits.

*Proof route.* Lurie's. (2) ⇒ (1): `F` is the colimit over its classified right fibration (Lemma 5.1.5.3),
whose total space is κ-filtered. (1) ⇒ (2): §6.4.1. (1) ⇒ (3): representables preserve small
limits (Props. 5.1.3.2, 5.1.2.2), and the presheaves preserving κ-small limits are closed under κ-filtered
colimits in `P(C)`, which are computed pointwise, because κ-filtered colimits in `S` preserve κ-small limits
(Prop. 5.3.3.3, the "only if" direction). (3) ⇒ (2): `F^op` is κ-right exact (Prop. 5.3.2.9), so the classified right
fibration, a pullback of the universal one, has κ-filtered total space (Prop. 5.3.2.5).

*Needs:*
- §6.4.1 (HTT, Remark 5.3.5.2; Prop. 5.3.5.3); §6.2.2 (HTT, Prop. 5.3.3.3, the "only if" direction);
- §1.3.2 (HTT, Prop. 5.1.3.2; Lemmas 5.1.5.2, 5.1.5.3); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §4.5.1 (HTT, Def. 5.3.2.1; Props. 5.3.2.5, 5.3.2.9);
- Part Straightening §2.5.3 (HTT, Warning 3.3.2.4);
- Part LimitsAndKanExtensions §4.1.1 (HTT, Cor. 3.3.2.7) and §3.4.2 (HTT, Def. 4.4.4.4);
- §1.1.1 (HTT, §5.1.3), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def. 5.3.5.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2 (HTT, Def.
  1.2.12.1);
- Tau Ceti `SSet.RightFibration`, `SSet.coslice.IsColimit`.

**6.4.3.** Prove that representables are κ-compact in `Ind_κ(C)` (HTT, Prop. 5.3.5.5, p. 422): for a small `C`, every
`j(c)` is a κ-compact object of `Ind_κ(C)`.

*Proof route.* Lurie's. By Lemma 5.1.5.2, `Map(j(c), −)` is evaluation at `c`. κ-filtered colimits in
`Ind_κ(C)` are computed in `P(C)` (Prop. 5.3.5.3), hence pointwise (Prop. 5.1.2.2), so evaluation preserves
them.

*Needs:*
- §6.4.1 (HTT, Prop. 5.3.5.3);
- §1.3.3 (HTT, Lemma 5.1.5.2); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §1.1.1, §1.1.2 (HTT, §5.1.3, §5.1.6) and §6.1.2 (HTT, Def. 5.3.5.1; Def. 5.3.4.5); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15);
- Tau Ceti `SSet.coslice.IsColimit`.

**6.4.4.** Prove that the Yoneda embedding into `Ind_κ(C)` preserves κ-small colimits (HTT, Prop. 5.3.5.14, p. 427): for
a small `C`, `j : C ⟶ Ind_κ(C)` preserves every κ-small colimit that exists in `C`.

*Proof route.* By Prop. 5.1.3.2 for `Ind_κ(C)^op`, it suffices that for each `F` in `Ind_κ(C)` the
functor `Map(j(−), F) ≃ F` on `C^op` (Lemma 5.1.5.2) carries the given colimit cocone of `C` to a limit
cone. By Cor. 5.3.5.4, `F` is a κ-filtered colimit in `P(C)` of representables, computed pointwise
(Prop. 5.1.2.2). Each representable carries colimits of `C` to limits, and κ-filtered colimits in `S`
preserve κ-small limits (Prop. 5.3.3.3, the "only if" direction), so `F` does too.

*Needs:*
- §6.4.2 (HTT, Cor. 5.3.5.4); §6.2.2 (HTT, Prop. 5.3.3.3, the "only if" direction);
- §1.3.2 (HTT, Prop. 5.1.3.2; Lemma 5.1.5.2); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §1.1.1 (HTT, §5.1.3) and §6.1.2 (HTT, Def. 5.3.5.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15);
- Tau Ceti `SSet.coslice.IsColimit`.

**6.4.5.** Prove that Ind-objects of an n-category are truncated presheaves, and that for the nerve of an ordinary
category `Ind` is Mathlib's Ind-completion (HTT, Remark 5.3.5.6, p. 423). For a small ∞-category `C` and
n ≥ 0, write `P≤n−1(C) = Fun(C^op, τ≤n−1 S)` for the full subcategory of `P(C)` on the presheaves whose
values are (n − 1)-truncated Kan complexes.

1. If `C` is categorically equivalent to an n-category, then `Ind_κ(C) ⊆ P≤n−1(C)` for every regular κ, and
   `Ind_κ(C)` is categorically equivalent to an n-category.
2. Let `A` be a small category, with objects and morphisms in universe `u`, so that Mathlib's `Ind A` has
   objects in universe `u + 1` and morphisms in `u`, and `N(Ind A)` lives in the same universe as
   `P(N(A))`. Consider the functor `N(Ind A) ⟶ P(N(A))` obtained from the nerve of Mathlib's
   `CategoryTheory.Ind.inclusion` (into `Aᵒᵖ ⥤ Type u`), the isomorphism of `N(Aᵒᵖ ⥤ Type u)` with
   `Fun(N(A)^op, N(Type u))`, and the inclusion of `N(Type u)` into `S` as the discrete Kan complexes. It is
   fully faithful with essential image `Ind(N(A)) = Ind_ω(N(A))`, and its composite with the nerve of
   `CategoryTheory.Ind.yoneda` is equivalent to the Yoneda embedding `j` of `N(A)`. So `N(Ind A)` and
   `Ind(N(A))` are categorically equivalent under `N(A)`.

The comparison is for κ = ω only: Mathlib has no κ-Ind-completion for κ > ω.

*Proof route.* For (1): each `Map_C(c, d)` is (n − 1)-truncated (Prop. 2.3.4.18), and `j(d)` is the
presheaf `Map_C(−, d)` (Lemma 5.1.5.2), so `j` lands in `P≤n−1(C)`. The (n − 1)-truncated Kan complexes
are closed under filtered colimits in `S`: reduce to a filtered poset (Prop. 5.3.1.18), rectify to a strict
diagram of Kan complexes (Prop. 4.2.4.4), whose strict colimit computes the colimit in `S` (Thm. 4.2.4.1)
and has as homotopy groups the colimits of the homotopy groups. Colimits in `P(C)` are pointwise
(Prop. 5.1.2.2), so `P≤n−1(C)` is closed under κ-filtered colimits, and Cor. 5.3.5.4 gives the inclusion.
For the bound, `τ≤n−1 S` has (n − 1)-truncated mapping spaces, so it is equivalent to an n-category `D`
(Prop. 2.3.4.18); `Fun(C^op, D)` is an n-category (HTT, Cor. 2.3.4.8, p. 126), so the full subcategory
`Ind_κ(C)` has (n − 1)-truncated mapping spaces, and Prop. 2.3.4.18 applies again. For (2), HTT
identifies `h Ind(N(A))` with the classical Ind-category through its recognition by filtered colimits and
compact generators; a direct route compares with Mathlib's presheaf model. By (1) with n = 1, `Ind(N(A))`
lies in `P≤0(N(A))`, which `π₀` identifies with `N(Aᵒᵖ ⥤ Type u)`: `τ≤0 S` is equivalent to `N(Type u)`
(Props. 2.3.4.5, 2.3.4.18), and the nerve is fully faithful and carries functor categories to functor
∞-categories. A presheaf `F` with `π₀ ∘ F = F₀` classifies the right fibration
`N(CostructuredArrow yoneda F₀) ⟶ N(A)` of the category of elements, whose fibers are the sets `F₀(a)`;
so by Def. 5.3.5.1, `F` lies in `Ind(N(A))` exactly when the nerve of `CostructuredArrow yoneda F₀` is
filtered. The nerve of a category `I` is filtered exactly when `I` is: the conditions of
`CategoryTheory.IsFiltered` are the extension conditions along `K ⊆ K^▷` for the finite simplicial sets ∅,
`∂Δ[1]` and two parallel edges, and conversely a finite `K ⟶ N(I)` involves finitely many objects and morphisms, which have a
common cocone (compare HTT, Remark 5.3.1.2, p. 400, for topological categories). Since `A` is small, so is
`CostructuredArrow yoneda F₀`, and `CategoryTheory.Limits.isIndObject_iff` identifies these presheaves with
those satisfying `CategoryTheory.Limits.IsIndObject`. For the compatibility with `j`: the mapping spaces
of `N(A)` are the discrete sets `Hom_A(a, b)`, so `j` lands in `P≤0(N(A))`, the nerve of a category, where
a functor from `N(A)` is determined up to equivalence by the functor on homotopy categories; that functor
is the classical Yoneda embedding, and `CategoryTheory.Ind.yonedaCompInclusion` finishes.

- For `C` a 0-category, the nerve of a poset `P`, (1) says `Ind(C)` is a poset: it is the poset of ideals
  of `P` (nonempty directed down-sets), since `P≤−1(C)` is the poset of down-sets. For `P = ℕ` this is
  `ℕ ∪ {∞}`, matching Mathlib's `Ind` of the poset ℕ, which adds the colimit of the whole chain.
- Filteredness is needed in (1): for `C = Δ[0]`, `P(C) = S` is equivalent to no n-category, since iterated
  suspensions of the point (pushouts of two points) give every sphere `S^n`, and `Map(∗, S^n) = S^n` is
  not (n − 1)-truncated; `Ind(Δ[0])` is equivalent to `Δ[0]`.
- For `A` the one-object category of a nontrivial finite group G, a filtered colimit of free transitive G-sets along
  equivariant maps is again free and transitive, so `Ind A ≃ A`; the nerve is a 1-category and not a
  0-category, so the bound n = 1 in (1) is attained.

*Needs:*
- §6.4.2 (HTT, Cor. 5.3.5.4); §1.3.3 (HTT, Lemma 5.1.5.2); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §4.4.1 (HTT, Prop. 5.3.1.18); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*));
- Part InfinityCategoryFoundations §10.6.1, §10.6.4, §10.6.5 (HTT, Props. 2.3.4.5, 2.3.4.18; Def. 2.3.4.15);
- §1.1.1 (HTT, §5.1.3), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def.
  5.3.5.1); Part InfinityCategoryFoundations §7.1.2 and §10.1.2 (HTT, Def. 2.3.4.1); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2, classifying maps of right fibrations);
- ModelCategoryTheory, Part KanQuillen §3.3.1 (filtered colimits of Kan complexes and their homotopy groups);
- Mathlib `CategoryTheory.Ind`, `CategoryTheory.Ind.inclusion`, `CategoryTheory.Ind.yoneda`,
  `CategoryTheory.Ind.yonedaCompInclusion`, `CategoryTheory.Limits.IsIndObject`,
  `CategoryTheory.Limits.isIndObject_iff`, `CategoryTheory.CostructuredArrow`, `CategoryTheory.IsFiltered`,
  `CategoryTheory.nerve`.

**6.4.6.** Prove that κ-filtered colimits and κ-compact objects in the nerve of a category are the 1-categorical ones
(implicit in HTT, Remark 5.3.5.6, p. 423, which calls the objects of the classical Ind-category coming from `A`
compact in the classical sense). Let κ be a regular cardinal, `κ : Cardinal.{u}`, and let `A` be a category with
morphisms in universe `u` and objects in universe `u + 1` at most, so that `N(A)` is an ∞-category in
`SSet.{u+1}` with corepresented functors `j_X : N(A) ⟶ Ŝ` (§1.1). Write `hK = SSet.hoFunctor.obj K`. A diagram
`K ⟶ N(A)` has `K` in `SSet.{u+1}`, so "small `K`" means `K` with `u`-small simplices, and then `hK` is an object
of `Cat.{u+1,u+1}` that is essentially `u`-small (Mathlib `CategoryTheory.EssentiallySmall.{u}`), not small.

1. Let `v` be any universe, `K : SSet.{v}` and `J : Type v` with `[Category.{v} J]`. If `K` is κ-filtered
   (Conventions), then `hK` satisfies Mathlib's `CategoryTheory.IsCardinalFiltered (hK) κ`; if moreover `K` has
   `u`-small simplices, `hK` is essentially `u`-small. Conversely, if `IsCardinalFiltered J κ`, then `N(J)` is a
   κ-filtered ∞-category (§4.1). For κ = ℵ₀, `IsCardinalFiltered J ℵ₀` is `IsFiltered J` (Mathlib
   `CategoryTheory.isCardinalFiltered_aleph0_iff`).
2. `N(A)` has small κ-filtered colimits exactly when `A` has colimits of all κ-filtered diagrams indexed by small
   categories (Mathlib `CategoryTheory.HasCardinalFilteredColimits.{u} A κ`). For every `K`, a cocone over `K` is
   a colimit in `N(A)` exactly when the corresponding cocone over `hK` (Part LimitsAndKanExtensions §1.4, second
   statement) is a colimit in `A`.
3. Under the hypothesis of (2), an object `X` is κ-compact in `N(A)` (§6.1) exactly when it is Mathlib
   `CategoryTheory.IsCardinalPresentable X κ` in `A`. For κ = ω this says that `X` is compact in `N(A)` exactly
   when it is `CategoryTheory.IsFinitelyPresentable.{u} X`.

*Proof route.* For (1): a categorical equivalence `K ⟶ C` onto a κ-filtered ∞-category induces an equivalence
`hK ≃ hC` (Part InfinityCategoryFoundations §2.1, HTT, Def. 1.1.5.14, read on underlying categories, which are Mathlib's
homotopy categories by Part InfinityCategoryFoundations §2.6, HTT, Prop. 1.2.3.1), and `IsCardinalFiltered.of_equivalence`
transports κ-filteredness, so it suffices to treat `hC`. Mathlib's `isCardinalFiltered_iff` reduces
κ-filteredness of `hC` to two conditions. A family of fewer than κ objects is a map from a discrete κ-small
simplicial set, and an extension to its cone gives a common target. A family of fewer than κ parallel
morphisms `f_i : j ⟶ k`, represented by edges of `C`, is a map from the κ-small simplicial set obtained by
gluing that many copies of `Δ[1]` along their endpoints. An extension to its cone gives an object `l`, edges
`a : k ⟶ l` and `b : j ⟶ l`, and 2-simplices showing `f_i ≫ a = b` in `hC`. Here every morphism of `hC` is
the class of an edge (Part InfinityCategoryFoundations §2.3, Tau Ceti `SSet.Truncated.HomotopyCategory₂.equivalence`), and the
glued simplicial set has `|ι| + 2` nondegenerate simplices, fewer than κ; for `ι` empty it is `∂Δ[1]`, the case
`isCardinalFiltered_iff` needs. If `K` has `u`-small simplices, `hK` has a `u`-small type of objects and its
morphisms are classes of strings of edges, so it is essentially `u`-small (Mathlib
`CategoryTheory.essentiallySmall_iff`). For the converse: a map `K ⟶ N(J)` from a κ-small `K` is a functor `hK ⥤ J`, and its extensions to `K^▷` are the
cocones under it (Part LimitsAndKanExtensions §1.4, second statement). Since `hK` is generated by the edges of
`K`, such a cocone is an object with maps from the fewer than κ vertices of `K` that commute with the fewer than
κ edges: `IsCardinalFiltered.exists_max` gives an object `l₀` with maps `b_v`, and
`IsCardinalFiltered.multicoequalizer`, applied to the pairs `(F(e) ≫ b_{t e}, b_{s e})`, gives `c : l₀ ⟶ l`; set
`a_v = b_v ≫ c`. `N(J)` is an ∞-category (Mathlib `CategoryTheory.Nerve.quasicategory`). Neither direction uses a
bound on the universe `v`, and `exists_max` and `multicoequalizer` are universe-polymorphic in the index type. For
κ = ω this is the third Check of §4.1; for a preorder J it agrees with Tau Ceti's
`SSet.isCardinalFiltered_nerve_iff`.

For (2): Part LimitsAndKanExtensions §1.4, second statement, applies to `N(A)` through its universe bullet,
`nerve A ≅ nerve (ULiftHom.{u+1} A)`. The colimit criterion for every `K` is its third bullet. Suppose
`HasCardinalFilteredColimits.{u} A κ`, and let `q : K ⟶ N(A)` with `K` small and κ-filtered. By (1), `hK` is
κ-filtered and essentially `u`-small, so `q₀ : hK ⥤ A` has a colimit, through `equivSmallModel.{u}` and
`IsCardinalFiltered.of_equivalence` (the pattern of Mathlib's
`preservesColimitsOfShape_of_isCardinalAccessible_of_essentiallySmall`). By the second and third bullets, its
colimit cocone comes from a colimit cocone `K^▷ ⟶ N(A)`. Conversely, suppose `N(A)` has small κ-filtered
colimits, and let `F : J ⥤ A` with `J` small and `IsCardinalFiltered J κ`. By (1), `N(J)` is κ-filtered, so
`N(F)` has a colimit in `N(A)`, and by the third and fourth bullets it gives a colimit of `F` in `A`.

For (3): *Universes.* `N(A)` lies in `SSet.{u+1}` and `Ŝ` one universe up, so `j_X` crosses universes. As
`N(A)` is locally small, `j_X` can equally be taken with values in `S`; the inclusion `S ⊆ Ŝ` preserves and
reflects small colimits, both being computed by homotopy colimits of Kan complexes (Part LimitsAndKanExtensions
§3.2 and §3.3), so κ-compactness is the same either way. The mapping spaces of `N(A)` are discrete (Part InfinityCategoryFoundations §10.6, HTT, Prop. 2.3.4.18), so `j_X`
takes values in the full subcategory `τ≤0 Ŝ` of discrete Kan complexes, which is equivalent to
`N(Type (u + 1))` (Part InfinityCategoryFoundations §10.6, HTT, Props. 2.3.4.5, 2.3.4.18, as in the route of (2) of
§6.4.5, one universe up). A functor `N(A) ⟶ N(B)` is determined up to equivalence by its functor on
homotopy categories (Part LimitsAndKanExtensions §1.4, second statement, first bullet:
`Fun(N(A), N(B)) ≅ N(A ⥤ B)`). On homotopy categories `j_X` is `π₀ Map(X, −) = Hom_A(X, −)` followed by Mathlib's
`CategoryTheory.uliftFunctor` into `Type (u + 1)`. The discrete Kan complexes are closed under small filtered
colimits in `Ŝ`, by the route of (1) of §6.4.5 with n = 1, one universe up, and κ-filtered
simplicial sets are filtered (§4.1, first bullet). A cocone in a full subcategory closed under the colimit is a
colimit there exactly when it is one in the ambient ∞-category, and preservation of colimits is invariant under
equivalence of functors. So, by Part LimitsAndKanExtensions §1.4, second statement, in `N(Type (u + 1))`, `j_X`
preserves the colimit of `q` exactly when `uliftFunctor ∘ Hom_A(X, −) ∘ q₀` is a colimit cocone in
`Type (u + 1)`. `uliftFunctor` preserves `u`-small colimits and, being fully faithful, reflects them (Mathlib
`Mathlib/CategoryTheory/Limits/Preserves/Ulift.lean`), so this holds exactly when `Hom_A(X, −)` preserves the
colimit of `q₀` over `hK`. If `X` is `IsCardinalPresentable`, it is κ-compact, since `hK` is κ-filtered and
essentially `u`-small by (1), and Mathlib's `preservesColimitsOfShape_of_isCardinalAccessible_of_essentiallySmall`
applies. If `X` is κ-compact, then for a small `J` with `IsCardinalFiltered J κ`, `N(J)` is a small κ-filtered
∞-category by (1) with `h N(J) ≅ J`; a colimit cocone of `F : J ⥤ A` gives a colimit cocone of `N(F)` (Part
LimitsAndKanExtensions §1.4, third and fourth bullets), which `j_X` preserves, so `Hom_A(X, −)` preserves it. For κ = ω,
`IsFinitelyPresentable.{u} X` is by definition `IsCardinalPresentable X ℵ₀`.

- In `N(Ab)`, ℚ is not compact: the colimit in abelian groups of the chain `⅟(n!)ℤ` is ℚ, hence also in
  `N(Ab)` by (2), and the identity of ℚ factors through no stage, since ℚ is divisible and `⅟(n!)ℤ ≅ ℤ` is
  not. ℚ is ℵ₁-compact in `N(Ab)`, being countably presented. So κ matters.
- In the nerve of the poset `ℕ ∪ {∞}`, (3) gives that each `n` is compact and `∞` is not, matching the second
  Check of §6.1: `Hom(∞, −)` does not commute with the colimit `∞` of the chain `ℕ`.
- The hypothesis of (2) cannot be dropped from (3): κ-compactness (§6.1) is defined only in an ∞-category with
  small κ-filtered colimits. The nerve of the category of finite sets has no colimit of the chain of the sets
  `{1, …, n}`: by Part LimitsAndKanExtensions §1.4, second statement, it would be a colimit `L` among finite
  sets, but the cocones from the chain to `{0, 1}` are the uncountably many maps `ℕ ⟶ {0, 1}`, while
  `Hom(L, {0, 1})` is finite.

*Needs:*
- §6.4.5 (HTT, Remark 5.3.5.6, its route for (1) and (2)); §1.1.1, §1.1.2 (HTT, §5.1.3, corepresented
  functors); §4.1.1 (HTT, Def. 5.3.1.7, with its first bullet and third Check); §6.1.1 (HTT, Def. 5.3.4.5);
- Part LimitsAndKanExtensions §1.4.1, §1.4.2 (HTT, Lemma 4.2.4.3, and its second statement, colimits in nerves);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (HTT, Cor. 4.2.4.8), for `S ⊆ Ŝ`;
- Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14), §2.3.1 (morphisms of the homotopy category are classes of
  edges), §2.6.3 (HTT, Prop. 1.2.3.1), §7.1.2 (`Ŝ`) and §10.6.1, §10.6.5 (HTT, Props. 2.3.4.5, 2.3.4.18);
- Mathlib `CategoryTheory.nerve`, `CategoryTheory.Nerve.quasicategory`, `CategoryTheory.nerveAdjunction`,
  `SSet.hoFunctor`, `CategoryTheory.IsCardinalFiltered`, `CategoryTheory.isCardinalFiltered_iff`,
  `CategoryTheory.IsCardinalFiltered.of_equivalence`, `CategoryTheory.IsCardinalFiltered.exists_max`,
  `CategoryTheory.IsCardinalFiltered.multicoequalizer`, `CategoryTheory.HasCardinalFilteredColimits`,
  `CategoryTheory.IsCardinalPresentable`, `CategoryTheory.IsFinitelyPresentable`, `CategoryTheory.uliftFunctor`,
  `CategoryTheory.isCardinalFiltered_aleph0_iff`, `CategoryTheory.EssentiallySmall`,
  `CategoryTheory.essentiallySmall_iff`, `CategoryTheory.equivSmallModel`, `CategoryTheory.ULiftHom`,
  `CategoryTheory.Functor.preservesColimitsOfShape_of_isCardinalAccessible_of_essentiallySmall`;
  Tau Ceti `SSet.coslice.IsColimit`, `SSet.Truncated.HomotopyCategory₂.equivalence`,
  `SSet.isCardinalFiltered_nerve_iff`.

### 6.5 The universal property of `Ind_κ`

**6.5.1.** Prove that every ∞-category embeds into a cocomplete one, preserving and reflecting colimits (HTT, Lemma
5.3.5.7, p. 423): every ∞-category `D`, not necessarily small, has a fully faithful functor `i : D ⟶ D'` into an
∞-category with small colimits such that a small cocone `K^▷ ⟶ D` is a colimit exactly when its image in `D'` is. The
`Suggested.lean` declaration is `exists_isFullyFaithful_cocomplete`.

*Proof route.* Lurie's. Take `D' = Fun(D, Ŝ)^op` and `i` the opposite of the Yoneda embedding of `D^op`.
`D'` has small colimits since `Fun(D, Ŝ)` has small limits (Prop. 5.1.2.2), and the colimit condition is
Prop. 5.1.3.2.

*Needs:*
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); §1.3.1, §1.3.2 (HTT, Props. 5.1.3.1, 5.1.3.2);
- §1.1.1, §1.1.2 (HTT, §5.1.3; §5.1.6); Part InfinityCategoryFoundations §1.1, §2.1.8 (HTT, Def. 1.2.10.1) and §7.1.2 (HTT, Def. 1.2.16.1, `Ŝ`);
- Tau Ceti `SSet.coslice.IsColimit`.

**6.5.2.** Prove that κ-continuous functors out of `Ind_κ` are Kan extensions (HTT, Lemma 5.3.5.8, p. 423). For a small
`C`, `C⁰ ⊆ Ind_κ(C)` the essential image of `j`, and `D` with small κ-filtered colimits: every
`f₀ : C⁰ ⟶ D` has a left Kan extension to `Ind_κ(C)`, and a functor `Ind_κ(C) ⟶ D` is a left Kan extension
of its restriction to `C⁰` exactly when it is κ-continuous. HTT sketches without proof an analogue for other
classes of colimits (HTT, Remark 5.3.5.9, p. 424); of its cases, this Part proves only the two that HTT
names: all small colimits, which is Lemma 5.1.5.5, and κ-filtered colimits, which is this lemma.

*Proof route.* Lurie's. Embed `D` by Lemma 5.3.5.7 into a cocomplete `D'`. Left Kan extend to `P(C)`
(Lemma 5.1.5.5) and restrict to `Ind_κ(C)` (transitivity of Kan extensions). The full subcategory of
objects whose values land in `D` is stable under κ-filtered colimits (Prop. 5.3.5.3), contains `C⁰`, and so
is all of `Ind_κ(C)` (Cor. 5.3.5.4). The characterization follows from that of Lemma 5.1.5.5 and the
uniqueness of Kan extensions.

*Needs:*
- §6.5.1 (HTT, Lemma 5.3.5.7);
- §1.4.2 (HTT, Lemma 5.1.5.5; Def. 5.1.5.7);
- §6.4.1, §6.4.2 (HTT, Prop. 5.3.5.3, Cor. 5.3.5.4);
- Part LimitsAndKanExtensions §7.5.2 (HTT, Prop. 4.3.2.8) and §7.4.6 (HTT, Prop. 4.3.2.15);
- §1.1.1 (HTT, §5.1.3), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def. 5.3.5.1; Def. 5.3.4.5); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1 (HTT, §1.2.11);
- Tau Ceti `SSet.coslice.IsColimit`.

**6.5.3.** Prove the universal property of `Ind_κ` (HTT, Prop. 5.3.5.10, p. 424): for a small ∞-category `C` and an
∞-category `D` with small κ-filtered colimits, restriction along `j` is an equivalence from the
∞-category of κ-continuous functors `Ind_κ(C) ⟶ D` to `Fun(C, D)`.

*Proof route.* Lurie's. `Ind_κ(C)` has small κ-filtered colimits (Prop. 5.3.5.3). By Lemma 5.3.5.8 the
κ-continuous functors are the left Kan extensions of functors on `C⁰ ≃ C`. Restriction from left Kan
extensions is a trivial fibration.

*Needs:*
- §6.5.2 (HTT, Lemma 5.3.5.8);
- §6.4.1 (HTT, Prop. 5.3.5.3);
- Part LimitsAndKanExtensions §7.4.6 (HTT, Cor. 4.3.2.16);
- §1.1.1 (HTT, §5.1.3), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def. 5.3.5.1; Def. 5.3.4.5); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15);
- Tau Ceti `SSet.coslice.IsColimit`.

**6.5.4.** Prove the recognition principle for `Ind_κ` (HTT, Prop. 5.3.5.11, p. 425). Let `C` be small, `D` have small
κ-filtered colimits, `F : Ind_κ(C) ⟶ D` be κ-continuous and `f = F ∘ j`.

1. If `f` is fully faithful and its values are κ-compact, then `F` is fully faithful.
2. `F` is an equivalence exactly when `f` is fully faithful, `f` lands in `D^κ`, and the objects `f(c)`
   generate `D` under κ-filtered colimits.

*Proof route.* Lurie's. For (1), fix `c`. The objects `Y` of `Ind_κ(C)` with `Map(j c, Y) ⟶ Map(f c, F Y)` an
equivalence form a full subcategory stable under κ-filtered colimits: the source preserves them because `j(c)`
is κ-compact (Prop. 5.3.5.5), the target because `F` is κ-continuous and `f(c)` is κ-compact. It contains the
representables, since `f` is fully faithful, so by Cor. 5.3.5.4 it is everything. Now fix `Y` and repeat in the
first variable: the objects `X` with `Map(X, Y) ⟶ Map(F X, F Y)` an equivalence are stable under κ-filtered
colimits, since both sides carry them to limits, and contain the representables. For (2), `F` is fully
faithful by (1); its essential image is stable under κ-filtered colimits and contains the generators `f(c)`, so
it is `D`. Conversely, an equivalence carries the representables, which are fully faithfully embedded (Prop.
5.1.3.1), κ-compact (Prop. 5.3.5.5) and generate under κ-filtered colimits (Cor. 5.3.5.4), to objects with
these properties.

*Needs:*
- §6.4.1, §6.4.2, §6.4.3 (HTT, Prop. 5.3.5.3, Cor. 5.3.5.4, Prop. 5.3.5.5);
- §1.3.1, §1.3.2 (HTT, Props. 5.1.3.1, 5.1.3.2);
- Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential-surjectivity half);
- §1.1.1, §1.1.2 (HTT, §5.1.3, §5.1.6), §4.1.1 (HTT, Def. 5.3.1.7) and §6.1.2 (HTT, Def. 5.3.5.1; Def. 5.3.4.5); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §2.1.8 (HTT,
  Def. 1.2.10.1);
- Tau Ceti `SSet.IsFullyFaithful`, `SSet.coslice.IsColimit`.

### 6.6 Lifting idempotents; filtered colimits of idempotent complete ∞-categories

**6.6.1.** Prove the lifting criterion for idempotents of the homotopy category (HTT, Prop. 4.4.5.20, pp. 328–331).
For objects X, Y of an ∞-category `C`, composition induces a right action
`Π₁Map_C(X, Y) × Π₁Map_C(X, X) ⟶ Π₁Map_C(X, Y)` of the monoidal groupoid `E = Π₁Map_C(X, X)`, with
associativity isomorphisms. For `e : X ⟶ X` the following are equivalent: (1) `e` extends to an idempotent
`Idem ⟶ C`; (2) there is an isomorphism `h : [e] ⟶ [e] ∘ [e]` in `E` such that `(h ∘ id) ∘ h` and
`(id ∘ h) ∘ h` agree up to the associator. The implication (1) ⇒ (2) already holds when the map `Δ[1] ⟶ C`
determined by `e` only extends to the 3-skeleton of `Idem`.

*Proof route.* Lurie's.
- *The action.* Realize composition strictly in the mapping spaces of `C[C]` (HTT 2.2.0.1) after Kan
  replacement, and take combinatorial fundamental groupoids.
- *(1) ⇒ (2), from the 3-skeleton.* The value on the nondegenerate 2-simplex of `Idem` gives `h`, and the value
  on its nondegenerate 3-simplex witnesses that `(h ∘ id) ∘ h` and `(id ∘ h) ∘ h` agree up to the associator,
  both read in `E` through the action.
- *(2) ⇒ (1), reduction.* Embed `C` fully faithfully into an ∞-category with sequential colimits,
  `ι : C ⟶ C'`, by Lemma 5.3.5.7; condition (2) involves only `Map_C(X, X)` and its composition, which `ι`
  preserves, and a map `Idem ⟶ C'` through objects in the image factors through the full subcategory on the
  image, since `Idem` has one vertex.
- *The retract candidate* (p. 329). Send the simplicial subset `K ⊆ N(ℤ_{≥0})` with all vertices and only the
  edges `n ⟶ n + 1` to `C'`, every vertex to X and every nondegenerate edge to e, and let Y be its colimit,
  with cocone `φₙ : X ⟶ Y` and 2-simplices witnessing `φₙ ≃ φₙ₊₁ ∘ e`. A 2-simplex representing h gives a
  cocone under K with apex X, hence `i : Y ⟶ X` with `i ∘ φ₀` homotopic to e.
- *Good isomorphisms* (pp. 330–331), pure 1-category theory for a Mathlib `Groupoid` D (here
  `Π₁Map_{C'}(X, Y)`) with the right action of `E`. With `αₙ : [φₙ] ⟶ [φₙ₊₁] ∘ [e]`, call
  `β : [s] ∘ [e] ⟶ [s'] ∘ [e]` good when it commutes with the maps to `([−] ∘ [e]) ∘ [e]` built from h and the
  associator; good maps contain the two evident families and are closed under composition. There are good
  `βₙ : [φₙ₊₁] ∘ [e] ⟶ [φ₀] ∘ [e]` with `([φ₀] ◁ h) ∘ βₙ = a ∘ ((βₙ₊₁ ∘ αₙ₊₁) ▷ [e])` for every n, a the
  associator: `β₀` exists because `[φ₀] ≅ [φ₁]`, and `βₙ₊₁` is built from `βₙ`, `αₙ₊₁⁻¹`, h and a by
  recursion.
- *Conclusion.* The relation `φ₀ ∘ i ≃ id_Y` is a map `K ⋆ {u} ⋆ {v} ⟶ C'` that restricts on `K ⋆ {u}` to
  the cocone with apex X built from h, on `K ⋆ {v}` to the colimit cocone, and on `{u} ⋆ {v}` to `φ₀`.
  Isomorphisms `ρₙ : [φₙ] ⟶ [φ₀] ∘ [e]` give its 2-skeleton, and with `ρₙ = βₙ ∘ αₙ` the 3-skeleton exists
  because the `βₙ` are good. So `Y` is a retract of `X` with composite
  equivalent to `e`, and weak retractions extend to idempotents (Cor. 4.4.5.7).

*Needs:*
- §6.5.1 (HTT, Lemma 5.3.5.7);
- §1.3.1 (HTT, Prop. 5.1.3.1); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
- §2.1.1 (HTT, Def. 4.4.5.2) and §2.2.2 (HTT, Cor. 4.4.5.7; Def. 4.4.5.4); Part LimitsAndKanExtensions §3.3.1 (HTT,
  Cor. 4.2.4.8);
- Part InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4, cones and joins), §5.5.4 (HTT, Rem. 1.2.13.5) and §8.1.2
  (HTT, Thm. 2.2.0.1);
- Mathlib `SSet.Quasicategory`, `SimplicialThickening`, `CategoryTheory.Groupoid`,
  `CategoryTheory.MonoidalCategory`; Tau Ceti `SSet.coslice.IsColimit`.

**6.6.2.** Prove that filtered colimits of idempotent complete ∞-categories are idempotent complete (HTT, Cor.
4.4.5.21, p. 328): a filtered colimit in `Cat∞` of idempotent complete ∞-categories is idempotent complete. The
`Suggested.lean` declaration is `isIdempotentComplete_catInftyObj_of_isColimitDiagram`.

*Proof route.* Lurie's. Reduce the indexing ∞-category to a filtered poset `A` (Prop. 5.3.1.18). Strictify
the diagram to a functor from `A` to marked simplicial sets with fibrant values (Prop. 4.2.4.4), and compute
its colimit in `Cat∞` as the strict filtered colimit (Thm. 4.2.4.1), since Cartesian equivalences are
stable under filtered colimits. The finite 3-skeleton of `Idem` maps, up to homotopy, into some stage. There
this map yields condition (2) for the resulting `(X, e)` (Prop. 4.4.5.20, (1) ⇒ (2), from the 3-skeleton),
and the implication (2) ⇒ (1) of the same criterion extends `(X, e)` to an idempotent. Its colimit
maps to a colimit of the given idempotent, because colimits of idempotents are absolute and are sequential
colimits.

*Needs:*
- §6.6.1 (HTT, Prop. 4.4.5.20, both implications);
- §4.4.1 (HTT, Prop. 5.3.1.18);
- §2.3.2 (HTT, Cors. 4.4.5.14, 4.4.5.15) and §2.4.1 (HTT, Prop. 4.4.5.17, Remark 4.4.5.18);
- Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1, applied to `(Set⁺_Δ)°` object by object through small full subcategories, as in its §3.3 (*Size*)) and §3.8.1
  (`N((Set⁺_Δ)°) ≃ Cat∞`);
- Part CartesianFibrations §5.7.1 (HTT, Prop. 3.1.3.7, Cartesian equivalences) and §5.8.1 (HTT, Prop. 3.1.4.1);
- §2.1.1 (HTT, Def. 4.4.5.2); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts); Tau Ceti `SSet.catInfty`, `SSet.coslice.IsColimit`.

### Examples

- `Ind_ω(Δ[0])` is the full subcategory of `S` on the colimits of filtered diagrams of points, which are the
  contractible spaces. So `Ind(Δ[0]) ≃ Δ[0]`, as Prop. 5.3.5.10 predicts for `D` with filtered colimits.
- In `S`, the point lies in `S^ω`, while the coproduct of countably many points does not: `Map(⊔ℕ ∗, −)` is a
  countable product, which does not commute with filtered colimits; it lies in `S^κ` for κ = ℵ₁ (§6.3). In
  `Δ[0]`, the unique object is κ-compact for every κ but not completely compact (§1.6).
- For a small category `A`, `Ind_ω` of its nerve is the nerve of Mathlib's Ind-completion of `A` (§6.4); and
  Prop. 5.3.3.3 recovers the classical fact that filtered colimits of spaces commute with finite homotopy
  limits.

### Dependencies

Layer 6 uses Layers 1, 2 and 4 (presheaves, Yoneda and completely compact objects; idempotents; filtered
∞-categories, filtered posets and κ-right exact functors), Part AdjunctionsAndLocalizations (preservation of
colimits by left adjoints), the definitions of `Ŝ` and n-categories (Part InfinityCategoryFoundations), Part
LimitsAndKanExtensions (colimits in nerves of categories, rectification, colimits in functor ∞-categories and in `S`, reduction to pushouts and
products, the universal fibration, Kan extensions), Part InfinityCategoryFoundations (the covariant and contravariant
structures, categorical fibrations, n-categories and truncation, the mapping-space comparison theorem), Part CartesianFibrations (lifting equivalences
along categorical fibrations, Cartesian equivalences and the Cartesian model structure), Part Straightening (the
restriction `q'` of the universal Cartesian fibration to spaces), Mathlib's `CategoryTheory.Ind`, groupoids and monoidal categories, Tau Ceti's `Cat∞` and ModelCategoryTheory (homotopy
pullbacks and limits, the projective structure, the Kan–Quillen structure and filtered colimits of Kan
complexes).

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited here: §5.1 (presheaves, Yoneda, free cocompletion, idempotent completion, completely compact objects),
  pp. 333–351; §4.4.5 (idempotents), pp. 321–331; §5.2.6 (adjunctions between presheaf ∞-categories),
  pp. 378–382; §5.3.1–5.3.5 (filtered ∞-categories, κ-right exact functors, filtered colimits of spaces,
  κ-compact objects, `Ind_κ`, and Remark 5.3.5.6 on Ind of n-categories, p. 423), pp. 400–430; Lemmas
  5.4.5.10 and 5.4.6.2, pp. 457 and 462; Lemma 5.5.2.3, p. 481; §5.5.8 (sifted colimits), pp. 524–527;
  Prop. A.2.9.14, Rem. A.2.9.16 and Lemma A.2.9.18, pp. 855–859; Cor. 2.3.4.8, p. 126; Remark 5.3.1.2,
  p. 400; Counterexample 4.4.5.19, p. 327.
- **Kerodon.** Jacob Lurie, *Kerodon: an online resource for homotopy-coherent mathematics*,
  [kerodon.net](https://kerodon.net). Cited: Prop. 3.1.7.9 (a functor with a left or right adjoint induces a homotopy equivalence of nerves),
  in §5.3.
