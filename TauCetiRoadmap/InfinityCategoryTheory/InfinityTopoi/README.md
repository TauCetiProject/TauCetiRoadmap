# Roadmap: ∞-topoi, sheaves, connectivity and n-topoi

**Summary.** This Part develops the theory of ∞-topoi, from Cartesian transformations and universal colimits to
the elementary theory of ∞-topoi and their truncated forms, n-topoi.

It builds on the presentable ∞-categories, localizations, Kan extensions and straightening of the earlier Parts.

- **Descent (Layers 1–3).** Universal colimits and disjoint coproducts (defined in §1.1), classes stable under
  pullback (§2.1), descent, and ∞-topoi with effective groupoids (§3.1).
- **Giraud's theorem and object classifiers (Layers 4–5).** Giraud's theorem for ∞-topoi, and Rezk's
  characterization by object classifiers.
- **Sheaves (Layers 6–9).** Topological localizations, effective epimorphisms (defined in §7.1), Grothendieck
  topologies on ∞-categories and sheaves, and the universal property of sheaves.
- **The ∞-category of ∞-topoi (Layers 10–11).** Geometric morphisms, `LTop` and `RTop`, slices, points, topos
  fibrations, and limits of ∞-topoi.
- **Truncation and connectivity (Layers 12–15).** Homotopy sheaves and n-connective morphisms (defined in §12.1);
  group objects and delooping, first in spaces and then in every ∞-topos; Eilenberg–MacLane objects.
- **n-topoi (Layers 16–20).** n-topoi and their colimits, descent for truncated morphisms, locales and 0-topoi,
  the characterization of n-topoi, and localic reflection.

**Headline theorems.**
- **Giraud's theorem** for ∞-topoi: for an ∞-category 𝒳, being an accessible left exact localization of a
  presheaf ∞-category, being presentable with descent, and satisfying the ∞-categorical Giraud axioms (the
  definition of an ∞-topos, §3.1) are equivalent (HTT, Thm. 6.1.0.6, p. 547).
- Rezk's characterization of ∞-topoi by object classifiers (HTT, Thm. 6.1.6.8, p. 588).
- **Sheaves form an ∞-topos**: for a small ∞-category with a Grothendieck topology, sheaves form a topological
  localization of presheaves (HTT, Prop. 6.2.2.7, p. 597).
- Grothendieck topologies correspond to topological localizations (HTT, Prop. 6.2.2.17, p. 602).
- The universal property of sheaves (HTT, Prop. 6.2.3.20, p. 612).
- `LTop` has small limits, computed in large ∞-categories (HTT, Prop. 6.3.2.3, p. 622).
- Spaces are final in `RTop` (HTT, Prop. 6.3.4.1, p. 628).
- Effective epimorphisms are detected on 0-truncations (HTT, Prop. 7.2.1.14, p. 741).
- The (n + 1)-connective and n-truncated morphisms form a factorization system (HTT, Ex. 5.2.8.16, p. 391).
- Connected pointed objects of an ∞-topos deloop (HTT, Lemma 7.2.2.11, p. 745), and Eilenberg–MacLane objects
  are classified by their homotopy sheaves (HTT, Prop. 7.2.2.12, pp. 746–747).
- Descent for truncated morphisms in n-topoi (HTT, Thm. 6.4.4.5, p. 669).
- Locales are the 0-topoi (HTT, Thm. 6.4.2.1, p. 660; Prop. 6.4.2.5, p. 661).
- The characterization of n-topoi by six equivalent conditions (HTT, Thm. 6.4.1.5, p. 658).
- Localic reflection (HTT, Prop. 6.4.5.7, p. 674).

## Scope and ownership

**Owned by earlier Parts of this family.** Groupoid objects and Čech nerves are Part
LimitsAndKanExtensions §9.1, and truncated objects and n-categories Part InfinityCategoryFoundations §10.1.
Pointed objects and group objects of an ∞-category with finite limits are Part LimitsAndKanExtensions §9.3.
The criterion for a localization to be left exact through pullbacks of local equivalences is Part
PresentableInfinityCategories §4.5; truncated morphisms, truncation functors and left exact filtered colimits in general are
Part PresentableInfinityCategories Layer 6, with the elementary truncated objects in Part InfinityCategoryFoundations §10.7; limits in
`Pr^R_κ` are Part PresentableInfinityCategories §5.8. This Part proves the theorems that relate these notions for ∞-topoi.

**Owned by later Parts of this family.** The theory of ∞-connective morphisms (beyond their definition in
§12.1 and the closure properties of §14.5), the hypercompletion, hypercoverings, homotopy dimension, sheaves
with values in an ∞-category, sheaves of spectra and coherent ∞-topoi belong to Part
HypercompletenessAndCoherence; this Part does not state them.

**Left to other roadmaps.** The 1-categorical theory of Grothendieck topoi is outside this family: the
predicate of being a topos (HTT, Def. 6.1.0.2, p. 547), the classical Giraud theorem (HTT, Prop. 6.1.0.1,
pp. 546–547; SGA 4, exposé IV, 1.2), Lawvere–Tierney topologies and subtopoi, and localic 1-topoi with the
localic reflection. This Part owns the ∞-categorical statements and the statements uniform in n. At n = 1
these agree with the classical ones: the n-categorical Giraud theorem (§19.4) on nerves of Grothendieck topoi
is the classical Giraud theorem, and the 0-topoi and localic reflection of §18.3 and §20.2 at (m, n) = (0, 1)
are sheaves on a locale and the classical localic reflection. These comparisons, and the 0-truncated forms of
Giraud's theorem and of topological localizations, are Checks and Examples here (Layers 4, 6, 8 and 18–20),
not targets. The covering topology of a locale is defined in §18.3 for this Part's own use. The first
half of §7.7.1, that equivalence relations in `Type u` are effective, is stated for Mathlib's
`CategoryTheory.IsEquivalenceRelation`, the form the Checks of §7.2 use. Mathlib's 1-categorical
sites, sieves, sheaves and sheafification, its effective epimorphisms, and its frames `Order.Frame` are the
comparison for the ∞-categorical notions; this Part does not restate their theory. Topological applications
(sheaves on topological spaces beyond examples, shape theory, covering dimension, proper base change) and
∞-operads are outside this family.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.4.2` here and `Part InfinityTopoi §2.4.2` elsewhere, is one
target.

1. **∞-categories are quasicategories.** An ∞-category is a simplicial set with Mathlib's
   `SSet.Quasicategory` instance. Objects are vertices, morphisms are edges, functor ∞-categories are internal
   Homs `Fun(C, D)`, and a full subcategory is the full simplicial subset spanned by a set of vertices. Limits
   and colimits are Tau Ceti's `SSet.slice.IsLimit` and `SSet.coslice.IsColimit`; final and initial objects
   are Tau Ceti's `SSet.IsTerminalVertex` and `SSet.IsInitialVertex`. Witness: in the nerve of the poset
   {0 < 1}, the vertex 1 is final and 0 is initial, and these are the only final and initial vertices; the horn
   Λ[2,1] is not an ∞-category, since its identity map is an inner horn with no filler.
2. **Spaces and presheaves.** `S` is the ∞-category of spaces (Kan complexes) of Part InfinityCategoryFoundations §7.1 (HTT,
   Def. 1.2.16.1). For a small ∞-category C, `P(C)` is the presheaf ∞-category `Fun(Cᵒᵖ, S)` of Part LimitsAndKanExtensions §8.1 (HTT, Def. 5.1.0.1), and `j : C → P(C)` is the Yoneda embedding (HTT, §5.1.3). Witness:
   for C = Δ[0], `P(C)` is `S` and `j` picks out the point. A simplicial set K named as an object of `S`,
   such as `∂Δ[n+1]` for the n-sphere, denotes a Kan replacement of K, for instance `Ex^∞ K`
   (ModelCategoryTheory, Part KanQuillen §2.2); a Kan complex denotes itself.
   Witness: `∂Δ[2]` is not a Kan complex, since the horn Λ[2,1] in it, the two edges 0 → 1 → 2, has no
   filler, and as an object of `S` it denotes a circle.
3. **The codomain fibration.** For an ∞-category 𝒳, `O_𝒳` is `Fun(Δ[1], 𝒳)` and `p : O_𝒳 → 𝒳` is evaluation
   at the vertex 1 (HTT, §6.1.1). The fiber of p over an object U is the slice `𝒳_{/U}`.
   A morphism of `O_𝒳` is a square in 𝒳, whose source arrow is the left edge and whose target arrow is the
   right edge. Witness: for 𝒳 the nerve of a category with pullbacks, an edge of `O_𝒳` is a commutative
   square, and p sends it to its bottom edge, the map between the targets of the two vertical arrows.
4. **Three descriptions of an ∞-topos.** Three conditions on an ∞-category 𝒳 are used throughout.
   - (T) **∞-topos**: 𝒳 satisfies Giraud's axioms. That is, 𝒳 is presentable, colimits in 𝒳 are universal,
     coproducts in 𝒳 are disjoint, and every groupoid object of 𝒳 is effective. This is the definition of
     ∞-topos in §3.1 (HTT, Thm. 6.1.0.6 (3)), with universal colimits and disjoint coproducts as in §1.1 and
     effective groupoids as in §3.1.
   - (L) **Left exact presentation**: there are a small ∞-category C and an accessible, left exact, reflective
     localization `P(C) → 𝒳`. This is Lurie's definition of ∞-topos (HTT, Def. 6.1.0.4, p. 547), recorded in
     §3.1.
   - (D) **Descent**: 𝒳 is presentable and satisfies the descent condition of §2.4 (HTT, Thm. 6.1.0.6 (2)).

   Before Giraud's theorem (§4.4) the three are kept apart, and each statement names the one it uses. After
   §4.4, "∞-topos" means any of them, and many routes reduce through a left exact presentation to presheaves
   and then, objectwise, to spaces. Witness: for C = ∅, `P(C) ≃ Δ[0]`. The one-object ∞-category is therefore
   (L) through the identity, and it is (T): it is presentable, and its single object is initial and final, so
   every square in it is a pullback and a pushout.
5. **Disjoint coproducts.** Disjointness (§1.1) is a condition on binary coproducts: the pushout square with
   an initial object in the upper-left corner, `∅ → X`, `∅ → Y`, `X → X ⊔ Y ← Y`, is also a pullback square.
   Statements about arbitrary coproducts, such as §1.6.2, reduce to it by splitting
   off one summand. Witness: in `S` the
   pullback of the two inclusions of a point into the two-point space is empty, so `S` has disjoint
   coproducts.
6. **Directions.** A Cartesian transformation `α : p → q` goes from the diagram that is pulled back to the
   diagram it is pulled back from. Pullback functors are written `f^*`. A geometric morphism from X to Y is
   the right adjoint `f_* : X → Y`, and its left exact left adjoint is written `f^*` (§10.1). Witness: for
   K = Δ[0], a Cartesian transformation is one morphism `p(x) → q(x)` with no condition, and its source is
   `p(x)`; the functor Δ[0] → X picking a final object is a geometric morphism from Δ[0] to X, while the unique
   functor X → Δ[0] is one only when X is equivalent to Δ[0].
7. **Universes.** Small means u-small. A presentable ∞-category, and in particular an ∞-topos, lives one
   universe up and is locally small, and `P(C)` for `C : SSet.{u}` is a simplicial set in universe u+1. `Ĉat∞`
   is the ∞-category of large ∞-categories, Tau Ceti's `SSet.catInfty` taken one universe up, and `Ŝ` is the
   ∞-category of large spaces; `LTop`, `RTop` and the n-topoi of Layer 20 form subcategories of `Ĉat∞`.
   Witness: `S` is not u-small, while its full subcategory on a single Kan complex is, and each mapping space
   of `S` is a small Kan complex.
8. **Notation for ∞-topoi, slices and discrete objects.** Layers 1–9, 13 and 15 write 𝒳, 𝒴 for the ambient
   ∞-categories and ∞-topoi; Layers 10–12, 14 and 16–20 write X, Y, Z. The slice `𝒳_{/U}` is also written
   X/U, and for f : U → V the object f of X/V is written the same way. Disc(X/U) is the full subcategory of
   discrete (0-truncated) objects of X/U; it is the nerve of an ordinary category (Part InfinityCategoryFoundations §10.6,
   HTT, Prop. 2.3.4.18), and the homotopy sheaves πₙ(f) of a morphism f : U → V are objects of Disc(X/U)
   (§12.1, HTT, Def. 6.5.1.1). For an ordinary category A with finite products, Grp(A) and
   CommGrp(A) are Mathlib's `CategoryTheory.Grp` and `CategoryTheory.CommGrp` for the Cartesian monoidal
   structure `CategoryTheory.CartesianMonoidalCategory.ofHasFiniteProducts`, whose braiding is unique.
   Witness: for V = Δ[0] in `S`, π₀ of U → Δ[0] is the constant family of sets π₀U over U, and Disc(`S`) is the
   category of small sets.
9. **Truncation indices.** Truncation runs from −2: an object is (−2)-truncated when it is final,
   (−1)-truncated objects are the subterminal objects, and a morphism is (−1)-truncated exactly when it is a
   monomorphism. `τ≤k` is the left adjoint of the inclusion of k-truncated objects. An n-topos is built from
   (n − 1)-truncated presheaves, so its objects and mapping spaces are (n − 1)-truncated: a 1-topos is a
   1-category and a 0-topos is a 0-category, that is, a poset. Witness: τ≤0 `S` is the nerve of the category of
   small sets, a 1-topos, and τ≤−1 `S` is Δ[1], a 0-topos.
10. **Connectivity indices.** A morphism is n-connective (§12.1) when it is an effective epimorphism and its
    homotopy sheaves vanish in degrees below n; every morphism is (−1)-connective and the 0-connective morphisms are the
    effective epimorphisms. This is one more than the classical index: an n-connective space is a classically
    (n − 1)-connected one. Witness: in `S`, the map ∂Δ[n+1] → Δ[0] from the n-sphere is n-connective and not
    (n + 1)-connective for n ≥ 1, and ∂Δ[1] → Δ[0] is 0-connective and not 1-connective.
11. **Truncated arrows.** For an ∞-category X, `O^n_X` is the full subcategory of `O_X` spanned by the
    (n − 2)-truncated morphisms. That is one index below the (n − 1)-truncated morphisms, which make up all of
    `O_X` when X is an n-topos, and descent holds for this smaller class (§17.2). Witness: `O^0_X` consists of
    the equivalences and `O^1_X` of the monomorphisms (§17.1); in the 1-topos N(Set), the map from a two-element
    set to a point is not in `O^1`.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory` (`AlgebraicTopology/Quasicategory/Basic.lean`), `SSet.KanComplex`
  (`AlgebraicTopology/SimplicialSet/KanComplex.lean`), `CategoryTheory.nerve`
  (`AlgebraicTopology/SimplicialSet/Nerve.lean`) with the instance `CategoryTheory.Nerve.quasicategory`, and
  `CategoryTheory.nerveAdjunction` (`AlgebraicTopology/SimplicialSet/NerveAdjunction.lean`): the models of
  ∞-categories and spaces, nerves of ordinary categories and their homotopy categories. Nothing beyond the inner,
  respectively all, horn filling conditions is assumed.
- The instance `Quasicategory ((ihom K).obj C)` (`AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`)
  and `SSet.innerFibration_pullbackObjObjπ`: functor ∞-categories, and exponentials of inner fibrations along
  monomorphisms (HTT, Cor. 2.3.2.5, first half), used in §1.2 and Layer 10.
- `SSet.anodyneExtensions` (`AlgebraicTopology/SimplicialSet/AnodyneExtensions/`) and `SSet.rlp_monomorphisms`
  (`AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`): Kan fibrations and trivial fibrations
  through lifting properties (§3.2, §14.4).
- `CategoryTheory.Bicategory.Adjunction.comp` in `SSet.QCat.bicategory`
  (`AlgebraicTopology/Quasicategory/StrictBicategory.lean`): composites of adjunctions (§10.1).
- `SimplexCategory` and `AugmentedSimplexCategory` (`AlgebraicTopology/SimplexCategory/Augmented/Basic.lean`):
  the indexing categories of simplicial and augmented simplicial objects.
- `CategoryTheory.GrothendieckTopology`, `CategoryTheory.Sieve` (`CategoryTheory/Sites/`),
  `CategoryTheory.Presheaf.IsSheaf`, `CategoryTheory.Sheaf` (`CategoryTheory/Sites/Sheaf.lean`),
  `CategoryTheory.plusPlusSheaf` and `CategoryTheory.presheafToSheaf` (`CategoryTheory/Sites/Sheafification.lean`):
  the 1-categorical comparison for Layer 8, and an input to §8.4.
- `CategoryTheory.IsUniversalColimit` (`CategoryTheory/Limits/VanKampen.lean`),
  `CategoryTheory.Limits.CoproductDisjoint` (`CategoryTheory/Limits/Shapes/DisjointCoproduct.lean`),
  `CategoryTheory.EffectiveEpi` (`CategoryTheory/EffectiveEpi/Basic.lean`) and `Preorder.smallCategory`
  (`CategoryTheory/Category/Preorder.lean`): the 1-categorical notions with which the Checks compare on nerves;
  `CategoryTheory.EffectiveEpi` is also the notion on the right of §14.1.
- `CategoryTheory.strongEpi_of_effectiveEpi` (`CategoryTheory/EffectiveEpi/Basic.lean`) and
  `CategoryTheory.isIso_of_mono_of_strongEpi` (`CategoryTheory/Limits/Shapes/StrongEpi.lean`): an effective
  epimorphism of an ordinary category that is a monomorphism is an isomorphism (§14.1).
- `CategoryTheory.IsEquivalenceRelation`, `CategoryTheory.IsEffectiveEquivalenceRelation`
  (`CategoryTheory/EquivalenceRelation.lean`), `CategoryTheory.epi_iff_surjective`
  (`CategoryTheory/Types/Basic.lean`), `CategoryTheory.regularEpiCategoryOfSplitEpiCategory` and
  `CategoryTheory.isRegularEpi_iff_effectiveEpi` (`CategoryTheory/Limits/Shapes/RegularMono.lean`): equivalence
  relations and effective epimorphisms of sets, for §7.7. Mathlib does not state that equivalence relations in
  `Type u` are effective, nor `EffectiveEpi f ↔ Function.Surjective f` there; §7.7 assembles both.
- `CategoryTheory.Grp`, `CategoryTheory.GrpObj` (`CategoryTheory/Monoidal/Grp.lean`), `CategoryTheory.CommGrp`
  (`CategoryTheory/Monoidal/CommGrp_.lean`), `CategoryTheory.CartesianMonoidalCategory.ofHasFiniteProducts` and
  `CategoryTheory.BraidedCategory.ofCartesianMonoidalCategory` (`CategoryTheory/Monoidal/Cartesian/Basic.lean`),
  `CategoryTheory.Grp.instCartesianMonoidalCategory`: internal groups and commutative groups of a category with
  finite products, for §13.3 and §15.2. Mathlib has no Cartesian monoidal structure on CommGrp(A).
- `EckmannHilton.mul` and `EckmannHilton.mul_comm` (`GroupTheory/EckmannHilton.lean`): two unital binary
  operations, each a homomorphism for the other, coincide and are commutative (§13.3).
- `Order.Frame` (`Order/CompleteBooleanAlgebra.lean`) with `inf_sSup_eq`, `Order.Frame.MinimalAxioms` and
  `Order.Frame.ofMinimalAxioms`, and the frame instance on `TopologicalSpace.Opens` (`Topology/Sets/Opens.lean`):
  frames, for the locales of Layer 18.
- `Opens.grothendieckTopology` (`CategoryTheory/Sites/Spaces.lean`): the topology of open covers on the opens of
  a topological space, compared with the covering topology in a Check of §18.3.

### From Tau Ceti

- `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (`AlgebraicTopology/Quasicategory/Limit.lean`),
  `SSet.IsTerminalVertex`, `SSet.IsInitialVertex` (`Quasicategory/TerminalVertex.lean`, `InitialVertex.lean`):
  limit and colimit diagrams, final and initial objects. Pullback and pushout squares are their instances on
  `Λ[2,2]` and `Λ[2,0]` cones.
- `SSet.Edge.IsCartesian`, `SSet.CartesianFibration` (`Quasicategory/Cartesian.lean`): Cartesian edges and
  fibrations, with stability under base change and composition; coCartesian fibrations are those of the
  opposite map (§1.2, Layer 11, §17.1).
- `SSet.fullEnhancedSubcategory` (`Quasicategory/FullSubcategory.lean`): full subcategories such as `Shv(C) ⊆
  P(C)` and the sieves of §8.1.
- `SSet.catInfty` (`Quasicategory/CatInfty.lean`): the ∞-category of ∞-categories; one universe up it is `Ĉat∞`.
- `SSet.ihomOver` (`AlgebraicTopology/SimplicialSet/InternalHom.lean`): for p : X → S and f : K → S, the
  simplicial set of maps K → X over f; over the identity of S it is the ∞-category of sections of p (§11.3).
- `SSet.rlp_monomorphisms_iff` (`AlgebraicTopology/SimplicialSet/TrivialFibration.lean`): trivial fibrations are
  the maps with the right lifting property against all monomorphisms (§14.4).
- `SSet.KanComplex.π` (`AlgebraicTopology/SimplicialSet/KanComplex/HomotopyGroup.lean`): homotopy groups of Kan
  complexes (§7.7, §12.3, Layer 13).
- `SSet.evalAt` (`AlgebraicTopology/SimplicialSet/WeaklyContractible.lean`), `SSet.join`
  (`AlgebraicTopology/SimplicialSet/Join/Basic.lean`) and `SSet.join.stdSimplexIso`
  (`AlgebraicTopology/SimplicialSet/Join/StdSimplex.lean`): evaluation at a vertex, which at the vertex 1 of
  Δ[1] is the codomain fibration of Conventions 3, and the joins `K ⋆ Δ[0]` of the Lean statements (§1.2).

### From TauCetiRoadmap.InfinityCategoryTheory

Each item is cited, with its Lurie locator, in the *Needs:* lines that use it; nothing beyond the cited
statement is assumed.

- **Definitions, by owner Part:** Part InfinityCategoryFoundations §1.1 (size and the large ∞-categories), §1.2 (functor ∞-categories, cores and subcategories; cones; final objects, limits and colimits), §2.1 (homotopy categories, mapping objects, categorical equivalences) and §10.1 (n-categories; truncated objects); Part CartesianFibrations §1.1 (coCartesian fibrations); Part LimitsAndKanExtensions §2.1 (cofinality), §7.1 (relative colimits and Kan extensions), §8.1 (presheaves) and §9.1 (simplicial objects, groupoid objects and Čech nerves); Part AdjunctionsAndLocalizations §1.1 (adjunctions) and §2.1 (localizations; retracts); Part Straightening §2.1 (the universal Cartesian fibration and classifying maps); Part PresheavesAndCompletions §1.1 (the Yoneda embedding), §2.1 (idempotents and idempotent completeness), §4.1 (filtered ∞-categories), §5.1 (sifted simplicial sets) and §6.1 (κ-continuous functors and compact objects; Ind-objects); Part AccessibleInfinityCategories §4.1 (accessible ∞-categories and functors); Part PresentableInfinityCategories §1.1 (presentable and compactly generated ∞-categories) and §1.2 (local objects). The definitions of §1.1, §2.1, §3.1, §7.1 and §12.1 are this Part's own.
- **Part InfinityCategoryFoundations:** §2.2 Strict Segal sets are nerves; §2.4 Essential surjectivity and Dwyer–Kan equivalences; §4.3 Coslices and restriction along anodyne maps; §5.2 Mapping spaces; §5.3 Left fibrations over Kan complexes; §5.5 Final objects and the uniqueness of colimits; §7.1 Spaces, straightening, unstraightening and classifying maps; §8.1 The mapping-space comparison and the comparison theorem; §8.2 Final objects through the homotopy category; §8.3 Colimits in slices; §9.5 The Joyal model structure and its fibrant objects; §10.3 Minimal inner fibrations; §10.4 Minimal models; §10.6 n-categories and truncated mapping spaces; §10.7 Truncated objects and morphisms; §10.8 Truncated Kan complexes through boundary spheres.
- **Part CartesianFibrations:** §1.5 Coslice and prism criteria for coCartesian edges; §3.1 Invariance of slices under categorical equivalence; §3.4 Functor ∞-categories and the forms of categorical equivalence; §4.4 Arrow ∞-categories and comma fibrations; §5.5 Marked mapping objects and exponentials.
- **Part LimitsAndKanExtensions:** §1.1 Fat joins and their comparison with joins; §1.2 Fat slices; §2.5 Cofinal maps preserve colimits; §3.1 Rectifying diagrams in a combinatorial simplicial model category; §3.2 Homotopy colimits are ∞-categorical colimits; §3.4 Representable presheaves; §3.5 Tensors with simplicial sets; §3.6 Slices of simplicial model categories; §5.2 Closure properties; coCartesian fibrations are smooth; §5.4 Quillen's Theorem A for ∞-categories; §6.2 Right anodyne joins and assembling colimits over a decomposition; §6.3 Right anodyne nerve inclusions and κ-small colimits; §6.5 Reduction to pushouts, coproducts and coequalizers; §7.3 Relative colimits in fibrations; §7.4 Existence of Kan extensions; restriction is a trivial fibration; §7.5 Pointwise Kan extensions: invariance, transitivity and parameters; §7.6 Kan extensions along arbitrary functors; §8.2 Colimits in section and functor ∞-categories; §9.3 Groupoid objects and group objects; §9.4 Čech nerves and geometric realizations.
- **Part AdjunctionsAndLocalizations:** §1.5 Adjoints preserve limits and colimits; §1.7 Adjunctions from simplicial and Quillen adjunctions; §1.8 Kan extensions as left adjoints to restriction; §2.3 Reflective subcategories, reflections and localization functors; §2.5 Orthogonality and factorization systems.
- **Part Straightening:** §3.2 Limits in `Cat∞` and in spaces.
- **Part PresheavesAndCompletions:** §1.3 Yoneda's lemma; presheaves as colimits of representables; §1.4 The free cocompletion; §1.5 Adjunctions between presheaf ∞-categories; §2.3 Effective idempotents: colimits, limits and splittings; §5.2 Colimits in two variables; §6.2 κ-filtered colimits commute with κ-small limits in spaces.
- **Part AccessibleInfinityCategories:** §1.2 Initial objects and colimits in a categorical pullback; §2.2 κ-small colimits of κ-compact objects; §3.1 Essentially κ-small ∞-categories: five characterizations; §5.1 The generator characterization and presheaf ∞-categories; §5.4 Functors with adjoints are accessible; §5.5 κ-small limits of τ-compact objects; §6.2 Accessibility of functor ∞-categories; §8.8 Section ∞-categories in a subcategory of `Ĉat∞`.
- **Part PresentableInfinityCategories:** §1.5 Accessible localization functors; §1.6 The presentation theorem; §2.1 Representable presheaves, small limits and tensors; §2.2 Corepresentable functors and the adjoint functor theorem; §3.1 Products and functor ∞-categories; §3.2 Slices, fiber products and presheaves on slices; §4.1 Strongly saturated and saturated classes; §4.4 The localization `S⁻¹C` and its universal property; §4.5 The pullback criterion for left exact localizations; §4.6 Strongly reflective subcategories; §5.1 `Pr^L`, `Pr^R` and presentable fibrations; §5.2 Limits in `Pr^L` and `Pr^R`; §6.1 Truncated objects and morphisms under limits, slices and diagonals; §6.2 Truncation functors; §6.5 Left exact filtered colimits; §6.6 Left exact filtered colimits in presheaf ∞-categories.

### From TauCetiRoadmap.ModelCategoryTheory

- **Part ModelCategories:** §1.1 (κ-compact objects, HTT, Def. A.1.1.1), §3.4 and §3.5 (proper model
  categories and homotopy pullback squares, HTT, §A.2.4), §4.1 (Quillen adjunctions, HTT, §A.2.5).
- **Part KanQuillen:** §1.1 (homotopy groups of Kan complexes), §1.2 (the long exact sequence of a Kan
  fibration, with the action on the components of the fiber), §2.2 (`Ex^∞` as a Kan replacement), §1.3 (Whitehead's theorem), §3.2 and §3.4 (the Kan–Quillen model structure and its right properness,
  HTT, §A.2.7), §4.1–§4.3 (connective maps, the lifting criterion and homotopy pushouts), §5.1 (Postnikov sections of Kan
  complexes, and their compatibility with products).
- **Part SimplicialCategories:** §1.2 and §1.3 (simplicial sets as a simplicial model category, HTT,
  Ex. A.3.1.4, Def. A.3.1.5), for the slice comparison of §3.1 of this Part.

## How to read the build

The twenty layers fall into five stages, each resting on the ones before it; within a stage the layers are in
dependency order.

- **Descent and Giraud's theorem (Layers 1–4).** Layer 1 sets up Cartesian transformations and the two
  descriptions of universal colimits, through the classifying functor of `O_𝒳 → 𝒳` and through Cartesian
  transformations. Layer 2 turns them into descent along colimit diagrams and local classes and states the
  descent theorem. Layer 3 proves descent in `S`, then for every left exact presentation, and shows that descent
  implies Giraud's axioms; these are the implications (L) ⇒ (D) ⇒ (T) of Conventions 4. Layer 4 proves the hard
  implication (T) ⇒ (L) through left exactness at an object and groupoid resolutions, and assembles Giraud's
  theorem in §4.4, the first headline. From §4.4 on, "∞-topos" means any of the three descriptions.
- **Object classifiers, localizations, effective epimorphisms and sheaves (Layers 5–9).** Layer 5 characterizes
  ∞-topoi by object classifiers (Rezk). Layer 6 studies subobjects and topological localizations. Layer 7
  develops effective epimorphisms in semitopoi, their closure properties and descent, and identifies them in
  sets and in spaces. Layer 8 defines Grothendieck topologies and sheaves and proves that sheaves form an
  ∞-topos, the second headline; Layer 9 gives the universal property of sheaves and the canonical topology.
- **The ∞-category of ∞-topoi (Layers 10–11).** Layer 10 defines geometric morphisms, `LTop` and `RTop`,
  slices and points, proves that `S` is final in `RTop` through the universal property of Layer 9, and that
  filtered colimits in ∞-topoi are left exact. Layer 11 constructs limits in `LTop` and sections of topos
  fibrations.
- **Truncation, connectivity and delooping (Layers 12–15).** Layer 12 studies truncation and homotopy sheaves
  in a fixed ∞-topos, proves the subobject lemma that Layer 14 needs, and identifies homotopy sheaves,
  truncatedness and connectivity in `S` with the classical notions. Layer 13 treats group objects of
  ∞-categories with finite products and of ordinary categories, deloops connected pointed spaces, and
  defines Eilenberg–MacLane objects; it needs Layers 3, 7 and 12. Layer 14 develops n-connective morphisms,
  detects effective epimorphisms on 0-truncations, builds the connective and truncated factorization system,
  and ends with the connectivity of Eilenberg–MacLane objects. Layer 15 deloops in every ∞-topos and
  classifies Eilenberg–MacLane objects by their homotopy sheaves; it needs Layer 14, so it follows it.
- **n-topoi and locales (Layers 16–20).** Layer 16 defines n-topoi and their colimits. Layer 17 proves descent
  for truncated morphisms and derives the n-categorical Giraud axioms. Layer 18 treats n = 0: locales,
  0-topoi and the underlying locale of an ∞-topos. Layer 19 proves the n-categorical Giraud theorem and the
  characterization of n-topoi, and Layer 20 constructs localic reflection.

Reading paths follow from the dependencies, at section granularity where a layer is used only in part.
Giraud's theorem needs Layers 1–4. That sheaves form an ∞-topos needs Layers 1–4, 6 and 8, and their
universal property and the canonical topology add Layers 7 and 9. Delooping in spaces (§13.4–§13.5) needs
Layers 1–4, 6 and 7. The ∞-category of ∞-topoi and its limits need Layers 1–4 and 6–11. Connectivity
(§14.1–§14.8) needs Layers 1–4, 6, 7 and 12 with §10.1 and §10.4; Eilenberg–MacLane objects add §13.6 and
§14.9, and delooping and their classification in an ∞-topos add §13.1–§13.5 and Layer 15. n-topoi and
localic reflection need Layers 1–10, 12, §14.1–§14.8 and Layers 16–20.

Proof routes are Lurie's unless a section says where and why it departs from them.

## Layer 1: Universal colimits

### 1.1 Universal colimits and disjoint coproducts

**1.1.1.** For an ∞-category 𝒳, let `p : O_𝒳 → 𝒳` be the codomain fibration of Conventions 3. For f : U → V in 𝒳, the
restriction of p along f is a correspondence over Δ[1] whose fibers over 0 and 1 are the fat slices `𝒳^{/U}`
and `𝒳^{/V}` (HTT, §6.1.1, pp. 548–549, the setup of universality). Define a **pullback functor** along f as
any functor `f^* : 𝒳^{/V} → 𝒳^{/U}` associated (Part AdjunctionsAndLocalizations §1.1) to that correspondence,
with the identities of the two fibers as the equivalences onto the fibers. The fat slices are equivalent to the
join slices `𝒳_{/V}` and `𝒳_{/U}` (HTT, Prop. 4.2.1.5, p. 259; Part LimitsAndKanExtensions §1.2), and
preservation of colimits is invariant under these equivalences, so the definition does not need them. Define,
for 𝒳 presentable, colimits in 𝒳 to be **universal** when every pullback functor along every morphism
preserves small colimits (HTT, Def. 6.1.1.2, p. 550).

- Any two pullback functors along f are equivalent, since functors associated to a correspondence are unique
  up to equivalence; so universality does not depend on the choices.
- Universality of colimits is invariant under equivalence of presentable ∞-categories.

**Checks.**
- In the nerve of sets colimits are universal, matching Mathlib's universal colimits.
- In the nerve of abelian groups they are not: the coproduct of two copies of the identity of ℤ, pulled back along
  0 → ℤ, is ℤ, not 0.
- In the nerve of the five-element non-distributive lattice, binary joins are not stable under meets, so colimits
  are not universal; in the nerve of [1] they are.

*Needs:* Part InfinityCategoryFoundations §1.2 (`Fun(Δ[1], 𝒳)`, colimits); Part AdjunctionsAndLocalizations §1.1.2
(associated functors); Part LimitsAndKanExtensions §1.2.1 (fat slices; HTT, Prop. 4.2.1.5); Part PresentableInfinityCategories §1.1.1 (presentable).

**1.1.2.** Define coproducts in an ∞-category 𝒳 with finite coproducts to be **disjoint** when every pushout square `∅
→ X, ∅ → Y, X → X ⊔ Y, Y → X ⊔ Y` with ∅ initial is also a pullback square (HTT, §6.1.1, p. 552, the paragraph after
Prop. 6.1.1.4). `Suggested.lean` declaration `HasDisjointCoproducts`, with the initial object at the vertex (0, 0) of
the square. The `Suggested.lean` declaration is `isCartesian_evalAt_iff_isPullbackSquare`.

- Disjointness is invariant under equivalence of ∞-categories, and does not depend on the choice of the
  coproduct X ⊔ Y or of the initial object, both being unique up to equivalence.
- It involves only finite coproducts and pullbacks of coproduct inclusions, and no presentability.

**Checks.**
- In the nerve of sets coproducts are disjoint, matching Mathlib's `CategoryTheory.Limits.CoproductDisjoint`.
- In the nerve of [1] they are not: 1 ⊔ 1 = 1 and the pullback of 1 → 1 ← 1 is 1, not the initial object 0.
- In the nerve of abelian groups they are disjoint (`X ×_{X⊕Y} Y = 0`), although colimits there are not universal:
  the two axioms are independent.

*Needs:* Part InfinityCategoryFoundations §1.2.4.

### 1.2 The codomain fibration

**1.2.1.** Prove that, for an ∞-category 𝒳, an edge of `O_𝒳` is Cartesian for `p : O_𝒳 → 𝒳` exactly when the square in
𝒳 it represents is a pullback square. Consequently p is a Cartesian fibration exactly when 𝒳 has all pullbacks (HTT,
Lemma 6.1.1.1, p. 549). Proof route: compare the slice of `O_𝒳` over the edge with slices of 𝒳 through a simplicial
set of extensions over a prism, whose restriction map is a trivial fibration by horn filling; p is an inner fibration
because exponentials of inner fibrations are inner. The `Suggested.lean` declaration is
`cartesianFibration_evalAt_iff`. *Needs:* §1.1.1 (HTT, §6.1.1: `O_𝒳`); Part InfinityCategoryFoundations §1.2.4 (HTT,
Def. 1.2.13.4); Tau Ceti `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`, `SSet.slice.IsLimit`; Part
CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12); Mathlib `SSet.innerFibration_pullbackObjObjπ` (HTT, Cor. 2.3.2.5,
first half); Part InfinityCategoryFoundations §5.3.2 (HTT, Lemma 2.1.3.4).

### 1.3 Universal colimits through the classifying functor

**1.3.1.** Prove that, for an ∞-category 𝒳 with finite limits, two conditions are equivalent (HTT, Prop. 6.1.1.4,
p. 551). (1) 𝒳 is presentable and its colimits are universal. (2) The Cartesian fibration `O_𝒳 → 𝒳` of
§1.2 is classified by a functor `𝒳ᵒᵖ → Pr^L`. Concretely, (2) says that every slice `𝒳_{/U}` is
presentable and every pullback functor `f^* : 𝒳_{/V} → 𝒳_{/U}` preserves small colimits. Proof route:
(1) ⇒ (2) because slices of presentable ∞-categories are presentable. For (2) ⇒ (1), 𝒳 has a final
object 1 and 𝒳 is equivalent to `𝒳_{/1}`.
*Needs:* §1.2.1; §1.1.1 (HTT, Def. 6.1.1.2); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part InfinityCategoryFoundations §1.2 (HTT,
Def. 1.2.12.3: final objects); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part PresentableInfinityCategories §5.1.1 (HTT, Def. 5.5.3.1)
and §3.2.1 (HTT, Prop. 5.5.3.10: slices of presentable ∞-categories).

### 1.4 Cartesian transformations

**1.4.1.** Define, for an ∞-category 𝒳, a simplicial set K and diagrams `p, q : K → 𝒳`, a natural transformation
`α : p → q` (a map `K × Δ[1] → 𝒳`) to be **Cartesian** when, for every edge `φ : x → y` of K, the square
with top `p(φ)`, bottom `q(φ)` and vertical edges `α(x)`, `α(y)` is a pullback square in 𝒳 (HTT,
Def. 6.1.3.1, p. 562).

- Cartesianness depends only on the homotopy class of α in `Fun(K, 𝒳)`, and is checked edge by edge.
- Identities and equivalences of diagrams are Cartesian. Composites of Cartesian transformations are
  Cartesian, by pasting of pullback squares.
- **1.4.2.** Prove that a transformation of diagrams indexed by the fat right cone `K ⋄ Δ[0]` is Cartesian as soon
  as its restriction to every `{x} ⋄ Δ[0]` is Cartesian (HTT, Lemma 6.1.3.2, p. 562). Proof route: every
  edge `x → y` of the cone fits into a square whose other edges go to the cone point and are either covered
  by hypothesis or degenerate. Two applications of the pasting lemma give the edge.
  *Needs:* §1.4.1; Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1: the fat join) and §6.5.1
  (HTT, Lemma 4.4.2.1: pasting).

**Checks.**

- For K = Δ[0] there are no nondegenerate edges, so every transformation is Cartesian. A definition that
  also asked each component to be an equivalence would fail here, on `∅ → ∗` in `S`.
- For K = Δ[1] and 𝒳 = `S`, let p be the edge `∅ → ∗` and q the first inclusion `i₁ : ∗ → ∗ ⊔ ∗`, with
  α(0) the map `∅ → ∗`. If α(1) is the second inclusion `i₂`, the square is a pullback, because the
  pullback of `i₂` along `i₁` is empty. If α(1) is `i₁`, the square still commutes (its corner is
  initial) but it is not a pullback, because the pullback of `i₁` along itself is a point. A definition
  requiring only commutativity would accept both transformations.
- On nerves of 1-categories with pullbacks, Cartesian transformations are exactly the natural
  transformations all of whose naturality squares are pullbacks. These are the equifibered transformations
  that underlie Mathlib's `CategoryTheory.IsUniversalColimit`; a definition using pushout squares would
  disagree with Mathlib on the category of sets.

*Needs:* Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2: functor ∞-categories; Def. 1.2.13.4: pullbacks; HTT, §1.2.8: cones); Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1: the fat join) and §6.5.1
(HTT, Lemma 4.4.2.1).

### 1.5 Universal colimits through Cartesian transformations

**1.5.1.** Prove that for a presentable ∞-category 𝒳 the following are equivalent (HTT, Lemma 6.1.3.3, p. 563):
1. Colimits in 𝒳 are universal.
2. For diagrams `p, q : K^▷ ⋄ Δ[0] → 𝒳` sending the last vertex to X and Y, and a Cartesian
   `α : p → q`, if the associated diagram `K^▷ → 𝒳_{/Y}` of q is a colimit diagram, then so is the
   associated diagram `K^▷ → 𝒳_{/X}` of p.
3. The same with the join `K ⋆ Δ[1]` in place of the fat join.
4. For Cartesian `α : p → q` of diagrams `K ⋆ Δ[1] → 𝒳`, if the restriction of q to `K ⋆ {0}` is a
   colimit diagram, then so is that of p.
5. For every Cartesian `α : p → q` of diagrams `K^▷ → 𝒳`, if q is a colimit diagram then p is one.

Proof route: (1) ⇔ (2) is a translation of the pullback functors through §1.2 and the slice colimits of
Part InfinityCategoryFoundations. (2) ⇔ (3) compares the fat join with the join. (3) ⇔ (4) is the computation of
colimits in slices. (4) ⇔ (5) restricts along the cone point.
*Needs:* §1.2.1, §1.4.1, §1.4.2; §1.1.1 (HTT, Def. 6.1.1.2; §6.1.1: pullback functors); Part PresentableInfinityCategories §1.1.1 (HTT,
Def. 5.5.0.1); Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8) and §5.5.4 (HTT, Rem. 1.2.13.5); Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1), §1.1.2 (HTT, Prop. 4.2.1.2); Part CartesianFibrations §5.5.3 (HTT, Prop. 3.1.2.1).

### 1.6 Initial objects and coproduct inclusions

**1.6.1.** Prove that, in a presentable ∞-category with universal colimits, an object that admits a morphism to an
initial object is itself initial (HTT, Lemma 6.1.3.6, p. 565). Proof route: for `f : X → ∅`, the pullback
functor `f^*` preserves limits because it is a right adjoint, and colimits because colimits are universal.
It sends `id_∅`, initial and final in `𝒳_{/∅}`, to `id_X`, which is then initial in `𝒳_{/X}`, so X is
initial by the slice colimit criterion.
*Needs:* §1.1.1 (HTT, Def. 6.1.1.2: pullback functors as right adjoints); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7:
adjunctions); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); 
Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8).

**1.6.2.** Prove that, in a presentable ∞-category with universal colimits and disjoint coproducts, a square with sides
the coproduct inclusions `φᵢ : Zᵢ → Z` and `φⱼ` and corner W is a pullback square in two cases (HTT,
Lemma 6.1.5.1, p. 579). For i ≠ j, it is a pullback exactly when W is initial. For i = j, it is a pullback
exactly when the edge `W → Zᵢ` is an equivalence. Proof route: in `𝒳_{/Z}` the identity of Z is the
coproduct of `φᵢ` and the inclusion of the complementary summand. Pull back along `φᵢ` and use
universality, disjointness for the cross term, §1.6.1, and uniqueness of
initial objects.
*Needs:* §1.6.1; Conventions 5; §1.1.1 (HTT, Def. 6.1.1.2; §6.1.1: disjoint coproducts); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part InfinityCategoryFoundations §5.5.3
(HTT, Prop. 1.2.12.9) and §8.3.1 (HTT, Prop. 1.2.13.8).

### Examples

- `S`: colimits are universal and coproducts are disjoint; Layer 3 proves both.
- The nerve of the category of sets: universal colimits and disjoint coproducts in the 1-categorical sense
  of Mathlib's `CategoryTheory.IsUniversalColimit` and `CategoryTheory.Limits.CoproductDisjoint`. §1.5
  restricted to nerves recovers the classical statement that universal colimits are stable under
  equifibered pullback.
- Non-example: in the nerve of the category of abelian groups the pullback of the initial object 0 along
  `ℤ → 0` is ℤ, which is not initial, so §1.6 fails there. Colimits there are not universal.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, CartesianFibrations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, Straightening, PresentableInfinityCategories; Mathlib `SSet.innerFibration_pullbackObjObjπ`; Tau Ceti `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`, `SSet.slice.IsLimit`. No earlier layer of this Part. Within the layer: 1.2 uses 1.1; 1.3 uses 1.1, 1.2; 1.5 uses 1.1, 1.2, 1.4; 1.6 uses 1.1.

## Layer 2: Descent and local classes

### 2.1 Classes stable under pullback

**2.1.1.** Define, for an ∞-category 𝒳 with pullbacks and a class S of morphisms, S to be **stable under pullback** when
every pullback of a member is a member. Write `O^S_𝒳 ⊆ O_𝒳` for the full subcategory on S, and `O^{(S)}_𝒳` for
the subcategory with the same objects whose morphisms are the pullback squares (HTT, Notation 6.1.3.4, p. 564).
Stability under pullback is what §2.2 needs: by §1.2, the Cartesian lifts in `O_𝒳` of a member of S are
pullbacks of it, so they stay in `O^S_𝒳`.

- Stable classes are closed under intersections and unions.
- A stable class contains, with a member f, every morphism equivalent to f in `Fun(Δ[1], 𝒳)`, since such a
  morphism is a pullback of f along an equivalence.

**Checks.**
- In the nerve of sets the maps with nonempty source are stable under pushout but not under pullback: the
  pullback of `{0} → {0,1}` along `{1} → {0,1}` is `∅ → {1}`; a definition through pushouts would accept this
  class.
- In the nerve of sets the non-surjective injections are stable under pushout (`C → C ⊔ (B ∖ A)` still misses
  `B ∖ A`) but not under pullback: pulling `{0} → {0,1}` back along itself gives the identity of `{0}`.
- Morphisms with initial source are not stable in the nerve of abelian groups: the pullback of 0 → Y along
  X → Y is the kernel of X → Y. In the nerve of sets they are stable, since a pullback of ∅ is ∅.

*Needs:* Part InfinityCategoryFoundations §1.2 (functor ∞-categories, subcategories, pullback squares); §1.1.1 (`O_𝒳`); §1.2.1.

### 2.2 Descent along a colimit diagram

**2.2.1.** Prove the following for a presentable ∞-category 𝒳 with universal colimits, a class S of morphisms stable
under pullback, and a small colimit diagram `q̄ : K^▷ → 𝒳` (HTT, Lemma 6.1.3.5, p. 564). Three conditions
are equivalent:
1. The composite of q̄ with the classifying map `𝒳ᵒᵖ → Ĉat∞` of the Cartesian fibration `O^S_𝒳 → 𝒳` is a
   limit diagram.
2. The same holds for the classifying map `𝒳ᵒᵖ → Ŝ` of the right fibration `O^{(S)}_𝒳 → 𝒳`.
3. For every transformation `ᾱ : p̄ → q̄` with p̄ a colimit diagram, whose restriction to K is Cartesian
   with components in S, the transformation ᾱ is Cartesian and its component at the cone point lies in S.

Proof route: express limits of classifying maps through sections of the corresponding fibrations. (1) ⇔
(2) compares the Cartesian fibration with its maximal right subfibration. (2) ⇔ (3) identifies sections
over `K^▷` with transformations into q̄, using §1.5 for the colimit condition; restriction from the colimit
diagrams in `Fun(K^▷, 𝒳)` to `Fun(K, 𝒳)` is a trivial fibration, K being an arbitrary small simplicial set
(Part LimitsAndKanExtensions §7.4, its last statement). The route uses it in its slice form: if
`D ⊆ Fun(K^▷, 𝒳)` denotes the colimit diagrams, the trivial fibration `D → Fun(K, 𝒳)` induces a trivial
fibration `D_{/q̄} → Fun(K, 𝒳)_{/q}`, with q = q̄|K, which restricts to the transformations that are
Cartesian with components in S. Indeed `D_{/q̄} → D ×_{Fun(K, 𝒳)} Fun(K, 𝒳)_{/q}` has the right lifting
property against `∂Δ[n] ⊆ Δ[n]`, because such a problem is a lifting problem for the trivial fibration
`D → Fun(K, 𝒳)` against the monomorphism `(∂Δ[n] ⋆ Δ[0]) ⊔_{∂Δ[n]} Δ[n] ⊆ Δ[n] ⋆ Δ[0] = Δ[n+1]`, and the
second map is a pullback of `D → Fun(K, 𝒳)`.
*Needs:* §1.4.1, §1.5.1; §1.1.1 (HTT, Def. 6.1.1.2) and §2.1.1 (HTT, Notation 6.1.3.4); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1; Cor. 3.3.3.3) and Part LimitsAndKanExtensions §7.4.7 (HTT,
Prop. 4.3.2.15, for colimit diagrams indexed by a simplicial set); Mathlib `SSet.rlp_monomorphisms`; Tau Ceti
`SSet.join`, `SSet.slice`; Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential surjectivity).

### 2.3 Local classes

**2.3.1.** Define a class S of morphisms of a presentable ∞-category 𝒳 with universal colimits to be **local** when
it is stable under pullback and satisfies the equivalent conditions below (HTT, Def. 6.1.3.8, p. 566). Prove
that these conditions are equivalent (HTT, Lemma 6.1.3.7, p. 565):
1. The classifying map `𝒳ᵒᵖ → Ĉat∞` of `O^S_𝒳` carries colimits of 𝒳 to limits.
2. The same holds for `O^{(S)}_𝒳` and `Ŝ`.
3. S is stable under small coproducts in `O_𝒳`, and S satisfies a pushout condition. Take a pushout
   square in `O_𝒳` with corners `f → g`, `f → f′`, `g → g′`, `f′ → g′`, in which the two edges out of f
   are Cartesian and f, f′, g lie in S. Then the two edges into g′ are Cartesian and g′ lies in S.

Proof route: (1) ⇔ (2) by §2.2 applied to every colimit diagram. For (3), it suffices to test pushouts and
small coproducts; there condition (3) of §2.2 becomes the stated pushout condition and, by §1.6, stability
under coproducts.

- Local classes are closed under intersections of nonempty families, since each condition of (3) is
  checked class by class. The class of equivalences is local in every presentable ∞-category with universal
  colimits.

**Checks.**

- The class of equivalences is local. Its fibration `O^{(S)}_𝒳 → 𝒳` has contractible fibers, so its
  classifying map is constant at the point, and a constant point diagram is a limit diagram over every
  shape.
- The empty class is stable under pullback (vacuously) but not local. At the empty diagram, condition (1)
  asks the fiber of `O^S_𝒳` over an initial object to be the point, and for the empty class that fiber is
  empty. A definition of locality that tested only nonempty colimits, or that dropped the empty coproduct
  from (3), would accept the empty class.
- In the nerve of the category of sets, which is presentable with universal colimits, the class of all
  morphisms is not local. The coequalizer of the two identity maps of a point is a point. The
  corresponding limit of slices is the ∞-category of sets equipped with an automorphism, which is not the
  slice over a point. Coproducts and the empty colimit cause no failure here, since a slice over a
  coproduct of sets is the product of the slices. So a definition testing only coproducts would accept
  this class.

*Needs:* §1.4.1, §1.6.1, §2.2.1; §1.1.1 (HTT, Def. 6.1.1.2) and §2.1.1 (HTT, Notation 6.1.3.4); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part LimitsAndKanExtensions §6.5.3 (HTT, Cor. 4.4.2.4: finite colimits, finite
coproducts in particular, from initial objects and pushouts; Prop. 4.4.2.7: preservation of colimits tested on pushouts and coproducts).

### 2.4 The descent theorem

**2.4.1.** Define a presentable ∞-category 𝒳 to **satisfy descent** when it meets the following condition (HTT,
Thm. 6.1.0.6 (2), p. 547). Let K be a small simplicial set, `ᾱ : p̄ → q̄` a transformation of diagrams
`K^▷ → 𝒳`, q̄ a colimit diagram, and the restriction `α = ᾱ|K` Cartesian. Then p̄ is a colimit diagram if
and only if ᾱ is Cartesian. This is condition (D) of Conventions 4.

- The "if" half, for all K, is universality of colimits (§1.5 (5)); the "only if" half is effectiveness.
- Descent is inherited by slices `𝒳_{/X}`, since colimits and pullbacks in a slice are computed in 𝒳.

**Checks.**

- For K = ∅, q̄ picks an initial object and ᾱ has no edges, so ᾱ is always Cartesian. The condition then
  says that every object admitting a morphism to an initial object is initial, which is §1.6. It fails in
  the nerve of the category of abelian groups, for `ℤ → 0`. A condition with only the "only if" half would
  be vacuous at K = ∅.
- For K = Δ[0] ⊔ Δ[0], take q̄ a coproduct diagram `X → X ⊔ Y ← Y`, and p̄ the diagram `X → X ← ∅` with
  the evident map to q̄. p̄ is a colimit diagram, so descent forces ᾱ to be Cartesian. That says the
  pullback of `X → X ⊔ Y` along itself is X, and along `Y → X ⊔ Y` it is ∅: coproducts are disjoint. The
  nerve of the poset {0 < 1} is presentable with universal colimits (it is a frame), but `1 ⊔ 1 = 1` with
  pullback 1, not 0, so it fails descent; a condition without the "only if" half would accept it.
- For K a pair of parallel edges, take q̄ the coequalizer of the two identities of a point, and p̄ built
  from the identity and the swap of a two-point set, mapping to q̄; the restriction to K is Cartesian. In
  `S`, the colimit of p̄ is a circle double covering the circle colimit of q̄, and the square at the cone
  point is a pullback. In the nerve of sets both colimits are a point and the square is not a pullback. A
  version of descent computed with 1-categorical colimits would be false in `S`.

*Needs:* §1.4.1, §1.5.1; §1.1.1 (HTT,
Def. 6.1.1.2); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4); Part InfinityCategoryFoundations §5.5.4 (HTT, Prop. 1.2.12.9 and Rem. 1.2.13.5).

**2.4.2.** Prove that for a presentable ∞-category 𝒳 the following are equivalent (HTT, Thm. 6.1.3.9, p. 566):
1. Colimits in 𝒳 are universal, and in every pushout square of `O_𝒳` as in §2.3 (3) whose edges out of
   the initial corner are Cartesian, the edges into the final corner are Cartesian.
2. Colimits in 𝒳 are universal and the class of all morphisms of 𝒳 is local.
3. `O_𝒳 → 𝒳` is classified by a limit-preserving functor `𝒳ᵒᵖ → Pr^L`.
4. 𝒳 satisfies descent.

Proof route: (1) ⇔ (2) is §2.3 (3) for the class of all morphisms, for which stability under coproducts
and membership of g′ are automatic. (2) ⇔ (3) is §1.3 together with the fact that the inclusion of `Pr^L` into `Ĉat∞` preserves
limits. (2) ⇔ (4) is §2.2 (3) for the class of all morphisms. The condition there says that a Cartesian
transformation over K extends to a Cartesian transformation over `K^▷` with colimit source, and that
condition, together with universality from §1.5, is the biconditional.
*Needs:* §1.3.1, §1.5.1, §2.2.1, §2.3.1; §1.1.1 (HTT, Def. 6.1.1.2); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part PresentableInfinityCategories §5.1.1
(HTT, Def. 5.5.3.1) and §5.2.1 (HTT, Prop. 5.5.3.13: limits in `Pr^L` are computed in `Ĉat∞`).

### Examples

- `S` satisfies the conditions of the descent theorem, and so do all presheaf ∞-categories; Layer 3 proves
  both.
- In `S`, the descent condition for a pushout says: if a space E maps to a homotopy pushout `A ⊔_C B`, then
  E is the homotopy pushout of its restrictions to A, B and C. This is the classical Mather cube theorem.
- Non-example: the nerve of the category of sets has universal colimits but not descent (§2.4, third
  Check).

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, Straightening, PresentableInfinityCategories. Earlier layers of this Part: Layer 1. Within the layer: 2.2 uses 2.1; 2.3 uses 2.1, 2.2; 2.4 uses 2.2, 2.3.

## Layer 3: ∞-topoi and descent

### 3.1 Effective groupoids and ∞-topoi

**3.1.1.** Define a groupoid object U of an ∞-category 𝒳 (Part LimitsAndKanExtensions §9.1) to be **effective** when it
extends to a colimit diagram `N(Δ₊)^op → 𝒳` that is a Čech nerve (HTT, Def. 6.1.2.14, p. 561).

- Effectiveness is invariant under equivalence of groupoid objects.
- An effective groupoid object U is the Čech nerve of the map from U₀ to its colimit.

**Checks.**
- In the nerve of sets the groupoid object with `U₀` a point and `U₁ = ℤ/2` is not effective; in S it is, with
  colimit the classifying space of ℤ/2.
- In the nerve of sets the underlying groupoid object of the Čech nerve of a surjection is effective: its
  colimit is the target.
- Asking only for a colimit diagram would not suffice: in the nerve of sets the groupoid above has a colimit,
  a point, but the Čech nerve of the point is constant, so its degree-1 term is a point and not ℤ/2.

*Needs:* Part LimitsAndKanExtensions §9.1.2 (groupoid objects), §9.1.3 (Čech nerves); Part InfinityCategoryFoundations §1.2.4 (colimit
diagrams).

**3.1.2.** Define an ∞-category 𝒳 to be an **∞-topos** when it satisfies the ∞-categorical Giraud axioms: 𝒳 is
presentable, colimits in 𝒳 are universal, coproducts in 𝒳 are disjoint, and every groupoid object of 𝒳 is
effective (HTT,
Thm. 6.1.0.6, condition (3), p. 548). This departs from Lurie's definition, which asks for a left exact
presentation (HTT, Def. 6.1.0.4, p. 547; §3.1.3): the Giraud axioms are intrinsic and need no choice
of a presentation. The two definitions are equivalent by Giraud's theorem for ∞-topoi (HTT, Thm. 6.1.0.6,
(1) ⇔ (3)), §4.4. A roadmap that wants Lurie's form cites the definition here and that theorem.

- Being an ∞-topos is invariant under equivalence of ∞-categories.
- It is a property of 𝒳, not a structure on it: no presentation or site is chosen.

**Checks.**
- Δ[0] is an ∞-topos: it is presentable, and its single object is initial and final, so every square is a
  pullback and every simplicial object is a Čech nerve with a colimit.
- The nerve of sets is not: it satisfies the classical axioms, but the groupoid object with `U₁ = ℤ/2` is not
  effective there. The definition is not the 1-categorical one.
- The nerve of [1] fails disjointness and the nerve of abelian groups fails universality.

*Needs:* Part PresentableInfinityCategories §1.1.1; Part LimitsAndKanExtensions §9.1.2 (groupoid objects); §1.1.1, §1.1.2; §3.1.1 (effective
groupoids).

**3.1.3.** Define a **left exact presentation** of an ∞-category 𝒳 as a small ∞-category C together with a localization
`f : P(C) → 𝒳` (Part AdjunctionsAndLocalizations §2.1), with fully faithful right adjoint g, such that f is
left exact and the localization functor `g ∘ f` is accessible (HTT, Def. 6.1.0.4, p. 547, Lurie's definition
of ∞-topos). This is condition (L) of Conventions 4. That 𝒳 is an ∞-topos exactly when it has a left exact
presentation is Giraud's theorem, §4.4.

- A left exact presentation of 𝒳, composed with an equivalence 𝒳 → 𝒳′, is a left exact presentation of 𝒳′.
- It is structure on 𝒳, and 𝒳 may have many: the second Check below gives a family of them for Δ[0].

**Checks.**
- `P(C)` with the identity is a presentation.
- Δ[0] has the presentation by C = ∅, since `P(∅)` is Δ[0], and also `P(C) → Δ[0]` for every C.
- 0-truncation S → N(Set) is an accessible localization of `P(Δ[0])` that is not left exact: the pullback of
  Δ[0] → S¹ ← Δ[0] is ℤ, which it keeps, while the truncated cospan is a cospan of points, with pullback a
  point.

*Needs:* Part LimitsAndKanExtensions §8.1.1; Part AdjunctionsAndLocalizations §2.1.1; Part AccessibleInfinityCategories §4.1.2; Part InfinityCategoryFoundations §1.2.4.

### 3.2 Descent in spaces

**3.2.1. Gluing homotopy Cartesian squares.** Call a map of arrows `φ → ψ` in `SSet` (a commutative square)
**homotopy Cartesian** when the square is a homotopy pullback square for the Kan–Quillen model structure.
Prove two statements about a pushout square in the category of arrows of `SSet`, with corners φ, ψ, φ′,
ψ′, maps `p : φ → ψ` and `q : φ → φ′`, and induced maps `p′ : φ′ → ψ′` and `q′ : ψ → ψ′`, where p and q
are homotopy Cartesian and q is a cofibration (HTT, Lemma 6.1.3.12, p. 567). (1) p′ and q′ are homotopy
Cartesian. (2) A map of arrows `r : ψ′ → θ` is homotopy Cartesian as soon as `r ∘ p′` and `r ∘ q′` are.
Proof route: replace each arrow by a minimal Kan fibration. Between minimal Kan fibrations, homotopy
Cartesian squares are strict pullbacks, because fiberwise equivalences of minimal fibrations are
isomorphisms. Then glue the strict pullbacks along the cofibration.
*Needs:* ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7: the Kan–Quillen model structure);
ModelCategoryTheory, Part ModelCategories §3.5.3 (HTT, §A.2.4: homotopy pullback squares); Part InfinityCategoryFoundations §10.3.1 (HTT, Def. 2.3.3.1: minimal fibrations) and §10.4.1 (HTT, Prop. 2.3.3.8); Mathlib
`SSet.anodyneExtensions` (HTT, Ex. 2.0.0.1: Kan fibrations as maps lifting against anodyne maps).

**Checks** (homotopy Cartesian squares).

- A strict pullback square of Kan fibrations is homotopy Cartesian. The square with `∅ → ∗` on the left
  and the identity of ∗ on the right commutes but is not homotopy Cartesian: the homotopy fiber of the
  left map is ∅ while that of the right map is ∗. A definition asking only for commutativity would accept
  it.
- The square with the inclusion `∗ → Δ[1]` on the left, the identity of ∗ on the right and the collapse
  `Δ[1] → ∗` at the bottom is homotopy Cartesian although it is not a strict pullback (the strict pullback
  is Δ[1]). A definition through strict pullbacks would reject this weak equivalence of arrows.
- The square from `∗ → S¹` (a point of a simplicial circle) to the identity of `S¹`, with the identity on
  the base, is not homotopy Cartesian: the homotopy fibers are ΩS¹ ≃ ℤ and ∗. A definition testing the
  square only on π₀ would accept it, since all four corners are connected.

**3.2.2.** Prove that colimits in `S` are universal, and that `S` satisfies the pushout condition (1) of the descent
theorem in §2.4 (HTT, Lemma 6.1.3.14, p. 568). Proof route: realize `S` as the simplicial
nerve of Kan complexes. For a Kan fibration `f : X → Y`, the comparison of slices of simplicial model categories (Part LimitsAndKanExtensions §3.6 (HTT, Lemma 6.1.3.13)) identifies
`S_{/X} → S_{/Y}` with the nerve of composition with f on simplicial sets over X and Y. Pullback along f is a
left Quillen functor there, because the Kan–Quillen model structure is right proper. So the derived pullback
has a right adjoint and preserves colimits. For the pushout condition, rectify a pushout square in `O_S` to a
strictly commuting diagram of Kan complexes. Homotopy colimits there compute ∞-categorical colimits. Then
apply §3.2.1.
*Needs:* §1.4.1, §2.4.2, §3.2.1; §1.1.1 (HTT,
Def. 6.1.1.2); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1), §3.1.1 (HTT, Prop. 4.2.4.4) and §3.6.1 (HTT,
Lemma 6.1.3.13); Part AdjunctionsAndLocalizations §1.7.1 (HTT, Cor. 5.2.4.5; Prop. 5.2.4.6) and §1.5.1 (HTT, Prop. 5.2.3.5);
ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1) and §4.1.1 (HTT, §A.2.5: Quillen
adjunctions); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7: the Kan–Quillen model structure) and
§3.4.1 (right properness); ModelCategoryTheory, Part SimplicialCategories §1.2.2 (HTT, Ex. A.3.1.4) and §1.3.1 (HTT,
Def. A.3.1.5), so that the slice comparison applies to simplicial sets as a simplicial model category.

### 3.3 Descent for left exact presentations

**3.3.1.** The localization step: prove that if 𝒳 is presentable with universal colimits and `L : 𝒳 → 𝒴` is an
accessible, left exact, reflective localization, then colimits in 𝒴 are universal (HTT, Lemma 6.1.3.15,
p. 569). Proof route: use characterization (5) of §1.5. Given a Cartesian transformation into a colimit
diagram of 𝒴, apply the right adjoint, which preserves pullbacks. Take colimits in 𝒳 and use universality
there. Then apply L, which preserves colimits and pullbacks and is inverse to the inclusion on 𝒴.
*Needs:* §1.5.1; §1.1.1 (HTT,
Def. 6.1.1.2); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.2 (HTT, Def. 5.4.2.5); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.4) and §1.5.1 (HTT, Prop. 5.2.3.5).

**3.3.2.** Prove that every ∞-category with a left exact presentation (condition (L)) has universal colimits and
satisfies the pushout condition (1) of §2.4 (HTT, Prop. 6.1.3.10, p. 566). With the descent theorem of
§2.4 this is the implication (L) ⇒ (D) of Giraud's theorem (HTT, Thm. 6.1.0.6, (1) ⇒ (2), p. 547). Proof
route, following Lurie: call a presentable ∞-category good when both conditions hold. `S` is good by
§3.2. Goodness passes to `Fun(K, 𝒳)` for small K, because colimits and pullbacks there are computed
pointwise, so every `P(C)` is good. Goodness passes along accessible left exact localizations: universality
by §3.3.1, and the pushout condition by computing the pushout in 𝒳 and applying L.
*Needs:* §2.4.2, §3.2.2, §3.3.1; §1.1.1 (HTT, Def. 6.1.1.2) and §3.1.3 (HTT, Def. 6.1.0.4); Part LimitsAndKanExtensions §8.1.1 (HTT,
Def. 5.1.0.1); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part AdjunctionsAndLocalizations §2.3.1 (HTT,
Prop. 5.2.7.4).

### 3.4 Extra degeneracies and colimits

**3.4.1.** Let `Δ_∞` be the category of finite linearly ordered sets J, where a morphism `J → J′` is an
order-preserving map `J ∪ {∞} → J′ ∪ {∞}` fixing ∞, where ∞ is adjoined as the largest element
(HTT, Lemma 6.1.3.16, p. 571). Thus `Δ₊` is the subcategory of maps sending J into J′,
and a functor on `N(Δ_∞)ᵒᵖ` is an augmented simplicial object with an extra degeneracy in each degree.

**Checks** (the category `Δ_∞`).

- From ∅ to ∅ there is exactly one morphism (∞ ↦ ∞), and from `[0]` to ∅ exactly one (everything to ∞),
  which `Δ₊` lacks. A definition with order-preserving maps `J → J′` only would be `Δ₊` itself, over
  which the extension condition says nothing.
- From `[1]` to `[0]` there are three morphisms, sending (0, 1) to (0, 0), (0, ∞) or (∞, ∞), against one
  in `Δ₊`; the two extra ones are the extra degeneracies. A definition dropping order preservation would
  also allow (∞, 0), giving four.
- The constant augmented simplicial object at an object X extends to `N(Δ_∞)ᵒᵖ`, and its colimit is X, as
  the statement below predicts. The nerve of a nontrivial group, augmented to ∗, does not extend, and its
  colimit in `S` is BG, not ∗.

Prove that an augmented simplicial object of an ∞-category 𝒳 that extends to `N(Δ_∞)ᵒᵖ → 𝒳` is a colimit
diagram (HTT, Lemma 6.1.3.16, p. 571). Proof route: let P be the category of pairs `(J, J₊)` with `J₊ ⊆ J`
upward closed, mapping to `Δ_∞` by `(J, J₊) ↦ J − J₊`, and pull F back to F′ on `N(P)ᵒᵖ`. The pairs with
`J₊ = ∅` form `Δ₊`. By Theorem A, with the final objects `(J, ∅) → (J, J₊)` and `(J₊, J₊) → (J, J₊)` of the
comma categories, the inclusion of Δ into the pairs with J nonempty, and of the pairs with `J = J₊` into
those with `J₊` nonempty, are cofinal on opposites. For a pair `(J, ∅)` the maps to pairs `(J′, J′₊)` with
`J ≅ J′ − J′₊` form a cofinal subcategory on which the diagram is constant and indexed by `N(Δ₊)ᵒᵖ`, a
weakly contractible shape; so F′ on the pairs with J nonempty is left Kan extended from the pairs with `J₊`
nonempty. The relative-colimit lemma for Kan extensions chains the two steps.
*Needs:* Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1), §2.5.2 (HTT, Prop. 4.1.1.8: cofinal maps
preserve colimits), §3.5.2 (HTT, Cor. 4.4.4.10) and §7.4.1 (HTT, Lemma 4.3.2.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1), §7.1.2 (HTT, Def. 4.3.2.2) and §9.1.1 (HTT,
Def. 6.1.2.2); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3).

**3.4.2.** The main example is the shift. For a simplicial object U of 𝒳, let U′ be the augmented simplicial object
`J ↦ U(J ⊔ {∞})`. Prove that U′ is a colimit diagram, and that, when U is a groupoid object, the evident
transformation from the restriction of U′ to `N(Δ)ᵒᵖ` to U is Cartesian (HTT, Lemma 6.1.3.17, p. 572).
Proof route: U′ extends to `N(Δ_∞)ᵒᵖ`, so §3.4.1 applies. Cartesianness reduces, by the pasting
lemma, to the squares along the vertex inclusions `{j} ⊆ J`, with corners `U(J ⊔ {∞})`, `U(J)`,
`U({j, ∞})`, `U({j})`. These are pullbacks by the pullback form of the groupoid condition.
*Needs:* §1.4.1, §3.4.1; Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2; Def. 6.1.2.7); Part LimitsAndKanExtensions §9.3.1 (HTT, Prop. 6.1.2.6, pullback form); Part LimitsAndKanExtensions §6.5.1 (HTT,
Lemma 4.4.2.1).

### 3.5 Descent implies the Giraud axioms

**3.5.1.** Prove that a presentable ∞-category satisfying the equivalent conditions of §2.4 satisfies Giraud's axioms
(HTT, Prop. 6.1.3.19, p. 573). This is the implication (D) ⇒ (T) of Giraud's theorem (HTT, Thm. 6.1.0.6,
(2) ⇒ (3), p. 547). Proof route: presentability and universality are part of the hypothesis. For
disjointness, form in `O_𝒳` the pushout of the two edges out of `id_∅` (an initial object of `O_𝒳`), to
`id_Y` and to `∅ → X`. The first edge is a trivially Cartesian square; the second is Cartesian by §1.6. The
pushout condition (1) of §2.4 makes both edges into the pushout `Y → X ⊔ Y` Cartesian. The edge from
`∅ → X` is the coproduct square with corners ∅, Y, X, X ⊔ Y, so `X ×_{X⊔Y} Y` is initial. For effectiveness, let U be a groupoid object, Ū an extension of U to a colimit diagram,
and U′ the shift of §3.4. Descent makes the transformation from U′ to Ū Cartesian. The square with corners
`U₁`, `U₀`, `U₀`, `Ū₋₁` is then a pullback square, so U is the Čech nerve of `U₀ → Ū₋₁`, and U is effective.
*Needs:* §1.6.1, §2.4.1, §2.4.2, §3.4.2; Conventions 5; §3.1.1 (HTT, Def. 6.1.2.14); Part LimitsAndKanExtensions §9.1.2 (HTT, Def. 6.1.2.7; §6.1.2:
Čech nerves); Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11).

**3.5.2.** In particular every groupoid object of `S` is effective (HTT, Cor. 6.1.3.20, p. 574). Proof route: `S` is
presentable and satisfies condition (1) of §2.4 by §3.2, so §3.5.1 applies.
*Needs:* §2.4.2, §3.2.2, §3.5.1; Part PresentableInfinityCategories §1.6.2 (HTT, Ex. 5.5.1.8); §3.1.1 (HTT,
Def. 6.1.2.14); Part LimitsAndKanExtensions §9.1.2 (HTT, Def. 6.1.2.7).

### Examples

- `S`, every `P(C)`, and every slice `P(C)_{/F}` satisfy descent (§3.3, with slices of left exact
  presentations).
- For a discrete group G, the nerve of G is a groupoid object of `S` with `U₀ = ∗` and `U₁ = G`. §3.5
  identifies it with the Čech nerve of `∗ → BG`.
- Non-example: in the nerve of the category of sets, the nerve of a nontrivial group G, a groupoid object
  with `U₀ = ∗`, has colimit a point, whose Čech nerve is constant at a point, not G.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, AccessibleInfinityCategories, PresentableInfinityCategories; ModelCategoryTheory, Parts ModelCategories, KanQuillen, SimplicialCategories; Mathlib `SSet.anodyneExtensions`. Earlier layers of this Part: Layers 1 and 2. Within the layer: 3.3 uses 3.1, 3.2; 3.5 uses 3.1, 3.2, 3.4.

## Layer 4: Giraud's theorem

### 4.1 Left exactness at an object

**4.1.1.** Define, for a functor `f : 𝒳 → 𝒴` between ∞-categories with finite limits and an object Z of 𝒳, f to be
**left exact at Z** when it carries every pullback square of 𝒳 whose final corner is Z to a pullback square
of 𝒴 (HTT, Def. 6.1.4.1, p. 574). `Suggested.lean` declaration `IsLeftExactAt`, with the final corner at the
vertex (1, 1) of the square.

- f is left exact exactly when it preserves final objects and is left exact at every object.
- Left exactness at Z depends only on the equivalence class of Z.
- **4.1.2.** Prove that, if f is left exact at `U₀` and U is a groupoid object of 𝒳, then `f ∘ U` is a groupoid object
  of 𝒴 (HTT, Lemma 6.1.4.3, p. 575). Proof route: the groupoid condition in pullback form involves only
  pullbacks over `U₀`. The relevant pullbacks are iterated fiber products over `U₀` of copies of `U₁`.
  *Needs:* §4.1.1; Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2; Def. 6.1.2.7); Part LimitsAndKanExtensions §9.3.1 (HTT,
  Prop. 6.1.2.6, pullback form).

**Checks.**

- Truncation `π₀ : S → N(Set)` is left exact at the point, since `π₀(X × Y) = π₀X × π₀Y`. It is not left
  exact at the circle: the pullback of two copies of `∗ → S¹` is ℤ, with `π₀ ℤ = ℤ`, while the pullback
  of the images in sets is a point. A definition that tested only pullbacks over the final object (products) would call `π₀` left
  exact.
- The functor `X ↦ X ⊔ ∗` on `S` is left exact at every object, because coproducts in `S` are disjoint and
  universal. It does not preserve the final object, since it sends ∗ to two points. So left exactness at
  every object is weaker than left exactness, and the final-object clause in the first bullet is needed.
- For 𝒳 = Δ[0], every functor `Δ[0] → 𝒴` is left exact at the object, because the only pullback square is
  constant and a constant square of identities is a pullback. It is left exact only when it picks a final
  object. A definition of left exactness at Z that also asked f to preserve final objects would reject the
  functor picking ∅ in the nerve of sets.

*Needs:* Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4).

### 4.2 Groupoid resolutions and pullbacks over coequalizers

The question of this section is when a colimit-preserving functor preserves the kernel pair of a
coequalizer.

**4.2.1.** Define, in a presentable ∞-category 𝒳 (HTT, §6.1.4, definitions after Lemma 6.1.4.3, pp. 575–576):
- a **simplicial resolution** is an augmented simplicial object that is a colimit diagram of its underlying
  simplicial object, and `Res(𝒳) ⊆ Fun(N(Δ₊)ᵒᵖ, 𝒳)` is their full subcategory;
- a **groupoid resolution** is a simplicial resolution whose underlying simplicial object is a groupoid
  object;
- a map `U₊ → V₊` of simplicial resolutions **exhibits V₊ as the groupoid resolution generated by U₊** when
  V₊ is a groupoid resolution and composition with the map is a homotopy equivalence `Map(V₊, W₊) →
  Map(U₊, W₊)` for every groupoid resolution W₊.

Restriction `Res(𝒳) → Fun(N(Δ)ᵒᵖ, 𝒳)` is a trivial fibration, because 𝒳 has colimits and simplicial
resolutions are the left Kan extensions along the cone. Every simplicial resolution generates a groupoid
resolution, because the groupoid objects form a reflective subcategory of `Fun(N(Δ)ᵒᵖ, 𝒳)` (HTT,
Rem. 6.1.4.4, p. 576): the pullback form of the groupoid condition is a small set of limit conditions, each
cutting out the preimage of a strongly reflective subcategory, and these are stable under intersections and
preimages.

**Checks** (simplicial resolutions).

- The constant augmented simplicial object at an object X is a simplicial resolution, because `N(Δ)ᵒᵖ` is
  weakly contractible. A definition that asked the augmentation to be a colimit of the degree-0 term alone
  would agree here but fail below.
- In `S`, the nerve of the group ℤ/2, augmented to a point, is not a simplicial resolution of the point:
  its colimit is the classifying space of ℤ/2, which has nonzero `π₁`. The coequalizer of `d₀, d₁ : ℤ/2 ⇉
  ∗` is a wedge of two circles, a third answer. So a definition through the coequalizer of the first two
  face maps would compute the wrong colimit.
- The Čech nerve of `∅ → ∗` in `S` is constant at ∅, with colimit ∅, not ∗. So it is not a resolution of
  ∗. A definition that ignored the augmentation would accept it.

**Checks** (groupoid resolutions and generation).

- The nerve of ℤ/2 augmented to BZ/2 is a groupoid resolution; the same simplicial object augmented to ∗
  is a groupoid object that is not a resolution. A definition that dropped the colimit clause would accept
  both.
- The nerve of the monoid ℕ, augmented to its colimit S¹ (a simplicial resolution of S¹), is not a
  groupoid resolution: the groupoid condition fails in degree 2, since `(a, b) ↦ (b, a + b)` is not a
  bijection `ℕ² → ℕ²`. It generates the groupoid resolution given by the nerve of ℤ over S¹,
  with the same augmentation, as the degree −1 and 0 step below predicts.
- A constant groupoid resolution generates itself through the identity. A definition of generation asking
  for an equivalence `U₊ → V₊` instead of a universal property would reject the map of the previous Check.

*Needs:* Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2; Def. 6.1.2.7; §6.1.2: Čech nerves); Part PresentableInfinityCategories §1.1.1 (HTT,
Def. 5.5.0.1); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15) and §7.6.4
(HTT, Prop. 4.3.3.8); Part InfinityCategoryFoundations §5.2.1 (HTT, §1.2.2: mapping spaces); Part PresentableInfinityCategories §2.1.3
(HTT, Cor. 5.5.2.4) and §4.6.3, §4.6.4, §4.6.5 (HTT, Lemmas 5.5.4.17–5.5.4.19); Part LimitsAndKanExtensions §9.3.1 (HTT,
Prop. 6.1.2.6), Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.8) and §1.8.2 (HTT, Prop. 4.3.3.7).

**4.2.2.** Let `I ⊆ Δ₊` be the subcategory on `∅, [0], [1]` with the injective maps, and `I₀ ⊆ I` the full
subcategory on `[0], [1]`. A diagram `N(I)ᵒᵖ → 𝒳` is a **coequalizer diagram** when it is a colimit of its
restriction to `N(I₀)ᵒᵖ`.

**Checks** (coequalizer diagrams).

- `∗ ⇉ ∗` with both maps the identity has coequalizer S¹ in `S`, not ∗. A definition through the
  1-categorical coequalizer gives ∗.
- `∅ ⇉ ∗ → ∗` is a coequalizer diagram, but the kernel pair `∗ ×_∗ ∗ = ∗` is not `U₁ = ∅`. So coequalizer
  diagrams need not be effective, and a definition requiring `U₁` to be the kernel pair would reject this
  one; §4.2.3 is about exactly this gap.
- In the nerve of the category of sets, coequalizer diagrams are exactly Mathlib's coequalizer cofork
  diagrams, since there the colimit over `N(I₀)ᵒᵖ` is the quotient by the generated equivalence relation.

**4.2.3.** Prove the following (HTT, Prop. 6.1.4.2, p. 575). Let 𝒳 and 𝒴 be presentable ∞-categories in which every
groupoid object is effective, and let `f : 𝒳 → 𝒴` preserve small colimits. Let `U₁ ⇉ U₀ → U₋₁` be a
coequalizer diagram in 𝒳 with pullback `U₀ ×_{U₋₁} U₀`, and suppose f is left exact at `U₀`. Then f
carries that pullback square to a pullback square. Proof route:
- *Resolve the coequalizer.* Left Kan extension `i_!` along `I ⊆ Δ₊` carries coequalizer diagrams to
  simplicial resolutions, since transitivity rewrites it as a left Kan extension along the cone (HTT,
  Lemma 6.1.4.7, p. 577). It does not change the augmentation `U₀ → U₋₁`, because every morphism of `Δ₊` out of
  `∅` or `[0]` is injective and so lies in I (HTT, Lemma 6.1.4.8, p. 577).
- *Pass to the generated groupoid resolution* W. The generating property extends from groupoid resolutions
  to all augmented simplicial objects whose underlying simplicial object is a groupoid, since resolutions
  are left Kan extensions of their underlying simplicial objects (HTT, Lemma 6.1.4.5, p. 576). Testing it
  on the Čech nerves of arbitrary morphisms of 𝒳, which are the right Kan extensions from `Δ₊^{≤0}` and
  have groupoid underlying simplicial objects, shows by the Yoneda lemma in `O_𝒳` that the generating map
  is an equivalence in degrees −1 and 0 (HTT, Lemma 6.1.4.6, p. 576).
- *Conclude.* W is a Čech nerve by effectiveness in 𝒳 and has the same square in degrees ≤ 0. Then `f ∘ W`
  is a groupoid object by §4.1, a resolution because f preserves colimits, and a Čech nerve by
  effectiveness in 𝒴, which gives the pullback square.
*Needs:* §4.1.1, §4.1.2, §4.2.1, §4.2.2; §3.1.1 (HTT, Def. 6.1.2.14); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2; Def. 4.3.3.2) and §9.1.3 (HTT, §6.1.2: Čech nerves); Part LimitsAndKanExtensions §7.5.2 (HTT, Prop. 4.3.2.8:
transitivity), §7.4.2 (HTT, Lemma 4.3.2.13; Prop. 4.3.2.15) and §7.6.4 (HTT, Prop. 4.3.3.8); Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11) and Part AdjunctionsAndLocalizations §1.8.2 (HTT, Prop. 4.3.3.7).

### 4.3 Left exact presentations from Giraud's axioms

**4.3.1. Left exactness from representables.** Prove that, for a small ∞-category C with finite limits and an ∞-category 𝒳 satisfying Giraud's axioms, a
colimit-preserving `F : P(C) → 𝒳` whose restriction `F ∘ j` is left exact is itself left exact (HTT,
Prop. 6.1.5.2, p. 580). Call a morphism `α : Y → Z` of `P(C)` good when F carries every pullback along α
to a pullback. Call Z good when every morphism into Z is good, that is, when F is left exact at Z. The proof
has three named steps.
- **Representables** (HTT, Prop. 6.1.5.2, first steps of the proof, p. 580). F preserves final objects,
  since j and `F ∘ j` do. Good morphisms compose. A morphism α is good once F preserves the pullbacks of α
  along maps from representables, and Z is good once every `j(y) → Z` is good. Every representable is good.
  Proof route: colimits in `P(C)` are universal (§3.3), so `F ∘ α^*` preserves colimits, and `P(C)_{/Z}` is
  generated under colimits by maps from representables. Representables are good because `F ∘ j` is left
  exact and j preserves pullbacks.
  *Needs:* §3.3.2, §4.1.1; Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1), §1.3.2 (HTT, Prop. 5.1.3.2) and §1.4.3
  (HTT, Thm. 5.1.5.6; Cor. 5.1.5.8); Part PresentableInfinityCategories §3.2.5 (HTT, Cor. 5.1.6.12); Part LimitsAndKanExtensions §6.5.1 (HTT,
  Lemma 4.4.2.1).
- **Coproducts** (HTT, Prop. 6.1.5.2, coproduct step of the proof, pp. 580–581). A small coproduct of good
  objects of `P(C)` is good. Proof route: a map from `j(y)` to a coproduct factors through one summand,
  because evaluation at y preserves colimits. So it suffices that coproduct inclusions are good, and that
  is §1.6.1 applied in `P(C)` and in 𝒳, with F preserving initial objects. `P(C)` has universal colimits and
  disjoint coproducts by §3.3.1 and §3.5.
  *Needs:* the representables step; §1.6.1, §3.3.2, §3.5.1; Part LimitsAndKanExtensions §8.2.2 (HTT,
  Prop. 5.1.2.2) and Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1).
- **Coequalizers** (HTT, Prop. 6.1.5.2, coequalizer step of the proof, p. 582). If `Z₁ ⇉ Z₀ → Z₋₁` is a
  coequalizer in `P(C)` with `Z₀` and `Z₁` good, then `Z₋₁` is good. Proof route: maps from representables
  to `Z₋₁` lift to `Z₀`, because evaluation followed by `π₀` preserves the coequalizer. This reduces
  goodness of `Z₋₁` to goodness of the pullback of `s : Z₀ → Z₋₁` along itself, which is §4.2 for
  `F : P(C) → 𝒳`. Groupoid objects of `P(C)` are effective by §3.5, and those of 𝒳 by hypothesis.
  *Needs:* the representables step; §3.3.2, §3.5.1, §4.2.3; Part LimitsAndKanExtensions §8.2.2 (HTT,
  Prop. 5.1.2.2) and Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18).

Proof route of the proposition: good objects contain the representables and are closed under coproducts
and coequalizers, hence under all small colimits. `P(C)` is generated under colimits by representables, so
every object is good. F preserves final objects, so it is left exact.
*Needs:* the three steps above; Conventions 4 (T); Part LimitsAndKanExtensions §6.5.6 (HTT, Prop. 4.4.3.3;
Cor. 4.4.2.5); Part PresheavesAndCompletions §1.4.5 (HTT, Cor. 5.1.5.8; Def. 5.1.5.7); Part PresheavesAndCompletions §1.1.1 (HTT,
§5.1.3: the Yoneda embedding); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3).

**4.3.2. A left exact presentation.** Prove that every ∞-category satisfying Giraud's axioms has a left exact
presentation by a small ∞-category with finite limits (HTT, Prop. 6.1.5.3, p. 583). This is the
implication (T) ⇒ (L) of Giraud's theorem (HTT, Thm. 6.1.0.6, (3) ⇒ (1), p. 547). Proof route: choose a regular τ such that 𝒳 is
τ-accessible and its τ-compact objects are closed under finite limits. Let C be a minimal model of the
τ-compact objects, so `𝒳 ≃ Ind_τ(C)`. The inclusion `Ind_τ(C) ⊆ P(C)` has a left adjoint L. Its composite
with the Yoneda embedding is the Yoneda embedding of `Ind_τ(C)`, which preserves the finite limits of C, so
L is left exact by §4.3.1. L is accessible because it is a functor with an adjoint between accessible
∞-categories.
*Needs:* §4.3.1; §3.1.3 (HTT, Def. 6.1.0.4); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §5.5.3 (HTT, Prop. 5.4.7.4), §5.1.1 (HTT, Prop. 5.4.2.2) and
§5.4.1 (HTT, Prop. 5.4.7.7); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); Part AdjunctionsAndLocalizations §1.5.1
(HTT, Prop. 5.2.3.5); Part InfinityCategoryFoundations §10.3.1 (HTT, Def. 2.3.3.1:
minimal models).

### 4.4 Giraud's theorem

**4.4.1.** Prove **Giraud's theorem** (HTT, Thm. 6.1.0.6, p. 547). For an ∞-category 𝒳 the following are
equivalent:
1. (L) 𝒳 has a left exact presentation: it is an accessible left exact reflective localization of `P(C)`
   for a small ∞-category C.
2. (D) 𝒳 is presentable and satisfies descent (§2.4).
3. (T) 𝒳 satisfies Giraud's axioms, that is, 𝒳 is an ∞-topos in the sense of §3.1.

Of the three predicates (HTT, Thm. 6.1.0.6, statement, p. 547), (L) and (T) are those of §3.1, and (D) is the descent condition of §2.4 of this Part. The proof is the chain (1) ⇒ (2)
(§3.3 with the descent theorem of §2.4), (2) ⇒ (3) (§3.5) and (3) ⇒ (1) (§4.3).
In (L), C may moreover be chosen with finite limits (§4.3).

- Every slice `𝒳_{/X}` of an ∞-topos is an ∞-topos: slices of presentable ∞-categories are presentable
  (Part PresentableInfinityCategories §3.2 (HTT, Prop. 5.5.3.10)), and descent passes to slices (§2.4).
- `S`, every `P(C)`, and every accessible left exact localization of an ∞-topos are ∞-topoi.

**Checks.**

- C = ∅: `P(∅)` is the one-object ∞-category, which is an ∞-topos by all three descriptions (Conventions
  4). The empty ∞-category is not: it is not presentable (no initial object), and it is not (L) because
  every `P(C)` has an object.
- On 0-truncated objects: for `𝒳 = P(C)`, the 0-truncated objects are the presheaves of sets on the
  homotopy category of C, a Grothendieck topos (HTT, Def. 6.1.0.2, p. 547). The category of sets
  satisfies the classical Giraud axioms (HTT, Prop. 6.1.0.1, p. 546), but its nerve fails (T) (Layer 3
  Examples). A theorem stated with the classical effectiveness axiom for equivalence relations would be
  false.
- The nerve of the category of abelian groups is presentable with disjoint coproducts, but colimits are not
  universal there (Layer 1 Examples). So it fails (T), and Giraud's theorem predicts it fails (D) and (L).
  Indeed it has a zero object, and a left exact localization of `P(C)` with a zero object is the
  one-object ∞-category, because the initial object would be final and §1.6 would make every object
  initial.

*Needs:* §2.4.1, §2.4.2, §3.3.2, §3.5.1, §4.3.2; §1.1.1 (HTT, Def. 6.1.1.2) and §3.1.1 (HTT, Def. 6.1.2.14), §3.1.2, §3.1.3 (HTT, Def. 6.1.0.4); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part LimitsAndKanExtensions §9.1.2 (HTT, Def. 6.1.2.7); Part PresentableInfinityCategories §3.2.1 (HTT,
Prop. 5.5.3.10); Conventions 5.

### Examples

- `P(C)` for every small C; `S = P(Δ[0])`; slices `𝒳_{/X}` of ∞-topoi.
- `Fun(K, 𝒳)` for an ∞-topos 𝒳 and a small simplicial set K: descent is checked pointwise.
- Non-examples: the nerve of sets (fails effectiveness of groupoid objects), the nerve of abelian groups
  (fails universality), the empty ∞-category (fails presentability).

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresheavesAndCompletions, AccessibleInfinityCategories, PresentableInfinityCategories. Earlier layers of this Part: Layers 1, 2 and 3. Within the layer: 4.2 uses 4.1; 4.3 uses 4.1, 4.2; 4.4 uses 4.3.

## Layer 5: Object classifiers

### 5.1 Classifying objects

**5.1.1.** Define, for an ∞-category 𝒳 with pullbacks and a pullback-stable class S of morphisms, a morphism
`f : X → Y` to **classify** S when it is a final object of `O^{(S)}_𝒳`, the subcategory of `O_𝒳` on members
of S and pullback squares; Y is then a **classifying object** for S (HTT, Def. 6.1.6.1, p. 584).

- **5.1.2.** Prove that, for a presentable 𝒳 with universal colimits, S has a classifying object exactly when S is
  local and, for every object X, the full subcategory of `𝒳_{/X}` on members of S is essentially small
  (HTT, Prop. 6.1.6.3, p. 584). Proof route: S has a classifier exactly when the classifying map
  `𝒳ᵒᵖ → Ŝ` of the right fibration `O^{(S)}_𝒳` is representable. By the representability criterion for
  presentable ∞-categories, that happens exactly when the map preserves limits, which is locality
  (§2.3 (2)), and takes small values, which is essential smallness.

**Checks.**

- In `S`, `{1} → {0, 1}` classifies monomorphisms (HTT, Ex. 6.1.6.2, p. 584): a map `X → {0, 1}` pulls `{1}`
  back to a union of components of X, and these are exactly the monomorphisms into X. By contrast
  `{1} → {0, 1, 2}` is not a classifier, since `∅ → ∗` arises from the two maps `∗ → {0, 2}`, so the space
  of classifying maps is not contractible. A weakly universal definition (every member is some pullback)
  would accept it.
- The class of all morphisms of `S` is local but has no classifier, because `S_{/∗}` is not essentially
  small; the smallness condition of the criterion is needed.
- A definition using `O^S_𝒳`, with all commutative squares, instead of `O^{(S)}_𝒳`, with pullback squares,
  would find the final object `id_∗` of `O_𝒳` and call every class containing `id_∗` classified, the class
  of all morphisms of `S` included.

*Needs:* §2.3.1; §2.1.1 (HTT, Notation 6.1.3.4); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2); Part PresentableInfinityCategories §2.1.2 (HTT,
Prop. 5.5.2.2); Part LimitsAndKanExtensions §3.4.2 (HTT, Def. 4.4.4.4); Part AccessibleInfinityCategories §3.1.1 (HTT,
Def. 5.4.1.3).

### 5.2 Relatively κ-compact morphisms and their classifiers

**5.2.1.** Define, in a presentable ∞-category 𝒳 and for a regular cardinal κ, a morphism `f : X → Y` to be
**relatively κ-compact** when, for every pullback square with f on the right and a κ-compact object Y′ in
the lower-left corner, the upper-left corner X′ is κ-compact (HTT, Def. 6.1.6.4, p. 585). Pullbacks of
relatively κ-compact morphisms are relatively κ-compact, by pasting.

**Checks.**

- In `S` with κ = ω, the connected double cover `S¹ → S¹` is relatively ω-compact: its pullback along a
  finite space is a double cover of that space, again finite. The map `∗ → S¹` is not, although its source
  and target are compact: its pullback along the base point is the discrete space ℤ. A definition asking
  source and target to be κ-compact would accept it.
- Every equivalence is relatively κ-compact for every κ, because the pullback along `Y′ → Y` is Y′. A
  definition asking the source to be κ-compact would exclude the identity of a non-compact object.
- For a space Y, `Y → ∗` is relatively ω-compact exactly when Y is ω-compact: pull back along `id_∗`, and
  conversely pullbacks along compact `Y′ → ∗` are `Y × Y′`. So `S¹ → ∗` is relatively ω-compact and
  `ℤ → ∗` is not.

*Needs:* Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part LimitsAndKanExtensions §6.5.1 (HTT, Lemma 4.4.2.1).

**5.2.2.** Prove that, for a presentable 𝒳 with universal colimits and a local class S, for all sufficiently large
regular κ the class `S_κ` of relatively κ-compact members of S has a classifying object (HTT,
Prop. 6.1.6.7, p. 586). Proof route: choose κ so that 𝒳 is κ-accessible and the κ-compact objects are
closed under pullbacks. Then §5.1 reduces the claim to locality and essential smallness of `S_κ`.
- *Filtered colimits of targets.* If Y is a κ-filtered colimit of objects `Yα` and each pullback of f to
  `Yα` is relatively κ-compact, then f is, since a map from a κ-compact Y′ to Y factors through some `Yα`
  and pasting reduces to the pullback there (HTT, Lemma 6.1.6.5, p. 585).
- *Gluing along pushouts.* For regular τ > κ with 𝒳 κ-accessible and the τ-compact objects closed under
  pullbacks: in a
  Cartesian transformation between pushout squares, viewed as a pushout square `f → g`, `f → f′`,
  `g → g′`, `f′ → g′` in `O_𝒳`, if f, g, f′ are relatively τ-compact, so is g′ (HTT, Lemma 6.1.6.6,
  p. 586). Write the pullback of the square along a map from a τ-compact object as a τ-filtered colimit of
  squares of τ-compact objects, keep the transformation Cartesian by universality, and apply the previous
  step.
- *Coproducts.* A small coproduct of members `fα : Xα → Yα` of `S_κ` lies in `S_κ`. It lies in S because S
  is local. A map from a κ-compact object to `⊔_{α∈A} Yα` factors through `⊔_{α∈A₀} Yα` for a κ-small A₀;
  since S is local, the pullback of the coproduct there is `⊔_{α∈A₀} Xα`, and pulling back further gives a
  κ-small coproduct of κ-compact objects (HTT, Cor. 5.3.4.15).
The gluing and coproduct steps give condition (3) of §2.3 for `S_κ`, so `S_κ` is local because S is.
Essential smallness over X: the classifying functor of `O^{(S)}_𝒳` carries colimits to limits because S
is local, essentially small spaces are closed under small limits, and X is a κ-filtered colimit of
κ-compact objects; over a κ-compact object, members of `S_κ` have κ-compact sources, an essentially small
collection.
*Needs:* §1.4.1, §1.5.1, §2.3.1, §5.1.2; Part AccessibleInfinityCategories §5.5.3 (HTT, Prop. 5.4.7.4), §5.1.1 (HTT, Prop. 5.4.2.2),
§3.1.1 (HTT, Def. 5.4.1.3), §5.4.1 (HTT, Prop. 5.4.7.7), §2.2.2 (HTT, Cor. 5.3.4.15) and §6.2.1 (HTT,
Prop. 5.4.4.3); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part LimitsAndKanExtensions §6.2.2 (HTT,
Prop. 4.2.3.4), §6.3.2 (HTT, Cor. 4.2.3.10), §6.5.1 (HTT, Lemma 4.4.2.1) and §7.4.6 (HTT, Prop. 4.3.2.15); Part PresheavesAndCompletions §5.2.1 (HTT, Lemma 5.5.2.3); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
ModelCategoryTheory, Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1).

### 5.3 Characterization by object classifiers

**5.3.1.** Prove that a presentable ∞-category 𝒳 is an ∞-topos exactly when colimits in 𝒳 are universal and, for all
sufficiently large regular κ, the class of all relatively κ-compact morphisms has a classifying object
(HTT, Thm. 6.1.6.8, p. 588). Proof route: by Giraud's theorem and the descent theorem, 𝒳 is an ∞-topos
exactly when the class of all morphisms is local. If it is, §5.2 gives the classifiers. Conversely, each
class of relatively κ-compact morphisms is local by §5.1. Every morphism is relatively κ-compact for κ
large, so the class of all morphisms is an increasing union of local classes, and locality passes to such
unions through §2.3 (3), whose conditions involve finitely many morphisms and coproducts of bounded size.
*Needs:* §2.3.1, §2.4.2, §4.4.1, §5.1.1, §5.1.2, §5.2.1, §5.2.2; Part AccessibleInfinityCategories §5.5.3 (HTT, Prop. 5.4.7.4).

### Examples

- In `S`, the relatively κ-compact morphisms are those with κ-compact fibers. They are classified by the
  core of the full subcategory of `S` on κ-compact spaces, viewed as a space.
- Non-example: the class of all morphisms of `S` has no classifier (§5.1 Checks).

### Dependencies

Earlier Parts and libraries: Parts LimitsAndKanExtensions, Straightening, PresheavesAndCompletions, AccessibleInfinityCategories, PresentableInfinityCategories; ModelCategoryTheory, Part ModelCategories. Earlier layers of this Part: Layers 1, 2 and 4. Within the layer: 5.2 uses 5.1; 5.3 uses 5.1, 5.2.

## Layer 6: Topological localizations

### 6.1 Subobjects

**6.1.1.** For an object X of an ∞-category 𝒳, `Sub(X)` is the collection of equivalence classes of monomorphisms into X,
that is, of (−1)-truncated objects of `𝒳_{/X}`. It is ordered by factorization, and the full subcategory
of (−1)-truncated objects of `𝒳_{/X}` is equivalent to the nerve of `Sub(X)` (HTT, §6.2.1, before
Prop. 6.2.1.3, p. 593). Prove that for presentable 𝒳 the poset `Sub(X)` is small (HTT, Prop. 6.2.1.3,
p. 594). Proof route: the slice `𝒳_{/X}` is presentable, and so are its (−1)-truncated objects, so the
nerve of `Sub(X)` is presentable and is generated under colimits by a small set. Each element is a supremum of a subset of that set.

- Pullback along `f : Y → X` gives an order-preserving map `f^* : Sub(X) → Sub(Y)`.
- In a presentable ∞-category `Sub(X)` has all suprema, and pullback preserves them when colimits are
  universal.

**Checks.**

- In `S`, `Sub(X)` is the power set of `π₀ X`: a monomorphism of spaces is the inclusion of a union of
  components. A definition through injective maps on all homotopy groups would count `∗ → S¹` as a
  monomorphism, which it is not, because its diagonal `∗ → ΩS¹ = ℤ` is not an equivalence.
- `Sub(∅)` has one element, and `Sub(∗)` in `S` has two, the empty space and the point. These are the
  values the subobject classifier of §5.1 Checks represents.
- On nerves of 1-categories, `Sub(X)` is Mathlib's poset of subobjects. In `S`, `Sub(S¹)` has two
  elements; a definition through all morphisms into X would give a large collection that is not a poset.

*Needs:* Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part PresentableInfinityCategories §3.2.1 (HTT, Prop. 5.5.3.10)
and §1.6.1 (HTT, Thm. 5.5.1.1); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13) and Part PresentableInfinityCategories §6.2.1 (HTT,
Prop. 5.5.6.18).

### 6.2 Topological localizations

**6.2.1.** Define, for a presentable ∞-category 𝒳, a strongly saturated class S of morphisms to be **topological** when
two conditions hold (HTT, Def. 6.2.1.4, p. 594). First, S is generated, as a strongly saturated class, by
a subclass of monomorphisms. Second, S is stable under pullback. A reflective localization `L : 𝒳 → 𝒴` is
**topological** when the class of morphisms it inverts is topological.

- **6.2.2.** Prove that if 𝒳 is presentable with universal colimits and S is topological, then a small set of
  monomorphisms in S generates S (HTT, Prop. 6.2.1.5, p. 594). Proof route: choose a small set of objects
  generating 𝒳 under colimits, and let S₀ consist of representatives of the monomorphisms in S into those
  objects. S₀ is small because each `Sub(U)` is small (§6.1). The objects U such that every monomorphism in
  S with target U lies in the class generated by S₀ contain the generators and are closed under colimits,
  by universality and pullback-stability, so they are all of 𝒳.
  *Needs:* §6.2.1; §6.1.1; §1.1.1 (HTT, Def. 6.1.1.2); Part PresentableInfinityCategories §4.1.1 (HTT,
  Def. 5.5.4.5; Rem. 5.5.4.7); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.2 (HTT, Rem. 5.5.6.12);
  Part PresheavesAndCompletions §1.4.4 (HTT, Def. 5.1.5.7).
- **6.2.3.** Prove that every topological localization of a presentable ∞-category is left exact, and that it is
  accessible when colimits are universal (HTT, Cor. 6.2.1.6, p. 595). Proof route: left exactness by Part PresentableInfinityCategories §4.5.1 (HTT, Prop. 6.2.1.1)
  from pullback-stability. Accessibility because a small generating set (§6.2.2) gives a
  localization at a set, and such a localization is accessible. The route through §6.2.2
  needs universal colimits, so that hypothesis is stated; every use of this result is for `P(C)` or an
  ∞-topos.
  *Needs:* §6.2.2; Part PresentableInfinityCategories §4.5.1 (HTT, Prop. 6.2.1.1); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part PresentableInfinityCategories §4.4.1 (HTT, Prop. 5.5.4.15), §1.5.3 (HTT, Prop. 5.5.1.2) and §1.6.1 (HTT, Thm. 5.5.1.1).

**Checks.**

- The class of equivalences is topological (generated by the empty set of monomorphisms), and its
  localization is the identity. A definition demanding a nonempty set of generating monomorphisms would
  exclude it.
- In `S`, the class generated by the monomorphism `∅ → ∗` is topological. Its local objects are the Z with
  `Map(∗, Z) → Map(∅, Z)` an equivalence, that is, contractible Z, and the localization is `S → Δ[0]`. A
  definition asking the generating monomorphisms to have nonempty source would exclude it, although it
  is the open subtopos of U = ∅ (Examples).
- The class generated by `S¹ → ∗` is strongly saturated, with the 0-truncated spaces as local objects and
  `π₀` as localization. It contains `∗ → S¹`, which `π₀` inverts, but not its pullback `ℤ → ∗` along
  itself, so it is not pullback-stable and `π₀` is not left exact. A definition asking only for strong
  saturation would accept it.
- On 0-truncated presheaves, topological localizations of `P(C)` restrict to Lawvere–Tierney sheafification
  of presheaves of sets on the homotopy category, that is, to Mathlib's `CategoryTheory.presheafToSheaf` for
  the corresponding Grothendieck topology.

*Needs:* §6.1.1; Part PresentableInfinityCategories §4.5.1 (HTT, Prop. 6.2.1.1); §1.1.1 (HTT, Def. 6.1.1.2); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part AccessibleInfinityCategories §4.1.1 (HTT,
Def. 5.4.2.1); Part PresentableInfinityCategories §4.1.1 (HTT, Def. 5.5.4.5; Rem. 5.5.4.7), §4.4.1 (HTT, Prop. 5.5.4.15), §1.5.3 (HTT, Prop. 5.5.1.2)
and §1.6.1 (HTT, Thm. 5.5.1.1); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.2 (HTT, Rem. 5.5.6.12); Part PresheavesAndCompletions §1.4.4 (HTT, Def. 5.1.5.7).

### Examples

- For an ∞-topos 𝒳 and a (−1)-truncated object U, the localization at the pullbacks `W × U → W` of
  `U → 1` is topological, with local objects the Z for which `Z → Z^U` is an equivalence: it is
  `𝒳 → 𝒳_{/U}`, the open subtopos of U. In `S`, U = ∅ gives `S → Δ[0]`, and U = ∗ the identity.
- Sheafification for a Grothendieck topology is topological; Layer 8 proves it.
- Non-example: truncation `τ_{≤n} : S → τ_{≤n}S` for n ≥ 0 is a reflective localization that is not left
  exact. For n = 0 it inverts `∗ → S¹` but not its pullback `ℤ → ∗`.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, AdjunctionsAndLocalizations, PresheavesAndCompletions, AccessibleInfinityCategories, PresentableInfinityCategories; Mathlib `CategoryTheory.presheafToSheaf` (Checks). No earlier layer of this Part. Within the layer: 6.2 uses 6.1.

## Layer 7: Effective epimorphisms

### 7.1 Effective epimorphisms in an ∞-topos

**7.1.1.** Define a morphism f : U → X of an ∞-topos 𝒳 to be an **effective epimorphism** when its Čech nerve, an
augmented simplicial object of 𝒳 with augmentation X, is a colimit diagram (HTT, §6.2.3, p. 605, the
definition after Cor. 6.2.3.5, condition (2)). §7.3 extends the notion to semitopoi and gives the equivalent
description through (−1)-truncation.

- Being an effective epimorphism is invariant under equivalence in `Fun(Δ[1], 𝒳)`, since Čech nerves and colimit
  diagrams are.
- f is an effective epimorphism exactly when the groupoid object underlying its Čech nerve is effective (§3.1)
  with colimit X.

**Checks.**
- In S, `∗ → S¹` is an effective epimorphism (its Čech nerve is the nerve of ℤ, with colimit S¹), but not an
  epimorphism of hS, since the identity of S¹ and the constant map agree on ∗ without being homotopic; a
  definition through epimorphisms of the homotopy category would reject it.
- In S, the fold map Δ[0] ⊔ Δ[0] → Δ[0] is an effective epimorphism: its Čech nerve is the nerve of the
  codiscrete groupoid on two points, whose colimit is contractible.
- In S, ∅ → Δ[0] is not: its Čech nerve is constant at ∅, with colimit ∅.

*Needs:* Part LimitsAndKanExtensions §9.1.3 (Čech nerves); Part InfinityCategoryFoundations §1.2.4 (colimit diagrams); §3.1.2 (∞-topoi).

### 7.2 Semitopoi

**7.2.1.** Define an ∞-category 𝒳 to be a **semitopos** when three conditions hold (HTT, Def. 6.2.3.1, p. 604):
𝒳 is presentable; colimits in 𝒳 are universal; and for every morphism `f : U → X` the underlying groupoid
object of the Čech nerve of f is effective.

- Every ∞-topos is a semitopos: the underlying simplicial object of a Čech nerve is a groupoid object, and
  in an ∞-topos all groupoid objects are effective (HTT, Rem. 6.2.3.2, p. 604).
- Every slice of a semitopos is one (HTT, Rem. 6.2.3.3, p. 604).

**Checks.**

- The empty ∞-category is not a semitopos, since it is not presentable; `S` is one (§3.5). A definition
  without presentability would admit the empty ∞-category, which has universal colimits vacuously.
- The nerve of the category of sets is a semitopos, since Čech nerves of maps of sets are nerves of
  effective equivalence relations, but not an ∞-topos (Layer 3 Examples). A definition requiring all
  groupoid objects to be effective would collapse the two notions.
- The nerve of the category of abelian groups is not a semitopos: colimits there are not universal (§1.1 Checks).

*Needs:* §1.1.1 (HTT, Def. 6.1.1.2) and §3.1.1 (HTT, Def. 6.1.2.14); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2; §6.1.2: Čech nerves); Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11).

### 7.3 Images and the image factorization

**7.3.1.** Prove that, in a semitopos, for `p : U → X` with Čech nerve U• and V a colimit of its underlying simplicial
object, the induced map `V → X` is a (−1)-truncation of p in `𝒳_{/X}` (HTT, Prop. 6.2.3.4, p. 604). Proof
route: the underlying groupoid U• is effective (§7.2), so `U ×_V U` and `U ×_X U` are both `U₁`. Each
`U_m ×_V U_n → U_m ×_X U_n` is a pullback of that map, hence an equivalence, and universality of colimits
gives `V ≃ V ×_X V`, so `V → X` is a monomorphism. A map from p to a monomorphism `q : E → X` lifts the
groupoid U• to the slice over q, and the colimit there maps to V (HTT, Prop. 1.2.13.8), so it factors through V.
V is the **image** of p.
*Needs:* §7.2.1; §3.1.1 (HTT, Def. 6.1.2.14); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part LimitsAndKanExtensions §9.1.2 (HTT, Def. 6.1.2.7; §6.1.2: Čech nerves); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10);
Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18) and Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15);
Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8).

**7.3.2.** Prove that, for `f : U → X` in a semitopos, two conditions are equivalent (HTT, Cor. 6.2.3.5,
p. 605): the (−1)-truncation of f, as an object of `𝒳_{/X}`, is final there; and the Čech nerve of f is a
simplicial resolution of X. In a semitopos, call f an **effective epimorphism** when they hold. In an
∞-topos this is the notion of §7.1 (HTT, §6.2.3, after Cor. 6.2.3.5, p. 605), by the second
condition. Restriction identifies three ∞-categories: augmented simplicial objects that are both Čech
nerves and simplicial resolutions; effective groupoid objects; and effective epimorphisms (HTT, §6.2.3,
p. 605). Proof route: §7.3.1, read twice.
*Needs:* §7.3.1; §4.2.1; §7.2.1; Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18); Part InfinityCategoryFoundations §5.5.1 (HTT, Def. 1.2.12.3) and §8.3.1 (HTT, Prop. 1.2.13.8); Part LimitsAndKanExtensions §9.1.3 (HTT, §6.1.2:
Čech nerves).

**Checks.**

- On the nerve of the category of sets, effective epimorphisms are the surjections, matching Mathlib's
  `CategoryTheory.EffectiveEpi` there. In `S`, `∗ → S¹` is an effective epimorphism, since `S¹` is connected,
  although it is
  not surjective on `π₁`. A definition requiring surjectivity on all homotopy groups would exclude it.
- The fold map `∗ ⊔ ∗ → ∗` of `S` (§7.1 Checks) satisfies the first condition too: its (−1)-truncation is
  `id_∗`. A definition asking f itself to be final in `𝒳_{/X}` would accept only equivalences and would reject it.
- An effective epimorphism that is a monomorphism is an equivalence, because its (−1)-truncation is
  itself.

**7.3.3.** Effective epimorphisms are detected on subobjects. Prove that, in a semitopos, `f : U → X` is an effective
epimorphism exactly when pullback `f^* : Sub(X) → Sub(U)` is injective (HTT, Prop. 6.2.3.10, p. 606).
Proof route: factor f through its image `V → X`. If `f^*` is injective, then `V → X` and the identity have
the same pullback U, so they agree. Conversely, let f be an effective epimorphism and let `V ⊆ V′` be
subobjects of X with the same pullback to U (intersecting reduces the general case to this one). Pulling
the Čech nerve of f back to V and to V′ gives a map of augmented simplicial objects. It is an equivalence
in degree 0 by hypothesis, hence in every degree n ≥ 0, since each term is a pullback of the degree-0
term. Both are colimit diagrams by universality, so the map `V → V′` in degree −1 is an equivalence.
*Needs:* §6.1.1, §7.2.1, §7.3.1; Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5).

**7.3.4.** Prove that in an ∞-topos the effective epimorphisms and the monomorphisms form a factorization system in
the sense of Part AdjunctionsAndLocalizations §2.5 (HTT, Def. 5.2.8.8): every morphism factors as an effective
epimorphism followed by a monomorphism, and effective epimorphisms are left orthogonal to monomorphisms
(HTT, Ex. 5.2.8.16, the case n = −1, p. 391). Proof route: factor `f : U → X` through its image V. Since
`V → X` is a monomorphism, `U ×_V U ≃ U ×_X U`, so `U → V` has the same Čech nerve as f, whose colimit is
V; hence `U → V` is an effective epimorphism. For orthogonality, given a square from an effective
epimorphism `U → V` to a monomorphism `W → Y`, pull W back to a subobject of V containing the image of U;
by the subobject criterion (§7.3.3) it is all of V, which gives the lift, and the space of lifts is contractible
because `W → Y` is a monomorphism.
*Needs:* §7.2.1, §7.3.1, §7.3.3; Part AdjunctionsAndLocalizations §2.5.2 (HTT,
Def. 5.2.8.8; Def. 5.2.8.1); Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15).

### 7.4 Closure properties

**7.4.1.** Prove that, in a semitopos, equivalences are effective epimorphisms, homotopic morphisms are effective
epimorphisms together, and a left exact colimit-preserving functor between semitopoi preserves them (HTT,
Prop. 6.2.3.7, p. 606). More generally, being one is invariant under equivalence in `O_𝒳`, since Čech nerves
and their colimits are functorial in `O_𝒳`. Proof route: such a functor preserves Čech nerves because it is left exact, and
their colimits because it preserves colimits. In particular left exact left adjoints between ∞-topoi do (HTT, Rem. 6.2.3.6, p. 605).
*Needs:* §7.2.1, §7.3.2, §4.2.1; §4.4.1 (for ∞-topoi); Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11) and Part AdjunctionsAndLocalizations §1.5.1
(HTT, Prop. 5.2.3.5); §3.1.3 (HTT, Def. 6.1.0.4); Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2; §6.1.2: Čech
nerves); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7).

**7.4.2.** Prove that, in a semitopos, for `h = g ∘ f`: if f and g are effective epimorphisms then so is h; and if h
is one then so is g (HTT, Cor. 6.2.3.12, p. 607). Proof route: `h^* = f^* ∘ g^*` on subobjects by pasting,
and the subobject criterion of §7.3.
*Needs:* §6.1.1, §7.3.3; Part LimitsAndKanExtensions §6.5.1 (HTT, Lemma 4.4.2.1).

**7.4.3.** Prove that, in a semitopos, a coproduct of effective epimorphisms is an effective epimorphism (HTT,
Cor. 6.2.3.11, p. 607). Proof route: apply the subobject criterion of §7.3. Pullback to a coproduct
decomposes as a product of pullbacks: for 𝒳 presentable with universal colimits, the map
`Sub(⊔ Xα) → ∏ Sub(Xα)` given by pullback is injective, since a subobject of the coproduct is the
coproduct of its pullbacks, and it is bijective when coproducts are disjoint, by §1.6 (HTT, Rem. 6.2.3.9,
p. 606).
*Needs:* §1.3.1, §1.6.2, §6.1.1, §7.3.3; Conventions 5; Part PresentableInfinityCategories §6.1.2 (HTT, Rem. 5.5.6.12;
Prop. 5.5.6.16); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15).

**Checks** (closure).

- In `S`, take h the composite `∗ → ∗ ⊔ ∗ → ∗`. h and its second factor, the fold map, are effective
  epimorphisms, but the first factor is not, since it misses a component. So the second half of the
  composition statement concludes only about g; a version claiming f as well would be false.
- The coproduct of `∗ → ∗` with `∅ → ∗` is `∗ → ∗ ⊔ ∗`, which is not effective. So every summand must be
  effective, and a version asking this of one summand only would fail.
- In the nerve of abelian groups, where colimits are not universal, the diagonal subgroup and 0 of `ℤ ⊕ ℤ`
  both pull back to 0 along both summand inclusions. So pullback to the summands is not injective on
  subobjects there, and universality is needed for the coproduct statement.

### 7.5 Descent along effective epimorphisms

**7.5.1.** Prove that, in a semitopos, effective epimorphisms are stable under pullback; and conversely, if the
pullback of f along an effective epimorphism g is an effective epimorphism, so is f (HTT, Prop. 6.2.3.15,
p. 609). Proof route: pullback `g^*` is left exact and preserves colimits, so it preserves Čech nerves and
resolutions. For the converse, `f ∘ g′ ≃ g ∘ f′` with f′, g, g′ effective, and the second half of the
composition statement of §7.4 applies.
*Needs:* §7.3.2, §7.4.2; §1.1.1 (HTT, Def. 6.1.1.2); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7); Part LimitsAndKanExtensions §9.1.3 (HTT, §6.1.2: Čech nerves); Part LimitsAndKanExtensions §9.4.1 (HTT,
Prop. 6.1.2.11) and Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5).

**7.5.2.** Prove that, in a semitopos, if the pullback of f along an effective epimorphism is an equivalence, then f is
an equivalence (HTT, Lemma 6.2.3.16, p. 610). Proof route: the Čech nerve of the effective epimorphism
pulls f back to a levelwise equivalence of simplicial objects. Their colimits are the source and target of
f, by §7.5.1 and universality.
*Needs:* §7.5.1; §7.2.1, §7.3.2; Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11).

**7.5.3.** Prove that, in a semitopos, pullbacks of n-truncated morphisms are n-truncated; and conversely, if the
pullback of f along an effective epimorphism is n-truncated, then so is f (HTT, Prop. 6.2.3.17, p. 610).
Proof route: induction on n ≥ −2. The case n = −2 is §7.5.2, since (−2)-truncated morphisms
are equivalences. The inductive step uses that f is n-truncated exactly when its diagonal is
(n−1)-truncated, and the diagonal of the pullback is the pullback of the diagonal.
*Needs:* §7.5.1, §7.5.2; Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part InfinityCategoryFoundations §10.7.1 (HTT, Def. 5.5.6.8, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15), §6.1.5 (HTT, Prop. 5.5.6.16); Part AdjunctionsAndLocalizations §1.5.1 (HTT,
Prop. 5.2.3.5).

**Checks** (descent).

- In `S`, `ℤ ⊔ ℤ → ∗ ⊔ ∗` is the pullback of `ℤ → ∗` along the effective epimorphism `∗ ⊔ ∗ → ∗`. It is
  0-truncated, and so is `ℤ → ∗`. Along the non-effective `∅ → ∗` every map pulls back to the identity of
  ∅, an equivalence, while `ℤ → ∗` is not one; so the effectiveness hypothesis is needed.
- The base point `∗ → S¹` pulls back along itself to `ℤ → ∗`, which is 0-truncated, so `∗ → S¹` is
  0-truncated. It is not (−1)-truncated, since its pullback `ℤ → ∗` is not a monomorphism. The levels are
  distinguished as the statement requires.

### 7.6 Colimit covers and local classes

**7.6.1.** Prove that, in a semitopos, for a colimit diagram `p : K^▷ → 𝒳` with cone point ∞, the induced map from
the coproduct of the `p(x)`, x a vertex of K, to `p(∞)` is an effective epimorphism (HTT, Lemma 6.2.3.13,
p. 608). Proof route: by the subobject criterion of §7.3 and the coproduct statement of §7.4, it suffices
that pullback along the maps `p(x) → p(∞)` is jointly injective on `Sub(p(∞))`. Pulling back two
subobjects along p gives Cartesian transformations into p whose sources are colimit diagrams (§1.5 (5)).
An equivalence between them over K is therefore one at the cone point.
*Needs:* §1.4.1, §1.5.1, §6.1.1, §7.3.3, §7.4.3; §1.1.1 (HTT, Def. 6.1.1.2); Part InfinityCategoryFoundations §1.2.2 (HTT, §1.2.8).

**7.6.2.** Prove that, in an ∞-topos, a class S of morphisms that is stable under pullbacks and coproducts is local
exactly when it descends along effective epimorphisms: whenever the pullback of f along an effective
epimorphism lies in S, so does f (HTT, Prop. 6.2.3.14, p. 608). Proof route: if S is local, write the
target of f as the colimit of the Čech nerve of the effective epimorphism. Then f is the colimit of a
Cartesian transformation whose terms lie in S, by stability under pullback and coproducts, and §2.2 puts f
in S. Conversely, check §2.3 (3): given a pushout of Cartesian squares in S, pull back along the effective
epimorphism of §7.6.1 from the coproduct of the three corners. There the pullback of g′ is
a coproduct of pullbacks of f, g and f′, which lie in S.
*Needs:* §7.6.1; §1.2.1 (Cartesian lifts in `O_𝒳`), §2.2.1, §2.3.1, §3.3.2, §4.4.1, §7.2.1, §7.3.2;
§2.1.1 (HTT, Notation 6.1.3.4); Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2; §6.1.2: Čech nerves).

### 7.7 Effective epimorphisms in sets and spaces

**7.7.1.** First the classical prototype. Prove that in the category of sets every equivalence relation is effective,
and that a map of sets is an effective epimorphism exactly when it is surjective (HTT, Fact 6.1.1.6,
p. 553). In Mathlib's terms: in `Type u`, every `CategoryTheory.IsEquivalenceRelation p₁ p₂` is a
`CategoryTheory.IsEffectiveEquivalenceRelation p₁ p₂`, and `EffectiveEpi f ↔ Function.Surjective f`.
Proof route: for R ⊆ X × X an equivalence relation, the quotient map `X → X/R` has kernel pair R, because
two elements have the same class exactly when they are related, and the square is a pushout because the
quotient map is the coequalizer of the two projections. An effective epimorphism is an epimorphism, hence
surjective. Conversely a surjection has a section, so it is a split, hence regular, hence effective
epimorphism. The first half is what the Checks of §7.2 use on the nerve of sets; the second is the
1-categorical statement that §7.7.2 generalizes.
*Needs:* Mathlib `CategoryTheory.IsEquivalenceRelation`, `CategoryTheory.IsEffectiveEquivalenceRelation`,
`CategoryTheory.epi_iff_surjective`, `CategoryTheory.regularEpiCategoryOfSplitEpiCategory`,
`CategoryTheory.isRegularEpi_iff_effectiveEpi`.

**7.7.2.** Prove that a morphism `f : U → X` of `S` is an effective epimorphism exactly when `π₀ U → π₀ X` is
surjective. In particular a base point `∗ → X` is an effective epimorphism exactly when X is connected (HTT, Cor. 7.2.1.15, p. 741). Proof route: `S` is presentable and satisfies descent (§3.2), so it is an
∞-topos (§3.5), hence a semitopos. If f is an effective epimorphism, so is its pullback `F_x → ∗` along each point x
(§7.5). The Čech nerve of `∅ → ∗` has colimit ∅, because `N(Δ)ᵒᵖ` is weakly contractible. So each fiber
`F_x` is nonempty. Conversely, X is the colimit of the constant diagram at ∗ indexed by X, so `⊔_x ∗ → X` is
an effective epimorphism (§7.6). The pullback of f along it is `⊔_x F_x → ⊔_x ∗`. Each `F_x → ∗` with `F_x`
nonempty is effective, because a point splits it (§7.4, composition). A coproduct of effective
epimorphisms is effective (§7.4), so f is effective by the descent half of §7.5.
*Needs:* §3.2.2 (HTT, Lemma 6.1.3.14), §3.5.1 (HTT, Prop. 6.1.3.19), §7.3.2 (HTT, Cor. 6.2.3.5), §7.4.3 (HTT,
Cor. 6.2.3.11; Cor. 6.2.3.12), §7.5.1 (HTT, Prop. 6.2.3.15), §7.6.1 (HTT, Lemma 6.2.3.13); Part PresentableInfinityCategories §1.6.2
(HTT, Ex. 5.5.1.8); Part LimitsAndKanExtensions §3.5.1 (HTT, Cor. 4.4.4.9; Cor. 4.4.4.10); Part InfinityCategoryFoundations §8.1.2 (HTT, Thm. 2.2.0.1); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1); Tau Ceti `SSet.KanComplex.π`.

### Examples

- In `S`: `∗ ⊔ ∗ → ∗` and `∗ → S¹` are effective epimorphisms; `∅ → ∗` is not.
- In `P(C)`: effective epimorphisms are detected objectwise, as colimits and Čech nerves are.
- In the nerve of the category of sets, effective epimorphisms are the surjections (§7.7), which is Mathlib's
  `CategoryTheory.EffectiveEpi` on `Type u`.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresentableInfinityCategories; Mathlib `CategoryTheory.IsEquivalenceRelation`, `CategoryTheory.IsEffectiveEquivalenceRelation`, `CategoryTheory.epi_iff_surjective`, `CategoryTheory.regularEpiCategoryOfSplitEpiCategory`, `CategoryTheory.isRegularEpi_iff_effectiveEpi`; Tau Ceti `SSet.KanComplex.π`. Earlier layers of this Part: Layers 1, 2, 3, 4 and 6. Within the layer: 7.3 uses 7.1, 7.2; 7.4 uses 7.2, 7.3; 7.5 uses 7.2, 7.3, 7.4; 7.6 uses 7.2, 7.3, 7.4; 7.7 uses 7.3, 7.4, 7.5, 7.6.

## Layer 8: Grothendieck topologies and sheaves

### 8.1 Sieves and Grothendieck topologies

**8.1.1.** Define a **sieve** on an ∞-category C to be a full subcategory `C⁽⁰⁾ ⊆ C` that contains the source of every
morphism whose target it contains (HTT, Def. 6.2.2.1, p. 595). Sieves pull back along functors. A sieve on
an object C is a sieve on the slice `C_{/C}`, and a morphism `f : D → C` pulls it back to a sieve on D. A
**Grothendieck topology** on C assigns to each object a collection of covering sieves, subject to three
axioms: the maximal sieve covers; covering sieves pull back to covering sieves; and a sieve whose pullbacks
along all members of a covering sieve cover is itself covering.

- Pulling back along an equivalence of ∞-categories is a bijection on sieves.
- Topologies on C are the same as topologies on its homotopy category (HTT, Rem. 6.2.2.3, p. 596). The
  comparison from the homotopy category of `C_{/C}` to the slice of the homotopy category over C need not
  be an equivalence, but it is surjective on morphisms, so pulling back along it is a bijection on sieves.
  Hence topologies on C correspond to Mathlib `CategoryTheory.GrothendieckTopology` structures on
  `SSet.hoFunctor.obj C`.

**Checks.**

- On Δ[0] there are two sieves on the unique object, the empty and the maximal one, and two topologies,
  the trivial one and the one in which the empty sieve covers. A definition requiring sieves to be
  nonempty would lose the second, and with it the presentation of the one-object ∞-category as the
  sheaves for the topology in which every sieve covers.
- On the nerve of a category D, sieves on an object are Mathlib `CategoryTheory.Sieve`s, and topologies
  are Mathlib's. A definition through simplicial subsets of `C_{/C}` that are not full would produce more
  "sieves" already on Δ[1].
- On `C = Δ[1]`, the slice over the vertex 1 has two objects (the identity and the edge from 0), and there
  are three sieves on 1: empty, the one containing only the edge from 0, and the maximal one. Closure under
  precomposition excludes the sieve containing only the identity.

*Needs:* Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part CartesianFibrations §3.1.2 (HTT, Prop. 1.2.9.3); Part InfinityCategoryFoundations §2.2.1
(HTT, Prop. 1.1.2.2, nerves through `CategoryTheory.nerveAdjunction`, HTT, Prop. 1.2.3.1); Tau Ceti `SSet.fullEnhancedSubcategory`.

**8.1.2.** Sieves are subobjects of representables, and sheaves are defined through this description. Prove that, for C small
and an object C, sending a monomorphism `i : U → j(C)` to the sieve of morphisms `f : D → C` for which
`j(f)` factors through i is a bijection from `Sub(j(C))` to sieves on C (HTT, Prop. 6.2.2.5, p. 597). Proof
route: presheaves on C over `j(C)` are presheaves on `C_{/C}`, so it suffices to treat the final object of
`P(C)`. There, sending a presheaf U to the full subcategory of objects with `U(C)` nonempty is a bijection
from equivalence classes of (−1)-truncated presheaves to sieves (HTT, Lemma 6.2.2.4, p. 597), because a
(−1)-truncated Kan complex is empty or contractible, so such a presheaf is determined by its support, and
the support is closed under precomposition.
*Needs:* §8.1.1; §6.1.1; Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §3.2.5 (HTT, Cor. 5.1.6.12); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13) and Part PresentableInfinityCategories §6.2.1
(HTT, Prop. 5.5.6.18).

### 8.2 Sheaves

**8.2.1.** Define, for a small ∞-category C with a Grothendieck topology, a presheaf F to be a **sheaf** when it is
S-local, where S is the set of monomorphisms `U → j(C)` corresponding to covering sieves under §8.1 (HTT,
Def. 6.2.2.6, p. 597). `Shv(C) ⊆ P(C)` is the full subcategory of sheaves.

- F is a sheaf exactly when, for every object C and covering sieve `C⁽⁰⁾`, the map from `F(C)` to the limit
  of F over `C⁽⁰⁾` is an equivalence. Mapping into F out of the monomorphism of §8.1 computes that limit.
- `Shv(C)` is closed under limits in `P(C)` and is the localization of `P(C)` at a small set, hence
  presentable.
- Representables need not be sheaves. For a subcanonical topology they are.

**Checks.**

- For the trivial topology (only maximal sieves cover), every presheaf is a sheaf and `Shv(C) = P(C)`. A
  definition testing every sieve instead of the covering ones would force `F(C) = ∗` through the empty
  sieve and make `Shv(C)` the one-object ∞-category.
- For Δ[0] with the empty sieve covering, a sheaf has `F(∗)` equal to the limit over the empty diagram, a
  point, so `Shv(Δ[0])` is the one-object ∞-category. A sheaf condition stated with nonempty products only
  would give `S` here.
- On the nerve of a small category D with a topology, the 0-truncated sheaves are exactly the presheaves of
  sets satisfying Mathlib's `CategoryTheory.Presheaf.IsSheaf`. For D discrete on two objects a and b,
  `Shv` is `S × S` for the trivial topology, and `S` when the empty sieve also covers a. A definition that
  imposed the empty-sieve condition on every object once it holds on one would give Δ[0] there.

*Needs:* §8.1.1, §8.1.2; Part PresentableInfinityCategories §1.2.1 (HTT, Def. 5.5.4.1); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3); Part InfinityCategoryFoundations §1.2.1 (HTT,
§1.2.11); Part InfinityCategoryFoundations §10.7.1
(HTT, Ex. 5.5.6.13).

**8.2.2.** Define, for an essentially small
∞-category T with a Grothendieck topology (by §8.1, a topology on the homotopy category) and an arbitrary
∞-category 𝒞, a functor `O : Tᵒᵖ → 𝒞` to be a **𝒞-valued sheaf** when, for every object U and covering
sieve `T⁽⁰⁾` on U, the map from `O(U)` to the limit of O over the sieve is an equivalence. Equivalently, the
composite of `(T⁽⁰⁾)^▷ ⊆ (T_{/U})^▷ → T` with `Oᵒᵖ` is a colimit diagram in `𝒞ᵒᵖ`.
`Shv_𝒞(T) ⊆ Fun(Tᵒᵖ, 𝒞)` is their full subcategory (SAG, Def. 1.3.1.1, p. 116).

- For 𝒞 = `S`, 𝒞-valued sheaves are the sheaves above.
- A functor `G : 𝒞 → 𝒟` that preserves small limits carries 𝒞-valued sheaves to 𝒟-valued sheaves.
- For 𝒞 with small limits, O is a sheaf exactly when `Map(X, O(−))` is a sheaf of spaces for every X in 𝒞.

**Checks.**

- For 𝒞 the nerve of {0 < 1}, where limits are minima and the empty limit is 1, and T = Δ[0] with the
  empty sieve covering, a sheaf must take the value 1. A definition with colimits in 𝒞 in place of limits
  (forgetting to pass to `𝒞ᵒᵖ` in the cone formulation) would force the value 0.
- A definition taking limits over the slice `T_{/U}` instead of over the sieve would make every functor a
  sheaf, since that slice has a final object.
- For the topology on Δ[0] in which the empty sieve covers, `O(∗)` is final in 𝒞. With 𝒞 the nerve of
  abelian groups this forces `O(∗) = 0`, while the trivial topology allows any abelian group.

*Needs:* §8.1.1; Part InfinityCategoryFoundations §1.2.1, §1.2.4 (HTT, §1.2.11; §1.2.15; Def. 1.2.13.4); Part InfinityCategoryFoundations §5.5.4 (HTT,
Prop. 1.2.12.9 and Rem. 1.2.13.5); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3, as Mathlib's instance
`Quasicategory ((ihom K).obj C)`).

### 8.3 Sheaves form an ∞-topos

**8.3.1.** Prove the second headline: **`Shv(C) ⊆ P(C)` is a topological localization, and in particular `Shv(C)` is
an ∞-topos** (HTT, Prop. 6.2.2.7, p. 597). Proof route: it suffices to build a left exact accessible
localization functor inverting the monomorphisms S of §8.2. The class it inverts is generated by S, a set of
monomorphisms, which is the first condition of §6.2; Part PresentableInfinityCategories §4.5 (HTT, Prop. 6.2.1.1) then gives pullback-stability, and `Shv(C)` is an
∞-topos by (L). The functor is a transfinite iterate of the plus construction.
- *Covering sieves as a fibration.* For an ordinary category C with a topology, `Cov(C)` has objects the
  pairs `(C, C⁽⁰⁾)` with `C⁽⁰⁾` covering C, and morphisms the `u : C → D` such that u composed with every
  member of `C⁽⁰⁾` lies in `D⁽⁰⁾`. For an ∞-category C, `Cov(C) = C ×_{N(hC)} N(Cov(hC))`, with projection
  `ρ : Cov(C) → C`, a Cartesian fibration whose fiber over C is the nerve of the poset of covering sieves
  (HTT, Notation 6.2.2.8, p. 597).
- *The plus construction.* Let `C⁺` be the full subcategory of `Fun(Δ[1], C) ×_{Fun({1}, C)} Cov(C)` on the
  pairs `(u : C′ → C, C⁽⁰⁾)` with u in `C⁽⁰⁾`, with `e : C⁺ → C` (the source of u) and `π : C⁺ → Cov(C)`.
  Set `F† = ρ_! π_* e^* F` (HTT, Construction 6.2.2.9, p. 598). Since π is a coCartesian fibration with
  cofinal fiber inclusions, `(π_* F)(C, C⁽⁰⁾)` is the limit of F over `C⁽⁰⁾` (HTT, Rem. 6.2.2.10, p. 598).
  Since ρ is a Cartesian fibration, `(ρ_! G)(C)` is the colimit of `G(C, C⁽⁰⁾)` over covering sieves under
  reverse inclusion, a filtered poset; so `ρ_!`, and with it `F ↦ F†`, is left exact (HTT, Rem. 6.2.2.11,
  p. 599). The sections `C ↦ (C, C_{/C})` of ρ and of `C⁺` give a comparison `F → F†` (HTT, Rem. 6.2.2.13,
  p. 599).
- *One step is an S-equivalence.* For a sheaf G, composition with `F → F†` is an equivalence
  `Map(F†, G) → Map(F, G)` (HTT, Lemma 6.2.2.14, p. 599): rewrite `Map(F†, G)` through the adjunction of
  `ρ_!` and the limit formula for `π_*`; the sheaf condition says G is the right Kan extension of its
  restriction along the sieve maps.
- *Iteration.* Fix a regular κ such that limits over covering sieves commute with κ-filtered colimits in
  `S`, and iterate `F ↦ F†` up to κ, with colimits at limit stages. Each stage is left exact, and each step
  is an S-equivalence. The κ-th stage is a sheaf, since a matching family over a covering sieve factors
  through an earlier stage. This uses the local form of the comparison (HTT, Rem. 6.2.2.15, p. 600): for a
  covering sieve `C⁽⁰⁾` on C and `F₀(f : D → C)` the limit of F over `f^*C⁽⁰⁾`, the comparison `F → F†`
  factors through `F₀` on `C_{/C}`, and `F₀(C)` is the limit of `F₀` over `C⁽⁰⁾`, by cofinality through
  the composite sieve. The κ-th stage is therefore sheafification, left exact, and accessible as a
  localization at a small set.

**Checks.**

- For the trivial topology, `Cov(C) = C` and `(π_* e^* F)(C)` is the limit of F over `C_{/C}`, which is
  `F(C)`, so `F† ≃ F`. A construction over all sieves would make `F†(C)` the value at the empty sieve,
  the largest for reverse inclusion, so a point for every F.
- For Δ[0] with the empty sieve covering, the empty sieve is final for reverse inclusion, so `F†(∗)` is a
  point: one application already sheafifies.
- On presheaves of sets on the nerve of a category, `F†` restricted to 0-truncated objects is the classical
  plus construction. Mathlib's `CategoryTheory.plusPlusSheaf` applies it twice and is a sheafification,
  isomorphic to `CategoryTheory.presheafToSheaf`; one application on sets is not a sheaf in general, which
  is why the construction iterates.

*Needs:* §6.2.1, §8.1.1, §8.2.1; Part PresentableInfinityCategories §4.5.1 (HTT, Prop. 6.2.1.1); Tau Ceti `SSet.CartesianFibration`; Mathlib `CategoryTheory.nerve`; §3.1.3 (HTT, Def. 6.1.0.4); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1), §7.1.4 (HTT, Def. 4.3.3.2; Def. 4.3.2.2) and §8.1.1 (HTT, Def. 5.1.0.1); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7) and §2.1.1 (HTT, Def. 5.2.7.2); Part LimitsAndKanExtensions §5.2.2 (HTT, Prop. 4.1.2.15)
and §2.5.2 (HTT, Prop. 4.1.1.8); Part AdjunctionsAndLocalizations §1.8.2 (HTT, Prop. 4.3.3.7), §1.5.1 (HTT, Prop. 5.2.3.5) and
§2.3.1 (HTT, Prop. 5.2.7.8); Part PresheavesAndCompletions §6.2.2 (HTT, Prop. 5.3.3.3, κ-filtered colimits commute
with κ-small limits); Part PresentableInfinityCategories §4.4.1 (HTT, Prop. 5.5.4.15); Part InfinityCategoryFoundations §10.7.1
(HTT, Ex. 5.5.6.13); §4.4.1 (to read "∞-topos" as (T)).

### 8.4 Topologies and topological localizations

**8.4.1.** Prove that, for a small ∞-category C, `J ↦ Shv_J(C)` is a bijection from Grothendieck topologies on C to
equivalence classes of topological localizations of `P(C)` (HTT, Prop. 6.2.2.17, p. 602). Proof route:
- *Injectivity.* Sheafification `L : P(C) → Shv(C)` inverts a monomorphism `U → j(C)` exactly when its
  sieve covers (HTT, Lemma 6.2.2.16, p. 601), so the topology is recovered from the localization. One
  direction holds by construction. For the other, 0-truncation commutes with L (HTT, Prop. 5.5.6.28), and
  `τ_{≤0}` of the monomorphism is a subpresheaf of `Hom_{hC}(−, C)`; this reduces the claim to sheafification
  of presheaves of sets on the homotopy category, where Mathlib's `CategoryTheory.presheafToSheaf` with
  local surjectivity decides it.
- *Surjectivity.* For a topological localization, declare a sieve covering when its monomorphism is
  inverted. Pullback-stability of covering sieves comes from the topological condition, and locality from
  universality of colimits in `P(C)` and cancellation in strongly saturated classes. The generated class is
  the inverted class, because a topological class is generated by monomorphisms, and monomorphisms into a
  presheaf are colimits of monomorphisms into representables.
*Needs:* §3.3.2 (colimits in `P(C)` are universal), §6.2.1, §8.1.1, §8.1.2, §8.2.1, §8.3.1; Mathlib
`CategoryTheory.presheafToSheaf`; Part PresentableInfinityCategories §3.2.5 (HTT, Cor. 5.1.6.12), §4.1.1 (HTT, Def. 5.5.4.5;
Rem. 5.5.4.6) and §4.4.1 (HTT, Prop. 5.5.4.15); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13) and
Part PresentableInfinityCategories §6.2.3 (HTT, Prop. 5.5.6.28); Part PresheavesAndCompletions §1.4.4 (HTT, Def. 5.1.5.7;
Cor. 5.1.5.8); §2.1.1 (HTT, Notation 6.1.3.4); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10).

**8.4.2.** Prove that, with `C₀` the objects of C on which the empty sieve covers, a sheaf F is initial in `Shv(C)`
exactly when `F(C)` is contractible for C in `C₀` and empty otherwise (HTT, Prop. 6.2.2.18, p. 603). Proof
route: the initial sheaf is the sheafification of the empty presheaf, (−1)-truncated since L is left exact.
By §8.1 it is determined by its support, a sieve, and by the injectivity step of §8.4.1 an object lies in the
support exactly when the empty sieve covers it.
*Needs:* §8.1.2, §8.2.1, §8.3.1; Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16); Part AdjunctionsAndLocalizations §1.5.1 (HTT,
Prop. 5.2.3.5); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7).

### Examples

- The trivial topology gives `Shv(C) = P(C)`. The topology in which every sieve covers gives the
  one-object ∞-category.
- For a topological space X, the nerve of the poset of open sets with open covers gives `Shv(X)`, the
  ∞-topos of sheaves of spaces on X. Its 0-truncated objects form Mathlib's `TopCat.Sheaf` of sets on X.
- For a small category D with a Mathlib topology J, `Shv(N D)` is an ∞-topos whose 0-truncated objects
  form Mathlib's `CategoryTheory.Sheaf J (Type u)`. By §8.4, topological sub-∞-topoi of `P(N D)`
  correspond to topologies on D, as subtopoi of the presheaf topos of sets on D do classically.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, CartesianFibrations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresheavesAndCompletions, PresentableInfinityCategories; Mathlib `CategoryTheory.GrothendieckTopology`, `CategoryTheory.Sieve`, `CategoryTheory.nerveAdjunction`, `CategoryTheory.nerve`, `CategoryTheory.presheafToSheaf`; Tau Ceti `SSet.fullEnhancedSubcategory`, `SSet.CartesianFibration`. Earlier layers of this Part: Layers 3, 4 and 6. Within the layer: 8.2 uses 8.1; 8.3 uses 8.1, 8.2; 8.4 uses 8.1, 8.2, 8.3.

## Layer 9: The universal property of sheaves

### 9.1 Left exact colimit-preserving functors out of sheaves

**9.1.1.** Prove the following (HTT, Prop. 6.2.3.20, p. 612). Let 𝒳 be an ∞-topos and C a small ∞-category with a
topology. Let `L : P(C) → Shv(C)` be sheafification and j the Yoneda embedding. For ∞-categories 𝒜, 𝒳,
consider the full subcategory of `Fun(𝒜, 𝒳)` on left exact colimit-preserving functors (HTT, Def. 6.3.1.10,
names it `Fun^*(𝒜, 𝒳)`; here it is only this full
subcategory). Then composition with L and j, from such functors on `Shv(C)` to such functors on `P(C)` to
`Fun(C, 𝒳)`, is fully faithful. If C has finite limits, its essential image consists of the left exact
`f : C → 𝒳` that send every family generating a covering sieve to an effective epimorphism
`⊔ f(Cα) → f(C)`. Proof route:
- *Presheaves.* Colimit-preserving functors out of `P(C)` are left Kan extensions from C. Such an extension
  is left exact exactly when f is, by §4.3, which applies since 𝒳 satisfies Giraud's axioms; it has a right
  adjoint by the adjoint functor theorem. Composition with L is fully faithful on colimit-preserving
  functors by the universal property of localization at a set.
- *Covering sieves as images.* The monomorphism into `j(C)` of the sieve generated by `fα : Cα → C` is a
  (−1)-truncation, that is the image, of `⊔ j(Cα) → j(C)` in `P(C)_{/j(C)}` (HTT, Lemma 6.2.3.18, p. 611):
  by Yoneda, `j(D) → j(C)` factors through the image exactly when it factors through some `fα`.
- *Factoring through sheaves.* For `f_* : 𝒳 → P(C)` with a left exact left adjoint `f^*`, `f_*` factors
  through `Shv(C)` exactly when every `⊔ f^*j(Cα) → f^*j(C)` over a family generating a covering sieve is an
  effective epimorphism (HTT, Lemma 6.2.3.19, p. 611). Factor `u : ⊔ j(Cα) → j(C)` as an effective
  epimorphism `u′` followed by the covering monomorphism `u″` (previous step, §7.3). If `f_*` lands in
  sheaves, then `f^*` factors through sheafification L. Here `Lu″` is an equivalence by construction, and
  `Lu′` is an effective epimorphism, because L is a left exact left adjoint between ∞-topoi (§7.4, §8.3).
  So `Lu`, and with it `f^*u`, is an effective epimorphism. Conversely, `f_*` lands in sheaves exactly when
  `f^*` inverts the covering monomorphisms. Now `f^*u′` is effective (§7.4), and so is `f^*u` by
  hypothesis, so `f^*u″` is effective by §7.4 (composition). It is also a monomorphism, hence an
  equivalence (§7.3).
*Needs:* §3.3.2, §4.3.1, §4.4.1, §7.3.4, §7.4.1, §7.4.2, §8.1.1, §8.1.2, §8.2.1, §8.3.1; Part PresheavesAndCompletions §1.4.3 (HTT,
Thm. 5.1.5.6) and §1.3.1 (HTT, Prop. 5.1.3.1), §1.3.2 (HTT, Prop. 5.1.3.2); Part PresentableInfinityCategories §4.4.2 (HTT, Prop. 5.5.4.20;
Prop. 5.5.4.15) and §2.2.2 (HTT, Cor. 5.5.2.9); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13) and
Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10); Part PresheavesAndCompletions §1.1.1 (HTT,
§5.1.3).

### 9.2 The canonical topology

**9.2.1.** Define, for a semitopos 𝒳, a small ∞-category C with finite limits and a left exact `f : C → 𝒳`, a sieve on
an object C to be a **canonical covering relative to f** when it contains a family `uα : Cα → C` such that
`⊔ f(Cα) → f(C)` is an effective epimorphism of 𝒳 (HTT, Def. 6.2.4.1, p. 613). A sieve containing a
canonical covering is one.

- **9.2.2.** Prove that canonical coverings relative to f form a Grothendieck topology on C, the **canonical topology**
  relative to f (HTT, Prop. 6.2.4.2, p. 614). Proof route: identities are effective epimorphisms (§7.4).
  Pulling back along `g : D → C` preserves canonical coverings, because f is left exact, colimits in 𝒳 are
  universal, and effective epimorphisms are pullback-stable (§7.5). Locality follows from composition and
  coproducts of effective epimorphisms (§7.4).

**Checks.**

- For f the Yoneda embedding of C into `P(C)` (C with finite limits), a canonical covering of C contains a
  family whose coproduct maps onto `j(C)` objectwise on `π₀`. At the object C the identity must lift, so
  some member has a section and the sieve is maximal: the canonical topology is trivial. A definition
  through families jointly epimorphic in the homotopy category of C would accept proper sieves here.
- For f the functor from the nerve of the poset of open sets of a space X to `Shv(X)` sending U to the
  sheafified representable, the canonical coverings are the open covers. In the poset of opens every
  morphism is an epimorphism, so a definition through jointly epimorphic families would count `{V → U}`
  with V a proper open subset of U as a covering.
- The empty sieve on C is a canonical covering exactly when `f(C)` is initial, because `∅ → f(C)` is an
  effective epimorphism exactly when it is an equivalence (§7.3, §1.6). In the example of open sets, the
  empty open set is covered by the empty family, as in Mathlib's topology on opens; a definition requiring
  nonempty families would miss this.

*Needs:* §7.2.1, §7.3.2, §7.4.1, §7.4.2, §7.4.3, §7.5.1, §8.1.1; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.4 (HTT, Def. 1.2.13.4).

**9.2.3.** Prove the comparison with 𝒳 (HTT, Prop. 6.2.4.6, p. 617). Let 𝒳 be a semitopos, C a small ∞-category with
finite limits, and `F ⊣ G : P(C) ⇄ 𝒳` an adjunction with `f = F ∘ j` left exact, and give C the canonical
topology relative to f. Then (1) G factors through `Shv(C)`. (2) If f is fully faithful and its image
generates 𝒳 under colimits, then G carries effective epimorphisms of 𝒳 to effective epimorphisms of
`Shv(C)`. Proof route:
- *(1).* By adjunction, G lands in sheaves exactly when F inverts each covering monomorphism
  `i : U → j(C)`. Take for the family all members `Cα → C` of the sieve; then `⊔ f(Cα) → f(C)` is an
  effective epimorphism, by §7.4 (composition) from the family in the definition. By §9.1 (covering sieves
  as images) and §7.3, U is the colimit of the Čech nerve V• of `⊔ j(Cα) → j(C)`. F preserves colimits, and
  `F ∘ V•` is the Čech nerve of `⊔ f(Cα) → f(C)`, since f is left exact and colimits in `P(C)` and in 𝒳 are
  universal. Its colimit is f(C), so `F(i)` is an equivalence. This uses only that 𝒳 is a semitopos, not
  the ∞-topos hypothesis of §9.1.
- *Initial objects.* If `f(C)` is initial in 𝒳, then `L j(C)` is initial in `Shv(C)` (HTT, Lemma 6.2.4.3,
  p. 615): the empty sieve covers C by the last Check above, so L inverts `∅ → j(C)`, and L preserves
  initial objects.
- *Coproducts.* If f is fully faithful, coproducts in 𝒳 are disjoint, and the `f(uα)` exhibit `f(C)` as a
  coproduct of the `f(Cα)`, then every sheaf F for the canonical topology has `F(C)` equivalent to the
  product of the `F(Cα)` through the `F(uα)` (HTT, Lemma 6.2.4.4, p. 615). It suffices that L inverts
  `v : ⊔ j(Cα) → j(C)`. The family covers, so the image of v (§9.1, covering sieves as images) is a
  covering monomorphism, which L inverts; hence Lv is an effective epimorphism (§7.3, §7.4). By §7.5
  (equivalences descend along effective epimorphisms) it suffices that L inverts the pullback of v along v.
  By universality in `P(C)` that pullback is the coproduct over β of the maps
  `⊔_α j(Cα ×_C Cβ) → j(Cβ)`. The summand α = β is an equivalence, and for α ≠ β the object
  `f(Cα ×_C Cβ)` is initial, both by §1.6; so those summands go to initial sheaves by the previous step.
- *Local lifting.* This step holds for a small ∞-category C with any Grothendieck topology, not only the
  canonical one. In `Shv(C)`, `u : F₀ → F` is an effective epimorphism when, for every object C, every
  point of `π₀ F(C)` lifts locally: along some family generating a covering sieve of C, its restrictions
  come from points of `π₀ F₀(Cα)` (HTT, Lemma 6.2.4.5, p. 616). Replace u by the inclusion of its image,
  a monomorphism (§7.3, §7.4). A monomorphism of sheaves with the local lifting property is an equivalence,
  because representables generate `P(C)` under colimits and colimits in `P(C)` are universal.
- *(2).* Given an effective epimorphism `Y′ → Y` and a point of `G(Y)(C)`, a map `f(C) → Y`, the pullback
  of `Y′ → Y` to `f(C)` is an effective epimorphism (§7.5). Since the image of f generates 𝒳, the source of
  that pullback is covered by an effective epimorphism from a coproduct of objects `f(Cα)` (§7.6), and the
  composite to `f(C)` is effective (§7.4). As f is fully faithful, its components are `f(vα)` for maps
  `vα : Cα → C`, which form a canonical covering of C along which the point lifts. The local lifting step
  concludes.
*Needs:* §9.2.2; §1.6.2, §3.3.2, §7.3.1, §7.3.2, §7.4.1, §7.4.2, §7.5.1, §7.5.2, §7.6.1, §8.1.1, §8.2.1, §8.3.1, §9.1.1; Conventions 5;
Part AdjunctionsAndLocalizations §1.1.3 (HTT, Def. 5.2.2.1); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10); Part LimitsAndKanExtensions §9.1.3 (HTT, §6.1.2: Čech nerves); 
Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part InfinityCategoryFoundations §5.5.1 (HTT, Def. 1.2.12.3); Part PresheavesAndCompletions §1.4.5 (HTT, Cor. 5.1.5.8) and §1.3.1 (HTT, Prop. 5.1.3.1), §1.3.2 (HTT, Prop. 5.1.3.2).

### Examples

- For 𝒳 = `Shv(D)`, D a subcanonical site with finite limits, and f the sheafified Yoneda embedding, the
  canonical topology contains the original one.
- For 𝒳 an ∞-topos and C a small full subcategory of 𝒳 closed under finite limits that generates 𝒳 under
  colimits, §9.2 applies with F the left Kan extension of the inclusion: G lands in sheaves for the
  canonical topology and preserves effective epimorphisms. This presents 𝒳 through sheaves on C.
- In `Shv(C)`, the map from the coproduct of representables of a covering family to the representable is an
  effective epimorphism after sheafification (§9.1).

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresheavesAndCompletions, PresentableInfinityCategories. Earlier layers of this Part: Layers 1, 3, 4, 7 and 8. Within the layer: 9.2 uses 9.1.

## Layer 10: The ∞-category of ∞-topoi

### 10.1 Geometric morphisms

**10.1.1.** Define a geometric morphism from an ∞-topos X to an ∞-topos Y to be a functor f_* : X → Y that admits a left
adjoint f^* which is left exact, that is, preserves finite limits (HTT, Def. 6.3.1.1, p. 618).

- A left adjoint of f_*, when it exists, is determined up to equivalence by f_*, so being a geometric morphism
  is a property of f_*. Conversely, f_* is determined up to equivalence by f^*, and geometric morphisms are
  often named by their left adjoints.
- A geometric morphism preserves small limits. Its left adjoint preserves small colimits and finite limits.
- Identity functors and equivalences of ∞-categories between ∞-topoi are geometric morphisms, and a composite
  of geometric morphisms is one.

**Checks.**

- For a space A, the functor S → S given by K ↦ Map(A, K) has left adjoint A × (−). That left adjoint
  preserves pullbacks but sends the final object to A. For A = ∂Δ[1] the functor is a right adjoint that is
  not a geometric morphism, so a definition asking only for a left adjoint is wrong.
- In S × S, the presheaf ∞-topos on a two-point set, the global sections functor (U, V) ↦ U × V is a geometric
  morphism to S: its left adjoint K ↦ (K, K) is left exact. It does not preserve the coproduct (Δ[0], ∅) ⊔ (∅,
  Δ[0]), which it sends to Δ[0] instead of ∅ ⊔ ∅. So a definition asking f_* to preserve colimits is wrong.
- The functor Δ[0] → X picking a final object is a geometric morphism, with left adjoint X → Δ[0]. The unique
  functor X → Δ[0] has left adjoint picking an initial object, which is left exact only when the initial
  object is final, that is, only when X is equivalent to Δ[0]. This fixes the direction convention.

*Needs:* §3.1.2 (HTT, Thm. 6.1.0.6 (3)); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7), §1.1.3 (HTT, Def. 5.2.2.1);
Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Mathlib
`CategoryTheory.Bicategory.Adjunction.comp` in `SSet.QCat.bicategory` (HTT, Prop. 5.2.2.6, composites of
adjunctions).

### 10.2 The ∞-categories of geometric morphisms

**10.2.1.** Define, for ∞-topoi X and Y, Fun_*(X, Y) as the full subcategory of Fun(X, Y) spanned by the geometric
morphisms, and Fun^*(Y, X) as the full subcategory of Fun(Y, X) spanned by their left adjoints (HTT, Def.
6.3.1.10, p. 620).

- Fun^*(Y, X) is the full subcategory of functors that preserve small colimits and finite limits: a
  colimit-preserving functor between presentable ∞-categories has a right adjoint by the adjoint functor
  theorem.
- Passing to adjoints identifies Fun_*(X, Y) with the opposite of Fun^*(Y, X).
- Both are ∞-categories, being full subcategories of functor ∞-categories, and their morphisms are all natural
  transformations, not only the invertible ones.

**Checks.**

- Fun^*(S, S) is a contractible Kan complex. A colimit-preserving functor S → S is determined by its value on
  the point, and left exactness forces that value to be final. Using all colimit-preserving functors instead
  would give an ∞-category equivalent to S.
- Fun^*(S × S, S) is equivalent to ∂Δ[1]: its objects are the two projections, and there is no natural
  transformation between them, since the component at (U, ∅) would be a map U → ∅. The colimit-preserving
  functors S × S → S include (U, V) ↦ U ⊔ V and, for all a, b ≥ 0, the functor sending (U, V) to the a-fold
  coproduct of U with the b-fold coproduct of V. So Fun_*(S, S × S) has two objects up to equivalence, while
  the right adjoints S → S × S form an infinite family.
- Fun_*(Δ[0], X) is the full subcategory of final objects of X, a contractible Kan complex, and Fun_*(X, Δ[0])
  is empty unless X is equivalent to Δ[0] (§10.1).

*Needs:* §10.1.1; Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop.
5.2.3.5); Part PresentableInfinityCategories §2.2.2 (HTT, Cor. 5.5.2.9); Part PresheavesAndCompletions §1.5.2 (HTT, Prop.
5.2.6.2); Mathlib instance `Quasicategory ((ihom K).obj C)`.

### 10.3 `LTop` and `RTop`

**10.3.1.** Define `LTop` and `RTop` as the subcategories of `Ĉat∞` whose objects are the ∞-topoi; a functor between ∞-topoi
belongs to `LTop` when it preserves small colimits and finite limits, and to `RTop` when it is a geometric
morphism (HTT, Def. 6.3.1.5, p. 619). Subcategories are in the sense of Part InfinityCategoryFoundations §1.2 (HTT, §1.2.11):
a subcategory is determined by a subcategory of the homotopy category.

- The mapping space from X to Y in `LTop` is the core of Fun^*(X, Y), and in `RTop` it is the core of Fun_*(X,
  Y).
- Both contain every equivalence between ∞-topoi and are closed under composition.

**Checks.**

- In `RTop`, the mapping space from Δ[0] to X is contractible and the one from X to Δ[0] is empty unless X is
  trivial (§10.2). So Δ[0] is initial in `RTop`, not final; the final object is S, as Layer 10 goes on to
  prove. A definition with the arrows reversed would get these the wrong way round.
- In `LTop` the mapping space from S to S is contractible (§10.2), while in `Ĉat∞` it is the core of Fun(S, S),
  which is not contractible. So `LTop` is not a full subcategory.
- The projection (U, V) ↦ U from S × S to S lies in `LTop`. The functor (U, V) ↦ U ⊔ V preserves colimits but
  not the final object, so it is not in `LTop`, and its right adjoint K ↦ (K, K) is not in `RTop`. Dropping
  left exactness would admit both.

*Needs:* §10.1.1; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §1.2.1 (HTT, §1.2.11); Tau Ceti `SSet.catInfty` (taken one
universe up).

### 10.4 Slices of an ∞-topos

**10.4.1.** Prove that, for an ∞-topos X and an object U, the slice X/U is an ∞-topos, and that the projection π_! :
X/U → X has a right adjoint π^*, given by pullback along U → 1, which preserves colimits. Hence π^* has a
right adjoint π_*, and π_* : X/U → X is a geometric morphism (HTT, Prop. 6.3.5.1, p. 634).

π^* exists because X has pullbacks, and preserves colimits because colimits in X are universal. Its right
adjoint exists by the adjoint functor theorem, since X/U is presentable. For the first claim, check the
descent criterion of Giraud's theorem for X/U. A natural transformation of diagrams in X/U is a colimit
diagram, or a Cartesian transformation, exactly when its image under π_! is one, because π_! preserves
colimits and both preserves and detects pullbacks. So descent in X/U follows from descent in X.

*Needs:* §1.4.1 (HTT, Def. 6.1.3.1), §4.4.1 (HTT, Thm. 6.1.0.6), §10.1.1; §1.1.1 (HTT, Def. 6.1.1.2);
Part PresentableInfinityCategories §3.2.1 (HTT, Prop. 5.5.3.10), §2.2.2 (HTT, Cor. 5.5.2.9); Part AdjunctionsAndLocalizations
§1.5.1 (HTT, Prop. 5.2.3.5); Part LimitsAndKanExtensions §7.3.5 (HTT, Prop. 4.4.2.9); Part InfinityCategoryFoundations §8.3.1
(HTT, Prop. 1.2.13.8).

### 10.5 Spaces are final in `RTop`

**10.5.1.** Prove that, for every ∞-topos X, Fun^*(S, X) is a contractible Kan complex; hence so is Fun_*(X, S), and S is
a final object of `RTop` (HTT, Prop. 6.3.4.1, p. 628).

Give Δ[0] the topology in which the empty sieve does not cover. Then the sheaves are all presheaves, and
S ≃ P(Δ[0]) = Shv(Δ[0]). The universal property of sheaf ∞-topoi identifies Fun^*(S, X) with the left exact
functors Δ[0] → X, that is, with the final objects of X, which form a contractible Kan complex. Duality of
adjoints then gives the statement for Fun_*(X, S).

*Needs:* §8.1.1 (HTT, Def. 6.2.2.1), §8.2.1 (HTT, Def. 6.2.2.6), §9.1.1 (HTT, Prop. 6.2.3.20), §10.2.1, §10.3.1; Part
InfinityCategoryFoundations §5.5.3 (HTT, Prop. 1.2.12.9); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part
PresheavesAndCompletions §1.5.2 (HTT, Prop. 5.2.6.2).

### 10.6 Points

**10.6.1.** Define a point of an ∞-topos X to be a geometric morphism p_* : S → X; its left adjoint p^* : X → S is the
stalk functor of the point. X has enough points when every morphism f of X such that p^*(f) is an equivalence
for every point p is itself an equivalence (HTT, Remark 6.5.4.7, definition of points, p. 703).

- The points of X are the objects of Fun_*(S, X), and the stalk functors are the objects of Fun^*(X, S), the
  left exact colimit-preserving functors X → S.
- S is the final object of `RTop` (§10.5), so a point is a geometric morphism out of the final object of
  `RTop`.

**Checks.**

- S has exactly one point up to equivalence, the identity, since Fun_*(S, S) is contractible (§10.2). S has
  enough points.
- S × S has exactly two points, with the two projections as stalks (§10.2), and these jointly detect
  equivalences. So it has enough points. A definition counting objects of X, or global sections, would give a
  different answer.
- Δ[0] has no points, since S → Δ[0] is not a geometric morphism (§10.1). It still has enough points,
  vacuously, because every morphism of Δ[0] is an equivalence. So "enough points" does not mean "some point
  exists".
- For a small ∞-category C, evaluation at each object of C preserves small limits and colimits, so it is the
  stalk of a point of P(C). These stalks jointly detect equivalences, so P(C) has enough points.

*Needs:* §10.1.1, §10.3.1, §10.5.1; Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1).

### 10.7 Filtered colimits in ∞-topoi are left exact

**10.7.1.** Prove that filtered colimits in every ∞-topos are left exact (HTT, Ex. 7.3.4.7, case n = ∞, p. 788), in the
sense of Part PresentableInfinityCategories §6.5 (HTT, Def. 7.3.4.2). For an ∞-topos X, choose a left exact presentation L :
P(C) → X. Filtered colimits in P(C) are left exact by Part PresentableInfinityCategories §6.6 (HTT, Ex. 7.3.4.7, the case of
a presheaf ∞-category), and they pass from P(C) to X because X is the essential image of an accessible left
exact localization (Part PresentableInfinityCategories §6.5, HTT, Ex. 7.3.4.6).

*Needs:* Part PresentableInfinityCategories §6.5.1 (HTT, Def. 7.3.4.2), §6.5.4 (HTT, Ex. 7.3.4.6), §6.6.1 (HTT, Ex. 7.3.4.7, presheaf case);
§3.1.2 (HTT, Thm. 6.1.0.6 (3), ∞-topoi); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1);
§4.4.1 (HTT, Thm. 6.1.0.6).

### Examples

- For a small ∞-category C, each object c gives a point of P(C) whose stalk is evaluation at c (§10.6). The
  geometric morphism P(C) → S of §10.5 is the global sections functor, whose left adjoint sends a space to the
  constant presheaf.
- For a final object 1 of an ∞-topos X, the functor π^* : X → X/1 of §10.4 is an equivalence. For X = S and
  U = ∂Δ[1], the slice S/U is equivalent to S × S, and π^* becomes the diagonal K ↦ (K, K).
- For a small ordinary category C, filtered colimits of presheaves of sets on C commute with finite limits,
  which is the 0-truncated part of §10.7 for P(N(C)). For a simplicial set K, filtered colimits in the ∞-topos
  Fun(K, S) are left exact (§10.7), and they are computed pointwise, as in Part PresentableInfinityCategories §6.5 (HTT, Ex.
  7.3.4.5).

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresheavesAndCompletions, AccessibleInfinityCategories, PresentableInfinityCategories; Mathlib
`CategoryTheory.Bicategory.Adjunction.comp`, `SSet.QCat.bicategory`, `Quasicategory ((ihom K).obj C)`; Tau
Ceti `SSet.catInfty`. Earlier layers of this Part: Layers 1, 4, 8 and 9. Within the layer: 10.2 uses 10.1;
10.3 uses 10.1, 10.2; 10.4 uses 10.1; 10.5 uses 10.2, 10.3; 10.6 uses 10.1, 10.2, 10.3, 10.5.

## Layer 11: Limits of ∞-topoi

### 11.1 `LTop` has small limits

**11.1.1.** Prove that `LTop` admits small limits and that the inclusion `LTop` ⊆ `Ĉat∞` preserves them (HTT, Prop. 6.3.2.3,
p. 622). The route treats products and pullbacks, which generate all small limits.

- **Products** (HTT, Prop. 6.3.2.1, p. 621). For a small family {X_α} of ∞-topoi, the product X = ∏ X_α is an
  ∞-topos, each projection X → X_α is left exact and preserves colimits, and the projections exhibit X as a
  product in `LTop`. X is presentable, and limits and colimits in X are computed componentwise, so the descent
  criterion of Giraud's theorem holds in X because it holds in each X_α. X is a product in `Ĉat∞`, since
  products there are computed as homotopy products of simplicial categories, and a functor Y → X is left exact
  and colimit-preserving when all its components are.
- **Pullbacks** (HTT, Prop. 6.3.2.2, pp. 621–622). Let X' → X, X' → Y', p^* : X → Y and q^* : Y' → Y form a
  square of ∞-categories that is homotopy Cartesian for the Joyal model structure, with X, Y and Y' ∞-topoi
  and p^* and q^* left exact and colimit-preserving. Then X' is an ∞-topos, and for every ∞-topos Z a functor
  Z → X' is left exact and colimit-preserving exactly when its composites with the two projections are; in
  particular the two projections are. Colimits in a categorical pullback along colimit-preserving functors are
  detected by the projections, and so are limits along limit-preserving ones. X' is presentable because a
  categorical pullback of presentable ∞-categories along colimit-preserving functors is presentable, and the
  descent criterion holds in X' because it holds in X, Y' and Y and is detected by the projections.

A pullback in `Ĉat∞` is a homotopy pullback for the Joyal model structure, so the two statements give all small
limits.

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §10.3.1; Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1); Part AccessibleInfinityCategories
§1.2.2 (HTT, Lemma 5.4.5.5); Part PresentableInfinityCategories §3.1.1 (HTT, Prop. 5.5.3.5), §3.2.3 (HTT, Prop. 5.5.3.12), §2.2.2
(HTT, Cor. 5.5.2.9); Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.3); Part LimitsAndKanExtensions §3.2.1
(HTT, Thm. 4.2.4.1), §6.5.4 (HTT, Prop. 4.4.2.6).

### 11.2 Topos fibrations

**11.2.1.** Define a topos fibration to be a map p : X → S of simplicial sets that is both a Cartesian and a coCartesian
fibration, whose fibers X_s are ∞-topoi, and for which the functor from X_s to X_s′ associated to each edge
s → s′ of S by the coCartesian structure is left exact (HTT, Def. 6.3.1.6, p. 619).

- Over each edge, the covariant transport X_s → X_s′ is left adjoint to the contravariant transport X_s′ → X_s
  given by the Cartesian structure. So the covariant transports lie in `LTop` and the contravariant transports
  in `RTop`.
- Topos fibrations are stable under base change along any map of simplicial sets.

**Checks.**

- Over S = Δ[0], a map p : X → Δ[0] is a topos fibration exactly when X is an ∞-topos.
- For an ∞-topos X, the projection X × Δ[1] → Δ[1] is a topos fibration whose transports are identities.
- Take the Cartesian and coCartesian fibration over Δ[1] associated to the adjunction between (U, V) ↦ U ⊔ V
  from S × S to S and the diagonal K ↦ (K, K). Both fibers are ∞-topoi, but the covariant transport sends the
  final object (Δ[0], Δ[0]) to the two-point space, so this is not a topos fibration. A definition without
  left exactness of the covariant transports would accept it.
- A definition asking the contravariant transports to be left exact would be vacuous, since right adjoints
  preserve all limits; it would accept the previous non-example.

*Needs:* Tau Ceti `SSet.CartesianFibration`; §3.1.2 (HTT, Thm. 6.1.0.6 (3)); Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1, coCartesian
fibrations); Part AdjunctionsAndLocalizations §1.1.2 (HTT, Def. 5.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1); Part CartesianFibrations §1.5.1
(HTT, §2.4.1, coCartesian edges, p. 136).

### 11.3 Sections of topos fibrations

**11.3.1.** Prove that, for a topos fibration p : X → S with S small, the ∞-category Map_S(S, X) of sections of p (Tau
Ceti `SSet.ihomOver` over the identity of S) is an ∞-topos (HTT, Lemma 6.3.3.2, p. 622). Apply the result on
all sections of a locally coCartesian categorical fibration whose fibers and transports lie in a subcategory
of `Ĉat∞`, Part AccessibleInfinityCategories §8.8 (HTT, Prop. 5.4.7.11, case E empty), to the subcategory `LTop`. Its three
hypotheses on the subcategory hold. `LTop` has small limits preserved by the inclusion into `Ĉat∞` (§11.1). If X
is an ∞-topos then so is Fun(Δ[1], X), and a functor into Fun(Δ[1], Y) lies in `LTop` exactly when its two
evaluations do, because Fun(Δ[1], X) is presentable and its limits and colimits are computed pointwise, so the
descent criterion of Giraud's theorem holds there. A topos fibration is a coCartesian fibration, hence a
categorical and locally coCartesian fibration, and its fibers and covariant transports lie in `LTop` (§11.2).

*Needs:* §11.1.1, §11.2.1; Tau Ceti `SSet.ihomOver`; Part AccessibleInfinityCategories §8.8.1 (HTT, Prop. 5.4.7.11, case E empty).

**11.3.2.** Prove that, for a small filtered partially ordered set A and a topos fibration p : X → N(A), the full
subcategory C⁰ of Cartesian sections in the ∞-category C of all sections of p over N(A) is an accessible left
exact localization of C (HTT, Prop. 6.3.3.3, p. 623).

The route is Lurie's, in two steps.

- **Intersections** (HTT, Lemma 6.3.3.4, p. 623). For an ∞-topos X and a small set {L_α} of accessible left
  exact localization functors X → X, the full subcategory ⋂_α L_α X is an accessible left exact localization
  of X, and in particular an ∞-topos. Index the family by the ordinals below β and choose a regular cardinal κ
  such that every L_α preserves κ-filtered colimits. Build a transfinite sequence of functors F_γ, for γ ≤ βκ,
  starting with the identity, applying the localizations cyclically at successor steps and taking colimits at
  limit steps. Each F_γ is accessible and left exact, by induction, because filtered colimits in X are left
  exact (§10.7). The last functor is a localization functor whose essential image is the intersection.
- **Cofinal restrictions.** For a cofinal subset B ⊆ A, let C_B ⊆ C consist of the sections that are p-right
  Kan extensions of their restrictions to N(B). Restriction is a trivial fibration from C_B to the sections
  over N(B), and a section of it gives a fully faithful right adjoint to restriction with essential image C_B.
  The sections over N(B) form an ∞-topos, by §11.3.1 for the restriction of p to N(B), and
  restriction is left exact, since limits of sections are computed pointwise; so the localization is left
  exact, and it is accessible because restriction and its right adjoint are functors with adjoints between
  presentable ∞-categories. It remains that C⁰ is the intersection of the C_B over all cofinal B. A Cartesian
  section E lies in every C_B: for each α, the elements of B above α form a filtered set, whose nerve is
  weakly contractible, so E(α) is a p-limit of the restriction of E to it. Conversely, if E lies in every C_B
  and α ≤ β, take B to be the elements above β; β is initial in N(B), so E(α) → E(β) is p-Cartesian. Since C
  is an ∞-topos by §11.3.1, the intersection step applies.

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §10.7.1; §11.3.1 (HTT, Lemma 6.3.3.2); Tau Ceti
`SSet.ihomOver`, `SSet.Edge.IsCartesian`; Part AccessibleInfinityCategories §5.4.1 (HTT, Prop. 5.4.7.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1) and §7.1.1 (HTT, Def. 4.3.1.1), §7.1.2 (HTT, Def. 4.3.2.2); Part AdjunctionsAndLocalizations §1.1.3 (HTT, Def. 5.2.2.1) and §2.1.1 (HTT, Def. 5.2.7.2); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part AccessibleInfinityCategories §4.1.2 (HTT, Def. 5.4.2.5); Part PresentableInfinityCategories §3.1.2 (HTT, Prop. 5.5.3.6); Part
LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.4);
Part LimitsAndKanExtensions §7.3.1 (HTT, Props. 4.3.1.9, 4.3.1.10), §7.4.6 (HTT, Prop. 4.3.2.15), §3.5.2 (HTT, Cor.
4.4.4.10).

### Examples

- For a small set A, the product of copies of S indexed by A is the product in `LTop` (§11.1). It is the
  presheaf ∞-topos on the discrete set A.
- For an ∞-topos X and a simplicial set K, the projection X × K → K is a topos fibration, and its ∞-category
  of sections is Fun(K, X), an ∞-topos (§11.3).
- For ∞-topoi X and Y, the product X × Y is the pullback of X → Δ[0] ← Y. Δ[0] is an ∞-topos and both functors
  to it are left exact and colimit-preserving, so the pullback statement of §11.1 recovers binary products and
  their universal property in `LTop`.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, CartesianFibrations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresheavesAndCompletions, AccessibleInfinityCategories, PresentableInfinityCategories; Tau Ceti `SSet.CartesianFibration`,
`SSet.ihomOver`, `SSet.Edge.IsCartesian`. Earlier layers of this Part: Layers 4 and 10. Within the layer: 11.3
uses 11.1, 11.2.

## Layer 12: Homotopy sheaves

Throughout this layer X is an ∞-topos.

### 12.1 Homotopy sheaves and n-connective morphisms

**12.1.1.** For an object U of X, n ≥ 0 and the pointed sphere `S^n = ∂Δ[n+1]` (Conventions 2), let `U^{S^n}` be a cotensor,
a limit of the constant `S^n`-diagram at U, and let `s : U^{S^n} → U` be evaluation at the base point, an object
of X/U. The constant map `U → U^{S^n}` is a section of s. Define the **homotopy sheaf** `πₙ(U)` as a 0-truncation
of s in X/U, which is presentable: a map from s to a discrete object of X/U that induces an equivalence of mapping spaces
into every discrete object. For a morphism f : U → V, `πₙ(f)` is `πₙ` of f regarded as an object of X/V; it is an object of Disc(X/U) (Conventions 8; HTT, Def. 6.5.1.1, p. 676).

- `πₙ(U)` does not depend, up to equivalence, on the choice of cotensor or of truncation, both being unique
  up to equivalence.
- The section `U → U^{S^n}` of s gives `πₙ(U)` a global section in Disc(X/U), its base point.

**Checks.**
- For n = 0, `U^{S^0}` is U × U and s is a projection; in X = `S`, the fiber of `π₀(U)` over a point of U is
  the set of components of U.
- Truncation happens in X/U, not in X. For U = S¹ ⊔ ∗ in `S`, `π₁(U)` lies in Disc(`S`/U), with fiber ℤ over
  every point of S¹ and a point over ∗. The variant that truncates `U^{S¹}` in `S` gives the bare set ℤ ⊔ {∗},
  which no longer records the component over which each class lives.
- In `S`, `π₁` of the circle is not final in `S_{/S¹}`: its fiber is ℤ.

*Needs:* Part InfinityCategoryFoundations §1.2.4 (limits) and §10.1.3 (truncated objects); Part PresentableInfinityCategories §6.2.1 (truncation
functors) and §3.2.1 (slices of presentable ∞-categories); §3.1.2.

**12.1.2.** Define, for 0 ≤ n ≤ ∞, a morphism f : U → V of X to be **n-connective** when it is an effective epimorphism
and `π_k(f)` is final in X/U for 0 ≤ k < n; this does not depend on the choice of cotensors and truncations.
For n = ∞ this says that f is n-connective for every finite n. By convention every morphism is
(−1)-connective (Conventions 10). An object is n-connective when its map to a final object is (HTT,
Def. 6.5.1.10, p. 679).

- An n-connective morphism is m-connective for every m ≤ n.
- n-connectivity is invariant under equivalence in `Fun(Δ[1], X)`.

**Checks.**
- The 0-connective morphisms are the effective epimorphisms, and equivalences are ∞-connective.
- In `S`, ∅ → Δ[0] is not 0-connective.
- In `S`, Δ[0] → S¹ is 0-connective, since S¹ is connected, and not 1-connective: `π₀` of it has fiber ℤ.

*Needs:* §7.1.1 (effective epimorphisms); §12.1.1 (homotopy sheaves).

### 12.2 Truncation, products and subobjects

**12.2.1.** Prove that truncation in `S` is classical. Let K be a Kan complex.

- **Truncated spaces** (HTT, Remark 5.5.6.4, p. 494). For k ≥ −2, K is k-truncated as an object of `S` (Part
  InfinityCategoryFoundations §10.1) exactly when it is a k-truncated Kan complex (Part InfinityCategoryFoundations §10.6, HTT, Def.
  2.3.4.15).
- **Postnikov sections are truncations.** For n ≥ 0, the map K → K(n) to Moore's Postnikov section
  (ModelCategoryTheory, Part KanQuillen §5.1) exhibits K(n) as a τ≤n K in `S` (Part PresentableInfinityCategories §6.2), that is,
  Map(K(n), Z) → Map(K, Z) is an equivalence for every n-truncated object Z of `S`.

Route. The mapping spaces of `S` are the Kan complexes Fun(E, K) (Part InfinityCategoryFoundations §8.1). E = Δ[0] gives
K, so k-truncatedness in `S` implies that of K. Conversely, if K is k-truncated, then `K → K^(∂Δ[k+2])` is a
homotopy equivalence (Part InfinityCategoryFoundations §10.8, HTT, Lemma 5.5.6.17), hence so is
`Fun(E, K) → Fun(E, K)^(∂Δ[k+2])`, and Fun(E, K) is k-truncated by Part InfinityCategoryFoundations §10.8 again. For the
second statement, K(n) is an n-truncated Kan complex (Part KanQuillen §5.1), so it is n-truncated in `S` by the
first. Let Z be n-truncated, hence an n-truncated Kan complex. The map K → K(n) is bijective on π_k for k ≤ n,
and K(n) has trivial homotopy groups above n, so it is (n + 1)-connective (Part KanQuillen §4.1). Replace it
by a monomorphism, through a factorization into a monomorphism and a trivial fibration (Part KanQuillen §3.2).
That monomorphism is built, up to anodyne maps, by attaching simplices of dimension ≥ n + 2 (Part KanQuillen
§4.2, §4.3, the lifting criterion). An extension of a map into Z across such a simplex, or of a homotopy across
it, meets an obstruction in π_j Z for some j ≥ n + 1, which vanishes. So the restriction
Fun(K(n), Z) → Fun(K, Z) is bijective on all homotopy groups at every vertex, and it is a homotopy equivalence
by Whitehead's theorem (Part KanQuillen §1.3).

*Needs:* Part InfinityCategoryFoundations §8.1.2 (HTT, Thm. 2.2.0.1, mapping spaces), §10.1.3 (HTT, Def. 5.5.6.1), §10.6.4 (HTT,
Def. 2.3.4.15), §10.8.1 (HTT, Lemma 5.5.6.17); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18); ModelCategoryTheory,
Part KanQuillen §1.1 (homotopy groups), §1.3.3 (Kerodon, Theorem 3.2.7.1, Whitehead's theorem), §3.2.1 (the
Kan–Quillen model structure), §4.1.1–§4.3.1 (connective maps and the lifting criterion), §5.1.1 (Kerodon, Definition
3.5.7.20, Postnikov sections of Kan complexes).

**12.2.2.** Prove that, for every n ≥ −2, the truncation functor τ≤n : X → X preserves finite products (HTT, Lemma
6.5.1.2, p. 676).

In S, for n ≥ 0, τ≤n is Moore's Postnikov section by §12.2.1, and (K × L)(n) = K(n) × L(n)
(Part KanQuillen §5.1). For n = −2 both sides are final, and for n = −1, τ≤−1 K is ∅ or Δ[0] according as K is
empty or not, which is compatible with products. In P(C), equivalences are detected objectwise and truncation is computed
objectwise, so the claim reduces to S. In general, identify X with the essential image of a left exact
localization L of P(C). X is closed under limits in P(C), so a product in X is a product in P(C), and
truncation in X is L applied to truncation in P(C). L commutes with both.

Deduce that, for n ≥ 1 and an object U, the pinch map of Sⁿ onto the wedge of two copies of Sⁿ gives πₙ(U) the
structure of a group object of the ordinary category Disc(X/U), commutative for n ≥ 2, and likewise for πₙ(f)
of a morphism f (HTT, §6.5.1, after Lemma 6.5.1.2, p. 677). The cotensor by a wedge is a product in X/U, and
τ≤0 of X/U preserves it.

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §10.4.1; §3.1.2 (HTT, Thm. 6.1.0.6 (3), ∞-topoi) and §12.1.1 (HTT,
Def. 6.5.1.1); §12.2.1 (Postnikov sections are truncations); Part PresentableInfinityCategories §6.1.5 (HTT,
Prop. 5.5.6.16), §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
ModelCategoryTheory, Part KanQuillen §5.1.1 (Kerodon, Definition 3.5.7.20, Postnikov sections of Kan complexes,
and their compatibility with products).

**12.2.3.** Prove that, for every object E of X, pullback along the truncation map E → τ≤0 E is a bijection from the
subobjects of τ≤0 E to the subobjects of E, with inverse V ↦ τ≤0 V (HTT, Lemma 7.2.1.13, p. 740, at n = 0 in
X/τ≤0 E, as used in the proof of Prop. 7.2.1.14, p. 741). This Part proves it directly and uses it
in its proof of HTT, Prop. 7.2.1.14, p. 741, in the connectivity layer; Lurie obtains it from Lemma 7.2.1.13,
whose proof depends on that proposition.

Route: in S, a monomorphism of Kan complexes is, up to equivalence, the inclusion of a union of path
components. Hence a subobject V of a Kan complex E is the pullback of the subset π₀V of π₀E, and every subset
of π₀E arises this way. In P(C), monomorphisms, pullbacks and τ≤0 are computed objectwise, so the claim holds
there. For a presentation L ⊣ G of X, G is fully faithful and preserves pullbacks, monomorphisms and
0-truncated objects, and L is left exact and commutes with τ≤0 (Part PresentableInfinityCategories §6.2), so τ≤0 E ≃ L τ≤0 GE.
Let κ : τ≤0 GE → G τ≤0 E be the canonical map, induced by G of E → τ≤0 E. Applying L to
GE → τ≤0 GE → G τ≤0 E gives a map Lκ : τ≤0 E → τ≤0 E under E between 0-truncated objects, using LG ≃ id;
by the universal property of τ≤0 E (Part PresentableInfinityCategories §6.2) it is the identity, so L carries κ to an
equivalence. Both composites of the two maps are then
identities.

- For a subobject V of E, L applied to the presheaf statement for GV ⊆ GE gives V ≃ e^*(τ≤0 V), where e is
  E → τ≤0 E, and τ≤0 V → τ≤0 E is a monomorphism, as L of the monomorphism τ≤0 GV → τ≤0 GE.
- For a subobject W of τ≤0 E, let W′ be the pullback of GW along τ≤0 GE → G τ≤0 E, a subobject of τ≤0 GE.
  G carries e^*W to the pullback of W′ along GE → τ≤0 GE, so τ≤0(e^*W) ≃ L τ≤0 G(e^*W) ≃ L W′ by the presheaf
  statement. L W′ ≃ W, since L is left exact and carries τ≤0 GE → G τ≤0 E to an equivalence.

*Needs:* §3.1.2 (HTT, Thm. 6.1.0.6 (3), ∞-topoi); §4.4.1 (HTT, Thm. 6.1.0.6); §12.2.1 (Postnikov
sections are truncations, at n = 0); Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13: monomorphisms are the
(−1)-truncated morphisms); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresentableInfinityCategories
§6.1.5 (HTT, Prop. 5.5.6.16), §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part LimitsAndKanExtensions §8.2.2 (HTT,
Prop. 5.1.2.2); ModelCategoryTheory, Part KanQuillen §1.2.1 (Kerodon, Theorem 3.2.6.1, the long exact sequence,
which shows that a monomorphism of Kan complexes has empty or contractible homotopy fibers) and §1.3.3 (Kerodon,
Theorem 3.2.7.1, Whitehead's theorem).

### 12.3 Basic properties of homotopy sheaves

**12.3.1.** Prove the three basic properties of the homotopy sheaves of §12.1 (HTT, Def. 6.5.1.1).

- **Through the diagonal** (HTT, Remark 6.5.1.3, p. 677). For a morphism f : U → V of X, π₀(f) is U ×_V
  τ≤0(f), the truncation of f computed in the ∞-topos X/V, and the map from f to its truncation gives π₀(f) a
  global section. For n > 0, πₙ(f) ≃ πₙ₋₁(δ_f) in Disc(X/U), where δ_f : U → U ×_V U is the diagonal. The
  first statement unwinds the definition in X/V. Lurie gives no proof of the second. Write Sⁿ as the pushout
  of two contractible caps along Sⁿ⁻¹. The cotensor of f by Sⁿ over V is then an iterated pullback of the
  cotensor by Sⁿ⁻¹ of δ_f, over U ×_V U, and truncation in X/U commutes with this pullback after evaluation at
  the base point, because the base point is given by the canonical section.
- **Base change** (HTT, Remark 6.5.1.4, p. 678). For a geometric morphism f_* : X → Y with left adjoint f^*
  and a morphism g : V → V′ of Y, there is a canonical isomorphism f^*(πₙ(g)) ≃ πₙ(f^*(g)) in Disc(X/f^*V).
  f^* induces a left exact colimit-preserving functor Y/V′ → X/f^*V′. It commutes with cotensors by the finite
  simplicial sets Sⁿ, because these are finite limits, and with truncation, because left exact
  colimit-preserving functors between presentable ∞-categories commute with truncation.
- **The long exact sequence** (HTT, Remark 6.5.1.5, p. 678). For composable morphisms f : U → V and g : V → W
  of X, there is a sequence of pointed objects of the ordinary category Disc(X/U)

  ⋯ → f^*πₙ₊₁(g) → πₙ(f) → πₙ(g ∘ f) → f^*πₙ(g) → πₙ₋₁(f) → ⋯ → π₀(g ∘ f) → f^*π₀(g),

  exact as groups in degrees ≥ 1, and at π₀(f) and π₀(g ∘ f) through the action of f^*π₁(g) on π₀(f). Lurie
  builds the boundary map from the decomposition of Sⁿ into two hemispheres. For exactness, reduce through a
  presentation and base change to P(C), and then objectwise to S, where the sequence is the long exact
  sequence of a Kan fibration. Lurie leaves exactness at π₀ to the reader; the route uses the action of the
  fundamental group of the base on the components of the fiber (ModelCategoryTheory, Part KanQuillen §1.2).

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §10.1.1, §10.4.1, §12.2.1; §3.1.2 (HTT,
Thm. 6.1.0.6 (3), ∞-topoi) and §12.1.1 (HTT, Def. 6.5.1.1); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part
LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); ModelCategoryTheory, Part KanQuillen §1.2.1 (Kerodon, Theorem
3.2.6.1, the long exact sequence of a Kan fibration and the action on the components of the fiber).

**12.3.2.** Prove that in the ∞-topos `S` homotopy sheaves, truncatedness and connectivity are the classical notions. Let
K be a Kan complex and x a vertex of K.

- **Homotopy sheaves in spaces** (HTT, Remark 6.5.1.6, p. 678). For n ≥ 0, the pullback x^*πₙ(K) of the
  homotopy sheaf πₙ(K) ∈ Disc(S/K) along x : Δ[0] → K is the discrete space on the set
  `SSet.KanComplex.π n K x`; for n = 0 it is the set of path components of K.
- **Truncated spaces** (HTT, Remark 5.5.6.4, p. 494). For k ≥ −2, K is k-truncated as an object of `S` exactly
  when it is a k-truncated Kan complex; this is the first part of §12.2.1, collected here with the other
  two.
- **Connective spaces.** K is 0-connective exactly when it is nonempty. For n ≥ 1, K is n-connective exactly
  when it is nonempty, π₀K is a point and `SSet.KanComplex.π k K x` is trivial for 1 ≤ k < n and every vertex
  x.

Route. Pullback x^* : S/K → S/Δ[0] = S preserves small colimits, because colimits in `S` are universal, and
finite limits, so it commutes with cotensors by Sⁿ and with τ≤0, by the argument of the base-change part of
§12.3.1. It carries the evaluation `K^(Sⁿ) → K` to its fiber over x, the space of maps from the n-sphere to K
sending the base point to x. τ≤0 of a Kan complex is the discrete space on its path components, and the path
components of that fiber are the pointed homotopy classes of maps from the n-sphere, which is
`SSet.KanComplex.π n K x` (ModelCategoryTheory, Part KanQuillen §1.1, the description of homotopy groups that
Part InfinityCategoryFoundations §10.8 also uses). For connectivity, K → Δ[0] is an effective epimorphism exactly when K is nonempty (§7.7). An object of
Disc(S/K) is final exactly when its homotopy fiber over every vertex is a point, because a map over K is an
equivalence when it induces equivalences of homotopy fibers over every vertex (ModelCategoryTheory, Part
KanQuillen §1.2, §1.3); the first statement computes these fibers for πₖ(K).

*Needs:* §7.7.2 (HTT, Cor. 7.2.1.15), §10.4.1; §12.3.1 (base change; HTT, Remark 6.5.1.4); §12.1.1 (HTT, Def. 6.5.1.1), §12.1.2 (HTT, Def. 6.5.1.10); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1) and §10.1.3 (HTT, Def. 5.5.6.1); Part
PresentableInfinityCategories §6.2.3 (HTT, Prop. 5.5.6.28); §12.2.1 (truncated spaces; HTT, Remark 5.5.6.4); ModelCategoryTheory,
Part KanQuillen §1.1 (homotopy groups of Kan complexes), §1.2.1 (the long exact sequence), §1.3.3 (Whitehead's theorem); Tau Ceti `SSet.KanComplex.π`.

### 12.4 Homotopy sheaves and truncatedness

**12.4.1.** Prove that, if f is an n-truncated morphism of X, then π_k(f) ≃ ∗ for all k > n, and that, if n ≥ 0 and
moreover πₙ(f) ≃ ∗, then f is (n − 1)-truncated (HTT, Prop. 6.5.1.7, p. 678).

Induction on n through the diagonal, which is (n − 1)-truncated when f is n-truncated, together with §12.3.
The case n = −2 is that (−2)-truncated morphisms are equivalences. The base case of the second claim, a
0-truncated f, uses that f is then its own 0-truncation in X/V, so π₀(f) is U ×_V U. Then π₀(f) ≃ ∗ says that
the diagonal is an equivalence, that is, that f is (−1)-truncated.

*Needs:* §10.4.1, §12.3.1; Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part InfinityCategoryFoundations §10.7.1 (HTT, Def.
5.5.6.8, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15).

**12.4.2.** Prove that, for an object U of X and an n-truncation p : U → V, the map p induces isomorphisms
π_k(U) ≃ p^*π_k(V) for all k ≤ n (HTT, Lemma 6.5.1.9, p. 679).

Choose a geometric morphism φ_* : X → P(C) with φ_* fully faithful. Truncation and homotopy sheaves commute
with φ^* (§12.3, base change), and φ^*φ_* is the identity, so the claim for X follows from the claim for P(C).
There homotopy sheaves and truncations are computed objectwise, which reduces to S, where it is the statement
that the Postnikov section of a Kan complex, which is its n-truncation in `S` (§12.2), induces isomorphisms on
homotopy groups in degrees ≤ n (Part KanQuillen §5.1), read through §12.3 (homotopy sheaves in spaces).

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §10.1.1, §12.2.1 (Postnikov sections are truncations), §12.3.1, §12.3.2; §3.1.2 (HTT, Thm. 6.1.0.6 (3), ∞-topoi); Part InfinityCategoryFoundations §2.1.8 (HTT, Def.
1.2.10.1, fully faithful functors) and §10.1.3 (HTT, Def. 5.5.6.1); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part
PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2);
ModelCategoryTheory, Part KanQuillen §5.1.1 (Kerodon, Definition 3.5.7.20, Postnikov sections of Kan complexes).

### Examples

- In X = S, for K = ∂Δ[2], a circle (Conventions 2), the fibers of π₁(K) are ℤ and πₙ(K) is final for n ≥ 2
  (§12.3, in spaces), and K is 1-truncated and connected, but not 0-truncated and not 2-connective.
- For a fibration of Kan complexes, the long exact sequence of §12.3 in S is the classical one. For the Hopf
  map S³ → S² it identifies πₙ(S³) with πₙ(S²) for n ≥ 3.
- For E = ∂Δ[1] ⊔ ∂Δ[2] in S, τ≤0 E is a three-point set, and §12.2 identifies the subobjects of E with the
  eight subsets of π₀E.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, PresentableInfinityCategories;
ModelCategoryTheory, Part KanQuillen; Tau Ceti `SSet.KanComplex.π`. Earlier layers of this Part: Layers 4, 7
and 10 (§10.1, §10.4); Layer 3 (§3.1, ∞-topoi as (T)). Within the layer: 12.2 uses 12.1; 12.3 uses 12.2;
12.4 uses 12.2, 12.3.

## Layer 13: Group objects, delooping in spaces and Eilenberg–MacLane objects

Sections 13.1–13.3 treat group objects of an ∞-category with finite products, and of an ordinary category;
they need Part LimitsAndKanExtensions §9.1 and §9.3, the basic definitions of Part InfinityCategoryFoundations, Part InfinityCategoryFoundations §5.5 and §8.3, and Mathlib. Group objects of an ∞-category
with finite limits are the groupoid objects U with `U₀` final, as in Part LimitsAndKanExtensions §9.3 (HTT,
Def. 7.2.2.1); `Grp(𝒳)` is their full subcategory, and `𝒳_*` is the ∞-category of pointed objects. Sections
13.4–13.5 deloop connected pointed spaces by hand, using that groupoid objects of `S` are effective (§3.5) and
that effective epimorphisms of spaces are the π₀-surjections (§7.7). Section 13.6 defines Eilenberg–MacLane
objects of an ∞-topos and treats them in `S`, where homotopy sheaves are homotopy groups (§12.3).

### 13.1 Group objects under finite-product-preserving functors

**13.1.1.** Prove that, for ∞-categories C and D with finite products and a functor f : C → D that preserves finite
products, composition with f carries group objects of C to group objects of D (HTT, Cor. 7.2.2.5, p. 743). The
route: by the characterization of Part LimitsAndKanExtensions §9.3 (HTT, Prop. 7.2.2.4), a group object is a
simplicial object with U₀ final whose values on decompositions [n] = T ∪ T′ with T ∩ T′ = {s} are products,
and f preserves final objects and these products. In the same way, if D ⊆ C is a full subcategory closed under
finite products, a simplicial object of D is a group object of D exactly when it is one of C (HTT, Cor.
7.2.2.6, p. 743).

**Checks.**

- The functor S → S, K ↦ K ⊔ K, does not preserve the final object: it sends Δ[0] to ∂Δ[1]. It does not
  preserve finite products and carries the group object B•ℤ, the nerve of ℤ, to a simplicial space whose
  zeroth term ∂Δ[1] is not final; so the product hypothesis is needed.

*Needs:* Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1), §9.3.4 (HTT, Prop. 7.2.2.4); Part InfinityCategoryFoundations §1.2 (HTT, Def.
1.2.12.3).

### 13.2 Pointed objects and forgetting base points

Zero objects are those of Part InfinityCategoryFoundations §1.2 (HTT, Def. 7.2.2.7, p. 743). For C with a final object 1, the inclusion of the coslice
C_1/ of C under 1 into C_* is an equivalence (HTT, Lemma 7.2.2.8, p. 743): this is the coslice description of
pointed objects in Part LimitsAndKanExtensions §9.3, used below without further mention.

**13.2.1.** Prove that, for an ∞-category C with a final object, C_* has a zero object, and that if C has a zero object,
the forgetful functor C_* → C is an equivalence (HTT, Lemma 7.2.2.9, p. 744). Through the coslice C_1/, the
identity of 1 is initial in the coslice, and it is final there because limits in a coslice are computed in C
(Part InfinityCategoryFoundations §8.3, HTT, Prop. 1.2.13.8). If 1 is also initial, the projection C_1/ → C is a trivial
fibration (Part InfinityCategoryFoundations §5.5, HTT, Prop. 1.2.12.4).

*Needs:* Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1; the coslice description of pointed objects);
Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part InfinityCategoryFoundations §5.5.2 (HTT, Prop.
1.2.12.4), §8.3.1 (HTT, Prop. 1.2.13.8).

**13.2.2.** Prove that, for an ∞-category C with finite products, the forgetful functor C_* → C induces an equivalence
Grp(C_*) → Grp(C) (HTT, Lemma 7.2.2.10, p. 744). Lurie states no hypothesis on C; his proof uses a final
object, for C_*, and finite products of C and C_*, for §13.1. At C = S it identifies the group objects of
pointed spaces with the group objects of spaces.

The forgetful functor factors as the inclusion of C_* into Fun(Δ[1], C), which is closed under limits,
followed by evaluation, which preserves limits (Part LimitsAndKanExtensions §8.2, HTT, Prop. 5.1.2.2). So
§13.1 gives F : Grp(C_*) → Grp(C). Since [0] is initial in Δ^op, there is a natural transformation from the
constant functor at [0] to the identity of N(Δ)^op; composing with it gives a section s : Grp(C) → Grp(C_*),
with F ∘ s the identity. If C has a zero object, F is an equivalence by §13.2.1, hence so is s.
In general, apply this to C_*, which has a zero object by §13.2.1, and compare: s ∘ F agrees
with the composite of the corresponding functors for C_*, which are equivalences.

**Checks.**

- In S, the pointed objects form S_*, with zero object the point; the forgetful functor S_* → S is not an
  equivalence, since S_* has a zero object and S does not (∅ is initial and not final). So the hypothesis of
  the second assertion of Lemma 7.2.2.9 is needed, while Grp(S_*) → Grp(S) is still an equivalence.
- For the nerve of abelian groups, which has a zero object, every object has a unique base point, and pointed
  objects are abelian groups.

*Needs:* §13.1.1; §13.2.1 (HTT, Lemma 7.2.2.9); Part LimitsAndKanExtensions §9.3.2 (HTT, Def.
7.2.2.1); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2).

### 13.3 Group objects in group objects are commutative

**13.3.1.** Prove that, for an ordinary category A with finite products, made Cartesian monoidal by
`CartesianMonoidalCategory.ofHasFiniteProducts` with its braiding, forgetting the outer structure gives an
equivalence Grp(Grp(A)) ≃ CommGrp(A) over Grp(A), in Mathlib's `CategoryTheory.Grp` and
`CategoryTheory.CommGrp`, and that Grp(CommGrp(A)) ≃ CommGrp(A) in the same way. These are the 1-categorical
inputs of the proof of HTT, Prop. 7.2.2.12, pp. 746–747, where Lurie uses them without proof. The route: by
Yoneda, a group object structure on X is a group structure on each Hom(Y, X), natural in Y; a group object of
Grp(A) gives two such structures on each Hom(Y, X), each a homomorphism for the other, so they coincide and
are commutative by `EckmannHilton.mul` and `EckmannHilton.mul_comm`. CommGrp(A) is a full subcategory of
Grp(A) closed under finite products, so Grp(CommGrp(A)) is the full subcategory of Grp(Grp(A)) on the objects
with commutative underlying group, which by the first statement is all of it. Mathlib gives Grp(A) a Cartesian
monoidal structure but not CommGrp(A), so the second statement is read through this full subcategory.

**13.3.2.** Prove also that the group objects of the nerve N(A), in the sense of Part LimitsAndKanExtensions §9.3, form an
∞-category equivalent to the nerve of Grp(A) (HTT, Ex. 7.2.2.2, p. 743; Lurie assumes finite limits, and only
finite products are used). It is the bridge from group objects of an ∞-category to Mathlib's internal groups.
The route: a simplicial object of N(A) is a functor from Δ^op to A. By the product characterization (Part
LimitsAndKanExtensions §9.3, HTT, Prop. 7.2.2.4), it is a group object exactly when U₀ is final and each Uₙ is
the n-fold product of U₁ through the edge maps; then the face map U₂ → U₁ omitting the middle vertex makes U₁
a group object of A, with inverses from the groupoid condition. Conversely the nerve of a group object of A is
such a simplicial object, and the two constructions are inverse.

**Checks.**

- For A = Set, Grp(Grp(A)) is the category of groups with a second, compatible group structure, which forces
  commutativity: the symmetric group S₃ carries no such structure, while every abelian group carries exactly
  one. A version with CommGrp replaced by Grp would identify S₃ with a group object of Grp(Set), which it is
  not.
- For A the one-object category, Grp(A), Grp(Grp(A)) and CommGrp(A) are all the one-object category.
- For A = Set, the group objects of N(Set) are the nerves of groups, so N(Grp(Set)) is the nerve of the
  category of groups; the simplicial set ∂Δ[1], constant as a simplicial object, has U₀ not final and is not a
  group object.

*Needs:* Mathlib `CategoryTheory.Grp`, `CategoryTheory.CommGrp`,
`CategoryTheory.CartesianMonoidalCategory.ofHasFiniteProducts`,
`CategoryTheory.BraidedCategory.ofCartesianMonoidalCategory`,
`CategoryTheory.Grp.instCartesianMonoidalCategory`; `EckmannHilton.mul`, `EckmannHilton.mul_comm`; Part
LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1), §9.3.4 (HTT, Prop. 7.2.2.4).

### 13.4 Čech nerves of base points

**13.4.1.** Prove that for a connected pointed Kan complex X, the Čech nerve of `∗ → X` restricts to a group object `U•`
of `S` with `U_k ≃ (ΩX)^k`, functorially in X, and that under this construction Ω corresponds to evaluation at
`[1]` (HTT, Lemma 7.2.2.11, construction in the proof, p. 745). Proof route: Čech nerves are groupoid objects,
and `U₀ = ∗` is final. The terms are iterated fiber products of the point over X.

*Needs:* Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11) and §9.3.2 (HTT, Def. 7.2.2.1).

### 13.5 Delooping in spaces

**13.5.1.** Prove that the Čech-nerve functor of §13.4 is an equivalence from connected pointed spaces to `Grp(S)` (HTT,
Lemma 7.2.2.11 (1) at 𝒳 = `S`, p. 745). Proof route: every groupoid object of `S` is effective (§3.5), so
restriction identifies effective epimorphisms of `S` with groupoid objects (§7.3). Čech nerves are right Kan
extensions from the augmentation, and simplicial resolutions are left Kan extensions. Group objects are the
groupoid objects with `U₀` final, which correspond to the effective epimorphisms out of ∗. By §7.7 these are
the base points of connected spaces.

*Needs:* §3.5.2, §7.3.2, §7.7.2, §13.4.1; Part LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11), §9.3.2 (HTT, Def.
7.2.2.1) and §7.4.6 (HTT, Prop. 4.3.2.15).

### 13.6 Eilenberg–MacLane objects

**13.6.1.** Define, for an ∞-topos 𝒳 and n ≥ 0, an **Eilenberg–MacLane object of degree n** of 𝒳 to be a pointed object
1 → U whose underlying object U is n-truncated and n-connective, and `EM_n(𝒳)` to be the full subcategory of
the ∞-category `𝒳_*` of pointed objects spanned by them (HTT, Def. 7.2.2.1, Eilenberg–MacLane objects, p.
742). n-connective objects are those of §12.1 (HTT,
Def. 6.5.1.10), truncated objects those of Part InfinityCategoryFoundations §10.1 (HTT, Def. 5.5.6.1), and pointed objects those of Part LimitsAndKanExtensions §9.3. For 𝒳 = `S` these are the
**Eilenberg–MacLane spaces**. By §12.3 (in spaces), a pointed Kan complex X lies in `EM_n(S)` exactly when
`SSet.KanComplex.π k X y` is trivial for every vertex y and every k ≥ 1 with k ≠ n, X is nonempty, and, when
n ≥ 1, π₀X is a point.

- `EM_n(𝒳)` is closed under equivalences in `𝒳_*`, and contains the final object, pointed by the identity, for
  every n.
- In `S`, for n ≥ 1 an Eilenberg–MacLane space of degree n is connected; for n = 0 it is a pointed discrete
  space.

**Checks.**

- The circle, pointed at a vertex, lies in `EM_1(S)`, and the discrete space ℤ pointed at 0 lies in `EM_0(S)`.
  A definition starting at degree 1, or asking connectedness in every degree, would exclude ℤ.
- The 2-sphere is connected and 2-connective but not 2-truncated, since its `π₃` is ℤ. So it lies in no
  `EM_n(S)`; a definition testing only `π_k` for k ≤ n would put it in `EM_2(S)`.
- ∗ ⊔ ∗ pointed at one point lies in `EM_0(S)` but not in `EM_1(S)`, although all its higher homotopy groups
  vanish at both points. A definition without the connectivity clause for n ≥ 1 would put it in `EM_1(S)`; so
  `EM_0` is not contained in the higher `EM_n`.
- In `S × S`, the pointed object (∂Δ[2], Δ[0]) lies in `EM_1`, being the pair of the circle and a point, while
  (∂Δ[2], ∂Δ[1]) lies in no `EM_n`: its first component is not 0-truncated and its second is not connected. A
  definition testing the conditions in a single factor would accept it.
- In Δ[0] the only pointed object is the identity, and it lies in `EM_n(Δ[0])` for every n, because Δ[0] is
  n-truncated and n-connective for every n.

*Needs:* §12.3.2 (in spaces; HTT, Remarks 5.5.6.4, 6.5.1.6); §3.1.2 (HTT, Thm. 6.1.0.6 (3), ∞-topoi) and §12.1.2 (HTT, Def. 6.5.1.10); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1) and §10.1.3 (HTT, Def. 5.5.6.1); Part
LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1, pointed objects); Tau Ceti `SSet.KanComplex.π`.

**13.6.2.** Prove that, for n ≥ 1, the equivalence of §13.5 carries `EM_n(S)` onto the group objects of `S_*` whose terms
lie in `EM_{n−1}(S)`, that is, onto the image of `Grp(EM_{n−1}(S)) ⊆ Grp(S_*) → Grp(S)` (HTT, Lemma 7.2.2.11
(2) at 𝒳 = `S`, p. 745). Proof route: a connected pointed X is an Eilenberg–MacLane space of degree n exactly
when ΩX is one of degree n − 1, by the long exact sequence of the path fibration and §12.3 (in spaces), and
the terms `(ΩX)^k` then lie in `EM_{n−1}(S)`.

*Needs:* §12.3.2 (in spaces), §13.4.1, §13.5.1, §13.6.1; ModelCategoryTheory, Part KanQuillen §1.2.1 (the
long exact sequence of a Kan fibration); Tau Ceti `SSet.KanComplex.π`.

**13.6.3.** Prove that a connected pointed space X is n-connective exactly when its group object is levelwise
(n−1)-connective. This holds because `U_k ≃ (ΩX)^k`, `π_i ΩX ≅ π_{i+1} X`, and n-connectivity in `S` is read
on homotopy groups (§12.3, in spaces). It is the observation used in the proof of HTT Lemma 7.2.2.11 at p.
746.

*Needs:* §12.3.2 (in spaces), §13.4.1, §13.5.1; §12.1.2 (HTT, Def. 6.5.1.10); Tau Ceti
`SSet.KanComplex.π`; ModelCategoryTheory, Part KanQuillen §1.2.1 (the long exact sequence of a Kan fibration).

### Examples

- X = S¹: the group object has `U₁ ≃ ℤ` (discrete), and it is the nerve of the group ℤ. S¹ is an
  Eilenberg–MacLane space of degree 1 and ℤ one of degree 0, as §13.6 predicts.
- X = `BG` for a discrete group G: the group object is the nerve of G.
- Non-example: X = ∗ ⊔ ∗, pointed at one component, is not connected, and `∗ → X` is not an effective
  epimorphism (§7.7). Its Čech nerve has colimit ∗, not X, so §13.5 needs the connectivity hypothesis.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions; ModelCategoryTheory,
Part KanQuillen; Mathlib `CategoryTheory.Grp`, `CategoryTheory.CommGrp`,
`CategoryTheory.CartesianMonoidalCategory.ofHasFiniteProducts`,
`CategoryTheory.BraidedCategory.ofCartesianMonoidalCategory`,
`CategoryTheory.Grp.instCartesianMonoidalCategory`, `EckmannHilton.mul`, `EckmannHilton.mul_comm`; Tau Ceti
`SSet.KanComplex.π`. Earlier layers of this Part: Layers 3, 7 and 12. Within the layer: 13.2 uses 13.1; 13.5
uses 13.4; 13.6 uses 13.4, 13.5.

## Layer 14: Connectivity

Throughout this layer X is an ∞-topos. In Lurie's text, the detection of effective epimorphisms on
0-truncations (HTT, Prop. 7.2.1.14) is proved through Lemma 7.2.1.13, which rests on Prop. 6.5.1.20; that
proposition uses Prop. 7.2.1.14, and so does Prop. 6.5.1.12. This Part breaks the cycle with the subobject
lemma of §12.2, proved directly through a presentation, and the order below is a dependency order.

### 14.1 Effective epimorphisms are detected on 0-truncations

**14.1.1.** Prove that a morphism φ : U → V of X is an effective epimorphism exactly when τ≤0(φ) is an effective
epimorphism in the ordinary category h(τ≤0 X), which is equivalent to τ≤0 X (HTT, Prop. 7.2.1.14, p. 741).

Lurie deduces the forward direction briefly from the subobject criterion (HTT, Prop. 6.2.3.10, §7.3), and proves
the converse through Lemma 7.2.1.13 in X/τ≤0 X; this Part uses §12.2 for both. Both directions use that τ≤0 X is the nerve of h(τ≤0
X), since its mapping spaces are discrete (Part InfinityCategoryFoundations §10.6, HTT, Prop. 2.3.4.18), and that a
pullback in X of 0-truncated objects is 0-truncated (Part PresentableInfinityCategories §6.1, HTT, Prop. 5.5.6.5), hence a
pullback in h(τ≤0 X).

- **Forward direction.** Let φ be an effective epimorphism, and factor τ≤0 φ : τ≤0 U → τ≤0 V through its
  image, an effective epimorphism followed by a monomorphism I → τ≤0 V (§7.3). By §12.2, I is τ≤0 of its
  pullback V′ → V along V → τ≤0 V, a monomorphism, and φ factors through V′, because U → τ≤0 U → τ≤0 V factors
  through I. An effective epimorphism that factors through a monomorphism makes it an equivalence (§7.3), so
  V′ = V and I = τ≤0 V: τ≤0 φ is an effective epimorphism of X. Its Čech nerve lies in τ≤0 X, and its colimit
  τ≤0 V is 0-truncated. For a 0-truncated Z, maps from the colimit to Z are the limit over N(Δ) of the
  discrete mapping spaces from the terms to Z, and a limit over N(Δ) of discrete spaces is the set of elements
  in degree 0 whose two images in degree 1 agree, since every [n] receives a map from [0] and any two vertices
  of [n] span an edge. So τ≤0 φ is the coequalizer in h(τ≤0 X) of the two projections from its kernel pair,
  the first term of the Čech nerve: it is an effective epimorphism of h(τ≤0 X) (Mathlib
  `CategoryTheory.isRegularEpi_iff_effectiveEpi`).
- **Converse.** Let τ≤0 φ be an effective epimorphism of h(τ≤0 X). Factor φ as an effective epimorphism U → V′
  followed by a monomorphism V′ → V (§7.3). By §12.2, V′ is the pullback of a monomorphism i : I → τ≤0 V. Then
  τ≤0 φ factors through τ≤0 V′ = I (§12.2), and i is a monomorphism of h(τ≤0 X). An effective epimorphism is a
  strong epimorphism, and when a composite g ≫ i is a strong epimorphism so is i; hence the monomorphism i is a
  strong epimorphism and an isomorphism (Mathlib `CategoryTheory.strongEpi_of_effectiveEpi`,
  `CategoryTheory.strongEpi_of_strongEpi`, `CategoryTheory.isIso_of_mono_of_strongEpi`). Hence V′ → V is an equivalence.

In particular, for every object E and every k ≥ 0, the truncation map E → τ≤k E is an effective epimorphism,
since its 0-truncation is an equivalence.

*Needs:* §7.3.3 (HTT, Prop. 6.2.3.10), §7.3.4 (HTT, Ex. 5.2.8.16, case n = −1), §12.2.3; Part PresentableInfinityCategories §6.1.1 (HTT, Prop.
5.5.6.5), §6.2.1 (HTT, Prop. 5.5.6.18); Part InfinityCategoryFoundations §10.7.2 (HTT, Lemma 5.5.6.14); Part LimitsAndKanExtensions §9.1.3 (HTT, the definition of Čech nerves after Prop. 6.1.2.11); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4); Part InfinityCategoryFoundations
§10.6.5 (HTT, Prop. 2.3.4.18); Mathlib `CategoryTheory.EffectiveEpi`,
`CategoryTheory.isRegularEpi_iff_effectiveEpi`, `CategoryTheory.strongEpi_of_effectiveEpi`,
`CategoryTheory.strongEpi_of_strongEpi`, `CategoryTheory.isIso_of_mono_of_strongEpi`.

### 14.2 Connectivity through truncation

**14.2.1.** Prove that, for n ≥ −1, an object U of X is n-connective exactly when τ≤n−1 U is a final object of X (HTT,
Prop. 6.5.1.12, p. 679).

The route is Lurie's induction on n, except for one step. The case n = −1 holds because every object is
(−1)-connective and τ≤−2 U is final. The case n = 0 is the description of effective epimorphisms to the final
object through (−1)-truncation. For n > 0, let p : U → τ≤n−1 U. If τ≤n−1 U is final, then
π_k(U) ≃ p^*π_k(τ≤n−1 U) ≃ ∗ for k < n by §12.4, and p is an effective epimorphism by §14.1, where Lurie
appeals to Prop. 7.2.1.14 directly. Conversely, if U is n-connective, then p^*πₙ₋₁(τ≤n−1 U) ≃ ∗. Since p is an
effective epimorphism, πₙ₋₁(τ≤n−1 U) ≃ ∗, and §12.4 shows that τ≤n−1 U is (n − 2)-truncated. Repeating this
reduces to n = 0.

Consequences, each with its locator:

- For k ≥ −1, every truncation map E → τ≤k E is (k + 1)-connective, by the long exact sequence of §12.3, §12.4
  and §14.1.
- **Maps into truncated objects** (HTT, Cor. 6.5.1.14, p. 680). A morphism f : U → U′ of X is
  (n + 1)-connective exactly when composition with f induces a homotopy equivalence from the mapping space in
  X/U′ from the identity of U′ to Y to the mapping space from f to Y, for every n-truncated object Y of X/U′.
  This is the main statement in the ∞-topos X/U′, where the identity of U′ is final: f is (n + 1)-connective
  exactly when τ≤n f is final, and by the universal property of τ≤n that holds exactly when maps from f and
  from the final object to every n-truncated Y agree.

*Needs:* §7.3.1 (HTT, Prop. 6.2.3.4), §7.5.2 (HTT, Lemma 6.2.3.16), §10.4.1, §12.3.1, §12.4.1, §12.4.2, §14.1.1; Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); §12.1.2 (HTT, Def. 6.5.1.10); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12);
Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18).

### 14.3 Connected objects

**14.3.1.** Define an object U of X to be connected when it is 1-connective; by §14.2 this means that τ≤0 U is a final
object of X (HTT, Def. 6.5.1.11, p. 679).

- Connected objects are stable under equivalence.
- A connected object admits an effective epimorphism to the final object and has trivial π₀.

**Checks.**

- In S, a Kan complex is connected exactly when it is nonempty and path-connected. ∂Δ[1] is 0-connective but
  not connected, and ∂Δ[2] is connected. A definition using 0-connectivity would accept ∂Δ[1].
- In a nontrivial ∞-topos, the initial object is not connected, since ∅ → 1 is not an effective epimorphism. A
  definition through homotopy sheaves alone would accept it, since every homotopy sheaf of ∅ lives in
  Disc(X/∅) ≃ Δ[0] and is trivial.
- In S × S, the object (U, V) is connected exactly when both U and V are. (Δ[0], ∅) is not connected, though
  it has a connected component in one factor.

*Needs:* §14.2.1; §12.1.2 (HTT, Def. 6.5.1.10); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12).

### 14.4 Connectivity in slices and of diagonals

**14.4.1.** Prove that, for an object U of X and a 2-simplex σ of X exhibiting a morphism f : V → W over U, f is an
n-connective morphism of X exactly when σ is an n-connective morphism of X/U (HTT, Prop. 6.5.1.19, p. 682).
The map from the slice of X/U over the object W → U to the slice of X over W is a trivial fibration, σ is an
object of the first slice lying over f, and objects correspond under it together with their connectivity.

*Needs:* §10.4.1; §12.1.2 (HTT, Def. 6.5.1.10); Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5);
Mathlib `SSet.rlp_monomorphisms`, Tau Ceti `SSet.rlp_monomorphisms_iff` (trivial fibrations, HTT, Ex.
2.0.0.2).

**14.4.2.** Prove that, for n ≥ 0, a morphism f : U → V of X is n-connective exactly when f is an effective epimorphism
and its diagonal δ : U → U ×_V U is (n − 1)-connective (HTT, Prop. 6.5.1.18, p. 682).

Lurie calls this immediate from the definition and §12.3, and in positive degrees it is. The degree-zero step
needs an argument: for an effective epimorphism f, π₀(f) is final exactly when δ is an effective epimorphism.
Work in the ∞-topos X/V, where f is an object E with E → 1 an effective epimorphism. π₀(f) is the pullback of
τ≤0 E along f, so it is final exactly when τ≤0 E is, by descent of equivalences along the effective
epimorphism f.

- If τ≤0 E is final, apply the subobject lemma of §12.2 in (X/V)/E to the projection E × E → E. Its
  0-truncation is final, because truncation commutes with pullback along E → 1. The image of its section δ is
  therefore everything, so δ is an effective epimorphism.
- Conversely, if δ is an effective epimorphism, then τ≤0 E → τ≤0 E × τ≤0 E is one, by §12.2 and §14.1. It is
  also a monomorphism, being the diagonal of a 0-truncated object, hence an equivalence. So τ≤0 E is
  (−1)-truncated, and final because E → 1 is an effective epimorphism.

*Needs:* §7.3.3 (HTT, Prop. 6.2.3.10), §7.5.2 (HTT, Lemma 6.2.3.16), §10.4.1, §12.2.2, §12.2.3, §12.3.1, §14.1.1; §12.1.2 (HTT, Def. 6.5.1.10); Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15); Part PresentableInfinityCategories §6.2.3 (HTT,
Prop. 5.5.6.28).

### 14.5 Closure properties of n-connective morphisms


**14.5.1.** Prove that, for 0 ≤ n ≤ ∞, an n-connective morphism is m-connective for every m ≤ n, and that a morphism that is n-connective
for every finite n is ∞-connective (HTT, Prop. 6.5.1.16 (1), p. 680). Both are immediate from the definition
by vanishing of homotopy sheaves.

*Needs:* §12.1.2 (HTT, Def. 6.5.1.10).

**14.5.2.** Prove that, for 0 ≤ n ≤ ∞, every equivalence of X is ∞-connective (HTT, Prop. 6.5.1.16 (2), p. 680). An equivalence is an
effective epimorphism and its homotopy sheaves are trivial.

*Needs:* §12.1.2 (HTT, Def. 6.5.1.10); §7.4.1 (HTT, Prop. 6.2.3.7).

**14.5.3.** Prove that, for 0 ≤ n ≤ ∞, homotopic morphisms of X are n-connective together (HTT, Prop. 6.5.1.16 (3), p. 680). Being an
effective epimorphism and the homotopy sheaves are invariant under equivalence in Fun(Δ[1], X).

*Needs:* §12.1.2 (HTT, Def. 6.5.1.10); §7.4.1 (HTT, Prop. 6.2.3.7).

**14.5.4.** Prove that, for 0 ≤ n ≤ ∞, the left adjoint of a geometric morphism carries n-connective morphisms to n-connective morphisms
(HTT, Prop. 6.5.1.16 (4), p. 680). By §14.2 in the slices, n-connectivity is the finality of an
(n − 1)-truncation, and left exact left adjoints commute with truncation.

*Needs:* §10.4.1, §14.2.1; §12.1.2 (HTT, Def. 6.5.1.10); §3.1.2 (HTT, Thm. 6.1.0.6
(3), ∞-topoi); Part PresentableInfinityCategories §6.2.3 (HTT, Prop. 5.5.6.28).

**14.5.5.** Prove that, for 0 ≤ n ≤ ∞ and a 2-simplex of X exhibiting h as g ∘ f with f n-connective, g is n-connective exactly when h
is (HTT, Prop. 6.5.1.16 (5), p. 680). The morphisms g and h are effective epimorphisms together by the behavior of
effective epimorphisms under composition, and the long exact sequence of §12.3 together with descent of the
vanishing of homotopy sheaves along the effective epimorphism f compares their homotopy sheaves.

*Needs:* §7.4.2 (HTT, Cor. 6.2.3.12), §7.5.2 (HTT, Lemma 6.2.3.16), §12.3.1; §12.1.2 (HTT, Def.
6.5.1.10).

**14.5.6.** Prove that, for 0 ≤ n ≤ ∞, a pullback of an n-connective morphism of X is n-connective, and that, conversely, if the morphism
pulled back along is an effective epimorphism, n-connectivity of the pullback implies that of the original
(HTT, Prop. 6.5.1.16 (6), p. 680). Pullback between slices is the left adjoint of a geometric morphism, so
§14.5.4 and §14.4 give the first half. The converse uses base change of homotopy sheaves (§12.3) and
descent along effective epimorphisms.

*Needs:* §7.5.1 (HTT, Prop. 6.2.3.15), §7.5.2 (HTT, Lemma 6.2.3.16), §10.4.1, §12.3.1, §14.4.1; §14.5.4; §12.1.2 (HTT, Def. 6.5.1.10).

**14.5.7.** Prove that, for 0 ≤ n ≤ ∞, in a pushout square of X, if one edge is n-connective, then so is the opposite edge (HTT, Cor.
6.5.1.17, p. 682).

Choose a left exact presentation L : P(C) → X. The n-connective edge and the edge it is pushed out along may
be taken to be images under L of morphisms of P(C), the first one n-connective, by the following lifting step.
The square is then L of a pushout square in P(C), since L preserves pushouts. By §14.5.4 it suffices to treat
P(C), where connectivity is tested objectwise by §14.2 and the commutation of truncation with evaluation. In S
this is the stability of connective maps of Kan complexes under homotopy pushouts.

- **Lifting along a left exact localization** (HTT, Remark 6.5.1.15, p. 680). For a left exact localization L
  : X → Y of ∞-topoi with fully faithful right adjoint G, and an n-connective morphism f : V → V′ of Y, f is
  equivalent in Fun(Δ[1], Y) to L f′ for an n-connective morphism f′ of X. Factor G f as an n-connective
  morphism f′ followed by an (n − 1)-truncated morphism f″, the relative (n − 1)-truncation of G f in X/G V′;
  f′ is n-connective by §14.2 in the slice. Then L f″ ∘ L f′ is equivalent to f. L f′ is n-connective by §14.5.4,
  so L f″ is n-connective by §14.5.5. L f″ is also (n − 1)-truncated, because L is left exact. An n-connective,
  (n − 1)-truncated morphism is an equivalence by §14.2 in the slice over its target, so L f′ is equivalent to
  f.

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §10.4.1, §14.2.1; §14.5.4 and §14.5.5; Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); §12.1.2 (HTT, Def. 6.5.1.10); §3.1.2 (HTT, Thm. 6.1.0.6 (3),
∞-topoi); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresentableInfinityCategories §6.1.5 (HTT, Prop.
5.5.6.16); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); ModelCategoryTheory, Part KanQuillen
§4.3.1 (Kerodon, Corollary 3.5.2.7, connective maps and homotopy pushouts).

### 14.6 Sections of connective morphisms

**14.6.1.** Prove that, for n ≥ 0, a morphism f : U → V of X with a section s, meaning that f ∘ s is homotopic to the
identity of V, is n-connective exactly when s is (n − 1)-connective (HTT, Prop. 6.5.1.20, p. 683).

f is an effective epimorphism because f ∘ s is, which settles n = 0. For n > 0, the long exact sequence of
§12.3 gives π_i(s) ≃ s^*π_(i+1)(f). If s is (n − 1)-connective, descent along the effective epimorphism s
gives π_k(f) ≃ ∗ for 1 ≤ k < n, and the effective epimorphism s also forces π₀(f) ≃ ∗. Conversely, if f is
n-connective, the homotopy sheaves of s vanish in degrees below n − 1, and s is an effective epimorphism. To
see the last point, by §14.4 it suffices to treat the 2-simplex as a morphism of X/V. By §14.1 it suffices
that its 0-truncation is an equivalence, which holds because both ends have final 0-truncation, f being
1-connective.

*Needs:* §7.4.2 (HTT, Cor. 6.2.3.12), §7.5.2 (HTT, Lemma 6.2.3.16), §12.3.1, §14.1.1, §14.2.1, §14.4.1; §12.1.1 (HTT, Def. 6.5.1.1), §12.1.2 (HTT, Def. 6.5.1.10).

### 14.7 The connective and truncated factorization

**14.7.1.** Prove that, for n ≥ −2, the (n + 1)-connective morphisms and the n-truncated morphisms of X form a
factorization system on X in the sense of Part AdjunctionsAndLocalizations §2.5 (HTT, Def. 5.2.8.8): every
morphism factors as an (n + 1)-connective morphism followed by an n-truncated one, and (n + 1)-connective
morphisms are left orthogonal to n-truncated ones (HTT, Ex. 5.2.8.16, p. 391). For n = −1 the classes are the
effective epimorphisms and the monomorphisms, and the factorization system is that of §7.3.

Route. For n = −2 the classes are all morphisms and the equivalences. For n ≥ −1, factor f : U → V through the
n-truncation of f in the ∞-topos X/V (§10.4). The truncation map is (n + 1)-connective by the first
consequence of §14.2, applied in X/V, and §14.4. For orthogonality, take a square from an (n + 1)-connective g
: A → B to an n-truncated h : Y → Z, and let h′ : Y′ → B be the pullback of h along B → Z, an n-truncated
object of X/B. The space of lifts in the square is the fiber, over the given map from g to h′, of restriction
along g from maps in X/B out of the identity of B into h′ to maps out of g into h′. That restriction is a
homotopy equivalence by the second consequence of §14.2, so the space of lifts is contractible.

*Needs:* §7.3.4 (HTT, Ex. 5.2.8.16, case n = −1), §10.4.1, §14.2.1, §14.4.1; Part AdjunctionsAndLocalizations §2.5.1 (HTT, Def. 5.2.8.1), §2.5.2 (HTT, Def. 5.2.8.8); Part InfinityCategoryFoundations §10.7.1 (HTT, Def. 5.5.6.8, Ex. 5.5.6.13); Part
PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18).

### 14.8 Truncated objects over a connective object

**14.8.1.** Prove that, for n ≥ 0 and an (n + 1)-connective object U of X, the functor π^* : X → X/U of §10.4, right
adjoint to the projection, is fully faithful on n-truncated objects and restricts to an equivalence from τ≤n−1
X to τ≤n−1 (X/U) (HTT, Lemma 7.2.1.13, p. 740).

For full faithfulness on n-truncated Y, the mapping spaces from π^*Y to π^*Z are the mapping spaces from
τ≤n(U × Y) to Z. The projection τ≤n(U × Y) → τ≤n Y is an equivalence by §12.2, because τ≤n U is final (§14.2).
For essential surjectivity onto (n − 1)-truncated objects Y of X/U, let Y → Z be the (n − 1)-truncation of the
underlying object in X. The comparison Y → π^*Z is a composite of two n-connective maps, hence an equivalence
between (n − 1)-truncated objects. The first map is a section of the pullback of U → 1, so §14.6 and §14.5.6
apply. The second map is a truncation map (§14.2, first consequence), so §14.5.6 and §14.4 apply; the
composite is n-connective by §14.5.5.

*Needs:* §10.4.1, §12.2.2, §14.2.1, §14.4.1, §14.6.1; §14.5.5, §14.5.6 (HTT, Prop. 6.5.1.16 (5), (6)); Part InfinityCategoryFoundations §10.1.3 (HTT,
Def. 5.5.6.1); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28).

### 14.9 Connectivity of Eilenberg–MacLane objects

**14.9.1.** The Eilenberg–MacLane objects of X and EM_n(X) ⊆ X_* are those of §13.6 (HTT, Def. 7.2.2.1). This section
records how they interact with connectivity and with geometric morphisms.

- For n ≥ 1 an Eilenberg–MacLane object of degree n is connected (§14.3).
- The left adjoint of a geometric morphism carries EM_n(X) into EM_n(Y), since it preserves the final object,
  n-truncated objects and n-connective objects (§14.5.4).

**Checks.**

- The bound n ≥ 1 is needed: in S, the pointed object Δ[0] → ∂Δ[1] lies in EM_0(S), and ∂Δ[1] is not
  connected.
- The left adjoint K ↦ (K, K) of the global sections geometric morphism S × S → S (§10.1 Checks) carries the
  circle, pointed at a vertex, to the pair of circles, which lies in EM_1(S × S).
- Left exactness is needed in the second statement: the left adjoint K ↦ ∂Δ[1] × K of K ↦ Map(∂Δ[1], K) (§10.1
  Checks) sends the final object Δ[0], which lies in every EM_n(S) pointed by the identity, to ∂Δ[1], which is
  not final, so it does not even carry pointed objects to pointed objects.

*Needs:* §10.1.1 (HTT, Def. 6.3.1.1), §13.6.1 (HTT, Def. 7.2.2.1), §14.3.1, §14.5.4 (HTT, Prop. 6.5.1.16 (4)); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); §12.1.2 (HTT, Def. 6.5.1.10).

### Examples

- For a Kan complex K, the truncation map K → τ≤k K is (k + 1)-connective (§14.2): its homotopy fibers are
  k-connected in the classical sense.
- In S, the map ∂Δ[1] → Δ[0] is 0-connective and not 1-connective. Pushing it out along ∂Δ[1] → Δ[1] gives
  Δ[1] → Δ[0] ⊔ over ∂Δ[1] of Δ[1], and that pushout is equivalent to the circle ∂Δ[2]. So the result is the
  inclusion of a point into the circle, which is 0-connective, as §14.5 allows; it is not 1-connective, its
  homotopy fiber ℤ not being connected.
- In S for n = 0, the map Δ[0] → ∂Δ[2] has discrete homotopy fiber ℤ, so it is 0-truncated and §14.7 factors
  it as the identity of Δ[0] followed by itself. The map ∂Δ[2] → Δ[0] factors through τ≤0 ∂Δ[2] = Δ[0] as a
  1-connective map followed by the identity. With the indices shifted to n-connective and n-truncated
  morphisms, orthogonality fails: the square from ∂Δ[1] → Δ[0] to itself with identity edges has no lift,
  since Δ[0] → ∂Δ[1] cannot split ∂Δ[1] → Δ[0].
- For an ∞-topos X and an Eilenberg–MacLane object 1 → U of degree n ≥ 1, §14.8 identifies the
  (n − 1)-truncated objects of X/U with those of X.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresentableInfinityCategories; ModelCategoryTheory, Part KanQuillen; Mathlib
`SSet.rlp_monomorphisms`; Tau Ceti `SSet.rlp_monomorphisms_iff`. Earlier layers of this Part: Layers 3, 4, 7, 10
(§10.1, §10.4), 12 and 13 (§13.6, in §14.9). Within the layer: 14.2 uses 14.1; 14.3 uses 14.2; 14.4 uses 14.1;
14.5 uses 14.2, 14.4; 14.6 uses 14.1, 14.2, 14.4; 14.7 uses 14.2, 14.4; 14.8 uses 14.2, 14.4, 14.5, 14.6; 14.9
uses 14.3, 14.5.

## Layer 15: Delooping and the classification of Eilenberg–MacLane objects in an ∞-topos

This layer generalizes §13.5, and §13.6.2 and §13.6.3, from `S` to an arbitrary ∞-topos 𝒳. It needs the connectivity theory of
Layer 14, because a pointed object of 𝒳 is an effective epimorphism out of the final object exactly when it is
connected (§14.1), and it uses the group objects of §13.1–§13.3.

### 15.1 Delooping in an ∞-topos

**15.1.1.** Prove the following for an ∞-topos 𝒳 and n ≥ 1 (HTT, Lemma 7.2.2.11, p. 745). Let p : Fun(Δ[1], 𝒳) → 𝒳_Δ send
a morphism U → X to the underlying simplicial object of its Čech nerve.

1. On the full subcategory of connected pointed objects (§14.3), p restricts to an equivalence onto Grp(𝒳).
2. The essential image of EMₙ(𝒳) under p is the essential image of Grp(EMₙ₋₁(𝒳)) ⊆ Grp(𝒳_*) → Grp(𝒳).

The route is Lurie's, with one step written out. Čech nerves give an equivalence from effective epimorphisms
to groupoid objects in an ∞-topos (§7.3, HTT, Cor. 6.2.3.5 and the discussion after it; Part
LimitsAndKanExtensions §9.4, HTT, Prop. 6.1.2.11). For (1) it remains that a pointed object u : 1 → X is an
effective epimorphism exactly when X is connected. By §14.1 (HTT, Prop. 7.2.1.14), u is one exactly when
τ≤0(u) is one in Disc(𝒳), and in an ordinary category an effective epimorphism out of a final object is an
isomorphism, since its kernel pair is all of 1 × 1 ≃ 1; τ≤0(u) is an isomorphism exactly when X is connected.

For (2), let X• be a Čech nerve with X₀ final. EMₙ₋₁(𝒳) is closed under finite products in 𝒳_*: products of
k-connective objects are k-connective, because τ≤k−1 preserves finite products (§12.2, §14.2; HTT, Cor.
6.5.1.13, p. 680), and limits of k-truncated objects are k-truncated (HTT, Rem. 7.2.2.3, p. 743; Part
PresentableInfinityCategories §6.1, HTT, Prop. 5.5.6.5). A group object of 𝒳 lifts to Grp(𝒳_*) through the section s of
§13.2, with the same underlying objects. So by §13.1 it suffices that the pointed object X₀ → X₋₁ lies in
EMₙ(𝒳) exactly when X₁ is (n − 1)-truncated and (n − 1)-connective, each Xₖ being a k-fold product of copies
of X₁. In the pullback square with X₁ over two copies of X₀ over X₋₁, the map g : X₀ → X₋₁ is an effective
epimorphism. Then X₁ is (n − 1)-truncated exactly when g is (§7.5, HTT, Prop. 6.2.3.17). Here the route
departs from Lurie's, who passes through the vanishing of homotopy sheaves; in an ∞-topos that is not
hypercomplete such vanishing does not imply truncatedness. Instead, the pullback of the diagonal
X₋₁ → X₋₁ × X₋₁ along g × id : X₀ × X₋₁ → X₋₁ × X₋₁, where X₀ × X₋₁ ≃ X₋₁ since X₀ is final, itself an
effective epimorphism as a pullback of g (§7.5, HTT, Prop. 6.2.3.15), is g; so by the same descent g is
(n − 1)-truncated exactly when the diagonal is, that is, exactly when X₋₁ is n-truncated (Part PresentableInfinityCategories
§6.1, HTT, Lemma 5.5.6.15). Likewise X₁ is (n − 1)-connective exactly when g is (§14.5, HTT, Prop. 6.5.1.16
(6)), exactly when πₖ X₋₁ vanishes for k < n by the long exact sequence (§12.3, HTT, Rem. 6.5.1.5), which with
connectedness says that X₋₁ is n-connective; connectivity, unlike truncatedness, is defined through homotopy
sheaves.

**Checks.**

- In S and for n = 1, the circle ∂Δ[2] with a base point goes to a group object with first term ΩS¹ ≃ ℤ, a
  discrete space, so it lies in the image of Grp(EM₀(S)), as (2) predicts.
- The pointed object Δ[0] → ∂Δ[1] of S is not connected. Its Čech nerve is constant at Δ[0], the trivial
  group, which is also the image of the identity of Δ[0]; so p is not an equivalence on all pointed objects,
  and (1) needs connectedness.
- In S × S, the pointed object (Δ[0], ∂Δ[2]) is connected, both components having τ≤0 equal to Δ[0], and p
  sends it to the group object with first term (Δ[0], ℤ). The pointed object (∂Δ[1], ∂Δ[2]) is not connected,
  its first component having two path components, and lies outside the domain of (1).

*Needs:* §7.3.2 (HTT, Cor. 6.2.3.5), §7.5.1 (HTT, Prop. 6.2.3.15), §7.5.3 (HTT, Prop. 6.2.3.17), §12.2.2 (HTT, Lemma 6.5.1.2), §12.3.1
(HTT, Rem. 6.5.1.5), §13.1.1, §13.2.2, §13.6.1 (HTT, Def. 7.2.2.1), §14.1.1 (HTT, Prop. 7.2.1.14), §14.2.1 (HTT, Prop.
6.5.1.12), §14.3.1 (HTT, Def. 6.5.1.11), §14.5.6 (HTT, Prop. 6.5.1.16 (6)); §7.1.1 (HTT, §6.2.3) and §12.1.1 (HTT, Def. 6.5.1.1), §12.1.2 (HTT, Def. 6.5.1.10); Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2), §9.1.2 (HTT, Def. 6.1.2.7); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part
LimitsAndKanExtensions §9.4.1 (HTT, Prop. 6.1.2.11); Part PresentableInfinityCategories §6.1.1 (HTT, Prop. 5.5.6.5), §6.1.4 (HTT, Lemma 5.5.6.15), §6.1.5 (HTT, Prop. 5.5.6.16).

### 15.2 Classification of Eilenberg–MacLane objects

**15.2.1.** For a pointed object x : 1 → X of an ∞-topos 𝒳, write πₙ(X, x) for the pullback x^*πₙ(X) of the homotopy sheaf
of §12.1 along x, an object of Disc(𝒳); it is a group object for n ≥ 1 and a commutative one
for n ≥ 2 (§12.2).

Prove that, for an ∞-topos 𝒳 and n ≥ 0, πₙ : 𝒳_* → N(Disc(𝒳)) restricts to an equivalence from EMₙ(𝒳) onto the
nerve of the category of pointed objects of Disc(𝒳) for n = 0, of group objects for n = 1, and of commutative
group objects for n ≥ 2 (HTT, Prop. 7.2.2.12, p. 746). Write A ↦ (1 → K(A, n)) for an inverse (HTT, discussion
after Prop. 7.2.2.12, p. 747).

The route is Lurie's induction on n. For n = 0, EM₀(𝒳) is the pointed discrete objects, on which π₀ is the
identity. For n ≥ 1, §15.1 identifies EMₙ(𝒳) with Grp(EMₙ₋₁(𝒳)) through the Čech nerve of the base point,
whose first term is the loop object ΩX, and πₙ₋₁(ΩX) ≃ πₙ(X) (§12.3, HTT, Rem. 6.5.1.3). Write D = Disc(𝒳). By
the inductive hypothesis, §13.2 for the nerve N(D) and the comparison of §13.3 between group objects of a
nerve and internal groups: for n = 1, Grp(EM₀(𝒳)) ≃ Grp(N(D)_*) ≃ Grp(N(D)) ≃ N(Grp(D)); for n = 2,
Grp(EM₁(𝒳)) ≃ N(Grp(Grp(D))) ≃ N(CommGrp(D)); for n > 2, Grp(EMₙ₋₁(𝒳)) ≃ N(Grp(CommGrp(D))) ≃ N(CommGrp(D)),
by §13.3. For n = 0, EM₀(𝒳) is a full subcategory of the pointed objects of τ≤0 𝒳, which has discrete mapping
spaces and is therefore the nerve of the category of pointed objects of D ( Part InfinityCategoryFoundations §10.6, HTT,
Prop. 2.3.4.18).

- A ↦ K(A, n) preserves finite products (HTT, Rem. 7.2.2.13, p. 747), since EMₙ(𝒳) is closed under finite
  products (§15.1) and πₙ commutes with them (§12.2).
- The loop functor Ω : EMₙ₊₁(𝒳) → EMₙ(𝒳) corresponds, for n ≥ 2, to the identity of CommGrp(Disc(𝒳)), since
  πₙ(ΩX) ≃ πₙ₊₁(X) as group objects (§12.3, HTT, Rem. 6.5.1.3).

**Checks.**

- For 𝒳 = S and n ≥ 1, K(A, n) is the Eilenberg–MacLane space of §13.6, which a pointed Kan complex realizes exactly
  when it is homotopy equivalent to the complex K(A, n) of ModelCategoryTheory, Part KanQuillen §5.4.1 (Part
  KanQuillen §5.5.2); for n = 0 it is the pointed set A as a discrete space.
- For n = 1 the classification is by groups, not abelian groups: K(G, 1) for the symmetric group on three
  letters is the pointed classifying space BS₃, an Eilenberg–MacLane space of degree 1 with non-abelian π₁.
  Stating the n = 1 case with commutative group objects would miss it.
- For 𝒳 = Δ[0], Disc(𝒳) is the one-object category and every EMₙ(𝒳) is Δ[0], matching the single (commutative)
  group object.

*Needs:* §12.2.2 (HTT, Lemma 6.5.1.2), §12.3.1 (HTT, Rem. 6.5.1.3), §13.2.2, §13.3.1, §13.3.2, §13.6.1 (HTT, Def. 7.2.2.1),
§15.1.1; §12.1.1 (HTT, Def. 6.5.1.1); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18).

### Examples

- For a small ∞-category C and 𝒳 = P(C), EMₙ(𝒳) for n ≥ 2 is equivalent to the nerve of the category of
  presheaves of abelian groups on the homotopy category of C, and K(A, n) is computed objectwise.
- In S, the Čech nerve of the base point of K(ℤ, 2) is the group object with first term K(ℤ, 1) ≃ S¹, which is
  §13.4 recovered from §15.1.
- In S × S, the presheaf ∞-topos on a two-point set, an Eilenberg–MacLane object of degree n ≥ 2 is a pair of
  Eilenberg–MacLane spaces, and §15.2 classifies it by a pair of abelian groups.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, PresentableInfinityCategories.
Earlier layers of this Part: Layers 7, 12, 13 and 14. Within the layer: 15.2 uses 15.1.

## Layer 16: n-topoi and their colimits

### 16.1 n-topoi

**16.1.1.** Define, for 0 ≤ n < ∞, an n-topos to be an ∞-category X for which there are a small ∞-category C and an
accessible left exact localization L : P≤n−1(C) → X. Here P≤n−1(C) is the full subcategory of P(C) spanned by
the (n − 1)-truncated presheaves, a localization is reflective, and accessible qualifies the functor L (HTT,
Def. 6.4.1.1, p. 657). For n = ∞ the term n-topos means ∞-topos, as in §3.1; statements below
written for 0 ≤ n ≤ ∞ use this convention. For a small ∞-category C with a Grothendieck topology and
−1 ≤ n − 1 < ∞, write Shv≤n−1(C) for the full subcategory of Shv(C) (§8.2) spanned by the (n − 1)-truncated
objects. It is Shv(C) ∩ P≤n−1(C): a sheaf F is (n − 1)-truncated in Shv(C) exactly when it is so in P(C),
because Map(T, F) ≃ Map(LT, F) for every presheaf T, with L the sheafification of §8.3.

- P≤n−1(C) is presentable, and so is every n-topos, as an accessible localization of a presentable ∞-category.
- Every object of an n-topos is (n − 1)-truncated. So an n-topos is equivalent to an n-category: its mapping
  spaces are (n − 1)-truncated, and Part InfinityCategoryFoundations §10.6 (HTT, Prop. 2.3.4.18) applies.

**Checks.**

- For C = Δ[0] and n = 0, P≤−1(Δ[0]) is τ≤−1 S ≃ Δ[1], the two-element poset {∅ < Δ[0]}. So Δ[1] is a 0-topos.
  With P≤n(C) in place of P≤n−1(C), the case n = 0 would instead give the nerve of the category of sets.
- For C = Δ[0] and n = 1, P≤0(Δ[0]) is the nerve of the category of small sets, so the nerve of the category
  of sets is a 1-topos. More generally, the nerve of the category of presheaves of sets on an ordinary small
  category is a 1-topos.
- S is not an n-topos for any finite n: the mapping space from Δ[0] to an Eilenberg–MacLane space K(ℤ, n) is
  K(ℤ, n), which is not (n − 1)-truncated. So S is an ∞-topos that is not an n-topos for any finite n.
- Δ[0] is an n-topos for every n, since P(∅) and every P≤n−1(∅) are Δ[0]. It is also an ∞-topos, so the two
  notions overlap.

*Needs:* §3.1.2 (HTT, Thm. 6.1.0.6 (3)); §8.2.1 (HTT, Def. 6.2.2.6) and §8.3.1 (HTT, Prop. 6.2.2.7), for Shv≤n−1(C); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.2 (HTT, Def. 5.4.2.5); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §10.1.3 (HTT, Def. 5.5.6.1); Part
PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18).

### 16.2 Colimits in n-topoi

**16.2.1.** Prove that filtered colimits in every n-topos are left exact, for 0 ≤ n < ∞ (HTT, Ex. 7.3.4.7, case n < ∞, p.
788). P≤n−1(C) is Fun(C^op, τ≤n−1 S), because a presheaf is (n − 1)-truncated exactly when its iterated
diagonals end in an equivalence, and diagonals and equivalences of presheaves are computed objectwise.
Filtered colimits are left exact in τ≤n−1 S, pass to functor ∞-categories and pass to accessible left exact
localizations, by the three statements of Part PresentableInfinityCategories §6.5 (HTT, Exs. 7.3.4.4, 7.3.4.5, 7.3.4.6). The
case n = ∞ is §10.7.

*Needs:* §16.1.1; Part PresentableInfinityCategories §6.5.1 (HTT, Def. 7.3.4.2), §6.5.2, §6.5.3, §6.5.4 (HTT, Exs. 7.3.4.4, 7.3.4.5, 7.3.4.6); Part
LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresentableInfinityCategories §6.1.1 (HTT, Prop. 5.5.6.5), §6.1.4 (HTT, Lemma 5.5.6.15).

**16.2.2.** Prove that colimits in every n-topos, 0 ≤ n ≤ ∞, are universal (HTT, Prop. 6.4.4.6, p. 669). Universal
colimits pass to left exact localizations, which reduces to P≤n−1(C), and pointwise computation reduces
further to τ≤n−1 S. There, for a map of (n − 1)-truncated spaces, pullback restricts to the slices of
(n − 1)-truncated objects. That restriction commutes with truncation, because pullback preserves all limits
and colimits of S. A colimit diagram of (n − 1)-truncated objects over V is the truncation of a colimit
diagram in S/V, and universality of colimits in S then gives universality in τ≤n−1 S.

*Needs:* §3.2.2 (HTT, Lemma 6.1.3.14), §3.3.1 (HTT, Lemma 6.1.3.15), §3.3.2 (HTT, Prop. 6.1.3.10), §16.1.1; Part
LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Remark 5.2.7.5);
Part InfinityCategoryFoundations §10.7.2 (HTT, Lemma 5.5.6.14), Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28);
§1.1.1 (HTT, Def. 6.1.1.2).

### Examples

- The nerve of the category of small sets is a 1-topos (§16.1), and its filtered colimits are left exact
  (§16.2): filtered colimits of sets commute with finite limits.
- For an ordinary small category C, the nerve of the category of presheaves of sets on C is the 1-topos
  P≤0(N(C)), and its colimits are universal (§16.2), as pullback of presheaves of sets preserves colimits.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, AccessibleInfinityCategories, PresentableInfinityCategories. Earlier layers of this Part: Layers 3 and 8 (§8.2, §8.3, for Shv≤n−1(C)). Within the layer: 16.2 uses
16.1.

## Layer 17: Descent for truncated morphisms

### 17.1 Truncated arrows

**17.1.1.** Define, for an ∞-category X with pullbacks and 0 ≤ n ≤ ∞, O^n_X as the full subcategory of O_X = Fun(Δ[1], X)
spanned by the (n − 2)-truncated morphisms, and O^(n)_X ⊆ O^n_X as the subcategory with the same objects whose
morphisms are the Cartesian transformations, that is, the pullback squares (HTT, Notation 6.4.4.2, p. 668).
For n = ∞ every morphism counts, so O^∞_X is O_X.

- Evaluation at the target, O^n_X → X, is a Cartesian fibration whose Cartesian edges are the pullback
  squares, because (n − 2)-truncated morphisms are stable under pullback; O^(n)_X → X is the corresponding
  right fibration.
- The fiber of O^n_X over an object V is the full subcategory of (n − 2)-truncated objects of X/V.

**Checks.**

- For n = 0, the (−2)-truncated morphisms are the equivalences, so evaluation at the target identifies O^0_X
  with X. An index shift to n-truncated morphisms would instead give the 0-truncated morphisms.
- For n = 1, the fiber of O^1_X over V is the poset of subobjects of V. In S over Δ[0] it is Δ[1], with
  objects ∅ and Δ[0].
- In S, consider the square with top edge ∅ → Δ[0], bottom edge the identity of Δ[0], left edge ∅ → Δ[0] and
  right edge the identity of Δ[0]. It is a morphism of O^∞_S from the left edge to the right edge. It is not
  in O^(∞)_S, since the pullback of the right edge along the bottom edge is Δ[0], not ∅. So O^(n)_X is not a
  full subcategory.

*Needs:* §1.1.1 (HTT, Def. 6.1.1.2, §6.1.1) and §2.1.1 (HTT, Notation 6.1.3.4); Part InfinityCategoryFoundations
§10.7.1 (HTT, Def. 5.5.6.8); Part PresentableInfinityCategories §6.1.2 (HTT, Remark 5.5.6.12); §1.4.1 (HTT, Def. 6.1.3.1); Tau Ceti
`SSet.CartesianFibration`.

### 17.2 The truncated descent theorem

**17.2.1.** Prove that, for a presentable ∞-category X with universal colimits and disjoint coproducts and 0 ≤ n ≤ ∞, the
following are equivalent (HTT, Thm. 6.4.4.5, p. 669):

1. in every pushout square of O^n_X whose two edges out of the initial corner are Cartesian transformations,
   the other two edges are Cartesian transformations;
2. the (n − 2)-truncated morphisms form a local class;
3. the Cartesian fibration O^n_X → X is classified by a limit-preserving functor from X^op to `Ĉat∞`;
4. the right fibration O^(n)_X → X is classified by a limit-preserving functor from X^op to the ∞-category of
   large spaces;
5. for a natural transformation of colimit diagrams K^▷ → X, with K small, whose restriction to K is a
   Cartesian transformation with (n − 2)-truncated components, the transformation is Cartesian and its
   component at the cone point is (n − 2)-truncated.

Lurie gives no separate proof. The route is the argument of the descent theorem with its lemmas, applied to
the pullback-stable class of (n − 2)-truncated morphisms. The one new input is the step about coproducts:

- **Coproducts of truncated morphisms** (HTT, Lemma 6.4.4.4, p. 668). In a presentable ∞-category with
  universal colimits and disjoint coproducts, for n ≥ −2, the n-truncated morphisms are stable under small
  coproducts. By induction on n; the case n = −2 holds because coproducts of equivalences are equivalences.
  Universality of colimits writes the fiber product of a coproduct of morphisms with itself as a double
  coproduct, and disjointness of coproducts discards the off-diagonal summands. So the diagonal of a coproduct
  is the coproduct of the diagonals, and the inductive hypothesis applies through the diagonal criterion.

*Needs:* §1.3.1 (HTT, Prop. 6.1.1.4), §1.5.1 (HTT, Lemma 6.1.3.3), §1.6.2 (HTT, Lemma 6.1.5.1), §2.2.1 (HTT, Lemma
6.1.3.5), §2.3.1 (HTT, Lemma 6.1.3.7, Def. 6.1.3.8), §2.4.2 (HTT, Thm. 6.1.3.9), §17.1.1; Part InfinityCategoryFoundations §10.7.1
(HTT, Def. 5.5.6.8, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.2 (HTT, Remark 5.5.6.12), §6.1.4 (HTT, Lemma 5.5.6.15); §1.1.1 (HTT, Def. 6.1.1.2); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1).

### 17.3 Truncated morphisms of a truncation are local

**17.3.1.** Prove that, for an ∞-topos Y, 0 ≤ n ≤ ∞ and n − 1 ≤ k ≤ ∞, the (n − 2)-truncated morphisms of τ≤k Y form a
local class (HTT, Prop. 6.4.4.7, p. 670, which is the case k = n). The characterization of n-topoi uses the
case k = n − 1: its condition (4) for τ≤n−1 Y asks for the (n − 2)-truncated morphisms of an n-topos, while
Lurie's statement gives those of an (n + 1)-topos. For k = −1, n = 0 and the class is the equivalences.

The route is Lurie's, at index k. In Y the (n − 2)-truncated morphisms form a local class, because
truncatedness descends along effective epimorphisms and by the coproduct step of §17.2. So O^n_Y → Y is
classified by a limit-preserving functor F from Y^op to `Ĉat∞`, and O^(n)_X → X, for X = τ≤k Y, is classified by
the restriction of F to X. It suffices that F carries each truncation V → τ≤k V, for V in Y, to an
equivalence. Replacing Y by the slice over τ≤k V, in which V is (k + 1)-connective (§14.2 (HTT, Prop.
6.5.1.12)), this is §14.8 (HTT, Lemma 7.2.1.13) at index k: it gives an equivalence on (k − 1)-truncated
objects over the slice, and these include the (n − 2)-truncated ones because k ≥ n − 1.

*Needs:* §2.3.1 (HTT, Lemma 6.1.3.7, Def. 6.1.3.8), §7.5.3 (HTT, Prop. 6.2.3.17), §7.6.2 (HTT, Prop. 6.2.3.14),
§10.4.1 (HTT, Prop. 6.3.5.1), §14.2.1 (HTT, Prop. 6.5.1.12), §14.8.1 (HTT, Lemma 7.2.1.13), §17.1.1, §17.2.1; §3.1.2 (HTT, Thm. 6.1.0.6 (3)); Tau Ceti `SSet.catInfty`.

### 17.4 n-efficient groupoid objects

**17.4.1.** Define, for an ∞-category X with finite products and 0 ≤ n ≤ ∞, a groupoid object U of X to be n-efficient
when the map U₁ → U₀ × U₀, well defined up to equivalence, is (n − 2)-truncated (HTT, Def. 6.4.3.1, p. 663).
Finite products are what the condition needs to make sense; Lurie states it for an arbitrary ∞-category.

- An n-efficient groupoid object is m-efficient for every m ≥ n, and every groupoid object is ∞-efficient.
- n-efficiency is invariant under equivalence of groupoid objects.

**Checks.**

- For n = 0 the condition says that U₁ → U₀ × U₀ is an equivalence. The Čech nerve of U₀ → 1, with k-th term
  the (k + 1)-fold power of U₀, is 0-efficient.
- The constant groupoid object on an object V has U₁ → U₀ × U₀ equal to the diagonal of V. So it is
  n-efficient exactly when V is (n − 1)-truncated. In S, the constant groupoid object on the circle ∂Δ[2] is
  2-efficient but not 1-efficient, since the diagonal has discrete, nonempty fibers ℤ. An index shift to
  n-truncated maps would get this wrong.
- In the nerve of the category of sets, the groupoid object of a nontrivial group G, with U₀ a point and
  U₁ = G, is not 1-efficient, because G → ∗ is not injective. It is also not effective: its colimit is a
  point, whose Čech nerve is the trivial groupoid. A groupoid object whose U₁ → U₀ × U₀ is injective, an
  equivalence relation, is 1-efficient.

*Needs:* Part LimitsAndKanExtensions §9.1.2 (HTT, Prop. 6.1.2.6 (4″), Def. 6.1.2.7); Part InfinityCategoryFoundations §10.7.1 (HTT, Def.
5.5.6.8).

### 17.5 The n-categorical Giraud axioms

**17.5.1.** Prove that, for 1 ≤ n ≤ ∞ and a presentable n-category X with universal colimits whose (n − 2)-truncated
morphisms form a local class, X satisfies the n-categorical Giraud axioms. That is, X is equivalent to a
presentable n-category, colimits in X are universal, coproducts in X are disjoint, and every n-efficient
groupoid object of X (§17.4) is effective (HTT, Prop. 6.4.4.9, p. 670).

The route is Lurie's, with one change. The first two axioms are hypotheses.

- **Maps out of an initial object** (HTT, Lemma 6.4.4.8, p. 670). In a presentable ∞-category with universal
  colimits, every morphism ∅ → U out of an initial object is a monomorphism. Test on mapping spaces from an
  arbitrary Y. If Y is initial, both mapping spaces are contractible. Otherwise there is no map from Y to ∅,
  since with universal colimits a map into an initial object forces its source to be initial. In either case
  composition with ∅ → U is (−1)-truncated.
- **Disjoint coproducts.** For objects U and V, the map from an initial object to U is a monomorphism by the
  previous step, hence (n − 2)-truncated because n ≥ 1. The class is local, so the classifying functor of
  O^(n)_X carries the pushout U ⊔ V of U ← ∅ → V to a pullback. Gluing the identity of U with ∅ → V gives an
  (n − 2)-truncated morphism W → U ⊔ V whose pullbacks to U and V are U and ∅. By universality of colimits it
  is the summand inclusion of U, so the fiber product of U and V over U ⊔ V is initial. The change: Lurie
  quotes §17.2 for this step, whose standing hypotheses include the disjointness being proved. The
  characterization of local classes used here (HTT, Lemma 6.1.3.7) needs only universal colimits and stability
  under pullback.
- **Effective groupoids.** With disjointness established, §17.2 applies. For an n-efficient groupoid object U
  with colimit diagram Ū, the shifted augmented object, whose k-th term is the (k + 1)-st term of Ū, is again
  a colimit diagram. Map it to the product of Ū with the constant augmented object on U₀. Each component in
  degree k ≥ 0 of this map is a pullback of U₁ → U₀ × U₀, hence (n − 2)-truncated, and its restriction to
  N(Δ)^op is Cartesian because U is a groupoid. Condition (5) of §17.2 makes the whole transformation
  Cartesian. The resulting pullback square identifies U₁ with U₀ ×_U₋₁ U₀, so U is effective.

*Needs:* §1.4.1 (HTT, Def. 6.1.3.1), §1.6.1 (HTT, Lemma 6.1.3.6), §2.3.1 (HTT, Lemma 6.1.3.7), §3.4.2 (HTT, Lemma
6.1.3.17), §17.1.1, §17.2.1, §17.4.1; §1.1.1 (HTT, Def. 6.1.1.2) and §3.1.1, §3.1.2; Part InfinityCategoryFoundations §10.1.2 (HTT, Def. 2.3.4.1); Part LimitsAndKanExtensions §9.1.1, §9.1.2 (HTT, Defs. 6.1.2.2, 6.1.2.7,
6.1.2.14); Part LimitsAndKanExtensions §9.4.2 (HTT, Notation 6.1.2.12); Part
InfinityCategoryFoundations §10.7.1 (HTT, Def. 5.5.6.8, Ex. 5.5.6.13); Part InfinityCategoryFoundations §8.2.1 (HTT, Cor. 1.2.12.5).

### Examples

- In S, all morphisms form a local class (descent in S), so S satisfies §17.2 for n = ∞.
- In the nerve of the category of sets, a 1-topos (§16.1), the (−1)-truncated morphisms are the injections.
  That they form a local class is the classical fact that monomorphisms descend along jointly surjective
  families.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, PresentableInfinityCategories; Tau Ceti
`SSet.CartesianFibration`, `SSet.catInfty`. Earlier layers of this Part: Layers 1, 2, 3, 7, 10 and 14. Within
the layer: 17.2 uses 17.1; 17.3 uses 17.1, 17.2; 17.5 uses 17.1, 17.2, 17.4.

## Layer 18: Locales and 0-topoi

### 18.1 Locales

**18.1.1.** A locale in the sense of HTT, Def. 6.4.2.3, p. 661, is a partially ordered set U in which every subset has a
least upper bound and binary meets distribute over arbitrary joins: (⋁_α U_α) ∧ V = ⋁_α (U_α ∧ V) for every
family {U_α} and every V. This Part takes Mathlib's `Order.Frame` as the carrier: a locale is a complete
lattice satisfying the frame law `inf_sSup_eq`, and the Heyting implication that `Order.Frame` also records is
determined by that law, since in a complete lattice with the law it exists and is unique (Mathlib's
`Order.Frame.MinimalAxioms` and `Order.Frame.ofMinimalAxioms`).

- The open subsets of a topological space form a locale (Mathlib's frame instance on
  `TopologicalSpace.Opens`).
- The meet U ∧ V exists because U is a complete lattice, so the law makes sense in every complete lattice.

**Checks.**

- The empty poset is not a locale, since the empty subset has no least upper bound; it carries no complete
  lattice structure. The one-element poset is a locale.
- The lattice of linear subspaces of ℝ² is a complete lattice but not a locale. For three distinct lines a, b
  and c, a ∧ (b ∨ c) is a, while (a ∧ b) ∨ (a ∧ c) is the zero subspace. So completeness alone does not
  suffice.
- The opens of the Sierpiński space form the three-element chain, a locale that is not a Boolean algebra. So
  locales are not the complete Boolean algebras, although every complete Boolean algebra is a locale.

*Needs:* Mathlib `Order.Frame`, `inf_sSup_eq`, `Order.Frame.MinimalAxioms`, `Order.Frame.ofMinimalAxioms`.

### 18.2 Locales as 0-categories with universal colimits

**18.2.1.** Prove that a presentable 0-category X has universal colimits exactly when X is equivalent to N(U) for a locale
U (HTT, Prop. 6.4.2.5, p. 661). Its order-theoretic core is a statement about the 1-category of a complete
lattice: every colimit cocone of a small diagram is universal, in the sense of Mathlib's
`CategoryTheory.IsUniversalColimit`, exactly when the frame law `inf_sSup_eq` holds.

Every 0-category is equivalent to N(U) for a partially ordered set U, determined up to isomorphism. N(U) is
presentable exactly when U is a complete lattice that is essentially small; a presentable 0-category is
essentially small (HTT, discussion before Def. 6.4.2.3 and Remark 6.4.2.2, p. 660). Completeness alone does
not suffice: the small ordinals with a top element added form a large complete lattice whose nerve is not
accessible. In N(U), pullbacks are binary meets and colimits are joins. So universality of colimits says
exactly that meeting with a fixed element preserves joins, which is the law of §18.1. The order-theoretic core
quantifies over all small diagrams, including empty ones, and, through `IsUniversalColimit`, over all
equifibered transformations into the diagram; the two bridges to the quasicategorical statement are the comparison of presentable 0-categories
with nerves of complete lattices and the computation of colimits and pullbacks in N(U).

*Needs:* §18.1.1; Part InfinityCategoryFoundations §10.6.1 (HTT, Ex. 2.3.4.3); §1.1.1 (HTT, Def. 6.1.1.2); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Mathlib `CategoryTheory.IsUniversalColimit`,
`Preorder.smallCategory`.

### 18.3 0-topoi

**18.3.1.** The **covering topology** on N(U), for a locale U, is the Grothendieck topology on the category U (HTT, proof of
Thm. 6.4.2.1, p. 662), read on N(U) through §8.1 (HTT, Remark 6.2.2.3, p. 596), in which a
sieve S on u, that is a downward-closed set of elements below u, covers u when ⋁S = u. Its pullback axiom is
the frame law of §18.1.

**Checks.**

- The empty sieve covers the least element ⊥, since ⋁∅ = ⊥. For the one-element locale this makes Shv(N(U))
  equal to Δ[0]; a definition asking covering families to be nonempty would give P(Δ[0]) = S instead.
- On the opens of ℝ, the sieve generated by (−∞, 0) and (0, ∞) does not cover ℝ, since its join is ℝ ∖ {0}.
- The frame law is what makes this a topology. On the lattice of linear subspaces of ℝ², a complete lattice
  that is not a locale (§18.1), take three distinct lines a, b and c. The sieve ↓b ∪ ↓c on ℝ² has join ℝ², but
  its pullback to a is {0}, whose join is not a; so the same rule fails the pullback axiom.
- For U the opens of a topological space T, this is Mathlib's `Opens.grothendieckTopology` on T, the topology of
  open covers.

*Needs:* §8.1.1 (HTT, Def. 6.2.2.1, Remark 6.2.2.3), §18.1.1;
Mathlib `inf_sSup_eq`, `Opens.grothendieckTopology`.

**18.3.2.** Prove that, for a presentable 0-category X, the following are equivalent (HTT, Thm. 6.4.2.1, p. 660):

1. X is equivalent to Shv≤−1(C) (§16.1) for a small 0-category C with finite limits and a Grothendieck topology;
2. X is equivalent to τ≤−1 Y for an ∞-topos Y;
3. X is a 0-topos;
4. colimits in X are universal.

(1) ⇒ (2) takes Y = Shv(C). (2) ⇒ (3) holds because truncation commutes with a left exact presentation of Y,
which exists by Giraud's theorem. For (3) ⇒ (4): P≤−1(C) is the nerve of the poset of sieves on C, because
τ≤−1 S is Δ[1]. A left exact localization of it is a closure operator L on sieves that is idempotent,
inflationary and preserves finite intersections. Its fixed points form a locale, so (4) follows from §18.2.
For (4) ⇒ (1): by §18.2, X is N(U) for a locale U. U is essentially small by HTT, Remark 6.4.2.2, and may be
taken small, so N(U) is a small 0-category with finite limits. Give N(U) the covering topology.
Then the (−1)-truncated sheaves are the downward-closed subsets closed under joins, that is, the principal
ones, which recovers U.

*Needs:* §4.4.1 (HTT, Thm. 6.1.0.6), §8.1.1 (HTT, Def. 6.2.2.1, Remark 6.2.2.3), §8.2.1 (HTT, Def. 6.2.2.6), §8.3.1
(HTT, Prop. 6.2.2.7), §16.1.1, §18.1.1, §18.2.1; §3.1.2 (HTT, Thm. 6.1.0.6
(3), ∞-topoi); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part InfinityCategoryFoundations §10.6.1 (HTT, Ex.
2.3.4.3).

### 18.4 The underlying locale of an ∞-topos

**18.4.1.** Define, for an ∞-topos X, Sub(X) to be the set of equivalence classes [U] of (−1)-truncated objects U of X,
ordered by [U] ≤ [V] when there is a morphism U → V. Prove that Sub(X) is a locale, the underlying locale of X
(SAG, Def. 1.5.4.1, p. 165).

- A morphism between (−1)-truncated objects is unique up to homotopy when it exists, so the order is well
  defined and antisymmetric on equivalence classes.
- τ≤−1 X is equivalent to N(Sub(X)). It is a 0-topos by §18.3 (2) ⇒ (3), so its colimits are universal by
  §18.3 (3) ⇒ (4), and Sub(X) is a locale by §18.2.

**Checks.**

- For X = S, Sub(S) is the two-element chain {[∅] < [Δ[0]]}, the locale of opens of a point. A definition
  using 0-truncated objects would give the class of all sets.
- For X = P(C) with C the ordinary category 0 → 1, a (−1)-truncated presheaf is a subpresheaf of the final
  presheaf. There are three: empty, nonempty only at 0, and everything. So Sub(X) is the three-element chain,
  the locale of opens of the Sierpiński space.
- For X = S × S, Sub(X) is the four-element Boolean algebra, and [(Δ[0], ∅)] and [(∅, Δ[0])] are incomparable.
  For X = Δ[0], Sub(X) has one element, because there ∅ is final.

*Needs:* §18.1.1, §18.2.1, §18.3.2; §3.1.2 (HTT, Thm. 6.1.0.6 (3)); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part
PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18).

### Examples

- For a topological space T, the opens of T form a locale (§18.1). The underlying locale of the presheaf
  ∞-topos on a poset P is the locale of downward-closed subsets of P (§18.4); for P = {0 < 1} this is the
  second Check of §18.4.
- The nerve N(U) of a locale U is a 0-topos (§18.3). For the covering topology of §18.3, τ≤−1 Shv(N(U)) is
  Shv≤−1(N(U)) ≃ N(U), so Sub(Shv(N(U))) is U again (§18.4).

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, AdjunctionsAndLocalizations, PresentableInfinityCategories; Mathlib `Order.Frame`, `inf_sSup_eq`, `Order.Frame.MinimalAxioms`, `Order.Frame.ofMinimalAxioms`,
`CategoryTheory.IsUniversalColimit`, `Preorder.smallCategory`, `Opens.grothendieckTopology`. Earlier layers of this Part: Layers 4, 8 and
16. Within the layer: 18.2 uses 18.1; 18.3 uses 18.1, 18.2; 18.4 uses 18.1, 18.2, 18.3.

## Layer 19: The characterization of n-topoi

### 19.1 n-categories through effective groupoids

**19.1.1.** Prove that, for 0 ≤ n ≤ ∞, an ∞-category X with finite limits is equivalent to an n-category exactly when
every effective groupoid object of X is n-efficient (HTT, Prop. 6.4.3.4, p. 663). Lurie states it for an
arbitrary ∞-category; finite limits are what n-efficiency (§17.4) and the diagonal criterion for truncatedness
need.

If X is equivalent to an n-category, its objects are (n − 1)-truncated. For an effective groupoid U with
colimit U₋₁, the map U₁ → U₀ × U₀ is a pullback of the diagonal of U₋₁, which is (n − 2)-truncated by the
diagonal criterion. Conversely, the constant simplicial object on an object V is the Čech nerve of the
identity, hence an effective groupoid. Its n-efficiency says that the diagonal of V is (n − 2)-truncated, so V
is (n − 1)-truncated. Since every object is (n − 1)-truncated, X is equivalent to an n-category.

*Needs:* §17.4.1; Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part InfinityCategoryFoundations §10.7.2 (HTT, Lemma
5.5.6.14); Part PresentableInfinityCategories §6.1.2 (HTT, Remark 5.5.6.12), §6.1.4 (HTT, Lemma 5.5.6.15); Part LimitsAndKanExtensions §9.4.1
(HTT, Prop. 6.1.2.11); §3.1.1 (HTT, Def. 6.1.2.14).

### 19.2 The n-categorical Giraud theorem

The theorem is §19.2.4; §19.2.1–§19.2.3 are the three steps of its proof.

**19.2.1. The comparison adjunction** (HTT, Prop. 6.4.3.6, comparison step of the proof, pp. 664–665). Prove that, for
0 < n < ∞ and an ∞-category X that is presentable, has universal colimits and disjoint coproducts, and whose effective
groupoid objects are exactly its n-efficient ones, with X replaced by a minimal model, there is a regular κ such that
the following holds. X is κ-accessible, and C = X^κ, the full subcategory of κ-compact objects, is closed under
subobjects and finite limits. Give C the canonical topology relative to C ⊆ X, and let F : P(C) → X be the
colimit-preserving extension of the inclusion. Then F has a fully faithful right adjoint G, G factors through
Shv≤n−1(C), and G preserves initial objects.

κ comes from the following step, and F from the universal property of presheaves; the proof of the
presentation theorem shows that G is fully faithful. X is equivalent to an n-category by §19.1, and G is left
exact, so G lands in P≤n−1(C). By the comparison with sheaves for the canonical topology, it lands in sheaves;
this needs X to be a semitopos, which holds since Čech groupoids in an n-category are n-efficient and hence
effective. G preserves initial objects by the description of initial sheaves and because maps into an initial
object of X force the source to be initial.

- **Compact objects closed under subobjects** (HTT, Lemma 6.4.3.5, p. 663). For a presentable ∞-category X
  with universal colimits, there is a regular cardinal τ such that X is τ-accessible and the full subcategory
  of τ-compact objects is closed under subobjects and finite limits. Choose κ with X κ-accessible. There is
  only a bounded number of κ-compact objects and of their subobjects, so there is an uncountable regular τ ≫ κ
  such that the κ-compact objects form an essentially τ-small ∞-category and every subobject of a κ-compact
  object is τ-compact. Closure under finite limits holds because τ-compact objects are closed under κ-small
  limits. For a subobject U of a τ-compact object V, write V as a κ-filtered colimit of κ-compact objects; V
  is a retract of a τ-small subcolimit, universality of colimits writes U as the corresponding colimit of
  subobjects of κ-compact objects, which is τ-compact, and a retract of a τ-compact object is τ-compact.

  *Needs:* Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1); Part AccessibleInfinityCategories §5.5.3 (HTT, Prop. 5.4.7.4), §2.2.2
  (HTT, Cor. 5.3.4.15), §5.1.1 (HTT, Prop. 5.4.2.2); Part PresheavesAndCompletions §2.3.1 (HTT, Prop. 4.4.5.12);
  §1.1.1 (HTT,
  Def. 6.1.1.2); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts).

*Needs:* §1.6.1 (HTT, Lemma 6.1.3.6), §7.2.1 (HTT, Def. 6.2.3.1), §8.3.1 (HTT, Prop. 6.2.2.7), §8.4.2 (HTT, Prop.
6.2.2.18), §9.2.1 (HTT, Def. 6.2.4.1), §9.2.3 (HTT, Prop. 6.2.4.6), §17.4.1, §19.1.1; the step on compact objects closed under
subobjects, in this section; Part PresheavesAndCompletions §1.4.3 (HTT, Thm. 5.1.5.6); Part
AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1), §6.1.5
(HTT, Prop. 5.5.6.16); §1.1.1 (HTT, Def. 6.1.1.2); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def.
5.5.0.1).

**19.2.2. The essential image is closed under coproducts** (HTT, Prop. 6.4.3.6, coproduct step of the proof, pp.
665–666). Prove that, for 0 < n < ∞ and an ∞-category X that is presentable, has universal colimits and disjoint
coproducts, and whose effective groupoid objects are exactly its n-efficient ones, the essential image of G is closed
under small coproducts in Shv≤n−1(C).

Disjointness of coproducts in X makes the comparison from a coproduct of objects G(U_α) to G(⨿ U_α) a
monomorphism. It is also surjective on components at every object of C: a map from C ∈ C to ⨿ U_α splits C
into summands C_α ⊆ C, using the initial-object step of §17.5 and universality, and the canonical topology
glues these.

*Needs:* §19.2.1; §1.6.2 (HTT, Lemma 6.1.5.1), §9.2.3 (HTT, Lemma 6.2.4.4),
§16.2.2, §17.5.1; Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15); Part AdjunctionsAndLocalizations §1.5.1 (HTT,
Prop. 5.2.3.5); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, the Yoneda embedding).

**19.2.3. Induction on truncation** (HTT, Prop. 6.4.3.6, final step of the proof, p. 666). Prove that, for 0 < n < ∞
and an ∞-category X that is presentable, has universal colimits and disjoint coproducts, and whose effective groupoid
objects are exactly its n-efficient ones, and for −2 ≤ k ≤ n − 1, if f : U → V is a k-truncated morphism of Shv≤n−1(C)
with V in the essential image of G, then U is in the essential image of G. Taking k = n − 1 and V final, which lies in
the essential image because C is closed under finite limits and so contains a final object of X, shows that G is
essentially surjective, hence an equivalence.

The route is Lurie's induction on k. Cover U by an effective epimorphism from a coproduct of objects of C,
which lies in the essential image by §19.2.2. Its Čech nerve lies in the essential image by the
inductive hypothesis, because the diagonal of f is (k − 1)-truncated and the essential image is closed under
limits. The Čech nerve is n-efficient, hence effective in X by hypothesis. The comparison from U to the
geometric realization of the Čech nerve is a monomorphism and an effective epimorphism, hence an equivalence.

*Needs:* §19.2.1 and §19.2.2; §7.3.3 (HTT, Prop. 6.2.3.10), §7.4.2
(HTT, Cor. 6.2.3.12), §7.6.1 (HTT, Lemma 6.2.3.13), §9.2.3 (HTT, Prop. 6.2.4.6), §17.4.1; Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15), §6.1.2 (HTT, Remark 5.5.6.12); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5).

**19.2.4.** Prove that, for 0 < n < ∞ and an ∞-category X that is presentable, has universal colimits and disjoint coproducts, and whose effective groupoid objects are exactly its n-efficient ones, there are a
small n-category C with finite limits, a Grothendieck topology on C and an equivalence X → Shv≤n−1(C) (HTT,
Prop. 6.4.3.6, p. 664).

*Needs:* §19.2.1, §19.2.2 and §19.2.3.

### 19.3 Left exact localizations of n-topoi are topological

**19.3.1.** Prove that, for an n-topos X with 0 ≤ n < ∞, every left exact localization L : X → Y is topological (HTT,
Prop. 6.4.1.6, p. 658).

Choose a left exact localization F : P≤n−1(C) → X; by truncating C we may take C equivalent to an n-category.
It suffices that the preimage under F of the L-equivalences is generated by monomorphisms, because F carries
monomorphisms to monomorphisms. This reduces to X = P≤n−1(C). A sieve on C is declared covering when the
monomorphism U → j(C) is inverted by L. As for presheaf ∞-topoi, these sieves form a Grothendieck topology,
and L factors as the sheafification L′ : P≤n−1(C) → Shv≤n−1(C) (§16.1), the restriction of the
sheafification of §8.3 to (n − 1)-truncated presheaves, followed by a localization L″ of Shv≤n−1(C). L″ is an
equivalence once L′ inverts every morphism f that L inverts. Such an f is k-truncated for some k ≤ n − 1,
because C may be taken to be an n-category. Argue by induction on k. For k = −1, write the target of f as a
colimit of representables j(C). By universality of colimits in P≤n−1(C) (§16.2), f is the colimit of its
pullbacks f_C to j(C). L inverts each f_C, so each f_C is a covering sieve and is inverted by L′, and L′
preserves colimits. For k ≥ 0, the diagonal of f is (k − 1)-truncated and inverted by L, so L′ inverts it and
L′f is a monomorphism. The case k = −1, applied to L′f, then finishes the proof (HTT, proof of Prop. 6.4.1.6,
p. 659).

*Needs:* §6.2.1 (HTT, Def. 6.2.1.4), §8.1.1 (HTT, Def. 6.2.2.1), §8.2.1 (HTT, Def. 6.2.2.6), §8.4.1 (HTT, Prop.
6.2.2.17), §16.1.1, §16.2.2; Part PresentableInfinityCategories §4.1.1 (HTT, Def. 5.5.4.5, Remark 5.5.4.7), §4.4.2 (HTT, Prop.
5.5.4.20), Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.4 (HTT, Lemma 5.5.6.15), §6.1.5 (HTT, Prop. 5.5.6.16); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, the Yoneda
embedding).

### 19.4 The characterization of n-topoi

**19.4.1.** Prove that, for a presentable ∞-category X and 0 ≤ n < ∞, the following six conditions are equivalent (HTT,
Thm. 6.4.1.5, p. 658; proof, p. 659):

1. there are a small n-category C with finite limits, a Grothendieck topology on C and an equivalence of X
   with Shv≤n−1(C), the (n − 1)-truncated objects of Shv(C);
2. there are an ∞-topos Y and an equivalence X → τ≤n−1 Y;
3. X is an n-topos;
4. colimits in X are universal, X is equivalent to an n-category, and the (n − 2)-truncated morphisms of X
   form a local class;
5. colimits in X are universal, X is equivalent to an n-category, and for all sufficiently large regular
   cardinals κ some object of X classifies the (n − 2)-truncated relatively κ-compact morphisms;
6. the n-categorical Giraud axioms: X is equivalent to a presentable n-category, colimits in X are universal,
   coproducts in X are disjoint if n > 0, and every n-efficient groupoid object of X (§17.4) is effective.

The route is the cycle (1) ⇒ (2) ⇔ (3), (2) ⇒ (4) ⇔ (5), (4) ⇒ (6) ⇒ (1) for n > 0, and a separate argument
for n = 0. The steps below are route steps of this one target, each with its locator; the *Needs:* list covers
them all.

- **The case n = 0** (HTT, Thm. 6.4.1.5, case n = 0, analyzed in §6.4.2, p. 660). Each of (1)–(6) makes X
  equivalent to a 0-category: (4)–(6) say so, and (1)–(3) by §16.1. So §18.3 applies, and conditions (1)–(3)
  are those of §18.3. For n = 0, the (−2)-truncated morphisms are the equivalences, which always form a local
  class, and a final object classifies them. A 0-efficient groupoid object in a 0-category is constant,
  because there U₀ × U₀ is U₀, and so it is effective. Hence each of (4), (5) and (6) reduces to universality
  of colimits, which is (4) of §18.3.
- **(1) ⇒ (2)** (HTT, proof of Thm. 6.4.1.5, p. 659). For n > 0, take Y = Shv(C), an ∞-topos, whose
  (n − 1)-truncated objects are Shv≤n−1(C).
- **(2) ⇔ (3)** (HTT, proof of Thm. 6.4.1.5, p. 659). For n > 0: if Y is an accessible left exact localization
  of P(C), then τ≤n−1 Y is an accessible left exact localization of P≤n−1(C), because the localization
  commutes with truncation. Conversely, the proof of §19.3 shows that an n-topos is equivalent to Shv≤n−1(C)
  for an n-category C with a topology, which is τ≤n−1 Shv(C).
- **(2) ⇒ (4)** (HTT, proof of Thm. 6.4.1.5, p. 659, through Props. 6.4.4.6 and 6.4.4.7). For n > 0, by (2) ⇒
  (3) X is an n-topos, so its colimits are universal by §16.2. X is equivalent to an n-category, because its
  mapping spaces are (n − 1)-truncated. Its (n − 2)-truncated morphisms form a local class by §17.3 with
  k = n − 1.
- **(4) ⇔ (5)** (HTT, proof of Thm. 6.4.1.5, p. 659). The argument is Rezk's characterization of ∞-topoi,
  which Lurie says adapts without change. For a pullback-stable class, classifying objects for its relatively
  κ-compact members exist for all large κ exactly when the class is local. The (n − 2)-truncated morphisms are
  stable under pullback.
- **(4) ⇒ (6)** (HTT, proof of Thm. 6.4.1.5, p. 659, through Prop. 6.4.4.9). For n > 0 this is §17.5.
- **(6) ⇒ (1)** (HTT, proof of Thm. 6.4.1.5, p. 659, through Prop. 6.4.3.6). For n > 0 this is §19.2. Its
  hypothesis that the effective groupoid objects are exactly the n-efficient ones combines the last axiom of
  (6) with §19.1, X being equivalent to an n-category.

*Needs:* §1.3.1 (HTT, Prop. 6.1.1.4), §2.3.1 (HTT, Lemma 6.1.3.7, Def. 6.1.3.8), §4.4.1 (HTT, Thm. 6.1.0.6), §5.1.2
(HTT, Prop. 6.1.6.3), §5.2.2 (HTT, Prop. 6.1.6.7), §5.3.1 (HTT, Thm. 6.1.6.8), §8.1.1 (HTT, Def. 6.2.2.1), §8.2.1
(HTT, Def. 6.2.2.6), §8.3.1 (HTT, Prop. 6.2.2.7), §16.1.1, §16.2.2, §17.3.1, §17.4.1, §17.5.1, §18.3.2, §19.1.1, §19.2.4, §19.3.1;
Part InfinityCategoryFoundations §10.7.1 (HTT, Ex. 5.5.6.13); Part PresentableInfinityCategories §6.1.2 (HTT, Remark 5.5.6.12), Part
PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18), §6.2.3 (HTT, Prop. 5.5.6.28); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); §1.1.1 (HTT, Def. 6.1.1.2) and §3.1.2 (HTT, Thm. 6.1.0.6 (3), ∞-topoi); Part InfinityCategoryFoundations §10.1.2 (HTT, Def. 2.3.4.1); Part LimitsAndKanExtensions §9.1.2 (HTT, Defs. 6.1.2.7, 6.1.2.14).

### Examples

- For n = 1 and an ordinary small category C with finite limits and a Grothendieck topology, the nerve of the
  category of sheaves of sets on C is a 1-topos (§19.4, (1) ⇒ (3)). For every ∞-topos X, τ≤0 X is a 1-topos
  (§19.4, (2) ⇒ (3)), and by (3) ⇒ (1) its homotopy category is a category of sheaves of sets on a small site,
  a Grothendieck topos (HTT, Def. 6.1.0.2, p. 547).
- The nerve of the category of sets satisfies the 1-categorical Giraud axioms of §19.4 (6). Coproducts of sets
  are disjoint, and a groupoid object in sets is effective exactly when it is an equivalence relation, which
  is what 1-efficiency asks (§17.4).
- At n = 1 the theorem compares with the classical one. For an ordinary category E whose nerve is presentable,
  conditions (1) and (6) of §19.4 for N(E) say that E is a category of sheaves of sets on a small site and
  that E satisfies Giraud's axioms; their equivalence is the classical Giraud theorem (HTT, Prop. 6.1.0.1, p. 546), and §19.4 recovers it on nerves.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, PresheavesAndCompletions, AccessibleInfinityCategories, PresentableInfinityCategories. Earlier layers of this Part: Layers 1, 2, 4, 5, 6, 7, 8, 9, 16, 17 and 18. Within the layer:
19.2 uses 19.1; 19.4 uses 19.1, 19.2, 19.3.

## Layer 20: Localic reflection

### 20.1 Geometric morphisms of n-topoi

**20.1.1.** Define, for n-topoi X and Y with 0 ≤ n ≤ ∞, a geometric morphism from X to Y to be a functor X → Y that admits
a left exact left adjoint. Fun_*(X, Y) is the full subcategory of Fun(X, Y) spanned by the geometric
morphisms, and Top^R_n is the subcategory of `Ĉat∞` whose objects are n-topoi and whose morphisms are geometric
morphisms (HTT, Def. 6.4.5.1, p. 672).

- For n = ∞ these are the geometric morphisms, Fun_* and `RTop` of §10.1 (HTT, Def. 6.3.1.1), §10.2 (HTT, Def.
  6.3.1.10) and §10.3 (HTT, Def. 6.3.1.5).
- A geometric morphism of n-topoi preserves limits and truncated objects. Its left adjoint preserves colimits
  and finite limits.

**Checks.**

- For n = 0 the n-topoi are the nerves of locales (§18.3). A geometric morphism N(U) → N(V) is a right adjoint
  whose left adjoint preserves finite meets and arbitrary joins, that is, a map of locales in the classical
  sense, and Fun_*(N(U), N(V)) is the nerve of a poset.
- For n = 1, Fun_*(N(Set), N(Set)) is contractible, where N(Set) is the nerve of the category of sets: a left
  exact colimit-preserving endofunctor of sets is the identity up to unique isomorphism.
- Top^R_n is not a full subcategory of `Ĉat∞`. On N(Set), the functor A ↦ A × A is a right adjoint, with left
  adjoint A ↦ 2 × A, but that left adjoint sends a point to two points, so A ↦ A × A is not a geometric
  morphism.

*Needs:* §10.1.1 (HTT, Def. 6.3.1.1), §10.2.1 (HTT, Def. 6.3.1.10), §10.3.1 (HTT, Def. 6.3.1.5), §16.1.1; Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2, §1.2.11); Part AdjunctionsAndLocalizations §1.1.1 (Kerodon, Def. 6.2.1.1); Tau Ceti `SSet.catInfty`
(taken one universe up).

### 20.2 Localic reflection

**20.2.1.** Prove that, for 0 ≤ m ≤ n ≤ ∞ and an m-topos Y, there are an n-topos X and a categorical equivalence f_* :
τ≤m−1 X → Y such that, for every n-topos Z, composition with f_* is an equivalence from Fun_*(Z, X) to
Fun_*(τ≤m−1 Z, Y) (HTT, Prop. 6.4.5.7, p. 674).

If m = ∞, then n = ∞ and X = Y. Otherwise §19.4 reduces to Y = Shv≤m−1(C) for a small m-category C with finite
limits and a topology. Take X = Shv≤n−1(C), an n-topos, with f_* the identity. For an n-topos Z, §19.4 reduces
to Z = τ≤n−1 Z′ for an ∞-topos Z′. Both comparison maps out of Fun_*(Z′, Shv(C)) are equivalences by the
second step below, applied at n and at m, so the map in question is one too. The steps, each with its locator:

- **Geometric morphisms into presheaves** (HTT, Lemma 6.4.5.5, p. 672). For a small n-category C with finite
  limits and an ∞-topos Y, restriction to (n − 1)-truncated objects is an equivalence from Fun_*(Y, P(C)) to
  Fun_*(τ≤n−1 Y, P≤n−1(C)). Pass to left adjoints: let M be the left exact colimit-preserving functors from
  P(C) to Y, and M′ those from P≤n−1(C) to τ≤n−1 Y. Restriction from colimit-preserving functors P(C) → τ≤n−1
  Y with left exact restriction to M′ is an equivalence, by the universal property of τ≤n−1. Restriction along
  the Yoneda embedding is fully faithful on both sides by the free-cocompletion theorem, and both sides have
  the same essential image in Fun(C, τ≤n−1 Y), because left exactness of a colimit-preserving functor out of
  presheaves is detected on representables.
- **Geometric morphisms into sheaves** (HTT, Lemma 6.4.5.6, p. 673). If moreover C carries a Grothendieck
  topology, restriction is an equivalence from Fun_*(Y, Shv(C)) to Fun_*(τ≤n−1 Y, Shv≤n−1(C)). By the previous
  step it suffices that, if a geometric morphism f_* : Y → P(C) restricts on (n − 1)-truncated objects to a
  functor into Shv≤n−1(C), then f_* lands in Shv(C), that is, f^* inverts the morphisms that sheafification
  inverts. Shv(C) is a topological localization of P(C), so it suffices to treat the covering monomorphisms
  U → j(C). Their sources and targets are (n − 1)-truncated, because C is an n-category, and they are inverted
  by f^* by the hypothesis, using universality of colimits in P(C) and generation by representables.

*Needs:* §3.3.2 (HTT, Prop. 6.1.3.10), §4.3.1 (HTT, Prop. 6.1.5.2), §6.2.1 (HTT, Def. 6.2.1.4), §8.2.1 (HTT, Def.
6.2.2.6), §8.3.1 (HTT, Prop. 6.2.2.7), §19.4.1, §20.1.1; Part PresheavesAndCompletions §1.4.3 (HTT, Thm. 5.1.5.6), §1.4.5 (HTT, Cor. 5.1.5.8), §1.5.2 (HTT, Prop. 5.2.6.2); Part InfinityCategoryFoundations §10.7.1 (HTT, Def. 5.5.6.8, Ex. 5.5.6.13), §10.7.2 (HTT, Lemma 5.5.6.14), Part PresentableInfinityCategories §6.2.2 (HTT, Cor. 5.5.6.22); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14) and §10.1.2 (HTT, Def. 2.3.4.1); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, the Yoneda embedding).

### 20.3 m-localic n-topoi

**20.3.1.** Define, for 0 ≤ m ≤ n ≤ ∞, an n-topos X to be m-localic when, for every n-topos Y, the map Fun_*(Y,
X) → Fun_*(τ≤m−1 Y, τ≤m−1 X) given by restriction to (m − 1)-truncated objects is an equivalence of
∞-categories (HTT, Def. 6.4.5.8, p. 674).

- By §20.2, every m-topos is equivalent to τ≤m−1 X for an m-localic n-topos X, and X is determined up to
  equivalence. Truncation identifies the full subcategory of Top^R_n on the m-localic n-topoi with Top^R_m
  (HTT, discussion after Def. 6.4.5.8, p. 674). Truncation lands in m-topoi because τ≤m−1 X = τ≤m−1 Y when
  X = τ≤n−1 Y, by §19.4 (2) ⇒ (3) (HTT, Prop. 6.4.5.4, p. 672).
- Every n-topos is n-localic.

**Checks.**

- For m = 0 and n = 1, the variant using τ≤m in place of τ≤m−1 would make the nerve of the category of ℤ-sets
  0-localic, since it would compare that 1-topos with itself. The correct definition rejects it: its
  underlying locale is a point, while its points form the groupoid Bℤ of ℤ-torsors, which is not contractible.
- S is 0-localic. Fun_*(Y, S) is contractible for every ∞-topos Y (§10.5 (HTT, Prop. 6.3.4.1)), and so is
  Fun_*(τ≤−1 Y, τ≤−1 S): τ≤−1 S is the locale of opens of a point, which is final among locales.
- For the circle K = ∂Δ[2], the slice S/K ≃ Fun(K, S) is not 0-localic. Its points form an ∞-category
  equivalent to the Kan complex K, which is not contractible. Its (−1)-truncated objects are ∅ and K, so its
  underlying locale is that of a point, whose points over τ≤−1 S form a contractible space. So restriction to
  (−1)-truncated objects is not an equivalence on points. A definition using τ≤m in place of τ≤m−1 would
  compare with the 0-truncated objects, the sets with a ℤ-action, and would not detect this.

*Needs:* §10.5.1 (HTT, Prop. 6.3.4.1), §19.4.1, §20.1.1, §20.2.1; Part InfinityCategoryFoundations §10.7.1 (HTT, Def. 5.5.6.8).

### Examples

- For a locale U, Shv(U), the sheaves of spaces on U with the covering topology of §18.3, is a 0-localic
  ∞-topos with τ≤−1 Shv(U) ≃ N(U) (§20.2 with m = 0, n = ∞).
- For a small ordinary category C with finite limits and a topology, the sheaves of spaces on N(C) form the
  1-localic ∞-topos associated to the 1-topos of sheaves of sets on C (§20.2 with m = 1).
- At (m, n) = (0, 1), §20.2 says that every 1-topos has a localic reflection: for a locale U, geometric
  morphisms from a 1-topos Z to N(Shv≤0(U)) correspond to those from τ≤−1 Z to N(U), that is, to maps of
  locales from the subterminal objects of Z to U. This is the classical localic reflection of 1-topoi, on nerves.

### Dependencies

Earlier Parts and libraries: Parts InfinityCategoryFoundations, AdjunctionsAndLocalizations, PresheavesAndCompletions, PresentableInfinityCategories;
Tau Ceti `SSet.catInfty`. Earlier layers of this Part: Layers 3, 4, 6, 8,
10, 16, 18 and 19. Within the layer: 20.2 uses 20.1; 20.3 uses 20.1, 20.2.

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited: §6.1 (Prop. 6.1.0.1, Defs. 6.1.0.2, 6.1.0.4, Thm. 6.1.0.6,
  pp. 546–548; §6.1.1, pp. 548–553; §6.1.3, pp. 562–574; §6.1.4, pp. 574–578; §6.1.5, pp. 579–583; §6.1.6,
  pp. 584–588); §6.2 (§6.2.1, pp. 589–595; §6.2.2, pp. 595–604; §6.2.3, pp. 604–613; §6.2.4, pp. 613–618);
  §6.3 (Defs. 6.3.1.1, 6.3.1.5, 6.3.1.6, 6.3.1.10; Props. 6.3.2.1–6.3.2.3, 6.3.3.3, 6.3.4.1, 6.3.5.1; Lemmas
  6.3.3.2, 6.3.3.4); §6.4 (Defs. 6.4.1.1, 6.4.2.3, 6.4.3.1, 6.4.5.1, 6.4.5.8; Thms. 6.4.1.5, 6.4.2.1, 6.4.4.5;
  Props. 6.4.1.6, 6.4.2.5, 6.4.3.4, 6.4.3.6, 6.4.4.6, 6.4.4.7, 6.4.4.9, 6.4.5.4, 6.4.5.7; Lemmas 6.4.3.5,
  6.4.4.4, 6.4.4.8, 6.4.5.5, 6.4.5.6; Notation 6.4.4.2; Remark 6.4.2.2); §6.5.1 (Lemma 6.5.1.2; Remarks
  6.5.1.3–6.5.1.5, 6.5.1.15; Props. 6.5.1.7, 6.5.1.12, 6.5.1.16, 6.5.1.18–6.5.1.20; Defs. 6.5.1.10, 6.5.1.11;
  Cors. 6.5.1.13, 6.5.1.14, 6.5.1.17; Lemma 6.5.1.9) and Remark 6.5.4.7; §5.2.8 (Ex. 5.2.8.16, p. 391); §7.2.1
  (Lemma 7.2.1.13, Prop. 7.2.1.14, Cor. 7.2.1.15, pp. 740–741); §7.2.2 (Def. 7.2.2.1, Ex. 7.2.2.2,
  Rem. 7.2.2.3, Cors. 7.2.2.5, 7.2.2.6, Def. 7.2.2.7, Lemmas 7.2.2.8–7.2.2.11, Prop. 7.2.2.12, Rem. 7.2.2.13,
  pp. 742–747); §7.3.4 (Ex. 7.3.4.7, p. 788); and the results of chapters 1–5 and the appendix named in the
  supplier contracts.
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Def. 1.3.1.1, p. 116 (valued
  sheaves on a site, §8.2); Def. 1.5.4.1, p. 165 (the underlying locale of an ∞-topos, §18.4).
- **Kerodon.** Jacob Lurie, *Kerodon*, an online resource for homotopy-coherent mathematics,
  [kerodon.net](https://kerodon.net). Cited for the homotopy theory of Kan complexes that ModelCategoryTheory,
  Part KanQuillen supplies (Thm. 3.2.6.1, Thm. 3.2.7.1, Cor. 3.5.2.7, Def. 3.5.7.20; Layers 12 and 14), and for
  adjunctions (Def. 6.2.1.1) through Part AdjunctionsAndLocalizations §1.1.
- **SGA 4.** M. Artin, A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas*,
  Lecture Notes in Mathematics 269, Springer, 1972; exposé IV, 1.2 (the classical Giraud theorem, cited in Scope).
